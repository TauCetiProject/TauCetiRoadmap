# Roadmap: topological sheaf cohomology and native comparison maps

**Summary.** Build the cover-refinement foundations of Čech cohomology for arbitrary topological spaces, the comparison with derived global sections for module sheaves on compact Hausdorff spaces, and its bounded-below hypercohomology and spectral-sequence forms. Connect these to native module and abelian sheaf cohomology, using the Godement resolution of SchemeAndStackFoundations. The other end theorem identifies the canonical direct-image stalk map for proper maps with finite fibers. The roadmap is this README; `Suggested.lean` states the headline theorems whose carriers exist at the pins.

## Scope and ownership

This roadmap owns the arbitrary-space raw-refinement and small-cofinal-cover interfaces of TS1.1–TS1.2, the constant-R adapter to ring-sheaf modules, the native module-derived/underlying-abelian comparison, and the compact Hausdorff Čech/derived and bounded-below comparisons. Its finite-fiber target identifies the actual native product-of-stalks map; it is an additional interface to the cohomological finite-fiber theorem, not another construction of finite quotient descent.

- **SchemeAndStackFoundations §2.5**, “Slice sites, Godement resolutions, flasque sheaves, Grothendieck vanishing, filtered colimits”, owns the Godement construction, its augmentation, flasqueness, exactness, open restriction and section-cohomology comparison for abelian sheaves and ring-sheaf modules. Section 0.1 transports that construction to constant-R module-valued sheaves.
- **ImplicitAtlases §§0.5–0.11** owns independent parity, K-sheaves and their equivalence with open sheaves, pure homotopy K-sheaves, compact supports, extension by zero, finite quotient descent, manifold orientation sheaves and closed-subset duality, and finite interval totals with pure gluing, and its §0.7 owns the compact-cover Čech hypercohomology of complexes of K-presheaves on compact Hausdorff spaces with its spectral sequence, compact supports and pullbacks. None of these is an input here. This roadmap owns open-cover Čech cohomology with sheaf and presheaf coefficients on arbitrary spaces: the fixed-cover refinement maps and homotopies of §1.1, which are statements about an indexed family of opens and a presheaf with no hypothesis on X; the colimit of §1.2 with its independence of refinement functions, its finite-cover cofinality on compact spaces and its vanishing on the empty space, which CharacteristicClasses C1.2b consumes on paracompact Hausdorff spaces that need not be locally compact; the open-cover hypercohomology of §1.4 with both of its spectral sequences; and the derived comparisons of §§1.3–1.4, whose target is the native derived functors of Γ_R. On a locally compact Hausdorff space the open-cover Čech cohomology of ImplicitAtlases §0.7 is the specialization of §1.2, and the comparison of its compact-cover hypercohomology with §1.4 runs through its §0.6 sheaf/K-sheaf equivalence; both are statements of that consumer. The native stalk theorem of Layer 2 uses open sheaves directly.
- **CharacteristicClasses C1.2b** owns the constant-coefficient Čech/singular comparison on paracompact Hausdorff spaces of CW type; its S0–S5 owns singular support cochains. It consumes TS1.1–TS1.2 here. Neither that comparison nor the support/cap comparison is an input or a target of this roadmap.
- **ComplexKahlerGeometry K2**, “Dolbeault calculus and the local lemmas”, owns analytic resolutions, fine-sheaf acyclicity and Čech/derived comparison on paracompact Hausdorff manifolds. Section 1.3 treats arbitrary compact Hausdorff spaces and preserves the module structure. Its proof uses neither analytic resolutions nor the manifold comparison.
- Native sheaf categories, right derived functors, fixed-family tuple Čech complexes, stalks and pushforward are in Mathlib. Tau Ceti supplies abelian flasque acyclicity, free-Yoneda section comparisons and Čech augmentations, with the exact declarations listed below. There is no new sheaf, complex or derived-category carrier here.

## Conventions

R is any commutative ring, including the zero ring. X and R lie in Type u; module fibers lie in Type u and all cover index sets used to form products are u-small. Sections 0 and 1.1–1.2 allow arbitrary topological spaces. Sections 1.3–1.4 assume compact Hausdorff X. Layer 2 assumes Hausdorff X, a proper map f (continuous, with Mathlib's cluster-point lifting property) and finite fibers; it assumes no local compactness of X or Y and no separation of Y, although the source states its lemmas under a standing locally-compact-Hausdorff convention that its proof does not use. No nonemptiness, manifold, field, finite-rank or invertible-group-order assumption is implicit.

Use `CategoryTheory.Sheaf (Opens.grothendieckTopology X) (ModuleCat.{u} R)`, equivalently `TopCat.Sheaf (ModuleCat.{u} R) X`. Write Γ_R for global sections, U for forgetting from module sheaves to abelian sheaves, and V for forgetting from modules to abelian groups. The comparison is V RⁿΓ_R ≅ Hⁿ U. The scalar action on the right is induced by the scalar endomorphisms of the coefficient sheaf. Negative ordinary sheaf-cohomology groups are zero by extension of the nonnegative grading; bounded-below complexes have an integer lower bound, not a natural-number truncation.

Čech degree is p≥0; internal cochain degree is q∈ℤ. A double complex is totalized in degree p+q with D=δ+(-1)^p d, where δ deletes vertices with the alternating signs starting with +1. Native shifts have F[k]^q=F^(q+k) and differential (-1)^k d. Conjugation by (-1)^(pq) identifies this total with d+(-1)^q δ. Section 1.4 computes a two-term witness for each sign. Raw refinements carry index functions; only the induced cohomology maps descend to the preorder ordered by existence of refinement.

For the derived comparison keep `HasSheafify` for both module and abelian sheaves, `HasInjectiveResolutions` for the module-sheaf category, additivity of the chosen Γ_R, and `HasExt.{u}` for abelian sheaves explicit. Γ_R is left exact because it is a right adjoint. The categorical adapter proves the existence of these structures at the matching universes; no assumption that forgetting preserves injectivity is made. Exact filtered colimits used below are those in `ModuleCat.{u} R`, indexed by small filtered categories. No exactness of arbitrary inverse limits or of extension of scalars by a nonflat algebra is used.

## Exact supplier contracts

### From Mathlib

- `TopCat.Sheaf` in `Mathlib/Topology/Sheaves/Sheaf.lean` and `CategoryTheory.sheafCompose` in `Mathlib/CategoryTheory/Sites/Whiskering.lean`: native sheaves and coefficient forgetting. The sheaf wrapper imposes no separation or compactness condition on X.
- `CategoryTheory.Sheaf.Γ` in `Mathlib/CategoryTheory/Sites/GlobalSections.lean`, `CategoryTheory.Functor.rightDerived` in `Mathlib/CategoryTheory/Abelian/RightDerived.lean`, and `CategoryTheory.Sheaf.functorH`, `CategoryTheory.Sheaf.H`, `CategoryTheory.Sheaf.H'` in `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`: global sections, right derived functors and Ext-based abelian cohomology, with the preceding class assumptions. The native Ext carrier is abelian, not itself an R-module comparison theorem. The right derived functors are defined through injective resolutions only; no pinned declaration computes them from an acyclic resolution, so that computation is a target of §0.1.
- `SheafOfModules` and `SheafOfModules.forgetToSheafModuleCat` in `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean`: ring-sheaf modules and their global-scalar restriction. The latter restricts to the ring of global sections; §0.1 also restricts along the constant-section map R→Γ(X,R_X), rather than equating those two rings on a disconnected space.
- `CategoryTheory.cechComplexFunctor` in `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean` and `CategoryTheory.Limits.FormalCoproduct` in `Mathlib/CategoryTheory/Limits/FormalCoproducts/Basic.lean`: tuple-intersection complexes and actual refinement functions. The native Čech construction is defined on families without a cover hypothesis and uses all tuples, including repeated indices and empty intersections. Its existence supplies no all-cover-colimit comparison.
- `CochainComplex`, `HomologicalComplex.homologyFunctor`, native cones and shifts: complexes and their homology; `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean` supplies bounded-below derived-functor infrastructure. These support the specialization in §0.2, not a second derived category.
- `TopCat.Sheaf.pushforward` in `Mathlib/Topology/Sheaves/Functors.lean`, `TopCat.Presheaf.stalk`, `TopCat.Presheaf.stalkPushforward` and `TopCat.Presheaf.stalkPushforward_germ` in `Mathlib/Topology/Sheaves/Stalks.lean`: the actual direct image, stalks and germ-coordinate map used in Layer 2. `IsProperMap` in `Mathlib/Topology/Maps/Proper/Basic.lean` includes continuity and the cluster-point lifting property; it includes neither finite fibers nor Hausdorffness. `IsProperMap.isClosedMap` in the same file, with no separation hypothesis, is the closedness Layer 2 uses.

### From Tau Ceti

- `TauCeti.Topology.isFlasque_of_injective`, `TauCeti.Topology.subsingleton_H'_succ_of_isFlasque` and `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` in `TauCeti/Topology/Sheaves/Flasque.lean`: abelian injective-to-flasque and positive-degree flasque acyclicity, on arbitrary topological spaces.
- `TauCeti.CategoryTheory.freeYonedaSheafSectionsEquiv` and `TauCeti.CategoryTheory.mono_freeYonedaSheafFunctor_map` in `TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean`: the abelian free-Yoneda section equivalence and monicity for monomorphisms of representables, under that file's sheafification hypotheses.
- `TauCeti.CategoryTheory.cechAugmentation` and `TauCeti.CategoryTheory.quasiIso_cechAugmentation_iff` in `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean`: the fixed-family augmentation and its criterion, with a terminal object and the required products. These do not assert that a general cover is acyclic.
- `CategoryTheory.Sheaf.cohomologyPresheafEvaluationIsoFunctorH` in `TauCeti/CategoryTheory/Sites/SheafCohomology/Terminal.lean`: open cohomology at the terminal open agrees with site cohomology, retaining the abelian sheafification and Ext assumptions.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §2.5's Godement resolution and its augmentation, flasque terms, exact functoriality, restriction and section-cohomology comparison on topological ringed spaces with enough points. Apply it to the sheaf R_X of locally constant R-valued functions after §0.1's equivalence. The same section supplies flasque Čech vanishing. No scheme, Noetherian or dimension hypothesis is added to this contract.

## How to read the build

Layer 0 identifies the coefficient presentations and specializes native derived sections, with the module-to-abelian comparison as its end theorem. Layer 1 first builds actual refinement maps and their homotopies, then the arbitrary-space cohomological colimit, then the compact derived and bounded-below comparisons. Layer 2 is independent of those resolutions: finite-fiber neighborhood separation identifies a canonical map between native stalk objects. The labels TS1.1–TS1.2 designate the arbitrary-space foundation consumed by CharacteristicClasses C1.2b; TS3.5 designates the proper finite-fiber interface.

## Layer 0: Module coefficients and derived sections

### 0.1 Constant-ring adapter and the cohomology comparison

Construct the equivalence between sheaves of R-modules and modules over R_X, where R_X is the constant ring sheaf (its sections are locally constant functions). On a section, a locally constant scalar acts by gluing its constant actions on its level sets. The inverse restricts the ring action along constant sections. Compare these functors with the native ring-sheaf module forgetful functors, and transport the supplier's Godement resolution, including its augmentation and restriction maps, through this equivalence (Stacks, §20.30, Lemmas 20.30.1–20.30.2, tags 0FKS–0FKT, pp.65–66; the equivalence is the constant-ring specialization).

- Prove the unit and counit are natural isomorphisms, compatible with open restriction and stalks. Every stalk ring of R_X is R; its ring of global sections need not be R.
- Coefficient restriction along a ring homomorphism R→S commutes with the underlying additive sheaf and sections. Define extension of scalars by sheafifying S⊗_R F; use it as an exact functor only when S is flat over R.
- Transport the augmented Godement complex and its flasqueness and section-cohomology comparison, preserving the scalar action and open restriction. No assertion that its terms are injective is required.

**Checks.**

- On a point, the equivalence sends the module ℤ to itself and the transported resolution has H⁰=ℤ, Hⁿ=0 for n>0. This distinguishes a resolution from a complex with an extra positive-degree summand.
- On two discrete points with R=ℤ, Γ(R_X)=ℤ², the constant-section map is r↦(r,r), and (2,3) acts on (a,b) by (2a,3b). Identifying Γ(R_X) with R would lose this action.
- For the identity ring map ℤ→ℤ, both scalar adapters send the module ℤ/2 to itself. For the flat map ℤ→ℚ, extension sends ℤ to ℚ and ℤ/2 to 0, and the sequence 0→ℤ --2→ ℤ→ℤ/2→0 becomes 0→ℚ --2→ ℚ→0, still exact.
- For R=0 every unital R-module and both sides of the equivalence are zero. For ℤ→𝔽₂, tensoring the injection 2:ℤ→ℤ gives the zero map 𝔽₂→𝔽₂; extension of scalars cannot be asserted exact without flatness.

Use Γ_R=`CategoryTheory.Sheaf.Γ` and its native right derived functors. Prove `moduleCohomologyForgetComparison`: for every n≥0 on any topological X, V RⁿΓ_R and `CategoryTheory.Sheaf.functorH` after U are naturally isomorphic. Normalize degree zero by evaluation of sections, prove compatibility with connecting homomorphisms and restriction to opens, and identify multiplication by r with the cohomology map of the scalar endomorphism r:F→F. One route is to use the transported flasque resolution, observe that its underlying abelian terms are flasque, and apply the abelian acyclicity theorem to the same sections complex (Stacks, Lemmas 20.12.2–20.12.3, tags 09SX–09SY, pp.18–19, and §20.3, p.3). This is a comparison of derived theories, not an inference that U preserves injectives.

- Prove that a bounded-below Γ_R-acyclic resolution computes the native right derived functors of Γ_R: the sections complex of any such resolution is quasi-isomorphic to that of an injective resolution, naturally in the resolved sheaf and compatibly with the connecting homomorphisms of short exact sequences, and the flasque module sheaves form a class to which this applies, since every module sheaf embeds in one, cokernels of monomorphisms between them are flasque and Γ_R is exact on short exact sequences of them (Stacks, Derived Categories, Lemma 13.15.6, tag 05T8, p.56, and Lemma 13.16.7, tag 015E, p.59; Stacks, Lemma 20.12.3, tag 09SY, pp.18–19). The native right derived functors are defined through injective resolutions, so this comparison is proved here and is what lets the transported Godement sections compute them.

**Checks.**

- For a point and R=ℤ/4, both degree-zero groups are ℤ/4, multiplication by 2 sends 1 to 2 on both sides, and higher groups are zero. The transported Godement sections complex on a point is ℤ/4 in every degree with differentials alternately 0 and the identity, so its H⁰ is ℤ/4 and its Hⁿ, n>0, is 0, the values the acyclic-resolution comparison must return.
- The ℤ/2-module ℤ/2 is injective over the field ℤ/2; its underlying abelian group is not injective, since 1∈ℤ/2 has no half. Both derived section theories at a point still have H¹=0.
- On X=∅ the section module and all derived groups are zero, including for nonzero R. This checks the terminal-open normalization at the empty space.

*Needs:* Mathlib native sheaves, ring-sheaf modules, sheafification, Γ and right derived functors with the Conventions hypotheses; the acyclic-resolution comparison of this section; SchemeAndStackFoundations §2.5; Tau Ceti abelian flasque acyclicity and terminal evaluation comparison.

### 0.2 Bounded-below derived sections

Specialize native bounded-below derived functors to Γ_R and identify their cohomology with sections of bounded-below injective or flasque resolutions. For a complex F fix one b∈ℤ with F^q=0 for q<b. Use finite-diagonal totalization of the transported Godement resolution; prove its comparison with the injective model and with underlying abelian hypercohomology (Stacks, §20.3, equations (20.3.0.1)–(20.3.0.3), p.3; Lemma 20.30.2, tag 0FKT, p.66).

- Construct comparison maps for complex maps; homotopic maps induce the same maps. A quasi-isomorphism induces an isomorphism after derived sections.
- Compare shifts, cone triangles and their long exact sequences, with the native shift convention. Degree-zero complexes recover §0.1.
- Compare truncations within the bounded-below range. A total degree m receives only indices b≤q≤m and p=m−q≥0 in a resolution double complex; no infinite-diagonal exchange is used.

**Checks.**

- On a point the complex ℤ --2→ ℤ in degrees 0,1 has H⁰=0 and H¹=ℤ/2 in both the section and resolution models.
- The identity two-term complex ℤ --1→ ℤ is acyclic; replacing its differential by zero would give ℤ in each degree and fail quasi-isomorphism invariance.
- For F=ℤ in degree 0, F[1] has ℤ in degree −1. For the two-term differential 2, shifting by 1 changes it to −2; leaving it as +2 is the wrong native shift convention.

*Needs:* §0.1; native bounded-below derived-functor, homotopy, cone and shift interfaces; SchemeAndStackFoundations §2.5's Godement resolution applied degreewise.

### Examples

The two-point scalar action distinguishes R from Γ(R_X). The point complex with differential 2 distinguishes additive cohomology from scalar-exactness claims. Neither example needs Hausdorffness as a hypothesis of the general coefficient comparison.

### Dependencies

Mathlib's sheaf and derived-functor infrastructure, Tau Ceti's abelian acyclicity and terminal comparison, and SchemeAndStackFoundations §2.5. No compact-space, singular-chain or K-sheaf comparison is an input.

## Layer 1: Cover refinements and compact derived comparisons

### 1.1 Fixed-cover complexes and raw refinements (TS1.1)

For a u-small indexed family of opens U_i and an R-module presheaf P on arbitrary X, use the native tuple complex with degree p term the product of P(U_i₀∩⋯∩U_iₚ). Construct its ordered-subset presentation: choose a well-ordering of the index type (every type admits one) and take the product over strictly increasing tuples with the alternating differential; the comparison with the tuple complex is a homotopy equivalence, including repeated indices, and uses no division by factorials (Stacks, Definitions 20.23.1–20.23.2 and Lemmas 20.23.3–20.23.6, tags 01FH–01FM, pp.40–43). Two well-orderings give isomorphic ordered complexes, the isomorphism acting on each coordinate by the sign of the permutation that reorders the tuple (Stacks, Remark 20.23.5, tag 01FL, p.41). Equivalently, tensor the term of each index subset with its orientation line, the rank-one module spanned by the two orientations of the subset with their sum zero; the chosen order trivializes every orientation line, and this order-free form is the one used by Pardon (footnote 42, p.119). For n opens the ordered presentation is zero in degrees p≥n; for the empty family every degree is zero.

- A raw refinement V→U is an actual index function a with V_j⊆U_a(j), represented by a native formal-coproduct morphism. It induces a cochain map C(U;P)→C(V;P), with identity and composition laws.
- Construct the prism homotopy between the maps of any two raw refinements a and b, with h listing a before b in each term. Fix its sign by T_b−T_a=δh+hδ. The authority for this sign is the computation in Stacks §20.25, which ends with the map for the second index function minus the map for the first; the displayed equation of Stacks §20.15 prints that difference with the two maps interchanged, and on the two-index point cover below it would give a−b instead of b−a, so it is not to be followed. Prove coefficient naturality, compatibility with restrictions to open subspaces and with further refinements (Stacks, §20.15, tag 09UY, p.24, for the maps and laws; §20.25, equation (20.25.0.2) and the computation following it, pp.46–47, for the sign).
- Compare the ordered and tuple maps and homotopies. The ordered-subset formulation handles the orientation sign when a refinement reorders indices or collapses a tuple; collapsed alternating components are zero. The covering condition is needed for the subsequent cohomology comparison, not for these constructions.

**Checks.**

- On a point, the repeated two-index cover has ordered complex ℤ²→ℤ, (a,b)↦b−a. Its H⁰ is the diagonal ℤ and H¹=0. A sum in place of the difference fails to kill the diagonal.
- Refining that cover by the singleton cover gives two maps T₀(a,b)=a and T₁(a,b)=b. They differ on (0,1), with values 0 and 1, while h is the identity ℤ→ℤ on degree 1 and hδ(a,b)=b−a. Their maps on H⁰ both send (a,a) to a; the raw maps themselves are not equal.
- The empty family gives 0, the one-element ordered complex has only degree 0, and the two-element ordered complex is zero in degree 2. The tuple complex of a one-element cover still has terms in every nonnegative degree, with differentials 0,1,0,1,…; it is homotopy equivalent to, not termwise equal to, the ordered version.
- For three repeated point-cover indices, a refinement selecting index 2 sends (2,3,5) to 5; refining again by the sole point still gives 5, equal to the composite index map. The identity refinement preserves (2,3,5).
- The unique refinement from the empty cover induces the unique map into the zero complex; the identity of that empty complex is zero. A phantom empty-cover generator would give an incorrect extra ℤ.
- Reduction ℤ→𝔽₂ commutes with refinement and differential: on (2,3), reducing b−a gives 1, while first reducing gives (0,1) with difference 1.
- Reversing the chosen order of the two indices multiplies the ordered degree-one coordinate by −1, the sign of the transposition; over 𝔽₂ this is +1 and the comparison still works. No factor 1/2 is available there. The orientation line of a two-element set has the two orderings as generators with sum zero, so either generator identifies it with the coefficient ring and the two identifications differ by −1.

*Needs:* Mathlib native tuple Čech and formal coproducts; module products, alternating-face complexes and homotopies. No layer requiring compactness is an input.

### 1.2 Small cofinal cover systems (TS1.2)

For arbitrary X use point-neighborhood covers U:X→Opens X with x∈U_x. Their set is u-small. Every u-small open cover is refined by such a cover by choosing, for each point, a member containing it. Intersect two chosen neighborhoods pointwise to obtain a common refinement. On compact X also use the u-small system of finite indexed covers in Σ n:ℕ, (ULift(Fin n)→Opens X), with repeats and the empty family included. Prove that it is cofinal: a u-small open cover of a compact space has a finite subcover, an enumeration of it is a finite indexed cover, and the inclusion of the subcover is a refinement. Only compactness in Mathlib's sense, `CompactSpace`, which includes no separation axiom, is used; the source states this for locally compact Hausdorff spaces (Pardon, Lemma A.4.4, p.120; Stacks, §20.15, pp.24–25; Pardon, Remark A.4.1, p.119; the explicit universe-small cover systems are an adapter).

Define Čech cohomology as the filtered colimit, in R-modules, of the cohomology of fixed-cover complexes on the preorder ordered by existence of refinement. Use §1.1's homotopies to define its transition maps independently of the chosen index function. This is the general arbitrary-space cohomological-colimit interface; on each fixed cover §1.1 compares the tuple complex with the ordered and the order-free complexes, so the colimit may be computed with any of them.

- Prove that two u-small cofinal cover systems give canonically isomorphic colimits, constructing the comparison and its inverse through common refinements, and that the point-neighborhood system is cofinal among all u-small open covers of any X.
- Prove coefficient naturality, compatibility with restriction to open subspaces (using their own point-indexed systems), and compatibility with each fixed-cover structure map. No filteredness is asserted of the raw category of refinement functions.
- Ordinary negative degrees are zero. For a sheaf, degree zero is its section module, with the map induced by its augmentation (Pardon, Definition A.4.3, p.119; Stacks, Lemma 20.9.2, tag 01EG, pp.9–10). Prove that on the empty space every degree vanishes, for every presheaf P, including one with P(∅)≠0: the empty family covers ∅ and refines every cover of ∅, its complex is zero in every degree, and a colimit over a directed preorder with a greatest element is the value there (the sheaf case is Pardon, Remark A.4.2, p.119).

**Checks.**

- For a point and the repeated cover, the two raw refinements of §1.1 act as the same identity on ℤ in degree zero. No map from a nonempty refining cover can equalize their distinct constant index functions, so raw filteredness would be false.
- For two discrete points with stalk modules A and B, the singleton cover gives C⁰=A×B and all positive cohomology zero. Restriction to either point is its coordinate projection, not the diagonal.
- For X=ℚ with the subspace topology, Hausdorff but not locally compact, the cover by the sets (n,n+2)∩ℚ for n∈ℤ has no refinement by a finite cover: a finite cover refining it has union inside finitely many of these bounded sets, which is not ℚ. Choosing for each rational a member containing it gives a point-neighborhood refinement, so the point-neighborhood system is cofinal where the finite-cover system is not.
- On the Sierpiński space {0,1} with {1} open, every cover contains the whole space, so the one-set cover is cofinal and the colimit is P(X) in degree 0 and zero above, for every presheaf P. The point-neighborhood cover {X,{1}} gives the ordered complex P(X)×P({1})→P({1}), (a,b)↦b−(a restricted to {1}), whose H⁰ is the graph of restriction, isomorphic to P(X), and whose H¹ is 0, as cofinal-system independence requires on this non-Hausdorff space. The one-set cover is a finite cover refining every cover, so the finite-cover system is cofinal on this compact non-Hausdorff space, as compactness alone predicts.
- On X=∅ with P(∅)=ℤ, the one-set cover {∅} has ordered complex P(∅)=ℤ in degree 0 and nothing above, so its H⁰ is ℤ; the empty family refines it and has the zero complex, so the colimit is 0 in every degree. A cover system that omitted the empty family would return ℤ in degree 0.

*Needs:* §1.1; Mathlib finite subcovers of `CompactSpace`; small module colimits and exactness of filtered colimits.

### 1.3 Compact Hausdorff Čech/derived comparison

For every R-module sheaf F on compact Hausdorff X construct the canonical isomorphism Čechⁿ(X;F)≅RⁿΓ_R(F) for all n≥0, compatible with the underlying abelian comparison of §0.1. Use fixed-cover augmentation into a flasque resolution and descend its cohomology maps through §1.2. A proof route is finite simultaneous shrinking, local lifting of cocycles, and the universal delta-functor comparison (Stacks, Lemma 20.16.2, tag 09V2, pp.26–28; the R-linear statement transports that abelian proof through §0.1).

- Construct the connecting homomorphism by locally lifting a cocycle after refinement and taking its differential. Prove independence of the lift, the refinement function and the covering, and identify it with the native derived connecting map.
- For a fixed cover whose every nonempty finite intersection has Hʲ(U_I;F)=0 for j>0, prove that its augmentation computes the derived groups. Without that hypothesis only the all-cover comparison is asserted (Stacks, Lemma 20.11.6, tag 01ET, p.15).
- Prove that an R-module presheaf P with P(∅)=0 and zero sheafification has zero cover-colimit Čech cohomology on compact Hausdorff X. A cocycle involves finitely many tuple-intersection sections in each degree; local annihilation, simultaneous shrinking and the ordered comparison kill it after refinement. Apply this to the locally zero kernel and cokernel of P→P^# to compare P and P^#. This presheaf extension uses the shrinking argument of the proof of Stacks, Lemma 20.16.2, pp.26–28, and keeps the zero-empty-value hypothesis explicitly.
- Prove degree-zero normalization, coefficient naturality, restriction, finite coproduct compatibility and agreement with the native sheaf long exact sequence and Mayer–Vietoris connecting maps. These are properties of the constructed maps, not arbitrary isomorphisms of groups.

**Checks.**

- For the constant sheaf ℤ on S¹, the two-arc cover computes Čech¹=ℤ and R¹Γ(S¹;ℤ)=ℤ; the comparison identifies these two groups. The one-set cover has H¹=0 and is not acyclic, so the fixed-cover statement does not apply to it.
- On {a,b}, let P(∅)=ℤ and P(U)=0 for nonempty U, with zero restriction maps into P(∅). Then P^#=0. The singleton cover has C⁰=0, C¹=ℤ²; its cocycles are (u,−u), giving Čech¹=ℤ, while Čech¹(P^#)=0. This excludes sheafification invariance without P(∅)=0.
- On {a,b}, let P({a,b})=ℤ and all other values be zero. It has P(∅)=0 and P^#=0; the nonzero degree-zero sections from the one-set cover become zero on the singleton cover. This tests local annihilation rather than objectwise vanishing of P.
- For X=∅ both sides are zero; for a point both degree-zero modules are F(point) and all positive groups vanish. For R=0 all comparisons are between zero modules.

*Needs:* §§0.1, 1.1–1.2; SchemeAndStackFoundations §2.5's flasque Čech vanishing; native sheaf exact sequences; compact Hausdorff finite shrinking and its simultaneous intersection version, proved here by finite refinements in the cited argument.

### 1.4 Bounded-below hypercohomology and its two spectral sequences

For a complex F of sheaves on compact Hausdorff X with F^q=0 for every q<b for one b∈ℤ, form the double complex of each finite cover with the total convention above. Define Čech hypercohomology as the directed colimit over open covers of the cohomology of these totals. By §1.2 the finite covers are cofinal, so the colimit may equally be taken over all u-small open covers. Construct its natural isomorphism to the bounded-below derived sections of §0.2 (Stacks, §20.25, equations (20.25.0.1)–(20.25.0.2), pp.46–47, and Lemmas 20.25.1–20.25.2, tags 08BN and 0FLH, pp.47–48; the compact all-cover conclusion also uses §1.3).

- Construct the first spectral sequence from the filtration of each total complex by internal degree, which both δ and d respect. On a fixed cover its E₁ is the fixed-cover Čech cohomology of the terms of F with d₁ induced by d; after the colimit, indexing here with p the internal and q the Čech degree, E₁^(p,q)=Čech^q(X;F^p), converging to hypercohomology in degree p+q (compare Pardon, Lemma A.4.13, p.122, for the compact-cover form on locally compact Hausdorff spaces). Construct the second, with E₂^(p,q)=H^p(X;ℋ^q(F)) converging to the same abutment. For it, first use the cohomology presheaf of F; its empty value is zero, so §1.3 identifies its cover-colimit groups with those of its sheafification ℋ^q(F). These are open-sheaf/derived comparisons; no homotopy K-sheaf input is required.
- The refinement prism lowers Čech degree by one and preserves internal degree. Therefore the filtration by internal degree has refinement-independent maps from E₁ onwards, and the filtration by Čech degree from E₂ onwards. Construct pagewise filtered colimits only from these pages; pass differentials and kernels/images by exactness of filtered module colimits (Stacks, §20.25's prism computation, pp.46–47, with the filtration consequence proved here).
- Prove strong convergence of both sequences and of the pagewise construction: on total degree m the internal degree ranges over b,…,m and the Čech degree is the complement in m, so the translated first-quadrant diagonal has length at most m−b+1 when m≥b, and is empty when m<b. Incoming and outgoing differentials stabilize uniformly for r>m−b+1, together with the finite abutment filtrations. Prove naturality, bounded-complex specialization, shifts, cones and truncation comparison. The pagewise refinement construction, both sequences and the two native derived comparisons are the targets here.

**Checks.**

- On a point, F=(ℤ --2→ ℤ) in degrees 0,1 gives hypercohomology H⁰=0, H¹=ℤ/2. The first sequence has differential 2 on its only Čech row; the second has the lone nonzero term H⁰(point;ℤ/2)=ℤ/2 at bidegree (0,1).
- In a commuting unit square with δ=d=1, the two paths in D² from bidegree (0,0) contribute −1 and +1, summing to zero. The unsigned total would give 2. At (p,q)=(1,1), conjugation (-1)^(pq) is −1, whereas it is +1 at (0,1); this pins the exchange with d+(-1)^q δ.
- With b=−1 and m=1 there are exactly three possible bidegrees, (p,q)=(0,1),(1,0),(2,−1); r>3 suffices for stabilization. With m=−2 the diagonal is empty. With no common lower bound, (p,q)=(k,−k) gives infinitely many terms in degree 0, so this proof does not assert unbounded convergence.
- For F in internal degree zero and the repeated point cover, the two refinement maps on Čech degree-zero cochains are projections ℤ²→ℤ with values 0 and 1 on (0,1). They agree only after the Čech differential is taken: their maps on diagonal H⁰ are both the identity. Thus the Čech-degree filtration's E₁ need not descend to the cover preorder.

*Needs:* §§0.2, 1.1–1.3; finite-diagonal totalization and the two double-complex filtrations; exact small filtered colimits in modules. The uniform lower bound is required in the statement, not inferred from boundedness at individual stalks.

### Examples

Repeated covers test the difference between chain maps and cohomology maps. The two discrete presheaves in §1.3 distinguish the necessary empty-value condition from local vanishing. The two-term point complex and the commuting unit square test torsion, total signs and the first pages on which refinement maps are well-defined.

### Dependencies

Layer 0 only for the derived comparisons in §§1.3–1.4. Sections 1.1–1.2 require native sheaves/presheaves, complexes and module colimits. Compact shrinking enters §1.3; the uniform lower bound enters §1.4. Compactness alone enters the finite-cover cofinality of §1.2. No other roadmap supplies Layer 1 beyond the native libraries; CharacteristicClasses supplies nothing.

## Layer 2: Proper finite-fiber stalks

### 2.1 Canonical product-of-stalks comparison (TS3.5)

For every continuous f:X→Y and sheaf F of R-modules define `fiberStalkMap` from (f_*F)_y to the product of F_x over x with f(x)=y. Its x-coordinate is the native pushforward-stalk map after transport along that equality. Thus it sends the germ at y of a section on f⁻¹(V) to its germs at all points of the fiber. This definition needs neither properness nor finite fibers (Mathlib, `TopCat.Presheaf.stalkPushforward` and its germ formula).

- Prove coefficient-sheaf naturality and the germ-coordinate identity. These determine the map by the product universal property.
- Prove the identity-map formula and the composition formula, identifying the fiber of g∘f with the disjoint union of the f-fibers over the g-fiber and reindexing the product accordingly.
- Prove `properFiniteFiberStalk`: for Hausdorff X, proper f and finite fibers, this actual map is an isomorphism, for every Y. Given finitely many germs, choose pairwise disjoint neighborhoods of the fiber points, which Hausdorffness of X provides, on which they have representatives; f is a closed map, so the complement of the image of the complement of their union is an open neighborhood V of y with f⁻¹(V) inside the union, and gluing over the disjoint pieces supplies a preimage. The same shrinking applied to equal germs proves injectivity. Neither local compactness of X or Y nor separation of Y enters; the source states its lemmas under a standing convention that spaces are locally compact Hausdorff (Pardon, Convention A.0.1, p.113; Lemma A.3.2, p.118, and the separated finite-fiber refinement argument in the proof of Lemma A.4.8, p.121; the native stalk-map identification and the hypotheses as stated are this roadmap's).

**Checks.**

- The map {a,b}→point with F having stalks ℤ and ℤ/2 gives the identity ℤ×ℤ/2→ℤ×ℤ/2, sending (3,1) to (3,1). The zero map or the interchange of the two coordinates cannot satisfy the germ formula.
- For the empty source the map is 0→0. For the identity of a point with stalk M it is id_M, including M=0. No nonempty-fiber premise is needed.
- The inclusion (0,1)→ℝ has finite fibers but is not proper. For the constant integral sheaf its pushforward stalk at 0 is ℤ and the product over the empty fiber is 0. The canonical map ℤ→0 is not an isomorphism.
- For {a,b,c}→{u,v}→point with a,b over u and c over v and all stalks ℤ, the direct comparison sends (2,3,5) to (2,3,5); the iterated comparison sends it to ((2,3),5). The product-reindexing map identifies these exact values.
- Over 𝔽₂ the two-point map still gives id on 𝔽₂². There is no averaging or division by the number of fiber points in this theorem.
- For X=Y=ℚ with the subspace topology, Hausdorff but not locally compact, and f the identity, both sides at 0 are the stalk F₀ and the map is its identity: the isomorphism needs no local compactness.
- For the line with two origins folded onto ℝ, a closed map with finite fibers from a non-Hausdorff space, the constant sheaf ℤ has pushforward stalk ℤ at 0, since the inverse image of every interval around 0 is connected, while the product over the two origins is ℤ²; the canonical map is the diagonal and is not surjective, so Hausdorffness of X cannot be dropped.

*Needs:* Mathlib native sheaf pushforward, stalks, germ maps and products; separation of a finite subset in a Hausdorff space; closedness of proper maps. No cover-colimit, group invariants, K-sheaf or derived comparison is an input.

### Examples

The two-point projection fixes the coordinate map. The nonproper open inclusion separates finite fibers from the additional closed-neighborhood control. Composition over a three-point source fixes the direction and indexing of the naturality maps.

### Dependencies

Mathlib topological sheaves, proper and closed maps and module products. Layer 2's topology argument is independent of Layers 0–1; its scalar and universe conventions are the same.

## Downstream consumers

CharacteristicClasses C1.2b consumes the arbitrary-space TS1.1–TS1.2 maps, homotopies and cohomological colimit. ImplicitAtlases §0.7 can consume TS1.2 for open-cover Čech cohomology of sheaves on locally compact Hausdorff spaces and §1.4 for the bounded-below open-cover hypercohomology and its first spectral sequence, identifying its compact-cover K-presheaf hypercohomology with them through its §0.6. The compact derived comparisons expose those same fixed-cover structure maps to users of module-sheaf derived cohomology. Finite-fiber applications can use the native stalk isomorphism without adding invertible-order assumptions; invariant cohomology comparisons have their separate hypotheses in their owner's scope.

## References

- The Stacks Project, [Cohomology of Sheaves](https://stacks.math.columbia.edu/chapter/20): §20.3 (derived functors), §20.12 (flasque sheaves), §20.15 (refinements; its displayed homotopy equation has the two refinement maps interchanged, see §1.1), Lemma 20.16.2 (compact Hausdorff comparison), §§20.23 and 20.25 (ordered Čech complexes and complexes of sheaves), and §20.30 (Godement resolution). Individual tags and printed chapter pages are attached to the targets.
- The Stacks Project, [Derived Categories](https://stacks.math.columbia.edu/chapter/13): Lemma 13.15.6, tag 05T8, p.56 (a class of objects acyclic for a right derived functor) and Lemma 13.16.7, tag 015E, p.59 (a bounded-below complex of acyclic objects computes the derived functor).
- J. Pardon, [An algebraic approach to virtual fundamental cycles on moduli spaces of pseudo-holomorphic curves, arXiv:1309.2370v6](https://arxiv.org/abs/1309.2370v6), Appendix A: Convention A.0.1, p.113; Lemma A.3.2, p.118; Remark A.4.1, Remark A.4.2, Definition A.4.3 and footnote 42, p.119; Lemma A.4.4, p.120; Lemma A.4.8, p.121; Lemma A.4.13, p.122. These locators refer to version 6. The source works on locally compact Hausdorff spaces with compact-cover hypercohomology; the arbitrary-space cover system, the compactness-only finite-cover cofinality, the open-cover hypercohomology, the native coefficient presentation and the explicit pagewise colimits are the extensions specified above.
