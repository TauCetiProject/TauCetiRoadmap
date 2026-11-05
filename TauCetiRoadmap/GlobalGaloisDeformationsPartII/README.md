# Roadmap: global Galois deformations, part II — G-valued lifting

**Summary.** Starting with the fixed-quotient deformation and obstruction theory of GlobalGaloisDeformations, this roadmap develops lifts of actual residual representations of global Galois groups into reductive groups, including reducible images and prime-to-p components. Cyclic prime-field modules supply ramification classes; doubling produces controlled finite-level towers; relative Selmer images then yield a characteristic-zero lift ramified at only finitely many places. The geometric theorem prescribes local components and arbitrary approximation, fixes the multiplier, avoids a specified finite set of new places, and obtains the full derived congruence kernel in the image. Applications concern actual reducible modularity, function-field automorphy and ordinary symplectic lifts. The compatible-system consequence uses the independent compatible-system supplier. The general reducible lifting theorems and their applications assume the arithmetic selection hypothesis of §3.2; C1–C4 alone are not asserted to imply that hypothesis. The irreducible number-field theorem of §6.6 has an independent FKP19 route, and the symplectic applications of §§10.1–10.3 rest on it without that hypothesis. The main source is FKP22, Theorems 4.4 and 5.2, pp.20–25.

## Scope and ownership

GlobalGaloisDeformations stops at deformation problems, obstruction presentations, restriction, twists and Taylor–Wiles data. Its §§3.3–3.8 and G7 supply those objects; this Part II owns the cyclic ramification construction, doubling, relative images, auxiliary-prime annihilation, finite-ramification assembly and the extension-sensitive applications. It does not assume representability of a reducible unframed deformation functor.

The following are supplied rather than constructed a second time here.

- Mathlib's `TopRep`, `continuousCohomology`, `ContinuousCohomology.tateShafarevich`, `Submodule.span`, `Submodule.map`, `AddSubgroup.map`, `Representation`, `Rep.of`, `Representation.IntertwiningMap`, `Representation.Equiv` and `groupCohomology.H1` are already in the library. The cyclic module of §2.1 is the prime-field specialization of the orbit span; the relative group of §4.1 is the arithmetic reduction image. Neither introduces a generic image, orbit-span, extension or cohomology theory.
- Tau Ceti's `TauCeti.ContCohomology.H1` and `TauCeti.ContCohomology.explicitInfRes_exact` are already in the library. ProfiniteCohomology Layers 2–8 own the continuous-cohomology comparisons, coefficient maps and cup products. ArithmeticGaloisDuality R02.1–R02.5 and D7 own arithmetic coefficient systems, Selmer kernels, Tate pairings and Poitou–Tate, including the prime-to-characteristic function-field theory of R02.4.5. The Sha and relative-annihilation results below differ from its R02.6.2 Taylor–Wiles calculation: they use arbitrary finite prime-field modules and ramified root conditions, not a one-dimensional unramified Taylor–Wiles line.
- LocalGaloisDeformationRings §§1.17, 2.28, 2.30, 3.11, 6.5 and 6.17 own the G-valued framed rings, away-from-p generic fibres, equal-characteristic lifts, potentially semistable rings and ordinary components. Root lifting functors and smooth-point cocycle lattices are exports from that owner. Sections 4.7–4.8 select their relative cohomological conditions; they do not rebuild the rings or the local analytic construction. Sections 8.2–8.3 use its §§2.14, 8.5 and 8.10 GL₂ lifts.
- ReductiveGroups Layers 2, 7 and 8 own algebraic Lie algebras, roots, parabolics, Levi subgroups and split classification. ReductiveGroupsPartII §§RG2.0.3 and RG2.2 own congruence subgroups and the lattice tree, including its coefficient-extension subdivision. IntegralHeckeAndGaloisDeterminants §1.4, “Classical Ribet lattice”, supplies nonsplit reductions in both prescribed orientations. Section 8.9 adds the segment shape, split interior reductions and invariance of the two endpoint classes under coefficient extension. The extra large-characteristic interfaces are precisely the supplier gaps below, not claims about the scope of the base roadmap.
- NoncommutativeAndEquivariantIwasawa §§0.2, 0.7 and 0.13 own compact analytic groups, uniform groups, p-valuations and Lazard cohomology. LocallyAnalyticDistributionsPartII ND.0 supplies its analytic charts. AutomorphicFormsOnReductiveGroups Layer 1 consumes the shared Chevalley–Eilenberg complex of ArithmeticLocallySymmetricSpaces ALS.F.5; AffineLieAlgebras §A1 owns complex-simple Whitehead vanishing and the characteristic-zero vanishing theorem needed here is requested explicitly. Section 4.4 owns only the uniform finite-coefficient torsion application.
- ArithmeticGaloisRepresentations §§1.6–1.11 and 7.7 own integral models, semisimplification, coefficient descent, uniqueness of absolutely irreducible lattices and finite-image representation theory. Its §7.4 and GlobalGaloisDeformations G7 own polarized representations and their tangent convention. The polarized criterion is an export, not an additional construction in this roadmap.
- Chebotarev Layer 10 owns number-field density. FunctionFieldArithmetic §5.8 owns the degree-sensitive function-field theorem. Section 3.2 states the additional arithmetic selection hypothesis for an arbitrary positive-upper-density family and proves the elementary estimate assuming its conditional proportions.
- AlgebraicModularFormsAndSerreWeights Layers 4–7 own Serre weights, Deligne–Serre lifting and classical Galois attachments. AutomorphicGaloisRepresentations owns the Hilbert attachments and local–global comparisons. ClassicalSerreModularity R27.6 owns Serre modularity; ClassicalSerreModularity §I.1 owns the Skinner–Wiles ordinary lifting theorems, its target `I.1/residually-reducible-ordinary-lifting` being Theorem A over ℚ, and OrdinaryAutomorphicFormsAndModularityLifting §5.3 owns the conditional Theorem B over totally real fields; GL2ModularityLifting §10.15 owns Pan's theorem, with the unconditional export specified below. The applications here retain the full lattice reduction.
- AutomorphicLFunctionsAndLocalFactors §AL.3, “Leveled shtukas and ramified rank induction”, owns both directions of the global GLₙ Langlands correspondence. ModularityAndLanglandsExtensions §§2.28 and 2.48 own residual potential automorphy and compatible-system construction; AutomorphicSpectralTheory §7.1 owns solvable GLₙ base change and descent. PotentialAutomorphyInfrastructurePartII PL.7 owns ANT automorphy lifting, including its source-primitivity form. Section 10.3 is their application to the lift of §10.1, not a second proof of compatible-system construction or monodromy independence.

The unconditional independence assertion of FKP22 Lemma 3.7 is not a target. Section 2.9 states the valid joint-inertia criterion and its negative controls. The general reducible lifting results are conditional on the quantitative arithmetic selection hypothesis of §3.2, including repeated simple constituents; proving that hypothesis from C1–C4 is not asserted here. Pairwise field disjointness, individual cyclic images and Chebotarev alone do not provide this replacement. The intended lifting endpoints keep their full generality.

## Conventions

Automorphic ranks and Levi block sizes are positive, and residue norms satisfy q≥2. Let F be a global field, p an odd prime different from char(F), E/ℚ_p finite, O its ring of integers, ϖ a uniformizer, k its finite residue field, and e=v_ϖ(p). All fields are nonzero; O is a characteristic-zero complete discrete valuation ring. Equal characteristic refers to the global field and its completions away from p, not to O. Coefficient extension may be ramified; approximation always uses the original ideal (ϖᵗ), whose extension is (ϖ′ᵉ′ᵗ) if the new ramification index is e′. Finite-level indices r,a,b,M,N are positive unless zero is explicitly being tested.

The group G/O is smooth affine, G⁰ is split reductive, and its finite étale component group has order prime to p. Write Gᵈᵉʳ for the derived group of G⁰, never for the kernel of a different multiplier. Assume very-good characteristic and that Gᵈᵉʳ×Z⁰(G⁰)→G⁰ has prime-to-p kernel; this standing assumption suffices for the definitions of Layer 0, not for the lifting constructions. For each root datum of G⁰ fix an integer B_G≥2, depending only on that root datum, such that every prime p>B_G is very good with prime-to-p kernel above and, over every finite field of characteristic p, the root-theoretic inputs hold: the exponential and adjoint expansion (the large-prime unipotent exponential contract, the unipotent adjoint expansion contract), a root vector outside each proper 𝔽_p-subspace of Lie(Gᵈᵉʳ) (the uniform finite-field root position contract), regular toral elements with a prescribed root value (the prescribed-root regular toral element contract), and the simultaneous root position of §5.2. The constructions of §§2.5–2.6, 3.4, 3.6, 4.6, 5.2–5.5, 6.1, 6.3 and 6.5 assume p>B_G. Writing p≫G (p≫n when G⁰=GLₙ) means p>B for a bound B≥B_G depending only on the root datum, as in FKP22's p≫G⁰ (FKP22 §2, p.9; Assumption 3.1, p.10); a target that uses Layer 1 criteria may need a larger such B. The only smaller explicit bound is §6.4: for g^der=sl₂ one may take B_G=2. The fixed quotient lift μ takes values in G/Gᵈᵉʳ, which may be disconnected. In number-field geometric statements μ is de Rham. The derived congruence kernel means ker(Gᵈᵉʳ(O)→Gᵈᵉʳ(k)); full image in that kernel does not assert density in the centre (FKP22 §2, p.9; FKP19 Assumption 2.1, p.14).

Put M=Lie(Gᵈᵉʳ)⊗k, with Ad∘ρ̄ action, and M*=Hom_k(M,k)(1). At level r use the actual adjoint module M_r of the finite lift and M_r*=Hom_O(M_r,O/ϖʳ)(1). The star includes exactly one cyclotomic twist. The trace k→𝔽_p identifies the prime-field dual with this k-dual after restriction of scalars. Orbit spans and ramification lines are over 𝔽_p; relative residual images are k-spaces; full finite-level groups are compared by cardinality. A perfect invariant form identifies the untwisted adjoint dual only under the stated prime hypotheses (FKP19 §2, pp.13–14).

Fix a separable closure and decomposition embeddings. `Γ_{F,S}` means the actual Galois group unramified away from the finite set S of finite places, with the archimedean terms included in duality. In characteristic zero S contains the p-places and all residual ramification. Set K=F(ρ̄,μ_p), F̃ equal to the component-splitting field, `K∞=K(μ_{p∞})`, and `D=max{d:μ_{pᵈ}⊂K}`; D≥1. Use arithmetic Frobenius σ, tame pro-p inertia τ, and στσ⁻¹=τ^q. The local invariant in §3.3 uses reciprocity sending a uniformizer to geometric Frobenius; thus the sign must be calibrated rather than inferred from the word Frobenius (FKP22 Definition 3.2, p.11; FKP19 Lemma 3.9, p.19).

Use HT(κ)=−1. The ordinary symplectic convention has weights `ξ_{τ,2n−i+1}+i−1`. For the classical GL₂ attachment with determinant κʳ⁻¹ times a finite character the weights are {0,1−r}; the opposite convention would give {0,r−1}. Serre weight is the positive modular-form weight and is not itself a signed Hodge–Tate weight. In §7.8 the resulting Siegel weights are {0,1−a,w,w+a−1}. This fixes the sign consistently across the classical and symplectic applications (FKP22 §9, pp.40–41; Theorem 7.4, p.36).

The standing residual conditions are C1: H⁰(Γ_F,M)=0; C2: H⁰(Γ_F,M*)=0; C3: no nonzero 𝔽_p[Γ_F]-quotient of M is isomorphic to a subquotient of M*; C4: H¹(Gal(K/F),M*)=0. C3 does not assume semisimplicity. A number-field geometric theorem assumes total reality separately, even for a torus. In applications using a nonsplit or parabolic residual extension, the arithmetic selection hypothesis means that there exists such an extension meeting the stated residual and local requirements for which §3.2 holds throughout the finite-stage construction. All constructions respect conjugacy, coefficient extension and the fixed quotient. In positive characteristic the finite duality set is nonempty; one may enlarge S by an unramified place to meet this hypothesis of ArithmeticGaloisDuality R02.4.5. Carrier universes are fixed compatibly.

**Checks.**

- For GL₂ at p=3, M has basis h=diag(1,−1), E₁₂,E₂₁ and dimension 3. Conjugation by diag(1,−1) has eigenvalues 1,−1,−1, so its fixed dimension is 1, the flag dimension. The identity fixes dimension 3. For Gₘ both dimensions are 0, including over an imaginary field; oddness alone does not force total reality.
- If κ̄(g)=2 in 𝔽₅ and V is a trivial line, g acts on V* by 2 and on the double twist by 4. Also `dim_𝔽p(𝔽_{p²}·1)=2` but the orbit span of 1 for the trivial action is 𝔽_p·1, of dimension 1.
- For unramified u and tame t with u(σ)=t(τ)=1 and the other two values 0, §3.3 gives inv(u∪t)=−1 and inv(t∪u)=1. With both classes unramified or both tame it gives 0. The relation for a root lift is α∨(√q)u_α(x)α∨(√q)⁻¹=u_α(qx); the exponent is q because ⟨α,α∨⟩=2.
- For n=1 and ξ=(0,0), the ordinary weights are 0,1 and the multiplier κ⁻¹ has weight 1. A classical weight-2 attachment with determinant κ has weights 0,−1. For a=2 and w=2, the Siegel weights are 0,−1,2,3 and are distinct; w=−1 gives 0,−1,−1,0 and fails regularity.
- When e=2 and D=1 the first noncentral level is eD+1=3. If O′/O has ramification 3, original accuracy ϖ² is new accuracy ϖ′⁶. Natural subtraction is used only with N≥4M, so N−M≥3M; no zero-level lattice is silently used.
- Very-good characteristic is weaker than p>B_G. For SL₄ (type A₃) very good means p∤4, so p=3 passes, and the central isogeny has trivial kernel. Over 𝔽₃ a trace-zero diagonal H=diag(a₁,…,a₄) has four entries from three values, so some root differential aᵢ−aⱼ is 0: there are 0 regular toral elements, so B_G≥3 for type A₃. Over 𝔽₇ the ordered 4-tuples of distinct entries number 7·6·5·4=840, their sums are equidistributed under translation since 4 is invertible, and 840/7=120 have trace 0, for example diag(0,1,2,4). For SL₂ at p=3, H=diag(1,−1) has dα(H)=2≠0, consistent with B_G=2 for g^der=sl₂.

## Exact supplier contracts

### From Mathlib

Use `Representation` in `Mathlib/RepresentationTheory/Basic.lean`, `Rep.of` in `Mathlib/RepresentationTheory/Rep/Basic.lean`, `Representation.IntertwiningMap` and `Representation.Equiv` in `Mathlib/RepresentationTheory/Intertwining.lean`, and `groupCohomology.H1` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`. A representation is a monoid homomorphism to linear endomorphisms; for a group its values are invertible. No topology or continuity is included.

Use `TopRep` in `Mathlib/RepresentationTheory/Continuous/TopRep.lean` and `continuousCohomology` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`. The operators in `TopRep` are individually continuous; joint continuity of the action is a separate requirement. Use `ContinuousCohomology.tateShafarevich` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` for the absolute-Galois localization kernel. Section 2.2 uses ArithmeticGaloisDuality R02.4.2–R02.4.3’s restricted-ramification kernel Ш¹_S on `Γ_{F,S}`; the Mathlib kernel is its absolute counterpart, not that restricted-ramification carrier.

Use `LieGroup` in `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` over the nontrivially normed field `ℚ_[p]` with the analytic smoothness exponent, `GroupLieAlgebra` with its `LieRing` and `LieAlgebra` instances in `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean`, and `LieAlgebra.IsSemisimple` in `Mathlib/Algebra/Lie/Semisimple/Defs.lean`, for the compact p-adic analytic groups and the semisimplicity hypothesis of §4.4. The Lie algebra is the tangent space at the identity with the bracket of left-invariant vector fields, available at analytic smoothness over `ℚ_p`; semisimplicity is a direct sum of non-abelian simple ideals, so the zero Lie algebra qualifies and a one-dimensional one does not. Use `Subrepresentation.quotient` in `Mathlib/RepresentationTheory/Subrepresentation.lean` for the representation induced on the quotient by a stable submodule, in the reductions `ModPow` of §4.4.

Use `CategoryTheory.ShortComplex.ShortExact` in `Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean` for actual extensions in `Rep`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/LongExactSequence.lean` uses this interface. Use `CompositionSeries.jordan_holder` in `Mathlib/Order/JordanHolder.lean` for the Jordan–Hölder engine in §1.4, applied to the lattice of Γ-stable normal subgroups with equivariant quotient isomorphisms.

Use `Submodule.subset_span` and `Submodule.span_le` in `Mathlib/LinearAlgebra/Span/Defs.lean`, and `Submodule.map_span` in `Mathlib/LinearAlgebra/Span/Basic.lean`, for membership, the universal property and image compatibility of the orbit spans in §2.1. Use `Submodule.span` in `Mathlib/LinearAlgebra/Span/Defs.lean` as the infimum of submodules containing the given set, and `Submodule.map` in `Mathlib/Algebra/Module/Submodule/Map.lean` as an existential linear image. `AddSubgroup.map` is the additive image generated from the subgroup image in `Mathlib/Algebra/Group/Subgroup/Map.lean`. None supplies an arithmetic Selmer condition. Use `IntermediateField`, `Normal`, `IsGalois` and `IsAbelianGalois` for composita and restriction; `IsAbelianGalois` includes both Galoisness and commutativity of the automorphism group, not finiteness. Use `IsAbelianGalois` in `Mathlib/FieldTheory/Galois/Abelian.lean`. Section 0.6 concerns conjugation inside a potentially nonabelian compositum.

### From Tau Ceti

Use `TauCeti.ContCohomology.H1` in `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`: the quotient of continuous cocycles by coboundaries for a continuous action on a topological additive commutative group. Use `TauCeti.ContCohomology.explicitInfRes_exact` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean`: the range of inflation equals the kernel of restriction for a closed normal subgroup, with its invariant coefficient module and quotient continuity hypotheses. Neither declaration by itself supplies arithmetic duality, the required reductive arithmetic datum or the vanishing C4. ProfiniteCohomology Layers 2–8 give the comparison, exact sequences and cup products used to transport this interface.

### From TauCetiRoadmap.ProfiniteCohomology

Consume Layers 2–8 for continuous cocycles, cohomology, coefficient exact sequences, restriction, inflation–restriction and cup products, with the topology and continuity hypotheses attached there. The arithmetic restrictions and local invariant normalization are those of ArithmeticGaloisDuality; the additive quotient H¹ is not assigned its pointwise quotient topology in an arithmetic discrete-coefficient comparison.

### From TauCetiRoadmap.GlobalGaloisDeformations

Consume §§3.3–3.8 for global deformation data, local-to-global maps, tangent Selmer spaces and obstruction presentations, and G7 §§8.1–8.4 for polarized problems. Square-zero lifting is an H¹ torsor when the H² obstruction vanishes; restriction sends the global obstruction to the actual local obstruction. Reduction and the fixed finite ramification set must be preserved.

What GlobalGaloisDeformations must provide (the fixed-quotient global obstruction contract): The square-zero H¹ action, H² obstruction and global/local restriction diagram must apply to fixed-quotient G-valued lifts with prime-to-p components and reducible residual image, without asserting representability of the unframed functor.

What GlobalGaloisDeformations must provide (the polarized tangent convention contract): Its G7 polarized coefficient criterion must distinguish Lie ker(multiplier)=glₙ from Lie((G⁰)ᵈᵉʳ)=slₙ, track the scalar summand and the action X↦−AXᵗA⁻¹, and require each residual constituent to be polarized individually before exporting invariant vanishing.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Consume R02.1 compact coefficient exact sequences, R02.2.1 Hochschild–Serre, R02.4.2 for Ш¹_S on `Γ_{F,S}`, R02.4.3 Poitou–Tate, R02.5.1 Greenberg–Wiles and its change-of-local-condition comparisons, D7.4 finite local Tate duality and D7.7 annihilator compatibility. In particular use M∨(1), ordinary archimedean H⁰ in the cardinality formula, and actual finite-coefficient kernels. The localization comparison ends in an obstruction term; its final map is not assumed surjective (FKP22 §2, p.10; NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, cited by locator).

Consume R02.1.2–R02.1.3 for compact coefficient sequences and inverse limits, R02.3.1 and R02.3.4 for restricted ramification and Sha kernels, R02.4.5 for prime-to-characteristic function-field Poitou–Tate and Sha¹/Sha² duality, and D7.7.1–D7.7.4 for arbitrary finite local conditions. In the function-field case its set of places is nonempty.

What ArithmeticGaloisDuality must provide (the function-field Selmer numerics contract): At R02.5.1 export the Greenberg–Wiles cardinality formula and its nested-local-condition comparison over global function fields with nonempty finite S and finite coefficients of order prime to the field characteristic, with no archimedean or p-adic correction, using the coefficient and pairing maps of R02.4.5 and D7.7.


**Checks.** At a trivial place over 𝔽₃, a trivial one-dimensional module has h⁰,h¹,h² equal to 1,2,1, giving 1−2+1=0; a single unramified condition has size 3. On the u,t basis its pairing matrix is [[0,−1],[1,0]], so the annihilator of the unramified line is that same line. For the real order-two group at odd p, averaging uses 1/2 and positive-degree cohomology is 0; ordinary h⁰ remains 1 on a trivial line and cannot be replaced by Tate h⁰=0.

### From TauCetiRoadmap.ReductiveGroups

Consume Layers 2, 7 and 8 for Lie(G), differentiation, root spaces, root subgroups, parabolics, Levi decompositions, central isogenies and split root-data classification. Use the full component action when permuting adjoint simple factors. Those statements are imported with their own field and characteristic hypotheses.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume §RG2.0.3 for the congruence neighbourhood basis and the identification of its graded quotients with Lie(G_k)⊗𝔪ⁿ/𝔪ⁿ⁺¹. Consume RG2.2 for lattice vertices, neighbour lines, the PGL₂ action, convex fixed sets and coefficient-extension subdivision. Large-characteristic root-theoretic exports needed in addition are the following contracts, located at the relative-root interface RG2.1; they do not change the base ReductiveGroups roadmap.

What ReductiveGroupsPartII must provide (the large-prime unipotent exponential contract): For each split connected reductive root datum there is B such that, for every finite field k of characteristic p>B, every split connected reductive G/k of that datum and every k-parabolic P=MU with unipotent radical U, there is a P-equivariant variety isomorphism exp:Lie(U)→U preserving the ascending central series and inducing additive group isomorphisms on its graded pieces.

What ReductiveGroupsPartII must provide (the unipotent adjoint expansion contract): For each split connected reductive root datum there is B such that, over every finite field k of characteristic p>B, every split connected reductive G/k of that datum, every k-parabolic P=MU with unipotent radical U and X∈Lie(U), the exponential of the large-prime unipotent exponential contract satisfies Ad(exp X)(Y)=Σ_j (ad X)^j(Y)/j! for all Y∈Lie(G), with j below the uniform nilpotence bound and j! invertible in k.

What ReductiveGroupsPartII must provide (the nilpotent Lie centralizer contract): For a connected reductive G over an algebraically closed field of characteristic p>5, with p∤n+1 for every type Aₙ simple factor, the scheme centralizer of a nonzero nilpotent X∈Lie(G) is smooth and is contained in a proper parabolic of G.

What ReductiveGroupsPartII must provide (the semisimple Lie centralizer contract): For a connected reductive G over an algebraically closed field of characteristic p>5, with p∤n+1 for every type Aₙ simple factor, and semisimple X∈Lie(T) for a maximal torus T, C_G(X) is connected reductive and is generated by T and the root groups U_α with dα(X)=0.

What ReductiveGroupsPartII must provide (the torus centralizer Levi contract): For a connected reductive G over an algebraically closed field and a subtorus S⊂G, the scheme centralizer C_G(S) is a Levi subgroup of G, allowing S=1 and C_G(S)=G.

What ReductiveGroupsPartII must provide (the semisimple group centralizer contract): For a connected reductive G over an algebraically closed field, a maximal torus T and s∈T, C_G(s) is generated by T, the root groups U_α with α(s)=1, and representatives in N_G(T) of the Weyl elements fixing s.

What ReductiveGroupsPartII must provide (the bounded-power Levi centralizer contract): For every split connected reductive root datum there is an integer n_G≥1 such that, over every finite field k, each semisimple s∈G(k) has C_G(sⁿ) a Levi subgroup for some positive n dividing n_G; the Levi may be all of G.

What ReductiveGroupsPartII must provide (the finite-image semisimplification contract): For a split connected reductive G over a finite field k of characteristic sufficiently large in its root datum and a finite subgroup Γ⊂G(k), projection from a minimal k-parabolic P=MU containing Γ determines a G-completely reducible homomorphism Γ→G(k), unique up to G(k)-conjugacy independently of P and M.

What ReductiveGroupsPartII must provide (the finite-image semisimplification scalar-extension contract): For a split connected reductive G over finite k of characteristic sufficiently large in its root datum, a finite Γ⊂G(k) and a finite extension k′/k, the G(k′)-conjugacy class obtained by semisimplifying the scalar-extended Levi projection equals the class obtained by semisimplifying Γ over k′, with a minimal k′-parabolic chosen anew.

What ReductiveGroupsPartII must provide (the parabolic adjoint filtration contract): For a split connected reductive G over finite k of sufficiently large characteristic, a k-parabolic P=MU and a finite Γ⊂P(k), the Γ-module Lie(Gᵈᵉʳ) has the P-stable filtration Lie(U)⊂Lie(P)∩Lie(Gᵈᵉʳ)⊂Lie(Gᵈᵉʳ), whose graded modules are Lie(U), Lie(M)∩Lie(Gᵈᵉʳ) and Lie(G)/Lie(P), the last identified with Lie(U⁻) as an M-module.

What ReductiveGroupsPartII must provide (the uniform finite-field root position contract): For each split connected reductive root datum there is B such that, over every finite field k of characteristic p>B, every split connected reductive G/k of that datum and every proper 𝔽_p-subspace W⊂Lie(Gᵈᵉʳ), some split maximal k-torus T⊂G, root α and vector X∈Lie(G)_α satisfy X∉W; the torus is allowed to depend on W.

What ReductiveGroupsPartII must provide (the prescribed-root regular toral element contract): For each split connected reductive root datum there is B such that, over every finite field k of characteristic p>B, every split connected reductive G/k of that datum, every split maximal k-torus T, root α and a∈k×, there is H∈Lie(T∩Gᵈᵉʳ) with dα(H)=a and dβ(H)≠0 for every root β.

The centralizer contracts use FKP19 Lemma A.2 and its proof, pp.61–62, and Lemma A.5 and its proof, pp.62–63. The bounded-power export uses the torus and semisimple group centralizer exports. The locators for the remaining contracts are FKP22 Lemma A.1 and Remarks A.2/A.8, pp.44–46, Lemma 6.1, pp.27–28, FKP19 Lemmas A.2 and A.5, pp.61–63, Proposition 5.9, p.29 and Lemma 5.13, p.38. The adjoint expansion is FKP22, proof of Lemma A.18, p.51. The scalar-extension comparison semisimplifies again over the enlarged field; it asserts no unchanged minimal parabolic. Section 5.2 owns the stronger simultaneous root-position theorem.

**Checks.**

- For upper unipotent SL₂ matrices, exp(xE₁₂)=I+xE₁₂ and multiplication adds x; exp(0)=I. At p=3, exp(E₁₂)²=I+2E₁₂. The diagonal toral element h has dα(h)=2, nonzero at p=3 and zero at p=2.
- In sl₂ at p≥3, Ad(I+xE₁₂)(E₂₁)=E₂₁+xh−x²E₁₂: the terms are E₂₁, xh and (x²/2)(−2E₁₂). At x=0 the result is E₂₁, and at x=1 it has all three displayed terms; omitting the quadratic term gives the wrong upper-right entry.
- For W=kE₁₂⊕kE₂₁ in sl₂, the diagonal torus has both root lines inside W. Conjugation of E₁₂ by [[1,0],[1,1]] gives [[−1,1],[−1,1]], whose diagonal entries exclude it from W; for W=0 already E₁₂ is outside. The torus cannot be fixed in advance.
- For sl₂ and prescribed dα(H)=1, H=h/2 has root values 1,−1; H=0 has values 0,0 and fails. For a=2, H=h has values 2,−2; prescribing a=0 would force failure of regularity.
- For a nonsplit upper triangular GL₂ image, Levi projection sends [[a,b],[0,d]] to diag(a,d), so b=1 becomes 0. Semisimplifying again over k′ keeps that diagonal sum, while a different minimal parabolic can be necessary: for p≡3 modulo 4, a nonsplit torus C₄⊂GL₂(𝔽_p) acts irreducibly over 𝔽_p but splits over the field with p² elements into characters with eigenvalues i,−i. The minimal parabolic changes from GL₂ to a Borel.
- For the upper Borel of GL₂ at odd p, the trace-zero adjoint filtration has dimensions 1⊂2⊂3; its graded lines are E₁₂, h and the class of E₂₁. The bracket [E₁₂,E₂₁]=h shows why the last graded identification is an M-module identification and not a P-stable opposite-root summand.

- For P=G, U=1, Lie(U)=0 and exp sends the only vector 0 to the identity; its adjoint expansion is the identity on Lie(G). For the Heisenberg radical in SL₃, exp(E₁₂+E₂₃)=I+E₁₂+E₂₃+(1/2)E₁₃; at p=7 the coefficient 1/2 is 4, and at p=2 that expression is unavailable.
- The sl₂ vectors E₁₂, E₂₁ and X=[[−1,1],[−1,1]] span sl₂ because h=E₁₂−E₂₁−X. Their span has dimension 3 at odd p. For Gₘ the derived Lie algebra has dimension 0 and has no proper subspace, so the varying-torus contract has no nonvacuous instance.
- In sl₃, H=diag(2,1,−3) at p=7 has positive-root values 1,5,4, all nonzero, with dα₁(H)=1. At p=5 the middle value is 0, so this particular H fails regularity. The contract asserts existence at its root-datum bound rather than that every toral element works.
- For Γ=1 in GL₂ the minimal parabolic is a Borel and its projection remains trivial; its semisimplification has two trivial factors. For an absolutely irreducible image the minimal parabolic is G and the projection is the original representation. Both comparisons persist under scalar extension, with a new minimal parabolic when necessary.
- For P=G the adjoint filtration has graded dimensions 0,dim Lie(Gᵈᵉʳ),0; for Gₘ all three are 0. For the (1,2) parabolic of GL₃ at p>3, they are 2,4,2 and sum to dim sl₃=8. A direct P-module splitting would incorrectly make the opposite radical stable.
- In SL₂ over k̄ of characteristic 7, C_G(E₁₂) consists of [[a,b],[0,a]] with a²=1: it is smooth of dimension 1 and lies in the upper Borel. For X=0 its centralizer is all SL₂ of dimension 3, so the nonzero hypothesis is necessary for proper-parabolic containment.
- For X=diag(1,−1) in sl₂ at p=7 the root differentials are 2,−2, both nonzero, and C_G(X)=T has dimension 1. For X=0 both differentials are 0 and the generated centralizer has dimension 3. In characteristic 2 this X is central and its centralizer has dimension 3, rather than 1.
- For the diagonal torus in SL₂ the centralizer is that torus of dimension 1; for the trivial subtorus the centralizer is SL₂ of dimension 3. In SL₃ the subtorus diag(t,t,t⁻²) has Levi centralizer of block type (2,1), of dimension 4.
- In PGL₂ at odd characteristic, s represented by diag(−1,1) has root value −1 and a Weyl element fixing s, so its centralizer has two components. Omitting the Weyl representatives loses one component. Its square is 1 and has full PGL₂ centralizer, a Levi of dimension 3; a regular diagonal element with eigenvalue ratio other than ±1 has torus centralizer of dimension 1.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Consume §1.4, “Classical Ribet lattice”, for a compact Hausdorff group acting continuously and irreducibly on E², E a finite extension of ℚ_p, with distinct residual characters. It supplies stable full lattices realizing a nonsplit reduction in either prescribed orientation. Section 8.9 adds the fixed-segment geometry and the endpoint comparison under coefficient extension.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§1.1–1.2, 1.6–1.11, Layer 2 and §§7.2–7.7 for continuous arithmetic representations, decomposition and tame quotients, integral models, actual reductions, coefficient extension, trace-zero adjoints, similitudes, polarized groups and finite-image cohomology. In particular the stable-lattice uniqueness theorem requires absolute residual irreducibility; the reducible stable-segment theorem is §8.9 here.

What ArithmeticGaloisRepresentations must provide (the small-dimensional adjoint semisimplicity contract): At §7.7: for finite k of characteristic p and an absolutely G-irreducible finite Γ⊂G(k), with G connected reductive and p>2(dim Lie(Gᵈᵉʳ)+1), Lie(Gᵈᵉʳ) is a semisimple k[Γ]-module and O_p(Γ)=1.

What ArithmeticGaloisRepresentations must provide (the character-twisted adjoint H¹ contract): At §7.7: for finite k of characteristic p and an absolutely G-irreducible finite Γ⊂G(k), with G connected reductive and p>2(dim Lie(Gᵈᵉʳ)+1), H¹(Γ,Lie(Gᵈᵉʳ)⊗χ)=0 for every character χ:Γ→k×, also after a finite splitting extension of k.

What ArithmeticGaloisRepresentations must provide (the small-dimensional extension splitting contract): At §7.7: for each n≥2 there is B(n) such that, for finite k of characteristic p>B(n), every Γ⊂P(k) for the (n₁,n₂) block parabolic of GLₙ, n₁,n₂>0 and n₁+n₂=n, with absolutely irreducible diagonal block modules and injective projection to its Levi image, has a Γ-stable complement to the first block in kⁿ.

What ArithmeticGaloisRepresentations must provide (the Larsen–Pink normal series contract): At §7.7: for every n≥1 there is J(n) such that every finite Γ⊂GLₙ(k), over a field of positive characteristic p, has Γ₃⊲Γ₂⊲Γ₁⊲Γ, each Γᵢ normal in Γ, with [Γ:Γ₁]≤J(n), Γ₃ a p-group, Γ₂/Γ₃ abelian of order prime to p and Γ₁/Γ₂ a product of finite simple groups of Lie type in characteristic p; if O_p(Γ)=1, Γ₃=1, Γ₂ is central in Γ₁ and |[Γ₁,Γ₁]∩Γ₂| has a bound depending only on n.

What ArithmeticGaloisRepresentations must provide (the Levi-restricted adjoint H¹ contract): At §7.7: For each split connected reductive root datum there is B, depending only on it, such that for finite k of characteristic p>B, a Levi subgroup L of a parabolic of G over k and a finite Γ⊂L(k)×k× whose projection to L(k) is absolutely L-irreducible, H¹(Γ,W∨⊗χ)=0 for every absolutely irreducible k[Γ]-subquotient W of Lie(Gᵈᵉʳ)⊗k restricted to Γ through the first projection, χ being the second projection; hence H¹ of Γ vanishes with coefficients in the dual of the semisimplification of that restriction, twisted by χ.

The first two exports are FKP19 Lemma A.1, pp.60–61. The splitting export is the complete-reducibility implication needed when applying FKP22 Corollary 8.3 to a nonsplit representation; its prime bound is quantified by n, without assigning a numerical bound to the locator-only Gur99 Theorem A. The Levi-restricted export is the H¹ input of FKP22 Lemmas A.5 and A.14: the coefficients are the whole ambient derived adjoint module restricted to a Levi image, which for G=SL₃ and the (2,1) Levi has graded dimensions 2+4+2=8, while Lie(Lᵈᵉʳ) has dimension 3; the G-irreducible export above does not cover it.

Larsen–Pink gives Γ₃⊲Γ₂⊲Γ₁⊲Γ, bounded [Γ:Γ₁], defining-characteristic simple factors in Γ₁/Γ₂, a prime-to-p abelian factor Γ₂/Γ₃ and a normal p-group Γ₃. It does not itself assert the H¹ vanishing or small-representation splitting (LP11 Theorem 0.2, p.1106; §12, p.1156; Gur99 Theorem A, cited by locator).

**Checks.**

- In SL₂(𝔽₁₁), dim sl₂=3 gives the sufficient bound 11>2(3+1)=8; 7 does not meet it. For a torus the derived module is 0, O_p of any finite subgroup of k× is 1, and every twisted H¹ of that zero module is 0.
- For Γ=C₂ acting by −1 on a line over 𝔽₁₁, H¹=0 by averaging with 2⁻¹=6. A trivial line for C₁₁ has H¹ of dimension 1; that image has O₁₁≠1 and supplies no example of the irreducible-adjoint contract.
- A conjugate of the diagonal C₂ action diag(1,−1) by I+E₁₂ has upper-right entry −2; its Levi projection is injective and the complement is the line spanned by e₁+e₂. For the nonsplit unipotent C_p action I+E₁₂ the Levi projection has kernel of order p, and there is no complementary invariant line.
- For the Levi-restricted export with L=T a maximal torus, Γ has order prime to p, so every H¹ vanishes by averaging; for G=SL₃ and the (2,1) Levi with Γ the image of (r,κ̄), the coefficient module has dimension 8, of which only the 3-dimensional sl₂ part is covered by an adjoint statement for L. For Γ generated by (diag(I+E₁₂,1),1) in L(k)×k×, the projection fixes the line ke₁ of the two-dimensional block and lies in a proper parabolic of L, so it is not absolutely L-irreducible and the export does not apply. The block SL₂(𝔽_p), which contains the same element of order p, is absolutely L-irreducible: its upper and lower unipotents fix only the lines ke₁ and ke₂, so no line is fixed, even over k̄. An element of order p in a unipotent subgroup of L(k) does not by itself exclude absolute L-irreducibility.
- For Γ=C₃ in GL₁(𝔽₇), take Γ₁=Γ₂=Γ and Γ₃=1: the three factor orders are 1,3,1. For an upper-unipotent C₇ in GL₂(𝔽₇), take Γ₁=Γ₂=Γ₃=Γ: those orders are 1,1,7 and O₇ is nontrivial. For Γ=1 every factor order and the outer index are 1.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Consume §§0.2 and 0.7 for compact analytic groups and p-valuations, §F.2 for continuous completed bar complexes and the cohomology/Ext comparison and §0.13 for the finite resolution input. An open normal uniform subgroup has finite index; no prime-to-p index assumption is made.

What NoncommutativeAndEquivariantIwasawa must provide (the Lazard lattice comparison contract): For a sufficiently small uniform subgroup U and every finite free O-lattice V with continuous linear action, export a finite free completed-group-ring resolution computing all V/ϖʳ cohomology from one bounded finite O-complex and the rational comparison with Lie(U)-cohomology, with the action obtained by differentiation.

This is Lazard65 V (2.2.2.3), (2.2.3.1), pp.165–166, and Theorem (2.4.10), pp.178–179, as applied in FKP19 Lemma B.1, p.64. It is stronger than the exterior-algebra calculation for trivial residual coefficients.

### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII

Consume ND.0, especially the p-valued analytic structure and ordered-basis charts. The compact-open subgroup can be made normal inside a compact group by taking its finite core; sufficiently deep congruence subgroups give such charts for smooth integral group points (Lazard65 III (3.1.3), pp.91–92 and (3.1.7.4), p.94). The open-uniform existence theorem itself is NoncommutativeAndEquivariantIwasawa §0.2.

### From TauCetiRoadmap.AffineLieAlgebras

Consume §A1, “Currents and continuous cohomology”, for Whitehead H¹ and H² vanishing on finite-dimensional modules over a complex simple Lie algebra. The export requested from AutomorphicFormsOnReductiveGroups below differs by using the ArithmeticLocallySymmetricSpaces ALS.F.5 complex for semisimple Lie algebras over p-adic coefficient fields and all-degree vanishing when there are no invariants.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume Layer 1's comparison with the absolute Chevalley–Eilenberg complex from ArithmeticLocallySymmetricSpaces ALS.F.5. Only the absolute, finite-dimensional characteristic-zero algebraic theorem enters §4.4; a theorem for a real relative pair alone does not suffice.

What AutomorphicFormsOnReductiveGroups must provide (the semisimple Lie cohomology vanishing contract): Extending the complex-simple Whitehead input of AffineLieAlgebras §A1 to the shared absolute Chevalley–Eilenberg complex of ArithmeticLocallySymmetricSpaces ALS.F.5, export all-degree vanishing for a semisimple characteristic-zero Lie algebra acting on a finite-dimensional module with no invariants, and Whitehead vanishing in degrees one and two for every finite-dimensional module, compatibly with scalar extension to p-adic coefficient fields.

The application and required degrees are FKP19 Lemma B.1, p.64. For a trivial rank-one module over sl₂, H⁰ has dimension 1 but H¹=H²=0; for the one-dimensional abelian Lie algebra with trivial coefficients H¹ has dimension 1, so semisimplicity cannot be omitted.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

Consume ALS.F.5 for the absolute and relative Chevalley–Eilenberg complexes and scalar extension. The absolute specialization, rather than only a relative real-group pair, is the carrier for the semisimple Lie-algebra vanishing export above. Degree zero is the invariant submodule, so the trivial line has dimension 1 there, whereas a module without invariants has dimension 0.

### From TauCetiRoadmap.ProfiniteProPGroups

Consume Layer 3, the open Frattini subgroup and the Frattini-quotient generation criterion for a topologically finitely generated pro-p group. The application is to the compact analytic derived congruence kernel, with a closed image subgroup. The subgroup ℤ⊂ℤ_p is dense and surjects modulo p but is proper; closedness is indispensable.

### From TauCetiRoadmap.Chebotarev

Consume Layer 10, Dirichlet-density Chebotarev for a finite Galois extension and its conjugacy classes. Apply it to actual finite composita. It supplies neither independence of cocycle fields nor intersection of an arbitrary positive-upper-density family with a prescribed class. With two independent binary tests, the two-failure proportion is 1/4; with a repeated test it is 1/2. Section 3.2 must distinguish these values.

### From TauCetiRoadmap.FunctionFieldArithmetic

Consume §5.8, quantitative Chebotarev in each degree, including the restriction of Frobenius to the constant field and the allowed degree congruence. If the constants extension has degree 2, a nontrivial constant Frobenius occurs only in odd degree; no assertion of positive density in every degree is used.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Consume §§1.17, 1.20, 2.28, 2.30 and 3.11 for fixed-quotient framed G-valued functors, generic components and equal-characteristic lifts. Consume §§1.21, 6.5 and 6.17 for G-valued ordinary conditions with a prescribed full torus inertia character and their union of components of fixed-quotient framed dimension dim Gᵈᵉʳ+[F_v:ℚ_p]dim Flag(G⁰), and §§2.5, 2.14, 8.5 and 8.10 for Steinberg points and determinant-normalized GL₂ ordinary/crystalline lifts.

What LocalGaloisDeformationRings must provide (the root cocycle lattice contract): At §2.28 export the fixed-quotient root lifting functors and explicit cocycle lattices of FKP19 Lemma 3.5, pp.17–18 and Lemma 6.7, pp.46–47, including divided coboundaries, coefficient short exactness, |Lᵅ_r|=|H⁰_w(M_r)|, rank-one unramified quotients and stability of the nonempty higher lifting fibres.

What LocalGaloisDeformationRings must provide (the smooth local approximation contract): At §§1.22, 2.28 and 3.11 export smooth-point analytic neighborhoods, their cocycle lattices and exact tangent cardinalities, with one finite coefficient extension giving smooth points on the chosen components to every original-uniformizer accuracy.

What LocalGaloisDeformationRings must provide (the GL₂ local determinant normalization contract): At §§2.14, 8.5 and 8.10, for p odd, r≥2 and an odd residual extension of 1 by χ̄≠κ̄⁻¹, export the ordinary potentially crystalline local lift over ℚ_p with unramified quotient and determinant μω₀, where μ=κʳ⁻¹[χ̄κ̄¹⁻ʳ] and ω₀ is finite p-power order, residually trivial and trivial on Art_ℚp(p); at the extension-sensitive Serre weight export the compatible crystalline choice used in §8.3.

The first two contracts use FKP19 Proposition 4.7 and Lemma 4.9, pp.23–24. The full-torus and ordinary-component imports use FKP22 Appendix B, Definition B.2 and Lemmas B.3–B.4, pp.52–55. The determinant contract is the local normalization used in FKP22, proof of Theorem 7.4, p.36, with Lemma 7.2, pp.33–35. The Steinberg input is FKP22, proof of Proposition 9.1, pp.41–42. For Gₘ there are no roots; root equations impose zero constraints on its torus character, whereas fixing its basis character specifies the whole character. At a trivial GL₂ place and r=2 over ℤ₃, |H⁰(sl₂_r)|=9³=729; at a degree-one p-place the regular local condition has 729·9=6561 elements.

**Checks.**

- On Gₘ there are 0 roots and one basis character. Characters taking an inertia generator to 1 and to 4 in ℤ₃× satisfy the same empty root equations but differ on that basis character; the full-torus condition distinguishes them.
- For fixed-determinant GL₂ over a degree-one p-adic field, dim sl₂=3 and dim Flag=1 give ordinary framed dimension 3+1=4; the unrestricted dimension is 3+3=6. Away from p, the prescribed Steinberg nilpotent N=E₁₂ has rank 1, whereas N=0 has rank 0 and gives no Steinberg point.
- For r=2, reduction of μ is κ̄[χ̄κ̄⁻¹]=χ̄. The correction ω₀ has residual value 1 and ω₀(Art(p))=1. An unramified local factor taking Art(p) to ζ≠1 fails this normalization even when its restriction to inertia is 1.

### From TauCetiRoadmap.ClassFieldTheory

Consume Layers 7 and 13 for the local Artin normalization and local/global cyclotomic reciprocity over ℚ. Section 8.3 needs a finite-order p-primary local character trivial on Art(p), so that it extends through the cyclotomic extension of ℚ unramified outside p. A nontrivial unramified value at p is not such a character. If the local correction has value −1 on Art(p), its value fails the required 1 test even though its restriction to units may be trivial.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

Consume Layer 4, “The local Serre weight”, for the extension-sensitive Serre weight, Layer 5, “Deligne–Serre eigenvalue lifting”, and §§6.2 and 6.4 for the classical attachments in weights at least two and one. Use Layer 7, “Residual modularity and the classical target”, for the residual comparison with the chosen coefficient embedding. ModularForms Layers 4, 8G and 10C supply normalized newforms, coefficient fields and the finite-dimensional spaces whose eigenforms are finite at fixed weight and level. A semisimplified attachment does not supply an actual extension witness.

### From TauCetiRoadmap.ModularForms

Consume Layers 4, 8G and 10C for the finite-dimensional classical cusp-form spaces, their Hecke actions, normalized eigenforms and newform decomposition. Section 8.10 uses finiteness of normalized simultaneous eigensystems at fixed weight and level, together with the finite coefficient embeddings; it does not infer finiteness of all vectors in a complex vector space.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Consume Layers 1 and 5 for classical/Hilbert attachments and local–global compatibility at ordinary, crystalline and Steinberg places, with the stable lattice retained. The classical rank-two construction in AlgebraicModularFormsAndSerreWeights §6.1 fixes the precise normalization used here. AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 supplies the compatible-system local comparisons in §10.3.

### From TauCetiRoadmap.ClassicalSerreModularity

Consume R27.6, “Full classical Serre theorem”, for continuous odd absolutely irreducible residual GL₂ representations over ℚ, with the conductor and Serre weight at their stated hypotheses. The reducible argument of §8.4 instead uses the Eisenstein and Deligne–Serre suppliers. Consume §I.1, “Ordinary lifting over ℚ”, and its target `I.1/residually-reducible-ordinary-lifting`, Skinner–Wiles Theorem A over ℚ: for p odd and a continuous odd irreducible finitely ramified ρ whose residual semisimplification is, after a finite-order twist, 1⊕χ̄ with χ̄ nontrivial on the p-decomposition group, with the nearly ordinary shape (∗ ∗; 0 1) on p-inertia and determinant ψκʳ⁻¹ with ψ finite and r≥2, ρ is attached to a classical newform of weight r. Section 8.5 applies it with the unramified quotient and its residual character matched by the local determinant normalization of §8.3. The same subsection owns the totally real route behind that theorem, of which §8.7 uses only the hypotheses.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

Consume §5.3, Skinner–Wiles Theorem B, over a totally real F under its Hypothesis H for all solvable totally real extensions of F: odd residual ratio, ratio of even order on every p-decomposition group, the stated nearly ordinary local characters and determinant ψκʳ⁻¹ with ψ finite and r≥2. Section 8.7 retains every hypothesis of that theorem, including Hypothesis H, and asserts only the implication; the unconditional statement over ℚ is the ClassicalSerreModularity target above.

### From TauCetiRoadmap.GL2ModularityLifting

Consume §10.15, Pan's residually reducible Fontaine–Mazur theorem, for irreducible odd finitely ramified potentially semistable GL₂ representations over ℚ with distinct Hodge–Tate weights and residual semisimplification a sum of two characters. At p=3 the local residual ratio must differ from ω. The local scalar ratio 1 passes that exclusion, since ω≠1 on `Γ_{ℚ₃}` (Pan22 Theorem 1.0.2, p.3). Its unconditional source theorem, rather than a finiteness hypothesis on a particular deformation ring, is the required export.

What GL2ModularityLifting must provide (the unconditional Pan–Fontaine–Mazur contract): At §10.15 export Pan22 Theorem 1.0.2 with precisely its continuous irreducible odd finitely ramified potentially semistable GL₂ input over ℚ, distinct Hodge–Tate weights, reducible residual semisimplification and p=3 ratio exclusion, without the additional conditional arithmetic hypotheses CC1–CC5 and LC.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume §AL.3, “Leveled shtukas and ramified rank induction”, for both directions between cuspidal GLₙ automorphic representations with finite-order central character and irreducible finitely ramified p-adic Galois representations with finite-order determinant.

What AutomorphicLFunctionsAndLocalFactors must provide (the function-field Langlands lattice witness contract): At §AL.3 retain a finite coefficient field and a chosen stable integral lattice, with its full residual representation and residual coefficient embedding, in each direction of that correspondence.

This is the exact arithmetic interface used in FKP22 §8, pp.37–38. It does not include the reducible lifting theorem, which is §9.2 here.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Consume §2.28, residual potential automorphy with a Steinberg place, including its finite-set variant, and §2.48, the strictly pure compatible-system theorem for a potentially automorphic geometric GSp lift. The residual potential-automorphy extension is Galois and disjoint from the specified residual and cyclotomic field. Two auxiliary places have distinct residue characteristics and every place above either has the prescribed Steinberg component.

What ModularityAndLanglandsExtensions must provide (the ordinary residual potential automorphy contract): The seed of §2.28 must be explicitly ι-ordinary of weight zero, compatibly with its simultaneous finite-place Steinberg variant and the stated cyclotomic constituent conditions through the disjoint totally real extension.

What ModularityAndLanglandsExtensions must provide (the all-place symplectic monodromy contract): The all-coefficient-place density conclusion of §2.48 must include the exact reductive-subgroup classification with a regular unipotent element, the irreducibility and rank hypotheses, and independence of formal character needed to exclude the principal GL₂ alternative for n>1.

The finite-place construction is BLGGT14 Proposition 3.1.1, pp.545–546, Theorem 3.1.2, pp.546–549, and BLGHT11 Lemma 5.1(2), pp.34–35. The system construction is BLGGT14 Theorem 5.5.1, pp.590–593. BLGGT14 Lemma 5.3.1, pp.580–581 is a component/multiplicity statement and is not the formal-character independence theorem. FKP22 pp.42–43 supplies the application.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §7.1, “Solvable GLₙ base change and descent”, for descent of the Galois-invariant cuspidal representation over the quadratic CM extension L′/F′ and its norm-trivial twist ambiguity. Choose the descent and its quadratic twist so its attached Galois representation is ρ restricted to `Γ_{F′}`, before applying the compatible-system supplier in §10.3.

**Checks.** In rank one over a quadratic extension, 1 and its quadratic character η have the same base change because η restricts to 1. At an unramified inert place the degree is 2, so a Satake eigenvalue a becomes a²; for a=2 this is 4. In rank two a descent differing by η changes an inert trace t to −t but leaves determinant d unchanged, since η²=1.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

Consume PL.7, “The ANT lifting theorem with source primitivity”, and its full eight hypotheses. The input is a CM field L′, dimension d=2n≥2, p>3 with p∤d, a continuous semisimple characteristic-zero representation, finite ramification, conjugate self-duality with multiplier κ¹⁻ᵈ, ordinarity of weight λ, distinct individually polarized residual constituents, a Steinberg-shaped place away from p, an ι-ordinary RACSDC seed matching the residual semisimplification and Steinberg component, the two cyclotomic field exclusions, constituentwise cyclotomic irreducibility and distinctness, noninduction of the residual semisimplification over k̄ and no order-p quotient of its image (ANT20 Theorem 1.1, pp.1–2). Its source-primitivity form and PL.6's small-rank and image-invariance results are used instead of silently replacing noninduction by a stronger condition. For p≫n the rank bound is available; each constituent still needs its own polarization. The field L′ is the CM composite LF′, not F′ itself.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

Consume AG2.5–AG2.6 for local–global compatibility of the descended system and regular-unipotent monodromy at an away-ℓ Steinberg place. If the residue characteristics of v₀,v₁ are q₀≠q₁, choose v₁ for ℓ=q₀, v₀ for ℓ=q₁ and either otherwise. This covers every coefficient prime, including the two exceptional ones separately.

## How to read the build

Layers 0–1 fix the datum and residual-image criteria. Layer 2 builds prime-field ramification classes; Layer 3 uses them in doubling and controlled finite towers, under the explicit arithmetic selection hypothesis of §3.2. Layer 4 develops relative images from supplied local cocycle lattices. Layer 5 annihilates those images and Layer 6 completes the lift over one finite ramification set. Layer 7 recovers Levi-valued reductions by changing the lattice; Layers 8–10 apply the lifting theorems to actual modularity, function-field automorphy and ordinary symplectic representations. Each target lists statement and proof inputs separately when their scopes differ. `Suggested.lean` states the degree-one uniform torsion theorem of §4.4, the one deep result of this roadmap whose carriers exist at the pins, and records the headline lifting theorems with the carriers each lacks there; none of those lifting headlines is statable.


## Layer 0: Global lifting data and arithmetic interfaces

### 0.1 G-valued global lifting datum

A lifting datum consists of a global field F of characteristic different from p, a finite set S of finite places containing all residual ramification and all places above p in characteristic zero, a finite extension E/Q_p with integers O, uniformizer ϖ and residue field k, a smooth affine O-group G with split reductive G⁰ and finite étale component group of order prime to p, a continuous `ρ̄:Γ_{F,S}→G(k)`, and a continuous lift `μ:Γ_{F,S}→(G/G^der)(O)` of its quotient. Here G^der is the derived group of G⁰. Require p odd and very good and the central isogeny `G^der×Z⁰_{G⁰}→G⁰` to have prime-to-p kernel. Write M=Lie(G^der)_k with action Ad∘ρ̄ and M*=Hom_k(M,k)(1); * includes exactly one cyclotomic twist. Lift^μ(A) is the existing fixed-quotient continuous lifting functor, with strict conjugacy by the congruence kernel when passing to deformation classes. The finite component action and μ are part of the data; the quotient G/G^der need not be a torus. In characteristic zero μ is de Rham for geometric conclusions. (FKP22, §2, p.9; §1.2, pp.5–6; FKP19 Assumption 2.1, p.14.)

One proof route proceeds as follows. Specialize the existing G-valued framed functor, then impose equality of the quotient representation. Use the prime-to-p central isogeny to identify its infinitesimal kernel with Lie(G^der). Use the invariant trace form only under the prime hypotheses to identify M∨ with M; keep its Tate twist visible.

The API has the following mathematical properties.

- A continuous lift of the specified quotient determines the fixed-multiplier problem.
- The fixed-μ tangent representation is Lie(G^der), not Lie(G) or its quotient by all scalars without hypotheses.
- Finite coefficient extension transports ρ̄, μ, the tangent representation and its evaluation pairing, and composes with a second extension.

**Checks.**

- For GL₂ and p odd, fixed multiplier is fixed determinant and M=sl₂(k), of dimension 3. At p=3, tr([[a,b],[c,d]])=0 imposes d=−a: 3 coordinates instead of the 4 in gl₂.
- For a torus G, G^der is trivial and M=0; its multiplier still records the entire representation. For Gₘ the derived group is 1, hence its Lie dimension is 0 and the fixed-quotient lift is exactly μ.
- For a trivial one-dimensional coefficient module its Tate dual has cyclotomic action; adding a second twist does not give the specified dual. If κ̄(g)=2 in 𝔽₅, the two proposed actions are 2 and 4, so the extra twist fails.

*Needs:* LocalGaloisDeformationRings §§1.17, 1.20; ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract.

### 0.2 Odd G-valued residual representations

For F a number field and p odd, call ρ̄ odd when for every infinite place v the dimension of Lie(G^der)_k fixed by its decomposition group equals dim Flag(G⁰). At a real place this is the fixed space of ρ̄(c_v). For nontrivial semisimple G this condition rules out complex places. For a torus both dimensions are zero, so total reality is a separate hypothesis in the geometric theorem. Use the standing good-characteristic conditions and the actual component containing complex conjugation. For a torus the numerical condition alone does not force F totally real; record total reality separately in geometric lifting theorems. (FKP19, Definition 1.2 and discussion, pp.2–3.)

One proof route proceeds as follows. Use involution eigenspaces in the adjoint module and the root decomposition to prove the lower bound. Compare the definition with the matrix determinant test for GL₂.

The API has the following mathematical properties.

- At each infinite place the invariant dimension equals the flag dimension; at a real place use the actual conjugation involution.
- The condition is unchanged by coefficient extension and G(k̄)-conjugacy.
- For GL₂, p odd and F totally real, oddness is equivalent to determinant ρ̄(c_v)=−1 for every real v.

**Checks.**

- diag(1,−1) on k² fixes a one-dimensional subspace of sl₂, equal to the flag dimension. At p=3 the eigenvalues on h,E₁₂,E₂₁ are 1,2,2, with fixed dimension 1.
- The identity on k² fixes all three dimensions of sl₂ and fails oddness. Identity conjugation has eigenvalues 1,1,1 and fixed dimension 3 instead of 1.
- The derived adjoint and flag dimensions of a torus are both zero; total reality must still be assumed when required. For Gₘ over an imaginary quadratic field the two dimensions are both 0; it passes numerical oddness and fails total reality.

*Needs:* §0.1; ReductiveGroups Layer 7.

### 0.3 The four residual-image conditions

For a lifting datum put K=F(ρ̄,μ_p), F̃ the extension cut out by the component map, and `K∞=K(μ_{p∞})`. Define C1 by H⁰(Γ_F,M)=0, C2 by H⁰(Γ_F,M*)=0, C3 by: no nonzero F_p[Γ_F]-quotient of M is isomorphic to an F_p[Γ_F]-subquotient of M*, and C4 by H¹(Gal(K/F),M*)=0. C1,C3 are the two additional clauses of Assumption 4.1, which also includes Assumption 3.1; C4 is the cohomological clause of Assumption 3.1, whose other clause is the prime bound p≫G⁰, stated here as p>B_G; C2 and the specified local lifts are the remaining clauses of Assumption 5.1, which again includes p≫G⁰. Define `D_cyc=max{d:μ_{p^d}⊂K}`, with d≥1. Prime-field modules are used in C3 even when k is larger than F_p. K uses the full residual representation, not merely its adjoint image. (FKP22, Assumptions 3.1, 4.1, 5.1, pp.10,19,23; Appendix A, pp.43–44.)

One proof route proceeds as follows. Reuse the arithmetic invariant and cohomology carriers. State quotient/subquotient nonoverlap as a property of genuine equivariant maps; exclude the zero quotient. Take fixed fields of the finite representations and cyclotomic character.

The API has the following mathematical properties.

- C1–C4 together with the fixed local μ-lifts are exactly the cohomological part of the main hypotheses.
- C3 rules out any nonzero equivariant surjection M→W with W a subquotient of M*.
- Disjoint prime-field Jordan–Hölder constituents imply C3; C3 itself does not require semisimplicity.

**Checks.**

- M=0 satisfies C1–C4; C3 does not fail on W=0. The zero module has h⁰=h¹=0, and there are 0 nonzero quotients.
- For nonzero trivial M with trivial cyclotomic action, C1,C2,C3 fail. For M=𝔽₃ the two fixed dimensions are 1 and the identity map onto M has rank 1, violating C1–C3.
- A k-trivial line has [k:F_p] prime-field trivial constituents; a k-multiplicity-free decomposition need not be F_p-multiplicity-free. For trivial k=𝔽₉, one k-line has prime-field dimension 2 and two trivial composition factors, rather than one.

*Needs:* §0.1; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 0.4 Trivial primes and chosen local generators

A finite place w outside S is trivial when `ρ̄|Γ_{F_w}=1` and q_w≡1 mod p. Fix its decomposition embedding, an arithmetic Frobenius σ_w and a generator τ_w of tame pro-p inertia, with `σ_wτ_wσ_w⁻¹=τ_w^{q_w}`. At such a place M and M* have trivial residual action; values of H¹ classes on σ_w and τ_w are independent of changing a cocycle by a coboundary. The place has residue characteristic different from p. Norm and Frobenius conventions agree in both characteristics. (FKP22, Definition 3.2 and Remark 3.3, p.11; FKP19 Notation 5.1, pp.25–26.)

One proof route proceeds as follows. Interpret triviality as complete splitting in K. Use the existing local tame-quotient description and the vanishing of coboundaries for trivial action.

The API has the following mathematical properties.

- A place away from the defining ramification is trivial iff it splits completely in K.
- A trivial prime has q_w≡1 mod `p^{D_cyc}`.
- Chosen σ_w,τ_w define linear evaluations on local H¹, compatible with coefficient maps.

**Checks.**

- A place split in F(ρ̄) with q_w not congruent to 1 mod p is not trivial. For the trivial residual representation at p=3, norms 7 and 5 give cyclotomic residues 1 and 2.
- The congruence q_w≡1 mod p does not suffice if ρ̄(Frob_w) is nonidentity. At norm 7, the residual value diag(1,2) has rank(g−1)=1 and prevents splitting.
- For a trivial local action d⁰m evaluates to zero on both chosen generators. For m=1 and trivial local action, g·m−m=1−1=0 at σ and τ.

*Needs:* §0.3; ArithmeticGaloisRepresentations Layer 2.

### 0.5 Cocycle fields and strong linear disjointness

If the finite Γ_F-module V is trivial over K and z∈H¹(Γ_F,V), define K_z/K by the kernel of the homomorphism z|Γ_K. Its Galois group is the actual additive image z(Γ_K), with Gal(K/F) acting by conjugation. A finite family {L_i/K} is strongly linearly disjoint when the restriction Gal(∏L_i/K)→∏Gal(L_i/K) is an isomorphism; an infinite family has this property for every finite subfamily. Over K, classes and cocycles yield the same field. All fields sit in one fixed separable closure and are Galois over F where conjugation is used. (FKP22, §1.3, pp.7–8; Lemma 3.7, pp.15–16; FKP19 Notation 5.1, pp.25–26.)

One proof route proceeds as follows. Use the kernel of restriction on the existing continuous cocycle carrier. Compare changing representatives and prove equivariance directly from the cocycle identity. Express strong disjointness by the restriction isomorphism, not just pairwise intersections.

The API has the following mathematical properties.

- Gal(K_z/K) is equivariantly the additive image of z|Γ_K.
- Adding a coboundary changes no restriction to Γ_K and hence no cocycle field.
- Strong disjointness of an infinite family is equivalent to its finite-subfamily formulation.

**Checks.**

- The zero class cuts out K itself. Its image has order 1, so its fixed-field degree is 1.
- Three distinct quadratic subextensions of a biquadratic extension are pairwise disjoint but are not strongly disjoint. For the three lines in C₂² the degree product is 8 and the compositum degree is 4, although each pair has intersection degree 1.
- A surjective homomorphism Γ_K→F_p cuts out a degree-p extension, not a degree-|k| extension unless its image is all of k. At p=3 with k=𝔽₉ the prime-field image has 3 elements, giving degree 3 rather than 9.

*Needs:* §0.3; Tau Ceti `TauCeti.ContCohomology.H1`; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 0.6 Trivial conjugation on an abelian compositum

For finite Galois L/F and abelian A/F, conjugation by Gal(L/F) on Gal(LA/L), defined by lifting to Gal(LA/F), is trivial. (FKP22, Lemma 2.1, p.10.)

One proof route proceeds as follows. Restriction embeds Gal(LA/L) into the abelian group Gal(A/F). Every commutator restricts to the identity on A and on L, hence on LA.

**Checks.**

- For two distinct quadratic extensions of Q, their biquadratic compositum has trivial conjugation on either relative C₂ factor.
- For two distinct quadratic fields, the compositum group is C₂×C₂ and σhσ⁻¹=h, so the commutator is 1. If the abelian-field hypothesis is dropped, in an S₃ extension over its quadratic subfield a transposition sends (123) to (132), which is different.

*Needs:* ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 0.7 The first cyclotomic layer in a cocycle field

For a finite Galois K/F containing μ_p, D_cyc is finite and Gal(K∞/K)≅Z_p. If V is killed by p and trivial on Γ_K, then K_z∩K∞ is either K or the unique degree-p layer `K(μ_{p^{D_cyc+1}})`. If the Γ_F/K conjugation action on Gal(K_z/K) has no nonzero trivial quotient, the intersection is K. These assertions also hold for global function fields with p different from the characteristic. p is odd; the roots of unity in K are finite. (FKP22, §3, pp.11,13; FKP19 Notation 5.1, pp.25–26.)

One proof route proceeds as follows. Use the structure of the p-adic cyclotomic image; over a function field use its constant-field description. Gal(K_z/K) is killed by p, so any procyclic quotient has order at most p. Apply trivial conjugation in an abelian compositum.

**Checks.**

- If V=F_p with trivial conjugation, its cocycle field may be the first degree-p cyclotomic layer; absence of nontrivial constituents cannot be replaced by absence of submodules.
- For p=3 and D=1, an elementary abelian cocycle field can intersect the cyclotomic tower in degree 1 or 3, never 9. A trivial-action 𝔽₃ quotient permits degree 3; a character with g acting by −1 admits no map onto that trivial quotient and forces degree 1.

*Needs:* §0.5; §0.6; ArithmeticGaloisRepresentations Layer 2.

### Examples

Over 𝔽₃ the trace-zero 2-by-2 matrices have 3 free coordinates, whereas gl₂ has 4. For Gₘ the derived tangent dimension is 0 and fixing μ fixes its one torus character. On sl₂(𝔽₃), diag(1,−1) fixes h and negates E₁₂,E₂₁: the fixed dimension is 1. Scalar conjugation fixes all 3 dimensions and fails the required value 1. In a C₂×C₂ extension the three quadratic fields have pairwise intersection of degree 1 over the base, but their compositum has degree 4 rather than 2³=8. The zero cocycle has image order 1 and cuts out the base field.

### Dependencies

LocalGaloisDeformationRings §§1.17, 1.20; ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract; §0.1; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; §0.3; ArithmeticGaloisRepresentations Layer 2; Tau Ceti `TauCeti.ContCohomology.H1`; §0.5; §0.6.

## Layer 1: Residual-image criteria

### 1.1 Absolutely irreducible reductive images

For a connected split reductive G/k and an absolutely G-irreducible finite subgroup Γ⊂G(k), p>2(dim Lie(G^der)+1) implies semisimplicity of Lie(G^der), absence of a nontrivial normal p-subgroup of Γ, and H¹(Γ,Lie(G^der)⊗χ)=0 for every character χ. For p>5, excluding p∣n+1 in type A_n, H⁰(Γ,Lie(G^der))=0. Absolute G-irreducibility means noncontainment in every proper parabolic after extension to k̄. The module and character may be considered after a finite splitting extension of k. (FKP19, Appendix A, Lemmas A.1–A.2, pp.60–62.)

One proof route proceeds as follows. Use low-height complete reducibility for the adjoint representation. A normal p-subgroup fixes every simple constituent, hence lies in the prime-to-p center. Apply the requested small-representation H¹ theorem to the adjoint image. For invariants split a fixed Lie element into its semisimple and nilpotent parts and use the proper-parabolic centralizer criteria.

**Checks.**

- For SL₂ at p≥7 a full SL₂(F_p) image has no fixed vector in sl₂; absolute irreducibility refers to parabolics of SL₂ rather than an arbitrary faithful representation.
- For SL₂(𝔽₁₁), h has nonzero brackets 2E₁₂ and −2E₂₁ with the root vectors, and commuting with both root groups forces all 3 adjoint coordinates to be 0. The displayed H¹ bound is p>2(3+1)=8, so 11 passes it and 7 does not pass that sufficient bound.

*Needs:* §0.1; ReductiveGroups Layer 7; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional adjoint semisimplicity contract and the character-twisted adjoint H¹ contract; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract and the semisimple Lie centralizer contract.

### 1.2 Bounded cyclic quotients of irreducible images

For a fixed split semisimple root datum and sufficiently large p there is a_G such that every absolutely G-irreducible Γ⊂G(k) has no cyclic quotient of order at least a_G. For every split connected reductive G there is also n_G, depending only on its root datum, such that for each semisimple s some s^n, n∣n_G, has Levi centralizer. The proof of the a_G bound first treats adjoint G; the semisimple version follows by accounting for the bounded central kernel. The constants are uniform in finite k of characteristic p; a prime bound is part of the conclusion. (FKP19 Lemmas A.3, A.5, A.6, pp.62–63; LP11 Theorem 0.2, p.1106 and §12, p.1156.)

One proof route proceeds as follows. Use the Larsen–Pink normal series, with its central prime-to-p part when O_p(Γ)=1. A large cyclic quotient forces a large prime-to-p central cyclic subgroup, by averaging for a bounded quotient. Raise a generator to a bounded power so that its centralizer is a proper Levi, contradicting irreducibility.

**Checks.**

- For a torus the semisimple statement does not apply: finite multiplicative subgroups have arbitrarily large cyclic quotients.
- For the diagonal torus over 𝔽₁₁, its point group has a cyclic quotient of order 10; over `𝔽_{11ʳ}` that order is 11ʳ−1 and is unbounded. This excludes replacing semisimple G by a torus. In adjoint type A₁, diag(−1,1) has square 1, whose centralizer is the whole group, a Levi.

*Needs:* §1.1; ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§7.2–7.7 and the Larsen–Pink normal series contract; ReductiveGroupsPartII RG2.1, the bounded-power Levi centralizer contract.

### 1.3 Central Γ-factors of a finite p-group

For a finite p-group Σ with Γ acting by automorphisms, a central Γ-series is 1=Σ₀⊲⋯⊲Σ_n=Σ of Γ-stable normal subgroups with `Σ_{i+1}/Σ_i` central in Σ/Σ_i. Require every inclusion to be strict. A maximal such series has elementary abelian simple F_p[Γ]-factors, indexed 0≤i<n. Define its factor multiset up to equivariant isomorphism. Finite Σ; Γ may be arbitrary. (FKP22, Appendix A before Lemma A.3, p.44.)

One proof route proceeds as follows. Refine the ascending central series using Γ-stable subspaces. At a maximal step both commutators and p-th powers vanish, so the factor is an elementary abelian simple module.

The API has the following mathematical properties.

- Every finite p-group with Γ-action admits a maximal central Γ-series.
- Each successive factor is a nonzero simple F_p[Γ]-module.
- A Γ-equivariant group isomorphism transports the series and its factor multiset.

**Checks.**

- Σ=1 has an empty factor multiset. The only empty strict series has length 0 and product of factor orders 1.
- For `Σ=C_{p²}` and trivial action the multiset contains two copies of the trivial F_p-line. For C₉ the factor orders are 3,3 and their product is 9.
- For `Σ=F_{p²}` additively with Γ acting by multiplication by a generator of `F_{p²}×`, the central factor is the simple two-dimensional F_p-module, not two trivial lines. The generator of 𝔽₉× has no invariant 𝔽₃-line in 𝔽₉, so the single simple factor has dimension 2, rather than two factors of dimension 1.

*Needs:* ArithmeticGaloisRepresentations §§7.2–7.7.

### 1.4 Jordan–Hölder for central Γ-series

Any two maximal central Γ-series of a finite p-group Σ give the same multiset of simple F_p[Γ]-factors. If Σ⊂U(k) is normalized by a subgroup of P(k), all its central factors are F_p[Γ]-subquotients of Lie U, for p sufficiently large in the root datum. P is parabolic with unipotent radical U and the equivariant exponential is available. (FKP22, Lemmas A.3–A.4, p.44; Lemma A.1 and Remark A.2, p.44.)

Filter the original subgroup Σ by Σ∩U_i(k). A replacement of Σ by all of U(k) does not compare the original equivariant factors.

One proof route proceeds as follows. Apply Mathlib’s `CompositionSeries.jordan_holder` to the lattice of Γ-stable normal subgroups, with equivariant quotient isomorphisms; a maximal central Γ-series is a composition series in this lattice because all its central factors are simple. Filter Σ by Σ∩U_i(k), not by replacing Σ with U(k). The requested P-equivariant exponential identifies `U_{i+1}/U_i` with the corresponding Lie quotient.

**Checks.**

- For a cyclic group of order p² with trivial Γ-action, both maximal series have exactly two trivial F_p factors.
- The central series of the order-27 Heisenberg group starts with its centre of order 3 and refines the quotient of order 9 into two order-3 factors; every maximal central series has three trivial factors when the external action is trivial. For a central subgroup of order 3 its intersection filtration has one factor, rather than the three factors of the ambient group.

*Needs:* §1.3; Mathlib `CompositionSeries.jordan_holder`; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract.

### 1.5 Cyclotomic exclusion implies C3 and C4

For p sufficiently large in G, if μ_p is not contained in F(Ad ρ̄), then M and M* have disjoint prime-field simple constituents, and C3,C4 hold. The assertion is unchanged by replacing ρ̄ with its Levi projection from a minimal residual parabolic after a finite coefficient extension. G is connected split reductive; choose a minimal parabolic anew after enlarging k. (FKP22, Lemma A.5 and Remark A.6, p.45.)

One proof route proceeds as follows. An isomorphism between a constituent of M and a cyclotomic twist of another would force the cyclotomic character to factor through Ad ρ̄. After enlarging k so that the Levi projection ρ̄_M from a minimal residual parabolic is absolutely M-irreducible, put F′=F(ρ̄_M,κ̄), whose Galois group over F embeds in M(k)×k× with absolutely M-irreducible first projection, apply the Levi-restricted small-representation H¹ vanishing to each irreducible subquotient of M*. Use inflation–restriction and the central factors of the residual p-kernel to rule out equivariant homomorphisms into M*.

**Checks.**

- If μ_p⊂F then this exclusion criterion is unavailable; C3/C4 must instead be verified directly.
- If F contains μ₃, then [F(μ₃):F]=1 and the exclusion premise is false. If the adjoint action is trivial and κ̄ has order 2, its constituents are 1 while their Tate-dual constituents are κ̄; the two characters have values 1 and −1 on a cyclotomic generator and are disjoint.

*Needs:* §0.3; §1.1; §1.4; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisRepresentations §§7.2–7.7 and the Levi-restricted adjoint H¹ contract; ReductiveGroups Layer 7.

### 1.6 An abelian root subgroup faithful on the Levi center

For semisimple G and parabolic P=MU at sufficiently large p, construct an abelian M-normalized subgroup A⊂U which is a product of root subgroups and whose Lie algebra a has faithful action of z(m). Choose a maximal abelian M-submodule of u and exponentiate it; its choice is not canonical. The source bound depends only on the root datum; the exponential preserves the required Lie subalgebras. (FKP22, Lemma A.7 and Remark A.8, pp.45–46.)

One proof route proceeds as follows. If the kernel z₀⊂z(m) of the action were nonzero, select a nonzero z₀-weight f on u with 2f absent. Nilpotence gives a nonzero M-submodule in u_f commuting with a. Its self-bracket vanishes by the weight choice; adjoining it contradicts maximality.

The API has the following mathematical properties.

- The inclusion A→U→P is a closed immersion and A is M-normalized.
- Its selected root coordinates give an M-stable vector group with abelian multiplication.
- An element of z(m) acting trivially on every chosen root direction is zero.

**Checks.**

- For the Borel in SL₂ at p odd, A=U and the toral Lie action is multiplication by 2. For h=diag(1,−1), [h,E₁₂]=2E₁₂, and 2≠0.
- For the (a,b) maximal parabolic in `SL_{a+b}`, p∤a+b, A is the abelian a-by-b matrix radical. The one-dimensional Levi center in `sl_{a+b}` acts by a nonzero scalar; the full GL center would act trivially. For block sizes 1,3 over 𝔽₅, diag(3,−1,−1,−1) acts on all three coordinates by 4, while the scalar centre acts by 0.
- For SL₂ in characteristic 2 the toral differential on its root line vanishes; this prime cannot satisfy the assertion. At p=2, 2=0 and the rank of the toral action is 0, so faithfulness fails.

*Needs:* ReductiveGroups Layer 7; ReductiveGroups Layer 8; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract.

### 1.7 Block criteria for GL_n

Let ρ̄ take values in a parabolic of GL_n with Levi blocks r_i of dimensions n_i. Suppose p≫n, each r_i is absolutely irreducible, and r_i≄r_j⊗ψ for i≠j and ψ∈{1,κ̄,κ̄⁻¹}. Set `χ_ij=(det r_i)^{n_j}(det r_j)^{−n_i}`. Require jointly [F(ζ_p):F(ζ_p)∩F(χ_ij: i≠j)]>b(n). Then C2,C3,C4 hold and Levi projection injects H⁰(Γ_F,M) into z(m)∩sl_n. For a Levi-valued representation the invariants themselves lie there. The determinant-field condition concerns the compositum of all character fields, not separate pairwise degrees. (FKP22, Lemma A.9, pp.46–47.)

Here M in H⁰ is the derived adjoint module; the letter m in z(m) is the Levi Lie algebra. The joint determinant condition must be tested after forming the full compositum.

One proof route proceeds as follows. Filter the adjoint module by block degree; its semisimplification is built from Hom(r_j,r_i), with the trace relation. The off-diagonal invariant and twisted-invariant terms vanish by the nonisomorphism hypotheses. Use the cyclic-quotient bound to control the adjoint splitting field through the joint determinant ratios, then apply cyclotomic exclusion.

**Checks.**

- For three one-dimensional blocks, separate pairwise degree bounds do not imply a bound for the joint determinant field. The joint-field computation below distinguishes these conditions.
- Take independent order-10 characters κ̄,ψ and three block characters κ̄ψ²,κ̄ψ,1. Their ratios include ψ,κ̄ψ and κ̄ψ². The ψ and κ̄ψ fields have cyclotomic intersection degree 1, while κ̄ψ² has intersection degree 2; the remaining cyclotomic degrees are 10,10,5. The joint field contains κ̄ since (κ̄ψ)/ψ=κ̄, so the remaining joint cyclotomic degree is 1. Under a unipotent conjugation u=I+E₁₂, diag(1,−1) becomes diag(1,−1)−2E₁₂, so literal containment in the selected diagonal Levi fails.

*Needs:* §0.1; §0.3; §1.2; §1.5; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract.

### 1.8 Classical maximal-parabolic invariant criteria

Let P=MU be one of the four classical maximal parabolics of Lemma A.11 with abelian U. Assume p is sufficiently large in G, the Levi representation r_M is absolutely M-irreducible, the cyclotomic degree exceeds the root-datum constant, and im ρ̄→im r_M is not injective. Then H⁰(u)=0 implies C1. For GL block, symplectic Siegel and even orthogonal maximal-isotropic cases, H⁰(u(1))=0 implies C2; the opposite piece cannot lift to an invariant across the nontrivial U-kernel. For the orthogonal line stabilizer require also H⁰(u∨(1))=0. For GL blocks the tests are unequal dimensions or r′≄r″, respectively r′≄r″κ̄⁻¹. For GSp Siegel, u=Sym²r⊗δ⁻¹, so the tests exclude nondegenerate symmetric forms of multipliers δ and δκ̄⁻¹. For SO line stabilizer u=std⊗χ, exclude its trivial, κ̄ and κ̄⁻¹ constituents as appropriate; for SO even maximal-isotropic u=Λ²std, use the stated invariant and twisted-invariant tests. p≫G and all indicated finite-group and centralizer inputs hold. Retain the noninjective projection hypothesis; a Levi-valued representation is treated by Layer 7. (FKP22, Lemma A.11 and its proof, pp.47–49.)

The four pairs are `GL_{n₁+n₂}` with blocks n₁,n₂≥1; `GSp_{2m}` with its Siegel parabolic; split SO_d with an isotropic-line stabilizer; and split `SO_{2m}` with a maximal-isotropic stabilizer. Their radical modules are respectively Hom(r₂,r₁), Sym²r⊗δ⁻¹, the standard orthogonal block tensored with the GL₁ character, and Λ²r. For GL blocks the twisted test is H⁰(Hom(r₂,r₁)(1))=0, hence r₁ is not r₂κ̄⁻¹. In the Siegel case a nonzero invariant symmetric form would have multiplier δ for the untwisted test and δκ̄⁻¹ for the twisted test. In the orthogonal-line case retain both twists κ̄ and κ̄⁻¹. The opposite radical term in the other cases is excluded by its failure to lift through the actual nontrivial unipotent kernel, not by an assertion that its semisimplified invariant space vanishes.

One proof route proceeds as follows. Use the adjoint filtration u⊕m⊕u∨ and Levi irreducibility to control the possible invariant blocks. A nonzero residual U-kernel element forces a putative Levi-central invariant to vanish. For a possible opposite block in the GL, GSp and SO even cases, its invariant bilinear form is nondegenerate; the commutator with that kernel element prevents an invariant lift. The SO line case instead requires both twisted invariant vanishings. Compute the matrix actions on u, retaining the GSp similitude and the orthogonal-line character.

**Checks.**

- The (1,3) GL₄ parabolic meets the unequal-dimension test even though both block dimensions are odd. A split Levi-valued representation fails the noninjective-projection hypothesis.
- For block sizes 1 and 3, both Hom spaces between absolutely irreducible blocks have invariant dimension 0 since a nonzero intertwiner would be an isomorphism between dimensions 1 and 3. For a split Levi-valued representation the projection kernel has order 1, violating noninjectivity. In the Siegel radical, (A,δ)=(I,2) over 𝔽₅ acts by 3=2⁻¹, not by 1.

*Needs:* §0.3; §1.1; ReductiveGroups Layer 7; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional adjoint semisimplicity contract; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract.

### 1.9 Property D(s,t,N)

For a character χ:Γ_F→k× and integers s≥1,t≥1,N≥1, D(s,t,N) means that for every σ∈Aut(k), every finite extension F′/F of degree at most N, and every pair of integers m₁,m₂ with |m_i|≤t, the characters `(χ^{m₁})^σ` and `χ^{m₂}κ̄^s` have unequal restrictions to `Γ_{F′}`. Both exponents may be zero. Fix an algebraic closure of F containing the fixed separable closure; every finite extension F′/F, separable or not, has an F-embedding into it, and `Γ_{F′}` maps to Γ_F by restriction to the separable closure, with image `Γ_{F′_s}` for the separable closure F′_s of F in F′. Use actual character equality after this restriction; it is independent of the embedding. A purely inseparable F′ gives F′_s=F, and [F′_s:F]≤[F′:F], so D(s,t,N) may equivalently be tested on separable extensions of degree at most N. (FKP22, Definition A.13, p.49; Example A.17, p.50.)

One proof route proceeds as follows. Express each comparison in the existing continuous character carrier. Include zero among the bounded powers; restriction and field automorphism act on the indicated sides.

The API has the following mathematical properties.

- Each extension of degree ≤N gives all the stated inequalities.
- D(s,t,N) implies D(s,t′,N′) for t′≤t and N′≤N.
- D(s,t,N) forces κ̄^s to remain nontrivial on every extension of degree ≤N.

**Checks.**

- If κ̄^s=1 on Γ_F then the m₁=m₂=0 test fails. The pair (0,0) compares 1 with 1 and supplies 0 inequalities satisfied.
- For s=t=N=1 and χ=κ̄, m₁=1,m₂=0 gives equality and D fails. The pair (1,0) compares κ̄ with κ̄ and fails by equality.
- Over F=𝔽₂(t) with p=5, χ=1 and s=t=1, κ̄ has order 4 (2 has order 4 mod 5). The purely inseparable `F′=𝔽₂(t^{1/2})` of degree 2 maps `Γ_{F′}` onto Γ_F, so κ̄ keeps order 4; the separable quadratic constant extension leaves order 2. Killing κ̄ needs degree 4, so D(1,1,2) holds and D(1,1,4) fails.
- If χ is F_p-valued, separation reduces to requiring χ^aκ̄^s to have order >N for every integer |a|≤2t; this includes a=0. For χ=1, κ̄ of order 5 and N=4, all five exponents −2,−1,0,1,2 give order 5>4; degree 5 instead kills κ̄ and fails.

*Needs:* ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; §0.3.

### 1.10 Character separation for maximal parabolics

For each maximal parabolic P of a split reductive G there are constants b,s,t,N depending only on its root datum such that, for p≫G and absolutely M-irreducible r_M, C3,C4 follow from either [F(ζ_p):F(ζ_p)∩F(χ)]>b or D(s,t,N) for χ induced by the one-dimensional adjoint-Levi quotient. The latter χ is trivial on Z(G), and the intermediate field used in inflation–restriction is F(Ad r_M,μ_p). Use the primitive quotient character of M/Z(G), not an arbitrary determinant coordinate. (FKP22, Lemma A.14, pp.49–50.)

One proof route proceeds as follows. Apply the irreducible-image cyclic-quotient bound to a bounded-index subgroup of the adjoint Levi. All weights of the relevant adjoint constituents are bounded powers of χ after that restriction. Use the stipulated character separation for C3. For C4, put L′=F(ρ̄_M,μ_p): its Galois group over F embeds in M(k)×k× with absolutely M-irreducible first projection, so the Levi-restricted H¹ vanishing gives `H¹(Gal(L′/F),(M*)^{ss})=0`; then the p-kernel factor argument and inflation–restriction finish.

**Checks.**

- For two GL blocks of dimensions n₁,n₂ use exponents n₂/d and −n₁/d with d=gcd(n₁,n₂), so the quotient character is primitive.
- For block dimensions 2 and 4, d=2 and the primitive ratio is (det r₁)²(det r₂)⁻¹. On the common scalar c it gives c⁴c⁻⁴=1; the ratio with two positive exponents instead gives c⁸. The primitive exponents 2,−1 have gcd 1.

*Needs:* §1.9; §1.2; §1.4; §1.1; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisRepresentations §§7.2–7.7 and the Levi-restricted adjoint H¹ contract.

### 1.11 GSp₄ and equal-block character examples

In the GSp₄ Siegel case with Levi (r,δ), use χ=det(r)δ⁻¹ and D(1,1,4). If χ is F_p-valued, this D condition is equivalent to ord(χ^aκ̄)≥5 for every |a|≤2. Here the adjoint central weights are 0,1,−1 and their differences have absolute value at most two. For `GL_{2n}` with two n-dimensional blocks use χ=det(r₁)/det(r₂) and the full D(n,1,N), including all comparisons with either exponent zero. The other hypotheses of maximal separation and the relevant invariant criterion remain required. (FKP22, Examples A.16–A.17, p.50.)

One proof route proceeds as follows. Compute the adjoint-Levi quotient character; scalar similitudes must act trivially. Reduce D to orders of characters when σ fixes χ. Keep zero-exponent inequalities in the equal-block specialization.

**Checks.**

- For a scalar GSp₄ Levi point (cI,c²), χ=det(cI)/(c²)=1, whereas det(cI)=c². For κ̄ of order 5 and χ=1, all five tests a=−2,−1,0,1,2 give order 5 and D(1,1,4) holds. If χ=κ̄, a=−1 instead gives order 1 and fails.

*Needs:* §1.10; §1.8.

### 1.12 Borel-valued residual criteria

Let ρ̄ take values in B(k)=T(k)U(k), U_ρ̄=im ρ̄∩U(k), and u_ρ̄ the k-span of log(U_ρ̄). Take the semisimplification of the actual Γ_F-action on `z_{g^der}(u_ρ̄)`; its characters are read through the residual torus projection. Absence of 1 among these constituents gives C1; absence of κ̄⁻¹ gives C2. If for every constituent χ of g^der and σ∈Aut(k), χ^σ does not occur among constituents of g^der(1), then C3,C4 hold. p≫G; use all simple prime-field subquotients, not only quotients. No action of the entire chosen torus on that centralizer is assumed. (FKP22, Lemma A.18, p.51.)

One proof route proceeds as follows. The equivariant exponential compares invariance under U_ρ̄ with Lie centralization. Filter the Borel action to read off the stated characters. Apply the central-factor argument and small-representation H¹ vanishing.

**Checks.**

- For a torus-valued SL₂ representation with quadratic diagonal character the root is trivial; its full sl₂ invariants must be detected.
- For SL₂ and a quadratic diagonal character χ, the root character χ² is 1; with zero unipotent image the centralizer is all sl₂, with invariant dimension 3 rather than the generic toral dimension 1. For full upper unipotent image the centralizer in sl₂ is the E₁₂ line, whose torus weight is χ².

- In sl₃(𝔽₁₁), N=E₁₂+E₂₃ has centralizer kN⊕kN². The full diagonal torus need not preserve it: diag(2,6,1) sends N to 4E₁₂+6E₂₃, whose bracket with N is −2E₁₃≠0. For the cyclic image generated by exp(N), its actual action on that centralizer is trivial and its residual torus projection is 1; the semisimplified Γ_F-action is the specified object.

*Needs:* §0.3; §1.4; ReductiveGroups Layer 7; ArithmeticGaloisRepresentations §§7.2–7.7 and the character-twisted adjoint H¹ contract; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract and the unipotent adjoint expansion contract.

### Examples

The Checks in §§1.10–1.12 give the worked examples for this layer.

### Dependencies

§0.1; ReductiveGroups Layer 7; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional adjoint semisimplicity contract and the character-twisted adjoint H¹ contract; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract and the semisimple Lie centralizer contract; §1.1; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§7.2–7.7 and the Larsen–Pink normal series contract; ReductiveGroupsPartII RG2.1, the bounded-power Levi centralizer contract; ArithmeticGaloisRepresentations §§7.2–7.7; §1.3; Mathlib `CompositionSeries.jordan_holder`; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract; §0.3; §1.4; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisRepresentations §§7.2–7.7 and the Levi-restricted adjoint H¹ contract; §1.2; §1.5; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional adjoint semisimplicity contract; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; §1.9; §1.10; §1.8; ArithmeticGaloisRepresentations §§7.2–7.7 and the character-twisted adjoint H¹ contract; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract and the unipotent adjoint expansion contract.

## Layer 2: Cyclic ramification classes

### 2.1 Cyclic prime-field submodules

For a finite 𝔽_p[Γ]-module V and x∈V, write V_x for the existing submodule span of the orbit {γx:γ∈Γ}, with its restricted action. For a k-module first restrict scalars to 𝔽_p. For a finite subset Z, V_Z denotes the span of all its Γ-orbits. This notation selects a native submodule; the arithmetic task is to use these prime-field modules in §2.3 and the ramification constructions, without imposing semisimplicity. (FKP22, Lemma 3.4 and Proposition 3.6, pp.11–15.)

Use the native orbit span after restricting scalars to 𝔽_p; its membership, universal property and equivariant-image identities are supplied facts used by the arithmetic construction.

The API has the following mathematical properties.

- x belongs to V_x and every γ preserves V_x.
- V_x⊂W for an invariant submodule W iff x∈W.
- An equivariant F_p-linear f satisfies `f(V_x)=V_{f(x)}`.

**Checks.**

- V_0=0. The orbit is {0}, its span has dimension 0 and cardinality 1.
- If `k=F_{p²}` acts trivially, V_1=F_p·1, not all k. For p=3 its span has 3 elements, while k has 9.
- For a simple F_p[Γ]-module and nonzero x, V_x=V, agreeing with the existing submodule span. Multiplication by a generator of 𝔽₉× spans dimension 2 from any nonzero vector; the zero vector still spans dimension 0.

*Needs:* §0.1; Mathlib `Submodule.span`; Mathlib `Representation`.

### 2.2 Finite-prime annihilation of the dual Sha group

Under C4 there is a finite set T⊃S of trivial primes such that `Sha¹_T(M*)=ker(H¹(Γ_{F,T},M*)→⊕_{v∈T}H¹(Γ_{F_v},M*))` is zero. Each successive nonzero Sha class is detected at a trivial prime outside any prescribed finite excluded set. Consequently Sha²_T(M)=0 by global duality. For number fields include the archimedean convention and the places above p in the global duality input. (FKP22, Opening of §3 and Lemma 3.4 setup, pp.10–11; FKP19 §5.1, p.27.)

One proof route proceeds as follows. Inflation–restriction (the pinned explicitInfRes_exact for the open normal subgroup Γ_K) and C4 inject a nonzero dual class into Hom(Γ_K,M*). Choose a nonzero evaluation and realize it by Frobenius at a prime split in K. Adding that prime decreases the finite-dimensional Sha¹; iterate and invoke Poitou–Tate.

**Checks.**

- A nonzero residual dual Sha class restricts nontrivially to Γ_K under C4. Without C4 a class inflated from Gal(K/F) is invisible to primes split in K.
- A one-dimensional Sha space with a nonzero evaluation map to 𝔽₃ has kernel dimension 0; a zero evaluation map has kernel dimension 1. An inflated nonzero H¹(Gal(K/F),M*) class has restriction 0 on Γ_K and is invisible at every K-split prime, showing the role of C4.

*Needs:* §0.3; §0.5; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; Tau Ceti `TauCeti.ContCohomology.explicitInfRes_exact`.

### 2.3 Simultaneous Sha stabilization for cyclic modules

Enlarge T so that Sha¹_T(M_Z*) has minimal dimension among enlargements by trivial primes for every cyclic submodule M_Z⊂M. Also arrange the analogous minimum for Sha¹_T((M_λ)*) for every cyclic submodule M_λ⊂M*. These are dual quotients of two possibly different modules; the dual of a cyclic module need not be cyclic. There are finitely many such modules. Further enlargement by trivial primes preserves the minima. (FKP22, Lemma 3.4 and proof of Proposition 3.6, pp.11–13.)

A single vector is denoted Z in §2.3; the same span notation also applies to a finite set of vectors as defined in §2.1. Stabilization concerns the duals of all cyclic submodules on each side, not just the cyclic submodules of one dual.

One proof route proceeds as follows. Minimize one of the finitely many nonnegative dimensions at a time. Use restriction on ramification and the local unramified condition to identify the stabilized Sha group under further enlargement.

**Checks.**

- Use a cyclic module whose dual is not cyclic; stabilizing only cyclic submodules of the dual omits the required quotient.
- For Γ=C₃×C₃ over 𝔽₃, the cyclic group-algebra module 𝔽₃[x,y]/(x,y)² has dimension 3 and socle dimension 2. Its dual has coinvariant dimension 2 and cannot be cyclic, since a cyclic module has coinvariant dimension at most 1. Stabilizing just cyclic submodules of the dual misses this dual quotient.

*Needs:* §2.1; §2.2; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract.

### 2.4 The one-prime ramification exact sequence

For T with the stabilized Sha conditions and any trivial prime w∉T, put `L_{w,Z}={φ∈H¹(Γ_{F_w},M_Z):φ(τ_w)∈F_p Z}`. There is an exact sequence `0→H¹(Γ_{F,T},M_Z)→H¹_{L_{w,Z}}(Γ_{F,T∪{w}},M_Z)→F_p Z→0`, whose last map evaluates at τ_w. The same statement holds for the cyclic modules M_λ⊂M*. Thus every vector of F_p Z is realizable, without a remaining obstruction condition. The exact local conditions are unramified away from T and unrestricted at T; all dual conditions are their annihilators. (FKP22, Lemma 3.4, pp.11–12.)

One proof route proceeds as follows. Apply the Greenberg–Wiles formula to the unrestricted old local conditions and the new condition `L_{w,Z}`. Stabilized dual Sha makes the dual terms cancel, so the dimension increases by one when Z≠0. The inertia map has kernel exactly the old unramified classes, hence is surjective; for Z=0 both the increase and target are zero. Repeat for M_λ using its separate dual-quotient stabilization.

**Checks.**

- For Z=0 the last term is zero and no new ramification class is promised. For nonzero Z the new inertia line has F_p-dimension one, even when [k:F_p]>1.
- If Z=0, the terminal inertia space has 1 element and dimension 0. For Z=1 in 𝔽₉, the terminal space 𝔽₃Z has 3 elements and dimension 1, rather than 9 elements and dimension 2. The new middle dimension is the old dimension plus 1.

*Needs:* §2.3; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; §0.4; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract.

### 2.5 Inductively chosen spanning ramification classes

Assume p>B_G and C4, and choose T and marked trivial primes t₀,t_b as in Proposition 3.6. Let r=dim_Fp coker Ψ_T for localization of `H¹(Γ_{F,T},M)`. For every c≥D_cyc+1 and finite Galois L/F containing K, unramified outside T and disjoint over K from K∞ and the fields cut out by all old classes in `H¹(Γ_{F,T},M*)`, there are inductively chosen pairs (T_i,α_i), norm classes q_i≡1 mod `p^{D_cyc}` but not mod `p^{D_cyc+1}`, and vectors Y_i in the old local direct sum, 1≤i≤r. After each such choice an arbitrary element g_i∈Gal(L/K) may be specified; the next pair may depend on the preceding g_j. Each resulting set l_i of primes has positive upper density, lies in the Chebotarev set specifying g_i and q_i mod p^c, and admits `h^{(w)}∈H¹(Γ_{F,T∪{w}},M)` with old restriction Y_i and inertia values `h^{(w)}(τ_w),h^{(w)}(τ_{t₀})∈F_p X_{α_i}∖{0}`. The class lies in the image for `M_{X_{α_i}}`, and the Y_i map to an F_p-basis of coker Ψ_T. The marked primes and dual basis are chosen once in the preparatory construction. The Frobenius coset must be nonorthogonal to the chosen root vector under the calibrated pairing. (FKP22, Proposition 3.6(1), pp.12–15.)

One proof route proceeds as follows. Choose a dual class detecting a missing cokernel direction. Move a root direction to make its pairing nonzero, and impose the resulting nonorthogonal Frobenius coset. Apply the one-prime sequence to M_X, and use finite pigeonhole to make old local values constant on a positive-upper-density subset. Repeat until the F_p cokernel basis is exhausted, respecting the order of choices.

**Checks.**

- If coker Ψ_T has F_p-dimension zero the spanning family is empty; the prescribed-vector construction can still be nonempty.
- For a localization cokernel 𝔽₃², the directions (1,0) and (0,1) have rank 2; repeating (1,0) gives rank 1. When the cokernel is 0 the spanning index set has cardinality 0. The second Frobenius choice may change the second root direction, so it cannot be universally fixed before the first choice.

*Needs:* §2.4; §2.1; §0.5; §0.7; ReductiveGroups Layer 7; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract.

### 2.6 Ramification classes for a prescribed vector

With the same preparation, including p>B_G, every nonzero Z∈M admits a positive-upper-density set of trivial primes w and classes `h_Z^{(w)}` from H¹(M_Z), with `h_Z^{(w)}(τ_w),h_Z^{(w)}(τ_{t₀})∈F_p Z∖{0}` and constant old local restriction. The same norm and disjoint-extension Frobenius prescriptions are available; there is no assertion that this particular old restriction is a cokernel basis vector. (FKP22, Proposition 3.6(2), pp.12–15.)

One proof route proceeds as follows. Repeat the stabilized-Sha and finite-pigeonhole argument for M_Z. Use the marked prime t₀ to impose nonzero ramification in the same prime-field line.

**Checks.**

- For `k=F_{p²}` the permitted inertia values are nonzero elements of F_p Z, not arbitrary nonzero k-multiples.
- For k=𝔽₉ and Z≠0, the nonzero allowed inertia line has exactly 2 elements, Z and 2Z, while kZ has 8 nonzero elements. With zero localization cokernel this class may still have nonzero new inertia, although it is not a new cokernel basis direction.

*Needs:* §2.5; §2.1; §2.4; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract.

### 2.7 Marked dual auxiliary classes

Choose a k-basis {e_b*} of M*. At each prime w in the prescribed families construct `η_b^{(w)}=θ_b+θ_b^{(w)}∈H¹(Γ_{F,T∪{w}},M*)`, with inertia e_b* at both w and t_b, zero at the other `t_{b′}`, and unramified at t₀. Here θ_b is unramified outside T with only t_b among the marked primes, while `θ_b^{(w)}` is unramified at all marked primes and has inertia e_b* at w. Both restrictions to Γ_K have image in the cyclic module generated by e_b*. Use the dual quotient stabilization and the marked-prime construction of Proposition 3.6. (FKP22, Construction after Proposition 3.6 and Lemma 3.7, pp.15–16.)

One proof route proceeds as follows. Construct θ_b once at its marked prime. Construct `θ_b^{(w)}` with the complementary ramification pattern and add. Check each inertia value before passing to its cocycle field.

The API has the following mathematical properties.

- `η_b^{(w)}(τ_w)=e_b*`.
- At `t_{b′}` its value is e_b* if b′=b and zero otherwise; it is unramified at t₀.
- Each individual restriction has image equal to the cyclic Γ_F-module generated by e_b*. This does not assert that one inertia tuple generates the product over b.

**Checks.**

- With a one-element basis there are exactly two marked ramification locations, w and t_b. For the marked line over 𝔽₃ the two inertia values are 1,1 at w,t_b and 0 at t₀.
- `η_b^{(w)}` has zero inertia at `t_{b′}` for b′≠b; replacing all marked values by one vector fails. For two basis indices the values at t₁,t₂ are (1,0) and (0,1), a rank-2 matrix instead of two copies of (1,1) of rank 1.
- For two isomorphic cyclotomic lines, inertia at w has the diagonal tuple (1,1); its orbit spans a diagonal line, even though each projection generates its cyclic image. The diagonal tuple spans dimension 1, while the product dimension is 2.

*Needs:* §2.3; §2.4; §0.5.

### 2.8 Inertia-generated extensions are disjoint

Let L_i/K be finite elementary abelian p-extensions Galois over F, and let v_i be places such that all L_j with j≠i and a fixed base extension B/K are unramified at v_i. If the Γ_F-conjugates of inertia at v_i generate Gal(L_i/K), the L_i are strongly linearly disjoint over K and jointly disjoint from B, provided B is unramified at all v_i. For a product of several extensions at one place, generation must hold in the joint Galois image, not just in every projected factor. The base extension B/K is finite and Galois over F. Unramified at v_i means unramified at every K-place over the chosen F-place. Finite cyclotomic layers satisfy this condition. (FKP22, Lemma 3.7, pp.15–16; preceding construction, p.15.)

One proof route proceeds as follows. A common quotient of L_i with the compositum of the others kills its inertia at v_i. Equivariance then kills the generated module; induct on the finite family. For grouped extensions verify joint inertia generation explicitly before invoking the quotient argument.

**Checks.**

- For L₁,L₂,L₃ the three degree-p subfields of one C_p²-extension, pairwise disjointness holds but the joint inertia-generation hypothesis must fail.
- Three degree-3 subfields of a C₃² extension have degree product 27 but compositum degree 9; pairwise intersections are the base. A quotient killing a generating inertia subgroup has image order 1, which is the stronger condition used by the theorem.

*Needs:* §0.5; §2.1; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 2.9 Conditional strong disjointness from joint inertia

For a fixed new prime w, let L_w be the compositum of the marked dual cocycle fields `K_{η_bʷ}`. The distinct marked primes t_b identify Gal(L_w/K) with the product of the individual cyclic images. For a finite set of distinct w, assume that the Γ_F-conjugates of the joint inertia subgroup at each w generate this entire product, and let B/K be a finite Galois extension, Galois over F, unramified over every w. Then all L_w are strongly linearly disjoint over K and their joint compositum is linearly disjoint from B over K. Every finite layer of K∞ is an admissible B. The joint-generation premise cannot be replaced by generation of each projection. The generation premise is imposed in the joint product; B is unramified at every K-place above the indicated F-place. (FKP22, Lemma 3.7 and proof, pp.15–16; use in Proposition 3.8, pp.17–19 (arXiv v5).)

There is an arithmetic obstruction to asserting the source’s unconditional family statement. For trivial SL₂ residual image over ℚ and k=𝔽_p, p≥5, two identified cyclotomic basis lines give old unramified differences ζ_w=η₁ʷ−η₂ʷ. The finite group `H¹(Γ_{ℚ,T},𝔽_p(κ̄))` forces a repeated ζ_w. The resulting four-term relation persists over K because |Gal(K/ℚ)|=p−1 and its H¹ vanishes. This example has C4 but fails C1. The failure also occurs with C1–C4: for k=𝔽_p and a semisimple M* with a simple constituent of multiplicity at least two, the joint inertia tuple cannot generate the entire product for any basis. For general k a sufficient criterion is that some simple 𝔽_p[Γ_F]-constituent S of M* satisfies Σ_b mult_S(`M*_{e_b*}`) > dim S / dim End(S), both dimensions over 𝔽_p and End the 𝔽_p[Γ_F]-endomorphism ring of S, the right side being the largest multiplicity of S in a cyclic semisimple 𝔽_p[Γ_F]-module, a quotient of the semisimple quotient of the group algebra of the finite image (Wedderburn); the span of the inertia tuple is cyclic and, as a submodule of a product of copies of M*, semisimple. A prime-field multiplicity at least two of S in M* does not suffice when [k:𝔽_p]>1. FKP19 Proposition 7.8 and Remark 7.9, pp.59–60, give F₄-valued examples of this kind. The nontrivial quotient unramified at w then lies in a fixed finite elementary abelian p-extension unramified outside T and repeats as w varies. Thus even the main residual hypotheses do not justify the missing product-independence step. The general lifting results explicitly assume the quantitative arithmetic selection hypothesis of §3.2.

One proof route proceeds as follows. At one fixed w use the t_b places to identify the product of the individual cyclic images. For different w apply inertia-generated disjointness to the grouped L_w, using precisely the extra joint-generation assumption. Pass through all finite cyclotomic layers, which are unramified away from p. Use the arithmetic selection hypothesis of §3.2 for the replacement that doubling requires; do not apply this conditional result unless its extra assumption is verified.

**Checks.**

- Test M*=F_p(κ̄)³ with F=Q and trivial SL₂ residual representation. For two basis indices identify their cyclic lines and put ζ_w=η_1^(w)−η_2^(w). This class is unramified at w and lies in the finite group `H¹(Γ_{Q,T},F_p(κ̄))`.
- Two distinct new primes w,w′ have ζ_w=ζ_w′. The resulting nonzero relation among four scalar cocycles persists on Γ_K, since H¹(Gal(Q(μ_p)/Q),F_p(κ̄))=0. Their four degree-p fields therefore cannot be strongly disjoint.
- This example satisfies Assumption 3.1 but fails C1. It refutes the lemma in its stated scope, without refuting Theorem 5.2.
- The failure is not confined to C1-failing data. Let k=F_p and suppose M* is semisimple with a simple constituent of multiplicity at least two, as for the F₄-valued residual images of FKP19 Proposition 7.8, pp.59–60, with image A₆ or PSL₂(F₁₃), with adjoint multiplicities above one by FKP19 Remark 7.9, p.60, which satisfy C1–C4. For every k-basis the F_p[Γ_F]-span of the inertia tuple (e_b*)_b is cyclic and semisimple, being a submodule of a product of copies of M*, so it has that constituent S with multiplicity at most dim S / dim End(S) ≤ dim S (dimensions over 𝔽_p, End the 𝔽_p[Γ_F]-endomorphism ring of S), while ∏_b `M*_{e_b*}` has it with multiplicity at least the number of basis vectors meeting its isotypic part, which for k=F_p is at least 2·dim S. So the inertia at w generates a proper submodule, L_w has a nontrivial subextension E_w unramified at w, and E_w lies in the finite maximal elementary abelian p-extension of K unramified outside T. Hence E_w=E_w′ for some w≠w′ and L_w∩L_w′≠K.
- The prime-field hypothesis is needed. For k=𝔽₉ and M*=k(χ) with χ valued in 𝔽₃×, the 𝔽₃[Γ_F]-module M* is 𝔽₃(χ)², with prime-field multiplicity 2, but the k-basis {1} gives `M*_1`=𝔽₃·1, the product over the single index is 𝔽₃(χ), and the inertia tuple (1) generates it; the criterion reads 1>1 and fails. For k=𝔽₃ and M*=𝔽₃(χ)², every basis has two vectors with nonzero S-component, the product has S-multiplicity 2>1=dim S/dim End(S), and the cyclic span has multiplicity at most 1, so the obstruction holds.
- For two isomorphic scalar constituents, the new inertia orbit has rank 1 inside the rank-2 product and the quotient by its span has rank 1. With M*=𝔽_p(κ̄)³ and two basis lines, (η₁ʷ−η₂ʷ)(τ_w)=1−1=0; two equal old unramified differences produce a four-class relation with coefficients (1,−1,−1,1). Under C1–C4 the same rank defect occurs for repeated simple constituents over k=𝔽_p, and for general k whenever the multiplicity criterion above holds; individual image ranks still do not add.

*Needs:* §2.7; §2.8; §0.7; §2.5; §2.6.

### Examples

For V=𝔽₉ with trivial action, V₁ has 3 elements and V has 9; V₀ has 1 element. For the 2-dimensional simple module with 𝔽₉× acting, every nonzero cyclic orbit span has 9 elements. With two equal one-dimensional constituents and scalar action, the common new inertia tuple (1,1) has prime-field span of dimension 1, whereas the product has dimension 2. At the separate marked places the tuples (1,0),(0,1) span dimension 2 for a fixed new prime.

### Dependencies

§0.1; Mathlib `Submodule.span`; Mathlib `Representation`; §0.3; §0.5; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; Tau Ceti `TauCeti.ContCohomology.explicitInfRes_exact`; §2.1; §2.2; §2.3; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; §0.4; §2.4; §0.7; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract; §2.5; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; §2.7; §2.8; §2.6.

## Layer 3: Doubling and controlled finite-level lifts

### 3.1 The initial lift modulo ϖ²

After choosing T with Sha²_T(M)=0, a residual fixed-μ representation that has the specified local μ-lifts at every v∈T admits a global fixed-μ lift modulo ϖ². The local obstruction classes vanish by those local lifts; global duality kills the remaining Sha² obstruction. Subsequent H¹ modification can impose the specified old local congruences when the localization cokernel has been supplied by the spanning classes. The added trivial places admit their chosen local lifts; killing Sha² alone does not prove local liftability. (FKP22, Paragraph after Lemma 3.7 and Proposition 3.8, p.16.)

One proof route proceeds as follows. Form the actual global fixed-multiplier H² obstruction using the owner’s deformation theory. Restrict to each local μ-lift to show it lies in Sha². Kill it, then adjust the torsor of lifts by H¹.

**Checks.**

- A local obstruction in H² at an original ramified place is not killed by Sha²=0. Require an actual local fixed-μ lift first.
- A global obstruction with zero local restrictions lies in Sha² and vanishes when Sha²=0. A nonzero local obstruction has local value 1 rather than 0 and is not in that kernel; Sha²=0 does not make it liftable. For a square-zero kernel εk, (1+εX)(1+εY)=1+ε(X+Y), whereas a kernel with ε²≠0 has the additional ε²XY term.

*Needs:* §2.2; §2.5; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract; LocalGaloisDeformationRings §§1.17, 1.20.

### 3.2 Density selection and its arithmetic hypothesis

For a finite sequence of Frobenius tests in actual finite Galois composita over K, assume that, after each preceding failure and the common cyclotomic prescription, the next test has conditional success proportion at least ε, with 0<ε≤1. If a preceding failure set is empty, all further failures are empty. Then the finite Chebotarev set failing s tests has upper Dirichlet density at most (1−ε)ˢ. In particular every prime family of upper Dirichlet density δ>0 contains a success when (1−ε)ˢ<δ. Strong disjointness and bounded degrees are one sufficient route to the conditional proportion. The arithmetic selection hypothesis for a lifting datum asserts the existence of such a uniform ε and arbitrarily long finite test families for the cocycles used by doubling under C1,C3,C4, respecting the same norm and old-local-value constraints, including repeated simple constituents. For every δ>0 and every prescribed finite excluded set, the resulting failure bound must be less than δ for some finite test family. This hypothesis is required for every finite-stage enlargement and coefficient extension used by the construction; the extra joint-generation hypothesis of §2.9 is not automatic. C1,C3,C4 are not asserted to imply this arithmetic hypothesis. The positive-upper-density set is the previously selected l_i; one cannot simply intersect an arbitrary such set with a Chebotarev set. (The elementary conditional-probability estimate follows by induction; the arithmetic need occurs in FKP22, proof of Proposition 3.8, pp.17–19.)

One proof route proceeds as follows. Compute finite Chebotarev densities in the product Galois group, conditional on the common field. Bound the failure proportion by the product of the uniform failure bounds. Choose s so that this bound is less than the upper density of l_i.

For §3.4 the arithmetic selection hypothesis also requires this estimate for its finite tuples of primes, with success satisfying every Frobenius constraint on both tuples and with a selected tuple family of positive upper Dirichlet density. Use the tuple density normalized by the product norm as in FKP19, discussion preceding Proposition 5.12, p.34, and FKP22, proof of Proposition 3.8, p.17. Positive upper density of each coordinate family alone is not an assertion of positive upper density for the tuple family; that positivity is included in the arithmetic selection hypothesis.

The arithmetic selection hypothesis has the following mathematical properties. They follow from its quantified form; none of them derives the hypothesis from C1,C3,C4.

- If it holds for a construction, it holds for the construction restricted to any subset of its required finite stages and coefficient extensions, with the same ε.
- It is transported along an isomorphism of lifting data, a G(O)-conjugation together with a field isomorphism compatible with the fixed embeddings, that carries the finite Galois tests, norm prescriptions and old local values of one datum to those of the other.
- If it holds for a finite excluded set X, it holds for every finite X′⊃X: removing finitely many primes changes neither the upper Dirichlet density of the selected family nor that of a failure set.

**Checks.**

- For ε=1/2 and s=4, the independent failure proportion is 1/16, below an upper density 1/10. Four repetitions of one binary test instead have failure proportion 1/2: after the first failure their next conditional success proportion is 0, so they fail the ε>0 premise. In a function field with a quadratic constants extension the nontrivial constant Frobenius has 0 primes in even degrees, so compatibility must precede density selection.
- Upper limits do not multiply without a common density argument: the sequences a_j=1 at even j and 0 at odd j, and b_j=1−a_j, each have upper limit 1, while a_j b_j has upper limit 0. The tuple construction therefore has its own positive-density requirement.
- At the boundary ε=1 the bound is (1−1)ˢ=0 for every s≥1: an always-successful test leaves an empty failure set after one test, of density 0. A repeated binary test has failure proportion 1/2 after one test, so its conditional success proportion 1/2 is below 1 and it does not satisfy the ε=1 premise. For s=0 the bound is (1−ε)⁰=1, the full density, and no selection is claimed.

*Needs:* §2.9; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; the joint-inertia criterion of §2.9 only when its full product hypothesis is proved; the arithmetic selection hypothesis specified in this section.

### 3.3 The normalized trivial-prime local pairing

Let W be a free O/ϖ^r-module with trivial local action, q_w≡1 mod ϖ^r, and W*=Hom_O(W,O/ϖ^r(1)). Choose τ_w compatibly with the chosen p-power root of unity, arithmetic σ_w, and the invariant map normalized by local reciprocity sending a uniformizer to geometric Frobenius. Then inv_w(φ∪ψ)=−⟨φ(σ_w),ψ(τ_w)⟩+⟨φ(τ_w),ψ(σ_w)⟩. In particular the two single-unramified formulas have opposite signs. p is odd; the coefficients and tame-generator calibration are part of the assertion. (FKP19 Lemma 3.9, p.19; FKP22 proof of Proposition 3.8, pp.16–18.)

One proof route proceeds as follows. Use the local reciprocity and Kummer identifications supplied by local duality. Evaluate an unramified character on the geometric Frobenius image of a uniformizer. Use graded commutativity for the swapped term.

**Checks.**

- For the unramified and tame basis u,t at a trivial prime, u∪u=t∪t=0 and u∪t=−t∪u. Reversing the Frobenius convention changes the calibrated overall sign.
- The pairs u=(1,0), t=(0,1) give −1 and 1 after swapping, and give 0 on u,u and t,t. Over 𝔽₅ these are 4,1,0,0. Replacing arithmetic σ by its inverse reverses the calibrated unramified coordinate and hence the overall sign.

*Needs:* §0.4; ArithmeticGaloisDuality R02.1; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract; ArithmeticGaloisRepresentations Layer 2.

### 3.4 Doubling with controlled inertia and Frobenius

Assume p>B_G and the arithmetic selection hypothesis of §3.2 for the lifting datum used below. Given the initial mod-ϖ² lift and desired old local correction z, choose finitely many pairs of distinct trivial primes (w_i,w_i′) and `h= h_old−Σ_i h^{(w_i)}+2Σ_i h^{(w_i′)}`. The modification by h agrees with z at old places, has inertia −X_i at w_i and 2X_i at w_i′, and has Frobenius values in the required central torus cosets for the selected roots and norm classes. The root directions may be chosen to span M while their old local restrictions span the localization cokernel. p is odd; −X_i and 2X_i must not be identified except at p=3. The actual torus coset includes the prescribed multiplier. (FKP22, Proposition 3.8, pp.16–19.)

The two families may be rescaled separately so that the resulting modified local lifts have the chosen root inertia generators. The intermediate coefficients −X_i and 2X_i refer to the displayed cocycle combination; they are not an equality of those two raw cocycle values at every p.

One proof route proceeds as follows. Solve the old localization equation with the spanning classes. Use marked dual fields and the calibrated cup pairing to translate the new-prime constraints into independent Frobenius evaluations. Apply density selection to choose the two families. Evaluate the explicit linear combination at each inertia generator and old place.

**Checks.**

- At p=5 the coefficients are −1=4 and 2; both are nonzero and −Y+2Y=Y at an old place. At p=3 they are both 2, still nonzero. At p=2 the second coefficient is 0, so the required new ramification would disappear.

*Needs:* §3.1; §2.5; §2.6; §3.2; §3.3; §2.7; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract.

### 3.5 Disjointness from the higher congruence field

Under C1,C3, if `ρ_{n−1}` is a finite-level fixed-μ lift whose image contains the full derived congruence subgroup and `L=K(ρ_{n−1}(g^der))`, then L is disjoint over K from the compositum of K∞ and all dual cocycle fields used in doubling. The congruence filtration of Gal(L/K) has constituents that are quotients of sums of M; its possible abelian quotients cannot occur in M*, nor in the trivial cyclotomic quotient. The field is the adjoint congruence field, with the coefficient level and component splitting field fixed. (FKP22, Lemma 4.3, pp.19–20.)

One proof route proceeds as follows. Use the smooth-group congruence quotients and the Lie action. Pass a hypothetical common quotient down to a simple prime-field constituent. Apply C3 for the dual fields and C1 for the trivial quotient, using the prime-to-p component action. Use the module image of the whole dual compositum; this argument does not require independence among the individual dual fields.

**Checks.**

- A common elementary abelian quotient with trivial conjugation is excluded by C1; one with dual constituents is excluded by C3. Neither follows from pairwise field intersections alone.
- For a one-dimensional common quotient with trivial conjugation, a nonzero map from a self-dual adjoint quotient to 𝔽₃ would give a nonzero invariant; C1 requires dimension 0. A common dual constituent gives a nonzero quotient of M inside a subquotient of M*, directly violating C3; neither conclusion compares just two selected fields.

*Needs:* §0.3; ReductiveGroupsPartII §RG2.0.3; §0.5; §0.7.

### 3.6 Controlled compatible finite-level lifts

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. Assume p>B_G, C1,C3,C4 and specified local μ-lifts λ_v for v∈S. For every prescribed finite accuracy and avoidance set there are increasing finite ramification sets T_n and compatible fixed-μ lifts `ρ_n:Γ_{F,T_n}→G(O/ϖ^n)`, n≥2, with `ρ_n|Γ_{F_v}` strictly conjugate to λ_v modulo ϖ^n at every original v∈S, and full derived congruence image at every level n. At an early auxiliary place the tower follows a fixed smooth O-valued local lift. At a late auxiliary place of norm depth D_cyc and ramification index e=v_ϖ(p), it has the root-type form: `ρ_{eD_cyc}` is central, α(ρ(σ))=q, and every root β has `β(ρ_{eD_cyc+1}(σ))≠1` at its first noncentral level. New primes can be required to avoid any fixed finite set. The initial finite accuracy is chosen deep enough for relative theory. The early/late cutoff eD_cyc is fixed by the coefficient ramification index and the roots of unity in K; it is not a free depth parameter. The tower alone makes no assertion of one finite ramification set in its inverse limit. (FKP22, Theorem 4.4 and its proof, pp.20–23.)

The finite-level restrictions at the original places are strict conjugates of the corresponding reductions of λ_v, not merely points on the same components. The initial accuracy and a fixed finite initial segment may depend on the later application; the early/late norm-depth cutoff does not.

One proof route proceeds as follows. Initialize by doubling, choosing root directions spanning M. At each step use congruence-field disjointness to impose the next finite-level Frobenius values. Choose a maximal torus in general position with respect to the required hyperplanes and use the smooth root lifting functor. Apply doubling to remove the old local error, then keep the lifts compatible while enlarging T_n.

**Checks.**

- For e=2,D_cyc=1 the fixed first noncentral level is 3. Increasing the relative depth M does not change that cutoff.
- For e=2,D=1, levels 2 and 3 are respectively the last central and first noncentral levels; changing the later relative depth to M=6 leaves those numbers 2,3. A sequence adding one distinct ramified prime at each level has finite |T_n| but infinite union, so compatibility alone does not prove finite ramification.

*Needs:* §3.4; §3.5; ReductiveGroups Layer 7; ReductiveGroupsPartII §RG2.0.3; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract; Chebotarev Layer 10; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract and the prescribed-root regular toral element contract.

### Examples

The Checks in §§3.2–3.4 and §3.6 give the worked examples for this layer.

### Dependencies

§2.2; §2.5; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract; LocalGaloisDeformationRings §§1.17, 1.20; §2.9; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; the joint-inertia criterion of §2.9 only when its full product hypothesis is proved; the arithmetic selection hypothesis specified in this section; §0.4; ArithmeticGaloisDuality R02.1; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract; ArithmeticGaloisRepresentations Layer 2; §3.1; §2.6; §3.2; §3.3; §2.7; §0.3; ReductiveGroupsPartII §RG2.0.3; §0.5; §0.7; §3.4; §3.5; ReductiveGroups Layer 7; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract and the prescribed-root regular toral element contract.

## Layer 4: Relative local conditions and Selmer images

### 4.1 Relative Selmer images

Fix a finite lift ρ_n and its actual adjoint modules M_r, 1≤r≤n. For local conditions `L_{r,v}` compatible with coefficient reductions, let RelSel_r be the linear image of the supplied Selmer kernel `H¹_{L_r}(Γ_{F,S},M_r)` in `H¹_{L_1}(Γ_{F,S},M_1)`; use the corresponding image with the Tate-annihilator conditions for RelDual_r. This is `Submodule.map` applied to the arithmetic reduction map. Balanced local conditions mean equality of the cardinalities of the full primal and dual Selmer groups at every level 1≤r≤n. Equality of relative images is a theorem of §4.3, not part of this definition. M_r is the actual adjoint module of a fixed finite lift, with coefficient reductions; the local conditions are compatible with them. (FKP19 Definition 6.2 and Lemma 6.3, p.45.)

One proof route proceeds as follows. Use the existing Selmer kernel and coefficient functoriality. Take its linear image under reduction. Use local duality for the annihilator conditions, without identifying the full residual Selmer group with the reduction image.

The API has the following mathematical properties.

- A residual Selmer class belongs to RelSel_r iff it has a level-r Selmer preimage.
- RelSel_1 is the full residual Selmer group, since reduction at level one is the identity.
- For r≤s, RelSel_s⊂RelSel_r, and likewise for the dual, whenever the indicated reductions preserve local conditions.

**Checks.**

- The image of the identity on any Selmer space is that space, agreeing with Submodule.map id. For an identity on 𝔽₃², source and image both have 9 elements.
- For a nonzero source annihilated by the chosen reduction map, its relative image is zero even if the residual target is nonzero. For the zero reduction 𝔽₃→𝔽₃ the source has 3 elements and the image has 1.
- The image of k→k², a↦(a,0), is one-dimensional and is not all the residual target. The injection a↦(a,0) has image of size 3 inside a target of size 9.

*Needs:* ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.1; Mathlib `Submodule.map`; Mathlib `AddSubgroup.map`.

### 4.2 Exactness for compatible local cocycle lattices

Suppose the preimages `Z_{r,v}` of `L_{r,v}` contain B¹ and fit into `0→Z_{a,v}→Z_{a+b,v}→Z_{b,v}→0` for all a,b>0 with a+b≤n. Then `H¹_{L_a}(M_a)→H¹_{L_{a+b}}(M_{a+b})→H¹_{L_b}(M_b)` is exact in the middle, and the first map is injective if H⁰(Γ_F,M_1)=0. The annihilator conditions give `0→Z^⊥_{b,v}→Z^⊥_{a+b,v}→Z^⊥_{a,v}`, exact without a final surjectivity assertion, and the corresponding dual Selmer sequence with a,b reversed. The first map in the dual Selmer sequence is injective only under H⁰(Γ_F,M_1*)=0; middle exactness does not require either reduction map to be surjective. (FKP19 Lemma 6.1 and proof, pp.44–45.)

One proof route proceeds as follows. Lift representatives in the cocycle diagram and use the local short exact sequences. Use absence of residual invariants for uniqueness of the global preimage. Dualize the coefficient maps using local Tate pairings; reverse their order.

**Checks.**

- A coefficient reduction can have a nonzero connecting obstruction. Only middle exactness is asserted; final surjectivity is not automatic.
- For 0→ℤ/3→ℤ/9→ℤ/3→0 with C₃ acting on ℤ/9 by multiplication by 4, the residual action is trivial. The invariant element 1 has connecting cocycle value (4−1)/3=1, so the first H¹ map is not injective. Its residual H¹ is one-dimensional; invariants must be excluded to assert injection.

*Needs:* §4.1; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.1; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract.

### 4.3 Balanced local conditions give balanced relative images

Under C1,C2 and the cocycle exactness hypotheses, equality |Sel_r|=|DualSel_r| for every 1≤r≤n implies dim_k RelSel_n=dim_k RelDual_n. The local numerical conditions `|L_{r,v}|=|H⁰_v(M_r)|` away from p and `|L_{r,v}|=|H⁰_v(M_r)|·|O/ϖ^r|^{[F_v:Q_p]dim Flag(G⁰)}` at p, together with oddness and total reality in characteristic zero, supply the full-level balance by Greenberg–Wiles. In positive characteristic there is no p-adic or archimedean correction. (FKP19 Lemma 6.3, p.45; FKP22 proof of Theorem 5.2, pp.24–25.)

One proof route proceeds as follows. Apply the coefficient exactness theorem at (n−1,1). Compute image cardinalities by dividing adjacent full Selmer cardinalities. Use the owner’s global cardinality formula and the stated local cardinalities to obtain equality at all levels.

**Checks.**

- If full level-r Selmer groups have equal orders at r=n,n−1, the orders of their residual images agree after dividing by the corresponding kernels.
- If both primal and dual orders at levels n,n−1 are 81,27 and the coefficient injections hold, both residual images have 81/27=3 elements and k-dimension 1 for k=𝔽₃. Equal level-n orders 81,81 with kernel orders 27,9 would instead give image orders 3,9, showing why adjacent balance and exactness matter.

*Needs:* §4.2; §4.1; §0.3; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; §0.2; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract.

### 4.4 Uniform torsion in compact Lie-group cohomology

Let Γ be a compact p-adic analytic group with semisimple Lie algebra and let V be a finite free O-module with continuous O-linear Γ-action. If V⊗Q_p has no Lie(Γ)-invariants, then for every i≥0 a single power of ϖ, depending on i,Γ,V and independent of r, kills H^i(Γ,V/ϖ^r). For i=1 the uniform bound holds without the no-invariants condition, using Whitehead in degrees 1 and 2. These are the continuous cohomology groups for the actual action, including its finite component action. Use a sufficiently small open analytic subgroup and transfer across its finite index; a reductive Lie algebra with nonzero center does not meet the stated semisimple hypothesis. (FKP19 Lemma B.1 and proof, p.64; Lazard V, Theorems 2.2.2.3, 2.2.3.1 and 2.4.10, pp.165–166,178–179; Lazard65, III Proposition 3.1.3, pp.91–92; III Theorem 3.1.7.4, p.94; V §§2.2.2–2.2.3, pp.165–166 and Theorem 2.4.10, pp.178–179.)

The degree-one statement is the theorem `uniformTorsion_H1`. There Γ is a compact topological group with a `ℚ_p`-analytic manifold structure of dimension d and analytic multiplication and inversion (Mathlib `LieGroup` over `ℚ_[p]`), whose Mathlib `GroupLieAlgebra`, the tangent space at the identity with the bracket of left-invariant vector fields, satisfies `LieAlgebra.IsSemisimple` over `ℚ_p`; O is a discrete valuation ring that is a finite `ℤ_p`-algebra, ϖ an irreducible element of O, V a finite free O-module with a representation ρ of Γ, and `ModPow ρ ϖ r` is the quotient V/ϖʳV with the discrete topology and the representation `modPowRep ρ ϖ r` induced through the stable submodule `modPowSub ρ ϖ r`. Continuity of the action is the hypothesis that Γ acts continuously on every `ModPow ρ ϖ r`, which for a finite free lattice is continuity for the ϖ-adic topology. The conclusion is a natural number a such that pᵃ kills every class of `TauCeti.ContCohomology.H1` of Γ with coefficients in `ModPow ρ ϖ r`, for every r; since p is a unit times ϖᵉ, a power of p and a power of ϖ kill the same classes. The theorem is stated for every prime p, as the source lemma is. Mathlib's semisimplicity is a direct sum of non-abelian simple ideals, which over ℚ_p is the classical notion and includes the zero Lie algebra of a finite group; the all-degree statement, which needs the differentiated action of Lie(Γ) on V⊗ℚ_p, stays in prose.

The no-invariants hypothesis gives degree zero as well: the rational degree-zero invariant space is zero, and the integral coefficient sequence bounds the finite-level invariants by the torsion in H¹. The source’s positive-degree theorem and Whitehead H¹,H² suffice for degree one without that hypothesis. A finite-index Hochschild–Serre argument accounts for all components; the subgroup index can contribute to the torsion exponent.

One proof route proceeds as follows. Choose an open normal p-valued subgroup of finite index (supplied by LocallyAnalyticDistributionsPartII ND.0; for open subgroups of G(O) the deep congruence subgroups of ReductiveGroupsPartII RG2.0.3). On it, use the finite free resolution over the completed group ring and the Ext description of continuous cohomology (supplied by NoncommutativeAndEquivariantIwasawa §§0.13, F.2) to get finite generation of H^i(Γ,V) and a bounded complex computing all H^i(Γ,V/ϖ^r). Identify rational cohomology with Lie-algebra cohomology on that subgroup (Lazard V (2.4.10), supplied by NoncommutativeAndEquivariantIwasawa §§0.13, F.2) and apply semisimple Lie-algebra vanishing, with only Whitehead H¹,H² in the degree-one statement (supplied by AutomorphicFormsOnReductiveGroups Layer 1). Finite generation and the universal-coefficient sequence of the bounded complex make the torsion exponent independent of r; pass to Γ through finite-index invariants (Hochschild–Serre).

**Checks.**

- For Γ with Lie algebra sl₂ the Whitehead H¹,H² input yields the degree-one bound even for a trivial rank-one lattice. A Lie algebra with central Q_p factor does not satisfy this semisimple hypothesis.
- For a trivial rank-one lattice and Lie algebra sl₂ in characteristic zero, H¹ and H² vanish while H⁰ has dimension 1; the degree-one bound still applies. For Γ=ℤ₃ with trivial O=ℤ₃ coefficients, H¹(Γ,O/3ʳ)=O/3ʳ has exponent 3ʳ, unbounded in r; its abelian Lie algebra fails the semisimple hypothesis.
- For Γ finite, of dimension 0, the Lie algebra is zero and is semisimple in Mathlib's sense, having no atoms; H¹(Γ,V/ϖʳV) is killed by |Γ| and, being p-power torsion, by the p-part of |Γ|, uniformly in r. For r=0 the quotient `ModPow ρ ϖ 0` is zero and H¹ vanishes. For Γ=ℤ₃ the one-dimensional Lie algebra is its own atom and is abelian, so Mathlib's non-abelian-atom condition fails: it is excluded, as the unbounded exponent 3ʳ requires. For Γ=SL₂(ℤ₃) acting on the standard lattice ℤ₃², the Lie algebra sl₂ is simple and the theorem bounds the exponent of H¹(Γ,(ℤ/3ʳ)²) independently of r.

*Needs:* Mathlib `LieGroup`, `GroupLieAlgebra`, `LieAlgebra.IsSemisimple` and `Subrepresentation.quotient`; Tau Ceti `TauCeti.ContCohomology.H1`; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.1; ReductiveGroupsPartII §RG2.0.3; LocallyAnalyticDistributionsPartII ND.0; NoncommutativeAndEquivariantIwasawa §§0.2, 0.7, F.2, 0.13 and the Lazard lattice comparison contract; AutomorphicFormsOnReductiveGroups Layer 1 and the semisimple Lie cohomology vanishing contract.

### 4.5 Vanishing of sufficiently deep H¹ reduction

For Γ,V as in the compact Lie bound, assume H⁰(Γ,V/ϖ)=0. For every m≥1 there is N such that for every N′≥N the coefficient reduction `H¹(Γ,V/ϖ^{N′})→H¹(Γ,V/ϖ^m)` is zero. In the adjoint application use the inverse image in the p-adic adjoint group of the full Γ_F image, including component action; C1 supplies its residual invariant vanishing. (FKP19 Corollary B.2 and proof, p.64; FKP22 §5, pp.23–24.)

One proof route proceeds as follows. Use the coefficient exact sequence and H⁰ vanishing to identify the transition image with a high power of ϖ times an H¹ group. Apply the uniform torsion exponent. Apply the bound to the full compact group, not only to its connected component preimage.

**Checks.**

- The reduction map to level m is zero for every larger level beyond N, not merely along one subsequence.
- Let Γ=C₃ act by ζ₃ on O=ℤ₃[ζ₃], with ϖ=ζ₃−1. The norm 1+ζ₃+ζ₃² is 0, so H¹(Γ,O/ϖʳ)=(O/ϖʳ)/ϖ has order 3 for every r≥1 and reduction to level 1 is nonzero for every r. Its residual invariant dimension is 1, so it is excluded; the zero Lie algebra of this finite group is semisimple. Under invariant-free coefficient injections and torsion exponent a, a depth difference at least a gives image ϖᵃH¹=0.

*Needs:* §4.4; §0.3; §4.2; ArithmeticGaloisDuality R02.1; ReductiveGroupsPartII §RG2.0.3.

### 4.6 The relative auxiliary-prime set Q_N

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Fix e|M,N with N≥4M, a fixed-μ lift ρ_N whose image contains the full derived congruence kernel, and F_N=F(ρ̄,Adρ_N), `F_N*=F_N(μ_{p^{N/e}})`. Q_N consists of trivial primes w unramified for ρ_N with q_w≡1 mod ϖ^M and q_w≢1 mod `ϖ^{M+1}`, `ρ_M|Γ_{F_w}` central, and a split maximal torus T and root α such that ρ_N(σ_w)∈T, α(ρ_N(σ_w))=q_w, and `β(ρ_{M+1}(σ_w))≠1` for every root β. A member includes the chosen (T,α). M and N are positive multiples of e, N≥4M and M>eD_cyc; choose M large enough for deep reduction vanishing. Central at level M is not a requirement of triviality in the full group. (FKP19 Definition 6.6, p.46.)

One proof route proceeds as follows. Express all conditions in the finite Galois group of F_N*/F. Use full congruence image and disjointness from the cyclotomic extension to show this is a nonempty Chebotarev condition.

The API has the following mathematical properties.

- A Q_N prime has central ρ_M and trivial action on M_r for r≤M.
- Its chosen α satisfies α(ρ_N(σ_w))=q_w, with exact norm depth M.
- If the derived group has positive rank and p>B_G, the compatible finite Frobenius condition is nonempty and has positive Chebotarev density.

**Checks.**

- A trivial prime with q_w≡1 mod `ϖ^{M+1}` fails membership. With O=ℤ₃, M=2 and N=8, norm 19 has valuation v₃(18)=2 and passes the exact-depth test, while norm 109 has valuation v₃(108)=3, rather than the required 2.
- Satisfying the α equation while some other β is 1 at level M+1 fails membership. A second root value 1 mod 27 has β−1=0 at level 3, so fails the nonvanishing test.
- For adjoint G, central reduction is the identity; for GL_n a scalar need not be the identity. The scalar 2I in GL₂(𝔽₃) is central and has rank(2I−I)=2; the adjoint group has only the identity central point.
- For G=Gₘ there are no roots, so Q_N is empty and has density 0. The torus lifting problem is solved by its fixed quotient μ; the positive-density assertion requires positive derived rank.

*Needs:* §0.4; §3.6; §3.5; §4.5; ReductiveGroups Layer 7.

### 4.7 Relative root local conditions

For w∈Q_N with its chosen torus T and root α, select the root cocycle lattice `Zᵅ_{r,w}` supplied by LocalGaloisDeformationRings at the actual lift ρ_N, and write `Lᵅ_{r,w}` for its image in `H¹(Γ_{F_w},M_r)`, 1≤r≤M. Select the Tate annihilator as its dual condition. The lattice contains coboundaries, divided coboundaries, unramified toral directions in ker(dα) and the ramified root direction. This section proves compatibility of this relative selection with the Selmer comparison; the lattice construction and lifting functor are supplier exports. N≥4M; use the actual lattice, not merely its dimension or a formal-smoothness assertion. (FKP19 Lemmas 3.5 and 6.7, pp.17–18,46–47.)

One proof route proceeds as follows. Import the root lifting functor and its explicit cocycle lattice from the local owner. Take its H¹ image and the local annihilator. Import coefficient exactness, fibre stability and cardinalities from the root cocycle lattice contract; use them in the global Selmer comparison.

The following local properties are imported from LocalGaloisDeformationRings §2.28 via the root cocycle lattice contract.

- For a+b≤M the lattices fit into `0→Z^α_a→Z^α_{a+b}→Z^α_b→0`.
- For m≥N−M and r≤M the nonempty fibers of the relative root lifting functor from level m+r to m are stable under Z^α_r.
- |L^α_r|=|H⁰_w(M_r)| and each primal or dual unramified quotient by its intersection with L^α_r or its annihilator is O/ϖ^r.

**Checks.**

- The primal unramified quotient is generated by the σ_w value dα∨(1). At p=3, dα(h)=2 is a unit and gives the generator of an unramified quotient of order 9 at r=2.
- The dual quotient is detected by evaluation on g_α and has length r, not one independent of r. For r=2 the quotient is O/9 of length 2 and order 9; its level-1 reduction has order 3.
- The unramified ker(dα) directions alone omit the ramified root class and fail the balanced-cardinality and fiber-stability contracts. In SL₂ at r=2 the complete condition has 9³=729 elements and its unramified part has 9²=81; deleting inertia loses a factor 9. The ambient H¹ has order 9⁶, since it is two copies of the rank-3 adjoint module.

*Needs:* §4.6; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract.

### 4.8 Cocycle conditions near smooth local points

At each prescribed O-valued local lift lying at a smooth point of the generic local deformation space, there are an analytic neighborhood Y and sufficiently deep integral reductions such that, for every bounded r, the nonempty fibers from level m+r to m in Y are stable under submodules `Z_{r,v}` containing B¹ and satisfying coefficient short exactness. Away from p their H¹ images have size |H⁰_v(M_r)|; at p on a Hodge–Tate regular de Rham component their size is `|H⁰_v(M_r)|·|O/ϖ^r|^{[F_v:Q_p]dim Flag(G⁰)}`. One finite coefficient extension provides smooth points in each chosen component arbitrarily close to the specified point, with approximation depth measured by the original ϖ. Use the local generic-fiber and potentially semistable-ring suppliers; this does not assert formal smoothness of the entire integral local ring. (FKP19 Proposition 4.7 and Lemma 4.9, pp.22–25; FKP22 proof of Theorem 5.2, pp.24–25.)

One proof route proceeds as follows. Apply the local smooth-point analytic-neighborhood theorem and choose an integral tangent lattice. Use its divided coboundaries and tangent basis to identify the cocycle lattice and lifting action. Use the local generic dimension formula to obtain the cardinality. Apply the coefficient-extension approximation lemma before choosing the global approximation depth.

**Checks.**

- For a smooth fixed-determinant GL₂ point away from p the quotient tangent condition has cardinality |H⁰_v(sl₂_r)|. At a p-adic place multiply by `|O/ϖ^r|^{[F_v:Q_p]}`.
- For a trivial fixed-determinant GL₂ point at level r=2 over ℤ₃, the away-p condition has 9³=729 elements. At a degree-one p-place and regular Hodge type it has 9⁴=6561; the ratio is 9, not 3. For an extension of ramification index 2, accuracy ϖ³ means ϖ′⁶.

*Needs:* LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract; ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract.

### Examples

The Checks in §§4.1 and 4.6–4.8 give the worked examples for this layer.

### Dependencies

ArithmeticGaloisDuality R02.5 and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.1; Mathlib `Submodule.map`; Mathlib `AddSubgroup.map`; §4.1; ArithmeticGaloisDuality §§D7.4, D7.7 and the function-field Selmer numerics contract; §4.2; §0.3; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; §0.2; Mathlib `LieGroup`, `GroupLieAlgebra`, `LieAlgebra.IsSemisimple` and `Subrepresentation.quotient`; Tau Ceti `TauCeti.ContCohomology.H1`; ReductiveGroupsPartII §RG2.0.3; LocallyAnalyticDistributionsPartII ND.0; NoncommutativeAndEquivariantIwasawa §§0.2, 0.7, F.2, 0.13 and the Lazard lattice comparison contract; AutomorphicFormsOnReductiveGroups Layer 1 and the semisimple Lie cohomology vanishing contract; §4.4; §0.4; §3.6; §3.5; §4.5; ReductiveGroups Layer 7; §4.6; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract.

## Layer 5: Auxiliary primes and relative Selmer annihilation

### 5.1 Cohomology on the finite splitting field

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Under C1–C4 and the deep choice of M, for the controlled lift ρ_N with N≥4M the map H¹(Gal(F_N*/F),M_M)→H¹(Gal(F_N*/F),M_1) is zero, and H¹(Gal(F_N*/F),M_M*)=0. In particular any level-M primal class with nonzero residual reduction, and any nonzero residual reduction of a dual class, restrict nontrivially to `Γ_{F_N*}`. (FKP22, Lemma 5.3, p.25; FKP19 Lemma 6.4, pp.45–46.)

One proof route proceeds as follows. Apply inflation–restriction through F_N and the cyclotomic extension; abelian conjugation and C1 kill the extra primal homomorphisms. Use deep Lie cohomology reduction vanishing for the adjoint group with full component action. For the dual use C4 and the fact that the maximal elementary abelian quotient of the congruence-plus-cyclotomic kernel is a quotient of M⊕F_p. C3 and C2 kill its equivariant maps to M*.

**Checks.**

- For a primal finite-image class, only its mod-ϖ image is forced to vanish. Replacing this conclusion by H¹ at level M being zero is too strong.
- For M=0, both finite-image H¹ groups have order 1 and every reduction image has order 1. For a nonzero residual-dual invariant line, Hom(𝔽₃,M*) has dimension 1 instead of 0, so the C2 exclusion is necessary in the inflation calculation. In the primal assertion a level-M source may be nonzero; only its reduction image is required to have order 1.

*Needs:* §0.3; §4.5; §0.6; §3.5; ArithmeticGaloisDuality §R02.2.1; §4.6.

### 5.2 A simultaneous root-position lemma

For a split simple group H over finite k and p larger than a bound depending only on its root datum (for the simple factors of g^der this bound is part of B_G), every pair of nonzero elements A∈Lie(H) and B∈Lie(H)* admits a split maximal torus T and root α such that A∉ker(dα|t)⊕⊕_β g_β and B does not annihilate g_α. The corresponding finite-ring assertion holds for nonzero A at its first nonzero ϖ-adic layer and residual nonzero B. For H of type A₁ the bound is p≥3. The adjoint Lie algebra is simple and the invariant pairing is perfect under the standing prime bound. (FKP19 Proposition 6.8 and proof, pp.47–49; FKP22 proof of Corollary 5.5, pp.26–27.)

One proof route proceeds as follows. Each failure condition is a proper closed subset of the group acting on a fixed root pair. In the big Bruhat cell clear torus denominators to bound the polynomial degrees uniformly in A,B. Count zeros over finite k to find a point outside the two failure loci. Lift through the smooth group and use the congruence Lie action to pass through higher coefficient levels. For sl₂ check the three failure cases by explicit unipotent and Weyl conjugations.

**Checks.**

- In sl₂ take A=diag(1,−1) and B evaluating the upper-right entry: the standard torus and upper root satisfy both tests for p odd.
- In sl₂(𝔽₃), take A=h and B evaluating E₁₂. For the diagonal torus dα(h)=2≠0 and B(E₁₂)=1. The perfect trace-form Gram matrix on h,E₁₂,E₂₁ has determinant −2=1; in characteristic 2 it has determinant 0. If A=0 the toral projection is always 0; if B=0 its value on every root line is 0. Both nonzero hypotheses are required.

*Needs:* ReductiveGroups Layer 7; ReductiveGroupsPartII §RG2.0.3; §1.1; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract and the semisimple Lie centralizer contract; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract.

### 5.3 One prime detects both relative classes

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Assume p>B_G, which §5.2 uses. Suppose g^der consists of one π₀(G)-orbit of simple factors. For any finite Q⊂Q_N and level-M Selmer classes φ,ψ with nonzero relative reductions, there is w∈Q_N∖Q such that `φ|Γ_{F_w}∉L^α_{M,w}` and `ψ̄|Γ_{F_w}∉(L^α_{1,w})^⊥` for its chosen (T,α). The prime may avoid any prescribed finite set. Choose one simple factor on which both restricted class images have nonzero projection; transitivity supplies it. No linear-disjointness assumption on the primal and dual cocycle fields is made. (FKP22, Proposition 5.4 and proof, pp.25–26.)

Here ψ̄, the nonzero residual reduction, is the class tested against the residual annihilator. The choice of a common simple factor uses transitivity of the component action on the nonzero invariant image submodules. The union of two proper additive kernels is not the whole group; no disjointness of the two cocycle fields is assumed.

One proof route proceeds as follows. Use finite-image vanishing to restrict nontrivially to `Γ_{F_N*}`. Choose γ₂ outside the union of the kernels of the two projections to the same simple factor. Apply simultaneous root position to φ(γ₂) and ψ̄(γ₂). Choose γ₁ with the Q_N Frobenius condition by congruence/cyclotomic disjointness. Among γ₂^rγ₁ for r=0,1,2 at most two choices fail the two required evaluations; Chebotarev realizes a successful one.

**Checks.**

- If g=g₁⊕g₂ and φ(γ) lies only in g₁ while ψ(γ) lies only in g₂*, this single γ is unsuitable; choose outside both projection kernels before selecting a root.
- On the additive group 𝔽₃², the projections x,y have separate nonzero values at (1,0),(0,1), but both are nonzero at (1,1). For the two affine tests r and r−1 on r∈{0,1,2}, r=2 gives values 2,1 and succeeds. Testing the two classes on different simple factors would not give one root.

*Needs:* §5.1; §5.2; §4.6; §4.7; Chebotarev Layer 10; FunctionFieldArithmetic §5.8.

### 5.4 Finite-prime annihilation of relative Selmer images

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Assume p>B_G, which §5.3 uses. For balanced compatible local conditions at the finite starting set S′, and one π₀(G)-orbit of simple factors, there is a finite Q⊂Q_N such that both level-M relative Selmer and relative dual Selmer images for S′∪Q vanish, using the root local condition at every w∈Q. While either relative image is nonzero one can add a detection prime that strictly decreases the cardinality of the full level-M Selmer group. The number of primes is not bounded merely by the initial relative dimension. (FKP19 Theorem 6.9 and Remark 6.10, pp.49–50; FKP22 proof of Theorem 5.2, pp.24–25.)

If |Sel_M| initially equals a positive integer A, every step made while a relative image is nonzero strictly decreases that integer; hence finitely many such steps occur. It is not enough to count drops of the relative residual dimension alone.

One proof route proceeds as follows. Use relative balance to select a primal and a dual class with nonzero reductions. At a detection prime enlarge the root condition temporarily by the unramified condition; its quotient is O/ϖ^M. The detected dual class generates the full rank-one quotient; two local-condition comparisons show the enlarged global Selmer group equals the old one. The detected primal class fails the root condition, so imposing it strictly decreases the finite full-level cardinality. Iterate; balance then kills both relative images.

**Checks.**

- A relative residual image can remain the same for one step while the full level-M order decreases. The termination measure is the positive integer full order.
- At level M=2 over ℤ₃, a finite Selmer order can decrease from 81 to 27 while its residual image dimension remains 1 at that step. The next measure is the full positive integer 27, not the unchanged dimension. When both images are 0 the added-prime set can be empty.

*Needs:* §5.3; §4.3; §4.7; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract.

### 5.5 Reduction to adjoint factor orbits

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Assume p>B_G, which §5.4 uses. The fixed-multiplier lifting problem reduces, through `G/Z⁰_{G⁰}`, to its π₀(G)-orbits of simple adjoint factors. Solve each orbit problem with its common finite component quotient and recombine by the corresponding fiber product. The prime-to-p central isogeny and the fixed multiplier recover a lift to the original G, preserving local conjugacy/components and full derived congruence image. The component quotient is common to the orbit representations; their products are not unrestricted direct products. (FKP19 Claim 6.13, pp.51–52; FKP22 proof of Theorem 5.2, p.24.)

One proof route proceeds as follows. Decompose the connected adjoint root datum into component orbits. Apply the one-orbit theorem to each finite quotient problem, allowing a common finite ramification set and coefficient extension. Use the fiber-product description to recombine. Use the prime-to-p isogeny on congruence kernels and the fixed quotient to lift back.

**Checks.**

- For two simple factors exchanged by π₀(G), one must work with their orbit and common component quotient. Independent direct products would lose that quotient.
- For four simple factors with C₂ swapping the first pair and the second pair, there are two factor orbits; each orbit quotient, by the normal product of the other pair, has component group C₂. Their fibre product over the common C₂ has component order 2, whereas the unrestricted product has component order 4 and contains the mismatched components (0,1) and (1,0). Two exchanged factors form one orbit and admit no such decomposition.

*Needs:* §0.1; ReductiveGroups Layer 8; LocalGaloisDeformationRings §§1.17, 1.20; §5.4.

### Examples

The Checks in §§5.3–5.5 give the worked examples for this layer.

### Dependencies

§0.3; §4.5; §0.6; §3.5; ArithmeticGaloisDuality §R02.2.1; §4.6; ReductiveGroups Layer 7; ReductiveGroupsPartII §RG2.0.3; §1.1; ReductiveGroupsPartII RG2.1, the nilpotent Lie centralizer contract and the semisimple Lie centralizer contract; ReductiveGroupsPartII RG2.1, the uniform finite-field root position contract; §5.1; §5.2; §4.7; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; §5.3; §4.3; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; §0.1; ReductiveGroups Layer 8; LocalGaloisDeformationRings §§1.17, 1.20; §5.4.

## Layer 6: Finitely ramified characteristic-zero lifts

### 6.1 Compatible lifts over one finite ramification set

When the input tower is constructed by §3.6, assume the arithmetic selection hypothesis of §3.2 for its datum. The following assertion takes that tower as supplied data; it also applies to the independent tower of §6.6. Assume p>B_G, which §5.4 uses. After level-M relative dual Selmer vanishing, the controlled lift can be extended to compatible fixed-μ lifts `τ_n:Γ_{F,S′∪Q}→G(O/ϖ^n)` for all n, preserving the selected local neighborhoods and root conditions. In the induction retain an auxiliary lift `ρ_{n+M}` reducing to τ_n; choose `τ_{n+1}` from its next reduction, then modify the deeper auxiliary lift. The deeper lifts need not themselves remain compatible beyond the retained level. Their inverse limit is continuous, unramified outside the same finite S′∪Q, and lies on the prescribed local components. (FKP19 Claim 6.14 and proof, pp.53–55; FKP22 proof of Theorem 5.2, pp.24–25.)

One proof route proceeds as follows. Lift the finite global representation with the local conditions, identifying the obstruction by Poitou–Tate. Use the vanishing relative dual image to solve the local discrepancy at the next retained level. Modify by a primal level-M cohomology class while preserving the chosen local lifting fibers. Induct with a moving M-level buffer and take the inverse limit of the τ_n.

**Checks.**

- At one induction step retain τ_n and a lift to n+M. After alteration only agreement with the retained level is imposed on the buffer; demanding full compatibility of buffers is unnecessary.
- With n=3,M=2, a buffer lives at level 5 and its reduction fixes level 3; at the next step the retained τ₄ is fixed, while level-6 buffer choices may differ by a class divisible by ϖ⁴. Thus the retained reductions agree at every level even though the unused buffer tails differ. Over a fixed set of size s, the inverse limit is ramified at at most s places.

*Needs:* §5.4; §4.2; §4.8; §4.7; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract.

### 6.2 Finite detection of full congruence image

There is N₁ depending on G and O such that any closed subgroup P⊂Ĝ^der(O) surjecting onto `Ĝ^der(O/ϖ^{N₁})` equals Ĝ^der(O). The assertion holds after the fixed finite coefficient extension with its own N₁. Consequently the finite initial image condition in the compatible lifting construction ensures full derived congruence image in its limit. (FKP19 Lemma 6.15, pp.55–56.)

The image used in the inverse limit is closed because it is the continuous image of a compact profinite Galois group into a Hausdorff group. The asserted surjection is to the reduction of the derived congruence kernel, not to the whole residual group.

One proof route proceeds as follows. The congruence kernel is a topologically finitely generated pro-p group. Its Frattini subgroup is open, hence contains a sufficiently deep congruence kernel. Surjectivity at that depth gives surjectivity on the Frattini quotient and therefore topological generation. Use closedness to identify the subgroup with the full kernel.

**Checks.**

- A closed proper subgroup cannot surject onto the Frattini quotient. Omitting closedness admits a proper dense subgroup of a finitely generated pro-p group.
- For ℤ₃, Φ=3ℤ₃ and the Frattini quotient has 3 elements. A closed subgroup 3ℤ₃ maps to its zero element only; the proper dense subgroup ℤ maps onto all 3 elements and demonstrates the need for closedness.

*Needs:* ProfiniteProPGroups Layer 3; ReductiveGroupsPartII §RG2.0.3.

### 6.3 Geometric lifting with prescribed components

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. Let the lifting datum satisfy C1–C4, with p>B_G. If F is a number field assume F totally real and ρ̄ odd. For each v∈S fix a local μ-lift λ_v, de Rham with regular Hodge–Tate cocharacters when v|p, and an irreducible characteristic-zero local component containing it (of its fixed Hodge/inertial type at p). There is a finite extension O′/O depending only on these local lifts and components such that for every t≥1 and every finite avoidance set S₀ disjoint from S there are a finite S̃⊃S with S̃∩S₀=∅ and a continuous fixed-μ lift `ρ:Γ_{F,S̃}→G(O′)`, whose image contains Ĝ^der(O′). For all v∈S it lies on the chosen component and is congruent modulo the original ϖ^t to a Ĝ(O′)-conjugate of λ_v. In characteristic zero it is geometric; in positive characteristic it is finitely ramified. In particular its Zariski closure contains G^der. O′ is chosen before t; S̃ and ρ can depend on t. Full derived image does not imply density in the central multiplier torus. (FKP22, Theorem 5.2 (Theorem E) and proof, pp.23–25; footnotes 6–7, pp.23–24.)

One proof route proceeds as follows. Approximate the local points by smooth points using one coefficient extension. Construct a sufficiently deep controlled tower segment and balanced cocycle conditions. Reduce to adjoint factor orbits, annihilate relative Selmer, and complete over a finite ramification set. Retain a level above N₁ to force the full congruence image. Track local neighborhoods, coefficient extension, avoidance, and component membership throughout.

**Checks.**

- For a torus the derived-image conclusion is vacuous, but the chosen multiplier still determines the lift. For GL₂ it is fixed determinant and full principal SL₂-congruence image.
- For Gₘ, derived dimension and derived congruence kernel size are 0 and 1; the lift is exactly μ. For GL₂ the derived Lie dimension is 3 and the fixed quotient is its one determinant. A finite central μ has Zariski closure dimension 0 even when the derived image is full. With original accuracy t=2 and extension index 3, the required exponent is 6 in ϖ′.

*Needs:* §3.6; §4.8; §4.3; §5.5; §6.1; §6.2; §0.2; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract.

### 6.4 The sl₂ small-prime refinement

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. If g^der=sl₂, B_G=2 is admissible: every input attached to B_G in the conventions holds for every p≥3, so the main geometric lifting theorem of §6.3, and the constructions of §§2.5–2.6, 3.4, 3.6, 4.6, 5.2–5.5 and 6.1 that it uses, hold for every p≥3 under the same C1–C4, local-lift and oddness assumptions. No assertion that those residual hypotheses follow automatically from p≥3 is included. (FKP22, Corollary 5.5, pp.26–27.)

One proof route proceeds as follows. Root vectors span sl₂ for p odd. The required torus regularity is the nonvanishing of the single root differential. Use the explicit sl₂ simultaneous-root-position argument. All other large-prime uses in the proof were only for obtaining the residual hypotheses, which are now assumed directly.

**Checks.**

- At p=3 all factors 2 and −1 in the doubling argument remain nonzero. The SL₂ root-position calculation has no larger-prime counting assumption.
- At p=3, dα(h)=2 and the doubling coefficients −1,2 are 2,2, all nonzero. At p=2, dα(h)=0 and the doubled coefficient 2 vanishes, so the same construction cannot assert that endpoint.

*Needs:* §6.3; §5.2; ReductiveGroups Layer 7.

### 6.5 Finitely ramified lifts without oddness

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. For any number field F, p>B_G and a lifting datum satisfying C1–C4, replace oddness, total reality and the p-adic regular de Rham hypothesis by local μ-lifts at v|p that are smooth points on generic framed components of dimension (1+[F_v:Q_p])dim(G^der). Keep the prime bound p>B_G of §6.3 and its local μ-lifts with chosen components at the places of S not above p. For every t there are a finite coefficient extension and finite ramification set and a fixed-μ lift with full derived congruence image, approximating the specified local lifts modulo ϖ^t up to strict conjugacy. The conclusion does not assert geometricity. (FKP22, Theorem 5.6, p.27; FKP19 Theorem 6.21, pp.56–57.)

One proof route proceeds as follows. Use the unrestricted smooth local component dimensions in the cardinality calculation. Replace equality of Selmer cardinalities by the inequality required for the same annihilation argument, accounting for the actual infinite places. Carry out the finite-ramification construction and full-image argument.

**Checks.**

- At a real place p odd makes all positive-degree cohomology vanish on the order-two decomposition group. Unrestricted local conditions give the required inequality without oddness.
- For GL₂ over a degree-one p-adic field, the unrestricted fixed-determinant framed generic dimension is (1+1)·3=6, while the regular fixed-Hodge-type dimension is 3+1=4. For real conjugation C₂ at p=3, positive-degree local cohomology is 0 even for an even residual representation.

*Needs:* §4.8; §5.4; §6.1; §6.2; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract.

### 6.6 Recovery of the irreducible lifting theorem

For F totally real, let ρ̄ be odd and assume its restriction to `Γ_{F̃(ζ_p)}` is absolutely G⁰-irreducible, [F̃(ζ_p):F̃]>a_G, p≫G in the sense of the conventions (so p>B_G, and p exceeds the bounds of §§1.1, 1.2 and 1.5), and the prescribed regular local μ-lifts. Prove C1–C4 and obtain a finitely ramified geometric fixed-μ lift with full derived congruence image, the chosen local components and arbitrary original-uniformizer approximation. The coefficient extension depends only on the prescribed local lifts and components, before the approximation depth is chosen. This target follows the independent proof of FKP19 Theorem 6.11 through its Definition 5.8 auxiliary field; it has no arithmetic selection hypothesis from §3.2. F̃ is the component field, not the full residual splitting field. (FKP19 Theorem 6.11 and Corollary A.7, pp.50–51,63–64; FKP22 §1.2, pp.5–6.)

For this irreducible route define K′ as the compositum of the elementary abelian p-extensions of K unramified outside T, Galois over F and having a simple adjoint constituent as Galois module. Prove K′ finite using ArithmeticGaloisDuality R02.3.1, finiteness of restricted-ramification H¹ for finite coefficients; it absorbs the fixed old-ramification intersections. Construct the interpolation classes at K′-split trivial primes and prove their strong disjointness over K′, rather than over K. Prove the resulting doubling and controlled-tower statement in this irreducible setting (FKP19 Definition 5.8 and Proposition 5.9, pp.29–32; Lemma 5.11, p.33; Proposition 5.12, pp.34–37; Theorem 5.14, pp.39–43).

The field K′ has the following mathematical properties.

- K′/K is a finite elementary abelian p-extension, Galois over F and unramified outside T: every defining extension lies in the maximal elementary abelian p-extension of K unramified outside the places above T, which is finite by ArithmeticGaloisDuality R02.3.1, and a compositum of elementary abelian p-extensions of K is elementary abelian.
- K′ absorbs each defining extension: every elementary abelian p-extension L/K unramified outside T, Galois over F, with Gal(L/K) isomorphic as an 𝔽_p[Gal(K/F)]-module to a simple constituent of M, is contained in K′; in particular K′-split primes split in each such L.
- K′ is monotone in T: for finite T⊂T′ every defining extension for T is one for T′, so K′ for T is contained in K′ for T′.

One proof route proceeds as follows. Apply §§1.1, 1.2 and 1.5 to verify the irreducible residual and simple-constituent hypotheses. Use the K′ interpolation and tower construction just specified. Apply the relative theory of §§4.1–4.8 and the given-tower arguments of §§5.1–5.5 to that tower with its supplied finite Frobenius prescriptions, then the given-tower argument of §6.1 and §6.2 to finish. In those applications the K′ construction supplies the tower and the nonempty Q_N conditions directly; the arithmetic selection hypothesis of §3.2 is used only by the other route through §3.6. The recombination and buffered inverse limit are exactly the constructions of FKP19 Theorem 6.11, Claims 6.13–6.14, pp.51–55.

**Checks.**

- With two degree-p² cocycle extensions over K sharing one fixed degree-p old-ramification subfield K′, their degrees over K are p² each with compositum degree p³; their relative degrees over K′ are p,p and p². Requiring disjointness over K would give the false degree p⁴.
- For r independent old simple cocycle coordinates over 𝔽_p, K′ has degree at most pʳ for those coordinates; r=0 gives K′=K. Enlarging T changes the finite field K′ and does not assert infinitely many independent unramified quotients over K.
- Absolute G-irreducibility on `Γ_{F(ζ_p)}` is retained explicitly. Irreducibility merely on Γ_F is not a substitute.
- A two-dimensional representation induced from an index-2 subgroup can be irreducible over the full group and split as two characters on that subgroup. The invariant-line count is then 0 before restriction and 2 after restriction; cyclotomic absolute irreducibility must therefore be checked on the stated restricted group.

*Needs:* §1.1; §1.2; §1.5; §§2.2–2.6; §§4.1–4.8; §§5.1–5.5 on the K′-constructed tower; §§6.1–6.2; ArithmeticGaloisDuality R02.3.1 for finite restricted-ramification H¹, R02.1 and §R02.2.1; Chebotarev Layer 10; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract.

### Examples

The Checks in §§6.2–6.6 give the worked examples for this layer.

### Dependencies

§5.4; §4.2; §4.8; §4.7; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; GlobalGaloisDeformations §§3.3–3.8 and the fixed-quotient global obstruction contract; ProfiniteProPGroups Layer 3; ReductiveGroupsPartII §RG2.0.3; §3.6; §4.3; §5.5; §6.1; §6.2; §0.2; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract; §6.3; §5.2; ReductiveGroups Layer 7; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; §1.1; §1.2; §1.5; §§2.2–2.6; §§4.1–4.8; §§5.1–5.5 on the K′-constructed tower; §§6.1–6.2; ArithmeticGaloisDuality R02.3.1 for finite restricted-ramification H¹, R02.1 and §R02.2.1; Chebotarev Layer 10.

## Layer 7: Levi-valued residual representations

### 7.1 Changing the residual lattice to a Levi projection

Let G be connected reductive and ρ:Γ→G(O) continuous with residual image in a parabolic P=MU. After a finite totally ramified coefficient extension O′/O there is g∈G(Frac O′) such that gρg⁻¹ is O′-valued and its reduction is the Levi projection of ρ̄. If P is minimal containing the residual image this reduction is its G-semisimplification. Conjugation preserves the characteristic-zero Zariski closure up to conjugacy, but need not preserve the full integral congruence kernel. (FKP22, Lemma 6.1 and proof, pp.27–28.)

One proof route proceeds as follows. Choose a cocharacter with zero weights on M and positive weights on U. Multiply it so it lifts through the relevant central isogeny to an actual cocharacter of G. Choose the ramification index large enough that conjugation by its value on the new uniformizer keeps all negative-root coordinates integral and makes the positive-root coordinates vanish residually. Apply the existing minimal-parabolic semisimplification theorem.

**Checks.**

- For SL₂ the adjoint cocharacter diag(t,1) need not lift to SL₂ without a square root; multiply the cocharacter or make the specified coefficient extension.
- In SL₂, the adjoint cocharacter represented by diag(t,1) has determinant t, so it is not an SL₂ cocharacter. Its double lifts to diag(t,t⁻¹). Conjugation weights ±2 give exponents 2 and e′−2; e′=3 makes both positive, so the unipotent residual coordinates vanish and the representation remains integral.

*Needs:* ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract.

### 7.2 Arbitrarily large controlled extension spaces

Let W≠0 and W′ be finite `F_p[Γ_{F,S}]`-modules and let 0≠W⁰⊂W be an F_p-subspace. For every integer d there is a finite set T outside S, trivial for both W and W′ and with q_v≡1 mod p, such that dim_Fp `H¹_L(Γ_{F,S∪T},W)>d`, where L_v=0 at old places and at new places inertia takes values in W⁰. The new sets may avoid any fixed finite set. (FKP22, Lemma 6.2, pp.28–29.)

One proof route proceeds as follows. Choose completely split primes for both coefficient actions and μ_p. At each new prime the allowed local space exceeds the unramified space by dim W⁰. Apply Greenberg–Wiles and the local-condition comparison formula to obtain an unbounded lower bound.

**Checks.**

- For W=F_p(χ) and any j the construction gives j independent classes after a controlled finite enlargement of T; it does not claim an infinite-dimensional group for one fixed T.
- For W⁰ of prime-field dimension 1, each new trivial local condition increases the Euler-characteristic difference by 1. With m new primes the lower bound grows by m; choose m>d+c for the fixed old correction c. For W⁰=0 the increment is 0, so no unboundedness follows.

*Needs:* ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; §0.4.

### 7.3 Parabolic representations with full abelian radical image

For connected G, P=MU, a Levi-valued residual ρ̄ and an abelian M-normalized product A⊂U of root subgroups, there are finitely many ρ̄-trivial new primes T and `ρ̄′:Γ_{F,S∪T}→A⋊M` with projection ρ̄, image containing A(k), and local restrictions conjugate to ρ̄ at every old place. At each new place the image lies in A(k) and inertia in a single chosen root subgroup. (FKP22, Lemma 6.3, p.29.)

One proof route proceeds as follows. Use the split semidirect product to identify lifts of ρ̄ with continuous cocycles in A(k). For every prime-field line in each selected root coordinate use the controlled extension-space theorem to obtain a nontrivially ramified class supported at disjoint new primes. Sum these classes; local inertia supplies generators for all A(k), while zero old local classes give conjugacy there.

**Checks.**

- For an abelian radical A with two F_p directions, use enough independent classes to make the joint image all of A; separate nonzero projections alone would not suffice.
- For A(k)=𝔽₃², inertia values (1,0),(0,1) at disjoint primes generate 9 elements. Reusing the value (1,1) generates only 3. At an old place a zero H¹ class is a coboundary, so the extension is conjugate there to the Levi value rather than necessarily equal in the original basis.

*Needs:* §7.2; §1.6; Tau Ceti `TauCeti.ContCohomology.H1`.

### 7.4 Local lifts of abelian-unipotent residual image

Let q_v≡1 mod p, p odd, and let the local residual image lie in an abelian root subgroup A(k), with inertia in U_α(k). It has an O-valued lift after coefficient extension: choose lifts u₁∈A(O),u₂∈U_α(O), put t=α∨(√q_v) with √q_v≡1 mod ϖ, and send σ_v to tu₁ and τ_v to u₂. If a fixed multiplier μ is required, multiply the Frobenius value by a central lift of μ(σ_v) and verify that μ is unramified and residually trivial here. The central multiplier lift uses the prime-to-p central isogeny; the formula without the central factor has trivial multiplier. (FKP22, Lemma 6.4, pp.29–30.)

One proof route proceeds as follows. Use Hensel for the specified square root. The coroot acts on its root group with weight 2 and A is abelian, giving the tame relation. The central correction changes the quotient without changing the tame conjugation relation.

**Checks.**

- If μ(σ_w) is a nonidentity pro-p central value, a trivial-multiplier lift fails the local datum. Correct it through the prime-to-p central isogeny.
- At p=3 and q=7, the Hensel root x≡1 modulo 3 satisfies x²=7. In SL₂, diag(x,x⁻¹) sends u(a) to u(7a); multiplying by a central z leaves that conjugation unchanged but changes the quotient by the image of z. Without z a prescribed nontrivial μ(σ) has quotient value 1 and is wrong.

*Needs:* §0.1; ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations Layer 2; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract.

### 7.5 Removing adjoint invariants by an extension

Assume p≫G, H⁰(Γ_F,M)=z(m)∩g^der for Levi-valued ρ̄ and the local regular μ-lifts. Choose A as in the faithful-center root subgroup theorem. The parabolic extension ρ̄′ can be chosen with H⁰(Γ_F,Adρ̄′ g^der)=0 and with all required local μ-lifts. If H⁰(Γ_F,M*)=0 then also H⁰(Γ_F,(Adρ̄′ g^der)*)=0. For the latter comparison use the joint images of (ρ̄′,κ̄) and (ρ̄,κ̄), which have the same prime-to-p quotient; invariance vanishing does not follow merely from equality of semisimplifications. (FKP22, Lemma 6.5 and proof of Corollary 6.6, p.30.)

One proof route proceeds as follows. The new image contains A(k) and, by the semidirect-product splitting, the original Levi image. Old invariants therefore lie in the Levi center, and faithfulness of its action on a kills them. For the twisted module compare the joint cyclotomic images and their p-kernels. Use the explicit unipotent local lift at new primes and the unchanged old local classes.

**Checks.**

- Adding a semisimple-equivalent extension need not preserve H⁰. Check actual image containment of A(k) after adjoining μ_p before applying the invariant computation.
- For the split SL₂ torus with a nontrivial root character, the old invariant line is kh. After adjoining the full upper root group, [h,E₁₂]=2E₁₂ forces h=0, so the invariant dimension drops from 1 to 0. The joint cyclotomic image must contain the old Levi image with the same κ̄ value to compare twisted invariants.

*Needs:* §1.6; §7.3; §7.4; §0.3; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract.

### 7.6 Geometric lifts of Levi-valued residual representations

Assume the arithmetic selection hypothesis of §3.2 for the residual parabolic extension to which the global lifting theorem is applied. Let G be connected, F totally real, and ρ̄ odd with image in a Levi M of P. Assume p≫G, regular geometric local μ-lifts, H⁰(Γ_F,M_ad)=z(m)∩g^der and H⁰(Γ_F,M_ad*)=0. Suppose either μ_p⊄F(Adρ̄), or P is maximal, ρ̄ is absolutely M-irreducible and satisfies the D alternative of maximal separation. Then after finite coefficient extension there is a finitely ramified geometric fixed-μ lift of the original ρ̄ whose Zariski closure contains G^der. The conclusion is derived Zariski density, not necessarily full integral congruence image after changing its residual lattice. (FKP22, Corollary 6.6 and proof, pp.30–31.)

The same construction over a global function field has no oddness or archimedean requirement, uses finitely ramified local lifts and a finite-order determinant in the GLₙ application, and is the version used in §9.5. It preserves derived Zariski density after changing the lattice, without a claim about the original integral congruence subgroup.

One proof route proceeds as follows. Create the full abelian-root extension and remove invariants. Use cyclotomic exclusion or maximal separation to verify C3,C4 for the extension. Apply the main lifting theorem to that extension. Change the integral lattice to recover the original Levi-valued residual representation; characteristic-zero derived density survives.

**Checks.**

- An even GL₂ diagonal residual representation over Q is outside the geometric conclusion. At real places the added p-primary extension is conjugate to its Levi projection.
- For an even diagonal GL₂ representation over ℚ, complex conjugation is scalar, fixing all 3 adjoint dimensions rather than 1; it fails the oddness hypothesis. Changing a lattice preserves the derived Zariski closure dimension 3 but can shrink the integral congruence subgroup, so only density is concluded.

*Needs:* §7.5; §1.5; §1.10; §6.3; §7.1; §0.2; ReductiveGroups Layer 7; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract.

### 7.7 The torus criterion

Assume the arithmetic selection hypothesis of §3.2 for the residual parabolic extension to which the global lifting theorem is applied. For ρ̄ valued in a split maximal torus T, the equality H⁰(Γ_F,M)=t∩g^der holds precisely when every root character α∘ρ̄ is nontrivial. The dual invariant condition additionally excludes κ̄⁻¹ from the toral and root constituents. Together with p≫G, the Borel separation criterion, oddness and the required local lifts, these hypotheses imply the Levi geometric lifting theorem. Merely requiring that the image lie in no proper subtorus is insufficient. (FKP22, Remark 6.7, p.31; Lemma A.18, p.51.)

One proof route proceeds as follows. Decompose g^der into t^der and its root lines. Read the two invariant conditions from the actual characters. Apply the Borel criterion and the Levi theorem.

**Checks.**

- For a nontrivial quadratic χ in SL₂, diag(χ,χ⁻¹) is scalar and its root χ²=1. Its adjoint invariant dimension is 3 rather than the toral value 1. If χ² and χ⁻² are both nontrivial, the root fixed dimensions are 0 and the toral fixed dimension is 1.

*Needs:* §1.12; §7.6; ReductiveGroups Layer 7.

### 7.8 A GSp₄ Siegel example

Assume the arithmetic selection hypothesis of §3.2 for the residual parabolic extension to which the global lifting theorem is applied. Let r be the absolutely irreducible residual classical newform representation of weight a≥2, and δ an odd residual character, placed in the GSp₄ Siegel Levi as (r,δ). Assume neither Sym²r⊗δ⁻¹ nor Sym²(r∨)⊗δ has a trivial constituent or a κ̄⁻¹ constituent, and that the Levi derived adjoint part has no κ̄⁻¹ constituent. Set χ=det(r)δ⁻¹ and impose D(1,1,4); for prime-field valued χ it suffices and is equivalent to require ord(χᵇκ̄)≥5 for every |b|≤2. Use a de Rham lift of δ of weight w such that w is outside {0,1−a,2−2a}. Then the weights {0,1−a,w,w+a−1} are distinct in the standing HT(κ)=−1 convention. With the required local fixed-multiplier lifts and sufficiently large p, §7.6 gives a geometric GSp₄ lift with derived Zariski-dense image. The constituent and separation exclusions depend on δ; absolute irreducibility of r alone does not imply them. (FKP22, Example 6.8, p.31; Example A.16, p.50.)

One proof route proceeds as follows. Use the matrix formula for both radical representations and the adjoint quotient character χ=det(r)δ⁻¹. Use the newform lift and a de Rham lift of δ to obtain regular local lifts of the Levi representation. Apply maximal separation and the Levi geometric lifting theorem.

**Checks.**

- The four Hodge–Tate weights 0,1−a,w,w+a−1 are distinct exactly when w avoids 0,1−a,2−2a (for a≥2). The character separation depends on δ.
- For a=2 and w=2 the four weights in the fixed convention are 0,−1,2,3 and are distinct. For w=0,−1,−2 the multisets are respectively {0,−1,0,1}, {0,−1,−1,0}, {0,−1,−2,−1}, each with a repeated entry. The scalar point (cI,c²) has determinant-ratio χ=1.

*Needs:* §1.11; §1.8; §7.6; AutomorphicGaloisRepresentations Layer 1; AutomorphicGaloisRepresentations Layer 5.

### Examples

The Checks in §§7.7–7.8 give the worked examples for this layer.

### Dependencies

ReductiveGroups Layer 7; ReductiveGroups Layer 8; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; ReductiveGroupsPartII RG2.1, the finite-image semisimplification contract, the finite-image semisimplification scalar-extension contract and the parabolic adjoint filtration contract; ArithmeticGaloisDuality §R02.5.1 and the function-field Selmer numerics contract; ArithmeticGaloisDuality R02.5, change of local condition, and the function-field Selmer numerics contract; Chebotarev Layer 10; FunctionFieldArithmetic §5.8; §0.4; §7.2; §1.6; Tau Ceti `TauCeti.ContCohomology.H1`; §0.1; ArithmeticGaloisRepresentations Layer 2; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; §7.3; §7.4; §0.3; ReductiveGroupsPartII RG2.1, the large-prime unipotent exponential contract; §7.5; §1.5; §1.10; §6.3; §7.1; §0.2; LocalGaloisDeformationRings §3.11 and the smooth local approximation contract; §1.12; §7.6; §1.11; §1.8; AutomorphicGaloisRepresentations Layer 1; AutomorphicGaloisRepresentations Layer 5.

## Layer 8: Actual reductions of modular forms

### 8.1 Modularity of an actual residual representation

For ρ̄:Γ_Q→GL₂(k), Modular(ρ̄,r,N) means that there are a normalized cuspidal newform f∈S_r(Γ₁(N)), r≥2, an embedding of its coefficient field into Q̄_p, a finite coefficient extension E containing the resulting representation, a Γ_Q-stable O_E-lattice Λ⊂E² and an embedding k_E→k̄ such that Λ/m_EΛ is isomorphic over k̄ to ρ̄. Isomorphism concerns the entire representation, including its extension class; no semisimplification is taken. (FKP22, §1, p.2; §7 preceding Lemma 7.3, p.35.)

One proof route proceeds as follows. Use the existing newform Galois representation and stable-lattice carriers. Quantify over coefficient extensions, integral lattices, residual embeddings and a residual intertwining isomorphism.

The API has the following mathematical properties.

- A modularity witness supplies the newform, embedding, lattice and full residual isomorphism.
- Isomorphic residual representations and coefficient extensions give the same predicate.
- For absolutely irreducible residual representations the predicate agrees with the usual modularity predicate, because stable lattices are unique up to homothety.

**Checks.**

- An isomorphism of semisimplifications of χ⊕1 and a nonsplit extension is not a witness for actual modularity via the same lattice. For a nontrivial unipotent matrix in characteristic 3, rank(g−I)=1, whereas the split sum has rank 0, although both traces are 2. The fixed dimensions are respectively 1 and 2.
- Scaling Λ by a nonzero E-scalar leaves its residual representation unchanged up to isomorphism. Multiplication Λ→3Λ is an O-linear isomorphism and induces residual dimension 2 on either side.
- The two endpoint lattices in the distinct-character stable segment give opposite nonsplit extensions, which remain different actual reductions despite their common semisimplification. With valuation bounds −2≤s≤1 the two endpoints have upper/lower extension ranks (1,0) and (0,1), and both interior reductions have ranks (0,0).

*Needs:* AutomorphicGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 8.2 Residual hypotheses for nonsplit odd GL₂ extensions

Let F be totally real, p≥3, and ρ̄ a nonsplit extension of 1 by χ̄ with χ̄(c_v)=−1 and χ̄≠κ̄⁻¹. Then C1–C4 hold. The exceptional case χ̄=κ̄ is included when it is different from κ̄⁻¹; it requires its own cocycle calculation rather than the distinct-character argument. (FKP22, Lemma 7.1 and proof, pp.32–33.)

One proof route proceeds as follows. Compute the unique invariant and quotient lines of the nonsplit trace-zero adjoint representation. Restrict to the elementary abelian p-Sylow of the finite residual splitting group and take prime-to-p quotient invariants. Exclude most character coincidences by oddness. For χ̄=κ̄ compute cocycle values on an F_p-basis of the unipotent p-Sylow and use the boundary map to kill the remaining one-dimensional H¹. Use the unique adjoint quotient line to verify prime-field C3 via scalar-extension twists.

**Checks.**

- For a split 1⊕κ̄ residual representation C4 may fail; construct a nonsplit extension before invoking the nonsplit criterion.
- For the subgroup generated by diag(−1,1) and I+E₁₂ over 𝔽₅, a commuting trace-zero matrix is first diagonal and then has equal diagonal entries; 2a=0 forces a=0. The nonsplit adjoint invariants have dimension 0. The split diagonal case instead retains the one-dimensional h invariant.

*Needs:* §0.3; ArithmeticGaloisDuality §R02.2.1; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 8.3 Matching the local and global determinant

For F=Q, r≥2 and the odd residual extension of 1 by χ̄, set `μ=κ^{r−1}[χ̄κ̄^{1−r}]`. After coefficient extension, the local ordinary potentially crystalline lift can be chosen with an unramified quotient and determinant μω₀, where ω₀ has finite p-power order, trivial residual reduction and ω₀(Art_Qp(p))=1. Local and global Kronecker–Weber extend ω₀ to Γ_Q, unramified away from p. At Serre weight the crystalline ordinary choice can be retained with the compatible determinant. An arbitrary unramified factor in a previously chosen quotient must be removed locally before this global extension step. (FKP22, Proof of Theorem 7.4, p.36; proof of Lemma 7.2, pp.33–35.)

One proof route proceeds as follows. Use the local potentially crystalline/crystalline lift and separate its finite inertial character from its unramified quotient character. Twist by the finite inertial normalization so ω₀ is trivial on the chosen uniformizer. Extend that character through Q_p× and the p-power cyclotomic extension of Q. At the other places use the fixed-determinant local-lifting export.

**Checks.**

- A local finite-order correction with nontrivial value on Art(p) cannot be inflated from a global character unramified outside p. The selected correction has value one there.
- An unramified finite local character taking Art(p) to a nontrivial root ζ has value ζ rather than 1 on the uniformizer and cannot be the cyclotomic correction. After normalization the value is 1. The Teichmüller factor reduces to χ̄κ̄¹⁻ʳ, so μ reduces to κ̄ʳ⁻¹χ̄κ̄¹⁻ʳ=χ̄.

*Needs:* LocalGaloisDeformationRings §2.14; LocalGaloisDeformationRings §§3.11, 8.5, 8.10; LocalGaloisDeformationRings §§6.5, 6.17 and the GL₂ local determinant normalization contract; ClassFieldTheory Layer 7; AlgebraicModularFormsAndSerreWeights Layer 4; ClassFieldTheory Layer 13.

### 8.4 Modularity after semisimplification

Every continuous odd ρ̄:Γ_Q→GL₂(k) has semisimplification isomorphic to the semisimplification of a reduction of a newform representation of some weight r≥2 and level N. In the irreducible case use Serre modularity; in the reducible case use an Eisenstein eigenform, make it cuspidal modulo p and apply Deligne–Serre lifting. This gives no control of the original extension class or a prescribed weight and level. (FKP22, Lemma 7.3 and proof, p.35.)

One proof route proceeds as follows. Invoke the existing Serre theorem in the irreducible case. In the reducible case choose the Eisenstein series with the two specified residual characters. Use an auxiliary prime or a theta iterate to make a cuspidal mod-p eigensystem, then lift it by the existing eigenform-lifting theorem.

**Checks.**

- A nonsplit extension and the split sum have identical traces; the determinant or Hecke traces alone do not prove actual residual modularity.
- Over 𝔽₃, I and I+E₁₂ have the same trace 2 and determinant 1, but ranks of (g−I) are 0 and 1. Their semisimplifications coincide while the actual representations do not.

*Needs:* ClassicalSerreModularity R27.6, Full classical Serre theorem; AlgebraicModularFormsAndSerreWeights Layer 5, Deligne–Serre eigenvalue lifting; AlgebraicModularFormsAndSerreWeights Layer 4; AutomorphicGaloisRepresentations Layer 1.

### 8.5 Modularity of reducible odd representations

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. For p≥3 and a continuous residual representation `ρ̄:Γ_{Q,S}→GL₂(k)` that is an extension of 1 by χ̄ with χ̄(c)=−1 and χ̄≠κ̄⁻¹, the actual representation is modular. For every r≥2 it is modular of weight r at some level; at r=k(ρ̄|Γ_Qp), Serre’s local weight, it is modular at a level prime to p. Split extensions are included. The scalar local ratio `χ̄|Γ_{ℚ_p}=1` is included for every odd p; at p=3 it is distinct from the excluded ratio ω. (FKP22, Theorem 7.4 (Theorem B) and proof, pp.35–36; Pan22, Introduction, Theorem 1.0.2, p.3 (arXiv:1901.07166v2).)

One proof route proceeds as follows. For a nonsplit extension verify C1–C4 directly. Choose the ordinary local component with the normalized determinant and desired weights; at Serre weight choose the crystalline component. Apply the sl₂ geometric lifting theorem, ensuring irreducibility by full derived image. Apply the exported Skinner–Wiles theorem over Q (ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`: χ̄|D_p≠1, ordinary shape (∗ ∗; 0 1) on inertia, determinant `ψκ^{r−1}` with ψ of finite order) if χ̄|Γ_Qp≠1, and Pan’s theorem (GL2ModularityLifting §10.15) if χ̄|Γ_Qp=1, for every odd p; local–global compatibility identifies weight and p-level. For a split extension first create a nonsplit residual extension, apply the same construction and change its residual lattice to the split Levi projection.

**Checks.**

- For a nonsplit odd extension with χ̄=κ̄⁻¹ the theorem does not apply. At Serre weight the crystalline local component gives the p-prime level conclusion.
- At p=3, the odd quadratic character of ℚ(√−2) has χ̄(c)=−1; −2≡1 modulo 3 and Hensel gives √−2 in ℚ₃, so its local value is the trivial character. It differs from κ̄⁻¹, whose inertia is nontrivial. Pan’s excluded local ratio is ω, while this ratio is 1, so the p=3 scalar case is included.

*Needs:* §8.1; §8.2; §8.3; §6.4; §7.1; §7.3; AutomorphicGaloisRepresentations Layer 5; AlgebraicModularFormsAndSerreWeights Layer 4; LocalGaloisDeformationRings §§6.5, 6.17 and §2.28; ClassicalSerreModularity §I.1, `I.1/residually-reducible-ordinary-lifting`; GL2ModularityLifting §10.15 and the unconditional Pan–Fontaine–Mazur contract.

### 8.6 The Hamblen–Ramakrishna specialization

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. The reducible modularity theorem implies the earlier Hamblen–Ramakrishna statement for a nonsplit odd extension with `χ̄≠κ̄^{±1}`, χ̄²≠1, the specified nondegenerate local behavior at p and k generated by χ̄-values. These extra assumptions are unnecessary for this new conclusion. No prime-field multiplicity-freeness assertion is used. (FKP22, Theorem A, pp.2–3; Theorem 7.4, pp.35–36.)

One proof route proceeds as follows. Check that the older hypotheses imply p≥3, oddness and χ̄≠κ̄⁻¹. Apply the actual modularity theorem and discard its stronger weight/level conclusions.

**Checks.**

- A coefficient-field automorphism can repeat prime-field constituents even when the k-module is multiplicity-free; this corollary uses no false restriction-of-scalars criterion.
- For k=𝔽₉, a k-trivial line has prime-field dimension 2 and two trivial Jordan–Hölder factors, despite its k-multiplicity 1. Restriction of scalars cannot justify multiplicity-freeness; the modularity implication uses only the weaker actual theorem hypotheses.

*Needs:* §8.5.

### 8.7 The totally real conditional consequence

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. Over a totally real F, a nonsplit odd extension of 1 by χ̄≠κ̄⁻¹ with the local ordinary μ-lifts admits the geometric irreducible lift of the sl₂ theorem. Whenever the hypotheses of a Skinner–Wiles theorem over F hold for that lift, Theorem B of OrdinaryAutomorphicFormsAndModularityLifting §5.3 under its Hypothesis H, or the totally real route of ClassicalSerreModularity §I.1 at the hypotheses stated there, it is Hilbert modular and its original integral lattice realizes the actual residual representation. This does not assert modularity over every totally real field without the modularity theorem’s extra hypotheses. (FKP22, Remark 7.5, p.36.)

One proof route proceeds as follows. Apply the direct GL₂ residual criterion and choose the ordinary local components. Construct the lift and check every hypothesis of the imported totally real modularity theorem. Use its automorphic Galois representation comparison to retain the original residual lattice.

**Checks.**

- If the imported totally real modularity theorem has an extra residual or local hypothesis, the implication remains conditional on it.
- For F=ℚ the field degree [F:ℚ]=1 and every residual character field is abelian, so the abelian-field conditions used in the totally real route of Skinner–Wiles Theorem A hold, and the unconditional statement is the ClassicalSerreModularity target. For an arbitrary totally real F, Hypothesis H of Theorem B is not implied by oddness; no unconditional Hilbert modularity statement is made for that case.

*Needs:* §8.2; §6.4; ClassicalSerreModularity §I.1; OrdinaryAutomorphicFormsAndModularityLifting §5.3; AutomorphicGaloisRepresentations Layer 1.

### 8.8 Infinitely many actual extension classes

Let Γ be finite, L an infinite field and χ:Γ→L×. If dim_L H¹(Γ,L(χ))>1 or dim_L H¹(Γ,L(χ⁻¹))>1, there are infinitely many pairwise nonisomorphic two-dimensional Γ-representations over L with semisimplification 1⊕χ. For χ≠1 the nonsplit classes in each orientation are projective spaces of the corresponding H¹; for χ=1 identify the two orientation copies. (FKP22, Lemma 7.6, pp.36–37.)

Use the supplied short exact sequence in the category of representations: an equivariant injection of the specified subline and a surjection to the specified quotient line, with image equal to kernel. These are actual extensions, rather than trace identities. Mathlib's `CategoryTheory.ShortComplex.ShortExact` on `Rep` supplies this notion.

The supplied short exact sequence has the following properties.

- The injection identifies the given subline with an invariant one-dimensional subspace of the middle representation.
- The quotient is onto the specified line representation, with that invariant subline as its kernel.
- The composite of the injection and quotient is zero, and the resulting sequence is short exact.

One proof route proceeds as follows. Identify extensions of the two characters with the existing H¹ carrier. An isomorphism between nonsplit extensions rescales the extension class, giving the projective-space quotient. A projective line over an infinite field has infinitely many points; use an injection from it when H¹ has dimension at least two.

**Checks.**

- For the trivial middle representation, i(a)=(a,0) and q(a,b)=b give range and kernel both L×{0}, each of dimension 1. This is an actual split extension.
- Two zero maps have ranks 0 and 0, so fail both the injection and quotient requirements.
- Taking i(a)=(a,0) and q(a,b)=a gives q∘i=1, and the range L×{0} differs from the kernel {0}×L; injectivity and surjectivity alone do not define an extension.
- For Γ=C_p, L of characteristic p and χ=1, dim H¹=1 gives a single nonzero projective class; dimension strictly greater than one is essential.
- For Γ=C₃ and L=k̄ of characteristic 3 with χ=1, dim H¹=1 and all nonzero cocycles give the single projective class. For Γ=C₃², dim H¹=2 and cocycle coordinates (1,t) give distinct projective points for distinct t∈L. In the corresponding representations the two generators act by I+E₁₂ and I+tE₁₂; an intertwining isomorphism between the representations for t and s forces t=s.
- For L=𝔽₃ and Γ=C₃² with χ=1, H¹ has dimension 2 but its projective line has only (3²−1)/(3−1)=4 points. The infinitude conclusion uses the infinite-field hypothesis, even though the same extension classification works over a finite field.

*Needs:* Mathlib `Representation`; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.Equiv`; Mathlib `Rep.of`; Mathlib `groupCohomology.H1`.

### 8.9 The stable-lattice segment and its reductions

For an irreducible continuous ρ:Γ→GL₂(E) with residual semisimplification χ₁⊕χ₂ and χ₁≠χ₂, the homothety classes of stable O_E-lattices form a finite segment in the existing Bruhat–Tits tree. Use IntegralHeckeAndGaloisDeterminants §1.4, “Classical Ribet lattice”, for nonsplit reductions in the two opposite orientations. This section adds that they are the endpoint reductions, that interior vertices give the split representation, and that the endpoint classes are invariant under coefficient extension. After any finite extension E′/E the two indecomposable reduction classes are their scalar extensions, and newly subdivided interior vertices contribute only the split class. If the residual representation is absolutely irreducible, use the existing unique-homothety theorem instead. A stable lattice exists; the coefficient action is bounded and the characteristic-zero representation is irreducible. (FKP22, Proof of Proposition 7.7, p.37; Bellaïche–Chenevier (2014), Propositions 11 and 32, cited there; BC14, Lemma 10 and Proposition 11, pp.9–10; Definitions 29–30 and Proposition 32, pp.16–17 (author preprint pagination), cited by locator; Ribet10, §1.2, Proposition 1.4 and Lemmas 1.3–1.5, pp.6–7; §1.3, Exercises 1.5–1.7 and 1.10, p.8.)

The apartment formula is Λ_s=Oe₁⊕ϖˢOe₂ with −min_g v(b_g)≤s≤min_g v(c_g). The minima range over the actual image, and irreducibility ensures that each family has a nonzero entry and a finite minimum. Individual zero entries have valuation ∞; no degree or index is assigned to a nonexistent minimum. Extension multiplies both bounds by the ramification index. This proves the coefficient-extension endpoint assertion directly from integral eigenprojectors; it does not require an assertion that every stable vertex over the extension descends.

One proof route proceeds as follows. Identify stable lattices with fixed vertices in the tree. Distinct residual characters exclude branching; a fixed ray would give an invariant E-line, so the fixed segment is bounded and finite. Analyze the neighbor quotient of a lattice to identify the two endpoints and the split interior reductions. Choose g₀ with distinct residual eigenvalues and diagonalize it by Hensel lifting. Its integral eigenprojectors split every stable lattice, so all fixed vertices lie in one apartment. If b_g,c_g are the off-diagonal entries, Λ_s=Oe₁⊕ϖ^sOe₂ is stable precisely when −min_g v(b_g)≤s≤min_g v(c_g). Irreducibility makes both bounds finite. On extending E, the bounds multiply by the ramification index. Endpoint reductions are scalar extensions, and the new strictly interior lattices have both off-diagonal reductions zero.

**Checks.**

- If residual characters differ, the chosen g₀ has eigenvalue difference a unit and its integral eigenprojectors split every stable lattice. Under ramification index e′ a segment of length d becomes length e′d, with the same two endpoint classes after scalar extension.
- If min v(b_g)=2 and min v(c_g)=1, the stable values are s=−2,−1,0,1. The endpoints have one off-diagonal reduction nonzero and the two interior points have both zero. After ramification index 3 the values range from −6 to 3, giving 10 vertices but still just the same two nonsplit classes and the split class.

*Needs:* IntegralHeckeAndGaloisDeterminants §1.4, Classical Ribet lattice; ReductiveGroupsPartII RG2.2; ArithmeticGaloisRepresentations §§1.6, 1.11.

### 8.10 Finitely many actual reductions at fixed weight and level

Fix p odd, N≥1,r≥2 and distinct residual characters 1,χ̄ with χ̄ odd. Only finitely many isomorphism classes over k̄ of residual representations with semisimplification 1⊕χ̄ arise from stable lattices in newform representations of weight r and level N, even allowing arbitrary finite coefficient extensions and all residual embeddings. Thus a finite quotient Γ of Γ_Q with dim H¹(Γ,k̄(χ̄))>1 has infinitely many extensions of this semisimplification, only finitely many of which occur at that fixed weight and level. (FKP22, Proposition 7.7, p.37.)

For one newform f, one prime 𝔭 of its coefficient field K_f above p and one embedding of the residue field k_𝔭 into k̄, the bound of three counts the two indecomposable endpoint classes and the split class, after allowing all coefficient extensions. Since p is odd, complex conjugation has eigenvalues 1,−1 and `ρ_{f,ι}` is realized over `K_{f,𝔭}`; embeddings ι over the same 𝔭 differ by an automorphism of Q̄_p, which acts on reductions through the residual embedding, and a larger residual field adds no class. The split class 1⊕χ̄ is one class for all of them, so f contributes at most 1+2Σ_𝔭 f_𝔭≤2[K_f:Q]+1 classes, f_𝔭 the residue degree. The split class can first appear when an edge is subdivided, so only the two indecomposable classes, rather than all reductions, are asserted to be invariant under coefficient extension.

One proof route proceeds as follows. There are finitely many normalized eigenforms and coefficient embeddings at fixed weight and level. For each use the stable-lattice segment and extension invariance of its indecomposable endpoints. Count the two endpoint classes for each prime above p and each residual embedding, and the one split class; compare with the infinite projective family.

**Checks.**

- One newform, prime above p and residual embedding contribute at most 2 nonsplit orientations and 1 split class. For K_f=Q(√5) and p=11, 5≡4² mod 11 gives two primes of residue degree 1, two reductions and a bound 1+2·2=5, not 3. For an inert prime with k_𝔭=𝔽₉, the Frobenius of 𝔽₉ sends the class (1,t), t∈𝔽₉∖𝔽₃, to the distinct class (1,t³), again giving the bound 5. A segment of length 1 contributes 2 classes; after ramification index 2 it has length 2 and can contribute the additional split class, for a total of 3. Thus only the nonsplit endpoint classes are invariant under coefficient extension.

*Needs:* §8.9; §8.8; §8.1; AutomorphicGaloisRepresentations Layer 1; AlgebraicModularFormsAndSerreWeights Layer 4.

### 8.11 The boundary of fixed-level lifting methods

Fix an odd χ̄:`Γ_{Q,S}`→k×. After a finite enlargement S′⊃S by χ̄-trivial primes of norm ≡1 mod p, with S′ depending on χ̄, there is a finite quotient Γ of `Γ_{Q,S′}`, through which χ̄ factors, with dim H¹(Γ,k̄(χ̄))>1. For the fixed set S itself no such quotient need exist: inflation from a finite quotient through which χ̄ factors is injective on H¹, so dim H¹(Γ,k̄(χ̄))≤dim_k H¹(`Γ_{Q,S}`,k(χ̄)), which can equal 1. The resulting infinite family with the same semisimplification cannot all be realized by modular lifts at any one fixed weight and level. Therefore a lifting argument that forces one fixed modular weight and ramification level for every member cannot prove the actual reducible modularity theorem. This is a precise obstruction to that method, not a claim that every reducible deformation ring fails a particular finiteness lemma. (FKP22, Remark 7.8, p.37, where S is taken sufficiently large; Lemma 6.2, p.28.)

One proof route proceeds as follows. Apply §7.2 to W=W′=k(χ̄), viewed as an 𝔽_p-module, with W⁰ a nonzero 𝔽_p-line and d=[k:𝔽_p]; the enlargement S′=S∪T is the finite set T supplied there, so dim_k H¹(`Γ_{Q,S′}`,k(χ̄))≥2. Choose two k-independent cocycles; the homomorphism g↦(χ̄(g),c₁(g),c₂(g)) into k²⋊k× has open kernel, and Γ is the resulting finite quotient, on which both cocycles are inflated. Extend coefficients to k̄ and apply the projective-family infinitude. Apply fixed-weight-and-level finiteness.

**Checks.**

- An infinite projective extension family and a finite fixed-level set leave infinitely many classes outside that one level. This is not a claim that one uniform level realizes the family.
- The projective classes (1,t) for t in an infinite field form an infinite set, while fixed newforms f₁,…,f_m contribute at most `Σ_i(2[K_{f_i}:Q]+1)` actual reduction classes. Removing those finitely many classes leaves infinitely many; the comparison rules out one fixed weight-level pair for the whole family.
- Negative control for the fixed set: p=5, χ̄=κ̄ (odd, since κ̄(c)=−1) and S={5}. Kummer theory gives H¹(`Γ_{Q,{5}}`,𝔽₅(1)) as an extension of Pic(ℤ[1/5])[5]=0 by ℤ[1/5]×/(ℤ[1/5]×)⁵=⟨−1,5⟩/fifth powers; −1=(−1)⁵, so the dimension is 1 and every finite quotient through which κ̄ factors has dim H¹(Γ,k̄(κ̄))≤1. After enlarging to S′={5,11}, where 11≡1 mod 5 is κ̄-trivial, the classes of 5 and 11 have valuation vectors (1,0),(0,1) at (5,11), Pic(ℤ[1/55])=0, and the dimension is 2>1.

*Needs:* §7.2; §8.8; §8.10.

### Examples

The Checks in §§8.8–8.11 give the worked examples for this layer.

### Dependencies

AutomorphicGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; §0.3; ArithmeticGaloisDuality §R02.2.1; LocalGaloisDeformationRings §2.14; LocalGaloisDeformationRings §§3.11, 8.5, 8.10; LocalGaloisDeformationRings §§6.5, 6.17 and the GL₂ local determinant normalization contract; ClassFieldTheory Layer 7; AlgebraicModularFormsAndSerreWeights Layer 4; ClassFieldTheory Layer 13; ClassicalSerreModularity R27.6, Full classical Serre theorem; AlgebraicModularFormsAndSerreWeights Layer 5, Deligne–Serre eigenvalue lifting; §8.1; §8.2; §8.3; §6.4; §7.1; §7.3; AutomorphicGaloisRepresentations Layer 5; LocalGaloisDeformationRings §§6.5, 6.17 and §2.28; ClassicalSerreModularity §I.1, `I.1/residually-reducible-ordinary-lifting`; GL2ModularityLifting §10.15 and the unconditional Pan–Fontaine–Mazur contract; §8.5; ClassicalSerreModularity §I.1; OrdinaryAutomorphicFormsAndModularityLifting §5.3; Mathlib `Representation`; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.Equiv`; Mathlib `Rep.of`; Mathlib `groupCohomology.H1`; IntegralHeckeAndGaloisDeterminants §1.4, Classical Ribet lattice; ReductiveGroupsPartII RG2.2; ArithmeticGaloisRepresentations §§1.6, 1.11; §8.9; §8.8; §7.2; §8.10.

## Layer 9: Automorphy over function fields

### 9.1 Actual residual automorphy over function fields

For a global function field F of characteristic ℓ≠p, Automorphic(ρ̄) means that there are a cuspidal automorphic representation π of GL_n(A_F) with finite-order central character, an identification C≅Q̄_p, a finite coefficient field E, a stable O_E-lattice in its Lafforgue representation, and a residual embedding giving an isomorphism of the full lattice reduction with ρ̄ over k̄. Equivalently via the imported Langlands correspondence, ρ̄ has an integral lift that is irreducible, finitely ramified and has finite-order determinant. (FKP22, §8 preceding Theorem 8.1, pp.37–38.)

One proof route proceeds as follows. Use the automorphic Galois representation and stable-lattice carriers from their owners. Use both directions of the function-field Langlands equivalence, retaining the chosen lattice.

The API has the following mathematical properties.

- The automorphic lattice witness is equivalent to a finitely ramified irreducible integral lift with finite determinant.
- Finite residual coefficient extension preserves the predicate.
- For an irreducible residual representation it agrees with the usual automorphic residual predicate; the general definition retains its extension class.

**Checks.**

- A semisimplification isomorphism alone does not identify a nonsplit residual extension. The split and nontrivial unipotent reductions have rank(g−I)=0 and 1, respectively, despite equal trace 2 in characteristic 3.
- The determinant of a witness has finite order, including on constant-field Frobenius. A Teichmüller value in 𝔽₉× has order dividing 8, while 1+3 has infinite order in ℤ₃×.
- Homothetic lattices give the same witness, while nonhomothetic lattices may give different actual reductions of one π. For an apartment interval of length 1 there are 2 nonsplit endpoint classes; after ramification index 2 there are 3 vertices with the new split interior class.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3 and the function-field Langlands lattice witness contract; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11.

### 9.2 Automorphy from the lifting hypotheses

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. For F a global function field of characteristic ℓ≠p, p≫n and `ρ̄:Γ_{F,S}→GL_n(k)` satisfying C1–C4, the actual residual representation is automorphic. Choose the fixed determinant to be the Teichmüller lift of detρ̄, hence finite order. Equal-characteristic local lifts exist, and since p∤n their determinants can be corrected by an n-th root in 1+ϖO. (FKP22, Theorem 8.1 and proof, p.38.)

One proof route proceeds as follows. Import the equal-characteristic local lifting theorem and normalize the determinant by its unique pro-p n-th root. Apply the global geometric lifting theorem in characteristic ℓ. Full derived congruence image makes the characteristic-zero GL_n representation irreducible. Apply the two-way Lafforgue correspondence and retain the integral lattice.

**Checks.**

- The Teichmüller determinant has finite order even on constant-field Frobenius. An arbitrary p-adic determinant would not meet the stated Lafforgue contract.
- For p=3 and n=2, the power map on 1+3ℤ₃ has derivative 2, a unit, so a determinant correction has a unique square root. For n=3 that derivative is 0 modulo 3 and the argument is unavailable; the large-prime hypothesis includes p∤n. A finite Teichmüller determinant has order dividing |k×|.

*Needs:* §9.1; §6.3; LocalGaloisDeformationRings §2.30; AutomorphicLFunctionsAndLocalFactors §AL.3 and the function-field Langlands lattice witness contract; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; FunctionFieldArithmetic §5.8.

### 9.3 The irreducible function-field specialization

Assume the arithmetic selection hypothesis of §3.2 for the lifting datum used below. The theorem applies to an absolutely GL_n-irreducible residual representation whose restriction to `Γ_{F(ζ_p)}` remains absolutely irreducible and for which [F(ζ_p):F]>a_GL_n, with p≫n. Absolute irreducibility over F alone does not imply C1–C4 uniformly in F for a bound depending only on n. For fixed F a sufficient prime bound may also depend on its constant field. The stronger unramified-outside-S lifting theorem from de Jong–Gaitsgory is an independent imported result, not a consequence of this method. (FKP22, Remark 8.2, p.38; FKP19 Corollary A.7, pp.63–64.)

The independent no-new-ramification theorem is recorded as a boundary, and is not an additional input to the proof here. The constant-field counterexample tests the missing uniform implication from irreducibility alone.

One proof route proceeds as follows. Use the irreducible residual criteria under their actual cyclotomic hypotheses. Apply the function-field automorphy theorem. Check the failed uniform claim by induced two-dimensional examples over constant fields with q≡−1 mod p, where κ̄ occurs in the adjoint module.

**Checks.**

- For F=F_q(t), q≡−1 mod p, a suitable two-dimensional representation induced from the quadratic constant extension is irreducible but has κ̄ among its adjoint constituents.
- For F=𝔽_q(t) with q≡−1 modulo p, κ̄ has values 1,−1 on even and odd constant degrees. An induced representation from the quadratic constant extension can be irreducible over F but restrict to two lines there; its adjoint contains the quadratic constant character κ̄, giving a common constituent with the twisted adjoint.

*Needs:* §1.1; §1.2; §1.5; §9.2; §0.3.

### 9.4 Automorphy for two absolutely irreducible blocks

Assume the arithmetic selection hypothesis of §3.2 for the residual parabolic extension to which the global lifting theorem is applied. Let ρ̄ be an extension of absolutely irreducible r₂ by r₁ of dimensions n₂,n₁ over a global function field, n=n₁+n₂ and p≫n. Require r₁≄r₂ and r₁≄r₂κ̄⁻¹, and for d=gcd(n₁,n₂), `χ=(det r₁)^{n₂/d}(det r₂)^{−n₁/d}`, require [F(ζ_p):F(ζ_p)∩F(χ)]>b(n₁,n₂). Then ρ̄ is automorphic. For a split sum only r₁≄r₂ is needed in the second condition, since one may choose the orientation after the cyclotomic-degree check. For the nonsplit case, noninjectivity of the image projection to the Levi must be proved, using complete reducibility of small finite-group representations. (FKP22, Corollary 8.3 (Theorem C) and proof, pp.38–39.)

One proof route proceeds as follows. Apply maximal separation to the primitive determinant-ratio character to obtain C3,C4. For a nonsplit representation show that an injective image projection would force complete reducibility by the small-representation theorem; then apply the maximal-parabolic criteria of §1.8 and the function-field theorem. For a split sum choose an orientation avoiding the inverse-cyclotomic coincidence; both orientations cannot fail under the degree bound. Create a nonsplit extension, lift it automorphically, and change the residual lattice to the original split sum.

**Checks.**

- For unequal block dimensions the two Hom invariant tests vanish automatically. The primitive determinant character still has to pass its cyclotomic-degree test.
- For n₁=1,n₂=3, the two invariant Hom tests have dimensions 0 and 0 solely from unequal dimensions. The primitive determinant exponents are 3,−1, whose common-scalar value is c³c⁻³=1. If both orientations were inverse-cyclotomic coincidences, κ̄² would fix a block; the large cyclotomic degree rules out that bounded-order coincidence.

*Needs:* §1.10; §1.8; §7.3; §7.1; §9.2; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional extension splitting contract; AutomorphicLFunctionsAndLocalFactors §AL.3 and the function-field Langlands lattice witness contract.

### 9.5 Automorphy of separated direct sums

Assume the arithmetic selection hypothesis of §3.2 for the residual parabolic extension to which the global lifting theorem is applied. Let `ρ̄=⊕_{i=1}^r r_i` with r>1, each r_i absolutely irreducible of dimension n_i, p≫Σn_i, and r_i≄r_jψ for all i≠j and ψ∈{1,κ̄,κ̄⁻¹}. For `χ_ij=(det r_i)^{n_j}(det r_j)^{−n_i}`, require the joint condition [F(ζ_p):F(ζ_p)∩F(χ_ij:i≠j)]>b(n). Then ρ̄ is automorphic. Separate lower bounds for the pairwise fields do not replace the joint condition. (FKP22, Corollary 8.4 and Lemma A.9, pp.39–40,46–47.)

One proof route proceeds as follows. Apply the GL_n block criterion of §1.7 to obtain the invariant conditions and cyclotomic exclusion. Apply the Levi lifting argument in positive characteristic with finite determinant; its proof has no oddness or archimedean step there. Use Lafforgue and the residual lattice change to retain the original direct sum.

**Checks.**

- For three blocks the character fields must be combined before taking their intersection with F(ζ_p); pairwise degrees alone do not prove the hypothesis.
- For the three characters κ̄ψ²,κ̄ψ,1 with κ̄,ψ independent of order 10, the ψ and κ̄ψ intersections have degrees 1,1 and the κ̄ψ² intersection has degree 2, leaving cyclotomic degrees 10,10,5, while the compositum contains κ̄. The remaining joint cyclotomic degree is 1, so the joint bound fails even when each separate bound appears large.

*Needs:* §1.7; §7.5; §7.1; §9.2; AutomorphicLFunctionsAndLocalFactors §AL.3 and the function-field Langlands lattice witness contract.

### Examples

The Checks in §§9.2–9.5 give the worked examples for this layer.

### Dependencies

AutomorphicLFunctionsAndLocalFactors §AL.3 and the function-field Langlands lattice witness contract; ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11; §9.1; §6.3; LocalGaloisDeformationRings §2.30; ArithmeticGaloisDuality §R02.4.3 and the function-field Selmer numerics contract; FunctionFieldArithmetic §5.8; §1.1; §1.2; §1.5; §9.2; §0.3; §1.10; §1.8; §7.3; §7.1; ArithmeticGaloisRepresentations §§7.2–7.7 and the small-dimensional extension splitting contract; §1.7; §7.5.

## Layer 10: Symplectic compatible systems and conditional scope

### 10.1 Ordinary symplectic lifts with a Steinberg place

Let F be totally real, p≫n, [F(ζ_p):F]>a_GSp, and `ρ̄:Γ_{F,S}→GSp_{2n}(k)` be absolutely GSp-irreducible on `Γ_{F(ζ_p)}`, with similitude `κ̄^{1−2n}`. Assume at every v|p a fixed-similitude ordinary lift of `GL_{2n}`-weight `ξ_v∈(Z_+^{2n})^{Hom(F_v,Q̄_p)}`. Then the irreducible lifting theorem of §6.6, which has no arithmetic selection hypothesis, produces a geometric lift with similitude `κ^{1−2n}`, full derived congruence image, those ordinary local components, and two new trivial places v₀,v₁ of distinct residue characteristics where its Weil–Deligne parameters are twists of Steinberg. Its Zariski closure is `GSp_{2n}`, since the multiplier has infinite image. In the convention HT(κ)=−1 the diagonal ordinary characters have weights `ξ_{τ,2n−i+1}+i−1`. (FKP22, Proof of Proposition 9.1, pp.41–42; Appendix B, Definition B.2 and Lemma B.4, pp.52–55.)

Include both auxiliary places in the finite local prescription before applying §6.6. At a smooth Steinberg point, choose a small enough analytic neighborhood on which the regular monodromy rank persists; approximation into that neighborhood retains the prescribed component at every place. The multiplier κ¹⁻²ⁿ is infinite, so the derived-dense image also has dense central projection.

One proof route proceeds as follows. Use LocalGaloisDeformationRings §2.28 with its splitting assumptions on the prime-to-p inertia constituents, the coefficient square roots, and a pure nilpotent lift with smooth centralizer, after its permitted coefficient extensions. Regularity makes the lower half of the ordinary flag isotropic, giving the GSp Borel condition. Import the ordinary union-of-components theorem with its fixed-similitude dimension formula. Choose smooth Steinberg points at two trivial places v₀,v₁ of distinct residue characteristics and approximate both deeply enough to retain their local monodromy. This is the finite-set local prescription of §6.6; the second place ensures an away-ℓ Steinberg place for every coefficient prime ℓ. Apply §6.6. Oddness holds because the similitude `κ̄^{1−2n}` takes the value −1 on every complex conjugation c: then ρ̄(c) is an involution of multiplier −1, both of its eigenspaces are isotropic, hence Lagrangian of dimension n, and its fixed space on `Lie(Sp_{2n})` is the gl_n preserving both, of dimension n²=dim `Flag(Sp_{2n})`.

**Checks.**

- For an involution of multiplier −1 in GSp₂=GL₂ the eigenvalues are 1,−1 and the fixed space on sl₂ has dimension 1=dim Flag(Sp₂); in GSp₄ the eigenspaces are two Lagrangian planes and the fixed space on sp₄ is gl₂, of dimension 4=dim Flag(Sp₄). The identity, of multiplier 1, fixes all of sp₄, of dimension 10, and is not odd.
- For n=1, ξ=(0,0), ordinary weights are 0,1 and the multiplier κ⁻¹ has weight 1. For dimension 4 and weight zero the weights are 0,1,2,3 and the multiplier κ⁻³ has weight 3, pairing 0+3=1+2=3. A finite multiplier would have central closure dimension 0 instead of 1.

*Needs:* §6.6; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; LocalGaloisDeformationRings §§1.21, 6.5, 6.17; AutomorphicGaloisRepresentations Layer 5; LocalGaloisDeformationRings §§6.5, 6.17.

### 10.2 The residually reducible automorphy-lifting application

In addition to §10.1, impose the constituentwise and cyclotomic hypotheses of the ANT contract: the `GL_{2n}` residual constituents are distinct and individually polarized, remain absolutely irreducible and pairwise distinct on the cyclotomic subgroup, and their semisimple sum is not induced from a proper open subgroup over k̄. Take a quadratic CM L/F and a Galois totally real F′/F so that L′=LF′ is disjoint from F(ρ̄,ζ_p) in the prescribed sense. Require L′(ζ_p) not to lie in the adjoint residual splitting field, L′ not to lie in its maximal real subfield adjoined with ζ_p, and no order-p quotient of the residual semisimple image. For p>3 with p∤2n, the lift of §10.1 restricted to `Γ_{L′}` is RACSDC automorphic once the ordinary residual potential-automorphy seed is provided as in §2.28 of ModularityAndLanglandsExtensions: weight zero, ι-ordinary, matching the residual semisimplification and Steinberg at every place above v₀,v₁. Its Galois lift has ordinary weight λ and local semisimple characters `ψκ^{2n−i}` at the selected away-p place. The constituent polarization acts on an adjoint block by X↦−AXᵗA⁻¹. A pairing that permutes two constituents does not meet this requirement. The characteristic-zero representation is semisimple (indeed absolutely irreducible by derived density). Apply the source-primitivity ANT theorem with all eight conditions, retaining the absolute residue-field primitivity condition. All eight ANT hypotheses in the supplier contract apply to the actual restricted lift and its seed; the residual primitivity and constituent conditions are tested after the specified disjoint base change. (FKP22, Proof of Proposition 9.1, pp.42–43; cited ANT20 Theorem 1.1; ANT20, Theorem 1.1, pp.1–2 (arXiv v2); notation and ordinarity, pp.3–4.)

Use the source-primitivity theorem of PL.7 and check its requirement on the semisimplified residual representation over k̄. Noninduction of an unsemisimplified residual representation alone is not a substitute. The p≫n bound supplies p>3 and p∤2n; disjoint extensions preserve the relevant finite residual images, but each cyclotomic constituent restriction and polarization is still an explicit requirement.

One proof route proceeds as follows. Use GSp irreducibility to obtain a nondegenerate pairing on every GL constituent, not a pairing that permutes constituents. Use disjointness to preserve the exact finite residual image and cyclotomic constituent conditions. Use the cyclic-quotient bound to exclude a p-quotient and supply the required cyclotomic degree conditions. Combine residual ordinary potential automorphy with Steinberg components above v₀ and v₁ (ModularityAndLanglandsExtensions §2.28, with its simultaneous finite-place variant and the ι-ordinary supplier contract), regularity and noninduction with the ANT20 theorem of PotentialAutomorphyInfrastructurePartII PL.7, checking its eight hypotheses one by one.

**Checks.**

- A polarized sum whose complex conjugation permutes two inequivalent constituents does not meet the individually polarized hypothesis. Verify each constituent separately.
- If conjugation swaps two scalar blocks, its adjoint action X↦−AXᵗA⁻¹ fixes diag(1,−1), whereas with each block individually polarized its scalar direction is negated. The derived tangent dimensions are n²−1 and the multiplier-kernel dimension is n²; for n=2 these are 3 and 4. ANT at dimension d=2n requires p>3 and p∤d, not merely odd p.

*Needs:* §10.1; §1.2; ModularityAndLanglandsExtensions §2.28 and the ordinary residual potential automorphy contract; PotentialAutomorphyInfrastructurePartII PL.7, The ANT lifting theorem with source primitivity; GlobalGaloisDeformations G7 §§8.1–8.4 and the polarized tangent convention contract.

### 10.3 A strictly pure symplectic compatible system

Apply ModularityAndLanglandsExtensions §2.48 to the lift of §10.1 and the automorphy comparison of §10.2, after quadratic-CM descent from L′=LF′ to F′ by AutomorphicSpectralTheory §7.1 and the required twist identifying the descended Galois representation with the original restriction. The conclusion is a strictly pure compatible system over F, indexed by coefficient places and embeddings, with the prescribed symplectic pairings and compatible similitude. The all-place density statement consumes the regular-unipotent classification and formal-character contract of that supplier. At every coefficient characteristic ℓ, one of v₀,v₁ has residue characteristic different from ℓ and supplies regular-unipotent monodromy through AG2.5–AG2.6. For n>1, the rank/formal-character input excludes the principal GL₂ alternative; for n=1 it already equals GSp₂. This section identifies the supplied system with this roadmap’s lift and its residual lattice. The system construction, strict purity and all-place monodromy conclusion are separate supplier contracts; they are not consequences of a p-adic lift alone. (FKP22, Proposition 9.1 and its final proof paragraphs, pp.41–43; cited BLGGT14 Theorem 5.5.1; BLGGT14, Theorem 5.5.1 and proof, pp.590–593; Lemma 5.3.1, pp.580–581.)

One proof route proceeds as follows. Use AutomorphicSpectralTheory §7.1 to descend the Galois-invariant cuspidal CM representation from L′=LF′ to F′, choosing its quadratic twist so the attached representation equals `ρ|Γ_{F′}`. Apply the existing node ModularityAndLanglandsExtensions §2.48 (the argument of BLGGT14 Theorem 5.5.1, with its soluble-descent and part-of-a-compatible-system inputs) to the descended representation. For every coefficient characteristic ℓ choose one of v₀,v₁ with different residue characteristic. Local–global compatibility there supplies a regular unipotent in that ℓ-adic member. Apply the requested classification with irreducibility and reductivity hypotheses, then independence of formal character/rank to exclude the principal GL₂ alternative for n>1. Use the compatible nonfinite multiplier to recover the full GSp center.

**Checks.**

- For n=1 the principal GL₂ possibility already has the required GSp₂ derived group. For n>1 it has smaller rank and requires the formal-character input to exclude it.
- With Steinberg residue characteristics 2 and 5, coefficient prime ℓ=2 uses the place over 5 and ℓ=5 uses the place over 2. At n=1 principal GL₂ and GSp₂ both have derived rank 1; for n=2 the principal SL₂ rank is 1 and Sp₄ rank is 2, so formal-character rank distinguishes them.

*Needs:* §10.2; ModularityAndLanglandsExtensions §2.48 and the all-place symplectic monodromy contract; AutomorphicSpectralTheory §7.1; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6; ReductiveGroups Layer 8.

### 10.4 Conditional relation to the L-group lifting conjecture

Let G be the finite-form L-group of a quasi-split group over F, and let ρ̄ be an L-homomorphism satisfying every hypothesis of §6.3, including the arithmetic selection hypothesis of §3.2. If the restriction of the fixed multiplier μ to the component-splitting field has Zariski-dense image in G⁰/Gᵈᵉʳ, the lift supplied by §6.3 is Zariski dense in all of G and satisfies the first bullet of FKP22 Conjecture D: it lifts ρ̄, is finitely ramified and, over a number field, has regular Hodge–Tate cocharacters. The L-homomorphism condition makes its finite component projection surjective. Automorphy additionally requires the L-group correspondence and an automorphy theorem for the particular lift. The no-new-ramification assertion for absolutely irreducible residual data belongs to the independent de Jong–Gaitsgory interface, not to the finite-ramification assembly of §6.1. At p=2, the conjectural involution-lifting version of oddness lies outside the p-odd theorem and is compared only as a conditional statement. (FKP22, Conjecture D and discussion, pp.4–5; §§8–9, pp.37–43.)

One proof route proceeds as follows. The identity component of the Zariski closure contains Gᵈᵉʳ by §6.3. The dense central quotient forces its dimension to equal dim G⁰, so it equals G⁰. Surjectivity to the finite component group then gives the whole of G. Finite ramification and regularity are the other conclusions of §6.3.

**Checks.**

- For GL₂, full SL₂ closure of dimension 3 and an infinite determinant character of central closure dimension 1 give total closure dimension 4. A finite determinant gives 3+0=3 and fails the central-density hypothesis.
- For G=GL₂ and finite determinant, full derived image gives derived closure dimension 3 and central image dimension 0, rather than the GL₂ dimension 4. For Gₘ the derived dimension is 0, so derived density says nothing about its one-dimensional centre. At p=2 the involution eigenvalue separation 1≠−1 fails.

*Needs:* §6.3; §0.1; ReductiveGroups Layer 8.

### Examples

The Checks in §§10.1–10.4 give the worked examples for this layer.

### Dependencies

§6.6; LocalGaloisDeformationRings §2.28 and the root cocycle lattice contract and the smooth local approximation contract; LocalGaloisDeformationRings §§1.21, 6.5, 6.17; AutomorphicGaloisRepresentations Layer 5; LocalGaloisDeformationRings §§6.5, 6.17; §10.1; §1.2; ModularityAndLanglandsExtensions §2.28 and the ordinary residual potential automorphy contract; PotentialAutomorphyInfrastructurePartII PL.7, The ANT lifting theorem with source primitivity; GlobalGaloisDeformations G7 §§8.1–8.4 and the polarized tangent convention contract; §10.2; ModularityAndLanglandsExtensions §2.48 and the all-place symplectic monodromy contract; AutomorphicSpectralTheory §7.1; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6; ReductiveGroups Layer 8; §6.3; §0.1.

## Downstream consumers

The finite-ramification theorem supplies fixed-quotient geometric lifts with prescribed local components to automorphy lifting arguments; the Levi theorem supplies derived-dense lifts with the original actual reduction. The modularity applications supply extension-sensitive residual witnesses and explain why one fixed weight and level cannot accommodate all extension classes. Function-field consumers obtain actual lattice reductions in the global correspondence. Symplectic consumers obtain an ordinary two-Steinberg-place lift and its identification with the compatible system supplied by ModularityAndLanglandsExtensions §2.48. The outputs using the general reducible lifting theorem retain the arithmetic selection hypothesis of §3.2; the symplectic outputs of §§10.1–10.3 use §6.6 and do not. These are output contracts; none is used to construct the lifting tower.

## References

All statements and examples above use the conventions of the following editions. A locator-only published reference supplies no claim of having read its proof.

- **FKP22:** N. Fakhruddin, C. Khare and S. Patrikis, *Lifting and automorphy of reducible mod p Galois representations over global fields*, Invent. Math. 228 (2022), 415–492; [arXiv:2008.12593v5](https://arxiv.org/pdf/2008.12593v5). Theorem and printed page numbering throughout is that of v5, pp.1–58.
- **FKP19:** N. Fakhruddin, C. Khare and S. Patrikis, *Relative deformation theory, relative Selmer groups, and lifting irreducible Galois representations*, Duke Math. J. 170 (2021); [arXiv:1904.02374v5](https://arxiv.org/pdf/1904.02374v5), printed pp.1–66.
- **LP11:** M. Larsen and R. Pink, [*Finite subgroups of algebraic groups*](https://people.math.ethz.ch/~pinkri/ftp/LP5.pdf), JAMS 24 (2011), 1105–1158; Theorem 0.2, p.1106 and §12, p.1156.
- **Lazard65:** M. Lazard, [*Groupes analytiques p-adiques*](https://www.numdam.org/item/PMIHES_1965__26__5_0/), Publ. Math. IHÉS 26 (1965), 5–219; III (3.1.3), (3.1.7.4), pp.91–94 and V (2.2.2.3), (2.2.3.1), (2.4.10), pp.165–166, 178–179.
- **BC14:** J. Bellaïche and G. Chenevier, [*Sous-groupes de GL₂ et arbres*](https://doi.org/10.1016/j.jalgebra.2014.02.005), J. Algebra 410 (2014), 501–525; author-preprint Lemma 10, Proposition 11, pp.9–10, Definitions 29–30 and Proposition 32, pp.16–17, cited by locator.
- **Ribet10:** J. Bellaïche, [*Ribet’s lemma, generalizations, and pseudocharacters*](https://people.brandeis.edu/~jbellaic/RibetHawaii3.pdf), Clay summer-school lectures (2009); §1.2, Proposition 1.4 and Lemmas 1.3–1.5, pp.6–7, and §1.3, Exercises 1.5–1.7 and 1.10, p.8. The arithmetic segment argument used in §8.9 is also given by FKP22, proof of Proposition 7.7, p.37.
- **ANT20:** P. B. Allen, J. Newton and J. A. Thorne, [*Automorphy lifting for residually reducible l-adic Galois representations, II*](https://arxiv.org/pdf/1912.11269v2), arXiv v2 (2020), Theorems 1.1 and 6.1, pp.1–2 and 17–19.
- **BLGGT14:** T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, [*Potential automorphy and change of weight*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf), Ann. Math. 179 (2014), 501–609; Proposition 3.1.1, Theorem 3.1.2, pp.545–549, Lemma 5.3.1, pp.580–581, and Theorem 5.5.1, pp.590–593.
- **BLGHT11:** T. Barnet-Lamb, D. Geraghty, M. Harris and R. Taylor, [*A family of Calabi–Yau varieties and potential automorphy II*](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), PRIMS 47 (2011), 29–98; Lemma 5.1(2), author-preprint pp.34–35.
- **Pan22:** L. Pan, [*The Fontaine–Mazur conjecture in the residually reducible case*](https://arxiv.org/pdf/1901.07166v2), JAMS 35 (2022); v2 Theorem 1.0.2, p.3.
- **Gur99:** R. M. Guralnick, [*Small representations are completely reducible*](https://doi.org/10.1006/jabr.1999.7963), J. Algebra 220 (1999); Theorem A, cited by locator.
- **NSW08:** J. Neukirch, A. Schmidt and K. Wingberg, [*Cohomology of Number Fields*](https://doi.org/10.1007/978-3-540-37889-1), second edition (2008); Theorems 8.6.7, 8.6.10 and 8.7.9, cited by locator for the arithmetic duality supplier.
