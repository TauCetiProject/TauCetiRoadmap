# Roadmap: relative Habiro rings, completed coefficients and number-field lines

**Summary.** Habiro's completion of a polynomial ring collects Taylor expansions at every root of unity. For a perfectly covered Λ-ring A and an étale A-algebra R, HabiroCohomologyFoundations §0.3 supplies the static Habiro-complete coefficient object E(R/A), whose (qᵐ−1)-completions deform the relative q-Witt rings. This roadmap gives that object its ordinary arithmetic presentation `H_{R/A}`: the ordinary inverse-limit ring with its projections and quotients, the full Frobenius-twisted Taylor equalizer, completed coefficient base change, the classical ring and the number-field ring of Garoufalidis–Scholze–Wheeler–Zagier. It also owns the general marked étale-deformation interface, finite descent for tensor-compatible localizations with coherent overlaps, the Laurent and scalar-restriction conventions for Habiro completion, the ordinary/derived comparison on polynomial coefficient modules, the spherical and light solid completed scalar categories, the combinatorics of the prime-chain index, completed scalar extension along morphisms of pairs, and the transport of the number-field lines with their pairings.

Taylor factors retain the full root-adjoining coefficient algebra: order four over ℤ[i][1/2] has two factors; Φ₅ over 𝔽₁₁ has four. The ordinary ring and completed base change are independent of solid spectral hypotheses.

## Scope and ownership

This roadmap owns: ordinary marked étale lifts over arbitrary quotient ideals, transport of locally nilpotent rigidity through markings, the finitely generated-ideal completed map interface and regular-principal derived universality (Layer 0); the Laurent-convention and scalar-restriction comparisons for Habiro completion, the two-term resolution of the rational localization with its homotopy-module criterion, the ordinary/derived comparison for polynomial coefficient modules, and completed coefficient base change (Layer 2, §§2.1–2.5); the spherical, spectral and light solid completion theory (§§2.6–2.12); the combinatorics of cyclotomic intersections and of the finite prime-chain index, the general descent principle for monoidal localizations and the prime-edge description of descent mapping spaces (Layer 3); the category of pairs (Layer 1) and the functoriality of the coefficient lifts along morphisms of pairs (Layer 4); the ordinary relative Habiro ring with its Taylor equalizer, untwisting criterion, completed base change, classical and number-field comparisons (Layer 5); completed scalar extension, the q−1 completion map and the transported number-field lines (Layer 6); and the distinguishing examples of Layer 7.

It leaves the following constructions to named roadmaps; the explicitly listed supplier gaps are hypotheses of their consumers:

- **HabiroCohomologyFoundations Layer 0.** §0.1 owns Habiro-complete modules over A[q] for every commutative ring A, the reflection L_H with its two limit formulas, the completed symmetric monoidal tensor, and cyclotomic detection of zero objects, equivalences and individual homotopy degrees. §0.2 owns finite cyclotomic complete descent: the closed-cover diagram, its reduction to singleton and p-primary chain data, reconstruction, mapping spaces, divisor restriction, the arithmetic fracture pieces and naturality, for modules and E∞-algebras. §0.3 owns the marked étale coefficient lifts E_m(R/A), their uniqueness, Frobenius overlap equivalences, transitions lifting q-Witt Frobenius, and the static limit E(R/A) with its h-completion R⟦h⟧. HabiroRings consumes these interfaces in Layers 2–5; it builds no second Habiro-completion functor, cyclotomic descent equivalence or specialized coefficient lift.
- **HabiroCohomologyFoundations.** The cohomological identification of its étale Habiro–Hodge object belongs to that roadmap; no target or proof here consumes it.
- **QWittVectors §§1.1–1.6, 2.1–2.5, 3.1–3.7, 4.1–4.6, 5.1–5.3 and 6.1–6.3.** Big Witt theory, arithmetic Λ-rings, perfection and perfect coverage, degree-zero absolute and relative q-Witt rings, étale comparisons and completed coefficient Frobenius. Exact supplier contracts name only the consumed interfaces; their constructions remain with QWittVectors.
- **HabiroCyclotomicCompletions Layers 1–5.** Polynomial Habiro topology, q-factorials, Taylor substitution, classical injectivity, root adjunction and ordinary polynomial-module completion. Its §§4.1 and 5.2 supply the integral cyclotomic intersections and comaximal splitting used by HabiroCohomologyFoundations §§0.2–0.3; ordinary Taylor maps are consumed here, in Layer 5. The enhanced reflection belongs to HabiroCohomologyFoundations §0.1, while the Laurent and ordinary/derived comparisons belong here in §§2.1 and 2.4. Its §1.1 supplies `qFactorial_pochhammer`; Gaussian polynomials and their product laws belong to **ArithmeticStatisticsPartIV §3.2**; the integral denominator-cleared product and factorial divisibility are imported from **QSeriesPartitionsAndMockModularForms §3.1**, the integral Gaussian product identity.
- **EnhancedDerivedSheaves:E0, E1, E2:towers, E3, E5:abstract and E5:spectra-comparison**, **BordismFormalGroups §F6.5**, **GeneralizedCohomology §§G2.1–G2.7**, and **DerivedModuleAlgebra §§1.1–1.5**: enhanced derived categories, coherent diagrams and towers, symmetric monoidal localizations, algebra objects, the spectral module comparison and principal derived completion. Mathlib's ordinary `DerivedCategory` and `LightCondMod` are useful underlying categories; their existing definitions do not supply these enhanced or solid spectral structures.
- **SolidAnalyticRings §§1.1–2.4, 3.1–3.4, 4.1–4.2, 5.1–5.4 and 6.1–6.3.** Light solid spectral foundations, product and split-tower tensor, balancing, countable-limit interchange, proper profiles, spectral null families and uniformly bounded-below resolutions and realization. In particular §5.2 owns the general two-index profile theorem; §2.11 here applies it with Habiro factorial weights. These sphere-linear inputs differ from the abelian solid-module scope of **VStackSheavesAndLisseCategories §VS2.1**. The ordinary relative ring is independent of this spectral contract.
- **HabiroNumberFields.** The number-field ring and actual K₃-indexed invertible modules, effective global descent, pairings, integral order-one condition and supported field pullbacks are the explicit supplier gaps below. Their section locators require the supplier contract; local rank one does not determine a global invertible module.

DerivedDeRhamCohomology §1.12 owns `DerivedDeRham.completelySmoothAlgebraization`; the direct regular-principal argument of §0.6 uses module completion instead.

No trace construction is an input.

The general deformation inputs are owned targets of [Layer 0](#layer-0-general-marked-étale-deformations), and the general finite monoidal-localization descent theorem is owned by [§3.5](#35-finite-descent-for-tensor-compatible-localizations). They assemble ordinary library machinery and the enhanced/completion suppliers for arbitrary bases, independently of the specialized HabiroCohomologyFoundations §0.3 construction. Part I proves its cyclotomic specialization directly and does not depend on these HabiroRings generalizations, so generalizing its special case here adds no input back to it.

## Conventions

Rings are commutative and unital. Positive indices m, d and n are positive natural numbers; p and ℓ denote rational primes. A torsion-free ring means that multiplication by every positive integer is injective. On such a ring, arithmetic Λ-data are commuting ring endomorphisms ψᵐ with ψ¹ = id, ψᵐⁿ = ψᵐψⁿ, and ψᵖ(a) − aᵖ ∈ pA. On rings with torsion the definition uses a coalgebra for the big Witt comonad; Adams operations alone are insufficient data. A Λ-map preserves all operations. Perfect means all ψᵐ are bijective; perfectly covered refers to the faithful flatness criterion of QWittVectors §§2.3–2.4, recorded below. Every perfect Λ-ring is perfectly covered.

Write R^(m) = R `⊗_{A,ψᵐ}` A, with the A-algebra structure through the right factor. A map of pairs (A,R) → (A′,R′) consists of a Λ-map A → A′ and a compatible ring map R → R′. It does not equip R with global Adams operations. The standing hypothesis for finite and infinite relative Habiro rings is **A perfectly covered and R étale over A**. The completed Frobenius `φ_{p/A}` is a map on R̂_p, and its linearization is an isomorphism between the corresponding completed twists.

Let Φ_m(q) be the m-th cyclotomic polynomial, f_m=qᵐ−1, and P_n(q) = `∏_{i=1}^n(1−qⁱ),` with P₀ = 1. Set

    R_r = ℤ[q^(±1), (q^m−1)^(−1) | m≥1]

Derived quotients are cofibers, not underived quotients with Tor discarded. For example M/f denotes cofib(f:M→M); for a static module its positive homotopy detects f-torsion. Derived I-completion is indicated by a hat with subscript I. Habiro completion L_H is the reflection of HabiroCohomologyFoundations §0.1, the completion for all cyclotomic divisors, equivalently for the tower P_n. That reflection is defined on A[q]-modules; §2.1 identifies it with the Laurent convention over `A[q^{±1}]` used throughout this roadmap. “Static” means homotopy only in degree zero; “bounded below” refers to homotopy degrees. For ordinary power series write X=q−1, or X_m=q−ζ_m at another root.

For étale R over perfectly covered A, write `H_{R/A,m}` for the f_m-complete coefficient lift E_m(R/A) of HabiroCohomologyFoundations §0.3 and `H_{R/A}` for the ordinary ring π₀E(R/A) of §5.1. This is notation for the supplier's objects in the Laurent convention, not a second construction.

Big Witt coordinates are indexed by a divisor-stable set S of positive integers. W_m means `W_{Div(m)},` whose ghost component is `gh_n(a)=Σ_{d∣n}d` `a_d^{n/d}.` `F_{m/d}:W_m→W_d` denotes Witt Frobenius; Res_d^m is restriction and `V_{m/d}:W_d→W_m` is additive Verschiebung. These maps have different meanings. The p-typical truncation on {1,p,…,pⁿ} has n+1 coordinates, whereas Mathlib's `TruncatedWittVector p k R` has k coordinates. Exterior λ-operations are distinguished from the Witt coordinates c_n; in particular λ²=−c₂.

Spherical coefficients use `ℛ=𝕊[ℤ]=𝕊[q^{±1}],` not `Hℤ[q^{±1}].` Write S_H=L_Hℛ. The tensor product in the complete category is L_H(M⊗N). For HR-relative modules, the Eilenberg–Mac Lane comparison is symmetric monoidal; restriction from HR to the spherical base is only lax monoidal. Solid tensor products and ordinary spectral tensor products retain their separate notation.

API bullets specify the mathematical interfaces; backticked local declaration names refer only to the headline signatures and their necessary definitions in Suggested.lean. [Suggested.lean](Suggested.lean) states the targets whose carriers exist at Mathlib **6b7abb3** and Tau Ceti **a91d3aa**; `sorry` supplies no implementation. Roadmap dependencies name their owners, library prerequisites use qualified declaration names, and local links identify the specifications below.

## Exact supplier contracts

### From Mathlib

Use the existing `CommRing`, `RingHom`, `Algebra`, `Algebra.Etale`, `Module.Flat` and `Module.FaithfullyFlat` carriers. Prime completion uses `AdicCompletion`, its `of` map and `isAdicComplete`; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` and `Algebra.FormallyUnramified.ext_of_iInf` provide existence and uniqueness at finite nilpotent levels and their complete limit. These are the ordinary inputs of the QWittVectors §§6.1–6.3 completed-Frobenius interface specified below.

For invertible modules use `Module.Invertible`, `Module.Invertible.bijective_of_surjective`, `Module.Invertible.free_iff_linearEquiv`, and `CommRing.Pic.mapRingHom`. The existing tensor base-change, quotient and Picard functor laws are consumed; the additional line theorem is triviality over R[[X]] from an actual trivial integral first fiber. `completedLineCoeffAlgebra` is the local scalar instance induced by `PowerSeries.constantCoeff`, so X acts by zero on R. `PowerSeries.X_dvd_iff` and `PowerSeries.isUnit_iff_constantCoeff` fix its scalar convention. `NumberField.discr` and `NumberField.not_dvd_discr_iff_isUnramifiedIn` supply the discriminant criterion, whose localized étale assembly is a Layer 5 target. `LaurentPolynomial`, `LaurentPolynomial.T` and `IsLocalization` supply the ordinary Laurent and localization carriers of Layer 2.

### From Tau Ceti

Use `TauCeti.Cyclotomic.conjugateResiduesRingHom` and `TauCeti.Cyclotomic.conjugateResidues_lift` from `TauCeti/RingTheory/Cyclotomic/Lift.lean` for the all-conjugates comparison in Layer 7, retaining their prime and primitive-root hypotheses.

### Enhanced and completion inputs

Import DerivedModuleAlgebra §§1.1–1.1.1 for module limits and derived Hom, §1.2 for `DerivedDeRham.derivedCompleteness`, §1.3 for `DerivedDeRham.derivedCompletion` and `DerivedDeRham.completeNakayama`, §1.4 for `DerivedDeRham.koszulCompletionTower` and §1.5 for `DerivedDeRham.ordinaryQuotientCompletion`, retaining its regular-sequence or bounded-torsion hypotheses. Import BordismFormalGroups §F6.5 for straightening, coherent limits and monoidal structures, GeneralizedCohomology §§G2.1–G2.7 for concrete spectra, and EnhancedDerivedSheaves §E2:towers for `derivedTowerLimit`, §E5:abstract.2 for `commutativeAlgebras` and `moduleObjects`, §E5:abstract.3 for monoidal localization, and Layer E5:spectra-comparison for `symmetricSpectra_equiv_spectra` and `moduleSpectra_equiv_derived`. A triangulated category alone does not supply the mapping spaces. For a regular principal element, the ordinary/derived comparison uses zero torsion on the chosen étale algebra; it does not require DerivedModuleAlgebra's separate Noetherian Artin–Rees proof input. The algebraic Habiro completion, its tensor and its finite descent are the HabiroCohomologyFoundations Layer 0 interfaces specified below; they use no solidification.

The classical HC input is independent of derived completion: for any commutative ring B and B-module M, HC Layers 1, 2 and 5 provide the ordinary full completion of M[q], its polynomial/Laurent comparison, finite quotient projections and functoriality in M. ArithmeticStatisticsPartIV §3.2 supplies the Gaussian polynomials and their product laws; QSeriesPartitionsAndMockModularForms §3.1 supplies the integral denominator-cleared Gaussian product identity. Together with HC §1.1's `qFactorial_pochhammer` it gives `P_(a+b)=P_a P_b [a+b choose a]_q` for all natural a,b, including zero. Its proof clears nonzero denominators at the indeterminate in ℚ(q), reflects equality into ℤ[q], then changes coefficients; this roadmap imports the result. The derived comparison of §2.4 uses this ordinary input and the reflection of HabiroCohomologyFoundations §0.1.

### From TauCetiRoadmap.SolidAnalyticRings

Import **SolidAnalyticRings §§1.1–2.4** for the following light solid spectral foundations. Work with hypersheaves of spectra on light profinite sets. The discrete functor is fully faithful symmetric monoidal and left adjoint to evaluation at the point. For Null=cofib(𝕊[{∞}]→𝕊[ℕ∪{∞}]) and its shift σ, solidity means that 1−σ* is invertible on the internal Hom from Null. Discrete spectra are solid; solid objects are closed under limits and colimits and admit accessible symmetric monoidal solidification. Null^■≃∏_ℕ𝕊 is a compact generator, with the functorial product tensor comparison `(∏_ℕ𝕊)⊗^■(∏_ℕ𝕊)≃∏_{ℕ²}𝕊.`

Import **SolidAnalyticRings §§3.1–3.4** for product tensor, coherently sphere-split finite free towers, independent towers and balanced relative base change; **§§4.1–4.2** for countable-limit/ω₁-filtered-colimit interchange and independent support bounds; **§§5.1–5.4** for complete split coefficient data, proper profiles and the spectral null-family formula in every degree, natural for finite-output block maps; and **§§6.1–6.3** for uniformly bounded-below free resolutions, connectivity of quotient completion and uniform realization comparison. Countable limits here have indexing nerves with countably many nondegenerate simplices, as required by §4.1. All families and diagrams obey the supplier's fixed-universe bounds. Split tower sections are sphere-linear; balanced base change is applied to their limit, without commuting arbitrary scalar extension through that limit. A countable product of condensed complete units is not identified with the condensed completion of an ordinary spectral product without its own comparison. These hypotheses do not assert that tensor commutes with arbitrary inverse limits.

The null-sequence and solidification input is described by [MW], §4.1, 4.1, pp.41–42 (author version dated 5 February 2026), and [Q], Appendix B.6, p.79. Neither this description nor Bosco's abelian p-adic Proposition A.3, pp.92–93, establishes the whole spectral tower/resolution contract. Layer 2 applies the cited SolidAnalyticRings sections to the Habiro factorial tower and proves its arithmetic idempotence and bounded-below monoidality. The product, split-stage, size and uniform-bound hypotheses of those supplier theorems remain in force. The nonsolid relative ring uses none of these spectral comparisons.

**Checks.**

- On the finite-support coefficient vector e₁, precomposition by the shift gives (1−σ*)e₁=e₁−e₀ and (1−σ*)⁻¹e₁=e₁+e₀. The opposite shift fails this two-term witness.
- Products indexed by sets of sizes 2 and 3 tensor to six sphere summands; an empty index set gives zero. Split towers use these sphere bases, retaining π₁(𝕊)=ℤ/2 rather than replacing 𝕊 by Hℤ.
- For the diagram F(n,k)=Hℤ when k<n and zero otherwise, with both indices natural, colim_n ∏_k F(n,k) has π₀=⊕_ℕℤ, while ∏_k colim_n F(n,k) has π₀=∏_ℕℤ. The all-one sequence belongs only to the latter; ordinary filteredness cannot replace ω₁-filteredness.
- A constant simplicial Σᵇ𝕊 has realization Σᵇ𝕊 and the same lower bound b. Terms Σ^(−n)𝕊 admit no uniform lower bound: π_(−n)=ℤ. They do not meet the realization comparison's hypothesis.

### Additional supplier contracts

HabiroCohomologyFoundations §§0.1–0.3 and SolidAnalyticRings §§1.1–6.3 are direct prerequisites, with the consumed interfaces specified in their supplier sections. The additional contracts below are distinct requirements: naming a supplier does not establish them. The number-field comparison of §5.9 requires the ring contract; §§6.2 and 6.4–6.7 require the global-line contract, with the integral-evaluation contract additionally needed in §§6.4–6.7, and §6.7 requires arithmetic naturality. The arithmetic conclusions require all four contracts, independently of the solid spectral inputs. Local p-adic rank one supplies neither effective global descent nor a section whose integral order-one value is 1.

What QWittVectors must provide (gap:completed-frobenius-base-naturality): For a Λ-map between perfectly covered A and A′ and a compatible map from étale R/A to étale R′/A′, prove that the completed coefficient Frobenius maps commute with the induced prime-completed map, including the linearization coherences.

What HabiroCyclotomicCompletions must provide (gap:cyclotomic-prime-ideal): For m>1 prove that the ideal of ℤ[q] generated by the q-integers [p] at q^(m/p), for primes p dividing m, equals (Φ_m); at m=1 retain the separate empty ideal (0).

What HabiroNumberFields must provide (gap:number-field-ring): For R=𝒪_F[1/Δ] with Δ>0 divisible by disc(F), supply the ordinary GSWZ ring with its full cyclotomic coefficient algebras, Taylor maps and completed Frobenius gluing.

What HabiroNumberFields must provide (gap:number-field-lines): For Δ>0 divisible by 6 and disc(F), supply actual K₃(F)-indexed global invertible modules over the GSWZ ring, effective descent, unit and inverse pairings and coherent multiplication equivalences.

What HabiroNumberFields must provide (gap:integral-linear-jet): For the global indexed lines with Δ divisible by 6 and disc(F), supply their integral order-one evaluation over 𝒪_F[1/Δ] and a section evaluating to 1, compatible with the unit and tensor pairings.

What HabiroNumberFields must provide (gap:arithmetic-line-naturality): For F→E and a common positive Δ divisible by 6 and both discriminants, supply scalar equivalences of the actual indexed global lines respecting restriction on K₃, pairings, Taylor maps and integral order-one evaluation, with identity and composition coherences.

### From TauCetiRoadmap.QWittVectors

Import QWittVectors §§1.1–1.6 for big Witt rings, truncation sets, ghosts, Frobenius, Verschiebung, Teichmüller maps and étale base change. Import §2.3 for arithmetic perfection and its universal property, and §2.4 for the three equivalent perfect-coverage conditions. On torsion bases the coaction, rather than Adams operations alone, is the structure; no second Witt or Λ construction is owned here. The torsion-free comparison uses [H], §1, pp.6–19, and [B], §§1.17–1.18, pp.12–13, through those supplier sections.

Use §§3.1–3.7 for absolute q-Witt rings and their F,V and ghost laws; §§4.1–4.6 for relative q-Witt rings, relative ghosts, base change and perfect-cover comparison; §§5.1–5.3 for étale preservation, ghost pushouts and completion. Relative ghosts at d∣m land in R^(d)[ζ_d], with the right-hand A-action, and relative Frobenius is A[q]-linear. Absolute q-Witt rings over a nonperfect Λ-ring are distinct from the relative self-ring. These are exactly the degree-zero interfaces consumed in Layers 4–5 ([W], §§2.1–2.6, pp.8–35).

Use QWittVectors §§6.1–6.3 for completed coefficient Frobenius and q-fixed cyclotomic overlaps. The base A is perfectly covered and R/A is étale. At a prime p, φ_p is defined on the p-completion of R, is ψ_p-semilinear, reduces to pth powers and has invertible completed linearization. The supplied naturality is for étale A-algebra maps; compatibility across different Λ-bases is the additional contract gap:completed-frobenius-base-naturality. No Frobenius existence on arbitrary torsion bases is assumed ([Q], 2.7, pp.15–16).

The cyclotomic prime-generator identity is required through QWittVectors' cyclotomic-contract supplier requirement, owned by HabiroCyclotomicCompletions §4.1: for m>1, the ideal in ℤ[q] generated by [p] at q^(m/p), for primes p∣m, is (Φ_m). At m=1 the prime-generated ideal is zero and Φ₁=q−1 is used separately ([W], Lemma 2.2, pp.8–9, with this necessary boundary restriction).

**Checks.**

- At m=1 the empty ideal is (0) ≠ (q−1). At m=2 its single generator is 1+q=Φ₂; at m=6 the generators a=1+q³ and b=1+q²+q⁴ satisfy b−qa=Φ₆=q²−q+1, with a=(q+1)Φ₆ and b=(q²+q+1)Φ₆. Thus the positive-index convention alone does not suffice for the prime-generator identity.
- For toric A=ℤ[T], the absolute comparison at m=2 has image ℤ[T²,q]+(1+q)ℤ[T,q] in ℤ[T,q]/(q²−1), whereas the relative self-ring is the entire A[q]/(q²−1). Evaluation at q=−1 excludes T from the absolute image.
- For A=ℤ, R=ℤ[i][1/2], φ₃(i)=−i and φ₅(i)=i. These are completed coefficient maps; they do not equip every étale R with a global Λ-structure.

### From TauCetiRoadmap.HabiroCohomologyFoundations

Import HabiroCohomologyFoundations §§0.1–0.3 as direct prerequisites. These sections construct, on the actual enhanced D(A[q]) for every commutative ring A, the specialized Habiro completion, finite cyclotomic descent and the étale coefficient lifts, using DerivedModuleAlgebra §§1.1–1.5, EnhancedDerivedSheaves E0/E5 and QWittVectors Layers 1–6; their construction assumes no ordinary Habiro-ring presentation or Taylor expansion theorem. The interfaces below are consumed in the Laurent convention of §2.1. Their checks are the tests that fix the conventions under which this roadmap uses them.

#### Habiro completion and its factorial tower

Import **HabiroCohomologyFoundations §0.1** for the enhanced reflection and the two tower formulas. For B=A[q], with S generated by all f_m and C=fib(B→S⁻¹B), the complete subcategory consists of the M with RHom_B(S⁻¹B,M)=0. Its reflection is L_H(M)=RHom_B(C,M), with unit induced by C→B, initial among maps to complete objects, idempotent and the identity on complete objects. It is computed by the natural equivalences

    L_H M ≃ lim_(m|n) M^∧_(q^m−1) ≃ lim_N M/P_N

compatible with the projections and with restriction to factorials. HabiroCohomologyFoundations §0.1 writes its factorial as ∏_(j=1)^N f_j=(−1)^N P_N; transport the derived cofibers and tower transitions through that unit. In the divisibility limit the arrows go from a larger divisible index to a smaller one, and all completions and quotients are derived. This is a derived completion functor, not the operation of inverting every f_m: it kills S⁻¹B-modules and fixes complete objects. Layers 2, 5 and 6 use this reflection through §2.1; no second completion functor is constructed here.

(See [Q], Appendix B, B.1 and Lemma B.2, pp.77–78.)

**Checks.**

- For A=ℤ the reflection of the Laurent unit is lim_N ℤ[q]/P_N, the classical integral Habiro ring of HabiroCyclotomicCompletions Layer 1. Already at the second stage q is a unit, since q(1+q−q²)−1=−P₂. At N=1 the supplier’s f₁=q−1 is −P₁, while at N=2 its f₁f₂ equals P₂; the quotient ideals agree in both cases.
- The first limit is indexed by divisibility, with transition maps `M^∧_{f_n}→M^∧_{f_m}` for m∣n induced by f_m∣f_n. Ordering the indices by size gives no such system: f_2 does not divide f_3, so there is no completion map from the m=3 term to the m=2 term. Factorials are cofinal for divisibility, which gives the second formula.
- For M=ℤ with q acting as 1, every f_m acts by zero, so M is complete and the tower returns M. Its derived quotient by q−1 is ℤ⊕Σℤ. A tower of ordinary quotients would lose the suspended copy.

#### Cyclotomic detection

Import **HabiroCohomologyFoundations §0.1** for cyclotomic detection. On complete objects the derived reductions M/Φ_d(q), d≥1, jointly detect zero objects and equivalences. If a fixed homotopy degree of every M/Φ_d vanishes, the same degree of M vanishes. In particular a complete M whose derived cyclotomic reductions are all static is static, and a static complete module whose ordinary quotients M/Φ_dM all vanish is zero. Layer 5 uses the degreewise form for the staticity of the ordinary ring, and §§2.3 and 2.7 use it for homotopy bounds.

(See [Q], Appendix B, Lemma B.3 and Corollary B.4, p.78; Remark B.5, p.79; §2.2, proof of Theorem 2.9, p.17.)

**Checks.**

- Completeness is needed: R_r has every cyclotomic reduction zero and is nonzero. Its reflection is zero, so it neither contradicts nor extends detection to all modules.
- Staticity is detected in one direction only. The static module ℤ with q acting as 1 has a derived quotient by q−1 containing Σℤ. Layer 5 verifies static derived reductions and never uses the converse.

#### Completed tensor

Import **HabiroCohomologyFoundations §0.1** for the completed tensor: M⊗̂_HN=L_H(M⊗^L_BN) on complete objects, with unit L_H(B), its associativity, unit and symmetry coherences, and L_H(L_HM⊗^L_B L_HN)≃L_H(M⊗^L_BN); its f_m-completion is the f_m-completed derived tensor of the f_m-completions. It is the symmetric monoidal structure on the full subcategory of complete modules, not on the module category of the ordinary ring π₀L_H(B). The completed tensor of Layers 2 and 6, and of the downstream scalar consumers, is this one; §2.5 proves its Laurent and coefficient base-change compatibilities.

(See [Q], Appendix B, B.1, p.77; §2.1, Setup 2.1(c), p.13.)

#### Finite cyclotomic complete descent

Import **HabiroCohomologyFoundations §0.2** for finite cyclotomic complete descent for every commutative A and m≥1. On the poset of nonempty subsets U of the divisors of m it takes the category complete along (Φ_d(q):d∈U), in presentable stable symmetric monoidal categories with completed scalar-extension restrictions. Its limit recovers the f_m-complete category, and the same holds for E∞-algebras. By right Kan extension the diagram reduces to Φ_d-complete singleton terms E_d and p-primary chains {d,pd,…,p^a d}, with p prime, p∤d and marked equivalences `(E_{pd})^∧_p≃(E_d)^∧_p` over the common (p,Φ_d)-complete base. The consumed API is:

- Reconstruction is an enhanced finite homotopy limit, inverse to restriction, with Φ_d-completion naturally E_d. Because it inverts an equivalence, the space of reconstructions of fixed marked local data is contractible; HabiroRings uses this consequence.
- Mapping spaces are the limit of the intersection mapping-space diagram, with every comparison homotopy retained.
- Arithmetic fracture: for m=p^αn with p∤n, `E^∧_p ≃ ∏_(d∣n) (E_(p^i d))^∧_p` for any 0≤i≤α; after inverting m and then f_m-completing, the reconstruction is the product of the correspondingly completed singleton terms.
- For n∣m, restriction of the cover computes f_n-completion, with identity, composition and higher compatibility laws.
- Completed coefficient extension and semilinear maps preserving q and the completion ideals commute with reconstruction and its projections.

§§3.1–3.4 compute the index that this reduction uses, and §3.6 unravels the mapping-space equivalence on it. Layers 4 and 5 use reconstruction, the fracture pieces and naturality.

(See [Q], §2.1, Setup 2.1 and Lemma 2.2, pp.13–14; Remark 2.3 and Corollary 2.4, pp.14–15; Remark 2.5, p.15; [W], §2.1, Lemma 2.1, p.8.)

**Checks.**

- At m=4 the overlap {1,4} is nonempty, (2,q−1)-complete, and is not a vertex of the reduced index. Its comparison is the composite of the edge equivalences at (p,d)=(2,1) and (2,2), not a third independent datum.
- At m=6 the overlap of {1} and {2} is (2,q−1)-completion, whereas Φ₆(1)=1 makes {1,6} the unit ideal and its category zero. Overlaps are completions along I_S+I_T and are not declared empty or nonempty by the divisibility of their members.
- For `E_d=A[q]^∧_{Φ_d}` with the canonical common-completion identifications, reconstruction is `A[q]^∧_{f_m}` as a complete E∞-A[q]-algebra. The zero marked section reconstructs the zero algebra.
- At m=2 put t=q²−1 and E=ℤ[q]^∧_t. The series `Σ_{r≥0}t^r/2^r` lies in (E[1/2])^∧_t but not in E[1/2], whose elements have bounded denominators. The rational fracture piece keeps its completion.

#### Étale coefficient lifts

Import **HabiroCohomologyFoundations §0.3** for the following marked coefficient interface, for a perfectly covered Λ-ring A and an étale A-algebra R.

- E_m(R/A) is the f_m-complete formally étale lift of qW_m(R/A) over A[q]/f_m with its specified reduction marking, functorial in étale A-algebras.
- The spaces of marked formally étale complete lifts, and of compatible maps lifting a fixed map, are contractible. Use the same section’s reduction equivalence between f_m-complete E∞-A[q]-algebras with étale reduction and étale A[q]/f_m-algebras, given by reduction.
- The Φ_d-completion of E_m is `(R⊗_{A,ψ^d}A)[q]^∧_{Φ_d},` and the prime-edge overlaps are the linearized completed Frobenius equivalences of QWittVectors §§6.1–6.3, compatible with the marked relative ghost maps.
- For n∣m, E_m→E_n reduces to `F_{m/n}:qW_m(R/A)→qW_n(R/A)` and exhibits E_n as `(E_m)^∧_{f_n},` with identity and coherent composition laws.
- The static Habiro-complete limit is E(R/A)=lim_k `E_{k!}(R/A),` with its partial completions and its canonical h-completion E(R/A)→E_1(R/A)=R⟦h⟧.

Each E_m and E(R/A) is static. Since the derived quotient E_m/f_m is the static qW_m(R/A), it follows here that f_m is a non-zero-divisor on E_m and that ordinary and derived quotients agree; §5.1 uses this consequence. The étale hypothesis on R is part of the statement; the displayed statement of [Q], Theorem 2.9 abbreviates it. The overlaps use completed Frobenius, not a global Adams operation on R. Layer 4 writes `H_{R/A,m}=E_m(R/A)` and extends this functoriality to morphisms of pairs; §5.1 takes the ordinary ring of E(R/A).

(See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; Theorem 2.9 and proof, pp.16–17; Remark 2.10, p.17; [W], §2.6, Proposition 2.48 and Corollary 2.51, pp.33–34.)

**Checks.**

- At m=1 there are no prime edges and `H_{R/A,1}=R⟦q−1⟧.` For R=ℤ[1/2] over ℤ this lift contains Σ_n(q−1)ⁿ/2ⁿ, so it is not ℤ⟦q−1⟧[1/2]; a lift with bounded denominators is not complete.
- The marking is data. For R=A×A the lift splits as two copies of E_m(A/A), and the swap of the factors reduces to the transposition of qW_m(A/A)², which moves (1,0) whenever A≠0. An unmarked existence statement would not determine the contractible solution space.
- The static quotient cannot replace the lift. For A≠0 the static algebra A[q]/f_m has derived reduction by f_m with π₁=A[q]/f_m≠0, whereas the reduction of the lift `E_m(A/A)=A[q]^∧_{f_m}` is static because f_m is regular on A[q]. For R=0 every lift and the limit are zero.
- For d∣m the transition reduces to Frobenius `F_{m/d}.` Ordinary Witt restriction does not extend to the cyclotomic q-Witt quotients compatibly with the projections (ordinary Witt restriction does not define the required q-Witt transition), so the inverse system lifts Frobenius, not restriction.

## How to read the build

Layer 0 constructs the general marked ordinary deformation interface and proves regular-principal derived universality. It uses ordinary étale and completion APIs, DerivedModuleAlgebra §§1.1–1.5 and E1/E5. The independently proved cyclotomic specialization is imported from Part I. Layer 1 fixes the category of pairs on which every construction is functorial; perfect covers and the completed Frobenius are the QWittVectors §§2.3–2.4 and 6.1–6.3 interfaces. Layer 2 identifies the Habiro completion and completed tensor of HabiroCohomologyFoundations §0.1 with the Laurent and scalar-restriction conventions, proves the ordinary/derived comparison and coefficient base change, and builds the spherical and solid completed categories. Layer 3 computes the prime-chain index used by the finite descent of HabiroCohomologyFoundations §0.2 and unravels its mapping spaces; §3.5 separately proves general finite monoidal-localization descent under coherent overlap and conservativity hypotheses. Layer 4 extends the coefficient lifts of HabiroCohomologyFoundations §0.3 to morphisms of pairs. Layer 5 presents their limit as an ordinary ring, proves the Taylor equalizer and completed base change, and compares with the classical and number-field rings. Layer 6 transports scalar modules and arithmetic lines, before the examples of Layer 7. RefinedTraceMethods, HabiroNahmSeries and HabiroCohomologyFoundationsPartII consume these results.

## Layer 0: General marked étale deformations

This layer owns the arbitrary-ring deformation interface. Its objects use ordinary étale algebras and Mathlib's existing adic completion; its last theorem assembles them with DerivedModuleAlgebra §§1.1–1.5's derived completion. The cyclotomic coefficient objects remain the separate HabiroCohomologyFoundations §0.3 interface. That supplier proves its specialization directly from ordinary étale lifting, DerivedModuleAlgebra §§1.1–1.5 and the enhanced suppliers; it does not import this layer. Thus the generalization here introduces no dependency from Part I back to HabiroRings.

For this layer B is any commutative ring, I⊂B an ideal, and D an étale B/I-algebra. Write E/IE for (B/I)⊗_B E, with its specified quotient/tensor identification. No Noetherian, nonzero-ring or finite-module assumption is implicit. “Étale” retains Mathlib's finite-presentation and formal-étaleness conditions. The hypotheses I finitely generated and f regular enter only where stated.

### 0.1 Marked étale deformations and their maps

Define a marked étale deformation of D over (B,I) to consist of an ordinary étale B-algebra E and an actual B/I-algebra equivalence ε:E/IE≃D. A morphism between such data with reductions D and D′ has an underlying B-algebra map g:E→E′; its reduced map is

    reduceMap_(ε,ε′)(g) = ε′ ∘ (id_(B/I) ⊗ g) ∘ ε⁻¹ : D → D′

The fibre over a fixed D uses morphisms whose reduced map is id_D. Retain the marking as data, rather than replacing it by a proposition that some equivalence exists. An object lift need not be unique before completion. The unit, split and localization examples below provide objects without any nilpotence assumption.

The API comprises:

- Package an existing étale B-algebra E and the supplied ε, without choosing another presentation.
- Expose the existing `Algebra.Etale B E` instance.
- Expose étaleness of E/IE and transport it through ε to D, using `Algebra.Etale.baseChange` and `.of_equiv`.
- For e:D≃D′ replace ε by e∘ε. The carrier and its B-action are those of E.
- The conjugated reduction displayed above, on the existing tensor-product carriers. Its definition does not require étaleness.
- With the same source and target marking, reduction of id_E is id_D.
- For g:E→E′ and h:E′→E″, reduction of h∘g is reduceMap(h)∘reduceMap(g), with the intermediate marking cancelled.
- E=B, D=B/I, with the tensor-unit marking.
- E=B×B, D=(B/I)×(B/I), with componentwise reduction. The presentation B[x]/(x²−x) maps x to (0,1), and the inverse sends (a,b) to a+(b−a)x. Its Jacobian 2x−1 satisfies (2x−1)²=1 in this quotient, also in characteristic two.
- For a∈B take E=B[1/a] and D=(B/I)[1/ā], marked by localization base change. An invertible or zero ā is allowed.

**Checks.**

- The unit lift has the unique B-algebra map into any other lift, and its marking identifies reduction with the B/I-structure map. For I=0 it is the ordinary unit algebra B.
- If B/I≠0, the split transposition sends (1,0) to (0,1). Even g=id_E reduces to this transposition if the target marking is swap∘ε and the source marking is ε. With the same marking on both sides it reduces to id. The marking determines both computations.
- For B=ℤ, I=0 and a=2, E=ℤ[1/2] is étale and is not finitely generated as a ℤ-module, although it has rank one: ℚ⊗_ℤℤ[1/2]≃ℚ. For a=0 the localization and its reduction are zero; for a a unit they recover the unit deformation. Replacing étale by finite étale would lose the first case.

*Needs:* `Algebra.Etale`, `.baseChange`, `.of_equiv`; `Algebra.TensorProduct.map`, `.map_id`, `.map_comp`; the existing quotient/tensor and localization base-change equivalences; the ordinary product algebra. The marked package and conjugated map, rather than the underlying ring and tensor structures, are the new interface. The object formulation is the datum used by Stacks §10.143, Lemma 10.143.10, tag [04D1], chapter PDF p.385; [Q], Theorem 2.9, pp.16–17, uses its completed principal specialization.

### 0.2 Existence over an arbitrary quotient ideal

`EtaleDeformation.exists_lift` states that for every B,I,D as above there exists an étale B-algebra E with a specified equivalence E/IE≃D. There is no finite-generation or nilpotence condition on I. This is an existence theorem about ordinary algebras, not uniqueness of their carriers.

Use a finite square Jacobian presentation of D, lift its equations to B, and invert the lifted determinant Δ. Equivalently adjoin y with yΔ−1=0; the enlarged Jacobian determinant is Δ², a unit in the resulting algebra. Reduction recovers the original presentation with its marking. All choices are permitted at this stage. The existing standard-smooth presentation API supplies the Jacobian criterion; the missing assembly is lifting the algebra object together with the marked reduction.

**Checks.**

- I=0 permits E=D with its specified B-action. For I=B, D must be zero, while E may be B or zero; uniqueness of uncompleted object lifts would already fail here.
- Over B=ℤ and I=(2), the algebra 𝔽₂[x]/(x²+x+1) lifts to ℤ[x]/(x²+x+1)[1/3]. The discriminant −3 is invertible, and reduction of 1/3 is 1.
- Over B=ℤ[t], I=(t), both B and B[1/(1−t)] lift D=ℤ. They are not isomorphic as B-algebras, since 1−t is a unit only in the latter. Their completed marked comparison belongs to §0.5.

*Needs:* §0.1; `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`; `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`; localization base change. Source: Stacks §10.143, Lemma 10.143.10, tag [04D1], chapter PDF p.385, including the determinant-inversion argument. The existing carrier `CommAlgCat B` expresses this target in Suggested.lean without defining a new category there.

### 0.3 Locally nilpotent reduction and marked rigidity

Import SchemeAndStackFoundations §0.23a, `universalHomeomorphismEtaleEquivalence`, for the locally nilpotent closed immersion Spec(B/I)→Spec(B). Section 0.2 supplies affine object lifts; full faithfulness of the imported scheme equivalence supplies their map bijection. With the contravariance of Spec reversed on both sides, its affine restriction gives invariance of ordinary étale algebras. The affine reduction adapter identifies this restriction with tensoring by B/I. Its marking transport has the same nilpotent specialization, and the marked rigidity equivalence is the unique equivalence inducing the identity on D; the composition law for marked equivalences follows from the imported map bijection. This transports the supplied theorem rather than proving topological invariance again.

For marked lifts the resulting bijection is `Hom_B(E,E′) ≃ Hom_{B/I}(D,D′)` and is given by the marked reduced map. Its identity and composition laws follow by cancelling the intermediate marking. No uniform exponent for I is assumed.

**Checks.**

- For B=ℤ/4, I=(2), D=𝔽₂, the unit deformation has a single marked self-map. The split reduced swap lifts to the split swap; it lies over a different reduced map from the identity.
- In B=𝔽₂[x₁,x₂,…]/(x₁²,x₂²,…), the ideal generated by all x_i is locally nilpotent but has no uniform nilpotence exponent: products of arbitrarily many distinct x_i survive. The theorem still applies. Finite-presentation descent and the idempotent argument cannot be replaced by a fixed Iᴺ=0 assumption.
- The B=ℤ[t], I=(t) example of §0.2 excludes rigidity for arbitrary ideals. For B=0 the two categories have only their zero algebra and the equivalence still holds.

*Needs:* §§0.1–0.2 (markings and affine object lifts); SchemeAndStackFoundations §0.23a (`universalHomeomorphismEtaleEquivalence`); Mathlib `AlgebraicGeometry.AffineScheme.equivCommRingCat` and affine quotient base change. Source: Stacks tag [0ALI], Lemma 15.11.2, for the affine formulation.

### 0.4 The ordinary completion of a marked lift

Now assume I is finitely generated, and fix a lift L=(E,ε) from §0.1. Define the completed lift W_L as the existing ordinary carrier

    W_L = AdicCompletion_(IE)(E) = lim_(n≥1) E/I^n E

It is an ordinary commutative B-algebra, complete and separated for IW_L, with its canonical map E→W_L. For every n≥1 there is a B/Iⁿ-algebra equivalence W_L/IⁿW_L≃E/IⁿE compatible with the completion unit, the quotient transition maps and the marking at n=1. In particular each quotient is étale over B/Iⁿ. Finite presentation as an algebra imposes no module-finiteness assumption on E or D; no flatness or ordinary étaleness of W_L over the completed base is asserted.

The API comprises:

- Reuse the existing completion ring instance, without defining a second ring structure.
- Reuse its B-algebra structure through E and the completion unit.
- The existing completion unit E→W_L as a B-algebra map.
- Ordinary `IsAdicComplete` for IW_L, with I finitely generated.
- The actual equivalence (B/I)⊗_B W_L≃D obtained from the first evaluation and ε; retain the compatible quotient equivalences for every n≥1.
- Reducing the completion unit and applying the reduction marking gives ε.
- The natural marked hom-set bijection of §0.5 for every ordinary I-complete B-algebra C.
- For g:D→D′, use the marked hom-set bijection with target W_M to obtain the unique W_L→W_M lifting g through the markings.
- The reduction of this map, conjugated by the two markings, is g.
- Lifting id_D between the same completed marked object gives id_W.
- Lifting h∘g gives map(h)∘map(g).
- For two chosen lifts of the same D, the map lifting id_D is an equivalence of completed B-algebras.
- This equivalence intertwines the two actual reduction markings.
- For three chosen lifts the comparisons compose to the comparison of the first with the third. Identity and inverse are its specializations.

For the quotient equivalences, apply `AdicCompletion.pow_smul_top_eq_ker_eval` to the original ideal IE and its n-th evaluation, then use surjectivity of that evaluation. The extended ideal (IE)ⁿW_L is IⁿW_L. At n=1, `AdicCompletion.ker_evalOneₐ_eq_map` supplies the ring form of the kernel statement. Finite generation of IE follows from that of I; `AdicCompletion.isAdicComplete` supplies ordinary completeness. Quotient/tensor base change and ε finish the marking. The maps and comparisons are proved in §0.5; they do not make the uncompleted choice E canonical.

**Checks.**

- For I=0, the completion unit is an equivalence and the marking identifies W_L with D as a B-algebra.
- For nilpotent I the quotient tower is eventually E, so the canonical E→W_L is an equivalence. This particular conclusion holds even when I is not finitely generated, by the eventually constant tower argument.
- The split lift completes to B̂_I×B̂_I. If B/I≠0 its reduced transposition moves (1,0), so the lifted transposition is not id. Changing a marking changes the corresponding map, as in the §0.1 Checks.
- For B=ℤ[t], I=(t), E=ℤ[t,1/2], the marked completion is ℤ[1/2][[t]], with t acting as the power-series variable. The element `Σ_{n≥0}tⁿ/2ⁿ` has unbounded coefficient denominators. It cannot lie in ℤ[[t]][1/2], since one fixed 2ᴺ would have to clear every coefficient. Localizing after completing is a different construction.
- For I=B, every quotient and W_L are zero; for D=0, IE=E and W_L=0 even if E≠0. A map from this zero algebra to a unital algebra exists only when that target is zero.

*Needs:* §§0.1–0.2; `AdicCompletion`, `.isAdicComplete`, `.eval_surjective`, `.pow_smul_top_eq_ker_eval`, `.ker_evalOneₐ_eq_map`; existing quotient/tensor equivalences and `Algebra.Etale.baseChange`. The power-series test uses the existing `MvPowerSeries.toAdicCompletionAlgEquiv`. Source application: [Q], Theorem 2.9, pp.16–17, first proof paragraph. The ordinary quotient and completeness assertions are imports from the pinned completion API, not new completion theory.

### 0.5 Maps into any ordinary complete target

For I finitely generated and L=(E,ε), the marked completed hom-set bijection states that for every ordinary commutative B-algebra C complete and separated for IC, marked reduction gives a natural bijection

    Hom_B(W_L,C) ≃ Hom_(B/I)(D, (B/I) ⊗_B C)

The forward map is (id⊗h)∘ε_W⁻¹, where ε_W is the marking of W_L. Naturality is covariant in C and contravariant in the reduced source D, with the maps of §0.4. These are all ordinary B-algebra maps: every such map sends Iⁿ into Iⁿ, so no additional continuity datum or bounded-denominator condition is imposed. C need not be étale or flat, and its reduction need not be étale. A reduced isomorphism implies that the lifted map is an isomorphism when both objects are completed étale lifts; it does not give that conclusion for an arbitrary C.

For the inverse, translate the reduced map into E→C/IC via ε. The existing `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` lifts it to E→C. Completeness includes separatedness, and `Algebra.FormallyUnramified.ext_of_iInf` makes this lift unique. Reduce the lifted map modulo each Iⁿ and use §0.4 to extend it over W_L/IⁿW_L. Compatibility gives a map W_L→lim C/IⁿC≃C, using `AdicCompletion.liftAlgHom` and `.ofAlgEquiv`. Conversely, any map W_L→C has these quotient maps, so the same uniqueness and separatedness prove injectivity. Identity, composition and the comparison laws in §0.4 follow by reducing them; lift an inverse to prove the marked equivalence.

`CompletedEtaleLift.mapUnique` in Suggested.lean is the equivalent statement with the reduced map given as E→C/IC before transport through ε. It asserts existence and uniqueness of the map out of the existing completion, rather than replanning the implemented lifting theorem out of E.

The completed mapping-space equivalence is the enhanced refinement for these same ordinary W_L and C: `Map_{CAlg(D(B))}(W_L,C)` is the discrete space on `Hom_{B/I}(D,C/IC).` The comparison of static algebra mapping spaces with ordinary algebra maps is [HA], §7.1.3, Definition 7.1.3.17 and Proposition 7.1.3.18, p.1219; compose it with the marked hom-set bijection. This uses the E1/E5 enhanced carriers, without identifying all animated commutative rings with E∞-algebras in positive characteristic.

**Checks.**

- For E=B, the hom-set contains only the completed structure map B̂_I→C, matching the unique B/I-algebra structure map into C/IC.
- The split identity and swap are distinguished by reduction at (1,0) when B/I≠0. For the two uncompleted lifts B and B[1/(1−t)] of §0.2, the completed comparison is an isomorphism: 1−t has the inverse Σtⁿ in ℤ[[t]].
- For B=ℤ, I=(2), W_L=ℤ₂ and C=𝔽₂, there is exactly one B-algebra map W_L→C. Its reduced map is an isomorphism, but the map itself is not. This rules out extending the marked equivalence to every ordinarily complete target with the same ordinary reduction.
- Dropping completeness fails already for E=B, C=ℤ and I=(2): a ℤ-algebra map ℤ₂→ℤ would send the inverse of 3 to an integer inverse of 3, which does not exist.

*Needs:* §§0.3–0.4; the four existing lifting, rigidity and completion declarations named in the proof, with their completeness/separatedness hypotheses; E1/E5 for the mapping-space equivalence. Stacks §15.11, Lemma 15.11.2, tag [0ALI], chapter PDF pp.28–29, supplies the nilpotent-level rigidity used in the quotient formulation; the complete hom-set statement is the assembly above. [Q], Theorem 2.9, pp.16–17, is its principal coefficient application.

### 0.6 Regular principal derived universality

Let f∈B act injectively on B, let D be étale over B/(f), and choose an ordinary étale lift L=(E,ε). Let W_L be the completion of L at (f). Then the regular-principal universality theorem states that W_L, regarded as an E∞-B-algebra, is static and derived f-complete, f acts injectively on W_L, and its actual derived reduction W_L⊗^L_B B/(f) is D with the prescribed marking. For any derived f-complete E∞-B-algebra C with an actual equivalence ε_C:C⊗^L_B B/(f)≃D, the space

    {e : W_L ≃ C | ε_C ∘ (e ⊗ᴸ_B B/(f)) = ε_W}

is contractible. The displayed equality means the homotopy fibre over the specified marking, including the comparison homotopy. No connectivity assumption is placed on C. The theorem implies that C is static and f-regular too. The B̂_(f)-algebra form follows from the unique complete-base action. It asserts no ordinary étaleness or flatness of W_L over B̂_(f), and requires neither Noetherianity nor finite-module hypotheses.

To prove it, E is flat over B because it is étale; hence f is regular on E. DerivedModuleAlgebra §§1.1–1.5's regular-principal ordinary/derived comparison identifies its derived completion with the ordinary tower E/fⁿE. This static surjective tower has static homotopy limit W_L. Its compatible quotients identify W_L/fⁿW_L with E/fⁿE. If fx=0 in W_L, regularity in E implies that the component of x at level n+1 is divisible by fⁿ, so every level-n component vanishes. Thus f is regular on W_L and its ordinary marked quotient is also its derived quotient.

For arbitrary C as in the theorem, the successive-power cofiber triangles express C/fⁿ as extensions of copies of the static C/f≃D. Induction makes every C/fⁿ static, with surjective transition maps. DerivedModuleAlgebra §§1.1–1.5's principal derived tower and the Milnor sequence then make C static, even without a prior bound on its homotopy. Here the Milnor sequence follows from E2:towers' product–difference formula and exact products of ordinary B-modules; surjectivity kills lim¹. The quotient long exact sequence makes f regular on π₀C. Its quotient tower is therefore ordinary, and π₀C is ordinarily f-complete. Apply §0.5 to the specified marking to get W_L→π₀C. Its reduced map is an equivalence; derived Nakayama on the complete underlying modules makes the map an equivalence. The completed mapping-space equivalence makes the mapping spaces discrete. Its reduced hom-set bijection leaves exactly one point in the marked comparison fibre, with no additional homotopies. This proves the claimed contractibility and the coherence under changes of the selected lift E.

**Checks.**

- For B=ℤ, f=2 and D=𝔽₂, W_L=ℤ₂. The static algebra 𝔽₂ is ordinarily 2-complete with the same ordinary quotient, but its derived reduction is the two-term complex [𝔽₂→⁰𝔽₂], with π₁=𝔽₂. It fails the derived marking hypothesis. The differential is zero on 𝔽₂, so 1 is a nonzero kernel element.
- For B=ℤ[t], f=t and D=ℤ[1/2], W_L=ℤ[1/2][[t]], including the unbounded-denominator series of §0.4. A split D has distinct identity and swap reduced maps; contractibility is asserted separately over each fixed marking.
- A unit f is regular and has B/(f)=0. Every derived f-complete C is zero, and the marked comparison fibre is contractible. For B=0, f=0 is regular in the injectivity convention and gives the same zero case.
- For f=0 on B=ℤ, regularity fails: the derived cofiber of zero on a nonzero static algebra is that algebra plus its suspension. Ordinary quotienting by zero would erase this obstruction. For D=0 and regular f the unique complete lift is zero, by derived Nakayama.

*Needs:* §§0.2, 0.4–0.5; `Algebra.Smooth.flat`; DerivedModuleAlgebra §§1.1–1.5 (the exact APIs in the supplier contract); EnhancedDerivedSheaves:E1, E2:towers (`derivedTowerLimit`), E5:abstract and E5:spectra-comparison (algebra limits, mapping spaces and the derived-module comparison). The extra content is the specified ordinary model, marked hom-set API and contractible comparison above. Sources: Stacks §15.93, Lemma 15.93.18, tag [0920], chapter PDF p.267, for the principal Koszul completion tower; [HA], Proposition 7.1.3.18, p.1219, for static algebra maps; [Q], Theorem 2.9, pp.16–17, for the coefficient application. The argument here states the general regular-principal consequence explicitly; [Q]'s displayed specialization alone is not a source for arbitrary B,I.

### Examples

The unit, split and localization deformations test the marking and the difference between étale and finite étale. The locally nilpotent infinite-variable example tests the absence of a uniform exponent. The two lifts over ℤ[t] test nonuniqueness before completion and canonical marked comparison afterwards. The unbounded-denominator series tests the order of localization and completion. Finally ℤ₂ and static 𝔽₂ distinguish derived reduction from ordinary reduction at the smallest residue characteristic.

### Dependencies

Existing ordinary étale, tensor-product, localization and adic-completion APIs; DerivedModuleAlgebra §§1.1–1.5 for principal derived completion and Nakayama; E1/E5 for the enhanced algebra interpretation and E2:towers for the coherent surjective limit. No Habiro coefficient construction, QW output, trace construction or Part II result is needed by this general layer. The specialized Part I §0.3 contract remains an earlier, independently proved supplier to Layers 4–5.


## Layer 1: Relative inputs

The relative constructions take a perfectly covered Λ-ring with an étale algebra. Perfect covers and the completed Frobenius are the QWittVectors §§2.3–2.4 and 6.1–6.3 interfaces specified under Exact supplier contracts; this layer fixes the category on which every later construction is functorial.

### 1.1 The category of relative inputs

Objects are perfectly covered Λ-rings A with an étale A-algebra R. An arrow consists of a Λ-map f:A→A′ and a ring map g:R→R′ satisfying `g∘ι_A=ι_{A′}∘f.` Identity and composition are those of ring maps, with the compatibility checked on the base. Twisted base change and prime completion are functorial for these arrows; completed Frobenius compatibility additionally requires gap:completed-frobenius-base-naturality.

This category is the domain of the stage functoriality of Layer 4 and of every construction after it. The arrow R→R′ may be more general than the base-change map R→R⊗_A A′; the stronger base-change formula of §5.6 assumes that precise tensor-product target. No global Λ-structure on R or R′ is part of an object.

*Needs:* [Adams data][r9]; [perfect covers][r19]; `Algebra.Etale`; `Algebra.Etale.baseChange`. Completed-Frobenius compatibility across bases requires gap:completed-frobenius-base-naturality; it is not part of the category definition.

See [Q], §2, opening paragraph, p.13; Appendix A, Theorem A.1, p.69.

The API comprises:

- A perfectly covered Λ-ring A with an étale A-algebra R.
- A Λ-map f on bases and a ring map g on algebras with g ∘ algebraMap = algebraMap ∘ f.
- The category structure, with Hom.id and Hom.comp componentwise.
- The Λ-map on bases.
- The ring map on algebras.
- The forgetful functor to Λ-rings.
- Base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map to a perfectly covered A'.

**Checks.**

- On toric ℤ[x], the ring automorphism f(x) = x + 1 is not a Λ-map: f(ψ^2(x)) = (x + 1)^2 = x^2 + 2x + 1 but ψ^2(f(x)) = x^2 + 1. So (f, f) is not a morphism of pairs (ℤ[x], ℤ[x]) → (ℤ[x], ℤ[x]), although it is a ring map over f.
- Morphisms (A, A) → (A', A') are exactly the Λ-maps A → A' (g = f is forced).
- Complex conjugation g on R = ℤ[i][1/2] gives a morphism (ℤ, R) → (ℤ, R); its 3-adic completion commutes with φ_3 (both are conjugation on ℤ_3[i]) without this being imposed.
- (ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x][i][1/2]) along the Λ-map ℤ → toric ℤ[x] is a morphism of pairs, and it is the base change of the first pair.

### Examples

The toric self-pair, the Gaussian coefficients and the localized cubic of the QWittVectors §§2.3–2.4 and 6.1–6.3 specifications distinguish perfect covering from global coefficient Frobenius; surjectivity of the toric Adams maps is unnecessary. Complex conjugation on ℤ[i][1/2] is a morphism of pairs whose completed Frobenius compatibility is automatic.

### Dependencies

QWittVectors §§1.1–2.1, QWittVectors §§2.3–2.4 and QWittVectors §§6.1–6.3 (Λ-rings, perfect covers and the completed Frobenius) and the existing étale APIs.

## Layer 2: Laurent conventions, ordinary comparison and spherical completion

The algebraic Habiro completion, its tensor and cyclotomic detection are the HabiroCohomologyFoundations §0.1 interfaces specified under Exact supplier contracts. This layer identifies them with the Laurent and scalar-restriction conventions used here, adds the localization resolution and the homotopy-module criterion, compares ordinary with derived completion on polynomial coefficient modules, and builds the spherical completion. Spherical coefficients retain all homotopy of the sphere. The solid statements additionally use the full light solid spectral contract stated above; boundedness and tower compatibility remain part of their hypotheses.

### 2.1 Habiro completion in the Laurent convention

For a commutative ring A write B_A=A[q] and `B_A^±=A[q^{±1}].` HabiroCohomologyFoundations §0.1 constructs the Habiro-complete subcategory of D(B_A) and its reflection L_H. Prove that the Laurent and polynomial conventions agree. Every complete B_A-module M has q acting invertibly: M≃lim_N M/P_N by the two tower formulas, and for N≥1 the element q is a unit of A[q]/(P_N) because P_N has constant coefficient 1. Since B_A→B_A^± is a localization, restriction identifies D(B_A^±) with the full subcategory of D(B_A) on which q acts invertibly. Hence restriction identifies the Habiro-complete B_A^±-modules, those with `RHom_{B_A^±}(R_r⊗^L_ℤA,M)=0,` with the complete B_A-modules of §0.1, and it commutes with L_H. On such modules `M⊗^L_{B_A}N≃M⊗^L_{B_A^±}N,` because `B_A^±⊗^L_{B_A}B_A^±≃B_A^±.` In particular `A[q]^∧_H≃A[q^{±1}]^∧_H:` the cofiber `A[q^{±1}]/A[q]` is q-power torsion, every f_m acts on it invertibly, and L_H kills it.

Restriction of scalars along ℤ[q]→A[q] also commutes with L_H and detects completeness. Indeed `S⁻¹A[q]=S⁻¹ℤ[q]⊗_{ℤ[q]}A[q],` so the fiber of A[q]→S⁻¹A[q] is the base change of the integral fiber C_ℤ, and `RHom_{A[q]}(C_ℤ⊗^L_{ℤ[q]}A[q],M)≃RHom_{ℤ[q]}(C_ℤ,M).`

The localization R_r is an ordinary ring with an explicit presentation. It is the localization of `ℤ[q^{±1}]` at the submonoid generated by the qᵐ−1, equivalently at all Φ_d(q): each qᵐ−1 is the product of its cyclotomic factors, and each Φ_d divides q^d−1. A derived f_m-complete object is Habiro-complete, since RHom(R_r,M) is then f_m-complete with f_m acting invertibly, hence zero. Complete objects are closed under limits, fibers and shifts, being a right orthogonal class. The fiber of the unit M→L_HM is RHom(R_r⊗A,M), an R_r⊗A-module, so L_HM≃0 exactly when M is an R_r⊗A-module. These are statements about the supplier's reflection; no second completion functor is defined.

*Needs:* HabiroCohomologyFoundations §0.1 (the enhanced reflection, the two tower formulas); DerivedModuleAlgebra §§1.1–1.5; EnhancedDerivedSheaves Layer E0; EnhancedDerivedSheaves Layer E1; `IsLocalization`; `LaurentPolynomial`; `Polynomial.cyclotomic`; `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

See [Q], Appendix B, B.1, p.77; §3, Theorem 3.11(a), p.25.

The API comprises:

- Rr, with IsLocalization for the submonoid of LaurentPolynomial ℤ generated by the q^m − 1.
- Rr is also the localisation at all Φ_d(q), d ≥ 1.
- A derived `A[q^{±1}]-module` M is Habiro-complete precisely when `RHom_{A[q^{±1}]}(Rr` ⊗^L A, M) ≃ 0. By the polynomial/Laurent completion comparison this is completeness of the restriction to A[q] in the sense of HabiroCohomologyFoundations §0.1.
- q acts invertibly on every Habiro-complete A[q]-module; restriction along A[q] → `A[q^{±1}]` identifies the two complete subcategories and their completed tensor products, and commutes with L_H. In particular A[q]^∧_H ≃ `A[q^{±1}]^∧_H` and q is a unit in A[q]^∧_H.
- Completeness over `A[q^{±1}],` or over A[q], is completeness of the underlying `ℤ[q^{±1}]-module,` and restriction along ℤ[q] → A[q] commutes with L_H.
- A derived (q^m − 1)-complete object is Habiro-complete.
- Habiro-complete objects are closed under limits, fibres and shifts.
- L_H M ≃ 0 iff M is an Rr ⊗ A-module; the fibre of the unit M → L_H M is RHom(Rr ⊗ A, M).
- On `Hℤ[q^{±1}]-modules,` restriction to spherical coefficients commutes with completion. The derived tensor comparison is `Hℤ[q^{±1}]-relative,` followed by completion; restriction to ℛ itself is lax monoidal.

**Checks.**

- Rr^∧_H ≃ 0, since q^m − 1 is a unit on Rr and so Rr/(q^m − 1) ≃ 0 for every m; and Rr is not Habiro-complete (RHom(Rr, Rr) contains the identity). A definition that confused completion with inverting the q^m − 1 would return Rr.
- ℤ[[q − 1]] = `ℤ[q]^∧_{(q−1)}` is Habiro-complete: it is derived (q − 1)-complete and q − 1 acts invertibly on Rr.
- `ℤ[q^{±1}]^∧_H` is not ℤ[[q − 1]]: modulo Φ_2(q) = q + 1, ℤ[[q − 1]]/(q + 1) ≅ ℤ[[t]]/(t + 2) ≅ ℤ_2 (t = q − 1), whereas `ℤ[q^{±1}]^∧_H/(q` + 1) ≅ ℤ (by the factorial-tower description: on π_0 the tower is constantly ℤ[q]/(q + 1) = ℤ, and on π_1 its transition maps are multiplication by 1 − `(−1)^{n+1}` ∈ {0, 2}, so its limit and lim^1 vanish).
- q·(1 + q − q^2) − 1 = −(q;q)_2 = −(1 − q)(1 − q^2), so q is invertible in ℤ[q]/((q;q)_2), a stage of the completion, with inverse 1 + q − q^2. This is the polynomial-side reason for the Laurent comparison.
- `ℤ[q^{±1}]` is not Habiro-complete: the element `Σ_{n ≥ 0}` (q;q)_n of lim_N ℤ[q]/(q;q)_N is not the image of a Laurent polynomial f, since otherwise q^s f − q^s `Σ_{k<N}(q;q)_k,` of degree below N(N+1)/2 = deg (q;q)_N for N large, would be divisible by (q;q)_N and hence zero for all large N, forcing (q;q)_N = 0.
- Rr ⊗ ℤ[[q − 1]] ≠ 0 (it contains ℤ((q − 1)), where q − 1 is inverted) although ℤ[[q − 1]] is complete, while (Rr ⊗ ℤ[[q − 1]])^∧_H ≃ 0: the smashing localisation Rr ⊗ − and Habiro completion are complementary.
- For A = ℤ, q kills the class of `q^{−1}` in `ℤ[q^{±1}]/ℤ[q]` and acts locally nilpotently on the whole cofiber, so every q^m − 1 acts on it as −1 plus a locally nilpotent operator, hence invertibly; for example (q − `1)·(−q^{−1})` ≡ `q^{−1}.` Thus L_H(ℤ[q]) → `L_H(ℤ[q^{±1}])` is an equivalence, although ℤ[q] → `ℤ[q^{±1}]` is not.
- For A = 𝔽_2 and M = 𝔽_2 with q acting as 1, M is complete over 𝔽_2[q] and its underlying ℤ[q]-module is complete. Both derived quotients by q − 1 are 𝔽_2 ⊕ Σ𝔽_2: restriction changes neither completeness nor derived reductions by elements of ℤ[q].

### 2.2 A free resolution of the rational localization

`LaurentLocalization.Coeff` is B=ℤ[q,q⁻¹]. Define `LaurentLocalization.factor` by i↦1−qⁱ⁺¹, `LaurentLocalization.denominators` as the multiplicative closure of these factors, and `LaurentLocalization.factorial` by P₀=1 and P_(i+1)=P_i(1−qⁱ⁺¹), valued in that submonoid. `LaurentLocalization.differential` and `LaurentLocalization.augmentation` are the B-linear maps below on the native free module ℕ→₀B and localization at that submonoid. The theorem `LaurentLocalization.free_resolution` states injectivity of the differential, equality of its range with the augmentation kernel, and surjectivity of the augmentation: a length-one free resolution of R_r over B with differential on the direct-sum generators

    d((a_i))_i = a_i − (1−q^i) a_(i−1),  a_(−1)=0

and augmentation (a_i)↦Σ_i a_i/P_i. On basis elements this is `d(e_i)=e_i−(1−q^{i+1})e_{i+1},` so the augmentation of d(e_i) vanishes. Injectivity follows by looking at the smallest nonzero coefficient of a finite-support element. The cokernel is colim_i B with transition `1−q^{i+1},` mapped to B[P_i⁻¹ | i≥0] by a↦a/P_i. Every finite product of the factors 1−qʲ, with repetitions, divides some P_N: assign each occurrence a distinct sufficiently large multiple of its index, and use `1−qʲ∣1−q^{kj}.` Thus the fractions a/P_i exhaust the localization; identifying the units alone would not establish this cofinality.

Applying Hom turns the resolution into a map of products. It computes RHom(R_r,−), showing that its Ext groups on static modules occur only in degrees 0 and 1. The augmentation uses inverse q-factorials; using P_i itself would not satisfy the relation.

*Needs:* [§2.1][r29]; HabiroCyclotomicCompletions §1.4; EnhancedDerivedSheaves Layer E1.

See [Q], Appendix B, proof of Lemma B.2, pp.77–78; the displayed differential uses the adjacent factor 1−qⁱ⁺¹ so that the augmentation vanishes, in place of the cumulative factorial printed there.

The API retains each factor as an element of the denominator monoid, the recursive factorial products, and the two B-linear maps with the displayed basis formulas. The resolution identifies their exact sequence with the localization at all positive cyclotomic factors.

**Checks.**

- The coefficient ring contains q·q⁻¹=1, the coefficient of q⁻¹ in q⁻¹ is 1, and q⁻¹−1≠0, whereas q has no polynomial inverse in ℤ[q]. The positive factors start with 1−q and 1−q²; an index-zero factor would be 0 and would collapse the localization.
- P₀=1, P₁=1−q and P₂=(1−q)(1−q²) in the submonoid. The element 1−q³ has coefficient −1 at q³ and is nonzero, as is every generator. The submonoid contains 1 and P₂ and excludes 0 since ℤ[q,q⁻¹] is a domain. Replacing its multiplicative closure by the generator set would omit the identity and repeated factors.
- The square (1−q)² divides P₂ with quotient 1+q. Repeated factors are allowed in the multiplicative closure; the set of individual generators alone is not a submonoid.
- The augmentation sends e₀ to 1, e₁ to 1/(1−q) and e₂ to 1/((1−q)(1−q²)); multiplication by the corresponding P_i gives 1 in all three cases. Using P_i rather than its inverse fails already at i=1.
- For i=0, d(e₀)=e₀−(1−q)e₁ has augmentation 1−(1−q)/P₁=0. A plus sign would give 2.
- At i=2 the differential is e₂−(1−q³)e₃, so the coefficients at indices 0 and 1 are zero; its first occupied coefficient is 1. A backwards shift would have a coefficient at index 1.
- For i=1, the two augmentation terms are 1/P₁ and (1−q²)/P₂=1/P₁. Replacing 1−q² by P₁ breaks this equality.
- On input 2e₁+3e₂, the first occupied coefficient of the differential is 2 at index 1; on 0 it is 0. The augmentation sends e₀ to 1 and e₁ to 1/(1−q), excluding a zero augmentation. These computations fix the free-module maps without a boundedness hypothesis on a later derived module.
- In the Laurent coefficient ring, q⁻¹ has exponent −1 and coefficient 1 there, whereas a polynomial supported in nonnegative exponents has coefficient 0 there. This distinguishes the coefficient carrier from ℤ[q].
- The Laurent element q⁻¹−1 is nonzero, with coefficients 1 at −1 and −1 at 0. Specializing q to 1 would lose this distinction and collapse every positive denominator.
- The factor at i=0 is 1−q, with constant coefficient 1 and q-coefficient −1; starting at exponent zero would give the zero element.
- The factor at i=1 is 1−q², with zero q-coefficient. The factor at i=2 is 1−q³, with q³-coefficient −1; replacing the index by its predecessor gives the wrong occupied exponent in each case.
- The denominator monoid contains the empty product 1. The generator set alone does not, since every positive factor vanishes at q=1.
- The denominator monoid contains (1−q)², whose multiplicity at q=1 is two, and excludes 0. These tests distinguish its multiplicative closure from both the set of single factors and a monoid obtained by admitting exponent zero.
- The factorial at n=0 is 1, so its associated localization fraction is 1; an empty-product value 0 would collapse the augmentation.
- The factorial at n=1 is 1−q. The factorial at n=2 is 1−q−q²+q³, with degree three rather than two; multiplying by 1−q at every step would fail this test.
- The augmentation of 0 is 0. At q=2, its values on e₁ and e₂ are −1 and 1/3, while the corresponding factorials are −1 and 3; multiplication gives 1 in both cases. The specialization is legal since every positive factor 1−2ʲ is nonzero.
- At q=2 the differential of e₂ is e₂+7e₃. Its augmentation is 1/3−7/21=0, which excludes both a reversed shift and the cumulative-factor coefficient.

### 2.3 Completeness of homotopy modules

M is Habiro-complete if and only if every π_n(M) is complete as an ordinary B-module, in the sense Hom_B(R_r,π_n M)=Ext¹_B(R_r,π_n M)=0. The two-term resolution gives, for every integer n,

    0 → Ext¹_B(R_r,π_(n+1) M) → π_n RHom_B(R_r,M) → Hom_B(R_r,π_n M) → 0

Use the homological dimension bound and convergent Postnikov truncations to obtain the equivalence even for unbounded M. A proof must retain both Hom and Ext¹; vanishing of just Hom is insufficient. The enhanced t-structure and its convergence are imported, rather than inferred from an ordinary triangulated-category API.

*Needs:* [§2.1][r29]; [§2.2][r30]; HabiroCohomologyFoundations §0.1 (the enhanced reflection, cyclotomic detection); EnhancedDerivedSheaves Layer E1.

See [Q], Appendix B, Lemma B.2(d) and proof, pp.77–78.

### 2.4 Ordinary and derived completion of polynomial coefficient modules

For any commutative ring B and B-module M, put N=M[q,q⁻¹]=B[q,q⁻¹]⊗_B M, regarded as a complex concentrated in degree zero. Prove the ordinary/derived comparison: the canonical comparison identifies L_HN with the static object associated to HC's ordinary full cyclotomic module completion `M[q]^{ℕ_{>0}}.` The equivalence is B[q,q⁻¹]-linear, natural for every B-linear map of coefficient modules, and commutes with all finite quotient projections. Neither flatness of M nor integer torsion-freeness of B or M is required.

For each positive m, multiplication by qᵐ−1 on N is injective. A nonzero finite Laurent sum has a largest occupied exponent j; the coefficient of `q^{j+m}` in its product by qᵐ−1 is the unchanged coefficient at j. This proves `OrdinaryDerivedComparison.laurent_regular` without dividing by an integer. Each P_n is a product of such regular factors. Consequently the derived cofiber N/P_n is the ordinary quotient in degree zero. For n≥1, monic division and the unit constant coefficient identify this quotient with the direct sum of n(n+1)/2 copies of M, represented by exponents 0 through n(n+1)/2−1. The sign (−1)^n in the leading coefficient of P_n changes no ideal or quotient.

The maps `N/P_{n+1}→N/P_n` are the natural surjective quotient maps. Their countable tower has vanishing first derived inverse limit; hence its derived limit is static and its zeroth homotopy is the ordinary inverse limit. Apply the reflection and tower formula of HabiroCohomologyFoundations §0.1 (the enhanced reflection, the two tower formulas), in the Laurent convention of §2.1, and HC's cofinal factorial presentation to obtain the comparison. Construct it from the finite quotient maps, so naturality and projection compatibility follow from those maps rather than from a choice of quotient bases. This argument concerns polynomial coefficient modules; it does not identify derived completion with ordinary completion on arbitrary B[q,q⁻¹]-modules.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (the enhanced reflection, the two tower formulas); HabiroCyclotomicCompletions Layer 1 (cofinal factorial and divisibility presentations); HC Layer 2 §2.3 (polynomial/Laurent comparison); HC Layer 5 §5.1 (ordinary completion of polynomial coefficient modules); EnhancedDerivedSheaves Layer E1 (the countable derived-limit exact sequence). The ordinary exactness and arbitrary-module boundary remain with HC; no cohomological or trace comparison is an input.

The source is [Q], Appendix B, Lemma B.2(c), p.77, for the derived factorial tower, together with Kazuo Habiro [Hab], §7.1, Proposition 7.1 and the following Laurent comparison, pp.1141–1142, and §7.3, p.1144, for ordinary coefficient modules. The regularity and surjective-tower argument above derive the comparison from these inputs; it is not a claim that those passages separately state the whole comparison theorem.

The API comprises:

- `OrdinaryDerivedComparison.laurent_regular`: Multiplication by qᵐ−1 is injective on B[q,q⁻¹]⊗_B M for m>0, for every B-module M.
- The natural B[q,q⁻¹]-linear equivalence from L_H(M[q,q⁻¹]) to the static ordinary completion `M[q]^{ℕ_{>0}}.`
- The induced zeroth-homotopy isomorphism is the ordinary inverse-limit comparison, and all other homotopy modules vanish.
- For every n≥1, the composite of the comparison with the ordinary projection to M[q]/P_n equals the derived tower projection followed by its canonical static quotient identification.
- For every B-linear f:M→M′, completing f[q,q⁻¹] and then comparing equals comparing first and then applying HC's ordinary completed coefficient map. Identity and composite maps obey the same equality.

**Checks.**

- M=0 gives zero at every stage and in both limits. At the auxiliary empty factorial index P₀=1 the quotient is also zero; this does not replace the cofinal positive-index tower by a constant zero tower.
- For B=M=ℤ the comparison is the classical integral Habiro ring, with the actual finite projections. It agrees with the nonspherical unit, not with the entire spherical completion retaining stable homotopy.
- Take B=ℤ and M=ℤ/2ℤ, or equivalently B=M=𝔽₂. Although q²−1=(q−1)² in characteristic two, it is injective on the Laurent coefficient module. The P₁ and P₂ quotients have respectively one and three copies of 𝔽₂, and the completion is static. The coefficient of q in (q−1)·1 is one; this is a polynomial coefficient calculation, while Suggested.lean states the general regularity milestone.
- m=0 is excluded: q⁰−1=0 and its multiplication map is not injective on 𝔽₂[q,q⁻¹]. This negative control detects a dropped positivity hypothesis.
- An arbitrary module cannot be substituted for M[q,q⁻¹]. On the nonzero module 𝔽₂ with q acting as 1, the derived cofiber of q−1 is 𝔽₂⊕Σ𝔽₂, whereas its ordinary quotient is just 𝔽₂. Specializing q before taking a derived quotient loses the regularity used above.
- The coefficient reduction ℤ→ℤ/2ℤ commutes with the comparison and each projection. No claim that an arbitrary tensor product commutes with the inverse limit is needed for this naturality square.

### 2.5 The completed tensor: Laurent form and coefficient base change

The completed tensor is that of HabiroCohomologyFoundations §0.1, M⊗̂_HN=L_H(M⊗^L N) with unit L_H(B); by §2.1 it may be computed over A[q] or over `A[q^{±1}].` Prove its compatibility with change of coefficients. For a ring map A→A′, the functor `M↦L_H(M⊗^L_{A[q]}A′[q])` from complete A[q]-modules to complete A′[q]-modules is left adjoint to restriction, sends L_H(A[q]) to L_H(A′[q]), and is symmetric monoidal for the completed tensors. The fiber of M→L_HM is an S⁻¹A[q]-module, so its base change is an S⁻¹A′[q]-module and L_H kills it. This gives `L_H(L_HM⊗^L_{A[q]}A′[q])≃L_H(M⊗^L_{A[q]}A′[q]),` and with the tensor formula of §0.1 the monoidal comparison and its coherences. Composites A→A′→A″ compose up to the canonical equivalence.

Base change of complete objects is completed. The ordinary derived tensor of two complete objects need not be complete, flatness of A′ over A removes Tor but not the completion, and derived Tor remains visible at finite cyclotomic stages. A useful calculation is that suitable quotients at q²−1 and q³−1 have tensor product ℤ⊕Σℤ at their common root, rather than just ℤ. This prevents an underived quotient convention from concealing the monoidal issue.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (the enhanced reflection, the completed tensor); EnhancedDerivedSheaves §E5:abstract; EnhancedDerivedSheaves Layer E1.

See [Q], Appendix B, B.1, p.77; §2.1, Setup 2.1(c), p.13; [HA], §2.2.1, Proposition 2.2.1.9, p.197.

The API comprises:

- For a ring map A → A′, M ↦ L_H(M `⊗^L_{A[q]}` A′[q]) is left adjoint to restriction of complete modules, symmetric monoidal for ⊗̂_H with unit L_H(A[q]) ↦ L_H(A′[q]), and compatible with composites of coefficient maps.

**Checks.**

- For A = ℤ the unit is lim_N ℤ[q]/((q;q)_N), in which q is a unit (q·(1 + q − q^2) ≡ 1 mod (q;q)_2 at the second stage); it is not `ℤ[q^{±1}]` (not_isHabiroComplete_laurent).
- ℤ[q]/(q^2 − 1) ⊗̂^L_H ℤ[q]/(q^3 − 1) ≃ ℤ ⊕ Σℤ: π_0 = ℤ[q]/(q^2 − 1, q^3 − 1) = ℤ[q]/(q − 1) and π_1 = ker(q − 1 on ℤ[q]/(q^2 − 1)) = ℤ·(1 + q); both are killed by q^2 − 1, so no completion correction occurs, but the derived Tor_1 must be kept. An underived definition would lose π_1.
- H `⊗^L_{ℤ[q^{±1}]}` H is not Habiro-complete for the Habiro ring H: its completion is H (both sides are ℤ[q]/((q;q)_n) modulo (q;q)_n), but the multiplication H ⊗ H → H on π_0 is not injective, since x ⊗ 1 − 1 ⊗ x ≠ 0 for any x ∈ H outside ℚ(q) (H is an uncountable domain, HabiroCyclotomicCompletions Layer 4).
- For the identity of A the base change is naturally the identity of the complete category; for A′ = 0 it is the zero functor.
- For the flat map ℤ → ℤ[t], the base change of the Habiro ring is L_H(ℤ[t][q]), which contains `Σ_{n ≥ 0}` P_n(q) t^n. The ordinary tensor H ⊗_ℤ ℤ[t] = H[t] has bounded t-degree and does not, so completion is not removed by flatness.

### 2.6 Spherical cyclotomic localization

Let ℛ=𝕊[ℤ]. Form ℛ_r by the telescope that inverts each 1−qⁱ, equivalently the E∞ localization at all cyclotomic factors. It is an idempotent ℛ-algebra and has π₀=R_r. Its fiber over ℛ is Σ⁻¹colim_n ℛ/P_n, with the quotient maps induced by factorial divisibility. This is a statement in ℛ-modules, retaining all spherical homotopy.

In particular ℛ_r is not replaced by the Eilenberg–Mac Lane spectrum of R_r. The two-term algebraic resolution is an explanation of its π₀-level calculation, not a definition that discards the higher homotopy of the sphere.

*Needs:* BordismFormalGroups §F6.5; GeneralizedCohomology §§G2.1–G2.7; EnhancedDerivedSheaves §E5:abstract.2 (`commutativeAlgebras`); EnhancedDerivedSheaves §E5:abstract.2 (`moduleObjects`); HabiroCyclotomicCompletions §1.4; EnhancedDerivedSheaves §E5:abstract.

See [Q], Appendix B.1 and proof of B.2, printed/PDF p.77.

The API comprises:

- The commutative R-algebra T with its unit R→T.
- For a commutative R-algebra B in which every q^m−1, m≥1, is invertible, the space of R-algebra maps T→B is contractible; otherwise it is empty.
- Multiplication by q^m−1 on T is an equivalence for every m≥1.
- The multiplication T⊗_R T→T is an equivalence of commutative R-algebras.
- Fib(R→T) ≃ `Σ^{-1}colim_{n≥1}R/P_n` with transition multiplication by `1−q^{n+1}.`
- π_kT ≅ `π_kR[{(q^m−1)^{-1}}_{m≥1}],` naturally as Z[q±1]-modules.

**Checks.**

- Π_0T ≅ Rr as Z[q±1]-algebras.
- The first transition R/P_1→R/P_2 is induced by 1−q², so P_2=P_1(1−q²).
- T⊗_R(R/(q^m−1)) ≃ 0 for every positive m.
- Its zeroth homotopy is R_r, while its higher groups retain localized stable homotopy of the sphere; replacing it with H(R_r) erases this distinction.

### 2.7 Spectral completion and its unit

For an ℛ-module M, define L_HM=RHom_ℛ(fib(ℛ→ℛ_r),M). The fiber triangle gives the localization–completion adjunction, the equivalent formula lim_n M/P_n, and idempotence. Set S_H=L_Hℛ. Complete modules carry the localized symmetric monoidal product, and their unit is S_H.

The comparison with derived modules over an Eilenberg–Mac Lane ring is symmetric monoidal when tensors are relative to that ring. Restricting such modules along `ℛ→Hℤ[q^{±1}]` gives a lax monoidal functor, not a strong monoidal identification of all spherical modules with complexes. The statement uses actual spectra, module categories, internal Hom and coherent monoidal localization from the named suppliers.

*Needs:* [§2.6](#26-spherical-cyclotomic-localization); EnhancedDerivedSheaves §E5:abstract; EnhancedDerivedSheaves Layer E3; BordismFormalGroups §F6.5 (monoidal structures); GeneralizedCohomology §§G2.1–G2.7; EnhancedDerivedSheaves Layer E5:spectra-comparison (`symmetricSpectra_equiv_spectra`); DerivedModuleAlgebra §§1.1–1.5; [§2.2][r30]; [§2.3][r33]; HabiroCohomologyFoundations §0.1 (the enhanced reflection, the two tower formulas, cyclotomic detection); HabiroCyclotomicCompletions §1.4; EnhancedDerivedSheaves §E5:abstract.

See [Q], B.1–B.5, printed/PDF pp.77–79; [HA], Proposition 2.2.1.9, printed p.197; [HA], Theorem 7.1.2.13, printed p.1212.

The API comprises:

- M↦L_HM with a natural unit η_M:M→L_HM and SH=L_HR.
- L_HM ≃ `lim_{n≥1}M/P_n,` with transition induced by P_n ∣ `P_{n+1}.`
- For complete N, Map_R(L_HM,N)→Map_R(M,N) is an equivalence.
- `η_{L_HM}` and L_H(η_M) are equivalences, agreeing under the reflection coherence.
- The tensor on C_H is L_H(M⊗_RN); its unit is SH, with associativity, unit and symmetry inherited via monoidal localization.
- `0→Ext¹_{Z[q±1]}(Rr,π_{k+1}M)→π_kRHom_R(T,M)→Hom_{Z[q±1]}(Rr,π_kM)→0,` naturally in M and k∈Z.
- M is complete iff each π_kM is complete in the algebraic Hom/Ext¹ criterion.
- If M is complete and M/Φ_m=0 for every positive m, then M=0.
- For complete M and k∈Z, π_k(M/Φ_m)=0 for all positive m implies π_kM=0.
- Under `Mod_{HZ[q±1]}≃D(Z[q±1]),` restriction along R→HZ[q±1] commutes with L_H, the algebraic side being the reflection of HabiroCohomologyFoundations §0.1 in the Laurent convention of §2.1. The tensor comparison uses the HZ[q±1]-relative tensor followed by completion; restriction to R-modules is only lax monoidal.
- For an R-linear map u:M→N, L_H(u):L_HM→L_HN is the induced map between the reflections.
- `L_H(id_M)=id_{L_HM},` with the canonical functor coherence.
- L_H(v∘u)=L_H(v)∘L_H(u), coherently for composable R-linear maps.
- L_H(u)∘η_M=η_N∘u for every R-linear u:M→N.

**Checks.**

- L_H0≃0.
- L_HT≃0 although π_0T=Rr≠0; localization and completion are different functors.
- `η_{R/(q−1)}` is an equivalence; its homotopy groups are complete because 1−q acts by zero.
- L_H(HZ[q±1]) ≃ H(H), where H is HabiroCyclotomicCompletions Layer 1’s classical integral Habiro ring. Surjective transition maps and finite-free polynomial quotients eliminate higher derived limits in this case.

### 2.8 Complete solid modules and the discrete embedding

In light solid condensed spectra, define completeness by the same localization orthogonality and form completion with the quotient tower. The functor from complete ordinary spectra is M↦L_H(discrete M); evaluation at the point is its right adjoint and recovers M. Hence this completed discrete functor is fully faithful. Ordinary discreteness alone need not preserve an inverse-limit completion.

This construction assumes a stable presentable category of light solid hypersheaves, spectral module objects, solid tensor, internal Hom, evaluation at the point, and the relevant limit and localization compatibilities. Mathlib's light condensed modules do not supply those assumptions. Coproducts here are condensed coproducts followed by completion, not arbitrary algebraic direct sums declared complete.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (the enhanced reflection); SolidAnalyticRings §§1.1–2.4 and 3.1–3.4 (the spectral and split-tower contracts above); VStackSheavesAndLisseCategories §VS2.1 (abelian comparison only); EnhancedDerivedSheaves §E5:abstract.

See [Q], Appendix B, B.6–B.7, p.79.

Meyer–Wagner [MW], §4.1, 4.1, pp.41–42, gives the null-sequence definition and symmetric monoidal solidification in light condensed spectra. It supplies this ambient comparison, rather than the additional Habiro tower and bounded-below resolution contract used here.

The API comprises:

- Habiro-completeness in `Mod_{S[q^{±1}]}(Sp■).`
- Condensed Habiro completion lim_n (−)/(q;q)_n in `Mod_{S[q^{±1}]}(Sp■).`
- The functor M ↦ (M̲)^∧_H.
- The completed discrete functor is fully faithful.
- Evaluating the completed discrete image of M at the point gives M for Habiro-complete M.

**Checks.**

- ToSolid(S_H) = S_H ≃ lim_n `S[q^{±1}]/(q;q)_n,` each stage a finite direct sum of copies of S (rank n(n+1)/2, the degree of (q;q)_n).
- For M killed by a power of some q^m − 1 (for example ℤ[q]/(q − 1) = ℤ), toSolid(M) is the discrete condensed spectrum M̲: no completion occurs.
- The discrete condensed spectrum of `⊕_{n ∈ ℕ}` S_H is not Habiro-complete in Sp■; toSolid applied to (⊕_n S_H)^∧_H is its condensed completion `colim_{f → ∞}` ∏_n `(q;q)_{f(n)}` S_H, not the discrete sum.

### 2.9 Solid idempotence of the unit

Under the solid product/tower and balanced-tensor comparison inputs, the multiplication S_H⊗^■_ℛ S_H→S_H is an equivalence. Reduce to finite quotients: S_H/P_n is a finite direct sum of d_n=n(n+1)/2 spheres. Indeed (−1)^nP_n is monic of degree d_n and its constant coefficient is a unit, so polynomial and Laurent quotients have the same finite basis. The argument concerns the whole spectral module, not only its π₀.

The polynomial representatives split the quotient tower as 𝕊-modules; these splittings are not asserted to be ℛ-linear. Apply the supplied solid product formula to the double tower in independent q₁,q₂, and then use derived relative base change identifying q₁=q₂ to obtain the ℛ-balanced tensor statement. The light solid compact generator is Null_R=R⊗^■∏_ℕ𝕊. Its existence motivates the comparison but does not by itself prove that tensor commutes with the required towers; that compatibility is a separate hypothesis.

*Needs:* [§2.7][r36]; [§2.8][r37]; EnhancedDerivedSheaves §E5:abstract.2 (`moduleObjects`); HabiroCyclotomicCompletions §1.4; EnhancedDerivedSheaves §E5:abstract; HabiroCyclotomicCompletions Layer 1.

See [Q], proof of B.8, pp.79–80; [T], numbered paragraph 5.3 within §5.1, printed p.86 (PDF p.90), for Null_R.

The API comprises:

- Under the light solid product/tower and balanced-tensor supplier contract, S_H⊗^■_ℛ S_H≃S_H as commutative algebra objects, with the multiplication as comparison.

**Checks.**

- At n=1, ℛ/P₁ is one sphere; at n=2 it has three sphere summands. A rank n formula would fail at the second stage.
- The unit law is the ℛ-balanced multiplication S_H⊗^■_ℛS_H→S_H. An absolute tensor has two independent variables and is not this comparison.
- After reduction by P_n the multiplication comparison is the finite free quotient with q₁=q₂. Polynomial representatives split over the sphere, without an ℛ-linear splitting claim.

### 2.10 Completed sums of countable products

For countable sets I_n, allowing empty and finite sets, set `F_I=⊕_n∏_{i∈I_n}S_H` and C_I=L_HF_I. Put J_r=fib(S_H→S_H/P_r), with its specified map to S_H, and J₀=S_H. For proper functions f:ℕ→ℕ, meaning f(n)→∞, there is a natural equivalence

    C_I ≃ colim_f ∏_n ∏_(i∈I_n) J_(f(n))

The profile poset is filtered but not ω₁-filtered, as the family f_k(n)=max(n−k,0) in §2.11 shows. The order on profiles is reverse pointwise order; an arrow f→g has f(n)≥g(n), and its maps are the corresponding ideal inclusions. The J_r are fiber objects and multiplication maps, not subsets of a spectrum.

The equivalence describes factorial decay in the block index and is natural for the specified finite-support block maps. The family constantly equal to 1 is not decaying; a family weighted by P_n is. The countable product and completion contracts are hypotheses of this spectral assertion. Bosco's abelian null-family formula supplies its model, not a proof for arbitrary light solid spectra.

*Needs:* [§2.9][r38]; [§2.8][r37]; HabiroCyclotomicCompletions §1.3; EnhancedDerivedSheaves §E5:abstract; [§2.7][r36].

See [Q], Proof of B.8, printed/PDF p.80, completed sum formula; [Bosco], Lemma A.4 and its proof, printed/PDF p.93.

The API comprises:

- For a countable block family I, construct `C_I=L_H(⊕_n∏_{i∈I_n}SH).`
- J_r is fib(SH→SH/P_r), with transition J_s→J_r for r≤s induced by P_r ∣ P_s.
- C_I ≃ `colim_{f→∞}∏_{n,i∈I_n}J_{f(n)},` natural in finite-support block maps.
- The nth block map `∏_{i∈I_n}SH→C_I` is the completed coproduct injection.
- For complete Q, restriction to the block inclusions gives Map(C_I,Q)≃∏_n `Map(∏_{i∈I_n}SH,Q).`
- RHom_R(T,C_I)=0, and C_I→lim_r C_I/P_r is an equivalence.
- If f≥g pointwise, the profile transition is `∏J_{f(n)}→∏J_{g(n)};` min(f,g) gives a common target.
- For an SH-linear finite-support block map u:F_I→F_J, define C(u)=L_H(u):C_I→C_J. A finite-support block map means each input block map factors through a finite subcoproduct of output blocks.
- `C(id_{F_I})=id_{C_I}.`
- C(v∘u)=C(v)∘C(u) for composable finite-support block maps, with the reflection coherence.
- For such u, `C(u)∘η_{F_I}∘ι_n=η_{F_J}∘u∘ι_n,` where ι_n includes the nth input block.

**Checks.**

- If every I_n is empty then C_I=0.
- If I_0 is a singleton and every other I_n is empty then C_I≃SH.
- For singleton blocks, the constant family (1,1,…) in ∏_NSH is not in the image of C_I→∏_NSH: modulo P_1=1−q (the same ideal as q−1) it is nonzero in infinitely many coordinates.
- For singleton blocks the maps P_n:SH→SH in the nth coordinate assemble to a map SH→C_I, since n↦n is a proper weight.

### 2.11 Tensor products of completed countable sums

Under the same solid contracts, the solid tensor of C_I and C_J agrees with the Habiro completion of the double-index family tensor. Factorial weights in the two indices can be compared with a proper radial weight: P_aP_b divides `P_{a+b},` and proper f(n)+g(m) is dominated by a suitable proper h(n,m). For the converse import SolidAnalyticRings §5.2: a proper h admits separable proper lower profiles, obtained from half the row and column minima, rounded down. Its general finality theorem compares the profile colimits; the Habiro-specific input here is the factorial divisibility below.

Use the profile order of SolidAnalyticRings §5.2: it is filtered by pointwise minima, but is not ω₁-filtered. For f_k(n)=max(n−k,0), a common target g would have g(n)≤f_n(n)=0, contradicting properness. Compute the tensor using the null-family comparison, preservation of colimits separately by solid tensor, and the supplied product tensor comparison. No exchange of this profile colimit with countable limits is used.

Import QSeriesPartitionsAndMockModularForms §3.1's integral Gaussian product identity with n=a+b and k=a. Its identity is `P_(a+b)=P_a P_b [a+b choose a]_q` over every commutative coefficient ring. The imported proof uses ArithmeticStatisticsPartIV §3.2's Gaussian product formula at the indeterminate in ℚ(q), with 1−qⁱ≠0 for i>0, before coefficient change; HC §1.1's `qFactorial_pochhammer` fixes the Pochhammer convention. Thus `P_a P_b ∣ P_(a+b)` is supplied polynomial input, including characteristic p and q=1, and is not a second theorem target here.

*Needs:* [§2.10](#210-completed-sums-of-countable-products); HabiroCyclotomicCompletions §1.1 (`qFactorial_pochhammer`); ArithmeticStatisticsPartIV §3.2 (Gaussian polynomial and product laws); QSeriesPartitionsAndMockModularForms §3.1 (integral Gaussian product identity); EnhancedDerivedSheaves §E5:abstract.2; [§2.9][r38]; [§2.7][r36]; [§2.8][r37]; SolidAnalyticRings §§3.1–3.4 and 5.1–5.4 (product tensor, profiles and null families).

See [Q], Proof of B.8, printed/PDF p.80, final three paragraphs; [Bosco], Proposition A.3, printed/PDF pp.92–93.

The API comprises:

- C_I⊗■_SHC_J ≃ L_H(F_I⊗■_SHF_J), naturally in countable block families.

**Checks.**

- For a=b=1, P₂=P₁²(1+q); this fixes the factorial divisibility direction `P_aP_b∣P_{a+b}.` The equality is the direct expansion 1−q−q²+q³=1−q−q²+q³. The reverse divisibility fails over ℤ: at q=−1, P₂=0 but P₁²=4.
- With a=0 or b=0 the Gaussian quotient is one and the divisibility is equality. At q=1 the polynomial 1+q is 2 over ℤ and zero over 𝔽₂, although the unevaluated factorization remains valid in both coefficient rings. These checks exclude cancellation after specializing a vanishing denominator.
- For h(m,n)=m+n, take f(m)=m and g(n)=n, giving equality. For h(m,n)=max(m,n), take f(m)=m/2 and g(n)=n/2 with natural division: at (3,5) the lower sum is 1+2=3≤5; in general it is at most (m+n)/2≤max(m,n). Both lower profiles tend to infinity. For h=0, the properness condition fails at k=1; no proper lower profiles can exist.
- For singleton blocks weighted by P_n and P_m, the double family has proper radial decay. A constant weight fails the modulo-P₁ finite-support test.

### 2.12 Bounded-below solid tensor closure

Assume the preceding unit, profile tensor and resolution contracts. If M and N are bounded-below Habiro-complete solid S_H-modules, their solid tensor is again Habiro-complete and agrees with the completed tensor comparison. First express arbitrary coproducts of the countable-product generators as ω₁-filtered colimits of their countable subcoproducts; countable subsets admit upper bounds by countable union. Apply the supplied commutation with countable limits at this step. Then use uniformly bounded-below simplicial resolutions by these free objects, reducing degreewise to the countable block families; realization and the tensor comparisons then preserve completeness.

The ordinary completed-discrete embedding is consequently symmetric monoidal on bounded-below complete objects. The proof uses the uniform bound and the supplied exactness of these realizations. It does not assert the same closure for every unbounded pair. The boundedness convention is homotopy bounded below, equivalently cohomology bounded above in the abelian comparison.

*Needs:* [§2.8][r37]; [§2.5][r40]; SolidAnalyticRings §4.1 and §§6.1–6.3 (countable-limit interchange and uniformly bounded resolutions and realization); VStackSheavesAndLisseCategories §VS2.1 (abelian comparison only); EnhancedDerivedSheaves §E5:abstract.

See [Q], Appendix B, Lemma B.8 and proof, pp.79–80.

The API comprises:

- With the stated light solid spectral resolution contract, `e(M)⊗^■_{S_H}e(N)≃e(L_H(M⊗_ℛN))` for bounded-below complete M,N.
- Under the full solid supplier contract, the completed-discrete embedding preserves unit and tensor on bounded-below complete objects. Both factors are bounded below; no assertion for arbitrary unbounded pairs is part of this export.
- For bounded-below Habiro-complete solid S_H-modules M,N, `M⊗^■_{S_H}N` is Habiro-complete. This requires the uniformly bounded-below resolution and realization comparison, in addition to unit idempotence.

**Checks.**

- For complete bounded-below M, `e(S_H)⊗^■_{S_H}e(M)≃e(M);` with M=0 the tensor is zero. These use the same multiplication comparison as unit idempotence.
- A connective resolution remains uniformly bounded below under the specified realization. A family of arbitrarily negative shifts does not satisfy that uniform-bound hypothesis and cannot be used in this deduction.

### Examples

The checks above compute the Laurent cofiber, the telescope sign, torsion coefficient quotients, q²−1/q³−1 Tor, flat coefficient base change, factorial weights and completed null families.

### Dependencies

HabiroCohomologyFoundations §0.1 (reflection, tower formulas, completed tensor and detection); HabiroCyclotomicCompletions Layer 1 (including the elementary factorial identities), HC Layer 2 §2.3 and Layer 5 §5.1 (ordinary polynomial coefficient modules); DerivedModuleAlgebra §§1.1–1.5; EnhancedDerivedSheaves E0/E1/E3/E5; BordismFormalGroups §F6.5; GeneralizedCohomology §§G2.1–G2.7. The solid results additionally require SolidAnalyticRings §§1.1–6.3 with the hypotheses in its supplier contract; VS2 supplies only its abelian comparison. The ordinary/derived comparison uses the nonsolid reflection and no q-de Rham or trace construction.

## Layer 3: The prime-chain index and descent mapping spaces

At a fixed positive m the intersections of cyclotomic supports are organized by prime-power chains. This layer computes that index, which the finite complete descent of HabiroCohomologyFoundations §0.2 uses, states the general descent principle for tensor-compatible localizations, and unravels the descent mapping spaces on the index.

### 3.1 Cyclotomic intersections

Let T=Div(m), Q be the poset of nonempty subsets of T, and I_S=(Φ_d(q)∣d∈S). If S is not contained in a single prime-power chain, I_S is the unit ideal. If |S|≥2 lies in a p-power chain with p-free part d, its radical in ℤ[q] is (p,Φ_d(q)). For an arbitrary commutative coefficient ring A the formula is √(I_S A[q])=√((p,Φ_d(q))A[q]); different p-free parts become disjoint after p-completion. These statements follow from the cyclotomic resultant/intersection calculation of W, Lemma 2.1.

Singletons retain their Φ_d-adic supports. The distinction between ideals and their radicals is needed: completion categories depend only on the radical, whereas quotient rings need not. For m=4, {1,4} has a nontrivial intersection although it is not a vertex of the reduced index; it is recovered through the maximal chain {1,2,4}.

*Needs:* HabiroCyclotomicCompletions §4.1; `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; `Polynomial.cyclotomic`; `Nat.divisors`.

See [W], §2.1, Lemma 2.1, p.8; [Q], §2.1, proof of Corollary 2.4 and Remark 2.5, pp.14–15.

**Checks.**

- In ℤ[q], S={1,2} gives (q−1,q+1)=(2,q−1), which is already radical since its quotient is 𝔽₂.
- For A=𝔽₂[ε]/(ε²) and S={1,2}, I_S A[q]=(q−1), while both radicals in the arbitrary-base formula are (ε,q−1). Dropping the radical on the right loses ε.
- At m=6, S={1,6} generates the unit ideal because Φ₆(1)=1; S={1,4} at m=4 has radical (2,q−1). Divisibility alone does not decide an intersection.

### 3.2 The finite prime-chain index

Define P⊆Q to consist of the singleton divisors and, for each p∣m and p-free d∣m, the maximal chain `C_{p,d}={d,dp,…,dp^{v_p(m)}}.` Use distinct subsets as vertices and subset inclusion as arrows. The index is finite. Its data are separate from the ideal attached to each subset.

For m=1 it has one singleton and no prime-chain vertex. For m=6 it has eight vertices, with the incidence graph of the four singleton divisors and four two-element prime chains. For m=12 it has eleven vertices. These examples fix the maximal-chain convention and prevent adding every proper prime-power subchain as a new vertex.

*Needs:* `Nat.divisors`; `Nat.primeFactors`; `Nat.factorization`; `CategoryTheory.Nerve.quasicategory`; [§3.1][r41]; `Nat.exists_eq_pow_mul_and_not_dvd`; `Nat.factorization_mul`; `Nat.Prime.factorization_pow`; `Nat.factorization_eq_zero_of_not_dvd`; `Nat.factorization_le_iff_dvd`.

See [Q], Proof of Corollary 2.4, p. 15, definition of P.

The API comprises:

- `CyclotomicIndex.primeChain`: For m,d,p define the finset {d p^i : i ≤ v_p(m)}; for p prime dividing m and p-free d dividing m it is a vertex.
- `CyclotomicIndex.vertices`: The finset of vertices is the union of singleton divisors and maximal chains at prime factors of m.
- S is a vertex iff S is a singleton divisor or S=C(m,d,p) for p dividing m and p-free d dividing m.
- Every vertex is a subset of Nat.divisors(m).
- Every vertex is nonempty.
- For S,U∈P(m), S≤U if and only if their underlying finite subsets satisfy S⊆U. Use the inherited subtype order on finite sets.
- The nerve of P(m), using Mathlib’s preorder category, is a quasicategory.

**Checks.**

- Vertices(1) = {{1}}; the total finset definition gives vertices(0)=∅, outside the positive-order interpretation.
- The chain computation gives primeChain(4,1,2)={1,2,4}; primeChain(1,3,2)={3}. At the total-function boundaries primeChain(0,1,2)={1}, primeChain(4,0,2)={0} and primeChain(4,3,0)={3}; these do not assert that a nonprime or nonpositive datum defines a vertex. These five values fix the total-function boundaries.
- Vertices(4) = {{1},{2},{4},{1,2,4}}.
- Vertices(6) = {{1},{2},{3},{6},{1,2},{3,6},{1,3},{2,6}}; vertices(12) has eleven elements. These counts test maximality and subset-order orientation together.
- {1,4} is not a vertex of P(4), although it is a surviving intersection in Q(4).
- For the vertices S={1} and U={2} of P(2), neither S≤U nor U≤S holds, although 1 divides 2. This distinguishes the required subset order from divisibility of singleton members.
- At m=12 the chain with p=2 and d=3 is {3,6,12}; the chain with p=3 and d=2 is {2,6}. Extending every chain to the same length would give a nondivisor 18 in the second case.
- At (m,d,p)=(4,1,2) the chain contains 2, while {1,4} omits it. A definition keeping only the endpoints therefore fails even though both endpoints divide m.

### 3.3 Height one of the reduced index

`CyclotomicIndex.height_one` states: for m>0 and vertices S,T,U with S⊆T⊆U, S=T or T=U. Every nonidentity arrow of P goes from a singleton to a maximal prime-power chain. Distinct maximal chains are incomparable, and no nonidentity arrow can follow another. Thus its nerve has no nondegenerate simplices above dimension one. Prove this from uniqueness of the p-free part and maximality of the displayed chains.

There may still be cycles in the undirected incidence graph, as for m=6. Height one removes additional compositional cocycles; it does not make all edge comparisons identical or make the mapping space discrete.

*Needs:* [§3.2][r42]; [§3.1][r41].

See [Q], Proof of Corollary 2.4, p. 15, definition of P and maximal prime-power subsets.

### 3.4 Consecutive prime edges determine chain data

Whenever d, pd divide m there is exactly one maximal p-power chain containing that consecutive pair. Write d=pⁱe with p∤e to find it. Consecutive comparisons along that chain determine all longer comparisons by composition. Each elementary prime edge therefore belongs to precisely one chain, and the composite from pʲe to pⁱe uses its unique successive path.

This calculation allows descent objects to be specified by E_d and `h_{p,d}` without introducing independent maps for nonconsecutive ratios. The higher associativity of composition comes from the enhanced categorical supplier; an arbitrary choice of strict inverse maps is unnecessary.

*Needs:* [§3.2][r42]; `Nat.exists_eq_pow_mul_and_not_dvd`; `Nat.factorization_mul`; `Nat.Prime.factorization_pow`; `Nat.factorization_eq_zero_of_not_dvd`; `Nat.factorization_le_iff_dvd`.

See [Q], Corollary 2.4 and its proof, pp. 14–15, comparisons h_(p,d) and the prime-power index.

### 3.5 Finite descent for tensor-compatible localizations

Let P be a poset with finite meets, let Z∈P, and let `{Z_i→Z}_{i∈J}` be a finite family. Let D be a presentable stable symmetric monoidal ∞-category whose tensor preserves colimits separately. Define a finite monoidal descent datum by the following data and hypotheses, for Z and its intersections:

- Each D_T⊆D is a full presentable stable reflective subcategory, with an accessible exact left adjoint L_T to its inclusion. For T′→T require D_T′⊆D_T; restriction is L_T′ on D_T. Retain the units and the coherent identity/composition equivalences of these restrictions.
- Each localization is tensor-compatible: L_T(x⊗y)≃L_T(L_Tx⊗y), compatibly with its unit. Thus D_T has unit L_T(1) and tensor L_T(x⊗y), and restrictions are symmetric monoidal left adjoints.
- Put `Z_S=∧_{i∈S}Z_i` for nonempty S⊆J and Z_∅=Z. For every S and i require the **specified overlap equivalence**
  `L_{Z_i}L_{Z_S}≃L_{Z_{S∪{i}}},` on D_Z, compatible with the localization units, inclusions of subsets, repeated indices, and the associativity and symmetry of iterated overlaps. Equivalently give a coherent finite cube of commuting idempotent localizations with these values. Pairwise unlabelled equivalences are insufficient data.
- The restrictions `L_{Z_i}:D_Z→D_{Z_i}` are jointly conservative. For an empty covering family this condition forces D_Z=0.

The finite monoidal reconstruction theorem states that the restriction functor is a symmetric monoidal equivalence

    D_Z ≃ lim_(∅≠S⊆J) D_(Z_S)

where transition functors are the indicated localizations and the limit is the coherent limit of categories. It applies to every finite family satisfying the datum, not just to cyclotomic factors, arithmetic completions or bounded objects. Its inverse sends compatible local objects x_S to the finite limit in D_Z of their underlying objects, with transition maps supplied by localization units and the specified descent equivalences.

To prove full faithfulness, form the augmented finite localization cube of x∈D_Z. Its total fibre is killed by each `L_{Z_i}:` exactness commutes with the finite limit, and the overlap equivalences make the i-direction invertible. Joint conservativity kills the total fibre, so x is the limit of its restrictions. For essential surjectivity apply the same calculation to compatible local objects: localizing their finite limit at i gives `x_{\{i\}},` and then every x_S by the overlap equivalences. The subcategory D_Z is closed under limits, so this inverse stays in D_Z. The reconstructed unit and tensor are identified after all restrictions, which are conservative and symmetric monoidal. This gives the monoidal equivalence as well as the equivalence of underlying categories.

The API comprises:

- L_T, its unit, and the exact accessible reflective-subcategory structure.
- The coherent overlap equivalences for all S and i, including the empty-S unit condition.
- The restriction functor with its symmetric monoidal structure and coherent subset transitions.
- The equivalence above, its finite-limit inverse, and unit/counit comparisons with the given local markings.
- For x,y∈D_Z, `Map(x,y)≃lim_{S≠∅}Map(L_{Z_S}x,L_{Z_S}y),` naturally in both objects and compatibly with composition. The right side is a homotopy limit of spaces.
- `CAlg(D_Z)≃lim_{S≠∅}CAlg(D_{Z_S}),` with the same restriction maps; limits of commutative algebra objects are computed by the enhanced algebra supplier. This is not a statement about ordinary tensor products of underlying rings.
- For a refinement satisfying the same hypotheses, with the coherent overlap datum also on the union of the two covers, reconstruction commutes with restriction to the refining cover; identity and composition of refinements agree coherently. Check this after every refining localization, using the specified overlap coherences.
- On a poset site whose covering families admit finite covering refinements, with the datum for every finite cover and compatibly with base change, T↦D_T and T↦CAlg(D_T) are sheaves. Finite descent and the covering-refinement criterion give this conclusion; no infinite localization cube is used.

**Checks.**

- A singleton identity cover has L_Z²≃L_Z; reconstruction, its map equivalence and its algebra equivalence are identities. Repeating the same cover produces the coherent diagonal equivalence, not two unrelated copies.
- For disjoint summands D=D₁×D₂, the localizations (x₁,x₂)↦(x₁,0) and (x₁,x₂)↦(0,x₂) have zero overlap. The two-piece gluing limit is D₁×₀D₂≃D. Their units send (x₁,x₂) to the corresponding projection; reversing either arrow would not be a localization unit.
- On a site with two disjoint opens covering Z, assign the same nonzero D to Z and each open, zero to the intersection, and take both restrictions from Z to be the identity. They are jointly conservative, but L_1L_2=id_D is not the intersection localization 0. The putative reconstruction is the diagonal D→D×D, which misses (x,0) for x≠0. This is excluded precisely by the specified overlap equivalences; nesting and conservativity alone do not prove descent.
- For an empty cover, conservativity to the terminal category forces D_Z=0, so both category and commutative-algebra descent limits are terminal. There is no assertion that an empty cover reconstructs an arbitrary nonzero category.

*Needs:* BordismFormalGroups §F6.5 (straightening); EnhancedDerivedSheaves §E0.7 (`coCartesianSections`); BordismFormalGroups §F6.5 (limits and slices); EnhancedDerivedSheaves §E3.2 (`accessibleLocalization`); EnhancedDerivedSheaves §E5:presentability.2; BordismFormalGroups §F6.5 (monoidal structures); EnhancedDerivedSheaves §E5:abstract.2 (`commutativeAlgebras`). The datum and theorem are owned here; the enhanced carrier remains a README target.

Sources: [Q], §2.1, Setup 2.1 and Lemma 2.2, pp.13–14, for the finite localization-cube proof; [HA], §2.2.1, Proposition 2.2.1.9, p.197, for the monoidal localization input, and §3.2.2, Corollaries 3.2.2.4–3.2.2.5, pp.358–359, for algebra limits. The coherent overlap hypothesis is stated explicitly because the proof needs it; it does not follow from nesting and conservativity alone in Setup 2.1. HabiroCohomologyFoundations §0.2 verifies its cyclotomic overlaps and proves that specialization directly. It has no dependency on the general theorem here, which supplies neither a second cyclotomic reconstruction nor a second closed-cover index.


### 3.6 Mapping spaces of prime-edge data

Unravel the mapping-space equivalence of HabiroCohomologyFoundations §0.2 on the reduced index of §3.2. For local objects E,F with their edge equivalences, let `V=∏_{d∣m}Map(E_d,F_d)` and `W=∏_{p,d:pd∣m}Map(E_{pd}̂_p,F_d̂_p).` There are two maps V⇒W: first apply the source edge comparison and then the map at d; alternatively apply the map at pd and then the target edge comparison. Prove that the mapping space of the reconstructed algebras is the homotopy equalizer of these maps, naturally in E and F and compatibly with composition. The right Kan extension from the reduced index recovers the redundant subsets (§3.1), consecutive edges determine the longer chain comparisons (§3.4), and height one (§3.3) leaves no higher simplices, so the limit of the intersection mapping-space diagram reduces to this equalizer.

An element is a family of local maps together with a specified path on each prime edge. It is not the strict equalizer of a set of maps. At m=6 all four edge paths are retained, while height one supplies no additional compositional cocycle around the undirected cycle. This formulation exposes the full-faithfulness part of descent.

*Needs:* [§3.1][r41]; [§3.2][r42]; [§3.3](#33-height-one-of-the-reduced-index); [§3.4](#34-consecutive-prime-edges-determine-chain-data); HabiroCohomologyFoundations §0.2 (reconstruction, the mapping-space equivalence); EnhancedDerivedSheaves Layer E0; EnhancedDerivedSheaves §E5:abstract.

See [Q], Proof of Corollary 2.4, p. 15, final limit and unravelling; Lemma 2.2, p. 14.

The API comprises:

- For marked prime-edge data E, F at level m, the mapping space between their reconstructions is naturally the homotopy equalizer of the two maps V ⇉ W, compatibly with composition of maps and with the reconstruction of HabiroCohomologyFoundations §0.2.

**Checks.**

- At m=1 the product W is empty, hence a point, and the mapping space is Map(E_1,F_1).
- At a prime m=p there is one edge, and put V=Map(E_1,F_1)×Map(E_p,F_p) and W=Map(E_p̂_p,F_1̂_p). The mapping space is V×ʰ_(W×W)W, using the pair of edge maps V→W×W and the diagonal W→W×W; a single local map at d=1 does not determine a map of descent data.
- At m=6 the four edges (p,d)=(2,1),(2,3),(3,1),(3,2) form a cycle in the incidence graph. The equalizer retains one path on each edge and imposes no cocycle around the cycle: by height one (§3.3) no two nonidentity arrows of the reduced index compose, so the limit has no nondegenerate 2-simplices.

### Examples

The m=1,4,6,12 indices above test maximal chains. The m=6 graph has four edge paths and no additional composite cocycle. Independently, §3.5 tests general finite descent on an identity cover, two disjoint summands, an empty cover and a conservative assignment that fails the overlap hypothesis.

### Dependencies

The general theorem §3.5 uses E0/E3/E5 coherent monoidal localization and finite limits. The cyclotomic index and mapping formula additionally use Layer 2, HabiroCyclotomicCompletions Layer 4 cyclotomic resultants and intersections, and HabiroCohomologyFoundations §0.2 (finite cyclotomic complete descent); that supplier proves its instance independently of §3.5.

## Layer 4: The finite relative stages along morphisms of pairs

HabiroCohomologyFoundations §0.3 constructs the marked coefficient lifts E_m(R/A) for a fixed perfectly covered base, functorially in étale A-algebras. This layer extends that functoriality to the category of pairs of §1.1, including changes of base, which Layer 5 uses for the functoriality of the ring, completed base change and the number-field comparisons.

### 4.1 The finite stages as functors on pairs

For a pair (A,R) and m≥1 write `H_{R/A,m}` for E_m(R/A), with its marking by qW_m(R/A). Let (f,g):(A,R)→(A′,R′) be a morphism of pairs. The relative q-Witt map qW_m(g):qW_m(R/A)→qW_m(R′/A′) of QWittVectors §§4.3–4.6 is semilinear over f[q]. Its A′[q]/f_m-linearization starts at `qW_m(R/A)⊗_{A[q]/f_m}A′[q]/f_m,` which is étale over A′[q]/f_m and is the derived reduction of the f_m-completed base change `(H_{R/A,m}⊗^L_{A[q]}A′[q])^∧_{f_m};` the derived tensor is static because qW_m(R/A) is flat over A[q]/f_m (QWittVectors §§5.1–5.2). By the marked reduction equivalence of HabiroCohomologyFoundations §0.3 there is a unique map of f_m-complete E∞-A′[q]-algebras from this base change to `H_{R′/A′,m}` lifting the linearized q-Witt map. Define the stage map as its composite with the base-change unit. Uniqueness gives identities, composites, compatibility with the cyclotomic ghost overlaps and the Frobenius transitions of that section.

For R=A, qW_m(A/A)=A[q]/f_m (QWittVectors §4.3), and `A[q]^∧_{f_m},` with its identity marking, is a marked complete étale lift; uniqueness identifies it with `H_{A/A,m}.` Isomorphic pairs give equivalent stages. The stage map of a pair morphism is not obtained by restricting q-Witt coordinates, and need not be the identity on cyclotomic reductions when g is a nontrivial automorphism.

*Needs:* [§1.1][r23]; gap:completed-frobenius-base-naturality; [Relative q-Witt][r24]; [Étale q-Witt pushouts][r25]; HabiroCohomologyFoundations §0.3 (the marked finite lifts, marked uniqueness, the cyclotomic ghost comparisons, the Frobenius transitions); HabiroCohomologyFoundations §0.2 (coefficient naturality); DerivedModuleAlgebra §§1.1–1.5.

See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; Theorem 2.9, pp.16–17; [W], §2.5, Lemma 2.46, pp.31–32.

The API comprises:

- `H_{R/A,m},` the coefficient lift E_m(R/A) of HabiroCohomologyFoundations §0.3 with its marking, written in the Laurent convention; this names the supplier's object and constructs nothing.
- For a morphism of pairs (f, g), the unique f[q]-semilinear map `H_{R/A,m}` → `H_{R′/A′,m}` of f_m-complete E∞-algebras whose reduction is qW_m(g), compatible with the overlap equivalences and transitions; map_id and map_comp.
- Isomorphic pairs (A, R) ≅ (A′, R′) give equivalent stages `H_{R/A,m}` ≃ `H_{R′/A′,m},` compatibly with the markings.
- `H_{A/A,m}` ≃ `A[q]^∧_{(q^m−1)},` under which the marking is the quotient map to A[q]/(q^m − 1).

**Checks.**

- m = 1: there are no prime edges and `H_{R/A,1}` ≃ `R[q]^∧_{(q−1)}.`
- A = R = ℤ: every `ϕ_{p/ℤ}` is the identity of ℤ_p, so all overlap equivalences are identities and `H_{ℤ/ℤ,m}` ≃ `ℤ[q]^∧_{(q^m−1)}` ([Q], Remark 2.8).
- For R = A (perfectly covered), a ⊗ b ↦ ψ^d(a)b identifies the Φ_d-overlap terms with `A[q]^∧_{Φ_d(q)}` and the overlap equivalences with identities, so `H_{A/A,m}` ≃ `A[q]^∧_{(q^m−1)}.`
- A = ℤ, R = ℤ[1/2], m = 2: (E_2)^∧_2 = 0, so there is no gluing, E_1 = ℤ[1/2][[q − 1]], E_2 = ℤ[1/2][[q + 1]] and `H_{ℤ[1/2]/ℤ,2}` ≃ ℤ[1/2][[q − 1]] × ℤ[1/2][[q + 1]] ≅ `ℤ[1/2][q]^∧_{(q^2−1)}.`
- For R = ℤ[i][1/2] over ℤ and complex conjugation g, the stage map at m = 4 acts on the Φ₄-reduction R[q]/(q² + 1) ≅ R × R by swapping the idempotents e = (1 − iq)/2 and 1 − e. A stage map that used only the base map and ignored g would be the identity there.
- For the zero étale algebra R=0 every stage is zero. Every stage has a unique unital algebra map to zero. A unital algebra map from zero exists only when its target is zero: for A=R=ℤ and m=1 the target ℤ[[q−1]] is nonzero, so there is no such map from the zero stage. This distinguishes the terminal zero algebra from an initial algebra.

### Examples

For R=ℤ[i][1/2], conjugation swaps the two factors of the order-four reduction, while the first stage is R⟦q−1⟧ for every pair. The localized pair over ℤ[1/2] has no gluing at m=2.

### Dependencies

Layer 1 (pairs); HabiroCohomologyFoundations §0.3 (coefficient lifts, uniqueness, overlaps, transitions) and §0.2 (naturality of reconstruction); QWittVectors §§4.1–6.3 (relative q-Witt functoriality in pairs and étaleness); DerivedModuleAlgebra §§1.1–1.5.

## Layer 5: The relative ring, Taylor series and completed base change

The static coefficient object E(R/A) of HabiroCohomologyFoundations §0.3 has an ordinary ring presentation. The Taylor description must preserve full coefficient algebras and distinguish coefficient extension from Frobenius re-expansion.

### 5.1 The relative Habiro ring

Set `H_{R/A}=π₀E(R/A),` the ordinary ring of the static coefficient object of HabiroCohomologyFoundations §0.3 (the static complete limit). Since E(R/A) and every `H_{R/A,m}=E_m(R/A)` are static, the factorial limit defining E(R/A) is the ordinary inverse-limit ring of the rings `π₀H_{R/A,k!}.` The factorials are cofinal in the divisibility order, so the same ring is lim_m `H_{R/A,m}` along the supplier’s Frobenius transitions. Its projections, compatible-family lifting map and uniqueness give the ordinary limit universal property for any ring B.

The supplier's derived statements become ordinary ring statements here. Its derived (qᵐ−1)-completion is `H_{R/A,m}.` The derived quotient by qᵐ−1 is the static qW_m(R/A), so qᵐ−1 is a non-zero-divisor on `H_{R/A},` the derived completion is the ordinary (qᵐ−1)-adic completion, and the ordinary quotient `H_{R/A}/(qᵐ−1)` is qW_m(R/A), with the transitions reducing to the Frobenii `F_{m/d}.` Its Φ_d-completion is the twisted coefficient completion `(R⊗_{A,ψ^d}A)[q]^∧_{Φ_d}` given by the supplier’s ghost comparison, and the m=1 completion is R[[q−1]]. Morphisms of pairs induce compatible stage maps by §4.1 and a functorial map on H. The ring is not a localization inverting q−1; already for ℤ its q−1 element is noninvertible.

*Needs:* HabiroCohomologyFoundations §0.3 (the marked finite lifts, the cyclotomic ghost comparisons, the Frobenius transitions, the static complete limit); HabiroCohomologyFoundations §0.1 (the two tower formulas, cyclotomic detection); [§4.1][r58]; [§2.1][r29]; [§1.1][r23]; DerivedModuleAlgebra §§1.1–1.5.

See [Q], §2.2, 2.7 and footnote (2.1), p.16; Theorem 2.9 and proof, pp.16–17; proof of Lemma 2.12, p.18.

The API comprises:

- `H_{R/A}` = π₀E(R/A) for R étale over a perfectly covered Λ-ring A, equivalently the ordinary ring lim_m `H_{R/A,m}.`
- The maps π_m: `H_{R/A}` → `H_{R/A,m},` compatible with the transition maps.
- Two elements with the same projections π_m for all m are equal.
- A compatible family of A[q]-algebra maps B → `H_{R/A,m},` factors uniquely through `H_{R/A};` π_m ∘ lift is the m-th map.
- The ordinary limit over the chain {n!}, which computes π₀E(R/A), is canonically isomorphic to the limit over divisibility.
- The ordinary (q^m−1)-adic completion of `H_{R/A}` is `H_{R/A,m}` for every m, and agrees with the derived completion.
- `(H_{R/A})^∧_{Φ_d(q)}` ≃ (R `⊗_{A,ψ^d}` `A)[q]^∧_{Φ_d(q)};` for d = 1 this is R[[q−1]].
- q^m − 1 is a non-zero-divisor and the ordinary quotient `H_{R/A}/(q^m−1)` is qW_m(R/A) ([Q], Theorem 2.9), under which the transition maps become the Frobenii `F_{m/d}` ([Q], Remark 2.10).
- The ring map `H_{R/A}` → `H_{R'/A'}` of a morphism of pairs, induced by the stage maps of §4.1, with map_id and map_comp.

**Checks.**

- For R = 0, `H_{0/A}` = 0.
- For R = A, `H_{A/A}` ≅ A[q]^N = lim_m `A[q]^∧_{(q^m−1)};` for A = Z this is Habiro's ring H ([§5.5][r65]). A definition that completed q-adically or (q−1)-adically, or twisted E_d without the linearisation, fails.
- For A = Z and R = Z[i][1/2] (= O_F[1/disc F], F = Q(i)), `H_{R/Z}/Φ_4(q)` ≅ R[q]/(q²+1) ≅ R × R, because q² + 1 = (q − i)(q + i) and (q − i) − (q + i) = −2i is a unit; and `H_{R/Z}/(q` − 1) ≅ R. A definition adjoining ζ_4 through one embedding would give R instead of R × R.
- `(H_{R/A})^∧_{(q−1)}` ≅ R[[q−1]], compatibly with the projection to `H_{R/A,1}.`
- `H_{R/A}/(q^m` − 1) ≅ qW_m(R/A); for A = R = Z this is Z[q]/(q^m − 1), by qW_m(Z) ≅ Z[q]/(q^m − 1) (q-Witt v5 Corollary 2.37).
- For A = R = Z, q − 1 is not a unit of `H_{Z/Z},` since its image in `(H_{Z/Z})^∧_{(q−1)}` = Z[[q−1]] is not invertible; the construction completes and does not invert the q^m − 1.
- For R = Z[∛2][1/6], `H_{R/Z,5}` is not isomorphic to `R[q]^∧_{(q^5−1)}` as a Z[q]-algebra ([§7.4](#74-the-finite-stage-obstruction)).

### 5.2 Compatible roots and the two Taylor maps

Choose primitive roots ζ_m∈ℂ with `ζ_{mn}=ζ_mζ_n` for coprime m,n and `ζ_{p^a}=ζ_{p^{a+1}}ᵖ.` One such system is `ζ_m=∏_{p∣m}exp(2πi/p^{v_p(m)}).` Put C_m=R^(m)⊗_ℤℤ[ζ_m], retaining this tensor algebra in full, and T_m=C_m[[q−ζ_m]]. Put `T_{p,m}=(R̂_p⊗_{A,ψᵐ}A)̂_p[ζ_{pm}][[q−ζ_m]].`

The map `can_{p,m}:T_m→T_{p,m}` extends coefficients and keeps the variable q−ζ_m. The map `φ_{p,m}:T_{pm}→T_{p,m}` first applies completed linearized Frobenius to the coefficients and then substitutes `q−ζ_{pm}=(q−ζ_m)+(ζ_m−ζ_{pm}).` The difference is p-adically topologically nilpotent, making this re-expansion converge. Taylor expansion τ_m sends q to ζ_m+X_m and its constant coefficient is evaluation at ζ_m.

Changing a compatible root system gives canonical isomorphisms between these presentations. In the abstract algebra R^(m)[z]/Φ_m(z), with a separate formal power-series variable, the relabeling can be represented by the identity. On a fixed realized coefficient algebra, the actual Galois action is generally nontrivial: it sends the chosen root to its new conjugate. Independence of presentations must not be confused with triviality of that action. The usual roots exp(2πi/m) fail the compatibility at orders 3 and 6, where the required difference is a unit.

*Needs:* [completed Frobenius][r27]; HabiroCyclotomicCompletions §3.3; HabiroCyclotomicCompletions §3.1; `IsPrimitiveRoot`; `Polynomial.cyclotomic`; `PowerSeries`; `PadicInt`.

See [Q], §2.2, 2.11, p.17.

The API comprises:

- A family `(ζ_m)_{m ≥ 1}` of primitive m-th roots of unity in ℂ with `ζ_{mn}` = ζ_mζ_n for coprime m, n and `ζ_{p^α}` = `ζ_{p^{α+1}}^p.`
- ζ_m := ∏_p `e^{2πi/p^{v_p(m)}}.`
- (R `⊗_{A,ψ^m}` A)[ζ_m] := (R `⊗_{A,ψ^m}` A) ⊗_Z Z[ζ_m] ≅ (R `⊗_{A,ψ^m}` A)[x]/Φ_m(x).
- T_m := coeffAlgebra_m[[q − ζ_m]] and `T_{p,m}` := (R̂_p `⊗_{A,ψ^m}` `A)^∧_p[ζ_{pm}][[q` − ζ_m]].
- `can_{p,m}:` T_m → `T_{p,m},` extension of coefficients with the variable kept.
- `φ_{p,m}:` `T_{pm}` → `T_{p,m},` `φ_{p/A}` ⊗ id on coefficients followed by `rex_{ζ_m` − `ζ_{pm}}.`
- τ_m: (R `⊗_{A,ψ^m}` `A)[q]^∧_{Φ_m(q)}` → T_m, q ↦ ζ_m + (q − ζ_m); its constant coefficient is evaluation at ζ_m.
- ζ_m − `ζ_{pm}` is topologically nilpotent in the p-complete coefficient ring of `T_{p,m}.`
- For A = R = Z, `φ_{p,m}` is HabiroCyclotomicCompletions §3.3's `rex_{ζ_m` − `ζ_{pm}}` after extension of coefficients.
- A change of compatible roots induces isomorphisms of the full coefficient and Taylor presentations intertwining can, φ and τ. Abstractly these are relabelings of the formal cyclotomic generator; the Galois action on a fixed realized coefficient algebra is not asserted to be trivial.

**Checks.**

- For the standard system ζ_6 = ζ_2ζ_3 = −ζ_3, so ζ_3 − ζ_6 = 2ζ_3 has positive 2-adic valuation, whereas `e^{2πi/3}` − `e^{2πi/6}` = −1 is a unit; with the traditional roots there is no 2-adic re-expansion from order 6 to order 3.
- In `H_{Z/Z},` f = 1 − q³ and 0 have the same value 0 at ζ_3, but τ_3(f) = −3ζ_3²X − 3ζ_3X² − X³ ≠ 0 with X = q − ζ_3; the value at one root does not determine the Taylor expansion there.
- For A = Z, R = Z[i][1/2] and m = 4, coeffAlgebra_4 = R ⊗_Z Z[i] ≅ R × R; e = (1⊗1 − i⊗i)/2 is an idempotent sent to 1 by the embedding ζ_4 ↦ i and to 0 by ζ_4 ↦ −i, so choosing one embedding loses a factor.
- For A = R = Z, p = 2, m = 1: `φ_{2,1}` sends q + 1 = q − ζ_2 ∈ Z[[q − ζ_2]] to (q − 1) + 2 ∈ Z_2[[q − 1]], and `can_{2,1}` is the inclusion Z[[q − 1]] ⊂ Z_2[[q − 1]].
- For a = −1, `σ_{−1}` ∘ can = can ∘ `σ_{−1},` `σ_{−1}` ∘ φ = φ ∘ `σ_{−1},` and `σ_{−1}` ∘ τ_m for (ζ) is τ_m for `(ζ^{−1}).`
- The re-expansion of Σ_k (q − 1)^k at ζ_3 would have constant coefficient Σ_k (ζ_3 − 1)^k, which has no meaning in the discrete ring Z[ζ_3] and converges in Z_3[ζ_3] because (1 − ζ_3)² = −3ζ_3.
- At m=1 the compatible root is 1, C₁=R and T₁=R[[X]]. The coefficient-extension map keeps X fixed, while the prime-edge map re-expands it by the root difference.
- For R=0 every full coefficient algebra and Taylor factor is zero. For m=1 and arbitrary R, the coefficient algebra is R; neither test selects an embedding into a field.
- For toric A=R=ℤ[t], a⊗b↦ψ^m(a)b identifies R^(m) with A even though ψ^m is not surjective for m>1. Twisting does not mean inverting the endomorphism on A itself.

### 5.3 Prime-adic and rational Taylor comparison

For ℓ∤m, the full algebra ℤ_ℓ[ζ_m]=ℤ_ℓ[z]/Φ_m(z) is finite étale and decomposes into all its unramified factors. Taylor expansion identifies the (ℓ,Φ_m)-complete polynomial algebra with power series over this entire coefficient algebra. The separability of Φ_m modulo ℓ and Hensel lifting prove the comparison factor by factor. Over ℚ, Φ_m is irreducible and the rational Φ_m-completion has the analogous full cyclotomic Taylor description.

Do not assert irreducibility of Φ_m over 𝔽_ℓ. Its factors have degree ord_m(ℓ), and there can be several of them. At m=5, ℓ=11 there are four linear factors, so the integral Taylor comparison has four ℤ₁₁ power-series factors. The comparison needs every idempotent factor and remains valid with this correction.

*Needs:* `Polynomial.separable_cyclotomic`; `Polynomial.cyclotomic.dvd_X_pow_sub_one`; `Polynomial.cyclotomic.irreducible_rat`; `Ideal.quotientInfRingEquivPiQuotient`; `PadicInt`; `IsAdicComplete`; `PowerSeries`.

See [Q], §2.2, proof of Lemma 2.12, prime-adic and rational steps, p.18.

### 5.4 The Taylor equalizer

For a fixed compatible root system there is a canonical ring isomorphism

    H_(R/A) ≅ Eq(∏_(m≥1) T_m ⇉ ∏_(p,m) T_(p,m))

where the two components at (p,m) are `can_{p,m}(f_m)` and `φ_{p,m}(f_{pm}).` Thus a family belongs to the relative ring exactly when these completed Taylor expansions agree on every prime edge.

Prove it by the reconstruction and arithmetic fracture pieces of HabiroCohomologyFoundations §0.2, applied to the overlap description of §0.3 (the cyclotomic ghost comparisons), and by the full prime-adic and rational Taylor comparisons; then pass to the cofinal inverse limit. The enhanced comparison precedes its ordinary equalizer consequence. A single chosen embedding of C_m into an extension field would lose factors, and equality only of root values would discard higher Taylor coefficients.

*Needs:* [§5.1][r62]; [§5.2][r63]; [§5.3][r64]; HabiroCohomologyFoundations §0.2 (reconstruction, arithmetic fracture); HabiroCohomologyFoundations §0.3 (the cyclotomic ghost comparisons); HabiroCohomologyFoundations §0.1 (cyclotomic detection); [completed Frobenius][r27]; `RingHom.eqLocus`; `CommRingCat.equalizerForkIsLimit`.

See [Q], §2.2, Lemma 2.12 and proof, p.18.

**Checks.**

- For A=R=ℤ the prime-edge maps are coefficient extension and p-adic re-expansion. The equalizer agrees with the classical all-root completion, including every Taylor coefficient.
- For R=0 both products and their equalizer are zero. For R=ℤ[i][1/2], the order-four factor has two components; projecting to one component is not the equalizer of the full diagram.

### 5.5 When the twists can be removed

If R has global compatible Frobenius/Λ-operations extending those on A and their linearizations are invertible in the required twists, these maps identify the twisted pieces with the untwisted cyclotomic completions. The gluing and its transitions then give the naive Habiro completion of R[q]. In particular R=A, toric self-bases and R=ℤ[1/N] with identity Adams operations have the untwisted description.

For a general étale algebra R the completed Frobenius does not extend globally, so these identifications are unavailable. This theorem gives a sufficient compatibility condition and its examples; it does not replace the twisted construction for every étale R.

*Needs:* [§5.1][r62]; HabiroCohomologyFoundations §0.3 (marked uniqueness, the cyclotomic ghost comparisons); [completed Frobenius][r27]; HabiroCyclotomicCompletions §1.4; `Algebra.Etale.of_isLocalizationAway`.

See [Q], §2.2, Remark 2.8, p.16; §1.4, Notation 1.22(e), p.12.

### 5.6 Completed base change of the ring

Let A→A′ be a map of perfectly covered Λ-rings and set R′=R⊗_AA′ with R étale over A. Then

    (H_(R/A,m) ⊗ᴸ_(A[q]) A′[q])^∧_(q^m−1) ≃ H_(R′/A′,m)
    L_H(H_(R/A) ⊗ᴸ_(A[q]) A′[q]) ≃ H_(R′/A′)

Use relative q-Witt base change, the stage maps of §4.1, the uniqueness of marked complete étale lifts (HabiroCohomologyFoundations §0.3) and the reflection of HabiroCohomologyFoundations §0.1 with the base change of §2.5. The statement is derived from those interfaces; it is not a quoted base-change theorem of Q.

If A′ is flat over A, the tensor is ordinary, but completion is still required. For A=R=ℤ and A′=ℤ[x] with toric operations, H⊗_ℤℤ[x]=H[x] is strictly smaller than the Habiro completion of ℤ[x][q]. Flatness permits removal of Tor, not removal of the completion.

*Needs:* [§5.1][r62]; [§5.5][r65]; [§4.1][r58]; HabiroCohomologyFoundations §0.3 (marked uniqueness); HabiroCohomologyFoundations §0.1 (the enhanced reflection); [§2.5][r40]; [Relative q-Witt][r24]; [§1.1][r23]; [§2.1][r29].

See [W], §2.5, Lemma 2.46, pp.31–32; [Q], §2.2, Theorem 2.9, pp.16–17; deduction by completed deformation.

The API comprises:

- For a Λ-map A→A′ of perfectly covered bases and R′=R⊗_A A′, the (q^m−1)-completion of `H_{R/A,m}⊗^L_{A[q]}A′[q]` is `H_{R′/A′,m},` naturally in the base-change square.
- For the same base-change square, `L_H(H_{R/A}⊗^L_{A[q]}A′[q])≃H_{R′/A′}.` The comparison is an equivalence of complete E∞ A′[q]-algebras, with identity, composition, stage and Taylor compatibilities.
- Flat A′ over A removes higher Tor in the displayed tensor, while completion remains in both the finite and infinite formulas.

**Checks.**

- For the identity Λ-map A→A, the comparison is the completion counit on `H_{R/A};` its stage comparisons are the identities under the canonical markings.
- For R=0 or A′=0 the base-changed étale algebra and both completed expressions are zero. A nonzero or faithfully flat base map is not an extra hypothesis.
- For A=R=ℤ and toric A′=ℤ[t], the series `Σ_{n≥0}P_n(q)t^n` belongs to `H_{A′/A′}.` It is not in H[t], which has bounded t-degree. This is a flat base change for which completion cannot be dropped.

### 5.7 The classical Habiro ring

For A=R=ℤ with identity Adams operations, the relative ring is canonically Habiro's integral completion lim_n ℤ[q]/P_n. The comparisons identify its projections, q-factorial topology, root evaluations and Taylor maps with the established HabiroCyclotomicCompletions Layers 1 and 3 library. Its q−1 Taylor map is the classical injective map of HabiroCyclotomicCompletions Layer 4.

The proof removes the identity twists and applies the existing completion universal property, rather than replanning the classical construction. This specialization provides the basic compatibility test for the relative formulas, including the p-adic re-expansion maps.

*Needs:* [§5.4][r66]; [§5.5][r65]; HabiroCyclotomicCompletions §1.4; HabiroCyclotomicCompletions §3.1.

See [Q], §2.2, Remark 2.14, p.19; §1.1, Question 1.1, p.3.

The API comprises:

- The relative self-ring for ℤ agrees with the established HC integral Habiro ring, preserving its projections and Taylor maps.

### 5.8 Unramified number-field coefficients

For a number field F and a nonzero integer Δ divisible by disc(F), R=𝒪_F[1/Δ] is étale over ℤ. Use the finite free integral basis and the discriminant criterion to show that primes not dividing Δ are unramified, while at primes dividing Δ the localized algebra has no fiber. The localization and étale local criteria give the result.

Neither all primes nor a global Frobenius lift are claimed. The p-completion is zero for p∣Δ, and the nonzero completions at the other primes carry their canonical unramified Frobenius. Divisibility by 6 is unnecessary for this ring assertion; it enters with the line bundles.

*Needs:* `NumberField.RingOfIntegers`; `NumberField.discr`; `NumberField.not_dvd_discr_iff_isUnramifiedIn`; `Algebra.formallyUnramified_iff_forall`; `IsDedekindDomain.flat_iff_torsion_eq_bot`; `Algebra.Etale.of_formallyUnramified_of_flat`.

See [Q], §2.2, Corollary 2.13, p.19, and the étale setup in 2.7, p.15.

The API comprises:

- For F a number field and nonzero Δ with disc(F)∣Δ, any localization of 𝒪_F away from Δ is étale over ℤ.
- `etale_localization_away_of_prime_dvd`: The radical variant only asks that each rational prime dividing disc(F) divides nonzero Δ; discriminant multiplicities do not matter.

**Checks.**

- For F=ℚ and Δ=1, the ring is ℤ and the map is the identity, hence étale. Divisibility by 6 is not a condition for this target.
- For F=ℚ(i), Δ=2 inverts the same discriminant primes as disc(F)=−4; the radical variant gives ℤ[i][1/2] although −4 does not divide 2.
- For F=ℚ(i), Δ=1 leaves the ramified prime 2 and is excluded. For every p∣Δ the localized p-completion is zero, not an additional unramified field factor.

### 5.9 The GSWZ ring comparison

For R=𝒪_F[1/Δ] as above and base ℤ, the relative Taylor equalizer identifies `H_{R/ℤ}` with the number-field ring H_R of GSWZ. The isomorphism κ respects each full cyclotomic coefficient algebra, root value, Taylor expansion and completed prime-edge Frobenius. At p∣Δ its p-completed terms vanish.

The comparison imports the ring in the HabiroNumberFields contract with its root and gluing maps. It is a ℤ[q]-algebra comparison, not an assumed R-algebra structure obtained by inserting all constants. Constants must themselves satisfy the Frobenius gluing condition, which usually fails. This distinction is essential for transporting modules and their scalar-extension maps in Layer 6.

*Needs:* [§5.4][r66]; [§5.2][r63]; [§5.8][r67]; [§5.7](#57-the-classical-habiro-ring); [completed Frobenius][r27]; gap:number-field-ring; HabiroCyclotomicCompletions §3.3.

See [Q], §2.2, Corollary 2.13, p.19; §1.1, paragraph 1.4, p.4.

Compare [G], §1.4, Definition 1.1 and (11)–(13), pp.6–7: its coefficient ring is 𝒪_F[1/Δ] and its prime edges use completed Frobenius. This is the ring supplied to the trace construction before any cohomology or trace comparison.

The API comprises:

- For positive Δ with disc(F)∣Δ and R=𝒪_F[1/Δ], `κ:H_{R/ℤ}≃H_R` is a ℤ[q]-algebra equivalence preserving the full Taylor factors and completed Frobenius gluing. No extra divisibility by 6 is needed for this ring equivalence.

**Checks.**

- For F=ℚ and Δ=1, κ is the classical integral comparison. For Δ=2 the prime-2 gluing terms vanish and the valuation-of-order components remain; κ does not turn their product into a domain.
- For F=ℚ(i), the order-four coefficient ring over ℤ[i][1/2] has two factors. κ preserves both; it is a ℤ[q]-algebra comparison without a stipulated insertion of all R-constants.

### Examples

The examples above compute both Gaussian factors, the flat toric series Σ_n P_n(q)t^n and vanishing prime terms at p∣Δ.

### Dependencies

Layers 1–4; HabiroCohomologyFoundations §§0.1–0.3; the full coefficient/Taylor and classical completion interfaces of HabiroCyclotomicCompletions Layers 1, 3, 4 and 5; the actual number-field ring and Frobenius gluing of HabiroNumberFields' ring contract.

## Layer 6: Scalar extension and transported number-field lines

The scalar ring and its monoidal category already exist before this layer. Completed pullback applies to any morphism of pairs. Number-field line applications retain Δ divisible by 6 and the discriminant, together with the effective global, tensor and integral linear-jet certificates of the arithmetic lines.

### 6.1 Scalar extension of complete modules

For a morphism of pairs inducing f:H→H′, define f^*M=L_H(M⊗_H^L H′). It is left adjoint to restriction on complete modules. The adjunction and monoidal localization give coherent identity, composition, tensor and unit maps. On perfect modules the ordinary derived tensor is already complete; in particular an invertible H-module pulls back by the usual tensor product and gives the ordinary Picard map.

An arbitrary infinite direct sum can fail to be complete, so the formula cannot omit completion on all modules. The base-change theorem of [§5.6](#56-completed-base-change-of-the-ring) applies only to the specified base-change pair; the present module functor applies to any actual morphism of pairs.

*Needs:* [§5.1][r62]; [§2.1][r29]; HabiroCohomologyFoundations §0.1 (the enhanced reflection, the completed tensor); [§2.5][r40]; [§1.1][r23]; [§4.1][r58].

See [Q], Appendix B, B.1, p.77; application of monoidal completion.

The API comprises:

- f^*M = (M `⊗^L_{H_{R/A}}` `H_{R'/A'})^∧_H.`
- f^* is left adjoint to restriction of scalars `D̂_H(H_{R'/A'})` → `D̂_H(H_{R/A}).`
- f^*(M ⊗̂^L N) ≃ f^*M ⊗̂^L f^*N and `f^*H_{R/A}` ≃ `H_{R'/A'}.`
- id^* ≃ id.
- (g ∘ f)^* ≃ g^* ∘ f^*.
- On perfect complexes f^* ≃ − `⊗^L_{H_{R/A}}` `H_{R'/A'},` uncompleted.
- `f^*(H_{R/A}/(q^m` − 1)) ≃ `H_{R'/A'}/(q^m` − 1).
- `Pic(H_{R/A})` → `Pic(H_{R'/A'}),` [L] ↦ [L `⊗_{H_{R/A}}` `H_{R'/A'}].`
- The Picard map agrees with f^* on invertible objects under the fully faithful inclusion of `Pic(H_{R/A})` into the invertible objects of `D̂_H(H_{R/A}).`

**Checks.**

- For f = id, f^* ≃ id and picMap = id.
- For f: (Z, Z) → (Z, Z[1/2]), `f^*(H_{Z/Z}/(q²` − 1)) ≃ `H_{Z[1/2]/Z}/(q²` − 1) ≅ Z[1/2][q]/(q² − 1) ≅ Z[1/2] × Z[1/2], since (q − 1) − (q + 1) = −2 is a unit.
- `⊕_{n≥0}` `H_{Z/Z}` is not Habiro-complete: Σ_n (q;q)_n e_n converges in its Habiro completion but has infinitely many non-zero coordinates; so f^* and colimits must be completed.
- For M = `H_{R/A}^n,` f^*M ≃ `H_{R'/A'}^n,` without completion.
- For Habiro-complete N over `H_{R'/A'},` maps `f^*H_{R/A}` → N correspond to maps `H_{R/A}` → N of `H_{R/A}-modules,` i.e. to the underlying object of N.

### 6.2 Transporting the K-theory line bundles

Let F be a number field, choose positive Δ divisible by 6 and disc(F), put R=𝒪_F[1/Δ], and let `κ:H_{R/ℤ}≃H_R` be the Taylor-compatible comparison. Under HabiroNumberFields' line contract's effective global descent and tensor-bijectivity hypotheses, define `M_ξ=κ^*H_{R,ξ}` for ξ∈K₃(F). The imported inverse pairing and multiplication equivalences give M₀≃H and M_ξ⊗_H `M_η≃M_{ξ+η};` hence ρ_F:K₃(F)→Pic(H), ξ↦[M_ξ], is a group homomorphism.

These are actual invertible modules and actual pairing maps. Local p-adic freeness, a symbol for an unspecified line, or a homomorphism between unnamed groups would not supply this construction. No global freeness or existence of a nonzero Picard class follows from it.

*Needs:* [§5.9][r69]; [§6.1][r70]; gap:number-field-lines.

See [Q], §1.1, paragraph 1.4, p.4; [G], §1.5, Theorem 2, p.10; §3.3, proof, p.43.

The API comprises:

- For positive Δ divisible by 6 and disc(F) and the actual HabiroNumberFields line contract global line/tensor certificates, `ξ↦[κ^*H_{R,ξ}]` is a group homomorphism `K₃(F)→Pic(H_{R/ℤ}).`

**Checks.**

- For ξ=0 the transported line is H with the transported unit pairing. For ξ and −ξ their actual tensor pairing gives H, rather than only an equality of local ranks.
- Taking Δ=6·|disc(F)| meets both source restrictions. For F=ℚ(i), Δ=12 also meets them: 6∣12 and −4∣12, although 24∤12; the localization is still ℤ[i][1/6]. Taking Δ=|disc(F)| when it is prime to 6 is permitted for the ring comparison but does not meet this line construction's source hypothesis.
- Neither a free p-adic section at each prime nor a chosen class in an unnamed Picard group specifies M_ξ. The required global module and its multiplication maps must exist before κ-pullback.

### 6.3 The q−1 completion map

The first finite-stage projection gives `c:H_{R/A}→R[[X]],` X=q−1, compatibly with completion and maps of pairs. In the classical integral case HabiroCyclotomicCompletions Layer 4 supplies injectivity. For R=ℤ[1/p], the ring splits into nonzero factors S_a indexed by p-adic valuation of root orders. The map c is injective on the a=0 factor and kills every factor a≥1.

Thus c has nonzero kernel after inverting a prime: the idempotent supported on an a≥1 factor is killed. This is a ring-level obstruction to extending classical Taylor injectivity to all relative coefficients. It says nothing about whether a particular transported K₃ class is nonzero.

*Needs:* [§5.1][r62]; [§5.5][r65]; HabiroCyclotomicCompletions §5.3; HabiroCyclotomicCompletions §4.3; HabiroCyclotomicCompletions Layer 5.

See [Q], §1.1, paragraph 1.4, p.4; §2.2, proof of Lemma 2.12, p.18; localization example above.

The API comprises:

- The projection `c:H_{R/A}→R[[X]],` X=q−1, is natural in pairs and identifies derived (q−1)-completion; it is not generally injective.

**Checks.**

- For R=ℤ the classical Taylor map is injective. For R=ℤ[1/2] the idempotent supported on root orders of 2-adic valuation one is nonzero and maps to zero under c.
- The zero coefficient ring gives the unique zero map. For any pair, the composite H→R[[X]]→R agrees with order-one constant evaluation, fixing the variable X=q−1.
- Over ℤ the polynomial q maps to 1+X and q² maps to 1+2X+X². Substituting 1−X would reverse the linear coefficient and fail this normalization check.

### 6.4 Trivializing the order-one fiber

The arithmetic evaluator and its preimage of 1 require gap:integral-linear-jet, in addition to gap:number-field-lines.

Under the HabiroNumberFields line contract descent and tensor hypotheses, let v=constantCoeff∘c:H→R. The evaluation of a transported section at the order-one root defines an R-linear map `e_ξ:R⊗_{H,v}M_ξ→R,` r⊗f↦r f₁(0). The order-one Kummer torsor is canonically trivial, so this value needs no root choice. The actual inverse-tensor certificate supplied by HabiroNumberFields' line contract gives a preimage of 1.

The source is invertible over R, so the surjective map e_ξ is bijective; its resulting linear equivalence is uniquely determined by the evaluation map. This trivializes the fiber at q=1. It does not trivialize M_ξ over H. There is no assumed R→H coefficient map: the scalar structure in this tensor product is v:H→R.

*Needs:* [§6.2][r71]; [§6.3][r72]; [§5.9][r69]; gap:number-field-lines; gap:integral-linear-jet; `Module.Invertible`; `Module.Invertible.bijective_of_surjective`; `PowerSeries.constantCoeff`; `TensorProduct.lid`.

See [G], Definition 1.4, printed p.10; Proposition 1.5(f), printed p.11; [G], Theorem 2, (25), printed p.10; its proof in §3.3, printed p.43.

The API comprises:

- For every x in R⊗_H M, t(x)=e(x).
- `e(t^{-1}(1))=1.`
- For every x in the fibre, `e(x)·t^{-1}(1)=x.`
- Any R-linear equivalence with underlying evaluation e equals t.
- If evaluation is multiplied by a unit u of R, its normalized fibre equivalence is u times t.
- For a ring homomorphism f:R→S and an f-semilinear map u between the actual fibres, if e′(u(x))=f(e(x)) for every x, then t′(u(x))=f(t(x)). This preserves the normalization under HabiroNumberFields' line contract supported field pullback; it does not assert existence of u or arithmetic naturality.
- For the actual invertible fiber R⊗_H M and an R-linear evaluator e with a preimage of 1, the equivalence t:R⊗_H M≃R has underlying map e. The tensor-unit evaluator and its negative give distinct normalizations; the zero map has no preimage of 1 over ℤ.

**Checks.**

- For H=R, M=R and e the Mathlib tensor-unit map, t(1⊗r)=r for every r. In the actual regulator application this is ξ=0.
- For H=R=Z and e the negative tensor-unit map, t(1⊗3)=−3. A construction ignoring the evaluation normalization fails.
- For H=R=M=Z, the zero evaluator on Z⊗_Z Z has no preimage of 1 and cannot be used to construct t.

### 6.5 From the first fiber to the completed line

The local scalar instance `completedLineCoeffAlgebra` is constant coefficient R[[X]]→R. For any commutative R, an invertible module P over B=R[[X]] with a specified equivalence P/XP≃R is free of rank one. Lift a generator and use X∈Jac(B) and Nakayama to obtain a surjection B→P; invertibility makes it an isomorphism. Finite projectivity ensures that completed base change of the transported line has the requisite reduction and remains invertible.

Apply this to P=B⊗_H M_ξ, using the order-one equivalence and the tensor base-change identifications. The full basis is not canonical: another lift changes it by a unit in 1+XB. R need not be a local ring. The supplier's integral constant evaluation suffices; one must not assume every higher Taylor coefficient of a line section is integral.

*Needs:* [§6.4][r73]; [§6.1][r70]; gap:number-field-lines; `Module.Invertible`; `Module.Invertible.bijective_of_surjective`; `Module.Invertible.free_iff_linearEquiv`; `CommRing.Pic.mk`; `CommRing.Pic.mk_eq_one_iff`; `CommRing.Pic.mapRingHom`; `PowerSeries.constantCoeff_surj`; `PowerSeries.X_dvd_iff`; `PowerSeries.isUnit_iff_constantCoeff`; `Ideal.mem_jacobson_iff`; `Submodule.mkQ_surjective`; `LinearMap.toSpanSingleton`; `LinearMap.surjective_of_surjective_comp_mkQ`; `TensorProduct.AlgebraTensorModule.cancelBaseChange`; `TensorProduct.quotTensorEquivQuotSMul`; `RingHom.quotientKerEquivOfSurjective`.

See [Q], §1.1, paragraph 1.4, printed p.4; [G], Proposition 1.5(f), printed p.11; §3.3, printed p.45.

The API comprises:

- `completedRegulatorTriviality`: For every commutative R and invertible P over R[[X]], Nonempty(P/XP≃R) implies Nonempty(P≃R[[X]]); the equivalences are R[[X]]-linear, with R acted on by constant coefficient. No locality or Noetherianity is assumed.

**Checks.**

- For P=R[[X]] and the identity fiber marking, any lift of 1 reducing to 1 is a unit. Lifts 1 and 1+X give different bases with the same fiber marking when R=ℤ.
- Take R=ℤ×ℤ, which is not local. The same theorem applies to every invertible P with trivial fiber; no local-ring hypothesis on R is used by Nakayama for (X).
- For R=0 the unique module and both equivalences are trivial. Without an integral fiber equivalence, local p-adic rank one does not provide the displayed hypothesis.
- In the constant-coefficient scalar action over ℤ, X·3=0. The ordinary multiplication of power series would instead retain 3X and is not this action on the coefficient module.
- The constant series 2 acts on 3 by 6. A zero scalar action would fail this check and the unit law.
- The series 1+X acts on 3 by 3. Acting by evaluation at X=1 would give 6 and would not define the required quotient action.

### 6.6 Vanishing of the completed Picard class

Under the same number-field global descent and integral linear-jet hypotheses, Pic(c)(ρ_F(ξ))=0 in Pic(R[[X]]) for every ξ∈K₃(F). The completed line is B⊗_H M_ξ, and the preceding fiber and Nakayama argument supplies an actual free rank-one B-module. Its inverse pairing and all tensor identifications are transported from HabiroNumberFields' line contract.

The result is conditional on that supplier's global line construction. It does not follow from local rank one alone or from the printed p-adic section definition without its corrected integral condition. Nor does it assert that ρ_F is nonzero before completion. The geometric completion theorem for invertible modules supplies the final deduction once the actual integral fiber is known.

*Needs:* [§6.2][r71]; [§6.3][r72]; [§6.4][r73]; [§6.5](#65-from-the-first-fiber-to-the-completed-line); gap:number-field-lines; gap:integral-linear-jet.

See [Q], §1.1, paragraph 1.4, p.4; [G], §1.5, Proposition 1.5(f), p.11; §3.3, p.45; with the stated integral descent hypothesis.

The API comprises:

- Under the stated global descent, tensor-bijectivity and integral linear-jet hypotheses, Pic(c)(ρ_F(ξ)) is the trivial class for every ξ. It does not assert that ρ_F is nonzero.

### 6.7 Supported field scalar comparison

For a number-field embedding F→E, choose one positive Δ divisible by 6, disc(F) and disc(E), and put R=𝒪_F[1/Δ], S=𝒪_E[1/Δ]. Assuming the HabiroNumberFields line contract's effective descent and arithmetic naturality, its actual module equivalence transports to `H_{S/ℤ}⊗_{H_{R/ℤ}}M_ξ≃M_{res ξ}`. Hence Pic(H_Rel→H′_Rel)(ρ_F(ξ))=ρ_E(res ξ).

The κ comparisons commute with Taylor expansion, the coefficient map R→S, and order-one evaluation. They therefore give commuting first-fiber and completed Picard squares. Identity and successive embeddings obey the tensor unit and associator coherences. The input is the HabiroNumberFields' line contract equivalence over the Habiro rings, not a tensor over R, since H need not be an R-algebra. This is the supported field pullback; no trace or arbitrary coefficient-change formula is asserted.

*Needs:* [§6.2][r71]; [§6.1][r70]; [§5.1][r62]; [§5.9][r69]; gap:number-field-lines; gap:arithmetic-line-naturality; [§6.4][r73]; [§6.5](#65-from-the-first-fiber-to-the-completed-line); `TensorProduct.AlgebraTensorModule.cancelBaseChange`; `TensorProduct.AlgebraTensorModule.distribBaseChange`; `CommRing.Pic.mk_eq_mk_iff`; `CommRing.Pic.mapRingHom_comp_mapRingHom`; `CommRing.Pic.mapRingHom_id`.

See [G], Definition 1.1, (13), printed pp.6–7; Definition 1.4, printed pp.9–10; [Q], Corollary 2.13, printed p.19, and proof.

The API comprises:

- For a field embedding with a common positive Δ divisible by 6 and both discriminants, and the actual HabiroNumberFields line contract arithmetic naturality certificate, pullback carries M_ξ to `M_{res ξ}` and commutes with first-fiber and completed Picard comparisons.

**Checks.**

- The identity field embedding gives the tensor-unit isomorphism. Two successive embeddings give the same module map under the tensor associator, using the imported arithmetic naturality certificate.
- A common Δ divisible by 6 and both discriminants makes both coefficient algebras admissible. A tensor over 𝒪_F[1/Δ] would require a coefficient action that is not generally available on H.

### Examples

The evaluator checks above distinguish its normalization from its negative and from zero. The (ℤ×ℤ)[[X]] example requires no local coefficient ring.

### Dependencies

Layers 1–5, the completed tensor of HabiroCohomologyFoundations §0.1, and Mathlib invertible-module/Picard/tensor APIs. The transported K₃ line statements additionally require the actual HabiroNumberFields line contract global module, inverse-tensor, integral linear-jet and supported arithmetic naturality certificates. No Habiro–Hodge or trace object is an input.

## Layer 7: Examples distinguishing the arithmetic construction

These computations test the coefficient algebra, the gluing law and the finite-stage polynomial structure. They also identify the limits of otherwise familiar classical statements.

### 7.1 All four factors of Φ₅ modulo 11

Compute Φ₅(q)=q⁴+q³+q²+q+1=(q−3)(q−4)(q−5)(q−9) in 𝔽₁₁[q]. The four roots are distinct, so the Chinese remainder map gives 𝔽₁₁[q]/Φ₅≃𝔽₁₁⁴. Hensel lifting produces the corresponding four ℤ₁₁ factors and hence four Taylor-series factors; at precision 11⁴ the roots lifting 3,4,5,9 are 2786,7825,1963,2066.

This splitting contradicts the finite-field irreducibility assertion in the proof of Q, Lemma 2.12; its full-algebra comparison uses all four factors. Mathlib's polynomial evaluation and CRT supply the abstract factorization, while Tau Ceti's conjugate residue map and its lift give an independent all-conjugates interface. Keeping a single root would lose three factors.

*Needs:* [§5.3][r64]; `Polynomial.cyclotomic`; `Ideal.quotientInfRingEquivPiQuotient`; `PadicInt`; `TauCeti.Cyclotomic.conjugateResiduesRingHom`; `TauCeti.Cyclotomic.conjugateResidues_lift`.

See [Q], §2.2, proof of Lemma 2.12, p.18; explicit splitting calculation above.

### 7.2 The components after inverting p

For R=ℤ[1/p] with identity Adams operations, prime-edge conditions at p vanish and the Taylor equalizer splits as `∏_{a≥0}S_a,` with root orders having v_p(m)=a in S_a. Each factor is nonzero. The first Taylor map c at q=1 uses only S₀, is injective on that factor by the existing classical root-connectivity argument, and kills the other factors.

This ring has nontrivial idempotents and is not a domain. It also shows why a Taylor map at one root need not detect the entire relative ring. The admissible coefficient ring is ℤ[1/p], which is étale over ℤ; ℤ_(p) is a different localization and is not the finite-presentation étale input in this example.

*Needs:* [§5.5][r65]; HabiroCyclotomicCompletions §5.3; `Algebra.Etale`; HabiroCyclotomicCompletions Layer 5.

See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; specialization of the Taylor equalizer.

### 7.3 Constants over the localized cubic ring

Take F=ℚ(∛2), whose integers are ℤ[∛2] and whose discriminant is −108; put R=ℤ[∛2][1/6]. It is étale over ℤ. In the Taylor presentation a constant family r belongs to `H_{R/ℤ}` exactly when every completed Frobenius φ_p, p∤6, fixes its image. There is generally no map inserting all of R as constants.

At p=5, x³−2=(x−3)(x²+3x+4) modulo 5, and the quadratic factor is irreducible. Thus R̂₅ is ℤ₅ times an unramified quadratic extension, where Frobenius moves the quadratic component of ∛2. The element ∛2 therefore fails the gluing test. Every global endomorphism of R fixes the cubic generator, so it cannot recover this completed map.

*Needs:* [§5.4][r66]; [§5.8][r67]; [completed Frobenius][r27]; `PadicInt`.

See [Q], §2.2, Remark 2.8 and 2.11, pp.16–17; explicit cubic calculation above.

### 7.4 The finite-stage obstruction

The finite-stage Frobenius obstruction is owned here: for étale R/ℤ, positive m, a prime p∣m and injective R→R̂_p, a ℤ[q]-algebra equivalence qW_m(R)≃R[q]/(qᵐ−1) forces the completed φ_p to preserve R. Reduce to m=p by the F-pushout, normalize the q=1 ghost automorphism, and compare the other ghost on the p-completion. Uniqueness of completed étale Frobenius and injectivity descend it to R ([W], Corollary 2.52 and proof, pp.35–36). No equivalence of unmarked rings is asserted.

*Needs:* QWittVectors §§5.1–5.2 and §6.1; the injectivity R→R̂_p in the statement.

**Checks.**

- For R=ℤ the equivalence exists and the forced map is id; on 3 it gives 3, agreeing with completed Frobenius.
- For R=ℤ[∛2][1/6] and p=5 the global generator would have to be fixed, whereas its quadratic 5-adic component is moved; hence no such equivalence exists.
- At m=1 there is no p∣m, so qW₁(R)=R supplies no Frobenius obstruction. Dropping the prime-divisor hypothesis would give a false conclusion.


**Cubic finite-stage corollary.** For the same R and any m divisible by 5, `H_{R/ℤ,m}` is not isomorphic to `R[q]̂_{qᵐ−1}` as a ℤ[q]-algebra. Such an isomorphism would reduce to a naive q-Witt quotient comparison and, by W, Corollary 2.52 and the injection R→R̂₅, force a global Frobenius lift at 5. The preceding endomorphism calculation rules this out.

The nonisomorphism is tied to the marked polynomial variable q. It does not claim that no abstract unmarked ring isomorphism can exist. This example verifies both the necessity of the Adams twists in finite gluing and the distinction between Frobenius transitions and ordinary Witt restriction.

*Needs:* The preceding obstruction; [§5.1][r62]; [§7.3](#73-constants-over-the-localized-cubic-ring); [§5.8][r67]; HabiroCohomologyFoundations §0.3 (the marked finite lifts); [Relative q-Witt][r24]; HabiroCyclotomicCompletions §1.4.

See [Q], §2.2, Remark 2.8, p.16; [W], §2.6, Corollary 2.52 and preceding discussion, pp.35–36.

### Examples

The four examples above test all-conjugate coefficients, prime inversion, twisted constants and the marked variable.

### Dependencies

Layers 1–6; the stated classical root-connectivity theorem; polynomial factorization, Hensel lifting and the Tau Ceti all-conjugates residue maps.

## Downstream consumers

**RefinedTraceMethods** imports the scalar interfaces independently of its trace constructions. Its perfectly covered base is QWittVectors §§2.3–2.4's perfect-coverage criterion, with its three equivalent conditions, specified under [perfect covers][r19]. Its completed algebraic tensor is that of HabiroCohomologyFoundations §0.1, with the polynomial/Laurent and coefficient base-change comparisons of [§2.1][r29] and [§2.5][r40], and the spherical completed tensor and its unit in [§2.7][r36]. Its solid comparison is solid unit idempotence and bounded-below monoidality, with both bounded-below factors and the full spectral supplier contract retained. Its coefficient change is the completed ring base-change equivalence in [§5.6](#56-completed-base-change-of-the-ring); arbitrary morphisms of pairs instead use completed scalar extension in [§6.1][r70].

For a number field, the number-field ring equivalence exports the discriminant-localized scalar ring and its full Taylor/Frobenius comparisons. The ring target only needs discriminant inversion. Applications involving the GSWZ lines, and any spectral trace theorem whose own source assumes 6∣Δ, retain that additional hypothesis. The transported Picard character, its completed vanishing theorem and its supported field comparison carry the stated HabiroNumberFields' line contract certificates; the ring equivalence does not supply those certificates automatically.

**HabiroCohomologyFoundationsPartII** and **HabiroNahmSeries** use the ring `H_{R/A}` with its projections, quotients and Taylor presentation, the number-field comparison and the transported lines. The identification of the étale Habiro–Hodge object with `H_{R/A}` is the cohomological interface belonging to HabiroCohomologyFoundations as recorded under [Scope and ownership](#scope-and-ownership); this roadmap adds no second comparison.

## References

The main locators refer to printed page numbers in the fixed versions linked here; PDF viewer indices can differ. The thesis T has four preliminary PDF pages: printed p.86 is PDF p.90.

- **Hab — Kazuo Habiro, _Cyclotomic completions of polynomial rings_, Publications of the Research Institute for Mathematical Sciences 40 (2004), 1127–1146.** [Full text][Hab]. §7.1, Proposition 7.1 and the following Laurent comparison, pp.1141–1142, and §7.3, p.1144, supply the ordinary polynomial and module completions used by Layer 2.
- **Stacks — The Stacks Project.** §10.143, Lemma 10.143.10, tag [04D1], _Commutative Algebra_, chapter PDF p.385, supplies arbitrary-ideal object lifting. §15.11, Lemma 15.11.2, tag [0ALI], _More on Algebra_, chapter PDF pp.28–29, supplies locally nilpotent invariance. §15.93, Lemma 15.93.18, tag [0920], _More on Algebra_, chapter PDF p.267, supplies the Koszul derived-completion tower. Page locators refer to the chapter PDFs, version ed88ff78, compiled 14 July 2026; stable tags identify the statements across later pagination.
- **Q — Ferdinand Wagner, _q-Hodge complexes over the Habiro ring_, arXiv:2510.04782v2.** [Full text][Q]. Its §§2.1–2.2, pp.13–19, locate the finite descent and coefficient lifts consumed from HabiroCohomologyFoundations and the Taylor and number-field presentations proved here; the degree-zero comparison is Corollary 3.13, p.27; completion is Appendix B, pp.77–80. The two-term resolution, finite-field splitting and étale hypotheses are stated in the corrected mathematical forms specified above.
- **W — Ferdinand Wagner, _q-Witt vectors and q-Hodge complexes_, arXiv:2410.23078v5.** [Full text][W]. Degree-zero q-Witt operations and the Λ/relative comparisons occur in §§2.1–2.6, pp.8–35. The Frobenius target in Proposition 2.48 is W_d, as dictated by its index and pushout proof.
- **H — Lars Hesselholt, _The big de Rham–Witt complex_, arXiv:1006.3125v3.** [Full text][H]. Dwork's criterion, integral Frobenius polynomials, generating series and the Witt comonad are in §1, pp.6–19; the cofree adjunction is in §2, p.24. Only the foundational Witt and Λ interfaces needed here are used.
- **B — James Borger, _The basic geometry of Witt vectors, I: The affine case_, arXiv:0801.1691v6.** [Full text][B]. The torsion-free Adams comparison and free arithmetic Λ-ring are in §1, especially 1.17–1.18, pp.12–13.
- **G — Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, _The Habiro ring of a number field_, arXiv:2412.04241v2.** [Full text][G]. The ring is Definition 1.1, pp.6–7; the global line is Definition 1.4, p.10; tensor multiplication is Theorem 2, p.10, with proof in §3.3, p.43. Proposition 1.5(f), p.11, and §3.3, p.45, motivate the first-fiber comparison. The actual integral global lines and supported arithmetic maps are imported from HabiroNumberFields' line contract with its stated hypotheses.
- **Bosco — Guido Bosco, _Rational p-adic Hodge theory for rigid-analytic varieties_, arXiv:2306.06100v1.** [Full text][Bosco]. Proposition A.3 and Lemma A.4, pp.92–93, supply the written abelian p-adic model for the null-family and boundedness arguments. They do not prove the general light solid spectral contract.
- **T — Ferdinand Wagner, _q-Hodge filtrations, Habiro cohomology, and ku_, thesis, 15 August 2025.** [Full text][T]. numbered paragraphs 5.1–5.3, printed pp.85–86 (PDF pp.89–90), describe light solid spectra and their countable-product compact generator.
- **HA — Jacob Lurie, _Higher Algebra_, 18 September 2017.** [Full text][HA]. Proposition 2.2.1.9, p.197, supplies symmetric monoidal localization; Corollaries 3.2.2.4–3.2.2.5, pp.358–359, compute limits of algebra objects; Theorem 7.1.2.13, p.1212, supplies the symmetric monoidal Eilenberg–Mac Lane derived-module comparison; Definition 7.1.3.17 and Proposition 7.1.3.18, p.1219, identify static algebra mapping spaces with ordinary algebra maps.
- **MW — Samuel Meyer and Ferdinand Wagner, _q-Hodge complexes and refined TC−_, author version dated 5 February 2026.** [Full text][MW]. §4.1, 4.1, pp.41–42, describes light solid condensed spectra, the null-sequence criterion and symmetric monoidal solidification. This ambient scalar input is distinct from the refined trace constructions and does not prove all the additional Habiro tower/resolution hypotheses.

[MW]: https://ferdinand-wagner.github.io/papers/q-Hodge.pdf
[Q]: https://arxiv.org/pdf/2510.04782v2
[W]: https://arxiv.org/pdf/2410.23078v5
[r2]: #from-taucetiroadmapqwittvectors
[H]: https://arxiv.org/pdf/1006.3125v3
[r3]: #from-taucetiroadmapqwittvectors
[r4]: #from-taucetiroadmapqwittvectors
[r5]: #from-taucetiroadmapqwittvectors
[r6]: #from-taucetiroadmapqwittvectors
[r7]: #from-taucetiroadmapqwittvectors
[r8]: #from-taucetiroadmapqwittvectors
[r9]: #from-taucetiroadmapqwittvectors
[B]: https://arxiv.org/pdf/0801.1691v6
[r11]: #from-taucetiroadmapqwittvectors
[r14]: #from-taucetiroadmapqwittvectors
[r17]: #from-taucetiroadmapqwittvectors
[r19]: #from-taucetiroadmapqwittvectors
[r20]: #from-taucetiroadmapqwittvectors
[r21]: #from-taucetiroadmapqwittvectors
[r23]: #11-the-category-of-relative-inputs
[r24]: #from-taucetiroadmapqwittvectors
[r25]: #from-taucetiroadmapqwittvectors
[r26]: #from-taucetiroadmapqwittvectors
[r27]: #from-taucetiroadmapqwittvectors
[r28]: #from-taucetiroadmapqwittvectors
[r29]: #21-habiro-completion-in-the-laurent-convention
[r30]: #22-a-free-resolution-of-the-rational-localization
[Hab]: https://ems.press/content/serial-article-files/40881
[r33]: #23-completeness-of-homotopy-modules
[HA]: https://www.math.ias.edu/~lurie/papers/HA.pdf
[r36]: #27-spectral-completion-and-its-unit
[r37]: #28-complete-solid-modules-and-the-discrete-embedding
[T]: https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf
[r38]: #29-solid-idempotence-of-the-unit
[Bosco]: https://arxiv.org/pdf/2306.06100v1
[r40]: #25-the-completed-tensor-laurent-form-and-coefficient-base-change
[r41]: #31-cyclotomic-intersections
[r42]: #32-the-finite-prime-chain-index
[r58]: #41-the-finite-stages-as-functors-on-pairs
[r62]: #51-the-relative-habiro-ring
[r63]: #52-compatible-roots-and-the-two-taylor-maps
[r64]: #53-prime-adic-and-rational-taylor-comparison
[r65]: #55-when-the-twists-can-be-removed
[r66]: #54-the-taylor-equalizer
[r67]: #58-unramified-number-field-coefficients
[G]: https://arxiv.org/pdf/2412.04241v2
[r69]: #59-the-gswz-ring-comparison
[r70]: #61-scalar-extension-of-complete-modules
[r71]: #62-transporting-the-k-theory-line-bundles
[r72]: #63-the-q1-completion-map
[r73]: #64-trivializing-the-order-one-fiber

[04D1]: https://stacks.math.columbia.edu/tag/04D1
[0ALI]: https://stacks.math.columbia.edu/tag/0ALI
[0920]: https://stacks.math.columbia.edu/tag/0920
