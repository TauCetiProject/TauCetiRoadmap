# Roadmap: hilbert modular varieties and Shimura curves, part II — mod p cohomology and Gelfand–Kirillov dimension

**Summary.** Build the global theory of mod p quaternionic cohomology at infinite level at one place above p: the generic global datum and Buzzard–Diamond–Jarvis weight comparison, covariant patching functors and the big patched module, freeness over scheme-theoretic supports, noncommutative Cohen–Macaulay transfer and miracle flatness. The end theorems give Gelfand–Kirillov dimension [F_v : ℚ_p], the full second-congruence structure, faithful flatness of the patched module, nonzero admissible unitary Banach lifts, and, when p is inert, big R = big T and a complete-intersection Hecke algebra. Both proper Shimura curves and totally definite quaternionic forms are included (BHHMS23 §§8.1–8.5, pp. 86–109; BHHMS23 line 4312).

## Scope and ownership

The base HilbertModularVarietiesAndShimuraCurves stops at finite-level models, coefficient cohomology, Hecke correspondences, non-Eisenstein control and the arithmetic inputs to patching. This Part II owns the global BHHMS theory built from those inputs: Layers 0–1 identify its automorphic multiplicity spaces and patching functor; Layer 2 proves the additional support-freeness and noncommutative algebra; Layers 3–4 prove the common-rank and glued-lattice freeness; Layer 5 proves the global representation and deformation/Hecke theorems. The patching functor at a place dividing p differs from the parent's §R18.4.29 functor for auxiliary-prime Ihara patching by its coefficient category, local type supports and infinite-level fibre.

The following objects are stated elsewhere and are consumed with their original hypotheses:

- Finite-level curves, central quotients, definite class sets with arbitrary finite ramification, coefficient systems, Hecke operators, degeneracy maps and non-Eisenstein control: HilbertModularVarietiesAndShimuraCurves §§R18.1.1–R18.1.4, R18.3.1–R18.3.16, R18.4.1–R18.4.27. Layer 0 supplies the BHHMS normalization adapter and multiplicity spaces, not another curve or class-set construction.
- Smooth categories and central characters: SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4. Weight coordinates, Diamond modules, the local GK carrier and bound, first-order envelopes, the projective-cover fibre-product lattice `R` together with its partial fibre products `L_j`, their recursion `L_j = L_{j−1} ×_P R′_{2,j}` and the endpoint identification `L_{f−1} = R`, and relative projectivity: ModpRepresentationsOfGL2OverLocalFields MP.3–MP.9 (the lattices at MP.8/projective-lattice). Layer 4 specializes these lattices to σ_v and owns the type-dependent lattices `T′_{2,j}`, `Y_j` and `N_j`, their comparisons with `L_j`, and the patched-module theorems for all of them.
- Tame types and single/multiple-type Galois deformation rings: LocalGaloisDeformationRingsPartII T.0–T.7. Whole-type component ideals retain the coupled terms in the common chart. The characteristic-zero correspondence and lattices, and the local Gee–Kisin input, are the precise supplier gaps below; §0.2 owns their comparison with the BDJ extension-class recipe.
- Generic local/global deformation rings and Taylor–Wiles primes: LocalGaloisDeformationRings §§1.1–1.24, 3.1–3.10 and GlobalGaloisDeformations §§3.3–3.7, 5.1–5.8. General module and complex patching, commutative depth and support: DeformationAndDerivedPatchingAlgebra §§3.1–3.4, 5.6, 6.1–6.2, 8.1–8.5. The weight-filtration argument of GL2ModularityLifting §8.1 has a totally split setting; Layer 0 proves the unramified-place quaternionic version it needs.
- Completed cohomology, derived finite Hecke images, localization and integral Banach duality: CompletedCohomologyPartII §§F.1, 1.1–1.3, 3.1–3.2, 8.3–8.15. Layer 5 identifies their fixed-central-character quaternionic specialization; it does not build another completed-cohomology carrier. This also supplies the duality needed here rather than repeating LocallyAnalyticDistributionsPartII ND.6.
- Finite-group coefficient duality and finite projective-to-injective transfer use the pinned Tau Ceti declarations in the supplier contract; Layer 0 owns their arithmetic application. The finite-module Hopfian input is Mathlib `OrzechProperty.bijective_of_surjective_endomorphism`, with `CommRing.orzechProperty`; Layer 2 uses it without a Noetherian hypothesis. Module fibre products use Mathlib `LinearMap.eqLocus` and its equality with the kernel of a difference, `LinearMap.eqLocus_eq_ker_sub` (Mathlib/Algebra/Module/Submodule/EqLocus.lean). Layer 2 owns the support-freeness criterion.
- Completed group algebras are already in the library as `TauCeti.completedGroupAlgebra`. Grades, canonical dimension, Auslander regularity, coefficient shifts and finite-index comparisons are owned by NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11, reexported by CompletedCohomologyPartII §5.5. Layer 2 adds the depth/projective-dimension identities, noncommutative CM condition, central-variable comparisons and miracle flatness; it does not redeclare those supplied objects.

Quaternionic Shimura varieties with more than one split real place, and Hilbert–Siegel moduli, are outside this roadmap; no target here uses them. Local power-series cancellation is the declared gap:power-series-cancellation on DeformationAndDerivedPatchingAlgebra.

## Conventions

Work in fixed universes of small rings, modules and representations, enlarging universes for module categories and diagrams when needed. Finite O-module means finitely generated unless finite length is specified. All deformation maps are continuous local O-algebra maps with their residual identifications. Galois representations, Hecke images and modules carry the actions constructed from the datum; arbitrary unrelated representations are never substituted for π or M∞.

In the global layers p is prime, F is totally real and unramified at p, v|p, f=[F_v:ℚ_p]≥1, k is the local residue field, K=GL₂(O_Fv), K₁=1+pM₂(O_Fv), and Z₁ is its scalar centre. The symbol I is the upper Iwahori and I₁ its pro-p subgroup. The coefficient field 𝔽 is finite and sufficiently large, O=W(𝔽), E=O[1/p]. The general algebra of Layer 2 permits every complete DVR O finite over ℤ_p, ramified or unramified, with uniformizer ϖ and residue field κ; in the global application ϖ=p and κ=𝔽. Residual base change to a sufficiently large field is retained in the cuspidal EGS ring statements (EGS15 Theorem 7.2.1(2), pp. 42–43; EGS15 line 2197).

Cyclotomic Hodge–Tate weight is +1. Frobenius and Artin reciprocity are geometric. At w∤p, ε is unramified and ε(Frob_w)=q_w⁻¹; at v|p a Frobenius lift has no such prescribed cyclotomic value. The BDJ/BHHMS fundamental characters have ω₁=ω; EGS inverse characters are translated by W(ρ)=D_EGS(ρ∨). The local factor of the patched ring can be read for r̄_v or for its dual through the explicit dualization isomorphism; all weight/type quotient notation here uses r̄_v∨, determinant εψ_v⁻¹ and weights summing to 1. The adelic centre acts on forms through ψ⁻¹, with ψ the Teichmüller lift of ω det r̄ (BHHMS23 Remark 8.1.3, pp. 88–89; BHHMS23 line 4439).

Pontryagin dual means continuous O-linear maps to E/O with the compact/discrete topologies; the coefficient notation σ* in §0.3 always has this meaning, including for a finite free lattice (EGS15 §1.9, p. 8; EGS15 line 385). Schikhof dual means the integral O-dual, rationalized when a Banach space is wanted. Left dual actions are contragredient. The big compact module has central character ψ, dual to π's ψ⁻¹. Smooth group actions on colimits use right translations on forms and the induced left representation; pullback maps for smaller levels point from larger-level cohomology into smaller-level cohomology.

The scheme-theoretic support of M over commutative A is A/Ann_A(M). Support-rank r means an A-linear isomorphism with r copies of that quotient, not merely generic rank. A nonzero commutative finite module is MCM over a specified ring when its depth equals that ring's dimension; zero values are separately allowed in a patching functor. The noncommutative CM condition excludes zero. Grades of zero are ∞, dimensions of zero are −∞, and ordinary finite numerical equalities exclude zero. GK dimension is canonical dimension of π∨ over 𝔽⟦K₁/Z₁⟧, namely 3f minus its grade for nonzero π (GN22 Definitions A.2, A.5, pp. 42–44; GN22 line 1955).

**Checks.**

- In 𝔽₂₉, q=5 and eigenvalues 2,3 give S=25,T=9 and X²−S⁻¹TX+qS⁻¹=X²−5X+6; using arithmetic Frobenius without inversion changes the two roots to 15 and 10. Negating the parent's Hodge–Tate convention sends weights (0,−1) to (0,1).
- At p=29 and v|p of degree f=1, every ε(Φ_v) is a 29-adic unit of valuation 0, whereas q_v⁻¹=29⁻¹ has valuation −1. Thus the away-from-p Frobenius formula cannot be applied at v; the determinant-character value there is prescribed by §1.3.
- A scalar z acts on Sym²⊗det⁻¹ by z²z⁻²=1. Twisting π by χ⁻¹∘det with χ(z)=2 multiplies its central character by 22 modulo 29; the positive determinant twist gives 4.
- The first-order adjoint twist raises (2,−1) to (3,0) under ε; determinant weights change 1→3, and the residual representation changes from r̄_v^∨ to r̄_v^∨(1): at p=29 and an inertia element g with ω(g)=2 the residual determinant is multiplied by 2²=4. At diag(2,1) the inverse norm-determinant character in residue degree one is 15, not 2.
- Hom_O(𝔽,O)=0 and Hom_O(𝔽,E/O)≅𝔽. Take the complex C with C⁻¹=C⁰=O and d⁻¹=p. With the Hom differential `d(f) = d_O∘f − (−1)^(deg f) f∘d_C`, the integral dual Hom_O(C,O) sits in degrees 0 and 1 and its differential sends the basis vector 1 to −p, which differs from +p in O; reading the dual differential as plain precomposition would give +p. Separately, its cokernel is O/p for either sign, so the cokernel alone does not detect the sign.
- For V′⊆V and a finite cover, pullback carries H¹ at V into H¹ at V′ after non-Eisenstein control. On the regular C₂₉-module the invariants have dimension 1 and the whole module dimension 29, fixing the direction.

- Over 𝔽₂₉ take u=((1,1),(0,1)) and v=((1,0),(1,1)). Then uv=((2,1),(1,1)) and vu=((1,1),(1,2)) differ. Group inversion therefore gives the opposite-algebra convention; treating it as an algebra automorphism would reverse the order incorrectly.

## Exact supplier contracts

### From Mathlib

At the repository's Mathlib pin, consume `CategoryTheory.Abelian.Ext` (Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean), `IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean), `IsNoetherianRing` (Mathlib/RingTheory/Noetherian/Defs.lean), `IsRegularLocalRing` (Mathlib/RingTheory/RegularLocalRing/Defs.lean), `LinearMap.ker` (Mathlib/Algebra/Module/Submodule/Ker.lean), `LinearMap.eqLocus` and `LinearMap.eqLocus_eq_ker_sub` (Mathlib/Algebra/Module/Submodule/EqLocus.lean), `Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean), `Module.Free` (Mathlib/LinearAlgebra/FreeModule/Basic.lean), `Module.Flat` and `Module.FaithfullyFlat` (Mathlib/RingTheory/Flat/Basic.lean and FaithfullyFlat/Basic.lean), and `Module.annihilator` (Mathlib/RingTheory/Ideal/Maps.lean). These are native categories, module predicates and ideals, not cohomology of Shimura curves or patching data. Local rings include nontriviality. Freeness alone specifies no finite rank; finite generation is separate. Faithful flatness includes flatness and faithfulness of tensoring.

Also consume `Module.support` (Mathlib/RingTheory/Support.lean), `MvPowerSeries` and `PowerSeries` (Mathlib/RingTheory/MvPowerSeries/Basic.lean and PowerSeries/Basic.lean), `Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean), `Nat.Prime` (Mathlib/Data/Nat/Prime/Defs.lean), `Representation` (Mathlib/RepresentationTheory/Basic.lean), `WittVector` (Mathlib/RingTheory/WittVector/Defs.lean), and `Submodule.spanFinrank` (Mathlib/Algebra/Module/SpanRank.lean). The last is a natural number obtained by cardinal-to-natural conversion and is interpreted as a generator count only for finite modules. A representation on the native algebraic carrier carries no smoothness by itself; topologies, continuity and admissibility come from the smooth-category supplier.

Also consume `OrzechProperty.bijective_of_surjective_endomorphism` (Mathlib/RingTheory/OrzechProperty.lean) with `CommRing.orzechProperty` (Mathlib/RingTheory/FiniteType.lean): a surjective endomorphism of a finitely generated module over a commutative ring is bijective. This does not require the ring or module to be Noetherian.

### From Tau Ceti

Use `TauCeti.completedGroupAlgebra` from TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean, the compatible inverse-limit family of finite-quotient group algebras with its projections and group elements. For profinite groups and compact Hausdorff coefficients use its supplied topological structure, and the continuous compact-module action extension in TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean. The carrier does not assert analytic-group dimension, uniformity, noetherianity or Auslander regularity. Those hypotheses and conclusions are supplied below. For finite group algebras consume `TauCeti.MonoidAlgebra.dualLinearEquiv` (TauCeti/Algebra/MonoidAlgebra/Dual.lean), the natural coefficient-at-one duality for a finite group over commutative coefficients, and `Module.Injective.of_finite_projective` (TauCeti/Algebra/Module/Injective/SelfInjective.lean), which requires self-injectivity of the regular module over the same ring. No Tau Ceti module is imported into Suggested.lean, which states no theorem.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

Consume §§R18.1.1, R18.1.3–R18.1.4 for the quaternionic datum, proper canonical curve and effective central levels; §§R18.3.1, R18.3.3, R18.3.6, R18.3.8, R18.3.15 for general definite class sets, coefficient forms, the split Hecke normalization, the finite-set degeneracy maps of the definite Ihara lemma over an arbitrary totally real field, and the residual ideal; the even-degree Khare–Wintenberger specializations §§R18.3.9 and R18.3.14 are not consumed; §§R18.4.1–R18.4.2, R18.4.5–R18.4.6, R18.4.8, R18.4.10, R18.4.14–R18.4.16, R18.4.21, R18.4.24–R18.4.25 and R18.4.27 for local systems, finite cohomology, descent, non-Eisenstein vanishing, integral control, Gram and oldspace splitting, exact central localization and early Galois–Hecke realization. Retain central descent and small-level hypotheses at every finite coefficient level. These general definite class-set adapters allow odd [F:ℚ] and finite ramification; the local splitting conditions are applied only where a GL₂ factor is used. Negate its filtration-index Hodge–Tate weights and apply its arithmetic residual Hecke evaluation in §R18.3.15 to r̄ ⊗ ω before using §0.3. For §R18.4.27’s geometric realization, use the residual representation r̄^∨⊗ω⁻¹ and finite central character ψ⁻¹, then dualize and tensor by ε⁻¹; its geometric polynomial X²−T_wX+q_wS_w becomes X²−S_w⁻¹T_wX+q_wS_w⁻¹.

### From TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields

Consume MP.3/weight-coordinates, tame-weight-set and diamond-socle with their alcove depth, duality and extension-graph conventions; MP.4/gk-dimension and dimension-comparisons on the native Iwasawa carriers; MP.5/finite-weight-hulls, projective-adjoint and first-order-weight-hulls; MP.6/diamond-box, adjoint-tensor and socle-enlargement; MP.7/connected-characters, diamond-connected and local-gk-bound; MP.8/projective-lattice, lattice-coinvariants and projective-truncation; MP.9/relative-projectivity. The generic box at v implies the 8-deep weights needed for adjoint lattices and hence all weaker 2-, 3- and 6-deep uses. Local GK dimension, the local bound and the endpoint R/pR identification are used with their actual representations, not reconstructed numerically here.

### From TauCetiRoadmap.LocalGaloisDeformationRingsPartII

Consume T.0 “Tame inertial types” and “Weights of a tame type”, T.4/weight-shape-bijection, T.6/single-presentation, single-components and special-fibres, and T.7/weight-union, multiple-presentation, exact-q-ideals and p-membership. These provide the stable single-type and multi-type presentations with their finite residue-field enlargements, exact prime kernels, reduced special fibres and integral p-membership. The multi-type presentation is stabilized by 2f variables on the Galois side and four on the chart side; use that stable form, then enlarge the global patching variable count and use DeformationAndDerivedPatchingAlgebra gap:power-series-cancellation below. Each transported ideal is indexed by its whole type tuple and retains coupled tails. Include the reversal j↦f−1−j and the 3→1 relabeling in §4.8. The scalar in p-membership is p, not an arbitrary ramified uniformizer. No use of the supplier's unstabilized presentation is needed.

What LocalGaloisDeformationRingsPartII must provide (gap:tame-types): For K/ℚ_p unramified and sufficiently large E, supply the tame inertial correspondence τ↦σ(τ) with its Diamond-box constituents: every irreducible smooth E-representation of GL₂(O_K) inflated from GL₂(k) and not a Steinberg twist is in its image after scalar extension; supply the irreducible-cosocle lattices σ_J°(τ) and their capped-interval subquotients (EGS15 §5.1 and Definition 10.1.4, pp. 25–27, 60).

What LocalGaloisDeformationRingsPartII must provide (gap:single-type-rings): For generic residual representations including nonsplit ones away from v, supply the EGS potentially Barsotti–Tate presentations and weight-component ideals, the one-weight formally smooth fixed-determinant ring of relative dimension 3+f, the two-weight regular case and determinant twisting, together with, for the component-intersection ideals I_𝒥 of the reduced special fibre R̄ of a single-type ring, the cyclic-quotient identity `I_{F(J₁,J₂)^×}/I_{F(J₁,J₂)} ≅ R̄/I_{{J₁}}` for J₁⊆J₂, where F(J₁,J₂)={J:J₁⊆J⊆J₂} and F(J₁,J₂)^×=F(J₁,J₂)∖{J₁}, and the identity `I_{𝒥₁}+I_{𝒥₂}=I_{𝒥₁∩𝒥₂}` for capped intervals sharing a cap (EGS15 Lemmas 10.1.6 and 10.1.8, pp. 60–61; EGS15 lines 3246, 3282); §3.2 defines the global I_𝒥 and proves their equality with patched-module annihilators.

What LocalGaloisDeformationRingsPartII must provide (gap:breuil-mezard-pbt): For every finite K/ℚ_p with p>2 and continuous r̄:G_K→GL₂(𝔽), with sufficiently large coefficients O and uniformizer ϖ, supply the unique integers μ_σ(r̄)≥0 satisfying `e(R^{□,0,τ}_{r̄}/ϖ)=Σ_σ n_{0,τ}(σ)μ_σ(r̄)` for every inertial type τ, with μ_σ(r̄)≠0 exactly when r̄ has a crystalline lift of Hodge type σ in the sense of GK14 Definitions 2.2.2–2.2.3 (for ramified K choose one lift of each residue embedding for the highest-weight pair representing σ and put the other highest-weight pairs equal to (0,0) as there) (GK14 Theorem A(1) and §2.2, pp. 3, 7–8; GK14 lines 105, 325, 347, 363); these are GK14’s Hodge-type labels, with its convention HT(ε)=−1 (GK14 lines 244–249).

The tame-type gap uses BHHMS23 §2.2 and Remark 8.2.5, pp. 13–14, 93, and EGS15 §5.1 and Definition 10.1.4, pp. 25–27, 60 (EGS15 lines 954, 3239); the weight-dependent comparisons of EGS15 §3.5 and Proposition 10.1.11 are targets of §0.2. The EGS ring extension uses Theorem 7.2.1(2),(4),(5), pp. 42–43 (EGS15 line 2197); when the residual representation is semisimple the small-Hodge domains and reducedness use T.6 instead. The Breuil–Mézard gap is the general finite-K local identity and crystalline characterization of its support in GK14 Theorem A and §2.2, pp. 3, 7–8 (GK14 lines 105, 363); §0.2 compares this support with the BDJ recipe when K is unramified. The global nonvanishing of Corollary 5.4.5 is a target of §0.6, and the Serre-weight support comparison is a target of §1.4. The ring gap supplies the component primes and the two ideal identities of EGS15 §10.1 (EGS15 lines 3246, 3282); §3.2 forms their global intersections and identifies their patched-module annihilators.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Consume §§1.1, 1.4, 1.10, 1.24 for framed rings, tangent–obstruction counts and determinant twisting, and §§3.1, 3.4, 3.9–3.10 for Hodge/inertial types, potentially semistable quotients and potentially crystalline generic regularity. Potential crystallinity imposes monodromy zero in addition to the type; type alone does not impose it. Twisting shifts negative labelled Hodge weights into the supplier's bounded interval before invoking the quotient construction.

### From TauCetiRoadmap.GlobalGaloisDeformations

Consume §§3.3–3.7 for fixed-determinant global deformation data, representing rings and the local-to-global map, and §§5.1, 5.7–5.8 for Taylor–Wiles data, odd-prime auxiliary sets and generator counts. Retain the prescribed local conditions in the augmentation surjection. An unrestricted global ring is used only when this roadmap's §5.6 inert-prime comparison constructs that specific map.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Consume §§1.6, 1.10–1.12 for coefficient categories, Cohen presentations and completed coefficient products; §§3.1–3.4 for depth, Auslander–Buchsbaum, regular maximal-depth freeness, finite-action comparisons and complete intersections; §§3.11–3.12 for Hilbert–Samuel multiplicities with their ambient dimension; §§5.6, 7.2–7.3, 8.1–8.5 for based module patching, finite perfect representatives, common extraction, genuine ring actions and augmentation; §§6.1–6.2 for support on components and its specialization. Patching finite systems is an input; the quaternionic coefficient functor and its support theorems are built in Layers 1 and 3.

What DeformationAndDerivedPatchingAlgebra must provide (gap:power-series-cancellation): For commutative local rings A and B, an abstract ring isomorphism A⟦x⟧ ≅ B⟦x⟧ implies A ≅ B, with an isomorphism fixing any shared coefficient ring when the given isomorphism fixes it; when A is a complete Noetherian local W(𝔽)-algebra with residue field 𝔽 and B=W(𝔽)⟦X₁,…,X_n⟧, supply the coefficient correction making the resulting isomorphism W(𝔽)-linear (HAM75 Theorem 4, p. 155; HAM75 line 101; BHHMS23 Lemma 8.1.2, p. 88; BHHMS23 line 4404). The supplier section is R03.3 (Layer 3, §§3.1–3.4). The relative form follows from the same substitutions and quotient maps in Hamann’s proof, which fix shared constants (HAM75 lines 102–120); it applies to the stabilized O-algebra charts of §4.8. In the regular power-series target, first correct the residue automorphism by the coefficientwise Witt lift; uniqueness of Teichmüller lifts then fixes W(𝔽).

**Checks.**

- ℤ_p⟦t⟧⟦x⟧ and ℤ_p⟦x⟧ have Krull dimensions 3 and 2, so they are not isomorphic; forgetting a coefficient variable would incorrectly identify them.
- If A⟦x⟧ ≅ W(𝔽)⟦X₁,X₂⟧, cancellation gives A ≅ W(𝔽)⟦t⟧: the dimensions are 3 before cancellation and 2 after it. Cancelling from A⟦x⟧ ≅ B⟦x⟧ with B=W(𝔽)⟦t⟧ leaves B's one variable, rather than none.
- For 𝔽=𝔽₉=𝔽₃[a]/(a²+1), Frobenius sends a to a³=−a and [a] to [−a]; composing with its inverse Witt lift sends [−a] back to [a]. A residue-fixed local isomorphism fixes every [a] and hence W(𝔽); an uncorrected Frobenius is not W(𝔽)-linear.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Consume §§0.1–0.4, F.1, 0.10–0.11: compact analytic and uniform groups, local/noetherian completed algebras, grade and canonical dimension, finite-index Ext comparison, the coefficient shift and Auslander regularity with integral global dimension 1+dim K and residual dimension dim K. Finite global dimension needs absence of p-torsion. The inversion anti-isomorphism exchanges left and right modules. The uniformizer reduction comparison is an exact sequence, not a degreewise Ext isomorphism. Layer 2 adds the Gee–Newton results beyond these inputs.

### From TauCetiRoadmap.CompletedCohomologyPartII

Consume §§F.1, 3.1–3.2 for compact/discrete Pontryagin and integral Schikhof duality, including the torsion-free compact lattice domain; §§1.1–1.3 and 8.3–8.4 for fixed-exponent smooth colimits, the quaternionic finite-level coefficient input and the arithmetic tower action; §5.5 for the shared Iwasawa interface; §§8.8, 8.10, 8.12–8.15 for compatible finite derived Hecke images and residual localization. The adapter in this roadmap's §5.6 proves concentration in degree 1 after non-Eisenstein localization (degree 0 in the definite case), so the derived Hecke image equals the actual cohomology image. This identification is proved in the finite diagram before the inverse limit. The qualified reduction comparisons of §§2.4, 3.7 are used with the finite-level vanishing; an arbitrary inverse-limit cohomology reduction is not assumed.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Consume §§1.1–1.7 for coefficient changes and finite-quotient measure/completed-algebra comparisons, and §5.2 for topological Nakayama. The completed-group-algebra carrier and its multiplication remain the native Tau Ceti construction.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §§SR.0.1–SR.0.4 for smooth modules, the abelian category, admissibility and central characters over finite coefficients. No prime-to-p averaging is used for a p-group: projectivity after non-Eisenstein localization supplies exactness in §0.4.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume §§R07.1.26 and R07.5.15 for tame fundamental characters and the native Serre-weight carriers, with the embeddings indexed as in §0.2. Layer 0 supplies their BDJ extension-class recipe and the comparison with the modular weights.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

Consume PL.1/potentially-barsotti-tate-diagonalizable: for p>2 every two-dimensional potentially crystalline representation with all labelled weights {0,1} is potentially diagonalizable. This is a local input; no automorphy-lifting conclusion is imported into its own hypotheses. The global realization of chosen local components by modular lifts, which the weight theorem of §0.6 needs for full component support, is the supplier gap below.

What PotentialAutomorphyInfrastructurePartII must provide (gap:quaternionic-component-realization): Let p>2, F totally real and r̄:G_F→GL₂(𝔽) modular (the reduction of the Galois representation of a parallel weight two Hilbert eigenform) with r̄|`G_{F(ζ_p)}` absolutely irreducible and, when p=5, projective image of r̄|`G_{F(ζ_5)}` not A₅; fix a totally even finite-order ψ with det r̄ = ψε⁻¹ modulo p, a finite set S of finite places containing those above p and those where r̄ or ψ ramifies, inertial types τ_v with det τ_v=ψ|`I_{F_v}`, and an irreducible component of the generic fibre of each fixed-determinant framed type ring (potentially Barsotti–Tate of type τ_v at v | p, of type τ_v at v ∤ p); then after a finite extension of coefficients there is a modular lift ρ of r̄ with det ρ=ψε⁻¹, unramified outside S, whose restriction to every v∈S is a point of the chosen component (GK14 Lemma 5.2.5, p. 27; GK14 line 1253), the totally real GL₂ form of lifting with prescribed local components, extending PL.5/ordinary-lifts-prescribed-local and PL.5/pd-automorphy-lifting.

### From TauCetiRoadmap.Chebotarev

Consume Layer 10, “Dirichlet-density Chebotarev”: each nonempty conjugacy class in a finite Galois extension of number fields occurs at infinitely many unramified primes, and excluding finitely many primes preserves that infinitude. Apply it to the finite residual-image extension with the cyclotomic character, using EGS15 §6.2's residual-image argument to select the permitted class.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Consume §4.2 (Hilbert Ramanujan–Petersson: the unitary twist of a regular cohomological cuspidal π is tempered at every finite place) for the discrete-series step of §0.6, §4.3 for the Hecke/Langlands normalization and §4.4 for full Frobenius-semisimple Weil–Deligne compatibility at every finite w ∤ p for Hilbert cusp forms of type (k,w), retaining monodromy. In §0.7 use the weight-two Hilbert representation obtained from the quaternionic eigenform by global Jacquet–Langlands; no even-degree or definite-quaternion hypothesis is imposed.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Consume §§R17.3.1 and R17.3.10: global Jacquet–Langlands on the non-one-dimensional discrete quaternionic spectrum, its agreement at split places, and the indefinite transfer with the parity of the finite ramification retained. The non-Eisenstein localization excludes norm characters. This supplies the transfer to Hilbert cusp forms in §0.7 in both quaternionic cases, for every permitted degree of F.

## How to read the build

Layer 0 constructs the normalized global datum, weights and multiplicity spaces from finite-level quaternionic geometry. Define its colimit before using the weight theorem to prove nonvanishing. Layer 1 builds the coefficient patching functor, its fibres and the compatible big module. Layer 2 supplies support freeness and the added Iwasawa algebra. Layer 3 proves one common positive rank and identifies K₁-invariants independently of Layer 4; Layer 4 then proves glued-lattice freeness and the second-truncation multiplicity theorem. Layer 5 combines that theorem with the imported local GK bound, proves a separate lower bound, and deduces flatness, Banach lifts and the inert-prime deformation/Hecke theorem. Needs lines distinguish the statement's objects from a possible proof route. Every target below is part of the library. Suggested.lean states no theorem: no end theorem is statable at the pins.

## Layer 0: The global setting and quaternionic weights

### 0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen

A generic global datum consists of: a prime p > 5; a totally real field F unramified at every place of the set S_p of places above p; a quaternion algebra D with centre F, split at every place of S_p and at no more than one infinite place (the indefinite case when it is split at exactly one, the definite case when at none), with (F, D) ≠ (ℚ, M₂(ℚ)) in the indefinite case, S_D its set of finite ramified places, a maximal order O_D and fixed isomorphisms (O_D)_w ≅ `M₂(O_{F_w})` for w ∉ S_D; a finite field 𝔽 of characteristic p, large enough, with O = W(𝔽); a continuous r̄ : G_F → GL₂(𝔽) such that r̄|`G_{F(ζ_p)}` is absolutely irreducible, r̄_w = r̄|`G_{F_w}` is generic (EGS15 Definition 2.1.1) for every w ∈ S_p, and the framed deformation ring of r̄_w over W(𝔽) is formally smooth for every w ∈ (S_D ∪ S_r) ∖ S_p, where S_r is the set of places at which r̄ ramifies (S_p ⊆ S_r by genericity); the character ψ : G_F → W(𝔽)^× that is the Teichmüller lift of ω·det r̄, ω the mod p cyclotomic character; a distinguished place v ∈ S_p, f = [F_v : ℚ_p], such that r̄_v is semisimple and, up to twist, r̄_v|`I_{F_v}` ≅ `ω_f^{Σ_i p^i(r_i+1)}` ⊕ 1 with 12 ≤ r_i ≤ p − 15 for all i, or r̄_v|`I_{F_v}` ≅ `ω_{2f}^{Σ_i p^i(r_i+1)}` ⊕ `ω_{2f}^{p^f Σ_i p^i(r_i+1)}` with 13 ≤ r_0 ≤ p − 14 and 12 ≤ r_i ≤ p − 15 for 0 < i < f; an auxiliary finite place w₁ ∉ S_D ∪ S_r with Norm(w₁) ≢ 1 mod p, with the ratio of the eigenvalues of `r̄(Frob_{w₁})` outside {1, Norm(w₁), `Norm(w₁)^{−1}`}, and with w₁ dividing no ζ + `ζ^{−1}` − 2 for ζ a nontrivial root of unity in a quadratic extension of F; a finite set S of finite places containing S_D ∪ S_r and not w₁, with the framed deformation ring of r̄_w^∨ formally smooth for w ∈ S ∖ S_p; and a compact open U = ∏_w U_w ⊆ ∏_w (O_D)_w^× with U_w = `GL₂(O_{F_w})` for w ∉ S ∪ {w₁} and for w ∈ S_p, `U_{w₁}` contained in the matrices that are upper triangular and unipotent modulo w₁, and such that r̄ is modular at the level V = `∏_{w ∉ S_D ∪ S_r}(O_D)_w^×` · `∏_{w ∈ (S_D ∪ S_r)∖S_p}` U_w · `∏_{w ∈ S_p}(1 + pM₂(O_{F_w}))`: `Hom_{G_F}(r̄, H¹_ét(X_V ×_F F̄, 𝔽))` ≠ 0 in the indefinite case, S(V, 𝔽)[𝔪] ≠ 0 in the definite case.

The genericity bounds at v force p > 23 (BHHMS23, remark after the genericity conditions, p. 5); in fact 12 ≤ p − 15 needs p ≥ 27, so p ≥ 29 since p is prime (arithmetic derived here, not stated in BHHMS).

Hodge–Tate weights are normalized so that the p-adic cyclotomic character ε has weight 1 at every embedding; Frobenius elements are geometric (BHHMS23 §1.4 and §8.1).

r̄_v^∨ satisfies the same semisimplicity and genericity hypotheses as r̄_v (BHHMS23 §8.1 (i)); this is used because the patched rings are rings for r̄_v^∨.

(BHHMS23, §8.1, pp. 86–88, items (i)–(iv) and the standing assumptions preceding them; genericity conditions (i)–(iii), §1.2, p. 5; BHHMS23 line 4315; EGS15, Definition 2.1.1, p. 10; §6.2, pp. 34–35; EGS15 line 441).

Its API:

- The exponent condition 12 ≤ r_i ≤ p − 15 of the reducible inertial shape at v (with the second box given by 13 ≤ r_0 ≤ p − 14, 12 ≤ r_i ≤ p − 15).
- EGS15 genericity of the reducible shape: 0 ≤ r_j ≤ p − 3, not all 0, not all p − 3 (with the irreducible EGS box given by 1 ≤ r_0 ≤ p − 2, 0 ≤ r_j ≤ p − 3); implied by the BHHMS bounds.
- The data (p, F, D, 𝔽, r̄, ψ, v, w₁, S, U) with the conditions of BHHMS23 §8.1 as fields; the choice of zero or one split real place is part of a single datum.
- The exponent bounds at v imply p ≥ 29.
- r̄_v is generic in the sense of EGS15 Definition 2.1.1, so the datum is a special case of the EGS15 setting.
- r̄_v^∨ is again semisimple of one of the two inertial shapes, up to twist, with exponents satisfying the same bounds (BHHMS23 §8.1 (i)); the patched rings of §1.1 are rings for r̄_v^∨.
- For r̄ with absolutely irreducible restriction to `G_{F(ζ_p)}` and p > 5, infinitely many places w₁ satisfy the three auxiliary conditions.
- For every compact open V ⊆ U the level V is sufficiently small as specified in EGS15 §6.2, p. 34 (EGS15 line 1695), and the finite group V(𝔸_F^∞)^×/V F^× acts on X_V without fixed geometric points (BHHMS23 Remark 8.1.3(iii), from the conditions on w₁).

A proof route is as follows. Record the data and conditions of BHHMS23 §8.1, items (i)–(iv) together with the standing assumptions on F, D, r̄ and ψ (pp. 86–87); the genericity conditions of the introduction, (i)–(iii) on p. 5, are the same conditions in another order. The auxiliary place w₁ exists by Chebotarev (EGS15 §6.2, citing Lemma 4.11 of Darmon–Diamond–Taylor; BHHMS cite EGS15 §§6.2 and 6.5); the conditions on w₁ make the level U sufficiently small as specified in EGS15 §6.2, p. 34 (EGS15 line 1695). The shape of V in the modularity hypothesis is always available once r̄ is modular at some level (BHHMS23 §8.1, citing Breuil–Diamond Theorem 3.2.2 and the proof of Corollary 3.2.3).

**Checks.**

- For p = 29 and f = 1 in the first (reducible) shape the admissible exponents are exactly r_0 ∈ {12, 13, 14}; in the second shape r_0 ∈ {13, 14, 15}. Using p−14 as the first upper bound would incorrectly admit 15. The admissible base case has f=1, never f=0.
- For p = 23 no exponent satisfies 12 ≤ r ≤ p − 15, so no datum exists; the condition p > 23 is forced, not assumed separately. Admitting a datum here would make the box nonempty when 12>8.
- For p = 29 the exponent r_0 = 11 (inertial weight just below the box) is excluded although `ω^{12}` ⊕ 1 is generic in the sense of EGS15 Definition 2.1.1; BHHMS genericity is strictly stronger. Replacing the stronger box by EGS genericity would incorrectly admit 11.
- (F, D) = (ℚ, M₂(ℚ)) is excluded in the indefinite case: X_V would be a modular curve, which is not proper. Including the split rational case would lose properness.
- For p = 3 no reducible residual representation is generic in the sense of EGS15 (EGS15 Remark 2.1.3); the BHHMS bound p > 5 is not the binding constraint. At p=3 the two excluded endpoint tuples exhaust the reducible range {0}.

*Needs:* HilbertModularVarietiesAndShimuraCurves §R18.1.1; HilbertModularVarietiesAndShimuraCurves §R18.1.3; HilbertModularVarietiesAndShimuraCurves §R18.3.1; LocalGaloisDeformationRings §1.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.26; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; Mathlib `WittVector`; Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Nat.Prime`; Chebotarev Layer 10.

### 0.2 The Buzzard–Diamond–Jarvis set of Serre weights

Let K/ℚ_p be unramified of degree f with residue field k, embeddings κ_j = κ_0 ∘ φ^j : k → 𝔽, and let ρ : G_K → GL₂(𝔽) be continuous. A Serre weight is an irreducible 𝔽-representation `σ_{t,s}` = `⊗_{j=0}^{f−1}(det^{t_j} Sym^{s_j} k²)` `⊗_{k, κ_j}` 𝔽 of GL₂(k), 0 ≤ s_j, t_j ≤ p − 1, not all t_j equal to p − 1. The set W(ρ) of Buzzard–Diamond–Jarvis is a set of Serre weights depending only on ρ, with W(ρ) ⊆ W(ρ^ss). For semisimple reducible ρ, `σ_{t,s}` ∈ W(ρ) if and only if there is J ⊆ {0, …, f − 1} with ρ|I_K ≅ `ω_f^{Σ_j t_j p^j}` ⊗ (`ω_f^{Σ_{j∈J}(s_j+1)p^j}` ⊕ `ω_f^{Σ_{j∉J}(s_j+1)p^j}`); for irreducible ρ, `σ_{t,s}` ∈ W(ρ) if and only if there is J ⊆ {0, …, 2f − 1}, antisymmetric in the sense that i ∈ J exactly when i + f ∉ J (indices modulo 2f, s_j extended f-periodically), with ρ|I_K ≅ `ω_f^{Σ_j t_j p^j}` ⊗ (`ω_{2f}^{Σ_{j∈J}(s_j+1)p^j}` ⊕ `ω_{2f}^{Σ_{j∉J}(s_j+1)p^j}`). For a nonsplit reducible ρ, W(ρ) is the subset of W(ρ^ss) of those weights for which the extension class of ρ lies in the subspace L_α ⊆ H¹(G_K, `𝔽(χ₁χ₂^{−1})`) attached by BDJ10 §3.2 to the weight and some subset J realizing it in the semisimple recipe (the weight lies in W(ρ) when the class lies in L_α for at least one such J; BDJ10 line 1263): the classes that are reductions of crystalline extensions with the associated labelled Hodge–Tate weights, enlarged to all of H¹ when `χ₁χ₂^{−1}` is cyclotomic, s = (p − 1, …, p − 1) (the weight `Sym^{p−1}` at every embedding, BDJ10's b⃗ = (p, …, p) in its indexing `det^{a} Sym^{b−1}`; BDJ10 lines 1321–1322) and J is everything, and by the unramified classes when `χ₁χ₂^{−1}` is trivial and J is not everything. The displayed descriptions use BDJ10 §3 and BHHMS23 §2.3: ω_f is the character I_K → O_K^× → k^× → 𝔽^× induced by inverse geometric Artin reciprocity, with ω₁ equal to the mod p cyclotomic character. EGS15 uses the inverse fundamental characters; with the same Galois representation as input its set D is related by W(ρ) = D_EGS(ρ^∨), not by W(ρ) = D_EGS(ρ).

K/ℚ_p unramified; for ramified K the Buzzard–Diamond–Jarvis recipe is replaced by the generalisations of Schein and Gee, which are not needed here.

Use the BDJ/BHHMS fundamental characters throughout. EGS15 §2 has `κ_{j+1}^p` = κ_j and writes weights using `κ_{−j}`; hence its weight embeddings `κ_{−j}` agree with our κ₀ ∘ φ^j. Its ω_f is our `ω_f^{−1}`, so comparison with its formula requires dualising the input Galois representation.

BHHMS use W(r̄_w^∨), the weight set of the dual representation, because their patched rings are deformation rings of r̄_w^∨ (BHHMS23 §8.1, (61)).

(EGS15, §2.1, pp. 10–11, the description of D(ρ) after Definition 2.1.4 and Lemma 2.1.6; EGS15 line 477; BDJ10, §3.1 (the irreducible case), p. 18; §3.2 (the reducible case, with the spaces L_α and their two exceptional modifications), pp. 21–26; BDJ10 line 834; BHHMS23, §2.2, pp. 13–14; §8.1, p. 87 (the use of W(r̄_w^∨)); BHHMS23 line 4361).

Its API:

- W(ρ) as a Finset of Serre weights of GL₂(k), for K unramified.
- The subset (reducible) and antisymmetric subset (irreducible) descriptions for semisimple ρ.
- W(ρ) ⊆ W(ρ^ss).
- For tame ρ with 1-deep parameter, W(ρ) equals MP.3's tame weight set.
- W(ρ ⊗ χ) = {σ ⊗ (χ̄ ∘ det) : σ ∈ W(ρ)}, χ̄ the character of k^× matching χ|I_K through ω_f.
- For generic ρ every weight is regular (no s_j = p − 1) and not of the form `σ_{t,0}` (EGS15 Lemma 2.1.6).
- For generic semisimple ρ, W(ρ) has exactly 2^f elements.

For p>2 and generic ρ, prove that each σ∈W(ρ) is isolated by a non-scalar tame type τ: JH(σ̄(τ))∩W(ρ)={σ}. Prove that a non-scalar tame type contains W(ρ) among its reduction constituents; for semisimple ρ this type is unique, denoted τ₀, and JH(σ̄(τ₀))=W(ρ). Here σ̄(τ) is the semisimplified reduction of a stable lattice in σ(τ), and uniqueness is up to isomorphism of inertial types (EGS15 Propositions 3.5.1–3.5.2, pp. 14–16; EGS15 lines 687, 767; BHHMS23, paragraph before Theorem 8.3.9, p. 101; BHHMS23 line 5066).

For generic ρ and σ,σ′∈W(ρ) joined by a nonsplit extension of GL₂(k)-representations, prove that there is a tame type τ′ with JH(σ̄(τ′))∩W(ρ)={σ,σ′} and an irreducible-cosocle lattice in σ(τ′) whose cosocle filtration realizes that extension (EGS15 Proposition 10.1.11, pp. 62–63; EGS15 line 3324). The input for all these type assertions is the correspondence, its Jordan–Hölder sets and its lattices from gap:tame-types; W(ρ)=D_EGS(ρ^∨) fixes the input duality.

For every continuous ρ over unramified K and p>2, prove that σ∈W(ρ) if and only if ρ^∨ has a crystalline lift of Hodge type σ in GK14 Definitions 2.2.2–2.2.3, with a coefficient extension allowed. Equivalently, for `σ=σ_{t,s}`, ρ itself has a crystalline lift with labelled Hodge–Tate weights {t_j,t_j+s_j+1} in this roadmap’s convention HT(ε)=+1. GK14 and EGS15 use HT(ε)=−1, so their numerical Hodge weights are negated when transported, and dualizing the Galois representation negates them again. This comparison includes nonsplit extensions and nonregular weights (EGS15 Definition 2.1.7 and Theorem 2.1.8, p. 11; EGS15 lines 527–534; GK14 §2.2, pp. 7–8; GK14 lines 325–371; BDJ10 §3.2, pp. 21–26).

A proof route is as follows. Use BDJ10 §3.1–3.2 directly for the semisimple recipes, including the antisymmetric subset condition, and for W(ρ) ⊆ W(ρ^ss). Translate EGS15 §2 by both its embedding convention and its inverse fundamental characters: W(ρ) = D_EGS(ρ^∨). For the nonsplit reducible case the subset condition is BDJ10's L_J condition, phrased through crystalline lifts with prescribed labelled Hodge–Tate weights (LocalGaloisDeformationRings §§3.1–3.10 supplies the crystalline lifting rings and their points). When ρ is tame and its inertial parameter is 1-deep, the description agrees with the parametrisation of MP.3/tame-weight-set by the extension-graph labels; prove agreement by matching the subset J with the sign vector of MP.3. For weight-isolating and two-weight types, apply EGS15 Propositions 3.5.1 and 10.1.11 to ρ^∨; their reduction to the semisimple case uses W(ρ)⊆W(ρ^ss). The containing type is EGS15 Proposition 3.5.2, with the semisimple equality and uniqueness from BHHMS23 line 5066. For the crystalline comparison apply EGS15 Theorem 2.1.8 to ρ^∨, or the equality recalled in GK14 §2.2 with the same dual input, and use W(ρ)=D_EGS(ρ^∨); this is a local comparison, independent of the global weight theorem §0.6.

**Checks.**

- For K = ℚ_p and ρ|I ≅ `ω^{s+1}` ⊕ 1 with 0 < s < p − 3, W(ρ^ss) = {Sym^s 𝔽², `det^{s+1}` ⊗ `Sym^{p−3−s}` 𝔽²}; for p = 5, s = 1 this is {Sym¹, det² ⊗ Sym¹}. At p=5 the two representations each have dimension 2; replacing the second determinant exponent by −2 would change its character in other primes.
- For K = ℚ_p and ρ|I ≅ `ω_2^{s+1}` ⊕ `ω_2^{p(s+1)}`, 0 ≤ s ≤ p − 1, W(ρ) = {Sym^s 𝔽², det^s ⊗ `Sym^{p−1−s}` 𝔽²}. At p=5,s=1 the weights are Sym¹ and det¹ Sym³, with dimensions 2 and 4.
- For K = ℚ_p and ρ a très ramifiée extension of 1 by ω, W(ρ) = {`Sym^{p−1}` 𝔽²} although W(ρ^ss) also contains the trivial weight: the nonsplit condition removes weights (Serre's weight p + 1). Counting the trivial weight would return 2 weights instead of the one allowed by the extension class.
- For f = 2 and generic semisimple ρ, W(ρ) has 4 weights, one for each subset J ⊆ {0, 1}. A count of 2 rather than 4 would discard one embedding.
- For a tame 1-deep ρ the Finset agrees with MP.3/tame-weight-set elementwise. For f=1,p=29 and inertia ω¹³⊕1, both recipes give Sym¹² and det¹³ Sym¹⁴.
- For p = 5 and semisimple ρ|I = ω³ ⊕ 1, the boundary s = p − 3 gives three weights {Sym², det³, det³ ⊗ Sym⁴}; the two-weight formula applies only away from this boundary. EGS15 computes these weights from the dual inertial input ω_EGS³ ⊕ 1. Using its inverse character on ρ itself fails this test. The count is 3, not 2; the boundary is outside the strict two-weight interval.
- At p=29, f=1 and semisimple inertia ω¹³⊕1, W(ρ)={Sym¹²,det¹³Sym¹⁴}. An isolating type for either weight has intersection of cardinality 1, whereas τ₀ has intersection of cardinality 2 and cannot isolate it. For a nonsplit generic ρ with W(ρ)={σ}⊆W(ρ^ss), intersecting the semisimple isolating set {σ} again gives {σ}, not the two-element semisimple set.
- In this same two-weight case τ₀ has reduction dimension 13+15=28; a scalar type has dimension 1 and a tame principal-series type dimension 30, so neither has this constituent multiset. Semisimplicity is needed for the equality with all of W(ρ).
- For a nonsplit extension 0→σ′→θ→σ→0 of these two weights, the two-weight type has intersection of cardinality 2, and the relevant cosocle layer has dimension 13+15=28. The split sum also has dimension 28, but its cosocle has both weights instead of the required single weight σ; dimension alone does not realize θ.
- For the très ramifiée extension ρ of 1 by ω, the set of σ for which ρ^∨ has a GK14 crystalline lift of Hodge type σ has one element `Sym^{p−1}`, just as W(ρ); the trivial GK14 Hodge type for ρ^∨ is absent because such a lift would give ρ a finite flat model. For the split ω⊕1 the weights are 1, `Sym^{p−1}` and det `Sym^{p−3}`. Thus the extension-class condition changes both sets from cardinality 3 to 1; comparison only with semisimplification would fail.
- For p=29 and split ρ=ω⊕1, the trivial weight lies in W(ρ). In GK14’s convention a lift of trivial Hodge type has determinant reducing to ω⁻¹, not ω: on an inertia element with ω=2 the determinants are 15 and 2. Thus ρ cannot have that raw GK14 Hodge type; ρ^∨ does, via the lift ε⁻¹⊕1. This fixes the dual input in the comparison.

*Needs:* LocalGaloisDeformationRingsPartII gap:tame-types for the type assertions; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.26; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.15; LocalGaloisDeformationRings §3.1; LocalGaloisDeformationRings §3.4; Mathlib `Representation`.

### 0.3 Quaternionic spaces of mod p forms and their residual eigenspaces

Fix a generic global datum and a compact open V = ∏_w V_w ⊆ U with V_w = (O_D)_w^× outside S ∪ {w₁}. For a continuous representation σ of K_S = `∏_{w∈S}` V_w on a finitely generated O-module with a central character compatible with ψ, write c_σ,w for its central character transported to local units, choose the unique residual-trivial character θ_w whose square is ψ_w⁻¹c_σ,w⁻¹ (with the unramified value fixed), and let σ(θ) be the determinant twist by these θ_w (p > 2), and extend the action to V·(𝔸_F^∞)^× by letting (𝔸_F^∞)^× act through (𝔸_F^∞)^×/F^× → `G_F^{ab}` → O^× composed with `ψ^{−1}`. In the indefinite case let X_V be the smooth projective Shimura curve over F (sign convention of BDJ10), replaced by its quotient by the free action of the finite group V(𝔸_F^∞)^×/VF^×, and S(σ) = H¹(X_V ×_F F̄, `F_{σ(θ)^*}`); in the definite case S(σ) is the space of functions f : D^×∖(D ⊗_F 𝔸_F^∞)^× → σ(θ)^* with f(gu) = `u^{−1}f(g)` for u ∈ V(𝔸_F^∞)^×. The algebra `T^{S,univ}` = O[T_w, S_w : w ∉ S ∪ {w₁}] acts through the double cosets of diag(ϖ_w, 1) and diag(ϖ_w, ϖ_w); 𝔪 is the inverse image of the residual evaluation ideal: it contains p, T_w − S_w tr r̄(Frob_w), and Norm(w) − S_w det r̄(Frob_w), with the residual coefficients interpreted modulo p. Then σ ↦ S(σ)_𝔪 is contravariantly exact; in the indefinite case the evaluation map `Hom_{T(σ)_𝔪[G_{F,S}]}(ρ(σ)_𝔪, S(σ)_𝔪)` `⊗_{T(σ)_𝔪}` ρ(σ)_𝔪 → S(σ)_𝔪 is an isomorphism, where ρ(σ)_𝔪 : `G_{F,S}` → GL₂(T(σ)_𝔪) is induced from the universal deformation; and M(σ) is the Pontryagin dual of `Hom_{T(σ)_𝔪[G_{F,S}]}(ρ(σ)_𝔪, S(σ)_𝔪)` (indefinite) or of S(σ)_𝔪 (definite). The resulting σ ↦ M(σ) is covariantly exact. For σ = 𝔽 trivial, when its central character is compatible, the r̄-part `Hom_{G_F}(r̄, H¹_ét(X_V ×_F F̄, 𝔽))` is unchanged by the passage to the quotient curve.

V sufficiently small as specified in EGS15 §6.2, p. 34 (EGS15 line 1695), guaranteed by the choice of `V_{w₁}`; 𝔪 non-Eisenstein because r̄ is absolutely irreducible.

The action of (𝔸_F^∞)^× is through `ψ^{−1}`, not ψ: BHHMS23 Remark 8.1.3(i) corrects EGS15 §6.2 here.

In the indefinite case the curve is replaced by its quotient by the finite group of central elements (BHHMS23 Remark 8.1.3(iii)); this is needed for S(σ) to be well defined with the extended central action.

(EGS15, §6.2, pp. 34–36; EGS15 line 1702; BHHMS23, Remark 8.1.3 (i)–(iii), pp. 88–89; §8.1, p. 89 (definite case); BHHMS23 line 4439).

Its API:

- S(σ) for a finite O-representation σ of K_S with compatible central character, in both cases, functorial in σ. A map σ → σ′ induces S(σ′) → S(σ).
- The maximal ideal 𝔪 ⊆ `T^{S,univ}` attached to r̄, in the BDJ10 normalisation; it is the ideal that HilbertModularVarietiesAndShimuraCurves §R18.3.15, with its arithmetic Frobenius and evaluation T_w ↦ tr, S_w ↦ `q_w^{−1}det`, attaches to r̄ ⊗ ω.
- For 0 → σ₁ → σ₂ → σ₃ → 0, there is an exact sequence 0 → S(σ₃)_𝔪 → S(σ₂)_𝔪 → S(σ₁)_𝔪 → 0; the modules M give the covariant exact sequence.
- In the indefinite case M(σ)^∨ `⊗_{T(σ)_𝔪}` ρ(σ)_𝔪 ≅ S(σ)_𝔪 as T(σ)`_𝔪[G_{F,S}]`-modules.
- `Hom_{G_F}(r̄, H¹(X_V, 𝔽))` is the same for X_V and for its quotient by the free finite central action.
- For V′ ⊆ V normal, `S_{V}(σ)` = `S_{V′}(σ)^{V/V′}` after localisation at 𝔪, compatibly with Hecke operators and G_F.

A proof route is as follows. Construct S(σ) on the HilbertModularVarietiesAndShimuraCurves R18.4 finite-level cohomology with the R18.4 algebraic local systems (indefinite) and on the R18.3 definite class set with its fixed-central-character forms (definite). The Hecke operators T_w, S_w are the R18.4 correspondences; 𝔪 is the R18.3 residual Hecke ideal in the normalisation of BDJ10 §4 (BHHMS23 Remark 8.1.3(ii)). Local systems: a finite σ factoring through K_S/V′ for V′ ⊆ V open normal gives a local system by descent of the constant sheaf along the finite Galois cover `X_{V′}` → X_V, the same torsor construction as HilbertModularVarietiesAndShimuraCurves §R18.4.1 for algebraic coefficients. Exactness: localisation at the non-Eisenstein 𝔪 kills H⁰ and H² of every finite coefficient system (HilbertModularVarietiesAndShimuraCurves §R18.4.8 over 𝔽, by dévissage for finite length coefficients), so the long exact sequences give contravariant exactness of σ ↦ S(σ)_𝔪, since the coefficient system uses σ^*; the additional dual in M restores covariance; taking ψ-parts is exact by HilbertModularVarietiesAndShimuraCurves §R18.4.21. The Galois representation ρ(σ)_𝔪 comes from HilbertModularVarietiesAndShimuraCurves §R18.4.27 (constant weight-two coefficients), dualizing its geometric realization for r̄^∨⊗ω⁻¹ and tensoring by ε⁻¹, through the map from the universal deformation ring: for σ trivial on V′, T(σ)_𝔪 is a quotient of the Hecke algebra acting on constant-coefficient cohomology at level V′; the evaluation isomorphism is the Eichler–Shimura/Boston–Lenstra–Ribet statement cited by EGS15 §6.2 (Carayol, Théorème 4). Quotient curve: the finite group acts freely by §0.1 (BHHMS23 Remark 8.1.3(iii), p. 89; BHHMS23 line 4452); the central kernel is the one identified by HilbertModularVarietiesAndShimuraCurves §R18.1.4. The quotient is a smooth projective curve over F, and `Hom_{G_F}(r̄, H¹)` does not change (BHHMS23 Remark 8.1.3(iii), arguing as in Breuil–Diamond Theorem 3.7.1).

**Checks.**

- S(0) = 0 and M(0) = 0. A construction retaining a nonzero constant coefficient summand would fail.
- If the trivial coefficient has the required central character, S(𝔽) is the constant-coefficient H¹ of the central quotient curve used in the definition. Comparison with the original Shimura curve is asserted on its r̄-part, not on all of H¹. The trivial coefficient local system has rank 1; the quotient comparison is on the r̄-multiplicity space only.
- Modulo 𝔪, X² − `S_w^{−1}T_w` X + `Norm(w)S_w^{−1}` is the characteristic polynomial of r̄(Frob_w) for w ∉ S ∪ {w₁}. For q=5 and roots 2,3 in 𝔽₂₉ the polynomial is X²−5X+6.
- For q=5 and geometric eigenvalues 2,3 in 𝔽₂₉, r̄⊗ω has arithmetic eigenvalues 5/2=17 and 5/3=21. The parent evaluation gives T=17+21=9 and S=5⁻¹·17·21=25, the BDJ values. Applying it to r̄^∨⊗ω⁻¹ instead gives arithmetic eigenvalues 12,18 and (T,S)=(1,20); that representation fails the comparison.
- A concrete obstruction before localisation: for a connected étale C_p-cover of a proper connected curve, the augmentation 𝔽[C_p] → 𝔽 sends the invariant norm vector to p = 0, so H⁰ of the associated local systems is not right exact. Its long exact sequence gives a nonzero connecting class and failure of exactness on H¹. Dualise the coefficients to express this as a failure of exactness of S; non-Eisenstein localisation removes it. The norm vector is nonzero but its augmentation is 29=0 in 𝔽₂₉.

*Needs:* §0.1; HilbertModularVarietiesAndShimuraCurves §R18.1.3; HilbertModularVarietiesAndShimuraCurves §R18.1.4; HilbertModularVarietiesAndShimuraCurves §R18.4.1; HilbertModularVarietiesAndShimuraCurves §R18.4.2; HilbertModularVarietiesAndShimuraCurves §R18.3.1; HilbertModularVarietiesAndShimuraCurves §R18.3.3; HilbertModularVarietiesAndShimuraCurves §R18.3.15; HilbertModularVarietiesAndShimuraCurves §R18.4.8; HilbertModularVarietiesAndShimuraCurves §R18.4.21; HilbertModularVarietiesAndShimuraCurves §R18.4.27; GlobalGaloisDeformations §3.4.

### 0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient

Let V′ ⊆ V be compact open subgroups of (D ⊗_F 𝔸_F^∞)^×, V′ normal in V, with V sufficiently small as specified in EGS15 §6.2, p. 34 (EGS15 line 1695) (for example `V_{w₁}` unipotent upper triangular modulo w₁), so that G = V/V′ (modulo the central part, as in §0.3) acts freely on the quotient curve `X_{V′}`, respectively on D^×∖(D ⊗ 𝔸_F^∞)^×/V′(𝔸_F^∞)^×. Then `H¹_ét(X_{V′} ×_F F̄, 𝔽)`_𝔪 (indefinite) and S(V′, 𝔽)_𝔪 (definite) are finite projective 𝔽[G]-modules, hence injective; for every finite 𝔽[V]-representation σ factoring through G, the Hochschild–Serre map identifies the 𝔪-localised cohomology at level V with coefficients in σ^∗ with Hom_G(σ, `H¹_ét(X_{V′} ×_F F̄, 𝔽)`_𝔪) (resp. Hom_G(σ, S(V′, 𝔽)_𝔪)), compatibly with the Hecke operators away from S ∪ {w₁} and with G_F. The same holds with W(𝔽)/pⁿ coefficients, with projectivity and injectivity over (W(𝔽)/pⁿ)[G]. When G is a p-group these projective modules are free, since the group algebra is local; this includes the Taylor–Wiles quotients and the pro-p congruence quotients used below.

𝔪 is non-Eisenstein because r̄ is absolutely irreducible; the free action of G at small level is the condition imposed by the auxiliary place w₁ (EGS15 §6.2; BHHMS23 Remark 8.1.3(iii), citing Breuil–Diamond Lemme 3.6.2).

(BHHMS23, proof of Corollary 8.4.6, part (i), p. 107; (64), p. 89; BHHMS23 line 5376; EGS15, §6.2, p. 35; EGS15 line 1753).

A proof route is as follows. Indefinite case: `X_{V′}` → X_V is a finite étale Galois cover with group G, so `RΓ(X_{V′}, 𝔽)` ≅ RΓ(X_V, 𝔽[G]) is a perfect complex of 𝔽[G]-modules computed by the Hochschild–Serre spectral sequence of HilbertModularVarietiesAndShimuraCurves §R18.4.6 (the case where p divides |G|). After localisation at 𝔪, H⁰ and H² vanish (HilbertModularVarietiesAndShimuraCurves §R18.4.8). The remaining finite module has finite projective dimension over 𝔽[G]. Use the finite-group coefficient duality `TauCeti.MonoidAlgebra.dualLinearEquiv` to identify its dual functor with the exact field dual. Thus the finite group algebra is self-injective; splitting a finite projective resolution from its last nonzero term forces projectivity, and `Module.Injective.of_finite_projective` gives injectivity. For W(𝔽)/pⁿ the same argument uses its Frobenius group algebra and the corresponding perfect coefficient complex: coefficient duality over the self-injective principal Artinian ring W(𝔽)/pⁿ makes the group algebra self-injective, and the same splitting argument applies. Projective implies free when G is a p-group, not for an arbitrary finite G. The Hochschild–Serre spectral sequence for coefficients σ therefore degenerates and gives the Hom description; Hecke operators and G_F commute with the comparison maps. Definite case: S(V′, 𝔽) is the space of functions on a finite set on which G acts freely, so it is free over 𝔽[G] before localisation; the 𝔪-part is a direct summand, since the Hecke operators away from S ∪ {w₁} commute with G. This uses no parity of [F:ℚ]; the even-degree Taylor–Wiles statement HilbertModularVarietiesAndShimuraCurves §R18.3.14 is not needed. A direct summand is projective; no assertion that it is free for arbitrary G is needed.

**Checks.**

- For G=C₂ over 𝔽₂₉, the trivial summand has vector dimension 1 while every nonzero free 𝔽₂₉[G]-module has even dimension; it is projective, not free. For a p-group C₂₉ a rank-one group-ring module has dimension 29.

- For G=S₃ and coefficients 𝔽₂₉, the trivial module is a projective summand of the regular module, with dimensions 1 and 6 respectively; it cannot be free. This is a nonabelian negative control for replacing projectivity by freeness.

- For G=C₃=⟨g⟩, the coefficient at 1 of g·g⁻¹ is 1, while that of g·g is 0. In the ordered basis (1,g,g²), the pairing given by the coefficient at 1 of xy has matrix ((1,0,0),(0,0,1),(0,1,0)), with determinant −1, a unit even modulo pⁿ. Pairing equal group elements instead would give the identity matrix and would miss the inverse in the duality formula.

*Needs:* §0.1 for auxiliary-level freeness; §0.3; HilbertModularVarietiesAndShimuraCurves §R18.4.6; HilbertModularVarietiesAndShimuraCurves §R18.4.8; HilbertModularVarietiesAndShimuraCurves §R18.4.2; HilbertModularVarietiesAndShimuraCurves §R18.1.4; HilbertModularVarietiesAndShimuraCurves §R18.3.1; Tau Ceti `TauCeti.MonoidAlgebra.dualLinearEquiv`; Tau Ceti `Module.Injective.of_finite_projective`.

### 0.5 Mod p cohomology of Shimura curves at infinite level at v

Fix a generic global datum and Serre weights σ_w ∈ W(r̄_w^∨) for w ∈ S_p ∖ {v}, and a tame level V^v = `∏_{w≠v}` V_w with V_w = U_w for w ∉ S_p and V_w ⊆ 1 + `pM₂(O_{F_w})` normal in `GL₂(O_{F_w})` for w ∈ S_p ∖ {v}. Define the smooth representation π of GL₂(F_v) over 𝔽 as the colimit over compact open V_v ⊆ GL₂(F_v) of `Hom_{U^v/V^v}(⊗_{w∈S_p∖{v}} σ_w, Hom_{G_F}(r̄, H¹_ét(X_{V^vV_v} ×_F F̄, 𝔽)))` in the indefinite case, and of `Hom_{U^v/V^v}(⊗_w σ_w, S(V^vV_v, 𝔽)[𝔪])` in the definite case; GL₂(F_v) acts through the Hecke action of g ∈ GL₂(F_v) between the levels V_v and `gV_vg^{−1}`. Then π is admissible, has central character `ψ^{−1}` (on F_v^× through local class field theory), and π ≠ 0. The unweighted variant π(V^v) = `colim_{V_v}` `Hom_{G_F}(r̄, H¹_ét(X_{V^vV_v} ×_F F̄, 𝔽))` (definite: colim S(V^vV_v, 𝔽)[𝔪]) is admissible smooth for every tame level V^v; when `V_{w₁}` consists of the matrices upper triangular and unipotent modulo w₁, V_w = U_w at the other places outside S_p, and V_w ⊆ 1 + `pM₂(O_{F_w})` is normal in `GL₂(O_{F_w})` at w ∈ S_p ∖ {v}, it has a finite filtration whose graded pieces are subrepresentations of weighted π's, at least one of them nonzero if π(V^v) ≠ 0 (BHHMS23 (83)).

Admissibility: for every compact open V_v the invariants `π^{V_v}` are finite-dimensional, being contained in the r̄-part of a finite-level cohomology group (non-Eisenstein localisation makes the comparison with finite level exact).

The σ_w are taken in W(r̄_w^∨) so that π ≠ 0 by the weight theorem; for other weights the corresponding space vanishes.

(BHHMS23, (1) and (2), §1.1–1.2, pp. 2–4; (66)–(67), §8.1, p. 90; (83) and the proof of Corollary 8.4.6, pp. 106–107; BHHMS23 line 4528; DL21, §6.1, pp. 53–54; DL21 line 3111).

Its API:

- π for given weights σ_w at w ∈ S_p ∖ {v}, as a smooth 𝔽-representation of GL₂(F_v).
- `π^{V_v}` is finite-dimensional for every compact open V_v.
- The centre F_v^× acts on π through `ψ^{−1}` composed with local class field theory.
- For V_v ⊆ 1 + `pM₂(O_{F_v})` normal in `GL₂(O_{F_v})`, `π^{V_v}` is the finite-level space `Hom_{U^v/V^v}(⊗σ_w, Hom_{G_F}(r̄, H¹(X_{V^vV_v})))` .
- π ≠ 0 for σ_w ∈ W(r̄_w^∨).
- For the shrunken tame levels of BHHMS23 (83) (unipotent at w₁, normal pro-p levels above p other than v), π(V^v) has a finite filtration whose graded pieces embed into weighted π's.

A proof route is as follows. The colimit is the fixed-exponent smooth colimit of CompletedCohomologyPartII §§1.1–1.3, applied to the quaternionic Shimura-curve tower (CompletedCohomologyPartII §§8.3–8.4; in the definite case the tower is a system of finite sets) with the level varying at v only, which is cofinal in the levels at v; smoothness and the GL₂(F_v)-action are CompletedCohomologyPartII §1.2, and the Hecke operators away from S ∪ {w₁} are CompletedCohomologyPartII §1.3 for this tower, with the `ψ^{−1}` central twist. Admissibility: by §0.4 the V_v-invariants of the colimit agree with the finite-level r̄-part at level V^vV_v for V_v small, which is finite-dimensional. Central character: the centre acts through `ψ^{−1}` because of the twisted central action in the definition of the spaces (§0.3). Nonvanishing: §0.6 with σ_w ∈ W(r̄_w^∨) and the existence of some weight σ_v ∈ W(r̄_v^∨). Dévissage (BHHMS23 (83)), for the shrunken levels only: write the maximal central-character quotient of `Ind_{V_w}^{GL₂(O_{F_w})}` 1 as an iterated extension of Serre weights; injectivity of the localized H¹ as a U^v/V^v-representation (§0.4) lets one bound π(V^v) by the weighted pieces.

**Checks.**

- If σ_w ∉ W(r̄_w^∨) for some w ∈ S_p ∖ {v} then the weighted π is 0. A construction returning a nonzero space for that weight would contradict the two-way weight theorem.
- `π^{K₁}` with K₁ = 1 + `pM₂(O_{F_v})` is the finite-level weighted r̄-part at level V^vK₁; it is a GL₂(k_v)-representation (used in §3.4). At f=1, p=29 and r̄_v|I ≅ ω¹⁵⊕1 (r₀=14, inside the box), r̄_v^∨|I ≅ ω¹³⊕1 and the modular socle has the two weights Sym¹² and det¹³ Sym¹⁴, each r times; for r̄_v|I ≅ ω¹³⊕1 it is {det¹⁵Sym¹², Sym¹⁴}, each r times.
- Under a compatible global character twist r̄ ↦ r̄ ⊗ χ, ψ changes to ψχ², so the new central character is `ψ^{−1}χ^{−2}`. The corresponding local determinant twist, when levels and away-from-v weights are transported, is `χ̃^{−1}` ∘ det. The positive twist gives the wrong central character. At χ(z)=2 in 𝔽₂₉ the factors are 22 and 4 respectively.
- For the nonzero weighted π, §5.1 gives dimension f ≥ 1. A finite-dimensional smooth representation has dimension 0 because its dual is a finite-length Iwasawa module. Thus π is infinite-dimensional; this is a downstream consequence, not an assumption in its definition. At f=1 the positive GK dimension is 1, whereas finite-dimensional nonzero representations give 0.

*Needs:* §0.3; §0.4; §0.2; CompletedCohomologyPartII §1.1; CompletedCohomologyPartII §1.2; CompletedCohomologyPartII §1.3; CompletedCohomologyPartII §§8.3–8.4; SmoothRepresentationsOfLocalGroups §SR.0.1–SR.0.4; §0.6 for the nonvanishing conclusion.

### 0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)

Let p > 2, F totally real, r̄ : G_F → GL₂(𝔽) modular with r̄|`G_{F(ζ_p)}` absolutely irreducible (and, for p = 5, projective image of r̄|`G_{F(ζ_5)}` not A₅), and D a quaternion algebra over F split above p and at no more than one infinite place, compatible with r̄ at its finite ramified places: at each such w, r̄_w is absolutely irreducible or a twist of an extension of 1 by ω (GK14 Definition 5.5.3, p. 34; GK14 line 1602). For Serre weights σ_w of GL₂(k_w), w | p, r̄ is modular for D of weight ⊗_w σ_w if and only if σ_w ∈ `W^{BT}(r̄|G_{F_w})` for all w | p, where `W^{BT}` is the set of weights with nonzero Breuil–Mézard multiplicity. When p is unramified in F, `W^{BT}(ρ)` equals W(ρ^∨) in the BDJ convention of §0.2; the Breuil–Mézard symbols in this paragraph retain GK14’s Hodge-type labels. Here ψ is a fixed character with det r̄ = `ψε^{−1}` modulo p, the weights are compatible with ψ, and r̄ is modular for D of weight σ if the 𝔪-part of the space of forms of weight σ is nonzero at some level (GK14 Definitions 5.5.2–5.5.3). In the setting of a generic global datum (BHHMS normalisations, which dualise r̄): for V with V_w ⊆ 1 + `pM₂(O_{F_w})` normal at w ∈ S_p and such that r̄ is modular at level V (BHHMS23 (60)), `Hom_{GL₂(O_F ⊗ ℤ_p)}(⊗_{w∈S_p}σ_w, Hom_{G_F}(r̄, H¹_ét(X_V ×_F F̄, 𝔽)))` ≠ 0 if and only if σ_w ∈ W(r̄_w^∨) for every w ∈ S_p, and in the definite case the same holds with S(V, 𝔽)[𝔪] in place of the r̄-part of H¹.

p > 2 and, for p = 5, the A₅ exception excluded; both hold for a generic global datum (BHHMS: p > 23).

The identification `W^{BT}(ρ)` = W(ρ^∨) for p unramified uses Gee–Kisin Theorem A(1) and the crystalline comparison recalled there; the supplier gives the crystalline description and §0.2 the comparison, including its duality adapter (EGS15 Theorem 2.1.8; EGS15 line 533).

For the quaternionic Taylor–Wiles datum, fixed away-from-p types (at each finite place where D ramifies a scalar or irreducible type, with the starred components of GK14 §5.2.6 when the type is scalar) and compatible global Serre weight σ=`⊗_{w|p}σ_w` of GK14 §5.4, prove `S_{τ^p}(U,σ)_𝔪`≠0 if and only if every `μ_{σ_w}(r̄_w)`>0; equivalently, its patched weight module is nonzero exactly for those tuples. This global nonvanishing is GK14 Corollary 5.4.5, p. 33 (GK14 line 1573), with the modularity, residual irreducibility and p=5 image hypotheses above.

(GK14, Theorem B (= Corollary 5.5.7), p. 3 and p. 35; Corollary 5.5.4 with Definitions 5.5.2–5.5.3, p. 34; Corollary 5.4.5, p. 33; GK14 line 1605; BHHMS23, (61), §8.1, p. 87; BHHMS23 line 4355; EGS15, §6.4, last paragraph, p. 37; EGS15 line 1832).

A proof route is as follows. Patching (GK14 §5.4): for each potentially Barsotti–Tate type, patch the spaces of quaternionic forms with that type at p (DeformationAndDerivedPatchingAlgebra §§5.6, 8.1–8.5) and compare the Hilbert–Samuel multiplicity of the patched module modulo ϖ (DeformationAndDerivedPatchingAlgebra §3.11–3.12) with the Breuil–Mézard multiplicity of the potentially Barsotti–Tate deformation ring; filtering the type lattice modulo ϖ by Serre weights gives one inequality and the Breuil–Mézard identity (GK14 Theorem A, the supplier gap) the other. The comparison needs full component support of the patched type module, not only its maximal Cohen–Macaulay property. First, gap:quaternionic-component-realization gives, for each choice of an irreducible component of every local fixed-determinant type ring at the places of S (potentially Barsotti–Tate of type τ_v at v | p), a modular lift of r̄ with determinant ψε⁻¹, unramified outside S, lying on each chosen component (GK14 Lemma 5.2.5, p. 27; GK14 line 1253). Derive the quaternionic version (GK14 Lemma 5.3.6, p. 30; GK14 line 1400). At each finite place w where D ramifies the type τ_w is scalar or irreducible as a Weil type, and when τ_w is scalar only the components of the type ring whose points are not all potentially unramified are chosen (the starred rings of GK14 §5.2.6, p. 27; GK14 lines 1278–1286); apply gap:quaternionic-component-realization to these components. Suppose the Hilbert eigenform π attached to the lift were not discrete series at such a w. It is not one-dimensional, so π_w is an irreducible principal series, and since τ_w is scalar or irreducible (an irreducible type admits no principal series) π_w is a twist γ ⊗ π′ of an unramified principal series with τ_w scalar. By the Ramanujan–Petersson theorem (AutomorphicGaloisRepresentations §4.2) π′ is tempered, and by local–global compatibility at w ∤ p (AutomorphicGaloisRepresentations §§4.3–4.4) γ⁻¹ ⊗ ρ|`G_{F_w}` is unramified with N = 0 and Frobenius eigenvalues of equal absolute value. On a starred component every point, including a point on its intersection with a potentially unramified component, is an extension of γ by γ(1) up to the choice of γ, with Frobenius eigenvalue ratio q_w or q_w⁻¹ (GK14 lines 1289–1294); this contradicts equal absolute values. Hence π is discrete series at w; it transfers to D by global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10) and gives an eigenform of type τ on D. A principal-series type χ₁ ⊕ χ₂ with χ₁|I ≠ χ₂|I is excluded at the ramified places of D: its lifts have N = 0 and come from ramified principal series, which do not transfer. Hence the support of the patched module meets every irreducible component of the generic fibre of the patched type ring, and the patched module is locally free of the common generic rank over its formally smooth locus (GK14 Lemma 5.4.3(1)–(2), pp. 31–32; GK14 line 1475). Only then compare multiplicities (GK14 Lemma 5.4.3(4) and Proposition 5.4.4) and deduce (GK14 Corollary 5.4.5) that the patched module of a Serre weight σ is nonzero exactly when its Breuil–Mézard multiplicity is nonzero. Potential diagonalisability of potentially Barsotti–Tate lifts (PotentialAutomorphyInfrastructurePartII PL.1) is a local input to that lifting gap; it does not by itself give component support. Translate into the original BDJ formulation (GK14 Corollary 5.5.4): Shapiro-type identity (5.5.5) between forms of type τ^p and forms of weight σ at smaller level, and the compatibility of r̄ with D at the ramified places. For BHHMS's normalisation: the space Hom(⊗σ_w, `Hom_{G_F}(r̄, H¹)`) corresponds to the 𝔪-part of forms of weight ⊗σ_w^∨ twisted by ψ; transporting the coefficients and Galois normalization as in §0.3 yields W(r̄_w^∨) (BHHMS23 (61), citing GK14 §5.5). The raw GK14 input and its Hodge-type labels are transported together, rather than identifying its crystalline-weight set with W of the same Galois input.

**Checks.**

- At f=1, the generic two-weight input gives nonzero weight spaces for two weights and zero for any third weight; for p=5 the A₅ exception is explicitly excluded even though 5>2. Both directions are tested against this same membership rule.
- For a Fontaine–Laffaille regular predicted local weight over an unramified K, μ_σ=1; for a weight outside the predicted set μ_σ=0 (GK14 Theorem A(2), p. 3; GK14 line 112). For two places with multiplicities 1 and 1 the patched multiplicity product is 1; replacing either by 0 gives product 0 and the global weight space vanishes.
- At a ramified place w of D with q_w=3, a principal-series type χ₁ ⊕ χ₂ with χ₁ tamely ramified quadratic and χ₂ trivial on inertia is neither scalar nor irreducible: its lifts have N = 0 and are attached to ramified principal series, which are not discrete series, so it is excluded from the datum. A scalar type on the starred component has Frobenius eigenvalue ratio 3 or 1/3 at every point, of absolute value ≠ 1, whereas a tempered unramified twist has ratio of absolute value 1; this separation is what forces discrete series.
- Over A=k[[x,y]]/(xy), the module M=A/(x) has depth 1 = dim A, so it is maximal Cohen–Macaulay, but it is supported on only one of the two branches; its Hilbert–Samuel multiplicity is e(M)=1 whereas e(A)=2. A maximal Cohen–Macaulay patched module, or one modular point, therefore does not give the multiplicity identity; the component-realization input supplies a point on every branch and excludes this module.

*Needs:* §0.2; §0.3; PotentialAutomorphyInfrastructurePartII gap:quaternionic-component-realization; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10; AutomorphicGaloisRepresentations §4.2; AutomorphicGaloisRepresentations §§4.3–4.4; DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5; DeformationAndDerivedPatchingAlgebra §8.4; DeformationAndDerivedPatchingAlgebra §3.11–3.12; PotentialAutomorphyInfrastructurePartII PL.1/potentially-barsotti-tate-diagonalizable; LocalGaloisDeformationRings §3.4; the Breuil–Mézard supplier gap.

### 0.7 Doubling at the auxiliary place w₁

Let V^v = `∏_{w≠v}V_w` be a tame level with `V_{w₁}` = `GL₂(O_{F_{w₁}})` (r̄ unramified at w₁), and let V′^v agree with V^v except that `V′_{w₁}` is the group of matrices upper triangular and unipotent modulo w₁. Then for every sufficiently small V_v there is an isomorphism `Hom_{G_F}(r̄, H¹_ét(X_{V^vV_v} ×_F F̄, 𝔽))^{⊕2}` ≅ `Hom_{G_F}(r̄, H¹_ét(X_{V′^vV_v} ×_F F̄, 𝔽))`, and hence a GL₂(F_v)-equivariant isomorphism `π(V^v)^{⊕2}` ≅ π(V′^v). BHHMS prove the indefinite case and state that the definite case (with S(−, 𝔽)[𝔪]) is similar; the compatibility of the finite-level isomorphisms with change of V_v, which gives the equivariance of the colimit, is part of the argument below.

The three conditions on w₁ of the generic global datum: Norm(w₁) ≢ 1 mod p, eigenvalue ratio of `r̄(Frob_{w₁})` outside {1, `Norm(w₁)^{±1}`}, and the root-of-unity condition.

(BHHMS23, proof of Corollary 8.4.6, part (ii), p. 107; BHHMS23 line 5389; EGS15, §6.2, p. 34; EGS15 line 1686).

A proof route is as follows. Since Norm(w₁) ≢ 1 mod p, the torus quotient (`k_{w₁}^×`)² of the Iwahori level by `V′_{w₁}` has order prime to p, so the cohomology at level V′ splits into isotypic parts for its characters; an eigenform in a part with a nontrivial character has local component at w₁ either a principal series Ind(χ₁ ⊗ χ₂) with χ₁|O^× or χ₂|O^× nontrivial or a twist St ⊗ (χ ∘ det) of the Steinberg representation by a ramified tame character χ (depth-zero supercuspidals have no invariants under `V′_{w₁}`, and one-dimensional components are removed by non-Eisenstein localization). In both cases, after global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10), local–global compatibility away from p (AutomorphicGaloisRepresentations §4.4) shows that inertia at w₁ acts on the semisimplified Weil–Deligne representation through a nontrivial tame character of order dividing Norm(w₁) − 1, which is prime to p and so stays nontrivial modulo p; as r̄ is unramified at w₁, only the trivial character contributes to the r̄-part, and `V′_{w₁}`-level equals Iwahori level after taking r̄-parts (work with the integral, 𝔪-localised, O-free cohomology of HilbertModularVarietiesAndShimuraCurves §R18.4.10 and its eigenspace decomposition HilbertModularVarietiesAndShimuraCurves §R18.4.25). At Iwahori level the two degeneracy maps (HilbertModularVarietiesAndShimuraCurves §R18.4.5) give δ from two copies of the hyperspecial level to Iwahori level, with δ†δ the Gram operator (HilbertModularVarietiesAndShimuraCurves §R18.4.15, HilbertModularVarietiesAndShimuraCurves §R18.4.14). On the 𝔪-part at hyperspecial level, `T_{w₁}` and `S_{w₁}` act through the Eichler–Shimura relation for `r̄(Frob_{w₁})`, whose eigenvalues α, β are distinct, so the Gram determinant becomes Δ = (Norm(w₁) − α/β)(Norm(w₁) − β/α), a unit by the eigenvalue condition; hence δ is injective with image a direct summand (HilbertModularVarietiesAndShimuraCurves §R18.4.16). There is no new part after localisation: an eigenform new at w₁ is special at w₁; transferring it to GL₂ by global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10), local–global compatibility at w₁ ∤ p (AutomorphicGaloisRepresentations §4.4) shows that the eigenvalue ratio of its residual Frobenius would be `Norm(w₁)^{±1}`, which is excluded; comparing ranks in characteristic zero and using the direct-summand property gives an isomorphism integrally, hence modulo p. The isomorphisms are induced by correspondences at w₁ only, so they commute with change of V_v and with the GL₂(F_v)-action, and pass to the colimit (BHHMS23 proof of Corollary 8.4.6 (ii)). The definite case runs the same argument on the finite class sets, over every totally real F: the integral and residual coefficient spaces are those of HilbertModularVarietiesAndShimuraCurves §§R18.3.1, R18.3.3; the degeneracy maps are the finite-set pullbacks π₁*, π₂* of HilbertModularVarietiesAndShimuraCurves §R18.3.8 (definiteIhara_injective, stated for arbitrary totally real F) with their trace maps; counting the q_w + 1 cosets of each map and composing them with the double-coset normalization `T_w`, `S_w` of HilbertModularVarietiesAndShimuraCurves §R18.3.6, as in the proof route of §R18.4.15, gives δ†δ = `G_(q_w,T_w,S_w)` of §R18.4.14, and §R18.4.16 gives the splitting; central-character parts are taken through HilbertModularVarietiesAndShimuraCurves §R18.4.21. The exclusion of the new part is unchanged. The definite degeneracy theorem §R18.3.9 of the parent assumes [F:ℚ] even and is not used.

**Checks.**

- For q=2 and eigenvalue ratio 3 over 𝔽₂₉, (2−3)(2−3⁻¹)=8≠0; at ratio 2 the product is 0. Thus two hyperspecial copies persist precisely in the unit-discriminant case.
- Over a totally real cubic field, an indefinite D has two ramified real places and an even number of finite ramified places. Its non-norm weight-two eigenforms transfer by §§R17.3.1, R17.3.10; a special component at w₁ has residual Frobenius ratio q or q⁻¹. For q=2 over 𝔽₂₉ those ratios are 2 and 15, both excluded, while ratio 3 remains allowed. The even-degree definite theorem would not cover this datum.
- Over F=ℚ with D definite, ramified at ∞ and at one prime ℓ ≠ p, Norm(w₁), the class sets at hyperspecial and Iwahori level at w₁ exist and both degeneracy maps are defined (HilbertModularVarietiesAndShimuraCurves §R18.3.8 imposes no parity on [F:ℚ]); with `q_{w₁}`=2 and residual eigenvalue ratio 3 in 𝔽₂₉ the Gram determinant is (2−3)(2−3⁻¹) = (−1)(2−10) = 8 ≠ 0. Here [F:ℚ] = 1 is odd, so the even-degree hypothesis of §R18.3.9 would exclude this datum.
- At `q_{w₁}`=3 let χ be the tamely ramified quadratic character. Then St ⊗ (χ ∘ det) has a nonzero vector fixed by `V′_{w₁}` on which the torus (`k_{w₁}^×`)² acts by the nontrivial character χ ⊗ χ, but it is a twisted Steinberg representation, not a principal series. Its inertial character takes the value −1 ≡ 28 ≠ 1 in 𝔽₂₉, so it is excluded from the r̄-part for the same reason as a ramified principal series.

*Needs:* §0.1; §0.5; HilbertModularVarietiesAndShimuraCurves §R18.4.5; HilbertModularVarietiesAndShimuraCurves §R18.4.14; HilbertModularVarietiesAndShimuraCurves §R18.4.15; HilbertModularVarietiesAndShimuraCurves §R18.4.16; HilbertModularVarietiesAndShimuraCurves §R18.4.10; HilbertModularVarietiesAndShimuraCurves §R18.4.25; HilbertModularVarietiesAndShimuraCurves §R18.3.1; HilbertModularVarietiesAndShimuraCurves §R18.3.3; HilbertModularVarietiesAndShimuraCurves §R18.3.6; HilbertModularVarietiesAndShimuraCurves §R18.3.8; HilbertModularVarietiesAndShimuraCurves §R18.4.21; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10; AutomorphicGaloisRepresentations §§4.3–4.4.

### Examples

At p=29, f=1 the reducible box is {12,13,14} and the irreducible box is {13,14,15}; at p=23 the upper reducible bound is 8<12. The admissible base case has f=1, never f=0.

At p=5, inertia ω²⊕1 has weights Sym¹ and det² Sym¹ (two); inertia ω³⊕1 has Sym², det³ and det³ Sym⁴ (three). At f=2 a generic semisimple parameter has 2²=4 weights.

For q=2 and eigenvalue ratio 3 over 𝔽₂₉, (2−3)(2−3⁻¹)=8≠0; at ratio 2 the product is 0. Thus two hyperspecial copies persist precisely in the unit-discriminant case.

### Dependencies

Use HilbertModularVarietiesAndShimuraCurves §R18.1.1; HilbertModularVarietiesAndShimuraCurves §R18.1.3; HilbertModularVarietiesAndShimuraCurves §R18.3.1; LocalGaloisDeformationRings §1.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.26; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; Mathlib `WittVector`; Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Nat.Prime`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.15; LocalGaloisDeformationRings §3.1; LocalGaloisDeformationRings §3.4; Mathlib `Representation`; HilbertModularVarietiesAndShimuraCurves §R18.1.4; HilbertModularVarietiesAndShimuraCurves §R18.4.1; HilbertModularVarietiesAndShimuraCurves §R18.4.2; HilbertModularVarietiesAndShimuraCurves §R18.3.3; HilbertModularVarietiesAndShimuraCurves §R18.3.15; HilbertModularVarietiesAndShimuraCurves §R18.4.8; HilbertModularVarietiesAndShimuraCurves §R18.4.21; HilbertModularVarietiesAndShimuraCurves §R18.4.27; GlobalGaloisDeformations §3.4; HilbertModularVarietiesAndShimuraCurves §R18.4.6; CompletedCohomologyPartII §1.1; CompletedCohomologyPartII §1.2; CompletedCohomologyPartII §1.3; CompletedCohomologyPartII §§8.3–8.4; SmoothRepresentationsOfLocalGroups §SR.0.1–SR.0.4; DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5; DeformationAndDerivedPatchingAlgebra §8.4; DeformationAndDerivedPatchingAlgebra §3.11–3.12; PotentialAutomorphyInfrastructurePartII PL.1/potentially-barsotti-tate-diagonalizable; PotentialAutomorphyInfrastructurePartII gap:quaternionic-component-realization; HilbertModularVarietiesAndShimuraCurves §R18.4.5; HilbertModularVarietiesAndShimuraCurves §R18.4.14; HilbertModularVarietiesAndShimuraCurves §R18.4.15; HilbertModularVarietiesAndShimuraCurves §R18.4.16; HilbertModularVarietiesAndShimuraCurves §R18.4.10; HilbertModularVarietiesAndShimuraCurves §R18.4.25; HilbertModularVarietiesAndShimuraCurves §R18.3.1; HilbertModularVarietiesAndShimuraCurves §R18.3.3; HilbertModularVarietiesAndShimuraCurves §R18.3.6; HilbertModularVarietiesAndShimuraCurves §R18.3.8; HilbertModularVarietiesAndShimuraCurves §R18.4.21; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10; AutomorphicGaloisRepresentations §4.2; AutomorphicGaloisRepresentations §§4.3–4.4. Each subsection above identifies the earlier local targets needed for its statement and route.

## Layer 1: Patching functors and the big patched module

### 1.1 The patched local deformation ring R∞

For a generic global datum, fix a Serre weight σ_w ∈ W(r̄_w^∨) at each w ∈ S_p ∖ {v} as in §0.5. Choose a non-scalar tame inertial type τ_w with JH(σ(τ_w^∨) mod p) ∩ W(r̄_w^∨) = {σ_w}, using §0.2 and gap:tame-types. These choices are retained in §1.4. For integers q ≥ [F : ℚ], put R^loc = (`⊗̂_{w∈S∖S_p}` `R_{r̄_w}^{ψ_w}`) ⊗̂ (`⊗̂_{w∈S_p∖{v}}` `R_{r̄_w}^{(0,−1),τ_w,ψ_w}`) ⊗̂ `R_{r̄_v}^{ψ_v}` over W(𝔽), where `R^{ψ_w}` is the framed deformation ring of r̄_w with determinant `ε^{−1}ψ_w` and `R^{(0,−1),τ_w,ψ_w}` its reduced p-torsion-free quotient of parallel Hodge–Tate weights (0, −1) and inertial type τ_w; R∞ = R^loc⟦X₁, …, `X_{q−[F:ℚ]+|S|−1}`⟧ and S∞ = W(𝔽)⟦x₁, …, `x_{4|S|+q−1}`⟧ with a local W(𝔽)-algebra map S∞ → R∞. Then `R_{r̄_w}^{ψ_w}` ≅ W(𝔽)⟦X₁, X₂, X₃⟧ for w ∈ S ∖ S_p, `R_{r̄_v}^{ψ_v}` ≅ W(𝔽)⟦X₁, …, `X_{3+3f}`⟧, `R_{r̄_w}^{(0,−1),τ_w,ψ_w}` ≅ `R_{r̄_w^∨}^{(1,0),τ_w^∨,ψ_w^{−1}}` ≅ W(𝔽)⟦X₁, …, `X_{3+[F_w:ℚ_p]}`⟧ for w ∈ S_p ∖ {v}, and consequently R∞ ≅ `R_{r̄_v}^{ψ_v}⟦X₁, …, X_{4(|S|−1)+q−f}⟧` ≅ W(𝔽)⟦X₁, …, `X_{4|S|+q−1+2f}`⟧; in particular dim R∞ − dim S∞ = 2f.

For a fixed Hodge and inertial type, the unfixed-determinant lifting ring is the fixed-determinant ring with one unramified determinant variable (GK14 Remark 5.2.2). The analogous one-variable assertion is not made for the unrestricted local deformation ring at v, where determinant characters have ramified directions as well.

Formal smoothness of `R_{r̄_w}^{ψ_w}` for w ∈ S ∖ S_p is a hypothesis of the datum; for `R_{r̄_v}^{ψ_v}` BHHMS deduce it from genericity of r̄_v (the reason, supplied here, is that `H²(G_{F_v}, ad⁰ r̄_v)` vanishes by local duality).

For these weight-isolating types, the potentially Barsotti–Tate rings at w ∈ S_p ∖ {v} are formally smooth of relative dimension 3+[F_w:ℚ_p]: the interval of modular constituents has a single element, so EGS15 Theorem 7.2.1(2) has no crossing coordinates (EGS15 lines 2197–2226; LocalGaloisDeformationRingsPartII gap:single-type-rings). The selection precedes the ring construction in BHHMS23 lines 4406–4438.

(BHHMS23, §8.1, (63) and the paragraph before it, pp. 88–89; BHHMS23 line 4422; GK14, §5.4.1 and Remark 5.2.2; GK14 line 1220; EGS15, §6.4, p. 36; EGS15 line 1802).

Its API:

- R^loc as the completed tensor product of the fixed-determinant local rings with the type quotients at w ∈ S_p ∖ {v}.
- R∞ = R^loc⟦X₁, …, `X_{q−[F:ℚ]+|S|−1}`⟧.
- S∞ = W(𝔽)⟦x₁, …, `x_{4|S|+q−1}`⟧ with the local map S∞ → R∞.
- The number 4|S| + q − 1 + 2f of variables of R∞ over W(𝔽), with the auxiliary variable count = 4|S| + q − 1 for S∞.
- R∞ ≅ W(𝔽)⟦X₁, …, `X_{4|S|+q−1+2f}`⟧ as local W(𝔽)-algebras.
- Krull dim R∞ − Krull dim S∞ = 2f.
- `R_{r̄_v}^{ψ_v}` ≅ W(𝔽)⟦X₁, …, `X_{3+3f}`⟧ for generic r̄_v.
- `R_{r̄_w}^{(0,−1),τ_w,ψ_w}` ≅ `R_{r̄_w^∨}^{(1,0),τ_w^∨,ψ_w^{−1}}` by dualising lifts.

A proof route is as follows. Build R^loc and R∞ as completed tensor products and power series rings of the local lifting rings of LocalGaloisDeformationRings §§1.1, 1.4, 1.10 with fixed determinant (LocalGaloisDeformationRings §1.10, 1.24). Away from p: formal smoothness of the unfixed ring gives W(𝔽)⟦X₁, …, X₄⟧; fixing the determinant and cancelling one variable gives three variables. At v: genericity gives `H²(G_{F_v}, ad⁰ r̄_v)` = 0 by local duality (ad⁰ r̄_v has no ω-twist of the trivial character as a quotient), so the fixed-determinant ring is formally smooth of relative dimension 3 + 3f (LocalGaloisDeformationRings §1.4). At w ∈ S_p ∖ {v}: duality of Galois representations identifies the (0, −1) ring of r̄_w with the (1, 0) ring of r̄_w^∨, which, by the one-modular-weight choice of τ_w, is a power series ring in 3 + [F_w : ℚ_p] variables (EGS15 Theorem 7.2.1(2), gap:single-type-rings). Count: `Σ_{w∈S_p}` [F_w : ℚ_p] = [F : ℚ] since p is unramified in F, so the number of variables over `R_{r̄_v}^{ψ_v}` is 3|S∖S_p| + `Σ_{w∈S_p∖{v}}(3 + [F_w:ℚ_p])` + q − [F:ℚ] + |S| − 1 = 4(|S| − 1) + q − f, and adding 3 + 3f gives 4|S| + q − 1 + 2f.

**Checks.**

- For a generic global datum with F=ℚ and definite D ramified at {ℓ,∞}, ℓ≠p, take S={p,ℓ} and q=1. Then f=1, |S|=2: R∞ has 4·2+1−1+2=10 variables and S∞ has 8, giving Krull dimensions 11 and 9. A one-place S with f=1 would force either the excluded split rational curve or a nonexistent definite quaternion algebra ramified only at ∞.
- (3 + 3f) + (4(|S| − 1) + q − f) = 4|S| + q − 1 + 2f for all |S| ≥ 1, q ≥ f. For |S|=1,q=f=2 the two sides are 9=9; S∞ has 5 variables, so the Krull dimensions are 10 and 6, with difference 4.
- At an away place of degree one with p=29 and r̄_w^∨|I ≅ ω¹³⊕1, the modular weights are Sym¹² and det¹³Sym¹⁴, of dimensions 13 and 15. A type containing both has ring O⟦x,y,z₁,z₂,z₃⟧/(xy−p): its special fibre has dimension 4 and cotangent dimension 5 at the closed point. A type isolating either weight instead gives O⟦t₁,t₂,t₃,t₄⟧, with special-fibre dimension and cotangent dimension both 4. Thus genericity alone does not imply formal smoothness for every type (EGS15 Theorem 7.2.1(2), pp. 42–43; EGS15 line 2197).
- A fixed Hodge/inertial-type quotient gains one unramified determinant variable when its determinant is released (GK14 Remark 5.2.2). For the unrestricted factor at v, local class field theory gives f + 1 determinant directions for p > 2; treating this factor as a one-variable extension of its fixed-determinant ring gives the wrong dimension. At f=2 the unrestricted determinant has 3 directions, not 1.
- If S = {v} (so F has a single place above p, f = [F:ℚ]) then R∞ = `R_{r̄_v}^{ψ_v}⟦X₁, …, X_{q−f}⟧`. At q=f the additional formal-variable set is empty; the ring is the local factor itself.

*Needs:* §0.1; §0.2; LocalGaloisDeformationRingsPartII gap:tame-types and gap:single-type-rings; DeformationAndDerivedPatchingAlgebra gap:power-series-cancellation; LocalGaloisDeformationRings §1.1; LocalGaloisDeformationRings §1.10, 1.24; LocalGaloisDeformationRings §1.4; GlobalGaloisDeformations §3.5–3.7; GlobalGaloisDeformations §5.8; Mathlib `MvPowerSeries`; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 1.2 Type and Hodge–Tate quotients of the patched ring

For a tame inertial type τ of `I_{F_v}` and λ = `((a_j, b_j))_{0≤j<f}` with a_j > b_j, let `R_{r̄_v^∨}^{λ,τ}` be the reduced p-torsion-free quotient of the framed ring `R_{r̄_v^∨}` whose Q̄_p-points are the potentially crystalline lifts of r̄_v^∨ of inertial type τ and labelled Hodge–Tate weights (a_j, b_j) at the embedding σ_j; put `R∞^{λ,τ}` = R∞ `⊗_{R_{r̄_v^∨}}` `R_{r̄_v^∨}^{λ,τ}`, `p_{λ,τ}` = ker(R∞ ↠ `R∞^{λ,τ}`), `R̄∞^{λ,τ}` = `R∞^{λ,τ}`/(p), and write `R∞^{(a,b),τ}` when λ_j = (a, b) for all j. Because of the fixed determinant, `R∞^{λ,τ}` ≠ 0 forces a_j + b_j = 1 for all j; the cases used are λ_j ∈ {(1, 0), (2, −1)}, and after twisting by ε, λ_j ∈ {(2, 1), (3, 0)}.

τ tame; R∞ is the patched ring of §1.1 (whose local factor at v is a ring for r̄_v^∨ under the duality used there).

The domain property of `R∞^{λ,τ}` for the relevant λ, τ and the reducedness of `R̄∞^{(2,−1)_j,τ}` come from the local-ring supplier contract (BHHMS23 Proposition 4.2.1, Corollary 4.2.6).

(BHHMS23, (69), §8.2, p. 91; proof of Theorem 8.3.9, p. 101; BHHMS23 line 4601; EGS15, §6.1, pp. 32–33; EGS15 line 1597).

Its API:

- `R∞^{λ,τ}` for λ = ((a_j, b_j)) and tame τ, with the quotient map from R∞.
- `p_{λ,τ}` = ker(R∞ ↠ `R∞^{λ,τ}`); a prime ideal whenever `R∞^{λ,τ}` is a domain.
- A map R∞ → O′ factors through `R∞^{λ,τ}` iff the induced lift of r̄_v^∨ is potentially crystalline of type τ with labelled weights λ.
- `R∞^{λ,τ}` = 0 unless a_j + b_j = 1 for every j.
- Twisting lifts by ε, ρ ↦ ρ ⊗ ε, is an isomorphism from the fixed-determinant framed ring of r̄_v^∨ with determinant `εψ_v^{−1}` to the fixed-determinant framed ring of r̄_v^∨(1) with determinant `ε³ψ_v^{−1}`. Write `R∞(r̄_v^∨;εψ_v^{−1})` = R∞ and `R∞(r̄_v^∨(1);ε³ψ_v^{−1})` for the patched ring whose factor at v is transported along this isomorphism, with the same structural map from S∞. Twisting identifies the (λ,τ)-quotient of the first with the (λ+(1,1),τ)-quotient of the second. The second is a quotient for the residual representation r̄_v^∨(1); inside the original residual problem every (λ+(1,1),τ)-quotient is zero, since its determinant weight would be 3 instead of 1.
- When nonzero, Krull dim `R∞^{(1,0),τ}` = dim S∞ = 4|S| + q.

A proof route is as follows. Define `R_{r̄_v^∨}^{λ,τ}` as Kisin's potentially crystalline quotient of LocalGaloisDeformationRings §3.4 with the p-adic Hodge type given by λ and Galois type τ (LocalGaloisDeformationRings §3.1), after twisting by a power of ε so that the weights lie in [0, h] as LocalGaloisDeformationRings §3.4 requires (for example (2, −1) becomes (3, 0)), and base change along `R_{r̄_v^∨}` → R∞. The nonvanishing condition a_j + b_j = 1: points of the fixed-determinant ring of r̄_v^∨ have determinant `εψ_v^{−1}` (the dual of `ε^{−1}ψ_v`), of labelled Hodge–Tate weight 1 at every embedding, and the labelled weight of the determinant at σ_j is a_j + b_j. Twisting all lifts by ε shifts every weight by (1, 1) and replaces the residual representation r̄_v^∨ by r̄_v^∨(1), identifying the (1,0)/(2,−1) quotients of `R∞(r̄_v^∨;εψ_v^{−1})` with the (2,1)/(3,0) quotients of `R∞(r̄_v^∨(1);ε³ψ_v^{−1})`, of determinant `ε³ψ_v^{−1}`; the inertial type τ is unchanged because ε is crystalline (BHHMS23 proof of Theorem 8.3.9, p. 101; BHHMS23 line 5074; LocalGaloisDeformationRings §1.24 for twisting of fixed-determinant rings).

**Checks.**

- λ = (1, 0) at every embedding gives potentially Barsotti–Tate lifts of type τ. Their determinant weight is 1 at every embedding. Twisting (2,−1) by ε gives (3,0), with determinant weight 3.
- λ_j = (2, 0) for some j gives the zero ring (a_j + b_j = 2 ≠ 1). The determinant has weight 2 instead of 1; nonzero characteristic-zero points cannot exist.
- 1 + (3 + f) + 4(|S| − 1) + q − f = 4|S| + q: the type quotient has the dimension of S∞. For f=1, |S|=2, q=1 in the definite rational datum of §1.1, the two dimensions are 9=9.
- For τ trivial and λ_j = (2, −1) at one embedding, a nonzero characteristic-zero point is crystalline but not Barsotti–Tate: its labelled Hodge–Tate weights differ from (1, 0). This point cannot factor through the Barsotti–Tate quotient. The test makes no nonzero-point assertion for a zero quotient. At the exceptional embedding the two multisets {2,−1} and {1,0} differ despite having equal sum 1.
- At p=29 take an inertia element g with ω(g)=2. The twisted residual representation r̄_v^∨(1) has residual determinant 4·det r̄_v^∨(g), and the reduction of `ε³ψ_v^{−1}` at g is likewise 2²=4 times the reduction of `εψ_v^{−1}`; both sides of the twisted problem agree. Demanding instead lifts of the original r̄_v^∨ with determinant `ε³ψ_v^{−1}` compares residual determinants det r̄_v^∨(g) and 4·det r̄_v^∨(g), which differ in 𝔽₂₉, so that fixed-determinant functor is empty.

*Needs:* §1.1; LocalGaloisDeformationRings §1.24; LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRings §3.1; LocalGaloisDeformationRings §3.9–3.10; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 1.3 Fixed-determinant patching functors

Let K = `GL₂(O_{F_v})` (more generally a product of compact open subgroups of GL₂ or of units of quaternion division algebras at finitely many places), R∞ = R⟦x₁, …, x_h⟧ over a completed tensor product R of framed local deformation rings, and C_Z′ a Serre subcategory of the category of continuous representations of K on finitely generated O-modules with central character lifting `(ω^{−1} det ρ̄)`|_I ∘ Art, the reduction of the finite-order part ε⁻¹ det of the determinant `εψ^{−1}` of the lifts of ρ̄ in this roadmap's convention (EGS15 Definition 6.1.3 writes (ε det ρ̄)|_I because its lifts have determinant ψ_σ ε⁻¹, EGS15 lines 1588 and 1594); for ρ̄ = r̄_v^∨ this is the reduction of `ψ_v^{−1}`|`I_{F_v}`, the central character of every weight of W(r̄_v^∨) (BHHMS23 lines 4409–4410) and of the domain of §1.4. A fixed-determinant patching functor is a covariant exact functor M∞ from C_Z′ to finitely generated R∞-modules (coherent sheaves on Spf R∞) such that: (1) for every σ, M∞(σ) is supported on the fixed-determinant locus `X∞^{ψ_σ}` of lifts with determinant εψ_σ, where ψ_σ is a character of `G_{F_v}` whose restriction to inertia, composed with Art, is the central character of σ; (2) for every K-stable O-lattice σ°(τ) in σ(τ) belonging to C_Z′, for an inertial type τ, M∞(σ°(τ)) is p-torsion free, supported on `R∞^{ψ,τ}` and maximal Cohen–Macaulay over it; (3) for every Serre weight σ in C_Z′ (an irreducible representation killed by ϖ), M∞(σ) is supported on the special fibre of `R∞^{ψ,σ}` and maximal Cohen–Macaulay over it. It is minimal if M∞(σ°(τ)) is locally free of rank one over the generic fibre whenever that generic fibre is regular. In conditions (2) and (3) the zero value is allowed; for a nonzero value maximal Cohen–Macaulay means depth equals the indicated ring dimension.

Fix a lift Φ_v of geometric Frobenius and a unit α_v∈O× lifting (ω⁻¹ det ρ̄)(Φ_v). The character ψ_σ in condition (1) is chosen to extend the central character under Artin reciprocity and satisfy ψ_σ(Φ_v)=α_v; in the product setting make these choices at each local factor. For the arithmetic functor, ρ̄=r̄_v^∨ and α_v=ψ_v⁻¹(Φ_v). Thus the unramified determinant value is prescribed as well as the inertial value (EGS15 §6.1, pp. 32–33; EGS15 lines 1584–1594).

Here `R∞^{ψ,τ}` is the potentially crystalline Hodge type 0 (that is, weights (1,0) after BHHMS's normalisation) quotient and `R∞^{ψ,σ}` the crystalline quotient of Hodge type σ.

Maximal Cohen–Macaulay is in the sense of DeformationAndDerivedPatchingAlgebra §§3.1–3.4, 6.1: depth equals the dimension of the ring over which it is taken.

(EGS15, §6.1: Definitions 6.1.1 and 6.1.3, Lemma 6.1.4 and the paragraph after it (minimality), pp. 32–34; EGS15 line 1603; BHHMS23, §1.3.2, p. 7; §8.1, p. 88; BHHMS23 line 4416).

Its API:

- An exact additive functor from the specified Serre subcategory of continuous K-representations on finite O-modules with the prescribed residual central character to finitely generated R∞-modules, with the three support and Cohen–Macaulay fields.
- Short exact sequences of K-representations go to short exact sequences of R∞-modules.
- If `R∞^{ψ,τ}` is regular then M∞(σ°(τ)) is free over it (EGS15 Lemma 6.1.4).
- If `R∞^{ψ,τ}[1/p]` is regular then M∞(σ°(τ))[1/p] is locally free over it.
- The extension to finitely generated objects by inverse limits over σ/ϖⁿσ, still exact.
- The minimality predicate: rank one over regular generic fibres of type loci.

A proof route is as follows. Take EGS15 Definitions 6.1.1 and 6.1.3 as mathematical specifications, specialised to one place v with K = `GL₂(O_{F_v})` and the BHHMS central character `ψ^{−1}`|`I_{F_v}`. Lemma (EGS15 6.1.4): if `X∞^{ψ,τ}` is regular then M∞(σ°(τ)) is free over it; if its generic fibre is regular then M∞(σ°(τ))[1/p] is locally free. Proof: maximal Cohen–Macaulay modules over regular local rings are free by Auslander–Buchsbaum (DeformationAndDerivedPatchingAlgebra §3.1). Extend from finite length objects to finitely generated ones by M∞(σ) = lim_n M∞(σ/ϖⁿσ) (EGS15 §6.4).

**Checks.**

- The zero functor satisfies all three conditions (the zero module is maximal Cohen–Macaulay by convention); nonvanishing is not part of the definition. At a nonempty regular type locus zero has rank 0, so this does not satisfy rank-one minimality.
- Over a regular type locus A = W(𝔽)⟦X₁, …, X_n⟧, a maximal Cohen–Macaulay module is A^r for some r. For r=2 the resulting module is A², not necessarily A.
- A^r ⊕ A/(X₁) is supported on Spec A but not maximal Cohen–Macaulay over A, so it cannot be a value M∞(σ°(τ)). For A=O[[X₁]] the depth is 1 while dim A=2.
- The central character is fixed in this roadmap's determinant convention. At p=29 take g ∈ `I_{F_v}` with ω(g)=2 and det r̄_v^∨(g)=1: the required residual central value is (ω⁻¹ det r̄_v^∨)(g) = 2⁻¹ = 15, which is ψ̄_v⁻¹(g) since det r̄_v^∨ = ωψ̄_v⁻¹. EGS15's formula (ω det ρ̄)(g) gives 2, for ρ̄ = r̄_v^∨ and equally for ρ̄ = r̄_v; it would exclude every weight of W(r̄_v^∨) and the domain of §1.4.
- A module with nonzero p-torsion, such as A/(p) ⊕ A, cannot be M∞(σ°(τ)) by condition (2). Multiplication by p kills a nonzero vector (1,0); p-torsion-freeness fails.
- At p=29, unramified characters with Φ_v-values 1 and 30 have the same residual and inertial characters, but their characteristic-zero values have ratio 30≠1. Choosing α_v=1 permits the first and excludes the second. An inertial central-character condition alone does not determine the fixed determinant.

*Needs:* §1.2; §1.1; DeformationAndDerivedPatchingAlgebra §3.1, 6.1; DeformationAndDerivedPatchingAlgebra §3.1; Mathlib `Module.support`.

### 1.4 The patching functor of Shimura curves at v

Let a generic global datum be given. Retain the weight σ_w and non-scalar tame inertial type τ_w chosen in §1.1 for each w ∈ S_p ∖ {v}, and fix a `GL₂(O_{F_w})`-stable lattice σ°(τ_w^∨), free over W(𝔽); put σ_p^v = `⊗_{w∈S_p∖{v}}` σ°(τ_w^∨), a representation of `∏_{w∈S∖{v}}` U_w through its quotient `∏_{w∈S_p∖{v}}` `GL₂(O_{F_w})`. Taylor–Wiles–Kisin patching of the modules M(σ_p^v ⊗ σ_v) at auxiliary levels produces integers q ≥ [F:ℚ], the rings S∞ → R∞ of §1.1 and an exact functor M∞ = `M∞^{σ_p^v}` : σ_v ↦ M∞(σ_p^v ⊗ σ_v) from continuous representations of K = `GL₂(O_{F_v})` on finitely generated W(𝔽)-modules with central character `ψ^{−1}`|`I_{F_v}` to finitely generated R∞-modules, such that: M∞(σ_v)/(x₁, …, `x_{4|S|+q−1}`) ≅ M(σ_p^v ⊗ σ_v), compatibly with a surjection R∞/(x) ↠ `R_S^{loc-cond}`, where `R_S^{loc-cond}` is the global deformation ring with the specified local conditions; the action of R^loc on M∞(σ_v) factors through the fixed-determinant quotient at v and, at w ∈ S_p ∖ {v}, through `R_{r̄_w}^{(0,−1),τ_w,ψ_w}`; M∞(σ_v) is free over S∞ when σ_v is free over W(𝔽), and free over S∞/(p) when σ_v is free over 𝔽; and M∞ is a fixed-determinant patching functor.

The weight-isolating types retained from §1.1 come from §0.2 (EGS15 Proposition 3.5.1), using the local correspondence and lattices of gap:tame-types. Their coefficient lattices have exact central character ψ⁻¹ on O_Fw× under Artin reciprocity: their tame central characters are the Teichmüller lifts of the central character of σ_w (BHHMS23 lines 4406–4411).

The construction uses one choice (non-principal ultrafilter or diagonal subsequence) for all σ_v simultaneously, so that M∞ is a functor: there are only countably many isomorphism classes of finite length σ_v (EGS15 §6.4).

The central character convention is BHHMS's: (𝔸_F^∞)^× acts through `ψ^{−1}` (BHHMS23 Remark 8.1.3(i)).

(BHHMS23, §8.1, (62) and the definition of `M∞^{σ_p^v}`, pp. 88; Remark 8.1.3, pp. 88–89; BHHMS23 line 4416; EGS15, §6.4, pp. 36–37; EGS15 line 1802; GK14, §5.4, pp. 30–33; GK14 line 1423).

Its API:

- `M∞^{σ_p^v}` as a fixed-determinant patching functor for the patched ring R∞, depending on the datum, σ_p^v and the patching choice.
- M∞(σ_v)/(x₁, …, `x_{4|S|+q−1}`) ≅ M(σ_p^v ⊗ σ_v), naturally in σ_v, with a compatible surjection R∞/(x) ↠ `R_S^{loc-cond}` to the global ring with the chosen local conditions. An isomorphism of these rings is not part of the patching construction.
- M∞(σ_v) is finite free over S∞ for σ_v free over W(𝔽), and over S∞/(p) for σ_v free over 𝔽.
- At w ∈ S_p ∖ {v}, R^loc acts through `R_{r̄_w}^{(0,−1),τ_w,ψ_w}`.
- A K-equivariant map σ_v → σ_v′ induces an R∞-linear map, compatibly with composition, identities and augmentation.
- The functor satisfies the three conditions of a fixed-determinant patching functor.
- For every Serre weight σ_v with the fixed central character, the local action on M∞(σ_v) factors through the special fibre of the fixed-determinant crystalline weight locus `R∞^{ψ,σ_v}`; M∞(σ_v)≠0 exactly when σ_v∈W(r̄_v^∨). The factorization is an assertion about the module action, including nilpotents, rather than only characteristic-zero points (EGS15 §6.4, p. 37; EGS15 line 1832).

A proof route is as follows. Taylor–Wiles data Q_N (GlobalGaloisDeformations §§5.1, 5.7–5.8; the generator count in Gee's convention, GlobalGaloisDeformations §5.8, gives q − [F:ℚ] + |S| − 1 patching variables, with q ≥ [F:ℚ] for p > 5 and r̄|`G_{F(ζ_p)}` absolutely irreducible) at level N, with the spaces at auxiliary level free over the group rings of the `Δ_{Q_N}` (§0.4, which imposes no parity on [F:ℚ] and applies because each `Δ_{Q_N}` is a p-group). Patch the modules `M(σ_p^v ⊗ σ_v)_{Q_N}` with their framings over S∞ by the finite-data extraction of DeformationAndDerivedPatchingAlgebra §§5.6, 8.1–8.5 (patching-extraction, patched-module, patched-ring-action), simultaneously for all finite length σ_v; extend to finitely generated σ_v by inverse limits. The functor σ ↦ S(σ)_𝔪 is contravariantly exact (§0.3); its dual multiplicity module M is covariantly exact at every auxiliary level. Patching preserves this exact system, giving covariant exactness of M∞. Support at w ∈ S_p ∖ {v}: local–global compatibility for the type σ°(τ_w^∨) (EGS15 §6.4). Support at v for lattices in types: local–global compatibility; for Serre weights: establish the scheme-theoretic crystalline weight-locus factorization as a support step of this construction (EGS15 §6.4, p. 37; EGS15 line 1832), using the crystalline weight quotients of §1.2 and finite-level Galois actions of §0.3; use the local Breuil–Mézard identity and §0.6 for weight nonvanishing. The global factorization is part of this target, rather than an assertion supplied by a local deformation ring. Maximal Cohen–Macaulay: M∞(σ°(τ)) is finite free over the regular ring S∞ and dim `R∞^{ψ,τ}` = dim S∞, so Auslander–Buchsbaum gives the maximal depth (EGS15 §6.4).

**Checks.**

- M∞(0) = 0. A functor with a constant nonzero summand would fail.
- For a Serre weight σ_v ∉ W(r̄_v^∨), M∞(σ_v) = 0 (by §1.5 and Nakayama). The residual fibre is 0, and finite-module Nakayama gives the value 0.
- At a Fontaine–Laffaille regular σ∈W(r̄_v^∨), §0.6 gives a nonzero residual weight fibre, so the patched value is nonzero; for σ outside this set both vanish. The raw GK14 multiplicities are compared with this weight set using §0.2’s duality adapter. A zero functor meets the abstract support axioms of §1.3 but fails this arithmetic nonvanishing.
- Scheme-theoretic support cannot be replaced by a condition on field-valued points: for A=𝔽[ε]/ε², the module A has ε·1=ε≠0 although ε vanishes at its unique field-valued point. The module A/(ε) has ε·1=0. Only the latter action factors through A/(ε).
- If τ_w were chosen with two weights of W(r̄_w^∨) in JH(σ(τ_w^∨)), the fibre M∞(σ_v)/𝔪∞ would compute a space involving both weights at w, not Hom_K(σ_v, π)^∨ for the weighted π of §0.5; the single-weight choice is essential. The incorrectly mixed fibre has dimension r₁+r₂; when r₁=r₂=1 it is 2 instead of 1.
- For a lattice σ°(τ) in a tame type τ whose ring `R∞^{(1,0),τ}` is regular (for example a power series ring over W(𝔽)), M∞(σ°(τ)) is free over `R∞^{(1,0),τ}` (patching-functor property and Auslander–Buchsbaum). The zero module is allowed with rank 0; the arithmetic functor has positive rank when its modular weights occur.

*Needs:* §0.3; §0.2; §0.6; §1.1; §1.2; §1.3; §0.4; GlobalGaloisDeformations §5.1; GlobalGaloisDeformations §5.7; GlobalGaloisDeformations §5.8; DeformationAndDerivedPatchingAlgebra §8.1–8.4; DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5; DeformationAndDerivedPatchingAlgebra §8.4; DeformationAndDerivedPatchingAlgebra §5.6; HilbertModularVarietiesAndShimuraCurves §R18.4.21; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps; the Breuil–Mézard supplier gap.

### 1.5 Fibres of the patching functor at the maximal ideal

For every continuous representation σ_v of K = `GL₂(O_{F_v})` on a finitely generated W(𝔽)-module with central character `ψ^{−1}`|`I_{F_v}` (no smoothness of σ_v is assumed: algebraic coefficients such as V(α_j) ⊗ P̃ of §4.1 are allowed), choose V_v ⊆ 1 + `pM₂(O_{F_v})`, normal in K, acting trivially on the finite representation σ_v/pσ_v (its kernel is open by continuity). There are natural isomorphisms of finite-dimensional 𝔽-vector spaces M∞(σ_v)/𝔪∞ ≅ M∞(σ_v/pσ_v)/𝔪∞ ≅ `Hom_{U_v/V_v}(σ_v/pσ_v, Hom_{U^v/V^v}(⊗_{w∈S_p∖{v}}σ_w, Hom_{G_F}(r̄, H¹_ét(X_V ×_F F̄, 𝔽))))^∨` ≅ Hom_K(σ_v, π)^∨ in the indefinite case (every K-map σ_v → π factors through σ_v/pσ_v, since pπ = 0), with S(V, 𝔽)[𝔪] in place of the r̄-part in the definite case, where π is the weighted representation of §0.5 and σ_w the unique weight of W(r̄_w^∨) in JH(σ(τ_w^∨)). In particular M∞(σ_v) ≠ 0 if and only if JH(σ_v/pσ_v) ∩ W(r̄_v^∨) ≠ ∅.

V_w = U_w for w ∉ S_p and V_w ⊆ 1 + `pM₂(O_{F_w})` normal in `GL₂(O_{F_w})` for w ∈ S_p.

The fibre is taken at the maximal ideal 𝔪∞ of R∞, after the augmentation of S∞.

(BHHMS23, (64), (65) and (68), §8.1, pp. 89–90; BHHMS23 line 4546; EGS15, (6.1), §6.3, p. 36; EGS15 line 1799).

A proof route is as follows. First replace σ_v by σ_v/pσ_v: factor multiplication by p as σ_v ↠ pσ_v ↪ σ_v; exactness of M∞ gives M∞(σ_v)/pM∞(σ_v) ≅ M∞(σ_v/pσ_v), and p ∈ 𝔪∞; this applies whether or not K acts on σ_v through a finite quotient. Then reduce modulo (x₁, …) and then modulo the maximal ideal of `R_S^{univ}`: by the augmentation isomorphism this is M(σ_p^v ⊗ σ_v)/𝔪, which in the indefinite case is dual to the r̄-part of S(σ_p^v ⊗ σ_v)[𝔪] by the evaluation isomorphism (§0.3). Hochschild–Serre for the normal subgroup V ⊆ U (§0.4: finite quotient acting freely, non-Eisenstein localisation) identifies the r̄-part at level U with coefficients σ_p^v ⊗ σ_v with `Hom_{U/V}((σ_p^v ⊗ σ_v)/ϖ, r̄-part at level V)` (BHHMS23 (64), citing the proofs of BDJ10 Lemma 4.11 and Breuil–Diamond Lemme 3.6.2). Since JH(σ°(τ_w^∨)/ϖ) contains only one weight σ_w of W(r̄_w^∨), and weights outside W(r̄_w^∨) contribute nothing by §0.6, the type lattice at w may be replaced by σ_w; passing to the colimit over V_v gives Hom_K(σ_v, π)^∨ (BHHMS23 (68)). Nonvanishing: use M∞(σ_v)/p ≅ M∞(σ_v/pσ_v), Nakayama for the finite R∞-module, and exactness. The finite-length representation σ_v/pσ_v has a constituent in W(r̄_v^∨) exactly when M∞(σ_v) is nonzero. Jordan–Hölder factors are not assigned directly to an infinite-length O-lattice.

**Checks.**

- For f=1 the element g = diag(1+pⁿ,1) acts on the vector E₁₂ of V(α₀) = Sym² ⊗ det⁻¹ by 1+pⁿ ≠ 1 for every n, so K acts on L₀ = R through no finite quotient and no V_v acts trivially on L₀. Its reduction L₀/pL₀ is a finite set with a continuous K-action, so its kernel is open, and Hom_K(L₀, π) = Hom_K(L₀/pL₀, π) because π is killed by p; the fibre identity applies to L₀ through this reduction. Requiring σ_v itself to be smooth would exclude the glued lattices to which §4.7 applies the identity.
- A free support-rank-r value has residual fibre 𝔽^r; for r=2 both sides of the fibre identity have dimension 2. An integral lattice has infinite O-length, whereas its reduction has finite length, so constituents are taken after reduction.

*Needs:* §1.4; §0.5; §0.6; §0.3; §0.4; HilbertModularVarietiesAndShimuraCurves §R18.4.10.

### 1.6 The big patched module with its GL₂(F_v)-action

With the data of §1.4 (and the same σ_p^v, with Hecke operators at the places of S′ forgotten), the patching construction of DL21 §6.2 (using CEGGPS16 §2 as described in BHHMS23 Theorem 8.4.1(ii)) produces a profinite R∞⟦K⟧-module M∞, K = `GL₂(O_{F_v})`, with an R∞-linear continuous action of GL₂(F_v) extending the K-action, such that: M∞ is finite free over S∞⟦K₁/Z₁⟧; M∞ is finite projective over S∞⟦K⟧_Z, the largest quotient of S∞⟦K⟧ on which the centre of K acts through ψ|`I_{F_v}`; M∞/𝔪∞M∞ ≅ π^∨ for the weighted π of §0.5; and for every continuous representation σ_v of K on a finitely generated W(𝔽)-module with central character `ψ^{−1}`|`I_{F_v}`, smooth or not, M∞(σ_v) ≅ `Hom^{cont}_{W(𝔽)⟦K⟧}(M∞, σ_v^∨)^∨`, where (−)^∨ = `Hom^{cont}_{W(𝔽)}(−, E/W(𝔽))`. If moreover p is inert in F, put C = M∞ `⊗_{S∞}` W(𝔽). In the indefinite case C ≅ `Hom_{W(𝔽)}(Ĉ(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))`, the W(𝔽)-dual of the completed Galois multiplicity module of §5.6, and after a choice of basis of the rank-two universal deformation over `R_{r̄,S∪{w₁}}^ψ` the dual of full localized completed cohomology is `Hom_{W(𝔽)}(Ĥ¹(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))` ≅ `C^{⊕2}`; in the definite case C ≅ `Hom_{W(𝔽)}(Ŝ(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))`. These identifications are compatible with the surjections R∞ `⊗_{S∞}` W(𝔽) ↠ `R_{r̄,S∪{w₁}}^ψ` ↠ `T̂(V^v)_{r̄}^{ψ^{−1}}`, which are the same in both cases.

Here K₁ = 1 + `pM₂(O_{F_v})` and Z₁ the centre of K₁; K₁/Z₁ is a uniform pro-p group of dimension 3f (p > 2, F_v unramified).

The construction uses the same Taylor–Wiles data and patching choice as §1.4, so that the two are compatible; a choice of basis of the universal deformation over `R_{r̄,S∪{w₁}}^ψ` is among the choices (BHHMS23 §8.5).

(BHHMS23, proof of Theorem 8.4.1, part (ii), p. 104; proof of Theorem 8.4.2, p. 105; §8.5, (84), p. 108; BHHMS23 line 5213; DL21, Theorem 6.2 and §6.2, pp. 54–55; DL21 line 3111; CEGGPS16, §2, in particular the properties of M∞ listed before §2.12 and Proposition 2.13; CEGGPS16 line 1369).

Its API:

- M∞ as a profinite R∞⟦K⟧-module with a continuous R∞-linear GL₂(F_v)-action extending the K-action.
- M∞ is finite free over S∞⟦K₁/Z₁⟧.
- M∞ is finite projective over S∞⟦K⟧_Z.
- M∞/𝔪∞M∞ ≅ π^∨, GL₂(F_v)-equivariantly.
- M∞(σ_v) ≅ `Hom^{cont}_{W(𝔽)⟦K⟧}(M∞, σ_v^∨)^∨` naturally in σ_v.
- For p inert: C = M∞ `⊗_{S∞}` W(𝔽) is the W(𝔽)-dual of the completed multiplicity module `Ĉ(V^v)_{r̄}^{ψ^{−1}}` in the indefinite case and of `Ŝ(V^v)_{r̄}^{ψ^{−1}}` in the definite case, with the surjections R∞ `⊗_{S∞}` W(𝔽) ↠ `R^ψ_{r̄,S∪{w₁}}` ↠ `T̂(V^v)_{r̄}^{ψ^{−1}}`.
- For p inert, indefinite case: a basis of the universal deformation gives `Hom_{W(𝔽)}(Ĥ¹(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))` ≅ `C^{⊕2}` as `T̂(V^v)_{r̄}^{ψ^{−1}}`-modules with GL₂(F_v)-action.
- For x : R∞ → O′, V(x) = `Hom^{cont}_{O′}(M∞ ⊗_{R∞,x} O′, E′)` with its GL₂(F_v)-action.

A proof route is as follows. Replace K^v by U^v and the representation V of DL21 §6.1 by σ_p^v, and forget the Hecke operators T_w at w ∈ S′ (no multiplicity one is needed); patch the dual completed cohomology at Taylor–Wiles levels as in DL21 §6.2 (BHHMS23 proof of Theorem 8.4.1 (ii)). Freeness over S∞⟦K₁/Z₁⟧ and projectivity over S∞⟦K⟧_Z: at each auxiliary level and each finite quotient K₁/V of K₁ the dual 𝔪-localised cohomology is free over the finite group ring (§0.4, with DeformationAndDerivedPatchingAlgebra §7.2–7.3 for the finite groups); patch these finite S∞/J-modules (DeformationAndDerivedPatchingAlgebra §§5.6, 8.1–8.5) compatibly in J and V and pass to the inverse limit, which gives freeness over S∞⟦K₁/Z₁⟧. The fibre M∞/𝔪∞ ≅ π^∨ and the comparison with the patching functor M∞(σ_v) = Hom(M∞, σ_v^∨)^∨ follow from the construction and from (68) (§1.5). When p is inert, reducing modulo (x₁, …) recovers the dual of the patched object, which in the indefinite case is the completed multiplicity module Ĉ (DL21 §6.2, where the auxiliary-level modules are duals of the Galois multiplicity spaces; DL21 lines 3164–3167 and 3200–3228), and the surjections onto the global deformation ring and the big Hecke algebra (BHHMS23 (84), citing CEGGPS16 §2 and DL21 §6). The finite-level evaluation isomorphism of §0.3 passes to the completion and gives Ĥ¹ ≅ Ĉ `⊗_{T̂}` ρ_T̂, hence Ĥ¹ ≅ `Ĉ^{⊕2}` after the basis choice recorded in BHHMS23 §8.5 (BHHMS23 line 5443); the single-copy identification printed at BHHMS23 line 5441 holds for Ĉ, not for full Ĥ¹, in the indefinite case.

**Checks.**

- M∞/(p, x₁, …, `x_{4|S|+q−1}`) is finite projective over 𝔽⟦K⟧_Z and is `⊕_{σ∈W(r̄_v^∨)}(Proj_{K/Z₁}σ^∨)^{m_σ}` with m_σ ≥ 1 (BHHMS23 proof of Theorem 8.4.2). Taking all weights, including a nonmodular one, would introduce a projective summand of multiplicity 0 rather than ≥1.
- M∞ is not finitely generated over R∞ alone: its fibre π^∨ at 𝔪∞ is infinite-dimensional; finiteness holds only over R∞⟦K⟧. For f=1 the residual canonical dimension is 1, so vector-space finiteness would incorrectly give 0.
- For σ_v a Serre weight, Hom(M∞, σ_v^∨)^∨ modulo 𝔪∞ is Hom_K(σ_v, π)^∨, agreeing with §1.5. At r=2 each residual Hom space has dimension 2.
- M∞ = 0 iff π = 0; for a generic global datum π ≠ 0, so M∞ ≠ 0. A zero big module has zero fibre; a nonzero residual π has nonzero dual.
- Indefinite case, p inert: if a modular Serre weight σ occurs in π with multiplicity r, it occurs in the residual multiplicity module with multiplicity r and in the r̄-part of residual H¹ with multiplicity 2r, because the latter is r̄ ⊗ π. For r=2 these are 2 and 4. The single-copy comparison of C with the full completed-H¹ dual would equate 2 with 4; the comparison of C with the multiplicity dual gives 2=2, and of `C^{⊕2}` with the full dual gives 4=4. In the definite case there is no Galois factor and both multiplicities are r.

*Needs:* §1.4; §1.5; §0.5; §0.4; §0.3; DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5; DeformationAndDerivedPatchingAlgebra §7.2–7.3; CompletedCohomologyPartII §F.1, 3.1–3.2; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### Examples

For a generic global datum over ℚ with definite D ramified at {ℓ,∞}, S={p,ℓ} and q=1, the counts are 10 for R∞ and 8 for S∞, so the Krull dimensions are 11 and 9, difference 2. For f=2, |S|=1, q=2 the counts are 9 and 5, difference 4.

For λ=(1,0) the determinant weight is 1 and the type dimension is 4|S|+q; for λ=(2,0) the sum is 2 and the fixed-determinant quotient is zero. Twisting (2,−1) by ε gives (3,0), with determinant weight 3.

The compact residual fibre is π∨, not its O-linear dual: Hom_O(𝔽,O)=0 while Hom_O(𝔽,E/O)=𝔽. At f=1, dim(K₁/Z₁)=3; the residual π has canonical dimension 1 and is infinite dimensional as a vector space.

### Dependencies

Use DeformationAndDerivedPatchingAlgebra gap:power-series-cancellation; DeformationAndDerivedPatchingAlgebra §§1.10–1.12; LocalGaloisDeformationRings §1.1; LocalGaloisDeformationRings §1.10, 1.24; LocalGaloisDeformationRings §1.4; GlobalGaloisDeformations §3.5–3.7; GlobalGaloisDeformations §5.8; Mathlib `MvPowerSeries`; LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRings §3.1; LocalGaloisDeformationRings §3.9–3.10; DeformationAndDerivedPatchingAlgebra §3.1, 6.1; DeformationAndDerivedPatchingAlgebra §3.1; Mathlib `Module.support`; GlobalGaloisDeformations §5.1; GlobalGaloisDeformations §5.7; DeformationAndDerivedPatchingAlgebra §8.1–8.4; DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5; DeformationAndDerivedPatchingAlgebra §8.4; DeformationAndDerivedPatchingAlgebra §5.6; HilbertModularVarietiesAndShimuraCurves §R18.4.21; HilbertModularVarietiesAndShimuraCurves §R18.4.10; DeformationAndDerivedPatchingAlgebra §7.2–7.3; CompletedCohomologyPartII §F.1, 3.1–3.2. Each subsection above identifies the earlier local targets needed for its statement and route.

## Layer 2: Freeness over supports and noncommutative miracle flatness

### 2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras

For the native completed group algebras and the supplied grade and canonical dimension, define the noncommutative Cohen–Macaulay condition on a nonzero finite module M by concentration of Ext into the ring in a single degree. For a torsion-free pro-p compact analytic group K, put Λ = O⟦K⟧ and d = 1 + dim K. Prove pd_Λ(M) + depth_Λ(M) = d and pd_Λ(M) = max{i : Ext^i_Λ(M, Λ) ≠ 0} for nonzero finite M; deduce that the Cohen–Macaulay condition is equivalent to depth_Λ(M) = δ_Λ(M). The same assertions apply to K × ℤ_pⁿ when K is uniform. Prove that the grade of an extension is the minimum of the two endpoint grades, with zero endpoints interpreted by grade ∞.

Left and right modules are interchanged by g ↦ `g^{−1}`, so the definitions do not depend on the side.

For an arbitrary compact p-adic analytic K the ring Λ is only semilocal and need not be Auslander regular; grades are then computed on a normal open torsion-free pro-p subgroup (Lemma A.7 of Gee–Newton).

(GN22, Appendix A.1: Definition A.2, Proposition A.4, Definition A.5, Remark A.6, Lemmas A.7–A.8, pp. 42–44; GN22 line 1955).

Its API:

- M ≠ 0 and Ext^i_Λ(M, Λ) ≠ 0 for exactly one i.
- For K torsion-free pro-p: CM iff depth_Λ(M) = δ_Λ(M).
- A nonzero finite free Λ-module is Cohen–Macaulay with grade 0 and dimension gld(Λ).
- For a short exact sequence 0 → L → M → N → 0 of finite Λ-modules with K torsion-free pro-p, j(M) = min(j(L), j(N)) (GN22 Lemma A.8, p. 44; GN22 line 2031).

A proof route is as follows. Use the supplied noetherianity, Auslander regularity, grade, canonical dimension, finite-index comparison and coefficient shift on the same Ext objects. Establish the depth and projective-dimension statements of GN22 Proposition A.4(2)–(3), then compare the first and last nonzero Ext degrees to obtain the Cohen–Macaulay equivalence. The short-exact grade formula is GN22 Lemma A.8. For the trivial group this gives the commutative depth versus support-dimension condition; the noncommutative condition excludes zero, while the imported commutative CM predicate permits zero.

**Checks.**

- Λ itself is Cohen–Macaulay with j = 0 and δ = 1 + dim K. For K=ℤ_p the pair is j=0,δ=2.
- Λ/ϖΛ is Cohen–Macaulay with j = 1 and δ = dim K (the coefficient dimension shift). For K=ℤ_p the pair is j=1,δ=1.
- Λ ⊕ Λ/ϖΛ is not Cohen–Macaulay: Ext⁰ and Ext¹ into Λ are both nonzero. Both Ext⁰ and Ext¹ are nonzero, excluding the one-degree condition.
- For K = ℤ_p, Λ = O⟦T⟧ and M = Λ/(T) ≅ O: j = 1, δ = 1 and depth = 1, so M is Cohen–Macaulay. Replacing j by 0 would give δ=2 instead of 1.
- The zero module has grade ∞ and is not Cohen–Macaulay. The finite-number formula for δ is not evaluated on this case.
- For K trivial and A = O⟦x₁, …, x_r⟧ the predicate agrees with the commutative Cohen–Macaulay predicate of DeformationAndDerivedPatchingAlgebra §§3.1–3.4, 6.1 on nonzero finite modules (local duality). For r=1, M=O has depth=δ=1 and for M=O/ϖ they are 0=0.

*Needs:* CompletedCohomologyPartII §5.5; DeformationAndDerivedPatchingAlgebra §3.1, 6.1; Mathlib `CategoryTheory.Abelian.Ext`; PadicMeasuresIwasawaAlgebras §1.1–1.7, 5.2; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### 2.2 Freeness over the support from a submodule and a quotient

Let A be a commutative ring, N ⊆ M A-modules and r ≥ 1 such that (i) N and M/N are free of rank r over their scheme-theoretic supports A/Ann_A(N) and A/Ann_A(M/N); (ii) M is generated by r elements; (iii) Ann_A(M/N)/Ann_A(M) ≅ A/Ann_A(N) as A-modules. Then M is free of rank r over A/Ann_A(M).

No Noetherian or local hypothesis is needed; finiteness enters only through the generation by r elements.

(BHHMS23, Lemma 8.2.1 and proof, p. 90; BHHMS23 line 4566; STACKS, Tag 05G8; STACKS line 1544).

Support-rank specifies the complete quotient ring and the rank, so it distinguishes freeness from a statement only about generic fibres.

Its API:

- An isomorphism of A-modules transports the support and the rank.
- The zero module has zero quotient support and permits every rank; assertions recovering the rank require nonzero support.
- For a nonzero quotient A/I and positive r, its r-fold free module has annihilator I and support rank r.

A proof route is as follows. Replace A by A/Ann_A(M); put I = Ann_A(M/N) and choose a surjection f : A^r ↠ M. The composite A^r → M → M/N factors through (A/I)^r; as M/N ≅ (A/I)^r, the induced surjection (A/I)^r ↠ M/N is an isomorphism (Mathlib `OrzechProperty.bijective_of_surjective_endomorphism`, using `CommRing.orzechProperty`; STACKS, Tag 05G8). The snake lemma makes I^r → N surjective; since I ≅ A/Ann_A(N) and N ≅ (A/Ann_A(N))^r, the same fact makes I^r → N bijective, so f is an isomorphism.

**Checks.**

- For A=𝔽₂[ε]/ε², M=A and N=(ε), r=1, both endpoint supports are 𝔽₂, Ann(M/N)=(ε), Ann(M)=0 and (ε)≅𝔽₂= A/Ann(N); M is free rank 1. Replacing M by 𝔽₂² gives a split extension needing 2 generators, which fails the r=1 generation condition.

- At r=0 the zero module has support-rank 0 and the zero source generates it; the theorem retains r≥1. Over a field k, k² has support-rank 2 and does not have support-rank 1.
- For A=ℤ/4 and M=A, N=2A, the quotient annihilator is 2A≅ℤ/2, and one generator suffices; replacing the middle module by (ℤ/2)² makes the generator count 2 and its annihilator quotient zero.

*Needs:* Mathlib `Module.annihilator`; Mathlib `Module.Free`; Mathlib `Module.Finite`; Mathlib `OrzechProperty.bijective_of_surjective_endomorphism`; Mathlib `CommRing.orzechProperty`.

### 2.3 Freeness of fibre products over their supports

Let R be a commutative Noetherian local ring, M₁, M₂, M nonzero R-modules each free of rank r over its scheme-theoretic support, and M_i ↠ M surjections. Then Ann_R(M₁ ×_M M₂) = Ann_R(M₁) ∩ Ann_R(M₂), and the following are equivalent: (i) M₁ ×_M M₂ is free of rank r over its scheme-theoretic support; (ii) Ann_R(M) = Ann_R(M₁) + Ann_R(M₂); (iii) Ann_R(M) ⊆ Ann_R(M₁) + Ann_R(M₂).

R local is used through Nakayama to reduce to rank one; the annihilator identity holds for any ring because the maps M_i → M are surjective.

(BHHMS23, Lemma 8.3.8 and proof, p. 101; BHHMS23 line 5054).

For maps f : M₁ → M and g : M₂ → M, use the equal locus of their composites with the coordinate projections on M₁×M₂. The difference map has source M₁×M₂ and target M; its kernel is the fibre product.

Its API:

- The two coordinate projections land in M₁ and M₂ and have equal composites to M.
- Every compatible pair of module maps has a unique map to this submodule, with the specified projections.
- When both input maps are surjective, each coordinate projection is surjective, giving the intersection annihilator formula.

A proof route is as follows. Write M_i = (R/I_i)^r and M = (R/I)^r with I_i ⊆ I; after changing bases the surjections are the natural maps, so M₁ ×_M M₂ ≅ (R/I₁ `×_{R/I}` R/I₂)^r and by Nakayama one reduces to r = 1. For r = 1 the diagonal R → R/I₁ `×_{R/I}` R/I₂ has kernel I₁ ∩ I₂; it is surjective iff every pair (a, b) with a ≡ b mod I is congruent to some c modulo I₁ and I₂, iff I ⊆ I₁ + I₂ (Chinese remainder argument). Surjectivity is exactly cyclicity, i.e. freeness of rank one over R/(I₁ ∩ I₂). (ii) ⇔ (iii) because I₁ + I₂ ⊆ I always holds. BHHMS cite Hu–Wang Lemma 8.11 for the rank-one case.

**Checks.**

- For A=k[[x,y]]/(xy), M₁=A/(x), M₂=A/(y), M=k, the annihilator sum is (x,y)=Ann(M) and pullback≅A, with annihilator (x)∩(y)=0. For A=k[[t]], M₁=M₂=A, M=k, the pullback≅A² has rank 2, not 1, and 0+0≠(t).

- For the two identity maps M→M the pullback is the diagonal {(m,m)}≅M; using the full product would double the rank.
- For zero source and target modules the kernel is zero. For maps k→k equal to zero, the pullback is k², illustrating why surjectivity matters to the freeness criterion.

*Needs:* Mathlib `Module.annihilator`; Mathlib `LinearMap.eqLocus`; Mathlib `LinearMap.eqLocus_eq_ker_sub`; Mathlib `IsLocalRing`; Mathlib `IsNoetherianRing`; Mathlib `Submodule.spanFinrank`.

### 2.4 Grade and dimension under power-series variables (Gee–Newton)

Let K be uniform pro-p, Λ = O⟦K⟧, Ω = Λ/ϖΛ = k⟦K⟧, A = Λ ⊗̂_O O⟦x₁, …, x_r⟧ and B = Λ ⊗̂_O O⟦y₁, …, y_s⟧ with the map A → B induced by a local O-algebra map O⟦x⟧ → O⟦y⟧. For a finitely generated A-module M and x ∈ {ϖ, x₁, …, x_r}: (1) if xM = 0 then δ_A(M) = `δ_{A/x}(M)`; if M is x-torsion free then δ_A(M) = 1 + `δ_{A/x}(M/xM)`, equivalently j_A(M) = `j_{A/x}(M/xM)`; (2) in general j_A(M) ≥ `j_{A/x}(M/xM)`, hence j_A(M) ≥ j_Λ(M/(x₁, …, x_r)M) ≥ j_Ω(M/(ϖ, x₁, …, x_r)M); (3) for a finitely generated B-module M which is finitely generated over A, δ_A(M) = δ_B(M); (4) for a nonzero finitely generated Ω-module M and n → ∞ through n ≥ 2, δ_Ω(M) = limsup_n log_n dim_k(M/J_Ω^n M), J_Ω the Jacobson radical.

K uniform pro-p, so that A and B are Iwasawa algebras of the uniform groups K × ℤ_p^r and K × ℤ_p^s and hence Auslander regular.

Statement (4) is the Gelfand–Kirillov description of the canonical dimension (GN22 Proposition A.13); it links grades to the growth of invariants used in MP.4.

(GN22, §A.12 (Proposition A.13), §A.14 (Lemmas A.15–A.19), pp. 45–47; GN22 line 2092).

A proof route is as follows. (1) Base change spectral sequence for Ext along A → A/x, with Ext^j_A(A/x, A) = A/x concentrated in j = 1; for x-torsion free M, the grade inequality used in GN22 Lemma A.15 j_A(M/xM) ≥ 1 + j_A(M) and Nakayama on the lowest Ext (Gee–Newton Lemma A.15). (2) Filter M by x-power torsion; use the minimum formula for grades in short exact sequences and (1) on the graded pieces (Lemma A.16). (3) J_A B = BJ_A and J_AJ_B = J_BJ_A because the x_i become central (Lemma A.17); M/J_AM is finite length over B, so the J_A- and J_B-adic filtrations are cofinal and the Gelfand–Kirillov dimensions (4) agree for ϖ-torsion and ϖ-torsion-free modules, hence in general by dévissage (Lemmas A.18–A.19). (4) GN22 Proposition A.13 (J_Ω-adic growth; MP.4/gk-dimension records the equivalent growth of invariants under the p-power filtration).

**Checks.**

- For A=O[[T,x]] and M=A/(x), grades are 1 over A and 0 over A/(x), while canonical dimensions are both 2. For M=A, quotienting by x preserves grade 0 and lowers dimension 3→2. For Ω=k[[T]], length Ω/(Tⁿ)=n, hence log_n n=1 for n≥2.

- With O=ℤ₃[π]/(π²−3), the residue coefficient is O/(π)=𝔽₃; using p=3 instead gives O/(3)=𝔽₃[π]/π², which is nonreduced. The coefficient-reduction theorem uses ϖ=π. With O=ℤ₂ and K trivial, the integral/residual grades of 𝔽₂ are 1 and 0, so the shift survives at p=2.

*Needs:* §2.1; CompletedCohomologyPartII §5.5; ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### 2.5 Cohen–Macaulay transfer along A → B (Gee–Newton)

In the setting of §2.4, for every B-module M, depth_A(M) ≤ depth_B(M); and if M is a finitely generated B-module which is finitely generated and Cohen–Macaulay as an A-module, then M is a Cohen–Macaulay B-module with depth_B(M) = δ_B(M) = δ_A(M).

Equality holds when M is finitely generated over B and also over A (GN22 §A.20, p. 47; GN22 line 2171); for an arbitrary B-module only the displayed inequality is asserted.

(GN22, §A.20: Lemmas A.21–A.28 and Corollary A.29, pp. 47–49; GN22 line 2230).

A proof route is as follows. Injective B-modules are injective over Λ because B is flat over Λ (Lemma A.21); compute Ext_Λ(k, M) as a complex of S = k⟦y⟧-modules and compare depths over R = k⟦x⟧ and S through the forgetful functor (Lemmas A.22–A.25). For complexes of modules over commutative Noetherian local rings, depth along a local map can only drop under restriction of scalars (the derived depth comparison of GN22 Lemma A.27), giving depth_A(M) ≤ depth_B(M) (Lemma A.28). If M is CM over A: δ_A(M) = depth_A(M) ≤ depth_B(M) ≤ δ_B(M) (Auslander–Buchsbaum over the Iwasawa algebra B, §2.1) and δ_A(M) = δ_B(M) by §2.4 (3), so all are equal (Corollary A.29).

**Checks.**

- For K=1, A=O, B=O[[y]], M=O with y acting by 0, depth_A=depth_B=1 and δ_A=δ_B=1; M is finite CM over both. Taking M=B breaks finiteness over A, so the equal-dimension conclusion is not applied.
- For K=ℤ_p, r=0, s=1, A=O⟦T⟧, B=O⟦T,y⟧ and M=B, the A-regular sequence (ϖ,T) has length 2 and the B-regular sequence (ϖ,T,y) has length 3: depth_A(M)=2<3=depth_B(M). For M=B/(y)≅A, which is finite over A, both depths are 2. This distinguishes the inequality from a universal equality.

*Needs:* §2.1; §2.4; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### 2.6 Miracle flatness over Iwasawa algebras (Gee–Newton)

Let K be uniform pro-p, A = O⟦K⟧ ⊗̂_O O⟦x₁, …, x_r⟧, Ω = k⟦K⟧, and M a finitely generated Cohen–Macaulay A-module. Then M is flat over O⟦x₁, …, x_r⟧ if and only if j_A(M) = j_Ω(M/(ϖ, x₁, …, x_r)M).

M is Cohen–Macaulay over A in the sense of §2.1; in particular M ≠ 0.

(GN22, Proposition A.30 and proof, pp. 49–50 (BHHMS cite it as Corollary A.30); GN22 line 2242; GN22 lines 2285–2289).

A proof route is as follows. If M is flat, (ϖ, x₁, …, x_r) is an M-regular sequence (M/(ϖ, x)M ≠ 0 by Nakayama), and §2.4 (1) gives the equality of grades. Conversely, for x ∈ {ϖ, x_i} show by induction: j_A(M) = `j_{A/x}(M/xM)` (from the chain of inequalities in (2) and the hypothesis); x is M-regular (a nonzero x-power torsion submodule would have the full dimension by purity of Cohen–Macaulay modules, the purity input in GN22 Proposition A.30, p. 50, lines 2266–2272, contradicting the grade equality); and M/xM is Cohen–Macaulay over A/x (long exact Ext sequence). The regular sequence gives flatness modulo every power of the maximal ideal 𝔞 = (ϖ, x₁, …, x_r) of B = O⟦x₁, …, x_r⟧. For every ideal I of B, I ⊗_B M is finitely generated over the Noetherian algebra A; since 𝔞A lies in its Jacobson radical it is 𝔞-adically separated. Apply the adic flatness criterion to these tensor modules, not just to M (GN22 proof of Proposition A.30, p. 50; GN22 lines 2285–2289). This proves B-flatness although M need not be finite over B.

**Checks.**

- For K=ℤ_p and A=O[[T,x]], M=A/(T), the two grades are 1 and 1 and M≅O[[x]] is coefficient-flat. For M=A/(ϖ), the grades are 1 and 0 and coefficient-flatness fails since ϖ kills 1≠0.

*Needs:* §2.1; §2.4; Mathlib `Module.Flat`; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### Examples

For A=𝔽₂[ε]/ε², M=A and N=(ε), r=1, both endpoint supports are 𝔽₂, Ann(M/N)=(ε), Ann(M)=0 and (ε)≅𝔽₂= A/Ann(N); M is free rank 1. Replacing M by 𝔽₂² gives a split extension needing 2 generators, which fails the r=1 generation condition.

For A=k[[x,y]]/(xy), M₁=A/(x), M₂=A/(y), M=k, the annihilator sum is (x,y)=Ann(M) and pullback≅A, with annihilator (x)∩(y)=0. For A=k[[t]], M₁=M₂=A, M=k, the pullback≅A² has rank 2, not 1, and 0+0≠(t).

For K=ℤ_p and A=O[[T,x]], M=A/(T), the two grades are 1 and 1 and M≅O[[x]] is coefficient-flat. For M=A/(ϖ), the grades are 1 and 0 and coefficient-flatness fails since ϖ kills 1≠0.

### Dependencies

Use CompletedCohomologyPartII §5.5; DeformationAndDerivedPatchingAlgebra §3.1, 6.1; Mathlib `CategoryTheory.Abelian.Ext`; PadicMeasuresIwasawaAlgebras §1.1–1.7, 5.2; Mathlib `Module.annihilator`; Mathlib `Module.Free`; Mathlib `Module.Finite`; Mathlib `LinearMap.ker`; Mathlib `IsLocalRing`; Mathlib `IsNoetherianRing`; Mathlib `Submodule.spanFinrank`; ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension; Mathlib `Module.Flat`. Each subsection above identifies the earlier local targets needed for its statement and route.

## Layer 3: Freeness for weights, types and projective lifts

### 3.1 Patched modules of finite length representations are maximal Cohen–Macaulay

For every smooth representation σ of K = `GL₂(O_{F_v})` on a finite length W(𝔽)-module with central character `ψ^{−1}`|`I_{F_v}`, the R∞-module M∞(σ) is maximal Cohen–Macaulay over its scheme-theoretic support R∞/`Ann_{R∞}(M∞(σ))`; in particular this support has no embedded associated prime.

M∞ = `M∞^{σ_p^v}` is the patching functor of §1.4; finite length means killed by a power of p and of finite length as a W(𝔽)-module.

(BHHMS23, Lemma 8.2.2 and proof, p. 91; BHHMS23 line 4591).

A proof route is as follows. If M∞(σ) = 0 there is nothing to prove. For each Serre weight σ_v with M∞(σ_v) ≠ 0, the patching-functor property (3) makes M∞(σ_v) Cohen–Macaulay of Krull dimension d independent of σ_v (all weight loci have dimension dim S∞ − 1). By exactness, dim M∞(σ) is the maximum of dim M∞(σ_v) over the constituents σ_v of σ, so it equals d, and every nonzero M∞(σ_v) is maximal Cohen–Macaulay over R∞/`Ann_{R∞}(M∞(σ))`. Being maximal Cohen–Macaulay over a fixed Noetherian local ring with residue field 𝔽 is stable under extensions (characterise depth by vanishing of Ext^i(𝔽, −) in low degrees), so M∞(σ) is maximal Cohen–Macaulay.

**Checks.**

- Over k[[x,y]], k[[x,y]]/(x) has depth and support dimension both 1, although the ambient ring dimension is 2. For zero coefficients the value is zero and the assertion uses the separate zero convention.

*Needs:* §1.4; §1.3; DeformationAndDerivedPatchingAlgebra §3.1, 6.1.

### 3.2 Freeness for Serre weights and for lattices in tame types

There is an integer r ≥ 1 such that: (i) for every σ_v ∈ W(r̄_v^∨), M∞(σ_v) is free of rank r over its scheme-theoretic support, which is formally smooth over 𝔽; (ii) for every tame inertial type τ with JH(σ(τ)) ∩ W(r̄_v^∨) ≠ ∅ and every K-stable W(𝔽)-lattice σ°(τ) in σ(τ) with irreducible cosocle, M∞(σ°(τ)) is free of rank r over its scheme-theoretic support, which is the domain `R∞^{(1,0),τ}`.

Generic global datum; M∞ = `M∞^{σ_p^v}`. MP.5/finite-weight-hulls covers the principal-series intervals; the cuspidal types (second inertial shape at v) and EGS15 §§5.1, 10.1 are part of the tame-type gap.

The tame potentially Barsotti–Tate ring structure (EGS15 Theorem 7.2.1) and the constituents of tame-type lattices (EGS15 §5.1) come from the supplier contracts with LocalGaloisDeformationRingsPartII. Weight-isolating, containing and two-weight types relative to W(r̄_v^∨) come from §0.2.

In the Boolean subset labels of EGS15 §10.1, an interval is an order-convex set of labels and a capped interval has a unique maximal label, its cap. For a subset 𝒥 of the weight components of a fixed type, let I_𝒥 be the inverse image in R∞ of the intersection of their prime ideals in the reduced special-fibre type ring. Thus it cuts out their reduced union; the empty intersection is the unit ideal. Prove Ann(M∞(σ^𝒥))=I_𝒥 for the capped-interval subquotients σ^𝒥 of an irreducible-cosocle type lattice supplied by gap:tame-types (BHHMS23 (70), p. 92; BHHMS23 line 4628; EGS15 §10.1, p. 60; EGS15 line 3212).

Its API:

- A singleton gives the corresponding component ideal.
- A union of weight subsets gives the intersection of their ideals; the empty subset gives the unit ideal.
- Because the special fibre of `R∞^{(1,0),τ}` is a power-series ring over the local special fibre (§1.2), the two identities of gap:single-type-rings hold for the I_𝒥 in R∞: power-series base change is flat and preserves these finite intersections and quotient isomorphisms. The ideal of a capped interval is the actual annihilator of its patched module, not only its radical.

(BHHMS23, Proposition 8.2.3 and proof, pp. 91–92; BHHMS23 line 4607; EGS15, Theorem 10.1.1, §10.1, Definition 10.1.4, Proposition 10.1.11, Lemma 6.1.4, Propositions 3.5.1–3.5.2; EGS15 line 3324; LE19, Lemma 4.5; LE19 line 779).

A proof route is as follows. By EGS15 §5.1 the lattice is σ_J°(τ) for a unique subset J in a set P_τ; its constituents in W(r̄_v^∨) are indexed by a subset W ⊆ P_τ, and for capped intervals 𝒥 ⊆ W there are subquotients σ^𝒥 with exactly those constituents (EGS15 Definition 10.1.4). Supports: R∞/Ann(M∞(σ^𝒥)) is reduced, being generically reduced by dévissage (the supports of the M∞(σ_v) are reduced, irreducible, pairwise distinct and of equal dimension, and σ^𝒥 is multiplicity free) and without embedded primes by §3.1; hence its annihilator equals I_𝒥 and its support ring is R∞/I_𝒥, in the notation of EGS15 §10.1. |𝒥| ≤ 2: there is a tame type τ′ and a lattice whose reduction has the same patched module as σ^𝒥, and `R∞^{(1,0),τ′}` is regular, so the integral patched module is free over the regular type ring, and its reduction is free over the type ring modulo p (EGS15 Lemma 6.1.4); for |𝒥| = 2 freeness over a power series ring over 𝔽⟦X₁, X₂⟧/(X₁X₂) forces equal ranks of the two weights, and connectedness of the weight constituents of the containing type of §0.2, using its Diamond-box extension graph (EGS15 §5.1), gives one rank r for all weights. |𝒥| > 2 with a unique minimal element 𝒥₀: M∞(σ^𝒥) is generated by r elements (as in EGS15 Theorem 10.1.1, using Le's Lemma 4.5 in place of EGS15 Lemma 10.1.13), and §2.2 with N = `M∞(σ^{{𝒥₀}})` gives freeness: a capped interval with a unique minimum is F(𝒥₀,J_cap), so EGS15 Lemma 10.1.6 supplies its annihilator quotient. With several minimal elements, write M∞(σ^𝒥) as a fibre product over smaller capped intervals with the same cap and use §2.3; EGS15 Lemma 10.1.8 supplies the sum-ideal condition. (ii): for 𝒥 = W this gives M∞(σ_J°(τ))/p free of rank r over `R̄∞^{(1,0),τ}`; lift a basis by Nakayama to a surjection (`R∞^{(1,0),τ}`)^r ↠ M∞(σ°(τ)) which is an isomorphism mod p; its kernel satisfies p·ker = ker because M∞(σ°(τ)) is p-torsion free, so the kernel vanishes.

**Checks.**

- For O[[x,y]]/(xy−p), reduction gives k[[x,y]]/(xy); its two branch modules each have generic rank 1. Taking two copies gives branch ranks 2 and 2, so the common r can be 2 and is not forced to 1.
- In A=k⟦x,y⟧/(xy), selecting only V(x) gives I=(x) and support A/(x)≅k⟦y⟧. The zero ideal would incorrectly retain the other branch.
- Selecting both branches gives (x)∩(y)=0 and support A. Their sum (x,y) instead cuts out the closed point, so it cannot define the union.
- Selecting no branch gives I=A and quotient 0; choosing I=0 would give the entire nonzero support. This tests the empty-union convention without asserting a nonempty capped interval for it.
- In R̄=k⟦x,y⟧/(xy), for F(∅,{1}) containing both components, I_F=0 and `I_{F^×}=(x)`; multiplication by x identifies R̄/(y) with (x). For F(J,J) the punctured interval is empty and the quotient is `R̄/I_{{J}}`, generated by 1. Replacing the singleton ideal by (x) in the first case would give the wrong annihilator, since Ann(x)=(y).
- In R̄=k⟦x₁,y₁,x₂,y₂⟧/(x₁y₁,x₂y₂), the two capped intervals { {1,2},{1} } and { {1,2},{2} } have ideals (x₁) and (x₂); their sum is (x₁,x₂), the ideal of their common singleton { {1,2} }. Replacing the second interval by { {1,2},∅ } gives sum (x₁,x₂y₁), strictly smaller than (x₁,x₂): setting x₁=y₁=y₂=0 leaves x₂ nonzero. Thus the interval hypothesis cannot be discarded (EGS15 Example 10.1.3(3), p. 60; EGS15 line 3236).
- Adjoining a power-series variable t keeps Ann(x)=(y) and (x₁)+(x₂)=(x₁,x₂); pulling these ideals back to R∞ adds the same type-and-p kernel to each. A quotient by (x,y) instead would kill x and turn the cyclic quotient into 0, so this step requires flat base change, not an arbitrary quotient.

*Needs:* §1.4; §1.3; §1.2; §0.2; §3.1; §2.2; §2.3; DeformationAndDerivedPatchingAlgebra §3.1; ModpRepresentationsOfGL2OverLocalFields MP.5/finite-weight-hulls; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 3.3 Lattices in sums of locally algebraic types

Let σ = `⊕_{i=1}^m` `σ_i^{n_i}` with m, n_i ≥ 1, where the σ_i = `σ_i^{sm}` ⊗_E `σ_i^{alg}` are pairwise nonisomorphic absolutely irreducible locally algebraic representations of K over E, each `σ_i^{sm}` ⊗ Q̄_p in the image of the inertial local Langlands correspondence τ ↦ σ(τ), each σ_i having central character ψ⁻¹ on O_Fv× under the geometric Artin identification, and with ∪_i JH(σ_i) ∩ W(r̄_v^∨) ≠ ∅; let σ° be any K-stable W(𝔽)-lattice in σ. Then (i) M∞(σ°) is maximal Cohen–Macaulay over its scheme-theoretic support S = R∞/`Ann_{R∞}(M∞(σ°))`, which is reduced; (ii) M∞(σ°) `⊗_{W(𝔽)}` E is locally free over S[1/p], which is regular; at each closed point with finite residue field E_x/E, its completed local deformation ring is formally smooth over E_x. Every irreducible tame smooth `σ_i^{sm}` that is not a twist of the Steinberg representation of GL₂(k) satisfies the image hypothesis.

Thus σ° belongs to the fixed-character coefficient category of §1.4, as do its constituent lattices σ_i°. The uses in this roadmap have tame smooth parts of that character and algebraic parts V(α_j) or trivial; a scalar z acts on V(α_j) by σ_j(z)²σ_j(z)⁻²=1, so those algebraic factors preserve the exact character. The image hypothesis is supplied by the tame-type gap (BHHMS23 Remark 8.2.5, p. 93; BHHMS23 line 4706).

(BHHMS23, Corollary 8.2.4 and proof, (71)–(72), pp. 92–93; Remark 8.2.5, p. 93; BHHMS23 line 4662; CEGGPS16, Lemmas 4.17–4.18 (arXiv v5 numbering); CEGGPS16 line 2533).

A proof route is as follows. By exactness, M∞(σ°)[1/p] ≅ ⊕_i `M∞(σ_i°)[1/p]^{n_i}` for lattices σ_i° (BHHMS23 (71)). By Taylor–Wiles–Kisin, R∞ acts on M∞(σ_i°) through a reduced equidimensional p-torsion-free quotient R∞/I_i whose support is a union of irreducible components (CEGGPS Lemmas 4.17–4.18, use the quaternionic Taylor–Wiles module and local-global compatibility to prove this component assertion, as in BHHMS23 Corollary 8.2.4; the underlying support notion is DeformationAndDerivedPatchingAlgebra §6.1–6.2). The Spec (R∞/I_i)[1/p] are disjoint because the σ_i are pairwise distinct, so S[1/p] ≅ ∏_i (R∞/I_i)[1/p] by the Chinese remainder theorem (BHHMS23 (72)). Each (R∞/I_i)[1/p] is a union of components of a potentially crystalline generic fibre, which is regular, with formally smooth completed local deformation rings at finite-residue-field closed points (Kisin; LocalGaloisDeformationRings §3.10); S has no p-torsion, so S is reduced. M∞(σ°)/p ≅ M∞(σ°/p) is Cohen–Macaulay by §3.1 and p is a nonzerodivisor, so M∞(σ°) is maximal Cohen–Macaulay over S; M∞(σ°)[1/p] is Cohen–Macaulay over the regular ring S[1/p], hence locally free by Auslander–Buchsbaum.

**Checks.**

- For two disjoint characteristic-zero types with multiplicities 1 and 2 and common base rank r, the two factor ranks are r and 2r. At r=2 they are 2 and 4; local freeness does not mean one global constant rank on a disconnected support.
- At f=1 and p=29, twist a permitted tame type by the algebraic character det²⁸. Its reduction on GL₂(𝔽₂₉) is unchanged and its smooth factor is unchanged, but the scalar 30 acquires the multiplier 30⁵⁶ ≡ 784 mod 841, whereas ψ⁻¹(30)=1. This lattice has the same residual weight support but is outside §1.4’s coefficient category.
- On the trivial algebraic factor and on V(α_j), a scalar z contributes respectively 1 and σ_j(z)²σ_j(z)⁻²=1. At f=1 and z=30 both contributions equal 1, in contrast with 784 mod 841 for det²⁸; the projective and adjoint lattices in §§3.4–4.5 therefore retain the prescribed integral character.
- At an E-rational regular point of dimension one, the completed local model E⟦t⟧ has dimension 1 and cotangent-space dimension 1. The square-zero thickening E[t]/(t²) has dimension 0 and cotangent-space dimension 1, so it is not a regular generic-fibre model. The completed local deformation ring uses its maximal-ideal topology.

*Needs:* §3.1; §3.2; §1.2; §1.4 for the exact central-character domain (BHHMS23 line 4421); DeformationAndDerivedPatchingAlgebra §6.1–6.2; DeformationAndDerivedPatchingAlgebra §3.1; LocalGaloisDeformationRings §3.9–3.10; LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 3.4 Freeness for the projective lift of a modular Serre weight

Let σ_v ∈ W(r̄_v^∨), `P_{σ_v}` = `Proj_{GL₂(k)}σ_v` and `P̃_{σ_v}` its finite free projective lift to W(𝔽)[GL₂(k)], inflated to K. Then `π^{K₁}` ≅ `D₀(r̄_v^∨)^{⊕r}` as GL₂(k)-representations, dim_𝔽 `Hom_K(P_{σ_v}, π)` = r, and `M∞(P̃_{σ_v})` is free of rank r over R∞/∩_τ p_τ, where τ runs over the tame inertial types with σ_v ∈ JH(σ(τ)) and p_τ = ker(R∞ ↠ `R∞^{(1,0),τ}`).

r is the rank of §3.2; D₀(r̄_v^∨) is the Breuil–Paškūnas representation of ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle.

The upper embedding W = `π^{K₁}` ↪ `D₀(r̄_v^∨)^{⊕r}` follows from BHHMS23 Proposition 8.2.6 and LMS22 Proposition 4.6. Being an isomorphism on socles alone does not prove it is an isomorphism. The reverse embedding is the independent global extension argument below.

`P̃_{σ_v}[1/p]` ≅ ⊕_τ σ(τ), each tame type with σ_v ∈ JH(σ(τ)) occurring once (tame-type gap).

(BHHMS23, Proposition 8.2.6 and proof, pp. 93–94; BHHMS23 line 4716; BHHMS23, proof of Proposition 8.3.7, p. 101; BHHMS23 line 5044; LMS22, Lemma 4.5, p. 14, and Proposition 4.6, p. 15; LMS22 line 631; BRE14, Lemma 9.2 and its proof, pp. 54–55 of the author copy; BRE14 line 2754).

A proof route is as follows. Generation by r elements: by Nakayama and §1.5 it suffices that dim `Hom_K(P_{σ_v}, π)` = dim `Hom_{GL₂(k)}(P_{σ_v}, W)` = r for W = `π^{K₁}`. By §3.2 (i), dim Hom(σ, W) = r for each modular weight; since `Hom(P_{σ_v}, D₀/soc D₀)` = 0 it suffices to embed W into `D₀(r̄_v^∨)^{⊕r}`, equivalently to find a surjection `(D₀^∨)^{⊕r}` ↠ W^∨, which follows as in Le–Morra–Schraen Lemma 4.5 and Proposition 4.6 with 1 replaced by r. For the reverse embedding, embed R′ = `soc(D₀^{⊕r})` into the weighted π using the weight theorem and its multiplicity r. Put R = `D₀^{⊕r}`; by the defining property of D₀, R/R′ has no modular Serre weight, so Hom_K(R/R′, π) = 0. Apply the argument of Breuil Lemma 9.2 to the finite-level spaces: localisation makes Hom(−, S)_𝔪 exact by §0.4; the zero quotient Hom space remains zero after localisation by Nakayama. Restriction Hom(R, S)_𝔪 → Hom(R′, S)_𝔪 is therefore an isomorphism. Taking the residual Hecke eigenspace, the Galois multiplicity space, and the fixed weights away from v preserves this isomorphism. The socle embedding extends uniquely to R → π and is injective since every nonzero submodule of R meets its socle. Thus `D₀^{⊕r}` ↪ W. Both modules are finite-dimensional, so together with the upper embedding this gives W ≅ `D₀^{⊕r}`, without Layers 4–5. Support: `P̃_{σ_v}[1/p]` is the direct sum of the σ(τ), each once, so by BHHMS23 (71)–(72) and §3.2 (ii) `M∞(P̃_{σ_v})`[1/p] is free of rank r over S[1/p], S the scheme-theoretic support. A surjection S^r ↠ `M∞(P̃_{σ_v})` is an isomorphism after inverting p and `M∞(P̃_{σ_v})` has no p-torsion, so it is injective; S = R∞/∩_τ p_τ because the `R∞^{(1,0),τ}` are domains, so the support of each M∞(σ(τ)°)[1/p] is exactly R∞/p_τ.

**Checks.**

- At common r=2, each modular weight has Hom dimension 2 and Hom(P_σ,D₀²)=2 because the quotient by the socle contributes 0. The upper and lower embeddings have dimensions 2 dim D₀ on both sides; an isomorphism on socles alone would also allow a proper essential extension.

*Needs:* §3.2; §3.3; §1.5; §0.5; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle; ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice; §0.4; §0.6; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### Examples

For O[[x,y]]/(xy−p), reduction gives k[[x,y]]/(xy); its two branch modules each have generic rank 1. Taking two copies gives branch ranks 2 and 2, so the common r can be 2 and is not forced to 1.

At common r=2, each modular weight has Hom dimension 2 and Hom(P_σ,D₀²)=2 because the quotient by the socle contributes 0. The upper and lower embeddings have dimensions 2 dim D₀ on both sides; an isomorphism on socles alone would also allow a proper essential extension.

### Dependencies

Use DeformationAndDerivedPatchingAlgebra §3.1, 6.1; DeformationAndDerivedPatchingAlgebra §3.1; ModpRepresentationsOfGL2OverLocalFields MP.5/finite-weight-hulls; DeformationAndDerivedPatchingAlgebra §6.1–6.2; LocalGaloisDeformationRings §3.9–3.10; LocalGaloisDeformationRings §3.4; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle; ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice. Each subsection above identifies the earlier local targets needed for its statement and route.

## Layer 4: Glued lattices and first-order projective envelopes

### 4.1 The glued lattices L_j and the comparison lattices N_j

Fix σ_v ∈ W(r̄_v^∨); write P = `P_{σ_v}` and P̃ = `P̃_{σ_v}` for its projective envelope over GL₂(k) and the projective W(𝔽)[GL₂(k)]-lift, inflated to K = `GL₂(O_{F_v})`. The following lattices are those of ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice specialized to σ_v, not constructed again here. For j ∈ {0, …, f − 1} let V(α_j) = `(Sym²(W(𝔽)²) ⊗ det^{−1})^{(j)}`, the algebraic representation of K through the embedding σ_j, `R_{2,j}` = V(α_j) `⊗_{W(𝔽)}` P̃ (the j-th summand of MP.8's R₂) and, with the fixed embedding ι_j : P ↪ `R_{2,j}`/`pR_{2,j}` of MP.8/projective-lattice, `R′_{2,j}` = {x ∈ `R_{2,j}` : x mod p ∈ ι_j(P)}: a K-stable lattice with `pR_{2,j}` ⊆ `R′_{2,j}` ⊆ `R_{2,j}`, `R′_{2,j}`/`pR_{2,j}` ≅ P, `(R′_{2,j}/pR′_{2,j})_{K₁}` ≅ P and a K-equivariant exact sequence 0 → `P_{σ_{1,j}}` ⊕ `P_{σ_{2,j}}` → `R′_{2,j}`/`pR′_{2,j}` → P → 0, where `σ_{1,j}`, `σ_{2,j}` are the weights F(λ ∓ α_j) for σ_v = F(λ). MP.8/projective-lattice supplies the partial fibre products `L_{−1}` = P̃ and L_j = `L_{j−1}` ×_P `R′_{2,j}` (the fibre product over the reductions modulo p), K-stable lattices in P̃[1/p] ⊕ `⊕_{j′≤j}` `R_{2,j′}[1/p]`, with `L_{f−1}` ≅ R. This section constructs the type-dependent lattices and their comparisons with L_j. For a tame type τ with σ_v ∈ JH(σ(τ)), let σ(τ)° be the image of P̃ in σ(τ) (the lattice with cosocle σ_v), `T_{2,j}` = V(α_j) ⊗ σ(τ)°, `T′_{2,j}` the image of `R′_{2,j}` → `R_{2,j}` ↠ `T_{2,j}`, Y_j = `T′_{2,j}`/`pT_{2,j}` (a quotient of P, hence of `L_{j−1}`) and N_j = `L_{j−1}` `×_{Y_j}` `T′_{2,j}`. With τ = τ₀, the unique tame type with JH(σ(τ₀)) = W(r̄_v^∨) (r̄_v semisimple), the surjection `R′_{2,j}` ↠ `T′_{2,j}` induces a surjection L_j ↠ N_j and an exact sequence 0 → `T_{2,j}` →(×p) N_j → `L_{j−1}` → 0.

σ_v = F(λ) with λ 8-deep in the lowest alcove, which genericity of r̄_v guarantees (BHHMS23 Proposition 2.4.2 in MP.3).

The type τ₀ is the semisimple all-weight type of §0.2 (EGS15 Proposition 3.5.2 for existence; BHHMS23 line 5066 for equality and uniqueness).

(BHHMS23, §8.3: definition of `R′_{2,j}` and (75), p. 95; (76) and the definitions of `T_{2,j}`, `T′_{2,j}`, Y_j, N_j, pp. 98–99; choice of τ₀ before Theorem 8.3.9, p. 101; BHHMS23 line 4797; BHHMS23, §1.3.3, (7), pp. 8–9; BHHMS23 line 354).

Its API:

- `R_{2,j}` = V(α_j) ⊗ P̃ with its K-action through σ_j on V(α_j).
- `R′_{2,j}`, the preimage of ι_j(P) in `R_{2,j}`.
- 0 → `P_{σ_{1,j}}` ⊕ `P_{σ_{2,j}}` → `R′_{2,j}`/`pR′_{2,j}` → P → 0 and `(R′_{2,j}/pR′_{2,j})_{K₁}` ≅ P.
- L_j for −1 ≤ j ≤ f − 1, with L_j = `L_{j−1}` ×_P `R′_{2,j}`, as supplied by MP.8/projective-lattice.
- `L_{f−1}` = R of MP.8/projective-lattice (supplied), hence `L_{f−1}`/p ≅ (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}`.
- The projections `L_{j′}` ↠ L_j (j ≤ j′) are surjective, so every L_j/pL_j is a quotient of (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` with quotient P.
- `T_{2,j}`, `T′_{2,j}`, Y_j and N_j = `L_{j−1}` `×_{Y_j}` `T′_{2,j}` for a tame type τ ∋ σ_v; N_j(τ₀) for the type of the modular weights.
- 0 → `T_{2,j}` →(×p) N_j → `L_{j−1}` → 0, and L_j ↠ N_j.

A proof route is as follows. `R′_{2,j}`: the natural map R′₂ → `R′_{2,j}` from the lattice R′₂ of MP.8 is surjective; MP.8/lattice-coinvariants gives `(R′₂/pR′₂)_{K₁}` ≅ P and hence the same for `R′_{2,j}`; the exact sequence comes from the decomposition `R_{2,j}`/p ≅ P ⊕ `P_{σ_{1,j}}` ⊕ `P_{σ_{2,j}}` (MP.5/projective-adjoint, BHHMS23 (56) and (75)). L_j and its recursion are imported from MP.8/projective-lattice (its partial-fibre-product compatibility; BHHMS23 (76)). `T′_{2,j}`, Y_j, N_j: as in the proof of BHHMS23 Proposition 8.3.3 and before Lemma 8.3.5; the kernel of `T′_{2,j}` ↠ Y_j is `pT_{2,j}`, which gives the exact sequence for N_j (proof of BHHMS23 Lemma 8.3.6).

**Checks.**

- `L_{−1}` = P̃, the projective lift itself. At j=−1 there are no adjoint pieces and rank is dim P.
- `rank_{W(𝔽)}` L_j = (1 + 3(j + 1))·dim_𝔽 P, since dim V(α_j) = 3; for j = f − 1 this matches dim_𝔽 R/pR = (3f + 1) dim_𝔽 P (MP.8/projective-truncation). At f=2 the rank is 7 dim P.
- The decomposition `R_{2,j}`/`pR_{2,j}` ≅ P ⊕ `P_{σ_{1,j}}` ⊕ `P_{σ_{2,j}}` gives a K-equivariant surjection `R_{2,j}` ↠ P by reduction and projection. Hence P̃ ×_P `R_{2,j}` exists and surjects onto `R_{2,j}`. Its cosocle therefore has the quotient σ_v ⊕ `σ_{1,j}` ⊕ `σ_{2,j}`, retaining the two unwanted simple quotients. The preimage lattice `R′_{2,j}` is needed for the intended single-cosocle property, rather than for existence of a map to P.
- For f = 1 and r̄_v semisimple generic, W(r̄_v^∨) has two weights and τ₀ is the tame type whose σ(τ₀) has exactly these two constituents. There are 2¹=2 modular weights and one all-weight type.
- For f = 1 there is a single adjoint piece and L₀ = R. The rank at this endpoint is 4 dim P.
- Put d=dim P. The quotient R′/pR has dimension d whereas R′/pR′ has dimension 3d; confusing the two loses 2d.
- Underlying O-lattice model of the image and of Y_j: let R = O⁴ project onto T = O³ (first three coordinates) and R′ = Oe₁ + pOe₂ + pOe₃ + pOe₄, so that R′/pR is one-dimensional. The image of R′ is T′ = Oe₁ + pOe₂ + pOe₃, and with L = O mapping onto it, Y = T′/pT has dimension 1, whereas T′/pT′ has dimension 3. Reducing modulo pT′ instead of pT, as a misreading of the definition of Y_j would do, gives a three-dimensional quotient that is not a quotient of R′/pR.
- In the same model N = L ×_Y T′ consists of the pairs (a, (b, pc, pd)) with a ≡ b mod p; it has basis (1, e₁), (0, pe₁), (0, pe₂), (0, pe₃), so rank N = rank L + rank T = 4, and ker(N → L) = pT ≅ T via multiplication by p, reproducing 0 → `T_{2,j}` →(×p) N_j → `L_{j−1}` → 0. The pair (0, e₁) lies in the direct sum L ⊕ T′ but not in N, so the direct sum is not the comparison lattice even though it has the same rank.
- In the same model `L ×_{R′/pR} R′` consists of the pairs (a, (b, pc, pd, pe)) with a ≡ b mod p and has rank 5; the map induced by R′ ↠ T′ sends it onto N with kernel generated by (0, pe₄), so the ranks are 5 and 4, matching rank L_j − rank N_j = rank `R_{2,j}` − rank `T_{2,j}`. Using all of T instead of the image T′ would make the gluing quotient T/pT three-dimensional and the induced map would not land in a fibre product over a quotient of R′/pR.

*Needs:* ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice; ModpRepresentationsOfGL2OverLocalFields MP.8/lattice-coinvariants; ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; §0.2; Mathlib `LinearMap.ker`; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 4.2 K₁-invariance and Loewy length of small quotients

Let Q be a quotient of (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}(Proj_{K/Z₁}σ_v)` such that (a) the constituents of soc_K(Q) occur among those of `Proj_{K/K₁}σ_v` = P (up to multiplicity) and (b) [Q/soc_K(Q) : σ_v] = 1. Then rad_K(Q) and Q/S are fixed by K₁, where S is the largest σ_v-isotypic submodule of soc_K(Q). If moreover (c) the constituents of soc_K(Q) lie in W(r̄_v^∨) and (d) rad_K(Q)/soc_K(Q) has no constituent in W(r̄_v^∨), then Q has Loewy length at most 3.

σ_v ∈ W(r̄_v^∨) is 2-deep, so the first-order hull statements of MP.5 apply.

(BHHMS23, Lemma 8.3.1 and proof, pp. 94–95; BHHMS23 line 4753).

A proof route is as follows. Embed Q into ⊕_i `Q_{σ_i}`, one quotient with simple socle σ_i for each summand of soc_K(Q); taking radicals preserves surjections (BHHMS23 Lemma 8.3.1, p. 95), so rad_K(Q) ⊆ ⊕ `rad_K(Q_{σ_i})` and rad_K(Q)/soc_K(Q) ↠ `rad_K(Q_{σ_i})`/`soc_K(Q_{σ_i})`; reduce to simple socle. If soc_K(Q) ≇ σ_v then [Q : σ_v] = 1 and Q is the finite interval I(soc_K(Q), σ_v), fixed by K₁ by (a) (MP.5/first-order-weight-hulls, the uniqueness and K₁-triviality statement). If soc_K(Q) ≅ σ_v then Q/σ_v is multiplicity free with one copy of σ_v, rad_K(Q)/σ_v is semisimple and embeds in the sum of weights with nonzero `Ext¹_{K/K₁}` to σ_v, so rad_K(Q) ⊆ `Q^{K₁}` and Q has Loewy length 3 (MP.5/first-order-weight-hulls). Q/S is K₁-fixed: any weight in its socle is in soc_K(Q) or has nonzero `Ext¹_{K/Z₁}` to σ_v, hence lies in JH(P), and [Q/S : σ_v] = 1. Under (c)–(d) and soc_K(Q) ≇ σ_v: all constituents of I(soc_K(Q), σ_v) lie in W(r̄_v^∨) (MP.5/finite-weight-hulls with MP.3/tame-weight-set), so rad/soc = 0 and the Loewy length is 2.

**Checks.**

- A permitted simple-socle quotient has Loewy length 3 when its socle is σ, and length 2 in the other-socle case with no modular middle constituent. Q=σ alone has [Q/soc Q:σ]=0 and fails hypothesis (b), despite sharing the required socle.

*Needs:* ModpRepresentationsOfGL2OverLocalFields MP.5/first-order-weight-hulls; ModpRepresentationsOfGL2OverLocalFields MP.5/finite-weight-hulls; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; §0.2.

### 4.3 `M∞(R′_{2,j})` is minimally generated by r elements

For every j ∈ {0, …, f − 1}, the R∞-module `M∞(R′_{2,j})` is minimally generated by r elements, r the rank of §3.2.

σ_v ∈ W(r̄_v^∨); `R′_{2,j}` as in §4.1.

(BHHMS23, Lemma 8.3.2 and proof, p. 96; BHHMS23 line 4814; LE19, Lemma 4.5; LE19 line 779).

A proof route is as follows. Show by induction on the length of Q that M∞(Q) is minimally generated by r elements for every nonzero quotient Q of `R′_{2,j}`/`pR′_{2,j}`. Length one: Q = σ_v and §3.2 (i). If soc_K(Q) contains a nonmodular weight σ then M∞(Q) = M∞(Q/σ) (§1.5); so assume all socle constituents are modular. If [rad_K(Q)/soc_K(Q) : σ_v] ≠ 0, pick Q′ ⊊ Q with cosocle σ_v not in the socle; since `R′_{2,j}`/p is a quotient of R/pR ≅ (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` (MP.8/projective-truncation, which applies because σ_v is 8-deep, hence 3-deep), relative projectivity (MP.9/relative-projectivity) makes Q′ a quotient of Q of smaller length; apply Le's Lemma 4.5 to M∞(Q′) ⊆ M∞(Q) with a socle weight σ′ of Q′. Otherwise [Q/soc_K(Q) : σ_v] = 1, and by §4.2 the quotient Q/S is K₁-fixed, hence a quotient of P; by the exact sequence of §4.1 the image of `P_{σ_{1,j}}` ⊕ `P_{σ_{2,j}}` in Q lies in S and is zero, so Q is a quotient of P and M∞(Q) is generated by r elements (§3.4); minimality from the quotient M∞(σ_v). Conclude for `R′_{2,j}` by Nakayama.

**Checks.**

- At r=2 the terminal quotient σ has residual patched dimension 2, hence every surjection onto it needs at least 2 generators; the induction supplies at most 2, so the minimum is exactly 2.

*Needs:* §4.1; §4.2; §3.2; §3.4; §1.5; ModpRepresentationsOfGL2OverLocalFields MP.9/relative-projectivity; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-truncation.

### 4.4 Patched lattices in V(α_j) ⊗ τ° with cosocle σ_v

Let σ_v ∈ W(r̄_v^∨), let τ° be a representation of GL₂(k) on a finite free W(𝔽)-module with τ°[1/p] absolutely irreducible and cosoc_K(τ°) ≅ σ_v, and fix j. A K-stable lattice L in (V(α_j) ⊗ τ°)[1/p] with cosoc_K L ≅ σ_v exists and is unique up to homothety, and M∞(L) is free of rank r over its scheme-theoretic support, which is the domain `R∞^{(2,−1)_j,τ}`, (2,−1)_j meaning (2, −1) at σ_j and (1, 0) at the other embeddings, τ the tame type with σ(τ) ≅ τ°[1/p] ⊗ Q̄_p. For the lattices of §4.1, the surjection `T′_{2,j}`/`pT′_{2,j}` ↠ Y_j induces an isomorphism `M∞(T′_{2,j}/pT′_{2,j})` ≅ M∞(Y_j).

σ_v ∈ W(r̄_v^∨), fixed throughout BHHMS23 §8.3; then σ_v = F(λ) with λ 8-deep by genericity (BHHMS23 Proposition 2.4.2, MP.3); τ°[1/p] is in the image of the tame inertial local Langlands correspondence (it is a tame non-Steinberg type).

The domain property of `R∞^{(2,−1)_j,τ}` and the reducedness of its special fibre are BHHMS23 Proposition 4.2.1 and Corollary 4.2.6, from the local-ring supplier contract.

(BHHMS23, Proposition 8.3.3 and proof, pp. 96–98; Lemma 8.3.5 and proof, p. 99; BHHMS23 line 4843; EGS15, Lemma 4.1.1; EGS15 line 784).

A proof route is as follows. The constituents of τ° are those of a Diamond box `D_{μ,ε}` (BHHMS23 Proposition 2.4.3 and Lemma 2.4.4, tame-type gap), so F(α_j) ⊗ τ̄° is multiplicity free (MP.6/adjoint-tensor); hence the lattice with cosocle σ_v is unique up to homothety (EGS15 Lemma 4.1.1), and up to homothety it is the image L₀ of `R′_{2,j}` → A = V(α_j) ⊗ τ°. Normalize L=L₀, so pA ⊆ L ⊆ A. There is an exact sequence 0 → W₁ →(×p) L/pL → W₂ → 0 with W₁ = A/L and W₂ = L/pA; both W₁ and W₂ are killed by p. The constituents of W₁ are not modular (MP.6/adjoint-tensor and MP.3), so M∞(W₁) = 0; there exists an integral lattice τ′° in a tame type with cosocle σ_v and a surjection W₂ ↠ τ′°/pτ′° whose kernel has no modular constituents. Exactness therefore gives M∞(L/pL) ≅ M∞(W₂) ≅ M∞(τ′°/pτ′°) ≅ M∞(τ′°)/pM∞(τ′°). Applying §3.2 to this reduction gives freeness of rank r over its scheme-theoretic support, and in particular generation by r elements (BHHMS23 Proposition 8.3.3, pp. 97–98; BHHMS23 lines 4863–4913). The support S of M∞(L) is `R∞^{(2,−1)_j,τ}` because that ring is a domain; S/pS is reduced, hence it is the scheme-theoretic support of M∞(L/pL), and the Nakayama argument of §3.2 gives freeness of rank r. Lemma 8.3.5: `T′_{2,j}`/`pT′_{2,j}` and Y_j are L/pL and W₂ for τ° = σ(τ)°, and exactness gives M∞(T′₂,j/pT′₂,j) ≅ M∞(Y_j) ≅ M∞(τ′°/pτ′°), because M∞(W₁) = 0 (BHHMS23 lines 4978–4982). All these functor inputs are killed by p; the integral lattices themselves are not identified with them.

**Checks.**

- V(α_j) has dimension 3 and scalar z acts by z²z⁻²=1. The three local tensor labels for a modular constituent lie in the allowed box 0≤a_j≤2; labels −2,−1,3 in the kernel contribute patched value 0, leaving the same rank r in source and quotient.
- Hom_O(O/p,O)=0: for f and x, p f(x)=f(px)=0 and O has no p-torsion. The identity O/p→O/p is surjective. Thus the nonzero quotient of W₂ can be τ′°/pτ′°, but cannot be the integral lattice τ′°.
- For A=Oe₁⊕Oe₂⊕Oe₃ and L=Oe₁⊕pOe₂⊕pOe₃, W₁=A/L has residue dimension 2, L/pL has dimension 3, and W₂=L/pA has dimension 1. The first map sends the classes of e₂,e₃ to pe₂,pe₃, giving 2+1=3; replacing W₂ by L/pL or omitting multiplication by p breaks this exact sequence. This is the same distinction as T′₂,j/pT₂,j versus T′₂,j/pT′₂,j in Lemma 8.3.5.

*Needs:* §4.1; §3.2; §1.2; §1.5; ModpRepresentationsOfGL2OverLocalFields MP.6/adjoint-tensor; ModpRepresentationsOfGL2OverLocalFields MP.6/diamond-box; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 4.5 Freeness of `M∞(R′_{2,j})`

For j ∈ {0, …, f − 1}, `M∞(R′_{2,j})` is free of rank r over R∞/∩_τ p_τ, where τ runs over the tame inertial types with σ_v ∈ JH(σ(τ)) and p_τ = ker(R∞ ↠ `R∞^{(2,−1)_j,τ}`).

As in §4.4; the `R∞^{(2,−1)_j,τ}` are domains (local-ring supplier contract).

(BHHMS23, Theorem 8.3.4 and proof, p. 98; BHHMS23 line 4921).

A proof route is as follows. By §4.3 there is a surjection f : S^r ↠ `M∞(R′_{2,j})`, S the scheme-theoretic support. `R′_{2,j}[1/p]` = `R_{2,j}[1/p]` is the direct sum of the V(α_j) ⊗ σ(τ), each τ once; as in §3.4, BHHMS23 (71)–(72) and the domain property give S = R∞/∩_τ p_τ. By §4.4 each M∞(V(α_j) ⊗ σ(τ)°)[1/p] is free of rank r over `R∞^{(2,−1)_j,τ}[1/p]`, so `M∞(R′_{2,j})`[1/p] is locally free of rank r over S[1/p]; hence ker(f)[1/p] = 0 and, S having no p-torsion, ker(f) = 0.

**Checks.**

- For r=2 a surjection S²→M becomes an isomorphism on every characteristic-zero type component of rank 2. Its kernel has generic rank 0 and is p-power torsion; p-torsion-freeness of S² gives kernel 0.

*Needs:* §4.3; §4.4; §3.3; §1.2; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 4.6 L_j and N_j agree modulo the third radical

For j ∈ {0, …, f − 1} the surjection L_j ↠ N_j of §4.1 (formed with τ₀) induces an isomorphism (L_j/pL_j)/rad³_K(L_j/pL_j) ≅ (N_j/pN_j)/rad³_K(N_j/pN_j).

rad^i_K denotes the i-th power of the radical of finite-dimensional K-representations over 𝔽; taking rad^i preserves surjections (BHHMS23 proof of Lemma 8.3.6, p. 99; BHHMS23 line 4983).

(BHHMS23, Lemma 8.3.6 and proof, pp. 99–100; BHHMS23 line 4987).

A proof route is as follows. The reductions fit into a commutative diagram of short exact sequences 0 → `R_{2,j}`/p → L_j/p → `L_{j−1}`/p → 0 and 0 → `T_{2,j}`/p → N_j/p → `L_{j−1}`/p → 0, with left vertical map γ identified with F(α_j) ⊗ (P̃/p ↠ σ(τ₀)°/p), surjective; so L_j/p ↠ N_j/p (the map β). For a quotient M of (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` admitting P as a quotient, M/rad^i(M) ≅ P/rad^i(P) for i = 1, 2 (MP.5/first-order-weight-hulls); L_j/p, N_j/p and `L_{j−1}`/p are such quotients (§4.1), so ker β = ker rad²(β), and the same diagram for rad² gives ker rad²(β) = ker γ. It remains that ker γ ⊆ `rad_K(R_{2,j}/pR_{2,j})`, i.e. that γ is an isomorphism on cosocles, which is the dual of the proof of BHHMS23 Lemma 6.3.8 (MP.6/adjoint-tensor).

**Checks.**

- For k[t]/t⁴→k[t]/t³ the quotients modulo rad³ are both k[t]/t³ of dimension 3, although the full modules have dimensions 4 and 3. The analogous lattice comparison asserts the truncation only.

*Needs:* §4.1; ModpRepresentationsOfGL2OverLocalFields MP.5/first-order-weight-hulls; ModpRepresentationsOfGL2OverLocalFields MP.6/adjoint-tensor.

### 4.7 Generation of M∞(L_j) and of M∞(N_j)

For j ∈ {0, …, f − 1}, M∞(L_j) is generated by r elements over R∞ if and only if M∞(N_j) is.

N_j formed with τ₀; π the weighted representation, with `π^{K₁}` ≅ `D₀(r̄_v^∨)^{⊕r}` (§3.4).

(BHHMS23, Proposition 8.3.7 and proof, pp. 100–101; BHHMS23 line 5030).

A proof route is as follows. By §1.5, generation by r elements is equivalent to dim_𝔽 Hom_K(L_j, π) = r (resp. Hom_K(N_j, π)); since N_j is a quotient of L_j the forward implication is clear. Conversely, suppose dim Hom_K(L_j, π) > r; since dim Hom_K(σ_v, π) = r there is h : L_j → π not factoring through cosoc L_j = σ_v; choose one with [Im h : σ_v] minimal and put Q = Im h. Minimality and relative projectivity (MP.9/relative-projectivity, applicable because L_j/p is a quotient of `L_{f−1}`/p (§4.1), which is (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` by MP.8/projective-truncation for the 8-deep σ_v) force [Q/soc_K Q : σ_v] = 1. From `π^{K₁}` = `D₀(r̄_v^∨)^{⊕r}`, soc_K Q consists of modular weights, so Q satisfies (a)–(b) of §4.2; then rad_K(Q) ⊆ `π^{K₁}`, and rad_K Q/soc_K Q embeds in `π^{K₁}`/soc_K π, giving (c)–(d); hence Q has Loewy length ≤ 3. By §4.6 h factors through N_j, contradicting the hypothesis on N_j. (In the source this step reads dim Hom_K(σ_v, π) = f; the correct value is r.)

**Checks.**

- At f=1, r=2 the relevant baseline Hom dimension is 2, while f is 1. A hypothetical extra map gives dimension ≥3 and an image of length at most 3, which factors through N_j; equality of Hom dimensions is 2=2.

*Needs:* §4.6; §4.2; §3.4; §1.5; ModpRepresentationsOfGL2OverLocalFields MP.9/relative-projectivity; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-truncation; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle.

### 4.8 Freeness of the patched glued lattices (BHHMS23 Theorem 1.8)

For j ∈ {−1, …, f − 1}, M∞(L_j) is free of rank r over R∞/`∩_{λ,τ}` `p_{λ,τ}`, where `p_{λ,τ}` = ker(R∞ ↠ `R∞^{λ,τ}`), τ runs over the tame inertial types with σ_v ∈ JH(σ(τ)), and λ over the parallel profile (1,0) and the profiles (2,−1)_i with a single raised embedding 0≤i≤j and (1,0) at every other embedding. In particular the rank does not depend on j or on σ_v ∈ W(r̄_v^∨).

Generic global datum (p > 23); σ_v ∈ W(r̄_v^∨).

The presentation of the multi-type ring `R_{r̄_v^∨(1)}^{≤(3,0),σ_v}` of the twisted residual representation (BHHMS23 Proposition 4.3.1), its prime ideals (Lemma 4.3.2) and the membership p ∈ `q₁^{(j),(2,1)}` ∩ `q₂^{(j),(2,1)}` + `p₂^{(j),(3,0)}` (Proposition 4.3.3) are LocalGaloisDeformationRingsPartII T.7; all `R∞^{λ,τ}` are domains by the single-type gap.

(BHHMS23, Theorem 8.3.9 and proof, pp. 101–103; Theorem 1.8 (labelled there Corollary 8.3.9), p. 8; BHHMS23 line 5070).

The profiles in this support are determined by L_j[1/p]=P̃[1/p]⊕`⊕_{0≤i≤j}(V(α_i)⊗P̃)[1/p]`. Consequently at most one embedding is raised. The larger ring with all 2^f Hodge profiles is an ambient ring for the ideal calculation, not the scheme-theoretic support of this direct sum. This distinction follows from the disjoint characteristic-zero type supports in (71)–(72) and the defining fibre products (76) (BHHMS23 pp. 92–93, 99, 103; BHHMS23 lines 4675, 4953, 5119).

A proof route is as follows. Use the twist/reindexing of BHHMS23 proof of Theorem 8.3.9: after twisting deformations by ε the residual representation is r̄_v^∨(1), the patched ring is `R∞(r̄_v^∨(1);ε³ψ_v^{−1})` of §1.2, the labelled weights are (2, 1) and (3, 0), the determinant is `ε³ψ_v^{−1}`, and the type-index condition is σ_v ⊗ (`N_{k/𝔽_p}` ∘ `det^{−1}`) ∈ JH(σ(τ)) in that proof’s reindexed notation. Keep this negative norm twist in the type-to-prime bijection as well (the positive sign in its displayed ι on p. 102 is inconsistent with the defining index set). Induct on j; j = −1 is §3.4. Generation of M∞(N_j): M∞(N_j) = `M∞(L_{j−1})` `×_{M∞(Y_j)}` `M∞(T′_{2,j})` by exactness, the three modules are free of rank r over their supports (induction, §4.4), so by §2.3 it suffices that Ann(M∞(Y_j)) ⊆ `Ann(M∞(L_{j−1}))` + `Ann(M∞(T′_{2,j}))`; as Ann(M∞(Y_j)) = (p) + `Ann(M∞(T′_{2,j}))` (§4.4), it suffices that p ∈ `Ann(M∞(L_{j−1}))` + `Ann(M∞(T′_{2,j}))`. Use the multi-type ring `R∞^{≤(3,0),σ_v}` = `R∞(r̄_v^∨(1);ε³ψ_v^{−1})`/`∩_{λ,τ}p_{λ,τ}`, isomorphic through the twist to R∞/`∩_{λ,τ}p_{λ,τ}` with the untwisted profiles, and ≅ S⟦X₁, …, X_h⟧ with S an explicit completed tensor product of rings `S^{(j)}` modulo an ideal, the component primes indexed by whole type tuples k ∈ {1, 2}^f, given by sums of the actual transported ideals with their coupled tails and with the embedding reversal j ↦ f − 1 − j, and τ₀ ↔ k = (2, …, 2). Then `Ann(M∞(T′_{2,j}))` = `p₂^{λ(j)}` and `Ann(M∞(L_{j−1}))` ⊇ `q₁^{(j),(2,1)}` ∩ `q₂^{(j),(2,1)}`, so the needed membership is p ∈ `q₁^{(j),(2,1)}` ∩ `q₂^{(j),(2,1)}` + `p₂^{(j),(3,0)}`, which is BHHMS23 Proposition 4.3.3. By §4.7 M∞(L_j) is generated by r elements; as in §3.4 M∞(L_j)[1/p] is free of rank r over its support (BHHMS23 (71)–(72) with §4.5 and the induction hypothesis), so any surjection S^r ↠ M∞(L_j) is an isomorphism.

**Checks.**

- For f=1, j=−1 only profile (1,0) occurs; for j=0 both (1,0) and (2,−1) occur. After ε-twist the determinant sums are 3=2+1=3+0. On diag(2,1) over 𝔽₂₉ the negative determinant twist is 15, while the positive twist is 2.

- In the p-membership proof take p=29, N=12, r_j=12, the positive sign and a₂=14, so a₂≡r_j+2 modulo 29, and d₂₁*=1. Then 2/a₂=1/7≡25 modulo 29, so the factor is 1/7+O(29³), a unit, and the constructed ideal element is 29 times that unit. The required denominators a₂ and a₂−1 are 14 and 13. The chart unit (a₂−2)(a₂+1)/(a₂(a₂−1)) reduces to 8, not zero. The values a₂=0 or 1 invalidate division; a₂=2 or −1 invalidate this chart unit; p=2 invalidates the unit factor 2. Genericity excludes these cases (BHHMS23 Proposition 4.3.3, pp. 39–40; BHHMS23 lines 1918–1943; the parameter relation is BHHMS23 line 2098).

- For f=2 and j=1 the Hodge profiles on the characteristic-zero support are ((1,0),(1,0)), ((2,−1),(1,0)) and ((1,0),(2,−1)): three profiles. The simultaneous profile ((2,−1),(2,−1)) is absent. The generic representation has rank (1+3+3) dim P=7 dim P, whereas adjoining the double-adjoint tensor would add 9 dim P and give 16 dim P. A rectangular four-profile support would therefore include a nonempty generic locus on which this patched module is zero.

*Needs:* §4.1; §4.7; §4.4; §4.5; §3.4; §2.3; §1.2; §3.3; LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the applicable supplier gaps.

### 4.9 Multiplicity one for the first-order projective envelope (BHHMS23 Theorem 8.3.11)

M∞(R) is free of rank r over R∞/`∩_{λ,τ}` `p_{λ,τ}`, with τ over the tame types with σ_v ∈ JH(σ(τ)) and λ equal to the parallel profile (1,0) or to (2,−1)_i for exactly one embedding i, and dim_𝔽 M∞(R)/𝔪∞ = r. Consequently the surjection (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` ↠ σ_v induces an isomorphism of nonzero finite-dimensional 𝔽-vector spaces M∞((`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}`)/𝔪∞ ≅ M∞(σ_v)/𝔪∞; equivalently, by §1.5, Hom_K(σ_v, π) ≅ Hom_K((`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}`, π).

σ_v ∈ W(r̄_v^∨); R = `L_{f−1}` with R/pR ≅ (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` (MP.8/projective-truncation).

Without passing to the fibre at 𝔪∞ the statement is false: exactness of M∞ makes M∞((Proj σ_v)/𝔪²) strictly larger than M∞(σ_v) (BHHMS23 Remark 8.3.12).

(BHHMS23, Corollary 8.3.10, Theorem 8.3.11 and Remark 8.3.12, p. 103; BHHMS23 line 5145; BHHMS23, §1.3.2, (5)–(6), p. 7; BHHMS23 line 288).

A proof route is as follows. The first assertion is §4.8 for j = f − 1; the fibre dimension is r because a module free of rank r over a quotient of R∞ has fibre of dimension r. M∞(R/pR) = M∞(R)/p has fibre dimension r as well, and R/pR ≅ (`Proj_{K/Z₁}σ_v`)/`𝔪²_{K₁}` (MP.8/projective-truncation); M∞(σ_v) has fibre dimension r by §3.2 (i). The map M∞((Proj σ_v)/𝔪²) → M∞(σ_v) is surjective by exactness, so on fibres it is a surjection between r-dimensional spaces, hence an isomorphism.

**Checks.**

- For r=2 the endpoint lattice and σ each have patched fibre 𝔽²; the surjective fibre map has kernel dimension 2−2=0. Before the fibre, k[[t]]→k has kernel (t)≠0 although both minimal generator counts are 1.

- At f=2 the endpoint still has three Hodge profiles, not four; its residual patched fibre has dimension r. Freeness over its actual support suffices for the fibre theorem and does not require the missing double-adjoint profile.

*Needs:* §4.8; §3.2; §1.5; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-truncation.

### Examples

If d=dim P and f=1, rank L₋₁=d and rank L₀=4d; for f=2 the ranks are d,4d,7d. The quotient R′/pR has dimension d whereas R′/pR′ has dimension 3d; confusing the two loses 2d.

At f=1, r=2 the relevant baseline Hom dimension is 2, while f is 1. A hypothetical extra map gives dimension ≥3 and an image of length at most 3, which factors through N_j; equality of Hom dimensions is 2=2.

For f=1, j=−1 only profile (1,0) occurs; for j=0 both (1,0) and (2,−1) occur. After ε-twist the determinant sums are 3=2+1=3+0. On diag(2,1) over 𝔽₂₉ the negative determinant twist is 15, while the positive twist is 2.

For r=2 the endpoint lattice and σ each have patched fibre 𝔽²; the surjective fibre map has kernel dimension 2−2=0. Before the fibre, k[[t]]→k has kernel (t)≠0 although both minimal generator counts are 1.

### Dependencies

Use ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice; ModpRepresentationsOfGL2OverLocalFields MP.8/lattice-coinvariants; ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint; ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set; Mathlib `LinearMap.ker`; ModpRepresentationsOfGL2OverLocalFields MP.5/first-order-weight-hulls; ModpRepresentationsOfGL2OverLocalFields MP.5/finite-weight-hulls; ModpRepresentationsOfGL2OverLocalFields MP.9/relative-projectivity; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-truncation; ModpRepresentationsOfGL2OverLocalFields MP.6/adjoint-tensor; ModpRepresentationsOfGL2OverLocalFields MP.6/diamond-box; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle. Each subsection above identifies the earlier local targets needed for its statement and route.

## Layer 5: Gelfand–Kirillov dimension, Banach lifts and big R = big T

### 5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS23 Theorem 1.10)

For a generic global datum and the weighted representation π of §0.5, `dim_{GL₂(F_v)}(π)` = f = [F_v : ℚ_p].

`dim_{GL₂(F_v)}` is the dimension of ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension: 3f minus the grade of π^∨ over 𝔽⟦K₁/Z₁⟧.

(BHHMS23, Theorem 8.4.1 and proof, (80)–(81), pp. 104–105; Theorem 1.10, p. 10; BHHMS23 line 5172; GN22, Lemmas A.16 and A.19, Definition A.2, Proposition A.4(1), pp. 42–47; GN22 line 2122).

A proof route is as follows. Upper bound: verify the three hypotheses of MP.7/local-gk-bound for ρ = r̄_v^∨. (i) JH(soc_K π) = W(r̄_v^∨) by the weight theorem (§0.6). (ii) [`π[𝔪²_{K₁}]` : σ_v] = [soc_K π : σ_v] for σ_v ∈ W(r̄_v^∨) by §4.9 in its Hom form. (iii) `JH(π^{I₁})` = JH(D₁(r̄_v^∨)): since K₁ ⊆ I₁, `π^{I₁}` = `(π^{K₁})^{I₁}` = `(D₀(r̄_v^∨)^{⊕r})^{I₁}` = `D₁(r̄_v^∨)^{⊕r}` by §3.4 and MP.3/diamond-socle (BHHMS argue instead with Breuil's Lemma 9.2 and Breuil–Paškūnas Lemma 14.1); MP.7/diamond-connected (D₁ of a tame 6-deep ρ is connected) and MP.7/connected-characters turn (iii) into the connectedness hypothesis. Hence dim π ≤ f. Lower bound: let M∞ be the big patched module (§1.6). By §2.4 (2) for A = R∞⟦K₁/Z₁⟧ and MP.4/dimension-comparisons, `j_{R∞⟦K₁/Z₁⟧}(M∞)` ≥ `j_{𝔽⟦K₁/Z₁⟧}(M∞/𝔪∞)` = 3f − dim π (BHHMS23 (80)). M∞ is finite free over S∞⟦K₁/Z₁⟧, so its grade there is 0 and its dimension is dim S∞ + dim K₁/Z₁; by §2.4 (3) its dimension over R∞⟦K₁/Z₁⟧ is the same, so `j_{R∞⟦K₁/Z₁⟧}(M∞)` = dim R∞ − dim S∞ = 2f (§1.1; BHHMS23 (81)). Combining, 2f ≥ 3f − dim π, so dim π ≥ f.

**Checks.**

- At f=1, grades satisfy 2≥3−dim π and the upper bound is dim π≤1, giving dim π=1. At f=2, 4≥6−dim π and dim π≤2 give dim π=2. A nonzero finite-dimensional smooth representation has GK dimension 0 and cannot be this π.

*Needs:* ModpRepresentationsOfGL2OverLocalFields MP.7/local-gk-bound; ModpRepresentationsOfGL2OverLocalFields MP.7/connected-characters; ModpRepresentationsOfGL2OverLocalFields MP.7/diamond-connected; ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension; ModpRepresentationsOfGL2OverLocalFields MP.4/dimension-comparisons; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle; §3.4; §0.6; §0.5; §4.9; §1.6; §1.1; §2.4.

### 5.2 Structure of `π[𝔪²_{K₁}]` (BHHMS23 Theorem 1.9)

For the weighted π there is r ≥ 1 with `π[𝔪²_{K₁}]` ≅ `(⊕_{σ_v∈W(r̄_v^∨)} D̃_{σ_v})^{⊕r}` as K-representations, where `D̃_{σ_v}` is the largest subrepresentation of (`Inj_{K/Z₁}σ_v`)[`𝔪²_{K₁}`] containing σ_v with multiplicity one (as its socle) and no other weight of W(r̄_v^∨). Every irreducible constituent of `π[𝔪²_{K₁}]` occurs with multiplicity r.

`𝔪_{K₁}` is the maximal ideal of 𝔽⟦K₁/Z₁⟧ and `π[𝔪²_{K₁}]` the subspace killed by its square.

`D̃_{σ_v}` is the summand `V_{σ_v}` of MP.6/socle-enlargement for the tame representation r̄_v^∨ (BHHMS23 Corollary 6.3.13).

(BHHMS23, Theorem 8.4.2 and proof, p. 105; Theorem 1.9, p. 10; BHHMS23 line 5246).

A proof route is as follows. M∞ is finite projective over S∞⟦K⟧_Z (§1.6), so M∞/(p, x₁, …) is finite projective over 𝔽⟦K⟧_Z; since Hom(M∞/(p, x), σ_v^∨)^∨ = M∞(σ_v)/(p, x) is nonzero exactly for σ_v ∈ W(r̄_v^∨), M∞/(p, x) ≅ `⊕_{σ_v}(Proj_{K/Z₁}σ_v^∨)^{m_{σ_v}}` with `m_{σ_v}` ≥ r. By the defining property of `D̃_{σ_v}`, restriction gives Hom(M∞/(p, x), `D̃_{σ_v}^∨`) ≅ Hom(M∞/(p, x), σ_v^∨); taking 𝔪∞-torsion and M∞/𝔪∞ ≅ π^∨ gives `Hom_K(D̃_{σ_v}, π)` ≅ Hom_K(σ_v, soc_K π). As soc_K π = `(⊕σ_v)^{⊕r}` (§3.2), `(⊕D̃_{σ_v})^{⊕r}` ⊆ `π[𝔪²_{K₁}]`; it cannot be larger by MP.6/socle-enlargement and §4.9; multiplicities by the constituent description of MP.6/socle-enlargement.

**Checks.**

- For r=2 each constituent in the direct sum of first-order summands occurs twice, so a multiplicity-one conclusion would return 1 instead of 2. Passing to K₁-invariants recovers D₀² consistently with §3.4.

*Needs:* §1.6; §3.2; §4.9; §1.5; ModpRepresentationsOfGL2OverLocalFields MP.6/socle-enlargement; ModpRepresentationsOfGL2OverLocalFields MP.5/first-order-weight-hulls.

### 5.3 The big patched module is faithfully flat over R∞

The big patched module M∞ is a faithfully flat R∞-module.

Generic global datum; M∞ as in §1.6, finite free over S∞⟦K₁/Z₁⟧.

(BHHMS23, Theorem 8.4.3 and proof, pp. 105–106; BHHMS23 line 5283; GN22, Corollary A.29 and Proposition A.30; GN22 line 2235).

A proof route is as follows. M∞ is free of finite rank over A = S∞⟦K₁/Z₁⟧, hence Cohen–Macaulay over A; by §2.5 it is Cohen–Macaulay over B = R∞⟦K₁/Z₁⟧ (R∞ is a power series ring over W(𝔽) by §1.1, so B is an Iwasawa algebra with power-series coefficients). By §5.1 and the computations (80)–(81) there, j_B(M∞) = 2f = `j_{𝔽⟦K₁/Z₁⟧}(M∞/𝔪∞)`. §2.6 gives flatness over R∞; M∞/𝔪∞ ≅ π^∨ ≠ 0 and R∞ is local, so M∞ is faithfully flat.

**Checks.**

- At f=1 both required grades are 2; at f=2 both are 4. The residual fibre π∨ is nonzero. The flat module Frac(O) has closed fibre 0 and is not faithfully flat over O, showing that flatness alone is insufficient.

*Needs:* §1.6; §1.1; §2.5; §2.6; §5.1; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### 5.4 Nonzero Banach lifts of π (BHHMS23 Theorem 1.3)

Let x : R∞ → O′ be a homomorphism of local W(𝔽)-algebras, O′ the integers of a finite extension E′ of E = W(𝔽)[1/p], with residue field 𝔽′. Then V(x) = `Hom^{cont}_{O′}(M∞ ⊗_{R∞,x} O′, E′)` is a nonzero admissible unitary Banach representation of GL₂(F_v) over E′, with GL₂(F_v)-invariant unit ball `Hom^{cont}_{O′}(M∞ ⊗_{R∞,x} O′, O′)` whose reduction modulo the maximal ideal of O′ is π ⊗_𝔽 𝔽′.

x induces a lift ρ_x : `G_{F_v}` → GL₂(E′) of r̄_v^∨ (up to the duality convention); V(x) is the candidate of CEGGPS for the p-adic Langlands correspondence, now known to be nonzero.

(BHHMS23, Corollary 8.4.4 and proof, p. 106; Theorem 1.3, p. 4; BHHMS23 line 5292; CEGGPS16, §2.12, Proposition 2.13 and proof, p. 34 (arXiv v5); CEGGPS16 line 1369).

A proof route is as follows. Admissibility and unitarity: let x̄ : R∞ → 𝔽′ be x followed by residue reduction. The kernel of x̄ on S∞ is open; the kernel of x itself need not be open. The finite generation of M∞ over S∞⟦K⟧ and topological Nakayama imply finite generation of M∞ `⊗_{R∞,x}` O′ over O′⟦K⟧, using its finite residual module. CEGGPS16 Proposition 2.13 and the Schikhof duality of CompletedCohomologyPartII §F.1 then give an admissible unitary Banach representation. Nonvanishing: M∞ is flat over R∞ (§5.3), so M∞ `⊗_{R∞,x}` O′ is flat over O′, that is torsion free; it is nonzero since its reduction is π^∨ ⊗ 𝔽′ ≠ 0; Schikhof duality (CompletedCohomologyPartII §F.1; BHHMS23 Corollary 8.4.4, p. 106) then gives V(x) ≠ 0. The unit ball reduces to the dual of M∞ `⊗_{R∞}` 𝔽′ = (M∞/𝔪∞) ⊗ 𝔽′ ≅ π^∨ ⊗ 𝔽′, i.e. to π ⊗ 𝔽′.

**Checks.**

- For a compact torsion module 𝔽, Hom_O(𝔽,E)=0, so a nonzero residual fibre alone does not ensure a Banach lift. For O-flat specialization O the bounded dual is E with unit ball O and reduction 𝔽; faithful flatness excludes the torsion alternative.

*Needs:* §5.3; §1.6; CompletedCohomologyPartII §F.1, 3.1–3.2; NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11; CompletedCohomologyPartII §F.1.

### 5.5 Gelfand–Kirillov dimension of mod p cohomology of Shimura curves (BHHMS23 Theorem 1.1)

Let a generic global datum be given (with S = S_D ∪ S_r) and let V^v = `∏_{w∉S_D∪S_r}(O_D)_w^×` · `∏_{w∈(S_D∪S_r)∖{v}}` V_w ⊆ `∏_{w≠v}(O_D)_w^×` be a compact open subgroup with V_w ⊆ 1 + `pM₂(O_{F_w})` for w ∈ S_p ∖ {v}, such that π ≠ 0, where π = `colim_{V_v}` `Hom_{G_F}(r̄, H¹_ét(X_{V^vV_v} ×_F F̄, 𝔽))` in the indefinite case and π = `colim_{V_v}` S(V^vV_v, 𝔽)[𝔪] in the definite case. Then `dim_{GL₂(F_v)}(π)` = [F_v : ℚ_p]. Without the condition V_w ⊆ 1 + `pM₂(O_{F_w})` at w ∈ S_p ∖ {v} one still has `dim_{GL₂(F_v)}(π)` ≤ [F_v : ℚ_p]; and the equality holds for V^v = `∏_{w∉S}(O_D)_w^×` `∏_{w∈S∖{v}}V_w` for any finite S ⊇ S_D ∪ S_r, with the same nonvanishing and pro-p conditions at the other places above p, such that the framed deformation ring of r̄_w is formally smooth for w ∈ S ∖ S_p.

The hypotheses on r̄: absolutely irreducible on `G_{F(ζ_p)}`, generic at the places above p other than v, of the stated semisimple inertial shape at v (so p > 23), formally smooth local rings at the bad places away from p.

In the definite case 𝔪 is the ideal of BHHMS23 Remark 8.1.3(ii) for S large; the eigenspace does not depend on S (BDJ10 Lemma 4.6(a)).

(BHHMS23, Corollary 8.4.6 and proof, pp. 106–107; Remark 8.4.7, p. 108; Theorem 1.1, p. 3; BHHMS23 line 5311).

A proof route is as follows. Upper bound: the dimension of a subrepresentation is at most that of the space, so shrink V^v: take `V_{w₁}` unipotent upper triangular modulo w₁ and V_w ⊆ 1 + `pM₂(O_{F_w})` normal at w ∈ S_p ∖ {v}; then S = S_D ∪ S_r and U = ∏U_w (U_w = V_w off S_p, U_w = `GL₂(O_{F_w})` on S_p) satisfy §0.1. Dévissage (BHHMS23 (83)): π ≅ colim `Hom_{U^v/V^v}(⊗_w(Ind_{V_w}^{GL₂(O_{F_w})}1)_Z, Hom_{G_F}(r̄, H¹))`; filtering the induced representations by Serre weights and using that H¹_𝔪 is injective over U^v/V^v (§0.4), and that the dimension of an extension is the maximum and that of a subrepresentation at most that of the whole (grades in short exact sequences, §2.1), dim π is the maximum over weight tuples of the dimensions of the weighted π, which are f or zero by §5.1 and §0.6; so dim π ≤ f, with equality as soon as one modular tuple occurs, which π ≠ 0 forces. For the lower bound at the original open levels V_w ⊆ K₁,w (w ∈ S_p ∖ {v}), which need not be normal in K₁,w, first form the smooth tower representation Π = `colim_{V_v, (V′_w)_{w∈S_p∖{v}}}` of the same r̄-parts (definite: 𝔪-eigenspaces), varying the levels at v and at every other place above p; it carries commuting smooth actions of GL₂(F_v) and of `∏_{w∈S_p∖{v}}` `GL₂(O_{F_w})`. By finite-level control the original π is `Π^{∏V_w}`: choose open V′_w ⊆ V_w normal in K₁,w (for instance the normal core) and apply §0.4 to the normal inclusion V′ ⊆ V, whose quotient acts freely. Hence π ≠ 0 implies Π ≠ 0. Π is a smooth representation of the compact pro-p group ∏K₁,w, so `Π^{∏K₁,w}` ≠ 0; this GL₂(F_v)-stable subspace is the space π at the enlarged levels K₁,w, which are normal in `GL₂(O_{F_w})`, and it embeds in `Π^{∏V_w}` = π. Apply the weight theorem (§0.6) and §5.1 at the enlarged levels: the enlarged-level space has dimension f by the upper-bound argument with a modular tuple, so π has dimension at least f. Remove the auxiliary level at w₁ with §0.7: its doubling does not change dimension. Together with the upper bound this gives equality at the original level; shrinking to K₁,w would reverse the required inclusion. The variant with a larger S (BHHMS23 Remark 8.4.7) is the same argument with S in place of S_D ∪ S_r.

**Checks.**

- Enlarging an away-from-v subgroup V_w⊂K₁,w to K₁,w gives invariants included in the original space. A nonzero smooth C₂₉-module over 𝔽₂₉ has nonzero invariants; the regular module has invariant dimension 1 and total dimension 29.
- Let V=⟨1+pE₁₂, K₃⟩ ⊂ K₁ with K₃=1+`p³M₂(O_{F_w})`; its elements are ≡1+apE₁₂ modulo p³. Conjugating 1+pE₁₂ by 1+pE₂₁ gives 1+pE₁₂+p²(E₂₂−E₁₁)−p³E₂₁, which is ≡1+pE₁₂+p²(E₂₂−E₁₁) modulo p³ and so lies outside V: V is open but not normal in K₁, and K₁ does not act on the fixed-level space at V. The inclusion of K₁-invariants is defined inside the tower representation Π, where both levels are invariants of one representation; the theorem is not restricted to normal V_w.

*Needs:* §5.1; §0.5; §0.7; §0.6; §0.1; §0.4; §2.1; ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension; ModpRepresentationsOfGL2OverLocalFields MP.4/dimension-comparisons.

### 5.6 Completed cohomology at the r̄-part and the big Hecke algebra

Assume p is inert in F (so S_p = {v}) and let V^v = `∏_{w≠v}U_w`. For compact open V_v ⊆ 1 + `pM₂(O_{F_v})` and n ≥ 1 let `H¹_ét(X_{V^vV_v} ×_F F̄, W(𝔽)/pⁿ)^{ψ^{−1}}` (definite: `S(V^vV_v, W(𝔽)/pⁿ)^{ψ^{−1}}`) be the `ψ^{−1}`-isotypic part for the centre (𝔸_F^∞)^×, `ψ^{−1}` viewed as a character of (𝔸_F^∞)^× by the global Artin map sending uniformizers to geometric Frobenius; let `T(V^vV_v, W(𝔽)/pⁿ)^{ψ^{−1}}` be the W(𝔽)-subalgebra of its endomorphisms generated by the T_w, S_w for w ∉ S ∪ {w₁}, and `T(…)_{r̄}^{ψ^{−1}}` its localisation at 𝔪. The quaternionic specialization of the supplied completed Hecke algebra is `T̂(V^v)_{r̄}^{ψ^{−1}}` = `lim_{n,V_v}` `T(V^vV_v, W(𝔽)/pⁿ)_{r̄}^{ψ^{−1}}`, and the supplied localized completed cohomology specializes to `Ĥ¹(V^v)_{r̄}^{ψ^{−1}}` = lim_n `colim_{V_v}` (`H¹(…, W(𝔽)/pⁿ)^{ψ^{−1}}` `⊗_{T(…)}` `T(…)_{r̄}`) (definite: `Ŝ(V^v)_{r̄}^{ψ^{−1}}`), whose W(𝔽)-dual `Hom_{W(𝔽)}(Ĥ¹(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))` is a `T̂(V^v)_{r̄}^{ψ^{−1}}`-module. In the indefinite case the completed Galois multiplicity module is `Ĉ(V^v)_{r̄}^{ψ^{−1}}` = lim_n `colim_{V_v}` `Hom_{T(…)_{r̄}[G_{F,S}]}`(ρ(…), `H¹(…, W(𝔽)/pⁿ)^{ψ^{−1}}` `⊗_{T(…)}` `T(…)_{r̄}`), with ρ(…) the rank-two Galois representation over the localized finite-level Hecke algebra of §0.3; in the definite case put Ĉ = Ŝ. `R^ψ_{r̄,S∪{w₁}}` is the universal deformation ring of r̄ for deformations unramified outside S ∪ {w₁} with ψ = ε det.

This specialization and §5.7 retain the hypothesis that p is inert in F (BHHMS23 §8.5, p. 108; Remark 8.5.2, p. 109).

(BHHMS23, §8.5, pp. 108–109; §1.2 before Theorem 1.2, pp. 3–4; BHHMS23 line 5409; GN22, §4.3, Proposition 4.3.1; GN22 line 1408).

Its API:

- `Ĥ¹(V^v)_{r̄}^{ψ^{−1}}` (resp. Ŝ) as a p-adically complete W(𝔽)-module with commuting GL₂(F_v) and Hecke actions, and also the natural G_F-action in the indefinite cohomological case.
- `T̂(V^v)_{r̄}^{ψ^{−1}}` as the inverse limit of the localized finite-level Hecke algebras, a complete local W(𝔽)-algebra.
- The surjection `R^ψ_{r̄,S∪{w₁}}` ↠ `T̂(V^v)_{r̄}^{ψ^{−1}}` sending tr `ρ^{univ}(Frob_w)` to `S_w^{−1}T_w` for geometric Frobenius at w ∉ S ∪ {w₁}, with determinant `Norm(w)S_w^{−1}`.
- At finite coefficients the tower comparison is the non-Eisenstein comparison of §0.4; taking inverse limits uses the qualified reduction maps of CompletedCohomologyPartII §§2.4, 3.7, and is not an unrestricted assertion that invariants commute with reduction.
- The localisation does not depend on enlarging S (BDJ10 Lemma 4.6(a)).
- Indefinite case: the evaluation isomorphisms of §0.3 are compatible through the tower and with reduction modulo pⁿ, so Ĥ¹ ≅ Ĉ `⊗_{T̂}` ρ_T̂ with ρ_T̂ free of rank two over T̂; a basis of the universal deformation over `R^ψ_{r̄,S∪{w₁}}`, pushed to T̂, gives Ĥ¹ ≅ `Ĉ^{⊕2}` compatibly with the Hecke and GL₂(F_v)-actions (not with the G_F-action).

A proof route is as follows. Specialise the completed cohomology and completed Hecke algebra of CompletedCohomologyPartII §§8.8–8.14 (completed-hecke-algebra, completed-residual-localisation) to the quaternionic Shimura-curve tower of HilbertModularVarietiesAndShimuraCurves §R18.4.2 with level varying at v, with the `ψ^{−1}`-isotypic projection of the centre. CompletedCohomologyPartII §8.8 defines finite Hecke images on the derived cohomology complexes. After the non-Eisenstein localisation, H⁰ and H² vanish, so the indefinite complex is concentrated in degree 1 and is its H¹ shifted; in the definite case it is concentrated in degree 0. Thus those derived Hecke images agree with the images on the cohomology modules used here, compatibly through the tower. This identifies the imported construction rather than silently changing its carrier. The deformation ring is GlobalGaloisDeformations' universal deformation ring with fixed determinant (GlobalGaloisDeformations §3.3–3.4, GlobalGaloisDeformations §3.4); the map `R^ψ_{r̄,S∪{w₁}}` → T̂ is the inverse limit of the finite-level maps given by the Galois representations on localized Hecke algebras (HilbertModularVarietiesAndShimuraCurves §R18.4.27), dualizing the parent’s geometric realization for r̄^∨⊗ω⁻¹ and tensoring by ε⁻¹ as in §0.3, sending geometric Frobenius traces to `S_w^{−1}T_w` and determinants to `Norm(w)S_w^{−1}` at w ∉ S ∪ {w₁}.

**Checks.**

- `T̂(V^v)_{r̄}^{ψ^{−1}}` is local with residue field 𝔽 and maximal ideal the image of 𝔪, because each finite-level algebra is localized at 𝔪 before the limit. Before localization the Hecke image can have several residual factors: for T=𝔽×𝔽 the idempotents e₁=(1,0), e₂=(0,1) give two maximal ideals. Localizing at 𝔪=0×𝔽 inverts e₁, so e₂=e₂e₁e₁⁻¹=0 and e₁ becomes 1; thus T_𝔪≅𝔽 with unique maximal ideal 0. An unlocalized algebra keeping both nonzero orthogonal idempotents is not local, although its first projection also sends 1 to 1 and 0×𝔽 to 0. No Eisenstein action on H⁰ or H² is inferred for a Hecke image defined solely on H¹.
- The geometric trace/determinant map agrees with §0.3: at q=5, T=9, S=25 in 𝔽₂₉, S⁻¹T=7·9=5 and qS⁻¹=5·7=6. The §R18.4.27 geometric realization has eigenvalues 17,21; dualization and ε⁻¹ restore geometric eigenvalues 5/17=2, 5/21=3. Sending the geometric trace directly to T would give 9 instead of 5.
- A non-Eisenstein reduction comparison identifies the residual multiplicity part with π(V^v); for a two-term complex O --p→ O the reduced complex also has Tor in the adjacent degree, so plain reduction is not imposed on every tower. The differential reduces to zero, giving two nonzero residual degrees; the adjacent residual Tor group is 𝔽, not zero.
- For F with two places above p, varying only v leaves the other factor at fixed level; this differs from the inert single-place tower of §5.6. The away weight tensor has one local factor instead of the empty tensor O at |S_p|=1.

*Needs:* §0.3; CompletedCohomologyPartII §8.8, 8.10; CompletedCohomologyPartII §8.12–8.14; CompletedCohomologyPartII §F.1, 3.1–3.2; HilbertModularVarietiesAndShimuraCurves §R18.4.2; HilbertModularVarietiesAndShimuraCurves §R18.4.27; GlobalGaloisDeformations §3.3–3.4; GlobalGaloisDeformations §3.4.

### 5.7 Big R = big T and flatness of completed cohomology (BHHMS23 Theorem 1.2)

Assume p inert in F. In the sequence of surjections R∞ `⊗_{S∞}` W(𝔽) = R∞/(x₁, …, `x_{4|S|+q−1}`) ↠ `R^ψ_{r̄,S∪{w₁}}` ↠ `T̂(V^v)_{r̄}^{ψ^{−1}}` all maps are isomorphisms; `Hom_{W(𝔽)}(Ĥ¹(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))` (resp. the dual of `Ŝ(V^v)_{r̄}^{ψ^{−1}}`) is a faithfully flat `T̂(V^v)_{r̄}^{ψ^{−1}}`-module; and `T̂(V^v)_{r̄}^{ψ^{−1}}` is a complete intersection.

Generic global datum with p inert in F; `V_{w₁}` sufficiently small at the chosen auxiliary place.

(BHHMS23, (84), p. 108; Corollary 8.5.1 and proof, p. 109; Theorem 1.2, p. 4; BHHMS23 line 5447; GN22, Proposition 4.3.1, §4.3; GN22 line 1408).

A proof route is as follows. By §1.6, C = M∞/(x₁, …) is the dual of the completed multiplicity module Ĉ, compatibly with the surjections, and the dual of Ĥ¹ (resp. Ŝ) is `C^{⊕2}` in the indefinite case and C in the definite case. C is faithfully flat over R∞/(x₁, …) by base change of §5.3, and so is `C^{⊕2}`. A faithfully flat module is faithful, so the composite R∞/(x) ↠ R^ψ ↠ T̂ → `End_{W(𝔽)}(C^{⊕2})` (resp. `End_{W(𝔽)}(C)`) is injective; hence all maps are isomorphisms, and the dual of Ĥ¹ (resp. Ŝ) is faithfully flat over T̂. M∞ is faithfully flat over R∞ and over S∞ (finite free over S∞⟦K₁/Z₁⟧), so R∞ is faithfully flat over S∞; thus the regular sequence (x₁, …) of S∞ is R∞-regular and T̂ ≅ R∞/(x₁, …) is a power series ring over W(𝔽) modulo a regular sequence, a complete intersection (BHHMS reproduce Gee–Newton Proposition 4.3.1 in this setting).

**Checks.**

- For a regular power-series ring R=O[[x,t]], quotienting by the regular sequence (x) leaves O[[t]], a codimension-one complete intersection. Acting on its faithful free module R/(x), any intermediate surjection kernel acts by 0 and is therefore 0; the zero module would detect no kernel.
- Faithful flatness passes between C and `C^{⊕2}`: Tor and tensor products with a direct sum of two copies are direct sums of two copies, and N ⊗ `C^{⊕2}`=0 exactly when N ⊗ C=0. So the indefinite conclusion for the full completed-H¹ dual follows from the one for C; with rank-two free O[[t]]-modules the faithful action of O[[t]] on C and on C² has the same kernel 0.

*Needs:* §5.6; §5.3; §1.6; §1.1; DeformationAndDerivedPatchingAlgebra §3.4; Mathlib `Module.FaithfullyFlat`.

### Examples

At f=1, grades satisfy 2≥3−dim π and the upper bound is dim π≤1, giving dim π=1. At f=2, 4≥6−dim π and dim π≤2 give dim π=2. A nonzero finite-dimensional smooth representation has GK dimension 0 and cannot be this π.

For a compact torsion module 𝔽, Hom_O(𝔽,E)=0, so a nonzero residual fibre alone does not ensure a Banach lift. For O-flat specialization O the bounded dual is E with unit ball O and reduction 𝔽; faithful flatness excludes the torsion alternative.

For a regular power-series ring R=O[[x,t]], quotienting by the regular sequence (x) leaves O[[t]], a codimension-one complete intersection. Acting on its faithful free module R/(x), any intermediate surjection kernel acts by 0 and is therefore 0; the zero module would detect no kernel.

### Dependencies

Use ModpRepresentationsOfGL2OverLocalFields MP.7/local-gk-bound; ModpRepresentationsOfGL2OverLocalFields MP.7/connected-characters; ModpRepresentationsOfGL2OverLocalFields MP.7/diamond-connected; ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension; ModpRepresentationsOfGL2OverLocalFields MP.4/dimension-comparisons; ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle; ModpRepresentationsOfGL2OverLocalFields MP.6/socle-enlargement; ModpRepresentationsOfGL2OverLocalFields MP.5/first-order-weight-hulls; CompletedCohomologyPartII §F.1, 3.1–3.2; CompletedCohomologyPartII §8.8, 8.10; CompletedCohomologyPartII §8.12–8.14; HilbertModularVarietiesAndShimuraCurves §R18.4.2; HilbertModularVarietiesAndShimuraCurves §R18.4.27; GlobalGaloisDeformations §3.3–3.4; GlobalGaloisDeformations §3.4; DeformationAndDerivedPatchingAlgebra §3.4; Mathlib `Module.FaithfullyFlat`. Each subsection above identifies the earlier local targets needed for its statement and route.

## Downstream consumers

The infinite-level arithmetic applications consume §5.5's dimension theorem with its full residual and level hypotheses. Local-global comparison applications consume §§3.4, 4.9 and 5.2 for K₁-invariants and the first-order congruence structure. Banach representation applications consume §5.4 for every continuous local specialization, including the torsion-free integral lattice. Deformation and Hecke applications consume §5.7's isomorphism and faithful flatness with the inertness hypothesis. These outputs introduce no reverse supplier relation to those applications.

## References

Locators refer to the versions linked here and their internal printed pagination. Each assertion above includes its theorem/section locator and a line locator in the corresponding legal source extraction. The references identify the source versions used.

- **BHHMS23**. Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra and Benjamin Schraen, [Gelfand–Kirillov dimension and mod p cohomology for GL2](https://arxiv.org/abs/2009.03127v7). arXiv:2009.03127v7 (9 June 2023, marked final version); Inventiones Mathematicae 234 (2023), 1–128, doi:10.1007/s00222-023-01202-8.
- **EGS15**. Matthew Emerton, Toby Gee and David Savitt, [Lattices in the cohomology of Shimura curves](https://arxiv.org/abs/1305.1594v3). arXiv:1305.1594v3 (19 November 2014); Inventiones Mathematicae 200 (2015), 1–96.
- **GN22**. Toby Gee and James Newton, [Patching and the completed homology of locally symmetric spaces](https://arxiv.org/abs/1609.06965v5). arXiv:1609.06965v5 (18 November 2019); Journal of the Institute of Mathematics of Jussieu 21 (2022), 395–458.
- **GK14**. Toby Gee and Mark Kisin, [The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/abs/1208.3179v5). arXiv:1208.3179v5; Forum of Mathematics, Pi 2 (2014), e1.
- **DL21**. Andrea Dotto and Daniel Le, [Diagrams in the mod p cohomology of Shimura curves](https://arxiv.org/abs/1909.12219v2). arXiv:1909.12219v2; Compositio Mathematica 157 (2021), 1653–1723.
- **LE19**. Daniel Le, [Multiplicity one for wildly ramified representations](https://arxiv.org/abs/1708.04582v2). arXiv:1708.04582v2; Algebra & Number Theory 13 (2019), 1807–1827.
- **LMS22**. Daniel Le, Stefano Morra and Benjamin Schraen, [Multiplicity one at full congruence level](https://arxiv.org/abs/1608.07987v3). arXiv:1608.07987v3; Journal of the Institute of Mathematics of Jussieu 21 (2022), 637–658.
- **BDJ10**. Kevin Buzzard, Fred Diamond and Frazer Jarvis, [On Serre's conjecture for mod ℓ Galois representations over totally real fields](https://arxiv.org/abs/0810.2106v5). arXiv:0810.2106v5; Duke Mathematical Journal 155 (2010), 105–161.
- **CEGGPS16**. Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin, [Patching and the p-adic local Langlands correspondence](https://arxiv.org/abs/1310.0831v5). arXiv:1310.0831v5 (1 July 2016); Cambridge Journal of Mathematics 4 (2016), 197–287.
- **HAM75**. Eloise Hamann, [On power-invariance](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf). Pacific Journal of Mathematics 61 (1975), no. 1, 153–159.
- **STACKS**. The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). online, accessed 2026-10-19.
- **BRE14**. Christophe Breuil, with an appendix by Lassina Dembélé, [Sur un problème de compatibilité local-global modulo p pour GL₂](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compamodp.pdf). Public author copy; Journal für die reine und angewandte Mathematik 692 (2014), 1–76; locators use the author-copy pagination.
