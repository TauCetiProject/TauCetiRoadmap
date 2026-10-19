# Roadmap: K-theory of schemes, localisation and operations

**Summary.** Build the K-theory of perfect complexes on schemes, its proper transfers, localisation sequences and integer-graded groups `Kₙ(X)`, and the operations that relate it to cycles. Starting from sheaves of modules, derived categories and categorical K-theory, the layers lead to Zariski and Nisnevich descent, Gersten complexes, projective bundle and blowup formulas, Adams weight decompositions, and Riemann–Roch comparisons. A second thread constructs the supported Witt-vector K-theory needed for determinant and degree maps on perfect schemes. The final cycle comparisons concern ordinary schemes.

## Scope and ownership

This roadmap owns the passage from categorical K-theory to schemes: strict and complicial models of the supplied perfect derived category, supported and relative scheme K-theory, spectrum transfers, localisation, spectral descent and coniveau, projective bundle and blowup decompositions, and higher scheme operations. It also owns the comparisons between supported K-theory, coherent G-theory and cycle groups. Every construction includes the homotopies required to apply K-theory; an equivalence of triangulated homotopy categories alone is insufficient.

SchemeKTheoryOperations owns ordinary scheme K-theory, products, localisation, homotopy invariance and Adams operations. ColemanIntegration L3.Fa.1 consumes the interfaces of §§2.1, 3.3, 5.2, 6.8 and 6.11 and owns its exact-cube realization comparison, multi-relative refinements and regulator applications. Its existing consumer names are adapters to these ordinary scheme interfaces.

AlgebraicVectorBundles owns finite locally free sheaves, their ranks, duals, tensor, exterior and symmetric powers, determinant, and their affine projective-module comparison. DGAInfinity, Layer 5, owns perfect modules, compact generation and finite projective models over a ring. GrothendieckEulerForms owns exact and triangulated Grothendieck groups, Cartan maps and Euler classes, with the corresponding implementations in Tau Ceti. GeneralAlgebraicKTheory owns the categorical K-machines, the stable Whitehead model and its absolute K₀/K₁ comparisons, approximation and localisation theorems, products, transfers and the ring Bass theorem. The commutative determinant comparison of §3.6 and the special λ-ring, universal-polynomial, rank-augmentation and integral representation foundations of §§6.2–6.3 are targets here. StableHomotopyKTheory owns the spectral and homotopical tools used by those machines. The supplier contracts below fix the interfaces used here.

EnhancedDerivedSheaves owns enhanced derived categories, their perfect full subcategories, general module descent, perfect-scheme h-descent and derived completion. SchemeAndStackFoundations owns pseudo-coherent complexes, `D_QCoh` and its affine equivalence, derived projection and Tor-independent base change, Noetherian approximation, the Nisnevich site and its abelian cohomology, Witt-vector geometry, projective geometry, the resolution-property predicate, Chow groups, geometric Chern characters and geometric Riemann–Roch. StableReduction owns Rees blowup geometry. JacobianChallenge Layer C owns general proper coherence over locally Noetherian bases, and EnhancedDerivedSheaves E1.9 owns its proper-support and algebraic-space extensions. AlgebraicModuliForArithmeticGeometry builds flag geometry from the supplied projective bundles and owns field projective-space Castelnuovo–Mumford regularity. The relative projective-bundle extension and the exact categories needed by Quillen’s resolution are constructed here. JacobianChallenge owns Picard/divisor and curve cohomology comparisons. This roadmap supplies the strict-model and K-theory realizations of those results.

The unstable A¹ category and algebraic K-representability required for uniqueness of operations are constructed in Layer 6 before they are used. Projective perfect pushforward uses the Noetherian approximation already supplied by SchemeAndStackFoundations §0.9. Full tame-symbol presentations, Milnor K-theory, higher Chow groups, motivic cycle maps, and formal-scheme supported intersections belong to their named consumers; they are not prerequisites for the ordinary-scheme results here.

## Conventions

A scheme is arbitrary in the sheaf and derived-category targets unless a target adds hypotheses. “qcqs” means quasi-compact and quasi-separated. The scheme K-theory constructions and their functoriality use qcqs schemes throughout. A closed support is a closed subset `Z⊂X`; assume `X∖Z` quasi-compact whenever the supported localisation, extension or finite-descent argument uses this. Supports do not specify a closed subscheme structure. Noetherian hypotheses on G-theory, finite dimension for convergence, regularity for Cartan equivalence, and resolution properties for global strict models are stated separately.

Complexes are cochain complexes of `X.Modules`, indexed by `ℤ`, with differential raising degree. The shift satisfies `E[n]ⁱ=Eⁱ⁺ⁿ` and changes the differential by `(−1)ⁿ`. `Cone(A→B)` has `Bⁱ⊕Aⁱ⁺¹` in degree i. In particular `R —s→ R` in degrees −1,0 has Euler class `[coker s]−[ker s]`; `Cone(A→0)=A[1]` has class `−[A]`. A strictly perfect complex is globally bounded with finite locally free terms. Perfectness is a local derived property and does not include a global vector-bundle representative. Tor intervals are cohomological: `k⊗ᴸ_{k[x]}k` is `k⊕k[1]`, with amplitude `[−1,0]` over k and `[−2,0]` when retained as a `k[x]`-object.

Write `K(X)` for connective perfect K-theory and `𝕂(X)` for the nonconnective Frobenius-model spectrum. Set `Kₙ(X)=πₙ𝕂(X)` for `n∈ℤ`; these groups agree with connective K in nonnegative degrees. Use `K(X on Z)`, `𝕂(X on Z)` and `Kₙ^Z(X)` for supports. `G(X)` is connective coherent K-theory of a Noetherian scheme, with zero negative extension. Contravariant `f*` always denotes derived pullback on K. Proper `f_*` means `Rf_*` and is licensed on K only by a perfectness-preservation theorem, and on G by bounded coherent preservation. In diagrams use `Lf*` and `Rf_*` to distinguish directions.

Orient localisation so `∂[s]=[Cone(s)]` for a nonzerodivisor; for a DVR O with uniformizer π and residue field k this gives `∂[π]=[k]=1`. With the product `x·y` in that order, the boundary is right-linear: `∂(x·j*y)=∂x·y`. On the left, `∂(j*y·x)=(−1)^{deg y}y·∂x`. Thus `∂([π]·[u])=[ū]` and `∂([u]·[π])=−[ū]` for `u∈O×`. The alternative degree normalization `∂′ₙ=(−1)^{n−1}∂ₙ` is left-linear. Mathlib's `Ring.ordFrac` takes values in the multiplicative type `ℤᵐ⁰`; passage to an additive order on nonzero elements is explicit. Never identify that codomain with `ℤ` by coercion.

The quotient convention is `P(E)=Proj_X(Sym E)`, with `π*E↠O(1)`, so `rank(E)=r` gives fibres `P^{r−1}`. Use the ordered basis `O,O(−1),…,O(1−r)`. On P¹, `[O(m)]=(m+1)[O]−m[O(−1)]`; rank is the sum of the two coefficients and Euler characteristic is the first. Sub-line flags use `P_quot(E∨)`. For a blowup along a regular immersion with conormal `J/J²`, the exceptional divisor is `P_quot(J/J²)`, `O_{X′}(1)=O_{X′}(−E)`, and its normal line is `O_E(−1)`. These conventions imply `i′_*[O_E(−1)]=[O_{X′}(E)]−1`.

The tensor product on `⊕Kₙ` adds homological degrees and is graded-commutative. The auxiliary λ-algebra used on higher K-groups sets products of two positive-degree terms to zero; it is a different product. The binomial rank augmentation takes values in locally constant integers, including disconnected schemes. Higher `λᵏ`, `k≥1`, are additive; on a unit loop, `λᵏ[u]=(−1)^{k−1}[u]` and `ψᵏ[u]=k[u]`. The full γ-filtration is generated by weighted products, including coefficient weights; vanishing of individual `γᵏ` does not itself prove a full integral filtration bound.

Rational weight projectors are formed only after inverting their nonzero integer eigenvalue differences. Finite-coefficient decompositions use an odd prime `ℓ`, a fixed exponent `ℓ^ν`, a primitive root modulo `ℓ`, and the integral endpoint and Bockstein hypotheses specified in Layer 6; rational endpoint decompositions are insufficient. For closed immersions the Bott correction uses the conormal bundle. The leading Chern class of `O_Z` in codimension c is `(−1)^{c−1}(c−1)![Z]`. The divisor complex `O(−D)→O` fixes the positive coefficient in codimension one.

Choose universes before the K-construction. Pass from essentially small derived perfect categories to small models, and prove change-of-universe invariance. Do not assert that all chain representatives form an essentially small category: arbitrary acyclic summands obstruct that assertion.

## Exact supplier contracts

The following are mathematical interfaces, with their own hypotheses. An implementation of a later layer must use these interfaces or the named earlier target that constructs the scheme specialization.

### From Mathlib and Tau Ceti

 Use `AlgebraicGeometry.Scheme.Modules`, `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFiniteType`, `SheafOfModules.IsFinitePresentation`, `CochainComplex`, `DerivedCategory`, derived functors, homology and triangulated-category APIs. Finite locally free sheaves use the AlgebraicVectorBundles comparison between locally free finite type and locally free finite presentation. Use `TauCeti.ExactK0`, `TauCeti.TriangulatedK0`, `TauCeti.TriangulatedK0.of_distTriang`, `.of_eq_sub_of_distTriang` and `.of_shift_one`; use the exact structures on finite and finite projective modules, `TauCeti.cartanMap`, its Euler inverse and `TauCeti.cartanEquiv`. The new affine π₀ theorem identifies the scheme Cartan map with that map. Tau Ceti's module-sheaf tensor and closed structures, and its quasicoherent affine equivalence, fix the corresponding supplier interfaces; the derived extension is supplied by SchemeAndStackFoundations §2.18 and EnhancedDerivedSheaves E1.8, with its strict-model compatibility proved in Layer 1. Existing `Ring.ordFrac`, discrete valuation, module support, divisor and cycle declarations fix the degree-one compatibility targets. Tau Ceti's function-field Riemann–Roch enters through JacobianChallenge's geometric dictionary.

The library pins are Mathlib 6b7abb3 and Tau Ceti a91d3aa. The concrete module contracts used above are:

| Module | Declarations and contract |
| --- | --- |
| `Mathlib.AlgebraicGeometry.Modules.Sheaf`, `Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree` | `AlgebraicGeometry.Scheme.Modules` and `SheafOfModules.IsLocallyFree`; finite type and finite presentation use `SheafOfModules.IsFiniteType` and `SheafOfModules.IsFinitePresentation` from `Mathlib.Algebra.Category.ModuleCat.Sheaf.Generators` and `.Quasicoherent`, respectively. |
| `TauCeti.CategoryTheory.GrothendieckGroup.Exact`, `TauCeti.CategoryTheory.GrothendieckGroup.Triangulated` | `TauCeti.ExactK0`, `TauCeti.TriangulatedK0` and its triangle and shift relations cited above. |
| `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic` | `TauCeti.finiteProjectiveModules`, `TauCeti.finiteProjectiveModulesExactStructure`, `TauCeti.finiteModulesExactStructure`, `TauCeti.cartanMap`, `TauCeti.moduleResolutionEquiv`, `TauCeti.moduleEulerClassOf`, `TauCeti.cartanInverse` and `TauCeti.cartanEquiv`; the last two require the finite-resolution hypothesis of that module. |
| `TauCeti.AlgebraicGeometry.Modules.TensorProduct` | AlgebraicGeometry.Scheme.Modules.instMonoidalCategory, .instSymmetricCategory and .instMonoidalClosed, with the structure sheaf as tensor unit. |
| `TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed` | SheafOfModules.dual and `TauCeti.SheafOfModules.monoidalClosed`, supplying the underived tensor–Hom interface. |
| `TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Affine` | `TauCeti.AlgebraicGeometry.QuasicoherentSheaf.affineEquiv`, `.affineEquiv_functor` and `.affineEquiv_inverse`, for affine X; Layer 1 compares their chain-model realizations. |

### From AlgebraicVectorBundles and DGAInfinity

Import AlgebraicVectorBundles L0B–L0C’s finite locally free category, scalar extension, tensor, dual, exterior and symmetric functors, and the determinant on the core, including the natural isomorphisms needed for tensor pairings. DGAInfinity, Layer 5, supplies `Perf(A)=compact D(A)=thick(A)`, finite-projective complex models, retract closure and the dg/enhanced comparison. Its right dg-module convention is converted using opposite algebras before comparing with Mathlib's left ModuleCat. The affine scheme target proves compatibility with tilde and RΓ; it does not redefine module perfectness. In particular ℤ/6 is perfect over ℤ, ℤ/2 is not perfect over ℤ/4, and amplitude `[0,0]` gives precisely `TauCeti.finiteProjectiveModules` A. The zero-ring derived category is zero. Over `ℤ_p[[x]]`, the complex `R —x→ R` is a perfect resolution of `ℤ_p`, agreeing with the complete-local specialization.

### From GeneralAlgebraicKTheory

 Sections 3.12 and 3.14 supply plus/Q and the absolute K₀/K₁ comparisons; §§4.14 and 4.16 supply Serre localisation and the coker-minus-ker automorphism boundary. Layers 5–6 supply the S-construction, Gillet–Waldhausen, approximation and cofinality. §§7.2–7.7 supply stabilized biexact pairings, their natural homotopies and projection formulas; §8.13 supplies the right-linear Serre-localisation boundary pairing. Layers 9–10 supply ring localisation, Nil terms and the all-integer ring Bass theorem, independently of the scheme theorem here. §§11.7–11.16 supply Frobenius localisation, additivity, filtered continuity and derived invariance; §§12.10–12.11 compare with Bass and §13.6 states the enhanced derived-invariance restriction. Scheme complicial models must additionally verify the corrected approximation criterion of Thomason's 1993 §4, pp.213–215: in each category a retract, up to weak equivalence, of an acyclic object is acyclic. Layer 1 verifies it for the perfect and bounded-coherent models. Completion of stable GL, finite-rank stabilization and representation-operation homotopies belong to §§6.3–6.8 here, rather than to these categorical K-theorems. The coefficient Adams/Bockstein construction in §6.9 uses the pointed-sheaf Adams maps and Moore-space comparison constructed here; it is not an additional categorical pairing theorem.

### Low-degree supplier comparisons

 Ring K₀ is `TauCeti.ExactK0` (`TauCeti.finiteProjectiveModulesExactStructure` A) from `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`; scalar extension and its K₀ comparison are GeneralAlgebraicKTheory §§3.1–3.2, stable units and the Whitehead comparison are §§3.3–3.4 and 3.14, the tensor and transfer comparisons are §§7.6–7.7, and the positive DVR boundary and its right product action are §§8.12–8.13. AlgebraicVectorBundles L0B supplies the affine finite-projective dictionary. SchemeAndStackFoundations §5.7 supplies geometric rank and determinant on vector-bundle K₀. Section 3.6 identifies the commutative stable determinant and its local-ring splitting; §§6.2–6.3 build the abstract λ-ring and integral representation interfaces, including affine specialness and the first-graded determinant comparison. The nonunital weighted-generator comparison of §6.2 includes coefficient weights, and §6.5 distinguishes integral single-operation bounds from rational full-filtration bounds. No Matsumoto presentation is used for the ordered unit-product residues.

### From StableHomotopyKTheory

 Layer 5 supplies concrete spectra, derived fibres/cofibres, smash products, connective/Postnikov truncations and sequential homotopy colimits. §§7.1–7.7 supply Moore coefficients and Bockstein/universal-coefficient sequences; §§7.9–7.10 supply homotopy limits of towers and their lim¹ sequence; §§7.21–7.23 supply `FilteredSpectrum`, `ExactCouple` and `FilteredSpectrum.spectralSequence.map`; §§7.24–7.27 supply convergence under their boundedness or completeness hypotheses. §7.28 supplies coefficient products for prime powers outside {2,3,4,8}; §7.30 supplies its additional vanishing-hypothesis variant. §7.31 supplies Eₙ Moore structures only in its exponent range (ν≥n+1 at odd primes). These are tools for spectral constructions. The pointed simplicial-sheaf homotopy model, its unstable Brown–Gersten theorem and its comparison with spectral `hypercohomology` are new targets of §6.7 here, built after the Godement construction in §4.3. Odd Moore coefficients provide exponent `ℓ^ν` on spectral coefficient groups; additivity and Bockstein compatibility of unstable Adams operations in degree two require the additional construction isolated in §6.9.

### From EnhancedDerivedSheaves

 E0 supplies stable enhancements, mapping spaces, cores and the dg-nerve comparison. E1.2–E1.4 supply K-flat/K-injective replacements, enhanced Lf*, `Rf_*`, tensor and RHom, with coherent units, counits and composition. E1.8 supplies `QuasicoherentDerived`, `PerfectDerived` and `quasicoherentDerived_affine`, including the unbounded affine equivalence on mapping spaces. Perf membership means local bounded finite-projective representatives; its repleteness and local criterion are imported. Layer 1 compares these objects with strict sheaf models and complicial/Frobenius localizations. E1.9 supplies `spaceProperSupport_coherent`, `spaceProperSupport_perfect`, `spaceProperSupport_approximation` and `perfect_proper_pushforward`: these include bounded coherent pushforward with proper support over a Noetherian base, finite-relative-Tor perfect pushforward there, and arbitrary-base perfect pushforward with a bounded finitely presented target-flat coefficient complex of proper support. Its flat proper finitely presented corollary is imported. E2.8 supplies the enhanced proper-coherence comparison with JacobianChallenge Layer C. Layer 2 constructs the corresponding complicial K/G functors, not these underlying preservation theorems. E5:cotangent-export supplies derived polynomial/exterior powers; the coherent overlap comparison with supported strict operations is a target of Layer 6. E5:presentability supplies compact factorization through the thick perfect subcategory (Stacks Tags 09SN and 09SP). E2.8 supplies `perfectHTopology`, `descendable_hCover_noetherian`, `perfectHCover_descendable` and `perfect_hDescent`: the last is h-Čech descent for Dqc and h-hyperdescent for Perf on qcqs perfect `F_p`-schemes. Layer 4 constructs the separate v-site comparison and its amplitude-stratum upgrade; h-to-v approximation is not an unproved supplier assumption. E5:animation and E5:spectra-comparison supply animated algebras and their enhanced module categories for the restricted derived Čech chart realization in §4.10. E4.2 and E4.5 supply regular-ideal completion, the completed coefficient ring and enhanced coefficient-system reconstruction. Layers 3–4 construct the Witt supported categories and prove the perfect-object effectivity and v-descent comparisons; generic coefficient reconstruction alone is not identified with `Perf(W(A))≃lim_n` `Perf(W_n(A))`.

### From SchemeAndStackFoundations

 [§0.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md) supplies coherent/vector-bundle Hartogs extension. §0.9 supplies `noetherian_approximation` and `finite_presentation_limits`: qcqs schemes are inverse limits of finite-type ℤ-models with affine transitions, and finite-presentation data descend. §§0.15 and 0.24–0.26 supply Popescu approximation, perfect schemes, perfectly finitely presented maps and `W_n(X)`. §2.18 supplies `PseudoCoherence.IsPseudoCoherentComplex`, `DQCoh`, `DQCoh.affineEquiv`, `derivedTensor`, `derivedHom`, `perfect_dual`, `totalDirectImage_coproduct`, `projectionFormula`, `torIndependent_baseChange` and the perfect generator, including compact generation by perfect complexes. EnhancedDerivedSheaves E5:presentability supplies the complementary compact-factorization characterization. Its pseudo-coherence is a local bounded-above finite-free resolution condition; Layer 1 adds the finite-level m refinement. The base-change formula holds for qcqs f and a Tor-independent square, with arbitrary quasicoherent derived input; Layer 2 realizes its enhanced transformation on K/G models. §§2.12–2.14 supply the Nisnevich topology, elementary squares, all henselian points indexed by étale objects and their points, the abelian dimension bound and Čech comparison. Their Brown–Gersten target concerns complexes on Sm/S over Noetherian finite-dimensional S; the new spectral Zariski-space version is §4.1. §2.6 supplies affine cohomology, qcqs Čech bounds, coproduct compatibility and relative Serre vanishing. Section 4.19, `Formal.DeJong.alteration_theorem`, supplies regular alterations of integral separated finite-type schemes over `𝔽_p`. Affine refinement, reduction and perfection give the h-local regular perfections used in §4.11. The formal Witt gluing and finite ramified coefficient geometry extend §§0.24–0.26 with the hypotheses of §§3.8–3.9. Section 3.8 here constructs the mixed-characteristic Frobenius lifts and their completed-colimit identification; the supported K-categories are constructed here. §§5.4 and 5.7 supply projective geometry, the resolution-property predicate `Chow.HasResolutionProperty`, geometric K₀/G₀, Euler pushforward and the natural geometric Chern character. Layer 5 supplies cycles, Chow groups, intersection, Chern/Todd and Whitney identities. The integral leading-Chern identity for a subvariety of smooth quasi-projective X is the new target `chernClass_structureSheaf_leading` in §7.2; it is not an imported supported-Chern construction on arbitrary regular schemes. §5.8 supplies geometric GRR for projective morphisms of smooth quasi-projective varieties; in the proper quasi-projective source/target scope a proper morphism is projective. The K/G realization comparison is proved here. Broader regular-scheme formulas carry the equally broad intersection-theory interfaces as explicit hypotheses.

### From StableReduction, AlgebraicModuliForArithmeticGeometry and JacobianChallenge

 StableReduction Layer 4 supplies Rees blowups and their exceptional-divisor geometry; Layer 5 here proves the additional regular-immersion and K-theoretic comparisons. SchemeAndStackFoundations §§0.3 and 5.4 supply projective bundles; its line convention is `P_quot(E∨)`, so apply the supplied dual-convention comparison to obtain `P_quot(E)` here. AlgebraicModuliForArithmeticGeometry §1.3 supplies flags built from that geometry and §1.5 supplies field projective-space regularity; §5.4 extends its predicate and propagation theorem to relative projective bundles, with an explicit field comparison. The flag interfaces are `flagBundle`, `flagBundle.projection`, `flagBundle.toGrassmann` and `flagBundle.baseChange`, with their universal nested kernels; Layer 6 adds the K₀ class identity of the universal line quotients and the K-theoretic splitting theorem. JacobianChallenge A supplies Picard/divisor dictionaries with residue degrees; B supplies curve Riemann–Roch, Serre duality and the function-field/geometric comparison; C supplies coherent higher direct images for every proper scheme morphism over a locally Noetherian base, without flatness of the morphism or coefficient, and finite cohomology over a Noetherian affine base. Its cohomology-and-base-change criteria retain flatness of the coherent coefficient over the base; the curve case is a specialization. The general derived Tor-independent theorem comes from SchemeAndStackFoundations §2.18; its K/G-transfer homotopy is constructed here.

### From ReductiveGroups and quasicoherent descent

ReductiveGroups Layers 0–1 supply the affine group-scheme/comodule dictionary, tensor and dual representation functors; Layer 4 supplies the diagonalizable grading dictionary, and Layer 9 supplies the split integral group schemes. SchemeAndStackFoundations §1.1 supplies effective quasicoherent descent, and AlgebraicVectorBundles L0B–L0C supplies the affine finite-projective dictionary and its polynomial functors. Sections 6.3.1–6.3.3 add the exact integral representation groups, formal characters, generic and residue comparisons and associated-projective K₀ operations. These are not inferred from complex semisimple representation theory.

## How to read the build

Layer 1 compares the supplied perfect categories with strict, complicial and Frobenius models and proves finite descent. Layer 2 applies categorical K-machines, constructs transfers and proves bounded proper-support and projective approximation applications. Layer 3 first proves extension and exactness up to retracts, then uses Frobenius localisation directly, before the Bass construction. Its Witt completion and regular-perfection calculations use the same support theory. Layer 4 establishes spectral descent and support towers, distinguishes perfect coniveau from coherent coniveau, proves Gersten in the listed cases and develops v-hyperdescent for perfect and Witt categories from the supplied h-descent. Layer 5 proves the geometric K-projective formula, scheme Bass comparison and blowup formula. Layer 6 constructs products and operations with their abstract λ-ring, integral representation, stability and weighted-filtration bridges. Its abstract special λ-ring theory and projective pre-λ structure precede §6.3’s representation proof of affine specialness; the concrete nonunital and higher-operation applications use that theorem. Layer 7 compares those operations and spectral transfers with cycles, geometric Chern characters, Riemann–Roch and excess intersection.

The Lean signatures `IsStrictlyPerfect`, `isStrictlyPerfect_zero`, `isStrictlyPerfect_single`, `isStrictlyPerfect_iff_of_iso`, `IsStrictlyPerfect.shift` and `IsStrictlyPerfect.cone` express the strict-complex interface directly over `X.Modules`. The remaining signatures that require new carriers are stated in the prose. The two proved examples in `Suggested.lean` exclude complexes with terms in arbitrarily negative degrees and their contractible identity cones. The geometric sign computations below use their actual K-theoretic objects in the README.

## Layer 1: Perfect complexes and their models

### 1.1 Strict models and local lifting

Work over any scheme X, with cochain complexes as in the conventions. Acyclicity and boundedness of terms are distinct conditions.

A cochain complex is **strictly perfect** when it is globally bounded and each term is finite locally free. Use the sheaf notion of finite locally free from AlgebraicVectorBundles. A term need only be locally a summand of finite free; a global summand is stronger. Thus `O(1)` on P¹ is allowed. ([Stacks.cohomology, Cohomology of Sheaves, Definition 46.1 (tag 08C4)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 49.3 (tag 0BCJ)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, Definition 2.2.2, p. 285](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `IsStrictlyPerfect` — The object property on complexes of `O_X`-modules: bounded, with finite locally free terms.
- `isStrictlyPerfect_zero` — The zero cochain complex is strictly perfect.
- `isStrictlyPerfect_single` — A finite locally free `O_X`-module placed in a single degree n is strictly perfect.
- `IsStrictlyPerfect.exists_bounds` — A strictly perfect complex has integers `a ≤ b` with `E^i = 0` for `i ∉ [a, b]`.
- `isStrictlyPerfect_iff_of_iso` — An isomorphism of complexes preserves and reflects strict perfectness.
- `IsStrictlyPerfect.shift` — E• strictly perfect implies E•`[k]` strictly perfect for every `k ∈ ℤ`.
- `IsStrictlyPerfect.cone` — The mapping cone of a chain map between strictly perfect complexes is strictly perfect.
- `isStrictlyPerfect_iff_locally_summand_free` — E• is strictly perfect iff it is bounded and each `E^i` is locally on X a direct summand of a finite free module (the local summand formulation of TT 2.2.2; distinguish Stacks 08C4).
- `IsStrictlyPerfect.restrict` — For an open immersion j : `U → X`, the restriction of a strictly perfect complex is strictly perfect.
- `IsStrictlyPerfect.tilde` — For a ring A and a bounded complex P• of finite projective A-modules, the termwise tilde P•~ on `Spec A` is strictly perfect (AlgebraicVectorBundles L0B’s affine finite-projective comparison).

**Checks.**

- The two-term complex `O —x→ O` in degrees −1,0 on `A¹_k` qualifies; its cohomology is the skyscraper `k(0)` in degree zero.
- That skyscraper, viewed as a single sheaf, fails the condition: its ranks at the generic point and origin differ.
- Zero and `O[0]` qualify, and every complex on the empty scheme is zero.
- The zero-differential complex with O in every nonpositive degree fails boundedness on nonempty X.
- Its identity cone is contractible and still has unbounded terms, so it is not strictly perfect.
- Sheafifying `ℤ —2→ ℤ` gives a strict model for `(ℤ/2)`~.
- `O(1)[0]` on P¹ qualifies, although every map `O(1)→Oʳ` is zero; global summands of finite free sheaves would exclude it incorrectly.

Strictly perfect complexes are closed under shifts, cones, tensor products and degreewise pullback. Bounded complexes of flat sheaves are K-flat, so these tensor and pullback computations represent the derived operations. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 46.2 (tag 08C5)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 46.3 (tag 09J2)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 46.4 (tag 09U6)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, 2.5.1, p. 303](https://gwern.net/doc/math/1990-thomason.pdf)).

Let P be strictly perfect with `Pʲ=0` for `j<a`, and let `M→N` induce Hʲ-isomorphisms for `j>a` and a surjection for `j=a`. Every chain map `P→N` lifts locally to `P→M` up to chain homotopy. Separately, derived maps from P have local chain representatives, and two representatives of the same derived map are locally chain homotopic. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 46.7 (tag 08C8)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 46.8 (tag 08C9)](https://stacks.math.columbia.edu/download/cohomology.pdf)).

**Checks.**

- For `P=N=k[0]`, `M=0` and `a=1` on `Spec k`, the cohomology conditions hold but the identity has no lift; the lower term bound excludes this input.
- For `P=k[0]`, `a=0` and a surjection `M[0]→N[0]` of vector spaces, lifting is ordinary lifting of a vector.
- For `M=0` and `N=Cone(id_Q)`, every chain map `P→N` is nullhomotopic; the zero lift works for every allowed lower term bound.

### 1.2 Pseudo-coherence and Tor bounds

For the pseudo-coherent object property of SchemeAndStackFoundations §2.18, construct the finite-level refinement: E is **m-pseudo-coherent** if locally a strictly perfect P maps to E inducing Hⁱ-isomorphisms for `i>m` and an Hᵐ-surjection. Prove that having this property for every m is equivalent to the supplier’s `PseudoCoherence.IsPseudoCoherentComplex`, rather than introduce a second pseudo-coherence predicate. Establish the finite-level shift, triangle, summand and pullback rules below. On Noetherian X identify the supplied property with D⁻ of coherent sheaves; on merely locally Noetherian X its upper bound is local. For `M[0]`, the finite-level tests give finite type at `m=0` and finite presentation at `m=−1`. ([Stacks.cohomology, Cohomology of Sheaves, Definition 47.1(1)–(3) (tag 08CB)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 10.3 (tag 08E8)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, 2.2.8, p. 289](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `IsPseudoCoherentAt` — The finite-level m-pseudo-coherence condition just stated.
- `isPseudoCoherentAt_all_iff` — (∀ m, IsPseudoCoherentAt m E) ↔ PseudoCoherence.IsPseudoCoherentComplex E.
- `IsPseudoCoherentAt.of_quasiIso` — The finite-level property is invariant under quasi-isomorphism.
- `IsPseudoCoherentAt.shift` — E is m-pseudo-coherent iff `E[k]` is `(m−k)`-pseudo-coherent.
- `IsPseudoCoherentAt.two_of_three` — In `K→L→M`, `(m+1)`-pseudo-coherence of K and m-pseudo-coherence of L imply m-pseudo-coherence of M, with the rotated bounds.
- `IsPseudoCoherentAt.summand` — The finite-level property is closed under retracts.
- `IsPseudoCoherentAt.pullback` — Lf* preserves each finite-level property.
- `isPseudoCoherent_iff_bounded_above_coherent` — On Noetherian X the supplied property is equivalent to bounded-above coherent cohomology.
- `isPseudoCoherentAt_single` — For `M[0]`, `m=0` means finite type and `m=−1` means finite presentation.

**Checks.**

- On the dual numbers, k is pseudo-coherent through its infinite ε-resolution, but has infinite Tor-dimension.
- Zero, including every object over the empty scheme, satisfies the condition.
- A countable free ℤ-module in degree zero fails 0-pseudo-coherence.
- For Noetherian A the affine test is D⁻ with finite cohomology modules, not necessarily bounded cohomology.

**Tor-amplitude `[a,b]**` means `Hⁱ(E⊗ᴸM)=0` outside `[a,b]` for every sheaf of modules M in degree zero. Distinguish a global finite interval from locally finite Tor-dimension. Prove stalkwise detection, flat-representative characterization, arbitrary derived pullback, triangle bounds and addition of intervals under tensor. Local finite bounds globalize on a quasi-compact scheme. ([Stacks.cohomology, Cohomology of Sheaves, Definition 48.1 (tag 08CG)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Definition 48.1(3) (tag 08CG)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, Definition 2.2.11, p. 290](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `HasTorAmplitude` — E has tor-amplitude in `[a, b]`.
- `HasFiniteTorDimension` — E has tor-amplitude in some `[a, b]`.
- `HasLocallyFiniteTorDimension` — E has finite tor dimension on the members of an open covering.
- `hasTorAmplitude_iff_flat_representative` — Tor-amplitude in `[a, b]` iff E is represented by flat modules in degrees `[a, b]` (Stacks 08CI).
- `hasTorAmplitude_iff_stalks` — Tor-amplitude in `[a, b]` can be checked on every stalk `E_x` over `O_{X,x}` (Stacks 09U9).
- `HasTorAmplitude.pullback` — Lf* preserves tor-amplitude in `[a, b]` (Stacks 09U8).
- `HasTorAmplitude.triangle` — The three-term closure rules in a distinguished triangle (Stacks 08CJ) and additivity of amplitudes under `⊗^L` (Stacks 09J4).
- `HasFiniteTorDimension.of_locally_quasiCompact` — On a quasi-compact scheme locally finite tor dimension implies finite tor dimension (TT 3.1.2).
- `HasTorAmplitude.bounded` — Tor-amplitude in `[a, b]` implies `H^i(E) = 0` for `i ∉ [a, b]`.

**Checks.**

- A vector bundle has amplitude `[0,0]`; `O —x→ O` has amplitude `[−1,0]`, even when its cohomology is concentrated in degree zero.
- Zero satisfies every proposed interval.
- Over `k[ε]/ε²`, `Torᵢ(k,k)=k` for all `i≥0`, excluding a finite interval.
- Affine sheafification preserves the module-theoretic interval exactly.

### 1.3 Perfect objects and derived operations

Use EnhancedDerivedSheaves E1.8’s `PerfectDerived X` and its induced perfect object property in the ordinary derived category. The targets here compare that membership criterion with the strict sheaf models: local bounded finite-projective representatives, locally direct summands of finite free, are equivalent to local strictly perfect complexes. Prove the finite-free local criterion and that a globally strict complex maps into this supplied subcategory. The affine equivalence is imported through E1.8 and DGAInfinity; no new Perf carrier or affine derived equivalence is defined here. ([Stacks.cohomology, Cohomology of Sheaves, Definition 49.1 (tag 08CM)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, Definition 2.2.10, p. 290](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 49.3 (tag 0BCJ)](https://stacks.math.columbia.edu/download/cohomology.pdf)).

Expose the following interface:

- `IsStrictlyPerfect.isPerfect` — The derived image of a strict complex belongs to PerfectDerived.
- `isPerfect_iff_locally_finite_free` — Membership in the supplied perfect subcategory is equivalent to local bounded finite-free representatives.
- `isPerfect_iff_strict_models` — Membership is equivalent to local quasi-isomorphism to the strict sheaf models of §1.1.

**Checks.**

- The skyscraper `k(0)` on A¹ is perfect by the x-resolution, although it is not strictly perfect as a single sheaf.
- `O[n]` and zero are perfect; `Perf(∅)` is the zero category.
- The dual-number residue field is excluded by its infinite Tor groups.
- For `n≠0`, `(ℤ/n)`~ is perfect via multiplication by n.
- The skyscraper at one origin of the doubled plane is locally perfect but has no global vector-bundle model.

Perfectness is equivalent to pseudo-coherence plus locally finite Tor-dimension. More sharply, Tor-amplitude `[a,b]` together with `(a−1)`-pseudo-coherence produces a strictly perfect local representative of that amplitude. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 49.5 (tag 08CQ)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 49.4 (tag 08CP)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, Proposition 2.2.12, p. 290](https://gwern.net/doc/math/1990-thomason.pdf)).

`Perf(X)` is thick: zero, shifts, triangles and retracts stay perfect. Establish the object-property instances, not a second triangulated-category implementation. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 49.7 (tag 08CR)](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 49.9 (tag 08CS)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, Proposition 2.2.13(b), p. 291](https://gwern.net/doc/math/1990-thomason.pdf)).

Derived tensor preserves perfectness and adds Tor intervals. A perfect factor tensored with a pseudo-coherent factor is pseudo-coherent. For mixed boundedness assertions include the required global Tor bound; an infinite disjoint union of differently shifted points has no uniform bound. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 49.8 (tag 09J5)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, 2.5.1, p. 303](https://gwern.net/doc/math/1990-thomason.pdf)).

For every scheme morphism f, Lf* preserves perfect and pseudo-coherent objects and each fixed Tor interval. Compute it using K-flat representatives, in particular bounded-above flat ones. Termwise flatness of an arbitrary unbounded complex is insufficient. ([Stacks.cohomology, Cohomology of Sheaves, Lemma 49.6 (tag 09UA)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, 2.5.1, p. 303](https://gwern.net/doc/math/1990-thomason.pdf)).

Split idempotents in the derived category using its countable coproducts, then use thickness to retain perfectness. Obtain an idempotent-complete `Perf(X)` without asserting that an arbitrary strict chain-level idempotent has already split. ([Stacks.derived, Derived Categories, Lemma 4.14 (tag 05QW)](https://stacks.math.columbia.edu/download/derived.pdf); [Stacks.perfect, Derived Categories of Schemes, proof of Lemma 3.1 (tag 08DT)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Use quasicoherence of perfect cohomology from EnhancedDerivedSheaves E1.8. Prove the additional uniform-bound comparison: on quasi-compact X a perfect object has cohomology in a single finite interval; on locally Noetherian X each cohomology sheaf is coherent. Over Noetherian X, RHom from a perfect object to a bounded coherent object is bounded coherent. These global bounds are not inferred on a non-quasi-compact disjoint union of differently shifted points. ([Stacks.perfect, Derived Categories of Schemes, Lemma 10.1 (tag 08E5)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.cohomology, Cohomology of Sheaves, remark after Definition 49.1](https://stacks.math.columbia.edu/download/cohomology.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 11.6 (tag 0FXU)](https://stacks.math.columbia.edu/download/perfect.pdf)).

### 1.4 The affine derived comparison

Import the ring-level perfect-module theorem through DGAInfinity, Layer 5, and use its finite-projective models. The assertions here compare it with sheaves; they do not reconstruct the ring theorem.

Construct `quasicoherentCoherator` Q, right adjoint to `QCoh(X)→Mod(O_X)`, with `quasicoherentCoherator_adjunction`, `quasicoherentCoherator_onQuasicoherent` and `quasicoherentCoherator_affine`. Identify D(QCoh X) with `D_QCoh(X)` for quasi-compact schemes with affine diagonal (Stacks 08DB). For Noetherian X use the bounded-below comparison (TT B.16); for Noetherian X of finite Krull dimension also use the unbounded comparison (TT B.17). Identify the bounded coherent models under the Noetherian hypotheses. Keep the derived adjunction and its unit/counit explicit. ([Stacks.perfect, Derived Categories of Schemes, Proposition 7.5 (tag 08DB)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Proposition B.16 and B.17, pp. 416–417](https://gwern.net/doc/math/1990-thomason.pdf)).

For the affine derived equivalences of SchemeAndStackFoundations §2.18 and EnhancedDerivedSheaves E1.8, prove compatibility with the concrete sheafification and global-section models used in the complicial K-construction. Compare their tensor constraints, restriction of scalars and derived scalar extension by coherent natural equivalences. The underlying unbounded equivalence `D(A)≃D_QCoh(Spec A)`, including its mapping spaces, is supplied; this target identifies its realization on the chosen chain models. ([Stacks.perfect, Derived Categories of Schemes, proof of Lemma 3.5 (tag 06Z0)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 3.8(2) (tag 08DW)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 3.7 (tag 0DJK)](https://stacks.math.columbia.edu/download/perfect.pdf)).

**Checks.**

- On `Spec A`, `quasicoherentCoherator` sends a module sheaf M to `Γ(X,M)`~, and fixes each sheaf N~ through the adjunction counit.
- It sends zero to zero; on `Spec ℤ` the sheaf `(ℤ/2)`~ remains nonzero and supported at `(2)`.
- For the generic open j of the spectrum of a DVR, `j_!O` is not quasicoherent: its global sections vanish although its generic stalk is nonzero. The coherator is zero in this affine example, so the counit is not an isomorphism for arbitrary module sheaves.

### 1.5 Compatible K-theory models and universes

In this subsection X is qcqs. Choose a small homotopically equivalent model before applying a K-machine. Derived equivalences must be realized by enhanced or complicial functors with the stated approximation properties.

Use all complexes that are perfect and have a global finite Tor bound as the complicial biWaldhausen model. Cofibrations are degreewise split injections with perfect cokernel; weak equivalences are quasi-isomorphisms. Supply cylinders and canonical homotopy pushouts/pullbacks. Its derived category, rather than this chain-level category, is essentially small on qcqs X. ([TT90, Definition 3.1, p. 312](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 1.2.11, p. 255](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, V.3.8 (PDF p. 400)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `perfCategory` — The full subcategory `Perf(X)` of complexes of `O_X`-modules on perfect complexes of globally finite Tor-amplitude.
- `perfCategory.cofibration_iff` — A map is a cofibration iff it is a degreewise split monomorphism with cokernel in `Perf(X)`.
- `perfCategory.weq_iff` — A map is a weak equivalence iff it is a quasi-isomorphism of complexes.
- `perfCategory.isComplicialBiWaldhausen` — `Perf(X)` is a saturated extensional complicial biWaldhausen category (TT 1.2.11).
- `perfCategory.cylinder` — The TT 1.3.4 mapping cylinder is a cylinder functor satisfying the cylinder axiom on `Perf(X)`.
- `perfCategory.closedUnderHomotopyPushouts` — `Perf(X)` is closed under canonical homotopy pushouts and pullbacks (hypothesis of TT 1.9.8).
- `perfCategory.homotopyCategoryEquiv` — `w^{-1}Perf(X)` is equivalent to the perfect subcategory with globally finite Tor-amplitude; for quasi-compact X this is `D_perf(O_X)`.
- `perfCategory.supports` — For Z closed with `X ∖ Z` quasi-compact, `Perf_Z(X)`: perfect complexes acyclic on `X ∖ Z`, with the induced structure.
- `perfCategory.restrict` — Restriction to an open U is a complicial exact functor `Perf(X) → Perf(U)`.

**Checks.**

- On `Spec A` the localized model agrees with `Kᵇ(proj_fg A)`; on the empty scheme its localization is zero.
- Arbitrarily large acyclic complexes `M —id→ M` belong to the model, so the category of representatives is not essentially small.
- On A¹ the quasi-isomorphism from the x-resolution to `k(0)` has no chain homotopy inverse: a map `k(0)→O` must vanish.
- Thus weak equivalence must mean quasi-isomorphism, rather than chain homotopy equivalence.

Compare the perfect model with bounded-above flat and bounded-below injective or flasque models. Quasicoherent derived models use quasi-compact affine diagonal, or the bounded-below Noetherian comparison; the unbounded Noetherian comparison additionally uses finite Krull dimension as in §1.4. Coherent models use Noetherian X; global vector-bundle models use the resolution property on qcqs X. Carry supports through these comparisons. ([TT90, Lemma 3.5, p. 314](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proof of Lemma 3.5, p. 314](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Lemma 3.8, p. 316](https://gwern.net/doc/math/1990-thomason.pdf)).

Form the Frobenius pair of perfect complexes and acyclic ones, with degreewise split conflations and contractible projective-injectives. Its derived quotient is `D_perf(X)`, idempotent complete on qcqs X. Ordinary exact sequences that are not degreewise split are not its conflations. ([Schlichting, 5.10, p. 13](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)).

Expose the following interface:

- `perfFrobeniusPair` — The Frobenius pair (`Perf(X)`, acyclic perfect complexes) with degreewise split conflations.
- `perfFrobeniusPair.projectiveInjective_iff` — An object is projective-injective iff it is a contractible complex.
- `perfFrobeniusPair.derivedEquiv` — `D(Perf(X), Perf(X)^0) ≃ w^{-1}Perf(X) ≃ D_perf(O_X)`, triangulated.
- `perfFrobeniusPair.isIdempotentComplete` — Its derived category is idempotent complete.
- `perfFrobeniusPair.map` — A complicial exact functor preserving acyclic complexes and degreewise split sequences (e.g. pullback on flat models) induces a map of Frobenius pairs.

**Checks.**

- `Cone(id_O)` is contractible and projective-injective, whereas `O[0]` is not on nonempty X.
- Empty X gives the zero pair.
- Affine localization recovers `Kᵇ(proj_fg A)`.
- The sequence `0→O —x→ O→k(0)→0`, placed in degree zero on A¹, is exact but is not a conflation of this degreewise split structure.

Compare the enhanced localization of the complicial and Frobenius models with EnhancedDerivedSheaves E1.8’s `PerfectDerived X`, for qcqs X. Construct an exact equivalence and its coherent compatibility with pullback, passing to small models using §1.5. The supplied dg-nerve comparison identifies mapping spaces with Dold–Kan of `τ≤0RHom`; require the model comparison to induce that identification. Stability, the ambient enhanced category and its perfect full subcategory are imported rather than reconstructed. ([TT90, Introduction, p. 248](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 49.9 (tag 08CS)](https://stacks.math.columbia.edu/download/cohomology.pdf)).

Expose the following interface:

- `perfModelEnhancedEquiv` — The enhanced localization of the complicial perfect model is equivalent to the supplied PerfectDerived X.
- `perfModelEnhancedEquiv.homotopyCategory` — Its ordinary homotopy-category comparison agrees with perfCategory.homotopyCategoryEquiv.
- `perfModelEnhancedEquiv.mappingSpace` — The comparison identifies model mapping spaces with the supplied Dold–Kan RHom mapping spaces.
- `perfModelEnhancedEquiv.pullback` — The equivalence is coherently natural under derived pullback.

**Checks.**

- For a field, `π₀Map(k,k[n])` equals k at `n=0` and vanishes otherwise.
- The empty-scheme enhancement has contractible core.
- Its homotopy category embeds as precisely the perfect derived objects.
- Bounded coherent k over the dual numbers remains outside this enhancement.

Identify the homotopy categories of the Waldhausen, Frobenius and enhanced perfect models with `D_perf(X)`. A homotopy-category comparison alone does not identify their higher K-theory spectra. ([TT90, 1.9.6, p. 269](https://gwern.net/doc/math/1990-thomason.pdf); [Schlichting, 5.10, p. 13](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)).

Prove essential smallness of `D_perf(X)` for qcqs X using finite affine descent. Do not infer essential smallness of all perfect chain representatives: acyclic `M→ᵢᵈM` permits arbitrarily large terms. ([TT90, Lemma 2.4.1.7, proof, p. 299](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 1.4, p. 259](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Derived Categories of Schemes, Theorem 15.3 (tag 09IS)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Remark 17.2 (tag 0GEF)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Prove invariance under enlarging the universe for the qcqs perfect models, and the bounded pseudo-coherent models where used. Specify the change-of-universe functors and the equivalences they induce on K-theory. ([TT90, Appendix F, p. 431](https://gwern.net/doc/math/1990-thomason.pdf)).

### 1.6 Global vector-bundle representatives

Use the resolution property on a qcqs scheme: every finite-type quasicoherent sheaf is a quotient of a finite locally free sheaf. The statements below retain that hypothesis whenever they ask for global strict representatives.

Use SchemeAndStackFoundations §5.7’s `Chow.HasResolutionProperty X`, defined by finite locally free quotients of finitely presented module sheaves. For qcqs X prove equivalence with requiring such a quotient for every finite-type quasicoherent sheaf; on Noetherian X this is the coherent-sheaf version. Beyond the supplied affine and quasi-projective cases, prove the ample-family and regular quasi-compact affine-diagonal cases and quasi-affine ascent. This is an extension of the supplier’s predicate, not another definition. ([Stacks.perfect, Derived Categories of Schemes, Definition 36.1 (tag 0F86)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 36.7 (tag 0GMM)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 36.8 (tag 0F8A)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Expose the following interface:

- `hasResolutionProperty_iff_finiteType` — On qcqs X, Chow.HasResolutionProperty is equivalent to the finite-type quasicoherent quotient criterion.
- `hasResolutionProperty_of_ampleFamily` — An ample family on qcqs X gives the supplied resolution property.
- `hasResolutionProperty_of_regular_affineDiagonal` — A regular quasi-compact scheme with affine diagonal has the supplied resolution property.
- `HasResolutionProperty.of_quasiAffine` — A quasi-affine morphism to a scheme with the resolution property gives the resolution property, within the qcqs scope.
- `HasResolutionProperty.affineDiagonal` — On qcqs schemes the supplied resolution property forces affine diagonal.

**Checks.**

- Every coherent sheaf on P¹ is a quotient of `O(−n)ʳ` for sufficiently large n.
- Every affine scheme and the empty scheme satisfy the property.
- The doubled plane fails it: its chart intersection `A²∖{0}` is not affine, contradicting the affine-diagonal consequence.
- The doubled line has affine diagonal and does satisfy it, despite being nonseparated.

On a qcqs scheme the resolution property forces affine diagonal. Reduce the relevant quasicoherent ideals to finite type and apply the finite-free quotient criterion; do not replace affine diagonal by separatedness. ([Stacks.perfect, Derived Categories of Schemes, Lemma 36.10 (tag 0F8C)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, proof of Lemma 36.10](https://stacks.math.columbia.edu/download/perfect.pdf); [Totaro.2004, Proposition 1.3, p. 2](https://arxiv.org/pdf/math/0207210)).

Under the qcqs resolution property, every perfect object has a globally bounded vector-bundle representative; maps are represented by roofs and the necessary chain homotopies. Specify the global finite bound obtained from quasi-compactness. ([Stacks.perfect, Derived Categories of Schemes, Lemma 37.1 (tag 0F8E)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 37.2 (tag 0F8F)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 37.3 (tag 0F8G)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 37.4 (tag 0F8H)](https://stacks.math.columbia.edu/download/perfect.pdf)).

The localization of bounded vector-bundle complexes at quasi-isomorphisms is equivalent to `D_perf(X)` under the qcqs resolution property. This comparison is an input to K-theory, not an assertion that every such quasi-isomorphism is a chain homotopy equivalence. ([Stacks.perfect, Derived Categories of Schemes, Proposition 37.5 (tag 0F8I)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Proposition 2.3.1(d), p. 293](https://gwern.net/doc/math/1990-thomason.pdf)).

For affine n-space with doubled origin, `n≥2`, construct the perfect skyscraper at one origin which has no global strict representative. Use the vector-bundle Hartogs extension and resolution-property counterexample supplied by SchemeAndStackFoundations §§0.6 and 5.7. The new comparison computes vector-bundle K₀ as ℤ and perfect K₀ as ℤ², so the perfect skyscraper class is outside the image of the global strict model. The doubled line is excluded from this counterexample. ([TT90, Exercise 8.6, p. 374](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Exercise 8.6, hint, p. 374](https://gwern.net/doc/math/1990-thomason.pdf); [Totaro.2004, §1, p. 2](https://arxiv.org/pdf/math/0207210); [Weibel, Example II.8.2.4 (PDF p. 155)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 1.7 Finite descent and bounded enhanced strata

For the limit assertions use a cofiltered system of qcqs schemes with affine transition maps. For the enhanced core at a fixed Tor interval, use the enhanced mapping spaces of EnhancedDerivedSheaves E1.8; the amplitude-stratum and finite-diagram continuity refinements are constructed below.

For a cofiltered qcqs system with affine transition maps, perfect objects descend to a finite stage and maps out of perfect objects are the filtered colimit of finite-stage maps. Vanishing off a descended closed support is eventually detected. No flatness of the transitions is imposed. ([Stacks.perfect, Derived Categories of Schemes, Lemma 29.3 (tag 09RF)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 29.2 (tag 09RE)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Proposition 3.20.1, p. 324](https://gwern.net/doc/math/1990-thomason.pdf)).

For integers `a≤b` construct the enhanced core `Perf^[a,b](A)`, consisting of perfect A-complexes of that Tor-amplitude. Pullback preserves the stratum; the filtered union of strata is `Perf(A)`. The `[0,0]` core is the groupoid of finite projective modules. ([BS17, §11, proof of Theorem11.2(2)](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `PerfTorStratum` — Core of enhanced perfect objects with amplitude[a,b].
- `PerfTorStratum.pullback` — Derived pullback preserves this stratum.
- `PerfTorStratum.colimit` — Filtered union of finite intervals is the full Perf core.
- `PerfTorStratum.homotopyCategory` — Underlying homotopy-category object is Layer 1’s perfect complex.

**Checks.**

- Over k, `k[0]` is in `[0,0]`, while `k[1]` is in `[−1,−1]` and outside `[0,0]`.
- Zero belongs to all strata; each empty-scheme core is contractible.
- A complex concentrated in degree zero need not qualify: the dual-number residue field is not perfect.
- The `[0,0]` core is exactly the finite-projective groupoid, including its automorphisms.

Maps between objects of `Perf^[a,b](A)` are `(b−a)`-truncated; consequently its core is `(b−a+1)`-truncated. Prove this from the lower cohomological bound on RHom, retaining the extra degree for automorphisms. ([BS17, Proof of Theorem 11.2(2), numbered assertion (1), PDF p.47, arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490v3)).

For perfect E over any commutative A, the residue-field complexes `E⊗ᴸκ(p)`, for all prime p, detect Tor-amplitude `[a,b]`. Perfectness is essential to this finite-presentation/Nakayama argument. ([BS17, §11, proof of Theorem11.2(2), Tor-amplitude argument](https://arxiv.org/pdf/1507.06490v3)).

For filtered ring colimits `A=colim` Aᵢ, `Perf(A)=colim` `Perf(Aᵢ)` as enhanced categories, including finite diagrams and mapping spaces. Descend a bounded projective model and use the fixed-amplitude truncation bound; Hom-set continuity alone is insufficient. ([BS17, §11, proof of Theorem11.2(2), (d)](https://arxiv.org/pdf/1507.06490v3)).

### Examples

Let `C=(O —x→ O)`, in degrees −1,0 on `A¹_k`. Its tensor square has terms O,O²,O and differentials `(x,−x)` and `(x,x)`, after ordering the degree −1 summands accordingly. The composite vanishes. Pulling C to the origin gives `k —0→ k`, with amplitude `[−1,0]` over k. The tensor square `C⊗C` has amplitude `[−2,0]`, both over `k[x]` and after derived pullback. The single object `k⊗ᴸ_{k[x]}k`, retained over `k[x]`, also has amplitude `[−2,0]` because each k-summand has projective dimension one there.

The quotient map `C→k(0)` is a global chain representative. More generally on an affine scheme the finite-projective source gives global representatives against quasicoherent targets by K-projectivity. Arbitrary sheaf targets only receive the local lifting assertion.

The projection idempotent on `O⊕O[1]` has image O. Its splitting occurs in the derived category and preserves perfectness; no second Karoubi completion changes its K₀.

For affine X, the coherator is M↦`Γ(X,M)`~, and the derived equivalence sends ℤ/n to `(ℤ/n)`~. A quotient `A→A`/I is derived scalar extension under this equivalence. The Noetherian comparison also applies to the doubled plane, even though the affine-diagonal branch does not.

On P¹, the point sheaf has model `O(−1)→O`. Every perfect object has a bounded model made from sums of line bundles. On the doubled Aⁿ, `n≥2`, the skyscraper at one origin has nonzero perfect K₀ class but zero restriction class on both affine charts; vector-bundle K₀ is ℤ whereas perfect K₀ is ℤ². This distinguishes a local strict model from a global one.

Acyclic `M —id→ M` can have arbitrarily large M; it becomes zero in every localized model. Smallness belongs to the derived category, where an affine skeleton consists of bounded complexes of summands of finite free modules. On P¹, bounded complexes of sums of `O(i)` give a small family as well.

The enhanced `[0,0]` core at a field has π₁ at k equal to k×. Its mapping spaces are discrete, but its core is not a set. Residue-field amplitude detection works over arbitrary commutative rings, and enhanced continuity descends finite diagrams as well as objects. The unit on qcqs X is compact in `D_QCoh(X)`; compactness in the category of all sheaves is not asserted.

### Dependencies

Mathlib’s module-sheaf, cochain, derived and triangulated categories; AlgebraicVectorBundles’ finite locally free, tensor and dual APIs; DGAInfinity Layer 5 for module perfectness; EnhancedDerivedSheaves E0–E1 for enhancements and its PerfectDerived subcategory; SchemeAndStackFoundations §§0.6, 0.9, 2.18 and 5.7 for Hartogs extension, finite-presentation limits, pseudo-coherent/`D_QCoh` objects, affine derived equivalence and the resolution-property predicate. The strict-model and finite-level comparisons are constructed here.

## Layer 2: Scheme K-theory and functoriality

### 2.1 Connective, nonconnective and coherent theories

Throughout the scheme K-theory constructions and their functoriality, X and Y are qcqs; every morphism is between schemes in that scope. K and 𝕂 use small models from Layer 1. G-theory in this subsection requires a Noetherian scheme. Its nonconnective extension is treated separately at the end of this layer.

Define connective `K(X)` from the perfect complicial model, and `K_naive(X)` from the exact category of finite locally free sheaves. Construct the comparison `K_naive→K`, object classes, and restriction maps. On a field `K₀=ℤ`; on the doubled affine plane the two K-theories differ. ([TT90, Definition 3.1, p. 312](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, V.2.7.3 (PDF p. 391)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Definition 3.2, p. 313](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `Scheme.K` — `K(X)` := `K(Perf(X))`, a spectrum; `Scheme.K_n X := π_n K(X)`.
- `Scheme.KOn` — `K(X on Z)` for `Z ⊂ X` closed, from perfect complexes acyclic on `X ∖ Z`.
- `Scheme.Knaive` — `K^naive(X)`: K-theory of strictly perfect complexes, ≃ Quillen K of Vect(X) (TT 3.10).
- `Scheme.Knaive_to_K` — The map `K^naive(X) → K(X)` induced by the inclusion.
- `Scheme.K.class` — For `E ∈ Perf(X)`, its class `[E] ∈ K_0(X)`; `[E] = [E′] + [E″]` for a cofibration sequence and `[E] = [E′]` for a quasi-isomorphism (TT 1.5.6).
- `Scheme.K.pullback` — `f*`: `K(Y) → K(X)` for every morphism f of qcqs schemes (Layer 2).
- `Scheme.K.pushforward` — `f_*`: `K(X) → K(Y)` in exactly the proper perfect or perfect-projective/flat-proper-finitely-presented scopes of §2.3.
- `Scheme.K.affineEquiv` — `K(Spec A) ≃ K(A)` (Layer 2).
- `Scheme.K.zero_eq_triangulatedK0` — `K_0(X) ≅ TriangulatedK0(D_perf(O_X))` (Layer 2).
- `Scheme.K.nonconnective` — `𝕂(X)` with `π_n 𝕂(X) = K_n(X)` for `n ≥ 0` (Layer 2).

**Checks.**

- At `Spec F`, π₀ is ℤ and a perfect complex maps to its alternating cohomology dimension.
- The empty spectrum is contractible.
- For affine A, `[P~]` maps to the finite-projective class `[P]`.
- On A¹, `[k(0)]=[O]−[O]=0`.
- On the doubled plane perfect K-theory is `K(k)×K(k)`, while the vector-bundle theory is `K(k)`; the skyscraper at one origin distinguishes them.
- On `X=⨿_{n≥0}Spec k`, the object restricting to `k[n]` on the nth component is locally perfect but has no global finite Tor interval. This non-quasi-compact X is outside the scheme K-model scope.

Complicial exact functors inducing equivalences of the derived homotopy categories give equivalences of connective K-spectra under the approximation hypotheses. Apply this to the chosen perfect and G-models and to universe changes. ([TT90, Lemma 3.5, p. 314](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 1.9.8, p. 271](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.3.9 (PDF p. 400)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Identify `π₀K(X)` with Tau Ceti's triangulated K₀ of `D_perf(X)`, naturally in derived pullback. A strict representative has class `Σᵢ(−1)ⁱ[Eⁱ]`. The triangle relation and shift signs are supplied by the existing categorical K₀ API. ([Stacks.perfect, Derived Categories of Schemes, Definition 38.2 (tag 0FDG)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, 3.1.1, p. 313](https://gwern.net/doc/math/1990-thomason.pdf)).

For qcqs X define nonconnective `𝕂(X)` as Schlichting's IK of the perfect Frobenius pair. Its connective-cover map is an isomorphism on all nonnegative groups. Negative groups use this model until the Bass comparison in Layer 5; they are not defined circularly by that comparison. ([Schlichting, 5.10, p. 13](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf); [Schlichting, Theorem 7.1, p. 14](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)).

Expose the following interface:

- `Scheme.KB` — `𝕂(X)` := IK of the Frobenius pair of perfect complexes.
- `Scheme.K_to_KB` — The natural map `K(X) → 𝕂(X)`.
- `Scheme.K_to_KB_iso` — `π_n K(X) → π_n 𝕂(X)` is an isomorphism for `n ≥ 0`.
- `Scheme.KB_neg_eq_thomason` — The downstream theorem Layer 5 supplies this equality; it is not an axiom of Scheme.KB.
- `Scheme.KB_affine` — `𝕂(Spec A)` has negative homotopy Bass's `K_n(A)` (GeneralAlgebraicKTheory §§11.14 and 12.11).
- `Scheme.KB_neg_eq_zero_of_regular` — By Layer 2 and nonconnective Cartan comparison, negative groups vanish for regular Noetherian X.

**Checks.**

- For every affine A the zeroth group is the usual `K₀(A)`, and the empty-scheme spectrum vanishes.
- The regular ring ℤ has `K₋₁=0`.
- For the nodal ring `k[x,y]/(y²−x²−x³)`, char `k≠2`, normalization `x=t²−1,y=tx` gives `K₋₁≅coker(ℤ²→ℤ²)≅ℤ` through the two branches. Negative vanishing therefore needs regularity.

For Noetherian X define `G(X)=K(Coh X)`, equivalently K of cohomologically bounded pseudo-coherent complexes. Give object classes, proper pushforward, finite-Tor pullback and `G₀≃ExactK₀(Coh X)`. On `k[ε]/ε²` the structure sheaf has class `2[k]`. ([Weibel, Definition IV.6.3.4 (PDF p. 328)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Definition 3.3, p. 313](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `Scheme.G` — `G(X)` := `K(Coh(X))` for noetherian X; `Scheme.G_n X := π_n G(X)`.
- `Scheme.G.class` — The class `[F] ∈ G_0(X)` of a coherent sheaf, additive on short exact sequences.
- `Scheme.G.equivPsCoh` — `G(X) ≃ K(PsCoh^b(X)) ≃ K(Ch^b Coh X)` (Layer 2).
- `Scheme.G.pushforward` — `f_*`: `G(X) → G(Y)` for proper f (Layer 2).
- `Scheme.G.pullback` — `f*`: `G(Y) → G(X)` for f of finite Tor-dimension (Layer 2).
- `Scheme.G.affineEquiv` — `G(Spec R) ≃ G(R) := K(mod R)` for R noetherian (Layer 2).
- `Scheme.G.zero_eq_exactK0` — `G_0(X)` ≅ Tau Ceti's ExactK0 of `Coh(X)` with its abelian exact structure (GeneralAlgebraicKTheory §3.14 identifies `π_1 BQ` with ExactK0).

**Checks.**

- For a field the coherent group is dimension ℤ, and the empty scheme contributes zero.
- Over Noetherian R, `[M~]` corresponds to the existing exact Grothendieck class of M.
- For dual numbers, the ε-filtration gives `[O]=2[k]` in `G₀≅ℤ[k]`.
- Although K₀ and G₀ are both abstractly ℤ there, their Cartan homomorphism is multiplication by two.

Compare bounded coherent, bounded pseudo-coherent, bounded-above flat and bounded-below flasque G-models. Local pseudo-coherence does not produce a global vector-bundle resolution. Use the bounded-below flasque model for direct image; arbitrary unbounded deployment requires its separate theorem. ([TT90, Corollary 3.13, p. 317](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Example V.3.10.2 (PDF p. 402)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 2.2 Derived pullback and its spectrum maps

Construct a complicial exact model of Lf* on bounded-above flat perfect complexes for every morphism f of qcqs schemes. Expose identity/composition weak equivalences, its derived realization, restrictions and inverse-image supports. ([TT90, 3.14, pp. 317–318](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `perfPullback` — `f*` : `Perf^flat(Y) → Perf^flat(X)`, degreewise pullback.
- `perfPullback.isComplicialExact` — It is a complicial exact functor (preserves cofibrations, weak equivalences, pushouts along cofibrations).
- `perfPullback.represents` — It represents Lf* : `D_perf(O_Y) → D_perf(O_X)`.
- `perfPullback.comp` — `f*∘g* ≅ (g∘f)*` naturally, with pseudofunctor coherence.
- `perfPullback.id` — `id* ≅ id`.
- `perfPullback.supports` — `f*` maps complexes acyclic off Z to complexes acyclic off `f^{-1}(Z)`.
- `perfPullback.strict` — On strictly perfect complexes it is the degreewise pullback of vector bundles.

**Checks.**

- An open immersion recovers degreewise restriction on a flat model.
- Pulling the x-resolution back to the origin gives `k —0→ k`, with `H⁻¹=H⁰=k`.
- Identity pullback is naturally the identity.
- Pulling back the skyscraper underived gives only `k[0]`, losing its other derived summand.

Derived pullback gives contravariant maps `K(X)→K(X′)` and 𝕂-maps for arbitrary f:`X′→X` between qcqs schemes. Require coherent identity/composition homotopies and `f*[E]=[Lf*E]`, the affine scalar-extension formula and the naive-bundle comparison. ([TT90, 3.14, pp. 317–318](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 1.5.4, pp. 260–261](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `Scheme.K.pullback` — `f*` : `K(Y) → K(X)` for every morphism f : `X → Y` between qcqs schemes.
- `Scheme.K.pullback_comp` — `(g∘f)* ≃ f*∘g*` (homotopy of spectrum maps; equality on `K_n`).
- `Scheme.K.pullback_id` — `id* ≃ id`.
- `Scheme.K.pullback_class` — On `K_0`, `f*[E] = [Lf*E]`; for a vector bundle V, `f*[V] = [f*V]`.
- `Scheme.K.pullback_supports` — `f*`: `K(Y on Z) → K(X on f^{-1}Z)` compatibly with `K(Y on Z) → K(Y)`.
- `Scheme.K.pullback_affine` — For `Spec B → Spec A` it is scalar extension `K(A) → K(B)` (Layer 2).
- `Scheme.Knaive.pullback` — The same on `K^naive`, compatibly with `K^naive → K`.

**Checks.**

- Pullback preserves `[O]` and identity maps.
- On affines it is extension of scalars on finite projectives.
- The origin pulls `[k(0)]` back to `[k]−[k]=0`.
- Pullback from dual numbers to k exists on K, although it cannot give a bounded-coherent pullback on G.

For finite-Tor morphisms of Noetherian schemes, Lf* preserves bounded pseudo-coherence and gives G-pullback. Flat pullback is underived on coherent sheaves; otherwise its G₀ formula is the finite alternating Tor sum. No G-pullback is asserted for the residue map of dual numbers. ([TT90, 3.14.1, p. 318](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Base change maps for G∗(X) V.3.6 (PDF p. 397)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `Scheme.G.pullback` — `f*` : `G(Y) → G(X)` for f of finite Tor-dimension between noetherian schemes.
- `Scheme.G.pullback_comp` — `(g∘f)* ≃ f*∘g*`.
- `Scheme.G.pullback_flat_class` — For f flat and F coherent, `f*[F] = [f*F]`.
- `Scheme.G.pullback_class` — `f*[F] = Σ(−1)^i` [`L_if*F`] in `G_0(X)`.
- `Scheme.G.pullback_cartan` — Commutes with the Cartan map: `c_X∘f* ≃ f*∘c_Y` (Layer 2).

**Checks.**

- Open restriction kills the class supported at the removed origin.
- Identity pullback fixes G, and flat pullback agrees with the exact coherent-sheaf functor.
- For the dual-number closed point, `Lι*k` has cohomology k in every nonpositive degree; the putative coherent Euler sum is not finite.

### 2.3 Proper images and transfers

The coherent assertions use locally Noetherian schemes and proper maps on the relevant coherent support. The K-transfer requires a proper perfect morphism, meaning pseudo-coherent and of finite Tor-dimension, with the bounded cohomological-dimension hypotheses stated below.

Use SchemeAndStackFoundations §2.18’s total direct image on `D_QCoh`, its coproduct compatibility and the cohomological bounds supplied by §2.6. Compare its computation on the bounded-below injective/flasque models used here, and prove that the resulting complicial functor and composition transformations realize that supplied derived functor. In the quasi-compact-target scope retain a uniform bound after the specified base changes; on affine morphisms quasicoherent direct image is exact. ([Stacks.perfect, Derived Categories of Schemes, Lemma 4.1(1) (tag 08D5)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 4.1(2) (tag 08D5)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 4.5 (tag 08DZ)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Define `coherentPushforward_modelComparison`: for proper f of Noetherian schemes, identify the bounded-below flasque realization of `Rf_*` with the supplied enhanced pushforward, naturally under composition. Its coherent preservation is supplied by JacobianChallenge Layer C and EnhancedDerivedSheaves E2.8. The extension with proper coherent supports uses the E1.9 supplier contract. ([Stacks.perfect, Derived Categories of Schemes, Lemma 11.3 (tag 08E2)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Derived Categories of Schemes, Remark 38.7 (tag 0FDL)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Define `perfectPushforward_modelComparison` for proper perfect maps of Noetherian schemes: the strict/flasque model realizes the perfect enhanced pushforward, using the finite-relative-Tor preservation contract. Extend this comparison to perfect projective maps over arbitrary qcqs bases by the projective approximation of §2.7. For flat proper finitely presented maps use the supplied arbitrary-base preservation theorem. The new assertions identify the K-theory models and their composition transformations. ([TT90, Theorem 2.5.4, p. 304](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 27.1 (tag 08EV)](https://stacks.math.columbia.edu/download/perfect.pdf)).

For proper f of Noetherian schemes, degreewise `f_*` on bounded-below flasque G-models induces `f_*`:`G(X)→G(Y)`. Godement replacement gives the same transfer. On G₀ it sends `[F]` to `Σ_q(−1)^q`[`R^qf_*F`]. ([TT90, 3.16.1, p. 319](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Proposition V.3.7 (PDF p. 397)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Stacks.perfect, Derived Categories of Schemes, Remark 38.7 (tag 0FDL)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Expose the following interface:

- `Scheme.G.pushforward` — `f_*` : `G(X) → G(Y)` for f proper between noetherian schemes.
- `Scheme.G.pushforward_class` — `f_*[F] = Σ(−1)^i` [`R^if_*F`] in `G_0(Y)`.
- `Scheme.G.pushforward_closedImmersion` — For a closed immersion i, `i_*[F] = [i_*F]`.
- `Scheme.G.pushforward_finite` — For finite f, `f_*` is induced by the exact functor `f_*` : `Coh(X) → Coh(Y)` (restriction of scalars on affines).
- `Scheme.G.pushforward_comp` — `(g∘f)_* ≃ g_*∘f_*` (Layer 2).
- `Scheme.G.pushforward_godement` — `f_*` is induced by `Rf_* = f_*∘T` on the pseudo-coherent model (K-book V.3.11.1).

**Checks.**

- For `p:P¹_k→Spec k`, `p_*[O(n)]=n+1` for all integers n; in particular the answers for −1 and −2 are 0 and −1.
- Identity pushforward fixes classes, while finite affine pushforward is restriction of scalars.
- A closed point of residue degree e on a proper curve pushes to e over k.
- The open `A¹→P¹` has noncoherent direct image of O and does not admit this proper-transfer construction.

For proper perfect f of Noetherian schemes, restrict bounded-below flasque direct image to perfect objects to obtain K-pushforward; also include perfect projective and flat proper finitely presented maps of qcqs schemes. Expose supports, `[E]`↦[`Rf_*E`], affine transfers and Cartan compatibility. ([TT90, 3.16.4, p. 320](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Proposition V.3.7.1 (PDF p. 397)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `Scheme.K.pushforward` — `f_*`: `K(X) → K(Y)` in exactly the proper perfect or perfect-projective/flat-proper-finitely-presented scopes of §2.3.
- `Scheme.K.pushforward_class` — `f_*[E] = [Rf_*E]` in `K_0(Y)`.
- `Scheme.K.pushforward_comp` — `(g∘f)_* ≃ g_*∘f_*` (Layer 2).
- `Scheme.K.pushforward_cartan` — `c_Y∘f_* ≃ f_*∘c_X` with the G-pushforward (Layer 2).
- `Scheme.K.pushforward_affine` — For `Spec B → Spec A` finite with B perfect over A, `f_*` is the restriction-of-scalars transfer (Layer 2).
- `Scheme.K.pushforward_supports` — The analogous maps `K(X on Z) → K(Y on f(Z))` (TT 3.16.7).

**Checks.**

- The P¹ Euler values agree with G-theory and identity transfer is the identity.
- A finite projective algebra has the finite-projective module transfer; `ℤ[i]`/ℤ sends `[O]` to 2.
- The dual-number closed point is proper but not perfect, so its residue field cannot be pushed into perfect K-theory.
- For `R=∏ℕk` and `I=⊕ℕk`, `Spec(R/I)→Spec` R is proper and flat but R/I is not finitely presented. Proper flat without pseudo-coherence does not suffice.

Construct coherent composition and identity homotopies for the K/G pushforwards. Work in the bounded-below flasque deployment models and compare their composite with R(gf)`_*`; do not use unbounded termwise acyclicity without deployment. ([TT90, 3.16.1, note, p. 319](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, V.3.11 (PDF p. 403)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 2.4 Base change and projection formulas

Use qcqs morphisms for derived quasicoherent pushforward, and Noetherian schemes for G-theory. In a cartesian square f:`X→Y`, g:`Y′→Y`, f′:`X′→Y′`, g′:`X′→X`, the base-change map is Lg*`Rf_*`→Rf′`_*`Lg′*. Tor independence is required in the coherent/perfect transfer comparison.

Promote Tor-independent derived base change to homotopies of G-transfers for proper Noetherian f and finite-`Tor g`, and of K-transfers for proper perfect f and arbitrary g in such squares, requiring both f and f′ to lie in one of the transfer scopes of §2.3. The f′ condition holds if all four schemes are Noetherian, if f is perfect projective, or if f is flat proper finitely presented. Deploy the input simultaneously for `f*` and `g′*`, with flat and flasque comparison models. ([TT90, Proposition 3.18 and its bideployed-model proof, pp.321–322 (PDF pp.75–76)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Base change Theorem V.3.7.2 (PDF p. 398)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Realize SchemeAndStackFoundations §2.18’s projection isomorphism `Rf_*E⊗ᴸF≃Rf_*(E⊗ᴸLf*F)`, for qcqs f and quasicoherent derived E,F, on the flat/flasque models used for K-theory. The new target is a natural weak-equivalence transformation compatible with the tensor pairings and composition, hence inducing the spectrum homotopy of §2.4. The ordinary derived projection formula is supplied. ([Stacks.perfect, Derived Categories of Schemes, Lemma 22.1 (tag 08EU)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Theorem 2.5.5, p. 304](https://gwern.net/doc/math/1990-thomason.pdf)).

Derived tensor gives `K∧K→K` and, on Noetherian X, `K∧G→G`. Construct these using flat perfect models, with unit `O_X`, associativity and affine comparisons. On π₀ use derived tensor, which can differ from underived tensor on coherent sheaves. ([TT90, 3.15, p. 318](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Derived Categories of Schemes, Remark 38.6 (tag 0FDK)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Expose the following interface:

- `Scheme.K.mulPairing` — `K(X) ∧ K(X) → K(X)` from the biexact tensor product on flat perfect complexes.
- `Scheme.G.modulePairing` — `K(X) ∧ G(X) → G(X)` for noetherian X.
- `Scheme.K.mul_class` — `[E]·[F] = [E ⊗^L F]` in `K_0(X)`.
- `Scheme.G.smul_class` — `[E]·[F] = [E ⊗^L F]` in `G_0(X)` for E perfect, F coherent.
- `Scheme.K.one_mul` — `[O_X]·x = x` on `K_*(X)` and on `G_*(X)`.
- `Scheme.K.mulPairing_pullback` — `f*` is multiplicative on `K_0`: `f*(x·y) = f*x·f*y`; in higher degrees this is Layer 6's.
- `Scheme.K.mulPairing_affine` — On `Spec A` the `K_0` product is the tensor product of projective modules (GeneralAlgebraicKTheory §7.6).

**Checks.**

- The O-class acts as the unit; on P¹, `[O(1)]²=[O(2)]` and `(1−[O(−1)])²=0`.
- On affines, the product is `[P⊗_AQ]`.
- Tensoring the x-resolution with `k(0)` produces `k⊕k[1]`, of Euler class zero.
- Underived tensor on arbitrary perfect representatives fails: it sends the quasi-isomorphism from that resolution to `k(0)` to a map `k⊕k[1]→k` which is not a quasi-isomorphism.
- Let V/k be smooth proper and nonprojective, and let `f:V→Spec k[t]` factor through `t=0`. Base change to `k[t,z₁,z₂,…]` is flat and Tor-independent, but f′ is neither flat nor projective and its target is non-Noetherian. It is outside the transfer scopes of §2.3.

For every defined proper transfer, `f_*(x·f*y)=f_*x·y` in all applicable K/G degrees. The spectrum homotopy comes from the projection isomorphism and the weak-equivalence naturality of biexact pairings. ([TT90, Proposition 3.17, p. 320](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Projection Formula V.3.12 (PDF p. 403)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 38.8 (tag 0FDM)](https://stacks.math.columbia.edu/download/perfect.pdf)).

### 2.5 Affine and vector-bundle comparisons

Identify `K(Spec A)` with `K(A)` for every commutative ring A, and `G(Spec A)` with `G(A)` for Noetherian A. Compare the actual functors, object classes and maps, then extend the perfect comparison nonconnectively. ([Stacks.perfect, Derived Categories of Schemes, Lemma 38.3 (tag 0FDH)](https://stacks.math.columbia.edu/download/perfect.pdf); [Weibel, Example V.2.7.2 (PDF p. 391)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise II.9.10(a) (PDF p. 180)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Under the affine comparison, pullback along `A→B` is `B⊗ᴸ_A−`. In degree zero of K use scalar extension of finite projectives; in G require finite Tor-dimension and take the alternating Tor sum unless B is flat. ([Stacks.perfect, Derived Categories of Schemes, Lemma 3.8(2) (tag 08DW)](https://stacks.math.columbia.edu/download/perfect.pdf); [Weibel, Base change maps for G∗(R) V.3.5 (PDF p. 395)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finite B/A, affine G-transfer is restriction of scalars when A,B are Noetherian. K-transfer exists if B is finite projective over A, or admits a finite projective resolution in the Noetherian setting. Its resolving `H(A)` category is not homotopy K-theory KH(A). ([Weibel, Transfer Maps for K∗(R) V.3.3.2 (PDF p. 394)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Remark after Base change maps V.3.5 (book p.388, PDF p.396)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 3.7 (tag 0DJK)](https://stacks.math.columbia.edu/download/perfect.pdf)).

On qcqs X with the resolution property, `K_naive(X)→K(X)` is an equivalence, including supported strict models. In particular apply it to ample-family schemes. Regularity alone does not impose the needed global resolution property. ([Stacks.perfect, Derived Categories of Schemes, Lemma 38.5 (tag 0FDJ)](https://stacks.math.columbia.edu/download/perfect.pdf); [Totaro.2004, §2, p. 4](https://arxiv.org/pdf/math/0207210); [Weibel, V.2.7.3 (PDF p. 391)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 2.6 Cartan comparison and compact objects

For Noetherian X, inclusion of perfect into bounded pseudo-coherent complexes defines the Cartan map `K→G`, K-linear and compatible with finite-Tor pullback and proper perfect transfer. On π₀, `c[E]=Σ_i(−1)^i[HⁱE]`. ([Stacks.perfect, Derived Categories of Schemes, discussion before Lemma 38.4](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Theorem 3.21, p. 328](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `Scheme.cartan` — `c_X : K(X) → G(X)` for noetherian X.
- `Scheme.cartan_class` — `c_X[E] = Σ(−1)^i` `[H^i(E)]` in `G_0(X)`.
- `Scheme.cartan_class_vectorBundle` — `c_X[V] = [V]` for a finite locally free module V.
- `Scheme.cartan_pullback` — `c_X∘f* ≃ f*∘c_Y` for f of finite Tor-dimension.
- `Scheme.cartan_pushforward` — `c_Y∘f_* ≃ f_*∘c_X` for f proper perfect.
- `Scheme.cartan_linear` — `c_X(x·y) = x·c_X(y)` for x, `y ∈ K_*(X)`.
- `Scheme.cartan_affine` — For `X = Spec` R, `π_0 c_X` is Tau Ceti's cartanMap R (Layer 2).
- `Scheme.cartan_isEquiv_of_regular` — `c_X` is an equivalence for regular noetherian X (Layer 2).

**Checks.**

- Over a field the Cartan map is `id_ℤ`, and for the empty scheme it is the map of zero spectra.
- On dual numbers it sends 1 to 2 in the basis `[k]`, so `[k]` is outside its image.
- Under both affine π₀ comparisons it is precisely TauCeti.cartanMap, with its existing exact structures.

If all local rings of Noetherian X are regular, every bounded coherent object is perfect. The proof is local finite projective dimension of finitely presented modules, followed by a finite affine cover; X need not have finite Krull dimension or be separated. ([TT90, Theorem 3.21, proof, p. 328](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 11.8 (tag 0FDC)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.more-algebra, More on Algebra, Lemma 76.14 (tag 066Z)](https://stacks.math.columbia.edu/download/more-algebra.pdf)).

For regular Noetherian X, Cartan is an equivalence, also nonconnectively, and negative K vanishes. More generally use the local finite-Tor condition on finitely presented modules in the bounded pseudo-coherent model. Negative vanishing comes from negative G, independent of Bass. ([TT90, Theorem 3.21, p. 328](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Derived Categories of Schemes, Lemma 38.4 (tag 0FDI)](https://stacks.math.columbia.edu/download/perfect.pdf); [Weibel, Theorem V.3.4 (PDF p. 395)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

On affine Noetherian X, identify π₀ of the scheme Cartan map with TauCeti.cartanMap. When finite projective resolutions exist, its inverse is TauCeti.cartanEquiv. This comparison imports the existing maps and proves equality; it does not construct another categorical Cartan map. ([Stacks.perfect, Derived Categories of Schemes, Lemma 38.3 (tag 0FDH)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.more-algebra, More on Algebra, Lemma 76.14 (tag 066Z)](https://stacks.math.columbia.edu/download/more-algebra.pdf)).

For `A=k[ε]`/ε², identify `K₀(A)=ℤ[A]` and `G₀(A)=ℤ[k]`. Scheme Cartan is multiplication by 2 in every characteristic, so `[k]` is outside its image. Use the existing module calculation through the affine comparison. ([TT90, Theorem 3.21, p. 328](https://gwern.net/doc/math/1990-thomason.pdf); [Totaro.2004, §2, p. 4](https://arxiv.org/pdf/math/0207210)).

Prove `perfModel_compactComparison`: for qcqs X, the strict/complicial realization of §1.5 identifies its objects with the compact subcategory of the supplied `D_QCoh(X)`, compatibly with the affine tilde model. The underlying perfect/compact characterization comes from the supplier contracts; the target here is its compatibility with the chosen K-model, not a second compact-generation theorem. Compactness in D of all sheaves is not asserted. ([Stacks.perfect, Derived Categories of Schemes, Proposition 17.1 (tag 09M1)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.more-algebra, More on Algebra, Proposition 80.3 (tag 07LT)](https://stacks.math.columbia.edu/download/more-algebra.pdf); [Stacks.cohomology, Cohomology of Sheaves, Lemma 50.5 (tag 08DQ)](https://stacks.math.columbia.edu/download/cohomology.pdf); [TT90, 2.4.4, p. 302](https://gwern.net/doc/math/1990-thomason.pdf)).

### 2.7 Continuity and proper-support approximation

K and 𝕂 with descended supports commute with qcqs inverse limits along affine transitions. Descend finite diagrams and quasi-isomorphisms of perfect models. Use filtered-colimit compatibility of Schlichting IK for negative degrees, without assuming the scheme Bass theorem. ([TT90, 3.20.2, p. 324](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proof of 3.20, p. 324](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 7.2 (Continuity), p. 364](https://gwern.net/doc/math/1990-thomason.pdf); [Schlichting, Lemma 6.3, p. 13](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)).

Construct `coherentProperSupport_modelComparison` for locally finite-type, quasi-separated f into Noetherian Y and bounded coherent E whose cohomology sheaves have proper support over Y. Identify the chosen flasque K-model with the supplied enhanced pushforward by closed proper-support factorization, compatibly with enlarging the support. This is a model comparison, extending §2.3 to a possibly non-quasi-compact ambient X; coherent preservation is part of the E1.9 supplier contract. ([Stacks, Tags0CYS,08DS,08E2](https://stacks.math.columbia.edu)).

For projective perfect f over an arbitrary qcqs base, embed X in `Pⁿ_Y`, descend the finite-presentation data and the perfect complex `Ri_*E` to a Noetherian approximation, and recover `Rf_*E` by Tor-independent base change. This supplies the projective case of the K-transfer. Import `noetherian_approximation` and `finite_presentation_limits` from SchemeAndStackFoundations §0.9 and combine them with the perfect finite-diagram descent of Layer 1. Descend the perfect complex on projective space, whose structural map is flat, rather than require flat transition maps in the approximation. ([Stacks, Proposition 32.5.4, Tag 01ZA](https://stacks.math.columbia.edu/tag/01ZA); [Stacks, Lemma 32.10.1, Tag 01ZM](https://stacks.math.columbia.edu/tag/01ZM)). ([TT90, 2.7(a),3.20.1, printed310–312,324–328](https://gwern.net/doc/math/1990-thomason.pdf)).

Nonconnective G of a Noetherian scheme has zero negative groups, using Schlichting's theorem for Noetherian abelian categories and the bounded coherent comparison. Require neither finite Krull dimension nor finite global dimension. ([Schlichting, Theorem 9.3 and Example 9.6, pp. 16–17](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)).

### Examples

For `p:P¹_k→Spec k`, `Rp_*O=k[0]` and `Rp_*O(−2)=k[−1]`. Thus pushforward of `O(n)` has Euler value `n+1`, including negative n. The uniform pushforward bound for Pⁿ is `N=n+1` in the convention `Hⁱ=0` for `i≥N`; an affine morphism has `N=1`.

Let `A=k⊕V` with `V=⊕_{n≥0}ke_n` square-zero. The complex `A —e₀→ A` is strict perfect even though `H⁻¹=V` is not finite type. Identity pushforward preserves it. A projective perfect pushforward theorem cannot require coherence of its cohomology over a noncoherent base.

Restriction to an open commutes with proper pushforward, as does passage to the generic fibre of an arithmetic surface in the Tor-independent square. Taking the tensor factor O gives the identity case of the projection formula; for an affine morphism it is the restriction-of-scalars tensor identity.

For p:`P¹→Spec` k and `y∈Kₙ(k)`, `p_*(p*y)=y`. For a degree-d isogeny f of elliptic curves, `f_*f*y=[f_*O]·y`; the coefficient has `rank d` but need not equal d as a K₀ class.

The finite extension `ℤ[i]`/ℤ sends the unit class to 2. For a finite field extension, transfer on K₁ is the norm, while pullback is the inclusion on units. The map `ℤ→ℤ`/p preserves the rank generator.

For a Dedekind domain, affine K₀ is `ℤ⊕Pic`. On regular connected curves, Cartan identifies this with coherent G₀. On dual numbers Cartan is ×2 and fails to be surjective; equality of the two abstract group isomorphism types does not remedy this.

The dual-number residue field is not compact: maps from it to `⊕_{n≥0}k[n]`, which is degreewise also the product, give `∏_{n≥0}Extⁿ(k,k)=∏k` rather than `⊕k`. The unit and all perfect objects pass the compactness test.

For countably many disjoint affine lines, the origin sheaf on one component has proper support over k and pushes to `k[0]`, despite the ambient morphism being non-quasi-compact. This tests the separate proper-support target.

Filtered affine presentations recover `Kₙ(colim A_i)=colim` `Kₙ(A_i)`. Absolute Noetherian approximation presents qcqs X over ℤ as a limit of finite-type schemes with affine transitions, so its K-groups are computed from those stages. Negative G vanishes for every Noetherian scheme; the regular-scheme consequence imposes no extra uniform dimension bound.

### Dependencies

Layer 1; GeneralAlgebraicKTheory Layers 3, 5–7 and 11–13; GrothendieckEulerForms’ existing K₀ and Cartan maps; GeneralAlgebraicKTheory §§3.1–3.2 and 3.14; AlgebraicVectorBundles L0B; EnhancedDerivedSheaves E1; SchemeAndStackFoundations §§0.9 and 2.18 for Noetherian approximation, projection and Tor-independent base change; JacobianChallenge Layer C for ordinary proper coherence and EnhancedDerivedSheaves E1.9/E2.8 for its enhanced proper-support and perfect-preservation contracts. This layer constructs their K/G-model comparisons and the perfect-projective approximation application.

## Layer 3: Localisation, residues and Witt supports

### 3.1 Supported categories and spectra

Throughout the ordinary-scheme support theorems, X is qcqs and each closed support has quasi-compact open complement. The definition as a thick subcategory still makes sense on any scheme, but a uniform globally bounded strict model need not represent every perfect object there.

For a closed subset `Z⊂X`, `Perf_Z(X)` consists of perfect E whose restriction to `X∖Z` vanishes. It is thick, depends only on the subset, is monotone in Z, and satisfies `Perf_Z∩Perf_W=Perf_{Z∩W}`. Derived pullback takes support to its inverse image, and tensor intersects supports. On qcqs X use the supported Frobenius and Waldhausen models. ([TT90, Definition 3.1 (p. 313)](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.perfect, Remark 38.9 (tag 0FDN)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Definition 6.1 (tag 08DA)](https://stacks.math.columbia.edu/download/perfect.pdf)).

Expose the following interface:

- `PerfSupport` — `PerfSupport X Z : ObjectProperty (D_perf X), E ↦ (E|_{X∖Z} ≅ 0)`.
- `PerfSupport.isTriangulated` — PerfSupport X Z is a triangulated subcategory closed under isomorphisms.
- `PerfSupport.isClosedUnderRetracts` — Direct summands of objects of `Perf_Z(X)` lie in `Perf_Z(X)`.
- `PerfSupport.mem_iff_support` — `E ∈ Perf_Z(X)` iff Supp `H^i(E) ⊆ Z` for all `i ∈ ℤ`.
- `PerfSupport.mono` — `Z ⊆ Z'` implies `Perf_Z(X) ≤ Perf_{Z'}(X)`.
- `PerfSupport.inf` — `Perf_Z(X)` ⊓ `Perf_W(X) = Perf_{Z∩W}(X)`.
- `PerfSupport.univ` — `Perf_X(X) = D_perf(O_X)`.
- `PerfSupport.empty` — `E ∈ Perf_∅(X)` iff `E ≅ 0`.
- `PerfSupport.pullback` — For f: `X' → X`, `Lf^*` maps `Perf_Z(X)` into `Perf_{f^{-1}Z}(X')`; restriction to an open V maps `Perf_Z(X)` into `Perf_{Z∩V}(V)`.
- `PerfSupport.tensor` — `E ∈ Perf_Z(X)`, `F ∈ Perf_W(X)` imply `E ⊗^L F ∈ Perf_{Z∩W}(X)` (Layer 1).
- `PerfSupport.affine_iff` — On `X = Spec` A with `Z = V(I)`, `E = M`~ lies in `Perf_Z(X)` iff every `H^i(M)` has Module.support inside `V(I)` (Layer 1).
- `PerfSupport.cone_mem` — For `s ∈ Γ(X, O_X)`, `cone(s: O_X → O_X) ∈ Perf_{V(s)}(X)`.

**Checks.**

- Full support admits every perfect object; empty support admits only zero objects.
- At `Spec ℤ_(p)`, `Cone(p)` is supported at the closed point, whereas O is not.
- On dual numbers, the residue field has full cohomological support but fails perfectness.
- Affinely `Cone(a)` is supported on `V(a)`, and the cohomology module A/a has exactly that module support.

For qcqs X with quasi-compact complement of Z, define `𝕂(X on Z)` from the supported Frobenius pair. Construct enlargement, pullback and tensor pairings into intersected supports. It is the fibre spectrum, agrees with connective supported K in nonnegative degrees, is zero for empty support and equals `𝕂(X)` for full support. Layer 5 proves the Bass comparison. ([TT90, Definition 3.1 (p. 313)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Definition V.7.6.3 (PDF p. 434)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, 3.15 (pp. 318-319)](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `supportKTheory` — `K(X on Z)`, a spectrum; `K_n(X on Z) := π_n K(X on Z)`, `n ∈ ℤ`.
- `supportKTheory.toK` — The map `K(X on Z) → K(X)` induced by `Perf_Z(X) ⊆ Perf(X)`.
- `supportKTheory.class` — For `E ∈ Perf_Z(X)`, `[E] ∈ K_0(X on Z)`, additive in distinguished triangles and `[E[1]]` = `−[E]`.
- `supportKTheory.univ` — `K(X on X) ≃ K(X)` compatibly with toK.
- `supportKTheory.empty` — `K(X on ∅) ≃ 0`.
- `supportKTheory.pullback` — `f^*: K(X on Z) → K(X' on Z')` for `f^{-1}(Z) ⊆ Z'`, with `id^* = id` and `(fg)^* ≃ g^* f^*`.
- `supportKTheory.enlarge` — For `Z ⊆ Z'`, `K(X on Z) → K(X on Z')` compatible with toK and with pullback.
- `supportKTheory.pairing` — `K(X on Z) ∧ K(X on W) → K(X on Z ∩ W)`, associative and commutative up to coherent homotopy (TT 3.15.4); `K(X on Z)` is a `K(X)`-module spectrum.
- `supportKTheory.pushforward` — For f: `X' → X` proper and perfect between noetherian schemes with `f(Z') ⊆ Z`, `Rf_*` induces `K(X' on Z') → K(X on Z)` (TT 3.16.7; Layer 2).
- `supportKTheory.connective_comparison` — For `n ≥ 0`, `K_n(X on Z)` equals the Waldhausen `K_n` of TT's category of perfect complexes acyclic off Z.

**Checks.**

- Empty support gives zero in every integer degree; full support gives absolute K.
- At a DVR, `[Cone(πⁿ)]` maps to n in supported `K₀≅ℤ`.
- On A¹ the support `V(x²)` has the same theory as the reduced origin, including `K₁=k×`. It is not `K(k[x]/x²)`, whose K₁ has extra nilpotent units.
- On an affine principal support compare with the ring support theory for `{1,s,s²,…}`.

### 3.2 Extension and localization of perfect objects

Let j:`U→X` be a quasi-compact open immersion of qcqs schemes, `Y=X∖U`, and T,Z closed subsets with quasi-compact complements. These hypotheses govern all the extension and quotient assertions below.

On affine X and quasi-compact `U⊂X`, a perfect F on U extends after adding a shifted vector bundle; `F⊕F[1]` extends without that choice. With support in `T∩U`, where `X∖T` is quasi-compact, `F⊕F[1]` extends with support in T. Prove these finite-complex extension assertions before localization. ([Stacks.perfect, Lemma 36.13.6 (tag 08EG)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Lemma 36.13.8 (tag 08EI)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Lemma 36.13.10 (tag 08EK)](https://stacks.math.columbia.edu/download/perfect.pdf)).

On affine X, let E,E′ belong to `D_QCoh(X)` with E perfect. Maps E|`U→E′`|U lift as roofs E←`E₁→E′`, with E₁ perfect and the left map invertible on U; one can take `E₁=E⊗ᴸI` for perfect I. On qcqs X, maps in `D_QCoh(X)` from a perfect object to an object supported on `V(f)` are killed by some fⁿ. ([Stacks.perfect, Lemma 36.13.7 (tag 08EH)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Lemma 36.13.9 (tag 08EJ)](https://stacks.math.columbia.edu/download/perfect.pdf)).

For qcqs X, quasi-compact U and T with quasi-compact complement, let `E∈D_QCoh(X)`. A map `P→E`|U from perfect P supported in `T∩U` extends after replacing P by a direct-summand enlargement R|U, with R perfect supported in T. The additional summands are finitely many shifted copies of P. Consequently supported restriction is dense up to retracts. ([Stacks.perfect, Lemma 36.13.11 (tag 09IM)](https://stacks.math.columbia.edu/download/perfect.pdf); [TT90, Lemma 5.5.1 (p. 343)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 5.5.2 (p. 343)](https://gwern.net/doc/math/1990-thomason.pdf)).

`D_QCoh,T(X)` has a single perfect generator when X is qcqs and `X∖T` quasi-compact. Orthogonality to all shifts of this generator detects zero. On `Spec A` with `T=V(f₁,…,fᵣ)`, use the finite Koszul complex on those generators. ([Stacks.perfect, Lemma 36.15.4 (tag 0A9A)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Lemma 36.15.2 (tag 09IR)](https://stacks.math.columbia.edu/download/perfect.pdf)).

For `P,E∈D_QCoh(X)` with P perfect and E supported on T, every `P→E` is killed after tensoring P with a perfect `I→O_X` invertible off T. The cone of `I⊗ᴸP→P` is perfect supported on T and receives a factorization of the original map. The variant with pseudo-coherent P requires E bounded below. ([Stacks.perfect, Lemma 36.17.5 (tag 0A9C)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.perfect, Proposition 36.17.1 (tag 09M1)](https://stacks.math.columbia.edu/download/perfect.pdf); [Stacks.derived, Lemmas 13.37.3–13.37.4 (tags 09SN, 09SP)](https://stacks.math.columbia.edu/download/derived.pdf)).

**Checks.**

- On the spectrum of a DVR, with generic open j, the identity on `O_U` cannot be lifted by a perfect roof into `j_!O_U`: derived global sections of this target vanish. It is not quasicoherent and is excluded.
- On `Spec k[t]`, the map `O→O/(tⁿ)` is killed by `tⁿ`, and factors through the perfect cone of multiplication by `tⁿ`.
- For `U=X` a map between the stated quasicoherent derived objects has the roof with identity denominator; for a zero target its extension and supported factorization can be zero.

For qcqs X, quasi-compact U with complement Y, and Z with quasi-compact complement, restriction embeds the Verdier quotient `Perf_Z(X)`/`Perf_{Y∩Z}(X)` fully faithfully in `Perf_{U∩Z}(U)`. Prove both roof lifting and equality of roofs after a further denominator, using Mathlib's existing triangulated localization. ([TT90, Proposition 5.2.3 (pp. 338-339)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proposition 5.2.4 (p. 339)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.7.7 (PDF p. 434)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

A supported perfect F on U extends to `Perf_Z(X)` precisely when `[F]` lies in the image of `K₀(X on Z)`. Its failure to extend is the class of `[F]` modulo this image, equivalently its image under the negative boundary after localization has been proved. ([TT90, Key Proposition 5.2.2 (p. 338)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proposition 5.5.4 (p. 344)](https://gwern.net/doc/math/1990-thomason.pdf)).

The supported Frobenius-pair sequence realizes `Perf_{Y∩Z}(X)→Perf_Z(X)→Perf_{U∩Z}(U)`, with fully faithful first arrow and quotient functor fully faithful and dense up to retracts. This is the exactness hypothesis for Schlichting localization; essential surjectivity is stronger and unnecessary. ([TT90, 5.2 (p. 338)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Proof of Theorem V.7.6 (PDF p. 434)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 3.3 Localization spectra and oriented boundaries

Use the same support and open hypotheses as the preceding subsection. The exact sequence of Frobenius pairs is the input to nonconnective localization. Bass contraction is not used here.

Apply Frobenius-pair localization to obtain `𝕂(X on Y∩Z)→𝕂(X on Z)→𝕂(U on U∩Z)` as a fibre sequence. Here X is qcqs and U and `X∖Z` are quasi-compact. Its long exact sequence runs through every integer degree without a K₀-surjectivity assumption. ([TT90, Theorem 7.4 (p. 365)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.7.6 (PDF p. 433)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, 5.1.5 (p. 337)](https://gwern.net/doc/math/1990-thomason.pdf)).

For connective K the target is the cover of `K(U on U∩Z)` whose π₀ is the image of supported restriction and whose positive groups are unchanged. Thus exactness ends at `K₀(U on U∩Z)`; its cokernel embeds by the boundary in `K₋₁(X on Y∩Z)`. ([TT90, Theorem 5.1 (p. 337)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 5.2 (p. 338)](https://gwern.net/doc/math/1990-thomason.pdf)).

Choose the localization boundary `∂ₙ:Kₙ(U on U∩Z)→Kₙ₋₁(X on Y∩Z)` to be right `K_*(X)`-linear and to send the loop of an endomorphism invertible on U to its cone class in degree zero. In particular `∂[π]=+[k]`. The left-linear convention is `∂ₙˡ=(−1)ⁿ⁻¹∂ₙ`; specify its comparison with the supplier's suspension convention. ([TT90, Theorem 7.4, (7.4.2) (p. 365)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.7.6 (PDF p. 433)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.6.1.2 (PDF p. 414)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `localisationBoundary` — `∂: K_n(U on U∩Z) → K_{n−1}(X on Y∩Z)`, a group homomorphism for each `n ∈ ℤ`.
- `localisationBoundary_comp_restrict` — `∂ ∘ j^* = 0`.
- `localisationBoundary_exact_left` — `ker(K_n(X on Z) → K_n(U on U∩Z)) = im(K_n(X on Y∩Z) → K_n(X on Z))`, and im `∂ = ker(K_{n−1}(X on Y∩Z) → K_{n−1}(X on Z))`.
- `localisationBoundary_naturality` — ∂ commutes with pullback along f: `X' → X` with `f^{-1}(U) = U'` (Layer 3).
- `localisationBoundary_mul_right` — `∂(x · j^*y) = ∂(x) · y` for `y ∈ K_*(X)` (Layer 3); `∂(j^*y · x) = (−1)^{|y|}` `y · ∂(x)`.
- `localisationBoundary_K0` — `∂: K_0(U on U∩Z) → K_{−1}(X on Y∩Z)` vanishes on `[F]` iff F extends to `Perf_Z(X)` (Layer 3).
- `localisationBoundary_cone` — For X regular noetherian and `α ∈ End(O_X^m)` an isomorphism on U: `∂(λ[α|_U]) = [cone(α)] ∈ K_0(X on Y)`.
- `localisationBoundary_left` — `∂^left_n := (−1)^{n−1}∂_n` is left-linear, `∂^left(j^*y·x) = y·∂^left(x)`, and equals ∂ on `K_1`; conversions between the two normalisations used by consumers.

**Checks.**

- At `ℤ_(p)`, `∂[p]=1`; at `p=2`, `∂[12]=2`.
- Units of the DVR have zero boundary, and empty support has zero boundary.
- Negating the boundary sends p to −1 and fails the chosen cone orientation.

Derived pullback yields a morphism of supported localization fibre sequences whenever the relevant schemes and open complements are qcqs. Consequently pullback commutes with ∂, also with enlarged target supports containing the inverse image. Include support enlargement and open restriction as special cases. ([TT90, Proof of Theorem 7.4 (p. 365)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 3.14 (pp. 317-318)](https://gwern.net/doc/math/1990-thomason.pdf)).

For x of degree p and y of degree q defined over X, `∂(x·j*y)=∂x·y` with all three supports intersected. Graded commutativity then gives `∂(j*y·x)=(−1)^q` `y·∂x`. The same convention applies to G-localization and the DVR sequence. ([Weibel, Exercise V.8.2 (PDF p. 442)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise V.5.3 (PDF p. 413)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.6.6.1 (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 3.4 Excision and affine support models

Retain the qcqs and quasi-compact-complement assumptions. “Infinitely near” in the flat excision theorem means that a flat map induces an isomorphism on a closed finite-presentation thickening with the given support; its powers then give the required infinitesimal comparison.

A qcqs morphism between qcqs schemes is an isomorphism infinitely near a finitely presented Y if it is flat above Y and its inverse-image closed fibre is Y. Derived pullback and direct image give inverse equivalences on supported bounded-above quasicoherent objects and on supported perfect objects. Prove independence from the chosen finitely presented thickening. ([TT90, Definition 2.6.2.1 (p. 306)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 2.6.3 (pp. 307-308)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Examples 3.19.2 (p. 323)](https://gwern.net/doc/math/1990-thomason.pdf)).

Infinitely-near isomorphisms induce equivalences on supported 𝕂. Include an open neighborhood of the support, a Nisnevich neighborhood, Noetherian I-adic completion, and henselization along a finitely generated ideal. These are equivalences with supports, not invariance of unrestricted K under completion. ([TT90, Proposition 3.19 (p. 322)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 7.1 (p. 364)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Proposition V.7.9 (PDF p. 435)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finitely many pairwise disjoint closed supports with quasi-compact complements, direct sum gives `Perf_{⊔Zᵢ}(X)≃∏Perf_{Zᵢ}(X)`, hence the same finite-product decomposition of supported K-spectra. ([TT90, Proof of Theorem 10.3, (10.3.9) (p. 385)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Corollary 8.1.4 (p. 368)](https://gwern.net/doc/math/1990-thomason.pdf)).

On `Spec R`, support in `V(s)` means the perfect complex becomes acyclic over `R[1/s]`. Compare its connective K with the ring supported model and its localization sequence. For finitely generated I, support in `V(I)` is equivalent to I-power-torsion cohomology. ([Weibel, Theorem V.2.6.3 (PDF p. 390)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For an effective Cartier divisor on a qcqs scheme with an ample family, let `H_Z` be the exact category of supported sheaves admitting vector-bundle resolutions of length at most one. Its K-spectrum is the connective cover of supported 𝕂. On `Spec R` with s a nonzerodivisor recover the ring `H_s` localization theorem. ([Weibel, Corollary V.7.6.1 (PDF p. 433)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise V.3.16 (PDF p. 407)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Exercise 5.7 (p. 350)](https://gwern.net/doc/math/1990-thomason.pdf)).

### 3.5 Coherent support and dévissage

All coherent categories here are on Noetherian schemes. Regularity is imposed only for the supported Cartan equivalence. The ring divisor comparison assumes a nonzerodivisor; the separate coherent Euler formula also records its annihilator when that assumption is dropped.

For Noetherian X define `Coh_Z(X)` by coherent sheaves vanishing off Z. It is a Serre subcategory, with full and empty support identities. It includes sheaves on every infinitesimal thickening of Z and is generally larger than `Coh(Z)` for a chosen reduced structure. ([Weibel, Example V.6.11 (PDF p. 423)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Application II.6.4.2 (PDF p. 129)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `cohSupport` — `Coh_Z(X)` as an ObjectProperty of `Coh(X)` (or as a full subcategory).
- `cohSupport.isSerre` — `Coh_Z(X)` is closed under subobjects, quotients and extensions.
- `cohSupport.mem_iff` — `F ∈ Coh_Z(X)` iff `F|_{X∖Z} = 0` iff Supp `F ⊆ Z`; on `Spec A`, `M~ ∈ Coh_{V(I)}` iff `Module.support M ⊆ V(I)` iff `I^n M = 0` for some n.
- `cohSupport.mono` — `Z ⊆ Z'` implies `Coh_Z(X) ⊆ Coh_{Z'}(X)`.
- `cohSupport.pushforward` — For a closed immersion i: `Y → X` into noetherian X with `|Y| ⊆ Z`, `i_*`: `Coh(Y) → Coh_Z(X)` is exact.
- `cohSupport.flatPullback` — For flat f: `X' → X`, `f^*` maps `Coh_Z(X)` to `Coh_{f^{-1}Z}(X')`.

**Checks.**

- Full support is `Coh(X)`, and empty support is the zero Serre category.
- ℤ/p³ is supported on `V(p)`, while ℤ is not.
- An affine finite module belongs exactly when its module support lies in `V(I)`.
- The module `k[x]`/x² is supported at the reduced origin but is not a module on that reduced closed scheme; this category must contain nilpotent thickenings.

Restriction induces `Coh(X)`/`Coh_Z(X)≃Coh(U)` for Noetherian X. Establish exactness, extension of coherent sheaves from U, and the universal Serre-quotient property; it is not a fully faithful functor before taking the quotient. ([Weibel, Application II.6.4.2 (PDF p. 129)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Stacks.Properties, Lemma 28.23.2 (tag 01PF)](https://stacks.math.columbia.edu/download/properties.pdf)).

For any closed subscheme i:`Z→X` of a Noetherian scheme, dévissage identifies `G(Z)` with `K(Coh_{|Z|}(X))`. Filter coherent sheaves by powers of the defining ideal. Hence G is unchanged by nilpotent thickenings and depends only on the closed subset in this supported comparison. ([Weibel, Exercise V.4.3 (PDF p. 410)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Application V.4.4 (PDF p. 409)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

The coherent Serre quotient and dévissage give `G(Z)→G(X)→G(U)` as a fibre sequence. Negative G is zero, so the long exact sequence ends in `G₀(U)→0`. Tensor by perfect objects makes it a `K(X)`-module sequence with the right-linear boundary convention. ([Weibel, Example V.6.11 (PDF p. 423)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.6.11 (PDF p. 424)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, 3.2 and Proposition 3.1 context (printed p. 120)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Cartan gives a map of the perfect and coherent localization sequences and hence `c_Z`:`𝕂(X on Z)→G(Z)`. Its π₀ formula is the alternating cohomology class, interpreted through coherent dévissage. For regular Noetherian X all three comparison maps are equivalences. ([Weibel, Remark V.7.6.2 (PDF p. 433)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Theorem 3.21 (p. 328)](https://gwern.net/doc/math/1990-thomason.pdf)).

For regular Noetherian X, `𝕂(X on Z)≃G(Z)` for every closed Z. If Z itself is regular, `Ri_*` further identifies `K(Z)` with the supported spectrum. A singular or nonreduced Z cannot in general replace `G(Z)` by `K(Z)`; keep this distinction in every use of dévissage. ([Weibel, Remark V.7.6.2 (PDF p. 433)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise III.4.4 (PDF p. 223)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example I.3.10.2 (PDF p. 34)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For Noetherian R and α:`M→M` invertible after inverting s, `∂[α]=[coker α]−[ker α]` in coherent supported K₀. In particular `∂[s]=[R/s]−[Ann(s)]`, and the second term vanishes only for a nonzerodivisor. The cochain cone occupies degrees −1 and 0 with this order of signs. ([Weibel, Example V.6.1.2 (PDF p. 414)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise V.5.1 (PDF p. 413)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise IV.7.9 (PDF pp. 340-341)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

G commutes with inverse limits of Noetherian schemes along affine flat transitions when the limit is Noetherian. Apply this to neighborhoods of a point and to nonempty opens of an integral scheme. The resulting generic group is K of the function field; arbitrary nonflat G-pullback is not used. ([Quillen, §7, Proposition 2.2 (printed p. 117)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

### 3.6 Unit loops, DVR boundaries and specialization

For commutative A, define `λ_A:A×→K₁(Spec A)` through `GL₁→GL→BGL⁺` and the plus/Q comparison, followed by the affine scheme comparison. It is natural and multiplicative-to-additive. Its definition uses the canonical stable unit loop; the full `K₁=GL`/E theorem is not needed. ([Weibel, Exercise IV.7.9 (PDF p. 340)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Definition IV.1.1 (PDF p. 268)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `unitLoopClass` — `λ_A: Additive(A^×) →+ K_1(Spec A)`, u ↦ loop of the `1 × 1` matrix u.
- `unitLoopClass_one` — `λ_A(1) = 0`.
- `unitLoopClass_mul` — `λ_A(uv) = λ_A(u) + λ_A(v)`.
- `unitLoopClass_map` — For φ: `A → B`, `φ^*` `λ_A(u) = λ_B(φ(u))`.
- `unitLoopClass_eq_ofUnits` — The composite of `A^×→GL(A)/E(A)` with GeneralAlgebraicKTheory §3.14’s comparison and the affine scheme comparison is `λ_A`.
- `unitLoopClass_prod` — For u, `w ∈ A^×`, `λ(u)·λ(w) ∈ K_2(Spec A)` is the product of GeneralAlgebraicKTheory §7.4; it is bilinear in `(u, w)`.

**Checks.**

- The loop of the unit 1 is zero.
- In ℚ×, the boundary of p²/3 at `p≠3` is 2, detecting a nonzero loop.
- The assignment respects multiplication of units, not their addition: at `p=3`, `[3+3]` has boundary 1 while `[3]+[3]` has boundary 2.
- For fields this is the size-one stable matrix class under GeneralAlgebraicKTheory §3.14's plus comparison.

For every commutative A, construct `stableDeterminant` : `K₁(A)` → `Additive(A^×)` by descent of the finite-matrix determinant through the stable elementary quotient of GeneralAlgebraicKTheory §§3.3–3.4 and 3.14. Prove `stableDeterminant_unitLoopClass`, which identifies the size-one unit inclusion as its section, and `stableDeterminant_projectiveAutomorphism`, using the componentwise determinant object of AlgebraicVectorBundles L0C. Define `SpecialK1 A` as its kernel. Its API includes determinant-one stable representatives, inclusion, scalar-extension functoriality, and `kOne_units_split` : `K₁(A) ≃ Additive(A^×) ⊕ SpecialK1 A`; the inverse adds the unit class and the kernel inclusion. Prove `specialK1_semilocal_zero` for commutative semilocal rings by elementary reduction, hence `stableDeterminant_localEquiv` for every commutative local ring and the field specialization. The elementary-reduction theorem, including the stable range-one shortening argument for unimodular rows over a semilocal ring, is part of this target. No equivariance or semisimplicity assumption on projective automorphisms is imposed. (Weibel III.1.1.1–1.1.4, p.180, Lemma 1.4, pp.183–184, and Proposition 1.6.4, p.186.)

**Checks.**

- The determinant of diag(u,v) is uv, so the section sends a unit to its actual stable loop and is injective even when `SpecialK1 A` is nonzero.
- Over ℤ, diag(−1) represents the nonzero unit class and diag(−1,−1) has trivial stable class. In characteristic two the unit −1 equals 1.
- For a field k and for a commutative local ring the kernel vanishes, while no vanishing is asserted for an arbitrary commutative ring. Finite-level determinant-one representatives are compared after stabilization.
- The zero ring has trivial units and K₁; the split comparison is the zero-group equivalence.

For a DVR O with fraction field L and residue k, regular dévissage gives `K(k)→K(O)→K(L)`. Negative groups vanish. Its degree-zero end has `K₀(k)=K₀(O)=K₀(L)=ℤ`, zero closed-point pushforward, and restriction the identity under rank. ([Weibel, Gersten's DVR Conjecture 6.9 (PDF p. 421)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Dedekind domains, (6.6) (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Define the DVR boundary by the scheme-supported connecting map followed by inverse regular dévissage. It is the single scheme-theoretic boundary used by the low-degree and finite-local-field roadmaps, with `∂λ(π)=[k]`. ([Weibel, Gersten's DVR Conjecture 6.9 (PDF p. 421)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Theorem V.6.9.1 (PDF p. 422)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `dvrBoundary` — `∂_S`: `K_n(L) →+ K_{n−1}(k)` for `n ∈ ℤ`.
- `dvrBoundary_comp_restrict` — `∂_S ∘ (O → L)^* = 0`.
- `dvrBoundary_exact` — ker `∂_S = im(K_n(O) → K_n(L))` and im `∂_S = ker(i_*: K_{n−1}(k) → K_{n−1}(O))`.
- `dvrBoundary_unitLoopClass` — `∂_S(λ(u)) = v(u)·[k]` (Layer 3).
- `dvrBoundary_uniformizer` — `∂_S(λ(π)) = [k]` for every uniformiser π.
- `dvrBoundary_mul_right` — `∂_S(x·y) = ∂_S(x)·ȳ` for `y ∈ K_*(O)` with image `ȳ ∈ K_*(k)`.
- `dvrBoundary_unit_product` — `∂_S(λ(f)·λ(u)) = v(f)·λ_k(ū)` for `u ∈ O^×` (Layer 3).
- `dvrBoundary_flat_ramification` — For a local flat map `O → O'` of DVRs with `mO' = m'^e`, `∂_S'(x_{L'}) = e·(k → k')^*(∂_S x)`: pulling back the support category multiplies by the `length e` of O'/mO' (Layer 3).
- `dvrBoundary_completion` — The completion `O → Ô` `(e = 1)` and the henselisation `O → O^h` identify the boundaries (Layer 3 on the support term).
- `dvrBoundary_left_normalisation` — `∂^left_n = (−1)^{n−1}∂_S` satisfies `∂^left(x·y)=x̄·∂^left(y)` for `x ∈ K_*(O)`: on `K_2`, `∂^left` is the inverse of `∂_S` in multiplicative notation.
- `dvrBoundary_explicit` — `∂_S ∘ λ` agrees with the cokernel-length boundary of GeneralAlgebraicKTheory §8.12, through the affine and supported Cartan comparisons; for f in `L^×` it is `v(f)·[k]`.

**Checks.**

- At `ℤ_(p)`, `[p]` has boundary 1 and `[p⁻¹]` boundary −1; `[12]` at `p=2` gives 2.
- Integral units vanish and the degree-zero boundary lands in `K₋₁(k)=0`.
- The parameter t of `k[[t]]` has boundary 1.
- In the ramified extension at `1+i` of `ℤ_(2)[i]`, the boundaries of 2 and `1+i` are respectively 2 and 1.
- The negative orientation fails all the parameter normalizations.

For normalized v:`L×→ℤ`, prove `∂λ(f)=v(f)[k]` by the cone of multiplication by π, additivity, and vanishing on O×. This comparison must translate Mathlib's multiplicative-valued ordFrac to the additive integer valuation explicitly. ([Weibel, Proof of Theorem V.6.9.1 (PDF p. 422)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.6.1.2 (PDF p. 414)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.6.6 (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For `u∈O×` and `f∈L×`, right linearity gives `∂(λ(f)λ(u))=v(f)λ(ū)`; reversing the factors negates the answer. Products of two integral units have zero boundary. The complete tame symbol and the value on `(π,π)` belong to the separate symbols roadmap and are not premises here. ([Weibel, V.6.6.1 (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For a parameter s define specialization `σ_s(a)=∂(λ(s)·a)`. Replacing s by us gives `σ_us(a)=σ_s(a)−λ(ū)∂a=σ_s(a)+(−1)^n∂a·λ(ū)` in degree n. Derive this sign from right linearity rather than importing an unqualified printed formula. ([Weibel, V.6.6.4 (PDF p. 418)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `specialisation` — `λ_s: K_n(L) →+ K_n(k)`, `λ_s(a) = ∂_S(λ(s)·a)`.
- `specialisation_restrict` — `λ_s(j^*a) = π^*a` for `a ∈ K_n(O)` (Layer 3).
- `specialisation_change_parameter` — `λ_{us}(a) = λ_s(a) − λ_k(ū)·∂_S(a)`.
- `specialisation_unitLoopClass_param` — `λ_s(λ(s)) = ∂_S(λ(s)·λ(s))`; in degree one `λ_s(λ(w)) = λ_k(w̄)` for units w.
- `specialisation_linear` — `λ_s(a·j^*y) = λ_s(a)·ȳ` for `y ∈ K_*(O)`.

**Checks.**

- At `ℤ_(5)` with parameter 5, specialization of `[2]` is [2 mod 5].
- Specialization sends `1∈K₀(ℚ)` to `1∈K₀(𝔽₅)`.
- Replacing 5 by 10 changes the value on `[5]` by −[2 mod 5], which is nonzero.
- On `[s]·[w]`, with w integral and invertible, the parameter change is `−[ū]·[w̄]`. This fixes the minus sign in degree two as well.

Specialization of a class restricted from O is its reduction to k: `σ_s` `j*=π*`. Prove this from `∂λ(s)=1` and right linearity, including the compatible finite-coefficient assertion once coefficient pairings are supplied. ([Weibel, Lemma V.6.7.3 and its proof (PDF pp. 419-420)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

If k is algebraically closed and A is a nonzero commutative k-algebra, `Kₙ(k)→Kₙ(A)` is injective in every degree. Descend to a finitely generated subalgebra and a k-valued closed point to construct a retraction; use continuity for general A. ([Weibel, Corollary V.6.7.4 (PDF p. 420)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 3.7 Divisors, curves and arithmetic surfaces

For Noetherian integral X and a rational function f invertible on U, the codimension-one generic-length component of `∂[f]` is `ord_y`(f). Express it as `ℓ(O_y/a)−ℓ(O_y/b)` for `f=a/b`; only when `O_y` is a DVR identify this with a normalized valuation. On a Dedekind scheme this is the divisor map. ([Weibel, V.9.1 (PDF p. 443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, Lemma 5.16 (printed p. 128)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Finite pushforward gives a map of coherent localization sequences, including their residue fibre terms. For finite extensions of Dedekind domains, generic transfer commutes with the sum of residue-field transfers. Verify residue degrees in degree zero and norm compatibility in degree one. ([Weibel, V.6.6.3 (PDF p. 418)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For a Dedekind domain R with fraction field F, pass to the limit over finite closed subsets to obtain `⊕_pKₙ(R/p)→Kₙ(R)→Kₙ(F)→⊕_pKₙ₋₁(R/p)`. The degree-one boundary is the divisor map; the basis vector at p maps to `[R/p]=[R]−[p]`, hence to the inverse ideal class under `ℤ⊕Pic(R)`. ([Weibel, (6.6) (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.6.6 (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For Noetherian Y of dimension one, localization and coherent dévissage give a sequence from the sum over non-generic closed points, through `G(Y)`, to the sum of K of its generic residue fields. At an integral singular point the degree-one boundary is the length order, not an assumed DVR valuation. ([Weibel, Smooth Curves 6.12 (PDF p. 424)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise V.6.1 (PDF p. 426)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For a proper integral curve X/k and `a∈Kₙ₊₁(k(X))`, the finite sum `Σ_xN_{k(x)/k}∂_x(a)` is zero in `Kₙ(k)`. This follows by composing the localization boundary with proper pushforward; finiteness follows by spreading a over an open. ([Weibel, Weil Reciprocity Formula 6.12.1 (PDF p. 424)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of 6.12.1 (PDF p. 425)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For a flat finite-type integral regular surface over a Dedekind base with pure one-dimensional nonempty closed fibres, localization over finite sets of places gives `⊕_vG(𝓧_v)→K(𝓧)→K(𝓧_U)`. Passing to the generic fibre retains G₁ of each possibly singular fibre, including its closed-point kernel and divisor cokernel; it is not merely a sum of component function-field units. ([Weibel, Example V.6.11 (PDF p. 423)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, Proposition 2.2 (printed p. 117)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

At a generic point c of a vertical component C of that surface, the composite of the vertical G-boundary with restriction and dévissage equals the DVR boundary of `O_{𝓧,c}`. Include the degree-two compatibility needed for elliptic K-theory without discarding the fibre's codimension-two terms. ([Weibel, V.6.6.1 (PDF p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, 3.4 (printed p. 120)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

### 3.8 Witt support and completion

Fix a prime p. Rings R are perfect `F_p`-algebras, with no regularity or Noetherian hypothesis unless explicitly added. `W(R)` is p-torsion-free. For global X, `W(X)` is the p-adic formal Witt thickening, glued through its affine enhanced perfect categories.

For perfect `F_p`-algebra R, define `Perf(W(R) on R)` by perfect `W(R)`-complexes killed after p-inversion. Glue these affine categories for perfect qcqs X to the p-adic formal Witt space `W(X)`. Distinguish the formal space from an ordinary scheme and supported perfect objects from all perfect Witt complexes. ([BS17, §4 opening paragraph; §5 after Remark5.4, printed19](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `WittSupport.Perf` — Full enhanced support category.
- `WittSupport.K` — K of this category.
- `WittSupport.pullback` — Base change along a perfect `F_p`-algebra map.
- `WittSupport.localization` — Its nonconnective spectrum is the fibre of `𝕂(W(R))→𝕂(W(R)[1/p])`; this fibre statement is not imposed on connective K without the K₀ surjectivity condition.
- `WittSupport.affine` — Matches Layer 3 on `Spec W(R)` with closed subset `V(p)`.

**Checks.**

- For a perfect field, `W(k)`/pᵐ is represented by `Cone(pᵐ)`, `m≥1`, and is supported at p.
- `Cone(1)` and zero are zero supported objects.
- `W(k)[0]` is perfect but has nonzero generic fibre.
- Over a singular perfect base, finite modules are not admitted without a separate perfectness argument.

Because `R=W(R)`/p has the perfect resolution `[W(R)→ᵖW(R)]`, restriction of scalars defines `α_R`:`K(R)→K(W(R) on R)`, natural in perfect R and compatible with gluing. The map exists before asserting it is an equivalence. ([BS17, §5 after Remark5.4, printed19](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `WittSupport.alpha` — `Map K(R)→K(W(R) on R)`.
- `WittSupport.alpha_pullback` — Naturality under maps of perfect `F_p`-algebras.
- `WittSupport.alpha_unit` — The class of R maps to `Cone(p)`.
- `WittSupport.alpha_support_model` — Agrees with Layer 3’s supported restriction-of-scalars functor.

**Checks.**

- Over a perfect field, `[k]` maps to `[W(k)/p]` and the map is a dévissage equivalence.
- It preserves zero, including on the empty scheme.
- There is no unital map `𝔽_p→ℤ_p`, so the construction cannot be extension of scalars along a section.
- Perfect field extension carries the p-cone to the p-cone over the new Witt ring.

For a qcqs map of qcqs algebraic spaces and a finitely presented closed Z, equivalence of the derived closed fibre `Z×ᴸ_XY→Z` implies equivalence of the supported derived and perfect categories, hence supported K. Apply this to p-adic completion of p-torsion-free rings, checking the derived fibre condition. Import EnhancedDerivedSheaves E4.2 and E4.5’s regular-ideal completion comparison; in the affine principal case identify its derived completed coefficient ring with the ordinary completion Â and deduce that Â is p-torsion-free and `A/pⁿ≅Â/pⁿ` for `n≥1`. Multiplication-by-p resolutions then give `A/p⊗ᴸ_AÂ≃A/p`. The new theorem is supported closed-fibre excision and this realization compatibility, not a second completion reflector or coefficient reconstruction theorem. ([Bhatt.2014, Lemma5.12 and Remark5.13, PDF23](https://arxiv.org/pdf/1404.7483v1); [BS17, §5, proof of Corollary5.6, printed19–20](https://arxiv.org/pdf/1507.06490v3); [Scholze, §8, Proposition8.8, PDF47](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf)).

**Smooth Frobenius lift.** For a prime p and a smooth finitely presented `𝔽_p`-algebra R₀, construct `smoothFp_frobeniusLift`: a p-complete flat `ℤ_p`-algebra A₀, formally smooth and topologically finitely presented over `ℤ_p`, with `A₀/p≅R₀` and a `ℤ_p`-endomorphism φ reducing to Frobenius. In particular A₀ is regular Noetherian. Lift the smooth affine algebra and its Frobenius successively modulo powers of p. ([BS17, proof of Corollary 5.6, pp.19–20](https://arxiv.org/pdf/1507.06490v3)).

**Checks.**

- For `R₀=𝔽_p`, take `A₀=ℤ_p` and `φ=id`.
- For `R₀=𝔽_p[t]`, take the p-adic completion of `ℤ_p[t]` and `φ(t)=tᵖ`; this is the p-adic completion, not the `(p,t)`-adic power-series ring.
- The algebra `𝔽_p[t]/(t²)` is not smooth and does not satisfy this target's input hypothesis; arbitrary singular coefficients cannot enter the regular dévissage step through it.

**Frobenius colimit completion.** For a p-complete flat `ℤ_p`-algebra A₀ with a Frobenius lift φ, put `R=colim_F A₀/p` and `A∞=colim_φA₀`. Construct `frobeniusColimit_wittCompletion`: the p-adic completion of A∞ is canonically `W(R)`, compatibly with reduction to R. Prove p-torsion-freeness and the quotients modulo `pⁿ`, then use uniqueness of the p-complete flat lift of the perfect ring R. Supported completion invariance and continuity give `K(W(R) on R)≃colim_φK(A₀ on V(p))`. ([BS17, proof of Corollary 5.6, pp.19–20](https://arxiv.org/pdf/1507.06490v3)).

**Checks.**

- For `A₀=ℤ_p` and `φ=id`, both the colimit and its completion are `W(𝔽_p)=ℤ_p`.
- For the polynomial lift above, reduction of the colimit is `𝔽_p[t^{1/p^∞}]`; the completed ring is its Witt ring, with that same reduction modulo p.
- For every `n≥1`, `A∞/pⁿ≅W(R)/pⁿ`; the completion comparison sends `Cone(pⁿ)` to the corresponding supported cone and retains its class n over `R=𝔽_p`.

If R is the perfection of a regular Noetherian `F_p`-algebra R₀, `α_R` is an equivalence. No finite-dimensional hypothesis is imposed on R₀, and neither R nor `W(R)` is assumed Noetherian. Use the supplied Popescu approximation to express R₀ as a filtered colimit of smooth finitely presented `𝔽_p`-algebras. Apply `smoothFp_frobeniusLift`, finite-stage regular dévissage and `frobeniusColimit_wittCompletion` there, then pass through perfection and supported continuity. ([BS17, §5, Corollary5.6; regular-perfection proof using Popescu approximation](https://arxiv.org/pdf/1507.06490v3)).

### 3.9 Quasi-isogenies and ramified coefficients

Continue with perfect `F_p`-algebras. The quasi-isogeny construction below is a K₀ map. For ramified coefficients assume the finite-free Witt coefficient presentation, including its fixed coefficient field, before restricting scalars.

For perfect R define the exact category `C_R` of pairs of finite projective `W(R)`-modules and an isomorphism after p-inversion. Morphisms commute with that isomorphism rationally. Conflations are exact in both module coordinates; their two module splittings need not commute with the rational isomorphisms. ([Zhu.2017, RemarkB.3, printed483](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf)).

Expose the following interface:

- `WittQuasiIsogeny` — Triple of finite projectives and a localized isomorphism.
- `WittQuasiIsogeny.Hom` — Pairs commuting with β after inversion.
- `WittQuasiIsogeny.exact` — Componentwise short exact conflations.
- `WittQuasiIsogeny.forget₁` — Exact functor to finite projective `W(R)`-modules.
- `WittQuasiIsogeny.baseChange` — Base change along perfect-ring maps.

**Checks.**

- The fraction p⁻¹ on `W(k)` defines a quasi-isogeny despite not being integral.
- The triple with both modules zero is zero.
- The triple `(W(k),W(k),id)` has nonzero exact-category class detected by either module rank, though its supported virtual class vanishes.
- An integral map defines a quasi-isogeny precisely when its cone is p-supported.

For β:`E₁[1/p]≃E₂[1/p]`, clear denominators by `p^m` and set `c(β)=[Cone(p^mβ)]−[Cone(p^m:E₁→E₁)]`. Prove denominator independence, base-change naturality, conflation additivity and `c(γβ)=c(γ)+c(β)`. This defines `K₀(C_R)→K₀(W(R) on R)`; it does not assert a functor of spectra. ([Zhu.2017, RemarkB.3, printed483](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf); [BS17, §5 and §10, torsion quotients](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `WittQuasiIsogeny.supportClass` — Normalized virtual cone class.
- `supportClass_independent_denominator` — Any integralizing exponent gives the same class.
- `supportClass_comp` — `c(γβ)=c(γ)+c(β)`.
- `supportClass_exactK0` — Homomorphism defined by TauCeti.ExactK0.lift.
- `supportClass_pullback` — Compatible with base change.

**Checks.**

- Multiplication by pʳ has virtual supported class `r[k]` for every integer r, in particular `−[k]` when `r=−1`.
- Identity has zero supported class even on a nonzero module.
- With `m=1`, the two identity-normalizing cones both have class `[k]` and cancel.
- When the map is integral, `m=0` recovers its usual cone class.

Let k be perfect and identify the residue field of the complete mixed-characteristic DVR `O_K` with k; fix its coefficient inclusion `W(k)→O_K` and assume it is finite free. For a perfect k-algebra R, define `W_{O_K}(R)=W(R)⊗_{W(k)}O_K`. Restriction of scalars carries π-supported perfect objects to p-supported `W(R)`-perfect objects, since the extension is finite free and p- and π-inversion have the same vanishing locus. Construct its K-map and base-change compatibility. ([BS17, §10, proof of Proposition10.1](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `RamifiedWittSupport.restrict` — Exact restriction of supported perfect complexes.
- `RamifiedWittSupport.Kmap` — Induced map of supported K-spectra.
- `RamifiedWittSupport.baseChange` — Restriction commutes with perfect k-algebra base change.
- `RamifiedWittSupport.unramified` — For `e=1` this is the ordinary supported identity comparison.

**Checks.**

- Restriction sends `O_K/π` to a class of Witt degree one and `O_K/p` to degree e, the ramification index.
- Zero stays zero; `e=1` and `O_K=W(k)` recovers identity restriction.
- The free `O_K`-module is perfect after restriction but has nonzero p-inverted fibre, so it does not belong to the supported category.

### Examples

On A² with its origin removed, O extends, and the affine extension construction also extends `O⊕O[1]` as `Cone(0)`. For the rational map x⁻¹ on `D(x)⊂A¹`, use the roof O←xO→O, with inclusion on the left and division by x on the right. A map `O→ℤ`/p² is killed by p². To kill `O→k(0)`, use xO→O; its cone is supported at the origin. These calculations fix both the roof direction and the support of its cone.

For a DVR O, the quotient `Perf(O)`/`Perf_m(O)` has `End(O)=Frac O`. The object `O_F` extends and its K₀ obstruction is zero. More generally regular Noetherian X has surjective `K₀(X)→K₀(U)`, by coherent localization and Cartan, so perfect objects on U extend. The quotient for `ℤ→ℤ[1/p]` is an equivalence; the general theorem only requires equivalence after retract completion. The supported generator `Cone(p)` detects `ℤ[1/p]`/ℤ since `Hom(𝔽_p,ℤ[1/p]/ℤ)=𝔽_p`.

The supports `(p)` in ℤ, `ℤ_(p)` and `ℤ_p` have the same K-theory, identified with `K(𝔽_p)`. A finite set of closed points on a regular curve gives the finite direct sum of their residue-field K-groups. On A¹, the supports `V(x)` and `V(x²)` agree, while `K₁(k[x]/x²)=k××`(1+xk) differs from the supported group k×. For a singular divisor, supported perfect K on a regular ambient is G of the divisor; it need not be its perfect K.

For ℤ with support `{2,3}`, `Cone(12)` has coordinates `(2,1)`. For `k[x,y]`/(xy), the cone of multiplication by x instead has Euler class `[R/xR]−[ann(x)]=[R/xR]−[yR]`. This second example is a coherent-support computation and does not assert that either summand is perfect. The two-term cone itself is perfect. The quotient `Coh(ℤ)`/(finite p-groups) is `Coh(ℤ[1/p])`, and dévissage sends a finite p-group to its length.

With `O=ℤ_(5)`, `∂([5]·[2])=[2]` in `K₁(𝔽₅)`, while `∂([2]·[5])=−[2]=[3]` and `∂([2]·[3])=0`. Degree one gives `∂[−p]=1`, `∂[1/p]=−1`, and `∂[p²/3]=2` for `p≠3`. On `ℤ[i]_(1+i)`, `∂[2]=2` because `2=−i(1+i)²`. These checks use the canonical unit loop rather than an unnamed identification of K₁ with units. Specialization sends a lifted unit to its reduction and sends `1∈K₀(O)` to 1; changing s to us subtracts `[ū]` on the class `[s]`.

The Dedekind sequence sends the prime p to `[R/p]=[R]−[p]`; in rank/Picard coordinates this is `(0,[p]⁻¹)`. For ℤ the class is zero and `div(12)=2[2]+[3]`. For `ℤ[√−5]`, the prime `(2,1+√−5)` gives its nontrivial order-two ideal class. For the nodal curve, in characteristic different from two, coherent localization still gives generic rank and point classes, but does not calculate its different perfect K₀. Limits of opens recover Kₙ of a function field, and `colim_NG₁(ℤ[1/N])=ℚ×`.

Proper pushforward of the curve localization boundary is zero. In degree one on P¹ this says `Σ_x[k(x):k]ord_x(f)=0`. In degree two, after the separately supplied symbol comparison, it becomes the product of residue norms in Weil reciprocity. For finite maps, residue-field maps are transfers: inert primes in `ℤ[i]`/ℤ use finite-field norms, and ramification changes valuation multiplicities. Specialization also gives split injectivity `Kₙ(ℂ)→Kₙ(ℂ(t))`; the augmentation of `ℂ[ε]`/ε² gives another split injection from `Kₙ(ℂ)`.

On a regular arithmetic surface, the vertical boundary lands first in G₁ of the full fibre. Its map to the units of component function fields has kernel a quotient of the direct sum of closed-point units. Finite residue fields make that kernel torsion, without making the direct sum finite. Thus component residues detect rational extension from the generic fibre; they include the multiplicity `v_C(π_v)`. Proper smooth fibres over finite fields have torsion K₁ by the finite-field curve theorem, whereas `G_m` has a rational degree summand. The further point-order residue of a boundary vanishes by `d₁²=0`.

For a perfect field k, `W(k)`/`p^m` has support degree m; `Cone(1)` is zero and `W(k)[0]` is not supported. The special-fibre map uses `W(k)→k`: there is no unital map `𝔽_p→ℤ_p` in the other direction. A fractional quasi-isogeny `p^r` gives `r[k]`, including `r=−1`. For `β=1` and denominator exponent `m=1`, the two length-one cone classes cancel. The identity triple still has rank one in the quasi-isogeny exact category. For ramified coefficients `p=uπ^e`, restriction sends `O_K/π` to degree one and `O_K/p` to degree e.

### Dependencies

Layers 1–2; GeneralAlgebraicKTheory Layers 4–8 and 11; StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E.1 and E.4; SchemeAndStackFoundations SF.0, SF.2 and SF.4; JacobianChallenge A for divisor dictionaries. The canonical unit loop and transfer come from low-degree K-theory. Neither the scheme Bass theorem of Layer 5 nor the full tame-symbol presentation is an input.

## Layer 4: Descent and coniveau

### 4.1 Mayer–Vietoris and Brown–Gersten vanishing

For quasi-compact opens U,V of a quasi-separated scheme, supported 𝕂 takes their union/intersection square to a homotopy pullback. The support has quasi-compact complement in `U∪V`. Specify the difference of restrictions in the associated Mayer–Vietoris sequence and its suspension sign. ([TT90, Theorem 8.1 (p. 367)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proof of 8.1 (p. 367)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Corollary V.7.10 (PDF pp. 435-436)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.10.3 (PDF p.451, draft p.443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For Noetherian `X=U∪V` the same Mayer–Vietoris fibre sequence holds for G. Its maps are coherent restriction, their difference, and the connecting map; the negative terms vanish. ([Weibel, Mayer-Vietoris Sequences 6.11.2 (PDF p. 424)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, 3.5 (printed p. 120)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

A presheaf of spectra has the Zariski Mayer–Vietoris property when its value on the empty set is zero and every union/intersection square is cartesian. On qcqs schemes use the basis of quasi-compact opens. Define the Nisnevich version using elementary distinguished squares, rather than merely open covers. ([Weibel, Definition V.10.1 (PDF p. 451)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Definition V.10.9 (PDF p. 456)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `HasMayerVietoris` — HasMayerVietoris F : Prop, for F a presheaf of spectra on Opens X.
- `HasMayerVietoris.les` — For U, V: the long exact sequence ⋯ → `π_nF(U ∪ V) → π_nF(U) ⊕ π_nF(V) → π_nF(U ∩ V) → π_{n−1}F(U ∪ V)` → ⋯.
- `HasMayerVietoris.of_equiv` — Invariance under objectwise equivalences `F ≃ F'`.
- `HasMayerVietoris.fib` — If `F → E → B` is objectwise a fibre sequence and E, B have the property, so does F (K-book Ex. V.10.1).
- `HasMayerVietoris.restrict` — The property restricts to any open `W ⊆ X`.
- `HasMayerVietoris.nisnevich` — HasNisnevichMayerVietoris F for presheaves on the Nisnevich site: `F(∅) ≃ 0` and elementary distinguished squares go to homotopy cartesian squares; implies HasMayerVietoris on the Zariski opens.

**Checks.**

- Nonconnective K on quasi-compact opens satisfies the condition, as does the zero presheaf.
- The constant presheaf Hℤ satisfies every square condition but fails the required `F(∅)=0`.
- Derived sections of an injective resolution give an example whose negative homotopy groups are sheaf cohomology.
- Glue two copies of P¹ along two rational nodes a,b, and remove each node in turn. The two resulting affine opens have `K₀=ℤ`, while their intersection is two copies of `G_m` with `K₀=ℤ²`. The difference map has diagonal image and cokernel ℤ. Thus the homotopy pullback of their connective spectra has `π₋₁=ℤ` and cannot be connective `K(X)`.

On a finite-dimensional Noetherian space, prove spectral Brown–Gersten vanishing: a spectrum presheaf with zero empty value, Zariski Mayer–Vietoris and zero associated homotopy sheaves has zero global homotopy groups. This is the spectrum-valued Zariski-space version; SchemeAndStackFoundations §2.14 already supplies the complex-valued Nisnevich theorem on Sm/S. Use dimension induction on the spectral homotopy presheaves with their exact connecting maps. Both reducedness and the dimension hypothesis are retained. ([Weibel, Proposition V.10.8 (PDF p. 455)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 4.2 The Nisnevich site and excision

Use the finitely presented étale basis of a qcqs scheme and quasi-compact opens in its distinguished squares. The cohomological-dimension bound is stated only for finite-dimensional Noetherian schemes.

Import the Nisnevich topology, elementary distinguished squares and henselian points from SchemeAndStackFoundations §§2.12–2.14. The new site comparison concerns the finitely presented étale basis over qcqs schemes without a Noetherian dimension bound. Prove finite refinements by elementary distinguished squares using Hoyois’s generation theorem and identify the resulting Čech topology with the supplied topology. Compare the squares with Mathlib’s `MayerVietorisSquare`; the spectrum-valued sheaf criterion is proved in §4.12. No new topology or henselization-point carrier is introduced. ([TT90, Appendix E, E.1 (p. 427)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, V.10, Nisnevich descent (PDF p. 456)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Hoyois.2016, Complete note, one page](https://hoyois.app.uni-regensburg.de/papers/allagree.pdf)).

Expose the following interface:

- `nisnevich_finitePresentationBasis` — The finitely presented étale basis over qcqs schemes induces the supplied small Nisnevich topology.
- `nisnevich_distinguishedSquareRefinement` — A Nisnevich cover of a qcqs basis object admits the finite distinguished-square refinement used in the generation theorem.
- `distinguishedSquare_mayerVietorisComparison` — The supplied elementary squares agree with the indicated Mathlib MayerVietorisSquare interface.

**Checks.**

- The map `Spec(k×k)→Spec` k is a cover because a component is a residue-isomorphic lift; the whole source need not be isomorphic to the target.
- A nontrivial finite separable field extension is étale but fails the Nisnevich lifting condition.
- For a henselian local target, first shrink a pointed étale neighborhood around its residue-isomorphic point; unwanted closed-fibre components do not belong to the local section.
- The empty covering family covers exactly the empty scheme.

For Noetherian X of finite dimension N, prove that spectral Nisnevich hypercohomology commutes with filtered homotopy colimits in the indicated finite-dimensional basis scope. Import the conservative family of all henselian points of étale objects, finite subcovers and the abelian cohomological-dimension bound from SchemeAndStackFoundations §§2.12–2.14. Use the finite cohomological bound to justify the spectral filtered-colimit comparison; this is additional to the supplied abelian theorem and requires finite dimension. ([TT90, Lemma E.6 (p. 428)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Lemma E.5(c) (p. 428)](https://gwern.net/doc/math/1990-thomason.pdf)).

Supported 𝕂 sends every qcqs elementary Nisnevich square to a homotopy pullback. Identify the fibre terms by infinitely-near excision and use the localization comparison; no regularity is needed. ([Weibel, Example V.10.10.1 (PDF p. 456)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Proof of 10.8 (p. 389)](https://gwern.net/doc/math/1990-thomason.pdf)).

### 4.3 Hypercohomology and K-sheaves

On a site with enough points define spectral hypercohomology as the totalization of the Godement cosimplicial fibrant replacement. Construct its augmentation, restriction and supported fibre `H_Y(X,F)=fib(H(X,F)→H(X∖Y,F))`. Specify homotopy limits rather than ordinary limits of spectra. ([Thomason.1985, Definition 1.33 (printed p. 452)](http://www.numdam.org/item/10.24033/asens.1495.pdf); [Thomason.1985, Lemma 1.35 (printed p. 452)](http://www.numdam.org/item/10.24033/asens.1495.pdf)).

Expose the following interface:

- `hypercohomology` — `H(C; F)` with the augmentation η: `F(X) → H(C; F)`.
- `hypercohomology.map` — Functorial in F; contravariant in the site (morphisms of sites with enough points).
- `hypercohomology.fiber` — `H(C; −)` preserves homotopy fibre sequences, products and weak equivalences (Thomason 1985 1.35).
- `hypercohomology.presheaf` — U ↦ `H(C/U; F)` is a presheaf of fibrant spectra and has the Mayer–Vietoris property for the topology of C.
- `hypercohomology.skyscraper` — For a skyscraper `i_{x*}E` on the Zariski site, η: `E → H(X; i_{x*}E)` is an equivalence.
- `hypercohomology.supports` — `H_Y(X; F) := fibre(H(X; F) → H(X ∖ Y; F))`, functorial for maps of pairs.
- `hypercohomology.eilenbergMacLane` — `π_{−n}H(X; K(A, 0)) ≅ Sheaf.H A n` for an abelian sheaf A (Mathlib's sheaf cohomology).

**Checks.**

- The Zariski site of a point gives `H(X;F)≃F(X)`.
- For the units sheaf placed in spectral degree zero on P¹, π₋₁ of hypercohomology is `Pic(P¹)=ℤ`.
- On a discrete two-point space, sheafification changes the constant presheaf ℤ into global sections ℤ². Hypercohomology must see ℤ².
- For an abelian sheaf, π₋ₙ recovers Mathlib's degree-n sheaf cohomology.

The Godement tower yields `E₂^{p,q}=Hᵖ(C,π̃_qF)⇒π_{q−p}H(C,F)`, with differential `(r,r−1)`. Prove strong convergence under bounded-above homotopy or bounded cohomological dimension; give the equivalent indexing with `π̃_−q` and total degree `−p−q`. ([Thomason.1985, Proposition 1.36 (printed p. 452)](http://www.numdam.org/item/10.24033/asens.1495.pdf)).

Define Zariski K-sheaves by sheafifying supported Kₙ on quasi-compact opens; their stalks are Kₙ(`O_{X,x}` on the inverse-image support). Define Nisnevich K-sheaves on Noetherian X with the corresponding henselian stalks. The unspecialized local support term cannot be replaced by its residue field on a singular scheme. ([TT90, Remark 10.4 (p. 386)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Remark 10.9 (p. 390)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, V.9.8 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `kSheaf` — `𝒦_n` (and `𝒦_n(− on Y)`) as a sheaf of abelian groups on `X_Zar`; `𝒦_n^{Nis}` on `X_Nis`.
- `kSheaf.stalk` — `(𝒦_n)_x ≅ K_n(O_{X,x})`, naturally in x.
- `kSheaf.stalk_nis` — (`𝒦_n^{Nis}`) at the point over `(x, k')` is `K_n(O^h_{X,x,k'})`.
- `kSheaf.map` — For f: `X' → X`, `f^{-1}𝒦_n(X) → 𝒦_n(X')` compatible with stalks.
- `kSheaf.zero_of_neg` — `𝒦_n = 0` for `n < 0` when X is regular noetherian.
- `kSheaf.units` — `O_X^×`→`𝒦_1` (through λ of Layer 3 on local rings), split by the determinant when the stalks are local rings (§3.6’s determinant splitting and GeneralAlgebraicKTheory §3.14’s `π_1` comparison).

**Checks.**

- On A¹, the K₀ stalks are ℤ; the generic K₁ stalk contains the class of t, detected by its boundary 1 at the origin.
- Over a field point the K-sheaf is the constant value `Kₙ(k)`.
- On P¹, `K₀(P¹)=ℤ²` while sections of the sheaf 𝒦₀ are only ℤ.
- On connected Noetherian X, 𝒦₀ is the constant sheaf ℤ through the local-ring rank comparison.

### 4.4 Support towers and descent

Let X be Noetherian of finite Krull dimension d, and Y closed. Use nonconnective perfect K-theory and its supported presheaves. All towers are bounded in codimension, so the spectral sequences have strong convergence.

On finite-dimensional Noetherian X, define `SᵖK(X on Y)` as the filtered colimit over closed Z of codimension at least p of `𝕂(X on Y∩Z)`. It is zero for `p>dim` X, and S⁰ is the full supported theory. Its image on homotopy defines Fᵖ, a decreasing coniveau filtration natural for flat maps. ([TT90, (10.3.5) (p. 384)](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `supportFiltration` — `S^pK(X on Y)`, with maps `S^{p+1}K → S^pK`.
- `supportFiltration.zero` — `S^0K(X on Y) ≃ K(X on Y)`.
- `supportFiltration.vanish` — `S^pK = 0` for `p > dim` X.
- `supportFiltration.flat` — Natural for flat maps and restriction to opens.
- `supportFiltration.coniveauFiltration` — `F^pK_n(X on Y) = im`(`π_nS^pK → K_n(X on Y)`), a decreasing filtration with `F^{d+1} = 0`.

**Checks.**

- For a DVR, the first support stage is `K(k)`, though its image in `K₀(O)` is zero.
- At a field point only stage zero survives.
- On A¹⊔A², closed points have equal support dimension but different ambient codimensions, one and two.
- For a Dedekind domain, F¹K₀ is the rank kernel and identifies with its ideal class group.

The coniveau tower has fibre layers given by the wedge over codimension-p points of the local supported spectra, with zero term outside Y. Construct the Zariski skyscraper presheaves and their Nisnevich henselian analogues before evaluating the fibre sequence. ([TT90, (10.3.6)-(10.3.7) (p. 384)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proof of 10.3, (10.3.11) (p. 385)](https://gwern.net/doc/math/1990-thomason.pdf)).

For a scheme with finite-dimensional Noetherian underlying space, supported and unrestricted 𝕂 equal their Zariski hypercohomology. In the supported case also identify them with hypercohomology supported in Y. Use Mayer–Vietoris, Brown–Gersten vanishing and the bounded coniveau tower. ([TT90, Theorem 10.3 (p. 383)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 10.1 (p. 382)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.10.2 (PDF p. 451)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finite-dimensional Noetherian X derive the strongly convergent spectral sequence `Hᵖ_Zar(X,𝒦_−q)⇒K_−p−q(X)`, with supported-presheaf and supported-cohomology variants. Columns above `dim X` vanish. The local K₀ and K₁ identifications give the constant-integer and unit sheaves in their respective rows. ([TT90, Theorem 10.3, (10.3.2) (p. 383)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 10.2 (p. 382)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Example V.10.12 (PDF p. 457)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finite-dimensional Noetherian X, Nisnevich excision gives the analogous descent equivalence, supported equivalence and strongly convergent `Hᵖ_Nis(X,𝒦_−q)` spectral sequence. Include the henselian stalk description and the same dimension bound. ([TT90, Theorem 10.8 (p. 388)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proof of 10.8 (p. 388)](https://gwern.net/doc/math/1990-thomason.pdf)).

The bounded coniveau tower yields `E₁^{p,q}=⊕_{x∈Y, codim x=p}K_−p−q(O_{X,x} on x)`⇒`K_−p−q(X on Y)`, with filtration Fᵖ and flat naturality. Residue-field terms are justified only by regular dévissage. ([TT90, (10.3.6)-(10.3.7) (p. 384)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Proof of Proposition V.9.2 (PDF p. 444)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `kConiveauSS` — The spectral sequence `E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(O_{X,x} on x ∩ Y) ⇒ K_{−p−q}(X on Y)`.
- `kConiveauSS.converges` — Strong convergence to `K_*(X on Y)` with the coniveau filtration `F^p`; `E_1^{p,q} = 0` unless `0 ≤ p ≤ dim` X.
- `kConiveauSS.flat` — Natural for flat morphisms.
- `kConiveauSS.edge` — The edge map `K_n(X) → E_1^{0,−n} = ⊕_{generic η} K_n(O_{X,η})` is restriction to the generic points.
- `kConiveauSS.regular` — For X regular, `E_1^{p,q} ≅ ⊕ K_{−p−q}(k(x))` and the spectral sequence is Quillen's (Layer 4).

**Checks.**

- At `ℤ_(p)`, the first-page map `K₁(ℚ)→K₀(𝔽_p)` sends `[p]` to 1.
- At a field only column zero remains.
- On dual numbers the perfect-support first page contains `Kₙ(k[ε]/ε²)`, not the residue-field `Kₙ(k)`; K₁ detects the distinction.
- For A², regularity identifies the codimension-two term with a direct sum of ℤ over closed points.

### 4.5 Coherent coniveau and residues

Continue with finite-dimensional Noetherian X. Coherent coniveau needs no regularity. The residue-field description of perfect coniveau requires regularity; the coherent residue calculation does not turn singular one-dimensional local domains into DVRs.

For Noetherian X let `Mᵖ(X)` be the Serre category of coherent sheaves supported in codimension at least p. Prove its decrease, full/zero endpoints, compatibility with flat pullback and `K(Mᵖ)=colim_ZG(Z)`. The ring version uses finite modules with support, equivalently associated primes, of height at least p. ([Quillen, §7.5 (printed pp. 122-123)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf); [Weibel, V.9 (PDF p. 445)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `codimFiltration` — `M^p(X) ⊆ Coh(X)`, `p ∈ ℕ`.
- `codimFiltration.isSerre` — Each `M^p(X)` is a Serre subcategory.
- `codimFiltration.antitone` — `M^{p+1}(X) ⊆ M^p(X)`; `M^0(X) = Coh(X)`; `M^p(X) = 0` for `p > dim` X.
- `codimFiltration.K_colim` — `K(M^p(X)) ≃ colim_{codim Z ≥ p}` `G(Z)`.
- `codimFiltration.flat` — Flat f: `X' → X` maps `M^p(X)` into `M^p(X')`.
- `codimFiltration.ring` — On `Spec R`: `M^p(R)` = finitely generated modules all of whose associated primes have `Ideal.height ≥ p`.

**Checks.**

- For `Spec ℤ`, the first category is finite abelian groups and contains ℤ/6, whereas the second is zero.
- Over a field, `M⁰=Coh` and `M¹=0`.
- On the union of a plane and line given by `k[x,y,z]`/(xz,yz), a closed point on the line away from the intersection has ambient codimension one, rather than two.
- For `k[x,y]`, the module A/`(x)` is in M¹ and outside M².

Stalks at codimension-p points identify Mᵖ/Mᵖ⁺¹ with the finite-support sum of finite-length local module categories. Coherent dévissage then identifies its K-spectrum with ⊕`_{codim x=p}K(k(x))`; the finite-length categories are not themselves vector spaces. ([Weibel, V.9 (PDF p. 445)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.9.1 (PDF p. 443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finite-dimensional Noetherian X the coherent filtration gives Quillen's bounded coniveau spectral sequence `E₁^{p,q}=⊕_{codim x=p}K_−p−q(k(x))`⇒`G_−p−q(X)`. Record the image filtration, generic edge maps via Artinian dévissage and residue d₁. Identify the diagonal with the adjacent length-divisor quotient; its ordinary codimension-Chow interpretation uses the dimension-function hypothesis below. ([Weibel, Proposition V.9.5 (PDF p. 446)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, Theorem 5.4 (printed p. 123)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Expose the following interface:

- `coniveauSS` — The spectral sequence `E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X)`.
- `coniveauSS.exactCouple` — The exact couple `(D_1, E_1)` from the localisation sequences of `M^{p+1} ⊆ M^p`.
- `coniveauSS.converges` — Convergence to `G_*(X)` with filtration `F^pG_n(X) = im`(`K_nM^p(X) → G_n(X)`); `E_1^{p,q} = 0` unless `0 ≤ p ≤ dim` X and `p + q ≤ 0`.
- `coniveauSS.edge` — The edge map `G_n(X) → ⊕_η K_n(k(η))` is restriction to the generic points. For nonreduced X, use Artinian dévissage at generic local rings rather than identifying the local ring with `k(η)`; this is the dévissage already supplied by Layer 4.
- `coniveauSS.d1` — The components of `d_1` are residues (Layer 4); on `K_1` they are length orders (Layer 4).
- `coniveauSS.d1_d1` — `d_1 ∘ d_1 = 0` (Layer 4).
- `coniveauSS.E2_chow` — With codimension a dimension function, `E₂^{p,−p} ≅ CHᵖ(X)`; generally E₂ is the adjacent length-divisor quotient specified below.
- `coniveauSS.flat` — Contravariant for flat maps (Layer 4).
- `coniveauSS.proper` — For f:`X→Y` proper between pure-dimensional finite-type schemes over one field, set `δ=dim` `X−dim` Y and `M^j=Coh` for `j≤0`. Since `dim f(Supp F)≤dim Supp F`, `Rf_*` sends bounded complexes with coherent cohomology in `M^i(X)` to those in `M^{i−δ}(Y)`. After GeneralAlgebraicKTheory §6.19’s bounded-derived comparison, this filtered exact functor induces the δ-shifted spectral-sequence map. Import proper coherence and StableHomotopyKTheory §7.23, `FilteredSpectrum.spectralSequence.map`, for filtered functoriality; no arbitrary nonequidimensional or fibre-dimension-only assertion is made.
- `coniveauSS.K_compat` — For X regular it is the K-theoretic coniveau spectral sequence of Layer 4 (Layer 4).

**Checks.**

- For a DVR, d₁ is the valuation; its kernel is O× and its cokernel is zero.
- A field has only the zeroth column and no nonzero differentials.
- On P¹ the diagonal E₂ terms are ℤ in codimensions zero and one; the degree map kills principal divisors and shows the residue map is not surjective.
- On dual numbers, the coherent first page is `Kₙ(k)`, in contrast to perfect K-theory, and recovers `G≃K(k)`.

Flat maps induce maps of coherent coniveau exact couples and spectral sequences. For Noetherian limits along affine flat transitions, prove continuity of every Mᵖ K-group and hence of the spectral sequence. Localization at a point is the colimit over its neighborhoods. ([Quillen, §7, 5.2-5.3 (printed p. 123)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf); [Weibel, Remark V.9.2.2 (PDF p. 444)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

The d₁ component from y of codimension p to x of codimension `p+1` is zero unless x lies in the reduced closure Y of y; otherwise it is the boundary of the one-dimensional local domain `O_{Y,x}`. It is a DVR boundary only when that local ring is regular. ([Quillen, Proof of Proposition 5.14 (printed p. 128)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

In degree one that component is the length order `ord_x^Y`(f). Thus the map from codimension-`(p−1)` function-field units to codimension-p cycles sends f to `div_Y`(f). Compare with Scheme.ord and the additive interpretation of Ring.ordFrac, keeping singular branch lengths. ([Weibel, V.9.1 (PDF p. 443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, Proof of Proposition 5.14, (5.15) (printed p. 127)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Exact-couple identities give `d₁²=0`. On a regular integral surface this says `Σ_{D∋x}ord_x^D(∂_Dα)=0` for `α∈K₂(k(X))`, for every closed x. Finiteness comes from the direct-sum residue maps, not from a claim that only finitely many divisors pass through x. ([Weibel, Proof of Proposition V.9.2 (PDF p. 444)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proposition V.9.2, the E1 page (PDF p. 444)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Define the diagonal quotient by the codimension-p components of the length-divisor maps from codimension-`(p−1)` points. When codimension is a dimension function, identify it with `CHᵖ(X)`; explicitly require `codim_X(x)=codim_X(y)+1` for codimension-one specializations x of y. This holds for pure-dimensional catenary schemes with dim closure{x}+`codim_X(x)=dim` X, including pure-dimensional finite-type schemes over a field. Compare this quotient with the P¹-family definition of Chow groups in the pure-dimensional finite-type-over-a-field scope. For normal X and `p=1` recover the divisor class group. ([Weibel, Lemma V.9.1.1 (PDF p. 443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proposition V.9.5 (PDF p. 446)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Lemma V.9.4.1 (PDF pp. 445-446)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For `dim X=1` there are two coniveau columns, so `E₂=E∞`. State the short exact sequence with cokernel of the next residue on the left and kernel of the current residue on the right, and identify its maps with curve localization. This consequence does not assume the Gersten property. ([Weibel, V.9 introduction (PDF p. 443)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Smooth Curves 6.12 (PDF p. 424)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For regular finite-dimensional Noetherian X, supported Cartan identifies the perfect and coherent coniveau towers. Hence their spectral sequences agree from E₁ and have residue-field first page. The singular case retains local supported perfect K instead. ([Weibel, Example V.10.12 (PDF p. 457)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Remark 10.6 (p. 386)](https://gwern.net/doc/math/1990-thomason.pdf)).

### 4.6 Gersten exactness and Bloch’s formula

Define the Gersten–Quillen property by vanishing of `Kₙ(Mᵖ⁺¹)→Kₙ(Mᵖ)` for all p,n. It is a property to prove in the specified cases, not an axiom for every regular local ring. Keep the unresolved general mixed-characteristic case out of all unconditional targets. ([Weibel, Gersten-Quillen Conjecture 9.3 (PDF p. 444)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `GerstenQuillen` — `GerstenQuillen X : Prop := ∀ p n, K_n(M^{p+1}X) → K_n(M^pX)` is zero.
- `GerstenQuillen.iff_exact` — GerstenQuillen `(Spec R)` iff the Gersten complex `0 → K_n(R) → K_n(F) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯` is exact for R a regular semilocal domain (Layer 4).
- `GerstenQuillen.of_colimit` — Stable under filtered colimits of noetherian rings along flat maps with noetherian colimit (Layer 4).
- `GerstenQuillen.field` — GerstenQuillen `(Spec k)` for every field k.
- `GerstenQuillen.injective` — GerstenQuillen `(Spec R)` implies `K_n(R) → K_n(F)` injective for a regular semilocal domain R (with `K = G`).

**Checks.**

- A field satisfies the condition since `M¹=0`.
- For `𝔽_p[t]_(t)`, it yields `0→K₂(R)→K₂(𝔽_p(t))→𝔽_p×→0`.
- The local ring of `ℝ+xℂ[x]` at (x,ix) is singular and has a nonzero map `K₀(M¹)→G₀(R)≅ℤ⊕ℤ`/2.
- In degree one for a regular local domain, the asserted injection reduces to R×↪Frac(R)×.

For finite-dimensional Noetherian X, augment the coherent Gersten complex by `Gₙ(X)`, identified with `Kₙ(X)` only when X is regular. The Gersten–Quillen property is equivalent to concentration of E₂ in column zero with the edge isomorphism, and to exactness of the augmented Gersten complexes. Derive the equivalent short exact sequences for the filtration K-groups, with indexing and augmentation fixed. ([Weibel, V.9.3 (PDF p. 445)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

On regular finite-dimensional Noetherian X whose local rings have the Gersten property, the sheafified Gersten complex is a flasque resolution of 𝒦ₙ. Consequently the coniveau E₂ page is `Hᵖ(X,𝒦_−q)`. Local Gersten exactness is an explicit hypothesis. ([Weibel, Proposition V.9.8.1 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.9.8 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Under those same hypotheses derive Bloch's formula `Hᵖ(X,𝒦_p)≃CHᵖ(X)`. In particular `H⁰(X,ℤ)=CH⁰(X)`, and `H¹(X,O×)=Pic(X)=CH¹(X)`. Regular schemes of finite type over a field supply an unconditional application. ([Weibel, Proposition V.9.8.1 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.9.8.1 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, Theorem 5.19 (printed p. 129)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

### 4.7 Geometric and equicharacteristic Gersten theorems

For the geometric case use a finite-type algebra over any field and its semilocalization at finitely many regular points. The formal/convergent and arbitrary equicharacteristic cases are separate assertions with separate approximation arguments.

For a smooth finite-type k-algebra of constant relative dimension `r≥1` over an **infinite** field k, a nonzero nonunit regular element t and finitely many specified closed points, construct a projection to `A^{r−1}` finite on `V(t)` and smooth at those points. The projection lemma is used only over infinite fields. For finite fields the Gersten argument instead passes to infinite primary algebraic extensions and descends vanishing by finite-extension transfers; it does not assert this projection over the original field. ([Quillen, §7, Lemma 5.12 (printed p. 125)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf); [Weibel, Lemma V.9.6.2 (PDF p. 447)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Over an infinite field k, for a smooth finite-type domain R/k and a semilocal localization S⁻¹R, efface coherent K-classes supported on `V(t)`, `t≠0` and `t∉S`, after inverting one `s∈S`. The exact functor from `Mⁱ(R/t)` to `Mⁱ(R[1/s])` induces zero on K-groups; explain the codimension shift. ([Weibel, Proposition V.9.6.1 (PDF p. 446)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, Proof of Theorem 5.11 (printed p. 126)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Use presentation and effacement to prove Gersten for regular semilocal localizations of finite-type algebras over a field. Spread the finite algebra and the chosen primes to finitely generated coefficient subfields, pass to their filtered union, and replace the ground field by its perfect prime field; then shrink to the smooth locus around the chosen regular points. This is Quillen’s reduction, and does not assume the original ground field perfect. For finite k, each class becomes zero over a finite subextension of an infinite p-primary extension; transfer kills its image by a power of p. Doing this for two distinct primes forces the image to vanish. Apply the same argument to coefficient K-groups to obtain pure exactness. This elementwise argument asserts zero maps on groups, not a compatible nullhomotopy of the whole spectrum map. The resulting Gersten complexes are pure exact. ([Weibel, Theorem V.9.6 (PDF p. 446)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §7, Theorem 5.11 (printed p. 125)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

Extend Gersten to `A=k[[x₁,…,xₙ]]` over any field, and to the local ring `k{x₁,…,xₙ}` of convergent power-series germs over a field complete for a nontrivial absolute value. For `n=0` this is the field case. Construct `powerSeriesPresentation` before the effacement step. For any nonzero nonunit t, a change of variables makes t regular in the last variable. In the formal case use continuous triangular substitutions xᵢ↦`xᵢ+xₙ^{Nᵢ}`, with sufficiently separated positive weights; this works over finite fields. For the convergent case choose a linear direction avoiding the first nonzero homogeneous part: the valued field is infinite, and invertible linear substitutions preserve germs. The target `weierstrassFiniteFree` writes the changed t as a unit times a monic distinguished polynomial P of degree `h≥1`. Thus `C=A`/`(t)` is finite free of `rank h` over the `(n−1)`-variable ring B, with basis 1,w,…,`w^{h−1}`.

Construct `powerSeriesDiagonalEffacement` using `D=k[[u₁,…,uₙ₋₁,z,w]]`/`(P(u,w))` in the formal case, with convergent braces in the analytic case. Identify D as a finite free `A=B[[z]]`-algebra of `rank h`, or as its analytic counterpart. The evaluation `D→C` sending z to w has a section by constants in z and regular principal kernel `(z−w)`. In the formal model w is topologically nilpotent because P is distinguished; this licenses evaluation, which is not evaluation of an arbitrary series at an arbitrary element. In the analytic model prove the corresponding germ-substitution and division statements. Prove that the principal-kernel resolution, finite pushforward and codimension shifts satisfy the exact-functor hypotheses of `quillenEffacement`; these algebraic/analytic presentation statements are part of this target rather than an invocation of a general unprovided analytic geometry library. Apply dévissage to modules annihilated by powers of t and filtered continuity to deduce Gersten exactness. A unit t gives `C=0` and needs no preparation; `t=0` is excluded. The Weierstrass/division proof and the analytic exact-functor realization are separate proof obligations, not consequences of geometric finite-type approximation. ([Quillen, §7, Theorem 5.13 (printed p. 127)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf); [Weibel, Exercise V.9.2 (PDF p. 450)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `powerSeriesPresentation` — For A and `0≠t∈A` nonunit as above, produce the formal triangular or analytic linear coordinate change making t regular in the last variable.
- `weierstrassFiniteFree` — After that change, `t=uP` with u a unit, P distinguished monic of degree `h≥1`, and `A/(t)` free of `rank h` over B.
- `powerSeriesDiagonalEffacement` — The displayed finite-free A-algebra D retracts onto C with regular kernel `(z−w)`, and its exact functors give zero maps on the codimension K-groups required by Quillen effacement.
- `gersten_powerSeries` — The augmented Gersten–Quillen complex is exact for the formal and convergent local rings at the stated scope.

**Checks.**

- For `n=0`, `A=k` and the complex is the identity `Kₘ(k)→Kₘ(k)`; no positive-codimension terms occur.
- For `A=k[[x]]` and `t=xʰ`, C has basis 1,x,…,`x^{h−1}` over k; `D=C[[z]]`, evaluation z↦x is defined and has regular kernel `z−x`. With `h=1` this recovers the ordinary DVR residue calculation.
- Over `𝔽_q` the polynomial `x^q y−xy^q` vanishes on every rational line; the formal triangular construction must still handle this nonzero t. A linear-direction proof alone fails this case.
- In `ℂ{x,y}`, `t=y²−x³` gives `B=ℂ{x}` and free basis 1,y for C. Substitution z↦y in the analytic presentation respects germs.
- The unit case `t=1` has `C=0`. The case `t=0` would have no regular principal-kernel effacement and is explicitly excluded.

For a regular local ring containing a field, prove `gersten_equiChar_local`. Use smooth local approximations with a lifted regular parameter, continuity of K and of Zariski cohomology of its sheaf, and induction on dimension through the parameter divisor. Transition maps need not be flat. ([Panin.2003, Theorem A, pp.169–172; Lemmas 3.2–3.3, p.173; Theorem 6.6, p.177](https://www.mathnet.ru/eng/tm394).)

For a regular Noetherian semilocal ring R containing a field, construct `equiChar_semilocalApprox` and prove `gersten_equiChar_semilocal`. Choose the perfect prime field `k⊂R`; the regular map `k→R` is a filtered colimit of smooth finitely generated k-algebras `A_α` by the supplied Popescu theorem. At each stage localize away from the union of the contractions of the finitely many maximal ideals of R. These smooth semilocal rings `S_α` form a filtered system with colimit R: every inverted element maps to a unit of R. Geometric semilocal Gersten gives `H^p(S_α,𝒦_n)=0` for `p>0` and `H⁰(S_α,𝒦_n)=K_n(S_α)`. Grothendieck continuity gives the same assertions on R. The local theorem at every point of `Spec R` makes the sheafified Gersten complex a flasque resolution; its global cohomology then proves the augmented semilocal exactness. This argument does not pass the codimension complexes directly through nonflat transition maps. (*Needs:* the geometric theorem above, §4.6's flasque resolution, SchemeAndStackFoundations §0.15's Popescu interface at [Stacks, Theorem 16.12.1, tag 07GC](https://stacks.math.columbia.edu/tag/07GC), and [Panin.2003, Theorem 6.6, p.177](https://www.mathnet.ru/eng/tm394).)

**Checks.**

- For `R=k` the augmented complex is `K_n(k)→K_n(k)`, and every higher cohomology group is zero.
- For `k[t]` localized at `(t)` and `(t−1)`, both primes are retained in each semilocal approximation; replacing their localization by the product of the two local rings would split the common function field incorrectly.
- A transition `A_α→A_β` need not preserve point codimension or be flat. The cohomology-continuity argument must therefore work without a termwise map of the displayed Gersten complexes.

If a DVR contains a field k₀ over which its residue field is finite, its localization sequence splits into `0→Kₙ(O)→Kₙ(F)→Kₙ₋₁(k)→0`. Construct the splitting from the parameter and transfer, and compare restriction with specialization. This additional splitting is stronger than Gersten exactness alone. ([Weibel, Theorem V.6.7 (PDF p. 418)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Theorem V.6.7 (PDF p. 418)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Theorem V.6.7 (PDF p. 419)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For any equicharacteristic DVR, ∂:`Kₙ₊₁(F)→Kₙ(k)` is surjective and closed-point pushforward is zero. Thus localization gives the Gersten short exact sequences; no canonical splitting is asserted without the extra residue-field hypothesis. ([Panin.2003, Theorem A, p. 169, applied in dimension one](https://www.mathnet.ru/eng/tm394)).

### 4.8 Relative effacement over a DVR

Fix a mixed-characteristic DVR Λ with parameter π, a smooth finite-type Λ-algebra A, and a regular semilocal localization `R=S⁻¹A`. The relative effacement theorem requires a nonzerodivisor t and Λ-flatness of A/tA. The later group-level consequences do not remove either condition.

For A smooth finite type over a mixed-characteristic DVR Λ, semilocal `R=S⁻¹A`, and a nonzerodivisor t with A/t flat over Λ, the supported functor `Mⁱ(A/t)→Mⁱ(R)` is nullhomotopic on K. The regular-element and relative-flatness assumptions are both retained. ([Weibel, Theorem V.9.7 (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.9 (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For regular semilocal R smooth over such Λ, `K_q(Mⁱ⁺¹(R))→K_q(Mⁱ(R))` vanishes for `i≥1` and `q≥0`. Prove the group-level effacement consequence; factorwise vanishing alone does not produce a compatible nullhomotopy of the whole spectrum map. ([Weibel, Corollary V.9.7.1(a) (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, V.9.7 (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

In that mixed-characteristic scope `K₀Mⁱ(R)` is generated by regular-sequence quotient classes `[R/(x₁,…,xᵢ)]`. Include the empty regular sequence for `i=0` and the codimension of each quotient. ([Weibel, Corollary V.9.7.1(b) (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

In the stated smooth-over-DVR semilocal scope, the augmented Gersten complex is exact at the total-fraction-ring term and every codimension-at-least-two term. Possible failures are at `Kₙ(R)` and at the codimension-one term. The complex is everywhere exact if and only if `Kₙ(R)→Kₙ`(QR) is injective for all `n≥0`, with QR the product of component fraction fields. ([Weibel, Corollary V.9.7.1(c) (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Corollary V.9.7.1 (PDF p. 449)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Let D be the semilocalization at the generic points of the special fibre. If `Kₙ(D)→Kₙ`(QD) is injective for every `n≥0`, then R has the Gersten property. When πR is prime in a domain, `D=R_(π)` is a DVR. Its injectivity is an explicit premise. ([Weibel, Corollary V.9.7.1(d) (PDF p. 448)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 4.9 Comparison of descent and coniveau

When local Gersten holds, identify the descent and coniveau E₂ pages with `Hᵖ(X,𝒦_−q)`. The stronger isomorphism of spectral sequences from E₂ uses the Gillet–Soulé comparison theorem with its filtered enhancement; equality of E₂ pages alone is insufficient. ([Weibel, Example V.10.12 (PDF p. 457)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 4.10 Perfect-scheme h- and v-descent

For the first two assertions use classical Noetherian schemes and finite-presentation h-covers, with derived Čech nerves. The remaining assertions concern qcqs perfect `F_p`-schemes. They do not assert h-descent for arbitrary derived schemes.

Use EnhancedDerivedSheaves E2.8’s `perfectHTopology`. On qcqs perfect `F_p`-schemes define the **v-topology** by valuation lifting after extension and compare it with that h-topology: h-covers are the perfectly finitely presented v-covers, and affine v-covers admit finite-presentation h-approximations in the precise inverse-limit sense of the cited source. Prove the v-cover identity, composition, refinement and base-change rules, together with compatibility of the h-to-v comparison. This is the scheme v-site, distinct from the perfectoid v-site. ([BS17, Definition2.1 and Definition11.1; Lemma2.12](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `PerfectScheme.vTopology` — The topology generated by valuation lifting after valuation-ring extension.
- `PerfectScheme.h_le_v` — Every cover of the supplied perfectHTopology is a v-cover.
- `PerfectScheme.vCover_approximation` — The affine v-cover approximation by finite-presentation h-covers, with its specified inverse system.
- `PerfectScheme.vCover_baseChange` — Valuation lifting is stable under arbitrary perfect-scheme pullback.

**Checks.**

- Identity maps and finite Zariski covers are both h- and v-covers.
- Empty covers empty but cannot cover a nonempty field spectrum.
- Perfections of finitely presented proper surjections give h-covers without any étaleness requirement.
- `D(t)→Spec` `𝔽_p[t^{1/p∞}]` fails the v-test at `t=0`.

For a Noetherian h-cover, prove `hCover_detects_perfect_pseudoCoherent`: derived pullback detects perfectness and pseudo-coherence of an existing quasicoherent derived object. Use EnhancedDerivedSheaves E2.8’s `descendable_hCover_noetherian` and its module-descent machinery; the new target is reflection of these finiteness conditions, including pseudo-coherence rather than dualizability alone. Distinguish detection of an existing object from effectiveness of descent data. ([BS17, §11, Theorem11.12 and Remark11.13](https://arxiv.org/pdf/1507.06490v3)).

For a classical Noetherian h-cover, prove `noetherian_hDerivedCech_descent` for enhanced `D_QCoh` using the **derived** Čech nerve, and restrict by the preceding detection theorem. Use the descendability theorem of EnhancedDerivedSheaves E2.8. Its `derivedSchemeBaseChange` already realizes derived charts for qcqs `F_p`-schemes. The retained extension `derivedCechCharts_overIntegers` has arbitrary characteristic: use its animated commutative rings and module categories (E5:animation and E5:spectra-comparison), with fibre-product chart `A⊗ᴸ_RB` and the enhanced module category over that algebra. Glue by the supplied Zariski descent and prove base-change and projection comparisons; on `F_p`-schemes compare with the supplied realization rather than construct a second one. Reduce h-descent to an affine Zariski refinement, where descendability gives module descent. No general h-hyperdescent for nonreduced/derived bases is inferred. ([BS17, Theorem11.12, proof via Proposition11.25; Remark11.13](https://arxiv.org/pdf/1507.06490v3)).

Prove `perfect_vHyperdescent`: Perf on perfect qcqs schemes is a hypercomplete v-sheaf, using fixed Tor-amplitude truncation bounds, continuity and the h-to-v approximation theorem. Prove hypercover descent on each amplitude stratum before taking the filtered union. ([BS17, Theorem11.2(2), proof on printed46–47](https://arxiv.org/pdf/1507.06490v3)).

### 4.11 Witt hyperdescent and support degree

Continue on the qcqs perfect `F_p`-scheme site, with `n≥1` fixed for `W_n`. The Witt formal carrier and the mapping-space/effectivity comparisons are the E.4/SF.4 contracts; their finite-diagram and uniform Tor-bound content is needed here.

For every `n≥1`, prove that `Perf(W_n(X))` is a hypercomplete v-sheaf on perfect qcqs schemes. Before the induction construct `perfectSquareZeroLifting`: for a square-zero ring extension `A′→A` with kernel J and perfect P over A, the obstruction to lifting P lies in `Ext²_A(P,P⊗ᴸ_AJ)`; when it vanishes the space of lifts is a torsor under `Map_A(P,P⊗ᴸ_AJ[1])`. Construct this by lifting a bounded projective model: its squared differential gives the degree-two obstruction, correction of the differential gives degree-one choices, and degree-zero homotopies give automorphisms. Prove independence of the model and compatibility with pullback. Apply the theorem to `W_n→W_{n−1}`; its kernel is the Frobenius-twisted R-module, identified with R using perfectness. The resulting deformation and mapping complexes descend by `Perf(R)` v-hyperdescent and its quasicoherent coefficient comparison. The case `n=1` is that theorem itself. Induct on n, checking the obstruction and the full lift space, rather than substituting Witt thickenings into the perfect-scheme result. ([BS17, Theorem11.2(2), final sentence of its proof](https://arxiv.org/pdf/1507.06490v3)).

**Checks.**

- For `n=1`, `W₁(R)=R`, so this is exactly perfect-complex v-hyperdescent.
- For `R=𝔽₂` and `n=2`, the rank-one module lifts to ℤ/4; automorphisms reducing to identity form `{1,3}=1+2𝔽₂`. They must not be lost by using only isomorphism classes.
- A zero perfect object has a contractible lift space with zero obstruction. For an object with nonzero degree-two endomorphisms, the obstruction condition is retained instead of asserting that every lift exists.

Prove `wittPerfectEffectivity`: for every perfect R, reduction induces an equivalence of enhanced categories `Perf(W(R))≃lim_{n≥1}Perf(W_n(R))`, including mapping spaces and finite diagrams. A compatible system has perfect first reduction; construct its derived inverse limit, prove it perfect and identify every reduction. Use the nilpotent transition kernels and the uniform finite amplitude detected modulo p; use the derived coefficient reconstruction of EnhancedDerivedSheaves E4 for the coherent inverse-limit comparison. The ordinary perfect-object effectivity input is [Stacks, Lemma 15.99.4, Tag 09AW](https://stacks.math.columbia.edu/tag/09AW); the target includes its enhancement-compatible form. Glue on perfect qcqs X. Since limits of hypercomplete v-sheaves are hypercomplete, the preceding finite Witt theorem gives v-hyperdescent for `Perf(W(X))`. No Noetherian hypothesis on R is added. ([BS17, Theorem11.2(2), final sentence of its proof](https://arxiv.org/pdf/1507.06490v3)).

**Checks.**

- For `R=𝔽₂`, the compatible rank-one system over ℤ/2ⁿ reconstructs `ℤ₂[0]`, and its endomorphisms reconstruct ℤ₂, not just 𝔽₂.
- A compatible zero system reconstructs zero; derived completeness detects this from reduction modulo p.
- A proposed system whose ranks or Tor amplitudes genuinely grow with n cannot satisfy the required derived-reduction identifications with its first perfect term. Uniformity is proved from that compatibility, not assumed for arbitrary towers.

The subcategory `Perf(W(X) on X)` is also a hypercomplete v-sheaf. Express the supported core as the fibre of rationalization, or the full subspace of objects with vanishing rationalization, and verify that this support condition descends. ([BS17, Theorem11.2(2), final sentence of its proof](https://arxiv.org/pdf/1507.06490v3)).

The special-fibre map α becomes an equivalence after h-sheafification of `τ≤1K`, hence after v-sheafification of that truncation. Compare the resulting sheaf with the graded Picard groupoid through determinant. This is a low-truncation sheafified equivalence, not a full unsheafified equivalence for every perfect R. ([BS17, Theorem5.7, proof](https://arxiv.org/pdf/1507.06490v3)).

Define deg:`K₀(W(X) on X)→H⁰`(X,`ℤ_lc`) via the sheafified low-truncation α inverse and rank. It is additive on triangles, compatible with pullback and gives a locally constant function. No global inverse of `α_X` is chosen. ([BS17, Remark7.12, printed30; Theorem5.7](https://arxiv.org/pdf/1507.06490v3)).

Expose the following interface:

- `WittSupport.degree` — Supported K₀ to locally constant ℤ.
- `WittSupport.degree_triangle` — Degree is additive in distinguished triangles.
- `WittSupport.degree_pullback` — Degree commutes with perfect-scheme base change.
- `WittSupport.degree_alpha` — Degree of `α(E)` is the locally constant rank of E.

**Checks.**

- `W(k)`/pᵐ has degree m, including degree zero at `m=0`.
- Zero and the identity quasi-isogeny have degree zero.
- Multiplication by p⁻¹ has degree −1, so unsigned length is inadequate for virtual classes.
- Over `k×k`, lengths one and two give the locally constant function `(1,2)`, not a single integer.

### 4.12 Distinguished squares and Čech descent

For a spectrum presheaf on qcqs schemes, the empty-value condition and excision on every elementary distinguished square characterize Nisnevich Čech sheaf descent. Supply the regular cd-structure proof and comparison with Mathlib's MayerVietorisSquare. Hypercompleteness needs a separate boundedness argument. ([Hoyois.2016, Complete note](https://hoyois.app.uni-regensburg.de/papers/allagree.pdf); [AsokHoyoisWendt.2015, Theorem3.2.5 and Remark3.2.6](https://arxiv.org/pdf/1506.07093v2)).

### Examples

Cover P¹ by two affine lines. The Mayer–Vietoris boundary of the Laurent coordinate generates the rank-zero part of `K₀(P¹)`, with the orientation recorded in Layer 5. To see why connective spectra require care, take two rational curves meeting at two rational nodes a,b. The opens deleting a and b are nodal affine crosses, whose projective modules are free by gluing the two polynomial branches. Their K₀ groups are ℤ; the intersection is two copies of `G_m` with `K₀=ℤ²`. The restriction difference has diagonal image, so its cokernel is ℤ. The spectral homotopy pullback of the connective values consequently has `π₋₁=ℤ`. This differs from connective K of the whole curve.

For a field k, a Nisnevich covering member need only have a component with residue field k: `Spec(k×k)` has a section but is not `Spec k`. Its Nisnevich cohomological dimension is zero. A DVR has no Nisnevich abelian cohomology in degrees at least two; a henselian local ring has no higher Nisnevich cohomology. Completion is a separate excision example: `ℤ_(p)`,ℚ,`ℤ_p`,`ℚ_p` give a cartesian K-square by the derived support equivalence, without identifying completion with an étale neighborhood.

For the Eilenberg–Mac Lane spectrum of a sheaf A in degree zero, the Godement construction has `π₋ₙ=Hⁿ(X,A)`; its spectral sequence has one nonzero row. A skyscraper spectrum is already acyclic for this calculation. A nonzero constant value at the empty scheme fails the descent criterion even if every nonempty distinguished square happens to be cartesian. On local Zariski schemes the global-section functor is evaluation at the closed point and is exact, so only the zero cohomological column remains. On a curve the resulting exact sequence is `0→H¹(X,𝒦ₙ₊₁)→Kₙ(X)→H⁰(X,𝒦ₙ)→0`.

For `Spec ℤ`, M¹ is the category of finite abelian groups, `M²=0`, and its quotient decomposes into finite p-primary groups. Its K₀ is free on primes. On a DVR the perfect support tower is `𝕂(O)`, `𝕂(O on m)`, 0; dévissage identifies the second term with `K(k)`, and d₁ is the boundary already normalized in Layer 3. On the singular local node (`k[x,y]`/xy)`_(x,y)`, the punctured spectrum is two fields and K₀ of the local ring maps diagonally into ℤ². Since its negative K₋₁ is zero, supported K₋₁ is ℤ, not `K₋₁(k)=0`. This forbids residue-field substitution in the singular perfect tower.

On A², the element `[x]·[y]` has divisorial residues `[y]` along `x=0` and `−[x]` along `y=0`. Their point orders at the origin add to `1−1=0`. On the cusp `y²=x³`, orders are lengths rather than a falsely assigned DVR valuation: `ord₀(x)=2` and `ord₀(y)=3`. On the x-axis the function `x(x−1)` gives the sum of its two rational points. The diagonal E₂ term is therefore cycles modulo rational divisors. In the finite-type pure-dimensional setting this gives `CH¹(P¹)=ℤ`, `CH²(A²)=0` and `CH²(P²)=ℤ`.

The two-column coniveau sequence for P¹ has residue image equal to the kernel of the sum of transfers, not the full sum of residue groups. Its two degree-zero pieces are `rank ℤ` and `CH¹=ℤ`. On A¹ point transfers vanish and `H¹(A¹,𝒦ₙ)=0`, while `H⁰(A¹,𝒦ₙ)=Kₙ(k)`. On P¹ the corresponding groups are `Kₙ(k)` and `Kₙ₋₁(k)`. A proper regular curve with a rational point can have a nonzero first coniveau piece. On a regular surface Bloch's formula gives `H²(X,𝒦₂)=CH₀(X)`.

For the presentation lemma over characteristic zero, `u+w` makes the cusp `u²=w³` finite over `k[u+w]` and the ambient plane smooth over that line. Relative dimension one reduces the finite divisor to a finite k-algebra. The zero section of `k[u]` is effaced by its two-term free resolution. Over `𝔽_q` the polynomial `x^qy`−`xy^q` vanishes on every rational linear direction; the power-series proof must use the triangular substitution, rather than infer an available rational direction. The theorems include `k[[x,y]]` and `ℂ{x,y}`, with completeness of the coefficient field in the convergent case. They exclude `ℤ_(p)[x]_(p,x)`.

For `Λ[x]` and `t=x−π`, the quotient is Λ and meets the relative-flatness hypothesis. The choice `t=π` fails that hypothesis. The choice `t=0` fails regularity and would make the claimed K₀ map the identity. In `R=Λ[x]_(π,x)`, the exact sequence `0→R`/xR —`π→ R`/xR→R/`(π,x)→0` makes the residue-field class zero in K₀M¹. The regular sequence `(π,x)` generates K₀M². Semilocalization at all generic special-fibre primes must retain all of them; it is not generally their product of DVR local rings. For `Λ=ℤ_(p)`, the localization at `(p)` has residue field `𝔽_p(x)`, so the finite-residue-extension split theorem does not apply.

The derived h-descent theorem uses the derived Čech nerve even for classical schemes. The map `Sym_ℂ(ℂ[2])→ℂ` illustrates the boundary of this scope: its pullback kills the nonzero localization obtained by inverting the degree-two generator. Perfect-scheme v-hyperdescent is proved through bounded Tor strata; fixed `W_n`, completed W and p-supported W require their separate coefficient/effectivity arguments. A supported `Cone(p^m)` has locally constant degree m. This last construction uses the inverse of a sheafified truncation, and supplies no objectwise inverse to the full α-map.

### Dependencies

Layers 1–3; StableHomotopyKTheory Layers 5 and 7; GeneralAlgebraicKTheory §4.14 and its filtered continuity in §11.8; EnhancedDerivedSheaves E1, E2.8, E4 and E5:animation; SchemeAndStackFoundations §§0.24–0.26, 2.12–2.14 and SF.4–SF.5. Import Nisnevich topology, henselian points and abelian dimension bounds, together with perfect-scheme h-hyperdescent. The qcqs spectral criterion, h-to-v approximation, v-hyperdescent and Brown/coniveau filtered comparison are constructed here.

## Layer 5: Projective bundles, Bass theory and blowups

### 5.1 The graded proof of G-homotopy invariance

For a nonnegatively graded Noetherian S flat over `R=S₀` with R of finite flat dimension over S, extension from R gives `Gᵢ(R)⊗ℤ[σ,σ⁻¹]≃KᵢMgr(S)`, `σ(M)=M(−1)`. Resolve by modules Tor-independent of R to construct the inverse. The nonnegative grading version uses `ℤ[σ]`. ([Weibel, Example V.3.5.2 (PDF p. 396; book p. 388)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.3.5.2 (PDF p. 396)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Exercise V.3.3 (PDF p. 404; author-copy book p. 396)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Quillen, §6, Lemma 1 and Theorem 6, published pp. 117–118 (PDF pp. 33–34)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)).

For `S=R[u,t]`, both variables of degree one, dehomogenization M↦M/`(t−1)` is exact and identifies the Serre quotient by t-power-torsion graded modules with finite `R[s]`-modules, u↦s. Dévissage identifies the kernel's K-theory with graded `R[u]`-modules. A t-torsion graded module can have infinitely many nonzero homogeneous components. ([Weibel, Theorem V.6.2, proof (PDF p. 415; book p. 407)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.6.2, proof (PDF p. 415)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

The graded calculation gives `G(R)≃G(R[s])` for Noetherian R, with inverse evaluation at `s=1`, a finite-Tor pullback. Establish spectrum equivalence, not only the degree-zero isomorphism. ([Weibel, Theorem V.6.2 (PDF p. 415; book p. 407)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.6.2, proof (PDF p. 415)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

The zero-section transfer into `X[s]` is nullhomotopic: its two-term Koszul resolution has equal terms and additivity gives cancellation. Treat G for Noetherian X and perfect K for qcqs X. The unit section of `X[s,s⁻¹]` gives a left inverse to projection pullback. It does not give a two-sided inverse: the Laurent G-theory has the additional shifted summand below. ([Weibel, Example V.3.6.1 (PDF p. 397; book p. 389)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example V.3.5.1 (PDF p. 396)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Use finite Zariski descent to globalize G-homotopy invariance to every Noetherian scheme, and iterate for affine spaces of all finite dimensions. The zero-section pullback supplies the inverse. ([Weibel, Theorem V.6.13 (PDF p. 425; book p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.6.13, proof (PDF p. 425)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Zero-section localization and G-homotopy invariance give `Gₙ(X[s,s⁻¹])≃Gₙ(X)⊕Gₙ₋₁(X)` for Noetherian X and `n≥0`, setting `G₋₁=0`. Specify the parameter-product splitting and evaluation section. ([Weibel, Theorem V.6.13 (PDF p. 425; book p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.6.13, proof (PDF p. 425)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 5.2 Regular K-theory and Laurent extension

For regular Noetherian X, Cartan transfers G-homotopy invariance to nonconnective K in every degree, hence `NKₙ(X)=0`. This proof uses regular negative vanishing and not the later Bass decomposition, avoiding a circular dependency. ([TT90, Proposition 6.8 (p. 362; PDF p. 116)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proposition 6.8, proof (p. 362; PDF p. 116)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Corollary V.6.13.2 (PDF p. 425; book p. 417)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example III.3.8.1 (PDF p. 215; book p. 207)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Regular Noetherian X has `Kₙ(X[T,T⁻¹])≃Kₙ(X)⊕Kₙ₋₁(X)`, including `n=0` and negative degrees by vanishing. Restriction from X supplies the first summand; the parameter and localization boundary give the second. ([TT90, Proposition 6.8, proof (p. 363; PDF p. 117)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Corollary V.6.13.2 (PDF p. 425)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Regular Noetherian X has no negative K-groups, by the Schlichting negative-G theorem and regular Cartan equivalence. This is a recalled consequence of Layer 2, not another construction of negative K. Singular nodal curves test the necessary regularity hypothesis. ([TT90, Proposition 6.8(b) (p. 362; PDF p. 116)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proposition 6.8, proof (p. 363; PDF p. 117)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Exercise III.4.12 (PDF p. 224; book p. 216)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 5.3 Projective cohomology and the Koszul relation

For a rank-r bundle E, `r≥1`, use the quotient projective bundle π:`P(E)→X`. Its cohomological dimension on quasicoherent sheaves is at most `r−1`. For `r≥2`, `π_*O(n)=SymⁿE` and `R^{r−1}π_*O(n)=(Sym^{−r−n}E)∨⊗(det E)∨`, with negative symmetric degrees zero and all other groups zero. For `r=1`, `P(E)=X` and `O(n)=E^{⊗n}` for every integer. Include Serre vanishing over Noetherian bases and arbitrary-base coefficient/base-change formulas. ([TT90, Recollection 4.5(b), (e) (p. 330; PDF p. 84)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Recollection 4.5(e) (p. 330; PDF p. 84)](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks, Lemma 30.8.4, Tag 01XX (Cohomology of Schemes, Section 30.8)](https://stacks.math.columbia.edu)).

The surjection `π*E⊗O(−1)→O` has an exact Koszul complex. Its alternating K₀ relation is `Σᵢ(−1)ⁱ[π*ΛⁱE⊗O(m−i)]=0`, with the dual exact sequence as well. For E trivial this gives `(1−[O(−1)])ʳ=0`. Construct the Koszul functor on the already supplied exterior powers. ([TT90, Section 4.6 (p. 331; PDF p. 85)](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks, Lemma 30.8.4, proof, Tag 01XX](https://stacks.math.columbia.edu)).

### 5.4 Regularity and Quillen’s resolution

Let X be Noetherian and E a finite locally free sheaf of constant `rank r≥1`. Work on the quotient `P(E)`. Quillen’s Tᵢ on coherent sheaves are coherent-valued; their bundle-valued restriction is a distinct exact subcategory.

Extend the field projective-space predicate supplied by AlgebraicModuliForArithmeticGeometry §1.5 to a relative projective bundle over a Noetherian base: define m-regularity by `R^qπ_*F(m−q)=0` for `q≥1`. Distinguish the exact category of regular coherent sheaves, its vector-bundle subcategory, and the perfect-complex model. Tᵢ lands in coherent sheaves on the first and in vector bundles only on the second. The comparison `MumfordRegular.fieldComparison` identifies the relative predicate for `X=Spec` k and `E=kʳ` with the supplied `ProjectiveBundles.IsCMRegular`; no second field-only regularity theory is constructed. ([TT90, Section 4.7.0 (p. 331; PDF p. 85)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Definition II.8.7.1 (PDF p. 158; book p. 150)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `MumfordRegular` — For `m ∈ ℤ` and F quasi-coherent on `P(E)`: MumfordRegular m F :⇔ ∀ `q ≥ 1`, `R^qπ_*(F(m − q)) = 0`.
- `MumfordRegular.twist` — MumfordRegular m `(F(n))` ↔ MumfordRegular `(m + n)` F.
- `MumfordRegular.mono` — MumfordRegular m F → MumfordRegular k F for every `k ≥ m` (Thomason–Trobaugh 4.7.2(a)).
- `MumfordRegular.of_extension` — For `0 → F → G → H → 0`: F, H m-regular ⇒ G m-regular; G m-regular and F `(m+1)`-regular ⇒ H m-regular `(4.7.1(a), (b))`.
- `MumfordRegular.acyclic` — A 0-regular F satisfies `R^qπ_*(F(n)) = 0` for `q > 0` and `n ≥ −q`; in particular F is `π_*`-acyclic (K-book II.8.7.3(2)).
- `MumfordRegular.globallyGenerated` — If F is m-regular then `π^*π_*F(k) → F(k)` is surjective for `k ≥ m` `(4.7.2(c))`.
- `MumfordRegular.exists` — For X noetherian and F coherent, ∃ m₀, ∀ `m ≥ m₀`, MumfordRegular m F `(4.7.0)`.
- `MumfordRegular.pullback` — For N quasi-coherent on X and `n ≥ 0`, `π^*N ⊗ O(n)` is 0-regular and `π_*(π^*N ⊗ O(n)) ≅ Sym^n E ⊗ N` (K-book II.8.7.2).
- `MumfordRegular.baseChange` — For a flat morphism g: `X′ → X`, `F m-regular ⇒ g′^*F m-regular` on `P(g^*E)` (flat base change of `R^qπ_*`).
- `MumfordRegular.vectorBundleCategory` — `MR_VB(E)` is the full exact subcategory of finite locally free, 0-regular sheaves; its inclusion into MR(E) and Vect(`P(E)`) is exact.
- `MumfordRegular.fieldComparison` — For `X=Spec` k and `E=kʳ`, the relative higher-direct-image predicate agrees with the supplied IsCMRegular predicate on `P^{r−1}_k`.

**Checks.**

- On P¹, `O(n)` is 0-regular exactly for `n≥0`; `O(−1)` is 1-regular but fails 0-regularity because `H¹(O(−2))=k`.
- For rank-one E, π is an isomorphism and every quasicoherent sheaf is m-regular for all m.
- For `E=kʳ`, the condition is the classical vanishing `H^q(F(−q))=0` for `q>0`.
- The Euler sequence has regular middle and quotient but nonregular kernel `O(−1)`; this category is not closed under kernels of surjections.
- A skyscraper at a rational point is regular coherent, but not a vector bundle.

Over a Noetherian base, coherent sheaves are eventually regular. Prove the three exact-sequence regularity bounds, propagation from m to every `k≥m`, surjectivity of multiplication by E on sections, and relative generation of `F(k)`. The kernel bound includes the stated surjectivity on direct images. ([TT90, Section 4.7.0 (p. 331; PDF p. 85)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Lemma 4.7.1 (p. 332; PDF p. 86)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Lemma 4.7.2 (p. 332; PDF p. 86)](https://gwern.net/doc/math/1990-thomason.pdf)).

For regular F define `Z₋₁F=F`, `TₙF=π_*((Zₙ₋₁F)(n))`, and ZₙF as the evaluation kernel. Prove exactness of T₀,…,Tᵣ₋₁ and the finite resolution of F by `π*TᵢF⊗O(−i)`. On bounded regular coherent complexes Tᵢ preserves cones, acyclicity, quasi-isomorphisms and supports; on perfect complexes its values are perfect. Retain the companion exact sequences relating `T_k` to SymⁱE and `π_*F(k)`. ([TT90, Section 4.8 (p. 333; PDF p. 87)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Lemma 4.8.4 `[4.8.3]` (p. 334; PDF p. 88)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Section 4.8.5 (p. 334; PDF p. 88)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem II.8.7.8 (PDF p. 159; book p. 151)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `quillenT` — The functor `T_n`: 0-regular coherent sheaves on `P(E)` → coherent sheaves on X, `T_nF = π_*((Z_{n−1}F)(n))`.
- `quillenZ` — The functor `Z_n` with `Z_{−1} = id` and `Z_nF = ker(O(−n) ⊗ π^*T_nF → Z_{n−1}F)`.
- `quillenResolution` — The natural exact sequence `0 → O(−r+1) ⊗ π^*T_{r−1}F → ⋯ → O ⊗ π^*T_0F → F → 0`.
- `quillenT_exact` — Each `T_i` is an exact functor on MR(E), and on `MR_perf(E)` it preserves cofibrations, cones and quasi-isomorphisms. On `MR_VB(E)` they are exact functors to Vect(X).
- `quillenT_zero` — `T_0 = π_*` on 0-regular sheaves.
- `quillenT_pullback` — `T_0(π^*N) = N` and `T_i(π^*N) = 0` for `i ≥ 1`.
- `quillenZ_last` — `Z_{r−1}F = 0` for F 0-regular.
- `quillenT_perfect` — If `F^• ∈ MR_perf(E)` then `T_kF^•` is a perfect complex on X, acyclic off Y if `F^•` is acyclic off `π⁻¹(Y)`.
- `quillenT_vectorBundle` — If F is a 0-regular vector bundle, each `T_iF` is a vector bundle (K-book II.8.7.9).
- `quillenResolution_class` — `[F] = Σ_{k=0}^{r−1} (−1)^k [O(−k) ⊗ π^*T_kF]`, in vector-bundle K₀ for `F∈MR_VB(E)`, in perfect K₀ for `F∈MR_perf(E)`, and in G₀ for `F∈MR(E)`. A general regular coherent sheaf need not have a perfect K₀ class.

**Checks.**

- For `O(1)` on P¹, `T₀=k²`,`T₁=k` and the resolution is `0→O(−1)→O²→O(1)→0`.
- For `π*N`, only `T₀=N` survives and the resolution is the identity.
- The alternating Tᵢ expression reconstructs F in vector-bundle K₀ for regular vector bundles, in G₀ for regular coherent sheaves, and in perfect K₀ for the perfect-complex model.
- If `F=O(−1)`, all the attempted Tᵢ vanish although F does not; the resulting complex is not exact, detecting the regularity hypothesis.
- For rank-one E over `Spec(k[ε]/ε²)`, the coherent sheaf `F=k` is 0-regular and `T₀F=k`. It is not perfect and T₀F is not a vector bundle; its class identity belongs to G₀, excluding an unqualified perfect-K₀ formulation.

### 5.5 The projective bundle equivalence

For the Noetherian argument allow arbitrary closed supports. For the final qcqs version require the support complement quasi-compact. The basis is `O(−i)`, `0≤i<r`, where r is the rank rather than the relative dimension.

For Noetherian X with support Y, the basis map u:`∏ᵣK(X on Y)→K(P(E) on P(E)_Y)` has a left inverse. Apply the r twisted pushforwards; their composite with u is lower triangular, with entry `Sym^{n−k}E` for `n≥k` and identity diagonal. Invert that matrix in spectra. ([TT90, Section 4.10 (p. 335; PDF p. 89)](https://gwern.net/doc/math/1990-thomason.pdf)).

The inclusion of regular perfect coherent-complex models into all perfect coherent-complex models is a K-equivalence. Quillen's resolution expresses it as `Σᵢ(−1)ⁱπ*Tᵢ⊗O(−i)`, giving a right inverse to u. Keep this model separate from regular vector bundles. ([TT90, Section 4.9 (p. 335; PDF p. 89)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Section 4.11 (p. 336; PDF p. 90)](https://gwern.net/doc/math/1990-thomason.pdf)).

Together the two splittings prove the supported projective-bundle equivalence over Noetherian X, with basis O,`O(−1)`,…,`O(−r+1)`. Extend from connective to nonconnective theory by the chosen localization-compatible model, not by an unsupported inference from positive groups. ([TT90, Section 4.12 (p. 336; PDF p. 90)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Variant V.1.5.3 (PDF p. 378; book p. 370)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For arbitrary qcqs X, descend the bundle, support and perfect finite diagrams to a Noetherian approximation and use continuity. Obtain `∏ᵣ𝕂(X on Y)≃𝕂(P(E) on P(E)_Y)`, natural in base change, with the same basis and no regularity hypothesis on X. ([TT90, Theorem 4.1 (p. 329; PDF p. 83)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 7.3 (p. 364; PDF p. 118)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Section 4.3 (p. 329; PDF p. 83)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Projective Bundle Theorem II.8.5 (PDF p. 157; book p. 149)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Projective Bundle Theorem V.1.5 (PDF p. 377; book p. 369)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

On `P¹_X`, `[O(m)]=(m+1)[O]−m[O(−1)]` for every integer m. The two basis coordinates are `π_*a` and `σ*a−π_*a`, where `π_*` is proper pushforward and σ a standard section. Over a field these are `(χ,rank−χ)`; a rational skyscraper is `1−[O(−1)]`, and `K₁(P¹)=k×⊕k×`. ([Weibel, Theorem V.1.5.4 (PDF p. 379; book p. 371)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, Theorem 6.1, proof (p. 352; PDF p. 106)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Corollary II.8.6 (PDF p. 157; book p. 149)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 5.6 Bass contraction and Nil terms

Let X be qcqs, Z closed with quasi-compact complement, and n any integer. Use nonconnective supported K throughout the Bass argument. The ring fundamental theorem is an independent categorical supplier; the scheme result is proved from the geometric projective bundle theorem.

Define the polynomial, inverse-polynomial and Laurent schemes by base change from ℤ, with their projection, zero/unit sections and overlap maps. Set `NKₙ(X)=coker(Kₙ(X)→Kₙ(X[T]))≃ker(z*)`, in every integer degree; define the inverse-variable and supported variants. Evaluation splits polynomial extension. ([Weibel, Section V.8, Theorem V.8.3 (PDF p. 439; book p. 431)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example III.3.8.1 (PDF p. 215; book p. 207)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `Scheme.polynomialExtension` — `X[T]` := pullback of `X → Spec` ℤ and `Spec ℤ[T] → Spec ℤ`, with p, z and e; it is Mathlib's `𝔸(1; X)`.
- `Scheme.laurentExtension` — `X[T, T⁻¹]` := pullback of `X → Spec` ℤ and Spec (LaurentPolynomial ℤ) → `Spec ℤ`, with j₊, j₋ and e.
- `laurentExtension_isOpen` — j₊: `X[T, T⁻¹] → X[T]` is the open immersion of the locus `T ≠ 0` (LaurentPolynomial.isLocalization).
- `NK` — `NK_n(X on Z)` := `coker(p^*: K_n(X on Z) → K_n(X[T] on Z[T]))`.
- `NK_eq_ker` — The composite `ker(z^*) → K_n(X[T]) → NK_n(X)` is an isomorphism.
- `K_polynomialExtension_split` — `K_n(X[T]) ≅ K_n(X) ⊕ NK_n(X)`, naturally in X.
- `NK.map` — A morphism f: `X′ → X` induces `NK_n(f)`: `NK_n(X) → NK_n(X′)`, with `NK_n(id) = id` and `NK_n(g ∘ f) = NK_n(f) ∘ NK_n(g)`.
- `NK_inv` — T ↦ T⁻¹ gives N₋`K_n(X) ≅ NK_n(X)`.
- `NK_affine` — Under Layer 2, `NK_n(Spec R) ≅ NK_n(R)` of GeneralAlgebraicKTheory §§9.8 and 10.5.
- `NK_eq_zero_of_regular` — X regular noetherian ⇒ `NK_n(X) = 0` for all n (Layer 5).

**Checks.**

- For `A=k[ε]`/ε², the unit `1+εT` gives a nonzero element of NK₁, identified with the additive group `T·k[T]`.
- For fields and for the empty scheme all NK groups vanish.
- The affine construction agrees with the ring NK quotient in every integer degree.
- Evaluation at zero kills `[1+εT]`, while evaluation at one gives `[1+ε]≠0`; these provide different complements to constant classes although they identify the same quotient.

Mayer–Vietoris on P¹ and the projective-bundle basis give `0→Kₙ(X on Z)→Kₙ(X[T] on Z[T])⊕Kₙ(X[T⁻¹] on Z[T⁻¹])→Kₙ(X[T,T⁻¹] on Z[T,T⁻¹])→Kₙ₋₁(X on Z)→0`. The middle map is `j₊*−j₋*`. Describe the associated stable cofiber sequence and the resulting Bass contraction. ([TT90, Theorem 6.6(b) (p. 361; PDF p. 115)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 6.1, proof (p. 353; PDF p. 107)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.8.3 (PDF p. 439; book p. 431)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Prove `bassBoundary_parameter`: orient the Mayer–Vietoris connecting map by `∂_T[T]=+1∈K₀(ℤ)`, with the difference of restrictions `j₊*−j₋*`. Prove `bassBoundary_parameterProduct`, `∂_T([T]∪x)=x`, so `bassBoundary_section` `h_T=[T]`∪− splits `∂_T` in all degrees with supports. The boundary is right-linear, as in §3.3. Thomason–Trobaugh explicitly compute the positive sign at the end of the proof of 6.1(b), printed p.354; the comparison identifies this actual connecting map, including its suspension convention. ([TT90, Theorem 6.1(b) (p. 352; PDF p. 106)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Theorem 6.1, proof (p. 354; PDF p. 108)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem V.8.2 (PDF p. 438; book p. 430)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Obtain `Kₙ(X[T,T⁻¹])≃Kₙ(X)⊕Kₙ₋₁(X)⊕NKₙ(X)⊕N₋Kₙ(X)`, with explicit embeddings. Iterating ordered parameter products and ordered boundaries gives the identity; in particular negative K is a retract of degree-zero Laurent K. Two terms suffice only where both Nil terms vanish. ([TT90, Theorem 6.6(d) (p. 361; PDF p. 115)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Section 6.7 (p. 362; PDF p. 116)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Fundamental Theorem for K0 III.3.7 (PDF p. 214; book p. 206)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Identify the scheme fundamental theorem on `Spec R` with the ring theorem, its NK and Nil groups and its positively normalized boundary. In the ring conventions Nilₙ(R)≃`NKₙ₊₁(R)`. The affine comparison identifies the actual maps, not just abstract decompositions. ([Weibel, Theorem V.8.1 (PDF p. 438; book p. 430)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.8.2 (PDF p. 438; book p. 430)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.8.3, proof (PDF p. 440; book p. 432)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For regular X compare zero-section localization on `A¹_X` with Bass on the punctured line. Their boundaries satisfy `∂_loc=∂_T` and `∂_loc([T]∪x)=x`. Over a field `K₁(k[T,T⁻¹])=k×⊕ℤ[T]`, with `∂_loc[T]=1` and zero boundary on constants. ([Weibel, Example V.6.1.2 (PDF p. 414; book p. 406)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem V.6.2, proof (PDF p. 415; book p. 407)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Corollary V.6.3.1 (PDF p. 416; book p. 408)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 5.7 Regular blowups and derived exceptional maps

Let i:`Y→X` be a Koszul-regular closed immersion of pure codimension `d≥1` in qcqs X. Write `p:X′=Bl_YX→X`, i′:`E→X′`, p′:`E→Y`. Its conormal J/J² is finite locally free of `rank d`. X and Y need not themselves be regular. All twists on X′ restrict to the indicated twists on E.

Use the blowup from StableReduction for a Koszul-regular closed immersion `Y→X` of pure codimension `d≥1`. Its exceptional divisor is `P(J/J²)`, the conormal convention; `O_{X′}(1)=O(−E)`, normal bundle `O_E(−1)`. Establish the regular local projective embedding, perfectness of the blowup map and exceptional immersion, their complement isomorphism, and the `d=1` identity. ([Thomason93, §1.2 (p. 197)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Stacks, Lemma 31.33.4, Tag 02OS (Divisors, Section 31.33)](https://stacks.math.columbia.edu); [Stacks, Lemma 10.69.2, Tag 00LN (Algebra, Section 10.69)](https://stacks.math.columbia.edu)).

For the blowup projection p, `F→Rp_*Lp*F` is an equivalence on perfect objects. For the exceptional projective projection p′ the analogous unit is an equivalence and `Rp′_*(O(−i)⊗Lp′*G)=0` for `1≤i≤d−1`. These are derived adjunction statements. ([Thomason93, Lemme 2.3 (p. 200)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, Lemme 2.3, démonstration (p. 200)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

For an effective Cartier divisor i:`D→W` with conormal line N, construct the natural triangle `(N⊗F)[1]`→Li*`Ri_*F→F→(N⊗F)[2]` for perfect F. The conormal, shift and counit direction follow from the two-term ideal resolution. ([Thomason93, Porisme 3.5, (3.5.2) (p. 213)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, Porisme 3.5, démonstration (p. 213)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

For `1≤k<d`, let `A′_k` be the subcategory defined by vanishing of `Rp_*(E(i))`, `0≤i<k`. For `E∈A′_k`, construct `blowup_exceptionalApproximation`, the map `(i′_*Lp′*Rp′_*(Li′*E⊗O(k−1))⊗O(−k))[−1]→E`, whose cone lies in `A′_{k+1}`. For `d≥2` also prove `blowup_exceptionalRecovery`: `F≃Rp′_*(Li′*i′_*Lp′*F⊗O(−1))[−1]`. Keep Li′* explicit. Both assertions use the vanishing of `O(−1)` on projective fibres of positive dimension; they do not apply at `d=1`. The initial step `A′_0→A′_1` instead uses the cone of `Lp*Rp_*E→E`. ([Thomason93, Lemme 2.4, pp.200–202; Lemme 2.5, pp.202–203](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf).)

**Checks.**

- For a codimension-two point, p′ has fibre P¹ and `RΓ(O(−1))=0`; derived self-restriction contributes `F[1]`, so the final shift recovers F.
- At `d=1`, with the origin in A¹ and `F=k`, Li* `i_*k=k⊕k[1]`. Tensor by the trivial conormal inverse and shift by −1 leaves `k[−1]⊕k`, which is not k. This excludes extending exceptional recovery to Cartier blowups.
- At `d=1` the index range `1≤k<d` is empty, and the initial cone vanishes because p is the identity. Zero F gives zero in every comparison.
- On `Bl₀A²`, take `d=2`, `k=1` and `E=O`. The displayed source has zero direct image under p, while `Rp_*O=O`; its cone cannot lie in `A′₂=0`. Here `O∉A′₁`, so the approximation hypothesis excludes it.

On a rank-d projective bundle, a perfect complex whose first d twisted direct images vanish is zero. By the regular projective embedding the same criterion holds on the blowup. Thus `A′_d` is the zero derived category. ([Thomason93, Lemme 2.5 (p. 202)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, Lemme 2.5, démonstration (p. 202)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

### 5.8 The blowup decomposition

Use the regular-immersion blowup square of the preceding subsection. First apply connective Waldhausen additivity; use Laurent contraction to obtain the asserted equivalences in every integer degree.

Realize `A′_0⊃⋯⊃A′_d` as complicial categories and apply Waldhausen additivity: `K(A′_0)≃K(A′_1)×K(X)`, and `K(A′_k)≃K(A′_{k+1})×K(Y)` for `1≤k<d`. The exceptional inclusion is `i′_*`Lp′*`(−)⊗O(−k)`, with no reversed twist. ([Thomason93, §2.7 (p. 204)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

The resulting blowup equivalence is `K(X)×K(Y)^{d−1}→K(X′)`, `(x,yᵢ)`↦`p*x+Σᵢi′_*p′*yᵢ⊗O(−i)`. It is `K(X)`-linear and valid nonconnectively for qcqs schemes with the stated regular immersion; X and Y themselves need not be regular. ([Thomason93, Théorème 2.1 (pp. 198–199)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, §2.1.2 (p. 199)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, §2.6 (p. 203)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

For `d=1` this is the identity. On a regular surface blown up at a codimension-two point, the extra class is `i′_*O_E(−1)=O(E)−1`, whereas `i′_*O_E=1−O(−E)`. Thus `K₀(Bl₀A²_k)=ℤ²` and `K₀(Bl_xP²_k)=ℤ⁴` for rational x. Extend to all exceptional twists using the P¹ recurrence. ([Thomason93, Introduction, (0.2) (p. 195)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Weibel, Example I.5.15.2 (PDF p. 66; book p. 58)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Restriction to the complement kills every exceptional summand, so the images of `Kₙ(X)` and `Kₙ(X′)` in `Kₙ(X∖Y)` agree. For integral X their images in the function-field group agree as well; for a regular arithmetic surface this gives invariance of the K₂ image in its generic fibre. ([Thomason93, Théorème 2.1 and §2.1.2 (p. 199)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, §1.2 (p. 197)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

### 5.9 Comparison with the Bass spectrum

Compare Schlichting IK of scheme perfect Frobenius pairs with the Bass spectrum using its localization-compatible contraction and common connective theory. First identify all nonpositive groups; obtaining a natural spectrum equivalence additionally requires the compatible structure maps, which are part of this target. The ring-only comparison is imported. ([Schlichting, Theorem7.1 and proof](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf); [TT90, 6.6(b)](https://gwern.net/doc/math/1990-thomason.pdf)).

### Examples

For graded `S=R[x]`, the class of `S(−n)` corresponds to `σⁿ[R]`. For `S=R`, the graded formula is the identity on `G(R)[σ,σ⁻¹]`. For `R[u,t]`, the Koszul resolution gives the required Tor-dimension two. The degree-zero reduction functor is not exact on all graded modules: `0→S(−1) —x→ S→k→0` over `k[x]` detects `Tor₁(k,k)`. In the dehomogenization quotient, `S(−n)` becomes `R[s]`, S/tS becomes zero, and S/uS becomes R. The killed module `R[u]=S`/tS has infinitely many nonzero graded components; bounded grading support is the wrong kernel.

For the dual numbers `A=k[ε]`/ε², `G₁(A[s])=G₁(A)=k×` by dévissage. Ordinary perfect K is different: units `1+εs·k[s]` give nonzero `NK₁(A)`. The cusp and doubled affine plane also satisfy G-homotopy invariance, without regularity or separatedness. For regular rings `Kₙ(k[s₁,…,s_m])=Kₙ(k)`, `K₁(ℤ[s])={±1}`, and `K₀(ℤ[√−5][s])=ℤ⊕ℤ`/2. A split nodal cubic, in characteristic different from two, has `K₋₁=ℤ` and supplies the negative control for regular vanishing.

The zero-section transfer sends O to the two equal free terms of its Koszul resolution, hence to zero in K₀ and G₀, even though its pushforward sheaf is nonzero. On a field, the Laurent group `K₁(k[s,s⁻¹])` is `k×⊕ℤ[s]`; the localization boundary sends `[s]` to one. For ℤ it is `{±1}⊕ℤ[s]`. G₀ of a Noetherian Laurent extension equals G₀ of the base. Regular Dedekind bases also preserve their rank/ideal-class K₀ under Laurent extension.

On P¹, `h⁰(O(n))=n+1` for `n≥0`, `h¹(O(n))=−n−1` for `n≤−2`, and `χ(O(n))=n+1` for every integer n. In `rank r≥2`, `Rπ_*O(−1)=0` and `Rπ_*O(−r)=(det E)∨[−(r−1)]`. In rank one `P(E)=X` and `O(n)=Eⁿ`, including negative n. Rank zero gives the empty projective bundle, handled as a separate zero case. The rank-two Koszul relation is `1−2[O(−1)]+[O(−2)]=0`. For a non-self-dual E the dual Koszul sequence must use E∨.

On `P^{r−1}_k` with `r≥2`, `O(n)` is m-regular precisely when `m+n≥0`. A point sheaf on P¹ is regular for every m. `O(−1)` is not 0-regular and has zero direct image, so its evaluation map cannot generate it. For `F=O(1)`, Quillen's construction has `T₀=k²`, `Z₀=O(−1)`, `T₁=k` and the Euler resolution `0→O(−1)→O²→O(1)→0`. For `π*N`, `T₀=N` and all higher Tᵢ vanish. One Koszul step replaces `O(−1)` by `[O²→O(1)]` of regular coherent sheaves. This verifies why that approximation model is larger than regular vector bundles.

For `r=2` the twisted-pushforward matrix is `[[1,0],[E,1]]`, becoming `(a₀,a₁)`↦`(a₀,2a₀+a₁)` over a field. For `r=1` it is the identity. Thus `Kₙ(P^{r−1}_k)=Kₙ(k)^r` in all integer degrees, with `K₀=ℤʳ` and `K₁=(k×)ʳ`. For Pⁿ the ring presentation is `K_*(X)[z]`/`z^{n+1}`, `z=1−[O(−1)]`, including the exponent `n+1`.

On P¹, `O(1)` has coordinates `(2,−1)`, `O(−2)` has `(−1,2)`, and `O(m)` has `(m+1,−m)`. A class of `rank r` and degree d has `(r+d,−d)`. A rational point is `1−[O(−1)]`. In degree one, restriction to `k(t)` multiplies the two k× coordinates; its kernel is the point-class copy of k× and its image is the constant units. The coherent basis `(π*,∞_*)` corresponds to O and the point class under regular Cartan.

The Bass boundary `∂_T[T]=1` is split by `[T]∪−`. Ordered iteration of k parameters followed by the ordered boundaries gives the identity, with the empty iteration also the identity. Zero-section localization sends `[T]∪x` to x with the same right-linear convention, so `∂_loc=∂_T`. Replacing T by T⁻¹ changes the degree-one boundary to −1; it does not preserve the chosen section. The degree-zero Bass cokernel defines K₋₁ and embeds it as a retract of degree-zero Laurent K. For the dual numbers both NK₁ copies survive; omitting them gives the wrong four-term decomposition. Affine `Nilₙ=NKₙ₊₁` uses the ring theorem's indexing.

For a blowup along a Cartier divisor, `d=1`, `X′=X` and there are no exceptional summands. For a codimension-two point on a regular surface, the extra summand is `i′_*O_E(−1)=O(E)−1`. Its untwisted counterpart is `1−O(−E)`, and both restrict to zero off E. The Cartier self-intersection triangle has E in degrees −1,0 after derived restriction, fixing the shift by `[1]`. On a rank-d projective bundle the first d vanishing twisted pushforwards force the object to vanish; for `d=1` this is the identity assertion. For `d=2` the Waldhausen filtration leaves `K(X)×K(Y)` and no final remainder.

Consequently `K₀(Bl₀A²_k)=ℤ²`, `K₁(Bl₀A²_k)=k×⊕k×` and `K₀(Bl_xP²_k)=ℤ⁴` for rational x. On the last surface this agrees with `rank ℤ`, Picard ℤ² and zero-cycle degree ℤ. Every exceptional summand vanishes on the complement, so a blowup at a closed special-fibre point of a regular arithmetic surface preserves the rational image of K₂ in the generic-fibre K₂. The comparison of Bass and Frobenius spectra must identify their structure maps as well as all their groups.

### Dependencies

Layers 1–4; GeneralAlgebraicKTheory Layers 5–6 and the independent ring Bass theorem in §10.5; SchemeAndStackFoundations §§0.3, 2.6 and 5.4 for relative Proj, relative Serre vanishing and projective geometry; AlgebraicModuliForArithmeticGeometry §1.3 for the flag construction over that geometry; AlgebraicVectorBundles for exterior powers; StableReduction Layer 4 for Rees blowups. The K-theoretic exceptional and Koszul arguments are here. The excess-intersection theorem in Layer 7 is not used to prove the decomposition.

## Layer 6: Products, λ-operations and Adams weights

### 6.1 Tensor, external and relative products

Use qcqs schemes and closed supports with quasi-compact complements. G-variables require Noetherian schemes, including the relevant fibre product. The products in this subsection add K-degrees and carry all the symmetry signs of spectra.

Derived tensor on flat perfect models gives supported `K∧K` and `K∧G` pairings into intersected supports, in all integer degrees nonconnectively. Establish the natural transformations for enlargement of support and identify the unrestricted pairings of Layer 2. ([TT90, 3.15, pairings (3.15.4) and (3.15.5) (printed p. 318)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 3.15 (printed p. 319)](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.supportPairing` — The pairing `K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z)`.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul` — The bilinear product `K^Y_m(X) ⊗ K^Z_n(X) → K^{Y∩Z}_{m+n}(X)`.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_forget` — Forgetting supports commutes with the products.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_self` — For `Y = Z = X` the product is that of Layer 2.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_zero_class` — On `π_0` the product of `[E]` and `[F]` is `[E ⊗^L F]`.
- `TauCeti.AlgebraicGeometry.KTheory.gSupportPairing` — The pairing `K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z)`, X noetherian.

**Checks.**

- Disjoint supports give zero products.
- The x- and y-divisor Koszul classes on A² multiply to the origin class.
- On A¹ with origin support, the generator has square zero because `k⊗ᴸk` has two opposite Euler terms; the supported ring need not have a unit.
- Full support recovers Layer 2.
- A proper clopen component is a different case: its supported ring does have the component's unit.

For qcqs S-schemes X,Z, external derived pullback and tensor gives `K(X on Y)∧K(Z on W)→K(X×_SZ on Y×_SW)`; no flatness of `X→S` is needed for perfect K. For `K(X)∧G(Z)→G(X×_SZ)`, require X flat over S and both Z and the product Noetherian, so projection to Z has coherent flat pullback. Expose associativity and pullback naturality; derived diagonal pullback gives the internal K-product. ([TT90, 3.15 (printed p. 319)](https://gwern.net/doc/math/1990-thomason.pdf); [Soulé, Théorème 7 v) (p. 533)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.externalPairing` — ⊠: `K(X on Y) ∧ K(Z on W) → K(X ×_S Z on Y ×_S W)`.
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_assoc` — `(x ⊠ y) ⊠ z = x ⊠ (y ⊠ z)` under the associativity isomorphism of fibre products.
- `TauCeti.AlgebraicGeometry.KTheory.diag_externalMul` — `Δ^*(x ⊠ y) = x·y`.
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_pullback` — `(f × g)^*(x ⊠ y) = f^*x ⊠ g^*y` for maps of S-schemes.
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_one` — `[O_X] ⊠ y = pr_2^*y`.
- `TauCeti.AlgebraicGeometry.KTheory.gExternalPairing` — `K(X) ∧ G(Z) → G(X ×_S Z)` for X flat over S and noetherian Z and `X ×_S Z`.

**Checks.**

- Taking `X=Z=S` gives the product on S, and `[O_X]⊠[O_Z]` is the unit on the product scheme.
- The external product of the two P¹ hyperplane classes is the point class on `P¹×P¹`.
- Derived diagonal pullback of an external product is the internal tensor product.
- With `S=Spec` ℤ and `X=Z=Spec` 𝔽₂, neither factor is flat over S, but the two structure-sheaf classes still have external perfect K-product 1 on `Spec 𝔽₂`. This case is outside the stated coherent external-pairing hypothesis.

For qcqs f:`X′→X` define `K(f)=fib(f*:𝕂(X)→𝕂(X′))`. It is a `K(X)`-module with its right-linear long exact sequence. For a quasi-compact open immersion it is supported K of the closed complement; for a closed immersion it is relative K of the ringed pair, a different construction from supported K. ([Weibel, Relative K-groups IV.1.11 (PDF p. 275)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, 3.15 (printed p. 319)](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.relative` — `K(f) = hofib(f^*: K(X) → K(X'))`.
- `TauCeti.AlgebraicGeometry.KTheory.relative_les` — The long exact sequence ⋯ → `K_{n+1}(X') → K_n(f) → K_n(X) → K_n(X')` → ⋯.
- `TauCeti.AlgebraicGeometry.KTheory.relative_module` — `K_*(f)` is a graded `K_*(X)`-module and the long exact sequence is `K_*(X)`-linear.
- `TauCeti.AlgebraicGeometry.KTheory.relative_open_immersion` — For an open immersion j: `U → X` with closed complement Y, `K(j) ≃ K(X on Y)` as `K(X)`-modules (nonconnective).
- `TauCeti.AlgebraicGeometry.KTheory.relative_map` — A commutative square of schemes induces a map of relative K-theories, functorially.

**Checks.**

- The fibre for an identity map is zero.
- For an open immersion it is supported K and has the same connecting map.
- For the generic point of a DVR its zeroth group is ℤ and the connecting map is valuation.
- For `Spec ℚ→Spec ℤ`, the map on absolute K₀ is an isomorphism but the fibre K₀ is `⊕_pℤ`. A cokernel definition would give the wrong answer.

Pullback preserves the supported tensor product and unit, commutes with enlargement and external products, and satisfies the supported proper projection formula whenever the transfer of Layer 2 exists. Give the target support `f(W)∩Y` and the coherent variant explicitly. ([TT90, 3.15 (printed p. 319)](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, Proposition 3.17 (printed p. 320)](https://gwern.net/doc/math/1990-thomason.pdf)).

The tensor pairings make `⊕_{n∈ℤ}Kₙ(X)` a unital graded-commutative ring, `xy=(−1)^{mn}yx`. Supported groups are possibly nonunital graded rings and `K_*(X)`-modules; G is a K-module over Noetherian X. These are the actual degree-adding tensor products. ([TT90, 3.15 (printed p. 319)](https://gwern.net/doc/math/1990-thomason.pdf); [Weibel, Theorem IV.1.10 (PDF p. 274)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Compare the π₀ tensor product with the finite-projective K₀ ring and the `K₀×K₁` product with `id_P⊗α`. On affine rings compare the `K₁×K₁` product with Loday's product in K₂, retaining the ordered unit notation. ([Weibel, Theorem IV.1.10 (PDF p. 274)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Riou, Remark 3.2.2 (p. 13)](https://arxiv.org/pdf/0907.2710)).

### 6.2 Nonunital λ-algebras and weighted filtrations

Construct the special λ-ring foundations below before the nonunital scheme and support comparisons. For a general augmented ring specify a λ-section whenever a weight-zero lift is used.

#### 6.2.1 Pre-λ-rings, morphisms and ideals

For a commutative ring R define `TauCeti.LambdaRing.PreLambda` by operations `λⁿ : R → R`, with `λ⁰(x)=1`, `λ¹(x)=x` and `λⁿ(x+y)=Σ_(i+j=n) λⁱ(x)λʲ(y)`. Equivalently the total operation is an additive-to-multiplicative homomorphism `λ_t : R → 1+tR[[t]]` with linear coefficient x. Define `TauCeti.LambdaRing.Hom` as a ring homomorphism commuting with all coefficients, `TauCeti.LambdaRing.Ideal` as an ideal stable under positive λ-operations, and `TauCeti.LambdaRing.IsLineElement` by `λ_t(l)=1+lt`. A line element need not be invertible. The API includes identity, composition and extensionality of morphisms; equivalence of total and coefficient laws; `lambda_zero`, `lambda_neg`, kernel λ-ideals, induced quotient operations, λ-subrings and their inclusions, and uniqueness of quotient and restricted structures. Ideal stability begins at `n=1`. Use Mathlib's BinomialRing for the binomial structure and its pointwise form on locally constant integer functions. Construct the line-monomial structure on MonoidAlgebra ℤ M for a commutative multiplicative monoid M, characterized by `λ_t([m])=1+[m]t`; its API includes monoid-map naturality, basis-monomial values and uniqueness. (Weibel II.4.1–4.1.1, printed p.90, and Exercises 4.1, 4.4, pp.101–102.)

**Checks.**

- In binomial ℤ, `λ²(2)=1` and `λ²(1)=0`; λ² is not additive, and `(2)` is not a λ-ideal.
- The sum-law structure `λ_t(m)=(1+t+t²)^m` on ℤ satisfies the pre-λ axioms but has `λ²(1)=1`. The identity from binomial ℤ to this structure is not a λ-morphism.
- The zero and whole ideals give quotients R and 0; quotienting binomial ℤ by `(2)` cannot preserve λ², since it would identify `λ²(2)=1` with `λ²(0)=0`.
- Zero is a line element and is not a unit in a nonzero ring. In the line structure on `ℤ[u,u⁻¹]`, `λ²(u+u⁻¹)=1`; the integer-polynomial ring `ℤ[u]` has that line structure even though it is not a binomial ring.
- Locally constant operations on two points are componentwise, and the empty space gives the zero ring. The trivial monoid gives binomial ℤ.

#### 6.2.2 Universal identities, specialness and Newton operations

Construct `TauCeti.LambdaRing.productPolynomial` n over ℤ from the elementary symmetric function of the product alphabet, and `TauCeti.LambdaRing.composePolynomial` n m from the alphabet of products of m distinct variables. Their inputs are the elementary symmetric functions of the original alphabets. Prove stability on adjoining unused variables, symmetry, weighted degrees, integrality, uniqueness and evaluation under ring maps. Define `TauCeti.LambdaRing.Special` by the resulting product and iteration identities together with `λⁿ(1)=0` for `n≥2`. The API includes transport, λ-subrings and quotient λ-rings, product and inverse-limit structures, and the integral identity principle: an identity in finitely many iterated λ-operations follows from its value on independent formal line elements. No factorial is inverted. (Weibel II.4.3–4.3.2, pp.92–93.)

Define `TauCeti.LambdaRing.adams` n, `n≥1`, by the integral Newton polynomial: `ψ¹(x)=x`, `ψ²(x)=x²−2λ²(x)` and `ψ³(x)=x³−3xλ²(x)+3λ³(x)`. Give the full recurrence with final term `(−1)^(n−1)nλⁿ(x)`, its generating-series comparison with `−t(λ_(−t))'`/`λ_(−t)`, additivity and naturality. In a special λ-ring prove multiplicativity, preservation of the unit, `ψⁿψᵐ=ψ^(nm)`, commutation with λ, and `ψᵖ(x)`≡xᵖ mod p for a prime p. For a line element l, `ψⁿ(l)=lⁿ`; binomial Adams operations are the identity. Define ψ⁰ only with a specified augmentation and section. (Weibel II.4, pp.93–94, and Exercises 4.6–4.7, p.102.)

**Checks.**

- The second product polynomial is `a₁²b₂+a₂b₁²−2a₂b₂`; on two rank-two classes it gives 6, the exterior-square rank of a rank-four tensor product.
- The second iteration polynomial is `a₁a₃−a₄`; at `(4,6,4,1)` it gives 15, the exterior-square rank of the rank-six exterior square. It concerns `λ²(λ²(x))`.
- The pre-λ structure `(1+t+t²)^m` fails the special unit axiom. Reduction of the integral product polynomials modulo two remains defined and must not require division by two.
- Binomial `ψ²(−1)=−1`, whereas a line u has `ψ²(u)=u²`. Thus Adams operations cannot be defined as power maps on arbitrary elements.
- The identity `ψ²(x)−x²=−2λ²(x)` witnesses the prime congruence integrally. At `n=1` the Newton operation and both special identities reduce to identity.

#### 6.2.3 Exterior operations on projective K₀

For every commutative ring A use the supplied finite-projective K₀ and exterior powers to define `TauCeti.LambdaRing.projectiveTotal` : `K₀(A) → 1+tK₀(A)[[t]]` by `λ_t([P])=Σ_j[ΛʲP]tʲ`. The ordered exterior-sum decomposition makes it a homomorphism; set `TauCeti.LambdaRing.projectiveLambda` n to its nth coefficient. The API includes values on projective generators, zero and unit, convolution, virtual negatives, arbitrary scalar extension, affine sheafification and the pointwise binomial rank formula. The operations are set maps, and their induced pre-λ structure uses the existing K₀ tensor multiplication. For virtual classes, use the formal inverse `λ_t([P]−[Q])=λ_t([P])`/`λ_t([Q])`, with its coefficient recurrence; for `m≥1`, `λⁿ(−m·1)=(−1)^n` binom(`m+n−1`,n). (Weibel II.4.1 and Example 4.1.2, p.90; Exercise 4.1, p.101.)

For a short exact sequence of finite locally free modules define `TauCeti.LambdaRing.exteriorExtensionFiltration` n by `FⁱΛⁿP=im(ΛⁱP'⊗Λ^(n−i)P → ΛⁿP)`, `0≤i≤n`, and `F^(n+1)=0`. Prove decreasingness, `F⁰=ΛⁿP`, the canonical graded-piece isomorphisms `grⁱ≅ΛⁱP'⊗Λ^(n−i)P''`, naturality, base change and the ordered split comparison. This canonical filtration also applies equivariantly without an equivariant splitting and makes exterior operations respect the exact representation relations of §6.3. The underlying exterior functors and their sum comparison are AlgebraicVectorBundles L0C's. (Serre.1968 §3.7, p.51; Weibel II.4.1.2, p.90.)

**Checks.**

- `λ⁰(0)=1`, positive λ of zero vanishes, and `λ²(2·1)=1` although the sum of the two individual λ² values is zero.
- `λ_t(−1)=1−t+t²−t³`+…; omitting the inverse-series rule gives the wrong signs already in degrees two and three.
- A line L gives `1+[L]t`; actual rank-n projectives have zero exterior powers above their rank fibres, including on disconnected spectra.
- For `Ae₁⊂A²` and `n=2`, `F⁰=F¹=A(e₁∧e₂)` and `F²=0`. Changing a complement by e₂↦`e₂+ae₁` leaves the filtration fixed.
- With both endpoints of rank two, the exterior-square graded ranks are 1,4,1. For `P'=0`, all positive filtration terms vanish; `n=0` has only the degree-zero piece A.

Section 6.3.3 proves `TauCeti.LambdaRing.projective_special` by integral representation identities and associated projectives. This precedes use of specialness in the higher-operation construction and does not assume the scheme splitting theorem of §6.6.

#### 6.2.4 Rank augmentation, γ-filtration and its first quotient

For an augmented special λ-ring ε:`R→H` with binomial H define `TauCeti.LambdaRing.gamma` n by `γ_t(x)=λ_(t/(1−t))(x)` and `TauCeti.LambdaRing.gammaFiltration` n as the ideal generated by products `Π_i γ^(k_i)(x_i)`, with `x_i∈ker` ε, each `k_i≥1` and `Σ_i k_i≥n`. The empty product is allowed, so `F⁰=R` and `F¹=ker` ε. Its API includes the inverse substitution `t/(1+t)`, constant and linear coefficients, sum convolution, naturality, `γⁿ(x)=Σ_(j=1)^n binom(n−1,j−1)λʲ(x)` for `n≥1`, antitonicity, multiplicativity, functoriality and `TauCeti.LambdaRing.gammaGraded` `n=Fⁿ/F^(n+1)`. A λ-section of ε supplies the H-action and a weight-zero lift. (Weibel II.4, pp.94–96.)

For `H(A)=LocallyConstant(Spec A,ℤ)` use the geometric rank of SchemeAndStackFoundations §5.7 through the affine comparison. Construct `TauCeti.LambdaRing.rankSection` using the clopen rank fibres and their idempotent projectives, extended additively to integer values. Prove it is a λ-section, independent of a clopen presentation and compatible with scalar extension. Define `TauCeti.LambdaRing.reducedK0` as the rank kernel. With the supplied determinant to the additive Picard group, prove `TauCeti.LambdaRing.gammaFiltration_two_eq_rank_det_kernel`: F² is the simultaneous kernel of rank and determinant. Obtain `gr⁰≅H(A)` and `gr¹≅Pic(A)`, with inverse L↦`[L]−1`, and prove scalar-extension compatibility. On the first reduced quotient `λᵏ(x)`≡`(−1)^(k−1)x` and `ψᵏ(x)`≡kx. The weighted higher-graded extension is the target below. (Weibel II.2.6–2.6.2, pp.73–74; II.4.7–4.7.1, p.96.)

**Checks.**

- `γ_t(1)=1+t+t²`+… and `γ_t(−1)=1−t`, distinguishing γ from λ already in degree two.
- For a line l, `γᵏ(l−1)=0` for `k≥2`. In `ℤ[u,u⁻¹]` with u a line, `Fⁿ=(u−1)ⁿ`.
- In `ℤ[C₂]`, writing σ for its order-two line, `Fⁿ=2^(n−1)ℤ(σ−1)` for `n≥1`; this filtration never vanishes.
- On `Spec(k×k)`, the rank section of `(1,2)` uses different ranks on the two components; on the empty spectrum H and K₀ are zero. Over a field the positive γ-filtration vanishes.
- A line class minus one has rank zero and determinant L; `[A]` has trivial determinant but rank one and is excluded from F². On a Dedekind domain with a nontrivial ideal class, that class survives in gr¹.

#### 6.2.5 Nonunital algebras and their induced filtration

Define a nonunital λ-algebra I over a special λ-ring R by requiring its unitization `R⊕I`, with product `(a,x)(b,y)=(ab,ay+bx+xy)`, to be a special λ-ring with `λ^k(a,x)=(λ^ka,Σ_{i=0}^{k−1}λⁱ(a)λ^{k−i}(x))`. In the higher-degree λ-model `I²=0`; this auxiliary product is distinct from the degree-adding K-product. ([Soulé, Proposition 4 and its explanation (p. 512)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, §1.4 (p. 492)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.LambdaRing.NonUnitalAlgebra` — Non-unital λ-algebras over a special λ-ring `K_0`: operations `λ^k` on I `(k ≥ 1)` and a special λ-ring structure on `K_0 ⊕ I` with the displayed operations.
- `TauCeti.LambdaRing.NonUnitalAlgebra.unitization` — The special λ-ring `K_0 ⊕ I` (Mathlib's Unitization `K_0` I).
- `TauCeti.LambdaRing.NonUnitalAlgebra.lambda_inl_add` — `λ^k(a + x) = λ^k(a) + Σ_{i=0}^{k−1}` `λ^i(a)λ^{k−i}(x)` in `K_0 ⊕ I`, for `k ≥ 1`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.isLambdaIdeal` — I, the kernel of the first projection `K_0 ⊕ I → K_0`, is a λ-ideal.
- `TauCeti.LambdaRing.NonUnitalAlgebra.augmentation` — An augmentation `ε_0`: `K_0 → H` induces the zero-on-I augmentation `ε(a, x) = ε_0(a)`. More generally carry a specified compatible nonunital rank map `ρ:I→H` for which `ε(a,x)=ε_0(a)+ρ(x)` is a λ-augmentation.
- `TauCeti.LambdaRing.NonUnitalAlgebra.lambda_add_of_mul_eq_zero` — If `I·I = 0`: `λ^k(x + y) = λ^k(x) + λ^k(y)` and `ψ^k(x) = (−1)^{k−1}kλ^k(x)` for x, `y ∈ I` and `k ≥ 1`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.ofLambdaIdeal` — A λ-ideal J of `K_0` with the restricted operations: `(a, x)` ↦ `(a, a + x)` identifies `K_0⊕J` with the λ-subring `{(a, c) : c − a ∈ J}` of `K_0 × K_0` (the λ-subring comparison of §6.2.1).
- `TauCeti.LambdaRing.NonUnitalAlgebra.Hom` — Morphisms: `K_0`-linear multiplicative maps commuting with every `λ^k`, `k ≥ 1`.

**Checks.**

- For the square-zero line `ε=u−1` in `ℤ[u±¹]`/`(u−1)²`, `λᵏε=(−1)^{k−1}ε` and `ψᵏε=kε`.
- Zero I recovers the base λ-ring.
- If I is a λ-ideal of R, addition `R⊕I→R` respects λ-operations.
- On a nonzero torsion-free square-zero I and `x≠0`, the proposed `λᵏx=x` would give `ψ²ψ²x=4x` but `ψ⁴x=−4x`. It fails specialness and detects the missing alternating sign.

For a specified λ-augmentation ε on `R⊕I` extending `ε_0`, define `F^n_γI=I∩F^n_γ(R⊕I)`. Then `F⁰I=I`, `F¹I=ker(ε|I)`, the filtration decreases, and `FⁱR·FʲI⊂Fⁱ⁺ʲI`. The formula `F⁰I=F¹I=I` and the square-zero generator formula below require `ε|I=0`; they apply to positive-degree K-groups. For supported K₀ use the rank augmentation `ε(a,x)=a+rank(x)` on `ℤ⊕K₀^Y(X)`, valued in locally constant integers on X, so `F¹K₀^Y=ker(rank|K₀^Y)`. For square-zero I with zero augmentation give its generators `bγʲ(x)` and `aγʲ(x)` with coefficient weight plus j at least n. Prove compatibility with degree decompositions and the quotient augmentation-ring action on gr. ([Soulé, §1.5 (p. 493)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Weibel, IV.5, The γ-filtration (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Expose the following interface:

- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration` — For the specified λ-augmentation ε, `F^n_γI = I ∩ F^n_γ(K_0 ⊕ I)`, a `K_0`-submodule of I, with `F¹I=ker(ε|I)`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_zero_one` — If `ε|I=0`, then `F^0_γI = F^1_γI = I`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_antitone` — `F^{n+1}_γI ⊆ F^n_γI`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.smul_mem_gammaFiltration` — `a ∈ F^i_γK_0` and `x ∈ F^j_γI` give `a·x ∈ F^{i+j}_γI`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_eq_span_of_mul_eq_zero` — If `I·I = 0` and `ε|I=0`, `F^n_γI` is the subgroup generated by `b·γ^j(x)` `(b ∈ K_0, j ≥ n)` and `a·γ^j(x)` `(a ∈ F^i_γK_0, i, j ≥ 1, i + j ≥ n)`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_map` — Augmentation-preserving morphisms of non-unital λ-algebras over `K_0` preserve `F^n_γ`.
- `TauCeti.LambdaRing.NonUnitalAlgebra.gammaGraded` — `gr^n_γI = F^n_γI`/`F^{n+1}_γI`.

**Checks.**

- For the weight-one square-zero line over ℤ, `γ_t(mx)=1+mxt`, so `F¹=I` and `F²=0`.
- All filtrations on zero I are zero. For full support on `Spec k`, `I=K₀(k)=ℤ` and `ε(a,x)=a+x` gives `F¹I=0`; the zero-on-I augmentation would instead give `F¹I=ℤ`.
- For an augmentation λ-ideal `J⊂R`, its positive filtration agrees with the filtration inherited from R.
- Square-zero does not imply weight one: in `ℤ[ε,δ]`/`(ε²,δ²)`, `η=εδ` satisfies `γ_tη=1+η(t−t²)`. Hence `η=−γ²η` and `F²(ℤη)=ℤη`.

In every augmented special λ-ring, for `n≥1` and `k≥1`, `ψ^k` acts on `gr^n_γ` by kⁿ, `λ^k` by `(−1)^{k−1}k^{n−1}`, and γⁿ by `(−1)^{n−1}(n−1)`!. Prove the universal weighted-polynomial remainder for `ψ^kγⁱ`, including the first-graded determinant comparison of §6.2.4; include nonunital modules. ([Weibel, Proposition II.4.9 (PDF p. 105)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, §1.5 (p. 493)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

For a ψ-stable subgroup J with `J=J_a` and `J_{N+1}⊗ℚ=0` in its induced γ-filtration, diagonalize `ψ^k` for `k≥2`: `J_ℚ=⊕_{i=a}^N J^{(i)}`, independent of k, with `ψˡ=lⁱ` on weight i. Construct the Lagrange projectors, identify the filtration with weights `≥i`, and prove products add weights. The augmentation is split by a chosen λ-section, as it is for the scheme rank augmentation; without that section no canonical weight-zero lift is included. ([Weibel, Theorem II.4.10 (PDF p. 106)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Theorem IV.5.11 (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [GS99, Proof of Proposition 8 (p. 48)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf)).

### 6.3 Stable and exact representation rings

Construct the finite algebraic representation rings and their integral character and specialness comparisons in §§6.3.1–6.3.3, then their inverse limit and the exact representation ring of an arbitrary abstract group. A representation on finite projectives is not required to be semisimple.

#### 6.3.1 Integral exact representation groups and characters

Use ReductiveGroups Layers 0–1 and 4 for the affine group-scheme/comodule dictionary, tensor products and diagonalizable gradings, and Layer 9 for split integral group schemes. For a flat coalgebra C over a Dedekind domain A, define `TauCeti.RepresentationRing.projectiveUnderlying` by finite projectivity of the underlying A-module, and `TauCeti.RepresentationRing.coherentUnderlying` by finite generation. Give these full comodule subcategories the underlying-module exact structures and form `TauCeti.RepresentationRing.algebraicK0` and `TauCeti.RepresentationRing.algebraicG0` using the supplied exact Grothendieck group. Their API includes generators, exact additivity, inclusion, corestriction, restriction and generic scalar extension. When C is the coordinate Hopf algebra of a group scheme, tensor is biexact and ordinary duality is exact contravariantly on `projectiveUnderlying`. Finite-projective underlying modules are not projective objects of the comodule category. Over a PID they are finite free. (Serre.1968 §§1.2–1.5 and 2.1–2.3, pp.38–42.)

Prove the finite-subcomodule and finite-projective-cover theorems in this Dedekind-base scope: every finite underlying comodule has a resolution `0→P₁→P₀→E→0` with both Pᵢ finite projective over A. Its Euler class defines `TauCeti.RepresentationRing.algebraicEuler`, independent of the resolution and exact additive, inverse to inclusion on K₀ and G₀. The construction uses underlying flatness and torsion-freeness over A, not categorical projectivity or a split representation sequence. (Serre.1968 Propositions 2–4 and the corollary to Proposition 3, pp.40–42.)

On `algebraicG0` use the ring structure and duality transported through `algebraicEuler`, equivalently the operations of derived tensor and derived duality over A. These use finite-projective resolutions; underived tensor and ordinary duality on `coherentUnderlying` do not define these Grothendieck-group operations.

Define `TauCeti.RepresentationRing.formalCharacter` for a split torus with character lattice X by the finite sum of weight ranks in MonoidAlgebra ℤ X, with X viewed multiplicatively for the group ring. Prove weight extraction is exact, commutes with arbitrary field base change including residue fields, and gives the representation-ring isomorphism with `ℤ[X]`. Its API includes the weight-line inverse, tensor convolution, exterior and dual compatibility, and generic/residue comparison. For a split connected reductive group over any field, prove `TauCeti.RepresentationRing.reductiveCharacterEquiv` onto `ℤ[X]^W`. Include the highest-weight triangularity theorem: dominant weights index absolutely simple rational representations, the highest weight has multiplicity one, other weights are lower, and these exhaust the simples. This does not assert semisimplicity or the characteristic-zero Weyl formula for simple characters in positive characteristic. (Serre.1968 Proposition 7, pp.47–48, Lemmas 5–6 and Theorem 4, pp.49–50.)

For split reductive groups over a PID A, prove `TauCeti.RepresentationRing.genericEquiv` and `TauCeti.RepresentationRing.decompositionEquiv` on Grothendieck groups. Construct residue reduction by the two-term Euler resolution, prove lattice independence, and prove the generic localization sequence with the direct sum of residue images. Compare generic and residue characters in the same integral `ℤ[X]^W`, and retain tensor and exterior compatibility. These are isomorphisms of representation Grothendieck rings, not equivalences of representation categories. (Serre.1968 Theorems 1–3, pp.43–45, and Theorem 5, p.51.)

**Checks.**

- For the trivial Hopf algebra the underlying-projective category and its exact K₀ recover the supplied ring K₀. A trivial torsion module ℤ/p has Euler class `[ℤ]−[ℤ]=0`, whereas naive residue tensor would produce the nonzero class `[𝔽_p]`.
- For the trivial group over `A=ℤ[√−5]` and `I=(2,1+√−5)`, `[A/I]=[A]−[I]` is nonzero in G₀(A). Ordinary dual sends A/I to zero, whereas derived dual sends its Euler class to `[A]−[I∨]≠0`.
- A nonsplit extension of rational representations in characteristic p can have a finite free underlying vector space. Its exact relation is required even though its representation sequence does not split.
- Over 𝔽₂, the weight-zero and weight-one representations of `𝔾_m` have identical characters on the group of rational points but distinct formal characters. A sum of p identical weights in characteristic p has coefficient p in ℤ, not zero.
- A weight line χ gives the monomial `[χ]`; the trivial torus gives ℤ. A rank-two determinant has character x₁x₂, and duality inverts both variables.
- Lattices A and pA in a trivial one-dimensional fraction-field representation give the same residue class. A generic simple can reduce to a nonsimple representation; the decomposition is a Grothendieck-group statement.
- Over a general Dedekind domain the kernel of a finite free cover need only be finite projective. The integral comparison must retain this case. Nonsplit reductive groups are outside the split character-isomorphism hypothesis.

#### 6.3.2 Finite general linear representation rings

For every finite tuple `(n₁,…,n_s)`, form the integral representation ring of `Π_i` `GL_(n_i)` using §6.3.1 and identify it by formal character with `ℤ[x_(i,j)^±1]^Π_i` `S_(n_i)`. For one factor this is `ℤ[λ¹V,…,λⁿV,(λⁿV)⁻¹]`. Give `TauCeti.RepresentationRing.generalLinear` and its product-group version the exterior pre-λ structure from §6.2.3's canonical exact-sequence filtration. Prove standard, exterior, determinant and dual character formulas, base-change compatibility, and restriction along `diag(g,1)`. The coefficient Hopf algebras, their finite products and scalar-extension comparisons use the supplied group schemes; the additional targets identify their generic entries and inverse determinants under torus restriction and commute those restrictions with base change. (Serre.1968 §§3.7–3.8, pp.51–52; Soulé §1.1, p.490.)

**Checks.**

- GL₀ and the empty product both give ℤ with trivial character lattice.
- For GL₂, the determinant and its inverse have characters x₁x₂ and `(x₁x₂)⁻¹`; polynomial characters without inverse determinants would omit a required representation.
- The tuple `(1,1)` gives two independent invertible variables. Its restrictions to the factors distinguish them.
- The algebraic representations of `𝔾_m` over ℤ are weight-graded; they cannot be replaced by arbitrary representations of the two-element abstract group `GL₁(ℤ)`.

#### 6.3.3 Associated projectives and specialness

For finite projectives Pᵢ over any commutative R, work on their finitely many clopen rank strata. Define `TauCeti.RepresentationRing.associatedProjective` V P for an integral algebraic representation V of the corresponding product of general linear groups by applying V to the principal-open trivialization cocycles and using SchemeAndStackFoundations §1.1’s effective quasicoherent descent and AlgebraicVectorBundles L0B’s affine finite-projective comparison. Its API includes independence of trivializations and refinements, standard factors, trivial representations, sum, tensor, dual, exterior powers, exact-sequence additivity, isomorphism invariance and arbitrary scalar-extension naturality. Exactness is tested on underlying finite free modules locally; no equivariant splitting is assumed. (Weibel II.4.1.2, p.90; Serre.1968 §3.7, p.51.)

Construct `TauCeti.RepresentationRing.associatedK0`, the resulting pre-λ map to projective K₀. Prove the universal product and iteration identities in the integral representation ring by restriction to independent torus line monomials and injectivity of formal characters. Apply this map to obtain `TauCeti.LambdaRing.projective_special` for every commutative R, with disconnected and zero rings included. Prove specialness of the finite algebraic representation rings and of the line-monomial monoid ring, and the latter's universal map to the line elements of a special λ-ring. These arguments precede the geometric splitting theorem of §6.6. (Serre.1968 §3.8, p.52; Weibel II.4.3.1–4.3.2, pp.92–93, and Exercise 4.4, pp.101–102.)

**Checks.**

- The standard i-th representation gives Pᵢ and the trivial line gives R, including on a rank-zero stratum.
- For a nonfree invertible P, the weight-m representation gives `P^(⊗m)`, including negative m. This distinguishes descent from a definition using only free modules.
- On `k×k`, projectives with different ranks on the two components use different general linear factors and glue back to the original projectives.
- For two rank-two standard factors the exterior-square product identity gives `rank 6`; for a rank-four standard factor the iterated exterior square gives `rank 15`. The same identities hold after reduction modulo two without division.

#### 6.3.4 Stable families and abstract-group representations

Take the inverse limit of the representation rings of §§6.3.1–6.3.3 `R_ℤ(GL_N)` along `diag(g,1)`. Standard minus rank is compatible under restriction. Each finite λ-expression τ with `τ(0)=0` gives `(τ(std_N−N))_N`, with duality and componentwise operations. Distinguish algebraic group-scheme representations from representations of the abstract group of points. ([Soulé, §1.1 (p. 490)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, §1.3 (p. 492)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.RepresentationRing.stableGL` — `R_ℤ(GL) = lim_N` `R_ℤ(GL_N)` along restriction, as the subring of compatible families in `∏_N R_ℤ(GL_N)`.
- `TauCeti.RepresentationRing.stableGL.preLambda` — The pre-λ-ring structure of `R_ℤ(GL)`, componentwise.
- `TauCeti.RepresentationRing.stableGL.proj` — The projections `R_ℤ(GL) → R_ℤ(GL_N)`, pre-λ-homomorphisms with `ρ_N ∘ proj_{N+1} = proj_N`.
- `TauCeti.RepresentationRing.stableGL.ext` — Two elements of `R_ℤ(GL)` are equal if all their components are.
- `TauCeti.RepresentationRing.stableGL.ofOperation` — The element `τ_∞ = (τ(id_N − N))_N` for a natural operation τ given as a λ-expression in one variable.
- `TauCeti.RepresentationRing.stableGL.proj_ofOperation` — `proj_N(τ_∞) = τ(id_N − N)`.
- `TauCeti.RepresentationRing.stableGL.dual` — The involution induced by ρ ↦ `ρ^∨` levelwise (§6.3.1’s duality).

**Checks.**

- The Nth component of the stable second Adams class has character `ΣXᵢ²−N`.
- At `N=0` every positive reduced λ-expression evaluates to zero.
- Restriction sends `std_{N+1}−(N+1)` to `std_N−N`, whereas the uncorrected standard family is incompatible.
- The kth stable γ-class has zero component whenever `N<k`.

Finite-rank specialness passes to this inverse limit. Projections are λ-homomorphisms and identities between universal λ-expressions, including `ψ^kψˡ=ψ^{kl}`, hold componentwise on the rank-corrected standard class. This supplies operations at finite rank before any self-map lifting. ([Soulé, §1.1 (p. 490)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Serre.1968, §3.8 (p. 52)](http://www.numdam.org/item/10.1007/BF02684589.pdf); [Riou, 3.3 (p. 13)](https://arxiv.org/pdf/0907.2710)).

For an abstract group G and commutative A, use ExactK₀ of A-projective finite representations, not the split representation ring. Tensor and exterior powers give its ring and pre-λ structures, with restriction, scalar extension and rank augmentation. Compare to TauCeti.repRing for fields only when Maschke's splitting hypothesis holds; modular representations remain exact, not split, K₀. ([Weibel, Ex. II.4.2 (PDF p. 109)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Kratzer, §2 (p. 236)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf)).

Expose the following interface:

- `TauCeti.RepresentationRing` — `R_A(G)` as ExactK0 of the exact category of AG-modules finitely generated projective over A.
- `TauCeti.RepresentationRing.preLambda` — The pre-λ-ring structure by exterior powers.
- `TauCeti.RepresentationRing.restrict` — `ρ^*: R_A(G') → R_A(G)` for ρ: `G → G'`, with id and composition.
- `TauCeti.RepresentationRing.extendScalars` — `f_*`: `R_A(G) → R_{A'}(G)` for f: `A → A'`.
- `TauCeti.RepresentationRing.forget` — The forgetful λ-homomorphism `R_A(G) → K_0(A)`, a retraction of `R_A(1) = K_0(A) → R_A(G)`.
- `TauCeti.RepresentationRing.ofGLPullback` — For ρ: `G → GL_N(A)`, the pre-λ-homomorphism `R_ℤ(GL_N) → R_A(G)`, σ ↦ `[σ_A ∘ ρ]`.
- `TauCeti.RepresentationRing.frobeniusTwist` — For `pA = 0`, `Φ^*: R_A(G) → R_A(G)`, `[P]` ↦ `[A ⊗_{Φ,A} P]`.

**Checks.**

- For the trivial group the result is `K₀(A)` with its supplied λ-structure.
- Over ℂ, the group of order two gives `ℤ[σ]`/`(σ²−1)`, with `λ²(1+σ)=σ`.
- Using only free modules would lose the nontrivial class group of a Dedekind domain already for the trivial group.
- A representation pulled back from `GL_N` has underlying class `[Aᴺ]`.

In characteristic p, `ψ^p` of the standard `GL_N` representation is its Frobenius twist. More generally `ψ^p(x)=Φ*x` on the projective representation ring over every commutative `F_p`-algebra. The Frobenius pullback is scalar extension, not the original representation with unchanged coefficients. ([Weibel, Ex. II.4.2(b) (PDF p. 109)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Corollary IV.5.5.2 (PDF p. 322)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

A representation on projective P, after adding a complement, gives a pointed class BG→BGL(A)⁺ independent of the stabilization. Prove block-triangular additivity for exact sequences and naturality, giving q:`R_A(G)`→[BG,BGL(A)⁺]. A stable representation expression gives a compatible inverse-limit family of finite-rank classes; this is not yet a genuine self-map. ([Weibel, Proposition IV.5.3 (PDF p. 320)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Kratzer, Théorème 3.1 (p. 237)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf); [Soulé, §1.2 (p. 491)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.KTheory.LambdaOperations.classifyingMap` — `q: R_A(G) → [BG, BGL(A)^+]`.
- `TauCeti.KTheory.LambdaOperations.classifyingMap_add` — `q(ρ ⊕ ρ') = q(ρ) + q(ρ')` and q on exact sequences.
- `TauCeti.KTheory.LambdaOperations.classifyingMap_natural` — Natural in G (restriction) and in A (extension of scalars).
- `TauCeti.KTheory.LambdaOperations.stableMap` — `r_A: R_ℤ(GL) → lim_N [BGL_N(A), BGL(A)^+]`, a compatible finite-rank class; a genuine self-map requires the separate Hiller lifting input.
- `TauCeti.KTheory.LambdaOperations.stableMap_id` — `r_A((id_N−N)_N)` is the restriction family of the identity of `BGL(A)^+`.

**Checks.**

- For the trivial group the reduced classifying map is zero, while retaining K₀ components makes it identity on `K₀(A)`.
- A ℤ-action by a unit u gives its unit loop in `K₁(A)`.
- Over ℚ the actions by 2 and 3 have the same underlying module but distinct classifying maps.
- Restriction from `GL_{N+1}` to `GL_N` agrees with restriction of the representation class.

### 6.4 Universal higher operations and products

Here A is commutative. The universal lifting assertion is proved before it is used to define genuine operations. The same-degree product supplied by a pointed-space diagonal is separate from Loday’s degree-adding product.

With the genuine-map lifting and uniqueness theorem below, lift each reduced λ-expression to an operation on BGL(A)⁺ and hence `K_m(A)`, `m≥1`. Extend it to `K₀(A)×[T,BGL(A)⁺]` by the unitization formula, with the rank part supplied by finite-projective λ-operations. State the lifting hypothesis explicitly wherever its use precedes its proof. ([Weibel, Definition IV.5.4 (PDF p. 321)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, IV.5, before Theorem 5.5 (PDF p. 322)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, §1.3 (p. 492)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.KTheory.LambdaOperations.op` — `τ_A ∈ [BGL(A)^+, BGL(A)^+]` for a natural operation τ with `τ(0) = 0`.
- `TauCeti.KTheory.LambdaOperations.lambda` — `λ^k`: `K_m(A) → K_m(A)`, `m ≥ 1`, and on `K_0(A) × [X, BGL(A)^+]`.
- `TauCeti.KTheory.LambdaOperations.gamma` — `γ^k` likewise.
- `TauCeti.KTheory.LambdaOperations.adams` — `ψ^k` likewise.
- `TauCeti.KTheory.LambdaOperations.op_natural` — `f_* ∘ τ_A = τ_B ∘ f_*` for a ring map f: `A → B`, and τ commutes with maps of spaces `X → X'`.
- `TauCeti.KTheory.LambdaOperations.lambda_zero_ring` — On `K_0(A)`, `λ^k` is the exterior-power operation of §6.2.3.

**Checks.**

- The first operation is identity and the zeroth operation on a unitized pair is `(1,0)`.
- On K₁ unit classes, `ψᵏ[u]=k[u]`, multiplicatively uᵏ.
- Taking Λ² of a rank-one automorphism gives the zero bundle, while the actual `λ²[u]=−[u]` can be nonzero.
- At degree zero the operations agree with exterior powers of projectives.

Prove these operations make `K₀(A)×[T,BGL(A)⁺]` a special λ-ring with its diagonal-space product. On spheres of positive dimension the internal same-degree product is zero, so `λ^k` is additive and `ψ^k=(−1)^{k−1}kλ^k` on each `K_m(A)`, with Adams composition and K₀-module compatibility. ([Weibel, Theorem IV.5.5 (PDF p. 322)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Corollary IV.5.5.1 (PDF p. 322)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, §1.4 (p. 492)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Let A be commutative. For a connected pointed CW complex T, write `q_T:R_A(π₁T)→[T,BGL(A)⁺]` for the reduced representation classifying map. Prove that, for every connected H-space H and natural transformation `η_T:R_A(π₁T)→[T,H]`, there is a unique homotopy class `f:BGL(A)⁺→H` with `η_T=f_*q_T` for all T. Apply this to lift reduced representation operations to genuine maps, with the obstruction/phantom uniqueness argument included. Also transport transformations between representation functors and prove commutation with their λ-operations by this uniqueness. ([Weibel, Proposition IV.5.7 (PDF p. 323)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For the actual Loday degree-adding product, Adams operations are multiplicative, so rational weights add. Establish the separate γ-product formula on two positive-degree inputs, with coefficient `−(k−1)`!/`((a−1)!(b−1)!)` for `a+b=k` and a,`b≥1`. Its integral coefficients are integers; the square-zero λ-product does not prove this formula by itself. ([Weibel, Theorem IV.5.9 (PDF p. 323)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, §1.6 (p. 493)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

For unit loops, `λ^k[u]=(−1)^{k−1}[u]` and `ψ^k[u]=k[u]`. Products of n units have Adams weight n. For a line bundle `ψ^k[L]=[L^{⊗k}]`. Include `k=1`,2 and characteristic two without replacing additive signs by field characteristic. ([Weibel, Example IV.5.4.1 (PDF p. 321)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Example IV.5.9.1 (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 6.5 Affine filtration bounds and weights

For commutative A, `F²_γK₁(A)=SK₁(A)`, and determinant gives `K₁=A×⊕F²` with first graded A×. For `m≥2`, `K_m(A)=F²_γK_m(A)`. Compare the filtration with §6.2 and the determinant and units with §3.6. ([Weibel, Proposition IV.5.10 (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, Proposition 1 (p. 500)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

If A is finite over R with finite-dimensional Max R, `γ^k` vanishes on rank-zero K₀ for `k≥dim Max R+1`. For `m≥1` and finite stable `rank r`, `γ^k` vanishes on `K_m` for `k≥m+r`. This bounds the subgroup generated by individual γ-values integrally; equality with the full coefficient γ-filtration is used only rationally unless an additional integral bridge is proved. ([Soulé, Théorème 1 (p. 494)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Weibel, Remark IV.5.10.1 (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For finite stable `rank r`, rational weights of `K_m` lie in 2,…,`m+r−1` for `m≥2`, and 1,…,r for `m=1`. For arbitrary A use the elementwise filtered-union version. Give Soulé's integral decomposition modulo the finite-exponent Serre classes `𝒮_{m+r−1}` and `𝒮_{r+1}`, respectively, and its denominator constants `w_i`; `w₂=24`. Distinguish simultaneous integral eigenspaces from one-operator rational ones. Here `𝒮_n` consists of groups of bounded exponent whose prime factors are 2 or primes less than n; for `n≥3` such errors disappear after inverting `(n−1)`!. The simultaneous integral weight-i subgroup is the intersection of `ker(ψ^k−kⁱ)` over all `k≥2`. For N large, `w_i=gcd_{k≥2} k^N(kⁱ−1)`; `w_i=2` for odd i, while for even i its prime factors are exactly those with `p−1` dividing i. Use the associated integral combinations of Adams factors to bound the kernel and cokernel of the sum of eigenspaces. ([Weibel, Theorem IV.5.11 (PDF p. 324)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, Corollaire 1 (p. 498)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

For a field, K₀ has weight zero, K₁ weight one, and `K_m`, `m≥2`, has weights 2,…,m rationally and modulo `𝒮_m` integrally. Products of m units lie in weight m. This statement neither identifies the entire top weight with Milnor K nor asserts Beilinson–Soulé vanishing. ([Soulé, Introduction (p. 488)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Weibel, Vanishing Conjecture IV.5.12 (PDF p. 325)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

### 6.6 Scheme λ-rings and splitting

For every quasi-compact scheme, exterior powers of the supplied vector bundles give a special λ-ring on ExactK₀(Vect X), augmented by locally constant rank. Glue associated bundles from algebraic GL representations and prove their λ-homomorphism property. No regularity is needed for this vector-bundle K₀ result. ([Weibel, Proposition II.8.8 (PDF p. 161)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [GS99, Lemma 20 (p. 44)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf)).

Use the complete flag scheme and universal filtration supplied by the moduli roadmap. Its sub-line tower uses `P_lines(E)=P_quot(E∨)`, whereas Layer 5 uses quotient projectivization. Relate the two tautological conventions and use the universal line quotients in K₀. ([Weibel, Splitting Principle II.8.8.1 (PDF p. 161)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [GS99, 3.3.4 (p. 44)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.flagBundle.lineQuotients_sum` — `[f^*E] = Σ[L_i]` in `K_0`(Vect Fl(E)).

**Checks.**

- Ranks zero and one give X itself.
- For rank two, the sub-line flag is `P_quot(E∨)`; its second line is `π*det(E)⊗O(1)`.
- Its two K-theory basis terms agree with the projective bundle formula.
- The full flag of k³ has K₀ rank six, while P² has rank three, distinguishing a flag from a Grassmannian.

Iterating the projective-bundle formula makes `K_*`(Fl(E)) free of `rank n`! over `K_*(X)`, with split-injective pullback, also with supports and nonconnectively. Pulled-back E is the sum of its n universal line classes. Iterated flags handle finitely many bundles; use injectivity on units of K₀ to obtain Pic injectivity. Rank-zero flags are X. ([Weibel, Splitting Principle II.8.8.1 (PDF p. 161)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [GS99, 3.3.4 (p. 44)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf)).

### 6.7 Pointed sheaf models and K-coherence

Let X be regular Noetherian, finite-dimensional, with an ample family of line bundles, and Y closed, `U=X∖Y`. These hypotheses also govern the following higher scheme operations and weight subsections unless a different scope is explicitly stated. The abstract K-coherence definition applies to the separately supplied ringed-topos homotopy model.

For finite-dimensional Noetherian X and `U=X∖Y`, define `C_Y=cofib(U₊→X₊)` in pointed simplicial sheaves and `H_Y^{−m}(X,F)=π_mRMap(C_Y,F)`. Its fibre sequence has a pointed-set/action end: `m=0` is a pointed set and `m=1` only a group before extra structure. Do not promise an abelian spectral sequence for arbitrary pointed F. ([Soulé, 4.1 (p. 509)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Lemme 1 (p. 510)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Brown–Gersten, Theorem 2 and Proposition 1, pp.271–279; Theorem 3 and proof/remark, pp.282–285](https://pi.math.cornell.edu/~kbrown/scan/1973.0341.0266.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.SimplicialSheaf` — Pointed simplicial sheaves on `X_Zar` with stalkwise weak equivalences and Brown–Gersten fibrations.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper` — `H_Y^{−m}(X,F)=[Σ^m cofiber(U_+→X_+),F]` in the derived pointed mapping category, equal to `π_m` of the homotopy fibre of derived sections.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_map` — Maps in Ho `S_*(X)` act on `H^{−m}_Y`; pullback along maps of pairs `(X', Y') → (X, Y)`.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_les` — The fibre long exact sequence, with abelian groups for `m≥2`, groups for `m=1` and pointed sets/actions at `m=0`; it becomes an abelian sequence when F is an infinite-loop sheaf.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.brownSS` — Under Brown–Gersten Theorem 3’s connectedness, abelianity and cohomology-vanishing hypotheses, the Postnikov tower yields `E₂^{p,q}=H^p(X,π_{−q}F)`. The `p>n` version requires the abelian tower structure specified on p.285 and has a total-degree-zero fringe. For supports require the analogous relative hypotheses; for K use the infinite-loop spectrum specialization.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_thomason` — Agreement with Thomason's Godement hypercohomology of Layer 4 for sheaves of infinite loop spaces.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.supportCofiber` — `C_Y=cofiber(U_+→X_+)`; `RMap(C_Y,F)` represents supported derived sections.

**Checks.**

- At a one-point site with full support, the construction gives `π_mF`.
- Empty support gives a contractible cofiber, while full support gives derived sections.
- A discrete constant ℤ sheaf has the expected H⁰ and no positive homotopy groups.
- On a regular scheme, the derived plus-sheaf construction sees nontrivial vector bundles which sections of the trivial-bundle presheaf miss.
- At a point, `F=BG` with nonabelian G has `H⁻¹=G`, so the general definition cannot require abelianity.

For regular finite-dimensional Noetherian X with an ample family, construct the functorial stable plus sheaf and identify `K_m^Y(X)` with `H_Y^{−m}(X,ℤ×BGL⁺)`, `m≥0`. Prove finite-rank stabilization of supported mapping classes and identify the classifying cocycle of a vector bundle. Use a functorial plus model with its natural stable comparison. ([Soulé, 4.2 (p. 509)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Lemme 1 (p. 510)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Lemme 1 (p. 511)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316; Exercises 8.5–8.6, p.374](https://gwern.net/doc/math/1990-thomason.pdf)).

Define `integralCompletion` on connected pointed simplicial sheaves by sheafifying the Bousfield–Kan integral completion, computed from the standard cosimplicial reduced free-abelian resolution and its homotopy totalization. Give its natural unit and homotopy functoriality; an integral homology equivalence induces a weak equivalence after completion. Set `K^N=ℤ×ℤ∞BGL_N` and `K=ℤ×ℤ∞BGL`, pointed at rank zero. The stable comparison `completedGL_plus` identifies the latter with the functorial stable plus sheaf; its block-sum and tensor comparisons agree with the K-model above. This is completion of spaces, distinct from the prime-adic spectral completion. ([GS99, §3.1 and Lemma 18, pp.37–39](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf).)

Expose `integralCompletion.unit`, `.map`, `.homologyEquiv`, and `completedGL_plus`. Its checks are: the point completes to the point; an integral-homology-acyclic connected space completes to a contractible space; the completed stable BGL retains `π₁=K₁` rather than becoming simply connected; and its ℤ factor retains locally constant rank on a disconnected scheme.

Prove `gl_stable_homology_uniform`: for finite-dimensional Noetherian X and each `q≥0`, there is `N₀≥1` such that for every affine open `V⊂X` and `N≥N₀`, `GL_N(O(V))→GL(O(V))` induces integral homology isomorphisms in degrees `j<q`. Apply the finite stable-rank bound for the rings `O(V)`, uniformly bounded by `dim X+1`, then the integral-completion comparison, to get finite-rank homotopy-sheaf stability. Feed this into the Brown spectral sequence of §6.7 and its finite cohomological dimension bound. This is the stability input in `kCoherent_scheme`, not a consequence of the abstract plus/Q equivalence. The finite-`rank K₀` surjectivity step represents each finite-rank vector bundle by its classifying cocycle on a hypercover, so it does not require a globally free representative. ([GS99, proof of Proposition 5, p.41](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf).)

A pointed sheaf space is K-coherent when both finite-rank mapping-class stabilization and finite-rank homotopy-sheaf cohomology stabilization hold in all nonnegative degrees, for the integral-completion K-model. Define its cohomological-dimension bound using every abelian coefficient sheaf; neither condition replaces the other. ([GS99, Definition 1, p.38](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf)).

Expose the following interface:

- `KCoherent` — The conjunction of both stabilization comparisons for all m,p,`n≥0`.
- `KCoherent.mappingComparison` — For h:KCoherent W and `m≥0`, `colim_N H^{−m}(W,K^N)≅H^{−m}(W,K)`.
- `KCoherent.homotopySheafComparison` — For h:KCoherent W and p,`n≥0`, `colim_N H^p(W,π_nK^N)≅H^p(W,π_nK)`.
- `kCoherent_iff_two_comparisons` — KCoherent W iff both families of stabilization maps are isomorphisms.
- `KCoherent.of_weakEquiv` — A weak equivalence `W′≃W` transports the two comparison isomorphisms.
- `KCoherent.operation` — A compatible stable representation family gives an operation on `H^{−m}(W,K)`, using the mapping comparison; the homotopy-sheaf comparison supplies the stabilization used in the Brown bound.

**Checks.**

- A field point satisfies both stability comparisons by uniform GL stability.
- A contractible pointed space has zero reduced comparisons.
- For `X=G_m,k`, the unit t gives a nonzero class in `H⁻¹(X₊,K)`, represented at rank one and detected by boundary +1 at `t=0`.
- For P¹₊, derived stabilization must retain `[O(1)]` rather than just globally trivial bundles.

In the same regular ample-family scope, `kCoherent_scheme` makes X₊ K-coherent with bound `d=dim` X, and `kCoherent_supportCofiber` makes `C_Y` K-coherent with bound `D=max(dim X,dim U+1)`. For U empty take `D=d`; for Y empty `C_Y` is contractible. The cofiber's extra degree is essential. ([GS99, Proposition 5 and proof, pp.39–41; §3.2.4, p.42](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [TT90, 2.1.1–2.1.2, pp.283–284; 3.8–3.10, p.316; Exercises 8.5–8.6, p.374](https://gwern.net/doc/math/1990-thomason.pdf); [Stacks.Divisors.0GML, Divisors, Lemma 31.17.8, tag 0GML](https://stacks.math.columbia.edu/tag/0GML)).

### 6.8 Higher scheme operations

Retain the regular finite-dimensional Noetherian ample-family scope, and arbitrary closed supports. Use a functorial plus/integral-completion sheaf model. The singular construction below has its own smooth-factorization hypotheses; it is not obtained by dropping regularity from this model comparison.

Construct scheme operations from completed representation maps, block-triangular additivity, rank correction and both K-coherence comparisons. For regular finite-dimensional Noetherian X with ample family obtain `λ^k`,`γ^k` for `k≥1` and `ψ^k` for `k≠0` on supported `K_m`. Include the comparison of the matrix tensor pairing with the derived supported K-product. ([Soulé, 4.3 (p. 511)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, 4.3 (p. 512)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [GS99, Theorem 3 (p. 46)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [GS99, Lemmas 18–20, pp.38–45; §4.2 and Theorem 3 with proof, pp.45–47](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp` — τ: `K^Y_m(X) → K^Y_m(X)` for a natural operation τ with `τ(0) = 0`, X regular noetherian of finite dimension.
- `TauCeti.AlgebraicGeometry.KTheory.lambda` — `λ^k` on `K_m^Y(X)` for `k≥1`; λ⁰ has the separate ambient unit convention.
- `TauCeti.AlgebraicGeometry.KTheory.gamma` — `γ^k` on `K_m^Y(X)` for `k≥1`.
- `TauCeti.AlgebraicGeometry.KTheory.adams` — `ψ^k` on `K^Y_m(X)`, `k ∈ ℤ − {0}` (`ψ^{−1}` the duality).
- `TauCeti.AlgebraicGeometry.KTheory.augmentation` — ε: `K^Y_m(X) → H^0_Y(X, ℤ)`, zero for `m ≠ 0`.
- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_affine` — For `X = Spec` A regular, τ agrees with Layer 6.
- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_zero` — On `K_0(X)`, `λ^k[E]` = [`Λ^kE`].

**Checks.**

- For line bundles, `ψᵏ[L]=[Lᵏ]`.
- Empty support gives zero operations.
- Regular affine comparisons recover the ring operations.
- On global units ψᵏ is kth power and λ² is inversion, whereas Λ² of the rank-one automorphism itself has no such information.

These operations make `⊕_{m≥0}K_m^Y(X)`, with zero products between positive degrees, a nonunital special λ-algebra over ℤ, and for full support over `K₀(X)`. Give the augmentation, duality, Adams composition, additive higher λ-operations and γ-filtration. The augmentation is rank on degree zero and zero on positive degrees. Use §6.2.5's intersection filtration for this augmentation: on `ℤ⊕⊕_mK_m^Y(X)` it is `ε(a,x)=a+rank(x₀)`. In particular `F¹K₀^Y` is the rank kernel, while `F¹K_m^Y=K_m^Y` for `m>0`. Keep this auxiliary λ-product separate from the tensor ring throughout. ([Soulé, Proposition 4 (p. 512)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [GS99, Proof of Theorem 3 (p. 46)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Operations commute with pullback in the regular ample-family scope, support enlargement, open restriction and localization into supported K. Compare their affine realizations with Quillen–Hiller operations. They do not commute uncorrected with residue-field dévissage: its Gysin twist is computed below. ([Soulé, Theorem 7, proof step 4 (p. 536)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proposition 4 (p. 512)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Under the resolution property identify perfect K₀ with vector-bundle K₀ and compare all operations, rank and determinant. On affine schemes compare directly with the low-degree λ-ring, including arbitrary singular A for degree zero. Top exterior power of an actual constant-rank projective is its determinant, not an operation on an arbitrary virtual rank alone. ([Soulé, Proof of Lemme 1 (p. 511)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Weibel, Example II.4.1.2 (PDF p. 98)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For quasi-projective schemes over a regular finite-dimensional Noetherian base with ample family, express `K_m` as the colimit over maps to smooth schemes in that category. Transport operations through this presentation. The resulting augmented λ-algebra is elementwise γ-nilpotent; a uniform finite γ-filtration on singular schemes is not asserted. ([Soulé, Proposition 7 (p. 528)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Remarque after Proposition 7 (p. 529)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp` — τ on `K_m(X)` for X quasi-projective over a regular base, via smooth embeddings.
- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_smooth` — Agrees with Layer 6 when X is smooth over S.
- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_pullback` — Commutes with `f^*` for morphisms of `𝒱_S`.
- `TauCeti.AlgebraicGeometry.KTheory.singular_lambda_nilpotent` — `K_m(X)` is a nilpotent augmented `K_0(X)`-λ-algebra.

**Checks.**

- Smooth schemes give back the regular construction.
- Over dual numbers, `ψᵏ(1+aε)=1+kaε` on nilpotent units.
- The degree-zero Cartan map is multiplication by two and cannot be inverted to transport a λ-structure to G.
- On finite-type affines, comparison through a smooth affine presentation agrees with the ring construction.

Scheme Adams operations preserve the actual internal and external K-products whenever all schemes lie in the regular ample-family scope, including the product scheme for external products. Thus rational K-theory is bigraded by homological degree and Adams weight. ([GS99, 4.1, after Theorem 3 (p. 48)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [Soulé, Théorème 7 v) (p. 533)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

### 6.9 Scheme and finite-coefficient weight decompositions

Retain that scheme scope and the rank-augmented filtration of §6.8, including for supported degree zero; the zero-on-I generator formula retains its vanishing-augmentation hypothesis. A bound on individual γᵏ is not identified integrally with a bound on the full weighted γ-filtration. Finite-coefficient results impose their extra integral endpoint and additive-operation hypotheses in addition to the rational theorem.

For regular X of dimension d with ample family, individual `γ^k` values vanish for `k≥m+d+1` when `m≥2`, and `k≥d+3` when `m=1`, also with supports. Prove full `F_γ^{d+1}K₀(X)=0` separately. The finite-type-over-a-field unsupported full bound `F_γ^{m+d+1}K_m(X)=0` uses the Gillet–Soulé Brown/coniveau comparison, not just the single-operation bound. ([Soulé, Proof of Proposition 5 (p. 514)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [GS99, 5.4 (p. 52)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

With support-cofiber bound D, decompose `K_m^Y(X)_ℚ` into simultaneous weights `α(m)`,…,`m+D`, where `α(0)=0`, `α(1)=1`, `α(m)=2` for `m≥2`. Without supports `D=d`, with low weights rank, units and Pic. State the separate integral F² decompositions modulo `𝒮_{m+d}`, `𝒮_{d+2}` and `𝒮_d`. Comparing weights to `gr_γ` requires the explicit weighted λ-module filtration bridge. More precisely, for `m≥2`, `F²K_m^Y` has weights 2 through `m+d` modulo `𝒮_{m+d}`; `F²K₁^Y` has weights 2 through `d+2` modulo `𝒮_{d+2}`; and `F²K₀(X)` has weights 2 through d modulo `𝒮_d`. The rational unsupported identifications are `K₀^(0)=H⁰(X,ℚ)`, `K₀^(1)=Pic(X)⊗ℚ` and `K₁^(1)=Γ(X,O×)⊗ℚ`. Put `π_i=∏_{j≠i}(ψ²−2^j)/(2^i−2^j)` over the actual finite weight range; each denominator is nonzero. ([GS99, Proposition 8 (p. 48)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [Soulé, Proposition 5 (p. 513)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

For `m≥2`, odd ℓ, `ν≥1` and `ℓ>N+1`, assume integral ℓ-local simultaneous endpoint decompositions in weights 0,…,N, coefficient exponent `ℓ^ν`, and additive commuting Adams operations compatible with Bockstein. Then coefficient `K_m` decomposes into generalized weights `ker(ψ^k−kⁱ)²` for a primitive root k mod ℓ, independently of k. Give each Bockstein short exact sequence, square-zero `ψ^r−rⁱ`, and CRT projectors over `ℤ/ℓ^ν`. Rational endpoint data alone is insufficient. Write `A_i=K_m(X)_(ℓ)^(i)`/`ℓ^ν` and `C_i=K_{m−1}(X)_(ℓ)^(i)[ℓ^ν]`. The summand `B_i` fits into `0→A_i→B_i→C_i→0`. The product `P(T)=∏_{i=0}^N(T−kⁱ)` kills both endpoints, so `P(ψ^k)²=0` on B. Its squared factors are pairwise comaximal modulo `ℓ^ν`, giving the CRT idempotents. On `B_i` every `ψ^r−rⁱ` maps to `A_i` and kills `A_i`, hence squares to zero; for a different primitive root the other weight differences are units plus this square-zero map. This proves independence without assuming scalar action on `B_i`. (The extension/CRT proof is the displayed algebraic argument; for the underlying coefficient model in the finite-type-over-a-field scope, see [Geisser, §1.1, pp.3–4](https://www2.rikkyo.ac.jp/web/geisser/padicKtheory.pdf).)

Define `coefficientMooreSpace(n,m)=P_m(n)=cofib(n:S^{m−1}→S^{m−1})` for `n≥2` and `m≥2`. For X in the regular finite-dimensional Noetherian ample-family scope and a closed support Y, construct the additive comparison

    coefficientMooreComparison :
      [P_m(n) ∧ C_Y, ℤ × BGL⁺] ≅ π_m(𝕂(X on Y)/n).

The left group law is induced by the infinite-loop addition of the target, including `m=2`. It does not require `P₂(n)` to be a suspension or a cogroup. Use the §6.7 comparison with derived supported sections, the suspension-spectrum/mapping-space adjunction and the duality of the finite Moore spectrum: `F(S/n,E)≃Σ⁻¹(E/n)`, while Σ∞`P_m(n)`≃`Σ^{m−1}S`/n. The resulting long exact sequence identifies its quotient and torsion maps with both Bockstein maps of the spectral coefficient model. This also fixes the shift in the comparison. ([Geisser, §1.1, p.3](https://www2.rikkyo.ac.jp/web/geisser/padicKtheory.pdf), for the Moore-space construction in the regular separated finite-type-over-a-field scope; the supported extension is the displayed adjunction using §6.7 and StableHomotopyKTheory §§7.1–7.4.)

Prove `kCoherent_finiteCellSmash`: smashing a finite-dimensional K-coherent pointed sheaf space with a finite pointed CW complex preserves both comparisons. For a finite cell attachment, use the mapping fibre sequences and the cohomology exact sequences for the homotopy sheaves; finite filtered-colimit exactness and the dimension bound close induction. At the degree-zero end use pointed-set fibres with their π₁ actions and stabilizers from §6.7, rather than an abelian five-lemma argument for `K^N`. Thus `P_m(n)∧C_Y` has a finite bound at most `D+m`, with D from §6.7. On its mapping classes construct `coefficientAdams_bockstein`, for `n=ℓ^ν`, odd ℓ, `ν≥1`, `k≥1` and `m≥2`: postcompose by the pointed Adams map `ψ^k`, transport through `coefficientMooreComparison`, and prove additivity, naturality, support enlargement, Adams composition and compatibility with both Bockstein maps. Additivity uses the universal identity `ψ^k(x+y)=ψ^k(x)+ψ^k(y)` in the special λ-algebra of mapping classes from §6.8, applied to `P_m(n)∧C_Y`. Establish this identity on finite-rank representation models before passing through the two K-coherence comparisons. The Bockstein maps are precomposition by the bottom-cell inclusion and top-cell collapse, so they commute with postcomposition by `ψ^k`. This constructs the required unstable coefficient operation without assuming an integral spectrum-level Adams map. ([GS99, Definition 1 and Proposition 5, pp.38–41; Theorem 3 and proof, pp.46–47](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [Geisser, §1.1, pp.3–4](https://www2.rikkyo.ac.jp/web/geisser/padicKtheory.pdf).)

**Checks.**

- Empty support gives zero Moore mapping groups and zero coefficient operations; full support gives the ordinary finite-coefficient group.
- ψ¹ is identity on the coefficient group and on both Bockstein endpoints. A chosen nonzero class in `K_{m−1}[n]` must be retained by the comparison, detecting the shift and ruling out the quotient-only definition `K_m`/n.
- For `m=2` use the actual two-cell space `S¹∪_n e²`, with addition from the K-target. Replacing it by S²/n as an unstable Moore space would shift the torsion endpoint to `K₂[n]` and is incorrect.
- The integral unit-loop formula on K₁, `ψ^k[u]=k[u]`, gives the same formula on the torsion endpoint of the `m=2` Bockstein sequence. The coefficient group itself is allowed a nonsplit extension and generalized, rather than scalar, Adams weights.
- For `n=1`, treated separately, both coefficient models are contractible and their groups are zero. No `m=1` Moore-space construction is asserted here.


For regular Noetherian separated S, construct the pointed A¹-homotopy category, infinite Grassmannian and Morel–Voevodsky K-representability on Sm/S as named preliminary targets here. Riou's uniqueness identifies endomorphisms of ℤ×Gr with natural K₀ operations, also in several variables. With finite-dimensional S compare the resulting higher operations and product with Soulé's. No later motivic roadmap is a prerequisite. In symbols, `H•(S)=[pointed simplicial Nisnevich sheaves on Sm/S][A¹-equivalences⁻¹]` and `[Sⁿ∧X₊,ℤ×Gr]≅K_n(X)`, `n≥0`. Prove `End_H(S)(ℤ×Gr)≅Nat(K₀(−),K₀(−))`, and its several-variable version, by Grassmannian approximation and the vanishing of the relevant lim¹ terms. These are the named preliminary constructions and uniqueness assertions, not an assumed operation on later motivic K-theory. ([Riou, Theorem 0.2 (p. 2)](https://arxiv.org/pdf/0907.2710); [Riou, 3.3 (p. 13)](https://arxiv.org/pdf/0907.2710); [TT90, 2.1.2(d), p.284](https://gwern.net/doc/math/1990-thomason.pdf)).

### 6.10 Bott classes and twisted operations

For the scheme applications retain the regular ample-family scope; for the universal formulas work in an arbitrary special λ-ring with the indicated conormal class N. Its universal integral polynomials are used before any localization or inversion.

For `k≥1` and a finite-dimensional λ-element N of `rank p≥0` in a special λ-ring, explicitly requiring `λ^j(N)=0` for `j>p`, define `θ^k(N)` by the symmetric polynomial `∏ᵢ(1+ξᵢ+⋯+ξᵢ^{k−1})`. Prove multiplicativity in sums, composition, `rank kᵖ` and the dual negative-k formulas. Extension to virtual classes with values in `R[1/k]` requires a nil augmentation ideal; in a Laurent polynomial ring `1+u` is not invertible after inverting 2. With a duality involution satisfying `ψ⁻¹(L)=L⁻¹` on line elements, set `θ⁻¹(N)=(−1)ᵖλᵖ(ψ⁻¹N)` and `θ⁻ᵏ(N)=ψᵏ(θ⁻¹(N))θᵏ(N)`, `k≥1`. Thus `θ⁻¹(L)=−L⁻¹` and `θ⁻²(L)=−L⁻²(1+L)`. These formulas require the stated duality; they are not operations on an arbitrary λ-ring without an involution. ([Soulé, 4.5 (p.515)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Lemme 2 ii) (p.515)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.LambdaRing.bott` — `θ^k(N)` for `k≥1` and N of `rank p≥0` with `λ^j(N)=0` for `j>p`.
- `TauCeti.LambdaRing.bott_add` — `θ^k(N + N') = θ^k(N)θ^k(N')`.
- `TauCeti.LambdaRing.bott_line` — `θ^k(L) = 1 + L` + ⋯ + `L^{k−1}` for a line element L.
- `TauCeti.LambdaRing.bott_mul_index` — `θ^{kk'}(N) = ψ^k(θ^{k'}(N))θ^k(N)`.
- `TauCeti.LambdaRing.augmentation_bott` — `ε(θ^k(N)) = k^{rank N}`.
- `TauCeti.LambdaRing.bott_map` — λ-homomorphisms commute with `θ^k`.
- `TauCeti.LambdaRing.bottExp` — The exponential extension `θ^k`: `K_0 → K_0 ⊗ ℤ[1/k]`, for `K_0` with nil augmentation ideal in which every element is a difference of finite-rank elements.

**Checks.**

- The values on 0 and the trivial line are respectively 1 and k.
- On a trivial rank-c bundle `θᵏ=kᶜ`, and `θ³(L)=1+L+L²`.
- It differs from Adams: `θ²(L)=1+L`, while `ψ²(L)=L²`.
- Its rank is `k^{rank N}`; invertibility after inverting k uses nilpotence of the augmentation ideal, not just this rank calculation.
- In `ℤ[u,u⁻¹]`, the virtual rank-zero class `1−u` is outside the finite-dimensional input condition: `λ_t(1−u)=(1+t)`/(1+ut) has infinitely many coefficients. Its virtual θ² would require 2/`(1+u)`, which need not exist even after inverting 2.

Define the twisted λ-ring `R_N` on `ℤ⊕R` using product `x·_Ny=xyλ₋₁(N)` on the ideal and universal integral λ-polynomials. Construct those polynomials before their identities after multiplication by `λ₋₁(N)`; the latter identities alone do not determine operations when that factor is a zero divisor. This models the self-intersection product transported by a Gysin map. ([Soulé, 4.5 (p. 514)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.LambdaRing.twisted` — `R_N = ℤ × R` with `(1,0)` as unit and `x_N y = xyλ_{−1}(N)`, as a function of R, N and its `rank p` (`λ_{−1}(N)` depends on p).
- `TauCeti.LambdaRing.twisted.lambdaRing` — `R_N` is a special λ-ring, under the hypothesis `λ^j(N) = 0` for `j > p`.
- `TauCeti.LambdaRing.twistedOp` — `τ(N, x)`, the R-component of `τ(0, x)`.
- `TauCeti.LambdaRing.twistedLambda_mul` — `λ^k(N, x)λ_{−1}(N) = λ^k(xλ_{−1}(N))`, and the same for `γ^k`.
- `TauCeti.LambdaRing.twisted_map` — A λ-homomorphism f: `R → R'` induces `R_N → R'_{f(N)}`.

**Checks.**

- For `R=ℤ` and `N=1`, `λ²_N(0,1)=(0,−1)`, whereas ordinary binomial `λ²(1)=0`.
- For `N=1` the ideal product vanishes because `λ₋₁(1)=0`.
- For `N=0`, ideal multiplication and positive λ-operations recover those of R.
- In `R=ℤ[ξ]` with `N=ξ`, the product of two ideal elements 1 is `1−ξ`; `(0,1)` is not the unit.

The twisted Adams formula is `ψ^k_N(x)=θ^k(N)ψ^k(x)` for `k≥1`, with the specified dual formulas for negative k. Prove it universally before specializing to a ring where cancellation of `λ₋₁(N)` could fail. ([Soulé, Lemme 2 i) (p. 515)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

### 6.11 Gysin maps, transfers and coniveau weights

For higher operations and the coniveau action use regular finite-dimensional Noetherian schemes with ample families, as above. Closed immersions are regular and have the stated conormal bundles. The finite étale assertion retains the additional factorization through A¹ of the target.

For a regular closed immersion of regular finite-type schemes over a regular finite-dimensional Noetherian base, with ample families and conormal N, supported dévissage intertwines τ with the twisted `τ_N`. In particular `ψ^k j_*=j_*(θ^k(N)ψ^k)`. This is Riemann–Roch without denominators with the conormal convention, not commutation with unmodified pushforward. ([Soulé, Théorème 3 (p. 517)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Théorème 3 (p. 517)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Thomason93, Lemme 3.2 and (3.2.6) (pp. 207–208)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 2.1.2(e),(g),(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

For pure codimension c, trivial conormal gives `ψ^k` `j_*=k^c` `j_*ψ^k`, hence a weight shift by c. In general rational pushforward of weight i lies in weights at least `i+c` and raises γ-filtration by c modulo torsion. Exact homogeneous normalization uses the later Riemann–Roch correction. ([Soulé, Proof of Proposition 6 (p. 520)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Remarque after Lemme 2 (p. 517)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

For finite étale f in the regular ample-family scope admitting a closed embedding in `A¹_Y`, `kψ^k f_*=kf_*ψ^k` for `k≠0`. State also the `γ^k` discrepancy in `f_*F_γ^{k+1}`. Without division this is a k-annihilated discrepancy; filtration compatibility follows modulo torsion. ([Soulé, Proposition 6 (pp. 519–520)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 2.1.2(g),(h), p.284](https://gwern.net/doc/math/1990-thomason.pdf)).

Adams operations act additively on the coniveau exact couple. On codimension p the action is `kᵖψ^k` on residue-field K. State Soulé's bounded integral weight summand sequences and low-degree decompositions modulo `𝒮_d` or `𝒮_{d+2}`. General λ-operations on K₀ are nonlinear and give only the pointed-space fringe constructions, not abelian spectral-sequence endomorphisms. Explicitly, for `i≥2` and `m≥i`, in the total-degree strip `−m≤p+q≤0` there is, modulo `𝒮_{m+d}`, a weight-i direct-summand sequence `E₁^{p,q}=⊕_{x∈X⁽ᵖ⁾}K_{−p−q}(k(x))`⁽ⁱ⁻ᵖ⁾ converging to `K_{−p−q}(X)`⁽ⁱ⁾, with weight-preserving differentials. The low-degree formulas are `K₀=E₂^{0,0}⊕E₂^{1,−1}⊕F²_γK₀` and `K₁=E₂^{0,−1}⊕F²_γK₁`. The all-column decompositions `K₀≅⊕ₚE₂^{p,−p}`, `K₁≅⊕ₚE₂^{p,−p−1}`, `K₂≅⊕ₚE₂^{p,−p−2}` are modulo `𝒮_d`, `𝒮_{d+2}`, `𝒮_{d+2}`, respectively; they do not assert integral degeneration outside these errors. ([Soulé, Théorème 4 (p. 521)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Théorème 4 iii) (p. 522)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(e), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf); [TT90, 2.1.2(e),(g), p.284](https://gwern.net/doc/math/1990-thomason.pdf)).

DVR dévissage twists the boundary: `∂ψ^k=kψ^k∂`, `k≥1`, so rational residue-field weights drop by one. More generally `d₁kᵖψ^k=kᵖ⁺¹ψ^kd₁`. Check a unit loop (weight `1→0`) and an ordered product with an integral unit (weight `2→1`), using the boundary convention of Layer 3. ([Soulé, Proof of Théorème 4 iii) (p. 523)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Weibel, Ex. IV.5.3 (PDF p. 325)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [TT90, 2.1.2(b),(e),(g), p.284](https://gwern.net/doc/math/1990-thomason.pdf)).

### 6.12 Degree-zero supported operations and products

For this independent degree-zero theory, X is separated regular Noetherian of finite dimension, and supports are closed. Its diagonal is affine, so §1.6 supplies the resolution property and global strict representatives. Use that comparison before transporting operations to supported perfect K₀. Codimension always means codimension in X.

For separated regular finite-dimensional Noetherian X with the resolution property, compare the GS strict supported K₀ presentation with TT supported perfect K₀ and `G₀(Y)`. In this separated Noetherian scope the resolution-property hypothesis follows from §1.6: Noetherian gives quasi-compactness, separated gives affine diagonal, and Stacks 0F8A applies. The strict comparison in §§1.5–1.6 restricts to the support condition because quasi-isomorphisms preserve vanishing off Y. This supplies the required comparison without an independent gluing theorem. ([GS87, §1.1–1.9, printed243–248](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [LiLiu.2021, Appendix B, pp.60–61, paragraph preceding (B.3)](https://www.math.columbia.edu/~chaoli/AIPF.pdf)).

Construct GS supported degree-zero Adams operations using the supplied derived exterior-power machinery, and transport through the strict comparison. Transport these operations to every separated regular finite-dimensional Noetherian X by the global strict comparison just obtained. Independence follows from the strict presentation modulo quasi-isomorphism, not from a sheaf property of K₀. Its required outputs are additivity, pullback, support enlargement, multiplicative support pairing and `ψ^k[K(f₁,…,fᵣ)]=kʳ[K]`. ([GS87, §4.6–4.12, printed260–264](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf)).

Name the comparison `SupportK0.strictComparison`: under these hypotheses, the map from GS strict supported K₀ to `π₀𝕂(X on Y)` is an isomorphism, compatible with pullback, tensor and support enlargement. Its inverse uses global bounded vector-bundle representatives from §1.6; independence of representatives uses the strict-to-perfect localization comparison, and every replacement retains the same derived support. Since only K₀ is being compared, the strict presentation relations suffice; an equivalence of triangulated categories is not being used as a substitute for a spectrum-level K-equivalence. ([Stacks, Lemma 36.36.8, tag 0F8A](https://stacks.math.columbia.edu/tag/0F8A); [Stacks, Proposition 36.37.5, tag 0F8I](https://stacks.math.columbia.edu/tag/0F8I); [GS87, §§1.2–1.9, pp.245–248](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf)).

Expose the following interface:

- `SupportK0.lambda` — Degree-zero operations on supported strict models.
- `SupportK0.adams` — Newton Adams operations.
- `SupportK0.adams_cup` — `ψ^k(x∪y)=ψ^k(x)∪ψ^k(y)`, with intersected support.
- `SupportK0.adams_support_enlarge` — Support enlargement commutes with ψ.
- `SupportK0.adams_koszul` — Regular-sequence `length r` gives `ψ^k[K]=k^r[K]`.
- `SupportK0.adams_tt` — Transport agrees with the degree-zero TT support model where strict comparison holds.

**Checks.**

- On DVR support, `ψᵏ[Cone(π)]=k[Cone(π)]`.
- The first operation fixes every class, zero stays zero, and empty support has zero group.
- The two-variable Koszul class on A² has eigenvalue k², detecting codimension.
- A line-bundle class without restricted support has the usual kth tensor-power value.
- On the standard two-chart cover of P¹, h restricts to zero on both charts but `χ(h)=1`. This excludes replacing the strict comparison by groupwise Zariski gluing.

For separated regular finite-dimensional Noetherian X, identify `FᵖK₀^Y` with the degree-zero support-tower image, generated by supports of ambient codimension at least p inside Y. It has full and zero endpoints and is preserved by enlargement. Ambient codimension must not be replaced by codimension in Y. ([GS87, §5.1–5.2, printed264–265](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [LiLiu.2021, Appendix B, pp.60–61, paragraph preceding (B.3)](https://www.math.columbia.edu/~chaoli/AIPF.pdf)).

Using `SupportK0.strictComparison` and the resolution property deduced above, prove `FᵖK₀^Y⊗ℚ=⊕_{q≥p}K₀^Y`,`(q)`, with `0≤q≤dim` X, and `ψ^k=kᵖ` on `Gr_Fᵖ`. The resolution property is established from the standing hypotheses, rather than removed by gluing K₀ groups. ([GS87, Proposition5.3, printed265–266](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [Zhang.2021, AppendixB.1, printed971–973](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf)).

For ordinary separated regular finite-dimensional Noetherian schemes the rational supported product takes `Fᵃ×Fᵇ` into Fᵃ⁺ᵇ on intersected supports. Prove it by the Adams weight decomposition and multiplicativity in the corresponding scope. This target gives neither an integral inclusion nor the formal-scheme extension. ([GS87, Propositions4.11,5.3,5.5; Theorem8.3](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [LiLiu.2021, Appendix B, proof of Lemma B.8, p.62](https://www.math.columbia.edu/~chaoli/AIPF.pdf); [Zhang.2021, AppendixB.1](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf)).

### Examples

The support of a tensor product is the intersection of the supports; O gives the module unit. For the identity morphism the relative spectrum is zero. For the generic-point map of a DVR its relative spectrum is the residue-field spectrum with its `K(O)`-module structure. For a closed immersion i, `i_*(i*y)=[O_Y]y`. On a field the K₀ action is multiplication by its rank, while two degree-one factors anticommute. The sheaf and matrix product comparisons must preserve these actual maps and their homotopies.

The auxiliary λ-product on positive degrees is zero. With `I=0` its unitalization is K₀. With `I=K₁`, `ψ²=−2λ²`; this agrees with `λ²[u]=−[u]`, `ψ²[u]=2[u]`. On `K₁(ℤ)`, odd ψᵏ fixes −1 and even ψᵏ kills it. The genuine degree-two product of unit classes instead satisfies `ψᵏ([u]·[v])=k²([u]·[v])`. For a line element L, `ψᵏ(L−1)`≡`k(L−1)` modulo F². On P², with `h=1−O(−1)`, `ψᵏh=kh−binom(k,2)h²`. The weight-one projection is `h+h²`/2; h alone is not a weight-one eigenvector and there is no corresponding integral splitting.

In the stable representation ring, the component of ψᵏ∞ at `GL_N` has character `ΣXᵢᵏ−N`. The component of γᵏ∞ is zero when `N<k` and at `N=k` has character `∏(Xᵢ−1)`. At GL₁, composition of ψᵏ and ψˡ gives `t^{kl}−1`. Test the universal iteration polynomial `λ²λ²=a₁a₃−a₄`. For the trivial group `R_A(1)=K₀(A)`; for C₂ over ℂ it is `ℤ[σ]`/`(σ²−1)`. In characteristic p, Frobenius on matrices gives ψᵖ. Thus `ψᵖ=id` on `R_{𝔽_p}(G)`, even for `p=2`. The reduced classifying map kills the trivial representation and records its rank in the separate K₀ component.

For a field, `F²_γK₁=0` and `K₂=F²_γK₂`. The upper γ-bound has `r=1`, giving vanishing in operation degree `k≥m+1`. A Dedekind domain has `F²_γK₀=0`. The denominator integers start `w₁=2` and `w₂=24`. Rationally `K₂(F)` has only weight two and `K₃(F)` has weights two and three. Positive K-groups of finite fields are torsion; their sharper integral Adams eigenvalues are supplied by KTheoryFiniteLocalFields, not deduced by rationalization. No low-weight vanishing conjecture or Milnor top-weight presentation is needed here.

For E of rank one its flag bundle is X; for `E=O²` it is `P¹_X`. The complete flag variety of kⁿ has dimension `n(n−1)`/2 and K₀ `rank n`!. For `E=O⊕O(1)` on P¹, its flag surface has `K₀=ℤ⁴`. Exterior powers give `λ²(O+O(1))=O(1)`. These tests compare the splitting construction with the existing sheaf exterior powers and retain negative virtual classes.

A constant discrete sheaf has hypercohomology H⁰ equal to its global sections; on a point `H^{−m}` of a pointed space is `π_m`. P¹ is K-coherent and the sheaf comparison retains `O(1)`. The line with doubled origin is also within the ample-family scope because its intersection `G_m` is affine and its diagonal is affine. The plane with doubled origin is excluded: its vector-bundle K₀ is ℤ and its perfect K₀ is ℤ². In relative support, check π₀ and π₁ using group-completed models rather than put a group law on arbitrary finite-rank pointed mapping sets. Empty support gives zero; full support has dimension bound d, and a proper support uses `D=max(dim X,dim U+1)`.

On P¹, `ψᵏ(1−O(−1))=k(1−O(−1))`; for a Dedekind ideal I, `ψᵏ(I−1)=k(I−1)`. Smooth X agrees with the smooth-factorization construction for singular X. For the dual numbers, `ψᵏ(1+aε)=1+kaε`. A regular curve has `F²_γK₀=0`, and rational K₁ has weights one and two; its weight-one part is global units. A finite-coefficient application additionally needs the integral endpoint decompositions and additive coefficient operations. In an extension of two weight-i endpoints, the Adams map can have a nonzero square-zero off-diagonal entry: the correct summand is a generalized weight space, with the same primitive-root independence.

For a line L, `θ²(L)=1+L`; for a trivial rank-c conormal `θᵏ=k^c`. Twisting by a trivial line makes the nonunital multiplication zero. The divisor resolution `O(−D)→O` gives `ψᵏ(1−L)=1−Lᵏ=(1−L)θᵏ(L)`. This fixes the conormal correction. A codimension-c trivial-conormal Gysin map raises Adams weight by c, so a rational point on a regular curve sends weight-one K₁ into weight two. The surface point sends its K₀ class into weight two. Finite étale transfer commutes with Adams after the stated multiplication by k; for the identity map the assertion is immediate.

On the coniveau page of a regular curve, Adams acts as ψᵏ on the generic group and kψᵏ on residue groups. A uniformizer satisfies `∂ψᵏ[π]=k=kψᵏ∂[π]`; this also fixes the residue shift in degree two. A length-c regular-sequence Koszul class has supported Adams eigenvalue `k^c`. Support codimension is ambient codimension; enlargement preserves it. Weighted rational products use addition of eigenweights. These degree-zero comparisons use global strict models supplied by §1.6 in the separated regular Noetherian scope.

### Dependencies

Layers 1–5, including §3.6’s determinant and unit comparison; GeneralAlgebraicKTheory Layers 3, 5–7 and §8.13; StableHomotopyKTheory Layers 5 and 7; EnhancedDerivedSheaves E5:cotangent-export for coherent derived polynomial operations; AlgebraicVectorBundles and the projective/flag geometry of AlgebraicModuliForArithmeticGeometry §§1.1–1.3. The unstable A¹ category, K-representability and the supported strict-to-perfect comparison are explicit targets here. The latter uses §1.6 to deduce the resolution property. The finite-coefficient construction in §6.9 uses the pointed-sheaf model and finite-cell K-coherence before applying CRT.

## Layer 7: Chern characters and Riemann–Roch

### 7.1 The γ-filtration and cycle classes

The rank-augmented vector-bundle λ-ring is defined for quasi-compact schemes. The general degree-zero coniveau inclusion below uses Noetherian X; the higher-degree inclusion has the explicitly narrower regular finite-type-over-a-field ample-family scope.

For quasi-compact X apply the supplied γ-filtration to the rank-augmented special λ-ring K₀(Vect X). It is multiplicative, contravariant and has `F¹=ker` rank. Identify it with a filtration on perfect K₀ only where the resolution-property comparison is available; on affines use the low-degree owner's filtration. ([Weibel, Corollary II.8.8.2 (PDF p. 161)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, Introduction (p. 488)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration` — `F^i_γK_0(X)`, an ideal of `K_0`(Vect X).
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_mul` — `F^iF^j ⊆ F^{i+j}`; `F^{i+1} ⊆ F^i`; `F^0 = K_0`, `F^1 = ker(rank)`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_pullback` — `f^*(F^i_γK_0(X)) ⊆ F^i_γK_0(X')`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_affine` — For `X = Spec` A, `F^i_γ` is the affine γ-filtration of §6.2.4.
- `TauCeti.AlgebraicGeometry.KTheory.gammaGraded` — `gr^•_γK_0(X)`, a graded `H^0(X, ℤ)`-algebra.
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_first` — `F^1/F^2 ≅ Pic(X)` and `F^2 = SK_0(X)` (Layer 7).

**Checks.**

- For a field the rank kernel is zero.
- On P¹, with `h=1−[O(−1)]`, `F¹=ℤh` and `F²=0`.
- On P², `F²=ℤh²` and `F³=0`.
- On affines this is exactly the low-degree supplier's γ-filtration.
- Equality with the support filtration is asserted rationally in the regular finite-type scope; on general Noetherian X the map from vector-bundle K₀ only gives the stated inclusion.

Rank identifies gr⁰ with locally constant integers, while determinant identifies gr¹ with Pic(X), sending L to `[L]−1`. Thus `F²=ker(rank,det)`. Prove the rank/determinant ring formula `(a,L)(b,M)=(ab,L^{⊗b}⊗M^{⊗a})` by gluing the supplied determinant identities, including disconnected X. ([Weibel, Theorem II.4.7 (PDF p. 104)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Theorem II.8.1 (PDF p. 153)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For Noetherian X the image of `F_γᵖK₀(Vect X)` in perfect K₀ lies in the codimension-support filtration. For regular finite-type schemes over a field with ample family, `F_γᵖK_m⊂F_cod^{p−m}K_m`, hence the full bound `F_γ^{m+d+1}=0`. The latter uses the Brown/coniveau comparison theorem, including its filtered enhancement. ([GS99, Introduction (p. 1)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [GS99, Theorem 4 (p. 51)](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf); [TT90, 2.1.2(e),(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Generic-length classes give a surjection `Zᵖ(X)→gr_codᵖG₀(X)` for Noetherian X, `[V]`↦`[O_V]`. Divisors of rational functions vanish, so it factors through the codimension-p coniveau divisor quotient of §4.5. Identify that quotient with the usual CHᵖ only under the dimension-function hypothesis stated there. In the finite-dimensional coniveau setting identify it with the diagonal edge map; rational invertibility requires the later comparison hypotheses. ([Weibel, Proof of Corollary II.8.9.1 (PDF p. 163)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, Proof of Théorème 5 iii) (p. 527)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

### 7.2 Chow-valued Chern characters

First use smooth quasi-projective schemes over a field, where the Chow ring, Chern classes and splitting identities are supplied. Every assertion in a broader regular separated finite-dimensional Noetherian scope is conditional on those same intersection-theory interfaces at that scope. The integral leading-Chern-class identity below is proved here from the supplied geometric Chern classes; no broader supported-Chern supplier is assumed.

Compare SchemeAndStackFoundations §5.7’s geometric Chern character on vector-bundle K₀ and coherent G₀ with π₀ of the perfect and coherent spectra defined here, using the resolution and Cartan equivalences in their stated scopes. Prove that the comparison respects those equivalences and the geometric line, rank and determinant normalizations. The ring map, its Newton-polynomial components, pullback and coherent interpretation are supplied by §§5.4 and 5.7; the new content is compatibility with the spectral K/G realizations and the Adams operations below. Start on smooth quasi-projective varieties over a field. Any broader regular separated finite-dimensional realization has the equally broad Chow/Chern supplier contract as an explicit hypothesis. ([Weibel, II.4, Chern character (PDF p. 108)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Borel–Serre, §6 (p. 112)](http://www.numdam.org/item/10.24033/bsmf.1500.pdf)).

Expose the following interface:

- `chernCharacter_perfectComparison` — The geometric Chern character agrees with the character transported to π₀ of perfect K under the vector-bundle comparison.
- `chernCharacter_coherentComparison` — The coherent geometric character agrees with the π₀ G interpretation under the supplied Cartan and Euler comparisons.
- `chernCharacter_adams` — For `k≥1`, the degree-n geometric character of ψᵏx is `kⁿch_n(x)`, under these realization comparisons.

**Checks.**

- The character of a trivial rank-r bundle is r.
- On P¹, `ch(O(n))=1+n[pt]` and `ch(1−O(−1))=[pt]`.
- On P², the point Koszul resolution gives `ch(O_pt)=(1−e^{−h})²=h²`.
- For `L⊕L` with `a=c₁L`, the total Chern class is `(1+a)²` but the character is 2eᵃ; these are different constructions.
- The nth component kills `F^{n+1}_γ` and weights other than n; on Fⁿ it equals `(−1)^{n−1}c_n`/`(n−1)`!.

For `k≥1`, `ch_n(ψ^kx)=kⁿch_n(x)` and `c_n(ψ^kx)=kⁿc_n(x)`. Consequently the rational Chern character is graded for Adams weights. The Chern-class formula is a polynomial scaling identity; `c_n` itself is not an additive map on K₀. ([Weibel, Proposition II.4.11.3 (PDF p. 107)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

Prove `chernClass_structureSheaf_leading`: for an integral codimension-i subvariety, `i≥1`, of smooth quasi-projective X over a field, `c_j(O_Z)=0` for `1≤j<i` and `c_i(O_Z)=(−1)^{i−1}(i−1)![Z]`. Equivalently the leading rational ch component is `[Z]`. The divisor resolution `O(−D)→O` fixes the positive sign at `i=1`. ([Weibel, Ex. II.8.7 (PDF p. 165)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Weibel, Proof of Corollary II.8.9.1 (PDF p. 163)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For smooth quasi-projective X over a field, ch:`K₀(X)_ℚ≃CH*(X)_ℚ` is a graded ring isomorphism. Identify `gr_γⁱ`, Adams weight i, `gr_codⁱ` and CHⁱ rationally, with equal rational filtrations and `c_i` factor `(−1)^{i−1}(i−1)`!. State the integral comparison only modulo Soulé's `𝒮_d`; no integral Chow/γ-graded isomorphism is claimed. ([Weibel, Corollary II.8.9.1 (PDF p. 162)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Soulé, Théorème 4 iv) (p. 521)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

### 7.3 The γ-valued Chern character

For the rank-split augmented special λ-rings and nonunital λ-modules used here, with full γ-filtration finite rationally, define the γ-Chern character by the Newton polynomials in `γⁱ(x−rank x)`, divided by i! in `gr_γⁱ`. Use the canonical locally constant trivial-bundle rank section; for a general augmentation include a λ-section as input. Prove operation compatibility and rational weight/graded isomorphism through the full bounded weighted λ-module theorem. Higher Chow or motivic Chern characters are separate targets of their owner. ([Soulé, 7.1 (p. 532)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.gammaChern` — For regular noetherian finite-dimensional X with an ample family and the stated finite full γ-filtration, `ch: K_m(X) → ⊕_i gr^i_γK_m(X) ⊗ ℚ`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_add` — For regular noetherian finite-dimensional X with an ample family and the stated finite full γ-filtration, ch is additive.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_mul` — For regular noetherian finite-dimensional X with an ample family and the stated finite full γ-filtration, `ch(xy) = ch(x)ch(y)` for the product on `K_*(X)`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_adams` — For regular noetherian finite-dimensional X with an ample family and the stated finite full γ-filtration, `ch_i ∘ ψ^k = k^ich_i`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_bijective` — For regular noetherian finite-dimensional X with an ample family and the stated finite full γ-filtration, `ch ⊗ 1` is an isomorphism `K_m(X)_ℚ ≅ ⊕gr^i_γK_m(X)_ℚ`.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_pullback` — For both X and X′ regular noetherian finite-dimensional with ample families and the stated finite full γ-filtrations, ch commutes with `f^*`.

**Checks.**

- Zero maps to zero and the zeroth component is the augmentation.
- A line element maps to `Σ(ℓ−1)ⁱ`/i! in the associated graded.
- On P², for `h=1−O(−1)`, the second component is −h²/2, which is not integral.
- The γ-graded/Chow comparison carries this character to the ordinary rational Chern character.

### 7.4 Euler transfers and geometric Riemann–Roch

For the Euler transfer use proper morphisms of Noetherian schemes, perfect for the K-version. For Chow-valued GRR and its Hirzebruch consequence use proper morphisms between smooth quasi-projective varieties over an algebraically closed field. This source scope does not supply arithmetic-base Chow-valued GRR.

Compare π₀ of the constructed proper G-transfer with `[F]`↦`Σ_q(−1)^q`[`R^qf_*F`]. For proper perfect f, compare the K-transfer with the same class under Cartan; closed-immersion direct image is underived. This identifies the geometric Euler pushforward used in Riemann–Roch with the actual K/G map. ([Weibel, Example II.8.2.3 (PDF p. 155)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Borel–Serre, §5d (p. 110)](http://www.numdam.org/item/10.24033/bsmf.1500.pdf)).

For proper maps of smooth quasi-projective varieties over an algebraically closed field, geometric GRR becomes `ch(f_*x)td(T_Y)=f_*(ch(x)td(T_X))` for the K-transfer just compared. Here td has root a/`(1−e^{−a})`, with denominators 2,12,… retained. The target is this realization compatibility; the geometric GRR theorem is supplied by intersection theory in exactly this source scope. ([Borel–Serre, §7 (p.113), Lemmas 15–16 and §§9–16 (pp.114–135; PDF pp.19–40)](http://www.numdam.org/item/10.24033/bsmf.1500.pdf); [Weibel, Theorem II.8.10 (PDF p. 163)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)).

For smooth projective X over an algebraically closed field, `χ(F)=deg(ch(F)td(T_X))`. On a smooth projective geometrically connected curve this gives `χ(O(D))=deg D+1−g`. Compare Serre duality, JacobianChallenge's curve RR and Tau Ceti's function-field RR using the existing point/divisor/cohomology dictionary; do not prove another curve RR theorem. ([Weibel, Theorem II.8.10 (PDF p. 163)](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Borel–Serre, §7 (p. 113)](http://www.numdam.org/item/10.24033/bsmf.1500.pdf)).

### 7.5 Homological Adams operations and Riemann–Roch

Fix a regular irreducible finite-dimensional Noetherian base S with an ample family. X is any quasi-projective S-scheme, possibly singular. Smooth quasi-projective ambient embeddings inherit the required ample families. Use `k≥1` and invert k. The pushforward assertion is for projective morphisms, with the supplied embedding and smooth-ambient comparisons.

For quasi-projective schemes over a regular irreducible finite-dimensional Noetherian base S with ample family, construct homological Adams `φ^k` on `G_m[1/k]`, the finite increasing filtration `F_j` and σ to its associated graded. A smooth equidimensional ambient embedding of absolute dimension d identifies `F_j` with supported `F_γ^{d−j}`; normalize `k^{dim S}φ^k` by `ψ^k` times `θ^k(−T^∨_{M/S})`. Prove embedding independence and `φ^k=k^{−j}` on `Gr_j`. In the σ formula, the inverse ambient pushforward is on shifted associated graded groups. Write `Θ^k(M)=θ^k(−T^∨_{M/S})` for this correction. For two ambient embeddings compare in their product, use regular-immersion Riemann–Roch to identify the corrected operations, and transport the dimension-shifted associated graded groups. The scalar `k^{dim S}` is needed for the absolute-dimensional indexing. ([Soulé, Théorème 7 (p. 533)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Théorème 7, step 1 (p. 534)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

Expose the following interface:

- `TauCeti.AlgebraicGeometry.KTheory.gAdams` — `φ^k` on K'`_m(X) ⊗ ℤ[1/k]` for X quasi-projective over a regular S.
- `TauCeti.AlgebraicGeometry.KTheory.gFiltration` — The increasing filtration `F_jK'_m(X) ⊗ ℚ`.
- `TauCeti.AlgebraicGeometry.KTheory.gRiemannRoch` — `σ: K'_m(X)_ℚ ≅ ⊕Gr_jK'_m(X)_ℚ`.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_graded` — `φ^k` acts on `Gr_j` by `k^{−j}`.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_comp` — `φ^kφ^l = φ^{kl}`.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_embedding_indep` — The definitions do not depend on the closed immersion into a smooth M.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_smooth` — On smooth equidimensional `X → S`, surjective, let η: `G_m(X) ≅ K_m(X)` be Cartan duality. Then `k^{dim S}η(φ^k x) = ψ^k(η x)Θ^k(X)`. Under the induced isomorphism of associated graded groups, `σ(x)` corresponds to `ch_γ(η x)Td_γ(X)`; `ch_γ` takes values in γ-graded K-theory, not Chow groups for arbitrary m.

**Checks.**

- Over a field, on smooth X the homological operation is ψᵏ multiplied by `θᵏ(−T_X∨)`.
- On a field point `θ=1` and `F₀G₀=ℤ`.
- A closed point of a smooth curve has homological weight zero: its cohomological eigenvalue k cancels the tangent correction k⁻¹.
- On P¹ the tangent correction of 1 is not 1 for `k≥2`, so homological Adams must not be identified with ψᵏ.

Prove homological Adams and σ commute with projective pushforward and open pullback, and their cap/external-product identities. On smooth schemes this yields `ψ^k(f_*x)Θ^k(Y)=f_*`(`ψ^kx·Θ^k(X)`), equivalently `ψ^k(f_*x)=f_*`(`θ^k(−T_f^∨)ψ^kx`), after inverting k. For a closed immersion the correction is `θ^k`(conormal), agreeing with Layer 6. ([Soulé, Théorème 7 ii) (p. 533)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [Soulé, Proof of Théorème 7, step 5 (p. 537)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427); [TT90, 2.1.2(h), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

### 7.6 Excess and self-intersection

Use a cartesian square with i:`Y→X`, i′:`Y′→X′` regular closed immersions of qcqs schemes and f:`X′→X` arbitrary. The excess conormal F is the locally free kernel of `f′*(I/I²)→I′`/I′². This section requires no regularity of the ambient schemes.

For a cartesian square of qcqs schemes with both horizontal closed immersions regular and excess conormal kernel F locally free, identify `Tor_k^{O_X}(O_{X′},O_Y)` with `Λ^kF` for every `k≥0`. The groups are finite locally free over the intersection and vanish above `rank F`. Prove the identification using the pulled-back Koszul complex. ([Thomason93, Lemme 3.2 (p. 207)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

In the excess square, let `W⊂X` be closed and `Z⊂Y∩W` closed, with `X∖W` and `Y∖Z` quasi-compact. Put `W′=f⁻¹W` and `Z′=f′⁻¹Z`, and assume the inverse-image complements quasi-compact. Construct the homotopy `f*` `i_*≃i′_*(λ₋₁(F)·f′*)` as maps `𝕂(Y on Z)→𝕂(X′ on W′)`, using support enlargement from Z′ to W′ on the right. Give the resulting equality in every integer K-degree. Neither ambient scheme needs to be regular; the regular immersions and excess conormal bundle supply the perfect transfers. ([Thomason93, Théorème 3.1 (p. 206)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf); [Thomason93, Introduction (p. 195)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

Taking the square of a regular immersion with itself gives `i*` `i_*=λ₋₁(I/I²)`·− on supported or unrestricted K in all degrees. If the conormal has a trivial line summand the operator is zero, since `λ₋₁(O)=1−1`. Keep conormal versus dual normal conventions explicit. ([Thomason93, (3.1.4) (p. 207)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

For a rational point P of a regular curve over F, `P*P_*=0` on every `K_m(F)`, since its rank-one conormal is an F-vector line. This is the self-intersection input for the rational-base-point splitting in elliptic K-theory, not an asserted splitting of arbitrary curve K-groups here. ([Thomason93, (3.1.4) (p. 207)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf)).

### 7.7 Supported cycles and dimension-one classes

Let X be separated regular Noetherian of finite dimension, Y closed. For the dimension-graded interpretation additionally assume X pure d-dimensional and catenary, with dim closure{x}+`codim_Xx=d`. Rational coefficients are retained. No general mixed-characteristic Gersten exactness is an input.

For separated regular finite-dimensional Noetherian X and closed Y, define the supported cycle class on all ambient codimensions `q≥p` by `[V]`↦`[O_V]` via regular ambient dévissage. It maps to `FᵖK₀^Y` and is compatible with support enlargement. On Grᵖ it kills supported rational-equivalence relations after rationalization. ([LiLiu.2021, Appendix B, (B.3) and following paragraph, p.61](https://www.math.columbia.edu/~chaoli/AIPF.pdf); [GS87, §5.2 and §8.1–8.2](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf)).

Expose the following interface:

- `SupportedCycle.kClass` — Map the `cycle[V]` to`[O_V]` in supported K₀.
- `SupportedCycle.kClass_filtration` — `Codimension≥p` maps into `F^p`.
- `SupportedCycle.support_enlarge` — Class maps commute with support enlargement.
- `SupportedCycle.generic_length` — The leading coefficient at a codimension-p generic point is the module length.
- `SupportedCycle.chow_graded` — On the p-th graded quotient the rationalized map descends to `CH_Y^p(X)`.

**Checks.**

- On a DVR the closed point gives `[Cone(π)]` and leading generic length one.
- Zero cycles and empty support give zero.
- The module O/πᵐ has leading cycle `m[s]`, not merely `[s]`.
- Enlarging the support keeps both this class and its ambient codimension one.

Prove `CH_Yᵖ(X)_ℚ≃Gr_FᵖK₀^Y(X)_ℚ` using the ordinary-scheme supported operations and filtration comparison of Layer 6, using `SupportK0.strictComparison` of §6.12 and the resolution property deduced from separated regular Noetherian hypotheses in §1.6. Here relations use codimension-`(p−1)` subvarieties contained in Y, and codimension is measured in X. Only in an equidimensional catenary ambient scheme of dimension d identify this with `CH_{d−p}(Y)_ℚ`. ([GS87, §8.1 and Theorem8.2, printed274–275](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [LiLiu.2021, Appendix B, p.61, paragraph following (B.3)](https://www.math.columbia.edu/~chaoli/AIPF.pdf); [TT90, 2.1.2(d),(e),(g), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

For regular separated Noetherian catenary pure d-dimensional X with dim closure{x}+`codim x=d`, supported dévissage identifies the `p=d−1` comparison with `Gr₁G₀(Y)_ℚ≃CH₁(Y)_ℚ` by generic lengths. For Y proper over a Dedekind base retain the map to Zhang's proper one-cycle quotient with its vertical rational-equivalence relations; no isomorphism to that further quotient is asserted. ([Zhang.2021, §9.1, printed924–925, Gr₁ diagram](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf); [GS87, Theorem8.2, printed274–275](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf); [TT90, 2.1.2(d),(e),(g), p.284; 3.8–3.10, p.316](https://gwern.net/doc/math/1990-thomason.pdf)).

### Examples

For a field the reduced γ-filtration on `K₀=ℤ` is zero. On P¹, `F¹=ℤ(1−O(−1))` and `F²=0`; the determinant sends its generator to `O(1)`. A Dedekind domain gives `F¹/F²=Cl(A)`, with `F²=0`. On P² the square h² is the point class and lies in coniveau two. More generally the projective linear-subspace cycle maps to `h^p` on Pⁿ.

The Chern character of `O(n)` on P¹ is 1+nH, with `H²=0`. On Pⁿ it sends `h=1−O(−1)` to 1−exp(−H), an invertible triangular change of rational basis. It sends a trivial rank-r bundle to r and respects products; `ch(h²)=ch(h)²=0` on P¹. Adams multiplies `ch_i` by `k^i` and fixes rank. The two-term divisor complex `O(−D)→O` gives `c₁(O_D)=[D]`. For a codimension-two point, `c₂(O_P)=−[P]`. The coefficient in codimension c is `(−1)^{c−1}(c−1)`!, including the positive divisor sign.

A connected smooth projective curve has the sharper integral calculation `K₀=ℤ⊕Pic` and `CH¹=Pic`. This does not follow merely by saying the Serre class is trivial: Soulé's class in weight one still permits bounded 2-primary torsion. The γ-valued character on higher K₁ projects its unit part onto `gr¹=O×⊗ℚ`. Its rank augmentation uses locally constant integers, and the abstract augmented-ring version requires its specified λ-section.

For π:`P¹→Spec` k, `π_*O(n)=χ(O(n))=n+1`, including `n≤−2` where the contribution is negative H¹. Its Todd class is `1+H` and `deg((1+nH)(1+H))=n+1`. On a genus-one curve `χ(O(D))=deg D`. A finite morphism has no higher direct images, so its Euler transfer is its ordinary coherent direct image. The Chow-valued geometric GRR theorem here retains its algebraically closed field hypothesis.

For the K-valued Adams Riemann–Roch check, let `h=1−O(−1)` on P¹ and `k=2`. The cotangent line is `O(−2)=1−2h`, so `θ²(−T∨)=(2−2h)⁻¹=(1+h)`/2. Its Euler pushforward is `(1+1)`/`2=1=ψ²π_*1`. This computation fixes inverse, dual and denominator at once. At the field point `Spec F` the homological operation is ψᵏ, and `G₀(F)=ℤ` has its full dimension-zero filtration; higher G-groups are not placed there by that statement.

For a Tor-independent intersection the excess bundle is zero and the formula reduces to base change. For self-intersection the excess bundle is the conormal and `Tor_j=Λ^jN`. For the zero section of a line bundle L, `i*i_*(y)=(1−L∨)y`. For a point on a smooth surface the factor is `(1−1)²=0`. At a rational point on a regular curve, the two-term derived self-tensor has `Tor₀=Tor₁=k`, so `P*P_*=0` on both K₀ and K₁.

A supported cycle `V⊂Y` maps to `[O_V]`, and its codimension is measured in X. On a regular surface a curve is ambient codimension one. On a regular threefold a curve is codimension two, so replacing the dimension-one G-filtration by codimension one gives the wrong group. For zero-dimensional Y, `CH₁(Y)=0` and `F₁G₀(Y)`/`F₀G₀(Y)=0`. The rational Chow-with-support comparison respects enlargement and uses relations from integral subvarieties contained in Y; it is not an identification with unrestricted `CH^p(Y)`.

### Dependencies

Layers 1–6; GrothendieckEulerForms’ implemented Euler/Cartan APIs; SchemeAndStackFoundations §§5.4, 5.7–5.8 for cycles, intersection, geometric Chern classes and GRR at their stated scopes; JacobianChallenge A–C for Picard/divisor and curve cohomology/Riemann–Roch dictionaries; GeneralAlgebraicKTheory Layer 7 for coherent pairings, specialized to supports and cap products in §6.1. Formal-scheme supported intersections and Chow-valued Riemann–Roch over arithmetic bases are separate downstream mathematics.

## Downstream consumers

EllipticKTheory uses the curve localization and coniveau sequences, projective-line coordinates, Gysin weight shifts, rational point self-intersection and invariance of the integral K₂ image under regular blowups. EllipticRegulators uses the vertical component residue comparison and `d₁²=0` on arithmetic surfaces. Low-degree consumers use the scheme projective-bundle coordinates and the rank, determinant and λ-ring comparisons of §§3.6 and 6.2–6.3.

K2SymbolsBrauer compares its explicitly normalized tame symbols with the ordered unit boundaries here. KTheoryFiniteLocalFields uses genuine representation operations and Frobenius compatibility; its finite-field computations supply sharper integral eigenvalues independently of the rational scheme weight theorem. MotivicEtaleKTheory uses scheme descent, the unstable A¹ representability interface and Adams weights, and owns motivic or higher-Chow refinements.

The Witt-vector affine Grassmannian and mixed-characteristic geometric Satake directions use supported Witt perfect categories, their hyperdescent, quasi-isogeny K₀ classes and the degree map. Arithmetic intersection and automorphic cycle consumers use the ordinary-scheme supported Chow comparison, with their own formal-scheme extension and proper-cycle quotient where required.

## References

All statements above are mathematical targets. The locators refer to the following versions; page numbers of a different published edition are not silently substituted.

- **Weibel.** Charles A. Weibel, [The K-book: an introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Author-hosted combined draft of 29 August 2013 (Kbook.pdf); PDF page = book page + 8; the published AMS GSM 145 numbering differs.
- **TT90.** R. W. Thomason and Thomas Trobaugh, [Higher algebraic K-theory of schemes and of derived categories](https://gwern.net/doc/math/1990-thomason.pdf). The Grothendieck Festschrift, vol. III, Progr. Math. 88, Birkhäuser 1990, pp. 247–435; scanned copy of 189 PDF pages, printed page = PDF page + 246.
- **Stacks.cohomology.** The Stacks Project Authors, [The Stacks Project, Chapter Cohomology of Sheaves (tag 01DW)](https://stacks.math.columbia.edu/download/cohomology.pdf). Chapter PDF cohomology.pdf, version ed88ff78 compiled 14 July 2026; results cited by section numbers and tags.
- **Stacks.perfect.** The Stacks Project Authors, [The Stacks Project, Chapter Derived Categories of Schemes (tag 08CU)](https://stacks.math.columbia.edu/download/perfect.pdf). Chapter PDF perfect.pdf, version ed88ff78 compiled 14 July 2026.
- **Stacks.more-algebra.** The Stacks Project Authors, [The Stacks Project, Chapter More on Algebra (tag 05E3)](https://stacks.math.columbia.edu/download/more-algebra.pdf). Chapter PDF more-algebra.pdf, version ed88ff78 compiled 14 July 2026.
- **Stacks.derived.** The Stacks Project Authors, [The Stacks Project, Chapter Derived Categories (tag 05QI)](https://stacks.math.columbia.edu/download/derived.pdf). Chapter PDF derived.pdf, version ed88ff78 compiled 14 July 2026.
- **Schlichting.** Marco Schlichting, [Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf). Author preprint dated 16 June 2003 (28 pages), locators use the preprint pagination; published in Math. Z. 253 `(2006)`.
- **Totaro.2004.** Burt Totaro, [The resolution property for schemes and stacks](https://arxiv.org/pdf/math/0207210). arXiv:math/0207210v1 (23 July 2002), 23 pages; published J. reine angew. Math. 577 `(2004)`. Locators use the arXiv version.
- **Quillen.** Daniel Quillen, [Higher algebraic K-theory: I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf). Published LNM 341 `(1973)`, pp.85–147, author-hosted scan. Two page sequences: scan header 77–139, LNM footer 85–147; physical PDF page = header−76 = LNM page−84. Theorem 5.13 is header p.127, LNM p.135, PDF p.51.
- **Thomason.1985.** R. W. Thomason, [Algebraic K-theory and étale cohomology](http://www.numdam.org/item/10.24033/asens.1495.pdf). Annales scientifiques de l'École Normale Supérieure `(4)` 18 `(1985)`, 437-552 (numdam copy; PDF page = printed page - 435)
- **Stacks.Properties.** The Stacks Project Authors, [The Stacks Project, Chapter 28: Properties of Schemes](https://stacks.math.columbia.edu/download/properties.pdf). Chapter PDF; results cited by section and tag.
- **Thomason93.** R. W. Thomason, [Les K-groupes d'un schéma éclaté et une formule d'intersection excédentaire](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf). Inventiones mathematicae 112 `(1993)`, 195–215, Göttingen digitisation-centre scan; PDF page = printed page − 193, including one cover page.
- **Stacks.** The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). Online version; results identified by stable tags.
- **Soulé.** Christophe Soulé, [Opérations en K-théorie algébrique](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427). Canadian Journal of Mathematics 37 `(1985)`, no. 3, 488–550 (published version, from the journal's open archive)
- **GS99.** Henri Gillet and Christophe Soulé, [Filtrations on higher algebraic K-theory](http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf). Archived author/preprint fff.pdf, 60 pages; locators use its own numbered pages. Published in PSPM 67 `(1999)`, pp. 89–148. The locators above use the archived 60-page version, rather than the 66-page CERN IHES-M-98-82 version.
- **Serre.1968.** Jean-Pierre Serre, [Groupes de Grothendieck des schémas en groupes réductifs déployés](http://www.numdam.org/item/10.1007/BF02684589.pdf). Publications mathématiques de l'IHÉS 34 `(1968)`, 37–52 (NUMDAM scan)
- **Kratzer.** Christian Kratzer, [λ-Structure en K-théorie algébrique](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf). Commentarii Mathematici Helvetici 55 `(1980)`, 233–254 (GDZ scan)
- **Riou.** Joël Riou, [Algebraic K-theory, A¹-homotopy and Riemann–Roch theorems](https://arxiv.org/pdf/0907.2710). arXiv:0907.2710v2 (9 September 2009)
- **Borel–Serre.** Armand Borel and Jean-Pierre Serre, [Le théorème de Riemann-Roch](http://www.numdam.org/item/10.24033/bsmf.1500.pdf). Bulletin de la SMF 86 `(1958)`, 97–136 (NUMDAM scan)
- **GS87.** Henri Gillet and Christophe Soulé, [Intersection theory using Adams operations](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0090/LOG_0018.pdf). Published Inventiones 90 `(1987)`, pp.243–277. The GDZ PDF has 37 physical pages; the article occupies PDF pp.2–36, with printed page = PDF page+241.
- **BS17.** Bhargav Bhatt and Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/pdf/1507.06490v3). arXiv:1507.06490v3, 61 PDF pages, the preprint of the 2017 Inventiones article; all locators use this version.
- **Zhang.2021.** Wei Zhang, [Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf). Ann. Math. 193 `(2021)`, 863–978; 116-page published PDF; printed page = PDF page + 862.
- **LiLiu.2021.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author final copy, 20 October2021, 67 pages; AppendixB on PDF60–62. Published Ann. Math. 194 `(2021)`.
- **Zhu.2017.** Xinwen Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Ann. Math. 185 `(2017)`,403–492; RemarkB.3, printed483.
- **Bhatt.2014.** Bhargav Bhatt, [Algebraization and Tannaka duality](https://arxiv.org/pdf/1404.7483v1). arXiv:1404.7483v1, 35 pages; Lemma5.12 and Remark5.13 on PDF23.
- **Scholze.** Peter Scholze, [Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf). Author copy dated21 January2026, 65 pages; §8 Proposition8.8 on PDF47. Published JAMS39(2026)697–764; no assertion that the versions coincide.
- **Hoyois.2016.** Marc Hoyois, [A trivial remark on the Nisnevich topology](https://hoyois.app.uni-regensburg.de/papers/allagree.pdf). Author note dated 30 January 2016, one page.
- **AsokHoyoisWendt.2015.** Aravind Asok, Marc Hoyois and Matthias Wendt, [Affine representability results in A¹-homotopy theory I: vector bundles](https://arxiv.org/pdf/1506.07093v2). arXiv:1506.07093v2, 20 pages; numbered pages11–12 are PDF11–12.
- **Brown–Gersten.** Kenneth S. Brown and Stephen M. Gersten, [Algebraic K-theory as generalized sheaf cohomology](https://pi.math.cornell.edu/~kbrown/scan/1973.0341.0266.pdf). Published LNM 341 `(1973)`, pp.266–292, author-hosted scan; two preliminary PDF pages, printed page = PDF page +263.
- **Stacks.Divisors.0GML.** The Stacks Project Authors, [The Stacks Project, Divisors](https://stacks.math.columbia.edu/tag/0GML). Tag 0GML, Divisors Lemma 31.17.8.
- **Panin.2003.** Ivan Panin, [The equicharacteristic case of the Gersten conjecture](https://www.mathnet.ru/eng/tm394). Trudy Mat. Inst. Steklova 241 `(2003)`, 169–178, original English-language article. The English translation has pagination 154–163. Use the original pagination here.
- **Geisser.** Thomas Geisser, *p-adic K-theory of Hecke characters of imaginary quadratic fields and an analogue of Beilinson’s conjectures*, author-hosted 34-page manuscript, §1.1, pp.3–4: Moore-space coefficient operations and Bockstein compatibility in the stated finite-type-over-a-field scope. [PDF](https://www2.rikkyo.ac.jp/web/geisser/padicKtheory.pdf).
