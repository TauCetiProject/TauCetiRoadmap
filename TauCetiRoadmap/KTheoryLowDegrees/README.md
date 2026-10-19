# Roadmap: grothendieck groups, cartan maps and euler forms, part II: explicit ring and curve K₀ and stable-matrix K₁

**Summary.** Build the concrete algebra behind K₀ and K₁: projective modules and idempotents, locally constant rank, exterior operations and determinant, stable elementary matrices, relative groups and their connecting maps. Compute these invariants over division rings, Dedekind domains, rings of S-integers and regular curves. The final comparisons identify the concrete classes with the first two groups of algebraic K-theory and construct the graded determinant of perfect complexes, including perfect complexes with Witt-vector support.

## Scope and ownership

This is Part II of GrothendieckEulerForms. It owns the ring-specific and low-degree computations and their explicit normalizations. Its principal outputs are the rank–determinant classification over Dedekind domains and regular curves, the special λ-ring structure of projective K₀, finite-matrix and projective-automorphism formulas for K₁, the arithmetic congruence defects, and the comparison of these constructions with K-spaces and graded determinant spectra. Finite-rank statements retain their rank restrictions throughout.

Categorical Grothendieck groups, exact structures, Cartan maps and Euler characteristics belong to GrothendieckEulerForms Layers 0–5 and its implemented Tau Ceti library. GeneralAlgebraicKTheory Layers 3–8 own scalar extension, stable GL and its Whitehead quotient, projective patching, the augmented ideal ring, higher relative K-spectra, localization and coherent additivity. This roadmap uses those constructions and adds finite-matrix computations, module-side translations and specified low-degree boundary comparisons. Layer 13 builds the stable Steinberg presentation and its central K₂ kernel needed for those comparisons. GeneralizedCohomology G2 owns based path-fibre carriers and concrete spectra; StableHomotopyKTheory Layers 2–5 own their homotopy-pullback calculus, plus constructions, monoidal group completion and spectral comparisons. EnhancedDerivedSheaves E0, E2 and E5 own stable enhanced categories, coherent diagrams, mapping spaces and space-valued sheafification. SchemeKTheoryOperations Layers 1–4 own perfect-complex K-theory, support localization and Witt-supported regular-perfection comparison. The precise contracts below distinguish these inputs from the concrete comparisons built here.

AlgebraicVectorBundles L0B–L0C owns finite locally free sheaves, their affine dictionary, tensor and dual, exterior powers and the componentwise determinant object. SchemeAndStackFoundations §5.7 owns the exact-category definitions of vector-bundle K₀ and coherent G₀, their ring/module structures, pullback, rank, determinant, Cartan comparison, coherent localization and proper pushforward. Its §3.3 owns degree defined by Euler characteristic. JacobianChallenge Layer A and Tau Ceti own invertible sheaves, line-bundle classes and the divisor–Picard comparison. We use those objects to classify curve classes; we do not rebuild them. The elliptic-curve Picard decomposition is outside this roadmap.

ReductiveGroups Layers 0–1 supply affine group schemes and their representation–comodule dictionary. RepresentationTheory/ClassicalGroups Layers 3–4 supply the complex highest-weight theory; the integral and arbitrary-characteristic representation Grothendieck-group comparison needed here is a separate theorem, with the exact underlying-module exact structure. OrthogonalSpinGroups Layer 2 and the pinned Spin modules below supply the compact real Spin covering and rotation path. We use them to detect one nontrivial SK₁ class, without undertaking a general computation of topological K-theory. ClassFieldTheory Layers 7, 11–14, GlobalNumberFields Layers 1–2 and 6–7, Chebotarev Layers 9–10, and the pinned number-theory library supply reciprocity, prime distribution, valuations, ideal classes and Dirichlet's unit theorem. Their arithmetic applications here retain the explicit congruence-level information.

## Conventions

Rings have a unit and ring maps preserve it. The zero ring is allowed unless a domain, division ring, connected spectrum or positive-rank hypothesis excludes it. A Dedekind domain includes a field. All categories and their chosen small models live in fixed universes; comparisons respect a change of small model.

Write `Proj(R)` for Tau Ceti's full subcategory `(finiteProjectiveModules R).FullSubcategory`, using left R-modules. Write `RingK0 R` for its existing `SplitK0`. A finite free left module is written in row coordinates when an arbitrary-ring matrix acts: v ↦ vg. An idempotent matrix therefore acts on the right. Classical matrix K₁ uses right projectives and column coordinates. For a left-projective automorphism over a noncommutative ring the corresponding group is K₁(Rᵒᵖ). For space-level comparisons distinguish K^ℓ(R)=K(Proj(R)) and K^r(R)=K(Proj(Rᵒᵖ)); the latter is K-theory of right R-projectives and is the K(R) in matrix/plus statements. Its component group is K₀^r(R)=RingK0(Rᵒᵖ). Over a commutative ring identify left and right modules by the same scalar action, so both agree with RingK0(R), without using module duality. The left-projective component comparison always targets K^ℓ(R), also for noncommutative R. The analogous right-projective statements are obtained by specialization at Rᵒᵖ.

K₀ is additive and K₁ is multiplicative. Thus a product of K₁ classes corresponds to a sum under any connecting map into K₀. `Pic(R)` means `CommRing.Pic R`, multiplicatively under tensor; its additive form is used in additive equivalences. Set H(R) = LocallyConstant(Spec R, ℤ), with pointwise ring operations. Rank is always a function in H(R), until a nonempty connected spectrum makes it a single integer. “Reduced K₀” means the kernel of this full rank function. SK₀ means the simultaneous kernel of rank and determinant.

Matrix stabilization in GL is g ↦ diag(g,1), whereas idempotent stabilization is e ↦ diag(e,0). These are different directed systems. Write [g,h] = ghg⁻¹h⁻¹. The elementary generator eᵢⱼ(a) is 1+aEᵢⱼ, i ≠ j. A relative elementary subgroup is a normal closure in the specified elementary group; the separate rank-two Serre subgroup uses normal closure in SL₂.

For a Milnor square B = S ×_C T with S → C surjective, the patching isomorphism is γ:C ⊗_T Q ≃ C ⊗_S P. The patched pairs satisfy 1⊗p = γ(1⊗q). In the free row convention a matrix a gives φ(p)=ψ(q)a. Its left-projective boundary is [patched(a)]−[Bⁿ]. The right-projective version uses P⊗_S C and Q⊗_T C and free column equation φ(p)=aψ(q). Denote it by patched^r(a) and its positive boundary by δ^r. Transposing a into GL(Rᵒᵖ) translates the row equation into this column equation: δ^ℓ_R([a])=δ^r_{Rᵒᵖ}([aᵀ]). Transposition is an antihomomorphism on matrices and a homomorphism on their abelian K₁ quotients. All mixed relative homotopy diagrams use the right-projective variant, and the left-projective diagram is their specialization at Rᵒᵖ with this translation. Relative K₀ uses the augmented double D = R⊕I with parent projection pr(r,x)=r and second map add(r,x)=r+x.

Homotopy fibres consist of a point x and a path f(x) → base. All comparisons specify the based square, its homotopy, and the induced path direction. With the degree-two normalization in Layer 13, the lifted Steinberg-word boundary uses an inverse. For localization at a DVR, the boundary of a uniformizer is the positive residue-field class. These normalizations concern different connecting maps and are tested separately.

“Pre-λ-ring” requires the sum formula, λ⁰=1 and λ¹=id. “Special λ-ring” additionally requires the universal product and composition identities and the line-element identity for 1. Operations ψᵏ have k ≥ 1; ψ⁰ denotes the augmentation section when one is specified. Locally constant exponents of a line mean clopen gluing, including negative exponents. Complexes are cohomological, so P in degree −1 contributes −[P].

For arithmetic statements F is a number field, S a finite set of finite primes, A=O_{F,S}, and all archimedean places are understood to belong to the arithmetic set of places. Congruence inverse limits use nonzero ideals only. The exceptional finite congruence kernel occurs when S is empty and F is totally imaginary.

## Exact supplier contracts

### From the pinned Mathlib and Tau Ceti libraries

The library pins are Mathlib 6b7abb3 and Tau Ceti a91d3aa. `TauCeti.finiteProjectiveModules`, its essential smallness and its exact structure are in `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`. `finiteProjectiveModulesExactStructure_eq_split` identifies that exact structure with the split one. In `TauCeti.CategoryTheory.GrothendieckGroup.Split`, `TauCeti.SplitK0.of`, `of_congr`, `of_eq_zero_of_isZero`, `of_biprod`, `exists_eq_sub`, `hom_ext`, `liftEquiv`, `map` and `mapEquiv` provide classes, zero and sum formulas, their universal property and functoriality. `ExactK0.fromSplitEquiv` in `TauCeti.CategoryTheory.GrothendieckGroup.Exact` supplies the exact/split comparison when every conflation splits. `TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic` supplies multiplication once a tensor category and its distributivity have been supplied. No fresh group-completion or tensor-product presentation is needed.

`TauCeti.SplitK0.finrankEquiv` and `TauCeti.AbelianK0.finrankEquiv` in `TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace` compute the groups of `FGModuleCat D` for a division ring D, under the stated smallness assumption. They send a vector-space class to its finrank. The ring-specific comparison with `Proj(D)` transports this result. `moduleEulerClassOf_eq`, `moduleResolutionEquiv_symm_of`, `fromFiniteProjectiveResolution_of` and `cartanMap_apply` in `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic` fix the Euler and Cartan normalization.

Mathlib `Module.Finite.exists_comp_eq_id_of_projective` supplies a finite-free retraction of any finite projective module, over a semiring. `Module.Projective.of_split` supplies the converse projectivity implication; finite generation follows because the retraction is surjective. `LinearMap.isProj_iff_isIdempotentElem` and `Submodule.isIdempotentElemEquiv` supply the endomorphism-level projection dictionary. The new presentation data in Layer 1 add the noncommutative row-matrix convention and stable matrix equivalence, rather than a second summand criterion. For commutative local rings the finite-projective freeness input is Mathlib `Module.free_of_flat_of_isLocalRing`; the arbitrary associative local-ring statement in Layer 2 extends its scope.

Mathlib `Module.rankAtStalk` is the natural-number rank on the prime spectrum. In `RingTheory.Spectrum.Prime.FreeLocus`, `Module.isLocallyConstant_rankAtStalk` assumes finite presentation and flatness; finite projectives satisfy both. `rankAtStalk_eq_of_equiv`, `rankAtStalk_prod`, `rankAtStalk_baseChange` and the tensor-rank API provide the object-level calculations. The clopen–idempotent correspondence and finite-image property on a quasi-compact spectrum supply the rank section. A separate theorem about local constancy of projective rank is not needed.

Use native tensor products, exterior powers `⋀[R]^n M`, `ModuleCat.exteriorPower.functor`, their universal maps, and the affine comparisons from AlgebraicVectorBundles. Tau Ceti `TauCeti.LinearAlgebra.ExteriorPower.Basic` supplies `map_top_eq_det_smul`, `map_finrank_eq_det_smul` and `topEquiv` for finite free modules. All finite-projective exterior-power and determinant-object statements are obtained through the existing finite locally free affine dictionary; this roadmap adds their operations on K₀ and their characteristic identities. Tau Ceti `TauCeti.exteriorPower.equivBaseChange` in `TauCeti.LinearAlgebra.ExteriorPower.BaseChange` supplies arbitrary-module base change, with no flatness assumption, its pure-wedge formula and map naturality.

`CommRing.Pic.AsModule` represents a Picard class by an invertible module, and `CommRing.Pic.mk` takes an invertible module's class. `ClassGroup.equivPic R` identifies ideal classes with Picard classes for a domain. Ideal extension, Mathlib `Ideal.relNorm` and `ClassGroup.relNorm` from `TauCeti.RingTheory.ClassGroup.RelNorm` are the existing norm notions; the determinant calculation below identifies them rather than defining competitors.

Mathlib `ModuleCat.matrixEquivalence R i`, for a nonempty finite matrix index and a chosen i, supplies the module-category equivalence with the matrix ring; `IsMoritaEquivalent.matrix` packages it. `TauCeti.Algebra.Category.ModuleCat.Equivalence` supplies `CategoryTheory.Equivalence.submoduleOrderIso`, `finite_functor_obj_iff` and `projective_functor_obj_iff` for arbitrary module-category equivalences, with independent ring and module universes and the stated smallness hypotheses. The order isomorphism preserves bottom, top and arbitrary joins. `TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita` supplies `CategoryTheory.Equivalence.finiteProjectiveModulesEquivalence`, its additive and conflation-exact structures, `finiteProjectiveModulesK0Equiv`, `finiteProjectiveModulesK0Equiv_of`, its inverse class formula and `cartanMap_comp_finiteProjectiveModulesK0Equiv`. Transport through `ExactK0.fromSplitEquiv` gives the split form used here. The ring-isomorphism specialization, its identity and composition formulas are in `TauCeti.Algebra.Category.ModuleCat.CartanMap.RingEquiv`. These are the general submodule, projective-restriction and Morita maps consumed here. GeneralAlgebraicKTheory §10.6 supplies their higher K-equivalences; §1.3 below fixes the simple/free coordinate formulas, and Layer 7 fixes the corresponding finite-matrix representative formula.

Use native `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.transvection`, `Matrix.TransvectionStruct`, determinant, quotient rings, quaternion norm, and group abelianization. The matrix transvection multiplication, determinant and scalar-centralizer lemmas already exist in their stated commutative-ring generality. GeneralAlgebraicKTheory §3.3 supplies the associative-ring elementary addition, inverse and three-distinct-index commutator identities; the finite-rank opposite-root identities and centralizer refinements below retain coefficient order. Elementary generation of SL over fields and over ℤ is consumed from the existing matrix-group library. Arbitrary-division-ring Dieudonné determinant remains a new construction here.

For S-integers use `Set.integer` and `Set.unit`, `Set.unitValuation`, `unitValuation_ker`, `unitEmptyEquivUnits` and `unit_fg` from `TauCeti.RingTheory.DedekindDomain.SInteger.Basic` and `.Unit`. These give finite generation and the ordinary-unit kernel, not the S-unit rank formula. The valuation is multiplicative with exponent sign opposite the usual additive order: a uniformizer has exponent −1. S-integer localization and class-group maps come from the same directory's `.ClassGroup` module. `TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two` in `TauCeti.NumberTheory.Multiquadratic.MinusFive.ClassNumber` supplies the class-number-two value used as an explicit arithmetic hypothesis in §5.3, with its actual ring-of-integers comparison.

The Spin inputs are `CliffordAlgebra.spinRotation` from `TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Rotation`, `continuous_spinRotation`, `spinRotationPath` and its endpoint formulas from `TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Rotation`, and the compact real projection `realCliffordSpinDoubleCoverZero` from `TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.Basic`. `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` in `TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Covering` assumes n ≠ 0 and compactness of the Spin carrier; the compactness theorem and finite-dimensional topology must be installed before using it. Covering-space path/homotopy lifting detects a nonclosed lift. No assumption of simple connectivity of Spin(n) is needed.

OperatorTheory/PolarDecomposition PD-B21 supplies finite-dimensional unitary polar factorization. Layer 8 adds a continuous deformation on SL_N(ℝ), fixing SO_N, with an explicit normalized QR formula; an existence theorem for a polar factor alone does not supply that deformation.

### From geometric and categorical roadmaps

AlgebraicVectorBundles L0B supplies `FiniteLocallyFreeSheaf X`, its exact affine comparison with finite projectives, finite sums, tensor/dual, rank and arbitrary pullback. L0C supplies exterior powers, their sum decomposition, rank and base-change identities, the determinant object at locally constant rank, and the determinant functor on the core. Its determinant on a fixed-rank category is not a functor on arbitrary module maps. The ordered direct-sum isomorphism and its block-swap sign are the input to the graded symmetric enhancement.

SchemeAndStackFoundations §5.7 supplies `Chow.finiteLocallyFreeExact`, `Chow.finitelyPresentedExact`, `Chow.K0`, `Chow.G0`, `Chow.K0.pullback`, `rank`, `det`, `toG0`, `Chow.HasResolutionProperty`, and `K0.toG0_bijective` for a noetherian regular scheme with that property. It also supplies `G0.localization_sequence` for a closed/open pair and `Chow.kPushforward` for proper morphisms with noetherian target, defined by coherent higher direct images. Section 3.3 supplies `vectorBundleDegree` and its determinant and divisor laws. For arbitrary quasi-compact quasi-separated schemes this vector-bundle K₀ is not assumed equal to perfect-complex K₀.

JacobianChallenge Layer A supplies `LineBundleClass X`, its tensor group, dual and pullback isomorphisms. Tau Ceti's `SchemeWeilDivisor.classGroupAddEquivLineBundleClass` in `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Picard` applies to noetherian integral schemes of dimension at most one with DVR local rings at codimension one. Its divisor-sheaf normalization identifies O(y) with the inverse of the point ideal. The already-owned affine line-bundle comparison identifies `LineBundleClass (Spec R)` with `CommRing.Pic R`.

GeneralAlgebraicKTheory §§3.1–3.2 supply coherent scalar extension on finite projectives over arbitrary associative rings, with no flatness assumption, and the induced `RingK0.map`. Its finite-product and opposite-ring comparisons are used with their actual module sides: duality to the opposite ring inverts the Picard coordinate over a Dedekind domain, and is not the commutative left/right identification of the conventions. Sections 3.3–3.4 supply `StableGL`, `stableElementary`, perfection, normality, the stable commutator theorem and `classicalK1`. Write `RingK1 R` for the multiplicative form of that supplied group. Finite matrices stabilize by identity padding; contiguous finite block sum descends to its K₁ classes, whereas it is not independent of representatives as a stable matrix. Sections 3.12–3.14 supply the based zero-component plus/Q and absolute K₀/K₁ comparisons under the projective nerve; the right-projective version is the application to the opposite module category, with the transpose translation fixed in the conventions. Section 1.5 supplies coherent based plus maps, including identity and composition homotopies. No choice of a product decomposition of all components is used.

GeneralAlgebraicKTheory §§8.4–8.6 supply `MilnorPatch`, its finite-projectivity and reconstruction equivalences, the positive right-column clutching boundary, and the six-term Mayer–Vietoris sequence for a pullback with one surjective map. Sections 8.7–8.9 supply relative triples, their component comparison, the augmented ring A⋉I with projections pr and add, the kernel model for relative K₀ and its degree-zero excision. These objects are denoted `PatchedProjective`, `freePatch`, `milnorBoundary`, `IdealDouble` and `RelativeK0` when specifying the module-side and sign comparisons here; those names do not designate new presentations. Section 7.7 supplies restriction-of-scalars transfer and its projection formula, including the finite-projective case. Its general additivity, finite-resolution and dévissage equivalences, filtered continuity and multiplicative-set localization are used on the same projective classes.

GeneralizedCohomology G2.10 supplies the based path-fibre carriers, with paths from image to base, their projections and homotopy-square transport. StableHomotopyKTheory §§2.4–2.10 supply connecting maps, fibre exactness, homotopy pullbacks and pasting with specified square homotopies; §§3.29–3.30 identify the plus fibre's fundamental group with the universal central extension and make this identification natural. GeneralizedCohomology G2.3–G2.8 supplies concrete spectra, their connective and truncated comparisons and the group-completion adjunction. StableHomotopyKTheory §§4.25–4.26 identifies the coherent Γ-model of a symmetric monoidal groupoid and its grouplike Picard specialization, retaining scalar automorphisms and self-braiding. The Steinberg presentation and its universal-central-extension comparison are targets of §13.2 below; their quotient-presentation and signed path-square calculations use these homotopy interfaces. GeneralAlgebraicKTheory §8.1 supplies the relative K-spectrum and its connecting maps; §§8.7–8.9 give the abstract low-degree adapters. Layer 13 determines their concrete matrix representatives, paths and signs, without asserting higher excision.

EnhancedDerivedSheaves E0.1–E0.5 supply mapping spaces, coherent functor categories, finite limits and stable categories; E3 supplies accessible localizations with their mapping-space adjunction; E2's `spaceSheaves` and `spacePostnikovTower` supply sheafification and truncation on a fixed small site. Its E5:presentability supplies Sp. Together with GeneralizedCohomology G2.7–G2.8 and StableHomotopyKTheory §§4.25–4.26, these give the enriched presheaf and sheaf interfaces for connective spectra and Picard groupoids. In particular the localization adjunction and the universal property of truncation identify maps into a 1-truncated sheaf with maps from sheafified first truncation. These are equivalences of mapping spaces, preserving the E∞ group laws; an inverse to a specified equivalence is a contractible choice. This is a statement about natural transformations with comparison homotopy, not about the absence of automorphisms of a line.

SchemeKTheoryOperations §1.6 supplies the resolution property from an ample family, and for quasi-compact regular schemes with affine diagonal. Its Layers 1–3 supply Perf(X), K(Perf X), the affine comparison under the projective nerve, support localization and Zariski descent. Section 3.8 supplies `WittSupport.Perf`, `K`, `pullback`, `affine` and the natural restriction-of-scalars map `WittSupport.alpha : K(X)→K(W(X) on X)`. The Witt space is a p-adic formal thickening, glued through its affine enhanced categories. The support condition is acyclicity after p inversion; W(R) itself is usually excluded. The same section supplies supported closed-fibre excision, completion and continuity, regular-pair dévissage compatible with α, and the equivalence for R=R₀^perf when R₀ is a regular noetherian F_p-algebra. No finite-dimensional bound on R₀, or noetherianness of R or W(R), is imposed. Its regular-perfection proof first treats smooth lifts, then uses Popescu and supported continuity; infinite Witt vectors are not assumed to commute with filtered colimits. Section 4.10 supplies effective v-descent of perfect complexes, restricting to line bundles, and §4.11 supplies the equivalence induced by α after v-sheafification of first truncation. Layer 14 adds the graded enhancement of descent and extends the determinant using that specified equivalence.

**Checks on the Witt inputs.**

- For a perfect field k, α(k) is [W(k) —p→ W(k)] in degrees −1,0 and has positive supported length one.
- W(k) has nonzero p-inversion, so it is outside support; using ordinary K-theory would lose the length class.
- W(k)/pⁿ has supported class n[k], although its ordinary Euler class over W(k) is zero.
- The completion equivalence applies to perfect complexes killed by a power of p. It does not compare all perfect complexes on the uncompleted Frobenius colimit and its Witt completion.
- The regular-noetherian case uses smooth approximation and supported continuity. Vanishing of affine coherent cohomology does not supply smooth lifts for an arbitrary regular algebra.

### From arithmetic and representation roadmaps

ReductiveGroups Layers 0–1 supply native commutative Hopf coordinate algebras, comodules, corestriction, base change and the group-scheme representation dictionary. The exact structures in Layer 4 test the underlying module sequence, not projectivity in the comodule category. Its diagonalizable-group dictionary identifies comodules over R[X] with X-graded modules. The complex character theorems of RepresentationTheory/ClassicalGroups do not by themselves prove the arbitrary-field or integral theorem used below.

ClassFieldTheory Layers 7 and 11–14's reciprocity/existence and ray-class interfaces, together with Chebotarev Layers 9–10 and GlobalNumberFields Layers 1–2 and 6–7's approximation, supply primes in prescribed ray/idele classes. The input includes sign conditions at real places and open finite-index local multiplicative conditions. The degree-m Artin comparison and wild higher-unit calculations beyond these interfaces are targets in §11.1, on the existing reciprocity and local-symbol objects. Serre's corrected extension normalization and the special two-prime consequences are stated in Layer 11.

Native profinite groups, inverse limits and completions supply the carriers and compactness results. Layer 11 owns the arithmetic/congruence topology comparison, its cofinality and finite inverse-limit argument. It also owns the relative SL₂ metaplectic extension and its classification by the exceptional root-of-unity group under positive S-unit rank, with realization and normalization stated in §11.5. ProfiniteArithmetic §2 concerns continuous automorphisms and outer actions; its congruence topology is not this metaplectic classification.

## How to read the build

Layers 1–5 develop projective K₀, its operations and its Dedekind classification. Layers 6–9 develop stable matrices, K₁ and relative groups. Layers 10–11 isolate the finite-rank Mennicke extension argument and its arithmetic consequences. Layer 12 classifies regular-curve classes using the geometric contracts. Layer 13 compares the concrete groups and both boundaries with based K-space models. Layer 14 constructs the graded determinant and its Witt-supported extension. Each layer ends with computations that fix its normalization and the inputs needed for it.

## Layer 1: projective classes and patching

### 1.1 Finite projective presentations

For a left R-module P, bundle a supplied finite-free retraction as `FreeSummandData P`: n, a linear inclusion ι:P→Rⁿ and retraction π:Rⁿ→P with πι=id. The new interface records its row matrix, rather than another summand-existence theorem. In row coordinates ιπ is right multiplication by an idempotent e. Prove `rowIdempotentPresentation_equiv` between this matrix presentation and the supplied endomorphism projection, `imageIdempotent_equiv` with the presented module, the complementary matrix formula P(1−e), and invariance under change of presentation. These statements fix the side of the noncommutative matrix action (Weibel I.2.1–2.3, pp. 7–12).

The API for `IdempotentPresentation` includes its size, matrix, image inclusion and projection, a linear equivalence to the presented module, `zero`, `one`, `blockSum`, `zeroPad` and `conjugate`. Conjugation e ↦ g⁻¹eg corresponds to v ↦ vg on images. Establish that stable conjugacy of idempotents is exactly isomorphism of their images, after allowing zero padding and the finite-free Karoubi envelope. Call the resulting commutative monoid `StableIdempotent R`; its class map, zero, block sum, equality criterion and projective-class equivalence identify it with the monoid of isomorphism classes of finite projectives. For commutative R matrix trace descends to an additive map to R. Do not identify ordinary conjugacy at the original size with module isomorphism (Weibel I.2.3 and Ex. I.2.2, pp. 10–12).

**Checks.**

- A size-zero idempotent and the zero matrix present the zero module; the identity of size n presents Rⁿ.
- Over a field diag(1,0) presents a one-dimensional module; zero padding it does not increase this rank.
- Over a noncommutative ring v ↦ ev is not the chosen left-linear row action. The equation (rv)e=r(ve) fixes the side.
- Over R×R, multiplication by (1,0) has a nonconstant rank function. It is a projective summand even though no single global free rank describes it.
- For e=[[1,1],[0,0]] over ℚ, P(e) is the diagonal {(a,a)}. Column multiplication instead gives {(a,0)}, a different image.
- FreeSummandData with both maps identity gives idempotent 1 and zero complement; data for the zero module gives idempotent 0 and full complement. Reconstructing from e recovers e.
- The two presentations of ℚ in ℚ and in the first coordinate of ℚ² give 1 and diag(1,0). Their stable classes agree; diag(1,0) and diag(0,1) also agree by the swap.
- Over a field StableIdempotent is ℕ by rank. Every zero matrix gives zero; over ℤ×ℤ trace separates 0,(1,0),(0,1),1.

### 1.2 Ring K₀ and stable equality

Use the categorical `RingK0` specialization from the conventions. Write `FiniteProjectives R` for the existing projective full subcategory, `freeProjective R n` for its finite-free object (including n=0), and `projectiveClass P` for its class. Their isomorphism, zero and sum laws, induction by differences and uniqueness of maps are the supplied categorical APIs in the exact supplier contracts. The rank-zero free specialization is the milestone `projectiveClass_free_zero`. The exact-category version agrees because its conflations split (Weibel II.2, p. 68).

Strengthen the difference normal form to `exists_projective_sub_free`: every x is [P]−n[R]. Prove `projectiveClass_eq_iff_stableFreeSum`: [P]=[Q] if and only if P⊕Rⁿ≃Q⊕Rⁿ for some n. The proof first uses a common projective stabilizer from group completion, then adds its finite free complement. The map `freeClass : ℤ→K₀(R)`, m↦m[R], is injective exactly when R has invariant basis number. If it is injective, it is an isomorphism exactly when every finite projective is stably free. These are statements about the displayed map; an arbitrary abstract isomorphism with ℤ is insufficient (Weibel II.2, Lemma 2.1, p. 68).

**Checks.**

- The zero ring has K₀=0 and freeClass kills 1. Nontriviality cannot be omitted from a claim that ℤ embeds.
- Over a field [k²]=2[k]; over ℤ, [ℤ]≠0. Allowing all projectives would instead make it zero through ℤ⊕ℤ^(ℕ)≃ℤ^(ℕ), so finite generation is essential.
- Equality [P]=[Rⁿ] asserts stable freeness, not freeness. A free summand cancellation theorem requires additional hypotheses.
- For M_d(D), d≥1, the simple column module Dᵈ has K₀-coordinate 1 and [M_d(D)] has coordinate d. The free-class subgroup has index d.
- The matrix-ring computation excludes d=0, whose ring is zero.

### 1.3 Change of ring and Morita normalization

For a unital map f:R→S with S finite projective as a left R-module, identify the supplied transfer on a finite projective class with literal restriction of scalars. The target `projectiveTransfer_class` is the no-resolution specialization of the general transfer, retaining its tower and identity comparisons. For commutative rings, specialize the projection formula to f_*f^*(x)=[S]x and compare it with the rank–Picard coordinates of Layer 5. Balanced tensor products in these formulas use their actual bimodule structures (Weibel II.2.8, pp. 75–76).

Construct `matrixRingK0Equiv` by the column-module Morita equivalence for d≥1, with its two normalization formulas above. Combined with the supplied finite-product equivalence, this computes a semisimple ring given as a finite product of matrix rings over division rings: the coordinates are multiplicities of the simple modules, not free ranks. Component inclusions in K₀ are additive maps induced by supported modules, not unital ring homomorphisms from a factor into the product (Weibel II.2.1.2–2.1.4, p. 69).

Normalize the supplied module-category Morita equivalence on the simple column module and the free matrix-ring module. The split-to-exact comparison used for these coordinates commutes on every projective class. The new content is this matrix normalization, with the general lattice transport and finite-projective restriction consumed through the exact supplier contracts (Weibel II.2.1.2, p. 69).

**Checks.**

- Scalar extension ℤ→ℤ/2 sends [ℤ] to [ℤ/2] despite failure of flatness.
- For k→k×k, extension takes n to (n,n), restriction takes (a,b) to a+b, and their composite is multiplication by 2.
- For k→k×k→k by the first projection, functoriality gives the identity on K₀(k).
- For M₂(k), the free module is twice the simple generator; a Morita map sending it to 1 has the wrong normalization.
- The first projection k×k→k takes the two factor classes to 1 and 0; its transfer sends 1 to the first factor. The second factor witnesses failure of injectivity.
- Balanced extension along ℤ×ℤ→ℤ sends the regular module to ℤ, whereas tensoring only over ℤ would give ℤ². Extension of ℤ/4 along ℤ→ℤ/2 gives ℤ/2; the tower ℤ→ℚ→ℝ sends r⊗(q⊗m) to rq⊗m.
- Transfer ℤ[i]→ℤ sends the regular class to 2; transfer along R→M_d(R) sends the regular class to d²[R]. Neither is the inverse of scalar extension.
- The identity module equivalence fixes every submodule; zero and proper submodules remain zero and proper. The image of k under matrix Morita equivalence is the nonfree M₂(k)-module k²: freeness would require 2=4n.

### 1.4 Row patching and opposite-ring normalization

For B=S×_C T with S→C surjective, prove `milnorPatch_opposite_transpose`: the supplied right-projective patching over Bᵒᵖ, translated to left B-modules, is the left-row patch with equation φ(p)=ψ(q)a when its column transition is aᵀ. This is a module-side comparison of the existing patching construction. On free rows, transpose identifies (ψ(q)a)ᵀ with aᵀψ(q)ᵀ in the opposite ring; on projective summands use the same finite-free retractions and their naturality. Its API includes the two endpoint base-change maps, sums, identity padding and change of endpoint trivializations (Weibel I.2.7, pp. 13–14; II.2.9–2.10, pp. 76–77, with the explicit opposite-ring translation).

Prove `milnorBoundary_opposite_transpose`: δ^ℓ_R([a])=δ^r_{Rᵒᵖ}([aᵀ]), where both boundaries are the positive patch class minus the free class. Transposition reverses multiplication before passing to abelian K₁, so no inverse appears in this formula. The companion comparison with a relative triple uses [P]−[Q] and the supplied transition from the second endpoint to the first. Thus all terms and both difference maps of the supplied Mayer–Vietoris sequence use the same convention. The comparison is natural in Milnor squares, including a change of which surjective endpoint is used in the construction (Weibel II.2.9–2.10 and Exercise II.2.17, pp. 77, 81).

**Checks.**

- The identity transition gives boundary zero, including size zero.
- If a lifts to GL_n(S) or GL_n(T), its patch is free and its boundary vanishes.
- For B=ℤ×_{𝔽₅}ℤ, the unit 2 gives a nonzero boundary of order two: the endpoint units have residue classes ±1, and 2 represents the nontrivial quotient of 𝔽₅ˣ by them.
- The final map is a difference: the two restrictions of [B] cancel. A sum would give 2[C].
- In the integral pullback the identity patch contains (1,1) but not (1,0); gluing by 2 contains (2,1) but not (1,1). Identity charts give the diagonal module, and zero charts give zero.
- Over ℍ, for q=(i,0) and a=e₁₂(j), the row product is (i,k). The opposite-ring column formula gives the same second entry; using ordinary multiplication after transpose instead gives ji=−k.

### Examples

The matrix idempotent diag(1,0) and the Milnor patch of a unit test different stabilization conventions. The former uses zero padding; the latter uses identity padding. For ℤ×_{𝔽₅}ℤ, 2²=−1 in 𝔽₅ˣ makes twice the patched rank-zero class vanish, while the residue unit 2 is not induced by a unit in either copy of ℤ.

### Dependencies

Finite projective modules and their summand criterion; GrothendieckEulerForms' split/exact groups and additive functor maps; native matrix and balanced tensor APIs. The K₁ factorization of the patching boundary uses Layers 6–7; its stable-GL construction already exists before that factorization.

## Layer 2: locally constant rank and its kernel

### 2.1 The rank map and clopen section

Extend the existing projective stalk rank to `rank : RingK0 R→+* H(R)` for commutative R. Its defining formula is rank([P])(p)=rank_{R_p}(P_p). Prove naturality by precomposition with Spec(f), sum and tensor formulas, and agreement with fraction-field dimension for domains. Define `rankSection : H(R)→+* RingK0 R` using the finitely many clopen fibres of f: for U_n=f⁻¹(n), let e_n be the idempotent with D(e_n)=U_n, and set rankSection(f)=Σ_n n[Re_n]. Prove independence of enumeration, the fibre formula, preservation of 1 and multiplication, and rank∘rankSection=id. The idempotents are attached to fibres of f; individual connected components of an arbitrary spectrum need not be open (Weibel II.2, pp. 71–72).

Define `ReducedK0 R` as ker rank, with inclusion and the additive equivalence K₀(R)≃H(R)⊕ReducedK0(R). Its API includes the explicit inverse (f,x)↦rankSection(f)+x, kernel membership on differences, base change, and `reducedK0_eq_localizationKernel`: a class has rank zero exactly when its image in K₀(R_p) vanishes for every prime p. Here local K₀ is computed in §2.2; the intersection of kernels may be nonzero (Weibel II.2, Definition 2.3, p. 71).

At object level define `clopenModule U=Re_U`, `componentwiseFree f` for locally constant natural-valued f by clopen gluing, and `rankFibres P` as the finite set of values of the existing stalk rank. Their APIs give restriction, zero/constant values, base change, the orthogonal fibre idempotents and the direct-sum decomposition of P into its rank pieces. Rank fibres are not connected components. Connectedness of Spec(R), for nonzero R, is equivalent to every finite projective having constant rank (Weibel II.2, pp. 71–72).

**Checks.**

- For R=k×k, [k×0] has rank (1,0), [0×k] rank (0,1), and [R] rank (1,1).
- For the zero ring Spec(R) is empty, H(R) and K₀(R) are both zero; there is no evaluation at a chosen prime.
- For a nontrivial connected spectrum the constant section identifies H(R) with ℤ. The nonempty hypothesis is part of `ConnectedSpace`.
- Inverting the idempotent (1,0) in k×k projects (a,b) to a and kills the second factor class.
- Over k×k, componentwiseFree(1,2)=k×k² is projective and nonfree, and its rank fibres are {1,2}. Over k³ the regular module has one rank fibre and three components.
- The zero/constant functions give zero/free modules; their sections give 0 and n[R]. An indicator on k×k gives a factor class, which is not an integer multiple of [R].
- The fibre dimension of ℤ/2 is one at (2) and zero at the generic point, so it is not locally constant. Its stalk module rank is instead zero everywhere. Neither extends the projective rank formula to all finite modules.

### 2.2 Local, semilocal and field calculations

For a possibly noncommutative local ring equipped with a proper two-sided maximal ideal, division-ring quotient and the property that elements outside that ideal are units, prove that every finite projective is free. Transport the division-ring dimension calculation to obtain `localRingK0Equiv : K₀(R)≃+ℤ`, normalized by [R]↦1. For a commutative nontrivial local ring this agrees with rank. For a PID, the finite torsion-free structure theorem gives the same result. These results concern finite projectives, and use neither arbitrary projectives nor a nonexistent finite rank on infinite free modules (Weibel I.2, Corollary 2.3, p. 10; II.2, p. 68).

For a commutative semilocal ring prove that finite projectives are free on each connected component and rank is an isomorphism onto H(R). If there are c connected components this is ℤᶜ. This c is not generally the number of maximal ideals. For a finite product of fields combine the product equivalence with the supplied dimension equivalence. All equivalences commute with projection, scalar extension and localization on object classes (Weibel I.2, Ex. 2.3; II.2, Ex. 2.6, p. 79, with the componentwise refinement).

**Checks.**

- A field, including 𝔽₂, has K₀=ℤ and its one-dimensional module has class 1.
- A DVR also has K₀=ℤ; its residue field is not a projective module over the DVR.
- The localization of ℤ retaining maximal ideals (2) and (3) is a connected semilocal domain. Its K₀ is ℤ, although it has two maximal ideals.
- The zero ring is excluded from an equivalence with ℤ but remains covered by the product and rank constructions.

### 2.3 A projective invisible to all local ranks

Let A=ℤ[√−5] and I=(2,1+√−5). Compare A with the actual ring of integers of Q(√−5). Establish directly that I is a finite projective rank-one module and is not free. With s²=−5, a splitting is

    π(r₁,r₂)=2r₁+(1+s)r₂,
    ι(a)=(a(−1+s)/2, −a(1+s)/2).

The displayed fractions lie in A for a∈I, and πι(a)=a. The ideal has norm 2, while the equation u²+5v²=2 has no integral solution, so it cannot be principal. This example separates local rank, stable class and free-module classification. Layer 5 shows that x=[I]−[A] is nonzero of order two, even though it vanishes in every prime localization. Source: Weibel I.3, pp. 18–20 and II.2.6, pp. 73–74; the arithmetic nonprincipality argument is the displayed norm calculation.

### Examples

For a disconnected ring the free-class copy of ℤ is only the diagonal in H(R). For A=ℤ[√−5], every stalk of I is free of rank one; this verifies local freeness and does not trivialize the global class. These two cases test complementary failures of a rank-only implementation.

### Dependencies

Layer 1; native stalk-rank and localization APIs; the clopen–idempotent correspondence; finite-free classification over local rings and PIDs; the actual quadratic-integer and ideal-norm APIs.

## Layer 3: exterior operations, rank and determinant

### 3.1 Total exterior operations

For commutative R define `lambdaTotal` as the additive-group homomorphism from K₀(R) to multiplicative power series with constant coefficient 1, characterized by λ_t([P])=Σ_j[ΛʲP]tʲ. Define `lambdaOp j` by coefficient extraction. The finite-projective exterior functors, ordered sum isomorphism and base-change comparison are the suppliers specified above. Their decomposition Λⁿ(P⊕Q)≃⊕_{i+j=n}ΛⁱP⊗ΛʲQ gives the homomorphism. Prove `lambda_zero`, `lambda_one`, `lambda_add`, `lambda_neg`, `lambda_projective`, `lambda_baseChange`, and the pointwise rank formula. Every λʲ is a set operation; it is not generally additive (Weibel II.4.1 and Example 4.1.2, p. 90).

Beyond the finite locally free supplier, prove `exteriorPower_projective` for an arbitrary projective R-module M, without finite generation: exterior powers preserve a split retraction from a free module, and the exterior power of that free module is free by the native wedge basis. In degrees zero and one this recovers R and M; the exterior square of a countably generated free module remains free and is not finite. Extend the ordered sum comparison to arbitrary M,N: Λⁿ(M⊕N)≃⊕_{i=0}^nΛⁱM⊗Λ^{n−i}N, using the exterior-algebra universal property, with M wedges before N wedges. Its finite-projective specialization is the supplied sum comparison (Weibel I.3, exterior sum identity, p. 19).

For an exact sequence 0→P'→P→P''→0 of finite locally free modules, define `exteriorExtensionFiltration n` by FⁱΛⁿP=im(ΛⁱP'⊗Λ^{n−i}P→ΛⁿP), for 0≤i≤n, and F^{n+1}=0. Prove that it is decreasing, starts at ΛⁿP, and has graded piece ΛⁱP'⊗Λ^{n−i}P''. Include naturality, arbitrary base change and the split-sequence comparison with the sum of terms having at least i factors from P'. The construction is canonical without choosing a splitting, so it also works equivariantly for the representations of Layer 4. This filtration supplies exact-sequence exterior additivity there; the underlying exterior functors remain the supplied objects (Serre 1968, §3.7, p. 51; Weibel II.4.1.2, p. 90).

For x=[P]−n[R], give the coefficient formula

    λᵏ(x)=Σ_{i=0}^k (−1)^i binom(n+i−1,i)[Λ^{k−i}P],

using the power-series inverse (1+t)⁻ⁿ; handle n=0 through that inverse rather than a truncated natural-number binomial. For m≥1, λᵏ(−m)= (−1)^k binom(m+k−1,k). For any integer m, λ_t(m·1)=(1+t)^m with generalized integral binomial coefficients. These identities extend to H(R) fibrewise (Weibel II, Ex. 4.1, p. 101).

**Checks.**

- λ⁰(0)=1, λ¹(0)=0, and λᵏ(0)=0 for k>0. The constant coefficient must not be zero.
- λ²(2·1)=1, whereas λ²(1)+λ²(1)=0.
- λ_t(−1)=1−t+t²−t³+⋯; λ²(−1)=1 and λ³(−1)=−1.
- For a line L, λ_t([L])=1+[L]t, and for an actual rank-n projective λʲ vanishes on rank fibres below j.
- With P'=0, F⁰=ΛⁿP and all positive filtration terms vanish; for n=0 the only graded piece is R.
- For Re₁⊂R² and n=2, F⁰=F¹=R(e₁∧e₂) and F²=0. For n=1, F¹=Re₁; replacing a chosen section e₂ by e₂+re₁ changes the complement but leaves this filtration fixed.
- In a split sequence with both summands of rank two, gr¹Λ² has rank four and gr⁰,gr² each have rank one. Omitting the middle tensor factor would give rank two instead of six.

### 3.2 Pre-λ-rings and their morphisms

Define `PreLambdaRing` over a commutative ring K by operations λⁿ satisfying λ⁰=1, λ¹=id and the sum convolution law. Equivalently package the total homomorphism into 1+tK[[t]]. Define `PreLambdaHom` to be a ring map commuting with every λⁿ, and `LambdaIdeal` to be an ideal stable under λⁿ for n≥1. Its API includes identity/composition, extensionality on the underlying ring hom, coefficient/total equivalence, kernel ideals, quotient operations and their uniqueness. The n=0 condition is deliberately absent from ideal stability (Weibel II.4.1, p. 90).

Define a line element by λ_t(ℓ)=1+ℓt. In a bare pre-λ-ring it need not be a unit. Use `BinomialRing` with its genuine integral binomial operations to construct the binomial pre-λ-structure and its pointwise form on LocallyConstant(X,ℤ). Construct the monoid-ring structure on ℤ[M] for a commutative multiplicative monoid M by λ_t([m])=1+[m]t; use `MonoidAlgebra`, not the additive monoid algebra for the wrong indexing law. Its API includes evaluation under monoid maps, uniqueness on basis monomials and scalar binomial compatibility. Specialness and its universal mapping property into line elements are proved in Layer 4 (Weibel II.4.1.1, p. 90; Ex. 4.4, pp. 101–102).

**Checks.**

- Zero is a line element but is not a unit in a nonzero ring.
- The ideal (2) in binomial ℤ is not a λ-ideal: λ²(2)=1.
- ℤ[X] is not a binomial ring; X(X−1)/2 is not an integral polynomial. It does admit the different structure making X a line element.
- The pre-λ-structure on ℤ given by λ_t(m)=(1+t+t²)^m has λ²(1)=1 and is not special. Sum identities alone cannot imply the unit-line axiom.
- The zero ring has its unique structure; on binomial ℤ, λ²(5)=10 and λ³(2)=0. Setting λⁿ(x)=xⁿ fails convolution already at λ²(2): it gives 4 instead of 3.
- Locally constant binomial operations on two points are componentwise, and the empty domain gives the zero ring. For the trivial monoid the monoid-ring structure is binomial ℤ; in ℤ[u,u⁻¹], λ²(u+u⁻¹)=1.
- Identity and composition preserve λ on one fixed structure. The identity from binomial ℤ to the nonspecial structure fails at λ²(1). The zero and whole ideals are λ-ideals; their quotients recover K and 0. Binomial ℤ/(2) cannot inherit the operations, since 2=0 but λ²(2)=1≠λ²(0).
- In binomial ℤ, 1 is a line element and 2 is not, since λ²(2)=1. This distinguishes the line-element predicate from an arbitrary rank-one label.

### 3.3 Universal polynomials and specialness

Construct integral `lambdaProductPoly k` by expressing e_k({x_i y_j}) in the elementary symmetric functions of the x and y alphabets, and `lambdaComposePoly k l` by expressing e_k({products of l distinct x_i}) in the first kl elementary functions. Prove independence after adding unused variables, symmetry, weighted degree, integrality and uniqueness using algebraic independence. The variable counts in each product alphabet are at least k; coefficient identities are integral and need no inversion of factorials. Define `SpecialLambdaRing` by these identities together with λⁿ(1)=0 for n≥2, and show morphisms preserve them (Weibel II.4.3–4.3.1, pp. 92–93).

Prove `lambdaIdentityPrinciple`: an integral polynomial identity in finitely many iterated λ-operations holds in every special λ-ring if it holds for finite sums of independent formal line elements. Reduce to the free special λ-ring and the algebraic independence of elementary symmetric functions; this is a universal algebra argument, requiring no geometric splitting extension (Weibel II.4.3.2, p. 93).

The explicit low polynomials are P₂=a₁²b₂+a₂b₁²−2a₂b₂ and P₂,₂=a₁a₃−a₄. Their APIs include evaluation in a ring, substitution under ring maps and the line-element specialization. The second identity concerns λ²(λ²(x)), not λ⁴(x). Layer 4 proves specialness of K₀(R) by representation characters and associated projectives; it also proves the monoid-ring specialness and universal line-element map, with no assumed splitting principle in a circular dependency.

**Checks.**

- At ranks a=b=2, P₂(2,1;2,1)=6, the second exterior rank of a rank-four tensor product.
- For x of rank four, P₂,₂(4,6,4,1)=15, the second exterior rank of a rank-six exterior square.
- For k=1 the product polynomial is a₁b₁ and composition with λ¹ is the identity.
- The polynomial identities specialize in characteristic two by reduction of integral coefficients; dividing by 2 would fail this test.
- λ²(3·2)=15=P₂(3,3;2,1), while the proposed formula λ²(2)λ²(2)+2·2 gives 5 rather than λ²(4)=6.
- For three line variables, λ³(λ²(ξ₁+ξ₂+ξ₃))=ξ₁²ξ₂²ξ₃². This tests composition beyond λ¹ and the second exterior power.

### 3.4 Gamma operations and their filtration

Define `gammaTotal x = lambdaTotal x` with the substitution t/(1−t), and `gammaOp n` by coefficients. Its API is the constant/linear coefficient, sum convolution, naturality, inverse substitution t/(1+t), and, for n≥1,

    γⁿ(x)=λⁿ(x+n−1)=Σ_{j=1}^n binom(n−1,j−1)λʲ(x),

where the first equality assumes that 1 is a line element. In particular γ²(x)=λ²(x)+x. For an actual constant-rank-n projective, γ_t([P]−n) is a polynomial of degree at most n and the sum of its coefficients is [det P]. Prove this on rank fibres, including n=0 (Weibel II.4, γ-operations, pp. 94–95).

Define `LambdaAugmentation` to be a binomial ring H, pre-λ-maps ι:H→K and ε:K→H, with ει=id. Put I=ker ε. Define `gammaFiltration n` as the ideal generated by products Πγ^{k_i}(x_i), where x_i∈I, k_i≥1 and Σk_i≥n. The empty product is allowed; hence F⁰=K. Prove F¹=I, antitonicity, FⁱFʲ⊆F^{i+j}, functoriality and the H-module structure on graded quotients. For K₀ use H(R), rank and rankSection. The alternative additive-span description is proved for n≥1 when H is additively generated by idempotents with λᵏ(ex)=eλᵏ(x); locally constant integer functions satisfy this hypothesis. It is not asserted for n=0 (Weibel II.4, p. 96).

**Checks.**

- γ_t(1)=1+t+t²+⋯, so γⁿ(1)=1 for all n≥1. On the other hand γ_t(−1)=1−t.
- For a line ℓ, γᵏ(ℓ−1)=0 for k≥2; γ¹(ℓ−1)=ℓ−1.
- In ℤ[u,u⁻¹] with u a line, Fⁿ=(u−1)ⁿ.
- In ℤ[C₂], for the line σ with σ²=1, Fⁿ=2^{n−1}ℤ(σ−1) for n≥1. The filtration never becomes zero.
- For disconnected H, the additive span of the empty product is only ℤ·1, while F⁰ is all of K.
- γ²(3)=6 in binomial ℤ, while λ²(3)=3. Over a field the augmentation ideal and every positive filtration ideal vanish; for ℤ[√−5], F¹/F²≃ℤ/2.
- A binomial ring augmented over itself has zero kernel. The nonspecial structure (1+t+t²)^m admits no binomial augmentation, since its λ²(1)=1 contradicts preservation of λ²(1)=0.

### 3.5 Determinant and locally constant exponents

Use the supplied componentwise top exterior determinant of a finite projective. It glues ΛⁿP on the clopen rank-n fibres; no single maximum exterior power gives its line on every component. Extend its direct-sum isomorphism to `det : K₀(R)→* Pic(R)`, with additive source interpreted multiplicatively. Its API includes `det_projective`, `det_zero`, `det_add`, `det_neg`, free and line values, arbitrary scalar-extension naturality and compatibility with affine sheafification. This is an additive invariant with multiplicative target, not a ring homomorphism (Weibel II.2.6, pp. 73–74; I.3, pp. 18–22).

Compared with the supplied determinant on the core, prove `determinant_exactSequence`: an exact sequence 0→P'→P→P''→0 of finite locally free modules has a canonical isomorphism det(P)≃det(P')⊗det(P''), in that order. Construct it from the exterior extension filtration; prove naturality, arbitrary pullback, agreement with the ordered sum comparison and coherence for a filtered module. This supplies exact additivity on schemes as well as on affines. For 0→P→P→0 it is the unit comparison; for a split pair of lines it is their wedge isomorphism; on ℙ¹ the sequence O(−1)→O²→O(1) identifies the tensor of the endpoint lines with O (Weibel I.3, pp. 18–19; Serre 1968, §3.7, p. 51).

Define `picardLocallyConstantPow L f` for L∈Pic(R), f∈H(R), by tensor powers on the finitely many fibres of f. Prove zero/one, addition and multiplication of exponents, compatibility with Picard multiplication and inverse, clopen restriction and base change. This makes the additive Picard group an H(R)-module. The key determinant formula for all virtual x,y is

    det(xy)=(det x)^{rank y}(det y)^{rank x}.

Prove it first for constant finite ranks p,q through det(P⊗Q)≃det(P)^q⊗det(Q)^p, with the chosen lexicographic tensor basis, then glue and extend by differences. For constant rank n≥1 and 1≤j≤n prove det(ΛʲP)≃det(P)^{binom(n−1,j−1)}, with base change and the compound-matrix identity det(Λʲg)=(det g)^{binom(n−1,j−1)}. At j=0 and above rank the determinant is the trivial line; glue the formula componentwise for varying ranks (Weibel I.3, determinant identities; II.2.6.2, p. 74).

**Checks.**

- The zero module has determinant R; a line L has determinant L, and [L]−[R] has determinant L.
- Over k×k a module of ranks (1,2) has its determinant built from Λ¹ and Λ² respectively, not Λ² everywhere.
- If L=(C,C) over B×B and f=(1,2), then L^f=(C,C²); it need not equal a constant tensor power of L.
- det(1·x)=det x, even though det(1)=1 in Pic; this rules out treating det itself as a ring map to an untwisted product ring.

### 3.6 The rank–Picard quotient

Define `RankPic R` as the trivial square-zero extension of H(R) by the additive Picard H(R)-module. In multiplicative Picard notation its multiplication is

    (f,L)(g,M)=(fg,L^g M^f),     1=(1,R).

The API includes both projections, zero and unit, the rank-zero square-zero ideal, inclusion of H, and pullback. Prove that `rankDet`, x↦(rank x,det x), is a surjective ring map and define `SK0` as its kernel. Surjectivity uses rankSection(f)+[L]−1. It yields ReducedK0/SK0≃Pic. The fundamental filtration theorem is F²_γ=SK₀, hence gr⁰_γ=H and gr¹_γ=Pic, with inverse L↦[L]−1 in the latter. An explicit proof uses γ_t(P−n), its top determinant value and finite free complements; it need not assume specialness as an unproved prerequisite (Weibel II.2.6.2, p. 74; II.4.7–4.7.1, p. 96).

**Checks.**

- rankDet([R])=(1,1) whereas rankDet([L]−1)=(0,L).
- (0,L)(0,M)=(0,1), the zero element of RankPic; (1,L)(1,M)=(1,LM).
- An element with determinant 1 need not have rank zero: [R] is the first test.
- Over a local ring, Pic=0 and RankPic=ℤ. For the zero ring both factors are trivial.

### 3.7 Adams operations

Construct `lambdaNewtonPoly k` over ℤ expressing the k-th power sum in the first k elementary symmetric functions, with stabilization, weighted degree k and evaluation under ring maps. Define `adamsOp k` for k≥1 by its evaluation, equivalently by the integral Newton recurrence: ψ¹=x, ψ²=x²−2λ²x, ψ³=x³−3xλ²x+3λ³x, and the usual alternating recurrence with final term (−1)^{k−1}kλᵏx. Prove equivalence with the coefficient of −t(λ_{−t})'/λ_{−t}, so no logarithm or rational division is required. In a pre-λ-ring these operations are additive and natural. In a special λ-ring they are ring endomorphisms, satisfy ψᵏψˡ=ψ^{kl} and commute with λ-operations. For line elements ψᵏ(ℓ)=ℓᵏ; for a binomial structure ψᵏ=id. Define ψ⁰ only from the augmentation ιε (Weibel II.4, pp. 93–94; Ex. 4.6–4.7, p. 102).

For a square-zero λ-ideal I prove ψᵏ(x)=(−1)^{k−1}kλᵏ(x). On ReducedK0 modulo F² prove λᵏ(x)≡(−1)^{k−1}x and ψᵏ(x)≡kx. Consequently rank(ψᵏx)=rank x and det(ψᵏx)=(det x)ᵏ. For a prime p in a special λ-ring, ψᵖ(x)≡xᵖ mod p. More generally, assume filtered splitting: every x∈Fⁿ embeds into an augmented λ-extension that reflects all filtration ideals, where x is an H-linear combination of products of at least n terms ℓ−1 with ε(ℓ)=1 and ℓ a line element. Then prove ψᵏ acts as kⁿ on grⁿ_γ; perform the integral universal computation before any division by k in a torsion quotient (Weibel II.4, Proposition 4.9, p. 97).

**Checks.**

- ψ²(−1)=−1 in binomial ℤ, not (+1); Adams operations are additive.
- ψ²(u)=u² in the line structure on ℤ[u,u⁻¹], while binomial ψ² fixes every integer.
- Modulo F², ψ²([L]−1)=2([L]−1), fixing the determinant exponent.
- At p=2, ψ²(x)−x²=−2λ²(x), an integral multiple of 2.

### Examples

The two pre-λ-structures on ℤ separate the sum axiom from specialness. The Laurent line and order-two line separate nilpotent and nonnilpotent gamma filtrations. The pair (rank,det) retains precisely the degree-zero and degree-one information, including nonconstant ranks and torsion Picard classes.

### Dependencies

Layers 1–2; supplied finite-projective exterior powers and determinant objects; native power series, symmetric polynomials, monoid algebras and Picard modules. The specialness statements use Layer 4, while the construction of the pre-λ-structure, determinant and first gamma quotients does not depend on them.

## Layer 4: representation characters and the special λ-identities

### 4.1 Exact groups of integral representations

Let A be a Dedekind domain and C a flat A-coalgebra. Use the native comodule category and its finitely generated underlying-module subcategory. Define `ComoduleExact C` by short exactness of the underlying A-modules; define `ProjectiveUnderlyingComodule C` as the full subcategory whose underlying module is finite projective, with the induced exact structure. These are not the projective objects of the comodule category. Form `representationG0 C` and `representationK0 C` by the supplied exact Grothendieck groups. Their APIs include classes, exact additivity, inclusion, corestriction, tensor when C is a Hopf algebra, and compatibility with underlying-module functors. Over a PID “finite projective underlying” may be replaced by “finite free underlying” (Serre 1968, §§1.2–1.5 and 2.1–2.3, pp. 38–42).

Prove the finite-subcomodule theorem over a noetherian base: a finite set in a comodule lies in a finite underlying subcomodule. To prove the finite-projective-cover theorem, embed E in C⊗E by its coaction, lift a finite free cover of its underlying module, take the inverse-image comodule, and then a finite subcomodule surjecting onto E. Flatness makes this submodule torsion-free; over a Dedekind domain it is finite projective. Consequently every E has a two-term resolution 0→P₁→P₀→E→0 by such comodules. Define `comoduleResolutionEuler` by [P₀]−[P₁]. Show independence with the fibre product of two covers and prove exact additivity. It gives the inverse of inclusion representationK0→representationG0. Categorical projectivity and the projective-resolution theorem are unnecessary and generally inapplicable here (Serre, Proposition 2, p. 40; Proposition 3 and corollary, p. 41; Proposition 4, p. 42).

**Checks.**

- For C=A with its trivial coalgebra the comparison recovers the usual finite-projective/coherent comparison over a Dedekind domain.
- A nonsemisimple representation in characteristic p can have a free underlying module; freeness does not make its comodule sequence split.
- For E=A/(p) over A=ℤ with trivial coaction, [E] maps to [A]−[A]=0 in representationK0.
- Over a PID the kernel of a free cover is free; over a general Dedekind domain it need only be projective. The latter generality is retained in the exact comparison.

### 4.2 Generic fibres, residue fibres and Euler reduction

Write K=Frac(A), and for a nonzero prime v let k_v be the residue field. Define `genericRepresentationMap` by exact extension to K, and `residueInclusion v` by regarding a C⊗k_v-comodule as a C-comodule annihilated by v. The latter is fully faithful and exact. Prove that every finite generic representation has a stable full A-lattice and that two lattices give the same class modulo the sum of residue images. This gives exactness

    ⊕_{v≠0} G₀(C⊗k_v) → G₀(C) → G₀(C⊗K) → 0.

Each element in the first image uses finitely many v. The lattice comparison uses intersection lattices and torsion quotients. It does not assert that two lattices are isomorphic (Serre, §2.4 and Theorem 1, pp. 42–43).

For every Dedekind A, define `eulerReduction v` on G₀(C) by first taking the two-term projective-underlying Euler resolution and then reducing its terms modulo v. Tensoring an arbitrary short exact sequence with k_v is not the definition. Prove its value [P₀/vP₀]−[P₁/vP₁], independence, exact additivity and vanishing on every residue inclusion. For E=P/Q killed by v, the sequence 0→vP/vQ→Q/vQ→P/vP→E→0 is exact, and multiplication by a local uniformizer identifies E with vP/vQ as residue comodules. Their classes cancel; at another prime P and Q have equal localizations. It descends to `decompositionMap v` on generic G₀. On a representation with stable lattice L its value is [L/vL], independent of the chosen lattice (Serre, §2.5 and Theorem 2, pp. 43–44).

If A is a PID and every decomposition map is surjective, prove the generic map is an isomorphism. Here the residue-image generators vanish in G₀(C): the principal generator of v gives the two-term multiplication resolution of a lifted free-underlying representation. This additional conclusion retains the PID hypothesis; the existence of Euler reduction does not need it (Serre, §§2.6–2.7, Theorem 3, pp. 44–45).

**Checks.**

- For a trivial one-dimensional generic representation, lattices A and pA have isomorphic reductions as representations; their embeddings in K do not give different classes.
- Reducing the torsion module A/(p) naively gives a nonzero vector space, whereas its Euler reduction is [k_p]−[k_p]=0.
- At a different prime ℓ≠p, both tensor terms of the resolution of A/(p) cancel as well.
- Over a field there are no nonzero prime-residue terms; the generic comparison is the identity.
- For C=A over a nonprincipal Dedekind domain, every decomposition map ℤ→ℤ is onto, but generic extension K₀(A)→K₀(Frac A) kills Pic(A). This rules out dropping PID from the generic-isomorphism criterion while retaining the general reduction maps.

### 4.3 Integral torus characters

For the diagonalizable coefficient Hopf algebra A[X], with X a finitely generated free abelian character group, use its grading dictionary to define `weightPart E χ`. A finite representation has finite support, each weight part is finite, and a free-underlying representation over a PID has free weight parts. Weight extraction is exact. Prove the canonical base-change isomorphism k⊗E_χ≃(k⊗E)_χ for every field map A→k, including a nonflat residue map: this follows from the direct grading, not a general exactness claim (Serre, §3.4, Proposition 7, pp. 47–48).

Define `formalCharacter` as Σ_χ rank(E_χ)[χ] over a PID, and dimension in the field case, with coefficients in ℤ[X]. It induces a ring isomorphism of the representation Grothendieck group with ℤ[X], inverse to the weight-line class map. Its API includes zero, exact sums, tensor convolution, weight lines, base change, generic comparison and decomposition-map compatibility. Character coefficients remain integers in characteristic p. The diagonal torus's abstract k-points cannot replace its group scheme (Serre, Proposition 7, p. 48; §3.7, p. 51).

**Checks.**

- A weight line χ has character [χ], and the trivial line has character [0].
- In characteristic p, p copies of a weight line have formal character p[χ]≠0 over ℤ.
- Over 𝔽₂ the weight-0 and weight-1 characters agree on every point of 𝔾_m(𝔽₂), but [0] and [1] are distinct formal monomials.
- For X=0 the character ring is ℤ and the character is dimension; the empty product of tori is handled literally.

### 4.4 Split reductive characters in all characteristics

For a split connected reductive group G over a field k, with split maximal torus T, character lattice X and Weyl group W, construct `reductiveFormalCharacter` by restriction to T and the preceding map. Prove it is injective with image ℤ[X]^W. This holds over arbitrary k, in every characteristic. The proof requires the following precise highest-weight milestone: for each dominant λ there is a unique absolutely simple rational representation L_λ with highest weight λ of multiplicity one; all other weights are below λ, and these exhaust the simple representations. Use the finite-length basis of G₀ and triangularity against Weyl-orbit sums. Only finitely many dominant weights occur below any fixed highest weight in this triangular argument. Do not assert the characteristic-zero Weyl formula for simple characters in positive characteristic (Serre, §3.6, Lemmas 5–6 and Theorem 4, pp. 49–50).

For G split reductive over a PID A, prove that generic extension and every decomposition map induce isomorphisms on representation Grothendieck groups. The torus character square identifies all field characters in the same ℤ[X]^W, giving Ch_{k_v}d_v=Ch_K. Surjectivity of d_v and §4.2 then prove the integral generic isomorphism. State its ring and pre-λ compatibility, since exterior powers of a short exact sequence have the standard filtration even when the sequence does not split equivariantly (Serre, §3.7, Theorem 5, p. 51). This is a Grothendieck-group equivalence, not an equivalence of representation categories or a semisimplicity theorem.

**Checks.**

- For G=𝔾_m the theorem is the torus character isomorphism with Laurent polynomial ring ℤ[t,t⁻¹].
- For GL₂ in characteristic two, the standard representation has character x₁+x₂ with integral coefficients.
- A decomposition map need not send a simple characteristic-zero representation to a simple representation; its matrix is triangular with diagonal 1.
- A nonsplit reductive group is outside the split character-isomorphism statement. No proof replaces its character lattice by that of a chosen split form without descent.

### 4.5 Products of general linear group schemes

Let H_A(n₁,…,n_s) be the coordinate Hopf algebra of Π_i GL_{n_i,A}; use native tensor products of coordinate algebras, with H_A([])=A. Give `glProductFactor`, the generic matrix entries, inverse determinant and the factor counit. Factor inclusions are injective because the other factors' counits give a left inverse. Algebra maps out are determined by the generic matrix entries, since the inverse determinant is forced. The representation ring over ℤ identifies with the invariants in

    ℤ[x_{i,j}^{±1} : j<n_i, i<s]

under the product of symmetric groups. For one factor it is ℤ[λ¹V,…,λⁿV,(λⁿV)⁻¹], with GL₀ giving ℤ. Prove the formal character of ΛʲV is e_j, and the λ-structure on the torus ring is the line-monomial structure (Serre, §3.8, p. 52).

The coefficient API includes the actual base-change equivalence k⊗_ℤH_ℤ(N)≃H_k(N), recursively through tensor products. On pure tensors the next-factor map sends a⊗(x⊗y) to β_n(a⊗x)⊗β_tail(1⊗y); its inverse multiplies the scalar coefficients. The diagonal restriction sends a generic entry to its weight monomial on the diagonal and to zero off it, and the inverse determinant to the negative total weight monomial. Prove that base change and diagonal restriction commute by checking these generators. This identifies the integral and residual character squares on the actual coordinate algebras (Serre, §3.7, p. 51).

**Checks.**

- GL₀ has trivial torus and representation ring ℤ; the empty tuple also gives ℤ.
- For GL₂, det has character x₁x₂ and det⁻¹ has its inverse, so the representation ring must be localized.
- The tuple (1,1) gives two independent invertible variables. Identifying them loses the product-group character.
- Representations of the abstract group GL₁(ℤ) are not the integral algebraic representations of 𝔾_m. In particular its order-two swap representation is not determined by an integral torus weight decomposition.

### 4.6 Associated projectives and the special identities

Given finite projectives P_i over a commutative R, first work on finitely many clopen pieces where their ranks n_i are fixed. For a finite-free-underlying algebraic representation V of ΠGL_{n_i,ℤ}, define `associatedProjective V P` by applying V to finite principal-open trivialization cocycles and descending the resulting finite locally free module. Independence of trivializations follows from the cocycle and refinement comparisons, using the supplied effective descent. Its API includes the standard factors, trivial representation, sum, tensor, dual, exterior powers, exact sequences of representations, composition under base change and isomorphism invariance. Exactness is checked locally on split underlying free sequences, not on equivariant splittings (Weibel II.4.1.2, p. 90; Serre's character theorem supplies the integral identities).

This construction induces a pre-λ ring map `associatedRepresentationK0` to K₀(R). Restriction of representations to the torus makes the special product and composition identities elementary identities among line monomials; injectivity of formal characters proves them in the integral representation ring. Applying associatedRepresentationK0 proves them for the actual P_i, and finite-free-complement normal forms extend them to virtual classes. Gluing the rank pieces proves `ringK0_specialLambda` for every commutative R, including disconnected and zero rings. The same argument proves specialness of the monoid ring and its universal map from a monoid of line elements. No flag-bundle splitting theorem is assumed before this argument is complete.

**Checks.**

- The standard i-th representation gives P_i; its determinant representation gives det P_i.
- The trivial rank-one representation gives R, including on a piece where n_i=0.
- For a nonfree invertible P, the weight-m representation of GL₁ gives P^{⊗m}, also for negative m.
- On k×k, associated modules must be formed separately on the different rank pieces and glued; choosing one global matrix size with no complement comparison is insufficient.

### Examples

The integral character of Λ²(V⊗W) gives P₂ from §3.3. For V of rank four, the character of Λ²(Λ²V) gives λ¹(V)λ³(V)−λ⁴(V), explaining the number 15 without dividing by 2. The residue-field examples test that formal characters live in an integral weight ring throughout the comparison.

### Dependencies

Layers 1–3; native coalgebras/comodules and ReductiveGroups' group-scheme dictionary; exact Grothendieck groups; diagonalizable grading; finite-length G₀ and finite-subcomodule arguments; AlgebraicVectorBundles' effective descent. General split reductive highest-weight triangularity is stated explicitly in §4.4, including the field-descent step in Serre's proof.

## Layer 5: Dedekind domains, ideal classes and transfer

### 5.1 Steinitz decomposition and cancellation

Let R be a Dedekind domain. Prove `coprimeIdealRepresentative`: an invertible ideal class has an integral representative coprime to any prescribed nonzero ideal. Use finite prime avoidance and fractional rescaling. For coprime nonzero integral ideals I,J, choose i∈I,j∈J with i+j=1. The sum map I⊕J→R is split by r↦(ri,rj), and its kernel identifies with IJ through z↦(z,−z). Thus I⊕J≃R⊕IJ. Rescaling gives the same isomorphism for arbitrary invertible fractional ideals. Iterating the finite torsion-free ideal decomposition gives `steinitzEquiv`: every nonzero finite projective P of rank r≥1 is R^{r−1}⊕L, with L=det P. The existential milestone is `steinitz_decomposition`. The zero module is separate. Rank and determinant classify finite projectives, and cancellation holds (Weibel I.3, Proposition 3.4 and the Dedekind discussion, pp. 19–20).

State uniqueness of the ideal class, not uniqueness of an embedded ideal or a chosen decomposition. The APIs are `steinitz_rank`, `steinitz_det`, `projective_iso_iff_rank_det`, `projective_cancel` (the milestone `projective_cancellation`), and the ideal direct-sum formula, natural on isomorphism classes. For a field all invertible ideals are principal and this recovers dimension classification.

### 5.2 The rank–Picard isomorphism

The light specialization `lineProjective R L` regards the native invertible module of a Picard class L as an object of FiniteProjectives. Its API is the underlying-module formula, rank-one property and isomorphism invariance; the rank–Picard theorem below normalizes its class as (1,L). A trivial line gives (1,0), tensor-inverse lines give inverse reduced classes, and a nontrivial ideal line gives a nonzero reduced class.

Define `picardClassDifference : Additive(Pic R)→+K₀(R)` by L↦[L]−[R]. The Steinitz sum formula makes this additive over a Dedekind domain; it is not claimed additive over every ring. Its image is ker rank, it is split by determinant, and products of two image classes vanish. Construct `dedekindRankPicEquiv` (with existence milestone `rank_pic_equiv_exists`), normalized by

    [P] ↦ (rank P,det P),       (n,L) ↦ (n−1)[R]+[L].

The inverse formula applies to every integer n, including n=0 and n<0. It is a ring equivalence to the square-zero RankPic structure, not the direct product ring ℤ×Pic(R). In particular SK₀=F²_γ=0 and ReducedK0²=0. Transport `ClassGroup.equivPic` to the ideal-class-coordinate form; the class of an integral nonzero ideal I corresponds to the module I without inversion. For every ring map between Dedekind domains, base change sends (n,L) to (n,f*L), including noninjective maps to residue fields (Weibel II.2.6.2–2.6.3, p. 75).

**Checks.**

- A field has Pic=0, and the equivalence is the dimension map to ℤ.
- The inverse of (0,L) is [L]−[R], not [L]; the inverse of (−1,L) is [L]−2[R].
- ([L]−1)([M]−1)=0, so [L⊗M]=[L]+[M]−1.
- For a residue map R→κ(p), every Picard class becomes trivial while the integer rank remains unchanged.

### 5.3 Localization and the quadratic integer example

For a multiplicative subset M⊂R not containing zero, let T be the nonzero primes meeting M. Identify the existing class-group localization map with a surjection Cl(R)→Cl(M⁻¹R) whose kernel is generated by T. Consequently `dedekindK0Localization` is surjective, with kernel generated by [p]−[R] for p∈T. The rank coordinate is unchanged. For A=O_{F,S}, use its actual localization equivalence and obtain Cl(A)=Cl(O_F)/⟨[p]:p∈S⟩ and the corresponding K₀ formula. Class-group finiteness makes K₀(O_F)=ℤ⊕a finite group; the torsion subgroup is precisely Cl(O_F) (Weibel I.3, divisor-class localization; II.2.6.3, p. 75).

For A=ℤ[√−5] and I from §2.3, prove I²=(2), so 2([I]−[A])=0. Nonprincipality gives nonzero determinant, hence a nonzero class. Under the explicit arithmetic hypothesis that the class number of Q(√−5) is two, the ring-of-integers equivalence yields K₀(A)≃ℤ⊕ℤ/2; the supplier contract above discharges that hypothesis. Localizing at I kills that torsion class. Its torsion quotient A/I has G₀ class [A]−[I]; it is not itself an object of Proj(A).

**Checks.**

- Localizing a PID at any set of nonzero elements leaves K₀=ℤ.
- Localizing at all nonzero elements gives the fraction field and kills the entire Picard coordinate.
- For k×k, localization at an idempotent changes the rank-function domain; the Dedekind-domain statement does not apply to this ring.
- The quadratic ideal class is locally zero at every prime but globally nonzero; its order is exactly two, not merely a divisor of two.

### 5.4 The index ideal of a map of lines

For finite projective rank-one modules L,N and a linear map f:L→N, define `lineMapIndexIdeal f` to be the image ideal of the evaluation map Nᵛ⊗L→R, φ⊗x↦φ(fx). This definition works for any commutative R and includes zero maps. Give the elementwise membership characterization, invariance under isomorphisms of source and target, arbitrary base change, the zero formula and the identity formula. For a nonzero map of lines over a domain it is a nonzero invertible ideal and [L]=[index(f)][N] in Pic(R). Locally this is the principal ideal generated by the scalar of f. This local description proves the assertion without choosing a global basis (the line evaluation construction of Weibel I.3.1–3.3, p. 18).

For a finite injective map R→S of Dedekind domains and a nonzero S-ideal J, apply this construction to the top exterior map det_R(J)→det_R(S). Prove

    lineMapIndexIdeal(Λ^d(J↪S)) = Ideal.relNorm R J.

Localize at every height-one prime of R. Decompose the finite S-algebra into its primes above it; the DVR elementary divisors make the determinant valuation equal to Σ_{q|p} f(q/p)·ord_q(J), exactly the ideal-norm exponent. Equality of nonzero ideals follows from these valuations. This is also the proof for nonprincipal J; a principal-generator calculation alone would leave a gap. Use the existing ideal norm and its valuation theorem (Weibel I.3, pp. 18–20, for determinant lines; the stated local determinant computation supplies the norm comparison).

**Checks.**

- The zero map of lines has index ideal 0; it is not assigned the unit ideal.
- Multiplication by 6 on ℤ has index ideal (6), while the identity has (1).
- Changing the two trivializations multiplies the scalar by units and leaves the ideal unchanged.
- For the inclusion (π^a)→O over a DVR, the index valuation is a≥0. Reversing the Picard formula would give the wrong sign.

### 5.5 Normalized norm and the transfer formula

For finite injective R→S of Dedekind domains, put d=rank_R S≥1 and s=det_R S. Use the existing class-group norm, transported to Picard groups, and prove its determinant normalization

    N_{S/R}(L)=det_R(Res L)·s⁻¹.

The API is multiplicativity, N(S)=R, compatibility with ideal norms, N(f*L)=L^d, and tower composition. The correction by s is essential. For a rank-r projective Q over S prove det_R(Res Q)=N(det_S Q)·s^r; establish it using Steinitz decomposition and §5.4. Thus `dedekindTransferCoordinates` is

    (r,L) ↦ (dr, N(L)·s^r).

The formula extends additively to virtual negative r. It gives f_*f^*(n,L)=(dn,L^d s^n), agreeing with multiplication by [S], rather than with degree multiplication alone. For a finite product S=ΠS_i, the output is (Σd_i r_i, ΠN_i(L_i)s_i^{r_i}); the empty product gives zero (Weibel II.2.8.1 and Ex. II.2.2, pp. 76,78; determinant-line normalization as above).

**Checks.**

- The norm of the trivial S-line is trivial; the unnormalized det_R(S) need not be.
- For R=S the degree is 1, s is trivial and the coordinate map is the identity.
- For a finite free extension s=1, the formula simplifies to (dr,N(L)); this simplification requires freeness or trivial determinant.
- The virtual class (−1,1) transfers to (−d,s⁻¹), testing the negative exponent.

### Examples

The ideal I=(2,1+√−5) gives a rank-zero class of order two and a residue-field Euler class with the opposite sign. A finite extension with nontrivial Steinitz class tests transfer: even the image of the unit [S] remembers det_R S. The index ideal records the determinant of an inclusion rather than the cokernel as a projective object.

### Dependencies

Layers 1–3; finite torsion-free module classification over Dedekind domains; Picard/class-group equivalence, localization and ideal norms; number-field class-group finiteness and the explicit quadratic-integer equivalence. No algorithmic class-group computation is required as an unnamed dependency.

## Layer 6: finite matrices and stable representatives

### 6.1 Finite representatives and contiguous block sum

Prove `stableGL_finiteRepresentative` and `stableGL_eq_iff_commonStabilization` for the supplied identity-padded colimit, including injectivity of finite-stage maps. These are explicit representative criteria for that colimit, rather than a second stable group. Define finite `blockSum : GL_m(R)×GL_n(R)→GL_{m+n}(R)` by contiguous diagonal blocks. Its refinement of the stable quotient interface retains the actual finite size. Prove injectivity, associativity up to index casts, the GL₀ unit, entry and linear-map formulas, compatibility with ring maps and determinant, and the block-permutation conjugacy formula. Contiguous block sum is not an operation on arbitrary stable representatives: stabilizing the first block shifts the second. The corresponding finite-block class agrees with multiplication in the supplied K₁ quotient (Weibel III.1, Definition 1.1 and §1.2, pp. 179–180).

**Checks.**

- The image of GL₀ is 1, and identity matrices at every rank give the same stable identity.
- Over a nonzero field, diag(u,1) and diag(1,u) for u≠1 are distinct stable matrices, despite being conjugate.
- A ring map carries diag(g,1) to diag(f(g),1), fixing the padding entry.
- Contiguous blocks diag(u,1,v) and diag(u,v,1) can differ, even though the first representatives u and diag(u,1) agree stably. They give the same K₁ class, not the same stable matrix.
- Reduction ℤ→𝔽₂ sends diag(−1,1) to identity. The general-ring entry map specializes to Mathlib's GL map over commutative rings, including the zero ring; transvection stabilization specializes to `TransvectionStruct.sumInl`.
- The idempotent padding diag(e,0) of Layer 1 does not define a map between unit groups.

### 6.2 Elementary generation and noncommutative identities

Define `finiteElementaryGroup R n` (also denoted E_n(R)) as the subgroup generated by the unit matrices 1+Matrix.single i j a with i≠j. Unlike the supplied stable subgroup, it retains its rank. The API includes generator membership, finite-word induction, stabilization, block inclusions, maps under ring homomorphisms and comparison of its directed union with that stable subgroup. Lift a finite product generator by generator to show that a surjective ring map induces a surjection on finite elementary groups. No corresponding surjectivity on GL is inferred (Weibel III.1.2, pp. 180–181).

For distinct i,j,k prove the opposite-root identity

    [e_ij(a),e_ki(b)]=e_kj(−ba).

Use the native matrix identities in their commutative specializations; the arbitrary associative-ring formula retains the displayed coefficient order. The signed Weyl word w=e₁₂(1)e₂₁(−1)e₁₂(1) equals [[0,1],[−1,0]], satisfies w²=−I, and supplies even permutation matrices in E. Refine the stable Whitehead input to `finite_whitehead_block`: diag(g,g⁻¹) lies already in E_{2n}(R), through its six explicit unitriangular block factors. This rank bound is needed before stabilization in the later extension argument (Weibel III.1.2.1 and Lemma 1.3, pp. 180–183).

Prove E_n(R) perfect for n≥3 using a spare index in each generator commutator. For every n≥2 the finite centralizer of E_n in GL_n consists of invertible central scalar matrices; over arbitrary associative rings this extends the supplied commutative scalar-centralizer result. The stable centralizer of E is trivial because a fixed finite block must also commute with roots involving a new index. These are finite-size and centralizer refinements, not a second stable commutator or normality theorem.

**Checks.**

- Over 𝔽₂, E₂=SL₂≃S₃ is not perfect; stable E is perfect.
- Over 𝔽₃, E₂=SL₂ has order 24 and commutator order 8. It is another finite-rank exception.
- The sign in the second commutator is negative and its coefficient is ba, not ab; a noncommuting coefficient pair detects the order.
- ℤ→𝔽₅ is surjective on elementary groups, but GL₁(ℤ)→𝔽₅ˣ misses 2.
- In characteristic two w²=I, consistent with −1=1; the integral signed identity remains the same.
- E₀ and E₁ are trivial; over the zero ring every E_n and StableElementary is trivial. Over ℤ, diag(−1,−1)=w² is elementary, while the stable size-one −1 is not.
- Over ℍ, adding i times the second row containing j gives ij=k, not ji=−k. In the commutative specialization the explicit generator is the native transvection unit.

### Examples

The size-three commutator realizes e₁₃(a) as [e₁₂(a),e₂₃(1)]. This explains precisely why spare indices matter. The product of the three block matrices diag(g,g⁻¹), diag(h,h⁻¹), diag((hg)⁻¹,hg) is diag([g,h],1), proving that every stable commutator is elementary.

### Dependencies

Native matrix units and transvections; GeneralAlgebraicKTheory §§3.3–3.4; Layer 1's finite block conventions. Field and integer elementary generation are existing supplier facts rather than new targets.

## Layer 7: classical K₁ and projective automorphisms

### 7.1 Matrix-ring normalization

Prove `matrixRingK1Equiv` by flattening finite matrices into d×d blocks; the cofinal ranks dm give the inverse for d≥1. This is the finite-matrix normalization of Morita invariance, using the supplied Whitehead quotient and class map `matrixClass`, and retaining the same identity padding as the finite representatives of Layer 6. Its API includes compatibility with ring maps, inverse comparisons and the effect on a diagonal unit. Use the supplied finite-product comparison componentwise. For a noncommutative ring this need not make the unit-to-K₁ map injective (Weibel III.1.1.2–1.1.4, pp. 179–180).

**Checks.**

- A transvection represents 1 in K₁, whereas a size-one unit need not.
- For M₂(k), the size-one matrix-ring unit diag(u,1) maps to u∈K₁(k)=kˣ, while uI₂ maps to u². Over k=ℚ and u=2 these values are 2 and 4, so the two normalizations differ.
- The size-one matrix-ring identity maps to 1, and flattening a two-by-two block matrix gives exactly its four-by-four scalar matrix, with the same K₁ class.
- Matrix size d=0 gives the zero ring and fails Morita equivalence with a nonzero field. At d=1 flattening is the identity.
- The classes of diag(g,h) and diag(h,g) agree, although the stable matrices may differ.
- K₁ of the zero ring is trivial; its sole unit is its identity.
- For k×k, the two projections recover the two unit coordinates independently.
- K₁(ℤ)→K₁(𝔽₅) misses the class 2, while reduction to 𝔽₂ kills −1. Identity/composition maps correspond exactly to the induced abelianization maps.
- A size-one unit need not inject over a noncommutative ring. In T₂(𝔽₂), u=[[1,1],[0,1]] is nonidentity but its stable class is 1, by the triangular nilpotent-ideal calculation.

### 7.2 Classes of projective automorphisms

For a finite projective right R-module P and α∈Aut_R(P), define `projectiveAutClass P α` by choosing P⊕Q≃Rⁿ and taking the class of α⊕id_Q. Prove independence of complement, size and chosen isomorphism. Its API includes identity, composition, inverse, transport by a projective isomorphism, direct sum, extension of scalars and agreement with a finite matrix. For left projectives over arbitrary R give the corresponding map to K₁(Rᵒᵖ); over commutative R compare both conventions (Weibel III.1, Lemma 1.6, pp. 185–186).

Give the explicit `rightModuleEnd` ring equivalence: φ maps to the matrix with j-th column φ(e_j), and its inverse is v↦Mv on the free right module. It preserves composition in this order and restricts to units; over a commutative ring it is the native column linear-map equivalence. A left-module row-matrix conversion instead reverses multiplication and specializes to transpose (Weibel I.1, p. 2; III.1.6, p. 185).

If 0→P'→P→P''→0 is a short exact sequence of finite projectives and α preserves P' with equality, let α',α'' be the induced automorphisms. Prove autClass(P,α)=autClass(P',α')autClass(P'',α''). Equality of the preserved submodule is required to make the restriction invertible. For commutative R, an automorphism preserving a finite projective summand by inclusion induces the needed equality in the applicable finite-rank situation; state that argument separately. Extend the formula to finite invariant filtrations with projective graded pieces. Upper triangular unipotent automorphisms have class 1 (Weibel III.1.6 and Bass' presentation in §1).

Construct the universal Bass automorphism group with isomorphism, composition and exact-sequence relations, and prove its equivalence with RingK1. Its universal property applies to an arbitrary commutative target group and invariants satisfying exactly those relations. The map from finite free automorphisms to projective automorphisms and the complement construction are inverse on classes.

**Checks.**

- autClass(0,id)=1; adding a zero summand does not change the class.
- For a free module with a chosen basis, changing the basis conjugates its matrix and preserves the class.
- On P⊕Q, the automorphism [[1,u],[0,1]] has class 1 for any linear u:Q→P.
- Over a commutative ring, the determinant of a projective automorphism is its scalar action on the determinant line; a free-module-only determinant function is not applied to a nonfree P.
- A root matrix e₀₁(a) sends the second basis vector to e₁+ae₀; in size zero both endomorphism rings are zero. The left-row matrix of that same commutative linear map is e₁₀(a), fixing the transpose convention.
- Swapping ℤ² has class −1. On the nonfree ℤ×ℤ-module ℤ×0, multiplication by −1 has determinant (−1,1), whereas the default free-basis `LinearMap.det` gives 1 and loses the first factor.

### 7.3 Tensor action and restriction of scalars

For a commutative base A and an A-algebra B, construct `projectiveTensorK1Action`: K₀(A) acts on K₁(B) by tensoring a finite projective P with a projective B-automorphism. Prove bilinearity, the unit and zero formulas, associativity of actions and naturality. A free rank-n P acts by x↦xⁿ; a nonfree line need not act trivially before further hypotheses. For commutative B, determinant transforms by det(x)^{rank P}, with locally constant exponents (Weibel III.1.6.1, p. 185).

For a unital map A→B with B finite projective as a right A-module, prove `transfer_projectiveAutClass`: the supplied transfer sends an automorphism class to its restricted right-projective automorphism class. Its identity and tower comparisons agree with literal restriction. For commutative A with a central A-algebra B, specialize both projection formulas to the K₀ action; in particular transfer∘extension acts by [B]. If B is finite free over a commutative A with a basis, identify transfer with the restriction matrix in the induced basis. Its determinant is the algebra norm of the original determinant when both algebras are commutative and the finite-free norm theorem applies; the base-change comparison is for commutative A→S and B_S=S⊗_A B. These are concrete formulas for the supplied transfer, not a second definition (Weibel III.1, Lemma 1.7 and Corollary 1.7.1, p. 187).

**Checks.**

- For a finite field extension, transfer on K₁ is the usual field norm. In ℂ/ℝ, transfer(i)=1 and transfer(1+i)=2; restriction is not evaluation at the same complex scalar.
- For k→k×k the transfer of (u,v) is uv, and extension followed by transfer sends u to u².
- For the projective nonfree k-algebra B=k via the projection A=k×k→k, restriction of u has determinant (u,1). A totalized free-basis norm with its default value cannot replace this determinant.
- The zero projective class acts by the trivial homomorphism, and [A] acts by the identity.

### Examples

An automorphism of a nonprincipal invertible ideal still has a well-defined K₁ class. Its determinant is the induced scalar on that ideal's line; no basis of the ideal is chosen. Restriction through a finite extension and through a product checks the matrix and tensor definitions against the multiplicative norm.

### Dependencies

Layers 1, 5–6; finite-projective complements, the stable Whitehead lemma and native restriction/tensor functors. K₀-action and transfer statements use their displayed left/right finiteness hypotheses.

## Layer 8: determinants, stable range and a nontrivial circle class

### 8.1 The commutative determinant splitting

For commutative A, determinant on finite matrices defines `RingK1.det : K₁(A)→Aˣ`. The size-one inclusion `unitsToK1` is a section. Define `SpecialK1 A` as its kernel, with inclusion, determinant-one representatives, functoriality and the canonical product equivalence K₁(A)≃Aˣ×SK₁(A). The inverse sends (u,x) to [diag(u)]x; no choice of representatives enters this formula. Prove compatibility with scalar extension, the projective-automorphism determinant and finite-free transfer (Weibel III.1.1.1, p. 180; III.1.6–1.7, pp. 185–187).

Compute K₁(k)=kˣ for a field, K₁(ℤ)={±1}, and K₁(A)=Aˣ for a commutative semilocal ring. For an arbitrary Euclidean domain prove `euclidean_elementary_generation`, generalizing the supplied field and integer results, and deduce SK₁=0. The semilocal argument uses stable range one, rather than assuming a Euclidean algorithm. Morita invariance transports K₁(M_d(A))≃K₁(A) for d≥1; its normalization sends a unit of the matrix ring to the class of its underlying d×d matrix (Weibel III.1.1.2–1.1.4, p. 180; Lemma 1.4, pp. 183–184; Proposition 1.6.4, p. 186).

**Checks.**

- On diag(u,v), determinant is uv, including u=−1. In characteristic two −1=1.
- A determinant-one matrix need not be elementary at its original size, and SK₁ need not vanish for a general commutative domain.
- Over ℤ, diag(−1) is the nontrivial K₁ class and diag(−1,−1) is trivial.
- The zero ring has trivial units and K₁; it is handled before assertions involving a nonzero determinant or a positive field dimension.

### 8.2 Bass stable range and elementary reduction

For n≥1 define `HasStableRange A n` using left-unimodular columns: for every r>n and a₀,…,aᵣ₋₁ generating the unit left ideal, there are b₀,…,bᵣ₋₂ such that aᵢ+bᵢaᵣ₋₁, i<r−1, are left-unimodular. State explicitly the conversion to a right-row convention by opposite rings. Its API comprises the length-n+1 criterion, monotonicity in n, descent to quotients and invariance under ring equivalence. Over a commutative semilocal ring prove `stableRange_semilocal` (finite maximal spectrum); a commutative noetherian ring of Krull dimension at most d has range at most d+1 (`stableRange_noetherian_dimension`). Dedekind domains, including fields, satisfy `stableRange_dedekind` at bound two. The target `integers_not_stableRange_one` uses the unimodular pair (2,5): no integer 2+5b is a unit (BMS §7, Theorems 7.4–7.5, pp. 106–107; Weibel Ex. I.1.5 and III.1.3, pp. 5, 189).

Prove transitivity of E_r(A) on unimodular columns for r>n, reduction GL_r(A)=E_r(A)GL_n(A), and surjectivity GL_n(A)→K₁(A). Keep finite-level normality and stability ranges in each statement rather than inferring them from stable normality. Range one gives SL_r(A)=E_r(A) for commutative A and all r≥2; ranks zero and one have their direct interpretations. The relative refinements and their stronger hypotheses are in Layer 10.

**Checks.**

- Over a field, a nonzero column is unimodular and Gaussian elimination gives range one.
- In ℤ the unimodular pair (2,5) cannot be shortened to 2+5b=±1; ℤ does not have range one.
- A zero-length column is not used in the shortening predicate. The zero ring still satisfies the appropriate unit-ideal equations because 0=1.
- The bound r>n is retained at r=n+1 and is not weakened to r≥n without a separate theorem.
- ℤ/6 has range one by semilocality. The indexing agrees with BMS condition (7.2)_{n+1} for the unit ideal; replacing n+1 by n changes the hypothesis.

### 8.3 Dieudonné determinant over a division ring

For a division ring D, define `DieudonneDet n : GL_n(D)→Dˣᵃᵇ` by left row elimination, with Δ₀=1. For n≥1, in the first column choose its least nonzero entry, in row i with indices starting at one, move that row to the top and eliminate with left coefficient aⱼ₁aᵢ₁⁻¹. The recursive value is the product of the pivot class, the sign class (−1)ⁱ⁺¹, and the value of the remaining block. Prove independence of pivot, elementary invariance, multiplicativity and stabilization in every size. For n≥1 prove surjectivity and uniqueness with Δ(diag(u,1,…))=[u]; size zero instead has the unique trivial homomorphism. Establish the block-triangular formula and, when X is invertible, Δ([[X,Y],[Z,W]])=Δ(X)Δ(W−ZX⁻¹Y). The order in the Schur complement is part of the statement (Weibel III.1.2.4, pp. 181–182).

For n≥2 prove ker Δ_n=E_n(D), including D=𝔽₂ and n=2. For n=1 the kernel is [Dˣ,Dˣ], while E₁(D)=1; do not assert the same finite-level kernel formula. Passing to the stable group gives K₁(D)≃Dˣᵃᵇ. Separately calculate [GL_n(D),GL_n(D)]=E_n(D) for n≥2 except (n,D)=(2,𝔽₂). The exception concerns the finite commutator statement, not the Dieudonné kernel. In particular GL₂(𝔽₃) has commutator SL₂(𝔽₃), although SL₂(𝔽₃) is not perfect. Reconcile these assertions by explicit finite calculations before using the small-field clauses in a stability argument.

The determinant API includes transport under a division-ring isomorphism, opposite-ring compatibility with transpose, the usual determinant after commutative specialization, inverse and conjugacy, and the class of a permutation matrix. A determinant into Dˣ itself with all the same normalizations is generally impossible; the abelianization is essential. For the real quaternions prove K₁(ℍ)≃ℝ_{>0} by squared norm and identify the norm-one subgroup with commutators. In particular [−1]=1, since iji⁻¹j⁻¹=−1. This is distinct from the reduced norm discussion for general central division algebras.

**Checks.**

- For a 2×2 matrix with first pivot a≠0, the answer is [a][d−ca⁻¹b]; swapping the two rows multiplies it by [−1].
- Δ₂ over 𝔽₂ is trivial and E₂=GL₂≃S₃; its commutator is A₃, so finite perfectness fails.
- For n=1 and D=ℍ, the unit −1 is in the determinant kernel but not in E₁.
- At n=0 there is one matrix and Δ₀=1; no first-pivot operation is called. Over ℚ this map misses −1, so surjectivity in size zero is false. The native commutative specialization is the negative-control target `sizeZero_det_not_surjective` in Suggested.lean.
- Over ℚ, [[1,2],[3,4]] has value −2; the swap has value −1. Over 𝔽₅ the abelianized value of every 3×3 matrix agrees with its native determinant.

### 8.4 The real algebraic circle

Let A=ℝ[x,y]/(x²+y²−1). Prove A is a Dedekind domain. Establish the domain assertion from irreducibility, then cover Spec(A) by D(1+x), D(1−x): their defining elements sum to 2. On the chart s=1+σx, σ∈{±1}, put t=y/s. The formulas x=σ(1−t²)/(1+t²), y=2t/(1+t²), s⁻¹=(1+t²)/2 identify the chart with ℝ[t,(1+t²)⁻¹]. They give regular dimension one, including the overlap compatibility. A Jacobian criterion may provide a second proof, but must carry its finite-type and characteristic-zero hypotheses.

The determinant-one matrix M=[[x,−y],[y,x]] has nonzero class in SK₁(A). Define `circleEvaluation` into continuous functions on S¹, and prove evaluation of a finite elementary word is nullhomotopic after stabilization. The direct contraction obtained by scaling elementary coefficients is corrected at the circle basepoint by H(t,z)H(t,1)⁻¹, so it is a based contraction. Construct `specialLinear_QR_deformation` for N≥2: use the unique continuous QR decomposition A=QU with U upper triangular and positive diagonal. Set V_t=(1−t)U+tI and H_t(A)=QV_t/(det V_t)^{1/N}. Its determinant denominator is positive for 0≤t≤1, H_0(A)=A, H_1(A)=Q, and it fixes SO_N pointwise. This gives the continuous deformation retraction needed for the loop comparison (Morris §7.1, Theorem 7.1.1 and Exercises 1, 3–4, pp. 152–154).

For every N≥2, the evaluated rotation loop in SO_N has a lift through the supplied real Spin covering beginning at 1 and ending at −1. Use the ordered pair of coordinate vectors and the half-angle parameter in `spinRotationPath`; verify its projection is precisely the rotation chosen for M. Since −1≠1 over ℝ, covering homotopy lifting rules out a based nullhomotopy. Install the compactness and nonzero-dimension assumptions of the covering theorem at this point. It follows that no stabilized M is elementary (Weibel III.1.5.4, p. 185). This target proves nonvanishing; the stronger full computation SK₁(A)≃ℤ/2 is not inferred from it.

**Checks.**

- At (x,y)=(1,0), M is the identity; at (0,1), it is a quarter turn with the displayed orientation.
- The full 2π rotation projects to a closed SO loop while its Spin lift ends at −1. A 4π rotation has a closed lift and is not distinguished by this argument.
- The chart proof uses 2 invertible; it does not assert the same presentation is smooth in characteristic two.
- Adding identity blocks preserves the projected rotation and the nonclosed lift. A proof only in SO₂ would not establish stable nonvanishing.
- The plus chart sends t=0 to (1,0) and t=1 to (0,1); the minus chart sends 0 to (−1,0). Replacing 2t by t gives (0,1/2), outside the circle. The chart maps and their inverses recover x+y.
- Evaluation sends xy+a to Re(z)Im(z)+a. At Spin parameter π/4 the projection is the positive quarter turn; at π it is identity with lift −1, and stabilization fixes the third coordinate.
- The SO retraction fixes the identity and quarter turn. It cannot fix diag(2,1/2), which has determinant one but fails to preserve the standard quadratic form.

### Examples

The three matrices diag(−1), [[0,−1],[1,0]], and the circle matrix distinguish a determinant unit, a finite rotation with elementary class, and a parametrized rotation with nontrivial stable class. Over ℍ the first of these becomes a commutator. Over 𝔽₂ the determinant cannot detect the finite S₃ commutator defect.

### Dependencies

Layers 6–7, supplied finite matrix generation, group abelianization, division-ring elimination and quaternion norm. The circle application additionally uses real polynomial geometry, continuous matrix groups, the local QR/polar retraction target and the supplied Spin covering/path lifting contracts.

## Layer 9: relative groups, doubles and valuation boundaries

### 9.1 Relative elementary and linear groups

For a two-sided ideal I⊲A, define `RelativeGL n A I` as ker(GL_n(A)→GL_n(A/I)); its stable colimit is GL(A,I). Define E_n(A,I) as the normal closure **inside E_n(A)** of eᵢⱼ(x), x∈I, i≠j. Stabilization gives E(A,I). Their API includes inclusion in the congruence subgroup, monotonicity in I, functoriality for maps of pairs, finite-word representatives, stabilization and compatibility with products of rings. Distinguish this normal closure from the bare subgroup generated by ideal transvections and from a normal closure in all GL_n(A) (Weibel III.2, p. 193).

Prove the stable relative Whitehead identities E(A,I)=[GL(A),GL(A,I)]=[E(A),E(A,I)], ambient normality, and abelianness of GL(A,I)/E(A,I). Define that quotient as `RelativeK1 A I`, with its universal map, functoriality, quotient induction and the inclusion-induced ι:K₁(A,I)→K₁(A). Its kernel is (E(A)∩GL(A,I))/E(A,I); it is not defined as ker(K₁(A)→K₁(A/I)). Prove exactness at K₁(A) and K₁(A/I) in the longer sequence below, without assuming GL_n(A)→GL_n(A/I) surjective (Weibel III.2, Lemma 2.1 and Proposition 2.3, pp. 193–194).

For commutative A define `RelativeUnits A I` as units congruent to 1 modulo I. Relative determinant and the size-one section give K₁(A,I)≃RelativeUnits(A,I)×SK₁(A,I), with the latter its determinant kernel. If I⊆Jac(A), row reduction proves SK₁(A,I)=0 and ι injective. Here the hypothesis means containment in the Jacobson radical, not the predicate that I is a radical ideal. If A→A/I has a ring section, prove ι injective and the split product K₁(A)≃K₁(A/I)×K₁(A,I) (Weibel III.2.4, p. 194, and Ex. 2.7, p. 197).

**Checks.**

- I=0 gives trivial relative GL, E and K₁. I=A gives their absolute versions, including n=0 and n=1 with no elementary roots.
- For A=k[ε]/ε² and I=(ε), relative determinant identifies K₁(A,I) with 1+εk; its multiplication is addition of coefficients.
- In the upper-triangular algebra T₂(k), the strictly upper-triangular ideal J has K₁(T₂(k),J)=0, whereas K₁(k⊕J,J)≃(k,+). The same nonunital ideal does not determine relative K₁ (Weibel Ex. III.2.3, p. 196).
- A squarefree ideal such as (6)⊂ℤ is radical but not contained in Jac(ℤ)=0. The Jacobson-radical theorem cannot be invoked for it.
- In A=ℤ/p²ℤ with I=(p), relative K₁ consists of 1+pa, a∈𝔽_p, and has p elements, including at p=2. This is not the full unit group of A.

### 9.2 Relative K₀ boundary and the two module sides

For a two-sided I⊲A, prove `relativeK0_opposite`: the supplied augmented-ring kernel on left projectives agrees with its right-projective version at Aᵒᵖ under the identity equivalence of module categories. This comparison is distinct from duality. The augmented coordinates satisfy pr(r,x)=r and add(r,x)=r+x; passing to the opposite ring preserves these two maps and the diagonal section separately. The comparison therefore respects the map to absolute K₀, pair maps, and central-idempotent factors. If I=eA for a central idempotent, identify its relative class with the K₀ class of the e-factor and check that add, rather than pr, gives that class (Weibel II.2.5, pp. 73–74; the explicit coordinate and module-side calculation).

Prove `relativeK0Boundary_opposite_transpose` for the supplied boundary: δ^ℓ([a])=δ^r([aᵀ]), normalized as [freePatch(a)]−n[double] in the row model and its column counterpart in the opposite ring. This is the relative specialization of §1.4, and transports the supplied exact sequence

    K₁(A,I) → K₁(A) → K₁(A/I) → K₀(A,I) → K₀(A) → K₀(A/I).

at each interior term to the displayed left-projective convention. Neither initial injectivity nor terminal surjectivity is claimed. The right-projective variant has K₀^r and δ^r and is used in Layer 13. Check that the supplied relative triple (P,Q,α) still has forgetful class [P]−[Q]. Reversing α reverses the boundary; passing to the opposite module side with transpose does not. These are different operations (Weibel II.2.5 and 2.10, pp. 73–74, 77; III.2.3, pp. 193–194).

**Checks.**

- I=0 gives double A and relative K₀=0; I=A gives double A×A and relative K₀≃K₀(A) through the second projection.
- For I=2ℤ, (1,2)²=(1,8), not (1,4); its two pullback coordinates are (1,3) before squaring and (1,9) afterward.
- K₀(ℤ,2ℤ)=0. This is the nonunital K₀ of 2ℤ and is not K₀ of the category of ordinary ℤ-modules with underlying abelian group contained in 2ℤ.
- A transition matrix lifted from either endpoint has zero patch boundary, while the ℤ×_{𝔽₅}ℤ example in Layer 1 has a nonzero one.
- For A=k×k and I=k×0, the central-idempotent comparison sends a relative class n to the first-factor class (n,0) under add; pr kills it. This tests which projection is used.

### 9.3 Localization, Euler classes and a DVR calculation

For a central multiplicative set S, use the supplied category of S-acyclic perfect complexes of right A-modules and its K₀^r; the left-module version is the same construction at Aᵒᵖ. Over commutative A these are the existing single K₀ and supported K₀. Construct the concrete boundary K₁(S⁻¹A)→K₀(A on S), sending an integral S-isomorphism α to the positive cokernel class when S consists of nonzerodivisors. More generally use its two-term cone, in the degree convention whose Euler class is [target]−[source]. Prove clearing-denominator independence, multiplicativity and naturality, and the exact sequence through K₀(A)→K₀(S⁻¹A). This applies to arbitrary multiplicative sets; a theorem only about quasi-compact open immersions is insufficient (Weibel III.3, Lemma 3.1 and Corollary 3.1.1, pp. 198–199).

Let O be a DVR with fraction field L, residue field k and uniformizer π. Dévissage identifies the torsion K₀ with ℤ[k]. For g∈GL_n(L), choose 0≠s∈O with α=sg integral. Then α is injective and

    ∂[g]=(length_O coker α − n length_O(O/sO))[k]
          =ord_π(det g)[k].

Prove independence of s, additivity under multiplication, block sum and base change, ∂[π]=[k], and exactness 1→K₁(O)→K₁(L)→ℤ→0. The splitting of the valuation uses the chosen π and changes with that choice, while the boundary does not. For a finite extension of DVRs, distinguish ramification in scalar extension from residue degree in transfer: the uniformizer order scales by e under extension, whereas the torsion transfer of a residue-field generator has coefficient f (Weibel III.3, pp. 198–201; II.7, dévissage and Euler classes).

**Checks.**

- For O=ℤ₂ and g=(12), ∂[g]=2[𝔽₂]; clearing by s=2 gives length(ℤ₂/24)−length(ℤ₂/2)=3−1.
- The matrix [[π,1],[0,1]] has boundary [k], and diag(π,π⁻¹) has boundary zero despite nonintegral entries.
- The inverse uniformizer has boundary −[k]. A formula using the opposite two-term grading would fail this check.
- For ℤ[i] localized at (1+i), the element 2 has valuation two. Its boundary is 2[𝔽₂], while the residue degree over ℤ at 2 is one.
- Size zero and an integral invertible matrix have zero boundary.

### Examples

The double calculation keeps the mixed xy term visible, and the dual-number example distinguishes the relative unit group from the additive ideal only after proving the square-zero formula. The valuation computation fixes the positive generator needed when Layer 13 compares matrix boundaries to K-space boundaries.

### Dependencies

Layers 1, 6–8; ring pullbacks, ideal quotients, relative normal closures and the supplied perfect-complex localization/dévissage. Layer 13 supplies the based comparison with relative homotopy groups and its sign; no higher excision is used.

## Layer 10: Mennicke symbols and extension in finite rank

### 10.1 Universal symbols and their reciprocity

For a commutative A and ideal I define `MennickePairs A I` to be pairs (a,b) with a−1,b∈I and aA+bA=A. Define `IsMennickeSymbol s` for a map to an arbitrary group C by the following relations: s(1,0)=1; s(a,b+ta)=s(a,b) for t∈I; s(a+tb,b)=s(a,b) for t∈A; and s(a,b₁b₂)=s(a,b₁)s(a,b₂) whenever the displayed pairs are admissible. Write s(a,b)=[b/a]. The asymmetry in the two elementary moves is intentional. The presented group `UniversalMennicke A I` represents this predicate, with generator, relation, recursor, uniqueness and generator-extensionality theorems. An ideal inclusion J≤I induces C_J→C_I (BMS §2, Definition 2.5 and (2.6), pp. 65–67).

For a Dedekind domain and 0≠J≤I prove that transition surjective, using descent to a deeper pair. Prove the Mennicke–Newman common-denominator lemma for finitely many pairs. Over an arbitrary commutative A prove the near-unit reduction: if either a is congruent modulo b to a unit of A or b is congruent modulo a to a unit of A, the symbol is 1, and (a,b) is equivalent to (a,b(1−a)). For Dedekind A, choose q∈I, a≡1 mod q. The rule b mod a↦[bq/a] is a well-defined homomorphism (A/aA)ˣ→C killing global units, and any finite set of symbol values lies in one such image. It follows that the image of every Mennicke symbol is abelian, even when C is not (BMS Lemmas 2.1–2.9, pp. 65–68).

Prove Kervaire reciprocity [aq/d]=[dq/a] when a,d≡1 mod q and aA+dA=A, and Lam's denominator multiplication [b/(a₁a₂)]=[b/a₁][b/a₂] on admissible pairs. Its proof uses common denominator and reciprocity, not commutativity of C as an unproved axiom. Extend the symbol to nonzero ideals b⊆I prime to a, with (a,b) specializing to (a,bA), invariance a↦a+x for x∈b, and multiplication in both the ideal and scalar entries. Prove independence of the auxiliary ideal chosen to make b principal (BMS Lemmas 2.10–2.11 and Proposition 2.13, pp. 68–71).

**Checks.**

- I=0 has only (1,0) and C₀=1; the nonzero-ideal descent proof is not used for it.
- [b/1]=[0/u]=1 for a unit u≡1 mod I. A map satisfying only the moves but failing numerator multiplication does not qualify.
- For A=ℤ and I=A the Euclidean algorithm makes C_A trivial. For the real circle ring, its map to SK₁ detects a nontrivial symbol.
- Taking C=C₂×S₃ does not permit reordering arbitrary elements of C. Only values in the symbol image have been proved to commute.
- Restriction C_J→C_I points from the smaller ideal to the larger one. The universal property alone does not imply its surjectivity for arbitrary rings.

### 10.2 From matrices to symbols and Kubota's homomorphism

Define `firstRowPair` on GL₂(A,I). Prove it surjects onto MennickePairs, already on SL₂(A,I), by an explicit Bézout completion whose lower-left entry is in I and lower-right entry is 1 modulo I. Its fibres are left cosets of lower-triangular matrices [[1,0],[t,u]], t∈I and u∈Aˣ congruent to 1; for SL₂ set u=1. Prove the precise quotient equivalence rather than assuming a preferred completion (BMS Lemma 5.3, p. 101).

For n≥3, a homomorphism κ:SL_n(A,I)→C invariant under conjugation by E_n(A) yields a unique Mennicke symbol through the first-row map on the upper-left SL₂. Derive relative-elementary triviality, the two moves and MS2 from explicit three-by-three products. In the stable group the completion defines `specialK1Symbol : MennickePairs A I→SK₁(A,I)`. Give independence, transpose/inverse formulas and naturality. For Dedekind A show these symbols generate relative SK₁; the complete finite-rank universal theorem follows in §10.7 (BMS Theorem 5.4, pp. 101–103; Weibel Ex. III.1.10 and III.2.5, pp. 190, 196).

Conversely for a Dedekind A and a Mennicke symbol s, define `kubotaValue g=s(firstRowPair g)` on GL₂(A,I). Prove κ([[a,b],[c,d]])=[b/a]=[c/d]⁻¹, hence κ(gᵀ)=κ(g)⁻¹. Prove invariance under elementary and diagonal conjugation, and triviality on E₂(A,I) and on congruence diagonal matrices. First prove the conditional product formula when d and a' are coprime and both 1 modulo some q∈I, with the multiplication order κ(g'g)=κ(g')κ(g). For I≠0 reduce to a deeper principal level, use semilocality of A/q²A to adjust the matrix, and replace d by d+tc² to arrange coprimality with a'. This gives multiplicativity for all g,g'. Handle I=0 separately. The resulting `kubotaHom` is natural in symbols, ideal inclusions and ring isomorphisms. Its restriction to every nonzero deeper principal congruence subgroup has the same image, so the kernel of a nontrivial symbol contains no nonzero congruence level (BMS Theorem 6.1 and proof steps 1–6, pp. 103–105).

**Checks.**

- Different Bézout completions of (a,b) differ by the specified lower-triangular fibre and have the same symbol. At level 2 over ℤ, [[5,2],[12,5]] has first-row pair (5,2); (3,2) is admissible at level 2 and fails the level-4 congruence.
- At level 2, κ(diag(−1,1))=1 and κ([[-1,2],[-2,3]])=1. These follow from the global-unit relation, despite the matrices being nonidentity.
- On [[1,t],[0,1]] and a congruence diagonal matrix κ=1, including t=0 and I=A.
- Transpose inverts κ; a transpose-invariance assertion without the inverse has the wrong normalization.
- A product formula proved only when d and a' are coprime is an intermediate result. The deeper-level adjustment is required for a homomorphism on all GL₂(A,I).

### 10.3 Relative stable range and the extension hypotheses

Define `RelativeUnimodularColumn A I r` as a unimodular column congruent to e₀ modulo I, with its GL_r(A,I) action. From HasStableRange A k, prove shortening for r>k with coefficients in I by first replacing the last coordinate by its square. Prove E_r(A,I)-transitivity for r>k and reduction GL_r(A,I)=GL_k(A,I)E_r(A,I). For r>k obtain normality in GL_r(A). Under r>k and r≥3 prove [E_r(A),E_r(A,I)]=E_r(A,I) and [GE_r(A),GL_r(A,I)]=E_r(A,I); the first equality does not say that E_r(A,I) itself is perfect. The full commutator equality with GL_r(A) requires r≥2k and r≥3. Record all three bounds separately. Here GE is generated by elementary and diagonal matrices. A Dedekind domain has the additional GL₂(A,I)-transitivity from Bézout completion (BMS Lemma 7.3, Theorems 7.4–7.5, pp. 106–107).

For existence of standard forms in the step GL_n→GL_{n+1}, n≥2, the uniform ring assumptions are stable range ≤n and GL_n(A,J)-transitivity on relative unimodular columns for **every** ideal J. The latter cannot be replaced by transitivity at the one fixed I: the standard-form proof uses other ideals. For the general extension step from rank r to r+1, r≥3, use stable range ≤r−1 and uniform GL_{r−1}(A,J)-transitivity for every ideal J; these imply the rank-r hypotheses but additionally supply the smaller-block interchange. The weaker standard-form hypotheses alone do not prove the full extension theorem. Dedekind rank two is treated by the special argument in §10.6. Keep the source's indexing conversion: its condition (7.2)_m means Bass stable range ≤m−1.

Define `OrientedRelated I t g h` by a witness matrix X, X₀₀∈I, such that g has first column e₀+t·X_col₀ and unscaled remainder X, while h has first row e₀ᵀ+t·X_row₀ and the same lower-right block. Thus the scaling moves from the first column to the first row. Its API includes the witness constructors, preservation under compatible products, the determinant equality, and the fact that after one stabilization g⁻¹h lies in [E,GL(I)]. This is an oriented relation, not an equivalence relation (BMS (8.4) and Lemma 8.8, pp. 107–109).

Define `ExtensionConditions κ` for a homomorphism GL_n(A,I)→C to mean: it kills E_n(A,I); it is invariant under conjugation by GE_n(A); its kernel is stable under transpose; and κ(g)=κ(h) whenever t∈I and OrientedRelated I t g h. Its API provides restriction, transport, the Kubota instance and passage to the extended map. Value naturality under postcomposition holds for every group homomorphism C→D. Transpose-kernel stability after arbitrary postcomposition does not follow formally: transport the full conditions along an injective homomorphism, or supply a separate proof of the kernel clause (BMS (8.2)–(8.4), Propositions 8.5–8.6, pp. 107–108).

**Checks.**

- At I=0, relative columns consist only of e₀, and all relative maps have trivial image. At level 2 over ℤ, (3,2,0) is a relative unimodular column, (2,1,0) fails congruence and (3,6,0) fails unimodularity.
- The trivial κ satisfies ExtensionConditions. The identity of GL₂(ℤ) does not, because it fails to kill e₀₁(1); transporting a valid κ along a target group isomorphism preserves all four clauses.
- For I=A and t=1, OrientedRelated forces g=h. For t=0 it need not be reflexive or symmetric: e₀₁(2) can be related to 1 over ℤ, but not conversely with that witness shape.
- At rank four, replacing transpose by reflected transpose moves e₀₁(t) to e₁₃(t), not e₂₃(t).
- Postcomposition can enlarge a kernel. A proof using injectivity is not silently applied to a quotient of C.
- The stable E-perfectness statement requires three distinct root indices; rank two does not satisfy that proof's hypotheses.
- E₃(ℤ,2ℤ) is not perfect: its self-commutators are identity modulo 4, while e₀₁(2) is not. Commuting with absolute elementary matrices, rather than only relative ones, is essential in the displayed equality.

### 10.4 Standard forms and their values

Define the overlapping corner matrices L(a,y)=[[a,y],[0,1]] and R(b,p)=[[1,p],[0,b]], with a,b of size n, y a column and p a row, embedded at the first and last n coordinates of n+1. Their API includes membership in GL_{n+1}(A,I), inverse and multiplication:

    L(a,y)L(b,z)=L(ab,az+y),
    R(a,p)R(b,q)=R(ab,q+pb).

Define `StandardForm I g` as data g=L(a,y)e_last,0(t)R(b,p), with corner matrices at level I and t∈I. The lower-left entry of g is t. Prove existence under the uniform stable-range/transitivity hypotheses using reduction of the first column and relative elementary completion. The data need not be unique (BMS Lemma 8.9, pp. 109–110).

For κ satisfying ExtensionConditions, define `standardFormValue κ s=κ(a)κ(b)` in that order. Prove invariance under changing the standard form, using the oriented relation and the kernel hypotheses. The independence lemma assumes two given forms and the conditions on κ; it does not itself need the ring's existence hypotheses. Once existence is established, define `extendedValue` by choice and prove its specification, independence, normalization f(1)=1, f(L(a,y))=κ(a), f(R(b,p))=κ(b), and covariance under multiplication on the left by type-L matrices and on the right by type-R matrices. Prove naturality under ideal maps where the conditions are transported and under postcomposition on values. Multiplicativity on all matrices is a later target (BMS Corollary 8.10, Lemmas 8.11–8.12 and §9, pp. 110–114).

**Checks.**

- For the identity form a=b=1, y=p=0, t=0, the value is 1.
- When n=1 the corner formulas remain meaningful, but the extension theorem still assumes n≥2.
- In a target such as ℚˣ×S₃, corner determinants give equal values from two forms without allowing arbitrary noncommuting target elements to exchange order.
- The lower-left entry determines t; the remaining form data can vary. A uniqueness-of-data theorem would be false. For n=2, e₀₁(2) has a form with a=e₀₁(2), b=1 and another with a=b=1, y=0, p=(2,0); both values are 1 when κ kills elementary matrices.

### 10.5 Multipliers, normalizers and reflected transpose

For a function f:G→C with f(1)=1 define `MultiplierSubgroup f` by h∈H iff ∀x, f(hx)=f(h)f(x). Prove it is a subgroup, f restricted to H is a homomorphism, and H=G exactly when f is multiplicative. Define `ValueConjugationStabilizer f` by g∈N iff ∀x, f(gxg⁻¹)=f(x). Prove it is a subgroup normalizing H. This condition preserves all values, which is stronger than merely preserving ker f. For the standard-form value, prove type-L matrices belong to H, suitable elementary and diagonal matrices belong to N, and GE_{n+1}(A)⊆N suffices to finish multiplicativity using relative reduction (BMS §9, pp. 112–115).

The kernel-transpose hypothesis defines an anti-isomorphism on im κ: send κ(g) to κ(gᵀ), viewed in the opposite group. Prove well-definedness on the image, its square and the product rule. Do not extend it to all C without a surjectivity hypothesis. Define `reflectedTranspose` by transposition followed by swapping the first and last indices, fixing all interior indices. It exchanges type L and type R with the corresponding endpoint reindexing of y,p. Prove the reflected formula for f, whose values all lie in im κ, and use it to show N is stable under reflected transpose. Establish that the interior diagonal group, e₀₁(t) for every t∈A, and the last-column elementary roots belong to N. The final transposition of the last two coordinates then supplies the remaining generators of GE and finishes H=G (BMS Lemmas 9.1–9.8 and §10, pp. 112–119).

**Checks.**

- For a homomorphism f every element is a multiplier. The constant-one function has H=N=G.
- Preserving only the identity fibre of an arbitrary f does not imply membership in N. For f=id on S₃, N is its trivial centre, while every conjugation preserves its kernel.
- For f(x)=x² on S₃, a transposition fails the multiplier identity against a different transposition: their product has a nonidentity square. Thus f(1)=1 alone does not make H=G.
- The image anti-isomorphism can be used on κ(a)κ(b); it is not a declared operation on an unrelated element of C.
- Endpoint reflection fixes interior indices. Full reversal gives a different formula already in rank four.
- The elementary parameter in the normalizer proof ranges over all A, while the matrices on which f is evaluated remain at level I.
- GE₁(A)=GL₁(A). Over ℤ, diag(−1,1) lies in GE₂ and fails to lie in E₂ by determinant; a permutation matrix in rank three lies in GE₃. These distinguish the elementary, diagonal and ambient groups.

### 10.6 The last interchange, including rank two

For the general step r≥3, use stable range ≤r−1 and relative transitivity in rank r−1 uniformly in the auxiliary ideal. Reduce the first column of the corner matrix to standard form except at its last coordinate. Carry out the two-column elementary calculation giving the new leading coefficient a' after the last-row multiple has been subtracted. Exhibit the elementary columns β,δ, establish their level membership and compare κ of the old and new corners. This proves invariance under the final coordinate interchange and completes the normalizer argument. State both the stable-range hypothesis and the uniform transitivity hypothesis; the latter is not inferred at an unavailable endpoint (BMS §10, pp. 115–118).

For r=2 over a Dedekind domain use the separate Bézout adjustment. With I≠0 choose s∈I so that c=1+sy₁ is nonzero and a₀₀ is coprime to t+s(a₁₀+ty₁), after the preliminary nonzero adjustment of a₀₀. Construct the SL₂ completion ω at level I. The transformed corner β has first row (a₀₀c, sd−tca₀₁). Apply Lam's denominator identity and the near-unit relation [sd/c]=1 to prove κ(ω)⁻¹κ(β)=κ(a). This gives exactly the missing interchange identity. Handle I=0 with trivial relative matrices instead of making a nonzero choice from it (BMS §10, pp. 118–119).

Having proved multiplicativity, package `extendedHom`; prove restriction to the original corner, elementary triviality, uniqueness among extensions with the required conjugation invariance, and all ExtensionConditions for the new rank. Iterate to compatible κ_n for n≥2. The theorem is for arbitrary C; abelianness of the image is a consequence of the symbol theory. Do not assume it to justify rearranging corner factors (BMS Propositions 8.5–8.6 and conclusion of §10, pp. 107–108, 119).

**Checks.**

- The zero ideal bypasses the nonzero Bézout choice; the unit ideal is allowed in the nonzero branch.
- A proof using stable range ≤r−1 is not applied to r=2 for a general Dedekind domain, whose available bound is two.
- With κ given by determinant into ℚˣ×S₃, the two standard forms of diag(2,1,1) both yield (2,1); the argument still respects the declared multiplication order. The right corner diag(1,1,2) also has value (2,1), while the last-coordinate interchange has value (−1,1).
- Every iterated extension restricts to the original rank-two value. Uniqueness is tested on that corner and the elementary generators, not on one preferred decomposition.

### 10.7 Finite-rank universal defects

For a Dedekind domain and n≥3 define `FiniteLevelDefect n A I := SL_n(A,I)/E_n(A,I)`. First prove E_n(A,I)=[SL_n(A),SL_n(A,I)], so the quotient and its centrality in the relevant ambient quotient are justified. The rank-two first-row symbol induces a canonical equivalence C_I≃FiniteLevelDefect n A I, natural in ideal inclusions. Prove stabilization is an isomorphism, rank-two generation modulo E, and compatibility with stable SK₁(A,I). In particular the finite defect is a determinant-one quotient, not the quotient of all GL_n(A,I). For the latter, retain its relative unit factor and prove the corresponding stability/injectivity statements through the finite-rank extension theorem (BMS Theorem 4.1, Corollary 4.2 and §11, pp. 94–96, 119–121).

**Checks.**

- Over a field at the unit ideal, n≥3 gives trivial defect. Rank two over 𝔽₂ has the separate finite perfectness obstruction and is outside this theorem.
- I=0 gives the trivial quotient; I=A gives the usual stable SK₁ in the stated range.
- A congruence diagonal matrix with determinant u≠1 belongs to the relative GL quotient and not to the SL defect.
- The equivalences for n and n+1 commute with the same first-row symbol; an abstract group isomorphism without this normalization is insufficient for the arithmetic transition maps.

### Examples

The universal symbol has noncommutative targets in its universal property, while its image over a Dedekind domain is abelian. The standard-form argument explains how this rank-two information extends to a stable invariant: common rows, the oriented relation, multiplier subgroups and the final interchange each have a separate role. At no stage is multiplicativity of the chosen standard-form value assumed before it is proved.

### Dependencies

Layers 6–9, Dedekind ideal factorization and Chinese remainders, semilocal stable range, relative column completion and presented groups. The generic extension theorem and its special rank-two proof supply the finite-rank bridge used in the arithmetic layer; they require no class field theory.

## Layer 11: arithmetic defects and congruence kernels

### 11.1 Arithmetic rings, prime choices and units

Let F be a number field, S a finite set of finite primes, A=O_{F,S}, and S∞ its archimedean places. A has stable range at most two. From finiteness of the ideal class group choose a single nonzero element whose prime support is S; this identifies A with an ordinary localization of O_F. Consume the existing localization and finite-generation theorems, retaining the choice dependence of this one-element presentation (BMS Appendix, pp. 81–84).

State `primeIdeleCoset_infinite`: every coset of an open finite-index subgroup of the idele class group contains infinitely many prime idele classes. Deduce infinitely many primes with Np≢1 mod m when F lacks a primitive m-th root, excluding any fixed finite set. State the precise Dirichlet approximation target: nonzero coprime a,b∈A, an auxiliary finite set T outside S∞∪S prime to b, local cosets x_vV_v with ord_v x_v≥0 at T, and open V_v⊆F_vˣ for v∈S∞∪S∪T, at least one of which has finite index at a place of S∞∪S. There are infinitely many new primes p and c≡a mod b with c in those local cosets and cA=p∏_{v∈T}v^{ord_v x_v}. Include its sign-prescribed principal-prime specialization and avoidance of finite sets (BMS Appendix (A.7)–(A.11), pp. 82–84). These are consequences of the supplied class field theory/approximation interfaces, not a new reciprocity map.

Prove `localPowerSymbol_artin`: for a local field K containing μ_m, with m≥1 prime to char(K), the supplied local symbol is normalized by (a,b)_m=Art_K(b)(α)/α, α^m=a, where a,b≠0 and Art uses arithmetic Frobenius on unramified extensions. This is the degree-m comparison beyond the quadratic comparison, not a replacement reciprocity map. Establish its continuity, factorization through Kˣ/(Kˣ)^m, nondegenerate bimultiplicativity, (a,b)=(b,a)⁻¹, (a,1−a)=1 when both entries are nonzero, and compatibility (a,b)_m^{m/d}=(a,b)_d for positive d∣m. Prove the power subgroup open of finite index. For a nonarchimedean K of residue size q, m prime to its residue characteristic, and a a unit, (a,b)_m is the lift of a^{(q−1)/m} raised to ord(b); here μ_m⊂K implies m∣q−1 (BMS (A.13)–(A.16), pp. 85–86).

For K/ℚ_p finite with μ_{pⁿ}⊂K, put e=ord_K(p)>0, U(0)=O_Kˣ, U(h)=1+𝔪_K^h for h≥1 and j=min(n,max(0,floor(h/e−1/(p−1)))). Prove `localPowerSymbol_higherUnits`: the images of U(h)×O_Kˣ and U(h+1)×Kˣ under the pⁿ-symbol are both μ_{p^{n−j}}. For a∈U(h), ord(b)≥h, the pʲ-symbol depends only on a modulo b and is 1 when ord(b)=h. Retain e, including ramified fields. Prove the global product of the local symbols is 1, with almost all factors 1, and identify the ideal power-residue symbol with the product of tame factors. These are explicit comparison targets on the supplied local/global reciprocity objects; they provide the dictionary used by power reduction and defect orders (BMS (A.17)–(A.21), pp. 86–90).

For a prime ℓ and ℓⁿ the exact ℓ-primary order of μ(F), prove `twoPrimeDenominator`: any Mennicke pair at nonzero level is equivalent to one whose first entry generates a product of two distinct primes with Np≢1 mod ℓⁿ⁺¹; in the stated sufficiently deep case retain the original numerator and impose the principal progression. Use the norm restriction and cyclic residue units to bound every symbol's ℓ-primary exponent. Add the power-reduction lemma with its actual exponent: for ℓⁿ the exact ℓ-primary order of μ(F), a pair (a,b) at level I can be moved to (a',c^{ℓⁿ}q), with q∈I and a'≡1 mod q, except when F is totally imaginary and the power-residue symbol (b/a)_{ℓʲ} is nontrivial, where j=j_ℓ(I) is the truncated local-depth exponent of §11.2. The local-depth exponent specifies the obstruction; it is not substituted for n in the numerator power. The real-place and S-inverted-prime cases remove the exceptional symbol. The proof uses both local power-residue reciprocity and the chosen prime progression (BMS Theorems 3.2 and 3.5, pp. 72–77).

The S-unit rank is a new conclusion from existing unit objects. For h=classNumber(F)>0 and v∈S choose a_v with (a_v)=vʰ. Then a_v is an S-unit and its supplied valuation vector is −h e_v; a_v⁻¹ gives +h e_v. Prove hℤ^S lies in the valuation image, its index is finite and its rank is |S|. Combine the kernel identified with ordinary units and their Dirichlet rank to obtain rank Aˣ=r₁+r₂+|S|−1 and torsion μ(F). A choice of basis of the free quotient gives Aˣ≃μ(F)×ℤ^{r₁+r₂+|S|−1}; the decomposition is not canonical. For S=∅ the valuation image has rank zero and index one (Serre 1970 §1.1, p. 490; BMS (A.4), p. 82; the principal-power argument follows directly from the class-group exponent).

**Checks.**

- For F=ℚ and S={p}, units are {±pⁿ}, and the supplied valuation sends p to −1.
- For F=ℚ(i), S=∅, unit rank is zero and the torsion has order four; for a CM quartic field it has positive rank.
- The prime-approximation theorem keeps its one finite-index local condition. An arbitrary open subgroup at an inverted nonarchimedean place need not have finite index.
- The two primes are chosen distinct and away from ℓ and the existing bad set. A product with a repeated prime need not have the asserted cyclic-unit exponent bound.
- For S=∅ no uniformizer powers are chosen; the ordinary-unit kernel supplies the whole group.
- In ℚ₇ choose ζ₃ reducing to 2. Then (3,7)₃=ζ₃ and (7,3)₃=ζ₃⁻¹. Reversing the Artin arguments changes this value.
- Over ℝ the quadratic symbol is −1 exactly for two negative entries; over ℂ every symbol is 1. For a=b=−1 over ℚ the nontrivial factors at 2 and infinity multiply to 1.
- For K=ℚ₂(i), n=2 and e=2, h=4 gives j=1 and higher-unit image μ₂; h=6 gives j=2 and trivial image. Replacing e by 1 would give an incorrect depth. At h=4 and ord(b)=4 the lower-order symbol in the congruence formula is 1.

### 11.2 Explicit orders of the finite defects

For a totally imaginary F, let m=|μ(F)| and 0≠I⊆O_F. Define `defectExponent F I p`, for p∣m, as

    min over all primes P above p of
      min(ord_p m, max(0, floor(ord_P(I)/ord_P(p) − 1/(p−1)))).

Define `defectOrder F I = ∏_{p∣m} p^{defectExponent F I p}`. All P above p occur in the minimum, including those not dividing I. The denominators ord_P(p) and p−1 are positive. Its API includes nonnegativity, the cap by ord_p m, independence of the finite enumeration, r(I)∣m, r(O_F)=1, monotonic divisibility r(I)∣r(J) for 0≠J≤I, and the full-depth criterion: if ord_P(I)≥ord_P(p)(ord_p(m)+1/(p−1)) for every p∣m and every P above p, then r(I)=m. Zero level is excluded from this finite-order definition (BMS (3.3), p. 74; Theorem 3.6, pp. 77–78).

Construct `arithmeticSymbol` [b/a]↦(b/a)_{r(I)}, with value 1 when b=0. Prove its MS relations, surjectivity, universality and kernel characterization, using the prime-power reduction. Thus C_I≃μ_{r(I)} canonically for totally imaginary O_F. For A=O_{F,S} when S≠∅ or F has a real place, prove C_I=1 for all nonzero I; localization descent and the real/nonarchimedean power-reduction cases are essential. At the unit ideal the defect is trivial in every case. Consequently SK₁(O_{F,S})=0 and the determinant identifies K₁(O_{F,S}) with Aˣ (BMS Theorem 3.6 and Corollary 4.3, pp. 77–78, 95–96).

For 0≠J≤I the transition C_J→C_I corresponds to z↦z^{r(J)/r(I)}, not inclusion of roots. At sufficiently deep cofinal levels r=m, the transitions are identities and the projection to level I is z↦z^{m/r(I)}. Prove compatibility with composition and with the fixed residue-symbol normalization. For finite extensions of number fields use the corrected power-residue functoriality of Serre 1974: the exponent is determined by the norm on roots of unity, not by a formula in only the degree and the two root counts. Define this exponent through the unique endomorphism of μ(F) determined by N(ζ') and (ζ')^{m'/m}; give well-definedness, tower and symbol-transfer laws (Serre 1974 Theorems 1–4, pp. 241–244). Do not use the false formula in BMS (A.23)(b).

**Checks.**

- For F=ℚ(i), P=(1+i), r(Pʰ)=1 for h≤3, 2 for h=4,5, and 4 for h≥6. The ramification denominator is two.
- In F=ℚ(i,√−7), two primes P₁,P₂ above 2 both have ramification two. Then r(P₁⁶P₂⁴)=2 and r(P₁⁶)=1: omitting P₂ from the minimum would give a false answer.
- In F=ℚ(ζ₃), m=6 and the levels (6),(12),(18),(36) have respective orders 1,2,3,6.
- For a Gaussian level with r(J)=4 and r(I)=2, the transition sends i to −1. The inclusion μ₄↪μ₂ is not a possible transition.
- Serre's two quadratic subfields of ℚ(ζ₈) have the same extension degree and root counts but different norm exponents. A formula using only those three integers fails.

### 11.3 Higher-rank congruence completion

Let Γ=SL_n(A), n≥3. The finite residue rings imply Γ_n(I)=ker(Γ→SL_n(A/I)) has finite index for I≠0. The preceding classification makes E_n(A,I) finite index as well. Prove every finite-index subgroup H≤Γ contains E_n(A,I) for some nonzero ideal I. Pass first to the normal core; its root parameters form a common ideal by conjugation among roots and the commutator formula, and this ideal is nonzero because A is infinite while the root image in Γ/core(H) is finite. This gives the cofinal family needed for the completion, not merely an abstract finite presentation (BMS Theorem 7.5(e), p. 106; Theorem 14.1 proof, pp. 129–130).

Define `CongruenceCompletion Γ` as lim_{I≠0} Γ/Γ_n(I), with its dense map and the continuous surjection Γ̂→Γ̄ from the native profinite completion. Define `LatticeCongruenceKernel n F S` as that kernel, equivalently the intersection of the closures of Γ_n(I) in Γ̂. Its API includes closedness, normality, level projections, invariance under cofinal levels and change of open arithmetic subgroup. Prove η(g) lies in the kernel iff g=1. The zero ideal is not in the indexing family; including it would erase the completion defect.

The cofinal elementary quotients identify the kernel with lim_{I≠0}FiniteLevelDefect n A I. Exactness of this limit uses finite groups and compactness; it does not require surjective level maps. The explicit transitions give the higher-rank theorem: the kernel is μ(F), with its finite topology, when F is totally imaginary and S=∅, and trivial otherwise (BMS Corollary 4.3(d), p. 96; Theorem 14.1, pp. 129–130).

Define the arithmetic and congruence group topologies on SL_n(F), with Γ's respective neighborhoods as open subgroups, and their Hausdorff two-sided completions. Prove Γ̂ and Γ̄ embed as open subgroups, with the same kernel as the global comparison. Every homomorphism SL_n(F)→a finite group is trivial in characteristic zero: root groups are divisible additive groups and elementary matrices generate SL_n(F). The finite kernel's conjugation action is therefore trivial on dense SL_n(F), hence on the arithmetic completion. This proves centrality of the global kernel; centrality does not follow merely from the abstract isomorphism of the kernel with a cyclic group (BMS §14 and Theorem 14.1 proof, pp. 128–130).

**Checks.**

- n=1 has trivial SL and trivial kernel, while the higher-rank theorem assumes n≥3.
- For SL₃(ℤ) the kernel is trivial; for SL₃(ℤ[i]) it has order four.
- Inverting any finite prime in ℤ[i] kills this defect, despite leaving the roots of unity unchanged.
- The finite-index containment proof uses infinitude of A: in SL₃(𝔽₂), the subgroup {1} contains no E₃(k,I) with nonzero I.
- For SL₂(ℤ) the kernel is infinite. The higher-rank conclusion is not extended to rank two by stabilization alone.

### 11.4 Serre's relative elementary group in rank two

Prove `arithmeticSL2_finitelyGenerated` for SL₂(O_{F,S}) and each finite-index subgroup, for every number field F and finite S, independently of unit rank (Serre §1.2, p. 490). Reduction theory handles S=∅; adjoining an inverted prime uses the prime-local tree action, finite orbit sets and finitely generated vertex stabilizers. Schreier's theorem handles finite index. This supplies the finite-generation input below, rather than assuming finite relative defects.

Define `SerreElementary A I` as the normal closure **in SL₂(A)** of e₀₁(t), t∈I. Weyl conjugation gives the lower-root family. Its API includes normality, containment in Γ₂(I), monotonicity, transport, and the characterization of maps killing it by killing all SL₂(A)-conjugates of these roots. This is a different ambient normal closure from E₂(A,I). Prove every finite-index H≤SL₂(A) contains a nonzero Serre level for number fields, without any unit-rank assumption (Serre 1970 §1.4, Proposition 1, pp. 491–492).

Assume now r₁+r₂+|S|≥2. Prove a noncentral subgroup X≤SL₂(F) normalized by an S-arithmetic subgroup contains SerreElementary A I for some nonzero I. First choose a matrix with product ac≠0 in its first column, then use a unit of infinite order and root commutators to obtain a level. Keep the noncentral and positive-unit-rank hypotheses (Serre Proposition 2, pp. 492–493).

For C_I^{(2)}=Γ₂(I)/SerreElementary A I prove the row relations, including same-first-row independence and changes b↦b+at and a↦a+bt with t∈I. Conjugation by a lower elementary matrix with arbitrary parameter t∈A gives the separate action formula, not a relative row move. If u∈Aˣ and u^{2N}≡1 mod aA, prove h(u)^N commutes with the row class represented by (a,b), where h(u)=diag(u,u⁻¹). To find a uniform exponent, split a prescribed abelian Frobenius element into one or two factors nontrivial on a fixed nontrivial subextension; Chebotarev gives a ray-class representative a≡a₀ mod r whose ideal is a product of distinct nonsplitting primes outside a finite bad set. It follows that (A/aA)ˣ has no element of order divisible by ℓ^{ord_ℓ(m)+1}. Deduce that h(u)^m centralizes every row class (Serre Lemmas 1–4 and Proposition 3, pp. 493–496).

Extend conjugation on lim C_I^{(2)} from Γ to all SL₂(F) by replacing I with a suitable nonzero deeper ideal after clearing denominators of g and g⁻¹. Independence of this level and compatibility with multiplication are explicit targets. The noncentral-normal-subgroup argument and the diagonal-power centralizer make that action trivial. Hence C_I^{(2)} is central in Γ/SerreElementary A I and abelian; finite generation follows from that of Γ₂(I) (Serre Lemma 5, Proposition 4 and Corollaries, pp. 496–497).

**Checks.**

- SerreElementary A 0=1, and for a field k its unit level is all SL₂(k), including k=𝔽₂ or 𝔽₃.
- Over ℤ at level 2, [[3,−2],[2,−1]]=e₀₁(1)e₁₀(2)e₀₁(−1) belongs to the normal closure, while every word in the bare even root generators has upper-left entry 1 modulo 4.
- The finite-index containment applies to SL₂(ℤ), whose unit rank is zero. The centrality and finite-kernel theorems require positive unit rank and do not apply there.
- A scalar central subgroup of SL₂(F) need not contain any nontrivial root level; it is excluded from the normalizer theorem.
- In the ray construction the primes are distinct and nonsplitting, rather than necessarily inert in the full composite ray extension.

### 11.5 Completed rank-two defects and relative metaplectic extensions

Assume throughout this subsection that r₁+r₂+|S|≥2, so A has positive S-unit rank. Before proving C_I^{(2)} finite, use its profinite completion Ĉ_I^{(2)}. Prove the rank-two congruence kernel is lim Ĉ_I^{(2)}, by completing the exact finite-index sequence C_I^{(2)}→Γ/SerreElementary A I→Γ/Γ₂(I). Establish centrality in the rational arithmetic completion through the action just computed. Neither compactness of C_I^{(2)} nor exactness of an inverse limit of arbitrary discrete groups is assumed (Serre Proposition 5 and Corollary, pp. 497–498).

Define `RelativeCentralExtension L G M` for the dense map G=SL₂(F)→L, the rational congruence completion, and a profinite abelian M with trivial action: a Hausdorff topological central extension 1→M→E→L→1 with M embedded with its given topology and E→L an open quotient map, together with a splitting over discrete G. Morphisms preserve M, L and the splitting; classify up to isomorphism. Its API includes pullback, pushout along continuous M→N, split extension, Baer sum, inverse and compatibility of these operations. Uniqueness of a splitting uses perfection of SL₂(F), since F is infinite, and passage to finite quotients for profinite M (BMS §15, pp. 130–132; Serre §2.6, p. 498).

Prove `congruenceExtension_relativeUniversal`: pushing out the arithmetic completion gives a natural bijection

    Hom_cont(C(G),M) ≃ {relative central extensions of L by M}/≅.

For surjectivity extend the splitting on G through the arithmetic completion using the compact open lattice and profiniteness of its inverse image. For injectivity use centrality and the absence of finite abelian quotients, including the cokernel step for a non-surjective map to M (BMS Theorem 15.1 and proof, pp. 131–132; Serre Theorem 1, p. 498).

The local-to-global target `sl2_relativeMetaplecticClassification` identifies this extension functor with Hom_cont(M_S(F),M), where M_S(F)=μ(F) if S=∅ and F is totally imaginary, and 1 otherwise. Use Moore's local SL₂ covering classification (Theorems 10.3–10.4, pp. 51–53), restricted-product covering theorem (12.2, p. 58), reciprocity uniqueness (7.4, pp. 34–35), and relative computation (12.3, pp. 59–60). Nonarchimedean local kernels are the local roots of unity with their norm-residue-symbol normalization; the real covering kernel is ℤ, not just μ₂, and the complex kernel is zero. Gluing with the unramified splittings and imposing the rational splitting leaves μ(F); an omitted noncomplex place kills it. First establish the classification for finite M. Then recover general profinite M from E≃lim E/U over open subgroups U of M; uniqueness of morphisms and rational splittings makes the transition comparisons compatible. This proves a natural representing isomorphism, beyond a count of finite quotients. Moore's Theorem 13.1, pp. 63–64, identifies this cover with the central arithmetic extension. Serre's §2.6 and Theorem 2(a), pp. 498–499, apply it after the positive-unit-rank centrality argument. Local nonabelian covering classification remains an explicit theorem target here; abelian class field theory supplies its reciprocity input.

By relative universality identify C(G)≃M_S(F). Since C_I^{(2)} is finitely generated abelian and its profinite completion is a finite quotient of C(G), residual finiteness implies C_I^{(2)}=Ĉ_I^{(2)} is finite. Thus Serre levels have finite index. In the exceptional case sufficiently deep levels have order m and their Kubota map is an isomorphism to μ(F); otherwise all the defects vanish. Keep the conclusions about arbitrary finite levels separate from the positive-unit-rank theorem's exceptional deep-level formula (Serre Theorem 2 and Corollaries 1–4, pp. 498–500).

**Checks.**

- For M=1 there is one relative extension class. The identity of C(G) represents the arithmetic extension itself.
- For F a CM quartic field with S=∅, the representing group is μ(F); the positive-unit-rank hypothesis holds. For an imaginary quadratic field it fails.
- For F=ℚ and S={p}, the kernel is trivial. For F=ℚ, S=∅ it is infinite and this classification is outside its hypotheses.
- A finitely generated abelian group with finite profinite completion is finite. Without finite generation this inference is not used.
- The corrected norm-on-roots exponent from §11.2 is used when local symbols are compared under field extension; the false degree-only formula is excluded.

### 11.6 Characters of arithmetic lattices

If Γ̂→Γ̄ has finite central kernel C and k is finite of characteristic p∤|C|, prove every homomorphism Γ→(k,+) extends to Γ̂, kills C and factors continuously through Γ̄. Its kernel therefore contains a congruence neighborhood. This uses the actual finite kernel, not the stronger assertion that Γ has the congruence subgroup property in the strict sense.

Apply this for n=2 and F a CM quartic field, or n=3 and F=ℚ, to component lattices Γ in Res_{F/ℚ}PGL_n. For p>n unramified in F, the root-of-unity kernel has order prime to p. The determinant quotient between PGL and the image of SL has exponent dividing n, so restriction of mod-p additive characters to the SL preimage is injective. Prove each character is killed by a sufficiently small compact-open congruence subgroup, and one common subgroup kills all H¹(Y(K),k), using its finite dimension. This is the precise low-degree input to the non-Eisenstein localization argument for H⁰ and H¹; the Hecke action, boundary calculation and localization are supplied by the locally symmetric cohomology roadmaps (Calegari–Geraghty, Remark 9.3, §9.3, author PDF p. 119). Define no Hecke algebra or locally symmetric space anew here.

**Checks.**

- If p divides |C|, a nontrivial C→k may obstruct descent. The prime-to-p hypothesis is used.
- For the PGL determinant quotient, p>n prevents an additive k-character on the exponent-n part.
- The imaginary quadratic SL₂ lattice is outside the finite-kernel input, even though some separate low-degree vanishing results hold there.
- A common deeper level for H¹ uses a finite basis and finite intersection of open subgroups; an arbitrary infinite family of characters would not give an open intersection.

### Examples

The Gaussian levels distinguish the order at one level from the stable congruence kernel: the levels P, P⁴ and P⁶ have defects 1, μ₂ and μ₄, while the inverse limit is μ₄ with its prescribed power projections. A real place or one inverted finite prime removes the arithmetic defect. In rank two that statement needs positive unit rank and the relative metaplectic argument; it is not a consequence of the rank-three calculation alone.

### Dependencies

Layers 5, 8–10, supplied S-integer and unit interfaces, ray class field theory, Chebotarev and approximation, local/global Hilbert symbols, native profinite completion and finite inverse-limit exactness. The relative central-extension and SL₂ local-to-global classification targets belong to this layer. The character application exports a group-theoretic input to the existing Hecke/cohomology consumers.

## Layer 12: regular curves, rank and determinant

### 12.1 Resolution property without separatedness

Let X be noetherian regular of dimension at most one. Prove `regularCurve_affineDiagonal`: an intersection of two affine opens is a quasi-compact open in an affine locally noetherian scheme of local dimension ≤1, hence affine. The supplied regular-scheme resolution theorem therefore applies without separatedness. Its ample-family criterion has a concrete witness on each integral component: for an affine open U, the finite complement defines an effective Cartier divisor D, and the section 1 of O(D) has nonvanishing locus U. A finite affine cover gives the required family. A zero-dimensional component is the spectrum of a field; there is no generic point to choose on the empty scheme (Stacks Lemma 33.38.2, tag 09N9; Definition 29.12.1, tag 0FXR; Lemma 31.17.8, tag 0GML).

Strengthen the supplied resolution property to `regularCurve_coherent_lengthOneResolution`: every coherent F admits a vector-bundle surjection E→F whose kernel is a vector bundle. At a DVR that kernel is finite torsion-free, and at a field it is free. Identify the inverse of the supplied Cartan equivalence K₀(X)≃G₀(X) with [F]↦[E]−[ker(E→F)], independently of the length-one resolution. The new target is this uniform length bound and Euler normalization (Stacks Lemma 36.36.7, tag 0GMM; Weibel II.8, pp. 145–149). If X is separated of dimension one an ample line bundle is available as well, but is unnecessary here (Stacks Proposition 33.38.12, tag 09NZ).

**Checks.**

- The empty scheme has zero K₀ and G₀; the finite-component argument makes no choice of a generic point on it.
- Spec(k) is a zero-dimensional component: its coherent sheaves are vector bundles and its Cartan map is rank ℤ→ℤ.
- The affine line with doubled origin is regular noetherian but nonseparated; the ample-family proof still applies.
- For an effective closed point y on a regular curve, O(−y) is invertible, whereas O_y is a coherent torsion sheaf and not a vector bundle.
- Regularity is needed for the kernel to be locally free. A singular one-dimensional local ring need not make every finite torsion-free module free.

### 12.2 Divisor classes and the curve classification

For connected nonempty X as above of dimension one, use the supplied exact K₀, rank, determinant and divisor-line dictionary. The sequence 0→O(−y)→O→O_y→0 yields [O_y]=[O]−[O(−y)] in G₀ and, through Cartan, in K₀. Its determinant is O(y). For an effective divisor D, prove its coherent class is Σ_y length_{O_{X,y}}(O_D)_y[O_y]; the length at y is the divisor coefficient. Principal divisors give zero in the resulting rank-zero class map. Define `curveDivisorClassToK0 : Cl(X)→K̃₀(X)` by y↦[O_y], with its divisor-additivity, principal-divisor and determinant formulas. For a flat morphism between regular noetherian curves, prove the pullback formula by pulling back the point exact sequence and using the lengths of the pulled-back effective Cartier divisor as multiplicities (Weibel II.8, Proposition 8.2.1, pp. 146–147).

Prove the generic-rank exactness: G₀(X)→ℤ has kernel generated by the closed-point classes. Use localization through dense opens and finite extension of a generic isomorphism; it is not enough to choose a complement of one closed point. The divisor-to-line equivalence identifies determinant∘curveDivisorClassToK0 with Cl(X)≃Pic(X), hence proves both injectivity and surjectivity of the reduced class map. Conclude `regularCurve_rankDetEquiv : K₀(X)≃ℤ⋉Pic(X)`, with underlying coordinates (rank,det), addition (r,L)+(s,M)=(r+s,L⊗M), product (rs,L^{⊗s}⊗M^{⊗r}), and inverse (r,L)↦(r−1)[O]+[L]. For finitely many connected components replace ℤ by locally constant integer functions, with componentwise powers (Weibel II.8, pp. 145–147; the supplied rank–Pic ring of Layer 3).

It follows that SK₀(X)=ker(rank,det)=0, that the reduced ideal has square zero, and that the gamma filtration F² is zero. On an affine Dedekind spectrum this comparison agrees with Steinitz: the point sheaf at a prime ideal p has coordinates (0,p⁻¹). This inverse is fixed by its two-term resolution 0→p→A→A/p→0. Prove compatibility with localization, line tensor, the ring structure, finite disjoint union and extension of the base field when the hypotheses persist.

**Checks.**

- [O] has coordinates (1,O); [L]−[O] has (0,L), and ([L]−1)([M]−1)=0.
- At a Dedekind prime p the determinant of [A/p] is p⁻¹. Replacing it by p reverses the divisor convention.
- For a field Pic=0 and the inverse is r↦r[O], including negative r.
- On X₁⊔X₂, the rank of a bundle supported on one component is (1,0), not one global integer.
- The tensor product formula includes cross exponents s,r. Coordinatewise multiplication on ℤ×Pic would not make (1,O) a unit with the intended square-zero ideal.

### 12.3 Proper degree and the projective line

For X a smooth proper geometrically integral curve over k, define `rankDegree` as (rank,deg det), using the supplied divisor degree and coherent pushforward. Prove χ_k(x)=rank(x)χ_k(O_X)+deg(det x). For a closed point y, its degree is [κ(y):k]; the point class contributes (0,[κ(y):k]). If δ_X is the positive gcd of the degrees of closed points, the image of rankDegree is ℤ⊕δ_Xℤ. Thus it is onto ℤ² iff X has index one, not merely iff it is smooth and proper. The Euler formula follows by the rank–Picard classification and the point exact sequence: proper pushforward sends O_y to κ(y), with higher cohomology zero, so its Euler characteristic is its residue degree; subtracting rank times O_X reduces to these point classes. A zero-dimensional Spec(K) has Pic=0 and degree-of-determinant coordinate zero; it is treated outside the codimension-one point formula (Weibel II.8, Proposition 8.2.1 and the proper pushforward construction, pp. 146–149).

For P¹_k the rank-degree map is an additive equivalence to ℤ². Name the comparison `projectiveLineCoordinates (a,b)=(a+b,−b)` from projective-bundle coefficients in the ordered basis ([O],[O(−1)]) to (rank,degree). Its API includes additivity, inverse `(r,d)↦(r+d,−d)`, `projectiveLineCoordinates_involutive`, determinant −1 of its integer matrix, compatibility with pullback and pushforward, and the formulas

    [O(m)] ↦ (1,m) ↦ (m+1,−m),
    [O_y] ↦ (0,[κ(y):k]),
    χ(r,d)=r+d,    χ(a,b)=a.

With z=[O]−[O(−1)], K₀(P¹_k)≃ℤ[z]/(z²), z having rank zero and degree one. The projective bundle decomposition itself comes from SchemeKTheoryOperations; this layer proves its agreement with the curve rank–determinant normalization, including the negative sign on b (Weibel II.8, Theorem 8.5 and Corollary 8.6, p. 149; supplied projective-bundle theorem).

**Checks.**

- O(1) has projective-bundle coefficients (2,−1), rank-degree (1,1), and Euler characteristic two.
- A rational point has coefficients (1,−1), rank-degree (0,1), and Euler characteristic one.
- O(−1) has coefficients (0,1), degree −1 and Euler characteristic zero; changing the coordinate sign fails this case.
- The product of two rank-zero classes is zero, so z≠0 and z²=0 distinguish this ring from ℤ×ℤ with coordinatewise multiplication.
- Under any field extension the displayed integer coordinates are unchanged for a base-changed line bundle; a closed point can split, and the sum of its new degrees carries the corresponding class.

### 12.4 Nonseparated and degree-zero witnesses

For the affine line with doubled origin over k, prove Pic(X)≃ℤ by its two affine charts and the unit t on their punctured overlap. If 0',0'' are the two origins, div(t)=0'+0'', hence [O_{0''}]=−[O_{0'}] in the rank-zero subgroup. Consequently K₀(X)≃G₀(X)≃ℤ². This corrects the doubled-line value in Weibel V.3.4.2; the doubled-plane example belongs to the higher-dimensional failure of the resolution comparison and is a different scheme. Give a direct restriction/gluing calculation so the correction does not rely only on the classification theorem being tested (Weibel II.8.2, pp. 145–147; V.3.4.2, p. 387, with this correction).

For an elliptic curve with a k-rational origin use JacobianChallenge Layers A, D and F's pointed Picard/Jacobian identification Pic(E)≃ℤ⊕E(k). Then K₀(E)≃ℤ⊕ℤ⊕E(k) additively, and degree-zero line classes can be nonzero after both rank and degree vanish. Given a point-group identification and specified nonzero points, prove that their classes give the corresponding nonzero elements of ker(rankDegree). The elliptic group law is supplied by EllipticCurves Layer 1; this target adds its K₀ interpretation.

For the real conic x²+y²+z²=0, prove every closed point has degree two and Pic degree has image 2ℤ. The hyperplane line O_C(1) has degree two and generates Pic(C), whereas geometrically C_ℂ≃P¹ has a line of degree one. Thus rankDegree has image ℤ⊕2ℤ and is not surjective before base change. Keep this separate from the elliptic kernel example: one concerns image index and the other a nontrivial degree-zero kernel.

**Checks.**

- On the doubled line the two origin classes are opposite, not equal independent generators, and one is nonzero.
- The affine line itself has K₀=ℤ; gluing a second origin changes Pic and K₀.
- On E/𝔽₅, the origin gives the trivial degree-zero Picard class while (0,0) does not; rank and degree alone cannot distinguish them.
- For `E/𝔽₅ : y²=x³−x`, the small point-group check is `E(𝔽₅)≃ℤ/4×ℤ/2`, of order eight: `(2,1)` has order four and `(0,0)` has order two. With these group data as hypotheses, the preceding K₀ formula gives `ℤ²⊕ℤ/4⊕ℤ/2` and the two specified kernel classes.
- The real conic has no real point. Its complexification has index one, so the degree-one assertion is valid only after that base change.
- The empty and zero-dimensional components are excluded when choosing a closed-point divisor generator on a connected curve.

### Examples

The two-term point resolution fixes O(y) as the determinant of a point class. The projective line then fixes the matrix converting the projective-bundle basis to rank and degree. The doubled line, elliptic curve and pointless conic test three independent issues: nonseparated resolution, degree-zero information, and the possible failure of degree surjectivity.

### Dependencies

Layers 1–5; AlgebraicVectorBundles' finite locally free/exterior/determinant interfaces; SchemeAndStackFoundations' K₀, G₀, resolution property, Cartan map, localization and proper pushforward; divisor/Picard and elliptic geometry from their owners. The new geometric work here is the regular-curve resolution argument, classification and its explicit comparisons.

## Layer 13: concrete classes and based K-spaces

### 13.1 Absolute degree-zero and degree-one comparisons

Prove `ringK0EulerCompatibility` and `schemeK0CartanCompatibility` for the supplied component comparisons: for a strictly perfect cochain complex P•, its component corresponds to Σ_i(−1)ⁱ[Pⁱ]; for a module admitting a finite projective resolution it is Tau Ceti's `moduleEulerClassOf`. The new assertion identifies these named library classes and the existing `cartanMap`, rather than constructing another π₀ comparison. Shifting by one negates the class, and quasi-isomorphic complexes agree. Over a regular base the inverse Cartan map is precisely the supplied Euler class. For schemes the vector-bundle/perfect comparison is used only under the resolution property, sending E to E[0], and is compatible with arbitrary perfect pullback and product (Weibel II.9, Theorem 9.2.2 and Example 9.7.5, pp. 162, 169; Stacks tag 0FDJ).

The multiplicative-set localization map sends [P] to [S⁻¹P], and the support-to-absolute map sends a complex to its Euler class. In Dedekind rank–Pic coordinates this is (n,L)↦(n,S⁻¹L). For an open immersion between schemes satisfying the displayed resolution assumptions, it sends a vector bundle to its restriction. Coherent G₀ pullback requires flatness unless a finite-Tor derived construction is explicitly used; vector-bundle pullback needs no such extra hypothesis (Weibel II.9, Theorem 9.8, p. 170).

From this paragraph onward the matrix K-space is K^r(A), abbreviated K(A), and its component group is K₀^r(A). Write j_A:BG_A→BG_A⁺ for the supplied plus construction, G_A=GL(A), and θ_A:K₁(A)≃π₁K(A) for the supplied based comparison under the projective nerve. Prove `projectiveAutTransferComparison`: restriction-of-scalars transfer for B finite free as a right A-module, with a chosen basis, agrees under θ with the underlying block-matrix representation. Its class is independent of the basis, since a basis change conjugates that representation. For finite projective B compare the projective-automorphism loops instead, including complement independence and towers. This is a transfer normalization on the existing absolute comparison (Weibel IV.1.1–1.1.3, pp. 260–261; Theorems 1.5 and 1.8, pp. 263–265).

**Checks.**

- Over a field every model has π₀=ℤ by dimension, and scalar extension is the identity on that coordinate.
- Over ℤ, the complex ℤ --p→ ℤ in degrees −1,0 has absolute Euler class zero, while its supported class is nonzero. Forgetting support loses information.
- For A=ℤ[√−5] and I=(2,1+√−5), the complex I→A has class [A]−[I]≠0, although it becomes exact over the fraction field and at each local K₀ its rank-zero class vanishes.
- For k[ε]/ε² the Cartan map is multiplication by two in projective-rank and simple-module-length coordinates, not an isomorphism.
- The free automorphism −1 over ℤ maps under θ to the nontrivial order-two loop, while diag(−1,−1) gives the identity loop.

### 13.2 Steinberg roots, quotient roots and the signed comparison prism

For every unital associative R, define `Steinberg R` by roots `xᵢⱼ(a)`, with distinct i,j∈ℕ, with `xᵢⱼ(a)xᵢⱼ(b)=xᵢⱼ(a+b)`, `[xᵢⱼ(a),xⱼₖ(b)]=xᵢₖ(ab)` for distinct i,j,k, and `[xᵢⱼ(a),xₖₗ(b)]=1` when j≠k and i≠l. Define `steinbergProjection : Steinberg R→* E(R)` by `xᵢⱼ(a)↦eᵢⱼ(a)` and `SteinbergK2 R` as its kernel. Require root-word induction, the presentation's mapping property, finite-support representatives, functoriality in R and compatibility with stabilization. Prove the projection surjective, its kernel central, the source perfect, and the universal-central-extension property over E(R), using StableHomotopyKTheory §3.29's central-extension interface. Write St(R) and K₂(R) for these objects throughout the following comparisons (Weibel III.5.1–5.2.1, pp. 217–218; Theorem 5.5, p. 220).

**Checks.**

- `xᵢⱼ(0)=1` and `xᵢⱼ(a)⁻¹=xᵢⱼ(−a)`; projection gives the corresponding elementary identities.
- Over ℍ, `[x₁₂(i),x₂₃(j)]=x₁₃(k)`; reversing coefficients gives the wrong sign.
- Over the zero ring, St and K₂ are trivial; at R=ℤ the fourth power of `x₁₂(1)x₂₁(−1)x₁₂(1)` lies in K₂, as its projected matrix has order four.
- Over ℤ, `x₁₂(1)` is outside K₂: its projection is a nonidentity transvection, whereas every kernel word projects to identity.

Use the root presentation of St(A) to calculate its quotient under a surjection q:A→B with kernel I. Dividing by the normal closure of xᵢⱼ(i), i∈I, makes each root generator depend only on its B-coefficient: xᵢⱼ(a+i)=xᵢⱼ(a)xᵢⱼ(i). Every B-generator lifts, and the additive and commutator defining relations lift modulo precisely this normal closure. Thus the two root-presentation maps are inverse, St(q) is onto, and its kernel is that normal closure. The image under φ_A is E(A,I), because φ_A is onto E(A). This presentation calculation uses the same Steinberg carrier and introduces no relative K₂ group. It also gives naturality for quotient squares on generators (Weibel III.5.1, 5.7–5.8, pp. 217, 222–223).

For the plus square of a quotient ring, write a:X=BG_A→Y=BG_B and a⁺:X⁺→Y⁺. Choose the coherent based square homotopy H:j_Ya≃a⁺j_X from the supplied plus functor. Use image-to-base fibres. The vertical map sends (x,γ) to (a(x), H_x⋅a⁺γ), while the horizontal map sends (x,λ) to (j_X(x), H_x⁻¹⋅j_Yλ). The paths at the basepoint and the whiskering conventions are part of these formulas. Reverse paths to compare with the base-to-image convention of GeneralAlgebraicKTheory §1.2. Applying the supplied homotopy-pullback pasting theorem to this specified square identifies the two iterated fibres; both projections retain the same x and the same square filling (GeneralizedCohomology G2.10; StableHomotopyKTheory §§2.8–2.10; Weibel IV.1.2, p. 262, and Exercise IV.1.15, p. 275).

Prove `quotientPlus_boundaryPrism` for this square: if v∈π₁fib(j_X) maps to ∂j_Y(b), b∈π₂Y⁺, the unique n∈π₁fib(a) whose projection to π₁X equals that of v satisfies c_*(n)=∂_{a⁺}(−b). Here π₂Y=0 because Y is a group classifying space; exactness makes the projection π₁fib(a)→π₁X injective and supplies n. Represent v by a loop x(t) and a nullhomotopy of j_Xx(t). The equality in the target vertical fibre supplies a based path-square filling. Read its boundary first in the vertical direction and then in the horizontal direction using the two displayed formulas. The same filling is traversed in the opposite square coordinate, so its sphere has degree −1. This proves the sign and the two projection identities. The target is the boundary comparison for the ring-quotient square, not a new general theory of fibres or a direct map from the vertical fibre to the horizontal fibre.

Transport this calculation through GeneralAlgebraicKTheory §§1.5 and 3.12–3.14's coherent based plus/Q comparison under the right-projective nerve. The induced maps on fibres are equivalences by homotopy-pullback invariance, and their boundaries commute by naturality with the specified homotopies. Objectwise product decompositions of K(R), free homotopies and conjugacy classes of π₁ maps would not determine these comparisons (Weibel IV.1.1.1–1.1.2, pp. 260–261; IV.7.2, p. 328).

**Checks.**

- For q=id, the Steinberg quotient kernel is trivial; for q:A→0 it is all St(A).
- For q:ℤ→𝔽₅, the relative construction does not ask to lift the unit 2 through GL(ℤ).
- A degree +1 square homotopy adjoint to S¹→ΩS² induces degree −1 in the opposite fibre map. Omitting path reversal fails this test.
- Identity and composition coherences are tested at the basepoint, including its fixed path, rather than only after passing to free homotopy classes.

### 13.3 The congruence-loop construction

Let B=A/I, N=GL(A,I), V_A=fib(j_A), V_B=fib(j_B), F₀=fib(BGL(q)), F⁺=fib(BGL(q)⁺). Use the image-to-base path convention throughout. Define `congruenceLoop : N→π₁F⁺` by BN→(F₀)₀→F⁺. The first map is a weak equivalence onto the basepoint component because classifying spaces are K(G,1); no surjectivity of GL(A)→GL(B) is required. The second is the horizontal fibre map of the specified based plus square. Prove it is a homomorphism, natural in pairs, and its projection to π₁BG_A⁺ is the matrix class [n] (Weibel IV.1.2, p. 262; Ex. IV.1.15, p. 275).

The acyclic-fibre theorem identifies π₁(V_A)≃St(A), with projection φ_A to E(A)⊆GL(A); denote this map κ_A. Define β_A:K₂(A)≃π₂BG_A⁺ as the inverse of κ_A∘∂j_A restricted to its kernel. This normalization is fixed before computing the relative boundary. Prove these identifications natural in A. Since St(q) is onto, W=fib(V_A→V_B) is connected. Iterated-fibre interchange identifies W with fib(F₀→F⁺). The projection formula and φ_A(ker St(q))=E(A,I) then show congruenceLoop surjective with kernel exactly E(A,I). Hence it induces `relativeK1PlusEquiv : K₁(A,I)≃π₁F⁺`. Transport using the based ring model to ε₁:K₁(A,I)≃π₁K(A,I), with the inclusion square ε₁ followed by projection equal to θ_A∘ι (Weibel IV.1.7–1.7.1, pp. 264–265; IV.1.11, pp. 267–268).

**Checks.**

- I=0 gives trivial relative π₁; I=A gives the ordinary matrix-to-plus map.
- For A=ℤ,I=A, the congruence loop of −1 is the nonidentity class.
- For A=R[t], I=(t²−t), use the Stallings example where relative SK₁ maps onto ℤ/2 while SK₁(A)=0. It rules out identifying the relative group with the kernel of the absolute K₁ map (BMS Example 4.5, p. 97).
- In a split square, a kernel element can be represented by its matrix loop with a prescribed nullhomotopy; an arbitrary nullhomotopy need not specify the same fibre class.

### 13.4 The inverse lifted-word boundary

For z∈K₂(B), choose w∈St(A) with St(q)(w)=z. Then φ_A(w)∈N. Define

    relativeK2Boundary(z)=[φ_A(w)⁻¹] ∈ K₁(A,I).

Prove independence of w using the Steinberg kernel-image formula, multiplicativity using commutativity of relative K₁, naturality in pairs, triviality on the image of K₂(A), and vanishing when q has a unital ring section. Prove im δ=ker ι and ker δ=im(K₂(A)→K₂(B)): in the reverse inclusion choose a kernel Steinberg word with the same elementary image and cancel it from w. This proves the relative Steinberg sequence from §13.2 with its boundary calibrated to this convention; it introduces no relative K₂ group (Weibel III.5.7.1, p. 223, and Ex. III.5.1, p. 228).

The signed comparison is ε₁δ=∂₂β_B. Represent w by a loop of V_A and its plus nullhomotopy. The signed prism identity gives congruenceLoop(φ_A(w))=∂₂(−β_Bz). Inverting produces the displayed formula, explaining the inverse word. Exactness alone would not determine this sign. If δ^W is instead defined with the positive word and zero-to-image paths, explicitly transport it by path reversal; δ^W=(δ^H)⁻¹ when the K₂ comparison is held in the stated normalization. Transport the K₂ normalization too when comparing two differently oriented long exact sequences (Weibel IV.1.2 and 1.7, pp. 262, 264–265; Ex. IV.1.15, p. 275).

For degree zero use the right-projective version of the relative-triple/patching comparison ε₀:K₀^r(A,I)≃π₀K^r(A,I), where K₀^r(A,I)=ker(K₀^r(pr)). Require the free column equation pr(x)=a·add(y) and the positive class [freePatch^r(a)]−n[double]. The left-projective row formula of Layers 1 and 9 is obtained by applying this statement at Aᵒᵖ and transposing a, as fixed in the conventions; it is not silently identified with this matrix K-space for noncommutative A. Then prove ε₀∘δ^r equals the generic K₁(B)→π₀K(A,I) boundary under the same path convention. The full natural diagram

    K₂(A) → K₂(B) → K₁(A,I) → K₁(A) → K₁(B)
      → K₀^r(A,I) → K₀^r(A) → K₀^r(B)

commutes term by term with the homotopy sequence, using β, θ, ε₁ and ε₀. Both connecting squares and the maps to absolute groups are separately asserted; no comparison for relative K₂ is assumed (Weibel II.2.9–2.10 and Ex. 2.17, pp. 77, 81; III.2.3, pp. 193–194; IV.1.11, pp. 267–268).

**Checks.**

- In the abstract test diagram St_A=St_B=G_A=Multiplicative(ℤ), G_B=1, St(q)=id, φ_A=id and the other maps trivial, the inverse-word boundary is n↦−n. This is a test of the typed group-map formula, not a claim that these are a ring's Steinberg groups.
- The S¹→point over point→S² square with degree +1 adjoint square homotopy gives the opposite sign across the fibre prism.
- A split dual-number quotient makes δ=1 on all K₂(k); this does not assert K₂(k)=1.
- A lifted absolute K₂ word has φ_A(w)=1 and zero boundary, regardless of the chosen lift.
- The degree-one-to-zero patch boundary of a lifted matrix is zero, while a nonliftable residue unit may have the nonzero class computed in Layer 1.

### 13.5 The double comparison in degrees zero and one

For any unital q:A→C, let D_q=A×_C A and J=ker pr. At finite rank, the second projection gives `doubleCongruenceEquiv : GL_n(D_q,J)≃GL_n(A,ker q)` with inverse g↦(1,g), including the inverse matrix (1,g⁻¹). Prove its entry formula, both projection formulas, multiplication and stabilization. For q:A→A/I, transport through IdealDouble A I and prove it maps E(D,J) exactly onto E(A,I), by lifting elementary conjugating matrices through the diagonal section. Hence it induces the actual second-projection equivalence K₁(D,J)≃K₁(A,I) (Weibel Ex. II.2.3–2.4, pp. 78–79; III.5.10, p. 229).

The split projection pr:D→A identifies π₁K(D,J) with ker(K₁(D)→K₁(A)) and π₀K(D,J) with ker(K₀^r(D)→K₀^r(A)). The map of fibres induced by add and q is an isomorphism on π₀ by the supplied degree-zero patching theorem, and on π₁ by the congruence-loop theorem and double elementary comparison. Define ε₀ and ε₁ with these specified maps and prove agreement with the preceding constructions. This is a low-degree result: the double square is not asserted homotopy cartesian, and no higher excision is deduced (Weibel IV.1.11, pp. 267–268; Ex. IV.1.15–1.16, p. 275).

**Checks.**

- At q=id the congruence groups are trivial; at n=0 there is one matrix.
- For ℤ/4→ℤ/2 in rank one, the inverse lift of 3 is the double unit (1,3), not (3,3) and not (3,1).
- The first projection of that lift is 1 and the second 3, fixing the direction of the comparison.
- The split projection gives kernel identifications because it has a section. A general relative fibre's π₁ is not identified with an absolute kernel this way.

### Examples

The nonprincipal ideal and dual numbers distinguish Euler and Cartan normalization. The inverse-word and path-prism calculations fix a sign that every naturality and exactness diagram alone would leave ambiguous. The double unit (1,3) checks the actual map realizing the degree-one excision statement.

### Dependencies

Layers 1, 5–9 and 12; GeneralizedCohomology G2.10; StableHomotopyKTheory §§2.4–2.10 and 3.29–3.30; GeneralAlgebraicKTheory §§1.5, 3.12–3.14 and 8.1–8.9; SchemeKTheoryOperations Layers 1–3. Section 13.2 builds the Steinberg presentation and derives the needed root-quotient and signed-prism calculations from it and the specified path models.
## Layer 14: graded determinants and Witt support

### 14.1 The groupoid of graded lines

For a scheme X let `GradedLine X` have objects (L,f), where L is an invertible O_X-module and f:X→ℤ is locally constant. A morphism is an equality of grades and an isomorphism of lines; when the grades differ there are no morphisms. This is a groupoid, retaining scalar automorphisms, rather than the set Pic(X)×H⁰(X,ℤ). Its tensor product is (L⊗M,f+g), its unit is (O_X,0), and its inverse is (Lᵛ,−f), with evaluation and coevaluation. The associator and unitors are inherited with the grade equalities. Define the commutativity constraint on local sections by ℓ⊗m↦(−1)^{fg}m⊗ℓ. Negative grades use integer parity, not a truncated natural-number product (Bhatt–Scholze, Construction 5.1, p. 18).

The light scalar definition `koszulSign R a b : Rˣ` is (−1)^{ab}, with the exponent taken in the group Rˣ. Its API comprises symmetry, `koszulSign_add_left` and addition in the other argument, zero grade, reduction modulo two, naturality under ring maps, and the formula for negative grades. Prove the hexagon and involutivity from these identities. The tensor, inverse and pullback API of GradedLine includes object and morphism formulas, tensor compatibility of arbitrary scheme pullback, composition and identity comparisons, and preservation of all the displayed coherence maps. These are isomorphisms and coherent functors, not equalities of arbitrary chosen representatives of Picard classes.

**Checks.**

- The pair (O_X,1) has self-braiding −id on its tensor square. The same underlying line in grade zero has self-braiding id.
- For grades −1 and 1 the sign is −1. Sending a negative grade to its natural-number truncation would fail this test.
- In characteristic two the sign is 1 even for two odd grades. This does not identify different integer grades.
- Over a field k, Aut((k,f))=kˣ for every integer f, and there is no morphism from (k,0) to (k,1).
- Over the empty scheme there is one grade function and one line up to unique isomorphism. The spectrum of the zero ring therefore supplies the terminal groupoid.

Identify π₀GradedLine(X) with Pic(X)×H⁰(X,ℤ), in this order, and π₁ at the unit with Γ(X,O_X)ˣ. Supply the analogous scalar-automorphism identification at every graded line, independent of its trivializations. Grade zero inclusion and projection to the grade give a fibre sequence of connective spectra

    PicardGroupoid(X) → GradedLine(X) → H⁰(X,ℤ).

Forgetting the grade is a monoidal functor to the ordinary Picard groupoid and splits the sequence on underlying spaces, compatibly with their E₁ laws. It is generally not symmetric monoidal: it loses the odd–odd sign. In particular the displayed π₀ product is not a claim that the spectrum splits as the product of an ordinary Picard spectrum and a discrete spectrum. In the terminology of the source, failure of strict commutativity concerns self-braiding; it is unrelated to choosing a strict associator. The API includes the homotopy fibre identification at grade zero, the E₁ splitting and the self-braiding obstruction (Bhatt–Scholze, Construction 5.1, p. 18; §§12.14–12.15, pp. 58–59).

**Checks.**

- A degree-one trivial line over ℤ has nonidentity self-braiding. A purported symmetric forgetful functor would send it to identity and fail the symmetry square.
- The grade projection kills every line in degree zero, including a nontrivial line. Its fibre retains that line and its automorphisms.
- The component identification records a nontrivial Picard class in grade zero and a trivial line in nonzero grade separately.
- For a disjoint union X₀⊔X₁, grades can be 0 on X₀ and 1 on X₁; neither connectedness nor a globally constant integer is part of the definition.

### 14.2 The symmetric determinant of projectives

Enhance the supplied componentwise determinant object to the symmetric monoidal functor `projectiveGradedDet : Proj(R)≃ → GradedLine(Spec R)`, P↦(det P,rk P). The domain is the core of finite projectives, under direct sum. On morphisms use the induced top exterior isomorphism on each clopen rank stratum. Its ordered sum comparison is det(P⊕Q)≃det(P)⊗det(Q). Prove that swapping P and Q changes this comparison by (−1)^{rk(P)rk(Q)}, pointwise. This is exactly the sign in GradedLine, so it makes the functor symmetric rather than only monoidal. Include arbitrary scalar extension, identity, composition and the coherent zero/sum comparisons (Bhatt–Scholze, Proposition 12.3, pp. 54–55).

For g∈GL_n(R), the graded determinant of its free automorphism has grade n and acts on the determinant line by det(g)∈Rˣ. For any finite projective P and automorphism α, the same statement is local at each rank stratum, and glues to a global unit acting on det(P). This morphism-level theorem is stronger than invariance of the Picard class: every automorphism fixes that class. The existing top exterior formula over free modules supplies the calculation after localization.

**Checks.**

- P=0 gives (R,0), and the identity automorphism acts by 1. There is no exceptional positive-rank convention.
- Swapping two free lines acts by −1; swapping a free line and a free rank-two summand acts by 1.
- On R=R₀×R₁, a projective of ranks (1,2) produces grades (1,2), and swapping it with a rank-one projective gives signs (−1,1).
- Multiplication by a unit u on a line gives scalar u, not u⁻¹, even though the object's Picard class is unchanged.

### 14.3 Determinant on the K-spectrum and its loops

Apply the supplied coherent group-completion functor to projectiveGradedDet to obtain the natural map of connective spectra `ringSpectrumDet R : K(R)→GradedLine(Spec R)`. The input functor is symmetric monoidal, the target is already grouplike, and the group-completion unit is the specified projective-nerve map. Use GeneralizedCohomology G2.8's group-completion adjunction and connective-spectrum recognition, StableHomotopyKTheory §§4.25–4.26's Picard Γ-model comparison, and GeneralAlgebraicKTheory §§1.6 and 3.12's projective group-completion comparison (Bhatt–Scholze, Theorem 12.9, Proposition 12.10 and Corollary 12.12, pp. 57–58; Corollary 12.17, p. 59).

Make the model identification a named compatibility target `projectiveGroupCompletion_spectrumComparison`. The projective-nerve map into the supplied iterated-S K-spectrum is E∞ for direct sum: apply ordered direct sums to every S-diagram; their associators, unitors and permutations are the actual module isomorphisms, so all finite-set structure maps commute. The group-completion adjunction extends it to a map of grouplike E∞ spaces. Its underlying space map is the supplied plus/Q comparison, hence an equivalence; connective-spectrum recognition then makes it an equivalence of spectra under the original nerve map. This argument retains the symmetric structure, rather than trying to promote an arbitrary H-space equivalence. The additional inputs are GeneralAlgebraicKTheory §§5.7–5.11's iterated-S spectrum and its exact/Q comparison (Weibel IV.8.5.5, p. 337; Bhatt–Scholze §§12.4–12.13, pp. 56–58).

Its component map sends x to (det x,rk x). A negative projective class maps to the dual determinant line with the negative rank. To identify the loop map, let α be an automorphism of P. The projective nerve gives a loop at [P]; translate it to the zero component using the inverse of [P] and the coherent grouplike law. Define its homotopy class `projectiveLoopClass P α`. The API includes composition in α, conjugacy by projective isomorphisms, direct sum, identity, scalar extension and independence of a finite-free complement. Under ringSpectrumDet this translated loop acts on the unit by the scalar automorphism of det(P) induced by α. Translation on the target tensors the original loop with the inverse graded line; it does not discard its scalar.

The based model comparison of Layer 13 must be under the projective nerve. Prove that the translated loop of g∈GL_n(R) equals θ_R([g]), and more generally projectiveLoopClass(P,α)=θ_R(autClass(P,α)). Consequently, writing d_R:π₁K(R)→Rˣ for the determinant loop map, prove the equality of homomorphisms d_R∘θ_R=det_R. Test it on finite matrices and extend using the surjective stable-GL presentation. An arbitrary equivalence between the two K-space models would not determine this equality. Include the restriction-of-scalars comparison: for R→S finite free with chosen R-basis, the plus map of the underlying block-matrix representation sends the S-loop to its R-linear automorphism loop, independently on π₁ of the basis (Weibel III.1.6, p. 185; IV.1.1.3, p. 261; Bhatt–Scholze, Proposition 12.3 and Corollary 12.17, pp. 55, 59).

**Checks.**

- A rank-one automorphism u maps to u. Thus the loop of −1 over ℤ has nontrivial determinant, whereas diag(−1,−1) has trivial determinant.
- For α=id_P, the translated loop is constant, even when [P] belongs to a nonzero K₀ component.
- Complementing P and extending α by the identity gives the same loop and scalar determinant; complement choices cannot change the result.
- For a finite field, d_R is an isomorphism on π₁ and has order q−1 on the group of components of the loop space. For 𝔽₂ this group is trivial, although the grade group remains ℤ.

Because the target spectrum is 1-truncated, ringSpectrumDet factors canonically through τ≤1K(R). For a nonzero commutative local ring the induced τ≤1K(R)→GradedLine(Spec R) is an equivalence: K₀ is ℤ by rank, Pic is zero, and K₁ is Rˣ by determinant. For general R, the corresponding map of presheaves on affines becomes an equivalence after Zariski sheafification. This uses the stalkwise local theorem and descent of graded lines, not an objectwise global classification. It does not say that K(R) itself is 1-truncated (Bhatt–Scholze, Proposition 12.18, p. 59).

**Checks.**

- The nonprincipal ideal over ℤ[√−5] is detected in the global Picard coordinate although its local coordinates are trivial.
- A field can have nonzero higher K-groups. The equivalence concerns τ≤1K, not the whole spectrum.
- A ring with nonzero SK₁ need not have an objectwise determinant equivalence; sheafification removes that local obstruction.
- The zero ring is handled by its empty spectrum, whose grade and unit groups are trivial, rather than by assigning it K₀=ℤ.

### 14.4 Perfect-complex determinants and descent

For every quasi-compact quasi-separated scheme X, construct `schemeSpectrumDet X : K(Perf X)→GradedLine(X)` by the affine ring determinant and Zariski descent. The affine equivalence is the one compatible with the projective nerve. The API includes arbitrary pullback, restriction to affine opens, compatibility on double and triple intersections, identity/composition homotopies, and uniqueness with this affine comparison. The domain uses the enhanced stable category of perfect complexes from SchemeKTheoryOperations; no presentation by the triangulated homotopy category alone supplies these coherences (Bhatt–Scholze, Proposition 5.3, pp. 18–19).

For a cofiber triangle C'→C→C'', the determinant isomorphism is Det(C)≃Det(C')⊗Det(C''), in this order. Include naturality in triangle isomorphisms, the split-triangle formula, compatibility with iterated filtrations and the octahedral comparison. The shift rule is Det(C[1])≃Det(C)⁻¹, with both the dual line and the negative grade. For a bounded finite-projective complex P• its determinant is the ordered alternating tensor product ⊗_i(det(Pⁱ))^{(−1)^i}, with grade Σ_i(−1)^i rk(Pⁱ). Prove invariance under quasi-isomorphism, the acyclic-complex trivialization with its naturality, and compatibility with changing the bounded projective model. This is a coherent determinant functor, not merely an equality of elements of Pic(X).

The π₀ square with vector-bundle K₀ commutes on every qcqs X. The map from vector-bundle K₀ to π₀K(Perf X) is an isomorphism when X has the resolution property; do not assert that globally for all qcqs X. For a regular noetherian curve, Layer 12 supplies that property and identifies the component map with its rank–Picard classification. The Cartan/Euler, affine, localization and determinant squares then use the same classes: a bundle in degree zero has its existing rank and determinant, and a bounded bundle resolution gives its alternating Euler class (Stacks Lemma 36.38.5, tag 0FDJ; Bhatt–Scholze, Proposition 5.3, pp. 18–19).

**Checks.**

- The complex P in degree −1 has determinant (det P)⁻¹ and grade −rk P. A shift that changes only the grade is wrong.
- The complex [P —id→ P] has a natural trivialization of its graded determinant; its grade is zero.
- On ℙ¹, the sequence 0→O(−1)→O→O_y→0 gives Det(O_y)=O(1) in grade zero, agreeing with the positive point class in Layer 12.
- Pullback of a bounded projective complex uses the derived perfect pullback. No flatness assumption on the scheme map is needed for the determinant comparison.
- The triple-overlap comparison is part of descent: choosing unrelated affine determinant equivalences does not define a global natural map.

For perfect F_p-schemes, prove effective v-descent of GradedLine by combining effective v-descent of line bundles with the v-sheaf property of locally constant integer functions. Descent includes isomorphisms and their scalar automorphisms. Its API consists of the equivalence with the descent groupoid for a v-cover, its functoriality in refinement, and symmetric tensor/inverse compatibility (Bhatt–Scholze, Proposition 5.2, p. 18, using Theorem 4.1(ii), pp. 13–14).

**Checks.**

- Grade-one trivial lines descend to grade one, so the grade is not lost in line-bundle descent.
- The Čech cocycle of units is retained, rather than replacing a descent groupoid by its set of components.
- A disconnected cover with different grades cannot descend across a nonempty overlap identifying the two components unless the grades agree there.

### 14.5 The supported determinant and its uniqueness

On the v-site of perfect F_p-schemes, combine the supplied sheafified first-truncation equivalence for α with the graded determinant comparison:

    a_v τ≤1 K(W(X) on X) ← a_v τ≤1 K(X) → GradedLine(X).

The right equivalence follows from the Zariski-local result of §14.3 and v-descent of graded lines. Use the specified left equivalence from the supplier contract, including its naturality in X. Both arrows are natural transformations of sheaves of connective 1-truncated spectra, retaining their E∞ structure and the actual α-map (Bhatt–Scholze, Theorem 5.7, p. 20).

Define `wittSupportedDet X` by the natural map K(W(X) on X)→a_vτ≤1K(W(X) on X), then the inverse left equivalence and the right one. Its API includes the specified extension homotopy wittSupportedDet∘α≃schemeSpectrumDet, arbitrary perfect-scheme pullback, the affine sheafification square and the ordered cofiber additivity isomorphism. The space of such *natural extensions with the specified comparison homotopy* is contractible: factor maps into the 1-truncated v-sheaf through sheafified first truncation and invert the displayed equivalence. This uniqueness retains the comparison data; it does not claim that line bundles have no nontrivial automorphisms.

For a finite filtration of a supported perfect complex C whose successive cofibers are α_X(D_i), D_i∈Perf(X), prove the canonical comparison

    wittSupportedDet(C) ≃ ⊗_i schemeSpectrumDet(D_i).

The tensor is in filtration order, with the signed symmetry when factors are interchanged. Prove compatibility with refinement, pullback, triangle additivity and the octahedral coherence. For a bounded filtration of an actual p-power-torsion module with vector-bundle graded pieces, no alternating signs are inserted: each graded piece is in cohomological degree zero. Reversing a complex shift and reversing a filtration are distinct operations.

**Checks.**

- α_X of a line L gives the ordinary graded determinant (L,1). The extension square tests the map, including its grade, not only its Picard class.
- Two filtrations with a common refinement give isomorphic outputs through the same coherent refinement map, including its scalar data.
- A triangle C→0→C[1] gives inverse graded determinants; a length-two module filtered by two degree-zero lines gives their product in grade two.
- Exchanging two rank-one graded pieces introduces −1. A definition in the ordinary symmetric Picard groupoid would fail this check.
- Pullback of a filtration and then determinant agrees with determinant and then pullback, using the extension homotopy on its graded pieces.

### 14.6 Constant finite-length modules

Let k be a perfect field, Q a finite-length W(k)-module, and X a perfect k-scheme. Put Q_X=Q⊗_{W(k)}W(O_X). The sheaf W(O_X) is p-torsionfree and hence flat over the DVR W(k), so this tensor product also computes the derived pullback. Suppose a finite filtration of Q_X has graded pieces E_i that are finite locally free O_X-modules. Then the line ⊗_i det(E_i) is trivializable. More precisely, the supported determinant identifies its graded version with the pullback of wittSupportedDet_k(Q), whose grade is length_{W(k)}Q. Its underlying line over k is one-dimensional and hence trivializable. This gives a fixed line whose pullback is the product, not a preferred basis or a canonical trivialization (Bhatt–Scholze, Lemma 6.11, pp. 24–25, with Theorem 5.7, p. 20).

The API comprises constancy under k-base change, agreement of the product for any two admissible filtrations, invariance under refinement and length additivity in short exact sequences of finite-length modules. For the p-adic filtration, the fixed k-line is ⊗_j det_k(pʲQ/pʲ⁺¹Q). An arbitrary filtration need not have individually trivial determinant factors; only their product is forced to be the pullback of this line. The proof from supported determinant and its coherence provides the filtration comparison; the source also gives an independent geometric argument through successive projective/flag bundles and effective descent, which can serve as a second verification without duplicating its general descent theorems.

**Checks.**

- Q=0 gives the unit in grade zero, including the empty filtration.
- Q=k gives grade one; Q=W(k)/p² gives grade two and the product of two copies of the one-dimensional k-line.
- For Q=k² and a line quotient of O_X² over the perfection of ℙ¹_k, the kernel and quotient can have opposite nonzero degrees. Their determinant product is trivial although neither factor is trivial.
- A change of k-basis changes a chosen trivialization by its determinant. The theorem asserts trivializability and a comparison to the fixed k-line, rather than basis independence of a chosen generator.

### Examples

The free automorphism −1 over ℤ gives a nontrivial scalar loop while the class of the underlying line has unchanged rank and Picard coordinate. The shifted line O_X[1] has dual determinant and grade −1, while a degree-zero length-two Witt module has grade 2. These examples distinguish automorphisms, cohomological signs and filtration length. On the perfected projective line, a varying filtration of k² can have nontrivial kernel and quotient lines, but their product determinant is pulled back from det_k(k²).

### Dependencies

Layers 1–9 and 12–13 fix the concrete classes and their maps. AlgebraicVectorBundles L0C supplies the object-level exterior determinant; GeneralizedCohomology G2.7–G2.8 supplies spectrum truncation, group completion and connective-spectrum recognition; StableHomotopyKTheory §§4.25–4.26 supplies the Picard Γ-model comparison; EnhancedDerivedSheaves E0, E2–E3 and E5:presentability supplies coherent mapping spaces, truncation and sheafification; GeneralAlgebraicKTheory §§3.12–3.14, 4.3 and 5.7–5.11 supplies coherent K-theory additivity and the based projective-nerve comparison. The perfect/support, descent and Witt inputs are those of the opening supplier contracts; the graded enhancement and determinant extension are owned here.

## Downstream consumers

The rank–Picard quotient, exterior/Adams operations and determinant comparison specialize the scheme-operation interfaces of SchemeKTheoryOperations §§3.6 and 6.2–6.3 to concrete projective classes. Symbol and Brauer-theoretic applications use the normalized classical relative K₁ target and the Steinberg boundary comparison. Arithmetic congruence and locally symmetric cohomology applications use the finite defect, its root-of-unity normalization and the character-killing result, retaining their separate Hecke and boundary inputs. Witt-vector affine Grassmannian constructions use the supported determinant, coherent filtration comparison and the finite-length trivializability theorem. None of these consumers needs a second definition of categorical K₀ or a second determinant-line object.

## References

All statements above are paraphrased mathematical targets. Source numbers refer to the following freely accessible versions; book page numbers are the printed numbers, not the PDF viewer offsets.

- Charles Weibel, [*The K-book: an introduction to algebraic K-theory*, author version, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). I.2–I.3, pp. 7–22, for projectives, patching and determinant; II.2, pp. 68–81, for projective K₀; II.4, pp. 90–102, for λ, γ and Adams operations; II.8, pp. 145–149, for curves and schemes; III.1–III.3, pp. 180–201, for classical K₁ and relative groups; III.5.7–5.8, pp. 222–223, for relative Steinberg groups and boundaries; IV.1, pp. 260–268, for plus and relative comparisons. Printed page n is PDF page n+8 in this version. The doubled-origin calculation in Layer 12 is a direct correction to the example at V.3.4.2, p. 387.
- Hyman Bass, John Milnor and Jean-Pierre Serre, [*Solution of the congruence subgroup problem for SL_n (n≥3) and Sp_2n (n≥2)*](https://www.numdam.org/item/10.1007/BF02684586.pdf), Publications Mathématiques de l'IHÉS 33 (1967), pp. 59–137. §§2–3, pp. 65–82, and Appendix to §3, pp. 82–93, for Mennicke symbols and reciprocity; §§4–7, pp. 94–107, for congruence groups and stable range; §§8–11, pp. 107–121, for the extension argument; §§14–15, pp. 128–134, for congruence kernels and their metaplectic interpretation. Printed page n is PDF page n−57.
- Jean-Pierre Serre, [*Groupes de Grothendieck des schémas en groupes réductifs déployés*](https://www.numdam.org/item/10.1007/BF02684589.pdf), Publications Mathématiques de l'IHÉS 34 (1968), pp. 37–52. §§1–2, pp. 38–45, for comodules, resolutions and decomposition maps; §3, pp. 46–52, especially Theorems 4–5, for formal characters and integral comparison. Printed page n is PDF page n−35.
- Jean-Pierre Serre, [*Le problème des groupes de congruence pour SL₂*](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Annals of Mathematics 92 (1970), pp. 489–527. §1, pp. 489–492, and §2, pp. 492–500, for relative elementary groups, completed defects and congruence kernels.
- Calvin C. Moore, [*Group extensions of p-adic and adelic linear groups*](https://www.numdam.org/item/PMIHES_1968__35__5_0.pdf), Publications Mathématiques de l’IHÉS 35 (1968), pp. 5–70. Theorem 7.4, pp. 34–35, gives reciprocity uniqueness; Theorems 10.3–10.4, pp. 51–53, give local covering classification; Theorems 12.2–12.3, pp. 58–60, give the restricted-product and relative computation; Theorem 13.1, pp. 63–64, identifies the central arithmetic extension.
- Jean-Pierre Serre, [*On a functorial property of power residue symbols. Erratum*](https://www.numdam.org/item/10.1007/BF02685884.pdf), Publications Mathématiques de l'IHÉS 44 (1974), pp. 241–244. The corrected extension formula for power-residue symbols must be used in the arithmetic normalization.
- Bhargav Bhatt and Peter Scholze, [*Projectivity of the Witt vector affine Grassmannian*, arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490v3). §5, pp. 18–20, for graded lines and supported determinant; Lemma 6.11, pp. 24–25, for finite-length modules; §12, pp. 54–59, for the symmetric determinant, group completion and sheafified first truncation. Its page numbers agree with the PDF page numbers.
- Dave Witte Morris, [*Introduction to arithmetic groups*, 2015 author edition](https://deductivepress.ca/IntroArithGrps-FINAL.pdf), §7.1, Theorem 7.1.1 and Exercises 1, 3–4, pp. 152–154, for the real special-linear/orthogonal deformation comparison. These are PDF pp. 168–170.
- Frank Calegari and David Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*, author PDF](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Remark 9.3 in §9.3, PDF p. 119, for the congruence-subgroup input to low-degree cohomological vanishing; the lattice-character argument and its hypotheses are stated in Layer 11.
- The Stacks Project: [Definition 29.12.1, tag 0FXR](https://stacks.math.columbia.edu/tag/0FXR), ample families; [Lemma 31.17.8, tag 0GML](https://stacks.math.columbia.edu/tag/0GML), regular schemes with affine diagonal; [Lemma 36.36.7, tag 0GMM](https://stacks.math.columbia.edu/tag/0GMM), ample families and resolutions; [Lemma 33.38.2, tag 09N9](https://stacks.math.columbia.edu/tag/09N9) and [Proposition 33.38.12, tag 09NZ](https://stacks.math.columbia.edu/tag/09NZ), curves; [Lemma 36.38.5, tag 0FDJ](https://stacks.math.columbia.edu/tag/0FDJ), vector-bundle and perfect-complex K₀; [Theorem 16.12.1, tag 07GC](https://stacks.math.columbia.edu/tag/07GC), regular algebras as filtered smooth colimits. Stacks tags are stable statement locators; section numbering can change.
