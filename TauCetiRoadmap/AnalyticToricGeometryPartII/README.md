# Roadmap: analytic toric geometry, part II — nonarchimedean models and perfectoid approximation

**Summary.** Starting from the finite-fan geometry of AnalyticToricGeometry, construct integral toric divisor modules and Cartier models, their nonarchimedean unit generic fibres, perfected power towers and the five tilting and étale-topos comparisons of Scholze Theorem 8.5. The end theorems identify prime-to-p torsion cohomology across the toric projection and approximate hypersurfaces and set-theoretic complete intersections by algebraic zero loci over any specified dense subfield of the tilt (SCH12, Proposition 8.6, Proposition 8.7 and Corollary 8.8, pp. 305–307; SCH12 line 2446, line 2458 and line 2496).

## Scope and ownership

AnalyticToricGeometry stops at algebraic and complex analytic geometry of finite regular fans. Its Layer 0, the algebraic supplier, and the pinned Tau Ceti toric modules own integral lattices, rational salient cones, primitive rays, dual semigroups, Gordan finite generation and the complex fan scheme. This Part II extends that direction to arbitrary coefficient rings for divisor modules and to nonarchimedean and perfectoid geometry; singular finite fans remain admitted wherever regularity is not stated. Classification of all toric varieties and Sumihiro's theorem are outside this fan-parametrized scope.

The following objects are already in the library or stated by their named suppliers and are not constructions of this roadmap: Mathlib's monoid algebras, continuous functions vanishing at infinity and bounded linear extension from a dense subspace; Tau Ceti's scheme Weil divisors, orders, linear equivalence and divisorial sheaves; its native adic-space category and open restrictions; arbitrary-ring toric charts, ordinary face localization and finite-fan gluing in ShimuraCompactifications C0.9 and C0.16–C0.18; general analytification in AdicSpacesPartII R1; formal completion, generic fibres and section domains in AdicSpacesPartIII R2.2–R2.4, R2.8 and R2.10; perfected polydisc and Laurent algebras and homogeneous polydisc approximation in PerfectoidSpaces P1.30 and P2.1; and general tilting, tilde-limits, étale sites, cohomology, Chow groups and refined Gysin maps in the supplier sections below. The field-fibre, cone-algebra, homogeneous-cone, split-torus, operational-Chow, ample-cut and geometric-morphism extensions have the exact required supplier contracts below. Only the toric specialization, its character formulas and the comparisons on those actual spaces belong here. In particular, the power map extends the complex toric map to the common integral model and its completed tower; it does not introduce another monoid-algebra map.

The fixed smooth complete nonprojective threefold of Fujino–Sato is owned by WeilConjectures WC.6, “A smooth proper nonprojective threefold”, including its fan, integral model and fixed-fan Chow presentation. Here it is a Check of the general complete-fan comparison and hypersurface approximation, not another construction. The general operational Chow identification for every complete fan in §6.1 is broader than that fixed-fan presentation. SchemeAndStackFoundations owns the general operational and finite-orbit duality extensions in the contracts below; restricting §6.1 to regular fans would discard a theorem.

PerfectoidTowers P8.15 and P8.19 state, over ℂ_p, the Frobenius good tower of ℙ¹ and the two perfected-disc charts of its perfectoid limit, as Checks of their good-tower and analytic-separation theory. That is the ℙ¹-fan instance of §§2.1 and 3.2 over ℂ_p. This roadmap constructs the toric tower for every finite fan and every perfectoid K, builds no separate ℙ¹ instance, and records the agreement as a Check of §3.2.

AbelianSchemesAndArithmeticModuli §A2.7 owns `ampleIntersectionPositive`, the positivity of ample intersection numbers on nonempty closed subschemes proper over any field. Its specialization to repeated copies of H, summed over effective cycle components, supplies the positivity used in §§6.3–6.4.

DeligneWeightsAndPurityPartII consumes the natural toric projection, cohomology and approximation conclusions, and MixedHodgeModulesAndIrregularHodgeTheory the Layer 0 divisor sections. Neither supplies a prerequisite. Connectedness, geometric irreducibility and selecting a geometric component are not conclusions of the approximation theorems.

## Conventions

Let N be a finite free ℤ-module of rank n, let M=Homℤ(N,ℤ), and use the integral-lattice and finite-fan carriers of the parent. The fan Σ is a nonempty finite rational strongly convex fan in Nℝ. Strong convexity means that a cone contains no line; merely containing zero is insufficient. The rank-zero fan containing only the zero cone is allowed. Empty fans have empty realizations but are excluded from the nonempty geometric targets. Regular means that each cone's primitive ray generators extend to an integral basis; complete means support Nℝ; projective is a separate condition.

For primitive ray vectors vᵢ and integer coefficients aᵢ write D=ΣᵢaᵢDᵢ. Fix div(χᵘ)=Σᵢ⟨u,vᵢ⟩Dᵢ and section-generator weights ⟨mσ,vᵢ⟩=−aᵢ on σ. A rational function regarded as a local equation for D has the opposite weight −mσ. On ℙ¹, with the positive ray at zero and the negative ray at infinity, div(t)=D₊−D₋, W(dD₋)={u∈ℤ:0≤u≤d}, and the frames 1,tᵈ have first-to-second ratio t⁻ᵈ. These computations fix all three signs (SCH12, Definition/Proposition 8.4, p. 304; FS94, equation (2.3), p. 7; SCH12 line 2381; FS94 line 235).

A is any commutative unital ring, including the zero ring and rings with nilpotents. Weil terminology uses only normal field fibres. Character modules over A need neither normality nor noetherianity of A; a Cartier interpretation requires Cartier data. A regular fan makes every integer invariant divisor Cartier. Multiplication of sections is convolution, with source S(D)×S(E) and target S(D+E); it is not multiplication of coefficient functions at the same weight.

K is a complete field with a nontrivial rank-one nonarchimedean valuation, valuation ring K°, and pseudouniformizer ϖ, so 0<|ϖ|<1. A perfectoid statement is one in which K is moreover a perfectoid field: of residue characteristic p>0, with nondiscrete rank-one valuation, and with Frobenius surjective on K°/p (SCH12, Definition 3.1, p. 263; SCH12 line 726). Such a statement fixes the tilt K♭ and ϖ♭ with ϖ=(ϖ♭)♯ and ϖᵖ dividing p in K°; in characteristic p this divisibility is automatic. §§2.1, 2.2, 2.4, 3.1–3.7, 4.1–4.2, 5.2–5.3 and 6.4 are perfectoid statements; Layers 0–1, §2.3, §5.1 and §§6.1–6.3 need no perfectoid hypothesis. K=ℚ_p is a complete rank-one field that is not perfectoid: its valuation is discrete, so it has no tilt. In purely combinatorial statements p is any fixed prime; in a perfectoid statement it is the residue characteristic of K. ℤ[1/p] and M[1/p] invert p alone, not all primes. For p=2, 1/2 belongs to ℤ[1/p] and 1/3 does not. For a threshold c=a/b≥0, b>0, read |f|≤|ϖ|ᶜ as |f|ᵇ≤|ϖ|ᵃ in each point's ordered value group. No real-valued restriction is put on adic points. The error factor |ϖ|^(1−ε) is <1 when 0<ε<1 (SCH12, Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 1752).

All completed character modules use the coefficient Gauss norm and c₀ support: above each positive norm threshold only finitely many coefficients remain. The index sets have discrete topology. Write AΣ,K for the formal unit model's generic fibre, TΣ,K for its perfectoid power tower and XΣ,Kᵃⁿ for full analytification. A single positive ray gives a closed unit disc for AΣ,K, while XΣ,Kᵃⁿ is the full affine line. The zero cone in rank one gives the unit torus |t|=1, not all of the analytic multiplicative group (SCH12 line 2391).

π goes from |AΣ,K♭| to |AΣ,K| and from the tilted étale topos to the untilted one. Its inverse-image map on cohomology goes in the reverse direction. Sharp is multiplicative and preserves 0 and 1; additivity is not assumed. For mixed characteristic with p=2, 1+1=0 in K♭ but 1♯+1♯=2≠0 in K. For equal characteristic p the canonical identification with the tilt makes sharp the identity. Thus no morphism of cross-characteristic locally ringed spaces is implicit (SCH12, §1, pp. 249–250 and Theorem 8.5, p. 305; SCH12 line 2428).

Coefficient cohomology is constant Λ=ℤ/ℓᵐ with ℓ prime, ℓ≠p and m≥1, unless stated otherwise; i≥0 is a cohomological degree and negative degrees vanish. No ℤℓ conclusion is inferred by suppressing a derived inverse limit. All small objects and sites are taken in a fixed Grothendieck universe containing N, the coefficient fields and the chosen chart cover; sheaf and topos categories use the next universe. No cardinal bound on the mathematical field is imposed.

## Exact supplier contracts

### From Mathlib

Use `PointedCone` and `ConvexCone.Salient` on the parent's lattice, `Finsupp` for finite character sums, `AddMonoidAlgebra` for convolution, and `ZeroAtInftyContinuousMap` for c₀ on a discrete index set. The monoid algebra definition and coefficient operations are in `Mathlib/Algebra/MonoidAlgebra/Defs.lean`; `MonoidAlgebra.mapDomainRingHom` in `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean` supplies functorial exponent change after applying `Multiplicative`. The vanishing-at-infinity carrier in `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean` is a continuous map tending to zero along the cocompact filter; discreteness, a norm and convolution are not fields of that carrier. For bounded linear extension use `LinearMap.extendOfNorm`, `LinearMap.extendOfNorm_eq`, `LinearMap.norm_extendOfNorm_apply_le` and `LinearMap.extendOfNorm_unique` in `Mathlib/Analysis/Normed/Operator/Extend.lean`: the map from the finite-support span has dense range in its c₀ completion, the bound is measured through that map, and the target is a complete normed K-module. Use Mathlib's native scheme, module, tensor-product and category-of-sheaves carriers. None of these interfaces assumes coefficient rings are reduced. `AlgebraicGeometry.Smooth` in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` asks that the ring map of every pair of affine opens be smooth; its ring-homomorphism property makes it local on the source. In `Mathlib/RingTheory/Smooth/Basic.lean`, `Algebra.Smooth` is formal smoothness with finite presentation, `Algebra.instFormallySmoothMvPolynomial` gives formal smoothness of polynomial algebras, `Algebra.Smooth.of_isLocalization_Away` gives smoothness of a localization at one element and `Algebra.Smooth.comp` composes; together they make R[x₁,…,x_r,y₁^(±1),…,y_s^(±1)] smooth over every commutative ring R.

### From Tau Ceti

Use `TauCeti.Toric.Fan` in `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean`, `TauCeti.Toric.IsToricCone` in `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean`, `TauCeti.Toric.primitiveGenerator` in `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean`, `TauCeti.Toric.dualSemigroup` in `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Basic.lean`, and `TauCeti.Toric.IsToricCone.fg_dualSemigroup` in `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.lean`. The latter requires an integral lattice; salience is an explicit part of the cone predicate. `TauCeti.Toric.Fan.algebraicRealization` in `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean` is the complex comparison object.

Use `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`, the integer finitely supported functions on codimension-one points, and `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean`, requiring an integral noetherian scheme. `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean` requires an integral locally noetherian scheme and discrete valuation rings at every codimension-one stalk. Apply it to normal field fibres; it is not a valuation-ring-model sheaf constructor without those hypotheses. The native `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.nonempty_iso_sheaf_of_linearlyEquivalent` in the same sheaf module transports linear equivalence to an isomorphism of divisor sheaves; besides the hypotheses of `sheaf` it requires `IsNoetherian X` (quasi-compact and locally noetherian), the hypothesis under which the order system `ofScheme` defines linear equivalence. Every field fibre XΣ,k of a finite fan satisfies it, being covered by the finitely many spectra of the finitely generated k-algebras k[P_σ].

The carrier for geometric constructions is `TauCeti.AdicSpace`, with `TauCeti.PreAdicSpace.isAdic` and `TauCeti.PreAdicSpace.isAdic_restrict`, in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`. Being adic means sheafy and locally affinoid; it does not assert properness, smoothness or the toric origin of a space.

### From TauCetiRoadmap.AnalyticToricGeometry

Layer 0, “the algebraic supplier”, supplies dual semigroups, face localization, fans and primitive rays on the pinned toric carriers. Its complex scheme and toric-map comparison fix the complex specialization of the common integral model. In particular, its regular-coordinate theorem identifies a regular cone monoid with the product of a free positive monoid and a lattice. No complex manifold or general complex analytification is needed by this roadmap.

### From TauCetiRoadmap.ShimuraCompactifications

C0.1 and C0.4–C0.5 supply the face projections, off-face ideals and stratum quotient algebras of closed strata, and C0.6–C0.7 their coefficient change; C0.9 supplies face open immersions by inverting an exposing character; C0.16 supplies the finite-fan scheme over every commutative ring, its stratum ideals, torus action and coherent arbitrary coefficient change. C0.17 supplies the properness criterion: for the complete fan the structure morphism is proper over every base. C0.18 supplies the regular boundary's integral chart description. C0.10 supplies, for a regular cone of dimension r in rank n and every commutative ring R, the chart isomorphism R[P_σ]≅R[x₁,…,x_r,y₁^(±1),…,y_(n−r)^(±1)]. With the C0.9 and C0.16 open charts and the Mathlib smoothness facts above, XΣ,R is therefore smooth over R for every regular finite fan Σ and every R, including K°; no further supplier statement is needed for this. Completeness is not replaced by projectivity and the coefficient ring may be K°.

What ShimuraCompactifications must provide (gap:toric-field-fibres): For every field k and every nonempty finite rational fan Σ, export that XΣ,k is normal and geometrically integral and that the ray orbit closures D_ρ are prime divisors with pairwise distinct codimension-one generic points, compatibly with the C0.16 chart gluing and with field extension.

### From TauCetiRoadmap.AdicSpaces and TauCetiRoadmap.AdicSpacesPartII

AdicSpaces §§2–5 supply affinoid spectra, rational opens, sheafiness where applicable, the adic-space carrier and open gluing. AdicSpacesPartII R0 supplies completed scalar extension and rational localization, with R0.19.1–R0.19.3 supplying constructible compactness and the pro-constructible subset calculus; R1 supplies analytification, its chart comparison and preservation of properness. Use the native adic category throughout.

### From TauCetiRoadmap.AdicSpacesPartIII

R2.2 supplies admissible formal schemes over an arbitrary complete rank-one valuation ring; R2.3 supplies generic fibres; R2.4 supplies tubes and specialization. R2.8, formal completion and the good-reduction locus, gives the open comparison to analytification and equality for a proper algebraic model. R2.10, fractional bounds and section domains, gives well-defined rational inequalities in integral line-bundle frames at all adic points. The toric model is flat by its monomial basis, so the nonnoetherian K° case uses these contracts rather than noetherian formal GAGA.

### From TauCetiRoadmap.PerfectoidSpaces

P1.30 supplies perfected Tate algebras. P2.1 supplies homogeneous approximation on perfected polydiscs; P2.2–P2.3 supply the tilting homeomorphism and perfectoid rational localization; P2.9–P2.12 supply affinoid and glued perfectoid spaces and tilting. P3.18 and P3.20 supply the perfectoid étale site and its tilting equivalence. P7.1–P7.3 define the chart-density and residue-field tilde-limit relations; P7.11 supplies the completed-colimit criterion through AdicSpacesPartII R0.20.1; P7.12 supplies rational restriction and gluing; P7.13 supplies characteristic-p perfection towers; P7.15 supplies conversion from chart-density to residue-field tilde-limits for qcqs locally noetherian analytic finite levels, the fibred-topos limit, inseparable-tower invariance and torsion-cohomology continuity. The completed-colimit input requires a common pseudouniformizer and compatible integral rings of definition, both furnished by the Gauss models here. Perfection is used on split toric charts with their coefficient-field twists identified.

What PerfectoidSpaces must provide (gap:perfected-cone-algebras): Extend perfected Tate algebras to coefficient-Gauss completions K⟨C∩L[1/p]⟩ for every rational polyhedral cone C in a finite-rank lattice L, including lineality, with their power-bounded plus rings, perfectoidness and monomial-compatible tilts.

What PerfectoidSpaces must provide (gap:homogeneous-cone-approximation): Extend the homogeneous sharp estimate of P2.1 from perfected polydiscs to the perfected rational cone algebras with a linear Z[1/p]-grading, for integral homogeneous f, rational c≥0 and ε∈Z[1/p] with 0<ε<1, preserving degree and the bound |f−g♯|≤|ϖ|^(1−ε) max(|f|,|ϖ|^c) when ϖ=(ϖ♭)♯ and ϖ^p divides p.

### From TauCetiRoadmap.PerfectoidTowers

P8.19 states, as its Check `PerfectoidSpace.goodTower_frobenius_P1`, that over ℂ_p the tower ℙ¹ ← ℙ¹ ← ⋯ with transition T↦Tᵖ is a good tower whose represented limit is the perfectoid projective line. P8.15 states, as `PerfectoidSpace.projectiveLine_perfectoid_charts`, that this limit has two perfected-disc charts covering it, with the perfected Laurent chart as their overlap. Only the ℙ¹ agreement Check of §3.2 uses them; the constructions of §§2.1 and 3.2 for an arbitrary fan and perfectoid K do not.

### From TauCetiRoadmap.AdicEtaleGeometry

A1.6 supplies the small étale site, its jointly surjective covering families and geometric-morphism functoriality; its generalized Yoneda-adic presentation agrees with the native strongly sheafy presentation on these charts. These sites, and not an invented toric site, enter the topos comparison. Perfected charts use the PerfectoidSpaces P3.18/P3.20 specialization.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§0.7, 0.17–0.18 and 4.13 supply dimension and regular-sequence facts, Cohen–Macaulay schemes, and generic cuts. §0.23a supplies étale topological invariance under every universal homeomorphism, and §0.29 supplies relative Frobenius with its actual twisted target and its universal-homeomorphism property. §§2.1–2.2 supply ordinary derived site cohomology and its pullback; §3.4 supplies divisor classes, Picard groups and divisor excision. The split-torus Laurent calculation needed with §3.4 has the exact extension below; choose a lattice basis before applying it. §§5.1–5.6 supply cycles modulo rational equivalence, proper pushforward, degree, first and higher Chern classes, refined Gysin maps and the smooth intersection product. The additional general statements needed by the toric application have these precise boundaries:

What SchemeAndStackFoundations must provide (gap:split-torus-divisors): Export that for every field k and finite free lattice M the split-torus ring k[M] is a Laurent polynomial unique factorization domain with units exactly aχᵘ for a∈k× and u∈M, and that its native Weil divisor class group is zero, compatibly with the divisor excision and Picard interfaces.

What SchemeAndStackFoundations must provide (gap:operational-chow-finite-orbits): Supply integral operational Chow groups, their product and evaluation on cycles, and the Kronecker isomorphism A^j(X)≅Hom(A_j(X),Z) for complete k-schemes with a split connected solvable group action and finitely many orbits, each k-isomorphic to a product of an affine space and a split torus, compatibly with field extension and the smooth intersection product.

What SchemeAndStackFoundations must provide (gap:ample-generic-cuts): For every infinite field k and projective k-scheme W of dimension d>0 with a fixed projective embedding, supply an m≥1 and a k-defined hypersurface in |O(m)| containing no top-dimensional geometric component of W, whose intersection with W is nonempty of dimension d−1.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§A2.7 `ampleIntersectionPositive` supplies (L₁⋯L_d·V)>0 for every field k, proper k-scheme X, nonempty d-dimensional closed subscheme V⊂X and ample line bundles L₁,…,L_d on X. For a nonzero effective pure d-dimensional cycle Σ_i m_i[V_i], apply it with all d bundles equal to H on each integral component V_i and add the positive integers m_i deg(c₁(H)^d∩[V_i]). This includes d=0 and inseparable residue fields; no geometric-integrality hypothesis is imposed (STACKS, Lemma 33.45.9, tag 0BEV, p. 104; STACKS line 4827).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§F.2.3 supplies smooth universal local acyclicity for finite lisse coefficients invertible on the base, including nonnoetherian bases, and coherent cospecialization under base change. For a smooth scheme over a strictly henselian valuation ring with separably closed fraction field, its constant Λ coefficients therefore satisfy RΨΛ≅Λ on the special fibre.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§1.1 supplies the ordinary derived cohomology of module and abelian sheaves, the constant-coefficient comparison and functorial pullback. §6.2 supplies the natural proper specialization RΓ(X_η,F)≅RΓ(X_s,RΨF) over a strictly henselian valuation ring with separably closed fraction field, and its valuation-base-change compatibility. §8.2, proper algebraic comparison, supplies the natural comparison between algebraic and analytic torsion cohomology for proper finite-type schemes; use its ℤ/ℓᵐ specialization and retain naturality for φₚ and field extension. The tower passage itself is PerfectoidSpaces P7.15, not a claim that analytic cohomology commutes with an arbitrary limit.

What ClassicalAdicEtaleCohomology must provide (gap:geometric-morphism-cup-pullback): Extend ordinary constant-torsion cohomology pullback and its coefficient-forgetting comparison to geometric morphisms of the adic étale topoi, with cup-product, identity, composition and field-base-change compatibility.

### From TauCetiRoadmap.WeilConjectures

WC.6, “A smooth proper nonprojective threefold”, supplies the Fujino–Sato Example 4.1 fan and integral model, its completeness, regularity, nonprojectivity and fixed-fan Chow presentation. The comparison in §1.2 and the approximation in §5.3 are applied to this same model.

## How to read the build

Layer 0 fixes divisor signs, integral character modules and the coefficient-independent Picard data. Layer 1 completes the integral fan model and relates its unit generic fibre to full analytification. Layer 2 forms the perfected charts and homogeneous divisor algebra. Layer 3 identifies their tilt, topological tower and étale topoi. Layer 4 transports finite prime-to-p torsion cohomology. Layer 5 turns homogeneous approximation into nonzero algebraic hypersurface equations over the specified dense field. Layer 6 computes intersection degrees by the fan and uses positive refined degree to obtain the complete-intersection endpoint. Each subsection states separately the inputs used by its statement and by the indicated proof route.

## Layer 0: invariant divisors and integral sections

### 0.1 Invariant toric divisors

On XΣ,k over a field k, let D_i be the reduced closure of the codimension-one orbit in U_(ρᵢ)=A¹×G_m^(rank N−1). Construct the injective homomorphism from integer ray coefficients to the native scheme Weil divisors, a↦Σ a_iD_i, and identify its image with invariant divisors. Over an arbitrary ring A, use the same monomial orbit ideals and Cartier data when available, without asserting that XΣ,A is normal or that these are prime Weil divisors. (SCH12, §8, Definition/Proposition 8.4, p. 304; SCH12 line 2381).

Here k is a field for the Weil-divisor interpretation.

One proof route is the following. Import XΣ,A, torus action and base change from ShimuraCompactifications C0.16, and orbit ideals with their stratum quotients and coefficient change from C0.1 and C0.4–C0.7. Use the normal geometrically integral field-fibre and codimension-one orbit properties of gap:toric-field-fibres; arbitrary-ring chart construction alone does not assert normality. Use the primitive ray chart to identify its boundary coordinate; take its closure and codimension-one generic point. Map ray Finsupp coefficients to the native SchemeWeilDivisor by the injective ray-point map; do not reconstruct the generic divisor carrier. (SCH12, §8, Definition/Proposition 8.4, p. 304; SCH12 line 2381).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, Definition/Proposition 8.4, p. 304; SCH12 line 2381).

- Map a finitely supported integer ray coefficient function to the sum of the associated native point divisors.
- The coefficient at D_i is a_i, and at a codimension-one point outside the ray boundary it is zero.
- Two invariant divisors agree exactly when their ray coefficients agree.
- For u∈M the character divisor has coefficient ⟨u,vᵢ⟩ at ray i.

**Checks.**

- For the ℙ¹ fan with rays +1 and −1, the character t has divisor D_+−D_−.
- For the zero-cone fan there are no boundary rays and the invariant divisor group is zero.
- On ℙ¹, 2D_+ differs from D_+; the coefficient is 2, not a reduced support indicator.
- On the positive-ray chart k[t], the closed orbit projection sends t to 0 and has quotient k. The open chart of the zero-cone face instead inverts t, giving k[t,t⁻¹]; these maps have different targets.

All ray identifications agree on overlaps; coefficients retain multiplicities.

*Needs:* ShimuraCompactifications C0.1, C0.4–C0.7 and C0.16; `TauCeti.Toric.primitiveGenerator`; `TauCeti.AlgebraicGeometry.SchemeWeilDivisor`; ShimuraCompactifications C0.16–C0.18, including gap:toric-field-fibres.

### 0.2 Divisor character weights

Define W_Σ(D)={u∈M : ⟨u,vᵢ⟩≥−a_i for every ray i}. For a single cone σ impose only its rays, obtaining W_σ(D). Each local W_σ(D) is a module over its dual monoid P_σ=σ∨∩M under addition; no such action on the global weight set by an individual chart monoid is asserted. They need not contain zero and need not be monoids. Local Cartier data m_σ satisfy ⟨mσ,vᵢ⟩=−a_i on the rays of σ, so W_σ(D)=m_σ+P_σ. (SCH12, §8, Definition/Proposition 8.4 and the integral-trivialization paragraph in the proof of Proposition 8.7, pp. 304, 306; SCH12 line 2386).

One proof route is the following. Pair the dual lattice with each primitive ray; use finite conjunctions of integral inequalities. On a regular cone extend its primitive rays to a lattice basis to construct m_σ. Translate the inequalities by m_σ; keep the negative coefficient sign. (SCH12, §8, Definition/Proposition 8.4 and the integral-trivialization paragraph in the proof of Proposition 8.7, pp. 304, 306; SCH12 line 2386).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, Definition/Proposition 8.4 and the integral-trivialization paragraph in the proof of Proposition 8.7, pp. 304, 306; SCH12 line 2386).

- The subset of M cut out by all ray inequalities for D.
- Membership is equivalent to ⟨u,vᵢ⟩+a_i≥0 for every i.
- W(D+div χ^m)=W(D)−m.
- u∈W(D) and w∈W(E) imply u+w∈W(D+E).

**Checks.**

- For ℙ¹ and D=dD_−, W(D) is exactly the integers 0≤u≤d.
- For ℙ¹ with D=−D_−, W(D) is empty.
- For the zero-cone fan and D=0, W(D)=M, not {0}.

No effectivity or ampleness assumption is built into W_Σ(D).

*Needs:* AnalyticToricGeometry Layer 0; §0.1.

### 0.3 Monomial divisor sections

For every commutative ring A, define the A-module S_A(D)=⊕_(u∈W_Σ(D)) Aχ^u inside A[M]. On cone charts use S_(A,σ)(D) indexed by W_σ(D), with the dual-monoid action and face restrictions, and glue their associated modules. When D is Cartier these give O(D) on XΣ,A; over a normal field fibre for an arbitrary invariant Weil divisor they agree with the native divisorial sheaf. Global sections identify with S_A(D). Multiplication maps S_A(D)⊗_A S_A(E)→S_A(D+E); they are not asserted isomorphisms. (SCH12, §8, Definition/Proposition 8.4, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2386 and line 2477).

Here A is any commutative ring; Cartier is required for the line-bundle interpretation.

One proof route is the following. Work in the native additive monoid algebra A[M], with finite support in W(D). Localize the character modules along the ordinary face maps supplied by ShimuraCompactifications C0.9 and C0.16. Intersect the local character support conditions in A[M]; monomial independence gives exactly W_Σ(D), even for rings with nilpotents. For a normal finite-type toric field fibre, codimension-one stalks are DVRs. Supply these native sheaf hypotheses, then identify the module with SchemeWeilDivisor.sheaf using the character orders along D_i. (SCH12, §8, Definition/Proposition 8.4, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2386 and line 2477).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, Definition/Proposition 8.4, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2386 and line 2477).

- The support-constrained A-submodule of A[M].
- For u∈W(D), χ^u is a basis element.
- Two sections agree iff all character coefficients agree.
- Coefficient change acts on each monomial coefficient and satisfies identity and composition; it induces the tensor base-change isomorphism.
- Convolution multiplication sends S_A(D)×S_A(E) to S_A(D+E), associatively and with the unit in S_A(0).

**Checks.**

- For ℙ¹ and d≥0 the sections of O(dD_−) identify with A^(d+1), on the monomials 1,t,…,tᵈ; when A is nonzero their rank is d+1. This also distinguishes a negative-degree zero module from the constant section module.
- For A=k[ε]/ε² and D=0 on ℙ¹, S_A(0)=A, including its nonzero nilpotent ε.
- For the zero coefficient ring, every divisor section module is zero.

Arbitrary coefficient change A→B gives B⊗_A S_A(D)≅S_B(D); singular charts do not silently make O(D) invertible.

*Needs:* §0.2; ShimuraCompactifications C0.9 and C0.16; `AddMonoidAlgebra`; `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf`.

### 0.4 Invariant divisor representatives

Every Weil divisor on XΣ,k for a field k is linearly equivalent to an invariant divisor. In particular, on a regular fan every effective Cartier hypersurface Y has O(Y)≅O(D) for an integer invariant D and an equation f∈S_k(D) whose zero scheme is Y, with its original multiplicity. (SCH12, §8, Definition/Proposition 8.4 and start of proof of Proposition 8.7, pp. 304, 306; SCH12 line 2384 and line 2461).

Here k is a field; regularity is required only to make all invariant divisors Cartier.

One proof route is the following. Restrict the divisor to the dense split torus Spec k[M]. Choose a lattice basis: k[M] is a Laurent polynomial UFD, so the restricted divisor is principal. Subtract that principal divisor. Its remaining support lies in the ray boundary, giving integer coefficients D. Transport the defining section through the induced invertible-sheaf isomorphism; this does not replace the equation by its squarefree part. (SCH12, §8, Definition/Proposition 8.4 and start of proof of Proposition 8.7, pp. 304, 306; SCH12 line 2384 and line 2461).

**Checks.**

- On the affine line the Cartier equation x² has vanishing order 2 at zero; passing to the invariant representative keeps 2, whereas taking the reduced support would give 1.
- On the split rank-one torus, div(t)=0 because t is a unit, so its restricted divisor class is zero; this uses the torus, not the compactification.
- On ℙ¹, the divisor of t−a for a≠0 is [a]−D₋, so [a] is equivalent to D₋, not to the zero divisor.

*Needs:* §0.1; §0.3; `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`; SchemeAndStackFoundations §§0.7, 0.17–0.18, 3.4 and 4.13, including gap:split-torus-divisors.

### 0.5 Integral toric line bundles

For a regular fan and integer D, construct O(D) on XΣ,A for every commutative ring A using local generators χ^(m_σ), where ⟨mσ,vᵢ⟩=−a_i for rays in σ. On overlaps the ratio χ^(m_σ−m_τ) is a unit. Specialize A=K° and complete to obtain the tautological integral line bundle whose generic fibre is O(D). Changes of integral generator have valuation one at every generic-fibre point, since both the unit and its inverse are integral. The model, rather than the generic line bundle alone, fixes section bounds. (SCH12, §8, proof of Proposition 8.7, p. 306; SCH12 line 2477).

One proof route is the following. Use the regular-cone lattice basis to solve the Cartier equations. Translate S_(A,σ)(D) by m_σ to a free rank-one A[P_σ]-module. Use ordinary face localization to verify transition units and the triple-overlap cocycle. Import admissible completion and generic-fibre functor from AdicSpacesPartIII R2.2–R2.3; use R2.10 section-valuation domains. (SCH12, §8, proof of Proposition 8.7, p. 306; SCH12 line 2477).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, proof of Proposition 8.7, p. 306; SCH12 line 2477).

- Build the character trivializations and their integral invertible sheaf for a Cartier divisor.
- On σ the generator has character weight m_σ satisfying the negative coefficient equations.
- The overlap transition is χ^(m_σ−m_τ); transition products telescope on triple overlaps.
- The sheaf and character generators commute with arbitrary coefficient change.
- Integral change of frame preserves section valuation because the transition and its inverse are bounded by one.

**Checks.**

- For O(dD_−) on ℙ¹, the two chart generators have weights 0 and d; the transition is t^(−d) in the first-to-second convention.
- D=0 admits weight-zero generators and the trivial integral line bundle.
- Replacing a section f by cf scales its bound by |c|; the same radius gives the same locus for |c|=1, but this is false for arbitrary c∈K×.

K° is not assumed noetherian or discretely valued.

*Needs:* §0.3; AdicSpacesPartIII R2.2; AdicSpacesPartIII R2.10.

### 0.6 Toric divisor class relations

For XΣ,k over any field, the invariant-divisor map induces the presentation M→ℤ^(Σ(1))→Cl(XΣ,k)→0, with the first map u↦(⟨u,vᵢ⟩)_i. An invariant divisor is principal exactly when its coefficient vector is the character-divisor vector of some u∈M. The first map need not be injective for an incomplete fan. Thus the presentation canonically identifies class groups across coefficient fields, using the same fan. For regular Σ it also identifies Pic with this class group. When Σ is complete and regular, a full-dimensional regular cone gives an identity minor for the character map; the quotient is free abelian, so no nonzero divisor class is killed by a positive integer. (SCH12, §8, Definition/Proposition 8.4 and its use in Proposition 8.7, pp. 304, 306; FS94, Corollary 2.4 and proof, p. 7; SCH12 line 2384; FS94 line 230).

Here k is a field; regularity is required for Pic=Cl. Completeness and regularity are both required for the asserted free quotient.

One proof route is the following. Use the invariant-representative theorem for surjectivity onto the class group. If an invariant divisor equals div(f), then f has no torus zeros or poles. The Laurent polynomial UFD identifies f|_T as a unit aχ^u, so its ray coefficients equal ⟨u,vᵢ⟩. The character divisor gives the converse. The resulting integer presentation uses no coefficient-field data. For regular Σ every Weil divisor is Cartier; on a complete regular fan choose a full-dimensional cone whose primitive rays form a lattice basis, making the map split with free cokernel. (SCH12, §8, Definition/Proposition 8.4 and its use in Proposition 8.7, pp. 304, 306; FS94, Corollary 2.4 and proof, p. 7; SCH12 line 2384; FS94 line 230).

**Checks.**

- For ℙ¹ the character map is u↦(u,−u), and the quotient map is (a,b)↦a+b; its kernel is exactly the image and Pic=ℤ. A nonempty effective divisor of degree d≥1 has powered degree pᴺd>0 over either coefficient field, so its class cannot become zero.
- For the rank-one zero-cone fan there are no rays: the map ℤ→0 has kernel ℤ and the class group is zero, excluding injectivity without completeness.
- The incomplete regular fan with separate rays (1,0),(1,2) in ℤ² has character matrix with rows (1,0),(1,2), determinant 2 and cokernel ℤ/2; smoothness alone does not imply torsion-free Pic.

*Needs:* §0.4; §0.1; §0.5; `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`; SchemeAndStackFoundations §§0.7, 0.17–0.18, 3.4 and 4.13, including gap:split-torus-divisors.

### Examples

On ℙ¹, D=dD₋ gives the basis 1,t,…,tᵈ for d≥0, no sections for d<0, and character class map u↦(u,−u). Over k[ε]/ε² the degree-zero sections retain ε; over the zero ring the entire module is zero. The zero-cone rank-one fan has no boundary divisors and admits every Laurent character.

### Dependencies

Mathlib monoid algebras, modules and tensor products; Tau Ceti toric and Weil-divisor modules; AnalyticToricGeometry Layer 0; ShimuraCompactifications C0.1 and C0.4–C0.7 (orbit ideals, stratum quotients and their coefficient change), C0.9 and C0.16–C0.18; SchemeAndStackFoundations §3.4, gap:split-torus-divisors; AdicSpacesPartIII R2.2 and R2.10 for integral completion.

## Layer 1: unit toric formal generic fibres

### 1.1 Unit toric adic spaces

Define AΣ,K as the generic fibre of the ϖ-adic completion of XΣ,K°. For each cone σ its affinoid chart is Spa(K⟨P_σ⟩,K°⟨P_σ⟩), where P_σ=σ∨∩M and restricted sums use the coefficient supremum norm. A face τ⊂σ is the formal localization in a monomial χ^m, m∈P_σ∩τ⊥ exposing the face, and its generic-fibre chart is the rational unit locus |χ^m|=1. Glue these charts along the fan intersections. The plus subring is explicit and agrees with the integral closure of the model ring. (SCH12, §8, paragraph following Definition/Proposition 8.4, p. 304; SCH12 line 2391).

One proof route is the following. Import arbitrary-ring fan gluing and the ordinary algebraic face maps from ShimuraCompactifications C0.9 and C0.16. Complete the monoid chart K°[P_σ] ϖ-adically, then invert ϖ; Gordan finite generation supplies topological finite presentation. The coefficient Gauss norm on the restricted monoid algebra is multiplicative: use an order on the ambient lattice and leading terms in finite truncations. Its norm-at-most-one subring is K°⟨P_σ⟩, is integrally closed in the Banach algebra, and is the power-bounded subring. This justifies the stated plus ring, rather than assuming every formal model is normal. Use AdicSpacesPartIII R2 generic fibres of formal opens, which are completed localizations, to obtain rational unit overlaps. Use the native adic-space gluing for the finite compatible affinoid cover, with its structure and plus sheaves. (SCH12, §8, paragraph following Definition/Proposition 8.4, p. 304; SCH12 line 2391).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, paragraph following Definition/Proposition 8.4, p. 304; SCH12 line 2391).

- The glued adic space AΣ,K, with its structure and plus sheaves.
- Each σ has its named open affinoid embedding, and these images cover AΣ,K.
- The face embedding agrees with the rational unit localization of the monoid chart.
- Complete valued-field extension gives the corresponding base change of AΣ,K, preserving the chart cover and integral models.

**Checks.**

- For the positive ray fan in ℤ, AΣ,K=Spa(K⟨t⟩,K°⟨t⟩), the closed unit disc.
- For the zero-cone fan in ℤ, AΣ,K=Spa(K⟨t,t⁻¹⟩,K°⟨t,t⁻¹⟩) and |t|=1; it is not the full analytification of G_m.
- For the complete ℙ¹ fan, the two unit discs glued along |t|=1 give the whole ℙ¹ analytification.
- In the disc algebra, (1+ϖt)(1−ϖt)=1−ϖ²t² has Gauss norm 1, equal to 1·1; t has norm 1 and ϖ⁻¹ has norm >1, so the latter is excluded from the plus ring.

Do not replace a formal face overlap by the entire analytification of D(χ^m).

*Needs:* ShimuraCompactifications C0.9 and C0.16; AnalyticToricGeometry Layer 0; AdicSpacesPartIII R2.3; AdicSpacesPartIII R2.8.

### 1.2 Toric analytification comparison

The model comparison is an open embedding AΣ,K→(XΣ,K)ᵃⁿ; its image consists of points whose valued residue-field morphism extends to XΣ,K°. If Σ is complete, XΣ,K° is proper over K° and this map is an isomorphism. Regularity and projectivity are unnecessary. For incomplete fans no equality with analytification is asserted. (SCH12, §8, formal-generic-fibre paragraph, p. 304; FS25, Example 4.1, pp. 7–8; SCH12 line 2395).

One proof route is the following. Apply AdicSpacesPartIII R2 good-reduction-locus to the imported finite-type separated toric model. Use the complete-fan valuative properness criterion for XΣ,K° supplied by ShimuraCompactifications C0. Properness gives all valued points an integral extension, hence surjectivity of the comparison. (SCH12, §8, formal-generic-fibre paragraph, p. 304; FS25, Example 4.1, pp. 7–8; SCH12 line 2395).

**Checks.**

- For the positive ray, t=ϖ⁻¹ has |t|=|ϖ|⁻¹>1, so it belongs to full affine-line analytification and not the unit model.
- For the ℙ¹ fan, the charts |t|≤1 and |t⁻¹|≤1 cover, and their intersection is |t|=1; the comparison is onto without a choice of projective embedding.
- Apply the theorem to the fixed complete regular nonprojective fan of WeilConjectures WC.6: its unit model equals its full analytification although its ample support-function inequalities are inconsistent (FS25, Example 4.1, pp. 7–8; FS25 line 299 and line 318).

*Needs:* §1.1; AdicSpacesPartIII R2.8; ShimuraCompactifications C0.16; ShimuraCompactifications C0.17 (properness of the complete fan).

### 1.3 Toric power morphisms

For every integer q≥1, multiplication by q on M preserves each P_σ, gives χ^u↦χ^(qu), and glues to an endomorphism φ_q of XΣ,A, its formal model and AΣ,K. It commutes with coefficient change and preserves every toric stratum. Put φ=φ_p. In characteristic p this is relative Frobenius on characters with coefficients fixed; absolute Frobenius additionally acts on coefficients. (SCH12, §8, paragraph immediately preceding Theorem 8.5, p. 304; SCH12 line 2410).

One proof route is the following. Apply the native monoid-algebra map to u↦qu; retain fixed coefficients. Check compatibility with face localization and completion. Glue the compatible chart maps and specialize q=p. (SCH12, §8, paragraph immediately preceding Theorem 8.5, p. 304; SCH12 line 2410).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, paragraph immediately preceding Theorem 8.5, p. 304; SCH12 line 2410).

- The coefficient-linear endomorphism φ_q on a toric chart, glued to the toric model.
- φ_q*χ^u=χ^(qu) and φ_q*a=a.
- φ_1=id and φ_q∘φ_r=φ_(qr).
- φ_q*D=qD for invariant Cartier D; section weights multiply by q.

**Checks.**

- On ℙ¹, φ_p sends [x₀:x₁] to [x₀^p:x₁^p], preserving zero and infinity.
- q=1 fixes every monomial and coefficient.
- In characteristic p the coefficient-linear map fixes every a∈K; it does not send arbitrary a to a^p.
- On the positive ray, q=0 would send t to 1 and the origin to the point 1, so it would not preserve the zero stratum; the stratum-preservation statement needs q≥1.
- For p=2 and K=𝔽₄((s)), take a∈𝔽₄ with a²=a+1. The coefficient-linear map sends a to a, whereas absolute Frobenius sends it to a+1.

The tower uses φ_p, rather than a coefficient-changing absolute Frobenius over K.

*Needs:* ShimuraCompactifications C0.9 and C0.16; §1.1; `AddMonoidAlgebra`.

### Examples

The positive-ray chart is the unit disc, the zero-cone chart the unit torus, and the complete ℙ¹ fan glues two unit discs along their unit circle. The point ϖ⁻¹ distinguishes the full affine line from the unit disc. The complete nonprojective fixture from WeilConjectures WC.6 exercises properness without projectivity (FS25, Example 4.1, pp. 7–8; FS25 line 299).

### Dependencies

Layer 0; ShimuraCompactifications C0.16–C0.18; AdicSpaces §§2–5; AdicSpacesPartII R0–R1; AdicSpacesPartIII R2.2–R2.4 and R2.8; WeilConjectures WC.6 for the nonprojective Check.

## Layer 2: perfected charts and homogeneous divisor algebras

### 2.1 Perfectoid toric spaces

Let K be perfectoid and let P_σ[1/p] be the additive submonoid of M[1/p] consisting of u/p^n with u∈P_σ. Construct B_(σ,K)=K⟨P_σ[1/p]⟩ with plus ring K°⟨P_σ[1/p]⟩ and glue their Spa spectra by the perfected unit face localizations, obtaining TΣ,K. Each chart is perfectoid, and the glued space is perfectoid. Supply compatible maps pr_n:TΣ,K→AΣ,K, characterized by χ^u↦χ^(u/pⁿ). No regularity or completeness is required. (SCH12, §8, perfectoid-chart paragraph before Theorem 8.5, p. 304; Proposition 5.20, p. 280; SCH12 line 2400).

One proof route is the following. Use the PerfectoidSpaces perfected-cone-algebra contract, specialized to σ∨, for the Banach algebra, its plus ring, perfectoidness and monomial-compatible tilt. Perfect the face maps and use PerfectoidSpaces P2 rational localization and gluing. At each level the monomial embedding is u↦u/p^n, so φ∘prₙ₊₁=pr_n. (SCH12, §8, perfectoid-chart paragraph before Theorem 8.5, p. 304; Proposition 5.20, p. 280; SCH12 line 2400).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, perfectoid-chart paragraph before Theorem 8.5, p. 304; Proposition 5.20, p. 280; SCH12 line 2400).

- Glue the perfected chart spectra to TΣ,K.
- Its cone charts are the named perfected monoid spectra, with unit face overlaps.
- pr_n on a chart pulls χ^u back to χ^(u/pⁿ); φ∘prₙ₊₁=pr_n.
- Perfectoid valued-field extension and fan-compatible maps commute with the chart construction and projections.

**Checks.**

- For the positive ray, the chart algebra is K⟨t^(1/p^∞)⟩ with the usual Gauss plus ring.
- For the zero cone in ℤ, the algebra contains both t^(1/pⁿ) and their inverses; it is not the perfected disc algebra.
- For the rank-zero nonempty fan the space is Spa(K,K°) and every projection is the identity.
- For K=ℚ_p, which is complete but not perfectoid, the positive-ray chart algebra ℚ_p⟨t^(1/p^∞)⟩ has Gauss norms in p^ℤ, so no ϖ with |p|≤|ϖ|ᵖ<1 exists; the chart is not perfectoid and K has no tilt. The perfectoid hypothesis on K cannot be dropped.

*Needs:* §1.1; §1.3; PerfectoidSpaces P1.30 and P2.1–P2.12, gap:perfected-cone-algebras; PerfectoidSpaces P2.3; PerfectoidSpaces P2.9–P2.12.

### 2.2 Perfected divisor sections

Let K be perfectoid. For D=Σ a_iD_i with a_i∈ℤ[1/p], define W^p_Σ(D)={u∈M[1/p]:⟨u,vᵢ⟩≥−a_i}. Localize the character modules indexed by these sets and complete in the coefficient supremum norm; this defines the toric divisorial sheaf O_T(D) on TΣ,K. Its global sections are c₀(W^p_Σ(D),K): coefficient families with only finitely many coefficients of norm ≥ε for every ε>0. For regular Σ these are line bundles with perfected character frames. General fans retain divisorial modules; no unsupported invertibility on singular cones is asserted. (SCH12, §8, perfectoid divisor paragraph before Theorem 8.5, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2405).

Here coefficients may have p-power denominators; regularity is required for all O_T(D) to be invertible.

One proof route is the following. Extend the ray inequalities to M[1/p]. Identify finite-level character modules and clear a common p-power denominator to descend integral D. Complete the monomial span; finite support is dense, and compatible chart coefficients satisfy exactly the global ray bounds. Use Mathlib's bounded linear extension along the dense finite-support inclusion, then extend finite-support convolution continuously in each argument. For each output weight its coefficient is the convergent sum of products over input pairs adding to that weight; the ultrametric estimate gives norm at most the product of the input Gauss norms. On regular cones translate by the local perfected Cartier character and glue the resulting rank-one modules. (SCH12, §8, perfectoid divisor paragraph before Theorem 8.5, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2405).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, perfectoid divisor paragraph before Theorem 8.5, p. 304; proof of Proposition 8.7, p. 306; SCH12 line 2405).

- The Banach coefficient module c₀(W^p(D),K), with its chartwise divisorial-sheaf interpretation.
- Equality is coefficientwise and the norm is the supremum of coefficient norms.
- The finite-support monomial span is dense in the displayed toric section module.
- Convolution gives a bounded product Ŝ(D)×Ŝ(E)→Ŝ(D+E).
- For a finite-support section, choose a common p-power denominator pⁿ for both its character weights and the divisor coefficients. Its characteristic-p pⁿ power is then an algebraic section of O(pⁿD), with an integer divisor.
- For u∈W^p(D) and c∈K, cχ^u has coefficient c at u and zero at every other weight.
- For f∈Ŝ(D), g∈Ŝ(E) and z∈W^p(D+E), (f*g)_z=Σ_(u+w=z) f_u g_w, with the sum over pairs in W^p(D)×W^p(E). The family is summable: above any positive norm threshold only finitely many pairs contribute.
- (cχ^u)*(dχ^w)=(cd)χ^(u+w) in Ŝ(D+E), with the ray inequalities giving admissibility of u+w.
- The convolution Gauss norm satisfies ‖f*g‖≤‖f‖‖g‖.

**Checks.**

- For ℙ¹ and D=D_−, the coefficient index is ℤ[1/p]∩[0,1], which includes every 1/p^n.
- For a complete fan and D=0 the module is K, since only the zero weight is allowed.
- For ℙ¹ and D=D_−, the family with coefficient 1 at every admissible weight is not a section: it fails the c₀ condition.
- On ℙ¹ with D=D₋, multiply the monomials of weights 0 and 1. The result in Ŝ(2D) has coefficient 1 at weight 1; pointwise multiplication of their disjoint coefficient supports would give zero.
- At distinct weights 1/pⁿ, the coefficients ϖⁿ define a c₀ section with infinitely many nonzero terms, whose truncation error is at most |ϖ|^(N+1). The identity from the finite-support span to itself cannot extend continuously with values in that incomplete span; the target of the bounded extension theorem must be complete.
- For p=2 and D=(1/4)D₋, a weight-zero section already has integral character weight, but one squaring leaves divisor (1/2)D₋. Two squarings give the integer divisor D₋; clearing weights alone would miss the divisor denominator.

*Needs:* §0.2; §0.5; §2.1; `ZeroAtInftyContinuousMap`; Mathlib bounded linear extension from the supplier contract.

### 2.3 Graded divisor cones

Define the rational polyhedral cone C_D={(u,j)∈Mℝ×ℝ : ⟨u,vᵢ⟩+j a_i≥0 for all rays i}, for integer invariant D. Let Q_D=C_D∩(M[1/p]×ℤ[1/p]), an additive monoid, graded by (u,j)↦j. Its degree-j fibre is W^p_Σ(jD)={u∈M[1/p]:⟨u,vᵢ⟩+j a_i≥0 for every ray i}; this is a lattice subset without a coefficient field. If Σ is complete, Q_D in degree zero consists solely of (0,0). Negative degrees remain part of the definition; when D is effective their nonzero fibres can vanish, but no positive-degree truncation is silently substituted. (SCH12, §8, graded ring in the proof of Proposition 8.7, p. 306; SCH12 line 2463).

One proof route is the following. Use the simultaneous homogeneous linear inequalities in Mℝ×R. Check addition, p-divisibility and the grading. For complete Σ, the rays generate Nℝ as a cone; a linear functional nonnegative on every cone and its opposite is zero. (SCH12, §8, graded ring in the proof of Proposition 8.7, p. 306; SCH12 line 2463).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, graded ring in the proof of Proposition 8.7, p. 306; SCH12 line 2463).

- The homogeneous ray-inequality cone C_D and its perfected lattice monoid Q_D.
- The grading sends (u,j) to j and its fibre is the weight set of jD.
- Q_D is closed under addition and division by p.
- For D′=D+div χ^m, (u,j)↦(u−jm,j) identifies Q_D with Q_D′ and preserves degrees.

**Checks.**

- For ℙ¹ and D=D_−, Q_D consists of p-local rational pairs with 0≤u≤j.
- For a complete fan and D=0, Q_D={0}×ℤ[1/p], with negative degrees present.
- For the positive-ray fan and D=0, degree zero contains every nonnegative p-local weight, so its completed algebra is not K.

*Needs:* §0.2; AnalyticToricGeometry Layer 0.

### 2.4 Graded divisor algebras

Let K be perfectoid. For integer D form R_D as the coefficient-Gauss completion of the finite-degree direct sum over j∈ℤ[1/p] of H⁰(TΣ,K,O_T(jD)); use convolution products and the integral coefficient lattice. Identify it isometrically with the PerfectoidSpaces cone algebra K⟨Q_D⟩, with homogeneous degree-j subspace c₀(W^p(jD),K). Thus R_D is perfectoid and R_D♭≅K♭⟨Q_D⟩, monomial compatibly. The completed grading is a c₀ direct sum, not a product, and sharp preserves homogeneous degrees; no additivity is assumed. For every Σ, R_D with this grading satisfies the hypotheses of the PerfectoidSpaces P2.1 homogeneous-cone contract; when Σ is complete its degree-zero part is K. (SCH12, §8, proof of Proposition 8.7, p. 306; Proposition 5.20, p. 280; Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 2463).

One proof route is the following. Send the degree-j monomial χ^u to the monomial χ^(u,j) of Q_D. Check products and the integral coefficient lattices; complete the isometric monomial identification. Import perfected-cone perfectoidness/tilt from PerfectoidSpaces P2, rather than reproduce its Frobenius proof. The monomial identification carries the j-grading to a linear ℤ[1/p]-grading of K⟨Q_D⟩, as the homogeneous-cone contract requires; for complete Σ the divisor-cone calculation of §2.3 gives degree-zero part K. The estimate itself is applied in §5.2. (SCH12, §8, proof of Proposition 8.7, p. 306; Proposition 5.20, p. 280; Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 2463).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, proof of Proposition 8.7, p. 306; Proposition 5.20, p. 280; Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 2463).

- The PerfectoidSpaces cone algebra indexed by Q_D, identified with the completed graded section sum.
- Degree-j elements have coefficients only at Q_D weights of grading j.
- The degree-j piece is isometrically Ŝ(jD), and products add degrees.
- The tilt has the same perfected monomial cone over K♭, with sharp preserving a homogeneous degree.
- For complete Σ the degree-zero piece is exactly K.
- For z=(u,j)∈Q_D and c∈K, cχ^z is the singleton coefficient family of degree j.
- The named convolution operation has coefficient (f*g)_z=Σ_(x+y=z) f_x g_y, with the sum converging by the c₀ condition. It is defined by extension of finite-support monoid-algebra multiplication, and its norm is at most ‖f‖‖g‖.
- (cχ^(u,j))*(dχ^(v,k))=(cd)χ^(u+v,j+k). This specifies both character multiplication and addition of homogeneous degrees.

**Checks.**

- For ℙ¹ with D=D_−, Q_D is the perfected two-generator cone under (u,j)↦(u,j−u), so R_D is K⟨s^(1/p^∞),t^(1/p^∞)⟩ graded by total degree.
- For D=0 on a complete fan, R_D=K⟨z^(±1/p^∞)⟩, not K; only its degree-zero piece is K.
- A coefficient-one family in infinitely many different degrees is excluded by the outer c₀ condition.
- For ℙ¹ and D=0, the monomials at (0,1) and (0,−1) multiply to the degree-zero monomial (0,0) with coefficient 1. Their pointwise coefficient product is zero.

No arbitrary completion topology or ordinary Proj construction replaces the Gauss completion.

*Needs:* §2.3; §2.2; PerfectoidSpaces P1.30 and P2.1–P2.12, gap:perfected-cone-algebras.

### Examples

For ℙ¹ and D=D₋, Q_D has 0≤u≤j; the map (u,j)↦(u,j−u) gives the perfected positive quadrant. For D=0 on any complete fan, Q_D={0}×ℤ[1/p], so the algebra is a perfected Laurent algebra whose degree-zero piece alone is K. Multiplying the degree 1 and degree −1 monomials gives 1.

### Dependencies

Layers 0–1; Mathlib c₀ carrier; PerfectoidSpaces P1.30, P2.1–P2.12 and the perfected-cone supplier contract. General cone perfectoidness is a supplier input, whereas the identification of Q_D is local work.

## Layer 3: the five toric comparisons

### 3.1 Toric tilting comparison

Let K be perfectoid. For every Σ, (TΣ,K)♭≅TΣ,K♭, preserving cone charts, plus rings, perfected characters and p-local divisor models. On a chart the tilted algebra is K♭⟨P_σ[1/p]⟩. This is an isomorphism of perfectoid spaces; it does not identify the unperfected K and K♭ toric spaces as ringed spaces. (SCH12, §8, Theorem 8.5(i) and proof, pp. 304–305; SCH12 line 2414).

One proof route is the following. Apply the PerfectoidSpaces P2 cone tilt and monomial correspondence chartwise. Use compatibility with rational unit face localization, then glue by the common fan cocycle. (SCH12, §8, Theorem 8.5(i) and proof, pp. 304–305; SCH12 line 2414).

**Checks.**

- The positive ray gives the perfected disc algebra K⟨t^(1/p∞)⟩ with tilt K♭⟨t^(1/p∞)⟩; both retain the noninvertible monomial t.
- The rank-one zero cone retains t^(1/pⁿ) and its inverse in both tilts, distinguishing the unit torus from the disc.
- In characteristic p, tilting the rank-zero chart Spa(K,K°) gives the same chart and the identity map, not a second choice of coefficient field.

*Needs:* §2.1; PerfectoidSpaces P2.9–P2.12; PerfectoidSpaces P1.30 and P2.1–P2.12, gap:perfected-cone-algebras.

### 3.2 Toric perfectoid tilde-limits

Let K be perfectoid. The compatible projections give TΣ,K ~ lim_(φ_p) AΣ,K. Here ~ is the PerfectoidSpaces P7 perfectoid tilde-limit, with both the homeomorphism of underlying spaces and dense finite-level functions on an affinoid cover. On cone charts the completed colimit of K⟨P_σ⟩ under u↦pu is K⟨P_σ[1/p]⟩. SCH12 Definition 7.14 is the weaker residue-field relation of PerfectoidSpaces P7.3, which follows here by P7.15 because the finite levels are qcqs and locally noetherian analytic. This is not a claim of a categorical inverse limit in all adic spaces. (SCH12, §8, Theorem 8.5(ii) and proof, p. 305; Definition 7.14 and Theorem 7.17, p. 302; SCH12 line 2422 and line 2317).

One proof route is the following. Use the shared pseudouniformizer and coefficient-Gauss integral lattices in PerfectoidSpaces P7.11, the completed-colimit theorem imported from AdicSpacesPartII R0.20.1. Identify the algebraic colimit by u at level n↦u/p^n; its image is dense in the perfected chart. The monomial embeddings are isometric, so membership in each ϖ^r integral lattice is detected at the originating level. Apply the PerfectoidSpaces P7.12 gluing theorem to the stable finite toric cover. (SCH12, §8, Theorem 8.5(ii) and proof, p. 305; Definition 7.14 and Theorem 7.17, p. 302; SCH12 line 2422 and line 2317).

**Checks.**

- At level n of the disc tower, the monomial t maps to t^(1/pⁿ). Its pullback to level n+1 is tᵖ, whose image is t^(p/p^(n+1))=t^(1/pⁿ). Reversing these exponents fails compatibility.
- The union of finite-level monomials contains every t^(a/pⁿ) with a≥0, and its finite sums are Gauss-dense; the nonvanishing coefficient-one infinite sum is excluded.
- In rank zero all stages are Spa(K,K°), every transition is the identity and the topological inverse limit is that same space.
- Over K=ℂ_p and the ℙ¹ fan, AΣ,K is (ℙ¹)ᵃⁿ by §1.2, and its φ_p-tower, with every level ℙ¹ and transition T↦Tᵖ as in the ℙ¹ Check of §1.3, is the Frobenius good tower of PerfectoidTowers P8.19. The ray charts K⟨t^(1/p^∞)⟩ and K⟨t^(−1/p^∞)⟩ of TΣ,K and their zero-cone overlap K⟨t^(±1/p^∞)⟩ are the two perfected-disc charts and the perfected Laurent overlap of PerfectoidTowers P8.15, and the two root coordinates multiply to 1 there. Identity transitions would instead give the constant ℙ¹ tower, which P8.19 records as not good in mixed characteristic.

*Needs:* §2.1; §1.3; PerfectoidSpaces P7.11 (completed-colimit criterion); AdicSpacesPartII R0.20.1; PerfectoidSpaces P7.12; PerfectoidSpaces P7.15 (residue-field conversion).

### 3.3 Toric inverse-limit homeomorphism

Let K be perfectoid. There is a canonical homeomorphism |AΣ,K♭|≅lim_(φ_p)|AΣ,K|, where the right side is the inverse limit of topological spaces. Use the characteristic-p perfection homeomorphism |TΣ,K♭|≅|AΣ,K♭|, the perfectoid tilting homeomorphism and the K tilde-limit. All cone restrictions and toric strata correspond. (SCH12, §8, Theorem 8.5(iii) and proof, p. 305; SCH12 line 2428).

One proof route is the following. In characteristic p φ_p has purely inseparable residue extensions and is a universal homeomorphism on each toric chart. Apply PerfectoidSpaces P7 perfection-tilde-limit and tilting preservation of underlying spaces. Compose with the K tilde-limit homeomorphism and glue. (SCH12, §8, Theorem 8.5(iii) and proof, p. 305; SCH12 line 2428).

**Checks.**

- A classical tilted torus coordinate x gives tower coordinates ((x^(1/pⁿ))♯)ₙ; the pth power of coordinate n+1 equals coordinate n by multiplicativity.
- For ℙ¹, x=0 gives the constant zero tower and x=∞ gives the constant infinity tower; no boundary stratum is exchanged.
- In characteristic p the tower (x^(1/pⁿ))ₙ projects to x at level zero and is uniquely recovered from x over the perfect field; there is no extra pth-root branch.

*Needs:* §3.1; §3.2; PerfectoidSpaces P7.13.

### 3.4 Toric tilting projections

Let K be perfectoid. Define π:|AΣ,K♭|→|AΣ,K| by the preceding homeomorphism followed by level-zero projection. On classical projective coordinates π([x₀:…:x_n])=[x₀♯:…:x_n♯]. On a monomial chart, the valuation of χᵘ after π agrees with that of the sharp of its perfected-character lift. π is continuous, surjective and compatible with the toric cover and strata. It comes with a morphism of étale topoi from the following comparison. No morphism of K/K♭ locally ringed spaces or additive sharp map is asserted. (SCH12, §8, sentence following Theorem 8.5, p. 305; §1, discussion after Theorem 1.13, pp. 249–250; SCH12 line 2428 and line 2443).

One proof route is the following. Compose the explicitly named topological comparison with evaluation at level zero. Surjectivity follows from characteristic-p perfection and existence of compatible tower lifts chartwise. For projective coordinates use multiplicativity of sharp to verify independence of the common nonzero scalar. Naturality in the field: base change along K→L carries the K-tower to the L-tower chartwise (the base-change APIs of §1.1 and §2.1) and commutes with tilting (functoriality of the PerfectoidSpaces P2 tilt) and with characteristic-p perfection, so the defining homeomorphisms and π commute with the base-change maps. (SCH12, §8, sentence following Theorem 8.5, p. 305; §1, discussion after Theorem 1.13, pp. 249–250; SCH12 line 2428 and line 2443).

The API records these facts, with the hypotheses of this subsection. (SCH12, §8, sentence following Theorem 8.5, p. 305; §1, discussion after Theorem 1.13, pp. 249–250; SCH12 line 2428 and line 2443).

- The level-zero continuous projection from the tilted unit toric space.
- On ℙⁿ classical points it is given by homogeneous coordinate sharp.
- π∘φ_p=φ_p∘π on underlying spaces.
- The inverse image of each toric stratum is the corresponding tilted stratum.
- For every open U the set V=π⁻¹(U) is open and carries the restricted topological map.
- For a continuous isometric embedding K→L of perfectoid fields, with induced K♭→L♭, the base-change maps AΣ,L♭→AΣ,K♭ and AΣ,L→AΣ,K intertwine π_L and π_K, and π_L⁻¹(U_L) is the preimage of π_K⁻¹(U) for every open U⊂AΣ,K. In particular a continuous automorphism σ of a completed algebraic closure C of K, with its tilt σ♭, commutes with π_C.

**Checks.**

- π fixes the zero and infinity strata of ℙ¹ and maps t to t♯ on tilted classical affine points.
- Multiplying all projective coordinates by λ multiplies their sharp images by λ♯, so the projective point is unchanged.
- For the line x₀+x₁+x₂=0 over mixed-characteristic K, finite-stage pullbacks under φₚⁿ have equations x₀^(pⁿ)+x₁^(pⁿ)+x₂^(pⁿ)=0 over K. Its π-preimage over K♭ is the locus x₀♯+x₁♯+x₂♯=0 on classical tilted points; it is not obtained by reading these sums as polynomial equations over K♭. With p=2, [1:1:0] satisfies the tilted linear equation but maps to a point whose coordinate sum is 2≠0 over K.
- For a perfectoid field K of characteristic p, the canonical identification with its tilt makes sharp additive. The preimage of the line x₀+x₁+x₂=0 is the corresponding tilted line. This is the control case for the mixed-characteristic non-example.

*Needs:* §3.3; §1.1; §2.1; PerfectoidSpaces P2.9–P2.12.

### 3.5 Toric étale topos comparison

Let K be perfectoid. The étale topos of AΣ,K♭ is the projective limit of the fibred diagram of étale topoi of AΣ,K under φ_p, with its level projections. Construct this as an equivalence with the sheaves on the finite-stage colimit étale site, not a pointwise limit of categories. The associated level-zero geometric morphism has underlying continuous map π. It respects finite étale objects, covering families and constant torsion coefficients. The equivalence and its level-zero geometric morphism are natural under continuous isometric embeddings of perfectoid fields. (SCH12, §8, Theorem 8.5(iv), p. 305; Theorem 7.17 and Corollary 7.19, pp. 302–303; SCH12 line 2430 and line 2335).

One proof route is the following. Convert the chart-dense tilde-limit to the residue-field tilde-limit using PerfectoidSpaces P7.15. Use PerfectoidSpaces P7.15 étale-topos comparison for the qcqs locally noetherian finite-level unit toric spaces. Identify the K♭ tower with its level-zero étale topos by inseparable-tower invariance, then use PerfectoidSpaces P3 site tilting. Naturality in the field: base change of the finite-stage étale sites along K→L commutes with the colimit-site construction, with PerfectoidSpaces P3 tilting and with the inseparable-tower equivalence; combine with the naturality of π. (SCH12, §8, Theorem 8.5(iv), p. 305; Theorem 7.17 and Corollary 7.19, pp. 302–303; SCH12 line 2430 and line 2335).

**Checks.**

- On the rank-zero algebraically closed perfectoid point, finite étale algebras are finite products of the coefficient field on both sides; the empty finite cover is the empty object.
- For a characteristic-p torus, adjoining t^(1/p) changes characters but is purely inseparable, and therefore creates no new finite étale covers; replacing this by a separable degree-p extension would give the wrong site.
- For the ℙⁿ fan, the comparison specializes to Scholze Theorem 1.13 (p. 249); it does not identify the unperfected ℙⁿ spaces as perfectoid spaces.

*Needs:* §3.2; §3.1; §3.4; PerfectoidSpaces P7.3; PerfectoidSpaces P7.15; PerfectoidSpaces P3.18 and P3.20; AdicEtaleGeometry A1.6.

### 3.6 Open toric topos restrictions

Let K be perfectoid. For every open U⊂AΣ,K, put V=π⁻¹(U)⊂AΣ,K♭. There is a geometric morphism Sh(V_ét)→Sh(U_ét), and its square with the inclusions in the two global étale topoi commutes up to the canonical natural isomorphism. It is obtained by restricting the tower to φ_p⁻ⁿ(U). U need not be φ-stable or quasicompact; arbitrary opens are covered by rational finite-stage opens. The squares are natural in the perfectoid field: base change along a continuous isometric embedding K→L carries the square for U to the square for U_L, so a continuous automorphism of a completed algebraic closure of K acts compatibly on both topoi. (SCH12, §8, Theorem 8.5(v), p. 305; Proposition 7.16, p. 302; SCH12 line 2433 and line 2324).

Here U is any open subset of the unit toric space.

One proof route is the following. Use PerfectoidSpaces P7 tilde-limit rational restriction and étale base change at each finite level. Tilt the restricted perfectoid opens using PerfectoidSpaces P2 open-subspace compatibility. Apply site descent on a rational cover to remove quasicompactness; the canonical isomorphisms give the commuting topos square. Naturality in the field follows from the naturality of π and of the étale-topos comparison under base change of the perfectoid field. (SCH12, §8, Theorem 8.5(v), p. 305; Proposition 7.16, p. 302; SCH12 line 2433 and line 2324).

**Checks.**

- For U=∅ the preimage V is ∅ and the restricted morphism is the unique morphism between the empty-space topoi; for U=AΣ,K it recovers the global projection.
- For U={|t−ϖ|≤|ϖ|²}, the point t=ϖ belongs to U, while |ϖᵖ−ϖ|=|ϖ|>|ϖ|² shows that φₚ(t) does not. Thus the finite-stage opens really are φₚ⁻ⁿ(U), and U need not be φₚ-stable.
- For the open complement of infinity in ℙ¹, φₚ⁻¹(∞)={∞}, so the restricted square has precisely the two affine-line complements; the direction remains V-étale to U-étale.

*Needs:* §3.5; PerfectoidSpaces P7.1–P7.3 and P7.12 (rational restriction); PerfectoidSpaces P7.1–P7.3 (base change); PerfectoidSpaces P2.10–P2.12; §3.4.

### 3.7 Affine-line sharp comparison

For every perfectoid K, the full affine-line comparison of Theorem 1.5 is: |(A¹_K♭)ᵃⁿ|≅lim_(t↦tᵖ)|(A¹_K)ᵃⁿ|. Derive it by applying the complete ℙ¹ comparison and restricting to the complement of infinity, which φ preserves and whose π-preimage is the corresponding complement. Its level-zero projection is sharp on classical affine points. The unit-disc version is only the positive-ray instance of Theorem 8.5 and is distinguished explicitly. (SCH12, §1, Theorem 1.5, p. 247; §8, Theorem 8.5(iii),(v), p. 305; SCH12 line 91).

One proof route is the following. Apply the complete-fan analytification comparison to ℙ¹. Use φ⁻¹(∞)={∞} and the matching tilted stratum under π. Restrict the global inverse-limit homeomorphism to the compatible open complements; equivalently all tower coordinates avoid infinity. (SCH12, §1, Theorem 1.5, p. 247; §8, Theorem 8.5(iii),(v), p. 305; SCH12 line 91).

**Checks.**

- The affine point t=ϖ⁻¹ has |t|>1 and is retained after deleting infinity; replacing the line by the closed unit disc would lose it.
- The compatible tilted point x gives ((x^(1/pⁿ))♯)ₙ in the full line, all of whose coordinates are finite; infinity has a constant infinity tower and is excluded.
- At x=0 the tower is constantly zero and the projection is zero; at x=1 the tower is constantly one, fixing the direction of the comparison.

*Needs:* §1.2; §3.3; §3.6; §3.4.

### Examples

A tilted classical coordinate x gives the compatible sequence ((x^(1/pⁿ))♯)ₙ. Zero, one and infinity give constant sequences. Deleting infinity from the ℙ¹ comparison gives the full affine line, including |t|>1. In mixed characteristic p=2 the coordinate sum of [1:1:0] is 0 before applying sharp and 2 afterward, so the linear equations cannot be transported additively.

### Dependencies

Layers 1–2; PerfectoidSpaces P2.2–P2.12, P3.18, P3.20, P7.1–P7.4, P7.11–P7.15; AdicSpacesPartII R0.20.1; AdicEtaleGeometry A1.6. The full affine-line application additionally uses §1.2. The ℙ¹ agreement Check of §3.2 compares with PerfectoidTowers P8.15 and P8.19.

## Layer 4: prime-to-p torsion cohomology

### 4.1 Power-map cohomology invariance

Let Σ be complete and regular, K algebraically closed perfectoid of residue characteristic p, ℓ≠p prime and m≥1. For every i≥0, φ_p* is an automorphism of H^i((XΣ,K)ᵃⁿ_ét,ℤ/ℓᵐ). Compare with the geometric special fibre of the common smooth proper K° toric scheme, where φ_p is a relative Frobenius and hence a universal homeomorphism. Invertibility is asserted, not identity: on H²(ℙ¹,ℤ/ℓᵐ(1)), it is multiplication by p. (SCH12, §8, Proposition 8.6 and proof, pp. 305–306; SCH12 line 2450).

Here Σ is complete; K is algebraically closed; ℓ is a prime different from p, m≥1.

One proof route is the following. Use ClassicalAdicEtaleCohomology §8.2 proper algebraic/analytic cohomology comparison. The valuation ring K° is strictly henselian and has algebraically closed fraction and residue fields. Apply ClassicalAdicEtaleCohomology §6.2 proper specialization RΓ(X_K,Λ)≅RΓ(X_κ,RΨΛ), then EtaleCohomologyFoundations §F.2.3 smooth universal local acyclicity to identify RΨΛ≅Λ. These comparisons are natural for φ_p and valuation-field extension; no noetherian hypothesis on K° is required. The special fibre XΣ,κ is the base change of XΣ,𝔽ₚ, so the canonical identification XΣ,κ⁽ᵖ⁾≅XΣ,κ turns the relative Frobenius over κ into the coefficient-linear φ_p. Relative Frobenius is a universal homeomorphism (SchemeAndStackFoundations §0.29), and pullback along a universal homeomorphism is an equivalence of étale topoi (SchemeAndStackFoundations §0.23a). Transport the automorphism back to the analytic generic fibre. (SCH12, §8, Proposition 8.6 and proof, pp. 305–306; SCH12 line 2450).

**Checks.**

- For ℙ¹ over K°, proper specialization and smooth ULA identify the generic and special fibre groups (H⁰,H¹,H²(Λ(1)))=(Λ,0,Λ), including for nondiscrete K°. On these groups, φₚ acts by 1, the unique map on 0, and p respectively. For p=2, ℓ=3, m=1, the last map sends 1 to 2, an automorphism distinct from the identity.
- In mixed characteristic, with ℓ=p the same top-degree map is multiplication by p on ℤ/p and hence zero, which is not an automorphism; the excluded coefficient range is essential.
- On the rank-zero algebraically closed point, H⁰=Λ and all positive-degree cohomology is zero, and the identity power map preserves this calculation.

*Needs:* §1.3; §1.2; ShimuraCompactifications C0.16; ShimuraCompactifications C0.10 with Mathlib `AlgebraicGeometry.Smooth` (smoothness of the regular K° model); ShimuraCompactifications C0.17 (properness of the complete fan); ClassicalAdicEtaleCohomology §8.2; ClassicalAdicEtaleCohomology §6.2; EtaleCohomologyFoundations §F.2.3; SchemeAndStackFoundations §0.29; SchemeAndStackFoundations §0.23a.

### 4.2 Toric torsion cohomology comparison

Under the preceding hypotheses, the level-zero geometric morphism associated with π induces π*:H^i((XΣ,K)ᵃⁿ_ét,ℤ/ℓᵐ)≅H^i((XΣ,K♭)ᵃⁿ_ét,ℤ/ℓᵐ) for every i≥0. It is natural under the named toric maps and under continuous isometric embeddings of algebraically closed perfectoid fields, so a continuous automorphism σ of K and its tilt σ♭ are intertwined by π*; it is compatible with cup products and constant-coefficient pullback. Negative cohomological degrees vanish. No ℤℓ comparison is asserted without a separate inverse-limit argument. (SCH12, §8, Proposition 8.6, pp. 305–306; SCH12 line 2446 and line 2344).

Here Σ complete; K algebraically closed; ℓ≠p prime; m≥1.

One proof route is the following. Use PerfectoidSpaces P7 cohomological continuity with constant torsion on the finite-stage tower. Identify the tilted topos with the tower-limit topos from Layer 3. All φ_p* transitions are isomorphisms by §4.1, so the map from level zero to their filtered colimit is an isomorphism. Cup compatibility is functoriality of inverse image of sheaves and derived cohomology, imported from ClassicalAdicEtaleCohomology §1.1. Naturality in the field: the étale-topos comparison and the ClassicalAdicEtaleCohomology §§6.2, 8.2 and EtaleCohomologyFoundations §F.2.3 comparisons are natural under base change of the field, so π* is equivariant for continuous automorphisms. (SCH12, §8, Proposition 8.6, pp. 305–306; SCH12 line 2446 and line 2344).

**Checks.**

- For ℙ¹ the comparison identifies Λ in degrees zero and two and 0 in degree one; the top class is transported, while the tower transitions multiply it by p.
- For p=2 and Λ=ℤ/3, the transition sequence on H² is 1↦2↦1↦2, so its colimit is Λ and the level-zero map is an isomorphism rather than a quotient by p−1.
- The cup product of the degree-zero unit with a top class is that same class on both sides; for a field automorphism the fixed toric hyperplane class maps to itself in twisted degree two.

*Needs:* §4.1; §3.5; PerfectoidSpaces P7.15; ClassicalAdicEtaleCohomology §1.1, gap:geometric-morphism-cup-pullback; ClassicalAdicEtaleCohomology §1.1 (derived direct image); ClassicalAdicEtaleCohomology §1.1 (coefficient-forgetting comparison); ClassicalAdicEtaleCohomology §§6.2, 8.2 and EtaleCohomologyFoundations §F.2.3 (field naturality).

### Examples

For p=2 and Λ=ℤ/3, the top cohomology transition of ℙ¹ is multiplication by 2 and is not the identity. Its iterates alternate 1 and 2 on the generator, while the direct limit is still Λ. In mixed characteristic, taking ℓ=p instead makes multiplication by p noninvertible and lies outside the theorem.

### Dependencies

§§1.2–1.3, 3.4–3.6; ShimuraCompactifications C0.10 and C0.16–C0.18; SchemeAndStackFoundations §§0.23a, 0.29; EtaleCohomologyFoundations §F.2.3; ClassicalAdicEtaleCohomology §§1.1, 6.2, 8.2 and gap:geometric-morphism-cup-pullback; PerfectoidSpaces P7.15.

## Layer 5: section tubes and hypersurface approximation

### 5.1 Toric section neighbourhoods

Let Σ be complete and regular and let f₁,…,f_s be finitely many nonzero sections of invariant integral Cartier models O(D₁),…,O(D_s), with nonempty common zero locus Y. Normalize each section into its tautological integral lattice by a scalar and fix those normalizations. For every open neighbourhood U of Yᵃⁿ, some rational c>0 makes the common section domain N_c(f₁,…,f_s)=∩_i{x:|f_i(x)|≤|ϖ(x)|^c} lie in U. It contains Yᵃⁿ and is a quasicompact open. The s=1 case is the hypersurface neighbourhood used in Proposition 8.7. For a fractional c=a/b use |f_i|^b≤|ϖ|^a; higher-rank points use their ordered valuation groups, not an imposed real-valued point norm. The domains are independent of integral frames, but depend on the chosen section scale and integral model. (SCH12, §8, proof of Proposition 8.7, p. 306; proof of Corollary 8.8, p. 307; SCH12 line 2475).

Here Σ complete; the family is finite and each f_i defines an effective Cartier hypersurface; U contains the full common adic zero locus.

One proof route is the following. Import AdicSpacesPartIII R2.10 section-valuation domains on the completed tautological line bundle and AdicSpacesPartII R0.19.1–R0.19.3 constructible compactness. Use finitely many integral toric charts and rational localization to express the zero-locus neighbourhoods. Each rational section domain is closed in the compact constructible topology, while the complement of U in Xᵃⁿ is constructibly closed and compact. Continuity of the point valuations makes the intersection over c of the common domains exactly Yᵃⁿ. The finite intersection property on the complement of U in Xᵃⁿ gives one common c for which the domain avoids that complement. For an integer r≥1, compare |f^r|≤|ϖ|^(rc); unchanged reduced zero locus does not imply unchanged radius. (SCH12, §8, proof of Proposition 8.7, p. 306; proof of Corollary 8.8, p. 307; SCH12 line 2475).

**Checks.**

- For f=t on the unit disc and c=1 the tube is |t|≤|ϖ|, contains t=0 and excludes t=1. The denominator ϖ is a nonzero unit in K.
- For f=t² the exponent 2c gives |t²|≤|ϖ|^(2c) exactly when |t|≤|ϖ|ᶜ; keeping exponent c would give the larger radius |ϖ|^(c/2).
- Replacing f by ϖf changes |f|≤|ϖ|ᶜ into |f|≤|ϖ|^(c−1), while multiplication by an integral unit leaves the domain unchanged. The empty equation family gives the whole space; with nonempty common zero locus its only neighbourhood is the whole space.

*Needs:* §0.5; §1.2; AdicSpacesPartIII R2.10; AdicSpacesPartII R0.19.1–R0.19.3 (constructible compactness).

### 5.2 Dense-field section approximation

Let K be perfectoid, Σ complete and regular, D integer invariant, f a nonzero integral degree-one section of R_D, and choose rational c≥0 and ε∈ℤ[1/p], 0<ε<1. The PerfectoidSpaces P2.1 homogeneous-cone estimate gives a degree-one g∈R_D♭° with |f−g♯|≤|ϖ^(1−ε)|max(|f|,|ϖ^c|) at every point of Spa(R_D,R_D°), and hence equality of the corresponding bounded maxima. Via integral chart frames this identifies the pulled-back toric section domains on TΣ,K♭, then on AΣ,K♭ using its perfection homeomorphism. For any dense subfield k₀⊂K♭, g can be replaced by a nonzero finite-support degree-one g₀ with coefficients in k₀ and uniformly smaller perturbation than the chosen threshold. If a common p^N clears its weight denominators, h=g₀^(pᴺ) is an algebraic section of O(p^N D) over k₀; its zero locus lies in the pulled-back section domain. (SCH12, §8, proof of Proposition 8.7, p. 306; Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 1752 and line 2482).

Here Σ complete; k₀ is a specified dense subfield, not necessarily perfect or algebraically closed. f≠0; this is the equation of an effective Cartier hypersurface in the application.

One proof route is the following. Use R_D=K⟨Q_D⟩ and its tilt K♭⟨Q_D⟩, with the grading by j. Choose a rational c′≥c with |ϖ|^(c′)<‖f‖ at the multiplicative Gauss valuation, and apply the PerfectoidSpaces P2 homogeneous-cone approximation contract at c′. The estimate implies g≠0 at that point, and also implies the required estimate at the original c. On each integral frame, map the graded cone algebra to the perfected chart by (u,j)↦u−jm_σ. This is a bounded monomial map, so the pointwise estimate restricts to the chart. Choose a nonzero coefficient of g. Finite support is Gauss-dense; retain that coefficient and approximate the retained coefficients by k₀ with error strictly below both |(ϖ♭)^c| and its nonzero norm (and below 1). The selected coefficient stays nonzero, the section stays integral, and nonarchimedean inequalities preserve the original truncated norm domain. Choose N clearing the finitely many p-denominators. In characteristic p, taking p^N powers raises coefficients and weights termwise; coefficients remain in k₀, even if k₀ is imperfect. Use the characteristic-p perfection homeomorphism to transfer vanishing and containment down to the algebraic hypersurface analytification. (SCH12, §8, proof of Proposition 8.7, p. 306; Lemma 6.5 and Remark 6.6, pp. 288–290; SCH12 line 1752 and line 2482).

**Checks.**

- For the exact monomial f=χᵘ of degree one, choose g=χᵘ; then |f−g♯|=0 and the two truncated maxima agree.
- For p=2 and f=ϖ²χᵘ at c=0 and ε=1/2, g=0 satisfies |ϖ|²≤|ϖ|^(1/2), so the coarse estimate does not force a nonzero equation. Taking c′>2 makes its Gauss-point right side |ϖ|^(5/2), which is strictly smaller than |ϖ|² and excludes g=0.
- On ℙ¹, g₀=a+b t^(1/p) with b≠0 is a degree-one perfected section of O(D₋). Its pth power is aᵖ+bᵖt in O(pD₋), not a scalar regular function on ℙ¹; the coefficients stay in k₀ without extracting roots.
- Retaining a coefficient b with approximation error <|b| gives |b′|=|b|>0, while truncating without that requirement could give the zero section.

*Needs:* §2.4; §2.2; §3.4; §5.1; PerfectoidSpaces P1.30 and P2.1–P2.12, gaps:perfected-cone-algebras and homogeneous-cone-approximation.

### 5.3 Toric hypersurface approximation

Let Σ be complete and regular, K perfectoid, Y⊂XΣ,K a nonempty effective Cartier hypersurface (possibly nonreduced), and U an open neighbourhood of Yᵃⁿ. For every specified dense subfield k₀⊂K♭ there is an algebraic hypersurface Z⊂XΣ,K♭, defined over k₀, with Zᵃⁿ⊂π⁻¹(U). For an invariant divisor representative D of Y, one may produce Z as the zero locus of a nonzero section of O(p^N D) for some N≥0. Projectivity and algebraic closedness are not hypotheses of this result. (SCH12, §8, Proposition 8.7 and proof, p. 306; §1, Lemma 1.16, p. 251; FS25, Example 4.1, pp. 7–8; SCH12 line 2458).

Here Σ complete; Y is a nonempty effective Cartier hypersurface; k₀⊂K♭ is dense.

One proof route is the following. Represent Y by f in an invariant O(D) using Layer 0. Choose an integral normalization and a section domain N_c(f)⊂U. Apply the preceding dense-field approximation and denominator-clearing theorem, then take the zero locus of h. The preceding character-lattice class presentation identifies Pic across K and K♭. Completeness and regularity make it torsion-free, and a nonempty effective divisor on the proper geometrically integral toric variety has nonzero class. Hence its class stays nonzero under p^N; a nowhere-vanishing section would trivialize it. Thus Z is a hypersurface, not an empty or whole-space zero locus. (SCH12, §8, Proposition 8.7 and proof, p. 306; §1, Lemma 1.16, p. 251; FS25, Example 4.1, pp. 7–8; SCH12 line 2458).

**Checks.**

- For a line on ℙ² the input class is O(1); the approximating equation has class O(pᴺ)≠O, so a nonzero equation has a nonempty proper zero locus.
- For the doubled divisor f²=0 the class is twice the original and the tube exponent scales by 2; replacing f² by its reduced equation without changing the threshold would alter the prescribed neighbourhood.
- Apply to an effective nonempty Cartier divisor on the smooth complete nonprojective threefold of WeilConjectures WC.6. The class is nonzero in its torsion-free Picard group and remains so after multiplying by pᴺ; projectivity is not needed (FS25, Example 4.1, pp. 7–8; FS25 line 299).
- On a rank-zero fan a nonzero section is a scalar on Spec K and has no nonempty Cartier zero locus; the nonempty-hypersurface hypothesis has no such input.

*Needs:* §0.4; §0.6; §5.1; §5.2.

### Examples

For f=t and c=1, the section tube has radius |ϖ|. The doubled equation t² requires threshold 2c to preserve this tube. A finite perfected section a+b t^(1/p) becomes aᵖ+bᵖt after one pth power, in O(pD₋); b≠0 ensures that the section is nonzero. These computations distinguish the line-bundle equation from a global regular function.

### Dependencies

§§0.3–0.6, 1.2, 2.2–2.4 and 3.4; AdicSpacesPartII R0.19.1–R0.19.3; AdicSpacesPartIII R2.10; PerfectoidSpaces P2.1 and the homogeneous-cone-approximation contract; no cohomology from Layer 4 is used by the approximation route.

## Layer 6: intersection degrees and complete-intersection approximation

### 6.1 Toric intersection weights

For a complete fan Σ of rank n, define MW^j(Σ) as the integer functions c on cones σ of codimension j satisfying the following balancing equations: for every cone τ of codimension j+1 and u in the annihilator M(τ), sum over σ⊃τ of ⟨u,nσ,τ⟩c(σ)=0, where n_(σ,τ) is the primitive positive generator of N_σ/N_τ and N_σ=N∩spanℝ σ. A basis of each M(τ) gives a finite integral relation matrix. Use the operational Chow group of the SchemeAndStackFoundations Layer 5 supplier contract and identify A^j(XΣ,k) with MW^j(Σ), by evaluation on the orbit closures V(σ). Cartier line bundles give degree-one weights: for adjacent maximal cones ρ,ρ′ with wall σ and local section weights m_ρ,m_ρ′, m_ρ′−m_ρ=c(σ)b_(ρ,σ), where b_(ρ,σ) is the primitive annihilator positive on ρ. (FS94, Proposition 1.1, p. 4; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7; FS94 line 117, line 176, line 198 and line 235).

Here Σ complete; 0≤j≤n; k is a field. Cartier data use the section-generator convention ⟨mρ,vᵢ⟩=−a_i. FS94's u(ρ) in equation (2.3) are local-equation weights, u(ρ)=−m_ρ. Thus its relation u(ρ)−u(ρ′)=c(σ)b_(ρ,σ) becomes m_ρ′−m_ρ=c(σ)b_(ρ,σ), with the positive ℙ¹ degree computed below (FS94 line 235).

One proof route is the following. Express orbit-closure cycle relations using characters of M(τ); they give exactly the balancing matrix. Apply the finite-orbit Kronecker-duality theorem of the SchemeAndStackFoundations Layer 5 supplier contract to the split torus action on the complete toric variety; every orbit is a split torus over k. Together with the orbit-cycle presentation this identifies the integer functionals annihilating the character relations. For a Cartier divisor, compare local equations χ^(−m_ρ); their wall difference yields the stated degree-one coefficient, with the opposite sign from the local section generator. (FS94, Proposition 1.1, p. 4; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7; FS94 line 117, line 176, line 198 and line 235).

The API records these facts, with the hypotheses of this subsection. (FS94, Proposition 1.1, p. 4; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7; FS94 line 117, line 176, line 198 and line 235).

- The ℤ-submodule of integer cone weights annihilated by the finite character balancing matrix.
- A weight belongs exactly when every character balancing sum vanishes.
- Two intersection weights agree exactly when their values on all indexed cones agree.

**Checks.**

- Degree-zero weights of the ℙ¹ fan give the same integer to its two maximal cones; the relation matrix is [1,−1].
- For ℙ¹×ℙ¹, a degree-one weight on the rays (+e₁,+e₂,−e₁,−e₂) takes equal values on each pair of opposite rays. The two balancing rows are [1,0,−1,0] and [0,1,0,−1].
- The ℙ¹×ℙ¹ ray assignment (1,0,0,0) is not balanced: its balancing vector is (1,0), not (0,0).
- For O(D₋) on ℙ¹, m₊=0, m₋=1 and the annihilator positive on the positive cone is b₊=1. Thus m₋−m₊=1=c(0)b₊ and the degree is +1; reversing the section-generator sign would give −1.
- Over ℝ, Spec ℂ with the trivial group action has operational A⁰=ℤ and A₀=ℤ, but degree evaluation sends 1 to 2. Thus finite geometric orbit count alone cannot imply integral Kronecker duality over an arbitrary field; the supplier contract requires split orbit strata. The split rank-zero toric variety Spec k instead has degree 1.

Changing lattice bases or annihilator bases produces a canonically identified kernel, not a different Chow group.

*Needs:* §0.5; ShimuraCompactifications C0.16; SchemeAndStackFoundations §5.1; SchemeAndStackFoundations §§5.1–5.6, gap:operational-chow-finite-orbits; SchemeAndStackFoundations §5.3.

### 6.2 Toric fan displacement products

For complete Σ, codimension-a and codimension-b balanced weights c,d multiply as follows. At a cone γ of codimension a+b, choose a generic displacement in (N/N_γ)_R. Sum c(σ)d(τ)[N:N_σ+N_τ] over σ,τ containing γ, of codimensions a,b, whose images satisfy σ̄∩(τ̄+v)≠∅ in that quotient, where v avoids the finite union of exceptional proper linear subspaces. This is the weight of the operational Chow cup product, independent of the generic displacement. Iterating on the Cartier weights and evaluating the degree-n weight at the zero cone computes deg(L₁⋯L_n∩[X]); all lattice indices and coefficients depend only on Σ and the Cartier data, hence are independent of k and its characteristic. In particular, the iterated degree of any n specified Cartier line bundles is the same integer over every coefficient field. (FS94, Proposition 3.1, p. 10; Theorem 3.2, p. 11, proof pp. 12–13; FS94 line 373, line 393 and line 505).

Here Σ complete; k is a field; a,b≥0 and a+b≤rank N. Generic displacement avoids the finite exceptional linear subspaces; indices in contributing terms are finite.

One proof route is the following. Apply the diagonal torus deformation to the lattice N/N_γ; its multiplicities are the indices [N:N_σ+N_τ]. Use the diagonal formula for the operational Chow cup product and the balanced-weight evaluation pairing. Iterate the product and evaluate at the zero cone; top-degree evaluation equals degree. The formula involves only integer lattice data. (FS94, Proposition 3.1, p. 10; Theorem 3.2, p. 11, proof pp. 12–13; FS94 line 373, line 393 and line 505).

**Checks.**

- On ℙ¹×ℙ¹, O(a,b)·O(c,d) has degree ad+bc; O(2,0)·O(1,1) has degree 2, and O(1,0)² has degree 0, ruling out coordinatewise multiplication of degrees.
- At a ray γ of a rank-two fan the displacement space is the one-dimensional quotient N/Nγ; using the line Nγ itself projects every displacement to zero and cannot be generic.
- The primitive vectors (1,0),(1,2) span an index-2 sublattice of ℤ², so a contributing displacement term from these rays has multiplicity 2, not 1. In rank zero the empty product has degree 1.

*Needs:* §6.1; SchemeAndStackFoundations §§5.1–5.6, gap:operational-chow-finite-orbits; SchemeAndStackFoundations §5.2.

### 6.3 Toric complete-intersection degrees

Let XΣ,k be smooth projective of dimension n, D₁,…,D_c invariant Cartier divisors whose sections cut out a nonempty set-theoretic complete intersection of codimension c, and H an invariant ample Cartier divisor. Then δ=deg(c₁(H)^(n−c)c₁(O(D₁))⋯c₁(O(D_c))∩[X]) is a positive integer determined by the fan and the invariant divisors D₁,…,D_c and H, independent of the coefficient field. Every ample class has an invariant representative by §0.4, and the same invariant H is used over k₀, K and K♭ in §6.4. Replacing D_i by p^(N_i)D_i multiplies δ by p^(Σ N_i). For arbitrary sections of the replaced bundles, even with excess intersection, the refined intersection class is supported on their common zero locus and has this positive degree after ample intersection; hence that zero locus cannot be empty. (SCH12, §8, Corollary 8.8 and proof, p. 307; SCH12 line 2501; FS94 line 385).

Here Σ projective; 0≤c≤n; the initial sections form a proper intersection of effective Cartier divisors, set-theoretically of codimension c; H an invariant ample Cartier divisor.

One proof route is the following. A smooth toric scheme is Cohen–Macaulay. Codimension c for c Cartier equations gives a regular-sequence intersection cycle with positive generic lengths. Apply SchemeAndStackFoundations §§5.3–5.4 Chern classes and AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`, with all n−c bundles equal to H on each integral component, and add with the positive cycle multiplicities. Apply the preceding fan displacement product to its Cartier weights; the resulting integral degree is unchanged by coefficient field or characteristic. For arbitrary equations over the other coefficient field in the same powered divisor classes, put E=⊕_i O(p^(N_i)D_i) and let s:X→E be their section. SchemeAndStackFoundations §5.5 `Chow.gysin`, applied to the zero section 0:X→E and pulled back along s, gives 0_s^![X]∈CH_(n−c)(Z(s)). Its pushforward is c_c(E)∩[X]; this follows from the zero-section formula and homotopy invariance, using H:X×A¹→E, H(x,t)=t·s(x), to compare s with 0. Use the projection formula and `excess_intersection` for its ample degree and excess cases. A positive-degree class cannot be supported on an empty scheme. (SCH12, §8, Corollary 8.8 and proof, p. 307; SCH12 line 2501; FS94 line 385).

**Checks.**

- For the union of two distinct fibres of the first projection on ℙ¹×ℙ¹, the total class is (2,0) and its degree against H=O(1,1) is 2: each fibre has class (1,0) and degree 1. The fibres are disjoint, so the support has two connected components; positive degree does not imply connectedness. Against the invariant H of class O(1,2) the same fibres give δ=4, so δ depends on H and H belongs to the divisor data.
- On ℙ², two line classes give δ=1. For s=(ℓ,ℓ) in O(1)⊕O(1), Z(s) is the line L. The excess normal bundle is O(1)|_L, so 0_s^![ℙ²]=c₁(O(1)|_L)∩[L] in CH₀(L), of degree 1. The excess-dimensional zero locus remains nonempty.
- Replacing those two line classes by pᴺ¹ and pᴺ² multiples changes δ from 1 to p^(N₁+N₂). For c=0, δ=deg(Hⁿ)>0; in rank zero this degree is 1.
- For d=0, an integral closed point with residue degree p has ample degree p>0, also for the inseparable point xᵖ−t over 𝔽ₚ(t). More generally Σ_i m_i[V_i] has degree Σ_i m_i[k(V_i):k]>0 when the effective zero cycle is nonzero; the zero cycle has degree 0.

*Needs:* §6.2; §0.5; ShimuraCompactifications C0.16; SchemeAndStackFoundations §§0.7, 0.17–0.18 (dimension, regular sequences and Cohen–Macaulayness); §§5.2–5.4 (degree, Chern classes and projection formula); §5.5 `Chow.gysin`, `excess_intersection` and zero-section homotopy invariance (localized support); AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive` (ample degree of nonzero effective cycles).

### 6.4 Toric complete-intersection approximation

Let Σ be smooth projective, K perfectoid, and nonempty Y⊂XΣ,K be set-theoretically the intersection of c effective Cartier hypersurfaces, where c=codim(Y). Given any open neighbourhood U of Yᵃⁿ and any dense subfield k₀⊂K♭, there exists a closed subscheme Z₀⊂XΣ,k₀ such that Z=Z₀×ₖ₀K♭ satisfies |Zᵃⁿ|⊂π⁻¹(U) and dim Z=dim Y. One may replace Z₀ by its reduction without changing those support conclusions. The reduced geometric subvariety (Z₀×ₖ₀K♭)_red has the same dimension and analytic support, but its reduced scheme structure is not asserted to descend to an imperfect k₀. If k₀ is perfect, reduced Z₀ is geometrically reduced. No geometric irreducibility or connectedness is promised; component selection belongs with the consumer. (SCH12, §8, Corollary 8.8 and proof, p. 307; STACKS, Varieties, §33.6, Lemmas 33.6.3 and 33.6.4 (tags 020I and 035X); SCH12 line 2496; STACKS line 223 and line 229).

Here Σ projective; Y nonempty of codimension c and cut out set-theoretically by exactly c hypersurfaces; k₀⊂K♭ dense.

One proof route is the following. Apply the finite-family section-neighbourhood theorem to the defining equations. Choose its common rational threshold a>0 and put U_i=N_a(f_i), so each contains its hypersurface and their intersection is contained in U; no normality or arbitrary closed-set separation claim is used. Apply Layer 5 to each equation, producing Z_i defined over k₀ in the powered invariant divisor classes. The positive refined degree from §6.3 forces W=∩Z_i nonempty. The height bound gives dim W≥n−c. If its dimension exceeds n−c, cut W successively by sufficiently general ample hypersurfaces defined over the infinite field k₀. Avoid each geometric top-dimensional component and use projective ample intersection positivity to keep the intersection nonempty, until its maximal dimension equals n−c. Keep the equations and all additional cuts over k₀, obtaining a closed model Z₀. Its base change has the required dimension and analytic support. Reducing Z₀ or reducing after base change leaves these conclusions unchanged. These two reductions need not give the same scheme over an imperfect k₀; do not assert descent of the reduced geometric structure. (SCH12, §8, Corollary 8.8 and proof, p. 307; STACKS, Varieties, §33.6, Lemmas 33.6.3 and 33.6.4 (tags 020I and 035X); SCH12 line 2496; STACKS line 223 and line 229).

**Checks.**

- For two disjoint fibres on ℙ¹×ℙ¹, c=1 and dim Y=1, so the output may be disconnected and has dimension 1, not dimension 0.
- For c=0, Y is the whole variety and Z₀=XΣ,k₀ has dimension n; no extra equation is introduced. A hypersurface in ℙⁿ is the c=1 instance.
- In ℙ², two identical lines give codimension 1 with two equations and are not an input with c=codim Y=2. Two distinct lines meeting in a point have c=2 and dim Y=0.
- Over the imperfect field k₀=𝔽ₚ(t), xᵖ−t defines a reduced degree-p point, but after adjoining t^(1/p) its equation is (x−t^(1/p))ᵖ. Its geometric reduction has length 1, while the base-changed model has length p. The reduced geometric structure need not descend. This is an algebraic descent Check; it does not assert density of 𝔽ₚ(t) in a perfectoid field (STACKS, tags 020I and 035X; STACKS line 223 and line 229).

*Needs:* §5.3; §6.3; SchemeAndStackFoundations §0.7 (dimension and height bounds); §4.13, gap:ample-generic-cuts (cuts over the infinite dense field); §§5.3–5.4 (Chern classes and degree); AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive` (nonemptiness of positive-dimensional ample cuts).

### Examples

On ℙ¹×ℙ¹, two distinct fibres of one projection have ample degree 2 and disconnected support. On ℙ², arbitrary sections in two positive powered line classes must meet by their positive localized degree, even if their common zero locus has excess dimension. Over an imperfect field, the reduced equation xᵖ−t acquires a nilpotent thickening after adjoining t^(1/p), so the endpoint retains a closed field-of-definition model.

### Dependencies

Layers 0 and 5; ShimuraCompactifications C0.16–C0.18; SchemeAndStackFoundations §§0.7, 0.17–0.18, 4.13 and 5.1–5.6, with gap:operational-chow-finite-orbits and gap:ample-generic-cuts; AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`. The finite-torsion comparison is a separate downstream output and is not a premise of positive intersection degree.

## Downstream consumers

DeligneWeightsAndPurityPartII uses §3.4–§3.6 for field-natural π and restricted-open geometric morphisms, §4.2 for the equivariant torsion comparison, and §5.3/§6.4 for dense-field approximation. These outputs commute with continuous isometric embeddings of perfectoid fields and hence with continuous automorphisms of a completed algebraic closure. Choosing a geometrically irreducible component after field extension belongs to that consumer, not to the toric approximation statement.

MixedHodgeModulesAndIrregularHodgeTheory uses the integral divisor sections of §0.3. Applications requiring only a hypersurface use complete regular fans, without importing the projectivity hypothesis used in §§6.3–6.4.

## Worked examples

For ℙ¹, take rays +1,−1 and D=D₋. The local frames are 1 and t, their ratio is t⁻¹, and W(D)={0,1}. The integral sections are A⊕At for every A. After perfecting, the weights become ℤ[1/p]∩[0,1], with c₀ coefficients. The graded cone has 0≤u≤j; (u,j)↦(u,j−u) identifies its algebra with the perfected two-variable Tate algebra of total degree j. The monomial at (0,1) times that at (1,1) has degree 2 and character weight 1. For a finite tilted section a+b t^(1/p), its pth power is aᵖ+bᵖt of divisor degree p. These values use the same divisor and frame signs in every layer (SCH12, Definition/Proposition 8.4 and proof of Proposition 8.7, pp. 304, 306; SCH12 line 2381 and line 2463).

On ℙ¹×ℙ¹, the ray balance rows are (1,0,−1,0) and (0,1,0,−1). The vector (1,0,1,0) is balanced and (1,0,0,0) is not. The product of the two ruling classes has degree 1 and each ruling square has degree 0, so O(a,b)·O(c,d)=ad+bc. Two distinct fibres in one ruling have total class O(2,0) and degree 2 against O(1,1). This set-theoretic complete intersection has c=1 and dimension 1, and its approximation can be disconnected. If two independently approximated equations acquire a common component, localized Chern support still forces nonemptiness; general ample cuts then lower the dimension to the required value (FS94, Theorem 2.1 and Theorem 3.2, pp. 6, 11–13; SCH12, Corollary 8.8, p. 307; FS94 line 198 and line 393; SCH12 line 2496).

## References

- **SCH12.** Peter Scholze, *Perfectoid spaces*, Publications Mathématiques de l'IHÉS 116 (2012), 245–313, DOI 10.1007/s10240-012-0042-x. The published numbering is used: Theorems 1.5 and 1.13, Proposition 5.20, Lemma 6.5/Remark 6.6, Definition 7.14 through Corollary 7.19, and §8, especially Definition/Proposition 8.4 through Corollary 8.8. Legal published copy: https://www.numdam.org/article/PMIHES_2012__116__245_0.pdf.
- **FS94.** William Fulton and Bernd Sturmfels, *Intersection theory on toric varieties*, arXiv:alg-geom/9403002v1 (1994), preprint pagination. Proposition 1.1, pp. 4–5; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7; Proposition 3.1, p. 10; Theorem 3.2 and its proof, pp. 11–13. Legal preprint: https://arxiv.org/abs/alg-geom/9403002v1.
- **FS25.** Osamu Fujino and Hiroshi Sato, *On non-projective complete toric varieties*, author version 0.27, 12 July 2025, Example 4.1, pp. 7–8. Legal author copy: https://www.math.kyoto-u.ac.jp/~fujino/toric-projectivity11.pdf.
- **STACKS.** The Stacks Project authors, *Varieties*, §33.6, Lemmas 33.6.3 and 33.6.4, tags 020I and 035X; the chapter PDF labels them 6.3 and 6.4. These distinguish reduced from geometrically reduced over an imperfect field. Lemma 33.45.9, tag 0BEV, p. 104, gives ample-intersection positivity. Legal chapter: https://stacks.math.columbia.edu/download/varieties.pdf.
