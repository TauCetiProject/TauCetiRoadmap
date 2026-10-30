# Roadmap: galois sections and p-adic period mappings

**Summary.** This Part II of AnabelianGeometryAndNonabelianChabauty develops the obstruction to Galois sections supplied by polarised abelian-by-finite families. Starting with section classes and the local-system interpretation of their fundamental groups, it constructs Selmer localisations, symplectic interpolation, filtered discrete (φ,N,Gᵥ)-modules, and the model-free period comparison. The principal trichotomy and Kodaira–Parshin families give finiteness of the Lawrence–Venkatesh locus at every self-conjugate finite place. For a number field with no CM subfield, they prove that the Selmer-section image and the projection of the finite descent locus are finite at every finite place (bs, Theorems A and B, pp. 1–2; bs lines 44 and 66).

## Scope and ownership

AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6) supplies section classes, the point-section map, its field-general divisibility criterion, its number-field injectivity corollary, and the section conjecture as a proposition. This Part II begins with restriction to completions, the p-adic specialisation of that criterion, and the Selmer condition. It neither assumes nor proves the section conjecture.

Mathlib supplies absolute Galois groups, continuous homomorphisms, connected components, completions, alternating and perfect pairings, CM fields, intermediate fields and group orbits. Tau Ceti supplies the symplectic group scheme. These objects are used directly. Ordinary induction, Mackey decomposition and decomposition groups belong to ArithmeticGaloisRepresentations §§1.3, 1.12 and 2.1; the new induction here is the filtered discrete-module construction. General adelic points, their topology and torsor descent belong to HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11 and 3.1–3.5. This roadmap owns the modified adelic points of every proper finite-type K-scheme, and, for smooth projective geometrically connected varieties, the finite-cover locus and its comparison with sections; that roadmap's §3.17d uses modified adeles only for torsors under an abelian variety and does not construct the general carrier. ArithmeticGaloisDuality §R02.4.6 owns the Tate-modified adelic groups and duality of tori; their restricted products and real norm quotients are distinct from the proper-scheme carrier here.

MordellLawrenceVenkatesh §§0.5 and 0.18 own unit groups of finite-dimensional algebras and orbit-dimension geometry. Its §§1.4–1.16 own maximal CM subfields, infinity types, friendly places, filtration weights, induced de Rham periods and abelian-variety representation properties. Its §§2.1, 3.1–3.11, LV.8 and LV.10 own abelian-by-finite families, Lagrangian Grassmannians and period varieties, Kodaira–Parshin families and full monodromy. Its LV.11 owns the Mordell theorem. The application in Layer 9 gives another proof through the new locus; it introduces no second Mordell declaration. The dimension formula for that family is used rather than redefined. The self-conjugate and model-free variants below differ by admitting ramified places, every residue characteristic and families without a good model; the variable-rank supplier contract also admits locally constant relative dimension over the finite étale base.

PadicHodgeTheory §§3.3–3.5, 5.1, 5.3 and 7.3 supplies period functors, finite-level filtered monodromy modules, de Rham monodromy and de Rham pairs. CohomologyComparisons §§6.4–6.7 owns cup, trace, duality and Chern-class compatibility for Scholze's comparison. AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4 owns the abelian cohomology and polarisation ingredients; §§A6.30–A6.31 owns Weil restriction and its splitting. This roadmap assembles these into symplectic pairs and their section and period constructions, rather than reconstructing those generic theories.

## Conventions

K is a number field with fixed algebraic closure K̄. At each place u choose a compatible embedding K̄→K̄ᵤ, giving Gᵤ→G_K and transport of geometric base points. Section classes are continuous splittings modulo conjugation by the geometric kernel. The notation Y/K denotes a smooth projective geometrically connected curve of genus g≥2 in the end theorems; individual constructions state their wider domains. The local field F=Kᵥ is always a finite extension of ℚₚ, including ramified extensions and p=2,3. No equal-characteristic field is included in a p-adic Hodge statement.

Here the Hodge–Tate number is the filtration jump: ℚₚ(1) has number −1. PadicHodgeTheory and CohomologyComparisons use the opposite Hodge–Tate sign; use their actual filtrations and negate their reported Hodge–Tate weights. Purity always uses geometric Frobenius: ℚₚ(−1) has eigenvalue qᵤ, purity weight 2 and filtration jump 1. Arithmetic local reciprocity sends a uniformiser to arithmetic Frobenius and satisfies `χ_cyc(Art_F(u))=N_{F/ℚₚ}(u)⁻¹` on units (bs, footnotes 7–8 and proof of Proposition 2.19, p. 13; bs lines 647–667).

“Integral Frobenius polynomial” means a polynomial in ℤ[X], rather than only algebraic-integer roots. Purity and algebraic-integral eigenvalues pass to coefficient-field factors; rationality of a factor must be supplied before asserting integer coefficients. A fibre of a split coefficient algebra can be such a factor. In type (a), use the root-degree bound inherited from the whole representation (bs, Definition 2.1 and proof of Proposition 6.9, pp. 7, 49; bs lines 341 and 2511; WeightsInEtaleCohomology Layer R34.1, “Linear algebra operations and rational integrality”).

The coefficient field ℚₚⁿʳ is the algebraic maximal unramified extension inside F̄, with discrete semilinear descent action; it is not its valuation completion. Frobenius is bijective and semilinear, and Nφ=pφN. Write Ind_H^G W as the equivariant functions ψ:G→W with (gψ)(h)=ψ(hg). The coefficient action on induced discrete modules is (λψ)(g)=g(λ)ψ(g). The period map pulls the filtration back by horizontal transport from the centre. The similitude multiplier is data, including in rank zero (bs, §§2.2.3–2.2.4 and Definition 3.1, pp. 10–11, 16; bs lines 485, 545 and 794).

An algebra in a realisation category is finite-dimensional over that realisation's coefficient field. Modules are finite locally free; a similitude line has rank one. In representations Σ_A means `Hom_{ℚₚ-alg}(A,ℚₚ)`, never geometric algebra points. Zero modules and nonreduced algebras remain permitted where the definition allows them. The trichotomy uses #Σ_A; only split algebras allow substitution of dim A. The ratio counting small orbits is defined for nonempty finite sets. All isomorphism-class constructions use a fixed universe of small objects, with a larger universe for categories; no neutral ℚₚ-valued fibre functor on filtered discrete modules is assumed (bs, Definitions 4.3–4.4 and §6.1, pp. 33–34, 45–46; bs lines 1729 and 2290).

For a family X→Y′→Y the finite étale map Y′→Y is a covering and hence surjective; its fibres are nonempty. A suitable finite S contains the places above p and infinity and all places without a good family model over a smooth proper model of Y. Put δ=deg(Y′/Y), d=dim(X/Y′)>0 when used in the trichotomy, d_q=(2g−1)(q−1)/2 for a Kodaira–Parshin prime q, k=(q−1)/2, and nᵥ equal to the number of degree-two or degree-three subfields of F̄ over F, counting conjugate subfields separately (bs, Definitions 6.1–6.2, footnotes 20–21 and Remark 6.21, pp. 43–44, 53; bs lines 2220, 2247 and 2729).

**Checks.**

- For ℚₚ⊕ℚₚ(−1), the two jumps are 0,1, their sum is 1, the average is 1/2, and geometric Frobenius eigenvalues are 1,qᵤ. Its two summands have weights 0,2, so the sum is not pure of weight 1.
- For φ(e)=e, φ(f)=pf and N(f)=e, N(e)=0, both Nφ(f) and pφN(f) equal pe. The reversed monodromy relation would give p²e on one side.
- For T=[[1,0],[a,1]] and F¹=span(e₁), the pulled-back line is span(e₁−ae₂). At a=1 it is (1:−1), whereas push-forward gives (1:1), including over ℚ₂.
- For induction from an index-two subgroup, the unit induces to dimension 2, its tensor square has dimension 4, and induction of the tensor unit has dimension 2. Induction is lax monoidal.
- With arithmetic reciprocity over ℚ₃ and unit u=4, the cyclotomic value is 1/4, not 4. On the two Tate lines the crystalline eigenvalues are 1 and p⁻¹ and the jumps 0 and −1.

## Exact supplier contracts

Each paragraph fixes the mathematical range consumed from the named section. A gap is a required extension of that supplier, with the same quantifiers as the construction using it.

### From Mathlib

Use `Field.absoluteGaloisGroup` and `Field.absoluteGaloisGroup.map` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`, and `ContinuousMonoidHom` in `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`. The first is the algebraic-closure automorphism group with Krull topology; its definition does not supply decomposition embeddings. Use `ConnectedComponents` in `Mathlib/Topology/Connected/Clopen.lean` for the quotient at infinity, and `IsDedekindDomain.HeightOneSpectrum.adicCompletion` in `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` for finite completions.

Use `LinearMap.IsAlt` and `LinearMap.Nondegenerate` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`; alternation is vanishing on the diagonal and nondegeneracy is separation in both variables, so perfectness additionally uses finite-dimensional modules and a rank-one target. Use `Matrix.symplecticGroup` in `Mathlib/LinearAlgebra/SymplecticGroup.lean` for exact form preservation. Use `NumberField.IsCMField` and `NumberField.IsCMField.ringOfIntegersComplexConj` in `Mathlib/NumberTheory/NumberField/CMField.lean`, and `IntermediateField` in `Mathlib/FieldTheory/IntermediateField/Basic.lean`. Use `MulAction.orbit` in `Mathlib/GroupTheory/GroupAction/Defs.lean`; it is a set of points, with finiteness supplied by the finite acted-on set. Use `Nat.forall_exists_prime_gt_and_eq_mod` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` for arbitrarily large primes in a unit residue class, and `hasSum_zeta_four` in `Mathlib/NumberTheory/ZetaValues.lean` for the sum π⁴/90, including the total-function term 1/0⁴=0.

### From Tau Ceti

Use `TauCeti.Symplectic.groupScheme` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean`. It represents exact preservation of the standard alternating form. Similitudes retain a separate invertible multiplier; their rank-zero fibre is consequently G_m. Its exact form-preservation equations determine the imported symplectic structure.

### From `TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty`

Section 7.1 (NC.6), “Conjugacy classes of Galois sections”, “The section map of rational points”, “Sections of an abelian variety and the Kummer map”, and “Injectivity of the section map” supply Sect, the natural map κ, its Kummer interpretation and the injectivity criterion for any field whose abelian varieties have no nonzero point divisible by every invertible positive integer. The number-field corollary alone is insufficient for the local specialisation. Its section conjecture is only a named proposition.

### From `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups`

Layer IG.0 supplies finite étale covers, finite free integral ℤₚ-local systems and their isogeny category as continuous fundamental-group representations of a connected base, with tensor operations and fibre functors. Its comparison of the isogeny category with all rational local systems assumes a normal Noetherian base; it is not used here, since every rational local system below is the rationalisation of a lisse integral lattice. Section IG.0.3 supplies compatible finite free ℤ/pⁿ-systems, their integral ℤₚ-local systems and pullback; apply this to Spec(R_v[1/p]) in §4.1. Section IG.1.3 supplies invariance of geometric π₁ under algebraically closed field extension in characteristic zero. Applying it to the geometric kernels identifies the arithmetic completion sequence with the fibre product over G_K.

### From `TauCetiRoadmap.EtaleCohomologyFoundations`

Section F.0.2 supplies the finite étale Galois category, geometric fibre functor, based fundamental group and finite-lisse monodromy equivalence for every connected nonempty scheme, without local Noetherianity or coefficient invertibility. Applying this equivalence to each finite level of an integral local system gives the fundamental-group action used in §1.3.

### From `TauCetiRoadmap.ArithmeticGaloisRepresentations`

Sections 1.3 and 1.12 supply induction from open subgroups, restriction and the Mackey decomposition for compact groups and closed decomposition subgroups. Section 2.1 supplies Gᵤ→G_K from an embedding of closures, its image as a decomposition group, conjugacy under choices and restriction of representations. The geometric/arithmetic inverse convention is transported explicitly; abelian good-reduction Frobenius polynomials are taken from WeightsInEtaleCohomology Layer R34.2.

### From `TauCetiRoadmap.HeightsRationalPointsAndObstructions`

Sections 2.3–2.4 supply scheme adelic points and independence of integral models; §§2.3a and 2.11 supply the proper local-point compactness and product topology, including the analytic topology of each archimedean factor X(K_u). Section 2.11a supplies local étale charts and smooth openness. Sections 3.1–3.5 supply evaluation of torsors, twists, local matching and the finite étale descent set, with twisting convention eval(x)=ξ for a lift to the ξ-twist. The modified adelic carrier, its projection, its finite-cover locus and the global-section equivalence are constructed here (§§0.4–0.5).

### From `TauCetiRoadmap.PadicHodgeTheory`

Sections 3.3–3.5 supply the period functors and filtered semistable classification; §§5.1 and 5.3 supply de Rham potential semistability, algebraic-unramified D_pst and descent comparisons. Section 7.2 supplies the equivalence LisseZpSheaf.ofEtale from compatible finite étale coefficient systems to integral pro-étale local systems, with pullback and point fibres; restrict to finite free coefficients for the lattices used here. Section 7.3 supplies actual de Rham pairs and proper smooth pushforward, with tensor, cup and smooth-base-change compatibility; §§8.1–8.2 supply geometric de Rham comparison and Tate-line normalisation. These use all finite extensions of ℚₚ and all primes. Translate its Hodge–Tate weight +1 on ℚₚ(1) to the filtration jump −1 here. For the unit plus ℚₚ(−1), its reported weights are 0,−1 and the jumps used here are 0,1.

What PadicHodgeTheory must provide (gap:horizontal-pst-specialisation): On spherical polyannuli over every finite F/ℚₚ, provide the horizontal semistable period ring, potentially horizontal semistable realisations, the relative monodromy theorem for a de Rham pair with a horizontal basis, and the φ,N,G_F-equivariant specialisation isomorphisms D_pst^∇(E) ≅ D_pst(E_y) compatible with its actual de Rham comparison.

### From `TauCetiRoadmap.CohomologyComparisons`

Sections 6.4–6.7 supply naturality, scalar extension, cup products, the trace-normalised map a:B_dR(−1)≅B_dR⟨−1⟩, duality, cycles and first Chern classes for smooth proper varieties. The line-bundle statement is proved using the projective compactification P(O⊕L), so properness is retained. For a degree-one divisor on P¹ the trace of c₁ is 1 in either theory; the comparison on a class twisted by +1 uses a⁻¹. No equality with a separately chosen crystalline comparison is needed.

### From `TauCetiRoadmap.MordellLawrenceVenkatesh`

Sections 0.4–0.5 supply semilinear centralizer finiteness and unit-group representability. Sections 0.9–0.12 supply the affine-group centralizer, commutator-product count, primitive cyclic tuples and the cardinality bound for isotropic finite subgroups. Section 0.18 supplies orbit maps and the dimension of their geometric closure, hence the bound after quotienting a scalar torus. Sections 1.4–1.16 supply the maximal CM subfield, infinity-type factorisation, the conjugation identity for pure characters, local algebraicity, the friendly-place specialisations, filtration weights and induction of de Rham periods. Sections 2.1–2.4 supply families and good models. Section 2.11 and §§4.1–4.2 supply crystalline transport and its good-model fibre comparison in their unramified p>2 setting; §4.3 supplies Frobenius-centralizer orbits. Sections 3.1–3.11 supply Lagrangian geometry and full monodromy, including dimension d(d+1)/2. Layer LV.7 supplies the five-Lagrangian comparison and its unramified Frobenius small-orbit variant. Layers LV.8 and LV.10 supply the Kodaira–Parshin family and its full monodromy. Layer LV.11 supplies the original admissible-prime argument and Mordell theorem. The contracts below state the larger domains used here.

What MordellLawrenceVenkatesh must provide (gap:variable-rank-abelian-by-finite): Extend §§2.1–2.4 and 3.8–3.9 to a polarised abelian scheme of locally constant relative dimension over a surjective finite étale cover, with its finite locally free H¹ module and the product of Weil-restricted Lagrangian varieties indexed by the constant-rank components.

What MordellLawrenceVenkatesh must provide (gap:model-free-polarised-fibres): For polarised abelian-by-finite families over characteristic-zero fields, provide the induced H⁰-linear perfect alternating H¹ pairings from half the Poincaré Chern class, their Lagrangian de Rham filtration, and horizontal transport preserving algebra, module and pairing on any trivialising closed polydisc, including the induced trivialisation of the finite étale base.

What MordellLawrenceVenkatesh must provide (gap:model-free-period-maps): For smooth varieties over every finite F/ℚₚ and every F-point, provide local horizontal trivialisations and the inverse-transport period map, its flag functor, comparison of its Zariski closure with complex periods at F-rational centres, density under full monodromy, and finite intersection with a proper closed subvariety on a closed curve disc.

What MordellLawrenceVenkatesh must provide (gap:symplectic-faltings-finiteness): For every number field L, prime p, finite S containing the places above p and infinity, and integers n≥0, d>0 and B≥1, there are finitely many isomorphism classes of GSp-irreducible symplectic ℚₚ-representations (V, L₀, ω) of G_L with V of rank 2d, unramified and pure of weight n outside S, whose Frobenius eigenvalues outside S are algebraic integers of degree over ℚ at most B; B=2d includes the integer-polynomial case.

What MordellLawrenceVenkatesh must provide (gap:four-isotropic-lagrangians): For every finite-dimensional symplectic space over a field and r≥4, prove that r-tuples admitting a nonzero isotropic subspace meeting each Lagrangian in at least half its dimension lie in a proper Zariski-closed subscheme of the r-fold Lagrangian Grassmannian.

What MordellLawrenceVenkatesh must provide (gap:kodaira-parshin-local-fibres): For every characteristic-zero extension F/K and y∈Y(F), describe the geometric finite-base fibre of the Kodaira–Parshin family G_F-equivariantly by conjugacy classes of punctured-curve surjections to Aff(q) nontrivial on inertia, with the equal-fibre surjection to primitive cyclic characters, including F=K_v.

### From `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli`

Sections A3.5 and A3.7 supply the Poincaré and polarised Weil pairings; §§A4.3–A4.4 supply de Rham H¹, its Hodge sequence and connection, and the exterior cohomology structures. In characteristic zero a nonzero polarisation degree is invertible on rational cohomology. Sections A6.30–A6.31 supply Weil restriction of quasi-projective schemes over finite field extensions and its product decomposition over a splitting field for separable extensions. In degree two, restriction of a line has dimension 2 and splits into two lines; no such product is asserted for inseparable extensions.

### From `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry`

Section 1.3, “Coherent quotients, Plücker and partial flags”, supplies the flag bundle with locally free quotient conditions, including empty flags and base change. For a two-space with a rank-one step it is P¹; the empty flag is the base. Only this flag carrier is consumed, not a second moduli construction.

### From `TauCetiRoadmap.AdicEtaleGeometry`

Section A1.1 supplies strong sheafiness of affinoid algebras over complete nonarchimedean fields, including K_v⟨t₁±¹,…,tₙ±¹⟩. Section A1.3, finite-etale-local-to-global (c), identifies finite étale spaces over a strongly sheafy Spa(A,A⁺) with FÉt(A)^op. Use the rigid–adic comparison of AdicSpacesPartII Layer R1 to apply it to the polyannuli in §4.1. Fibre functors identify their profinite fundamental groups with those of Spec A.

### From `TauCetiRoadmap.AdicSpacesPartII`

Layer R1 supplies rigid analytification and algebraic/analytic pullback for finite-type varieties over a complete nonarchimedean field, including finite extensions of ℚₚ. The closed discs and spherical polyannuli used here are admissible analytic subspaces of that geometry.

### From `TauCetiRoadmap.ComplexComparisonPartII`

Section C5.2 supplies the algebraic Gauss–Manin connection of a smooth proper family and its comparison with complex Betti parallel transport. Sections C6.0 and C6.2 supply finite CW type of separated finite-type complex schemes and Riemann existence for their finite étale covers, giving the geometric fundamental-group finite-generation input in §0.5. It is applied after a specified field embedding into ℂ; no continuity of an embedding Kᵥ→ℂ is asserted.

### From `TauCetiRoadmap.EtaleDualityAndPerverseSheaves`

Section 0.3, “Poincaré duality on a smooth curve over an algebraically closed field”, supplies the Jacobian/Kummer H¹ duality. Section 0.5 supplies cup–trace identification and Galois equivariance. For n invertible in the geometric field, H¹(Ȳ,ℤ/n) has its perfect alternating pairing into μ_n∨; a symplectic basis gives pairing 1 and reversing the pair gives −1. In the local application n=k is odd and prime to p.

### From `TauCetiRoadmap.ArithmeticGaloisDuality`

Section R02.3.1, “Hermite: finitely many extensions of bounded degree unramified outside a finite set”, supplies finiteness of subfields of the fixed algebraic closure with degree≤δ and ramification contained in S. The bound and S are fixed before the fields range.

### From `TauCetiRoadmap.WeightsInEtaleCohomology`

Layer R34.1 supplies unramified, pure and integral representations outside a finite set with geometric-Frobenius weights, and their restriction, tensor and induction properties; purity passes to subquotients, while integer Frobenius polynomials pass to a subquotient only when that factor is rational. Layer R34.2 supplies abelian-variety purity and integral Frobenius polynomials at good places. ℚₚ(−1) has geometric eigenvalue q and weight 2; H¹ of an abelian variety is pure of weight 1.

### From `TauCetiRoadmap.ClassFieldTheory`

Layer 5 supplies the Kummer identification of power classes with degree-one Galois cohomology for nonzero n invertible in the field; §8.2 uses n=2 and n=3 over characteristic-zero local fields containing μ_n. Layers 7 and 11 supply local and global reciprocity, compatibility with norms and the Galois/idele character dictionary. A uniformiser maps to arithmetic Frobenius; on a unit u the cyclotomic character is the inverse local norm. Over ℚ₃ the values on u=4 are 1/4 for χ_cyc and 4 for χ_cyc⁻¹.

### From `TauCetiRoadmap.GlobalNumberFields`

Layers 2, 7 and 8 supply finite ray class groups for every modulus, their idele congruence quotient, and idele/idele-class norms with local components. Finite-power norm descent is along `N_{K/E}`, whose v₀-component is the product of the norms from all Kᵥ over Eᵥ₀. Restricting an idele character to the diagonally embedded Eᵥ₀× instead would give a product of local factors; it does not isolate one factor.

### From `TauCetiRoadmap.LocalFieldsRamification`

Layers 0, 2 and 4 supply finite local extensions, unramified extensions of each degree, and the tame quotient with στσ⁻¹=τ^q. Layer 1, “Power classes, the primary statement” and “The dyadic square-class count”, supplies the square-class counts used in §8.2, including eight square classes over ℚ₂. The residue-degree-two and residue-degree-three unramified subgroups generate the whole local Galois group because gcd(2,3)=1. At residue cardinality 5 the tame relation conjugates τ to τ⁵; replacing 5 by its inverse reverses this convention.

### From `TauCetiRoadmap.LocalGaloisGroups`

Layer 7 supplies topological finite generation of the full absolute Galois group, with generator rank [F:ℚₚ]+2. This is distinct from the maximal pro-p quotient. With d generators, homomorphisms into S_m number at most (m!)^d; transitive permutation actions therefore bound index-m open subgroups. This supplies a bound for nᵥ depending only on [F:ℚₚ], including p=2,3.

### From `TauCetiRoadmap.ReductiveGroups`

Layers 0 and 3 supply affine group functors, closed subgroup schemes, scalar subgroups and quotients. The orbit-dimension input used here is the more explicit MordellLawrenceVenkatesh §0.18 contract. Rank-zero Aut is the trivial group while its multiplier-retaining similitude group is G_m.

### From `TauCetiRoadmap.Chebotarev`

Layer 10 supplies Dirichlet-density Chebotarev for finite Galois extensions, and Layer 13 supplies the rational prime-counting specialisation used in the elementary modulus-size estimates. Layer 10 supplies the density input in Harari–Stix and infinitely many primes fixed by CM conjugation; Layer 14 supplies natural densities of the residue classes in §8.6 (I). The latter use a cyclotomic extension disjoint from the Galois closure of K.

### From `TauCetiRoadmap.AnalyticNumberTheoryPartI`

Section 0.32 supplies quantitative prime distribution in arithmetic progressions in its stated logarithmic-modulus range. The density-one comparison in §8.6 needs the stronger least-prime input below; it is used only for that comparison, not to exclude any finite place from the end theorems.

What AnalyticNumberTheoryPartI must provide (gap:linnik-polynomial-least-prime): There are absolute constants C>0 and L>0 such that every coprime residue class a modulo m≥2 contains a prime q≤C m^L, with constants independent of a and m.

## How to read the build

Layers 0 and 1 construct the section-theoretic obstruction independently of p-adic Hodge theory. Layers 2 and 3 develop the local filtered category and the global weight identity. Layer 4 proves horizontal transport of potentially semistable periods; Layer 5 applies it to polarised families. Layer 6 defines the loci and proves the trichotomy. Layer 7 proves non-density and finiteness for types (a) and (b), while Layer 8 excludes type (c) by a choice of Kodaira–Parshin parameter. Layer 9 assembles the finiteness theorems. Every API below has the hypotheses of its defining paragraph unless a bullet explicitly changes them; source locators in that paragraph apply to its API as well. Checks are concrete consequences and negative controls rather than additional Lean declarations.

## Layer 0: Selmer sections and the finite descent locus

### 0.1 Restriction of Galois sections to decomposition groups

Let K be a number field with algebraic closure K̄, X a geometrically connected separated K-scheme of finite type, u a place of K (finite or archimedean) and ι: K̄ → K̄_u a K-embedding into an algebraic closure of the completion K_u, with ι^*: G_u = Gal(K̄_u/K_u) → G_K the induced injection onto the decomposition group D_u (ArithmeticGaloisRepresentations §2.1). Fix a geometric point x̄_u of `X_{K̄_u}` and its image x̄ in `X_{K̄}`. Then the natural maps give an isomorphism of profinite extensions of G_u: `π₁^ét(X_{K_u}, x̄_u) ≅ π₁^ét(X, x̄) ×_{G_K} G_u`, restricting to the isomorphism `π₁^ét(X_{K̄_u}, x̄_u) ≅ π₁^ét(X_{K̄}, x̄)` of InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 on geometric kernels. Consequently, for a continuous section s: G_K → π₁^ét(X, x̄) of the fundamental exact sequence, the map σ ↦ (s(ι^*σ), σ) is a continuous section s|G_u of `1 → π₁^ét(X_{K̄_u}) → π₁^ét(X_{K_u}) → G_u → 1`. Conjugating s by an element of the geometric kernel conjugates s|G_u by its image, so restriction descends to a map `res_u: Sect(X/K) → Sect(X_{K_u}/K_u)` of the section classes of AnabelianGeometryAndNonabelianChabauty §7.1. A second embedding ι' changes res_u by the canonical base-point bijection of AnabelianGeometryAndNonabelianChabauty §7.1, and `res_u ∘ κ_X = κ_{X_{K_u}} ∘ (X(K) → X(K_u))` for the section maps κ of AnabelianGeometryAndNonabelianChabauty §7.1.

K is a number field, so the characteristic is zero and the base-extension theorem InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 applies to every connected finite-type K-scheme. X is geometrically connected, so the fundamental exact sequences over K and over K_u are exact (IG.1). At a complex place G_u is trivial and res_u has a one-point target; at a real place G_u has order two.

(bs, Definition 1.1, p. 1; bs line 4; hs, Introduction, p. 2; hs line 36).

A proof can proceed as follows. Compare the arithmetic exact sequences using the isomorphism of geometric kernels from characteristic-zero base change. The induced map to the fibre product is an isomorphism of profinite extensions. Pull back a splitting and descend through geometric conjugacy; functoriality of π₁ gives compatibility with the point-section maps.

The API includes the following facts.

- `res_u: Sect(X/K) → Sect(X_{K_u}/K_u)`, defined from a chosen embedding ι: K̄ → K̄_u.
- res_u[s] = [s|G_u], where s|G_u(σ) is the image of (s(ι^*σ), σ) under `π₁^ét(X) ×_{G_K} G_u ≅ π₁^ét(X_{K_u})`.
- `π₁^ét(X_{K_u}, x̄_u) ≅ π₁^ét(X, x̄) ×_{G_K} G_u` as extensions of G_u, with the IG.1 isomorphism on geometric kernels.
- `res_u(κ_X(x)) = κ_{X_{K_u}}(x)` for every x ∈ X(K), viewing x as a K_u-point.
- For a K-morphism f: X → X', res_u ∘ the map on section classes induced by f = the map on section classes induced by `f_{K_u}` ∘ res_u.
- For two embeddings ι, ι' the two maps res_u differ by the base-point bijection of AnabelianGeometryAndNonabelianChabauty §7.1; their images are identified.

**Checks.**

- For X = Spec K, Sect(X/K) and `Sect(X_{K_u}/K_u)` are one-point sets and res_u is the unique map between them.
- For X = `G_{m,K}` with the reference sections of the point 1, res_u corresponds under the nonabelian H¹ identification to restriction H¹(K, Ẑ(1)) → H¹(K_u, Ẑ(1)); on Kummer classes it sends the class of a ∈ K^× to the class of a ∈ K_u^×.
- At a complex place u, G_u is trivial, `Sect(X_{K_u}/K_u)` is a single point and res_u is constant.
- In the split extension Ẑ(1) ⋊ C₂ with the generator c acting by inversion, the sections sending c to (2,c) and (−2,c) are distinct continuous homomorphisms but are conjugate by the geometric-kernel element (−2,1). Thus raw sections depend on the chosen transport even when their section classes agree; this is the real G_m local model.

*Needs:* TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; Mathlib `Field.absoluteGaloisGroup`; Mathlib `ContinuousMonoidHom`.

### 0.2 Injectivity of the section map over p-adic fields

Let L be a finite extension of ℚₚ and X a geometrically connected L-variety that admits an immersion into an abelian variety over L (for instance a smooth projective geometrically connected curve of genus g ≥ 1 with X(L) ≠ ∅, through its Abel–Jacobi map). Then the section map κ_X: X(L) → Sect(X/L) is injective. In particular, for a smooth projective geometrically connected curve Y of genus ≥ 1 over a number field K, a finite place u of K and a class c ∈ `Sect(Y_{K_u}/K_u)`, at most one y ∈ Y(K_u) has κ(y) = c.

L is a finite extension of ℚₚ (a local field of characteristic zero); the statement fails over ℝ, where the torus A(ℝ)⁰ is divisible and κ only sees the connected component of a real point.

(stix08, Appendix B, Theorem 45 and Remark 46 with the proof on p. 23, pp. 22–23; stix08 lines 1109–1122; bs, Definition 1.1, p. 1; bs line 4).

A proof can proceed as follows. For an abelian variety A/F, properness makes A(F) compact and its p-adic topology is totally disconnected and Hausdorff. It is therefore profinite. If a belongs to nA(F) for every n≥1, its image in each finite quotient vanishes by taking n equal to that quotient’s exponent. Hausdorffness gives a=0. Apply the field-general injectivity criterion; for a curve with a rational point use its Abel–Jacobi immersion, and handle an empty point set directly.

**Checks.**

- For an elliptic curve E over ℚₚ with full 2-torsion, the four 2-torsion points have pairwise distinct section classes.
- Over ℝ the analogous map is not injective: two distinct real points on the same connected component of E(ℝ) give the same section class.

*Needs:* TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion.

### 0.3 Selmer sections and the localisation maps

Let K be a number field and X a geometrically connected separated K-scheme of finite type. A section class c ∈ Sect(X/K) is Selmer if, for every place u of K, archimedean places included, res_u(c) lies in the image of the local section map `κ_{X_{K_u}}: X(K_u) → Sect(X_{K_u}/K_u)` (§0.1, AnabelianGeometryAndNonabelianChabauty §7.1). The Selmer sections form the subset Sec^Sel(X/K) ⊆ Sect(X/K). When `κ_{X_{K_u}}` is injective at a finite place u (§0.2: for instance X a smooth projective geometrically connected curve of genus ≥ 1), the localisation map loc_u: Sec^Sel(X/K) → X(K_u) sends c to the unique y_u ∈ X(K_u) with κ(y_u) = res_u(c). After the canonical transport of base points, the definition and loc_u do not depend on the embeddings chosen at the places.

X is geometrically connected, so Sect(X/K) is defined (AnabelianGeometryAndNonabelianChabauty §7.1). The Selmer condition is imposed at every place, the real and complex places included; at a complex place it is automatic when X(ℂ) ≠ ∅. loc_u is defined only at finite places, where the local section map is injective; no real-point localisation is defined here. At a real place the Selmer condition asks only that the restricted class belong to the image of X(K_u); for general X it need not determine a connected component.

(bs, Definition 1.1, p. 1; bs line 4; bs, §1, Theorem A and the paragraph before it, p. 1; bs line 4).

A proof can proceed as follows. Impose local membership in the point-section image at every place. At a finite place with injective local section map, choose the unique point realising the restricted class. Compatibility of restriction and point-section maps gives rational-point inclusion, morphism functoriality and finite-extension restriction.

The API includes the following facts.

- The subset Sec^Sel(X/K) of Sect(X/K) cut out by the Selmer condition at every place.
- loc_u: Sec^Sel(X/K) → X(K_u) for a finite place u, when `κ_{X_{K_u}}` is injective.
- `κ_{X_{K_u}}(loc_u c) = res_u(c)`, and loc_u c is the only point with this property.
- κ_X(x) ∈ Sec^Sel(X/K) for x ∈ X(K), with loc_u(κ_X x) = x in X(K_u).
- A K-morphism f: X → X′ maps Selmer sections to Selmer sections. At a finite place u where both local section maps are injective, loc_u ∘ map f = f ∘ loc_u.
- For a finite extension L/K, restriction of sections to G_L maps Sec^Sel(X/K) into Sec^Sel(X_L/L). For finite w | v, when the local section maps over both K_v and L_w are injective, loc_w(c|G_L) is the image of loc_v(c) in X(L_w).
- If X(K_u) = ∅ for some place u then Sec^Sel(X/K) = ∅.
- If SectionConjecture(Y/K) holds (AnabelianGeometryAndNonabelianChabauty §7.1), then Sec^Sel(Y/K) = κ_Y(Y(K)).

**Checks.**

- For X = Spec K, Sec^Sel(X/K) = Sect(X/K) is one point and each loc_u takes the value Spec K_u.
- For Y of genus ≥ 1 and y ∈ Y(K), loc_u(κ_Y(y)) is the image of y in Y(K_u) at every finite place u.
- If Y(ℝ) = ∅ for a real place of K then Sec^Sel(Y/K) = ∅, even when Y(K_u) ≠ ∅ for every finite u: a definition that imposes the condition only at finite places is wrong.
- For an elliptic curve E/Q with full rational 2-torsion and any prime p, the four global 2-torsion points define Selmer classes whose localisations in E(ℚₚ) are pairwise distinct, by local injectivity.
- For the smooth affine quadric z²−x²−y²=1 over ℚ, the real points (0,0,1) and (0,0,−1) lie in two different connected components but give the same real section class. Its complex locus retracts onto S², so its geometric étale fundamental group is trivial by ComplexComparisonPartII §C6.2. Both points satisfy the image condition; that class selects neither component.
- Under the section conjecture for Y/K, Sec^Sel(Y/K) = Sect(Y/K) and κ_Y identifies it with Y(K).

*Needs:* TauCetiRoadmap.ComplexComparisonPartII §C6.2 for the quadric Check; §0.1; §0.2; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion.

### 0.4 Modified adelic points and the finite descent locus

Let K be a number field. For every proper finite-type K-scheme T, define the modified adelic points T(A_K)_• as the product of T(K_u) over finite places u and π₀(T(K_u)) over archimedean places u, where π₀ is the quotient `ConnectedComponents` in the analytic topology. Properness identifies T(A_K) with ∏_u T(K_u) (HeightsRationalPointsAndObstructions §§2.4, 2.11). The projection T(A_K) → T(A_K)_• is the identity at finite places and the component quotient at infinity; it is surjective and natural for every K-morphism f: T′ → T, with f_•: T′(A_K)_• → T(A_K)_• and f_•(P_•) = (f(P))_•. No smoothness, reducedness or connectedness is required for this carrier. For smooth projective geometrically connected X/K and a torsor f: Z → X under a finite étale K-group scheme G, a point P ∈ X(A_K)_• survives (Z, G) if it is the image of a point of Z^ξ(A_K)_• for some twist ξ ∈ H¹(K, G). The finite descent locus `X(A_K)_•^{f-cov}` is the set of P ∈ X(A_K)_• surviving every such torsor. It is the image of the finite étale descent set `X(A_K)^{ét}` of HeightsRationalPointsAndObstructions §3.5 under the projection, it contains the image of X(K), and Stoll's Main Conjecture 9.1 (every smooth projective curve is 'very good': the abelian finite descent locus is the closure of X(K)) implies that it equals the closure of the image of X(K) for curves; that prediction is a named proposition and is never assumed.

The carrier is defined for every proper finite-type K-scheme. The descent assertions below assume X smooth projective and geometrically connected; each finite étale torsor Z and every twist Z^ξ is proper of finite type, including when disconnected. Only torsors under finite étale group schemes enter; torsors under connected groups give other descent sets.

(stoll, §2, p. 4; stoll lines 118 and 131; stoll, Definition 5.2 and Definition 5.4(1), pp. 14 and 16; stoll line 520; stoll, Lemma 5.8(1), p. 19, and Conjecture 9.1, p. 38; stoll line 725; bs, §1, p. 2; bs line 55).

A proof can proceed as follows. A K-morphism maps connected components of archimedean point sets into connected components, which gives f_•; surjectivity of the projection is componentwise. Local evaluation of a finite étale torsor is constant on each archimedean connected component, so survival of its twists depends only on this quotient. The finite étale descent intersection therefore descends to the modified product. Functoriality follows by pulling back every torsor.

The API includes the following facts.

- For every proper finite-type T/K, T(A_K)_• and the surjective projection T(A_K) → T(A_K)_•, natural for every K-morphism between such schemes: (f(P))_• = f_•(P_•).
- `X(A_K)_•^{f-cov}`: the points surviving every torsor under a finite étale group scheme.
- `X(A_K)_•^{f-cov}` is the image of the finite étale descent set `X(A_K)^{ét}` of HeightsRationalPointsAndObstructions §3.5.
- The image of X(K) lies in `X(A_K)_•^{f-cov}`.
- A morphism X' → X maps `X'(A_K)_•^{f-cov}` into `X(A_K)_•^{f-cov}` (Stoll, Proposition 5.9).
- The named proposition (Stoll, Conjecture 9.1) that every smooth projective geometrically connected curve is very good, so that `X(A_K)_•^{f-ab}`, and hence `X(A_K)_•^{f-cov}`, is the closure of the image of X(K); it is a hypothesis wherever used, never a theorem.

**Checks.**

- For X = P¹_K, `X(A_K)_•^{f-cov} = X(A_K)_•`.
- For X = Spec K, X(A_K)_• is a single point and lies in the locus. For its trivial C₂-torsor Z = Spec K ⊔ Spec K, every finite local factor and every archimedean component factor has two elements; the map Z(A_K)_• → X(A_K)_• is surjective.
- The empty proper scheme has empty ordinary and modified adelic sets; its projection is the surjection ∅ → ∅. For T = Spec K[ε]/(ε²), every local-point set has one element, so both adelic carriers are singletons, as for its reduction.
- For an elliptic curve over ℚ with two real components, the archimedean factor has exactly two elements. Distinct points in one real component have the same image; retaining all real points produces a different carrier.
- For x ∈ X(K), the image of the diagonal point (x)_u lies in `X(A_K)_•^{f-cov}`.
- For a smooth projective curve of genus ≥ 2, the projection of the locus to X(K_v) at a finite place v is the set studied in Betts–Stix, Theorem B.

*Needs:* TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11, 2.11a, 3.1–3.5, adelic points, local topology and finite étale torsor descent; Mathlib `ConnectedComponents`.

### 0.5 Harari–Stix: finite descent and Galois sections

Let K be a number field and X a geometrically connected separated K-scheme of finite type. (a) An adelic point (P_u)_u ∈ X(A_K) lies in the finite étale descent set `X(A_K)^{ét}` (HeightsRationalPointsAndObstructions §3.5) if and only if there is a section class c ∈ Sect(X/K) with res_u(c) = `κ_{X_{K_u}}(P_u)` for every place u of K. (b) Consequently, if X is a smooth projective geometrically connected curve of genus ≥ 1 and v is a finite place, the projection of `X(A_K)_•^{f-cov}` (§0.4) to X(K_v) equals loc_v(Sec^Sel(X/K)).

In (a), X is geometrically connected, separated and of finite type over a number field; every place of K, archimedean ones included, is used (S=∅ and U trivial in Harari–Stix). Properness and smoothness are not required. In (b), loc_v is defined because the local section map is injective at finite places (§0.2).

(hs, Theorem 2.1 and its proof, Remarks (1) and (4), pp. 11–12; hs lines 391 and 416; hs, §1, Propositions 1.1–1.2 and Corollary 1.7, pp. 5–10; hs line 151; bs, §1, p. 2; bs line 55).

A proof can proceed as follows. Apply the number-field form of Harari–Stix with all places. Its density hypothesis follows from Chebotarev, and geometric π₁ is topologically finitely generated for a characteristic-zero separated finite-type scheme by the finite CW comparison and Riemann existence of ComplexComparisonPartII §§C6.0, C6.2. Finite quotients and inverse-limit compactness turn compatible local sections into a global section; conversely one global section supplies the twisting classes for every finite cover. Local injectivity then identifies the finite-place projected points.

**Checks.**

- Under (b), Theorem A (finiteness of loc_v(Sec^Sel)) is equivalent to the finiteness of the projection of the finite descent locus to X(K_v): this is Betts–Stix, Theorem B.
- For X(K) ≠ ∅ the diagonal image of a rational point corresponds to its own section in (a).
- For `X=G_{m,K}`, the diagonal unit 1 survives every finite étale torsor via its fibre class and gives its point section. This non-proper X lies in (a): Harari–Stix Theorem 2.1 (i)⇔(iii) applies with U trivial and S=∅. The finite-place localisation equality in (b) still requires the stated proper curve and local-injectivity hypotheses.

*Needs:* TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; §0.1; §0.3; §0.4; TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11a, 3.1–3.5, adelic points and finite étale torsor descent; TauCetiRoadmap.Chebotarev Layer 10; TauCetiRoadmap.ComplexComparisonPartII §§C6.0, C6.2.

### Examples

For X=Spec K restriction is the unique map between singleton section sets. For E:y²=x³−x over ℚ the four rational 2-torsion points remain distinct in E(ℚₚ) at every p, including 2. On a real connected component their section classes coincide. In the split inversion extension, conjugation by (−2,1) sends (2,c) to (−2,c), although the two raw sections are unequal.

### Dependencies

TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; Mathlib `Field.absoluteGaloisGroup`; Mathlib `ContinuousMonoidHom`; TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11, 2.11a, 3.1–3.5, adelic points, local topology and finite étale torsor descent; Mathlib `ConnectedComponents`; TauCetiRoadmap.Chebotarev Layer 10. Internal dependencies are specified in each subsection.

## Layer 1: Symplectic pairs attached to Galois sections

### 1.1 Symplectic modules and symplectic pairs

Let C be one of the ℚₚ-linear tensor categories below, with its underlying-module realisations: the continuous ℚₚ-representations of a profinite group G, the filtered discrete (φ, N, G_v)-modules of §2.1, or the isogeny category of ℤₚ-local systems on a connected scheme (InverseGaloisAndArithmeticFundamentalGroups §IG.0.3), called ℚₚ-local systems below. An algebra in C is a commutative unital algebra object A; for G-representations, a finite-dimensional commutative ℚₚ-algebra with a continuous G-action by algebra automorphisms. A symplectic A-module in C is a triple (V, L, ω) with V an A-module in C that is finite locally free over A, L an A-module in C free of rank one over A, and ω: ∧²_A V → L a morphism in C that is A-linear and perfect (it induces V ≅ Hom_A(V, L)). A symplectic pair is (A, V) with V a symplectic A-module (L and ω understood); a morphism (A, V) → (A′, V′) is a triple of morphisms f_A: A → A′ of algebras, f_V: V → V′ and f_L: L → L′ in C, compatible with the module structures (f_V(av) = f_A(a)f_V(v), and likewise for f_L) and with the pairings (f_L ∘ ω = ω′ ∘ ∧²f_V). SP(C) is the category of symplectic pairs and π₀SP(C) its set of isomorphism classes. For G-representations, `Σ_A := Hom_{ℚₚ-alg}(A, ℚₚ)` is a finite set with a continuous right G-action; for ψ ∈ Σ_A with stabiliser G_ψ, `V_ψ := ℚₚ ⊗_{A,ψ} V` is a symplectic representation of G_ψ with similitude line L_ψ.

For G-representations, A is a finite-dimensional commutative ℚₚ-algebra, possibly non-reduced or non-split, and Σ_A consists of its ℚₚ-points only, not its ℚ̄ₚ-points. In MF(φ,N,G_v), the corresponding finite algebras are over the realisation fields ℚₚⁿʳ and K_v. V is finite locally free over A, of constant rank 2d when A is connected; L is free of rank one. The definition is internal to C; finiteness, local freeness and the rank of the line are checked on its underlying coefficient modules. A ℚₚ-valued neutral fibre functor is not assumed for MF(φ, N, G_v): its de Rham realisation is K_v-valued and its potentially semistable realisation is ℚₚⁿʳ-valued.

(bs, Definitions 4.3–4.4 and Example 4.5, pp. 33–34; bs line 1699; bs, §6.1, pp. 45–46; bs line 2290; bs, §2.1, definition before Definition 2.3, p. 7; bs line 322).

A proof can proceed as follows. Bundle algebra, finite locally free module, rank-one line and perfect alternating pairing in each realisation category. Tensor functors preserving these properties induce functors on pairs. For split A, primitive idempotents decompose the module into its fibres; the group action permutes them, and each transitive orbit is an induced representation. This decomposition uses splitness and makes no assertion that a general nonreduced A is detected by Σ_A.

The API includes the following facts.

- The triple (V, L, ω) over an algebra A in C, with V finite locally free, L free of rank one and ω: ∧²_A V → L perfect.
- The pair (A, V) with V a symplectic A-module; morphisms compatible with algebra, module, line and pairing.
- `Σ_A = Hom_{ℚₚ-alg}(A, ℚₚ)` with its right G-action, finite since A is artinian.
- `V_ψ = ℚₚ ⊗_{A,ψ} V`, a symplectic representation of the stabiliser G_ψ.
- For split A, `V ≅ ∏_{ψ∈Σ_A} V_ψ`, and on a transitive orbit `V ≅ Ind_{G_{ψ₀}}^{G} V_{ψ₀}`.
- Restriction of a pair of G-representations to a closed subgroup H gives a pair of H-representations.
- A tensor functor compatible with the underlying-module realisations and preserving finite locally free modules and rank-one lines induces SP(C) → SP(C′), with identity and composition laws.
- A submodule W ≤ V with ω(W, W) = 0.
- An isotropic W equal to its own orthogonal; over a field with V of dimension 2d, an isotropic subspace of dimension d.
- π₀SP(C), the set of isomorphism classes, the target of the maps in §5.3 (Betts–Stix Proposition 4.11).
- Forgetting the G-action, a symplectic module over a finite étale algebra over a field is the datum of MordellLawrenceVenkatesh §§3.1–3.19, with gap:variable-rank-abelian-by-finite for locally constant rank, and the model-free period-map contract, whose Lagrangian submodules form the period domain.
- Two morphisms of pairs are equal if their algebra, module and line components are equal; a morphism is an isomorphism exactly when all three components are isomorphisms.

**Checks.**

- For an elliptic curve E/K, (ℚₚ, `H¹_ét(E_{K̄}, ℚₚ)`) with the Weil pairing to ℚₚ(−1) is a symplectic pair of rank 2 over A = ℚₚ; Σ_A is a single point.
- For any A, (A, 0) with L = A is a symplectic pair of rank 0, and its fibre V_ψ is zero for every ψ.
- For A = ℚₚ × ℚₚ with G acting through a quotient Z/2 by swapping the factors, a pair (A, V) is the same as a symplectic representation W of the index-two subgroup H together with V = Ind_H^G W; Σ_A has two points exchanged by G.
- For A = `Q_{p²}` with trivial action, Σ_A = `Hom_{ℚₚ-alg}(Q_{p²}, ℚₚ)` = ∅ although A is étale of dimension 2: Σ_A counts ℚₚ-points, not geometric points.
- On V = ℚₚ² with A = ℚₚ, the alternating form ω = 0 is not perfect, so (ℚₚ, V) with ω = 0 is not a symplectic pair.
- For A = ℚₚ, V = 0 and L = ℚₚ² the unique pairing is alternating and induces 0 ≅ Hom_A(0,L), but it is not a symplectic module because L has rank two. Perfectness alone does not impose the rank-one condition.
- For A=ℚₚ[ε]/(ε²), there is exactly one ℚₚ-point, ε↦0, while dim A=2; the standard rank-two alternating module over A is perfect. Nilpotents cannot be detected by counting Σ.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; Mathlib `LinearMap.IsAlt`; Mathlib `LinearMap.Nondegenerate`; Mathlib `Matrix.symplecticGroup`.

### 1.2 The symplectic pair of a fibre

Let X → Y′ → Y be an abelian-by-finite family (MordellLawrenceVenkatesh §§2.1–2.4, gap:variable-rank-abelian-by-finite and the model-free polarised-fibre contract) over a scheme Y of characteristic zero with polarisation λ, F a field and y ∈ Y(F). Then `H^{≤1}_ét(X_{y,F̄}, ℚₚ)` := (`H⁰_ét(X_{y,F̄}, ℚₚ)`, `H¹_ét(X_{y,F̄}, ℚₚ)`), with the pairing ω_λ^ét: ∧² over H⁰_ét of H¹_ét → H⁰_ét(−1) of the polarisation, is a symplectic pair of continuous G_F-representations (§1.1). Its algebra `H⁰_ét(X_{y,F̄}, ℚₚ)` = `H⁰_ét(Y′_{y,F̄}, ℚₚ)` = `∏_{Y′_y(F̄)} ℚₚ` is split, with Σ = Y′_y(F̄) as a G_F-set, and its fibre at the point ψ given by y′ ∈ Y′_y(F̄) is H¹_ét of the abelian variety `X_{y′}` over F(y′). Isomorphisms of families over Y induce isomorphisms of pairs, and the construction commutes with field extension F ⊆ F′.

Allow locally constant relative dimension on Y′ via gap:variable-rank-abelian-by-finite: at a geometric point y′ of dimension d(y′), H¹_ét has rank 2d(y′) over its coefficient factor. For constant dimension d this is rank 2d over H⁰_ét; constant d>0 is imposed only in the trichotomy and its applications. char F = 0, so étale cohomology with ℚₚ coefficients has the abelian cohomology properties of MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract and the decomposition over Y′_y(F̄) holds.

(bs, Definition 4.1 and §4.1.1, pp. 32–33; bs line 1666; bs, Example 4.5, (4.1) and Lemma 4.2, pp. 32–34; bs line 1635; bs, Remark 6.6, p. 46; bs line 2337).

A proof can proceed as follows. Apply the abelian cohomology and polarised-fibre contracts to each closed component of Y′_y and assemble by finite induction. The coefficient algebra is the ℚₚ-valued functions on its geometric points. The polarisation pairing is H⁰-linear, perfect and equivariant; étale base change gives field functoriality.

The API includes the following facts.

- `H^{≤1}_ét(X_{y,F̄}, ℚₚ)` as a symplectic pair of G_F-representations.
- Σ of its algebra is Y′_y(F̄) as a G_F-set.
- At the point y′ ∈ Y′_y(F̄) the fibre V_ψ is `H¹_ét(X_{y′, F̄}, ℚₚ)` with the polarisation pairing of `X_{y′}`.
- For F ⊆ F′, the pair of y ∈ Y(F′) restricts the pair of y ∈ Y(F) along `G_{F′}` → G_F.
- The algebra is split: isomorphic to ℚₚ^n with n = #Y′_y(F̄).

**Checks.**

- When Y′ = Y the pair is (ℚₚ, `H¹_ét(X_{ȳ}, ℚₚ)`) with Σ a point.
- For the Legendre family over Y = P¹ ∖ {0, 1, ∞} and y ∈ Y(Q), the pair is (ℚₚ, H¹_ét(E_y, ℚₚ)) of rank 2 with the Weil pairing.
- Split finite base: for Y = Spec F, Y′ = Spec(F × F) and X = E ⊔ E with E/F an elliptic curve, H⁰_ét = ℚₚ² with trivial G_F-action, `dim (H⁰_ét)^{G_F}` = 2, dim H¹_ét = 4, and Σ consists of two G_F-fixed points.
- Non-split finite base: for a quadratic field L/F, an elliptic curve E′/L and X = E′ over Y′ = Spec L, viewed over Y = Spec F, H⁰_ét is again ℚₚ² but G_F exchanges its two primitive idempotents, so `dim (H⁰_ét)^{G_F}` = 1; dim H¹_ét = 4 and H¹_ét = `Ind_{G_L}^{G_F} H¹_ét(E′_{F̄}, ℚₚ)`. The two pairs have equal ranks but non-isomorphic algebras, whether L/F is ramified or unramified and including p = 2; a construction recording only the ranks of H⁰ and H¹ cannot separate them.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §1.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16.

### 1.3 The relative symplectic pair `R^{≤1}π_*ℚₚ`

Let π: X → Y′ → Y be an abelian-by-finite family over a normal connected nonempty scheme Y of characteristic zero, with polarisation λ and locally constant relative dimension on Y′ as in gap:variable-rank-abelian-by-finite. Then R^•π_*ℚₚ ≅ ∧^• over π_*ℚₚ of R¹π_*ℚₚ as ℚₚ-local systems on Y_ét. The relative Chern class c₁^ét(λ)/Y := ½ c₁^ét((1, λ)^*P)/Y ∈ H⁰(Y, R²π_*ℚₚ(1)) is defined as the image of the class of a line bundle under H¹(X, G_m) → H⁰(Y, R¹π_*G_m) → H⁰(Y, R²π_*ℤₚ(1)) → H⁰(Y, R²π_*ℚₚ(1)) (Leray, then the limit of Kummer boundaries). It induces a perfect pairing ω_λ: ∧² over π_*ℚₚ of R¹π_*ℚₚ → π_*ℚₚ(−1), so `R^{≤1}π_*ℚₚ` := (π_*ℚₚ, R¹π_*ℚₚ) is a symplectic pair of ℚₚ-local systems on Y_ét. Its fibre at a geometric point ȳ is the pair `H^{≤1}_ét(X_ȳ, ℚₚ)` of §1.2, compatibly with the Galois action when ȳ lies over a point with values in a field.

π smooth proper, so by smooth proper base change the systems (R^iπ_*ℤ/pⁿ)ₙ are compatible finite locally constant systems of finite ℤ/pⁿ-modules compatible with base change; modulo torsion they give a lisse ℤₚ-lattice, and R^iπ_*ℚₚ is its rationalisation. It therefore lies in the isogeny category of InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 and, Y being connected with a geometric point, is a continuous ℚₚ-representation of π₁^ét(Y): EtaleCohomologyFoundations §F.0.2 supplies finite-lisse monodromy on every connected nonempty scheme, so the levelwise action and its inverse limit require no local Noetherianity; the comparison with arbitrary rational local systems on a normal Noetherian base is not needed. A rational line with monodromy p around a nodal loop has no stable lattice and is not of this form.

(bs, §7.1, p. 55; bs line 2817).

A proof can proceed as follows. The exterior-algebra map is an isomorphism on every geometric fibre by abelian cohomology. Leray followed by compatible Kummer boundaries defines the relative first class. Use half the class of the pullback of the Poincaré bundle along (1,λ) to obtain the polarisation class. Its pairing is perfect fibrewise and hence as a local-system map; smooth proper base change identifies every fibre.

The API includes the following facts.

- (π_*ℚₚ, R¹π_*ℚₚ) with ω_λ, a symplectic pair of ℚₚ-local systems on Y_ét.
- c₁^ét(L)/Y ∈ H⁰(Y, R²π_*ℚₚ(1)) for a line bundle L on X, from Leray and Kummer.
- The fibre of c₁^ét(L)/Y at a geometric point ȳ is c₁^ét(L|X_ȳ).
- The fibre at ȳ is `H^{≤1}_ét(X_ȳ, ℚₚ)`, Galois-equivariantly for points over fields.
- For f: Y₁ → Y, the pair of the pulled-back family is the pullback of the pair.

**Checks.**

- For a constant elliptic family E×P¹ → P¹, geometric monodromy is trivial in degrees 0 and 1, whose ranks are 1 and 2.
- For the Legendre family y²=x(x−1)(x−λ) on P¹ ∖ {0,1,∞}, H⁰ has rank 1 and H¹ rank 2. Its geometric monodromy is Zariski dense in SL₂, of dimension 3, whereas a constant rank-two system has trivial geometric monodromy (MordellLawrenceVenkatesh §3.11).
- For E×E → E → E, with the first map pr₂ and the second [2], and E:y²=x³−x, geometric monodromy on H⁰ is the regular permutation action of E[2] on four elements. Its invariant dimension is 1, whereas a constant rank-four algebra has invariant dimension 4; H¹ has total rank 8.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh §3.11 for the monodromy Check; TauCetiRoadmap.EtaleCohomologyFoundations §F.0.2; TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §1.2; §1.1; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract.

### 1.4 The symplectic pair attached to a Galois section

Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family and η̄ a geometric point of `Y_{K̄}`. Let (A, V) be the symplectic pair of continuous π₁^ét(Y, η̄)-representations corresponding to `R^{≤1}π_*ℚₚ` (§1.3, InverseGaloisAndArithmeticFundamentalGroups §IG.0). For a continuous section s: G_K → π₁^ét(Y, η̄), (A_s, V_s) is (A, V) with G_K acting through s: a symplectic pair of G_K-representations. Conjugating s by γ ∈ `π₁^ét(Y_{K̄}, η̄)` gives an isomorphic pair (the action of γ is a G_K-equivariant isomorphism), and changing η̄ along an étale path gives an isomorphic pair; so the isomorphism class [A_s, V_s] ∈ `π₀SP(Rep_{ℚₚ}(G_K))` depends only on the class of s in Sect(Y/K).

Y geometrically connected, so the fundamental exact sequence is exact and sections are defined (AnabelianGeometryAndNonabelianChabauty §7.1). The family is fixed; its pair is a pair of π₁^ét(Y)-representations.

(bs, §7.2, p. 56; bs line 2865).

A proof can proceed as follows. Pull the fixed fundamental-group representations back along the continuous splitting. Geometric conjugation acts simultaneously on the algebra, module and line and intertwines all three pulled-back actions. Thus the pair’s isomorphism class descends to a section class, compatibly with change of geometric base point.

The API includes the following facts.

- (A_s, V_s): the pair of `R^{≤1}π_*ℚₚ` restricted along a section s.
- For s′ = γsγ⁻¹ with γ in the geometric kernel, the action of γ is an isomorphism (A_s, V_s) ≅ `(A_{s′}, V_{s′})`.
- An étale path between base points identifies the pairs of corresponding sections.
- The induced map Sect(Y/K) → `π₀SP(Rep_{ℚₚ}(G_K))`.
- For y ∈ Y(K), the pair of s_y is `H^{≤1}_ét(X_{y,K̄}, ℚₚ)`.

**Checks.**

- For the constant family X = Y × A₀ → Y (Y′ = Y, A₀ an abelian variety over K) the pair of every section is (ℚₚ, H¹_ét(A₀,K̄, ℚₚ)), independent of s.
- Let E/ℚ be y² = x³ − x and X = E × E → Y′ = E → Y = E, the first projection followed by multiplication by 2, polarised on the second factor. At the section of the point 0, the finite-base fibre E[2] consists of four rational points, so A_s = ℚₚ⁴ with trivial G_ℚ-action, `dim A_s^{G_ℚ}` = 4 and dim V_s = 8.
- In the same family, at the section of P = (0, 0) the finite-base fibre consists of the points with 2Q = P. The doubling formula x(2Q) = (x(Q)² + 1)²/(4x(Q)(x(Q)² − 1)) vanishes exactly at x(Q) = ±i, giving (i, ±(1 − i)) and (−i, ±(1 + i)), whose y-coordinates square to x³ − x. Complex conjugation exchanges them in two pairs, so A_s is four-dimensional with `dim A_s^{G_ℚ}` = 2 and dim V_s = 8. The pairs at 0 and P are not isomorphic: a construction that forgets the Galois action on A_s would identify them.
- For conjugate sections s ≠ γsγ⁻¹ the two restricted actions on the same underlying module are in general different homomorphisms G_K → GL(V); only their isomorphism classes agree.

*Needs:* §1.3; §1.1; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change.

### 1.5 Local systems restricted along sections at local points

Let K be a number field, Y/K a geometrically connected variety, 𝕃 an object of the isogeny category of ℤₚ-local systems on Y (InverseGaloisAndArithmeticFundamentalGroups §IG.0.3) with π₁^ét(Y, η̄)-representation ρ, u a place of K and y_u ∈ Y(K_u). If c ∈ Sect(Y/K) satisfies res_u(c) = `κ_{Y_{K_u}}(y_u)`, then for any representative s of c the G_u-representation (ρ ∘ s)|G_u (restriction along ι^*: G_u → G_K) is isomorphic to the fibre `𝕃_{ȳ_u}` at the geometric point over y_u with its G_u-action. The isomorphism is compatible with tensor products, duals and morphisms of local systems; in particular it carries algebra, module and pairing structures to the same structures.

The place u may be archimedean; the statement uses only res_u(c) = κ(y_u). The isomorphism depends on the choice of a path from η̄ to ȳ_u, which changes it by an inner automorphism compatible with all structures.

(bs, Remark 1.5, pp. 3–4; bs line 103; bs, Proposition 7.2 and proof, p. 56; bs line 2865).

A proof can proceed as follows. Choose a path identifying the reference fibre functor with that at the local point. Equality of the two section classes makes the restricted representation conjugate to the fibre representation. The same path supplies the isomorphism for all local systems, so it respects tensor products, duals and pairing maps.

**Checks.**

- For a global rational point y and its section s_y, the same fibre-functor argument gives (ρ ∘ s_y) ≅ 𝕃_ȳ as G_K-representations.
- The same argument, applied to a finite étale cover Z → Y (a local system of finite sets, by functoriality), gives the G_u-set of geometric points of the fibre `Z_{y_u}`.

*Needs:* §0.1; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction.

### 1.6 The pair of a section interpolates its local points

Let K, Y and X → Y′ → Y be as in §1.4, s a section and u a place of K. If res_u[s] = κ(y_u) for y_u ∈ Y(K_u), then (A_s|G_u, V_s|G_u) ≅ `H^{≤1}_ét(X_{y_u,K̄_u}, ℚₚ)` as symplectic pairs of G_u-representations.

As in §1.5; the pairing structure is carried by the isomorphism because ω_λ is a morphism of local systems.

(bs, Proposition 7.2, p. 56; bs line 2865).

A proof can proceed as follows. Apply the local-system restriction theorem to the relative algebra, module and line together. Their pairing is a local-system morphism, so the resulting isomorphism is an isomorphism of symplectic pairs at every specified local point.

**Checks.**

- For a Selmer section s, the pair (A_s, V_s) has the local restriction `H^{≤1}_ét(X_{loc_u(s)})` at every finite place u.

*Needs:* §1.5; §1.3; §1.4.

### 1.7 The adelic Lawrence–Venkatesh locus

Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family and p a prime. The adelic Lawrence–Venkatesh locus Y(A_K)^LV_X ⊆ Y(A_K) = ∏_u Y(K_u) is the set of adelic points (y_u)_u for which some symplectic pair (A, V) of continuous ℚₚ-representations of G_K satisfies `H^{≤1}_ét(X_{y_u,K̄_u}, ℚₚ)` ≅ (A|G_u, V|G_u) as symplectic pairs of G_u-representations for every place u; such (A, V) interpolates (y_u). For a p-adic place v, Y(K_v)^LV_X is the projection of Y(A_K)^LV_X to Y(K_v).

All places of K are used, the archimedean ones included; restriction to G_u is through the embedding fixed at u (ArithmeticGaloisRepresentations §2.1), and the condition does not depend on it.

(bs, Definition 6.1, p. 43; bs line 2201).

A proof can proceed as follows. Quantify one global pair before quantifying the places, and then project the resulting adelic subset to a finite place. A rational point supplies its global fibre pair. An isomorphism on degree-zero and degree-one cohomology preserves the interpolation relation.

The API includes the following facts.

- Y(A_K)^LV_X ⊆ Y(A_K): the adelic points interpolated by a global symplectic pair.
- The relation 'the pair (A, V) interpolates (y_u)_u'.
- Y(K_v)^LV_X, the projection of the adelic locus to a p-adic place v.
- The diagonal image of Y(K) lies in Y(A_K)^LV_X.
- If X₁ → X is a morphism of abelian-by-finite families over Y inducing an isomorphism on `H^{≤1}`, the loci agree.

**Checks.**

- For y ∈ Y(K), (y)_u lies in Y(A_K)^LV_X, interpolated by `H^{≤1}_ét(X_{y,K̄}, ℚₚ)`.
- For the constant family Y × A₀ → Y every adelic point lies in the locus, interpolated by (ℚₚ, H¹_ét(A₀,K̄, ℚₚ)): a constant family gives no obstruction.
- Assume Y(A_K) is nonempty; its v-component then gives a nonempty p-adic open curve neighbourhood, hence Y(K_v) is infinite. For a Kodaira–Parshin family X_q with q chosen as in §8.5 at a self-conjugate finite v, the projection of the adelic Lawrence–Venkatesh locus is finite, whereas Y(K_v) is infinite. Fixing points at all other places and varying y_v gives adelic points with geometric fibre pairs, de Rham with jumps 0,1 at places above p, which cannot all admit one globally interpolating pair.
- If Y(A_K) = ∅ the locus is empty.

*Needs:* §1.1; §1.2; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11a, 3.1–3.5, adelic points and finite étale torsor descent.

### 1.8 Selmer sections localise into the Lawrence–Venkatesh locus

Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2, v a p-adic place and X → Y′ → Y any abelian-by-finite family. For every Selmer section s ∈ Sec^Sel(Y/K) the adelic point (loc_u(s))_u (with any local point giving res_u[s] at the archimedean places) lies in Y(A_K)^LV_X, interpolated by (A_s, V_s); hence loc_v(Sec^Sel(Y/K)) ⊆ Y(K_v)^LV_X.

Genus ≥ 2, as in the source; the argument uses only that loc_u is defined at finite places, which holds in genus ≥ 1 (§0.3).

(bs, Theorem 7.1 and its proof, pp. 54 and 56; bs line 2759; bs, §1.1.1, p. 3; bs line 103).

A proof can proceed as follows. Use the section pair as a single global interpolant. The Selmer condition supplies a point at each place and the preceding comparison identifies each restricted pair with its fibre pair. Projection gives the asserted inclusion without a self-conjugacy or monodromy hypothesis.

**Checks.**

- For s = κ(y) with y ∈ Y(K) this recovers Y(K) ⊆ Y(K_v)^LV_X.
- Combined with §6.4 it gives loc_v(Sec^Sel) ⊆ `Y(K_v)^LV_{X,S}` for suitable S.

*Needs:* §0.3; §1.4; §1.6; §1.7.

### Examples

For the Legendre family the coefficient algebra is ℚₚ and H¹ has rank 2. Its pairing has values ω(e,f)=1 and ω(f,e)=−1 in the Tate line. A constant family makes every adelic point interpolable, whereas the Legendre geometric monodromy is dense in SL₂ and its local system is not constant. These distinguish a fibre, a local system and a section pullback.

### Dependencies

TauCetiRoadmap.EtaleCohomologyFoundations §F.0.2; TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3, local systems and characteristic-zero geometric fundamental-group base change; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; Mathlib `LinearMap.IsAlt`; Mathlib `LinearMap.Nondegenerate`; Mathlib `Matrix.symplecticGroup`; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11a, 3.1–3.5, adelic points and finite étale torsor descent. Internal dependencies are specified in each subsection.

## Layer 2: Filtered discrete (φ, N, G_v)-modules and their automorphism groups

### 2.1 Filtered discrete (φ, N, G_v)-modules: restriction and induction

Let K_v be a finite extension of ℚₚ inside a fixed algebraic closure K̄_v, ℚₚⁿʳ ⊆ K̄_v the maximal unramified extension of ℚₚ and G_v = Gal(K̄_v/K_v). A (φ, N, G_v)-module is a finite-dimensional ℚₚⁿʳ-space D with a bijective Frobenius-semilinear φ, a ℚₚⁿʳ-linear N with Nφ = pφN, and a semilinear G_v-action commuting with φ and N; it is discrete when stabilisers of vectors are open. A filtered discrete (φ, N, G_v)-module is a triple D = (D_pst, D_dR, c_BO) with D_pst a discrete (φ, N, G_v)-module, D_dR a finite-dimensional K_v-space with an exhaustive separated decreasing filtration F^•, and c_BO: `K̄_v ⊗_{ℚₚⁿʳ} D_pst ≅ K̄_v ⊗_{K_v} D_dR` a G_v-equivariant isomorphism; with the evident morphisms and tensor products these form the ⊗-category MF(φ, N, G_v). It is equivalent to the colimit over finite Galois L/K_v of the filtered (φ, N, Gal(L/K_v))-modules of PadicHodgeTheory §§3.4–3.5 and 5.3. For de Rham V, D_pH(V) := (D_pst(V), D_dR(V), c_BO) (PadicHodgeTheory §5.3), and for a smooth proper K_v-variety X, H^•_pH(X/K_v) := (`D_pst(H^•_ét(X_{K̄_v}, ℚₚ))`, H^•_dR(X/K_v), c_dR ∘ c_BO) with Scholze's c_dR (PadicHodgeTheory §7.3). For a finite extension L_w/K_v in K̄_v with G_w ≤ G_v: restriction D|G_w := (D_pst|G_w, `L_w ⊗_{K_v} D_dR`, c_BO) is a ⊗-functor MF(φ, N, G_v) → MF(φ, N, G_w); induction `Ind_{G_w}^{G_v} D` := (`Ind_{G_w}^{G_v} D_pst`, D_dR viewed over K_v, c′_BO), with Ind D_pst = `Map_{G_w}(G_v, D_pst)` carrying the induced φ and N, the ℚₚⁿʳ-structure (λψ)(g) = g(λ)ψ(g), and c′_BO the composite of Ind(c_BO) with K̄_v ⊗ Ind ≅ Ind(K̄_v ⊗ −) and `Ind(K̄_v ⊗_{L_w} D_dR) ≅ K̄_v ⊗_{K_v} D_dR` (built from the trace-form idempotent of `L_w ⊗_{K_v} L_w`), is a lax ⊗-functor right adjoint to restriction. For a smooth proper K_v-variety X, `H^•_pH(X_{L_w}/L_w) ≅ H^•_pH(X/K_v)|G_w` (2.1), and for a smooth proper L_w-variety X viewed over K_v, H^•_pH(X/K_v) ≅ `Ind_{G_w}^{G_v} H^•_pH(X/L_w)` (2.2).

K_v/ℚₚ finite; all extensions L_w are taken inside the fixed K̄_v. B_st is identified with its image in B_dR independently of a choice of p-adic logarithm, following Shimizu (Betts–Stix footnote 4). Induction follows the convention `Ind_{G_w}^{G_v} W = Map_{G_w}(G_v, W)` with (g·ψ)(h) = ψ(hg). Filtered morphisms preserve the filtration; isomorphisms preserve it in both directions. Use the induced filtration on subobjects, and do not assume the full filtered category is abelian.

(bs, Definitions 2.6–2.7, pp. 8–9; bs line 376; bs, §2.2.2, Example 2.8 and Theorem 2.9, p. 9; bs line 423; bs, Example 2.10 and Remark 2.11, pp. 9–10; Remark 3.4, p. 17; bs line 423; bs, §2.2.3, Example 2.12 and footnote 5, pp. 10–11; bs line 475).

A proof can proceed as follows. Construct morphisms and tensor operations componentwise. Discrete semilinear descent over a sufficiently large finite Galois extension identifies D_pst with the scalar extension of its invariants; the comparison c_BO identifies the descended de Rham space. Its filtration is additional data, pulled to that finite extension. Restriction extends the de Rham scalars, whereas induction restricts them. Build the induced comparison using the separability idempotent of `L_w⊗_{K_v}L_w`. Frobenius reciprocity gives the adjunction; its right-adjoint tensor structure is lax. Étale base change, Shapiro and naturality of Scholze’s comparison give the two cohomology identities. For de Rham V and W choose a common finite Galois semistabilising extension L/K_v by PadicHodgeTheory §5.1. A morphism of their filtered discrete modules descends on G_L-invariants to the finite-level filtered module with Gal(L/K_v)-descent data. The exact tensor full faithfulness of PadicHodgeTheory §3.5 lifts it to a unique G_v-map V → W. The equivalence with the colimit category makes this independent of L. The supplied tensor and de Rham comparisons then assemble into a fully faithful symmetric monoidal functor D_pH; restriction follows from §5.3 and finite induction from Shapiro in ArithmeticGaloisRepresentations §1.3.

The API includes the following facts.

- A finite-dimensional ℚₚⁿʳ-space with φ, N and a semilinear G_v-action, Nφ = pφN, with G_v commuting with both operators; discrete when stabilisers are open.
- The triple (D_pst, D_dR, c_BO): the objects of MF(φ, N, G_v).
- MF(φ, N, G_v) is equivalent to the colimit over finite Galois L/K_v of filtered (φ, N, Gal(L/K_v))-modules (PadicHodgeTheory §§3.3–3.5).
- D ↦ D|G_w, a ⊗-functor MF(φ, N, G_v) → MF(φ, N, G_w) with identity and composition laws.
- D ↦ `Ind_{G_w}^{G_v} D`, a lax ⊗-functor MF(φ, N, G_w) → MF(φ, N, G_v).
- Hom(E|G_w, D) ≅ `Hom(E, Ind_{G_w}^{G_v} D)`, natural in both variables.
- D_pH(V) = (D_pst(V), D_dR(V), c_BO) is a fully faithful symmetric monoidal functor from de Rham ℚₚ-representations of G_v to MF(φ,N,G_v), with the specified comparison over K̄_v (Betts–Stix Theorem 2.9, p. 9; bs line 464).
- D_pH(V|G_w) = D_pH(V)|G_w.
- `D_pH(Ind_{G_w}^{G_v} V) ≅ Ind_{G_w}^{G_v} D_pH(V)`.
- H^•_pH(X/K_v) for a smooth proper K_v-variety, a graded algebra in MF(φ, N, G_v), contravariant in X.
- (2.1): `H^•_pH(X_{L_w}/L_w) ≅ H^•_pH(X/K_v)|G_w`.
- (2.2): for a smooth proper L_w-variety X viewed as a K_v-scheme by composition with Spec L_w → Spec K_v, H^•_pH(X/K_v) ≅ `Ind_{G_w}^{G_v} H^•_pH(X/L_w)`. This is not the cohomology of the Weil restriction scheme `Res_{L_w/K_v}` X.

**Checks.**

- The unit 1 = (ℚₚⁿʳ, K_v, id) with φ the Frobenius of ℚₚⁿʳ, N = 0 and the natural G_v-action has End(1) = ℚₚ and filtration jump 0.
- D_pH(ℚₚ(1)) is ℚₚⁿʳ·e with φ(e) = p⁻¹e, N = 0 and D_dR one-dimensional with its single filtration jump at −1.
- For L_w/K_v Galois of degree r, `(Ind_{G_w}^{G_v} 1)|G_w ≅ 1^{⊕r}`, and `Ind_{G_w}^{G_v} 1 = H⁰_pH(Spec L_w/K_v)`.
- Induction is only lax monoidal: for [L_w : K_v] = r ≥ 2, Ind 1 ⊗ Ind 1 has ℚₚⁿʳ-dimension r² while Ind(1 ⊗ 1) has dimension r, so the lax structure map is not an isomorphism.
- For crystalline V over K_v, D_pH(V) corresponds to the filtered φ-module D_cris(V) with trivial descent data (L = K_v, N = 0).
- For V = W = ℚₚ, both Hom spaces in the full-faithfulness comparison are ℚₚ: on the discrete side a scalar must satisfy φ(λ)=λ. Omitting φ would leave `K_{v,0}` when K_v/ℚₚ is unramified.
- For V = ℚₚ and W = ℚₚ(1), both Hom spaces are zero: already φ(λ)=pλ has no nonzero solution in the algebraic unramified field, since Frobenius preserves valuation. The zero representation also maps to the zero triple, whose endomorphism space is zero.
- For the unit object 1 = (ℚₚⁿʳ, K_v, id), `Ind_{G_w}^{G_v} 1 = H⁰_pH(Spec L_w/K_v)`, whose potentially semistable realisation is the induced function module and whose de Rham algebra is L_w. The latter is not generally a split K_v-algebra.

*Needs:* TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.CohomologyComparisons §§6.4–6.7, naturality, cup products, trace-normalised Tate line and first Chern classes. TauCetiRoadmap.ArithmeticGaloisRepresentations §1.3, induction and Shapiro on invariants.

### 2.2 Automorphism groups and retwisted filtrations

Let D be a (φ, N, G_v)-module (§2.1). Its endomorphism algebra End(D) is the ℚₚ-algebra of ℚₚⁿʳ-linear maps D → D commuting with φ, N and G_v, and Aut(D) is the functor on ℚₚ-algebras R ↦ the group of `R ⊗_{ℚₚ} ℚₚⁿʳ`-linear automorphisms of `R ⊗_{ℚₚ} D` commuting with 1 ⊗ φ, 1 ⊗ N and G_v, that is R ↦ `(R ⊗_{ℚₚ} End(D))^×`; it is represented by the unit group scheme of the finite-dimensional algebra End(D). For a symplectic (φ, N, G_v)-module (D, L, ω) (L of dimension one, ω: ∧²D → L perfect and equivariant), Aut^GSp(D) is the closed subgroup of Aut(D) × G_m whose R-points are pairs (f,c) satisfying ω(fx,fy) = cω(x,y); the factor c is part of the data even when D = 0. The scalar maps are λ ↦ λ id in Aut(D) and λ ↦ (λ id,λ²) in Aut^GSp(D), and have central image. For a filtered discrete module D = (D_pst, D_dR, c_BO), Aut(D_pst) acts on `Res^{K_v}_{ℚₚ} GL(D_dR)` by transporting 1 ⊗ ψ through c_BO and taking G_v-invariants, hence on `Res^{K_v}_{ℚₚ} G`, where G is the flag variety of filtrations of D_dR with the dimension data of F^•; for Φ ∈ G(K_v), M(Φ) := (D_pst, D_dR with the filtration Φ, c_BO).

K_v/ℚₚ finite; the similitude factor is recorded so that the degenerate case D = 0 behaves (Betts–Stix footnote 6). Establish finite-dimensionality of End(D) using the Frobenius fixed-vector argument before applying the imported unit-group representation theorem; the dimension theorem in §2.4 then records the resulting bounds.

(bs, Definition 2.13 and footnote 6, p. 11; bs line 528; bs, Remark 2.14 and the construction after it, p. 11; bs line 528).

A proof can proceed as follows. First apply the Frobenius fixed-vector argument on linear endomorphisms to prove that ℚₚⁿʳ⊗End(D) injects into the full endomorphism space. This proves finite-dimensionality without using algebraicity of Aut(D). Apply MordellLawrenceVenkatesh §0.5 to its unit functor. Impose the closed equations ω(fx,fy)=cω(x,y) inside Aut(D)×G_m, with multiplication (f,c)(g,d)=(fg,cd). Transport automorphisms through c_BO and take Galois invariants to act on the de Rham space and hence its imported flag variety. Replacing its filtration then defines M(Φ).

The API includes the following facts.

- The ℚₚ-algebra End(D) of endomorphisms commuting with φ, N and G_v.
- The affine ℚₚ-group Aut(D), R ↦ `(R ⊗_{ℚₚ} End(D))^×`.
- The closed subgroup of Aut(D) × G_m of pairs (f,c) with ω(fx,fy) = cω(x,y), with similitude character (f,c) ↦ c.
- The central scalar maps λ ↦ λ id into Aut(D) and λ ↦ (λ id,λ²) into Aut^GSp(D); forgetting the factor recovers the first map.
- The action of Aut(D_pst) on `Res^{K_v}_{ℚₚ} G` through c_BO, functorial in R.
- M(Φ) = (D_pst, (D_dR, Φ), c_BO) for Φ ∈ G(K_v).
- M(F^•) = D.
- Scalar multiplication fixes every filtration, so the flag action factors through the quotient of Aut(D_pst) by the image of the scalar map. For D_pst ≠ 0 this image is G_m; for D_pst = 0 the flag variety and its action are trivial.
- Two R-points are equal exactly when their automorphism and multiplier components both agree. For nonzero D, perfectness makes the forgetful map to Aut(D)(R) injective; for D=0 its kernel is all of G_m(R).

**Checks.**

- For the unit object, End(1) = ℚₚ: a ℚₚⁿʳ-linear map ℚₚⁿʳ → ℚₚⁿʳ is multiplication by λ, and commuting with φ forces λ ∈ ℚₚ.
- For K_v = `ℚ_{p²}` and D = ℚₚⁿʳ with its natural G_v-action, the G_v-equivariant ℚₚⁿʳ-linear endomorphisms are multiplication by `ℚ_{p²}`; only the condition with φ cuts them down to ℚₚ. A definition omitting φ gives the wrong group (Betts–Stix proof of Proposition 2.16, the Frobenius condition is essential).
- For D = 0, Aut(D) is the trivial group, while Aut^GSp(D) is G_m because the similitude factor is part of the data.
- For D_pst(H¹_ét) of an elliptic curve over ℚₚ with good ordinary reduction, D = `ℚₚⁿʳ ⊗_{ℚₚ} D_cris` with D_cris = ℚₚ e₁ ⊕ ℚₚ e₂, φ = Frob ⊗ diag(α, β) for the roots α, β ∈ ℚₚ of X² − a_pX + p (v_p(α) = 0, v_p(β) = 1), N = 0 and `G_{ℚₚ}` acting on the first factor: End(D) = ℚₚ × ℚₚ and Aut(D) = Aut^GSp(D) = G_m², of dimension 2 ≤ d(2d + 1) + 1 = 4 for d = 1.
- For D_dR two-dimensional with jumps {0, 1}, G = P¹ and M(Φ) for Φ a line is the filtered module with F¹ = Φ.
- On the standard two-dimensional symplectic space, diag(2,3) has multiplier 6; the scalar 2 has multiplier 4, not 2. Over ℚ₂ these are still distinct equalities in characteristic zero.

*Needs:* §2.1; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §1.3, flag bundles; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction; TauCetiRoadmap.ReductiveGroups Layers 0 and 3; Tau Ceti `TauCeti.Symplectic.groupScheme`.

### 2.3 The orbit lemma for retwisted filtrations

Let D = (D_pst, D_dR, c_BO) be a filtered discrete (φ, N, G_v)-module and G the flag variety of filtrations of D_dR with the dimension data of its filtration. For Φ₁, Φ₂ ∈ G(K_v), M(Φ₁) ≅ M(Φ₂) as filtered discrete (φ, N, G_v)-modules if and only if Φ₁ and Φ₂ lie in one Aut(D_pst)(ℚₚ)-orbit for the action of §2.2. Consequently the set of Φ with M(Φ) in a fixed isomorphism class lies in a closed ℚₚ-subvariety of `Res^{K_v}_{ℚₚ} G` of dimension at most `dim_{ℚₚ} Aut(D_pst)`, and the same holds for finitely many classes. The symplectic version, with Aut^GSp(D_pst) acting on the Lagrangian Grassmannian of a symplectic D_dR, holds with the same proof.

The orbit statement is over ℚₚ-points; the dimension bound is for the Zariski closure of an orbit of an algebraic group acting algebraically.

(bs, Lemma 2.15 and proof, p. 12; bs line 576).

A proof can proceed as follows. An isomorphism is determined by its potentially semistable component. It is filtered precisely when its induced de Rham map carries Φ₁ onto Φ₂, proving both directions of the orbit criterion. Apply MordellLawrenceVenkatesh §0.18 to the actual orbit map. In positive rank the scalar torus lies in every flag stabiliser, giving the strengthened bound dim Aut−1 used in Layer 7.

**Checks.**

- For K_v = ℚₚ and D_dR of dimension two with jumps {0, 1} and Aut(D_pst) = G_m² acting on P¹ through the eigenbasis, the orbits are the two eigenlines and their complement: three isomorphism classes of retwists.

*Needs:* §2.2; §2.1; TauCetiRoadmap.MordellLawrenceVenkatesh §4.3 (Frobenius-centralizer orbits); TauCetiRoadmap.ReductiveGroups Layers 0 and 3.

### 2.4 Dimension bounds for automorphism groups

(1) For a (φ, N, G_v)-module D of ℚₚⁿʳ-dimension d, End(D) is a finite-dimensional ℚₚ-algebra, the natural map `ℚₚⁿʳ ⊗_{ℚₚ} End(D) → End_{ℚₚⁿʳ}(D)` is injective, Aut(D) is an affine algebraic group over ℚₚ, and `dim_{ℚₚ} Aut(D) ≤ d²`. (2) For a symplectic (φ, N, G_v)-module (D, L, ω) of rank 2d, Aut^GSp(D) is an affine algebraic group over ℚₚ of dimension ≤ d(2d + 1) + 1, the dimension of `GSp_{2d}`.

The injectivity uses both the G_v-action and the Frobenius φ: the G_v-action alone gives only traces to `K_{v,0}`.

(bs, Proposition 2.16 and proof, p. 12; bs line 576; bs, §2.2.4, p. 11; bs line 528).

A proof can proceed as follows. In a relation Σλ_iψ_i=0 among ℚₚ-independent commuting endomorphisms, conjugation by φ applies Frobenius to the λ_i. Their coefficients lie in a finite unramified extension; multiply by any coefficient there and average Frobenius conjugates. Nondegeneracy of the trace pairing forces every λ_i=0. Thus scalar extension of End(D) injects into the d²-dimensional full endomorphism algebra. The associated unit group embeds into GL_d after scalar extension. The multiplier-retaining symplectic subgroup embeds into `GSp_{2d}`; for d=0 treat it separately as G_m, still of dimension 1.

**Checks.**

- For d = 1 (a rank-one module), dim Aut(D) ≤ 1; equality for D = 1.
- For d = 1 in the symplectic case the bound is 4 = dim GL₂ = dim GSp₂.

*Needs:* §2.2; §2.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18; Mathlib `Matrix.symplecticGroup`.

### Examples

For the unit, End=ℚₚ and Aut=G_m; for zero, Aut=1 but Aut^GSp=G_m. In rank 2 the scalar λ has multiplier λ². A crystalline Tate line has φ=p⁻¹σ, N=0 and jump −1; the two-step H¹ filtration has jumps 0,1. For an index-two extension the induced unit has dimension 2 and its tensor square dimension 4.

### Dependencies

TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.CohomologyComparisons §§6.4–6.7, naturality, cup products, trace-normalised Tate line and first Chern classes; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §1.3, flag bundles; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction; TauCetiRoadmap.ReductiveGroups Layers 0 and 3; Tau Ceti `TauCeti.Symplectic.groupScheme`; TauCetiRoadmap.MordellLawrenceVenkatesh §4.3 (Frobenius-centralizer orbits); TauCetiRoadmap.MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18; Mathlib `Matrix.symplecticGroup`. Internal dependencies are specified in each subsection.

## Layer 3: Self-conjugate places and average Hodge–Tate weights

### 3.1 Conjugate and self-conjugate places

Let K be a number field. Two finite places v, v′ of K are conjugate if, for every CM subfield E ⊆ K, the restrictions v|_E and v′|_E are exchanged by the complex conjugation c_E of E, that is v′|_E = c_E(v|_E); v is self-conjugate if it is conjugate to itself. (1) If K has no CM subfield (for instance K totally real or of odd degree), every finite place is self-conjugate. (2) If K has a CM subfield, it has a largest one E_K (MordellLawrenceVenkatesh §§1.2, 1.4–1.16); then v, v′ are conjugate exactly when `v′|_{E_K} = c_{E_K}(v|_{E_K})`, and v is self-conjugate exactly when `c_{E_K}` fixes `v|_{E_K}`, i.e. the place of the maximal totally real subfield below v is inert or ramified in E_K. (3) The friendly places of Lawrence–Venkatesh (MordellLawrenceVenkatesh §§1.2, 1.4–1.16) are exactly the self-conjugate places unramified over Q.

K a number field; places are finite places (height-one primes of O_K). Conjugacy is tested on every CM subfield, not only on E_K; by (2) the two tests agree.

(bs, Definition 2.17 and Remark 2.18, p. 13; bs line 626; bs, §1.1, p. 3; bs line 103).

A proof can proceed as follows. Use complex conjugation on each CM subfield; compatibility with subfields reduces the condition to the maximal CM subfield. In a quadratic CM extension a prime is fixed exactly when it is nonsplit, including ramification. Chebotarev supplies infinitely many inert primes, and primes above them in K remain self-conjugate.

The API includes the following facts.

- v and v′ are conjugate: v′|_E = c_E(v|_E) for every CM subfield E of K.
- v is self-conjugate when v is conjugate to itself.
- If K has no CM subfield, every finite place is self-conjugate.
- With a CM subfield, v is self-conjugate iff `c_{E_K}` fixes `v|_{E_K}`.
- Conjugacy of places is symmetric.
- If v is self-conjugate on K and F ⊆ K, then v|_F is self-conjugate on F (CM subfields of F are CM subfields of K).
- v is friendly in the sense of MordellLawrenceVenkatesh §§1.2, 1.4–1.16 iff v is self-conjugate and unramified over Q.
- Every number field has infinitely many self-conjugate places: all places if it has no CM subfield, and otherwise those above primes of E_K⁺ inert in E_K (Chebotarev).

**Checks.**

- Every prime of Q is self-conjugate, since Q has no CM subfield.
- In Q(i), the place (3) is self-conjugate: complex conjugation fixes the prime 3Z[i].
- In Q(i), the places (2 + i) and (2 − i) above 5 are exchanged by complex conjugation: they are conjugate to each other and neither is self-conjugate.
- In Q(i), the place (1 + i) is self-conjugate (it is the only place above 2) but ramified over Q, so it is not friendly: self-conjugacy is strictly weaker than friendliness.
- For K = ℚ(2^(1/3)), which has odd degree and so no CM subfield, every finite place is self-conjugate.
- Conjugacy of places need not be reflexive: at the two primes over 5 in ℚ(i), the restrictions are exchanged, not individually fixed. Symmetry therefore does not make it an equivalence relation.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; Mathlib `NumberField.IsCMField`; Mathlib `NumberField.IsCMField.ringOfIntegersComplexConj`.

### 3.2 Hodge–Tate weights of pure characters at conjugate places

Let K be a number field, p a prime and χ: G_K → ℚₚ^× a continuous character that is unramified and pure of weight n ∈ Z outside a finite set of places (WeightsInEtaleCohomology Layer R34.1) and de Rham at every place above p. For a place v | p let r_v be the Hodge–Tate weight of χ|G_v, the integer r with `(C_p(r) ⊗ χ|G_v)^{G_v}` ≠ 0, equivalently the filtration jump of D_dR(χ|G_v). If v and v′ above p are conjugate (§3.1), then `r_v + r_{v′} = n`. In particular, at a self-conjugate place v above p, n is even and r_v = n/2.

χ takes values in ℚₚ^×. With ℚ̄ₚ^×-values the statement is false when K has a CM subfield: for K = Q(i), p ≡ 3 mod 4 and v = (p), the character of G_K on H¹_ét of the CM curve y² = x³ − x composed with an embedding `Q_{p²}` → ℚ̄ₚ is pure of odd weight 1 and de Rham at v (bs, Proposition 2.19, p. 13). Hodge–Tate weights are normalised so that ℚₚ(1) has weight −1.

(bs, Proposition 2.19 and proof, pp. 13–14; bs line 626; bs, §2.3, footnotes 7–8, p. 13; bs line 626).

A proof can proceed as follows. Translate χ into an idele class character. Local algebraicity identifies its character on an open unit subgroup with the r_v-th power of the local norm under arithmetic reciprocity. The infinity-type conjugation relation and factorisation through the maximal CM subfield then give r_v+r_v′=n. The equality is integral, so self-conjugacy implies even n.

**Checks.**

- χ = χ_cyc⁻¹ (the representation ℚₚ(−1)) is pure of weight 2 and has Hodge–Tate weight 1 = 2/2 at every place above p.
- A finite-order character has n = 0 and r_v = 0 everywhere.

*Needs:* §3.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.WeightsInEtaleCohomology Layer R34.1 and §R34.2, geometric-Frobenius purity and integrality.

### 3.3 Pure characters at self-conjugate places

Let χ: G_K → ℚₚ^× be as in §3.2 and v a self-conjugate place above p. Then `χ|G_v = χ₀ · χ_cyc^{−n/2}` with χ₀ a character of G_v of finite order. If K has no CM subfield, `χ · χ_cyc^{n/2}` is itself of finite order on G_K.

χ is ℚₚ^×-valued; for the ℚ̄ₚ^×-valued CM character of §3.2, χ|G_v is a Lubin–Tate character and n is odd.

(bs, Remark 2.20, p. 14; bs line 680).

A proof can proceed as follows. Twist to weight zero. With no CM subfield all local algebraic types vanish; finite ramification then factors the idele character through a finite ray class group. In the CM case use the factored algebraic type to descend a finite power of the character along `N_{K/E}`. The finite ray-class obstruction is killed by another finite power. For the resulting character η of E, η·ηᶜ has finite order. At a conjugation-fixed local place η has weight zero and its square is finite order, so η and then its pullback are finite order locally. A character whose fixed positive power is finite order is itself finite order. This uses norm descent, rather than attempting to isolate one component of a restriction to the diagonal E-idele group.

**Checks.**

- For χ = χ_cyc⁻¹, `χ|G_v = χ_cyc^{−1}` with χ₀ = 1 and n = 2.

*Needs:* §3.2; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.ClassFieldTheory Layers 7 and 11; TauCetiRoadmap.GlobalNumberFields Layers 2, 7 and 8.

### 3.4 Average Hodge–Tate weight at a self-conjugate place

Let L/K be a finite extension of number fields, V a continuous ℚₚ-representation of G_L that is de Rham at every place of L above p and unramified and pure of weight n outside a finite set, and v a self-conjugate place of K above p. Then `Σ_{w | v} [L_w : K_v] Σ_{i∈Z} i·dim_{L_w} gr^i_F D_dR,w(V) = n·[L : K]·dim_{ℚₚ}(V)/2`, where D_dR,w(V) := D_dR(V|G_w). When V≠0, equivalently the average Hodge–Tate weight of `Ind_{G_L}^{G_K}V` at v (the filtration weight of MordellLawrenceVenkatesh §§1.2, 1.4–1.16) is n/2.

v is self-conjugate on K; no condition is put on the places of L. V is a representation over ℚₚ, so det Ind V is ℚₚ^×-valued and §3.2 applies.

(bs, Corollary 2.21 and proof, pp. 14–15; bs line 680).

A proof can proceed as follows. Induce V to G_K and apply the conjugate-place theorem to its determinant, whose purity weight is n[L:K]dim V. Mackey and induced de Rham periods give its local graded multiplicity as `Σ_{w|v}[L_w:K_v]dim gr^i D_dR,w(V)`. Summing the jumps gives the formula, without dividing by rank when V=0.

**Checks.**

- For an abelian variety A over L = K of dimension g and V = `H¹_ét(A_{K̄}, ℚₚ)`, both sides equal g at every self-conjugate v | p.
- Applied to a subrepresentation W₀ with Hodge–Tate weights in {0, 1} of a transitively induced symplectic module, it gives Σ_w [L_w : K_v] dim F¹D_dR,w(W₀) = ½ dim W₀ · #Σ, as used in the principal trichotomy.

- For V=0 both sides of the weighted-sum identity are 0, while the average is undefined. The equivalent average formulation is restricted to V≠0.

*Needs:* §3.2; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16.

### Examples

In ℚ(i), the prime over 3 is fixed by conjugation, those over 5 are exchanged, and the prime over 2 is fixed but ramified. For ℚₚ(−1), geometric Frobenius is q, purity is 2 and the jump is 1, so 1+1=2. For H¹ of an elliptic curve the jumps 0,1 have sum 1=1·2/2; a degree-two induction gives total sum 2.

### Dependencies

TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; Mathlib `NumberField.IsCMField`; Mathlib `NumberField.IsCMField.ringOfIntegersComplexConj`; TauCetiRoadmap.WeightsInEtaleCohomology Layer R34.1 and §R34.2, geometric-Frobenius purity and integrality; TauCetiRoadmap.ClassFieldTheory Layers 7 and 11; TauCetiRoadmap.GlobalNumberFields Layers 2, 7 and 8; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction. Internal dependencies are specified in each subsection.

## Layer 4: Model-free period maps control D_pst

### 4.1 Transport of D_pst on a spherical polyannulus

Let K_v be a finite extension of ℚₚ, R_v = `O_v⟨t₁^{±1}, …, t_n^{±1}⟩` and U = Sp(R_v[1/p]) the spherical polyannulus over K_v. Let (𝔼, E, c) be a de Rham pair on U (PadicHodgeTheory §7.3) whose filtered flat bundle E has a full basis of horizontal sections. Then for all y₀, y ∈ U(K_v) there is a unique isomorphism of (φ, N, G_v)-modules `T_{y₀,y}`: `D_pst(𝔼_{ȳ₀})` → D_pst(𝔼_ȳ) such that, after extending scalars to K̄_v, it corresponds through c_BO and the fibre comparisons `c_{y₀}`: `D_dR(𝔼_{ȳ₀})` ≅ `E_{y₀}` and c_y to 1 ⊗ `T^∇_{y₀,y}`: K̄_v ⊗ `E_{y₀}` → K̄_v ⊗ E_y.

U is a spherical polyannulus (inner and outer radii equal), so R_v satisfies Shimizu's Set-up 3.1 and Condition (BR). E has a full basis of horizontal sections over U: (E, ∇) ≅ (O_U, d)^m.

(bs, Theorem 3.22, footnote 17, pp. 28–29; bs line 1421; bs, §3.5, Definition 3.24, Lemma 3.25, Corollary 3.26, Lemma 3.27, Remarks 3.28–3.29 and the proof of Theorem 3.22 for polyannuli, pp. 29–32; bs line 1475).

First identify finite étale covers of U with finite étale R_v[1/p]-algebras, contravariantly, using AdicEtaleGeometry §§A1.1, A1.3 and the rigid–adic comparison. Choose a geometric base point and write G_R = π₁^ét(Spec(R_v[1/p])). The induced equivalence of Galois categories, applied to compatible finite free ℤ/pⁿ-systems and PadicHodgeTheory §7.2, identifies integral local systems on U with continuous finite free ℤₚ-representations of G_R. This equivalence commutes with pullback: the structural map gives q:G_R → G_v, and a K_v-point y with a choice of geometric transport gives a section s_y:G_v → G_R with q ∘ s_y = id. The representation on the fibre at y is restriction along s_y; a different transport conjugates it. Pullback of a base representation is composition with q. These compatibilities follow levelwise from the fibre functors and then by inverse limits (bs, Lemma 3.27 and (3.11), pp. 29–31; bs lines 1525, 1558 and 1588).

A proof can proceed as follows. Use these equivalences to regard a finite free integral local system as a representation E of G_R. For a finitely generated integral local system with torsion, pass to its torsion-free quotient; its rational period realisations are unchanged. The horizontal-period contract gives potential horizontal semistability and specialisation isomorphisms ρ_ỹ:D_pst^∇(E)≅D_pst(E_ỹ). Their composite ρ_ỹρ_ỹ₀⁻¹ supplies transport. Over the relative de Rham period ring, compare it with the given horizontal trivialisation: the discrepancy is horizontal and invariant, hence a matrix over K_v; evaluation at y₀ makes that matrix the identity. This proves compatibility with the actual comparison and uniqueness. The construction respects morphisms and tensor products.

**Checks.**

- For n=0, R_v[1/p]=K_v, G_R=G_v and q=s_y=id; the finite étale equivalence is the usual finite G_v-set correspondence.
- For a lattice pulled back from ℤₚ(1) on Spec K_v, its action is χ_cyc ∘ q and its fibre at every y has action χ_cyc ∘ q ∘ s_y = χ_cyc. Treating an integral local system as discrete constant ℤₚ would incorrectly exclude this infinite monodromy.
- Over ℚ₃ on the one-dimensional polyannulus, the cover z²=t has two fixed geometric fibre points at t=1 and two points exchanged by unramified Frobenius at t=2. The associated rank-one sign local system has trivial fibre character at 1 and nontrivial quadratic character at 2; the representation of G_R must retain the point section. This sign local system has no global horizontal basis on the polyannulus, so it does not satisfy the transport theorem’s hypothesis.
- For a constant de Rham pair (𝔼 constant, E = O_U ⊗ D_dR) `T_{y₀,y}` is the identity of `D_pst(𝔼_{ȳ₀})`.
- `T_{y,y} = id` and `T_{y₁,y₂} ∘ T_{y₀,y₁} = T_{y₀,y₂}`, by uniqueness.

*Needs:* TauCetiRoadmap.AdicEtaleGeometry §§A1.1, A1.3, finite-etale-local-to-global; TauCetiRoadmap.AdicSpacesPartII Layer R1; TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.2–7.3, 8.1–8.2 and the horizontal-period contract; §2.1.

### 4.2 Reduction from closed polydiscs to spherical polyannuli

If the conclusion of §4.1 holds for spherical polyannuli over every finite extension of ℚₚ, then it holds for every closed polydisc U over K_v, every de Rham pair on U whose bundle has a full basis of horizontal sections and every y₀, y ∈ U(K_v).

The residue field of K_v is arbitrary; the case k_v = F₂ needs the unramified extensions of degrees 2 and 3.

(bs, Lemma 3.23 and proof, p. 29; bs line 1475; bs, §3.5, p. 29; bs line 1475).

A proof can proceed as follows. If the residue field has more than two elements, choose in each coordinate a residue distinct from both prescribed point coordinates. Translation then places both points in a spherical polyannulus inside the disc. For residue field 𝔽₂ pass to the unramified extensions of degrees 2 and 3. Uniqueness gives the same underlying transport over both extensions, and their two local Galois subgroups generate G_v, so the map descends.

**Checks.**

- Over ℚ₂ (residue field F₂) the argument passes through Q₄ and Q₈ = `Q_{2³}`, unramified of degrees 2 and 3.

*Needs:* §4.1; TauCetiRoadmap.LocalFieldsRamification Layers 0, 2 and 4.

### 4.3 Horizontal de Rham transport of D_pst

Let U be a rigid-analytic space over a finite extension K_v of ℚₚ isomorphic to a closed polydisc or a spherical polyannulus, and (𝔼, E, c) a de Rham pair on U whose filtered flat bundle E has a full basis of horizontal sections. Then for all y₀, y ∈ U(K_v) there is a unique isomorphism of (φ, N, G_v)-modules `T_{y₀,y}`: `D_pst(𝔼_{ȳ₀})` ≅ D_pst(𝔼_ȳ) whose K̄_v-extension corresponds, through c_BO and the fibre comparisons `c_{y₀}`, c_y, to 1 ⊗ `T^∇_{y₀,y}`. By uniqueness (a consequence by functoriality), these isomorphisms satisfy `T_{y,y} = id` and `T_{y₁,y₂} ∘ T_{y₀,y₁} = T_{y₀,y₂}`, and are compatible with tensor products and morphisms of de Rham pairs.

U a closed polydisc or a spherical polyannulus over K_v; E with a full basis of horizontal sections on U.

(bs, Theorem 3.22, pp. 28–29, proved in §3.5, pp. 29–32; bs line 1421; bs, §3.5, p. 28; bs line 1421).

A proof can proceed as follows. Combine the polyannulus theorem with polydisc reduction. The comparison rectangle specifies transport uniquely after a faithful scalar extension. Applying this uniqueness to composites, tensors and maps of pairs proves identity, cocycle and naturality laws.

**Checks.**

- For the pushforward of the unit pair along a smooth proper family this is §4.4.

*Needs:* §4.1; §4.2.

### 4.4 Period maps control D_pst in smooth proper families

Let π: X → Y be a smooth proper morphism of smooth varieties over a finite extension K_v of ℚₚ, i ≥ 0, and U ⊆ Y^an an admissible open isomorphic to a closed polydisc over which H^i_dR(X/Y)^an has a full basis of horizontal sections for the Gauss–Manin connection. Then for all y₀, y ∈ U(K_v) there is a unique isomorphism of (φ, N, G_v)-modules `T_{y₀,y}`: `D_pst(H^i_ét(X_{y₀,K̄_v}, ℚₚ))` ≅ `D_pst(H^i_ét(X_{y,K̄_v}, ℚₚ))` whose K̄_v-extension corresponds, through c_BO and Scholze's comparison c_dR: `D_dR(H^i_ét(X_{y,K̄_v}, ℚₚ))` ≅ H^i_dR(X_y/K_v) at y₀ and at y, to 1 ⊗ `T^∇_{y₀,y}`: `H^i_dR(X_{y₀}/K_v)` → H^i_dR(X_y/K_v), the parallel transport composed with the base-change isomorphisms. In other words, H^i_pst(X_y/ℚₚⁿʳ) is constant on U(K_v) as a (φ, N, G_v)-module, and only the Hodge filtration moves.

No reduction hypothesis on π: K_v is any finite extension of ℚₚ, and π need not extend to any model. c_dR is Scholze's comparison isomorphism, constructed from the relative comparison (PadicHodgeTheory §7.3); the statement is for that c_dR (Betts–Stix Remark 3.4).

(bs, Theorem 3.3 and Remark 3.4, pp. 16–17; bs line 802; bs, Proof of Theorem 3.3 from Theorem 3.22, p. 29; bs line 1475; bs, §3, pp. 15 and 18; bs line 737).

A proof can proceed as follows. Proper smooth pushforward of the unit de Rham pair supplies the relative étale local system, the Gauss–Manin bundle and Scholze’s comparison. Apply horizontal transport to that pair. Its underlying discrete module is constant on the chosen disc; the filtration is allowed to vary.

**Checks.**

- For π with good reduction on a residue disk, Lawrence–Venkatesh obtain an analogous transport through crystalline cohomology (MordellLawrenceVenkatesh §§2.11 and 4.1–4.2); identifying the two needs a comparison of Scholze's c_dR with the crystalline comparison, which Betts–Stix (Remark 3.4) note is not covered by Nizioł's comparison results, so this roadmap does not use it.
- The isomorphism class of H^i_pH(X_y/K_v) is not constant on U in general; only its (φ, N, G_v)-module is.

*Needs:* §4.3; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.ComplexComparisonPartII §C5.2, Gauss–Manin connection and comparison with complex parallel transport; TauCetiRoadmap.AdicSpacesPartII Layer R1, rigid analytification; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract.

### 4.5 Period maps control the local Galois representations

Let π: X → Y, i and U ∋ y₀ be as in §4.4, and `Φ_{y₀}`: U → `G^an_{y₀}` the v-adic period map of the filtered flat bundle H^i_dR(X/Y)^an (of the model-free period-map contract), `G_{y₀}` the flag variety of filtrations of `H^i_dR(X_{y₀}/K_v)` with the dimension data of its Hodge filtration. For a filtration Φ ∈ `G_{y₀}(K_v)` let M^i(Φ) := (`H^i_pst(X_{y₀}/ℚₚⁿʳ)`, `H^i_dR(X_{y₀}/K_v)` filtered by Φ, c_dR ∘ c_BO), the retwist of §2.2. Then H^i_pH(X_y/K_v) ≅ `M^i(Φ_{y₀}(y))` as filtered discrete (φ, N, G_v)-modules for every y ∈ U(K_v). Hence, D_pH being fully faithful, `Φ_{y₀}(y)` determines the isomorphism class of the G_v-representation `H^i_ét(X_{y,K̄_v}, ℚₚ)`, and two points y, y′ ∈ U(K_v) with `Φ_{y₀}(y)`, `Φ_{y₀}(y′)` in one `Aut(H^i_pst(X_{y₀}))(ℚₚ)`-orbit have isomorphic local representations.

As in §4.4; the filtration of the bundle is the Hodge filtration, which is Griffiths transverse, though Definition 3.1 does not need this.

(bs, Proposition 3.5 and the diagram after it, pp. 17–18; bs line 854).

A proof can proceed as follows. Pull the Hodge filtration back by `T^∇_{y₀,y}`. The horizontal transport identifies the resulting retwist with the fibre’s filtered discrete module. Full faithfulness of D_pH and the orbit criterion recover the local representation’s isomorphism class. Only actual period values are asserted to be admissible; arbitrary flags need not come from representations.

**Checks.**

- At y = y₀, `Φ_{y₀}(y₀)` is the Hodge filtration and `M^i(Φ_{y₀}(y₀))` = `H^i_pH(X_{y₀}/K_v)`.

*Needs:* §4.4; §2.2; §2.3; §2.1; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract.

### Examples

At the centre all transport maps are identities. For T=[[1,0],[1,1]], a fixed Hodge line pulls back to (1:−1). Over residue field 𝔽₂ two distinct residues leave no third residue for translation; over 𝔽₄ and 𝔽₈ a third exists and the degree-two and degree-three descent conditions recover Gᵥ-equivariance. Nφ=pφN retains the value pe on the rank-two monodromy witness of the conventions.

### Dependencies

TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.LocalFieldsRamification Layers 0, 2 and 4; TauCetiRoadmap.ComplexComparisonPartII §C5.2, Gauss–Manin connection and comparison with complex parallel transport; TauCetiRoadmap.AdicSpacesPartII Layer R1, rigid analytification; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract. Internal dependencies are specified in each subsection.

## Layer 5: Period maps of abelian-by-finite families

### 5.1 The symplectic pair of p-adic Hodge cohomology of a fibre

Let X → Y′ → Y be an abelian-by-finite family over a scheme Y of characteristic zero with polarisation λ and locally constant relative dimension over Y′ as in §1.2, K_v a finite extension of ℚₚ and y ∈ Y(K_v). Then Scholze's comparison c_dR identifies the étale and de Rham first Chern classes of λ, c₁^ét(λ) ↔ c₁^dR(λ), so that the étale pairing ω_λ^ét and the de Rham pairing ω_λ^dR correspond, and `H^{≤1}_pH(X_y/K_v)` := (H⁰_pH(X_y/K_v), H¹_pH(X_y/K_v)) with pairing ω_λ^pH: ∧²H¹_pH → H⁰_pH⟨−1⟩ (components D_pst(ω_λ^ét) and ω_λ^dR) is a symplectic pair in MF(φ, N, G_v). It is isomorphic to `D_pH(H^{≤1}_ét(X_{y,K̄_v}, ℚₚ))` as a symplectic pair.

⟨−1⟩ is the Tate twist of filtered modules, D_dR shifted so that its filtration jump moves by one; the identification of ℚₚ(−1) with ⟨−1⟩ uses the isomorphism a: B_dR(−1) ≅ B_dR⟨−1⟩ of CohomologyComparisons §6.5.

(bs, §4.1.3, p. 35; bs line 1789; bs, Proposition 3.19(1)–(3), p. 27, and Proposition 3.20(5)–(8), pp. 27–28; bs lines 1367 and 1398).

A proof can proceed as follows. Use CohomologyComparisons §§6.4–6.7 to carry the polarisation class, cup product, trace and Tate line through Scholze’s comparison. The étale and de Rham pairings then define a morphism in the filtered discrete category. Perfectness and the Lagrangian filtration are checked on the supplied realisations.

The API includes the following facts.

- The potentially semistable realisation is the pair (H⁰_pst, H¹_pst) obtained by applying D_pst to the étale pair, with its φ, N and G_v actions.
- The de Rham realisation is (H⁰_dR, H¹_dR), with coefficient algebra H⁰_dR = O(Y′_y) and Lagrangian step F¹H¹_dR.
- The supplied comparison identifies these algebra and module structures and carries the polarisation pairing to the de Rham pairing, using the trace-normalised Tate-line identification a.
- The pairing is alternating, H⁰_pH-linear and perfect, with target H⁰_pH⟨−1⟩ of rank one over H⁰_pH; its de Rham filtration jump is 1.
- For every finite extension E/K_v, restriction of this pair to G_E identifies with the pair of the base-changed fibre; the de Rham realisation extends scalars from K_v to E, compatibly with the comparison and pairing.

**Checks.**

- For an elliptic fibre over F=K_v the degree-zero and degree-one ranks over their respective realisation fields are (1,2), the degree-one jumps are 0,1 and the pairing-target jump is 1. In a symplectic de Rham basis (e,f), ω(e,f)=1 and ω(f,e)=−1 in that line, including over ℚ₂; a symmetric pairing or the opposite Tate twist gives the wrong values.
- For two elliptic components over F the ranks are (2,4), H⁰_dR=F×F and F¹H¹_dR has F-dimension 2. The two nontrivial idempotents (1,0) and (0,1) separate the components; replacing the algebra by F loses this decomposition.
- For an elliptic curve over a quadratic field L/F, viewed as an F-scheme by structural composition, the ranks are again (2,4) and F¹ has F-dimension 2, but H⁰_dR=L has no nontrivial idempotent. After a finite extension E/F splitting L, E⊗_F L=E×E. This distinguishes the field algebra from F×F despite the identical ranks and tests finite-extension compatibility.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §1.1; §1.2; §2.1; TauCetiRoadmap.CohomologyComparisons §§6.4–6.7, naturality, cup products, trace-normalised Tate line and first Chern classes; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract.

### 5.2 The symplectic pairs `M^{≤1}(Φ)` of Lagrangian filtrations

Let X → Y′ → Y be an abelian-by-finite family over a smooth K_v-variety Y and y₀ ∈ Y(K_v), allowing locally constant relative dimension over Y′ via gap:variable-rank-abelian-by-finite. Use the Lagrangian period variety `H_{y₀}`, namely the K_v-variety of Lagrangian `H⁰_dR(X_{y₀}/K_v)`-submodules of `H¹_dR(X_{y₀}/K_v)` (the period variety MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract of the symplectic module H¹_dR over the finite étale algebra `H⁰_dR(X_{y₀}/K_v)` = `O(Y′_{y₀})`), a closed subvariety of the flag variety `G_{y₀}`. For Φ ∈ `H_{y₀}(K_v)`, M¹(Φ) := (`H¹_pst(X_{y₀}/ℚₚⁿʳ)`, `H¹_dR(X_{y₀}/K_v)`, c_dR ∘ c_BO) with the filtration F^i = H¹_dR for i ≤ 0, F¹ = Φ, F^i = 0 for i ≥ 2, and M⁰ := `H⁰_pH(X_{y₀}/K_v)`. Then M¹(Φ) is a symplectic M⁰-module in MF(φ, N, G_v) for the pairing ω_λ^pH, and `M^{≤1}(Φ)` := (M⁰, M¹(Φ)) is a symplectic pair. The Hodge filtration point Φ₀ = `F¹H¹_dR(X_{y₀})` gives `M^{≤1}(Φ₀)` = `H^{≤1}_pH(X_{y₀}/K_v)`.

Φ is Lagrangian for ω_λ^dR, which is what makes the retwisted pairing a morphism of filtered modules into M⁰⟨−1⟩.

(bs, §4.2, Definition 4.10, p. 37; bs line 1882).

A proof can proceed as follows. Use the imported Lagrangian period variety over the finite étale de Rham algebra. Keep M⁰ and the discrete degree-one module fixed and put F¹=Φ, with F⁰ the whole space and F²=0. The pairing targets a line with jump 1, so being a filtered pairing is exactly the isotropy condition at F¹⊗F¹. Half-rank makes Φ Lagrangian. The pair automorphism action yields the isomorphism criterion.

The API includes the following facts.

- `H_{y₀}` ⊆ `G_{y₀}`: Lagrangian `H⁰_dR(X_{y₀})`-submodules of `H¹_dR(X_{y₀})`, the period variety of MordellLawrenceVenkatesh §3.8 with the componentwise extension gap:variable-rank-abelian-by-finite.
- M¹(Φ) = retwist of `H¹_pH(X_{y₀}/K_v)` by F¹ = Φ.
- M⁰ = `H⁰_pH(X_{y₀}/K_v)`, a split algebra in MF(φ, N, G_v) when `Y′_{y₀}` splits over K_v, and in general Ind of units over the residue fields of `Y′_{y₀}`.
- `M^{≤1}(Φ)` = (M⁰, M¹(Φ)), a symplectic pair in MF(φ, N, G_v).
- `M^{≤1}(F¹H¹_dR(X_{y₀}))` = `H^{≤1}_pH(X_{y₀}/K_v)`.
- `M^{≤1}(Φ)` ≅ `M^{≤1}(Φ′)` iff Φ and Φ′ lie in one orbit of the ℚₚ-points of the automorphism group of the symplectic pair (H⁰_pst, H¹_pst) of the base fibre (§2.3).

**Checks.**

- For an ordinary elliptic crystalline fibre over ℚₚ, let e,f be Frobenius eigenvectors of slopes 0,1. The lines e, f, e+f form three diagonal-automorphism orbits. With F¹=e, t_H(e)=1>t_N(e)=0, so this retwist is not weakly admissible. With F¹=f the subobject pairs (t_H,t_N) are (0,0),(1,1), and with F¹=e+f they are (0,0),(0,1); both have total t_H=t_N=1. All three flags belong to the period variety.
- For A=F×F and V=F²⊕F² with the two standard forms, put D=diag(1,−1). The graph of D has dimension 2 and trace pairing ω(v,w)+ω(Dv,Dw)=0, since det D=−1. It is not A-stable: (1,0)·(v,Dv)=(v,0) is outside the graph for v≠0. It is excluded from the A-linear period variety despite being Lagrangian for the trace form.
- In a symplectic four-space with ω(e₁,f₁)=1, Φ=span(e₁,f₁) has dimension 2 but ω(Φ,Φ)≠0. The filtered pairing would send F¹⊗F¹ to a nonzero element of F² of a line whose F² is zero.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §5.1; §2.2; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract.

### 5.3 Period maps of abelian-by-finite families

Let X → Y′ → Y be an abelian-by-finite family over a smooth variety Y over a finite extension K_v of ℚₚ, y₀ ∈ Y(K_v), and `U_{y₀}` ⊆ Y^an an admissible open isomorphic to a closed polydisc over which H⁰_dR(X/Y)^an and H¹_dR(X/Y)^an have full bases of horizontal sections. Then the period map `Φ_{y₀}` of H¹_dR(X/Y) takes values in `H^an_{y₀}`, and for every y ∈ `U_{y₀}(K_v)`, `D_pH(H^{≤1}_ét(X_{y,K̄_v}, ℚₚ))` ≅ `H^{≤1}_pH(X_y/K_v)` ≅ `M^{≤1}(Φ_{y₀}(y))` as symplectic pairs in MF(φ, N, G_v). That is, the map Y(K_v) → `π₀SP(Rep^dR_{ℚₚ}(G_v))`, y ↦ [`H^{≤1}_ét(X_{y,K̄_v}, ℚₚ)`], restricted to `U_{y₀}(K_v)`, equals the composite of `Φ_{y₀}`, `M^{≤1}` and the inverse of D_pH on isomorphism classes (D_pH is injective on isomorphism classes by full faithfulness, and `M^{≤1}(Φ_{y₀}(y))` lies in its image).

Allow locally constant relative dimension over Y′ via gap:variable-rank-abelian-by-finite. No model or reduction hypothesis; K_v any finite extension of ℚₚ.

(bs, Proposition 4.11 and proof, p. 37; bs line 1882; bs, Lemma 4.8, Remark 4.9 and §4.2, pp. 36–37; bs line 1837; bs, §1.1.2, (1.2), p. 4; bs line 156).

A proof can proceed as follows. Choose horizontal bases for degrees 0 and 1. The polarised-fibre contract makes their transport preserve algebra, module and pairing and trivialises the finite étale base. The general period comparison therefore lands in the Lagrangian domain and identifies the two pairs. Full faithfulness is used on its essential image, not as an inverse functor on every filtered pair.

**Checks.**

- Consequently two points of `U_{y₀}(K_v)` with the same period value have isomorphic symplectic pairs of local representations.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §4.5; §5.1; §5.2; §4.3; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract.

### 5.4 Decomposition of the period domain over the fibre of Y′

In the setting of §5.2, let `(y′_i)_{i∈I}` be the closed points of `Y′_{y₀}`, `L_{w_i}` := K_v(y′_i) with a fixed K_v-embedding into K̄_v and `G_{w_i}` ≤ G_v. Then `H_{y₀}` = ∏_i `Res^{L_{w_i}}_{K_v} H_{y′_i}` with `H_{y′_i}` := `LGrass(H¹_dR(X_{y′_i}/L_{w_i}))` (4.3); every Φ ∈ `H_{y₀}(K_v)` is a product ∏_i Φ′_i of Lagrangian `L_{w_i}`-subspaces Φ′_i of `H¹_dR(X_{y′_i}/L_{w_i})`; and M¹(Φ) = ∏_i `Ind_{G_{w_i}}^{G_v} M¹_i(Φ′_i)` in MF(φ, N, G_v), compatibly with the symplectic structures over M⁰ ≅ ∏_i `Ind_{G_{w_i}}^{G_v} 1`, where M¹_i(Φ′_i) := (`H¹_pst(X_{y′_i}/ℚₚⁿʳ)`, `H¹_dR(X_{y′_i}/L_{w_i})` with F¹ = Φ′_i, c_dR ∘ c_BO) in `MF(φ, N, G_{w_i})`.

Let d_i be the relative dimension at y′_i, allowed to vary via gap:variable-rank-abelian-by-finite. Index the product by all closed points y′_i of the finite étale fibre, and use `H¹_dR(X_{y′_i}/L_{w_i})` in the i-th factor. Each residue extension is finite separable.

(bs, §4.2.1, (4.3) and Lemma 4.12 with proof, p. 38; bs line 1938).

A proof can proceed as follows. Decompose the finite étale fibre into its closed points with residue fields `L_{w_i}`. Apply the representing property and separable splitting of Weil restriction to the imported Lagrangian variety. The cohomology of each component viewed over K_v is its induced cohomology, which gives the product formula for M¹ and M⁰.

**Checks.**

- The dimension is the sum over i of [L_wᵢ:K_v]·dᵢ(dᵢ+1)/2. For a split degree-two base with an elliptic curve and an abelian surface, the H¹ coefficient ranks are (2,4), its total K_v-rank is B=6, and the period variety is P¹×LGr(2,4), of dimension 1+3=4. A free rank-four module over K_v×K_v would instead have total rank 8.
- For two elliptic components with residue degrees 1 and 2, the total H¹ rank is 2+4=6 and the period dimension is 1+2=3.
- A dimension-zero abelian component contributes H¹=0 and the one-point variety LGr(0,0), of dimension 0; together with an elliptic component over the split base the period variety is P¹, of dimension 1.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §5.2; §2.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction.

### Examples

For an elliptic fibre H=P¹, the algebra is the unit, and the rank-two pairing targets a line of jump 1. Thus F¹ is a line, F²=0 and ω(F¹,F¹)=0. If the finite base has closed points of degrees 1 and 2 and d=1, its period domain has dimension 1+2=3. The period line at the centre is unchanged, while at T=[[1,0],[1,1]] it is (1:−1).

### Dependencies

TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; TauCetiRoadmap.CohomologyComparisons §§6.4–6.7, naturality, cup products, trace-normalised Tate line and first Chern classes; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction. Internal dependencies are specified in each subsection.

## Layer 6: The Lawrence–Venkatesh loci and the principal trichotomy

### 6.1 S-good symplectic pairs

Let K be a number field, S a finite set of places of K and p a prime. A symplectic pair (A, V) of continuous ℚₚ-representations of G_K (§1.1) is S-good when: (i) A is unramified outside S; (ii) V is unramified, pure and integral of weight 1 outside S (WeightsInEtaleCohomology Layer R34.1); (iii) V is de Rham at every place above p with Hodge–Tate weights in {0, 1}. It is Artin S-good if moreover A has finite image. For split A this is a permutation representation and has integer Frobenius polynomials of weight 0; finite image alone does not impose integer Frobenius polynomials for an arbitrary algebra.

S is arbitrary in the definition; in the loci below it contains the places above p∞ and the places of bad reduction of the family ('suitable'). Weights are those of geometric Frobenius (q_u-Weil numbers); Hodge–Tate weights are normalised so that ℚₚ(1) has weight −1.

(bs, Definition 1.2 and Definition 6.2, pp. 2 and 43–44; bs line 55; bs, Remark 6.3, p. 44; bs line 2249).

A proof can proceed as follows. Impose ramification, purity, integrality and de Rham filtration conditions separately. Their isomorphism and restriction laws follow from the representation and period contracts. For a split algebra, algebra automorphisms permute its finitely many primitive idempotents, so the algebra action is Artin. The Artin variant gives the same interpolation loci because the algebra of a fibre is split.

The API includes the following facts.

- The three conditions (i)–(iii) on (A, V).
- S ⊆ S′ and (A, V) S-good imply (A, V) S′-good.
- S-goodness is invariant under isomorphism of symplectic pairs.
- For L/K finite, the restriction to G_L is S_L-good, S_L the places above S.
- For ψ ∈ Σ_A, the fibre V_ψ is a symplectic G_ψ-representation unramified and pure of weight 1 outside the places above S, with algebraic-integer Frobenius eigenvalues of degree over ℚ at most `dim_{ℚₚ}V`, and is de Rham above p with jumps in {0,1}. Its Frobenius polynomial need not have integer coefficients: it is a factor of the polynomial of the restricted V.
- The variant with A of finite image; it defines the same loci (Remark 6.3).

**Checks.**

- For an abelian variety A₀/K with good reduction outside S ∋ p, ∞, the pair (ℚₚ, H¹_ét(A₀,K̄, ℚₚ)) with a polarisation pairing is S-good.
- V = ℚₚ ⊕ ℚₚ(−1) with ω(e₁ ∧ e₂) a generator of L = ℚₚ(−1) is a symplectic representation with Hodge–Tate weights {0, 1}, but ℚₚ is pure of weight 0, not 1, so (ℚₚ, V) is not S-good for any S.
- For an elliptic curve E/K, (ℚₚ, `H¹_ét(E_{K̄}, ℚₚ)(1)`) has weight −1 and Hodge–Tate weights {−1, 0}; it is not S-good.
- The pair (A, 0) is S-good exactly when A is unramified outside S.
- The pair of a fibre `H^{≤1}_ét(X_{y,K̄}, ℚₚ)` at y ∈ Y(K) is S-good for suitable S (§6.5).
- S-good pairs with A = ℚₚ and V GSp-irreducible of rank 2d fall into finitely many isomorphism classes (the symplectic Faltings contract).
- A=ℚₚ[ε]/(ε²) with trivial Galois action and V=0 is S-good and Artin S-good, but not split. Thus S-goodness alone does not imply the algebra is a product of copies of ℚₚ.

- If Frobenius on two coefficient factors has eigenvalues √2 and −√2 in a coefficient field containing √2, the total polynomial is X²−2∈ℤ[X], but the factor polynomials X−√2 and X+√2 are not rational. Algebraic-integral roots survive; integer coefficients do not follow for either factor.
- Over ℚ₇ choose a primitive cube root ζ₃. On A=ℚ₇[ε]/(ε²), the finite order-three action ε↦ζ₃ε has polynomial (X−1)(X−ζ₃), whose trace 1+ζ₃ is not rational. A finite algebra action need not be a rational permutation representation; the split-algebra hypothesis excludes this example.

*Needs:* §1.1; TauCetiRoadmap.WeightsInEtaleCohomology Layer R34.1 and §R34.2, geometric-Frobenius purity and integrality; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16.

### 6.2 The Lawrence–Venkatesh locus

Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family, p a prime, v a place of K above p and S a finite set of places containing the places above p∞ and the places of bad reduction of the family (a place u is of good reduction when the family extends to an abelian-by-finite family over a smooth proper model of Y over O_u). The Lawrence–Venkatesh locus `Y(K_v)^LV_{X,S}` ⊆ Y(K_v) is the set of y_v for which some S-good pair (A, V) (§6.1) satisfies `H^{≤1}_ét(X_{y_v,K̄_v}, ℚₚ)` ≅ (A|G_v, V|G_v) as symplectic pairs of G_v-representations; (A, V) interpolates y_v. Requiring (A, V) Artin S-good gives the same set. Its split algebra has finite image and is therefore de Rham at v, so the D_pH expressions in the period-domain locus are defined.

S suitable: containing the places above p and ∞ and those of bad reduction; enlarging S enlarges the locus. Only the single place v is interpolated, unlike the adelic locus of §1.7.

(bs, Definition 1.2, p. 2, and Definition 6.2 with footnotes 20–21, pp. 43–44; bs line 55; bs, Remark 6.3, p. 44; bs line 2249).

A proof can proceed as follows. Quantify an S-good global symplectic pair and a local isomorphism with the fibre pair at v. Splitness of the fibre algebra forces splitness of the global algebra as an abstract ℚₚ-algebra, hence finite image. This gives equality with the Artin variant. Enlarging S weakens the ramification and purity requirements and enlarges the locus.

The API includes the following facts.

- `Y(K_v)^LV_{X,S}` ⊆ Y(K_v).
- S ⊆ S′ gives `Y(K_v)^LV_{X,S}` ⊆ `Y(K_v)^LV_{X,S′}`.
- Restricting to Artin S-good interpolating pairs gives the same locus.
- Y(K) ⊆ `Y(K_v)^LV_{X,S}`.
- Y(K_v)^LV_X ⊆ `Y(K_v)^LV_{X,S}` (§6.4).

**Checks.**

- For X = Y × A₀ (Y′ = Y), the constant S-good pair interpolates every point: `Y(K_v)^LV_{X,S}` = Y(K_v).
- For the conic Y: x² + y² + z² = 0 over ℚ, any family over Y and v = 2, Y(ℚ₂) = ∅, so the locus has cardinality 0: a primitive 2-adic solution would make the sum of its squares congruent modulo 4 to the number of odd coordinates, which is 1, 2 or 3.
- For the family consisting of two copies of a constant elliptic curve over Y (Y′ = Y ⊔ Y), every fibre algebra is ℚₚ × ℚₚ, with four idempotents. A global pair whose algebra is a quadratic field over ℚₚ has the same dimension 2 but only two idempotents, so it interpolates no point, whatever its module: the algebra is part of the interpolation condition.
- Dropping the pairing from the definition gives the locus of §6.6. The forms ω₁ ⊕ ω₂ and ω₁ ⊕ cω₂ of §6.6, with c a nonsquare, have the same algebra–module pair but are non-isomorphic symplectic pairs, so the pairing is part of the interpolation condition as well.

*Needs:* §6.1; §1.2; §1.7; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract.

### 6.3 The Lawrence–Venkatesh locus in the period domain

In the setting of §6.2, let y₀ ∈ Y(K_v) and `H_{y₀}` the Lagrangian period domain (§5.2). Then `H_{y₀}(K_v)^LV_{X,S}` ⊆ `H_{y₀}(K_v)` is the set of Lagrangians Φ for which some S-good pair (A, V), with A|G_v de Rham, satisfies `M^{≤1}(Φ)` ≅ (D_pH(A|G_v), D_pH(V|G_v)) as symplectic pairs in MF(φ, N, G_v). For a closed polydisc `U_{y₀}` ∋ y₀ as in §5.3, `Φ_{y₀}(U_{y₀}(K_v) ∩ Y(K_v)^LV_{X,S})` ⊆ `H_{y₀}(K_v)^LV_{X,S}`. Consequently `Y(K_v)^LV_{X,S}` is finite as soon as, for every y₀ ∈ Y(K_v), (i) `Φ_{y₀}` has Zariski-dense image in `H_{y₀}` and (ii) `H_{y₀}(K_v)^LV_{X,S}` is not Zariski dense in `H_{y₀}`.

Y is a smooth projective curve, so Y(K_v) is compact and covered by finitely many discs `U_{y₀}(K_v)` (Betts–Stix Remark 5.11 uses properness of Y).

(bs, Definition 1.7 and the paragraph after it, §1.1.2, p. 5; bs line 217; bs, Remark 5.11, p. 43; bs line 2201).

A proof can proceed as follows. Apply the period diagram to each point in the local locus. Its retwist belongs to the period-domain locus. A proper closed subvariety containing that locus has finite inverse image on a sufficiently small closed curve disc by the period-map contract and density. Properness of Y gives a finite covering by such discs and hence global finiteness.

The API includes the following facts.

- `H_{y₀}(K_v)^LV_{X,S}` ⊆ `H_{y₀}(K_v)`.
- `Φ_{y₀}(y)` ∈ `H_{y₀}(K_v)^LV_{X,S}` for y ∈ `U_{y₀}(K_v)` ∩ `Y(K_v)^LV_{X,S}`.
- Zariski density of every `Φ_{y₀}` and non-density of every `H_{y₀}(K_v)^LV_{X,S}` imply `Y(K_v)^LV_{X,S}` finite.
- Monotone in S.

**Checks.**

- If y₀ ∈ `Y(K_v)^LV_{X,S}`, the Hodge point `F¹H¹_dR(X_{y₀})` lies in `H_{y₀}(K_v)^LV_{X,S}`.
- For a constant family of positive relative dimension the period domain has positive dimension, the period map is constant and condition (i) fails; the criterion does not apply, consistently with the locus being all of Y(K_v).
- `H_{y₀}(K_v)^LV_{X,S}` is a union of orbits of the automorphism group of the pair (H⁰_pst, H¹_pst) of the base fibre (§2.3).
- Local finiteness alone does not imply global finiteness on a non-proper curve: for the Legendre family over P¹ ∖ {0, 1, ∞} over ℚₚ, the infinite set {`p^{−n}`} meets every closed disc in finitely many points (properness of Y excludes this behaviour).
- P¹(F) is covered by the two compact coordinate discs |t|≤1 and |1/t|≤1, with the second containing infinity. For the extension of |p|=p⁻¹, the points p⁻ⁿ in A¹(F) have |p⁻ⁿ|=pⁿ, unbounded, so no finite union of compact coordinate discs covers them all. Local étale charts exist in both cases; proper compactness supplies the finite cover.
- Condition (i) holds under full monodromy by the model-free extension of MordellLawrenceVenkatesh §3.18; (ii) is proved type by type in Layers 7 and 8.

*Needs:* §6.2; §6.1; §5.2; §5.3; §2.1; TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3a, 2.11, proper local-point compactness and product topology, and §2.11a, local étale charts; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract.

### 6.4 Interpolating pairs are S-good

Let X → Y′ → Y, p and S be as in §6.2 (S suitable). If (A, V) interpolates an adelic point (y_u)_u ∈ Y(A_K)^LV_X (§1.7), then (A, V) is S-good. Hence Y(K_v)^LV_X ⊆ `Y(K_v)^LV_{X,S}` for every p-adic place v.

S suitable; (A, V) interpolates at every place, which is what gives the global conditions.

(bs, Lemma 6.4, footnotes 20–21, and proof, p. 44; bs line 2249).

A proof can proceed as follows. At every good place outside S the fibre pair is unramified with integral pure weight-one degree-one representation. At every p-adic place it is de Rham with jumps 0,1. One global interpolating pair has all these restrictions, so it is S-good. Projection then gives the inclusion of loci.

**Checks.**

- For the diagonal image of y ∈ Y(K) this gives the S-goodness of `H^{≤1}_ét(X_{y,K̄}, ℚₚ)`.

*Needs:* §1.7; §6.1; §6.2; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.WeightsInEtaleCohomology Layer R34.1 and §R34.2, geometric-Frobenius purity and integrality.

### 6.5 Rational points lie in the Lawrence–Venkatesh locus

For every abelian-by-finite family X → Y′ → Y over a smooth projective geometrically connected curve Y/K, every prime p, every place v | p and every suitable S, the image of Y(K) in Y(K_v) lies in `Y(K_v)^LV_{X,S}`; each y ∈ Y(K) is interpolated by `H^{≤1}_ét(X_{y,K̄}, ℚₚ)` with its G_K-action.

S suitable for the family.

(bs, §6, after Theorem 6.5, p. 44; bs line 2249).

A proof can proceed as follows. The cohomology of the global fibre interpolates the diagonal rational point at every place. Apply the preceding S-goodness theorem and project to v.

**Checks.**

- For the constant family Y × A₀ → Y and y ∈ Y(K), the interpolating pair is (ℚₚ, `H¹_ét(A₀,K̄, ℚₚ)`) with dimensions (1, 2 dim A₀), independent of y; for the two-copy family Y′ = Y ⊔ Y of §6.2 it is (ℚₚ², `H¹_ét(A₀,K̄, ℚₚ)²`) with trivial action on the algebra, of dimensions (2, 4 dim A₀).

*Needs:* §1.7; §6.4.

### 6.6 The non-symplectic Lawrence–Venkatesh locus

In the setting of §6.2, `Y(K_v)^{LV°}_{X,S}` is defined in the same way with 'symplectic' omitted throughout: pairs (A, V) of a commutative algebra and a finite locally free A-module in ℚₚ-representations of G_K satisfying the conditions of §6.1, and isomorphisms of algebra–module pairs `H^{≤1}_ét(X_{y_v,K̄_v})` ≅ (A|G_v, V|G_v). Then `Y(K_v)^LV_{X,S}` ⊆ `Y(K_v)^{LV°}_{X,S}`. For the Kodaira–Parshin family X_q of a curve of genus g, the relative dimension is d_q = (g − 1/2)(q − 1); for a curve of genus 3 over Q the Lawrence–Venkatesh argument for `Y(K_v)^{LV°}` needs q ≥ 23 (d_q ≥ 55), while the symplectic argument of this roadmap works with q = 11 (d_q = 25) at a place where q = 11 satisfies the conditions of §8.6 (with the good-reduction form of its condition (3)).

The comparison of the two values of q uses the conditions of §8.6 (Remark 6.23(III)), the value q = 11 with n_v replaced by 2 at a place of good reduction.

(bs, Remark 1.4, p. 3; bs line 103; bs, Remark 6.23(III), p. 54; bs line 2759).

A proof can proceed as follows. Forget the line and pairing in both the global interpolant and its local isomorphism. This gives the containment. In rank two, every representation has its determinant-line alternating pairing, and an isomorphism induces the required map of determinant lines, proving equality for a single elliptic family. For the genus-three numerical comparison use §8.6 with the good-reduction bound.

The API includes the following facts.

- `Y(K_v)^{LV°}_{X,S}`: interpolation by algebra–module pairs without pairing.
- `Y(K_v)^LV_{X,S}` ⊆ `Y(K_v)^{LV°}_{X,S}`.
- Y(K) ⊆ `Y(K_v)^{LV°}_{X,S}`.

**Checks.**

- d_23(3) = 55.
- d_11(3) = 25.
- For a polarised family of elliptic curves (Y′ = Y, d = 1) the two loci coincide, taking L = ∧²V and f_L = ∧²f_V.
- For d=2, take V=W₁⊕W₂ with non-isomorphic absolutely irreducible rank-two G_K-representations, each symplectic into the same line L₀, and choose a nonsquare c∈ℚₚ^×. The forms ω₁⊕ω₂ and ω₁⊕cω₂ have identical algebra–module pairs. Schur's lemma forces any equivariant module isomorphism to have scalars a₁,a₂ on the summands, while the common line map has scalar b. Preserving the pairing requires b=a₁²=c a₂², impossible for c nonsquare. Thus the symplectic pairs are non-isomorphic.
- After forgetting the Galois action, choose symplectic bases (e_i,f_i) of those same planes. The map fixing e₁,f₁,e₂ and sending f₂ to c⁻¹f₂ identifies ω₁⊕ω₂ with ω₁⊕cω₂ with line multiplier 1. Its failure to commute with the absolutely irreducible action is essential to the preceding negative control.

*Needs:* §6.2; §6.1; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.8 and the characteristic-zero local-fibre contract.

### 6.7 The algebra of a fibre and its points

For an abelian-by-finite family X → Y′ → Y and y_v ∈ Y(K_v), `H⁰_ét(X_{y_v,K̄_v}, ℚₚ)` = `H⁰_ét(Y′_{y_v,K̄_v}, ℚₚ)` = `∏_{Y′_{y_v}(K̄_v)} ℚₚ` is a split ℚₚ-algebra, and there is a canonical G_v-equivariant bijection between its ℚₚ-algebra maps ψ to ℚₚ and `Y′_{y_v}(K̄_v)`. Such a ψ is a closed point y′_v of `Y′_{y_v}` with a K_v-embedding K_v(y′_v) → K̄_v; its stabiliser `G_{w_ψ}` is the Galois group of K_v(y′_v), so `[G_v : G_{w_ψ}]` = [K_v(y′_v) : K_v], and #Σ = `dim_{ℚₚ} H⁰_ét`.

Σ is the set of ℚₚ-points of the algebra; here the algebra is split, so #Σ equals its dimension, which fails for a non-split algebra such as `Q_{p²}`.

(bs, Remark 6.6, p. 46; bs line 2337).

A proof can proceed as follows. The abelian fibres are geometrically connected, so H⁰ is the function algebra on the geometric points of Y′_y. Its ℚₚ-algebra maps are exactly evaluations at those points. Their stabilisers are the absolute Galois groups of their residue fields, and the orbit sizes are full field degrees, not residue degrees alone.

**Checks.**

- If `Y′_{y_v}` is a single point with residue field of degree 4 over K_v, Σ is one G_v-orbit of size 4.

*Needs:* §1.2; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract.

### 6.8 The principal trichotomy

Let K be a number field, v a self-conjugate place above p (§3.1) and (A, V) a symplectic pair of continuous ℚₚ-representations of G_K with V of rank 2d > 0 over A, de Rham at the places above p, with Hodge–Tate weights in {0, 1} at v, and unramified and pure of weight 1 outside a finite set. Let Σ = `Σ_A = Hom_{ℚₚ-alg}(A, ℚₚ)`, and for ψ ∈ Σ let G_ψ ≤ G_K be its stabiliser, `G_{w_ψ}` = G_ψ ∩ G_v, and `V_ψ = ℚₚ ⊗_{A,ψ} V`. Then at least one of the following holds: (a) some ψ ∈ Σ has `[G_v : G_{w_ψ}]` ≥ 4 and V_ψ is GSp-irreducible as a symplectic representation of G_ψ; (b) some ψ ∈ Σ has `[G_v : G_{w_ψ}]` ≥ 4 and V_ψ has a non-zero isotropic G_ψ-subrepresentation W with dim F¹D_dR,w_ψ(W) ≥ ½ `dim_{ℚₚ} W` (average Hodge–Tate weight ≥ 1/2 at w_ψ); (c) the number of ψ ∈ Σ with `[G_v : G_{w_ψ}]` < 4 is at least #Σ/(d + 1). When A is split (A ≅ ℚₚ^n as a ℚₚ-algebra, as for every algebra H⁰_ét of a fibre), #Σ = `dim_{ℚₚ}(A)` and (c) reads `#{ψ : [G_v : G_{w_ψ}] < 4}` ≥ `dim_{ℚₚ}(A)/(d + 1)`.

The coefficient algebra is finite-dimensional; Σ consists of its ℚₚ-algebra maps to ℚₚ, and the conclusion uses #Σ, not dim A, unless A is split. GSp-irreducibility means absence of a nonzero stable isotropic subspace; d>0, de Rhamness above p, purity outside a finite set and self-conjugacy of v are essential inputs to the weight argument.

(bs, Proposition 6.7 and proof, pp. 46–47; Proposition 1.8 and Remark 1.9, pp. 5–6; bs line 2337; bs, §6.1, pp. 45–46; bs line 2290).

A proof can proceed as follows. Reduce to each orbit of the finite G_K-set Σ using the quotient algebra of functions on that orbit; no decomposition of a nonreduced A into those quotients is asserted. If neither (a) nor (b) holds, choose a nonzero stable isotropic W₀ of dimension m≤d. On every orbit of local size≥4, failure of (b) gives dim F¹≤(m−1)/2, whereas on a small orbit dim F¹≤m. The average-weight identity gives m#Σ/2≤(m−1)(#Σ−#Σ_<4)/2+m#Σ_<4. Thus (m+1)#Σ_<4≥#Σ and consequently (d+1)#Σ_<4≥#Σ. Sum over global orbits; if Σ is empty this is 0≥0.

**Checks.**

- For A = ℚₚ (Σ a single point fixed by G_v), (c) holds since 1 ≥ 1/(d + 1): the trichotomy says nothing for polarised abelian schemes, which is why the abelian-by-finite structure is needed.
- The Lawrence–Venkatesh division of points (their Lemmas 6.1, 6.2 and the proof of Theorem 5.4) corresponds roughly to types (b), (a) and (c) (Betts–Stix Remark 1.9).

*Needs:* §1.1; §3.1; §3.4; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16.

### 6.9 Types (a), (b), (c) and their loci

Let S be a finite set of places, p a prime and v a place above p. (a) An S-good pair (A, V) of G_K-representations is of type (a) if some ψ ∈ Σ_A has `[G_v : G_{w_ψ}]` ≥ 4 and V_ψ is GSp-irreducible as a symplectic representation of G_ψ. (b) A symplectic pair (A, V) of de Rham G_v-representations is of type (b) if some ψ ∈ Σ_A has `[G_v : G_{w_ψ}]` ≥ 4 and V_ψ has a non-zero isotropic `G_{w_ψ}`-subrepresentation of average Hodge–Tate weight ≥ 1/2. (c) For d > 0, an algebra A in G_v-representations is of type (c) if `#{ψ ∈ Σ_A : [G_v : G_{w_ψ}] < 4}` ≥ `dim_{ℚₚ}(A)/(d + 1)`. For an abelian-by-finite family of constant relative dimension d > 0 and suitable S: `Y(K_v)^LV_{X,S,(a)}` is the set of y_v interpolated by an S-good pair of type (a); `Y(K_v)^LV_{X,(b)}` the set of y_v with `H^{≤1}_ét(X_{y_v,K̄_v})` of type (b); `Y(K_v)^LV_{X,(c)}` the set of y_v with `H⁰_ét(X_{y_v,K̄_v})` of type (c). If v is self-conjugate, `Y(K_v)^LV_{X,S}` ⊆ `Y(K_v)^LV_{X,S,(a)}` ∪ `Y(K_v)^LV_{X,(b)}` ∪ `Y(K_v)^LV_{X,(c)}`.

Type (c) uses `dim_{ℚₚ}(A)`; its fibre applications use split algebras, for which dim A=#Σ_A and the cardinality form of the trichotomy applies. Type (b) is local: a global G_ψ-subrepresentation as in the trichotomy restricts to a `G_{w_ψ}`-subrepresentation.

(bs, Definition 6.8 and the containment after it, p. 47; bs line 2396).

A proof can proceed as follows. Define (a) on S-good global pairs and (b) on de Rham local pairs. Define (c) by the stated cardinality inequality; its applications use split fibre algebras. A local interpolation isomorphism transports the trichotomy alternatives. A global isotropic subrepresentation in (b) remains a local one on restriction. The resulting union is a containment and its alternatives may overlap.

The API includes the following facts.

- Type (a): an index-≥4 point with GSp-irreducible fibre, for S-good global pairs.
- Type (b): an index-≥4 point with an isotropic local subrepresentation of average Hodge–Tate weight ≥ 1/2.
- Type (c): `#{ψ : [G_v : G_{w_ψ}] < 4}` ≥ dim A/(d + 1); for the split algebra of functions on a nonempty finite G_v-set Σ this is size_v(Σ) ≥ 1/(d + 1).
- A point y_v belongs to `Y(K_v)^LV_{X,S,(a)}` exactly when there exists an S-good global pair of type (a) whose restriction to G_v is isomorphic to the symplectic étale pair of X_y_v.
- A point y_v belongs to `Y(K_v)^LV_{X,(b)}` exactly when its actual local symplectic étale fibre pair is of type (b).
- A point y_v belongs to `Y(K_v)^LV_{X,(c)}` exactly when its degree-zero étale coefficient algebra is of type (c), with the family's relative dimension d in the inequality.
- At a self-conjugate v, `Y(K_v)^LV_{X,S}` lies in the union of the three loci.
- For nonzero split A, type (c) is size_v(Σ_A) ≥ 1/(d + 1) (§8.1); #Σ_A=dim A>0 justifies division.

**Checks.**

- A = ℚₚ with trivial action is of type (c) for every d: one point in an orbit of size 1 ≥ 1/(d + 1).
- For A = `H⁰_ét((Spec L)_{K̄_v}, ℚₚ)` with L/K_v of degree 5, Σ_A is one orbit of size 5, so A is not of type (c) for any d.
- A pair with A = ℚₚ is never of type (a): the unique point has index 1 < 4.
- For V_ψ = `H¹_ét(E_{K̄}, ℚₚ)` of an elliptic curve with good ordinary reduction at w_ψ (rank two, so every line is isotropic), the unramified line is `G_{w_ψ}`-stable of Hodge–Tate weight 0 and gives nothing; type (b) needs a stable line of weight 1, which exists only when the extension of the weight-1 quotient by the unramified line splits, as for curves with complex multiplication split at w_ψ.
- Points of type (a) are handled by Faltings' lemma and dimension counts, type (b) by the general-position lemma, and type (c) by choosing the family (Layers 7 and 8).
- The ordinary elliptic-line check concerns the fibre condition only: an index-one coefficient point still gives neither type (a) nor type (b), whatever its Hodge weights.
- For a constant elliptic family with Y′=Y, every coefficient point has index 1, so the local loci (a) and (b) are empty and (c) is all of Y(K_v): their membership values at every local point are false, false, true.
- For the zero algebra A=ℚₚ^∅ and d=1, Σ_A=∅ and the cardinality definition of type (c) reads 0≥0, which is true. size_v(∅) is undefined; assigning it 0 would instead give the false inequality 0≥1/2. Only the cardinality definition applies to this algebra.

*Needs:* §6.8; §6.1; §6.2; §6.7; §1.2.

### Examples

For A=ℚₚ the unique coefficient point has index 1 and forces type (c), never type (a). A transitive quintic fibre has no orbit of size below 4 and fails type (c). The representation ℚₚ⊕ℚₚ(−1) has the correct two Hodge jumps but purity weights 0,2, so it fails S-goodness. A constant positive-dimensional family has a constant period map and cannot satisfy the density criterion.

### Dependencies

TauCetiRoadmap.HeightsRationalPointsAndObstructions §§2.3a, 2.11, proper local-point compactness and product topology, and §2.11a, local étale charts; TauCetiRoadmap.WeightsInEtaleCohomology Layer R34.1 and §R34.2, geometric-Frobenius purity and integrality; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, induction, Mackey and local restriction; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.MordellLawrenceVenkatesh §§2.1–2.4 and the model-free polarised-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.8 and the characteristic-zero local-fibre contract. Internal dependencies are specified in each subsection.

## Layer 7: Finiteness for points of types (a) and (b)

### 7.1 The finite sets T_i of local classes of type (a)

In the setting of §5.4, with S suitable, let d_i := dim `X_{y′_i}` (the relative dimension at y′_i, which may vary with i under gap:variable-rank-abelian-by-finite), δ := deg(Y′ → Y) and B := `dim_{K_v} H¹_dR(X_{y₀}/K_v)` = `Σ_j 2d_j·[L_{w_j} : K_v]`, the total rank of H¹ of the base fibre; for constant relative dimension d, B = 2dδ. Use the bounded-degree form of T_i: the set of isomorphism classes of symplectic modules D of rank 2d_i over the unit object 1 of `MF(φ, N, G_{w_i})` for which there exist: a finite extension L/K of degree ≤ δ, unramified outside S; a v-adic place w_i of L with `L_{w_i}` ≅ K_v(y′_i) over K_v; and a GSp-irreducible symplectic representation V of G_L of rank 2d_i, de Rham at the places above p and unramified and pure of weight 1 outside the places above S, every Frobenius eigenvalue there being an algebraic integer of degree over ℚ at most B; with D ≅ `D_pH,w_i(V|G_{w_i})` as symplectic filtered discrete (φ, N, `G_{w_i}`)-modules. `H_{y′_i}(L_{w_i})_(a)` ⊆ `H_{y′_i}(L_{w_i})` is the set of Lagrangians Φ′_i with [M¹_i(Φ′_i)] ∈ T_i.

Assume d_i>0 for every i in this type-(a) construction, so B≥1. S suitable; L ranges over extensions of degree at most δ inside a fixed algebraic closure.

(bs, Definition 6.11 and the proof of Proposition 6.9, pp. 48–49; bs lines 2472 and 2511; the bounded-degree form here also uses the symplectic Faltings supplier contract).

The integral-polynomial classes of bs Definition 6.11 form a subset of this T_i: each eigenvalue then has degree at most 2d_i≤B. This bounded-degree variant also contains every coefficient fibre of an S-good pair of total dimension B. A bound 2d_iδ computed from one component would be too small when the relative dimension varies: for Y′ = Y ⊔ Y with relative dimensions 1 and 2, the total rank is 6 while 2d_1δ = 4.

A proof can proceed as follows. Fix the base fibre and its residue fields before ranging over global extensions of bounded degree. For each local class, the orbit criterion gives either one symplectic automorphism orbit of Lagrangians or no orbit when its discrete data do not match. The finite union follows after §7.2.

The proof of the type-(a) factor claim uses B fixed before the representations range. At a place w over u outside S, a fibre eigenvalue is a power of an eigenvalue of the total S-good representation, whose monic polynomial in ℤ[X] has degree dim V = B, since V|G_v is isomorphic to H¹ of a fibre in the disc around y₀. Taking powers cannot increase its algebraic degree. Thus the enlarged class set contains the actual fibre without assuming a rational polynomial for that factor.

The API includes the following facts.

- T_i ⊆ π₀(symplectic 1-modules of rank 2d_i in `MF(φ, N, G_{w_i})`).
- `H_{y′_i}(L_{w_i})_(a)` = {Φ′_i : [M¹_i(Φ′_i)] ∈ T_i}.
- The bounded-degree class set T_i is finite (§7.2).
- `H_{y′_i}(L_{w_i})_(a)` is a finite union of `Aut^GSp(H¹_pst(X_{y′_i}))(ℚₚ)`-orbits (§2.3).

**Checks.**

- If δ = 1 (Y′ = Y), only L = K occurs, and T_i consists of the local classes of GSp-irreducible weight-one representations of G_K unramified outside S with the bound B=2d_i on algebraic-integer Frobenius eigenvalues.
- For a closed point y′_i of degree one (K_v(y′_i) = K_v), d_i = 1 and an elliptic curve E/K with good reduction outside S and no CM, `D_pH,w(H¹_ét(E_{K̄}, ℚₚ)|G_w)` lies in T_i, with L = K (H¹ of a non-CM elliptic curve is irreducible, hence GSp-irreducible).
- The class D_pH,w(ℚₚ ⊕ ℚₚ(−1)) is not produced by this pair, which is not GSp-irreducible (and not pure of weight 1): only GSp-irreducible representations contribute.
- Each class in T_i contributes either no Lagrangians, when its underlying unfiltered symplectic module is not that of the fixed fibre, or exactly one automorphism orbit, by the orbit lemma.
- If `[L_{w_i} : K_v]` ≥ 4, `H_{y′_i}(L_{w_i})_(a)` is not Zariski dense in `Res^{L_{w_i}}_{K_v} H_{y′_i}` (§7.3).
- If δ=1 and the chosen local discrete data disagree with every qualifying global class, the associated Lagrangian set is empty, even though the ambient period variety is nonempty.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh gap:variable-rank-abelian-by-finite; §5.2; §5.4; §2.1; §6.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16 and gap:symplectic-faltings-finiteness; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract.

### 7.2 Finiteness of the sets T_i

Each set T_i of §7.1 is finite.

S finite; δ, d_i and the root-degree bound B of §7.1 are fixed.

(bs, Lemma 6.12, p. 48; bs line 2481; the bounded-degree variant uses the symplectic Faltings supplier contract).

A proof can proceed as follows. Hermite finiteness bounds the extensions L/K of degree≤δ unramified outside S. For each field the bounded-degree symplectic Faltings contract gives finitely many qualifying global classes, and each field has finitely many places above v. Taking their local realisations gives finitely many classes T_i. For the bounded-degree variant, the finite Frobenius test set for semisimple representations reduces to finitely many traces: each eigenvalue is an algebraic integer of bounded degree and has every complex absolute value prescribed by the fixed weight and place. Bounding the elementary symmetric functions bounds its integer minimal polynomial, so only finitely many such eigenvalues occur. The same symplectic-conjugacy argument as in the integral-polynomial case gives finiteness of the symplectic classes.

**Checks.**

- Let E:y²=x³−x over ℚ, p=3, S={2,3,∞} and W=H¹_ét(E,ℚ₃). The hyperbolic pair V=W⊕W∨(−1), with pairing ω: ∧²V → ℚ₃(−1), ((w,α),(w′,α′)) ↦ α′(w)−α(w′), has rank 4, jumps 0,0,1,1, is de Rham above p and unramified and pure of weight 1 outside S. At 5, #E(𝔽₅)=8, so its Frobenius polynomial is (X²+2X+5)² and every eigenvalue has degree 2≤B=4. The subspace W⊕0 is a stable isotropic plane. Thus this global pair satisfies the representation conditions for d_i=2 except GSp-irreducibility; a definition omitting that condition admits it.

*Needs:* §7.1; TauCetiRoadmap.ArithmeticGaloisDuality §R02.3.1, Hermite finiteness with bounded degree and ramification set; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16 and gap:symplectic-faltings-finiteness.

### 7.3 Non-density of type (a) Lagrangians after Weil restriction

If `[L_{w_i} : K_v]` ≥ 4, then `H_{y′_i}(L_{w_i})_(a)` is not Zariski dense in `Res^{L_{w_i}}_{K_v} H_{y′_i}`. It may be dense in `H_{y′_i}` itself; the Weil restriction to K_v is essential.

`[L_{w_i} : K_v]` ≥ 4 and d_i ≥ 1.

(bs, Lemma 6.13, Remark 6.14 and proof, pp. 48–49; bs line 2445).

A proof can proceed as follows. Each orbit has dimension at most d_i(2d_i+1), after removing the central scalar dimension from the similitude bound. The finite union remains bounded by that number. The Weil-restricted domain has dimension r d_i(d_i+1)/2. For r≥4 the difference is at least d_i>0. The rational-point subset lies in a proper closed subvariety over K_v by scalar extension and the base-change/Weil-restriction adjunction.

**Checks.**

- For d_i = 1 and `[L_{w_i} : K_v]` = 4: the orbits have dimension ≤ 3 while Res `H_{y′_i}` = Res P¹ has dimension 4.
- For `[L_{w_i} : K_v]` = 3 and d_i = 1 the count 3 ≤ 3 gives nothing, which is why index ≥ 4 appears.
- For d_i=2 and residue degree 4 the bounds are 10 for the orbit and 12 for the domain; the strict gap is 2.

*Needs:* §7.1; §7.2; §2.3; §2.4; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction.

### 7.4 Non-density of the type (a) period locus

For y₀ ∈ Y(K_v), let `H_{y₀}(K_v)^LV_{X,S,(a)}` be the set of Lagrangians Φ ∈ `H_{y₀}(K_v)` for which some S-good pair (A, V) of type (a) satisfies `M^{≤1}(Φ)` ≅ (D_pH(A|G_v), D_pH(V|G_v)) as symplectic pairs in MF(φ, N, G_v). Then `H_{y₀}(K_v)^LV_{X,S,(a)}` is not Zariski dense in `H_{y₀}`.

S suitable; any abelian-by-finite family of positive relative dimension, with the interpolating algebra de Rham at v (no monodromy hypothesis here).

(bs, Proposition 6.9 and proof, pp. 48–49; bs line 2445).

A proof can proceed as follows. A type-(a) global interpolant supplies a geometric coefficient point of index≥4. The interpolation algebra isomorphism carries it to a geometric point over one closed component y′_i, with a chosen residue-field embedding. Its corresponding period factor belongs to the type-(a) factor locus. The finite product decomposition and a finite union of proper closed factor conditions give non-density.

The API includes the following facts.

- The type-(a) period locus is contained in the full S-good period locus of §6.3.
- If suitable sets satisfy S⊆S′, the type-(a) period locus for S is contained in that for S′.
- The locus is invariant under the ℚₚ-points of the automorphism group of the unfiltered symplectic pair (H⁰_pst,H¹_pst): an automorphism identifies the corresponding retwists, so the same global interpolant works.
- On a disc as in §5.3, the period image of the type-(a) local locus is contained in this period locus.
- The type-(a) period locus has proper Zariski closure in H_y₀, without a full-monodromy assumption.

**Checks.**

- If every closed point of `Y′_{y₀}` has residue degree < 4 over K_v, the set is empty: type (a) needs an index-≥4 point.
- Let L/K have degree 4 and a place w with [L_w:K_v]=4, and let E/K be a non-CM elliptic curve. For the constant family over Y′=Y×_K Spec L with elliptic fibre E_L, choose suitable S. The global fibre pair is S-good and its coefficient fibre H¹_ét(E_L,ℚₚ) is GSp-irreducible. Its actual Hodge point therefore belongs to the type-(a) period locus: the index is 4, d=1 and the cohomology ranks over K_v are (4,8). The degree-one constant elliptic family instead has index 1 and empty type-(a) locus. Thus the locus is not defined to be empty, and these tests require no full monodromy.
- At (d,r)=(1,4), the scalar-quotiented orbit bound is 1·(2·1+1)=3 while the Weil-restricted period domain has dimension 4·1·2/2=4. At r=3 both numbers are 3, so this dimension argument gives no non-density there. A definition giving the whole domain at r=4 or extending this strict inequality to r=3 fails these tests.

*Needs:* §7.1; §7.3; §5.4; §5.2; §6.9; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract.

### 7.5 Finiteness of the type (a) locus under full monodromy

If X → Y′ → Y has full monodromy (MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract, for some complex embedding of K_v), then `Y(K_v)^LV_{X,S,(a)}` is finite.

Y a smooth projective geometrically connected curve; S suitable.

(bs, Corollary 6.10 and proof, p. 48; bs line 2445).

A proof can proceed as follows. Full monodromy makes the model-free period map dense on each chosen disc. Type-(a) non-density then gives finitely many points on that disc. Properness supplies a finite disc cover.

**Checks.**

- Applies to the Kodaira–Parshin families, which have full monodromy (MordellLawrenceVenkatesh Layer LV.10, Kodaira–Parshin full monodromy).

*Needs:* §7.4; §5.3; §6.3; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract.

### 7.6 Non-density of type (b) Lagrangians after Weil restriction

If `[L_{w_i} : K_v]` ≥ 4, then the set `H_{y′_i}(L_{w_i})_(b)` of Lagrangian `L_{w_i}`-subspaces Φ′_i of `H¹_dR(X_{y′_i}/L_{w_i})` for which M¹_i(Φ′_i) has a non-zero isotropic filtered (φ, N, `G_{w_i}`)-submodule D with `dim_{L_{w_i}} F¹D_dR ≥ ½ dim_{ℚₚⁿʳ} D_pst` is not Zariski dense in `Res^{L_{w_i}}_{K_v} H_{y′_i}`.

`[L_{w_i} : K_v]` = r ≥ 4. The submodule D is a sub-object in `MF(φ, N, G_{w_i})`: its D_pst is φ-stable.

(bs, Lemma 6.17, (6.1) and proof, pp. 50–51; bs line 2549; bs, Sublemma 6.18 and Remark 6.19, p. 51; bs line 2614).

A proof can proceed as follows. Split the Weil restriction over K̄_v into the factors indexed by all residue-field embeddings. Choose lifts whose action on ℚₚⁿʳ is an integral Frobenius power. A φ-stable isotropic submodule gives one common isotropic subspace in these realisations, meeting each of the r filtrations in at least half its dimension. The four-isotropic-Lagrangian contract places these tuples in a proper closed subset. This uses the condition simultaneously for every embedding.

**Checks.**

- In a symplectic plane (d=1), an isotropic line W has dimension 1, so half-meeting a Lagrangian line requires intersection dimension at least 1: W must equal that line. For r=3, three distinct lines therefore have no common W. The coarse type-(a) dimension count is 3=3 (§7.3), but gives no obstruction to this type-(b) argument.
- Over K̄_v, for d=1 and r=4 the lines span(e), span(f), span(e+f), span(e+2f) are distinct, including in residue characteristic 2 because K_v has characteristic zero. No line equals all four, so no common half-meeting isotropic line exists.
- If all r filtrations equal span(e), W=span(e) meets each in dimension 1≥1/2; the exceptional locus is nonempty and the distinct-line condition in the preceding Checks is necessary.

*Needs:* §5.2; §5.4; §2.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction.

### 7.7 Non-density of the type (b) period locus

For y₀ ∈ Y(K_v), let `H_{y₀}(K_v)^LV_{X,(b)}` be the set of Φ ∈ `H_{y₀}(K_v)` with `M^{≤1}(Φ)` ≅ (D_pH(A), D_pH(V)) for some symplectic pair (A, V) of de Rham G_v-representations of type (b). Then `H_{y₀}(K_v)^LV_{X,(b)}` is not Zariski dense in `H_{y₀}`.

Use the pair `M^{≤1}(Φ)`, with its algebra and pairing, and require the interpolating local pair to be de Rham so D_pH is defined.

(bs, §6.3, Proposition 6.15 and proof, pp. 49–52; bs line 2493).

A proof can proceed as follows. A type-(b) local pair gives a residue-field factor of degree≥4 with an isotropic subrepresentation of average jump≥1/2. Apply the factor non-density result to its D_pH subobject and use the product decomposition of the domain. No global finiteness theorem enters this step.

The API includes the following facts.

- The type-(b) period locus is invariant under the ℚₚ-points of the automorphism group of the unfiltered symplectic pair (H⁰_pst,H¹_pst), since its action identifies retwists and preserves the witnessing local pair.
- On a disc as in §5.3, the period image of Y(K_v)^LV_X,(b) is contained in this period locus, using the actual local étale fibre pair as witness.
- The type-(b) period locus has proper Zariski closure in H_y₀; no full-monodromy or global S-good condition is required.

**Checks.**

- For Y′=Y, the coefficient set has one point of index 1<4, so the period locus is empty even if the elliptic fibre has a stable weight-one line. The index condition cannot be omitted.
- Take F=ℚ₅, L/F unramified of degree 4 and the constant family with finite base Y_F×_F Spec L and elliptic fibre E_L for E:y²=x³−x. Here #E(𝔽₅)=8 gives the unit trace a₅=−2, so the reduction is ordinary; the CM field ℚ(i) splits at 5. The two CM summands of H¹_ét have jumps 0 and 1. The weight-one line W is stable, has dimension 1 and is isotropic, with dim F¹D_dR(W)=1 and average jump 1≥1/2. Since the coefficient index is 4, the actual Hodge point belongs to the type-(b) period locus. Replacing this locus by the empty set would lose this point.
- In the common symplectic plane obtained in §7.6 after splitting a degree-four factor, consider the four filtration lines span(e), span(f), span(e+f), span(e+2f). Their pairwise intersection dimensions are 0; a nonzero isotropic W would be a line and would need intersection dimension at least 1 with every one. The first two already force W=span(e)=span(f), impossible. Thus any period point with this tuple is excluded. Choosing a different line W for each embedding would incorrectly give four intersections of dimension 1.

*Needs:* §7.6; §5.4; §5.2; §6.9; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract.

### 7.8 Finiteness of the type (b) locus under full monodromy

If X → Y′ → Y has full monodromy, then `Y(K_v)^LV_{X,(b)}` is finite.

Y a smooth projective geometrically connected curve.

(bs, Corollary 6.16, p. 50; bs line 2549).

A proof can proceed as follows. Apply dense model-free periods and type-(b) non-density on each disc. Properness gives finitely many discs and hence finiteness of the entire local locus.

**Checks.**

- Applies to the Kodaira–Parshin families.

*Needs:* §7.7; §5.3; §6.3; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract.

### Examples

At d=1 and residue degree 4 the orbit bound is 3<4, while degree 3 gives 3=3 and no conclusion. At d=2 and residue degree 4 it is 10<12. In a symplectic plane, the four lines span(e), span(f), span(e+f), span(e+2f) have no common nonzero isotropic line meeting all four: a line meeting both of the first two nontrivially would equal both. This is a characteristic-zero example of the four-Lagrangian input.

### Dependencies

TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.3, 8.1–8.2 and the horizontal-period contract; TauCetiRoadmap.ArithmeticGaloisDuality §R02.3.1, Hermite finiteness with bounded degree and ramification set; TauCetiRoadmap.MordellLawrenceVenkatesh §§3.1–3.19 and the model-free period-map contract; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31, polarised cohomology and Weil restriction; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract. Internal dependencies are specified in each subsection.

## Layer 8: Kodaira–Parshin families and points of type (c)

### 8.1 The proportion of points in small G_v-orbits

Let K_v be a finite extension of ℚₚ and Σ a non-empty finite set with a continuous action of G_v. Then size_v(Σ) := #{x ∈ Σ : the G_v-orbit of x has fewer than 4 elements}/#Σ ∈ [0, 1]. If f: Σ → Σ′ is G_v-equivariant and surjective and all its fibres have the same positive cardinality, then size_v(Σ) ≤ size_v(Σ′). For a nonzero split algebra A in G_v-representations and d > 0, A is of type (c) (§6.9) exactly when size_v(Σ_A) ≥ 1/(d + 1); here #Σ_A=dim A>0.

The threshold 4 replaces the threshold 8 of Lawrence–Venkatesh Definition 5.2 (Betts–Stix footnote 22); the result MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract states the Lawrence–Venkatesh version for unramified sets and Frobenius orbits, while here Σ is any finite continuous G_v-set.

(bs, Proof of Proposition 6.20 and footnote 22, p. 52; bs line 2666).

A proof can proceed as follows. Count the small-orbit subset and divide by the positive cardinality. An equivariant map carries every small orbit into a small orbit. For a surjection with constant positive fibre size c, the small-source subset lies in the inverse image of the small-target subset, of cardinality c times its size; dividing by c#Σ′ proves monotonicity. A disjoint union gives the weighted average.

The API includes the following facts.

- size_v(Σ) = #{x : #(G_v·x) < 4}/#Σ.
- 0 ≤ size_v(Σ) ≤ 1.
- size_v(Σ) ≤ size_v(Σ′) for an equivariant map surjection with fibres of equal positive size.
- For nonzero split A, type (c) iff size_v(Σ_A) ≥ 1/(d + 1).
- For two nonempty finite G_v-sets, size_v of their disjoint union is the weighted average of their proportions, with weights their cardinalities. An empty summand contributes zero to the numerator and denominator counts without requiring size_v(∅).

**Checks.**

- For a trivial action, size_v(Σ) = 1.
- For Σ = `Hom_{K_v}(L, K̄_v)` with [L : K_v] = 5, size_v(Σ) = 0.
- For Σ = `Hom_{K_v}(L₃, K̄_v)` ⊔ `Hom_{K_v}(L₄, K̄_v)` with [L₃ : K_v] = 3, [L₄ : K_v] = 4, size_v(Σ) = 3/7.
- The monotonicity needs equal fibres even for surjections: use the unramified quotient G_v→C₄ and take Σ to be four fixed points disjoint union a regular C₄-orbit, and Σ′ one fixed point disjoint union that orbit. Collapse the four fixed points and use the identity on the regular orbit. The five fibre sizes are 4,1,1,1,1, all positive, but size_v(Σ)=4/8=1/2>1/5=size_v(Σ′).
- For the regular S₃-set, the single orbit has size 6 and the proportion is 0; for the S₃-set S₃/C₂ it is 1 because all three points have orbit size 3. The threshold concerns the whole acting group, not a chosen generator.
- For A=0=ℚₚ^∅ and d=1, type (c) is the true inequality 0≥0, while size_v(Σ_A) is undefined (totalising 0/0 to 0 would give 0≥1/2, false). For A=ℚₚ the two valid forms are 1≥1/2 and 1≥1/2; for the function algebra on a transitive five-point set they are 0≥5/2 and 0≥1/2, both false. Family fibres are nonempty because Y′→Y is a covering.

*Needs:* Mathlib `MulAction.orbit`; TauCetiRoadmap.LocalFieldsRamification Layers 2 and 4, the unramified quotient for the C₄ Check; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract; §6.9.

### 8.2 Counting the quadratic and cubic extensions of a local field

For a finite extension K_v of ℚₚ let n_v be the number of subfields L ⊆ K̄_v with [L : K_v] ∈ {2, 3}. Then n_v is finite and bounded in terms of [K_v : ℚₚ] (so, for places of a number field K, in terms of K). If v ∤ 6 then n_v = 7: K_v has three quadratic extensions; if q_v ≡ 1 mod 3 it has four cubic extensions, all Galois, and if q_v ≡ 2 mod 3 it has one Galois cubic extension and three conjugate non-Galois ones.

The count is of subfields of a fixed algebraic closure; conjugate non-Galois extensions are counted separately.

(bs, Remark 6.21, p. 53; bs line 2712).

A proof can proceed as follows. An index-m subgroup determines a transitive action on m points. If the full local Galois group has d=[F:ℚₚ]+2 generators, there are at most (m!)^d homomorphisms to S_m, so finitely many such subgroups and a bound depending only on d. For p≥5 use the tame relation to count three quadratic and four cubic subfields. Count conjugate nonnormal cubic subgroups separately.

The API includes the following facts.

- The set of embedded subfields of degrees 2 or 3 is finite, so n_v is a natural number counting fields, rather than isomorphism classes.
- Any K_v-isomorphism between two algebraic closures induces a degree-preserving bijection on these subfields; hence n_v is independent of the chosen closure.
- Writing t=[K_v:ℚₚ]+2, one has n_v≤2^t+6^t, by counting homomorphisms to S₂ and S₃. Thus the bound depends only on the local degree.
- For residue characteristic at least 5, the quadratic and cubic counts are 3 and 4, giving n_v=7. The four cubic fields are all normal when q_v≡1 modulo 3, and otherwise consist of the unramified cubic and three conjugate nonnormal fields.

**Checks.**

- For ℚ₅ the quadratic fields are ℚ₅(√2), ℚ₅(√5), ℚ₅(√10); the cubic fields are the unramified one and ℚ₅(ζ₃ʲ·5^(1/3)), j=0,1,2. Thus n_v=3+1+3=7. The three ramified cubics are conjugate but distinct, so counting cubic isomorphism classes instead gives 2 and the wrong total 3+2=5.
- For ℚ₇ the three quadratic fields and the four normal cubic fields give n_v=3+4=7. Since ℚ₇ contains μ₃, Kummer theory gives (3²−1)/(3−1)=4 cubic fields, one unramified and three totally ramified; this differs from the normality pattern over ℚ₅.
- Over ℚ₂ there are eight square classes, represented by ±1,±2,±5,±10; omitting the square class 1 leaves seven quadratic fields. Cubic extensions are tame: besides the unramified cubic there are the three distinct conjugates ℚ₂(ζ₃ʲ·2^(1/3)), j=0,1,2. Hence n_v=7+4=11, excluding an extension of the formula n_v=7 to residue characteristic 2. The square-class input is LocalFieldsRamification Layer 1; the cubic count uses its Layers 2 and 4.

*Needs:* TauCetiRoadmap.LocalFieldsRamification Layers 0–2 and 4, finite extensions, power classes, unramified extensions and the tame quotient; TauCetiRoadmap.ClassFieldTheory Layer 5, the Kummer correspondence for the quadratic and normal cubic Checks; Mathlib `IntermediateField`; TauCetiRoadmap.LocalGaloisGroups Layer 7.

### 8.3 Few torsion classes lie in small G_v-orbits

Let Y be a smooth projective geometrically connected curve of genus g over a finite extension K_v of ℚₚ, and k ≥ 1 an odd integer prime to p with gcd(k, q_v^i − 1) = 1 for i = 1, 2, 3. Let M := `H¹_ét(Y_{K̄_v}, ℤ/k)` ≅ `(ℤ/k)^{2g}` with its G_v-equivariant perfect alternating Weil pairing M × M → μ_k^∨. For every open G_w ≤ G_v of index 2 or 3, `M^{G_w}` is isotropic, so `#M^{G_w}` ≤ k^g; hence at most n_v·k^g elements of M lie in G_v-orbits of size less than 4.

p ∤ k, so μ_k is unramified at v and an element of G_v acts on it through its image in the Galois group of the residue field. No reduction hypothesis on Y at v (contrast MordellLawrenceVenkatesh Layer LV.11, admissible primes and the Mordell theorem, which uses good reduction).

(bs, Proof of Proposition 6.20, p. 53; bs line 2712).

A proof can proceed as follows. For a subgroup of index 2 or 3 its residue degree f is 1,2 or 3. A Frobenius lift acts on μ_k∨ by q_v^(−f). The coprimality hypothesis makes q_v^f−1 invertible modulo k, so the pairing of two fixed classes is zero. The finite symplectic cardinality bound is then k^g. Every orbit of size 2 or 3 is fixed by its stabiliser; a globally fixed element is also fixed by a quadratic subgroup. The union bound gives n_v k^g.

**Checks.**

- For g = 2, k = 5 and q_v = 7 (gcd(5, 6) = gcd(5, 48) = gcd(5, 342) = 1, and n_v = 7 since v ∤ 6): at most 7·25 = 175 of the 625 elements of M lie in small orbits.

*Needs:* §8.2; TauCetiRoadmap.MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18; TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§0.3, 0.5, curve H¹ duality and equivariant alternating cup product; Mathlib `MulAction.orbit`.

### 8.4 Kodaira–Parshin families have no points of type (c)

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K, v a finite place above p, and X_q → Y′_q → Y the Kodaira–Parshin family with parameter an odd prime q (MordellLawrenceVenkatesh Layer LV.8 and the characteristic-zero local-fibre contract), of relative dimension d_q = (g − 1/2)(q − 1). Suppose (1) q − 1 is divisible neither by 4 nor by any odd prime dividing q_v(q_v + 1)(q_v³ − 1), and (2) q − 1 ≥ 9n_v. Then `Y(K_v)^LV_{X_q,(c)}` = ∅; equivalently `size_v(Y′_{q,y}(K̄_v))` < 1/(d_q + 1) for every y ∈ Y(K_v).

The odd primes dividing q_v(q_v + 1)(q_v³ − 1) are those dividing `q_v·∏_{i≤3}(q_v^i − 1)`; in particular 3 always divides it, so condition (1) excludes 3 | q − 1. Put k = (q − 1)/2; condition (1) makes k odd, prime to p, and coprime to q_v^i − 1 for i ≤ 3.

(bs, §6.4, Proposition 6.20 and proof, footnotes 22–24, pp. 52–53; bs line 2666).

A proof can proceed as follows. The local-fibre contract gives an equivariant equal-fibre surjection from the finite base fibre to primitive cyclic characters modulo k. Their number is `k^(2g)∏_{r|k}(1−r^(−2g))`, strictly larger than k^(2g)/ζ(2g). The small-orbit count and equal-fibre comparison bound the proportion by ζ(2g)n_v/k^g. Since g≥2, ζ(2g)≤ζ(4)=π⁴/90<9/8, and 2k=q−1≥9n_v implies the proportion is less than 1/(4k^(g−1)). With k>1, 4k^(g−1)>(2g−1)k+1, giving strict exclusion of type (c).

**Checks.**

- For g = 2 and v ∤ 6 (n_v = 7), condition (2) asks q − 1 ≥ 63.
- The proof never uses good reduction of Y or of the family at v, nor that v is unramified over Q.

*Needs:* TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.8 and the characteristic-zero local-fibre contract; TauCetiRoadmap.MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18; §8.1; §8.3; §8.2; §6.9; §6.7; Mathlib `hasSum_zeta_four`.

### 8.5 Choosing the Kodaira–Parshin parameter

For every finite place v of K there is an odd prime q satisfying the conditions of §8.4; for such q the Kodaira–Parshin family X_q → Y′_q → Y has constant positive relative dimension, full monodromy, and `Y(K_v)^LV_{X_q,(c)}` = ∅.

K is a number field, Y/K is a smooth projective geometrically connected curve of genus g≥2, and v is any finite place. The auxiliary prime q may depend on v through its residue cardinality and n_v.

(bs, Corollary 6.22 and proof, p. 53; bs line 2712).

A proof can proceed as follows. Let R be the product of the odd primes dividing q_v(q_v+1)(q_v³−1). Choose a unit residue class q≡3 mod 4 and q≡2 mod r for every r|R. Dirichlet supplies primes in this class above any prescribed bound; choose q−1≥9n_v. The family and its full monodromy are the supplied Kodaira–Parshin results.

**Checks.**

- For q_v = 2 the odd primes of q_v(q_v + 1)(q_v³ − 1) = 42 are 3 and 7, so q = 11 satisfies condition (1) of §8.4 (10 is divisible by neither 4, 3 nor 7); condition (2) then needs q − 1 ≥ 9n_v, which at a place above 2 requires a larger q.

*Needs:* §8.4; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.10, Kodaira–Parshin full monodromy; §8.2; Mathlib `Nat.forall_exists_prime_gt_and_eq_mod`.

### 8.6 Which pairs (v, q) the argument covers

Let Y have genus g ≥ 2. The argument of this roadmap proves `Y(K_v)^LV_{X_q,S}` finite whenever (1) v is self-conjugate, (2) q − 1 is divisible neither by 4 nor by any odd prime dividing `q_v·∏_{i≤3}(q_v^i − 1)`, and (3) n_v·ζ(2g)·2^g/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1), where n_v may be replaced by 2 when Y has good reduction at v (then M is unramified and only the two unramified subgroups of index 2 and 3 matter). The original argument of Lawrence–Venkatesh needs (1°) v friendly and v ∤ 2, (2°) the analogue of (2) with i ≤ 7, (3°) the analogue of (3) with 4 in place of n_v, and (4°) a good model of the Kodaira–Parshin family over O_v. (I) When K has no CM subfield, for 100% of places (natural density) some q satisfies (1°)–(4°); (II) (1°)–(4°) fail for every q at places ramified over Q, at places above 2 and at places of bad reduction of Y; (III) for curves of genus 3 over ℚ, the least q satisfying (1°)–(4°) at some place is 23, while (1)–(3), with the good-reduction form of (3), allow q = 11 at some place. These minima depend on the residue cardinalities available in K and are not asserted for an arbitrary number field.

(bs, Remark 6.23 (I)–(III), pp. 53–54; bs line 2712; bs, §1, Remark 1.3 and footnote 1, p. 3; bs line 103).

A proof can proceed as follows. For the density-one assertion choose r₀ above 100, every odd divisor of the Galois-closure degree and every rational prime ramified in that closure. Take the least prime q≡3 mod 4 and q≡2 modulo every odd prime<r₀. The Linnik contract and elementary prime estimates give log q=O(r₀). Every odd divisor of q−1 is≥r₀, so there are O(r₀/log r₀) such divisors. Cyclotomic ramification and the ramified-prime bound give disjointness from the Galois closure. Chebotarev bounds the permitted-place density below by `∏_{r|q−1,r odd}max(1−18/(r−1),0)`, which tends to 1. The other comparison assertions follow by testing the stated inequalities; they impose no restriction on the end theorem’s set of places.

**Checks.**

- For g = 3 and q = 11: d_q = 25; for q = 23: d_q = 55 (§6.6).
- Over ℚ with g = 3: every q_v makes 3, 5 and 7 divide `q_v·∏_{i≤7}(q_v^i − 1)`, so q − 1 ≡ 2 mod 4 must avoid 3, 5, 7; q = 3 fails (3°) since 4·ζ(6)·8/8 > 1/6, and q = 7, 11, 19 are excluded, leaving 23, with 4·ζ(6)·8/22³ ≈ 0.0031 < 1/56. For (1)–(3), q = 11 works at a good place with q_v ≡ 2 or 3 mod 5, since 2·ζ(6)·8/10³ ≈ 0.0163 < 1/26.
- Over the totally real field K = ℚ(√5, ζ₁₁ + ζ₁₁⁻¹) every residue cardinality q_v = p^f with p ≠ 5 satisfies q_v ≡ ±1 mod 5, because f is a multiple of the residue degree of p in ℚ(√5), which is 2 exactly when p ≡ ±2 mod 5 (including p = 2); likewise q_v ≡ ±1 mod 11 for p ≠ 11, because f is a multiple of the order of p in (ℤ/11)^×/{±1} = Gal(ℚ(ζ₁₁ + ζ₁₁⁻¹)/ℚ). Hence 5 divides q_v(q_v² − 1) and 11 divides q_v(q_v² − 1) at every place, so q = 11 violates (2) and q = 23 violates (2°) everywhere: the genus-three minima over ℚ do not transfer to this K.

*Needs:* §8.4; §8.5; §3.1; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.11, admissible primes and the Mordell theorem; TauCetiRoadmap.Chebotarev Layers 10, 13 and 14, Dirichlet density, prime counting and natural density; TauCetiRoadmap.AnalyticNumberTheoryPartI §0.32 and gap:linnik-polynomial-least-prime.

### Examples

Over ℚ₅ the quadratic subfields are ℚ₅(√2), ℚ₅(√5), ℚ₅(√10), and the four cubic subfields comprise the unramified one and the three conjugates generated by ζ₃ʲ·5^(1/3), so nᵥ=7. For genus 2, k=5 and residue cardinality 7, the small-orbit bound is 7·25=175 out of 625 classes. For residue cardinality 5 the prime q=83 gives k=41, d_q=123 and 82≥9·7=63; the forbidden odd divisors are 3,5,31 and none divides 82. The estimate (9/8)·7/41²=63/13448 is less than 1/124. The pairing-line Frobenius on μ₄₁∨ is 5⁻¹=33 modulo 41, not 5.

### Dependencies

TauCetiRoadmap.LocalFieldsRamification Layer 1, power classes and the dyadic square-class count; TauCetiRoadmap.ClassFieldTheory Layer 5, Kummer theory; Mathlib `MulAction.orbit`; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract; TauCetiRoadmap.LocalFieldsRamification Layers 0, 2 and 4; Mathlib `IntermediateField`; TauCetiRoadmap.MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18; TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§0.3, 0.5, curve H¹ duality and equivariant alternating cup product; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.8 and the characteristic-zero local-fibre contract; Mathlib `hasSum_zeta_four`; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.10, Kodaira–Parshin full monodromy; Mathlib `Nat.forall_exists_prime_gt_and_eq_mod`; TauCetiRoadmap.MordellLawrenceVenkatesh §§1.2, 1.4–1.16; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.11, admissible primes and the Mordell theorem; TauCetiRoadmap.Chebotarev Layers 10, 13 and 14, Dirichlet density, prime counting and natural density. Internal dependencies are specified in each subsection.

## Layer 9: Finiteness of the Lawrence–Venkatesh locus and Theorems A and B

### 9.1 Finiteness of the Lawrence–Venkatesh locus at self-conjugate places

Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2 and v a self-conjugate place of K. Then there is an abelian-by-finite family X → Y′ → Y, namely the Kodaira–Parshin family X_q for any q as in §8.5, such that `Y(K_v)^LV_{X,S}` is finite for every suitable S.

v self-conjugate (§3.1); no reduction or ramification condition on v. S suitable for X_q: containing the places above p∞ and the places of bad reduction of the family.

(bs, Theorem 6.5, p. 44, proved in §6.5, p. 53; bs line 2249).

A proof can proceed as follows. Choose q as in §8.5. The trichotomy puts the S-good locus inside the union of the two finite loci from Layer 7 and the empty type-(c) locus from Layer 8. This holds for every suitable S, though the finite set can depend on S.

**Checks.**

- With the inclusion Y(K) ⊆ `Y(K_v)^LV_{X_q,S}` it gives the finiteness of Y(K) (§9.2).
- With §1.8 and §6.4 it gives the finiteness of loc_v(Sec^Sel(Y/K)) (§9.3).

*Needs:* §6.9; §7.5; §7.8; §8.4; §8.5; TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.10, Kodaira–Parshin full monodromy; §6.2.

### 9.2 The Mordell consequence

Apply the finiteness in §9.1 and the rational-point inclusion of §6.5 to any self-conjugate place, whose existence follows from §3.1 and Chebotarev. The embedding Y(K)→Y(Kᵥ) is injective, so this gives another proof of the Mordell theorem owned by MordellLawrenceVenkatesh Layer LV.11. (bs, §6, after Theorem 6.5, p. 44; bs line 2249).

**Checks.**

- Over a field without a CM subfield any finite place supplies the proof; in the CM case a place of K above a prime of E_K⁺ inert in E_K supplies it.
- For an empty local curve the global point set is empty, with cardinality 0.
- The genus hypothesis excludes an elliptic curve of positive rank: its infinitely many rational points would contradict the conclusion.

*Needs:* §9.1; §6.5; §3.1; TauCetiRoadmap.Chebotarev Layer 10.

### 9.3 Finiteness of Selmer localisations at self-conjugate places

Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2 and v a finite self-conjugate place of K. Then the image of loc_v: Sec^Sel(Y/K) → Y(K_v) is finite.

v self-conjugate; K may contain CM subfields.

(bs, §1.1, points (1) and (2), p. 3; bs line 103).

A proof can proceed as follows. For the chosen family combine section interpolation, S-goodness of adelic interpolants, and finiteness of its local Lawrence–Venkatesh locus. Any subset of that finite locus is finite.

**Checks.**

- For K = ℚ(i), the place (3) is fixed by complex conjugation and is covered, as is the ramified place (1 + i); the two places (2 ± i) above 5 are exchanged by conjugation and are not covered.

*Needs:* §1.8; §6.4; §9.1; §0.3.

### 9.4 Theorem A: finiteness of the Selmer section image

Let K be a number field containing no CM subfield and Y/K a smooth projective curve of genus ≥ 2 (geometrically connected). Then for every finite place v of K the image of the localisation map loc_v: Sec^Sel(Y/K) → Y(K_v) is finite.

K contains no CM subfield, for instance K totally real or of odd degree; the hypothesis is used only to make every finite place self-conjugate. The section conjecture is not assumed; Theorem A is an unconditional prediction of it.

(bs, Theorem A, p. 1; bs line 4; bs, §1.1, p. 3; bs line 103).

A proof can proceed as follows. Without a CM subfield every finite place is self-conjugate, so apply the preceding theorem separately at each place, with p its residue characteristic. The auxiliary family may depend on v; the conclusion covers every v.

**Checks.**

- Under the section conjecture (AnabelianGeometryAndNonabelianChabauty §7.1) Sec^Sel(Y/K) = κ_Y(Y(K)), which is finite by §9.2, so Theorem A is a consequence of the section conjecture; here it is proved without it.
- For K = Q every finite place is covered, including p = 2, places of bad reduction of Y and ramified places of larger totally real fields.

*Needs:* §9.3; §3.1; §0.3; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion.

### 9.5 Theorem B: finiteness of the projections of the finite descent locus

Let K be a number field containing no CM subfield and Y/K a smooth projective geometrically connected curve of genus ≥ 2. Then for every finite place v of K the projection of the finite descent locus `Y(A_K)_•^{f-cov}` (§0.4) to Y(K_v) is finite.

As in Theorem A; Stoll's conjecture that the locus is the closure of Y(K) (equivalently Y(K), which is finite) is not assumed.

(bs, Theorem B and the paragraph before it, p. 2; bs line 55).

A proof can proceed as follows. The Harari–Stix equality identifies the finite-place projection of modified finite descent with the Selmer-localisation image. Apply Theorem A with the identical field and genus hypotheses.

**Checks.**

- Under Stoll's conjecture the projection is the image of the finite set Y(K) in Y(K_v); the unconditional theorem asserts finiteness without this equality.

*Needs:* §0.5; §9.4; §0.4.

### 9.6 The Lawrence–Venkatesh argument as an obstruction

The original argument of Lawrence and Venkatesh proves, in the language of this roadmap: (1°) Y(K) ⊆ `Y(K_v)^LV_{X,S}` for every abelian-by-finite family, suitable S and finite v | p (§6.5); and (2°) for some finite place v and odd prime q, `Y(K_v)^LV_{X_q,S}` is finite for all suitable S, once the residue-disc analysis is extended from K-rational to K_v-rational centres (footnote 1). Since (1) loc_v(Sec^Sel) ⊆ `Y(K_v)^LV_{X,S}` holds for every family (§1.8 with §6.4), (2°) already gives Theorem A at one place, and with bookkeeping at 100% of places when K has no CM subfield (§8.6 (I)); the places ramified over Q, above 2 or of bad reduction need the model-free method of Layer 4, the self-conjugate numerics of Layer 3 and the trichotomy of Layer 6.

(2°) as stated needs the K_v-centred comparison of complex and v-adic period maps in the model-free period-map supplier contract.

(bs, Remark 1.3 and footnote 1, p. 3; bs line 103; bs, Remark 1.5, pp. 3–4; bs line 103).

A proof can proceed as follows. Combine the general local-system restriction theorem with the original good-model finiteness range, using the model-free comparison at K_v-rational centres. Section 8.6 gives density one for that range without a CM subfield. The self-conjugate, model-free argument supplies the remaining finite places.

**Checks.**

- For K = Q the original argument covers a set of primes of natural density 1 for each curve, never p = 2 or primes of bad reduction; this roadmap covers every prime (§9.4).

*Needs:* §6.5; §1.8; §6.4; §9.1; §8.6; §1.5.

### Examples

At a self-conjugate place the final locus is contained in the union of two finite sets and an empty set. An empty local point set gives empty Selmer localisations and empty finite-descent projection, of cardinality 0. Over ℚ every finite place is self-conjugate, so the result applies at 2 and at primes of bad reduction. The conclusion is finiteness of an image at each place; it does not identify the section set itself with rational points.

### Dependencies

TauCetiRoadmap.MordellLawrenceVenkatesh Layer LV.10, Kodaira–Parshin full monodromy; TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6), section classes, rational-point section map, Kummer comparison and the field-general injectivity criterion. Internal dependencies are specified in each subsection.

## Downstream consumers

Theorem A constrains every finite-place localisation of Selmer sections over fields without CM subfields; Theorem B gives the corresponding finite-descent constraint. The general local-system restriction theorem applies to other cohomological obstructions, including the nonabelian Chabauty constructions of AnabelianGeometryAndNonabelianChabauty. The horizontal-transport and symplectic-period results apply to smooth proper families independently of reduction models, and the self-conjugate weight identities apply to induced pure representations over arbitrary finite extensions of number fields (bs, Remark 1.5, Corollary 2.21, Theorems 3.3 and 7.1, pp. 3–4, 14–17, 54; bs lines 144, 721, 852 and 2812).

## References

- **bs.** L. Alexander Betts and Jakob Stix, [Galois sections and p-adic period mappings](https://arxiv.org/abs/2204.13674v1), arXiv:2204.13674v1, 2022. All theorem numbers and pages here refer to this 59-page version. Published as Annals of Mathematics 201 (2025), 79–166, DOI 10.4007/annals.2025.201.1.2; the published pagination is not used. The relevant locators are given at each target and contract.
- **hs.** David Harari and Jakob Stix, [Descent obstruction and fundamental exact sequence](https://arxiv.org/abs/1005.1302v2), arXiv:1005.1302v2, 2010, Introduction and Theorem 2.1 with Remarks (1), (4), pp. 2, 11–12. The published Theorem 11 is this version's Theorem 2.1.
- **stoll.** Michael Stoll, [Finite descent obstructions and rational points on curves](https://arxiv.org/abs/math/0606465v3), arXiv:math/0606465v3, 2007, §2, Definitions 5.2, 5.4, Lemma 5.8, Proposition 5.9 and Conjecture 9.1, pp. 4, 14–20, 38.
- **stix08.** Jakob Stix, [On cuspidal sections of algebraic fundamental groups](https://arxiv.org/abs/0809.0017v1), arXiv:0809.0017v1, 2008, Appendix B, Proposition 44, Theorem 45 and Remark 46, pp. 22–23. The local application uses finite extensions of ℚₚ and the profinite topology of their abelian-variety point groups.
