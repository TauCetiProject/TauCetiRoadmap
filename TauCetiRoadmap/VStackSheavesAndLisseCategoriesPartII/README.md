# Roadmap: Artin v-stacks, solid and lisse coefficient categories, part II — decent v-stacks, cohomological correspondences and the Lefschetz–Verdier trace formula

**Summary.** This Part II of *Artin v-stacks, solid and lisse coefficient categories* constructs the exceptional functors Rf_! and Rf^! for fine maps between decent v-stacks, which include stacky maps such as the structure map of the classifying stack of a locally pro-p group, and builds on them the symmetric monoidal 2-category of cohomological correspondences, dualizability as universal local acyclicity, characteristic classes on inertia stacks, the relative Lefschetz–Verdier trace formula, local terms with their base change and their comparison with perfect schemes, trace distributions of admissible representations, a Künneth formula for characteristic classes, and universal local terms for group actions. The principal references are Gulotta–Hansen–Weinstein for the exceptional functors, Lu–Zheng for categorical traces, and Hansen–Kaletha–Weinstein, §4, §5.3 and Appendix B, for the trace formalism on v-stacks.

The base roadmap *Artin v-stacks, solid and lisse coefficient categories* (`VStackSheavesAndLisseCategories`) stops at the following point. It defines Artin v-stacks, descends étale coefficients along smooth charts, constructs exceptional pullback for cohomologically smooth stacky maps together with its left adjoint f_! on that smooth class, and partial compact-support functors (its VS0), and develops universally locally acyclic (ULA) sheaves with their duality theory (its VS1). It constructs no exceptional pushforward for maps that are neither representable nor cohomologically smooth, such as the structure map [T_S/G_S] → S for a geometric point S, the profinite set T = Z_p with the trivial action of G = C₂ and Λ = F_ℓ: this map is fine (VS10.10) and has C₂-stabilisers, and pulled back along the finite étale chart T_S → [T_S/G_S] its dualizing complex becomes K_(T_S/S), which is not invertible (VS7.9), so it is not cohomologically smooth (VS7.8). Here the exceptional functors are constructed for all fine maps of decent v-stacks, agreeing with the base roadmap's pair on the smooth class (VS7.8), and the Lefschetz–Verdier trace formalism is built on them through Lu–Zheng's symmetric monoidal 2-category of cohomological correspondences. The end theorems are the relative Lefschetz–Verdier trace formula for v-stacks (VS9.1) with its proper-pushforward form (VS9.2), the identification of the characteristic class of an admissible object on a classifying stack with its trace distribution (VS11.4), the Künneth formula for characteristic classes (VS11.9), and the identification of characteristic classes on quotient stacks [X/G] with universal local terms (VS11.12); the deep input theorem is the existence of the exceptional functors for fine maps (VS7.5) and the identification of dualizable objects with ULA objects (VS8.9).

## Scope and ownership

This roadmap owns: decent v-stacks, fine, proper fine and proper nice maps, and classifying and quotient stacks of group diamonds as v-stacks (Layer VS6); the exceptional functors Rf_!, Rf^! for fine maps, the six-functor identities, the comparison of exceptional and ordinary pushforward for proper fine maps and cohomologically proper maps, relative dualizing complexes and integration (Layer VS7); dualizable objects and categorical traces in symmetric monoidal 2-categories, the 2-categories of correspondences and of cohomological correspondences of decent v-stacks, trace classes and characteristic classes (Layer VS8); the Lefschetz–Verdier trace formula, local terms, their base change and the perfect-scheme comparison (Layer VS9); the description of sheaves on constant locally profinite diamonds and on classifying stacks of locally pro-p groups, with their four operations, distributions and the module of Haar measures (Layer VS10); admissibility on classifying stacks, trace distributions, based cohomological correspondences, the Künneth formula and universal local terms (Layer VS11).

It imports the following from other roadmaps, and states none of it again:

- Artin v-stacks, smooth descent of D_ét, exceptional pullback for smooth stacky maps with its left adjoint on that class, ULA sheaves and their duality (Fargues–Scholze IV.1–IV.2), and the identification of sheaves on [∗/G] with smooth representations (Fargues–Scholze V.1.1): *Artin v-stacks, solid and lisse coefficient categories*, §§VS0.1–VS0.2, VS1.1–VS1.2, VS4.2 and VS5.2. The exceptional functors of Layer VS7 differ by being defined for all fine maps of decent v-stacks; on cohomologically smooth fine maps they are that pair (VS7.8).
- Scholze's six operations for maps representable in locally spatial diamonds, cohomological smoothness, dualizing complexes and Haar-normalised averaging for profinite quotients: *Six operations, cohomological smoothness and biduality* (`DiamondSixOperations`), Layers S0–S5.
- Diamonds, small v-stacks, proper maps of v-stacks (with their 0-truncatedness, permanence and the valuative criterion), spatial and locally spatial diamonds, relative representability, the maximal Hausdorff quotient with the comparison of its cohomology with that of a qcqs separated diamond, and the diamond of an analytic adic space: *Diamonds and v-stacks* (`DiamondsAndVStacks`), Layers D4–D6, in particular §D4.11 for properness and §D5.15 for the cohomology comparison. VS6.11 defines proper fine and proper nice maps inside that notion of properness.
- The bound of the cohomological dimension of a spectral space by its Krull dimension: *Étale cohomology of diamonds and its four operations* (`DiamondEtaleCohomology`), §C8.44.
- Quasicategories, derived ∞-categories of sheaves, hypercover descent, coherent diagrams, mates and adjoint functor theorems, and symmetric monoidal ∞-categories: *Enhanced derived categories of sheaves* (`EnhancedDerivedSheaves`), §§E1.4, E2.6, E3.2, E3.4 and E5:abstract.1.
- Smooth representations, the derived smooth category, derived invariants, derived smooth duality and admissible complexes, compact generation by compact induction, locally constant compactly supported functions, ring-valued Haar measures, integration and convolution, smooth and compact induction, and the modulus character: *Smooth representations of local groups* (`SmoothRepresentationsOfLocalGroups`), §§SR.0.3, SR.0d.2, SR.1.1, SR.2.1 and SR.2.2. In particular §SR.0d.2 supplies admissibility and §SR.1.1 the ring-valued Haar measures and integration; VS10.5 equips the supplied Haar measures with the module and modulus identifications used by the geometric operations.
- Cohomological correspondences of schemes, their trace maps and local terms, for finite ℓ-power-torsion coefficient rings and bounded constructible complexes of finite Tor dimension: *Étale duality, cycle classes and perverse sheaves* (`EtaleDualityAndPerverseSheaves`), §§6.1–6.3. The extension to arbitrary prime-to-p torsion coefficient rings, arbitrary complexes for correspondences and f-ULA complexes for local terms is required of that roadmap through the two supplier gaps stated in its contract below; VS9.7–VS9.8 keep that generality. The adic coefficient ranges of §§6.1–6.3 lie outside this roadmap's torsion convention.
- The functor from perfect schemes to v-sheaves and Scholze's comparison c_X^* (Scholze §27): *Adic coefficients and comparison with schemes* (`AdicCoefficientsAndComparisons`), Layers L1 and L3; perfection as a universal homeomorphism with étale topological invariance: *Scheme, stack, cohomology and intersection foundations* (`SchemeAndStackFoundations`), §§0.24 and 0.23a.
- The trace of an endomorphism of a dualizable object in a symmetric monoidal category, with cyclicity, multiplicativity, the unit value and the comparison with linear traces: `PivotalSpherical`, Layers 2 and 7. The trace of an endomorphism of a finite projective module is Tau Ceti's `LinearMap.projectiveTrace`, equal to Mathlib's `LinearMap.trace` on finite free modules; its equality with the categorical trace: `AdicSpacesPartIII` §R3.8 (target *projective-trace-realization*). The equivalence of compact and perfect objects in the derived category of a ring: `DGAInfinity` Layer 5. The identification of the perfect complexes over a commutative ring with the dualizable objects of its derived category, and of the categorical trace of an endomorphism of a perfect complex with its Lefschetz number, the alternating sum of the projective traces on a bounded finite-projective representative: *Étale cohomology foundations* (`EtaleCohomologyFoundations`), §F.10.3. VS8.1–VS8.3 own only the bicategorical extension of the trace, its trace morphisms and the symmetric monoidal Grothendieck construction (Lu–Zheng §1); VS8.4 owns only the biduality criteria for dualizability in D(Λ) (Hansen–Kaletha–Weinstein, Lemma B.1.2(2)), the form in which dualizability enters VS8.8.
- Reflexive modules: Mathlib's `Module.IsReflexive`, with the finite projective instance `Module.instIsReflexiveOfFiniteOfProjective` (Mathlib/LinearAlgebra/Dual/Lemmas.lean, line 262) and `Module.instFiniteDimensionalOfIsReflexive` (line 284) covering the projective and residue-field cases. VS8.5 differs from these by treating arbitrary modules over truncated discrete valuation rings.

This roadmap also owns the Λ-valued distribution character of VS11.3: for a smooth representation M placed in degree 0 whose invariants M^K are finite projective over Λ (for instance Λ a field and M admissible), tr.dist(M) is h ⊗ μ ↦ tr(I_(h,μ) | M^K). No other roadmap defines it; the complex Harish-Chandra characters of the automorphic roadmaps lie outside the torsion coefficient convention.

Outside this roadmap: the computation of local terms of Satake sheaves on affine Grassmannians and the Kottwitz conjecture (Hansen–Kaletha–Weinstein §§5–6), which consume this roadmap; ℓ-adic sheaf theory on algebraic stacks; and the general ∞-categorical machinery of Liu–Zheng, which is required of `EnhancedDerivedSheaves` through the four supplier gaps stated in its contract below. The elliptic local trace of *Igusa varieties and torsion concentration* (`IgusaVarietiesAndTorsionConcentration`, §7.9b) is a consumer: for coefficient rings killed by an integer prime to p, the category of cohomological correspondences, its trace maps, the relative Lefschetz–Verdier identity and the base change of local terms that it uses for the local Shimura Hecke correspondence are CoCorr_S (VS8.7), the trace class (VS8.10), VS9.1 and VS9.6 here; the passage to rational coefficients, the identification of fixed-locus components through elliptic elements and the computation of the local terms belong to that roadmap.

## Conventions

- Perf is the category of perfectoid spaces of characteristic p with the v-topology; the prime p is fixed and ℓ denotes a prime different from p. Every v-stack lives over Perf.
- Λ is a commutative ring with nΛ = 0 for an integer n prime to p. D_ét(X, Λ) is Scholze's category for a small v-stack X, with its symmetric monoidal ∞-categorical enhancement; H^0(X, A) means Hom(Λ_X, A).
- An object I ∈ D_ét(X, Λ) is invertible if it is ⊗-invertible: there is J ∈ D_ét(X, Λ) with I ⊗ J ≅ Λ_X; then J ≅ RHom(I, Λ_X), written I^(-1). The invertible objects of DiamondSixOperations §S4.2, étale locally isomorphic to Λ[n] with n locally constant on |X|, are invertible in this sense (that section proves they are ⊗-invertible), and the dualizing complex of a cohomologically smooth map representable in locally spatial diamonds is of that kind on each ℓ-primary factor of Λ (§S4.3). The converse fails when Spec Λ is disconnected, because the shift may differ on the factors of an idempotent decomposition of Λ (VS7.10, Checks). Where smoothness is defined or tested through Rf^!F_ℓ (DiamondSixOperations §S4.2, VS6.8, conditions (2) and (3) of VS7.8), invertibility is the stronger notion of §S4.2, as in Scholze, Definition 23.8.
- Cohomologically smooth means ℓ-cohomologically smooth for every prime ℓ ≠ p (Scholze, Definition 23.8), and for maps of decent v-stacks the chart-wise notion of Gulotta–Hansen–Weinstein, Definition 1.3(ii).
- Decency follows the public version of Gulotta–Hansen–Weinstein (arXiv:2202.12467v1, Definition 1.1): surjective charts from locally separated locally spatial diamonds that are locally separated and cohomologically smooth. Hansen–Kaletha–Weinstein restate it with different wording and numbering; see *Corrections to the sources*.
- A map of small v-stacks is representable in nice diamonds, or nice (Hansen–Kaletha–Weinstein, Definition 4.1.3, p. 22), if it is compactifiable, representable in locally spatial diamonds and locally of finite dim.trg; these are the eligible maps of DiamondSixOperations §S0.4. A nice diamond over S is a small v-stack X with X → S nice. Nice maps are separated (compactifiable maps are), so a nice map between decent v-stacks is fine (VS6.7 (iv)).
- Proper means proper in the sense of DiamondsAndVStacks §D4.11 (Scholze, Definition 18.1): quasicompact, separated and universally closed; proper maps of v-stacks are 0-truncated (same section). A proper fine map is a proper map of decent v-stacks that is fine, and a proper nice map is a proper fine map representable in locally spatial diamonds (VS6.11), equivalently a proper map of decent v-stacks that is nice (VS6.7 (iv)). Every proper fine map f carries a comparison c_f : Rf_! → Rf_* (VS7.7); f is cohomologically proper if the comparison of every base change of f along a map of decent v-stacks is an isomorphism. Proper 2-morphisms of correspondences, proper pushforwards and integration are taken among cohomologically proper maps; these include all proper nice maps.
- Duality data follow Mathlib's orientation (`CategoryTheory.ExactPairing`): coev : 1 → X ⊗ X^∨ and ev : X^∨ ⊗ X → 1, and tr(e) = ev ∘ σ ∘ (e ⊗ id) ∘ coev with σ the symmetry. A 2-category is a bicategory (weak 2-category); ΩC = End(1).
- In a correspondence X ← C → X′ the left leg is c₁ and the right leg c₂; a cohomological correspondence is u : c₁^*A → c₂^!A′. For c : C → X ×_S X, Fix(c) = C ×_(X ×_S X) X (the fibre product with the diagonal Δ), with projections Δ′ : Fix(c) → C, the base change of Δ, and c′ : Fix(c) → X, the base change of c; VS8.10 and VS9.8 use these two names; elsewhere (VS8.3, VS8.7, VS9.1, VS9.2, VS11.5, VS11.7) a prime marks another correspondence, leg, base change or morphism, named where it occurs. In_S(X) = X ×_(X ×_S X) X.
- For a locally profinite set T and a discrete ring Λ, C(T, Λ) is the ring of locally constant functions and C_c(T, Λ) its ideal of compactly supported ones. For a locally profinite group G, Haar(G, Λ) is the module of left Haar measures, with the right-translation action specified below. G_S and T_S are constant diamonds over S, and S denotes a geometric point Spd C or Spd k (C an algebraically closed perfectoid field, k an algebraically closed discrete field of characteristic p) when Layer VS10 or VS11, or a Check about [S/G_S] or [T_S/G_S], says so.
- The Haar action is (g·μ)(E) = μ(Eg); when a compact open subgroup has invertible pro-order, it has a coefficient-valued character χ_G(g) = (g·μ)/μ. Write δ_G(g) = μ(Eg⁻¹)/μ(E) for the modular character of G; by uniqueness of Haar measures, for a compact open subgroup K of invertible pro-order, δ_G(g) = μ(gKg⁻¹)/μ(K) = [gKg⁻¹ : gKg⁻¹ ∩ K]·[K : gKg⁻¹ ∩ K]⁻¹, a unit of Λ. Then χ_G = δ_G⁻¹, and every Haar twist below uses χ_G. When G = P = M ⋉ N is a parabolic subgroup of a reductive group (M unimodular), δ_G is the modulus δ_P of *Smooth representations of local groups* §SR.2.2 (*modulus-character*); that δ_P is the conjugation modulus of N, so for a presentation with N = 1 it is trivial and differs from δ_G when G is not unimodular. Witness: for the affine group {(a, b)} over ℚ_p with left Haar measure |a|⁻² da db and g = diag(p, 1), μ(Eg) = |p|⁻¹μ(E) = pμ(E), so χ_G(g) = p and δ_G(g) = p⁻¹; for the pro-p subgroup K = (1 + pZ_p) ⋉ Z_p one has gKg⁻¹ = (1 + pZ_p) ⋉ pZ_p of index p in K, giving δ_G(g) = 1/p again. Conjugation by g scales N = {(1, b)} by |p| = p⁻¹, the conjugation modulus for M = {(a, 0)}, while for N = 1 it is 1 ≠ p⁻¹.
- For a locally profinite set T with a continuous left G-action, G acts on C(T, Λ) and C_c(T, Λ) by (g·h)(t) = h(g⁻¹·t). In particular G acts on C_c(G, Λ) through its conjugation action g·x = gxg⁻¹ on G, by (g·h)(x) = h(g⁻¹xg), so g·1_K = 1_(gKg⁻¹). With the Haar action above this is the direction under which the trace distribution of VS11.3 is invariant. Witness: for the affine group over ℚ₂ (so p = 2), Λ = F_5, g = diag(2, 1) (so χ_G(g) = 2), a compact open pro-2 subgroup K, the Haar measure normalised by μ(K) = 1 and h = 1_K, one has μ(gKg⁻¹) = χ_G(g)⁻¹μ(K) = 2⁻¹ = 3 in F_5, so ∫ g·h d(g·μ) = χ_G(g)·μ(gKg⁻¹) = 2·3 = 1 = μ(K), while the other direction (g·h)(x) = h(gxg⁻¹) gives χ_G(g)·μ(g⁻¹Kg) = 2·2 = 4 ≠ 1. Over ℚ_p with p odd, |2|_p = 1 and both directions give μ(K), so the witness needs p = 2 and μ(K) ≠ 0.

## Exact supplier contracts

### From Mathlib

- `CategoryTheory.MonoidalCategory` (Mathlib/CategoryTheory/Monoidal/Category.lean) and `CategoryTheory.SymmetricCategory` (Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean): monoidal categories and symmetric monoidal categories, a braiding whose square is the identity.
- `CategoryTheory.ExactPairing`, with `CategoryTheory.ExactPairing.coevaluation` (notation η_) and `CategoryTheory.ExactPairing.evaluation` (notation ε_), and `CategoryTheory.HasRightDual` (Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean): an exact pairing of X and Y is coevaluation 𝟙 ⟶ X ⊗ Y and evaluation Y ⊗ X ⟶ 𝟙 with the two triangle identities; it is the 1-categorical duality datum of Lu–Zheng, Definition 1.1, with Y the dual of X.
- `CategoryTheory.Bicategory` (Mathlib/CategoryTheory/Bicategory/Basic.lean): bicategories, the carrier of Lu–Zheng's 2-categories, without monoidal structure at the pin. `CategoryTheory.Bicategory.Adjunction` (Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean): adjunctions between 1-morphisms, with unit 𝟙 ⟶ f ≫ g, counit g ≫ f ⟶ 𝟙 and the triangle identities; this is Lu–Zheng's right adjointability (§1.2). `CategoryTheory.Pseudofunctor` (Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean), for the pseudo-functoriality of the exceptional functors.
- `LocallyConstant` (Mathlib/Topology/LocallyConstant/Basic.lean): with values in a ring Λ, `LocallyConstant T Λ` is the ring C(T, Λ). `LocallyConstant.charFn` (Mathlib/Topology/LocallyConstant/Algebra.lean): the characteristic function 1_U of a clopen set U. `TopologicalSpace.CompactOpens` (Mathlib/Topology/Sets/Compacts.lean): compact open subsets.
- `Module.Dual` and `Module.Dual.eval` (Mathlib/LinearAlgebra/Dual/Defs.lean): the dual module and the canonical map M → M**; `Module.IsReflexive` (same file, line 203): bijectivity of that map, with the instances listed under *Scope and ownership*.
- `IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean), `IsLocalRing.maximalIdeal` (Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean) and `Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean).
- `LinearMap.trace` (Mathlib/LinearAlgebra/Trace.lean): the trace of an endomorphism of a module with a finite basis, and zero otherwise; only its value on finite free modules is used.
- `FGModuleCat` with its `RightRigidCategory (FGModuleCat K)` instance over a field K (Mathlib/Algebra/Category/FGModuleCat/Basic.lean, line 265): finite-dimensional vector spaces form a right rigid monoidal category, the dual being the linear dual.
- `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): the derived category of an abelian category, the 1-categorical carrier of D(Λ); it carries no monoidal structure at the pin, which is supplied by `EnhancedDerivedSheaves` §E1.4.

### From Tau Ceti

- `TauCeti.IsSmoothDiscrete` (TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean): a representation of a topological group on a discrete module with open stabilisers, the carrier that the smooth-representation layers of *Smooth representations of local groups* use.
- `LinearMap.projectiveTrace` (TauCeti/LinearAlgebra/Trace/Projective.lean): for a finite projective module M over a commutative semiring, the trace End(M) → R obtained from the contraction Dual(M) ⊗ M → R through `dualTensorHomEquiv`; `LinearMap.projectiveTrace_eq_trace` identifies it with Mathlib's `LinearMap.trace` on finite free modules, and `LinearMap.projectiveTrace_cyclic` gives cyclicity. Used by VS8.4.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

- §VS0.1 (*artin-v-stack-definition*): Artin v-stacks in the sense of Fargues–Scholze, Definition IV.1.1. Used by VS6.3.
- §VS0.2 (*enhanced-smooth-descent*, *shriek-pullback-for-smooth-stacky-maps*, and the Check that the point of [∗/ℤ_p] is not a smooth atlas): enhanced smooth descent of D_ét, the exceptional pullback f^! for cohomologically smooth stacky maps, its left adjoint f_! on that smooth class (the API identity Map(f_!B, A) = Map(B, f^!A)), and the failure of smoothness of the point of [∗/ℤ_p], the model case of an infinite compact open K. Used by VS6.8, VS6.10, VS7.5 and VS7.8.
- §VS1.1 (*ula-definition-with-constructibility*, *ula-descent-and-smooth-locality*, *ula-dualizability-criterion*, and the sub-target *Relative adjoints and ULA calculus*) and §VS1.2 (*smooth-ula-criterion*, *ula-for-artin-v-stacks*): ULA objects, their descent and smooth locality, their dualizability criterion and relative calculus, the smooth criterion and ULA objects on Artin v-stacks. Used by VS7.8, VS8.9, VS8.12, VS11.1 and VS11.11.
- §VS4.2 (*classifying-stack-equivalence*): D_ét([∗/G], Λ) is the derived category of smooth representations, with derived invariants and the derived smooth dual. Used by VS10.7, VS10.9 and VS11.1.
- §VS5.2 (sub-target *Torsion ULA and perfect invariants*): an object of D_ét(Bun_G, Λ) is ULA over the point iff every stratum restriction has perfect derived pro-p invariants; VS11.1 adapts the argument to [S/G_S]. Used by VS11.1.

### From TauCetiRoadmap.DiamondSixOperations

- §§S0.1–S0.2: compactifiable maps, their canonical factorisation and permanence; §S0.4: eligible maps.
- §§S1.1–S1.5: compactification dimension, exceptional pushforward over locally spatial bases, the dimension-zero classification and topological comparison, amplitude bounds, base change, composition and projection formula.
- §§S2.3–S2.4: the hypercover construction of the exceptional pushforward, base change, projection formula and coherent exchange maps.
- §§S3.1–S3.4: exceptional pullback, formal Verdier duality, internal Hom, exceptional base change and adjunction calculus.
- §§S4.1–S4.5: twisted pullback criteria, cohomological smoothness, dualizing objects, permanence, smooth base change and smooth exceptional base change.
- §S5.4: free quotients and the exceptional pullback for profinite projections; §S5.5: smooth analytic maps are cohomologically smooth.

### From TauCetiRoadmap.DiamondsAndVStacks

- §D4.1 (*diamond*), §D4.6 (*compact-hausdorff-diamonds*), §D4.7 (*small-v-sheaves-and-small-v-stacks*) and §D4.10 (*small-quotients-and-underlying-spaces*): diamonds, compact Hausdorff spaces as diamonds, small v-sheaves and v-stacks, and small quotients. Used by VS6.1, VS6.2, VS6.9, VS6.10, VS7.1 and VS10.4.
- §D5.1 (*spatial-diamond*), §D5.2 (*injection-and-finite-etale-permanence*), §D5.5 (*quasi-pro-etale-and-fibre-product-permanence*), §D5.11 (*spatial-v-sheaf-criterion*), §D5.12 (*relative-representability*) and §D5.14 (*berkovich-quotient*): spatial v-sheaves and spatial diamonds, quasicompact injections, fibre products of locally spatial diamonds, the criterion that a spatial v-sheaf whose points are hit by quasi-pro-étale maps from geometric points is a spatial diamond, relative representability and the maximal Hausdorff quotient. Used by VS6.1, VS6.2, VS6.9, VS6.11, VS7.1 and VS7.2.
- §D4.11 (Proper maps of v-stacks): a map of v-stacks is proper if it is quasicompact, separated (its diagonal is a closed immersion) and universally closed; closed immersions are proper; proper maps compose and are stable under base change; a map is proper iff it is 0-truncated, quasicompact, quasiseparated and satisfies the valuative criterion. Used by VS6.11 and VS7.7.
- §D5.15 (*reduction-to-spatial-and-hausdorff-cohomology*): for a quasicompact quasiseparated diamond Y separated over the terminal v-sheaf and the map f : |Y| → |Y|_B to its maximal Hausdorff quotient, Hⁱ(|Y|_B, F) ≅ Hⁱ(|Y|, f^*F) for every abelian sheaf F on |Y|_B. Used by VS7.2.
- §D6.4 (*gluing-and-the-diamond-functor*) and §D6.5 (*etale-site-comparison*): the diamond of an analytic adic space and the étale-site comparison. Used by VS6.5.

### From TauCetiRoadmap.DiamondEtaleCohomology

- §C8.44 (Spectral-space cohomological dimension): for a spectral space X with topological Krull dimension at most a natural number d and any abelian sheaf F on X, Hⁱ(X, F) = 0 for i > d. Used by VS7.2.

### From TauCetiRoadmap.EnhancedDerivedSheaves

- §E1.4: derived tensor product and internal Hom; §E2.6: enhanced hypercover descent; §E3.2: the adjoint functor theorem and localisations; §E3.4: coherent ringed diagrams and coherent mates with their pasting law; §E5:abstract.1: symmetric monoidal ∞-categories.

What EnhancedDerivedSheaves must provide (gap:vs-pii-enhanced-operation-map): in §E3.4, an enhanced operation map on restricted multisimplicial nerves encoding tensor products, pullbacks and exceptional pushforwards with their coherent exchange transformations (Liu–Zheng, *Enhanced six operations*, §§2.3 and 3.4).

What EnhancedDerivedSheaves must provide (gap:vs-pii-partial-adjoints): in §E3.4, partial adjoints in selected simplicial directions under edge adjointability and mixed-square Beck–Chevalley hypotheses (Liu–Zheng, *Enhanced six operations*, arXiv v4, Proposition 2.2.4, pp. 79–80).

What EnhancedDerivedSheaves must provide (gap:vs-pii-restricted-nerves): in §E3.4, the comparison of restricted nerves as a categorical equivalence under the admissibility, factorisation and truncation hypotheses of Liu–Zheng, *Gluing restricted nerves*, arXiv v4, Theorem 5.4, with its Corollary 0.4 as the scheme instance.

What EnhancedDerivedSheaves must provide (gap:vs-pii-descent): in §E3.4, the extension of an input satisfying the hypotheses P0–P5bis to an output with those properties, in the abstract setting of Liu–Zheng, *Enhanced six operations*, Theorem 4.1.8(1), and its specialisation Gulotta–Hansen–Weinstein, Theorem 4.9.

These four are extensions of §E3.4 beyond ringed diagrams; VS7.4 and VS7.5 depend on them.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

- §6.1 (scheme correspondences and fixed schemes), §6.2 (cohomological correspondences and their composition, pullback along morphisms of correspondences and restriction to open subschemes) and §6.3 (trace maps and local terms), for separated finite-type schemes over a field k with ℓ invertible, finite rings Λ killed by a power of ℓ and bounded constructible complexes of finite Tor dimension. Used by VS9.7 and VS9.8.

What EtaleDualityAndPerverseSheaves must provide (gap:vs-pii-scheme-correspondences): in §6.2, for every commutative ring Λ with nΛ = 0 for an integer n invertible in k, cohomological correspondences between arbitrary objects of D(X_ét, Λ) on separated finite-type k-schemes, with composition, pullback along morphisms of correspondences and restriction to opens.

What EtaleDualityAndPerverseSheaves must provide (gap:vs-pii-scheme-local-terms): in §6.3, for every commutative ring Λ with nΛ = 0 for an integer n invertible in k and k separably closed, trace classes Tr_c(u) ∈ H⁰(Fix(c), K_(Fix(c))) and local terms of cohomological correspondences between f-ULA complexes on separated finite-type k-schemes, compatible with base change along extensions of separably closed fields.

VS9.7 and VS9.8 depend on the first gap and VS9.8 also on the second. The passage from perfect schemes to their finite-type models is VS9.8's own step, from `SchemeAndStackFoundations` §§0.24 and 0.23a.

### From TauCetiRoadmap.AdicCoefficientsAndComparisons

- Layer L1, targets *L1/char-p-scheme-diamond-and-comparison-functor* and *L1/comparison-pullback*: the v-sheaf of a perfect scheme and the comparison pullback c_X^*. Used by VS9.7.
- Layer L3, targets *L3/commutation-and-adjoints-27-1-27-3*, *L3/full-faithfulness-27-2*, *L3/internal-Hom-right-adjoint* and *L3/rf-shriek-comparison-27-4*: compatibility of c_X^* with tensor products and pullback, its full faithfulness, its right adjoint and its compatibility with Rf_! (Scholze, Theorems 27.1–27.4). Used by VS9.7 and VS9.8.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.24 (perfect schemes, perfection and `perfection_universalHomeomorphism`) and §0.23a (étale topological invariance). Used by VS9.8.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §SR.0.3 (*compact-open-invariants*, *averaging-projector*, *unit-pro-order*): invariants under compact open subgroups, the averaging projector for subgroups of invertible pro-order. Used by VS10.5 and VS11.3.
- §SR.0d.2 (*derived-invariants*, *derived-smooth-dual*, *compact-generation*): derived invariants, the derived smooth dual, admissible complexes and compact generation by compact inductions. Used by VS10.9 and VS11.1.
- §SR.1.1 (*locally-constant-compact-support*, *a-valued-haar-measure*, *integration*, *convolution-algebra*): C_c^∞(G, Λ), Λ-valued Haar measures, integration and the convolution algebra. Used by VS10.1, VS10.3, VS10.5 and VS11.3.
- §SR.2.1 (*smooth-induction*, *compact-induction*, *frobenius-reciprocity*): smooth and compact induction and Frobenius reciprocity. Used by VS10.7 and VS10.8.
- §SR.2.2 (*modulus-character*): the modulus δ_P of a parabolic subgroup P = M ⋉ N of a reductive group, the conjugation modulus of N; when G = P it is the modular character δ_G of the Conventions, since M is unimodular. Used by VS10.5 for that comparison only; the Haar character χ_G itself comes from §SR.1.1.

### From TauCetiRoadmap.PivotalSpherical

- Layers 2 and 7: the symmetric rigid trace, cyclicity, multiplicativity, unit value and comparison with linear traces. Used by VS8.1.

### From TauCetiRoadmap.AdicSpacesPartIII

- §R3.8 (*projective-trace-realization*): the finite-projective trace `LinearMap.projectiveTrace` is the categorical trace of the symmetric monoidal category of finite projective modules. Used by VS8.4.

### From TauCetiRoadmap.DGAInfinity

- Layer 5: compact objects of the derived category of a ring, regarded as a DG algebra in degree zero, are the perfect complexes (Stacks07LT, Tag 07LT). Used by VS8.4.

### From TauCetiRoadmap.EtaleCohomologyFoundations

- §F.10.3 (Perfect-complex traces and coherent additivity): for a commutative ring R, the perfect objects of the derived category of R-modules (bounded finite-projective representatives) are exactly its dualizable objects for the derived tensor product; the Lefschetz number of an endomorphism of a perfect complex is the alternating sum of the projective traces on a bounded finite-projective representative with a lifted chain endomorphism, independent of the representative and the lift, and it is the categorical trace. Used by VS8.4.

## How to read the build

Layer VS6 fixes the geometric objects: decent v-stacks; fine, smooth, proper fine and proper nice maps; classifying and quotient stacks. Layer VS7 constructs the exceptional functors on them: prespatial diamonds make canonical compactifications available, an enhanced operation map is built on coproducts of qcqs v-sheaves and extended to decent v-stacks by three iterations of Liu–Zheng's descent theorem, and the resulting functors satisfy the full six-functor calculus, with the comparison of exceptional and ordinary pushforward for proper fine maps, relative dualizing complexes and integration. Layer VS8 is partly general category theory (traces in symmetric monoidal 2-categories, after Lu–Zheng; VS8.1–VS8.5 need nothing geometric) and partly geometric (the 2-categories Corr_S and CoCorr_S, dualizability as ULA-ness, trace classes and characteristic classes). Layer VS9 proves the relative Lefschetz–Verdier trace formula, the universal trace statement, and develops local terms. Layer VS10 realises the formalism on the two basic locally profinite examples, constant locally profinite diamonds and classifying stacks of locally pro-p groups, where the operations become operations on smooth modules and smooth representations twisted by Haar measures; it needs only VS6 and VS7, and VS8 and VS9 do not use it. Layer VS11 combines VS8, VS9 and VS10 on classifying stacks (admissibility and trace distributions) and on quotient stacks (Künneth formula and universal local terms).

## Layer VS6: decent v-stacks and fine morphisms

Define maps representable in locally separated locally spatial diamonds and decent v-stacks (diagonal representable in locally separated locally spatial diamonds and a surjective, locally separated, cohomologically smooth chart from a locally separated locally spatial diamond), with clean charts. Prove that decent v-stacks are Artin v-stacks in the sense of VStackSheavesAndLisseCategories §VS0.1, that fibre products of decent v-stacks are decent, and that locally separated locally spatial diamonds, diamonds of analytic adic spaces, Spd Z_p, Div¹ and the geometric points Spd C, Spd k are decent.

Define fine morphisms (charts with a locally compactifiable finite-dim.trg top map) and cohomologically smooth fine morphisms; prove stability under composition, base change and cancellation, and that a separated map representable in locally spatial diamonds is fine iff it is compactifiable of locally finite dim.trg. Construct classifying stacks [S/G] of group diamonds with their maps (torsors with commuting actions) and 2-morphisms, and quotient stacks [X/G]. Prove the compatibility of f^* ⊣ Rf_* with 2-morphisms. Define proper fine maps (proper maps of v-stacks are 0-truncated) and proper nice maps (proper fine maps representable in locally spatial diamonds), and characterise representability of a proper fine map over a spatial diamond by a condition on the points of its source.

### 6.1 Maps representable in locally separated locally spatial diamonds

Throughout this subsection, X, Y are small v-stacks.

A locally spatial diamond is locally separated if it has an open cover by separated locally spatial diamonds. A map f : X → Y of small v-stacks is representable in locally separated locally spatial diamonds if for every locally separated locally spatial diamond T with a map T → Y the fibre product X ×_Y T is a locally separated locally spatial diamond. It suffices to test separated spatial diamonds T. Such maps are representable in diamonds; the class is stable under composition and base change; quasicompact injections belong to it; and if g ∘ f belongs to it with g 0-truncated and quasiseparated, then f belongs to it.

Gulotta–Hansen–Weinstein, Definition 4.1 and the paragraph after it, p. 19, defines representability in locally separated locally spatial diamonds by testing against locally separated locally spatial diamonds, and notes that separated spatial test objects suffice. Gulotta–Hansen–Weinstein, Warning 4.2 and Proposition 4.3, pp. 19–20, records the permanence properties (representability in diamonds, composition, base change, quasicompact injections, cancellation against 0-truncated quasiseparated maps); the claim that a quasiseparated such map is representable in locally spatial diamonds is left as an exercise there.

The API of the definition:

- If X ×_Y T is a locally separated locally spatial diamond for every separated spatial diamond T → Y, then f is representable in locally separated locally spatial diamonds.
- The class is closed under composition.
- The class is closed under base change along any map of small v-stacks.
- A quasicompact injection of small v-stacks is representable in locally separated locally spatial diamonds.
- If g ∘ f has the property and g is 0-truncated and quasiseparated, then f has it.
- A map with the property is representable in diamonds in the sense of DiamondsAndVStacks D5.

In the sources it enters as follows: the diagonal condition defining decent v-stacks (GHW22 Definition 1.1(1)); permanence used to show decent v-stacks are Artin and stable under fibre products (GHW22 Propositions 4.4–4.5); the diagonal condition in the definition of decent v-stacks (HKW22 Definition 4.1.7, p. 23).

*Proof sketch.*

1. Reduce the test objects to separated spatial T: a locally separated locally spatial T is covered by separated spatial opens, and both properties of the fibre product are local on T (GHW22 remark after Definition 4.1).
2. Representability in diamonds: test against affinoid perfectoid T, which are separated spatial diamonds, so X ×_Y T is a diamond (GHW22 Proposition 4.3(i), first claim).
3. Composition and base change are formal from the definition (GHW22 Proposition 4.3(ii)).
4. Quasicompact injections into a locally spatial diamond have locally spatial source (Sch17 Proposition 11.20, recorded by DiamondsAndVStacks D5); separatedness passes to subobjects (GHW22 Proposition 4.3(iii)).
5. For g 0-truncated and quasiseparated, X ×_Y T → X ×_Z T is a base change of the quasicompact injection Y → Y ×_Z Y, so the previous step applies (GHW22 Proposition 4.3(iv)).

**Checks.**

- The identity of a small v-stack is representable in locally separated locally spatial diamonds.
- The inclusion of an open subdiamond U ⊂ X of a locally spatial diamond is representable in locally separated locally spatial diamonds.
- For S = Spd C with C an algebraically closed perfectoid field and G = C₂ (locally pro-p for every p, its trivial subgroup being open and pro-p), the structure map f : [S/G_S] → S is not representable in locally separated locally spatial diamonds: its base change along id_S is [S/G_S] itself, in which the trivial torsor over S has automorphism group C₂ ≠ 1, so [S/G_S] is not 0-truncated and is no diamond. Yet [S/G_S] is decent and f is fine: the quotient q : S → [S/G_S] is a C₂-torsor, hence finite étale, surjective and a chart (it is the chart (C₂ × S)/C₂ → [S/G_S] of VS10.6 for the free action on C₂ × S), and f ∘ q = id_S, so the square with charts q and id_S has top map id_S, compactifiable of dim.trg 0 (VS6.6; the case G = C₂ of VS10.6 and VS10.9). For S = ∅ the same construction gives G_S = ∅, [S/G_S] = ∅ and f = id_∅, which is representable: the negative example needs a nonempty base.
- Every map with the property is representable in diamonds, so the definition refines DiamondsAndVStacks D5's relative representability.

*Needs:* DiamondsAndVStacks §D4.7 (*small-v-sheaves-and-small-v-stacks*); DiamondsAndVStacks §D4.1 (*diamond*); DiamondsAndVStacks §D5.1 (*spatial-diamond*); DiamondsAndVStacks §D5.12 (*relative-representability*); DiamondsAndVStacks §D5.2 (*injection-and-finite-etale-permanence*).

### 6.2 Decent v-stacks

Throughout this subsection, X is a small v-stack. Cohomological smoothness is that of DiamondSixOperations S4 for maps representable in locally spatial diamonds.

A small v-stack X is decent if (1) its diagonal X → X × X is representable in locally separated locally spatial diamonds, and (2) there is a locally separated locally spatial diamond U and a surjective map U → X that is representable in locally spatial diamonds and, locally on U, separated and cohomologically smooth (ℓ-cohomologically smooth for every prime ℓ ≠ p). Such U → X is a chart; it is a clean chart if U is separated and U → X is separated and cohomologically smooth, and every decent v-stack has a clean chart. For locally separated locally spatial diamonds T → X ← T′ the fibre product T ×_X T′ is a locally separated locally spatial diamond.

Gulotta–Hansen–Weinstein, Definition 1.1 and Remark 1.2, p. 2, defines decent v-stacks by the diagonal condition and the existence of a surjective, locally separated and cohomologically smooth chart from a locally separated locally spatial diamond, and introduces clean charts. Hansen–Kaletha–Weinstein, Definition 4.1.7, p. 23, restates decency (with charts that are strictly surjective and locally compactifiable of finite dim.trg) as the class of geometric objects for the stacky six-functor formalism.

The API of the definition:

- A chosen chart U → X from a locally separated locally spatial diamond.
- Every decent v-stack admits a clean chart U → X with U separated and the chart separated and cohomologically smooth.
- A locally separated locally spatial diamond is decent.
- For maps T → X ← T′ from locally separated locally spatial diamonds, T ×_X T′ is a locally separated locally spatial diamond.
- A decent v-stack is an Artin v-stack in the sense of VStackSheavesAndLisseCategories §VS0.1 (VS6.3).
- Fibre products of decent v-stacks are decent (VS6.4).

In the sources it enters as follows: objects of the correspondence 2-categories Corr_S and CoCorr_S are decent S-v-stacks fine over S (HKW22 Definitions 4.3.3–4.3.4, pp. 28–30); classifying stacks [S/G_S] and quotients [T_S/G_S] are decent (HKW22 Examples 4.2.2–4.2.5, pp. 25–27); the domain of the exceptional functors (GHW22 Theorem 1.4, p. 3); decent v-stacks are the Artin v-stacks on which genuine exceptional functors exist (VStackSheavesAndLisseCategories:VS0 (Artin v-stacks)).

*Proof sketch.*

1. Clean charts: refine U by an open cover by separated spatial pieces on which the chart is separated and smooth and take the disjoint union (GHW22 Remark 1.2(ii)).
2. Fibre products of test diamonds: T ×_X T′ = (T × T′) ×_(X×X) X, and T × T′ is a locally separated locally spatial diamond (GHW22 Remark 1.2(i)).
3. Hansen–Kaletha–Weinstein's restatement (HKW22 Definition 4.1.7) asks for a strictly surjective chart that is locally compactifiable of finite dim.trg; the conventions use the public GHW22 Definition 1.1 and record the difference in Corrections to the sources.

**Checks.**

- A separated spatial diamond, e.g. Spa(C, O_C)^♢, is decent with the identity as clean chart.
- Spd Z_p is decent with chart Spd Z_p × Spd F_p((t^(1/p^∞))) → Spd Z_p, although Spd Z_p is not a diamond.
- For G = GL_n(Z_p) and S = Spd C, the map GL_n^♢ × S / G_S → [S/G_S] is a chart of the classifying stack.
- For S a geometric point and G = Z_p, the point q : S → [S/G_S] is surjective and representable but is not a chart: it is not cohomologically smooth, since with F_ℓ coefficients, ℓ ≠ p, as in the definition of smoothness, its base change Z_p × S → S has the noninvertible sheaf of distributions as dualizing object (FS21 Remark IV.1.10). In contrast, Rq^!F_ℓ = Haar(Z_p, F_ℓ) ≅ F_ℓ is invertible, but its formation does not commute with this base change: the germs of δ₀ and the normalised Haar measure at 0 are linearly independent.
- Every decent v-stack satisfies the base roadmap's definition of an Artin v-stack (VStackSheavesAndLisseCategories §VS0.1 (*artin-v-stack-definition*)).

*Needs:* VS6.1; DiamondsAndVStacks §D4.7 (*small-v-sheaves-and-small-v-stacks*); DiamondsAndVStacks §D5.1 (*spatial-diamond*); DiamondsAndVStacks §D5.12 (*relative-representability*); DiamondSixOperations §S4.2.

### 6.3 Decent v-stacks are Artin v-stacks

Throughout this subsection, X is a decent v-stack.

A decent v-stack X is an Artin v-stack in the sense of Fargues–Scholze Definition IV.1.1 (VStackSheavesAndLisseCategories §VS0.1 (*artin-v-stack-definition*)); in particular its diagonal is quasiseparated and representable in locally spatial diamonds.

Gulotta–Hansen–Weinstein, Proposition 4.4 and proof, p. 20, shows decent v-stacks are Artin v-stacks in the sense of Fargues–Scholze, with quasiseparated diagonal representable in locally spatial diamonds. Hansen–Kaletha–Weinstein, §4.1, list after Definition 4.1.7, p. 24, records that decent v-stacks are Artin v-stacks.

*Proof sketch.*

1. Pick a clean chart U → X using VS6.2, so U → X is separated. Fargues–Scholze Remark IV.1.4(ii) shows the diagonal of X is quasiseparated and reduces representability in locally spatial diamonds to representability in diamonds.
2. Representability of the diagonal in diamonds is the first claim of GHW22 Proposition 4.3(i), applied to the diagonal (VS6.1).
3. Refining the chart to a clean chart (VS6.2) gives a separated cohomologically smooth surjection from a locally spatial diamond, as the base roadmap's definition requires (GHW22 Proposition 4.4).

**Checks.**

- For S a geometric point and G as in VS10.6 (for instance G = GL_n(Z_p)), the classifying stack [S/G_S] is an Artin v-stack (HKW22 Example 4.2.2).
- A locally separated locally spatial diamond is Artin with the identity chart.

*Needs:* VS6.2; VS6.1; VStackSheavesAndLisseCategories §VS0.1 (*artin-v-stack-definition*).

### 6.4 Fibre products of decent v-stacks

Throughout this subsection, X₁, X₂, X₃ are decent v-stacks with maps X₂ → X₁ ← X₃.

If X₂ → X₁ ← X₃ are maps of decent v-stacks, then X₂ ×_(X₁) X₃ is decent; in particular absolute products of decent v-stacks are decent. If U_i → X_i are charts, U₂ ×_(X₁) U₃ → X₂ ×_(X₁) X₃ is a chart.

Gulotta–Hansen–Weinstein, Proposition 4.5 and proof, pp. 20–21, proves fibre products of decent v-stacks are decent, building charts from charts and handling the diagonal by cancellation. Hansen–Kaletha–Weinstein, §4.1, list after Definition 4.1.7, p. 24, records that absolute products and fibre products of decent v-stacks are decent.

*Proof sketch.*

1. Charts: U₂ ×_(X₁) U₃ is a locally separated locally spatial diamond by decency of X₁ (VS6.2), and U₂ ×_(X₁) U₃ → X₂ ×_(X₁) X₃ factors as two base changes of charts, hence is a chart (DiamondSixOperations S4 smoothness stable under base change and composition).
2. Diagonal: the map u : X₂ ×_(X₁) X₃ → X₂ × X₃ is a base change of the diagonal of X₁, hence representable in locally separated locally spatial diamonds and quasiseparated (VS6.3).
3. The composite of the diagonal of the fibre product with u × u equals the diagonal of X₂ × X₃ composed with u; cancel u × u, which is 0-truncated and quasiseparated, using the cancellation property of VS6.1 (GHW22 Proposition 4.5).

**Checks.**

- For decent S, products X ×_S Y of decent S-v-stacks are decent, as the tensor product of Corr_S requires.
- The inertia stack In_S(X) = X ×_(X ×_S X) X of a decent X is decent.

*Needs:* VS6.2; VS6.3; VS6.1; DiamondSixOperations §S4.4.

### 6.5 Basic examples of decent v-stacks

Throughout this subsection, in (i) X is an analytic adic space over Spa Z_p. In (iii) C is an algebraically closed perfectoid field, or k an algebraically closed discrete field of characteristic p.

(i) Every locally separated locally spatial diamond is decent; for an analytic adic space X over Spa Z_p the diamond X^♢ is decent. (ii) If X is a locally separated small v-sheaf admitting a surjective cohomologically smooth map from a separated locally spatial diamond, X is decent; this applies to Spd Z_p and Div¹, with chart X × Spd F_p((t^(1/p^∞))) → X. (iii) For a geometric point S = Spd C (C algebraically closed perfectoid) or S = Spd k (k algebraically closed discrete of characteristic p), S is decent, with chart S × Spd F_p((t^(1/p^∞))) → S in the second case.

Gulotta–Hansen–Weinstein, Discussion after Definition 1.1, p. 3, states that locally separated locally spatial diamonds, diamonds of analytic adic spaces, Spd Z_p and Div¹ are decent, with the stated charts. Hansen–Kaletha–Weinstein, §4.1, list after Definition 4.1.7, p. 24; §4.2 opening paragraph, p. 25, records the same examples and that the geometric points Spd C and Spd k are decent.

*Proof sketch.*

1. (i): the identity is a clean chart; diamonds of analytic adic spaces are locally spatial (DiamondsAndVStacks D6) and locally separated, affinoid opens being separated.
2. (ii): for a locally separated v-sheaf the diagonal is an injection, and the stated chart gives condition (2); GHW22 p. 3 records that the products with Spd F_p((t^(1/p^∞))) are analytic adic spaces cohomologically smooth over the base (DiamondSixOperations §S5.5).
3. (iii): Spd C is a separated spatial diamond; for Spd k the diagonal condition is checked directly and the displayed map is a chart (HKW22 §4.2, opening paragraph).

**Checks.**

- Spa(C, O_C)^♢ and the open unit disc over C are decent.
- Spd Z_p is decent but not a diamond.

*Needs:* VS6.2; DiamondsAndVStacks §D6.4 (*gluing-and-the-diamond-functor*); DiamondsAndVStacks §D6.5 (*etale-site-comparison*); DiamondSixOperations §S5.5.

### 6.6 Fine morphisms of decent v-stacks

Throughout this subsection, X, Y are decent v-stacks.

A map f : X → Y of decent v-stacks is fine if there is a commutative square with charts a : V → Y and b : W → X and a map g : W → V that is, locally on W, compactifiable of finite dim.trg. Equivalently, there is such a square with clean charts and g compactifiable of locally finite dim.trg; equivalently, with V → Y a chart, U = X ×_Y V and a chart W′ → U such that W′ → V is locally compactifiable of finite dim.trg. For every square of charts over a fine f the top map is locally compactifiable of finite dim.trg.

Gulotta–Hansen–Weinstein, Definition 1.3(i), p. 3; Remarks 4.6–4.7, pp. 21–23; Proposition 4.8(o), p. 23, defines fine morphisms through charts with a locally compactifiable finite-dim.trg top map, shows clean and Cartesian charts suffice, and that the condition holds for every square of charts. Hansen–Kaletha–Weinstein, Definition 4.1.7 (second paragraph), p. 23, restates fine morphisms as the maps for which exceptional functors exist.

The API of the definition:

- A square of clean charts with top map compactifiable of locally finite dim.trg witnesses fineness.
- A map representable in locally spatial diamonds, compactifiable and locally of finite dim.trg is fine.
- Composites of fine maps are fine.
- Base changes of fine maps along maps of decent v-stacks are fine.
- If X → Z and Y → Z are fine, every map X → Y over Z is fine.
- A separated map representable in locally spatial diamonds is fine iff it is compactifiable of locally finite dim.trg.
- For a fine map every square of charts has locally compactifiable finite-dim.trg top map.

In the sources it enters as follows: the exceptional functors Rf_!, Rf^! exist for fine f (HKW22 Theorem 4.1.8, p. 24); objects of Corr_S are fine over S and the right leg of a correspondence is fine (HKW22 Definition 4.3.3, p. 28); the relative dualizing complex K_(X/S) is defined for fine X → S (HKW22 Definition 4.1.9, p. 24).

*Proof sketch.*

1. Clean form: refine V and W as in VS6.2 and use Sch17 Proposition 22.3 to pass compactifiability through separated local isomorphisms (GHW22 Remark 4.6).
2. Cartesian form: given a square, set U = X ×_Y V and W′ = W ×_Y V; decency of Y makes W′ a locally separated locally spatial diamond and W′ → U a chart; W′ → V is a base change of f ∘ b (GHW22 Remark 4.7).
3. Independence of charts: compare two squares through W ×_X W′ using Sch17 Proposition 22.3(ii),(iv),(vii),(viii) and universal openness of smooth charts (GHW22 Proposition 4.8(o)).

**Checks.**

- The identity of a decent v-stack is fine.
- A map that is eligible in the sense of DiamondSixOperations S0 between locally separated locally spatial diamonds is fine, so fine maps extend the eligible class.
- For S a geometric point and G = GL_n(Z_p), the structure map [S/G_S] → S is fine (HKW22 Example 4.2.4).
- The structure map of the infinite-dimensional perfectoid ball B = Spa(C⟨T_1^(1/p^∞), T_2^(1/p^∞), …⟩) → Spa C is not fine, although its point T_1 = T_2 = … = 0 has residue field C. By VS6.7 (iv) fineness would require locally finite dim.trg, which for the quasicompact B means dim.trg(B → Spa C) < ∞; but at the Gauss point of B (the supremum norm of the coefficients) the reductions of T_1, T_2, … are algebraically independent over the residue field of C, so by Abhyankar's inequality its completed residue field, and every complete algebraically closed extension of it, has infinite topological transcendence degree over C.

*Needs:* VS6.2; DiamondSixOperations §S0.1; DiamondSixOperations §S0.2; DiamondSixOperations §S4.3.

### 6.7 Permanence of fine morphisms

Throughout this subsection, all v-stacks are decent.

(i) Fine maps are stable under composition. (ii) Base changes of fine maps along maps of decent v-stacks are fine. (iii) If h : X → Z and g : Y → Z are fine, every map f : X → Y with g ∘ f = h is fine. (iv) A separated map of decent v-stacks representable in locally spatial diamonds is fine iff it is compactifiable of locally finite dim.trg. In particular, for a correspondence X ← C → X′ of decent S-v-stacks with C → X′ fine and X, X′ fine over S, both legs and C → S are fine.

Gulotta–Hansen–Weinstein, Proposition 4.8 and proof, pp. 23–26, proves composition, base change, cancellation and the separated-representable criterion for fine maps. Hansen–Kaletha–Weinstein, §4.1 list after Definition 4.1.7, p. 24, and footnote 4, p. 28, uses composition and cancellation to see that both legs of a correspondence are fine.

*Proof sketch.*

1. (i): compose squares through T = V ×_(X₂) V′ (GHW22 Proposition 4.8(i)).
2. (ii): pull back a witnessing square along a chart of the new base and choose a chart of the base-changed source (GHW22 Proposition 4.8(ii)).
3. (iii): use clean charts of Y and X over Z and Sch17 Proposition 22.3(viii) for cancellation of compactifiability (GHW22 Proposition 4.8(iii)).
4. (iv): with clean charts, f is fine iff the top map is compactifiable of locally finite dim.trg, and compactifiability and dim.trg descend along universally open charts (GHW22 Proposition 4.8(iv)).

**Checks.**

- The left leg of every 1-morphism of Corr_S is fine (HKW22 footnote 4, p. 28).
- Fine maps include all maps representable in nice diamonds.

*Needs:* VS6.6; VS6.4; DiamondSixOperations §S0.2; DiamondSixOperations §S4.3.

### 6.8 Cohomologically smooth fine morphisms

Throughout this subsection, X, Y are decent v-stacks; ℓ ≠ p is prime.

A map f : X → Y of decent v-stacks is ℓ-cohomologically smooth if there is a commutative square of charts with top map g : W → V locally compactifiable of finite dim.trg and ℓ-cohomologically smooth (DiamondSixOperations S4). This agrees with Fargues–Scholze's smoothness of maps of Artin v-stacks (Definition IV.1.11, the base roadmap's convention in VStackSheavesAndLisseCategories §VS0.2 (*shriek-pullback-for-smooth-stacky-maps*)). Smooth fine maps are stable under composition and base change.

Gulotta–Hansen–Weinstein, Definition 1.3(ii), p. 3; Remark 4.6, last paragraph, p. 22, defines ℓ-cohomologically smooth maps of decent v-stacks through charts and notes agreement with Fargues–Scholze Definition IV.1.11. Hansen–Kaletha–Weinstein, Paragraph after Theorem 4.1.8, p. 24, recalls the extrinsic and intrinsic notions of smoothness for fine maps.

The API of the definition:

- A square of charts with ℓ-cohomologically smooth top map witnesses smoothness.
- For maps of decent v-stacks the notion agrees with Fargues–Scholze Definition IV.1.11.
- Composites of smooth fine maps are smooth.
- Base changes of smooth fine maps are smooth.
- For maps representable in locally spatial diamonds, compactifiable of locally finite dim.trg, the notion is that of DiamondSixOperations S4.

In the sources it enters as follows: smooth fine maps have invertible relative dualizing complexes (HKW22 Lemma 4.1.11, p. 24); smooth bases T → S with smooth diagonal in the Künneth theorem (HKW22 Definition 4.5.1 and Lemma 4.5.2, pp. 36–37); the structure map of a classifying stack is smooth (HKW22 Example 4.2.4, p. 27).

*Proof sketch.*

1. Agreement with Fargues–Scholze: refine charts as in GHW22 Remark 4.6 and use that smoothness is smooth-local on source and target (DiamondSixOperations §S4.4).
2. Composition and base change: combine VS6.7 with DiamondSixOperations §S4.4.
3. The intrinsic characterisation through exceptional functors is VS7.8.

**Checks.**

- Identities are ℓ-cohomologically smooth.
- For S a geometric point, G = GL_n(Z_p) and ℓ ≠ p, [S/G_S] → S is ℓ-cohomologically smooth.
- For S a geometric point and G = Z_p, the point S → [S/G_S] is fine but not ℓ-cohomologically smooth; for S = ∅ it is id_∅, which is smooth.
- Open immersions of decent v-stacks are ℓ-cohomologically smooth, in agreement with the cohomological smoothness criterion.

*Needs:* VS6.6; VS6.7; DiamondSixOperations §S4.2; DiamondSixOperations §S4.4; VStackSheavesAndLisseCategories §VS0.2 (*shriek-pullback-for-smooth-stacky-maps*); VStackSheavesAndLisseCategories §VS0.2 (the Check that the point of [∗/ℤ_p] is not a smooth atlas).

### 6.9 Classifying stacks of group diamonds and their 2-morphisms

Throughout this subsection, S is a diamond; G, H are group diamonds over S. This corrects HKW22 Example 4.1.1, which identifies all maps BG → BH with homomorphisms (Corrections to the sources).

For a diamond S and a group diamond G → S, BG = [S/G] is the small v-stack of right G-torsors, with S ×_(BG) S ≅ G. For group diamonds G, H over S, the groupoid of S-maps BG → BH is equivalent to the groupoid of right H-torsors P on S with a commuting left G-action (equivalently homomorphisms G → Aut_H(P)), with equivariant torsor isomorphisms as arrows; the map sends Q to Q ×^G P. A homomorphism f : G → H induces φ_f : BG → BH (P = H, the trivial right H-torsor, with g acting by left multiplication by f(g)), and 2-morphisms φ_(f₁) ⇒ φ_(f₂) are labelled by the h ∈ H(S) with f₁ = ad(h) ∘ f₂: the 2-morphism labelled h is left multiplication by h⁻¹ on H, which is right H-equivariant and carries the G-action through f₁ to the G-action through f₂ because h⁻¹f₁(g) = f₂(g)h⁻¹. The composite of the 2-morphisms labelled h : φ_(f₁) ⇒ φ_(f₂) and h′ : φ_(f₂) ⇒ φ_(f₃) is labelled hh′. For the point q = φ_(1→G) : S → BG and g ∈ G(S), α_g : q ⇒ q denotes left multiplication by g on the trivial torsor G (the 2-morphism labelled g⁻¹), so α_g ∘ α_(g′) = α_(gg′); since D_ét(−, Λ) is covariant in 2-morphisms (VS6.10), g ↦ α_g^* is a left action of G(S) on q^*M. For a left action of G on a diamond X over S, [X/G] is the quotient stack; its Y-points are right G-torsors P → Y with a map φ : P → X such that φ(y·g) = g⁻¹·φ(y), the left action being converted to a right action by x·g := g⁻¹·x. In the notation [T_S/G_S] for a locally profinite set T with an action of a locally profinite group G, T_S and G_S are the constant diamonds over S.

Hansen–Kaletha–Weinstein, Example 4.1.1, p. 22, introduces BG = [S/G], notes S ×_(BG) S ≅ G, and labels 2-morphisms between maps induced by homomorphisms f₁, f₂ by the h with f₁ = (ad h) ∘ f₂; the labelling is kept here, with the underlying map of torsors made explicit, and its identification of all maps with homomorphisms is corrected.

The API of the construction:

- A homomorphism of group diamonds f : G → H induces φ_f : BG → BH.
- S-maps BG → BH correspond to H-torsors on S with commuting G-action.
- 2-morphisms φ_(f₁) ⇒ φ_(f₂) correspond to h ∈ H(S) with f₁ = ad(h) ∘ f₂, the 2-morphism labelled h being left multiplication by h⁻¹ on the trivial right H-torsor; labels multiply under vertical composition.
- S ×_(BG) S ≅ G.
- For a left action of G on a diamond X over S, the quotient stack [X/G] with its map to BG, its points being right G-torsors with maps φ to X satisfying φ(y·g) = g⁻¹·φ(y).
- Each g ∈ G(S) gives the 2-morphism α_g : q ⇒ q of the point q : S → BG, left multiplication by g on the trivial torsor, with α_g ∘ α_(g′) = α_(gg′); g acts on q^*M by α_g^*.

In the sources it enters as follows: classifying stacks [S/G_S] and quotients [T_S/G_S] and the actions of g ∈ G through 2-morphisms α_g : q ⇒ q (HKW22 Examples 4.2.2–4.2.5, pp. 25–27); the inertia stack of [S/G_S] is the adjoint quotient [G_S//G_S] (HKW22 §4.4, p. 35); quotient stacks [X/G] for cohomologically smooth group diamonds G (HKW22 §4.6, pp. 41–43).

*Proof sketch.*

1. Torsor description: an S-map BG → BH is determined by the image P of the trivial G-torsor, an H-torsor with a commuting G-action given by the automorphisms of the trivial G-torsor (descent along S → BG, DiamondsAndVStacks D4 small v-stacks).
2. A chosen trivialisation P ≅ H turns the G-action into a homomorphism G → H; changing the trivialisation conjugates it.
3. For maps induced by specified homomorphisms, a 2-morphism is an H-equivariant automorphism of the trivial torsor intertwining the actions. Right H-equivariant maps H → H are the left multiplications x ↦ kx, and kf₁(g) = f₂(g)k for all g says f₁ = ad(k⁻¹) ∘ f₂, so the 2-morphism labelled h is left multiplication by k = h⁻¹; composing left multiplications by h⁻¹ and then h′⁻¹ gives left multiplication by (hh′)⁻¹.

**Checks.**

- For G = 1, BG = S.
- For S = Spd C and finite constant groups G, H, the set of isomorphism classes of S-maps BG → BH is Hom(G, H)/H-conjugacy.
- For S = Spd Q_p, G = 1, H = Z/2 constant, the nontrivial H-torsor from the unramified quadratic extension gives a map BG → BH not of the form φ_f.
- For f₁ = f₂ = id_H, the 2-automorphisms of id_(BH) are the elements of the centre of H(S).
- Orientation of the intertwiner (permutations composed right to left): for G = Z/2 = {1, t}, H = S₃, f₂(t) = (12) and h = (123), the homomorphism f₁ = ad(h) ∘ f₂ has f₁(t) = (23). Left multiplication by h⁻¹ = (132) intertwines the two actions, h⁻¹f₁(t) = (13) = f₂(t)h⁻¹, while left multiplication by h does not: hf₁(t) = (12) but f₂(t)h = (23). Abelian or central examples cannot detect this.
- For G = S₃ and the point q : S → BG, α_(12) ∘ α_(123) = α_((12)(123)) = α_(23), while α_(123) ∘ α_(12) = α_(13); so g acts on q^*M by α_g^* through a left action, and the order of composition is visible on any representation on which (23) and (13) act differently, such as the two-dimensional irreducible one.

*Needs:* DiamondsAndVStacks §D4.7 (*small-v-sheaves-and-small-v-stacks*); DiamondsAndVStacks §D4.10 (*small-quotients-and-underlying-spaces*); DiamondsAndVStacks §D5.12 (*relative-representability*).

### 6.10 Compatibility of pullback and pushforward with 2-morphisms

Throughout this subsection, X, Y are small v-stacks.

For maps f, g : Y → X of small v-stacks and a 2-morphism α : f ⇒ g there are natural isomorphisms α^* : f^* ≅ g^* and α_* : Rf_* ≅ Rg_* such that α_* α^* carries the unit id → Rf_* f^* to the unit id → Rg_* g^* and the counit f^* Rf_* → id to the counit g^* Rg_* → id; these isomorphisms are compatible with vertical and horizontal composition of 2-morphisms.

Hansen–Kaletha–Weinstein, Remark 4.1.2, p. 22, states that the pullback/pushforward adjunction is compatible with a 2-morphism through the unit and counit diagrams. Hansen–Kaletha–Weinstein, Definition 4.3.4, verification on p. 30, uses the two diagrams to show 2-morphisms of cohomological correspondences are well defined.

*Proof sketch.*

1. D_ét(−, Λ) is a v-sheaf of ∞-categories on small v-stacks (Sch17 §17, recorded in EnhancedDerivedSheaves E2), so f ↦ f^* is a pseudo-functor out of the (2,1)-category of small v-stacks; α^* is its value on α.
2. α_* is the mate of (α^(-1))^* under the adjunctions f^* ⊣ Rf_*, g^* ⊣ Rg_*; the two stated diagrams are the defining identities of a mate (EnhancedDerivedSheaves §E3.4).

**Checks.**

- For S a geometric point, G as in VS10.6, q : S → [S/G_S] and the 2-morphisms α_g, the induced automorphisms of q^*M give the G-action on the underlying Λ-module (HKW22 Example 4.2.2).
- The 2-morphisms of CoCorr_S are well defined on equivalence classes (VS8.7) using exactly these two diagrams.

*Needs:* DiamondsAndVStacks §D4.7 (*small-v-sheaves-and-small-v-stacks*); EnhancedDerivedSheaves §E3.4; EnhancedDerivedSheaves §E2.6; VStackSheavesAndLisseCategories §VS0.2 (*enhanced-smooth-descent*).

### 6.11 Proper fine and proper nice maps of decent v-stacks

Throughout this subsection, f : X → Y is a map of decent v-stacks. Proper is in the sense of DiamondsAndVStacks §D4.11.

Properness of maps of v-stacks, quasicompact, separated and universally closed, with its 0-truncatedness and permanence, is that of DiamondsAndVStacks §D4.11. A map f : X → Y of decent v-stacks is proper fine if it is proper and fine (VS6.6), and proper nice if it is proper fine and representable in locally spatial diamonds; a proper nice map is compactifiable of locally finite dim.trg (VS6.7 (iv)). Proper fine maps and proper nice maps are stable under composition and under base change along maps of decent v-stacks, and closed immersions of decent v-stacks are proper nice. Let V be a separated spatial diamond and f : X → V a proper fine map. Then X is a spatial v-sheaf (DiamondsAndVStacks §D5.1: quasicompact, quasiseparated, with a basis of quasicompact open subfunctors), and the following are equivalent: (a) X is a spatial diamond; (b) f is representable in locally spatial diamonds; (c) every point of |X| lies in the image of a quasi-pro-étale map Spa(C, C⁺) → X with C an algebraically closed perfectoid field.

In Scholze, Étale cohomology of diamonds, Definition 10.7(iii), Remark 10.8 and Proposition 10.9, pp. 51–52: separated maps of v-stacks have closed-immersion diagonals and are therefore 0-truncated. In Scholze, Étale cohomology of diamonds, Definition 18.1 and Proposition 18.3, pp. 100–101: proper maps of v-stacks are quasicompact, separated and universally closed, hence 0-truncated. In Scholze, Étale cohomology of diamonds, Definition 12.12, Theorem 12.18 and Remark 12.19, pp. 72–75: spatial v-sheaves, and the criterion that a spatial v-sheaf whose points are hit by quasi-pro-étale maps from geometric points is a spatial diamond; Proposition 23.11, pp. 145–146: cohomologically smooth maps are universally open. Hansen–Kaletha–Weinstein, Theorem 4.1.8 and Definitions 4.3.3–4.3.4, pp. 24, 28–30, uses proper maps of decent v-stacks with Rf_! ≅ Rf_* as 2-morphisms of correspondences; the comparison is VS7.7.

The API of the definition:

- A proper fine map is fine; a proper nice map is proper fine.
- Composites of proper fine (respectively proper nice) maps are proper fine (respectively proper nice).
- Base changes of proper fine (respectively proper nice) maps along maps of decent v-stacks are proper fine (respectively proper nice).
- Closed immersions of decent v-stacks are proper nice.
- For a proper fine f : X → V over a separated spatial diamond V, X is a spatial v-sheaf, and f is representable in locally spatial diamonds iff X is a spatial diamond iff every point of |X| is hit by a quasi-pro-étale map from a geometric point Spa(C, C⁺).
- For proper fine f there is a comparison c_f : Rf_! → Rf_*, an isomorphism for proper nice f (VS7.7).

In the sources it enters as follows: 2-morphisms of Corr_S are proper maps p with p_* = p_! (HKW22 Definition 4.3.3, p. 29); proper pushforward of dualizable objects and of characteristic classes (HKW22 Theorem 4.3.8 and Corollary 4.3.9, pp. 32–33); integration along proper maps (HKW22 Definition 4.1.9, p. 24).

*Proof sketch.*

1. Properness, its 0-truncatedness, its stability under composition and base change, and properness of closed immersions are DiamondsAndVStacks §D4.11 (Sch17 Definition 10.7(iii), Remark 10.8, Definition 18.1, Remark 18.2 and Proposition 18.3).
2. A proper map is compactifiable (it is its own canonical compactification, DiamondSixOperations §S0.1); for a separated map representable in locally spatial diamonds, fineness is compactifiability of locally finite dim.trg (VS6.7 (iv)).
3. Composition and base change: properness (DiamondsAndVStacks §D4.11), fineness (VS6.7) and representability in locally spatial diamonds (DiamondSixOperations §S0.4) are each stable. A closed immersion is proper (DiamondsAndVStacks §D4.11), a quasicompact injection, hence representable in locally spatial diamonds (DiamondsAndVStacks §D5.2), and fine by step 2.
4. Spatiality: X is a v-sheaf because f is 0-truncated and V is a sheaf, and it is quasicompact and quasiseparated because f is proper and V is qcqs. A chart b : W → X is, locally on W, separated and cohomologically smooth, hence universally open (DiamondSixOperations §S4.3, smooth maps are universally open); the images of the quasicompact opens of W are quasicompact open subfunctors of X and form a basis of |X|.
5. (c) ⇒ (a) is the spatial v-sheaf criterion (DiamondsAndVStacks §D5.11). (a) ⇒ (c): a spatial diamond receives a quasi-pro-étale surjection from a strictly totally disconnected perfectoid space, whose connected components are geometric points Spa(C, C⁺) included by pro-étale maps. (a) ⇒ (b): fibre products of locally spatial diamonds are locally spatial (DiamondsAndVStacks §D5.5 (*quasi-pro-etale-and-fibre-product-permanence*)), or descend along the universally open clean chart (DiamondSixOperations §S4.4, descent of representability). (b) ⇒ (a): X = X ×_V V is a locally spatial diamond and is qcqs.

**Checks.**

- The identity of a decent v-stack is proper nice.
- (P¹_C)^♢ → Spd C is proper nice; (P¹_C)^♢ is a spatial diamond, and every point of it is hit by a quasi-pro-étale map from a geometric point, as (c) requires.
- For S a geometric point, q : S → B(C₂) is proper nice: its base change along q is C₂ × S → S, finite étale. It is 0-truncated, yet q has the nontrivial 2-automorphism α_σ (VS6.9); proper maps need not have trivial 2-automorphism groups.
- For S a geometric point, p = 2 and Λ = F₃, f : B(C₃) → S is fine but not proper, its diagonal not being injective; correspondingly H^(-1)(Rf_!Λ) = H₁(C₃, F₃) = F₃ while H^(-1)(Rf_*Λ) = 0 and H¹(Rf_*Λ) = H¹(C₃, F₃) = F₃, so properness cannot be weakened to fineness in VS7.7.
- For S a geometric point and G = Z_p, [S/G_S] → S is not proper: its relative diagonal has fibre Isom(q, q) = Z_p × S over the S-point (q, q) of [S/G_S] ×_S [S/G_S], q : S → [S/G_S] the quotient, so it is not injective.
- The open unit disc over Spd C is fine but not proper over Spd C.
- The base V must be a separated spatial diamond: the identity of Spd Z_p (decent, VS6.5) is proper nice and satisfies (b), but (a) and (c) fail. Spd Z_p is not a diamond, and not even a spatial v-sheaf, since it is not quasiseparated: its characteristic-p locus is the final v-sheaf, so for two maps Spd F_p((t^(1/p^∞))) → Spd Z_p through characteristic-p untilts the fibre product over Spd Z_p is the absolute product, the perfectoid punctured open unit disc over F_p((t^(1/p^∞))), which is not quasicompact (Sch17, proof of Proposition 11.4). Its closed point is hit only by characteristic-p untilts Spa(C, C⁺) → Spd Z_p, and none is quasi-pro-étale: the base change along another such point Spa(C′, C′⁺) is the absolute product Spa(C, C⁺) × Spa(C′, C′⁺), which surjects onto the punctured open unit disc over Spa(C′, C′⁺), so it has points whose completed residue field is larger than C′ and is not pro-étale over Spa(C′, C′⁺).
- For f proper nice between locally spatial diamonds, the notion is Scholze's proper map in the eligible class of DiamondSixOperations S0.

*Needs:* VS6.7; VS6.6; VS6.5; DiamondsAndVStacks §D4.11 (Proper maps of v-stacks); DiamondSixOperations §S0.1; DiamondSixOperations §S0.4; DiamondSixOperations §S4.3; DiamondSixOperations §S4.4; DiamondsAndVStacks §D5.1 (*spatial-diamond*); DiamondsAndVStacks §D5.2 (*injection-and-finite-etale-permanence*); DiamondsAndVStacks §D5.5 (*quasi-pro-etale-and-fibre-product-permanence*); DiamondsAndVStacks §D5.11 (*spatial-v-sheaf-criterion*); DiamondsAndVStacks §D5.12 (*relative-representability*).

### Examples

- The inclusion of an open subdiamond U ⊂ X of a locally spatial diamond is representable in locally separated locally spatial diamonds.
- Spd Z_p is decent with chart Spd Z_p × Spd F_p((t^(1/p^∞))) → Spd Z_p, although Spd Z_p is not a diamond.
- For S a geometric point and G = GL_n(Z_p), the structure map [S/G_S] → S is fine (HKW22 Example 4.2.4).
- For S a geometric point, G = GL_n(Z_p) and ℓ ≠ p, [S/G_S] → S is ℓ-cohomologically smooth.
- For S = Spd C and finite constant groups G, H, the set of isomorphism classes of S-maps BG → BH is Hom(G, H)/H-conjugacy.
- (P¹_C)^♢ → Spd C is proper nice.

### Dependencies

This layer uses VStackSheavesAndLisseCategories §VS0.1, §VS0.2; DiamondSixOperations §S0.1, §S0.2, §S0.4, §S4.2, §S4.3, §S4.4, §S5.5; DiamondsAndVStacks §D4.1, §D4.7, §D4.10, §D4.11, §D5.1, §D5.2, §D5.5, §D5.11, §D5.12, §D6.4, §D6.5; EnhancedDerivedSheaves §E2.6, §E3.4.

## Layer VS7: exceptional functors for fine maps

Define prespatial diamonds and maps representable in them, prove their stability under canonical compactification and the 3·dim.trg amplitude bound, and construct Rf_! for weakly compactifiable maps between coproducts of qcqs v-sheaves. Construct the enhanced operation map on coproducts of qcqs v-sheaves (Gulotta–Hansen–Weinstein Theorem 3.14) with its ⊗-descent and !-codescent, and extend it by three iterations of Liu–Zheng's DESCENT to decent v-stacks with fine maps.

The layer delivers, for fine maps f of decent v-stacks, Rf_! and its right adjoint Rf^!, agreeing with Scholze's on maps representable in locally spatial diamonds, pseudo-functorial in the 2-category of decent v-stacks, with the projection formula, proper base change, (P1)–(P5), (BC1)–(BC2) and the Künneth formula; the comparison c_f : Rf_! → Rf_* for proper fine f, pseudo-natural in compositions and 2-morphisms and invertible for cohomologically proper f, which include the proper nice maps; the intrinsic characterisation of cohomological smoothness with smooth base change and Rf^! ≅ Rf^!Λ ⊗ f^*; the relative dualizing complex K_(X/S) with integration and pushforward of its sections along cohomologically proper maps; Rf^! commuting with twists by invertible objects; and K_(Y/Y×_XY) ≅ K_(Y/X)^(-1) for smooth f.

### 7.1 Prespatial diamonds

A qcqs diamond X is prespatial if it contains a spatial subdiamond X₀ ⊂ X with X₀(K, O_K) = X(K, O_K) for every perfectoid field K; a diamond X is locally prespatial if it contains a locally spatial subdiamond X₀ with X₀ → X quasicompact and the same equality of (K, O_K)-points. A map of v-stacks is representable in (locally) prespatial diamonds if it is 0-truncated and its base change to every (locally) prespatial diamond is (locally) prespatial. Prespatial diamonds are exactly the qcqs locally prespatial ones; open subdiamonds of locally prespatial diamonds are locally prespatial; (locally) spatial diamonds are (locally) prespatial; fibre products of (locally) prespatial diamonds are (locally) prespatial; and the canonical compactification of a separated map representable in prespatial diamonds is proper and representable in prespatial diamonds.

Gulotta–Hansen–Weinstein, Definitions 3.1 and 3.3, Lemmas 3.2 and 3.4, Proposition 3.6, pp. 13–14, introduces (locally) prespatial diamonds and pairs, maps representable in them, their permanence, and stability under canonical compactification.

The API of the definition:

- A spatial diamond is prespatial with X₀ = X.
- A diamond is prespatial iff it is locally prespatial and qcqs.
- Open subdiamonds of locally prespatial diamonds are locally prespatial.
- Fibre products of (locally) prespatial diamonds are (locally) prespatial.
- Maps representable in (locally) prespatial diamonds are stable under composition and base change.
- For f separated and representable in prespatial diamonds, the canonical compactification is proper and representable in prespatial diamonds.

In the sources it enters as follows: the enhanced operation map on qcqs v-sheaves uses proper maps representable in prespatial diamonds (GHW22 §3.2 Theorem 3.14); cohomological amplitude bounds for Rf_! of separated maps representable in prespatial diamonds (GHW22 Corollary 3.9).

*Proof sketch.*

1. Pairs: for a prespatial pair (X₀, X) and a locally prespatial pair (Y₀, Y) over a map X → Y, (X₀ ×_Y Y₀, X) is again a pair, since quasicompact injections into locally spatial diamonds have locally spatial source (GHW22 Lemma 3.2; DiamondsAndVStacks D5).
2. The sanity checks (i)–(vi) follow from the pair calculus (GHW22 Lemma 3.4).
3. Compactifications: the canonical compactification X̄^(/Y) → Y is proper (Sch17 Proposition 18.7(vii), recorded in DiamondSixOperations §S0.1) and has the same (K, O_K)-points as X, hence as X₀ (GHW22 Proposition 3.6).

**Checks.**

- Spa(C, O_C)^♢ is prespatial with X₀ = X.
- For a separated spatial diamond X over Spa(C, C⁺), the canonical compactification X̄^(/Spa(C,C⁺)) is prespatial, with X₀ = X (the two have the same (K, O_K)-points), and proper over Spa(C, C⁺).
- If (X₀, X) is a prespatial pair then |X₀ ×_(Spd(C,C⁺)) Spd(C,O_C)|^h → |X|^h is a homeomorphism of maximal Hausdorff quotients.
- An infinite disjoint union of points is locally prespatial but not prespatial, since it is not quasicompact.

*Needs:* DiamondsAndVStacks §D5.1 (*spatial-diamond*); DiamondsAndVStacks §D5.2 (*injection-and-finite-etale-permanence*); DiamondSixOperations §S0.1; DiamondsAndVStacks §D4.1 (*diamond*).

### 7.2 Cohomological amplitude for prespatial maps

Throughout this subsection, f is a map of small v-stacks as stated.

If f : X → Y is proper and representable in prespatial diamonds, Rf_* has cohomological amplitude at most 3·dim.trg f. If f is separated, representable in prespatial diamonds with dim.trg f < ∞, then Rf_* has amplitude at most 3·dim.trg f, and if moreover f is compactifiable, so does Rf_! = Rf̄_* ∘ j_!. For a separated spatial diamond X with |X| of Krull dimension d, the maximal Hausdorff quotient |X|^h has cohomological dimension at most d; quasicompact injections have pushforward of amplitude zero.

Gulotta–Hansen–Weinstein, Proposition 3.7, Lemma 3.8, Corollary 3.9, Lemma 3.10, pp. 14–15, proves the 3·dim.trg amplitude bound for proper and separated maps representable in prespatial diamonds and the auxiliary bound for maximal Hausdorff quotients.

*Proof sketch.*

1. Reduce to Y = Spd(C, C⁺) and X separated prespatial proper over Y with a sheaf A in degree 0 vanishing on the generic fibre, as in the proof of Sch17 Theorem 22.5 (DiamondSixOperations §S1.1).
2. Factor f through |X|^h × Y; the first map is proper and representable in spatial diamonds, with amplitude ≤ 2·dim.trg f (DiamondSixOperations §S1.4).
3. Bound the cohomology of |X|^h, giving the remaining dim.trg f. For X₀ as in VS7.1 put X₀′ = X₀ ×_(Spd(C,C⁺)) Spd(C, O_C): then |X₀′|^h ≅ |X|^h (VS7.1, Checks), X₀′ is a spatial diamond, separated because X is separated over the separated Y, and the Krull dimension of |X₀′| is at most dim.trg f (GHW22 proof of Proposition 3.7, pp. 14–15). For the quasicompact quasiseparated separated diamond X₀′ the maximal Hausdorff quotient map q gives Hⁱ(|X₀′|^h, F) ≅ Hⁱ(|X₀′|, q^*F) for every abelian sheaf F on |X₀′|^h (DiamondsAndVStacks §D5.15 (*reduction-to-spatial-and-hausdorff-cohomology*)), and the spectral space |X₀′| has cohomological dimension at most its Krull dimension (DiamondEtaleCohomology §C8.44 (Spectral-space cohomological dimension)); together these give GHW22 Lemma 3.8.
4. Separated case: factor through the canonical compactification and use that quasicompact injections have exact pushforward (GHW22 Corollary 3.9, Lemma 3.10).

**Checks.**

- For a proper prespatial curve over Spd C the amplitude of Rf_* is at most 3.
- A quasicompact open immersion has Rj_* of amplitude zero.

*Needs:* VS7.1; DiamondSixOperations §S1.1; DiamondSixOperations §S1.4; DiamondsAndVStacks §D5.14 (*berkovich-quotient*); DiamondsAndVStacks §D5.15 (*reduction-to-spatial-and-hausdorff-cohomology*); DiamondEtaleCohomology §C8.44 (Spectral-space cohomological dimension).

### 7.3 Exceptional pushforward for weakly compactifiable maps

A map of small v-stacks is strongly compactifiable if it is compactifiable, representable in prespatial diamonds and locally of finite dim.trg, and weakly compactifiable if it is compactifiable, representable in locally prespatial diamonds and its source has an open cover by pieces strongly compactifiable over the target. Both classes are stable under composition and base change; a map is strongly compactifiable iff it is weakly compactifiable and quasicompact; a proper weakly compactifiable map is strongly compactifiable; a strongly compactifiable f factors as a quasicompact open immersion j followed by a proper strongly compactifiable f̄. For weakly compactifiable f between coproducts of qcqs v-sheaves, Rf_! = h_! ∘ Rp_* ∘ j_! (j an open immersion, p proper strongly compactifiable, h a local isomorphism) is defined and satisfies composition, base change, the projection formula and commutes with colimits; it agrees with Scholze's Rf_! when f is representable in locally spatial diamonds.

Gulotta–Hansen–Weinstein, Definition 3.11, Lemma 3.12, Scholium 3.13 and the following paragraph, p. 16, defines strongly and weakly compactifiable maps, states their permanence (proofs of (i)–(iv) left to the reader) and the properties of Rf_! = h_! ∘ Rp_* ∘ j_!.

The API of the construction:

- f = f̄ ∘ j with j a quasicompact open immersion and f̄ proper strongly compactifiable.
- Weakly and strongly compactifiable maps are stable under composition and base change.
- Rf_! = h_! ∘ Rp_* ∘ j_! for maps between coproducts of qcqs v-sheaves.
- g^* Rf_! ≅ Rf′_! g̃^* for Cartesian squares.
- Rf_!(A ⊗ f^*B) ≅ Rf_!A ⊗ B.
- For f representable in locally spatial diamonds, Rf_! agrees with DiamondSixOperations §S2.3.

In the sources it enters as follows: the class W of weakly compactifiable maps marks the !-direction of the enhanced operation map on qcqs v-sheaves (GHW22 Theorem 3.14); on coproducts of separated spatial diamonds weakly compactifiable maps are exactly the fine maps (GHW22 §4.3).

*Proof sketch.*

1. Permanence (i)–(iv): base change and composition of compactifiability (DiamondSixOperations S0) and of representability in prespatial diamonds (VS7.1); the factorisation is through the canonical compactification. GHW22 Lemma 3.12 leaves (i)–(iv) to the reader; their proofs are part of this target.
2. Base change on unbounded complexes and commutation with colimits for Rf_* and Rf̄_*: repeat the arguments of Sch17 §§21–22 with the amplitude bound of VS7.2 (GHW22 Lemma 3.12(v)).
3. Composition, base change and projection formula of Rf_! = Rf̄_* ∘ j_!: as in DiamondSixOperations §S1.5 for spatial-eligible maps, with prespatial in place of spatial.
4. Only the case of maps between coproducts of qcqs v-sheaves is needed; GHW22 Scholium 3.13 claims the full extension of Sch17 §§22–24 without details, and that general claim is not a target here.

**Checks.**

- For a proper strongly compactifiable f, Rf_! = Rf_*.
- For a quasicompact open immersion j, Rj_! is extension by zero.
- For f representable in spatial diamonds, compactifiable of finite dim.trg, Rf_! is DiamondSixOperations §S1.2.
- The infinite-dimensional perfectoid ball over Spa C is not weakly compactifiable over Spa C: it is not locally of finite dim.trg.

*Needs:* VS7.1; VS7.2; DiamondSixOperations §S0.1; DiamondSixOperations §S0.2; DiamondSixOperations §S1.2; DiamondSixOperations §S1.5.

### 7.4 Enhanced operations for coproducts of qcqs v-sheaves

On the category Vsh_qcqs of small coproducts of qcqs v-sheaves, with the class W of weakly compactifiable maps, there is a Liu–Zheng enhanced operation map whose value on X is the symmetric monoidal ∞-category D_ét(X, Λ), whose ∗-direction is Scholze's pullback and whose !-direction on g ∈ W is the Rg_! of VS7.3. Proper weakly compactifiable maps and separated local isomorphisms are admissible classes whose restricted multisimplicial nerve is categorically equivalent to that of W. Every surjection in Vsh_qcqs is of universal ⊗-descent, and every surjection that is weakly compactifiable, representable in locally spatial diamonds and cohomologically smooth is of universal !-codescent.

Gulotta–Hansen–Weinstein, Theorem 3.14, Proposition 3.15 and proof of Theorem 3.14, pp. 17–18, constructs the enhanced operation map on coproducts of qcqs v-sheaves by categorical gluing and passage to adjoints, following Liu–Zheng. Gulotta–Hansen–Weinstein, Proposition 3.16, p. 19, proves universal ⊗-descent for surjections and universal !-codescent for weakly compactifiable smooth surjections.

The API of the construction:

- The value on X is D_ét(X, Λ) with its symmetric monoidal structure.
- The ∗-direction is Scholze's pullback.
- The !-direction on g ∈ W is the Rg_! of VS7.3.
- Surjections are of universal ⊗-descent.
- Weakly compactifiable cohomologically smooth surjections representable in locally spatial diamonds are of universal !-codescent.

In the sources it enters as follows: Input I of the first iteration of DESCENT (GHW22 §4.3); identifies the resulting !-functors with Scholze's on representable maps (GHW22 Proposition 4.13).

*Proof sketch.*

1. Categorical gluing: show that proper weakly compactifiable maps P and separated local isomorphisms I are admissible and that every strongly compactifiable map factors as p ∘ q with p ∈ P, q quasicompact in I; deduce the equivalences of restricted nerves as in Liu–Zheng's gluing of restricted nerves (GHW22 Proposition 3.15).
2. Start from the map encoding X ↦ D_ét(X, Λ) with symmetric monoidal ∗-pullbacks (EnhancedDerivedSheaves §E3.4 and E5:abstract/symmetric-monoidal-infinity-category).
3. Pass to right adjoints in the proper direction (adjointability from proper base change and projection formula, VS7.3) and to left adjoints in the local-isomorphism direction, by Liu–Zheng's partial adjoint theorem; transport along the equivalence of nerves (GHW22 Theorem 3.14).
4. Descent: D_ét is a v-sheaf of closed symmetric monoidal stable ∞-categories; codescent for smooth surjections follows by twisting !-pullbacks into ∗-pullbacks with the invertible Rf_n^!Λ (GHW22 Proposition 3.16).
5. Enhanced operation data, partial adjoints and gluing of restricted nerves require the separate supplier contracts gap:vs-pii-enhanced-operation-map, gap:vs-pii-partial-adjoints and gap:vs-pii-restricted-nerves.

**Checks.**

- At X = Spa(C, O_C)^♢ the value is the derived ∞-category of Λ-modules.
- For a map of separated spatial diamonds that is compactifiable of finite dim.trg, the !-functor is Scholze's Rf_!.
- For the surjective smooth map from the perfectoid unit ball over Spa C to Spa C, !-codescent holds: D_ét(Spa C, Λ) is the limit of the !-pullback diagram on the Čech nerve.
- For the profinite set T = Z₂, the surjection f : T × Spa C → Spa C is weakly compactifiable (proper of dim.trg 0) but not cohomologically smooth, so the smooth-surjection statement above does not apply to it. With Λ = F_ℓ (ℓ ≠ p) its dualizing object is the sheaf of distributions (VS10.4), and its stalk at t₀ = 0 has dimension at least 2, so it is not invertible. Put U_n = 2ⁿZ₂, x_n = 2ⁿ, y_n = 3·2ⁿ and ν(V) = Σ_n (1_V(x_n) − 1_V(y_n)) for V clopen; the sum is finite (a clopen V contains U_N for large N when 0 ∈ V and misses U_N for large N otherwise), so ν is a distribution. On U_n, δ₀ gives 1 and ν gives 0; on W_n = 2ⁿ + 2^(n+2)Z₂ ⊂ U_n, which contains x_n and no other x_m or y_m, δ₀ gives 0 and ν gives 1. So a·δ₀ + b·ν vanishes on all clopens near 0 only for a = b = 0. The same computation works at any non-isolated point with a countable clopen neighbourhood basis, for instance in any infinite metrizable profinite set; it does not apply as written at the point 0 of {0,1}^I with I uncountable, which has no countable neighbourhood basis, since countably many clopens involve only countably many coordinates.
- For every nonempty profinite set T, f : T × Spa C → Spa C is of universal !-codescent; for T = Z₂ this is a positive control outside the smooth class. Choose t₀ ∈ T: the section s = (t₀, id) is a closed immersion with f ∘ s = id, so s^!f^! ≅ id, and inserting t₀ as an extra first coordinate gives extra degeneracies of the Čech nerve of f augmented to Spa C; a split augmented cosimplicial diagram of ∞-categories is a limit diagram, and the splitting survives every base change. Cohomological smoothness is a sufficient condition for !-codescent here, not a necessary one.

*Needs:* VS7.3; VS7.1; EnhancedDerivedSheaves §E3.4; EnhancedDerivedSheaves §E5:abstract.1; EnhancedDerivedSheaves §E3.2; EnhancedDerivedSheaves §E2.6; DiamondSixOperations §S4.1; gap:vs-pii-enhanced-operation-map; gap:vs-pii-partial-adjoints; gap:vs-pii-restricted-nerves; gap:vs-pii-descent.

### 7.5 Exceptional functors for fine maps of decent v-stacks

Throughout this subsection, f is a fine map of decent v-stacks.

For a fine map f : X → Y of decent v-stacks there is a functor Rf_! : D_ét(X, Λ) → D_ét(Y, Λ) with right adjoint Rf^!, such that (1) Rf_! agrees with Scholze's when f is separated and representable in locally spatial diamonds; (2) f ↦ Rf_! is a pseudo-functor from the 2-category of decent v-stacks and fine maps to triangulated categories, so 2-morphisms α : f ⇒ g of fine maps induce isomorphisms α_! : Rf_! ≅ Rg_! and α^! : Rf^! ≅ Rg^! compatible with composition; (3) the projection formula Rf_!(A ⊗ f^*B) ≅ Rf_!A ⊗ B holds; (4) proper base change g^* Rf_! ≅ Rf′_! g̃^* holds for every Cartesian square of decent v-stacks with f fine; the whole structure is encoded by an enhanced operation map on decent v-stacks whose ∗-part is D_ét(−, Λ) with its symmetric monoidal pullbacks.

Gulotta–Hansen–Weinstein, Theorem 1.4, pp. 3–4; Theorem 2.6, p. 12, states the existence of Rf_! for fine maps of decent v-stacks with agreement, pseudo-functoriality, projection formula, proper base change and a right adjoint, from an enhanced operation map. Gulotta–Hansen–Weinstein, §§4.2–4.6, Theorem 4.9, Lemmas 4.10–4.11, Propositions 4.12–4.13, pp. 26–30, runs three iterations of Liu–Zheng's DESCENT and identifies the result with D_ét and Scholze's functors. Hansen–Kaletha–Weinstein, Theorem 4.1.8, p. 24, recalls the theorem as the input for stacky maps.

*Proof sketch.*

1. First iteration of DESCENT: from coproducts of separated spatial diamonds to quasiseparated locally separated locally spatial diamonds, with surjections as atlases, étale and smooth maps as the auxiliary classes and fine maps as the !-class; the fibre-product condition is GHW22 Lemma 4.10 (VS7.4 gives Input I).
2. Second iteration: to all locally separated locally spatial diamonds (GHW22 Lemma 4.11). Third iteration: to decent v-stacks with fine maps, atlases being surjections and the auxiliary class the smooth maps (GHW22 §4.5).
3. Each iteration uses the DESCENT extension required by gap:vs-pii-descent, with GHW22 Theorem 4.9 as the specialization of LiuZhengEnhanced Theorem 4.1.8(1); its P0–P5bis hypotheses are supplied by proper and smooth base change and the codescent of Proposition 3.16.
4. Identify the values with D_ét(X, Λ), compatibly with tensor products and pullbacks, using that every atlas is a v-cover (GHW22 Proposition 4.12); identify g_! with Scholze's Rg_! for representable g by hypercover and quasicompact-open exhaustion (GHW22 Proposition 4.13).
5. Pass to homotopy categories for (1)–(5) of GHW22 Theorem 1.4; Rf_! preserves colimits between presentable categories, so Rf^! exists (EnhancedDerivedSheaves §E3.2).

**Checks.**

- For S a geometric point, G as in VS10.6 and f : [S/G_S] → S, Rf_! is group homology twisted by Haar measures (VS10.9).
- For f representable in nice diamonds the functors are those of DiamondSixOperations S2–S3.

*Needs:* VS7.4; VS6.6; VS6.7; VS6.4; DiamondSixOperations §S2.3; DiamondSixOperations §S2.4; DiamondSixOperations §S3.1; EnhancedDerivedSheaves §E3.2; VStackSheavesAndLisseCategories §VS0.2 (*enhanced-smooth-descent*); gap:vs-pii-enhanced-operation-map; gap:vs-pii-partial-adjoints; gap:vs-pii-restricted-nerves; gap:vs-pii-descent.

### 7.6 The six-functor identities for fine maps

Throughout this subsection, all maps are maps of decent v-stacks; the shriek operations are those of VS7.5.

For a fine map f : Y → X of decent v-stacks and A, B ∈ D_ét: (P1) f^*A ⊗ f^*B ≅ f^*(A ⊗ B); (P2) Rf_* RHom(f^*A, B) ≅ RHom(A, Rf_*B); (P3) Rf_!(A ⊗ f^*B) ≅ Rf_!A ⊗ B; (P4) RHom(Rf_!A, B) ≅ Rf_* RHom(A, Rf^!B); (P5) Rf^! RHom(A, B) ≅ RHom(f^*A, Rf^!B). For a Cartesian square with f fine, (BC1) g^* Rf_! ≅ Rf′_! g̃^* and, when g is fine, (BC2) Rg^! Rf_* ≅ Rf′_* Rg̃^!. For fine X₁ → S, X₂ → S and correspondences, the Künneth formula (c₂ ×_S d₂)_!(B₁ ⊠_S B₂) ≅ c₂!B₁ ⊠_S d₂!B₂ holds, and the exterior product ⊠_S is compatible with !-pullback by a natural map c₂^!A′₁ ⊠_S d₂^!A′₂ → (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂).

Hansen–Kaletha–Weinstein, Theorems 4.1.4–4.1.5, pp. 22–23; Theorem 4.1.8, p. 24, lists (P1)–(P5) and (BC1)–(BC2) for maps representable in nice diamonds and asserts them for fine maps. Gulotta–Hansen–Weinstein, Theorem 1.4, pp. 3–4, provides the projection formula, proper base change and the right adjoint from which the rest is derived. Hansen–Kaletha–Weinstein, Definition 4.3.4, tensor product of 1-morphisms, p. 30, uses the Künneth isomorphism for !-pushforward to define tensor products of cohomological correspondences.

*Proof sketch.*

1. (P1), (P2) hold for all maps of small v-stacks (Sch17 Theorem 1.8).
2. (P3) and (BC1) are parts (3) and (4) of VS7.5.
3. (P4) and (P5) follow from (P3) and the adjunctions by the Yoneda lemma; (BC2) is the right adjoint of (BC1) applied to g (EnhancedDerivedSheaves §E3.4).
4. Künneth: factor c₂ ×_S d₂ as (c₂ × id) ∘ (id × d₂), apply (BC1) and (P3) twice; the !-pullback comparison is adjoint to the Künneth isomorphism.
5. GHW22 Theorem 1.4 states only agreement, pseudo-functoriality, (P3), (BC1) and the right adjoint; the remaining identities attributed to it by HKW22 Theorem 4.1.8 are derived here (Corrections to the sources).

**Checks.**

- For S a geometric point, G as in VS10.6, f : [S/G_S] → S and B = Λ, (P4) identifies the dual of group homology with group cohomology twisted by Haar(G, Λ)^∗.
- For f representable in nice diamonds the identities are those of DiamondSixOperations S2–S4 (HKW22 Theorems 4.1.4–4.1.5).

*Needs:* VS7.5; DiamondSixOperations §S3.4; DiamondSixOperations §S3.2; DiamondSixOperations §S3.3; EnhancedDerivedSheaves §E3.4; EnhancedDerivedSheaves §E1.4.

### 7.7 Exceptional and ordinary pushforward for proper fine maps

Throughout this subsection, f : X → Y is a proper fine map of decent v-stacks (VS6.11).

For a proper fine f the relative diagonal Δ_f : X → X ×_Y X is a closed immersion, and there is a natural transformation c_f : Rf_! → Rf_*, adjoint to the composite f^*Rf_! ≅ Rpr₂!pr₁^* → Rpr₂!RΔ_f*Δ_f^*pr₁^* = Rpr₂!RΔ_f! ≅ id, built from (BC1) for the square X ×_Y X, the unit of Δ_f^* ⊣ RΔ_f*, the identification RΔ_f* = RΔ_f! for the closed immersion Δ_f and pr₂ ∘ Δ_f = id. The transformations c_f are pseudo-natural on the (2,1)-category of decent v-stacks with proper fine maps: under the composition isomorphisms of VS7.5 (2) and of pushforward, c_(g∘f) = c_g ∘ c_f, and for every 2-morphism α : f ⇒ f′ of proper fine maps, c_(f′) ∘ α_! = α_* ∘ c_f, with α_! from VS7.5 (2) and α_* from VS6.10; α is arbitrary, and α_!, α_* are in general nontrivial automorphisms. c_f is compatible with base change: for a Cartesian square with f proper fine and g : Y′ → Y a map of decent v-stacks, g^*c_f corresponds to c_(f′)g̃^* under (BC1) and the base change map g^*Rf_* → Rf′_*g̃^*. (a) If f is proper nice, c_f is an isomorphism, and it is Scholze's identification of Rf_! with Rf_* for proper maps. (b) If for one chart a : V → Y the base change X ×_Y V → V is representable in locally spatial diamonds, c_f is an isomorphism. A proper fine map is cohomologically proper if c_(f′) is an isomorphism for every base change f′ of f along a map of decent v-stacks. Cohomologically proper maps include the proper nice maps and the maps of (b), in particular identities and closed immersions, and are stable under composition and under base change along maps of decent v-stacks. For cohomologically proper p, Rp_*Rp^! ≅ Rp_!Rp^! and the counit Rp_!Rp^! → id gives a trace map Rp_*Rp^! → id.

Hansen–Kaletha–Weinstein, Theorem 4.1.8, p. 24, asserts a pseudo-natural isomorphism Rf_! → Rf_* on proper morphisms, used throughout §4.3 for 2-morphisms of correspondences, and attributes it to Gulotta–Hansen–Weinstein, Theorem 1.4, pp. 3–4, whose list of properties contains no comparison of Rf_! with Rf_*. In Scholze, Étale cohomology of diamonds, Definition 10.7, Remark 10.8, Definition 18.1, pp. 51–52 and 100: proper maps of v-stacks are 0-truncated with closed-immersion diagonal, which the construction of c_f uses. Whether every proper fine map is cohomologically proper is not settled by the sources (Corrections to the sources); by (b) and VS6.11 it holds for f as soon as, for one chart V → Y, every point of X ×_Y V is hit by a quasi-pro-étale map from a geometric point. That point condition is a representability question of the kind the sources leave open: Scholze does not know whether the canonical compactification of a compactifiable map of spatial diamonds is spatial (Sch17, proof of Theorem 22.5, p. 130), Gulotta–Hansen–Weinstein introduce prespatial diamonds for that reason (GHW22 §3.1, p. 12) and leave a related representability question open (GHW22 Warning 4.2, pp. 19–20), and the condition fails for decent v-sheaves without a diamond base, since the closed point of Spd Z_p is hit by no quasi-pro-étale map from a geometric point (VS6.11, Checks).

The API of the construction:

- For a proper fine f : X → Y, the relative diagonal Δ_f is a closed immersion, and c_f : Rf_! → Rf_* is a natural transformation of functors D_ét(X, Λ) → D_ét(Y, Λ).
- For composable proper fine maps f and g, c_(g∘f) = c_g ∘ c_f under the composition isomorphisms of exceptional and of ordinary pushforward.
- For every 2-morphism α : f ⇒ f′ of proper fine maps, c_(f′) ∘ α_! = α_* ∘ c_f.
- For a Cartesian square of decent v-stacks with f proper fine and g : Y′ → Y, g^*c_f corresponds to c_(f′)g̃^* under (BC1) and the base change map g^*Rf_* → Rf′_*g̃^*.
- If f is proper nice, or if its base change along one chart of Y is representable in locally spatial diamonds, then c_f is an isomorphism.
- A proper fine map is cohomologically proper iff c_(f′) is an isomorphism for every base change f′ along a map of decent v-stacks. Proper nice maps, and in particular identities and closed immersions, are cohomologically proper, and the class is stable under composition and under base change along maps of decent v-stacks.
- For a cohomologically proper p, c_p and the counit of Rp_! ⊣ Rp^! give a trace map Rp_*Rp^! → id.

*Proof sketch.*

1. Δ_f is a closed immersion since f is separated, hence proper nice (VS6.11), and RΔ_f! = RΔ_f* by VS7.5 (1) and DiamondSixOperations §S1.2; (BC1) is VS7.6. This defines c_f.
2. Pseudo-naturality: c_f is assembled from (BC1), the unit of an adjunction, the closed-immersion identification and a composition isomorphism, all part of the coherent structure of the enhanced operation map of VS7.5 and of the ∗-pseudo-functor of VS6.10. These are natural in the (2,1)-category of decent v-stacks, so the identities for composites and for 2-morphisms follow by pasting mates (EnhancedDerivedSheaves §E3.4). No triviality of 2-morphisms is used, and none holds: 0-truncated maps can have nontrivial 2-automorphisms (Checks).
3. (a): by VS7.5 (1), Rf_! is Scholze's exceptional pushforward, which equals Rf_* for proper maps in the eligible class (DiamondSixOperations §S1.2 and §S2.3); this identification and c_f are adjoint to the same map f^*Rf_! → id, by the coherent exchange maps of DiamondSixOperations §S2.4.
4. (b): refine a to a clean chart (VS6.2), along which the base change of f is still representable in locally spatial diamonds, and call it a. Smooth base change gives a^*Rf_* ≅ Rf_V*ã^* on all of D_ét (DiamondSixOperations §S4.5) and (BC1) gives a^*Rf_! ≅ Rf_V!ã^*, so a^*c_f = c_(f_V)ã^*, invertible by (a); a^* is conservative because a is surjective and D_ét(−, Λ) satisfies v-descent.
5. Stability: c_(g∘f) = c_g ∘ c_f handles composites, and base changes of base changes are base changes. The class of (b) is stable under base change along Y′ → Y: a chart V′ of V ×_Y Y′ composed with V ×_Y Y′ → Y′ is a chart of Y′, along which the base change of f is a base change of X ×_Y V → V.

**Checks.**

- For a closed immersion i, Ri_! = Ri_* = i_* and c_i is the identity.
- For p : X → S proper smooth of dimension d over S = Spd C, the trace Rp_*Rp^!Λ → Λ is the trace map in degree 2d.
- For S a geometric point and Λ = F₃, q : S → B(C₂) is proper nice with Aut(q) = C₂ = {1, α_σ} (VS6.9). On q_!Λ = q_*Λ = Λ[C₂], with basis e_1, e_σ, the 2-morphism α_σ acts through α_σ! and α_σ* by the swap e_1 ↔ e_σ, not by the identity, while on q^*(sign) = Λ it acts by −1. The comparison c_q, which sends e_g to the function δ_g, commutes with the swap, as pseudo-naturality requires; a formulation treating 2-morphisms between 0-truncated maps as identities would force the swap of F₃² to be the identity.
- For S a geometric point, f : B(C₃) → S (p = 2, Λ = F₃) is fine but not proper, and H^(-1)(Rf_!Λ) = F₃ while H^(-1)(Rf_*Λ) = 0 (VS6.11): no comparison isomorphism exists for it, and none is claimed.

*Needs:* VS6.11; VS6.10; VS6.2; VS7.5; VS7.6; DiamondsAndVStacks §D4.11 (Proper maps of v-stacks); DiamondSixOperations §S1.2; DiamondSixOperations §S2.3; DiamondSixOperations §S2.4; DiamondSixOperations §S4.5; EnhancedDerivedSheaves §E3.4.

### 7.8 Intrinsic cohomological smoothness for fine maps

Throughout this subsection, f is a fine map of decent v-stacks; ℓ ≠ p prime.

For a fine map f : X → Y of decent v-stacks, the following are equivalent: (1) f is ℓ-cohomologically smooth (VS6.8); (2) Rf^!F_ℓ is invertible in the sense of DiamondSixOperations §S4.2 (étale locally F_ℓ[n], n locally constant), Rf^!F_ℓ ⊗ f^*(−) → Rf^!(−) is an isomorphism, and both statements hold after every decent base change; (3) Rf^!F_ℓ is invertible in that sense and its formation commutes with every decent base change. For smooth f and Λ with nΛ = 0, Rf^!Λ is invertible, Rf^!Λ ⊗ f^* ≅ Rf^!, smooth base change g̃^*Rf^! ≅ Rf′^! g^* and f′^*Rg_! ≅ Rg̃_! f^* hold, and the twisted pullback agrees with the base roadmap's exceptional pullback for smooth stacky maps (VStackSheavesAndLisseCategories §VS0.2 (*shriek-pullback-for-smooth-stacky-maps*)). Hence, for smooth fine f, Rf_! of VS7.5 is the base roadmap's stacky left adjoint f_! of that section, both being left adjoint to the same Rf^!.

Gulotta–Hansen–Weinstein, Proposition 4.14 and proof, p. 31, characterises ℓ-cohomological smoothness of fine maps intrinsically through Rf^!F_ℓ. Fargues–Scholze, Proposition IV.2.33, p. 129, characterises cohomological smoothness of representable compactifiable maps by ULA-ness of F_ℓ and invertibility of the dualizing object. Hansen–Kaletha–Weinstein, Paragraph after Theorem 4.1.8 and equation (4.1.2), pp. 23–24, uses the twisted-pullback isomorphism and smooth base change for smooth fine maps.

*Proof sketch.*

1. (1) ⇒ (2): with charts a, b and a smooth top map g, b^*Rf^!F_ℓ is a twist of Rg^!Ra^!F_ℓ by invertible objects, hence invertible; invertibility is v-local (DiamondSixOperations §S4.2, §S4.1).
2. (2) ⇒ (1): pull back a chart of Y; the top map g composed with a chart h of the source has R(g∘h)^! = R(g∘h)^!F_ℓ ⊗ (g∘h)^*, so g ∘ h is smooth (GHW22 Proposition 4.14).
3. (1) ⇔ (3): reduce to compactifiable maps of locally spatial diamonds and use Fargues–Scholze Proposition IV.2.33 (smooth iff F_ℓ is ULA with invertible dualizing object, iff the dualizing object is invertible and commutes with base change).
4. Smooth base change follows from (2) and (BC1); agreement with the base roadmap's construction: both are the twisted pullback along smooth charts, and the two left adjoints of isomorphic functors are isomorphic by uniqueness of adjoints.

**Checks.**

- For S a geometric point, G as in VS10.6 and f : [S/G_S] → S, Rf^!Λ = Haar(G, Λ)^∗ is invertible (VS10.9).
- For S a geometric point, G = Z_p, Λ ≠ 0 (for instance Λ = F_ℓ) and the point q : S → [S/G_S], Rq^!Λ = Haar(Z_p, Λ) is invertible but Rq^!Λ ⊗ q^*M → Rq^!M fails to be an isomorphism for the regular smooth representation M = C(Z_p, Λ), so q is not smooth; for Λ = 0 the map is 0 → 0, and the failure of smoothness is seen with F_ℓ coefficients.
- For S a geometric point, p = 2, Λ = F₃ and f : B(C₃) → S (smooth by VS10.9, C₃ being locally pro-2 with open trivial subgroup), Rf^!M is M with trivial action (Haar(C₃, F₃) ≅ F₃ by counting measure), so both Rf_! of VS7.5 and the base roadmap's f_! are derived coinvariants, with H^(-1)(Rf_!Λ) = H₁(C₃, F₃) = F₃. A model identifying the smooth-class pushforward with Rf_* would give H^(-1) = 0 and H¹ = H¹(C₃, F₃) = F₃ instead (VS6.11, VS7.7).

*Needs:* VS6.8; VS7.5; VS7.6; DiamondSixOperations §S4.2; DiamondSixOperations §S4.1; DiamondSixOperations §S4.5; VStackSheavesAndLisseCategories §VS1.2 (*smooth-ula-criterion*); VStackSheavesAndLisseCategories §VS0.2 (*shriek-pullback-for-smooth-stacky-maps*).

### 7.9 Relative dualizing complexes and integration

Throughout this subsection, f : X → S is fine; for integration f is cohomologically proper (VS7.7) and S connected.

For a fine map f : X → S of decent v-stacks, K_(X/S) := Rf^!Λ ∈ D_ét(X, Λ); H^0(X, A) denotes Hom(Λ_X, A). For a cohomologically proper p : X → X′ over S, pushforward p_∗ : H^0(X, K_(X/S)) → H^0(X′, K_(X′/S)) is induced by the counit p_!p^!K_(X′/S) → K_(X′/S) through Rp_∗ ≅ Rp_!. When S is connected and f is cohomologically proper, integration ∫_X : H^0(X, K_(X/S)) → H^0(S, Λ) = Λ is pushforward along f.

Hansen–Kaletha–Weinstein, Definition 4.1.9, p. 24, defines K_(X/S) = Rf^!Λ and the integration map for proper f over connected S, with H^0 meaning Hom from the constant sheaf. Hansen–Kaletha–Weinstein, Description of ΩCoCorr_S, p. 31, defines pushforward of sections of dualizing complexes along proper maps over S.

The API of the definition:

- K_(X/S) = Rf^!Λ.
- For X → Y → S fine, K_(X/S) ≅ g^!K_(Y/S).
- For smooth fine f, K_(X/S) is invertible and Rf^! ≅ K_(X/S) ⊗ f^*.
- For smooth fine f, formation of K_(X/S) commutes with decent base change.
- p_∗ : H^0(X, K_(X/S)) → H^0(X′, K_(X′/S)) for cohomologically proper p over S, with (q ∘ p)_∗ = q_∗ ∘ p_∗.
- ∫_X : H^0(X, K_(X/S)) → Λ for X cohomologically proper over connected S.
- For X = X₁ ⊔ X₂, ∫_X ω = ∫_(X₁) ω|_(X₁) + ∫_(X₂) ω|_(X₂).

In the sources it enters as follows: characteristic classes are sections of K_(In_S(X)/S) (HKW22 Definition 4.3.6, p. 32); the trace formula integrates the trace class over Fix(c) (HKW22 equation (4.3.5), p. 33); H^0 of the dualizing complex of [T_S/G_S] is the module of invariant distributions (HKW22 equation (4.2.1), p. 27, and §4.4, p. 35); local terms are images of trace classes under integration over clopen pieces (HKW22 §5.3, p. 48).

*Proof sketch.*

1. K_(X/S) is defined by VS7.5; p_∗ uses the isomorphism c_p : Rp_! ≅ Rp_∗ for cohomologically proper p (VS7.7) and K_(X/S) = p^!K_(X′/S); (q ∘ p)_∗ = q_∗ ∘ p_∗ by c_(q∘p) = c_q ∘ c_p.
2. Integration is the special case X′ = S with H^0(S, Λ) = Λ for connected S.

**Checks.**

- K_(S/S) = Λ_S and ∫_S is the identity of Λ.
- For S = Spd C and X = (P¹_C)^♢, K_(X/S) ≅ Λ(1)[2] and ∫_X is the trace isomorphism H²(P¹, Λ(1)) → Λ.
- For G = Z_p and S = Spd C, K_([S/G_S]/S) = Haar(Z_p, Λ)^∗, free of rank one.
- For S a geometric point (Spd C or Spd k), T = Z_p as a profinite set and Λ ≠ 0 (for instance Λ = F_ℓ), K_(T_S/S) is not invertible: H^0(T_S, K) = Dist(Z_p, Λ) (VS10.4) is not a rank-one locally free C(Z_p, Λ)-module, since the computation of the VS7.4 Check (written there for Z₂, valid at every non-isolated point of a metrizable profinite set) gives two Λ-independent germs of distributions at 0. For Λ = 0 every object is 0 and K = 0 is the invertible unit of the zero category; for S = ∅, T_S = ∅, D_ét(T_S, Λ) is zero and K = 0 is again invertible; for S = Spd C ⊔ Spd C, H^0(T_S, K) = Dist(Z_p, Λ)². So the nonzero coefficients and the hypothesis on S are both needed.
- For f representable in nice diamonds and smooth, K_(X/S) is the dualizing complex of DiamondSixOperations §S4.3.

*Needs:* VS7.5; VS7.7; DiamondSixOperations §S4.3.

### 7.10 Upper shriek commutes with twisting by invertible objects

Throughout this subsection, f is fine; I ∈ D_ét(X, Λ) is ⊗-invertible (Conventions): there is J with I ⊗ J ≅ Λ_X.

For a fine map f : Y → X of decent v-stacks and A, I ∈ D_ét(X, Λ) with I ⊗-invertible, the natural map Rf^!A ⊗ f^*I → Rf^!(A ⊗ I) of equation (4.1.2) is an isomorphism. No local description of I is assumed: I need not be étale locally a single shift L[n] of an invertible Λ-module, nor invertible in the stronger sense of DiamondSixOperations §S4.2.

Hansen–Kaletha–Weinstein, Lemma 4.1.10 and proof, p. 24, proves that upper shriek commutes with tensoring by an invertible object, by exhibiting the inverse map; the proof uses only a tensor inverse of I. Its description of invertible objects as étale locally L[n], p. 23, is too narrow (*Corrections to the sources*).

*Proof sketch.*

1. Write w_(A,I) for the map. It is compatible with tensor products in I: w_(A,Λ) = id and w_(A,I⊗I′) = w_(A⊗I,I′) ∘ (w_(A,I) ⊗ id_(f^*I′)), by the associativity of the projection-formula isomorphisms (VS7.6 (P3)).
2. With J a tensor inverse of I, the map w_(A⊗I, J), twisted by f^*I and composed with A ⊗ I ⊗ J ≅ A and f^*J ⊗ f^*I ≅ f^*(J ⊗ I) ≅ Λ_Y, gives Rf^!(A ⊗ I) → Rf^!A ⊗ f^*I.
3. The two composites are identities by step 1 applied to I ⊗ J ≅ Λ and J ⊗ I ≅ Λ, naturality, and the unit/counit identities of the adjunction Rf_! ⊣ Rf^! together with the projection formula (VS7.6 (P3)).

**Checks.**

- For S a geometric point, G as in VS10.6, f : [S/G_S] → S and I = Haar(G, Λ), the isomorphism moves the Haar twist through Rf^!.
- For I = Λ the map is the identity.
- ⊗-invertible objects need not be single shifts. Take p = 2, S = Spd C a geometric point, Λ = F₃ × F₃ with idempotents e₁ = (1, 0), e₂ = (0, 1), and I = e₁Λ ⊕ e₂Λ[1] on S. Then J = e₁Λ ⊕ e₂Λ[−1] is a tensor inverse: e₁Λ ⊗ e₂Λ = 0, so I ⊗ J = e₁Λ ⊕ e₂Λ = Λ. But H⁰(I) = e₁Λ ≅ F₃ and H⁻¹(I) = e₂Λ ≅ F₃ are both nonzero, and every étale cover of S splits, so I is not étale locally L[n] for one n, and it is not invertible in the sense of DiamondSixOperations §S4.2. The theorem applies to it: for f : (P¹_C)^♢ → S and A = Λ, both Rf^!Λ ⊗ f^*I and Rf^!I equal e₁Λ(1)[2] ⊕ e₂Λ(1)[3], with nonzero cohomology sheaves in degrees −2 and −3 only.
- The hypothesis on I cannot be dropped. For S a geometric point, G = Z_p, Λ ≠ 0, the point q : S → [S/G_S] and I = M the regular smooth representation C(Z_p, Λ), w_(Λ,M) is the map Rq^!Λ ⊗ q^*M → Rq^!M of the VS7.8 Checks, which is not an isomorphism; M is not ⊗-invertible, since q^*M is a free Λ-module of infinite rank while the pullback of a ⊗-invertible object to S is ⊗-invertible in D(Λ), hence perfect.

*Needs:* VS7.6; DiamondSixOperations §S4.2.

### 7.11 The dualizing complex of the relative diagonal

Throughout this subsection, f is fine and cohomologically smooth.

For a fine cohomologically smooth f : Y → X of decent v-stacks there is a canonical isomorphism RΔ^!_(Y/X)Λ_(Y×_XY) ⊗ Rf^!Λ_X ≅ Λ_Y; hence K_(Y/Y×_XY) ≅ K_(Y/X)^(-1) is invertible.

Hansen–Kaletha–Weinstein, Lemma 4.1.11, equation (4.1.3) and proof, pp. 24–25, proves the diagonal dualizing complex is inverse to the relative dualizing complex for smooth fine maps.

*Proof sketch.*

1. Λ_Y ≅ R id^! Λ_Y ≅ RΔ^! Rpr₁^! Λ_Y, and pr₁ is smooth, so RΔ^!Rpr₁^!Λ_Y ≅ RΔ^!Λ ⊗ Δ^*Rpr₁^!Λ_Y (VS7.10).
2. Smooth base change gives Δ^*Rpr₁^!f^*Λ_X ≅ Δ^*pr₂^*Rf^!Λ_X ≅ Rf^!Λ_X (VS7.8).

**Checks.**

- For S a geometric point, G as in VS10.6 and f : [S/G_S] → S, K_([S/G_S]/[S/G_S]×_S[S/G_S]) ≅ Haar(G, Λ).
- For f the identity both sides are Λ.

*Needs:* VS7.10; VS7.8.

### Examples

- For a separated spatial diamond X over Spa(C, C⁺), the canonical compactification X̄^(/Spa(C,C⁺)) is prespatial, with X₀ = X (the two have the same (K, O_K)-points), and proper over Spa(C, C⁺).
- For a quasicompact open immersion j, Rj_! is extension by zero.
- For the surjective smooth map from the perfectoid unit ball over Spa C to Spa C, !-codescent holds: D_ét(Spa C, Λ) is the limit of the !-pullback diagram on the Čech nerve.
- For S = Spd C and X = (P¹_C)^♢, K_(X/S) ≅ Λ(1)[2] and ∫_X is the trace isomorphism H²(P¹, Λ(1)) → Λ.
- For G = Z_p and S = Spd C, K_([S/G_S]/S) = Haar(Z_p, Λ)^∗, free of rank one.

### Dependencies

This layer uses this roadmap's VS6; VStackSheavesAndLisseCategories §VS0.2, §VS1.2; DiamondSixOperations §S0.1, §S0.2, §S1.1, §S1.2, §S1.4, §S1.5, §S2.3, §S2.4, §S3.1, §S3.2, §S3.3, §S3.4, §S4.1, §S4.2, §S4.3, §S4.5; DiamondsAndVStacks §D4.1, §D4.11, §D5.1, §D5.2, §D5.14, §D5.15; DiamondEtaleCohomology §C8.44; EnhancedDerivedSheaves §E1.4, §E2.6, §E3.2, §E3.4, §E5:abstract.1; the supplier gaps gap:vs-pii-descent, gap:vs-pii-enhanced-operation-map, gap:vs-pii-partial-adjoints, gap:vs-pii-restricted-nerves.

## Layer VS8: categorical traces and cohomological correspondences

Define dualizable objects, traces, pairings and dimensions in symmetric monoidal 2-categories, the functoriality of traces along right-adjointable morphisms (Lu–Zheng Constructions 1.7–1.8) and the symmetric monoidal Grothendieck construction. Prove the biduality criteria for dualizability in D(Λ), whose dualizable objects are the perfect complexes with their Euler-characteristic traces (EtaleCohomologyFoundations §F.10.3), and the reflexivity criterion over R/𝔪^k.

Construct the symmetric monoidal 2-category Corr_S of correspondences of decent S-v-stacks fine over S with cohomologically proper 2-morphisms, and CoCorr_S of cohomological correspondences (u : c₁^*A → c₂^!A′), with its tensor product, internal Hom and Grothendieck-construction description. Prove the dualizability criterion (𝔻A ⊠ A ≅ RHom(pr₁^*A, pr₂^!A)) and that dualizable means ULA for fine maps. Construct the trace class tr_c(u, A) ∈ H^0(Fix(c), K_(Fix(c)/S)), inertia stacks and characteristic classes cc_(X/S)(A), and prove their compatibility with open restriction.

### 8.1 Dualizable objects and categorical traces

Throughout this subsection, (C, ⊗, 1) is a symmetric monoidal bicategory.

Let (C, ⊗, 1) be a symmetric monoidal 2-category (a symmetric monoidal bicategory). An object X is dualizable if there are an object X^∨ and 1-morphisms ev_X : X^∨ ⊗ X → 1 and coev_X : 1 → X ⊗ X^∨ whose two zig-zag composites are isomorphic to the identities of X and X^∨. ΩC := End(1) is a 1-category. For an endomorphism e of a dualizable X, the trace is tr(e) := ev_X ∘ σ ∘ (e ⊗ id_(X^∨)) ∘ coev_X ∈ ΩC (σ the symmetry); for u : X → Y, v : Y → X the pairing is ⟨u, v⟩ := tr(v ∘ u), and dim(X) := tr(id_X). This extends the symmetric rigid trace of PivotalSpherical Layers 2 and 7 by allowing nontrivial 2-cells and trace morphisms in ΩC.

Lu–Zheng, §1.1, Definition 1.1, Remarks 1.2–1.3, Lemma 1.4, Notation 1.5, Construction 1.6, pp. 3–5, defines dualizable objects, ΩC, traces, pairings and dimensions in symmetric monoidal 2-categories (bicategories), and their basic properties. Hansen–Kaletha–Weinstein, Definition 4.3.1, pp. 27–28, recalls dualizability and the categorical trace tr(f) ∈ ΩC = End(1) after Lu–Zheng.

The API of the definition:

- tr(e) = ev_X ∘ σ ∘ (e ⊗ id) ∘ coev_X ∈ End(1) for an endomorphism e of a dualizable X.
- If X is dualizable, Hom(X, Y) exists and is Y ⊗ X^∨.
- X^∨ is dualizable with dual X; X ⊗ Y is dualizable with dual X^∨ ⊗ Y^∨.
- A symmetric monoidal functor preserves duals and carries tr(e) to tr(F(e)) (VS8.2).

In the sources it enters as follows: the trace of an endomorphism of a dualizable object of CoCorr_S is the pair (Fix(c), tr_c(u, A)) (HKW22 §4.3, pp. 31–32); the characteristic class is the trace of the identity (HKW22 Definition 4.3.6, p. 32); traces in D(Λ) are Euler-characteristic traces (HKW22 Example 4.3.2, p. 28); pairings ⟨u, v⟩ and their symmetry, used for relative Lefschetz–Verdier pairings (LZ22 Construction 1.6).

*Proof sketch.*

1. The dual is unique up to equivalence, X^∨ is dualizable with dual X, and X ⊗ Y is dualizable with dual X^∨ ⊗ Y^∨ (LZ22 Remark 1.2).
2. − ⊗ X^∨ is right and left adjoint to − ⊗ X, so Hom(X, Y) exists and is Y ⊗ X^∨ (LZ22 Remark 1.3); conversely X is dualizable iff Hom(X, 1) and Hom(X, X) exist and X ⊗ Hom(X, 1) → Hom(X, X) is split epi (LZ22 Lemma 1.4).
3. Duals of morphisms u^∨ and the squares (1.1) give ⟨u, v⟩ ≅ ⟨v, u⟩ when X, Y are both dualizable (LZ22 Construction 1.6).

**Checks.**

- For the unit object of Corr_S, its identity has trace S, the unit in ΩCorr_S.
- For a finite discrete diamond T_S, the identity correspondence has fixed locus T_S; a transposition on two points has empty fixed locus and trace ∅.
- For (S, Λ ⊕ Λ[1]) in CoCorr_S, the trace class of the identity is 1 − 1 = 0, fixing the symmetry sign.

*Needs:* Mathlib `CategoryTheory.MonoidalCategory`; Mathlib `CategoryTheory.SymmetricCategory`; Mathlib `CategoryTheory.ExactPairing`; Mathlib `CategoryTheory.ExactPairing.coevaluation`; Mathlib `CategoryTheory.ExactPairing.evaluation`; Mathlib `CategoryTheory.HasRightDual`; Mathlib `CategoryTheory.Bicategory`; EnhancedDerivedSheaves §E5:abstract.1; PivotalSpherical Layer 2; PivotalSpherical Layer 7.

### 8.2 Functoriality of traces in symmetric monoidal 2-categories

Throughout this subsection, C is a symmetric monoidal bicategory; f is right adjointable (Mathlib's `CategoryTheory.Bicategory.Adjunction`) where stated.

For a square f ∘ e ⇒ e′ ∘ f in C (e, e′ endomorphisms of dualizable X, X′, a 2-morphism filling the square) with f right adjointable, there is a morphism tr(e) → tr(e′) in ΩC built from the unit and counit of f ⊣ f^! and the duality data; more generally pairings ⟨u, v⟩ → ⟨u′, v′⟩ for squares (1.2), and, for squares equipped with a splitting, without adjointability. These morphisms are compatible with vertical composition, so tr is a functor from the (2,1)-category of endomorphisms of dualizable objects with right-adjointable morphisms to ΩC. A symmetric monoidal functor preserves duals, traces, pairings and these morphisms.

Lu–Zheng, §1.2, Constructions 1.7–1.8 and Remark 1.9, pp. 5–7, constructs the morphism of traces attached to a lax-commuting square with right-adjointable vertical maps, its split variant, functoriality, and preservation by symmetric monoidal functors. Hansen–Kaletha–Weinstein, Proof of Theorem 4.3.8, p. 33, applies Lu–Zheng Construction 1.7 to obtain tr(p̃) : tr(f) ⇒ tr(f′).

*Proof sketch.*

1. Construct the morphism by pasting (f ⊗ f^(!∨)) ∘ coev_X ⇒ coev_(X′) (from the counit of f), the given 2-morphism, and ev_X ⇒ ev_(X′) ∘ (f^(!∨) ⊗ f) (from the unit) (LZ22 Construction 1.7, equations (1.3)–(1.4)).
2. Without adjointability, decompose a split square and use the case f = id twice (LZ22 Construction 1.8).
3. Functoriality in vertical composition is the coherence of mates (Mathlib's bicategorical mates; LZ22 cites Hoyois–Scherotzke–Sibilla §2.1).
4. Symmetric monoidal functors preserve all the data since they preserve the duality equations (LZ22 Remark 1.9).

**Checks.**

- For a 1-category C every square with invertible 2-cell gives an equality tr(e) = tr(e′) when f is an isomorphism.
- Applied to a symmetric monoidal base change functor it gives the base change of local terms (VS9.6).
- For the empty correspondence on X = P¹_C, with X′ = C′ = S, the 2-cell is the closed immersion ∅ → X, which is cohomologically proper; a map X → ∅ cannot exist. Both trace integrals are 0.

*Needs:* VS8.1; Mathlib `CategoryTheory.Bicategory.Adjunction`; Mathlib `CategoryTheory.Pseudofunctor`.

### 8.3 The symmetric monoidal Grothendieck construction

Throughout this subsection, B is a symmetric monoidal bicategory; F is right-lax symmetric monoidal.

For a symmetric monoidal 2-category B and a right-lax symmetric monoidal functor F : B → Cat^co (Cat with 2-morphisms reversed), with unit e_F ∈ F(1) and exterior products ⊠ : F(X) × F(X′) → F(X ⊗ X′), the Grothendieck construction C_F has objects (X, L) with L ∈ F(X), morphisms (c, u) with c : X → Y and u : F(c)L → M, 2-morphisms p : c ⇒ d compatible with u, v through F(p), and tensor (X, L) ⊗ (X′, L′) = (X ⊗ X′, L ⊠ L′). For a morphism f : X → X′ of B and L ∈ F(X) write f♮ = (f, id) : (X, L) → (X′, F(f)L). Let f : X → X′, g : Y → Y′, c : X → Y and c′ : X′ → Y′ be morphisms of B and p : g ∘ c ⇒ c′ ∘ f a 2-morphism; then for every morphism (c, u) : (X, L) → (Y, M) of C_F above c there is a unique morphism (c′, u′) : (X′, F(f)L) → (Y′, F(g)M) above c′ such that p is a 2-morphism g♮ ∘ (c, u) ⇒ (c′, u′) ∘ f♮ of C_F. If f : X → X′ is right adjointable in B, so is f♮ : (X, L) → (X′, F(f)L); if moreover the F_(c,c′) are isomorphisms, (X, L) is dualizable in C_F and X′ is dualizable in B, then (X′, F(f)L) is dualizable with dual (X′^∨, F(f^(!∨))L^∨). Right-lax symmetric monoidal transformations and functors induce right-lax symmetric monoidal functors of Grothendieck constructions.

Lu–Zheng, §1.3, Construction 1.10, Lemma 1.11, Remark 1.12, Constructions 1.13–1.16, pp. 7–10, defines the symmetric monoidal Grothendieck construction of a right-lax functor to Cat^co, the unique lift of morphisms over 2-morphisms, adjointability and dualizability transfer, and functoriality.

The API of the construction:

- Objects (X, L) with L ∈ F(X).
- Morphisms (c, u) with u : F(c)L → M.
- (X, L) ⊗ (X′, L′) = (X ⊗ X′, L ⊠ L′), unit (1, e_F).
- For p : g ∘ c ⇒ c′ ∘ f in B and (c, u) : (X, L) → (Y, M) above c, there is a unique (c′, u′) : (X′, F(f)L) → (Y′, F(g)M) above c′ making p a 2-morphism g♮ ∘ (c, u) ⇒ (c′, u′) ∘ f♮ (LZ22 Lemma 1.11).
- The forgetful symmetric monoidal functor C_F → B.
- Dualizability of (X′, F(f)L) for right-adjointable f with X′ dualizable (LZ22 Remark 1.12(b)).
- Right-lax symmetric monoidal transformations F → G induce right-lax symmetric monoidal functors C_F → C_G.

In the sources it enters as follows: the category of cohomological correspondences is the Grothendieck construction over correspondences (LZ22 Remark 2.7); existence and uniqueness of f′ ∈ End(X′) over C′ and dualizability of (X′, q_∗A) (HKW22 Theorem 4.3.8, p. 32); based cohomological correspondences combine two such constructions (HKW22 Definition 4.5.4, p. 39).

*Proof sketch.*

1. Objects, morphisms, 2-morphisms and tensor products are as in LZ22 Construction 1.10.
2. Uniqueness of the pushed morphism: u′ is forced to be F(c′)F(f)L ≅ F(c′f)L → F(gc)L ≅ F(g)F(c)L → F(g)M (LZ22 Lemma 1.11).
3. Adjointability and dualizability transfer: write the unit and counit of f♮ from those of f and the duality data of (X, L) through F (LZ22 Remark 1.12).
4. Functoriality in F: LZ22 Constructions 1.13–1.16 and Lemma 1.14.

**Checks.**

- For B terminal, C_F ≅ F(∗) with ⊠ as tensor.
- Endomorphisms of (X, L) over id_X are End_(F(X))(L).
- For B = Corr_S and F = (c ↦ c₂!c₁^*), the morphisms of C_F over c are Hom(c₁^*L, c₂^!M) by adjunction, recovering HKW22 Definition 4.3.4.
- If some F_(c,c′) is not an isomorphism, the transfer of dualizability along right-adjointable f can fail; the isomorphism hypothesis is part of the statement.

*Needs:* VS8.1; VS8.2; Mathlib `CategoryTheory.Bicategory`; Mathlib `CategoryTheory.Pseudofunctor`.

### 8.4 Biduality criteria for dualizability in D(Λ)

Throughout this subsection, Λ is a commutative ring; D(Λ) is the derived ∞-category of Λ-modules with the derived tensor product ⊗ and internal Hom RHom (EnhancedDerivedSheaves §E1.4); 𝔻M := RHom(M, Λ[0]).

For M ∈ D(Λ) the following are equivalent: (a) the biduality map M → 𝔻𝔻M and the map 𝔻M ⊗ M → 𝔻(M ⊗ 𝔻M) are isomorphisms; (b) the map M ⊗ 𝔻M → RHom(M, M) adjoint to the evaluation 𝔻M ⊗ M → Λ is an isomorphism; (c) M is dualizable in the symmetric monoidal category D(Λ). In that case 𝔻M, with the evaluation 𝔻M ⊗ M → Λ and the coevaluation Λ → M ⊗ 𝔻M corresponding to id_M under (b), is a dual of M. By EtaleCohomologyFoundations §F.10.3, (c) holds iff M is perfect, and by DGAInfinity Layer 5 iff M is compact; for such M the categorical trace of an endomorphism f is its Lefschetz number Σ_i (−1)^i tr_proj(f^i | P^i), computed on any bounded complex P of finitely generated projective Λ-modules representing M with a chain endomorphism (f^i) lifting f, tr_proj being Tau Ceti's `LinearMap.projectiveTrace`. This subsection owns (a) and (b) and their equivalence with (c); the identification with perfect and compact objects and the trace formula are imported.

Hansen–Kaletha–Weinstein, Example 4.3.2, p. 28, and Lemma B.1.2(2), p. 73, state that the dualizable objects of D(Λ) are the perfect complexes, with dual RHom(M, Λ[0]) and the Euler-characteristic trace, and prove the equivalence of the biduality conditions with perfectness.

The API of the theorem:

- If M → 𝔻𝔻M and 𝔻M ⊗ M → 𝔻(M ⊗ 𝔻M) are isomorphisms, M is dualizable with dual 𝔻M.
- If M ⊗ 𝔻M → RHom(M, M) is an isomorphism, M is dualizable with dual 𝔻M, the coevaluation being the preimage of id_M.
- If M is dualizable, both maps of (a) and the map of (b) are isomorphisms.
- For dualizable M and an endomorphism f, tr(f) is the Lefschetz number of EtaleCohomologyFoundations §F.10.3.

In the sources it enters as follows: dualizability of (S, A) in CoCorr_S over a geometric point is perfectness of A, and the evaluation and coevaluation of VS8.8 specialise to those of (b) (HKW22 Proposition 4.3.5, p. 31); dualizability of RΓ(X, A) in the Lefschetz formula (HKW22 Example 4.3.10, p. 33); perfectness of invariants in the admissibility criterion (HKW22 Proposition 4.4.1, pp. 34–35).

*Proof sketch.*

1. (a) ⇒ (b): RHom(M, M) ≅ RHom(M, 𝔻𝔻M) ≅ 𝔻(M ⊗ 𝔻M) ≅ 𝔻M ⊗ M, and the composite is the map of (b) after the symmetry.
2. (b) ⇒ (c): the preimage of id_M under (b) is a coevaluation Λ → M ⊗ 𝔻M; with the evaluation 𝔻M ⊗ M → Λ it satisfies the two triangle identities, checked by evaluating (b) on id_M (HKW22 Lemma B.1.2(2)).
3. (c) ⇒ (a) and (b): a dualizable M is perfect (EtaleCohomologyFoundations §F.10.3); on a bounded complex P of finitely generated projective modules representing M, 𝔻P is computed termwise and both maps of (a), and the map of (b), are termwise isomorphisms of finitely generated projective modules: the biduality map (Mathlib's `Module.IsReflexive` instance for finite projective modules) and the maps Hom(P, Λ) ⊗ Q → Hom(P, Q) for P finite projective.
4. Trace: EtaleCohomologyFoundations §F.10.3, with Tau Ceti's `LinearMap.projectiveTrace` on each term, which is the matrix trace on finite free modules (`LinearMap.projectiveTrace_eq_trace`) and the categorical trace of finite projective modules (AdicSpacesPartIII §R3.8 (*projective-trace-realization*)).

**Checks.**

- For M = Λ^n[0] and f a matrix, tr(f) is the matrix trace; for M = 0 it is 0.
- For M = Λ ⊕ Λ[1] and f = id, tr(f) = 1 − 1 = 0 = χ(M); a trace without the Koszul sign of the symmetry would give 2.
- For Λ = Z/6 and P = 3Λ, P is the summand defined by the idempotent 3 (3·3 = 9 = 3 in Z/6); P[0] is dualizable and tr(id_P) = tr_proj(id_P) = 3, the idempotent cutting out P, whereas Mathlib's `LinearMap.trace` is 0 on P because P, of cardinality 2, has no finite basis over Z/6.
- For Λ = Z and M = Q[0], M is neither perfect nor compact nor dualizable: (b) fails since 𝔻M = RHom(Q, Z) has H⁰ = 0 and H¹ = Ext¹(Q, Z) ≠ 0, so M ⊗ 𝔻M has no H⁰ while RHom(M, M) has H⁰ = Q.
- For Λ a field and M = Λ^(ℕ)[0], M → 𝔻𝔻M is injective but not surjective, so (a) fails; M is not perfect.

*Needs:* VS8.1; EnhancedDerivedSheaves §E1.4; Mathlib `DerivedCategory`; Mathlib `Module.IsReflexive`; Tau Ceti `LinearMap.projectiveTrace`; EtaleCohomologyFoundations §F.10.3; DGAInfinity Layer 5; AdicSpacesPartIII §R3.8 (*projective-trace-realization*).

### 8.5 Reflexivity over truncated discrete valuation rings

Throughout this subsection, R is a discrete valuation ring; k ≥ 1; Λ = R/𝔪^k.

Let R be a discrete valuation ring with maximal ideal 𝔪 and Λ = R/𝔪^k (k ≥ 1). A Λ-module M is reflexive (Mathlib's `Module.IsReflexive`: the canonical evaluation M → M^∗∗ is bijective) if and only if M is finitely generated. Consequently, for M ∈ D(Λ) the map M → 𝔻𝔻M is an isomorphism iff every H^i(M) is finitely generated.

Hansen–Kaletha–Weinstein, Lemma B.1.1 and Lemma B.1.2(1), pp. 72–73, proves that over R/𝔪^k a module is reflexive iff finitely generated, and the derived consequence for the biduality map.

*Proof sketch.*

1. If M is finitely generated it is a finite sum of cyclic Λ-modules, each reflexive.
2. Converse by induction on k: Λ is self-injective (Artinian serial), so dualizing is exact; compare the sequences 0 → 𝔪M → M → M/𝔪M → 0 and their double duals; M/𝔪M is reflexive over κ = R/𝔪, hence finite-dimensional; the snake lemma makes 𝔪M reflexive over R/𝔪^(k−1) (HKW22 Lemma B.1.1, with the index corrected in Corrections to the sources).
3. Derived version: self-injectivity gives H^i(𝔻M) ≅ H^(−i)(M)^∗, so H^i(𝔻𝔻M) ≅ H^i(M)^∗∗ (HKW22 Lemma B.1.2(1)).

**Checks.**

- For Λ = Z/ℓ² and M = Z/ℓ ⊕ Z/ℓ², M ≅ M^∗∗.
- For Λ = Z/ℓ and M = Λ^(ℕ), M → M^∗∗ is injective but not surjective.
- For k = 1, reflexivity is finite dimensionality over R/𝔪; for M = (R/𝔪)² evaluation sends (x,y) to (φ ↦ φ(x,y)) and is an isomorphism.

*Needs:* Mathlib `IsDiscreteValuationRing`; Mathlib `IsLocalRing.maximalIdeal`; Mathlib `Module.Dual`; Mathlib `Module.Dual.eval`; Mathlib `Module.Finite`; Mathlib `DerivedCategory`; Mathlib `Module.IsReflexive`; Mathlib `Module.instFiniteDimensionalOfIsReflexive`.

### 8.6 The symmetric monoidal 2-category of correspondences

Throughout this subsection, S is a decent v-stack. Proper 2-morphisms are cohomologically proper maps (VS7.7): proper fine maps, hence 0-truncated, whose comparison Rp_! → Rp_* is invertible after every decent base change; they include the proper nice maps (VS6.11).

For a decent v-stack S, Corr_S has objects the decent S-v-stacks X with fine structure map; 1-morphisms X → X′ are correspondences X ← C → X′ (c₁, c₂) of decent v-stacks over S with c₂ fine (then c₁ and C → S are fine), composed by fibre product C ×_(X′) D; 2-morphisms c ⇒ d are equivalence classes of triples (p, α₁, α₂) with p : C → D cohomologically proper (VS7.7) and 2-isomorphisms α_i : c_i ⇒ d_i ∘ p, two triples being equivalent when a 2-isomorphism γ : p ⇒ q satisfies β_i = (id_(d_i) ∗ γ) ∘ α_i. The tensor product is X ⊗ Y = X ×_S Y with unit S, and c ⊗ d = c ×_S d. ΩCorr_S is the 1-category of decent v-stacks fine over S with cohomologically proper maps over S up to 2-isomorphism.

Hansen–Kaletha–Weinstein, Definition 4.3.3 and footnote 4, pp. 28–29, defines the symmetric monoidal 2-category Corr_S of correspondences of decent S-v-stacks fine over S, with proper 2-morphisms up to 2-isomorphism and tensor product the fibre product over S. Lu–Zheng, Remark 2.7 and Lemma 2.9, pp. 13–14, gives the scheme version B_S and the right adjoint of the correspondence attached to a proper morphism.

The API of the definition:

- Composition of correspondences by fibre product (HKW22 (4.3.2)).
- A cohomologically proper p : C → D with α_i : c_i ⇒ d_i ∘ p gives a 2-morphism c ⇒ d.
- X ⊗ Y = X ×_S Y, c ⊗ d = c ×_S d, unit S, symmetric.
- A cohomologically proper q : X → X′ over S gives q♮ = (id_X, q) : X → X′.
- q♮ is right adjointable with right adjoint (q, id_X), unit the relative diagonal and counit q.
- ΩCorr_S is the 1-category of decent v-stacks fine over S with cohomologically proper S-maps up to 2-isomorphism.
- For c : C → X ×_S X, tr(c) = Fix(c) = C ×_(X ×_S X) X when X is dualizable in Corr_S (every object is, with X^∨ = X).

In the sources it enters as follows: CoCorr_S lies over Corr_S (HKW22 Definition 4.3.4, p. 29); tr(c) ∈ ΩCorr_S is the fixed-point correspondence Fix(c) → S (HKW22 §4.3, p. 31); proper p, q give 2-morphisms and right-adjointable 1-morphisms (HKW22 Theorem 4.3.8, p. 32).

*Proof sketch.*

1. Compositions and tensor products stay in Corr_S by VS6.4 and VS6.7, and vertical and horizontal composites and tensor products of 2-morphisms are composites of base changes of cohomologically proper maps, hence cohomologically proper (VS7.7); associativity and unit constraints come from the universal property of fibre products of stacks.
2. Well-definedness of the equivalence relation on 2-morphisms and their compositions uses the strict (2,1)-category structure of v-stacks (HKW22 §4.1, p. 22).
3. For a cohomologically proper q : X → X′ over S, the 1-morphism q♮ = (id, q) : X → X′ is right adjointable, with right adjoint (q, id), unit given by the diagonal X → X ×_(X′) X (a closed immersion since q is separated, hence cohomologically proper) and counit by q itself (the analogue of LZ22 Lemma 2.9).

**Checks.**

- The unit object is S and the identity of X is the correspondence X ← X → X.
- For X a decent S-v-stack, tr(id_X) in ΩCorr_S is the inertia stack In_S(X) = X ×_(X ×_S X) X.
- For S a geometric point, G as in VS10.6 and X = [S/G_S], tr(id_X) = [G_S//G_S], the adjoint quotient.
- An open immersion p : C → D compatible with the legs is not a 2-morphism unless it is also closed (e.g. the inclusion of the open disc into the closed disc is not), since 2-morphisms are proper and the definition of CoCorr_S needs p_* = p_!.

*Needs:* VS6.2; VS6.4; VS6.6; VS6.7; VS6.11; VS7.7; VS8.1.

### 8.7 The symmetric monoidal 2-category of cohomological correspondences

Throughout this subsection, S is a decent v-stack; the exceptional functors are those of VS7.5; proper 2-morphisms are cohomologically proper and use the comparison c_p : Rp_! ≅ Rp_∗ (VS7.7).

CoCorr_S has objects (X, A) with X ∈ Corr_S and A ∈ D_ét(X, Λ); 1-morphisms (X, A) → (X′, A′) are pairs (c, u) with c a correspondence and u : c₁^*A → c₂^!A′, composed as (d′₁)^*c₁^*A → (d′₁)^*c₂^!A′ → (c′₂)^!d₁^*A′ → (c′₂)^!d₂^!A″ (the middle map adjoint to base change); 2-morphisms (c, u) ⇒ (d, v) are the 2-morphisms (p, α₁, α₂) of Corr_S for which the composite d₁^*A → p_*p^*d₁^*A ≅ p_*c₁^*A → p_*c₂^!A′ ≅ p_*p^!d₂^!A′ ≅ p_!p^!d₂^!A′ → d₂^!A′ equals v. The tensor product is (X, A) ⊗ (X′, A′) = (X ×_S X′, A ⊠_S A′) with unit (S, Λ_S), and (c, u) ⊗ (d, v) uses the Künneth map into (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂). The monoidal structure is closed with Hom((X₁, A₁), (X₂, A₂)) = (X₁ ×_S X₂, RHom(pr₁^*A₁, pr₂^!A₂)). Equivalently, CoCorr_S is the Grothendieck construction of the right-lax symmetric monoidal functor Corr_S → Cat^co, X ↦ D_ét(X, Λ), c ↦ c₂!c₁^*. ΩCoCorr_S has objects (X, ω) with X fine over S and ω ∈ H^0(X, K_(X/S)), and morphisms cohomologically proper p with p_∗ω = ω′.

Hansen–Kaletha–Weinstein, Definition 4.3.4, pp. 29–30, defines CoCorr_S with objects (X, A), 1-morphisms (c, u) with u : c₁^*A → c₂^!A′, 2-morphisms given by proper maps compatible with u and v, checks well-definedness, and gives the tensor product and internal Hom. Hansen–Kaletha–Weinstein, §4.3, description of ΩCoCorr_S, p. 31, describes End of the unit as pairs (X, ω) with ω ∈ H^0(X, K_(X/S)) and proper pushforwards. Lu–Zheng, Construction 2.6, Remark 2.7, Lemma 2.8, pp. 13–14, constructs the scheme version, its Grothendieck-construction description and closed monoidal structure.

The API of the construction:

- A 1-morphism (X, A) → (X′, A′) over c is u ∈ Hom(c₁^*A, c₂^!A′).
- Composition through the base change map (d′₁)^*c₂^! → (c′₂)^!d₁^*.
- A 2-morphism of Corr_S whose induced composite carries u to v.
- (X, A) ⊗ (X′, A′) = (X ×_S X′, A ⊠_S A′), unit (S, Λ_S).
- Hom((X₁, A₁), (X₂, A₂)) = (X₁ ×_S X₂, RHom(pr₁^*A₁, pr₂^!A₂)).
- For cohomologically proper q, p with a correspondence C′ → X′ ×_S X′ compatible with c, an endomorphism over c induces a unique endomorphism of (X′, q_∗A) over C′ with p a 2-morphism (VS8.3, the unique lift of Lu–Zheng Lemma 1.11).
- The symmetric monoidal forgetful functor CoCorr_S → Corr_S.
- ΩCoCorr_S has objects (X, ω ∈ H^0(X, K_(X/S))) and morphisms cohomologically proper p with p_∗ω = ω′.

In the sources it enters as follows: dualizable objects of CoCorr_S (HKW22 Proposition 4.3.5, p. 31); the relative Lefschetz–Verdier trace formula is a statement about traces in CoCorr_S (HKW22 Theorem 4.3.8, p. 32); base change CoCorr_S → CoCorr_T is symmetric monoidal (HKW22 Proposition 5.3.1, p. 49); the universal local term is a trace in CoCorr_G (HKW22 Theorem 4.6.1, p. 42).

*Proof sketch.*

1. Composition and its associativity: base change (BC1) and its compatibility with composition (VS7.6).
2. 2-morphisms depend only on the equivalence class of (p, α₁, α₂): the five squares of HKW22 p. 30 commute by VS6.10, by β_i = (id ∗ γ) ∘ α_i with the pseudo-functor structures, and by the compatibility c_q ∘ γ_! = γ_∗ ∘ c_p of the comparison with the 2-morphism γ : p ⇒ q, which need not be an identity (VS7.7).
3. Tensor products: the Künneth isomorphism (c₂ ×_S d₂)_!(B₁ ⊠_S B₂) ≅ c₂!B₁ ⊠_S d₂!B₂ (VS7.6); the target is (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂) (HKW22 Definition 4.3.4, with the target corrected in Corrections to the sources).
4. Closedness: Hom from (X, A) ⊗ (Y, B) to (Z, C) and from (X, A) to (Y ×_S Z, RHom(pr^*B, pr^!C)) agree through RHom(a ⊗ b, c) ≅ RHom(a, RHom(b, c)) and (P5) (the analogue of LZ22 Lemma 2.8).
5. Grothendieck construction: the functor X ↦ D_ét(X, Λ), c ↦ c₂!c₁^*, p ↦ counit, is right-lax symmetric monoidal with Künneth isomorphisms; apply VS8.3 (LZ22 Remark 2.7).

**Checks.**

- For S = Spd C, the endomorphisms of (S, A) over the identity correspondence are End_(D(Λ))(A).
- The unit is (S, Λ_S) and ΩCoCorr_S(S, ω) has ω ∈ H^0(S, Λ).
- The tensor product of (c, u) and (d, v) is a map (c₁ ×_S d₁)^*(A₁ ⊠ A₂) → (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂), with the primed objects in the target.
- For a G-equivariant A on X with action α : X × G → X, the equivariance isomorphism A|_(X×G) → α^*A is in general not a 1-morphism of CoCorr_S over (pr, α), because α^* ≠ α^!: for X = S a geometric point, G = G_m^♢ and Λ ≠ 0, α is the structure map G → S and α^*Λ = Λ while α^!Λ = Λ(1)[2]. When α is étale, as for a finite group G, α^! = α^* and it is a 1-morphism. Working over the base G repairs the general case (VS11.11).
- The forgetful functor to Corr_S is strict symmetric monoidal and identity on 2-morphisms.

*Needs:* VS8.6; VS8.3; VS7.5; VS7.6; VS7.7; VS7.9; VS6.10.

### 8.8 Dualizability in cohomological correspondences

Throughout this subsection, S is a decent v-stack; π : X → S is fine.

For X fine over S and A ∈ D_ét(X, Λ), (X, A) is dualizable in CoCorr_S iff the natural map m : 𝔻_(X/S)A ⊠_S A → RHom(pr₁^*A, pr₂^!A) on X ×_S X is an isomorphism, where 𝔻_(X/S)A = RHom(A, K_(X/S)). Then the dual is (X, 𝔻_(X/S)A), evaluation lies over (Δ_(X/S), π) with Δ^*(𝔻A ⊠ A) ≅ 𝔻A ⊗ A → K_(X/S), and coevaluation lies over (π, Δ_(X/S)) with Λ_X → RHom(A, A) ≅ Δ^!RHom(pr₁^*A, pr₂^!A) followed by m^(-1).

Hansen–Kaletha–Weinstein, Proposition 4.3.5 and proof, p. 31, characterises dualizable objects of CoCorr_S by invertibility of 𝔻A ⊠_S A → RHom(pr₁^*A, pr₂^!A), with explicit evaluation and coevaluation.

*Proof sketch.*

1. The candidate evaluation 𝔢 induces 𝔛′ ⊗ 𝔜 → Hom(𝔛, 𝔜) for every 𝔜; for 𝔜 = 𝔛 it is m (VS8.7, internal Hom).
2. If 𝔛 is dualizable, 𝔛^∨ ⊗ 𝔜 → Hom(𝔛, 𝔜) is an isomorphism for all 𝔜 (VS8.1); 𝔜 = 1 identifies 𝔛^∨ with (X, 𝔻A) and 𝔜 = 𝔛 makes m an isomorphism.
3. Conversely define the coevaluation through (P5) and m^(-1) and check the triangle identities by a diagram chase (HKW22 Proposition 4.3.5).

**Checks.**

- (S, A) is dualizable iff A is perfect (VS8.4).
- (X, Λ_X) for X smooth fine over S is dualizable with dual (X, K_(X/S)).

*Needs:* VS8.7; VS8.1; VS7.9; VS7.6.

### 8.9 Dualizable objects are the universally locally acyclic ones

Throughout this subsection, S is a decent v-stack; π : X → S is fine.

For π : X → S fine and A ∈ D_ét(X, Λ), (X, A) is dualizable in CoCorr_S iff A is π-universally locally acyclic (ULA, in the sense of the base roadmap for Artin v-stacks, VStackSheavesAndLisseCategories §VS1.2 (*ula-for-artin-v-stacks*)). For π representable in nice diamonds this is Fargues–Scholze Theorem IV.2.23; in general ULA-ness and the criterion of VS8.8 are both cohomologically-smooth-local on the source. Duals of ULA objects are ULA and the biduality map is an isomorphism; exterior products over S of ULA objects are ULA.

Hansen–Kaletha–Weinstein, §4.3, paragraph after Proposition 4.3.5, p. 31, states that for maps representable in nice diamonds dualizability in CoCorr_S is ULA-ness (Fargues–Scholze IV.2.24) and that this extends to fine maps of decent v-stacks by smooth locality on the source. Fargues–Scholze, Theorem IV.2.23 and Proposition IV.2.24, pp. 124–126, proves that ULA-ness is equivalent to the Künneth-type isomorphism and to being a left adjoint in the kernel category, and the relative version for proper Y/S. Fargues–Scholze, Proposition IV.2.32, p. 129, characterises ULA objects for smooth maps of Artin v-stacks by an isomorphism p₁^*RHom(A, Λ) ⊗ p₂^*A ≅ RHom(p₁^*A, p₂^*A).

*Proof sketch.*

1. Representable case: the criterion of VS8.8 is condition (ii) of Fargues–Scholze Theorem IV.2.23, equivalent to ULA (VStackSheavesAndLisseCategories §VS1.1 (*ula-dualizability-criterion*)).
2. General fine π: choose a clean chart g : U → X; g^* commutes with both sides of m up to the invertible twist Rg^!Λ (smooth base change, VS7.8) and detects isomorphisms; ULA-ness is defined and detected through charts (VStackSheavesAndLisseCategories §VS1.2 (*ula-for-artin-v-stacks*), VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*)).
3. Duals and exterior products: dual and tensor product of dualizable objects are dualizable (VS8.1), or directly VStackSheavesAndLisseCategories §VS1.1 (sub-target *Relative adjoints and ULA calculus*).

**Checks.**

- Constant sheaves on smooth fine X → S are ULA, hence dualizable.
- On the closed disc over Spd C and for Λ ≠ 0 (for instance Λ = F₃), j_!Λ for the open unit disc j is not ULA over S, so (D, j_!Λ) is not dualizable.
- For Λ = 0 every object is 0, j_!0 is ULA and (D, 0) is dualizable; the nonzero hypothesis in the previous Check is needed.

*Needs:* VS8.8; VStackSheavesAndLisseCategories §VS1.1 (*ula-definition-with-constructibility*); VStackSheavesAndLisseCategories §VS1.2 (*ula-for-artin-v-stacks*); VStackSheavesAndLisseCategories §VS1.1 (*ula-dualizability-criterion*); VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*); VStackSheavesAndLisseCategories §VS1.1 (sub-target *Relative adjoints and ULA calculus*); VStackSheavesAndLisseCategories §VS1.2 (*smooth-ula-criterion*); VS7.8.

### 8.10 The trace class of a cohomological correspondence

Throughout this subsection, S is a decent v-stack; (X, A) is dualizable, i.e. A is ULA over S (VS8.9).

Let (X, A) be dualizable in CoCorr_S and (c, u) an endomorphism with c : C → X ×_S X. Its trace is (Fix(c), tr_c(u, A)) ∈ ΩCoCorr_S, where Fix(c) = C ×_(X ×_S X, Δ) X, with projections Δ′ : Fix(c) → C and c′ : Fix(c) → X (the base changes of Δ and of c), and tr_c(u, A) ∈ H^0(Fix(c), K_(Fix(c)/S)) is the image of u under H^0(C, RHom(c₁^*A, c₂^!A)) ≅ H^0(C, c^!RHom(pr₁^*A, pr₂^!A)) ≅ H^0(C, c^!(𝔻A ⊠_S A)) → H^0(C, c^!Δ_∗(𝔻A ⊗ A)) → H^0(C, c^!Δ_∗K_(X/S)) ≅ H^0(C, Δ′_∗c′^!K_(X/S)) ≅ H^0(Fix(c), K_(Fix(c)/S)), using (P5), the dualizability isomorphism, the evaluation and (BC2).

Hansen–Kaletha–Weinstein, §4.3, pp. 31–32 and footnote 5, describes the trace of an endomorphism of a dualizable object of CoCorr_S as the fixed-point locus with the class tr_c(u, A) ∈ H^0(Fix(c), K_(Fix(c)/S)) given by the displayed chain. Lu–Zheng, Notation 2.20, p. 18, writes the scheme version as the relative Lefschetz–Verdier pairing.

The API of the construction:

- tr_c(u, A) ∈ H^0(Fix(c), K_(Fix(c)/S)).
- (Fix(c), tr_c(u, A)) is the categorical trace of (c, u) in CoCorr_S.
- u ↦ tr_c(u, A) is Λ-linear.
- For an open U ⊂ X with c^(-1)(U × U) → U × U, the class restricts to that of the restricted correspondence on Fix ∩ U.
- For S = X = C with both legs the identity (the identity correspondence of S) and A perfect, tr_c(u, A) = tr(u | A) ∈ H^0(S, Λ), the trace of the endomorphism u of A (VS8.4).

In the sources it enters as follows: traces of endomorphisms lying over correspondences (HKW22 Theorem 4.3.8, p. 32); local terms are restrictions of tr_c(u, A) (HKW22 Definition 4.3.11 and §5.3, pp. 33, 47–48); the universal local term tr_(c̃)(ũ, A|_(X_G)) (HKW22 Theorem 4.6.1, p. 42).

*Proof sketch.*

1. Unwind tr = ev ∘ σ ∘ (f ⊗ id) ∘ coev with the explicit evaluation and coevaluation of VS8.8: the composite of correspondences is Fix(c) → S, and the sheaf-theoretic part is the displayed chain (HKW22 pp. 31–32).
2. Each displayed map is an instance of VS7.6 and the dualizability isomorphism m.

**Checks.**

- For S = X = C = Spd C, A = Λ² and u a 2×2 matrix, tr_c(u, A) is the matrix trace in H^0(S, Λ) = Λ.
- For S = X a geometric point, C = S ⊔ S with both legs the fold map (étale, so c₂^! = c₂^*), A = Λ = F_5 and u = (1, 2) ∈ H^0(C, Λ) = Λ²: Fix(c) = C and tr_c(u, A) = (1, 2) ∈ H^0(C, K_(C/S)) = Λ², whose integral over C is 3. Here u is not an endomorphism of A over S, so the scalar formula needs C = S; for C = S and u = 2 the class is the scalar trace 2.
- For u = 0, tr_c(u, A) = 0.
- For X = T_S with T finite and c the graph of a permutation σ of T, Fix(c) = (T^σ)_S and tr_c(u, Λ) is the function x ↦ tr(u_x) on fixed points.
- For Λ ≠ 0 and A = j_!Λ on the closed disc over Spd C with j the inclusion of the open disc, (X, A) is not dualizable and no trace class is defined; the naive formula fails (HKW22).

*Needs:* VS8.8; VS8.9; VS8.7; VS7.6; VS7.9.

### 8.11 Inertia stacks and characteristic classes

Throughout this subsection, S is a decent v-stack; (X, A) is dualizable in CoCorr_S.

For X fine over S, the inertia stack In_S(X) := X ×_(X ×_S X) X is the fixed-point locus of the identity correspondence; its points are pairs (x, g) with g ∈ Aut(x). For (X, A) dualizable, the characteristic class cc_(X/S)(A) := tr(id_A) ∈ H^0(In_S(X), K_(In_S(X)/S)).

Hansen–Kaletha–Weinstein, Definition 4.3.6, p. 32, defines the inertia stack as tr(Δ_(X/S)) and the characteristic class as tr(id_A). Lu–Zheng, Notation 2.20 and Remark 2.24, pp. 18–20, defines characteristic classes for schemes and notes they live on the inertia stack for Artin stacks.

The API of the definition:

- In_S(X) = X ×_(X ×_S X) X with its projection to X.
- For 0-truncated X, In_S(X) = X.
- In_S(X₁ ×_T X₂) ≅ In_S(X₁) ×_(In_S(T)) In_S(X₂).
- cc_(X/S)(A) ∈ H^0(In_S(X), K_(In_S(X)/S)).
- cc is additive in distinguished triangles of ULA objects.
- For X = S, cc_(S/S)(A) = χ(A), the Euler characteristic of the perfect complex A.

In the sources it enters as follows: characteristic classes push forward along proper maps (HKW22 Corollary 4.3.9, p. 33); the characteristic class of an admissible object on [S/G_S] is its trace distribution (HKW22 Proposition 4.4.3, p. 35); Künneth and universal-local-term properties of characteristic classes (HKW22 Theorem 4.5.3 and Theorem 4.6.1); characteristic classes on [Gr_(G,≤μ)/L^+_mG] compute local terms of Satake sheaves (HKW22 Corollary 5.4.2, p. 50).

*Proof sketch.*

1. In_S(X) is decent and fine over S (VS6.4, VS6.7).
2. cc_(X/S)(A) is the trace class of (Δ_(X/S), id_A) (VS8.10).

**Checks.**

- For S = X = Spd C and A = Λ³ ⊕ Λ[1], cc_(S/S)(A) = 3 − 1 = 2.
- cc_(X/S)(0) = 0.
- For S a geometric point and G a finite group, In_S([S/G]) = [G/G] with conjugation, and, identifying H^0 with class functions on G by counting measure, cc of the trivial representation Λ is the constant function 1.
- For S a geometric point and X = [S/(Z/2)_S], In_S(X) ≠ X: it has two components (the identity and the nontrivial element); for S = ∅ both are empty and In_S(X) = X.
- For X smooth proper over S = Spd C and A = Λ, ∫_X cc_(X/S)(Λ) = χ(RΓ(X, Λ)) (VS9.2 with X′ = S).

*Needs:* VS8.10; VS6.4; VS6.7.

### 8.12 Characteristic classes restrict to open substacks

Throughout this subsection, S is a decent v-stack; i is an open immersion; A is ULA over S.

For an open immersion i : U → X of decent S-v-stacks fine over S, In_S(i) : In_S(U) → In_S(X) is an open immersion; if A ∈ D_ét(X, Λ) is ULA over S then so is i^*A, and cc_(U/S)(i^*A) = In_S(i)^*cc_(X/S)(A).

Hansen–Kaletha–Weinstein, Lemma 4.3.7, p. 32, states that inertia stacks and characteristic classes are compatible with restriction to open substacks.

*Proof sketch.*

1. In_S(U) = In_S(X) ×_X U, an open substack.
2. ULA-ness is local on X (VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*)), and every construction in the trace class is local on X (HKW22 Lemma 4.3.7).

**Checks.**

- For S a geometric point, X = S ⊔ S, A = (Λ², Λ³) and U the first component: In_S(X) = X, cc_(X/S)(A) = (2, 3) and cc_(U/S)(A|_U) = 2, its restriction. An open subset of In_S(X) need not be the inertia of an open substack: for X = [S/(Z/2)], In_S(X) has two components, the one of the nontrivial element is open, but the only open substacks of X are ∅ and X.
- For U = X the statement is trivial.

*Needs:* VS8.11; VS8.9; VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*).

### Examples

- In Mathlib's `FGModuleCat K` over a field K, tr(id_V) = dim_K V.
- In D(Λ), for M = Λ ⊕ Λ[1] and e = id, tr(e) = 1 − 1 = 0.
- For X a decent S-v-stack, tr(id_X) in ΩCorr_S is the inertia stack In_S(X) = X ×_(X ×_S X) X.
- For S a geometric point, G as in VS10.6 and X = [S/G_S], tr(id_X) = [G_S//G_S], the adjoint quotient.
- For S = Spd C, the endomorphisms of (S, A) over the identity correspondence are End_(D(Λ))(A).
- For S = X = C = Spd C, A = Λ² and u a 2×2 matrix, tr_c(u, A) is the matrix trace in H^0(S, Λ) = Λ.
- For X = T_S with T finite and c the graph of a permutation σ of T, Fix(c) = (T^σ)_S and tr_c(u, Λ) is the function x ↦ tr(u_x) on fixed points.
- For S = X = Spd C and A = Λ³ ⊕ Λ[1], cc_(S/S)(A) = 3 − 1 = 2.

### Dependencies

This layer uses this roadmap's VS6, VS7; VStackSheavesAndLisseCategories §VS1.1, §VS1.2; EnhancedDerivedSheaves §E1.4, §E5:abstract.1; PivotalSpherical Layers 2, 7; AdicSpacesPartIII §R3.8; DGAInfinity Layer 5; EtaleCohomologyFoundations §F.10.3; the Mathlib and Tau Ceti declarations named in its *Needs:* lines.

## Layer VS9: the Lefschetz–Verdier trace formula and local terms

Prove the relative Lefschetz–Verdier trace formula for v-stacks (Hansen–Kaletha–Weinstein Theorem 4.3.8): pushforward of a dualizable object along compatible cohomologically proper maps is dualizable and carries the trace of an endomorphism to the trace of the pushed endomorphism. Deduce that characteristic classes commute with cohomologically proper pushforward and the Lefschetz trace formula for proper nice diamonds over Spd C (with the correspondence proper nice over the base).

Define local terms loc_β(u, F) for clopen pieces of the fixed locus cohomologically proper over S and at isolated fixed points, with additivity. Construct base change of cohomological correspondences and diamondification of cohomological correspondences of perfect schemes; prove that local terms commute with base change and agree with the scheme-theoretic local terms of perfect schemes.

### 9.1 The relative Lefschetz–Verdier trace formula for v-stacks

Throughout this subsection, S is a decent v-stack; q : X → X′ and p : C → C′ are cohomologically proper maps over S (VS7.7) compatible with the correspondences.

Let 𝔛 = (X, A) be dualizable in CoCorr_S and 𝔣 ∈ End(𝔛) lie over c : C → X ×_S X. Suppose given cohomologically proper maps q : X → X′ and p : C → C′ over S and a correspondence c′ : C′ → X′ ×_S X′ such that the square formed by c, c′, p and q × q commutes. Then 𝔛′ = (X′, Rq_∗A) is dualizable; there is a unique 𝔣′ ∈ End(𝔛′) lying over C′ such that p defines a 2-morphism p̃ filling the square 𝔮 ∘ 𝔣 ⇒ 𝔣′ ∘ 𝔮 (𝔮 the 1-morphism over q); and there is a unique 2-morphism tr(p̃) : tr(𝔣) ⇒ tr(𝔣′) lying over tr(p) : Fix(c) → Fix(c′). Concretely, the induced cohomologically proper map Fix(c) → Fix(c′) pushes tr_c(u, A) to tr_(c′)(u′, Rq_∗A).

Hansen–Kaletha–Weinstein, Theorem 4.3.8 and proof, pp. 32–33, states and proves the relative Lefschetz–Verdier trace formula in CoCorr_S: dualizability of (X′, q_∗A), the unique pushed endomorphism and the 2-morphism tr(f) ⇒ tr(f′) over tr(p). Lu–Zheng, Theorem 2.21, Corollary 2.22, Proposition 2.23, pp. 18–19, proves the scheme version, of which the v-stack proof is formally the same.

*Proof sketch.*

1. Uniqueness and existence of 𝔣′: lift (c, u) along the 2-morphism given by p (VS8.3, Lu–Zheng Lemma 1.11; VS8.7, the pushed endomorphism).
2. Dualizability of (X′, Rq_∗A): q♮ is right adjointable in Corr_S (VS8.6) and X′ is dualizable in Corr_S, so Lu–Zheng Remark 1.12(b) applies; equivalently (X′, Rq_∗A) has dual (X′, Rq_∗𝔻_(X/S)A) by the internal-Hom argument of Lu–Zheng Proposition 2.23.
3. The two triangles (𝔮 ⊗ (𝔮^!)^∨) ∘ coev_𝔛 ⇒ coev_(𝔛′) and ev_𝔛 ⇒ ev_(𝔛′) ∘ ((𝔮^!)^∨ ⊗ 𝔮) and the square p̃ with the mate on the dual factor paste to tr(p̃) (VS8.2, Lu–Zheng Construction 1.7); uniqueness holds because a 2-morphism of CoCorr_S is a 2-morphism of Corr_S satisfying a condition, hence unique over its image in Corr_S.
4. The concrete form reads off the 2-morphism in ΩCoCorr_S (VS8.7, the description of ΩCoCorr_S).

**Checks.**

- For X′ = C′ = S and q, p the structure maps (X, C cohomologically proper over S) this is the Lefschetz formula, of which VS9.3 is the case of proper nice diamonds over Spd C.
- For c = id and p = q it gives VS9.2.
- For X = P¹_C, X′ = C′ = S and C = ∅, p : ∅ → S yields the square ∅ → X; tr(0 | RΓ(P¹, Λ)) = 0 = ∫_∅.

*Needs:* VS8.7; VS8.6; VS8.2; VS8.3; VS8.10; VS7.7.

### 9.2 Characteristic classes commute with proper pushforward

Throughout this subsection, S is a decent v-stack; p is cohomologically proper; X, X′ are fine over S.

For (X, A) dualizable in CoCorr_S and p : X → X′ cohomologically proper over S, (X′, Rp_!A) is dualizable, In_S(p) : In_S(X) → In_S(X′) is cohomologically proper, and In_S(p)_∗ cc_(X/S)(A) = cc_(X′/S)(Rp_!A).

Hansen–Kaletha–Weinstein, Corollary 4.3.9, p. 33, deduces that characteristic classes commute with proper pushforward and that In_S(p) is proper. In Lu–Zheng, Corollary 2.22, p. 19: the scheme version.

*Proof sketch.*

1. Apply VS9.1 with c = id_X, c′ = id_(X′), q = p and C → C′ equal to p: the pushed endomorphism of (X′, Rp_∗A) is the identity and tr(p) = In_S(p).
2. The map In_S(X) → X ×_(X′) In_S(X′) is a closed immersion, obtained by pulling back the separated diagonal of p, and the projection to In_S(X′) is a base change of p. Thus In_S(p), a closed immersion followed by a base change of p, is cohomologically proper, and Rp_! ≅ Rp_* through c_p (VS7.7).

**Checks.**

- For X′ = S and X cohomologically proper over S = Spd C: ∫_(In_S(X)) cc_(X/S)(A) = χ(RΓ(X, A)).
- For p an isomorphism the statement is the transport of structure.

*Needs:* VS9.1; VS8.11; VS7.7.

### 9.3 The Lefschetz trace formula for proper diamonds

Throughout this subsection, S = Spd C with C algebraically closed perfectoid; q : X → S is proper nice (hence nice, Conventions); A is ULA over S. Y → S is proper nice (this hypothesis is omitted in the source; *Corrections to the sources*).

Let S = Spd C for C algebraically closed perfectoid, q : X → S a proper nice diamond, A ∈ D_ét(X, Λ) ULA over S, and 𝔣 = (c, u) an endomorphism of (X, A) over a fine correspondence c : Y → X ×_S X with Y → S proper nice (equivalently c₁ proper nice, X being proper nice). Then RΓ(X, A) is a perfect complex, q_∗(c, u) is an endomorphism of it, and tr(q_∗(c, u) | RΓ(X, A)) = ∫_(Fix(c)) tr_c(u, A). Its form as a sum of local terms at isolated fixed points is VS9.4.

Hansen–Kaletha–Weinstein, Example 4.3.10, equation (4.3.5), Definition 4.3.11 and the display on p. 34, pp. 33–34, deduces the Lefschetz trace formula for proper nice diamonds over Spd C from Theorem 4.3.8, and writes it as a sum of local terms at isolated fixed points; the hypothesis that the correspondence is proper over S is missing there. In Lu–Zheng, Theorem 2.21, p. 18: the scheme version with both c and d proper over the base.

*Proof sketch.*

1. Apply VS9.1 with X′ = C′ = S, q the structure map and p : Y → S, both proper nice and hence cohomologically proper (VS7.7).
2. Dualizability of (S, q_∗A) means RΓ(X, A) is perfect (VS8.4); its trace is the Euler-characteristic trace.
3. tr(p) : Fix(c) → S, and the 2-morphism says p_∗tr_c(u, A) = tr(q_∗𝔣), i.e. the integral (VS7.9).

**Checks.**

- For X = P¹ over Spd C, A = Λ and g(z) = az with a ∈ C^× ∖ {1}: Fix(g) = {0, ∞}, two reduced S-points, and the integral of the trace class over it is 1 + 1 = 2, while tr(g | RΓ(P¹, Λ)) = 1 + 1 = 2 because g acts identically on H⁰ and H². Here 1 − a ≠ 0 and 1 − a⁻¹ ≠ 0 in every characteristic, including p = 2.
- For g = id on a finite set X = T_S, the formula counts points.
- Properness is needed: for C of characteristic 0, Λ ≠ 0, the closed unit disc D over Spd C (not proper) and g(T) = T + p, Fix(g) = ∅ while tr(g | RΓ(D, Λ)) = 1, since RΓ(D, Λ) = Λ.

*Needs:* VS9.1; VS8.4; VS8.9; VS7.9.

### 9.4 Local terms

Throughout this subsection, S is a decent v-stack; β ⊂ Fix(c) is open and closed and cohomologically proper over S; for the sum formula, S, X, A and the automorphism g are as in VS9.3.

For a correspondence c over S with fixed-point locus Fix(c), an endomorphism (c, u) of a dualizable (X, F), and a clopen β ⊂ Fix(c) cohomologically proper over S with g : β → S, the local term loc_β(u, F) ∈ H^0(S, Λ) is the image of tr_c(u, F) under H^0(Fix(c), K) → H^0(β, Rg^!Λ) ≅ H^0(S, Rg_∗Rg^!Λ) ≅ H^0(S, Rg_!Rg^!Λ) → H^0(S, Λ); for S connected it lies in Λ. For an isolated fixed point x with x → S an isomorphism, loc_x(𝔣) is the restriction of tr_c(u, F) to x; for 𝔣 coming from an automorphism g and u : g^*F → F it is written loc_x(g, F). Local terms are additive: loc_(β₁ ⊔ β₂) = loc_(β₁) + loc_(β₂). In the situation of VS9.3, if 𝔣 comes from an automorphism g of X with u : g^*A → A and Fix(g) consists of finitely many isolated S-points x₁, …, x_n, then tr(g | RΓ(X, A)) = Σ_i loc_(x_i)(g, A).

Hansen–Kaletha–Weinstein, Definition 4.3.11, p. 33, defines the local term at an isolated fixed point x with x → S an isomorphism, and loc_x(g, A) for automorphisms. Hansen–Kaletha–Weinstein, §5.3, pp. 47–48, defines loc_β(u, F) for a clopen β ⊂ Fix(c) proper over S through integration, notes additivity and the trace formula as a sum over π₀(Fix(c)). Hansen–Kaletha–Weinstein, display on p. 34, writes the Lefschetz formula for finitely many isolated fixed points as the sum of the local terms.

The API of the definition:

- loc_β(u, F) ∈ H^0(S, Λ).
- For an isolated fixed S-point x, loc_x is the value of tr_c(u, F) at x.
- loc_(β₁ ⊔ β₂) = loc_(β₁) + loc_(β₂).
- If Fix(c) is cohomologically proper over S with finitely many components, Σ_β loc_β(u, F) = ∫_(Fix(c)) tr_c(u, F).
- Under the hypotheses of VS9.3, for an automorphism g with finitely many isolated fixed S-points x₁, …, x_n, tr(g | RΓ(X, A)) = Σ_i loc_(x_i)(g, A).
- Local terms commute with base change (VS9.6).
- For perfect schemes, local terms agree with the scheme-theoretic ones (VS9.8).

In the sources it enters as follows: the Lefschetz formula as a sum of local terms (HKW22 equation (4.3.5) and p. 34); local terms of Satake sheaves at fixed points of strongly regular elements on the affine Grassmannian (HKW22 Theorem 5.1.3 and Corollary 5.4.2, pp. 45–50); base change and perfect-scheme comparison of local terms (HKW22 Propositions 5.3.1–5.3.2, p. 49); the scheme-theoretic local terms that the v-sheaf local terms extend (EtaleDualityAndPerverseSheaves §6.3 (trace maps and local terms)).

*Proof sketch.*

1. H^0(β, K_(β/S)) is a direct summand of H^0(Fix(c), K_(Fix(c)/S)) since β is clopen; the integration map is VS7.9.
2. Additivity: H^0 of a disjoint union is the product and the counit is additive.
3. For an isolated S-point x, K_(x/S) = Λ and the integral is evaluation.
4. Sum formula: Fix(g) = x₁ ⊔ … ⊔ x_n, so H^0(Fix(g), K_(Fix(g)/S)) = Λⁿ; VS9.3 and additivity identify tr(g | RΓ(X, A)) with the sum of the values at the x_i.

**Checks.**

- For S = Spd C, X = S, c = id and F = Λⁿ, loc_S(id, F) = n.
- loc_∅(u, F) = 0.
- For g(z) = az, where a ∈ C^× ∖ {1}, on P¹ over Spd C and F = Λ, the local terms sum to tr(g | RΓ(P¹, Λ)) = 2; the two tangent multipliers are a and a⁻¹, neither equal to 1.
- For a non-isolated fixed locus (g = id on P¹), there is no pointwise local term: the class lives in H^0(P¹, K) and only its integral χ(P¹) = 2 is a number.
- For X a perfect scheme separated and perfectly of finite type over k, loc_β agrees with the local term of EtaleDualityAndPerverseSheaves §6.3 (trace maps and local terms) after diamondification.

*Needs:* VS8.10; VS7.9; VS7.7; VS9.3.

### 9.5 Base change of cohomological correspondences

Throughout this subsection, S is a decent v-stack; a : T → S is a map of decent v-stacks.

For a map a : T → S of decent v-stacks, base change X ↦ X_T, (c, u) ↦ (c_T, u_T), p ↦ p_T defines a symmetric monoidal functor CoCorr_S → CoCorr_T, where u_T is the image of u under Hom(c₁^*F, c₂^!F) → Hom(a_C^*c₁^*F, a_C^*c₂^!F) → Hom(c₁,T^*a_X^*F, c₂,T^!a_X^*F), using the natural transformation a_C^*Rc₂^! → Rc₂,T^!a_X^* adjoint to proper base change. Fix(c)_T = Fix(c_T), and the induced map H^0(Fix(c), K_(Fix(c)/S)) → H^0(Fix(c)_T, K_(Fix(c)_T/T)) is compatible with H^0(S, Λ) → H^0(T, Λ).

Hansen–Kaletha–Weinstein, §5.3, pp. 48–49, and proof of Proposition 5.3.1, defines the base change u_T of a cohomological correspondence through the natural transformation f̃^*Rg^! → Rg̃^!f^* and uses that base change CoCorr_S → CoCorr_T is symmetric monoidal.

The API of the construction:

- The symmetric monoidal functor a^* : CoCorr_S → CoCorr_T.
- Fix(c_T) = Fix(c)_T.
- a^* preserves dualizable objects and traces (VS8.2).
- (b ∘ a)^* ≅ a^* ∘ b^* coherently.
- The trace class of (c_T, u_T) is the base change of tr_c(u, F).

In the sources it enters as follows: local terms commute with base change (HKW22 Proposition 5.3.1, p. 49); restriction of the universal local term to g ∈ G(S) (HKW22 §4.6, p. 42).

*Proof sketch.*

1. Base change preserves decency and fineness (VS6.4, VS6.7) and cohomological properness (VS7.7).
2. The transformation a_C^*Rc₂^! → Rc₂,T^!a_X^* is the mate of proper base change (VS7.6, BC1); compatibility with composition and tensor products follows from the coherence of base change (HKW22 §5.3, p. 48).
3. Symmetric monoidality: (X ×_S Y)_T = X_T ×_T Y_T and a^*(A ⊠_S B) = a^*A ⊠_T a^*B.

**Checks.**

- For a = id_S, a^* is the identity functor.
- For S = Spd C, T = Spd C′ with C ⊂ C′ algebraically closed, a^* on (S, A) is A ↦ A on D(Λ).
- Base change preserves categorical traces: tr(a^*𝔣) = a^*tr(𝔣).
- Without the mate a_C^*Rc₂^! → Rc₂,T^!a_X^*, the pullback of u is a map a_C^*c₁^*F → a_C^*c₂^!F, which is not a cohomological correspondence over c_T; the mate is needed even though it need not be an isomorphism.

*Needs:* VS8.7; VS7.6; VS6.4; VS6.7.

### 9.6 Local terms commute with base change

Throughout this subsection, S and T are decent v-stacks, and a : T → S is a map; the maps are representable in nice diamonds; F is f-ULA.

Let f : X → S be representable in nice diamonds, c : C → X ×_S X a correspondence representable in nice diamonds with c₁ proper nice, β ⊂ Fix(c) clopen and proper nice over S, F ∈ D_ét(X, Λ) f-ULA with a cohomological correspondence u over c, and a : T → S. Then H^0(S, Λ) → H^0(T, Λ) sends loc_β(u, F) to loc_(β_T)(u_T, F_T); in particular they are equal in Λ when S and T are connected.

Hansen–Kaletha–Weinstein, Proposition 5.3.1 and proof, p. 49, proves local terms commute with arbitrary base change using that base change is symmetric monoidal on cohomological correspondences.

*Proof sketch.*

1. Reduce to a map H^0(Fix(c), K_(Fix(c)/S)) → H^0(Fix(c)_T, K_(Fix(c)_T/T)) compatible with H^0(S, Λ) → H^0(T, Λ) and sending tr_c(u, F) to tr_(c_T)(u_T, F_T): apply H^0 to K_(Fix(c)/S) → Ra_∗a^*K_(Fix(c)/S) → Ra_∗K_(Fix(c)_T/T).
2. The trace classes match because base change CoCorr_S → CoCorr_T is symmetric monoidal (VS9.5) and symmetric monoidal functors preserve duals and traces (VS8.2).
3. Integration over β commutes with base change by proper base change for g : β → S.

**Checks.**

- For T → S the inclusion of a geometric point, the local terms over S are determined by those at geometric points.
- For a = id the statement is trivial.

*Needs:* VS9.5; VS9.4; VS8.2; VS8.9.

### 9.7 Diamondification of cohomological correspondences of perfect schemes

Throughout this subsection, k is a perfect field of characteristic p.

For a perfect field k of characteristic p and the category PSch^ft_k of perfect schemes separated and perfectly of finite type over k, X ↦ X^♢ ((Spec R)^♢(A, A⁺) = Hom_k(R, A)) commutes with finite limits, carries separated perfectly finite type maps to maps representable in locally spatial diamonds, compactifiable of finite dim.trg, and the fully faithful symmetric monoidal c_X^* : D_ét(X, Λ) → D_ét(X^♢, Λ) with comparisons c^*RHom → RHom(c^*, c^*) and c^*Rf^! → Rf^(♢!)c^* turns a scheme cohomological correspondence (c, u) into (c^♢, u^♢) with Fix(c)^♢ = Fix(c^♢); this is a symmetric monoidal functor from scheme cohomological correspondences over Spec k to CoCorr_(Spd k).

Hansen–Kaletha–Weinstein, §5.3, discussion before Proposition 5.3.2, p. 49, introduces (−)^♢ on perfect schemes, the fully faithful comparison c_X^* of Sch17 §27 with its RHom and Rf^! comparisons, and the induced correspondence u^♢.

The API of the construction:

- The symmetric monoidal functor (c, u) ↦ (c^♢, u^♢).
- Fix(c)^♢ = Fix(c^♢).
- c_X^* carries f-ULA objects to f^♢-ULA objects.
- The trace class of (c^♢, u^♢) is the image of the scheme trace class.

In the sources it enters as follows: comparison of scheme and v-sheaf local terms (HKW22 Proposition 5.3.2, p. 49); degeneration of local terms on the affine Grassmannian to the Witt-vector affine Grassmannian (HKW22 §5.5–5.6).

*Proof sketch.*

1. (−)^♢ commutes with finite limits and has the stated representability (AdicCoefficientsAndComparisons L1 (*L1/char-p-scheme-diamond-and-comparison-functor*)).
2. c_X^* is fully faithful and symmetric monoidal, compatible with f^* and Rf_! (AdicCoefficientsAndComparisons L3 (*L3/full-faithfulness-27-2*), *L3/rf-shriek-comparison-27-4*, *L3/commutation-and-adjoints-27-1-27-3*), and the comparisons for RHom and Rf^! are the adjoint transformations (L3/internal-Hom-right-adjoint).
3. u^♢ is the image of u under Hom(c₁^*F, Rc₂^!F) → Hom(c_C^*c₁^*F, c_C^*Rc₂^!F) → Hom(c₁^(♢*)c_X^*F, Rc₂^(♢!)c_X^*F); compatibility with composition and tensor products follows from the compatibility of c^* with base change (HKW22 §5.3, p. 49).

**Checks.**

- For X = Spec k the functor is the identity on (Spec k, A) ↦ (Spd k, A).
- For X the perfection of A¹_k and c the graph of x ↦ x + 1, Fix(c) = ∅ (char p) and Fix(c^♢) = ∅.
- Hom_(CoCorr)((X, F), (X, F)) over a correspondence c injects into the corresponding Hom over c^♢, by full faithfulness of c^*.
- For a non-separated perfect scheme (the line with doubled origin) the correspondence category of PSch^ft_k does not contain it, and the representability statement used for c₂^♢ fails.
- For Λ = F_ℓ[t], ℓ ≠ p, the coefficient condition nΛ = 0 holds with n = ℓ; gap:vs-pii-scheme-correspondences is required, since §6.2’s finite-ring range does not contain Λ.

*Needs:* AdicCoefficientsAndComparisons L1 (*L1/char-p-scheme-diamond-and-comparison-functor*); AdicCoefficientsAndComparisons L1 (*L1/comparison-pullback*); AdicCoefficientsAndComparisons L3 (*L3/full-faithfulness-27-2*); AdicCoefficientsAndComparisons L3 (*L3/rf-shriek-comparison-27-4*); AdicCoefficientsAndComparisons L3 (*L3/commutation-and-adjoints-27-1-27-3*); AdicCoefficientsAndComparisons L3 (*L3/internal-Hom-right-adjoint*); EtaleDualityAndPerverseSheaves §6.1 (scheme correspondences and fixed schemes); EtaleDualityAndPerverseSheaves §6.2 (cohomological correspondences and composition); VS8.7; gap:vs-pii-scheme-correspondences.

The general-coefficient scheme correspondence interface is required by gap:vs-pii-scheme-correspondences; the supplied finite-ring bounded constructible finite-Tor instance uses EtaleDualityAndPerverseSheaves §6.2.

### 9.8 Local terms of perfect schemes agree with those of their v-sheaves

Throughout this subsection, k is a perfect field of characteristic p; c₁ : C → X and f ∘ c′ : Fix(c) → Spec k are perfectly proper, c′ : Fix(c) → X being the projection (Conventions); F is f-ULA. The scheme-theoretic local term is that of EtaleDualityAndPerverseSheaves §6.3 for the finite-type models, with the general coefficient extension specified in gap:vs-pii-scheme-local-terms, after base change to an algebraic closure of k.

Let k be perfect, X ∈ PSch^ft_k with f : X → Spec k, c : C → X ×_k X a correspondence in PSch^ft_k with c₁ : C → X and f ∘ c′ : Fix(c) → Spec k perfectly proper, where c′ : Fix(c) → X is the projection from Fix(c) = C ×_(X ×_k X) X (so Fix(c), and with it every clopen β ⊂ Fix(c), is perfectly proper over k, as the local terms of VS9.4 require), F ∈ D_ét(X, Λ) f-ULA with a cohomological correspondence u over c, and β ⊂ Fix(c) clopen. Then c_X^*F is f^♢-ULA and loc_β(u, F) = loc_(β^♢)(u^♢, c_X^*F) in Λ.

Hansen–Kaletha–Weinstein, Proposition 5.3.2 and proof, pp. 49–50, proves that local terms of perfect schemes agree with those of their associated v-sheaves, by the symmetric monoidality of diamondification on cohomological correspondences.

*Proof sketch.*

1. Reduce to k algebraically closed by base change of local terms on both sides (VS9.6 and the scheme analogue, EtaleDualityAndPerverseSheaves §6.2, pullback of cohomological correspondences along morphisms of correspondences); perfect schemes perfectly of finite type are perfections of schemes of finite type, with the same étale sites, so §6.3’s trace maps apply (SchemeAndStackFoundations §0.24 (`perfection_universalHomeomorphism`) and §0.23a (étale topological invariance)).
2. Diamondification is symmetric monoidal on cohomological correspondences (VS9.7), hence preserves dualizable objects and traces (VS8.2); ULA-ness is preserved in particular.
3. Integration over β commutes with c^* because c^* is compatible with Rf_! (proper support comparison).

**Checks.**

- For X = Spec k and c = id, both sides are the Euler characteristic of F.
- The two properness hypotheses are independent: for X the perfection of A¹_k and c = id, c₁ = id is perfectly proper but Fix(c) = X ×_(X ×_k X) X = X is not proper over k, so f ∘ c′ = f is not perfectly proper and the local term of β = X is not defined; for X = Spec k and c = id, f ∘ c′ = id and both hold.
- For Frobenius correspondences on perfect varieties, the v-sheaf local terms recover the scheme local terms.
- For X = Spec k and Λ = F_ℓ[t], the two traces of id on Λ[0] are 1; deriving their scheme trace comparison requires gap:vs-pii-scheme-local-terms.

*Needs:* VS9.7; VS9.4; VS9.6; VS8.2; EtaleDualityAndPerverseSheaves §6.3 (trace maps and local terms); EtaleDualityAndPerverseSheaves §6.2 (pullback along morphisms of correspondences and restriction to open subschemes); AdicCoefficientsAndComparisons L3 (*L3/rf-shriek-comparison-27-4*); SchemeAndStackFoundations §0.24 (`perfection_universalHomeomorphism`) and §0.23a (étale topological invariance); gap:vs-pii-scheme-correspondences; gap:vs-pii-scheme-local-terms.

The general-coefficient scheme correspondence and f-ULA local-term interfaces are required by gap:vs-pii-scheme-correspondences and gap:vs-pii-scheme-local-terms; the supplied finite-ring bounded constructible finite-Tor instance uses EtaleDualityAndPerverseSheaves §§6.2–6.3.

### Examples

- For S = Spd C, X = S, c = id and F = Λⁿ, loc_S(id, F) = n.
- For g(z) = az, where a ∈ C^× ∖ {1}, on P¹ over Spd C and F = Λ, the local terms sum to tr(g | RΓ(P¹, Λ)) = 2; the two tangent multipliers are a and a⁻¹, neither equal to 1.
- For S = Spd C, T = Spd C′ with C ⊂ C′ algebraically closed, a^* on (S, A) is A ↦ A on D(Λ).
- For X the perfection of A¹_k and c the graph of x ↦ x + 1, Fix(c) = ∅ (char p) and Fix(c^♢) = ∅.

### Dependencies

This layer uses this roadmap's VS6, VS7, VS8; EtaleDualityAndPerverseSheaves §6.1, §6.2, §6.3; AdicCoefficientsAndComparisons Layers L1, L3; SchemeAndStackFoundations §0.23a, §0.24; the supplier gaps gap:vs-pii-scheme-correspondences, gap:vs-pii-scheme-local-terms.

## Layer VS10: locally profinite sets and classifying stacks

Define smooth and complete modules over C(T, Λ) for a locally profinite set T and prove that they are equivalent to each other and to sheaves of modules on T. Define distributions Dist(T, Λ) and the module Haar(G, Λ) of Haar measures of a locally profinite group.

The layer proves that, for a geometric point S, D_ét(T_S, Λ) is the derived category of smooth C(T, Λ)-modules with explicit four operations and H^0(T_S, f^!Λ) = Dist(T, Λ); for G locally pro-p (closed in GL_n(E)), [S/G_S] is decent, the point q has q^*, Rq_*, Rq_!, Rq^! equal to forgetting, smooth induction, compact induction and Hom_G(C_c(G, Λ), −) with Rq^!Λ = Haar(G, Λ); for H ⊂ G closed, [S/H_S] → [S/G_S] realises restriction, smooth and compact induction; [S/G_S] → S is fine and smooth with Rf_* group cohomology, Rf_! twisted group homology and K = Haar(G, Λ)^∗; [T_S/G_S] is decent and fine with H^0 of its dualizing complex the Haar-twisted invariant distributions.

### 10.1 Smooth and complete modules over locally constant functions

Throughout this subsection, T is a locally profinite set (Hausdorff, locally compact, totally disconnected); Λ is a discrete commutative ring.

Let C(T, Λ) be the ring of locally constant functions T → Λ and C_c(T, Λ) the ideal of those with compact support; for a compact open U ⊂ T, 1_U is its characteristic function, multiplication by 1_U is a unital ring map C(T, Λ) → C(U, Λ), and 1_U·M ≅ C(U, Λ) ⊗_(C(T,Λ)) M is a C(U, Λ)-module and, through that map, a C(T, Λ)-module. A C(T, Λ)-module M is smooth if M ⊗_(C(T,Λ)) C_c(T, Λ) → M is an isomorphism, equivalently colim_U 1_U·M → M is an isomorphism over compact opens U ordered by inclusion (every m equals 1_U·m for some compact open U); M is complete if M → lim_U 1_U·M is an isomorphism, with transition maps multiplication by 1_V. The functors M^s := colim_U 1_U·M and M^c := lim_U 1_U·M are projectors onto smooth and complete modules and restrict to mutually inverse equivalences between them.

Hansen–Kaletha–Weinstein, Appendix B.2, Definition B.2.1, Lemmas B.2.2–B.2.3, pp. 73–74, defines smooth and complete C(S, Λ)-modules for a locally profinite set S, the projectors M ↦ M^s, M ↦ M^c, and the equivalence between the two categories.

The API of the definition:

- M is smooth iff every m ∈ M satisfies 1_U • m = m for some compact open U ⊆ T.
- The set of m ∈ M fixed by some 1_U; as a submodule it is the smooth part M^s = colim_U 1_U·M.
- Smooth vectors are closed under addition (use 1_(U ∪ V)), and under scalars, so they form a submodule.
- M is smooth iff every vector is smooth.
- M^c = lim_U 1_U·M with projections given by multiplication by idempotents.
- M ↦ M^c and M ↦ M^s are inverse equivalences between smooth and complete C(T, Λ)-modules; (M^s)^s = M^s and (M^c)^c = M^c.
- M is smooth iff M ⊗_(C(T,Λ)) C_c(T, Λ) → M is an isomorphism.
- If T is compact, every C(T, Λ)-module is smooth.

In the sources it enters as follows: D_ét(T_S, Λ) is the derived category of smooth C(T, Λ)-modules; f_* sends M to M^c and f^! to RHom(C_c(T,Λ), M)^s (HKW22 Example 4.2.1, p. 25); G-equivariant smooth C(T, Λ)-modules describe sheaves on [T_S/G_S] (HKW22 Example 4.2.5 and equation (4.2.1), p. 27).

*Proof sketch.*

1. 1_U·M is both a submodule of colim_U 1_U·M and of lim_U 1_U·M, and equals 1_U applied to either (HKW22 Lemma B.2.2): the transition maps are inclusions, respectively projections, compatible with multiplication by idempotents.
2. Hence (M^s)^s = M^s and (M^c)^c = M^c, and (M^s)^c ≅ M^c, (M^c)^s ≅ M^s (HKW22 Lemma B.2.3).

**Checks.**

- For T a finite discrete set, every C(T, Λ)-module is smooth (and complete).
- For T empty, C(T, Λ) = 0 and the only module is 0, which is smooth.
- For T = ℕ discrete and Λ = ℤ, the regular module C(ℕ, ℤ) = ℤ^ℕ is not smooth: the constant function 1 is not 1_U·1 for any finite U.
- C_c(T, Λ) is a smooth C(T, Λ)-module for every locally profinite T.
- For T = ℕ, the smooth vectors of Λ^ℕ are the finitely supported sequences, Λ^((ℕ)) = C_c(ℕ, Λ).

*Needs:* Mathlib `LocallyConstant`; Mathlib `LocallyConstant.charFn`; Mathlib `TopologicalSpace.CompactOpens`; SmoothRepresentationsOfLocalGroups §SR.1.1 (*locally-constant-compact-support*).

### 10.2 Sheaves on a locally profinite set as smooth modules

Throughout this subsection, T is a locally profinite set (Hausdorff, locally compact, totally disconnected); Λ is a discrete commutative ring.

Let R be the sheaf of rings U ↦ C(U, Λ) on T. For an R-module sheaf F and compact open U, restriction F(T) → F(U) is surjective, restricts to an isomorphism 1_U·F(T) ≅ F(U), and F(T) = lim_U F(U). The functors M ↦ F_M (F_M(U) = 1_U·M) and F ↦ M^s_F = colim_U F(U) (respectively M^c_F = lim_U F(U)) are mutually inverse equivalences between smooth (respectively complete) C(T, Λ)-modules and R-module sheaves on T, compatible with the equivalence of VS10.1, and F_M(T) = M^c. In particular sheaves of Λ-modules on T are smooth C(T, Λ)-modules, the constant sheaf Λ corresponding to C_c(T, Λ).

Hansen–Kaletha–Weinstein, Appendix B.2, Lemmas B.2.4–B.2.5, p. 74, shows restriction to compact opens is surjective with 1_U·F(S) ≅ F(U), F(S) = lim F(U), and that smooth or complete modules are equivalent to R-module sheaves with F_M(S) = M^c.

The API of the construction:

- For an R-module sheaf F and a compact open U ⊂ T, restriction F(T) → F(U) is surjective, its kernel is (1 − 1_U)·F(T), and it induces an isomorphism 1_U·F(T) ≅ F(U).
- For an R-module sheaf F, F(T) = lim_U F(U) over compact opens U ordered by inclusion, with restrictions as transition maps.
- For a smooth C(T, Λ)-module M, the assignment U ↦ 1_U·M on compact opens U, with multiplication by 1_V as restriction to V ⊂ U, extends uniquely to an R-module sheaf F_M on T.
- The compactly supported sections colim_U F_M(U) of F_M are M, and its global sections F_M(T) are M^c.
- F ↦ colim_U F(U) and M ↦ F_M are mutually inverse equivalences between R-module sheaves on T and smooth C(T, Λ)-modules; F ↦ F(T) and M ↦ F_M are mutually inverse equivalences between R-module sheaves and complete C(T, Λ)-modules; the two are intertwined by M ↦ M^c and M ↦ M^s of VS10.1.
- R is the constant sheaf Λ on T, so R-module sheaves are the sheaves of Λ-modules on T; the constant sheaf Λ corresponds to the smooth module C_c(T, Λ) and to the complete module C(T, Λ).
- If T is compact, compactly supported and global sections agree, and F ↦ F(T) is an equivalence with all C(T, Λ)-modules.

*Proof sketch.*

1. Compact opens form a basis closed under finite unions and intersections, so sheaves on T are sheaves on that basis.
2. A compact open U is clopen, so T = U ⊔ (T ∖ U) and F(T) = F(U) × F(T ∖ U); 1_U acts as the projection, giving surjectivity and 1_U·F(T) ≅ F(U) (HKW22 Lemma B.2.4).
3. The sheaf condition along the cover by compact opens gives F(T) = lim_U F(U); combine with VS10.1 to get the two equivalences (HKW22 Lemma B.2.5).

**Checks.**

- For T finite discrete, sheaves are Λ^T-modules.
- The constant sheaf Λ corresponds to the smooth module C_c(T, Λ), with global sections C(T, Λ) = C_c(T, Λ)^c.
- For T = {a, b}, Λ = F₃ and M = 1_a·M ⊕ 1_b·M with 1_a·M = F₃² and 1_b·M = F₃, the sheaf F_M has F_M({a}) of dimension 2, F_M({b}) of dimension 1 and F_M(T) = M of dimension 3 = 2 + 1, as the sheaf condition on the cover {a} ⊔ {b} requires. The model that gives every compact open U the whole module M would assign dimension 3 to each point and violate that condition.
- For T = ℕ, Λ ≠ 0 and the constant sheaf Λ, the compactly supported sections are Λ^(ℕ) and the global sections are Λ^ℕ. The all-ones sequence is a global section that is not compactly supported, and it is not a smooth vector of Λ^ℕ (VS10.1), so the inverse to M ↦ F_M on smooth modules is F ↦ colim_U F(U), not F ↦ F(T); on complete modules the inverse is F ↦ F(T) = Λ^ℕ = C(ℕ, Λ).
- For T empty, C(T, Λ) = 0, the only module is 0 and the only sheaf is 0, so both equivalences are between zero categories.
- For T = Z_p (compact) and the constant sheaf Λ, the compactly supported and the global sections are both C(Z_p, Λ), and M^s = M^c = M for every C(Z_p, Λ)-module M.

*Needs:* VS10.1; Mathlib `TopologicalSpace.CompactOpens`.

### 10.3 Distributions on a locally profinite set

Throughout this subsection, T is a locally profinite set (Hausdorff, locally compact, totally disconnected); Λ is a discrete commutative ring.

The Λ-module of Λ-valued distributions on T is Dist(T, Λ) := Hom_Λ(C_c(T, Λ), Λ). It is a C(T, Λ)-module by (φ·μ)(h) = μ(φh); its smooth part is the module of distributions supported on compact sets; for a group G acting continuously on T, G acts by translation and Dist(T, Λ)^G is the module of invariant distributions.

Hansen–Kaletha–Weinstein, Example 4.2.1, p. 25, identifies H^0(T_S, f^!Λ) with Dist(T, Λ), the module of Λ-valued distributions on T. Hansen–Kaletha–Weinstein, Example 4.2.5 and equation (4.2.1), p. 27, interprets H^0 of the dualizing complex of [T_S/G_S] as invariant distributions with values in Haar(G, Λ)^∗.

The API of the definition:

- Dist(T, Λ) = Hom_Λ(C_c(T, Λ), Λ).
- The Dirac distribution δ_x(h) = h(x).
- Distributions correspond to finitely additive Λ-valued functions on compact open subsets.
- Dist(T, Λ) is a C(T, Λ)-module by (φ·μ)(h) = μ(φh).
- A continuous action of G on T induces an action on Dist(T, Λ); the invariants Dist(T, Λ)^G are the invariant distributions.
- A proper map T → T′ induces Dist(T, Λ) → Dist(T′, Λ) by μ ↦ μ ∘ pullback.

In the sources it enters as follows: H^0(T_S, f^!Λ) ≅ Dist(T, Λ) (HKW22 Example 4.2.1, p. 25); trace distributions are G-invariant distributions on G twisted by Haar measures (HKW22 §4.4, equation (4.4.1), p. 35); the exceptional pullback for a profinite quotient is a sheaf of distributions (DiamondSixOperations §S5.4).

*Proof sketch.*

1. Dist(T, Λ) is the algebraic Λ-dual of the smooth module C_c(T, Λ) (VS10.1).
2. C_c(T, Λ) is spanned by the 1_U·a for compact open U and a ∈ Λ (SmoothRepresentationsOfLocalGroups §SR.1.1 (*locally-constant-compact-support*)), so a distribution is a finitely additive Λ-valued function on compact opens.

**Checks.**

- For T = Fin 3 discrete, Dist(T, Λ) ≅ Λ³ with basis the Dirac masses.
- For T empty, Dist(T, Λ) = 0.
- For G = Z_p and p ∈ Λ^×, the normalised Haar measure of SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*) is a Z_p-invariant element of Dist(Z_p, Λ).
- For T = Z_p and Λ = F_ℓ (ℓ ≠ p), the Haar distribution is not of the form h ↦ Σ_x a_x h(x) for finitely many Dirac masses, so Dist(T, Λ) is strictly larger than the span of Dirac masses.

*Needs:* VS10.1; SmoothRepresentationsOfLocalGroups §SR.1.1 (*locally-constant-compact-support*); Mathlib `Module.Dual`.

### 10.4 Operations on a constant locally profinite diamond

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). T is a locally profinite set (Hausdorff, locally compact, totally disconnected); Λ is a discrete commutative ring.

For S a geometric point, T locally profinite and f : T_S = T × S → S, the map f is representable in nice diamonds and D_ét(T_S, Λ) is equivalent to the derived category of smooth C(T, Λ)-modules, the constant sheaf Λ corresponding to C_c(T, Λ). Under this identification f^*M = C_c(T, Λ) ⊗_Λ M, Rf_*M is the derived functor of M ↦ M^c, Rf_!M is the underlying Λ-module of M, and Rf^!M = RHom_Λ(C_c(T, Λ), M)^s; in particular H^0(T_S, Rf^!Λ) ≅ Dist(T, Λ).

Hansen–Kaletha–Weinstein, Example 4.2.1, p. 25, identifies D_ét(T_S, Λ) with the derived category of smooth C(T, Λ)-modules and computes the four operations of T_S → S, with H^0(T_S, f^!Λ) = Dist(T, Λ).

*Proof sketch.*

1. T_S → S is representable in nice diamonds: T_S is locally a proper diamond of dim.trg 0 over S (DiamondsAndVStacks §D4.6 (*compact-hausdorff-diamonds*), DiamondSixOperations §S1.3).
2. T_S has locally cohomological dimension zero, so D_ét(T_S, Λ) = D(T_(S,ét), Λ), and the étale site of T_S is the site of the topological space T (DiamondSixOperations §S1.3); apply VS10.2.
3. f^* is the constant sheaf functor; Rf_* is global sections, M ↦ M^c by HKW22 Lemma B.2.5; Rf_! is compactly supported sections, colim over compact opens of F(U) = M^s = M.
4. Rf^! is the right adjoint of Rf_!: Hom_Λ(N, M) = Hom_(C(T,Λ))(N, Hom_Λ(C_c(T, Λ), M)) for smooth N, and maps from a smooth module land in the smooth part; at M = Λ, H^0 = Hom_Λ(C_c(T, Λ), Λ) = Dist(T, Λ) (VS10.3).

**Checks.**

- For T finite discrete, D_ét(T_S, Λ) is the category of families (M_t)_(t ∈ T) of objects of D(Λ); f^*M = (M)_(t ∈ T), Rf^!M = (M)_(t ∈ T), Rf_!(M_t) = ⊕_t M_t and Rf_*(M_t) = ∏_t M_t, the finite sum and product agreeing. For T = {a, b} and Λ = F_3, f^*Λ = (Λ, Λ) and Rf_!f^*Λ = Λ² has dimension 2, not 1, so the functors are not identities; they are identities only for T a point, and for T empty f^* lands in the zero category and Rf_!, Rf_* give 0.
- For T = Z_p, Rf^!Λ is the sheaf of distributions of DiamondSixOperations §S5.4.

*Needs:* VS10.2; VS10.3; DiamondsAndVStacks §D4.6 (*compact-hausdorff-diamonds*); DiamondSixOperations §S1.3; DiamondSixOperations §S2.3; DiamondSixOperations §S3.1; DiamondSixOperations §S5.4; VS6.5.

### 10.5 The module of Haar measures

Throughout this subsection, G is a locally profinite group; Λ is a commutative ring.

Use the Λ-valued left Haar measures of SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*), finitely additive left-invariant functions on compact open subsets, as the carrier of Haar(G, Λ), for a locally profinite group G and a commutative ring Λ. Equip it with its Λ-module structure and identify it with Hom_G(C_c(G, Λ), Λ). Fix right translation by (g·μ)(E) = μ(Eg). If G has a compact open subgroup of pro-order invertible in Λ, this module is free of rank one, with generator normalised on that subgroup, its action has character χ_G(g) = δ_G(g)⁻¹ valued in Λ^× (Conventions), and its dual is Haar(G, Λ)^∗.

Hansen–Kaletha–Weinstein, Example 4.2.2, p. 26, identifies q^!Λ for the point of [S/G_S] with Haar(G, Λ), the module of left-invariant Haar measures. Hansen–Kaletha–Weinstein, Example 4.2.4, p. 27, and equation (4.4.1), p. 35, uses Haar(G, Λ)^∗ as the relative dualizing complex of [S/G_S] → S, with G acting on Haar(G, Λ) by the modular character.

The API of the construction:

- If G has a compact open subgroup of pro-order invertible in Λ, Haar(G, Λ) is free of rank one, generated by the measure with value 1 on that subgroup.
- If G has a compact open subgroup of pro-order invertible in Λ, right translation by g acts on Haar(G, Λ) by χ_G(g) = δ_G(g)⁻¹ in Λ^×.
- Haar(G, Λ) ⊂ Dist(G, Λ)^G.

In the sources it enters as follows: q^!Λ = Haar(G, Λ) and K_([S/G_S]/S) = Haar(G, Λ)^∗ (HKW22 Examples 4.2.2 and 4.2.4, pp. 26–27); the dual of an admissible object is Haar(G, Λ)^∗ ⊗ M^∨ (HKW22 Proposition 4.4.1, p. 34); trace distributions take values on C_c(G, Λ) ⊗ Haar(G, Λ) (HKW22 equation (4.4.1), p. 35).

*Proof sketch.*

1. A left-invariant distribution is determined by its values on translates of a compact open subgroup U₀; finite additivity and invariance give μ(gU) = [U₀ : U]^(-1) μ(U₀) for U ≤ U₀ when [U₀ : U] is invertible (SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*), existence and uniqueness of the normalised measure).
2. Right translation by g carries a left Haar measure to a left Haar measure, so it multiplies the generator μ with μ(K) = 1, K a compact open subgroup of invertible pro-order, by the scalar χ_G(g) = μ(Kg)/μ(K), by uniqueness of the normalised measure (SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*)); χ_G is multiplicative, and χ_G(g) = δ_G(g)⁻¹ with δ_G the index ratio of the Conventions. For G a parabolic subgroup P = M ⋉ N of a reductive group it is δ_P⁻¹ with δ_P of SmoothRepresentationsOfLocalGroups §SR.2.2 (*modulus-character*).

**Checks.**

- For G = Z/3 and Λ = Z[1/3], Haar(G, Λ) is free of rank one generated by counting measure.
- For G = Z_p and Λ = F_ℓ (ℓ ≠ p), Haar(G, Λ) is free of rank one, generated by μ with μ(Z_p) = 1 and μ(p^nZ_p) = p^(-n).
- For G = Z_p and Λ = F_p, Haar(G, Λ) = 0: the invertibility hypothesis cannot be dropped.
- For G the group of upper triangular matrices [[a, b], [0, 1]] in GL₂(Q_p), right translation by diag(p, 1) acts on Haar(G, Λ) by the scalar |p|⁻¹ = p under (g·μ)(E) = μ(Eg); for p = 2 and Λ = F_5 this scalar is 2 ≠ 1.

*Needs:* SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*); SmoothRepresentationsOfLocalGroups §SR.1.1 (*locally-constant-compact-support*); SmoothRepresentationsOfLocalGroups §SR.2.2 (*modulus-character*); SmoothRepresentationsOfLocalGroups §SR.0.3 (*unit-pro-order*); VS10.3.

### 10.6 Classifying stacks of locally pro-p groups are decent

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). G is a locally pro-p group admitting a free action on a separated locally spatial diamond X with a strictly surjective cohomologically smooth map X → S (for instance G closed in GL_n(E) for E finite over Q_p or F_p((t)), with X = GL_(n,E)^♢ × S).

For G as in HKW22 Example 4.2.2 and S a geometric point, the classifying v-stack [S/G_S] is decent with chart X/G_S → [S/G_S], the quotient q : S → [S/G_S] is representable in nice diamonds, and for every closed subgroup H ⊂ G the map [S/H_S] → [S/G_S] is representable in nice diamonds and [S/H_S] is decent.

Hansen–Kaletha–Weinstein, Example 4.2.2 and footnote 3, pp. 25–26, states that [S/G_S] is decent with chart X/G_S → [S/G_S] for a free G_S-action on a separated locally spatial diamond smooth over S, satisfied for G closed in GL_n(E). Hansen–Kaletha–Weinstein, Example 4.2.3, p. 26, states that [S/H_S] is decent and [S/H_S] → [S/G_S] representable in nice diamonds for H closed in G.

*Proof sketch.*

1. Diagonal: S ×_([S/G_S]) S ≅ G_S, and more generally the diagonal of [S/G_S] has fibres G-torsors, which are locally separated locally spatial diamonds (VS6.9).
2. Chart: X → X/G_S is a G_S-torsor, so X/G_S ×_([S/G_S]) S ≅ X, which is strictly surjective and cohomologically smooth over S; hence X/G_S → [S/G_S] is a chart.
3. q is a G_S-torsor, representable in nice diamonds; for H closed, [S/H_S] → [S/G_S] has fibres (G/H)_S, constant locally profinite diamonds (VS10.4).

**Checks.**

- For G = GL_n(Z_p), [S/G_S] is decent.
- For G = Q_p^× ⊂ GL₁(Q_p), [S/G_S] is decent.

*Needs:* VS6.9; VS6.2; VS6.5; VS10.4; DiamondSixOperations §S5.4.

### 10.7 The four operations of the point of a classifying stack

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). G is a locally pro-p group admitting a free action on a separated locally spatial diamond X with a strictly surjective cohomologically smooth map X → S (for instance G closed in GL_n(E) for E finite over Q_p or F_p((t)), with X = GL_(n,E)^♢ × S).

For q : S → [S/G_S], q^* identifies D_ét([S/G_S], Λ) with the derived category of smooth G-representations on Λ-modules (VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*)), the action of g ∈ G on q^*M coming from the 2-morphism α_g : q ⇒ q. Under it: q^*M is M with the action forgotten; Rq_*M = C(G, M)^(G-sm) (smooth induction from the trivial group); Rq_!M = C_c(G, Λ) ⊗ M (compact induction); Rq^!M = Hom_G(C_c(G, Λ), M); in particular Rq^!Λ = Haar(G, Λ).

Hansen–Kaletha–Weinstein, Example 4.2.2, pp. 25–26, computes q^*, Rq_*, Rq_!, Rq^! for the point of [S/G_S] in terms of smooth representations, with Rq^!Λ = Haar(G, Λ). Fargues–Scholze, Theorem V.1.1, p. 168, identifies D_ét([∗/G], Λ) with the derived category of smooth representations for locally pro-p G, the same after base change to Spa C.

*Proof sketch.*

1. q^* is the base roadmap's equivalence (Fargues–Scholze Theorem V.1.1) with g acting via α_g (VS6.10).
2. Rq_* is the right adjoint of restriction to the trivial group, i.e. smooth induction (SmoothRepresentationsOfLocalGroups §SR.2.1 (*smooth-induction*), SmoothRepresentationsOfLocalGroups §SR.2.1 (*frobenius-reciprocity*)).
3. Rq_!: base change along q (BC1) identifies q^*Rq_!M with the compactly supported sections of the constant sheaf on G_S, i.e. C_c(G, M) (VS10.4); this is compact induction from the trivial group (SmoothRepresentationsOfLocalGroups §SR.2.1 (*compact-induction*)).
4. Rq^! is the right adjoint of compact induction: Hom_G(C_c(G, Λ), M); at M = Λ it is Haar(G, Λ) (VS10.5).

**Checks.**

- For G finite, Rq_* = Rq_! = Λ[G] ⊗ − and Rq^! = q^* up to Haar(G, Λ) ≅ Λ.
- For G = Z_p and M = Λ, Rq_*Λ = C(Z_p, Λ) and Rq^!Λ = Haar(Z_p, Λ).

*Needs:* VS10.6; VS10.4; VS10.5; VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*); VS6.10; VS7.6; SmoothRepresentationsOfLocalGroups §SR.2.1 (*smooth-induction*); SmoothRepresentationsOfLocalGroups §SR.2.1 (*compact-induction*); SmoothRepresentationsOfLocalGroups §SR.2.1 (*frobenius-reciprocity*).

### 10.8 Restriction, induction and compact induction as operations

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). G is a locally pro-p group admitting a free action on a separated locally spatial diamond X with a strictly surjective cohomologically smooth map X → S (for instance G closed in GL_n(E) for E finite over Q_p or F_p((t)), with X = GL_(n,E)^♢ × S). H ⊂ G is a closed subgroup.

For H ⊂ G closed and q : [S/H_S] → [S/G_S]: q^* is restriction from G to H, Rq_* is smooth induction Ind_H^G, Rq_! is compact induction c-Ind_H^G; Rq^! equals restriction when H is open, and Rq^!M = Hom_(H′)(C_c(H′, Λ), M)^(H-sm) when G = H × H′.

Hansen–Kaletha–Weinstein, Example 4.2.3, p. 26, computes q^*, Rq_*, Rq_! as restriction, smooth and compact induction for [S/H_S] → [S/G_S], and Rq^! for H open or a direct factor.

*Proof sketch.*

1. Underlying modules: q_H^*q^* = q_G^* and α_h = id_q ∗ β_h, so q^* is restriction (VS6.10); Rq_* is its right adjoint, smooth induction.
2. Rq_!: base change along q_G gives the descent of M along G → G/H as compactly supported H-equivariant functions, i.e. c-Ind_H^G M, with the G-action identified through the compatibility of base change with α_g (VS10.4, SmoothRepresentationsOfLocalGroups §SR.2.1 (*compact-induction*)).
3. H open: q is étale, Rq^! = q^*. Direct factor: c-Ind_H^G M ≅ M ⊠ C_c(H′, Λ), whose right adjoint is the stated smooth part of Hom_(H′)(C_c(H′, Λ), −).

**Checks.**

- For H = 1 the statements reduce to VS10.7.
- For G = H × H′ with H′ finite, Rq^!M = M as an H-representation (Haar(H′) ≅ Λ).

*Needs:* VS10.7; VS10.6; SmoothRepresentationsOfLocalGroups §SR.2.1 (*smooth-induction*); SmoothRepresentationsOfLocalGroups §SR.2.1 (*compact-induction*); SmoothRepresentationsOfLocalGroups §SR.2.1 (*frobenius-reciprocity*); VS6.10.

### 10.9 The structure map of a classifying stack

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). G is a locally pro-p group admitting a free action on a separated locally spatial diamond X with a strictly surjective cohomologically smooth map X → S (for instance G closed in GL_n(E) for E finite over Q_p or F_p((t)), with X = GL_(n,E)^♢ × S).

f : [S/G_S] → S is fine and ℓ-cohomologically smooth; under VS10.7, f^*M is M with trivial action, Rf_*M is the derived G-invariants RΓ(G, M) supplied by VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*) (smooth group cohomology), Rf_!M = (M ⊗ Haar(G, Λ))_G is derived coinvariants (group homology twisted by Haar measures), Rf^!M = Haar(G, Λ)^∗ ⊗ M with trivial action twisted by the dual Haar character, and K_([S/G_S]/S) = Haar(G, Λ)^∗.

Hansen–Kaletha–Weinstein, Example 4.2.4, p. 27, shows [S/G_S] → S is fine and cohomologically smooth and computes f^*, Rf_*, Rf_!, Rf^!, with K = Haar(G, Λ)^∗.

*Proof sketch.*

1. Fine and smooth: the chart X/G_S → [S/G_S] composed with f is X/G_S → S. For a compact open pro-p subgroup K, X/K_S → S is cohomologically smooth (DiamondSixOperations §S5.4, K having pro-order prime to ℓ), and X/K_S → X/G_S is étale and surjective (its base change to X is X × G/K → X), so X/G_S → S is smooth; the square with the chart witnesses smoothness of f (VS6.8).
2. Rf_* is right adjoint to f^*, the trivial-representation functor: derived invariants (SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-invariants*)).
3. Smoothness gives Rf^!M ≅ f^*M ⊗ Rf^!Λ with Rf^!Λ invertible (VS7.8). Since f ∘ q = id, M ≅ Rq^!Rf^!M ≅ Rq^!(f^*M ⊗ Rf^!Λ) ≅ Rq^!(f^*M) ⊗ q^*Rf^!Λ (VS7.10) ≅ Haar(G, Λ) ⊗ M ⊗ q^*Rf^!Λ (VS10.7, for the trivial representation M); with M = Λ this gives q^*Rf^!Λ ≅ Haar(G, Λ)^∗, so Rf^!M = Haar(G, Λ)^∗ ⊗ M.
4. Rf_! is the left adjoint of Rf^!, i.e. derived coinvariants of the Haar twist.

**Checks.**

- For G finite of order invertible in Λ, Rf_* = Rf_! = (−)^G.
- For G = Z_p and M = Λ, Rf_*Λ = Λ in degree 0 (p invertible) and K = Haar(Z_p, Λ)^∗ ≅ Λ.

*Needs:* VS10.7; VS10.5; VS6.8; VS7.8; VS7.9; VS7.10; SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-invariants*); DiamondSixOperations §S5.4; VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*).

### 10.10 Quotients of locally profinite sets by locally pro-p groups

Throughout this subsection, S = Spd C for an algebraically closed perfectoid field C, or S = Spd k for an algebraically closed discrete field k of characteristic p; D_ét(S, Λ) is identified with D(Λ). G is a locally pro-p group admitting a free action on a separated locally spatial diamond X with a strictly surjective cohomologically smooth map X → S (for instance G closed in GL_n(E) for E finite over Q_p or F_p((t)), with X = GL_(n,E)^♢ × S). T is a locally profinite set (Hausdorff, locally compact, totally disconnected); Λ is a discrete commutative ring. G acts continuously on T.

For T locally profinite with a continuous G-action, [T_S/G_S] is decent and fine over S (not cohomologically smooth in general); D_ét([T_S/G_S], Λ) is the derived category of G-equivariant smooth C(T, Λ)-modules; and there is a natural isomorphism H^0([T_S/G_S], K_([T_S/G_S]/S)) ≅ Hom_G(C_c(T, Λ) ⊗ Haar(G, Λ), Λ), the G-invariant distributions on T with values in Haar(G, Λ)^∗, G acting on C_c(T, Λ) by (g·h)(t) = h(g⁻¹·t) and on Haar(G, Λ) by χ_G. If moreover χ_G = 1 (for instance G unimodular) and μ is a generator of the free rank-one Λ-module Haar(G, Λ) (VS10.5; for instance the measure with μ(K) = 1 on a compact open pro-p subgroup K), then D ↦ (h ↦ D(h ⊗ μ)) is an isomorphism from Hom_G(C_c(T, Λ) ⊗ Haar(G, Λ), Λ) onto Dist(T, Λ)^G. A Haar measure that is nonzero but does not generate Haar(G, Λ) does not give an isomorphism in general (Corrections to the sources).

Hansen–Kaletha–Weinstein, Example 4.2.5 and equation (4.2.1), p. 27, shows [T_S/G_S] is decent and fine over S, describes its sheaves as G-equivariant smooth modules and computes H^0 of its dualizing complex as invariant distributions twisted by Haar measures.

*Proof sketch.*

1. [T_S/G_S] → [S/G_S] is representable in nice diamonds (base change along q is T_S → S), so [T_S/G_S] is decent and fine over S by VS6.7 and VS10.6.
2. Descend VS10.2 along T_S → [T_S/G_S]: sheaves on the quotient are G-equivariant smooth modules.
3. K_([T_S/G_S]/S) = r^!K_([S/G_S]/S) for r : [T_S/G_S] → [S/G_S]; combine VS10.4 with VS10.9 and take G-invariants.
4. Untwisting: G acts on Haar(G, Λ) through χ_G, so when χ_G = 1 and μ generates Haar(G, Λ), a ↦ aμ is a G-equivariant isomorphism Λ → Haar(G, Λ); hence h ↦ h ⊗ μ is a G-equivariant isomorphism C_c(T, Λ) → C_c(T, Λ) ⊗ Haar(G, Λ), and Hom_G(C_c(T, Λ), Λ) = Dist(T, Λ)^G. Replacing μ by uμ with u ∈ Λ^× multiplies the isomorphism by u.

**Checks.**

- For T = G with the conjugation action g·x = gxg⁻¹, so that (g·h)(x) = h(g⁻¹xg), H^0 is Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ), the home of trace distributions (VS11.3).
- For T a point, H^0 = Haar(G, Λ)^∗ invariants.
- The untwisting needs a generator, not merely a nonzero Haar measure. Take G = 1, T a point, p = 2 and Λ = Z/9 (so 9Λ = 0 with 9 prime to p), and let μ₀ be counting measure, the generator with μ₀(G) = 1. Both Hom_G(C_c(T, Λ) ⊗ Haar(G, Λ), Λ) and Dist(T, Λ)^G are Λ, coordinatised by D ↦ D(1 ⊗ μ₀) and by evaluation at the point. The generator μ₀ gives a ↦ a, a unit multiple uμ₀ gives a ↦ ua, a bijection, while the nonzero Haar measure μ = 3μ₀ gives a ↦ 3a, whose image and kernel are both {0, 3, 6}.

*Needs:* VS10.6; VS10.2; VS10.4; VS10.9; VS10.3; VS10.5; VS6.7; VS7.9.

### Examples

- For T a finite discrete set, every C(T, Λ)-module is smooth (and complete).
- For T = Fin 3 discrete, Dist(T, Λ) ≅ Λ³ with basis the Dirac masses.
- For G = Z/3 and Λ = Z[1/3], Haar(G, Λ) is free of rank one generated by counting measure.
- For G = Z_p and Λ = F_ℓ (ℓ ≠ p), Haar(G, Λ) is free of rank one, generated by μ with μ(Z_p) = 1 and μ(p^nZ_p) = p^(-n).

### Dependencies

This layer uses this roadmap's VS6, VS7; VStackSheavesAndLisseCategories §VS4.2; DiamondSixOperations §S1.3, §S2.3, §S3.1, §S5.4; DiamondsAndVStacks §D4.6; SmoothRepresentationsOfLocalGroups §SR.0.3, §SR.0d.2, §SR.1.1, §SR.2.1, §SR.2.2; the Mathlib declarations named in its *Needs:* lines.

## Layer VS11: characteristic classes on classifying and quotient stacks

For G locally pro-p, prove that on [S/G_S] dualizability, ULA-ness and perfectness of all pro-p invariants coincide (admissible objects), identify In_S([S/G_S]) with [G_S//G_S], define the trace distribution of an admissible object and prove that it is its characteristic class.

Construct the modified Künneth map and based cohomological correspondences BCoCorr_S with fibre products over a base, and prove their functoriality and monoidality; prove that the characteristic class of (T, Λ_T) trivialises K_(In_S(T)/S) for T with smooth structure map and diagonal, and the Künneth formula for characteristic classes over such T. For a cohomologically smooth group diamond G acting on a nice diamond X, identify In_S([X/G]) with [Fix(c)/G], construct the universal local term in CoCorr_G, prove that the characteristic class on [X/G] is the universal local term (Theorem 4.6.1), and that over a conjugation-invariant open on which the fixed locus is étale it is the function (x, g) ↦ loc_x(g, A).

### 11.1 Admissible objects on classifying stacks

Throughout this subsection, S is a geometric point (Spd C or Spd k); G is a locally pro-p group as in HKW22 Example 4.2.2 (e.g. closed in GL_n(E)); D_ét([S/G_S], Λ) is the derived category of smooth G-representations.

For M ∈ D_ét([S/G_S], Λ) the following are equivalent: (1) ([S/G_S], M) is dualizable in CoCorr_S, with dual ([S/G_S], 𝔻M), 𝔻M = Haar(G, Λ)^∗ ⊗ M^∨, where M^∨ is the derived smooth dual supplied by VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*); (2) M is ULA over S; (3) for every compact open pro-p subgroup K ⊂ G the derived invariants M^K form a perfect complex of Λ-modules. Condition (3) is admissibility in SmoothRepresentationsOfLocalGroups §SR.0d.2 (derived-smooth-dual); the target here identifies it with geometric ULA-ness and dualizability.

Hansen–Kaletha–Weinstein, Proposition 4.4.1 and proof, pp. 34–35; Definition 4.4.2, p. 35, proves the equivalence of dualizability, ULA-ness and perfectness of pro-p invariants on [S/G_S], with dual Haar(G, Λ)^∗ ⊗ M^∨, sketches a direct proof of (3) ⇒ (1) through the integration map, and calls such M admissible. In Fargues–Scholze, Theorem V.7.1, p. 183; Corollary V.1.4, p. 170; Proposition IV.2.32, p. 129: the Bun_G version of the admissibility criterion, the identification of RHom(−, Λ) with derived smooth duality, and the ULA criterion for smooth maps of Artin v-stacks.

*Proof sketch.*

1. (1) ⇔ (2): VS8.9, since [S/G_S] → S is fine and smooth.
2. The Verdier dual is RHom(M, f^!Λ) with f^!Λ = Haar(G, Λ)^∗ (VS10.9), and the derived smooth dual is identified under VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*) (Fargues–Scholze Corollary V.1.4; SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-smooth-dual*)).
3. (2) ⇔ (3): adapt Fargues–Scholze's proof of Theorem V.7.1 from Bun_G to [S/G_S], as HKW22 indicate: by Fargues–Scholze Proposition IV.2.32, ULA-ness is the isomorphism p₁^*RHom(M, Λ) ⊗ p₂^*M ≅ RHom(p₁^*M, p₂^*M) on [S/G_S] ×_S [S/G_S] = [S/(G × G)_S]. Test it against the compact generators c-Ind_(K×K)^(G×G)Λ, K pro-p open (SmoothRepresentationsOfLocalGroups §SR.0d.2 (*compact-generation*)): the left side gives (M^∨)^K ⊗ M^K = RHom(M^K, Λ) ⊗ M^K (invariants of pro-p groups are exact, and 𝔻(V)^K ≅ RHom(V^K, Λ) by SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-smooth-dual*)), the right side gives Hom(M_K, M^K) = RHom(M^K, M^K) (coinvariants equal invariants for pro-p K), so the comparison at level K is the map of VS8.4 (b), an isomorphism iff M^K is perfect. The base roadmap proves the Bun_G case (VStackSheavesAndLisseCategories §VS5.2 (sub-target *Torsion ULA and perfect invariants*)).
4. Direct proof of (3) ⇒ (1): the coevaluation over (f, Δ_f) is the G × G-equivariant integration map I : C_c(G, Λ) ⊗ Haar(G, Λ) → H^0(M ⊗ M^∨), I(h ⊗ μ) = ∫ h(g) g dμ(g), which factors through End(M^K) for K small; the explicit description of Δ_f^! uses VS10.8 (use compact induction from ΔG ⊂ G × G and its adjunction, with (G × G)/ΔG ≅ G via (g,h) ↦ gh⁻¹).

**Checks.**

- A smooth representation M placed in degree 0 whose invariants M^K are finite projective Λ-modules for all open pro-p K is admissible.
- For Λ ≠ 0, the regular representation C_c(G, Λ) of a noncompact G is not admissible: its K-invariants are not finitely generated. For G = Q₂ (p = 2) and Λ = F₃, C_c(Q₂, F₃)^(Z₂) is the direct sum of copies of F₃ indexed by Q₂/Z₂.
- For Λ = 0 every smooth representation is 0, hence admissible with dual 0; the nonzero hypothesis in the previous Check is needed.

*Needs:* VS8.9; VS8.8; VS8.4; VS10.9; VS10.8; VS10.5; VStackSheavesAndLisseCategories §VS1.2 (*smooth-ula-criterion*); VStackSheavesAndLisseCategories §VS5.2 (sub-target *Torsion ULA and perfect invariants*); SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-smooth-dual*); SmoothRepresentationsOfLocalGroups §SR.0d.2 (*compact-generation*); SmoothRepresentationsOfLocalGroups §SR.0d.2 (*derived-invariants*); VStackSheavesAndLisseCategories §VS4.2 (*classifying-stack-equivalence*).

### 11.2 The inertia stack of a classifying stack

Throughout this subsection, S is a geometric point (Spd C or Spd k); G is a locally pro-p group as in HKW22 Example 4.2.2 (e.g. closed in GL_n(E)); D_ét([S/G_S], Λ) is the derived category of smooth G-representations.

In_S([S/G_S]) ≅ [G_S//G_S], the quotient of G_S by conjugation: a Y-point is a right G_S-torsor P → Y with an automorphism a of P commuting with the right G-action; writing a(y) = y·φ(y), the map φ : P → G satisfies φ(y·g) = g⁻¹φ(y)g, so it is equivariant for the right conjugation action x·g = g⁻¹xg, which is the left conjugation action g·x = gxg⁻¹ converted by the rule of VS6.9. Combined with VS10.10 for the conjugation action this gives H^0(In_S([S/G_S]), K_(In_S([S/G_S])/S)) ≅ Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ), with G acting on C_c(G, Λ) through conjugation, (g·h)(x) = h(g⁻¹xg), and on Haar(G, Λ) by χ_G (Conventions).

Hansen–Kaletha–Weinstein, §4.4, p. 35, identifies the inertia stack of [S/G_S] with the stack of conjugacy classes [G_S//G_S] and its H^0 of the dualizing complex with Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ) via Example 4.2.5.

*Proof sketch.*

1. Unwind In_S(X) = X ×_(X ×_S X) X for X = [S/G_S] through VS6.9: an automorphism a of a right torsor commuting with the right action is a(y) = y·φ(y) for a unique φ : P → G, and a(y·g) = a(y)·g reads y·g·φ(y·g) = y·φ(y)·g, i.e. φ(y·g) = g⁻¹φ(y)g.
2. [G_S//G_S] = [T_S/G_S] for T = G with the conjugation action; apply VS10.10.

**Checks.**

- For G finite, In_S([S/G]) = ⊔ over conjugacy classes of [S/Z_G(g)].
- For G abelian, In_S([S/G_S]) = G_S × [S/G_S].
- Orientation (permutations composed right to left): for G = S₃, P = G the trivial right torsor and a left multiplication by c = (12), which commutes with right multiplication, φ(y) = y⁻¹cy. At y = g = (123), φ(g) = (13) = g⁻¹φ(1)g, whereas the left-torsor formula gφ(1)g⁻¹ would give (23); abelian groups cannot distinguish the two.

*Needs:* VS8.11; VS6.9; VS10.10; VS10.6.

### 11.3 Trace distributions of admissible objects

Throughout this subsection, S is a geometric point (Spd C or Spd k); G is a locally pro-p group as in HKW22 Example 4.2.2 (e.g. closed in GL_n(E)); D_ét([S/G_S], Λ) is the derived category of smooth G-representations. M is admissible (VS11.1).

For M admissible on [S/G_S], h ∈ C_c(G, Λ) and μ ∈ Haar(G, Λ), the operator I_(h,μ)(v) = ∫_G h(g) g v dμ(g) on M factors through the perfect complex M^K for K pro-p open with h bi-K-invariant; the trace distribution tr.dist(M) ∈ Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ) sends h ⊗ μ to the Euler-characteristic trace of I_(h,μ) on M^K, independent of K. G acts on C_c(G, Λ) through conjugation, (g·h)(x) = h(g⁻¹xg), and on Haar(G, Λ) by χ_G (Conventions), and tr.dist(M) is invariant: tr.dist(M)(g·h ⊗ g·μ) = tr.dist(M)(h ⊗ μ).

Hansen–Kaletha–Weinstein, §4.4, equation (4.4.1), p. 35; proof of Proposition 4.4.1, pp. 34–35, defines the trace distribution of an admissible object as h ⊗ μ ↦ Euler characteristic of I_(h,μ), which factors through the perfect complex M^K.

The API of the definition:

- tr.dist(M) ∈ Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ).
- tr.dist(M)(h ⊗ μ) = tr(I_(h,μ) | M^K) for K pro-p with h bi-K-invariant.
- tr.dist is additive in distinguished triangles of admissible objects.
- tr.dist(M) is invariant under conjugation twisted by χ_G: tr.dist(M)(g·h ⊗ g·μ) = tr.dist(M)(h ⊗ μ) for (g·h)(x) = h(g⁻¹xg) and g·μ = χ_G(g)μ.
- tr.dist(M[1]) = −tr.dist(M).
- tr.dist(M) = cc_([S/G_S]/S)(M) (VS11.4).

In the sources it enters as follows: trace distributions are characteristic classes (HKW22 Proposition 4.4.3, p. 35); trace distributions of ρ ∈ Rep G_b(F) and of RΓ(G, b, μ)[ρ] enter the Kottwitz conjecture through the transfer T^(G_b→G)_(b,μ) (HKW22 §6, pp. 62–68).

*Proof sketch.*

1. For K pro-p, M^K is a direct summand of M via averaging with a normalised Haar measure (SmoothRepresentationsOfLocalGroups §SR.0.3 (*averaging-projector*)).
2. Integration against h dμ is the action of the Hecke algebra (SmoothRepresentationsOfLocalGroups §SR.1.1 (*integration*), SmoothRepresentationsOfLocalGroups §SR.1.1 (*convolution-algebra*)); for bi-K-invariant h it preserves M^K and is zero on its complement.
3. Independence of K: for K′ ⊂ K, the trace on M^(K′) equals that on M^K since I_(h,μ) has image in M^K (cyclicity of traces, VS8.1).
4. Invariance: since (g·μ)(E) = μ(Eg) = μ(g⁻¹Eg) by left invariance, g·μ is the push-forward of μ along x ↦ gxg⁻¹, and the substitution x = gyg⁻¹ in I_(g·h, g·μ) gives I_(g·h, g·μ) = g ∘ I_(h,μ) ∘ g⁻¹ on M; conjugate operators have the same trace on M^(gKg⁻¹) and M^K.

**Checks.**

- For G = Z/2, Λ = F_3 (with p ≠ 3), M the sign representation and μ counting measure, tr.dist(M)(1_({1}) ⊗ μ) = 1 and tr.dist(M)(1_({σ}) ⊗ μ) = −1.
- tr.dist(0) = 0.
- For G = Z_p, M = Λ trivial and μ normalised on Z_p, tr.dist(Λ)(h ⊗ μ) = ∫ h dμ.
- For G = Q_p, Λ ≠ 0 and M = C_c(Q_p, Λ), M^K is not finitely generated for K = Z_p, so M is not admissible and has no trace distribution. For Λ = 0, M = 0 is admissible with trace distribution 0, consistent with tr.dist(0) = 0.
- tr.dist(Λ[1]) = −tr.dist(Λ) for G compact.
- For the affine group {(a, b)} over ℚ₂ of the Conventions (p = 2), Λ = F_5, M = Λ trivial, K a compact open pro-2 subgroup, μ normalised by μ(K) = 1, h = 1_K and g = diag(2, 1) (so χ_G(g) = 2 and g·1_K = 1_(gKg⁻¹)): tr.dist(Λ)(g·h ⊗ g·μ) = 2·μ(gKg⁻¹) = 2·μ(Kg⁻¹) = 2·2⁻¹ = 2·3 = 1 = tr.dist(Λ)(h ⊗ μ); with the other direction (g·h)(x) = h(gxg⁻¹) the value would be 2·μ(Kg) = 2·2 = 4 ≠ 1 in F_5, so only the stated direction makes tr.dist invariant.

*Needs:* VS11.1; VS10.5; VS8.4; SmoothRepresentationsOfLocalGroups §SR.0.3 (*averaging-projector*); SmoothRepresentationsOfLocalGroups §SR.1.1 (*integration*); SmoothRepresentationsOfLocalGroups §SR.1.1 (*convolution-algebra*); SmoothRepresentationsOfLocalGroups §SR.0.3 (*compact-open-invariants*).

### 11.4 The characteristic class of an admissible object is its trace distribution

Throughout this subsection, S is a geometric point (Spd C or Spd k); G is a locally pro-p group as in HKW22 Example 4.2.2 (e.g. closed in GL_n(E)); D_ét([S/G_S], Λ) is the derived category of smooth G-representations. M is admissible.

For M admissible on [S/G_S], under the identification of VS11.2, cc_([S/G_S]/S)(M) = tr.dist(M).

Hansen–Kaletha–Weinstein, Proposition 4.4.3 and proof, pp. 35–36, proves that the characteristic class of an admissible object on [S/G_S] equals its trace distribution through a commutative diagram comparing evaluation and coevaluation.

*Proof sketch.*

1. cc(M) = ev ∘ coev applied to id_M (VS8.11).
2. Under H^0(RHom(M, M)) ≅ End_G(M), H^0(Δ_f^!(𝔻M ⊠ M)) ≅ Hom_(G×G)(C_c(G, Λ) ⊗ Haar(G, Λ), M^∨ ⊠ M) and H^0(K_(In)) ≅ Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ), coevaluation sends id to the integration map I and evaluation sends I to h ⊗ μ ↦ tr(I_(h,μ)) (HKW22 proof of Proposition 4.4.3, using the explicit coevaluation of VS11.1).

**Checks.**

- For G finite, cc(M) is the character of M.
- For M = Λ and G compact pro-p, cc(Λ) is the Haar distribution.

*Needs:* VS11.3; VS11.2; VS11.1; VS8.11; VS8.8.

### 11.5 The modified Künneth map

Throughout this subsection, S is a decent v-stack; U → T is cohomologically smooth; f₁, f₂ are fine.

Let U → T be a cohomologically smooth map of decent S-v-stacks and f_i : Y_i → X_i (i = 1, 2) fine maps fitting in 2-commutative squares over U → T, with f : Y₁ ×_U Y₂ → X₁ ×_T X₂ and g : Y₁ ×_U Y₂ → U. For A_i ∈ D_ét(X_i, Λ), κ_(U/T) : f₁^!A₁ ⊠_U f₂^!A₂ → f^!(A₁ ⊠_T A₂) ⊗ g^*K_(U/T) is the composite of (Δ′_(U/T))^*(f₁^!A₁ ⊠_T f₂^!A₂), the Künneth map into (Δ′)^*(f₁ ×_T f₂)^!(A₁ ⊠_T A₂), the identification g^*(Δ_(U/T))^!Λ ⊗ g^*K_(U/T) ≅ Λ of Lemma 4.1.11, the map (Δ′)^* ⊗ (Δ′)^!Λ → (Δ′)^! of (4.1.2), and (Δ′)^!(f₁ ×_T f₂)^! = f^!. For X₁ = X₂ = T = S it is κ_(U/S) : K_(Y₁/S) ⊠_U K_(Y₂/S) → K_(Y₁×_UY₂/S) ⊗ g^*K_(U/S).

Hansen–Kaletha–Weinstein, Definition 4.5.1 and equation (4.5.1), pp. 36–37, defines the modified Künneth map through base change along the relative diagonal of U over T and Lemma 4.1.11.

The API of the construction:

- κ_(U/T) : f₁^!A₁ ⊠_U f₂^!A₂ → f^!(A₁ ⊠_T A₂) ⊗ g^*K_(U/T).
- For U = T, κ is the Künneth map of VS7.6.
- κ is compatible with composition of the squares, up to the canonical isomorphisms K_(U′/T) ≅ K_(U′/U) ⊗ K_(U/T).
- For X_i = T = S: K_(Y₁/S) ⊠_U K_(Y₂/S) → K_(Y₁×_UY₂/S) ⊗ g^*K_(U/S).

In the sources it enters as follows: the Künneth pairing of sections of dualizing complexes over In_S(T) (HKW22 equation (4.5.2), p. 38); the fibre product of morphisms of based cohomological correspondences (HKW22 equation (4.5.7), p. 40).

*Proof sketch.*

1. The Cartesian square Y₁ ×_U Y₂ → Y₁ ×_T Y₂ over Δ_(U/T) : U → U ×_T U identifies ⊠_U with (Δ′)^* of ⊠_T.
2. Each displayed map is an instance of VS7.6 (Künneth), VS7.11 and the natural transformation (4.1.2) (VS7.8).

**Checks.**

- For U = T = S and f_i = id, κ is the identity of A₁ ⊠_S A₂.
- For S = T = Spd C, U = [S/G_S] with G = Z_p and Y_i = U, κ_(U/S) : K_(U/S) ⊗ K_(U/S) → K_(U/S) ⊗ K_(U/S) is an isomorphism of free rank-one twists by Haar(Z_p, Λ)^∗.
- The twist by g^*K_(U/T) cannot be dropped from the target of κ. Take S = T = X₁ = X₂ = Spd C, U = Y₁ = Y₂ the perfectoid closed unit ball over T (cohomologically smooth of dimension one, K_(U/T) ≅ Λ(1)[2]), f_i the structure maps (so f : U → T and g = id_U) and A₁ = A₂ = Λ ≠ 0. The source f₁^!A₁ ⊠_U f₂^!A₂ is Λ(2)[4], while the untwisted object f^!(A₁ ⊠_T A₂) is Λ(1)[2]: at a geometric stalk H^(−4) is Λ against 0 and H^(−2) is 0 against Λ, so the two are not isomorphic. The zero map between them exists, so what fails without the twist is an isomorphism, not the existence of a map. With the twist both sides are Λ(2)[4], and κ_(U/T) is an isomorphism.
- For U = T, κ agrees with the Künneth map used to define tensor products in CoCorr_S.

*Needs:* VS7.6; VS7.11; VS7.8; VS7.9.

### 11.6 Canonical trivialisation over the inertia of a smooth base

Throughout this subsection, S is a decent v-stack; π and Δ_(T/S) are cohomologically smooth.

If T is a decent S-v-stack whose structure map π : T → S and diagonal Δ_(T/S) are both cohomologically smooth (e.g. T = [S/G] for a cohomologically smooth locally spatial group diamond G), then (T, Λ_T) is dualizable in CoCorr_S, In_S(T) → S is cohomologically smooth, and cc_(T/S)(Λ_T), viewed as a map Λ_(In_S(T)) → K_(In_S(T)/S), is an isomorphism.

Hansen–Kaletha–Weinstein, Lemma 4.5.2 and proof, pp. 37–38, with the preceding diagram, proves dualizability of (T, Λ_T) and that its characteristic class canonically trivialises K_(In_S(T)/S) when π and Δ_(T/S) are smooth.

*Proof sketch.*

1. In_S(T) is a base change of Δ_(T/S), so smooth over T and hence over S.
2. The coevaluation map π^*Λ ≅ Δ^!pr₁^!π^*Λ ≅ Δ^!pr₂^*π^!Λ is an isomorphism by smoothness of π (VS7.8); the evaluation Δ^*pr₂^*K_(T/S) → π^!Λ is an isomorphism with no hypotheses.
3. cc_(T/S)(Λ_T) = h^*Δ^!pr₂^*K ≅ h^!Δ^*pr₂^*K ≅ h^!K_(T/S) ≅ K_(In_S(T)/S), the middle isomorphism by smooth base change for the smooth Δ (HKW22 Lemma 4.5.2).

**Checks.**

- For T = [S/G] with G finite étale, In_S(T) is a finite union of classifying stacks and K is trivial.
- For T = S, the statement is cc_(S/S)(Λ) = 1.

*Needs:* VS8.11; VS8.8; VS7.8; VS6.8.

### 11.7 Based cohomological correspondences

Throughout this subsection, S is a decent v-stack.

BCoCorr_S has objects (X → T, A, B) with X → T a fine map of decent S-v-stacks fine over S, T → S cohomologically smooth, A ∈ D_ét(X, Λ) and B ∈ D_ét(T, Λ) invertible; morphisms (q♮, α, β), where q♮ = (p, q, p′) is a morphism of correspondences: a correspondence (c, c′) : C → X ×_S X′, a correspondence (u, u′) : U → T ×_S T′ with u′ cohomologically smooth, and q : C → U with 2-isomorphisms p ∘ c ≅ u ∘ q and p′ ∘ c′ ≅ u′ ∘ q, p : X → T and p′ : X′ → T′ being the structure maps (Hansen–Kaletha–Weinstein, diagram (4.5.3)); α : c^*A → c′^!A′; and β : u^*B ≅ u′^!B′ an isomorphism; 2-morphisms pairs of cohomologically proper maps C → D and U → V (VS7.7) compatible as in Definition 4.3.4; tensor (X → T, A, B) ⊗ (X′ → T′, A′, B′) = (X ×_S X′ → T ×_S T′, A ⊠_S A′, B ⊠_S B′). Base and source functors 𝔅(X → T, A, B) = (T, B) and 𝔖(X → T, A, B) = (X, A) are symmetric monoidal to CoCorr_S. For objects with a common base 𝔗 = (T, B), 𝔛₁ ⊠_𝔗 𝔛₂ := (X₁ ×_T X₂ → T, (A₁ ⊠_T A₂) ⊗ p^*B^(-1), B); on morphisms lying over a common morphism of bases it uses (α₁ ⊠_U α₂) ⊗ β, the modified Künneth map κ_(U/T′) and Lemma 4.1.10 (equation (4.5.7)).

Hansen–Kaletha–Weinstein, Definition 4.5.4 and equations (4.5.3)–(4.5.7), pp. 38–40, defines based cohomological correspondences, the base and source functors and the fibre product over a common base on objects and morphisms.

The API of the construction:

- Objects (X → T, A, B) with T smooth over S and B invertible.
- 𝔅 : BCoCorr_S → CoCorr_S, (X → T, A, B) ↦ (T, B), symmetric monoidal.
- 𝔖 : BCoCorr_S → CoCorr_S, (X → T, A, B) ↦ (X, A), symmetric monoidal.
- 𝔛₁ ⊠_𝔗 𝔛₂ = (X₁ ×_T X₂ → T, (A₁ ⊠_T A₂) ⊗ p^*B^(-1), B).
- Fibre products of morphisms lying over a common morphism of bases, by (4.5.7).
- If the diagonal Δ_(T/S) is cohomologically smooth and 𝔖(𝔛), 𝔅(𝔛) are dualizable in CoCorr_S, then 𝔛 is dualizable, with dual (X → T, 𝔻_(X/S)A, K_(T/S) ⊗ B^(-1)). Its coevaluation lies over the coevaluation S ← T → T ×_S T of 𝔅(𝔛), whose right leg Δ_(T/S) must be cohomologically smooth for a morphism of BCoCorr_S; its evaluation lies over T ×_S T ← T → S, whose right leg is the smooth structure map π : T → S (Hansen–Kaletha–Weinstein, proof of Theorem 4.5.3, p. 40, for B = Λ_T, under the same smoothness of π and Δ_(T/S)).

In the sources it enters as follows: dualizability and traces of fibre products over a smooth base (HKW22 proof of Theorem 4.5.3, pp. 40–41); the objects 𝔜, 𝔊, 𝔊′ and morphisms coev_G, ev_G, α₀ relating cc_(Y/S)(A) to the universal local term (HKW22 proof of Theorem 4.6.1, pp. 42–43).

*Proof sketch.*

1. Composition of morphisms as in VS8.7, with smoothness of u′ preserved under composition (VS6.8).
2. The fibre product on morphisms is the composite (4.5.7) built from VS11.5 and VS7.10.
3. Its functoriality and monoidality (4.5.8)–(4.5.9) are VS11.8.
4. Dualizability: the source parts of coevaluation and evaluation are those of 𝔖(𝔛) (VS8.8). For the coevaluation, u′ = Δ_(T/S) is smooth and β is Λ_T ≅ Δ^!(B ⊠ (K_(T/S) ⊗ B^(-1))) ≅ K_Δ ⊗ K_(T/S) ≅ Λ_T, using Δ^! ≅ K_Δ ⊗ Δ^* for the smooth Δ (VS7.8) and K_Δ ≅ K_(T/S)^(-1) (VS7.11); for the evaluation, u = Δ_(T/S), u′ = π and β is Δ^*((K_(T/S) ⊗ B^(-1)) ⊠ B) ≅ K_(T/S) = π^!Λ_S. The triangle identities are those of 𝔖(𝔛) and 𝔅(𝔛).

**Checks.**

- 𝔅 and 𝔖 send the unit (S → S, Λ_S, Λ_S) to (S, Λ_S).
- For T = S, Δ_(S/S) = id_S is smooth and K_(S/S) = Λ, and the dualizability statement gives the dual (X → S, 𝔻_(X/S)A, B^(-1)), whose source part is the dual of (X, A) in CoCorr_S (VS8.8) and whose base part is the inverse of the invertible B on S.
- The smoothness of Δ_(T/S) cannot be dropped from the dualizability statement. Take p = 2, S = Spd C, X = T = (P¹_C)^♢ with X → T the identity, and A = B = Λ = F₃. Then 𝔖(𝔛) = 𝔅(𝔛) = (P¹, F₃) is dualizable in CoCorr_S (F₃ is ULA over S on the smooth P¹, VS8.9). But Δ_(T/S) is not cohomologically smooth: its dualizing complex Λ(−1)[−2] is invertible with H⁰ = 0, while the base change of Δ_(T/S) along itself is id_T, with dualizing complex Λ and H⁰ = F₃, so its formation does not commute with base change (VS7.8 (3)). Hence the coevaluation S ← T → T ×_S T of 𝔅(𝔛) is not the base of a morphism of BCoCorr_S; as 𝔅 is symmetric monoidal and duality data in Corr_S are unique up to equivalences, which are correspondences with invertible legs, the base of any coevaluation of 𝔛 would have right leg Δ_(T/S) up to isomorphism, so 𝔛 is not dualizable.
- For T = S and B = Λ, 𝔛₁ ⊠_𝔗 𝔛₂ = (X₁ ×_S X₂, A₁ ⊠_S A₂), the tensor product of CoCorr_S.
- For 𝔛_i = (X_i → T, A_i, Λ_T), 𝔛₁ ⊠_𝔗 𝔛₂ has sheaf A₁ ⊠_T A₂, with no twist.
- Without the invertible object B, the composite (4.5.7) does not define a morphism (X₁ ×_T X₂, A₁ ⊠_T A₂) → (X′₁ ×_(T′) X′₂, A′₁ ⊠_(T′) A′₂) of naive fibre products over a morphism of bases (HKW22 p. 38). Its Künneth step κ_(U/T′) lands in (c′)^!(A′₁ ⊠_(T′) A′₂) ⊗ q^*K_(U/T′), and with no factor ((u′)^!B′)^(−1) to absorb K_(U/T′) this object need not be isomorphic to (c′)^!(A′₁ ⊠_(T′) A′₂), as the following example shows. For S = T = T′ = X_i = X′_i = Spd C, U = C₁ = C₂ the perfectoid closed unit ball over S and A_i = A′_i = Λ ≠ 0, the two objects are Λ(2)[4] and Λ(1)[2], with H^(−4) equal to Λ and 0 (VS11.5). Positive dimension of U → T′ and Λ ≠ 0 do not by themselves force a difference: with the same spaces and A′₁ = 0, both objects are 0.

*Needs:* VS8.7; VS8.3; VS8.8; VS11.5; VS7.8; VS7.10; VS7.11; VS6.8.

### 11.8 Functoriality and monoidality of fibre products over a base

Throughout this subsection, S is a decent v-stack.

The fibre product ⊠_𝔗 is a functor BCoCorr_S ×_(𝔅, CoCorr_S) BCoCorr_S → BCoCorr_S: there are coherent 2-isomorphisms (𝔣′₁ ⊠_(e′) 𝔣′₂) ∘ (𝔣₁ ⊠_e 𝔣₂) ≅ (𝔣′₁ ∘ 𝔣₁) ⊠_(e′∘e) (𝔣′₂ ∘ 𝔣₂), and it is monoidal: (𝔛₁ ⊠_𝔗 𝔛₂) ⊗ (𝔛′₁ ⊠_(𝔗′) 𝔛′₂) ≅ (𝔛₁ ⊗ 𝔛′₁) ⊠_(𝔗⊗𝔗′) (𝔛₂ ⊗ 𝔛′₂), compatibly with the symmetry and the 𝔅- and 𝔖-images.

Hansen–Kaletha–Weinstein, Equations (4.5.8)–(4.5.9) and the sentence after them, p. 40, states that ⊠_𝔗 is functorial and monoidal up to the displayed 2-isomorphisms and that the details are straightforward but tedious; no proof is given.

*Proof sketch.*

1. Composition: the composite of two diagrams (4.5.6) is the diagram for the composite; the 2-isomorphism compares the two composites of (4.5.7) using compatibility of the Künneth maps with base change (VS7.6), compatibility of κ_(U/T) with composition of smooth maps U″ → U′ → T (VS11.5, compatibility of κ with composition), and the identification K_(U″/T) ≅ K_(U″/U′) ⊗ K_(U′/T).
2. Monoidality: (X₁ ×_T X₂) ×_S (X′₁ ×_(T′) X′₂) ≅ (X₁ ×_S X′₁) ×_(T ×_S T′) (X₂ ×_S X′₂), with the sheaves matched by the symmetric monoidal structure of ⊠ and B^(-1) ⊠ B′^(-1) = (B ⊠ B′)^(-1).
3. Coherence (associativity of the 2-isomorphisms) reduces to the coherence of base change isomorphisms in the enhanced operation map (VS7.5).
4. The source calls these verifications straightforward but tedious and omits them; their proofs are part of this target.

**Checks.**

- For trivial bases the statement is the functoriality of the tensor product of CoCorr_S.
- Applied to coev and ev of dualizable objects with common base it gives the dualizability of 𝔛₁ ⊠_𝔗 𝔛₂ (VS11.9).

*Needs:* VS11.7; VS11.5; VS7.6; VS7.5.

### 11.9 A Künneth formula for characteristic classes

Throughout this subsection, S is a decent v-stack; π and Δ_(T/S) are cohomologically smooth; A_i is ULA over S.

Let T be a decent S-v-stack with π : T → S and Δ_(T/S) cohomologically smooth, X₁, X₂ → T fine, and A_i ∈ D_ét(X_i, Λ) ULA over S. Then A₁ ⊠_T A₂ is ULA over S, In_S(X₁ ×_T X₂) ≅ In_S(X₁) ×_(In_S(T)) In_S(X₂), and cc_(X₁/S)(A₁) ⊠_(In_S(T)) cc_(X₂/S)(A₂) = cc_(X₁×_TX₂/S)(A₁ ⊠_T A₂), where ⊠_(In_S(T)) is the Künneth pairing (4.5.2) built from κ_(In_S(T)/S) and the trivialisation of VS11.6.

Hansen–Kaletha–Weinstein, Theorem 4.5.3 and equation (4.5.2), p. 38, and proof, pp. 40–41, states and proves the Künneth formula for characteristic classes over a base T with smooth structure map and diagonal, through based cohomological correspondences.

*Proof sketch.*

1. Set 𝔛_i = (X_i → T, A_i, Λ_T) in BCoCorr_S; since Δ_(T/S) is cohomologically smooth, each is dualizable with dual (X_i → T, 𝔻_(X_i/S)A_i, K_(T/S)) by VS11.7, the source (X_i, A_i) being dualizable by VS8.9 and the base (T, Λ_T) by VS11.6.
2. 𝔛 = 𝔛₁ ⊠_𝔗 𝔛₂ is dualizable with coev and ev obtained from those of 𝔛₁, 𝔗, 𝔛₂ through the monoidality isomorphism (VS11.8); hence 𝔖(𝔛) = (X₁ ×_T X₂, A₁ ⊠_T A₂) is dualizable, i.e. ULA (VS8.9).
3. The functoriality 2-isomorphism identifies tr(1_𝔛) with tr(1_(𝔛₁)) ⊠_(tr(1_𝔗)) tr(1_(𝔛₂)); unwinding (4.5.7) the section is the image of cc(A₁) ⊗ cc(A₂) under κ_(In_S(T)/S) followed by the inverse of cc_(T/S)(Λ_T) (HKW22 proof of Theorem 4.5.3, with the misprint In_S(T₁) corrected to In_S(T)).

**Checks.**

- For T = S, cc_(X₁/S)(A₁) ⊠_S cc_(X₂/S)(A₂) = cc_(X₁×_SX₂/S)(A₁ ⊠_S A₂), the analogue of tr(A ⊗ B) = tr(A)tr(B).
- For X₁ = X₂ = T and A_i = Λ, both sides are cc_(T/S)(Λ_T).

*Needs:* VS11.8; VS11.7; VS11.6; VS11.5; VS8.9; VS8.11; VS8.2.

### 11.10 The inertia stack of a quotient stack

Throughout this subsection, S is a decent v-stack; X is a nice diamond over S; G is a cohomologically smooth S-group diamond acting on X.

Let X be a nice diamond over S with an action α : X ×_S G → X of a cohomologically smooth S-group diamond G, and Y = [X/G]. For the correspondence c = (pr_X, α) : X ×_S G → X ×_S X, Fix(c) = {(x, g) : g(x) = x} is G-stable for h·(x, g) = (h(x), hgh^(-1)) and In_S(Y) ≅ [Fix(c)/G]; the map In_S(Y) → In_S([S/G]) ≅ [G//G] is the quotient of the projection Fix(c) → G, and the square Fix(c̃) → G over In_S(Y) → [G//G] is Cartesian, where c̃ = (id, α̃) on X_G = X ×_S G over G, α̃(x, g) = (g(x), g), Fix(c̃) ≅ Fix(c), and the fibre of Fix(c̃) over g ∈ G(S) is Fix(g).

Hansen–Kaletha–Weinstein, §4.6, pp. 41–42, presents In_S([X/G]) as [Fix(c)/G], the map to [G//G], the correspondence c̃ over G with Fix(c̃) ≅ Fix(c), its fibres Fix(g), and the Cartesian square used for (4.6.1).

*Proof sketch.*

1. Y is decent and fine over S (VS6.4, VS6.7; [X/G] → [S/G] is representable in nice diamonds).
2. Unwind In_S(Y) = Y ×_(Y ×_S Y) Y on the G-torsor X → Y, as for classifying stacks (VS11.2).
3. Fix(c̃) is the fibre product of the graph of α̃ with the diagonal of X_G over G, which is Fix(c).

**Checks.**

- For X = S, In_S([S/G]) = [G//G].
- For G acting trivially, In_S([X/G]) = X × [G//G].

*Needs:* VS8.11; VS11.2; VS6.9; VS6.4; VS6.7.

### 11.11 The universal local term of a group action

Throughout this subsection, S is a decent v-stack; X, G as in VS11.10; A is ULA over S.

For A ∈ D_ét([X/G], Λ) ULA over S, A_(X_G) = A|_(X_G) is ULA over G, and the G-equivariance of A gives ũ : A_(X_G) → α̃^*A_(X_G) = α̃^!A_(X_G) (α̃ is an isomorphism), so (c̃, ũ) is an endomorphism of the dualizable object (X_G, A_(X_G)) of CoCorr_G. Its trace tr_(c̃)(ũ, A_(X_G)) ∈ H^0(Fix(c̃), K_(Fix(c̃)/G)) is the universal local term: for every g ∈ G(S), restriction along g carries it to tr(g, u_g) ∈ H^0(Fix(g), K_(Fix(g)/S)), where u_g : A_X → g^*A_X is the equivariance isomorphism at g.

Hansen–Kaletha–Weinstein, §4.6, pp. 41–42, constructs the endomorphism (c̃, ũ) of (X_G, A|_(X_G)) in CoCorr_G, calls its trace the universal local term, and states that it restricts at g ∈ G(S) to tr(g, u_g).

The API of the construction:

- tr_(c̃)(ũ, A_(X_G)) ∈ H^0(Fix(c̃), K_(Fix(c̃)/G)).
- Its restriction along g ∈ G(S) is tr(g, u_g).
- Additive in distinguished triangles of G-equivariant ULA objects.
- Its restriction along the identity section is cc_(X/S)(A_X).

In the sources it enters as follows: compared with the characteristic class of A on [X/G] (HKW22 Theorem 4.6.1, p. 42); local terms of Satake sheaves at fixed points of strongly regular elements are independent of g (HKW22 §5.4, Corollary 5.4.2, p. 50).

*Proof sketch.*

1. A_X is ULA over S because G → S is smooth (VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*)); A_(X_G) is ULA over G by base change.
2. α̃ is an automorphism of X_G over G, so α̃^* ≅ α̃^! and (c̃, ũ) is a 1-morphism of CoCorr_G; this is why one works over the base G (HKW22 p. 41).
3. Restriction to g ∈ G(S) is the base change of cohomological correspondences along g : S → G (VS9.5), which preserves traces.

**Checks.**

- For G acting trivially on X and A pulled back from X with its trivial equivariant structure, Fix(c̃) = X_G and the universal local term is the pullback of cc_(X/S)(A_X) along X_G → X.
- For G = Z/2 acting on X = {a, b}_S by swapping and A = Λ, the universal local term is supported over the identity, with value 1 at (a, 1) and (b, 1).
- Restricting along 1 ∈ G(S) gives cc_(X/S)(A_X).
- The pair (pr_X, α) with the equivariance isomorphism is in general not an endomorphism in CoCorr_S, since α^* ≠ α^!: for X = S a geometric point, G = G_m^♢ and Λ ≠ 0, α^*Λ = Λ while α^!Λ = Λ(1)[2]. For G finite étale it is one: for G = Z/2 swapping X = {a, b}_S, Fix(pr_X, α) consists of (a, 1) and (b, 1) over 1 and is empty over σ, and its trace class is (1, 1), agreeing with the universal local term above. The construction over G works uniformly.

*Needs:* VS11.10; VS8.10; VS8.7; VS9.5; VStackSheavesAndLisseCategories §VS1.1 (*ula-descent-and-smooth-locality*); VS8.9.

### 11.12 Characteristic classes on [X/G] are universal local terms

Throughout this subsection, S is a decent v-stack; X, G, A as in VS11.11.

With notation as above, let ι : H^0(In_S(Y), K_(In_S(Y)/S)) → H^0(Fix(c̃), K_(Fix(c̃)/G)) be the composite of the isomorphism K_(In_S(Y)/[G//G]) ≅ p^!Λ ≅ p^!K_([G//G]/S) ≅ K_(In_S(Y)/S) (from the trivialisation of VS11.6 for T = [S/G]) with the pullback (4.6.1) along the Cartesian square of VS11.10. Then ι(cc_(Y/S)(A)) = tr_(c̃)(ũ, A_(X_G)).

Hansen–Kaletha–Weinstein, Theorem 4.6.1, equations (4.6.1)–(4.6.4) and proof, pp. 42–43, proves that the characteristic class of A on [X/G], transported by ι, is the universal local term, using based cohomological correspondences and the functoriality of fibre products.

*Proof sketch.*

1. Introduce 𝔗 = ([S/G], Λ), 𝔜 = (Y → [S/G], A, Λ) in BCoCorr_S, 𝔛_G = (X_G, A_(X_G)) in CoCorr_G and α = (c̃, ũ). The diagonal Δ_([S/G]/S) is cohomologically smooth, since its base change along the smooth surjective point S → [S/G] ×_S [S/G] (a G ×_S G-torsor) is the smooth G → S; so 𝔜 is dualizable by VS11.7, its source (Y, A) being dualizable by VS8.9 and its base 𝔗 by VS11.6. Add 𝔊 = (G → S, Λ_G, Λ_S) and 𝔊′ = (G → [S/G] ×_S [S/G], Λ_G, Λ ⊠ K_([S/G]/S)), where G → [S/G] ×_S [S/G] is the trivial right G ×_S G-torsor G ×_S G ×_S G over G, with points (x, g, h) (x the coordinate of the base G) and right action (x, g, h)·(a, b) = (x, ga, hb) (VS6.9). Add the morphisms coev_G : 𝔊 → 𝔊′ over coev_𝔗 (a morphism of BCoCorr_S because its base right leg Δ_([S/G]/S) is smooth) and ev_G : 𝔊′ → 𝔊 over ev_𝔗, both with source the identity of (G, Λ_G), and the automorphism α₀ of 𝔊′ over the identity of base and source given by the torsor automorphism (x, g, h) ↦ (x, xg, h), with inverse (x, g, h) ↦ (x, x⁻¹g, h). Over x ∈ G its first component is left multiplication by x, the 2-morphism α_x of VS6.9; it commutes with the right action since x(ga) = (xg)a. Hansen–Kaletha–Weinstein write (x, g, h) ↦ (x, gx, h) (p. 43) for their left torsors (p. 35); the formula here is its conversion to right torsors.
2. tr_G = ev_G ∘ α₀ ∘ coev_G is an endomorphism of 𝔊 over tr(id_𝔗), with source the identity of (G, Λ_G), whose middle map G → [G//G] = In_S([S/G]) sends x to its conjugacy class: left multiplication by x on the trivial right torsor has inertia coordinate φ(y) = y⁻¹xy (VS11.2), equal to x on the unit section. Without α₀ the middle map would send every x to the class of 1.
3. The functoriality of ⊠ (VS11.8) gives a 2-isomorphism 𝔖(cc_(Y/S)(A) ⊠_(cc_([S/G]/S)(Λ)) tr_G(α₀)) ≅ F(tr(α)), F : CoCorr_G → CoCorr_S forgetting the base (HKW22 (4.6.4)); on sections this is the claimed equality (HKW22 proof of Theorem 4.6.1).

**Checks.**

- For X = S, the theorem identifies cc_([S/G]/S)(Λ) with the canonical trivialisation.
- Restricting to g ∈ G(S) gives the local terms tr(g, u_g) from the characteristic class on [X/G].
- Orientation of α₀ (permutations composed right to left; G = S₃ constant over a geometric point S, a finite étale group diamond). Take x = (12), a = (123) and the point t = (x, 1, 1). The automorphism (x, g, h) ↦ (x, xg, h) sends t·(a, 1) = (x, a, 1) to (x, xa, 1), and t to (x, x, 1), whose translate by (a, 1) is again (x, xa, 1), with xa = (23); so it is a torsor automorphism. The unconverted (x, g, h) ↦ (x, gx, h) sends t·(a, 1) to (x, ax, 1) with ax = (13), but t to (x, x, 1), whose translate is (x, (23), 1); it does not commute with the right action. On the unit section the converted automorphism has inertia coordinate x = (12), so the middle map of tr_G sends (12) to the class of transpositions, not to the class of 1.

*Needs:* VS11.11; VS11.10; VS11.6; VS11.7; VS11.8; VS11.2; VS8.9; VS8.11; VS6.9.

### 11.13 On an étale locus of fixed points the characteristic class is the local-term function

Throughout this subsection, S is a decent v-stack; X, G, A as in VS11.11; U ⊂ G open and conjugation invariant; Fix(c̃)_U → U is étale. The étaleness hypothesis replaces the source's assumption that elements of U have only isolated fixed points, which does not imply it (Corrections to the sources).

Let U ⊂ G be an open conjugation-invariant subset and In_S([X/G])_U the preimage of [U//G]. Assume Fix(c̃)_U → U is étale (for instance, the fixed points vary locally constantly over U, as for strongly regular elements acting on affine Grassmannians). Then In_S([X/G])_U → [U//G] is étale, K_(In_S([X/G])_U/S) ≅ Λ canonically, and cc_([X/G]/S)(A) restricted over U is the continuous function (x, g) ↦ loc_x(g, A) on {(x, g) ∈ X ×_S U : g(x) = x}.

Hansen–Kaletha–Weinstein, §4.6, closing remark, p. 44, states that over a conjugation-invariant open U whose elements have only isolated fixed points, the inertia is étale over [U//G], the dualizing complex is trivial and cc is the local-term function; étaleness is asserted without proof and fails in general (Corrections to the sources). In Hansen–Kaletha–Weinstein, Proposition 5.4.1 and Corollary 5.4.2, p. 50: for the positive loop group acting on Schubert cells and strongly regular elements, identifies the inertia explicitly, which provides the étaleness in the application.

*Proof sketch.*

1. Étaleness descends along the smooth surjection U → [U//G] from the Cartesian square of VS11.10.
2. K_([U//G]/S) ≅ Λ canonically: restrict the isomorphism of sheaves Λ ≅ K_([G//G]/S) of VS11.6 (for T = [S/G]) to the open substack [U//G] of In_S([S/G]) = [G//G]; this is restriction of sheaves to an open of the inertia, not VS8.12, since [U//G] is in general not the inertia of an open substack of [S/G]. Étale pullback preserves the trivialisation.
3. By VS11.12 and VS11.11, the restriction at g ∈ U(S) is tr(g, u_g), whose value at an isolated fixed point x is loc_x(g, A) (VS9.4).

**Checks.**

- For g(z) = az with a ∈ C^× ∖ {1}, the equations for fixed points near 0 and ∞ have linear terms (a − 1)z and (a⁻¹ − 1)w; both coefficients are nonzero, so the fixed-locus projection is étale near these points.
- Counterexample to the source's hypothesis: for the smooth group of matrices [[a, b], [0, 1]] (a ∈ 1 + ϖO, b ∈ O, with 0 < |ϖ| < 1) over C acting on P¹ and U = G ∖ {1}, every element of U has isolated fixed points, but the reduced fixed locus over U is two sections meeting along a = 1, not étale over U.

*Needs:* VS11.12; VS11.11; VS11.10; VS11.6; VS9.4.

### Examples

- For G = Z/2, Λ = F_3 (with p ≠ 3), M the sign representation and μ counting measure, tr.dist(M)(1_({1}) ⊗ μ) = 1 and tr.dist(M)(1_({σ}) ⊗ μ) = −1.
- For G = Z_p, M = Λ trivial and μ normalised on Z_p, tr.dist(Λ)(h ⊗ μ) = ∫ h dμ.
- For S = T = Spd C, U = [S/G_S] with G = Z_p and Y_i = U, κ_(U/S) : K_(U/S) ⊗ K_(U/S) → K_(U/S) ⊗ K_(U/S) is an isomorphism of free rank-one twists by Haar(Z_p, Λ)^∗.
- For T = S and B = Λ, 𝔛₁ ⊠_𝔗 𝔛₂ = (X₁ ×_S X₂, A₁ ⊠_S A₂), the tensor product of CoCorr_S.
- For G = Z/2 acting on X = {a, b}_S by swapping and A = Λ, the universal local term is supported over the identity, with value 1 at (a, 1) and (b, 1).

### Dependencies

This layer uses this roadmap's VS6, VS7, VS8, VS9, VS10; VStackSheavesAndLisseCategories §VS1.1, §VS1.2, §VS4.2, §VS5.2; SmoothRepresentationsOfLocalGroups §SR.0.3, §SR.0d.2, §SR.1.1.

## Corrections to the sources

The statements above use corrected versions of the following points of the sources. Each is described at its locator.

- **Gulotta–Hansen–Weinstein, §1.2, item (3), p. 5** (misprint). The source attributes the partial-adjoint theorem to the gluing paper (arXiv:1211.5294) as Proposition 1.4.4. *Correction.* In the arXiv v4 texts it is *Enhanced six operations* (arXiv:1211.5948v4) Proposition 2.2.4, pp. 79–80; the gluing paper (arXiv:1211.5294v4) contains no Proposition 1.4.4 and no partial-adjoint statement; Remark 1.4.4 of *Enhanced six operations* (p. 38) concerns a different construction. The descent theorem used in VS7.5 is *Enhanced six operations* Theorem 4.1.8(1).
- **Hansen–Kaletha–Weinstein, §4.6, closing remark, p. 44 (published version; the same in arXiv v4)** (error). The source asserts that if every element of a conjugation-invariant open U ⊂ G has only isolated fixed points on X, then the restricted inertia In_S([X/G])_U is étale over [U//G], so its dualizing complex is canonically trivial and the characteristic class is the function (x, g) ↦ loc_x(g, A). *Correction.* Add the hypothesis that the fixed locus Fix(c̃)_U → U is étale (equivalently that In_S([X/G])_U → [U//G] is étale); the conclusion then holds. In the paper's application (§5.4) this étaleness is supplied by the explicit description of the inertia in Proposition 5.4.1. *Reason.* Let G be the smooth rigid group of matrices [[a, b], [0, 1]] with a ∈ 1 + ϖO_C (0 < |ϖ| < 1), b ∈ O_C acting on P¹ over C, and U = G ∖ {1}. Elements with a ≠ 1 fix ∞ and b/(1 − a); elements with a = 1, b ≠ 0 fix only ∞. All fixed points are isolated, but the reduced fixed locus over U is two sections of P¹ × U → U meeting along a = 1, a double cover branched there, not étale over U; in the coordinate w = 1/z the fixed equation is w(bw + a − 1) = 0, which has a double root at w = 0 when a = 1 and b ≠ 0.
- **Hansen–Kaletha–Weinstein, Theorem 4.1.8, p. 24 (published version; the same in arXiv v4)** (gap). The source attributes to Gulotta–Hansen–Weinstein Theorem 1.4 the properties (P1)–(P5), (BC1)–(BC2) for fine maps and a pseudo-natural isomorphism Rf_! → Rf_* on proper morphisms. *Correction.* Gulotta–Hansen–Weinstein Theorem 1.4 (arXiv v1, the public version) gives agreement with Scholze, pseudo-functoriality, the projection formula, proper base change and the right adjoint, and no comparison of Rf_! with Rf_*. (P4), (P5) and (BC2) follow formally (VS7.6). VS7.7 constructs the comparison c_f : Rf_! → Rf_* for every proper fine map, pseudo-natural in compositions and in arbitrary 2-morphisms, and proves it invertible for proper nice maps and for proper fine maps that become representable in locally spatial diamonds after base change along one chart of the target. Whether it is invertible for every proper fine map is not established by the sources: by VS6.11 it would follow if, for every proper fine map to a separated spatial diamond, every point of the source were hit by a quasi-pro-étale map from a geometric point. The 2-morphisms of correspondences, proper pushforwards and integration are therefore taken among cohomologically proper maps, those proper fine maps whose comparison is invertible after every decent base change, which is the property the source uses. *Reason.* Comparison of HKW22 Theorem 4.1.8 with GHW22 Theorem 1.4 (pp. 3–4). Properness cannot be weakened to fineness: for f : B(C₃) → S over a geometric point with p = 2 and Λ = F₃, H^(-1)(Rf_!Λ) = F₃ while H^(-1)(Rf_*Λ) = 0; such maps are excluded because Scholze's proper maps are 0-truncated. The pseudo-naturality in 2-morphisms is not automatic from 0-truncatedness: q : S → B(C₂) is proper nice with Aut(q) = C₂ acting by the swap on q_*Λ = Λ[C₂] (VS7.7).
- **Hansen–Kaletha–Weinstein, Definition 4.1.7, p. 23; footnote 4, p. 28; Example 4.2.5, p. 27; paragraph after Theorem 4.1.8, p. 24** (misprint). The source cites [GHW22, Definition 4.3], [GHW22, Definition 4.1] (strictly surjective), [GHW22, Proposition 4.10], [GHW22, Proposition 4.11] and [GHW22, Proposition 4.17], and defines charts as strictly surjective and locally compactifiable of finite dim.trg. *Correction.* In arXiv:2202.12467v1, the only public version, these are Definition 4.1 (representability in locally separated locally spatial diamonds), Definition 1.1 (decent v-stacks, with surjective charts that are locally separated and cohomologically smooth), Proposition 4.8 (iii) and (i) (cancellation and composition of fine maps), Proposition 4.8 (iv) with Proposition 4.5, and Proposition 4.14 (intrinsic smoothness). The conventions follow v1's definitions. *Reason.* The cited numbers do not exist or point to other statements in arXiv v1; the content matches the statements listed.
- **Hansen–Kaletha–Weinstein, paragraph before Theorem 4.1.6, p. 23 (published version)** (error). The source states that an object of D_ét(X, Λ) is invertible if and only if it is étale locally isomorphic to L[n] for an invertible Λ-module L. *Correction.* The "if" direction holds; the "only if" direction fails when Spec Λ is disconnected, since the shift may differ on the factors of an idempotent decomposition of Λ. Lemma 4.1.10 and its proof need only a tensor inverse, and VS7.10 is stated for every ⊗-invertible I (Conventions). *Reason.* Over a geometric point with p = 2 and Λ = F₃ × F₃, I = e₁Λ ⊕ e₂Λ[1] has tensor inverse e₁Λ ⊕ e₂Λ[−1], but H⁰(I) and H⁻¹(I) are both nonzero and every étale cover of a geometric point splits.
- **Hansen–Kaletha–Weinstein, Example 4.1.1, p. 22 (published version; the same in arXiv v4)** (error). The source identifies the morphisms [S/G] → [S/H] with S-homomorphisms G → H. *Correction.* Morphisms correspond to H-torsors on S with a commuting G-action; homomorphisms arise after choosing a trivialisation, and the conjugation description of 2-morphisms holds for maps induced by specified homomorphisms (VS6.9). *Reason.* For S = Spd Q_p, G = 1 and H the constant group Z/2, the unramified quadratic extension gives a nontrivial H-torsor, hence a map B1 → BH not induced by a homomorphism.
- **Hansen–Kaletha–Weinstein, Example 4.2.5, after equation (4.2.1), p. 27 (published version)** (error). For unimodular G the source identifies H^0 of the dualizing complex of [T_S/G_S] with Dist(T, Λ)^G after choosing a Haar measure. *Correction.* The chosen Haar measure must generate the free rank-one Λ-module Haar(G, Λ), for instance the measure with value 1 on a compact open pro-p subgroup; a unit multiple changes the isomorphism by that unit (VS10.10). *Reason.* For G = 1, T a point, p = 2 and Λ = Z/9, three times counting measure is a Haar measure, and the resulting map Λ → Λ is a ↦ 3a, which is neither injective nor surjective.
- **Hansen–Kaletha–Weinstein, Example 4.3.10, p. 33 (published version; the same in arXiv v4)** (error). The source applies Theorem 4.3.8 to an endomorphism over an arbitrary correspondence Y → X ×_S X of a proper nice diamond X over Spd C, assuming only X proper. *Correction.* Also require Y → S proper (equivalently c₁ proper, X being proper), so that p : Y → S is a proper map as Theorem 4.3.8 needs; for automorphisms Y = X this is automatic (VS9.3). *Reason.* Theorem 4.3.8 needs p : C → C′ = S proper; without it neither the pushed endomorphism nor the integral over Fix(c) is defined.
- **Hansen–Kaletha–Weinstein, Definition 4.3.4, tensor product of 1-morphisms, p. 30** (misprint). The composite defining (c, u) ⊗ (d, v) ends in (c₂ ×_S d₂)^!(A₂ ⊠ A′₂). *Correction.* The target is (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂). *Reason.* The previous term is c₂^!A′₁ ⊠_S d₂^!A′₂ and the Künneth map preserves the sheaves.
- **Hansen–Kaletha–Weinstein, Definition 4.5.4, p. 39** (misprint). The source represents morphisms of BCoCorr_S by C → X ×_U X′ lying over U → T ×_S T′, and by D → X ×_V X′. *Correction.* The morphism is a correspondence C → X ×_S X′ lying over the correspondence U → T ×_S T′ through q : C → U, as in diagram (4.5.3) (VS11.7). *Reason.* X maps to T and X′ to T′, neither to U: for the coevaluation of VS11.7, U = T and X′ = X ×_S X lies over T ×_S T, so X ×_U X′ is undefined.
- **Hansen–Kaletha–Weinstein, Proof of Theorem 4.5.3, p. 41** (misprint). The source writes the fixed locus of the composite as In_S(X₁) ×_(In_S(T₁)) In_S(X₂). *Correction.* In_S(X₁) ×_(In_S(T)) In_S(X₂). *Reason.* There is a single base T in the theorem.
- **Hansen–Kaletha–Weinstein, Proof of Lemma B.1.1, pp. 72–73** (misprint). The source uses an isomorphism 𝔪^(m−1)Λ ≅ κ and applies induction to 𝔪M as a Λ/𝔪^(m−1)-module. *Correction.* 𝔪^(k−1)Λ ≅ κ, and induction applies to 𝔪M as an R/𝔪^(k−1)-module. *Reason.* The lemma's exponent is k (Λ = R/𝔪^k); m is undefined.
- **Hansen–Kaletha–Weinstein, §5.3, p. 48** (misprint). The source refers to the description of the trace map Hom(c₁^*F, Rc₂^!F) → H^0(Fix(c), K_(Fix(c)/S)) as the discussion immediately before Definition 4.3.5. *Correction.* The discussion immediately before Definition 4.3.6 (pp. 31–32); 4.3.5 is a proposition. *Reason.* Numbering of §4.3 in the published version and in arXiv v4.
- **Hansen–Kaletha–Weinstein, Equations (4.5.8)–(4.5.9) and the sentence after them, p. 40** (gap). The source states that the fibre product over a base is functorial and monoidal up to 2-isomorphism and that the details are straightforward but tedious, giving no proof. *Correction.* The coherence must be proved; VS11.8 proves it from the compatibility of Künneth maps with base change and of the modified Künneth map with composition. *Reason.* Theorems 4.5.3 and 4.6.1 rest on these 2-isomorphisms.

## Downstream consumers

- The computation of local terms of Satake sheaves on the B_dR-affine Grassmannian and the Kottwitz conjecture for local shtuka spaces (Hansen–Kaletha–Weinstein §§5–6) use the local terms of VS9.4, their base change (VS9.6) and perfect-scheme comparison (VS9.8), the trace distributions of VS11.3, the Künneth formula VS11.9 and the universal local terms of VS11.12.
- The elliptic local trace of `IgusaVarietiesAndTorsionConcentration` §7.9b uses, for torsion coefficients, CoCorr_S (VS8.7), the trace class (VS8.10), the relative Lefschetz–Verdier formula (VS9.1) and the local terms of VS9.4–VS9.6.
- Hecke and excursion operators on Bun_G built from stacky Hecke correspondences use the exceptional functors of Layer VS7 and the cohomological correspondences of Layer VS8.
- Relative trace formalisms for schemes over a general base can import the generic trace formalism of VS8.1–VS8.3 (dualizable objects and traces in symmetric monoidal 2-categories, functoriality of traces, the symmetric monoidal Grothendieck construction).

## References

- **[HKW22]** David Hansen, Tasho Kaletha and Jared Weinstein, *On the Kottwitz conjecture for local shtuka spaces*, Forum of Mathematics, Pi 10 (2022), e13, 79 pp. (open access, CC BY), https://doi.org/10.1017/fmp.2022.7. Numbering and pages are those of the published article; the statement numbering agrees with arXiv:1709.06651v4.
- **[GHW22]** Daniel Gulotta, David Hansen and Jared Weinstein, *An enhanced six-functor formalism for diamonds and v-stacks*, arXiv:2202.12467v1 (2022), the only public version, https://arxiv.org/abs/2202.12467v1. Its numbering differs from the numbering Hansen–Kaletha–Weinstein cite; see *Corrections to the sources*.
- **[LZ22]** Qing Lu and Weizhe Zheng, *Categorical traces and a relative Lefschetz–Verdier formula*, Forum of Mathematics, Sigma 10 (2022), e10; locators give the numbering and PDF pages of arXiv:2005.08522v4, https://arxiv.org/abs/2005.08522v4.
- **[Sch17]** Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v3; locators give its numbering and printed pages, https://arxiv.org/abs/1709.07343v3.
- **[FS21]** Laurent Fargues and Peter Scholze, *Geometrization of the local Langlands correspondence*, arXiv:2102.13459v4; locators give its numbering and printed pages, https://arxiv.org/abs/2102.13459v4.
- **[LiuZhengEnhanced]** Yifeng Liu and Weizhe Zheng, *Enhanced six operations and base change theorem for higher Artin stacks*, arXiv:1211.5948v4, https://arxiv.org/abs/1211.5948v4.
- **[LiuZhengGluing]** Yifeng Liu and Weizhe Zheng, *Gluing restricted nerves of ∞-categories*, arXiv:1211.5294v4, https://arxiv.org/abs/1211.5294v4.
- **[Stacks07LT]** The Stacks Project Authors, *The Stacks Project*, More on Algebra, Tag 07LT (compact objects of D(R) are perfect complexes), https://stacks.math.columbia.edu/tag/07LT.
