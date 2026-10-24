# Roadmap: algebraic topology of spaces and manifolds, Part II: homotopy foundations for algebraic K-theory

**Summary.** Build Quillen’s Theorems A and B, acyclic maps, the plus construction, categorical homotopy group completion and Waldhausen K-theory assembly. Compare these models with supplied symmetric spectra, and develop finite coefficients, their products, prime-completion comparisons and filtered convergence from Mathlib’s simplicial/category theory and Tau Ceti’s homotopy/covering theory.

## Scope and ownership

This extends **Algebraic topology of spaces and manifolds**. The following mathematics enters through its owners’ interfaces.

- **AlgebraicTopology**, stages 1–4, owns van Kampen, singular and relative chains, twisted chains with local coefficients, excision, cellular homology, mapping cylinders, cellular approximation and CW cofibrations. Stages 5–6 own Serre fibrations, the homology Serre spectral sequence and ordinary cohomology. Stage 8 owns cubical/Kan homotopy comparison, based relative homotopy, absolute and simply connected relative Hurewicz, and Whitehead. Realisation-specific cell indexing and comparisons with category chains belong here. ClassifyingSpaces Stages 1–4 supply group classifiers, their CW-type uniqueness and their group-(co)homology comparisons; the new nerve-model adapters are specified below. The extensions for arbitrary fibre pairs and twisted cellular comparisons are stated explicitly below.
- **GeneralizedCohomology**, G2, G3 and G5.4–G5.6, owns the symmetric-sphere-module model, its stable and monoidal homotopy theory, Γ-machine, ordinary coefficients, derived spectral limits, localization and completion, Bott spectra and rational stable comparison. The additional point-set, algebraic K-theory, coefficient and convergence comparisons are specified here.
- **UniversalCovers**, stages 2–4, owns cover classification, covering-induced homotopy isomorphisms, basepoint change and recognition of aspherical spaces. Group-nerve and bar comparisons are local; the classifier itself is supplied by ClassifyingSpaces Stages 1–4.
- **GrothendieckEulerForms**, layer 2, and Tau Ceti's `TauCeti.SplitK0.grothendieckAddGroupEquiv` own algebraic split K₀. Mathlib owns algebraic group completion. This roadmap constructs a space and identifies its components with those groups.
- **IntegralLattices**, 0A, supplies integral forms, isometries and orthogonal sums; 0E supplies signatures, 2C supplies orthogonal groups and orthogonal-sum embeddings without a definiteness assumption, and 6A supplies indefinite unimodular classification. **OrthogonalSpinGroups**, 0C, supplies only the bilinear/quadratic base-change comparison. The new targets here are cofinal stabilization and the classifying-space and plus comparison.
- **BordismFormalGroups**, F6.5, owns Sp∞, symmetric coherence, infinity-operad interfaces and the monoidal model-localization comparison for GeneralizedCohomology's spectra. The comparisons here use those supplied objects.
- **TangentialBordism**, B4.1–B4.2, owns the generic mod-2 Steenrod squares on ordinary cochains, the stable HF₂ operations and the mod-2 Adams tower. §7.1's Hopf-class and Moore-spectrum calculations and §7.31's Adams E₂-page use them.

StableHomotopyKTheory owns generic nerve homotopy, Quillen A/B, acyclic and plus constructions, monoidal group completion and generic Waldhausen/S foundations, including the Waldhausen structure on each SₙC. AlgebraicKTheory A0–A1 owns the arbitrary-ring matrix, elementary-subgroup and projective-complement algebra; §§4.14–4.15 here adapt its objects to classifying spaces and left modules. GeneralAlgebraicKTheory consumes the generic homotopy and Waldhausen interfaces and owns Q-theory, localization, approximation and ring-specific comparisons. The map-level contracts in Downstream consumers identify these constructions and the ring specialization of the general plus factorization.

Local foundations include universal central extensions (Layer 3); stable-linear classifying-space and projective-cofinality adapters and the function-ring model of topological K-theory (Layer 4); stable and operadic comparisons (Layer 5); Waldhausen categories, S-construction, additivity and relative-S delooping (Layer 6); and the spectral comparison with supplied countable-tower algebra, the Eₙ quotient obstruction tower, the Patchkoria–Pstrągowski deformation and HF₂-synthetic spectra (Layer 7).

Nerves, realisation, local coefficient carriers, universal covers, split K₀, chain cones and abstract spectral-sequence pages retain their supplier objects. Tau Ceti also supplies `TauCeti.HasHomotopyExtensionProperty`, its cylinder-retraction criterion and cross-universe extension theorem in `Topology.Homotopy.Extension.Basic`; these enter as prerequisites, rather than a new HEP theory. The new proper-realisation and gluing targets use this property on closed embedding images.

## Conventions

Small categories have objects and morphisms in fixed universes. Universe changes use `ULift` or Mathlib's small-category interfaces; they do not discard size hypotheses. Classifying spaces are the composite of `CategoryTheory.nerveFunctor` and `SSet.toTop`. A category with no objects has empty realisation. A based space includes an actual point, and based maps include its preservation equation.

Products, mapping spaces and simplicial topological constructions use compactly generated weak Hausdorff spaces where required. A finite CW factor permits the ordinary product topology. No assertion about an arbitrary infinite product silently uses that exception. The CW structure on a realisation has a cell for each nondegenerate simplex, rather than a cell for each simplex.

Composition follows Mathlib. In `SingleObj G`, `f ≫ g = g*f`. In the π₁, the product of the classes of paths p and q is represented by q followed by p. Thus the edge labelled g*h is homotopic to the edge h followed by the edge g. The explicit bar comparison inverts each entry without reversing its tuple; coefficient transport and the first face use that same convention.

The homotopy fibre `F(f,b)` consists of pairs `(a,γ)` with γ a path from `f(a)` to b. Reversing γ compares it with the basepoint-to-f(a) convention. The homotopy boundary sends a loop at b to (a₀,loop), with that endpoint direction. Groups occur in positive absolute homotopy degrees; degree zero is a pointed set. Relative π₂ need not be abelian. Every relative group uses a point in the subspace.

A weak homotopy equivalence is bijective on path components and on all π-groups at every basepoint. Homotopy-cartesian squares use an actual comparison to a path-space homotopy pullback. Quasifibrations only compare strict fibres with homotopy fibres; they do not assert a lifting property.

Plus constructions use a connected space of CW type and a specified perfect normal subgroup of its π₁. Their homology condition ranges over every local coefficient system pulled back from the quotient group. Their uniqueness and functoriality are assertions about maps up to homotopy or about coherent functorial models, not equalities of selected cell attachments.

Symmetric spectra have pointed simplicial-set levels and equivariant iterated structure maps. Naive π-groups are stabilised level π-groups; true π-groups are computed after stable replacement. They agree only under the semistability hypotheses. Homotopy groups are indexed by all integers. Suspension raises degree by one, so `π_k(ΣE) = π_(k−1)(E)`. The symmetry on sphere factors of degrees r and s has sign `(−1)^(rs)`.

For a map f, the stable triangle is `X → Y → C(f) → ΣX`; the boundary on π_k lowers degree by one. For m ≥ 1, `E/m` is `C(m·id_E)`. The transition `E/p^(r+1) → E/p^r` comes from the square with p on the source and identity on the target. The maps on the two outer groups in its Bockstein short exact sequence differ: quotient reduction on π_k(E)/p^r and multiplication by p on the torsion term.

Filtered spectra are coherent point-set diagrams with derived cofibres. Their increasing homological spectral sequence has `E¹_(s,t) = π_(s+t)(gr_s E)` and d_r of bidegree (−r,r−1). A complete decreasing tower has `E¹_(s,t) = π_(t−s)(fib(Y_s → Y_(s−1)))` and the separately specified differential. Completeness, exhaustiveness and vanishing of derived limits are distinct assumptions; no displayed page by itself states convergence. The tower differential has total degree −1: `(t+r−1)−(s+r)=t−s−1`.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.nerve`, `nerveMap`, `nerveFunctor`, `SSet.toTop` and `sSetTopAdj` as defined. Simplicial cells use `SSet.relativeCellComplex`, `SSet.Subcomplex`, `SSet.nonDegenerate`, standard simplices and `TopCat.diskBoundaryInclusion`. Ordinary chains use `SSet.chainComplex` and `AlgebraicTopology.singularHomologyFunctor`; normalised simplicial modules use the Dold–Kan equivalence. Category coefficients live in `ModuleCat R` and use its AB5 instance for exact filtered colimits. A derived-colimit comparison uses `CategoryTheory.Functor.leftDerived`, with `HasProjectiveResolutions` proved or supplied for the diagram category; the existence of that instance is not inferred from the module category alone.

Compact generation uses `CompactlyGenerated`, `CompactlyGenerated.of`, `compactlyGeneratedToTop` and `TopologicalSpace.compactlyGenerated`. The weak-Hausdorff subcategory, its closed products/mapping objects and closed-embedding pushouts are the extensions below. Padic residue comparisons use `PadicInt.toZModPow`, `PadicInt.lift_spec` and `PadicInt.lift_unique` from `NumberTheory.Padics.RingHoms`. Category-localisation and covering comparisons use `CategoryTheory.FreeGroupoid`, comma categories, `CategoryTheory.Grothendieck` and Mathlib's fibre-category interfaces. Monoidal constructions use `CategoryTheory.Core`, `MonoidalCategory` and `SymmetricCategory`. The coherent action input is Mathlib’s `CategoryTheory.MonoidalCategory.MonoidalLeftAction` from `CategoryTheory.Monoidal.Action.Basic`. Iso-class monoids and their functorial maps are `Skeleton.instMonoid`, `Skeleton.instCommMonoid`, `Skeleton.monoidHom` and `Skeleton.mulEquiv` from `CategoryTheory.Monoidal.Skeleton`; only their comparison with classifying-space components is new here; the algebraic component group is `Algebra.GrothendieckGroup`. The model-category construction uses `HomotopicalAlgebra.ModelCategory`, rather than a private collection of lifting predicates. Triangles use `CategoryTheory.Pretriangulated`; spectral-sequence pages use `CategoryTheory.Abelian.SpectralObject` and `SpectralSequence`. Completion comparisons use `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` from `RingTheory.AdicCompletion.AsTensorProduct`: over a commutative Noetherian ring R, for an ideal I and finite R-module M, the completed tensor product `(AdicCompletion I R) ⊗[R] M` identifies with `AdicCompletion I M`.

### From Tau Ceti

Use `HomotopyGroup.map` and its homomorphism form, `TauCeti.homotopyGroupEquivOfPath`, the fundamental-group action and `HomotopyGroup.loopSpaceMulEquiv`. The path-component/loop comparison is `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup`. Use `TauCeti.LocalCoefficientSystem` with its constant and pullback functors, `TauCeti.CoveringSpace` with its monodromy functor, and `TauCeti.IsEilenbergMacLaneSpaceOne` with its asphericity condition. Comparisons preserve these basepoints, composition and coefficient handedness. Their Lean modules are `TauCeti.Topology.Homotopy.HomotopyGroup.{Map,BasepointChange,FundamentalGroupAction,LoopSpace}`, `TauCeti.AlgebraicTopology.LocalCoefficient`, `TauCeti.Topology.Covering.Monodromy.Basic` and `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`.

### From AlgebraicKTheory

[AlgebraicKTheory A0–A1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1142) supplies the finite-projective splitting maps, finite block matrices, stable GL under trailing-identity stabilization, its elementary subgroup, normality, perfectness and equality with the commutator subgroup, for arbitrary associative unital rings including zero. Its projectives are right modules, with matrices acting on columns. For left R-modules use its A0 at Rᵐᵒᵖ, the canonical double-opposite scalar identification and the transpose/opposite adapter of §4.15. The underlying finite-projective category remains Tau Ceti's native category. No higher-K comparison is an input to A0–A1. The topology and plus multiplication on these supplied groups belong to §4.14.

### From TangentialBordism

[TangentialBordism B4.1–B4.2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/942) supplies the mod-2 Steenrod squares on AlgebraicTopology's normalized ordinary cochains: higher diagonals and cup-i products, `Sq^k[c] = [c ∪_(n−k) c]` for c of degree n, naturality, Sq⁰=id, instability, the top square, additivity, Cartan, Adem, suspension stability, relative groups and Sq¹ equal to the mod-2 Bockstein. B4.2 supplies the stable operations on HF₂ from GeneralizedCohomology's HA model, H*(HF₂)=A with its admissible basis, and the mod-2 Adams tower with its Ext_A E₂-page and convergence to 2-completion for bounded-below spectra of finite type. These retain AlgebraicTopology's coefficient carrier, cup product and suspension isomorphism. No second Steenrod-square construction belongs to this roadmap.

### From DerivedModuleAlgebra on main

[DerivedModuleAlgebra §1.T.1](../DerivedModuleAlgebra/README.md#1t1-towers-lim-and-lim¹) supplies countable tower algebra on `ℕᵒᵖ ⥤ ModuleCat R`. Use it at R=ℤ with its integral abelian-group adapter `CompactCoefficients.Tower`: `ModuleTower.shift`, `ModuleTower.lim`, `ModuleTower.limOne`, their natural maps, the six-term boundary, derived-limit comparison and Mittag–Leffler vanishing. Its `Tower.toModuleFunctor`, `Tower.limComparison` and `Tower.limOneComparison` preserve that boundary and the Milnor maps. Its `limOne_mul_p` supplies the multiplication-by-p integer tower and the convergent-sum identification with ℤₚ/ℤ. Sections 4.11 and 7.9–7.11 add the unstable and spectral identifications with this same algebra.

### From GeneralizedCohomology

Consume [GeneralizedCohomology](../GeneralizedCohomology/README.md) at the following section contracts. All comparisons retain arbitrary integer homotopy degrees, universe lifts, basepoints, units and naturality. No point-set choice is inferred functorial from a choice of triangle cone.

- **G2.10:** `MappingPathSpace f`, `MappingPathFiber f b`, `mappingPathProjection`, `mappingPathFiberProjection`, `mappingPathEndpoint`, `mappingPathInclusion`, `IsHurewiczFibration` and `IsHurewiczFibration.lift` supply the path-space objects and maps. The fibre is the raw subspace of `A×C(I,B)` cut out by `γ(0)=f(a)` and `γ(1)=b`. Consume its contraction, endpoint Hurewicz/Serre lifting, strict-fibre flattening, path/loop homeomorphisms, all-universe lifting, naturality and homotopy-choice comparisons, followed by its fibration-LES comparison. Its fibre projection and constant-path point are used directly, without another carrier. For `id_B` the fibre is contractible even when B is disconnected; for `*→B` it is `Ω(B,b)`; for `A→*` it is A; an empty source has empty fibres. The mapping-path contraction fixes constant paths and is not a retraction over B. (H AT Props. 4.64–4.65, pp. 407–408.)
- **G2.1–G2.2:** pointed simplicial sets are `Under Δ[0]`, smash collapses the wedge in the product, `S¹=Δ[1]/∂Δ[1]`, `Sⁿ=(S¹)^∧n`, and spectra are modules over the symmetric sphere monoid under Day convolution. Consume all tensor/closed/enrichment laws, block actions, structure-map equivariance, free/evaluation adjunctions, levelwise limits and colimits, and the balanced smash coequalizer with its universal bimorphism maps. Its realization comparison uses the Kelley product. The new shift and cone adapters below are for this carrier; a right-written structure map `E_n∧S^m→E_(n+m)` is obtained from its left-written map by the displayed symmetry, with the block actions retained. (HSS §§1.1–1.2; S I Def. 3.1, p. 34, Construction 5.6 and Thm. 5.10, pp. 83–85.)
- **G2.3–G2.6:** consume the Kan–Quillen and level/stable projective models, positive/flat variants, functorial replacements, injective-independent stable mapping spaces, native stable localization, its locally small additive/triangulated homs, derived closed smash and module models. Stable suspension has integer shifts and `π_k(ΣE)=π_(k−1)E`; rotation is `(g,h,−Σf)`. Derived products have product π-groups. Naïve groups are `colim_n π_(k+n)|E_n|`, with an abelian cofinal range `k+n≥2`, and a stable replacement computes true groups. Consume their semistable comparison, spectral Whitehead, compact sphere generation, connective-cell construction, free spheres, suspension spectra, sequential comparison and Freudenthal. The source-to-level maps include the low-degree set/group branches. For an Ω-spectrum, naïve π_k is π_k of its zero level for k≥0 and π₀ of its level −k for k<0; each level with k+n≥0 gives the corresponding comparison. A positive Ω spectrum computes true groups in sufficiently large positive levels. A naïve π-isomorphism is stable, and the converse holds between semistable spectra. (HSS Thms. 3.4.4 and 4.3.2; S I §§2–3, 6; S II §§1–5.)
- **G2.4 and G2.8:** consume strict monoid/ring and right-module objects (right modules are left modules over the opposite ring), the module-model free–forgetful adjunction, the Barratt–Eccles machine with full block-substitution laws, and positive-model rectification. Γ-spaces use the skeleton of finite based sets and covariant functors; special means the zero term is contractible and the Segal maps are weak, and very special means also grouplike π₀. Consume prolongation, assembly, all permutation actions, the connective-spectrum equivalence and the group-completion left adjoint, including its unit/counit and the full homological localization property. The broader spectrum-operad transfer theorem below states its precise additional generality. (BS Appendix §12, Def. 12.4, Thm. 12.9 and Prop. 12.10, pp. 56–58; S IV Thm. 1.3, p. 386.)
- **G2.7 and G3.8:** consume `HA`, its reduced-free-module levels, Dold–Kan/abelian Kan comparison, coefficient maps, Kan Ω status, `π₀HA=A` and all other π zero, the commutative HR and HM actions, unit and ordinary reduced/absolute/relative homology and cohomology comparisons. Consume full mapping-space truncation, `connectiveSpectrumMapsToHA`, connective covers, Postnikov sections, their adjunctions and compatible towers, with heart the abelian groups. A normalised smash-sphere complex is quasi-isomorphic to A[n], and need not be literally A[n]. For connective V and X with π_kX=0 for k≥1, consume [V,X]≅Hom(π₀V,π₀X), even when X has negative homotopy. A spectrum concentrated in degree zero is equivalent to Hπ₀ with the specified identity on π₀. Covers erase only groups below their cutoff, sections erase only groups above it, and the truncation triangle retains its map and boundary. (S I Example 1.14, p. 16; S II Prop. 5.24 and Thm. 5.25, pp. 265–266, Prop. 6.23, p. 279, Thms. 8.1 and 8.3, pp. 295–296; Jardine Lecture 06, Lemmas 14.1 and 14.3.)
- **G3.4, G3.7–G3.9:** consume coherent spectral telescopes, π commuting with filtered homotopy colimits, the contravariant Milnor sequence for cohomological functors carrying sums to products, model tower replacements, derived products and the homotopy-limit fibre of `1−shift`. Its Milnor sequence is `0→lim¹π_(k+1)E_r→π_k holim E_r→lim π_kE_r→0`. Consume sphere localization, rationalization and prime completion `E^∧_p=holim_(r≥1)E/p^r` with reduction induced by `(p,id)`, the identified function-spectrum model `F(S/p∞,ΣE)`, units, exactness, independence and idempotence. Completeness means the unit invertible, equivalently `F(S[1/p],E)=0`. Its Hom/Ext sequence is `0→Ext¹(ℤ/p∞,π_kE)→π_kE^∧_p→Hom(ℤ/p∞,π_(k−1)E)→0`; degreewise finite generation gives `π_kE^∧_p=π_kE⊗ℤ_p`. Rationalization is the exact coproduct-preserving functor E↦S_ℚ∧ᴸE with π_k(E_ℚ)=π_kE⊗ℚ; its unit is universal into rational spectra, equivalently spectra with uniquely divisible homotopy groups. Section 7.9 compares its Milnor maps with the supplied integral-module difference map. (S II Lemma 5.6 and Remark 5.9, pp. 257–258, Thm. 8.3, p. 297, Thm. 9.9, pp. 303–304.)
- **G5.4–G5.6:** consume KU, KO, ku, ko, built in G5.4 by G2.8's multiplicative machine from the skeletal bipermutative categories with endomorphism spaces O(r) and U(r), and their specified Bott/unit maps, rational stable-stem vanishing, `S_ℚ≃Hℚ` and the all-degree stable rational Hurewicz comparison. Also consume the filtered-cochain Serre spectral sequence, local tensor-cup pairings, derivation differentials and multiplicative convergence used in its rational EM computation. The unstable rational H-space theorem and the graded rational classification below are additional comparisons. (S II Thm. 9.6, p. 302; H SS §§1.2–1.4, pp. 22–45.)

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

[AlgebraicTopology](../AlgebraicTopology/README.md), Stages 1–4, supplies ordinary and twisted singular chains, relative homology, excision, cellular comparison, mapping cylinders, cellular approximation and CW cofibrations; Stages 5–6 supply Serre fibrations with the monodromy local system H_q(F;R), their homological spectral sequence and ordinary cohomology; Stage 8 supplies the cubical/Kan comparison, NDR-pair relative homotopy, simply connected Hurewicz and CW Whitehead. The new targets include arbitrary fibre pairs, the simplicial realization cell indexing, twisted cellular comparison and obstruction-theoretic extensions. A fibre pair not known NDR uses the explicit extension below.

[UniversalCovers](../../Completed/UniversalCovers/README.md), Stages 2–4, supplies covering classification, covering-induced higher-homotopy maps, basepoint change and aspherical-space recognition. [ClassifyingSpaces](../ClassifyingSpaces/README.md), Stages 1.5–1.6, 3.11–3.15 and 4.16–4.19, supplies the join classifier, CW-type uniqueness, its functoriality, the H₁–abelianization comparison and group-(co)homology via the bar resolution. Only the nerve realization and coefficient/sign adapters are new here.

[DGFloer](../DGFloer/README.md), Layer 1 items 1–4, supplies degree-one Hurewicz, CW approximation, weak-equivalence invariance with local coefficients, Serre classes and simply connected Hurewicz modulo a class, and functorial CW K(A,n) from the abelian bar/Dold–Kan models, n≥1, with discrete A at n=0. Retain the trivial-group contraction, the circle comparison for K(ℤ,1), the comparison K(A,1)≃BA, and `H₃(K(ℤ/2,1);ℤ)=ℤ/2`, distinguishing it from the Moore space RP² with zero H₃. The map-classification and ordinary representability comparison is specified below. (H AT Prop. 4.30, pp. 365–366; §4.3, Thm. 4.57, p. 393.)

[GrothendieckEulerForms](../GrothendieckEulerForms/README.md), Layer 2, supplies algebraic split K₀ and its universal additive invariant, with the pinned `TauCeti.SplitK0.grothendieckAddGroupEquiv` in `TauCeti.CategoryTheory.GrothendieckGroup.Split`. Mathlib supplies the algebraic component completion `Algebra.GrothendieckGroup`, the iso-class monoids `Skeleton.instMonoid`, `Skeleton.instCommMonoid`, and maps `Skeleton.monoidHom` and `Skeleton.mulEquiv` in `CategoryTheory.Monoidal.Skeleton`. The space-level component comparisons are new here. [IntegralLattices](../IntegralLattices/README.md), 0A, supplies integral forms, isometries and orthogonal sums; 0E supplies signatures, 2C supplies O(L), SO(L) and orthogonal-sum embeddings on arbitrary integral forms, and 6A supplies indefinite unimodular classification. Use `TauCeti.BilinForm.isometryGroup` from `TauCeti.LinearAlgebra.BilinearForm.Isometry` on the restricted integral bilinear form. [OrthogonalSpinGroups](../OrthogonalSpinGroups/README.md), 0C, supplies the bilinear/quadratic base-change comparison. [BordismFormalGroups](../BordismFormalGroups/README.md), F6.5, supplies Sp∞, symmetric coherence, infinity-operads and the monoidal localization comparison; `spectraInfinityCategory` denotes this supplied carrier.

## How to read the build

Layers 1–2 build category spaces, chains and fibre tools for Quillen’s theorems. Layers 3–4 construct plus and group completion. Layer 5 compares point-set and derived spectral structures; Layer 6 assembles K-theory deloopings; Layer 7 supplies finite coefficients, completion comparisons and filtered convergence. Subsections give contracts, API, checks, sources and prerequisites. `Suggested.lean` states Quillen A/B, the local-coefficient acyclicity criterion, plus existence and factorization, the second homotopy group and universal central extension of plus for aspherical sources, and freeness over simplex function rings. Its definitions use native realised nerves, continuous path spaces, singular homology and fundamental groups. The constructions of category chains, plus spaces, monoidal completion and the new spectral/coefficient comparisons are specified here with their full interfaces and checks; their carriers require subsequent formalisation. This document is the mathematical specification.

Reference abbreviations below are Q (Quillen), W IV/V (Weibel), C (Carlsson), H AT/SS (Hatcher), S (Schwede), HSS, BF, NS, BS, HA (Lurie), Sh (Shipley), HK III (Calmès et al.), Sch (Schlichting), Bu (Burklund), BHS (Burklund–Hahn–Senger), PP (Patchkoria–Pstrągowski) and Pst (Pstrągowski). M and TC in prerequisites mean the exact Mathlib and Tau Ceti suppliers above. Names are relative to the topic namespace; `SymmSpectrum` and SHC denote GeneralizedCohomology G2’s supplied symmetric-sphere-module carrier and stable localization, while `naivePi` and `pi` denote its naïve and true homotopy groups. The notation `homotopyFiber f b` denotes its `MappingPathFiber f b`, and `EilenbergMacLaneSpace A n` denotes DGFloer Layer 1 item 4’s CW K(A,n). These are supplier notations, not new carrier definitions.

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

Prove `toTop_boundary_arrowIso_diskBoundaryInclusion`: the realised arrow ∂Δ[n]→Δ[n] is isomorphic to ∂Dⁿ→Dⁿ in `Arrow TopCat`, n≥0. Include the maps in this isomorphism; at n=0 the boundary is empty and the disk a point.

(W IV Def. 3.1.4, p. IV.25; Q §1, LNM p. 89.)

*Needs:* M.

### 1.3 The CW structure on the realisation of a simplicial set

Construct `toTopCWComplex X` for every simplicial set. Nondegenerate n-simplices are its n-cells, with realised characteristic maps; maps preserve skeleta and monos give closed subcomplexes. Under Mathlib's indexing, simplicial skeleton n+1 realises to topological skeleton n.

- `SSet.toTopCWComplex`: The CW structure on |X| over Mathlib’s realisation carrier.
- `SSet.toTopCWComplex_cell_equiv`: n-cells correspond to nondegenerate n-simplices.
- `SSet.toTop_map_cellular`: |f| preserves skeleta.
- A faithful functor injective on objects gives a closed CW subcomplex embedding. Faithfulness alone does not imply injectivity on vertices.
- |X| is Hausdorff.
- A compact subset lies in a finite subcomplex.
- A simplicial mono realises to a closed subcomplex embedding.
- Contractible open sets form a neighbourhood basis.
- B(∐Cᵢ)≅∐BCᵢ, respecting inclusions.

**Checks.**

- `toTopCWComplex_stdSimplex_cells`: The CW structure on |Δ[n]| has exactly C(n+1, k+1) cells of dimension k.
- `toTopCWComplex_point`: |Δ[0]| has exactly one cell, of dimension 0, although Δ[0] has a simplex in every degree.
- `toTopCWComplex_compat_skeleton`: With T2Space (SSet.toTop.obj X), the range of SSet.toTop.map (X.skeleton (n + 1)).ι equals the CW n-skeleton Topology.CWComplex.skeleton univ n.
- `toTopCWComplex_not_all_simplices`: For C the one-object category of a nontrivial group G, the 1-cells of BC are the non-identity elements of G, not all elements of G.

(W IV Def. 3.1.4, p. IV.25; W IV Characterization 3.1 (4)–(5), p. IV.24.)

*Needs:* AlgebraicTopology, §1.2, M.

### 1.4 Realisations are strongly locally contractible

Prove `toTop_stronglyLocallyContractibleSpace`: every point of |X| has a basis of contractible open neighbourhoods, without a local-finiteness assumption, including points incident to infinitely many cells.

(H AT Appendix, Prop. A.4 and proof, p. 522.)

*Needs:* §1.3.

### 1.5 Realisations of monomorphisms are closed subcomplex embeddings

Prove `toTop_map_isClosedEmbedding_of_mono`: a simplicial mono realises to a closed embedding with the nondegenerate-cell subcomplex as image.

(H AT Appendix, discussion before Prop. A.1, pp. 519–520; W IV Characterization 3.1(4), p. IV.24.)

*Needs:* §1.3, M.

### 1.6 Compact sets in a realisation lie in finite subcomplexes

Prove `toTop_isCompact_subset_finite_subcomplex`: every compact K⊆|X| lies in a simplicial subobject with finitely many nondegenerate simplices. Finiteness does not count degeneracies, which occur in unbounded degrees even for a point.

(H AT Appendix, Prop. A.1 and proof, p. 520.)

*Needs:* §1.3.

### 1.7 B(C^op) is canonically homeomorphic to BC

Construct the canonical opposite-space homeomorphism: reverse each arrow string and its affine coordinates, fixing vertices. This gives BC≅B(Cᵒᵖ) without choosing a functor C→Cᵒᵖ.

(Q §1, formula (3), LNM p. 91; W IV p. IV.25.)

*Needs:* §1.1, M.

### 1.8 Classifying space of a product of categories

The projections give a continuous bijection B(C×D)→BC×BD. Prove it is an ordinary-product homeomorphism when either nerve has finitely many nondegenerate simplices; in particular B(C×[1])≅BC×I.

(Q §1, formula (4), LNM p. 92.)

*Needs:* §1.1, M.

### 1.9 Classifying space of a product, compactly generated case

Construct the product homeomorphism for arbitrary small C,D using the compactly generated product. The ordinary product agrees when both categories have countably many arrows.

Use Mathlib’s compactly generated carrier to construct the full subcategory `CGWH` cut out by: every compact Hausdorff image is closed. Its product is k(X×Y), and its mapping object is the k-ified compact-open space. Construct `CGWH.cartesianClosed`, `CGWH.limits` and closed-embedding pushouts `CGWH.closedPushout`; the latter agree with ordinary pushouts. These are category/closure extensions of the carrier. (S, App. A, Def. 2.3 and Props. 2.4–2.5, pp. 421–423; NS, Construction B.6, p. 148, and Proposition C.1, p. 160.)

**Checks.**

- `cgwh_compact_factor`: a compact Hausdorff factor has the ordinary product topology.
- `cgwh_mapping_point`: maps from a point recover Y, with its topology.
- `cgwh_closed_pushout`: gluing two intervals at their endpoints gives the ordinary circle; the closed embedding remains closed in the pushout.

(Q §1, formula (4), LNM p. 92; W IV Characterization 3.1 (6), p. IV.24.)

*Needs:* §1.8, §1.1.

### 1.10 A natural transformation induces a homotopy

For η:F₀→F₁, realise C×[1]→D to construct `classifyingSpace_homotopy η`, with edge(η_c) as its track. A zigzag of transformations gives a map homotopy without requiring invertible components.

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

For a filtered small diagram of small categories, construct `nerve_filteredColimitIso`, respecting every stage inclusion. Finite strings and their equalities occur at a common stage, so the nerve commutes with this colimit degreewise.

(Q §1, before Prop. 3, LNM p. 92.)

*Needs:* M.

### 1.14 Homotopy groups commute with filtered colimits of categories

Prove that πₙ commutes with filtered categorical colimits, with a basepoint represented at a stage and transported along inclusions. Include π₀ as sets; compact spheres and homotopies lie in finite subcomplexes.

(Q §1, Prop. 3, LNM p. 92.)

*Needs:* §1.1, §1.3, §1.13, §1.6, §1.5.

### 1.15 Filtered colimits along homotopy equivalences

If all transitions of a filtered small categorical diagram realise to homotopy equivalences, prove every stage comparison is a homotopy equivalence, by the π₀/πₙ comparison and CW Whitehead.

(Q §1, Prop. 3, Cor. 1, LNM p. 92.)

*Needs:* §1.14, AlgebraicTopology, TC.

### 1.16 Filtered categories are contractible

Prove contractibility of filtered categories: filteredness contracts finite diagrams and hence finite subcomplexes; CW Whitehead upgrades weak contractibility to contractibility.

(Q §1, Prop. 3, Cor. 2, LNM p. 93; W IV Exercise 3.4, p. IV.34.)

*Needs:* §1.15, §1.12.

### 1.17 Homology of classifying spaces commutes with filtered colimits

Prove the filtered-colimit homology comparison for each unital ring R, fixed left coefficient module and n≥0, naturally in filtered small diagrams. Finite chain support and exact filtered module colimits supply the comparison.

(Q §1, Prop. 3 and proof, LNM p. 92; W IV Exercise 3.5, p. IV.34.)

*Needs:* §1.27, §1.13, §1.6, M.

### 1.18 Path components of a classifying space

Construct the component equivalence: components are objects modulo the equivalence relation generated by arrows in either direction. Identify these classes with `CategoryTheory.ConnectedComponents`, with the class of each vertex sent to the corresponding object class. Directed reachability alone is insufficient.

(W IV Lemma 3.3, p. IV.27.)

*Needs:* §1.1, §1.3, §1.6, AlgebraicTopology, M.

### 1.19 Realisations of simplicial coverings are covering maps

Prove `toTop_isCoveringMap` for a simplicial covering with unique simplex lifts after choosing a vertex lift. Identify the fibre at each vertex via open stars; an arbitrary simplicial mono has no such conclusion.

(Q §1 'Coverings of BC and the π₁', LNM p. 90; W IV Exercise 3.1, pp. IV.33–34.)

*Needs:* §1.3, M.

### 1.20 Coverings of BC are morphism-inverting functors

Construct the covering equivalence: coverings of BC correspond to Set-valued functors inverting arrows. F gives B(F.Elements)→BC, fibre F(c) and transport F(f). Recover covering morphisms as well, with explicit universe lifts.

(W IV Exercise 3.1, pp. IV.33–34; Local coefficients 3.5.1, p. IV.29; Q §1 'Coverings of BC and the π₁', Prop. 1, LNM p. 90.)

*Needs:* §1.1, §1.3, §1.19, §1.4, M, TC.

### 1.21 π₁ of BC is the automorphism group in C[C⁻¹]

Construct the fundamental-groupoid equivalence: the universal localisation of C at all arrows is equivalent to Π₁BC through the edge functor. Its automorphism group at c identifies π₁(BC,c); do not merely localise an endomorphism monoid.

(Q §1, Prop. 1, LNM p. 90; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.20, UniversalCovers, §1.1, §1.3, M.

### 1.22 Presentation of π₁(BC) from a maximal tree

For connected C and a rooted maximal tree, prove the presentation of π₁(BC): generators are non-tree edges, tree edges equal 1, and every composable pair gives the two-simplex relation, retaining endpoint data.

- The root-to-X path in T; reverse oppositely traversed edges.
- The tree loop is `treePath(X)⋅edge(f)⋅treePath(Y)⁻¹`.
- Hom(π₁BC,H) corresponds to arrow labels with id↦1, f≫g↦label(g)label(f), and tree edges↦1.
- A homomorphism labels f by its value on treeLoop(f).

(W IV Lemma 3.4 and the group/monoid examples following it, pp. IV.27–28.)

*Needs:* §1.21, M.

### 1.23 Local coefficient systems on BC are morphism-inverting functors

For a ring R, construct an equivalence between local systems on BC and C→ModuleCat R inverting all arrows, by vertex evaluation and edge transport. Arbitrary category-homology coefficients need not invert arrows.

(W IV Local coefficients 3.5.1, p. IV.29; Q §1, after Prop. 1, LNM p. 90.)

*Needs:* §1.21, M, TC.

### 1.24 Homology of a small category with coefficients in a functor

Define `categoryHomology R C M n` from ⊕_(c₀→⋯→cₙ)M(c₀): d₀ applies M(f₁), interior faces compose and the last deletes the final vertex. Normalise the alternating-face complex. Coefficient and categorical maps respect identities/composition at chain level.

- `categoryHomology`: Hₙ of categoryChainComplex(C,M).
- `categoryChainComplex`: Degree `n` is `⊕_{σ∈NₙC}M(σ₀)`, with alternating faces.
- `categoryHomology.map`: A coefficient transformation induces Hₙ maps, preserving id/composition.
- `categoryHomology.mapOfFunctor`: F:C→D gives Hₙ(C,F*M)→Hₙ(D,M), functorially.
- `categoryHomology.longExactSequence`: A short exact coefficient sequence gives the homology LES.
- `categoryHomologyZeroIsoColimit`: H₀(C,M)≅colim M naturally.
- `categoryHomology.normalizedIso`: Normalisation preserves this homology.
- `categoryHomology.constIso`: For constant A, identify the complex with (nerve C).chainComplex A and its homology.
- `categorySimplicialModule`: The simplicial module with the degree-n terms and coefficient face maps.

**Checks.**

- `categoryHomology_zero_eq_colimit_const`: For C connected and M the constant functor at A, categoryHomology C M 0 ≅ A.
- `categoryHomology_of_terminal`: If C has a terminal object t then categoryHomology C M n = 0 for n > 0 and categoryHomology C M 0 ≅ M t.
- `categoryHomology_singleObj_compat`: For C = SingleObj G and M a G-representation, categoryHomology C M n ≅ groupHomology M n (§1.32).
- `categoryHomology_not_cohomology`: For G = ℤ/2 and trivial coefficients ℤ, categoryHomology (SingleObj G) ℤ 2 = 0 while group cohomology H²(G; ℤ) = ℤ/2: homology cannot be replaced by trivial-coefficient cohomology.

(W IV (3.5) The homology of C and BC, p. IV.28; Q §1 'The homology of BC', LNM p. 91.)

*Needs:* M.

### 1.25 Homology of a category computes derived functors of colim

Prove `categoryHomology_derivedColimit`, naturally in M. First construct `categoryModule_projectiveResolutions` for small C by sums of free representables, and identify the augmented bar resolution and its acyclicity.

- `categoryHomology_representable_isZero`: Hₙ₊₁(C,R[C(X,−)])=0.
- `categoryHomologyFunctor`: The functor M↦Hₙ(C,M).
- `categoryColim_additive`: colim on module-valued diagrams is additive.
- `categoryHomology_isDerivedColimit`: Hₙ(C,−)≅Lₙcolim; first construct projective resolutions of diagrams.
- `categoryHomology_isDerivedColimit_naturality`: The comparison commutes with every coefficient transformation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91.)

*Needs:* §1.24, M.

### 1.26 Twisted cellular chains of a category

For morphism-inverting M, construct an isomorphism between twisted cellular chains of BC and normalised category chains. A simplex coefficient is at c₀; d₀ transports by f₁. Verify signs and transport in degrees one and two.

Prove `twistedExcision` for excisive CW triads and arbitrary local systems, and `twistedCellularSingularComparison` for a CW pair: its cellular complex with transported coefficients computes singular relative homology naturally. Skeletal relative groups are sums of the cell fibres; the connecting map gives the transported cellular boundary. These are the twisted extensions required for the category-chain comparison. (H AT, §3.H, pp. 327–329; Q, §1, pp. 89–90.)

**Checks.**

- `twisted_circle`: circle monodromy T gives differential T−1. For T=−1 acting on ℤ this is x↦−2x, rather than +2x.
- `twisted_point`: a point has only degree-zero coefficient homology.
- `twisted_constant`: trivial transport recovers the supplied ordinary cellular comparison.

(Q §1 'The homology of BC', LNM p. 91; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.3, §1.23, §1.24, AlgebraicTopology.

### 1.27 Homology of BC with local coefficients is homology of C

Deduce the local-coefficient homology comparison for small C and morphism-inverting coefficients, naturally in both inputs and all n≥0, using twisted cellular-to-singular comparison and normalisation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91; W IV Local coefficients 3.5.1, p. IV.29.)

*Needs:* §1.24, §1.23, §1.3, AlgebraicTopology, §1.26.

### 1.28 Classifying spaces of translation categories

For a left G-set X, prove `translationCategory_covering`: the projection from the translation category of X (objects x, arrows g:x→g·x) to `SingleObj G` realises to a covering map over BG with fibre X over the vertex, and the lift of edge(g) at x ends at g·x. For X=G there is exactly one arrow between any two objects, so §1.12 contracts the total space; record this as `translationCategory_regular_contractible`. Separately, for a subgroup H, prove `translationCategory_subgroupComparison`: the inclusion of `SingleObj H` at the coset eH is an equivalence onto the translation category of G/H, so §1.11 gives a homotopy equivalence whose composite with the covering is the inclusion-induced map BH→BG. Neither branch uses the supplied classifier.

**Checks.**

- For the trivial group the translation category of X is discrete: the cover is the discrete space X over a point.
- For G=ℤ/2 and X=G the total space is contractible while BG has H₁=ℤ/2, so the regular cover is not a product.
- For g=(01), h=(12) in the symmetric group on Fin 3, lifting edge(g) and then edge(h) from x=2 ends at (hg)(2)=1, not at (gh)(2)=0.

(W IV Translation categories 3.3.1, p. IV.27; Exercise 3.2, p. IV.34.)

*Needs:* §1.18, §1.11, §1.12, §1.19, §1.20, §1.3, M.

### 1.29 Asphericity of the nerve model

Prove `groupNerve_isKOne` from §1.28 alone. The regular cover has contractible total space, so UniversalCovers Stage 3's covering-induced isomorphisms give zero πₙ for n≥2 at every point of the connected space BG. Its fibre G over the vertex, with simply connected total space, identifies π₁ at the vertex with G by edge(g)↦g. Under the π₁ convention of Conventions this is a homomorphism. This gives the asphericity condition of `TauCeti.IsEilenbergMacLaneSpaceOne` before any comparison with the supplied classifier.

**Checks.**

- The trivial group has a one-point nerve realisation, and the condition holds there.
- For G=ℤ the identification sends edge(1) to 1, rather than to −1.
- For g=(01), h=(12) the class of edge(h) followed by edge(g) goes to gh, which differs from hg; an anti-homomorphism would fail this.

(W IV Application 3.4.1, p. IV.28; Translation categories 3.3.1, p. IV.27.)

*Needs:* §1.28, §1.1, §1.20, UniversalCovers Stages 2–4, TC.

### 1.30 Comparing the group nerve with the supplied classifying space

For every group G, construct `groupNerve_classifyingSpaceEquiv` from `B(SingleObj G)` to the ClassifyingSpaces Stage 1 join model. Apply ClassifyingSpaces Stage 3's CW-type uniqueness to the K(G,1) of §1.29, with the CW structure of §1.3. This is a based homotopy equivalence, natural up to specified based homotopies under group homomorphisms. The object and morphism universes are matched with explicit lifts. This comparison concerns the nerve realization rather than constructing another classifying-space functor. Its π₁ map carries edge(g) to g in the supplier's identification; the convention is edge(gh) ≃ edge(h) followed by edge(g). Compare the induced homology map with ClassifyingSpaces Stage 4's bar-resolution comparison; the nerve-to-bar map in §1.32 is a chain isomorphism after normalization, while the join-to-bar map is a chain homotopy equivalence.

The comparison API includes basepoint and map naturality, `groupNerve_classifyingSpaceEquiv_pi1`, `groupNerve_classifyingSpaceEquiv_homology` and the compatibility with the supplied H₁–abelianization isomorphism.

**Checks.**

- For the trivial group the nerve is a point; the join model is contractible, and the comparison is a homotopy equivalence rather than a homeomorphism of the selected models.
- For `G = ℤ`, the comparison preserves the generator of π₁ and the associated H₁ generator. It cannot identify the space with a point.
- For `G = ℤ/2`, the nerve has one nondegenerate cell in each dimension and realizes to `RP^∞`; the comparison preserves the nonzero odd-degree integral homology.
- Conjugate homomorphisms give free homotopies with the specified conjugating track (§1.31); a based homotopy is not asserted.

(W IV Example 3.1.3, p. IV.25; Applications 3.4.1–3.4.2, p. IV.28; ClassifyingSpaces Stages 1.5–1.6, 3.11–3.15 and 4.16–4.19.)

*Needs:* §1.1, §1.3, §1.29, ClassifyingSpaces Stage 3 (CW-type uniqueness) and Stage 4 (group homology).

### 1.31 Conjugate homomorphisms induce freely homotopic maps

For ψ(g)=hφ(g)h⁻¹, construct a free homotopy Bφ≃Bψ with basepoint track edge(h). Conjugation is retained; a based homotopy is not asserted.

(W IV Homotopy-theoretic properties 3.2, p. IV.25.)

*Needs:* §1.10, §1.30, §1.1, TC.

### 1.32 The nerve of a group is the bar construction

Construct the coefficient-preserving `groupNerve_barChainIso` by inverting each bar entry without reversing the tuple. Category d₁(g,a)=g·a−a; pinned bar d₁(g,a)=g⁻¹·a−a. Compute d₂ to fix the h*g interior term.

**Checks.**

- `bar_boundary_low_degree`: The bar boundaries are d₁[g,a]=g⁻¹a−a and d₂[g,h,a]=[h,g⁻¹a]−[gh,a]+[g,a].
- `bar_composition_noncommuting`: For g=(01), h=(12) on Fin 3, (gh)(2)=0 and (hg)(2)=1.
- `bar_inversion_order_three`: on ℤ² let g act by T=((0,−1),(1,−1)), of order three. At e₁ the category boundary is (−1,1), equal to the pinned bar boundary at g⁻¹; the bar boundary at g instead gives (−2,−1).

(W IV Application 3.4.2 and (3.5), p. IV.28.)

*Needs:* §1.24, §1.27, §1.30, M.

### 1.33 The nerve of a groupoid is a Kan complex

Prove `nerve_groupoid_isKan` by inverse-filled outer horns and composition-filled inner horns. For a general category, only the inner-horn property applies.

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
- `IsWeakHomotopyEquivalence.comp`: Weak equivalences satisfy two-out-of-three.
- `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`: A homotopy equivalence is weak.
- Homotopic maps have the same weak-equivalence property.
- Between CW spaces, a weak equivalence admits a homotopy inverse.

**Checks.**

- The identity of any space is a weak equivalence.
- Any map between contractible spaces is a weak equivalence.
- The inclusion of one point into a two-point discrete space is not a weak equivalence (π₀ fails), although it is an isomorphism on all π_n at its basepoint.
- For CW complexes X, Y, f is a weak equivalence iff it is the forward map of a homotopy equivalence.
- S¹⊔*→{a,b} is bijective on components and correct on all π at *. It fails at a circle point: π₁=ℤ maps to zero.

(H AT §4.1, Thm. 4.5, p. 346; H AT §4.1 CW Approximation, p. 352.)

*Needs:* AlgebraicTopology, M, TC.

### 2.2 Serre fibrations induce bijections on relative π-groups

Extend relative homotopy to arbitrary fibre pairs. For Serre p and b=p(e), prove `serreFibration_relativeHomotopy_bijective`: πₙ(E,p⁻¹b,e)→πₙ(B,b) bijective for n≥1, with group compatibility where defined, by disk lifting without an NDR hypothesis.

Construct `relativeDiskLift` using the pair-homeomorphism from a cylinder with bottom and side boundary to a disk cylinder with its bottom. This promotes the Serre disk HLP to relative disk lifting and proves the relative-group comparison even when the fibre inclusion is not NDR. (H AT, proof of Theorem 4.41, pp. 376–377.)

(H AT §4.2, Thm. 4.41 and proof, p. 376.)

*Needs:* AlgebraicTopology.

### 2.3 For a fibration the fibre is the homotopy fibre

For Hurewicz p, prove the strict-fibre inclusion into hofib is a homotopy equivalence; for Serre p, prove a weak equivalence. The stronger result requires HLP for every parameter space.

(H AT §4.3, Prop. 4.65, p. 408.)

*Needs:* GeneralizedCohomology G2.10, §2.5, AlgebraicTopology, §2.6, §2.2, GeneralizedCohomology G2.10, TC.

### 2.4 Connecting map of a homotopy fibre

Construct `homotopyFiber.connecting`: loop shift followed by ω↦(a₀,ω), giving δ:πₙ₊₁B→πₙF. It is a homomorphism for n≥1 and a pointed map at zero; based naturality includes basepoint transports.

- `homotopyFiber.connecting`: δ:πₙ₊₁B→πₙhofib(f).
- `homotopyFiber.connectingHom`: For n≥1, δ is a group homomorphism.
- `homotopyFiber.connecting_naturality`: Strict squares commute with δ.
- `homotopyFiber.connecting_eq_loopShift`: δ is loop-shift followed by the loop inclusion.

**Checks.**

- `connecting_id_eq_zero`: For f = 𝟙 B, connecting is the trivial map.
- `connecting_point_bijective`: For the inclusion of the point b into B, connecting is bijective in every degree (it is the loop-space shift).
- `connecting_basepointChange`: A path δ:a₀→a₁ in the strict fibre changes the boundary by basepoint transport along (δ,const_b). Use the path equivalence in degree zero and its group form in positive degrees.
- `connecting_not_hom_degree_zero`: For Σ₂⊂Σ₃ the boundary is g↦gΣ₂. It cannot be a group homomorphism because Σ₂ is not normal; π₀ of the fibre is only a pointed set.

(W IV Homotopy Fiber 1.2, p. IV.3; H AT §4.3, p. 407.)

*Needs:* GeneralizedCohomology G2.10, M, TC.

### 2.5 Long exact sequence of a homotopy fibre

For every based continuous map, prove exactness at the recurring πₙF,πₙA,πₙB terms and π₀A. The π₀F end is a pointed-set sequence with the following π₁ action, not an abelian-group LES.

(H AT §4.2, Thm. 4.41, p. 376; W IV Homotopy Fiber 1.2, p. IV.3; Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, §2.4, GeneralizedCohomology G2.10, AlgebraicTopology, §2.2, GeneralizedCohomology G2.10, TC.

### 2.6 The π₁-action at the pointed-set end of the fibre sequence

Identify the supplied low-degree π₁(B,b) action on π₀F by appending loops. Its orbits are fibres of π₀F→π₀A; the constant-path stabiliser is im(π₁A→π₁B). Under the chosen multiplication, appending ω acts on the left by [ω].

(W IV Homotopy Fiber 1.2, p. IV.3; W IV Exercise 3.3, p. IV.34.)

*Needs:* §2.5.

### 2.7 Transport of homotopy fibres along paths in the base

Define `homotopyFiber.transport f ω` by (a,γ)↦(a,γ⋅ω). Its specified inverse is transport along ω⁻¹; path homotopy and concatenation give the homotopies. Boundary naturality includes the path between transported and selected fibre basepoints.

- `homotopyFiber.transport`: Along ω:b→b′, send (a,γ) to (a,γ⋅ω).
- `homotopyFiber.transportHomotopyEquiv`: The inverse up to homotopy is transport along ω⁻¹.
- `homotopyFiber.transport_homotopic`: Endpoint-fixed path homotopies give homotopic transports.
- `homotopyFiber.transport_trans`: Transport(ω⋅ω′)≃transport(ω′)∘transport(ω); constant transport≃id.
- `homotopyFiber.connecting_transport`: For σ:a₀→a₁ and ω=fσ, δ at a₁ after basepoint change along ω equals transported δ at a₀, then fibre basepoint change along (σ(t),ω|[t,1]), including the initial concatenation reparametrisation.

**Checks.**

- `transport_refl_homotopic_id`: transport f (Path.refl b) is homotopic to the identity.
- `transport_loopSpace`: For the inclusion of the point b, transport along a loop ω is γ ↦ γ.trans ω on Ω B b; on π₀(Ω B b) ≅ π₁(B, b) it is left multiplication by [ω] in Mathlib's group structure.
- `transport_comm_proj`: proj ∘ transport f ω = proj.
- `transport_not_identity_onPi0`: For BH → BG and a loop g ∉ H, transport acts on π₀(homotopyFiber) = G/H nontrivially; transport is not the identity on π₀.

(H AT §4.3, Prop. 4.61, p. 405.)

*Needs:* GeneralizedCohomology G2.10, §2.4, M, TC.

### 2.8 Homotopy pullbacks and homotopy-cartesian squares

Define the path pullback by (a,γ,c), γ:f(a)→g(c). A strict square's constant-path comparison defines `IsHomotopyCartesian`; a chosen commuting homotopy defines `IsHomotopyCartesianOfHomotopy`. Give projections, functoriality and fibration pullback comparison.

- `homotopyPullback`: Triples (a,γ,c), γ:f(a)→g(c).
- `homotopyPullback.fst`: The projections carry the track γ between their composites.
- `homotopyPullback.symm`: Swap a,c and reverse γ.
- `IsHomotopyCartesian`: The strict-square comparison to the path pullback is weak.
- `homotopyPullback.point_eq_homotopyFiber`: Pullback against a point b is hofib(f,b).
- `IsHomotopyCartesian.of_serreFibration`: A strict pullback of a Serre fibration is homotopy-cartesian.

**Checks.**

- `homotopyPullback_point_point`: homotopyPullback (point b) (point b) is the loop space Ω B b.
- `isHomotopyCartesian_id`: For any map p : E → B, the square with E′ = E, B′ = B, α = id, h = id and p′ = p is homotopy-cartesian (the comparison is the inclusion of E into the mapping path space of p).
- `isHomotopyCartesian_iff_fiber`: For B′ contractible, the square is homotopy-cartesian iff E′ → homotopyFiber p (h b′) is a weak equivalence (§2.9).
- `not_isHomotopyCartesian_strictFiber`: For a proper subgroup H ⊂ G the square (strict fibre point → BH over point → BG) is not homotopy-cartesian.

(Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, §2.1, GeneralizedCohomology G2.10, §2.3, §2.5, §2.6, AlgebraicTopology.

### 2.9 Homotopy-cartesian squares over a contractible base

For contractible B, prove the compactly generated path pullback of A→B←C is homotopy equivalent to A×C, with chosen contraction/endpoint data. A square is homotopy-cartesian exactly when its product comparison is weak. Separately, for a square E′→E over B′→B with contractible B′ and a chosen b′, prove `homotopyCartesian_contractible_sourceCorner`: its comparison E′→E×ᴴ_B B′ is weak exactly when the induced E′→hofib(E→B,h(b′)) is weak. Contracting B′ and retaining the specified square homotopy gives this identification; it does not require B to be contractible.

(Q §1 'The exact homotopy sequence', LNM pp. 96–97.)

*Needs:* §2.8, §2.7.

### 2.10 Pasting homotopy-cartesian squares

Prove homotopy-cartesian pasting: both squares imply the rectangle; given the right square, the left and outer rectangle conditions are equivalent. For homotopy-commuting squares use the concatenated chosen homotopies.

(Q Proof of Thm. B, LNM p. 99.)

*Needs:* §2.8, §2.5, §2.6, GeneralizedCohomology G2.10, §2.1, §2.3.

### 2.11 From comma categories to homotopy fibres

Construct the forward-arrow comparison `costructuredArrowToHomotopyFiber`: B(F↓d)→hofib(BF,[d]), with projection c and path F(c)→d. Its covariant change agrees with forward transport. The dual `commaToHomotopyFiber` uses d↓F and reversed paths.

- `commaToHomotopyFiber`: B(Y\\f)→hofib(Bf,[Y]), reversing the arrow track.
- `commaToHomotopyFiber_proj`: Its projection is B(StructuredArrow.proj).
- `commaToHomotopyFiber_naturality`: For u:Y→Y′, comma change and transport along edge(u)⁻¹ give homotopic comparisons.
- `costructuredArrowToHomotopyFiber`: B(f/Y)→hofib(Bf,[Y]) uses the forward arrow track.
- `commaToHomotopyFiber_fiberToComma`: On the strict category fibre, the comparison agrees up to homotopy with x↦(x,const).

**Checks.**

- `commaToHomotopyFiber_id`: For f = 𝟭 C′ both source and target are contractible, so commaToHomotopyFiber is a weak equivalence.
- `commaToHomotopyFiber_subgroup`: For H⊂G, ∗\f is the H-action groupoid on G. Its components are Hv; the fibre components are v⁻¹H. The comparison sends Hv↦v⁻¹H and every component is contractible.
- `commaToHomotopyFiber_fiber_compat`: Restricted to the strict fibre f⁻¹(Y) ⊆ Y\f (objects (X, id)), it agrees with homotopyFiber.ofFiber.
- `commaToHomotopyFiber_not_equiv`: For {0}→(0<1), 1\f is empty but the fibre at 1 is contractible. Theorem B’s hypothesis is essential.

(W IV Example 3.2.3, p. IV.26; Q §1, LNM p. 96.)

*Needs:* GeneralizedCohomology G2.10, §1.10, §2.7, §1.8, M.

### 2.12 Quasi-fibrations

Define `IsQuasiFibration p` by every strict-fibre comparison being weak. Prove the relative-homotopy characterisation, Serre implication and distinguished-subspace path-pullback comparison. This condition does not supply a continuous lifting function.

- `IsQuasiFibration`: Every strict-fibre comparison is weak.
- `IsQuasiFibration.of_serreFibration`: Serre fibrations are quasifibrations.
- `IsQuasiFibration.longExactSequence`: The homotopy-fibre LES becomes the strict-fibre LES.
- `IsQuasiFibration.iff_relative`: For surjective p and path-connected B, equivalently all πᵢ(E,p⁻¹b)→πᵢ(B,b) are bijective, with the low-degree pointed-set clauses.

**Checks.**

- `isQuasiFibration_prod_fst`: The projection B × F → B is a quasi-fibration.
- `isQuasiFibration_mappingCylinder_iff`: The projection of the mapping cylinder of f onto I is a quasi-fibration iff f is a weak equivalence.
- `isQuasiFibration_id`: The identity of any space is a quasi-fibration.
- `not_isQuasiFibration_two_intervals`: The map [0, 1/2] ⊔ [1/2, 1] → [0, 1] given by the two inclusions is not a quasi-fibration: its homotopy fibres are all two points, but its fibre over 0 is one point.

(H AT §4.K 'Quasifibrations', p. 479; Q §1, lemma preceding 'Proof of Thm. B', LNM p. 97.)

*Needs:* GeneralizedCohomology G2.10, §2.1, §2.3, §2.5, AlgebraicTopology.

### 2.13 Relative π-groups of excisive triads

For excisive triads (X;A,B) and (Y;C,D), let f carry A into C and B into D. If f gives bijections of both relative homotopy sets/groups πᵢ(A,A∩B)→πᵢ(C,C∩D) and πᵢ(B,A∩B)→πᵢ(D,C∩D) for i<n and surjections for i=n, at every basepoint, prove the same assertions for πᵢ(X,A)→πᵢ(Y,C), and symmetrically for the other pair. Interiors of A,B and C,D cover their respective spaces. Keep the low-degree pointed-set clauses and arbitrary-pair homotopy interfaces.

(H AT §4.K, Prop. 4K.1 and proof, pp. 476-478; May, Cor. 2.3, p. 94.)

*Needs:* AlgebraicTopology.

### 2.14 Dold–Lashof criterion for open covers

Prove the open-cover quasifibration criterion: if B is covered by open sets and the restriction over each finite intersection is a quasifibration, the whole map is a quasifibration. Begin with B=U∪V and restrictions over U,V,U∩V, then use the excisive-triad comparison for arbitrary covers. No numerability condition is needed in this criterion; none of the intersection hypotheses can be silently omitted.

**Checks.**

- `open_cover_intersection`: The intersection restriction must be distinguished as well as the two separate restrictions.

(H AT §4.K, Lemma 4K.3, p. 480; H AT §4.K, proof of Lemma 4K.3, p. 480; May, Cor. 2.4, p. 95.)

*Needs:* §2.12, §2.13, AlgebraicTopology.

### 2.15 Dold–Lashof criterion for exhaustions

Prove `IsQuasiFibration.of_exhaustion` for B=⋃Bₙ with each Bₙ distinguished and every compact subset contained at a finite stage. Require the compact homotopy factorisation in E; weak topology/compact support ensures relative representatives occur at a stage.

(H AT §4.K, Lemma 4K.3(b) and proof, p. 480; May, Thm. 2.6, p. 95.)

*Needs:* §2.12, §2.1.

### 2.16 Dold–Lashof criterion for deformations

Prove `IsQuasiFibration.of_deformation` for compatible E,B deformations into preserved E′,B′. Require p|E′ quasifibred, pD_E=D_Bp and every terminal fibre map a weak equivalence.

(H AT §4.K, Lemma 4K.3(c) and proof, pp. 480-481; May, Lem. 2.5, p. 95.)

*Needs:* §2.12, §2.1, §2.5, AlgebraicTopology.

### 2.17 Realisation of simplicial spaces and bisimplicial sets

Construct simplicial-space coend realisation and its singular adjoint, agreeing with SSet on discrete levels. For bisimplicial sets give iterated realisation, diagonal, transpose and external product, preserving the inclusions and naturality in compactly generated spaces.

- `SimplicialSpace.realization`: The coend ∫ⁿ Xₙ×Δⁿ.
- `SimplicialSpace.realizationAdj`: Realisation is left adjoint to Y↦C(Δⁿ,Y).
- `SimplicialSpace.realization_discrete`: Levelwise discrete realisation agrees with |X|.
- `BisimplicialSet.realization`: Iterated realisation of p↦|Tₚ|.
- `BisimplicialSet.diagonal`: The diagonal n↦Tₙ,ₙ.
- `SimplicialSpace.realization_preservesColimits`: Realisation preserves colimits.

**Checks.**

- `realization_const`: The realisation of the constant simplicial space at Y is homeomorphic to Y.
- `realization_box_stdSimplex`: For the bisimplicial set Δ[r] ⊠ Δ[s], the realisation is homeomorphic to Δ^r × Δ^s.
- `realization_discrete_compat`: For a simplicial set X, the realisation of the discrete simplicial space is SSet.toTop.obj X.
- `bisimplicial_diagonal_not_mathlib_diagonal`: The diagonal of Δ[1]⊠Δ[1] has four vertices. Mathlib’s single-object long-edge map Xₙ→X₁ is a different operation.

(Q §1, Lemma preceding the proof of Thm. A, LNM p. 94; W IV Def. 3.6, p. IV.29.)

*Needs:* §1.8, M.

### 2.18 Diagonal and iterated realisation

Construct the `BisimplicialSet.diagonalRealizationIso` with iterated realisation, compatible with transposition. Prove the compactly generated bisimplicial-space version using the simplex-product homeomorphism.

(Q §1, Lemma preceding the proof of Thm. A, LNM pp. 94–95; W IV Def. 3.6, p. IV.29.)

*Needs:* §2.17, §1.8.

### 2.19 Proper simplicial spaces

Define `SimplicialSpace.IsProper` by closed Hurewicz-cofibration latching inclusions. Latching means the degeneracy-image union with induced topology, empty at zero. Use the HEP supplier on the image of each closed latching embedding; discrete levels and one-direction bisimplicial realisation are proper.

- `SimplicialSpace.latching`: The degeneracy-image union in Xₙ and its inclusion.
- `SimplicialSpace.IsProper`: All latching inclusions are closed Hurewicz cofibrations.
- `SimplicialSpace.isProper_discrete`: Levelwise discrete objects are proper.
- `SimplicialSpace.isProper_realization_bisimplicial`: Realising one direction of a bisimplicial set gives a proper simplicial space.

**Checks.**

- `isProper_const`: A constant simplicial space at Y is proper: in degree 0 its latching inclusion is ∅ → Y, and in positive degrees it is the identity of Y; both have the homotopy extension property.
- `isProper_nerve_discrete_category`: The nerve of a category viewed as a discrete simplicial space is proper.
- `isProper_compat_bisimplicial`: For a bisimplicial set `T`, the latching subspace of `p ↦ |T_{p,•}|` in degree `n` is the realisation of the simplicial subset of degenerate `(n, •)`-simplices, a subcomplex.
- `not_isProper_bad_degeneracy`: Take X₀=* and X₁={0}∪{1/k:k≥1}, with s₀(*)=0. The point inclusion has no neighbourhood deformation: each 1/k is its own path component. This 1-skeletal simplicial space, and its free extension to a simplicial space, fail properness in degree one.

(NS Appendix C, paragraph before Prop. C.3, p. 161.)

*Needs:* §2.17, AlgebraicTopology.

### 2.20 Realisation of simplicial spaces preserves finite limits

Prove `SimplicialSpace.realization_finiteLimits` in compactly generated weak Hausdorff spaces: realisation preserves terminal objects, binary products and equalisers, hence all finite limits. Give the product and pullback comparison maps and naturality. This claim concerns the coend realisation with compactly generated topology and does not make the ordinary TopCat product automatically correct.

(NS Appendix C, Prop. C.1, p. 160.)

*Needs:* §2.17.

### 2.21 The gluing lemma for pushouts along h-cofibrations

Prove `closedHEP.gluingLemma` for maps of pushout diagrams of compactly generated weak Hausdorff spaces. Require the attaching maps in both diagrams to be closed Hurewicz cofibrations and the three vertical maps to be weak equivalences. Then their pushout map is a weak equivalence. All maps commute with the attaching maps; an arbitrary quotient need not preserve a weak equivalence.

(NS Appendix C, Lemma C.2 (Gluing Lemma), p. 161.)

*Needs:* §2.1, AlgebraicTopology.

### 2.22 Pushout products of h-cofibrations (Strøm's product theorem)

Prove `closedHEP.pushoutProduct`: the inclusion (A×Y)∪(X×B)→X×Y is a closed Hurewicz cofibration when A→X and B→Y are closed Hurewicz cofibrations in the chosen compactly generated category. The product topology and the closedness hypotheses are part of the assertion.

(NS Appendix C, proof of Prop. C.3, p. 161.)

*Needs:* AlgebraicTopology.

### 2.23 Weak equivalences of proper simplicial spaces

Prove `SimplicialSpace.realization_weakEquiv`: a levelwise weak equivalence between proper compactly generated simplicial spaces realises to a weak equivalence, by skeletal gluing and compactness. Both properness hypotheses are required.

(NS Appendix C, Prop. C.3, p. 161; W IV Thm. 3.6.1(i), p. IV.29.)

*Needs:* §2.19, §2.21, §2.18, AlgebraicTopology, §2.1, §2.22.

### 2.24 Realising levelwise homotopy fibre sequences

Prove `realization_fibreSequence_connected`: a map of proper simplicial spaces with compatible simplicial basepoints, levelwise homotopy-fibre sequences and connected base/fibre levels realises to a fibre sequence.

(W V Prop. 1.7 and proof, p. V.8; BF Appendix B, Thm. B.4 and following connectedness observation, p.121.)

*Needs:* §2.23, §2.12, §2.14, GeneralizedCohomology G2.10, §2.18, §2.15, §2.16.

### 2.25 The π_*-Kan fibre-square theorem

For a square V→X over W→Y of bisimplicial sets, assume every vertical row is homotopy-cartesian, X and Y are π_*-Kan and π₀X→π₀Y is a Kan fibration. Prove `bisimplicialFibreSequence_piStarKan`: its diagonal square is homotopy-cartesian. Define `PiStarKan` by the following horn condition: for m,t≥1, a∈X_(m,0) and k≤m, every compatible family ξᵢ∈πₜ(X_(m−1,*),dᵢa), i≠k, lifts to ξ∈πₜ(X_(m,*),a) with dᵢξ=ξᵢ. Define these groups using vertical Kan replacement. Row-connected X satisfies this condition; π₀-fibration is a separate assumption in the disconnected case.

**Checks.**

- `piStarKan_connected`: a bisimplicial set with connected vertical rows satisfies the horn condition, by transport to a degeneracy of a zero-row basepoint.
- `piStarKan_group`: a bisimplicial group satisfies the condition through simplicial-group horn filling.
- `piStarKan_discrete_rows`: a bisimplicial set constant vertically on a simplicial set K has zero positive row homotopy groups and satisfies this condition even when K is not Kan. Thus the separate Kan-fibration condition on π₀ in the square theorem cannot be inferred from it.

(W V Prop. 1.7 and proof, p. V.8; BF Appendix B, §B.3, criterion B.3.1 and Thm. B.4, pp. 119–121; proof pp. 121–128.)

*Needs:* GeneralizedCohomology G2.10, §2.23, §2.18, AlgebraicTopology.

### 2.26 Bousfield–Kan homotopy colimit of a diagram of spaces

Define `SpaceDiagram.hocolim X` by realising ⊔_(c₀→⋯→cₙ)X(c₀), for small C and compactly generated values. In degree one d₀ applies X(f), d₁ retains the source point. Give its cocone, functorial maps and terminal-object comparison.

- `hocolim`: Realise strings i₀→⋯→iₙ weighted by X(i₀).
- `hocolim.toNerve`: Forget the coefficient point to map to BI.
- `hocolim.map`: Transformations induce hocolim maps, preserving id/composition.
- `hocolim.isWeakHomotopyEquivalence_map`: Objectwise weak equivalences induce weak hocolim maps for compactly generated Hausdorff values.
- `hocolim.const_point`: The constant-point hocolim is BI.
- `hocolim.toColimit`: The augmentation to colim X.

**Checks.**

- `hocolim_const_point`: hocolim I (const point) is homeomorphic to classifyingSpace I.
- `hocolim_terminal`: If I has a terminal object t, hocolim I X → X t is a homotopy equivalence.
- `hocolim_discrete_grothendieck`: For X : I ⥤ Type viewed as discrete spaces, hocolim I X ≅ classifyingSpace (Grothendieck X).
- `hocolim_ne_colim_span`: For the span point ← S⁰ → point, colim is a point but hocolim is the suspension of S⁰, i.e. S¹.

(NS Appendix C, Def. C.4 and Prop. C.5, p. 162; Q §1, lemma preceding 'Proof of Thm. B', LNM pp. 97–98.)

*Needs:* §2.17, §2.19, §2.23.

### 2.27 Realisation of a proper simplicial space is its homotopy colimit

For proper simplicial X, construct the `SimplicialSpace.realization_hocolimEquiv` over Δᵒᵖ, respecting the cocone. Properness ensures the ordinary coend computes the derived colimit. Construct `replacementAugmentation` from the simplicial replacement and compare its double realisation with |X| by the extra-degeneracy contraction and skeletal gluing. This supplies the comparison directly, without assuming an unstated Reedy model structure.

(NS Appendix B, Lemma B.7 with proof and footnote 44, p. 149 (arXiv pagination; p. 386 in Acta Math.).)

*Needs:* §2.19, §2.23, §2.26, §2.1.

### 2.28 Quasifibrations over a nerve

For X:C→spaces sending all arrows to weak equivalences, prove `SpaceDiagram.hocolim_to_classifyingSpace` is a quasifibration with fibre X(c) at each vertex, for the simplicial-replacement projection.

(Q §1, lemma and proof preceding 'Proof of Thm. B', LNM pp. 97–98; W IV Thm. 3.6.1(ii), p. IV.29.)

*Needs:* §2.26, §2.12, §2.14, §2.8, §2.15, §2.16, §1.3.

### 2.29 Thomason’s homotopy-colimit comparison

For F:C→Cat, construct the natural weak equivalence `thomasonMap`: hocolim B(Fc)→B(∫F), agreeing on each fibre inclusion. In degree one it sends a base arrow f:c→d and x∈F(c) to (f,id):(c,x)→(d,F(f)x); the reverse arrow is not the canonical comparison. The Grothendieck construction retains its specified (c,x) objects and F-defined arrows.

**Checks.**

- `thomason_point_index`: a one-object one-arrow indexing category gives B(F(*)) on both sides, with identity comparison.
- `thomason_constant_point`: constant terminal fibres give BC on both sides, with the base projection identifying the comparison with identity.
- `thomason_forward_edge`: over [1], the edge attached to x∈F(0) goes from (0,x) to (1,F(0→1)x), with fibre arrow the identity. Reversing the comparison does not give this canonical edge map.

(Kahn Thm. 1.4.3 and Lemma 1.4.5, pp. 6–7.)

*Needs:* §2.26, §1.11, M.

### 2.30 The homology spectral sequence of a functor

Construct `functorHomologySpectralSequence`: E²_p,q=H_p(D;d↦H_q(F↓d;M))⇒H_p₊q(C;M), using covariant comma transport. State the twisted version with coefficient pullback/invertibility; first-quadrant filtration gives convergence.

(W IV Exercise 3.7, p. IV.34; Kahn Cor. 1.4.6, p. 7.)

*Needs:* §1.24, §1.12, M.

### 2.31 Quillen's Theorem A

Prove `quillenTheoremA` for small F:C→D: contractibility of every B(F↓d) makes BF a homotopy equivalence by CW Whitehead. Give its opposite-category dual.

(Q §1, Thm. A, LNM p. 93; proof LNM pp. 95–96; W IV 3.7 Quillen's Thm. A with proof, p. IV.30.)

*Needs:* §2.18, §2.23, §2.28, §1.12, §1.7, M.

### 2.32 Quillen's prefibred functors are SGA 1 prefibered functors

Prove `prefibred_comma_adjunction`: Quillen's prefibred condition is the SGA 1 condition that each strict-fibre inclusion in its comma category has a right adjoint compatible with projection. Do not strengthen it to arbitrary cartesian lifting.

(W IV Fibered and Cofibered functors 3.7.3, p. IV.31; Q §1, LNM p. 93.)

*Needs:* §1.11, M.

### 2.33 Theorem A for prefibred and precofibred functors

For prefibred F, contractible strict fibres imply Theorem A by fibre-to-comma adjunctions; give the precofibred dual. The fibres are nonempty.

(W IV Cor. 3.7.4, p. IV.31.)

*Needs:* §2.31, §2.32.

### 2.34 Quillen's Theorem B

For small F:C→D, prove `quillenTheoremB`: if every d→d′ gives a homotopy equivalence B(F↓d)→B(F↓d′), its constructed comparison to hofib(BF,d) is weak. State the homotopy-cartesian square with the forward-arrow path and naturality. The theorem in `Suggested.lean` states a weak comparison preserving the projection up to homotopy on `TauCeti.MappingPathFiber`, the endpoint-constrained path subspace. The Lean forms of A and B use a common object universe containing the morphism universe, as required by Mathlib’s `nerveMap`; arbitrary object/morphism universes use the explicit `ULift` comparisons of §1.1.

(Q §1, Thm. B and Corollary, LNM p. 97; proof LNM pp. 98–99; W IV 3.8 Quillen's Thm. B with proof, p. IV.31.)

*Needs:* §2.31, §2.28, §2.8, §2.10, §2.11, §2.5, §2.9, §1.12.

### 2.35 Theorem B for prefibred functors

For prefibred F with homotopy-equivalent base-change functors on strict fibres, deduce Theorem B from the strict fibres. Use the fibre inclusion and basepoint path; nonempty fibres alone do not suffice.

(W IV Cor. 3.8.1, p. IV.32.)

*Needs:* §2.34, §2.32, §2.11.

### 2.36 Classifying spaces of a group extension form a fibre sequence

For surjective G→Q with kernel N, prove BN→BG→BQ is a homotopy-fibre sequence with π₁ sequence N→G→Q. For a nonsurjective map, its homotopy fibre has extra coset components.

(W IV Exercise 3.6(c), p. IV.34.)

*Needs:* §2.35, §1.30.

### Examples

The fibre of an identity is contractible, while the fibre of a point mapping to X is ΩX. For a projection A × B → B, transport has the endpoint direction. A proper simplicial object and a merely levelwise equivalence are distinguished by the degeneracy cofibration hypotheses. The group-extension comparison uses a surjection with the kernel.

### Dependencies

Layer 1 and ordinary topology; properness, fibre hypotheses and CGWH products for realisation.

## Layer 3: Acyclic maps and the plus construction

### 3.1 Acyclic spaces

Define `IsAcyclicSpace F`: F is nonempty and path-connected, with Hₙ(F;ℤ)=0 for n>0, equivalently the augmentation induces homology isomorphisms. Apply this predicate to all homotopy fibres; positive homology vanishing alone admits the empty space.

- `IsAcyclicSpace`: Nonempty and H̃ₙ(F;ℤ)=0 for all n≥0.
- `IsAcyclicSpace.pathConnected`: An acyclic space is path-connected.
- Contractible spaces are acyclic.
- Homotopy equivalence preserves acyclicity.
- For an acyclic space of CW type as in §3.2, π₁ is superperfect.

**Checks.**

- A one-point space is acyclic.
- The empty space is not acyclic (H₀ = 0 ≠ ℤ in reduced homology convention: reduced H₋₁ ≠ 0).
- The circle is not acyclic: H₁(S¹; ℤ) = ℤ.
- There exists an acyclic space with nontrivial fundamental group.
- `puncturedPoincareSphere`: construct the binary icosahedral subgroup Γ⊂SU(2), identify Γ≅SL₂(𝔽₅), and use SU(2)≅S³ to obtain its free left action. Its image in SO(3) is A₅. Form the oriented quotient manifold S³/Γ and prove that it is a homology 3-sphere. For a selected point, construct the puncture carrier; excision and the local orientation class prove acyclicity, and van Kampen preserves π₁≅Γ. (W IV Exercise 1.1, p. IV.14; H AT §1.3, p. 75, for the free unit-quaternion action and binary polyhedral subgroups.)
- IsAcyclicSpace F holds whenever ContractibleSpace F (Mathlib).

(W IV Def. 1.3, p. IV.4.)

*Needs:* M; for the homology-sphere and puncture construction, AlgebraicTopology Stage 1's van Kampen, Stage 3's excision and Stage 6's local orientation classes and manifold duality, and UniversalCovers' quotient-cover and deck-group comparisons.

### 3.2 An acyclic space has perfect π₁ with vanishing H₂

For acyclic F of CW type, prove superperfectness of its fundamental group: π₁F is perfect with H₂(π₁F;ℤ)=0, by degree-one Hurewicz and the universal-cover fibration. Its π₁ need not be trivial.

(W IV Lemma 1.3.1 with proof, p. IV.4.)

*Needs:* §3.1, §1.29, §2.5, AlgebraicTopology, AlgebraicTopology stage 8, DGFloer Layer 1 item 4, §1.32, M.

### 3.3 Acyclic maps

Define `IsAcyclicMap f` by acyclicity of every hofib(f,y). Give identity, composition, homotopy invariance and descent. For connected CW spaces this is equivalent to homology isomorphisms for all pulled-back target local systems.

- `IsAcyclicMap`: Every homotopy fibre is acyclic.
- The induced map π₁f is surjective for connected spaces.
- Its kernel is perfect normal.
- `IsAcyclicMap.comp`: Composites remain acyclic.
- `IsAcyclicMap.iff_homology`: For connected CW spaces, equivalently f is a homology isomorphism for every local system pulled back from Y.

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

For a connected CW regular G-cover, construct `regularCover_twistedChainIso`: twisted chains are C_*(X′;ℤ)⊗_(ℤ[G])M, using inverse deck action on the right and M on the left. This is natural; passing tensor through homology additionally requires flatness.

(H AT §3.H, Prop. 3H.4, p. 331.)

*Needs:* AlgebraicTopology, UniversalCovers.

### 3.6 Serre comparison on fibres

Prove `serreComparison_fibre`: a map of Serre fibrations with connected fibres, connected CW bases and trivial integral fibre-homology monodromy has a fibre homology isomorphism if the base and total maps do. Use the first-quadrant Serre comparison. In the proof compare the relative Serre spectral sequences and take the least degree where the fibre comparison fails: connectedness identifies the bottom column, so this first failure cannot be cancelled by higher rows.

(H SS 1, Prop. 1.12, p. 20. Its printed proof omits the base-and-total-to-fibre implication; the relative spectral-sequence argument just specified is the additional proof obligation.)

*Needs:* AlgebraicTopology, GeneralizedCohomology G2.10.

### 3.7 Acyclic maps are local-coefficient homology isomorphisms

Prove `IsAcyclicMap.iff_homology` for connected CW spaces. The forward Serre sequence collapses; the converse recovers π₁ surjectivity via regular-cover coefficients and applies fibre comparison over a simply connected base. All target local systems are required. The statement in `Suggested.lean` uses Tau Ceti’s induced twisted homology maps for every target local system over every unital ring and includes spaces of CW type.

- For connected CW spaces, acyclic f and gf imply acyclic g.

(W IV Lemma 1.6 with proof, p. IV.5.)

*Needs:* §3.3, GeneralizedCohomology G2.10, AlgebraicTopology, UniversalCovers, §3.6, §3.5, §2.8.

### 3.8 Plus constructions as acyclic maps

Define the recognition predicate `IsPlusConstruction f x P` on based maps by acyclicity and ker(π₁f)=P. This predicate can be evaluated on arbitrary spaces; the geometric construction and uniqueness targets use the standing connected CW-type hypotheses. Identify the quotient and local-homology maps under these hypotheses. Construct `perfectRadical G`, the largest perfect subgroup, prove normality/maximality and preservation under homomorphisms. Its API includes `perfectRadical_isPerfect`, `perfectRadical_normal`, `le_perfectRadical` for every perfect subgroup, `perfectRadical_map_le` for homomorphisms, and `perfectRadical_idempotent`. Derive homomorphism functoriality by applying maximality to the perfect image of the radical.

- `IsPlusConstruction`: Acyclic f with ker(π₁f)=P.
- `perfectRadical`: The subgroup generated by all perfect subgroups is perfect and normal.
- The induced quotient isomorphism π₁X/P≅π₁Y.
- Homology is preserved for every quotient local system.

**Checks.**

- The identity is plus at the trivial subgroup.
- A map f is a plus construction relative to the trivial subgroup iff f is a weak equivalence (§3.9).
- For X acyclic, X → point is a plus construction relative to π₁(X).
- `perfectRadical_perfect_group`: for a perfect group such as A₅, the radical is the whole group.
- `perfectRadical_abelian`: for an abelian group such as ℤ, the radical is trivial.
- `perfectRadical_product`: for A₅×ℤ the radical is A₅×{0}; the nonperfect factor must survive the quotient.
- No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect.

(W IV Def. 1.4.1, p. IV.5, for plus recognition; Remark 1.5.1, p. IV.5, and Exercise 1.5, Perfect Radicals, p. IV.14, for the radical and its basic API.)

*Needs:* §3.3, M.

### 3.9 Acyclic maps that are isomorphisms on π₁

Prove that an acyclic map from a connected source, bijective on π₁, is a weak homotopy equivalence: the fibres are weakly contractible. With CW-type source/target, deduce a homotopy equivalence.

(W IV Exercise 1.2(b), p. IV.14; H AT §4.3 Exercise 16, p. 420.)

*Needs:* §3.3, §3.2, §2.5, AlgebraicTopology, M.

### 3.10 The plus construction by attaching 2- and 3-cells

For connected CW X and perfect normal P⊲π₁X, construct `plusConstruction X x P` by 2-cells killing P and 3-cells cancelling relative classes. The relative free ℤ[π₁X/P] complex in degrees 3,2 has identity differential, ensuring every quotient local-system comparison.

The existence statement in `Suggested.lean` is `plus_exists`.

- `plusConstruction`: Attach only 2- and 3-cells to kill P with acyclic inclusion.
- `plusConstruction.incl`: The subcomplex inclusion X→X⁺ₚ.
- `plusConstruction.isPlusConstruction`: The inclusion satisfies IsPlusConstruction.
- `plusConstruction.relCW`: The relative CW cells have dimensions 2 and 3.
- `plusConstruction.pi1Equiv`: π₁X⁺ₚ≅π₁X/P.

**Checks.**

- `plusConstruction_bot`: For P = ⊥, plusConstruction.incl X ⊥ is a homotopy equivalence.
- `plusConstruction_acyclic_contractible`: If X is acyclic, plusConstruction X π₁(X) is contractible (Weibel IV Exercise 1.2(a)).
- `plusConstruction_perfect_group_simplyConnected`: For a perfect group G, plusConstruction (BG) ⊤ is simply connected with the same integral homology as BG, and π₂ ≅ H₂(G; ℤ) by Hurewicz (Tau Ceti AlgebraicTopology stage 8).
- `plusConstruction_not_unique_on_nose`: Different admissible cell choices give plus spaces homotopy equivalent under X; they are not equated as selected spaces.

(H AT §4.2, Prop. 4.40 with proof and the construction following it, p. 374; W IV Exercise 1.4, p. IV.14; Thm. 1.5(1), p. IV.5.)

*Needs:* §3.8, UniversalCovers, AlgebraicTopology.

### 3.11 π₁ of the plus construction

Under the connected CW/perfect-normal hypotheses, prove `plusConstruction.ker_pi1` and `pi1Equiv`, carrying the inclusion's basepoint and identifying its induced map with the quotient map.

(H AT §4.2, construction after Prop. 4.40, p. 374; W IV Exercise 1.4, p. IV.14.)

*Needs:* §3.10, AlgebraicTopology.

### 3.12 The plus construction is an integral homology isomorphism

Under the same hypotheses, prove `plusConstruction.homology_iso` in every degree, including zero, by tensoring the identity relative complex with constant coefficients.

(H AT §4.2, Prop. 4.40, p. 374.)

*Needs:* §3.10, AlgebraicTopology.

### 3.13 Local-coefficient acyclicity of plus

Prove `plusConstruction.localHomology_iso` for every local system on X⁺ by tensoring that relative group-ring complex. Deduce `isAcyclicMap`, naturally in coefficients.

(W IV Def. 1.1, p. IV.2; W IV Thm. 1.5(1) and paragraph before it, p. IV.5.)

*Needs:* §3.11, §3.7, AlgebraicTopology, UniversalCovers, §3.5.

### 3.14 Abelian spaces

Define `IsAbelianSpace`: connected with trivial π₁ action on every positive πₙ, including conjugation on π₁. Prove basepoint independence and the simple-space equivalence. Commutative π₁ alone is insufficient.

- `IsAbelianSpace`: Connected, with trivial π₁ action on every positive πₙ, including conjugation on π₁.
- `IsAbelianSpace.of_basepoint`: The condition is independent of basepoint.
- `IsAbelianSpace.of_simplyConnected`: Simply connected spaces are abelian.
- `IsAbelianSpace.of_hSpace`: Connected H-spaces are abelian.
- `IsAbelianSpace.commGroup_pi1`: An abelian space has commutative π₁.

**Checks.**

- `isAbelianSpace_point`: A point is abelian.
- `isAbelianSpace_circle`: S¹ is abelian (π₁ = ℤ abelian, higher π vanish).
- `not_isAbelianSpace_rp2`: RP² is not abelian: π₁ = ℤ/2 acts by −1 on π₂ ≅ ℤ.
- `isAbelianSpace_topologicalGroup`: A path-connected topological group, with Mathlib's IsTopologicalGroup.toHSpace, is abelian.

(H AT §4.1, p. 342.)

*Needs:* TC.

### 3.15 Connected H-spaces are abelian

Prove `hSpace_isAbelianSpace` for path-connected H-spaces at their unit, using the two unit homotopies. Homotopy associativity is not required.

(H AT §4.A, Example 4A.3, p. 422.)

*Needs:* §3.14, M, TC.

### 3.16 Relative Hurewicz theorem with trivial π₁-action

Prove `relativeHurewicz_of_trivialAction` for a based (n−1)-connected NDR pair (X,A) of path-connected spaces, n≥2, with trivial π₁A action on πₙ(X,A). This group is abelian, Hᵢ(X,A;ℤ)=0 for i<n and the degree-n Hurewicz map is an isomorphism.

Construct `covering_relativeHomotopyEquiv` for a cover of based pairs (X′,A′)→(X,A), with A′ the full preimage and n≥2, by unique disk lifts and lifts of disk homotopies. A′ need not be connected. It commutes with the exact-sequence boundaries. (H AT, Prop. 4.1, p. 343, applied to disks and their homotopies.)

**Checks.**

- `relative_cover_identity`: the identity cover gives the identity.
- `relative_cover_disconnected_preimage`: the universal cover of (S¹,{*}) uses A′=ℤ and preserves relative π₂.
- `relative_cover_boundary`: the relative disk boundary lifts with its basepoint.

(H AT §4.2, Thm. 4.37 and Lemma 4.38 with proof, pp. 371–373.)

*Needs:* AlgebraicTopology, UniversalCovers, TC.

### 3.17 Recognition of principal Eilenberg–Mac Lane fibrations

For a connected CW pair with hofib(A→X)=K(π,n), π abelian and n≥1, prove `principalFibrationCriterion`: A is weakly equivalent over X to hofib(k:X→K(π,n+1)) iff π₁A acts trivially on πₙ₊₁(X,A).

(H AT §4.3, Lemma 4.70 with proof, p. 413.)

*Needs:* §3.16, DGFloer Layer 1 item 4, GeneralizedCohomology G2.10, §2.5, AlgebraicTopology.

### 3.18 The Postnikov tower converges

For a tower X₀←X₁←⋯ of CGWH spaces with maps pₙ, define `SpaceTower.holim` by points (xₙ,γₙ), where γₙ is a path in Xₙ from pₙ(xₙ₊₁) to xₙ, with the k-subspace topology inside the product of spaces and path spaces. `SpaceTower.holim.eval` evaluates xₙ; `SpaceTower.holim.map` is induced by a strictly commuting map of towers. A compatible family X→Xₙ gives `SpaceTower.holim.comparison` by constant paths. Compare this model with the inverse limit of a path-fibrant replacement tower; no inverse-limit assertion is made for a general unfibrant tower.

For a compatible Postnikov tower of connected CW X, prove `postnikovTower_limit_isWeakHomotopyEquivalence`: X→holim Xₙ is weak. Each πᵢ tower is eventually constant. `postnikovSectionExists` constructs a CW Xₙ with X→Xₙ inducing isomorphisms on πᵢ for i≤n and πᵢXₙ=0 for i>n; compatible sections and bonding maps are the additional tower target.

**Checks.**

- `spaceTower_holim_point`: the constant one-point tower has one-point holim.
- `spaceTower_holim_identity`: the constant identity tower on X has evaluation holim→X a homotopy equivalence; the constant-path comparison is its inverse up to homotopy.
- `spaceTower_holim_nonempty_stages`: the discrete tail tower Xₙ={k∈ℕ | n≤k}, with inclusion bonding maps, has all stages nonempty but empty holim. Nonempty stages alone do not give a limit point.
- `postnikovSection_point`: every section of a point is weakly contractible.
- `postnikovSection_circle`: for S¹ the zeroth section is a point and each positive section is K(ℤ,1).
- `postnikovSection_sphere_two`: the first section of S² is a point and the second is K(ℤ,2); the latter retains π₂ and is not a point.

(H AT §4.3, Prop. 4.67 and Cor. 4.68 with proofs, pp. 410–411. The path-space model above is the explicit replacement construction; comparison with a fibration tower is part of the target.)

*Needs:* GeneralizedCohomology G2.10, AlgebraicTopology.

### 3.19 Cohomology is represented by Eilenberg–Mac Lane spaces

For abelian A and B and n≥1, prove `eilenbergMacLane_mapClassesEquiv`: based homotopy classes K(A,n)→K(B,n) correspond naturally to additive homomorphisms A→B, with the supplied functorial maps realizing them and composition agreeing with composition of homomorphisms. Prove `cohomologyRepresentability`: based homotopy classes X→K(A,n) give H̃ⁿ(X;A), for based CW X,n≥1, naturally in X,A with the universal class specified. Unbased maps give ordinary Hⁿ; n=0 uses locally constant functions to discrete A.

(H AT §4.3, Thm. 4.57, p. 393.)

*Needs:* DGFloer Layer 1 item 4, AlgebraicTopology.

### 3.20 Postnikov towers of principal fibrations for abelian spaces

For abelian CW X, construct `postnikovTower` with principal K(πₙX,n) fibres, compatible X→Xₙ, bonding maps and k-invariants Xₙ₋₁→K(πₙX,n+1). State the homotopy truncation comparisons; abelianness supplies trivial action.

(H AT §4.3, Thm. 4.69, p. 412.)

*Needs:* §3.14, DGFloer Layer 1 item 4, GeneralizedCohomology G2.10, AlgebraicTopology, §3.17, §3.18.

### 3.21 Obstructions to extending maps through a principal fibration

For a principal K(A,n)-fibration classified by κ and a CW pair (W,V), an existing lift over V extends iff its obstruction in Hⁿ⁺¹(W,V;A) vanishes. Choices are governed by Hⁿ. Name `principalFibration_extensionObstruction`; retain pulled-back local coefficients in the twisted version. Construct `twistedExtensionObstruction` for a pulled-back K(A,n)-fibration with π₁ acting on A: the obstruction lies in Hⁿ⁺¹(W,V;A_ρ), vanishes exactly when the given lift extends, and the relative choices form an Hⁿ(W,V;A_ρ)-torsor. The principal, trivial-action case is its specialization. Apply this stagewise to the relative Postnikov tower of a CW target.

**Checks.**

- `twisted_obstruction_trivial`: trivial action recovers the principal obstruction.
- `twisted_obstruction_circle`: sign monodromy on ℤ gives T−1=−2, so replacing the local system by constant coefficients changes the obstruction complex.
- `twisted_obstruction_identity_pair`: W=V has zero relative obstructions and a unique relative extension class.

(H AT §4.3, Prop. 4.72 with proof, p. 417.)

*Needs:* §3.20, §3.19, AlgebraicTopology.

### 3.22 Extending maps into abelian spaces

For a connected abelian CW space X and a CW pair (W,V), prove `abelianExtension`: every map V→X extends to W if Hⁿ⁺¹(W,V;πₙX)=0 for all n≥1. These are the obstruction groups of the principal Postnikov tower. Thus an integral homology-equivalence inclusion satisfies this vanishing by universal coefficients; `abelianExtension_of_homologyIso` records that sufficient case. Use HEP to turn extension up to homotopy into an actual extension restricting to the original map.

**Checks.**

- `obstruction_shift`: The n=1 obstruction lies in H²(W,V;π₁X), not H¹.

(H AT §4.3, Cor. 4.73, p. 417.)

*Needs:* §3.21, §3.20, AlgebraicTopology, §3.18.

### 3.23 Homology Whitehead theorem for abelian spaces

Prove `abelianHomologyWhitehead`: an integral homology isomorphism between connected abelian CW spaces is a homotopy equivalence, by relative extension and uniqueness.

(H AT §4.3, Prop. 4.74 with proof, p. 418.)

*Needs:* §3.22, §3.14, AlgebraicTopology, §3.16.

### 3.24 Homology isomorphisms between H-spaces are homotopy equivalences

Deduce `hSpaceHomologyWhitehead`: any integral homology isomorphism between path-connected H-spaces of CW type is a homotopy equivalence. It need not be an H-map.

(W IV Exercise 1.3, p. IV.14.)

*Needs:* §3.15, §3.23.

### 3.25 Universal property of the plus construction

For connected CW plus f at P and g:X→Z killing P on π₁, prove `IsPlusConstruction.lift`: g factors through f uniquely up to homotopy for any connected CW-type Z. Use twisted relative obstructions; the abelian-target specialization is a separate case. First prove extension and uniqueness for §3.10's selected attachment model `plusConstruction`. The relative cellular complex of its universal quotient cover is free over ℤ[π₁/P], with identity differential in degrees 3→2. Applying Hom into any quotient module gives an acyclic cochain complex, so the twisted extension and relative homotopy obstructions vanish.

For an arbitrary connected CW plus map f, apply this selected-model extension to f itself to obtain a comparison from `plusConstruction` to its target under X. The comparison induces the identity on the quotient π₁ and isomorphisms on homology with every pulled-back local system. Sections 3.7 and 3.9 therefore make it a homotopy equivalence. Transport extension and uniqueness through this comparison. For general f, `plusExtensionObstructionVanish` asserts vanishing of relative cohomology with every ℤ[π₁/P]-module, using the mapping-cylinder pair; it specifies no particular cellular presentation. Replace spaces of CW type by CW models before applying these arguments.

For the ring specialization, substitute X=BGL(R) and P=E(R) from §4.14, transporting the subgroup through π₁BGL(R)≅GL(R). The factorization retains the homotopy g≃h∘f and is natural under ring maps and the opposite-ring comparison. A pointed map into a disconnected CW-type target factors through its basepoint component, so the connected-target statement gives that version as well.

**Checks.**

- At P=1, f is a homotopy equivalence and lifting is composition with its homotopy inverse.
- For a field F, the map BGL(F)→B(Fˣ) induced by determinant kills E(F); its lift induces the determinant identification GL(F)/E(F)≅Fˣ on π₁.
- For the zero ring, stable GL and E are trivial; the pointed factorization is the unique homotopy class from a point, while the rank labels of BasedFree remain distinct.
- `plusExtension_disk_four`: the inclusion *→D⁴ is plus at P=1. With the boundary S³ given its 0- and 3-cell structure and the 4-cell attached by degree one, the relative complex is ℤ→¹ℤ in degrees 4→3. Every relative cohomology group vanishes, and factorization holds independently of this cellular presentation.

(W IV Thm. 1.5 and the paragraph before it, p. IV.5; H AT §4.3 Exercise 23, p. 420.)

*Needs:* §3.22, §3.14, §3.7, §3.10, §3.9, AlgebraicTopology.

### 3.26 Uniqueness of the plus construction up to homotopy under X

Prove `IsPlusConstruction.unique`: two connected CW plus constructions at P are homotopy equivalent under X, with the compatibility homotopy. `unique_of_abelian` is the separate stronger-target variant.

(W IV Thm. 1.5(3), p. IV.5.)

*Needs:* §3.25, §3.7, §3.9, AlgebraicTopology.

### 3.27 Functoriality of the plus construction up to homotopy

For φ preserving perfect normal P,P′, construct `IsPlusConstruction.map` with its homotopy-commuting square. Identity/composition hold in the homotopy category. A coherent `plusFunctorialModel` is separate from arbitrary attachment choices.

(W IV 1.1.2, p. IV.3.)

*Needs:* §3.25.

### 3.28 Recognising plus constructions into H-spaces

Prove the H-space recognition theorem: for connected CW plus X→Y with Y abelian and a homology isomorphism X→H to a connected CW-type H-space, the latter is acyclic and the lift Y→H is a homotopy equivalence under X.

(W IV Thm. 1.8 and Remark 1.8.1, p. IV.6.)

*Needs:* §3.25, §3.24, §3.12, §3.15, §3.23, §2.7.

### 3.29 π₂ of a plus construction and universal central extensions

For perfect normal P⊲G, prove `plusGroup_piTwo`: π₂(BG⁺ₚ)≅H₂(P;ℤ), retaining G/P action. In `plusGroup_fibreUCE`, π₁hofib(BG→BG⁺ₚ)→P is universal central with kernel H₂(P;ℤ). First construct the free-presentation central-extension foundation below.

In `Suggested.lean`, `IsPlusConstruction.piTwoEquiv` states the group isomorphism for any aspherical source of CW type, with the perfect normal subgroup of its fundamental group specified. `IsPlusConstruction.fiber_universalCentralExtension` identifies the extension induced by the fibre projection using `IsUniversalCentralExtension`, the universal property on surjective homomorphisms with central kernel. The quotient action and naturality are part of the comparisons in this section and §3.30.

- `plusConstruction.groupPi1Equiv`: For perfect normal P⊲G, π₁(BG)⁺ₚ≅G/P at the image vertex.
- `plusConstruction.groupPi1Equiv_incl`: The inclusion induces the quotient map under π₁BG≅G.
- `plusConstruction.pi2Equiv`: π₂(BG)⁺ₚ≅H₂(P;ℤ), with the coefficient universe lift.
- `plusConstruction.fiber_universalCentralExtension`: π₁hofib(BG→(BG)⁺ₚ)→P is the universal central extension, and its composite into G is induced by the fibre projection.

Build `UniversalCentralExtension` as a surjective homomorphism with central kernel and a unique lift to every central extension of its target. Prove existence for perfect P, the kernel–H₂ identification from Hopf’s formula, the superperfect-source recognition theorem, and naturality of lifts and kernels. **API:** `uce.lift`, `uce.lift_unique`, `uce.kernelH2`, `uce.source_superperfect`, `uce.map_kernelH2`. **Checks.**

- `uce_trivial`: the trivial group has the trivial extension.
- `uce_nonperfect`: a nonperfect cyclic group has no universal central extension.
- `uce_superperfect`: a central extension with superperfect source satisfies the universal property.
 (W III, Definition 5.3.1, Example 5.3.4, equation (5.3.5), and Recognition Theorem 5.4, p. III.37.)

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* §3.13, §3.2, §2.5, §2.6, §1.29, M. Construct the central-extension foundation in this subsection before applying it to the plus fibre.

### 3.30 Naturality of π₂(BG⁺) ≅ H₂(P; ℤ)

Prove `plusGroup_piTwo_naturality`: G→G′ preserving P,P′ induces exactly H₂(P;ℤ)→H₂(P′;ℤ) under the comparisons, with the selected basepoints and quotient actions.

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* §3.29, §3.27, §2.7, §2.5, §3.29 (central extensions).

### 3.31 BP⁺ is the universal cover of BG⁺

For P⊆H⊆G and P perfect normal in G, identify the H/P-cover of BG⁺ₚ with BH⁺ₚ, respecting projection/deck action. Thus BP⁺ is its universal cover.

(W IV Exercise 1.8, pp. IV.14–15.)

*Needs:* §3.26, §1.28, §2.8, TC.

### 3.32 The plus-construction fibration of a universal central extension

For the universal central extension A→E→P of perfect P, prove BA→BE⁺→BP⁺ is a homotopy-fibre sequence. BE⁺ is connected with π₁=π₂=0; the boundary identifies π₂BP⁺ with A.

(W IV Exercise 1.9, p. IV.15.)

*Needs:* §2.36, §3.33, §3.29, AlgebraicTopology, §3.17, §3.25, §3.7, §3.26, DGFloer Layer 1 item 4, §3.29 (central extensions).

### 3.33 Plus constructions of fibre sequences

For a connected CW fibre sequence F→E→B, plus f:E→E⁺ at perfect normal P and a chosen p⁺f≃p, prove `plusFibreSequence`: induced F→F′=hofib(p⁺) is acyclic, hence an integral homology isomorphism. The square F→F′ over E→E⁺ is homotopy-cartesian by pullback pasting, so its map on every homotopy fibre is a homotopy equivalence to a fibre of f. Name the underlying closure statement `IsAcyclicMap.homotopyPullback`. This conclusion only presupposes a factorisation p⁺ and the specified homotopy; it does not assert that every p extends through plus. If F′ is simply connected it is plus at π₁F; if F′ is abelian and F⁺ at ker(π₁F→π₁F′) is abelian, identify F⁺≃F′ under F.

(W IV Def. 1.4 and Lemma 1.6, pp. IV.4–5, together with homotopy-pullback pasting in §2.10. Exercise 1.9, p. IV.15, is the universal-central-extension specialisation, not a statement of the general closure theorem.)

*Needs:* §3.25, §3.23, AlgebraicTopology, §2.8, §3.6, §3.7, §3.26, §2.7.

### 3.34 Serre classes in fibrations with trivial action

Use DGFloer Layer 1 item 4’s Serre-class carrier, including its tensor, Tor and K(A,1) hypotheses. Prove the bounded homology two-out-of-three fibration theorem for connected Serre fibrations with trivial action. Establish finite-generation, torsion and P-primary examples separately. For N≥0, the bounded form asserts: if F and B have positive integral homology in C through degree N, so does X; if F and X do, so does B; if X does through N and B does through N+1, then F does through N. Requiring these conditions in all positive degrees gives the unrestricted two-out-of-three theorem. The new API consists of the three class instances and `SerreClass.fibrationHomology` with these degree bounds; the closure projections retain their supplier names.

**Checks.**

- `serreClass_finitelyGenerated`: ℤ is in the finitely generated class, while ⊕ℕℤ is not; arbitrary filtered-colimit closure is not an axiom.
- `serreClass_p_primary`: for prime p, finite p-groups form a Serre class, containing ℤ/p² and excluding ℤ and ℤ/ℓ for distinct prime ℓ.
- `serreClass_exponent_p_fails`: groups killed by p alone fail extension closure: 0→ℤ/p→ℤ/p²→ℤ/p→0 is the counterexample.

(H SS 1, Lemma 1.9 with proof, p. 15.)

*Needs:* DGFloer Layer 1 item 4, AlgebraicTopology.

### 3.35 Homology of Eilenberg–Mac Lane spaces lies in the Serre class

For the classes of finitely generated abelian groups, finite P-primary groups and P-primary torsion groups, prove positive homology of K(A,n) belongs to the class when A does, n≥1. For the two finite-generation classes reduce K(A,1) to products of cyclic groups; for unrestricted P-torsion use its filtered union of finite subgroups, then iterate the path fibration. More general Serre classes need the K(A,1) closure theorem as an additional input. Finitely generated groups are not claimed closed under arbitrary filtered colimits.

(H SS 1, Lemma 1.10 with proof, pp. 15–16.)

*Needs:* §3.34, DGFloer Layer 1 item 4, §1.32, §1.17, AlgebraicTopology, M.

### 3.36 Serre class theory for abelian spaces

For C equal to finitely generated, finite P-primary or P-primary torsion abelian groups, prove `serreClass_abelianSpace`: for connected abelian CW X, all positive πₙ lie in C iff all positive Hₙ do. If πᵢ∈C for i<n, the degree-n Hurewicz map has kernel/cokernel in C.

(H SS 1 'Serre Classes', Theorems 1.7 and 1.8, p. 14; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §3.14, §3.20, DGFloer Layer 1 item 4, AlgebraicTopology, §3.34, §3.35.

### 3.37 Rational homotopy of H-spaces (Cartan–Serre)

For a path-connected H-space with finite-type rational homology, prove `rationalHurewicz_hSpace`: πₙ⊗ℚ injects into Hₙ(−;ℚ) with primitive image, n>0. Construct the rationalisation/Serre comparison. Add homotopy associativity for the Hopf-algebra formulation.

Use GeneralizedCohomology G5.6’s filtered-cochain Serre comparison, local tensor-cup pairings, Leibniz differentials and multiplicative convergence. Compute rational K(A,n) cohomology for finite-dimensional rational A and n≥1: polynomial generators for even n, exterior for odd n. Name `rationalEMCohomology` and use these primitive generators in the rational H-space comparison. (H SS, §§1.2–1.4, pp. 22–45; H AT, Thm. 3C.4, p. 283.)

**Checks.**

- `rational_em_one`: K(ℚ,1) has an exterior degree-one generator.
- `rational_em_two`: K(ℚ,2) has a polynomial degree-two generator.
- `serre_product_point`: a point base recovers the fibre cup product; d(ab)=d(a)b+(−1)^|a|a d(b).

(H SS 1, Thm. 1.24 and the paragraph after its proof, pp. 38–39.)

*Needs:* GeneralizedCohomology G5.6, §3.15, §3.14, DGFloer Layer 1 item 4, §3.36, AlgebraicTopology, AlgebraicTopology stage 8.

### Examples

Plus at the trivial subgroup is a weak equivalence. Plus of a perfect group’s classifying space is simply connected and retains its integral homology. Acyclicity with constant coefficients alone is insufficient for a nontrivial quotient π₁. The regular-cover calculation tests the local-coefficient condition.

### Dependencies

Layers 1–2 and ordinary (co)homology/obstruction theory; local central extensions precede plus comparisons.

## Layer 4: Homotopy group completion and deloopings

### 4.1 Symmetric tensor on the core

Construct `Core.monoidalCategory` and, for symmetric input, `Core.symmetricCategory` by inherited isomorphism coherence. The inclusion is strong monoidal. Strong monoidal functors induce core maps; symmetry requires braided functors. Iso-class carriers remain supplier objects.

- `Core.monoidalCategory`: Transport the full tensor coherence to Core S.
- `Core.symmetricCategory`: Transport the symmetry to Core S.
- `Core.inclusion_monoidal`: Core S→S is strict braided monoidal.
- `Core.mapMonoidal`: F.core is strong braided monoidal; inclusion and core-composition comparisons are monoidal.
- `core_pi0_isoClasses`: Identify π₀B(Core S) with the supplied iso-class monoid, naturally for strong monoidal functors.

**Checks.**

- `core_finset_pi0`: For finite sets under disjoint union, the monoid of isomorphism classes of the core is ℕ.
- `core_of_groupoid`: If S is already a groupoid, Core S ≌ S as symmetric monoidal categories.
- `core_projective_symmetry_not_id`: In Core of finitely generated projective ℤ-modules, the symmetry on ℤ ⊕ ℤ is the swap, not the identity: the structure is not strict in the sense of Bhatt–Scholze Def. 12.1.
- `core_isoClasses_splitK0`: For additive A, Skeleton(Core A) is the multiplicative form of ObjectCode A; its Grothendieck group agrees with SplitK0 via the supplied equivalence.

(BS Appendix §12, p. 54; W IV Def. 4.1 and Examples 4.1.1, pp. IV.36–37.)

*Needs:* M.

### 4.2 The classifying-space H-structure

For small symmetric monoidal S, construct the associative/commutative H-space multiplication on BS with unit-object vertex, using k-products. The ordinary-product specialization of `classifyingSpace.hSpace` assumes countable objects/arrows; its general form uses k-products. The unit laws are homotopies, with their compatibility at the unit vertex included in the monoidal coherence.

- `classifyingSpace.hSpace`: The multiplication on BS comes from B(⊗) and the product comparison, with associative/commutative/unit homotopies.

**Checks.**

- The one-object one-arrow monoidal category gives the one-point H-space.
- The discrete symmetric monoidal category ℕ gives addition on the discrete space ℕ, with zero as unit; its component monoid is not a group.
- The two rank-one vertices multiply to the rank-two component of the finite-set core. Its commutativity homotopy comes from the swap bijection, rather than an equality of chosen ordered sums.

(W IV §4 opening, p. IV.36.)

*Needs:* §4.1, §1.8, §1.10, §1.12, §1.9, AlgebraicTopology, M.

### 4.3 Quillen's S⁻¹S construction for a symmetric monoidal groupoid

Define `SInvS S` for a symmetric monoidal groupoid: (a,b)→(a′,b′) is represented by t and isomorphisms t⊗a≅a′,t⊗b≅b′, modulo isomorphism of t. Give tensor, inclusion (s,1), swap and braided strong-functor maps. Faithful translations are a separate hypothesis.

- `SInvS`: The pair category with simultaneous translation morphisms modulo isomorphism.
- `SInvS.incl`: The strong braided monoidal inclusion s↦(s,1).
- `SInvS.monoidal`: The componentwise tensor and its symmetry.
- `SInvS.map`: A strong braided monoidal F induces S⁻¹F, preserving id/composition up to coherent isomorphism.
- `SInvS.kSpace`: K(S)=B(S⁻¹S), Kₙ(S)=πₙK(S).
- `SInvS.pi0Equiv`: π₀K(S)≅GrothendieckGroup(Skeleton S), with (a,b)↦[a]−[b].
- `SInvS.swap`: Swapping coordinates induces the homotopy inverse.
- `FaithfulTranslations`: Injectivity of Aut(s)→Aut(s⊗t); holds for the listed free/projective, finite-set and Picard examples.

**Checks.**

- `SInvS_pic_K0`: For S = Pic(R) (R commutative), π₀ kSpace S ≅ Pic(R), π₁ ≅ Rˣ and π_n = 0 for n ≥ 2.
- `SInvS_trivial`: For the trivial symmetric monoidal groupoid (one object, one morphism), kSpace is contractible.
- `SInvS_pi0_compat`: For S = Core of an additive category A with ⊞, π₀ kSpace S ≅ SplitK0 A, compatibly with the classes of objects.
- `SInvS_no_natural_inverse`: For based free ℤ-modules there is no natural transformation from the constant unit functor to id⊗swap. Naturality along (0,0)→(1,1) forces equal two translation maps; the automorphism (−1,1) then requires diag(−1,1)=diag(1,−1), which is false. Objectwise arrows from the unit do exist; they do not supply a natural inverse homotopy.
- `SInvS_not_all_maps`: Using the category P(R) of all maps instead of iso P(R) gives a contractible classifying space (0 is initial), not K(R).
- `faithfulTranslations_basedFree`: F(R) has faithful translations: g ↦ g ⊕ 1 is injective on GL_n(R) (§4.15).

(W IV Def. 4.2, Explanation 4.2.1, Remark 4.2.2, Def. 4.3, pp. IV.37–38, Exercise 4.3, p. IV.46; C §1.2, Def. 7, p. 9.)

*Needs:* §4.1, §4.4.

### 4.4 Actions of monoidal categories and the categories ⟨S, X⟩ and S⁻¹X

For a coherent `MonoidalLeftAction`, define `MonoidalActionCategory S X` using translation arrows t⊙x→y modulo isomorphisms of t. The diagonal action gives S⁻¹X; supply stage inclusions, projection, restriction and the groupoid self-action contraction.

- `MonoidalActionCategory`: Objects x; translation morphisms represented by s⊙x→y.
- `MonoidalActionCategory.loc`: S⁻¹X=⟨S,S×X⟩ for the diagonal action.
- `MonoidalActionCategory.proj`: The projection (s,x)↦s into ⟨S,S⟩.
- `MonoidalActionCategory.incl`: Translations x↦(s,x), with the unit case as inclusion.
- `MonoidalActionCategory.contractible_self`: For a groupoid S, the unit is initial in ⟨S,S⟩, so its classifying space is contractible.
- `MonoidalAction.diag`: The diagonal action t⊙(s,x)=(t⊗s,t⊙x), with symmetry supplying its coherence.

**Checks.**

- `actionCategory_trivial_action`: For the trivial monoidal category acting on X, ⟨S, X⟩ ≌ X.
- `actionCategory_nat_telescope`: For S = ℕ acting on ⊔ X_n through a sequence of functors, ⟨S, X⟩ is the mapping telescope category (Weibel IV Exercise 4.2).
- `actionCategory_monoid_set`: For S and X discrete, ⟨S, X⟩ is isomorphic to Mathlib's ActionCategory (π₀ S) (Ob X) of induced monoid action.
- `actionCategory_not_X`: For S = ℕ acting on itself by addition, ⟨S, S⟩ is the poset ℕ (contractible), not the discrete category ℕ.

(W IV Definitions 4.7 and 4.7.1, p. IV.41.)

*Needs:* §4.1, §1.10, §1.12, M.

### 4.5 π₀ of S⁻¹S is the Grothendieck group of the monoid of components

Construct `SInvS.pi0Equiv` from π₀B(S⁻¹S) to the Grothendieck group of the commutative monoid of isomorphism classes. Specify (a,b)↦[a]−[b], written multiplicatively [a]/[b], and inclusion s↦(s,1). Prove the equations on vertices and on the inclusion, with addition induced by tensor and inverse by swapping. For based free modules, (rank 2,rank 1) has rank +1 and its swap has rank −1.

**Checks.**

- `rank_difference`: The component (2,1) in based free modules has rank +1 and (1,2) rank −1.

(W IV Lemma 4.3.1 with proof, p. IV.38.)

*Needs:* §4.3, §1.18, M, TC.

### 4.6 Group completions of homotopy-commutative H-spaces

Define `IsHomotopyAssocHSpace`, `IsHomotopyCommHSpace`, `pontryaginLocalization` and `IsGroupCompletion`: both H-spaces satisfy the two homotopy laws, f is an H-map, π₀f completes components and H_*(Y;k)≅π₀(X)⁻¹H_*(X;k) as unital graded rings for every commutative k.

- `IsGroupCompletion`: An H-map of homotopy-associative/commutative H-spaces, completing π₀ and localising homology over every commutative ring.
- `IsGroupCompletion.pi0Equiv`: π₀Y≅GrothendieckGroup(π₀X).
- `IsGroupCompletion.homologyLocalization`: The induced localisation map on Pontryagin homology is a ring isomorphism.
- `IsGroupCompletion.of_groupLike`: For grouplike X, id is a group completion.
- `IsGroupCompletion.basepointComponent`: For CW Y, its unit component is an abelian H-space.

**Checks.**

- `hSpaceLaws_discrete_abelian`: a discrete abelian group satisfies both homotopy associativity and homotopy commutativity.
- `hSpaceLaws_discrete_S3`: discrete S₃ is homotopy associative and fails homotopy commutativity; (01)(12)≠(12)(01).
- `hSpaceLaws_commutative_nonassociative`: the discrete commutative magma {0,1,2}, with unit 0, 1·1=2 and 1·2=2·2=0, satisfies commutativity but fails associativity: (1·1)·2=0 and 1·(1·2)=1. On a discrete space homotopies cannot repair this inequality.
- `isGroupCompletion_id_groupLike`: For a homotopy-commutative group-like H-space G (for example an abelian topological group), the identity of G is a group completion.
- `isGroupCompletion_N_to_Z`: The inclusion ℕ → ℤ of discrete monoids is a group completion.
- `isGroupCompletion_pi0_compat`: For a group completion, π₀ f agrees with Algebra.GrothendieckGroup.of under the identification π₀(Y) ≃ Algebra.GrothendieckGroup π₀(X).
- `not_isGroupCompletion_pi0_only`: The map ⊔_n BΣ_n → ℤ (discrete) inducing the group completion on π₀ is not a group completion: it fails the homology condition (the correct target is ℤ × BΣ_∞⁺).

(W IV Def. 4.4, p. IV.38.)

*Needs:* §4.2, M.

### 4.7 The projection S⁻¹X → ⟨S, S⟩ is cofibred

For a coherent S-action with faithful translations, prove `MonoidalActionCategory.proj_isCofibred`: S⁻¹X→⟨S,S⟩ is cofibred, with specified fibres, cocartesian lifts and transition action. Equivalently its opposite is fibred.

(W IV Exercise 4.5, p. IV.46.)

*Needs:* §4.4, §2.32.

### 4.8 Invertible actions do not change the homotopy type

For a symmetric monoidal groupoid S acting coherently on X with faithful translations, if every t⊙− gives a homotopy equivalence on BX, prove each actual `MonoidalActionCategory.incl_homotopyEquiv`: BX→B(S⁻¹X) is a homotopy equivalence, with the inverse tied to this map.

(W IV Exercise 4.6, p. IV.46.)

*Needs:* §4.7, §2.35, §4.4, AlgebraicTopology.

### 4.9 Quillen’s homological group completion

Prove `quillenGroupCompletion` for symmetric monoidal groupoids with faithful translations: BS→B(S⁻¹S) completes homotopy, including coherent H-space laws and all-degree homology localisation, using the action projection and Quillen's localisation argument.

(W IV Definitions 4.7, 4.7.1, (4.7.2) and Thm. 4.8 with proof, pp. IV.41–42.)

*Needs:* §4.3, §4.7, §2.30, §1.23, §1.27, §4.5, §4.6, §4.4, §1.12.

### 4.10 Group completions of group-like H-spaces

Prove `IsGroupCompletion.of_groupLike` for homotopy-associative/commutative X with component inverses. Any group completion of such X between CW-type spaces is a homotopy equivalence by translation and abelian homology Whitehead on unit components.

(W IV Lemma 4.4.1 with proof, p. IV.39.)

*Needs:* §4.6, §3.24.

### 4.11 Uniqueness of group completions up to phantom maps

If π₀X is countable or has a countable cofinal submonoid, two group completions with CW-type targets have equivalent targets; the comparison triangle is determined only up to phantom maps. Consume GeneralizedCohomology G3.10's unstable mapping-space/Milnor comparison. Construct `spaceMilnorMappingSequence`, extending its restriction-fibration argument to a specified countable exhaustion X=⋃ᵢXᵢ by based finite CW subcomplexes. Each inclusion is a closed CW cofibration; HEP gives the convenient based mapping-space restriction fibrations and identifies Map_*(X,T) with their homotopy limit. The countability condition on π₀X does not itself provide this finite-subcomplex exhaustion.

For a based grouplike homotopy-associative, homotopy-commutative H-space T of CW type, the pointwise operation and loop concatenation make π₁Map_*(Xᵢ,T)=[ΣXᵢ,T]_* abelian by interchange. Transport G3.10's orbit-set lim¹ through the integral tower adapter of §7.9 to the supplied cokernel of δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁. Identify its injection with the phantom kernel of [X,T]_*→limᵢ[Xᵢ,T]_*, and its projection with restriction. Preserve the connecting maps and naturality for maps of filtrations and based H-maps of targets. The supplied Mittag–Leffler vanishing then implies that maps agreeing on all stages agree in based homotopy classes. State the no-phantom comparison corollary under precisely this condition.

**Checks.**

- `spaceMilnor_constant_exhaustion`: an eventually constant finite-CW exhaustion has zero lim¹ and recovers [X,T]_*.
- `spaceMilnor_circle`: for the eventual exhaustion of S¹ and T=S¹, restriction retains [S¹,S¹]_*≅ℤ, rather than making every map null.
- `spaceMilnor_point_target`: T=* gives singleton mapping classes and zero restriction kernel for every such exhaustion.

(W IV Phantom maps paragraph and Thm. 4.4.3, p. IV.39.)

*Needs:* §4.6, §4.10, GeneralizedCohomology G3.10, DerivedModuleAlgebra §1.T.1 on main; `spaceMilnorMappingSequence` is the exhaustion extension constructed in this section.

### 4.12 The fibration S⁻¹S → S⁻¹X → ⟨S, X⟩

For symmetric monoidal groupoid S with faithful translations acting on X, assume every X-arrow monic and Aut_S(s)→Aut_X(s⊙x) injective for all s,x. Fix x₀∈X. The functor (a,b)↦(a,b⊙x₀) defines S⁻¹S→S⁻¹X. Prove `SInvS.fibration`: its realization is the homotopy fibre of B(S⁻¹X)→B⟨S,X⟩ over the vertex x₀, with its specified composite nullhomotopy. Retain x₀ and its preservation comparison in equivariant naturality; contractible ⟨S,X⟩ gives an equivalence.

**Checks.**

- `action_fibration_terminal`: terminal S acting on a pointed discrete X gives a point as the fibre of id_X at x₀.
- `action_fibration_empty`: terminal S acting on empty X satisfies the action hypotheses but has no x₀; there is no map from B(S⁻¹S)=* to B(S⁻¹X)=∅.
- `action_fibration_self`: the action of S on itself with x₀ the tensor unit recovers the equivalence over the contractible B⟨S,S⟩.

(W IV Exercise 4.7, p. IV.46.)

*Needs:* §4.4, §4.8, §2.35, §2.32.

### 4.13 A product of plus constructions is a plus construction

For connected CW-type plus maps at P,Q, prove their k-product is plus at P×Q. Identify product fibres and π₁ kernels, then use a CW-type replacement for uniqueness; an arbitrary ordinary product need not have the chosen CW structure.

(W IV Exercise 1.7, p. IV.14.)

*Needs:* §3.1, §3.3, §3.8, GeneralizedCohomology G2.10, AlgebraicTopology.

### 4.14 Stable linear groups and their plus H-space

Use AlgebraicKTheory A1's stable GL and elementary subgroup, for every associative unital ring including zero. The names `stableGeneralLinearGroup R` and `stableElementaryGroup R` are aliases for those supplied objects, with their trailing-identity stabilization g↦diag(g,1). Likewise `finiteGLBlockSum R m n : GL_m(R)×GL_n(R)→GL_(m+n)(R)` is its finite block map, retaining both sizes and the supplied permutation conjugations when either input is stabilized. Realize those conjugations as homotopies coherent under successive stabilizations. Use them and the supplied equality on GL/E to construct the coherent H-space multiplication on BGL(R)⁺, so ℤ×BGL(R)⁺ completes ⊔BGLₙ(R).

The comparison of stable groups is the unique group isomorphism carrying each finite-stage matrix to the same matrix; it identifies the elementary subgroups and commutes with all unital ring maps. On classifying spaces it preserves the identity vertex and the labelled edges. Transpose with entrywise opposite identifies GLₙ(Rᵐᵒᵖ) with GLₙ(R)ᵐᵒᵖ; inverse transpose gives the group isomorphism into GLₙ(Rᵐᵒᵖ) whose (i,j)-entry is op((g⁻¹)ⱼᵢ). It commutes with stabilization and block sum and carries E to E. Compare its realized map with §1.7's opposite-space homeomorphism using the entrywise-inverse nerve convention, and descend it through plus. **Supplied API aliases:** `stableGeneralLinearGroup.of`, `stableGeneralLinearGroup.of_stabilise`, `finiteGLBlockSum`, `stableElementaryGroup.perfect`, `stableElementaryGroup.eq_commutator`. **Checks.**

- `stable_gl_rank_zero`: rank zero contributes the identity.
- `finite_block_sum_stabilization`: over ℤ, block(I₁,−1) stabilized is diag(1,−1,1), whereas block(I₂,−1)=diag(1,1,−1). These remain distinct stably but are conjugate by exchanging the last two coordinates; ordinary block sum therefore does not descend to the chosen stable group.
- `stable_gl_field`: over a field the stable determinant quotient is its unit group.
- `elementary_two_not_perfect`: E₂(𝔽₂) is not perfect, so stable perfectness does not apply at rank two.
- On eᵢⱼ(a), the inverse-transpose/opposite map gives eⱼᵢ(−aᵐᵒᵖ); for R=M₂(ℤ), transpose without the opposite coefficient ring fails multiplicativity.
 (W III, Lem. 1.3.2 and Whitehead Lem. 1.3.3, p. 4.)

(W IV Exercise 1.11, p. IV.15; Exercise 4.9, p. IV.46.)

*Needs:* AlgebraicKTheory A1, §3.25, §3.28, §1.31, §4.6, §4.13, §3.12, §1.17, §3.15, §3.27, M.

### 4.15 Based free modules and projective complements

Define `BasedFree R`: objects are rank labels n, automorphisms GLₙR, no arrows between labels; tensor is block sum with permutation symmetry. Row action gives Aut(n)≅GLₙRᵐᵒᵖ. Construct `toModuleCore`, its finite-projective lift and entrywise base change. Labels remain ℕ without IBN. Apply AlgebraicKTheory A0 to Rᵐᵒᵖ and identify right Rᵐᵒᵖ-modules with left R-modules by the double-opposite scalar map. On free modules the coordinate identification sends a column with opposite-ring entries to its unop row, and a matrix A to Aᵀ with entrywise unop. This identifies the supplied column action with the row action here, respecting composition, direct sums, permutations and base change.

- `BasedFree`: The groupoid with objects ranks and matrices as isomorphisms; direct sum supplies the symmetric tensor.
- `BasedFree.autEquiv`: Aut(n)≅GLₙ(R)ᵐᵒᵖ; inversion compares its classifying space with BGLₙ(R).
- `BasedFree.toModuleCore`: The strong symmetric monoidal functor into the module core; `BasedFree.toProj` is its lift to the finite-projective core, with the same object modules and matrix maps.
- `BasedFree.map`: Entrywise ring maps give strong braided functors, respecting base change and composition.
- `BasedFree.faithfulTranslations`: Block-identity translation is faithful.
- `BasedFree.cofinal`: For every finite projective P, find Q,n with P⊕Q≅Rⁿ.

**Checks.**

- `basedFree_isoClasses`: Skeleton (BasedFree R) ≃* Multiplicative ℕ for every ring R, including the zero ring.
- `basedFree_braiding_swap`: For `R = ℤ` the symmetry `c_{1,1}` is the matrix `!![0, 1; 1, 0] ≠ 1`.
- `basedFree_toProj_not_injective`: For R with R ≅ R² (e.g. End of a countably infinite-dimensional vector space) toProj.obj 1 ≅ toProj.obj 2 although 1 and 2 are not isomorphic in BasedFree R.
- `basedFree_aut_bijective`: For every n, toProj induces a bijection Aut n → Aut (toProj.obj n).

(W IV Example 4.1.1(c), p. IV.36.)

*Needs:* AlgebraicKTheory A0, §4.1, M. The name `projectiveFreeComplement` is the supplied finite-projective complement transported through the Rᵐᵒᵖ adapter: for finite projective P it gives finite projective Q, n and an actual isomorphism P⊕Q≅Rⁿ. Retain its inclusion and retraction maps, whose composite on P is the identity, and use this same splitting for `BasedFree.cofinal`. Q is projective, not necessarily free. (W IV Example 4.1.1(c), p. IV.36; Mathlib `Module.Finite.exists_comp_eq_id_of_projective`.)

**Checks.**

- `projective_complement_zero`: P=0 admits Q=0,n=0, including the zero ring.
- `projective_complement_free`: P=Rⁿ admits Q=0; rank labels need not be invariant under isomorphism when IBN fails.
- `projective_complement_not_free`: a nonprincipal invertible ideal of a Dedekind domain is projective but cannot have a free complement: its determinant class would remain nontrivial. The target therefore allows projective Q.

### 4.16 B(S⁻¹S) ≃ ℤ × BGL(R)⁺ for based free modules

For unital R, prove `kSpace_basedFree_plus`: B(F(R)⁻¹F(R))≃ℤ×BGL(R)⁺, with the inclusion and difference-of-labels component map. Block matrices give faithful translations; plus identifies the unit component.

(W IV Thm. 4.9 with proof, pp. IV.42–43.)

*Needs:* §4.9, §3.28, §1.17, §4.14 (stable linear groups), §4.5, §4.15, §4.4, §2.31.

### 4.17 The telescope map into the group completion is acyclic

For a well-pointed homotopy-commutative monoid and a cofinal product stabilisation, prove `telescope_isAcyclicMap`: the telescope maps acyclically to the Borel homotopy fibre, which maps by a weak equivalence from ΩBM. A homotopy-equivalence formulation additionally uses CW-type models. Every component must divide a sufficiently long later product from every starting stage.

(HK III Section 3.2, (1)-symmetric case, p. 55; W IV Proof of Thm. 4.10, p. IV.44; Randal-Williams, Thm. 1.1 and Cor. 1.2, pp. 1–2.)

*Needs:* §4.9, §3.3, §3.7, §4.4, §2.31, §1.17.

### 4.18 Group completion with a cofinal sequence of objects

For a symmetric monoidal groupoid with faithful translations and cofinal sₙ₊₁=sₙ⊗aₙ, prove `kSpace_cofinal_plus`: B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺. Identify the stable automorphism telescope and its perfect commutator, then apply local-coefficient acyclicity componentwise. Prove `stableAutomorphism_commutatorPerfect` by representing each stable commutator at a finite stage, then using disjoint tensor blocks and the symmetry conjugations to rewrite it as a commutator of commutators after further stabilisation (Randal-Williams, Prop. 3.1, pp. 7–8).

(W IV Thm. 4.10 with proof, pp. IV.43–44; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §4.9, §3.8, §4.17, §4.5, §1.17, §2.31, §3.3, §3.15, §4.2.

### 4.19 Cofinality for actions: S⁻¹X ≃ T⁻¹X

For cofinal strong braided F:S→T between symmetric monoidal groupoids with faithful translations and a coherent T-action on X, prove `cofinality_action`: B(S⁻¹X)≃B(T⁻¹X). Cofinality means each t has a tensor complement to some F(s); action invertibility is equivalent after restriction.

(W IV Cofinality Thm. 4.11(a) with proof, p. IV.44.)

*Needs:* §4.8, §4.4, §1.10.

### 4.20 Quillen's cofinality theorem for symmetric monoidal groupoids

If additionally Aut(s)→Aut(Fs) is bijective, prove `cofinality`: B(S⁻¹S)→B(T⁻¹T) is bijective on every positive πₙ at every basepoint. Its π₀ need not be surjective.

(W IV Cofinality Thm. 4.11 with proof, pp. IV.44–45.)

*Needs:* §4.9, §3.24, §4.23, §1.34, §1.10.

### 4.21 Cofinality: the group completion of iso P(R) is K₀(R) × BGL(R)⁺

For the finite-projective core of unital R, prove `kSpace_projective_plus`: the space has components K₀(R) and unit component BGL(R)⁺. Construct free complements locally, and identify the based-free comparison on generators using direct sum.

(W IV Cor. 4.11.1, p. IV.45; Example 4.1.1(c), p. IV.36.)

*Needs:* §4.20, §4.16, §4.5, §4.15 (projective complements).

### 4.22 Naturality of the comparison B(S⁻¹S) ≃ K₀ × BGL(R)⁺

Prove homotopy naturality of these comparisons under unital ring maps. Scalar extension preserves finite projectives/sums; on π₀ use induced K₀ map and on the unit component the entrywise stable GL plus map.

(W IV Functoriality 1.1.2, p. IV.3.)

*Needs:* §4.16, §4.14, §4.13, §4.21, §4.23, §4.15, §4.5, §3.27, §3.25, §3.15, §1.31.

### 4.23 Independence of the group completion from strictification

Consume GeneralizedCohomology G2.8’s tensor-word strictification and its strong symmetric monoidal evaluation equivalence. The additional target here is invariance of the fraction-category construction, including the inclusion and the comparison composition. Prove `SInvS.map_homotopyEquiv` for a strong symmetric monoidal equivalence of strictifications, respecting inclusion and comparison composition. Choose a strong symmetric quasi-inverse; its unit/counit induce transformations on the fraction categories, whose realisations give the inverse homotopies. This identifies homotopy types, not categorical choices definitionally.

**Checks.**

- `strictification_empty`: the empty word evaluates to the tensor unit and is the strict concatenation unit.
- `strictification_three`: words of lengths two and one evaluate using the associator; evaluating both parenthesisations gives the same map after that specified associator.
- `strictification_symmetry`: for finite sets, swapping two singleton words evaluates to the nontrivial permutation of their two-element sum; erasing symmetry would fail this check.
- `strictification_equivalence_inverse`: evaluation followed by singleton words is naturally equivalent to identity, including the empty word.

(C §1.2, final paragraph, printed p. 10; the map invariance follows from the strong monoidal inverse and §1.10. W IV Exercise 4.4 concerns S and its opposite, not strictification.)

*Needs:* GeneralizedCohomology G2.8, §4.3, §4.25 (symmetric coherence), §1.10, M.

### 4.24 Segal’s summing-functor construction

For small C with zero object and finite sums, define `summingFunctors` as coherent subset-sum diagrams and natural isomorphisms; their nerves form `segalGammaSpace C`. Apply the supplied Γ-machine to construct the `segalSpectrum` comparison and its underlying sequence `segalSpaces`; the iso-class monoid is the supplied `Skeleton (Core C)` under direct sum, with the zero and sum equations from Mathlib’s monoidal skeleton.

- `summingFunctors`: Summing diagrams and natural isomorphisms form a groupoid.
- `segalGammaSpace`: A_C(n)=nerve(summingFunctors(C,n)).
- `segalGammaSpace.isSpecial`: A_C is special.
- `segalGammaSpace.map`: Zero/sum-preserving functors give functorial Γ-space maps.
- `segalSpaces`: The Γ-machine connective Ω-spectrum has zeroth space Ω|BA_C(1)|; segalSpaces is its underlying sequence, with a separate structure/comparison target.
- `segalGammaSpace.pi0IsoClasses`: π₀A_C(1)≅Skeleton (Core C) before completion.
- `segalSpaces.pi0`: The completed zeroth-space components form a commutative group.
- `segalSpaces.toPi0`: The group-completion component homomorphism.
- `segalSpaces.pi0GrothendieckEquiv`: Completed components≅GrothendieckGroup(Skeleton (Core C)).
- `segalSpaces.pi0GrothendieckEquiv_toPi0`: The equivalence sends the image of x to GrothendieckGroup.of(x).

**Checks.**

- `segalGammaSpace_finset_sphere`: Finite pointed sets under wedge produce S by Barratt–Priddy–Quillen–Segal (C, Ex. 4). Unpointed finite sets have no zero object.
- `segalGammaSpace_zero_category`: For C the category with one object (a zero object), segalGammaSpace C is the constant point.
- `segalGammaSpace_pi0_K0`: For finite projectives, π₀ of the completed space Ω|BA_C(1)| is split K₀(R). Using π₀A_C(1) instead leaves the direct-sum monoid.
- `segalGammaSpace_not_without_sums`: iso P(R) has no categorical sums (⊕ is not a coproduct in the groupoid), so Sum_C does not apply to it directly.
- `segalGammaSpace_rank_group_completion`: Finite-dimensional vector spaces have direct-sum monoid ℕ and completed component group ℤ; rank n maps to +n and negative ranks detect failure to complete.

(C §1.2, Def. 1, Prop. 2 with proof, Thm. 3, Examples 4–5, pp. 6–8; BS Appendix §12, Prop. 12.10, Cor. 12.12 and Def. 12.13, p. 58.)

*Needs:* GeneralizedCohomology G2.8, §1.11, GeneralizedCohomology G2.8, GeneralizedCohomology G2.8, M.

### 4.25 The Segal E∞-monoid N(C) of a symmetric monoidal groupoid

For symmetric monoidal groupoid C, define `coherentSubsetGammaSpace` by coherent subset tensor diagrams, including empty-subset unit laws. It is special with N(C)(1)≃nerve C; strong braided functors give its Γ-maps. Consume BordismFormalGroups F6.5's symmetric coherence: structural composites with the same permutation agree, naturally. Use it to prove the subset-diagram equations and compare this concrete Γ-model with the supplied coherent commutative-monoid interface.

- `coherentSubsetGammaSpace`: The coherent-subset Γ-model N(C).
- `coherentSubsetGammaSpace.isSpecial`: N(C) is special.
- `coherentSubsetGammaSpace.pi0Equiv`: π₀N(C)(1)≅Skeleton C as monoids.
- `coherentSubsetGammaSpace.map`: Strong braided monoidal functors give Γ-maps with coherent composition comparisons.
- `coherentSubsetGammaSpace.level_one`: Forget unit data to compare N(C)(1) with nerve C weakly.

**Checks.**

- `coherentSubset_level_zero`: Unit coherence makes N(C)(0) contractible. If it is omitted, the discrete monoid {1,e}, e²=e, gives two idempotent empty-subset choices and two components.
- `coherentSubset_vect_pi0`: For C the core of finite free ℤ-modules under ⊕, π₀ N(C)(1) = ℕ (ranks). Equivalently use finite-dimensional vector spaces over any field.
- `coherentSubset_pic_grouplike`: For C = Pic(R), N(C) is grouplike with π₀ = Pic(R).
- `coherentSubset_naive_not_functor`: The naive assignment `S ↦ N(C)^{S∖{s}}` with `f ↦ (⊗_{t ∈ f⁻¹(t′)} X_t)` is not strictly functorial (Bhatt–Scholze Remark 12.6).

**Checks.**

- `symmetric_coherence_three`: the two braid composites on three factors agree.
- `symmetric_coherence_inverse`: a swap followed by its reverse is identity.
- `symmetric_coherence_unit`: inserting then deleting the tensor unit is identity.

(BS Appendix §12, Construction 12.5 and Remark 12.6, pp. 56–57.)

*Needs:* GeneralizedCohomology G2.8, BordismFormalGroups F6.5, §4.1, §1.34, §1.33.

### 4.26 Picard groupoids are exactly the grouplike N(C)

Prove `coherentSubsetGammaSpace.isVerySpecial_iff_picard`: every object is tensor-invertible iff π₀C is a group. A Picard groupoid gives π₀=iso-classes and π₁=Aut(1), retaining symmetry and self-braiding.

(BS Appendix §12, Prop. 12.15 and the paragraph after it, pp. 58–59.)

*Needs:* §4.25, GeneralizedCohomology G2.8, §1.34.

### 4.27 Classical Grothendieck–Witt plus spaces

Construct `classicalGrothendieckWittComparison` for symmetric unimodular ℤ-forms under orthogonal sum. Put J=⟨1⟩⊥⟨−1⟩ and O∞=colimₙ Aut(Jⁿ), with transition g↦g⊥id_J, using the integral bilinear isometry groups. Prove `unimodularForm_cofinal_J`: every such L is an orthogonal summand of some Jⁿ. Indeed L⊥(−L)⊥J is odd, indefinite and unimodular of signature (r+1,r+1), where r=rank L, so IntegralLattices 6A identifies it with J^(r+1). Prove the stable commutator is perfect, identify the completed component group with ℤ² by positive and negative signatures, and identify its unit component with BO∞⁺ at that commutator. Retain odd/even and 2-primary distinctions and this classical convention.

**Checks.**

- `unimodular_cofinal_zero`: the zero form is a summand of J⁰; its signature pair is (0,0).
- `unimodular_cofinal_lines`: ⟨1⟩ and ⟨−1⟩ are summands of J and give the two generators (1,0) and (0,1) of the completed component group.
- `unimodular_cofinal_even`: even E₈ has the explicit complement (−E₈)⊥J in J⁹. Positive powers of the even hyperbolic plane alone cannot contain an odd line as an orthogonal summand, so that stabilization would miss forms in this groupoid.

(HK III Section 3.2, pp. 54–55, cases (1)-symmetric through (−1)-quadratic.)

*Needs:* §4.18, §4.5, IntegralLattices 0A, 0E, 2C and 6A, TC (`TauCeti.BilinForm.isometryGroup`), OrthogonalSpinGroups 0C for bilinear/quadratic base change; `unimodularForm_cofinal_J` is constructed here.

### 4.28 Topological variants of functors on rings via simplicial rings

For a topological ring A, `simplicialRingOfContinuous A` is n↦C(Δⁿ,A) with pointwise operations, where Δⁿ is Mathlib's `SimplexCategory.toTop₀.obj ⦋n⦌` and simplicial operators act by precomposition. For a functor F from unital rings to simplicial sets, `topologicalVariant F A` is the realisation of the diagonal of the bisimplicial set n↦F(C(Δⁿ,A)) (§§2.17–2.18). For F valued in Γ-spaces of simplicial sets, take this diagonal at each finite pointed set. The result is a Γ-space, and it is special whenever every F(C(Δⁿ,A)) is: diagonals preserve finite products and levelwise weak equivalences (§2.23). The K-theory case of §4.30 applies this to the Segal Γ-spaces of §§4.24–4.25 and then GeneralizedCohomology G2.8's Γ-machine. A colimit in a separate ∞-category of spectra is not used as a carrier.

- `simplicialRingOfContinuous`: n↦C(Δⁿ,A), with pointwise ring operations and precomposition operators.
- `topologicalVariant`: The diagonal realisation for simplicial-set-valued F, taken objectwise in Γ for Γ-space-valued F.
- `topologicalVariant.unit`: The map from F(A) induced by constant functions.
- `topologicalVariant.map`: Natural in F and in continuous ring maps.
- `topologicalVariant.isSpecial`: Levelwise special input gives a special Γ-space.

**Checks.**

- `topologicalVariant_const`: For a constant functor F, topologicalVariant F A ≃ F A.
- `topologicalVariant_discrete_ring`: For A with the discrete topology, C(Δⁿ, A) = A and topologicalVariant F A ≃ F A.
- `topologicalVariant_units_components`: Let F send R to the discrete simplicial set on Rˣ. Then topologicalVariant F ℝ has exactly two path components, given by the sign of a nowhere-zero function on the connected simplex, whereas F(ℝ)=ℝˣ is uncountable.

(HK III Section 3.2, proof of Lemma 3.2.11, p. 59; Sch §10, p. 90.)

*Needs:* §2.17, §2.18, §2.23, §4.24, §4.25, GeneralizedCohomology G2.8, M.

### 4.29 Finite projective modules and general linear groups over C(Δⁿ,k)

Let k be ℝ or ℂ. Prove `continuousFunctions_projective_free`: every finitely generated projective module over C(Δⁿ,k) is free. Present the module by an idempotent matrix e. The straight-line contraction of Δⁿ to a vertex gives a continuous path of idempotents from e to a constant idempotent. Two idempotents f, f′ in a unital Banach algebra with `‖f − f′‖·‖2f − 1‖ < 1` are conjugate by `ff′ + (1 − f)(1 − f′)`, so compactness of the path conjugates e to a constant idempotent, whose image is free. Since C(Δⁿ,k) is commutative and nonzero, ranks are invariant. Hence §4.15's functor from `BasedFree (C(Δⁿ,k))` to the finite-projective core is an equivalence of symmetric monoidal groupoids, natural in the simplicial operators.

Construct `continuousGL_simplicialEquiv`: GLᵣ(C(Δⁿ,k))≅C(Δⁿ,GLᵣ(k)) as groups, from Mathlib's `ContinuousMap.unitsLift` and the entrywise matrix identification, natural in the simplicial operators. Thus n↦GLᵣ(C(Δⁿ,k)) is the singular simplicial group of the topological group GLᵣ(k). The identification commutes with stabilization g↦diag(g,1), block sum, permutation conjugation and the Kronecker product, using GeneralizedCohomology G5.4's lexicographic index (i,j)↦i·s+j.

Construct `polarInclusion`: the inclusions O(r)→GLᵣ(ℝ) and U(r)→GLᵣ(ℂ) are homotopy equivalences via the deformation `g ↦ g·(g*g)^(−t/2)`, which fixes O(r) and U(r). For k=ℝ this is GeneralizedCohomology G2.9's polar deformation. Since `|g ⊕ h| = |g| ⊕ |h|` and `|g ⊗ h| = |g| ⊗ |h|`, the deformation commutes with block sum, Kronecker product and permutation conjugation. The inclusions are therefore identity-on-objects strict bipermutative functors.

**Checks.**

- `continuousFunctions_projective_point`: at n=0, C(Δ⁰,k)=k, and the statement is that finite-dimensional vector spaces are free.
- Over C(S¹,ℝ) the sections of the Möbius line bundle form a rank-one finite projective module that is not free, since a basis element would be a nowhere-vanishing section. Contractibility of Δⁿ is used.
- `continuousGL_one_real_components`: for r=1 and k=ℝ the realised simplicial group n↦GL₁(C(Δⁿ,ℝ)) has two path components, matching O(1)={±1}, whereas GL₁(ℝ) has uncountably many elements.

(Sch Lemma 10.1, p. 90, with proof, pp. 92–93; proof of Prop. 10.2, p. 90; §10.1, p. 92.)

*Needs:* §4.15, §4.28, GeneralizedCohomology G2.9 and G5.4, M.

### 4.30 Topological K-theory of ℝ and ℂ from function rings

For k=ℝ, ℂ define Kᵗᵒᵖ(k) as G2.8's Γ-machine applied to `topologicalVariant` of the finite-projective Segal Γ-space of §4.24 at A=k. Prove `topologicalKComparison`: Kᵗᵒᵖ(ℝ)≃ko and Kᵗᵒᵖ(ℂ)≃ku as connective spectra, compared with GeneralizedCohomology G5.4's models. Through the based-free bipermutative model of step 2 it is an equivalence of commutative ring spectra, and it carries their units and Bott maps.

1. By §4.29 and §§4.23 and 4.25, the finite-projective Γ-space of C(Δⁿ,k) is levelwise equivalent to the coherent-subset Γ-space of `BasedFree (C(Δⁿ,k))`, naturally in n.
2. By `continuousGL_simplicialEquiv`, the simplicial object n↦`BasedFree (C(Δⁿ,k))`, with block sum and Kronecker tensor, is a bipermutative category with objects r≥0, enriched in the singular simplicial groups of GLᵣ(k). Its diagonal Γ-space is the one in step 1.
3. Realise the hom-objects (§2.20 keeps the products). The counit |Sing GLᵣ(k)|→GLᵣ(k) and `polarInclusion` are identity-on-objects strict bipermutative functors and weak equivalences on every endomorphism space, connecting this category with G5.4's O(r) and U(r) categories. G2.8's additive and multiplicative machines carry these to equivalences, and G5.4's Bott classes transport along them.
4. Deduce `topologicalK_unitComponent`: the fibre sequence `BGL(k)^top → Ω∞Kᵗᵒᵖ(k) → K₀(k)`, where π₀ is constant in n by §4.29.

**Checks.**

- `topologicalVariant_pi0_K`: π₀ Kᵗᵒᵖ(ℝ) = K₀(ℝ) = ℤ.
- `topologicalVariant_not_discrete_K1`: π₁ Kᵗᵒᵖ(ℝ) = ℤ/2 differs from K₁(ℝ) = ℝ^×, so the topological variant is not the algebraic K-theory.
- `π₂ku=π₂KU=ℤ`, `π₁ku=π₁KU=0`, `π₁ko=π₁KO=ℤ/2` and `π₄ko=π₄KO=ℤ`. The connective covers have zero negative homotopy, whereas `π₋₂KU=ℤ` and `π₋₈KO=ℤ`.
- The rank-one free module goes to the unit of ko or ku, and the class of the trivial rank-n module to n in π₀.

(HK III Section 3.2, proof of Lemma 3.2.11, p. 59; Sch Prop. 10.2 with proof, pp. 90–91.)

*Needs:* §4.15, §4.23, §4.24, §4.25, §4.28, §4.29, §2.18, §2.20, §2.23, GeneralizedCohomology G2.8 and G5.4, M.

### Examples

The category of all finite projective-module maps has a zero object and a contractible classifying space; its core has a different nerve. For free modules, the component monoid is ℕ and its group completion is ℤ. For a finite-dimensional-vector-space core, the zero component is the stable general-linear-group plus construction. Cofinality uses an actual complement.

### Dependencies

Layers 1–3, algebraic Grothendieck groups and the local stable linear-group/projective-complement foundations; §§4.28–4.30 add simplicial-space realisation and GeneralizedCohomology's Γ-machine and K-theory models.

## Layer 5: Comparisons for the supplied symmetric spectra

### 5.1 Loop, suspension and shift of spectra

Define suspension, strict loops and their adjunction, and (sh X)ₙ=X₁₊ₙ with the first-letter-fixing subgroup action. Define λ:S¹∧X→sh X by twist, σ and χₙ,₁, verifying the spectrum-map permutation identity. Homotopy calculations of strict loops use Kan levels.

- `loop`: Levelwise pointed S¹-mapping object; use Kan replacement for derived loops.
- `susp`: Levelwise S¹∧X.
- `suspLoopAdj`: susp⊣loop.
- `shift`: (sh X)ₙ=X₁₊ₙ with restricted actions.
- `lambda`: The σ-derived map λ:S¹∧X→sh X.

**Checks.**

- `loop_trivial`: loop of the trivial spectrum is trivial.
- `naivePi_shift`: For semistable X, π̂ₖ₊₁(sh X)≅π̂ₖX; F₁S¹ fails the unrestricted comparison.
- `loop_susp_sphere`: susp sphere ≅ shift sphere ≅ suspensionSpectrum S¹ (Schwede I Example 3.9) and naivePi (susp sphere) 1 ≅ ℤ.
- `shift_not_susp`: `λ_{F₁S¹} : S¹ ∧ F₁S¹ → sh(F₁S¹)` is not a `π̂_*`-isomorphism (it is the inclusion of a wedge summand with non-zero complement, Schwede I Example 8.30), so `F₁S¹` is not semistable.

(S I, §2.1 and Prop. 2.6, pp. 23–24; S I, Example 3.9, p. 37.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.6, GeneralizedCohomology G2.1.

### 5.2 The naive homotopy long exact sequence of a mapping cone

For every spectrum map f, prove the naive cone LES in all integer degrees. Its boundary is C(f)→S¹∧X followed by inverse suspension. Use sequential cones after forgetting actions, without semistability.

(S I, (2.11), Prop. 2.12 and proof, pp. 26–28.)

*Needs:* GeneralizedCohomology G2.6, §5.1, §5.7.

### 5.3 The naive homotopy long exact sequence of a homotopy fibre

Construct path fibres after functorial Kan replacement and their natural naive LES π̂ₖF→π̂ₖX→π̂ₖY→π̂ₖ₋₁F. Boundary comes from ΩY→F and inverse loop shift; strict signatures require Kan source/target levels.

(S I, (2.15), Prop. 2.17 and proof, pp. 29–30.)

*Needs:* GeneralizedCohomology G2.6, §5.1, §5.7, §2.5, M.

### 5.4 Semistable symmetric spectra

Prove that the supplied semistability predicate is equivalent to λ being a π̂-isomorphism. Prove invariance under π̂-isomorphisms and closure under wedges, finite products, suspension, shift and cones. Ω- and suspension spectra qualify; F₁S¹ is the counterexample to unrestricted semistability.

- `semistable_iff_lambda`: semistability is equivalent to λ_X being a π̂-isomorphism.
- `IsSemistable.of_omega`: Ω-spectra are semistable.
- `IsSemistable.of_suspension`: Suspension spectra are semistable.
- `IsSemistable.of_naivePiIso`: A π̂-isomorphism f:X→Y gives semistability(X)↔semistability(Y).

**Checks.**

- `isSemistable_sphere`: The sphere spectrum is semistable.
- `isSemistable_trivial`: The trivial spectrum is semistable.
- `not_isSemistable_free_one`: free 1 S¹ is not semistable.

(S I, Def. 3.14, p. 38; S I, Propositions 3.15–3.16, pp. 38–39.)

*Needs:* §5.1, GeneralizedCohomology G2.6, GeneralizedCohomology G2.3 and G2.6, GeneralizedCohomology G2.2 and G2.5, §5.2.

### 5.5 Stable equivalences of symmetric spectra

Construct the injective Ω replacement and prove the supplied stable-equivalence predicate equivalent to bijective [Y,E]→[X,E] for all injective Ω E, using the pointed simplicial cylinder quotient. Injective means lifting against every mono level equivalence. Give two-out-of-three and inclusion of level equivalences; a π̂-isomorphism is sufficient rather than definitional.

- `stableEquivalences_iff_injectiveOmega`: The supplied stable-equivalence predicate agrees with detection by homotopy classes into injective Ω-spectra.
- `stableEquivalences.twoOutOfThree`: Two-out-of-three; includes level equivalences.
- `IsInjective`: Extension against every mono that is a level equivalence.
- `homotopyClasses`: Maps modulo simplicial homotopy, with contravariant precomposition.

**Checks.**

- `stableEquivalence_id`: The identity is a stable equivalence.
- `stableEquivalence_free_one_sphere`: free 1 S¹ → sphere is a stable equivalence.
- `stableEquivalence_levelwise`: A levelwise weak homotopy equivalence of symmetric spectra is a stable equivalence.
- `not_stableEquivalence_zero_sphere`: The map from the trivial spectrum to the sphere spectrum is not a stable equivalence: π₀ differs.
- `fibre_cone_boundary_sign`: For a Kan-level fibre, cone boundary after suspended fibre boundary is minus the target inclusion.

(HSS Def. 3.1.3; S I, Thm. 6.2, p. 107; S I, Def. 4.11, p. 65.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.3 and G2.6, §2.1.

### 5.6 The smash pairing of true π-groups

Construct the biadditive point-set pairing πₖX×πₗY→πₖ₊ₗ(X∧Y). Verify units, associativity, twist (−1)ᵏˡ and the two suspension compatibilities, with sign (−1)ᵏ in the second variable. Compare it with derived smash through ∧ᴸ→∧.

(S I, Thm. 6.16, p. 116.)

*Needs:* GeneralizedCohomology G2.6, GeneralizedCohomology G2.2, §5.1.

### 5.7 Mapping cones and homotopy fibres of spectra

Construct the point-set cone adapter C(f) with the interval pointed at zero, attaching X to Y at one, and projection C(f)→S¹∧X. Compare it with GeneralizedCohomology G2.4’s derived cone by interval reflection t↦1−t, retaining the boundary sign. Express the supplied derived fibres with ΩY→F→X on the corresponding endpoint model. Both are square-functorial; C(id) is contractible and C(X→0)=ΣX, fixing boundary endpoints.

- `mappingCone`: The cone with Y→C(f)→S¹∧X.
- `homotopyFiber`: The path fibre with ΩY→F(f)→X; replace non-Kan levels first.
- `mappingCone.map`: Strict squares give functorial cone and fibre maps.

**Checks.**

- `mappingCone_id_trivial`: mappingCone (𝟙 X) is stably contractible.
- `mappingCone_toZero`: mappingCone (X ⟶ 0) ≅ susp X.
- `homotopyFiber_fromZero`: for Kan-level Y the strict path fibre of 0→Y is loop Y. In general the derived fibre is isomorphic in SHC to the derived loop spectrum.
- `mappingCone_not_quotient`: For a non-injective map, the strict cofibre (quotient) differs from the mapping cone: for X ⟶ 0 the quotient is 0 but the mapping cone is susp X.

(S II, Examples 2.4 and 2.6, pp. 229–230; S I, (2.10) and (2.14), pp. 27–29.)

*Needs:* GeneralizedCohomology G2.2, §5.1, GeneralizedCohomology G2.10.

### 5.8 Fibre and cofibre sequences agree up to a shift

For Kan-level X,Y, prove h:S¹∧F(f)→C(f) a π̂-isomorphism and stable equivalence. Derive the general comparison; its adjoint uses cone Kan replacement. Fix the boundary sign h_*(S¹∧δ_F(y))=−i_*(y) with these interval endpoints.

(S I, (2.16) and Prop. 2.17, p. 29.)

*Needs:* §5.2, §5.7, §5.5, §5.1, GeneralizedCohomology G2.6, §5.3.

### 5.9 Finite wedges and products of spectra agree

Prove finite wedge→product a π̂-isomorphism and stable equivalence, characterised by all four entries (id,0;0,id). Arbitrary wedges give direct-sum naive groups; only finite products are asserted. Deduce SHC biproducts.

(S I, Prop. 2.19, p. 30.)

*Needs:* GeneralizedCohomology G2.6, §5.5, §5.2, GeneralizedCohomology G2.6.

### 5.10 The derived smash product on the stable homotopy category

Characterize the supplied flatness predicate by preservation of level cofibrations under X∧−. Equivalently each latching map LₙX→Xₙ is a cofibration of underlying pointed simplicial sets; no free Σₙ-action is required for this criterion. Construct functorial flat resolutions and prove smashing with a flat spectrum preserves stable equivalences. Use the supplied closed symmetric monoidal SHC product, exact in each input with unit S. The coherent lax symmetric comparison γX∧ᴸγY→γ(X∧Y) is invertible if either input is flat. (S, Def. I.5.41, p. 98; Prop. I.5.47, p. 100.)

**Checks.**

- `flat_sphere`: S and free spectra FₙK are flat.
- `flat_truncated_sphere`: S with its zero level deleted is not flat: its degree-two latching map identifies the two permutation copies.
- `flat_zero`: the zero spectrum is flat; smashing with it gives zero.

(S II, Thm. 3.1, p. 239; S II, Prop. 3.19 and (3.20), pp. 248–249.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.4–G2.6, GeneralizedCohomology G2.4.

### 5.11 The smash pairing on π-groups

Use GeneralizedCohomology G2.4’s derived bilinear pairing, defined by smashing representing sphere maps and precomposing its sphere-factor isomorphism α. The additional targets here are shifted-map naturality and comparison with the point-set pairing; associativity, units and graded twist are retained from the supplier. For a degree-m′ second map and degree-n first class, the shifted naturality sign is (−1)ᵐ′ⁿ. Compare with the point-set pairing through the lax map.

- `piPairing_naturality`: For a degree-m′ second map and x∈πₙ, (f∧f′)_*(xy)=(−1)ᵐ′ⁿf_*(x)f′_*(y), with shifted tensor identifications.
- `piPairing_comp_psi`: The comparison ψ:X∧ᴸY→X∧Y sends the pairing to the point-set product.

**Checks.**

- `piPairing_sphere_ring`: pi S * with piPairing is a graded-commutative ring with pi S 0 ≅ ℤ.
- `piPairing_sphere_unit`: For Y = S and the unit 1 ∈ π₀S, x · 1 corresponds to x under X ∧ᴸ S ≅ X (unit isomorphism), for every x ∈ π_p X.
- `piPairing_iota_iota`: ι₁·ι₁ generates π₂(S¹∧ᴸS¹)=ℤ under the sphere-factor isomorphism; its swapped value is the negative generator.
- `piPairing_not_commutative`: piPairing is not commutative without sign: for ι ∈ pi S¹ 1 (S¹ = ΣS), ι · ι = −τ_*(ι · ι).
- `koszul_two_ones`: Swapping the degree-one sphere generators negates their degree-two product; swapping degrees zero and one does not.

(S II, Prop. 4.11, p. 252.)

*Needs:* §5.10, GeneralizedCohomology G2.4 and its conventions, GeneralizedCohomology G2.6.

### 5.12 Connectivity of smash products

For (k−1)-connected X and (l−1)-connected Y, prove X∧ᴸY (k+l−1)-connected and πₖX⊗πₗY≅πₖ₊ₗ(X∧ᴸY). This bottom-degree isomorphism does not extend to all degrees.

(S II, Prop. 5.22, p. 264.)

*Needs:* GeneralizedCohomology G2.4 and G3.8, §5.11, §5.10.

### 5.13 Operads and E∞-algebras in symmetric spectra

Define operads of symmetric spectra with right symmetric-group actions, unit S→O(1), substitution, and all associativity, unit, block permutation and equivariance equations. Define O-algebras by the action maps and equations. Reuse GeneralizedCohomology G2.8's Barratt–Eccles algebra and positive rectification API, extending it to all spectrum-valued operads. Include simplicial E∞ operads and their spectrum realisation and Com-algebras as commutative ring spectra. For spectra of pointed simplicial sets, use the stable positive model structure: every spectrum-valued operad is admissible, and an aritywise stable equivalence induces an extension–restriction Quillen equivalence. No Σ-cofibrancy hypothesis is imposed in this positive statement. Derived functors use cofibrant algebra replacements; it does not assert that their underlying spectra are positively cofibrant. Thus Σ∞₊EΣₙ→Com rectifies E∞ rings. Name `operadPositiveModel` and `operadRectification`. (Pavlov–Scholbach, Thms. 4.1 and 4.6, Ex. 4.7, pp. 17–18.) Consume BordismFormalGroups F6.5's generic infinity-operad interfaces to define the abstract Eₙ-algebra interfaces. For every simplicial operad O, construct `operadInfinityComparison`: localization of O-algebras in concrete spectra is equivalent to algebras over the supplied operadic nerve of O in Sp∞, including derived mapping spaces. Apply this to Eₙ for Layer 7 (Pavlov–Scholbach, Thm. 4.9, p. 19).

- `Operad`: Spectrum-valued operads with all equivariant unit/composition axioms.
- `Operad.Algebra`: Full operad actions on spectra.
- `Operad.ofSSet`: Apply Σ∞₊ aritywise to a simplicial operad.
- `Operad.comAlgebraEquiv`: Com-algebras≅commutative symmetric ring spectra.
- `SSetOperad.IsEInfty`: Each simplicial arity space P(n) is weakly contractible and its Σₙ action is free, including arity zero.
- `Operad.IsEInfty`: A spectrum operad O comes with an augmentation O→Com which is an aritywise stable equivalence; this is the spectral recognition predicate. In particular O=Σ∞₊P for a simplicial E∞ operad has this predicate. Its arity spectra are equivalent to S, rather than contractible spectra. Freeness of the simplicial action is part of the chosen space model, not a point-set freeness requirement on every spectrum operad equivalent to Com.
- `Operad.ofSSet_isEInfty`: The simplicial predicate implies the spectral predicate through the augmentation.
- `Operad.eInfty_rectification`: Extension/restriction along this augmentation is a Quillen equivalence for positive stable algebra models.

**Checks.**

- `operad_com_algebra_HR`: For a commutative ring R, HR is a Com-algebra.
- `operad_trivial_algebra`: The trivial spectrum is an algebra over every operad.
- `operad_ass_ring_compat`: Algebras over the associative operad are exactly symmetric ring spectra (GeneralizedCohomology G2.4).
- `operad_moore_two_not_A2`: S/2 admits no algebra structure over the associative operad, nor any unital A₂-structure.

**Checks.**

- `operad_unit`: the operad concentrated in arity one with value S has algebras equal to spectra; it is not E∞, since its arity-two spectrum is zero rather than S.
- `operad_einfty_not_contractible_spectra`: the Barratt–Eccles arity spectrum Σ∞₊EΣ₂ has π₀=ℤ, while a contractible spectrum has π₀=0. Com has the spectral predicate although its simplicial commutative model has a nonfree Σ₂ action.
- `operad_comm`: Com-algebras have the commutative ring-spectrum equations.
- `operad_rectification`: Barratt–Eccles→Com gives a positive Quillen equivalence; no absolute Ω replacement of the sphere by a commutative ring is inferred.

(S III, Definitions 5.3–5.4 and Examples 5.9–5.12, pp. 368–370.)

*Needs:* GeneralizedCohomology G2.2, GeneralizedCohomology G2.4, GeneralizedCohomology G2.8, GeneralizedCohomology G2.1–G2.4, BordismFormalGroups F6.5.

### 5.14 HR as a ring spectrum and HR-modules

Extend GeneralizedCohomology G2.7’s commutative HR construction to every unital associative ring R, identifying its π₀ ring, and HM for Module Rᵐᵒᵖ M with its actual right action. Prove Ho(HR-Mod)≃D(right R-modules) as triangulated categories, compatible with underlying spectra; commutative R identifies relative smash with derived tensor. Matrix-unit order pins handedness.

- `eilenbergMacLaneRing`: HR with its ring structure, underlying H(R,+).
- `eilenbergMacLaneRing.isCommutative`: HR is commutative when R is.
- `eilenbergMacLaneModule`: For Module Rᵐᵒᵖ M, HM is a right HR-module.
- `eilenbergMacLaneRing.piRingEquiv`: π₀HR≅R as rings.
- `eilenbergMacLaneModule.carrierIso`: The module’s underlying spectrum is HM.

**Checks.**

- `eilenbergMacLaneRing_Z_pi`: pi (eilenbergMacLaneRing ℤ) 0 ≃+* ℤ.
- `eilenbergMacLaneRing_zero`: eilenbergMacLaneRing of the zero ring is the trivial ring spectrum.
- `eilenbergMacLaneRing_unit_compat`: The unit S → HR induces ℤ → R on π₀, the canonical ring map.
- `eilenbergMacLaneRing_smash_not_self`: HF₂ ∧ᴸ HF₂ is not HF₂: its π₁ is nonzero (the dual Steenrod algebra has ξ₁ in degree 1), so HR ∧ᴸ HR ≠ HR in general.
- `eilenbergMacLaneModule_pi0_action`: for M=ℤ as a right ℤ-module, HM has π₀=ℤ with its usual right multiplication and zero homotopy in every other degree; both the nonzero carrier and its action are retained.
- `eilenbergMacLaneModule_zero`: The zero right R-module gives a stably zero HR-module spectrum.
- `eilenbergMacLaneModule_right_order`: The regular right action over M₂(ℤ) sends (e₁₂,e₂₁) to e₁₁. The reversed product is e₂₂.

(S I, Example 1.14, p. 16; S IV, definition preceding Thm. 1.3, p. 386.)

*Needs:* GeneralizedCohomology G2.7, GeneralizedCohomology G2.4.

### 5.15 The Eilenberg–Mac Lane spectrum of a chain complex

Construct the unbounded cochain-to-HR-module functor and its underlying spectrum functor at R=ℤ, inducing D(ℤ)≃Ho(Hℤ-Mod). Its homotopy/shift identifications follow below; cochain degree two gives π₋₂. Construct the projective model on unbounded complexes (weak equivalences quasi-isomorphisms, fibrations degreewise surjections), the stable model on spectra in simplicial R-modules, and the weak monoidal Quillen zigzag through nonnegative chain-complex spectra. Name `complexProjectiveModel`, `simplicialModuleStableModel`, `HRModDerivedEquiv`, with derived unit/counit isomorphisms and their suspension compatibility (Sh, Prop. 2.10, p. 7, and §§3–4, pp. 10–21).

- `eilenbergMacLaneComplex`: The full cochain-complex-to-Hℤ-module functor and its underlying spectrum functor, with naturality and shift comparisons.
- `eilenbergMacLaneComplex.quasiIso`: Quasi-isomorphisms induce stable equivalences.
- `HRModDerivedEquiv`: For commutative R, Ho(HR-Mod)≃D(ModuleCat R) as triangulated categories.

**Checks.**

- `eilenbergMacLaneComplex_zero`: The zero complex goes to a stably trivial spectrum.
- `eilenbergMacLaneComplex_single`: eilenbergMacLaneComplex (A concentrated in degree 0) is stably equivalent to eilenbergMacLane A.
- `eilenbergMacLaneComplex_negative`: For the cochain complex C = ℤ concentrated in degree +2, pi (H C) (−2) ≅ ℤ: negative homotopy is retained. Cochain degree −2 instead gives π₂=ℤ.
- `eilenbergMacLaneComplex_sees_differential`: For C = (ℤ →·2 ℤ) in homological degrees 1, 0 (cochain degrees −1, 0), H(C) is not stably equivalent to H(C₀) ∨ ΣH(C₁) = HZ ∨ ΣHZ: π₀ H(C) = ℤ/2 ≠ ℤ.

**Checks.**

- `complex_model_zero`: the zero complex gives the zero module spectrum.
- `complex_model_acyclic`: ℤ→¹ℤ gives a contractible spectrum.
- `complex_model_unbounded`: arbitrary negative cochain degrees are retained, including ℤ in degree −2 with π₂=ℤ.

(Sh §2, p. 6; Cor. 2.15; Sh Theorem 2.5, p. 5.)

*Needs:* §5.14, GeneralizedCohomology G2.7, GeneralizedCohomology G2.4, GeneralizedCohomology G2.4, M.

### 5.16 Complex homology and spectrum homotopy

Prove πₖH(C)≅H⁻ᵏ(C) and H(C[1])≅ΣH(C), naturally for unbounded cochains and Mathlib's shift C[1]ⁿ=Cⁿ⁺¹. The derived functor is exact and H(A[0])≅HA. A degree-two group moves from π₋₂ to π₋₁ after [1].

**Checks.**

- `cochain_shift_witness`: ℤ in cochain degree 2 has spectrum π₋₂=ℤ; after [1] the nonzero group is π₋₁.

(Sh Cor. 2.15, p. 8.)

*Needs:* §5.15, GeneralizedCohomology G2.4, GeneralizedCohomology G2.6, GeneralizedCohomology G2.4–G2.6, GeneralizedCohomology G3.8, §5.13 and §5.18, M.

### 5.17 Cellular approximation in triangulated categories with sums

Let T be triangulated with arbitrary sums, C a set of compact objects, and E:Tᵒᵖ→Ab cohomological and carrying sums to products. Construct R in the closure of C under sums and extensions to the right, and u∈E(R), such that [G,R]→E(G), f↦E(f)(u), is bijective for every G∈C. Build the sequential cellular approximation and its telescope. Use the supplied sphere compactness and generation to specialize this construction to SHC; generic categorical representability is used only after constructing the object. Prove `connectiveSphereInduction`: if an isomorphism-invariant class of spectra contains Sⁿ and is closed under arbitrary coproducts and right extensions in distinguished triangles, it contains every spectrum with π_k=0 for k<n. Prove the attachment connectivity and all-π comparison. For every contravariant cohomological F:SHCᵒᵖ→Ab taking coproducts to products, prove the generic Milnor sequence `0→lim¹F(ΣX_i)→F(hocolim X_i)→lim F(X_i)→0`, with naturality under coherent model maps. This general functor statement supplements the represented-theory telescope contract.

(S II, Prop. 5.14, pp. 260-261.)

*Needs:* GeneralizedCohomology G2.4, GeneralizedCohomology G3.4 and G3.7, GeneralizedCohomology G2.6.

### 5.18 Connective spectra are sequences of deloopings

Use GeneralizedCohomology G2.5’s sequential/symmetric Quillen equivalence, including its replaced unit/counit, stable π comparison and Kan Ω models. Compare connective Ω-spectra with deloopings whose ith space has πⱼ=0 for j<i. Here `spectraInfinityCategory` denotes BordismFormalGroups F6.5's supplied monoidal stable Sp∞, with its SHC and derived-smash comparisons. The additional target compares connective sequential Ω-models with the connective objects of that carrier, preserving suspension, zero objects, cofibre sequences and those ambient fibre sequences whose fibre is connective.

**Checks.**

- `spectra_infinity_zero`: the zero spectrum is both initial and terminal.
- `spectra_infinity_cofibre`: the cofibre of id:S→S is zero, and its square is also a pullback.
- `spectra_infinity_unit`: tensoring with S is identity; ΣS has π₁=ℤ and π₀=0.

(BS Appendix §12, Def. 12.8 and footnote 29, p. 57; HSS Thm. 4.3.2, p. 42.)

*Needs:* GeneralizedCohomology G2.3 and G2.6, GeneralizedCohomology G2.1–G2.4, GeneralizedCohomology G2.4–G2.6, GeneralizedCohomology G2.4, §5.10, GeneralizedCohomology G3.8, BordismFormalGroups F6.5.

### 5.19 Picard groupoids are 1-truncated connective spectra

For a Picard groupoid C, construct K(C) with zero space BC, π₀=iso-classes, π₁=Aut(1) and other π zero. Prove the homotopy-theory equivalence with 1-truncated connective spectra, retaining transformations and self-braiding as the Hopf-map action.

**Checks.**

- `picard_discrete_group`: a discrete abelian group A gives HA, with π₀=A and π₁=0.
- `picard_one_object`: the one-object Picard groupoid with automorphisms A gives ΣHA.
- `picard_self_braiding`: graded lines over ℝ have the odd-line self-swap −1, so η on the odd component is nonzero.

(BS Appendix §12, after the proof of Prop. 12.15, p. 59.)

*Needs:* GeneralizedCohomology G2.8, §4.26, §1.34, GeneralizedCohomology G3.8.

### Examples

The sphere spectrum has π₀ = ℤ and no negative groups. The free symmetric spectrum in level one shows why naive groups need not compute stable groups. A two-sphere-factor twist in degrees one and one acts by −1. The Eilenberg–Mac Lane spectrum of ℤ has precisely one nonzero homotopy group, in degree zero.

### Dependencies

Layers 1–4 and Mathlib’s model, monoidal, derived and triangulated APIs; the supplied spectral models are used through the stated comparisons.

## Layer 6: Assembly of the K-theory spectrum

### 6.1 The K-theory symmetric spectrum of a Waldhausen category

Build the Waldhausen inputs locally before the spectrum assembly. A Waldhausen category has a zero object, subcategories of cofibrations and weak equivalences containing all isomorphisms, zero-to-object cofibrations, closure of cofibrations under pushout along arbitrary maps, and the weak-equivalence gluing axiom for pushout squares. Define exact functors preserving this data, the cofibration-sequence category, and SₙC as functors Ar[n]→C with zero diagonal and the specified cofibration/pushout quotient squares. Construct `S.waldhausenStructure` before iterating S: weak equivalences are objectwise, and A→B is a cofibration precisely when `B₀ᵢ ⊔_{A₀ᵢ} A₀ⱼ → B₀ⱼ` is a cofibration for every 0≤i≤j≤n. Prove pushout stability and gluing and that every face and degeneracy is exact, preserving the quotient squares. Then form the iterated multisimplicial construction. Define simplicial-set levels K(C)ₙ by diagonal nerves of wS⁽ⁿ⁾C, with realisation |wS⁽ⁿ⁾C| with Σₙ acting by permutation of directions, construct structure maps and prove iterated equivariance. This unreplaced spectrum has zeroth simplicial level nerve(wC). Section 6.2 constructs a levelwise Kan replacement and a connective Ω-model whose realised zero space is weakly equivalent to Ω|wS.C|.

- `WaldhausenCategory.kSpectrum`: The iterated-S symmetric spectrum, with pointed simplicial-set levels diag N(wS⁽ⁿ⁾C) realising to |wS⁽ⁿ⁾C|, using the full local Waldhausen axioms.
- `WaldhausenCategory.kSpectrum.map`: Exact functors give spectrum maps preserving identities/composition.
- `WaldhausenCategory.kSpectrum.level_zero`: Level zero is nerve(wC).
- `WaldhausenCategory.kSpectrum.sequentialComparison`: Compare with Ω|wS•C|, |wS•C|, |wS•S•C|,… using the specified shift and replacement.

**Checks.**

- `kSpectrum_zero_category`: kSpectrum of the trivial Waldhausen category (one object) is the trivial spectrum.
- `kSpectrum_finiteSets_sphere`: kSpectrum of finite pointed sets is stably equivalent to the sphere spectrum (quoted Barratt–Priddy–Quillen–Segal).
- `kSpectrum_pi0_K0`: pi (kSpectrum C) 0 ≅ WaldhausenCategory.K0 C via the local generators-and-relations comparison below. The group for a non-split exact category imposes all cofibration-sequence relations, rather than just split ones.
- `kSpectrum_level_zero_not_groupCompleted`: for finite projective R-modules with isomorphisms as weak equivalences, the unreplaced level zero is nerve(wC), whose realisation has the object-isomorphism monoid as π₀. The connective Ω-model has zero space weakly equivalent to Ω|wS.C| and π₀=K₀(R). Positive Ω-fibrancy belongs to §6.2's levelwise Kan replacement.

Before assembly, define `WaldhausenCategory.K0 C` as the abelian group on object classes with [0]=0, [A]=[B] for every weak equivalence A→B, and [B]=[A]+[B/A] for every cofibration sequence. Define `K0.map` for exact functors and `K0.universal` for additive invariants satisfying these relations. Prove `kSpectrum.pi0K0Equiv`, with the class of an object sent to its loop in |wS.C|, using the one- and two-simplex presentation. This is a local topological comparison; the split-projective specialisation consumes the existing split-K₀ supplier.

**Checks.**

- `waldhausen_K0_zero`: the zero category has zero K₀ and its zero object has class zero.
- `waldhausen_K0_finite_sets`: finite pointed sets with injections and bijections have K₀≅ℤ, sending a pointed set with n non-basepoints to n; a one-point set maps to zero and a two-point set to +1.
- `waldhausen_K0_split_projectives`: split cofibration sequences of finite projectives impose exactly [P⊕Q]=[P]+[Q] and recover `TauCeti.SplitK0`. The relation [ℤ²]=2[ℤ] fixes the sign.
- `waldhausen_K0_weak_equivalence`: for bounded acyclic complexes with quasi-isomorphisms as weak equivalences, the weak equivalence to zero forces their classes to zero; an object-class monoid without the weak-equivalence relation fails this check.

The weak-equivalence subcategory need not satisfy an extra extension axiom. **API:** `WaldhausenCategory.zero`, `cof_pushout`, `weak_gluing`, `ExactFunctor.comp`, `S.obj`, `S.face`, `S.degeneracy`, `S.oneEquiv`, `S.twoEquiv`.

**Checks.**

- `waldhausen_zero`: the zero category has terminal Sₙ.
- `s_zero_one`: S₀C is terminal and S₁C recovers C.
- `s_two_quotient`: S₂C records a cofibration and its specified quotient; a composable pair without the pushout quotient square fails.
- `s_cofibration_one`: under S₁C≃C the latching condition is exactly the original cofibration condition.
- `s_cofibration_filtrationwise_failure`: over a field k, the map (0⊂0⊂k)→(0⊂k⊂k), identity on the final k, is injective at each underlying filtration stage, but its relative latching map k⊕k→k is the fold and is not injective. It is not a cofibration in S₂C; its quotient component k→0 is also not injective.
- `s_cofibration_zero`: the zero diagram maps by a cofibration to every Sₙ-object because its latching maps are the object's prescribed filtration cofibrations.
- `exact_composition`: identity and composite exact functors preserve every axiom.
- `exact_not_cofibrations`: a zero-preserving functor that fails to preserve cofibrations is not exact.

(S I, Example 3.50, pp. 55–57; W IV §8.3, the Waldhausen-structure paragraphs before Definition 8.3.1, pp. IV.67–68, and Infinite Loop Structure 8.5.5, p. IV.69; Waldhausen, §§1.1–1.3, pp. 318–330.)

*Needs:* GeneralizedCohomology G2.2, §2.17, §2.18, M. Build the category, exact functors, S-diagrams and K₀ presentation first, then the iterated spectrum and its component presentation. Section 6.2 supplies the positive delooping and Kan-replacement comparisons.

### 6.2 The iterated S.-construction is a connective Ω-spectrum

Prove Waldhausen additivity |wS•E(C)|≃|wS•C|×|wS•C| by source/quotient. Construct the relative S-construction and its contraction/fibre sequence to prove that the realised adjoint structure maps |wS⁽ⁿ⁾C|→Ω|wS⁽ⁿ⁺¹⁾C| are weak equivalences for n≥1. Define `WaldhausenCategory.kSpectrumLevelFibrant C` by GeneralizedCohomology G2.3's functorial level-fibrant replacement of the symmetric spectrum, retaining the replacement spectrum map. Its levels are Kan, and the positive delooping comparisons imply positive Ω-fibrancy. The raw diagonal nerves need not be Kan.

- `WaldhausenCategory.kSpectrumLevelFibrant_isPositiveOmega`: The levelwise Kan replacement is a positive Ω-spectrum, with its positive deloopings compared through the replacement maps.
- `WaldhausenCategory.kSpectrum.isSemistable`: The unreplaced spectrum is semistable, by stabilisation of its realised positive-level homotopy groups.

Apply the supplied stable Ω-replacement to obtain the connective Ω-model. Compare its positive levels with `WaldhausenCategory.kSpectrumLevelFibrant C` and its realised zero space with Ω|wS•C|. The level-fibrant replacement map at zero is a weak equivalence from nerve(wC); the exact nerve description applies to the unreplaced spectrum.

**Checks.**

- `kSpectrum_finiteSets_not_Kan`: for finite pointed sets with injections and bijections, the raw first level has a Λ²₀ horn whose d₂ edge is the identity of a set A with one non-basepoint and whose d₁ edge is the identity of the zero object. All vertices are the zero vertex. A filler would contain a filtration A↣0, which is impossible.
- `kSpectrum_levelFibrant_finiteSets_components`: the replacement's zero level retains π₀=ℕ from nerve(wFinSet*), whereas its connective Ω-model has π₀=ℤ. The positive replacement comparison preserves the generator represented by the two-point set.
- `kSpectrum_levelFibrant_zero`: for the zero Waldhausen category every replacement level is weakly contractible, and the comparison with the zero spectrum is a level weak equivalence.

(W IV Prop. 8.4 with proof, Def. 8.5, 8.5.3–8.5.5, pp. IV.68–69; W V Prop. 1.7 and Remark 1.7.1, p. V.8; S I, Prop. 8.26(i) and Example 8.27, pp. 182–183; Waldhausen, Thm. 1.4.2, p. 336, and Prop. 1.5.3, p. 342.)

*Needs:* §6.1 (Waldhausen/S foundations and unreplaced spectrum), GeneralizedCohomology G2.3 and G2.6, §5.4. Prove additivity before the relative-S fibre sequence, realised positive delooping and Kan-replacement comparisons.

### 6.3 Functoriality and homotopy invariance of the K-theory spectrum

Construct exact-functor comparisons from finite-projective S-construction K-theory to the split-exact Γ/group-completion model, recovering K₀ and unit component BGL⁺. Preserve the split/non-split distinction. Separately prove the Barratt–Priddy–Quillen–Segal equivalence K(FinSet*)≃S with its intermediate categories.

(W IV Infinite Loop Structure 8.5.5, last paragraph, p. IV.69.)

*Needs:* §6.1, §6.2, §1.10, §4.24 and GeneralizedCohomology G2.8, §5.5.

### Examples

The zero Waldhausen category assembles to the zero spectrum. Finite-dimensional vector spaces over a field recover their algebraic K₀ in degree zero. A mere sequence of realisations has no Ω-spectrum conclusion until the relative-S delooping equivalence is supplied.

### Dependencies

Layers 1–5 and local Waldhausen/additivity/relative-S targets; full group-completion and spectrum comparisons.

## Layer 7: Coefficients, completion and filtrations

### 7.1 Moore spectra S/m

For m≥1 define S/m as a cone of m:S→S, with triangle S→S→S/m→ΣS. It is connective, has π₀=ℤ/m and ordinary integral homology concentrated in degree zero. Every map ℤ/m→ℤ/m′ lifts to a spectrum map, uniquely if either modulus is odd; for two even moduli the indeterminacy is ℤ/gcd(2,m,m′). The extended carrier at m=0 is S∨ΣS, so its π₀ is ℤ but it also has H₁=ℤ; the positive-modulus homology assertion excludes this case. This also fixes the convention S/1=0.

- `moore`: The cofibre triangle S→ᵐS→S/m→ΣS, allowing m=0 for the carrier.
- `moore.homologyZero`: For m>0, H₀(S/m;ℤ)≅ℤ/m and all other H vanish.
- `moore.piZero`: π₀(S/m)≅ℤ/m and negative π vanish.
- `moore.bockstein`: The triangle boundary S/m→ΣS.
- `moore.liftHom`: Every ℤ/m→ℤ/m′ lifts, without functorial choice; for m,m′>0 and odd m′ the lift is unique.
- `moore.liftHom_piZero`: The lift induces the prescribed homomorphism under the π₀ comparisons.

**Checks.**

- `moore_one_trivial`: moore 1 is a zero object of SHC.
- `moore_two_pi_two`: pi (moore 2) 2 ≅ ZMod 4, generated by a lift of η.
- `moore_homology_compat`: For m≥1 and n≥2, Hₖ(S/m;ℤ)=H̃ₖ₊ₙ₋₁(Sⁿ⁻¹∪ₘeⁿ;ℤ): both are ℤ/m in spectrum degree zero and zero elsewhere.
- `moore_two_not_ring`: 2 • 𝟙 (moore 2) ≠ 0 in SHC, so S/2 admits no unital multiplication.
- `moore_zero_extended`: S/0=S∨ΣS has H₁=ℤ, so the positive-modulus homology clause fails at zero.

Use GeneralizedCohomology G2.5’s Freudenthal theorem: for n-connected based CW X, n≥0, πᵢX→πᵢ₊₁ΣX is bijective for i≤2n and surjective for i=2n+1. Construct the stable Hopf class η and prove `sphere_firstStems`: π₁S=ℤ/2 generated by η, π₂S=ℤ/2 generated by η². Use TangentialBordism B4.1's Steenrod squares with their naturality, suspension, Cartan, Adem and Sq¹=Bockstein laws, and B4.2's stable HF₂ operations; apply Sq² on CP² and Sq¹Sq²Sq¹=Sq²Sq² to prove `mooreTwo_piTwo`: π₂(S/2)=ℤ/4, with twice a lift of η equal to the image of η². These supply the finite-coefficient and stable-range inputs, rather than assuming the first stems. (H AT, Cor. 4.24, p. 360, §4.L, pp. 487–517; S, I.1, pp. 12–13; II.6.48, pp. 287–288; II.10.11, 10.13, pp. 319–320.)

**Checks.**

- `hopf_order_two`: η is nonzero but 2η=0 stably.
- `moore_two_order_four`: twice a generator in π₂(S/2) is nonzero and four times it is zero.
- `square_cp_two`: Sq² on the degree-two CP² generator is its nonzero square; squares above the input degree vanish.

(S II, Def. 6.33, p. 284; Construction 6.39, (6.41)–(6.42) and Thm. 6.43, pp. 285–286; Prop. 6.48 and (6.50), pp. 287–288; W IV Def. 2.1, p. IV.18.)

*Needs:* §5.7, GeneralizedCohomology G2.2 and G2.5, GeneralizedCohomology G2.4, §5.10, GeneralizedCohomology G2.7, GeneralizedCohomology G2.4, TangentialBordism B4.1–B4.2.

### 7.2 Spectra with finite coefficients E/m

Define E/m=E∧ᴸS/m and πₙ(E;ℤ/m)=πₙ(E/m), for each integer n and m≥1. Smashing the Moore triangle gives a functorial distinguished triangle E→mE→E/m→ΣE. For an Ω-spectrum identify this with the colimit of space-level finite-coefficient groups [Pⁿ⁺ʳ(ℤ/m),Eᵣ] in the stable range. Construct the finite Moore duality D(S/m)≅Σ⁻¹S/m: Pᵈ represents Σᵈ⁻¹S/m, so the space-level degree is n+r, with no extra +1. The extended zero modulus remains E∨ΣE.

- `modM`: E/m=E∧ᴸS/m with triangle E→ᵐE→E/m→ΣE.
- `modM.smashIso`: The identification with derived smash.
- `modM.functor`: For fixed m, an exact functor in E.
- `piMod`: πₙ(E;ℤ/m)=πₙ(E/m).
- `modM.HA`: π₀(HA/m)≅A/mA and π₁(HA/m)≅A[m].

**Checks.**

- `modM_one`: modM E 1 is a zero object.
- `modM_HZ`: modM (eilenbergMacLane ℤ) m ≅ eilenbergMacLane (ZMod m).
- `modM_smash_compat`: modM E m ≅ E ∧ᴸ moore m, so piMod (sphere) m 0 ≅ ZMod m.
- `modM_not_tensor`: piMod E m n is not π_n(E) ⊗ ℤ/m in general: for E = Σ H(ℤ/2) and m = 2, piMod E 2 2 ≅ ℤ/2 (the torsion term) while π₂(E) ⊗ ℤ/2 = 0.

(W IV Def. 2.4 and Spectra 2.3.1, pp. IV.19–20; S II, Remark 6.51, p. 288.)

*Needs:* §7.1, §5.7, §5.10, GeneralizedCohomology G2.3 and G2.6.

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

- `chinese_remainder_generators`: For moduli 2,3 the CRT inclusions send 1 to 3 and 2 modulo 6.

(W IV Prop. 2.7, p. IV.21.)

*Needs:* §7.1, §7.4, §7.2, §5.9.

### 7.7 Transition maps between Moore spectra and the mod-p^r tower

Fix prime p. Choose inclusions S/pʳ→S/pʳ⁺¹ by the square (identity,p) on the two sphere terms, and reductions in the reverse direction by (p,identity). Their Bocksteins satisfy δᵣ₊₁ιᵣ=δᵣ and δᵣρᵣ=pδᵣ₊₁. On the coefficient short exact sequence, inclusion acts by multiplication by p on the quotient and identity on torsion, while reduction acts by reduction on the quotient and multiplication by p on torsion. For p=2,r=1, inclusion sends 1 mod 2 to 2 mod 4 and reduction sends 1 mod 4 to 1 mod 2. Build coherent point-set coefficient diagrams; at p=2 choices of Moore lifts need not be unique. The harmless r=0 term is S/1=0.

- `moore.incl`: S/pʳ→S/pʳ⁺¹ induces multiplication by p.
- `moore.reduce`: S/pʳ⁺¹→S/pʳ induces reduction.
- `moore.incl_bockstein`: Inclusion is a triangle map with sphere components (1,p), so δ∘incl=δ.
- `modTower`: The inverse tower E/pʳ with reduction transitions.
- `modTower.uct`: UCT transition: reduction on the quotient term, multiplication by p on the torsion term.

**Checks.**

- `moore_incl_H0`: H₀(moore.incl p r) is multiplication by p : ZMod (p^r) → ZMod (p^(r+1)).
- `moore_reduce_H0`: H₀(moore.reduce p r) is the reduction ZMod (p^(r+1)) → ZMod (p^r).
- `modTower_HZ`: For E = HZ the tower is the tower of H(ℤ/p^r) with reduction maps.
- `moore_incl_not_unique_p2`: For p = 2 the lift of multiplication by 2 to moore 2 ⟶ moore 4 is not unique: two lifts differ by a map factoring through η.
- `transition_two`: At p=2,r=1 inclusion sends 1 mod 2 to 2 mod 4; reduction sends 1 mod 4 to 1 mod 2.

(S II, Thm. 9.9(iii), p. 304; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.1, §7.2, GeneralizedCohomology G2.4.

### 7.8 ℚ_p/ℤ_p coefficients and their universal coefficient sequence

Form S/p∞ as the telescope of the inclusions, and identify its degree-zero homology with ℚₚ/ℤₚ. For every E show E∧ᴸS/p∞=hocolim E/pʳ and derive 0→πₙE⊗ℚₚ/ℤₚ→πₙ(E;ℚₚ/ℤₚ)→πₙ₋₁E{p}→0. Here A{p} is the union of its p-power torsion subgroups. When πₙ₊₁E is finite the tensor term in degree n+1 vanishes and gives the torsion identification. The colimit uses inclusion maps, rather than reduction maps.

(S II, §9.3, p. 303; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.7, GeneralizedCohomology G3.4 and G3.7, §7.4, §5.10, §7.2.

### 7.9 Countable abelian towers and comparison with spectral limits

Use DerivedModuleAlgebra §1.T.1 on main at R=ℤ for the countable tower limit, lim¹, natural six-term sequence, derived-limit comparison and Mittag–Leffler vanishing. For a coherent tower of spectra X, its integer homotopy groups form towers of integral modules. The map on πₖ of GeneralizedCohomology G3.8's derived-product difference map is the supplied `ModuleTower.shift`, namely δ(x)ᵣ=xᵣ−fᵣxᵣ₊₁. Identify its fibre long exact sequence with `0→lim¹πₖ₊₁Xᵣ→πₖholim X→limπₖXᵣ→0`. The injection is induced by the fibre triangle's boundary after passing to coker δ, and the projection is the compatible family of evaluation maps into ker δ. These identifications preserve the six-term connecting arrows for levelwise short exact sequences of homotopy-group towers; use the supplied integral-module/abelian-group comparisons throughout. Naturality is for coherent point-set maps or maps of the specified defining triangles.

**Comparison API:** `abelianTower.difference` is an alias for `ModuleTower.shift` at R=ℤ, with `CompactCoefficients.Tower.shift` as its abelian-group presentation. `abelianTower.limitKernel` and `abelianTower.limOneCokernel` are the supplied `Tower.limComparison` and `Tower.limOneComparison`, together with the spectral injection/projection identifications above. `abelianTower.sixTermExact` and `abelianTower.limOne_eq_zero_of_ML` are aliases for the supplied natural six-term sequence and Mittag–Leffler vanishing. They carry no independent tower carrier or algebraic construction. (Stacks, More on Algebra, Lemma 15.88.1, tag 07KW; Algebra, Lemma 10.86.4, tag 0598.)

**Checks.**

- `tower_identity`: the identity tower has limit A and lim¹=0.
- `tower_zero_maps`: zero transition maps make the difference identity, so both groups are zero.
- `tower_surjective`: surjectivity lets one solve the difference equation recursively and gives lim¹=0; multiplication by p on ℤ fails this hypothesis.
- For `0→pʳℤ→ℤ→ℤ/pʳ→0` with inclusion, identity and reduction transitions, the supplied connecting map ℤₚ→lim¹pʳℤ is surjective with kernel ℤ. The spectral and completion comparisons retain that map with its supplied normalization.
- The ℤ/p tower with zero transitions is Mittag–Leffler despite nonsurjective transitions; both its limit and lim¹ vanish, using the same supplied maps.

(S II, proof of Thm. 8.3, p. 297; S II, Lemma 5.6 and Remark 5.9, pp. 257–258; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* DerivedModuleAlgebra §1.T.1 on main, GeneralizedCohomology G3.8 and G2.6, M. Apply the supplied tower algebra to the homotopy-limit triangle.

### 7.10 A tower with nonzero lim¹

For prime p, identify the π₀ tower of the sphere tower with transition p·id with DerivedModuleAlgebra §1.T.1's `mulTower p`. Specialize its `limOne_mul_p`: lim π₀=0 and lim¹π₀≅ℤₚ/ℤ, with (xₙ) sent to the class of ∑pⁿxₙ. The name `multiplicationTower.limOneEquiv` denotes this supplied equivalence transported through the π₀ identification. Section 7.9's spectral Milnor comparison gives π₋₁holim≅ℤₚ/ℤ although every sphere term has π₋₁=0; no second convergent-sum construction is needed.

**Checks.**

- The π₀ identification sends the sphere unit to 1∈ℤ and the transition p·id to multiplication by p, fixing the sum normalization.
- At p=2, the nonintegral 2-adic number 1/3 gives a nonzero class in π₋₁holim; stagewise vanishing in degree −1 does not imply vanishing for holim.
- The identity of the sphere tower fixes every class in ℤₚ/ℤ. At p=3, levelwise multiplication by two induces multiplication by two and kills the nonzero class of 1/2∈ℤ₃, in agreement with the supplied natural lim¹ maps.

(S II, Remark 5.9, p. 258.)

*Needs:* §7.9, DerivedModuleAlgebra §1.T.1 on main (`limOne_mul_p`), M.

### 7.11 The completion extension and Tate module

Apply Milnor to the reduction tower, retaining the lim¹ term in πₙ(E∧ₚ). Taking the inverse limit of the coefficient short exact sequences gives 0→lim πₙE/pʳ→lim πₙ(E/pʳ)→Tₚπₙ₋₁E→0; the quotient tower is surjective and has zero lim¹. Use §7.9's supplied natural six-term boundary and its Milnor injection/projection comparison for these very coefficient maps. If the degree-(n+1) coefficient groups are finite, the Milnor lim¹ term also vanishes. This identifies the Tate-module contribution and states exactly which finiteness hypothesis removes which derived-limit term.

(W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.9, GeneralizedCohomology G3.9, §7.4, §7.7.

### 7.12 General Moore spectra and their mapping sequence

For an abelian group A whose p-primary torsion is killed by some pᴺ, prove `completionExt_boundedTorsion`: Ext¹(ℤ/p∞,A) is naturally its ordinary p-adic completion lim_r A/pʳA. The torsion tower has pro-zero transition maps, so its lim¹ vanishes; the individual finite-modulus Ext groups need not vanish. For arbitrary abelian A construct `generalMoore A` from a free presentation, connective with H₀=A and other integral homology zero. Prove `generalMoore.mappingUCT`: 0→Ext¹(A,π₁X)→[generalMoore A,X]→Hom(A,π₀X)→0. Compare this UCT, after shift for the Prüfer group, with GeneralizedCohomology G3.9’s Hom/Ext completion sequence; no functorial choice for all A is asserted. (S, Constr. II.6.39, Eq. (6.42), Thm. 6.43, pp. 285–286.)

**Checks.**

- `general_moore_zero`: A=0 gives zero.
- `general_moore_free`: A=ℤ gives S; the Ext term vanishes.
- `general_moore_two`: for A=ℤ/2 and X=S/2 the Ext term is nonzero, so π₀ does not determine the spectrum map uniquely.

(S II, Thm. 9.9(iv), (9.10), p. 304.)

*Needs:* GeneralizedCohomology G3.9, §7.8, §7.1.

### 7.13 Completion for finitely generated homotopy

If πₖE and πₖ₋₁E are finitely generated, identify πₖ(E∧ₚ) with πₖE⊗ℤₚ, naturally and compatibly with the unit. Prove the algebraic completion–tensor comparison for finitely generated abelian groups and the comparison between Mathlib's adic completion of ℤ at (p) and PadicInt p. For a shifted H(ℚₚ/ℤₚ), the Tate module survives and excludes the same formula without finite generation. Name `completionZEquiv`: AdicCompletion((p),ℤ)≃+*ℤₚ for prime p, characterized by all residue projections. Construct it from Mathlib’s `PadicInt.toZModPow`, `PadicInt.lift`, `PadicInt.lift_spec` and `PadicInt.lift_unique`, with inverse given by compatible residues. The finite-group summand is retained, so ℤ/p completes to ℤ/p, whereas a finite ℓ-group for ℓ≠p completes to zero.

**Checks.**

- `completion_integer_one`: every residue projection sends the completed integer 1 to 1.
- `completion_mod_p`: completion preserves ℤ/p.
- `completion_other_prime`: completion of ℤ/ℓ is zero for distinct primes ℓ,p.

(S II, Thm. 9.9(iv), p. 304; W IV 2.9, p. IV.22; S II, Remark 9.12 and the following paragraph, p. 306.)

*Needs:* §7.12, M.

### 7.14 Criteria for p-completeness

Use GeneralizedCohomology G3.9’s sphere localization S[1/p] and derived completion. Compare the supplied criterion F(S[1/p],E)=0 with vanishing of the homotopy limit of the multiplication-by-p E tower. These are predicates on the specified unit and the specified multiplication maps. Hℚ is killed by completion and is not p-complete unless zero; H(ℤ/p) is complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* GeneralizedCohomology G3.9, §7.9, GeneralizedCohomology G3.4 and G3.7, §7.8, GeneralizedCohomology G3.8, §5.10.

### 7.15 Mod-p equivalence detects equivalences of complete spectra

For maps between p-complete spectra prove that invertibility is detected by derived smash with S/p. Use the fibre, the closure theorem and the completeness criterion to show a complete fibre with zero mod-p reduction is zero. Without completeness a rational spectrum has zero mod-p reduction while remaining nonzero, so the hypothesis cannot be omitted.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §7.16, §7.2, GeneralizedCohomology G3.8, GeneralizedCohomology G2.4.

### 7.16 Closure properties of complete spectra

Prove closure of p-complete spectra under fibres, cofibres, retracts, arbitrary products and coherent homotopy limits of countable towers. Use the internal-Hom vanishing criterion and exactness. Do not infer closure under arbitrary coproducts: infinite sums of complete abelian groups need not be derived complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §5.10, GeneralizedCohomology G3.8, GeneralizedCohomology G3.8, GeneralizedCohomology G2.4.

### 7.17 Prime-power coefficient spectra are complete

Show E/pʳ is p-complete for every E and r≥1. The coefficient extension implies that p²ʳ kills each homotopy group, enough for the bounded-exponent theorem. It does not imply pʳ kills them: π₂(S/2)=ℤ/4 is the negative control. The r=0 extended term is zero and is also complete.

**Checks.**

- `torsion_bound_two`: π₂(S/2)=ℤ/4, so annihilation by 2 is false while annihilation by 4 holds.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.18, §7.4, §7.2.

### 7.18 Bounded p-power exponent implies completeness

Prove `pComplete_of_degreewiseBoundedExponent`: if for every integer k some pᴺ⁽ᵏ⁾ kills πₖE, then E is p-complete by the multiplication-tower criterion. Both the inverse limit and lim¹ vanish in every degree because each homotopy-group tower is pro-zero. The specialization `pComplete_of_boundedExponent` uses one fixed pᴺ killing all π-groups. N=0 forces E=0. Keep the prime hypothesis in the signatures and distinguish bounded torsion from general unbounded p-primary torsion.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.14, §7.9.

### 7.19 Rational spectra are generalized Eilenberg–Mac Lane spectra

Use GeneralizedCohomology G5.6’s rational stable-stem vanishing, Sℚ≃Hℚ and stable rational Hurewicz comparison. For graded rational vector spaces V define HV=∏ₙΣⁿHVₙ and prove [A,HV]≅Hom_gr(π*A,V) for every A. Deduce the equivalence of rational spectra with graded ℚ-vector spaces, with the unique identity-on-homotopy map E→Hπ*E. The product includes all integer degrees, so no connectivity assumption is hidden.

**Checks.**

- `rational_generalizedEM_zero`: zero in every graded degree gives the zero spectrum.
- `rational_generalizedEM_two_degrees`: V₀=V₂=ℚ and other Vₙ=0 gives Hℚ∨Σ²Hℚ, retaining both groups.
- `rational_generalizedEM_negative`: V₋₂=ℚ alone gives Σ⁻²Hℚ, with nonzero π₋₂; an indexing set of natural numbers would lose it.

- `rational_generalizedEM`: A rational E≅∏ₖΣᵏH(πₖE).
- `rationalization.smashHQ`: Eℚ≅Hℚ∧ᴸE.

**Checks.**

- `rationalization_sphere`: rationalization sphere ≅ eilenbergMacLane ℚ.

(S II, Thm. 9.6, p. 302; S I, Thm. 1.9, p. 12.)

*Needs:* GeneralizedCohomology G3.9 and G5.6, GeneralizedCohomology G2.7, GeneralizedCohomology G3.8, §5.10, GeneralizedCohomology G2.4.

### 7.20 The arithmetic fracture square

For every E prove the arithmetic fracture square and the distinguished triangle E→Eℚ⊕∏ₚE∧ₚ→(∏ₚE∧ₚ)ℚ→ΣE. The first arrow is the pair of units and the second is the difference of the two maps to the rationalised product. Construct the comparison F(cofib(S→Sℚ),ΣE)≅∏ₚE∧ₚ. Rationalisation stays outside the product: ℚ⊗∏ℤₚ and ∏ℚₚ are different. **Check `fracture_difference`:** on the completed and rational units of Hℤ the two images of 1 have difference 1−1=0. The difference on (2,1) is +1 and on (1,2) is −1; a sum map would not give a complex. The finite-type homotopy corollary uses the preceding finite-generation theorem in each relevant degree.

(S II, Thm. 9.9(i)–(ii) and the following paragraph, p. 304.)

*Needs:* GeneralizedCohomology G3.9 and G5.6, GeneralizedCohomology G3.9, GeneralizedCohomology G2.4, §7.13, GeneralizedCohomology G3.8, §5.10, §7.8.

### 7.21 Filtered spectra, towers and their associated graded

A filtered spectrum is a coherent point-set diagram ℤ→Sp, localised at objectwise stable equivalences. Define grₛ by derived cofibre Xₛ₋₁→Xₛ, and build functorial replacements and all relative-cofibre comparisons needed by the spectral object. With a coherent augmentation to E, define exhaustiveness by hocolim X→E being an equivalence, bounded-below by eventual zero on the negative end, and completeness by holim on that end being zero. Identify exhaustiveness with the compatible homotopy-group criterion. The SHC-valued diagram is a consequence of this input, not a substitute for its coherence. Name `FilteredSpectrum.replace` for functorial objectwise replacement and `relativeCofibreSpectralObject` for all interval cofibres and connecting maps; coherent commuting cubes prove its exactness and octahedral identities.

- `FilteredSpectrum`: A coherent integer filtration, represented by ℤ→SymmSpectrum.
- `FilteredSpectrum.gr`: gr_s=cofib(X_s₋₁→X_s), with its triangle.
- `FilteredSpectrum.IsExhaustive`: The filtered hocolim-to-target map is invertible.
- `FilteredSpectrum.IsComplete`: The negative-direction holim is zero.
- `FilteredSpectrum.IsBoundedBelow`: X_s=0 for all sufficiently negative s.
- `FilteredSpectrum.toSpectralObject`: Coherent relative cofibres form a spectral object, satisfying all identities and invariant under replacement.

**Checks.**

- `filteredSpectrum_const`: The constant filtration X s = X has gr = 0 and is exhaustive but not complete (unless X = 0).
- `filteredSpectrum_postnikov_gr`: For the Whitehead filtration `X_s = τ_{≥−s}X`, `gr_s ≅ Σ^{−s}H(π_{−s}X)`.
- `filteredSpectrum_spectralObject_compat`: toSpectralObject followed by pi_0 (Mathlib mapHomologicalFunctor) is an abelian spectral object whose E₁ terms are pi of gr.
- `filteredSpectrum_complete_not_exhaustive`: The zero filtration of nonzero E is complete but not exhaustive. The constant E filtration is exhaustive but not complete.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* GeneralizedCohomology G2.4–G2.6, §5.7, GeneralizedCohomology G3.4 and G3.7, GeneralizedCohomology G3.8, GeneralizedCohomology G2.1–G2.4.

### 7.22 Exact couples and their derived couples

Define a bigraded exact couple in any abelian category: D→iD→jE→kD, of degrees a,b,c and exact at each vertex. Construct its derived couple with D′=image i, E′=H(E,jk), and degrees a,b−a,c; iterate to the pages. In the homological convention a=(1,−1),b=(0,0),c=(−1,0), dᵣ has degree (−r,r−1), lowering total degree by one. In the two-column case δₙ:E₁,ₙ→E₀,ₙ and 0→coker δₙ→D₁,ₙ₋₁→ker δₙ₋₁→0 fix the extension indexing. Exactness imposes ji=kj=ik=0; it does not impose i²=0. For D=E=ℤ², i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) gives an exact couple with i²=i≠0.

- `ExactCouple`: Bigraded D,E and maps i,j,k of degrees a,b,c, exact at all three vertices.
- `ExactCouple.derived`: D′=im i, E′=ker(jk)/im(jk); j-degree becomes b−a.
- `ExactCouple.page`: Page r≥1 is E of the (r−1)-derived couple; d_r has degree c+b−(r−1)a.
- `ExactCouple.toSpectralSequence`: For a=(1,−1),b=(0,0),c=(−1,0), d_r has degree (−r,r−1).
- `ExactCouple.twoStageBoundary`: δ_n=k then j: E_(1,n)→E_(0,n), i.e. πₙ₊₁gr₁→πₙX₀.
- `ExactCouple.twoStageCokernelIncl`: If negative D-columns vanish, coker δ_n→D_(1,n−1).
- `ExactCouple.twoStageKernelProj`: Under that hypothesis, D_(1,n−1)→ker δ_n₋₁.
- `ExactCouple.twoStageExtension`: The displayed cokernel–D–kernel complex is short exact, without a splitting assertion.

**Checks.**

- `exactCouple_zero_E`: For any bidegrees and an exact couple with every E(p,q) zero, every i(p,q) is an isomorphism and every page at every bidegree is zero.
- `exactCouple_two_stage`: With D=0 for p<0 and E supported in columns 0,1, pages r≥2 equal E². The abutment is the unsplit extension 0→coker δₙ→D(1,n−1)→ker δₙ₋₁→0; for X₀→X₁=X use δ:πₙ₊₁gr₁→πₙX₀.
- `exactCouple_not_complex`: The constant tuple couple i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) is exact. (j∘k)(x,y)=(y,0), so (j∘k)(0,1)=(1,0)≠0 while (j∘k)²=0; i²=i and i²(1,0)=(1,0). The exactness composites j∘i, k∘j and i∘k do vanish.
- `exact_idempotent`: For i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y), the couple is exact and i²(1,0)=(1,0).

(Boardman §0, pp. 2–4: unrolled exact couples and derived pages. Extend the abelian-group argument to an arbitrary abelian category using kernels, images and cokernels; compare it with the spectral-object construction in §7.23.)

*Needs:* AlgebraicTopology, M.

### 7.23 The spectral sequence of a filtered spectrum

Construct the filtration spectral object and apply the homological π-functor to obtain E¹ₛ,ₜ=πₛ₊ₜgrₛ and dᵣ:(s,t)→(s−r,t+r−1), natural in coherent maps. Identify it with the derived exact-couple pages and with Mathlib's spectral-object pages, whose core starts at page two. Use endpoints p−r,p−1,p,p+r−1 and cochain degree −(p+q). The candidate abutment is π*hocolim X with filtration image(πₙXₛ→πₙhocolim X); convergence is a further theorem.

- `FilteredSpectrum.spectralSequence`: The spectral sequence with E¹_s,t=π_s₊t(gr_s).
- `FilteredSpectrum.spectralSequence.E1`: The E¹ identification sends d₁ to the composite through ΣX_s₋₁→Σgr_s₋₁.
- `FilteredSpectrum.spectralSequence.map`: A strict filtered-model transformation gives a spectral-sequence map, invariant under stable replacement.
- `FilteredSpectrum.abutmentFiltration`: The image filtration F_sπₙE=im(πₙX_s→πₙE) for an exhaustive target cocone.
- `FilteredSpectrum.exactCouple`: D_s,t=π_s₊tX_s; E_s,t=π_s₊tgr_s, with degrees (1,−1),(0,0),(−1,0).
- `FilteredSpectrum.coreE₁Homological`: The homological core uses deg(p,q)=−p−q and indices p−r,p−1,p,p+r−1, giving d_r:(p,q)→(p−r,q+r−1).

**Checks.**

- `spectralSequence_trivial`: For the zero filtered spectrum all pages vanish.
- `spectralSequence_single_step`: For X concentrated in one filtration step, E¹ = E^∞ = π_* of that step.
- `spectralSequence_compat_exactCouple`: The spectral sequence agrees with that of the exact couple (§7.22).
- `spectralSequence_E2_not_abutment`: The constant nonzero filtration has E¹=0 and nonzero colimit π. It is exhaustive but not bounded below, so its zero pages do not compute the abutment.

(HA §1.2.2, Construction 1.2.2.6 and Proposition 1.2.2.7, p. 49, and Definition 1.2.2.9, p. 52; W IV Exercise 3.7, p. IV.34.)

*Needs:* §7.21, §7.22, GeneralizedCohomology G2.4, GeneralizedCohomology G2.4, M.

### 7.24 Convergence for exhaustive filtrations bounded below

For an exhaustive filtration bounded below, prove strong convergence to π*E and E∞ₛ,ₜ=Fₛπₛ₊ₜ/Fₛ₋₁πₛ₊ₜ. The filtration on each homotopy group is exhaustive and zero sufficiently far left, and the exiting differentials eventually vanish at each position. A finite filtration gives collapse at a finite page. No connective hypothesis on E is required for this homological, bounded-below filtration theorem.

(HA §1.2.2, Prop. 1.2.2.14 and proof, pp. 52–53.)

*Needs:* §7.23, GeneralizedCohomology G3.4 and G3.7, GeneralizedCohomology G3.8.

### 7.25 Convergence for towers with fibres of increasing connectivity

For a tower Y indexed by s≥0, set F₀=Y₀ and Fₛ=fib(Yₛ→Yₛ₋₁), and L=holim Y. Use Xᵢ=fib(L→Y₋ᵢ₋₁), extending Yₛ=0 for s<0; then gr₋ₛX≅Fₛ. This gives E¹ₛ,ₜ=πₜ₋ₛFₛ and dᵣ:(s,t)→(s+r,t+r−1). If the fibres' connectivity tends uniformly to infinity in each fixed degree, prove Milnor lim¹ vanishes and strong convergence to π*L. For a tower under E, identify E→L as an equivalence exactly when holim fib(E→Yₛ)=0. A bare reversal Y₋ᵢ instead has colimit zero and the wrong graded shift.

**Checks.**

- `tower_differential_degree`: at (s,t)=(0,2), d₁ lands in (1,2), changing homotopy degree 2 to 1. In general (t+r−1)−(s+r)=t−s−1.

(S II, proof of Thm. 8.3, p. 297.)

*Needs:* §7.23, §7.9, §7.24, GeneralizedCohomology G3.8.

### 7.26 Conditional and strong convergence for complete towers (Boardman)

Use Boardman’s indexing i:Aˢ⁺¹→Aˢ. Put A⁺=limₛ Aˢ, RA⁺=lim¹ₛ Aˢ and A⁻=colimₛ→−∞ Aˢ. Define Zʳ as the r-cycle groups, RE∞=lim¹ʳZʳ, K∞Aˢ=ker(Aˢ→A⁻), and W=colimₛ lim¹ʳ(K∞Aˢ∩im(Aˢ⁺ʳ→Aˢ)). Conditional convergence to A⁻ requires A⁺=RA⁺=0; conditional convergence to A⁺ requires A⁻=0. For the complete tower above with a half-plane of entering differentials, conditional convergence and RE∞=0 imply strong convergence. Finite first-page groups ensure the cycle towers are Mittag–Leffler. For a whole-plane sequence require W=0 as well. Register the conversion to the increasing homological indexing of §7.24; completeness and page stabilisation do not replace these hypotheses.

**Checks.**

- `boardman_zero`: the zero exact couple has A⁺=RA⁺=A⁻=RE∞=W=0 and converges to zero.
- `boardman_constant_identity`: the exact couple with D=ℤ, i=id and E=0 has zero pages and RE∞=W=0, but A⁺=A⁻=ℤ. It fails either conditional-convergence hypothesis; zero pages do not force a zero target.
- `boardman_finite_cycles`: in each finite first-page group the descending cycle subgroups eventually stabilise, giving RE∞=0. This supplies that obstruction’s vanishing and does not remove the separate conditional-convergence or whole-plane W assumptions.

(S II, proof of Thm. 8.3, p. 297; Boardman, Def. 5.10, p. 19; Thm. 7.1, p. 20; Thm. 8.2, p. 24; Eq. (8.7), p. 25.)

*Needs:* §7.25, §7.9, GeneralizedCohomology G3.8.

### 7.27 The Atiyah–Hirzebruch spectral sequence

For any spectrum E and CW complex X, use the skeletal coherent filtration of E∧ᴸΣ∞₊X. Prove E²ₚ,q=Hₚ(X;π_qE), with dᵣ of the homological degree above, and strong convergence to πₚ₊q(E∧ᴸΣ∞₊X), by the bounded-below exhaustive filtration theorem. Finite dimensionality of X or bounded-below E makes each total-degree diagonal finite. For X=BG the coefficient calculation is the group-homology comparison of Layer 1; for E=HA it reduces to cellular/singular homology. The analogous cohomological sequence has separate convergence conditions.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* §7.23, §7.24, GeneralizedCohomology G2.2 and G2.5, §5.10, §1.32, AlgebraicTopology, GeneralizedCohomology G3.4 and G3.7.

### 7.28 Products on mod-ℓ^ν homotopy

For prime powers pʳ outside {2,3,4,8}, construct a homotopy associative and commutative unital Moore multiplication and the graded-commutative ring for a homotopy associative and commutative E. Record the distinctions at the exceptions: S/2 has no unital multiplication; S/3 has no homotopy associative multiplication; the Araki–Toda choice at 4 need not be associative and at 4 or 8 need not be commutative. Existence of another associative product on S/4 and the E₁ product on S/8 are compatible with these distinctions.

(W IV Thm. 2.8, p. IV.21; Bu Introduction, p. 1.)

*Needs:* §7.1, §5.11, GeneralizedCohomology G2.4.

### 7.29 Graded and filtered Eₙ-algebras and the quotient obstruction tower

Work in a stable, presentably Eₘ-monoidal ∞-category C, m≥2, with compact generators. Use §5.13's abstract Eₙ-algebra interfaces and BordismFormalGroups F6.5's Day convolution, Ind and operadic Kan extensions. Construct graded objects C^Gr and filtered objects C^Fil with Day convolution, the shift τ:X(1)→X, the associated graded functor as the cofibre of τ, and τ-inversion. All of these are Eₘ-monoidal. Positively graded means zero in negative degrees with the unit in degree zero.

For n≤m construct the Eₙ bar–cobar adjunction on augmented graded algebras and coalgebras (HA §5.2.3) and prove `gradedBarCobarEquiv`: it is an equivalence on positively graded objects. Write `D^c_(Eₙ,k)(Y)` for the limit of the k-fold tensor powers of Y over Eₙ(k)_(hΣₖ). Construct the cofree positively graded Eₙ-coalgebra with underlying object `∏ₖ D^c_(Eₙ,k)(Y)`, and the cell filtration of a positively graded Eₙ-algebra R whose k-th cells are `Σ^(−1−n) Bar(R)ₖ`. For the unordered configuration space of k points in ℝⁿ, a model of Eₙ(k)_(hΣₖ), construct a finite cell filtration with cells in dimensions 0 to (n−1)(k−1). Deduce `configurationResolution`: a finite filtration of `D^c_(Eₙ,k)(Y)` with graded pieces `Σ^(−c) Y^⊗k`, 0≤c≤(n−1)(k−1).

Prove `quotientObstructionTower` for a map r:X→1. It gives obstructions `θₖ ∈ [Σ^(−2−n) D^c_(Eₙ,k)(Σ^(n+1)X), 1/r]` for k≥2, each defined after nullhomotopies of the earlier ones are chosen. Their vanishing builds filtered Eₙ-algebras attached along the displayed cells, and τ-inversion gives an Eₙ-structure on 1/r. If every group `[Σ^(−1−n) D^c_(Eₙ,k)(Σ^(n+1)X), 1/r]` vanishes, the construction produces at most one structure. `quotientObstructionTower.refined` splits θₖ into `θ_(k,α) ∈ [Σ^(−2−n−c_α)(Σ^(n+1)X)^⊗k, 1/r]`, 0≤c_α≤(n−1)(k−1). `quotientMapObstruction` gives the analogous obstructions γ_(k,α), k≥1, to an Eₙ-map from the constructed quotient to an Eₙ-algebra on another quotient. It identifies γ₁ with the composite of the attaching map with the quotient map. `quotientObstruction_unital`: if the first obstruction Q₁(r) vanishes, then 1/r has a unital multiplication.

**Checks.**

- `quotientObstruction_eOne`: for n=1 the space E₁(k)_(hΣₖ) is a point, so θₖ lies in the single group `[Σ^(−3)(Σ²X)^⊗k, 1/r]`.
- `configurationResolution_two_two`: for n=k=2 the unordered configuration space of two points in ℝ² is equivalent to a circle, with cells in dimensions 0 and 1=(n−1)(k−1). On an even sphere these are the square class and the Q₁ class of the free E₂-algebra.
- `quotientObstruction_moore`: for r=2:S→S in spectra, Q₁(2)≠0 because S/2 has no unital multiplication (§7.1). For odd p the obstruction group `[S¹, S/p] = π₁(S/p)` vanishes, so S/p has a unital multiplication also at p=3, where §7.28's exception concerns associativity.

(Bu §2, Lemmas 2.2–2.3, Prop. 2.4, Remark 2.5, Lemma 2.6 with footnote 8, Cor. 2.7 and Remark 2.8, pp. 4–6; Conventions (5)–(8), p. 3; proof of Thm. 5.2, pp. 10–11; proof of Lemma 5.4, p. 11; Appendix A, Recollection A.5 and Thm. A.6, p. 13, Lemma A.19, Construction A.20 and Lemma A.21, pp. 18–19; HA §5.2.3.)

*Needs:* §5.13, §7.1, BordismFormalGroups F6.5.

### 7.30 The deformation Def(C;Q) of a quotient

Let C be stable and stably Eₘ-monoidal, m≥2, with v:I→1 such that `1/v = cofib(v)` has a right unital multiplication. First replace C by Ind(C′), where C′ is generated by 1 and I under tensor products and finite (co)limits. This Ind(C′) is presentable and Eₘ-monoidal, and its functor to C is fully faithful on C′. Let `quotientSplitEpiClass` Q be the maps of compact objects that become split epimorphisms after tensoring with 1/v. Prove that every 1/v⊗X is Q-injective, that X→1/v⊗X is Q-monic, that compact objects have enough Q-injectives and that Q is ⊗-compatible.

Construct the perfect derived ∞-category D^ω(C^ω;Q) as perfect sheaves for the Q-epimorphism topology, with ν, the shift [1], τ and τ-inversion. Prove the seven properties of Bu Recollection 4.1: finite (co)limits; ν fully faithful; generation by ν under finite colimits; ν preserving cofibre sequences whose second map is in Q; `ν(−)[1] ≃ ν(Σ−)`; τ-inversion as localization at τ; and `[Σ^(−s)νX, νJ] = 0` for s>0 and Q-injective J. Construct its exact Eₘ-monoidal structure with ν and τ-inversion Eₘ-monoidal, and `deformationCategory` Def(C;Q) as its Ind-completion. The cofibre sequence `ν1 → ν(1/v) → ν(ΣI)` exists because 1→1/v splits after tensoring with 1/v. Its boundary is `deformationCategory.liftedMap` `ṽ : Σ^(−1)νI[1] → ν1`. Prove `deformationCategory.quotient_vanishing`: `[Σ^(−s)νX, ν1/ṽ^q] = 0` for compact X and s≥q, by induction on q. Define `IsVCompatible`: an Eₙ-structure on 1/v^q is v-compatible if it is equivalent to the τ-inversion of an Eₙ-structure on ν1/ṽ^q.

**Checks.**

- `deformation_quotient_one`: at q=1, ν1/ṽ≃ν(1/v), so the vanishing estimate is the Q-injectivity of ν(1/v).
- `deformation_tauInverse`: τ-inversion carries ṽ to v and ν1/ṽ^q to 1/v^q.
- `deformation_moore`: for C=Sp and v=p odd, S/p has a right unital multiplication but no E₁-structure, so the construction uses only the right unital multiplication. At v=2 the hypothesis fails (§7.1's `moore_two_not_ring`), while v=4 satisfies it because Q₁(4)=0.

(Bu Remark 1.6, p. 2; Introduction, p. 1; §4, Recollection 4.1 to Lemma 4.8, pp. 8–10; Def. 5.1, p. 10; Remark 5.7, p. 12; PP Def. 5.32 and Prop. 5.34, p. 54; Lemmas 5.67–5.68 and Prop. 5.69, pp. 64–65; Remark 5.65, p. 64.)

*Needs:* §7.29, §5.13, §7.1, BordismFormalGroups F6.5.

### 7.31 HF₂-synthetic spectra and the vanishing line of C(2̃^q)

Construct Pstrągowski's HF₂-synthetic spectra `F2Synthetic`: spherical sheaves of spectra on finite spectra for the topology of mod-2 homology surjections. This is a stable, presentably symmetric monoidal ∞-category with `ν : Sp → F2Synthetic`. Here ν is symmetric monoidal because every finite spectrum has projective mod-2 homology. Index bigraded spheres by stem k and Adams filtration s, `S^(k,s) = Σ^(−s) ν(S^(k+s))`, so that π_(k,s) here is BHS's π_(k,k+s). Construct τ∈π_(0,−1)S^(0,0), the commutative algebra Cτ and the symmetric monoidal τ-inversion. τ-inversion identifies τ-invertible synthetic spectra with Sp and satisfies τ⁻¹ν≃id. Prove that ν carries a cofibre sequence to a cofibre sequence exactly when it is short exact on mod-2 homology. Prove BHS Theorem 9.19 comparing π_(*,*)νX with TangentialBordism B4.2's mod-2 Adams spectral sequence, for HF₂-nilpotent complete X with strongly convergent spectral sequence.

Let 2̃∈π_(0,1)S^(0,0), with τ2̃=ν(2), be the boundary of the cofibre sequence νS→ν(S/2)→ν(S¹). Define `F2Synthetic.mooreTilde q` as `C(2̃^q) = cofib(2̃^q : S^(0,q) → S^(0,0))`. Define vanishing lines of slope m and intercept c and prove BHS's cofibre lemma and Prop. 11.6 at torsion level zero. Prove the base line `π_(w,s) C(2̃) = 0 for s > w/2 + 1`; by Prop. 11.6 this is the corresponding vanishing of the Adams E₂-page of S/2. Then prove `F2Synthetic.mooreTilde_vanishing`: `π_(w,s) C(2̃^q) = 0 for s > w/2 + q`, by induction on q along `Σ^(0,1)C(2̃^(q−1)) → C(2̃^q) → C(2̃)`.

**Checks.**

- `F2Synthetic.nu_moore_two`: νS→ν(S/2)→ν(S¹) is a cofibre sequence, so ν(S/2)≃C(2̃). Applying ν to S→S→S/2, with first map multiplication by 2, does not give a cofibre sequence, since 2 is zero on mod-2 homology.
- `F2Synthetic.tauInverse_moore`: τ⁻¹C(2̃^q)≃S/2^q for every q≥1.
- `F2Synthetic.sphere_no_vanishing_line`: 2̃^s∈π_(0,s)S^(0,0) is nonzero for every s, since τ^s·2̃^s=ν(2^s) inverts to 2^s≠0. The sphere has no vanishing line of slope ½, so the Moore quotient is needed.

(Pst Def. 4.1, Prop. 4.2, Defs. 4.3 and 4.6, Lemma 4.23, Def. 4.27, Cor. 4.30, Thm. 4.37 and Prop. 4.40, pp. 38–49; BHS Construction 9.3 to Thm. 9.12, pp. 32–33, Thm. 9.19, p. 36, Def. 11.2 and Prop. 11.6, p. 45, Lemma 11.11, p. 47, Def. 13.6, p. 54, Notation 15.3 and Prop. 15.8 (row C(2̃), clause (4) of Def. 13.6), pp. 67–68; Bu Convention (10), p. 3, footnotes 9–10, p. 7, Lemma 3.3, p. 8.)

*Needs:* §5.13, §7.1, §7.7, BordismFormalGroups F6.5, TangentialBordism B4.2.

### 7.32 Burklund's towers of E_n-algebra quotients

In a stable, stably Eₘ-monoidal ∞-category, m≥2, fix v:I→1 such that cofib(v) admits a right unital multiplication. Construct the v-compatible structures of §7.30 on 1/vᑫ as Eₙ-algebras for n≤m and q>n, with the reduction tower of Eₙ-algebra maps for q≥n+1. Apply §7.29's obstruction tower to ṽ^q in Def(C;Q). The obstruction groups vanish by `deformationCategory.quotient_vanishing`, since q≥n+1. The tower maps and the uniqueness use §7.29's map obstructions. When the two exponents agree, the nullhomotopy of γ₁ given by the defining cofibre sequence yields an equivalence of Eₙ-algebras. Prove uniqueness up to equivalence among v-compatible structures, not among every possible Eₙ structure on the carrier. Construct the abstract Eₙ interfaces and their concrete spectrum comparison in Layer 5, so no later abstract-sheaf package is a prerequisite.

(Bu Thm. 1.5, p. 2; Bu Thm. 5.2 with proof, pp. 10–11; Bu Remark 5.7, p. 12.)

*Needs:* §7.1, §5.13, §5.18, §7.7, §7.29, §7.30.

### 7.33 Browder’s mod-coefficient products

For a homotopy associative and commutative ring spectrum E with πₖE=0 in negative degrees and in positive even degrees, prove homotopy associative and commutative products on E/pʳ for every prime power, including the four exceptional Moore moduli. Construct the unit and product and their compatibility with E→E/pʳ. The vanishing applies to E, not to the coefficient spectrum, so this statement does not force an impossible unital product on S/2.

(W IV Scholium 2.8.1, p. IV.21.)

*Needs:* §7.28, GeneralizedCohomology G2.4.

### 7.34 Burklund's E_n-algebra structures on Moore spectra

Construct the Eₙ-algebra structures on S/pᑫ in the specified ranges: q≥n+1 at odd primes and 2q≥3(n+1) at p=2. Thus S/8 is E₁ and S/32 is E₂, while S/p² is E₁ for odd p. At odd p apply §7.32 with C=Sp and v=p. At p=2 apply §7.29's obstruction tower in `F2Synthetic` to `2̃^q : S^(0,q) → S^(0,0)`. Each refined obstruction lies in a group that vanishes by `F2Synthetic.mooreTilde_vanishing` when 2q≥3(n+1). The symmetric monoidal τ-inversion then carries the Eₙ-algebra C(2̃^q) to S/2^q. Identify these with the abstract-algebra and concrete-spectrum comparison of Layer 5. The general quotient tower has the v-compatible uniqueness of §7.32, rather than uniqueness of arbitrary Moore algebra structures.

**Checks.**

- `moore_power_two_route`: §7.32 at v=4, admissible since Q₁(4)=0, gives S/2^(2(n+1)): S/16 as E₁ and S/64 as E₂. The synthetic route is required for S/8 as E₁ and S/32 as E₂.
- `moore_odd_square`: S/p² is E₁ at odd p, whereas S/p is never E₁.
- `moore_two_not_eOne`: at p=2 and n=1 the range begins at q=3; S/2 has no unital multiplication (§7.1).

(Bu Theorems 1.1 and 1.2, p. 1; Thms. 3.1–3.2, pp. 6–8; Cor. 5.6 and Remark 5.7, p. 12.)

*Needs:* §7.1, §5.13, §5.18, §7.7, §7.29, §7.31, §7.32.

### Examples

For E = Hℤ, E/p has π₀ = ℤ/p and no extra degree-zero summand. For E = H(ℤ/p), its Bockstein sequence has a quotient term in degree zero and a torsion term in degree one. The doubling tower of ℤ has lim¹ = ℤ₂/ℤ. An exact couple can have E = 0 and nonzero D, and its i-map need not square to zero.

### Dependencies

Layers 3 and 5–6, abelian/spectral-object APIs, the supplied countable-tower algebra and the local Ext comparison, TangentialBordism's Steenrod squares and Adams tower, and §§7.29–7.31's obstruction tower, deformation and synthetic spectra; prime, finiteness and convergence conditions remain explicit.

## Downstream consumers

General algebraic K-theory uses these category constructions, plus comparisons, K-theory spectra, products and coefficients. Low-degree K-theory and regulators use the central-extension comparisons. Étale and motivic K-theory use coherent spectra and filtered convergence: the filtered-diagram, exact-couple, functorial-page and convergence interfaces are §§7.21–7.26, including the hypotheses of the convergence theorems. Abstract derived-sheaf theory uses the concrete stable presentation and operadic comparisons; arithmetic-duality developments use §7.9's spectral comparison with the shared tower algebra. Each consumer imports these interfaces with the connectivity, prime and finiteness conditions.

The following contracts export the general constructions here. GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic are downstream consumers, not prerequisites.

| Consumer interface | Owner and identifying maps |
| --- | --- |
| GeneralAlgebraicKTheory §§1.1–1.4 | §§1.1–1.34 and 2.31–2.35 here own realized nerves and Quillen A/B. Its classifying space and functor map are aliases for the same realized nerve and nerve map, with the same vertices. Comma comparisons commute up to the specified homotopy with projection to BC after reversing its paths b→f(a) to the paths f(a)→b used here. Opposite comparisons reverse the arrow strings and simplex coordinates; product comparisons use the realized projections. Retain the corresponding local coefficient transport. |
| GeneralAlgebraicKTheory §1.5 | §§3.1–3.28 here own acyclic plus maps, uniqueness and functoriality, including §3.25's arbitrary-target factorization. Its plus object carries the same source map and subgroup kernel; comparison with a chosen model is the unique homotopy equivalence under X, preserving every pulled-back local coefficient system. |
| GeneralAlgebraicKTheory §1.6 | §§4.3–4.21 here own the monoidal localizations and group completion. Identify objects (s,x) and stabilized morphism classes directly, so inclusion, translation and component difference [a]−[b] agree. The action-fibre comparison retains its chosen x₀ and composite nullhomotopy. |
| GeneralAlgebraicKTheory §§3.3–3.4 and 3.13 | AlgebraicKTheory A0–A1 supplies the matrix/projective algebra to both roadmaps. The finite-stage identity maps of §4.14 identify its stable GL and E with the aliases here; the Rᵐᵒᵖ/row adapter of §4.15 identifies the complement and splitting maps. The classifying-space/plus multiplication is the one constructed here. |
| GeneralAlgebraicKTheory §§5.1–5.7 and 5.10–5.11 | §§6.1–6.2 here own Waldhausen structures, S, additivity and relative-S delooping. Identify S-diagrams by their entries Aᵢⱼ, their quotient pushout squares, objectwise weak maps and relative latching cofibrations. Faces and degeneracies are the same index restrictions. The comparison carries source/quotient to source/quotient in additivity and the relative-S path object to the same pullback with its extra degeneracy. Its connective Ω-model is the model of §§6.1–6.2 with zero space weakly equivalent to Ω|wS•C|; the sequential/symmetric comparison retains the Kan-replacement maps and positive structure maps and sends each object loop to its K₀ generator. Its §§5.8–5.9 retain the exact-category S/Q comparison as additional consumer results. |
| GeometryOfNumbersAndQuadraticArithmetic §6.10, `plusConstructionComparison` | Its ordinary ring plus/Q comparison uses GeneralAlgebraicKTheory's Q-theory. It consumes §3.25 `IsPlusConstruction.lift` and §3.28’s H-space recognition theorem, specialized to X=BGL(R), P=E(R), with the supplied plus map. Its §6.1.7 right-projective/common-spectrum adapter transports these statements through the under-BGL plus equivalence and the right/left-module comparison of §4.15 here; preserve the factorization homotopy, quotient on π₁, ring maps, stabilization and opposite rings. No separate generic factorization or S/Q engine belongs to this consumer. |

## References

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

- J. F. Jardine, [Lectures on Homotopy Theory, Lecture 06: Simplicial groups and simplicial modules](https://www.math.uwo.ca/faculty/jardine/courses/homth/homth-lecture006a.pdf), §§14–16, Lemmas 14.1 and 14.3, pp. 1–5.
