# Roadmap: Springer resolutions and characteristic cycles

**Summary.** Build the Grothendieck simultaneous resolution and its double incidence components from split reductive groups, flag quotients and algebraic vector bundles. Prove that the incidence scheme is a reduced local complete intersection, that its components are geometrically Cohen–Macaulay and normal, and that their Cartan maps are flat. Compare the supplied Springer geometry over general characteristic-zero fields and reductive groups, and construct its double-incidence conormals, algebraic D-modules and flag localisation that identify the Verma, simple and component cycle bases. The end theorems are the partial-flag saturation of simple cycles, the zero-operator tangent bound and the completed Kazhdan–Lusztig cycle identity. This README is the roadmap. None of its headline theorems is statable against the pinned Mathlib and Tau Ceti, so [Suggested.lean](Suggested.lean) declares nothing; its docstring records, headline by headline, which carrier is missing.

## Scope and ownership

This roadmap owns the Grothendieck simultaneous and double incidence schemes, their Weyl-labelled closures, normality and Cartan geometry; the field and reductive-centre comparisons of the supplied Springer geometry; the algebraic D-module, filtration, holonomic and localisation theory used by their cycles; and the integral cycle comparisons and their completions. Its generic constructions apply to every smooth separated finite-type characteristic-zero scheme, rather than only flag varieties. Flags and associated bundles retain their natural base-change interfaces in every characteristic. The component regularity results have the explicit characteristic hypotheses below; those hypotheses do not restrict the foundational carriers or replace the positive-characteristic theory used to prove them.

- ReductiveGroups Layers 2–3 and 7–9 own Lie algebras and adjoint actions, parabolic quotients, root data, standard parabolics, Bruhat decomposition, central isogenies and integral Chevalley models. Layers 10A–10B own the actual torus-character lattice, rational highest-weight modules and their integration/differentiation interface; Layers 11C–11D own the complex regular-semisimple quotient and cameral comparisons. The flag and orbit comparisons in Layer 1 specialize those objects; the residual Lie contract concerns their additional field/characteristic and Borel-cover comparisons.
- ShimuraData §3.8 owns the smooth projective scheme Par_t(G) of parabolics of a given type of a reductive group scheme, with its identification with G/P; §§3.14–3.16 own the integral Bruhat cells C_w≅A^ℓ(w), the Schubert closures and their closure order. Section 1.1 consumes the Borel type as the flag scheme F, and §1.2 proves only its dimension and geometric integrality. GroupSchemesOverABase GS8.5 constructs the multiplicative Grothendieck–Springer space G̃⊂G×Bor(G); the additive simultaneous resolution g̃⊂F×g of Layer 2 is a different object and is owned here.
- RepresentationTheory/LieHighestWeight Layers 3–4, 7 and 9 own enveloping algebras, semisimple Verma and simple modules, finite-dimensional highest weights, central characters and reductive decomposition. The extension here fixes the scalar action of the centre and the algebraic principal category O. Neither finite-dimensional semisimple classification nor Harish–Chandra theory is rebuilt.
- SchubertGeometry S1 and S2.3 own the root-cell and subword/closure interfaces for split reductive flags. Section 1.4 compares their closures with diagonal relative-position orbits, transporting the opposite-Borel convention.
- AffineMorseLefschetz A4.0–A4.1 own Borel–Moore homology of locally finite polyhedra and compatible semialgebraic triangulations; ComplexComparisonPartII §C-1.1 owns scheme analytification. Section 11.1 uses them for top Borel–Moore classes of the complex Steinberg variety.
- TypeAHeckeAlgebras H1 owns the finite type-A Hecke algebra and its T_w basis. Section 11.3 constructs the Hecke algebra of an arbitrary finite Weyl group and its Kazhdan–Lusztig basis, and compares it with H1 on type-A factors; no second type-A carrier is introduced. Section 11.3 also owns the principal-block multiplicity theorem m_(w,v)=P_(w₀w,w₀v)(1) and the two comparisons its route uses: the de Rham comparison for strongly B-equivariant regular holonomic D_F-modules, whose strata are the finitely many Schubert cells, and the Kazhdan–Lusztig computation of the stalks of the intersection complexes of Schubert varieties. ComplexComparisonPartII C5.6 supplies Deligne's Riemann–Hilbert equivalence for regular singular connections, and EtaleDualityAndPerverseSheaves §§3.5 and 5.3 supply the étale–analytic comparison and the purity of intermediate extensions; the general regular holonomic Riemann–Hilbert correspondence on arbitrary smooth varieties is not part of this roadmap.
- NilpotentOrbits N1, N5.0 and N7 own the complex adjoint semisimple nilpotent cone, its reduced quotient-ideal scheme, Springer incidence resolution, cotangent identification and scheme fibres. Sections 6.1–6.3 here compare those objects over arbitrary characteristic-zero fields and split reductive groups, preserving their maps; the double-incidence and conormal comparisons are additional targets.
- FormalConnectionsOpers F4.3 owns characteristic-zero coaction-invariant Chevalley restriction, polynomial generators with central factors, field descent and unique regular-nilpotent Borels. Section 6.1 uses these exports. ComplexComparisonPartII C5.1 owns ordinary algebraic differential operators (the order predicate and its laws), all-order principal parts with their universal property and their localization and sheafification on schemes; FormalConnectionsOpers F2.2 supplies, on that carrier, symbols, the Lie–Rinehart enveloping algebra with filtered PBW and the smooth characteristic-zero comparison gr D_Y≅Sym T_Y. Layer 8 consumes both and owns its coherent D-module categories, good filtrations and characteristic cycles.
- AlgebraicVectorBundles L0A–L2B owns sheaf tensor, dual, symmetric algebras, relative Spec and geometric total spaces. Associated-bundle linear, subbundle and incidence comparisons use these constructions and the contract below; SchemeAndStackFoundations §§1.1 and 1.16 own quasi-coherent descent and geometric contracted products with base change. Mathlib supplies scheme pullbacks, ordinary symmetric algebras, module length, finite-support sums and adic completion. Tau Ceti supplies finitely presented sheaves and the sheaf tensor/dual substrate.
- SchemeAndStackFoundations §§0.2, 0.4, 0.7–0.9, 0.16–0.21, 0.30, 1.1, 2.6, 2.18 and 5.1 owns modules over relative spectra, coherent extension, dimension, spreading, CM and Serre conditions, excellence, normal schemes, descent, coherent cohomology, ordinary derived quasi-coherent operations and dimension-graded cycles. The finite-type dimension grading is consumed from §5.1. Layer 7 identifies its finite component basis and extends the component-support subgroup to arbitrary Noetherian finite-dimensional schemes, including completed local spectra.
- PadicLocalLanglandsForGL2Qp §0.5 owns affine generic-length module cycles on Spec A, their exact additivity and quotient comparison; DeformationAndDerivedPatchingAlgebra §6.7 reuses that carrier by definitional abbreviation and supplies its own applications. Layer 7 glues the affine construction on schemes and identifies the Springer support; it does not redefine the affine cycle. DeformationAndDerivedPatchingAlgebra §§1.13–1.15 supply finite-module completion and §1.16 supplies maps on local completions and their flatness. EnhancedDerivedSheaves §§0.1–0.4 and E1.3–E1.4 owns generic derived sheaf enhancement and functor coherence; Layer 9 owns the D-specific transfer and filtered homological results.

Analytic or completed category O, Galois representations, trianguline spaces, general Springer representations and rational-equivalence quotients are outside the scope. The strict algebraic category O, its integrability and its KL multiplicities are placed in §§10.4, 12.1 and 11.3, respectively, so localisation and the cycle identities have a single direction of supply. The root-wall and Lie-invariant comparisons needed by the geometry are specified as supplier contracts, not inferred from the existence of root data.

## Conventions

Let k be a field, G a split connected reductive k-group, B a Borel, T⊂B a split maximal torus, and U its unipotent radical. Lower-case fraktur letters in formulas are written g, b, t, u for their Lie algebras. Positive roots are those of u. Put F=G/B, N=dim U, r=dim T, D=r+2N. Put W=N_G(T)/T, with identity e, longest element w₀, length ℓ and Bruhat order ≤. Every quotient on test schemes is an fppf sheaf quotient; a represented flag need only lift to G locally.

The characteristic hypothesis for Layers 2–5 is char(k)=0 or char(k)=p>h, where h is the largest Coxeter number of a simple factor, with h=0 for a torus. This is the explicit bound of BHS19 §2.1, p. 309 (BHS19 line 458), not a definition of good characteristic. The constructions in Layers 1–3 make sense without that bound; each structural conclusion uses the hypotheses of its proof. Layers 6–14 use characteristic zero, except the general cycle and completion constructions, which state their own field-independent hypotheses. Geometric properties mean after every field extension; proofs may pass to an algebraic closure and descend. The torus and the trivial group are included.

Associated bundles use (g,x)∼(gb,Ad(b⁻¹)x); for λ∈X*(T) the line bundle of weight λ is L_B(λ)=G×ᴮk_λ with (g,x)∼(gb,λ(b)⁻¹x). With positive roots those of u, L_B(λ) is ample exactly when −λ is regular dominant; for SL₂, L_B(ρ)=O(−1). The second Cartan coordinate on X_w is w⁻¹ times the first. Fix a nondegenerate invariant symmetric form when identifying adjoint with coadjoint geometry; on a reductive centre choose a nondegenerate form separately. Cotangent incidence uses (−ψ,ψ), so the diagonal moment map is zero. The symbol of a derivation has positive order one. D-modules are left modules with quasi-coherent underlying O-module; coherence means locally finite over D. Cohomological shifts use Hⁱ(K[a])=Hⁱ⁺ᵃ(K). The normalized inverse image is f†=Lf*[dim source−dim target]; smooth abelian inverse image is Lf*, and closed inverse image of codimension c is Li*[−c].

The algebraic weight lattice is X*(T) for the specified isogeny form of G, mapped to t* by differentiation in characteristic zero. Distinguish it as a notion from X*(G) and from the full abstract weight lattice of the semisimple Lie algebra; these lattices can coincide in particular cases. The functional ρ is half the positive-root sum, with zero central component; it need not belong to X*(T), although −wρ−ρ does. The dot action is w·λ=w(λ+ρ)−ρ, and M_w=M(ww₀·0)=M(−wρ−ρ), with simple quotient L_w. The reduction U_χ₀ uses the actual central character of the trivial representation, not its generalized eigenspace. Ordinary D_F has Beilinson–Bernstein twisting parameter ρ. Cycle coefficients are integers obtained from finite generic lengths; reduction of a support never reduces the module used to compute its coefficient. Empty support contributes the zero cycle. All sheaves, schemes and small sites use a fixed universe and their native category universes; no large quotient is disguised as a type in the same universe.

**Checks.**

- For SL₂, N=r=1 and D=3; F=P¹, dim B=2, dim T*F=2. With B upper triangular, [g,x]↦x·ge₁ is well defined on G×ᴮk_ρ because b acts on e₁ by ρ(b), so L_B(ρ) is the tautological bundle O(−1); the opposite convention would give O(1). For the trivial group all four dimensions are zero; for a rank-r torus N=0 and D=r.
- In GL₃ let w cyclically send e₁↦e₂↦e₃↦e₁ and let z=diag(1,2,4). Then κ₁=z and κ₂=diag(2,4,1)=w⁻¹z, whereas wz=diag(4,1,2). This also tests the convention on the nonabelian Weyl group S₃.
- On A¹, the covector pair (−a dx,a dx) has moment sum zero; (a dx,a dx) has sum 2a dx. The two Springer factors have dimension 4 for SL₂, while the two Grothendieck factors have dimension 6.
- For i:{0}→A¹, δ=D/Dx has basis ∂ʲδ, with x∂ʲδ=−j∂ʲ⁻¹δ. Thus Tor₀=δ/xδ=0, Tor₁=ker x=kδ, and Li*δ[−1]=k in degree zero. For the identity map the shift is zero.
- For SL₂, w=e gives weight −2ρ and w=s gives 0. With row/column order e,s, the KL multiplicity matrix is ((1,0),(1,1)); the unprefixed polynomial indices give the wrong off-diagonal entry.
- For k[ε]/ε², the structure module has length 2, its residue field has length 1, and the exact sequence with ideal (ε) gives 2=1+1. A zero module gives coefficient 0; an infinite length is never converted to an integer by a total-function default.

## Exact supplier contracts

### From Mathlib

Use `AlgebraicGeometry.Scheme` in Mathlib/AlgebraicGeometry/Scheme.lean and `CategoryTheory.Limits.pullback` in Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean, with the scheme pullback instances in Mathlib/AlgebraicGeometry/Pullbacks.lean. These provide schemes and categorical fibre products with actual stalks; a pullback alone supplies no reducedness or dimension assertion. `AlgebraicGeometry.AlgebraicCycle` in Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44 is a locally finitely supported function on scheme points. Its definition imposes neither a dimension grading nor rational equivalence.

Use `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` in Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372 for a proper locally quasi-finite scheme morphism.

Use `Module.length` and `Module.length_eq_add_of_exact` in Mathlib/RingTheory/Length.lean:30,168. Length takes values in extended naturals; the second statement assumes an injective first map, a surjective second map and `Function.Exact`. `Finsupp` and `Finsupp.linearCombination` supply the finite free additive carrier and evaluation of its integer linear combinations. `AdicCompletion` in Mathlib/RingTheory/AdicCompletion/Basic.lean is the compatible quotient inverse limit, not a sheaf or D-module completion theorem. `LinearMap.ker` and `Module.finrank` supply fixed subspaces and their finite-dimensional dimensions. `SymmetricAlgebra` supplies the ordinary symmetric algebra. `SheafOfModules` and `DerivedCategory` provide module sheaves and ordinary derived-category carriers under their own sheafification and derived-category hypotheses; neither supplies D-transfer or holonomic duality.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` in TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48 for the full subcategory of finitely presented scheme modules. On the locally Noetherian schemes here it models coherent O-modules; it does not model coherent D-modules. The tensor, internal Hom and finite locally free dual constructions in TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/ and the scheme specialization TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean supply the ordinary sheaf substrate. The native `TauCeti.VermaModule` in TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195 is used with its characteristic-zero Killing-semisimple, finite-dimensional, split Cartan and chosen root-base hypotheses. It is not a general split reductive category O carrier. Use `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg` and `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple` in TauCeti/Algebra/Lie/HighestWeight/Integrable.lean:118,154: for a finite-dimensional Lie algebra with nondegenerate Killing form over a characteristic-zero field, a splitting Cartan subalgebra and a chosen base, an irreducible module with a highest-weight vector of weight λ and a simple root α with λ(α∨)=n∈ℕ, every element of the −α root space acts locally nilpotently, and the module is locally finite over the sl₂-triple of α. Neither statement assumes dominance at the other simple roots, and neither gives the converse, the reductive case or the algebraic integration of §12.1. Integer component sums use the Mathlib carrier, including its negative coefficients.

The Bruhat order ≤ on W is `CoxeterSystem.BruhatLE` in TauCeti/GroupTheory/Coxeter/Bruhat.lean, the reflexive transitive closure of the reflection edges that raise length, packaged as the partial order `CoxeterSystem.bruhatPartialOrder`; `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq` is its subword characterization for a reduced word. The length ℓ is Mathlib's `CoxeterSystem.length` in Mathlib/GroupTheory/Coxeter/Length.lean. The Coxeter system on W=N_G(T)/T is the one attached to the based root datum of ReductiveGroups Layer 7. The native split reductive groups are the objects of `TauCeti.ReductiveCommHopfAlgCat` (TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean), commutative Hopf algebras over a field whose geometric fibre is smooth, connected and reductive; a Borel subgroup is a Hopf ideal satisfying `TauCeti.HopfIdeal.IsBorel` (TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean). The fppf quotient G/B of §1.1 is `CommHopfAlgCat.fppfHomogeneousQuotient` (TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean), the fppf sheafification of A↦G(A)/B(A); that declaration asserts no representability, which is the ShimuraData §3.8 input below.

### From TauCetiRoadmap.ReductiveGroups

Layers 2, 3, 7, 8 and 9 supply, respectively, the Lie/adjoint dictionary, quotient and torsor interfaces, split roots and Bruhat decomposition, central isogenies, and pinned Chevalley–Demazure models. Layers 10A–10B supply rational T-weight labels, integration with its toral and root-action equations, and split dominant highest-weight modules with field descent and characteristic-zero simplicity. Layers 11C–11D supply the complex regular-semisimple centralizer and cameral quotient. The root-subgroup and flag comparisons retain the specified B and T after base change. Layer 7's decomposition is not alone a scheme-theoretic Schubert closure-order theorem.

What ReductiveGroups must provide (gap:lie-invariants): For split connected reductive G over a field of characteristic zero or p>h, supply the arbitrary-field Lie Jordan and centralizer-dimension comparisons needed in §§2.2–2.3, the regular-semisimple Borel W-torsor and quasi-finiteness of the regular-Borel morphism; supply invariant symmetric forms and Lie/flag comparisons under central isogenies of invertible degree, the rank-one centralizer/root-vector regularity on a single root wall used in §5.3 in the same characteristic range.

The extension is in the ReductiveGroups, Part II direction. This contract concerns algebraic groups over fields, distinct from the local-field building and parahoric direction of ReductiveGroupsPartII. The root-wall input is used in §5.3; the characteristic-zero invariant quotient in §6.1 uses FormalConnectionsOpers F4.3. Neither consumes Springer normality.

### From TauCetiRoadmap.ShimuraData

Section 3.8 supplies, for a reductive group scheme over a base S and an étale-locally constant parabolic type t, the smooth proper S-scheme Par_t(G) representing parabolic subgroup schemes of type t, projective when S is affine, with its universal parabolic, arbitrary base change and the orbit-map identification G/P≅Par_t(G) for P of type t. Over the field k and the Borel type this is the flag scheme F of §1.1, smooth and projective over k. Sections 3.14–3.16 supply, for the split pinned ℤ-model of ReductiveGroups Layer 9, the Bruhat cells C_w≅A^ℓ(w) in the flag scheme, their base change, the scheme-theoretic Schubert closures and the closure order v≤w. ShimuraData uses the left-coset quotient P\G; transport by inversion g↦g⁻¹, which exchanges P\G and G/P and sends the cell indexed by w to the cell indexed by w⁻¹.

### From TauCetiRoadmap.AlgebraicVectorBundles

L0A supplies monoidal sheaf operations; L0B–L0C supply finite locally free duals and symmetric/exterior powers; L1A–L1B supply relative Spec and affine comparison; L2A–L2B supply geometric total spaces, with Tot(E)=Spec Sym(E∨), and their linear morphisms and pullbacks. The associated Lie bundles in §§2.1 and 6.2 use these finite locally free carriers.

What AlgebraicVectorBundles must provide (gap:associated-bundle-descent): For a flat affine group scheme H over S₀, a representable fpqc H-torsor P→S and a finite locally free H-representation V over S₀, compare the total space of its descended module with the geometric contracted product P×ᴴTot(V) supplied by SchemeAndStackFoundations §1.16, preserving the inverse-action descent datum, linear maps, tensor and dual structure and arbitrary base change; compare invariant locally direct summands and their incidence embeddings, including integral Chevalley Borel Lie bundles, using the descent equivalence of §1.1.

**Checks.**

- On the right frame torsor of O_(P¹)(1), with right action by composition, the relation (p,v)∼(pg,g⁻¹v) for weight 1 gives O(1), of degree 1; the linear and geometric constructions must identify the evaluation map [p,v]↦p(v).
- The dual weight −1 on that same torsor gives O(−1), of degree −1; reversing the inverse-action convention would exchange these two bundles.
- Weight 0 gives O, of degree 0; on a trivial torsor a rank-a representation gives O^a, including rank 0, and base change preserves those ranks.

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §0.2 for `relativeSpec_modulesEquiv`, the module equivalence over a relative spectrum, §0.4 for extension of coherent submodules, §0.7 for local dimensions and finite-type dimension formulas, §§0.8–0.9 for spreading and field descent, §§0.16–0.18 for catenarity, depth, CM and Serre conditions, §§0.19–0.21 for CM loci, excellence and regular-map preservation of reducedness/normality, §§0.30 and 4.13 for normal-scheme comparisons and Serre normality, §1.1 for quasi-coherent fpqc descent, §1.16 for geometric contracted products and arbitrary base change, §4.11 for the theorem that a finite modification of a normal integral scheme is an isomorphism, §2.6 for quasi-coherent cohomology and Serre vanishing, §2.18 for ordinary derived quasi-coherent operations, and §5.1 for dimension-graded cycles before rational equivalence. At finite type over a field its top-degree subgroup is the finite free group on top-dimensional components; the completed local schemes instead use the affine module-cycle grading of PadicLocalLanglandsForGL2Qp §0.5.

What SchemeAndStackFoundations must provide (gap:local-geometric-comparisons): For a reduced pure d-dimensional finite-type k-scheme Y, a closed point x and each irreducible component C through x, prove that the completion of O_(C,x) is equidimensional of dimension d, and compare the generic-length cycles of the component quotient and its completed branches with the scheme cycles; use excellence for reducedness of the completed quotient, and retain the specified component ideals and maps in the scheme-to-affine and completed-local cycle comparisons.

Use §0.17 for CM plus generic reducedness through the R₀ and S₁ criterion, §0.21 for reduced/normal preservation under the regular completion map, and §4.13 for Serre normality. DeformationAndDerivedPatchingAlgebra §§3.3–3.4 supplies local miracle flatness and the regular-sequence criterion. In its ring specialization, the local map R→S has R regular, S CM and dim S=dim R+dim(S/m_RS). The gap concerns the additional scheme and equidimensional-completion comparisons, with no inference of geometric reducedness from a merely reduced base.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Section 6.7's module cycle is a definitional abbreviation of the PadicLocalLanglandsForGL2Qp §0.5 cycle and is not consumed as a second carrier. Sections 3.3–3.4 supply local module miracle flatness and regular-sequence/CI criteria; §§1.13–1.15 supply finite-module completion/flatness, and §1.16 supplies the induced maps on maximal-adic local completions, their flatness for flat local maps and their completed closed-fibre comparison; the coefficient ring, ideal and actual comparison maps remain fixed. These affine inputs are glued in §7.2 and applied to completed local rings in Layer 14; the intrinsic dimension of a surviving localization is not silently identified with its dimension in the original global scheme.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

Section 0.5 supplies, for Noetherian A, finite M and dim Supp M≤d, the generic-length module cycle on Mathlib's cycle carrier of Spec A, with coefficient length_(A_𝔭)(M_𝔭) at each d-dimensional support prime: its finite support, exact additivity under the common bound d, vanishing below d, closed-immersion quotient comparison, and the localization comparison that keeps dimensions measured in the ambient Spec A. Section 7.2 glues this affine cycle on schemes, and the completed local schemes of Layer 14 use its grading.

### From TauCetiRoadmap.SchubertGeometry

Use S1 and S2.3 for the root-cell dictionary, proper reduced-word maps and subword/Bruhat closure criterion. Its standard cells use the opposite Borel; transport the chosen positive-Borel flags by opposition before applying the criterion in §1.4.

### From TauCetiRoadmap.AffineMorseLefschetz

A4.0 supplies Borel–Moore homology with local coefficients from locally finite chains on locally finite polyhedra and smooth manifolds, its proper pushforward and open restriction, the comparison H_j(X,A)≅H_j^BM(X∖A) for a compact triangulated pair, and the locally finite fundamental cycle of an oriented manifold. A4.1 supplies finite triangulations of a compact semialgebraic set compatible with finitely many semialgebraic subsets, closed subsets being subcomplexes. Section 11.1 uses these for the complex Steinberg variety; fundamental classes of singular complex components and the top-degree basis are targets of §11.1.

### From TauCetiRoadmap.ComplexComparisonPartII

Section C-1.1 supplies scheme analytification of finite-type complex schemes, with complex points, open restrictions and fibre products. Section 11.1 uses it to pass from the Steinberg scheme over C to its complex points; no analytic coherent comparison is consumed.

Section C5.6 supplies Deligne's Riemann–Hilbert equivalence between regular singular algebraic connections on a smooth complex variety and local systems on its analytification. Section 11.3 applies it on each Schubert cell, where the strongly B-equivariant connections are trivial.

Section C5.1 supplies the sheaf of order-filtered algebraic differential operators via iterated commutators over arbitrary commutative bases: the order predicate (order zero is O-linearity, and order at most m+1 means every commutator with a function has order at most m), its additivity, monotonicity and composition-order laws, the all-order modules of principal parts with their universal property, and localization, restriction and gluing on schemes. These operators are relative k-linear operators; an O-linear endomorphism is only an order-zero operator. Sections 8.1–8.2 consume this sheaf; no analytification is used.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Section 3.5 supplies the comparison of constructible ℓ-adic complexes on a finite-type ℂ-scheme with constructible complexes on its complex points, through a chosen field isomorphism ℂ≅Q̄_ℓ. Section 5.3 supplies the purity of intermediate extensions: for an affine locally closed immersion j over a finite field and a pure perverse sheaf F₀ of weight w, j_!*F₀ is pure of weight w, and IC of an irreducible d-dimensional variety is pure of weight d. Section 11.3 uses both, on Schubert varieties over finite fields and their spread-out complex fibres, to compute the stalks of the Schubert intersection complexes. No decomposition theorem is consumed.

### From TauCetiRoadmap.TypeAHeckeAlgebras

H1 supplies the finite type-A Hecke algebra H_n(q) over a commutative ring R with a unit q, presented by T₁,…,T_(n−1) with (T_i−q)(T_i+q⁻¹)=0 and the braid relations, its basis (T_w) indexed by S_n, rank n! and the q=±1 group-algebra comparisons. Section 11.3 uses it on type-A factors with R=Z[v,v⁻¹] and q=v.

### From TauCetiRoadmap.NilpotentOrbits

N1 supplies the complex adjoint semisimple cone as the actual zero-fibre scheme, its nilradical incidence bundle and projection. N5.0 supplies reducedness and the complete-intersection quotient ideal. N7 supplies the cotangent isomorphism with its moment projection, proper birational Springer map and scheme fibres. The adapters in §§6.1–6.3 identify their characteristic-zero field extensions and split reductive central factors with these same objects after matching the invariant form; they retain the closed ideals and maps, including on nonreduced test algebras.

### From TauCetiRoadmap.FormalConnectionsOpers

F4.3 supplies coaction-invariant Chevalley restriction, homogeneous polynomial generators, central affine factors, characteristic-zero field descent and the unique Borel containing a regular nilpotent. These are inputs to §§6.1–6.2; no new invariant-theory contract is requested for them.

F2.2 consumes the ordinary operator sheaf of ComplexComparisonPartII C5.1 and supplies on it the symbol of an operator of order at most m, the Lie–Rinehart enveloping algebra with its filtered PBW when the Lie module is projective, and gr D_Y≅Sym T_Y for smooth characteristic-zero Y. Sections 8.1–8.2 use the C5.1 operator sheaf with these F2.2 structures to construct the coherent D-module category and prove its filtered Noetherian and cotangent-sheaf comparisons. No connection/jet or recursive operator carrier is duplicated.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections 0.1–0.4 and E1.3–E1.4 supply ringed-site derived categories, noncommutative additive K-injective models and coherent functor comparisons. The ordinary tensor and symmetric monoidal part assumes commutative coefficients. SchemeAndStackFoundations §2.18 supplies the scheme quasi-coherent comparison. The transfer bimodules of §9.1 are noncommutative coefficients, so their tensor–Hom comparison requires the following extension.

What EnhancedDerivedSheaves must provide (gap:derived-bimodule-sheaves): Supply associative-ring sheaf bimodule derived tensor, internal Hom and pushforward with their actions, associativity, adjunction, restriction and affine comparisons compatible with additive K-injective models and bounded coherent D-module transfer.

### From TauCetiRoadmap.RepresentationTheory/LieHighestWeight

Layers 3, 4 and 7 supply PBW and semisimple Verma/simple modules, finite-dimensional highest weights and Harish–Chandra central characters with the dot shift. Layer 9 supplies reductive decomposition and the central scalar parameter. The native semisimple Verma carrier is retained on the derived summand. Section 10.4 here forms the fixed-central-action extension and its strict algebraic category O; §10.1 compares the supplied rational highest-weight actions with the D-affinity projection and §12.1 proves parabolic integrability; §11.3 proves its multiplicity theorem. None of those inputs depends on the resulting Springer cycle formula.

## How to read the build

Layers 1–3 give flags, simultaneous resolution and double incidence. Layer 4 establishes component CM and Cartan flatness, including the integral and scaling argument; Layer 5 uses their codimension-one boundary to prove normality. Layers 6–7 identify nilpotent incidence with conormal geometry and supply its integral cycle coordinates. Layer 8 develops algebraic differential operators independently of Layers 2–5 until the cycle comparison, and Layer 9 builds holonomic operations and equivariance. Layer 10 gives flag localisation and the elementary strict principal category. Layer 11 combines Verma cycles, simple triangularity and the KL multiplicity theorem, which it proves through the de Rham comparison on F and the Schubert stalk theorem; Layer 12 gives the partial-flag saturation of simple cycles. Layer 13 uses the geometry and normality, independently of KL, for formal labels and the zero-operator tangent estimate. Layer 14 combines completion with Layer 11. A target's needs below specify its statement and one proof route, rather than imposing every target of an unrelated layer.

## Layer 1: Flag schemes and relative position

### 1.1 The flag scheme

Let G, B and T be as in the conventions. Let F be the flag scheme, the Borel-type parabolic scheme of ShimuraData §3.8; through the orbit map gB↦gBg⁻¹ it represents the fppf quotient of G by B, the sheaf `CommHopfAlgCat.fppfHomogeneousQuotient` of G and the Hopf ideal of B. The quotient map G→F is a right B-torsor, and its functor of points is the sheafification of S↦G(S)/B(S), rather than the naive quotient on every S. Fix the base flag eB and the left G-action. (BHS19, §2.1, p. 310 (BHS19 lines 470–488)).

Prove that G→F is a B-torsor, that the left action descends, and that an S-point of F is the same as a B-reduction of the trivial G-torsor over S. The representing scheme is the ShimuraData input; no representability theorem is proved a second time.

One proof route is as follows. Compose the orbit-map identification of ShimuraData §3.8 with the universal property of the fppf quotient sheaf; identify the universal B-torsor and descend the left action. Keep the fppf sheaf quotient in the universal property: points over a test scheme need only lift to G locally.

The construction has the following API.

- G→F is the universal B-invariant morphism to an fppf sheaf.
- G×B→G×_F G, (g,b)↦(g,gb), is an isomorphism.
- Left multiplication descends and commutes with extension of the ground field.
- An S-point is a B-reduction of the trivial G-torsor; it is locally represented by gB.

**Checks.**

- For G=T and B=T, F=Spec k.
- For SL₂ with upper triangular B, F≅P¹ and eB corresponds to the line ke₁.
- For GL₃, points are a line inside a plane in k³; choosing only a line loses one flag parameter.
- Computed values for torus; SL₂; GL₃: F=point; F=P¹ with eB=ke₁; full flags have dimension 3, line-only space dimension 2.

*Needs:* ShimuraData §3.8; ReductiveGroups Layer 3; ReductiveGroups Layer 7; Tau Ceti `CommHopfAlgCat.fppfHomogeneousQuotient`; Mathlib `AlgebraicGeometry.Scheme`; SchemeAndStackFoundations §1.1.

### 1.2 Dimension and geometric integrality of the flag variety

Let G, B and T be as in the conventions. The flag scheme F, smooth and projective over k by ShimuraData §3.8, is geometrically integral of dimension N=dim U; moreover D=dim G=r+2N and dim B=r+N, where r=dim T. These equalities persist after extension of k. (BHS19, §2.1, p. 310 (BHS19 lines 470–488)).

The root count requires no restriction on the characteristic; this subsection is valid for a split connected reductive group over any field.

One proof route is as follows. The big cell of ShimuraData §3.14, transported from the left-coset quotient by inversion, is a dense open subscheme of F isomorphic to A^N; its translates by representatives in N_G(T)(k) of the elements of W cover F. Smoothness and geometric connectedness of G make F smooth and geometrically connected, hence geometrically integral. The root decomposition g=t⊕u⊕u⁻ with dim u=dim u⁻=N gives the dimensions.

**Checks.**

- For SL₂, F=P¹ has dimension 1, B has dimension 2 and G has dimension 3; for a torus F is a point and D=r.
- Computed values for trivial group; SL₂: (N,r,D,dim B)=(0,0,0,0); (1,1,3,2).
- For GL₃, N=3, r=3, D=9 and dim B=6; F is the full flag variety of k³, of dimension 3, while the projective plane of lines, of dimension 2, is the partial flag variety G/P and fails the formula dim F=N.

*Needs:* §1.1; ShimuraData §§3.8 and 3.14; ReductiveGroups Layer 7; SchemeAndStackFoundations §0.7.

### 1.3 Relative position orbits

Let G, B and T be as in the conventions. For w∈W=N_G(T)/T, choose a representative ŵ and let U_w⊂F×F be the diagonal G-orbit of (eB,ŵB), with its locally closed reduced orbit scheme. Define Ū_w as its reduced closed closure. These constructions are independent of ŵ. (BHS19, §2.1, p. 310; Lemma 2.2.4, pp. 312–313 (BHS19 lines 470–474 and 565–574)).

The quotient and orbit construction is valid over any field. Its points are compared after fppf lifting, rather than by assuming rational representatives exist over every test scheme.

One proof route is as follows. Identify the orbit with G/(B∩ŵBŵ⁻¹) and descend its orbit map. Take the reduced closure in F×F and use the Bruhat decomposition to identify its support.

The construction has the following API.

- (g₁B,g₂B) lies in U_w iff g₁⁻¹g₂∈BŵB, after a field extension splitting the points.
- Replacing ŵ by tŵ or ŵt, t∈T, gives the same orbit scheme.
- The diagonal G-action preserves U_w and Ū_w.
- U_w→Ū_w→F×F are respectively open and closed immersions.

**Checks.**

- U_e is the diagonal F⊂F×F.
- For SL₂, U_s consists of pairs of distinct lines, and Ū_s=P¹×P¹.
- For a torus W={e}, the sole orbit and its closure are Spec k.
- Computed values for SL₂ equal flags; distinct flags; torus: U_e=diagonal; U_s=distinct pairs with closure P¹×P¹; sole orbit=point.

*Needs:* §1.1; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 1.4 Dimensions and closures of the Bruhat orbits

Let G, B and T be as in the conventions. The U_w are smooth geometrically integral, dim U_w=N+ℓ(w), and F×F is their disjoint stratification. The support of Ū_w is the union of U_v for v≤w in Bruhat order. In particular Ū_w is geometrically integral and U_w is its dense smooth open stratum. (BHS19, §2.1, p. 310 (BHS19 lines 473–474) for smoothness and dimension; proof of Lemma 2.2.4, p. 313 (BHS19 line 574) for the closure order; SchubertGeometry S2 item 3 for the subword criterion).

One proof route is as follows. The stabilizer has Lie algebra t⊕(u∩Ad(ŵ)u) of dimension r+N−ℓ(w); its root-subgroup description gives smoothness. Pull back along G→F in the first coordinate; the second coordinate becomes the usual Bruhat stratification of F. Use SchubertGeometry S1 and S2.3 after the opposition comparison for its Borel convention, then descend the statements through the torsor.

**Checks.**

- For SL₂, U_e is the one-dimensional diagonal and U_s the two-dimensional distinct-pair open; only the latter closure is all P¹×P¹.
- Computed values for SL₂ e,s; torus: orbit dimensions 1+0=1, 1+1=2; 0+0=0, with e≤s.

*Needs:* SchubertGeometry S1 and S2.3; §1.3; §1.2; ReductiveGroups Layer 7.

### 1.5 Intersection of subvector bundles

Let Y be reduced and locally of finite type over a field, E a finite-rank vector bundle, and E₁,E₂ subvector bundles (locally direct summands). If dim(E₁,y∩E₂,y)=a for every closed y∈Y, their scheme theoretic intersection in E is a vector subbundle of rank a, with fibre the intersection of the two fibres. No assertion is made over a nonreduced base. (BHS19, Lemma 2.2.2, p. 312 (BHS19 line 534)).

Here Y and the bundles are arbitrary as specified in the statement; the reductive-group and characteristic conventions impose no additional hypotheses. The kernel presentation is E₁→E/E₂ and the constant-rank comparison is compatible with every base change once this kernel is a subbundle.

One proof route is as follows. Locally identify the intersection with ker(E₁⊕E₂→E), (x,y)↦x−y. Constant fibre ranks at closed points give constant ranks everywhere because finite-type schemes over a field are Jacobson. Minors that vanish at every closed point vanish on the reduced base. On the open where a maximal nonzero minor is invertible, row and column operations split the map into an identity block and zero block; the kernel is locally free and a direct summand.

**Checks.**

- Over k[ε]/ε², the summands spanned by (1,0) and (1,ε) in the free rank-two module have one-dimensional intersection on the closed fibre, but their actual intersection is (ε)(1,0), not a rank-one direct summand. The reduced-base hypothesis must reject this case.
- Computed values for two coordinate lines; equal lines; dual-number base: ranks 0,1; over k[ε]/ε² the actual intersection is (ε)e₁, fibre intersection ke₁, hence not a direct summand.
- Over Spec k, E₁=ke₁ and E₂=ke₂ inside k² have intersection 0 of rank 0; choosing their sum gives rank 2 and fails the fibre law.
- For E₁=E₂=ke₁⊂k² the intersection is ke₁, rank 1; a zero-kernel substitute fails this case.

*Needs:* SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13; Mathlib `LinearMap.ker`.

### Examples

For SL₂ with upper triangular B the flag scheme is P¹ with base point the line ke₁. The diagonal orbit U_e is the diagonal of P¹×P¹, of dimension 1, and U_s is the open set of pairs of distinct lines, of dimension 2, with closure P¹×P¹. Over k[ε]/ε² the summands spanned by (1,0) and (1,ε) meet in (ε)e₁, which is not a direct summand; this is why §1.5 assumes a reduced base.

### Dependencies

ShimuraData §§3.8 and 3.14; SchubertGeometry S1 and S2.3; Tau Ceti `CommHopfAlgCat.fppfHomogeneousQuotient`; Mathlib `AlgebraicGeometry.Scheme`; Mathlib `LinearMap.ker`; ReductiveGroups Layer 3; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 1.1, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 2: The Grothendieck simultaneous resolution

### 2.1 The Grothendieck simultaneous resolution

Assume the reductive-group and characteristic hypotheses of the conventions. Define g̃=G×ᴮb using (g,x)∼(gb,Ad(b⁻¹)x). Identify it with the closed incidence scheme {(gB,ψ)∈F×g:Ad(g⁻¹)ψ∈b}. The bundle projection is p:g̃→F, and q:g̃→g sends (gB,ψ) to ψ. (BHS19, §2.1, formulas (2.1)–(2.2), p. 310 (BHS19 line 465)).

One proof route is as follows. Descend the B-representation b along G→F using the existing vector-bundle theory. The inclusion b→g descends to a subbundle of F×g, and (g,x)↦(gB,Ad(g)x) gives the incidence comparison. Define q by the ambient projection and prove the formula independently of the torsor representative.

The construction has the following API.

- G×ᴮb≅g̃ as vector bundles over F.
- An S-point is a flag with a Lie-algebra section lying in its Borel subalgebra, interpreted by torsor descent.
- q([g,x])=Ad(g)x; p([g,x])=gB.
- The fibre of p at gB is Ad(g)b, a vector space of dimension dim B.
- The incidence and associated-bundle presentations commute with every field extension.

**Checks.**

- For a torus F is a point, g̃=t and q=id.
- For GL₂, an incidence point is a line L⊂k² and a matrix preserving L; p has rank 3.
- q⁻¹(0)=F scheme theoretically, whereas g̃ itself has dimension D.
- Computed values for torus; GL₂; ψ=0: q=id_t; bundle rank 3 and total dimension 4; zero fibre=P¹.

*Needs:* §1.1; ReductiveGroups Layer 2; §1.5; Mathlib `CategoryTheory.Limits.pullback`; AlgebraicVectorBundles L0B–L2B and the associated-bundle descent contract.

### 2.2 Regular and regular semisimple loci

Assume the reductive-group and characteristic hypotheses of the conventions. Use the reductive Lie-algebra Jordan decomposition. An element ψ is regular when its algebraic centralizer has dimension r. It is regular semisimple when it is both regular and semisimple. Write gʳᵉᵍ and gʳˢ for these open subschemes, and g̃ʳᵉᵍ,q⁻¹(gʳˢ) for their scheme inverse images. Set tʳᵉᵍ=t∩gʳˢ. (BHS19, §2.1, p. 310 (BHS19 line 465)).

One proof route is as follows. Express regularity by the minimal centralizer dimension and construct the corresponding open locus. Identify the semisimple regular locus by conjugating t minus the root hyperplanes; the Jordan-theory input and its characteristic bound are explicit.

The construction has the following API.

- ψ∈gʳᵉᵍ iff dim Z_G(ψ)=r.
- z∈tʳᵉᵍ iff α(z)≠0 for every root α.
- gʳˢ is an open subscheme of gʳᵉᵍ, not generally equal to it.
- Membership is geometric and the open loci commute with field extension.

**Checks.**

- For a torus every Lie-algebra element is regular semisimple.
- For SL₂ in characteristic different from 2, the nonzero nilpotent matrix E₁₂ is regular and is not semisimple.
- For SL₂, zero is not regular, whereas diag(a,−a) is regular semisimple when a≠0.
- Computed values for SL₂ E₁₂; zero; diag(1,−1): centralizer dimensions 1,3,1; regularities yes,no,yes; semisimple no,yes,yes.

*Needs:* ReductiveGroups Layer 2; ReductiveGroups Layer 7; §2.1.

### 2.3 Properness and the regular covering

Assume the reductive-group and characteristic hypotheses of the conventions. The scheme g̃ is smooth and geometrically integral of dimension D. The map q is proper and surjective; q⁻¹(gʳᵉᵍ)→gʳᵉᵍ is quasi-finite (hence finite), and q⁻¹(gʳˢ)→gʳˢ is finite étale of constant degree |W|. (BHS19, Proposition 2.1.1, pp. 310–311 (BHS19 line 465)).

One proof route is as follows. Smoothness and dimension follow from the bundle of rank dim B over F. Closed incidence in F×g gives properness. Every geometric Lie-algebra element is contained in a Borel subalgebra; this proves surjectivity. The regular-element Borel-finiteness theorem gives quasi-finiteness. Over a regular semisimple element the Borels containing its centralizer torus form the W-torsor; root-coordinate differentials prove étaleness. The Lie-invariant supplier contract provides these exact centralizer comparisons.

**Checks.**

- For SL₂, the regular semisimple fibre has two flags, while a regular nonzero nilpotent has one geometric flag. The latter statement is not a claim of étaleness there; q is ramified and is not birational.
- Computed values for torus; SL₂ generic semisimple; regular nilpotent: degrees 1,2; one geometric flag at E₁₂ with ramification, so generic degree 2 is not birational.

*Needs:* Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; §2.1; §1.2; §2.2; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### Examples

For SL₂ the Grothendieck resolution g̃ is the rank-two bundle over P¹ of pairs of a line and a traceless matrix preserving it, of dimension 3. Over diag(1,−1) the fibre of q is the two eigenlines, over the regular nilpotent E₁₂ it is the single line ke₁ with ramification, and over 0 it is all of P¹; so q has generic degree 2=|W| and is not birational.

### Dependencies

Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; AlgebraicVectorBundles L0B–L2B and the associated-bundle descent contract; Mathlib `CategoryTheory.Limits.pullback`; ReductiveGroups Layer 2; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 3: Double incidence and its components

### 3.1 The double incidence scheme

Assume the reductive-group and characteristic hypotheses of the conventions. Define X=g̃×_g g̃ using q on each side, with pr₁,pr₂:X→g̃ and π=(p∘pr₁,p∘pr₂):X→F×F. Its closed incidence presentation is triples (F₁,F₂,ψ) with ψ in both Borel Lie subalgebras. The common operator map is q∘pr₁=q∘pr₂. (BHS19, §2.2, formulas (2.3)–(2.4), p. 311 (BHS19 line 500)).

One proof route is as follows. Use the native Scheme pullback and its universal property, with both arrows equal to q. Compare its functor of points with simultaneous membership in the two descended subbundles. Define π from the two flag projections.

The construction has the following API.

- Two maps to g̃ with equal composite to g lift uniquely to X.
- pr_i records the i-th flag together with the common ψ; π records both flags.
- Swapping the two copies of g̃ is an involution and exchanges pr₁ and pr₂.
- The categorical pullback agrees with the two incidence conditions in F×F×g.

**Checks.**

- For a torus X=t, not t×t.
- The fibre at ψ=0 is F×F, not the diagonal.
- For GL₂ and distinct coordinate lines, the operator fibre consists of diagonal matrices and has dimension 2.
- Computed values for torus; zero operator; GL₂ coordinate lines: X=t; operator-zero fibre F×F; common preserving matrices diag(a,b), dimension 2.

*Needs:* §2.1; Mathlib `CategoryTheory.Limits.pullback`; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 3.2 The two Cartan projections

Assume the reductive-group and characteristic hypotheses of the conventions. The B-equivariant quotient b→b/u≅t, where B acts trivially on the target, defines κ:g̃→t. Put κ_i=κ∘pr_i. On a represented triple, κ_i is the image of Ad(g_i⁻¹)ψ in b/u, using the fixed B⊃T identification. Keep κ_i distinct from pr_i. (BHS19, §2.2, formula (2.5), p. 311 (BHS19 line 500)).

One proof route is as follows. Descend the quotient map b→t along the B-torsor. Compose with pr_i, check the displayed formula after an fppf trivialisation, and descend equality of maps.

The construction has the following API.

- κ_i(g₁B,g₂B,ψ)=Ad(g_i⁻¹)ψ mod u.
- Changing either Borel representative does not change the corresponding toral class.
- κ_i is linear in ψ and satisfies κ_i(aψ)=aκ_i(ψ).
- The swap involution exchanges κ₁ and κ₂.

**Checks.**

- For a torus κ₁=κ₂=id_t.
- For GL₂, flags ke₁,ke₂ and ψ=diag(a,b) give κ₁=(a,b), κ₂=(b,a).
- For coincident standard flags and ψ∈u, both Cartan coordinates are zero.
- Computed values for torus; GL₂ diag(a,b); nilpotent upper triangle: κ₁=κ₂=id; κ₁=(a,b), κ₂=(b,a); both coordinates 0 on u.

*Needs:* §3.1; ReductiveGroups Layer 2; ReductiveGroups Layer 7.

### 3.3 Incidence strata

Assume the reductive-group and characteristic hypotheses of the conventions. Define V_w=X×_(F×F)U_w, with its scheme inverse-image structure. It is locally closed in X, and π_w:V_w→U_w is the restricted flag projection. Do not substitute the zero-Cartan stratum V′_w. (BHS19, §2.2, p. 311 (BHS19 line 500)).

One proof route is as follows. Base change the locally closed immersion U_w→F×F along π. Transport the incidence conditions to the stabilizer model over the orbit.

The construction has the following API.

- A triple belongs to V_w iff its two flags have relative position w.
- Over (gB,gŵB), the operator fibre is Ad(g)(b∩Ad(ŵ)b).
- The V_w give a disjoint finite stratification of X.
- Scaling ψ and the diagonal G-action preserve every V_w.

**Checks.**

- V_e consists of equal flags with arbitrary operator in that Borel.
- For SL₂ opposite flags, the fibre is t of dimension 1, not u.
- For every w, V_w contains the zero-operator section U_w.
- Computed values for SL₂ e,s; zero section: fibre b has dimension 2; fibre t dimension 1; every U_w contains its zero section.

*Needs:* §3.1; §1.3; Mathlib `CategoryTheory.Limits.pullback`.

### 3.4 The incidence bundle over a Bruhat orbit

Assume the reductive-group and characteristic hypotheses of the conventions. π_w:V_w→U_w is a vector bundle of rank dim B−ℓ(w)=r+N−ℓ(w). Its fibre over (gB,gŵB) is Ad(g)(t⊕(u∩Ad(ŵ)u)). Thus V_w is smooth geometrically integral of dimension D for every w. (BHS19, Proposition 2.2.1, pp. 311–312, formulas (2.6)–(2.7) (BHS19 line 500)).

One proof route is as follows. Inside the trivial g-bundle on F×F intersect the two Borel subbundles. Use the root decomposition to compute b∩Ad(ŵ)b=t⊕(u∩Ad(ŵ)u), with nilpotent intersection dimension N−ℓ(w). Apply the reduced-base constant-rank intersection theorem on U_w, then add base and fibre dimensions.

**Checks.**

- For SL₂, V_e has bundle rank 2 over the one-dimensional diagonal and V_s has rank 1 over a two-dimensional orbit; both total dimensions are 3.
- Computed values for SL₂ e,s; torus: 1+2=3, 2+1=3; rank r over point gives total r.

*Needs:* §3.3; §1.5; §1.4; ReductiveGroups Layer 7; §1.2.

### 3.5 The incidence components

Assume the reductive-group and characteristic hypotheses of the conventions. Define X_w as the reduced closed closure of V_w in X. Equivalently it is the scheme theoretic image of V_w→X because V_w is reduced. Write pr_i,w and κ_i,w for restrictions. The definition does not identify X_w with π⁻¹(Ū_w). (BHS19, Definition 2.2.3 and Lemma 2.2.4, pp. 312–313 (BHS19 line 534)).

One proof route is as follows. Use the ideal of functions vanishing on V_w; it is radical because the source is reduced. Form the closed subscheme and restrict every named projection. The dense open V_w determines it uniquely.

The construction has the following API.

- V_w→X_w is an open dense immersion.
- A closed reduced subscheme of X contains X_w iff it contains V_w.
- The set theoretic image π(X_w) is Ū_w.
- The maps pr_i,w, κ_i,w compose with X_w→X to the original maps.

**Checks.**

- X_e=V_e≅g̃, embedded with equal flags.
- For SL₂, X_s is not all of X, although Ū_s=F×F.
- X_e∩V_s is empty for SL₂, while X_s meets V_e at ψ=0.
- Computed values for SL₂ e,s: X_e=equal-flag resolution; X_s≠X; X_e∩V_s=∅ and X_s∩V_e contains zero operators.

*Needs:* §3.4; §3.1; §3.2; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 3.6 Bruhat support of a component

Assume the reductive-group and characteristic hypotheses of the conventions. π(X_w)=Ū_w as closed subsets, and X_w∩V_v≠∅ implies v≤w. The X_w are geometrically irreducible and no distinct X_w is contained in another. (BHS19, Lemma 2.2.4 and proof of Proposition 2.2.5, pp. 312–313 (BHS19 line 534)).

One proof route is as follows. The zero-operator section over U_w extends over its closure and lies in X_w, giving one image inclusion and surjectivity onto Ū_w. Continuity gives the other. All X_w have dimension D and dense pairwise disjoint V_w; containment would force equality and an intersection of these dense opens.

**Checks.**

- For SL₂, X_e misses V_s, while X_s meets V_e along nilpotent operators, including its zero section. The support order is v≤w, and X_s is not the whole inverse image of the largest orbit closure.
- Computed values for SL₂ e,s and zero sections: π(X_e)=diagonal; π(X_s)=P¹×P¹; nonempty intersections occur only at v≤w.

*Needs:* §3.5; §1.4; §3.4.

### 3.7 Local complete intersection of X

Assume the reductive-group and characteristic hypotheses of the conventions. The X_w, w∈W, are exactly the irreducible components of X; X is equidimensional of dimension D and is a local complete intersection over k, hence Cohen–Macaulay. This statement concerns X and does not yet prove CM for the separate reduced X_w. (BHS19, Proposition 2.2.5, p. 313 (BHS19 line 566)).

One proof route is as follows. The finite stratum decomposition shows the closures exhaust the components. X lies in the smooth scheme F×F×g of dimension D+2N. Each incidence condition is the vanishing of a section of the rank-N quotient of the Borel subbundle. Locally X is cut out by 2N equations with codimension 2N; the expected-codimension criterion in a regular local ring makes them a regular sequence. Import the general CI-to-CM theorem.

**Checks.**

- For SL₂ the smooth ambient F×F×g has dimension 5, the incidence equations have rank 2 and every component has dimension 3. The CM conclusion applies to X before it is proved for X_w.
- Computed values for SL₂; torus: ambient dimension 5 minus 2 equations=3; r minus 0 equations=r.

*Needs:* §3.5; §3.6; §3.4; §1.2; DeformationAndDerivedPatchingAlgebra §3.4 and SchemeAndStackFoundations §0.18; SchemeAndStackFoundations §§0.17–0.18.

### 3.8 Reducedness of X

Assume the reductive-group and characteristic hypotheses of the conventions. X is reduced. Its generic points lie above gʳˢ, and each reduced component X_w therefore agrees with its component scheme structure obtained from the generically reduced CM scheme X. (BHS19, Theorem 2.2.6(i), pp. 313–314 (BHS19 line 566)).

One proof route is as follows. A CM noetherian scheme has no embedded associated points, so generic reducedness suffices. For each V_w its restriction to regular semisimple ψ is nonempty and dense: take a regular toral element in its fibre. The fibre product of the finite étale regular semisimple covering is étale over its smooth base and hence reduced; it contains all generic points of X.

**Checks.**

- The finite étale regular-semisimple locus meets both SL₂ components and establishes generic reducedness. Reducedness of X must not be used to discard multiplicities of its Cartan fibres.
- Computed values for SL₂ regular semisimple; double structure special fibre: both components meet étale locus; k[t,x]/(x²−t) reduced but fibre t=0 has length 2.

*Needs:* §3.7; §2.3; §3.4; SchemeAndStackFoundations §0.17.

### 3.9 Birational projections of the components

Assume the reductive-group and characteristic hypotheses of the conventions. For i=1,2, pr_i,w:X_w→g̃ is proper birational and restricts to an isomorphism above g̃ʳᵉᵍ. In particular that inverse-image open of X_w is smooth. The full q is not asserted birational when W is nontrivial. (BHS19, Theorem 2.2.6(ii), pp. 313–314 (BHS19 line 566)).

One proof route is as follows. Properness is inherited from the base-changed proper q. Over gʳˢ, V_w gives the graph of the deck transformation labelled by w; hence degree one on each component. Over g̃ʳᵉᵍ, quasi-finiteness of q makes pr_i,w finite. The source open and the smooth target g̃ʳᵉᵍ are integral, and the proper projection is birational with generic degree one. Apply the native proper locally quasi-finite finiteness theorem and then the finite-modification isomorphism for a normal integral target (SchemeAndStackFoundations §4.11).

**Checks.**

- For the identity of a normal integral scheme, the finite modification has degree 1 and induces the identity on every local ring.

- For SL₂ each X_w→g̃ has degree one above the regular locus, although g̃→g has generic degree two. For a torus both projections are identities on t.
- Computed values for SL₂ e,s; torus: component projection degrees 1,1 over regular locus versus q degree 2; torus identity degree 1.

*Needs:* Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; SchemeAndStackFoundations §4.11; §3.5; §2.3; §3.8; §3.6; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### Examples

For SL₂ the double incidence scheme X has two components of dimension 3: X_e≅g̃, of equal flags, and X_s. They meet along equal flags with nilpotent operator, including nonzero nilpotents, as the local equations of the worked SL₂ example show. Each pr_i,w has degree one over g̃ʳᵉᵍ, whereas q has degree 2.

### Dependencies

Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; SchemeAndStackFoundations §4.11; SchemeAndStackFoundations §§0.17–0.18; DeformationAndDerivedPatchingAlgebra §3.4 and SchemeAndStackFoundations §0.18; SchemeAndStackFoundations §0.17; Mathlib `CategoryTheory.Limits.pullback`; ReductiveGroups Layer 2; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 4: Cohen–Macaulay components and flat Cartan maps

### 4.1 Dimensions of Cartan fibres

Assume the reductive-group and characteristic hypotheses of the conventions. For each i∈{1,2}, κ_i:X→t and κ_i,w:X_w→t are surjective, and every geometric fibre of each is equidimensional of dimension D−r=2N. (BHS19, Lemma 2.3.1, pp. 314–315 (BHS19 line 606)).

One proof route is as follows. The dense stratum description gives surjectivity for X_w: its toral coordinate can be prescribed. At zero, the stratum over U_v has nilpotent-intersection fibre dimension N−ℓ(v), so every stratum in the zero fibre has dimension 2N. The dimension inequality for fibres supplies the matching lower bound for components of X_w. Use upper semicontinuity on X of the local fibre dimension x↦dim_x κ_i⁻¹(κ_i(x)). Its locus above 2N is closed and scaling-stable. Each scalar orbit extends to zero operator on the same flags, so a nonempty excess-dimension locus would meet the zero fibre, contradicting its stratum calculation. The lower bound on every component then proves equidimensionality. Apply the same argument to each scaling-stable X_w.

**Checks.**

- For a torus κ_i=id_t and fibres have dimension 0. For SL₂ both incidence components have every Cartan fibre of dimension 2, including the zero fibre with its possibly multiple components.
- Computed values for torus; SL₂ both labels: r−r=0; 3−1=2 for every Cartan fibre.

*Needs:* §3.2; §3.5; §3.4; §3.6; §1.2.

### 4.2 Bezrukavnikov–Riche Cohen–Macaulay theorem

Assume the reductive-group and characteristic hypotheses of the conventions. Over an algebraically closed field of characteristic p>h, for a semisimple simply connected split G, the reduced graph closures X_w are Cohen–Macaulay. In the integral model over Z_(p), formation of these closures commutes with the special fibre: X_A,w×F_p=X_Fp,w scheme theoretically. The BR coadjoint and inverse-index conventions are translated before applying this input. (BHS19, Proposition 2.3.3, pp. 315–316 (BHS19 line 645); BR12, Theorem 2.2.1, pp. 557–558; §2.10, pp. 570–571; Remark 2.11.1, p. 572 (BR12 line 950)).

The theorem includes the following D-independent convolution targets. On the coadjoint simultaneous resolution, for a reduced expression w=s₁⋯sₘ, construct the derived coherent convolution kernels and prove O_(X_s₁)⋆⋯⋆O_(X_sₘ)≅O_(X_w), with the dual convolution also concentrated in degree zero. The product is derived pullback/tensor followed by proper projection from its support: fix K⋆L=R(p₁₃)_*(Lp₁₂^*K⊗ᴸLp₂₃^*L) for kernels K, L on g̃×g̃ proper over each factor, with p_(ij) the projections of g̃×g̃×g̃, so that supports compose relative positions in reading order: a pair (x,y) of relative position u followed by (y,z) of relative position v composes to (x,z) of generic relative position uv when ℓ(uv)=ℓ(u)+ℓ(v). This is the opposite of BR's product, which pulls its second argument back by p₁₂ (BR12 lines 231–235): K⋆L here is BR's L⋆K. Since X_u is BR's Z_(u⁻¹), labelled by the orbit of u⁻¹ (BR12 lines 955–958), BR's identity for the reduced word sₘ⋯s₁ of w⁻¹ transports, after reversing the product, to the displayed identity in reading order. Establish the positive-characteristic localisation and cohomology vanishing used to show kernel concentration and global generation; then prove the expected-dimensional convolution intersection is CM and generically smooth, and its proper birational image is the reduced graph closure. These are proof targets here, not supplied by a bibliographic citation. The ordinary sheaf derived operations are supplied; the characteristic-p localisation is a separate construction, not the characteristic-zero theorem of Layer 10 (BR12 §§2.3–2.10, pp. 558–571, BR12 line 1029). Prove integral convolution/base-change compatibility over Z[1/h!] and then Z_(p), including flatness and the scheme equality of graph closures on the special fibre (BR12 §2.11, pp. 571–572, BR12 line 1586).

For the positive-characteristic localisation used in this route, construct crystalline differential operators on G/U and the B/U-invariant pushforward D̃ to F. Its Frobenius centre is the sheaf on g̃^(1)×_(t*^(1))t* defined by x↦x^p−x^[p]. In this paragraph ν∈X*(T) denotes the actual character of t⊂D̃: the fibre D̃⊗_(S(t))k_ν is the sheaf of twisted differential operators acting on L_B(ν), ν=0 gives the crystalline D_F, and tensoring with L_B(μ−ν) carries the ν-fibre to the μ-fibre (BR12 line 1114). Call ν regular when ⟨ν−ρ,α∨⟩∉pZ for every root α; this is BR's condition ⟨ν+ρ_BR,α∨⟩∉pZ (BR12 §2.4, p. 560, BR12 lines 1116–1118) transported through ρ_BR=−ρ, and its singular parameters lie on the reflection hyperplanes ⟨ν−ρ,α∨⟩∈pZ of the affine Weyl group for the shifted action w(ν−ρ)+ρ; ν=ρ, the half-canonical twist, is singular. Prove that D̃ is Azumaya and splits on the formal neighbourhood of B_χ^(1)×{ν} at every nilpotent p-character χ and regular ν. With a chosen normalized splitting bundle, prove RΓ and derived localisation are inverse equivalences DᵇCoh_(B_χ^(1))(g̃^(1))≃DᵇMod^fg_(ν,χ)(U(g)); the right side means generalized compatible Harish–Chandra and Frobenius central character (ν,χ). Use this ν consistently for the Frobenius/Harish–Chandra fibre, the splitting bundle and the localisation equivalence; it is neither the Beilinson–Bernstein parameter of Layer 10, where ordinary D_F has parameter ρ, nor a highest-weight label of §10.4. Here generalized reduction is part of this positive-characteristic theorem and is not the strict characteristic-zero category of Layer 10 (BR12 §§2.3–2.4, pp. 559–561, BR12 lines 1054, 1092 and 1119).

For each reduced word, let K_w be its convolution of simple graph structure sheaves and define K_w^∨=O_(X_sₘ)(ρ,αₘ−ρ)⋆⋯⋆O_(X_s₁)(ρ,α₁−ρ), where sᵢ=s_(αᵢ), the simple roots are those of u, and a twist (a,b) tensors by the pullbacks of L_B(a) and L_B(b) on the two flag factors. BR take positive roots in g/b, so for the same B their simple roots and ρ are the negatives of ours, while their line bundle of a character λ is L_B(λ), ample for λ regular dominant in their ordering; their twist (−ρ,ρ−α) therefore becomes (ρ,α−ρ) here, and reversing the product order turns BR's displayed factor order for the word sₘ⋯s₁ of w⁻¹ into the one displayed (BR12, §1.1, p. 538, BR12 lines 160–165, and Theorem 2.2.1, p. 557, BR12 lines 974–983). By the composition rule, K_w^∨ is supported on X_(w⁻¹). The swap σ of the two factors satisfies σ^*(K⋆L)=σ^*L⋆σ^*K and fixes each one-letter twisted kernel: O_(X_s)(ρ,α−ρ) and O_(X_s)(α−ρ,ρ) differ by the pullback of L_B(2ρ−α)⊠L_B(α−2ρ), which is trivial on Ū_s=G/B×_(G/P_s)G/B because ⟨2ρ−α,α∨⟩=0 makes L_B(2ρ−α) descend to G/P_s. Hence σ^*K_w^∨ is the same-order product O_(X_s₁)(ρ,α₁−ρ)⋆⋯⋆O_(X_sₘ)(ρ,αₘ−ρ), supported on X_w. Prove Hⁱ(K_w)=Hⁱ(K_w^∨)=0 for every i≠0. For f:g̃×g̃→g*×_(t*/W)t* induced by the second factor, prove the evaluation f* f_* K_w→K_w is surjective. These precise concentration and generation statements identify the kernel with the graph structure sheaf; their statements do not assume component CM (BR12 Proposition 2.6.7, p. 565, and Proposition 2.8.1, pp. 567–568, for concentration and generation; §2.10, p. 571, for the evaluation-map consequence, BR12 lines 1346 and 1575–1584).

One proof route is as follows. BR works with annihilators in g* and labels the orbit by w⁻¹. Use an invariant form in this characteristic range and replace w by w⁻¹ to compare the closures. Prove the structure-sheaf convolution identity by Bruhat induction using the positive-characteristic localisation, concentration and generation targets of this subsection. Use BR Remark 2.11.1 for the actual scheme special fibre; topological equality would not suffice.

The construction has the following API.

- The empty-word convolution kernel is the diagonal structure sheaf and acts as the identity; convolution is associative on the stated proper-support domains.
- The crystalline Frobenius-centre map sends x to x^p−x^[p] and retains the specified compatible Harish–Chandra character.
- The selected splitting bundle gives actual Morita unit and counit isomorphisms; changing the splitting is compared by its line-bundle twist rather than declared the same equivalence.
- The integral graph-closure structure sheaf is flat over Z_(p), and its special fibre is the indicated reduced graph-closure sheaf, with multiplicity one at its generic point.

**Checks.**

- For type A₁ in characteristic 5, h=2 and the input applies to both labels. Verify the scheme special fibre of the closure, rather than just equality of its underlying set.
- For SL₂, X_s is the total space of the line subbundle ℓ₁⊗ℓ₂≅L_B(ρ)⊠L_B(ρ)=O(−1,−1) of the trivial sl₂ bundle on P¹×P¹, through v₁⊗v₂↦(x↦v₁ω(v₂,x)+v₂ω(v₁,x)) with ω the symplectic form; so ω_(X_s) is the pullback of O(−2,−2)⊗O(1,1)=O(−1,−1). The twist (ρ,α−ρ)=(ρ,ρ) gives O(−1,−1), agreeing with it, whereas the untransported (−ρ,ρ−α) would give O(1,1).
- Computed values for A₁ at p=5; p=2; empty word: 5>h=2; 2>2 is false; identity kernel O_diagonal has depth=dimension=3.

- For SL₃ with s₁=(12), s₂=(23) and w=s₁s₂, the kernel O_(X_s₁)⋆O_(X_s₂) is supported over Ū_(s₁s₂): the pairs (gB,gs₁B) and (gs₁B,gs₁s₂B) compose to (gB,gs₁s₂B). In Cartan coordinates, z=diag(1,2,4) on the first factor gives s₁⁻¹z=diag(2,1,4) on the middle factor and (s₁s₂)⁻¹z=diag(2,4,1) on the third. BR's order of the same two factors would compose to Ū_(s₂s₁), with third coordinate diag(4,1,2), a different component. K_w^∨ is supported on X_(s₂s₁), and σ carries it to X_(s₁s₂). For SL₂ the two orders agree, so the rank-one Checks cannot detect the convention.
- For the one-variable Weyl relation over F₃, [∂³,x]=3∂²=0 and [∂,x³]=3x²=0; replacing the Frobenius centre by just the characteristic-zero scalar centre misses these operators.
- In type A₁ at p=3, ν=0 has ⟨ν−ρ,α∨⟩=−1 and is regular; ν=ρ has pairing 0 and is excluded: L_B(ρ)=O(−1) is a nonzero module over the ν=ρ twisted operators, with Frobenius character χ=0, and RΓ(P¹,O(−1))=0, so RΓ is not an equivalence there; ν=2ρ has pairing 1 and is regular, and ν=4ρ has pairing 3 and is excluded. The untransported condition ⟨ν+ρ,α∨⟩∉3Z would admit ν=ρ, with pairing 2, and exclude the regular ν=2ρ. For the empty word, both convolution-unit maps are the identity, whereas the zero kernel would act as zero.

*Needs:* §§1.1, 2.1 and 3.5; ReductiveGroups Layers 2, 7 and 9; SchemeAndStackFoundations §§2.18 and 2.22; EnhancedDerivedSheaves §§0.1–0.4; the Lie-invariant and associated-bundle contracts; the crystalline-operator and localisation constructions in this subsection.

### 4.3 Cohen–Macaulayness in the required generality

Assume the reductive-group and characteristic hypotheses of the conventions. For split connected reductive G and char(k)=0 or p>h, every X_w is geometrically Cohen–Macaulay. In characteristic zero, choose p>h and the split Chevalley model over A=Z_(p); the closure X_A,w is A-flat and has special fibre X_Fp,w. (BHS19, Proposition 2.3.3, pp. 315–316 (BHS19 line 645)).

Prove explicitly that the integral closure model is stable under scaling ψ, has the indicated scheme special fibre, and is torsion-free over A=Z_(p). At a hypothetical non-CM closed point of its generic fibre, choose a finite extension of Q and a DVR above p. Projectivity extends both flags; multiply ψ by a positive power of the uniformizer until its coordinates are integral. The resulting A-point still lies in the closed scaling-stable model. The closed complement of the CM locus then specializes into the CM special fibre, a contradiction. Flatness alone is insufficient: for A=Z_(p), the A-flat scheme Spec A ⊔ Spec(Q[x,y]/(x²,xy)) has CM special fibre Spec F_p but a generic component of depth 0 and dimension 1 (BHS19 proof of Proposition 2.3.3, p. 316, BHS19 line 685).

One proof route is as follows. After passing to an algebraic closure, replace G by G_der^sc×Z(G)° through a central isogeny of degree invertible in the stated range. Its differential and flag map identify the incidence components with the simply connected components times the central Lie-algebra factor. CM is preserved by this smooth affine factor. In characteristic zero define X_A,w as the closure of its generic stratum inside the Chevalley incidence model. Its coordinate rings are A-torsion-free, hence A-flat; use BR special-fibre compatibility. At special-fibre points, flatness over the DVR and the CM special fibre imply CM of the total space. For the remaining generic points use the open CM locus and the G_m-action: a hypothetical bad closed generic point is defined over a number field. Choose a DVR over p, extend both flags by projectivity, and multiply ψ by a sufficiently high power of its uniformizer to make the operator integral. The closed G_m-stable model then extends the scaled bad point into its special fibre. The closed non-CM locus would specialize to a non-CM special point, a contradiction. Use SchemeAndStackFoundations §§0.8–0.9, 0.19–0.21 for the CM locus, DVR extension and field descent.

**Checks.**

- The type A₁ test applies in characteristic 3 as well as characteristic zero, and the torus test is affine space t. The scaling argument must reach generic points outside an arbitrary initial neighbourhood of the special fibre.
- Computed values for A₁ at p=3; torus; flat disjoint-union counterexample: 3>2; depth t=r=dimension; generic bad component depth 0<1 while special fibre depth=dimension=0.

*Needs:* §4.2; ReductiveGroups Layer 7; ReductiveGroups Layer 9; SchemeAndStackFoundations §§0.7, 0.17–0.18; §3.5; ReductiveGroups Layer 8.

### 4.4 Flatness of the Cartan projections

Assume the reductive-group and characteristic hypotheses of the conventions. Each κ_i and κ_i,w is flat. Apply the local miracle-flatness theorem: for every local map O_t,κ(x)→O_Y,x, with Y=X or X_w, the source is regular, the target is CM and dim O_Y,x=dim O_t,κ(x)+dim O_(Y_κ(x)),x. The global fibre dimensions alone are not the flatness criterion for arbitrary noetherian schemes. (BHS19, Lemma 2.3.2, p. 315, with the local dimension hypothesis; Proposition 2.3.3, p. 316 (BHS19 line 645)).

One proof route is as follows. The maps are of finite type over k, source schemes are equidimensional, t is irreducible regular, and the fibre theorem gives all fibres equidimensional of dimension D−r. Use the finite-type dimension formula at each point to obtain the displayed local equality; then apply the imported local criterion with module M equal to the local ring. For X use CM from its lci theorem; for X_w use the BR transfer. The disconnected point-plus-line counterexample prevents applying the criterion outside these hypotheses.

**Checks.**

- For Y=Spec k ⊔ A¹→A¹, mapping the isolated point to 0 and the line identically, dim Y=dim A¹=1 and every fibre is pure dimension 0; nevertheless the isolated point is nonflat: global dimensions agree but the local equality fails at the isolated point. In the Cartan application check the equality at every local ring, including nonclosed points.
- Computed values for point plus line to A¹; torus; SL₂: at isolated point local dimensions 0 versus 1+0, so not flat; torus closed stalk r=r+0; SL₂ closed stalk 3=1+2.

*Needs:* §4.1; §4.3; §3.7; DeformationAndDerivedPatchingAlgebra §3.3.

### Examples

For SL₂ every Cartan fibre of X_e and of X_s has dimension 2=D−r, and both components are smooth, so the local equality 3=1+2 holds at every closed point and κ₁, κ₂ are flat. The disjoint union of a point and a line mapping to A¹ has equal global dimensions, fails the local equality at the isolated point, and is not flat there.

### Dependencies

DeformationAndDerivedPatchingAlgebra §3.3; EnhancedDerivedSheaves §§0.1–0.4; ReductiveGroups Layer 2; ReductiveGroups Layer 7; ReductiveGroups Layer 8; ReductiveGroups Layer 9; SchemeAndStackFoundations §§0.7, 0.17–0.18; SchemeAndStackFoundations §§2.18 and 2.22; the Lie-invariant and associated-bundle contracts; the crystalline-operator and localisation constructions of §4.2. Internal inputs are the precise subsections cited in each needs line.

## Layer 5: Normality of the incidence components

### 5.1 The Weyl relation between Cartan maps

Assume the reductive-group and characteristic hypotheses of the conventions. On X_w the morphisms to t satisfy κ₂,w=w⁻¹∘κ₁,w. In particular the two Cartan zero fibres on X_w are the same scheme. (BHS19, Lemma 2.3.4, pp. 316–317 (BHS19 line 681)).

One proof route is as follows. On V_w write the common element as Ad(g)(z+n), with n∈u∩Ad(ŵ)u; the second Borel representative is gŵ, so its toral coordinate is w⁻¹z. The two morphisms agree on the dense open V_w of the reduced integral X_w; separatedness of the affine target extends the equality.

**Checks.**

- For GL₃ and a three-cycle w, a generic diagonal z has second coordinate w⁻¹z; substituting wz is false. At zero the two coordinate ideals agree on X_w.
- Computed values for GL₃ 3-cycle on diag(1,2,4); zero: κ₂=(2,4,1)=w⁻¹κ₁, not (4,1,2); both zero ideals coincide.

*Needs:* §3.2; §3.5; §3.4.

### 5.2 Smooth Cartan and flag fibres

Assume the reductive-group and characteristic hypotheses of the conventions. The maps (π,κ_i):V_w→U_w×t are smooth surjective with geometrically irreducible affine-space fibres of dimension N−ℓ(w). For any v∈W, the inverse image of U_w×ker(v−id_t) is geometrically irreducible. (BHS19, Lemma 2.3.5, p. 317 (BHS19 line 724)).

One proof route is as follows. The quotient t⊕(u∩Ad(ŵ)u)→t is surjective with kernel dimension N−ℓ(w). Descend this vector-bundle calculation over the orbit. The restriction over the linear subspace has an irreducible smooth base and geometrically irreducible affine-space fibres; local bundle trivialisations give integrality.

**Checks.**

- For SL₂ the maps on V_e have affine-line fibres and those on V_s have point fibres. Restriction to the zero toral subspace must still be geometrically irreducible.
- Computed values for SL₂ e,s; zero subspace: fibre dimensions 1−0=1, 1−1=0; restriction to {0} has same irreducible affine fibres.

*Needs:* §3.4; §5.1; Mathlib `LinearMap.ker`.

### 5.3 Regular points over a single root wall

Assume the reductive-group and characteristic hypotheses of the conventions. Over an algebraic closure, let s_α be a Weyl reflection and v∈W with ℓ(s_αv)>ℓ(v). In the incidence stratum V_v there are regular elements with κ₁ in ker(s_α−id), and they form a nonempty open subset of its inverse image. More precisely choose z on the α-wall and on no distinct root wall, and 0≠c∈k; z+c e_β is regular for the sign β of α lying in the positive roots with v⁻¹β positive. (BHS19, Proof of Theorem 2.3.6, pp. 318–319 (BHS19 line 761)).

For a torus there is no reflection and this quantified assertion has no instance; normality is supplied by the smooth affine t case, not by selecting a nonexistent root.

One proof route is as follows. The length inequality places the indicated root space in u∩Ad(v)u. The centralizer of a generic point of the wall has semisimple rank one; adding a nonzero vector in its root space changes its rank-one part to regular nilpotent. The remaining root spaces have nonzero z-eigenvalue. The root decomposition computes centralizer dimension r. Openness of regularity and irreducibility from the preceding theorem give a dense regular open.

**Checks.**

- For SL₂ the reflection wall is z=0 and z+cE₁₂ is regular for c≠0, although its semisimple part z is not regular. This is exactly the boundary case needed for R₁.
- Computed values for SL₂ α-wall; GL₃ wall a=b≠c; torus: z=0 with E₁₂ centralizer dimension 1; diag(a,a,c)+E₁₂ centralizer dimension 3 in gl₃; no reflection for torus.

*Needs:* §5.2; §2.2; ReductiveGroups Layer 7; ReductiveGroups Layer 2.

### 5.4 Normality of the incidence components

Assume the reductive-group and characteristic hypotheses of the conventions. Every X_w is geometrically normal. This theorem does not assert normality of the reducible X or of the nilpotent components Z_w. (BHS19, Theorem 2.3.6, pp. 318–319 (BHS19 line 761)).

One proof route is as follows. CM gives S₂. A codimension-one component C of the boundary has dense intersection with some V_v, v<w. The Cartan relation for w and v puts it above ker(wv⁻¹−id). Compare the affine-fibre dimension from §5.2 with dim C=D−1. The fixed-space codimension must be one, so wv⁻¹ is a reflection s_α. The irreducible inverse image from §5.2 is precisely the possible boundary component. The regular-root-wall theorem shows that this C meets the open on which pr_i,w is an isomorphism to smooth g̃ʳᵉᵍ. Thus every height-one generic point is regular. Apply Serre R₁+S₂, and repeat after algebraic closure.

**Checks.**

- For SL₂ both X_e and X_s are normal even though their union X is reducible and is not normal at their meeting. No normality conclusion about Z_w follows by taking the Cartan zero fibre.
- Computed values for torus; SL₂ components and union: t is regular of dimension r; each X_w regular of dimension 3; the union has two intersecting components and is not normal at their intersection.

*Needs:* §4.3; §3.9; §3.6; §5.1; §5.2; §5.3; SchemeAndStackFoundations §4.13.

### Examples

For GL₃ and the three-cycle w with w(e₁)=e₂, a point of X_w with first Cartan coordinate z=diag(1,2,4) has second coordinate w⁻¹z=diag(2,4,1), not wz=diag(4,1,2). For SL₂ both X_e and X_s are smooth, hence normal, while their union X is not normal along their intersection.

### Dependencies

SchemeAndStackFoundations §4.13; Mathlib `LinearMap.ker`; ReductiveGroups Layer 2; ReductiveGroups Layer 7. Internal inputs are the precise subsections cited in each needs line.

## Layer 6: Springer and conormal geometry

### 6.1 Chevalley restriction and the nilpotent fibre

In characteristic zero use the coaction-invariant quotient c=Spec k[g]^G≅Spec k[t]^W=t/W≅Aʳ and its specified augmentation at zero. Compare its scheme zero fibre with NilpotentOrbits N1 and N5.0, rather than defining a second complex cone. The additional target is that for every split connected reductive G over every characteristic-zero k, this zero fibre 𝒩 is geometrically reduced and its field and central-isogeny comparisons identify the quotient ideals. On the Lie decomposition g=z(g)⊕g_der, the comparison is 𝒩≅{0}×𝒩_der. The composite g̃→g→c is κ followed by t→t/W. A nondegenerate invariant symmetric form g≅g* uses a chosen form on the centre. (BHS19, beginning of §2.4, pp. 319–320; Lemma 2.3.4, p. 316, BHS19 lines 711 and 842.)

Here nilpotent means the scheme zero fibre of the augmented quotient, including zero central coordinate. Adjoint-nilpotence alone would include the entire centre of a torus.

One proof route is to consume FormalConnectionsOpers F4.3's restriction, generators and field descent. Use the split Chevalley model over Q, pass to C to identify its quotient-ideal fibre with N1 and apply N5.0, then descend geometric reducedness faithfully and extend to arbitrary characteristic-zero k. Central isogenies have invertible differential in characteristic zero and identify the derived Lie algebras and flags. Separate the central polynomial coordinates: their zero fibre is the origin, without a central affine factor. The comparison retains the augmentation, all defining equations and base-change maps, including on nonreduced test algebras. On b, invariant functions factor through t, giving the displayed equality of quotient maps. This route does not infer reducedness from geometric points.

**Checks.**

- For PGL₂ over C the adapter retains the quotient-ideal ring C[a,b,c]/(a²+bc), with nilradical zero. Over Q the same equation has the same geometrically reduced cone.
- For the rank-one torus over k[ε]/ε², the scalar ε has nilpotent adjoint action but nonzero central quotient coordinate ε, so it is excluded from the zero fibre. The zero scalar is included.

- For GL₂ the quotient coordinates can be trace and determinant, and their zero fibre is the nilpotent cone. The centre gives a direct counterexample to using the Killing form as a nondegenerate reductive form.
- Computed values for torus; sl₂; gl₂ invariant form: quotient t→t identity, zero fibre point; sl₂ quotient coordinate a²+bc; trace form on gl₂ nondegenerate while Killing form vanishes on scalar centre.

*Needs:* ReductiveGroups Layers 8–9 and the Lie-invariant contract; NilpotentOrbits N1 and N5.0; FormalConnectionsOpers F4.3; ReductiveGroups Layer 2; ReductiveGroups Layer 7; §2.2; §3.2; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 6.2 The Springer resolution

In characteristic zero compare the supplied Springer incidence object with the closed subbundle g̃×_t{0}≅G×ᴮu and compare its map μ:𝒩̃→𝒩 with q restricted to that zero fibre. In the complex adjoint semisimple case these are exactly NilpotentOrbits N1 and N7's objects and maps. The additional target extends this comparison to every characteristic-zero k and split connected reductive G: μ is proper birational with smooth source of dimension 2N, and the comparisons identify its scheme fibres and commute with field extension. Incidence means Ad(g⁻¹)ψ∈u, with the full subbundle equations on every test algebra. (BHS19, §2.4, pp. 319–320, BHS19 lines 834–838.)

One proof route is to identify the closed ideals after torsor pullback using b→t. The field and central-isogeny adapters of §6.1, and descent of the Lie/flag bundles, compare this map with N1 and N7 over C; faithful descent gives properness and smoothness over the split Q-model and then over k. Alternatively use closed incidence properness and FormalConnectionsOpers F4.3's unique regular-nilpotent Borel to prove birationality on its dense open. Retain the full scheme fibres; their reduction is a separate operation. A reductive central factor contributes zero to both source and target, so it adds no Springer fibre direction.

The construction has the following API.

- 𝒩̃≅g̃×_t{0} as schemes, not merely on points.
- μ([g,n])=Ad(g)n.
- 𝒩̃→F is a vector bundle of rank N.
- The construction and its incidence embedding commute with field extension.

**Checks.**

- For PGL₂ over C, the comparison preserves the cone a²+bc=0, the total space O_(P¹)(−2), the scheme fibre P¹ at zero and a single reduced flag over a regular nilpotent.

- For a torus 𝒩=𝒩̃=Spec k, although g̃=t.
- For SL₂, 𝒩̃≅Tot O_(P¹)(−2), of dimension 2.
- μ⁻¹(0)=F; for a nonzero regular nilpotent in SL₂ the fibre is a single reduced flag.
- Computed values for torus; SL₂ zero; E₁₂: point→point; zero fibre P¹; regular nilpotent reduced fibre one flag, total space O(−2) dimension 2.

*Needs:* NilpotentOrbits N1 and N7; FormalConnectionsOpers F4.3; §2.1; §6.1; ReductiveGroups Layer 7; §1.2.

### 6.3 Cotangent and conormal identifications

For every characteristic-zero k and split connected reductive G, compare T*F≅𝒩̃ with NilpotentOrbits N7 after matching the invariant form; this is its field and reductive-centre adapter. The fibre map sends a cotangent functional to the unique ψ∈Ad(g)u representing it under that form, since b⊥=u. It preserves the projection to F, the G-action and the moment map to g*; under g≅g* the latter is μ. Under T*(F×F)≅𝒩̃×𝒩̃, embed a triple (F₁,F₂,ψ) as ((F₁,−ψ),(F₂,ψ)). The moment map for diagonal G is ξ₁+ξ₂, so its zero locus corresponds to the common-operator incidence condition. Over U_w its reduced zero locus is T*_(U_w)(F×F). (BHS19, §2.4, pp. 320–321; proof of Lemma 2.4.8, p. 324, with the Springer cotangent factors (BHS19 line 842)).

One proof route is as follows. Compute T*_(gB)F=Ad(g)b⊥=Ad(g)u. The natural moment map is the operator coordinate. A covector annihilates the diagonal orbit tangent exactly when the two moment maps add to zero. Use a minus sign in the first factor and the identity in the second. Descend the orbitwise identification and compare dimensions. The product is of two Springer resolutions; substituting two Grothendieck resolutions would give dimension 4N+2r.

**Checks.**

- For SL₂ with the trace pairing, at the flag ke₁ the tangent vector represented by E₂₁ pairs with ψ=E₁₂ to 1. With twice that form, the same functional is represented by E₁₂/2, so comparison with N7 must match the form. A central torus changes neither side.

- For a positive-rank torus T*F is a point while g̃=t has positive dimension. For SL₂ the signed pair (−ψ,ψ) has moment sum zero; the unsigned pair need not.
- Computed values for SL₂; two cotangent factors; torus: dim T*F=2; product 4 and moment −ψ+ψ=0 versus 2ψ; torus cotangent point versus g̃×g̃ dimension 2r.

*Needs:* NilpotentOrbits N7; §6.2; §1.3; ReductiveGroups Layer 2.

### 6.4 The reduced Steinberg variety

Define Z=(X×_c{0})_red, and define Z_w as the reduced closure in Z of V′_w=π⁻¹(U_w)∩Z. There is a canonical isomorphism Z≅(𝒩̃×_𝒩𝒩̃)_red. The raw fibre-product comparison without reduction is a separate target, not part of this definition. (BHS19, §2.4 and Proposition 2.4.1, pp. 320–321 (BHS19 line 842)).

One proof route is as follows. Form the nilpotent fibre of the common operator map and then its reduction. After reduction the two Borel conditions force both toral parts to vanish; compare the two reduced functors on reduced test schemes or radical ideals. Define each component by reduced closure, retaining its label from the relative-position orbit.

The construction has the following API.

- Z≅(𝒩̃×_𝒩𝒩̃)_red with the same flags and operator.
- Z_w is the reduced closure of V′_w, not the Cartan zero fibre of X_w.
- Its cotangent embedding sends ψ to (−ψ,ψ).
- Reduction and these components commute with characteristic-zero field extension.

**Checks.**

- For a torus Z=Z_e=Spec k; it is not t.
- For SL₂, Z_e is the diagonal Springer resolution and Z_s=F×F×{0}; both have dimension 2.
- In SL₂ their intersection is the zero section diagonal F, so Z is reducible even though each X_w is normal.
- Computed values for SL₂ e,s; torus: Z_e=diagonal T*P¹, Z_s=P¹×P¹×{0}, intersection diagonal P¹; torus point.

*Needs:* §3.1; §6.1; §6.2; §3.5; §5.1.

### 6.5 Scheme comparison for the Steinberg fibre product

Let Q=𝒩̃×_𝒩𝒩̃ be the scheme fibre product in characteristic zero. The canonical closed immersion Z≅Q_red→Q is an isomorphism if and only if Q is reduced. Thus Z≅Q without reduction is conditional on radicality of the local incidence ideals; equality of geometric points alone does not establish that condition. (BHS19, Beginning of §2.4, pp. 319–320, displayed Steinberg comparison (BHS19 line 800)).

This comparison is precisely the conditional statement. It imposes no unproved radicality assumption on subsequent targets. Nilpotent thickenings with the same geometric points cannot be identified by a point-set argument.

One proof route is as follows. Construct the closed immersion from the reduced fibre product. The immersion is an isomorphism exactly when the nilradical sheaf of Q vanishes. Reducedness of Q is a hypothesis of this conditional comparison, not an input supplied elsewhere. The BHS display may be read in the reduced-variety convention; it is not used as a scheme-level reducedness theorem, and no subsequent cycle theorem assumes it.

**Checks.**

- For a torus both raw and reduced Springer fibre products are a point. In higher rank this elementary case does not prove radicality; the comparison remains conditional on reducedness of Q and is not used by the cycle identities.
- Computed values for Q=Spec k; Q=Spec k[ε]/ε²: reduction map is iso with lengths 1=1; nonreduced reduction map has source length 1 and target length 2, so no iso.

*Needs:* §6.4; §6.2; §6.1.

### 6.6 Components and conormal closures

Z is equidimensional of dimension 2N; its irreducible components are exactly the distinct Z_w, w∈W. Under the signed cotangent embedding, Z_w is the reduced conormal closure of U_w. Each V′_w→U_w is a vector bundle of rank N−ℓ(w). No CM or normality assertion for Z_w is included. (BHS19, Proposition 2.4.1, p. 320; §2.4, p. 321 (BHS19 line 842)).

One proof route is as follows. The nilpotent stratum fibre is u∩Ad(ŵ)u, giving dimension N−ℓ(w); add dim U_w=N+ℓ(w). The orbit conormal description identifies each stratum and its reduced closure. The finite stratification by equal-dimensional irreducible strata gives precisely the components.

**Checks.**

- For SL₂, Z_e is the diagonal Springer resolution and Z_s=P¹×P¹ at ψ=0; each has dimension 2 and they meet along the one-dimensional diagonal zero section.
- Computed values for SL₂ e,s; torus: conormal ranks 1,0 added to orbit dimensions 1,2 give 2,2; torus 0+0=0.

*Needs:* §6.4; §6.3; §3.4; §5.2; §1.4.

### Examples

For SL₂ the nilpotent cone is the quadric cone a²+bc=0 and the Springer resolution is the total space of O_(P¹)(−2), of dimension 2. The reduced Steinberg variety Z has the two components Z_e, the diagonal copy of T*P¹, and Z_s=P¹×P¹×{0}, each of dimension (N+ℓ(w))+(N−ℓ(w))=2, meeting along the diagonal zero section.

### Dependencies

FormalConnectionsOpers F4.3; NilpotentOrbits N1, N5.0 and N7; ReductiveGroups Layer 2; ReductiveGroups Layer 7; ReductiveGroups Layers 8–9 and the Lie-invariant contract; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 7: Integral cycles and Cartan zero fibres

### 7.1 The component-basis comparison for supplied top cycles

For a Noetherian pure d-dimensional scheme Y with finitely many components, define its top-cycle group as the subgroup of native AlgebraicCycle Y Z supported at the generic points of its d-dimensional irreducible components. Identify it with ⊕_C Z[C]. For Y of finite type over a field, prove that this is the supplied dimension-d subgroup of SchemeAndStackFoundations §5.1; on arbitrary Noetherian Y it extends that component-support description without imposing a field-finiteness hypothesis. No rational equivalence is imposed. (BHS19, §2.4, p. 320; §2.5, p. 327 (BHS19 line 842)).

The ambient locally finite cycle carrier is unchanged. The new generality is the top-component subgroup on arbitrary Noetherian finite-dimensional schemes; for finite-type field schemes use the supplied grading rather than defining it a second time. The empty scheme has the zero group in every degree.

Use finite support on the top-component set to identify this subgroup with integer functions on that finite set. The comparison is an additive equivalence and its composite into the native locally finite cycle group is the inclusion. At finite type over a field the supplied dimension grading has exactly this support in top degree; for a general Noetherian scheme use its actual component dimensions.

The construction has the following API.

- A component C gives a basis vector [C].
- coeff_C([C′]) is 1 for C=C′ and 0 otherwise.
- Two cycles agree iff all their component coefficients agree.
- The inclusion in AlgebraicCycle Y Z has image supported on top generic points and is injective.

**Checks.**

- For the two coordinate axes Y=V(xy), Z₁(Y)≅Z²; [axis x] and [axis y] remain independent.
- For Spec k, Z₀≅Z and its point has coefficient 1.
- On Y=A¹, Z₁(Y) has the one generator [A¹]; the native zero-dimensional cycle [0] is not an element of this top-dimensional subgroup.
- Computed values for coordinate axes; point; A¹: Z₁(axes)=Z²; Z₀(point)=Z; Z₁(A¹)=Z while [0] has degree 0.

*Needs:* §6.6; SchemeAndStackFoundations §5.1; Mathlib `AlgebraicGeometry.AlgebraicCycle`; Mathlib `Finsupp`.

### 7.2 Gluing the affine generic-length cycle

For a noetherian finite-dimensional scheme Y and a coherent O_Y-module M with dim Supp(M)≤d, glue the supplied affine cycles to obtain [M]_d=Σ_C length_(O_Y,ηC)(M_ηC)[C], where C runs over the finitely many d-dimensional components of Supp(M). Each localized module has finite length. The result is a native dimension-d cycle; when its support lies in a pure d-dimensional reduced Z⊂Y, identify its component coefficients with Z_d(Z). This identification does not turn M into an O_Z-module. Closed subscheme cycles use the pushforward of the full structure sheaf into Y, retaining nilpotent multiplicities. (BHS19, §2.4, p. 320; Lemma 2.5.5, pp. 327–328 (BHS19 line 842)).

On each affine chart use the module cycle of PadicLocalLanglandsForGL2Qp §0.5 and prove that its generic lengths agree on overlaps. Glue them in the supplied dimension-d scheme cycle group. This scheme/gluing comparison is the content here; the affine definition and its exact-additivity theorem are inputs. For a general Noetherian finite-dimensional Y, use the finite component-support cycle subgroup directly; the closure dimensions remain measured in Y.

One proof route is as follows. At each d-dimensional generic point of Supp(M), the support of M localized there is zero-dimensional, hence the finite stalk has finite length. Convert finite extended-natural lengths to integer coefficients. Define the finite cycle by these coefficients. Stalk exactness and length additivity give the short-exact-sequence API.

The construction has the following API.

- The C coefficient is length(M_ηC).
- For 0→M′→M→M″→0, [M]=[M′]+[M″].
- For a reduced pure d-dimensional closed subscheme Z⊂Y, the cycle of its pushforward O_Z is Σ_C[C].
- If dim Supp(M)<d then [M]_d=0.

**Checks.**

- On Spec k[ε]/ε², [O]=2[point]; reducing first gives the wrong answer 1.
- For k[x,y]/xy, [O]=[V(x)]+[V(y)].
- The exact sequence 0→(ε)→k[ε]/ε²→k→0 gives 2=1+1 at the generic point.
- Computed values for dual numbers; axes; exact ε sequence: 2[point]; [x-axis]+[y-axis]; coefficient equality 2=1+1.

*Needs:* §7.1; PadicLocalLanglandsForGL2Qp §0.5; SchemeAndStackFoundations §§0.4 and 5.1; Mathlib `Module.length`; Mathlib `Module.length_eq_add_of_exact`; `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`.

### 7.3 The scheme theoretic Cartan zero fibres

Define X̄=X×_(κ₁,t){0} and X̄_w=X_w×_(κ₁,w,t){0}, with their full scheme structures. Their reduced supports lie in Z, so their structure sheaves define cycles in Z_(2N)(Z), denoted [X̄] and [X̄_w]. The same zero fibre on X_w is obtained with κ₂,w. (BHS19, §2.4, p. 320, notation preceding Proposition 2.4.6 (BHS19 line 842)).

One proof route is as follows. Form the native scheme fibres before reduction. The Cartan relation identifies the zero conditions for each component. Nilpotence identifies the reduced support with a union of Steinberg components. Form the generic-length cycle of the structure sheaf pushed into X, then identify its dimension-2N component basis with that on Z. There is no asserted map from the nonreduced fibre to Z_red.

The construction has the following API.

- A map into X_w factors through X̄_w iff its κ₁,w composite is zero.
- The zero fibres of κ₁,w and κ₂,w agree as closed subschemes.
- Its cycle uses O_(X̄_w) and generic lengths on Z.
- Flat field extension commutes with the scheme zero fibre and its geometric components.

**Checks.**

- For a torus X=t and X̄_e=Spec k.
- For SL₂, X̄_e=𝒩̃, so [X̄_e]=[Z_e].
- For SL₂, [X̄_s]=[Z_s]+[Z_e]; identifying X̄_s with Z_s loses the diagonal component.
- Computed values for torus; SL₂ e,s: point; [X̄_e]=[Z_e]; [X̄_s]=[Z_e]+[Z_s] with coefficient vector (1,1), not (0,1).

*Needs:* §3.2; §5.1; §4.4; §6.4; §7.2.

### 7.4 Dimension and Cohen–Macaulayness of zero fibres

X̄ and every X̄_w are equidimensional CM schemes of dimension 2N. Their scheme multiplicities need not be discarded, although their reduced supports have only the Z_v as possible top components. (BHS19, Proposition 2.3.3, p. 316; §2.4, p. 320 (BHS19 line 681)).

One proof route is as follows. The source of each flat Cartan map is CM and its target t is regular. The local flat depth formula makes every fibre CM. The previously proved uniform fibre dimension gives 2N; the nilpotent support and the Steinberg component theorem identify the available top components.

**Checks.**

- For SL₂ the Cartan fibres X̄_e and X̄_s are CM of pure dimension 2. Their cycles are respectively [Z_e] and [Z_e]+[Z_s], so neither dimension nor CM identifies X̄_s with Z_s.
- Computed values for SL₂; torus; double point regular-parameter example: dimension 2 and CM depth 2; dimension 0 depth 0; k[x,t]/(x²−t) at origin mod t has length 2 despite regular total source.

*Needs:* §7.3; §4.3; §3.7; §4.4; §4.1; SchemeAndStackFoundations §§0.7, 0.17–0.18.

### Examples

For SL₂ the Cartan zero fibres have cycles [X̄_e]=[Z_e] and [X̄_s]=[Z_e]+[Z_s]: in the coordinates of the worked SL₂ example κ₁=b(x−y)/2 on X_s, whose zero locus has the two reduced components b=0 and x=y. On Spec k[ε]/ε² the structure sheaf has cycle 2[point], while its reduction has cycle [point].

### Dependencies

Mathlib `AlgebraicGeometry.AlgebraicCycle`; Mathlib `Finsupp`; Mathlib `Module.length`; Mathlib `Module.length_eq_add_of_exact`; PadicLocalLanglandsForGL2Qp §0.5; SchemeAndStackFoundations §§0.4, 0.7, 0.17–0.18 and 5.1; `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`. Internal inputs are the precise subsections cited in each needs line.

## Layer 8: Differential operators and characteristic cycles

### 8.1 Coherent modules over the supplied differential-operator sheaf

Let k have characteristic zero and let Y be smooth separated finite type of pure dimension n. Use the order-filtered sheaf D_Y of ordinary algebraic differential operators of ComplexComparisonPartII C5.1, with F_(−1)=0, carrying the symbol and PBW structure of FormalConnectionsOpers F2.2. Construct its category of left modules with quasi-coherent underlying O_Y-module, and its full coherent subcategory: the modules M with M(U) finitely generated over D_Y(U) for every affine open U. The restriction and étale chart comparisons retain the actual supplied D-action (M23 Definition 3.1, p. 9, M23 lines 474–477; BHS19 §2.4, p. 321, BHS19 line 919). M23 works over an algebraically closed field of characteristic zero (M23 line 466); the arguments of §§8.1–9.6 used here (étale coordinate charts, Noetherian graded rings, Kashiwara's normal-coordinate expansion, the Sato–Kashiwara filtration) use no closure property of k, and the one place where the field matters, regularity, is the field-descent target of §9.7.

Use the supplied operator restriction/gluing and the module-sheaf category, then prove that cokernels of D-linear maps between coherent modules, and extensions of coherent modules, are coherent, and that kernels are O-quasi-coherent; coherence of kernels is §8.2's consequence of Noetherianity. Restriction to an open scheme is exact and preserves coherence; morphisms are precisely the D-linear maps of underlying module sheaves. This category includes D_Y itself and does not impose O-coherence.

The construction has the following API.

- Forgetting to O-module sheaves retains the supplied multiplication action of local functions.
- Restriction is exact, and coherence can be tested on affine coordinate charts.
- The order and coordinate relations used by this category are those of the supplied C5.1 operator sheaf: F₀=O, F_pF_q⊂F_(p+q), [F_p,F_q]⊂F_(p+q−1) for p+q≥1, and [F₀,F₀]=0; every (p+1)-fold function commutator vanishes exactly at order at most p, for p≥0.

**Checks.**

- On Spec k, D=k and F_p=k for every p≥0.
- On A¹, ∂x−x∂=1, so replacing D by the commutative polynomial ring is false.
- D_A¹ is coherent over itself and is not a coherent O_A¹-module; its O-rank is infinite.
- Computed values for point; A¹; multiplication x: D_point=k; [∂,x]=1; order x=0, order ∂=1.

- The zero D-module has the empty finite generating family and is coherent. The quotient D_A¹/D_A¹x is generated by δ with relation xδ=0; ∂δ survives, so replacing it by the O-module k with zero ∂ action violates [∂,x]=1.

*Needs:* ComplexComparisonPartII C5.1; FormalConnectionsOpers F2.2; Mathlib `SheafOfModules`; AlgebraicVectorBundles L0A.

### 8.2 Noetherian and cotangent comparisons from supplied PBW

For the smooth characteristic-zero Y of §8.1, apply the graded isomorphism Sym_(O_Y)T_Y≅gr D_Y supplied by FormalConnectionsOpers F2.2 on the C5.1 operator sheaf. Prove that the operator algebra on an affine étale coordinate chart is left and right Noetherian and that the coherent graded-module/sheaf correspondence identifies its relative spectrum with T*Y. Consequently a coherent D_Y-module in the sense of §8.1 is locally finitely presented over D_Y, and kernels of D-linear maps between coherent modules are coherent, so the coherent modules form an abelian subcategory. In coordinates the supplied PBW basis gives F_pD the O-basis ∂₁^a₁⋯∂_n^a_n with Σa_i≤p for every p≥0; this comparison fixes the symbol degree and order convention (M23 Theorems 2.11 and 2.21 and Corollary 2.22, pp. 3–6, M23 lines 218, 371 and 386).

The new filtered Noetherian comparison uses the leading-order ideal argument for the Noetherian polynomial associated graded; right ideals use the same commutative graded ring. AlgebraicVectorBundles L1A–L2B supplies relative Spec, its graded algebra charts and T*Y=Spec Sym T_Y. SchemeAndStackFoundations §0.2 supplies `relativeSpec_modulesEquiv`, the equivalence between quasi-coherent modules on Spec_Y(A) and quasi-coherent O_Y-modules with an A-module structure; apply it with A=gr D_Y to gr M after forgetting the grading, and retain the grading as the scaling structure on cotangent fibres. Finite presentation of the resulting sheaf is checked on affine charts, where gr M is finitely generated over the Noetherian ring gr D. The supplied monomial-to-order inclusion is F′_p⊂F_p; expansion of an order-p operator gives the reverse inclusion. The associated-graded sheaf, rather than a mere dimension equality, identifies the cotangent support used in §8.3.

**Checks.**

- On A¹ the relation ∂x−x∂=1 becomes the commutative symbol ring k[x,ξ]. The order-p piece has O-basis 1,∂,…,∂^p.
- On Y=A¹ the graded module k[x,ξ]/(ξ)=gr O becomes, under the module equivalence, the structure sheaf of the zero section of T*A¹; the algebra/affine-scheme anti-equivalence alone does not turn an arbitrary graded module into a sheaf.
- Computed values for point; A¹ degrees 0,1,2: gr=k; symbols 1,ξ,ξ² give k[x,ξ]; ranks F₀,F₁,F₂ over k[x] are 1,2,3.

*Needs:* ComplexComparisonPartII C5.1; FormalConnectionsOpers F2.2; AlgebraicVectorBundles L1A–L2B; SchemeAndStackFoundations §0.2; Mathlib `SymmetricAlgebra`; the definition of coherence in §8.1.

### 8.3 Good filtrations on coherent D-modules

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. A filtration F_jM, j∈Z, is good when it is increasing, exhaustive, locally bounded below, each F_jM is coherent over O_Y, F_pD·F_jM⊂F_(p+j)M, and gr_FM is locally finitely generated over gr D. Equivalently, locally F_(p+j)M=F_pD·F_jM for all p≥0 once j is large enough. Filtrations are local sheaf data, with global choices where the stated hypotheses provide them. (BHS19, §2.4, p. 321 (BHS19 line 885); M23, Definitions 3.19 and 3.21; Proposition 3.22, pp. 13–14 (M23 line 675)).

One proof route is as follows. Use the order filtration on D and integer-indexed O-submodules of M. Finite generation of gr M implies the eventual generation condition; the converse follows from finitely many coherent graded pieces.

The construction has the following API.

- gr_F M is a coherent module on T*Y.
- Replacing F_j by F_(j+a), a∈Z, preserves goodness.
- Goodness is local on Y and may be checked in an étale coordinate cover.
- Finite generation of gr M is equivalent to the stated eventual order-generation condition.

**Checks.**

- For O_A¹, F_j=0 for j<0 and F_j=O for j≥0 is good; the symbol ξ acts by zero.
- For D_A¹ the order filtration is good and gr D=k[x,ξ].
- For nonzero M, the constant filtration F_j=M for every integer j is not good because it is not bounded below; its zero graded module must not erase M.
- Computed values for O_A¹; D_A¹; constant filtration of nonzero M: gr O=k[x] with ξ=0; gr D=k[x,ξ]; constant all-integer filtration has gr=0 and fails bounded-below condition.

*Needs:* §8.1; §8.2; `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`.

### 8.4 Existence and comparison of good filtrations

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. Every coherent D_Y-module admits a global good filtration. Any two global good filtrations F and G are globally comparable: there is an integer a≥0 such that F_j⊂G_(j+a) and G_j⊂F_(j+a) for every integer j. In a short exact sequence of coherent D-modules, choose a good middle filtration and induced filtrations on submodule and quotient; these are good and their graded sequence is exact. (BHS19, §2.4, p. 321 (BHS19 line 885); M23, Propositions 3.24, 3.25 and 3.33, pp. 14–16 (M23 lines 754–784 and 843–859)).

One proof route is as follows. Choose a finite affine cover U₁,…,U_s and coherent O_(U_i)-submodules generating M locally over D. Extend each to a coherent O_Y-submodule of M by SchemeAndStackFoundations §0.4. Their finite sum M₀ is coherent and generates M globally. Put F_jM=0 for j<0 and F_jM=D_(≤j)M₀ for j≥0. Express finite homogeneous generators for each of two filtrations in bounded degrees of the other locally. The maximum of the finitely many bounds gives both global inclusions. Noetherianity of gr D makes the induced submodule finite. The induced quotient filtration then gives degreewise exactness.

**Checks.**

- A cover by s affine opens gives s extended coherent pieces and one generating sum, including s=1; no projective embedding enters. On A¹ the global order filtration of D has gr D=k[x,ξ], while the global filtration of O has gr O=k[x] with ξ=0.

- Shifting a good filtration by any integer changes its degrees but preserves goodness. For a short exact sequence, taking induced filtrations must yield an exact graded sequence; unrelated independently chosen filtrations need not do so.
- Shifting the filtration F_j=O_A¹ (j≥0) of O_A¹ by one degree gives comparison bound a=1 in both directions, and a=0 fails at j=−1.
- On A¹ take 0→D/Dx→D/Dx²→D/Dx→0, with first map [P]↦[Px] (injective since D is a domain) and second the quotient. Give the middle module its order filtration and the sub and quotient the induced filtrations. The graded sequence is 0→k[x,ξ]/(x)→k[x,ξ]/(x²)→k[x,ξ]/(x)→0, the first map being multiplication by x, with generic lengths 1, 2, 1 at the prime (x), so 2=1+1. These modules are infinite-dimensional over k: no nonzero D_A¹-module is finite-dimensional, since a trace of [∂,x]=1 would give 0=dim.

*Needs:* §8.3; §8.2; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 8.5 The characteristic variety

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. For a coherent D_Y-module M, define Ch(M)⊂T*Y as the reduced closed support of gr_FM for any local good filtration. These closed sets glue independently of the choices. This definition assigns reduced support, not a preferred possibly thickened characteristic subscheme. Put Ch(0)=∅. (BHS19, §2.4, p. 321 (BHS19 line 885); M23, Definition 3.28 and Proposition 3.30, pp. 15–16 (M23 line 769)).

One proof route is as follows. On an affine chart take the radical annihilator of gr_FM in Sym T_Y. Comparison by bounded shifts and the Rees-lattice argument identify radical annihilators. Gluing follows from restriction compatibility.

The construction has the following API.

- Two good filtrations have the same reduced characteristic support.
- Ch(M|_V)=Ch(M)×_YV for every open V.
- Ch(M)=Ch(M′)∪Ch(M″) for a short exact sequence.
- Ch(M) is invariant under scaling of cotangent fibres.

**Checks.**

- Ch(O_A¹) is ξ=0, the zero section.
- Ch(D_A¹/D_A¹x) is x=0, the whole cotangent fibre at zero.
- Ch(D_A¹)=T*A¹, whereas Ch(0)=∅.
- Computed values for O_A¹; δ₀; D_A¹ and zero: support ξ=0; support x=0; full plane dimension 2; empty set.

*Needs:* §8.3; §8.4; §8.2.

### 8.6 The characteristic cycle

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. For every coherent D_Y-module M define CC(M)=Σ_C length_(O_(T*Y),ηC)((gr_FM)_ηC)[C], over all irreducible components C of Ch(M), in the ungraded native cycle group, equivalently the direct sum of its dimension-graded groups. Set CC(0)=0. No dimension condition on Ch(M) is imposed. For holonomic M this cycle lies in degree n by Bernstein inequality. Independence of F is a theorem; generic length, rather than rank after tensoring with the reduced component, is essential. (BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323 (BHS19 line 885); M23, Definition 6.40 and Proposition 6.41, pp. 55–56 (M23 lines 2728–2768); G98, Definition 1.1.12, p. 5, for the reduced characteristic variety only, its rank-over-the-component multiplicity not being used (G98 line 191)).

One proof route is as follows. Use the reduced characteristic support from §8.5 and take the finite generic length at each of its irreducible components, retaining components of every dimension. At each such generic point the graded module has zero-dimensional support, so its localized length is finite. Compare adjacent good filtrations: the kernel and cokernel of their graded comparison differ only by a grading shift as ungraded modules. Localize at each common support generic point, where all four modules have finite length, and cancel the equal kernel and cokernel lengths. Global bounded comparison from §8.4 reduces arbitrary filtrations to finitely many adjacent ones. This proves independence without asserting additivity of all-component cycles for arbitrary mixed-dimensional exact sequences; §9.5 proves additivity for holonomic modules.

The construction has the following API.

- CC(M) is the same for every good filtration.
- Its C coefficient is the finite generic length, a nonnegative integer.
- Restriction to an open subset discards components missing it and restricts the others.
- CC(0)=0; for holonomic M all components have dimension n.

**Checks.**

- CC(D_A¹)=[A²], with characteristic dimension 2 and generic length 1; for the trivial group this is a strongly equivariant coherent example in §9.8. CC(0)=0 is the empty sum.
- For D_A¹⊕O_A¹ the characteristic support is A² and the all-component cycle is [A²]; the embedded zero section is not an irreducible support component. The split exact sequence has cycles [A²] and [ξ=0] on its ends, so unrestricted all-component additivity would be false.

- CC(O_A¹)=[zero section].
- For M=D_A¹/D_A¹x², CC(M)=2[cotangent fibre over 0 in A¹]; reducing the graded support first would yield multiplicity 1.
- An integrable connection of rank a on a smooth n-fold has CC=a[zero section].
- Computed values for O_A¹; D/Dx²; rank-a connection: [zero section]; 2[cotangent fibre] versus reduced-rank 1; a[zero section].

*Needs:* §7.2 for the generic-length argument in each pure-dimensional support case; SchemeAndStackFoundations §5.1 and Mathlib `AlgebraicGeometry.AlgebraicCycle` for the ambient all-dimensional carrier; §8.5; §8.4.

### Examples

On A¹ the characteristic cycles are [A²] for D_A¹, the zero section for O_A¹, twice the cotangent fibre over 0 for D/Dx², a times the zero section for an integrable connection of rank a, and 0 for the zero module. D_A¹⊕O_A¹ has cycle [A²], since the zero section is not a component of its characteristic variety.

### Dependencies

AlgebraicVectorBundles L0A and L1A–L2B; ComplexComparisonPartII C5.1; FormalConnectionsOpers F2.2; Mathlib `AlgebraicGeometry.AlgebraicCycle`; Mathlib `SheafOfModules`; Mathlib `SymmetricAlgebra`; SchemeAndStackFoundations §0.2; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13; SchemeAndStackFoundations §5.1; `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`. Internal inputs are the precise subsections cited in each needs line.

## Layer 9: Holonomic operations and equivariance

### 9.1 Transfer modules and D-module operations

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. For a morphism f:Y→Y′ of smooth separated finite-type characteristic-zero schemes of pure dimensions n and n′ define D_(Y→Y′)=O_Y⊗_(f⁻¹O_Y′)f⁻¹D_Y′ with its left D_Y and right f⁻¹D_Y′ actions. Write Lf* for derived tensor with this transfer module and f†=Lf*[dim Y−dim Y′]. For a smooth map of relative dimension d, the abelian pullback is f†[−d]=Lf*. For a closed immersion of codimension c, f†=Lf*[−c] is the inverse in Kashiwara equivalence; direct image for right modules is Rf_*(M⊗^L_(D_Y)D_(Y→Y′)), and left direct image is obtained using the canonical-bundle left/right equivalence. Define duality 𝔻_Y(M)=RHom_(D_Y)(M,D_Y)⊗_(O_Y)ω_Y⁻¹[n] and f_!=𝔻_(Y′)f_+𝔻_Y. Fix this normalization throughout. (BHS19, §2.4, p. 321, localisation and equivariant induction (BHS19 line 885); M23, §6.1, pp. 43–47; normalized duality before Exercise 6.55 and Remarks 6.56–6.57, pp. 62–63 (M23 line 2093)).

The D-specific homological targets are the Spencer resolution and its coordinate-independent comparison, filtered Ext with support-codimension bounds, the Sato–Kashiwara filtration, coherent duality and its evaluation isomorphism on bounded coherent objects, and b-functions and stability of holonomicity under the operations used in intermediate extension. State duality on Dᵇ of coherent D-modules, and its exact restriction to holonomic modules; use finite projective local resolutions for evaluation, never ordinary double duality of arbitrary finite modules (M23 §5.1, pp. 35–36, M23 line 1700; §§6.5–6.6, pp. 56–65). The source and target of right direct image are Dᵇ(Mod(D_Y^op))→Dᵇ(Mod(D_Y′^op)); canonical-bundle conversion gives the corresponding left functor. Prove the resulting composition, identity, adjunction and proper-duality comparisons on their bounded coherent/holonomic domains.

One proof route is as follows. Construct the transfer bimodule from the chain rule. Include the canonical-bundle action in the conversion between left and right modules. Build derived tensor, derived Hom and derived pushforward in the native derived categories of sheaf modules. The sheaf-derived operations needed beyond the existing carrier are constructed in this subsection on top of the derived-bimodule contract of EnhancedDerivedSheaves. The tensor associativity and projection comparisons produce the composition isomorphisms; do not identify naive O-pullback with derived D-inverse image for a closed immersion.

The construction has the following API.

- Transfer for id_Y is D_Y and its inverse/direct image functors are identities.
- The derived transfer comparisons identify the operations for a composite with the composites of operations.
- Tensoring with ω_Y converts left to right modules, with inverse tensor by ω_Y⁻¹.
- Coherent holonomic modules have biduality, and f_! is defined by the displayed dual conjugation.

**Checks.**

- For a point the normalized dual of a finite-dimensional vector space is its ordinary linear dual in degree zero.
- For {0}→A¹, direct image of k is δ₀=D/Dx, not the O-module k with trivial ∂-action.
- For id_A¹ the transfer construction leaves O_A¹ and D_A¹ unchanged.
- Computed values for point; closed point in A¹; identity: dual k²=(k²)* in degree 0; δ=k[∂] with x∂δ=−δ; identity transfer D, shift 0.
- On A¹, ω is generated by dx and the right action associated with the trivial left connection obeys dx·∂=0; the dual of O_A¹ is O_A¹ in degree zero with the shift [1].
- For the two-term resolution [k[x] →x k[x]] in degrees −1,0, its dual has the nonzero residue cohomology in degree 1; the [1] normalization returns a module in degree zero.

*Needs:* §8.1; §8.2; Mathlib `DerivedCategory`; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4 and the derived-bimodule contract; AlgebraicVectorBundles L0A–L0C.

### 9.2 Kashiwara equivalence

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. For a closed immersion i:W→Y of smooth varieties with W pure of dimension n−c, i_+ is exact on quasi-coherent D-modules and induces an equivalence from D_W-modules to D_Y-modules supported set theoretically on W, with inverse H⁰(i†), where i†=Li*[−codim_Y W]. This equivalence restricts to coherent modules. In normal coordinates, the direct image consists of finite sums of normal derivative monomials applied to the original module. (BHS19, §2.4, p. 321 (BHS19 line 885); M23, Theorem 6.20 and Proposition 6.24, pp. 48–51, with the Tor index using Tor₀ for the quotient (M23 line 2327)).

One proof route is as follows. Locally reduce to coordinate subspaces. The relations between the normal coordinates and normal derivatives give the expansion and identify sections killed by the normal ideal. Use induction on the normal multi-index to prove full faithfulness and essential surjectivity. Patch these coordinate equivalences. The full sheaf-level homological proof uses the operations of §9.1 and the derived-bimodule contract of EnhancedDerivedSheaves.

**Checks.**

- For {0}→A¹, the direct image of k is k[∂] with x acting by lowering derivatives; ker x=k and coker x=0. Thus Li*[−1] recovers k in degree zero.
- Computed values for δ=k[∂]; identity; δ⊕δ: ker x=kδ, Tor₀=0, Tor₁=k; inverse of identity unchanged; ker x on double delta dimension 2.

*Needs:* §9.1; §8.1; §8.2.

### 9.3 Bernstein inequality

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. Every irreducible component of Ch(M) for a nonzero coherent D_Y-module M has dimension at least n. (BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323 (BHS19 line 885); M23, §6.3, pp. 51–52 (M23 line 2501)).

One proof route is as follows. The filtered homological argument bounds Ext by characteristic codimension (Sato–Kashiwara filtration); this is an explicit part of §9.1 and the derived-bimodule contract. Alternatively use its support-purity consequence, then Kashiwara on a dense smooth support and induction on support dimension.

**Checks.**

- On A¹, O has the one-dimensional zero section, δ₀ has the one-dimensional cotangent fibre and D has the two-dimensional whole cotangent bundle. The inequality includes all three; holonomicity excludes only D.
- Computed values for O_A¹; D_A¹; δ₀; point: dimensions 1≥1, 2≥1, 1≥1; point dimension 0≥0; putative nonzero finite-dimensional Weyl module would give trace[∂,x]=0≠dim.

*Needs:* §8.5; §9.1; §9.2.

### 9.4 Holonomic D-modules

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. A coherent D_Y-module is holonomic when dim Ch(M)≤n, with zero holonomic. By Bernstein inequality, every component of the characteristic variety of a nonzero holonomic module has dimension n. Holonomicity does not itself impose regular singularities. (BHS19, §2.4, p. 321 (BHS19 line 885)).

One proof route is as follows. Define the full subcategory by characteristic dimension, including the zero module with empty support explicitly. The Bernstein inequality of §9.3 and the exactness Ch(M)=Ch(M′)∪Ch(M″) of §8.5 show that the subcategory is closed under subobjects, quotients and extensions in the coherent category, hence abelian. Finite length, additivity of CC and the induced K₀ homomorphism are the theorem of §9.5, not consequences of this definition: characteristic support alone sees δ₀ and δ₀⊕δ₀ identically.

The construction has the following API.

- Zero belongs to the holonomic category.
- The middle object of a short exact sequence is holonomic iff both ends are.
- Morphisms are exactly the D_Y-linear morphisms of the ambient coherent module category.

**Checks.**

- O_A¹ is holonomic; its support has dimension 1.
- D_A¹ is not holonomic; its characteristic support has dimension 2.
- δ₀ and zero are holonomic, although only δ₀ has a nonempty characteristic variety.
- δ₀⊕δ₀ is holonomic with the same characteristic variety as δ₀; the definition does not see the coefficient 2, which §9.5 supplies.
- Computed values for O_A¹; D_A¹; δ₀; zero: dimensions 1≤1, 2>1, 1≤1; empty support gives zero holonomic.

*Needs:* §8.5; §9.3.

### 9.5 Finite holonomic length and cycle additivity

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. Every holonomic D_Y-module has finite length. For every short exact sequence 0→M′→M→M″→0 of holonomic modules, CC(M)=CC(M′)+CC(M″). Hence CC defines a group homomorphism from K₀(Hol(D_Y)) to the free group on n-dimensional characteristic components. (BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323 (BHS19 line 885); M23, Proposition 6.37, p. 54; Proposition 6.42, p. 56 (M23 line 2664)).

One proof route is as follows. Use induced good filtrations to obtain an exact sequence of coherent graded modules. At each top generic point apply native module-length additivity. The characteristic support of any subquotient lies in the finite union of components of Ch(M), and a nonzero holonomic subquotient contributes a positive coefficient somewhere. Total multiplicity therefore bounds every strict ascending or descending chain, proving finite length. The exact-sequence relation is precisely the defining relation of K₀, so additivity supplies the homomorphism.

**Checks.**

- For δ₀⊕δ₀ on A¹ the finite length is 2 and its cycle is twice the cotangent fibre. Additivity must retain this coefficient for extensions too, rather than counting only reduced support components.
- Computed values for δ⊕δ; zero; exact double-delta filtration: holonomic length 2 and cycle coefficient 2; zero length 0; 2=1+1.

*Needs:* §9.4; §8.6; §8.4; Mathlib `Module.length_eq_add_of_exact`.

### 9.6 Intermediate extension

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. For a locally closed immersion j:W→Y of smooth varieties with W pure of dimension m and holonomic E on W, define j_!*E=im(H⁰j_!E→H⁰j_+E). It restricts to E and has no nonzero subobject or quotient supported on the complement of W in its closure. It is the unique such extension and is simple when E is simple. (BHS19, §2.4, pp. 321–323 (BHS19 line 885); M23, Definition 6.77; Theorem 6.79; Theorem 6.83, pp. 72–77 (M23 line 3632)).

For a general locally closed W, extension means support in its closure and the boundary is that closure minus W. The normalized restriction is j†, not unshifted inverse image along a positive-codimension immersion.

One proof route is as follows. For an open immersion construct the natural !→+ map using duality and adjunction; use its image in the holonomic heart. For a locally closed immersion compose an open and closed factorization; Kashiwara and the no-boundary-subquotient property prove independence.

The construction has the following API.

- j†j_!*E≅E in degree zero, using the codimension normalization for the locally closed immersion.
- The no-boundary-subquotient condition characterizes j_!*E among extensions.
- Simple E has simple intermediate extension.
- 𝔻(j_!*E)≅j_!*(𝔻E).

**Checks.**

- For j=id, j_!*E=E.
- For G_m↪A¹, j_!*O_(G_m)=O_A¹, while j_+O_(G_m)=O_A¹[x⁻¹] has an extra boundary quotient.
- For {0}↪A¹, intermediate extension of k is δ₀.
- Computed values for identity; G_m in A¹; point in A¹: E→E; j_!*O=O and O[x⁻¹]/O=δ gives extra boundary quotient for j_+; point extension δ.

*Needs:* §9.1; §9.2; §9.4; §9.5.

### 9.7 Regular holonomic D-modules

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. An integrable connection is regular if every restriction to a smooth locally closed curve has, at every boundary point of a smooth projective completion, a logarithmic lattice. A simple holonomic module is regular if it is j_!* of a simple regular connection on a smooth locally closed support. A holonomic module is regular when all its simple factors are regular. Use geometric regularity after algebraic closure for general k; its descent and stability are separate inputs. (BHS19, §2.4, p. 321 (BHS19 line 885); M23, Definitions 7.25, 7.30 and 7.32, pp. 93–94 (M23 line 4756)).

Prove stability under duality, smooth pullback and the intermediate extensions used below. First establish the stated complex-field theorem, then prove compatibility under algebraically closed characteristic-zero extensions and descend geometric regularity to arbitrary characteristic-zero k. This field comparison is a target, not an unmentioned embedding of k into C (M23 Theorem 7.33, pp. 93–94, M23 line 4848).

One proof route is as follows. For curves define a locally free lattice stable under logarithmic derivations. The condition is independent of the lattice and completion. Use the simple-module classification to transfer the curve condition to simple holonomic objects. Extend through finite composition series; Jordan–Hölder makes this independent of the series.

The construction has the following API.

- A flat bundle is regular exactly when it satisfies the curve logarithmic-lattice condition.
- Regularity is equivalent to regularity of all composition factors.
- Regular holonomic modules are closed under extensions and subquotients.
- The chosen geometric regularity is invariant under algebraically closed characteristic-zero extension; its descent to arbitrary characteristic-zero k is proved in this subsection and consumed by §9.9.

**Checks.**

- O_A¹ with its trivial connection is regular.
- δ₀ is regular, as the intermediate extension of the connection on a point.
- The rank-one connection ∂e=e on A¹ is holonomic but irregular at infinity: it has no logarithmic lattice there.
- Computed values for trivial connection; delta; exponential connection: regular; regular; ∂e=e has at infinity t=1/x form −dt/t², pole order 2>1.

*Needs:* §9.4; §9.6; §9.1; §9.5.

### 9.8 Strong algebraic equivariance

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. H is a smooth algebraic k-group acting on Y. For a smooth algebraic group H acting on Y, a strongly H-equivariant D-module is a D-module M with a D_(H×Y)-linear isomorphism a^*M≅p^*M on H×Y satisfying the identity and cocycle compatibilities. Equivalently, its underlying weak H-linearization is compatible with the D_Y-action and its differentiated H-action equals the infinitesimal action from D_Y. Both a and p are smooth of relative dimension dim H; a* and p* mean their abelian pullbacks Lf*=f†[−dim H]. Weak equivariance without this differentiated compatibility is insufficient. (EH18, §4.3.1, p. 63, Definition 4.10 and the preceding paragraph, EH18 lines 1725–1740, for a general smooth variety with algebraic group action over an algebraically closed characteristic-zero field; the arbitrary-field comparison is the target below. BHS19, §2.4, p. 321 and Lemma 2.4.8, p. 324, BHS19 lines 891–910 and 1033–1048, give the flag applications).

One proof route is as follows. Use smooth inverse image to formulate the descent isomorphism and impose the unit and multiplication diagrams. Prove the equivalence with weak linearization plus equality of the differentiated and vector-field actions: in smooth local coordinates on H the additional D_(H×Y)-linearity is precisely compatibility in the H-derivation directions. Translate the identity calculation to every H-point and descend the equality of sheaf maps. Prove compatibility with arbitrary characteristic-zero field extension and faithful descent: smooth pullback, derivations and the cocycle diagrams base change, and equality and invertibility of their maps are detected faithfully. This supplies the arbitrary-field and smooth-group formulation, including nonconnected H, beyond the algebraically closed source convention.

The construction has the following API.

- The isomorphism satisfies the identity and multiplication cocycles on H×H×Y.
- The Lie(H)-action equals the action through its image in T_Y⊂D_Y.
- A subgroup H′⊂H gives a strongly H′-equivariant object.
- For coherent M, Ch(M) and the all-component CC(M) of §8.6 are invariant under the cotangent H-action.

**Checks.**

- For H={1} acting on A¹, M=D_A¹ is strongly equivariant and coherent: its cycle is [A²] and its invariance reads [A²]=[A²], even though it is not holonomic.

- On a point with connected H=G_m, only trivial algebraic H-representations give strongly equivariant D-modules; nonzero weights fail differentiated compatibility.
- For H={1}, the equivariant category is the original D-module category.
- O_Y with its natural action and derivations is strongly H-equivariant.
- Computed values for G_m on point weights 0,1; trivial group: differentials 0 and 1 against zero tangent action: 0=0, 1≠0; trivial group has identity cocycle.

*Needs:* §9.1; §8.1; §9.7; ReductiveGroups Layer 2.

### 9.9 Moment-map support and orbit classification

k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. H is smooth. The finite-orbit simple classification is asserted over an algebraically closed field with geometrically connected stabilizers; the moment-support inclusion needs neither restriction. General-field comparisons use the field descent of regularity from §9.7 and the equivariant descent proved below. For a strongly H-equivariant coherent D_Y-module M, Ch(M) lies in the zero fibre of the cotangent moment map μ_H:T*Y→Lie(H)*. Over an algebraically closed k, when H acts with finitely many orbits and geometrically connected stabilizers on Y, the simple objects of the category of strongly H-equivariant regular holonomic modules, which for connected H are the D_Y-simple strongly equivariant modules, are exactly the intermediate extensions of trivial rank-one connections on individual orbits. For the diagonal G-action on F×F their reduced characteristic support lies in the signed Steinberg variety. (BHS19, §2.4, p. 321; proof of Theorem 2.4.7, p. 323 (BHS19 line 885); M23, Theorems 6.79 and 6.83, pp. 73–77; Theorem 7.33, p. 94 (M23 line 3683)).

Also prove equivariant smooth descent with its identity and cocycle comparisons, and the component-group classification of strongly equivariant connections on an orbit. Over a general split k, show that the trivial orbit connection and its simple intermediate extension descend with their prescribed trivial stabilizer character; this is the field comparison used by §10.4.

One proof route is as follows. Choose an equivariant good filtration locally. Differentiated compatibility makes infinitesimal orbit vector fields act on gr M with zero principal symbol; hence their moment functions annihilate the support. On a transitive orbit, strong equivariance identifies equivariant connections with representations of the stabilizer component group. Connected stabilizers give only trivial simples. Use intermediate extension and finite-length induction. Apply the moment-map assertion to the diagonal G-action on F×F and use the signed conormal description of Z. The separate induction equivalence is constructed in §10.3.

**Checks.**

- For the diagonal action on P¹×P¹ there are exactly two orbits with connected stabilizers. Their trivial rank-one connections yield the two equivariant simples, whose characteristic supports are in the signed Steinberg variety.
- For H=Z/2 swapping the two points of Y=Spec k⊔Spec k there is one orbit with trivial stabilizer; its trivial connection O_Y=k⊕k is the unique simple equivariant object, yet it is not a simple D_Y-module, since δ at either point is a D_Y-submodule that is not H-stable. For connected H, strong equivariance is a property of the underlying D_Y-module inherited by D_Y-submodules, so the two readings agree.
- Computed values for G_m on point; SL₂ double flags: weight 1 rejected; two orbits and two trivial rank-one orbit simples; moment on signed pair −ψ+ψ=0.

*Needs:* §9.8; §9.7; §9.6; §6.3; §6.6; §1.1; ReductiveGroups Layer 7.

### Examples

On a point with H=G_m, the representation of weight 1 is weakly but not strongly equivariant: its differentiated action is 1 while the vector-field action is 0. For the diagonal action of SL₂ on P¹×P¹ there are two orbits with connected stabilizers, hence two equivariant simple objects, O_(P¹×P¹) and the direct image of O_(P¹) along the diagonal, with characteristic cycles [Z_s] and [Z_e] in the signed Steinberg variety.

### Dependencies

AlgebraicVectorBundles L0A–L0C; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4 and the derived-bimodule contract; Mathlib `DerivedCategory`; Mathlib `Module.length_eq_add_of_exact`; ReductiveGroups Layer 2; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 10: Flag localisation and category O

### 10.1 D-affinity of the flag variety

char(k)=0; G is split connected reductive, F=G/B, χ₀ is the central character at highest weight 0. In characteristic zero the ordinary sheaf D_F has Γ(F,D_F)≅U(g)⊗_(Z(U(g)),χ₀)k=:U_χ₀, where χ₀ is the infinitesimal character of the trivial representation. Every O-quasi-coherent D_F-module is generated by its global sections and has vanishing H^i(F,M) for i>0. In the Beilinson–Bernstein parameter χ, ordinary D_F is χ=ρ, not χ=0; χ₀ denotes a central character, not this twisting parameter. (BHS19, §2.4, p. 321 (BHS19 line 885); ElliottBB, Theorem 1 and §4, pp. 6–10 (ElliottBB lines 174, 227 and 270)).

Prove that the infinitesimal action U(g)→Γ(F,D_F) is surjective and its kernel is exactly the ideal generated by ker χ₀; an abstract algebra isomorphism without this map does not fix the convention. The filtered-section calculation, ample coherent twists and the projection to the selected regular dominant central summand are targets of this subsection. Use ReductiveGroups §§10A–10B to integrate the finite-dimensional modules at dominant λ∈X*(T), retaining their specified T-weights and the differential equal to the Lie action. Compare those supplied actions with the enveloping-algebra action in the projection argument. The lattice belongs to the actual isogeny form, not every integral weight of its simply connected cover. For a reductive centre, its infinitesimal vector field on F vanishes, so the strict trivial central character kills that summand (ElliottBB Theorem 1 and §4, pp. 6–10, ElliottBB lines 174 and 227; BHS19 line 891).

One proof route is as follows. The infinitesimal G-action gives U(g)→Γ(D_F); the Harish–Chandra character computes its central kernel. The filtered global-section calculation identifies the quotient with all global operators. Use the integration/differentiation maps of ReductiveGroups §§10A–10B for the selected dominant weights in X*(T), and compare their actions with the localisation tensor functors. For D-affinity use ample weights, Serre vanishing on coherent generating submodules, filtered-colimit compatibility, tensoring with finite-dimensional highest-weight modules and projection to the regular dominant central summand. Serre vanishing is applied to each coherent submodule with its own sufficiently large twist, not uniformly to every quasi-coherent O-module (ElliottBB, section 4, pp. 9–10, ElliottBB lines 275–312). Keep the two rho normalizations explicit, including for groups where rho is not an integral character. Use SchemeAndStackFoundations §§0.4 and 2.6 for coherent extension and Serre vanishing; prove the filtered section calculation in this subsection.

**Checks.**

- For SL₂, the dominant weight ω gives the two-dimensional representation although X*(SL₂)=0. For PGL₂, ω is absent from X*(T), whereas 2ω is present and gives its three-dimensional representation. Ample flag weights can be chosen in this actual lattice.

- For SL₂, ordinary D_(P¹) uses BB parameter ρ and the Casimir central character of the trivial module. For a torus its global differential algebra after this central reduction is k.
- Computed values for torus; SL₂; trivial module: ΓD=k after centre generator z→0; parameter ρ not 0; localisation of trivial module O_F has Γ=k and higher cohomology 0.

*Needs:* ReductiveGroups §§10A–10B; §1.1; §1.2; §8.1; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 4; RepresentationTheory/LieHighestWeight Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### 10.2 Beilinson–Bernstein localisation

The hypotheses and central-character conventions of §10.1 hold. Define Loc(M)=D_F⊗_(U_χ₀)M, with the tensor sheafified, for a U_χ₀-module M. The functors Loc and Γ(F,−) are mutually inverse exact equivalences between U_χ₀-modules and O-quasi-coherent D_F-modules. They restrict to finitely generated modules and coherent D_F-modules. This is localisation at a strict central reduction, not merely a generalized central character. (BHS19, §2.4, p. 321, displayed localisation equivalence (BHS19 line 885); ElliottBB, Theorem 2 and §4, pp. 7–10 (ElliottBB lines 234–260)).

One proof route is as follows. Use the global U_χ₀-action on D_F to construct the tensor functor. The natural unit and evaluation counit form an adjunction. For split reductive g, use the derived semisimple algebra and the prescribed scalar action of the centre; this extension of the semisimple supplier Verma/central-character interfaces is retained in §§10.4 and 12.1. D-affinity makes Γ exact and conservative, while global generation makes the counit surjective. Apply the same argument to its kernel and to presentations by free modules to prove both unit and counit are isomorphisms.

The construction has the following API.

- Loc(M) is the displayed sheaf tensor, with left D_F-action on the first factor.
- M≅Γ(F,Loc(M)) naturally.
- Loc(Γ(F,N))≅N naturally for quasi-coherent D_F-modules.
- Loc and Γ preserve short exact sequences and identify the finite/coherent subcategories.

**Checks.**

- For a torus F=point and U_χ₀=k, so localisation is the identity on vector spaces.
- Loc of the trivial g-module is O_F with its standard D-action.
- For a torus with generator z, k[z]/z² has generalized character zero but is not a U_χ₀-module; extending the stated equivalence to it would fail.
- Computed values for torus; trivial representation; generalized torus character: Loc(V)=V; Loc(k)=O_F; on k[z]/z² multiplication z is nonzero, whereas strict reduction requires z=0.

*Needs:* §10.1; §8.1; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 7.

### 10.3 Induction from one flag to two flags

char(k)=0; G is split connected reductive with the fixed B and F=G/B. For a strongly B-equivariant regular holonomic D_F-module E, pull E to G×F and descend it along the free B-action (g,hB)·b=(gb,b⁻¹hB). This defines Ind(E) on G×ᴮF≅F×F, [g,hB]↦(gB,ghB), strongly equivariant for diagonal G. Use abelian smooth pullbacks Lf* in this descent; Ind is an exact equivalence. Its inverse is the noncharacteristic restriction Li* to the fibre i:{eB}×F→F×F, equivalently i†[N]. This restriction is exact on these equivariant objects. (BHS19, Remark 2.4.3 and Proposition 2.4.4, pp. 321–322 (BHS19 line 885)).

One proof route is as follows. The B-equivariant cocycle is exactly the descent datum on G×F. Smooth descent supplies the D-module and its diagonal G-action. Restriction to the base fibre recovers the original cocycle. Pullback to the torsor makes both unit and counit identities; descend these comparisons. Use smooth characteristic-support comparison and the signed cotangent embedding to identify induced conormal supports. Regularity and its field descent are the targets of §§9.7 and 9.9.

The construction has the following API.

- Pulling Ind(E) to G×F recovers the pullback of E on the second factor with its B-descent datum.
- Noncharacteristic restriction Li*=i†[N] to {eB}×F is an inverse equivalence.
- Ind preserves short exact sequences and simple objects.
- The induced characteristic support is obtained by the corresponding G×ᴮ construction and lies in the signed Steinberg variety.

**Checks.**

- For a torus both flag spaces are points and Ind is the identity.
- Ind(O_F)=O_(F×F), whose characteristic cycle is the zero section Z_(w₀).
- The delta module at eB on F induces to the direct image of O_F along the diagonal F→F×F, with characteristic cycle [Z_e]; it does not stay supported at one double flag.
- Computed values for torus; O_F; delta at eB: identity; O_(F×F) with zero-section Z_w₀; delta induces diagonal direct image with conormal Z_e.

*Needs:* §9.8; §9.7; §9.9; §1.1; §6.3; §9.5.

### 10.4 Principal category O and equivariant localisation

char(k)=0; central reduction is strict at χ₀; dot action is w·λ=w(λ+ρ)−ρ. Let O_χ₀ consist of finitely generated U_χ₀-modules, t-semisimple with finite-dimensional weight spaces and locally finite b-action. Its weights lie in the integral principal block. Write M_w=M(ww₀·0)=M(−wρ−ρ), and L_w for its simple quotient. Localisation identifies O_χ₀ with strongly B-equivariant regular holonomic D_F-modules; the induction of §10.3 identifies the latter with strongly diagonal G-equivariant regular holonomic modules on F×F. The equivalence is exact and labels the simple for w by the orbit U_w. (BHS19, §2.4, p. 321, conventions for O₀ and M_w,L_w; Theorem 2.4.7, pp. 322–323 (BHS19 line 885); BHS19, Remark 2.4.3, p. 321 (BHS19 line 901)).

Construct the full strict central-reduced category as stated, and prove finite length and classification of its simple objects by W, before invoking any KL multiplicity. Form Verma/simple modules for g=z⊕[g,g] with the specified scalar character on z by the native semisimple modules and their universal property. Prove that principal weights lie in the character lattice, that the B-action integrates with its prescribed differential, and that localisation restricts to the strongly B-equivariant regular holonomic category with the displayed orbit labels. The character-lattice assertion applies to w·0 even when ρ itself is not a character (BHS19 §2.4, pp. 320–321, BHS19 line 874).

One proof route is as follows. Use the definition, finite-length highest-weight classification and algebraic B-action established in this subsection, without using KL multiplicities. Prove compatibility of localisation and algebraic subgroup actions to restrict the equivalence. Finite B-orbits give holonomicity; regularity and field descent require the specified §§9.7 and 9.9 input. Fix the labels using the ordinary D-sheaf and the weight −wρ−ρ, then induce to the double flag space. The labels are checked in rank one before any matrix is imported.

The construction has the following API.

- The inclusion in U_χ₀-modules is full, and kernels and cokernels of its morphisms retain the finite-generation, weight-space and locally finite Borel conditions.
- The chosen Verma generator has weight −wρ−ρ and its unique simple quotient is L_w; the centre acts by χ₀ on both.
- Every nonzero simple object is isomorphic to one and only one L_w; every object has a finite composition series, with its actual Jordan–Hölder multiplicities.
- The localisation and induction equivalences restrict to these categories and preserve short exact sequences, simple labels and composition multiplicities.

**Checks.**

- For SL₂, M_e=M(−2ρ) is simple and M_s=M(0) has the two simple factors L_e and L_s, with L_s the trivial representation. Under double-flag induction L_e labels the diagonal and L_s the full flag-pair support.
- Computed values for SL₂ labels e,s; torus: M_e=M(−2ρ)=L_e; M_s=M(0) has L_e+L_s and L_s=k; torus only weight 0 in strict block.

- The zero module lies in the strict category with no weights and zero length. For a torus, k[z]/z² has generalized character zero but z acts nontrivially, so it is excluded; its semisimple quotient k lies in the category.


*Needs:* §10.2; §9.9; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 7; ReductiveGroups Layer 7; §10.3.

### Examples

For SL₂ the principal block has the Verma modules M_e=M(−2ρ), which is simple and equals L_e, and M_s=M(0), with simple factors L_s=k and L_e. Localisation sends L_s to O_(P¹) and L_e to the delta module at the B-fixed point; induction to P¹×P¹ sends these to O_(P¹×P¹) and the direct image of O_(P¹) along the diagonal. For a torus the strict block contains only weight 0, and k[z]/z² is excluded.

### Dependencies

ReductiveGroups §§10A–10B; ReductiveGroups Layer 7; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 4; RepresentationTheory/LieHighestWeight Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 11: The three integral cycle bases

### 11.1 The characteristic cycle of a Verma module

char(k)=0; M_w and all Weyl labels use the weight conventions of §10.4. With the preceding equivalence and induction understood, CC(M_w)=[X̄_w] in Z_(2N)(Z), for every w∈W. The right side is the scheme theoretic zero-fibre cycle with its generic multiplicities, not [Z_w]. (BHS19, Proposition 2.4.6, p. 322 (BHS19 line 927); BR12, §1.1, p. 539 (BR12 lines 191–195); Proposition 2.14.2 and proof, pp. 574–575 (BR12 lines 1703–1730)).

Over k=C, take the complex points of Z through the scheme analytification of ComplexComparisonPartII §C-1.1. Realize Z(C) as the complement of a closed semialgebraic boundary in the compact real algebraic set obtained from a projective embedding of F×F×P(g⊕k); triangulate that compactification compatibly with the boundary and with every component closure by AffineMorseLefschetz A4.1, and define rational Borel–Moore homology, its proper pushforward and open restriction by AffineMorseLefschetz A4.0, which also identifies H^BM of the open complement with the homology of the compact pair. For an irreducible component C of complex dimension d, the singular locus and the boundary have real dimension at most 2d−2, the smooth locus is a connected complex manifold oriented by its complex structure, and A4.0's fundamental cycle gives [C]∈H^BM_(2d). Prove that H^BM_(4N)(Z(C),Q)=⊕_w Q[Z_w], and construct the comparison from the finite free component group to this group; injectivity follows from this basis. Prove the Weyl-action/convolution comparison that sends w to the localised Verma cycle and the coadjoint zero-fibre kernel labelled w⁻¹. Translate the inverse labels and use the invariant form. For arbitrary characteristic-zero k, spread the finite construction to a finitely generated Q-algebra, compare after a faithfully flat field extension and show generic-length coefficients are preserved. These top-degree and base-field comparisons are proof targets of this subsection, not assumptions equating arbitrary cycles (BR12 §2.14, pp. 574–575, BR12 line 1703). The Weyl action on top Borel–Moore homology and its identification w↦CC(M̃_w) are Ginzburg's (G86, §§5–6, Proposition 5.3, cited by locator) and Kashiwara–Tanisaki's (KT84, §§2 and 5.5, cited by locator); the image of a simple reflection is the class of Z′_s by Riche (R08, Proposition 6.2.2, p. 164, R08 line 1564); BR12 Proposition 2.14.2 combines these inputs with Theorem 2.2.1 (BR12 lines 1713–1730).

One proof route is as follows. Compare BR coadjoint and BHS adjoint resolutions with the invariant form. BR labels its orbit by w⁻¹, so Proposition 2.14.2 evaluated on M_w has closure label w⁻¹ in BR and label w here. BR12 Proposition 2.14.2 derives the equality in top Borel–Moore homology from Theorem 2.2.1 and the Ginzburg/Kashiwara–Tanisaki identification of Q[W] with H^BM_top(Z) sending w to CC(M̃_w) and a simple reflection s to [Z′_s]; that identification and the convolution comparison are proof targets of this subsection, with G86, KT84 and R08 as their references. In top degree the fundamental classes of the components form a rational basis. The integral free component group injects, so equality of its images gives the integral cycle equality. The convolution and top-homology comparison is a proof target of this subsection. For arbitrary characteristic-zero k, spread the finite presentation data to a finitely generated Q-algebra, compare on a complex fibre, and descend the component-coefficient equality by faithful field extension and generic-length compatibility.

**Checks.**

- For SL₂ the Verma M_s has cycle [Z_e]+[Z_s], whereas its simple quotient L_s has cycle [Z_s]. This separates the scheme zero fibre from the single conormal component.
- Computed values for SL₂ e,s; torus: CC(M_e)=(1,0); CC(M_s)=(1,1); torus sole coefficient 1.
- For SL₂, Z(C) has two components of complex dimension 2=2N, so H^BM_4(Z(C),Q)=Q² with basis [Z_e],[Z_s]. Ordinary homology cannot replace it: H₄(T*P¹,Q)=0 because T*P¹ retracts to P¹, whereas its Borel–Moore fundamental class spans H^BM_4(T*P¹,Q)=Q.

*Needs:* §10.4; §7.3; §7.4; §8.6; §4.2; AffineMorseLefschetz A4.0 and A4.1; ComplexComparisonPartII §C-1.1.

### 11.2 Triangularity of simple characteristic cycles

char(k)=0; the regular strongly equivariant simple modules and their Weyl labels are those of §10.4, transported to F×F by the induction equivalence of §10.3. Write ℒ_w=CC(L_w)=Σ_v a_(w,v)[Z_v]. Then a_(w,v)∈N, a_(w,w)=1, and a_(w,v)=0 unless v≤w. If v<w and Ū_w is smooth at every point of U_v, then a_(w,v)=0. These conclusions do not say that ℒ_w is irreducible. (BHS19, Theorem 2.4.7(iii), pp. 322–323 (BHS19 line 927)).

One proof route is as follows. The simple object is the intermediate extension of the trivial connection on U_w, so its support is Ū_w and its generic rank on that orbit is one. Conormal support and generic lengths give nonnegative coefficients, Bruhat support and diagonal coefficient one. If the closure is smooth near U_v, its simple extension is a rank-one smooth connection there; the conormal of a smaller stratum cannot occur.

**Checks.**

- For SL₂ both orbit closures are smooth, so ℒ_e=[Z_e] and ℒ_s=[Z_s]; the off-diagonal simple coefficient vanishes even though the corresponding Verma coefficient does not.
- Computed values for SL₂ e,s and smooth orbit closures: a_e,e=a_s,s=1; a_s,e=a_e,s=0; simple cycles (1,0),(0,1).

*Needs:* §10.4; §10.3; §9.9; §9.6; §8.6; §6.6; §1.4.

### 11.3 The Kazhdan–Lusztig multiplicity theorem

Assume char(k)=0 and the principal category of §10.4 with its specified indexing. For w,v∈W put m_(w,v)=[M(ww₀·0):L(vw₀·0)]. Then m_(w,v)=P_(w₀w,w₀v)(1), so m_(w,w)=1 and m_(w,v)=0 unless v≤w; this is the Kazhdan–Lusztig multiplicity theorem for the principal block (BHS19 lines 881–884, which refer to Humphreys, *Representations of semisimple Lie algebras in the BGG category O*, §8.4). Consequently [X̄_w]=Σ_(v≤w)m_(w,v)ℒ_v. Both occurrences of w₀ in the polynomial indices are required. (BHS19, Theorem 2.4.7(ii) and its proof, p. 323, proof index with both longest-element prefixes (BHS19 line 974)).

Construct the equal-parameter Hecke algebra of the finite Weyl Coxeter system over Z[v,v⁻¹], v=q¹ᐟ², with normalized generators satisfying (T_s−v)(T_s+v⁻¹)=0, and prove that on each type-A factor S_n the generator-preserving map from TypeAHeckeAlgebras H1 with R=Z[v,v⁻¹] and q=v is an isomorphism. Construct its bar involution and the uniquely normalized KL basis, and the corresponding polynomials P_(x,y)(q), with P_(x,x)=1 and P_(x,y)=0 unless x≤y. Prove the principal algebraic category O composition-multiplicity theorem at the actual weights of §10.4, together with the two comparisons its proof route uses. First, over k=C, construct the de Rham functor DR from strongly B-equivariant regular holonomic D_F-modules to complexes on F(C) constructible along the Schubert cells C_v=BvB/B, normalized by DR(O_F)=C_(F(C))[N]; prove that it is exact for the perverse t-structure and faithful, that it commutes with the extensions j_!, j_* and j_!* along the inclusion of each cell, and that it carries the trivial connection on C_v to the shifted constant sheaf C_(C_v)[ℓ(v)]. Second, prove the Kazhdan–Lusztig stalk theorem: for x≤y and a point of C_x, the stalk cohomology of the intersection complex of the Schubert variety X_y=closure of C_y vanishes in degrees of parity different from ℓ(y), and its dimensions are the coefficients of P_(x,y), so that the Poincaré polynomial of the stalk in degrees −ℓ(y)+2i is P_(x,y)(q) with q=t² (Kazhdan and Lusztig, *Schubert varieties and Poincaré duality*, Proc. Sympos. Pure Math. 36 (1980), 185–203, cited by bibliographic data). The multiplicity theorem is a separate target in this subsection, with its full principal-block hypotheses; it is not deduced from the Springer-cycle identity. For the cycle consequence, use a composition series and characteristic-cycle additivity to get the displayed identity. The multiplicity theorem precedes this cycle application and does not take the cycle identity as a hypothesis (BHS19 §2.4 and Theorem 2.4.7(ii), pp. 320–323, BHS19 line 882).

For the multiplicity theorem one proof route is Beilinson–Bernstein's and Brylinski–Kashiwara's. Reduce to k=C by the field comparisons of §§9.7, 9.9 and 10.4. Under §10.4, L_v is the intermediate extension of the trivial connection on C_v and the localised M_w is its !-extension from C_w; the de Rham functor carries them to the intersection complex IC(X_v) and to j_!C_(C_w)[ℓ(w)], so [DR M_w]=Σ_v m_(w,v)[IC(X_v)] in the Grothendieck group of complexes constructible along the cells. The stalk Euler characteristic of IC(X_v) along C_u is (−1)^ℓ(v)P_(u,v)(1), and that of j_!C_(C_w)[ℓ(w)] is (−1)^ℓ(w)δ_(u,w); hence Σ_v m_(w,v)(−1)^(ℓ(u)+ℓ(v))P_(u,v)(1)=δ_(u,w), and the inversion formula Σ_z(−1)^(ℓ(x)+ℓ(z))P_(x,z)P_(w₀y,w₀z)=δ_(x,y) for KL polynomials gives m_(w,v)=P_(w₀w,w₀v)(1). For the de Rham comparison, apply Deligne's equivalence of ComplexComparisonPartII C5.6 on each cell, where a strongly B-equivariant connection is trivial because the stabilizers of B on F are connected, and glue along the finite stratification with Kashiwara's equivalence (§9.2) and intermediate extension (§9.6). For the stalk theorem, spread the Schubert varieties out to a finite field F_q: the traces of Frobenius on the stalks of the ℓ-adic intersection complexes define elements of the Iwahori–Hecke algebra of B(F_q)-biinvariant functions on G(F_q) that are fixed by the bar involution and satisfy the degree bounds characterizing the KL basis; the purity of intermediate extensions (EtaleDualityAndPerverseSheaves §5.3), with the contracting torus action on a transversal slice to each cell, makes every stalk pure, so the traces determine the dimensions, and EtaleDualityAndPerverseSheaves §3.5 transfers them to F(C).

For the cycle consequence, apply the exact localisation and induction equivalences of §§10.3–10.4 and the additivity of characteristic cycles (§9.5) to a composition series of M_w, and use the Verma-cycle theorem of §11.1, which is proved independently. No KL fact is used to construct localisation itself.

The construction has the following API.

- The normalized Weyl KL polynomials have P_(x,x)=1, vanish when x is not ≤y, and have nonnegative integer coefficients.
- The actual composition multiplicity for the fixed principal weights is P_(w₀w,w₀v)(1), with diagonal 1 and zero outside v≤w.
- The Verma-cycle expansion is the finite sum of these multiplicities times the simple cycles; no matrix is postulated independently of its modules.

**Checks.**

- For W={e,s}, m_(s,e)=1, m_(e,s)=0 and both diagonal entries are 1. The unprefixed P_(w,v)(1) reverses this support test.
- For W=S₃ the Weyl Hecke algebra and TypeAHeckeAlgebras H₃(v) both have two generators, one braid relation, the same quadratic relations and rank 6; at v=1 both become Z[S₃]. A comparison sending T_s to −T_s would preserve the braid relation but not (T_s−v)(T_s+v⁻¹)=0.
- Computed values for A₁ e,s; A₃ polynomial in BR example: M=((1,0),(1,1)); P_s,e=0 and P_e,s=1; BR P_(s₂,s₂s₁s₃s₂)(1)=1+1=2.

- For the A₃ example w=s₂s₁s₃s₂ and y=s₂, P_(y,w)(q)=1+q has values 1 at q=0, 2 at q=1 and 3 at q=2. Only q=1 is the composition multiplicity used in this theorem; replacing the polynomial by its constant term loses that multiplicity (BR12 Remark 2.14.3, p. 575, BR12 line 1756). In the stalk theorem the same polynomial says that the intersection complex of X_w has one-dimensional stalk cohomology in two degrees two apart along the cell of s₂, whereas the shifted constant sheaf has it in one degree; X_w is singular there.
- For SL₂ the de Rham functor sends O_F to C_(P¹)[1], the delta module at the B-fixed point to the skyscraper C in degree 0, and the localised M_s, the !-extension of O from the big cell A¹, to j_!C_(A¹)[1], whose stalk at the fixed point is 0. With IC(X_s)=C_(P¹)[1] and IC(X_e) the skyscraper, the stalk Euler characteristics at the fixed point give m_(s,e)·1+m_(s,s)·(−1)=0 and m_(s,s)=1, so m_(s,e)=1=P_(e,s)(1). Normalizing DR without the shift [N] would put O_F in degree 0 and give the wrong signs.

*Needs:* §11.1; §11.2; §10.3; §10.4; §9.2; §9.5; §9.6; §9.7; §9.9; ReductiveGroups Layer 7; TypeAHeckeAlgebras H1; ComplexComparisonPartII §C-1.1 and C5.6; EtaleDualityAndPerverseSheaves §§3.5 and 5.3; the Hecke/KL, de Rham and stalk constructions of this subsection.


### 11.4 The three integral cycle bases

char(k)=0. The three families ([Z_w])_(w∈W), (ℒ_w)_(w∈W), and ([X̄_w])_(w∈W) are Z-bases of Z_(2N)(Z). The simple-to-component matrix is A=(a_(w,v)); the zero-fibre-to-simple matrix is M=(m_(w,v)); each is lower unitriangular in any linear extension of Bruhat order. In particular all changes are integral, not just rational. (BHS19, Theorem 2.4.7(i)–(iii), pp. 322–323 (BHS19 line 927)).

One proof route is as follows. The component family is the defining free basis. Choose a linear extension of the finite Bruhat poset. Each of A and M is identity plus a strictly triangular nilpotent integer matrix; its inverse is the finite alternating sum of powers of the nilpotent part. Transport the free basis successively. For W of order two both A and M have diagonal entries one, which also checks the orientation of the transition formula.

**Checks.**

- For SL₂ the component and simple bases coincide, while the zero-fibre basis is [Z_e], [Z_e]+[Z_s]. The transition has integral determinant 1 and inverse with one negative off-diagonal entry.
- Computed values for A₁; torus: A=identity; M=((1,0),(1,1)), det=1 and inverse ((1,0),(−1,1)); torus matrix (1).

*Needs:* §7.1; §6.6; §11.2; §11.3.

### Examples

For SL₂ the three bases of Z₂(Z) are the component basis ([Z_e],[Z_s]), the simple basis (ℒ_e,ℒ_s)=([Z_e],[Z_s]) and the zero-fibre basis ([Z_e],[Z_e]+[Z_s]); the transition matrix M=((1,0),(1,1)) has determinant 1 and integral inverse ((1,0),(−1,1)). For a torus all three bases are the single point class.

### Dependencies

AffineMorseLefschetz A4.0 and A4.1; ComplexComparisonPartII §C-1.1 and C5.6; EtaleDualityAndPerverseSheaves §§3.5 and 5.3; ReductiveGroups Layer 7; TypeAHeckeAlgebras H1; the Hecke/KL, de Rham and stalk constructions of §11.3. Internal inputs are the precise subsections cited in each needs line.

## Layer 12: Parabolic saturation of simple cycles

### 12.1 The parabolic attached to a simple module

char(k)=0; the algebraic weights lie in X*(T) and use its differential in t* and the fixed dot action. For λ_w=ww₀·0=−wρ−ρ define I_w={α simple positive:⟨λ_w,α∨⟩≥0}, and P_w the standard parabolic generated by B and the negative root subgroups for I_w. It is the largest standard parabolic whose Levi has λ_w dominant. The highest-weight action on L_w extends to an algebraic P_w-action compatible with the Lie action. (BHS19, Lemma 2.4.8 and preceding paragraph, p. 324 (BHS19 line 1023)).

Establish the highest-weight integrability criterion: for a simple highest-weight module whose highest weight λ belongs to X*(T), the negative simple-root operator f_α is locally nilpotent exactly when ⟨λ,α∨⟩≥0. The forward implication on the Killing-semisimple derived algebra is the pinned `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg`, and local finiteness over the sl₂-triple of α is the pinned `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple`; transport both along the reductive decomposition of RepresentationTheory/LieHighestWeight Layer 9, the centre acting by scalars so that L_w stays irreducible over the derived algebra with the same highest-weight vector. Prove the converse here: if ⟨λ,α∨⟩=−m<0, then e_α f_α^(k+1)v=(k+1)(−m−k)f_α^k v for the highest-weight vector v, a nonzero multiple for every k≥0, so by induction no power of f_α kills v. For any set I of simple roots with ⟨λ,α∨⟩≥0 for every α∈I, prove that these locally nilpotent operators and the B-action integrate uniquely to P_I, compatible with the Lie action and the given T-characters. The largest such I gives the indicated standard parabolic. The underlying module is a rational, possibly infinite-dimensional representation: local finiteness of the parabolic action, rather than finite-dimensionality of L_w, is the required property (BHS19 Lemma 2.4.8 proof, pp. 323–324, BHS19 line 1011).

One proof route is as follows. Use the simple-root inequalities to define I_w and the existing standard parabolic construction. Consume the pinned local-nilpotence and sl₂-local-finiteness theorems for α∈I_w and prove the converse for α∉I_w by the string computation above, so that f_α is locally nilpotent exactly for α∈I_w. Together with the B-action it integrates to P_w; compatibility on root subgroups gives uniqueness. This extension is proved in this subsection.

The construction has the following API.

- The Levi simple roots are exactly those with ⟨−wρ−ρ,α∨⟩≥0.
- A standard parabolic P_I has dominant λ_w on its Levi iff I⊂I_w.
- L_w has a compatible algebraic P_w-action extending its B-action.
- P_w contains the fixed B, using negative root groups for the chosen Levi roots.

**Checks.**

- For SL₂, λ_e=−α pairs to −2 and integrates to B although it is not a character of SL₂; λ_s=0 pairs to 0 and integrates to G. For PGL₂, ω is excluded from X*(T) but −α=−2ω and 2ω are included.

- For SL₂ and w=e, λ=−2ρ, so I_e=∅ and P_e=B.
- For SL₂ and λ=0 the pinned theorem gives a power of f annihilating every vector of L(0)=k, where in fact f v=0. For λ=−2ρ=−α the hypothesis ⟨λ,α∨⟩∈ℕ fails, and the converse computation e f^(k+1)v=(k+1)(−2−k)f^k v≠0 shows that f^k v≠0 for every k on M(−2ρ)=L(−2ρ). For SL₃ and λ=−2ρ+α₁, with pairings 0 and −3, the pinned theorem applies to α₁ alone, although λ is not dominant.
- For SL₂ and w=s=w₀, λ=0, so P_s=G.
- For a torus there are no simple roots and P_e=B=G.
- Computed values for SL₂ e,s; torus: pairings −2,0 give I_e=∅, I_s={α}; P_e=B, P_s=G; torus P=G.

*Needs:* ReductiveGroups Layer 7; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 4; RepresentationTheory/LieHighestWeight Layer 9; `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg`; `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple`; §10.4; §10.4 and the integrability construction of this subsection.

### 12.2 Partial-flag saturation of simple cycles

char(k)=0; ℒ_w is the positive cycle of the simple with highest weight ww₀·0, viewed in F×F×g through the signed embedding of Z. Let π_w:F→G/P_w be the parabolic quotient map and f_w=π_w×id:F×F→G/P_w×F, a smooth morphism of relative dimension dim P_w/B. There is a strongly diagonal-G-equivariant regular holonomic module E_w on G/P_w×F with Ind(Loc L_w)≅f_w*E_w, the abelian smooth pullback. For a smooth morphism f:Y→Y′ of smooth separated finite-type k-schemes and a coherent D_Y′-module M, CC(f*M)=φ_*(pr*CC(M)), where pr:Y×_Y′T*Y′→T*Y′ is the projection and φ:Y×_Y′T*Y′→T*Y is the closed immersion given by the transpose of df; every component of pr⁻¹(C) receives the coefficient of C. Consequently ℒ_w=φ_*pr*CC(E_w), and every Z_v with a_(w,v)>0 is saturated along the fibres of π_w on the first flag: if (g₁B,g₂B,ψ)∈Z_v and p∈P_w, then (g₁pB,g₂B,ψ)∈Z_v. Equivalently, the slice of Z_v over the first flag eB is stable under (eB,F₂,ψ)↦(eB,pF₂,Ad(p)ψ) for p∈P_w. Left translation p·(F₁,F₂,ψ)=(pF₁,F₂,ψ) of the first flag alone by the standard P_w does not preserve ℒ_w in general. (BHS19, Lemma 2.4.8 and Remark 2.4.9, p. 324 (BHS19 lines 1017–1061), whose first-flag left-translation form is replaced by this saturation form; M23, Example 6.11, pp. 45–46 (M23 line 2226), for the local coordinates of a smooth morphism).

One proof route is as follows. The extended P_w-action of §12.1 makes Loc L_w strongly P_w-equivariant on F. Hence G×ᴮ(Loc L_w) descends along G×ᴮF→G×^(P_w)F≅G/P_w×F, [g,hB]↦(gP_w,ghB), to a strongly G-equivariant module E_w, and Ind(Loc L_w) is its smooth pullback by f_w; use the equivariant smooth descent of §9.9 and the contracted products of SchemeAndStackFoundations §1.16. For the cycle comparison take a good filtration of M; f*F_jM is a good filtration of f*M, and gr f*M is the pushforward by φ of the flat pullback pr*gr M, in the coordinates of M23 Example 6.11. Since pr is smooth, the generic fibre of pr over each component C is smooth, so the generic length at every component of pr⁻¹(C) equals that at C. In F×F×g coordinates, a covector pulled back from G/P_w at g₁P_w is represented by ψ∈Ad(g₁)u_(P_w), and Ad(g₁p)b⊂Ad(g₁)p_w for p∈P_w, so the same ψ represents the pulled-back covector at every g₁pB; this gives the saturation. The identification G×ᴮF≅F×F conjugates P_w by the first coordinate, so no action of the standard P_w on the second flag of all of F×F is an equivariance of Ind(Loc L_w).

**Checks.**

- For SL₂ and w=e, P_e=B and ℒ_e=[Z_e]. The point (ke₂,ke₂,0) lies in Z_e, while u=((1,1),(0,1))∈B sends it to (k(e₁+e₂),ke₂,0), which is not on the diagonal and so not in Z_e: first-flag left translation by P_e moves ℒ_e. The saturation statement is the identity here, because g₁pB=g₁B for p∈B.
- For SL₂ and w=s=w₀, P_s=G and ℒ_s=[Z_s] with Z_s=P¹×P¹×{0}; replacing the first flag by any flag fixes Z_s, as saturation predicts. Z_e is not saturated for G, consistent with a_(s,e)=0.
- For SL₃ with upper triangular B and w=s₁, λ=−2ρ+α₁ has pairings 0 with α₁∨ and −3 with α₂∨, so P_(s₁) is the stabilizer of the plane ⟨e₁,e₂⟩. The closure of U_(s₁) is the smooth locus P₁=P₂ of flag pairs with equal planes, so ℒ_(s₁)=[Z_(s₁)], and Z_(s₁)={(F₁,F₂,ψ): P₁=P₂=P, ψ(P)=0, ψ(k³)⊂P}, of dimension 4+2=6=2N. This set does not involve the lines of F₁, so it is saturated under changing the line of F₁ inside its plane. For p=1+E₁₃∈B and F₁ with plane ⟨e₂,e₃⟩, pF₁ has plane ⟨e₂,e₁+e₃⟩, so left translation leaves Z_(s₁).
- For a torus, P_e=B=G, F is a point and every statement is the identity.

*Needs:* §12.1; §11.2; §10.3; §10.4; §9.8; §9.9; §9.1; §8.6; §6.3; ReductiveGroups Layer 3 for the parabolic quotient G/P_w; SchemeAndStackFoundations §1.16.

### Examples

For SL₂, w=e: (ke₂,ke₂,0)∈Z_e is moved off Z_e by first-flag translation by ((1,1),(0,1))∈B, while saturation along G/B is the identity. For SL₃, w=s₁: Z_(s₁) depends only on the common plane and is saturated along G/P_(s₁).

### Dependencies

ReductiveGroups Layer 3; ReductiveGroups Layer 7; RepresentationTheory/LieHighestWeight Layer 3; RepresentationTheory/LieHighestWeight Layer 4; RepresentationTheory/LieHighestWeight Layer 9; SchemeAndStackFoundations §1.16; `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg`; `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple`. Internal inputs are the precise subsections cited in each needs line.

## Layer 13: Cartan graphs, completions and tangent spaces

### 13.1 The Cartan fibre product and its graphs

char(k)=0. Define 𝒯=t×_(t/W)t as a scheme. For w∈W let 𝒯_w be the graph {(z,w⁻¹z):z∈t}, with its reduced closed graph structure. The pair (κ₁,κ₂) defines κ:X→𝒯, and its restriction κ_w:X_w→𝒯_w is surjective. Graph labels use w⁻¹, consistently with the incidence relation. (BHS19, Beginning of §2.5 and Lemma 2.5.1, pp. 324–325 (BHS19 line 1023)).

One proof route is as follows. Factor (κ₁,κ₂) through the common invariant-polynomial quotient. Use the graph closed immersion and the established relation on X_w. The first graph projection is an isomorphism with t, and κ₁,w is surjective.

The construction has the following API.

- Two toral maps with equal quotient map lift uniquely to 𝒯.
- The first projection 𝒯_w→t is an isomorphism with inverse z↦(z,w⁻¹z).
- κ|_(X_w) factors through 𝒯_w and is surjective.
- The second projection of the graph is w⁻¹ applied to its first.

**Checks.**

- For SL₂, 𝒯=Spec k[x,y]/(x²−y²), with graphs y=x and y=−x.
- For a torus the quotient is t itself and 𝒯 is only the diagonal t.
- For the A₂ Weyl group and a 3-cycle w, the point (z,w⁻¹z) belongs to graph w; replacing w⁻¹ by w changes its graph at a generic z.
- Computed values for SL₂; torus; GL₃ cycle: ring k[x,y]/(x²−y²), graphs ±; torus diagonal; graph label sends (1,2,4)→(2,4,1), not (4,1,2).

*Needs:* §6.1; §5.1; §4.1; Mathlib `CategoryTheory.Limits.pullback`.

### 13.2 The components of the Cartan fibre product

char(k)=0; Chevalley invariant-polynomial theorem is available. The irreducible components of 𝒯 are the distinct smooth graphs 𝒯_w≅t. In characteristic zero 𝒯 is reduced and equidimensional of dimension r. The graphs may meet; no disjoint-union assertion is made. (BHS19, Lemma 2.5.1, p. 325 (BHS19 line 1062)).

One proof route is as follows. The finite quotient t→t/W separates W-orbits of geometric points, so the support is the union of the graphs. Generic points away from the reflecting hyperplanes distinguish them. Polynomial invariants give 𝒯 as r equations in smooth t×t with expected codimension r. It is therefore CM, and it is generically étale over t. CM plus generic reducedness gives reducedness.

**Checks.**

- In rank one the ring is k[x,y]/(x²−y²): its two reduced graphs intersect at zero. In the torus case there is only the diagonal graph.
- For SL₂ in characteristic zero, (x−y)(x+y) gives two distinct reduced intersecting graphs. In characteristic two the Weyl action on t is trivial, so invariants formed over k are k[t], and t×_(t/W)t is the reduced diagonal with coordinate ring k[t] and nilradical 0; the e and s graph labels coincide. Reduction of the integral square-invariant quotient instead gives k[x,ε]/ε² with ε=x−y nonzero and ε²=0. That double line uses a different quotient: in the actual characteristic-two fibre product ε=0. Thus distinct graph labels, rather than reducedness of the actual diagonal, fail in this test.

*Needs:* §13.1; §6.1; ReductiveGroups Layer 7; SchemeAndStackFoundations §0.17.

### 13.3 Detection of components after completion

char(k)=0; x is closed and belongs to X_w. Let x be a closed point of X_w, and y=κ(x)∈𝒯_w. The map of completed local schemes (X_w)^∧_x→𝒯^∧_y factors through (𝒯_(w′))^∧_y if and only if w′=w. When y∉𝒯_(w′), that closed subscheme has empty completion and cannot contain the nonempty source. The generic point used in the proof lies on 𝒯_w, not on X. (BHS19, Lemma 2.5.2, pp. 325–326, generic-point misprint with the Cartan generic point in its Cartan completion (BHS19 line 1062)).

One proof route is as follows. Normality and excellence make the completion of the local ring of X_w normal and integral. Its map to the smooth graph is induced by the flat surjective Cartan map, and remains schematically dominant after completion. If it factored through a distinct graph, that dominance would put all of 𝒯_w in its intersection with 𝒯_(w′), contradicting distinct graph generic points. Faithful flatness of local completion preserves the nonempty dense image. Use SchemeAndStackFoundations §0.21 for excellent-normal completion and DeformationAndDerivedPatchingAlgebra §1.16 for the actual induced map of local completions, its flatness and closed-fibre comparison. A flat local map of nonzero local rings is faithfully flat, which supplies schematic dominance over the completed graph.

**Checks.**

- The flat local map k[x]_(x)→k[x,y]_(x,y) induces k[[x]]→k[[x,y]]. Its closed fibre is k[[y]], with dimensions 2=1+1; substituting the uncompleted fibre k[y]_(y) would change that comparison. The identity local map induces the identity completion with closed fibre k and dimension formula 1=1+0.

- At the SL₂ zero operator both Cartan graphs meet, but the completed local map of a fixed X_w still detects its one graph label. Set-theoretic membership of the closed point in both graphs is insufficient.
- Computed values for SL₂ origin on both graphs; torus: on graph e, y−x=0 and y+x=2x≠0 formally; on graph s the equations swap; torus sole graph.

*Needs:* §5.4; §13.1; §13.2; DeformationAndDerivedPatchingAlgebra §§1.13–1.16; SchemeAndStackFoundations §§0.16, 0.21 and the equidimensional-completion contract; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13; §4.4.

### 13.4 The tangent-space upper bound

char(k)=0; x=(F₁,F₂,0) is a closed point in X_w∩V_v. Let x=(F₁,F₂,0) be a closed point of X_w∩V_v, and let πx∈U_v. Then dim_(k(x)) T_(X_w),x ≤ dim T_(Ū_w),πx + dim ker(wv⁻¹−id_t) + ℓ(vw₀). All dimensions are over the common residue field after base extension. The hypothesis ψ=0 is essential to the splitting used here. (BHS19, Proposition 2.5.3, pp. 326–327 (BHS19 line 1098)).

One proof route is as follows. Use the differential of π and bound its image by T_(Ū_w),πx. At zero operator, the tangent in the operator direction splits as t⊕(u∩Ad(v)u). The two Cartan relations on the component and the stratum put the toral tangent in ker(wv⁻¹−id). The remaining nilpotent intersection has dimension N−ℓ(v)=ℓ(vw₀). Add the image and kernel bounds. No conjectural description of X_w∩V_v, or equality of tangent dimensions, is used.

**Checks.**

- For SL₂ at a zero-operator diagonal flag pair, (w,v)=(e,e) gives 1+1+1=3, while (s,e) gives 2+0+1=3. The two different fixed-space terms are necessary for the same dimension bound.
- Computed values for SL₂ (w,v)=(e,e),(s,e),(s,s); torus: bounds 1+1+1=3, 2+0+1=3, 2+1+0=3; torus 0+r+0=r.

*Needs:* §3.5; §3.6; §5.1; §5.2; §1.4; Mathlib `LinearMap.ker`; Mathlib `Module.finrank`.

### 13.5 Smoothness from the tangent bound

The hypotheses of §13.4 and the two displayed additional conditions hold. With x and v as in the tangent bound, assume Ū_w is smooth at πx and codim_t ker(wv⁻¹−id)=ℓ(w)−ℓ(v). Then X_w is smooth at x. This is a sufficient criterion; no converse is asserted. (BHS19, Proposition 2.5.3(ii), statement p. 326 and proof pp. 326–327 (BHS19 lines 1116–1121 and 1143–1154)).

At a closed point in characteristic zero, the residue extension is separable, so the regularity criterion yields smoothness over k.

One proof route is as follows. Smoothness of the orbit closure makes its tangent dimension N+ℓ(w). Substitute the fixed-space codimension into the bound to obtain D=r+2N. The local dimension of X_w at a closed point is D. Equality of tangent dimension with local dimension gives regularity, and over the perfect characteristic-zero field this is smoothness.

**Checks.**

- For SL₂ with w=s and v=e the orbit closure is all P¹×P¹ and the toral fixed-space codimension is 1=ℓ(s)−ℓ(e); the criterion gives smoothness of X_s at the zero-operator diagonal point.
- Computed values for SL₂ (s,e); (s,s); torus: codim fixed space 1=1−0, 0=1−1; bound/local dimension 3=3; torus r=r.

*Needs:* §13.4; §1.2; §1.4; §3.4; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13.

### Examples

For SL₂ the Cartan fibre product is Spec k[x,y]/(x²−y²), with the graphs y=x and y=−x of e and s meeting at the origin. At a zero-operator diagonal flag pair the tangent bound reads 1+1+1=3 for (w,v)=(e,e) and 2+0+1=3 for (s,e), and at a distinct pair 2+1+0=3 for (s,s); each equals dim X_w=3, and the smoothness criterion applies with fixed-space codimensions 1=ℓ(s)−ℓ(e) and 0=ℓ(s)−ℓ(s).

### Dependencies

DeformationAndDerivedPatchingAlgebra §§1.13–1.16; SchemeAndStackFoundations §§0.16, 0.21 and the equidimensional-completion contract; SchemeAndStackFoundations §0.17; Mathlib `CategoryTheory.Limits.pullback`; Mathlib `LinearMap.ker`; Mathlib `Module.finrank`; ReductiveGroups Layer 7; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Layer 14: Completed characteristic-cycle identities

### 14.1 Completion of top cycles at a point

Y is excellent, reduced, pure d-dimensional and finite type over k; x is closed. For an excellent reduced pure d-dimensional finite-type k-scheme Y and a closed point x, put A=O_Y,x and Â its maximal-ideal completion. Define c_x:Z_d(Y)→Z_d(Spec Â) by c_x([C])=[Spec(Â/I_CÂ)] if x∈C and by zero otherwise. A completed component can split into several components; its cycle is the sum of all of them with their scheme multiplicities. Excellence makes the completed reduced component reduced. (BHS19, §2.5, p. 327; proof of Lemma 2.5.5, pp. 327–328 (BHS19 line 1131)).

The codomain is the free group on dimension-d irreducible closed subsets of the completed spectrum, using the affine cycle carrier. Such a spectrum is usually not locally of finite type over k, so its dimension grading is not obtained by pretending it is a scheme of finite type. At a reduced completed component every branch coefficient is 1; multiplicities in completed module cycles come from the module, not from choosing one formal branch.

One proof route is as follows. Localize the prime ideal of C at x and complete its quotient. Completion commutes with finite quotients. Excellence makes the reduced quotient analytically unramified, and the finite-type dimension formula gives pure dimension d. Expand its fundamental cycle in its possibly multiple minimal primes. Extend the component assignment by the universal property of the free abelian cycle group.

The construction has the following API.

- c_x([C])=[Spec(Â/I_CÂ)] for x∈C.
- A component missing x has image zero.
- c_x is an additive group homomorphism.
- If C is reduced and has b formal branches at x, its completed cycle is the sum of their b distinct fundamental cycles.

**Checks.**

- For A¹ at zero, c₀([A¹])=[Spec k[[t]]].
- For the irreducible curve y²=x²(1+x) over a characteristic-zero algebraically closed field, completion at (0,0) has two reduced branches; its one global component maps to their sum.
- For V(xy) at the point (1,0), only the component y=0 contributes; the component x=0 contributes zero.
- Computed values for A¹ at 0; irreducible node; axes at (1,0): [k[[t]]]; y²−x²(1+x)=(y−x√(1+x))(y+x√(1+x)), two length-1 branches; surviving y=0 coefficient 1, missing x=0 coefficient 0.

*Needs:* §7.1; §7.2; DeformationAndDerivedPatchingAlgebra §§1.13–1.16; SchemeAndStackFoundations §§0.16, 0.21 and the equidimensional-completion contract; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13; Mathlib `AdicCompletion`; Mathlib `Finsupp.linearCombination`.

### 14.2 Generic-length cycles under completion

char(k)=0; x is closed in X̄ and M is coherent. Let M be coherent on X̄, and x a closed point of X̄. In Z_(2N)(Spec Ô_(X̄),x) one has [M̂_x]=Σ_v m(Z_v,M)[Spec Ô_(Z_v),x], with the term defined as zero if x∉Z_v. Each completed Z_v is reduced and equidimensional of dimension 2N, but may be reducible. The formula also applies to coherent modules supported on X̄_w. (BHS19, Lemma 2.5.5, pp. 327–328 (BHS19 line 1131)).

For a coherent module of smaller support dimension the degree-2N cycle on both sides is zero. In applying the affine completion comparison, all ideals and maps are the actual images of the component primes in the completed zero-fibre ring.

One proof route is as follows. Take a prime filtration of the finite local module. Terms of smaller support dimension have no top-cycle contribution before or after completion. For each top prime, the number of occurrences is its generic module length. Flat completion preserves the exact filtration and replaces the prime quotient by its completed structure module. Excellence gives reducedness and equidimensionality for each completed reduced component. This controls branch multiplicities without assuming normality of Z_v.

**Checks.**

- For a point and a two-dimensional module, completion leaves cycle coefficient 2. For the irreducible nodal curve in the nodal-curve example in §14.1, completion must preserve the sum of both formal branches rather than one chosen branch.
- Computed values for point k²; node structure sheaf; smaller-support point on curve: 2=2·1; one global coefficient 1 becomes (1,1) on two formal branches; degree-1 cycle of point module 0 before and after completion.

*Needs:* §14.1; §7.2; §7.4; §6.6; DeformationAndDerivedPatchingAlgebra §§1.13–1.16; SchemeAndStackFoundations §§0.16, 0.21 and the equidimensional-completion contract.

### 14.3 The completed simple cycles

char(k)=0; x is closed in X̄. For x a closed point of X̄, define ℒ̂_(w,x)=Σ_v a_(w,v)[Spec Ô_(Z_v),x] in the completed top-cycle group, with a missing-component term zero. This is c_x(ℒ_w); it is not a claim to complete the localised D-module itself. The same definition is used in the common reduced support cycle group of X̄. (BHS19, Definition following Lemma 2.5.5, p. 328 (BHS19 line 1171)).

One proof route is as follows. Use the previously fixed integral simple-cycle coefficients and the additive completion map. Identify cycle groups across a nilpotent thickening by their integral component bases; retain structure-sheaf multiplicities when forming module cycles.

The construction has the following API.

- The displayed sum uses the same a_(w,v) as the uncompleted simple cycle.
- ℒ̂_(w,x)=c_x(ℒ_w).
- Every formal-branch coefficient is nonnegative.
- It vanishes if x lies on none of the Z_v with a_(w,v)>0.

**Checks.**

- For a torus at its sole Steinberg point, ℒ̂_e=[Spec k].
- For SL₂, ℒ_e=[Z_e], so ℒ̂_e is the completed diagonal Springer component, or zero off it.
- For SL₂, ℒ_s=[Z_s]; at a point off Z_s its completion is zero even if the point lies on Z_e.
- Computed values for torus; SL₂ point on diagonal zero; nonzero E₁₂ in Z_e: sole coefficient 1; L̂_e and L̂_s are their individual completed components; at nonzero E₁₂ off Z_s, L̂_s=0.

*Needs:* §14.1; §11.2; §14.2.

### 14.4 The completed Kazhdan–Lusztig cycle identity

char(k)=0; x is a closed point of X̄. For every w∈W and every closed point x of X̄, [Spec Ô_(X̄_w),x]=Σ_(v≤w)P_(w₀w,w₀v)(1)ℒ̂_(v,x), where the left side is zero when x∉X̄_w. The equality is in the common top-cycle group at x and preserves all generic multiplicities and formal branches. (BHS19, Corollary 2.5.6, p. 328 (BHS19 line 1171)).

One proof route is as follows. Apply c_x to the uncompleted equality [X̄_w]=Σ_v m_(w,v)ℒ_v. The module-completion formula identifies its left side with the fundamental cycle of the completed zero-fibre structure sheaf. The definition of ℒ̂ gives the right side. Substitute the corrected KL coefficients. No claim that a completed nilpotent component is normal or irreducible is used.

**Checks.**

- In SL₂ at a point on both Steinberg components, the completed zero-fibre cycle of X_s is ℒ̂_e+ℒ̂_s. Off one component its missing term is zero, with the same coefficients.
- Computed values for SL₂ both components; only Z_e; torus: for w=s, coefficients (1,1)=(1,0)+(0,1); off Z_s equality 1=1+0; torus 1=1.

*Needs:* §11.3; §14.3; §14.2; §7.3.

### Examples

For SL₂ at a closed point on both Steinberg components the completed zero-fibre cycle of X̄_s is ℒ̂_e+ℒ̂_s, with coefficients (1,1)=(1,0)+(0,1); at a point of Z_e off Z_s the completed term of Z_s vanishes and the identity reads 1=1+0. For the irreducible nodal curve y²=x²(1+x), completion at the origin splits its one component into two formal branches, each with coefficient 1.

### Dependencies

DeformationAndDerivedPatchingAlgebra §§1.13–1.16; SchemeAndStackFoundations §§0.16, 0.21 and the equidimensional-completion contract; Mathlib `AdicCompletion`; Mathlib `Finsupp.linearCombination`; SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.17–0.21, 4.13. Internal inputs are the precise subsections cited in each needs line.

## Downstream consumers

TriangulineVarietyAndItsLocalModel consumes §5.4 for normal local incidence components, §13.3 for formal component labels and §§13.4–13.5 for tangent estimates and smoothness. Its crystalline local-cycle comparisons consume §14.4 with the strict central-character and Weyl-label conventions of §10.4. MixedHodgeModulesAndIrregularHodgeTheory consumes Layers 8–9 for algebraic D-modules and regular holonomic operations; it adds its Hodge filtrations, Betti realization and irregular constructions. SheafConvolutionOnAbelianVarieties consumes Layers 8–9 for coherent, holonomic and regular holonomic D-modules and their operations, §8.6 for characteristic cycles and §7.2 for generic-length multiplicities. SmoothRepresentationsOfLocalGroupsPartII consumes Layer 6 for the Springer resolution and the reduced Steinberg variety with its components. These consumers provide no prerequisites here.

## Worked examples

For SL₂ in characteristic zero, F=P¹, N=r=1 and W={e,s}. The equal-flag incidence component X_e is g̃, while X_s is its other three-dimensional component. Both Cartan maps have two-dimensional CM fibres. At zero, Z_e is the diagonal copy of T*P¹ and Z_s=P¹×P¹×{0}. Their intersection is the diagonal P¹. The simple cycles are ℒ_e=[Z_e] and ℒ_s=[Z_s], while [X̄_e]=[Z_e] and [X̄_s]=[Z_e]+[Z_s]. Hence the transition determinant is 1 over Z and the completed identity at a point on the intersection has the same two coefficient-one terms (BHS19 Theorem 2.4.7 and Corollary 2.5.6, pp. 322–328, BHS19 line 959; BR12 §2.14, BR12 line 1722).

In affine coordinates near a diagonal SL₂ pair, write the flags as k(1,x), k(1,y), and ψ=((a,b),(c,−a)). Incidence is c−2ax−bx²=0 and c−2ay−by²=0. Their difference is (x−y)(2a+b(x+y))=0. The diagonal component has x=y; the other has 2a+b(x+y)=0 and is smooth with coordinates x,y,b. On it κ₁=b(x−y)/2, so its Cartan zero fibre has the two reduced components b=0 and x=y, each of multiplicity 1. The intersection X_s∩V_e contains nonzero nilpotents: x=y=0, b=1 gives ψ=E₁₂. Thus its boundary is not confined to ψ=0 (BHS19 formulas (2.3), (2.5), Lemma 2.3.4 and Proposition 2.4.6, pp. 311–322; BHS19 lines 506, 515, 711 and 956).

For the zero-operator tangent bound at an SL₂ diagonal pair, (w,v)=(e,e) gives 1+1+1=3 and (s,e) gives 2+0+1=3. At a distinct pair, (s,s) gives 2+1+0=3. Each equals the component dimension; the fixed-space term and orbit-closure tangent term cannot be replaced by the same constant (BHS19 Proposition 2.5.3, pp. 326–327, BHS19 line 1116).

For the irreducible curve y²=x²(1+x), complete at the origin in characteristic zero. The series √(1+x)=1+x/2−x²/8+⋯ gives two factors y∓x√(1+x), two distinct formal branches, each of generic length 1. Its single global component therefore maps to the sum of two completed components. Coherent multiplicity 2 maps to coefficient 2 on each branch, not to a chosen branch (the completion comparison of §14.2, BHS19 Lemma 2.5.5, pp. 327–328, BHS19 line 1167).

The inclusion X_w∩V_v⊂V_v∩κ₁⁻¹ker(wv⁻¹−id) is used in §5.4 and §13.4. Equality of these sets is a stronger assertion than any target here (BHS19 Conjecture 2.3.7, p. 319, BHS19 line 812). Geometric normality of X_w supplies no assertion of normality of Z_w. Positivity and triangularity supply no assertion that a simple characteristic cycle has one component (BHS19 Remarks 2.4.2 and 2.4.5, pp. 320–322, BHS19 line 848; BR12 Remark 2.14.3, p. 575, BR12 line 1731).

## References

All statements above are restated in this roadmap's own words. A line locator refers to the line-numbered extraction of the named source; theorem and printed-page locators specify the edition.

- **BHS19.** Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [A local model for the trianguline variety and applications](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf), Publications Mathématiques de l’IHÉS 130 (2019), 299–412. Published §2.1–2.5, pp. 309–328; BHS19 lines 458–1211. The local dimension equality is retained in miracle flatness; the KL indices retain both longest-element prefixes; the cotangent factors are Springer resolutions; the formal Cartan generic point belongs to the Cartan completion; Lemma 2.4.8 and Remark 2.4.9 are used in the partial-flag saturation form of §12.2, since first-flag left translation by the standard parabolic does not preserve the simple cycles.
- **BR12.** Roman Bezrukavnikov and Simon Riche, [Affine braid group actions on derived categories of Springer resolutions](https://www.numdam.org/item/10.24033/asens.2173.pdf), Annales scientifiques de l’École normale supérieure 45 (2012), 535–599. §1.1, pp. 538–539; Theorem 2.2.1 and Remark 2.2.2, pp. 557–558; §§2.10–2.11, pp. 570–572; Proposition 2.14.2, pp. 574–575. BR12 lines 953–998, 1546–1626 and 1703–1758.
- **M23.** Mircea Mustață, [D-modules and singularities](https://websites.umich.edu/~mmustata/DmodulesNotes.pdf), Math 732 notes (2023). §§2–3, pp. 1–17; §5.1, pp. 35–36; §§6.1–6.8, pp. 43–77; §7.4.3, pp. 93–94. M23 lines 218–300, 717–886, 1700–1731, 2378–2533, 2728–2779, 3712–3976 and 4819–4852. The notes assume an algebraically closed field of characteristic zero (M23 line 466); §8.1 records why Layers 8–9 need no closure hypothesis outside the regularity descent of §9.7. The PBW inclusion directions, finite-projective double dual and Tor degrees use the corrected formulas in Layers 8–9.
- **ElliottBB.** Aron Heleodoro, [Notes on “Localisation of g-modules”](https://www.ihes.fr/~celliott/Beilinson_Bernstein_talk.pdf), January 12, 2014. Theorem 1, pp. 5–7, and Theorem 2 with its proof, pp. 7–8 (ElliottBB lines 174–260), give the sections-map and general D-affinity/localisation route; §4, pp. 9–10, gives the ample-twist projection route. The algebraic group in these notes is semisimple over an algebraically closed characteristic-zero field. The reductive central scalar extension and arbitrary characteristic-zero field comparison are explicit targets in §§9.7, 10.1 and 10.4; their validity is not inferred from the notes. The twisting parameter and Weyl labels use the independent convention of BHS19 §2.4.
- **G98.** Victor Ginzburg, with Vladimir Baranovsky and Sam Evens, [Lectures on D-modules](https://math.berkeley.edu/~nadler/ginzburg.dmodules.pdf), Winter 1998 notes. §1.1, pp. 4–6; §2.1, pp. 23–24; §4.1, pp. 60–61. G98 line 191 for reduced characteristic support and the multiplicity discussion; use generic length as in M23 Definition 6.40, rather than rank after reducing the component.

- **G86.** Victor Ginzburg, G-modules, Springer's representations and bivariant Chern classes, Advances in Mathematics 61 (1986), 1–48, doi:10.1016/0001-8708(86)90064-2. §§5–6 and Proposition 5.3 for the Weyl action on top Borel–Moore homology of the Steinberg variety and the Verma characteristic cycles used in §11.1. Paywalled; cited by locator, uncertified.
- **KT84.** Masaki Kashiwara and Toshiyuki Tanisaki, The characteristic cycles of holonomic systems on a flag manifold related to the Weyl group algebra, Inventiones Mathematicae 77 (1984), 185–198, doi:10.1007/BF01389142. §2 for the holonomic systems of Verma modules and §5.5 for the isomorphism with the Weyl group algebra used in §11.1. Paywalled; cited by locator, uncertified.
- **R08.** Simon Riche, [Geometric braid group action on derived categories of coherent sheaves](https://www.ams.org/journals/ert/2008-12-05/S1088-4165-08-00325-7/S1088-4165-08-00325-7.pdf), Representation Theory 12 (2008), 131–169. Proposition 6.2.2, p. 164 (R08 line 1564), identifies the kernel morphism Z[W]→L(Z) with Ginzburg's isomorphism, giving the image of a simple reflection in §11.1.
- **Hum08.** James E. Humphreys, *Representations of semisimple Lie algebras in the BGG category O*, Graduate Studies in Mathematics 94, American Mathematical Society (2008), §8.4, the reference given at BHS19 lines 881–884 for the multiplicity theorem of §11.3. Cited by locator, uncertified.
- **KL80.** David Kazhdan and George Lusztig, *Schubert varieties and Poincaré duality*, in *Geometry of the Laplace operator*, Proceedings of Symposia in Pure Mathematics 36, American Mathematical Society (1980), 185–203, for the identification of the stalks of the intersection complexes of Schubert varieties with Kazhdan–Lusztig polynomials used in §11.3. Cited by bibliographic data, uncertified.
- **EH18.** Karim El Haloui, [Smooth Projective Stacks: Ample bundles and D-affinity](https://wrap.warwick.ac.uk/id/eprint/108879/1/WRAP_Theses_El_Haloui_2018.pdf), Warwick PhD thesis (2018), §4.3.1, p. 63, Definition 4.10 and preceding paragraph, EH18 lines 1725–1740. The chapter assumes an algebraically closed characteristic-zero field; §9.8 states the field-extension and descent comparison used here.
