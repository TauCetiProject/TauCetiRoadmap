# Roadmap: locally analytic representations of p-adic reductive groups

**Summary.** This roadmap builds the representation theory of p-adic Lie groups on locally convex vector spaces over a finite extension E of ℚ_p, and in particular of the groups G = 𝐆(L) of rational points of reductive groups over a finite extension L of ℚ_p, that the locally analytic p-adic Langlands programme runs on. It starts from the compact distribution algebras, coadmissible modules, admissibility and Banach duality of PadicLocalLanglandsForGL2Qp §0.1, the enveloping algebra inside the distribution algebra of LocallyAnalyticDistributionsPartII §1.1, the uniform groups and p-valuations of NoncommutativeAndEquivariantIwasawa Layer 0, the locally analytic vectors of CompletedCohomologyPartII F.4, the Jacquet modules of OverconvergentAutomorphicForms §0.6 and the smooth theory of SmoothRepresentationsOfLocalGroups. The foundations (Layers 0–3) construct the distribution algebra D(G, E) of a non-compact group and its module structure on locally analytic representations, the Schneider–Teitelbaum anti-equivalence between admissible representations and coadmissible D(G, E)-modules, locally algebraic representations, the Ext groups Ext^i_G(V_1, V_2) = Ext^i_(D(G,E))(V_2′, V_1′) with Breuil's identification of Ext¹ with admissible extensions, very strong admissibility, Pan's derived functors of locally analytic vectors with the strong LA-acyclicity of admissible Banach representations, and solid representations of p-adic Lie groups and locally profinite groups with their solid locally analytic vectors. Layer 4 develops the parabolic BGG categories O^p_alg over the split Lie algebra g ⊗_(ℚ_p) E that the later layers need. The structure theory (Layers 5–7) builds locally analytic parabolic induction and Schraen's spectral sequence for Ext into an induction, the Orlik–Strauch functors F^G_P(M, π_P) in Breuil's locally ℚ_p-analytic form with their exactness, irreducibility criterion and Jordan–Hölder series, and Emerton's closed induction with the adjunction theorems of Emerton and Breuil. The application (Layers 8–10) is Ding's computation of the extension groups of the locally analytic principal series of GL_n(L): the representations π_alg(φ, h) ⊆ π_1(φ, h) ⊆ π(φ, h), the bijections ζ_w : Hom(T(L), E) ≅ Ext¹_w, the formula dim_E Ext¹(π_alg(φ, h), π_1(φ, h)) = n + (2^n − 1)[L:ℚ_p], their compatibility with parabolic induction and their decomposition over the embeddings of L into E. These are the GL_n-side inputs of PadicHodgeParametersInLocallyAnalyticRepresentations.

## Scope and ownership

This roadmap owns:

- the restriction of scalars of the L-analytic group 𝐆(L) to a ℚ_p-analytic group and the decomposition of its Lie algebra over the embeddings Σ_L; locally analytic representations of locally analytic groups on barrelled spaces, the action of U(g ⊗_F E) by derivation and its decomposition over Σ_L; the distribution algebra D(G, E) of a non-compact group, its module structure on locally analytic representations, the duality between representations of compact type and nuclear Fréchet D(G, E)-modules, matrix coefficients, the theorem that weakly null sequences are null over a spherically complete field, and completed external tensor products (Layer 0);
- coadmissible D(G, E)-modules for non-compact G, strongly admissible and topologically irreducible representations, the anti-equivalence of admissible representations of a non-compact group with coadmissible D(G, E)-modules and its abelian category, admissibility of completed external tensor products, locally algebraic representations, the Ext groups of admissible representations, Breuil's identification of Ext¹ with extensions, dual-number structures on self-extensions and tautological and universal extensions, and Schraen's Ext between locally algebraic representations (Layer 1);
- admissible Banach representations that are not required to be unitary, very strongly admissible representations, Pan's derived functors R^iLA of locally analytic vectors on Banach representations, their long exact sequences and the strong LA-acyclicity of admissible Banach representations (Layer 2);
- the comparison of classical Banach, Smith, Fréchet and LB spaces with solid E-vector spaces, and solid representation theory: solid representations of quasi-Stein analytic groups (analytified affine groups and their quasi-compact affinoid open subgroups) and of locally profinite groups, smooth and λ-smooth objects, solid locally analytic vectors and their derived functor, integrable LB Lie representations (Layer 3);
- highest-weight theory over a split reductive Lie algebra over a field of characteristic zero for arbitrary rational highest weights, by descent from an algebraic closure (the dominant integral modules themselves being ReductiveGroups §9A, item 5), the parabolic BGG categories O^p_alg, generalised Verma modules, the restricted BGG duality, the low-length Verma multiplicities for products of gl_n, and Kostant homology of nilradicals (Layer 4). This roadmap is the single owner of the BGG category O of finitely generated modules over split reductive Lie algebras over a field of characteristic zero and of its parabolic subcategories: generalised Verma modules with their simple quotients, the extension of the library's Verma modules and simple quotients to reductive algebras and arbitrary rational weights, the classification of the simple objects of O^p_alg and the finite length of its objects, for every block and every standard parabolic. Kac's category O of a Kac–Moody algebra, defined by finite-dimensional weight spaces and weights in finitely many cones λ_j − Q_+, with its integrable part, is KacMoody §3.3; the O here differs in requiring finite generation and in carrying the parabolic and algebraic subcategories of a split reductive group, and for semisimple 𝔤 it is the full subcategory of finitely generated objects of KacMoody's O for the Cartan matrix of 𝔤. A roadmap working in a single block imports these objects from Layer 4 and owns only its block-specific statements: SpringerResolutionAndCharacteristicCycles owns the strict central reduction of the principal block, its orbit labels and the Beilinson–Bernstein localisation, not the modules themselves. For sl_2 this places M(0), M(−2), their simple quotients and the length-two composition series of M(0) here, and the localisation of these modules on ℙ¹ there;
- locally analytic parabolic induction and principal series, Ext between locally analytic characters of a split torus, homology of locally analytic representations under a unipotent radical, and Schraen's spectral sequence (Layer 5);
- the Orlik–Strauch functors in their locally ℚ_p-analytic form with exactness, transitivity, irreducibility, Jordan–Hölder series and socles, their extension to products of groups over different fields, and the vanishing of Ext¹ into inductions from weights of length at least two (Layer 6);
- the compact-support adjunction for Emerton's Jacquet module, the Jacquet modules of very strongly admissible representations, Emerton's closed induction, balanced maps and the adjunction theorems of Emerton and Breuil (Layer 7);
- for GL_n(L) and a generic smooth character φ with a strictly dominant weight h: the extension groups of the locally algebraic representation π_alg(φ, h) by the locally analytic principal series, its constituents and the amalgam π_1(φ, h), the maps ζ_w : Hom(T(L), E) → Ext¹(π_alg, π_1) and the dimension n + (2^n − 1)[L:ℚ_p] (Layer 8); their compatibility with parabolic induction from Levi blocks and the amalgamation of the two endpoint parabolics (Layer 9); and their decomposition over the embeddings σ ∈ Σ_L by locally σ-analytic representations (Layer 10).

It leaves the following to the roadmaps named, and does not restate them.

- **Compact distribution algebras.** The Fréchet algebra D(H, E) of a compact locally analytic group with its Dirac distributions, convolution and open-subgroup comparisons (D(H, E) is free over D(H′, E) on the Dirac distributions of coset representatives), the F-analytic quotient D_(ℚ_p)(H, E) → D_F(H, E), the Fréchet–Stein property of D(H, E) with Banach stages and flat transitions, its coadmissible modules, the faithful flatness of E[[H]] → D(H, E), and the duality between admissible Banach representations of compact groups and finitely generated E[[H]]-modules (PadicLocalLanglandsForGL2Qp §0.1); the coadmissible-module theory of a general Fréchet–Stein algebra (LocallyAnalyticDistributionsPartII §1.4) and the Banach radius algebras D_r(H, E) in ordered coordinates (§1.5); the embedding x ↦ x̃ of U(g ⊗ E) into D(H, E) (§1.1), crossed products over open normal subgroups (§1.2) and the Arens–Michael envelope 𝒰(g) (§2.5).
- **Uniform groups and p-valuations.** Uniform pro-p groups, compact p-adic analytic groups with an open normal uniform subgroup, freeness of completed group algebras over open subgroups, ordered coordinates, p-valuations with ordered bases and saturation (NoncommutativeAndEquivariantIwasawa §§0.1–0.3, 0.6–0.7).
- **Already in the libraries.** Tau Ceti's `TauCeti.AnalyticStage` (`TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean`) and `TauCeti.LocallyAnalytic` (`TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`) are the Banach analytic coefficient stages on ℤ_p with values in a complete ultrametric ℤ_p-module and their algebraic direct limit, with evaluation into C(ℤ_p, E); no topology is put on the limit, and nothing for a general locally analytic manifold or a non-commutative group is defined there. They are the one-variable case of the function spaces of PadicLocalLanglandsForGL2Qp §0.1 at the level of underlying vector spaces; Layer 0 uses the latter.
- **Admissibility and analytic vectors of admissible Banach representations.** Admissible locally analytic representations of a locally analytic group, defined by restriction to a compact open subgroup and independent of it, the anti-equivalence of admissible representations of a compact group with coadmissible D(H, E)-modules, compact-type/nuclear Fréchet duality, the category of admissible unitary Banach representations with its Schikhof duality, and the density, exactness, admissibility and dual base change D(H, E) ⊗_(E[[H]]) B′ of the locally analytic vectors of an admissible unitary Banach representation (PadicLocalLanglandsForGL2Qp §0.1, after Schneider–Teitelbaum 2003, Theorems 6.3 and 7.1). For an admissible Banach representation of a non-compact group that is not unitary, these statements are applied after restriction to a compact open subgroup, on which every continuous Banach representation has a bounded open invariant lattice.
- **Locally analytic vectors.** The locally ℚ_p-analytic vectors V^la of a continuous representation, with their topology from the fixed-radius analytic stages, compact-open restriction, the differentiated Lie algebra action, the locally F_v-analytic variant, and the derived functor RLA(V) = RΓ_cts(H, C^la(H, V)) on general continuous representations (CompletedCohomologyPartII F.4); the admissible unitary Banach category with its compact-open test (CompletedCohomologyPartII F.1).
- **Character spaces and Emerton's Jacquet module.** The rigid character space Ẑ of a topologically finitely generated abelian locally analytic group with its product decomposition and Mellin map, essentially admissible representations, the finite-slope part, the averaged Hecke operators and the locally analytic Jacquet module J_P with its M-action, independence of N_0, left exactness, preservation of essential admissibility, the smooth comparison J_P(V) = V_N, the locally algebraic comparison J_P(X ⊗_B W) ≅ X_N ⊗_B W^N and the coherent sheaf on T̂ attached to J_B of an admissible representation (OverconvergentAutomorphicForms §0.6, after Emerton's Jacquet I, §§3–4, and Emerton's memoir, §6.4).
- **Analytic charts on rational points.** The analytic manifold structure of 𝐆(L) for a smooth affine group 𝐆 over L, with analytic group law and tangent space identified with the dual of the cotangent space (ReductiveGroupsPartII RG2.0.2, target *smooth-group-analytic-charts*); the Iwasawa decomposition and the Iwahori factorisation (RG2.4.4, RG2.4.2).
- **Smooth representations.** Smooth and admissible representations over any coefficient ring, smooth induction, Jacquet modules and Jacquet's lemma, modulus characters and the Bernstein centre (SmoothRepresentationsOfLocalGroups SR.0–SR.3).
- **Lie theory.** Verma modules and their simple quotients for a Lie algebra with nondegenerate Killing form and a split Cartan subalgebra over a field of characteristic zero, Weyl's complete reducibility and complete reducibility for reductive Lie algebras with semisimple central action (Tau Ceti, listed in the supplier contracts); the classification of finite-dimensional irreducibles by dominant integral highest weight and the Harish-Chandra isomorphism over an algebraically closed field of characteristic zero (Tau Ceti); PBW, the centre of U(g) and reductive Lie algebras and gl_n (LieHighestWeight Layers 3, 7 and 9); the finite-dimensional simple modules of dominant integral highest weight of a split reductive Lie algebra over any field of characteristic zero, with their base change to an algebraic closure (ReductiveGroups §9A, item 5, *The split-field producer used here*); Kostant's theorem on the cohomology of a nilradical over a splitting field (ArithmeticLocallySymmetricSpaces ALS.4.5).
- **Locally convex foundations.** Nonarchimedean locally convex spaces, limits, strict morphisms, completed tensor products, the Hahn–Banach theorem over a spherically complete field and the Fréchet open mapping theorem (LocallyAnalyticDistributions §§0.0, 0.2); quasi-Stein spaces with Theorems A and B (AdicSpacesPartIII §R3.4); solid E-vector spaces over the analytic ring E_■ (VStackSheavesAndLisseCategories §VS2.2).
- **GL_2(ℚ_p) special cases.** The locally algebraic vectors of an admissible unitary Banach representation of GL_2(ℚ_p) with their decomposition by algebraic type, and the locally analytic principal series of GL_2(ℚ_p) with its central character, its special subrepresentation and St^an (PadicLocalLanglandsForGL2Qp §§2.4 and 4.8); 1.6 and 5.2 state the constructions for a split reductive 𝐆 over L and specialise to them.

Not in this roadmap: the trianguline variety and its local model (TriangulineVarietyAndItsLocalModel); the comparison of these extension groups with Galois deformations and the p-adic Hodge parameters themselves (PadicHodgeParametersInLocallyAnalyticRepresentations); completed cohomology and its locally analytic vectors as global objects (CompletedCohomologyPartII, CompletedCohomologyAndLocalGlobalCompatibility); the Beilinson–Bernstein localisation of category O on flag varieties; locally analytic generalised Steinberg representations; and the dimension theory of coadmissible modules.

## Conventions

1. **Fields.** L/ℚ_p is finite (Ding writes K), d_L = [L:ℚ_p], and E/ℚ_p is a finite extension containing the image of every embedding σ : L → E; Σ_L is the set of these embeddings. Then L ⊗_(ℚ_p) E ≅ ∏_(σ∈Σ_L) E, g ⊗_(ℚ_p) E ≅ ∏_σ g_σ with g_σ = g ⊗_(L,σ) E. |·|_L is the normalised absolute value, |ϖ_L|_L = p^(−f) where f is the residue degree of L. A finite extension of ℚ_p is spherically complete and discretely valued.
2. **Analyticity.** Unqualified "locally analytic" means locally ℚ_p-analytic. Locally L-analytic and locally σ-analytic are named when meant. The L-analytic structure of 𝐆(L) is the one of ReductiveGroupsPartII RG2.0.2, given by algebraic charts; the topology and the group law alone do not determine it.
3. **Representations and duals.** Representation spaces are barrelled Hausdorff locally convex E-spaces; admissible representations are of compact type. The strong dual V′_b is a left D(G, E)-module through the contragredient action, (g·λ)(v) = λ(g⁻¹v); so a central character χ on V becomes χ⁻¹ on V′.
4. **Extensions.** Ext^i_G(V_1, V_2) := Ext^i_(D(G,E))(V_2′, V_1′) in the abelian category of all left D(G, E)-modules. Topological homology under a unipotent radical is Kohlhaase's bar construction; it is not identified with the dual of abstract Tor on V′.
5. **Induction and Jacquet modules.** Inductions are unnormalised: (Ind_P^G U)^an = {f : f(pg) = p·f(g)} with G acting by right translation. In the GL_n application induction is from the lower Borel B⁻ and Jacquet modules are for the upper Borel B. The Hecke operator of a contracting m ∈ M⁺ on V^(N_0) is the average [N_0 : mN_0m⁻¹]⁻¹ Σ_(n∈N_0/mN_0m⁻¹) nm (OverconvergentAutomorphicForms §0.6). With δ_P(m) = |det(Ad(m)|n_P)|_L, the inverse index [N_0 : mN_0m⁻¹]⁻¹ equals δ_P(m) for contracting m. Witness: for GL_2(ℚ_p), P = B, N_0 = N(ℤ_p), m = diag(p, 1), the index is p, δ_B(m) = p⁻¹, and the averaged operator is the identity on the trivial representation.
6. **Weights and permutations.** T ⊆ B is diagonal in upper triangular; θ = (0, −1, …, 1 − n); λ = h − θ for a strictly dominant h; w(φ)_i = φ_(w⁻¹(i)). The constituent C(w, s_(i,σ)) carries the subset label w⁻¹({1, …, i}). A category-O input of weight −s·λ corresponds to the inducing character of weight +s·λ. The Weyl transition identity is ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1), where a permutation u acts on characters of T(L) by (u·ψ)_i = ψ_(u⁻¹(i)). Witness: for n = 3, w_1 = 1, w_2 = (1 2 3) and ψ supported on the first coordinate, (1 2 3)·ψ is supported on the second coordinate, so ζ_((123))(ψ_2) = ζ_1(ψ_1).
7. **Characters.** η = 1 ⊠ |·|_L ⊠ ⋯ ⊠ |·|_L^(n−1) = |·|_L⁻¹ ∘ θ; δ_B = |·|_L^(n−1) ⊠ ⋯ ⊠ |·|_L^(1−n); ε = N_(L/ℚ_p)(·)|·|_L. Hom, Hom_sm and Hom_σ denote the spaces of locally ℚ_p-analytic, smooth and locally σ-analytic additive characters into E; z^μ is the algebraic character diag(t_i) ↦ ∏_(σ,i) σ(t_i)^(μ_(σ,i)).
8. **Solid coefficients.** A strongly inaccessible cardinal κ bounds all profinite sets. Mod(E) is the category of solid E-vector spaces over E_■ = (E, O_E)_■; E keeps its p-adic topology. A discrete group M_disc does not give the coefficients a discrete topology. For a group over ℚ_p, O_(𝔾_r,E) := O_(𝔾_r) ⊗_(ℚ_p) E.
9. **Endpoints.** The endpoint parabolics of block sizes n − 1 and 1 require n ≥ 2.

## Exact supplier contracts

### From Mathlib

- `Ext` (`Mathlib/CategoryTheory/Abelian/Ext.lean`, in the root namespace): the Ext functors of an R-linear abelian category with enough projectives, as left derived functors of Hom through projective resolutions, here on `ModuleCat` over D(G, E); and `CategoryTheory.Abelian.Ext` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`): the Ext groups of an abelian category with `HasExt`, as shifted morphisms in the derived category, with their long exact sequences. Either computes the Ext groups of 1.7.
- `BarrelledSpace`, `BaireSpace.instBarrelledSpace`, `WithSeminorms.banach_steinhaus` and `PolynormableSpace.banach_steinhaus` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean`): barrelled spaces over a nontrivially normed field, defined by continuity of every lower semicontinuous seminorm, the barrelledness of every topological vector space that is a Baire space (in particular Banach and Fréchet spaces over E), and the Banach–Steinhaus theorem that a pointwise bounded family of continuous linear maps from a barrelled space to a space with a generating family of seminorms is equicontinuous. These hold over the nonarchimedean field E; what remains to be supplied is gap:barrelled-banach-steinhaus below.
- `DualNumber` and `DualNumber.eps` (`Mathlib/Algebra/DualNumber.lean`): the coefficient ring E[ε]/(ε²) of self-extensions.
- `UniversalEnvelopingAlgebra` and `UniversalEnvelopingAlgebra.lift` (`Mathlib/Algebra/Lie/UniversalEnveloping.lean`): U(g) and its universal property.
- `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`): continuous group cohomology with coefficients in a `TopRep`; used for compact groups with Banach coefficients.
- `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`) and `IsUltrametricDist`: carriers of analytic groups and nonarchimedean norms. Nothing here asserts that these carry locally analytic representation theory.

### From Tau Ceti

- `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`): the completed group algebra O_E[[H]] of a profinite group, the integral model of the Iwasawa algebra E[[H]] = E ⊗_(O_E) O_E[[H]].
- `TauCeti.VermaModule` and `TauCeti.irreducibleQuotient` (`TauCeti/Algebra/Lie/HighestWeight/Verma.lean`): Verma modules and their simple quotients for a finite-dimensional Lie algebra with nondegenerate Killing form, a Cartan subalgebra acting triangularisably and a chosen base, over a field of characteristic zero (not assumed algebraically closed); Layer 4 transports them to split reductive algebras by letting the centre act through the weight, without a second definition.
- `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`TauCeti/Algebra/Lie/HighestWeight/Existence.lean`): a finite-dimensional irreducible module of a Killing Lie algebra over an algebraically closed field of characteristic zero has a unique dominant integral highest weight.
- `TauCeti.exists_isCompl_of_isKilling` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`): Weyl's complete reducibility for finite-dimensional modules of a Killing Lie algebra over a field of characteristic zero; `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center` (`TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean`): complete reducibility of a finite-dimensional module of a Lie algebra over a field of characteristic zero on which the centre acts triangularisably by semisimple operators.
- `TauCeti.harishChandraIso` and `TauCeti.vermaCentralCharacter_eq_iff` (`TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean`): the Harish-Chandra isomorphism from the centre of U(g) to the dot-invariants, and the criterion that two Verma modules have the same central character exactly when their highest weights are dot-conjugate, over an algebraically closed field of characteristic zero.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.0 (*Locally convex spaces and separation*, *Locally convex limits*, *Strict maps and the quasi-abelian categories*, *Projective tensor and separated completion*, *Inductive tensor and Fréchet comparison*, *Compact-type tensor comparison*): nonarchimedean locally convex spaces as spaces with a basis of open O_E-lattices, their limits, strict morphisms and completed tensor products; for spaces V_1, V_2 of compact type over a spherically complete field, the agreement of the completed inductive and projective tensor products, the compact-type limit V_1 ⊗̂ V_2 = lim_n V_(1,n) ⊗̂ V_(2,n), and its strong dual V_1′_b ⊗̂ V_2′_b, a nuclear Fréchet space (Emerton's memoir, Propositions 1.1.31–1.1.32, pp. 18–19). §0.2 (*The nonarchimedean Hahn–Banach theorem*, *Fréchet open mapping*, *Extensions of spaces of compact type*): norm-preserving extension of functionals over a spherically complete field, openness of surjections between Fréchet spaces, and the three-space property for compact type.

What LocallyAnalyticDistributions must provide (gap:barrelled-banach-steinhaus): for nonarchimedean locally convex E-spaces in the sense of §0.0, the comparison of barrelledness in the lattice sense (every closed O_E-lattice is open) with Mathlib's `BarrelledSpace` over E, and of pointwise boundedness and equicontinuity of families of continuous linear maps in the lattice sense with the hypothesis and the conclusion of `PolynormableSpace.banach_steinhaus`; and the barrelledness of spaces of compact type and of locally convex inductive limits of barrelled spaces (Schneider, Nonarchimedean functional analysis, §6). Barrelledness of Banach and Fréchet spaces and the Banach–Steinhaus theorem itself are Mathlib's, listed above.

What LocallyAnalyticDistributions must provide (gap:compact-type-tensor): for spaces of compact type over a finite extension of ℚ_p, the completed tensor product of §0.0 (*Compact-type tensor comparison*) is functorial in each variable and exact in each variable on strict short exact sequences of spaces of compact type, equivalently the completed projective tensor product with a nuclear Fréchet space is exact on strict short exact sequences of nuclear Fréchet spaces.

### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII

§1.1 (*The enveloping algebra inside D(G, K)*): for x ∈ g the distribution x̃ (f ↦ (d/dt) f(exp(tx))|_(t=0)), the injective E-algebra map U(g ⊗ E) → D(H, E) extending x ↦ x̃, its independence of the uniform subgroup, the conjugation formula δ_g ∗ x̃ ∗ δ_(g⁻¹) = (Ad(g)x)~ and the density of the span of Dirac distributions; these are stated there for a compact locally ℚ_p-analytic group. §1.3: for a compact open subgroup H of the ℚ_p-points of a connected linear algebraic group, the image of the centre of U(g) lies in the centre of D(H, E). §1.2: D(H, E) as the crossed product D(H′, E) ∗ (H/H′) over an open normal subgroup H′. §1.4: for a Fréchet–Stein algebra A over a complete nonarchimedean field, not necessarily commutative, with Banach stages A_n: Theorems A and B, the isomorphisms A_n ⊗_A M ≅ M_n for coadmissible M and the flatness of each A_n over A, the canonical Fréchet topology of a coadmissible module, continuity and strictness of A-linear maps between coadmissible modules, the equivalence of coadmissibility of a submodule, closedness of the submodule and coadmissibility of the quotient, coadmissibility of finitely generated submodules of coadmissible modules and of finitely presented modules, closedness of finitely generated left ideals, and, for a continuous map A → B of Fréchet–Stein algebras making B a coadmissible A-module, the agreement of coadmissibility over B and over A for B-modules. §1.5: for a compact group H with a saturated p-valuation of finite rank and an ordered basis satisfying Schneider–Teitelbaum's condition (HYP), the expansion of every distribution in the ordered monomials b^α of b_i = h_i − 1, the norms ‖·‖_r for 1/p ≤ r < 1, the Banach algebras D_r(H, E) completed for them, and, for r ∈ p^ℚ ∩ (1/p, 1), their identification with the noetherian Banach stages of the Fréchet–Stein algebra D(H, E) of PadicLocalLanglandsForGL2Qp §0.1. §2.5: the Arens–Michael envelope 𝒰(g), a Fréchet–Stein algebra and the strong dual of the germs at e of analytic functions, with injective dense U(g) → 𝒰(g) and the cofinal comparisons of 𝒰(g) with the distribution algebras of a shrinking system of polydisc subgroups.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

§0.1: uniform pro-p groups and their lower p-series. §0.2: compact p-adic analytic groups as profinite groups with an open normal uniform subgroup, every compact ℚ_p-analytic group having one. §0.3: for H′ ⊆ H open, the completed group algebra of H is free of rank [H : H′] over that of H′, so finite generation over E[[H]] and over E[[H′]] agree. §0.6: the ordered coordinates c : ℤ_p^d → U of a uniform group, with U^(p^n) = c(p^nℤ_p^d). §0.7: p-valuations of finite rank, ordered bases, saturation and the explicit valuation ω_U of a uniform group; these give the compact open subgroup G_0 with an integral saturated p-valuation and an ordered basis, the subgroups G_n = G_0^(p^n) and the coordinates in which the Banach spaces C^an(G_n, ℚ_p) of Layer 2 are defined.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

§0.1: locally analytic functions LA(X, E) on locally analytic manifolds, including non-compact ones through compact charts, with their strong duals; compact-type/nuclear Fréchet duality; D(H, E) for compact H with Dirac, convolution, pushforward, completed projective tensor (D(H_1 × H_2, E) = D(H_1, E) ⊗̂ D(H_2, E)) and open-subgroup comparisons, the latter making D(H, E) free over D(H′, E) on the Dirac distributions of coset representatives; for locally F-analytic functions the F-linear chart condition and the quotient D_(ℚ_p)(H, E) → D_F(H, E) of the underlying ℚ_p-analytic distribution algebra; the Fréchet–Stein property of D(H, E), with noetherian Banach stages and flat transitions; coadmissible D(H, E)-modules with independence of the cofinal sequence and the abelian and exact finite-stage theory; faithful flatness on both sides of E[[H]] → D(H, E), which contains its injectivity (density of the span of Dirac distributions is LocallyAnalyticDistributionsPartII §1.1); admissibility of a locally analytic representation of a locally analytic group G, tested on a compact open subgroup and independent of it; the anti-equivalence of admissible representations of compact H with coadmissible D(H, E)-modules; the category of admissible unitary Banach representations and the Schikhof duality between admissible Banach representations of a compact H and finitely generated E[[H]]-modules; and, for an admissible unitary Banach representation Π, density of Π^an in Π, exactness of Π ↦ Π^an, admissibility of Π^an and (Π^an)′ ≅ D(H, E) ⊗_(E[[H]]) Π′ (Schneider–Teitelbaum 2003, Theorem 7.1).

### From TauCetiRoadmap.CompletedCohomologyPartII

F.1: admissible unitary Banach representations of a compact p-adic analytic group through lattices, admissibility tested on any compact open subgroup. F.4: the locally analytic vectors V^la of a continuous representation by analytic orbit maps, with the topology from fixed-radius analytic stages, compact-open restriction, the differentiated action of g and the F_v-analytic variant; the derived functor RLA(V) = RΓ_cts(H, C^la(H, V)) and its comparison with V^la in degree 0. V-valued locally analytic functions on compact charts are used in the form of F.4.

### From TauCetiRoadmap.OverconvergentAutomorphicForms

§0.6: the full character space Ẑ of a topologically finitely generated abelian locally L-analytic group Z ≅ Z_0 × ℤ^a, its strictly quasi-Stein representative Ẑ_0 × 𝔾_m^a, the Mellin map D(Z, E) → O(Ẑ) (continuous, injective, dense image), essentially admissible representations (independence of the compact open subgroup, admissible ⇒ essentially admissible, abelian category, coherent duality for abelian G), the finite-slope part V_fs = L_(b,Z⁺)(O(Ẑ), V) with evaluation, its universal property for representations with a Z-stable BH exhaustion and left exactness, the averaged Hecke operators of Convention 5, and the locally analytic Jacquet module J_P(V) = (V^(N_0))_fs with its locally analytic M-action, independence of N_0, left exactness, preservation of essential admissibility, J_P(π) = π_N for admissible smooth π, J_P(X ⊗_B W) ≅ X_N ⊗_B W^N for X admissible smooth and W finite-dimensional algebraic, and the coherent sheaf on T̂ dual to J_B of an essentially admissible representation of a split group.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0.2 (*points-topological-group*, *smooth-group-analytic-charts*): the topological group 𝐆(L) and its analytic manifold structure with analytic group law and tangent space Lie(𝐆). RG2.0.3 (*general-linear-points-homeomorphism*): GL_n(L) with the point topology is GL_n(L) with the units topology of M_n(L). RG2.4.2 (*iwahori-factorization*): compact open subgroups with Iwahori factorisation N̄_0 M_0 N_0. RG2.4.4 (*iwasawa-decomposition*): G = P·K_0 for a special maximal compact K_0, so P\G is compact.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.0.1 (*is-smooth*, *smooth-vectors*), SR.0.2 (*smooth-rep-abelian*), SR.0.4 (*admissible*, *smooth-character*), SR.0d.1 (*grothendieck-abelian*), SR.0d.2 (*central-ext-vanishing*), SR.2.1 (*smooth-induction*, *compact-induction*, *induction-exactness*, *induction-in-stages*), SR.2.2 (*modulus-character*, *jacquet-module*, *jacquet-lemma*, *principal-series-jacquet*), SR.2.3 (*jacquet-invariants*), SR.3.1 (*finite-length*, *generic-irreducibility*), SR.3.2 (*bernstein-centre-blocks*), SR.3.4 (*steinberg*). Coefficients are an arbitrary commutative ring in SR.0–SR.2 and ℂ in SR.3.

What SmoothRepresentationsOfLocalGroups must provide (gap:generic-principal-series-finite-coefficients): for GL_n(L), a field E of characteristic zero and a smooth character φ : T(L) → E^× with φ_iφ_j⁻¹ ∉ {1, |·|_L} for i ≠ j, the unnormalised induction (Ind_B⁻^(GL_n(L)) φη)^∞ is absolutely irreducible with End = E and is isomorphic to the induction of w(φ)η for every w ∈ S_n by E-rational intertwining isomorphisms (Bernstein–Zelevinsky), the explicit criterion that the Zariski-open statement of SR.3.1 *generic-irreducibility* does not supply.

What SmoothRepresentationsOfLocalGroups must provide (gap:principal-series-jacquet-finite-coefficients): over a field E of characteristic zero and for φ as in the previous gap, the unnormalised Jacquet module for N⁻ of (Ind_B⁻^(GL_n(L)) φη)^∞ is the direct sum ⊕_(w∈S_n) w(φ)η of pairwise distinct characters, and the Jacquet module for the upper N is ⊕_w w(φ)ηδ_B, the E-valued unnormalised form of SR.2.2 *principal-series-jacquet*.

What SmoothRepresentationsOfLocalGroups must provide (gap:finite-length-finite-coefficients): over a finite extension E of ℚ_p, smooth parabolic induction of an admissible finite-length representation of a Levi has finite length, with compatibility with extension of scalars to ℂ along an embedding E ↪ ℂ, the E-valued form of SR.3.1 *finite-length* (1).

What SmoothRepresentationsOfLocalGroups must provide (gap:ordered-character-map): over a finite extension E of ℚ_p and for generic φ, let π_sm = (Ind_B⁻ φη)^∞, let 𝒵 be the Bernstein centre over E of its block and x ∈ Spec 𝒵 its point, let 𝒵_j be the Bernstein centre over E of the block of φ_j as a character of L^× (so Spec 𝒵_j is the torus of unramified twists of φ_j), and for w ∈ S_n let X_w = ∏_(i=1)^n Spec 𝒵_(w⁻¹(i)), whose points are the ordered tuples (φ′_i) with φ′_i an unramified twist of φ_(w⁻¹(i)), among them w(φ). The morphism 𝒥_w : X_w → Spec 𝒵 sends (φ′_i) to the point of (Ind_B⁻ (⊠_i φ′_i)η)^∞, so 𝒥_w(w(φ)) = x; for u = w_2w_1⁻¹ the isomorphism p_u : X_(w_1) → X_(w_2), (φ′_i) ↦ (φ′_(u⁻¹(i))), satisfies p_u(w_1(φ)) = w_2(φ) and 𝒥_(w_2) ∘ p_u = 𝒥_(w_1), equivalently 𝒥_(w_1)^* = p_u^* ∘ 𝒥_(w_2)^* : 𝒵 → O(X_(w_1)) on rings of functions; and the map θ from Ext¹_sm(π_sm, π_sm) to the tangent space of Spec 𝒵 at x, which sends a self-extension to the derivation at x by which 𝒵 acts on it, is injective and sends the class of the first-order deformation (Ind_B⁻ w(φ)η(1 + ψε))^∞, a self-extension of π_sm through the intertwining isomorphism of gap:generic-principal-series-finite-coefficients, to d𝒥_w(ψ), where ψ ∈ Hom_sm(T(L), E) is read as the tangent vector of X_w at w(φ) given by the deformation (w(φ)_i(1 + ψ_iε))_i and d𝒥_w is the tangent map of 𝒥_w at w(φ) (Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, Lemma 3.22, p. 47, for 𝒵 as the Weyl-invariant functions on the cuspidal component over E).

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.RepresentationTheory.LieHighestWeight

ReductiveGroups Layer 1 (finite-dimensional algebraic representations as comodules), Layer 2 (the Lie algebra and the adjoint representation, and the differential of a representation), Layer 4 (diagonalizable groups and tori, with their character lattices), Layer 7 (parabolic subgroups, Levi decompositions and Weyl groups of split reductive groups), Layer 8, §8.1 (split reductive groups with a specified split maximal torus and its character lattice; the lattice depends on the group, not on its Lie algebra or Dynkin diagram, as for SL_2 and PGL_2) and Layer 10, §10B (for a split connected reductive group over a field: the induced modules ∇(λ), the one-dimensional highest-weight line of weight λ, the simple socle L(λ) for dominant λ, and the classification of the simple rational modules by their dominant highest weights). ReductiveGroups Layer 9, §9A, item 5 (*The split-field producer used here*): for a split Lie algebra with nondegenerate Killing form over any field K of characteristic zero and a dominant integral weight λ, the finite-dimensional simple module L_K(λ) built from the contravariant form on the Verma module, with its base-change isomorphism K̄ ⊗_K L_K(λ) ≅ L_K̄(λ) and its highest line, extended componentwise to a reducible derived algebra and by a prescribed character on the centre; it introduces no second Verma or simple-quotient definition. LieHighestWeight Layer 3 (PBW and Verma modules M(μ) with their simple quotients L(μ)), Layer 7 (the centre of U(g), the Harish-Chandra homomorphism and the dot action) and Layer 9 (reductive Lie algebras, their enveloping centres and gl_n). The classification of finite-dimensional irreducibles and complete reducibility, which LieHighestWeight takes from the library, are the Tau Ceti declarations listed above, with the field hypotheses stated there; Layer 4.1 here extends them to arbitrary rational highest weights of split reductive algebras over any field k of characteristic zero.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

ALS.4.5 (*Kostant's theorem over a splitting field*): H^q(n_P, V_λ) ≅ ⊕_(w∈W^P, ℓ(w)=q) V^M_w·λ as algebraic M-representations, over a characteristic-zero field splitting 𝐆 = Res_(F/ℚ)G.

What ArithmeticLocallySymmetricSpaces must provide (gap:kostant-split-reductive): the statement of ALS.4.5 for an arbitrary split connected reductive group over a field of characteristic zero with a parabolic P = MN containing a Borel, not only for base changes of Weil restrictions of groups over number fields; ALS.4.5's descent proof uses only the split group.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

§VS2.2, target *Solid nonarchimedean coefficients*: the analytic ring E_■ for a finite extension E/ℚ_p, the abelian category Mod(E) of solid E-vector spaces with closed solid tensor product, derived internal Hom and analytic scalar extension; §VS2.1, target *derived-solid-tensor*.

### From TauCetiRoadmap.AdicSpacesPartIII and TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

AdicSpacesPartIII §R3.4 (*quasi-stein-space*, *quasi-stein-theorems-a-b*): quasi-Stein spaces and Kiehl's Theorems A and B. PadicMeasuresIwasawaAlgebras Layer 1 (§1.7): integral measures on a profinite group and the completed group algebra.

## How to read the build

Layer 0 makes locally analytic representations of a non-compact group into modules over D(G, E); Layer 1 isolates the admissible ones, identifies them with coadmissible modules and defines their Ext groups; Layer 2 relates them to Banach representations and their locally analytic vectors; Layer 3 is the solid version used in higher Coleman theory and is not needed by Layers 4–10. Layer 4 is pure Lie algebra over E: it uses none of Layers 0–3 and none of them uses it (the algebraic representations of Layer 1 come from ReductiveGroups §10B and LieHighestWeight directly), so it can be built alongside them, and Layers 5–10 use it. Layer 5 builds parabolic induction and the spectral sequence that computes Ext into an induction; Layer 6 cuts the Orlik–Strauch representations out of inductions; Layer 7 relates maps into a representation to its Jacquet module, in the order compact-support adjunction (7.1), closed induction (7.2), balanced maps (7.3), Emerton's adjunction theorem (7.4), its consequences for Jacquet modules of very strongly admissible representations (7.5) and Breuil's adjunction (7.6). Layers 8–10 assemble these into Ding's extension groups for GL_n(L): Layer 8 builds the principal series, its constituents, the maps ζ_w and their images; Layer 9 needs Layer 8 for each Levi block of a parabolic and transports it by parabolic induction; Layer 10 specialises the constructions of Layers 8 and 9 along the splitting g ⊗ E = ∏_σ g_σ.

Identifiers of the former numbering, used by citing roadmaps, correspond to the sections here as follows.

| Former numbering | Here |
|---|---|
| LR.0 | Layer 0 |
| LR.1 | Layer 1 |
| LR.2 | Layer 2 |
| LR.3 | Layer 3 |
| LR.4 | Layer 5 |
| LR.4/locally-analytic-induction | §5.1 |
| LR.4/principal-series | §5.2 |
| LR.4/torus-ext | §5.3 |
| LR.4/unipotent-homology | §5.4 |
| LR.4/schraen-spectral-sequence | §5.5 |
| LR.5 | Layer 6 |
| LR.5/orlik-strauch-functor | §6.1 |
| LR.5/orlik-strauch-exactness | §6.2 |
| LR.5/orlik-strauch-transitivity | §6.3 |
| LR.5/orlik-strauch-irreducibility | §6.4 |
| LR.5/orlik-strauch-jordan-holder | §6.5 |
| LR.5/orlik-strauch-products | §6.6 |
| LR.5/ext-vanishing-long-weyl | §6.7 |
| LR.6 | Layer 7 |
| LR.7 | Layer 8 |
| LR.8 | Layer 9 |
| LR.9 | Layer 10 |
| §7.2 (Jacquet modules of very strongly admissible representations) | §7.5 |
| §7.3 (closed induction) | §7.2 |
| §7.4 (balanced maps) | §7.3 |
| §7.5 (Emerton's adjunction theorem) | §7.4 |

## Layer 0: Locally analytic representations and the distribution algebra of a non-compact group

This layer passes from the L-analytic group 𝐆(L) to its underlying ℚ_p-analytic group, defines locally analytic representations on barrelled spaces with their Lie algebra action, builds the distribution algebra D(G, E) of a non-compact group as a locally convex direct sum of compact distribution algebras, makes every locally analytic representation a separately continuous D(G, E)-module, and proves the duality between representations of compact type and nuclear Fréchet modules. It closes with continuity of matrix coefficients, the theorem that weakly null sequences are null over a spherically complete field, and completed external tensor products of representations of compact type. Throughout, F ∈ {ℚ_p, L} is the field of analyticity.

### 0.1 The ℚ_p-analytic group of L-points and its Lie algebra over E

Let 𝐆 be a smooth affine group scheme of finite type over L and G = 𝐆(L) with the L-analytic structure of ReductiveGroupsPartII RG2.0.2 (*smooth-group-analytic-charts*), whose tangent space at 1 is g = Lie(𝐆). Prove: (i) restriction of scalars along ℚ_p ⊆ L makes G a locally ℚ_p-analytic group of dimension d_L·dim 𝐆, whose ℚ_p-Lie algebra is g regarded as a ℚ_p-space; an L-analytic chart U ⊆ L^d is a ℚ_p-analytic chart of ℚ_p^(d·d_L); (ii) for a closed immersion 𝐆 ↪ GL_N, G is a closed analytic subgroup of GL_N(L) with Lie algebra Lie(𝐆) ⊆ gl_N(L) and the commutator bracket; (iii) for a parabolic P = M_P N_P and a maximal torus T of a reductive 𝐆, the subgroups P(L), M_P(L), N_P(L), T(L) are closed analytic subgroups with Lie algebras p, m_P, n_P, t; (iv) the map L ⊗_(ℚ_p) E → ∏_(σ∈Σ_L) E, x ⊗ y ↦ (σ(x)y)_σ, is an isomorphism of E-algebras, hence g ⊗_(ℚ_p) E ≅ ∏_σ g_σ as E-Lie algebras and U(g ⊗_(ℚ_p) E) ≅ ⊗_σ U(g_σ) (Breuil, socle I, §2, (3), p. 7; Schneider, p-adic Lie groups, §13, p. 90, for GL_n(L) as an open subset of L^n²).

The proof route for (ii) applies the analytic inverse function theorem to N² − d defining equations with independent differentials near each point (Schneider, p-adic Lie groups, Proposition 6.4, pp. 42–43); the multiplication and inversion of 𝐆(L) are restrictions of those of GL_N(L). For (iv), L/ℚ_p is separable and E contains all its conjugates, so the Chinese remainder theorem splits L ⊗_(ℚ_p) E. The L-analytic structure is canonical relative to algebraic charts only: for a nontrivial automorphism τ of a Galois extension L/ℚ_p, transporting the additive chart of 𝔾_a(L) by τ gives the same topological group with a different L-analytic structure.

*Needs:* ReductiveGroupsPartII RG2.0.2 (*smooth-group-analytic-charts*, *points-topological-group*), RG2.0.3 (*general-linear-points-homeomorphism*); ReductiveGroups Layer 2 (Lie algebra); Mathlib `LieGroup`.

**Checks.**

- For 𝐆 = GL_n, G is the open subset GL_n(L) ⊂ M_n(L) and g = gl_n(L); over ℚ_p its dimension is n²d_L.
- For L ≠ ℚ_p and 𝐆 = 𝔾_m, G = L^× has L-dimension 1 and ℚ_p-dimension d_L, and Lie(G) ⊗_(ℚ_p) E ≅ E^(Σ_L); for L = ℚ_p(√p), p odd, the two embeddings send √p to ±√p and (√p ⊗ 1) ↦ (√p, −√p).
- Degenerate case: for the trivial group the analytic manifold is a point of dimension 0 and U(g ⊗ E) = E.
- For a nontrivial τ ∈ Gal(L/ℚ_p), the τ-transported chart on L is ℚ_p-analytic but its transition to the identity chart, x ↦ τ(x), is not L-linear; this is why (i) is stated for the algebraic charts.

### 0.2 Locally analytic representations

Let G be a locally F-analytic group (by 0.1 when F = ℚ_p) and E a finite extension of ℚ_p containing F. Define a locally F-analytic representation of G over E to be a barrelled Hausdorff locally convex E-vector space V (LocallyAnalyticDistributions §0.0; gap:barrelled-banach-steinhaus) with an action of G by continuous E-linear maps such that for every v ∈ V the orbit map g ↦ g·v is a locally F-analytic V-valued function, that is, on a cover by charts it is given by convergent power series with coefficients in a BH-subspace of V (Schneider–Teitelbaum 2002, §3, p. 12). Morphisms are continuous G-equivariant E-linear maps; write Rep^(la)_E(G), or Rep^(F-la)_E(G) when F must be named. V is of compact type, LB or Banach when its underlying space is. Equivalently, V is barrelled and the inclusion of the locally analytic vectors of CompletedCohomologyPartII F.4 into V is a bijection (Emerton's memoir, Definition 3.6.9, p. 72).

API:

- For barrelled V the action map G × V → V is jointly continuous: each g acts continuously, orbit maps are continuous, and the operators of a compact subset of G are equicontinuous by Banach–Steinhaus (Mathlib `PolynormableSpace.banach_steinhaus` through the lattice comparison of gap:barrelled-banach-steinhaus; Schneider–Teitelbaum 2002, §3, p. 12).
- Morphisms form an additive E-linear category; closed G-stable subspaces of a representation of compact type, and the quotients by them, are again locally analytic representations of compact type.
- Restriction along a locally analytic homomorphism H → G, in particular to a closed analytic subgroup, is a functor Rep^(la)_E(G) → Rep^(la)_E(H).
- A locally L-analytic representation is locally ℚ_p-analytic, and the inclusion of categories is full.
- A smooth representation of G (SmoothRepresentationsOfLocalGroups SR.0.1, *is-smooth*) of countable dimension, with its finest locally convex topology, is locally analytic with locally constant orbit maps.
- A finite-dimensional algebraic representation of 𝐆 ×_L E (ReductiveGroups Layer 1), restricted to G, is locally L-analytic: its orbit maps are polynomial in matrix entries.

*Needs:* 0.1; LocallyAnalyticDistributions §0.0; Mathlib `BarrelledSpace`, `PolynormableSpace.banach_steinhaus` with gap:barrelled-banach-steinhaus; CompletedCohomologyPartII F.4 (V-valued locally analytic functions and locally analytic vectors); PadicLocalLanglandsForGL2Qp §0.1 (spaces of compact type); SmoothRepresentationsOfLocalGroups SR.0.1; ReductiveGroups Layer 1.

**Checks.**

- Degenerate case: V = 0, and more generally any barrelled V with trivial action, is locally analytic.
- For p odd and G = ℤ_p, the character a ↦ (1 + p)^a = exp(a·log(1 + p)) on V = E is locally ℚ_p-analytic: its orbit map is a power series converging on all of ℤ_p.
- Non-example: translation of ℤ_p on the Banach space C(ℤ_p, E) is continuous but not locally analytic; the orbit map of f = Σ_(n≥1) p^n 1_(p^n+p^(2n)ℤ_p) is not locally analytic, since f is continuous, vanishes at points accumulating at 0 and equals p^n at p^n, so it is given by no power series near 0 (a power series with infinitely many zeros in a closed disc vanishes there).
- Non-example: for L ≠ ℚ_p and an embedding σ : L → E different from the chosen inclusion, the character x ↦ σ(x) of L^× on E is locally ℚ_p-analytic, but its derivative at 1 is σ, not L-linear for the chosen L-structure on E, so it is not locally L-analytic.
- Compatibility: for a smooth representation π of countable dimension with its finest locally convex topology, the locally analytic structure has the same underlying G-module and locally constant orbit maps.
- Banach–Steinhaus over a nonarchimedean field: for E = ℚ_2 and the operators x ↦ ax of E, a ∈ ℤ_2, both formulations give the same answer, sup_a |ax| = |x| pointwise and operator bound 1, the lattice ℤ_2 being mapped into itself; the operators x ↦ 2^(−n)x, n ≥ 0, are not pointwise bounded (|2^(−n)| = 2^n at x = 1) and not equicontinuous. A formulation that changed the answer between lattices and seminorms on this Banach space would be wrong.

### 0.3 The action of the enveloping algebra and its decomposition over embeddings

Let V be a locally F-analytic representation of G with F-Lie algebra g. The differentiated action x·v = (d/dt)(exp(tx)·v)|_(t=0) of g on V is the one of CompletedCohomologyPartII F.4. Prove: (i) x ↦ (v ↦ x·v) is an F-linear Lie algebra homomorphism g → End_cont(V) and extends uniquely to an E-algebra homomorphism U(g ⊗_F E) → End_cont(V) (Mathlib `UniversalEnvelopingAlgebra.lift`); (ii) g(x·v) = (Ad(g)x)·(g·v) for g ∈ G; (iii) morphisms of locally analytic representations commute with this action; (iv) for F = ℚ_p, U(g ⊗_(ℚ_p) E) = ⊗_σ U(g_σ) by 0.1 (iv), so the action splits into commuting actions of the g_σ, σ ∈ Σ_L; (v) after 0.5, x acts as the image in D_F(G, E) of the distribution x̃ ∈ D_(ℚ_p)(G, E) of LocallyAnalyticDistributionsPartII §1.1 (0.4 (iv)). On spaces of functions with the left regular action the convention is (x·f)(g) = (d/dt) f(exp(−tx)g)|_(t=0) (Breuil, socle I, §2, (5), p. 8; Schneider–Teitelbaum 2002, §§2–3, pp. 9–13).

The proof route differentiates analytic orbit maps: for fixed x the difference quotients are pointwise bounded continuous operators on the barrelled V, so Banach–Steinhaus gives continuity of their limit; differentiating the commutator and conjugation identities gives (i) and (ii). These steps use only the analytic charts; (v) is a later compatibility, proved from the integration formula of 0.5.

API:

- The bracket relation x·(y·v) − y·(x·v) = [x, y]·v and the uniqueness of the extension to U(g ⊗_F E).
- Ad-equivariance g ∘ x ∘ g⁻¹ = Ad(g)x as operators on V.
- Naturality: every morphism f of locally analytic representations satisfies f(x·v) = x·f(v).
- For F = ℚ_p, the components g_σ act by commuting operators and U(g_σ) for different σ commute.

*Needs:* 0.1, 0.2; CompletedCohomologyPartII F.4 (differentiated Lie action); LocallyAnalyticDistributionsPartII §1.1 (for (v)); Mathlib `UniversalEnvelopingAlgebra`, `UniversalEnvelopingAlgebra.lift`, `PolynormableSpace.banach_steinhaus`; gap:barrelled-banach-steinhaus.

**Checks.**

- Degenerate case: on a smooth representation the action of g is zero.
- For G = ℚ_p^× and χ(x) = x^k on E, the element 1 ∈ g = ℚ_p acts by k; for the smooth character x ↦ |x|_p it acts by 0.
- For G = L^× (F = ℚ_p) and χ(x) = σ(x)^k, the component g_τ acts by k when τ = σ and by 0 when τ ≠ σ; for L = ℚ_p(√p) and k = 1 the two components act by (1, 0), not (1, 1).
- Compatibility: on a finite-dimensional algebraic representation of 𝐆 ×_L E the action of g ⊗_L E is the differential of the algebraic action (ReductiveGroups Layer 2).

### 0.4 The distribution algebra of a non-compact locally analytic group

Let G be a locally F-analytic group, not necessarily compact, and H ⊆ G a compact open subgroup. Define D(G, E) := C^(F-an)(G, E)′_b, the strong dual of the space of locally analytic functions of PadicLocalLanglandsForGL2Qp §0.1, with convolution λ ∗ μ = m_*(λ ⊗ μ). Prove: (i) C^(F-an)(G, E) = ∏_(gH ∈ G/H) C^(F-an)(gH, E) and D(G, E) = ⊕_(gH∈G/H) δ_g ∗ D(H, E) as locally convex spaces, with D(H, E) the Fréchet algebra of PadicLocalLanglandsForGL2Qp §0.1; (ii) D(G, E) is an associative unital E-algebra with unit δ_1 and separately continuous multiplication, δ_g ∗ δ_h = δ_gh, and E[G] → D(G, E) is injective with dense image; (iii) for an open subgroup H′, D(H′, E) is a subalgebra, D(G, E) is free as a right D(H′, E)-module on δ_g for g in a set of representatives of G/H′, and free as a left module on δ_g for representatives of H′\G; (iv) for F = ℚ_p, U(g ⊗_(ℚ_p) E) ⊂ D(H, E) ⊂ D(G, E); for F = L, the composite of this embedding with the quotient D_(ℚ_p)(H, E) → D_L(H, E) of (vi) factors through U(g ⊗_L E), the quotient of U(g ⊗_(ℚ_p) E) = ⊗_τ U(g_τ) by the ideal generated by the g_τ for τ different from the inclusion L ⊆ E, and the induced map U(g ⊗_L E) → D_L(H, E) ⊂ D_L(G, E) is injective (Schneider–Teitelbaum 2002, Lemmas 2.4–2.5, pp. 10–11); (v) g ↦ g⁻¹ induces an anti-involution of D(G, E); (vi) for F = ℚ_p and L ≠ ℚ_p, the transpose of C^(L-an) ⊂ C^(ℚ_p-an) is a surjective algebra map D_(ℚ_p)(G, E) → D_L(G, E), the F-analytic quotient of PadicLocalLanglandsForGL2Qp §0.1 on each compact open subgroup (Schneider–Teitelbaum 2002, Proposition 2.3, p. 9, and Lemma 3.1, p. 13; Breuil, socle I, proof of Lemma 2.2, p. 9). Unless named otherwise D(G, E) is the ℚ_p-analytic algebra. Multiplication is separately but not in general jointly continuous when G/H is infinite; nothing below uses joint continuity.

The proof route reduces everything to the compact pieces: products of function spaces dualise to locally convex direct sums, convolution is defined coset by coset from the compact case, and freeness over D(H′, E) is the open-subgroup comparison of PadicLocalLanglandsForGL2Qp §0.1 applied to H ∩ H′ ⊆ H and H ∩ H′ ⊆ H′. (iv) for F = ℚ_p is LocallyAnalyticDistributionsPartII §1.1 for H; for F = L the factorisation holds because the differential of a locally L-analytic function is L-linear, so g_τ differentiates it to 0 for τ different from the inclusion, and injectivity is the pairing of the ordered PBW monomials x^α of an L-basis of g with the L-analytic coordinate monomials t^β, which gives α!·δ_(αβ).

API:

- The Dirac map g ↦ δ_g is a group homomorphism G → D(G, E)^×.
- The decomposition D(G, E) ≅ ⊕_gH δ_g ∗ D(H, E) holds for every compact open H, as locally convex spaces and as right D(H, E)-modules.
- For an open subgroup H′ the inclusion D(H′, E) → D(G, E) is an injective algebra map, compatible with composition of inclusions.
- For compact G, D(G, E) is the Fréchet algebra of PadicLocalLanglandsForGL2Qp §0.1.
- For x ∈ g and g ∈ G, δ_g ∗ x̃ ∗ δ_g⁻¹ = (Ad(g)x)~ (LocallyAnalyticDistributionsPartII §1.1 on a compact open subgroup containing g, and by translation otherwise).

*Needs:* PadicLocalLanglandsForGL2Qp §0.1 (locally analytic functions on non-compact manifolds, strong duals, D(H, E), open-subgroup comparisons, the F-analytic quotient); LocallyAnalyticDistributionsPartII §1.1 (x̃ and its conjugation formula); LocallyAnalyticDistributions §0.0; 0.1.

**Checks.**

- Degenerate case: for G discrete (dimension 0, H = {1}), D(G, E) is the group algebra E[G] with its finest locally convex topology.
- For G = ℤ_p, D(G, E) is the commutative Fréchet algebra of distributions on ℤ_p, isomorphic by the Amice transform to the functions on the open unit disc.
- Non-example: for G = ℚ_p, D(G, E) = ⊕_(a∈ℚ_p/ℤ_p) δ_a ∗ D(ℤ_p, E) is a countable direct sum of Fréchet spaces, not a Fréchet space, and is not finitely generated over D(ℤ_p, E).
- For G = GL_2(ℚ_p) and g = diag(p, 1), δ_g ∗ ẽ ∗ δ_g⁻¹ = (pe)~ for the upper root vector e; with the opposite conjugation the factor would be p⁻¹.
- The case F = L of (iv): for p odd, L = E = ℚ_p(√p), σ the inclusion and τ the conjugation, and H = 1 + pO_L ⊆ L^×, g = L and U(g ⊗_(ℚ_p) E) = E[x_σ, x_τ]. Its map to D_L(H, E) kills x_τ, which differentiates every locally L-analytic function to 0, and is injective on E[x_σ] = U(g ⊗_L E); the map from E[x_σ, x_τ] itself is not injective, so (iv) for F = L cannot be read as an embedding of U(g ⊗_(ℚ_p) E).

### 0.5 Locally analytic representations are D(G, E)-modules

Let V be a locally F-analytic representation of G over E. Prove that there is a unique separately continuous bilinear map D(G, E) × V → V, (μ, v) ↦ μ ∗ v, making V a left D(G, E)-module with δ_g ∗ v = g·v and λ(μ ∗ v) = μ(g ↦ λ(g·v)) for all λ ∈ V′; that for fixed v the integration map μ ↦ μ ∗ v is continuous; that it extends the action of U(g ⊗_F E) of 0.3; and that every continuous G-equivariant linear map between locally analytic representations is D(G, E)-linear (Schneider–Teitelbaum 2002, Proposition 3.2, p. 13; Dospinescu–Le Bras, proof of Lemme 5.9, p. 29).

The proof route integrates orbit maps chartwise: for fixed v and a compact chart meeting the support of μ, the orbit map factors through a BH-subspace of V, where its convergent power series is integrated against μ; finitely many charts suffice and the result is independent of choices. No identity C^an(G, V) = C^an(G, E) ⊗̂ V for arbitrary barrelled V is used. Uniqueness follows from Hahn–Banach (LocallyAnalyticDistributions §0.2), and the module axioms hold on Dirac distributions and extend by density of E[G] (0.4 (ii)).

*Needs:* 0.2, 0.3, 0.4; Mathlib `PolynormableSpace.banach_steinhaus` with gap:barrelled-banach-steinhaus; LocallyAnalyticDistributions §0.2 (*The nonarchimedean Hahn–Banach theorem*).

**Checks.**

- Degenerate case: on the trivial representation E, μ acts by μ(1) (the augmentation), and δ_g acts by 1.
- For compact G and V = C^an(G, E) with the left regular action, μ ∗ f is the convolution of μ with f, and δ_g ∗ f = f(g⁻¹ ·).
- Non-example to dropping compactness there: for G = ℚ_p the translation action on C^an(ℚ_p, E) = ∏_(a∈ℚ_p/ℤ_p) C^an(a + ℤ_p, E) is not locally analytic. Let f be 1 on p^(−m) + p^mℤ_p for every m ≥ 1 and 0 elsewhere, a locally constant function. Composing the orbit map g ↦ g·f with the continuous evaluation at p^(−m) gives the indicator of p^mℤ_p (up to the sign of g), which for m > N is not a power series on p^Nℤ_p; so no disc around 0 carries a power-series expansion of the orbit map, and 0.5 does not apply to this action (Emerton's memoir, Proposition 3.5.12, p. 67, assumes G compact).
- For the character χ(a) = (1 + p)^a of ℤ_p (p odd), the distribution x̃ with x = 1 ∈ Lie(ℤ_p) acts by log(1 + p), and δ_1 acts by 1 + p.
- Non-example to faithfulness: on the trivial representation E every μ acts by its total mass μ(1), so δ_a and δ_0 act alike although they differ in D(G, E); the module structure need not be faithful.

### 0.6 Duality for representations of compact type

Prove that V ↦ V′_b is an anti-equivalence between locally F-analytic representations of G on spaces of compact type, with continuous G-maps, and separately continuous D(G, E)-modules whose underlying space is a nuclear Fréchet space, with continuous D(G, E)-linear maps; the module structure on V′_b is the transpose of 0.5 composed with the anti-involution of 0.4 (v) (Schneider–Teitelbaum 2002, Corollary 3.3, p. 14).

The proof route combines compact-type/nuclear Fréchet duality (PadicLocalLanglandsForGL2Qp §0.1) with the integration of 0.5; conversely a separately continuous D(G, E)-module structure on a nuclear Fréchet M gives a G-action on M′_b by Dirac distributions whose orbit maps are locally analytic by reflexivity.

*Needs:* 0.5; PadicLocalLanglandsForGL2Qp §0.1 (compact-type/nuclear Fréchet duality and reflexivity).

**Checks.**

- For compact G and V = C^an(G, E), V′_b = D(G, E), free of rank one.
- Degenerate case: V = 0 corresponds to the zero module.
- For the character χ of ℚ_p^× given by x ↦ x, the dual line is the module on which δ_x acts by x⁻¹: the contragredient convention of Convention 3. A module on which δ_x acts by x would be the dual of x ↦ x⁻¹.

### 0.7 Continuity of matrix coefficients

Let W be a locally F-analytic representation of G on a space of compact type and λ ∈ W′. Prove that F_λ : W → C^(F-an)(G, E), w ↦ (g ↦ λ(g·w)), is well defined, continuous, and G-equivariant for the right regular action (Dospinescu–Le Bras, Lemme 5.9 and its proof, pp. 28–29).

The proof route works coset by coset: for compact open H, C^an(H, E) is of compact type and reflexive, so transposition and the continuity of μ ↦ μ ∗ w (0.5) give continuity of W → C^an(gH, E) for each coset; since C^an(G, E) = ∏_(gH∈G/H) C^an(gH, E) carries the product topology (0.4 (i)), the universal property of the product gives continuity into C^an(G, E). Only the product topology of C^an(G, E) is used, no duality property of it; for non-compact G it is not of compact type, its strong dual ⊕_(gH) D(gH, E) being an infinite locally convex direct sum of nonzero spaces and so not metrisable.

*Needs:* 0.5, 0.6.

**Checks.**

- For compact G, W = C^an(G, E) with the right regular action and λ = evaluation at 1, F_λ is the identity.
- Degenerate case: λ = 0 gives the zero map.
- For W = E with character χ and λ = 1, F_λ(1) = χ, a locally analytic function; for the non-locally-analytic translation representation on C(ℤ_p, E) the analogous map lands outside C^an(ℤ_p, E), which is why compact type and local analyticity are hypotheses.
- Non-example to non-reflexivity: for G = ℤ with its zero-dimensional analytic structure and H = {0}, C^an(G, E) = E^ℤ with the product topology; its continuous linear forms have finite support, its strong dual is E^(ℤ) with the finest locally convex topology, whose bounded sets have uniformly finite support and bounded coefficients, so the strong bidual is E^ℤ with the topology of the finite-coordinate seminorms max_(|j|≤N) |x_j|, the product topology again. So C^an(G, E) is reflexive here although G is not compact; it is not of compact type, since E^(ℤ) is not metrisable. For W = E with the trivial action and λ = 1, F_λ(1) is the constant function 1 and each coordinate w ↦ λ(j·w) is continuous, as the coset-by-coset route gives.

### 0.8 Weakly null sequences are null over a spherically complete field

Let E be spherically complete and V a Hausdorff locally convex E-vector space. Prove that a sequence (v_n) in V converges to 0 if and only if λ(v_n) → 0 for every continuous linear form λ ∈ V′ (Dospinescu–Le Bras, Lemme 5.10, p. 29, which states it without proof).

The proof route reduces to the seminormed quotients V_q = V/ker q for the continuous seminorms q: weak convergence passes to V_q, because continuous forms on V_q are continuous forms on V, and v_n → 0 in V if and only if q(v_n) → 0 for every q. In a seminormed space over a spherically complete field the nonarchimedean Schur property is proved by a gliding-hump construction: if q(v_n) ≥ c > 0 along a subsequence, one passes to a further subsequence whose distance to the span of the earlier terms stays bounded below (otherwise the terms converge weakly, hence in norm, inside a finite-dimensional subspace), and the norm-preserving Hahn–Banach extension (LocallyAnalyticDistributions §0.2) produces a single continuous form not tending to 0 on it. Spherical completeness is used exactly in the Hahn–Banach step.

*Needs:* LocallyAnalyticDistributions §0.0 (seminorms and separation), §0.2 (*The nonarchimedean Hahn–Banach theorem*).

**Checks.**

- In c_0(ℕ, E) the unit vectors e_n are not weakly null: pairing with (1, 1, …) ∈ ℓ^∞ = c_0′ gives 1 for every n, consistent with ‖e_n‖ = 1.
- Degenerate case: the constant sequence 0 is null in both senses, and on V = E the two notions agree.
- In a finite-dimensional V the coordinate forms already detect convergence, so the statement holds without spherical completeness there; spherical completeness matters for infinite-dimensional normed V, through the Hahn–Banach extension.

### 0.9 Completed external tensor products of representations

Let V_i be a locally F-analytic representation of G_i on a space of compact type, i = 1, 2. Prove: the completed tensor product V_1 ⊗̂_E V_2 (inductive and projective completions agree here, LocallyAnalyticDistributions §0.0, *Compact-type tensor comparison*) is of compact type and a locally analytic representation of G_1 × G_2 with (g_1, g_2)(v_1 ⊗ v_2) = g_1v_1 ⊗ g_2v_2; its strong dual is V_1′_b ⊗̂_E V_2′_b as a module over D(G_1 × G_2, E) ⊇ D(G_1, E) ⊗_E D(G_2, E), with D(H_1 × H_2, E) = D(H_1, E) ⊗̂_E D(H_2, E) for compact open H_i; the construction is functorial and exact in each variable on strict short exact sequences of spaces of compact type; restriction along the diagonal G → G × G gives the internal completed tensor product, in particular the twist V ⊗ χ by a locally analytic character χ (Emerton's memoir, Propositions 1.1.31–1.1.32, pp. 18–19, and Proposition 3.6.18, p. 74; Ding, §3.1.3, (3.19), arXiv v2 p. 43; Breuil–Hellmann–Schraen, §5.2, p. 390). Admissibility of external products is 1.5.

The proof route takes the compact-type and dual statements from LocallyAnalyticDistributions §0.0 (*Compact-type tensor comparison*), exactness in each variable from gap:compact-type-tensor, and gets local analyticity of the product action from Emerton's tensor compatibility of analytic vectors (Proposition 3.6.18, via 3.5.15 and 3.6.12) on compact-type Banach presentations; density of elementary tensors alone would not give it, since analytic vectors need not form a closed subspace.

API:

- Functoriality in both factors and exactness in each factor for strict short exact sequences of representations of compact type.
- The dual identification (V_1 ⊗̂ V_2)′_b ≅ V_1′_b ⊗̂ V_2′_b as D(G_1 × G_2, E)-modules.
- The twist V ⊗ χ := restriction of V ⊗̂ χ along the diagonal, for a locally analytic character χ.

*Needs:* 0.2, 0.6; LocallyAnalyticDistributions §0.0 (completed tensors, *Compact-type tensor comparison*) with gap:compact-type-tensor; PadicLocalLanglandsForGL2Qp §0.1 (D(H_1 × H_2) and products of charts).

**Checks.**

- Degenerate case: V ⊗̂ E, with E the trivial representation of the trivial group, is V.
- For finite-dimensional V_1, V_2 the completed tensor product is the algebraic tensor product with the product action, of dimension dim V_1 · dim V_2.
- Compatibility: for smooth admissible representations π_1, π_2 of countable dimension with their finest locally convex topologies, π_1 ⊗̂ π_2 is the smooth external tensor product π_1 ⊗ π_2.
- For characters, χ ⊗ χ′ restricted to the diagonal is the product character χχ′; for χ = x^a and χ′ = x^b on ℚ_p^× the twist has derivative a + b at 1.

### Examples

- For G = GL_n(L) over E, finite-dimensional algebraic representations, smooth representations of countable dimension and their tensor products are locally analytic; translation on C(ℤ_p, E) is not.
- For G = ℚ_p the distribution algebra is a countable direct sum of copies of D(ℤ_p, E), one for each element of ℚ_p/ℤ_p.
- For p odd and G = ℤ_p, the integration map of the character χ(a) = (1 + p)^a = exp(a·log(1 + p)) on E sends δ_a to (1 + p)^a; for p = 3 the values at a = 0, 1, 2 are 1, 4, 16, and χ(1 + 1) = χ(1)².
- Non-example: this character does not extend to the additive group ℚ_p, even without continuity. For p = 3 and E = ℚ_3, a homomorphism χ : ℚ_3 → ℚ_3^× with χ(1) = 4 would give x = χ(1/3) with x³ = 4, so x would be a unit of ℤ_3; but cubes of units of ℤ_3 are ≡ ±1 mod 9, and 4 is not. For any finite E, 1 + p has no compatible system of p-power roots in E^×, whose infinitely p-divisible elements are the roots of unity of order prime to p.
- In c_0(ℕ, E) the unit vectors are neither null nor weakly null.

### Dependencies

ReductiveGroupsPartII RG2.0.2; ReductiveGroups Layers 1–2; LocallyAnalyticDistributions §§0.0, 0.2 with gap:barrelled-banach-steinhaus and gap:compact-type-tensor; LocallyAnalyticDistributionsPartII §1.1; PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.4; SmoothRepresentationsOfLocalGroups SR.0.1; Mathlib `UniversalEnvelopingAlgebra`, `UniversalEnvelopingAlgebra.lift`, `LieGroup`, `BarrelledSpace`, `PolynormableSpace.banach_steinhaus`.

## Layer 1: Coadmissible modules, admissibility, locally algebraic representations and Ext groups

Admissibility of a locally analytic representation is the notion of PadicLocalLanglandsForGL2Qp §0.1, tested on a compact open subgroup. This layer works with the non-compact algebra D(G, E): coadmissible D(G, E)-modules, the anti-equivalence of admissible representations with them and the abelian category it gives, strong admissibility, admissibility of external products, locally algebraic representations π ⊗ W, the Ext groups Ext^i_G computed among all D(G, E)-modules with Breuil's identification of Ext¹ with admissible extensions, dual-number self-extensions and tautological extensions, and Schraen's Ext groups between locally algebraic representations.

### 1.1 Coadmissible modules over D(G, E) for non-compact G

Let G be a locally F-analytic group. Define a left D(G, E)-module M to be coadmissible if for one compact open subgroup H ⊆ G its restriction to D(H, E) is a coadmissible module over the Fréchet–Stein algebra D(H, E) (PadicLocalLanglandsForGL2Qp §0.1); write 𝒞_G for the full subcategory of Mod(D(G, E)). Prove that the condition does not depend on H, that M then carries the canonical Fréchet topology of its D(H, E)-module structure, independent of H, for which D(G, E) acts separately continuously, and that D(G, E)-linear maps between coadmissible modules are continuous and strict (Schneider–Teitelbaum 2003, §6, p. 31, with Lemma 3.8, p. 12).

The proof route uses that for compact open H ⊆ H′ the algebra D(H′, E) is finite free over D(H, E) (the open-subgroup comparison of PadicLocalLanglandsForGL2Qp §0.1), hence coadmissible as a D(H, E)-module, so coadmissibility over D(H′, E) and over D(H, E) agree by the change of ring along D(H, E) → D(H′, E) (LocallyAnalyticDistributionsPartII §1.4; Schneider–Teitelbaum 2003, Lemma 3.8, p. 12), and canonical topologies agree because D(H ∩ H′, E)-linear maps between coadmissible modules are continuous and strict.

API:

- Independence: M is coadmissible for one compact open H if and only if for every compact open H.
- 𝒞_G is an abelian full subcategory of Mod(D(G, E)) closed under finite direct sums, kernels, cokernels and images.
- For N ⊆ M with M coadmissible: N is coadmissible if and only if M/N is, if and only if N is closed for the canonical topology (Schneider–Teitelbaum 2003, Lemma 3.6, p. 11; LocallyAnalyticDistributionsPartII §1.4).

*Needs:* 0.4; PadicLocalLanglandsForGL2Qp §0.1 (D(H, E), open-subgroup comparisons, coadmissible modules); LocallyAnalyticDistributionsPartII §1.4 (change of algebra, canonical topology, closed submodules).

**Checks.**

- Compatibility: for compact G, 𝒞_G is the category of coadmissible D(G, E)-modules of PadicLocalLanglandsForGL2Qp §0.1.
- Degenerate case: for G discrete (H = {1}, D(H, E) = E) the coadmissible E[G]-modules are exactly the finite-dimensional ones.
- Non-example: for non-compact G the regular module D(G, E) is not coadmissible: over D(H, E) it is free of infinite rank, one generator per coset of H.
- For a locally analytic character χ of G, the line E on which δ_g acts by χ(g⁻¹) is coadmissible; it is the dual of χ.

### 1.2 Strongly admissible and topologically irreducible representations

Admissibility of a locally analytic representation V of G (compact type, strong dual coadmissible over D(H, E) for a compact open H) is that of PadicLocalLanglandsForGL2Qp §0.1; write Rep^a_E(G). Define V to be strongly admissible if V′ is finitely generated over D(H, E) for a compact open H (Emerton's memoir, Definition 6.2.1, p. 117), and topologically irreducible if V ≠ 0 and its only closed G-stable subspaces are 0 and V. Prove: (i) a strongly admissible representation of compact type is admissible: a finite generating set gives a continuous surjection D(H, E)^m → V′, strict with closed kernel by the Fréchet open mapping theorem, hence V′ is a coadmissible quotient (Emerton's memoir, Proposition 6.2.2, p. 117); (ii) strong admissibility is independent of H; (iii) for admissible V, V is topologically irreducible if and only if V′ is a simple object of 𝒞_G, that is, V′ ≠ 0 and its only coadmissible D(G, E)-submodules, equivalently (1.1) its only D(G, E)-submodules closed for the canonical topology, are 0 and V′; for compact G this is equivalent to simplicity of V′ as an abstract D(G, E)-module, because a nonzero cyclic submodule of a coadmissible module is coadmissible (Schneider–Teitelbaum 2003, Corollary 3.4 (iv), p. 10, and Lemma 3.9 with its proof, p. 14), while for non-compact G abstract simplicity is strictly stronger and is not asserted; (iv) for an admissible unitary Banach representation B of a compact open subgroup H (PadicLocalLanglandsForGL2Qp §0.1) the locally analytic vectors B^la are strongly admissible, since (B^la)′ ≅ D(H, E) ⊗_(E[[H]]) B′ (PadicLocalLanglandsForGL2Qp §0.1) is finitely generated; (v) a smooth representation with its finest locally convex topology is admissible as a locally analytic representation if and only if it is admissible in the sense of SmoothRepresentationsOfLocalGroups SR.0.4 (*admissible*), and an admissible representation on which g acts trivially is of this form (Schneider–Teitelbaum 2003, Theorem 6.6, p. 35).

API:

- Strong admissibility can be tested on one compact open subgroup and is preserved by restriction to open subgroups.
- Every finite-dimensional locally analytic representation is strongly admissible.
- Topological irreducibility of admissible V is equivalent to simplicity of V′ in 𝒞_G: V′ ≠ 0 has no nonzero proper closed D(G, E)-submodule. For compact G it is equivalent to simplicity of V′ as a D(G, E)-module.

*Needs:* 1.1; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributionsPartII §1.4 (for (iii)); LocallyAnalyticDistributions §0.2 (*Fréchet open mapping*); SmoothRepresentationsOfLocalGroups SR.0.4.

**Checks.**

- For compact H, C^an(H, E) with left translation is strongly admissible: its dual D(H, E) is free of rank one.
- Degenerate case: the zero representation is strongly admissible and not topologically irreducible.
- Non-example: for non-compact G, the compact induction c-Ind_H^G 1 with its finest locally convex topology is not admissible: its H-invariants are infinite-dimensional.
- Compatibility: for π smooth with the finest topology, admissibility in the two senses agrees; for G = GL_2(ℚ_p) the smooth Steinberg representation is admissible and topologically irreducible.
- Non-example to abstract simplicity of the dual: for G = GL_2(ℚ_p) and the smooth Steinberg representation V = C^sm(ℙ¹(ℚ_p), E)/E with its finest topology, V′ is the full linear dual with the topology of pointwise convergence (Schneider–Teitelbaum 2003, proof of Theorem 6.6, p. 36). The smooth contragredient V^∨ ⊆ V′ is a nonzero D(G, E)-submodule (on a functional fixed by an open normal subgroup N of H, D(H, E) acts through E[H/N]), and it is proper: the functional f ↦ f(0) − f(∞) lies in V′, but its stabiliser is the split torus fixing the two points 0 and ∞ of ℙ¹(ℚ_p), which is not open, so it is not smooth. V^∨ separates the points of V, so it is dense in V′; the closed submodules of V′ are 0 and V′, as (iii) requires, while abstract simplicity would make V reducible.

### 1.3 The Schneider–Teitelbaum anti-equivalence for non-compact groups

Prove that V ↦ V′_b is an anti-equivalence between Rep^a_E(G) and the category 𝒞_G of coadmissible D(G, E)-modules with all D(G, E)-linear maps, which are automatically continuous for the canonical topologies (Schneider–Teitelbaum 2003, Theorem 6.3, pp. 33–34). The compact case is PadicLocalLanglandsForGL2Qp §0.1.

The proof route restricts the duality of 0.6 to the essential image: the canonical topology of a coadmissible D(H, E)-module is nuclear Fréchet (Schneider–Teitelbaum 2003, Lemma 6.1, pp. 31–32, using the compact transition maps of the distribution algebra), the D(G, E)-action on it is separately continuous, and module maps are continuous. Nuclearity is specific to distribution algebras, not a property of arbitrary Fréchet–Stein algebras.

*Needs:* 0.6, 1.1, 1.2; PadicLocalLanglandsForGL2Qp §0.1.

**Checks.**

- The trivial representation corresponds to E with δ_g acting by 1, and for compact G the representation C^an(G, E) corresponds to the regular module D(G, E).
- Degenerate case: for G discrete the anti-equivalence is linear duality between finite-dimensional representations and finite-dimensional E[G]-modules.
- For G = ℚ_p^× and the character x ↦ x, the corresponding module is E with δ_x acting by x⁻¹; the anti-equivalence reverses arrows, so an injection χ ↪ V corresponds to a surjection V′ ↠ χ⁻¹ on the dual line.

### 1.4 The abelian category of admissible representations

Prove: (i) Rep^a_E(G) is abelian, with kernels and images the algebraic ones with the subspace topology; (ii) every morphism is strict with closed image; (iii) closed G-stable subspaces of admissible representations, and quotients by them, are admissible; (iv) for compact open H, a finitely generated D(H, E)-submodule of a coadmissible D(H, E)-module is coadmissible, finitely generated left ideals of D(H, E) are closed, and finitely presented D(H, E)-modules are coadmissible; (v) an admissible V has finite length if V′ has finite length as a D(G, E)-module, and Jordan–Hölder holds in Rep^a_E(G) (Schneider–Teitelbaum 2003, Proposition 6.4, p. 34, and Lemma 3.6, p. 11).

The proof route transports the abelian structure of 𝒞_G (1.1) through 1.3; strictness follows from the duality of strict morphisms between spaces of compact type and their duals (LocallyAnalyticDistributions §0.0, *Strict maps and the quasi-abelian categories*). Finite generation and finite presentation in (iv) are over the compact-open algebra D(H, E); finite presentation over the non-compact D(G, E) does not imply coadmissibility, as the regular module shows.

*Needs:* 1.1, 1.3; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributionsPartII §1.4; LocallyAnalyticDistributions §0.0.

**Checks.**

- For GL_2(ℚ_p) and a dominant algebraic weight, the locally analytic principal series of 5.2 contains its locally algebraic vectors as a closed subrepresentation with admissible quotient.
- Degenerate case: the zero morphism has kernel the source and closed image 0.
- Non-example: the regular module D(G, E) of a non-compact G is finitely presented over D(G, E) but not coadmissible, so (iv) fails over D(G, E).

### 1.5 Admissibility of completed external tensor products

Let V_i be admissible locally F-analytic representations of G_i, i = 1, 2. Prove that the completed external tensor product V_1 ⊗̂_E V_2 of 0.9 is admissible for G_1 × G_2. Restriction to the diagonal need not preserve admissibility and is not asserted (Ding, §3.1.3, (3.19), arXiv v2 p. 43; Breuil–Hellmann–Schraen, §5.2, p. 390; Emerton's memoir, Proposition 1.1.32, pp. 18–19, and Theorem 6.1.20, p. 116, for the route).

The proof route identifies the strong dual with M_1 ⊗̂_E M_2 (0.9). For compatible radii, D_r(H_1 × H_2, E) = D_r(H_1, E) ⊗̂_E D_r(H_2, E) by the product chart and the power-series norm, and the module at radius r is M_(1,r) ⊗̂_E M_(2,r), finitely generated over the product Banach algebra by products of generators. Flat transition base changes identify the radius transitions, and the inverse limit recovers M_1 ⊗̂ M_2 by nuclearity; this is a coadmissible system, and 1.3 concludes. The admissibility assertion is derived from these inputs.

*Needs:* 0.9, 1.3; PadicLocalLanglandsForGL2Qp §0.1 (Fréchet–Stein structure of D(H, E), D(H_1 × H_2, E) = D(H_1, E) ⊗̂ D(H_2, E)); LocallyAnalyticDistributionsPartII §1.4 (coadmissible modules) and §1.5 (the radius algebras D_r); LocallyAnalyticDistributions §0.0 (*Compact-type tensor comparison*) with gap:compact-type-tensor.

**Checks.**

- For V_i = C^an(H_i, E) with H_i compact, the product is C^an(H_1 × H_2, E), whose dual D(H_1 × H_2, E) is free of rank one.
- Degenerate case: if V_2 = 0 the product is 0; if G_2 = 1 and V_2 = E it is V_1.
- Non-example for the diagonal: C^an(ℤ_p × ℤ_p, E) is admissible for ℤ_p × ℤ_p, but its restriction to the diagonal ℤ_p is not admissible: after the change of variables (x, y) ↦ (x, y − x) it is C^an(ℤ_p, E) ⊗̂ C^an(ℤ_p, E) with ℤ_p acting on the first factor, whose dual D(ℤ_p, E) ⊗̂ D(ℤ_p, E) has Banach stages that are not finitely generated over D_r(ℤ_p, E).

### 1.6 Locally algebraic representations

Let 𝐆 be split connected reductive over L, G = 𝐆(L), and W a finite-dimensional algebraic representation of (Res_(L/ℚ_p)𝐆) ×_(ℚ_p) E ≅ ∏_(σ∈Σ_L) 𝐆 ×_(L,σ) E, restricted to G. For a smooth admissible representation π of G over E, π ⊗_E W with the diagonal action and the finest locally convex topology is an admissible locally ℚ_p-analytic representation, called locally algebraic. Define the locally W-algebraic vectors of a locally analytic V as the image of Hom_g(W, V) ⊗ W → V, and V_lalg as their sum over irreducible W; V is locally algebraic if V = V_lalg. Prove: (i) π ⊗ W is admissible when π is admissible; (ii) if π and W are absolutely irreducible then π ⊗ W is topologically irreducible, even simple as an E[G]-module (Schneider–Teitelbaum 2001, Proposition 3.4, p. 13); (iii) every admissible locally W-algebraic representation is U ⊗_(End(W)) W with U admissible smooth (Emerton's memoir, Proposition 6.3.10, p. 124); (iv) on π ⊗ W the action of g ⊗_(ℚ_p) E is 1 ⊗ (differential of W) (Schneider–Teitelbaum 2003, Theorem 6.6, p. 35; Emerton's memoir, Propositions 6.1.5, 6.3.2, 6.3.6, pp. 112–123).

The proof route for (i) uses that π is admissible with trivial Lie action and that the tensor product of an admissible representation with a finite-dimensional one is admissible; for (ii), write a nonzero x = Σ_j e_j ⊗ v_j with weight vectors e_j ∈ W and v_j ∈ π, choose an open subgroup U fixing every v_j, and put N_0 = U ∩ N for the unipotent radical N of a Borel subgroup. If N_0 fixes x, then x ∈ W^(N_0) ⊗ π^U = E_λ ⊗ π^U, where E_λ = W^N = W^(N_0) is the highest-weight line, one-dimensional for absolutely irreducible W of the split group (ReductiveGroups §10B; N_0 is Zariski dense in N). Otherwise replace x by n·x − x ≠ 0 for some n ∈ N_0: each n·e_j − e_j has only weights strictly higher than that of e_j, so after finitely many such differences one reaches a nonzero vector e_λ ⊗ v of E_λ ⊗ π^U in the E[N_0]-submodule generated by x. This is a linear combination of translates of x, not in general a single translate. Then E[U_v]·e_λ = W for the open stabiliser U_v of v: the Zariski closure of U_v in Res_(L/ℚ_p)𝐆 is a smooth algebraic subgroup (characteristic zero) whose ℚ_p-points contain the open subset U_v of G, so it has dimension d_L·dim 𝐆 (0.1 (i)) and, Res_(L/ℚ_p)𝐆 being connected, it is the whole group; hence the stabiliser of the subspace E[U_v]·e_λ is the whole group and irreducibility of W applies; so the E[G]-module generated by x contains W ⊗ v, hence W ⊗ g·v for all g, hence W ⊗ π by irreducibility of π (Schneider–Teitelbaum 2001, Proposition 3.4 and its proof, pp. 13–14).

API:

- V ↦ V_lalg is a left exact subfunctor of the identity on Rep^(la)_E(G). For V of compact type, V_(W-lalg) is a closed subspace of V (Emerton's memoir, Proposition 4.2.10, p. 85); for V admissible, the topology it inherits from V is its finest locally convex topology and V_(W-lalg) is admissible (Emerton's memoir, Proposition 6.3.6, p. 123).
- π ⊗ W is functorial in π and W.

*Needs:* 0.1, 0.2, 0.3, 1.2; SmoothRepresentationsOfLocalGroups SR.0.4 (*admissible*, *smooth-character*); ReductiveGroups Layer 1 and §10B (highest-weight lines of algebraic representations of split groups); ReductiveGroupsPartII RG2.0.2 (*smooth-group-analytic-charts*, for the dimension of the ℚ_p-points of the Zariski closure).

**Checks.**

- Degenerate case: for W trivial, π ⊗ W = π is smooth; for π the trivial character, π ⊗ W = W is finite-dimensional algebraic.
- Non-example: if π = π_1 ⊕ π_2 is reducible then π ⊗ W ≅ (π_1 ⊗ W) ⊕ (π_2 ⊗ W) is reducible.
- Non-example to the finest-topology clause without admissibility: V = c_0(ℕ, E) with the trivial action of GL_2(ℚ_p) and W = E has V_(W-lalg) = V, closed, but its Banach topology is not the finest locally convex topology: a linear form with e_n ↦ p^(−n), extended along a Hamel basis, takes the value 1 on p^n e_n, which tends to 0 in norm, so it is continuous for the finest topology and not for the norm. V is excluded by the admissibility hypothesis, its invariants under every compact open subgroup being infinite-dimensional.
- For GL_2(ℚ_p), Sym^k E² ⊗ St is an irreducible infinite-dimensional locally algebraic representation.
- Non-example to reaching the highest-weight line by a single translate: for W = Sym²(E²), π = 1 and v = e_1e_2, the upper unipotent u(t) = (1 t; 0 1) gives u(t)·v = e_1e_2 + t e_1², whose e_1e_2-coefficient stays 1, so no translate of v lies in the highest-weight line E e_1², however small the subgroup containing t and also for p = 2; the difference (u(t) − 1)·v = t e_1² is a nonzero highest-weight vector for t ≠ 0, as the route of (ii) requires.
- For GL_2(ℚ_p) and dominant λ = (k, 0), the locally algebraic vectors of (Ind_B⁻^G χ_sm z^λ)^an are (Ind_B⁻^G χ_sm)^∞ ⊗ Sym^k E².
- Compatibility: for G = GL_2(ℚ_p) and V = Π^an the locally analytic vectors of an admissible unitary Banach representation Π, V_lalg is the space Π^alg of PadicLocalLanglandsForGL2Qp §2.4, and the sum defining it is the direct sum ⊕_W W ⊗ Hom_g(W, V)^sm over W = Sym^(k−1) E² ⊗ det^a; a definition retaining a single algebraic type W would recover only the summand of that type, and for Π = E² with trivial action it would have to recover the trivial type with multiplicity two.

### 1.7 Ext groups of admissible representations

For admissible V_1, V_2 put Ext^i_G(V_1, V_2) := Ext^i_(D(G,E))(V_2′, V_1′), Ext in the abelian category of all left D(G, E)-modules (Mathlib's root `Ext` on `ModuleCat`, which has enough projectives, or equivalently `CategoryTheory.Abelian.Ext`). Variants: for a character χ of the centre Z of G through which Z acts on V_1 and V_2, Ext^i_(G,χ) is computed over D(G, E) ⊗_(D(Z,E)) χ⁻¹, the inverse because Z acts on V′ by χ⁻¹ (Convention 3); for locally algebraic V_1, V_2, Ext¹_lalg(V_1, V_2) ⊆ Ext¹_G(V_1, V_2) is the subspace of classes whose extension (1.8) is locally algebraic (Ding, §3.1.1, arXiv v2 p. 36; Schraen, Définition 3.1 and (3.2), p. 65). Ext^i_G is E-linear, contravariant in V_1 and covariant in V_2. Ext is taken among all D(G, E)-modules; 1.8 shows that Ext¹ nevertheless classifies admissible extensions.

API:

- Ext⁰_G(V_1, V_2) = Hom_G(V_1, V_2) by 1.3.
- Push-forward along V_2 → V_2″ and pull-back along V_1″ → V_1, functorially.
- A short exact sequence 0 → U → V → W → 0 in Rep^a_E(G) gives long exact sequences 0 → Hom(X, U) → Hom(X, V) → Hom(X, W) → Ext¹(X, U) → ⋯ and the analogous sequence in the first variable, since it dualises to a short exact sequence of coadmissible modules (1.4).
- The natural map Ext^i_(G,χ) → Ext^i_G.

*Needs:* 1.3, 1.4, 0.4; Mathlib `Ext`, `CategoryTheory.Abelian.Ext`, `ModuleCat`.

**Checks.**

- Degenerate case: for G = 1, Ext^i_G(V_1, V_2) = 0 for i > 0 and Hom_E(V_1, V_2) for i = 0.
- For G = ℤ_p and V_1 = V_2 = E trivial, Ext¹_G(E, E) ≅ Hom_cont(ℤ_p, E) = E: D(ℤ_p, E) is the ring of functions on the open disc and E = D/(δ_1 − 1).
- Non-example: for G = ℚ_p^× and the trivial character, Ext¹_G(1, 1) ≅ Hom(ℚ_p^×, E) is two-dimensional, spanned by the valuation and log_p, whereas smooth Ext¹ is one-dimensional, spanned by the valuation.
- For G = ℚ_p^× and χ(x) = x, the dual of χ has character x⁻¹; the fixed-character Ext must use the quotient by χ⁻¹, since the quotient by χ has no module structure on χ′.

### 1.8 Ext¹ classifies admissible extensions

For admissible locally ℚ_p-analytic V_1, V_2 of G over E, prove that Ext¹_G(V_1, V_2) is canonically isomorphic to the group of Yoneda classes of strict exact sequences 0 → V_2 → V → V_1 → 0 of admissible locally ℚ_p-analytic representations; the same holds for locally σ-analytic representations with D_σ(G, E) in place of D(G, E) (Breuil, Ext¹, Lemme 2.1.1 and its proof, pp. 10–11; Ding, §3.1.1, arXiv v2 p. 36).

The proof route dualises an admissible extension to a coadmissible one. Conversely, restrict an abstract extension of the duals to D(H, E) for compact open H, apply the flat base changes to the Banach steps, and compare with the inverse limit of the resulting finitely generated extensions: exactness of the coadmissible inverse-limit rows and a diagram chase recover the middle module with its canonical topology. Dualise with 1.3 and strictness. Finite generation at each step alone would not justify this recovery.

*Needs:* 1.4, 1.7; PadicLocalLanglandsForGL2Qp §0.1 (Banach stages with flat transitions); LocallyAnalyticDistributionsPartII §1.4 (Theorems A and B, base change to the stages); LocallyAnalyticDistributions §0.2 (*Extensions of spaces of compact type*).

**Checks.**

- For G = ℤ_p, the extension of E by E with a ↦ (1 a; 0 1) corresponds to a generator of Ext¹(E, E) = E.
- Degenerate case: the split extension V_2 ⊕ V_1 corresponds to 0.
- For G = ℚ_p^×, the extension with x ↦ (1 log_p x; 0 1) is locally analytic and not smooth; it represents the log_p direction of Ext¹(1, 1), which is not in the smooth Ext¹.

### 1.9 Self-extensions, dual numbers and tautological extensions

Prove: (i) for Ṽ ∈ Ext¹_G(V, V), the endomorphism ε : Ṽ ↠ V ↪ Ṽ satisfies ε² = 0 and makes Ṽ a G-equivariant module over E[ε]/(ε²) (Mathlib `DualNumber`), free, with ker ε = im ε = V; (ii) if Ext¹_G(V_1, V_2) is finite-dimensional and U ⊆ Ext¹_G(V_1, V_2), the tautological extension of V_1 ⊗_E U by V_2 is the extension whose class in Ext¹_G(V_1 ⊗_E U, V_2) = Hom_E(U, Ext¹_G(V_1, V_2)) is the inclusion; for U = Ext¹_G(V_1, V_2) it is the universal extension; (iii) for a locally analytic character χ of an abelian group T and ψ ∈ Hom(T, E), the E[ε]/(ε²)-valued character χ(1 + ψε) is a self-extension of χ, and ψ ↦ χ(1 + ψε) is an isomorphism Hom(T, E) ≅ Ext¹_T(χ, χ): by 1.8 a class is an admissible extension of χ by χ, of dimension two, on which t acts by χ(t)(1 a(t); 0 1) in a basis adapted to the sub-line, multiplicativity of the action is additivity of the locally analytic function a, and conjugating by (1 c; 0 1) does not change a (Ding, §3.1.1, arXiv v2 p. 36; §3.1.2, Proposition 3.3 and its proof, pp. 38–40).

API:

- Pull-back along U′ ⊆ U restricts the classifying inclusion.
- Push-out along f : V_2 → W represents the map U → Ext¹_G(V_1, W) obtained by applying f_* to the inclusion; it is the tautological extension of its image only when this map is injective, and otherwise requires a further pull-back from the image.

*Needs:* 1.7, 1.8; Mathlib `DualNumber`.

**Checks.**

- Degenerate case: for U = 0 the tautological extension is V_2 itself.
- For U = E·c spanned by one class c, the tautological extension of V_1 ⊗ U ≅ V_1 by V_2 represents c.
- For the split self-extension V ⊕ V, ε(a, b) = (0, a), and V ⊕ V ≅ V ⊗_E E[ε] as E[ε]-modules.
- On χ(1 + ψε) = E[ε], with t acting by χ(t)(1 + ψ(t)ε), ε is multiplication by ε and the class in Ext¹_T(χ, χ) is ψ; replacing ψ by 2ψ doubles the class.

### 1.10 Ext between locally algebraic representations

Let G = 𝐆(L) with 𝐆 split connected reductive over L, F_λ, F_μ irreducible algebraic representations of (Res_(L/ℚ_p)𝐆) ×_(ℚ_p) E of dominant highest weights λ, μ, and W_1, W_2 smooth admissible representations of G. Prove: (1) if λ ≠ μ then Ext^n_G(F_λ ⊗ W_1, F_μ ⊗ W_2) = 0 for all n; (2) if W_1 and W_2 have the same smooth central character ω, then Ext^n_(G,λω)(F_λ ⊗ W_1, F_λ ⊗ W_2) ≅ Ext^n_(∞,ω)(W_1, W_2) for n ≤ 2, smooth Ext with fixed central character on the right; in particular Ext¹_(lalg,Z)(π_alg, π_alg) → Ext¹_(G,Z)(π_alg, π_alg) is an isomorphism for π_alg = π ⊗ F_λ (Schraen, Proposition 4.7, pp. 79–80, stated there for ω trivial; Ding, proof of Proposition 3.3, (3.6), arXiv v2 p. 39).

The proof route for (1): the centre of U(g ⊗ E) acts on F_λ ⊗ W through the infinitesimal character of λ, and distinct dominant weights have distinct infinitesimal characters: the centre is the kernel of the E-linear map u ↦ (x ↦ [x, u]), so its formation commutes with the base change to an algebraic closure Ē, where Harish-Chandra's theorem separates the dot-orbits of λ ≠ μ (`TauCeti.vermaCentralCharacter_eq_iff` for the derived algebra, with LieHighestWeight Layers 7 and 9 for the reductive centre), and two distinct dominant weights lie in distinct dot-orbits; the centre of U(g ⊗ E) is central in D(G, E), because it is central in D(H, E) for a compact open H (LocallyAnalyticDistributionsPartII §1.3) and δ_g ∗ z ∗ δ_g⁻¹ = Ad(g)z = z for g ∈ G (0.4), Ad(G) fixing the centre since 𝐆 is connected; and an element of the centre of D(G, E) acting by different scalars kills Ext (as in SmoothRepresentationsOfLocalGroups SR.0d.2, *central-ext-vanishing*). For (2), Schraen's spectral sequence Ext^p_(D(G)_∞,ω)(W_2′, H^q(g′, End(F_λ)) ⊗ W_1′) ⇒ Ext^(p+q)_(G,λω), with g′ the derived Lie algebra, has H¹ = H² = 0 on finite-dimensional modules (Whitehead), so in total degrees n ≤ 2 only the row q = 0 contributes, and that row is smooth Ext; the row q = 3 first contributes in degree 3. The source states the conclusion as concentration in the least degree i_0 with Ext^(i_0)_∞ ≠ 0; that form holds when smooth Ext is concentrated in one degree, as for the generalised Steinberg representations it is applied to, and is replaced here by the form the spectral sequence gives.

*Needs:* 1.6, 1.7, 0.4; `TauCeti.harishChandraIso`, `TauCeti.vermaCentralCharacter_eq_iff` and LieHighestWeight Layers 7 and 9 (the Harish-Chandra isomorphism over an algebraically closed field, reductive Lie algebras); LocallyAnalyticDistributionsPartII §1.3 (the centre of U(g) is central in D(H, E) for connected 𝐆); ReductiveGroups §10B (dominant highest weights of F_λ, F_μ); SmoothRepresentationsOfLocalGroups SR.0d.2 (*central-ext-vanishing*).

**Checks.**

- For GL_2(ℚ_p), Ext^n(Sym^k ⊗ 1, Sym^k′ ⊗ 1) = 0 for k ≠ k′ and all n.
- For GL_2(ℚ_p), W_1 = W_2 = 1 and λ = 0: Ext¹_(G,1)(1, 1) ≅ Ext¹_(∞,1)(1, 1) = Hom_sm(PGL_2(ℚ_p), E) = 0 (the abelianisation of PGL_2(ℚ_p) is finite), whereas without a fixed central character Ext¹_G(1, 1) = Hom(ℚ_p^×, E) ∘ det is two-dimensional.
- Non-example to the printed form: for W_1 = W_2 = π_sm(φ) a generic irreducible principal series of GL_n(L) with fixed central character, i_0 = 0 while Ext¹_(∞,ω)(π_sm, π_sm) has dimension n − 1, so Ext¹_(G,Z)(π_alg, π_alg) is (n − 1)-dimensional, not zero; this is the value 8.8 uses.

### Examples

- For G = ℚ_p^×, Ext¹(1, 1) is spanned by the valuation and log_p, the second being the class of x ↦ (1 log_p x; 0 1).
- For GL_2(ℚ_p), Sym^k E² ⊗ St is admissible, topologically irreducible and locally algebraic, and Ext^n(Sym^k ⊗ 1, Sym^k′ ⊗ 1) = 0 for k ≠ k′.

### Dependencies

Layer 0; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributions §§0.0, 0.2 with gap:compact-type-tensor; SmoothRepresentationsOfLocalGroups SR.0.4, SR.0d.2; ReductiveGroups Layer 1 and §10B; ReductiveGroupsPartII RG2.0.2; LocallyAnalyticDistributionsPartII §§1.3–1.5; LieHighestWeight Layers 7, 9; `TauCeti.harishChandraIso`, `TauCeti.vermaCentralCharacter_eq_iff`; Mathlib `Ext`, `CategoryTheory.Abelian.Ext`, `ModuleCat`, `DualNumber`.

## Layer 2: Admissible Banach representations and derived locally analytic vectors

The locally analytic vectors B^la of a Banach representation are those of CompletedCohomologyPartII F.4, and their density, exactness, admissibility and dual base change on admissible unitary Banach representations are PadicLocalLanglandsForGL2Qp §0.1. This layer adds admissible Banach representations that need not be unitary (the Banach targets of Emerton's very strong admissibility), very strongly admissible representations, and Pan's stagewise derived functors R^iLA on Banach representations with their long exact sequences and the strong LA-acyclicity of admissible Banach representations. Throughout, G is a locally ℚ_p-analytic group, G_0 ⊆ G a compact open subgroup carrying an integral saturated p-valuation with an ordered basis (NoncommutativeAndEquivariantIwasawa §§0.2, 0.6–0.7), G_n = G_0^(p^n), and C^an(G_n, ℚ_p) is the Banach space of functions given in the coordinates of the ordered basis by power series Σ b_k x^k with p^(n|k|)b_k → 0, normed by sup |p^(n|k|)b_k| (Pan, §2.1.1, pp. 10–11).

### 2.1 Admissible Banach representations that need not be unitary

Define a Banach representation of G over E to be an E-Banach space B with an action of G by continuous linear maps such that G × B → B is continuous; it is admissible if its restriction to one compact open subgroup H is admissible in the sense of the Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1, that is, B′ is finitely generated over E[[H]] = E ⊗_(O_E) O_E[[H]] (`TauCeti.completedGroupAlgebra`); write Ban^adm_E(G). No G-invariant lattice is required: this differs from the admissible unitary category of PadicLocalLanglandsForGL2Qp §0.1 and CompletedCohomologyPartII F.1 exactly by dropping the G-stable open bounded lattice. Prove: (i) admissibility is independent of H, because for H′ ⊆ H open E[[H]] is finite free over E[[H′]] (NoncommutativeAndEquivariantIwasawa §0.3); (ii) the restriction of B to a compact open H has an H-stable open bounded lattice (the unit ball of the H-invariant norm sup_(h∈H) ‖h·v‖, finite by Banach–Steinhaus since H is compact), so B|_H lies in the admissible unitary category of PadicLocalLanglandsForGL2Qp §0.1; (iii) Ban^adm_E(G) is abelian and every morphism is strict (Schneider–Teitelbaum 2002, Israel J., §3, Lemma 3.4, pp. 14–15; Schneider–Teitelbaum 2003, §7, p. 38; Emerton's memoir, Proposition 6.2.9, pp. 119–120, and Corollary 6.2.16, p. 121, E being discretely valued).

The proof route for (iii) applies the Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1 for a compact open H and the open mapping theorem (LocallyAnalyticDistributions §0.2, *Fréchet open mapping*). By (ii), the statements of PadicLocalLanglandsForGL2Qp §0.1 on B^la (density, exactness, admissibility, (B^la)′ ≅ D(H, E) ⊗_(E[[H]]) B′) apply to every admissible Banach representation of G after restriction to H.

API:

- Admissibility for G holds for one compact open subgroup if and only if for every compact open subgroup.
- For compact G, Ban^adm_E(G) is the category of admissible Banach representations of the Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1 and coincides with the admissible unitary category.
- The functor B ↦ B^la is exact on Ban^adm_E(G) with dense image (from PadicLocalLanglandsForGL2Qp §0.1 through (ii)).

*Needs:* PadicLocalLanglandsForGL2Qp §0.1 (Schikhof duality, analytic vectors); NoncommutativeAndEquivariantIwasawa §0.3; CompletedCohomologyPartII F.1; LocallyAnalyticDistributions §0.2; Mathlib `BaireSpace.instBarrelledSpace`, `PolynormableSpace.banach_steinhaus`; `TauCeti.completedGroupAlgebra`.

**Checks.**

- Every finite-dimensional continuous representation of G is an admissible Banach representation, unitary or not: for G = ℚ_p^× the character x ↦ x on E is admissible but has no invariant lattice, since p acts by p.
- For compact H, C(H, E) with left translation is admissible: its dual is E[[H]], free of rank one.
- Non-example: c_0(ℕ, E) with the trivial action of ℤ_p is not admissible: every element of its dual is killed by the augmentation ideal of E[[ℤ_p]], and the dual is infinite-dimensional, so it is not finitely generated.
- Degenerate case: the zero representation is admissible.

### 2.2 Very strongly admissible representations

Define an admissible locally analytic representation V of G to be very strongly admissible if there is a continuous G-equivariant E-linear injection V → B into an admissible Banach representation B of G (2.1) (Emerton, Jacquet II, Definition 0.12 and the remark after it, p. 3). Prove: (i) very strongly admissible representations are strongly admissible (1.2); (ii) for compact G the converse holds (Emerton's memoir, Proposition 6.5.9); (iii) closed subrepresentations of very strongly admissible representations are very strongly admissible; (iv) for every admissible Banach representation Π, Π^la is very strongly admissible.

The proof route for (i): the injection V → B factors through B^la, which is strongly admissible (1.2 (iv) after restriction to a compact open H by 2.1 (ii), strong admissibility being tested on H), and V is closed in it because morphisms of admissible representations have closed image (1.4). (iv) is the inclusion Π^la ⊆ Π. The Banach target need not be unitary.

API:

- Finite-dimensional locally analytic representations are very strongly admissible: they are themselves admissible Banach representations.
- Finite direct sums of very strongly admissible representations are very strongly admissible.

*Needs:* 1.2, 1.4, 2.1; PadicLocalLanglandsForGL2Qp §0.1.

**Checks.**

- Degenerate case: the zero representation is very strongly admissible.
- For Π admissible Banach, Π^la → Π exhibits very strong admissibility; for G = ℤ_p and Π = C(ℤ_p, E) this is C^la(ℤ_p, E) ⊆ C(ℤ_p, E).
- Compatibility: for compact G, very strongly admissible and strongly admissible coincide; for G = ℚ_p^× the character x ↦ x is very strongly admissible through the non-unitary Banach target of 2.1, which a unitary-only definition would miss.

### 2.3 Pan's derived functors of locally analytic vectors

For a Banach representation B of G put R^iLA(B) := colim_n H^i_cont(G_n, B ⊗̂_(ℚ_p) C^an(G_n, ℚ_p)), continuous group cohomology (Mathlib `continuousCohomology`) for the diagonal action, where G_n acts on C^an(G_n, ℚ_p) by left translation; R^0LA(B) = B^la. Define B to be LA-acyclic if R^iLA(B) = 0 for all i ≥ 1, and strongly LA-acyclic if for every i ≥ 1 the direct system (H^i_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)))_n is essentially zero: for each n the transition to some m ≥ n is zero (Pan, §2.2, Definition 2.2.1, pp. 12–13). Prove that R^0LA(B) is the space B^la of CompletedCohomologyPartII F.4, that R^iLA and both acyclicity notions do not depend on G_0, and that strong LA-acyclicity implies LA-acyclicity. Pan's functors are defined stagewise on Banach representations; the derived functor RLA of CompletedCohomologyPartII F.4 is defined on general continuous representations, and the solid derived locally analytic vectors are compared with Pan's in 3.8.

The proof route: H^0_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)) = C^an(G_n, B)^(G_n) = B^(G_n-an), embedded in B by evaluation at 1, and B^(G_n-an) ⊆ B^(G_(n+1)-an) with ‖·‖_(G_(n+1)) ≤ ‖·‖_(G_n) (Pan, Lemma 2.1.5, p. 12); for two choices of G_0 the subgroups G_n are cofinal in each other and the systems are isomorphic as ind-objects.

API:

- The construction is functorial in B and E-linear.
- For n ≥ 1 and x ∈ g, x acts on B^(G_n-an) by a bounded operator (Pan, Lemma 2.1.8, p. 12).

*Needs:* CompletedCohomologyPartII F.4; NoncommutativeAndEquivariantIwasawa §§0.2, 0.6–0.7; LocallyAnalyticDistributions §0.0 (completed projective tensor); Mathlib `continuousCohomology`.

**Checks.**

- Degenerate case: for G finite, an integral p-valued G_0 is trivial, R^0LA(B) = B and R^iLA(B) = 0 for i ≥ 1.
- For finite-dimensional B, R^iLA(B) = 0 for i ≥ 1; this follows from 2.5, not from a continuous Shapiro argument, because C^an(G_n, ℚ_p) is not the full continuous coinduced module.
- For G = ℤ_p and B = C(ℤ_p, E) with translation, R^0LA(B) = C^la(ℤ_p, E), a dense proper subspace: the function of 0.2 is excluded.
- Non-example to the direct limit being formal: for B = C(ℤ_p, E), each B^(G_n-an) is the space of functions analytic on the cosets of p^nℤ_p, and no single n gives all of B^la.

### 2.4 The long exact sequence of derived locally analytic vectors

Prove: (1) a short exact sequence 0 → M_0 → M_1 → M_2 → 0 of Banach representations of G with continuous, hence strict, G-maps gives a long exact sequence 0 → M_0^la → M_1^la → M_2^la → R¹LA(M_0) → R¹LA(M_1) → R¹LA(M_2) → ⋯; (2) for a bounded complex M^• of Banach representations with strict G-maps, if each M^q and each H^q(M^•) is LA-acyclic then H^q(M^•)^la = H^q((M^•)^la); (3) if 0 → B → M^0 → M^1 → ⋯ is exact with strict maps and each M^q is LA-acyclic, then R^iLA(B) = H^i((M^•)^la); if moreover each M^q is strongly LA-acyclic and the systems (H^i((M^•)^(G_n-an)))_n are essentially zero for i ≥ 1, then B is strongly LA-acyclic (Pan, Lemma 2.2.2 and its proof, p. 13).

The proof route: strictness bounds the p-power torsion in the cohomology of the unit balls, so M^• ⊗̂ C^an(G_n, ℚ_p) stays exact; taking continuous G_n-cohomology and the colimit over n gives (1), and (2), (3) follow by induction on the length, showing that kernels and images are LA-acyclic.

*Needs:* 2.3; LocallyAnalyticDistributions §0.2 (*Fréchet open mapping*); Mathlib `continuousCohomology`.

**Checks.**

- Degenerate case: for M_0 = 0 the sequence is the isomorphism M_1^la ≅ M_2^la.
- For 0 → B → C(G_0, E)^(⊕d) → C → 0 with B admissible (an embedding exists by admissibility), (1) is the first step of 2.5.
- Non-example: for a non-strict continuous injection, such as the diagonal x_n ↦ p^n x_n on c_0(ℕ, E) with trivial action, the cokernel is not a Banach space, and the sequence of (1) has no Banach third term.

### 2.5 Admissible Banach representations are strongly LA-acyclic

Prove that every admissible Banach representation B of G is strongly LA-acyclic, and so is B ⊗̂_(ℚ_p) M for every ℚ_p-Banach space M with trivial G-action (Pan, Theorem 2.2.3 and Corollary 2.2.4 with proofs, pp. 13–14).

The proof route: embed B G_0-equivariantly into C(G_0, E)^(⊕d) with admissible quotient C (admissibility). As G_n-representations C(G_0, E) ≅ C(G_n, E)^(⊕d_n), so its H¹ with coefficients in ⊗̂ C^an(G_n, ℚ_p) vanishes by Shapiro's lemma, and 2.4 (1) gives an exact sequence (C(G_0, E)^(⊕d))^(G_n-an) → C^(G_n-an) → H¹_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)) → 0. Colmez–Dospinescu's functor Π ↦ Π^((h)) of Mahler-analytic vectors is exact on admissible Banach representations of a uniform group (Colmez–Dospinescu, Corollaire IV.14, arXiv v1 p. 43), and C^(G_n-an) ⊆ C^((n+2)) ⊆ C^(G_(n+1)-an); hence the image of (C(G_0, E)^(⊕d))^(G_(n+1)-an) in C^(G_(n+1)-an) contains C^(G_n-an), the transition H¹ at level n → level n + 1 is zero, and induction on i finishes. For B ⊗̂ M, H^•_cont(G_n, B ⊗̂ M) = H^•_cont(G_n, B) ⊗̂ M because the cochain complex of B is strict, the cohomology of the unit ball being finitely generated over ℤ_p.

*Needs:* 2.1, 2.3, 2.4; PadicLocalLanglandsForGL2Qp §0.1 (Schikhof duality); Mathlib `continuousCohomology`.

**Checks.**

- For B = C(G_0, E), R^iLA(B) = 0 for i ≥ 1 and B^la = C^la(G_0, E).
- Degenerate case: B = 0.
- For p odd, G = ℤ_p and the character a ↦ (1 + p)^a on E, the representation is admissible and analytic on every G_n, R^0LA is the whole line and R^iLA vanishes for i ≥ 1.
- Non-example: c_0(ℕ, E) with trivial action of ℤ_p is not admissible and is not covered; it is strongly LA-acyclic by the B ⊗̂ M clause applied to the trivial character B = E, a one-dimensional E-Banach representation, and M = c_0(ℕ, ℚ_p), since E ⊗̂_(ℚ_p) c_0(ℕ, ℚ_p) = c_0(ℕ, E) for E finite over ℚ_p (B = ℚ_p is not an E-vector space once E ≠ ℚ_p), which shows that the tensor clause is the source of acyclicity there, not admissibility.

### Examples

- For G = ℤ_p, C(ℤ_p, E) is admissible with locally analytic vectors C^la(ℤ_p, E) and vanishing higher R^iLA.
- For G = ℚ_p^×, the character x ↦ x is an admissible Banach representation without invariant lattice and is very strongly admissible.

### Dependencies

Layers 0–1; NoncommutativeAndEquivariantIwasawa §§0.2–0.3, 0.6–0.7; PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.1, F.4; LocallyAnalyticDistributions §§0.0, 0.2; Mathlib `continuousCohomology`, `BaireSpace.instBarrelledSpace`, `PolynormableSpace.banach_steinhaus`; `TauCeti.completedGroupAlgebra`.

## Layer 3: Solid representations of p-adic groups

This layer develops the representation theory of p-adic Lie groups and locally profinite groups on the solid E-vector spaces of VStackSheavesAndLisseCategories §VS2.2 (Convention 8), which higher Coleman theory uses: the comparison of classical spaces with solid ones, representations of quasi-Stein analytic groups by coactions and the distribution algebra D(𝔾), the Banach comparison, representations of locally profinite groups through the solidified group ring, smooth and λ-smooth representations with the comparison with the discrete group and enough injectives, solid locally analytic vectors with their derived functor and its comparison with Pan's R^iLA, continuous cohomology of locally analytic vectors, and integrable LB representations of Lie algebras. Four notions of action are kept apart: an analytic coaction of 𝔾 (3.2), a continuous action of the locally profinite group 𝔾(E) (3.4), analyticity at a Banach stage (3.8) and an algebraic coaction (ReductiveGroups Layer 1).

### 3.1 Classical locally convex spaces as solid E-vector spaces

Let E be a finite extension of ℚ_p and Mod(E) the solid E-vector spaces (VStackSheavesAndLisseCategories §VS2.2, *Solid nonarchimedean coefficients*). Define a Smith space as Hom_E(V, E) for V a Banach space (the dual of a Banach space with its compact-open topology), an LS space as a countable filtered colimit of Smith spaces with injective transitions, and LB spaces as countable colimits of Banach spaces with injective transitions. Prove: (i) the functor from complete locally convex E-spaces to Mod(E) is fully faithful on metrizable, more generally compactly generated, spaces, in particular on Banach and Fréchet spaces (Rodrigues Jacinto–Rodríguez Camargo, §1.2.1, p. 3); (ii) V ↦ V^∨ = Hom_E(V, E) is an exact anti-equivalence between Fréchet spaces and LS spaces, extending Banach–Smith duality, with Hom_E(V, V′) = Hom_E(V′^∨, V^∨), and V is Fréchet of compact type if and only if V^∨ is LS of compact type; it restricts to the classical duality of nuclear Fréchet spaces and LB spaces of compact type (Rodrigues Jacinto–Rodríguez Camargo, Theorem 3.40, p. 25; Boxer–Calegari–Gee–Pilloni, Proposition 2.2.9, p. 20); (iii) for V Banach and W Smith, Hom_E(V, W) = V^∨ ⊗_(E_■) W and Hom_E(W, V) = W^∨ ⊗_(E_■) V (Rodrigues Jacinto–Rodríguez Camargo, Corollary 3.17, p. 16); (iv) Smith, Banach, LB and LS spaces, and Fréchet spaces of compact type, are flat in Mod(E) (Boxer–Calegari–Gee–Pilloni, Lemma 2.2.14, p. 21). VStackSheavesAndLisseCategories §VS2.2 assigns this comparison with classical spaces to its functional-analysis consumer; it is stated here because Layer 3 is that consumer.

API:

- Full faithfulness: on complete compactly generated locally convex E-spaces, in particular Banach and Fréchet spaces, continuous E-linear maps are the same as maps of the associated solid E-vector spaces.
- Duality: V ↦ V^∨ = Hom_E(V, E) is an exact anti-equivalence between Fréchet spaces and LS spaces with Hom_E(V, V′) = Hom_E(V′^∨, V^∨); it restricts to Banach–Smith duality and to the classical duality of nuclear Fréchet spaces with LB spaces of compact type, and V is of compact type if and only if V^∨ is.
- Internal Hom: for V Banach and W Smith, Hom_E(V, W) = V^∨ ⊗_(E_■) W and Hom_E(W, V) = W^∨ ⊗_(E_■) V.
- Flatness: Smith, Banach, LB and LS spaces and Fréchet spaces of compact type are flat for ⊗_(E_■) in Mod(E).

*Needs:* VStackSheavesAndLisseCategories §VS2.2 (*Solid nonarchimedean coefficients*), §VS2.1 (*derived-solid-tensor*); LocallyAnalyticDistributions §0.0; PadicLocalLanglandsForGL2Qp §0.1 (classical compact-type duality).

**Checks.**

- Degenerate case: E itself is Banach and Smith, and E^∨ = E.
- For V = c_0(ℕ, E), V^∨ is the Smith space (∏_ℕ O_E)[1/p] of sequences with uniformly bounded denominators, not the full product ∏_ℕ E: the latter is Fréchet, and its dual is the LS space ⊕_ℕ E.
- For V = c_0(ℕ, E), (iii) gives Hom_E(V, V^∨) = V^∨ ⊗_(E_■) V^∨, but for two Banach arguments Hom_E(V, V) is not V^∨ ⊗_(E_■) V: the latter consists of compact operators and does not contain the identity of an infinite-dimensional V, so the Banach and Smith roles in (iii) cannot be exchanged.

### 3.2 Solid representations of a quasi-Stein analytic group

Two kinds of analytic group 𝔾 over Spa(E, O_E) are treated: the analytification of an affine algebraic group over E, which is a Stein space, and a quasi-compact affinoid open subgroup of such an analytification. Both are quasi-Stein (AdicSpacesPartIII §R3.4, *quasi-stein-space*; an affinoid through its constant exhaustion), so the ring O_𝔾 of global functions, the inverse limit of the affinoid algebras of an exhaustion, is a Fréchet space and an object of Mod(E); the group law makes it a Hopf algebra, with comultiplication μ and counit e the evaluation at the identity. A solid representation of 𝔾 is an O_𝔾-comodule in Mod(E): a solid E-vector space V with a map c : V → V ⊗_E O_𝔾 that is coassociative, (c ⊗ id) ∘ c = (id ⊗ μ) ∘ c, and counital, (id ⊗ e) ∘ c = id. Their category is Mod_𝔾(E), and B_𝔾(E), LB_𝔾(E) are its full subcategories of objects whose underlying space is Banach, respectively LB. The distribution algebra D(𝔾) := Hom_E(O_𝔾, E) is an algebra under the transpose of μ, and every solid representation is a D(𝔾)-module, a distribution acting by applying c and evaluating the distribution on the O_𝔾-factor (Boxer–Calegari–Gee–Pilloni, §2.2.15–§2.2.16 and Remark 2.2.18, pp. 21–22; Rodrigues Jacinto–Rodríguez Camargo, §1.2.2, pp. 3–4).

API:

- The functor Mod_𝔾(E) → Mod(D(𝔾)) given by pairing the coaction with distributions is faithful.
- An algebraic representation of an affine algebraic group, with its analytified coaction, is a solid representation of the analytification.
- Restriction along an open analytic subgroup 𝔾′ ⊆ 𝔾 pulls back along O_𝔾 → O_𝔾′.

*Needs:* 3.1; AdicSpacesPartIII §R3.4; VStackSheavesAndLisseCategories §VS2.2; ReductiveGroups Layer 1.

**Checks.**

- Degenerate case: the trivial representation E with c(v) = v ⊗ 1 is solid, and D(𝔾) acts on it by evaluation at e.
- For 𝔾 = 𝔾_m^an and V = E with c(v) = v ⊗ T^k, the action of 𝔾_m(ℤ_p) = ℤ_p^× is x ↦ x^k.
- For V = O_𝔾 with c = μ, a distribution acts by pairing one tensor factor with the comultiplication, which is the action on functions, not a convolution of two functions.
- Non-example: for 𝔾 = ℤ_p + p𝔻, the character of ℤ_p trivial on p²ℤ_p and nontrivial on pℤ_p is smooth but not analytic for 𝔾: a rigid function on the disc p𝔻 that is constant on each coset of p²ℤ_p in pℤ_p takes one value infinitely often, hence is constant.

### 3.3 Banach representations of a quasi-compact analytic group

For a quasi-compact analytic group 𝔾 and a Banach space V, prove that Hom_E(D(𝔾), V) = O_𝔾 ⊗_E V; consequently every D(𝔾)-module structure on V comes from a unique coaction, and the functor of 3.2 restricts to an equivalence B_𝔾(E) ≃ B(D(𝔾)) between Banach representations of 𝔾 and D(𝔾)-modules whose underlying space is Banach (Boxer–Calegari–Gee–Pilloni, Remark 2.2.19, p. 22). The proof route: quasi-compactness makes O_𝔾 Banach and D(𝔾) Smith, so 3.1 (iii) gives the Hom formula, and module axioms correspond to comodule axioms.

*Needs:* 3.1, 3.2.

**Checks.**

- Degenerate case: for 𝔾 = 1 both sides are the category of Banach spaces.
- For 𝔾 the closed disc subgroup ℤ_p + p𝔻 (p odd) and V = E with the character a ↦ (1 + p)^a, the D(𝔾)-module E is Banach and corresponds to this coaction.
- Scope: for the Stein, not quasi-compact, group 𝔾_m^an the algebra O_𝔾 is Fréchet and D(𝔾) is LS, not Smith, so 3.1 (iii) does not give the Hom formula; the equivalence is stated for quasi-compact 𝔾 only.

### 3.4 Solid representations of a locally profinite group

For a locally profinite group M, regarded as a condensed group, the coefficient algebra of its solid representations is E_■[M], the solid E-vector space freely generated by M: maps E_■[M] → V in Mod(E) are the maps of condensed sets M → V, and the group law of M makes E_■[M] an algebra, the solidification of the condensed group ring E[M]. For a compact open subgroup M_0, E_■[M_0] = (lim_N O_E[M_0/N])[1/p], the limit over the open normal subgroups N of M_0, and E_■[M] is the direct sum of the translates δ_m ∗ E_■[M_0] over representatives m of M/M_0, that is, E[M] ⊗_(E[M_0]) E_■[M_0]. Mod_M(E) is the category of E_■[M]-modules in Mod(E), the solid representations of M; by the universal property of E_■[M], such a module structure on a solid E-vector space V is the same as an action M × V → V of condensed sets that is E-linear in V and satisfies the axioms of a group action (Boxer–Calegari–Gee–Pilloni, §2.2.20, Definition 2.2.21 and Remark 2.2.22, p. 22; Rodrigues Jacinto–Rodríguez Camargo, §1.2.2, p. 3). Prove that this description of E_■[M] does not depend on M_0, because E_■[M_0] is free over E_■[M_1] for open M_1 ⊆ M_0; that for compact M, E_■[M] is the rational Iwasawa algebra with its weak topology (PadicMeasuresIwasawaAlgebras §1.7, `TauCeti.completedGroupAlgebra`); and that Mod_M(E) is abelian with all limits and colimits computed on underlying solid spaces.

API:

- A continuous representation of M on a complete locally convex E-space, compactly generated, gives an object of Mod_M(E) through 3.1 (i).
- For a continuous Banach representation of compact M, the E_■[M]-module structure restricts on E[M] to the given action and on the Iwasawa algebra to the module structure of the Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1.

*Needs:* 3.1; PadicMeasuresIwasawaAlgebras §1.7; `TauCeti.completedGroupAlgebra`; VStackSheavesAndLisseCategories §VS2.2.

**Checks.**

- Degenerate case: for M = 1, E_■[M] = E and Mod_M(E) = Mod(E).
- For M finite, E_■[M] = E[M], the group algebra.
- For M = ℤ_p, E_■[M] = O_E[[T]][1/p] with T = [1] − 1, not the larger ring of all power series with E-coefficients.

### 3.5 Smooth and λ-smooth solid representations

The smooth part of V ∈ Mod_M(E) is V^sm := colim_N V^N, the filtered colimit over the compact open subgroups N of M of the invariant subobjects V^N, computed in Mod(E). Call V smooth when V^sm is all of V, and write Mod^sm_M(E) for the full subcategory of smooth objects. A continuous character λ : M → E^× twists the notion: V is λ-smooth when V ⊗_E E(−λ) is smooth, E(−λ) being the line on which M acts through λ⁻¹ (Boxer–Calegari–Gee–Pilloni, §2.2.23 and Definition 2.2.26 with the note after it, pp. 22–23). Prove that V ↦ V^sm is right adjoint to the inclusion of smooth representations and that if λλ′⁻¹ is smooth then λ-smooth and λ′-smooth representations coincide.

API:

- For classical smooth representations of countable dimension with their finest locally convex E-topology, solid smooth vectors agree with SmoothRepresentationsOfLocalGroups SR.0.1 (*smooth-vectors*); the coefficients E keep their p-adic topology.

*Needs:* 3.4; SmoothRepresentationsOfLocalGroups SR.0.1.

**Checks.**

- Degenerate case: the trivial representation is smooth, and for M = 1 every representation is smooth.
- Non-example: for M = ℤ_p^× and k ≠ 0, the character x ↦ x^k on E is not smooth (no open subgroup acts trivially) but is x^k-smooth.
- For π = ⊕_(j∈ℕ) E with its locally convex direct-sum topology and trivial M-action, π^sm = π, with p-adic, not discrete, summands.

### 3.6 Smooth solid representations are smooth representations of the discrete group

Write M_disc for the abstract group M with the discrete topology; the coefficients keep their p-adic topology (Convention 8). An E[M_disc]-module V in Mod(E) is smooth if it is the colimit of its invariants under the compact open subgroups of M, viewed as subgroups of M_disc; Mod^sm_(M_disc)(E) is the category of these. Prove that restricting the action along the continuous bijection M_disc → M is an equivalence Mod^sm_M(E) ≃ Mod^sm_(M_disc)(E) (Boxer–Calegari–Gee–Pilloni, Lemma 2.2.24 and its proof, p. 22). The proof route builds the inverse functor. Fix a compact open M_0. Its open normal subgroups N are cofinal among the compact open subgroups of M, so a smooth V is the colimit of the V^N. On V^N the abstract group M_0 acts through the finite group M_0/N, which is the same for both topologies, so V^N is a module over E[M_0/N], a quotient of E_■[M_0]. These structures are compatible as N shrinks and make V an E_■[M_0]-module, which the coset decomposition of E_■[M] (3.4) extends to an E_■[M]-module.

*Needs:* 3.4, 3.5.

**Checks.**

- For M = ℤ_p, smooth objects on both sides are colimits of representations of the finite groups ℤ/p^n.
- Degenerate case: for M discrete the functor is the identity.
- Non-example: the character x ↦ x^k of ℤ_p^× (k ≠ 0) is a representation of (ℤ_p^×)_disc in Mod(E) but not smooth there, so it is outside both categories.

### 3.7 Smooth solid representations form a Grothendieck category

With the cardinal bound κ of Convention 8, prove that Mod^sm_M(E) is Grothendieck abelian, so that it has enough injectives (Boxer–Calegari–Gee–Pilloni, Lemma 2.2.25 and its proof, pp. 22–23; Stacks Project, Tag 079H). The generator is built by induction from compact open subgroups: for a compact open N and a κ-small profinite set S, let N act trivially on the free solid space E_■[S] and put P_(S,N) := E_■[M] ⊗_(E_■[N]) E_■[S]. Maps from P_(S,N) to a smooth V are the S-points V^N(S) of its N-invariants, so the direct sum of the P_(S,N) over all such pairs, a set because of κ, is a generator.

*Needs:* 3.5, 3.6; SmoothRepresentationsOfLocalGroups SR.0d.1 (*grothendieck-abelian*).

**Checks.**

- For classical countable-dimensional smooth representations with their finest locally convex E-topology, the generators with S a point are the compact inductions c-Ind_N^M E of SmoothRepresentationsOfLocalGroups SR.2.1 (*compact-induction*).
- Degenerate case: for M = 1 the category is Mod(E) and E_■[S] are its compact projective generators.
- Filtered colimits are exact because invariants under compact open N commute with filtered colimits of smooth objects; without the bound κ the generator would not be a set.

### 3.8 Locally analytic vectors of solid representations

Let M be the group 𝔾(ℚ_p) of rational points of an analytic group 𝔾 over Spa(ℚ_p, ℤ_p) whose identity has a basis of quasi-compact open subgroups 𝔾_r that are polydiscs in the chart given by an ordered basis of a uniform open subgroup (Rodrigues Jacinto–Rodríguez Camargo, Remark 1.4, p. 4; NoncommutativeAndEquivariantIwasawa §§0.6–0.7), and put M_r := 𝔾_r(ℚ_p). For V ∈ Mod_M(E), M_r acts in three commuting ways on the solid space O_(𝔾_r,E) ⊗_E V of V-valued analytic functions on 𝔾_r: ∗_l and ∗_r translate the argument on the left and on the right, and ∗_V acts on the values. The M_r-analytic vectors V^(M_r-an) := H^0(M_r, O_(𝔾_r,E) ⊗_E V) are the invariants of the diagonal action ∗_l ⊗ ∗_V, the analytic functions with f(gx) = g·f(x), that is, the analytic orbit maps; ∗_r still acts on them, and evaluation at e on the same 𝔾_r embeds them into V. Put V^la := colim_r V^(M_r-an) ∈ Mod_M(E), so that V^sm ⊆ V^la ⊆ V, and let V^Rla := hocolim_r RHom_(E_■[M_r])(E, V ⊗^L_E O_(𝔾_r,E)) be its derived version, with H^0(V^Rla) = V^la (Boxer–Calegari–Gee–Pilloni, §2.2.27 and Remark 2.2.28, p. 23; Rodrigues Jacinto–Rodríguez Camargo, Definition 4.40, p. 39, and §1.2.3, p. 5). Prove: (i) V ↦ V^la is left exact and M-equivariant for the conjugation of the 𝔾_r; (ii) for V a Banach representation, V^la is the space of CompletedCohomologyPartII F.4 and H^i(V^Rla) = R^iLA(V) of 2.3; (iii) for V an admissible Banach representation, V^Rla is concentrated in degree 0 (Rodrigues Jacinto–Rodríguez Camargo, Proposition 4.48, p. 41).

The proof route for (ii) works with the group M_r alone at stage r. For Banach V, O_(𝔾_r,E) ⊗_E V is the completed projective tensor product V ⊗̂_(ℚ_p) O(𝔾_r) (Rodrigues Jacinto–Rodríguez Camargo, §1.2.2, p. 4), and for M_r = G_n in the ordered-basis chart of 2.3, restriction to the rational points identifies O(𝔾_r) with Pan's C^an(G_n, ℚ_p), the power series with p^(n|k|)b_k → 0, with M_r acting by left translation. Solid cohomology of the compact group M_r with coefficients in a Banach representation is its continuous cohomology (Rodrigues Jacinto–Rodríguez Camargo, §1.2.3, p. 5), so H^i RHom_(E_■[M_r])(E, V ⊗ O_(𝔾_r,E)) = H^i_cont(G_n, V ⊗̂ C^an(G_n, ℚ_p)), the stage n of 2.3, and cohomology commutes with the filtered homotopy colimit over r. The larger group M_0 does not act on O(𝔾_r), since its translations move the polydisc 𝔾_r off itself, so no Shapiro argument is applied to O(𝔾_r). The definition agrees with that of Rodrigues Jacinto–Rodríguez Camargo, whose affinoid neighbourhoods M_0·𝔾_r have the full group M_0 of rational points (Definition 4.4, p. 29, and Remark 1.4, p. 4): the functions on M_0·𝔾_r, a disjoint union of the translates g·𝔾_r for g ∈ M_0/M_r, form the finite induction from M_r to M_0 of O(𝔾_r), and Shapiro's lemma for this induced module identifies their stage RHom_(E_■[M_0])(E, V ⊗ O(M_0·𝔾_r) ⊗ E) with the stage r here. For (iii), (ii) and 2.5 give H^i(V^Rla) = R^iLA(V) = 0 for i ≥ 1, V being admissible; Rodrigues Jacinto–Rodríguez Camargo prove it on the neighbourhoods M_0·𝔾_r from the algebraic flatness of their distribution algebras over E_■[M_0] (Proposition 4.48 and its proof, pp. 41–42).

API:

- The residual action ∗_r on V^(M_r-an) agrees there with (∗_l ∘ ∗_r) ⊗ ∗_V, since ∗_l ⊗ ∗_V is trivial on invariants; evaluation at e intertwines it with the action on V.
- V^Rla is functorial and exact as a functor to the derived category of E_■[M]-modules.

*Needs:* 3.1, 3.4, 3.5; 2.3, 2.5; CompletedCohomologyPartII F.4; NoncommutativeAndEquivariantIwasawa §§0.6–0.7; Mathlib `continuousCohomology`.

**Checks.**

- For V smooth, V^sm = V^la = V.
- Degenerate case: for the trivial representation E, V^(M_r-an) = E for every r.
- For B = C(ℤ_p, E) with translation, V^la = C^la(ℤ_p, E), and V^la → V is not surjective.
- For an analytic character χ of M_r, the invariant function with value v at e is f(g) = χ(g)v; right translation by h gives χ(h)v at e, whereas the model ∗_r ⊗ ∗_V would give χ(h)²v.
- Action domain: for M_0 = ℤ_2 and M_1 = 2ℤ_2 with 𝔾_1 = 2𝔻 the closed disc of radius 1/2, translation by 1 ∈ M_0 sends 0 ∈ 𝔾_1 to 1 ∉ 𝔾_1, so M_0 does not act on O(𝔾_1) = E⟨T/2⟩, an integral domain whose only idempotents are 0 and 1. The neighbourhood M_0·𝔾_1 = 2𝔻 ⊔ (1 + 2𝔻) has functions E⟨T/2⟩ × E⟨T/2⟩ with the idempotent (1, 0), and this is the induction of O(𝔾_1) from 2ℤ_2 to ℤ_2, on which ℤ_2 acts. Identifying O(𝔾_1) itself with the induction would equate a ring with two idempotents with one with four.

### 3.9 Continuous cohomology of locally analytic vectors

For a compact p-adic Lie group M and C in the derived category of E_■[M]-modules, prove RHom_(E_■[M])(E, C) ≅ RHom_(E_■[M])(E, C^Rla), giving a spectral sequence Ext^i_(E_■[M])(E, H^j(V^Rla)) ⇒ Ext^(i+j)_(E_■[M])(E, V); consequently, if V is a continuous representation on a complete locally convex space with no higher locally analytic vectors, in particular an admissible Banach representation (3.8 (iii) or 2.5), then H^i_cont(M, V) = H^i_cont(M, V^la) for all i (Rodrigues Jacinto–Rodríguez Camargo, Theorem 1.5 and Corollary 1.6, p. 5). The statement concerns compact M; for non-compact G it is applied to compact open subgroups only.

*Needs:* 3.8; 2.5; Mathlib `continuousCohomology`.

**Checks.**

- For V finite-dimensional, V^la = V and the statement is trivial.
- For M = ℤ_p and V = C(ℤ_p, E), H^0_cont(ℤ_p, V) = E·1 = H^0(ℤ_p, C^la(ℤ_p, E)), and H¹_cont(ℤ_p, V) = 0 by Shapiro's lemma, so the theorem gives H¹_cont(ℤ_p, C^la(ℤ_p, E)) = 0.
- Non-example: for non-compact M = ℚ_p^× and V = E trivial the comparison of continuous cohomology is not asserted, since continuous cohomology of non-compact groups is not the solid Ext of this target.

### 3.10 Integrable LB representations of a Lie algebra

Let g be the E-Lie algebra of the analytic group germ 𝔾_e and 𝒰(g) its Arens–Michael envelope (LocallyAnalyticDistributionsPartII §2.5). Define an LB representation of g as a continuous 𝒰(g)-module V presented by an increasing sequence of g-stable Banach subspaces V_r with injective transitions; it is integrable if, after a cofinal reindexing, each V_r carries an analytic action of a shrinking analytic subgroup 𝔾_r whose derivative is the given action and whose restrictions agree at later stages (Boxer–Calegari–Gee–Pilloni, Definition 3.4.2 and Proposition 3.4.3, p. 53). The result is an action of the group germ: each stage integrates on its own neighbourhood; no fixed 𝔾_r acts on all of V.

API:

- Two integrations with the same differentiated action agree after shrinking on each Banach stage, by 3.3 and the local isomorphism given by the exponential.
- Every vector lies in a Banach stage analytic for a suitable neighbourhood.

*Needs:* 3.3, 3.8, 0.3; LocallyAnalyticDistributionsPartII §2.5.

**Checks.**

- A finite-dimensional algebraic representation of 𝔾 is integrable for the constant filtration.
- Degenerate case: the zero module is integrable.
- Non-example: the infinite-dimensional Verma module of sl₂ with its finest countable-dimensional LB topology is not integrable: every Banach subspace is finite-dimensional, and the freely acting lowering operator has no nonzero finite-dimensional stable subspace.
- The completed Verma dual of Boxer–Calegari–Gee–Pilloni, Proposition 3.4.3, p. 53, is integrable; its completion distinguishes it from the finest-topology Verma module.

### Examples

- For M = ℤ_p, E_■[M] = O_E[[T]][1/p], smooth solid representations are colimits of representations of ℤ/p^n, and for B = C(ℤ_p, E) the solid locally analytic vectors are C^la(ℤ_p, E) with vanishing higher derived vectors.

### Dependencies

Layers 0 and 2; LocallyAnalyticDistributions §0.0; VStackSheavesAndLisseCategories §§VS2.1–VS2.2; AdicSpacesPartIII §R3.4; PadicMeasuresIwasawaAlgebras §1.7; LocallyAnalyticDistributionsPartII §2.5; NoncommutativeAndEquivariantIwasawa §§0.6–0.7; PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.4; SmoothRepresentationsOfLocalGroups SR.0.1, SR.0d.1, SR.2.1; ReductiveGroups Layer 1; Mathlib `continuousCohomology`; `TauCeti.completedGroupAlgebra`.

## Layer 4: Category O for split reductive Lie algebras

This layer is pure Lie algebra over a field k of characteristic zero; in the applications k = E and the Lie algebra is g ⊗_(ℚ_p) E = ∏_(σ∈Σ_L) g_σ, the Lie algebra of (Res_(L/ℚ_p)𝐆) ×_(ℚ_p) E = ∏_σ 𝐆 ×_(L,σ) E for a split connected reductive 𝐆 over L, in particular ∏_σ gl_n, or in 10.1 the subproduct over the embeddings other than a fixed one. It extends the highest-weight theory of the library and of LieHighestWeight, and the dominant split-field modules of ReductiveGroups §9A, to arbitrary rational highest weights of split reductive algebras over k, defines the BGG category O and its parabolic algebraic subcategories O^p_alg as Orlik–Strauch do, constructs generalised Verma modules and their simple quotients with the maximal parabolic of a simple object, the restricted BGG duality, the low-length Verma multiplicities for products of gl_n, and Kostant homology of nilradicals. Throughout, 𝔤 = Lie(𝐆) for a split connected reductive group 𝐆 over k with split maximal torus 𝐓, both fixed as part of the data, 𝔥 = Lie(𝐓) the split Cartan subalgebra, Borel 𝔟 = 𝔥 ⊕ 𝔫 attached to a base Δ, Weyl group W, ρ the half-sum of positive roots, dot action w·μ = w(μ + ρ) − ρ, and X ⊆ 𝔥^* the lattice of differentials of the algebraic characters of 𝐓 (Orlik–Strauch, §2.5, pp. 7–8, and Definition 2.6, p. 8). The categories O and O^p depend only on 𝔤, 𝔥 and 𝔟; the lattice X, and with it O_alg and O^p_alg, depends on 𝐆 (4.2, Checks).

### 4.1 Highest-weight theory for split reductive Lie algebras over a field of characteristic zero

Write 𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤] with 𝔥 = 𝔷(𝔤) ⊕ 𝔥′, 𝔥′ = 𝔥 ∩ [𝔤, 𝔤]. Prove: (i) for μ ∈ 𝔥^*, the Verma module M(μ) = U(𝔤) ⊗_(U(𝔟)) k_μ has a unique maximal proper submodule, defined over k as the sum of the submodules meeting the μ-weight space trivially, hence a unique simple quotient L(μ), and M(μ) ⊗_k k̄ and L(μ) ⊗_k k̄ are the Verma module and its simple quotient over an algebraic closure k̄; in particular L(μ) is absolutely irreducible. These are not a second construction: M(μ) and L(μ) are `TauCeti.VermaModule` and `TauCeti.irreducibleQuotient` of the semisimple algebra [𝔤, 𝔤] for the restriction of μ to 𝔥′, with 𝔷(𝔤) acting through μ (LieHighestWeight Layer 3); (ii) for λ ∈ X dominant, L(λ) is the finite-dimensional module L_k(λ) of ReductiveGroups §9A, item 5, and the finite-dimensional simple 𝔤-modules on which 𝔥 acts diagonalisably with weights in X are exactly these L(λ), pairwise non-isomorphic and absolutely irreducible; (iii) finite-dimensional 𝔤-modules on which 𝔷(𝔤) acts semisimply are semisimple; (iv) the centre Z(U(𝔤)) is isomorphic by the Harish-Chandra map to the dot-invariants S(𝔥)^((W,·)), and for k-rational μ, μ′ the infinitesimal characters of M(μ) and M(μ′) agree if and only if μ′ ∈ W·μ. For 𝔤 = ∏_σ 𝔤_σ all four statements are products over σ.

The proof route is base change to k̄ and descent: weight spaces, the PBW filtration and the maximal submodule are defined over k because 𝔥 is split, and simplicity and multiplicities are detected after base change. For (ii), a finite-dimensional simple M with weights in X contains a vector of a maximal weight λ killed by 𝔫, so M is a quotient of M(λ) and hence L(λ) by (i); λ is dominant because L(λ) ⊗_k k̄ is finite-dimensional with highest weight λ (`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` over k̄, for [𝔤, 𝔤]), and the base change of ReductiveGroups §9A, item 5, identifies L(λ) with L_k(λ). For (iii), when 𝔷(𝔤) acts with eigenvalues in k this is `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, with `TauCeti.exists_isCompl_of_isKilling` for [𝔤, 𝔤]; in general semisimplicity of a finite-dimensional module in characteristic zero holds if and only if it holds after base change to k̄, where the eigenvalues lie in k̄. For (iv), the centre is the kernel of the k-linear map u ↦ (x ↦ [x, u]), so its formation commutes with base change to k̄, where `TauCeti.harishChandraIso` and `TauCeti.vermaCentralCharacter_eq_iff` apply to [𝔤, 𝔤] and the factor U(𝔷(𝔤)) = S(𝔷(𝔤)) is central (LieHighestWeight Layers 7 and 9).

*Needs:* ReductiveGroups §9A, item 5 (*The split-field producer used here*); LieHighestWeight Layers 3, 7, 9; `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`, `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`, `TauCeti.exists_isCompl_of_isKilling`, `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, `TauCeti.harishChandraIso`, `TauCeti.vermaCentralCharacter_eq_iff`; Mathlib `UniversalEnvelopingAlgebra`.

**Checks.**

- For 𝔤 = gl_2 over ℚ_p and λ = (k, 0), L(λ) = Sym^k(k²) of dimension k + 1; for λ = (1, 1), L(λ) = det, of dimension 1.
- Degenerate case: for 𝔤 = 𝔥 abelian (a torus), M(μ) = L(μ) = k_μ.
- Non-example: for ε ∈ ℚ_p^× not a square, the Cartan subalgebra 𝔥 = {(a, b; εb, a)} of gl_2(ℚ_p) is not split: ad of (0, 1; ε, 0) has eigenvalues ±2√ε ∉ ℚ_p on gl_2, so there are no ℚ_p-rational root spaces and (i)–(ii) do not apply to it.
- For gl_2, μ = (0, 0) and μ′ = s·μ = (−1, 1) have equal infinitesimal characters, while (0, 0) and (1, −1) do not.

### 4.2 The categories O, O^p and O^p_alg

Define O as the full subcategory of U(𝔤)-modules that are finitely generated, decompose as direct sums of one-dimensional 𝔥-modules, and on which 𝔟 acts locally finitely; O_alg ⊆ O the modules whose weights lie in X. For a standard parabolic 𝔭 = 𝔩_P ⊕ 𝔲_P ⊇ 𝔟, define O^p as the modules in O that are direct sums of finite-dimensional simple 𝔩_P-modules and locally finite under 𝔲_P, and O^p_alg = O_alg ∩ O^p (Orlik–Strauch, §2.5, Definition 2.6, pp. 7–9). Prove: (i) O, O_alg, O^p and O^p_alg are k-linear abelian, noetherian and artinian, closed under submodules, quotients and finite direct sums, and every object has a finite Jordan–Hölder series, the same in O and in O^p_alg; (ii) O^q ⊆ O^p for standard q ⊇ p, O^b = O, and O^g consists of the finite-dimensional 𝔤-modules on which 𝔥 acts diagonalisably with eigenvalues in k, that is, the finite-dimensional objects of O; these are semisimple by 4.1 (iii), since 𝔷(𝔤) ⊆ 𝔥 then acts semisimply, and are the finite direct sums of the L(μ) with ⟨μ, α^∨⟩ ∈ ℤ_(≥0) for all α ∈ Δ; a finite-dimensional semisimple 𝔤-module on which 𝔥 has an eigenvalue outside k is not an object of O, hence not of O^g; (iii) a module M of O^p lies in O^p_alg if and only if each of its simple 𝔩_P-summands is the differential of an algebraic representation of the Levi subgroup L_P; and for M ∈ O^p_alg every finite-dimensional 𝔩_P-stable (respectively 𝔭-stable) subspace of M carries a unique algebraic action of L_P (respectively of P) whose differential is the given action of 𝔩_P (respectively 𝔭) (Orlik–Strauch, Lemma 2.8 and its proof, p. 9). The proof route: a finite-dimensional 𝔩_P-module with an algebraic action of the split torus whose differential is the action of 𝔥 lifts uniquely to L_P, the torus action being the one with weights in X; on a 𝔭-stable subspace the nilpotent action of 𝔲_P exponentiates to the unipotent radical, compatibly with the Levi action. The same definitions with 𝔟⁻ and the lower parabolics 𝔭⁻ give the categories used for Verma modules M⁻(μ) = U(𝔤) ⊗_(U(𝔟⁻)) μ in Layers 6–10.

API:

- Exactness of the forgetful functor to k-vector spaces and of restriction to 𝔩_P.
- Each object of O^p_alg is generated by a finite-dimensional 𝔭-stable subspace W, giving a surjection U(𝔤) ⊗_(U(𝔭)) W → M.

*Needs:* 4.1; ReductiveGroups Layers 1, 4, 7 and 8 (algebraic representations, characters of split tori, Levi subgroups, split reductive groups), for X and (iii).

**Checks.**

- Degenerate case: for 𝔭 = 𝔤, O^g_alg is the category of finite-dimensional algebraic 𝔤-modules; for gl_2 the module det ⊕ Sym² lies in it.
- The Verma module M(μ) lies in O_alg if and only if μ ∈ X (Orlik–Strauch, Example 2.7, p. 8): for 𝐆 = GL_2 over ℚ_p, μ = (1/2, 0) gives an object of O but not of O_alg.
- Dependence on the group: for 𝔤 = sl_2 over ℚ_p, 𝔥 = ℚ_p·H with H = diag(1, −1) and ϖ(H) = 1, the group SL_2 gives X = ℤϖ, and the standard two-dimensional module, of weights ±ϖ, lies in O^g_alg; PGL_2, with the same Lie algebra, gives X = ℤα = 2ℤϖ, since the character diag(t, 1) ↦ t of its torus has differential H ↦ 2, so the same module lies in O^g but not in O^g_alg. A lattice read off from 𝔤 alone could not give both answers.
- Non-example: for gl_2 the infinite-dimensional module U(gl_2) ⊗_(U(𝔥)) k_0 is not in O, since 𝔫 does not act locally finitely.
- Non-example to "finite-dimensional semisimple" as the endpoint: for k = ℚ_3 and 𝔤 = 𝔥 = Lie(𝔾_m), let the generator t act on k² by (0 3; 1 0). Its characteristic polynomial X² − 3 has no root in ℚ_3, a root having valuation 1/2, so k² ≅ k[t]/(t² − 3) is a simple, hence semisimple, two-dimensional 𝔤-module whose sum of k-weight spaces is 0, not 2-dimensional; it is not in O, and so not in O^g. After extension to ℚ_3(√3) it splits into the two weight lines t = ±√3. For 𝔤 = 𝔥, O^g consists exactly of the finite direct sums of one-dimensional modules k_μ, μ ∈ 𝔥^*.

### 4.3 Generalised Verma modules and simple objects

For a finite-dimensional simple algebraic 𝔩_P-module W, inflated to 𝔭, define the generalised Verma module M_P(W) = U(𝔤) ⊗_(U(𝔭)) W. Prove: (i) M_P(W) lies in O^p_alg and has a unique simple quotient L(λ_W), λ_W the highest weight of W; (ii) the simple objects of O^p_alg are the L(λ) with λ ∈ X dominant for 𝔩_P, pairwise non-isomorphic; (iii) for λ ∈ X let I = {α ∈ Δ : ⟨λ, α^∨⟩ ∈ ℤ_(≥0)}; then P_I is the largest standard parabolic with L(λ) ∈ O^(p_I)_alg, the maximal parabolic of L(λ), and the kernel of M(λ) → M_(P_I)(V_I(λ)) is the image of ⊕_(α∈I) M(s_α·λ) (Orlik–Strauch, Example 2.10, p. 9, and Introduction, p. 3; Humphreys, BGG category O, §§9.3–9.4); (iv) every object of O^p has a unique maximal parabolic.

API:

- For a finite-dimensional simple algebraic 𝔩_P-module W inflated to 𝔭, M_P(W) is an object of O^p_alg generated by W and has a unique simple quotient, L(λ_W) with λ_W the highest weight of W.
- Every simple object of O^p_alg is L(λ) for exactly one λ ∈ X dominant for 𝔩_P.
- For λ ∈ X and I = {α ∈ Δ : ⟨λ, α^∨⟩ ∈ ℤ_(≥0)}, L(λ) lies in O^q_alg for a standard parabolic subalgebra q exactly when q ⊆ p_I (by (iii) and 4.2 (ii)), and the kernel of M(λ) → M_(P_I)(V_I(λ)) is the image of ⊕_(α∈I) M(s_α·λ).
- Every object of O^p has a unique maximal standard parabolic.

*Needs:* 4.1, 4.2.

**Checks.**

- For 𝔭 = 𝔟, M_B(k_μ) = M(μ); for 𝔭 = 𝔤 and W = L(λ) finite-dimensional, M_G(W) = W.
- For gl_2 and λ = (k, 0) with k ≥ 0, I = Δ and the maximal parabolic of L(λ) is gl_2; for λ = (0, 2), ⟨λ, α^∨⟩ = −2 < 0, I = ∅ and the maximal parabolic is 𝔟.
- Non-example: for gl_3 and λ = (2, 0, 1), ⟨λ, α_1^∨⟩ = 2 and ⟨λ, α_2^∨⟩ = −1, so I = {α_1} and L(λ) does not lie in O^(q)_alg for the parabolic attached to {α_2}.

### 4.4 The restricted BGG duality

Let τ be the anti-involution of U(𝔤) that is the identity on 𝔥 and maps each root space 𝔤_α to 𝔤_(−α). For M ∈ O define M^∨ := ⊕_μ Hom_k(M_μ, k) with x ∈ 𝔤 acting by (x·f)(m) = f(τ(x)m). Prove that M ↦ M^∨ is an exact contravariant involutive functor on O preserving O^p_alg and characters, and that L^∨ ≅ L for every simple L; so M^∨ has the composition factors of M in reverse order (Breuil, socle II, §4, p. 14, quoting Humphreys, BGG category O, §3.2, Theorem 3.3 and Proposition 9.3). This duality is distinct from the contragredient W ↦ W′ = Hom_k(W, k) of a finite-dimensional module, which negates weights.

API:

- M ↦ M^∨ is an exact contravariant functor from O to O with a natural isomorphism M ≅ (M^∨)^∨; it preserves O^p_alg and the dimension of every weight space.
- L^∨ ≅ L for every simple object L; hence a composition series of M dualises to one of M^∨ with the same factors in reverse order, and soc M^∨ ≅ M/rad M.

*Needs:* 4.2, 4.3.

**Checks.**

- For a simple finite-dimensional L(λ), L(λ)^∨ ≅ L(λ) has highest weight λ, whereas the contragredient L(λ)′ has highest weight −w_0λ; for gl_2 and λ = (1, 0) these are (1, 0) and (0, −1).
- For gl_2 and dominant λ, M(λ)^∨ has socle L(λ) and top L(s·λ), while M(λ) has top L(λ) and socle L(s·λ).
- Degenerate case: 0^∨ = 0, and for 𝔤 abelian the functor is linear duality of weight spaces.

### 4.5 Verma multiplicities in length at most one for products of gl_n

Let 𝔤 = ∏_(σ∈Σ_L) gl_n over E with Borel 𝔟⁻ the lower triangular matrices in each factor, W = S_n^(Σ_L), lg(u) = Σ_σ lg(u_σ), s_(i,σ) the simple reflection (i, i+1) in the σ-factor, λ dominant integral for 𝔟 and the dot action taken with ρ for 𝔟. Prove: (i) the composition factors of M⁻(−λ) are the L⁻(−u·λ), u ∈ W, those with lg(u) ≤ 1 with multiplicity one; (ii) the maximal submodule N of M⁻(−λ) is the sum of the images of the Verma submodules M⁻(−s_(i,σ)·λ) and N/rad N ≅ ⊕_(lg(u)=1) L⁻(−u·λ), so the first two radical layers of M⁻(−λ) are L⁻(−λ) and ⊕_(lg(u)=1) L⁻(−u·λ); (iii) for a standard parabolic 𝔭 ⊇ 𝔟 with lower parabolic 𝔭⁻ and Levi Weyl group W_P, the simple module L⁻(−s_(i,σ)·λ) occurs in the parabolic Verma module U(𝔤) ⊗_(U(𝔭⁻)) L_P⁻(−λ) if and only if s_(i,σ) ∉ W_P, then with multiplicity one and in the top of the kernel of its map to L⁻(−λ) (Humphreys, BGG category O, Theorems 4.6 and 5.1 and §§9.3–9.4; Orlik–Strauch, Example 2.10, p. 9; Ding, proof of Proposition 3.1 and of Lemma 3.10, arXiv v2 pp. 37 and 44).

The proof route: −λ is dominant integral for 𝔟⁻ and −u·λ is the 𝔟⁻-dot action of u on −λ, so (i) is the BGG theorem (composition factors L(x·μ) with x ≥ the index in the Bruhat order) together with [M(μ) : L(s·μ)] = 1 for a simple reflection s and dominant regular μ; (ii) follows from 4.3 (iii) with I = Δ, Verma's embeddings, and the fact that L⁻(−s·λ) is not a composition factor of M⁻(−s′·λ) for s′ ≠ s; (iii) follows from 4.3 (iii) for I the simple roots of the Levi. Products over σ reduce everything to one factor.

*Needs:* 4.3; LieHighestWeight Layer 7 (central characters); Layer 4.1.

**Checks.**

- For n = 2 and L = ℚ_p, M⁻(−λ) has length 2 with factors L⁻(−λ) (finite-dimensional) and L⁻(−s·λ); for λ = (1, 1), −s·λ = (0, −2).
- Degenerate case: for n = 1, W = 1 and M⁻(−λ) = L⁻(−λ) is a character.
- For n = 3, L = ℚ_p, the second radical layer of M⁻(−λ) has exactly 2 summands, L⁻(−s_1·λ) and L⁻(−s_2·λ), and L⁻(−s_1s_2·λ) lies deeper.
- For n = 3 and the parabolic with Levi GL_2 × GL_1 (W_P = ⟨s_1⟩), L⁻(−s_1·λ) does not occur in the parabolic Verma module and L⁻(−s_2·λ) occurs once.

### 4.6 Kostant homology of nilradicals

For a standard parabolic P = M_P N_P ⊇ B of a split reductive group over E with Lie algebras 𝔫_P, 𝔫_P⁻ and a finite-dimensional algebraic representation V, prove that H_q(𝔫, V) ≅ H^q(𝔫, V^∨)^∨ as algebraic M_P-representations, for 𝔫 = 𝔫_P or 𝔫_P⁻, where V^∨ is the contragredient, by duality of the finite-dimensional Chevalley–Eilenberg complexes, keeping the action on ∧^q 𝔫. With Kostant's theorem (ArithmeticLocallySymmetricSpaces ALS.4.5; gap:kostant-split-reductive) this gives, for V = L(λ) with λ dominant and W^P Kostant's minimal-length representatives, H_q(𝔫_P⁻, L(λ)) ≅ ⊕_(w∈W^P, ℓ(w)=q) V^(M_P)_w·λ (apply Kostant to the opposite positive system and dualise) and H_q(𝔫_P, L(λ)) ≅ ⊕_(w∈W^P, ℓ(w)=q) (V^(M_P)_(w·λ^∨))^∨ with λ^∨ = −w_0λ the highest weight of L(λ)^∨; for P = B these are the characters w·λ and −(w·(−w_0λ)) = w_0(w′·λ) with w′ = w_0ww_0 (Schraen, Théorème 4.10 and (4.40)–(4.42), p. 82, for the homological form).

*Needs:* 4.1; ArithmeticLocallySymmetricSpaces ALS.4.5 with gap:kostant-split-reductive.

**Checks.**

- For GL_2, λ = (k, 0): with the lower radical, H_0 has weight (k, 0) and H_1 weight (−1, k + 1) = s·λ; with the upper radical, H_0 has weight (0, k) and H_1 weight (k + 1, −1). H_1 contains the weight of the root line, not just a weight of L(λ).
- Degenerate case: for P = G, 𝔫_P = 0 and H_0 = V, H_q = 0 for q > 0.
- Non-example: the unadjusted cohomological formula H^q(𝔫, L(λ)) = ⊕ V_w·λ read as homology would give weight (k, 0) for H_0 of the upper radical of Sym^k, whereas the coinvariants of 𝔫 have weight (0, k).

### Examples

- For gl_2 over ℚ_p and λ = (1, 1): L(λ) = det, s·λ = (0, 2), the Verma module M⁻(−s·λ) of highest weight (0, −2) for 𝔟⁻ is simple, and M⁻(−λ) has length 2.

### Dependencies

LieHighestWeight Layers 3, 7, 9; ReductiveGroups Layers 1, 4, 7 and 8 and §9A, item 5 (*The split-field producer used here*); ArithmeticLocallySymmetricSpaces ALS.4.5 with gap:kostant-split-reductive; `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`, `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`, `TauCeti.exists_isCompl_of_isKilling`, `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, `TauCeti.harishChandraIso`, `TauCeti.vermaCentralCharacter_eq_iff`; Mathlib `UniversalEnvelopingAlgebra`.

## Layer 5: Locally analytic parabolic induction, principal series and Schraen's spectral sequence

This layer builds locally analytic parabolic induction with its admissibility, transitivity and locally algebraic and σ-analytic variants, the locally analytic principal series, Ext between locally analytic characters of a split torus, homology under a unipotent radical by Kohlhaase's topological bar construction, and Schraen's spectral sequence for Ext into a parabolic induction. Throughout, G = 𝐆(L) with 𝐆 connected reductive over L, and P = M_P N_P is a parabolic subgroup with opposite P⁻.

### 5.1 Locally analytic parabolic induction

For a locally F-analytic representation U of P on a space of compact type, define (Ind_P^G U)^(F-an) := {f ∈ C^(F-an)(G, U) : f(pg) = p·f(g) for p ∈ P, g ∈ G} with G acting by right translation (Breuil, socle I, §2, (4), p. 8). Prove: (i) it is a closed subspace of C^(F-an)(G, U), of compact type, and a locally F-analytic representation of G, because P\G is compact (ReductiveGroupsPartII RG2.4.4, *iwasawa-decomposition*) and local analytic sections of G → P\G over a finite disjoint compact-open cover identify it with a finite product of spaces of analytic functions on compact sets with compact-type coefficients; (ii) if U is inflated from an admissible (respectively strongly admissible, very strongly admissible) representation of M_P, the induction has the same property (Emerton, Jacquet II, Proposition 2.1.2, p. 21); (iii) induction is transitive, (Ind_P^G (Ind_Q^P U)^an)^an ≅ (Ind_Q^G U)^an for Q ⊆ P by f ↦ (g ↦ f(g)(1)), and exact on strict short exact sequences; (iv) for π smooth admissible of M_P inflated to P and W an algebraic representation of 𝐆, f ⊗ w ↦ (g ↦ f(g) ⊗ g·w) is a G-equivariant injection (Ind_P^G π)^∞ ⊗ W ↪ (Ind_P^G (π ⊗ W|_P))^an onto the locally algebraic induction; (v) the strong dual is the Hausdorff completed balanced tensor product D(G, E) ⊗̂_(D(P,E)) U′, into which the algebraic tensor product maps with dense image (Breuil, socle I, Lemma 2.2 and its proof, pp. 9–10); (vi) for F = ℚ_p and σ ∈ Σ_L, the locally σ-analytic induction (Ind_P^G U)^(σ-an) ⊆ (Ind_P^G U)^(ℚ_p-an) is the subspace on which the action of g ⊗_(ℚ_p) E factors through g_σ (10.1). Inductions are unnormalised. An arbitrary Banach U is not covered: constant U-valued functions give a closed copy of U, and compact type is a hypothesis.

API:

- For P = G the induction is U; for U smooth admissible, the smooth vectors of (Ind_P^G U)^an are the smooth induction of SmoothRepresentationsOfLocalGroups SR.2.1 (*smooth-induction*).
- Transitivity isomorphisms are compatible with composition of three parabolics.

*Needs:* 0.2, 0.9, 1.2, 2.2; ReductiveGroupsPartII RG2.4.4; SmoothRepresentationsOfLocalGroups SR.2.1 (*smooth-induction*, *induction-in-stages*); PadicLocalLanglandsForGL2Qp §0.1 (locally analytic functions on manifolds).

**Checks.**

- Degenerate case: (Ind_G^G U)^an = U.
- For G = GL_2(ℚ_p), P = B⁻ and a locally analytic character χ, (Ind_B⁻^G χ)^an ≅ C^an(ℙ¹(ℚ_p), E) as topological vector spaces.
- For U = 1, (Ind_P^G 1)^an contains the constants as its unique closed one-dimensional subrepresentation.
- Non-example: for a non-smooth character χ = z^λ (λ ≠ 0 algebraic), (Ind_B⁻^G χ)^an has no nonzero smooth vectors.
- For GL_2, W = E² and smooth f, the image function takes the value f(p) ⊗ p·w at p ∈ P; the constant formula f(p) ⊗ w would fail P-equivariance when p·w ≠ w.

### 5.2 Locally analytic principal series

Let 𝐆 be split reductive over L with split maximal torus 𝐓 ⊆ 𝐁 = 𝐓𝐍 and opposite Borel 𝐁⁻, T = 𝐓(L). For a locally ℚ_p-analytic character χ : T → E^× inflated to B⁻, define PS(χ) := (Ind_B⁻^G χ)^(ℚ_p-an) with weight dχ ∈ Hom(t ⊗_(ℚ_p) E, E) = ∏_σ t_σ^*. Prove: (i) PS(χ) is very strongly admissible (5.1, 2.2: characters are finite-dimensional admissible Banach representations); (ii) for χ = χ_sm z^λ with χ_sm smooth and λ dominant algebraic for 𝐁, PS(χ)_lalg = (Ind_B⁻^G χ_sm)^∞ ⊗_E L(λ), where L(λ) is the irreducible algebraic representation of (Res_(L/ℚ_p)𝐆) ×_(ℚ_p) E of highest weight λ (Layer 4.1); (iii) for 𝐆 = GL_n, PS(χ ⊗ (ψ ∘ det)) ≅ PS(χ) ⊗ (ψ ∘ det) for a locally analytic character ψ of L^×; (iv) for ψ ∈ Hom(T, E), PS(χ(1 + ψε)) is a self-extension of PS(χ) (1.9) (Ding, §3.1.2, arXiv v2 p. 37; Breuil, socle I, Corollary 2.5, pp. 11–12; Orlik–Strauch 2010, Theorem 3.1.3, p. 13, for the irreducibility criterion through U(g) ⊗_(U(p)) V′).

The proof route for (ii): for dominant λ the highest-weight line of L(λ) is the unique B⁻-stable quotient line, on which B⁻ acts by z^λ, and Frobenius reciprocity identifies (Ind χ_sm)^∞ ⊗ L(λ) with the locally algebraic induction of 5.1 (iv).

API:

- PS(χ) is a very strongly admissible locally ℚ_p-analytic representation of G.
- For χ = χ_sm z^λ with χ_sm smooth and λ dominant algebraic for 𝐁, the locally algebraic vectors of PS(χ) are (Ind_B⁻^G χ_sm)^∞ ⊗_E L(λ).
- For 𝐆 = GL_n and a locally analytic character ψ of L^×, PS(χ ⊗ (ψ ∘ det)) ≅ PS(χ) ⊗ (ψ ∘ det).
- For ψ ∈ Hom(T, E), PS(χ(1 + ψε)), the induction of the self-extension χ(1 + ψε) of χ (1.9), is a self-extension of PS(χ).

*Needs:* 5.1, 1.6, 2.2; Layer 4.1; ReductiveGroups Layer 7; SmoothRepresentationsOfLocalGroups SR.2.1.

**Checks.**

- Degenerate case: for 𝐆 = GL_1 (B = T = G), PS(χ) = χ.
- For GL_2(ℚ_p) and χ = 1, PS(1)_lalg = (Ind_B⁻^G 1)^∞, a nonsplit extension of the smooth Steinberg representation by the trivial character.
- For χ = z^λ algebraic, dχ = λ.
- Non-example: if λ is not dominant, PS(χ_sm z^λ) has no nonzero locally algebraic vectors: the Verma module U(g ⊗ E) ⊗_(U(b⁻ ⊗ E)) (−λ) has no nonzero finite-dimensional quotient.
- Compatibility: for 𝐆 = GL_2 and L = ℚ_p, f ↦ (g ↦ f(w⁻¹g)) with w the Weyl element identifies PS(χ_1 ⊠ χ_2) with the induction (Ind_B^G χ_2 ⊠ χ_1)^an from the upper Borel, so PS(η_1ε⁻¹ ⊠ η_2) is the locally analytic principal series Ban(η_1, η_2) = (Ind_B^G η_2 ⊠ η_1ε⁻¹)^an of PadicLocalLanglandsForGL2Qp §4.8, on which a central a acts by η_1(a)η_2(a)ε(a)⁻¹ on both sides; omitting the swap of the two characters, or the twist by ε⁻¹, names the induction of a different pair.

### 5.3 Ext between locally analytic characters of a split torus

Let T = 𝐓(L) with 𝐓 ≅ 𝔾_m^n and χ, χ′ : T → E^× locally ℚ_p-analytic characters. Prove: (1) if χ ≠ χ′ then Ext^i_T(χ, χ′) = 0 for all i; (2) ψ ↦ χ(1 + ψε) is an isomorphism Hom(T, E) ≅ Ext¹_T(χ, χ) (1.9 (iii)); (3) dim_E Hom(L^×, E) = 1 + d_L, dim_E Hom_sm(L^×, E) = 1 and dim_E Hom_σ(L^×, E) = 2 for σ ∈ Σ_L, where Hom_σ consists of the characters whose derivative factors through Lie(L^×) ⊗_(L,σ) E; hence dim Hom(T, E) = n(1 + d_L) and dim Hom_sm(T, E) = n; (4) Hom_(g′)(T, E) := {ψ ∈ Hom(T, E) : ψ − ψ_0 ∘ det ∈ Hom_sm(T, E) for some ψ_0 ∈ Hom(L^×, E)} has dimension n + d_L for n ≥ 1 and dimension 0 for n = 0 (Ding, proof of Lemma 3.5, arXiv v2 p. 40; §2.1, p. 10; §2.3.1, (2.17), p. 19).

The proof route: (1) D(T, E) is commutative and some δ_t − χ(t), or some x ∈ t with dχ(x) ≠ dχ′(x), acts by 0 on χ and invertibly on χ′; (2) is 1.9 (iii); (3) L^× ≅ ϖ^ℤ × μ × (1 + ϖ^mO_L) with 1 + ϖ^mO_L ≅ ℤ_p^(d_L) for m large, and the additive characters are the valuation and the E-linear combinations of σ ∘ log; (4) Hom_g′ = Hom_sm(T, E) + det^*Hom(L^×, E), the two meeting in det^*Hom_sm(L^×, E); for n ≥ 1, det : T → L^× is surjective, so det^* is injective and the dimension is n + (1 + d_L) − 1, while for n = 0, T = 1 and det^* = 0.

*Needs:* 1.7, 1.9, 0.3, 0.4.

**Checks.**

- For n = 1 and L = ℚ_p, Ext¹_(ℚ_p^×)(1, 1) is two-dimensional, spanned by the valuation and log_p.
- Degenerate case: for n = 0, T = 1, Hom(T, E) = 0 and Ext^i = 0 for i > 0; Hom_(g′)(T, E) = 0 as well, not of dimension n + d_L = d_L, because det^* : Hom(L^×, E) → Hom(T, E) is the zero map, so the count n + (1 + d_L) − 1 applies only for n ≥ 1 (for n = 1 and L = ℚ_p it gives 2 = dim Hom(ℚ_p^×, E)).
- For L = ℚ_p(√p) (d_L = 2) and n = 2: dim Hom(T, E) = 6, dim Hom_sm(T, E) = 2, dim Hom_(g′)(T, E) = 2 + 2 = 4, and dim Hom_σ(L^×, E) = 2 for each of the two σ.
- Non-example: χ′ = χ|·|_L has the same weight as χ, since |·|_L is smooth, yet Ext^i_T(χ, χ′) = 0 by (1); a vanishing criterion through dχ ≠ dχ′ alone would miss this case, which is why (1) also uses the elements δ_t − χ(t).

### 5.4 Homology under a unipotent radical

For a locally analytic N-representation V, define H_q(N, V) as the homology, with its subquotient topology, of Kohlhaase's topological bar complex B_•(N, V) ⊗̃_(D(N,E),ι) E, the standard simplicial resolution of the cotriple X ↦ D(N, E) ⊗̂_(E,ι) X with the alternating sum of faces (Schraen, §3, Remark 3.9, p. 68). These spaces need not be Hausdorff. Prove: (i) H_0(N, V) = V_N with the quotient topology; (ii) if V is of compact type and a P = M_P N_P-representation and the H_q(N_P, V) are Hausdorff, they are compact-type locally analytic M_P-representations (Schraen, the paragraph before Corollaire 4.9, p. 82); (iii) for V = W ⊗ π locally algebraic (W finite-dimensional algebraic, π smooth admissible with its finest topology), H_q(N_P, V) ≅ H_q(n_P, W) ⊗_E J_(N_P)(π), with J the unnormalised smooth Jacquet module, and these are Hausdorff (Schraen, (4.40)–(4.42), p. 82); H_q(n_P, W) is computed by 4.6. No identification with the dual of abstract Tor on V′ is made.

The proof route for (iii): N acts smoothly on π, the homology splits as Lie algebra homology of W tensored with the coinvariants of the smooth part, which are the Jacquet module by exactness of J_N (SmoothRepresentationsOfLocalGroups SR.2.2, *jacquet-lemma*).

API:

- H_q(N, −) is functorial for continuous N-equivariant maps, and H_0(N, V) = V_N with the quotient topology.
- For a P-representation V of compact type whose homology groups H_q(N_P, V) are Hausdorff, these are locally analytic M_P-representations of compact type.
- For V = W ⊗ π locally algebraic, H_q(N_P, V) ≅ H_q(n_P, W) ⊗_E J_(N_P)(π) as M_P-representations, Hausdorff, with H_q(n_P, W) given by 4.6.

*Needs:* 0.4, 1.6, 1.7; 4.6; SmoothRepresentationsOfLocalGroups SR.2.2 (*jacquet-module*, *jacquet-lemma*).

**Checks.**

- Degenerate case: for N = 1, H_0 = V and H_q = 0 for q > 0.
- For GL_2 and W = Sym^k(E²): the lower N⁻ gives H_0 of weight (k, 0) and H_1 of weight (−1, k + 1); the upper N gives H_0 of weight (0, k) and H_1 of weight (k + 1, −1). The Levi action remembers which radical was used.
- For π = 1 and GL_2 with upper N, H_1(N, π) is the root line of weight (1, −1), although positive smooth homology vanishes; for π cuspidal, J_N(π) = 0 and all H_q(N, W ⊗ π) vanish.

### 5.5 Schraen's spectral sequence for Ext into a parabolic induction

Let G be split reductive, P = M_P N_P a parabolic, Σ an admissible representation of G and ρ an irreducible locally algebraic representation of M_P inflated to P. Prove: if every H_q(N_P, Σ) is Hausdorff and admissible as an M_P-representation, there is a spectral sequence E_2^(p,q) = Ext^p_(M_P)(H_q(N_P, Σ), ρ) ⇒ Ext^(p+q)_G(Σ, (Ind_P^G ρ)^an); if the centre Z of G acts on Σ and ρ through a character χ, the same holds with Ext_(M_P,χ) and Ext_(G,χ); the conclusion extends to ρ a finite successive extension of irreducible locally algebraic representations (Schraen, Corollaire 4.9, (4.37)–(4.38), p. 82; Ding, proof of Lemma 3.5, (3.8), arXiv v2 p. 40). Admissibility of the homology is required so that the E_2-terms are Ext groups in the sense of 1.7; it holds for locally algebraic Σ of finite length by 5.4 (iii) and the finiteness of smooth Jacquet modules, and for self-extensions of locally algebraic representations whose restriction to the derived group is locally algebraic.

The proof route: the finite resolution condition (FIN) for ρ′ and Tor_q^(D(P))(D(G), ρ′) = 0 for q > 0 (Schraen, (4.28)–(4.32), pp. 80–81) give derived Frobenius reciprocity Ext_G(Σ, Ind ρ) = Ext_(D(P))(ρ′, Σ′) for this ρ, and the Hochschild–Serre spectral sequence for D(N_P) ⊆ D(P) with Hausdorff homology identifies the E_2-terms. Both (FIN) and the Tor-vanishing are stable under extensions, which gives the finite-length form. No unrestricted flatness of D(G) over D(P) is asserted.

*Needs:* 5.1, 5.4, 1.7.

**Checks.**

- For Σ = W ⊗ π locally algebraic and P = B, the E_2-terms are Ext^p_T(H_q(n, W) ⊗ J_N(π), ρ), computed by 5.3.
- Degenerate case: for P = G, N_P = 1 and the spectral sequence degenerates to Ext_G(Σ, ρ).
- For GL_2(ℚ_p), Σ = 1 and ρ = z^((0,2)) (with P = B⁻): H_0(N⁻, 1) = 1 and H_1(N⁻, 1) has weight (−1, 1), neither equal to (0, 2), so Ext^i_G(1, (Ind ρ)^an) = 0 for all i by 5.3 (1).

### Examples

- For GL_2(ℚ_p) and χ = z^((k,0)), k ≥ 0, PS(χ)_lalg = (Ind_B⁻^G 1)^∞ ⊗ Sym^k(E²).
- For n = 1 and L = ℚ_p, Ext¹_(ℚ_p^×)(1, 1) has dimension 2 and Hom_sm(ℚ_p^×, E) dimension 1.

### Dependencies

Layers 0–2 and 4; ReductiveGroupsPartII RG2.4.4; ReductiveGroups Layer 7; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2; PadicLocalLanglandsForGL2Qp §0.1.

## Layer 6: Orlik–Strauch functors

This layer builds the Orlik–Strauch representations F^G_P(M, π_P) in Breuil's locally ℚ_p-analytic form, their exactness, transitivity, irreducibility criterion and uniqueness, Jordan–Hölder series and socles, their extension to products of groups over different fields, and the vanishing of Ext¹ into inductions from weights of length at least two. Standing hypotheses: 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L, and O^p_alg the category of 4.2 for g ⊗_(ℚ_p) E = ∏_σ g_σ. The irreducibility statements in this ℚ_p-analytic form assume p > 3 when 𝐆 has a simple factor not of type A (Breuil, socle I, §2, p. 6); there is no restriction for GL_n. In Orlik–Strauch's original locally L-analytic theorem the bounds are p > 2 for types B, C, F_4 and p > 3 for G_2 (Orlik–Strauch, §5, Assumption 5.1, p. 25). These bounds are hypotheses of the only known proofs, entering through results on highest-weight modules (Orlik–Strauch, §5, the paragraph after Assumption 5.1, p. 26, and §8), and no example is known where the irreducibility criterion fails for p ≤ 3 (Orlik–Strauch, the remark after the main theorem, p. 4); the construction, exactness and transitivity (6.1–6.3) carry no such hypothesis, and the groups to which Layers 8–10 apply the irreducibility statements, GL_n(L), its Levi subgroups and their products, have only simple factors of type A.

### 6.1 The Orlik–Strauch functor

Let M ∈ O^p_alg and π_P a smooth admissible representation of L_P(L) over E inflated to P(L). Choose a finite-dimensional U(p ⊗_(ℚ_p) E)-stable subspace W ⊆ M generating M, giving 0 → ker(φ) → U(g ⊗ E) ⊗_(U(p ⊗ E)) W → M → 0; W carries the unique algebraic action of (Res_(L/ℚ_p)P) ×_(ℚ_p) E lifting the p ⊗ E-action (4.2 (iii)), restricted to P(L), and W′ = Hom_E(W, E) the dual action. An element x ⊗ w of U(g ⊗ E) ⊗_E W acts on C^(ℚ_p-an)(G, W′ ⊗ π_P) by f ↦ (g ↦ (x·f)(g)(w)), with the derived action of 0.3, and on the induction this factors through U(g ⊗ E) ⊗_(U(p⊗E)) W (Breuil, socle I, Lemma 2.1, p. 8). Define F^G_P(M, π_P) := (Ind_(P(L))^(G(L)) W′ ⊗_E π_P)^(ker(φ)), the closed subspace of the locally ℚ_p-analytic induction of 5.1 annihilated by ker(φ), and F^G_P(M) := F^G_P(M, 1) (Orlik–Strauch, Introduction, p. 3, and §4.1, p. 18; Breuil, socle I, §2, Lemmas 2.1–2.2 and Theorem 2.3(i), pp. 7–10). Prove that it is a closed G(L)-stable subspace, independent of W, admissible, strongly admissible when π_P has finite length (Orlik–Strauch, Proposition 4.8, p. 22, and Proposition 3.3(i), p. 11), and very strongly admissible when π_P is (5.1 (ii), via the finite-dimensional algebraic tensor identity).

The proof route: G-stability holds because the left-derivative action commutes with right translation; independence of W and admissibility follow from the analytic norm-completion presentations of Orlik–Strauch §4 and Breuil Theorem 2.3(i), with the closed annihilator relations in the completed induction dual (5.1 (v)); the dual of F^G_P(M, π_P) is the Hausdorff quotient of D(G, E) ⊗̂_(D(P,E)) (W ⊗ π_P′) by the closed D(G, E)-span of the induced relations, the algebraic tensor product mapping into it with dense image.

API:

- Contravariant in M ∈ O^p_alg and covariant in π_P, with identities and composition.
- For a generalised Verma module M = U(g ⊗ E) ⊗_(U(p⊗E)) W, ker(φ) = 0 and F^G_P(M, π_P) = (Ind_P^G W′ ⊗ π_P)^an.
- For M finite-dimensional algebraic (M ∈ O^g_alg), F^G_P(M, π_P) ≅ M′ ⊗_E (Ind_P^G π_P)^∞, locally algebraic.

*Needs:* 5.1, 0.3, 1.2, 2.2; 4.2, 4.3; SmoothRepresentationsOfLocalGroups SR.2.1; ReductiveGroups Layer 7.

**Checks.**

- Degenerate case: F^G_P(0, π_P) = 0 and F^G_P(M, 0) = 0.
- For the Verma module M⁻(μ) = U(g ⊗ E) ⊗_(U(b⁻⊗E)) μ and a smooth character χ of T, F^G_(B⁻)(M⁻(μ), χ) = (Ind_B⁻^G z^(−μ)χ)^an, the principal series of 5.2; the weight is negated because W′ is the dual of the generating line.
- For λ dominant, F^G_(B⁻)(L⁻(−λ), χ) = F^G_(B⁻)(L(λ)′, χ) ≅ L(λ) ⊗ (Ind_B⁻^G χ)^∞, locally algebraic.
- Compatibility: for L = ℚ_p the construction is Orlik–Strauch's F^G_P(M, π_P) for the L-analytic group G(ℚ_p).
- Non-example: when 𝐆 has positive semisimple rank and λ is dominant, F^G_(B⁻)(L⁻(−λ), χ) is a proper closed subrepresentation of (Ind_B⁻^G z^λχ)^an = F^G_(B⁻)(M⁻(−λ), χ), since the kernel K of M⁻(−λ) → L⁻(−λ) is nonzero and F(K, χ) ≠ 0 is the quotient (6.2). For a split torus G = T = B⁻ there is no root, M⁻(−λ) = L⁻(−λ) is the character −λ and both sides are the one-dimensional representation z^λχ: the inclusion is an equality.

### 6.2 Exactness and functoriality

Prove that F^G_P : O^p_alg × Rep^(∞,adm)_E(L_P(L)) → Rep^a_E(G(L)) is a bifunctor, contravariant in M and covariant in π_P, and exact in each argument (Orlik–Strauch, Introduction, main theorem (i)–(ii), p. 3, Proposition 4.2, pp. 18–19, and Proposition 4.9(a), p. 22; Breuil, socle I, Theorem 2.3(ii), p. 10). The proof route: for exactness in M, choose compatible finite-dimensional P-stable generating spaces and generalised Verma presentations, prove exactness on the analytic norm completions where the flatness theorem applies, and recover the locally analytic representations by duality; for the smooth variable, use analytic sections on compact charts, where the smooth tensor factor is exact and preserves the finite differential-equation kernel; dualise with 1.4. No flatness of D(G) over D(g, P) on arbitrary modules is asserted.

*Needs:* 6.1, 1.4; SmoothRepresentationsOfLocalGroups SR.2.1 (*induction-exactness*).

**Checks.**

- Applied to 0 → K → M⁻(−λ) → L⁻(−λ) → 0 it gives 0 → F(L⁻(−λ), χ) → PS(z^λχ) → F(K, χ) → 0.
- Degenerate case: the zero map in either variable gives the zero map.
- For GL_2(ℚ_p), λ dominant and K = M⁻(−s·λ) (simple, 4.5), F(K, χ) is the irreducible quotient of the principal series by its locally algebraic subrepresentation.

### 6.3 Transitivity along parabolics

For parabolics Q ⊇ P and M ∈ O^q_alg ⊆ O^p_alg, prove F^G_P(M, π_P) ≅ F^G_Q(M, i^(L_Q)_(P∩L_Q)(π_P)) for every smooth admissible π_P, where i^(L_Q)_(P∩L_Q)(π_P) = (Ind_(P(L)∩L_Q(L))^(L_Q(L)) π_P)^∞ is unnormalised smooth induction, of finite length when π_P is (gap:finite-length-finite-coefficients) (Orlik–Strauch, Introduction, main theorem (iii), p. 3, and Proposition 4.9(b), p. 22; Breuil, socle I, §2, (8), p. 10). The proof route: for M ∈ O^q_alg take W ⊆ M stable under q, so the induction from P factors through Q (5.1 (iii)); the condition of being killed by ker(φ) involves only the algebraic part along L_Q, and the inner induction of the smooth factor is the smooth one.

*Needs:* 6.1, 5.1; SmoothRepresentationsOfLocalGroups SR.2.1 (*induction-in-stages*).

**Checks.**

- For P = B, Q = G and M = L(λ)′ finite-dimensional: F^G_B(L(λ)′, χ) ≅ L(λ) ⊗ (Ind_B^G χ)^∞.
- Degenerate case: Q = P gives the identity.
- For GL_3, P = B⁻, Q = P_1⁻ with Levi GL_1 × GL_2 and M simple with maximal parabolic Q, the smooth argument becomes χ_1 ⊠ (Ind_(B⁻_2)^(GL_2(L)) χ_2 ⊠ χ_3)^∞, an unnormalised induction from the lower Borel B⁻_2 of the GL_2-factor, which is irreducible exactly when χ_2χ_3⁻¹ ∉ {1, |·|_L^(−2)}. Indeed, after adjoining to E a square root of p^f = |ϖ_L|_L⁻¹ (Convention 1), Ind_(B⁻_2)(χ_2 ⊠ χ_3) is the normalised induction of χ_2|·|_L^(1/2) ⊠ χ_3|·|_L^(−1/2), and the normalised criterion excludes the ratio (χ_2χ_3⁻¹)|·|_L from {|·|_L^(±1)} (Bernstein–Zelevinsky, §1.8, p. 444, for the normalisation and §4.2, Theorem and Remark (2), p. 454): for χ_2 = χ_3 the induction contains χ_2 ∘ det, and for χ_2χ_3⁻¹ = |·|_L^(−2) it is the contragredient of such an induction and has a one-dimensional quotient. Applying the normalised set {|·|_L^(±1)} to the unnormalised ratio would declare the reducible (Ind 1 ⊠ 1)^∞ irreducible.

### 6.4 The Orlik–Strauch irreducibility theorem

For M ∈ O^p_alg and π_P smooth admissible, prove that F^G_P(M, π_P) is topologically irreducible if and only if M is simple and, for the maximal parabolic Q ⊇ P of M (4.3), the smooth induction i^(L_Q)_(P∩L_Q)(π_P) is irreducible; in particular F^G_P(M, π_P) is irreducible for M simple with maximal parabolic P and π_P irreducible. Moreover, for simple M_i with maximal parabolics Q_i and nonzero finite-length π_(Q_i), F^G_(Q_1)(M_1, π_(Q_1)) ≅ F^G_(Q_2)(M_2, π_(Q_2)) if and only if M_1 ≅ M_2, hence Q_1 = Q_2, and π_(Q_1) ≅ π_(Q_2); both smooth arguments must be nonzero, since F^G_Q(M, 0) = 0 for every M (Orlik–Strauch, Introduction, main theorem (iv) and the remark after it, pp. 3–4, Theorem 5.8, p. 37; Breuil, socle I, Theorem 2.3(iii) and Corollary 2.7, pp. 10–12), under the residue-characteristic hypothesis of the layer.

The proof route: reduce to P maximal for M by 6.3; then D(G_0) ⊗_(D(g,P_0)) M is a simple D(G_0)-module for a compact open G_0 (Orlik–Strauch, Theorems 5.3, 5.5, 5.8), and irreducibility under G follows; uniqueness recovers M and π_Q from the n-invariants of the dual, H^0(n, F^G_Q(M, π_Q)′) ≅ Ev⁺ ⊗ π_Q′ for a highest-weight vector v⁺ of M, whose torus weight is the highest weight of M only when π_Q ≠ 0 (Breuil, socle I, Proposition 2.4 and the proof of Corollary 2.7, pp. 11–12).

*Needs:* 6.2, 6.3; 4.3; gap:finite-length-finite-coefficients.

**Checks.**

- For GL_2(ℚ_p), λ dominant and s the simple reflection, F^G_(B⁻)(L⁻(−s·λ), χ) is irreducible: it is the non-locally-algebraic constituent of PS(z^λχ).
- Non-example: for M = M⁻(−λ) not simple, F^G_(B⁻)(M, χ) = PS(z^λχ) is reducible.
- Non-example: for GL_2, M = L⁻(−λ) finite-dimensional (maximal parabolic G) and χ = χ_1 ⊠ χ_2 with χ_1 = χ_2, for instance χ = 1 ⊠ 1, the unnormalised induction (Ind_B⁻ χ)^∞ contains χ_1 ∘ det with the twisted Steinberg representation as quotient, so F(M, χ) = L(λ) ⊗ (Ind χ)^∞ has length 2 although M is simple.
- Control: for χ_1χ_2⁻¹ = |·|_L the normalised ratio is |·|_L², outside {|·|_L^(±1)}, so (Ind_B⁻ χ)^∞ and F(L⁻(−λ), χ) are irreducible; the exceptional ratios of the unnormalised lower-Borel induction are 1 and |·|_L^(−2) (6.3).
- Non-example to uniqueness with a zero smooth argument: for G = 𝔾_m(ℚ_p) = ℚ_p^× (B = Q = G), M_0 and M_1 the one-dimensional modules of weights 0 and 1, F(M_0, 0) = F(M_1, 0) = 0 although M_0 ≇ M_1; with the trivial character the outputs are 1 and z^(−1), of weights 0 and −1, as uniqueness requires.

### 6.5 Jordan–Hölder series and socles

Prove: (1) for M ∈ O^p_alg with Jordan–Hölder series M = M^0 ⊋ ⋯ ⊋ M^(r+1) = 0 and π_P of finite length, F^G_P(M, π_P) has a filtration by closed subrepresentations with graded pieces F^G_P(M^i/M^(i+1), π_P), refining to a Jordan–Hölder series whose constituents are the F^G_(Q_i)(M^i/M^(i+1), π′) for π′ the constituents of i^(L_(Q_i))_(P∩L_(Q_i))(π_P), Q_i the maximal parabolic of M^i/M^(i+1), the multiplicity of F^G_Q(L, π_Q) being [M : L]·[i^(L_Q)_(P∩L_Q)(π_P) : π_Q] (Orlik–Strauch, §6.2, (6.2.1) and the discussion after it, pp. 41–42); (2) for W an irreducible algebraic L_P-representation of highest weight λ_W, M the simple quotient of U(g ⊗ E) ⊗_(U(p⊗E)) W with maximal parabolic Q ⊇ P, and π_P of finite length, soc_G F^G_P(M, π_P) = F^G_Q(M, soc_(L_Q) i^(L_Q)_(P∩L_Q) π_P) = soc_G (Ind_P^G W′ ⊗ π_P)^an; (3) H^0(N_Q(L), F^G_Q(M, π_Q)′) ≅ W(Q) ⊗_E π_Q′ as L_Q(L)-representations, W(Q) the irreducible algebraic L_Q-representation of highest weight λ_W (Breuil, socle I, Proposition 2.4 and Corollary 2.5 with proof, pp. 10–12); (4) in the locally L-analytic setting with trivial smooth argument, Hom_(O^p_alg)(M_1, M_2) → Hom_G(F^G_P(M_2), F^G_P(M_1)) is bijective (Orlik, Introduction, Theorem 1, p. 2). Part (4) is stated only in that setting; no ℚ_p-analytic or arbitrary-smooth-argument version is used in this roadmap.

The proof route: (1) from 6.2, 6.3 and 6.4; (2)–(3) from the computation of N_Q-invariants of the dual, an irreducible subrepresentation F^G_Q(M, π_Q) giving a quotient W(Q) ⊗ π_Q′ of W(Q) ⊗ i(π_P)′, with other constituents excluded by comparing torus weights of highest-weight vectors; (4) through Orlik's functor U ↦ colim_k H^0(u_P^k, U′), almost a section of F^G_P.

*Needs:* 6.2, 6.3, 6.4, 1.4; 4.5; gap:finite-length-finite-coefficients.

**Checks.**

- For GL_2(ℚ_p), λ dominant and (Ind χ)^∞ irreducible, PS(z^λχ) has length 2 with socle L(λ) ⊗ (Ind χ)^∞ and cosocle F(L⁻(−s·λ), χ).
- Degenerate case: for M simple and π_P irreducible with i^(L_Q)(π_P) irreducible, the series has length 1.
- For GL_3(ℚ_p), PS(z^λχ) with χ = φη and φ generic (8.1) has 6 constituents, one for each u ∈ S_3, each with multiplicity [M⁻(−λ) : L⁻(−u·λ)] = 1.

### 6.6 Orlik–Strauch theory for products of groups over different fields

Let G = G_1(L_1) × G_2(L_2) with 𝐆_i split reductive over finite extensions L_i/ℚ_p, not necessarily equal, and E splitting both. With g ⊗_(ℚ_p) E = (g_1 ⊗ E) × (g_2 ⊗ E), parabolics P = P_1 × P_2 and O^p_alg for g ⊗ E, prove that 6.1–6.5 hold for locally ℚ_p-analytic representations of G over E, and F^G_P(M_1 ⊠ M_2, π_1 ⊠ π_2) ≅ F^(G_1)_(P_1)(M_1, π_1) ⊗̂_E F^(G_2)_(P_2)(M_2, π_2) (Breuil–Hellmann–Schraen, §5.1, Remark 5.1.2, p. 388, and §5.2, p. 390, where the extension is asserted after an examination of the proofs). The proof route: enveloping algebras and root data factor over the groups and embeddings; simple objects of O^p_alg are external tensor products of simple objects, and arbitrary finite-length objects are handled by extensions and exactness; for M = M_1 ⊠ M_2 take W = W_1 ⊠ W_2, the induction from P_1 × P_2 is the completed tensor product of the inductions (0.9) and ker(φ) = ker(φ_1) ⊗ U_2 + U_1 ⊗ ker(φ_2); the irreducibility and invariant-weight arguments run factor by factor using the product Bruhat and Iwasawa decompositions; admissibility of the products is 1.5.

*Needs:* 6.5, 0.9, 1.5.

**Checks.**

- Degenerate case: for G_2 = 1 the statement is 6.1–6.5 for G_1(L_1).
- For G = GL_2(ℚ_p) × GL_2(ℚ_p(√p)), dominant λ_1, λ_2 and χ_i = φ_iη with φ_i generic (8.1), the constituents of F^G_(B⁻)(M⁻(−λ_1) ⊠ M⁻(−λ_2), χ_1 ⊠ χ_2) number 2 · 4 = 8, products of the constituents of the factors. For the non-generic χ_1 = 1 ⊠ 1 the first factor has 3 constituents, L(λ_1) ⊗ 1, L(λ_1) ⊗ St and F(L⁻(−s·λ_1), 1), and the product has 3 · 4 = 12.
- Non-example: a non-split extension of M_1 ⊠ M_2 by M_1′ ⊠ M_2′ in O^p_alg is not a pure tensor; the product formula is stated for pure tensors and extended by exactness.

### 6.7 Vanishing of Ext¹ into inductions from weights of length at least two

Let 𝐆 = Res_(L/ℚ_p)GL_n, μ ∈ X dominant, π smooth admissible of G = GL_n(L), W := L(μ) ⊗_E π, s ∈ S_n^(Σ_L) = W_(Σ_L), I ⊆ Δ such that s·μ is dominant for the Levi L_I of the standard parabolic P_I, and π_I a finite-length smooth representation of L_I(L). Prove that if lg(s) > 1 then (1) Ext¹_G(W, (Ind_(P_I⁻)^G L(s·μ)_I ⊗ π_I)^(ℚ_p-an)) = 0 and (2) Ext¹_G(W, F^G_(P_I⁻)(L⁻(−s·μ), π_I)) = 0; consequently push-forward along an injection V ↪ V′ of admissible representations whose cokernel has only constituents F^G_(P_J⁻)(L⁻(−s·μ), π′) with lg(s) > 1 is an isomorphism on Ext¹_G(W, −) (Ding 2019, §2.3.2, Lemma 2.26 and its proof, and the proof of Proposition 2.27, arXiv v2 pp. 29–30; Ding, proofs of Lemma 3.5 and Proposition 3.6, arXiv v2 pp. 40–41).

The proof route: for the lower radical of P_I⁻, 4.6 gives the degree-r Levi weights w·μ with lg(w) = r; for r ∈ {0, 1} these differ from s·μ when lg(s) > 1, so Ext^r_(L_I)(H_i(N_I⁻, W), L(s·μ)_I ⊗ π_I) = 0 by 1.10 (1), and 5.5 (whose hypotheses hold for locally algebraic W, in its finite-length form) gives (1). F^G_(P_I⁻)(L⁻(−s·μ), π_I) is a subrepresentation of the induction whose quotient has no locally algebraic vectors, so Hom_G(W, quotient) = 0 and (2) follows from (1). For the push-forward, each cokernel constituent has Hom_G(W, −) = 0 and Ext¹_G(W, −) = 0, and both are needed in the long exact sequence.

*Needs:* 6.1, 5.5, 1.10, 1.6; 4.6.

**Checks.**

- For n = 2 and L = ℚ_p there is no s with lg(s) > 1, so the statement is empty; it has content for n ≥ 3 or d_L ≥ 2.
- For n = 2 and L = ℚ_p(√p), s = (s, s) has length 2, and Ext¹(W, F(L⁻(−s·μ), π)) = 0 for this s.
- Non-example: for lg(s) = 1 the conclusion fails: for GL_2(ℚ_p), φ generic, π_alg = π_sm(φ) ⊗ L(λ) and χ = φη, Ext¹(π_alg, F(L⁻(−s·λ), χ)) is one-dimensional (8.9).

### Examples

- For GL_2(ℚ_p), λ dominant and χ = φη with φ generic (8.1), PS(z^λχ) is a nonsplit extension of the irreducible F(L⁻(−s·λ), χ) by L(λ) ⊗ (Ind χ)^∞, and F(L⁻(−s·λ), χ) = (Ind z^(s·λ)χ)^an is a full principal series.

### Dependencies

Layers 0–2, 4 and 5; SmoothRepresentationsOfLocalGroups SR.2.1 with gap:finite-length-finite-coefficients; ReductiveGroups Layer 7.

## Layer 7: Jacquet modules, closed induction and the adjunction theorems

The character space Ẑ, essentially admissible representations, the finite-slope part, the averaged Hecke operators and Emerton's Jacquet module J_P(V) = (V^(N_0))_fs with its basic properties are those of OverconvergentAutomorphicForms §0.6. This layer adds the compact-support adjunction that characterises J_P, Emerton's closed induction I_P⁻^G, balanced maps, Emerton's adjunction theorem with its consequences for the Jacquet modules of very strongly admissible representations, and Breuil's adjunction. Throughout, G is the group of L-points of a connected reductive group, P = MN a parabolic with opposite P⁻, N_0 ⊆ N compact open, M⁺ = {m ∈ M : mN_0m⁻¹ ⊆ N_0}, Z_M⁺ = Z_M ∩ M⁺, the Hecke action is averaged (Convention 5), and Rep^(zla.c)(M) denotes the locally analytic representations of M of compact type whose Z_M-action admits a Z_M-stable exhaustion by BH-subspaces.

### 7.1 The compact-support adjunction for Emerton's Jacquet module

For U ∈ Rep^(zla.c)(M) and V a locally analytic representation of P of compact type, prove that there is a natural isomorphism Hom_P(C^sm_c(N, U), V) ≅ Hom_M(U(δ_P), J_P(V)), where C^sm_c(N, U) is the space of locally constant compactly supported U-valued functions on N with its natural P-action and U(δ_P) is the twist by δ_P(m) = |det(Ad(m)|n)|_L; that J_P is right adjoint to C^sm_c(N, −) twisted by δ_P is the defining property of J_P in Emerton's construction (Emerton, Jacquet I, Introduction, Theorem 0.3 and (0.4), p. 777, and §3.5, Theorem 3.5.6). Prove also that evaluation J_P(V) → V^(N_0) ⊆ V is M_0N_0-equivariant for M_0 normalising N_0; it is not M-equivariant for the original action on V, the M-action on J_P being reconstructed from the averaged Hecke action (Emerton, Jacquet I, §3.4, Definitions 3.4.1–3.4.2, Lemma 3.4.3, p. 806, and (3.4.8), p. 807).

The proof route uses the universal property of the finite-slope part of OverconvergentAutomorphicForms §0.6 for representations with a stable BH exhaustion, applied to V^(N_0) with its averaged Hecke action, and the identification of P-maps out of C^sm_c(N, U) with Z_M⁺-equivariant maps U(δ_P) → V^(N_0).

*Needs:* OverconvergentAutomorphicForms §0.6 (finite-slope part, averaged Hecke operators, J_P); SmoothRepresentationsOfLocalGroups SR.2.2 (*modulus-character*); ReductiveGroupsPartII RG2.4.2 (*iwahori-factorization*).

**Checks.**

- For P = G, N = 1 and V ∈ Rep^(zla.c)(G), the adjunction is the identity Hom_G(U, V) = Hom_G(U, V); the stable BH exhaustion is part of the hypothesis.
- For G = GL_2(ℚ_p), P = B, N_0 = N(ℤ_p), m = diag(p, 1) and V = E trivial: the index is p, δ_B(m) = p⁻¹, the averaged operator is the identity, J_B(1) = 1 and the adjunction gives Hom_B(C^sm_c(N, δ_B⁻¹), 1) ≅ E; with the unaveraged sum, J_B(1) would be the twist by p.
- For π smooth admissible, J_P(π) = π_N (OverconvergentAutomorphicForms §0.6) and the adjunction is the smooth adjunction between compact induction from N and coinvariants.

### 7.2 Emerton's closed induction

For U ∈ Rep^(zla.c)(M) there is a closed M-equivariant embedding U(δ_P) → J_P((Ind_P⁻^G U)^an) (Emerton, Jacquet II, Introduction, Lemma 0.3, p. 2). Define I_P⁻^G(U) ⊆ (Ind_P⁻^G U)^an as the closed G-subrepresentation generated by the image of U under this embedding followed by evaluation into (Ind U)^an (7.1). Prove: (i) equivalently, I_P⁻^G(U) is the closed G-subrepresentation generated by the functions supported on the big cell P⁻N whose restriction to N is locally constant with compact support (Emerton, Jacquet II, §2.8, Lemma 2.8.3, pp. 44–45); (ii) when G is quasi-split and P is a Borel, J_P(I_P⁻^G(U)) ≅ J_P((Ind_P⁻^G U)^an) (Emerton, Jacquet II, §5.1, Corollary 5.1.4, p. 60); no version for an arbitrary parabolic is asserted; (iii) for U = χ_sm z^λ with λ dominant, I(U) = (Ind χ_sm)^∞ ⊗ L(λ); (iv) for a deformed character U = δ(1 + ψε) with δ = w(φ)ηz^λ and ψ = ψ_1 + ψ_0 ∘ det, ψ_1 smooth, I(U) is an E[ε]-module and I(U) ≅ (Ind w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗_(E[ε]) (1 + εψ_0 ∘ det) (Ding, §3.1.2, Lemma 3.2(2), Proposition 3.3 and Remark 3.7, arXiv v2 pp. 37–41). The conventions match Ding: induction from P⁻ = B⁻, Jacquet modules for P = B.

API:

- I_P⁻^G is functorial in U, and I(0) = 0.
- I_P⁻^G(U) ⊆ (Ind_P⁻^G U)^an, in general properly.

*Needs:* 7.1; 5.1, 5.2; SmoothRepresentationsOfLocalGroups SR.2.1 (*smooth-induction*).

**Checks.**

- For U a smooth character χ, I_B⁻^G(χ) = (Ind_B⁻^G χ)^∞; when G has positive semisimple rank this is a proper subspace of the locally analytic induction, while for G = T a split torus (B⁻ = T, N = 1) induction and closed induction are both the character χ, of dimension 1, and the inclusion is an equality.
- For U = z^λ with λ dominant, I_B⁻^G(U) = (Ind 1)^∞ ⊗ L(λ).
- Non-example to "non-dominant implies proper": for GL_2(ℚ_p), λ = (1, 1), s·λ = (0, 2) and U = z^(s·λ)χ_sm, the lower Verma module M⁻(−s·λ) is simple (4.5), so I(U) = F^G_(B⁻)(L⁻(−s·λ), χ_sm) is the whole locally analytic induction, whereas I(z^λχ_sm) is the proper locally algebraic subrepresentation.

### 7.3 Balanced maps into a Jacquet module

Let U ∈ Rep^(zla.c)(M) and V a locally analytic representation of G. Define a continuous M-equivariant map U(δ_P) → J_P(V) to be balanced if the kernel of the induced (g, P)-map U(g) ⊗_(U(p)) U → U(g) ⊗_(U(p)) J_P(V) → V (through evaluation) contains the kernel of the natural map U(g) ⊗_(U(p)) U → (Ind_P⁻^G U)^an; write L_M(U(δ_P), J_P(V))^bal for the balanced maps. Define U to be allowable if, for all finite-dimensional algebraic M-representations W_1, W_2, every A[M]-linear map U ⊗ W_1 → U ⊗ W_2 is strict, A = End_M(U) (Emerton, Jacquet II, Introduction, Definitions 0.8 and 0.11 and Question 0.9, p. 3). Prove that the balanced condition does not depend on N_0, that maps in the image of Hom_G(I_P⁻^G(U), V) are balanced, and that if U(g) ⊗_(U(p)) U → I(U) is injective then every equivariant map is balanced.

API:

- Finite-dimensional U, in particular characters, are allowable.
- If U and V are smooth, every map U(δ_P) → J_P(V) is balanced; this recovers smooth Frobenius reciprocity.

*Needs:* 7.1, 7.2, 0.3.

**Checks.**

- For U = z^λ with λ dominant and V = PS(z^λ), the map z^λδ_B → J_B(V) of Lemma 0.3 is balanced, with image corresponding to I(U) = (Ind 1)^∞ ⊗ L(λ).
- For GL_2 with upper positive roots and U = z^((0,2)), the relevant lower Verma module is simple, so every equivariant map is balanced.
- Non-example to automatic balancedness: for U = z^((1,1)) (dominant) the map U(g) ⊗_(U(b)) U = M(λ) → (Ind_B⁻^G U)^an has image L(λ) = det and nonzero kernel, the sum of the images of M(s·λ); so for U = z^((1,1)) balancedness is a genuine condition, unlike for U = z^((0,2)).

### 7.4 Emerton's adjunction theorem

Prove that if U ∈ Rep^(zla.c)(M) is allowable and V is very strongly admissible, the map Hom_G(I_P⁻^G(U), V) → L_M(U(δ_P), J_P(V))^bal induced by J_P is an isomorphism; in particular, for a locally analytic character δ of T and P = B, Hom_G(I_B⁻^G(δ), V) ≅ Hom_T(δδ_B, J_B(V))^bal (Emerton, Jacquet II, Introduction, Theorem 0.13 and its sketch of proof, pp. 4–5; §4.3, Corollary 4.3.3, p. 58).

The proof route: injectivity because I(U) is generated by the image of U, determined by its Jacquet-module image; surjectivity because a balanced map defines a (g, P)-map on U(g) ⊗ C^sm_c(N, U) factoring through the image I(U)^(lp)(N), which Corollary 4.3.3 extends continuously using very strong admissibility, and G-equivariance spreads to I(U).

*Needs:* 7.2, 7.3, 2.2.

**Checks.**

- For δ a smooth character and V smooth admissible, the theorem is Hom_G((Ind_B⁻ δ)^∞, V) ≅ Hom_T(δδ_B, V_N), the unnormalised form of second adjointness; with normalised functors the twists by δ_B^(1/2) cancel to the same statement.
- Degenerate case: V = 0.
- Non-example: without very strong admissibility the extension step fails; the theorem is not asserted for essentially admissible V that are not very strongly admissible.

### 7.5 Jacquet modules of very strongly admissible representations

For G quasi-split and P a Borel, prove: (i) a topologically irreducible very strongly admissible representation V with J_P(V) ≠ 0 is a quotient of I_P⁻^G(U) ⊆ (Ind_P⁻^G U)^an (7.2) for some finite-dimensional locally analytic representation U of the torus M over E, hence a subquotient of (Ind_P⁻^G U)^an; (ii) an admissible representation of finite length whose constituents are very strongly admissible has finite-dimensional J_P(V) (Emerton, Jacquet II, Introduction, Corollaries 0.14–0.15, p. 4, proved in §5.3, p. 69). In (i), U is in general not a character over E: the proof produces, over a finite extension E′ of E, an E′-valued character χ̃ of M occurring in J_P(V ⊗_E E′), and U is the line E′ with M acting by χ̃δ_P⁻¹, regarded as an E-representation of dimension [E′ : E]; when χ̃ can be chosen E-valued, U is a character of M over E and V is a subquotient of the locally analytic induction of a character. Emerton, Jacquet I, Introduction, Theorem 0.6, p. 778, states (i) with a character of M over the coefficient field; that form needs this rationality.

The proof route goes through the adjunction 7.4: choose E′ and an eigencharacter χ of M in J_P(V ⊗_E E′); among the weights of the n-invariants of the (g, P)-module generated by the corresponding vectors choose one, λ = dχ̃, such that no weight λ − μ with μ a nonzero element of the positive cone of the root lattice occurs among them, so that the inclusion of χ̃ into J_P(V ⊗_E E′) is balanced (7.3); 7.4 gives a nonzero E′-linear map I_P⁻^G(χ̃δ_P⁻¹) → V ⊗_E E′; regarded E-linearly its source is I_P⁻^G(U) and its target a finite direct sum of copies of V, and a nonzero component is the required surjection (Emerton, Jacquet II, §5.3, proof of Corollary 0.14, p. 69). For (ii), J_P is left exact (OverconvergentAutomorphicForms §0.6), so it suffices to treat V topologically irreducible with J_P(V) ≠ 0; then (i) gives I_P⁻^G(U) ↠ V, J_P(I_P⁻^G(U)) → J_P(V) is surjective and its source is finite-dimensional (Emerton, Jacquet II, Theorem 5.2.18, p. 69, and Proposition 5.1.5, p. 60).

*Needs:* 7.1, 7.2, 7.3, 7.4; 2.2; 5.2; OverconvergentAutomorphicForms §0.6.

**Checks.**

- For π_alg = I_sm(φ) ⊗ L(λ) of GL_n(L) with φ generic (8.2), J_B(π_alg) ≅ J_N(I_sm(φ)) ⊗ L(λ)^N is a direct sum of n! distinct characters of T (OverconvergentAutomorphicForms §0.6 and gap:principal-series-jacquet-finite-coefficients), finite-dimensional as (ii) predicts.
- Degenerate case: J_P(0) = 0.
- Non-example: for a smooth supercuspidal π of GL_2(ℚ_p), J_B(π) = 0, so (i) gives no principal-series embedding, consistent with π not being a subquotient of a principal series.
- Non-example to an E-valued character in (i): for G = M = P = ℚ_3^× (N = 1) over E = ℚ_3, let ℤ_3^× act trivially on V = E² and 3 act by the matrix (0 3; 1 0). V is very strongly admissible, being a finite-dimensional Banach representation, and topologically irreducible, since X² − 3 has no root in ℚ_3; J_G(V) = V ≠ 0, while the induction of any character of ℚ_3^× is that character, of dimension 1, so V is a subquotient of no such induction. With E′ = E(√3) and χ̃(3) = √3, χ̃ trivial on ℤ_3^×, the line E′ regarded over E has basis (1, √3), on which 3 acts by (0 3; 1 0): U = V, as (i) asserts.

### 7.6 Breuil's adjunction for Orlik–Strauch representations

Let Q = MN be the Jacquet parabolic, Q⁻ its opposite (the inducing parabolic), W a finite-dimensional algebraic M-representation inflated to Q⁻, and π a smooth admissible finite-length M-representation. Prove that for very strongly admissible Π there is a natural isomorphism Hom_G(F^G_(Q⁻)((U(g_E) ⊗_(U(q⁻_E)) W)^∨, πδ_Q⁻¹), Π) ≅ Hom_M(W′ ⊗ π, J_Q(Π)), with ∨ the restricted BGG duality of 4.4; equivalently the right side is Hom_(M⁺)(W′ ⊗ π, Π^(N_0)) for the averaged Hecke action; the σ-analytic variant holds; for products of groups (6.6) and category-O modules M_0, Hom_G(F^G_(B⁻)(Hom_E(M_0, E)^u∞, Vδ_B⁻¹), Π) ≅ Hom_(T⁺)(V, Hom_(U(g))(M_0, Π)^(U_0)) for smooth finite-length admissible T-representations V (Breuil, socle II, §4, (18), p. 13, Proposition 4.2 and Théorème 4.3, pp. 13–15, Remarque 4.4(i)–(ii), pp. 15–16; Breuil–Hellmann–Schraen, §5.2, Lemma 5.2.1 and its proof, pp. 391–392).

Breuil's positive-monoid Hom uses the unaveraged Hecke sum, so his smooth argument π corresponds to πδ_Q⁻¹ here; Breuil–Hellmann–Schraen's (5.9), p. 391, writes δ_B times the sum and their Lemma 5.2.1 already contains the inverse-modulus twist. The proof route: identify the compactly supported locally polynomial vectors of the differential-equation kernel with the restricted dual tensored with C^∞_c(N, π) (Breuil, socle II, Proposition 4.2), polynomially generated in bounded degree; extend the resulting (g, Q)-map into Π continuously by Emerton, Jacquet II, Corollary 4.3.3; conclude with 7.1. For products, run the argument on the factors of 6.6.

*Needs:* 7.1, 7.4, 6.1, 6.6; 4.4.

**Checks.**

- For Q = B, W of weight −s_(i,σ)·λ, π = w(φ)ηδ_B and Π = C(I, s_(i,σ)) (8.5), the formula gives Hom_T(z^(s_(i,σ)·λ)w(φ)ηδ_B, J_B(Π)) ≅ E (8.6): the negative weight belongs to the category-O input and the positive weight to the inducing character.
- When U(g_E) ⊗_(U(q⁻_E)) W is simple, its BGG dual is itself, F of it is the full induction, which equals I_Q⁻^G(W′ ⊗ πδ_Q⁻¹), and the formula reduces to 7.4 with automatic balancedness.
- Degenerate case: π = 0 gives 0 on both sides.

### Examples

- For U = δ a smooth character of T and V smooth admissible, 7.4 is the smooth reciprocity Hom_G((Ind δ)^∞, V) ≅ Hom_T(δδ_B, V_N).
- For U = z^λχ_sm with λ dominant, I_B⁻^G(U) is the locally algebraic subrepresentation (Ind χ_sm)^∞ ⊗ L(λ) of the principal series.

### Dependencies

Layers 0–2, 4–6; OverconvergentAutomorphicForms §0.6; ReductiveGroupsPartII RG2.4.2; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2 with gap:principal-series-jacquet-finite-coefficients.

## Layer 8: Ext groups of the locally analytic principal series of GL_n

This layer computes the extension groups of the locally algebraic representation π_alg(φ, h) of GL_n(L) by the representations cut out of the locally analytic principal series: the constituents C(w, u) and C(I, s_(i,σ)) of PS(w(φ), h) (8.3–8.6), the representations PS_1 and π_1 (8.7), the self-extensions of π_alg (8.8) and the lines Ext¹(π_alg, C(I, s)) (8.9), which together give the maps ζ_w (8.10), the isomorphism Hom(T(L), E) ≅ Ext¹(π_alg, PS_1) (8.11), the dimension n + (2^n − 1)d_L of Ext¹(π_alg, π_1) (8.12) and the filtration of 8.14. It uses the Orlik–Strauch constituents of Layer 6, the closed induction and adjunctions of Layer 7 and the Ext theory of Layers 1 and 5. Standing setting: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L; G = GL_n(L) with upper Borel B = TN and lower Borel B⁻ = TN⁻; inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant and λ = h − θ. All Ext groups are those of 1.7. The label and sign conventions of Conventions 6 are used; where Ding's printed formulas differ, the correction is listed under Source corrections.

### 8.1 Weights, twists and parameter spaces for GL_n(L)

Fix n ≥ 1. Define: (i) θ := (0, −1, …, 1 − n); for a standard parabolic P ⊇ B with Levi GL_(n_1) × ⋯ × GL_(n_r), θ^P := (0^(n_1), (−n_1)^(n_2), …, (−(n_1 + ⋯ + n_(r−1)))^(n_r)), with θ^B = θ; P_i is the maximal parabolic with Levi L_i ≅ GL_i × GL_(n−i); (ii) for φ = φ_1 ⊠ ⋯ ⊠ φ_n and w ∈ S_n, w(φ) := φ_(w⁻¹(1)) ⊠ ⋯ ⊠ φ_(w⁻¹(n)); φ is generic if φ_iφ_j⁻¹ ∉ {1, |·|_L} for i ≠ j; (iii) δ_B, η = |·|_L⁻¹ ∘ θ and ε as in Convention 7; (iv) h ∈ ℤ^(Σ_L × {1,…,n}) is strictly dominant if h_(σ,1) > ⋯ > h_(σ,n) for every σ, and then λ := h − θ, λ_(σ,i) = h_(σ,i) + i − 1, is dominant; W_Σ := S_n^(Σ_L) acts by the dot action, lg(u) = Σ_σ lg(u_σ), s_(i,σ) the simple reflection (i, i+1) in the σ-factor; (v) Hom(T(L), E), Hom_sm(T(L), E) and Hom_σ(T(L), E) as in Convention 7, Hom_(g′)(T(L), E) as in 5.3 (4), and Hom_(σ,g′) := Hom_g′ ∩ Hom_σ (Ding, §3.1.1, arXiv v2 pp. 35–36, §3.1.2, p. 37, and §3.1.4, p. 48; §2.1, p. 10; §2.3.1, (2.17), p. 19). Prove (w_1w_2)(φ) = w_1(w_2(φ)), ηz^λ = z^h(ε⁻¹ ∘ θ), dim_E Hom_(g′)(T(L), E) = n + d_L (5.3 (4)), and that λ is dominant: h_(σ,i) ≥ h_(σ,i+1) + 1 gives λ_(σ,i) = h_(σ,i) + i − 1 ≥ h_(σ,i+1) + i = λ_(σ,i+1).

API:

- The permutation action on characters is a left action, (w_1w_2)(φ) = w_1(w_2(φ)), and φ is generic if and only if w(φ) is, the condition being symmetric in i ≠ j.
- For strictly dominant h, λ = h − θ is dominant, and ηz^λ = z^h(ε⁻¹ ∘ θ) as characters of T(L).
- For n ≥ 1, dim_E Hom_(g′)(T(L), E) = n + d_L.

*Needs:* 5.3; SmoothRepresentationsOfLocalGroups SR.0.4 (*smooth-character*), SR.2.2 (*modulus-character*); Layer 4.1; ReductiveGroups Layer 7.

**Checks.**

- For n = 2, θ = (0, −1); for n = 3 and blocks (1, 2), θ^P = (0, −1, −1), while θ^B = (0, −1, −2); for blocks (2, 1), θ^P = (0, 0, −2).
- For n = 2, L = ℚ_p and h = (1, 0), λ = (1, 1).
- For n = 3 and the cycle w = (1 2 3) (1 ↦ 2 ↦ 3 ↦ 1), w(φ) = φ_3 ⊠ φ_1 ⊠ φ_2; the forward convention would give φ_2 ⊠ φ_3 ⊠ φ_1.
- Non-example: φ_1 ⊠ φ_1|·|_L is not generic, and its smooth principal series is reducible.
- Degenerate case: for n = 1, Hom_(g′)(T(L), E) = Hom(L^×, E), of dimension 1 + d_L.

### 8.2 The locally algebraic representation π_alg(φ, h)

For φ generic, I_sm(φ) := (Ind_(B⁻(L))^(GL_n(L)) φη)^∞ is absolutely irreducible with End = E and I_sm(φ) ≅ I_sm(w(φ)) =: π_sm(φ) for all w (gap:generic-principal-series-finite-coefficients); define π_alg(φ, h) := π_sm(φ) ⊗_E L(λ). Prove that π_alg(φ, h) is an admissible, topologically irreducible locally algebraic representation with End_G = E, isomorphic to I_sm(w(φ)) ⊗_E L(λ) for every w; fix isomorphisms π_alg(φ, h) ≅ L(λ) ⊗_E I_sm(w(φ)) for all w (Ding's (3.2)), on which the constructions below depend only up to scalars that cancel in Ext¹ (Ding, §3.1.1, p. 36, §3.1.2, p. 37, (3.2), p. 38, and Remark 3.4, p. 40). The proof route: 1.6 (ii) and Schur's lemma for absolutely irreducible admissible representations.

API:

- π_alg(φ ⊗ (χ ∘ det), h) ≅ π_alg(φ, h) ⊗ (χ ∘ det) for a smooth character χ of L^×.
- π_alg(φ, h) is locally algebraic: its locally algebraic vectors are everything.

*Needs:* 8.1, 1.6; gap:generic-principal-series-finite-coefficients; SmoothRepresentationsOfLocalGroups SR.2.1; Layer 4.1.

**Checks.**

- Degenerate case: for n = 1, π_alg(φ, h) = φ_1 z^(h_1).
- For n = 2, L = ℚ_p and h = (1, 0): λ = (1, 1), L(λ) = det and π_alg(φ, h) = I_sm(φ) ⊗ det, infinite-dimensional and irreducible.
- Non-example: if φ_1 = φ_2|·|_L then I_sm(φ) is reducible, containing a twist of the Steinberg representation or of a character, so genericity is needed.

### 8.3 The principal series PS(w(φ), h) and the representations C(w, u)

For w ∈ S_n define PS(w(φ), h) := (Ind_(B⁻(L))^(GL_n(L)) w(φ)ηz^λ)^(ℚ_p-an) = (Ind_(B⁻(L))^(GL_n(L)) w(φ)z^h(ε⁻¹ ∘ θ))^(ℚ_p-an) (5.2), and for u ∈ W_Σ, C(w, u) := F^(GL_n)_(B⁻)(L⁻(−u·λ), w(φ)η) (6.1), where M⁻(μ) = U(gl_(n,Σ_L)) ⊗_(U(b⁻_(Σ_L))) μ and L⁻(μ) is its simple quotient (4.5). Prove that the two expressions for PS agree, that PS(w(φ), h) = F^(GL_n)_(B⁻)(M⁻(−λ), w(φ)η), and that π_alg(φ, h) = C(w, 1) ⊆ PS(w(φ), h) through the fixed isomorphisms (Ding, §3.1.1, p. 36; §3.1.2, p. 37). The proof route: on diag(t_1, …, t_n), z^θ(t) = ∏_i N_(L/ℚ_p)(t_i)^(1−i) and (ε⁻¹ ∘ θ)(t) = ∏_i (N_(L/ℚ_p)(t_i)|t_i|_L)^(i−1), so z^θ(ε⁻¹ ∘ θ) = ∏_i |t_i|_L^(i−1) = η and z^h(ε⁻¹ ∘ θ) = z^λη; the Orlik–Strauch identification is 6.1 for a Verma module with generating weight −λ, so W′ = z^λ; C(w, 1) ≅ L(λ) ⊗ I_sm(w(φ)) by 6.3 with Q = G.

API:

- The two expressions for the inducing character of PS(w(φ), h) agree, and PS(w(φ), h) = F^(GL_n)_(B⁻)(M⁻(−λ), w(φ)η).
- C(w, u) is the Orlik–Strauch representation of the simple module L⁻(−u·λ) with smooth argument w(φ)η; for u = 1 it is π_alg(φ, h), which embeds in PS(w(φ), h) through the fixed isomorphisms.

*Needs:* 8.2, 5.2, 6.1, 6.3; 4.5.

**Checks.**

- On diag(t_1, t_2) with L = ℚ_p: η(t)z^λ(t) = |t_2|_p t_1^(λ_1)t_2^(λ_2) and z^h(t)·ε(t_2) = t_1^(h_1)t_2^(h_2)·t_2|t_2|_p, equal since λ = (h_1, h_2 + 1).
- Degenerate case: for n = 1, PS(φ, h) = C(1, 1) = φ_1z^(h_1).
- For u ≠ 1, C(w, u) is infinite-dimensional and not locally algebraic, because −u·λ is not 𝔟⁻-dominant and L⁻(−u·λ) is infinite-dimensional.

### 8.4 Constituents and socle of the principal series

For w ∈ S_n prove: (1) the irreducible constituents of PS(w(φ), h) are the C(w, u), u ∈ W_Σ, pairwise non-isomorphic, those with lg(u) = 1 of multiplicity one; (2) soc_G PS(w(φ), h) ≅ I_sm(w(φ)) ⊗_E L(λ) ≅ π_alg(φ, h); (3) soc_G (PS(w(φ), h)/π_alg(φ, h)) ≅ ⊕_(lg(u)=1) C(w, u); (4) for w, w′ ∈ S_n and lg(u) = lg(u′) = 1, C(w, u) ≅ C(w′, u′) if and only if u = u′ = s_(i,σ) for some i, σ and w(w′)⁻¹ lies in the Weyl group W_i = S_i × S_(n−i) of L_(P_i) (Ding, Proposition 3.1 and its proof, arXiv v2 p. 37).

The proof route: (1) and (4) from 6.5 (1) and 6.4 (uniqueness) with 4.5 (i): for u ≠ 1 the maximal parabolic of L⁻(−u·λ) is proper and genericity makes the smooth induction to it irreducible (gap:generic-principal-series-finite-coefficients), and C(w, s_(i,σ)) = F^G_(P_i⁻)(L⁻(−s_(i,σ)·λ), i^(L_i)(w(φ)η)) depends on the smooth induction to L_i, invariant exactly under W_i acting on the left; (2) from 6.5 (2). For (3), the source deduces it from Orlik's full-faithfulness theorem, which is locally L-analytic with trivial smooth argument (6.5 (4)) and does not apply here; the route here uses only exactness and socles. Let K = rad M⁻(−λ), so 0 → K → M⁻(−λ) → L⁻(−λ) → 0 and, by 6.2, PS/π_alg ≅ F(K, w(φ)η). By 4.5 (ii), K is a quotient of ⊕_(lg(u)=1) M⁻(−u·λ), so F(K, w(φ)η) embeds into ⊕_(lg(u)=1) (Ind_B⁻ z^(u·λ)w(φ)η)^an, whose socle is ⊕_(lg(u)=1) C(w, u) by 6.5 (2); conversely each L⁻(−u·λ) with lg(u) = 1 is a quotient of K, so C(w, u) = F(L⁻(−u·λ), w(φ)η) embeds into F(K, w(φ)η). Hence soc F(K, w(φ)η) = ⊕_(lg(u)=1) C(w, u).

*Needs:* 8.3, 6.2, 6.4, 6.5; 4.5; gap:generic-principal-series-finite-coefficients, gap:finite-length-finite-coefficients.

**Checks.**

- For n = 2, L = ℚ_p: PS(w(φ), h) is a nonsplit extension of C(w, s) by π_alg(φ, h), and C(1, s) ≇ C(s, s).
- For n = 3, L = ℚ_p: soc(PS/π_alg) = C(w, s_1) ⊕ C(w, s_2), and PS has 6 constituents.
- For n = 3, w = (1 2 3) and w′ = (2 3)w: w(w′)⁻¹ = (2 3) ∈ W_1, so C(w, s_1) ≅ C(w′, s_1); for w′′ = (1 2)w, w(w′′)⁻¹ = (1 2) ∉ W_1, so C(w, s_1) ≇ C(w′′, s_1).

### 8.5 The constituents C(I, s_(i,σ))

For 1 ≤ i ≤ n − 1, σ ∈ Σ_L and I ⊆ {1, …, n} with #I = i, all C(w, s_(i,σ)) with w⁻¹({1, …, i}) = I are isomorphic by 8.4 (4), because w(w′)⁻¹ ∈ W_i if and only if w and w′ lie in the same coset W_iw, if and only if w⁻¹({1, …, i}) = (w′)⁻¹({1, …, i}); define C(I, s_(i,σ)) as their common class. Prove: the C(I, s_(i,σ)) are pairwise distinct for distinct (I, σ); C(I, s_(i,σ)) ≅ soc_G (Ind_(B⁻(L))^(GL_n(L)) z^(s_(i,σ)·λ)w(φ)η)^(ℚ_p-an) for any w with w⁻¹({1, …, i}) = I, the inducing weight being +s_(i,σ)·λ because C(w, s_(i,σ)) = F(L⁻(−s_(i,σ)·λ), w(φ)η) and F negates the generating weight (6.1); and the labels run over all nonempty proper subsets I ⊂ {1, …, n}, giving (2^n − 2)d_L constituents (Ding, the paragraph after Proposition 3.1 and (3.1), arXiv v2 p. 37, with the corrections listed under Source corrections).

The proof route for the socle realisation: 6.5 (2) gives soc (Ind z^(s·λ)w(φ)η)^an = F^G_(P_i⁻)(L⁻(−s_(i,σ)·λ), soc i^(L_i)(w(φ)η)) = C(w, s_(i,σ)). Count: Σ_(i=1)^(n−1) binom(n, i) = 2^n − 2 subsets, times d_L embeddings.

API:

- C(I, s_(i,σ)) is well defined: C(w, s_(i,σ)) depends only on w⁻¹({1, …, i}).
- Distinct pairs (I, σ) give non-isomorphic representations C(I, s_(i,σ)).
- For every w with w⁻¹({1, …, i}) = I, C(I, s_(i,σ)) is the socle of (Ind_(B⁻(L))^(GL_n(L)) z^(s_(i,σ)·λ)w(φ)η)^(ℚ_p-an).
- The labels are the nonempty proper subsets I of {1, …, n}, with i = #I, so there are (2^n − 2)d_L representations C(I, s_(i,σ)).

*Needs:* 8.4, 6.1, 6.5.

**Checks.**

- For n = 2 the labels are I = {1}, {2}, giving 2d_L constituents; for n = 3, 6d_L.
- Degenerate case: for n = 1 there are no labels.
- Non-example: the labels are not the subsets of {1, …, n − 1}: for n = 2, I = {2} is a label, C({2}, s_(1,σ)) ≅ C(s, s_(1,σ)).
- For n = 3, w = (1 3): w⁻¹({1}) = {3}, so C(w, s_(1,σ)) ≅ C({3}, s_(1,σ)).
- For n = 3, w = (1 2 3) and w′ = (2 3)w lie in one coset W_1w and both have inverse image {3} of {1}, while their forward images of {1} are {2} and {3}: only the inverse-image label is well defined.
- For GL_2(ℚ_p), h = (1, 0), λ = (1, 1), s·λ = (0, 2): C(w, s) = F(L⁻((0, −2)), w(φ)η) has algebraic central weight +2, agreeing with the induction of z^((0,2))w(φ)η; the induction of z^((0,−2)) has central weight −2 and cannot contain it.

### 8.6 Jacquet modules and closed inductions of the constituents

Let w ∈ S_n with w⁻¹({1, …, i}) = I. Prove: (1) Hom_(T(L))(z^(s_(i,σ)·λ)w(φ)ηδ_B, J_B(C(I, s_(i,σ)))) ≅ E; (2) I_(B⁻(L))^(GL_n(L))(z^(s_(i,σ)·λ)w(φ)η) ≅ C(I, s_(i,σ)) (Ding, Lemma 3.2 and its proof, arXiv v2 pp. 37–38, with the torus T(L) and the positive weight). The proof route: each constituent of PS embeds into a locally analytic principal series (6.5 (2)), hence is very strongly admissible (5.1, 2.2); (1) is 7.6 with Q = B, computing the left side as Hom_G(C(I, s), C(I, s)) = E; for (2), the T-eigenline of (1) lies in J_B(C(I, s)) ⊆ J_B((Ind z^(s·λ)w(φ)η)^an) because the corresponding Hom into J_B of every other constituent vanishes, and by definition (7.2) its G-span is the socle C(I, s).

*Needs:* 8.5, 7.2, 7.6, 2.2, 5.1.

**Checks.**

- For n = 2, L = ℚ_p: I_B⁻^G(z^(s·λ)φη) ≅ C(1, s) = C({1}, s).
- Degenerate case: for n = 1 there is no s_(i,σ) and the statement is empty.
- For λ = (1, 1) and s·λ = (0, 2), the character z^((0,2))w(φ)ηδ_B is not a T-eigencharacter of J_B(π_alg) (whose characters have algebraic part z^((1,1))), so the line of (1) does not come from the socle.

### 8.7 The representations PS_1(w(φ), h) and π_1(φ, h)

Define PS_1(w(φ), h) ⊆ PS(w(φ), h) as the unique subrepresentation with socle π_alg(φ, h) and cosocle ⊕_(i,σ) C(w, s_(i,σ)): the preimage of soc(PS/π_alg) (8.4 (2)–(3)). Using the fixed embeddings π_alg ↪ PS_1(w(φ), h), define π_1(φ, h) as the unique quotient with socle π_alg(φ, h) of the amalgamated sum ⊕^(w∈S_n)_(π_alg) PS_1(w(φ), h). Prove that π_1(φ, h) exists and is unique, is an extension of ⊕_((I, i, σ)) C(I, s_(i,σ)) ((2^n − 2)d_L constituents, each once) by π_alg(φ, h), with injections π_alg ↪ π_1 and PS_1(w(φ), h) ↪ π_1, depends only on (φ, h), and that restriction to the socle gives End_G(π_1) ≅ End_G(π_alg) = E (Ding, (3.2)–(3.3) and the paragraph before them, arXiv v2 p. 38; Breuil–Herzig, Proposition 5.9 and its proof, p. 27).

The proof route: in the finite amalgam M, A = π_alg has composition multiplicity one; subrepresentations disjoint from A have no A constituent and so do their finite sums, so finite length gives a largest one R, A embeds essentially into M/R, and a quotient keeping A with that socle kills exactly R. The repeated constituents C(w, s_(i,σ)) for w in one coset W_iw are identified in M/R through the compatible embeddings of Breuil–Herzig, Proposition 5.9, leaving each C(I, s_(i,σ)) once. For End: an endomorphism minus its scalar on the socle kills the socle, so its image is a quotient of π_1/π_alg = ⊕ C(I, s) embedded in π_1, which has socle π_alg; hence it is zero.

API:

- PS_1(w(φ), h) is the preimage in PS(w(φ), h) of soc(PS(w(φ), h)/π_alg(φ, h)), an extension of ⊕_(i,σ) C(w, s_(i,σ)) by π_alg(φ, h).
- π_1(φ, h) is an extension of ⊕ C(I, s_(i,σ)), each constituent once, by π_alg(φ, h); it receives injections PS_1(w(φ), h) ↪ π_1(φ, h) restricting to the fixed embeddings of π_alg for every w, and up to isomorphism it depends only on (φ, h).
- Restriction to the socle gives End_G(π_1(φ, h)) = End_G(π_alg(φ, h)) = E.

*Needs:* 8.4, 8.5, 1.4.

**Checks.**

- Degenerate case: for n = 1, PS_1 = π_1 = π_alg = φ_1z^(h_1).
- For n = 2 the length of π_1 is 1 + 2d_L; for n = 3 it is 1 + 6d_L and PS_1(w(φ), h) has length 1 + 2d_L.
- Non-example: for n ≥ 3, PS_1(w(φ), h) ≠ PS(w(φ), h): the C(w, u) with lg(u) ≥ 2 lie outside PS_1.
- For n = 2 and L = ℚ_p, π_1 is the amalgam of PS(φ, h) and PS(s(φ), h) over π_alg, with cosocle C({1}, s) ⊕ C({2}, s).

### 8.8 Self-extensions of π_alg(φ, h)

Prove: (1) for w ∈ S_n and ψ ∈ Hom_(g′)(T(L), E), I_(B⁻)(w(φ)ηz^λ(1 + ψε)) (7.2) is a self-extension of π_alg(φ, h), and ζ_w : Hom_(g′)(T(L), E) → Ext¹_(GL_n(L))(π_alg, π_alg), ψ ↦ I_(B⁻)(w(φ)ηz^λ(1 + ψε)), is bijective and restricts to Hom_sm(T(L), E) ≅ Ext¹_lalg(π_alg, π_alg); hence dim Ext¹_lalg = n and dim Ext¹_(GL_n(L))(π_alg, π_alg) = n + d_L; for ψ = ψ_1 + ψ_0 ∘ det with ψ_1 smooth, I(w(φ)ηz^λ(1 + ψε)) ≅ (Ind_B⁻ w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗_(E[ε]) (1 + εψ_0 ∘ det); (2) for w_1, w_2 ∈ S_n, ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1) on Hom_(g′)(T(L), E), with the action of Convention 6; ζ_w does not depend on the isomorphisms (3.2) (Ding, Proposition 3.3, (3.4)–(3.6), its proof and Remark 3.4, arXiv v2 pp. 38–40).

The proof route: the canonical embedding of w(φ)ηz^λ(1 + ψε)δ_B into J_B of the deformed induction factors through the displayed E[ε]-module, which by 7.2 (iv) is the closed induction, a self-extension of π_alg. With central character fixed, Ext¹_(lalg,Z) ≅ Ext¹_(G,Z) (1.10 (2)), and smooth theory gives Hom_sm(T/Z, E) ≅ Ext¹_(lalg,Z) of dimension n − 1; comparing 0 → Hom_sm(T(L)/Z, E) → Hom_(g′)(T(L), E) → Hom(Z(L), E) → 0 with 0 → Ext¹_Z → Ext¹ → Hom(Z(L), E) → 0 shows ζ_w bijective. For (2), determinant twists ψ_0 ∘ det are permutation-invariant, so it suffices to treat ψ ∈ Hom_sm(T(L), E), where ζ_w(ψ) = κ_w(ψ) ⊗ L(λ) with κ_w(ψ) ∈ Ext¹_sm(π_sm(φ), π_sm(φ)) the class of (Ind_B⁻ w(φ)η(1 + ψε))^∞. Put u = w_2w_1⁻¹ and take the morphisms 𝒥_w : X_w → Spec 𝒵, p_u : X_(w_1) → X_(w_2) and the injective map θ of gap:ordered-character-map (Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, Lemma 3.22). Since 𝒥_(w_2) ∘ p_u = 𝒥_(w_1), p_u(w_1(φ)) = w_2(φ) and the tangent map of p_u at w_1(φ) is ψ ↦ u·ψ (Convention 6), d𝒥_(w_2)(u·ψ) = d𝒥_(w_1)(ψ); as θ ∘ κ_w = d𝒥_w and θ is injective, κ_(w_2)(u·ψ) = κ_(w_1)(ψ), hence ζ_(w_2)(u·ψ) = ζ_(w_1)(ψ).

*Needs:* 8.2, 7.2, 1.9, 1.10, 8.1; gap:ordered-character-map; SmoothRepresentationsOfLocalGroups SR.0d.2 (*central-ext-vanishing*), SR.3.2 (*bernstein-centre-blocks*).

**Checks.**

- For n = 1: Ext¹_(L^×)(χ, χ) = Hom(L^×, E) of dimension 1 + d_L and Ext¹_lalg of dimension 1.
- For n = 2, L = ℚ_p: dim Ext¹_lalg = 2 and dim Ext¹ = 3.
- For n = 3, w_1 = 1, w_2 = (1 2 3) and ψ_1 the smooth character on the first coordinate: (1 2 3)·ψ_1 = ψ_2 and ζ_((123))(ψ_2) = ζ_1(ψ_1); equivalently ζ_((123))(ψ_1) = ζ_1(ψ_3). A transposition-only test cannot distinguish this from the reversed identity.
- Domains of the Bernstein-centre maps: for n = 3, L = ℚ_3, w_1 = 1, u = w_2 = (1 2 3) and unramified φ with (φ_1(3), φ_2(3), φ_3(3)) = (2, 4, 8) (generic, all ratios being powers of 2), p_u sends the point (2, 4, 8) of X_1 to (8, 2, 4) = u(φ), the base point of X_u; the alternative (φ′_i) ↦ (φ′_(u(i))) gives (4, 8, 2) ≠ u(φ). The point 𝒥_w(φ′) depends only on the multiset of the φ′_i, because ηδ_(B⁻)^(−1/2) = |det|_L^((n−1)/2) is permutation-invariant (exponents (i − 1) + (n + 1 − 2i)/2 = (n − 1)/2); both tuples have elementary symmetric values (14, 56, 64). Deforming the first coordinate to 2(1 + ε) gives first-order parts (2, 24, 64) of these values, and after p_u the deformation sits in the second coordinate with the same values, which is d𝒥_u(ψ_2) = d𝒥_1(ψ_1). The composite p_u ∘ 𝒥_1 is not defined, since 𝒥_1 lands in Spec 𝒵, not in a torus; on rings the order is 𝒥_1^* = p_u^* ∘ 𝒥_u^*.

### 8.9 One-dimensional extension groups with a constituent

For every C(I, s_(i,σ)) prove: (1) Ext¹(π_alg(φ, h), C(I, s_(i,σ))) ≅ Ext¹(π_alg, (Ind_B⁻ z^(s_(i,σ)·λ)w(φ)η)^an) ≅ Hom_(T(L))(H_1(N⁻(L), π_alg), z^(s_(i,σ)·λ)w(φ)η) ≅ E for w⁻¹({1, …, i}) = I; (2) for a nonsplit π̃_alg ∈ Ext¹(π_alg, π_alg), pull-back along π̃_alg ↠ π_alg is a bijection Ext¹(π_alg, C(I, s_(i,σ))) ≅ Ext¹(π̃_alg, C(I, s_(i,σ))) (Ding, Lemma 3.5 and its proof, (3.7)–(3.9), arXiv v2 pp. 40–41). The opposite group Ext¹(C(I, s_(i,σ)), π_alg), which Ding quotes from a locally L-analytic computation, is not used and not stated.

The proof route: 5.5 for Σ = π_alg (locally algebraic) and ρ = z^(s·λ)w(φ)η gives E_2^(p,q) = Ext^p_T(H_q(N⁻, π_alg), ρ); H_q(N⁻, π_alg) = H_q(n⁻, L(λ)) ⊗ J_(N⁻)(I_sm(φ)) with J_(N⁻)(I_sm(φ)) ≅ ⊕_w′ w′(φ)η (gap:principal-series-jacquet-finite-coefficients) and Kostant (4.6); distinct torus characters have no Ext (5.3), so in total degree one only Hom_T(H_1(N⁻, π_alg), ρ) ≅ Hom_T(ρ, ρ) = E survives. Push-forward along C(I, s) ↪ (Ind ρ)^an is an isomorphism on Ext¹(π_alg, −) because the other constituents have lg ≥ 2 relative to λ (6.7). For (2), the same computation for π̃_alg, whose restriction to SL_n(L) is locally algebraic so that 5.5 applies, gives Ext¹(π̃_alg, C(I, s)) ≅ Hom_T(w(φ)ηz^(s·λ)(1 + ψε), w(φ)ηz^s·λ) with ψ = ζ_w⁻¹(π̃_alg) ≠ 0, one-dimensional; the pull-back is injective by dévissage.

*Needs:* 8.8, 8.5, 5.5, 5.4, 5.3, 6.7; 4.6; gap:principal-series-jacquet-finite-coefficients.

**Checks.**

- For n = 2, L = ℚ_p: Ext¹(π_alg, C({1}, s)) and Ext¹(π_alg, C({2}, s)) are each one-dimensional.
- For n = 2, L = ℚ_p and λ = (1, 1): H_1(N⁻, L(λ)) is the character s·λ = (0, 2), matching ρ = z^((0,2))w(φ)η in its algebraic part, which is why Hom_T(H_1, ρ) ≠ 0; H_0 has weight (1, 1) ≠ (0, 2) and contributes nothing.
- Degenerate case: for n = 1 there is no C(I, s) and the statement is empty.

### 8.10 The maps ζ_w : Hom(T(L), E) → Ext¹(π_alg(φ, h), π_1(φ, h))

For w ∈ S_n, send ψ ∈ Hom(T(L), E) to the deformed principal series (Ind_B⁻ w(φ)ηz^λ(1 + ψε))^(ℚ_p-an) ∈ Ext¹(PS(w(φ), h), PS(w(φ), h)) (1.9, 5.2 (iv)), pull back along π_alg ↪ PS(w(φ), h), and invert the push-forward isomorphism Ext¹(π_alg, PS_1(w(φ), h)) ≅ Ext¹(π_alg, PS(w(φ), h)) (6.7: the constituents of PS/PS_1 have lg ≥ 2); this defines Ding's (3.10) Hom(T(L), E) → Ext¹(π_alg, PS_1(w(φ), h)), and composing with push-forward along PS_1 ↪ π_1 defines ζ_w : Hom(T(L), E) → Ext¹_(GL_n(L))(π_alg, π_1) ((3.11)). Prove that ζ_w is E-linear and independent of the isomorphisms (3.2), and that ζ_w(ψ) is the push-forward of the closed induction I_(B⁻)(w(φ)ηz^λ(1 + ψε)), an extension of π_alg by a subrepresentation of PS_1, along PS_1 ↪ π_1 (Ding, (3.10)–(3.11), arXiv v2 p. 41, and Remark 3.7, p. 41).

API:

- On Hom_(g′)(T(L), E), ζ_w is the composite of the bijection of 8.8 with push-forward along π_alg ↪ π_1.
- ζ_w(0) is the split extension.

*Needs:* 8.7, 8.8, 6.7, 7.2, 1.9.

**Checks.**

- For ψ ∈ Hom_sm(T(L), E), ζ_w(ψ) is the push-forward of the locally algebraic self-extension (Ind w(φ)η(1 + ψε))^∞ ⊗ L(λ).
- Degenerate case: for n = 1, π_1 = π_alg and ζ_1 : Hom(L^×, E) → Ext¹(χ, χ) is the isomorphism of 5.3.
- Non-example: for n = 2, L = ℚ_p, the sum ζ_1 + ζ_s : Hom(T, E)² → Ext¹(π_alg, π_1) is not injective: the source has dimension 8 and the target n + (2^n − 1)d_L = 5.

### 8.11 Ext¹(π_alg, PS_1) is Hom(T(L), E)

Prove: (1) for w ∈ S_n, the map (3.10) Hom(T(L), E) → Ext¹(π_alg(φ, h), PS_1(w(φ), h)) is bijective, so dim_E Ext¹(π_alg, PS_1(w(φ), h)) = n(1 + d_L), and its composite with the push-forward along PS_1(w(φ), h) ↪ PS(w(φ), h), which is the map ψ ↦ the pull-back of the deformed principal series of 8.10 along π_alg ↪ PS(w(φ), h), is an isomorphism Hom(T(L), E) ≅ Ext¹(π_alg, PS(w(φ), h)); ζ_w itself, whose target is Ext¹(π_alg, π_1), is injective but not surjective for n ≥ 2 (8.14); (2) ζ_w restricted to Hom_(g′)(T(L), E) is 8.8's bijection followed by the push-forward Ext¹(π_alg, π_alg) ↪ Ext¹(π_alg, π_1) (Ding, Proposition 3.6 and its proof, arXiv v2 p. 41; Remark 3.9, p. 42). The proof route: 5.5 for Σ = π_alg and ρ = w(φ)ηz^λ: E_2^(0,1) = Hom_T(H_1(N⁻, π_alg), ρ) = 0, the weights of H_1 being of the form s·λ ≠ λ; E_2^(1,0) = Ext¹_T(H_0(N⁻, π_alg), ρ) = Ext¹_T(ρ, ρ) ≅ Hom(T(L), E) (5.3), the other characters of H_0 contributing nothing; push-forward from PS_1 is an isomorphism by 6.7, and the resulting map is (3.10) by construction.

*Needs:* 8.10, 8.9, 5.5, 6.7.

**Checks.**

- For n = 2, L = ℚ_p: dim Ext¹(π_alg, PS_1(φ, h)) = 4.
- Degenerate case: for n = 1 both sides are Hom(L^×, E).
- For L = ℚ_p(√p) and n = 2: dim = 2(1 + 2) = 6.

### 8.12 The extension group Ext¹(π_alg(φ, h), π_1(φ, h))

Prove: (1) the sequence 0 → Ext¹(π_alg, π_alg) → Ext¹(π_alg, π_1(φ, h)) → ⊕_(i,σ,I) Ext¹(π_alg, C(I, s_(i,σ))) → 0, I running over the subsets of {1, …, n} with #I = i, is exact, so dim_E Ext¹_(GL_n(L))(π_alg(φ, h), π_1(φ, h)) = n + (2^n − 1)d_L; (2) t_(φ,h) := (ζ_w)_w : ⊕_(w∈S_n) Hom(T(L), E) → Ext¹(π_alg, π_1(φ, h)) is surjective; (3) push-forward Ext¹(π_alg, π_1) → Ext¹(π_alg, π(φ, h)) is an isomorphism (8.13), so (2) holds for π(φ, h) (Ding, Proposition 3.8, (3.12)–(3.15) and its proof, arXiv v2 pp. 41–42; Remark 3.9, (3.16), p. 42). The proof route: dévissage of 0 → π_alg → π_1 → ⊕ C(I, s) → 0 with Hom(π_alg, C(I, s)) = 0; for each w the sequence 0 → Ext¹(π_alg, π_alg) → Ext¹(π_alg, PS_1(w(φ), h)) → ⊕_(i,σ) Ext¹(π_alg, C(w, s_(i,σ))) has last map surjective by dimensions (n + d_L, n + nd_L and (n − 1)d_L lines: 8.8, 8.11, 8.9); every C(I, s_(i,σ)) is a C(w, s_(i,σ)) for some w, so varying w covers the target; the dimension is (n + d_L) + (2^n − 2)d_L.

*Needs:* 8.11, 8.9, 8.8, 8.7, 1.7.

**Checks.**

- For n = 2, L = ℚ_p: dim Ext¹(π_alg, π_1) = 2 + 3 = 5, while ⊕_w Hom(T, E) has dimension 8.
- Degenerate case: for n = 1, Ext¹(π_alg, π_1) = Hom(L^×, E) of dimension 1 + d_L = n + (2^n − 1)d_L.
- Non-example: indexing I over subsets of {1, …, n − 1} would give, for n = 2, one label per σ and dimension n + d_L + d_L·1 = 4 ≠ 5 for L = ℚ_p, contradicting (1)'s count through 8.9 and 8.11.

### 8.13 The amalgam π(φ, h) of the principal series

Define π(φ, h) as the unique quotient with socle π_alg(φ, h) of the amalgamated sum ⊕^(w∈S_n)_(π_alg) PS(w(φ), h) over the fixed embeddings; it is the representation π(ρ)^fs of Breuil–Herzig in this setting (Breuil–Herzig, Definition 5.7(i)–(iv), pp. 26–27). Prove that it exists, is unique and admissible, that π_1(φ, h) is the subrepresentation formed by the first two layers of its socle filtration, and that push-forward Ext¹(π_alg, π_1) → Ext¹(π_alg, π(φ, h)) is an isomorphism (Ding, Remark 3.9 and (3.16), arXiv v2 p. 42). The proof route: as in 8.7 for existence and uniqueness; the socle filtration begins with π_alg and ⊕ C(I, s) by 8.4 (2)–(3); the constituents of π/π_1 are C(w, u) with lg(u) ≥ 2, for which Hom(π_alg, −) and Ext¹(π_alg, −) vanish (6.7).

API:

- π(φ, h) is admissible with socle π_alg(φ, h), and π_1(φ, h) is its subrepresentation formed by the first two layers of the socle filtration.
- Push-forward along π_1(φ, h) ↪ π(φ, h) is an isomorphism Ext¹(π_alg, π_1) ≅ Ext¹(π_alg, π(φ, h)).

*Needs:* 8.7, 8.4, 6.7.

**Checks.**

- For n = 2 and L = ℚ_p, π(φ, h) = π_1(φ, h), since PS has length 2.
- Degenerate case: for n = 1, π(φ, h) = π_alg(φ, h).
- Non-example: for n = 3, π(φ, h) ≠ π_1(φ, h): it contains constituents C(w, u) with lg(u) = 2.
- dim Ext¹(π_alg, π(φ, h)) = n + (2^n − 1)d_L.

### 8.14 The filtration Ext¹_g ⊆ Ext¹_g′ ⊆ Ext¹_w

Inside Ext¹(π_alg, π_1(φ, h)) define Ext¹_g, Ext¹_g′ and Ext¹_w as the images of Ext¹_lalg(π_alg, π_alg), of Ext¹(π_alg, π_alg) and of ζ_w. Prove: ζ_w : Hom(T(L), E) ≅ Ext¹_w ((3.17)); Ext¹_g ⊆ Ext¹_g′ ⊆ Ext¹_w for every w, of dimensions n, n + d_L and n(1 + d_L); Ext¹_g′ is independent of w; Σ_w Ext¹_w = Ext¹(π_alg, π_1); and ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1) on Hom_(g′)(T(L), E) ((3.18)) (Ding, the definitions before (3.17) and (3.17)–(3.18), arXiv v2 pp. 42–43). The proof route: push-forward Ext¹(π_alg, π_alg) → Ext¹(π_alg, π_1) is injective since Hom(π_alg, π_1/π_alg) = 0; 8.11 (2) gives Ext¹_g′ ⊆ Ext¹_w; ζ_w is injective because it factors through the bijection of 8.11 followed by the push-forward PS_1 ↪ π_1, injective by dévissage; (3.18) is 8.8 (2).

API:

- For every w ∈ S_n, Ext¹_g ⊆ Ext¹_g′ ⊆ Ext¹_w inside Ext¹(π_alg, π_1), of dimensions n, n + d_L and n(1 + d_L), and ζ_w : Hom(T(L), E) → Ext¹_w is an isomorphism.
- Ext¹_g′ does not depend on w, and the Ext¹_w, w ∈ S_n, together span Ext¹(π_alg, π_1).
- On Hom_(g′)(T(L), E), ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1) for all w_1, w_2 ∈ S_n.

*Needs:* 8.12, 8.11, 8.8.

**Checks.**

- For n = 2, L = ℚ_p: dimensions 2 ⊆ 3 ⊆ 4 inside 5.
- Degenerate case: for n = 1, Ext¹_g′ = Ext¹_w = Ext¹ = Hom(L^×, E) and Ext¹_g = Hom_sm(L^×, E).
- Non-example: for n ≥ 2 a single Ext¹_w is proper, n(1 + d_L) < n + (2^n − 1)d_L.

### Examples

- For n = 2 and L = ℚ_p: PS(φ, h) has constituents π_alg and C(1, s); π_1 = π(φ, h) has length 3; Ext¹(π_alg, π_1) has dimension 5 with the filtration 2 ⊆ 3 ⊆ 4.
- For n = 3 and L = ℚ_p: π_1 has length 7, dim Ext¹(π_alg, π_1) = 3 + 7 = 10, and each Ext¹_w has dimension 6.

### Dependencies

Layers 1, 2, 4–7; SmoothRepresentationsOfLocalGroups SR.0.4, SR.0d.2, SR.2.1, SR.2.2, SR.3.2 with gap:generic-principal-series-finite-coefficients, gap:principal-series-jacquet-finite-coefficients, gap:finite-length-finite-coefficients, gap:ordered-character-map; ReductiveGroups Layer 7.

## Layer 9: Parabolic induction and the amalgamation of π_1

This layer relates the extension groups of Layer 8 to parabolic induction, in the setting of Layer 8. Its input is Layer 8 applied to each Levi block GL_(n_i)(L) of a standard parabolic P, transported to GL_n(L) by parabolic induction (5.1) and completed tensor products (0.9, 1.5); this is why it follows Layer 8. It builds the Levi data of a P-filtration and the parabolic induction of the blocks' π_1, the constituents C(I, s_(i,σ)) of a parabolic induction, the representations π_(F_P)(φ, h), the extension groups Ext¹(π_alg, π_(F_P)), the maps ζ_(F_P) and their bijectivity, and the amalgamation of the two endpoint parabolics into π_1(φ, h).

### 9.1 Levi data of a P-filtration and the parabolic induction

Let P ⊇ B be standard with Levi L_P = diag(GL_(n_1), …, GL_(n_r)) and Weyl group W_P. A P-filtration F_P of ⊕_(i=1)^n φ_i is an ordering of the φ_i into consecutive blocks of sizes n_1, …, n_r; put φ_(F_P,i) := ⊠_(φ_j ∈ gr^i F_P) φ_j, h^i := (h_(n_1+⋯+n_(i−1)+1), …, h_(n_1+⋯+n_i)) and λ^i the corresponding dominant weight. For w ∈ S_n, T_w is the B-filtration, the complete ordering φ_(w⁻¹(1)), …, φ_(w⁻¹(n)) of the φ_i, so that its graded characters form w(φ); T_w is compatible with F_P, written T_w ⊆ F_P, when it refines F_P, that is, when w lies in the coset W_Pw_0 for one ordering w_0 refining F_P, and then T_(w,i) is the induced B ∩ L_(P,i)-filtration of gr^i F_P (Ding, §2.1, arXiv v2 p. 12, and §2.3, the paragraph before Corollary 2.15, p. 20, where these notions are introduced for the corresponding filtrations of (φ, Γ)-modules). Layer 8 for (φ_(F_P,i), h^i) gives π_alg(φ_(F_P,i), h^i) ⊆ π_1(φ_(F_P,i), h^i) for GL_(n_i)(L); for n_i = 1, with k = n_1 + ⋯ + n_(i−1) + 1 and ψ_k the unique smooth character in gr^i F_P, both equal ψ_kz^(h_k). Prove that, after fixing compatible isomorphisms (transitivity of induction, matching (3.2) for all w ∈ W_Pw_0 refining F_P, w_0 one such ordering), there is an injection π_alg(φ, h) ≅ (Ind_(P⁻(L))^(GL_n(L)) (⊠_i π_alg(φ_(F_P,i), h^i)) ε⁻¹ ∘ θ^P)^lalg ↪ (Ind_(P⁻(L))^(GL_n(L)) (⊗̂_i π_1(φ_(F_P,i), h^i)) ε⁻¹ ∘ θ^P)^(ℚ_p-an) ((3.19)), with ⊗̂ the completed tensor product of 0.9, admissible by 1.5 and 5.1 (Ding, the paragraph before Lemma 3.10 and (3.19), arXiv v2 p. 43). The proof route: transitivity of induction (5.1 (iii)) identifies I_sm(w(φ)) ⊗ L(λ) with the induction from P⁻ of ⊠_i I_sm(w_i(φ_(F_P,i))) ⊗ L(λ^i) twisted by ε⁻¹ ∘ θ^P, the twist correcting the shift between λ and (λ^i)_i; the refinements of F_P form the left coset W_Pw_0, which is W_P itself only for the standard filtration; exactness of induction gives (3.19).

API:

- For P = B, each block has size one and the induction is PS(w(φ), h) for the w with T_w = F_P.
- For P = G (r = 1), the induction is π_1(φ, h) and (3.19) is π_alg ↪ π_1.

*Needs:* 8.7, 8.1, 5.1, 0.9, 1.5.

**Checks.**

- For n = 3, blocks (2, 1) and the ordered tuple (φ_3, φ_1, φ_2), the singleton block starts at k = 3 and its representation is φ_2z^(h_3): the weight is indexed by position and the character by the grade, so neither φ_3z^(h_3) nor the index k − 1 is correct.
- For n = 3 and blocks (2, 1), θ^P = (0, 0, −2); the twist ε⁻¹ ∘ θ^P is trivial on the first block.
- Degenerate case: for n = 1, P = B = G and (3.19) is the identity of φ_1z^(h_1).

### 9.2 The constituents C(I, s_(i,σ)) of a parabolic induction

Prove that for 1 ≤ i ≤ n − 1, σ ∈ Σ_L and #I = i, C(I, s_(i,σ)) is a constituent of the induction (3.19) if and only if either (1) there is k with n_1 + ⋯ + n_(k−1) + 1 ≤ i ≤ n_1 + ⋯ + n_k − 1 and {j : φ_j ∈ Fil^(k−1)_(F_P)} ⊆ I ⊆ {j : φ_j ∈ Fil^k_(F_P)}, or (2) i = n_1 + ⋯ + n_k for some k ≤ r − 1 and I = {j : φ_j ∈ Fil^k_(F_P)}; each such constituent has multiplicity one and lies in the socle of the quotient of the induction by π_alg(φ, h) (Ding, Lemma 3.10 and its proof, arXiv v2 pp. 43–44). The proof route: in case (2) the constituents come from the induction V_0 of ⊠_i π_alg(φ_(F_P,i), h^i), as Orlik–Strauch representations of the constituents L⁻(−s_(i,σ)·λ) of the parabolic Verma module, of multiplicity one and in the top of the kernel to L⁻(−λ) (4.5 (iii), 6.5); in case (1), V_I, the induction of ⊠_(j≠k) π_alg ⊠ C(I, s_(i,σ))_k, embeds into (Ind z^(s·λ)w(φ)η)^an for w⁻¹({1, …, i}) = I, whose socle is C(I, s) (8.5); every C(I, s) in the induction comes from V_0 or a V_I by exactness and 6.5.

*Needs:* 9.1, 8.5, 6.3, 6.5; 4.5.

**Checks.**

- For P = B the condition reduces to I = w⁻¹({1, …, i}) for the w attached to F_P: the C(w, s_(i,σ)) of PS_1(w(φ), h).
- For P = G every label occurs, by case (1) with k = 1.
- For n = 3, P with blocks (2, 1) and the standard filtration: case (1) gives i = 1 and I ∈ {{1}, {2}}; case (2) gives i = 2 and I = {1, 2}; the label {3} for i = 1 does not occur.

### 9.3 The subrepresentation π_(F_P)(φ, h) and Ext¹_(F_P)

Let S_(F_P) be the set of C(I, s_(i,σ)) satisfying 9.2; #S_(F_P) = (Σ_(i=1)^r (2^(n_i) − 2) + (r − 1))d_L ((3.21)). Define π_(F_P)(φ, h) as the unique subrepresentation of the induction (3.19) with socle π_alg(φ, h) and π_(F_P)/π_alg ≅ ⊕_(C∈S_(F_P)) C. Prove that for P = B and F_P = T_w, π_(F_P) ≅ PS_1(w(φ), h); that π_alg ↪ π_(F_P) extends uniquely to π_(F_P) ↪ π_1(φ, h); and define Ext¹_(F_P)(π_alg, π_1) as the image of the injective push-forward Ext¹(π_alg, π_(F_P)) → Ext¹(π_alg, π_1) and Ext¹_(F_P,g′) := ζ_(F_P)(∏_i Ext¹_(g′)(π_alg(φ_(F_P,i), h^i), π_1(φ_(F_P,i), h^i))) (9.5). Define also Hom_(P,g′)(T(L), E) := {ψ ∈ Hom(T(L), E) : ψ − ψ_P ∘ det_(L_P) ∈ Hom_sm(T(L), E) for some ψ_P ∈ Hom(Z_(L_P)(L), E)}, where det_(L_P) : T(L) → Z_(L_P)(L) ≅ (L^×)^r sends t to the block determinants (∏_(j in block i) t_j)_i (Ding, §2.3, (2.21), arXiv v2 p. 21), and prove that under Hom(T(L), E) = ∏_i Hom(T(L) ∩ L_(P,i)(L), E) it is ∏_i Hom_(g′)(T(L) ∩ L_(P,i)(L), E), the space of 5.3 (4) for each block GL_(n_i), so that dim_E Hom_(P,g′)(T(L), E) = n + r·d_L (Ding, (3.21), the definition of π_(F_P)(φ, h) and the remarks after it, arXiv v2 pp. 44–45, and the definitions after Propositions 3.11 and 3.12, pp. 45–47). The proof route: existence and uniqueness from 9.2 by taking a preimage; count within block k over i between consecutive filtration steps, giving 2^(n_k) − 2, plus one label at each of the r − 1 block boundaries, times d_L; the extension to π_1 because both have socle π_alg and the constituents of π_(F_P)/π_alg occur once in π_1/π_alg.

API:

- π_(F_P)(φ, h) has socle π_alg(φ, h) and π_(F_P)/π_alg ≅ ⊕_(C∈S_(F_P)) C, with #S_(F_P) = (Σ_(i=1)^r (2^(n_i) − 2) + (r − 1))d_L.
- For P = B and F_P = T_w, π_(F_P)(φ, h) ≅ PS_1(w(φ), h).
- The inclusion π_alg ↪ π_(F_P) extends uniquely to an injection π_(F_P) ↪ π_1(φ, h), and Ext¹_(F_P)(π_alg, π_1) is the image of push-forward along it, injective by 9.4.

*Needs:* 9.2, 8.7, 1.4.

**Checks.**

- For P = B: #S_(F_P) = (n − 1)d_L.
- For P = G: #S_(F_P) = (2^n − 2)d_L and π_(F_P) = π_1.
- For n = 3 and blocks (2, 1): #S_(F_P) = ((2² − 2) + 0 + 1)d_L = 3d_L.
- Non-example: for P = B and n ≥ 2, π_(F_P) = PS_1(w(φ), h) is proper in π_1, with (n − 1)d_L of the (2^n − 2)d_L second-layer constituents.
- Hom_(P,g′) at the two extremes: for P = B every block is GL_1, Hom_(g′) of GL_1 is all of Hom(L^×, E), and Hom_(B,g′)(T(L), E) = Hom(T(L), E), of dimension n + n·d_L = n(1 + d_L); for P = G it is Hom_(g′)(T(L), E) of 5.3 (4), of dimension n + d_L.
- Hom_(P,g′) between them: for n = 3, L = ℚ_p and blocks (2, 1), Hom_(P,g′)(T(ℚ_p), E) consists of the ψ_sm + a·log_p(t_1t_2) + b·log_p(t_3) with ψ_sm smooth, of dimension 3 + 2 = 5, against 4 for Hom_(g′) and 6 for Hom. It contains log_p(t_3) but not log_p(t_1): log_p(t_1) − (c·log_p(t_1t_2) + d·log_p(t_3)) is smooth only if c = 1, c = 0 and d = 0. Reading Hom_(P,g′) as the global Hom_(g′) would lose log_p(t_3); reading it as Hom would admit log_p(t_1).

### 9.4 The extension group Ext¹(π_alg, π_(F_P))

Prove that dim_E Ext¹_(GL_n(L))(π_alg(φ, h), π_(F_P)(φ, h)) = n + d_L·r + d_L·Σ_(i=1)^r (2^(n_i) − 2) and that the push-forward Ext¹(π_alg, π_(F_P)) → Ext¹(π_alg, π_1) is injective (Ding, Proposition 3.11 and its proof, (3.22)–(3.23), arXiv v2 p. 45). The proof route: 0 → Ext¹(π_alg, π_(F_P)) → Ext¹(π_alg, π_1) → Ext¹(π_alg, ⊕_(C∉S_(F_P)) C) is exact since Hom(π_alg, C) = 0, the last map is surjective by 8.12 (1), and each Ext¹(π_alg, C) is a line (8.9), so the dimension is n + (2^n − 1)d_L − ((2^n − 2)d_L − #S_(F_P)) = n + d_L + #S_(F_P).

*Needs:* 9.3, 8.12, 8.9.

**Checks.**

- For P = B: dim = n + nd_L, matching 8.11.
- For P = G: dim = n + d_L + (2^n − 2)d_L = n + (2^n − 1)d_L, matching 8.12.
- For n = 3, blocks (2, 1), L = ℚ_p: dim = 3 + 2 + 2 = 7.

### 9.5 The parabolic induction map ζ_(F_P)

Write A_i = π_alg(φ_(F_P,i), h^i) and B_i = π_1(φ_(F_P,i), h^i). Locally analytic induction twisted by ε⁻¹ ∘ θ^P and pull-back along (3.19) give Ext¹_(L_P)(⊠_i A_i, ⊗̂_i B_i) → Ext¹_G(π_alg, (Ind …)^an) ≅ Ext¹_G(π_alg, π_(F_P)) ((3.25)), the last isomorphism because the constituents of the induction modulo π_(F_P) have lg ≥ 2 (6.7). For extensions 0 → B_i → X_i → A_i → 0, filter ⊗̂_i X_i by the number of B-factors; the quotient by filtration degree ≥ 2 is an extension 0 → ⊕_i (B_i ⊠ ⊗̂_(j≠i) A_j) → V → ⊠_i A_i → 0; push it out along ⊕_i (B_i ⊠ ⊗̂_(j≠i) A_j) → ⊗̂_i B_i, given on each summand by the embeddings A_j ↪ B_j, and sum ((3.26)). Define ζ_(F_P) : ∏_i Ext¹(A_i, B_i) → Ext¹_(F_P)(π_alg, π_1) as push-forward ∘ (3.25) ∘ (3.26) ((3.27)) (Ding, (3.25)–(3.27) and the construction between them, arXiv v2 pp. 45–46, with the corrected kernel). Prove that ζ_(F_P) is E-linear (additive in the tuple of classes, not multilinear), that the quotient and push-out stay admissible (1.5, 1.4), and that for P = B, ζ_(F_P) = ζ_w for the w with T_w = F_P.

API:

- ζ_(F_P) is E-linear: additive in the tuple of classes and compatible with scalars, not multilinear.
- The quotient V of ⊗̂_i X_i and its push-out are admissible representations of L_P(L), so (3.25) applies to them.
- For P = B, ζ_(F_P) = ζ_w for the w with T_w = F_P.

*Needs:* 9.3, 9.1, 0.9, 1.4, 1.5, 5.1, 6.7.

**Checks.**

- For P = G (r = 1), ζ_(F_P) is the identity of Ext¹(π_alg, π_1).
- For P = B and the refinement with ordered characters ψ_i = φ_(w⁻¹(i)), the source is ∏_i Ext¹_(GL_1)(ψ_iz^(h_i), ψ_iz^(h_i)) = Hom(T(L), E) and ζ_(F_P) = ζ_w.
- For n = 3, blocks (2, 1): the source has dimension (2 + 3d_L) + (1 + d_L) = 3 + 4d_L = n + d_L·r + d_L·Σ(2^(n_i) − 2).
- With a single factor, V = X_1 and the kernel is B_1; the reversed tensor expression would give A_1 and not define the input extension. For three vector-space extensions with dim A_i = 1 and dim B_i = 2, the degree-one kernel has dimension 2 + 2 + 2 = 6, whereas the reversed expression has dimension 4 + 4 + 4 = 12.

### 9.6 ζ_(F_P) is bijective and compatible with the weight maps

Prove: (1) ζ_(F_P) : ∏_i Ext¹(π_alg(φ_(F_P,i), h^i), π_1(φ_(F_P,i), h^i)) → Ext¹_(F_P)(π_alg, π_1) is bijective; (2) for every w with T_w compatible with F_P, the square with top ∏_i Hom(T(L) ∩ L_(P,i)(L), E) ≅ Hom(T(L), E), vertical maps (3.17) for each GL_(n_i) and for GL_n, and bottom ∏_i Ext¹_(T_(w,i)) ≅ Ext¹_w induced by ζ_(F_P), commutes ((3.28)); (3) for w with T_w compatible with F_P, ζ_w restricts to an isomorphism Hom_(P,g′)(T(L), E) ≅ Ext¹_(F_P,g′) (9.3), and for w_1, w_2 with T_(w_1), T_(w_2) compatible with F_P, so that w_2w_1⁻¹ ∈ W_P preserves Hom_(P,g′)(T(L), E), ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1) on Hom_(P,g′)(T(L), E) ((3.30)); (4) ⊕_(T_w ⊆ F_P) Ext¹_w → Ext¹_(F_P) is surjective ((3.29)) (Ding, Proposition 3.12, (3.28)–(3.30) and its proof, arXiv v2 pp. 46–47). The proof route: (2) from 1 + ψε = ⊠_i (1 + ψ_iε) and transitivity of induction; (3) from (2) and 8.8 for each block GL_(n_i), whose ζ_(w_i) maps Hom_(g′)(T(L) ∩ L_(P,i)(L), E) onto Ext¹_(g′) of the block, and 8.8 (2) for the permutation within W_P; (4) as in 8.12, each C ∈ S_(F_P) lying in some PS_1(w(φ), h) with T_w compatible with F_P; (1) by surjectivity from (2) and (4) and equal dimensions (8.12 for each GL_(n_i), 9.4).

*Needs:* 9.5, 9.4, 8.14, 8.12.

**Checks.**

- For P = B both sides are Hom(T(L), E) ≅ Ext¹_w, of dimension n(1 + d_L).
- For P = G, (1) is the identity and (4) is 8.12 (2).
- For n = 3, blocks (2, 1) and L = ℚ_p, both sides of (1) have dimension 7 (9.4, 9.5).

### 9.7 The two endpoint parabolics amalgamate to π_1(φ, h)

Assume n ≥ 2. Let F be the filtration ⊕_(i≤n−1) φ_i ⊂ ⊕_i φ_i (parabolic P_(n−1), Levi GL_(n−1) × GL_1) and G the filtration φ_n ⊂ ⊕_i φ_i (parabolic P_1, Levi GL_1 × GL_(n−1)). Prove: C(I, s_(i,σ)) occurs in π_F(φ, h) if and only if I ⊆ {1, …, n − 1}, and in π_G(φ, h) if and only if n ∈ I; hence π_1/π_alg ≅ (π_F/π_alg) ⊕ (π_G/π_alg), and there are natural exact sequences 0 → π_alg → π_F ⊕ π_G → π_1 → 0 and 0 → Ext¹_(g′)(π_alg, π_1) → Ext¹_F(π_alg, π_1) ⊕ Ext¹_G(π_alg, π_1) → Ext¹(π_alg, π_1) → 0, the first maps b ↦ (b, −b); by 9.6, ζ_F : Ext¹_(GL_(n−1))(π_alg(φ^1, h^1), π_1(φ^1, h^1)) × Hom(L^×, E) ≅ Ext¹_F and similarly ζ_G (Ding, the final paragraph of §3.1.3, Proposition 3.13 and Remark 3.14, arXiv v2 pp. 47–48). The proof route: 9.2 for F and G gives two constituent sets partitioning the (2^n − 2)d_L labels, since a nonempty proper I either avoids n or contains it; π_F and π_G meet exactly in π_alg inside π_1; the Ext sequence is exact on the left from Hom(π_alg, π_1) = E and on the right by dimensions, dim Ext¹_F + dim Ext¹_G − dim Ext¹_g′ = 2(n + 2d_L + (2^(n−1) − 2)d_L) − (n + d_L) = n + (2^n − 1)d_L (9.4, 8.8, 8.12).

*Needs:* 9.6, 9.3, 8.12, 8.8.

**Checks.**

- For n = 2, F and G are the B-filtrations T_1 and T_s, π_F = PS_1(φ, h), π_G = PS_1(s(φ), h), and the first sequence is the amalgam defining π_1.
- For n = 3, π_F contains the labels {1}, {2}, {1, 2} and π_G the labels {3}, {1, 3}, {2, 3}, per σ.
- Non-example: for n = 1 the endpoint parabolics, with blocks of sizes n − 1 = 0 and 1, do not exist and the statement is not made.

### Examples

- For n = 3, L = ℚ_p and blocks (2, 1): S_(F_P) has 3 elements, π_(F_P) has length 4 and Ext¹(π_alg, π_(F_P)) has dimension 7.

### Dependencies

Layers 0, 1, 4, 5, 6, 8.

## Layer 10: Locally σ-analytic theory

This layer decomposes the extension groups of Layers 8 and 9 over the embeddings σ ∈ Σ_L, in the setting of Layer 8. Every construction of those layers is specialised along the splitting g ⊗_(ℚ_p) E = ∏_σ g_σ (0.1, 0.3) by keeping the action of g_σ analytic and requiring the other factors to act algebraically; this is why it follows Layers 8 and 9. It builds locally σ-analytic and g_(Σ_L∖{σ})-algebraic representations, the representations π_(1,σ)(φ, h) and PS_(1,σ)(w(φ), h), σ-analytic self-extensions and extension groups, the decomposition of Ext¹(π_alg, π_1) modulo Ext¹_g over the embeddings, and the σ-analytic forms of 9.6 and 9.7. Algebraic factors away from σ keep their own highest weights, and the σ-analytic inducing weight is positive.

### 10.1 Locally σ-analytic and g_(Σ_L∖{σ})-algebraic representations

Let σ ∈ Σ_L and G a locally L-analytic group with L-Lie algebra g. Define a locally ℚ_p-analytic representation V to be locally σ-analytic if the action of g ⊗_(ℚ_p) E = ∏_τ g_τ (0.3) factors through g_σ; D_σ(G, E) is the quotient of D(G, E) acting on locally σ-analytic representations, dual to the locally σ-analytic functions (0.4 (vi) with the σ-analytic structure; Breuil, Ext¹, §2.1, p. 10). Algebraicity away from σ is measured against an algebraic group, which G and g do not determine. For it, let 𝐆 be a split connected reductive group over L with split maximal torus 𝐓 and G an open subgroup of 𝐆(L) with the L-analytic structure of Conventions 2, the inclusion G ⊆ 𝐆(L) being part of the data, so that g = Lie(𝐆) (0.1). Put 𝐆_(Σ∖σ) := ∏_(τ≠σ) 𝐆 ×_(L,τ) E, a split connected reductive group over E with split maximal torus 𝐓_(Σ∖σ) := ∏_(τ≠σ) 𝐓 ×_(L,τ) E and Lie algebra g_(Σ_L∖{σ}) := ∏_(τ≠σ) g_τ. Define V to be g_(Σ_L∖{σ})-algebraic if for every v the module U(g_(Σ_L∖{σ}))·v is finite-dimensional and lies in the category O^g_alg of 4.2 (the case 𝔭 = 𝔤) for 𝔤 = g_(Σ_L∖{σ}) and the group 𝐆_(Σ∖σ) with its torus 𝐓_(Σ∖σ): Lie(𝐓_(Σ∖σ)) acts on it diagonalisably with weights in the lattice X of differentials of characters of 𝐓_(Σ∖σ); equivalently (4.2 (iii) for 𝔭 = 𝔤) it is the differential of an algebraic representation of 𝐆_(Σ∖σ) (ReductiveGroups Layers 1 and 2). For admissible g_(Σ_L∖{σ})-algebraic V, W, Ext¹_σ(V, W) ⊆ Ext¹_G(V, W) is the subspace of the classes of extensions (1.8) whose middle term is g_(Σ_L∖{σ})-algebraic. For G = 𝐆(L), Hom_σ(T(L), E) and Hom_(σ,g′) are as in 8.1, and (Ind_P^G U)^(σ-an) is 5.1 (vi) (Ding, §3.1.4, the first paragraph, arXiv v2 p. 48, for 𝐆 = GL_n; Breuil, Ext¹, §2.1 and Lemme 2.1.1, p. 10). Prove: (1) both conditions are conditions on the Lie action, stable under subrepresentations, quotients and finite direct sums; (2) g_(Σ∖σ)-algebraic extensions are closed under Baer sum and scalar multiplication, so Ext¹_σ is a subspace; (3) for admissible locally σ-analytic V, W, which are g_(Σ∖σ)-algebraic with g_(Σ∖σ) acting by zero, every g_(Σ∖σ)-algebraic extension of V by W is locally σ-analytic, so Ext¹_σ(V, W) = Ext¹_(D_σ(G,E))(W′, V′) (1.8). The proof route: (1) from 4.2 (i), O^g_alg being closed under submodules, quotients and finite direct sums, with U(g_(Σ∖σ))·(v_1, v_2) ⊆ U(g_(Σ∖σ))·v_1 ⊕ U(g_(Σ∖σ))·v_2; (2) the Baer sum and the scalar multiple are subquotients of direct sums of the given extensions and of W; (3) for x in the middle term, U(g_(Σ∖σ))·x is a finite-dimensional object of O^g_alg, semisimple by 4.2 (ii), whose composition factors are trivial because g_(Σ∖σ) kills V and W, so g_(Σ∖σ) acts on it by zero.

API:

- For G = 𝐆(L), locally algebraic representations (1.6) are g_(Σ∖σ)-algebraic for every σ: the restriction of an algebraic representation of ∏_τ 𝐆 ×_(L,τ) E to the factor 𝐆_(Σ∖σ) is algebraic.
- (Ind_P^G U)^(σ-an) ⊆ (Ind_P^G U)^(ℚ_p-an).

*Needs:* 0.1, 0.3, 0.4, 1.6, 1.7, 1.8, 4.2, 5.1, 8.1; ReductiveGroups Layers 1 and 2 (algebraic representations of 𝐆_(Σ∖σ) and their differentials).

**Checks.**

- Degenerate case: for L = ℚ_p, both conditions hold for every locally ℚ_p-analytic representation and Ext¹_σ = Ext¹.
- dim Hom_σ(L^×, E) = 2 (valuation and σ ∘ log), and dim Hom_(σ,g′)(T(L), E) = n + 1.
- Non-example: for L ≠ ℚ_p and τ ≠ σ, the multiplicative character x ↦ τ(x) of L^× is locally ℚ_p-analytic but not locally σ-analytic.
- For z^μ with μ_τ = 0 for τ ≠ σ, z^μ is locally σ-analytic; if μ_τ ≠ 0 for some τ ≠ σ it is g_(Σ∖σ)-algebraic but not locally σ-analytic.
- Dependence on the algebraic group, the inclusion G ⊆ 𝐆(L) being part of the data: let L = E = ℚ_3(√3), σ the identity and τ the conjugation, 𝐆 = 𝐓 = 𝔾_m and G = H = 1 + 3O_L, open in L^×, on which log : H → 3O_L is an isomorphism (3O_L is the set where v_3 ≥ 1, inside the disc v_3 > 1/2 on which exp and log are inverse). The characters χ_1 = τ|_H and χ_(1/2) = exp(½·log τ(·)) of H are locally ℚ_3-analytic and not locally σ-analytic, g_τ acting by 1 and by 1/2. For the inclusion H ⊆ 𝔾_m(L), χ_1 is g_(Σ∖σ)-algebraic and χ_(1/2) is not, the rational characters t ↦ t^m of 𝔾_m having differentials m ∈ ℤ. The squaring map j(g) = g² is an L-analytic automorphism of H (multiplication by 2 ∈ ℤ_3^× after log) with χ_1 ∘ j⁻¹ = χ_(1/2); for the embedding j : H → 𝔾_m(L) in place of the inclusion, rational characters pull back to τ(·)^(2m), of differential 2m, and 2m = 1 has no solution m ∈ ℤ, so χ_1 is not algebraic for it. A condition read off from the locally L-analytic group H or from its Lie algebra alone could not separate χ_1 from χ_(1/2).

### 10.2 The parts π_(1,σ)(φ, h) and PS_(1,σ)(w(φ), h)

For σ ∈ Σ_L define π_(1,σ)(φ, h) ⊆ π_1(φ, h) as the subrepresentation which is an extension of ⊕_(i, #I=i) C(I, s_(i,σ)) (fixed σ, all I) by π_alg(φ, h), and PS_(1,σ)(w(φ), h) ⊆ PS_1(w(φ), h) as the subrepresentation with constituents π_alg and C(w, s_(i,σ)), 1 ≤ i ≤ n − 1. Prove: PS_(1,σ)(w(φ), h) = PS_1(w(φ), h) ∩ ((Ind_B⁻ w(φ)ηz^(λ_σ))^(σ-an) ⊗_E L(λ^σ)) with λ_σ the σ-component of λ and λ^σ = (λ_τ)_(τ≠σ); C(I, s_(i,σ)) ≅ F^(GL_n)_(B⁻)(L⁻(−s_(i,σ)·λ_σ), w(φ)η) ⊗_E L(λ^σ) with the first factor inside (Ind_B⁻ w(φ)ηz^(s_(i,σ)·λ_σ))^(σ-an); π_(1,σ)(φ, h) is the unique quotient with socle π_alg of the amalgam of the PS_(1,σ)(w(φ), h), and it is the maximal g_(Σ∖σ)-algebraic subrepresentation of π_1(φ, h); for a P-filtration, π_(F_P,σ)(φ, h) := π_(F_P)(φ, h) ∩ π_(1,σ)(φ, h) is the maximal g_(Σ∖σ)-algebraic subrepresentation of π_(F_P) (Ding, §3.1.4, arXiv v2 pp. 48–49, and the paragraph before Proposition 3.19, p. 50). The proof route: L⁻(−s_(i,σ)·λ) = L⁻_σ(−s_(i,σ)·λ_σ) ⊠ ⊠_(τ≠σ) L⁻_τ(−λ_τ) with finite-dimensional factors for τ ≠ σ gives the tensor decomposition; the C(I, s_(i,τ)) with τ ≠ σ are not g_(Σ∖σ)-algebraic since their τ-component is infinite-dimensional.

API:

- PS_(1,σ)(w(φ), h) = PS_1(w(φ), h) ∩ ((Ind_B⁻ w(φ)ηz^(λ_σ))^(σ-an) ⊗_E L(λ^σ)), with constituents π_alg(φ, h) and the C(w, s_(i,σ)), 1 ≤ i ≤ n − 1.
- C(I, s_(i,σ)) ≅ F^(GL_n)_(B⁻)(L⁻(−s_(i,σ)·λ_σ), w(φ)η) ⊗_E L(λ^σ), the first factor lying in (Ind_B⁻ w(φ)ηz^(s_(i,σ)·λ_σ))^(σ-an).
- π_(1,σ)(φ, h) is the maximal g_(Σ∖σ)-algebraic subrepresentation of π_1(φ, h) and the unique quotient with socle π_alg(φ, h) of the amalgam of the PS_(1,σ)(w(φ), h); π_(F_P,σ)(φ, h) is the maximal g_(Σ∖σ)-algebraic subrepresentation of π_(F_P)(φ, h).

*Needs:* 10.1, 8.7, 9.3, 6.1, 6.6.

**Checks.**

- Degenerate case: for L = ℚ_p, π_(1,σ) = π_1 and PS_(1,σ) = PS_1.
- π_(1,σ)(φ, h) has length 1 + (2^n − 2) and PS_(1,σ)(w(φ), h) length n.
- Non-example: for d_L ≥ 2 and τ ≠ σ, C(I, s_(i,τ)) is not a constituent of π_(1,σ)(φ, h).
- π_1(φ, h) is the amalgamated sum over π_alg of the π_(1,σ)(φ, h), σ ∈ Σ_L: lengths 1 + d_L(2^n − 2) on both sides.

### 10.3 σ-analytic self-extensions of π_alg

Prove dim_E Ext¹_σ(π_alg(φ, h), π_alg(φ, h)) = n + 1, and that 8.8's ζ_w induces an isomorphism Hom_(σ,g′)(T(L), E) ≅ Ext¹_σ(π_alg, π_alg) (Ding, Lemma 3.15 and its proof, arXiv v2 pp. 48–49). The proof route: Ext¹_Z(π_alg, π_alg) ⊆ Ext¹_lalg ⊆ Ext¹_σ (1.10 (2)), giving 0 → Ext¹_Z → Ext¹_σ → Hom_σ(Z(L), E) → 0 and dimension (n − 1) + 2; ζ_w restricts injectively between spaces of equal dimension n + 1.

*Needs:* 10.1, 8.8, 1.10.

**Checks.**

- For n = 1: Ext¹_σ(χ, χ) = Hom_σ(L^×, E), of dimension 2.
- For L = ℚ_p: n + 1 = n + d_L, matching 8.8.
- For n = 2 and d_L = 2: Ext¹_σ has dimension 3 while Ext¹ has dimension 4.

### 10.4 Ext¹_σ(π_alg, PS_(1,σ)) is Hom_σ(T(L), E)

For w ∈ S_n prove that (3.10) induces an isomorphism Hom_σ(T(L), E) ≅ Ext¹_σ(π_alg(φ, h), PS_(1,σ)(w(φ), h)), both of dimension 2n; that the last map of 0 → Ext¹_σ(π_alg, π_alg) → Ext¹_σ(π_alg, PS_(1,σ)(w(φ), h)) → ⊕_(i=1)^(n−1) Ext¹_σ(π_alg, C(w, s_(i,σ))) is surjective; and that Ext¹_σ(π_alg, C(w, s_(i,σ))) = Ext¹(π_alg, C(w, s_(i,σ))) (Ding, Proposition 3.16, (3.31)–(3.32), its proof and Remark 3.17, arXiv v2 p. 49). The proof route: for ψ ∈ Hom_σ, I(w(φ)ηz^λ(1 + ψε)) lies in (Ind w(φ)ηz^(λ_σ)(1 + ψε))^(σ-an) ⊗ L(λ^σ) and is g_(Σ∖σ)-algebraic (7.2, 10.2), so (3.10) restricts, injectively by 8.11; dévissage bounds the target by (n + 1) + (n − 1) (10.3, 8.9), forcing bijectivity and the surjectivity.

*Needs:* 10.2, 10.3, 8.10, 8.11, 8.9, 7.2.

**Checks.**

- For n = 1: both sides are Hom_σ(L^×, E), of dimension 2 = 2n.
- For L = ℚ_p it is 8.11 (dimension 2n = n(1 + d_L)).
- For n = 3: dimension 6 = (3 + 1) + 2.

### 10.5 The σ-part of Ext¹(π_alg, π_1) and the decomposition over embeddings

Let Ext¹_σ(π_alg, π_1) and Ext¹_(σ,g′) be the images of Ext¹_σ(π_alg, π_(1,σ)) and of Ext¹_σ(π_alg, π_alg) under the injective push-forwards; Ext¹_(σ,g′) = Ext¹_g′ ∩ Ext¹_σ. Prove: (1) 0 → Ext¹_σ(π_alg, π_alg) → Ext¹_σ(π_alg, π_1) → ⊕_(i, #I=i) Ext¹(π_alg, C(I, s_(i,σ))) → 0 is exact, I over subsets of {1, …, n}, and dim_E Ext¹_σ(π_alg, π_1) = n + 2^n − 1; (2) t_(φ,h) restricts to a surjection ⊕_(w∈S_n) Hom_σ(T(L), E) ↠ Ext¹_σ(π_alg, π_1); (3) ⊕_(τ∈Σ_L) Ext¹_τ(π_alg, π_1) → Ext¹(π_alg, π_1) is surjective and induces ⊕_τ (Ext¹_τ/Ext¹_g) ≅ Ext¹/Ext¹_g, both of dimension (2^n − 1)d_L (Ding, the definitions before Proposition 3.18, Proposition 3.18, (3.33)–(3.35) and its proof, arXiv v2 pp. 49–50). The proof route: (1) as 8.12 with PS_(1,σ) and 10.4, dimension (n + 1) + (2^n − 2); (2) from 10.4 and covering by w; (3) by comparing 8.12 and (1): the C(I, s_(i,τ))-components of Ext¹/Ext¹_g′ are covered by Ext¹_τ, and Ext¹_g′/Ext¹_g = Hom(Z(L), E)/Hom_sm(Z(L), E) is spanned by the Hom_τ(Z(L), E).

*Needs:* 10.4, 8.12, 8.14, 10.2.

**Checks.**

- For L = ℚ_p the statements reduce to 8.12: n + 2^n − 1 = n + (2^n − 1)d_L.
- For n = 2 and d_L = 2: dim Ext¹_σ = 5 for each σ, dim Ext¹ = 2 + 3·2 = 8, dim Ext¹_g = 2, and (5 − 2) + (5 − 2) = 6 = 8 − 2.
- Degenerate case: for n = 1, Ext¹_σ(π_alg, π_1) = Hom_σ(L^×, E) of dimension 2 = n + 2^n − 1.

### 10.6 The σ-analytic theory is compatible with parabolic induction

Let Ext¹_(σ,F_P)(π_alg, π_1) be the image of Ext¹_σ(π_alg, π_(F_P,σ)); it equals Ext¹_σ(π_alg, π_1) ∩ Ext¹_(F_P)(π_alg, π_1). Prove: (1) dim_E Ext¹_(σ,F_P)(π_alg, π_1) = n + r + Σ_(i=1)^r (2^(n_i) − 2); (2) ζ_(F_P) induces an isomorphism ∏_i Ext¹_σ(π_alg(φ_(F_P,i), h^i), π_1(φ_(F_P,i), h^i)) ≅ Ext¹_(σ,F_P)(π_alg(φ, h), π_1(φ, h)), compatible with the weight maps on Hom_σ(T(L) ∩ L_(P,i)(L), E) for every w with T_w compatible with F_P (Ding, the paragraph before Proposition 3.19, Proposition 3.19, (3.36) and its proof, arXiv v2 pp. 50–51). The proof route: dévissage with 9.2 bounds the dimension by (n + 1) + (Σ(2^(n_i) − 2) + r − 1); ζ_(F_P) restricts injectively to σ-parts (9.6), with source of dimension Σ_i (n_i + 2^(n_i) − 1) = n + r + Σ(2^(n_i) − 2) by 10.5 (1) for each GL_(n_i).

*Needs:* 10.5, 9.6, 9.2, 10.2.

**Checks.**

- For P = G: n + 1 + 2^n − 2 = n + 2^n − 1, which is 10.5 (1).
- For P = B: n + n + 0 = 2n, which is 10.4.
- For n = 3 and blocks (2, 1): 3 + 2 + 2 = 7.

### 10.7 σ-analytic amalgamation of the endpoint parabolics

Assume n ≥ 2. With F and G as in 9.7, prove that there are natural exact sequences 0 → π_alg → π_(F,σ) ⊕ π_(G,σ) → π_(1,σ) → 0 and 0 → Ext¹_(σ,g′)(π_alg, π_1) → Ext¹_(σ,F)(π_alg, π_1) ⊕ Ext¹_(σ,G)(π_alg, π_1) → Ext¹_σ(π_alg, π_1) → 0 (Ding, Proposition 3.20 and (3.37), arXiv v2 p. 51). The proof route: intersect 9.7 with π_(1,σ); right exactness by dimensions: dim Ext¹_(σ,F) = dim Ext¹_(σ,G) = n + 2^(n−1) (10.6 with blocks of sizes n − 1 and 1), dim Ext¹_(σ,g′) = n + 1 (10.3), and 2(n + 2^(n−1)) − (n + 1) = n + 2^n − 1 (10.5).

*Needs:* 10.6, 9.7, 10.2, 10.3, 10.5.

**Checks.**

- For L = ℚ_p it is 9.7.
- For n = 2: dim Ext¹_(σ,F) = 4, dim Ext¹_(σ,g′) = 3, and 4 + 4 − 3 = 5 = n + 2^n − 1.
- Non-example: for n = 1 the endpoint parabolics do not exist and the statement is not made.

### Examples

- For n = 2 and L = ℚ_p(√p): for each of the two embeddings σ, π_(1,σ) has length 3 and Ext¹_σ(π_alg, π_1) dimension 5; Ext¹(π_alg, π_1) has dimension 8 and modulo the 2-dimensional Ext¹_g decomposes as 3 + 3.

### Dependencies

Layers 0, 1, 4–9; ReductiveGroups Layers 1 and 2.

## Downstream consumers

- **PadicHodgeParametersInLocallyAnalyticRepresentations** takes its locally analytic inputs from here: admissible representations, the anti-equivalence, Ext groups, Ext¹ as extensions, dual-number self-extensions, tautological and universal extensions and completed external tensor products (1.2–1.9, 0.9); π_alg(φ, h), PS(w(φ), h), its constituents and socles, the C(I, s_(i,σ)), PS_1, π_1, π(φ, h), the lines Ext¹(π_alg, C(I, s)), the self-extensions and Ext¹(π_alg, π_1) (8.2–8.9, 8.12, 8.13); the maps ζ_w, Ext¹(π_alg, PS_1) and the filtration Ext¹_g ⊆ Ext¹_g′ ⊆ Ext¹_w (8.10, 8.11, 8.14); the parabolic structure (9.1–9.7, 7.2, 0.9, 1.5); the σ-analytic theory (10.1–10.7); and the closed induction and the adjunctions of Emerton and Breuil (7.2, 7.4, 7.6).
- **PadicFamiliesPartII** takes λ-smooth solid representations (3.5), integrable LB representations of a Lie algebra (3.10), highest-weight theory and infinitesimal characters over E (4.1), the parabolic BGG categories (4.2) and Kostant homology (4.6).
- **TriangulineVarietyAndItsLocalModel** takes the locally analytic principal series, the Orlik–Strauch constituents and their Jordan–Hölder multiplicities (5.2, 6.1–6.6), very strong admissibility (2.2) and Breuil's adjunction (7.6).

## Worked examples

- **GL_2(ℚ_p), h = (1, 0).** λ = (1, 1), L(λ) = det, s·λ = (0, 2). For generic φ, PS(φ, h) = (Ind_B⁻ φηz^((1,1)))^an has socle π_alg = I_sm(φ) ⊗ det and cosocle C({1}, s) = F(L⁻((0, −2)), φη) = I_(B⁻)(z^((0,2))φη), the full induction of z^((0,2))φη because M⁻((0, −2)) is simple. π_1 = π(φ, h) is the amalgam of PS(φ, h) and PS(s(φ), h) over π_alg, of length 3. Ext¹(π_alg, π_alg) has dimension 3 (two smooth directions and log_p ∘ det), Ext¹(π_alg, C({i}, s)) is a line for i = 1, 2, Ext¹(π_alg, π_1) has dimension 5, and each ζ_w is injective with 4-dimensional image.
- **GL_3(ℚ_p).** π_1 has length 1 + 6 = 7, with labels {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}; PS_1(w(φ), h) has length 3; dim Ext¹(π_alg, π_1) = 3 + 7 = 10; the endpoint parabolics split the six labels as {1}, {2}, {1, 2} and {3}, {1, 3}, {2, 3}, and 2·(3 + 2 + 2) − 4 = 10.

## Source corrections

The following corrections are made to the sources at the places cited; each is forced by a computation recorded in a Check.

- Ding, the paragraph after Proposition 3.1 and Lemma 3.2 (arXiv v2 p. 37): the label of C(w, s_(i,σ)) is w⁻¹({1, …, i}), not w({1, …, i}); Proposition 3.1(4) relates w and w′ in one coset W_iw, which preserves inverse images (8.5).
- Ding, (3.1), Lemma 3.2, (3.8)–(3.9) and the proof of Lemma 3.10: the inducing character is z^(+s_(i,σ)·λ)w(φ)η; the negative sign belongs to the category-O input L⁻(−s_(i,σ)·λ). The positive sign of §3.1.4 is consistent (8.5, 8.6).
- Ding, Lemma 3.2(1): Hom is over the torus T(L), not T(ℚ_p) (8.6).
- Ding, (3.12), (3.15) and (3.33): the index set is I ⊆ {1, …, n} with #I = i, not I ⊆ {1, …, n − 1}; only the full index set gives the stated dimensions (8.12, 10.5).
- Ding, the case n_i = 1 before Lemma 3.10: the positional weight index is k = n_1 + ⋯ + n_(i−1) + 1, and the smooth factor is the character in gr^i F_P (9.1).
- Ding, the construction between (3.25) and (3.26): the first graded piece of the tensor filtration is ⊕_i B_i ⊠ ⊗̂_(j≠i) A_j (9.5).
- Ding, the two inductions in the last paragraph of §3.1.3: they are from P⁻_(n−1) (Levi GL_(n−1) × GL_1) and P⁻_1 (Levi GL_1 × GL_(n−1)) (9.7).
- Ding, proof of Proposition 3.3(2), arXiv v2 pp. 39–40: the intertwining relation is 𝒥_(w_1) = 𝒥_(w_2) ∘ (w_2w_1⁻¹), with w_2w_1⁻¹ the permutation ∏_i Spec H_(w_1⁻¹(i)) → ∏_i Spec H_(w_2⁻¹(i)) defined there; the printed composite of that permutation after 𝒥_(w_1) is not defined, since 𝒥_(w_1) takes values in Spec H (8.8, gap:ordered-character-map).
- Ding, (3.28) and Remark 3.17: C(w, s_(i,σ)), with first argument the permutation; and the amalgam descriptions use π_alg(φ, h) and π_1(φ, h), indexed by h (8.7, 10.4, 10.6).
- Ding, proof of Proposition 3.1(2)–(3): the cited full-faithfulness theorem of Orlik is locally L-analytic with trivial smooth argument; (3) is proved here from the radical layers of the Verma module, exactness and socles (8.4).
- Schraen, Proposition 4.7(2): the spectral sequence of the proof gives Ext^n_(G,λ)(F_λ ⊗ W_1, F_λ ⊗ W_2) ≅ Ext^n_∞(W_1, W_2) for n ≤ 2; concentration in the least nonvanishing degree holds only when smooth Ext is concentrated in one degree (1.10).
- Boxer–Calegari–Gee–Pilloni, §2.2.27: evaluation at e is on O_(𝔾_r) ⊗ V at the radius r of the analytic vectors being defined (3.8).
- Dospinescu–Le Bras, Lemme 5.10, is stated without proof; 0.8 gives the route.
- Orlik–Strauch, §2.5, the paragraph after Example 2.7, p. 8: their coefficient field K is a finite extension of ℚ_p (notation and conventions, p. 4), not algebraically closed. With O^p defined by their conditions (1)–(3) alone, the module ℚ_3[t]/(t² − 3) of 𝔤 = Lie(𝔾_m) over ℚ_3 is a finite-dimensional semisimple object of O^g but not of O, so the stated inclusion O^p ⊆ O fails. O^p must also require the Cartan subalgebra to act diagonalisably with eigenvalues in K, as 4.2 does; then O^p ⊆ O, and O^g consists of the finite-dimensional modules with K-valued weights, not of all finite-dimensional semisimple modules. Semisimplicity alone is not split semisimplicity (4.2).
- Breuil, socle I, Corollary 2.7, p. 12: the recovery of (M_1, π_(Q_1)) from F^G_(Q_1)(M_1, π_(Q_1)) needs nonzero smooth arguments; with π_(Q_1) = π_(Q_2) = 0 both sides vanish for any simple M_1, M_2, and the proof reads the highest weight of M_i off H^0(n, F′) ≅ Ev⁺_i ⊗ π′_(Q_i), which is then zero (6.4).
- Emerton, Jacquet I, Theorem 0.6, p. 778: an irreducible very strongly admissible V with J_P(V) ≠ 0 is a quotient of I_P⁻^G(U) for a finite-dimensional U over the coefficient field (Emerton, Jacquet II, Corollary 0.14), but in general not a subquotient of the induction of a character over that field; the character exists after a finite extension of scalars, and U is its restriction of scalars (7.5).

## References

- [ST02] P. Schneider, J. Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL_2*, J. Amer. Math. Soc. 15 (2002), 443–468; arXiv:math/9912073v1, cited by its numbering and arXiv pages.
- [ST03] P. Schneider, J. Teitelbaum, *Algebras of p-adic distributions and admissible representations*, Invent. Math. 153 (2003), 145–196; arXiv:math/0206056v1.
- [ST02B] P. Schneider, J. Teitelbaum, *Banach space representations and Iwasawa theory*, Israel J. Math. 127 (2002), 359–380; arXiv:math/0005066v1.
- [ST01] P. Schneider, J. Teitelbaum, *U(g)-finite locally analytic representations*, Represent. Theory 5 (2001), 111–128; arXiv:math/0005072v1.
- [EM17] M. Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, Mem. Amer. Math. Soc. 248 (2017), no. 1175; author's copy.
- [EMJ1] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Ann. Sci. École Norm. Sup. (4) 39 (2006), 775–839.
- [EMJ2] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups II. The relation to parabolic induction*, preprint, author's copy.
- [OS15] S. Orlik, M. Strauch, *On Jordan–Hölder series of some locally analytic representations*, J. Amer. Math. Soc. 28 (2015), 99–157; arXiv:1001.0323v4.
- [OS10] S. Orlik, M. Strauch, *On the irreducibility of locally analytic principal series representations*, Represent. Theory 14 (2010), 713–746; arXiv:math/0612809.
- [OR19] S. Orlik, *On some properties of the functors F^G_P from Lie algebra to locally analytic representations*, arXiv:1802.07514v2.
- [BR16] C. Breuil, *Vers le socle localement analytique pour GL_n I*, Ann. Inst. Fourier 66 (2016), 633–685; author's copy.
- [BR15] C. Breuil, *Vers le socle localement analytique pour GL_n II*, Math. Ann. 361 (2015), 741–785; author's copy.
- [BR19] C. Breuil, *Ext¹ localement analytique et compatibilité local-global*, Amer. J. Math. 141 (2019), 611–703; author's copy.
- [SCH11] B. Schraen, *Représentations localement analytiques de GL_3(ℚ_p)*, Ann. Sci. École Norm. Sup. (4) 44 (2011), 43–145.
- [DING25] Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025); arXiv:2407.21237v2, whose theorem and equation numbering in §3.1 agrees with the published version, cited by arXiv v2 pages.
- [DING19] Y. Ding, *Simple L-invariants for GL_n*, Trans. Amer. Math. Soc. 372 (2019), 7993–8042; arXiv:1807.10862v2.
- [BH20] C. Breuil, F. Herzig, *Towards the finite slope part for GL_n*, Int. Math. Res. Not. IMRN 2020, 10495–10552; arXiv:1806.02695v3.
- [BHS19] C. Breuil, E. Hellmann, B. Schraen, *A local model for the trianguline variety and applications*, Publ. Math. IHÉS 130 (2019), 299–412.
- [DLB17] G. Dospinescu, A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; arXiv:1509.00606v2.
- [BCGP25] G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1.
- [RJRC22] J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations of p-adic Lie groups*, Represent. Theory 26 (2022), 962–1024; arXiv:2110.11916v2.
- [PAN22] L. Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), e7; arXiv:2008.07099v3.
- [CD14] P. Colmez, G. Dospinescu, *Complétés universels de représentations de GL_2(ℚ_p)*, Algebra Number Theory 8 (2014), 1447–1519; arXiv:1301.7647v1.
- [CEGGPS] A. Caraiani, M. Emerton, T. Gee, D. Geraghty, V. Paškūnas, S. W. Shin, *Patching and the p-adic local Langlands correspondence*, Camb. J. Math. 4 (2016); arXiv:1310.0831v5.
- [BZ77] I. N. Bernstein, A. V. Zelevinsky, *Induced representations of reductive p-adic groups. I*, Ann. Sci. École Norm. Sup. (4) 10 (1977), 441–472.
- [SCHN11] P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011 (cited by locator).
- [NFA02] P. Schneider, *Nonarchimedean Functional Analysis*, Springer Monographs in Mathematics, 2002 (cited by locator).
- [HUM08] J. E. Humphreys, *Representations of Semisimple Lie Algebras in the BGG Category O*, Graduate Studies in Mathematics 94, AMS, 2008 (cited by locator).
- [STACKS] The Stacks Project, Tag 079H.
