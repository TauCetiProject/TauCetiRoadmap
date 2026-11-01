# Roadmap: homotopy foundations for algebraic K-theory

**Summary.** Build Quillen’s Theorems A and B, acyclic maps, the plus construction, categorical homotopy group completion and Waldhausen K-theory assembly. Compare these models with supplied symmetric spectra, and develop finite coefficients, their products, prime-completion comparisons and filtered convergence from Mathlib’s simplicial/category theory and Tau Ceti’s homotopy/covering theory.

## Scope and ownership

This extends **Algebraic topology of spaces and manifolds**. The following mathematics enters through its owners’ interfaces.

- **AlgebraicTopology**, stages 1–4, owns van Kampen, singular and relative chains, twisted chains with local coefficients, excision and the cellular–singular comparison with local coefficients (items 3.3 and 4.3), cellular homology, mapping cylinders, cellular approximation, CW cofibrations and the CW structure `simplicialRealizationCW` on the realisation of every simplicial set (item 4.7). Stages 5–6 own Serre fibrations and ordinary cohomology; the homology and cohomology Serre spectral sequences and the fibration homotopy exact sequence are DGFloer Layer 1 item 2's, which AlgebraicTopology 5.5 consumes. Stage 8 owns cubical/Kan homotopy comparison, based relative homotopy, absolute and simply connected relative Hurewicz, Whitehead, the group nerve classifier `groupClassifyingSpace` with its K(π,1) property and its comparison with ClassifyingSpaces (item 8.8), relative and local-coefficient obstruction cochains for Serre fibrations with n-simple fibres (item 8.9), and ordinary cohomology representability (item 8.10). Comparisons of realised nerves with category chains, translation categories of general G-sets and the nerve-to-bar chain isomorphism belong here. The extensions for arbitrary fibre pairs are stated explicitly below.
- **GeneralizedCohomology**, G2, G3 and G5.4–G5.6, owns the symmetric-sphere-module model, its stable and monoidal homotopy theory, Γ-machine, ordinary coefficients, derived spectral limits, localization and completion, Bott spectra and rational stable comparison. The additional point-set, algebraic K-theory, coefficient and convergence comparisons are specified here.
- **UniversalCovers**, Stage 0 items 3–4 and Stage 1 item 5, owns the action/deck carriers and universal deck comparison; Stages 2–4 own cover classification, covering-induced homotopy isomorphisms, basepoint change and recognition of aspherical spaces. The group nerve classifier and its comparison with ClassifyingSpaces Stages 1–4 are AlgebraicTopology 8.8's; the category-level translation and subgroup comparisons and the nerve-to-bar chain isomorphism are local.
- **RepresentationTheory/InductionRestriction**, Layer 7, “Abstract universal central extensions”, owns central extensions of arbitrary groups, their universal property, the free-presentation construction for perfect groups, perfection of its source and uniqueness of lifts. Section 3.29 adds the kernel–H₂ and superperfectness comparisons and the identification with the plus fibre.
- **GrothendieckEulerForms**, layer 2, and Tau Ceti's `TauCeti.SplitK0.grothendieckAddGroupEquiv` own algebraic split K₀. Mathlib owns algebraic group completion. This roadmap constructs a space and identifies its components with those groups.
- **IntegralLattices**, 0A, supplies integral forms, isometries and orthogonal sums; 0E supplies signatures, 2C supplies orthogonal groups and orthogonal-sum embeddings without a definiteness assumption, and 6A supplies indefinite unimodular classification. **OrthogonalSpinGroups**, 0C, supplies only the bilinear/quadratic base-change comparison. The new targets here are cofinal stabilization and the classifying-space and plus comparison.
- **BordismFormalGroups**, F6.5, owns Sp∞, symmetric coherence, infinity-operad interfaces and the monoidal model-localization comparison for GeneralizedCohomology's spectra. The comparisons here use those supplied objects.
- **TangentialBordism**, B4.1–B4.2, owns the generic mod-2 Steenrod squares on ordinary cochains, the stable HF₂ operations and the mod-2 Adams tower. §7.1's Hopf-class and Moore-spectrum calculations and §7.31's Adams E₂-page use them.
- **EllipticCohomology**, E4.A, owns MU-synthetic spectra and their enriched-site, spherical-sheaf, Day-tensor, ν, τ and τ-inversion constructions. Section 7.31 extends that MU case to the HF₂ site: it reuses the enriched-presheaf and localization machinery with its site hypotheses, proves those hypotheses for HF₂, and constructs the HF₂ versions of the tensor and comparison functors. The MU site does not contain every finite HF₂-projective spectrum. The class 2̃, Moore quotients, vanishing lines and comparison with TangentialBordism B4.2's Adams spectral sequence belong to §7.31.

StableHomotopyKTheory owns generic nerve homotopy, Quillen A/B, acyclic and plus constructions, monoidal group completion and generic Waldhausen/S foundations, including the Waldhausen structure on each SₙC. AlgebraicKTheory A0–A1 owns the arbitrary-ring matrix, elementary-subgroup and projective-complement algebra; §§4.14–4.15 here adapt its objects to classifying spaces and left modules. GeneralAlgebraicKTheory consumes the generic homotopy and Waldhausen interfaces and owns Q-theory, localization, approximation and ring-specific comparisons. The map-level contracts in Downstream consumers identify these constructions and the ring specialization of the general plus factorization.

Local foundations include relative fibre Serre comparison and the homological and plus-fibre refinements of universal central extensions (Layer 3); stable-linear classifying-space and projective-cofinality adapters and the function-ring model of topological K-theory (Layer 4); stable and operadic comparisons (Layer 5); Waldhausen categories, S-construction, additivity and relative-S delooping (Layer 6); and the spectral comparison with supplied countable-tower algebra, the Eₙ quotient obstruction tower, the Patchkoria–Pstrągowski deformation and the HF₂-site extension of EllipticCohomology E4.A's MU-synthetic spectra (Layer 7).

Nerves, realisation, local coefficient carriers, universal covers, split K₀, chain cones and abstract spectral-sequence pages retain their supplier objects. Tau Ceti also supplies `TauCeti.HasHomotopyExtensionProperty`, its cylinder-retraction criterion and cross-universe extension theorem in `Topology.Homotopy.Extension.Basic`; these enter as prerequisites, rather than a new HEP theory. The new proper-realisation and gluing targets use this property on closed embedding images.

## Conventions

Small categories have objects and morphisms in fixed universes. Universe changes use `ULift` or Mathlib's small-category interfaces; they do not discard size hypotheses. Classifying spaces are the composite of `CategoryTheory.nerveFunctor` and `SSet.toTop`. A category with no objects has empty realisation. A based space includes an actual point, and based maps include its preservation equation.

Products, mapping spaces and simplicial topological constructions use compactly generated weak Hausdorff spaces where required. A finite CW factor permits the ordinary product topology. No assertion about an arbitrary infinite product silently uses that exception. The CW structure on a realisation has a cell for each nondegenerate simplex, rather than a cell for each simplex.

Composition follows Mathlib. In `SingleObj G`, `f ≫ g = g*f`. In the π₁, the product of the classes of paths p and q is represented by q followed by p. Thus the edge labelled g*h is homotopic to the edge h followed by the edge g. The explicit bar comparison inverts each entry without reversing its tuple; coefficient transport and the first face use that same convention.

The homotopy fibre `F(f,b)` consists of pairs `(a,γ)` with γ a path from `f(a)` to b. Reversing γ compares it with the basepoint-to-f(a) convention. The homotopy boundary sends a loop at b to (a₀,loop), with that endpoint direction. Groups occur in positive absolute homotopy degrees; degree zero is a pointed set. Relative π₂ need not be abelian. Every relative group uses a point in the subspace.

A weak homotopy equivalence is bijective on path components and on all π-groups at every basepoint. Homotopy-cartesian squares use an actual comparison to a path-space homotopy pullback. Quasifibrations only compare strict fibres with homotopy fibres; they do not assert a lifting property.

Write `HasCWType X` when X is homotopy equivalent to a Hausdorff CW complex. Plus constructions use a connected space of CW type and a specified perfect normal subgroup of its π₁. Their homology condition ranges over every local coefficient system pulled back from the quotient group. Their uniqueness and functoriality are assertions about maps up to homotopy, not equalities of selected cell attachments.

Symmetric spectra have pointed simplicial-set levels and equivariant iterated structure maps. Naive π-groups are stabilised level π-groups; true π-groups are computed after stable replacement. They agree only under the semistability hypotheses. Homotopy groups are indexed by all integers. Suspension raises degree by one, so `π_k(ΣE) = π_(k−1)(E)`. The symmetry on sphere factors of degrees r and s has sign `(−1)^(rs)`.

For a map f, the stable triangle is `X → Y → C(f) → ΣX`; the boundary on π_k lowers degree by one. For m ≥ 1, `E/m` is the derived cofiber of multiplication by m, equivalently `E∧ᴸS/m`. Multiplication is taken in the stable localization; point-set cones represent it only after a common replacement of the coherent diagram (§§7.2 and 7.7). The transition `E/p^(r+1) → E/p^r` comes from the square with p on the source and identity on the target. The maps on the two outer groups in its Bockstein short exact sequence differ: quotient reduction on π_k(E)/p^r and multiplication by p on the torsion term.

Filtered spectra are coherent point-set diagrams with derived cofibres. Their increasing homological spectral sequence has `E¹_(s,t) = π_(s+t)(gr_s E)` and d_r of bidegree (−r,r−1). A complete decreasing tower has `E¹_(s,t) = π_(t−s)(fib(Y_s → Y_(s−1)))` and the separately specified differential. Completeness, exhaustiveness and vanishing of derived limits are distinct assumptions; no displayed page by itself states convergence. The tower differential has total degree −1: `(t+r−1)−(s+r)=t−s−1`.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.nerve`, `nerveMap`, `nerveFunctor`, `SSet.toTop` and `sSetTopAdj` as defined. Simplicial cells use `SSet.relativeCellComplex`, `SSet.Subcomplex`, `SSet.nonDegenerate`, standard simplices and `TopCat.diskBoundaryInclusion`. Ordinary chains use `SSet.chainComplex` and `AlgebraicTopology.singularHomologyFunctor`; normalised simplicial modules use the Dold–Kan equivalence. Category coefficients live in `ModuleCat R` and use its AB5 instance for exact filtered colimits. A derived-colimit comparison uses `CategoryTheory.Functor.leftDerived`, with `HasProjectiveResolutions` proved or supplied for the diagram category; the existence of that instance is not inferred from the module category alone.

Compact generation uses `CompactlyGenerated`, `CompactlyGenerated.of`, `compactlyGeneratedToTop` and `TopologicalSpace.compactlyGenerated`. The weak-Hausdorff subcategory, its closed products/mapping objects and closed-embedding pushouts are the extensions below. Padic residue comparisons use `PadicInt.toZModPow`, `PadicInt.lift_spec` and `PadicInt.lift_unique` from `NumberTheory.Padics.RingHoms`. Category-localisation and covering comparisons use `CategoryTheory.FreeGroupoid`, comma categories, `CategoryTheory.Grothendieck` and Mathlib's fibre-category interfaces. Monoidal constructions use `CategoryTheory.Core`, `MonoidalCategory` and `SymmetricCategory`. The coherent action input is Mathlib’s `CategoryTheory.MonoidalCategory.MonoidalLeftAction` from `CategoryTheory.Monoidal.Action.Basic`. Iso-class monoids and their functorial maps are `Skeleton.instMonoid`, `Skeleton.instCommMonoid`, `Skeleton.monoidHom` and `Skeleton.mulEquiv` from `CategoryTheory.Monoidal.Skeleton`; only their comparison with classifying-space components is new here; the algebraic component group is `Algebra.GrothendieckGroup`. The model-category construction uses `HomotopicalAlgebra.ModelCategory`, rather than a private collection of lifting predicates. Triangles use `CategoryTheory.Pretriangulated`; spectral-sequence pages use `CategoryTheory.Abelian.SpectralObject` and `SpectralSequence`. Completion comparisons use `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` from `RingTheory.AdicCompletion.AsTensorProduct`: over a commutative Noetherian ring R, for an ideal I and finite R-module M, the completed tensor product `(AdicCompletion I R) ⊗[R] M` identifies with `AdicCompletion I M`.

For §5.17 use `CategoryTheory.Pretriangulated` and `CategoryTheory.IsTriangulated` from `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` and `Mathlib/CategoryTheory/Triangulated/Triangulated.lean`. Use `CategoryTheory.Functor.IsHomological` from `Mathlib/CategoryTheory/Triangulated/HomologicalFunctor.lean` on the opposite category: it supplies exactness and zero-map preservation, not preservation of infinite products. Use `CategoryTheory.preadditiveCoyoneda` from `Mathlib/CategoryTheory/Preadditive/Yoneda/Basic.lean` for the additive represented functor and the discrete-diagram preservation predicates from `Mathlib/CategoryTheory/Limits/Preserves/Basic.lean`; the separate product-preservation hypothesis is essential.

### From Tau Ceti

Use `HomotopyGroup.map` and its homomorphism form, `TauCeti.homotopyGroupEquivOfPath`, the fundamental-group action and `HomotopyGroup.loopSpaceMulEquiv`. The path-component/loop comparison is `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup`. Use `TauCeti.LocalCoefficientSystem` with its constant and pullback functors, `TauCeti.CoveringSpace` with its monodromy functor, and `TauCeti.IsEilenbergMacLaneSpaceOne` with its asphericity condition. Comparisons preserve these basepoints, composition and coefficient handedness. Their Lean modules are `TauCeti.Topology.Homotopy.HomotopyGroup.{Map,BasepointChange,FundamentalGroupAction,LoopSpace}`, `TauCeti.AlgebraicTopology.LocalCoefficient`, `TauCeti.Topology.Covering.Monodromy.Basic`, `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic` and `TauCeti.AlgebraicTopology.EilenbergMacLane.Covering`.

### From AlgebraicKTheory

AlgebraicKTheory A0–A1 supplies the finite-projective splitting maps, finite block matrices, stable GL under trailing-identity stabilization, its elementary subgroup, normality, perfectness and equality with the commutator subgroup, for arbitrary associative unital rings including zero. Its projectives are right modules, with matrices acting on columns. For left R-modules use its A0 at Rᵐᵒᵖ, the canonical double-opposite scalar identification and the transpose/opposite adapter of §4.15. The underlying finite-projective category remains Tau Ceti's native category. No higher-K comparison is an input to A0–A1. The topology and plus multiplication on these supplied groups belong to §4.14.

### From RepresentationTheory/InductionRestriction

[RepresentationTheory/InductionRestriction](../RepresentationTheory/InductionRestriction/README.md#abstract-universal-central-extensions), Layer 7, “Abstract universal central extensions”, supplies surjective central homomorphisms of arbitrary groups, initiality among central extensions over the same target, existence for perfect groups through U=[F,F]/[F,R], perfection of U, unique lifts and independence of the presentation. The predicate `IsUniversalCentralExtension` in the acceptance file is an adapter expressing that supplied universal property on native groups in a fixed universe. Section 3.29 supplies the kernel–H₂ identification, superperfect recognition and the plus-fibre comparison; it does not reconstruct the abstract extension.

### From TangentialBordism

TangentialBordism B4.1–B4.2 supplies the mod-2 Steenrod squares on AlgebraicTopology's normalized ordinary cochains: higher diagonals and cup-i products, `Sq^k[c] = [c ∪_(n−k) c]` for c of degree n, naturality, Sq⁰=id, instability, the top square, additivity, Cartan, Adem, suspension stability, relative groups and Sq¹ equal to the mod-2 Bockstein. B4.2 supplies the stable operations on HF₂ from GeneralizedCohomology's HA model, H*(HF₂)=A with its admissible basis, and the mod-2 Adams tower with its Ext_A E₂-page and convergence to 2-completion for bounded-below spectra of finite type. These retain AlgebraicTopology's coefficient carrier, cup product and suspension isomorphism. No second Steenrod-square construction belongs to this roadmap.

### From DerivedModuleAlgebra on main

[DerivedModuleAlgebra §1.T.1](../DerivedModuleAlgebra/README.md#1t1-towers-lim-and-lim¹) supplies countable tower algebra on `ℕᵒᵖ ⥤ ModuleCat R`. Use it at R=ℤ with its integral abelian-group adapter `CompactCoefficients.Tower`: `ModuleTower.shift`, `ModuleTower.lim`, `ModuleTower.limOne`, their natural maps, the six-term boundary, derived-limit comparison and Mittag–Leffler vanishing. Its `Tower.toModuleFunctor`, `Tower.limComparison` and `Tower.limOneComparison` preserve that boundary and the Milnor maps. Its the lim¹ comparison for multiplication by p supplies the multiplication-by-p integer tower and the convergent-sum identification with ℤₚ/ℤ. Sections 4.11 and 7.9–7.11 add the unstable and spectral identifications with this same algebra.

### From GeneralizedCohomology

Consume [GeneralizedCohomology](../GeneralizedCohomology/README.md) at the following section contracts. All comparisons retain arbitrary integer homotopy degrees, universe lifts, basepoints, units and naturality. No point-set choice is inferred functorial from a choice of triangle cone.

- **G2.10:** `MappingPathSpace f` and `MappingPathFiber f b`, with their projection to the source, endpoint evaluation to the target, constant-path inclusion and fibre projection, together with `IsHurewiczFibration` and `IsHurewiczFibration.lift`, supply the path-space objects and maps. The fibre is the raw subspace of `A×C(I,B)` cut out by `γ(0)=f(a)` and `γ(1)=b`. Consume its contraction, endpoint Hurewicz/Serre lifting, strict-fibre flattening, path/loop homeomorphisms, all-universe lifting, naturality and homotopy-choice comparisons, followed by its fibration-LES comparison. Its fibre projection and constant-path point are used directly, without another carrier. For `id_B` the fibre is contractible even when B is disconnected; for `*→B` it is `Ω(B,b)`; for `A→*` it is A; an empty source has empty fibres. The mapping-path contraction fixes constant paths and is not a retraction over B. (H AT Props. 4.64–4.65, pp. 407–408.)
- **G2.1–G2.2:** pointed simplicial sets are `Under Δ[0]`, smash collapses the wedge in the product, `S¹=Δ[1]/∂Δ[1]`, `Sⁿ=(S¹)^∧n`, and spectra are modules over the symmetric sphere monoid under Day convolution. Consume all tensor/closed/enrichment laws, block actions, structure-map equivariance, free/evaluation adjunctions, levelwise limits and colimits, and the balanced smash coequalizer with its universal bimorphism maps. Its realization comparison uses the Kelley product. The new shift and cone adapters below are for this carrier; a right-written structure map `E_n∧S^m→E_(n+m)` is obtained from its left-written map by the displayed symmetry, with the block actions retained. (HSS §§1.1–1.2; S I Def. 3.1, p. 34, Construction 5.6 and Thm. 5.10, pp. 83–85.)
- **G2.3–G2.6:** consume the Kan–Quillen and level/stable projective models, positive/flat variants, functorial replacements, stable mapping spaces, native stable localization, its locally small additive/triangulated homs, derived closed smash and module models. Stable suspension has integer shifts and `π_k(ΣE)=π_(k−1)E`; rotation is `(g,h,−Σf)`. Derived products have product π-groups. Naïve groups are `colim_n π_(k+n)|E_n|`, with an abelian cofinal range `k+n≥2`, and a stable replacement computes true groups. Consume their semistable comparison, spectral Whitehead, compact sphere generation, connective-cell construction, free spheres, suspension spectra, sequential comparison and Freudenthal. The source-to-level maps include the low-degree set/group branches. For an Ω-spectrum, naïve π_k is π_k of its zero level for k≥0 and π₀ of its level −k for k<0; each level with k+n≥0 gives the corresponding comparison. A positive Ω spectrum computes true groups in sufficiently large positive levels. A naïve π-isomorphism is stable, and the converse holds between semistable spectra. (HSS Thms. 3.4.4 and 4.3.2; S I §§2–3, 6; S II §§1–5.)
- **G2.4 and G2.8:** consume strict monoid/ring and right-module objects (right modules are left modules over the opposite ring), the module-model free–forgetful adjunction, the Barratt–Eccles machine with full block-substitution laws, and positive-model rectification. Γ-spaces use the skeleton of finite based sets and covariant functors; special means the zero term is contractible and the Segal maps are weak, and very special means also grouplike π₀. Consume prolongation, assembly, all permutation actions, the connective-spectrum equivalence, the permutative-category input (coherent ⊕, zero and symmetry inducing the Segal maps), the multiplicative machine on bipermutative inputs, and the group-completion left adjoint, including its unit/counit and the full homological localization property. The broader spectrum-operad transfer theorem below states its precise additional generality. (BS Appendix §12, Def. 12.4, Thm. 12.9 and Prop. 12.10, pp. 56–58; S IV Thm. 1.3, p. 386.)
- **G2.7 and G3.8:** consume `HA`, its reduced-free-module levels, Dold–Kan/abelian Kan comparison, coefficient maps, Kan Ω status, `π₀HA=A` and all other π zero, the commutative HR and HM actions, unit and ordinary reduced/absolute/relative homology and cohomology comparisons. Consume full mapping-space truncation, `connectiveSpectrumMapsToHA`, connective covers, Postnikov sections, their adjunctions and compatible towers, with heart the abelian groups. A normalised smash-sphere complex is quasi-isomorphic to A[n], and need not be literally A[n]. For connective V and X with π_kX=0 for k≥1, consume [V,X]≅Hom(π₀V,π₀X), even when X has negative homotopy. A spectrum concentrated in degree zero is equivalent to Hπ₀ with the specified identity on π₀. Covers erase only groups below their cutoff, sections erase only groups above it, and the truncation triangle retains its map and boundary. (S I Example 1.14, p. 16; S II Prop. 5.24 and Thm. 5.25, pp. 265–266, Prop. 6.23, p. 279, Thms. 8.1 and 8.3, pp. 295–296; Jardine Lecture 06, Lemmas 14.1 and 14.3.)
- **G3.4, G3.7–G3.9:** consume coherent spectral telescopes, π commuting with filtered homotopy colimits, the Milnor sequence `0→lim¹[ΣP_i,E]→[hocolim P_i,E]→lim[P_i,E]→0` for represented theories, model tower replacements, derived products and the homotopy-limit fibre of `1−shift`. Its Milnor sequence is `0→lim¹π_(k+1)E_r→π_k holim E_r→lim π_kE_r→0`. Consume the chosen degree-p sphere representative and its coherent powers, their derived multiplication cofibers, sphere localization, rationalization and prime completion `E^∧_p=holim_(r≥1)E/p^r` with reduction induced by `(p,id)`, the identified function-spectrum model `F(S/p∞,ΣE)`, units, exactness, independence and idempotence. Completeness means the unit invertible, equivalently `F(S[1/p],E)=0`. Its Hom/Ext sequence is `0→Ext¹(ℤ/p∞,π_kE)→π_kE^∧_p→Hom(ℤ/p∞,π_(k−1)E)→0`; degreewise finite generation gives `π_kE^∧_p=π_kE⊗ℤ_p`. Rationalization is the exact coproduct-preserving functor E↦S_ℚ∧ᴸE with π_k(E_ℚ)=π_kE⊗ℚ; its unit is universal into rational spectra, equivalently spectra with uniquely divisible homotopy groups. Section 7.9 compares its Milnor maps with the supplied integral-module difference map. (S II Lemma 5.6 and Remark 5.9, pp. 257–258, Thm. 8.3, p. 297, Thm. 9.9, pp. 303–304.)
- **G5.4–G5.6:** consume KU, KO, ku, ko, built in G5.4 by G2.8's multiplicative machine from the skeletal bipermutative categories with endomorphism spaces O(r) and U(r), and their specified Bott/unit maps, rational stable-stem vanishing, the rational cohomology H*(K(ℤ,n);ℚ) for n≥1 (exterior for odd n, polynomial for even n), `S_ℚ≃Hℚ` and the all-degree stable rational Hurewicz comparison. The filtered-cochain Serre spectral sequence with its local tensor-cup pairings, derivation differentials and multiplicative convergence is DGFloer Layer 1 item 2's, which G5.6 consumes. The unstable rational H-space theorem and the graded rational classification below are additional comparisons. (S II Thm. 9.6, p. 302; H SS §§1.2–1.4, pp. 22–45.)
- **G2.9 and G3.10:** consume G2.9's classifiers of topological groups, the bar model of a well-pointed group and the polar deformation of GLₖ(ℝ) onto O(k), and G3.10's unstable skeletal mapping-space comparison `Map(X,Y)≃holim_m Map(X^m,Y)` with its pointed-set π₀ Milnor sequence, its nonabelian lim¹ orbit set and, for abelian tower groups, its identification with coker(1−shift).

**Supplier compatibility checks.** These specify which parts of these contracts the comparisons must preserve.

- The pointed zero object smashes to zero, while `S⁰∧K≅K`; `S¹∧S¹` realizes to S² and the product to a torus. Its smash-sphere simplicial model has one vertex, one edge and two top two-simplices, rather than the minimal sphere cell structure. The simplicial circle has one nondegenerate vertex and one edge.
- The sphere has `π₀=ℤ` and no negative groups, but is not an Ω-spectrum: `S¹→ΩS²` misses `π₂(ΩS²)=ℤ`. The zero spectrum is Ω and semistable. `F₁S¹→S` is stable with true `π₀=ℤ`, while its naïve `π₀` is a countable direct sum of ℤ and its comparison is noninjective. Consequently it is neither a level equivalence nor a naïve π-isomorphism; `F₁S¹` is not semistable. A truncated sequential spectrum with `X₀=S⁰`, `X₁=S¹` and `X₂=Δ[2]/∂Δ[2]`, sending only one top smash simplex nontrivially to X₂, has no compatible symmetric action.
- `Σ∞*=0`, `Σ∞S⁰=S`, and every suspension spectrum is connective and semistable. Positive cofibrations are isomorphisms in level zero, so the sphere is cofibrant in the absolute projective model but not positively cofibrant. A boundary inclusion `∂Δ[1]→Δ[1]` is a cofibration and not weak, whereas `Λ¹[2]→Δ[2]` is anodyne.
- The stable zero object is not the sphere, maps from S to HA give A, and localization at level equivalences alone fails to invert `F₁S¹→S`. Rotation of the identity triangle has third map `−Σid`. The sphere twist on degrees `(1,1)` is −1, on `(0,1)` is +1, and the minus sign is +1 after reduction to characteristic two. The sphere is the strict smash unit and initial among unital spectral rings, and the zero spectrum is terminal among unital spectral rings; HA has exactly the specified π₀. `S/2` has no homotopy-unital multiplication.
- For R=S the module model is the stable spectral model, `Ho(R-Mod)(R,M)=π₀M`, and weak equivalences are detected on underlying spectra. Its distinction from the level model uses the sphere, rather than the zero ring. Right regular modules over `M₂(ℤ)` have `e₁₂e₂₁=e₁₁` and reversed product `e₂₁e₁₂=e₂₂`.
- `H0=0`, `Hℤ` has no π₁ but the sphere has `π₃=ℤ/24`; the positive levels of HA are K(A,n), with its first level compared to the supplied BA. The ordinary cohomology comparison gives A for a point in degree zero and zero in negative degrees. Constant simplicial A has only π₀, Dold–Kan of A[1] has π₁=A, and the extra normalised cells in the smash sphere still give homology only in degree two. The unit `S→HR` induces `ℤ→R`. The zero ring and zero module give zero spectra, while `HF₂∧ᴸHF₂` differs from HF₂ by its nonzero degree-one dual-Steenrod class.
- For `E=Hℤ∨Σ²Hℤ∨Σ⁻²Hℤ`, the zero-connective cover removes only the last summand, and the section below degree zero keeps that summand. The cover of `Σ⁻¹Hℤ` is zero despite its nonzero source, and the zeroth section of a connective spectrum is Hπ₀.
- The constant point Γ-space is very special. The discrete Γ-space `n↦Aⁿ` for an abelian group A is very special; for a commutative monoid M it is special with its original component monoid. A constant two-point Γ-space fails both its zero-level and Segal conditions. The group-completion unit sends each object class to its Grothendieck generator.
- An identity-transition telescope is E and not `⊕ℕE`; the positive-integer telescope beginning with multiplication by one has π₀=ℚ for E=S. Identity-transition holim is E, a zero-transition tower has zero holim, and a stable-fibration tower of fibrant spectra has its literal limit as a holim model. A triangle-completion map alone supplies neither uniqueness nor functoriality.
- Prime completion preserves zero, sends the sphere's π₀ to ℤ_p, kills Hℚ, and has `π₁(H(ℚ/ℤ)^∧_p)=ℤ_p`; tensoring π₁ with ℤ_p would lose this last term. Rationalization kills H(ℤ/p) and S/p but retains `π₀S_ℚ=ℚ`; its first two telescope arrows multiply by one and two. Completeness and localization statements hold in every integer degree.

### From the other roadmaps on main

[AlgebraicTopology](../AlgebraicTopology/README.md), Stages 1–4, supplies ordinary and twisted singular chains, relative homology, excision with local coefficients (3.3), the cellular–singular comparison for arbitrary CW dimension with local coefficients (4.3), mapping cylinders, cellular approximation, CW cofibrations and `simplicialRealizationCW`, the realisation CW structure with one cell per nondegenerate simplex (4.7); Stages 5–6 supply Serre fibrations and ordinary cohomology; Stage 8 supplies the cubical/Kan comparison, NDR-pair relative homotopy, simply connected Hurewicz, CW Whitehead, `groupClassifyingSpace` on `nerve (SingleObj π)` with `groupClassifyingSpace_isEMOne`, `mapsToGroupClassifyingSpaceEquiv` and its pointed comparison with the ClassifyingSpaces models (8.8), relative and local-coefficient obstruction and difference cochains for Serre fibrations with path-connected n-simple fibres and arbitrary base monodromy (8.9), and `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability` and `ordinaryEMUniversalClass` for every CW complex (8.10). The new targets include arbitrary fibre pairs and the comparisons of realised nerves with category chains. A fibre pair not known NDR uses the explicit extension below.

[UniversalCovers](../../Completed/UniversalCovers/README.md), Stage 0 items 3–4, supplies the fundamental-group action and deck carrier; Stage 1 item 5 supplies the universal deck comparison, with its opposite-group convention; Stage 2 items 7–8 supply subgroup quotient covers and the normalizer/deck comparison. Stages 2–4 supply covering classification, covering-induced higher-homotopy maps, basepoint change and aspherical-space recognition. [ClassifyingSpaces](../ClassifyingSpaces/README.md), Stages 1.5–1.6, 3.11–3.15 and 4.16–4.19, supplies the join classifier, CW-type uniqueness, its functoriality, the H₁–abelianization comparison and group-(co)homology via the bar resolution; AlgebraicTopology 8.8 compares the realised group nerve with these models. Only the category-chain and coefficient/sign adapters are new here.

[DGFloer](../DGFloer/README.md), Layer 1 items 1–4, supplies degree-one Hurewicz, CW approximation, weak-equivalence invariance with local coefficients on arbitrary spaces, the fibration homotopy exact sequence including components, the homology and cohomology Serre spectral sequences `arbitraryCWSerreSpectralSequence` and `arbitraryBaseSerreSpectralSequence` with constant-ring fibre coefficients and their multiplicative cohomological forms, the spectral sequence of a filtered complex (item 3), Serre classes and simply connected Hurewicz modulo a class, and functorial CW K(A,n) from the abelian bar/Dold–Kan models, n≥1, with discrete A at n=0. Retain the trivial-group contraction, the circle comparison for K(ℤ,1), the comparison K(A,1)≃BA, and `H₃(K(ℤ/2,1);ℤ)=ℤ/2`, distinguishing it from the Moore space RP² with zero H₃. Map classification into K(A,n) is AlgebraicTopology 8.10's representability. (H AT Prop. 4.30, pp. 365–366; §4.3, Thm. 4.57, p. 393.)

[GrothendieckEulerForms](../GrothendieckEulerForms/README.md), Layer 2, supplies algebraic split K₀ and its universal additive invariant, with the pinned `TauCeti.SplitK0.grothendieckAddGroupEquiv` in `TauCeti.CategoryTheory.GrothendieckGroup.Split`. Mathlib supplies the algebraic component completion `Algebra.GrothendieckGroup`, the iso-class monoids `Skeleton.instMonoid`, `Skeleton.instCommMonoid`, and maps `Skeleton.monoidHom` and `Skeleton.mulEquiv` in `CategoryTheory.Monoidal.Skeleton`. The space-level component comparisons are new here. [IntegralLattices](../IntegralLattices/README.md), 0A, supplies integral forms, isometries and orthogonal sums; 0E supplies signatures, 2C supplies O(L), SO(L) and orthogonal-sum embeddings on arbitrary integral forms, and 6A supplies indefinite unimodular classification. Use `TauCeti.BilinForm.isometryGroup` from `TauCeti.LinearAlgebra.BilinearForm.Isometry` on the restricted integral bilinear form. [OrthogonalSpinGroups](../OrthogonalSpinGroups/README.md), 0C, supplies the bilinear/quadratic base-change comparison. [BordismFormalGroups](../BordismFormalGroups/README.md), F6.2, supplies the little-2-cubes operad; F6.5 supplies Sp∞, symmetric coherence, infinity-operads and the monoidal localization comparison; `spectraInfinityCategory` denotes this supplied carrier. [EllipticCohomology](../EllipticCohomology/README.md), E4.A, supplies the MU case and its reusable enriched-presheaf, finite-sum localization, Čech descent and Day-tensor machinery. Section 7.31 proves the HF₂-site hypotheses and the HF₂ versions of these constructions, with the same Adams coordinates `S^(n,s) = Σ^(−s) ν(S^(n+s))` and τ:S^(0,−1)→S^(0,0). It does not consume a parameterized synthetic-spectrum theorem from E4.A.

## How to read the build

Layers 1–2 build category spaces, chains and fibre tools for Quillen’s theorems. Layers 3–4 construct plus and group completion. Layer 5 compares point-set and derived spectral structures; Layer 6 assembles K-theory deloopings; Layer 7 supplies finite coefficients, completion comparisons and filtered convergence. Subsections give contracts, API, checks, sources and prerequisites. `Suggested.lean` states Quillen A in its comma form and B in both comma forms, the local-coefficient acyclicity criterion, plus existence and factorization, the second homotopy group and universal central extension of plus for aspherical sources, the H-space recognition theorem for plus constructions, freeness over simplex function rings, and generic cellular approximation in triangulated categories. Its definitions use native realised nerves, continuous path spaces, singular homology, fundamental groups, Tau Ceti's action of the fundamental group on the homotopy groups, and Mathlib's triangulated categories and additive represented functors. The constructions of category chains, plus spaces, monoidal completion and the spectral/coefficient comparisons are specified here with their full interfaces and checks; their carriers are introduced by the targets below. This document is the mathematical specification.

Reference abbreviations below are Q (Quillen), W IV/V (Weibel), C (Carlsson), H AT/SS (Hatcher), S (Schwede), HSS, BF, NS, BS, HA (Lurie), Sh (Shipley), HK III (Calmès et al.), Sch (Schlichting), Bu (Burklund), AT II (Araki–Toda), BHS (Burklund–Hahn–Senger), PP (Patchkoria–Pstrągowski) and Pst (Pstrągowski). M and TC in prerequisites mean the exact Mathlib and Tau Ceti suppliers above. The declarations in the acceptance file belong to `TauCetiRoadmap.StableHomotopyKTheory`; `SymmSpectrum` and SHC denote GeneralizedCohomology G2’s supplied symmetric-sphere-module carrier and stable localization, while `naivePi` and `pi` denote its naïve and true homotopy groups. The notation `homotopyFiber f b` denotes its `MappingPathFiber f b`, and `EilenbergMacLaneSpace A n` denotes DGFloer Layer 1 item 4’s CW K(A,n). These are supplier notations, not new carrier definitions.

## Layer 1: Classifying spaces and category homology

### 1.1 Classifying space of a small category and of a functor

For small C,D in fixed object/morphism universes, define `classifyingSpace C=|N C|` and `classifyingSpaceMap F=|N F|`. Vertices and edges give a π₁oid functor: the two-simplex identifies edge(f≫g) with edge(f) followed by edge(g). Make universe changes explicit.

- `classifyingSpace`: BC=|nerve C|.
- `classifyingSpaceMap`: BF=|nerveMap F|.
- B(id)=id.
- B(F⋙G)=BF≫BG.
- The functor B is nerveFunctor⋙toTop.
- `classifyingSpace_vertex`: X gives the vertex [X].
- An arrow f:X→Y gives an edge path [X]→[Y].
- Unfold BC to the nerve realisation.
- BF([X])=[FX].
- BF carries edge(f) to edge(Ff), after vertex identifications.
- The edge paths satisfy `edge(f≫g)≃edge(f)⋅edge(g)` rel endpoints and `edge(id)≃constant`.
- The vertices and edge classes define C→Π₁(BC).
- Every point is joined to a vertex.
- Use matching object and morphism universes; apply ULift/AsSmall otherwise. For Elements→C require coefficient universe ≤ object universe.

**Checks.**

- The classifying space of the ordered set 0 < 1 is homeomorphic to the unit interval, with vertices 0 and 1 the endpoints.
- The classifying space of the empty category is the empty space, and of the one-object one-morphism category is a single point; its canonical vertex is that point.
- The two Boolean objects of a discrete category give distinct vertices. The ordinal [1] also has distinct endpoint vertices, although its realisation is contractible.
- For a set S viewed as a discrete category, classifyingSpace S is homeomorphic to S with the discrete topology.
- For either endpoint of `[1]`, the realized identity differs from the realized endpoint-constant endofunctor, as detected at the other vertex.
- Endpoint inclusion `*→[1]` followed by the terminal functor `[1]→*` realizes to the point identity. The reverse composite realizes to the endpoint-constant interval map. These equalities fix composition order on the actual interval and point carriers.
- There is a continuous map classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2) (the reflection of the interval) that is not classifyingSpaceMap of any functor: B is faithful but not full.

(Q §1, LNM p. 89; W IV Characterization 3.1, Recipe 3.1.1 and Def. 3.1.4, pp. IV.24–25.)

*Needs:* M.

### 1.2 The realised boundary inclusion is the disk boundary inclusion

Prove the boundary/disk inclusion comparison: the realised arrow ∂Δ[n]→Δ[n] is isomorphic to ∂Dⁿ→Dⁿ in `Arrow TopCat`, n≥0. Derive it from AlgebraicTopology 4.7's homeomorphism of pairs `standardCellBallToOrderedSimplex n`, composed with the sup-norm ball/Euclidean disk comparison. Include the maps in this isomorphism; at n=0 the boundary is empty and the disk a point.

(W IV Def. 3.1.4, p. IV.25; Q §1, LNM p. 89.)

*Needs:* AlgebraicTopology 4.7, M.

### 1.3 The CW structure on the realisation of a simplicial set

the realized CW structure on X is an alias for AlgebraicTopology 4.7's `simplicialRealizationCW X` on Mathlib's realisation carrier: nondegenerate n-simplices are its n-cells, with realised characteristic maps, Hausdorffness, closure finiteness, the weak topology and cellular realised maps. The additions here are the skeleton indexing and the category-level consequences. Under Mathlib's indexing, simplicial skeleton n+1 realises to topological skeleton n.

- The supplied CW structure on |X|.
- n-cells correspond to nondegenerate n-simplices.
- |f| preserves skeleta.
- B(∐Cᵢ)≅∐BCᵢ, respecting inclusions.

**Checks.**

- The CW structure on |Δ[n]| has exactly C(n+1, k+1) cells of dimension k.
- |Δ[0]| has exactly one cell, of dimension 0, although Δ[0] has a simplex in every degree.
- With T2Space (SSet.toTop.obj X), the range of SSet.toTop.map (X.skeleton (n + 1)).ι equals the CW n-skeleton Topology.CWComplex.skeleton univ n.
- For C the one-object category of a nontrivial group G, the 1-cells of BC are the non-identity elements of G, not all elements of G.

(W IV Def. 3.1.4, p. IV.25; W IV Characterization 3.1 (4)–(5), p. IV.24.)

*Needs:* AlgebraicTopology 4.7, §1.2, M.

### 1.4 Realisations are strongly locally contractible

Prove strong local contractibility of realization: every point of |X| has a basis of contractible open neighbourhoods, without a local-finiteness assumption, including points incident to infinitely many cells. AlgebraicTopology 4.7's cell-neighbourhood API contracts a smaller neighbourhood inside a given one; the open sets here are themselves contractible.

(H AT Appendix, Prop. A.4 and proof, p. 522.)

*Needs:* §1.3, AlgebraicTopology 4.7.

### 1.5 Realisations of monomorphisms are closed subcomplex embeddings

the closed-embedding realization theorem: a simplicial mono realises to a closed embedding with the nondegenerate-cell subcomplex as image. This is AlgebraicTopology 4.7's identification of sub-simplicial inclusions with CW subcomplexes, stated for an arbitrary mono through its image. A faithful functor injective on objects has a monomorphic nerve map, so it realises to such an embedding; faithfulness alone does not imply injectivity on vertices.

(H AT Appendix, discussion before Prop. A.1, pp. 519–520; W IV Characterization 3.1(4), p. IV.24.)

*Needs:* §1.3, M.

### 1.6 Compact sets in a realisation lie in finite subcomplexes

Prove finite-subcomplex containment of compact subsets: every compact K⊆|X| lies in a simplicial subobject with finitely many nondegenerate simplices, from the closure finiteness and weak topology of AlgebraicTopology 4.7; its item 4.3 gives the special case of singular simplex images. Finiteness does not count degeneracies, which occur in unbounded degrees even for a point.

(H AT Appendix, Prop. A.1 and proof, p. 520.)

*Needs:* §1.3.

### 1.7 B(C^op) is canonically homeomorphic to BC

Construct the canonical opposite-space homeomorphism: reverse each arrow string and its affine coordinates, fixing vertices. Route it through Mathlib's `SSet.opFunctor`: identify `nerve Cᵒᵖ` with `(nerve C).op` and the realisation of `X.op` with that of X by reversing simplex coordinates. This gives BC≅B(Cᵒᵖ) without choosing a functor C→Cᵒᵖ.

(Q §1, formula (3), LNM p. 91; W IV p. IV.25.)

*Needs:* §1.1, M.

### 1.8 Classifying space of a product of categories

The projections give a continuous bijection B(C×D)→BC×BD. Prove it is an ordinary-product homeomorphism when either nerve has finitely many nondegenerate simplices; in particular B(C×[1])≅BC×I.

(Q §1, formula (4), LNM p. 92.)

*Needs:* §1.1, M.

### 1.9 Classifying space of a product, compactly generated case

Construct the product homeomorphism for arbitrary small C,D using the compactly generated product, as GeneralizedCohomology G2.1's `realizationProductKelleyComparison` |K×L|≃|K|×_k|L| applied to the two nerves, composed with the nerve of a product. The ordinary product agrees when both categories have countably many arrows.

Use Mathlib’s compactly generated carrier to construct the full subcategory the category of compactly generated weak Hausdorff spaces cut out by: every compact Hausdorff image is closed. Its product is k(X×Y), and its mapping object is the k-ified compact-open space. Construct the compactly generated closed mapping-space adjunction, limits of compactly generated weak Hausdorff spaces and closed-embedding pushouts closed-embedding pushouts; the latter agree with ordinary pushouts. These are category/closure extensions of the carrier. (S, App. A, Def. 2.3 and Props. 2.4–2.5, pp. 421–423; NS, Construction B.6, p. 148, and Proposition C.1, p. 160.)

**Checks.**

- A compact Hausdorff factor has the ordinary product topology.
- maps from a point recover Y, with its topology.
- gluing two intervals at their endpoints gives the ordinary circle; the closed embedding remains closed in the pushout.

(Q §1, formula (4), LNM p. 92; W IV Characterization 3.1 (6), p. IV.24.)

*Needs:* §1.8, §1.1, GeneralizedCohomology G2.1.

### 1.10 A natural transformation induces a homotopy

For η:F₀→F₁, realise C×[1]→D to construct the classifying-space homotopy induced by η, with edge(η_c) as its track. A zigzag of transformations gives a map homotopy without requiring invertible components.

(Q §1, Prop. 2, LNM p. 92; W IV Homotopy-theoretic properties 3.2, p. IV.25.)

*Needs:* §1.1, §1.8.

### 1.11 Adjoint functors and equivalences induce homotopy equivalences

Prove adjunction invariance: realising the unit/counit of L⊣R makes BL and BR homotopy inverse. Retain BL and BR as the specified forward and inverse maps. Deduce equivalence invariance and invariance under a small skeleton of a skeletally small category.

(Q §1, Prop. 2, Cor. 1, LNM p. 92; W IV 3.2 and Example 3.2.1, p. IV.26.)

*Needs:* §1.10.

### 1.12 Categories with an initial or terminal object are contractible

Prove contractibility for categories with an initial or terminal object by natural-transformation contractions. An empty category meets neither hypothesis.

(Q §1, Prop. 2, Cor. 2, LNM p. 92; W IV Example 3.2.2, p. IV.26.)

*Needs:* §1.11.

### 1.13 The nerve commutes with filtered colimits of categories

For a filtered small diagram of small categories, construct the filtered-colimit comparison for nerves, respecting every stage inclusion. Finite strings and their equalities occur at a common stage, so the nerve commutes with this colimit degreewise.

(Q §1, before Prop. 3, LNM p. 92.)

*Needs:* M.

### 1.14 Homotopy groups commute with filtered colimits of categories

Prove that πₙ commutes with filtered categorical colimits, with a basepoint represented at a stage and transported along inclusions. Include π₀ as sets; compact spheres and homotopies lie in finite subcomplexes.

(Q §1, Prop. 3, LNM p. 92.)

*Needs:* §1.1, §1.3, §1.13, §1.6, §1.5.

### 1.15 Filtered colimits along homotopy equivalences

If all transitions of a filtered small categorical diagram realise to homotopy equivalences, prove every stage comparison is a homotopy equivalence, by the π₀/πₙ comparison and CW Whitehead.

(Q §1, Prop. 3, Cor. 1, LNM p. 92.)

*Needs:* §1.14, AlgebraicTopology 8.5, TC.

### 1.16 Filtered categories are contractible

Prove contractibility of filtered categories: filteredness contracts finite diagrams and hence finite subcomplexes; CW Whitehead upgrades weak contractibility to contractibility.

(Q §1, Prop. 3, Cor. 2, LNM p. 93; W IV Exercise 3.4, p. IV.34.)

*Needs:* §1.15, §1.12.

### 1.17 Homology of classifying spaces commutes with filtered colimits

Prove the filtered-colimit homology comparison for each unital ring R, fixed left coefficient module and n≥0, naturally in filtered small diagrams. Finite chain support and exact filtered module colimits supply the comparison.

(Q §1, Prop. 3 and proof, LNM p. 92; W IV Exercise 3.5, p. IV.34.)

*Needs:* §1.13, §1.6, AlgebraicTopology 2.2, M.

### 1.18 Path components of a classifying space

Construct the component equivalence: components are objects modulo the equivalence relation generated by arrows in either direction. Identify these classes with `CategoryTheory.ConnectedComponents`, with the class of each vertex sent to the corresponding object class. Directed reachability alone is insufficient.

(W IV Lemma 3.3, p. IV.27.)

*Needs:* §1.1, §1.3, §1.6, AlgebraicTopology 4.7, M.

### 1.19 Realisations of simplicial coverings are covering maps

Prove the realization covering theorem for a simplicial covering with unique simplex lifts after choosing a vertex lift. Identify the fibre at each vertex via open stars; an arbitrary simplicial mono has no such conclusion.

(Q §1 'Coverings of BC and the π₁', LNM p. 90; W IV Exercise 3.1, pp. IV.33–34.)

*Needs:* §1.3, M.

### 1.20 Coverings of BC are morphism-inverting functors

Construct the covering equivalence: coverings of BC correspond to Set-valued functors inverting arrows. F gives B(F.Elements)→BC, fibre F(c) and transport F(f). Recover covering morphisms as well, with explicit universe lifts.

(W IV Exercise 3.1, pp. IV.33–34; Local coefficients 3.5.1, p. IV.29; Q §1 'Coverings of BC and the π₁', Prop. 1, LNM p. 90.)

*Needs:* §1.1, §1.3, §1.19, §1.4, M, TC.

### 1.21 π₁ of BC is the automorphism group in C[C⁻¹]

Construct the fundamental-groupoid equivalence: the universal localisation of C at all arrows is equivalent to Π₁BC through the edge functor. Its automorphism group at c identifies π₁(BC,c); do not merely localise an endomorphism monoid.

(Q §1, Prop. 1, LNM p. 90; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.20, UniversalCovers Stage 2, §1.1, §1.3, M.

### 1.22 Presentation of π₁(BC) from a maximal tree

For connected C and a rooted maximal tree, prove the presentation of π₁(BC): generators are non-tree edges, tree edges equal 1, and every composable pair gives the two-simplex relation, retaining endpoint data.

- The root-to-X path in T; reverse oppositely traversed edges.
- The tree loop is `treePath(X)⋅edge(f)⋅treePath(Y)⁻¹`.
- Hom(π₁BC,H) corresponds to arrow labels with id↦1, f≫g↦label(g)label(f), and tree edges↦1.
- A homomorphism labels f by its value on treeLoop(f).

**Checks.**

- For [1] with its unique maximal tree, the only nonidentity edge is in the tree: there are no non-tree generators and π₁ is trivial.
- For two parallel arrows f,g:0→1 with f chosen as tree edge, the loop following g and returning along f is a generator of π₁=ℤ; reversing its traversal gives −1 instead of +1.
- For SingleObj C₃ and the empty edge tree, the two-simplex relations give a²=b and ba=1, hence a³=1 and π₁=C₃. Ignoring the two-simplices would give the free group on a,b, not C₃.

(W IV Lemma 3.4 and the group/monoid examples following it, pp. IV.27–28.)

*Needs:* §1.21, M.

### 1.23 Local coefficient systems on BC are morphism-inverting functors

For a ring R, construct an equivalence between local systems on BC and C→ModuleCat R inverting all arrows, by vertex evaluation and edge transport. Arbitrary category-homology coefficients need not invert arrows.

(W IV Local coefficients 3.5.1, p. IV.29; Q §1, after Prop. 1, LNM p. 90.)

*Needs:* §1.21, M, TC.

### 1.24 Homology of a small category with coefficients in a functor

Define the degree-n category homology of C with coefficients M over R from ⊕_(c₀→⋯→cₙ)M(c₀): d₀ applies M(f₁), interior faces compose and the last deletes the final vertex. Normalise the alternating-face complex. Coefficient and categorical maps respect identities/composition at chain level.

- Hₙ of categoryChainComplex(C,M).
- Degree `n` is `⊕_{σ∈NₙC}M(σ₀)`, with alternating faces.
- A coefficient transformation induces Hₙ maps, preserving id/composition.
- F:C→D gives Hₙ(C,F*M)→Hₙ(D,M), functorially.
- A short exact coefficient sequence gives the homology LES.
- H₀(C,M)≅colim M naturally.
- Normalisation preserves this homology.
- For constant A, identify the complex with (nerve C).chainComplex A and its homology.
- The simplicial module with the degree-n terms and coefficient face maps.

**Checks.**

- For C connected and M the constant functor at A, categoryHomology C M 0 ≅ A.
- If C has a terminal object t then categoryHomology C M n = 0 for n > 0 and categoryHomology C M 0 ≅ M t.
- For G = ℤ/2 and trivial coefficients ℤ, categoryHomology (SingleObj G) ℤ 2 = 0 while group cohomology H²(G; ℤ) = ℤ/2: homology cannot be replaced by trivial-coefficient cohomology.

(W IV (3.5) The homology of C and BC, p. IV.28; Q §1 'The homology of BC', LNM p. 91.)

*Needs:* M.

### 1.25 Homology of a category computes derived functors of colim

Prove the category-homology/derived-colimit comparison, naturally in M. First construct projective resolutions in the category of coefficient diagrams for small C by sums of free representables, and identify the augmented bar resolution and its acyclicity.

- Hₙ₊₁(C,R[C(X,−)])=0.
- The functor M↦Hₙ(C,M).
- colim on module-valued diagrams is additive.
- Hₙ(C,−)≅Lₙcolim; first construct projective resolutions of diagrams.
- The comparison commutes with every coefficient transformation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91.)

*Needs:* §1.24, M.

### 1.26 Twisted cellular chains of a category

For morphism-inverting M, construct an isomorphism between twisted cellular chains of BC and normalised category chains. A simplex coefficient is at c₀; d₀ transports by f₁. Verify signs and transport in degrees one and two.

the twisted cellular/singular comparison is an alias for AlgebraicTopology 4.3's cellular–singular comparison with local coefficients, attaching-path transport and relative comparison for CW pairs of arbitrary dimension. The addition here is their application to |N C| with the cells of §1.3: skeletal relative groups are sums of the cell fibres, and the connecting map gives the transported cellular boundary. (H AT, §3.H, pp. 327–329; Q, §1, pp. 89–90.)

**Checks.**

- circle monodromy T gives differential T−1. For T=−1 acting on ℤ this is x↦−2x, rather than +2x.
- A point has only degree-zero coefficient homology.
- trivial transport recovers the supplied ordinary cellular comparison.

(Q §1 'The homology of BC', LNM p. 91; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.3, §1.23, §1.24, AlgebraicTopology 4.3.

### 1.27 Homology of BC with local coefficients is homology of C

Deduce the local-coefficient homology comparison for small C and morphism-inverting coefficients, naturally in both inputs and all n≥0, using twisted cellular-to-singular comparison and normalisation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91; W IV Local coefficients 3.5.1, p. IV.29.)

*Needs:* §1.24, §1.23, §1.3, AlgebraicTopology 4.3, §1.26.

### 1.28 Classifying spaces of translation categories

For a left G-set X, the translation category is Mathlib's `CategoryTheory.ActionCategory G X` (objects x, arrows g:x→g·x), with projection `ActionCategory.π` to `SingleObj G`. Prove the translation-category covering: this projection realises to a covering map over BG with fibre X over the vertex, and the lift of edge(g) at x ends at g·x. For X=G there is exactly one arrow between any two objects, so §1.12 contracts the total space; record this as contractibility of the regular translation category. Separately, for a subgroup H, prove the translation-category subgroup comparison: the inclusion of `SingleObj H` at the coset eH, through Mathlib's stabilizer comparison, is an equivalence onto the translation category of G/H, so §1.11 gives a homotopy equivalence whose composite with the covering is the inclusion-induced map BH→BG. Neither branch uses AlgebraicTopology 8.8's comparison with ClassifyingSpaces.

**Checks.**

- For the trivial group the translation category of X is discrete: the cover is the discrete space X over a point.
- For G=ℤ/2 and X=G the total space is contractible while BG has H₁=ℤ/2, so the regular cover is not a product.
- For g=(01), h=(12) in the symmetric group on Fin 3, lifting edge(g) and then edge(h) from x=2 ends at (hg)(2)=1, not at (gh)(2)=0.

(W IV Translation categories 3.3.1, p. IV.27; Exercise 3.2, p. IV.34.)

*Needs:* §1.18, §1.11, §1.12, §1.19, §1.20, §1.3, M.

### 1.29 Asphericity of the nerve model

the K(G,1) comparison for the group nerve is an alias for AlgebraicTopology 8.8's `groupClassifyingSpace_isEMOne`: `classifyingSpace (SingleObj G)` is the same carrier as its `groupClassifyingSpace G`, and its contractible free G-space Eπ→Bπ is isomorphic as a cover to the regular cover of §1.28 at X=G, by the covering classification of UniversalCovers. The property is `TauCeti.IsEilenbergMacLaneSpaceOne`, with π₁ at the vertex identified with G by edge(g)↦g; under the π₁ convention of Conventions this is a homomorphism. The Tau Ceti theorems `IsCoveringMap.isAspherical` and `IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne` in `TauCeti.AlgebraicTopology.EilenbergMacLane.Covering` give the same conclusion from §1.28's covering directly.

**Checks.**

- The trivial group has a one-point nerve realisation, and the condition holds there.
- For G=ℤ the identification sends edge(1) to 1, rather than to −1.
- For g=(01), h=(12) the class of edge(h) followed by edge(g) goes to gh, which differs from hg; an anti-homomorphism would fail this.

(W IV Application 3.4.1, p. IV.28; Translation categories 3.3.1, p. IV.27.)

*Needs:* §1.28, §1.1, AlgebraicTopology 8.8, UniversalCovers Stages 2–4, TC.

### 1.30 Comparing the group nerve with the supplied classifying space

For every group G, the group-nerve/classifying-space equivalence from `B(SingleObj G)` to the ClassifyingSpaces join model is AlgebraicTopology 8.8's pointed comparison of `groupClassifyingSpace G` with the ClassifyingSpaces models (its item 8.8b), normalized so that the induced group map is the identity on G. This is a based homotopy equivalence, natural up to specified based homotopies under group homomorphisms. The object and morphism universes are matched with explicit lifts. Its π₁ map carries edge(g) to g in the supplier's identification; the convention is edge(gh) ≃ edge(h) followed by edge(g).

The comparison API includes basepoint and map naturality, the fundamental-group compatibility of the group-nerve comparison and the compatibility with the supplied H₁–abelianization isomorphism. The homology comparison is stated in §1.32.

**Checks.**

- For the trivial group the nerve is a point; the join model is contractible, and the comparison is a homotopy equivalence rather than a homeomorphism of the selected models.
- For `G = ℤ`, the comparison preserves the generator of π₁ and the associated H₁ generator. It cannot identify the space with a point.
- For `G = ℤ/2`, the nerve has one nondegenerate cell in each dimension and realizes to `RP^∞`; the comparison preserves the nonzero odd-degree integral homology.
(W IV Example 3.1.3, p. IV.25; Applications 3.4.1–3.4.2, p. IV.28; ClassifyingSpaces Stages 1.5–1.6, 3.11–3.15 and 4.16–4.19.)

*Needs:* §1.1, §1.3, §1.29, AlgebraicTopology 8.8.

### 1.31 Conjugate homomorphisms induce freely homotopic maps

For ψ(g)=hφ(g)h⁻¹, construct a free homotopy Bφ≃Bψ with basepoint track edge(h). Conjugation is retained; a based homotopy is not asserted.

**Checks.**

- Conjugate homomorphisms give free homotopies with the specified conjugating track; under §1.30's comparison they correspond to the conjugation-orbit description of unbased maps into BG.
- For G=C₃, φ=ψ=id and conjugator h=1, the specified homotopy has constant track. For h=a≠1 the same endpoint maps are joined by a homotopy whose track represents a, not 1; abelian conjugation fixes the maps but does not erase the chosen track. A separately chosen constant homotopy still joins the equal endpoint maps.
- For G=S₃ and the inner automorphism by (01), the track edge((01)) is not null, so the free homotopy is not based.

(W IV Homotopy-theoretic properties 3.2, p. IV.25.)

*Needs:* §1.10, §1.30, §1.1, TC.

### 1.32 The nerve of a group is the bar construction

Construct the coefficient-preserving the group-nerve/bar chain isomorphism by inverting each bar entry without reversing the tuple. It is an isomorphism of the unnormalised complexes, and it descends to the normalised ones. Category d₁(g,a)=g·a−a; pinned bar d₁(g,a)=g⁻¹·a−a. Compute d₂ to fix the h*g interior term. Prove the homology compatibility of the group-nerve comparison: under §1.30's comparison and §1.27, the induced homology map agrees with ClassifyingSpaces Stage 4's bar-resolution comparison composed with this chain isomorphism; the join-to-bar map is a chain homotopy equivalence.

**Checks.**

- For C = SingleObj G and M a G-representation, categoryHomology C M n ≅ groupHomology M n through this isomorphism.
- The bar boundaries are d₁[g,a]=g⁻¹a−a and d₂[g,h,a]=[h,g⁻¹a]−[gh,a]+[g,a].
- For g=(01), h=(12) on Fin 3, (gh)(2)=0 and (hg)(2)=1.
- On ℤ² let g act by T=((0,−1),(1,−1)), of order three. At e₁ the category boundary is (−1,1), equal to the pinned bar boundary at g⁻¹; the bar boundary at g instead gives (−2,−1).

(W IV Application 3.4.2 and (3.5), p. IV.28.)

*Needs:* §1.24 for the chain isomorphism; §1.27, §1.30 and ClassifyingSpaces Stage 4 for the homology comparison; M.

### 1.33 The nerve of a groupoid is a Kan complex

Prove the Kan property of groupoid nerves by inverse-filled outer horns and composition-filled inner horns. For a general category, only the inner-horn property applies.

(BS Appendix §12, p. 55 (arXiv v3).)

*Needs:* M.

### 1.34 Classifying spaces of groupoids are 1-types

Prove the 1-type property and B G≃⊔_[x]B Aut(x), using chosen component representatives and their actual inclusion maps. Each component has zero πₙ for n≥2.

(BS Appendix §12, pp. 55–56; W IV Def. 4.1, p. IV.36.)

*Needs:* §1.11, §1.29, §1.18, §1.3.

### Examples

The ordered category 0 → 1 realises to an interval; a discrete category realises to its discrete object set. The nonidentity arrows of a one-object group category are exactly its one-cells. In degree one, the bar boundary carries the chosen inverse action; its two-simplex relation agrees with edge composition.

### Dependencies

Nerve, realisation, CW and covering suppliers; preceding cells/chains for local comparisons.

## Layer 2: Homotopy fibres, realisation and Quillen’s theorems

### 2.1 Weak homotopy equivalences of spaces

Define `IsWeakHomotopyEquivalence f` on native continuous maps by bijective π₀ and every positive πₙ at all source basepoints, including the empty/nonempty distinction. Give identity, two-out-of-three and homotopy invariance; CW Whitehead gives a homotopy inverse.

- `IsWeakHomotopyEquivalence`: Bijective π₀ and all positive πₙ at every basepoint.
- Weak equivalences satisfy two-out-of-three.
- A homotopy equivalence is weak.
- Homotopic maps have the same weak-equivalence property.
- Between CW spaces, a weak equivalence admits a homotopy inverse.

**Checks.**

- The identity of any space is a weak equivalence.
- Any map between contractible spaces is a weak equivalence.
- The inclusion of one point into a two-point discrete space is not a weak equivalence (π₀ fails), although it is an isomorphism on all π_n at its basepoint.
- For CW complexes X, Y, f is a weak equivalence iff it is the forward map of a homotopy equivalence.
- S¹⊔*→{a,b} is bijective on components and correct on all π at *. It fails at a circle point: π₁=ℤ maps to zero.

(H AT §4.1, Thm. 4.5, p. 346; H AT §4.1 CW Approximation, p. 352.)

*Needs:* AlgebraicTopology 8.5, M, TC.

### 2.2 Serre fibrations induce bijections on relative π-groups

Extend relative homotopy to arbitrary fibre pairs. For Serre p and b=p(e), prove the relative-homotopy comparison for Serre fibrations: πₙ(E,p⁻¹b,e)→πₙ(B,b) bijective for n≥1, with group compatibility where defined, by disk lifting without an NDR hypothesis.

Construct the relative disk lift using the pair-homeomorphism from a cylinder with bottom and side boundary to a disk cylinder with its bottom. This promotes the Serre disk HLP to relative disk lifting and proves the relative-group comparison even when the fibre inclusion is not NDR. (H AT, proof of Theorem 4.41, pp. 376–377.)

(H AT §4.2, Thm. 4.41 and proof, p. 376.)

*Needs:* AlgebraicTopology 5.5 and 8.1.

### 2.3 For a fibration the fibre is the homotopy fibre

For Hurewicz p, prove the strict-fibre inclusion into hofib is a homotopy equivalence; for Serre p, prove a weak equivalence. The stronger result requires HLP for every parameter space.

(H AT §4.3, Prop. 4.65, p. 408.)

*Needs:* GeneralizedCohomology G2.10, DGFloer Layer 1 item 2 (fibration homotopy exact sequence), §2.2, AlgebraicTopology 5.5, TC.

### 2.4 Connecting map of a homotopy fibre

Construct the homotopy-fiber boundary map: loop shift followed by ω↦(a₀,ω), giving δ:πₙ₊₁B→πₙF. It is a homomorphism for n≥1 and a pointed map at zero; based naturality includes basepoint transports.

- δ:πₙ₊₁B→πₙhofib(f).
- For n≥1, δ is a group homomorphism.
- Strict squares commute with δ.
- δ is loop-shift followed by the loop inclusion.

**Checks.**

- For f = 𝟙 B, connecting is the trivial map.
- For the inclusion of the point b into B, connecting is bijective in every degree (it is the loop-space shift).
- A path δ:a₀→a₁ in the strict fibre changes the boundary by basepoint transport along (δ,const_b). Use the path equivalence in degree zero and its group form in positive degrees.
- For Σ₂⊂Σ₃ the boundary is g↦gΣ₂. It cannot be a group homomorphism because Σ₂ is not normal; π₀ of the fibre is only a pointed set.

(W IV Homotopy Fiber 1.2, p. IV.3; H AT §4.3, p. 407.)

*Needs:* GeneralizedCohomology G2.10, M, TC.

### 2.5 Long exact sequence of a homotopy fibre

For every based continuous map, the exactness at the recurring πₙF,πₙA,πₙB terms and π₀A is GeneralizedCohomology G2.10's application of DGFloer Layer 1 item 2's fibration homotopy exact sequence to `MappingPathFiber`. The addition here is the identification of the supplied boundary with §2.4's loop-shift the homotopy-fiber boundary map, in every degree and with basepoint transports. The π₀F end is a pointed-set sequence, not an abelian-group LES.

(H AT §4.2, Thm. 4.41, p. 376; W IV Homotopy Fiber 1.2, p. IV.3; Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, DGFloer Layer 1 item 2, §2.4, TC.

### 2.6 The π₁-action at the pointed-set end of the fibre sequence

Identify the supplied low-degree π₁(B,b) action on π₀F by appending loops. Its orbits are fibres of π₀F→π₀A; the constant-path stabiliser is im(π₁A→π₁B). Under the chosen multiplication, appending ω acts on the left by [ω].

(W IV Homotopy Fiber 1.2, p. IV.3; W IV Exercise 3.3, p. IV.34.)

*Needs:* §2.5.

### 2.7 Transport of homotopy fibres along paths in the base

Define the homotopy-fiber transport along ω by (a,γ)↦(a,γ⋅ω). Its specified inverse is transport along ω⁻¹; path homotopy and concatenation give the homotopies. Boundary naturality includes the path between transported and selected fibre basepoints.

- Along ω:b→b′, send (a,γ) to (a,γ⋅ω).
- The inverse up to homotopy is transport along ω⁻¹.
- Endpoint-fixed path homotopies give homotopic transports.
- Transport(ω⋅ω′)≃transport(ω′)∘transport(ω); constant transport≃id.
- For σ:a₀→a₁ and ω=fσ, δ at a₁ after basepoint change along ω equals transported δ at a₀, then fibre basepoint change along (σ(t),ω|[t,1]), including the initial concatenation reparametrisation.

**Checks.**

- transport f (Path.refl b) is homotopic to the identity.
- For the inclusion of the point b, transport along a loop ω is γ ↦ γ.trans ω on Ω B b; on π₀(Ω B b) ≅ π₁(B, b) it is left multiplication by [ω] in Mathlib's group structure.
- proj ∘ transport f ω = proj.
- For BH → BG and a loop g ∉ H, transport acts on π₀(homotopyFiber) = G/H nontrivially; transport is not the identity on π₀.

(H AT §4.3, Prop. 4.61, p. 405.)

*Needs:* GeneralizedCohomology G2.10, §2.4, M, TC.

### 2.8 Homotopy pullbacks and homotopy-cartesian squares

Define the path pullback by (a,γ,c), γ:f(a)→g(c). A strict square's constant-path comparison defines the homotopy-cartesian condition; a chosen commuting homotopy defines the homotopy-cartesian condition for a specified square homotopy. Give projections, functoriality and fibration pullback comparison.

- Triples (a,γ,c), γ:f(a)→g(c).
- The projections carry the track γ between their composites.
- Swap a,c and reverse γ.
- The strict-square comparison to the path pullback is weak.
- Pullback against a point b is hofib(f,b).
- A strict pullback of a Serre fibration is homotopy-cartesian.

**Checks.**

- homotopyPullback (point b) (point b) is the loop space Ω B b.
- For any map p : E → B, the square with E′ = E, B′ = B, α = id, h = id and p′ = p is homotopy-cartesian (the comparison is the inclusion of E into the mapping path space of p).
- For a proper subgroup H ⊂ G the square (strict fibre point → BH over point → BG) is not homotopy-cartesian.

(Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, §2.1, §2.3, §2.5, §2.6, AlgebraicTopology 5.5.

### 2.9 Homotopy-cartesian squares over a contractible base

For contractible B, prove the compactly generated path pullback of A→B←C is homotopy equivalent to A×C, with chosen contraction/endpoint data. A square is homotopy-cartesian exactly when its product comparison is weak. Separately, for a square E′→E over B′→B with contractible B′ and a chosen b′, prove the contractible-corner criterion: its comparison E′→E×ᴴ_B B′ is weak exactly when the induced E′→hofib(E→B,h(b′)) is weak. Contracting B′ and retaining the specified square homotopy gives this identification; it does not require B to be contractible.

**Checks.**

- For B′ contractible, the square is homotopy-cartesian iff E′ → homotopyFiber p (h b′) is a weak equivalence.
- For B′ a point the source-corner criterion is the definition of the homotopy fibre comparison.
- For A=C=B=[0,1] with identity maps, the path pullback is homotopy equivalent to A×C, a contractible space, while the strict pullback is the diagonal; both are contractible, so the comparison is weak.

(Q §1 'The exact homotopy sequence', LNM pp. 96–97.)

*Needs:* §2.8, §2.7.

### 2.10 Pasting homotopy-cartesian squares

Prove homotopy-cartesian pasting: both squares imply the rectangle; given the right square, the left and outer rectangle conditions are equivalent. For homotopy-commuting squares use the concatenated chosen homotopies.

(Q Proof of Thm. B, LNM p. 99.)

*Needs:* §2.8, §2.5, §2.6, GeneralizedCohomology G2.10, §2.1, §2.3.

### 2.11 From comma categories to homotopy fibres

Construct the forward-arrow comparison the forward-comma comparison map: B(F↓d)→hofib(BF,[d]), with projection c and path F(c)→d. Its covariant change agrees with forward transport. The dual the reverse-comma comparison map uses d↓F and reversed paths.

- B(Y\\f)→hofib(Bf,[Y]), reversing the arrow track.
- Its projection is B(StructuredArrow.proj).
- For u:Y→Y′, comma change and transport along edge(u)⁻¹ give homotopic comparisons.
- B(f/Y)→hofib(Bf,[Y]) uses the forward arrow track.
- On the strict category fibre, the comparison agrees up to homotopy with x↦(x,const).

**Checks.**

- For f = 𝟭 C′ both source and target are contractible, so commaToHomotopyFiber is a weak equivalence.
- For H⊂G, ∗\f is the H-action groupoid on G. Its components are Hv; the fibre components are v⁻¹H. The comparison sends Hv↦v⁻¹H and every component is contractible.
- Restricted to the strict fibre f⁻¹(Y) ⊆ Y\f (objects (X, id)), it agrees with homotopyFiber.ofFiber.
- For {0}→(0<1), 1\f is empty but the fibre at 1 is contractible. Theorem B’s hypothesis is essential.

(W IV Example 3.2.3, p. IV.26; Q §1, LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, §1.10, §2.7, §1.8, M.

### 2.12 Quasi-fibrations

Define the quasifibration condition on p by every strict-fibre comparison being weak. Prove the relative-homotopy characterisation, Serre implication and distinguished-subspace path-pullback comparison. This condition does not supply a continuous lifting function.

- Every strict-fibre comparison is weak.
- Serre fibrations are quasifibrations.
- The homotopy-fibre LES becomes the strict-fibre LES.
- For surjective p and path-connected B, equivalently all πᵢ(E,p⁻¹b)→πᵢ(B,b) are bijective, with the low-degree pointed-set clauses.

**Checks.**

- The projection B × F → B is a quasi-fibration.
- The projection of the mapping cylinder of f onto I is a quasi-fibration iff f is a weak equivalence.
- The identity of any space is a quasi-fibration.
- The map [0, 1/2] ⊔ [1/2, 1] → [0, 1] given by the two inclusions is not a quasi-fibration: its homotopy fibres are all two points, but its fibre over 0 is one point.

(H AT §4.K 'Quasifibrations', p. 479; Q §1, lemma preceding 'Proof of Thm. B', LNM p. 97.)

*Needs:* GeneralizedCohomology G2.10, §2.1, §2.3, §2.5, AlgebraicTopology 5.5 and 8.1.

### 2.13 Relative π-groups of excisive triads

For excisive triads (X;A,B) and (Y;C,D), let f carry A into C and B into D. If f gives bijections of both relative homotopy sets/groups πᵢ(A,A∩B)→πᵢ(C,C∩D) and πᵢ(B,A∩B)→πᵢ(D,C∩D) for i<n and surjections for i=n, at every basepoint, prove the same assertions for πᵢ(X,A)→πᵢ(Y,C), and symmetrically for the other pair. Interiors of A,B and C,D cover their respective spaces. Keep the low-degree pointed-set clauses and arbitrary-pair homotopy interfaces.

(H AT §4.K, Prop. 4K.1 and proof, pp. 476-478; May, Cor. 2.3, p. 94.)

*Needs:* AlgebraicTopology 8.1.

### 2.14 Dold–Lashof criterion for open covers

Prove the open-cover quasifibration criterion: if B is covered by open sets and the restriction over each finite intersection is a quasifibration, the whole map is a quasifibration. Begin with B=U∪V and restrictions over U,V,U∩V, then use the excisive-triad comparison for arbitrary covers. No numerability condition is needed in this criterion; none of the intersection hypotheses can be silently omitted.

**Checks.**

- The intersection restriction must be distinguished as well as the two separate restrictions.

(H AT §4.K, Lemma 4K.3, p. 480; H AT §4.K, proof of Lemma 4K.3, p. 480; May, Cor. 2.4, p. 95.)

*Needs:* §2.12, §2.13, AlgebraicTopology 8.1.

### 2.15 Dold–Lashof criterion for exhaustions

Prove the exhaustion criterion for quasifibrations for B=⋃Bₙ with each Bₙ distinguished and every compact subset contained at a finite stage. Require the compact homotopy factorisation in E; weak topology/compact support ensures relative representatives occur at a stage.

(H AT §4.K, Lemma 4K.3(b) and proof, p. 480; May, Thm. 2.6, p. 95.)

*Needs:* §2.12, §2.1.

### 2.16 Dold–Lashof criterion for deformations

Prove the deformation criterion for quasifibrations for compatible E,B deformations into preserved E′,B′. Require p|E′ quasifibred, pD_E=D_Bp and every terminal fibre map a weak equivalence.

(H AT §4.K, Lemma 4K.3(c) and proof, pp. 480-481; May, Lem. 2.5, p. 95.)

*Needs:* §2.12, §2.1, §2.5, AlgebraicTopology 8.1.

### 2.17 Realisation of simplicial spaces and bisimplicial sets

Construct simplicial-space coend realisation and its singular adjoint, agreeing with SSet on discrete levels. For bisimplicial sets give iterated realisation, diagonal, transpose and external product, preserving the inclusions and naturality in compactly generated spaces.

- The coend ∫ⁿ Xₙ×Δⁿ.
- Realisation is left adjoint to Y↦C(Δⁿ,Y).
- Levelwise discrete realisation agrees with |X|.
- Iterated realisation of p↦|Tₚ|.
- The diagonal n↦Tₙ,ₙ.
- Realisation preserves colimits.

**Checks.**

- The realisation of the constant simplicial space at Y is homeomorphic to Y.
- For the bisimplicial set Δ[r] ⊠ Δ[s], the realisation is homeomorphic to Δ^r × Δ^s.
- For a simplicial set X, the realisation of the discrete simplicial space is SSet.toTop.obj X.
- The diagonal of Δ[1]⊠Δ[1] has four vertices. Mathlib’s `SimplicialObject.diagonal`, the long-edge map Xₙ→X₁ of one simplicial object, is a different operation.

(Q §1, Lemma preceding the proof of Thm. A, LNM p. 94; W IV Def. 3.6, p. IV.29.)

*Needs:* §1.8, M.

### 2.18 Diagonal and iterated realisation

Construct the diagonal-realization comparison with iterated realisation, compatible with transposition. Prove the compactly generated bisimplicial-space version using the simplex-product homeomorphism.

(Q §1, Lemma preceding the proof of Thm. A, LNM pp. 94–95; W IV Def. 3.6, p. IV.29.)

*Needs:* §2.17, §1.8.

### 2.19 Proper simplicial spaces

Define the properness condition for simplicial spaces by closed Hurewicz-cofibration latching inclusions. Latching means the degeneracy-image union with induced topology, empty at zero. Use the HEP supplier on the image of each closed latching embedding; discrete levels and one-direction bisimplicial realisation are proper.

- The degeneracy-image union in Xₙ and its inclusion.
- All latching inclusions are closed Hurewicz cofibrations.
- Levelwise discrete objects are proper.
- Realising one direction of a bisimplicial set gives a proper simplicial space.

**Checks.**

- A constant simplicial space at Y is proper: in degree 0 its latching inclusion is ∅ → Y, and in positive degrees it is the identity of Y; both have the homotopy extension property.
- The nerve of a category viewed as a discrete simplicial space is proper.
- For a bisimplicial set `T`, the latching subspace of `p ↦ |T_{p,•}|` in degree `n` is the realisation of the simplicial subset of degenerate `(n, •)`-simplices, a subcomplex.
- Take X₀=* and X₁={0}∪{1/k:k≥1}, with s₀(*)=0. The point inclusion has no neighbourhood deformation: each 1/k is its own path component. This 1-skeletal simplicial space, and its free extension to a simplicial space, fail properness in degree one.

(NS Appendix C, paragraph before Prop. C.3, p. 161.)

*Needs:* §2.17, AlgebraicTopology 4.5.

### 2.20 Realisation of simplicial spaces preserves finite limits

Prove finite-limit compatibility of realization in compactly generated weak Hausdorff spaces: realisation preserves terminal objects, binary products and equalisers, hence all finite limits. Give the product and pullback comparison maps and naturality. This claim concerns the coend realisation with compactly generated topology and does not make the ordinary TopCat product automatically correct.

(NS Appendix C, Prop. C.1, p. 160.)

*Needs:* §2.17.

### 2.21 The gluing lemma for pushouts along h-cofibrations

Prove the gluing lemma for closed HEP inclusions for maps of pushout diagrams of compactly generated weak Hausdorff spaces. Require the attaching maps in both diagrams to be closed Hurewicz cofibrations and the three vertical maps to be weak equivalences. Then their pushout map is a weak equivalence. All maps commute with the attaching maps; an arbitrary quotient need not preserve a weak equivalence.

(NS Appendix C, Lemma C.2 (Gluing Lemma), p. 161.)

*Needs:* §2.1, AlgebraicTopology 4.5.

### 2.22 Pushout products of h-cofibrations (Strøm's product theorem)

Prove the pushout-product theorem for closed HEP inclusions: the inclusion (A×Y)∪(X×B)→X×Y is a closed Hurewicz cofibration when A→X and B→Y are closed Hurewicz cofibrations in the chosen compactly generated category. The product topology and the closedness hypotheses are part of the assertion.

(NS Appendix C, proof of Prop. C.3, p. 161.)

*Needs:* AlgebraicTopology 4.5.

### 2.23 Weak equivalences of proper simplicial spaces

Prove realization invariance under levelwise weak equivalences: a levelwise weak equivalence between proper compactly generated simplicial spaces realises to a weak equivalence, by skeletal gluing and compactness. Both properness hypotheses are required.

(NS Appendix C, Prop. C.3, p. 161; W IV Thm. 3.6.1(i), p. IV.29.)

*Needs:* §2.19, §2.21, §2.18, AlgebraicTopology 4.5, §2.1, §2.22.

### 2.24 Realising levelwise homotopy fibre sequences

Prove the connected realization fiber sequence: a map of proper simplicial spaces with compatible simplicial basepoints, levelwise homotopy-fibre sequences and connected base/fibre levels realises to a fibre sequence.

(Waldhausen 1978, Lemma 5.2, as used in the proof of W V Prop. 1.7, p. V.8; BF Appendix B, connectedness observation following Thm. B.4, p. 121.)

*Needs:* §2.23, §2.12, §2.14, GeneralizedCohomology G2.10, §2.18, §2.15, §2.16.

### 2.25 The π_*-Kan fibre-square theorem

For a square V→X over W→Y of bisimplicial sets, assume every vertical row is homotopy-cartesian, X and Y are π_*-Kan and π₀X→π₀Y is a Kan fibration. Prove the bisimplicial fiber theorem under the Kan condition on homotopy groups: its diagonal square is homotopy-cartesian. Define the Kan condition on the simplicial homotopy groups by the following horn condition: for m,t≥1, a∈X_(m,0) and k≤m, every compatible family ξᵢ∈πₜ(X_(m−1,*),dᵢa), i≠k, lifts to ξ∈πₜ(X_(m,*),a) with dᵢξ=ξᵢ. Define these groups using vertical Kan replacement. Row-connected X satisfies this condition; π₀-fibration is a separate assumption in the disconnected case.

**Checks.**

- A bisimplicial set with connected vertical rows satisfies the horn condition, by transport to a degeneracy of a zero-row basepoint.
- A bisimplicial group satisfies the condition through simplicial-group horn filling.
- A bisimplicial set constant vertically on a simplicial set K has zero positive row homotopy groups and satisfies this condition even when K is not Kan. Thus the separate Kan-fibration condition on π₀ in the square theorem cannot be inferred from it.

(BF Appendix B, §B.3, criterion B.3.1 and Thm. B.4, pp. 119–121; proof pp. 121–128.)

*Needs:* GeneralizedCohomology G2.10, §2.23, §2.18, AlgebraicTopology 8.2.

### 2.26 Bousfield–Kan homotopy colimit of a diagram of spaces

Define the homotopy colimit of the space diagram X by realising ⊔_(c₀→⋯→cₙ)X(c₀), for small C and compactly generated values. In degree one d₀ applies X(f), d₁ retains the source point. Give its cocone, functorial maps and terminal-object comparison.

- Realise strings i₀→⋯→iₙ weighted by X(i₀).
- Forget the coefficient point to map to BI.
- Transformations induce hocolim maps, preserving id/composition.
- Objectwise weak equivalences induce weak hocolim maps for compactly generated Hausdorff values.
- The constant-point hocolim is BI.
- The augmentation to colim X.

**Checks.**

- hocolim I (const point) is homeomorphic to classifyingSpace I.
- If I has a terminal object t, hocolim I X → X t is a homotopy equivalence.
- For X : I ⥤ Type viewed as discrete spaces, hocolim I X ≅ classifyingSpace (Grothendieck X).
- For the span point ← S⁰ → point, colim is a point but hocolim is the suspension of S⁰, i.e. S¹.

(NS Appendix C, Def. C.4 and Prop. C.5, p. 162; Q §1, lemma preceding 'Proof of Thm. B', LNM pp. 97–98.)

*Needs:* §2.17, §2.19, §2.23.

### 2.27 Realisation of a proper simplicial space is its homotopy colimit

For proper simplicial X, construct the realization/homotopy-colimit equivalence over Δᵒᵖ, respecting the cocone. Properness ensures the ordinary coend computes the derived colimit. Construct the replacement augmentation from the simplicial replacement and compare its double realisation with |X| by the extra-degeneracy contraction and skeletal gluing. This supplies the comparison directly, without assuming an unstated Reedy model structure.

(NS Appendix B, Lemma B.7 with proof and footnote 44, p. 149 (arXiv pagination; p. 386 in Acta Math.).)

*Needs:* §2.19, §2.23, §2.26, §2.1.

### 2.28 Quasifibrations over a nerve

For X:C→spaces sending all arrows to weak equivalences, prove the homotopy-colimit-to-classifying-space comparison is a quasifibration with fibre X(c) at each vertex, for the simplicial-replacement projection.

(Q §1, lemma and proof preceding 'Proof of Thm. B', LNM pp. 97–98; W IV Thm. 3.6.1(ii), p. IV.29.)

*Needs:* §2.26, §2.12, §2.14, §2.8, §2.15, §2.16, §1.3.

### 2.29 Thomason’s homotopy-colimit comparison

For F:C→Cat, construct the natural weak equivalence Thomason's comparison map: hocolim B(Fc)→B(∫F), agreeing on each fibre inclusion. Prove it by comparing both sides with the diagonal of the bisimplicial set whose (p,q)-simplices are strings in C of length p with a q-string in the fibre at the source (§2.18), and applying the realisation lemma for levelwise weak equivalences (§2.23) to the levelwise adjunction equivalences of §1.11. In degree one it sends a base arrow f:c→d and x∈F(c) to (f,id):(c,x)→(d,F(f)x); the reverse arrow is not the canonical comparison. The Grothendieck construction retains its specified (c,x) objects and F-defined arrows.

**Checks.**

- A one-object one-arrow indexing category gives B(F(*)) on both sides, with identity comparison.
- constant terminal fibres give BC on both sides, with the base projection identifying the comparison with identity.
- over [1], the edge attached to x∈F(0) goes from (0,x) to (1,F(0→1)x), with fibre arrow the identity. Reversing the comparison does not give this canonical edge map.

(Thomason 1979, Thm. 1.2; Kahn Thm. 1.4.3 and Lemma 1.4.5, pp. 6–7.)

*Needs:* §2.26, §1.11, §2.18, §2.23, M.

### 2.30 The homology spectral sequence of a functor

Construct the coefficient-functor homology spectral sequence for every coefficient functor M:C→ModuleCat R: E²_p,q=H_p(D;d↦H_q(F↓d;M∘proj))⇒H_p₊q(C;M), using covariant comma transport. Use the first-quadrant double complex whose (p,q) term is the sum of M(c_0) over pairs of strings c_0→⋯→c_q in C and F(c_q)→d_0→⋯→d_p in D. Fixing p, the rows are the category chain complexes of the comma categories F↓d_0 with coefficients M(c_0), whose homology gives the displayed E² page. Fixing q, each column is a sum of the nerve chains of the under-categories F(c_q)↓D, which have initial objects (§1.12), so the total homology is H_*(C;M). Convergence is DGFloer Layer 1 item 3's for a first-quadrant filtration. For precofibred F the strict-fibre inclusion into F↓d has a left adjoint by definition (W IV 3.7.3), so it is homotopy final and gives the corollary E²_p,q=H_p(D;d↦H_q(F⁻¹(d);M)), the strict-fibre form used in §4.9. For morphism-inverting M, §1.27 identifies the abutment with local-coefficient homology of BC.

(W IV Exercise 3.7, p. IV.34, for cofibred F and the strict-fibre double complex; Kahn Cor. 1.4.6, p. 7, for constant coefficients.)

*Needs:* §1.24, §1.25, §1.12, §1.27, DGFloer Layer 1 item 3, M.

### 2.31 Quillen's Theorem A

Prove `quillenTheoremA` for small F:C→D: contractibility of every B(F↓d) makes BF a homotopy equivalence by CW Whitehead. Give its opposite-category dual.

(Q §1, Thm. A, LNM p. 93; proof LNM pp. 95–96; W IV 3.7 Quillen's Thm. A with proof, p. IV.30.)

*Needs:* §2.18, §2.23, §2.28, §1.12, §1.7, M.

### 2.32 Quillen's prefibred functors are SGA 1 prefibered functors

Prove the prefibred comma adjunction: Quillen's prefibred condition, that each strict-fibre inclusion F⁻¹(d)→d↓F has a right adjoint compatible with projection, is equivalent to Mathlib's `Functor.IsPreFibered` (SGA 1 VI.6.1, existence of cartesian lifts in Mathlib's weak sense). Mathlib's `Functor.IsFibered`, which adds closure of cartesian arrows under composition, is not required.

(W IV Fibered and Cofibered functors 3.7.3, p. IV.31; Q §1, LNM p. 93.)

*Needs:* §1.11, M.

### 2.33 Theorem A for prefibred and precofibred functors

For prefibred F, contractible strict fibres imply Theorem A by fibre-to-comma adjunctions; give the precofibred dual. The fibres are nonempty.

(W IV Cor. 3.7.4, p. IV.31.)

*Needs:* §2.31, §2.32.

### 2.34 Quillen's Theorem B

For small F:C→D, prove Theorem B in both comma forms. In Quillen's and Weibel's primary form, if every d→d′ induces a homotopy equivalence B(d′↓F)→B(d↓F) under the contravariant base change, then §2.11's reverse-comma comparison map B(d↓F)→hofib(BF,[d]), with reversed arrow paths, is weak; this is `quillenTheoremB_structuredArrow`. Prove it from the dual form below applied to Fᵒᵖ:Cᵒᵖ→Dᵒᵖ, since (d↓F)ᵒᵖ is Fᵒᵖ↓d, using §1.7's opposite homeomorphisms and path reversal on the fibre. In the dual form `quillenTheoremB`, if every d→d′ gives a homotopy equivalence B(F↓d)→B(F↓d′), the forward-arrow comparison the forward-comma comparison map is weak. State the homotopy-cartesian squares with their paths and naturality. The theorems in `Suggested.lean` state weak comparisons preserving the projection up to homotopy on `MappingPathFiber`, the same raw endpoint-constrained subspace as GeneralizedCohomology G2.10's carrier. The Lean forms of A and B use a common object universe containing the morphism universe, as required by Mathlib’s `nerveMap`; arbitrary object/morphism universes use the explicit `ULift` comparisons of §1.1.

(Q §1, Thm. B and Corollary, LNM p. 97; proof LNM pp. 98–99; W IV 3.8 Quillen's Thm. B with proof, p. IV.31.)

*Needs:* §2.31, §2.28, §2.8, §2.10, §2.11, §2.5, §2.9, §1.12, §1.7.

### 2.35 Theorem B for prefibred functors

For prefibred F whose base-change functors f*:F⁻¹(d′)→F⁻¹(d) all realise to homotopy equivalences, deduce that BF⁻¹(d)→BC→BD is a homotopy fibre sequence, from the d↓F form of §2.34 and the fibre-to-comma right adjoint of §2.32. Dually, for precofibred F whose cobase-change functors f_*:F⁻¹(d)→F⁻¹(d′) all realise to homotopy equivalences, deduce the same from the F↓d form and the left adjoint. Use the fibre inclusion and basepoint path; nonempty fibres alone do not suffice.

(W IV Cor. 3.8.1, p. IV.32, for the prefibred form; W IV Exercise 3.6(c), p. IV.34, for the precofibred form.)

*Needs:* §2.34, §2.32, §2.11.

### 2.36 Classifying spaces of a group extension form a fibre sequence

For surjective G→Q with kernel N, prove BN→BG→BQ is a homotopy-fibre sequence with π₁ sequence N→G→Q. The functor SingleObj G→SingleObj Q is prefibred with strict fibre SingleObj N, and base change along q∈Q is conjugation by a chosen lift, an isomorphism; §2.35's prefibred form applies. For a nonsurjective map, its homotopy fibre has extra coset components.

(W IV Cor. 3.8.1, p. IV.32.)

*Needs:* §2.35, §1.30.

### Examples

The fibre of an identity is contractible, while the fibre of a point mapping to X is ΩX. For a projection A × B → B, transport has the endpoint direction. A proper simplicial object and a merely levelwise equivalence are distinguished by the degeneracy cofibration hypotheses. The group-extension comparison uses a surjection with the kernel.

### Dependencies

Layer 1 and ordinary topology; properness, fibre hypotheses and CGWH products for realisation.

## Layer 3: Acyclic maps and the plus construction

### 3.1 Acyclic spaces

Define `IsAcyclicSpace F`: F is nonempty and path-connected, with Hₙ(F;ℤ)=0 for n>0, equivalently the augmentation induces homology isomorphisms. Apply this predicate to all homotopy fibres; positive homology vanishing alone admits the empty space.

- `IsAcyclicSpace`: Nonempty and H̃ₙ(F;ℤ)=0 for all n≥0.
- An acyclic space is path-connected.
- Contractible spaces are acyclic.
- Homotopy equivalence preserves acyclicity.

**Checks.**

- A one-point space is acyclic.
- The empty space is not acyclic: it fails nonemptiness, and its H₀=0 differs from H₀(point)=ℤ, so the augmentation is not a homology isomorphism.
- The circle is not acyclic: H₁(S¹; ℤ) = ℤ.
- There exists an acyclic space with nontrivial fundamental group.
- construct the binary icosahedral subgroup Γ⊂SU(2), identify Γ≅SL₂(𝔽₅), and use SU(2)≅S³ to obtain its free left action. Its image in SO(3) is A₅. Form the oriented quotient manifold S³/Γ and prove that it is a homology 3-sphere. For a selected point, construct the puncture carrier; excision and the local orientation class prove acyclicity, and van Kampen preserves π₁≅Γ. (W IV Exercise 1.1, p. IV.14; H AT §1.3, p. 75, for the free unit-quaternion action and binary polyhedral subgroups.)
- IsAcyclicSpace F holds whenever ContractibleSpace F (Mathlib).

(W IV Def. 1.3, p. IV.4.)

*Needs:* M; for the homology-sphere and puncture construction, AlgebraicTopology Stage 1's van Kampen, Stage 3's excision and Stage 6's local orientation classes and manifold duality, and UniversalCovers Stage 0 items 3–4 (action and deck carriers), Stage 1 item 5 (universal deck comparison) and Stage 2 items 7–8 (subgroup quotient covers and normalizer/deck comparisons).

### 3.2 An acyclic space has perfect π₁ with vanishing H₂

For every path-connected acyclic space F, prove superperfectness of its fundamental group: π₁F is perfect with H₂(π₁F;ℤ)=0. First prove it for F of CW type by degree-one Hurewicz and the universal-cover fibration; then pass to arbitrary F through DGFloer Layer 1 item 2's CW approximation W→F, a weak equivalence, which preserves π₁ and singular homology. This form applies to homotopy fibres, whose CW type is not assumed. Its π₁ need not be trivial.

(W IV Lemma 1.3.1 with proof, p. IV.4.)

*Needs:* §3.1, §1.29, §2.5, AlgebraicTopology Stage 8, DGFloer Layer 1 items 1–2 (degree-one Hurewicz, CW approximation), §1.32, M.

### 3.3 Acyclic maps

Define `IsAcyclicMap f` by acyclicity of every hofib(f,y). Give identity, composition and homotopy invariance.

- `IsAcyclicMap`: Every homotopy fibre is acyclic.
- Composites remain acyclic.

**Checks.**

- The identity map is acyclic.
- X → point is acyclic iff X is acyclic.
- The forward map of a homotopy equivalence is acyclic.
- A point→(Poincaré sphere minus a point) is an integral homology isomorphism, but fails π₁ surjectivity and its loop-space fibre is not acyclic.

(W IV Def. 1.4, p. IV.4.)

*Needs:* §3.1, GeneralizedCohomology G2.10, §2.7.

### 3.4 Acyclic maps are surjective on π₁ with perfect kernel

Prove surjectivity on π₁ and perfectness of the kernel at every basepoint. The fibre argument applies without a CW assumption. In this argument the image of π₂Y in π₁F is central, and π₁F is perfect since H₁F=0; its quotient ker(π₁f) is therefore perfect. The π₀ map is bijective since all homotopy fibres are nonempty and connected.

(W IV Def. 1.4, p. IV.4.)

*Needs:* §3.3, §3.2, §2.5.

### 3.5 Homology with local coefficients through a regular cover

For a principal G-cover X′→X of a connected CW space, with X′ not necessarily connected, construct the regular-cover twisted-chain isomorphism: chains with coefficients in the local system of M are C_*(X′;ℤ)⊗_(ℤ[G])M, using inverse deck action on the right and M on the left. In degree zero H₀(X;ℤ[G]) is ℤ[G/H] for H the image of π₁X in G. This is natural; passing tensor through homology additionally requires flatness.

(H AT §3.H, Prop. 3H.4, p. 331.)

*Needs:* AlgebraicTopology 2.6, UniversalCovers Stage 2.

### 3.6 Serre comparison on fibres

Prove the Serre fibre comparison: a map of Serre fibrations with connected fibres, connected CW bases and trivial integral fibre-homology monodromy has a fibre homology isomorphism if the base and total maps do. Pull the target fibration back to the source base; the resulting map to the original target total space is a homology isomorphism by the absolute Serre comparison and integral universal coefficients. It remains to compare fibrations over the same base.

Construct the relative fibre Serre spectral sequence for a map E→E′ of Serre fibrations over a common connected CW base B, with integral coefficients and no trivial-monodromy assumption. Filter the chain mapping cone of C_*(E)→C_*(E′) by the inverse-image skeletal filtrations. Its fibre coefficient system at b is H_q(Cone(C_*(F_b)→C_*(F′_b))), with transport induced by paths and their compatible homotopies. Use the homological cone convention Cone(f)_n=C_n(E′)⊕C_(n−1)(E), with differential (b,a)↦(db+f(a),−da). Identify the first-quadrant E₂ page as H_p(B;H_q(Cone(C_*F→C_*F′))), converging to H_(p+q)(Cone(C_*E→C_*E′)).

- Identify the E₁ differential with the cellular boundary with transported fibre-cone coefficients; retain the cone sign and the comparison with singular chains.
- Prove naturality under commuting maps of fibration diagrams and independence of cellular replacements from E₂ onward.
- Prove convergence with the actual finite, exhaustive and separated filtration in each total degree, and identify the abutment with relative homology when the map is a cofibration.

To deduce the comparison theorem, suppose q is the least nonzero fibre-cone homology degree. Its coinvariants are nonzero: the cone exact sequence is 0→coker H_q(f)→H_q(Cone(f))→ker H_(q−1)(f)→0, with outer terms trivial π₁B-modules; if the kernel is nonzero it gives a nonzero trivial quotient, and otherwise the cone homology is itself a nonzero trivial module. Thus E₂_(0,q) is nonzero, has no outgoing differential and has no incoming differential from a lower nonzero row. This contradicts the vanishing total-cone homology. This argument retains relative monodromy rather than assuming it is trivial.

**Checks.**

- Over a point, the map *→S¹ has fibre-cone and total-cone H₁=ℤ and all other homology zero; E₂_(0,1)=ℤ survives unchanged.
- An identity comparison has acyclic fibre and total cones, so every E₂ term and every abutment group is zero.
- For the product comparison S¹×*→S¹×S¹ over S¹, the fibre cone has only H₁=ℤ. The E₂ entries (0,1) and (1,1) are both ℤ and survive to total-cone H₁=H₂=ℤ, distinguishing the base degree from the relative fibre degree.
- For f=id on ℤ in degree zero the cone differential from degree one to zero is +1, so H₀=H₁=0; changing to the zero map gives H₀=H₁=ℤ and fails the identity comparison.

(H SS 1, Prop. 1.12, p. 20. Its printed proof omits the base-and-total-to-fibre implication; the relative fibre construction and first-nonzero-row argument above supply that implication from the absolute filtrations and filtered-complex construction.)

*Needs:* DGFloer Layer 1 items 2–3 (absolute Serre filtrations, their naturality, and filtered-complex spectral sequences and convergence), AlgebraicTopology 2.6 and 3.3–4.3 (transported coefficients, excision and cellular comparison), GeneralizedCohomology G2.10 (fibration pullbacks).

### 3.7 Acyclic maps are local-coefficient homology isomorphisms

Prove `IsAcyclicMap.iff_homology` for connected CW spaces. For the forward direction pull back along the universal cover Ỹ→Y: over the simply connected Ỹ the integral Serre spectral sequence of the pulled-back fibration has trivial monodromy and acyclic fibre, so it collapses and X̃=f*Ỹ→Ỹ is an integral homology isomorphism. Its chains form a quasi-isomorphism of bounded-below free ℤ[π₁Y]-complexes, and tensoring with M over ℤ[π₁Y] computes the local-coefficient comparison by §3.5. For the converse, §3.5 at the possibly disconnected principal π₁Y-cover f*Ỹ gives H₀(X;f*ℤ[π₁Y])=ℤ[π₁Y/im π₁f], so π₁f is onto; then apply fibre comparison over a simply connected base. All target local systems are required. The statement in `Suggested.lean` uses Tau Ceti’s induced twisted homology maps for every target local system over every unital ring and includes spaces of CW type.

- For connected CW spaces, acyclic f and gf imply acyclic g.

(W IV Lemma 1.6 with proof, p. IV.5.)

*Needs:* §3.3, GeneralizedCohomology G2.10, AlgebraicTopology 2.6 and 5.5, UniversalCovers Stage 2, §3.6, §3.5, §2.8.

### 3.8 Plus constructions as acyclic maps

Define the recognition predicate `IsPlusConstruction f x P` on based maps by acyclicity and ker(π₁f)=P. This predicate can be evaluated on arbitrary spaces; the geometric construction and uniqueness targets use the standing connected CW-type hypotheses. Identify the quotient and local-homology maps under these hypotheses. Perfectness is Mathlib's `Group.IsPerfect`. Construct the perfect radical of G, the largest perfect subgroup, prove normality/maximality and preservation under homomorphisms. Its API includes perfectness of the perfect radical, normality of the perfect radical, the maximality of the perfect radical for every perfect subgroup, functoriality of the perfect radical for homomorphisms, and idempotence of the perfect radical. Derive homomorphism functoriality by applying maximality to the perfect image of the radical.

- `IsPlusConstruction`: Acyclic f with ker(π₁f)=P.
- The subgroup generated by all perfect subgroups is perfect and normal.
- The induced quotient isomorphism π₁X/P≅π₁Y.
- Homology is preserved for every quotient local system.

**Checks.**

- The identity is plus at the trivial subgroup.
- For X acyclic, X → point is a plus construction relative to π₁(X).
- For a perfect group such as A₅, the radical is the whole group.
- For an abelian group such as ℤ, the radical is trivial.
- For A₅×ℤ the radical is A₅×{0}; the nonperfect factor must survive the quotient.
- No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect.

(W IV Def. 1.4.1, p. IV.5, for plus recognition; Remark 1.5.1, p. IV.5, and Exercise 1.5, Perfect Radicals, p. IV.14, for the radical and its basic API.)

*Needs:* §3.3, §3.4, M.

### 3.9 Acyclic maps that are isomorphisms on π₁

Prove that an acyclic map from a connected source, bijective on π₁, is a weak homotopy equivalence: the fibres are weakly contractible. With CW-type source/target, deduce a homotopy equivalence.

**Checks.**

- For a connected source, f is a plus construction relative to the trivial subgroup iff f is a weak equivalence.
- Connectedness of the source is needed: the map from the disjoint union of a point and the punctured Poincaré sphere to a two-point space, based in the first component, is acyclic with trivial kernel at the basepoint and is not a weak equivalence.
- The inclusion of a point into the punctured Poincaré sphere is an integral homology isomorphism but not π₁-bijective, and is not acyclic.

(W IV Exercise 1.2(b), p. IV.14; H AT §4.3 Exercise 16, p. 420.)

*Needs:* §3.3, §3.2, §2.5, AlgebraicTopology 8.5, M.

### 3.10 The plus construction by attaching 2- and 3-cells

For connected CW X and perfect normal P⊲π₁X, construct the plus space of (X,x) at P by 2-cells killing P and 3-cells cancelling relative classes. The relative free ℤ[π₁X/P] complex in degrees 3,2 has identity differential, ensuring every quotient local-system comparison.

- Attach only 2- and 3-cells to kill P.
- The subcomplex inclusion X→X⁺ₚ.
- The relative CW cells have dimensions 2 and 3.

**Checks.**

- For P = ⊥ the empty generating family attaches no cells, and the inclusion is the identity of X.
- With J the chosen generating family of P, the relative cellular complex of the universal quotient cover is ℤ[π₁X/P]^J in degrees 3 and 2 with identity differential, and zero elsewhere.
- For X=BA₅ and P=A₅, attaching only the 2-cells along a nonempty generating family J gives a simply connected space with H₂ ≅ H₂(A₅;ℤ)⊕ℤ^J, so the 3-cells are needed for the homology condition.

(H AT §4.2, Prop. 4.40 with proof and the construction following it, p. 374; W IV Exercise 1.4, p. IV.14; Thm. 1.5(1), p. IV.5.)

*Needs:* §3.8, UniversalCovers Stage 2, AlgebraicTopology 4.3 and 4.5.

### 3.11 π₁ of the plus construction

Under the connected CW/perfect-normal hypotheses, prove the fundamental-group kernel of plus and the fundamental-group comparison, carrying the inclusion's basepoint and identifying its induced map with the quotient map.

(H AT §4.2, construction after Prop. 4.40, p. 374; W IV Exercise 1.4, p. IV.14.)

*Needs:* §3.10, AlgebraicTopology 1.4.

### 3.12 The plus construction is an integral homology isomorphism

Under the same hypotheses, prove the integral homology comparison for plus in every degree, including zero, by tensoring the identity relative complex with constant coefficients.

(H AT §4.2, Prop. 4.40, p. 374.)

*Needs:* §3.10, AlgebraicTopology 4.3.

### 3.13 Local-coefficient acyclicity of plus

Prove the local homology comparison for plus for every local system on X⁺ by tensoring that relative group-ring complex. Deduce the plus-map recognition property, that the inclusion is acyclic with kernel P on π₁, naturally in coefficients. With §§3.10–3.12 this is the existence statement `plus_exists` of `Suggested.lean`.

**Checks.**

- For P = ⊥, plusConstruction.incl X ⊥ is a homotopy equivalence.
- If X is acyclic, plusConstruction X π₁(X) is contractible (Weibel IV Exercise 1.2(a)).
- For a perfect group G, plusConstruction (BG) ⊤ is simply connected with the same integral homology as BG, and π₂ ≅ H₂(G; ℤ) by Hurewicz (AlgebraicTopology Stage 8).

(W IV Def. 1.1, p. IV.2; W IV Thm. 1.5(1) and paragraph before it, p. IV.5.)

*Needs:* §3.11, §3.12, §3.7, §3.9, AlgebraicTopology 4.3, UniversalCovers Stage 2, §3.5.

### 3.14 Abelian spaces

Define `IsAbelianSpace`: connected with trivial π₁ action on every positive πₙ, including conjugation on π₁. Prove basepoint independence and the simple-space equivalence. Commutative π₁ alone is insufficient.

- `IsAbelianSpace`: Connected, with trivial π₁ action on every positive πₙ at every basepoint, including conjugation on π₁.
- Basepoint independence: if the action is trivial at one basepoint of a connected space, it is trivial at every basepoint, by transport along a path.
- Simply connected spaces are abelian.
- An abelian space has commutative π₁.

**Checks.**

- A point is abelian.
- S¹ is abelian (π₁ = ℤ abelian, higher π vanish).
- RP² is not abelian: π₁ = ℤ/2 acts by −1 on π₂ ≅ ℤ.

(H AT §4.1, p. 342.)

*Needs:* TC.

### 3.15 Connected H-spaces are abelian

Prove that a path-connected H-space is abelian at its unit, using the two unit homotopies, in the form of §3.14's `IsAbelianSpace` predicate. Homotopy associativity is not required.

**Checks.**

- A path-connected topological group, with Mathlib's IsTopologicalGroup.toHSpace, is abelian.
- The circle, as the unit-complex topological group, is abelian with π₁=ℤ.
- RP² admits no H-space structure, since it is connected and not abelian (§3.14).

(H AT §4.A, Example 4A.3, p. 422.)

*Needs:* §3.14, M, TC.

### 3.16 Relative Hurewicz theorem with trivial π₁-action

Prove relative Hurewicz under trivial action for a based (n−1)-connected NDR pair (X,A) of path-connected spaces, n≥2, with trivial π₁A action on πₙ(X,A). This group is abelian, Hᵢ(X,A;ℤ)=0 for i<n and the degree-n Hurewicz map is an isomorphism.

Construct the covering comparison on relative homotopy for a cover of based pairs (X′,A′)→(X,A), with A′ the full preimage and n≥2, by unique disk lifts and lifts of disk homotopies. A′ need not be connected. It commutes with the exact-sequence boundaries. (H AT, Prop. 4.1, p. 343, applied to disks and their homotopies.)

**Checks.**

- The identity cover gives the identity.
- The universal cover of (S¹∨S²,{*}) uses A′=ℤ and identifies the nonzero relative π₂, the free ℤ[ℤ]-module on one generator.
- The relative disk boundary lifts with its basepoint.

(H AT §4.2, Thm. 4.37 and Lemma 4.38 with proof, pp. 371–373.)

*Needs:* AlgebraicTopology 8.1 and 8.4, UniversalCovers Stage 3, TC.

### 3.17 Recognition of principal Eilenberg–Mac Lane fibrations

For a connected CW pair with hofib(A→X)=K(π,n), π abelian and n≥1, prove the principal-fibration criterion: A is weakly equivalent over X to hofib(k:X→K(π,n+1)) iff π₁A acts trivially on πₙ₊₁(X,A).

(H AT §4.3, Lemma 4.70 with proof, p. 413.)

*Needs:* §3.16, DGFloer Layer 1 item 4, GeneralizedCohomology G2.10, §2.5, AlgebraicTopology 8.10.

### 3.18 The Postnikov tower converges

For a tower X₀←X₁←⋯ of CGWH spaces with maps pₙ, define the homotopy limit of a space tower by points (xₙ,γₙ), where γₙ is a path in Xₙ from pₙ(xₙ₊₁) to xₙ, with the k-subspace topology inside the product of spaces and path spaces. the homotopy-limit evaluation maps evaluates xₙ; the induced map on homotopy limits is induced by a strictly commuting map of towers. A compatible family X→Xₙ gives the strict-limit-to-homotopy-limit comparison by constant paths. Compare this model with the inverse limit of a path-fibrant replacement tower; no inverse-limit assertion is made for a general unfibrant tower.

Prove the Milnor sequence for a space tower: for a tower of CGWH spaces and a point of holim, there are natural exact sequences `0→lim¹πᵢ₊₁Xₙ→πᵢ holim X→lim πᵢXₙ→0` for i≥1, with lim¹ of a tower of groups taken as the orbit set of `(gₙ)·(hₙ)=(gₙhₙpₙ(gₙ₊₁)⁻¹)`, and surjectivity of π₀ holim X onto lim π₀Xₙ with fibres the lim¹ orbit sets of the π₁ towers; for abelian towers the lim¹ term is DerivedModuleAlgebra §1.T.1's. For a compatible Postnikov tower of connected CW X, prove the Postnikov-limit weak equivalence: X→holim Xₙ is weak. Each πᵢ tower is eventually constant, so the Milnor sequence for a space tower has vanishing lim¹ terms. existence of Postnikov sections constructs a CW Xₙ with X→Xₙ inducing isomorphisms on πᵢ for i≤n and πᵢXₙ=0 for i>n; compatible sections and bonding maps are the additional tower target.

**Checks.**

- The constant one-point tower has one-point holim.
- The constant identity tower on X has evaluation holim→X a homotopy equivalence; the constant-path comparison is its inverse up to homotopy. At X=S², π₂ holim=lim π₂=ℤ and lim¹π₃=0. No map S²×S²→S² can restrict to degrees +1 and −1: its pullback a−b would have square −2ab≠0 although the generator of H²(S²;ℤ) has square zero.
- The discrete tail tower Xₙ={k∈ℕ | n≤k}, with inclusion bonding maps, has all stages nonempty but empty holim. Nonempty stages alone do not give a limit point.
- Every section of a point is weakly contractible.
- For S¹ the zeroth section is a point and each positive section is K(ℤ,1).
- The first section of S² is a point and the second is K(ℤ,2); the latter retains π₂ and is not a point.

For the unstable Milnor sequence use the homotopy equalizer of shift and identity on P=∏Xₙ: pull back the endpoint fibration Pᴵ→P×P along (shift,id), retaining the paths from pₙ(xₙ₊₁) to xₙ. Compatible sphere maps give surjectivity; differences between compatible nullhomotopies give the stated lim¹ action and its orbit set. Literal subtraction of maps is used only in the additive or stable setting of §7.9.

(H AT §4.3, Prop. 4.67, its proof and the following kernel calculation, and Cor. 4.68, pp. 410–411. The path-space model above is the explicit replacement construction; comparison with a fibration tower is part of the target.)

*Needs:* GeneralizedCohomology G2.10, DGFloer Layer 1 item 2 (fibration homotopy exact sequence), DerivedModuleAlgebra §1.T.1 on main, AlgebraicTopology 4.5 and 8.1.

### 3.19 Cohomology is represented by Eilenberg–Mac Lane spaces

For abelian A and B and n≥1, prove the Eilenberg–Mac Lane mapping-class comparison: based homotopy classes K(A,n)→K(B,n) correspond naturally to additive homomorphisms A→B, with the supplied functorial maps realizing them and composition agreeing with composition of homomorphisms. the ordinary cohomology representation comparison is an alias for AlgebraicTopology 8.10's `ordinaryEMRepresentability`, with universal class `ordinaryEMUniversalClass` and its pointed/reduced form: unbased classes X→K(A,n) give Hⁿ(X;A) for every CW complex X and n≥1, based classes give H̃ⁿ(X;A), naturally in X and A; n=0 uses locally constant functions to discrete A. Derive the Eilenberg–Mac Lane mapping-class comparison from it at X=K(A,n), using Hⁿ(K(A,n);B)≅Hom(A,B) from Hurewicz and universal coefficients.

(H AT §4.3, Thm. 4.57, p. 393.)

*Needs:* DGFloer Layer 1 item 4, AlgebraicTopology 8.10.

### 3.20 Postnikov towers of principal fibrations for abelian spaces

For abelian CW X, construct the Postnikov tower with principal K(πₙX,n) fibres, compatible X→Xₙ, bonding maps and k-invariants Xₙ₋₁→K(πₙX,n+1). State the homotopy truncation comparisons; abelianness supplies trivial action.

(H AT §4.3, Thm. 4.69, p. 412.)

*Needs:* §3.14, DGFloer Layer 1 item 4, GeneralizedCohomology G2.10, AlgebraicTopology 8.10, §3.17, §3.18.

### 3.21 Obstructions to extending maps through a principal fibration

For a principal K(A,n)-fibration classified by κ and a CW pair (W,V), an existing lift over V extends iff its obstruction in Hⁿ⁺¹(W,V;A) vanishes. Choices are governed by Hⁿ. Name the principal-fibration extension obstruction. the twisted extension obstruction is an alias for AlgebraicTopology 8.9's local-coefficient obstruction class for a Serre fibration with path-connected n-simple fibre and arbitrary base monodromy: the coefficient system is fibre πₙ transported along base paths, the class lies in Hⁿ⁺¹(W,V;πₙ) with those coefficients, it vanishes exactly when a lift agreeing with the given one on the (n−1)-skeleton extends over the (n+1)-skeleton, and the difference cochains govern the choices. The principal case is the specialization to the fibre K(A,n) with trivial monodromy.

**Checks.**

- trivial action recovers the principal obstruction.
- sign monodromy on ℤ gives T−1=−2, so replacing the local system by constant coefficients changes the obstruction complex.
- W=V has zero relative obstructions and a unique relative extension class.

(H AT §4.3, Prop. 4.72 with proof, p. 417.)

*Needs:* §3.20, §3.19, AlgebraicTopology 8.9.

### 3.22 Extending maps into abelian spaces

For a connected abelian CW space X and a CW pair (W,V), prove the abelian-target extension theorem: every map V→X extends to W if Hⁿ⁺¹(W,V;πₙX)=0 for all n≥1. These are the obstruction groups of the principal Postnikov tower. Thus an integral homology-equivalence inclusion satisfies this vanishing by universal coefficients; the abelian-target extension theorem for homology isomorphisms records that sufficient case. Use HEP to turn extension up to homotopy into an actual extension restricting to the original map.

**Checks.**

- The n=1 obstruction lies in H²(W,V;π₁X), not H¹.

(H AT §4.3, Cor. 4.73, p. 417.)

*Needs:* §3.21, §3.20, AlgebraicTopology 4.5 and 8.9, §3.18.

### 3.23 Homology Whitehead theorem for abelian spaces

Prove the abelian-space homology Whitehead theorem: an integral homology isomorphism between connected abelian CW spaces is a homotopy equivalence, by relative extension and uniqueness.

(H AT §4.3, Prop. 4.74 with proof, p. 418.)

*Needs:* §3.22, §3.14, AlgebraicTopology 4.5 and 8.5, §3.16.

### 3.24 Homology isomorphisms between H-spaces are homotopy equivalences

Deduce the H-space homology Whitehead theorem: any integral homology isomorphism between path-connected H-spaces of CW type is a homotopy equivalence. It need not be an H-map.

(W IV Exercise 1.3, p. IV.14.)

*Needs:* §3.15, §3.23.

### 3.25 Universal property of the plus construction

For connected CW plus f at P and g:X→Z killing P on π₁, prove `IsPlusConstruction.lift`: g factors through f uniquely up to homotopy for any connected CW-type Z. First prove extension and uniqueness for §3.10's selected attachment model the plus space, with X⁺ its target. The composite X→Z→Bπ₁Z, into AlgebraicTopology 8.8's classifier, extends over X⁺ by `mapsToGroupClassifyingSpaceEquiv`, since π₁g kills P and π₁X⁺=π₁X/P; homotopy extension makes the extension restrict to the given map on X. Replace Z→Bπ₁Z by GeneralizedCohomology G2.10's mapping-path fibration; its fibre is the universal cover Z̃ up to homotopy, path-connected and simply connected, hence n-simple for every n. Lift the extended base map through this fibration with AlgebraicTopology 8.9's local-coefficient obstruction theory, relative to X. The obstructions lie in Hⁿ⁺¹(X⁺,X;πₙZ̃) and the difference classes in Hⁿ(X⁺,X;πₙZ̃), with ℤ[π₁X/P]-module coefficients pulled back along X⁺→Bπ₁Z. The relative cellular complex of the universal quotient cover is free over ℤ[π₁/P], with identity differential in degrees 3→2, so Hom into any ℤ[π₁/P]-module is acyclic and all these groups vanish. Uniqueness applies the same argument to (X⁺×I, X⁺×∂I∪X×I), whose relative cohomology is that of (X⁺,X) shifted by one; base maps into Bπ₁Z are unique up to homotopy because π₁X→π₁X⁺ is onto. An abelian target Z is the special case of §3.22.

For an arbitrary connected CW plus map f, apply this selected-model extension to f itself to obtain a comparison from the plus space to its target under X. The comparison induces the identity on the quotient π₁ and isomorphisms on homology with every pulled-back local system. Sections 3.7 and 3.9 therefore make it a homotopy equivalence. Transport extension and uniqueness through this comparison. For general f, vanishing of plus-extension obstructions asserts vanishing of relative cohomology with every ℤ[π₁/P]-module, using the mapping-cylinder pair; it specifies no particular cellular presentation. Replace spaces of CW type by CW models before applying these arguments. A pointed map into a disconnected CW-type target factors through its basepoint component, so the connected-target statement gives that version as well. The ring specialization is stated in §4.14.

**Checks.**

- At P=1, f is a homotopy equivalence and lifting is composition with its homotopy inverse.
- For X=BA₅ with P=A₅ and g the identity of BA₅, g does not kill P and admits no factorization through the plus map, since π₁ of the plus space is trivial while π₁g is the identity of A₅.
- The inclusion *→D⁴ is plus at P=1. With the boundary S³ given its 0- and 3-cell structure and the 4-cell attached by degree one, the relative complex is ℤ→¹ℤ in degrees 4→3. Every relative cohomology group vanishes, and factorization holds independently of this cellular presentation.

(W IV Thm. 1.5 and the paragraph before it, p. IV.5; H AT §4.3 Exercise 23, p. 420.)

*Needs:* §3.22, §3.14, §3.7, §3.10, §3.9, §3.11, AlgebraicTopology 8.8–8.9, GeneralizedCohomology G2.10.

### 3.26 Uniqueness of the plus construction up to homotopy under X

Prove uniqueness of plus up to homotopy: two connected CW plus constructions at P are homotopy equivalent under X, with the compatibility homotopy. uniqueness for abelian targets is the separate stronger-target variant.

**Checks.**

- Different admissible cell choices give plus spaces homotopy equivalent under X; they are not equated as selected spaces.
- At P=1 the comparison between the identity and any plus map is that map, a homotopy equivalence.
- For X acyclic and P=π₁X both plus spaces are contractible and the comparison is unique up to homotopy.

(W IV Thm. 1.5(3), p. IV.5.)

*Needs:* §3.25, §3.7, §3.9, AlgebraicTopology 8.5.

### 3.27 Functoriality of the plus construction up to homotopy

For φ preserving perfect normal P,P′, construct homotopy functoriality of plus with its homotopy-commuting square. Identity/composition hold in the homotopy category; no strictly functorial point-set model is asserted.

(W IV 1.1.2, p. IV.3.)

*Needs:* §3.25.

### 3.28 Recognising plus constructions into H-spaces

Prove the H-space recognition theorem `IsPlusConstruction.hSpaceRecognition`: for connected CW plus X→Y at P with Y abelian and an integral homology isomorphism X→H to a connected CW-type H-space, the map X→H is acyclic, it factors up to homotopy through X→Y, and every such lift Y→H is a homotopy equivalence. Since Y is abelian and P is perfect, P is the commutator subgroup of π₁X, and π₁H is abelian, so P lies in the kernel on π₁ and §3.25 supplies the lift; the lift is an integral homology isomorphism between connected abelian CW-type spaces (§3.15 for H), hence a homotopy equivalence by §3.23.

(W IV Thm. 1.8 and Remark 1.8.1, p. IV.6.)

*Needs:* §3.25, §3.24, §3.12, §3.15, §3.23, §2.7.

### 3.29 π₂ of a plus construction and universal central extensions

For perfect normal P⊲G, prove the second-homotopy comparison for plus: π₂(BG⁺ₚ)≅H₂(P;ℤ), retaining G/P action. In the universal central extension from the plus fiber, π₁hofib(BG→BG⁺ₚ)→P is universal central with kernel H₂(P;ℤ). Use the supplied abstract universal central extension and prove its homological refinements below.

In `Suggested.lean`, `IsPlusConstruction.piTwoEquiv` states the group isomorphism for any aspherical source of CW type, with the perfect normal subgroup of its fundamental group specified. `IsPlusConstruction.fiber_universalCentralExtension` identifies the extension induced by the fibre projection using `IsUniversalCentralExtension`, the native-group adapter for the supplied universal property on surjective homomorphisms with central kernel. The quotient action and naturality are part of the comparisons in this section and §3.30.

- For perfect normal P⊲G, π₁(BG)⁺ₚ≅G/P at the image vertex.
- The inclusion induces the quotient map under π₁BG≅G.
- π₂(BG)⁺ₚ≅H₂(P;ℤ), with the coefficient universe lift.
- π₁hofib(BG→(BG)⁺ₚ)→P is the universal central extension, and its composite into G is induced by the fibre projection.

For the supplied universal central extension U→P of a perfect group P, prove the kernel–H₂ identification from Hopf’s formula and its naturality under homomorphisms of perfect groups. Prove that a surjective central extension E→P is universal if and only if E is superperfect, meaning H₁(E;ℤ)=H₂(E;ℤ)=0.

- Identify the supplied presentation kernel (R∩[F,F])/[F,R] with H₂(P;ℤ), naturally under presentation comparisons.
- Prove the universal-extension source has zero H₁ and H₂, and conversely that these vanishings imply the universal property for a central surjection.
- Identify the kernel map induced by the supplied unique lift with the induced H₂ map.

**Checks.**

- For P=1, the supplied extension is 1→1 and both its kernel and H₂(1;ℤ) are zero; the plus fibre is contractible.
- For P=A₅, the extension SL₂(𝔽₅)→A₅ has kernel {±I}≅C₂=H₂(A₅;ℤ); the local plus-fibre theorem identifies this same extension through π₁ of the fibre.
- The central identity C₃→C₃ is not universal: H₁(C₃;ℤ)=C₃, and maps to C₃×C₃→C₃ given by g↦(1,g) and g↦(g,g) are distinct lifts. Vanishing H₂ alone would not recognize universality.

(W III, Definition 5.3.1, Example 5.3.4, equation (5.3.5), and Recognition Theorem 5.4, p. III.37.)

The adapter `IsUniversalCentralExtension` expresses the supplied property without introducing a second extension construction; its group and lift carriers lie in one fixed universe. The plus-fibre theorem identifies the projection-induced extension with the supplied one, including its kernel map.

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* RepresentationTheory/InductionRestriction Layer 7, “Abstract universal central extensions”; §3.13, §3.2, §2.5, §2.6, §1.29, M. Prove the homological refinements in this subsection before applying them to the plus fibre.

### 3.30 Naturality of π₂(BG⁺) ≅ H₂(P; ℤ)

Prove naturality of the second-homotopy comparison for plus: G→G′ preserving P,P′ induces exactly H₂(P;ℤ)→H₂(P′;ℤ) under the comparisons, with the selected basepoints and quotient actions.

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* §3.29 (including its kernel–H₂ comparison), §3.27, §2.7, §2.5.

### 3.31 BP⁺ is the universal cover of BG⁺

For P⊆H⊆G and P perfect normal in G, identify the connected cover of BG⁺ₚ whose fundamental group is the subgroup H/P of π₁=G/P with BH⁺ₚ, respecting the projection. Its fibre is G/H, its deck group is N_G(H)/H acting compatibly on BH⁺ₚ, and it is regular exactly when H is normal in G. Thus BP⁺ is the universal cover.

(W IV Exercise 1.8, pp. IV.14–15.)

*Needs:* §3.26, §1.28, §2.8, TC.

### 3.32 Plus constructions of fibre sequences

For a connected CW fibre sequence F→E→B, plus f:E→E⁺ at perfect normal P and a chosen p⁺f≃p, prove the plus fiber sequence: induced F→F′=hofib(p⁺) is acyclic, hence an integral homology isomorphism. The square F→F′ over E→E⁺ is homotopy-cartesian by pullback pasting, so its map on every homotopy fibre is a weak homotopy equivalence to a fibre of f; it is a homotopy equivalence when these fibres are replaced by CW models. Name the underlying closure statement homotopy-pullback invariance of acyclicity. This conclusion only presupposes a factorisation p⁺ and the specified homotopy; it does not assert that every p extends through plus. Consequently F→F′ is a plus construction of F at ker(π₁F→π₁F′), weakly equivalent under F to any CW plus construction at that subgroup by §3.26 after CW replacement of F′; if F′ is simply connected that subgroup is π₁F.

(W IV Def. 1.4 and Lemma 1.6, pp. IV.4–5, together with homotopy-pullback pasting in §2.10. Exercise 1.9, p. IV.15, is the universal-central-extension specialisation of §3.33, not a statement of the general closure theorem.)

*Needs:* §3.25, AlgebraicTopology 5.5, §2.8, §2.10, §3.6, §3.7, §3.26, §2.7, DGFloer Layer 1 item 2 (CW approximation).

### 3.33 The plus-construction fibration of a universal central extension

For the universal central extension A→E→P of perfect P, prove BA→BE⁺→BP⁺ is a homotopy-fibre sequence. E is superperfect (§3.29), so BE⁺ is connected with π₁=0 and π₂=H₂(E;ℤ)=0. Let q⁺:BE⁺→BP⁺ be §3.27's induced map and F′ its homotopy fibre (GeneralizedCohomology G2.10). Compare the fibre sequence BA→BE→BP of §2.36 with F′→BE⁺→BP⁺ by §3.6. The base and total maps are plus maps, hence integral homology isomorphisms (§3.12). Both fibres are connected, since π₁BP⁺=0. The monodromy of the source is trivial because A is central, so conjugation by lifts acts trivially on BA; that of the target is trivial because BP⁺ is simply connected. Hence BA→F′ is an integral homology isomorphism. Since π₁BE⁺=π₂BE⁺=0, the long exact sequence (§2.5) gives π₁F′≅π₂BP⁺≅H₂(P;ℤ)≅A. F′ is abelian: π₁F′ is the image of the boundary from π₂BP⁺, and a boundary class acts trivially on every πₙF′, because the holonomy action of ΩBP⁺ on F′ along a loop of loops is a self-homotopy of the identity of F′ whose basepoint track is that class. As BA=K(A,1) is abelian too, §3.23 after CW replacement makes BA→F′ a weak equivalence, and the boundary identifies π₂BP⁺ with A.

(W IV Exercise 1.9, p. IV.15.)

*Needs:* §2.36, §3.29 (including its kernel–H₂ comparison), §3.27, §3.6, §3.12, §3.14, §3.23, §2.5, AlgebraicTopology 5.5, GeneralizedCohomology G2.10, DGFloer Layer 1 item 2 (CW approximation).

### 3.34 Serre classes in fibrations with trivial action

Use DGFloer Layer 1 item 4’s Serre-class carrier, including its tensor, Tor and K(A,1) hypotheses. Prove the bounded homology two-out-of-three fibration theorem for connected Serre fibrations with trivial action. Establish finite-generation, torsion and P-primary examples separately. For N≥0, the bounded form asserts: if F and B have positive integral homology in C through degree N, so does X; if F and X do, so does B; if X does through N and B does through N+1, then F does through N. Requiring these conditions in all positive degrees gives the unrestricted two-out-of-three theorem. The new API consists of the three class instances and the fibration homology theorem modulo a Serre class with these degree bounds; the closure projections retain their supplier names.

**Checks.**

- ℤ is in the finitely generated class, while ⊕ℕℤ is not; arbitrary filtered-colimit closure is not an axiom.
- For prime p, finite p-groups form a Serre class, containing ℤ/p² and excluding ℤ and ℤ/ℓ for distinct prime ℓ.
- groups killed by p alone fail extension closure: 0→ℤ/p→ℤ/p²→ℤ/p→0 is the counterexample.

(H SS 1, Lemma 1.9 with proof, p. 15.)

*Needs:* DGFloer Layer 1 item 4, DGFloer Layer 1 item 2 (Serre spectral sequence), AlgebraicTopology 5.5.

### 3.35 Homology of Eilenberg–Mac Lane spaces lies in the Serre class

For the classes of finitely generated abelian groups, finite P-primary groups and P-primary torsion groups, prove positive homology of K(A,n) belongs to the class when A does, n≥1. For the two finite-generation classes reduce K(A,1) to products of cyclic groups; for unrestricted P-torsion use its filtered union of finite subgroups, then iterate the path fibration. More general Serre classes need the K(A,1) closure theorem as an additional input. Finitely generated groups are not claimed closed under arbitrary filtered colimits.

(H SS 1, Lemma 1.10 with proof, pp. 15–16.)

*Needs:* §3.34, DGFloer Layer 1 item 4, §1.32, §1.17, AlgebraicTopology 5.1, M.

### 3.36 Serre class theory for abelian spaces

For C equal to finitely generated, finite P-primary or P-primary torsion abelian groups, prove the Serre-class comparison for abelian spaces: for connected abelian CW X, all positive πₙ lie in C iff all positive Hₙ do. If πᵢ∈C for i<n, the degree-n Hurewicz map has kernel/cokernel in C.

(H SS 1 'Serre Classes', Theorems 1.7 and 1.8, p. 14; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §3.14, §3.20, DGFloer Layer 1 item 4, AlgebraicTopology 8.3, §3.34, §3.35.

### 3.37 Rational homotopy of H-spaces (Cartan–Serre)

For a path-connected H-space with finite-type rational homology, prove the rational Hurewicz theorem for H-spaces: πₙ⊗ℚ injects into Hₙ(−;ℚ) with primitive image, n>0. Construct the rationalisation/Serre comparison. Add homotopy associativity for the Hopf-algebra formulation.

Use DGFloer Layer 1 item 2's multiplicative cohomology Serre spectral sequence, with its local tensor-cup pairings, Leibniz differentials and multiplicative convergence, and GeneralizedCohomology G5.6's computation of H*(K(ℤ,n);ℚ). Name rational Eilenberg–Mac Lane cohomology for its extension to finite-dimensional rational A and n≥1, polynomial generators for even n and exterior for odd n: compare K(ℤ,n)→K(ℚ,n) on rational cohomology, then pass to Aᵈ=ℚᵈ by the Künneth theorem. Use these primitive generators in the rational H-space comparison. (H SS, §§1.2–1.4, pp. 22–45; H AT, Thm. 3C.4, p. 283.)

**Checks.**

- K(ℚ,1) has an exterior degree-one generator.
- K(ℚ,2) has a polynomial degree-two generator.
- A point base recovers the fibre cup product; d(ab)=d(a)b+(−1)^|a|a d(b).

(H SS 1, Thm. 1.24 and the paragraph after its proof, pp. 38–39.)

*Needs:* GeneralizedCohomology G5.6, DGFloer Layer 1 items 2 and 4, §3.15, §3.14, §3.36, AlgebraicTopology Stage 8.

### Examples

Plus at the trivial subgroup is a weak equivalence. Plus of a perfect group’s classifying space is simply connected and retains its integral homology. Acyclicity with constant coefficients alone is insufficient for a nontrivial quotient π₁. The regular-cover calculation tests the local-coefficient condition.

### Dependencies

Layers 1–2 and ordinary (co)homology/obstruction theory; DGFloer Layer 1 items 2–3 supply the inputs to the local relative fibre sequence. RepresentationTheory/InductionRestriction Layer 7 supplies abstract universal central extensions, whose local homological refinements precede the plus-fibre comparisons.

## Layer 4: Homotopy group completion and deloopings

### 4.1 Symmetric tensor on the core

Construct the tensor on the core and, for symmetric input, the symmetry on the core by inherited isomorphism coherence. The inclusion is strong monoidal. Strong monoidal functors induce core maps; symmetry requires braided functors. Iso-class carriers remain supplier objects.

- Transport the full tensor coherence to Core S.
- Transport the symmetry to Core S.
- Core S→S is strict braided monoidal.
- F.core is strong braided monoidal; inclusion and core-composition comparisons are monoidal.
- Identify π₀B(Core S) with the supplied iso-class monoid, naturally for strong monoidal functors.

**Checks.**

- For finite sets under disjoint union, π₀ of the classifying space of the core is ℕ, with disjoint union inducing addition. The category of all finite-set maps has an initial object and a contractible classifying space, so retaining noninvertible arrows would give only one component.
- If S is already a groupoid, Core S ≌ S as symmetric monoidal categories.
- In Core of finitely generated projective ℤ-modules, the symmetry on ℤ ⊕ ℤ is the swap, not the identity: the structure is not strict in the sense of Bhatt–Scholze Def. 12.1.
- For additive A, Skeleton(Core A) is the multiplicative form of ObjectCode A; its Grothendieck group agrees with SplitK0 via the supplied equivalence.

(BS Appendix §12, p. 54; W IV Def. 4.1 and Examples 4.1.1, pp. IV.36–37.)

*Needs:* M.

### 4.2 The classifying-space H-structure

For small symmetric monoidal S, construct the associative/commutative H-space multiplication on BS with unit-object vertex, using k-products. The ordinary-product specialization of the classifying-space H-structure assumes countable objects/arrows; its general form uses k-products. The unit laws are homotopies, with their compatibility at the unit vertex included in the monoidal coherence.

- The multiplication on BS comes from B(⊗) and the product comparison, with associative/commutative/unit homotopies.

**Checks.**

- The one-object one-arrow monoidal category gives the one-point H-space.
- The discrete symmetric monoidal category ℕ gives addition on the discrete space ℕ, with zero as unit; its component monoid is not a group.
- The two rank-one vertices multiply to the rank-two component of the finite-set core. Its commutativity homotopy comes from the swap bijection, rather than an equality of chosen ordered sums.

(W IV §4 opening, p. IV.36.)

*Needs:* §4.1, §1.8, §1.10, §1.12, §1.9, AlgebraicTopology 4.7, M.

### 4.3 Quillen's S⁻¹S construction for a symmetric monoidal groupoid

Define the fraction category S⁻¹S for a symmetric monoidal groupoid: (a,b)→(a′,b′) is represented by t and isomorphisms t⊗a≅a′,t⊗b≅b′, modulo isomorphism of t. Give tensor, inclusion (s,1), swap and braided strong-functor maps. Faithful translations are a separate hypothesis.

- The pair category with simultaneous translation morphisms modulo isomorphism.
- The strong braided monoidal inclusion s↦(s,1).
- The componentwise tensor and its symmetry.
- A strong braided monoidal F induces S⁻¹F, preserving id/composition up to coherent isomorphism.
- K(S)=B(S⁻¹S), Kₙ(S)=πₙK(S).
- The coordinate swap functor; on components it induces inversion. Since no natural transformation from the unit to id⊗swap exists (check below), no identification of its realisation with the H-space inverse is asserted.
- Injectivity of Aut(s)→Aut(s⊗t); it holds for finite sets under disjoint union, where Σₙ→Σₙ₊ₘ is injective.

**Checks.**

- For the trivial symmetric monoidal groupoid (one object, one morphism), kSpace is contractible.
- For the symmetric monoidal groupoid with objects n∈ℕ, automorphisms GLₙ(ℤ) and block sum there is no natural transformation from the constant unit functor to id⊗swap. Naturality along (0,0)→(1,1) forces equal two translation maps; the automorphism (−1,1) then requires diag(−1,1)=diag(1,−1), which is false. Objectwise arrows from the unit do exist; they do not supply a natural inverse homotopy.
- The construction requires a groupoid. The category P(R) of finite projective modules and all maps has 0 as initial object, so BP(R) is contractible; only its core iso P(R) is a valid input.

(W IV Def. 4.2, Explanation 4.2.1, Remark 4.2.2, Def. 4.3, pp. IV.37–38, Exercise 4.3, p. IV.46; C §1.2, Def. 7, p. 9.)

*Needs:* §4.1.

### 4.4 Actions of monoidal categories and the categories ⟨S, X⟩ and S⁻¹X

For a coherent `MonoidalLeftAction`, define the action category of S on X using translation arrows t⊙x→y modulo isomorphisms of t. The diagonal action gives S⁻¹X; supply stage inclusions, projection, restriction and the groupoid self-action contraction.

- Objects x; translation morphisms represented by s⊙x→y.
- S⁻¹X=⟨S,S×X⟩ for the diagonal action.
- The projection (s,x)↦s into ⟨S,S⟩.
- Translations x↦(s,x), with the unit case as inclusion.
- For a groupoid S, the unit is initial in ⟨S,S⟩, so its classifying space is contractible.
- The diagonal action t⊙(s,x)=(t⊗s,t⊙x), with symmetry supplying its coherence.

**Checks.**

- For the trivial monoidal category acting on X, ⟨S, X⟩ ≌ X.
- For S = ℕ acting on ⊔ X_n through a sequence of functors, ⟨S, X⟩ is the mapping telescope category (Weibel IV Exercise 4.2).
- For S and X discrete, ⟨S, X⟩ is isomorphic to Mathlib's ActionCategory (π₀ S) (Ob X) of induced monoid action.
- For S = ℕ acting on itself by addition, ⟨S, S⟩ is the poset ℕ (contractible), not the discrete category ℕ.

(W IV Definitions 4.7 and 4.7.1, p. IV.41.)

*Needs:* §4.1, §1.10, §1.12, M.

### 4.5 π₀ of S⁻¹S is the Grothendieck group of the monoid of components

Construct the component-group comparison for S⁻¹S from π₀B(S⁻¹S) to the Grothendieck group of the commutative monoid of isomorphism classes. Specify (a,b)↦[a]−[b], written multiplicatively [a]/[b], and inclusion s↦(s,1). Prove the equations on vertices and on the inclusion, with addition induced by tensor and inverse by swapping. For the groupoid of ranks n∈ℕ with automorphisms GLₙ(ℤ) under block sum, (rank 2,rank 1) has rank +1 and its swap has rank −1.

**Checks.**

- In that groupoid of ranks the component (2,1) has rank +1 and (1,2) rank −1.
- For S = Core of an additive category A with ⊞, π₀ kSpace S ≅ SplitK0 A, compatibly with the classes of objects.

(W IV Lemma 4.3.1 with proof, p. IV.38.)

*Needs:* §4.3, §1.18, M, TC.

### 4.6 Group completions of homotopy-commutative H-spaces

Define the homotopy-associativity condition, the homotopy-commutativity condition, Pontryagin homology localization and the group-completion condition: both H-spaces satisfy the two homotopy laws, f is an H-map, π₀f completes components and H_*(Y;k)≅π₀(X)⁻¹H_*(X;k) as unital graded rings for every commutative k.

- An H-map of homotopy-associative/commutative H-spaces, completing π₀ and localising homology over every commutative ring.
- π₀Y≅GrothendieckGroup(π₀X).
- The induced localisation map on Pontryagin homology is a ring isomorphism.
- For grouplike X, id is a group completion.
- For CW Y, its unit component is an abelian H-space.

**Checks.**

- A discrete abelian group satisfies both homotopy associativity and homotopy commutativity.
- discrete S₃ is homotopy associative and fails homotopy commutativity; (01)(12)≠(12)(01).
- The discrete commutative magma {0,1,2}, with unit 0, 1·1=2 and 1·2=2·2=0, satisfies commutativity but fails associativity: (1·1)·2=0 and 1·(1·2)=1. On a discrete space homotopies cannot repair this inequality.
- For a homotopy-commutative group-like H-space G (for example an abelian topological group), the identity of G is a group completion.
- The inclusion ℕ → ℤ of discrete monoids is a group completion.
- For a group completion, π₀ f agrees with Algebra.GrothendieckGroup.of under the identification π₀(Y) ≃ Algebra.GrothendieckGroup π₀(X).
- The map ⊔_n BΣ_n → ℤ (discrete) inducing the group completion on π₀ is not a group completion: it fails the homology condition (the correct target is ℤ × BΣ_∞⁺).

(W IV Def. 4.4, p. IV.38.)

*Needs:* §4.2, M.

### 4.7 The projection S⁻¹X → ⟨S, S⟩ is cofibred

For a coherent S-action with faithful translations, prove the cofibred action-category projection: S⁻¹X→⟨S,S⟩ is cofibred, with specified fibres, cocartesian lifts and transition action. Equivalently its opposite is fibred.

(W IV Exercise 4.5, p. IV.46.)

*Needs:* §4.4, §2.32.

### 4.8 Invertible actions do not change the homotopy type

For a symmetric monoidal groupoid S acting coherently on X with faithful translations, if every t⊙− gives a homotopy equivalence on BX, prove each actual the action-category inclusion equivalence: BX→B(S⁻¹X) is a homotopy equivalence, with the inverse tied to this map.

(W IV Exercise 4.6, p. IV.46.)

*Needs:* §4.7, §2.35, §4.4, AlgebraicTopology 8.5.

### 4.9 Quillen’s homological group completion

Prove Quillen's group-completion theorem for symmetric monoidal groupoids with faithful translations: BS→B(S⁻¹S) completes homotopy, including coherent H-space laws and all-degree homology localisation, using the action projection and Quillen's localisation argument.

(W IV Definitions 4.7, 4.7.1, (4.7.2) and Thm. 4.8 with proof, pp. IV.41–42.)

*Needs:* §4.3, §4.7, §2.30, §1.23, §1.27, §4.5, §4.6, §4.4, §1.12.

### 4.10 Group completions of group-like H-spaces

Prove the grouplike identity comparison for homotopy-associative/commutative X with component inverses. Any group completion of such X between CW-type spaces is a homotopy equivalence by translation and abelian homology Whitehead on unit components.

**Checks.**

- For S = Pic(R) (R commutative), π₀ kSpace S ≅ Pic(R), π₁ ≅ Rˣ and π_n = 0 for n ≥ 2, since BS is already grouplike.
- The discrete abelian group ℤ is grouplike and its identity is a group completion.
- The inclusion ℕ→ℤ of discrete monoids is a group completion that is not a homotopy equivalence, since ℕ is not grouplike.

(W IV Lemma 4.4.1 with proof, p. IV.39.)

*Needs:* §4.6, §3.24, §4.3, §4.5.

### 4.11 Phantom maps and the Milnor sequence of a countable exhaustion

If f:X→Y is a group completion with Y an H-space, so is f+φ for every phantom map φ:X→Y, one that is null on every finite CW complex mapping to X; group completions are therefore unique at best up to phantom maps. Consume GeneralizedCohomology G3.10's unstable mapping-space/Milnor comparison to control phantom maps out of a countably exhausted source. Construct the space-level Milnor mapping sequence, extending its restriction-fibration argument to a specified countable exhaustion X=⋃ᵢXᵢ by based finite CW subcomplexes. Each inclusion is a closed CW cofibration; HEP gives the convenient based mapping-space restriction fibrations and identifies Map_*(X,T) with their homotopy limit. The countability condition on π₀X does not itself provide this finite-subcomplex exhaustion.

For a based grouplike homotopy-associative, homotopy-commutative H-space T of CW type, the pointwise operation and loop concatenation make π₁Map_*(Xᵢ,T)=[ΣXᵢ,T]_* abelian by interchange. Transport G3.10's orbit-set lim¹, through its identification with coker(1−shift) for abelian tower groups, to DerivedModuleAlgebra §1.T.1's cokernel of δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁. Identify its injection with the phantom kernel of [X,T]_*→limᵢ[Xᵢ,T]_*, and its projection with restriction. Preserve the connecting maps and naturality for maps of filtrations and based H-maps of targets. The supplied Mittag–Leffler vanishing then implies that maps agreeing on all stages agree in based homotopy classes.

**Checks.**

- An eventually constant finite-CW exhaustion has zero lim¹ and recovers [X,T]_*.
- For an eventually constant exhaustion of S¹ and T=S¹, restriction retains [S¹,S¹]_*≅ℤ, rather than making every map null.
- T=* gives singleton mapping classes and zero restriction kernel for every such exhaustion.

(W IV Phantom maps paragraph, p. IV.39.)

*Needs:* §4.6, §4.10, GeneralizedCohomology G3.10, DerivedModuleAlgebra §1.T.1 on main; the space-level Milnor mapping sequence is the exhaustion extension constructed in this section.

### 4.12 The fibration S⁻¹S → S⁻¹X → ⟨S, X⟩

For symmetric monoidal groupoid S with faithful translations acting on X, assume every X-arrow monic and Aut_S(s)→Aut_X(s⊙x) injective for all s,x. Fix x₀∈X. The functor (a,b)↦(a,b⊙x₀) defines S⁻¹S→S⁻¹X. Prove the group-completion fiber sequence: its realization is the homotopy fibre of B(S⁻¹X)→B⟨S,X⟩ over the vertex x₀, with its specified composite nullhomotopy. Retain x₀ and its preservation comparison in equivariant naturality; contractible ⟨S,X⟩ gives an equivalence.

**Checks.**

- terminal S acting on a pointed discrete X gives a point as the fibre of id_X at x₀.
- terminal S acting on empty X satisfies the action hypotheses but has no x₀; there is no map from B(S⁻¹S)=* to B(S⁻¹X)=∅.
- The action of S on itself with x₀ the tensor unit recovers the equivalence over the contractible B⟨S,S⟩.

(W IV Exercise 4.7, p. IV.46.)

*Needs:* §4.4, §4.8, §2.35, §2.32.

### 4.13 A product of plus constructions is a plus construction

For connected CW-type plus maps at P,Q, prove their k-product is plus at P×Q. Identify product fibres and π₁ kernels, then use a CW-type replacement for uniqueness; an arbitrary ordinary product need not have the chosen CW structure.

(W IV Exercise 1.7, p. IV.14.)

*Needs:* §3.1, §3.3, §3.8, GeneralizedCohomology G2.10, AlgebraicTopology 4.7 and 8.5.

### 4.14 Stable linear groups and their plus H-space

Use AlgebraicKTheory A1's stable GL and elementary subgroup, for every associative unital ring including zero. The names GL(R) and E(R) are aliases for those supplied objects, with their trailing-identity stabilization g↦diag(g,1). Likewise the block-sum map GLₘ(R)×GLₙ(R)→GLₘ₊ₙ(R) is its finite block map, retaining both sizes and the supplied permutation conjugations when either input is stabilized. Realize those conjugations as homotopies coherent under successive stabilizations. Use them and the supplied equality on GL/E to construct the coherent H-space multiplication on BGL(R)⁺, so ℤ×BGL(R)⁺ completes ⊔BGLₙ(R).

For the ring specialization of §3.25, substitute X=BGL(R) and P=E(R), transporting the subgroup through π₁BGL(R)≅GL(R): a map BGL(R)→Z to a connected CW-type space killing E(R) factors through BGL(R)⁺ uniquely up to homotopy. The factorization retains the homotopy g≃h∘f and is natural under ring maps and the opposite-ring comparison. A pointed map from BGL(R) into a pointed, possibly disconnected CW-type space W killing E(R) factors through the basepoint component of W, so the factorization holds for such W as well. For the ring specialization of §3.28: BGL(R)⁺ is an H-space by the multiplication above, hence abelian (§3.15), so a homology isomorphism from BGL(R) to a connected CW-type H-space is acyclic and its lift from BGL(R)⁺ is a homotopy equivalence under BGL(R).

The comparison of stable groups is the unique group isomorphism carrying each finite-stage matrix to the same matrix; it identifies the elementary subgroups and commutes with all unital ring maps. On classifying spaces it preserves the identity vertex and the labelled edges. Transpose with entrywise opposite identifies GLₙ(Rᵐᵒᵖ) with GLₙ(R)ᵐᵒᵖ; inverse transpose gives the group isomorphism into GLₙ(Rᵐᵒᵖ) whose (i,j)-entry is op((g⁻¹)ⱼᵢ). It commutes with stabilization and block sum and carries E to E. Compare its realized map with §1.7's opposite-space homeomorphism using the entrywise-inverse nerve convention, and descend it through plus. **Supplied API aliases:** the finite-stage inclusion into stable GL, compatibility of the stable inclusion with stabilization, the finite general-linear block-sum map, perfectness of the stable elementary subgroup, the stable-elementary/commutator equality. **Checks.**

- rank zero contributes the identity.
- over ℤ, block(I₁,−1) stabilized is diag(1,−1,1), whereas block(I₂,−1)=diag(1,1,−1). These remain distinct stably but are conjugate by exchanging the last two coordinates; ordinary block sum therefore does not descend to the chosen stable group.
- over a field the stable determinant quotient is its unit group.
- E₂(𝔽₂) is not perfect, so stable perfectness does not apply at rank two.
- On eᵢⱼ(a), the inverse-transpose/opposite map gives eⱼᵢ(−aᵐᵒᵖ); for R=M₂(ℤ), transpose without the opposite coefficient ring fails multiplicativity.
- For a field F, the map BGL(F)→B(Fˣ) induced by determinant kills E(F); its factorization through the plus map induces the determinant identification GL(F)/E(F)≅Fˣ on π₁.
- For the zero ring, stable GL and E are trivial; the pointed factorization is the unique homotopy class from a point, although the zero modules Rⁿ remain indexed by distinct ranks n.

(W III, Lem. 1.3.2 and Whitehead Lem. 1.3.3, p. 4; W IV Exercise 1.11, p. IV.15; Exercise 4.9, p. IV.46.)

*Needs:* AlgebraicKTheory A1, §3.25, §3.28, §1.31, §4.6, §4.13, §3.12, §1.17, §3.15, §3.27, M.

### 4.15 Based free modules and projective complements

Define the based-free groupoid over R: objects are rank labels n, automorphisms GLₙR, no arrows between labels; tensor is block sum with permutation symmetry. Row action gives Aut(n)≅GLₙRᵐᵒᵖ. Construct the functor to the module core, its finite-projective lift and entrywise base change. Labels remain ℕ without IBN. Apply AlgebraicKTheory A0 to Rᵐᵒᵖ and identify right Rᵐᵒᵖ-modules with left R-modules by the double-opposite scalar map. On free modules the coordinate identification sends a column with opposite-ring entries to its unop row, and a matrix A to Aᵀ with entrywise unop. This identifies the supplied column action with the row action here, respecting composition, direct sums, permutations and base change.

- The groupoid with objects ranks and matrices as isomorphisms; direct sum supplies the symmetric tensor.
- Aut(n)≅GLₙ(R)ᵐᵒᵖ; inversion compares its classifying space with BGLₙ(R).
- The strong symmetric monoidal functor into the module core; the based-free-to-projective functor is its lift to the finite-projective core, with the same object modules and matrix maps.
- Entrywise ring maps give strong braided functors, respecting base change and composition.
- Block-identity translation is faithful.
- For every finite projective P, find Q,n with P⊕Q≅Rⁿ.

For commutative R, equip the based-free groupoid over R with block sum as sum and the Kronecker product as product. On objects r⊗s=rs; on automorphisms g⊗h is the Kronecker matrix with GeneralizedCohomology G5.4's lexicographic basis index (i,j)↦i·s+j. The multiplicative unit is 1, the multiplicative symmetry rs→sr is the row-action matrix, the transpose of the column-action permutation matrix for (i,j)↦(j,i) in these indices, and 0⊗r=r⊗0=0 strictly. The distributor (r+s)⊗t is the identity and the distributor r⊗(s+t) is the transpose of G5.4's column-action permutation matrix, so its row action sends (i,j) to i·s+j if j<s and to r·s+i·t+(j−s) otherwise, in the target block order. Use the transposes of G5.4’s column-action matrices also for additive symmetry, and prove the bipermutative axioms by transposing its identities. Transposition reverses composition, as required by the row-action convention. Functoriality (g⊗h)(g′⊗h′)=gg′⊗hh′ and naturality of the multiplicative symmetry use commutativity of R, and hold equally for the opposite composition of the based-free groupoid. Entrywise base change along a commutative ring map is a strict bipermutative functor.

The name the finite-projective complement is the supplied finite-projective complement transported through the Rᵐᵒᵖ adapter: for finite projective P it gives finite projective Q, n and an actual isomorphism P⊕Q≅Rⁿ. Retain its inclusion and retraction maps, whose composite on P is the identity, and use this same splitting for the cofinality of based free modules. Q is projective, not necessarily free. (Mathlib `Module.Finite.exists_comp_eq_id_of_projective`.)

**Checks.**

- Skeleton (BasedFree R) ≃* Multiplicative ℕ for every ring R, including the zero ring.
- For `R = ℤ` the symmetry `c_{1,1}` is the matrix `!![0, 1; 1, 0] ≠ 1`.
- For R with R ≅ R² (e.g. End of a countably infinite-dimensional vector space) toProj.obj 1 ≅ toProj.obj 2 although 1 and 2 are not isomorphic in BasedFree R.
- For every n, toProj induces a bijection Aut n → Aut (toProj.obj n).
- BasedFree R has faithful translations: g ↦ g ⊕ 1 is injective on GLₙ(R).
- P=0 admits Q=0,n=0, including the zero ring.
- P=Rⁿ admits Q=0; rank labels need not be invariant under isomorphism when IBN fails.
- A nonprincipal invertible ideal of a Dedekind domain is projective but cannot have a free complement: its determinant class would remain nontrivial. The target therefore allows projective Q.
- over the quaternions with r=s=1, (1⊗i)(j⊗1)=ij=k while (1·j)⊗(i·1)=ji=−k, so without commutativity the Kronecker product is not a functor.
- For r=2 and s=t=1 the distributor r⊗(s+t)→r⊗s+r⊗t is the permutation matrix exchanging the middle two basis vectors, whereas (r+s)⊗t has the identity distributor.
- For r=s=2 the multiplicative symmetry exchanges the basis indices 1 and 2 and fixes 0 and 3; it is not the identity although r=s.

(W IV Example 4.1.1(c), p. IV.36.)

*Needs:* AlgebraicKTheory A0, §4.1, GeneralizedCohomology G5.4 (index and distributor conventions), M.

### 4.16 B(S⁻¹S) ≃ ℤ × BGL(R)⁺ for based free modules

For unital R, prove the based-free group-completion/plus comparison: B(F(R)⁻¹F(R))≃ℤ×BGL(R)⁺, with the inclusion and difference-of-labels component map. Block matrices give faithful translations; plus identifies the unit component.

(W IV Thm. 4.9 with proof, pp. IV.42–43.)

*Needs:* §4.9, §3.28, §1.17, §4.14 (stable linear groups), §4.5, §4.15, §4.4, §2.31.

### 4.17 The telescope map into the group completion is acyclic

For a well-pointed homotopy-commutative monoid and a cofinal product stabilisation, prove acyclicity of the telescope comparison: the telescope maps acyclically to the Borel homotopy fibre, which maps by a weak equivalence from ΩBM. A homotopy-equivalence formulation additionally uses CW-type models. Every component must divide a sufficiently long later product from every starting stage.

Prove uniqueness of group completion: if π₀X is countable or has a countable cofinal submonoid, two group completions f′:X→X′ and f″:X→X″ with CW-type targets admit a homotopy equivalence g:X′→X″, unique up to weak homotopy, with gf′ and f″ weakly homotopic. Choose a cofinal sequence s₁,s₂,… in π₀X and form the telescope X∞ of translation by the sᵢ. The full telescope maps acyclically to each whole target, inducing the group-completion bijection on components. Restricting to the component (X∞)₀ over the unit component gives an acyclic map to that component, so each target's unit component is a plus construction of (X∞)₀; §§3.25–3.26 give a homotopy equivalence of unit components, extended over components by translation (§4.10). Agreement on every finite subcomplex is weak homotopy by definition. When X has a countable exhaustion by finite CW subcomplexes with Mittag–Leffler restriction towers, §4.11 upgrades weak homotopy to based homotopy.

**Checks.**

- For X=ℕ discrete, translation k↦k+1 gives the component invariant k−r at stage r. Thus π₀X∞=ℤ and the full comparison induces id:ℤ→ℤ, while the component-zero restriction has contractible source and target. Every CW-type group completion is homotopy equivalent to ℤ under ℕ: its components are acyclic H-spaces, hence contractible by §3.24.
- For grouplike X the identity and any group completion are compared by a homotopy equivalence, as in §4.10.
- For the core of finite sets, (X∞)₀≃BΣ∞ and X∞≃ℤ×BΣ∞. The restricted acyclic map (X∞)₀→B(S⁻¹S)₀ identifies the target with BΣ∞⁺; the full telescope retains every integer component.

(HK III Section 3.2, (1)-symmetric case, p. 55; W IV Proof of Thm. 4.10, p. IV.44, and Thm. 4.4.3 with the phantom maps paragraph, p. IV.39; Randal-Williams, Thm. 1.1 and Cor. 1.2, pp. 1–2.)

*Needs:* §4.9, §3.3, §3.7, §4.4, §2.31, §1.17, §3.25, §3.26, §4.10, §4.11.

### 4.18 Group completion with a cofinal sequence of objects

For a symmetric monoidal groupoid with faithful translations and cofinal sₙ₊₁=sₙ⊗aₙ, prove the cofinal group-completion/plus comparison: B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺. Identify the stable automorphism telescope and its perfect commutator, then apply local-coefficient acyclicity componentwise. Prove perfectness of the stable-automorphism commutator by representing each stable commutator at a finite stage, then using disjoint tensor blocks and the symmetry conjugations to rewrite it as a commutator of commutators after further stabilisation (Randal-Williams, Prop. 3.1, pp. 7–8).

(W IV Thm. 4.10 with proof, pp. IV.43–44; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §4.9, §3.8, §4.17, §4.5, §1.17, §2.31, §3.3, §3.15, §4.2.

### 4.19 Cofinality for actions: S⁻¹X ≃ T⁻¹X

For cofinal strong braided F:S→T between symmetric monoidal groupoids with faithful translations and a coherent T-action on X, prove cofinality for monoidal actions: B(S⁻¹X)≃B(T⁻¹X). Cofinality means each t has a tensor complement to some F(s); action invertibility is equivalent after restriction.

(W IV Cofinality Thm. 4.11(a) with proof, p. IV.44.)

*Needs:* §4.8, §4.4, §1.10.

### 4.20 Quillen's cofinality theorem for symmetric monoidal groupoids

If additionally Aut(s)→Aut(Fs) is bijective, prove the cofinality theorem: B(S⁻¹S)→B(T⁻¹T) is bijective on every positive πₙ at every basepoint. Its π₀ need not be surjective.

(W IV Cofinality Thm. 4.11 with proof, pp. IV.44–45.)

*Needs:* §4.9, §3.24, §1.34, §1.10.

### 4.21 Cofinality: the group completion of iso P(R) is K₀(R) × BGL(R)⁺

For the finite-projective core of unital R, prove the projective group-completion/plus comparison: the space has components K₀(R) and unit component BGL(R)⁺. Construct free complements locally, and identify the based-free comparison on generators using direct sum.

(W IV Cor. 4.11.1, p. IV.45; Example 4.1.1(c), p. IV.36.)

*Needs:* §4.20, §4.16, §4.5, §4.15 (projective complements).

### 4.22 Naturality of the comparison B(S⁻¹S) ≃ K₀ × BGL(R)⁺

Prove homotopy naturality of these comparisons under unital ring maps. Scalar extension preserves finite projectives/sums; on π₀ use induced K₀ map and on the unit component the entrywise stable GL plus map.

(W IV Functoriality 1.1.2, p. IV.3.)

*Needs:* §4.16, §4.14, §4.13, §4.21, §4.15, §4.5, §3.27, §3.25, §3.15, §1.31.

### 4.23 Independence of the group completion from strictification

Construct the permutative strictification, the permutative category of a symmetric monoidal category C: objects are finite words of objects of C, the tensor is concatenation and the unit the empty word, morphisms between words are those between their evaluated left-parenthesised tensors, and the symmetry is the evaluated block permutation. Evaluation is a strong symmetric monoidal equivalence onto C; well-definedness of composition, tensor and symmetry is the coherence theorem for symmetric monoidal categories. The further target here is invariance of the fraction-category construction, including the inclusion and the comparison composition. Prove the homotopy equivalence induced on fraction categories for a strong symmetric monoidal equivalence of strictifications, respecting inclusion and comparison composition. Choose a strong symmetric quasi-inverse; its unit/counit induce transformations on the fraction categories, whose realisations give the inverse homotopies. This identifies homotopy types, not categorical choices definitionally.

**Checks.**

- The empty word evaluates to the tensor unit and is the strict concatenation unit.
- words of lengths two and one evaluate using the associator; evaluating both parenthesisations gives the same map after that specified associator.
- For finite sets, swapping two singleton words evaluates to the nontrivial permutation of their two-element sum; erasing symmetry would fail this check.
- evaluation followed by singleton words is naturally equivalent to identity, including the empty word.

(C §1.2, final paragraph, printed p. 10; J. P. May, E∞ spaces, group completions, and permutative categories, LMS Lecture Note Ser. 11 (1974), §4, for the word strictification; the map invariance follows from the strong monoidal inverse and §1.10.)

*Needs:* §4.3, BordismFormalGroups F6.5 (symmetric coherence), §1.10, M.

### 4.24 Segal’s summing-functor construction

For small C with zero object and finite sums, define the summing-functor category as coherent subset-sum diagrams and natural isomorphisms; their nerves form the Segal Γ-space of C. Apply the supplied Γ-machine to construct the Segal spectrum comparison and its underlying sequence the Segal spaces; the iso-class monoid is the supplied `Skeleton (Core C)` under direct sum, with the zero and sum equations from Mathlib’s monoidal skeleton.

- Summing diagrams and natural isomorphisms form a groupoid.
- A_C(n)=nerve(summingFunctors(C,n)).
- A_C is special.
- Zero/sum-preserving functors give functorial Γ-space maps.
- The Γ-machine connective Ω-spectrum has zeroth space Ω|BA_C(1)|; segalSpaces is its underlying sequence, with a separate structure/comparison target.
- π₀A_C(1)≅Skeleton (Core C) before completion.
- The completed zeroth-space components form a commutative group.
- The group-completion component homomorphism.
- Completed components≅GrothendieckGroup(Skeleton (Core C)).
- The equivalence sends the image of x to GrothendieckGroup.of(x).

**Checks.**

- For C the category with one object (a zero object), segalGammaSpace C is the constant point.
- For finite projectives, π₀ of the completed space Ω|BA_C(1)| is split K₀(R). Using π₀A_C(1) instead leaves the direct-sum monoid.
- For R≠0 the groupoid iso P(R) has no initial object, so it has no empty coproduct and the summing-functor construction applies to P(R), not to its core.
- Finite-dimensional vector spaces have direct-sum monoid ℕ and completed component group ℤ; rank n maps to +n and negative ranks detect failure to complete.

(C §1.2, Def. 1, Prop. 2 with proof, Thm. 3, Examples 4–5, pp. 6–8; BS Appendix §12, Prop. 12.10, Cor. 12.12 and Def. 12.13, p. 58.)

*Needs:* GeneralizedCohomology G2.8, §1.11, M.

### 4.25 The Segal E∞-monoid N(C) of a symmetric monoidal groupoid

For symmetric monoidal groupoid C, define the coherent-subset Γ-space by coherent subset tensor diagrams, including empty-subset unit laws. It is special with N(C)(1)≃nerve C; strong braided functors give its Γ-maps. Consume BordismFormalGroups F6.5's symmetric coherence: structural composites with the same permutation agree, naturally. Use it to prove the subset-diagram equations and compare this concrete Γ-model with the supplied coherent commutative-monoid interface.

- The coherent-subset Γ-model N(C).
- N(C) is special.
- π₀N(C)(1)≅Skeleton C as monoids.
- Strong braided monoidal functors give Γ-maps with coherent composition comparisons; on strict symmetric monoidal functors these comparisons are identities, so the construction is strictly functorial on permutative categories and strict functors.
- For a small category C with zero object and finite coproducts, with Core C given the chosen coproduct as tensor (§4.1), restriction to singletons identifies both the Segal Γ-space of C and the coherent-subset Γ-space of Core C levelwise with (Core C)ⁿ, and the comparison functor between the two diagram groupoids is a levelwise equivalence, natural in coproduct-preserving functors.
- For a permutative groupoid C, possibly enriched in simplicial sets or spaces with discrete objects, the coherent-subset Γ-space of C is levelwise equivalent to the Γ-space of GeneralizedCohomology G2.8's permutative-category input, naturally in strict symmetric monoidal functors.
- Forget unit data to compare N(C)(1) with nerve C weakly.

**Checks.**

- Unit coherence makes N(C)(0) contractible. If it is omitted, the discrete monoid {1,e}, e²=e, gives two idempotent empty-subset choices and two components.
- For C the core of finite free ℤ-modules under ⊕, π₀ N(C)(1) = ℕ (ranks). Equivalently use finite-dimensional vector spaces over any field.
- For C = Pic(R), N(C) is grouplike with π₀ = Pic(R).
- The naive assignment `S ↦ N(C)^{S∖{s}}` with `f ↦ (⊗_{t ∈ f⁻¹(t′)} X_t)` is not strictly functorial (Bhatt–Scholze Remark 12.6).
- For the zero category both Γ-spaces are the constant point and the comparison is the identity.
- For finite-dimensional vector spaces the level-two summing diagrams allow every coproduct diagram A←·→B with any sum object, whereas the coherent-subset diagrams use the chosen sum; the comparison is an equivalence of groupoids, not a bijection of objects.
- At level one both the coherent-subset and the permutative Γ-space are the nerve of C, and the comparison is the identity there.
- The two braid composites on three factors agree.
- A swap followed by its reverse is identity.
- inserting then deleting the tensor unit is identity.

(BS Appendix §12, Construction 12.5 and Remark 12.6, pp. 56–57; C §1.2, Def. 1 and Prop. 2, pp. 6–7, for summing functors.)

*Needs:* GeneralizedCohomology G2.8, BordismFormalGroups F6.5, §4.1, §4.24, §1.11, §1.34, §1.33.

### 4.26 Picard groupoids are exactly the grouplike N(C)

Prove the very-special/Picard criterion: every object is tensor-invertible iff π₀C is a group. A Picard groupoid gives π₀=iso-classes and π₁=Aut(1), retaining symmetry and self-braiding.

(BS Appendix §12, Prop. 12.15 and the paragraph after it, pp. 58–59.)

*Needs:* §4.25, GeneralizedCohomology G2.8, §1.34.

### 4.27 Classical Grothendieck–Witt plus spaces

Construct the classical Grothendieck–Witt comparison for symmetric unimodular ℤ-forms under orthogonal sum. Put J=⟨1⟩⊥⟨−1⟩ and O∞=colimₙ Aut(Jⁿ), with transition g↦g⊥id_J, using the integral bilinear isometry groups. Prove cofinality of J among unimodular forms: every such L is an orthogonal summand of some Jⁿ. Indeed L⊥(−L)⊥J is odd, indefinite and unimodular of signature (r+1,r+1), where r=rank L, so IntegralLattices 6A identifies it with J^(r+1). Apply §4.18's perfectness of the stable-automorphism commutator to O∞, identify the completed component group with ℤ² by positive and negative signatures, and identify its unit component with BO∞⁺ at that commutator. Retain odd/even and 2-primary distinctions and this classical convention. This group-completion space is separate from the Grothendieck–Witt space of the hermitian Q-construction, and no comparison between the two is stated here.

**Checks.**

- The zero form is a summand of J⁰; its signature pair is (0,0).
- ⟨1⟩ and ⟨−1⟩ are summands of J and give the two generators (1,0) and (0,1) of the completed component group.
- even E₈ has the explicit complement (−E₈)⊥J in J⁹. Positive powers of the even hyperbolic plane alone cannot contain an odd line as an orthogonal summand, so that stabilization would miss forms in this groupoid.

(HK III Section 3.2, pp. 54–55, cases (1)-symmetric through (−1)-quadratic.)

*Needs:* §4.18, §4.5, IntegralLattices 0A, 0E, 2C and 6A, TC (`TauCeti.BilinForm.isometryGroup`), OrthogonalSpinGroups 0C for bilinear/quadratic base change; cofinality of J among unimodular forms is constructed here.

### 4.28 Topological variants of functors on rings via simplicial rings

For a topological ring A, the simplicial ring of continuous simplex functions with values in A is n↦C(Δⁿ,A) with pointwise operations, where Δⁿ is Mathlib's `SimplexCategory.toTop₀.obj ⦋n⦌` and simplicial operators act by precomposition. For a functor F from unital rings to simplicial sets, the topological variant of F at A is the realisation of the diagonal of the bisimplicial set n↦F(C(Δⁿ,A)) (§§2.17–2.18). F must be an actual functor, since the simplicial identities of n↦F(C(Δⁿ,A)) use its strict composition. Assignments built from base change of modules, such as R↦the Segal Γ-space of the finite projective R-modules, are excluded: base change composes only up to canonical isomorphism, and the category of finite projectives is only essentially small. For F valued in Γ-spaces of simplicial sets, take this diagonal at each finite pointed set. The result is a Γ-space, and it is special whenever every F(C(Δⁿ,A)) is: diagonals preserve finite products and levelwise weak equivalences (§2.23). The K-theory case of §4.30 applies this to the strict functor R↦the coherent-subset Γ-space of based free R-modules, using that entrywise ring maps act strictly on the based-free groupoid (§4.15) and that §4.25's construction is strictly functorial on strict symmetric monoidal functors. A colimit in a separate ∞-category of spectra is not used as a carrier.

- n↦C(Δⁿ,A), with pointwise ring operations and precomposition operators.
- The diagonal realisation for simplicial-set-valued F, taken objectwise in Γ for Γ-space-valued F.
- The map from F(A) induced by constant functions.
- Natural in F and in continuous ring maps.
- Levelwise special input gives a special Γ-space.

**Checks.**

- For a constant functor F, topologicalVariant F A ≃ F A.
- For A with the discrete topology, C(Δⁿ, A) = A and topologicalVariant F A ≃ F A.
- Let F send R to the discrete simplicial set on Rˣ. Then topologicalVariant F ℝ has exactly two path components, given by the sign of a nowhere-zero function on the connected simplex, whereas F(ℝ)=ℝˣ is uncountable.

(HK III Section 3.2, proof of Lemma 3.2.11, p. 59; Sch §10, p. 90.)

*Needs:* §2.17, §2.18, §2.23, §4.15, §4.25, GeneralizedCohomology G2.8, M.

### 4.29 Finite projective modules and general linear groups over C(Δⁿ,k)

Let k be ℝ or ℂ. Prove `continuousFunctions_projective_free`: every finitely generated projective module over C(Δⁿ,k) is free. Present the module by an idempotent matrix e. The straight-line contraction of Δⁿ to a vertex gives a continuous path of idempotents from e to a constant idempotent. Two idempotents f, f′ in a unital Banach algebra with `‖f − f′‖·‖2f − 1‖ < 1` are conjugate by `ff′ + (1 − f)(1 − f′)`, so compactness of the path conjugates e to a constant idempotent, whose image is free. Since C(Δⁿ,k) is commutative and nonzero, ranks are invariant. Hence, for each n, §4.15's functor from the based-free groupoid over C(Δⁿ,k) to the finite-projective core is an equivalence of symmetric monoidal groupoids. It commutes with the simplicial operators only up to the canonical base-change isomorphisms, so it is a levelwise comparison with projectives and not a map of simplicial objects. By contrast, entrywise precomposition makes n↦the based-free groupoid over C(Δⁿ,k) a strict simplicial object of bipermutative groupoids for §4.15's bipermutative structure on based free modules, the rings C(Δⁿ,k) being commutative, preserving block sum, permutation symmetries, the Kronecker product and both distributors on the nose.

Construct the simplicial general-linear comparison: GLᵣ(C(Δⁿ,k))≅C(Δⁿ,GLᵣ(k)) as groups, from Mathlib's `ContinuousMap.unitsLift` and the entrywise matrix identification, natural in the simplicial operators. Thus n↦GLᵣ(C(Δⁿ,k)) is the singular simplicial group of the topological group GLᵣ(k). The identification commutes with stabilization g↦diag(g,1), block sum, permutation conjugation and the Kronecker product, using GeneralizedCohomology G5.4's lexicographic index (i,j)↦i·s+j.

Construct the orthogonal/unitary inclusion: the inclusions O(r)→GLᵣ(ℝ) and U(r)→GLᵣ(ℂ) are homotopy equivalences via the deformation `g ↦ g·(g*g)^(−t/2)`, which fixes O(r) and U(r). For k=ℝ this is GeneralizedCohomology G2.9's polar deformation. Since `|g ⊕ h| = |g| ⊕ |h|` and `|g ⊗ h| = |g| ⊗ |h|`, the deformation commutes with block sum, Kronecker product and permutation conjugation. The inclusions are therefore identity-on-objects strict bipermutative functors.

**Checks.**

- At n=0, C(Δ⁰,k)=k, and the statement is that finite-dimensional vector spaces are free.
- Over C(S¹,ℝ) the sections of the Möbius line bundle form a rank-one finite projective module that is not free, since a basis element would be a nowhere-vanishing section. Contractibility of Δⁿ is used.
- For r=1 and k=ℝ the realised simplicial group n↦GL₁(C(Δⁿ,ℝ)) has two path components, matching O(1)={±1}, whereas GL₁(ℝ) has uncountably many elements.

(Sch Lemma 10.1, p. 90, with proof, pp. 92–93; proof of Prop. 10.2, p. 90; §10.1, p. 92.)

*Needs:* §4.15, §4.28, GeneralizedCohomology G2.9 and G5.4, M.

### 4.30 Topological K-theory of ℝ and ℂ from function rings

For k=ℝ, ℂ let the realized based-free category over k be the topologically enriched bipermutative category with objects r≥0, no morphisms between distinct ranks, endomorphism space of r the realisation of the simplicial group n↦Aut(r) in the based-free groupoid over C(Δⁿ,k), block sum as sum and the lexicographic Kronecker product as product, with §4.15’s bipermutative structure realized levelwise. Define Kᵗᵒᵖ(k) as GeneralizedCohomology G2.8's multiplicative machine applied to the realized based-free category over k; it is a commutative ring spectrum, and its underlying spectrum is G2.8's additive machine on the underlying permutative category. Prove the topological K-theory comparison: Kᵗᵒᵖ(ℝ)≃ko and Kᵗᵒᵖ(ℂ)≃ku as commutative ring spectra, compared with G5.4's models, carrying their units and Bott maps.

1. By §4.29, n↦the based-free groupoid over C(Δⁿ,k) is a strict simplicial object of bipermutative groupoids with object set ℕ in every degree, and the simplicial general-linear comparison identifies its automorphism simplicial groups with the singular simplicial groups of GLᵣ(k), with the opposite composition of §4.15. Realising the hom-objects (§§2.18 and 2.20, which keep finite products) gives the realized based-free category over k. By the coherent-subset/permutative comparison and §2.23, G2.8's additive Γ-space of the realized based-free category over k is levelwise equivalent to the topological variant (§4.28) of R↦the coherent-subset Γ-space of based free R-modules at A=k.
2. For each n separately, the Segal/coherent-subset comparison and §4.29's equivalence from the based-free groupoid over C(Δⁿ,k) to the finite-projective core compare the coherent-subset Γ-space of that level with the Segal Γ-space of finite projective C(Δⁿ,k)-modules. This identifies the levels with projective-module K-theory; it is not a map of simplicial objects.
3. Insert the enriched category with objects r≥0, endomorphism spaces |Sing GLᵣ(k)| under ordinary matrix multiplication and no morphisms between different ranks. Transpose gives an identity-on-objects isomorphism from the realized based-free category over k to this intermediate category. Transport the entire bipermutative structure along this isomorphism, including symmetries and both distributors. Block sum and Kronecker product are preserved because transposition commutes with them; each structure permutation is inverted. By §4.15's row-action convention, the transported matrices are exactly the column-action matrices in GeneralizedCohomology G5.4. Let the general-linear topological category over k have endomorphism spaces GLᵣ(k) and those column-action structures. The realization counit from the intermediate category to the general-linear topological category over k is an identity-on-objects strict bipermutative functor and a weak equivalence on each endomorphism space. It is not an isomorphism. The inclusions of G5.4's O(r) and U(r) categories into the general-linear topological category over k are strict bipermutative functors and hom-space homotopy equivalences by §4.29. Apply G2.8's additive and multiplicative machines to this zigzag and retain the units and Bott classes from G5.4.
4. Let BGL(k)^top be the colimit over r, along g↦diag(g,1), of GeneralizedCohomology G2.9's classifying spaces of the topological groups GLᵣ(k). Deduce the rank and unit-component comparison: Ω∞Kᵗᵒᵖ(k)≃ℤ×BGL(k)^top, with π₀ given by rank. G5.4 identifies the group-completed classifying spaces of its O(r) and U(r) categories with ℤ×BO and ℤ×BU, and the orthogonal/unitary inclusion gives BO(r)≃BGLᵣ(ℝ) and BU(r)≃BGLᵣ(ℂ) compatibly with stabilization; pass to the colimit through step 3. By §4.29, π₀ of every level is ℕ, independently of n.

**Checks.**

- In rank one over ℝ, the interior point at t=1/2 of the nonconstant singular simplex t↦1+t(1−t) and the vertex 5/4 are distinct in |Sing GL₁(ℝ)|. Both evaluate to 5/4, so the counit is not injective.
- For tensor ranks (2,3), G5.4's column shuffle has image list [0,2,4,1,3,5], whereas its inverse has [0,3,1,4,2,5]. The source row-action symmetry has the inverse matrix, whose transpose is the required target matrix. For ranks 0 or 1 the shuffle is the identity; those cases alone cannot detect the error.
- For the distributor with r=2,s=1,t=2, the column permutation has list [0,2,3,1,4,5]; its inverse is [0,3,1,2,4,5]. Transpose of the source row matrix recovers the first list, while the other distributor remains the identity.
- π₀ Kᵗᵒᵖ(ℝ) = K₀(ℝ) = ℤ.
- π₁ Kᵗᵒᵖ(ℝ) = ℤ/2 differs from K₁(ℝ) = ℝ^×, so the topological variant is not the algebraic K-theory.
- `π₂ku=π₂KU=ℤ`, `π₁ku=π₁KU=0`, `π₁ko=π₁KO=ℤ/2` and `π₄ko=π₄KO=ℤ`. The connective covers have zero negative homotopy, whereas `π₋₂KU=ℤ` and `π₋₈KO=ℤ`.
- The rank-one free module goes to the unit of ko or ku, and the class of the trivial rank-n module to n in π₀.

(HK III Section 3.2, proof of Lemma 3.2.11, p. 59; Sch Prop. 10.2 with proof, pp. 90–91.)

*Needs:* §4.15, §4.24, §4.25, §4.28, §4.29, §2.18, §2.20, §2.23, GeneralizedCohomology G2.8, G2.9 and G5.4, M.

### Examples

The category of all finite projective-module maps has a zero object and a contractible classifying space; its core has a different nerve. For free modules, the component monoid is ℕ and its group completion is ℤ. For a finite-dimensional-vector-space core, the zero component is the stable general-linear-group plus construction. Cofinality uses an actual complement.

### Dependencies

Layers 1–3, algebraic Grothendieck groups, AlgebraicKTheory's stable linear groups and projective complements, IntegralLattices and OrthogonalSpinGroups for §4.27, BordismFormalGroups F6.5's symmetric coherence, DerivedModuleAlgebra §1.T.1 and GeneralizedCohomology G3.10 for §4.11; §§4.28–4.30 add simplicial-space realisation and GeneralizedCohomology's Γ-machine (G2.8), topological-group classifiers and polar deformation (G2.9) and K-theory models (G5.4).

## Layer 5: Comparisons for the supplied symmetric spectra

### 5.1 Loop, suspension and shift of spectra

Define suspension, strict loops and their adjunction, and (sh X)ₙ=X₁₊ₙ with the first-letter-fixing subgroup action. Define λ:S¹∧X→sh X by twist, σ and χₙ,₁, verifying the spectrum-map permutation identity. Homotopy calculations of strict loops use Kan levels.

- Levelwise pointed S¹-mapping object; use Kan replacement for derived loops.
- Levelwise S¹∧X.
- susp⊣loop.
- (sh X)ₙ=X₁₊ₙ with restricted actions.
- The σ-derived map λ:S¹∧X→sh X.

**Checks.**

- loop of the trivial spectrum is trivial.
- For every X, π̂ₖ₊₁(sh X)≅π̂ₖX, since the colimit system of the left side is the cofinal subsystem of terms m≥1 of the right side; this check does not assert that the map induced by λ is an isomorphism.
- susp sphere ≅ shift sphere ≅ suspensionSpectrum S¹ (Schwede I Example 3.9) and naivePi (susp sphere) 1 ≅ ℤ.

(S I, §2.1 and Prop. 2.6, pp. 23–24; S I, Example 3.9, p. 37.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.6, GeneralizedCohomology G2.1.

### 5.2 The naive homotopy long exact sequence of a mapping cone

For every spectrum map f, prove the naive cone LES in all integer degrees, for the levelwise point-set mapping cone `C(f)_n = Y_n ∪_{X_n} (Δ[1] ∧ X_n)` with the interval pointed at zero. Its boundary is C(f)→S¹∧X followed by inverse suspension. Use sequential cones after forgetting actions, without semistability.

(S I, (2.11), Prop. 2.12 and proof, pp. 26–28.)

*Needs:* GeneralizedCohomology G2.6, §5.1.

### 5.3 The naive homotopy long exact sequence of a homotopy fibre

Construct path fibres after functorial Kan replacement and their natural naive LES π̂ₖF→π̂ₖX→π̂ₖY→π̂ₖ₋₁F. Boundary comes from ΩY→F and inverse loop shift; strict signatures require Kan source/target levels.

(S I, (2.15), Prop. 2.17 and proof, pp. 29–30.)

*Needs:* GeneralizedCohomology G2.6, §5.1, §2.5, M.

### 5.4 Semistable symmetric spectra

Prove that the supplied semistability predicate is equivalent to λ being a π̂-isomorphism. Prove invariance under π̂-isomorphisms and closure under wedges, finite products, suspension, shift and the levelwise mapping cones of §5.2. Ω- and suspension spectra qualify; F₁S¹ is the counterexample to unrestricted semistability.

- semistability is equivalent to λ_X being a π̂-isomorphism.
- Ω-spectra are semistable.
- Suspension spectra are semistable.
- A π̂-isomorphism f:X→Y gives semistability(X)↔semistability(Y).

**Checks.**

- The sphere spectrum is semistable.
- The trivial spectrum is semistable.
- free 1 S¹ is not semistable.
- `λ_{F₁S¹} : S¹ ∧ F₁S¹ → sh(F₁S¹)` is not a `π̂_*`-isomorphism (it is the inclusion of a wedge summand with non-zero complement, Schwede I Example 8.30), so `F₁S¹` is not semistable.

(S I, Def. 3.14, p. 38; S I, Propositions 3.15–3.16, pp. 38–39.)

*Needs:* §5.1, §5.2, GeneralizedCohomology G2.2, G2.3, G2.5 and G2.6.

### 5.5 Stable equivalences of symmetric spectra

Construct the injective level model structure, the injective level model structure on symmetric spectra: cofibrations the monomorphisms, weak equivalences the level equivalences, fibrant objects the injective spectra. Deduce that every spectrum embeds by a level equivalence in an injective spectrum, and construct the injective Ω replacement. Prove the supplied stable-equivalence predicate equivalent to bijective [Y,E]→[X,E] for all injective Ω E, using the pointed simplicial cylinder quotient: for injective level-fibrant E every spectrum is cofibrant, so simplicial homotopy classes into E compute maps in the level homotopy category. Injective means lifting against every mono level equivalence. Give two-out-of-three and inclusion of level equivalences; a π̂-isomorphism is sufficient rather than definitional.

- The supplied stable-equivalence predicate agrees with detection by homotopy classes into injective Ω-spectra.
- Two-out-of-three; includes level equivalences.
- Extension against every mono that is a level equivalence.
- Maps modulo simplicial homotopy, with contravariant precomposition.

**Checks.**

- The identity is a stable equivalence.
- free 1 S¹ → sphere is a stable equivalence.
- A levelwise weak homotopy equivalence of symmetric spectra is a stable equivalence.
- The map from the trivial spectrum to the sphere spectrum is not a stable equivalence: π₀ differs.

(HSS Def. 3.1.3, Prop. 3.1.4, Thm. 5.1.2 and Cor. 5.1.3; S I, Thm. 6.2, p. 107; S I, Def. 4.11, p. 65.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.3 and G2.6, §2.1.

### 5.6 The smash pairing of true π-groups

Construct the biadditive point-set pairing πₖX×πₗY→πₖ₊ₗ(X∧Y). Verify units, associativity, twist (−1)ᵏˡ and the two suspension compatibilities, with sign (−1)ᵏ in the second variable. Section 5.11 compares it with the derived pairing.

(S I, Thm. 6.16, p. 116.)

*Needs:* GeneralizedCohomology G2.6, GeneralizedCohomology G2.2, §5.1.

### 5.7 Mapping cones and homotopy fibres of spectra

Reuse §5.2's levelwise point-set cone C(f), with the interval pointed at zero and X attached to Y at one, and its projection C(f)→S¹∧X, and §5.3's Kan-replaced path fibre. Compare the cone with GeneralizedCohomology G2.4’s derived cone by interval reflection t↦1−t, retaining the boundary sign. Express the supplied derived fibres with ΩY→F→X on the corresponding endpoint model. Both are square-functorial; C(id) is contractible and C(X→0)=ΣX, fixing boundary endpoints.

- The cone with Y→C(f)→S¹∧X.
- The path fibre with ΩY→F(f)→X; replace non-Kan levels first.
- Strict squares give functorial cone and fibre maps.

**Checks.**

- mappingCone (𝟙 X) is stably contractible.
- mappingCone (X ⟶ 0) ≅ susp X.
- For Kan-level Y the strict path fibre of 0→Y is loop Y. In general the derived fibre is isomorphic in SHC to the derived loop spectrum.
- For a non-injective map, the strict cofibre (quotient) differs from the mapping cone: for X ⟶ 0 the quotient is 0 but the mapping cone is susp X.

(S II, Examples 2.4 and 2.6, pp. 229–230; S I, (2.10) and (2.14), pp. 27–29.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.4, §5.1, §5.2, §5.3, GeneralizedCohomology G2.10.

### 5.8 Fibre and cofibre sequences agree up to a shift

For Kan-level X,Y, prove h:S¹∧F(f)→C(f) a π̂-isomorphism and stable equivalence. Derive the general comparison; its adjoint uses cone Kan replacement. Fix the boundary sign h_*(S¹∧δ_F(y))=−i_*(y) with these interval endpoints.

**Checks.**

- For a Kan-level fibre, cone boundary after suspended fibre boundary is minus the target inclusion.
- For f the identity of a Kan-level X both F(f) and C(f) are stably contractible and h is a stable equivalence between them.
- For f:0→Y with Kan levels, F(f) is loop Y and h:S¹∧ΩY→Y is the counit, a stable equivalence.

(S I, (2.16) and Prop. 2.17, p. 29.)

*Needs:* §5.2, §5.7, §5.5, §5.1, GeneralizedCohomology G2.6, §5.3.

### 5.9 Finite wedges and products of spectra agree

Prove finite wedge→product a π̂-isomorphism and stable equivalence, characterised by all four entries (id,0;0,id). Arbitrary wedges give direct-sum naive groups; only finite products are asserted. Deduce SHC biproducts.

(S I, Prop. 2.19, p. 30.)

*Needs:* GeneralizedCohomology G2.6, §5.5, §5.2.

### 5.10 The derived smash product on the stable homotopy category

Characterize the supplied flatness predicate by preservation of level cofibrations under X∧−. Equivalently each latching map LₙX→Xₙ is a cofibration of underlying pointed simplicial sets; no free Σₙ-action is required for this criterion. Use GeneralizedCohomology G2.4's positive flat model, its functorial replacements and its theorem that the point-set smash of two flat spectra computes the derived smash. The additions here are the latching characterisation and the one-flat-input statements: smashing with a single flat spectrum preserves stable equivalences, and the coherent lax symmetric comparison γX∧ᴸγY→γ(X∧Y) of the supplied closed symmetric monoidal SHC product is invertible if either input is flat. (S, Def. I.5.41, p. 98; Prop. I.5.47, p. 100.)

**Checks.**

- S and free spectra FₙK are flat.
- S with its zero level deleted is not flat: its degree-two latching map identifies the two permutation copies.
- The zero spectrum is flat; smashing with it gives zero.

(S II, Thm. 3.1, p. 239; S II, Prop. 3.19 and (3.20), pp. 248–249.)

*Needs:* GeneralizedCohomology G2.2 and G2.4–G2.6.

### 5.11 The smash pairing on π-groups

Construct the derived bilinear pairing πₙX×πₘY→πₙ₊ₘ(X∧ᴸY) on GeneralizedCohomology G2.4's derived smash, by smashing representing sphere maps and precomposing the sphere-factor isomorphism α:Sⁿ⁺ᵐ≅Sⁿ∧ᴸSᵐ built from the block identifications of G2.1–G2.2. Prove its associativity, units and graded twist, then its shifted-map naturality and comparison with the point-set pairing of §5.6. For a degree-m′ second map and degree-n first class, the shifted naturality sign is (−1)ᵐ′ⁿ. Compare with the point-set pairing through the lax map.

- For a degree-m′ second map and x∈πₙ, (f∧f′)_*(xy)=(−1)ᵐ′ⁿf_*(x)f′_*(y), with shifted tensor identifications.
- The comparison ψ:X∧ᴸY→X∧Y sends the pairing to the point-set product.

**Checks.**

- pi S * with piPairing is a graded-commutative ring with pi S 0 ≅ ℤ.
- For Y = S and the unit 1 ∈ π₀S, x · 1 corresponds to x under X ∧ᴸ S ≅ X (unit isomorphism), for every x ∈ π_p X.
- ι₁·ι₁ generates π₂(S¹∧ᴸS¹)=ℤ under the sphere-factor isomorphism; its swapped value is the negative generator.
- piPairing is not commutative without sign: for ι ∈ pi S¹ 1 (S¹ = ΣS), ι · ι = −τ_*(ι · ι).
- Swapping the degree-one sphere generators negates their degree-two product; swapping degrees zero and one does not.

(S II, Prop. 4.11, p. 252.)

*Needs:* §5.6, §5.10, GeneralizedCohomology G2.1–G2.2, G2.4 and its conventions, G2.6.

### 5.12 Connectivity of smash products

For (k−1)-connected X and (l−1)-connected Y, the (k+l−1)-connectivity of X∧ᴸY is GeneralizedCohomology G3.8's connectivity of derived smash. Prove the bottom-degree isomorphism πₖX⊗πₗY≅πₖ₊ₗ(X∧ᴸY), induced by §5.11's pairing. It does not extend to all degrees.

(S II, Prop. 5.22, p. 264.)

*Needs:* GeneralizedCohomology G2.4 and G3.8, §5.11, §5.10.

### 5.13 Operads and E∞-algebras in symmetric spectra

Define operads of symmetric spectra with right symmetric-group actions, unit S→O(1), substitution, and all associativity, unit, block permutation and equivariance equations. Define O-algebras by the action maps and equations. Reuse GeneralizedCohomology G2.8's Barratt–Eccles algebra and positive rectification API, extending it to all spectrum-valued operads. Include simplicial E∞ operads and their spectrum realisation and Com-algebras as commutative ring spectra. For spectra of pointed simplicial sets, use the stable positive model structure: every spectrum-valued operad is admissible, and an aritywise stable equivalence induces an extension–restriction Quillen equivalence. No Σ-cofibrancy hypothesis is imposed in this positive statement. Derived functors use cofibrant algebra replacements; it does not assert that their underlying spectra are positively cofibrant. Thus Σ∞₊EΣₙ→Com rectifies E∞ rings. Name the positive model structure on operad algebras and rectification of operad algebras. (Pavlov–Scholbach, Thms. 4.1 and 4.6, Ex. 4.7, pp. 17–18.) Construct the little-n-cubes operad, the topological operad of rectilinear embeddings of finitely many disjoint open n-cubes into the open n-cube, and its locally Kan simplicial operad Sing(littleCubesOperad n). Prove the Σₖ-equivariant homotopy equivalence of its arity-k space with the ordered configuration space Conf(k,ℝⁿ), by evaluation at the cube centres. Its operadic nerve, by BordismFormalGroups F6.5, is the ∞-operad Eₙ, and Eₘ-monoidal ∞-categories are coCartesian fibrations of ∞-operads over Eₘ in F6.5's sense. Consume F6.5's generic infinity-operad interfaces to define the abstract Eₙ-algebra interfaces. For every locally Kan simplicial operad O, construct the operadic localization comparison: localization of O-algebras in concrete spectra is equivalent to algebras over the supplied operadic nerve of O in Sp∞, including derived mapping spaces. F6.5's operadic nerve is constructed only for locally Kan operads; a general O is first replaced aritywise by Sing|O|, which is locally Kan and receives an aritywise weak equivalence, and the rectification above compares the two algebra categories. At n=2, the little-2-cubes operad is BordismFormalGroups F6.2's little-2-cubes operad, with the same rectilinear embeddings, and its arity spaces are F6.2's configuration spaces C₂(j). Apply this to Sing(littleCubesOperad n) for Layer 7 (Pavlov–Scholbach, Thm. 4.9, p. 19; HA Defs. 5.1.0.1–5.1.0.4, pp. 758–759, and Lemma 5.1.1.3, p. 761).

- Spectrum-valued operads with all equivariant unit/composition axioms.
- Full operad actions on spectra.
- Apply Σ∞₊ aritywise to a simplicial operad.
- Com-algebras≅commutative symmetric ring spectra.
- Each simplicial arity space P(n) is weakly contractible and its Σₙ action is free, including arity zero.
- A spectrum operad O comes with an augmentation O→Com which is an aritywise stable equivalence; this is the spectral recognition predicate. In particular O=Σ∞₊P for a simplicial E∞ operad has this predicate. Its arity spectra are equivalent to S, rather than contractible spectra. Freeness of the simplicial action is part of the chosen space model, not a point-set freeness requirement on every spectrum operad equivalent to Com.
- The simplicial predicate implies the spectral predicate through the augmentation.
- Extension/restriction along this augmentation is a Quillen equivalence for positive stable algebra models.

**Checks.**

- For a commutative ring R, HR is a Com-algebra.
- The trivial spectrum is an algebra over every operad.
- Algebras over the associative operad are exactly symmetric ring spectra (GeneralizedCohomology G2.4).
- The cofibre S/2 of 2:S→S, GeneralizedCohomology G2.4's derived cone, admits no algebra structure over the associative operad, nor any unital A₂-structure, since that contract records that it has no homotopy-unital multiplication.
- The operad concentrated in arity one with value S has algebras equal to spectra; it is not E∞, since its arity-two spectrum is zero rather than S.
- The Barratt–Eccles arity spectrum Σ∞₊EΣ₂ has π₀=ℤ, while a contractible spectrum has π₀=0. Com has the spectral predicate although its simplicial commutative model has a nonfree Σ₂ action.
- Com-algebras have the commutative ring-spectrum equations.
- Barratt–Eccles→Com gives a positive Quillen equivalence; no absolute Ω replacement of the sphere by a commutative ring is inferred.
- The arity-two space of the little-n-cubes operad is Σ₂-equivariantly equivalent to Conf(2,ℝⁿ)≃Sⁿ⁻¹ with the antipodal action; for n=1 it has two contractible components exchanged by Σ₂.
- arity zero is a point and arity one is contractible, containing the identity embedding.

(S III, Definitions 5.3–5.4 and Examples 5.9–5.12, pp. 368–370.)

*Needs:* GeneralizedCohomology G2.1–G2.4 and G2.8, BordismFormalGroups F6.2 and F6.5.

### 5.14 HR as a ring spectrum and HR-modules

Extend GeneralizedCohomology G2.7’s commutative HR construction to every unital associative ring R, identifying its π₀ ring, and HM for Module Rᵐᵒᵖ M with its actual right action. The derived equivalence of HR-modules with complexes is §5.15's. Matrix-unit order pins handedness.

- HR with its ring structure, underlying H(R,+).
- HR is commutative when R is.
- For Module Rᵐᵒᵖ M, HM is a right HR-module.
- π₀HR≅R as rings.
- The module’s underlying spectrum is HM.

**Checks.**

- pi (eilenbergMacLaneRing ℤ) 0 ≃+* ℤ.
- eilenbergMacLaneRing of the zero ring is the trivial ring spectrum.
- The unit S → HR induces ℤ → R on π₀, the canonical ring map.
- HF₂ ∧ᴸ HF₂ is not HF₂: its π₁ is nonzero (the dual Steenrod algebra has ξ₁ in degree 1), so HR ∧ᴸ HR ≠ HR in general.
- For M=ℤ as a right ℤ-module, HM has π₀=ℤ with its usual right multiplication and zero homotopy in every other degree; both the nonzero carrier and its action are retained.
- The zero right R-module gives a stably zero HR-module spectrum.
- The regular right action over M₂(ℤ) sends (e₁₂,e₂₁) to e₁₁. The reversed product is e₂₂.

(S I, Example 1.14, p. 16; S IV, definition preceding Thm. 1.3, p. 386.)

*Needs:* GeneralizedCohomology G2.7, GeneralizedCohomology G2.4.

### 5.15 The Eilenberg–Mac Lane spectrum of a chain complex

Construct the unbounded cochain-to-HR-module functor and its underlying spectrum functor at R=ℤ, inducing D(ℤ)≃Ho(Hℤ-Mod). Its homotopy/shift identifications follow below; cochain degree two gives π₋₂. Construct the projective model on unbounded complexes (weak equivalences quasi-isomorphisms, fibrations degreewise surjections), the stable model on spectra in simplicial R-modules, and the weak monoidal Quillen zigzag through nonnegative chain-complex spectra. Name the projective model on complexes, the stable model on simplicial modules, the HR-module/derived-category equivalence, with derived unit/counit isomorphisms and their suspension compatibility (Sh, Prop. 2.10, p. 7, and §§3–4, pp. 10–21).

- The full cochain-complex-to-Hℤ-module functor and its underlying spectrum functor, with naturality and shift comparisons.
- Quasi-isomorphisms induce stable equivalences.
- For every unital associative ring R, the homotopy category of right HR-modules is equivalent to D(right R-modules) as triangulated categories, compatibly with underlying spectra; for commutative R the equivalence is monoidal, identifying relative smash with derived tensor.

**Checks.**

- The zero complex goes to a stably trivial spectrum.
- eilenbergMacLaneComplex (A concentrated in degree 0) is stably equivalent to eilenbergMacLane A.
- For the cochain complex C = ℤ concentrated in degree +2, pi (H C) (−2) ≅ ℤ: negative homotopy is retained. Cochain degree −2 instead gives π₂=ℤ.
- For C = (ℤ →·2 ℤ) in homological degrees 1, 0 (cochain degrees −1, 0), H(C) is not stably equivalent to H(C₀) ∨ ΣH(C₁) = HZ ∨ ΣHZ: π₀ H(C) = ℤ/2 ≠ ℤ.
- ℤ→¹ℤ gives a contractible spectrum.

(Sh §2, p. 6; Cor. 2.15; Sh Theorem 2.5, p. 5.)

*Needs:* §5.14, GeneralizedCohomology G2.4 and G2.7, M.

### 5.16 Complex homology and spectrum homotopy

Prove πₖH(C)≅H⁻ᵏ(C) and H(C[1])≅ΣH(C), naturally for unbounded cochains and Mathlib's shift C[1]ⁿ=Cⁿ⁺¹. The derived functor is exact and H(A[0])≅HA. A degree-two group moves from π₋₂ to π₋₁ after [1].

**Checks.**

- ℤ in cochain degree 2 has spectrum π₋₂=ℤ; after [1] the nonzero group is π₋₁.

(Sh Cor. 2.15, p. 8.)

*Needs:* §5.15, GeneralizedCohomology G2.4–G2.6 and G3.8, M.

### 5.17 Cellular approximation in triangulated categories with sums

Let T be a triangulated category with objects in Type u, morphisms in Type v and all Type v-indexed coproducts. Take a family G:I→T with I in Type v, write C for its image, and let E:Tᵒᵖ→Ab be cohomological, with values in Type v and carrying Type v-indexed coproducts to products. For an object A, define `IsCompactForCoproducts A` by preservation of these coproducts by the additive represented functor T(A,−). Define `InCellClosure G R` by membership of R in every isomorphism-invariant class containing G and closed under those coproducts and third objects of distinguished triangles whose first two objects lie in the class. Assume each Gᵢ is compact. The theorem `cellularApproximation` states the generic approximation below on these native carriers; the spectral specialization uses SHC. Construct R in the closure of C under sums and cofibres, and u∈E(R), such that [G,R]→E(G), f↦E(f)(u), is bijective for every G∈C. Build the sequential cellular approximation and its telescope. Use the supplied sphere compactness and generation to specialize this construction to SHC; generic categorical representability is used only after constructing the object. Prove induction by connective sphere cells: if an isomorphism-invariant class of spectra contains Sⁿ and is closed under arbitrary coproducts and cofibres (for a distinguished triangle X→Y→Z→ΣX with X and Y in the class, Z is in the class), it contains every spectrum with π_k=0 for k<n. Closure under middle terms of triangles does not suffice: the class of X with [X,Σⁿ⁺¹Hℤ]=0 contains Sⁿ and is closed under coproducts and middle terms, but does not contain Sⁿ⁺¹. Prove the attachment connectivity and all-π comparison. For every contravariant cohomological F:SHCᵒᵖ→Ab taking coproducts to products, prove the generic Milnor sequence `0→lim¹F(ΣX_i)→F(hocolim X_i)→lim F(X_i)→0`, with naturality under coherent model maps. This general functor statement supplements the represented-theory telescope contract.

The compactness predicate has the following API.

- Compactness is invariant under isomorphism, and the zero object is compact.
- Finite coproducts and shifts of compact objects are compact.
- Compactness identifies maps from G into a small coproduct with the direct sum of the component homomorphism groups, retaining the canonical inclusions.

**Checks.**

- In D(ℤ), the zero object represents the zero functor: both sides of its coproduct comparison are zero.
- In D(ℤ), ℤ[0] is compact: for the countable sum of ℤ[0], both sides of its comparison are the finitely supported sequences ⊕ℕℤ.
- The object ⊕ℕℤ[0] is not compact: its identity map to that same coproduct has infinitely many nonzero coordinate projections and is not in the image of the direct sum of homomorphism groups.

The cell-closure predicate has the following API.

- Every generator lies in the closure, and membership is invariant under isomorphism.
- It is closed under small coproducts, including the empty coproduct, and under the stated third-object operation; every class with these properties contains it.
- Inclusion of generating families implies inclusion of closures; replacing generators by isomorphic objects gives the same closure.

**Checks.**

- For the empty family the closure consists exactly of zero objects; take R=0 and u=0 for the approximation theorem, with no evaluation conditions.
- For C={ℤ[0]} in D(ℤ), the cone of ×2:ℤ[0]→ℤ[0] is (ℤ/2)[0] in the closure. For E=Hom(−,(ℤ/2)[0]), R=(ℤ/2)[0] and u=id make evaluation ℤ/2→ℤ/2 the identity, taking 0↦0 and 1↦1.
- The cone of ℤ[0]→0 is ℤ[1], so the closure contains its positive suspension. It does not contain ℤ[−1]: every generator has Hᵏ=0 for k>0 and coproducts and the specified cofibres preserve this condition, whereas H¹(ℤ[−1])=ℤ.
- For the zero cohomological functor and any compact family, R=0 gives the unique map 0→0 on each evaluation group. The sums-to-products hypothesis remains explicit for nonzero functors.

(S II, Def. 5.4, p. 257, Lemma 5.6, pp. 257–258, and Prop. 5.14, pp. 260–261.)

*Needs:* Mathlib `Pretriangulated`, `IsTriangulated`, `Functor.IsHomological`, `preadditiveCoyoneda`, `HasCoproducts`, `PreservesColimitsOfShape` and `PreservesLimitsOfShape` for the generic theorem; GeneralizedCohomology G2.4, G2.6, G3.4 and G3.7 for the spectral specialization and coherent spectral telescopes.

### 5.18 Connective spectra are sequences of deloopings

Use GeneralizedCohomology G2.5’s sequential/symmetric Quillen equivalence, including its replaced unit/counit, stable π comparison and Kan Ω models. Compare connective Ω-spectra with deloopings whose ith space has πⱼ=0 for j<i. Here `spectraInfinityCategory` denotes BordismFormalGroups F6.5's supplied monoidal stable Sp∞, with its SHC and derived-smash comparisons. The additional target compares connective sequential Ω-models with the connective objects of that carrier, preserving suspension, zero objects, cofibre sequences and those ambient fibre sequences whose fibre is connective.

**Checks.**

- The zero spectrum is both initial and terminal.
- The cofibre of id:S→S is zero, and its square is also a pullback.
- tensoring with S is identity; ΣS has π₁=ℤ and π₀=0.

(BS Appendix §12, Def. 12.8 and footnote 29, p. 57; HSS Thm. 4.3.2, p. 42.)

*Needs:* GeneralizedCohomology G2.1–G2.6 and G3.8, §5.10, BordismFormalGroups F6.5.

### 5.19 Picard groupoids are 1-truncated connective spectra

For a Picard groupoid C, construct K(C) with zero space BC, π₀=iso-classes, π₁=Aut(1) and other π zero. Prove the homotopy-theory equivalence with 1-truncated connective spectra, retaining transformations. Identify the map η:π₀K(C)→π₁K(C) with self-braiding: the symmetry of x⊗x is transported to Aut(1) by tensoring with an inverse of x⊗x, independently of that choice (JO Prop. 3.4 and Remark 3.5, pp. 10–11 of arXiv:1201.2686v3).

**Checks.**

- A discrete abelian group A gives HA, with π₀=A and π₁=0.
- The one-object Picard groupoid with automorphisms A gives ΣHA.
- For ℤ-graded real lines with Koszul symmetry, π₀=ℤ and π₁=ℝˣ; self-braiding in degree n is (−1)ⁿ², so η(1)=−1 and η(2)=+1. Ordinary ungraded real lines have π₀=0 and self-swap +1, hence trivial η.

(BS Appendix §12, after the proof of Prop. 12.15, p. 59.)

*Needs:* GeneralizedCohomology G2.8, §4.26, §1.34, GeneralizedCohomology G3.8.

### Examples

The sphere spectrum has π₀ = ℤ and no negative groups. The free symmetric spectrum in level one shows why naive groups need not compute stable groups. A two-sphere-factor twist in degrees one and one acts by −1. The Eilenberg–Mac Lane spectrum of ℤ has precisely one nonzero homotopy group, in degree zero.

### Dependencies

Layers 1–4 and Mathlib’s model, monoidal, derived and triangulated APIs; the supplied spectral models are used through the stated comparisons.

## Layer 6: Assembly of the K-theory spectrum

### 6.1 The K-theory symmetric spectrum of a Waldhausen category

Build the Waldhausen inputs locally before the spectrum assembly. A Waldhausen category has a zero object, subcategories of cofibrations and weak equivalences containing all isomorphisms, zero-to-object cofibrations, closure of cofibrations under pushout along arbitrary maps, and the weak-equivalence gluing axiom for pushout squares. Define exact functors preserving this data, the cofibration-sequence category, and SₙC as functors Ar[n]→C with zero diagonal and the specified cofibration/pushout quotient squares. Construct the Waldhausen structure on SₙC before iterating S: weak equivalences are objectwise, and A→B is a cofibration precisely when `B₀ᵢ ⊔_{A₀ᵢ} A₀ⱼ → B₀ⱼ` is a cofibration for every 0≤i≤j≤n. Prove pushout stability and gluing and that every face and degeneracy is exact, preserving the quotient squares. Then form the iterated multisimplicial construction. Define simplicial-set levels K(C)ₙ by diagonal nerves of wS⁽ⁿ⁾C, with realisation |wS⁽ⁿ⁾C| with Σₙ acting by permutation of directions, construct structure maps and prove iterated equivariance. This unreplaced spectrum has zeroth simplicial level nerve(wC). Section 6.2 constructs a levelwise Kan replacement and a connective Ω-model whose realised zero space is weakly equivalent to Ω|wS.C|.

- The iterated-S symmetric spectrum, with pointed simplicial-set levels diag N(wS⁽ⁿ⁾C) realising to |wS⁽ⁿ⁾C|, using the full local Waldhausen axioms.
- Exact functors give spectrum maps preserving identities/composition.
- Level zero is nerve(wC).
- Compare with Ω|wS•C|, |wS•C|, |wS•S•C|,… using the specified shift and replacement.

Before assembly, define the Waldhausen group K₀(C) as the abelian group on object classes with [0]=0, [A]=[B] for every weak equivalence A→B, and [B]=[A]+[B/A] for every cofibration sequence. Define the induced map on K₀ for exact functors and the universal property of K₀ for additive invariants satisfying these relations. Prove the component/K₀ comparison, with the class of an object sent to its loop in |wS.C|, using the one- and two-simplex presentation. This is a local topological comparison; the split-projective specialisation consumes the existing split-K₀ supplier.

The weak-equivalence subcategory need not satisfy an extra extension axiom. **API:** the zero object of a Waldhausen category, closure of cofibrations under pushout, weak-equivalence gluing, composition of exact functors, the categories SₙC, the face functors of S, the degeneracy functors of S, the identification S₁C≃C, the identification of S₂C with cofibration sequences.

**Checks.**

- kSpectrum of the trivial Waldhausen category (one object) is the trivial spectrum.
- The zero category has zero K₀ and its zero object has class zero.
- finite pointed sets with injections and bijections have K₀≅ℤ, sending a pointed set with n non-basepoints to n; a one-point set maps to zero and a two-point set to +1.
- split cofibration sequences of finite projectives impose exactly [P⊕Q]=[P]+[Q] and recover `TauCeti.SplitK0`. The relation [ℤ²]=2[ℤ] fixes the sign.
- For bounded acyclic complexes with quasi-isomorphisms as weak equivalences, the weak equivalence to zero forces their classes to zero; an object-class monoid without the weak-equivalence relation fails this check.
- The zero category has terminal Sₙ.
- S₀C is terminal and S₁C recovers C.
- S₂C records a cofibration and its specified quotient; a composable pair without the pushout quotient square fails.
- Under S₁C≃C the latching condition is exactly the original cofibration condition.
- over a field k, the map (0⊂0⊂k)→(0⊂k⊂k), identity on the final k, is injective at each underlying filtration stage, but its relative latching map k⊕k→k is the fold and is not injective. It is not a cofibration in S₂C; its quotient component k→0 is also not injective.
- The zero diagram maps by a cofibration to every Sₙ-object because its latching maps are the object's prescribed filtration cofibrations.
- identity and composite exact functors preserve every axiom.
- A zero-preserving functor that fails to preserve cofibrations is not exact.

(S I, Example 3.50, pp. 55–57; W IV §8.3, the Waldhausen-structure paragraphs before Definition 8.3.1, pp. IV.67–68, and Infinite Loop Structure 8.5.5, p. IV.69; Waldhausen, §§1.1–1.3, pp. 318–330.)

*Needs:* GeneralizedCohomology G2.2, §2.17, §2.18, M. Build the category, exact functors, S-diagrams and K₀ presentation first, then the iterated spectrum and its component presentation. Section 6.2 supplies the positive delooping and Kan-replacement comparisons.

### 6.2 The iterated S.-construction is a connective Ω-spectrum

Prove Waldhausen additivity in its extension-category form. Let A and B be Waldhausen subcategories of C: they contain the zero object, carry the cofibrations and weak equivalences of C lying in them, and contain the quotient of each of their cofibrations. Let E(A,C,B) be the full subcategory of S₂C on the cofibration sequences a↣c↠b with a∈A and b∈B, with the weak equivalences of S₂C; its cofibrations are the cofibrations of S₂C whose subobject and quotient components are cofibrations of A and of B. Additivity is the statement that (subobject, quotient) gives |wS•E(A,C,B)|≃|wS•A|×|wS•B|; at A=B=C it reads |wS•E(C)|≃|wS•C|×|wS•C| for the category E(C)=S₂C of cofibration sequences. The proof runs through the following named steps of Waldhausen's proof. For m≥0 let wₘC be the category of strings of m composable weak equivalences, with the induced cofibrations of Waldhausen §1.4. The m-simplices of the nerve of wSₙC are the objects of Sₙ(wₘC), and E(wₘA,wₘC,wₘB)=wₘE(A,C,B), so in each w-degree m the steps below are statements about object simplicial sets δD=Ob(S•D), applied to wₘA⊂wₘC⊃wₘB in place of A⊂C⊃B. the homotopy induced by a natural isomorphism of S-diagrams: an exact natural isomorphism between exact functors of categories with cofibrations induces a simplicial homotopy between the induced maps of δ; applied in every w-degree it gives a simplicial homotopy between the induced maps of wS•. the additivity fiber: for y∈δₙA, the fibre `F_y = Δ[n] ×_{δA} δE(A,C,B)` of the subobject map δE(A,C,B)→δA is the simplicial set whose m-simplices are a monotone u:[m]→[n] and a cofibration sequence u*y↣D↠Q in SₘC with Q∈SₘB; its quotient map p_y:F_y→δB has the section q_y given by the constant map at the last vertex n and 0↣Q=Q, which is a simplex of F_y because every vertex of an Sₙ-object is zero. the pushout contraction of the additivity fiber: for v:[m]→[1] let ū agree with u where v=0 and equal n where v=1; cobase change of the fibre extension along u*y→ū*y, which keeps the subobject in SₘA and the quotient Q, defines a simplicial homotopy id≃q_y∘p_y, so p_y is a homotopy equivalence. object additivity for S-diagrams: (subobject, quotient):δE(A,C,B)→δA×δB is a weak equivalence. Both sides lie over δA through the subobject and the first projection, and over each simplex y the induced map of fibres is (projection, p_y):F_y→Δ[n]×δB, a weak equivalence. A map over a simplicial base that is a weak equivalence on the fibre over every simplex is a weak equivalence, by induction over the skeleta of the base with the gluing lemma §2.21 and passage to the colimit through §1.6; no fibration hypothesis is needed. Applying object additivity for S-diagrams to wₘA⊂wₘC⊃wₘB for every m and realising in the w-direction by §2.23 gives additivity. Then define the relative S-construction of F of an exact functor F:B→C by `S_n(F) = S_n B ×_{S_n C} S_(n+1) C`, the fibre product over d₀:Sₙ₊₁C→SₙC, the face omitting the index 0, with its induced Waldhausen structure. At F=id_C this is the path object PS•C: PₙS•C=Sₙ₊₁C with faces and degeneracies shifted by one, the remaining face d₀ giving PS•C→S•C, and the extra degeneracy contracting PS•C simplicially onto its zero object. The constant-filtration inclusion c↦(0, 0↣c=⋯=c) of C in Sₙ(F) and the projection Sₙ(F)→SₙB are exact. Prove the relative-S fiber sequence: |wS•C|→|wS•S•(F)|→|wS•S•B| is a homotopy fibre sequence for every exact F. Write an object of Sₙ(F) as (b,x) with b∈SₙB, x∈Sₙ₊₁C and d₀x=F(b), let F̃:SₙB→Sₙ₊₁C put a zero in front of the filtration F(b), so that d₀F̃(b)=F(b), and let s(b)=(b,F̃(b)), a section of the projection p:Sₙ(F)→SₙB. Let A′ₙ and B′ₙ be the Waldhausen subcategories of Sₙ(F) on the objects isomorphic to a constant filtration (0, 0↣c=⋯=c) and to some s(b). the relative-S extension-category equivalence: the middle-term functor E(A′ₙ,Sₙ(F),B′ₙ)→Sₙ(F) is an exact equivalence; its exact inverse sends (b,x) to the cofibration sequence (0, 0↣x₀₁=⋯=x₀₁)↣(b,x)↠s(b), whose quotient is s(b) because x/x₀₁ has entries x₁ⱼ=(d₀x)₀,ⱼ₋₁=F(b)₀,ⱼ₋₁ at j≥2 and zero at j=1. The constant-filtration functor C→A′ₙ and s:SₙB→B′ₙ are exact equivalences with exact inverses (b,x)↦x₀₁ and p. With the homotopy induced by a natural isomorphism of S-diagrams, additivity makes ((b,x)↦x₀₁, p):|wS•Sₙ(F)|→|wS•C|×|wS•SₙB| a weak equivalence, and the constant-filtration inclusion followed by p is zero, so |wS•C|→|wS•Sₙ(F)|→|wS•SₙB| is a split fibre sequence whose base is connected; §2.24 realises these in the n-direction. At F=id the middle term is contractible by the extra degeneracy, so |wS•C|≃Ω|wS•S•C|. As a corollary, for every exact F, |wS•B|→|wS•C|→|wS•S•(F)| is a homotopy fibre sequence whose first map is |wS•F|, obtained by rotating the relative-S fiber sequence and applying this delooping to B. Applying the delooping in each multidegree, the realised adjoint structure maps |wS⁽ⁿ⁾C|→Ω|wS⁽ⁿ⁺¹⁾C| are weak equivalences for n≥1. Define the levelwise fibrant K-theory spectrum of C by GeneralizedCohomology G2.3's functorial level-fibrant replacement of the symmetric spectrum, retaining the replacement spectrum map. Its levels are Kan, and the positive delooping comparisons imply positive Ω-fibrancy. The raw diagonal nerves need not be Kan.

- The levelwise Kan replacement is a positive Ω-spectrum, with its positive deloopings compared through the replacement maps.
- The unreplaced spectrum is semistable, by stabilisation of its realised positive-level homotopy groups.

Apply the supplied stable Ω-replacement to obtain the connective Ω-model. Compare its positive levels with the levelwise fibrant K-theory spectrum of C and its realised zero space with Ω|wS•C|. The level-fibrant replacement map at zero is a weak equivalence from nerve(wC); the exact nerve description applies to the unreplaced spectrum.

**Checks.**

- For finite pointed sets with injections and bijections, the raw first level has a Λ²₀ horn whose d₂ edge is the identity of a set A with one non-basepoint and whose d₁ edge is the identity of the zero object. All vertices are the zero vertex. A filler would contain a filtration A↣0, which is impossible.
- The replacement's zero level retains π₀=ℕ from nerve(wFinSet*), whereas its connective Ω-model has π₀=ℤ. The positive replacement comparison preserves the generator represented by the two-point set.
- For the zero Waldhausen category every replacement level is weakly contractible, and the comparison with the zero spectrum is a level weak equivalence.
- pi (kSpectrum C) 0 ≅ WaldhausenCategory.K0 C via §6.1's generators-and-relations comparison. The group for a non-split exact category imposes all cofibration-sequence relations, rather than just split ones.
- For finite projective R-modules with isomorphisms as weak equivalences, the unreplaced level zero is nerve(wC), whose realisation has the object-isomorphism monoid as π₀. The connective Ω-model has zero space weakly equivalent to Ω|wS.C| and π₀=K₀(R).
- For F the identity of C, S•(F) is the path object PS•C and its extra degeneracy contracts wS•S•(F), so the relative-S fiber sequence reads |wS•C|→*→|wS•S•C| and gives |wS•C|≃Ω|wS•S•C|. The corollary form at F=id reads |wS•C|→|wS•C|→* and carries no delooping.
- For finite-dimensional vector spaces with isomorphisms as weak equivalences, the fibre F_y over the zero vertex parametrises 0↣D↠B in SₘC, and p_y is a homotopy equivalence onto δC, whose realisation has π₁=K₀=ℤ. The fibres are therefore not contractible; additivity uses that p_y is an equivalence, not that the subobject map is one.
- At n=1 and F=id_C, S₁(F) is S₂C, A′₁ consists of the sequences c=c↠0, B′₁ of the sequences 0↣b=b, and the inverse equivalence sends c↣x↠b to (c=c↠0)↣(c↣x↠b)↠(0↣b=b); the resulting splitting |wS•S₂C|≃|wS•C|×|wS•C| is the A=B=C additivity, with subobject and quotient as the two coordinates.
- For F:0→C, Sₙ(F) is the category of constant filtrations 0↣c=⋯=c, equivalent to C in every degree, and the relative-S fiber sequence reads |wS•C|→|wS•C|→*. For F:C→0, S•(F)=S•C and the corollary form reads |wS•C|→*→|wS•S•C|, the delooping again.

(W IV Prop. 8.4 with proof, Def. 8.5, 8.5.3–8.5.5, pp. IV.68–69; W V Prop. 1.7 with proof and Remark 1.7.1, p. V.8; S I, Prop. 8.26(i) and Example 8.27, pp. 182–183; Waldhausen, Lemma 1.4.1, Thm. 1.4.2 with proof and Lemma 1.4.3 with proof, pp. 335–340, and §1.5, p. 342.)

*Needs:* §6.1 (Waldhausen/S foundations and unreplaced spectrum), §1.6, §1.10, §2.18, §2.19, §2.21, §2.23, §2.24, GeneralizedCohomology G2.3 and G2.6, §5.4. Prove additivity before the relative-S fibre sequence, realised positive delooping and Kan-replacement comparisons.

### 6.3 The Barratt–Priddy–Quillen–Segal theorem

For a small additive category A, with split monomorphisms as cofibrations and isomorphisms as weak equivalences, the comparison of Ω|iS•A| with the group completion B((iso A)⁻¹(iso A)) of B(iso A) passes through the Q-construction (W IV Exercises 8.5–8.6 and Thm. 7.1) and is owned by the consumer GeneralAlgebraicKTheory, not stated here. For finite pointed sets the wedge functors compare S• with the bar construction degreewise, and this gives the following theorem.

Prove the Barratt–Priddy–Quillen–Segal theorem: the Segal spectrum of finite pointed sets under wedge (§4.24) and K(FinSet*), with injections as cofibrations and bijections as weak equivalences, are equivalent to the sphere spectrum. Identify the Segal Γ-space of FinSet* levelwise with n↦Γ⁺(n), GeneralizedCohomology G2.8's free Barratt–Eccles algebra on the based set n. Prove the Barratt–Eccles approximation Γ⁺(X)≃Ω∞Σ∞X for connected based X, so the prolongation at Sᵐ, m≥1, gives Ω∞Σ∞Sᵐ and the associated connective spectrum is S. The comparison with K(FinSet*) is degreewise: every Sₙ-object of FinSet* is isomorphic to a wedge filtration A₁⊂A₁∨A₂⊂⋯, and its automorphisms are the products of the symmetric groups of the successive complements, so the wedge functors (iso FinSet*)ⁿ→iSₙFinSet* are equivalences of groupoids and §2.23 identifies |iS•FinSet*| with the bar construction of B(iso FinSet*).

**Checks.**

- Finite pointed sets under wedge produce S. Unpointed finite sets have no zero object.
- kSpectrum of finite pointed sets is stably equivalent to the sphere spectrum, with π₀=ℤ generated by the two-point set.
- For finite-dimensional 𝔽_q-vector spaces, the object k↣k²↠k of iS₂A has automorphism group the Borel subgroup of GL₂(𝔽_q), of order (q−1)²q, while its image (k,k) in (iso A)² has automorphism group of order (q−1)², so the sum functor (iso A)²→iS₂A is not an equivalence of groupoids. For finite pointed sets the automorphisms of A⊂B are `Σ_A × Σ_(B∖A)` and the degreewise comparison holds.

(W IV Thm. 4.9.3 and Exercise 8.8; C §1.2, Example 4, p. 8; Barratt–Eccles, Γ⁺-structures I; Waldhausen, §1.8, for the comparison with Segal's construction; W IV Exercises 8.5–8.6 and Thm. 7.1, for the additive comparison through Q.)

*Needs:* §6.1, §6.2, §1.10, §2.23, §4.9, §4.24, GeneralizedCohomology G2.8, §5.5.

### Examples

The zero Waldhausen category assembles to the zero spectrum. Finite-dimensional vector spaces over a field recover their algebraic K₀ in degree zero. A mere sequence of realisations has no Ω-spectrum conclusion until the relative-S delooping equivalence is supplied.

### Dependencies

Layers 1–5 and local Waldhausen/additivity/relative-S targets; the spectrum comparisons and the Barratt–Priddy–Quillen–Segal theorem.

## Layer 7: Coefficients, completion and filtrations

### 7.1 Moore spectra S/m

For m≥1 define S/m as the derived cofiber of the stable degree-m map S→S, with triangle S→S→S/m→ΣS. It is connective, has π₀=ℤ/m and ordinary integral homology concentrated in degree zero. Every map ℤ/m→ℤ/m′ lifts to a spectrum map, uniquely if either modulus is odd; for two even moduli the indeterminacy is ℤ/gcd(2,m,m′). The extended carrier at m=0 is S∨ΣS, so its π₀ is ℤ but it also has H₁=ℤ; the positive-modulus homology assertion excludes this case. This also fixes the convention S/1=0.

- The cofibre triangle S→ᵐS→S/m→ΣS, allowing m=0 for the carrier.
- For m>0, H₀(S/m;ℤ)≅ℤ/m and all other H vanish.
- π₀(S/m)≅ℤ/m and negative π vanish.
- The triangle boundary S/m→ΣS.
- Every ℤ/m→ℤ/m′ lifts, without functorial choice; for m,m′>0 with m or m′ odd the lift is unique, and in general two lifts differ by an element of ℤ/gcd(2,m,m′).
- The lift induces the prescribed homomorphism under the π₀ comparisons.

Use GeneralizedCohomology G2.5’s Freudenthal theorem: for n-connected based CW X, n≥0, πᵢX→πᵢ₊₁ΣX is bijective for i≤2n and surjective for i=2n+1. Construct the stable Hopf class η and prove the first stable sphere stems: π₁S=ℤ/2 generated by η, π₂S=ℤ/2 generated by η². Use TangentialBordism B4.1's Steenrod squares with their naturality, suspension, Cartan, Adem and Sq¹=Bockstein laws, and B4.2's stable HF₂ operations; apply Sq² on CP² and Sq¹Sq²Sq¹=Sq²Sq² to prove the second stem of S/2: π₂(S/2)=ℤ/4, with twice a lift of η equal to the image of η². These supply the finite-coefficient and stable-range inputs, rather than assuming the first stems. (H AT, Cor. 4.24, p. 360, §4.L, pp. 487–517; S, I.1, pp. 12–13; II.6.48, pp. 287–288; II.10.11, 10.13, pp. 319–320.)

**Checks.**

- S/1 is a zero object of SHC.
- For m≥1 and n≥2, Hₖ(S/m;ℤ)=H̃ₖ₊ₙ₋₁(Sⁿ⁻¹∪ₘeⁿ;ℤ): both are ℤ/m in spectrum degree zero and zero elsewhere.
- 2·id_(S/2) ≠ 0 in SHC, so S/2 admits no unital multiplication.
- S/0=S∨ΣS has H₁=ℤ, so the positive-modulus homology clause fails at zero.
- η is nonzero but 2η=0 stably.
- twice a generator in π₂(S/2) is nonzero and four times it is zero.
- Sq² on the degree-two CP² generator is its nonzero square; squares above the input degree vanish.

(S II, Def. 6.33, p. 284; Construction 6.39, (6.41)–(6.42) and Thm. 6.43, pp. 285–286; Prop. 6.48 and (6.50), pp. 287–288; W IV Def. 2.1, p. IV.18.)

*Needs:* §5.7, §5.10, GeneralizedCohomology G2.2, G2.4, G2.5 and G2.7, TangentialBordism B4.1–B4.2.

### 7.2 Spectra with finite coefficients E/m

For every spectrum E, integer n and m≥1, define E/m as the derived multiplication cofiber and πₙ(E;ℤ/m)=πₙ(E/m). Construct the natural equivalence E/m≃E∧ᴸS/m, with triangle E→ᵐE→E/m→ΣE, using that derived smash preserves cofibers. For prime powers use GeneralizedCohomology G3.9's chosen degree-p representative and coherent powers. For a point-set presentation at fixed m, choose a bifibrant sphere model T and an endomorphism dₘ:T→T representing the stable class m. Smash this arrow with a flat replacement of E and take its homotopy cofiber by §5.7. For prime powers, represent G3.9’s chosen degree-p map on one such T and use actual powers dₚʳ, with strictly commuting squares (1,dₚ) and (dₚ,1); construct the comparison with the supplied coherent diagram before taking cofibers. The same replacement is used for every stage and both families of maps. Compare the resulting diagram in the stable localization with the derived smash diagram, preserving its maps and boundaries. Flat replacements compute derived smash; flatness alone does not supply a strict map m·id on the unreplaced E. Functoriality refers to this coherent construction, not to arbitrary choices of cones in the homotopy category. For an Ω-spectrum identify this with the colimit of space-level finite-coefficient groups [Pⁿ⁺ʳ(ℤ/m),Eᵣ] in the stable range. Construct the finite Moore duality D(S/m)≅Σ⁻¹S/m: Pᵈ represents Σᵈ⁻¹S/m, so the space-level degree is n+r, with no extra +1. The extended zero modulus remains E∨ΣE.

- The derived cofiber E/m with triangle E→ᵐE→E/m→ΣE.
- The natural equivalence E/m≃E∧ᴸS/m preserves the reduction and boundary maps of the derived triangles.
- For fixed m, an exact functor in E.
- πₙ(E;ℤ/m)=πₙ(E/m).
- π₀(HA/m)≅A/mA and π₁(HA/m)≅A[m].

**Checks.**

- For the raw symmetric sphere S=F₀S⁰, the only strict endomorphisms are zero and identity, whose cofibers have π₀=ℤ and 0. The derived degree-two cofiber has π₀=ℤ/2, so neither raw cone represents S/2. (S I §3.2, p. 51.)
- E/1 is a zero object.
- Hℤ/m≃H(ℤ/m).
- E/m≃E∧ᴸS/m, so π₀(S/m)≅ℤ/m.
- πₙ(E/m) is not πₙ(E)⊗ℤ/m in general: for E=ΣH(ℤ/2) and m=2, π₂(E/2)≅ℤ/2 (the torsion term) while π₂(E) ⊗ ℤ/2 = 0.

(W IV Def. 2.4 and Spectra 2.3.1, pp. IV.19–20; S II, Remark 6.51, p. 288.)

*Needs:* §7.1, §5.7, §5.10, GeneralizedCohomology G2.3, G2.6 and G3.9.

### 7.3 The Bockstein long exact sequence

Apply the homotopy long exact sequence to the smashed triangle, giving πₙE→mπₙE→πₙ(E/m)→βπₙ₋₁E→mπₙ₋₁E. Construct the Bockstein from the chosen triangle's connecting map, prove all consecutive composites zero and exactness, and establish naturality for spectrum maps and for specified maps of coefficient triangles. Every degree, including negative degrees, is covered.

(W IV 2.1.1 and Universal Coefficient Sequence 2.2, pp. IV.18–19; S I, Prop. 2.12, p. 27.)

*Needs:* §7.2, GeneralizedCohomology G2.4.

### 7.4 The universal coefficient sequence for mod-m homotopy

Extract the short exact sequence 0→πₙE/mπₙE→πₙ(E/m)→πₙ₋₁E[m]→0, with the quotient identified with πₙE⊗ℤ/m. The left map comes from E→E/m; the right is the Bockstein landing in the m-torsion subgroup. It need not split: π₂(S/2)=ℤ/4 is an extension of ℤ/2 by ℤ/2. In the shifted Eilenberg–Mac Lane example ΣH(ℤ/2) at n=2, the quotient term is zero and the torsion term is ℤ/2, which pins the one-degree shift.

(W IV Def. 2.1, 2.1.1, Universal Coefficient Sequence 2.2, Example 2.2.1, Prop. 2.3, 2.3.1, Def. 2.4, Thm. 2.5, Prop. 2.7, pp. IV.18–21; S II, Prop. 6.48, p. 287; S II, after (6.50), p. 288.)

*Needs:* §7.3, §7.1, M.

### 7.5 Peterson’s coefficient splitting

For m odd or 4 dividing m prove that the preceding coefficient short exact sequence splits for every spectrum and integer degree. Specify existence of a splitting, with no naturality assertion for chosen splittings. At m=2 the ℤ/4 example excludes the conclusion; at m=1 every coefficient term is zero. The positive-modulus theorem is distinct from the formal splitting of the extended zero cone.

(W IV after 2.1.1, p. IV.18; Universal Coefficient Sequence 2.2, p. IV.19.)

*Needs:* §7.4, §7.1.

### 7.6 Coprime decomposition of Moore spectra

For positive coprime q₁,q₂ construct the sum S/q₁∨S/q₂→S/(q₁q₂), with first inclusion multiplication by q₂ on π₀ and second by q₁, and prove it invertible. Smashing gives the product decomposition of coefficient π-groups, natural in E. For q₁=2,q₂=3 the two generators go to 3 and 2 modulo 6; this fixes the two inclusions, not just an unspecified Chinese-remainder isomorphism.

**Checks.**

- For moduli 2,3 the CRT inclusions send 1 to 3 and 2 modulo 6.

(W IV Prop. 2.7, p. IV.21.)

*Needs:* §7.1, §7.4, §7.2, §5.9.

### 7.7 Transition maps between Moore spectra and the mod-p^r tower

Fix prime p. Use GeneralizedCohomology G3.9's degree-p representative and coherent powers to define inclusions S/pʳ→S/pʳ⁺¹ and reductions ρᵣ:S/pʳ⁺¹→S/pʳ from the coherent squares (identity,p) and (p,identity) on the source and target of the multiplication arrows. Construct the common point-set presentation of §7.2 on the bifibrant sphere model T, with arrows dₚʳ and squares (1,dₚ) and (dₚ,1), and its comparison with the supplied coherent powers. Its functorial homotopy cofibers represent both diagrams and their composites; no strict degree-p map of the raw sphere is asserted. In SHC other fill-ins of the same squares can exist at p=2. Their Bocksteins satisfy δᵣ₊₁ιᵣ=δᵣ and δᵣρᵣ=pδᵣ₊₁. On the coefficient short exact sequence, inclusion acts by multiplication by p on the quotient and identity on torsion, while reduction acts by reduction on the quotient and multiplication by p on torsion. For p=2,r=1, inclusion sends 1 mod 2 to 2 mod 4 and reduction sends 1 mod 4 to 1 mod 2. Define the mod-p-power reduction tower as GeneralizedCohomology G3.9's tower (E/pʳ, (p,id)), whose homotopy limit is E^∧_p, and prove the natural equivalence of coherent towers E∧ᴸ(S/pʳ,ρᵣ)≃(E/pʳ,(p,id)), including its compatibility with the common point-set replacements and the Bockstein maps. Taking homotopy limits gives the comparison with E^∧_p; this does not assert that smash commutes with arbitrary homotopy limits. The harmless r=0 term is S/1=0.

- S/pʳ→S/pʳ⁺¹ induces multiplication by p.
- S/pʳ⁺¹→S/pʳ induces reduction.
- Inclusion is a triangle map with sphere components (1,p), so δ∘incl=δ.
- GeneralizedCohomology G3.9's inverse tower E/pʳ with transitions induced by (p,id).
- UCT transition: reduction on the quotient term, multiplication by p on the torsion term.

**Checks.**

- H₀(moore.incl p r) is multiplication by p : ZMod (p^r) → ZMod (p^(r+1)).
- H₀(moore.reduce p r) is the reduction ZMod (p^(r+1)) → ZMod (p^r).
- For E = HZ the tower is the tower of H(ℤ/p^r) with reduction maps.
- For p = 2 the lift of multiplication by 2 to moore 2 ⟶ moore 4 is not unique: two lifts differ by a map factoring through η.
- At p=2,r=1 inclusion sends 1 mod 2 to 2 mod 4; reduction sends 1 mod 4 to 1 mod 2.

(S II, Thm. 9.9(iii), p. 304; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.1, §7.2, GeneralizedCohomology G2.4 and G3.9.

### 7.8 ℚ_p/ℤ_p coefficients and their universal coefficient sequence

Form S/p∞ as the telescope of the inclusions, and identify its degree-zero homology with ℚₚ/ℤₚ. For every E show E∧ᴸS/p∞=hocolim E/pʳ and derive 0→πₙE⊗ℚₚ/ℤₚ→πₙ(E;ℚₚ/ℤₚ)→πₙ₋₁E{p}→0. Here A{p} is the union of its p-power torsion subgroups. When πₙ₊₁E is finite the tensor term in degree n+1 vanishes and gives the torsion identification. The colimit uses inclusion maps, rather than reduction maps.

(S II, §9.3, p. 303; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.7, GeneralizedCohomology G3.4 and G3.7, §7.4, §5.10, §7.2.

### 7.9 Countable abelian towers and comparison with spectral limits

Use DerivedModuleAlgebra §1.T.1 on main at R=ℤ for the countable tower limit, lim¹, natural six-term sequence, derived-limit comparison and Mittag–Leffler vanishing. For a coherent tower of spectra X, its integer homotopy groups form towers of integral modules. The map on πₖ of GeneralizedCohomology G3.8's derived-product difference map is the supplied `ModuleTower.shift`, namely δ(x)ᵣ=xᵣ−fᵣxᵣ₊₁. Identify its fibre long exact sequence with `0→lim¹πₖ₊₁Xᵣ→πₖholim X→limπₖXᵣ→0`. The injection is induced by the fibre triangle's boundary after passing to coker δ, and the projection is the compatible family of evaluation maps into ker δ. These identifications preserve the six-term connecting arrows for levelwise short exact sequences of homotopy-group towers; use the supplied integral-module/abelian-group comparisons throughout. Naturality is for coherent point-set maps or maps of the specified defining triangles.

**Comparison API:** the integral-tower difference map is an alias for `ModuleTower.shift` at R=ℤ, with `CompactCoefficients.Tower.shift` as its abelian-group presentation. the kernel comparison for the limit and the cokernel comparison for lim¹ are the supplied `Tower.limComparison` and `Tower.limOneComparison`, together with the spectral injection/projection identifications above. the six-term tower sequence and Mittag–Leffler vanishing are aliases for the supplied natural six-term sequence and Mittag–Leffler vanishing. They carry no independent tower carrier or algebraic construction. (Stacks, More on Algebra, Lemma 15.88.1, tag 07KW; Algebra, Lemma 10.86.4, tag 0598.)

**Checks.**

- The identity tower has limit A and lim¹=0.
- zero transition maps make the difference identity, so both groups are zero.
- surjectivity lets one solve the difference equation recursively and gives lim¹=0; multiplication by p on ℤ fails this hypothesis.
- For `0→pʳℤ→ℤ→ℤ/pʳ→0` with inclusion, identity and reduction transitions, the supplied connecting map ℤₚ→lim¹pʳℤ is surjective with kernel ℤ. The spectral and completion comparisons retain that map with its supplied normalization.
- The ℤ/p tower with zero transitions is Mittag–Leffler despite nonsurjective transitions; both its limit and lim¹ vanish, using the same supplied maps.

(S II, proof of Thm. 8.3, p. 297; S II, Lemma 5.6 and Remark 5.9, pp. 257–258; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* DerivedModuleAlgebra §1.T.1 on main, GeneralizedCohomology G3.8 and G2.6, M. Apply the supplied tower algebra to the homotopy-limit triangle.

### 7.10 A tower with nonzero lim¹

For prime p, identify the π₀ tower of the sphere tower with transition p·id with DerivedModuleAlgebra §1.T.1's multiplication-by-p tower. Specialize its the lim¹ comparison for multiplication by p: lim π₀=0 and lim¹π₀≅ℤₚ/ℤ, with (xₙ) sent to the class of ∑pⁿxₙ. The name the multiplication-tower lim¹ comparison denotes this supplied equivalence transported through the π₀ identification. Section 7.9's spectral Milnor comparison gives π₋₁holim≅ℤₚ/ℤ although every sphere term has π₋₁=0; no second convergent-sum construction is needed.

**Checks.**

- The π₀ identification sends the sphere unit to 1∈ℤ and the transition p·id to multiplication by p, fixing the sum normalization.
- At p=2, the nonintegral 2-adic number 1/3 gives a nonzero class in π₋₁holim; stagewise vanishing in degree −1 does not imply vanishing for holim.
- The identity of the sphere tower fixes every class in ℤₚ/ℤ. At p=3, levelwise multiplication by two induces multiplication by two and kills the nonzero class of 1/2∈ℤ₃, in agreement with the supplied natural lim¹ maps.

(S II, Remark 5.9, p. 258.)

*Needs:* §7.9, DerivedModuleAlgebra §1.T.1 on main (the lim¹ comparison for multiplication by p), M.

### 7.11 The completion extension and Tate module

Apply Milnor to §7.7's mod-p-power reduction tower, retaining the lim¹ term in πₙ(E∧ₚ). Taking the inverse limit of the coefficient short exact sequences gives 0→lim πₙE/pʳ→lim πₙ(E/pʳ)→Tₚπₙ₋₁E→0, with Tₚ the Tau Ceti `TauCeti.TateModule`; the quotient tower is surjective and has zero lim¹. Use §7.9's supplied natural six-term boundary and its Milnor injection/projection comparison for these very coefficient maps. If the degree-(n+1) coefficient groups are finite, the Milnor lim¹ term also vanishes. This identifies the Tate-module contribution and states exactly which finiteness hypothesis removes which derived-limit term.

(W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.9, GeneralizedCohomology G3.9, §7.4, §7.7.

### 7.12 General Moore spectra and their mapping sequence

For an abelian group A whose p-primary torsion is killed by some pᴺ, prove the bounded-torsion Ext comparison: Ext¹(ℤ/p∞,A) is naturally its ordinary p-adic completion lim_r A/pʳA. The torsion tower has pro-zero transition maps, so its lim¹ vanishes; the individual finite-modulus Ext groups need not vanish. For arbitrary abelian A construct a general Moore spectrum for A from a free presentation, connective with H₀=A and other integral homology zero. Prove the mapping universal coefficient sequence for a general Moore spectrum: 0→Ext¹(A,π₁X)→[generalMoore A,X]→Hom(A,π₀X)→0. Compare this UCT, after shift for the Prüfer group, with GeneralizedCohomology G3.9’s Hom/Ext completion sequence; no functorial choice for all A is asserted. (S, Constr. II.6.39, Eq. (6.42), Thm. 6.43, pp. 285–286.)

**Checks.**

- A=0 gives zero.
- A=ℤ gives S; the Ext term vanishes.
- For A=ℤ/2 and X=S/2 the Ext term is nonzero, so π₀ does not determine the spectrum map uniquely.

(S II, Thm. 9.9(iv), (9.10), p. 304.)

*Needs:* GeneralizedCohomology G3.9, §7.8, §7.1.

### 7.13 Completion for finitely generated homotopy

If πₖE and πₖ₋₁E are finitely generated, identify πₖ(E∧ₚ) with πₖE⊗ℤₚ, naturally and compatibly with the unit. Prove the algebraic completion–tensor comparison for finitely generated abelian groups and the comparison between Mathlib's adic completion of ℤ at (p) and PadicInt p. For a shifted H(ℚₚ/ℤₚ), the Tate module (`TauCeti.TateModule`) survives and excludes the same formula without finite generation. Name the integral completion comparison: AdicCompletion((p),ℤ)≃+*ℤₚ for prime p, characterized by all residue projections. Construct it from Mathlib’s `PadicInt.toZModPow`, `PadicInt.lift`, `PadicInt.lift_spec` and `PadicInt.lift_unique`, with inverse given by compatible residues. The finite-group summand is retained, so ℤ/p completes to ℤ/p, whereas a finite ℓ-group for ℓ≠p completes to zero.

**Checks.**

- Every residue projection sends the completed integer 1 to 1.
- completion preserves ℤ/p.
- completion of ℤ/ℓ is zero for distinct primes ℓ,p.

(S II, Thm. 9.9(iv), p. 304; W IV 2.9, p. IV.22; S II, Remark 9.12 and the following paragraph, p. 306.)

*Needs:* §7.12, M.

### 7.14 Criteria for p-completeness

Use GeneralizedCohomology G3.9’s sphere localization S[1/p] and derived completion. Compare the supplied criterion F(S[1/p],E)=0 with vanishing of the homotopy limit of the multiplication-by-p E tower. These are predicates on the specified unit and the specified multiplication maps. Hℚ is nonzero and killed by completion, so it is not p-complete; H(ℤ/p) is complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* GeneralizedCohomology G3.9, §7.9, GeneralizedCohomology G3.4 and G3.7, §7.8, GeneralizedCohomology G3.8, §5.10.

### 7.15 Closure properties of complete spectra

Prove closure of p-complete spectra under fibres, cofibres, retracts, arbitrary products and coherent homotopy limits of countable towers. Use the internal-Hom vanishing criterion and exactness. Do not infer closure under arbitrary coproducts: infinite sums of complete abelian groups need not be derived complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §5.10, GeneralizedCohomology G2.4 and G3.8.

### 7.16 Mod-p equivalence detects equivalences of complete spectra

For maps between p-complete spectra prove that invertibility is detected by derived smash with S/p. Use the fibre, the closure theorem and the completeness criterion to show a complete fibre with zero mod-p reduction is zero. Without completeness a rational spectrum has zero mod-p reduction while remaining nonzero, so the hypothesis cannot be omitted.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §7.15, §7.2, GeneralizedCohomology G3.8, GeneralizedCohomology G2.4.

### 7.17 Bounded p-power exponent implies completeness

Prove completeness under degreewise exponent bounds: if for every integer k some pᴺ⁽ᵏ⁾ kills πₖE, then E is p-complete by the multiplication-tower criterion. Both the inverse limit and lim¹ vanish in every degree because each homotopy-group tower is pro-zero. The specialization completeness under a uniform exponent bound uses one fixed pᴺ killing all π-groups. N=0 forces E=0. Keep the prime hypothesis in the signatures and distinguish bounded torsion from general unbounded p-primary torsion.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §7.9.

### 7.18 Prime-power coefficient spectra are complete

Show E/pʳ is p-complete for every E and r≥1. The coefficient extension implies that p²ʳ kills each homotopy group, enough for the bounded-exponent theorem. It does not imply pʳ kills them: π₂(S/2)=ℤ/4 (§7.1's order-four Check for π₂(S/2)) is the negative control. The r=0 extended term is zero and is also complete.

**Checks.**

- For E=Hℚ, E/pʳ=0, which is complete, although Hℚ itself is not p-complete; completeness of E/pʳ does not pass back to E.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.17, §7.4, §7.2.

### 7.19 Rational spectra are generalized Eilenberg–Mac Lane spectra

Use GeneralizedCohomology G5.6’s rational stable-stem vanishing, Sℚ≃Hℚ and stable rational Hurewicz comparison. For graded rational vector spaces V define HV=∏ₙΣⁿHVₙ and prove [A,HV]≅Hom_gr(π*A,V) for every A. Deduce the equivalence of rational spectra with graded ℚ-vector spaces, with the unique identity-on-homotopy map E→Hπ*E. The product includes all integer degrees, so no connectivity assumption is hidden.

- A rational E≅∏ₖΣᵏH(πₖE).
- Eℚ≅Hℚ∧ᴸE.

**Checks.**

- zero in every graded degree gives the zero spectrum.
- V₀=V₂=ℚ and other Vₙ=0 gives Hℚ∨Σ²Hℚ, retaining both groups.
- V₋₂=ℚ alone gives Σ⁻²Hℚ, with nonzero π₋₂; an indexing set of natural numbers would lose it.
- rationalization sphere ≅ eilenbergMacLane ℚ.

(S II, Thm. 9.6, p. 302; S I, Thm. 1.9, p. 12.)

*Needs:* GeneralizedCohomology G3.9 and G5.6, GeneralizedCohomology G2.7, GeneralizedCohomology G3.8, §5.10, GeneralizedCohomology G2.4.

### 7.20 The arithmetic fracture square

For every E the arithmetic fracture square, with vertices E, ∏ₚE∧ₚ, Eℚ and (∏ₚE∧ₚ)ℚ, is BordismFormalGroups F6.5's homotopy-cartesian square for all spectra using derived p-completion. The additions here are the distinguished triangle E→Eℚ⊕∏ₚE∧ₚ→(∏ₚE∧ₚ)ℚ→ΣE, whose first arrow is the pair of units and whose second is the difference of the two maps to the rationalised product, and the function-spectrum comparison F(cofib(S→Sℚ),ΣE)≅∏ₚE∧ₚ. Rationalisation stays outside the product: ℚ⊗∏ℤₚ and ∏ℚₚ are different. **Check the fracture-square difference map:** on the completed and rational units of Hℤ the two images of 1 have difference 1−1=0. The difference on (2,1) is +1 and on (1,2) is −1; a sum map would not give a complex. The finite-type homotopy corollary uses the preceding finite-generation theorem in each relevant degree.

(S II, Thm. 9.9(i)–(ii) and the following paragraph, p. 304.)

*Needs:* BordismFormalGroups F6.5, GeneralizedCohomology G2.4, G3.8, G3.9 and G5.6, §7.13, §5.10, §7.8.

### 7.21 Filtered spectra, towers and their associated graded

A filtered spectrum is a coherent point-set diagram ℤ→Sp, localised at objectwise stable equivalences. Define grₛ by derived cofibre Xₛ₋₁→Xₛ, and build functorial replacements and all relative-cofibre comparisons needed by the spectral object. With a coherent augmentation to E, define exhaustiveness by hocolim X→E being an equivalence, bounded-below by eventual zero on the negative end, and completeness by holim on that end being zero. Identify exhaustiveness with the compatible homotopy-group criterion. The SHC-valued diagram is a consequence of this input, not a substitute for its coherence. Name replacement of filtered spectra for functorial objectwise replacement and the relative-cofiber spectral object for all interval cofibres and connecting maps; coherent commuting cubes prove its exactness and octahedral identities.

- A coherent integer filtration, represented by ℤ→SymmSpectrum.
- gr_s=cofib(X_s₋₁→X_s), with its triangle.
- The filtered hocolim-to-target map is invertible.
- The negative-direction holim is zero.
- X_s=0 for all sufficiently negative s.
- Coherent relative cofibres form a spectral object, satisfying all identities and invariant under replacement.

**Checks.**

- The constant filtration X s = X has gr = 0 and is exhaustive but not complete (unless X = 0).
- For the Whitehead filtration `X_s = τ_{≥−s}X`, `gr_s ≅ Σ^{−s}H(π_{−s}X)`.
- toSpectralObject followed by pi_0 (Mathlib mapHomologicalFunctor) is an abelian spectral object whose E₁ terms are pi of gr.
- The zero filtration of nonzero E is complete but not exhaustive. The constant E filtration is exhaustive but not complete.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* GeneralizedCohomology G2.1–G2.6, G3.4, G3.7 and G3.8, §5.7.

### 7.22 Exact couples and their derived couples

Define a bigraded exact couple in any abelian category: D→iD→jE→kD, of degrees a,b,c and exact at each vertex. Construct its derived couple with D′=image i, E′=H(E,jk), and degrees a,b−a,c; iterate to the pages. In the homological convention a=(1,−1),b=(0,0),c=(−1,0), dᵣ has degree (−r,r−1), lowering total degree by one. In the two-column case δₙ:E₁,ₙ→E₀,ₙ and 0→coker δₙ→D₁,ₙ₋₁→ker δₙ₋₁→0 fix the extension indexing. Exactness imposes ji=kj=ik=0; it does not impose i²=0. For D=E=ℤ², i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) gives an exact couple with i²=i≠0.

- Bigraded D,E and maps i,j,k of degrees a,b,c, exact at all three vertices.
- D′=im i, E′=ker(jk)/im(jk); j-degree becomes b−a.
- Page r≥1 is E of the (r−1)-derived couple; d_r has degree c+b−(r−1)a.
- For a=(1,−1),b=(0,0),c=(−1,0), d_r has degree (−r,r−1).
- δ_n=k then j: E_(1,n)→E_(0,n), i.e. πₙ₊₁gr₁→πₙX₀.
- If negative D-columns vanish, coker δ_n→D_(1,n−1).
- Under that hypothesis, D_(1,n−1)→ker δ_n₋₁.
- The displayed cokernel–D–kernel complex is short exact, without a splitting assertion.

**Checks.**

- For any bidegrees and an exact couple with every E(p,q) zero, every i(p,q) is an isomorphism and every page at every bidegree is zero.
- With D=0 for p<0 and E supported in columns 0,1, pages r≥2 equal E². The abutment is the unsplit extension 0→coker δₙ→D(1,n−1)→ker δₙ₋₁→0; for X₀→X₁=X use δ:πₙ₊₁gr₁→πₙX₀.
- The constant tuple couple i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) is exact. (j∘k)(x,y)=(y,0), so (j∘k)(0,1)=(1,0)≠0 while (j∘k)²=0; i²=i and i²(1,0)=(1,0). The exactness composites j∘i, k∘j and i∘k do vanish.

(Boardman §0, pp. 2–4: unrolled exact couples and derived pages. Extend the abelian-group argument to an arbitrary abelian category using kernels, images and cokernels; compare it with the spectral-object construction in §7.23.)

*Needs:* M.

### 7.23 The spectral sequence of a filtered spectrum

Construct the filtration spectral object and apply the homological π-functor to obtain E¹ₛ,ₜ=πₛ₊ₜgrₛ and dᵣ:(s,t)→(s−r,t+r−1), natural in coherent maps. Identify it with the derived exact-couple pages and with Mathlib's spectral-object pages, whose core starts at page two. Use endpoints p−r,p−1,p,p+r−1 and cochain degree −(p+q). The candidate abutment is π*hocolim X with filtration image(πₙXₛ→πₙhocolim X); convergence is a further theorem.

- The spectral sequence with E¹_s,t=π_s₊t(gr_s).
- The E¹ identification sends d₁ to the composite through ΣX_s₋₁→Σgr_s₋₁.
- A strict filtered-model transformation gives a spectral-sequence map, invariant under stable replacement.
- The image filtration F_sπₙE=im(πₙX_s→πₙE) for an exhaustive target cocone.
- D_s,t=π_s₊tX_s; E_s,t=π_s₊tgr_s, with degrees (1,−1),(0,0),(−1,0).
- The homological core uses deg(p,q)=−p−q and indices p−r,p−1,p,p+r−1, giving d_r:(p,q)→(p−r,q+r−1).

**Checks.**

- For the zero filtered spectrum all pages vanish.
- For X concentrated in one filtration step, E¹ = E^∞ = π_* of that step.
- The spectral sequence agrees with that of the exact couple (§7.22).
- The constant nonzero filtration has E¹=0 and nonzero colimit π. It is exhaustive but not bounded below, so its zero pages do not compute the abutment.

(HA §1.2.2, Construction 1.2.2.6 and Proposition 1.2.2.7, p. 49, and Definition 1.2.2.9, p. 52; W IV Exercise 3.7, p. IV.34.)

*Needs:* §7.21, §7.22, GeneralizedCohomology G2.4, M.

### 7.24 Convergence for exhaustive filtrations bounded below

For an exhaustive filtration bounded below, prove strong convergence to π*E and E∞ₛ,ₜ=Fₛπₛ₊ₜ/Fₛ₋₁πₛ₊ₜ. The filtration on each homotopy group is exhaustive and zero sufficiently far left, and the exiting differentials eventually vanish at each position. A finite filtration gives collapse at a finite page. No connective hypothesis on E is required for this homological, bounded-below filtration theorem.

(HA §1.2.2, Prop. 1.2.2.14 and proof, pp. 52–53.)

*Needs:* §7.23, GeneralizedCohomology G3.4 and G3.7, GeneralizedCohomology G3.8.

### 7.25 Convergence for towers with fibres of increasing connectivity

For a tower Y indexed by s≥0, set F₀=Y₀ and Fₛ=fib(Yₛ→Yₛ₋₁), and L=holim Y. Use Xᵢ=fib(L→Y₋ᵢ₋₁), extending Yₛ=0 for s<0; then gr₋ₛX≅Fₛ. This gives E¹ₛ,ₜ=πₜ₋ₛFₛ and dᵣ:(s,t)→(s+r,t+r−1). If the fibres' connectivity tends uniformly to infinity in each fixed degree, prove Milnor lim¹ vanishes and strong convergence to π*L. For a tower under E, identify E→L as an equivalence exactly when holim fib(E→Yₛ)=0. A bare reversal Y₋ᵢ instead has colimit zero and the wrong graded shift.

**Checks.**

- At (s,t)=(0,2), d₁ lands in (1,2), changing homotopy degree 2 to 1. In general (t+r−1)−(s+r)=t−s−1.

(S II, proof of Thm. 8.3, p. 297.)

*Needs:* §7.23, §7.9, §7.24, GeneralizedCohomology G3.8.

### 7.26 Conditional and strong convergence for complete towers (Boardman)

Use Boardman’s indexing i:Aˢ⁺¹→Aˢ. Put A⁺=limₛ Aˢ, RA⁺=lim¹ₛ Aˢ and A⁻=colimₛ→−∞ Aˢ. Define Zʳ as the r-cycle groups, RE∞=lim¹ʳZʳ, K∞Aˢ=ker(Aˢ→A⁻), and W=colimₛ lim¹ʳ(K∞Aˢ∩im(Aˢ⁺ʳ→Aˢ)). Conditional convergence to A⁻ requires A⁺=RA⁺=0; conditional convergence to A⁺ requires A⁻=0. For the complete tower above with a half-plane of entering differentials, conditional convergence and RE∞=0 imply strong convergence. Finite first-page groups ensure the cycle towers are Mittag–Leffler. For a whole-plane sequence require W=0 as well. Register the conversion to the increasing homological indexing of §7.24; completeness and page stabilisation do not replace these hypotheses.

**Checks.**

- The zero exact couple has A⁺=RA⁺=A⁻=RE∞=W=0 and converges to zero.
- The exact couple with D=ℤ, i=id and E=0 has zero pages and RE∞=W=0, but A⁺=A⁻=ℤ. It fails either conditional-convergence hypothesis; zero pages do not force a zero target.
- In each finite first-page group the descending cycle subgroups eventually stabilise, giving RE∞=0. This supplies that obstruction’s vanishing and does not remove the separate conditional-convergence or whole-plane W assumptions.

(S II, proof of Thm. 8.3, p. 297; Boardman, Def. 5.10, p. 19; Thm. 7.1, p. 20; Thm. 8.2, p. 24; Eq. (8.7), p. 25.)

*Needs:* §7.25, §7.9, GeneralizedCohomology G3.8.

### 7.27 The Atiyah–Hirzebruch spectral sequence

For any spectrum E and CW complex X, use the skeletal coherent filtration of E∧ᴸΣ∞₊X. Prove E²ₚ,q=Hₚ(X;π_qE), with dᵣ of the homological degree above, and strong convergence to πₚ₊q(E∧ᴸΣ∞₊X), by the bounded-below exhaustive filtration theorem. Finite dimensionality of X or bounded-below E makes each total-degree diagonal finite. For X=BG the coefficient calculation is the group-homology comparison of Layer 1; for E=HA it reduces to cellular/singular homology. The analogous cohomological sequence has separate convergence conditions.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* §7.23, §7.24, GeneralizedCohomology G2.2 and G2.5, §5.10, §1.32, AlgebraicTopology 4.3, GeneralizedCohomology G3.4 and G3.7.

### 7.28 Products on mod-ℓ^ν homotopy

For prime powers pʳ outside {2,3,4,8}, construct a homotopy associative and commutative unital Moore multiplication and the graded-commutative ring for a homotopy associative and commutative E. At 4 and 8 construct the Araki–Toda unital multiplication, using that 4 and 8 annihilate the identities of S/4 and S/8. Record the distinctions at the exceptions: S/2 has no unital multiplication; S/3 has no homotopy associative multiplication; the Araki–Toda choice at 4 need not be associative and at 4 or 8 need not be commutative. Existence of another associative product on S/4 and the E₁ product on S/8 are compatible with these distinctions.

(W IV Thm. 2.8, p. IV.21; Bu Introduction, p. 1.)

*Needs:* §7.1, §5.11, GeneralizedCohomology G2.4.

### 7.29 Graded and filtered Eₙ-algebras and the quotient obstruction tower

Work in a stable, presentably Eₘ-monoidal ∞-category C, m≥2, with compact generators. Use §5.13's abstract Eₙ-algebra interfaces and BordismFormalGroups F6.5's Day convolution, Ind and operadic Kan extensions. Here Eₘ is the ∞-operad of §5.13's little-m-cubes operad. Construct graded objects C^Gr and filtered objects C^Fil with Day convolution, the shift τ:X(1)→X, the associated graded functor as the cofibre of τ, and τ-inversion. In §§7.29–7.31 the letter τ always denotes the shift map of the category at hand: filtered objects here, Def(C;𝒬) in §7.30 and Syn_HF₂ in §7.31. All of these are Eₘ-monoidal. Positively graded means zero in negative degrees with the unit in degree zero.

For n≤m construct the Eₙ bar–cobar adjunction on augmented graded algebras and coalgebras (HA §5.2.3) and prove the graded bar/cobar equivalence: it is an equivalence on positively graded objects. Write `D^c_(Eₙ,k)(Y)` for the limit of the k-fold tensor powers of Y over Eₙ(k)_(hΣₖ). Construct the cofree positively graded Eₙ-coalgebra with underlying object `∏ₖ D^c_(Eₙ,k)(Y)`, and the cell filtration of a positively graded Eₙ-algebra R whose k-th cells are `Σ^(−1−n) Bar(R)ₖ`. For the unordered configuration space of k points in ℝⁿ, a model of Eₙ(k)_(hΣₖ), construct a finite cell filtration with cells in dimensions 0 to (n−1)(k−1). Deduce the configuration-space resolution: a finite filtration of `D^c_(Eₙ,k)(Y)` with graded pieces `Σ^(−c) Y^⊗k`, 0≤c≤(n−1)(k−1).

Prove the quotient obstruction tower for a map r:X→1. It gives obstructions `θₖ ∈ [Σ^(−2−n) D^c_(Eₙ,k)(Σ^(n+1)X), 1/r]` for k≥2, each defined after nullhomotopies of the earlier ones are chosen. Their vanishing builds filtered Eₙ-algebras attached along the displayed cells, and τ-inversion gives an Eₙ-structure on 1/r. If every group `[Σ^(−1−n) D^c_(Eₙ,k)(Σ^(n+1)X), 1/r]` vanishes, the construction produces at most one structure. the refined quotient obstruction tower splits θₖ into `θ_(k,α) ∈ [Σ^(−2−n−c_α)(Σ^(n+1)X)^⊗k, 1/r]`, 0≤c_α≤(n−1)(k−1). the quotient-map obstruction gives the analogous obstructions γ_(k,α), k≥1, to an Eₙ-map from the constructed quotient to an Eₙ-algebra on another quotient. It identifies γ₁ with the composite of the attaching map with the quotient map. Write Q₁(r) for the obstruction θ₂ at n=1, an element of [ΣX^⊗2, 1/r]. the unital quotient obstruction: if Q₁(r) vanishes, then 1/r has a unital multiplication.

**Checks.**

- For n=1 the space E₁(k)_(hΣₖ) is a point, so θₖ lies in the single group `[Σ^(−3)(Σ²X)^⊗k, 1/r]`.
- For n=k=2 the unordered configuration space of two points in ℝ² is equivalent to a circle, with cells in dimensions 0 and 1=(n−1)(k−1). On an even sphere these are the square class and the top Dyer–Lashof operation class of the free E₂-algebra.
- For r=2:S→S in spectra, Q₁(2)≠0 because S/2 has no unital multiplication (§7.1). For odd p the obstruction group `[S¹, S/p] = π₁(S/p)` vanishes, so S/p has a unital multiplication also at p=3, where §7.28's exception concerns associativity.

(Bu §2, Lemmas 2.2–2.3, Prop. 2.4, Remark 2.5, Lemma 2.6 with footnote 8, Cor. 2.7 and Remark 2.8, pp. 4–6; Conventions (5)–(8), p. 3; proof of Thm. 5.2, pp. 10–11; proof of Lemma 5.4, p. 11; Appendix A, Recollection A.5 and Thm. A.6, p. 13, Lemma A.19, Construction A.20 and Lemma A.21, pp. 18–19; HA §5.2.3.)

*Needs:* §5.13, §7.1, BordismFormalGroups F6.5.

### 7.30 The deformation Def(C;𝒬) of a quotient

Let C be stable and stably Eₘ-monoidal, m≥2, with v:I→1 such that `1/v = cofib(v)` has a right unital multiplication. First replace C by Ind(C′), where C′ is generated by 1 and I under tensor products and finite (co)limits. This Ind(C′) is presentable and Eₘ-monoidal, and its functor to C is fully faithful on C′. Let the quotient-split epimorphism class 𝒬 be the maps of compact objects that become split epimorphisms after tensoring with 1/v. Prove that every 1/v⊗X is 𝒬-injective, that X→1/v⊗X is 𝒬-monic, that compact objects have enough 𝒬-injectives and that 𝒬 is ⊗-compatible.

Construct the perfect derived ∞-category D^ω(C^ω;𝒬) as perfect sheaves for the 𝒬-epimorphism topology, with ν, the shift [1], τ and τ-inversion. Prove the seven properties of Bu Recollection 4.1: finite (co)limits; ν fully faithful; generation by ν under finite colimits; ν preserving cofibre sequences whose second map is in 𝒬; `ν(−)[1] ≃ ν(Σ−)`; τ-inversion as localization at τ; and `[Σ^(−s)νX, νJ] = 0` for s>0 and 𝒬-injective J. Construct its exact Eₘ-monoidal structure with ν and τ-inversion Eₘ-monoidal, and the deformation category Def(C;𝒬) as its Ind-completion. The cofibre sequence `ν1 → ν(1/v) → ν(ΣI)` exists because 1→1/v splits after tensoring with 1/v. Its boundary is the lifted deformation map `ṽ : Σ^(−1)νI[1] → ν1`. Prove the deformation-quotient vanishing theorem: `[Σ^(−s)νX, ν1/ṽ^q] = 0` for compact X and s≥q, by induction on q. Define the v-compatibility condition: an Eₙ-structure on 1/v^q is v-compatible if it is equivalent to the τ-inversion of an Eₙ-structure on ν1/ṽ^q.

**Checks.**

- At q=1, ν1/ṽ≃ν(1/v), so the vanishing estimate is the 𝒬-injectivity of ν(1/v).
- τ-inversion carries ṽ to v and ν1/ṽ^q to 1/v^q.
- For C=Sp and v=p odd, S/p has a right unital multiplication but no E₁-structure, so the construction uses only the right unital multiplication. At v=2 the hypothesis fails (§7.1's nonexistence of a unital product on S/2), while v=4 satisfies it because S/4 has §7.28's unital multiplication.

(Bu Remark 1.6, p. 2; Introduction, p. 1; §4, Recollection 4.1 to Lemma 4.8, pp. 8–10; Def. 5.1, p. 10; Remark 5.7, p. 12; PP Def. 5.32 and Prop. 5.34, p. 54; Lemmas 5.67–5.68 and Prop. 5.69, pp. 64–65; Remark 5.65, p. 64.)

*Needs:* §7.29, §5.13, §7.1, §7.28, BordismFormalGroups F6.5.

### 7.31 HF₂-synthetic spectra and the vanishing line of C(2̃^q)

Construct the HF₂-site extension of EllipticCohomology E4.A's MU-synthetic category. Choose a universe-controlled small enriched model of finite spectra, with derived Kan mapping spaces. Every finite spectrum has finite-dimensional mod-2 homology, hence is HF₂-projective; finite sums, smash products, retracts and Spanier–Whitehead duals stay in this category. Covers are maps surjective on mod-2 homology. Prove closure of covers under composition, pullback and smash, with finite HF₂-projective pullbacks, and invariance under equivalences. Prove that HF₂ is Adams-type using a filtered presentation by finite spectra and the universal coefficient isomorphism over the graded field 𝔽₂. (Pst Defs. 3.13–3.14, Example 3.15, p. 34, and Prop. 3.23, p. 36.)

Adapt E4.A’s enriched-presheaf construction to this site and prove that localization at finite-sum-to-product and Čech-descent maps exists and has the universal property of spherical sheafification. Define the resulting category of spherical sheaves of spectra, denoted Syn_HF₂. Prove that it is presentable and stable, that derived Day tensor descends to it and preserves colimits in each variable, and that the construction is independent of the chosen enriched model. Keep ordinary descent distinct from hypercompletion. These are HF₂-site extensions, with their localization and tensor hypotheses discharged here. (Pst Thm. 2.2, Prop. 2.5 and Cor. 2.7, pp. 11–13, Prop. 2.13, p. 16, Prop. 2.30, p. 19, Def. 4.1 and Prop. 4.2, pp. 38–39.)

Define ν:Sp→Syn_HF₂ as the sheafification of P↦τ≥₀F(P,X). Construct its lax symmetric monoidal structure and prove preservation of filtered colimits. Since every spectrum is a filtered colimit of finite HF₂-projectives, prove that ν is strongly symmetric monoidal. Define the bigraded spheres by `S^(k,s) = Σ^(−s) ν(S^(k+s))`, so π_(k,s) is BHS's π_(k,k+s). For any cofiber sequence F→Y→X, prove that νF→νY→νX is a cofiber sequence if and only if 0→H_*(F;𝔽₂)→H_*(Y;𝔽₂)→H_*(X;𝔽₂)→0 is short exact. (Pst Def. 4.3 and Lemma 4.4, p. 39, Lemmas 4.23–4.24, pp. 43–44.)

Construct τ:S^(0,−1)→S^(0,0) from the suspension–loop comparison, its cofiber Cτ with the commutative algebra structure compatible with the unit, and the symmetric monoidal localization τ⁻¹:Syn_HF₂→Sp. Prove that its fully faithful right adjoint identifies Sp with the τ-invertible objects and that τ⁻¹νX≃X for every spectrum X. (Pst Def. 4.27 and Prop. 4.28, p. 45, Cor. 4.30, p. 46, Thm. 4.37 and Prop. 4.40, pp. 48–49.) Prove BHS Theorem 9.19 comparing π_(*,*)νX with TangentialBordism B4.2's mod-2 Adams spectral sequence, for HF₂-nilpotent complete X with strongly convergent spectral sequence.

- For every spherical sheaf F, F(P⊕Q)≃F(P)×F(Q) and F(0)=0; sheafification inverts the Čech descent maps of the specified covers.
- Tensoring the images of finite spectra P and Q gives ν(P∧Q); the unit is νS. The same comparison holds for arbitrary spectra by filtered colimits.
- The cofiber comparison preserves the specified maps and connecting morphism whenever the homology sequence is short exact.
- τ-inversion preserves the unit, tensor, cofibers and the quotient maps used below; it sends Cτ to zero.

Let 2̃∈π_(0,1)S^(0,0), with τ2̃=ν(2), be the boundary of the cofibre sequence νS→ν(S/2)→ν(S¹). Define the synthetic Moore quotient at exponent q as `C(2̃^q) = cofib(2̃^q : S^(0,q) → S^(0,0))`. Define vanishing lines of slope m and intercept c and prove BHS's cofibre lemma and Prop. 11.6 at torsion level zero. Prove the mod-2 Moore Adams vanishing theorem, Adams's vanishing line for the mod-2 Moore spectrum: on TangentialBordism B4.2's E₂-page, `Ext_A^(s,t)(H*(S/2),F₂) = 0 for s > (t−s)/2 + 1`, by Adams's periodicity argument applied to the two-cell A-module H*(S/2). By Prop. 11.6 this gives the base line `π_(k,s) C(2̃) = 0 for s > k/2 + 1`, with k the stem. Then prove the synthetic Moore-quotient vanishing theorem of §7.31: `π_(k,s) C(2̃^q) = 0 for s > k/2 + q`, by induction on q along `Σ^(0,1)C(2̃^(q−1)) → C(2̃^q) → C(2̃)`.

**Checks.**

- The HF₂ homology of S/2 is 𝔽₂ in degrees 0 and 1, so S/2 belongs to this site; MU_*(S/2)=MU_*/2 is not projective over the torsion-free ring MU_*, so it does not belong to the MU-projective site.
- The identity S→S is a cover, while 2:S→S is not: their mod-2 homology maps are 1 and 0. The cover S∨S→S given by the fold has kernel 𝔽₂ in degree zero, and its fiber is S.
- At the zero object ν0=0 and ν0⊗νS=0; at the unit νS⊗νS≃νS. The split cofiber sequence S→S∨S→S gives 0→𝔽₂→𝔽₂²→𝔽₂→0, which ν preserves.
- τ-inversion sends S^(k,s) to S^k: S^(0,−1) and S^(0,0) both go to S, and τ goes to the identity, so Cτ goes to zero.
- νS→ν(S/2)→ν(S¹) is a cofibre sequence, so ν(S/2)≃C(2̃). Applying ν to S→S→S/2, with first map multiplication by 2, does not give a cofibre sequence, since 2 is zero on mod-2 homology.
- τ⁻¹C(2̃^q)≃S/2^q for every q≥1.
- 2̃^s∈π_(0,s)S^(0,0) is nonzero for every s, since τ^s·2̃^s=ν(2^s) inverts to 2^s≠0. The sphere has no vanishing line of slope ½, so the Moore quotient is needed.
- In stem 0 the E₂-page of S/2 is F₂ in filtration 0 and zero above, since h₀ annihilates the bottom class when Sq¹ is nonzero on H*(S/2); this matches π₀(S/2)=ℤ/2.
- π₂(S/2)=ℤ/4 is detected by h₁ on the top cell in filtration 1 and by h₁² on the bottom cell in filtration 2; the second class lies on the line s=k/2+1, so the intercept 1 cannot be lowered.
- π₁(S/2)=ℤ/2 is detected by h₁ on the bottom cell in filtration 1, below the line.

(Pst Def. 3.14 and Example 3.15, p. 34, Lemma 4.23, p. 43, and Lemma 4.24, p. 44; BHS Construction 9.3 to Thm. 9.12, pp. 32–33, Thm. 9.19, p. 36, Def. 11.2 and Prop. 11.6, p. 45, Lemma 11.11, p. 47, Def. 13.6, p. 54, Notation 15.3 and Prop. 15.8 (row C(2̃), clause (4) of Def. 13.6), pp. 67–68; Adams 1966, Thm. 2.1, for the E₂ vanishing line of S/2, as quoted in the proof of BHS Lemma 14.21, p. 64; Bu Convention (10), p. 3, footnotes 9–10, p. 7, Lemma 3.3, p. 8.)

*Needs:* §5.13, §7.1, §7.7, EllipticCohomology E4.A, BordismFormalGroups F6.5, TangentialBordism B4.2.

### 7.32 Burklund's towers of E_n-algebra quotients

In a stable, stably Eₘ-monoidal ∞-category, m≥2, fix v:I→1 such that cofib(v) admits a right unital multiplication. Construct the v-compatible structures of §7.30 on 1/vᑫ as Eₙ-algebras for n≤m and q>n, with the reduction tower of Eₙ-algebra maps for q≥n+1. Apply §7.29's obstruction tower to ṽ^q in Def(C;𝒬). The obstruction groups vanish by the deformation-quotient vanishing theorem, since q≥n+1. The tower maps and the uniqueness use §7.29's map obstructions. When the two exponents agree, the nullhomotopy of γ₁ given by the defining cofibre sequence yields an equivalence of Eₙ-algebras. Prove uniqueness up to equivalence among v-compatible structures, not among every possible Eₙ structure on the carrier.

(Bu Thm. 1.5, p. 2; Bu Thm. 5.2 with proof, pp. 10–11; Bu Remark 5.7, p. 12.)

*Needs:* §7.1, §5.13, §5.18, §7.7, §7.29, §7.30.

### 7.33 Browder’s mod-coefficient products

For a homotopy associative and commutative ring spectrum E with πₖE=0 in negative degrees and in positive even degrees, and with η·1=0 in π₁E, prove homotopy associative and commutative products on E/pʳ for every prime power pʳ∉{3,4}, including the exceptional Moore moduli 2 and 8, and homotopy commutative unital products on E/3 and E/4. At modulus 3 prove homotopy associativity under the additional hypothesis i(α₁·1)=0 in π₃(E/3), where α₁ generates the 3-primary part of π₃S and i:E→E/3 is reduction; since π₂E=0 this says α₁·1∈3π₃E. At modulus 4 prove homotopy associativity under the additional hypothesis i(ν·1)=0 in π₃(E/4), where ν generates π₃S≅ℤ/24; since π₂E=0 this says ν·1∈4π₃E. Construct the unit and product and their compatibility with E→E/pʳ. For pʳ≠2 the product is induced from a two-sided unital product on S/pʳ, so its associator and commutator are the images under the unit S→E of those of S/pʳ. The commutator vanishes when the unit is inserted in either slot, so it factors through the collapse onto the top cell, with class in π₂(S/pʳ); the indeterminacy of that class lies in pʳ·π₁(S/pʳ)=0. The commutator dies at every modulus: π₂(S/pʳ) is zero for odd p, and for p=2 it is generated by iη² and a lift η̃ of η through the Bockstein j:S/2ʳ→S¹; the unit sends iη² to i(η²·1)=0, and sends η̃ to a class with Bockstein η·1=0, hence into i(π₂E)=0. This disposes of the non-commutativity of S/4 and S/8. For pʳ∉{2,3,4} the product on S/pʳ can be chosen homotopy associative, so the induced product is. At moduli 3 and 4 use Araki–Toda's associativity criterion: for q≢2 mod 4, E/q has a commutative and associative unital product when η·1∈qπ₁E, ν·1∈qπ₃E and multiplication by η·1 is null on E/q. Under η·1=0 only the middle condition remains. At q=4 it is the modulus-4 hypothesis; at q=3 it is the modulus-3 hypothesis, since α₁=±8ν and 9ν∈3π₃S. The associator of S/3 is i∘α₁ on its top cell, which is why modulus 3 needs its own hypothesis. At modulus 2 the η-hypothesis enters as follows: `2·id_(E/2)` is the composite E/2→ΣE→E→E/2 of the Bockstein, multiplication by η·1 and reduction, and a left-unital product forces `2·id_(E/2)`=0 because 2=0 in π₀(E/2). Since precomposition with the Bockstein S/2→S¹ has kernel 2π₁(E/2) on π₁(E/2), an E-linear left-unital product on E/2 exists exactly when i(η·1)∈2π₁(E/2); the theorem assumes the stronger η·1=0. Under η·1=0, Araki–Toda construct a two-sided unital, homotopy associative product on E/2, compatible with reduction. In Spanier–Whitehead dual form, the commutator of every such product is the image under the unit of the coextension η̃∈π₂(S/2) of η. Its Bockstein is η·1=0, so it lies in i(π₂E)=0, and every such product is commutative. Independently: since η·1=0 the unit extends over Cη=S∪_η e². As π₁(Cη)=0 and π₀(Cη)=ℤ, π₁(Cη/2)=0, so a pairing S/2∧S/2→Cη/2, unital in both slots, exists. Its commutator lies in π₂(Cη/2)=π₂(Cη)/2, which maps to i(π₂E)=0. A change of unital product on E/2 alters the commutator class by twice a class of π₂(E/2), and `2·id_(E/2)`=0, so the class does not depend on the product.

**Checks.**

- E=`τ_(≤1) S` is E∞ with π₀=ℤ, π₁=ℤ/2 generated by η and no other homotopy; it satisfies the degree hypotheses but not η·1=0. Here π₁(E/2)=ℤ/2 is generated by the reduction of η, precomposition with the Bockstein S/2→S¹ is injective on it since 2π₁(E/2)=0, and so `2·id_(E/2)`≠0 and E/2 has no left-unital product.
- E=`τ_(≤3) S_(3)` is E∞ with π₀=ℤ_(3), π₃=ℤ/3 generated by α₁·1 and no other homotopy; it satisfies the degree hypotheses and η·1=0 but not the modulus-3 hypothesis. Since π₁(E/3)=π₂(E/3)=0, every unital product on E/3 restricts along S/3→E/3 to the image of the product of S/3, so its associator restricts to i(α₁·1) composed with the collapse of (S/3)^∧3 onto its top cell. This is nonzero: i(α₁·1) generates π₃(E/3)=ℤ/3, and the top cell's attaching maps have degrees divisible by 3. Hence E/3 has no homotopy-associative unital product.
- At n=4 and n=8, π₂(S/n) is generated by iη² and a lift η̃ of η, and under the hypotheses both go to zero in π₂(E/n)≅π₁E[n], so the commutators of S/4 and S/8, which are nonzero, have zero image. For E=`τ_(≤1) S`, which fails η·1=0, π₂(E/4)≅π₁E=ℤ/2 and η̃ maps to its generator, so the vanishing uses η·1=0.
- The exact sequence π₃S→π₃(S/4)→π₂S[4]=ℤ/2 shows that iν and η̃∘η generate π₃(S/4), since the Bockstein of η̃∘η is η². Under the degree hypotheses and η·1=0, π₃(E/4)=π₃E/4 and the image of π₃(S/4) is the subgroup generated by i(ν·1). This illustrates why the modulus-4 hypothesis is the right one; the proof of associativity at modulus 4 is the Araki–Toda criterion, not this computation. The same computation at modulus 8 gives the subgroup of π₃E/8 generated by i(ν·1), but no hypothesis is needed there because S/8 has a homotopy associative product.
- E=KU satisfies η·1=0 and the associativity hypotheses at 2 but has π₂KU=ℤ, so it fails the degree hypothesis. The image of η̃ in π₂(KU/2)=ℤ/2 is the reduced Bott class, so KU/2 has exactly two admissible unital products, each the twist of the other and neither commutative. For E=Hℤ, which satisfies every hypothesis, π₂(E/2)=0 and E/2=H𝔽₂ with its commutative product.
- E=S fails the degree hypothesis (π₂S=ℤ/2), consistent with S/2 having no unital product.

(W IV Scholium 2.8.1, p. IV.21, whose statement omits the η hypothesis and the modulus-3 and modulus-4 hypotheses; W IV, paragraph on products before Thm. 2.8, p. IV.21, for the Moore spectra S/pʳ, the failure of associativity of S/3 and S/4 and of commutativity of S/4 and S/8; AT II Thm. 7.6 and Cor. 7.7, pp. 87–88, for the modulus-2 commutator, Cor. 7.8, p. 88, for KU/2, Thm. 9.9 and Cor. 9.10, p. 104, for modulus-2 associativity, and Thm. 10.6, p. 107, for the criterion at q≢2 mod 4.)

*Needs:* §7.28, GeneralizedCohomology G2.4.

### 7.34 Burklund's E_n-algebra structures on Moore spectra

Construct the Eₙ-algebra structures on S/pᑫ in the specified ranges: q≥n+1 at odd primes and 2q≥3(n+1) at p=2. Thus S/8 is E₁ and S/32 is E₂, while S/p² is E₁ for odd p. At odd p apply §7.32 with C=Sp and v=p. At p=2 apply §7.29's obstruction tower in Syn_HF₂ to `2̃^q : S^(0,q) → S^(0,0)`. Each refined obstruction lies in a group that vanishes by the synthetic Moore-quotient vanishing theorem of §7.31 when 2q≥3(n+1). The symmetric monoidal τ-inversion then carries the Eₙ-algebra C(2̃^q) to S/2^q. Identify these with the abstract-algebra and concrete-spectrum comparison of Layer 5. The general quotient tower has the v-compatible uniqueness of §7.32, rather than uniqueness of arbitrary Moore algebra structures.

**Checks.**

- §7.32 at v=4, admissible since S/4 has §7.28's unital multiplication, gives S/2^(2(n+1)): S/16 as E₁ and S/64 as E₂. §7.32 alone does not reach S/8 as E₁ or S/32 as E₂; the synthetic route gives them.
- S/p² is E₁ at odd p, whereas S/p is never E₁.
- At p=2 and n=1 the range begins at q=3; S/2 has no unital multiplication (§7.1).

(Bu Theorems 1.1 and 1.2, p. 1; Thms. 3.1–3.2, pp. 6–8; Cor. 5.6 and Remark 5.7, p. 12.)

*Needs:* §7.1, §5.13, §5.18, §7.7, §7.29, §7.31, §7.32.

### Examples

For E = Hℤ, E/p has π₀ = ℤ/p and no extra degree-zero summand. For E = H(ℤ/p), its Bockstein sequence has a quotient term in degree zero and a torsion term in degree one. The doubling tower of ℤ has lim¹ = ℤ₂/ℤ. An exact couple can have E = 0 and nonzero D, and its i-map need not square to zero.

### Dependencies

Layer 1 (§1.32) and Layer 5, BordismFormalGroups F6.5 for the fracture square, abelian/spectral-object APIs, the supplied countable-tower algebra and the local Ext comparison, TangentialBordism's Steenrod squares and Adams tower, §§7.29–7.31's obstruction tower, deformation and HF₂-synthetic vanishing lines, and EllipticCohomology E4.A's MU-case machinery extended to the HF₂ site in §7.31; prime, finiteness and convergence conditions remain explicit.

## Downstream consumers

General algebraic K-theory uses these category constructions, plus comparisons, K-theory spectra, products and coefficients. Low-degree K-theory and regulators use the central-extension comparisons. Étale and motivic K-theory use coherent spectra and filtered convergence: the filtered-diagram, exact-couple, functorial-page and convergence interfaces are §§7.21–7.26, including the hypotheses of the convergence theorems. Abstract derived-sheaf theory uses the concrete stable presentation and operadic comparisons; arithmetic-duality developments use §7.9's spectral comparison with the shared tower algebra. Each consumer imports these interfaces with the connectivity, prime and finiteness conditions.

The following contracts export the general constructions here. GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic are downstream consumers, not prerequisites.

| Consumer interface | Owner and identifying maps |
| --- | --- |
| GeneralAlgebraicKTheory §§1.1–1.4 | §§1.1–1.34, 2.4–2.11, 2.17–2.25, 2.28 and 2.31–2.35 here own realized nerves, homotopy-fibre tools, bisimplicial realization and Quillen A/B, including Theorem B in both comma forms. Its classifying space and functor map are aliases for the same realized nerve and nerve map, with the same vertices. Comma comparisons commute up to the specified homotopy with projection to BC after reversing its paths b→f(a) to the paths f(a)→b used here. Opposite comparisons reverse the arrow strings and simplex coordinates; product comparisons use the realized projections. Retain the corresponding local coefficient transport. |
| GeneralAlgebraicKTheory §1.5 | §§3.1–3.28 here own acyclic plus maps, uniqueness and homotopy functoriality, including §3.25's arbitrary-target factorization and §3.28's H-space recognition; no strictly functorial point-set plus model is exported. Its plus object carries the same source map and subgroup kernel; comparison with a chosen model is the unique homotopy equivalence under X, preserving every pulled-back local coefficient system. |
| GeneralAlgebraicKTheory §1.6 | §§4.3–4.21 here own the monoidal localizations and group completion. Identify objects (s,x) and stabilized morphism classes directly, so inclusion, translation and component difference [a]−[b] agree. The action-fibre comparison retains its chosen x₀ and composite nullhomotopy. |
| GeneralAlgebraicKTheory §§3.3–3.4 and 3.13 | AlgebraicKTheory A0–A1 supplies the matrix/projective algebra to both roadmaps. The finite-stage identity maps of §4.14 identify its stable GL and E with the aliases here; the Rᵐᵒᵖ/row adapter of §4.15 identifies the complement and splitting maps. The classifying-space/plus multiplication is the one constructed here. |
| GeneralAlgebraicKTheory §§5.1–5.7 and 5.10–5.11 | §§6.1–6.2 here own Waldhausen structures, S, additivity in the extension-category form E(A,C,B) with the homotopy induced by a natural isomorphism of S-diagrams, the additivity fiber, the pushout contraction of the additivity fiber and object additivity for S-diagrams, the relative S-construction with the relative-S extension-category equivalence and the relative-S fiber sequence |wS•C|→|wS•S•(F)|→|wS•S•B| for every exact functor and its corollary form, and relative-S delooping; the consumer's object-S homotopy, simplex-fibre, pushout-contraction, object-additivity and relative-S statements are to be stated as aliases of these, preserving the relative-S extension-category equivalence and additivity in the E(A,C,B) form. No fibrewise contractibility of the subobject projection wS•S₂C→wS•C is supplied here: by the zero-vertex additivity-fiber Check in §6.2 its fibres are not contractible, and the consumer's simplex-fibre step is the additivity fiber with its section and pushout contraction. The consumer's swallowing lemma is its own and is not used here. Identify S-diagrams by their entries Aᵢⱼ, their quotient pushout squares, objectwise weak maps and relative latching cofibrations. Faces and degeneracies are the same index restrictions. The comparison carries source/quotient to source/quotient in additivity and the relative-S path object to the same pullback with its extra degeneracy. Its connective Ω-model is the model of §§6.1–6.2 with zero space weakly equivalent to Ω|wS•C|; the sequential/symmetric comparison retains the Kan-replacement maps and positive structure maps and sends each object loop to its K₀ generator. Its §§5.8–5.9 retain the exact-category S/Q comparison as additional consumer results. The comparison of Ω|iS•A| with B((iso A)⁻¹(iso A)) for a small additive category A is the consumer's, as the composite of its S/Q comparison and its plus-equals-Q theorem for split exact categories; §6.3 here does not supply it. |
| GeometryOfNumbersAndQuadraticArithmetic §6.10, `plusConstructionComparison` | Its ordinary ring plus/Q comparison uses GeneralAlgebraicKTheory's Q-theory. The arbitrary-target plus factorization and the H-space recognition theorem are owned here, as §3.25 `IsPlusConstruction.lift` and §3.28 `IsPlusConstruction.hSpaceRecognition`, with the ring specialization X=BGL(R), P=E(R) in §4.14; that consumer's additional factorization and H-space recognition statements are aliases of these, with the supplied plus map. Its §6.1.7 right-projective/common-spectrum adapter transports these statements through the under-BGL plus equivalence and the right/left-module comparison of §4.15 here; preserve the factorization homotopy, quotient on π₁, ring maps, stabilization and opposite rings. No separate generic factorization or S/Q engine belongs to this consumer. |

## References

- Niles Johnson and Angélica M. Osorno, [Modeling Stable One-Types](https://arxiv.org/abs/1201.2686v3), arXiv:1201.2686v3 (2012), Prop. 3.4 and Remark 3.5, pp. 10–11 (JO).
- Daniel Quillen, [Higher algebraic K-theory: I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf), Lecture Notes in Mathematics 341 (1973), pp. 85–147; locators use printed LNM pages.
- Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), online Chapter IV; chapter page numbers.
- Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), online Chapter V; chapter page numbers.
- Gunnar Carlsson; volume editors Eric M. Friedlander and Daniel R. Grayson, [Deloopings in algebraic K-theory (Handbook of K-theory, vol. 1, chapter I.1)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carldeloop.pdf), Handbook of K-theory I (2005), pp. 3–37; locators use printed pages.
- Allen Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), author’s online edition; printed pages and numbering of the 2002 edition.
- Stefan Schwede, [Symmetric spectra (book project)](https://www.math.uni-bonn.de/~schwede/SymSpec-v3.pdf), preliminary version 3.0, 12 April 2012; printed pages.
- Mark Hovey, Brooke Shipley, Jeff Smith, [Symmetric spectra](https://arxiv.org/abs/math/9801077v2), arXiv:math/9801077v2; manuscript pages.
- Thomas Nikolaus, Peter Scholze, [On topological cyclic homology](https://arxiv.org/abs/1707.01799), arXiv:1707.01799, 169-page version; manuscript pages.
- Bhargav Bhatt, Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490v3), arXiv:1507.06490v3; manuscript pages.
- B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus, W. Steimle, [Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/abs/2009.07225), arXiv:2009.07225, 63-page version; manuscript pages.
- Shôrô Araki and Hirosi Toda, [Multiplicative structures in mod q cohomology theories II](https://doi.org/10.18910/4430), Osaka J. Math. 3 (1966), pp. 81–120 (AT II); printed pages.
- Robert Burklund, [Multiplicative structures on Moore spectra](https://arxiv.org/abs/2203.14787), arXiv:2203.14787, 20-page version; manuscript pages.
- Marco Schlichting, [Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem](https://arxiv.org/abs/1209.0848v3), arXiv:1209.0848v3; manuscript pages.
- Robert Burklund, Jeremy Hahn, Andrew Senger, [On the boundaries of highly connected, almost closed manifolds](https://arxiv.org/abs/1910.14116v3), arXiv:1910.14116v3; manuscript pages.
- Irakli Patchkoria, Piotr Pstrągowski, [Adams spectral sequences and Franke's algebraicity conjecture](https://arxiv.org/abs/2110.03669v2), arXiv:2110.03669v2; manuscript pages.
- Piotr Pstrągowski, [Synthetic spectra and the cellular motivic category](https://arxiv.org/abs/1803.01804v3), arXiv:1803.01804v3; manuscript pages.
- Jacob Lurie, [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), September 2017 author’s edition; printed pages.
- Allen Hatcher, [Spectral Sequences (Chapter 1 of the book project 'Spectral Sequences in Algebraic Topology')](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf), author’s SSch1.pdf, 67-page version; chapter pages.
- Bruno Kahn, [Around Quillen's Theorem A](https://arxiv.org/abs/1108.2441v3), arXiv:1108.2441v3; manuscript pages.
- Brooke Shipley, [HZ-algebra spectra are differential graded algebras](https://arxiv.org/abs/math/0209215), arXiv:math/0209215, 22-page version; manuscript pages.
- A. K. Bousfield and E. M. Friedlander, [Homotopy theory of Γ-spaces, spectra, and bisimplicial sets](https://ncatlab.org/nlab/files/BousfieldFriedlanderSpectra.pdf), Lecture Notes in Mathematics 658 (1978), pp. 80–130; printed pages.
- J. P. May, [Weak equivalences and quasifibrations](https://math.uchicago.edu/~may/PAPERS/67.pdf), 1990, pp. 91–101.
- O. Randal-Williams, [Group-completion, local coefficient systems and perfection](https://www.dpmms.cam.ac.uk/~or257/notes/GCrem.pdf), 2013.
- F. Waldhausen, [Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf), 1985, §§1.1–1.5.
- C. Weibel, [The K-book, Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), §1.3 and §§5.3–5.4.
- J. M. Boardman, [Conditionally convergent spectral sequences](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/boardman-SS.pdf), 1999, §0, pp. 2–4, Def. 5.10 and Thms. 7.1, 8.2.
- D. Pavlov and J. Scholbach, [Symmetric operads in abstract symmetric spectra](https://arxiv.org/abs/1410.5699), 2018 manuscript, Thms. 4.1, 4.6 and 4.9, pp. 17–19.
- J. F. Adams, A periodicity theorem in homological algebra, Proc. Cambridge Philos. Soc. 62 (1966), pp. 365–377, Thm. 2.1.
- R. W. Thomason, Homotopy colimits in the category of small categories, Math. Proc. Cambridge Philos. Soc. 85 (1979), pp. 91–109, Thm. 1.2.
- F. Waldhausen, Algebraic K-theory of generalized free products, Parts 1 and 2, Ann. of Math. 108 (1978), pp. 135–256, Lemma 5.2.
- M. G. Barratt and P. J. Eccles, Γ⁺-structures I: a free group functor for stable homotopy theory, Topology 13 (1974), pp. 25–45.
- The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu), tags 07KW and 0598.
- J. F. Jardine, [Lectures on Homotopy Theory, Lecture 06: Simplicial groups and simplicial modules](https://www.math.uwo.ca/faculty/jardine/courses/homth/homth-lecture006a.pdf), §§14–16, Lemmas 14.1 and 14.3, pp. 1–5.
