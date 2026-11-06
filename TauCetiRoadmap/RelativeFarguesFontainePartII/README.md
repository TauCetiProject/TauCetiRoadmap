# Roadmap: relative Fargues–Fontaine function theory, part II

**Summary.** Develop classical holomorphic function theory on the supplied relative Fargues–Fontaine annuli over every perfect complete rank-one field of characteristic p. From the coefficient norms and primitive equations, build weighted zeros, locally finite divisors, closed ideals and Frobenius products. Prove the general-field Dedekind chart and character class-group theorems, the weighted schematic-curve theorem, effective continuous descent, positive-line presentations and reconstruction of the adic curve from schematic functions with their radial norms. Arithmetic examples include a strict endomorphism of a completed Laurent-series algebraic closure and an untilt of ℂ_p^♭ not topologically isomorphic to ℂ_p.

## Scope and ownership

This continuation starts with coefficient rings, annuli, marked untilts, completed local rings and the graded Proj construction. VectorBundlesAndIsocrystals Layer 0 owns those relative carriers, its Layers 2–4 own the geometric curve, its PID complements, Picard group, bundle classification and Harder–Narasimhan theory, and its Layer 5 owns the degree-one untilt sheaf sequence. Section 6.10 extends that sequence to strict Banach sequences with repeated finite jets and several orbit-separated points. RelativeFarguesFontaine §§0.11–0.14 own the Q-twisted Witt comparison, the Q-Teichmüller lift, the weak coefficient topology and the mixed-characteristic weak Lubin–Tate lift, and its later layers develop relative period geometry over perfectoid bases; the absolute function theory over a single perfect field F is not planned there. This roadmap owns the arbitrary-perfect-field calculations and comparisons, rather than a second curve construction.

Mathlib already provides the p-typical tilt, Fontaine map and algebraic de Rham completions, the Bézout-domain vocabulary, Banach open mapping and controlled nonlinear right inverses. Tau Ceti already provides finite Weil divisors, their weighted degree, the affine finite-projective/sheaf equivalence and the p-typical topological Frobenius quotient with wandering windows. These constructions are excluded from our targets. The retained divisor object differs by locally finite support on noncompact annuli; the reconstruction target differs by its schematic-chart and norm comparison.

PadicDifferentialEquationsAndRigidCohomology §RD.0.54 states the general-local-field bounded period ring, multiplicative raw Gauss norms, Frobenius, henselian overconvergent field, Robba germ, equal-characteristic annulus and finite coefficient change. Those constructions and assertions are excluded here; §§0.2, 0.10, 1.4 and 1.10 refine finite coefficient bounds, normalized endpoint comparisons, finite-extension degrees and two-variable symmetry. Its §§RD.0.18–RD.0.23 own ordinary Laurent-analytic divisors and closed ideals over complete coefficient fields. Our mixed-characteristic Witt annuli are different objects; equal-characteristic comparisons identify the specializations with that theory. AdicSpaces §§6.1–6.4 owns the p-typical adic annuli and quotient; AlgebraicVectorBundles owns generic affine bundle comparison; AdicSpacesPartIII §R3.2 owns Tate-ring gluing; SchemeAndStackFoundations §0.3 owns Proj, base change and positive Veronese invariance; OptimalTransport Layer 5 owns the general closed convex and conjugate theory. No second version of these generic theories is a target.

VectorBundlesAndIsocrystals Layer 0 owns the ramified Witt functor on arbitrary O_E-algebras. RelativeFarguesFontaine §§0.11–0.12 own the Q-twisted Witt comparison and the Q-Teichmüller lift [a]_Q built on it for coefficient fields of characteristic zero, its §0.13 owns the agreement of the weak (π,[ϖ])-adic topology of A with the topology of each interior Gauss norm, and its §0.14 owns the weak Lubin–Tate Teichmüller lift [x]_LT in characteristic zero; none of these is constructed again. The finite truncations W_OE,n and the coefficient diagonal belong to §0.1, together with the equal-characteristic Q-Teichmüller lift on perfect algebras, which differs from the supplied lift by the coefficient characteristic alone; the equal-characteristic weak Lubin–Tate lift belongs to §2.10 for the same reason; Q-compatible inverse limits to §2.1; the general Fréchet–Stein interface over an arbitrary complete nontrivially valued field to §8.4, whose distribution-algebra specialization D(H,L) over a discretely valued field is PadicLocalLanglandsForGL2Qp §0.1 and is not planned again; and the analytic-field differential criterion to §11.2 here. Their specializations supply integral period geometry and Berkovich arithmetic. Generic Lubin–Tate theory belongs to LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2; its all-local-field contract is explicit below. The p-typical Witt covectors belong to FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28a; §1.12 extends them to every coefficient field and owns the bivectors, their growth condition and their summation into B⁺. The positive-degree-two Banach–Colmez obstruction belongs to VectorBundlesAndIsocrystals Layer 5, and is consumed as a model constraint in §11.6.

NewtonPolygons §§0.1–0.6 supplies the common discrete convex envelope, supporting-value and slope-presentation geometry. Section 0.4 adds the real decreasing envelope of ramified Witt coefficients with right horizontal rays and its negative-geometric-slope convention; §0.5 proves the period-ring product comparison.

## Conventions

Fix a prime p and q=p^f with f≥1. The coefficient field E is complete discretely valued with finite residue field 𝔽_q and chosen uniformizer π, with |π|_E=q⁻¹. Mixed characteristic allows every finite extension of ℚ_p; equal characteristic allows 𝔽_q((π)). Fix a nontrivially valued, perfect, complete rank-one field F of characteristic p with an embedding 𝔽_q→F. Its value group need not be discrete. Put v_F=−log_q|·|_F, O_F={|x|≤1}, m_F={|x|<1}, and let k_F be its residue field. A choice 0<|ϖ|<1 specifies a dense localization, not additional geometric structure. All rings are commutative unless a general Fréchet–Stein statement specifies left and right modules. Universes are arbitrary; classical point and divisor index sets live in the universe of the coefficient field, and limits may use its successor. Complete topologies are separated.

Write A=W_OE(O_F), Bᵇ=A[1/π,1/[ϖ]], Bᵇ⁺=A[1/π], B_I for the supplied separated completion on a nonempty interval I⊆[0,1], and B=B_(0,1). A has unique one-sided Teichmüller coefficients Σ_(n≥0)[x_n]π^n. At 0<ρ≤1 use the raw norm |Σ[x_n]π^n|_ρ=sup_n|x_n|ρ^n. At radius zero use the separate norm q^(−v_π(x)); substitution ρ=0 into the supremum is not its definition. For ρ=q^(−r) put v_r=−log_q|·|_ρ; at r=0 this means the coefficient infimum, which is different from v_π. For nonzero functions valuations are finite at interior radii; zero has additive value +∞. No divisor or fraction formula uses a zero denominator.

For r>0 use n_ρ=|·|_ρ^(1/r) for Banach E-space arguments, and the maximum of normalized endpoint norms on a compact interval avoiding 1. These give n_ρ(π)=q⁻¹ and the original topology. At ρ=0 use its normalized discrete-valuation norm. At ρ=1, E has the discrete induced scalar topology. B_I⁺ is the closure of A[1/π] in B_I, and B⁺ is the intersection of the positive single-radius completions inside B. This plus sign differs from the power-bounded ring B_I°: π⁻¹ belongs to B⁺, but its interior norm is greater than 1. E†=colim_(ρ→0)B_[0,ρ] and ℛ=colim_(ρ→0)B_(0,ρ] are the supplied bounded overconvergent field and Robba germ.

A source Newton slope is minus the geometric derivative. The transform is L(P)(r)=inf_x(P(x)+rx)=−P*(−r); the inverse is P(x)=sup_r(L(P)(r)−rx). Thus π−[a] with v_F(a)=s>0 has valuation min(r,s), and a zero of order m gives derivative jump m, with the primitive-degree weight over general F. Endpoint slopes use one-sided conventions. Frobenius raises Teichmüller coefficients to q-th powers and fixes π; its action on a primitive ideal sends (a) to (φ(a)). Consequently ||φ(y)||=||y||^q and div(φf)=φ(div f). For q=2 and ||y||=1/4, the next radius is 1/16; all product shifts below use this direction.

Use the supplied P_d=B^(φ=π^d), P=⊕_(d≥0)P_d and X=Proj(P). For t∈P₁ nonzero, Be_t=(B[1/t])^(φ=1)=(P[1/t])₀. It differs from the invariant rational-function field. The twist with multiplier π^(−n)φ has section eigenvalue π^n and degree n: O(1) has degree 1 and its dual degree −1. De Rham rings are the supplied ramified Cartier completions; at E=ℚ_p compare with Mathlib's p-localized constructions. A length-two jet has residue length 2; it is not the product of two residue fields.

“Geometric” means F algebraically closed; all other period statements retain the standing perfect F. Set C=completion(Fbar) and G_F=Gal(Fbar/F). Unramified constant fields E_h are used only with the required residue embedding; otherwise retain their descent data. Continuity refers to the named Banach, weak Witt or finite-jet topology. Finite generation, finite presentation, projectivity, coadmissibility and closedness are distinct properties. A divisor on Y_I has locally finite support on compact subintervals of I∩(0,1). A divisor on Y/φ^ℤ has finite support with weight deg(y), never [K_y:E]. A weighted complete curve means a regular noetherian integral one-dimensional scheme with its weighted product formula; it asserts no finite-type properness over E.

## Exact supplier contracts

### From Mathlib

Use `WittVector`, `PreTilt`, `WittVector.fontaineTheta`, `WittVector.fontaineTheta_teichmuller` and the root-namespace `surjective_fontaineTheta` from `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` (lines 165, 182, 195). The map requires a p-adically complete commutative ring, prime p and the indicated nonunit condition; surjectivity additionally requires surjective Frobenius modulo p. `fontaineThetaInvertP`, `BDeRhamPlus` and `BDeRham` in `Mathlib/RingTheory/Perfectoid/BDeRham.lean` (lines 62, 75, 88) supply the p-localized map, kernel completion and generator localization. If p=0 in the base ring these localized constructions are zero rings; equal-characteristic Cartier completions use their own supplied interface.

Use `WittVector.Isocrystal` in `Mathlib/RingTheory/WittVector/Isocrystal.lean` (line 113), a Frobenius-semilinear automorphism over the Witt fraction field of a perfect characteristic-p domain. Finite dimensionality is an additional hypothesis; no algebraic-closedness or fixed maximal-unramified coefficient field is imposed. Use `IsBezout` in `Mathlib/RingTheory/PrincipalIdealDomain.lean` (line 65) for finite-generated ideals and `IsBezout.TFAE` in `Mathlib/RingTheory/Bezout.lean` (line 55) with the domain hypothesis; the latter requires an additional noetherianity or equivalent condition to obtain principality of all ideals.

Use `ContinuousLinearMap.isOpenMap` and `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` in `Mathlib/Analysis/Normed/Operator/Banach.lean` (lines 228 and 278), for complete normed spaces over a complete nontrivially normed field. The second provides a bounded nonlinear right inverse, with no continuous-linear-section assertion. `ApproximatesLinearOn.image_mem_nhds` in `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ApproximatesLinearOn.lean` (line 290) supplies the local-surjectivity principle after the actual derivative and quadratic bounds are verified.

For §11.3 use `PadicComplex` (notation `ℂ_[p]`), its valuation `PadicComplex.valued`, `PadicComplex.isAlgClosed` and `PadicComplexInt` (notation `𝓞_ℂ_[p]`, a `ValuationSubring`) in `Mathlib/NumberTheory/Padics/Complex.lean` (lines 137, 145, 244, 251), and `PreTilt` in `Mathlib/RingTheory/Perfection.lean` (line 633), whose ring structure requires the class `Fact (¬ IsUnit (p : O))`; for `O=𝓞_ℂ_[p]` that class is provided by the instance `fact_not_isUnit_natCast_padicComplexInt` of `Suggested.lean`, proved from `PadicComplex.valuation_p` (the same file, line 162, the valuation of `p` is `1/p`) and `PadicComplexInt.integers` (line 257, `𝓞_ℂ_[p]` is the ring of integers of the valuation, so its units have valuation one). `PreTilt.untilt` in `Mathlib/RingTheory/Perfectoid/Untilt.lean` (line 49) is the multiplicative untilt map. `PadicComplexInt` carries no perfectoid or tilting-equivalence API. For §11.5 use `HahnSeries` with its field structure `HahnSeries.instField` in `Mathlib/RingTheory/HahnSeries/Summable.lean` (line 885, over an ordered additive group and a field), `HahnSeries.order` in `Mathlib/RingTheory/HahnSeries/Basic.lean` (line 358, with junk value 0 at 0), `HahnSeries.C` in `Mathlib/RingTheory/HahnSeries/Multiplication.lean` (line 790) and `AlgebraicClosure`; no maximal-completeness or Kaplansky embedding theorem is supplied.

For §11.2 use `LaurentSeries` with `LaurentSeries.valued` in `Mathlib/RingTheory/LaurentSeries.lean` (line 502), `IsAlgClosure` in `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` (line 264), `NormedField`, `Valued.v`, `UniformSpace.Completion`, `Continuous` and `Function.Surjective`. The algebraic-closure class records algebraicity and algebraic closedness; it includes no topology. The signature separately requires the norm on K to induce exactly the Laurent valuation ordering on the embedded base field. It asserts no isometry of the eventual endomorphism.

For the analytic-field support use `KaehlerDifferential` and `KaehlerDifferential.D` in `Mathlib/RingTheory/Kaehler/Basic.lean` (lines 148 and 226), and `KaehlerDifferential.linearMapEquivDerivation` there (line 355). They give the algebraic differential module and universal derivation for commutative algebra extensions, with no seminorm or separated norm completion. The additional nonexpanding seminorm and completed universal property belong to §11.2.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.WeilDivisor`, `TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint` and `TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree` in `TauCeti/AlgebraicGeometry/WeilDivisor/Basic.lean` (lines 45, 99, 339). Their carrier is the finitely supported integer functions on a point set and the degree is the weighted sum. Specialize it to finite-support and orbit divisors; it includes no noncompact local-finiteness condition. Use `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv` in `TauCeti/AlgebraicGeometry/VectorBundle/Affine/Basic.lean` (line 102) for affine schemes, with its finite-locally-free hypothesis.

For E=ℚ_p use `TauCeti.FarguesFontaine.spaY` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean` and `TauCeti.FarguesFontaine.spaX` with `TauCeti.FarguesFontaine.isOpenQuotientMap_quotientMap` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean`. The companion `Window.lean` gives the rational wandering windows, radius inequalities and free iterated action. These are topological carriers and quotient maps; sheaf and affinoid-chart identifications use the roadmap contracts below.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

Layer 0, Ramified coefficient rings and coefficient changes, supplies W_OE(A) for every O_E-algebra A, with ghost polynomials, universal integral operations defined without ghost injectivity, functoriality, reduction and Frobenius–Verschiebung relations; on perfect inputs it supplies the strict lift, one-sided expansion, Frobenius and finite coefficient comparison. Relative annuli and their section rings supplies the rings, restriction maps and ramified norms on general perfectoid bases. Marked untilt Cartier divisors and Cartier descent supplies the ramified theta and primitive degree-one dictionary, regular inclusions and closed multiplication; Completed local period rings supplies finite thickenings and geometric complete DVRs. Rank-one Frobenius twists and Homogeneous section ring and partial schematic charts supplies P, twists, homogeneous localization and X. At an absolute field identify the sections of O(d) with P_d, with the usual eigenvalue sign. Radius dictionary: Layer 0's Gauss norm sup_n|π|^n|x_n|^(ρ_VB) at ρ_VB=1/r is the normalized norm n_ρ at our raw radius ρ=q^(−r); on x=[a]π^n with v_F(a)=v both equal q^(−(n+v/r)). Layer 0's Frobenius on points is precomposition with φ, sending ρ_VB to qρ_VB (raw radius ρ to ρ^(1/q)); it is the inverse of the ideal action (a)↦(φ(a)) of the Conventions, which sends π−[a] with v_F(a)=r to π−[a^q] of valuation radius qr. On functions both use the same Witt Frobenius.

Layer 2, Annular Frobenius descent for bundles and Slope-sensitive cohomology of standard bundles, supplies geometric annular descent and positive-twist cohomology. Classical points and annular Dedekind rings and Regular noetherian geometric curve and PID complements supplies the geometric PID charts; Layer 4, Classification and Hom/Ext calculations, supplies the geometric bundle classification used for a Frobenius line, and Layer 3, Norm topology on twisted Frobenius invariants, supplies the Banach topology of each fixed twisted Frobenius-invariant space with its independence of sufficiently small radii, a separate assertion for each twist. Layer 5, Lubin–Tate universal cover and sections of O(1), supplies the period/logarithm comparison; The fundamental untilt sequence and degree-one divisors supplies its degree-one sheaf sequence over an E_∞-untilt. In the geometric specialization apply sections and the supplied twist cohomology before the finite-jet refinement. Consume these at their stated coefficient and base hypotheses.

What VectorBundlesAndIsocrystals must provide (the degree-two obstruction contract): Prove the explicit obstruction to representing the degree-two Banach–Colmez diamond B^(φ=p²) for F=ℂ_p^♭ by an analytic or perfectoid space, separately from the sufficient positive-slope representability criterion.

### From TauCetiRoadmap.RelativeFarguesFontaine

Section 0.11, Q-twisted Witt vectors, supplies, for E of characteristic zero, Q∈O_E[X] with Q≡X^q modulo π and every O_E-algebra A, the Q-twisted ghost polynomials w_(n,Q)(x)=Σ_(i≤n)π^i Q_(n−i)(x_i), the twisted Witt algebra with these ghosts and its canonical ghost-preserving isomorphism with W_OE(A). Section 0.12, Q-Teichmüller lift, supplies [a]_Q∈W_OE(A) with ghosts Q_n(a), the identity Q([a]_Q)=[Q(a)]_Q, the unique V_π-expansion, and for perfect A the limit formula [a]_Q=lim_n Q_n(â_n) over arbitrary lifts â_n of a^(q^(−n)); it asserts no multiplicativity of the lift. Section 0.13, Weak coefficient topology, supplies, for the perfect complete valued field F and A=W_OE(O_F), the equality of the (π,[ϖ])-adic topology with the topology induced by each interior Gauss norm |·|_ρ, 0<ρ<1, and excludes ρ=1 from that assertion. Section 0.14, Lubin–Tate Teichmüller lift, supplies, for E of characteristic zero and a Lubin–Tate formal O_E-module, the weak limit [x]_LT=lim_n[π^n]_LT([x^(q^(−n))]) on m_F as an injective map intertwining the formal group law and the O_E-scalar endomorphisms, with no ordinary additivity. Consume all four at their characteristic-zero coefficient hypothesis; the equal-characteristic forms are §§0.1 and 2.10.

### From TauCetiRoadmap.PerfectoidSpaces

P1.19–P1.22 supplies marked untilts and primitive ideals; P3.7 supplies algebraic closedness under tilting and P3.11–P3.12 supplies almost purity and finite étale tilting. Quantitative cochain bounds are a separate contract; §§4.1, 4.2, 7.2 and 9.3 turn those field estimates into the Witt, jet and annular statements. Finite group descent itself is AdicEtaleGeometry §A4.2a, with the Galois tensor isomorphism and faithful flatness. Infinite-tower full faithfulness is not used as an effectivity theorem.

What PerfectoidSpaces must provide (the quantitative cochain contract): Provide norm-controlled continuous additive and principal-unit cochain corrections for complete perfect characteristic-p fields and every marked perfectoid untilt, including finite-dimensional semilinear residue modules, with compatible bounds under finite extension and inverse limits.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Section R07.2.28a supplies the p-typical Witt covectors CW over a perfect 𝔽_p-algebra base, for every algebra over that base, with the nilpotent-tail condition, stabilized addition, Frobenius, Verschiebung, finite-length Witt inclusions, nilpotent-tail subfunctors and base change; with the base 𝔽_p this covers every 𝔽_p-algebra. It asserts no ramified or equal-characteristic coefficient version, no inverse-Verschiebung limit and no summation into a period ring; those are §1.12.

### From TauCetiRoadmap.CrystallineCohomology

Use §CR.1.1, PD schemes and crystalline sites, for the ring/affine-thickening variance, the structure sheaf and the p-adic pro-system. Generic PD envelopes and their completions are supplied by DerivedDeRhamCohomology §§PD.1–PD.2 and PD.4–PD.7, rather than a second PD construction here.

What CrystallineCohomology must provide (the pro-final-radius contract): Identify the p-completed PD envelope of ker(W(O_F)→O_F/a_ρ), compatible with the base divided powers on p, as the pro-final p-adic thickening computing degree-zero crystalline sections, with the ring and affine universal-property directions specified.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

Use LT.0 Analytic logarithm, LT.1 Lubin–Tate formal module, and LT.2 Tate module and its comparison. The mixed-characteristic input retains its finite-ℚ_p hypotheses. The following extension supplies the equal-characteristic formal coefficient action; §§2.10 and 6.9 compare its periods, rather than dropping a characteristic hypothesis.

What LubinTateFormalModulesAndQuasiCanonicalLifts must provide (the all-local-field Lubin–Tate contract): Provide the formal-module, inverse-division Tate-module and normalized convergent logarithm interfaces over every complete discretely valued field with finite residue field, including equal characteristic and its additive coefficient action.

### From TauCetiRoadmap.OptimalTransport

Layer 5(1)–(2) supplies proper lower-semicontinuous EReal-valued convex functions, conjugation and Fenchel–Moreau for the real dual pair with its Hausdorff locally convex topology. Section 0.4 specializes this to decreasing coefficient polygons and fixes the minus-conjugate convention. The additional convolution law is the following exact contract.

What OptimalTransport must provide (the closed infimal-convolution contract): Provide the closed infimal-convolution conjugacy identity for proper lower-semicontinuous extended-real convex functions whenever the closed convolution is proper, including the real one-dimensional decreasing polygons with infinite endpoint values.

### From TauCetiRoadmap.SchemeAndStackFoundations

Section 0.3 supplies arbitrary graded relative Proj, base change and every positive Veronese comparison, with no degree-one-generation or finite-generation assumption for the last comparison. Section 1.23 supplies coarse finite affine quotients; §10.3 requires the following scheme-torsor extension with geometric freeness and affine orbit neighborhoods.

What SchemeAndStackFoundations must provide (the scheme-torsor contract): For a finite constant group action on a scheme whose every orbit lies in an affine open, construct the scheme quotient and prove that freeness on geometric points makes the quotient map a finite étale torsor, without assuming the group order is invertible.

### From TauCetiRoadmap.LocallyAnalyticDistributions

Section 0.0 supplies nonarchimedean locally convex spaces, separated completion, projective limits and their initial topology over a complete nontrivially valued ultrametric field. Its §0.2 supplies spherical-completeness language. Countable compact-type regularity and strong-dual results retain their finite-ℚ_p or spherical-completeness hypotheses; none is applied to arbitrary inverse systems merely because they are complete.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

Use §RD.0.54 for the dense bounded period ring, multiplicative raw norms, Frobenius, E†, ℛ, equal-characteristic Laurent comparison and finite coefficient change, including the chosen residue factor. Use §§RD.0.18–RD.0.23 for ordinary Laurent preparation, divisors, interpolation and closed ideals in the equal-characteristic comparison; its discrete-Cohen-coefficient analytic Bézout theorem is not an arbitrary-perfect-field Witt theorem. Use §RD.0.51(b) for the fixed field of the completed algebraic closure of a complete characteristic-p field, namely the completed perfection of that field, and §RD.0.52 for the mixed-characteristic ramified Witt-coefficient fixed field; §4.1 specializes them to the perfect complete F and derives the integral and equal-characteristic Witt forms by coefficient uniqueness.

### From TauCetiRoadmap.AdicSpaces and TauCetiRoadmap.AdicSpacesPartIII

AdicSpaces §§6.1–6.4 supplies p-typical annular Huber pairs, sheaves and quotient charts. If |ϖ|=p^(−α), raw ρ=p^(−r) corresponds to its window parameter κ=α/r. Keep its power-bounded plus ring distinct from B_I⁺. AdicSpacesPartIII §R3.2 supplies gluing squares and finite-projective descent for complete Hausdorff Tate rings, with strict exactness, density and maximal-spectrum coverage as the defining conditions (*glueing-square*), the finite-module surjectivity theorem *glueing-square-finite-surjectivity*, *glueing-square-finite-projective-descent*, and *matrix-factorisation-strict-surjection*, whose factorization radius depends only on the strict surjection. Section 8.9 verifies the defining conditions on annular squares and applies these theorems as stated. PadicHodgeTheory §§1.2–1.4 supplies the classical cyclotomic annuli, convergence conditions and Frobenius comparison. AlgebraicVectorBundles supplies affine sheaf/module comparison; the noncompact interval equivalence is §8.6.

### From TauCetiRoadmap.NewtonPolygons

Use §§0.1–0.6 for discrete convex envelopes, extended supporting values, integer-indexed translations, finite convolution and slope presentations, and §§2.1–2.3 for the ordinary coefficient/Gauss dictionary in the monomial comparison. Finite horizontal lengths count multiplicity. Its geometric slope is the negative of the positive source slope used here; adjoining the right horizontal rays is part of the period specialization, not a change to the generic polygon carrier.

## How to read the build

Layers 0–2 establish normalized norms, boundaries and primitive equations on the supplied carriers. Layers 3–5 turn zeros into weighted divisors, products and closed ideals. Layers 6–7 prove the eigenvector exact sequences and arbitrary-perfect-field Dedekind charts. Layers 8–9 establish the interval site, uniform generation, effective gluing and continuous descent before Layer 10 uses them for Frobenius lines, finite covers and reconstruction. Layer 11 gives the arithmetic and valued-field examples. Each statement carries its standing hypotheses plus its explicit additional hypotheses; its Needs line lists the inputs to the stated route. A different proof may use a different subset of those inputs. Suggested.lean states the three native-carrier headlines expressible at the pins (§§11.2, 11.3 and 11.5); the other headline carriers and their full mathematics live here.

## Layer 0: Gauss norms, Newton polygons and completed annuli

Compare the absolute specialization of the supplied annuli, then develop finite coefficient estimates, closed Newton polygons and endpoint normalization.

### 0.1 Classical and relative period annuli

For S=Spa(F,O_F), compare the supplied relative annular ring with the separated completion of Bᵇ for the raw Gauss family, after the radius conversion. Preserve E-algebra operations, restrictions, Frobenius and every interior norm. At E=ℚ_p identify it with AdicSpaces §6.3. For ρ=q^(−r), r>0, use n_ρ(f)=|f|_ρ^(1/r) for normed E-space arguments; n_ρ(π)=q⁻¹. Use n₀=|·|₀ at zero and the maximum of normalized endpoint norms on compact intervals avoiding 1. Intervals containing 1 carry discrete scalar topology on E. The comparison is independent of the chosen ϖ.

For the arbitrary-coefficient support, consume the ramified Witt functor W_OE(A) of VectorBundlesAndIsocrystals Layer 0 on every O_E-algebra A in mixed characteristic, with its ghost polynomials, universal integral operations, functoriality, reduction and Frobenius–Verschiebung relations. Its operations do not use ghost injectivity, so they apply to O_E/π² and to every algebra with π-torsion. Two additions are made here. The finite truncations W_OE,n(A), the quotients by the image of the n-fold Verschiebung, commute with coefficient maps. Construct the natural coefficient diagonal Δ:W_OE(A)→W_OE(W_OE(A)) whose ghost coordinates are the Frobenius iterates (F^n x)_(n≥0), and prove F∘Δ=W_OE(F)∘Δ=Δ∘F and Δ([a])=[[a]]. These identities are checked on π-torsion-free universal inputs, where the ghost map is injective, and pass to arbitrary A by specialization. (FF17, §1.2.1, p. 53, for the functor; Lemma 1.2.3 and the diagonal stated after it, p. 55.)

**API.**

- Finite Witt truncations, restriction and coordinates commute with coefficient maps.
- The zeroth coordinate of Δ(x) is x, and Δ sends the Teichmüller representative [a] to the iterated representative [[a]].
- Δ intertwines the Witt Frobenius: F∘Δ=W_OE(F)∘Δ=Δ∘F, since all three have ghost coordinates (F^(n+1)x)_(n≥0).

**Checks.**

- At truncation length 0 the carrier is the zero ring; at length 1 it is A itself, with the identity as zeroth coordinate.
- At p=2, E=ℚ₂ and A=𝔽₂, the vectors (0,0,…) and (0,1,0,…) have the same ghost coordinates, since w_1=x_0²+2x_1 vanishes on both, yet they differ. The supplied operations are still defined there, so no construction may invert the ghost map; the same holds over O_E/π².
- The first two ghost coordinates of Δ(π) are π and F(π)=π. The plausible wrong diagonal x↦[x] has second ghost coordinate π^q≠π, so it fails the defining ghost condition.
- For equal characteristic the perfect coefficient model is O_F[[π]], whose constant coefficient is recovered by reduction modulo π.

In mixed characteristic the Q-twisted Witt comparison and the Q-Teichmüller lift [a]_Q are RelativeFarguesFontaine §§0.11–0.12. For equal-characteristic E and a perfect 𝔽_q-algebra S, where W_OE(S)=S[[π]], define the Q-Teichmüller lift [a]_Q∈S[[π]], for Q∈O_E[X] with Q≡X^q modulo π, as lim_(n→∞)Q_n(â_n) over arbitrary lifts â_n∈S[[π]] of a^(q^(−n)), Q_n the n-fold iterate. The limit exists and is independent of the lifts: Q(x)−Q(y) lies in (x−y)^q S[[π]]+π(x−y)S[[π]], so x≡y modulo π^i implies Q(x)≡Q(y) modulo π^(i+1). The lift reduces to a modulo π and satisfies Q([a]_Q)=[Q(a)]_Q. It differs from the supplied lift by the coefficient characteristic alone and involves no ghost comparison; in general [ab]_Q need not equal [a]_Q[b]_Q. (FF17, Proposition 1.2.7 and Example 1.2.8, pp. 57–58, for the limit formula in characteristic zero.)

**API.**

- The lift reduces to the identity modulo π and commutes with maps of perfect 𝔽_q-algebras.
- Q([a]_Q)=[Q(a)]_Q, and a↦[a]_Q is the unique lift of the identity of S with this property.
- For an additive Q, that is Q=X^q+cπX with c∈O_E, the lift is additive, since each Q_n is then an additive polynomial and (a+b)^(q^(−n))=a^(q^(−n))+b^(q^(−n)) in S.

**Checks.**

- For Q=X^q the lift of a is the constant power series a, the ordinary Teichmüller element of S[[π]].
- For q=2 and Q=X²+πX, [1]_Q=1+π: Q(1)=1+π and Q(1+π)=(1+π)²+π(1+π)=1+π in characteristic 2, so the iterates stabilize at 1+π, whereas the constant lift 1 has Q(1)≠1 and is not the lift.
- For q=3 and Q=X³+πX, the iterates Q_n(1) are 1+π, 1+π+π²+π³ and then 1+π+π²+2π³+π⁴+π⁶+π⁹, so [1]_Q≡1+π+π² modulo π³; a model stopping at the first iterate would return 1+π.
- Over the imperfect algebra 𝔽_q[T] the element T has no q-th root, so no sequence of lifts â_n exists and the construction is confined to perfect S.

One proof route uses the following steps. Compare the common dense ramified localization, extend by separated completion, and compute the scalar restrictions at the two endpoints.

(FF17, Def. 1.6.1–1.6.2 and Examples 1.6.3–1.6.5, pp. 68–70; §1.4.1, p. 61.)

**Checks.**

- The dense-ring comparison identifies topological rings and all restriction maps, including the exceptional endpoint-1 scalar topology.
- Take q=2 and r=2. The raw norm of π is 1/4, whereas n_ρ(π)=(1/4)^(1/2)=1/2; at radius 1 it is 1. Omitting the exponent gives the wrong scalar norm.

*Needs:* TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Relative annuli and their section rings; TauCetiRoadmap.RelativeFarguesFontaine §§0.11–0.12, for the mixed-characteristic twisted lift; TauCetiRoadmap.AdicSpaces §§6.1–6.4; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.54.

### 0.2 Ramified Gauss norm calculus

On the supplied Gauss-normed dense ring Bᵇ, prove independence of the coefficient uniformizer and the following finite-coefficient bounds. For x∈A and k≥0 put N_k(x)=max_(0≤n≤k)|x_n|, and N_(−1)=0. Then N_k(x+y)≤max(N_k(x),N_k(y)), N_k(xy)≤max_(i+j=k)N_i(x)N_j(y), N_k(πx)=N_(k−1)(x), and N_k(φx)=N_k(x)^q. Establish the completed norm identities from these bounds. In particular v_r(φx)=q v_(r/q)(x). The coefficient supremum formula, rather than values on two generators alone, determines the norm.

One proof route uses the following steps. Use homogeneity and integrality of ramified Witt addition and multiplication polynomials for the finite-coefficient inequalities; compare uniformizers on the dense ring and extend the norm identities by continuity.

(FF17, Lemma 1.4.2, Propositions 1.4.3 and 1.4.5, pp. 61–63; Proposition 1.4.9, p. 64.)

**Checks.**

- Check [a]π^n has norm |a|ρ^n and Frobenius sends its norm to |a|^q ρ^n, fixing the radius variance.
- For x=[a]π², y=[b]π³, |a|=1/2 and |b|=1/4, the product has first index 5 and norm ρ⁵/8. At k=1, N₁(πx)=N₀(x)=0. Index multiplication would give 6.
- For q=2, v_F(a)=3, x=[a]π² and r=2, v_r(φx)=10=2v₁(x). On π alone both sides equal r, because Frobenius fixes π.

*Needs:* §0.1; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Relative annuli and their section rings.

### 0.3 Radial limits and coefficient topology

For x=sum[x_n]π^n in Bᵇ, the limits |x|_ρ as ρ approaches 0 from above and 1 from below recover respectively the π-adic leading index and sup_n|x_n| in the precise rescalings v_r(x)/r → v_π(x) as r→∞ and v_r(x)→v_0(x):=inf_n v_F(x_n) as r→0. On A, the topology of every interior norm is the weak (π,[ϖ])-adic topology, by RelativeFarguesFontaine §0.13; prove here that |.|_0 induces the π-adic topology, that |.|_1 induces the [ϖ]-adic topology, and that A is complete for all these norms. For mixed-characteristic E and ε near 1 but ε≠1, |[ε]-1|_1=1.

One proof route uses the following steps. Bound the leading coefficient and the tail separately in the two limits; v_r is an infimum of affine functions. Use the supplied interior comparison; completeness follows coefficientwise from F. For endpoint 1 use the multiplicative [ϖ]-adic filtration and coefficientwise convergence; the π-adic endpoint is Witt completeness. For the discontinuity test reduce the Witt subtraction identities and use Frobenius iteration; pointwise convergence of coefficients is insufficient for the supremum norm.

(FF17, §1.4.1, pp. 61–63; Remark 1.4.12, Proposition 1.4.13 and Corollary 1.4.15, pp. 64–65.)

**Checks.**

- The limits distinguish |.|_0 from the ordinary ρ=0 substitution and distinguish weak convergence from endpoint-1 convergence.
- For [a]π² with v_F(a)=3, v_r=3+2r, v_r/r→2 and v_r→3. At zero the separate norm is q⁻², not 0.
- The sequence π^n has |π^n|_1=1 for every n, so it does not tend to 0 for the [ϖ]-adic endpoint topology, although it tends to 0 for every interior norm and for |.|_0; the endpoint-1 topology is not the weak topology.

*Needs:* §0.2; TauCetiRoadmap.RelativeFarguesFontaine §0.13, Weak coefficient topology.

### 0.4 Legendre transforms and Newton polygons

Import proper lower-semicontinuous EReal-valued convex functions and Fenchel–Moreau duality from OptimalTransport Layer 5. In the real dual pair specialize its conjugate P* by L(P)(r)=-P*(-r)=inf_x(P(x)+rx), so P(x)=sup_r(L(P)(r)-rx). The source slope is the negative geometric derivative. For nonzero x in Bᵇ define Newt(x) as the greatest lower-semicontinuous convex decreasing minorant of the coefficient data (n,v_F(x_n)), with value +∞ left of v_π(x). Its epigraph is the closed convex hull of the upper vertical and right horizontal rays from those points. Its transform equals v_r(x) for r≥0, including the coefficient-infimum value at r=0; for r<0 it is -∞. The separate norm at radius zero remains v_π, not this r=0 value. Specialize infimal convolution to these polygons; finite-slope multiplicity is horizontal length. This section owns the polygon and sign bridge, not general convex duality.

One proof route uses the following steps. Specialize the imported proper closed convex carrier to the real dual pair, retaining infinite endpoint values. Transport the generic conjugate identities through r ↦ -r and output negation. Adjoin upper vertical and right horizontal rays to the coefficient points before taking the closed convex hull. Supporting lines with nonpositive geometric slope and the coefficient formula give the Gauss transform for r≥0; the right rays force value -∞ for r<0. Use imported biduality to recover the polygon from that transform; use closed infimal convolution when needed.

(FF17, §1.5.1–1.5.2, pp. 66–67.)

**API.**

- L(P)(r) is the infimum of P(x)+rx over x.
- For proper closed convex P, taking the stated supremum recovers P.
- For r≥0, L(Newt(x))(r)=inf_n(v_F(x_n)+nr); for r<0 it is -∞. The r=0 coefficient-infimum is different from the radius-zero π-adic norm.
- L(P star Q)=L(P)+L(Q), with closure when the infimal convolution is not already closed.

**Checks.**

- For π-[a], 0<|a|<1, the polygon from (0,v_F(a)) to (1,0) has source slope v_F(a).
- For nonzero [a]π^n, Newt is +∞ at x<n and equals v_F(a) for x≥n. Its transform is v_F(a)+nr for r≥0 and -∞ for r<0; a single finite point would fail this test.
- The product of factors of distinct slopes s<t has slope multiset {s,t}; it does not have the single slope s+t.
- The plus sign in the transform and the negative-geometric-slope convention give positive slopes for π-[a] when 0<|a|<1.
- For v_F(a)=2 the linear-factor transform is min(r,2); at r=1 and 3 its values are 1 and 2. A monomial [a]π² gives 2+2r for r≥0 and −∞ for r<0.

*Needs:* §0.2; TauCetiRoadmap.OptimalTransport Layer 5(1)–(2); TauCetiRoadmap.NewtonPolygons §§0.1–0.6.

### 0.5 Newton products and Jensen formula

For nonzero x,y in Bᵇ, Newt(xy)=Newt(x) star Newt(y). Source slopes concatenate with horizontal multiplicity. For x=∏_(i=1)^d(π-[a_i]), all 0<|a_i|<1, the slopes are v_F(a_i), and v_r(x)=Σ_i min(r,v_F(a_i)). In particular integrating the jumps of the one-sided derivatives recovers the change in v_r, the nonarchimedean Jensen identity.

One proof route uses the following steps. Apply multiplicativity of Gauss norms and Legendre biduality. For a linear factor calculate the two affine terms directly. Integrate the piecewise constant derivatives; keep finite products here, with locally finite products treated after convergence.

(FF17, §1.5.1–1.5.2, Example 1.5.3 and Remark 1.5.4, pp. 66–67.)

**Checks.**

- A two-factor example detects the erroneous interpretation of polygon multiplication as pairwise addition of slopes.
- For slopes 2 and 5, v₁=2, v₃=5, v₆=7; the derivative drops by 1 at each of 2 and 5. A single slope 7 gives different values.

*Needs:* §0.4.

### 0.6 Completed annuli and faithful restriction

For nonempty I ⊆ [0,1], B_I is the inverse limit of B_J over compact nonempty subintervals J of I. On compact [a,b] its topology is given by max(|.|_a,|.|_b); on a general interval it is complete and metrizable. A embeds as a closed subring. Every nonempty restriction B_I→B_J for J ⊆ I is injective. When 0 belongs to I, B_I embeds in B_0=W_OE(F)[1/π].

One proof route uses the following steps. Concavity of v_r gives the endpoint maximum principle and a countable cofinal family of compact subintervals. Extend completion and inverse-limit maps on the common dense Bᵇ. To prove injectivity first stabilize the nonzero value and one-sided slopes at a radius inside J, then propagate concavity to rule out zero on another subinterval. Before invoking normed E-space results, normalize every positive endpoint by the power 1/(-log_q ρ); combine with the supplied normalized endpoint-zero norm. The resulting ultrametric norm is E-homogeneous and equivalent topologically to the endpoint Gauss family. Endpoint 1 is excluded from these functional-analytic imports.

(FF17, §1.6.1, pp. 68–70; Lemma 1.6.10 and Proposition 1.6.15, pp. 71–73.)

**Checks.**

- A restriction to a single radius remains injective; the result concerns these period rings, not an arbitrary function sheaf.
- Restrict π+[a], |a|=q⁻², from a compact interval to ρ=q⁻¹. Its norm remains q⁻¹ and its image is nonzero; restriction to a singleton does not become evaluation at a zero.

*Needs:* §0.3; §0.5; TauCetiRoadmap.LocallyAnalyticDistributions §0.0.

### 0.7 Newton data on completed annuli

For 0≠f in B_I, define v_r(f)=-log_q|f|_(q^-r) at positive radii in I and define its left and right derivatives by stabilization from any Bᵇ-approximating sequence. Newt_I(f) is the closed polygon determined by the restriction of this concave function, truncated to the slopes corresponding to I. At an interior slope r the multiplicity is partial_left v_r(f)-partial_right v_r(f), a nonnegative integer. At an included endpoint use its one-sided convention, including vertical rays; at radius 1 a zero slope may accumulate.

One proof route uses the following steps. Show an approximation error with strictly larger valuation cannot change the first and last minimizing coefficient indices at a fixed radius. Independence of approximants defines the derivatives, then Legendre duality defines the restricted polygon. Specify endpoint half-lines explicitly before making assertions about multiplicity there.

(FF17, Lemma 1.6.10 and Definition 1.6.11, pp. 71–72; Corollary 1.6.17, p. 73; Definition 1.6.18, p. 74; Corollary 1.6.19, Proposition 1.6.20 and Definition 1.6.21, p. 75.)

**API.**

- v_r(f) is the negative base-q logarithm of the norm.
- Left/right derivative stabilization is independent of the approximating sequence.
- The multiplicity at r is partial_left v_r-partial_right v_r.
- Restriction of f corresponds to truncation of Newt_I(f), with the stated endpoint convention.

**Checks.**

- A nonzero E-constant has no positive finite-slope segment.
- For (π-[a])^2 with q^-r=|a| in the interior, the derivative jump at r is 2.
- Restricting to an interval whose closure avoids |a| removes that slope of π-[a].
- For an interior linear zero the derivative drops by one; on compact I avoiding 1 only finitely many nonzero slopes occur.
- For (π−[a])² with v_F(a)=2, v_r=2min(r,2); left and right derivatives at 2 are 2 and 0, giving multiplicity 2.

*Needs:* §0.6; §0.4.

### 0.8 Uniform stabilization of approximating norms

If f_n in Bᵇ converges to nonzero f in B_I, then for every compact J ⊆ I there is N such that |f_n|_ρ=|f|_ρ for every ρ in J and n≥N. Consequently Newt_J(f) is realized by a single element of Bᵇ, and completed Newton products still obey infimal convolution.

One proof route uses the following steps. First take J contained in (0,1]. Stabilize the nonzero endpoint valuations and the available one-sided derivatives; use the corresponding supporting lines to bound the valuation on the compact parameter interval. Choose the approximation error above this uniform finite bound. The ultrametric inequality forces equality at every radius in J. This is the positive-radius argument of Proposition 1.6.16, with a supporting value and derivative taken at the same endpoint. If 0 belongs to J, π-adic convergence fixes an initial finite coefficient segment and v_π(f_n)=v_π(f). A bound at one positive radius controls the remaining tail near zero; its higher π powers are strictly smaller than the fixed first nonzero term on a sufficiently short initial interval. Combine that interval with the positive-radius compact argument. A singleton {0} uses only π-adic stabilization. Apply the equality of all positive-radius norms to the restricted Newton polygon. At radius zero record the stabilized v_π separately.

(FF17, Proposition 1.6.16, p. 73; Corollary 1.6.19 and Proposition 1.6.20, p. 75.)

**Checks.**

- The positive-radius proof supplies a uniform finite bound even for opposite endpoint derivatives. An included radius zero is treated separately by π-adic coefficient stabilization and a positive-radius tail bound, rather than by applying Proposition 1.6.16 outside its hypotheses.
- For v_r=min(5r,11.2−3r) on [0.5,1.5], the values at the endpoints are 2.5 and 6.7 and the maximum is 7 at r=1.4. Error valuation greater than 7 preserves every norm.

*Needs:* §0.7.

### 0.9 Directional rank-two Gauss valuations

At an interior r define the lexicographically ordered rank-two valuations f ↦ (v_r(f),partial_right v_r(f)) and f ↦ (v_r(f),-partial_left v_r(f)); use the compatible ordered-group sign convention from additive valuations. They are continuous valuations on B_I. They lie in Spa(B_I,O_E+B_I°°) but in general not in Spa(B_I,B_I^circ).

One proof route uses the following steps. Use addition inequalities for initial indices and additivity of the appropriate one-sided derivatives under multiplication. Order the second component only after the first component agrees. Test boundedness on power-bounded functions with opposite directional derivatives.

(FF17, Proposition 1.6.12 and Remark 1.6.13, p. 72.)

**API.**

- The right derivative gives the first displayed continuous valuation.
- Negating the left derivative gives the second displayed valuation.
- Forgetting the second component recovers v_r.
- Both valuations have zero support on the domain B_I.

**Checks.**

- The second components on π^n are n and -n respectively.
- Both first components on [a]π^n equal v_F(a)+nr.
- At I={q^(−r)} with r in the value group of F, take f=π[a] with v_F(a)=−r. Then v_r(f)=0 and both one-sided derivatives are 1, so the right valuation gives (0,1) and the left one (0,−1); for f⁻¹=π⁻¹[a⁻¹] the values are reversed. Both f and f⁻¹ are power-bounded with rank-one norm 1, yet each directional valuation sends one of them below 0, so neither valuation lies in Spa(B_I,B_I°); a rank-one model cannot separate f from f⁻¹.
- On [a]π² with v_F(a)=3 the two values are (3+2r,2) and (3+2r,−2). Coarsening gives the same first component; the second signs differ.

*Needs:* §0.7; §0.8.

### 0.10 Coefficient extensions and radius rescaling

Refine the supplied finite coefficient change by its completed norm comparison. For finite E′/E of ramification index e and residue degree f, with the residue constants embedded in F, put E′₀=W_OE(𝔽_(q^f))[1/π]. Identify B_(E,I) ⊗̂_(E′₀) E′ with B_(E′,I^(1/e)); on compact I the ordinary tensor suffices. The right Frobenius is φ^f. With q′=q^f, the endpoint-zero norm on the right restricts to the [E′:E]-th power of the left norm. The unramified case preserves the ring and iterates Frobenius, rather than tensoring without selecting the constant-field factor.

One proof route uses the following steps. Use the supplied coefficient tensor comparison with the basis 1,π′,…,(π′)^(e−1), then compute the norm of π=u(π′)^e and the iterate on constants.

(FF17, §1.6.2, Lemma 1.6.8 and Proposition 1.6.9, pp. 70–71.)

**Checks.**

- The unramified case has no spurious tensor by the whole E′ over E; the ramified case changes radii by the e-th root.
- For e=2,f=1,q=2 and π=u(π′)², the right zero-endpoint norm of π is 1/4, the square of the left value 1/2. Interior radii change by a square root.

*Needs:* §0.1; §0.2; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes.

### Examples

For slopes 2 and 5, v₁=2, v₃=5, v₆=7; the derivative drops by 1 at each of 2 and 5. A single slope 7 gives different values.

### Dependencies

Suppliers: TauCetiRoadmap.AdicSpaces, TauCetiRoadmap.LocallyAnalyticDistributions, TauCetiRoadmap.NewtonPolygons, TauCetiRoadmap.OptimalTransport, TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology, TauCetiRoadmap.RelativeFarguesFontaine, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 1: Boundary and positive functions

Characterize boundary extension and positivity, and give explicit monomial, cyclotomic, Hahn and crystalline models.

### 1.1 Expansions at radius zero

If 0 belongs to I and 1 does not, every f in B_I has a unique expansion Σ_(n≥n0)[x_n]π^n with x_n in F and |x_n|ρ^n→0 as n→∞ for every positive ρ in I. Under the common injection into B, B_[0,1]=Bᵇ and its power-bounded subring is A. In mixed characteristic no assertion of existence, uniqueness or additivity of arbitrary two-sided Teichmüller expansions is made for B or B-plus.

One proof route uses the following steps. Embed into the π-adic complete field B_0, whose Teichmüller expansion is unique and bounded below in index. Use interior coefficient bounds to characterize the image, then impose endpoint-1 boundedness. Contrast with the two-sided series class: the nonlinear Witt carry limits need not converge under mere interior convergence.

(FF17, Propositions 1.6.23–1.6.24, pp. 75–76; Remarks 1.6.6–1.6.7, p. 70, and 1.10.8, p. 91.)

**Checks.**

- The uniqueness theorem is confined to intervals including 0; its extension to all B is not an available theorem.
- The element π⁻¹+[a] has lowest index −1. Its zero-endpoint norm is q, and it has no indices below −1; a two-sided sequence with unbounded negative indices fails the boundary condition.

*Needs:* §0.6; §0.8.

### 1.2 Extension across either boundary

Let I be an interval of positive radii. If 0 is in its closure, f extends uniquely to B_(I union {0}) exactly when Newt_I(f) is bounded to the left in its horizontal coordinate, equivalently π^N f is bounded near 0 for some N. If 1 is in its closure, f extends uniquely to B_(I union {1}) exactly when its Newton polygon is bounded below, equivalently lim_(ρ→1)|f|_ρ is finite. The latter limit always exists in [0,∞]. Both conditions give B_[0,1]=Bᵇ. They do not imply extension across a missing boundary separated from the closure of I.

One proof route uses the following steps. Split dense approximants into their positive and negative index parts for radius 0, and into bounded/unbounded coefficient valuations for radius 1. Use stabilized norms and slope monotonicity to make the excluded part tend to zero on every compact interval. At radius 0 construct the extension through the coefficient description of §1.1: modulo each π^m the Witt components of the positive parts converge in F, and the uniform interior bound with the stabilized norms gives the decay of the limit coefficients. The positive parts need not converge in the radius-zero norm, which ignores coefficient size, so their series is not summed in that topology. Invoke faithful restriction for uniqueness.

(FF17, Propositions 1.9.1–1.9.4 and Remark 1.9.6, pp. 87–89.)

**Checks.**

- Extension requires the boundary to be a limit point; a relatively compact annulus alone carries no such extension assertion.
- For π−[a], v_F(a)=2, the polygon is bounded to the left by 0 and below by 0, so both boundaries extend. A missing radius separated from the interval closure is not tested by these bounds.

*Needs:* §1.1; §0.7.

### 1.3 Newton criterion for units

For 1 not in I, a nonzero f in B_I is a unit exactly when Newt_I(f) has no finite slope corresponding to a radius of I. For 1 in I it must have only possible slope 0 at that boundary and a finite right derivative there. Units extend across each boundary in the closure of I. In particular B×=(Bᵇ)× and R×=(E-dagger)×, where R=colim_(ρ→0) B_(0,ρ] and E-dagger=colim B_[0,ρ].

One proof route uses the following steps. On a slope-free compact interval factor out the uniquely dominant monomial and invert 1+h by a convergent geometric series. Glue these inverses by faithful restriction and impose finite index at endpoint 1. Apply both boundary-extension criteria to f and its inverse, then pass to the filtered union at 0.

(FF17, Propositions 1.6.25–1.6.26 and Corollary 1.6.27, pp. 76–78; Proposition 1.8.6, p. 86; Corollary 1.9.5, p. 89.)

**Checks.**

- A nonzero constant is a unit, a linear factor fails precisely on an interval containing its zero radius, and endpoint 1 requires its extra finite-index condition.
- For π−[a] with |a|=q⁻², an interval containing q⁻² has a zero and the element is not a unit; an interval avoiding it gives an inverse. For f=π, both f and π⁻¹ extend to the boundaries.

*Needs:* §1.2; §0.5.

### 1.4 Overconvergent field and Robba germs

Refine the supplied overconvergent field and Robba germ by their boundary-completion comparisons. For finite L/F prove [E†_L:E†_F]=[L:F]. When F is the completed perfection of k((t)), compare with the completed perfected bounded and Robba rings using the reciprocal-radius convention. Keep E†, its π-adic completion W_OE(F)[1/π], and the Robba germ ℛ as distinct rings with their stated maps.

One proof route uses the following steps. Lift a residue basis for finite L/F, compare its π-adic completion, and use the supplied henselian overconvergent field to descend the finite basis; compare the reciprocal-radius seminorms in the monomial model.

(FF17, Proposition 1.8.2, Corollary 1.8.3 and Remarks 1.8.4–1.8.5, pp. 85–86.)

**Checks.**

- The local field valuation here is v_π with residue F; the original real valuation of F need not be discrete.
- For the identity L=F the field degree is 1; an unramified residue extension of degree 2 gives a Witt-field and overconvergent-field degree 2. The Robba germ is not a completion at a single radius.

*Needs:* §1.3; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.54.

### 1.5 Positive period subrings

Inside B_I define B_I⁺ as the closure of Bᵇ⁺=A[1/π]. For 0<ρ<1 set B_ρ⁺ equal to the ρ-norm completion of A[1/π], and put B⁺=intersection_(ρ>0) B_ρ⁺ inside B. If 0 belongs to I, B_I⁺=Bᵇ⁺. If min I=ρ>0, the underlying algebras B_I⁺, B_ρ⁺, B_[ρ,1)⁺ and B_[ρ,1]⁺ agree, with the last topology generally strictly stronger.

One proof route uses the following steps. Use the norm inequality v_(rprime)(x)≥(rprime/r)v_r(x) for x in A[1/π] and rprime≤r. Prove restriction of each positive completion is injective using the common annular ring. Define the intersection with its induced Fréchet topology and distinguish algebraic identification from topological equivalence.

(FF17, Definition 1.10.2, Lemma 1.10.4, Proposition 1.10.5 and Remark 1.10.6, pp. 89–90.)

**API.**

- A[1/π] maps densely into each B_I⁺.
- Restriction induces the specified compatible injections of positive rings.
- B⁺ consists precisely of elements in every B_ρ⁺.
- Including radius 0 recovers A[1/π] as an algebra.

**Checks.**

- π^-1 belongs to every positive ring, so plus does not mean the unit ball.
- For a in F with |a|>1, [a] is not in B⁺.
- π^n has interior norm ρ^n→0 and radius-one norm 1 for every n, so π^n→0 in B_ρ⁺ but not in the [ρ,1] topology; the algebra bijection B_ρ⁺→B_[ρ,1]⁺ is not continuous.
- π⁻¹ belongs to A[1/π] and hence to every positive subring. If |a|<1 then [a]⁻¹ has endpoint-one norm greater than 1 and is excluded. Positivity cannot mean nonnegative π-order.

*Needs:* §1.2; §0.6.

### 1.6 Newton characterization of positivity

A nonzero f belongs to B_ρ⁺ exactly when its extended Newton polygon over [ρ,1] lies in the nonnegative vertical half-plane, equivalently it extends to radius 1 with |f|_1≤1. B⁺ is the corresponding intersection over ρ and is the largest subring of B_ρ⁺ on which φ is bijective: B⁺=intersection_(n≥0) φ^n(B_ρ⁺). This agrees with the classical B_rig⁺ notation after the specified comparison.

One proof route uses the following steps. Use the closure description to bound coefficients vertically, then apply boundary extension. Frobenius carries ρ to ρ^q and preserves nonnegative coefficient valuations. Intersect the expanding domains under inverse Frobenius and use the same coefficient criterion.

(FF17, §1.10.1, Proposition 1.10.7 and Remark 1.10.9, pp. 90–91.)

**Checks.**

- Positivity is the coefficient bound |.|_1≤1 after extension, not the condition v_π(f)≥0.
- For π⁻¹, |π⁻¹|₁=1 and the polygon lies at height 0; for [a]⁻¹ with v_F(a)=2 the height is −2 and positivity fails.

*Needs:* §1.5; §0.2.

### 1.7 Monomial completed-perfection model

Let k/𝔽_q be perfect, F the completion of k((t^(1/p^∞))), |t|=q^-1, T=[t]. Identify A with sums Σ_(alpha≥0 in ℤ[1/p]) a_alpha T^alpha, a_alpha in W_OE(k), such that for every n and every real bound M only finitely many alpha<M have a_alpha nonzero modulo π^n. This is the weak (π,T)-adic completion of the perfected polynomial model, with coefficients already π-adically complete. For interior ρ=q^-r, |sum a_alpha T^alpha|_ρ=sup_alpha q^(-r v_π(a_alpha)-alpha). In B_I allow alpha in ℤ[1/p] and rational coefficients W_OE(k)[1/π], requiring these terms to tend to zero off finite sets at each interior radius, with the extra boundary bounds.

One proof route uses the following steps. Use the coefficientwise description of O_F and then lift successively modulo π^n. Apply the coefficient filtration N_k to identify the norm of each monomial and the supremum formula. Complete the common Laurent algebra for all radii in I; impose bounded coefficient valuations at 0 and support bounded below at 1.

(FF17, §1.7.1 and Lemma 1.7.1, pp. 79–80.)

**API.**

- T^alpha is the Teichmüller lift of t^alpha.
- The stated local finiteness modulo π^n characterizes integral elements.
- The monomial supremum equals the intrinsic ramified Gauss norm.
- Inverting π and T gives the dense Laurent model of B_I.

**Checks.**

- |T^(1/p)|_(q^-r)=q^(-1/p).
- |π|_(q^-r)=q^-r.
- An infinite t-power series with all coefficients units is allowed when its t-exponents tend to ∞; it need not lie in the π-adic completion of polynomials.
- The weak completion allows arbitrarily high t-order tails; π-adic completion of the bare polynomial ring is insufficient.
- With |t|=q⁻¹, T^(1/p) has norm q^(−1/p). A sum Σ_(j≥0)T^j converges weakly and reduces to a power series modulo π; a polynomial perfection alone loses this tail.

*Needs:* §1.1; §0.2.

### 1.8 Perfected annulus towers and norm powers

For the monomial model set K0=W_OE(k)[1/π] with |π|=q^-1, and send X to T. With ρ=q^-r and checkrho=q^(-1/r), |i(f)|_ρ=||f||_checkrho^r, where ||.|| is the ordinary K0-Gauss norm. The completed direct limit of the annulus algebras under X→X^q, with transformed intervals and norms, is B_I. The dense initial Laurent algebra must invert both π and X. In characteristic zero the annulus tower is finite étale; in equal characteristic p the q-power tower is radicial.

One proof route uses the following steps. Evaluate both sides on π and X, then on arbitrary convergent Laurent series. Use the monomial description to prove density and completion. Differentiate X^q to separate the characteristic-zero étale assertion from its characteristic-p failure.

(FF17, §1.7.2 and Lemma 1.7.2, pp. 80–82.)

**Checks.**

- The r-th power is essential: the printed literal isometry fails already on π. In characteristic p the tower is not étale.
- At q=2,r=2, the ordinary radius is 2^(−1/2). The norm of X raised to power 2 is 1/2=|T|_ρ, while the norm of π raised to power 2 is 1/4=|π|_ρ.

*Needs:* §1.7; TauCetiRoadmap.PadicHodgeTheory §1.2 and §1.4.

### 1.9 Cyclotomic coordinates on period annuli

For E=ℚ_p (q=p), use the Frobenius lift Q(X)=(1+X)^q-1 and the embedding X→[1+t]-1. For an ordinary annulus radius s>q^(-q/(q-1)), write s=q^(-1/r), so the period radius is ρ=q^-r<q^(-(q-1)/q). In this range ||f||_s=|i(f)|_ρ^(1/r). The completed perfected cyclotomic tower identifies with B_I for I contained in that strict period-radius range. For a ramified coefficient field the detailed Newton slopes must use v_π(p) and the p-Frobenius iteration; no unramified slope formula is asserted for arbitrary E.

E=ℚ_p for the displayed numerical radius and cyclotomic-coordinate theorem. For general mixed-characteristic E the target is the corresponding comparison after deriving a threshold from the actual ramified carry polygon, proved by the ramified coordinate theorem.

For every ramified mixed-characteristic E, determine the Newton polygon of [1+t]−1 using e=v_π(p) and p-power carries, and prove a sufficient strict transformed radius for the coordinate comparison. Transporting the ℚ_p threshold by replacing p with q is not this theorem. Normalize v_F(t)=1. The p-power carry computation must give the successive positive source slopes (p−1)/(e p^m), m≥1, with horizontal multiplicity e, and compare the resulting short-annulus bound with the chosen q-Frobenius tower.

One proof route uses the following steps. Compare [1+t]-1 with [t] on the stated short period annulus, using the Newton polygon of the cyclotomic element. Transport the monomial comparison with its norm power and inverted radius. Use the correct strict transformed threshold; separate the coefficient-ramification dependence of the auxiliary Newton calculation.

(FF17, Proposition 1.7.3 and §1.7.3, pp. 82–83.)

**Checks.**

- For E=ℚ_p, q=p, the ordinary radius threshold and its transformed period radius agree through s=q^(-1/r); the printed untransformed bound is not reused.
- At p=2 the ordinary threshold is 1/4 and the period threshold is 2^(−1/2). The equality boundary is excluded; for e=v_π(2)=2 the coefficient 2 has valuation 2 rather than 1. At e=2 the first two carry faces join (0,1),(2,1/2),(4,1/4), giving source slopes 1/4 and 1/8, each of length 2.

*Needs:* §0.10; §1.8; TauCetiRoadmap.PadicHodgeTheory §1.2 and §1.4; §0.1.

### 1.10 Equal-characteristic exchange of variables

For perfect k and E₀=k((u)), F₀=k((v)), exchange the two indices of a doubly convergent Laurent expansion to identify the analytic function rings of their punctured unit discs as Fréchet k-algebras. The parameters r and 1/r are exchanged and numerical norms differ by the r-th power. Both adic spaces are the locus Spa(k[[u,v]],k[[u,v]])∖V(uv). This is the two-variable symmetry beyond the supplied equal-characteristic annulus identification.

One proof route uses the following steps. Apply the imported Laurent-annulus construction for the first assertion. On compact radial intervals bound the double family of coefficients to justify transposing convergent sums. Compute u^a v^b on both sides to determine the power of the norm and identify the common formal adic chart.

(FF17, Example 1.6.5, p. 70; Proposition 1.7.4 and Remark 1.7.5, pp. 83–84.)

**Checks.**

- The symmetry is k-linear and topological; it is not a norm-preserving map with fixed numerical normalization on both coefficient fields.
- For u²v³ the additive valuations are 2r+3 and 2+3/r; the first is r times the second. At r=2 they are 7 and 3.5, so the comparison is topological rather than a literal isometry.

*Needs:* §1.8; TauCetiRoadmap.PadicHodgeTheory §1.2 and §1.4.

### 1.11 Hahn-series period rings

Let k/𝔽_q be a perfect field and Γ a nonzero subgroup of ℝ with pΓ=Γ. Put F=k((t^Γ)), the Hahn field of well-ordered support. In A write Σ_(alpha in Γ_≥0) a_alpha T^alpha with a_alpha in W_OE(k), whose nonzero support modulo π^n is well ordered for every n. Here T^alpha denotes the Teichmüller lift [t^alpha] for alpha in Γ; Γ need not contain 1. Choose γ₀ in Γ with γ₀>0 and put T₀=[t^γ₀]. For I ⊆ (0,1), B_I is by definition the supplied separated Gauss completion of the bounded localization Bᵇ=A[1/π,1/T₀]; this localization does not depend on γ₀, since for γ₁>0 in Γ and Nγ₁>γ₀ the power T₁^N is T₀ times an element of A. Prove that coefficient extraction identifies it with the families Σ_(alpha in Γ) a_alpha T^alpha, a_alpha in W_OE(k)[1/π], such that for every ρ in I and every c>0 the threshold set S_(ρ,c)={alpha: |a_alpha|_ρ q^-alpha≥c} is well ordered and v_π(a_alpha) is bounded below on S_(ρ,c); here |a|_ρ=ρ^(v_π(a)). Then |x|_ρ=sup_alpha |a_alpha|_ρ q^-alpha is finite. Well-ordering alone is not enough: rational coefficients with unbounded denominators can have infinite or nonconvergent norms.

One proof route uses the following steps. Use the Hahn support condition to lift O_F through each truncated Witt ring, and compute the norm on Bᵇ by N_k. An element of Bᵇ has coefficients in π^(−N)W_OE(k) and exponents at least −Mγ₀ for some integers N, M≥0, so each of its threshold sets lies in a well-ordered support; coefficient extraction is continuous with |a_alpha|_ρ q^-alpha≤|x|_ρ. For a limit x of x_m in Bᵇ, if a coefficient of x has term value at least c and |x−x_m|_ρ<c, the ultrametric inequality makes its term value equal to that of the corresponding coefficient of x_m, so the two coefficients have the same π-valuation (the coefficients themselves may differ). Hence S_(ρ,c)(x) is contained in S_(ρ,c)(x_m) and inherits both conditions. Conversely, the finite union of threshold sets at the endpoints of a compact J⊆I gives truncations in Bᵇ converging to the family on J; pass to the limit over compact J.

(FF17, §1.7.5, p. 84.)

**API.**

- Coefficient extraction x↦a_alpha is E-linear and continuous, with |a_alpha|_ρ q^-alpha≤|x|_ρ, and |x|_ρ is the supremum of these term values.
- For nonempty J⊆I the restriction B_I→B_J keeps the coefficient family; it is injective, and the conditions at radii of J are those at radii of I restricted to J.
- Frobenius sends the family (a_alpha) at alpha to (φ(a_alpha)) at qalpha, where φ is the Witt Frobenius of W_OE(k)[1/π] and preserves v_π. It maps B_I isomorphically onto B_(I^q), I^q={ρ^q:ρ∈I}, with |φx|_(ρ^q)=|x|_ρ^q.

**Checks.**

- Take q=2 and ρ=1/2. Then π⁻¹ belongs to B_I with norm 2 and T₀ has norm 2^(−γ₀), equal to 1/2 when 1∈Γ and γ₀=1; an integral-only presentation would omit π⁻¹.
- For p=2 and Γ=√2·ℤ[1/2] one has 2Γ=Γ but 1∉Γ, so there is no monomial t¹; with γ₀=√2 the element T₀ has norm q^(−√2)<1 and its powers clear every finite lower bound on exponents. A definition inverting [t] would not make sense for this Γ.
- With q=2, Γ=ℤ[1/2], E=𝔽₂((π)) and I={1/2}, the family a_n=π^(−n²) at exponent n≥0 has well-ordered threshold sets but term values 2^(n²−n), with supremum ∞; the bounded-denominator condition excludes it.
- In the same setting a_n=π^(−n) at exponent n has all term values 1, and the differences of its partial sums have norm 1; S_(1/2,1)=ℕ carries the unbounded valuations −n, so it is excluded, as the non-Cauchy partial sums require.
- Suppose 1∈Γ. The integral family with a_n=1 at exponents 1−p^(−n), n≥0, has every term value q^(−1+p^(−n))>1/q, so its threshold set S_(ρ,1/q) is {1−p^(−n): n≥0}, an infinite well-ordered subset of Γ of order type ω (for p=q=2 it is {0,1/2,3/4,7/8,…}, containing 1/2 but not 1); the family lies in A, and requiring finite threshold sets would wrongly exclude it.
- Suppose 1∈Γ. Then Σ_(n≥0)π^n T^(−n) has term values (qρ)^n. It belongs to B_I when I⊆(0,1/q), while at ρ=1/q its threshold set {0,−1,−2,…} is not well ordered.

*Needs:* §1.7; §0.2; §0.6.

### 1.12 Ramified Witt covectors and bivectors

For E=ℚ_p the full Witt covectors CW(R) of an 𝔽_p-algebra R, with their finite-length Witt inclusions, stabilized addition, Frobenius, Verschiebung and base change, are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28a, with its perfect base taken to be 𝔽_p; the unipotent covectors CWu(R)=colim_V W_n(R) are its finite-support subfunctor. For a discrete 𝔽_q-algebra R and every coefficient field E, define CWu(R)=colim_V W_OE,n(R) along the ramified Verschiebung, and the full covectors CW(R) as the sequences indexed by i≤0 whose negative tail generates a nilpotent ideal, with the stabilized ramified Witt addition; at E=ℚ_p identify these with the imported functors, compatibly with F, V, the finite-length inclusions and base change. Put BW(R)=lim_V CW(R), and BW(O_F)=lim_(0≠a ideal O_F) BW(O_F/a). It is an O_E-module whose elements have unique formal coefficients Σ_(n in Z)[a_n]π^n with a_n in O_F and liminf_(n→-∞) q^n v_F(a_n)>0. Summation embeds this module in B⁺. Addition is the limit of the ramified Witt addition polynomials with the required q-power twists.

One proof route uses the following steps. Construct CW for a general coefficient field from the finite truncations of §0.1 by the stabilized-addition argument of the imported p-typical construction, and BW as the limit along Verschiebung; the identification at E=ℚ_p is coefficientwise. Translate eventual nilpotence modulo every nonzero ideal into exponential growth of negative-tail valuations. The stronger growth makes the Witt carry limits converge and yields an injective summation map; this does not extend to every two-sided convergent Teichmüller series.

(FF17, §1.10.2, Definition 1.10.11 and the coefficient/addition formulas, pp. 92–93.)

**API.**

- A finite Teichmüller Laurent coefficient family in the perfect valuation ring O_F determines a compatible bivector via the unique q-power roots. No canonical section CW(R)→lim_V CW(R) for arbitrary discrete R is asserted.
- Equality of all bivector coefficients is equality in BW(O_F).
- Summation gives an injective O_E-linear map BW(O_F)→B⁺.
- The i-th sum coefficient is the limit of S_n on q-twisted coefficient windows.

**Checks.**

- A finite Teichmüller Laurent sum with coefficients in O_F lies in BW and sums to the same element of B⁺.
- At E=ℚ_p and R=𝔽_p the identification matches CW(𝔽_p)=colim(ℤ/p^n, V=p) with the imported ℚ_p/ℤ_p, V acting as p on both. For R=𝔽_p[ε]/ε², the constant tail x_i=ε for every i≤0 is a full covector, its tail ideal (ε) squaring to zero, but not a unipotent one; a model taking CW=CWu would lose it.
- Coefficients with v_F(a_n)=q^(-2n) for n<0 meet the growth condition.
- Coefficients with v_F(a_n)=n^2 for n<0 converge for every linear Gauss weight but fail the bivector condition.
- The negative-tail growth condition is stronger than convergence for each linear Gauss weight.
- For negative index n=−m, take v_F(a_(−m))=q^(2m). Then q^(−m)v_F=q^m→∞. With v_F=m² all interior terms converge but q^(−m)m²→0, so the bivector condition fails.

*Needs:* §1.6; §0.1; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes; TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28a, Witt covectors and their Dieudonné operators.

### 1.13 Radius-dependent crystalline period rings

Assume E=ℚ_p and ρ in |F×|, 0<ρ<1. Let a_ρ={x in O_F:|x|≤ρ} and b_ρ=ker(W(O_F)→O_F/a_ρ). Specialize the supplied p-completed PD-envelope functor to b_ρ with its canonical base divided powers on (p), and denote the resulting ring A_cris,ρ; put B_cris,ρ⁺=A_cris,ρ[1/p]. It is the pro-final p-adic PD thickening computing degree-zero crystalline sections, not a terminal object among individual nilpotent thickenings.

One proof route uses the following steps. Import the generic PD envelope and its completed universal property. Choose a with |a|=ρ; express the envelope inside W(O_F)[1/p] by the divided powers [a]^n/n!. Compare the p-power truncations with the crystalline site and pass to the pro-object.

(FF17, §1.10.3, pp. 93–94.)

**API.**

- W(O_F) maps to the completed PD envelope with the specified base divided powers.
- Compatible continuous maps to p-complete PD thickenings extend uniquely.
- For |a|=ρ, A_cris,ρ is the p-completion of the subalgebra generated by [a]^n/n!.
- Inverting p produces B_cris,ρ⁺ with its natural inclusion in the single-radius ring B_ρ⁺ (§1.5); it is not a subring of B.

**Checks.**

- b_ρ contains p and its divided powers agree with the canonical ones.
- Replacing a by another element of norm ρ gives the same completed envelope by its universal property.
- A_cris,ρ is not itself an object with a globally nilpotent PD ideal in the ordinary finite-level crystalline site.
- The construction is restricted to E=ℚ_p and retains the pro-object qualification in its site interpretation.
- For |a|=ρ put z=[a]^p/p. Then z^n=((pn)!/p^n)·[a]^(pn)/(pn)! and v_p((pn)!/p^n)=(n−s_p(n))/(p−1)→∞, so z is topologically nilpotent in A_cris,ρ and 1−z is a unit of B_cris,ρ⁺. But 1−z=p⁻¹(p−[a^p]) vanishes at the degree-one point of radius ρ^p<ρ, so its inverse is not in B. At p=2, ρ=1/2 the exponents are v₂((2n)!/2ⁿ)=n−s₂(n), equal to 0,1,1,3 for n=1,2,3,4, and the zero has radius 1/4. A model placing B_cris,ρ⁺ inside B fails here.
- The ideal b_ρ contains p and [a] for |a|=ρ. Its PD envelope contains [a]²/2!, with 2! having p-valuation 1 at p=2 and 0 at p=3. Treating it as an ordinary nilpotent final thickening loses this distinction.

*Needs:* §1.5; TauCetiRoadmap.DerivedDeRhamCohomology §§PD.1–PD.2 and PD.4–PD.7; TauCetiRoadmap.CrystallineCohomology §CR.1.1.

### 1.14 Crystalline and holomorphic invariant periods

For E=ℚ_p, B_(ρ^p)⁺ is contained in B_cris,ρ⁺, which is contained in B_ρ⁺. Consequently B⁺=intersection_(n≥0) φ^n(B_cris,ρ⁺). For a finite-dimensional isocrystal D over W(k)[1/p], k a perfect subfield of O_F (so the induced valuation on k is trivial), and a nonzero t in B_cris,ρ⁺ with φ(t)=pt, the φ-fixed vectors in D tensor B⁺[1/t] and D tensor B_cris,ρ⁺[1/t] coincide.

One proof route uses the following steps. Compare divided-power factorial denominators with the p-adic unit-ball presentation of each positive-radius ring. Iterate Frobenius and use the characterization of its maximal bijective subring. Use the finite-dimensional Frobenius matrix on D to move a fixed vector through all iterated radii after multiplying by one common power of t. For the arbitrary perfect subfield k, use the WittVector.Isocrystal structure on the fraction field of W(k), with a separate finite-dimensionality hypothesis. Its usual W(k)[1/p] comparison follows from the Witt DVR structure. VectorBundlesAndIsocrystals Layer 1, Coefficient category and rational blocks, fixes the different coefficient field breve E and cannot supply this arbitrary-k carrier.

(FF17, Proposition 1.10.12 and Corollary 1.10.13, p. 94.)

**Checks.**

- The equality is of invariant periods after the indicated localization, not equality of B⁺ and B_cris,ρ⁺.
- For a rank-one trivial isocrystal and the element 1, both localized invariant spaces contain 1. The zero isocrystal has zero fixed space on both sides; equality of fixed spaces does not assert equality of the two rings.

*Needs:* §1.13; §1.6; `WittVector.Isocrystal`.

### 1.15 The local boundary valuation quotient

In Bᵇ⁺=A[1/π], put p_boundary={x:v_0(x)>0}, with v_0(x)=inf_n v_F(x_n), and m_boundary={sum[x_n]π^n: every v_F(x_n)>0}. Define barB=Bᵇ⁺/p_boundary. It is a local domain with maximal ideal m_boundary/p_boundary and residue field W_OE(k_F)[1/π]. Frobenius is bijective on it and the quotient map extends to B⁺.

One proof route uses the following steps. The coefficient-infimum norm is multiplicative, hence p_boundary is prime. If one coefficient is a unit, invert its reduction and solve successively modulo the uniformly positive ideal. For 0<ρ<1 restrict B⁺ to B_[ρ,1]⁺, then to B_1⁺. The latter completed positive ring has the coefficient-infimum valuation; quotienting its ideal v_0>0 gives the same algebraic barB as A[1/π]. Compose these maps to extend the quotient map. This does not assign an inherited Banach topology to quotient eigenspaces.

(FF17, Definition 1.10.14 and Lemma 1.10.15, p. 95.)

**API.**

- The natural map A[1/π]→barB has kernel p_boundary.
- barB is a local domain with the stated maximal ideal.
- Its residue ring is W_OE(k_F)[1/π].
- The quotient map extends compatibly to B⁺ and commutes with Frobenius.

**Checks.**

- π maps to a unit of barB, so the defining ideal is not the π-adic maximal ideal.
- [a] with 0<|a|<1 maps to zero in barB.
- An element whose coefficient valuations are all positive but tend to zero lies in m_boundary and need not lie in p_boundary.
- Uniform positivity defining p_boundary differs from positivity of every coefficient defining m_boundary.
- The constant [a] with v_F(a)=2 lies in both boundary ideals. Coefficients with valuations 1/(n+1) are all positive but have infimum 0, so their series lies in m_boundary and not p_boundary.

*Needs:* §1.6; §0.2.

### Examples

At q=2,r=2, the ordinary radius is 2^(−1/2). The norm of X raised to power 2 is 1/2=|T|_ρ, while the norm of π raised to power 2 is 1/4=|π|_ρ.

### Dependencies

Earlier layers: 0. Suppliers: TauCetiRoadmap.CrystallineCohomology, TauCetiRoadmap.DerivedDeRhamCohomology, TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory, TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology, TauCetiRoadmap.PadicHodgeTheory, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 2: Primitive equations and marked untilts

Develop arbitrary-degree primitive equations, their marked quotients, valuative proximity and Lubin–Tate coordinates.

### 2.1 Q-compatible inverse limits

For a π-adically complete O_E-algebra R and Q in O_E[X] with Q(0)=0 and Q congruent to X^q modulo π, let R^(♭,Q) be the set of sequences (x_n) with Q(x_(n+1))=x_n. Transport its perfect 𝔽_q-algebra structure from lim_(Frob_q) R/π via reduction. Its zeroth projection is multiplicative for the monomial Q=X^q, but for a general Q it is not asserted to be an additive or multiplicative ring map. The construction is canonically independent of Q after passage to the common reduced inverse limit.

One proof route uses the following steps. Lift a compatible residue sequence by successive Q-iteration; the congruence gain makes the lifts Cauchy. Prove independence of lifts and uniqueness using π-adic separatedness. Transport addition, multiplication and inverse Frobenius from the perfection inverse limit, checking functoriality in R.

(FF17, Definition 2.1.1, Proposition 2.1.2, Lemma 2.1.3, Corollary 2.1.4 and Remark 2.1.5, pp. 98–100.)

**API.**

- Reduction gives R^(♭,Q) equiv lim_Frob R/π.
- The n-th coordinate is the limit of the iterates Q^m of arbitrary lifts at level n+m.
- A continuous O_E-algebra map induces a map of the transported perfect 𝔽_q-algebras.
- The reduction equivalence identifies the Q and Qprime versions canonically.

**Checks.**

- For R perfect of characteristic p and Q=X^q, the zeroth coordinate identifies R^(♭,Q) with R.
- The zero sequence is the zero of the transported ring.
- For Q=(1+X)^p-1, coordinatewise ordinary addition of two compatible sequences need not be compatible.
- The Q-compatible sequence set is given its ring structure through reduction, rather than coordinatewise addition.
- At p=2 in O_(ℂ₂), the compatible multiplicative roots of unity sequence (1,−1,i,…) has coordinatewise sum with itself beginning (2,−2,…), which fails the squaring compatibility. Addition must be transported from the residue limit.

*Needs:* TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes; TauCetiRoadmap.RelativeFarguesFontaine §§0.11–0.12 in mixed characteristic and §0.1 in equal characteristic, for the Q-Teichmüller lift; the π-adic completeness and separatedness of R; the native p-typical inverse-limit and Witt interfaces for comparison.

### 2.2 Reduction invariance of the Q-limit

If J is a closed ideal of R and R is complete for (J,π), then reduction induces a bijection R^(♭,Q)→(R/J)^(♭,Q). In particular the preceding comparison with the perfection of R/π is valid. For a perfect 𝔽_q-algebra S, the Q-Teichmüller map identifies S with the Q-compatible inverse limit of W_OE(S).

One proof route uses the following steps. For congruent lifts use Q(x)-Q(y) in π(x-y)+(x-y)^q to increase the (J,π)-adic precision under iteration. Construct compatible coordinates by a diagonal limit and show all choices have the same limit. Apply the ramified twisted Teichmüller uniqueness in the perfect Witt case.

(FF17, Proposition 2.1.2, Lemma 2.1.3 and Remark 2.1.5, pp. 99–100.)

**Checks.**

- The completeness condition is (J,π)-adic and the ideal is closed; an arbitrary quotient is not enough.
- For the square-zero extension S[ε]/(ε²) of a perfect characteristic-p ring, inverse Frobenius kills ε. Its compatible inverse limit reduces to S; retaining an independent nilpotent coordinate gives the wrong limit.

*Needs:* §2.1.

### 2.3 Ramified Fontaine map for complete algebras

For π-adically complete R as above construct θ_Q:W_OE(R^(♭,Q))→R using the Q-twisted Witt ghost polynomials and the compatible-coordinate limits. It commutes with continuous algebra maps and with the Q-change identification. If Frobenius on R/π is surjective, θ_Q is surjective. For E=ℚ_p and Q=X^p this map equals Mathlib WittVector.fontaineTheta on the PreTilt carrier, after the canonical inverse-limit identification. No new p-typical θ or Tilt carrier is introduced.

One proof route uses the following steps. Define compatible finite θ_n using twisted ghost components; Lemma 2.1.6 gives divisibility bounds making the coordinate limit converge. Check the ring identities at finite levels and pass to the limit. For surjectivity lift a residue preimage and correct one π-adic digit at a time; compare the p-typical case by the Teichmüller characterization.

(FF17, §2.1.2, Lemma 2.1.6 and Proposition 2.1.10, pp. 100–103.)

**API.**

- θ_Q is the continuous O_E-algebra map obtained from the twisted ghost limit.
- For f:R→Rprime, f θ_R=θ_Rprime W(f^♭).
- Surjective Frobenius on R/π implies surjective θ_Q.
- For E=ℚ_p,Q=X^p it is Mathlib WittVector.fontaineTheta under the PreTilt comparison.

**Checks.**

- For a perfect characteristic-p R, θ reduces to the zeroth Witt coordinate.
- Changing Q preserves θ after the canonical twisted-Witt and inverse-limit identifications.
- Surjectivity is not concluded for a complete R whose R/π has nonsurjective Frobenius.
- The general ramified map restricts to the supplied p-typical construction and has the stated surjectivity hypothesis.
- For monomial Q and a Teichmüller representative [x], θ([x])=x^♯. On 1 it is 1, on 0 it is 0. Without surjective residue Frobenius the digit-lifting surjectivity argument has no residue preimage.

*Needs:* TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes; TauCetiRoadmap.RelativeFarguesFontaine §§0.11–0.12 in mixed characteristic and §0.1 in equal characteristic, for the twisted ghosts and lift; §2.2; `WittVector.fontaineTheta`; `WittVector.fontaineTheta_teichmuller`; `surjective_fontaineTheta`.

### 2.4 Principal kernel criterion for theta

Assume R is π-torsion-free. If a=Σ_n[a_n]_Q π^n lies in ker θ_Q and the zeroth untilt coordinate of a_0 is π times a unit of R, then ker θ_Q=(a). If π has a compatible system of Q-roots represented by ϖ in R^(♭,Q), the kernel is generated by [ϖ]_Q-π. These are algebraic kernel assertions, with the induced π-adic quotient topology.

One proof route uses the following steps. Reduce modulo π to divide an arbitrary kernel element by a_0 in the perfect inverse-limit algebra. Subtract the multiple of a and iterate after dividing by π, using torsion-freeness to preserve the kernel condition. Sum the coefficients in the complete Witt ring; specialize to the chosen Q-root system.

(FF17, Lemma 2.1.9, p. 102.)

**Checks.**

- The kernel generator is conditional on torsion-freeness and the π-times-unit hypothesis; the special [ϖ]_Q-π formula requires compatible roots.
- For a compatible root sequence of π, θ([ϖ]_Q−π)=π−π=0. A sequence whose zeroth coordinate is not π does not give this kernel equation; π-torsion invalidates cancellation in the inductive proof.

*Needs:* §2.3; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Ramified coefficient rings and coefficient changes; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Marked untilt Cartier divisors and Cartier descent.

### 2.5 Primitive equations of arbitrary degree

For a=Σ_(n≥0)[a_n]π^n in A define PrimitiveDegree(a,d) by a_0≠0, a_d a unit of O_F, and a_i in m_F for every i<d. Equivalently a is not divisible by π and the reduction to W_OE(k_F) has π-order d. Primitive equations form a graded multiplicative monoid, degree zero is A×, and irreducible primitive means positive degree with no factorization into two positive-degree primitive equations. Degree-one equations and their untilts are imported from the marked-untilt contract.

One proof route uses the following steps. Use the reduction to the residue-field Witt DVR to read the first unit coefficient. Multiply reductions to prove additivity of degree and compare constant coefficients to exclude π-divisibility. Relate the condition to the horizontal and positive segments of the Newton polygon.

(FF17, Definition 2.2.1 and §2.2.1, p. 104.)

**API.**

- Degree d is equivalent to non-π-divisibility and residue-Witt order d.
- PrimitiveDegree(a,d) and PrimitiveDegree(b,e) imply PrimitiveDegree(ab,d+e).
- Primitive degree zero is exactly membership in A×.
- The d=1 predicate agrees with the supplied primitive-untilt equation convention.

**Checks.**

- [c]-π has degree 1 for 0<|c|<1.
- The product ([c]-π)([d]-π) has primitive degree 2, including c=d.
- For a=π−[a₀] with 0<|a₀|<1 the primitive degree is 1; its square has degree 2. The element π has zero constant coefficient and fails primitivity; 1 has degree 0.

*Needs:* §0.4; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Marked untilt Cartier divisors and Cartier descent.

### 2.6 Weierstrass division at a degree-one untilt

Assume F algebraically closed and a primitive of degree 1. For D=A/(a), the imported untilt theorem identifies D with the valuation ring of an algebraically closed complete untilt C. Every element of D is θ([x]) for x in O_F, every element has an n-th root for n≥1, and θ([x])=θ([y]) implies v_F(x)=v_F(y). The ideal (a) has a generator [c]-π. Every b in A has b=wa+[d], d in O_F; the remainder representative d is not unique. More generally b has a convergent a-adic expansion Σ_(n≥0)[d_n]a^n.

One proof route uses the following steps. Use the supplied untilt equivalence and preservation of algebraic closedness under tilting, rather than the incomplete special p=2 root calculation in the classical proof. Choose compatible q-power roots in C for a given element, using algebraic closedness and completeness to obtain a Teichmüller value. Lift the value of π to get the linear generator; divide by matching a Teichmüller residue and iterate.

(FF17, Lemma 2.2.3, Proposition 2.2.6, Corollaries 2.2.8–2.2.12, Lemmas 2.2.13–2.2.14 and Proposition 2.2.16, pp. 105–111.)

**Checks.**

- Division supplies an element and a Teichmüller remainder, with no false uniqueness claim for that remainder.
- For E=𝔽_q((π)), a=π−c and b=π², division gives b=(π+c)a+c². In mixed characteristic, a nontrivial compatible root-of-unity sequence ε has ε^♯=1, so θ([ε])=θ([1])=1 although ε≠1; a Teichmüller remainder need not be unique.

*Needs:* §2.5; §2.4; TauCetiRoadmap.PerfectoidSpaces §P3.7.

### 2.7 Primitive points and marked untilts

For a degree-one classical primitive point y, compare its supplied marked untilt with the quotient A/𝔭_y and the extension θ_y:Bᵇ→C_y. Normalize v_y(θ_y([x]))=v_F(x); then v_y(π)=v_F(a₀) for a degree-one primitive generator. Compare this F-normalization with the coefficient-field normalization. When F is algebraically closed, use the supplied algebraic closedness of its untilt to split every cyclotomic polynomial. For E=ℚ_p prove that spherical completeness of F implies spherical completeness of C_y, by comparing truncated valuation balls.

One proof route uses the following steps. Compare the supplied kernel ideal and the classical principal ideal using the primitive-kernel criterion. Localize and use the untilt valuation to identify the completed residue field. Apply algebraic closedness for roots of unity; a separate generic rank-one solvability theorem is unnecessary along this proof route. For spherical completeness, a chain of closed balls whose radii tend to zero is settled by completeness. Otherwise rescale into the valuation ring and a range below v_y(p); the sharp map modulo p identifies the needed truncated valuation balls with balls in F. A common point there lifts to a point in all the original balls. This uses the imported untilt quotient and valuation comparison, not a second construction of tilting.

(FF17, Definition 2.3.1, pp. 114–115; Proposition 2.2.15 and Corollary 2.2.22, pp. 109–114; Corollary 2.2.23, p. 114.)

**Checks.**

- The valuation preserves the F-Teichmüller normalization and need not give v_y(π)=1.
- At y=(π−c) with v_F(c)=2, the F-normalized value v_y(π) is 2 and |π|_y=q⁻², while |π|_E=q⁻¹. A normalization forcing both to q⁻¹ fails.

*Needs:* §2.6.

### 2.8 Valuative proximity of degree-one points

For degree-one points y,z with p_z=(a_z), define delta(y,z)=v_y(θ_y(a_z)) in [0,∞], independent of the primitive generator. It is symmetric, equals ∞ exactly on the diagonal, and satisfies delta(y,w)≥min(delta(y,z),delta(z,w)). Thus d(y,z)=q^(-delta(y,z)), with q^-∞=0, is an ultrametric. For a_r={b in A:v_0(b)≥r}, delta(y,z) is the largest r with p_y+a_r=p_z+a_r; this equality identifies the corresponding truncated untilt valuation rings.

One proof route uses the following steps. Use a-adic division to compare the two evaluations and deduce symmetry. Translate the evaluation bound into equality of ideals modulo a_r. Transitivity of those ideal equalities gives the strong triangle inequality and the comparison of truncated quotients.

(FF17, Proposition 2.3.2 and Remark 2.3.3, pp. 115–116.)

**API.**

- delta is the generator-independent valuation of the other primitive ideal.
- delta(y,z)≥r if and only if the ideals agree modulo a_r.
- q^-delta satisfies the separated ultrametric axioms.
- For E=𝔽_q((π)), y_a=(π-a), delta(y_a,y_b)=v_F(a-b).

**Checks.**

- delta(y,y)=∞ and d(y,y)=0.
- For equal-characteristic points π-a and π-b with a≠b, d is |a-b|.
- A larger truncation precision gives a smaller ordinary distance, so delta is not itself a usual real-valued distance.
- Larger valuative proximity δ means closer points; the ordinary distance is q^(−δ).
- In equal characteristic y_a=(π−a), y_b=(π−b) give δ=v_F(a−b) and d=|a−b|. At a=b, δ=∞ and d=0, and a triple with differences of values 2,3,2 satisfies 2≥min(3,2).

*Needs:* §2.7; §2.6.

### 2.9 Completeness of bounded primitive-point loci

For each R>0 let Y_le_R={degree-one y:v_y(π)≤R}. This locus is complete for d=q^-delta, and y ↦ v_y(π) is continuous. No completeness of the whole union over R is inferred.

One proof route uses the following steps. A Cauchy sequence of ideals stabilizes modulo each a_r. Their compatible inverse limit is an ideal of A. Choose r>R so a lifted generator retains primitive degree one. Show the limit ideal is generated by that primitive lift using the strict change in its truncated residue valuation ideals.

(FF17, Proposition 2.3.4, p. 116.)

**Checks.**

- The uniform upper bound on v_y(π) prevents the limit generator from leaving the degree-one locus.
- For a bounded Cauchy sequence with δ(y_n,y_m)≥n and v_(y_n)(π)≤2, the ideal reductions agree modulo a_3 once n≥3. A limit with v_y(π)>2 is excluded by the chosen truncation.

*Needs:* §2.8; §0.3.

### 2.10 Lubin–Tate primitive equations

For a Lubin–Tate polynomial Q with Q congruent π X modulo X^2 and Q congruent X^q modulo π, and 0≠ε in m_F, set u_ε=Q([ε^(1/q)]_Q)/[ε^(1/q)]_Q=[ε]_Q/[ε^(1/q)]_Q and y_ε=(u_ε). It is primitive of degree one, with reduction ε^(1-1/q). The formal Lubin–Tate group on m_F gives an E-Banach space V with π acting by q-Frobenius. For E=ℚ_p and Q=(1+X)^p-1, u_ε=Σ_(i=0)^(p-1)[(1+ε)^(i/p)]. Normalize |π|_E=q^-1 and use ||ε||_V=1/v_F(ε) for ε≠0, with ||0||_V=0. Then ||π dot ε||_V=q^-1||ε||_V; the ordinary absolute value |ε|_F would not be a homogeneous E-vector norm.

In mixed characteristic the weak Lubin–Tate lift [x]_LT=lim_n[π^n]_LT([x^(q^(−n))]) on m_F is RelativeFarguesFontaine §0.14. For E=𝔽_q((π)) construct the same limit in W_OE(O_F)=O_F[[π]] for the weak (π,[ϖ])-adic topology, for the Lubin–Tate formal O_E-module with [π]_LT=Q: it reduces to x modulo π, hence is injective, and intertwines the formal group law and every O_E-scalar endomorphism with their evaluations on m_F wherever the series converge. It differs from the supplied lift by the coefficient characteristic alone; it is not asserted to be ordinarily additive for an arbitrary formal module. (FF17, Lemma 1.2.9 and Corollary 1.2.10, p. 58, stated there for characteristic-zero E.)

**API.**

- The formal addition and every O_E-scalar endomorphism commute with the lift wherever the series converge.
- Reduction of the lift is x, proving injectivity.
- The weak-limit formula agrees with the Q-Teichmüller lift of §0.1 when Q=[π]_LT is the chosen polynomial: [x]_LT=lim_n Q_n([x^(q^(−n))]).

**Checks.**

- Zero lifts to 0, while a nonzero x has nonzero residue x.
- For Q=πX+X^q the formal group law is additive and [π]_LT=Q, so [x]_LT=[x]_Q is additive on m_F; for q=2 and v_F(t)=1 the lift is [t]_LT≡t+πt^(1/2) modulo π², not the constant Teichmüller element t.
- The multiplicative formal group has [π](X)=(1+X)^q−1=X^q in characteristic p, which is not congruent to πX modulo X², so it is not a Lubin–Tate law over 𝔽_q((π)); the mixed-characteristic cyclotomic formula has no equal-characteristic counterpart.

One proof route uses the following steps. Use the imported twisted Teichmüller lift and the integral polynomial Q(X)/X to define the quotient without division in a larger ring. Its constant term π and reduction X^(q-1) prove the primitive criterion. Transport the formal group law to m_F; perfection makes π invertible, and the valuation supplies the complete Banach norm.

(FF17, Lemma 2.3.5, Definition 2.3.6, Example 2.3.7 and §2.3.2, pp. 117–118.)

**API.**

- u_ε is the polynomial Q(X)/X evaluated at the twisted lift.
- u_ε modulo π equals ε^(1-1/q).
- The principal ideal of u_ε defines a degree-one point.
- Multiplication by π in V is ε ↦ ε^q.

**Checks.**

- For Q=2X+X^2, u_ε=1+[(1+ε)^(1/2)].
- ε=0 gives π rather than a primitive point and is excluded.
- v_(y_ε)(π)=(1-1/q)v_F(ε).
- The cyclotomic formula has exactly p summands; an additional [1+ε] is incorrect.
- At q=2, v_F(ε)=4 gives norm 1/4 in V; πε=ε² has valuation 8 and norm 1/8=(1/2)(1/4). At p=2 the cyclotomic quotient has exactly two summands.

*Needs:* §0.3; §2.5; §2.1; §0.1; TauCetiRoadmap.RelativeFarguesFontaine §0.12 and §0.14, for the mixed-characteristic lifts; TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts §LT.1, Lubin–Tate formal module.

### 2.11 Lubin–Tate parametrization and topology

For F algebraically closed, ε ↦ y_ε induces a bijection (V ∖ {0})/O_E× → Y_degree1. Give the source quotient the valuative proximity sup_(a in O_E×) v_F(ε_1-a dot ε_2), using ordinary subtraction in F after the formal scalar action. It is at least q/(q-1) times delta(y_1,y_2), and the bijection is a homeomorphism. Modding by π^Z yields P_E(V) homeomorphic to Y_degree1/φ^Z. The induced isomorphism C_y→C_(φ^k y) scales the F-normalized valuation by q^k, not by 1.

One proof route uses the following steps. Identify ε as a generator of the Lubin–Tate Tate module of its untilt. Equality of ideals is equality of the corresponding rank-one Tate submodules, hence precisely an O_E-unit orbit. Compare valuations of the finite-level torsion polynomials, then pass to their inverse limit to prove the inequality and inverse continuity; compute Frobenius directly on [x].

(FF17, Propositions 2.3.8–2.3.9, Definition 2.3.11, Proposition 2.3.12 and Corollary 2.3.13, pp. 117–120.)

**Checks.**

- The projectivization uses E×, the point parametrization O_E×, and Frobenius rescales the residue valuation.
- Multiplication of ε by an O_E-unit preserves its primitive point. Multiplication by π changes the point to its Frobenius translate; v_y(π)=2 becomes 2q, not 2. Projectivization uses E×, not O_E× alone.
- For ε₂=π·ε₁=ε₁^q, every a·ε₂ with a in O_E× has v_F(a·ε₂)=q·v_F(ε₁)>v_F(ε₁), so the proximity sup_a v_F(ε₁−a·ε₂) equals v_F(ε₁) and is finite, although y_(ε₂)=φ(y_(ε₁)); the O_E×-quotient separates a point from its Frobenius translate, as the E×-quotient would not.

*Needs:* §2.10; §2.9; TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts §LT.2, Tate module; TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts §LT.1, Lubin–Tate formal module.

### 2.12 Metric and Berkovich topologies

Embed the degree-one classical points into the multiplicative seminorm spectrum of Bᵇ by f ↦ q^(-v_y(f)/v_y(π)). Equip that spectrum with pointwise convergence and require restriction to E to be the fixed π-adic norm. The induced topology on the degree-one locus equals its metric topology. Gauss points are normalized by v_r/r. The proof uses min(v_y(f),delta)=min(v_z(f),delta) for f in A and delta=delta(y,z), not the false lower bound |v_y(f)−v_z(f)|≥delta(y,z) printed in the source, whose distance is the valuation-type quantity delta of §2.8.

One proof route uses the following steps. Continuity of evaluation on Bᵇ follows from the norm bound at ρ=|π|_y. First use equality below the common truncation precision only for f in A. Extend continuity to Bᵇ by inverting π and nonzero Teichmüller elements, whose evaluations never vanish, and divide by the continuous positive function y ↦ v_y(π). The truncated identity itself is not asserted on Bᵇ. For the reverse topology write a metric ball through the valuation of a primitive generator, adjusting for the continuous normalization denominator.

(FF17, §2.3.3, Lemma 2.3.14 and Proposition 2.3.16, p. 120.)

**Checks.**

- Constants immediately refute the printed difference bound; the truncated equality gives the required continuity.
- For f=1 and finite δ>0, min(v_y(f),δ)=min(0,δ)=0 on both sides. The bound |v_y(f)−v_z(f)|≥δ would read 0≥δ and fails.

*Needs:* §2.8; §2.9.

### 2.13 Primitive points under totally ramified coefficient change

Let E′/E be finite separable and totally ramified and F algebraically closed. The determinant norm from A_E′ to A_E sends a degree-one primitive equation to a degree-one primitive equation. Contraction gives Y_(E′),degree1→Y_E,degree1 with residue-field isomorphisms and fibres of cardinality [E′:E]. If the extension is Galois, each fibre is a Gal(E′/E)-torsor. The degree-one assertion concerns ramified Witt primitive degree, not multiplication of that degree by [E′:E].

E′/E finite totally ramified and separable; automatic in the mixed-characteristic source setting. F algebraically closed.

One proof route uses the following steps. Compute the determinant norm modulo π using the finite free ramified Witt coefficient basis. Use the untilt tensor decomposition over the algebraically closed residue untilt to identify the factors and contraction. Count the embeddings of the separable local-field extension and identify the Galois action.

(FF17, §2.3.4, Lemma 2.3.18 and Proposition 2.3.19, p. 121.)

**Checks.**

- The determinant and the residue-untilt comparison both enter the primitive-degree calculation.
- Separability is essential for the fibre cardinality and torsor statement; no such cardinality is asserted for a purely inseparable equal-characteristic coefficient extension.
- For a totally ramified separable quadratic extension there are two coefficient embeddings and two points above a geometric point, while the contracted primitive degree remains 1. Inseparable degree 2 would not give two embeddings.

*Needs:* §0.10; §2.7.

### Examples

In equal characteristic y_a=(π−a), y_b=(π−b) give δ=v_F(a−b) and d=|a−b|. At a=b, δ=∞ and d=0, and a triple with differences of values 2,3,2 satisfies 2≥min(3,2).

### Dependencies

Earlier layers: 0. Suppliers: TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts, TauCetiRoadmap.PerfectoidSpaces, TauCetiRoadmap.RelativeFarguesFontaine, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 3: Geometric zeros and divisors

Use geometric primitive factorization and closed division to turn Newton slopes into locally finite zeros.

### 3.1 Factorization of primitive equations

If F is algebraically closed, every primitive a in A of degree d≥1 is a product of exactly d degree-one primitive elements. Equivalently a=u ∏_(i=1)^d([c_i]-π), with u in A× and 0<|c_i|<1. Thus irreducible primitive equations have degree one.

One proof route uses the following steps. Let λ be the least positive source slope. Choose a root of the coefficient polynomial in F of valuation λ to obtain a first approximate untilt zero. Expand a in powers of the chosen primitive generator and choose the root of largest valuation in the next finite coefficient polynomial. The evaluation precision rises by λ while the proximity grows at least linearly in the iteration index. The points stay on v_y(π)=λ; bounded-point completeness gives a zero. Divide by its degree-one equation and induct on d.

(FF17, Theorem 2.4.1 and Corollaries 2.4.2–2.4.3, pp. 122–124.)

**Checks.**

- Over algebraically closed F, (π−[a])² has two degree-one factors counted with multiplicity; a model counting distinct zeros would return one factor.
- A degree-two primitive product (π−[a])(π−[b]) factors into exactly two degree-one equations. The empty degree-zero product is a unit and has no primitive point factors.

*Needs:* §2.6; §2.9; §0.5.

### 3.2 Evaluation and closed primitive ideals

For degree-one y with ||y||=q^(-v_y(π)) in I, evaluation θ_y extends continuously B_I→C_y, satisfies |θ_y(f)|≤|f|_(||y||), and has kernel m_y B_I. Multiplication by a primitive generator has closed image; division of an element in that image respects every compact annular norm. On B_I⁺ use its corresponding primitive ideal. If λ=v_y(π) is not a slope of f in Bᵇ, v_y(f)=v_λ(f).

One proof route uses the following steps. Bound every Teichmüller summand by its Gauss value at ||y|| and complete. Use the imported Cartier-divisor norm estimate to divide a Cauchy sequence of multiples and obtain a Cauchy sequence of quotients. For the no-slope equality a unique dominant term survives evaluation, or apply the ordinary Laurent-series version in C_y.

(FF17, Lemma 2.4.4, p. 124; Lemmas 2.4.7–2.4.8, p. 126.)

**Checks.**

- For f=1, θ_y(1)=1 and the Gauss bound reads 1≤1; 1 is not in the kernel m_y B_I, so a model with kernel all of B_I, such as the zero map, is excluded.
- At y_a=(π−a), evaluation of π−a is 0 and its Gauss norm at |a| is |a|. If v_F(a)=2 and f=π+[b] with v_F(b)=3, evaluation has valuation 2=min(2,3).

*Needs:* §3.1; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Marked untilt Cartier divisors and Cartier descent.

### 3.3 A zero at every Newton slope

Assume F algebraically closed. For nonzero f in B_I and every positive source slope λ of Newt_I(f), there is y in Y_I with v_y(π)=λ and f(y)=0. One can divide off a degree-one primitive equation for y in B_I. For finitely many slopes listed with multiplicity one can divide off the corresponding product; the remaining polygon deletes exactly those segments.

One proof route uses the following steps. For f in A truncate its Teichmüller expansion and use primitive factorization to choose zeros at the prescribed slope. A uniform bound on the multiplicity at that slope forces a neighboring zero to approach each chosen zero; the proximity bound tends to ∞. Pass to general B_I using compact norm stabilization and closed division, then iterate for finite multiplicities.

(FF17, Theorems 2.4.5–2.4.6 and 2.4.10; Corollary 2.4.11, pp. 124–127.)

**Checks.**

- If |a|=q⁻², the source slope of π−[a] is 2 and its zero is the point y with v_y(π)=2, of radius ||y||=q⁻²; a model placing the zero at radius 2, or reading the slope as q⁻², is excluded.
- For (π−[a])² the source slope v_F(a) occurs with multiplicity 2. Removing one primitive factor leaves multiplicity 1, and removing two leaves a unit.

*Needs:* §3.2; §3.1; §0.8.

### 3.4 Geometric compact annuli and principal ideals

Compare the supplied geometric affinoid PID charts with arbitrary compact intervals I⊆[0,1). The additional endpoint refinement treats I={0} and singletons {ρ} outside |F×| as complete fields, and treats the integral ring {f∈B_[0,ρ]:v_π(f)≥0} as a PID with the extra maximal ideal (π). For other compact intervals identify the Newton point factors with the supplied maximal ideals. This refines the affinoid result by endpoints and arbitrary real radii.

One proof route uses the following steps. Use the supplied affinoid PID result on its charts and Newton factorization for the endpoint refinements. A singleton admitting no slope has every nonzero element invertible; nonnegative π-order retains the additional π-prime.

(FF17, Theorem 2.5.1, Lemma 2.5.2 and Theorem 2.5.3, p. 128.)

**Checks.**

- For F=ℂ_p^♭, whose value group is p^ℚ, and I={p^(−√2)}, no classical point has radius p^(−√2): B_I is a field whose only maximal ideal is (0), not a classical point, whereas a model asserting a point at every radius returns one.
- At I={0} every nonzero π^n is invertible in the field. In the integral boundary ring, π has order 1 and generates the additional maximal ideal; it is not an interior classical point.

*Needs:* §3.3; §1.3; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Classical points and annular Dedekind rings.

### 3.5 Weierstrass products near radius zero

For a finite or countable family 0≠z_i in m_F, tending to zero if infinite, define W=∏_i(1-[z_i]/π), with empty product 1. The product converges in B⁺, uniformly for every compact positive-radius interval; this convergence assertion holds for every standing F. The decomposition assumes F algebraically closed: for I⊆(0,1] whose radii approach 0, a nonzero f in B_I and ρ₀ in I, every zero of f of radius at most ρ₀ is a degree-one point by §3.1, so list these zeros with multiplicity and choose their linear generators π-[z_i]. Then f=Wg with g in B_(I union {0}) and no zeros of radius at most ρ₀. If f in B_(0,1], then g in Bᵇ; if f in B⁺, then g in A[1/π]. Over a general perfect F the near-zero product with an exact prescribed divisor is §4.9, built from normalized factors of arbitrary primitive degree.

One proof route uses the following steps. On a compact J, the norm of [z_i]/π tends uniformly to zero, so the nonarchimedean product converges. Divide successively by the selected linear factors; the Newton norm formula bounds the quotient norms. Show the quotient differences tend to zero on every compact J. The zero-free near-0 remainder extends by the boundary theorem.

(FF17, §2.6, Theorem 2.6.1 and Example 2.6.2, pp. 128–129.)

**API.**

- Finite partial products converge in every positive annular norm.
- The divisor of W is the locally finite sum of the chosen zero points.
- A permutation of the sequence gives the same product, by uniform convergence of the factors to 1.
- Dividing f by its selected factors gives the boundary-extending remainder g.

**Checks.**

- The empty product is 1 with zero divisor.
- A single factor gives 1-[z]/π and the empty family gives 1. An infinite family with |z_i|→0 gives the same exact-divisor construction on every compact positive-radius interval.
- Repeating a fixed nonzero z infinitely often does not meet the convergence hypothesis.
- Over F the completed perfection of 𝔽₃((t)) with v_F(t)=1 and E=𝔽₃((π)), f=π²−t is primitive of degree 2 with the single slope 1/2, but no z in F has v_F(z)=1/2, since the value group of F is ℤ[1/3]; f has no linear factor π−[z], and its zero of radius 3^(−1/2) is a degree-two point. The general-field factor of §4.9 is (π²−t)/π²=1−[t]/π², which over the completed algebraic closure splits as (1−[√t]/π)(1+[√t]/π) with the same weighted divisor; the linear decomposition needs algebraic closedness.
- The construction produces the exact near-zero divisor, and the zero-free remainder, rather than the original function, extends to radius 0.
- The empty product is 1 and has divisor 0. A one-factor product 1−[z]/π has one zero at radius |z|; if |z_i|→0 then for fixed ρ>0 the error norms |z_i|/ρ→0.

*Needs:* §3.3; §1.2; §1.6.

### 3.6 Locally finite divisors on period annuli

For I ⊆ (0,1), define Div(Y_I) to be integer functions on the classical point set whose support meets Y_J in a finite set for every compact J ⊆ I; Div⁺ is its pointwise nonnegative submonoid. Restriction is coefficient restriction. For finite support use exactly the supplied finite Weil-divisor carrier and its weightedDegree, via the canonical finite-support comparison. When F is algebraically closed, for nonzero f define div_I(f)(y)=ord_y(f), where ord_y is imported from the completed de Rham DVR at the degree-one point y. This divisor is locally finite and div(fg)=div(f)+div(g). For general perfect F the carrier Div(Y_I) is the same, and the local order at a point of degree d is constructed in §4.7. If an interval notation includes 0 or 1, Div(Y_I) means this divisor object on I intersect (0,1), and local finiteness is tested only on compact subintervals of that interior. No finiteness at a compact interval reaching radius 1 is imposed.

One proof route uses the following steps. Use imported completed-local DVRs to define the order, not an independently built B_dR carrier. The Newton zero theorem bounds the sum of orders on every compact interval. Construct the finite-support comparison with Finsupp and check coefficientwise agreement with TauCeti.

(FF17, Definitions 2.7.1–2.7.2 and Proposition 2.7.3, pp. 130–132; §3.5.2, p. 146.)

**API.**

- Two locally finite divisors are equal if and only if every point coefficient agrees.
- Restriction commutes with interval inclusion and divisor addition.
- Divisors supported in a fixed compact interval correspond to TauCeti finite Weil divisors on its point set.
- Local DVR orders give div(fg)=div(f)+div(g).
- D is effective if and only if every coefficient is nonnegative.

**Checks.**

- A simple primitive generator has coefficient 1 at its point and zero elsewhere.
- A sequence of points with radii tending to 0 defines a locally finite divisor on (0,1), though its total support is infinite.
- Infinitely many distinct points in one compact annulus with coefficient 1 do not define an allowed divisor.
- Local finiteness permits infinitely many points escaping to a missing boundary, while the finite-support specialization is the supplied finite Weil-divisor carrier.
- A point divisor with local order 2 has coefficient 2; two distinct point divisors add coefficientwise. A sequence of radii q^(−n) is locally finite in (0,1) but has infinite total support.

*Needs:* §3.2; §3.3; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Completed local period rings; `TauCeti.AlgebraicGeometry.WeilDivisor`; `TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree`.

### 3.7 Divisibility detected by zeros

For F algebraically closed and I ⊆ (0,1), nonzero f,g in B_I satisfy f in g B_I if and only if div_I(f)≥div_I(g). Hence div induces an injective map (B_I ∖ {0})/B_I× → Div⁺(Y_I), and the Newton polygon is determined by the divisor up to an integral horizontal and real vertical translation. On a compact interval the divisor map is surjective.

One proof route uses the following steps. Divide out the finitely many point factors on each compact subinterval, using closed division and the local DVR orders. The quotients agree on overlaps by faithful restriction, so they glue in the Fréchet inverse limit. For a compact divisor multiply its finitely many primitive generators; compare unit criteria for injectivity.

(FF17, Proposition 2.7.3 and Theorem 2.7.4, pp. 130–132.)

**Checks.**

- The divisor inequality is pointwise and includes multiplicity; equality of supports alone does not imply divisibility.
- At a fixed point, f=a_y² and g=a_y give orders 2≥1 and f/g=a_y; reversing them gives 1≥2 false and a pole. Equal supports alone cannot detect this.

*Needs:* §3.6; §3.4.

### Examples

The empty product is 1 and has divisor 0. A one-factor product 1−[z]/π has one zero at radius |z|; if |z_i|→0 then for fixed ρ>0 the error norms |z_i|/ρ→0.

### Dependencies

Earlier layers: 0, 1, 2. Suppliers: TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 4: General-field weighted zeros and products

Use quantitative perfect-field descent to recover weighted primitive points and products over general F.

### 4.1 Almost traces and completed fixed fields

Let C=completion of an algebraic closure of the perfect rank-one field F and G_F=Gal(Fbar/F). For finite L/F, m_F is contained in Tr_(L/F)(O_L). Continuous cohomology satisfies m_F H^1(G_F,O_C)=0, H^1(G_F,m_C)=0 and H^1(G_F,1+m_C)=0. Moreover C^(G_F)=F, imported from PadicDifferentialEquationsAndRigidCohomology §RD.0.51(b), which identifies the invariants of a completed algebraic closure of a complete characteristic-p field κ with the completed perfection of κ; for the standing perfect complete F that is F itself. Uniqueness of the one-sided Teichmüller expansion, with G_F fixing π, then gives W_OE(O_C)^(G_F)=A_F for every coefficient field E; for mixed-characteristic E the ramified Witt-coefficient fixed-field statement is §RD.0.52, and the integral and equal-characteristic forms are its coefficientwise consequence stated here.

One proof route uses the following steps. A nonzero trace exists by separability. Taking inverse q-power roots gives trace values whose valuations tend to 0, hence absolute values tend to 1; these generate an ideal containing m_F. Use approximate finite-level averaging with these traces to correct continuous additive and multiplicative cocycles by successively smaller errors. For m_C choose the correction bounds summably inside its open unit ball. The fixed-field assertion is imported; apply uniqueness of Witt coefficients to obtain the A-invariants. The quantitative PerfectoidSpaces contract is used for the continuous cohomology assertions, not to reprove the fixed-field theorem.

(FF17, Chapter 3 introduction, p. 133; Lemma 3.1.1 and Corollary 3.1.2, p. 134.)

**Checks.**

- The trace absolute values tend to 1, and all cohomology is continuous for the valued topologies.
- For L=F the trace is the identity. In a separable degree-p extension in characteristic p, Tr(1)=p=0, although the trace map is nonzero; averaging by 1/[L:F] is invalid.
- For F the completed perfection of 𝔽_p((t)), the completed perfection of F is F, so the imported statement gives C^(G_F)=F. For the imperfect field 𝔽_p((t)), excluded by the Conventions, the invariants are its completed perfection and contain t^(1/p); a model asserting C^(G_κ)=κ for every complete κ fails there.

*Needs:* TauCetiRoadmap.PerfectoidSpaces §§P3.11–P3.12; TauCetiRoadmap.PerfectoidSpaces Layer P3; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.51, Fixed fields of completed algebraic closures in characteristic p.

### 4.2 Vanishing for ramified Witt principal units

For U=1+W_OE(m_C), with the weak Witt topology, H^1_cont(G_F,U)=0. Set U_k=1+π^k W_OE(m_C), k≥1. Then U=lim U/U_k, U/U_1=1+m_C and U_k/U_(k+1)=m_C. All maps have the quotient topologies, and the successive coboundary corrections converge in U.

One proof route uses the following steps. Use Teichmüller expansion and weak completeness for the exact filtration and the inverse-limit assertion. Solve the initial multiplicative cocycle in 1+m_C and each subsequent additive graded cocycle in m_C. Choose compatible corrections and take their π-adic limit, checking weak continuity of the resulting cochain.

(FF17, Lemma 3.1.3–Lemma 3.1.4 and Proposition 3.1.5, pp. 134–135.)

**Checks.**

- This is a topological inverse-limit argument with explicit corrections, not a general claim that H^1 commutes with inverse limits.
- The first quotient of U is 1+m_C; for k=1 the next quotient is additive m_C and products give (1+πa)(1+πb)=1+π(a+b) modulo π². Weak topology, not discrete topology, permits the limit.

*Needs:* §4.1; §0.3.

### 4.3 Descent of stable primitive ideals

If a primitive principal ideal of A_C is G_F-stable, it has a primitive generator in A_F. Normalize its residue-Witt image to π^d; the ratio c_sigma=sigma(a)/a lies in U and is continuous, so a unit coboundary makes the generator invariant. Continuity uses |c_sigma-c_tau|_ρ=|sigma(a)-tau(a)|_ρ/|a|_ρ, with a fixed nonzero denominator.

One proof route uses the following steps. Normalize by an A_C-unit to make the residue coefficient exactly π^d. The ideal invariance yields a U-valued multiplicative cocycle. Its continuity follows from multiplicativity of the Gauss norm; a primitive generator does not have norm 1 at every interior radius. Apply the unit-cohomology vanishing and A_C^(G_F)=A_F.

(FF17, Proposition 3.1.6, p. 135.)

**Checks.**

- The norm divisor in the cocycle estimate is retained; omitting it gives a false equality.
- Multiplication of a by an invariant scalar unit leaves σ(a)/a unchanged; the ratio is 1 only when a itself is invariant. In equal characteristic 3, with F the completed perfection of 𝔽₃((t)), s²=t and σ(s)=−s, the generator a=(1+s)(π−t) of the stable ideal (π−t) has σ(a)/a=(1−s)/(1+s)≠1, and rescaling by −1 leaves this ratio unchanged; the unit coboundary 1+s, not an invariant scalar, makes the generator invariant.
- For a fixed norm |a|_ρ=1/4 and numerator norm 1/8, the ratio difference has norm 1/2, not 1/8.

*Needs:* §4.2; §2.5.

### 4.4 Primitive points as finite Galois orbits

There is a surjection beta:Y_C^(G_F-finite)→Y_F whose fibres are exactly G_F-orbits. If y is represented by an irreducible primitive a, deg(y) equals the size of beta^-1(y). A finite G_F-orbit of a degree-one point is reduced, and its orbit product descends to an irreducible primitive equation. For a stabilizer G_L, products run over the coset set G_F/G_L; L/F need not be Galois.

One proof route uses the following steps. Factor a over C and partition its finite divisor into Galois orbits. Stable factors descend; irreducibility permits exactly one orbit. Conversely form the product of generators over a finite orbit, descend its stable ideal and prove irreducibility by transitivity. Use separability and the degree sum to show each conjugate occurs once and the fibre cardinality is the primitive degree.

(FF17, Proposition 3.1.7 and Theorem 3.1.8, pp. 136–137.)

**Checks.**

- The coset-set formula handles nonnormal stabilizers without writing a nonexistent Gal(L/F).
- For a two-element Galois orbit the orbit product has primitive degree 2. For the S₃ action with a subgroup of order 2, the coset set has 3 members even though that subgroup is not normal.

*Needs:* §4.3; §3.1.

### 4.5 Points and finite-degree marked untilts

For y=(a) in Y_F of degree d, K_y=B_F^b/(a)=A_F[1/π]/(a) is perfectoid over E, with an isometric embedding F→K_y^♭ of degree d. Points of degree d classify such pairs (K,iota) up to continuous E-isomorphism compatible with iota, allowing a common rescaling to make iota isometric. If z above y has stabilizer G_L, then K_y=C_z^(G_L), K_y^♭=L, C_z is the completed algebraic closure of K_y, and Gal(K_y^alg/K_y)=Gal(Fbar/L). The map A_F→O_(K_y) is surjective exactly for d=1.

One proof route uses the following steps. Use the orbit factorization to identify the C-valued quotient with a product of conjugate untilts. Take invariants and use the almost-annihilation of Witt H^1, then invert [ϖ], to identify the quotient field. Over L the degree-one primitive ideal gives its valuation ring. Apply the imported finite-étale tilting equivalence to identify the marked tilt and Galois groups; reverse the construction by the ramified θ kernel.

(FF17, Theorem 3.1.11, Definition 3.1.13 and Remarks 3.1.14–3.1.15, pp. 138–139; Theorem 3.3.1, p. 141.)

**Checks.**

- The marking is continuous. A degree-one equation has the special form [c]-π only if the untilt contains a compatible π-root system.
- A degree-two point has [K_y^♭:F]=2 and two geometric conjugates. A_F→O_(K_y) is not surjective in that case; degree one gives surjectivity.
- Composing the marking ι with the Frobenius of F leaves the field K_y unchanged and replaces the degree-one point (π−[c]) by (π−[c^(1/q)]), the translate φ⁻¹(y) in the ideal action of the Conventions, with v_(φ⁻¹y)(π)=v_F(c)/q; points classify marked pairs, so a model classifying fields alone would identify y with its translates.

*Needs:* §4.4; §4.1; §2.3; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Marked untilt Cartier divisors and Cartier descent; TauCetiRoadmap.PerfectoidSpaces §§P3.11–P3.12.

### 4.6 Radius and degree of a general primitive point

For an irreducible primitive a=sum[a_n]π^n of degree d set ||y||=|a_0|^(1/d). This is independent of the primitive generator and equals |π|_(K_y) with the F-normalized untilt valuation. Set Y_(F,I)={y:||y|| in I}. The point degree is [K_y^♭:F], not [K_y:E]. The Newton polygon of a is linear with source slope -log_q||y|| on [0,d], zero thereafter, and infinite on negative abscissae.

One proof route uses the following steps. Over C the d conjugate linear factors have equal radius, and their constant-term norms multiply. Use generator independence of degree and the norm of its unit factor. Compare the untilt norm through the finite-degree marked embedding.

(FF17, Definition 3.4.1 and Lemma 3.4.2, p. 142.)

**API.**

- radius(y)=|a_0|^(1/deg(y)) for any primitive generator.
- radius(y)=|π|_(K_y).
- Every geometric point above y has the same radius.
- Membership in Y_(F,I) means precisely radius(y) in I.

**Checks.**

- For y=([c]-π), radius(y)=|c|.
- For two conjugate linear factors of norm s, the descended degree-two point has radius s, not s^2.
- A degree-d point contributes d times its local vanishing order, even though it is one point of Y_F.
- A geometric factor has constant norm ||y||, while the original degree-d constant coefficient has norm ||y||^d.
- For d=2 and |a₀|=q⁻⁶, ||y||=q⁻³. The polygon joins (0,6) to (2,0), of source slope 3; using |a₀| as the radius would give slope 6.

*Needs:* §4.5; §0.5.

### 4.7 Weighted Newton zero formula

For 0≠f in B_(F,I), its positive finite source slopes are λ=-log_q||y|| at the zeros y in Y_(F,I); the multiplicity at λ is Σ_(||y||=q^-λ) deg(y) ord_y(f). Evaluation extends B_(F,I)→K_y with norm bound |f(y)|≤|f|_(||y||) and kernel m_y B_(F,I). For compact J ⊆ I containing ||y|| and a primitive generator a_y of y, the a_y-adic completion of B_(F,J) is a complete discrete valuation ring with uniformizer a_y and residue field K_y; define ord_y(f) as the valuation of f in it, independent of J and of the choice of a_y. For every geometric point z of Y_(C,J) above y, ord_y(f)=ord_z(f) with ord_z the imported geometric order, so geometric pullback repeats the local order at each of the deg(y) conjugates. At geometric points this completion agrees with the imported ramified completed local ring.

One proof route uses the following steps. A zero at a slope exists over C; the finite multiplicity bound forces its G_F-orbit to be finite. Descend the orbit point and use the radius identity. For the completion use that B_(F,J) is a domain, a_y is a non-zero-divisor and B_(F,J)/(a_y)=K_y is a field (the evaluation kernel): then a_y^k B_(F,J)/a_y^(k+1) B_(F,J) is one-dimensional over K_y, every element of B_(F,J)/(a_y^n) is a unit times a power of a_y, and the inverse limit is a complete DVR; no Galois descent is needed. Over C the primitive generator a_y splits into deg(y) distinct conjugate degree-one factors (§4.4), each simple, so a_y is a uniformizer at every z above y; compare with the imported Cartier completion to calculate orders and evaluation kernels.

(FF17, Lemma 3.4.3 and Theorem 3.4.4, pp. 142–143.)

**Checks.**

- The slope is a logarithmic valuation, and its weight is deg(y) times the vanishing order.
- A degree-three point with local order 2 contributes 3·2=6 to the Newton jump and splits into three geometric points, each of local order 2.
- For y of degree 2 and n=2, B_(F,J)/(a_y²) has length 2 with the chain 0⊂(a_y)/(a_y²)⊂B_(F,J)/(a_y²), each step a one-dimensional K_y-space; it is not K_y×K_y. A model taking the completion of B_(F,J) at y to be a product of the two geometric completions would get two maximal ideals here.

*Needs:* §4.6; §4.5; §4.4; §3.6; §3.3; §3.2; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Completed local period rings, at geometric points.

### 4.8 Degree-independent normalized primitive generators

If y_i in Y_F have ||y_i||→0, choose primitive generators a_i in A_F with a_i/π^(deg y_i)→1 in B⁺. For a point of radius s, write its geometric factor product w=∏_(j=1)^d(π-[z_j]), all |z_j|=s. A descent unit u can be chosen with |u-1|_1≤s^(1/2); whenever s<ρ<1, |uw/π^d-1|_ρ≤max(s^(1/2),s/ρ). This estimate is independent of d.

One proof route uses the following steps. The conjugate radii equal s, so the normalized product differs from 1 by at most s/ρ in a ρ-norm. Apply the filtered unit-cocycle correction with a relaxed bound s^(1/2) to descend w. Bound the product error by the maximum of the unit error and the normalized factor-product error. Do not divide a coarse endpoint-1 bound by ρ^d.

(FF17, Lemma 3.4.5, pp. 143–144.)

**Checks.**

- The estimate remains convergent if deg(y_i) tends to ∞. The source's bound (||y||^(1/2)/ρ)^(deg y) is derived from |w−π^d|_1≤||y||^d, but every factor has |z_j|=||y|| (§4.6), and the linear term of w−π^d has norm |Σ_j z_j|, which can equal ||y||; with the correct bound |w−π^d|_1≤||y|| that argument gives only ρ^(−d)√s.
- At s=2⁻⁸ and ρ=1/4, max(√s,s/ρ)=max(1/16,1/64)=1/16, for d=1 and d=100 alike, whereas ρ^(−d)√s equals 1/4 at d=1 and 2^(196) at d=100.

*Needs:* §4.3; §4.6; §4.2.

### 4.9 Weierstrass products over a perfect field

For an effective locally finite divisor D supported in Y_(0,ρ₀], there is W in B_F⁺ with div(W)=D, obtained from the normalized generators a_i/π^(deg y_i). For an effective divisor supported in Y_[ρ₀,1), there is a nonzero H in B_F with div(H)≥D, using factors 1-(1-a_i/[a_(i,0)])^i after listing the points with multiplicity using indices i≥1; the empty product is 1. The second assertion supplies a divisor majorant and does not assert equality.

One proof route uses the following steps. For the near-zero part use the degree-independent uniform estimate on each compact annulus and take the convergent product. For the near-one part use |1-a_i/[a_(i,0)]|_ρ≤ρ/||y_i|| for ρ≤||y_i||; the increasing exponents make the errors tend uniformly to zero. Identify the prescribed zeros and distinguish the possible additional zeros of the outer-boundary factors.

(FF17, Propositions 3.4.6–3.4.7, pp. 144–145.)

**API.**

- Construct W with the exact chosen divisor below ρ₀.
- Construct H whose divisor dominates the chosen outer-boundary divisor.
- Both products converge uniformly for every compact interval of positive radii.
- Geometric base change of W has the pulled-back weighted orbit divisor.

**Checks.**

- For D=0 both constructions can return 1.
- One degree-d point is represented by a/π^d and has local divisor coefficient 1, with Newton multiplicity d.
- An outer factor 1-(1-a/[a_0])^i for i>1 can have zeros besides those of a; equality of divisors is not an API theorem.
- At i=0 the factor would be 1−h⁰=0 and force the whole product to vanish; indices start at 1. The exact divisor assertion is confined to the near-zero product; the outer product is a majorant.
- One degree-d factor a/π^d gives its exact near-zero divisor. For an outer point, 1−h²=(1−h)(1+h) vanishes at h=1 and may also at h=−1; it is a majorant, not an exact prescribed divisor.

*Needs:* §4.8; §3.6.

### Examples

A degree-three point with local order 2 contributes 3·2=6 to the Newton jump and splits into three geometric points, each of local order 2.

### Dependencies

Earlier layers: 0, 2, 3. Suppliers: TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology, TauCetiRoadmap.PerfectoidSpaces, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 5: Closed ideals and meromorphic functions

Classify closed ideals, separate closedness from finite generation and clear meromorphic poles.

### 5.1 Compact period rings over a perfect field

For perfect F and compact nonempty I ⊆ [0,1), B_(F,I) is a complete valued field if I={0}, or if I={ρ} with ρ not in |F×|^(1/∞). Otherwise it is a PID and its maximal ideals are exactly m_y B_(F,I) for y in Y_(F,I). If 0 belongs to I and I≠{0}, the subring with v_π≥0 is a PID whose maximal ideals are those point ideals together with (π). The spectrum in the second assertion is Spm(B_I), not Spm(B_(I ∖ {0})).

One proof route uses the following steps. A compact polygon has finitely many slopes. The general-field zero theorem provides an irreducible primitive equation at each slope; divide repeatedly until a unit remains. Primitive factorization is unique because each point kernel is prime. Apply the factorial-type PID criterion used in the geometric case. A nonrational singleton permits no slope and is therefore a field; retain the extra π-factor in the integral boundary-zero subring.

(FF17, Theorem 3.5.1, p. 145.)

**Checks.**

- The exceptional radius group is the divisible hull of |F×|, and both singleton and integral boundary-zero cases are checked.
- A singleton radius outside the divisible hull of |F×| admits no zero slopes and every nonzero element is a unit. At a radius of a degree-two point the point ideal has degree 2, so the divisible hull cannot be replaced by |F×|.

*Needs:* §4.7; §3.4; §1.3.

### 5.2 General-field divisor criterion

For I ⊆ (0,1) and nonzero f,g in B_(F,I), f belongs to g B_(F,I) if and only if ord_y(f)≥ord_y(g) for all y in Y_(F,I). Equality of the divisors is equivalent to f/g in B_(F,I)×. Thus div embeds nonzero elements modulo units in Div⁺(Y_(F,I)).

One proof route uses the following steps. On a compact subinterval use its PID factorization and the weighted local-zero comparison. The compact quotients agree under restriction, hence define an element of the inverse limit B_(F,I). Apply the criterion in both directions for equality, and compare the no-zero unit criterion.

(FF17, Theorem 3.5.5, p. 146.)

**Checks.**

- This statement avoids the special singleton boundary rings, where the ordinary interior divisor has no information.
- For orders (2,1), f/g has order 1≥0; for (1,2), it has order −1 and is not holomorphic. Equality of divisors gives order 0 at every point in both directions.

*Needs:* §5.1; §3.6; §4.7.

### 5.3 Closed ideals and effective divisors

For I ⊆ (0,1), D ↦ a_D={f in B_(F,I):ord_y(f)≥D(y) for every y}; this map is an order-reversing bijection from effective locally finite divisors to nonzero closed ideals. Its inverse takes the minimum local order attained by the ideal. In particular the nonzero closed maximal ideals are exactly the ideals m_y, y in Y_(F,I). The zero ideal is maximal exactly when B_(F,I) is a field, which for I⊆(0,1) happens exactly when I={ρ} with ρ outside the divisible hull of |F×| (§5.1); then Y_(F,I) is empty and (0) is the only closed maximal ideal. Under compact restriction a_D B_J is the compact principal ideal of D restricted to Y_J.

One proof route uses the following steps. Each finite jet-vanishing condition is closed; their intersection gives closedness. Near-zero exact products and outer-boundary majorants show a_D is nonzero. For a closed ideal a, use its finite-generated extensions to compact PID rings and successive approximation to identify a with lim_J B_J a. Read its compact multiplicities and glue them into D; verify both inverse identities. A nonzero closed maximal ideal corresponds to a minimal nonzero effective divisor, a single point with multiplicity one; the zero ideal is handled by the field criterion of §5.1.

(FF17, Proposition 3.5.2 and Corollary 3.5.3, p. 146.)

**Checks.**

- The ideal/divisor correspondence reverses inclusion and is restricted to nonzero closed ideals.
- For D=[y], a_D=m_y; for 2D, a_(2D)=m_y²⊆m_y. For D=0, a_D=B_I. The zero ideal cannot correspond to a locally finite finite-multiplicity divisor.
- Take F=ℂ_p^♭, so |F×|=p^ℚ, and I={p^(−√2)}. Then Y_(F,I) is empty and B_I is a field, so the set of classical points has 0 elements while the closed maximal ideals form the one-element set {(0)}. The nonzero closed maximal ideals form the empty set, matching Y_(F,I); D=0 still maps to B_I.
- On a compact interval with value-group endpoints containing the radius of a degree-one point y, m_y is a nonzero closed maximal ideal and (0) is not maximal, since B_I is a PID with nonzero nonunits.

*Needs:* §5.1; §5.2; §4.9.

### 5.4 Half-open Bezout theorem

For 0<ρ<1, B_(0,ρ] is Bézout and its nonzero closed ideals are exactly its nonzero principal ideals. More generally on any I ⊆ (0,1) and for nonzero f,g, the ideal (f,g) is principal if and only if min(div f,div g) is principal. The Robba colimit is Bézout. The discrete-Cohen-coefficient Bézout theorem is PadicDifferentialEquationsAndRigidCohomology §RD.0.29 and the ordinary Laurent-analytic one, over a spherically complete coefficient field, is its §RD.0.24; they are used only for the comparison with those specializations, and the arbitrary-perfect-F proof is given here.

One proof route uses the following steps. If the minimum divisor is principal, divide by its generator and reduce to two functions with disjoint zero divisors. Each compact annulus supplies a Bézout relation. Lift compatible relations by successive small corrections along the dense Banach restriction maps; completeness makes the corrections converge, which is the needed lim-one vanishing argument. On (0,ρ] all effective divisors are principal by the exact near-zero product. Iterate the two-generator assertion and compare filtered unions. Handle a zero generator separately: (f,0)=(f) and (0,0)=0, without using the divisor of zero.

(FF17, Proposition 3.5.6, Theorem 3.5.7 and Corollary 3.5.8, p. 147.)

**Checks.**

- The half-open theorem retains arbitrary perfect F; the discrete-Cohen-coefficient analytic theorem has a different coefficient carrier.
- The minimum of local orders 2 and 3 is 2, giving the generator a_y². For a zero generator (f,0)=(f), and (0,0)=0; neither calculation uses div(0).

*Needs:* §5.3; §4.9; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.29, for the discrete-Cohen-coefficient comparison only; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.24, for the ordinary Laurent comparison only.

### 5.5 A nonclosed maximal ideal of an open annulus

If I ⊆ (0,1) has a missing boundary and a sequence of distinct classical points escaping every compact subinterval towards it, B_I has a nonclosed maximal ideal. Choose a nonzero divisor majorant f for the sequence and a compact exhaustion J_n. Divide f by the finite product of all its primitive zero factors in J_n, with their full multiplicities, to obtain g_n in B_I. The increasing union of (g_n) is proper and dense. Any maximal ideal containing it is nonclosed. Removing only the prescribed sequence would not justify density if f had additional zeros.

Use I=(0,ρ], 0<ρ<1, and points with radii tending to 0 for the explicit construction. No assertion is made that every interval automatically has such a sequence over every F.

One proof route uses the following steps. The general-field Weierstrass majorant gives a nonzero f with infinitely many escaping zeros. Its full divisor is locally finite. On each J_n form the finite product a_n of primitive generators with exactly the orders of f there; the divisor criterion shows g_n=f/a_n belongs to B_I. For nested J_n, a_n divides a_(n+1), so (g_n) is contained in (g_(n+1)). Every g_n has at least one remaining escaping zero, hence is not a unit; the union is proper. For a fixed J_m, a sufficiently late g_n has no zero there and is a unit in B_(J_m). Since B_I is dense in B_(J_m), (g_n) has dense image in B_(J_m). An exhaustion tests every finite family of seminorms, proving density in B_I. A maximal ideal containing this proper dense ideal cannot be closed. In the near-zero case the exact tail products of §4.9 give a direct example.

(FF17, Compare Theorem 3.5.7, p. 147, and the distinction between closed ideals and ideals in §3.5.2, p. 146; construction from these results.)

**Checks.**

- The compact deletion removes every zero of the chosen majorant, including extra zeros; a fixed compact restriction of a late generator is a unit. The ideal is therefore dense and proper without assuming an outer-boundary product is exact.
- After deleting all zeros of f in J_n, g_n has order 0 at every point of J_n and still has order ≥1 at an escaping zero. Thus g_n is a compact unit but not a global unit.

*Needs:* §5.3; §4.9; §5.2; §0.6.

### 5.6 Meromorphic functions on the period domain

For I ⊆ (0,1) define M(Y_I)=lim_(compact J ⊆ I) Frac(B_J) with transition maps induced by the injective ring restrictions. A compatible family is a meromorphic function. M(Y_I) is a field, since the transition maps are injective field homomorphisms. Extend the local DVR order to nonzero fractions and, for nonzero f in M(Y_I), set div(f)=Σ_y ord_y(f)[y], a locally finite integral divisor in Div(Y_I); the zero function has no divisor. This agrees with the imported finite Weil divisor operations on every compact subinterval.

One proof route uses the following steps. Use domain and faithful restriction to extend each map to fraction fields. Define the inverse limit as a compatible subfield of the product. Compute local orders by subtraction on numerator and denominator; compact PID factorization gives local finiteness and independence.

(FF17, Definition 3.5.9 and the divisor construction before Theorem 3.5.11, pp. 147–148.)

**API.**

- A meromorphic function restricts to every smaller interval and every compact fraction field.
- A fraction of global holomorphic functions gives a compatible meromorphic family.
- div(f/g)=div(f)-div(g) when f,g are nonzero holomorphic functions.
- The y-coordinate of the divisor is the normalized order in B_dR,y.

**Checks.**

- The constant function 1 has zero divisor.
- The zero function is excluded: ord_y(0) would be +∞ at every classical point, which is not an integer coefficient, and its support would not be locally finite.
- The reciprocal of a primitive generator has order -1 at its point.
- Two compact fractions that differ on their common nonempty subinterval do not define an element of M(Y_I).
- Compatibility in the inverse limit is required; arbitrary unrelated compact fractions are not global meromorphic functions.
- For the compatible fraction 1/a_y, the local order at y is −1. Replacing numerator and denominator by their products with a_y adds 1−1=0 to that order.

*Needs:* §5.1; §3.6; §4.7.

### 5.7 Global fractions and divisors

M(Y)=Frac(B). The divisor map induces an injection M(Y)×/B× → Div(Y), and B={0}∪{f in M(Y)×: div(f)≥0}. For nonzero meromorphic f,g, div(f)≥div(g) if and only if f/g belongs to B.

One proof route uses the following steps. Separate the polar divisor into a near-zero and an outer-boundary part. Use an exact near-zero product and an outer majorant to find a nonzero global denominator whose divisor dominates all poles. Multiply to obtain a globally holomorphic numerator and apply the divisor criterion; use the unit criterion for injectivity.

(FF17, Proposition 3.5.10 and Theorem 3.5.11, p. 148.)

**Checks.**

- Clearing all poles needs a global divisor majorant, not just the compact PID theorem.
- 0 belongs to B through the explicit singleton, 1 has divisor 0 and lies in B, and 1/a_y has coefficient −1 at y and is not in B; no infinite divisor coefficient is used.
- For f=a_y⁻² and denominator a_y², the numerator is 1 and the polar order −2 becomes 0. For a_y/a_y all local orders are 0, giving the unit class.

*Needs:* §5.6; §4.9; §5.2.

### 5.8 Galois invariants of holomorphic period rings

For C=completion of Fbar, B_C^(G_F)=B_F and (B_C⁺)^(G_F)=B_F⁺. The equalities preserve the induced Fréchet topologies and all annular restrictions where defined.

One proof route uses the following steps. For invariant f, its zero divisor below ρ descends as a finite-orbit divisor. Realize that divisor by g in B_F⁺. Write f=gh. The remainder h has no zeros near 0 and therefore extends to B_(C,[0,1)); uniqueness makes it invariant. The unique boundary-zero Teichmüller expansion then has F-coefficients by the completed fixed-field assertion. Positivity descends by its norm characterization. 

(FF17, Theorem 3.6.1, pp. 148–149.)

**Checks.**

- It is the quotient remainder h that extends across radius 0; the chosen factor g carries the zeros.
- For an invariant constant c∈C, the fixed-field theorem gives c∈F. If f=gh and g carries one zero, h has local order 0 there after division; attributing zero-freeness to g reverses the construction.

*Needs:* §4.4; §4.9; §5.2; §4.1.

### Examples

The minimum of local orders 2 and 3 is 2, giving the generator a_y². For a zero generator (f,0)=(f), and (0,0)=0; neither calculation uses div(0).

### Dependencies

Earlier layers: 0, 1, 3, 4. Suppliers: TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology. The subsection Needs lines give the exact sections and hypotheses.

## Layer 6: Frobenius eigenvectors and orbit products

Refine eigenspace topology and construct full orbit products and their finite-jet exact sequences.

### 6.1 Banach topology of Frobenius eigenspaces

Refine the supplied equality B^(φ^h=π^d)=(B⁺)^(φ^h=π^d), for d≥0,h≥1 and the required residue constants, by its Banach E_h-topology. That topology and its independence of sufficiently small annular radii are imported from VectorBundlesAndIsocrystals Layer 3, Norm topology on twisted Frobenius invariants, for the finite projective Robba Frobenius module of the standard slope-d/h bundle. Prove here that for any 0<ρ<1 the compact fundamental interval [ρ,ρ^(1/q^h)] gives an equivalent norm. For d>0 the boundary quotient induces an algebraic E_h-linear isomorphism onto barB^(φ^h=π^d), whose inverse sends a lift x to lim_k π^(−kd)φ^(kh)(x). Transport the Banach topology through this isomorphism. The inherited boundary-valuation topology is discrete on the positive eigenspace and cannot replace it. Degree zero gives E_h and negative degrees give zero.

For the E_h-scalar description assume F contains F_(q^h); otherwise use the corresponding unramified constant subfield actually present in F.

One proof route uses the following steps. Use the imported eigenvector comparison, and control all radial norms by a fundamental interval and the eigen-equation. For d>0 the error between successive quotient lifts is uniformly positive in the boundary coefficient valuation, so the normalized iterates converge in every interior norm. Prove the inverse identities algebraically. The fundamental-interval estimates extend the supplied radius-independence from sufficiently small radii to every compact fundamental interval in (0,1). Transport this topology to the quotient eigenspace; do not invoke open mapping for its inherited boundary valuation. Treat d=0 separately.

(FF17, Propositions 4.1.1–4.1.3, Lemma 4.1.4 and Propositions 4.1.5–4.1.6, pp. 152–154.)

**Checks.**

- The quotient-limit formula is for d>0. The norm is on the stated eigenspace with its usual local-field scalars, not the endpoint-1 ring topology.
- For q=2, h=1,d=1 a nonzero quotient eigenvector has boundary value v₀=0; its inherited norm is 1. For d=0 the fixed space is E; for d=−1 it is 0.

*Needs:* §1.15; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Rank-one Frobenius twists and Homogeneous section ring; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Slope-sensitive cohomology of standard bundles; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 3, Norm topology on twisted Frobenius invariants.

### 6.2 Coefficient and uniformizer transport of eigenvectors

Changing π to π′ transports the eigenspace canonically after tensoring with the d-th tensor power of the E_h-line L={u in W_OE(𝔽̄_q)[1/π]:φ^h(u)π=u π′}. A chosen nonzero u gives multiplication by u^d. For an unramified extension E_n/E, scalar extension from E_h to E_(nh) identifies B_E^(φ_E^h=π^d) with B_(E_n)^(φ_(E_n)^h=π^(nd)). For a finite separable extension E′/E of degree N and residue degree f, the coefficient-ring comparison followed by the uniformizer twist converts degree d to degree Nd. These identifications respect products and the eigenvector Banach topologies.

F contains an algebraic closure of the residue constants for the displayed unramified scalar fields and twisting solutions. General F is treated by descent, not by pretending these constants lie in F.

One proof route uses the following steps. Solve φ^h(u)/u=π′/π in the unramified constant Witt field; the whole solution space is a line and includes zero. Use finite cyclic descent for the unramified eigencondition, keeping φ_(E_n)=φ_E^n. For a ramified extension compare π_E^f with π_(E′)^N and solve their unit ratio by the same unramified twist. Check the degree rescaling on an eigenvector before extending by continuity.

(FF17, §6.1.1–6.1.3, pp. 243–244; Proposition 4.1.5, p. 154; Theorem 6.5.2, pp. 255–256.)

**Checks.**

- The twisting line lies in the field after inverting π; the set of integral unit solutions alone is not an E_h-line. Separable extensions are required when etaleness is used.
- With φ(u)π=uπ′, φ(u^d x)=(π′)^d u^d x when φ(x)=π^d x. For unramified degree 2, φ′=φ² changes eigen-exponent d to 2d.

*Needs:* §6.1; §0.10.

### 6.3 Weighted divisors modulo Frobenius

Let |Y|/φ^Z be the set of classical Frobenius orbits. Define Div(Y/φ^Z) as the imported finite Weil-divisor group on this orbit set, weighted by deg(y). Pullback repeats each orbit coefficient along all its translates and identifies this group with the φ-invariant locally finite divisors on Y. For any 0<ρ<1 its weighted degree is the sum deg(y)D(y) over ρ^q<||y||≤ρ. No new copy of the finite Weil-divisor carrier or its degree map is introduced.

One proof route uses the following steps. Frobenius acts freely on positive radii, with radius q-power, so every orbit meets the half-open fundamental annulus exactly once. Local finiteness on that compact annulus gives finite support; a finite-support orbit divisor pulls back locally finitely. Use the imported weightedDegree homomorphism and independence of the chosen fundamental annulus.

(FF17, Definition 6.2.2, p. 245; Lemma 6.2.3, Definition 6.2.4 and Lemma 6.2.5, p. 246.)

**API.**

- Repeat each orbit coefficient over all Frobenius translates.
- Pullback is a group isomorphism onto φ-invariant locally finite divisors.
- The degree is the imported weightedDegree with weight deg(y).
- Any half-open annulus (ρ^q,ρ] computes the same degree.

**Checks.**

- The orbit of a primitive degree-d point has weighted degree d, even though its orbit coefficient is 1.
- A point and its Frobenius translate define the same orbit divisor.
- An arbitrary infinite-support function on the orbit set is not an orbit divisor.
- The weight is the primitive degree, not merely one per orbit. The orbit divisor has finite support even though its pullback generally has infinitely many points.
- An orbit represented by ρ has next radius ρ^q. The half-open interval (ρ^q,ρ] counts exactly one. Weights 3 and 2 contribute 3+2=5, whereas counting representatives gives 2.

*Needs:* §3.6; §4.7; `TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree`.

### 6.4 Positive Frobenius products

For b in M_d={b in A ∖ π A:b modulo W(m_F) equals π^d}, d≥0, define Pi_plus(b)=∏_(n≥0) φ^n(b)/π^d. The product converges in B⁺, satisfies φ(Pi_plus(b))=π^d Pi_plus(b)/b, and has divisor Σ_(n≥0) φ^n(div b), with the Frobenius ideal action specified in Conventions. It is multiplicative in b. M_0 is the group of b congruent to 1 modulo W(m_F), and M_d/M_0 identifies with primitive degree-d ideals.

One proof route uses the following steps. On a compact radial interval J⊆(0,1) the normalized factors φ^n(b)/π^d tend to 1 uniformly: b/π^d−1 is the sum of the Teichmüller terms [b_m]π^(m−d) with m≠d, all b_m in m_F, and of [b_d]−1 in W(m_F); for a prescribed error, first choose a cutoff M so that the terms with m>M lie below it on J for every n, then raise the finitely many remaining coefficients to high q-powers. No uniform rate exponential in q^n is asserted, since the coefficient valuations need not be bounded below. Use complete nonarchimedean product convergence and shift the index to obtain the eigen-ratio identity. Extract local orders after restricting to a compact annulus, where only finitely many factors have zeros. Compare normalizing two primitive generators by a unit.

(FF17, §6.2.3, pp. 247–248; Definition 6.2.11, p. 250.)

**API.**

- Partial normalized products converge on every compact annulus.
- φ(Pi_plus(b)) b=π^d Pi_plus(b).
- Pi_plus(bc)=Pi_plus(b)Pi_plus(c).
- Its zeros are exactly the indicated nonnegative translates, counted with multiplicity.

**Checks.**

- Pi_plus(1)=1 for d=0.
- b=π^d for d>0 is not in M_d, because it lies in π A; it cannot serve as a primitive point.
- Shifting finite products leaves exactly the b/π^d denominator, determining the sign in the Frobenius ratio.
- The normalized factors b/π^d, not the unnormalized iterates, converge to 1.
- In equal characteristic with q=2, v_F(t)=1 and b=1+Σ_(i≥1)[t^(2^(−i))]π^i in M₀, the raw valuation at ρ=1/2 is v₁(φ^k(b)−1)=min_(i≥1)(2^(k−i)+i)=k+1 for k≥1. The factors tend to 1, so the product converges, but v₁(φ^k(b)−1)/2^k→0; a route asserting an error exponentially small in q^k is refuted.
- For b=π−[a], the first two normalized factors are (1−[a]/π)(1−[a^q]/π); shifting deletes the first factor and multiplies the quotient by π/b. For b=1 the product is 1.

*Needs:* §1.6; §4.8.

### 6.5 Negative Frobenius product as a difference equation

Assume F algebraically closed. For nonzero b in Bᵇ with v_π(b)=0, the solutions x in Bᵇ to φ(x)=bx form an E-line. It has a generator in A ∖ π A when b is in M_d. Its E×-class is denoted Pi_minus(b); its divisor is Σ_(n<0) φ^n(div b). This is a difference-equation construction and does not assert convergence of the naive unnormalized infinite negative product.

One proof route uses the following steps. For general b in Bᵇ with v_π(b)=0, rescale the unknown by a nonzero Teichmüller constant to make its multiplier integral, using a (q-1)-st root in F. Then solve the coefficient-zero equation x_0^q=b_0x_0 over the algebraically closed field. Lift one π-adic digit at a time by solving additive polynomials U^q-b_0U-c over F, and use the coefficient bounds to keep the lift in Bᵇ (in A for normalized b). For uniqueness compare solutions in W_OE(F)[1/π], whose φ-fixed field is E. Use the difference equation and local orders to identify the negative translates; the residual no-zero solution has the prescribed normalization.

(FF17, Proposition 6.2.10, p. 249; Definition 6.2.11, p. 250.)

**Checks.**

- The fixed-field uniqueness argument takes place in W_OE(F)[1/π], not in Frac(B), whose Frobenius invariants are the nonconstant function field.
- For b=1, the solution space is E and its normalized generator is 1. The unnormalized product of backward factors 1 does not select a distinguished scalar; the solution is an E-line.
- For b=π−[a] with v_F(a)=1 and q=2, the divisor of Pi_minus(b) consists of the points π−[a^(2^n)] for n<0, of radii 2^(−1/2), 2^(−1/4), …, accumulating only toward 1 and none of radius at most 1/2; the normalized solution lies in A∖πA. A model whose zeros were the forward translates n≥0, of radii 1/2, 1/4, 1/16, …, accumulating at 0, could not lie in Bᵇ, whose elements have only finitely many zeros of radius at most ρ for each ρ<1.

*Needs:* §1.1; §3.3; §6.4.

### 6.6 Full Frobenius orbit products

Assume F algebraically closed. For b in M_d, Pi(b)=Pi_plus(b)Pi_minus(b), defined up to E×, is a nonzero element of P_d and has divisor Σ_(n in Z) φ^n(div b). It is multiplicative modulo E× and invariant under the M_0 normalization equivalence. Thus any effective orbit divisor is represented by a homogeneous eigenvector.

One proof route uses the following steps. Multiply the two functional equations to get φ(Pi)=π^d Pi. Add their complementary zero divisors and apply the no-zero unit criterion to normalization changes. Represent each of the finitely many orbit points by a normalized primitive equation and multiply; count degree with its primitive weight.

(FF17, Lemma 6.2.12, pp. 250–251.)

**Checks.**

- The construction is only canonical as an E×-class, which is precisely the quotient used in the homogeneous monoid.
- The recurrences multiply to φ(Π₊Π₋)=π^dΠ₊Π₋. For d=1 the positive and negative orbit half-tails combine to coefficient 1 at every integer translate.
- For b in M₀, Pi(b) lies in P₀=E and is a nonzero scalar, so for u in M₀ the classes of Pi(ub) and Pi(b) agree modulo E×. For d=1, q=2 and ||y||=1/2, the divisor of Pi(b) has one point at each radius 2^(−2^n), n in ℤ, and its weighted degree on the fundamental annulus (1/4,1/2] is 1; Pi_plus(b) alone has the same degree there but no zero of radius above 1/2.

*Needs:* §6.4; §6.5; §6.3.

### 6.7 Factoriality of the homogeneous monoid

Assume F algebraically closed. In the imported P=⊕_(d≥0) B^(φ=π^d), every nonzero positive-degree homogeneous element is a product of d degree-one elements, uniquely up to E-units and permutation of the associated point-orbits. Thus the multiplicative monoid of nonzero homogeneous elements modulo E× is free on P_1 ∖ {0} modulo E×. This does not assert that the whole ungraded ring P is a UFD.

One proof route uses the following steps. Use a primitive factor at a zero and the orbit-product construction to divide off a degree-one eigenvector. Induct on the weighted degree; a residual zero-free eigenvector has degree zero and belongs to E×. Uniqueness follows from equality of local orders and the fixed-field unit calculation. First construct the full orbit products in §6.6, then use them to factor a homogeneous eigenvector.

(FF17, Theorem 6.2.1, p. 245.)

**Checks.**

- The free object is a commutative monoid, not a group, and the theorem is restricted to homogeneous elements.
- A degree-two homogeneous element has two degree-one factors, with multiplicities (2) or (1,1). The degree-zero class is the empty product; no factorization assertion about an inhomogeneous sum follows.

*Needs:* §6.6; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Rank-one Frobenius twists and Homogeneous section ring.

### 6.8 Divisors of homogeneous eigenvectors

For nonzero x in P_d the zero divisor is φ-invariant, descends to an effective orbit divisor, and has weighted degree d. The map from nonzero homogeneous elements modulo E× to effective orbit divisors is injective for every F. It is surjective when F is algebraically closed. For a general perfect F its possible failure of surjectivity is measured later by the degree-zero character class, not erased by extending scalars.

One proof route uses the following steps. Apply the Newton scaling v_r(φ x)=qv_(r/q)(x) and the eigen-equation to compute the fundamental-annulus degree by the endpoint derivative difference. Equal divisors give a zero-free quotient in (Bᵇ)×; its eigen-equation forces equal degrees and then an E-scalar. For geometric surjectivity multiply the full-orbit products of primitive equations constructed below.

(FF17, Proposition 6.2.6, pp. 246–247; Theorem 6.2.7, p. 247.)

**Checks.**

- Frobenius rescales the vertical Newton coordinate by q as well as rescaling its slope parameter.
- A section in P₂ has orbit divisor of weighted degree 2. The quotient of equal-degree sections with identical divisors has divisor 0 and is an E× scalar.

*Needs:* §6.3; §6.6; §5.7.

### 6.9 Orbit products and Lubin–Tate logarithms

For the Lubin–Tate primitive equation u_ε=Q([ε^(1/q)]_Q)/[ε^(1/q)]_Q, its full orbit product agrees up to E× with log_LT([ε]_Q). The logarithm is the limit of π^(-n)[π^n]_LT on the open unit disc. Its product expansion is grouped by finite torsion levels; no unconditional ordering of individual torsion factors is asserted. In equal characteristic the logarithm and this identity require the all-local-field extension supplied by the all-local-field Lubin–Tate contract.

One proof route uses the following steps. Use the imported formal and analytic logarithm in characteristic zero. Telescope the finite product of Q-iterates, then take the normalized-iterate limit on each compact subdisc. The compatible root [ε^(1/q)]_Q gives the negative-half difference-equation solution. Compare the full product through the eigen-equation and divisor; retain only the scalar-independent normalization, avoiding a spurious extra π factor.

(FF17, Proposition 6.3.1, pp. 251–252; Remark 6.3.2, p. 252; comparison of Pi and the logarithm, p. 253.)

**Checks.**

- The logarithm normalization π^(−n)[π^n]_LT has derivative 1. Without π^(−n) its derivative tends to 0, so the limit cannot be the normalized logarithm.

*Needs:* §6.6; §2.10; TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts §LT.0, Analytic logarithm; TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts §LT.1, Lubin–Tate formal module.

### 6.10 Fundamental exact sequence with finite jets

Extend the supplied degree-one untilt sequence to strict Banach sequences for finite orbit-separated point lists with repeated jets. Assume F algebraically closed. Let y_1,...,y_d be degree-one points such that two points on the same Frobenius orbit are equal, allowing repetitions. Choose nonzero t_i in P_1 whose divisor is the Frobenius orbit of y_i. Evaluation gives a strict exact sequence of Banach E-spaces 0 → E ∏_i t_i → P_d → B/(∏_i m_(y_i)) → 0. For E=ℚ_p and one point repeated d times, this is 0 → ℚ_p t^d → B^(φ=p^d) → B_dR^+/Fil^d → 0.

One proof route uses the following steps. Read the kernel using the orbit-divisor injection; its quotient by the product t_i has degree zero. For one point and d=1 use the supplied untilt sheaf sequence, its universal-cover evaluation and twist cohomology, identifying the map with the Lubin–Tate logarithm. Induct on the jet order by multiplication by t_i, and combine distinct points by the Chinese remainder theorem. Banach openness makes the resulting algebraic surjection strict.

(FF17, Theorem 6.4.1, pp. 253–254; Example 6.4.2, p. 254.)

**Checks.**

- The orbit separation hypothesis is checked before evaluation; repeated points mean higher de Rham jets, not multiple independent copies of the residue field.
- For d=0 the quotient by the empty product ideal is 0 and the sequence is 0→E→E→0. For a point repeated twice the target is B_dR⁺/(ξ²), of length 2, rather than K_y×K_y.

*Needs:* §6.8; §6.9; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 5, Lubin–Tate universal cover and sections of O(1) and The fundamental untilt sequence and degree-one divisors; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Slope-sensitive cohomology of standard bundles; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Completed local period rings.

### 6.11 Graded fibres and backward-orbit interpolation

Assume F algebraically closed. Let t be a nonzero element of P_1 and y a degree-one point with div(t)=Σ_(n∈ℤ)[φ^n(y)]. Then x↦θ_y(x)T^m in degree m induces an isomorphism of graded algebras from P/tP to {f in K_y[T]:f(0) in E}. The case t=0 is excluded: then P/tP=P, whereas the degree-one kernel of evaluation at y is the nonzero line E·s_y of a section s_y with divisor the orbit of y. Let y_1,...,y_d be degree-one points, with repetitions allowed and y_i in φ^Z y_j implying y_i=y_j; choose primitive generators a_i in M_1. Set g=φ(∏_i Pi_minus(a_i)), where the representatives are normalized by Pi_minus(a_i)∈A∖πA. Then g belongs to A, v_π(g)=0 and v_0(g)=0. The ideal {x in A:φ^n(x) belongs to ∏_i p_(y_i) for every n≥0} is gA. After extension to B the analogous evaluation ideal is gB. The Frobenius shift supplies the n=0 zeros. Without orbit separation the required divisor is the pointwise supremum of the backward translates, not their sum.

One proof route uses the following steps. Apply the fundamental sequence degree by degree, with evaluation of the degree-one variable, and check multiplication to identify the graded fibre. The conditions on φ^n(x) give the backward divisor including n=0; orbit separation identifies its sum with div(g). The divisor criterion first proves x/g belongs to B. For x in A the quotient has no poles near radius zero, where g extends and is invertible, so the boundary-zero extension criterion puts x/g in the ring with a lower-bounded π expansion. Since v_π(g)=0 and v_π(x)≥0, this quotient has v_π≥0. The primitive normalization gives v_0(g)=0. Taking the radius-one limit of multiplicative norms with |x|_1≤1 gives |x/g|_1≤1, so all coefficients of the quotient lie in O_F; hence x/g is in A. Conversely g and all its forward transforms satisfy the required ideal conditions. For overlapping backward tails compute a pointwise supremum. The pair y_2=φ^(-1)y_1 detects the duplicated-multiplicity error.

(FF17, Corollary 6.4.3 and Theorem 6.4.4, p. 254.)

**Checks.**

- Retain the integral ideal in A from Theorem 6.4.4 as well as its B extension. Check the shift, the orbit condition and both integrality boundaries of x/g; a B-divisor argument alone does not prove the A assertion.
- For one point, div(Π₋) has translates n<0 and div(φΠ₋) has n≤0. For neighboring orbit representatives, an overlap coefficient is max(1,1)=1, whereas summing tails gives 2.
- With t=s_y the degree-one quotient is P₁/E·s_y, which §6.10 with d=1 identifies with K_y, the constant terms of the target being 0 in degree one. The input t=0 fails the hypothesis: P/0P=P, and over K_y with c=√π∉E, the target has the two inequivalent degree-one factorizations (cT)²=T·(πT), so it cannot be isomorphic to P, whose homogeneous monoid is factorial by §6.7.
- Replacing a normalized Pi_minus(a_i) by π·Pi_minus(a_i) gives an element of πA, which the normalization rejects; it would multiply g by π and break v_π(g)=0.

*Needs:* §6.10; §6.5; §5.2; §1.2; §1.5.

### Examples

For one point, div(Π₋) has translates n<0 and div(φΠ₋) has n≤0. For neighboring orbit representatives, an overlap coefficient is max(1,1)=1, whereas summing tails gives 2.

### Dependencies

Earlier layers: 0, 1, 2, 3, 4, 5. Suppliers: TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 7: Dedekind charts and the weighted schematic curve

Descend de Rham jets and positive sections to the general-field chart, then identify its class group and the weighted curve.

### 7.1 Geometric Be chart and degree

On the supplied geometric affine chart Be_t=(B[1/t])^(φ=1), for algebraically closed F and nonzero t∈P₁, refine the pole-order calculation ν(f)=−ord_∞(f). It is nonnegative on nonzero chart functions, additive on products, and zero exactly on E×. For a,b∈Be_t with b≠0 prove weak almost-Euclidean division: a=bq+r with r=0 or ν(r)≤ν(b). This is a function-theoretic refinement of the supplied PID chart; the weak inequality is not a Euclidean-domain criterion.

One proof route uses the following steps. Use the supplied chart identification and weighted product formula for pole degree. Interpolate the finite zero divisor of b by a positive section, obtaining a correction with only the chosen pole and remainder of pole order at most ν(b).

(FF17, Theorem 6.5.2, pp. 255–256; §5.1, pp. 202–203; Préface §1.1–1.2, note 8, p. 3.)

**Checks.**

- Be means invariant functions after inverting t; it is not Frac(B)^(φ=1). A nonnegative additive pole degree that vanishes exactly on units supplies the additional hypothesis for the minimum-degree principality argument.
- For a,b of pole orders 2 and 3, ν(ab)=5; a nonzero constant has ν=0. The weak remainder bound ν(r)≤3 permits equality 3, so it cannot establish strict Euclidean descent.

*Needs:* §6.7; §6.10; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Regular noetherian geometric curve and PID complements; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Classical points and annular Dedekind rings; `IsBezout`; `IsBezout.TFAE`.

### 7.2 Continuous descent of de Rham jets

Let C be the completed algebraic closure of F and z a finite-orbit point above y with stabilizer G_L, identified by tilting with the absolute Galois group of K_y. The invariant ring (B_dR,z⁺)^(G_L) is B_dR,y⁺, and likewise for its finite jets. A finite-length B_dR,z⁺-module with continuous semilinear action has H^1_cont=0. Scalar extension gives an equivalence from finitely generated B_dR,y⁺-modules to finitely generated B_dR,z⁺-modules with semilinear G_L-action continuous on every finite jet; the inverse is fixed vectors. No higher-cohomology assertion is included. The perfectoid Tate–Sen estimates needed for effectivity use the quantitative cochain contract.

The complete-module part includes norm-controlled descent of presentations through all finite jets; this effectivity is a theorem here using the quantitative field cochain contract, not a consequence of scalar invariants.

One proof route uses the following steps. For n=1 use the marked-untilt field correspondence and the almost trace estimates after tilting. Obtain quantitative cochain corrections for the finite-dimensional semilinear residue modules, not just the scalar invariant-field equality. Induct through the finite filtration using its residue-field graded pieces, control continuity of the lifts, and identify the completed local comparison. A fully faithful scalar-extension functor alone does not prove this effectivity step. For a finitely generated module, descend its torsion and free pieces through all finite jets, prove compatibility of the descended presentations, and pass to the complete inverse limit with norm-controlled lifts. This extra inverse-limit effectivity is included in the quantitative cochain contract.

(FF17, Proposition 7.1.1 and preceding topology conventions, p. 262.)

**Checks.**

- For jet order 0 the module is 0. For B_dR⁺/(ξ²), the ξ-adic filtration has two residue-field graded pieces; descending only the first loses length 1.

*Needs:* §4.4; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Completed local period rings; TauCetiRoadmap.PerfectoidSpaces Layer P3.

### 7.3 Galois cohomology of positive eigenvectors

For d≥1 and a finite-dimensional continuous E-representation V of G_F, H^1_cont(G_F,P_(C,d) ⊗_E V)=0. If V is nonzero, its H^0 is nonzero. Both statements are compatible with the Banach topologies and finite scalar extension. The assertion of a nonzero H^0 explicitly excludes V=0.

One proof route uses the following steps. Choose a G_F-stable O_E-lattice in V and use the small-ball filtration of the Lubin–Tate parametrization for d=1. Identify the successive quotients with m_C,ρ tensor the residue lattice, and apply quantitative almost trace cohomology. Correct the cochains with shrinking errors and use completeness. Deduce d>1 through the fundamental exact sequences and jet descent; prove nonzero invariants by lifting a nonzero invariant in the first nonzero small quotient.

(FF17, Proposition 7.1.2 and proof, pp. 262–264.)

**Checks.**

- Continuous cohomology uses the Banach module topology. The arbitrary perfectoid-untilt estimates remain explicit in the quantitative cochain contract.
- For V=0, H⁰=H¹=0, so nonzero H⁰ requires V≠0. The trivial one-dimensional representation in positive degree has a nonzero section.

*Needs:* §7.2; §6.10; §2.11; §4.1.

### 7.4 Dedekind Be over a perfect field

For any perfect F and nonzero t in P_(F,1), Be_F=(B_F[1/t])^(φ=1) is a Dedekind domain with units E×. Its maximal ideals correspond to classical Frobenius orbits outside div(t). If f is nonzero then Be_F/(f) is the finite product, over the zeros of f off t, of B_dR,y⁺/Fil^(ord_y f); in particular each completed maximal localization is B_dR,y⁺.

One proof route uses the following steps. Over C the chart is a PID. Descend its quotient by f using H^1-vanishing of the filtered union t^(-k)P_(C,k). Group geometric zeros into induced Galois modules using finite-orbit cosets and apply jet descent to each factor. Use the resulting finite-product DVR-quotient characterization of a Dedekind domain, then recover maximal ideals and completions from these quotients. The no-zero eigenvector calculation gives units E×.

(FF17, Propositions 7.2.1 and 7.2.3 and Lemma 7.2.2, pp. 264–265.)

**Checks.**

- Dedekind replaces PID over general F; the quotient factors include higher jets and primitive-degree residue extensions.
- For f with zero orders 1 and 2 the quotient factors are K_(y₁) and B_dR,y₂⁺/(ξ²), of lengths 1 and 2; replacing the second by its residue field loses one jet.

*Needs:* §7.1; §7.3; §7.2; §5.8.

### 7.5 Ideal classes and continuous characters

For the general-field chart Be_F, Cl(Be_F) is canonically isomorphic to Hom_cont(G_F,E×). A nonzero ideal becomes principal over Be_C; if I Be_C=(f), the associated character is sigma(f)/f. This convention fixes the inverse in the construction back from a twisted invariant section. In particular the general chart need not be principal.

One proof route uses the following steps. Independence of the generator follows from Be_C×=E×. Locate f in a Banach degree filtration to prove continuity. Use invariant holomorphic functions and the local-ideal comparison to show an ideal is recovered from its geometric extension, proving injectivity. For a character choose nonzero sections for both the character and its inverse using positive eigenvector cohomology; their product supplies a nonzero invariant ideal. Verify its geometric extension and character.

(FF17, Proposition 7.2.4, pp. 265–266.)

**Checks.**

- Both twists are needed to show the invariant ideal is nonzero; continuity of the character is part of the conclusion.
- If σ(f)=χ(σ)f then σ(fg)/(fg)=χ(σ)ψ(σ) for σ(g)=ψ(σ)g. The trivial ideal has character 1. Tensoring with the inverse twist gives χχ⁻¹=1.

*Needs:* §7.4; §7.3.

### 7.6 Generation of P by degree one

For every perfect F the E-algebra P_F is generated by P_(F,1): Sym^d_E(P_(F,1)) → P_(F,d) is surjective for every d≥0. Thus each homogeneous section is a finite sum of products of degree-one sections. It need not itself be a single product when F is not algebraically closed.

Prove this over equal-characteristic E as well: use a separable Eisenstein quadratic extension even at p=2 and construct the required uniformizer unit twist over the stated constants before descending the two-section argument.

One proof route uses the following steps. Choose two degree-one sections with disjoint orbit divisors, and use their Koszul sequence over the geometric curve. Twist by a positive power, apply geometric H^1-vanishing, then descend surjectivity using positive-eigenvector Galois cohomology. This handles degrees above the initial quadratic step. For the quadratic step use a separable totally ramified quadratic coefficient extension, its two-Veronese comparison and faithful scalar descent. In equal characteristic 2 use an Eisenstein polynomial with nonzero derivative, for example X^2+π X+π, and the uniformizer unit twist, rather than adjoining a purely inseparable square root.

(FF17, Proposition 7.3.1 and Remark 7.3.2, pp. 266–267.)

**Checks.**

- Generation means a sum of products. The equal-characteristic proof retains a separable quadratic extension.
- The degree-zero symmetric power is E and maps identically to P₀. In characteristic 2, X²+πX+π has derivative π≠0 and is Eisenstein, whereas X²−π has derivative 0.

*Needs:* §7.3; §6.2; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Slope-sensitive cohomology of standard bundles.

### 7.7 The schematic curve over general F

The imported X_(F,E)=Proj(P_F) is a regular noetherian integral scheme of dimension one. Its closed points are |Y_F|/φ^Z, the completed local ring at [y] is B_dR,y⁺, and the weight deg([y])=deg(y) gives Σ_x deg(x)ord_x(f)=0 for nonzero rational f and H^0(X,O_X)=E. This is completeness in the weighted-curve sense of Definition 5.1.3; no finite-type properness over E is asserted.

One proof route uses the following steps. Degree-one generation covers Proj by the Dedekind charts Be_t. Compare their localizations on overlaps through the common invariant meromorphic field. Identify their maximal ideals and completions with the orbit-point and jet descriptions. Use the homogeneous quotient degree formula for rational functions to obtain the weighted product formula; a regular global function has no poles and is a constant by the eigenvector unit calculation.

(FF17, Theorem 7.3.3, pp. 267–268; Definition 5.1.3, p. 203.)

**Checks.**

- The conclusion is a regular noetherian curve, with a specified weighted degree convention, rather than a finite-type E-curve.
- For a quotient s/t of degree-one sections the weighted degrees of zeros and poles are 1 and 1, giving 1−1=0. A nonzero constant has every order 0 and total degree 0.

*Needs:* §7.4; §7.6; §6.8; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Rank-one Frobenius twists and Homogeneous section ring.

### Examples

The degree-zero symmetric power is E and maps identically to P₀. In characteristic 2, X²+πX+π has derivative π≠0 and is Eisenstein, whereas X²−π has derivative 0.

### Dependencies

Earlier layers: 2, 4, 5, 6. Suppliers: TauCetiRoadmap.PerfectoidSpaces, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 8: Interval sheaves, coherent systems and gluing

Build the interval topology and general Fréchet–Stein system interface, then prove uniform generation, gluing and the interval section equivalence.

### 8.1 The period interval site

Objects are nonempty intervals I in [0,1], with inclusion morphisms. A family (I_alpha) of subintervals is admissible if, for each compact subinterval K of I, there are finitely many compact subintervals K_j of K whose union is K and each K_j is contained in some I_alpha. This finite compact-refinement condition implies union_alpha I_alpha=I. Restriction sends I to B_I. Bundle and coherent-module categories are confined to intervals avoiding 1; the ring site includes both endpoints. Merely requiring finitely many original cover members over K gives an incorrect topology.

One proof route uses the following steps. Omit empty intersections. Pull a finite compact refinement back by intersecting with a compact test interval. For composition, refine each compact piece by the finite compact refinements furnished by its member cover. These operations prove the pretopology axioms. Use the imported faithful restrictions to form the contravariant ring functor. Separate the topology of the whole interval site from the subsite [0,1) supporting noetherian annular algebra.

(FF17, Remark 11.2.8, p. 371; Definitions 11.2.1 and 11.2.4, pp. 369–370.)

**API.**

- Every interval inclusion gives the compatible ring restriction.
- Refining each member of an admissible cover by an admissible cover again covers.
- Admissibility is exactly the existence of a finite compact refinement subordinate to the family on every compact test interval.
- Intervals avoiding 1 form the full subsite used for coherent objects.

**Checks.**

- The one-member family {I} covers I.
- A nested compact exhaustion of an open interval is an admissible cover.
- The family of all singleton subintervals of [a,b], a<b, has union [a,b] but is not admissible.
- For a<c<b, the family {[a,c),[c,b]} has a finite set-theoretic subcover but is not admissible: no finite compact refinement covers [a,c) up to c without a member crossing c. Otherwise the ring sheaf would force the domain B_[a,b] to be a product of two nonzero rings.
- Finite compact refinements give pullback and composition, admit closed overlapping chains and compact exhaustions, and reject the disjoint adjacent half-open cover. A finite subcover by the original intervals alone does not imply the ring sheaf condition.
- The two disjoint intervals [0,1/2) and [1/2,1] cover the set but admit no finite compact refinement of [0,1]. A closed overlapping chain [0,2/3],[1/3,1] does and has overlap [1/3,2/3].

*Needs:* §0.6.

### 8.2 Additive endpoint splitting

For any interval I in [0,1], let I_plus be the convex hull of I union {1} and I_minus the convex hull of I union {0}. Inside B_I, B_I=B_(I_plus)+B_(I_minus). A convergent expansion f=Σ_k f_k into Laurent approximants f_k in Bᵇ can be split by nonnegative and negative π-indices, f_k=f_k⁺+f_k⁻: the negative-index pieces sum in B_(I_plus); the nonnegative-index pieces sum in B_J for every compact J⊆I_minus∖{0}, with norms bounded uniformly near radius 0, and their limit extends uniquely across radius 0 to an element of B_(I_minus). The series Σ_k f_k⁺ itself need not converge in the radius-zero norm q^(−v_π). This is a decomposition, not a claim of unique Teichmüller expansions for every completed element. The trivial cases 0∈I or 1∈I are included.

One proof route uses the following steps. Write an element as a convergent sum of dense Laurent approximants with geometrically shrinking errors. For each approximant split its finite/lower-bounded index expansion and apply the Gauss monotonicity separately. The nonnegative-index norm is nondecreasing in ρ; the negative-index norm is nonincreasing. These bounds give convergence of Σf_k⁻ on I_plus and of Σf_k⁺ on every compact subinterval of I_minus∖{0}, with |Σf_k⁺|_ρ≤sup_k|f_k|_(sup I) for 0<ρ≤sup I. Apply the boundedness criterion of §1.2 (with N=0) to extend the latter limit across radius 0; do not sum the positive pieces in the radius-zero topology, where the radius-zero norm ignores the size of the Teichmüller coefficients. FF17 Lemma 11.2.6 sums them there; this route avoids that step.

(FF17, Lemma 11.2.6, pp. 370–371.)

**Checks.**

- The superscripts plus/minus on index pieces have the opposite assignments from I_plus/I_minus; the endpoint test on π and π^-1 determines them.
- At ρ=1/4 and 1/2 the norms of π are 1/4 and 1/2, and those of π⁻¹ are 4 and 2. The positive-index part extends towards 0 and the negative-index part towards 1.
- Take E=𝔽₂((π)), I={1/2}, |a|=1/2 and f_k=a^k for k≥1. Then |f_k|_(1/2)=2^(−k)→0 and f_k=f_k⁺, but every f_k has radius-zero norm q^0=1, so the partial sums of Σf_k⁺ are not Cauchy in B_[0,1/2]. Their limit at positive radii is the constant a/(1−a)∈O_F, which does lie in B_[0,1/2]. A route asserting radius-zero convergence of the positive pieces fails on this family.

*Needs:* §0.6; §1.1; §1.2.

### 8.3 Mayer–Vietoris and acyclicity on intervals

For intervals I,J in [0,1] with nonempty intersection, 0 → B_(I union J) → B_I ⊕ B_J → B_(I intersect J) → 0 is exact, with last map (f,g) ↦ f-g. Equivalently inside the intersection ring, B_(I union J)=B_I intersect B_J and B_(I intersect J)=B_I+B_J. The interval ring functor is a sheaf on the admissible site and H^1(I,O)=0.

One proof route uses the following steps. Use endpoint splitting for additive surjectivity. Use the explicit boundary-extension criteria to identify the intersection as the ring on the union, rather than inferring it just from injectivity. Use the admissible finite compact refinements, order their endpoints and refine further to closed chains with nonempty adjacent overlaps. Induct by the two-interval exact sequence on each compact test interval. Dense complete restrictions remove the inverse-limit obstruction along an exhaustion, giving sheaf descent and H^1=0 on the stated site.

(FF17, Proposition 11.2.7 and Remark 11.2.8, p. 371.)

**Checks.**

- The equality of intersections takes place inside B_(I intersect J); arbitrary set-theoretic intersections of abstract rings are not intended.
- The difference map sends (1,2) to −1, and its kernel consists of (f,f). For I=J the sequence has diagonal kernel B_I and surjective difference onto B_I.

*Needs:* §8.2; §8.1; §1.2.

### 8.4 Period functions as a Frechet–Stein algebra

Construct the general Fréchet–Stein and coadmissible-system interface over any complete nontrivially valued nonarchimedean field K; its distribution-algebra specialization D(H,L), for compact H over a discretely valued L, is PadicLocalLanglandsForGL2Qp §0.1 and is not restated. A defining increasing sequence of submultiplicative seminorms has left-noetherian Banach completions A_n and right-flat dense transition maps A_(n+1)→A_n. A coherent system consists of finite left A_n-modules M_n with A_n⊗_(A_(n+1))M_(n+1)≅M_n and the cocycle laws; a coadmissible module is their inverse limit. Prove independence of a cofinal presentation, the abelian category, exact global sections, dense projections, and A_n⊗_AΓ(M)≅M_n. Apply this to B_I for every nonempty I⊆[0,1), using compact fields or PIDs and normalized endpoint norms. The commutative annular specialization keeps ordinary scalar extension, not a completed tensor product of arbitrary algebraic modules.

**API.**

- A cofinal subsequence yields the same topological algebra and equivalent coherent systems.
- Global sections and Banach-stage scalar extension are inverse on coherent systems and coadmissible modules.
- Kernels and cokernels remain coherent, and global sections preserves short exact sequences.
- Images of sections in a Banach stage are dense, while finite algebraic base change recovers the whole stage module.

**Checks.**

- For A_n=K and M_n=K² with identity transitions, the limits are K and K² and stage base change is identity.
- For A_n=K and M_n=0, all kernels, cokernels and sections are 0.
- The quotient K[ε]/(ε²)→K is not flat, so noetherian Banach stages without flat transitions do not define this structure.

One proof route uses the following steps. Prove the general system theorem by canonical Banach quotient topologies and complete dense inverse-limit correction, with right-flat transitions making kernels coherent. Use the compact field/PID dichotomy, torsion-free restriction and the common dense ring to verify the annular hypotheses. No assertion that every coadmissible module is finitely generated is made.

(FF17, §11.2.1, pp. 369–370; ST02, §3, definition and Theorems A/B, pp. 7–9; Corollaries 3.1–3.5, pp. 9–11; Lemma 3.6, p. 11.)

**Checks.**

- The defining Banach algebras have the usual local-field scalar topology because 1 is excluded.
- A constant Banach field system A_n=K gives A=K and Γ(K^d)=K^d, including d=0. A transition K[ε]/(ε²)→K is not flat: its length is 1, not a multiple of 2.

*Needs:* §5.1; §0.6; TauCetiRoadmap.LocallyAnalyticDistributions §0.0; Mathlib noetherian-ring and module flatness vocabulary.

### 8.5 Bundles and coherent systems on intervals

For I ⊆ [0,1), define Fib(Y_I) as the 2-limit over compact nonempty J ⊆ I of finite projective B_J-modules, and Coh(Y_I) as the corresponding 2-limit of finitely generated B_J-modules. Each object includes isomorphisms M_J tensor_(B_J) B_K ≅ M_K for K ⊆ J, satisfying the identity and triple-inclusion cocycle conditions; morphisms commute with these isomorphisms. The categories of modules at a fixed ring use the supplied generic finite-projective and coherent-module infrastructure.

One proof route uses the following steps. Form compatible systems in the imported module categories; the compact PID/field theorem makes each bundle system finite free at a compact stage. Define restriction by retaining the smaller compact intervals and identify cofinal compact exhaustions. The identification of these systems with sheaves of O-modules is a consequence of the gluing theorem of §8.9 and is stated there.

(FF17, Definitions 11.2.1 and 11.2.4, pp. 369–370; Remarks 11.2.13–11.2.14, p. 374.)

**API.**

- A system evaluates at each compact J with its specified module category.
- Every inclusion K ⊆ J supplies an isomorphism after scalar extension.
- Passing to a nested cofinal compact exhaustion gives equivalent categories.
- Interval restriction preserves all transition isomorphisms and tensor operations on bundles.

**Checks.**

- The constant system B_J^n with its canonical transitions is a rank-n bundle.
- The zero system is the zero object of both categories.
- A nested system with changing positive rank cannot have the required base-change isomorphisms.
- The transition maps are base-change isomorphisms with a cocycle; an arbitrary inverse system of modules is not a bundle.
- The rank-two trivial system has transitions B_K⊗_(B_J)B_J²≅B_K² and triple composite equal to the direct restriction. A transition from rank 1 to rank 2 cannot be an isomorphism.

*Needs:* §8.1; §8.4.

### 8.6 Global sections of interval bundles

For I ⊆ [0,1), Gamma: Fib(Y_I) → finite-projective B_I-modules is an exact tensor equivalence, with inverse M ↦ (M tensor_(B_I) B_J)_J. It commutes with restriction to compact intervals. For I=(0,ρ], all these modules are finite free. This theorem identifies arbitrary compatible compact systems with global finite-projective modules; an affine-scheme comparison alone does not supply this interval statement.

For a compatible compact finite-free system of bounded rank, construct a single finite family of global sections generating every compact restriction, with uniform approximation bounds. Exact global sections on coherent Hom systems then lifts the identity to a splitting of the finite-free presentation; this proves projectivity without identifying all maximal ideals with classical compact points.

One proof route uses the following steps. Apply the imported Fréchet–Stein exactness and base-change theorem to the compatible compact bundle system. Prove uniform generation: produce one finite family of compatible global sections generating on every compact annulus, with bounded approximation estimates. This gives a surjection O^n→E of coherent systems and a kernel bundle K. Because E_J is finite free on every compact J, Hom(E_J,O_J^n)→Hom(E_J,E_J) is surjective. Apply exact global sections to these coherent Hom systems and lift id_E to a global splitting E→O^n. The resulting finite B_I-module is a direct summand of B_I^n, hence finite projective. This avoids any false assertion that classical compact points cover every maximal ideal of B_I. Use base change and exactness to prove the mutually inverse tensor functors. For I=(0,ρ], finite projectives over the Bézout domain are free. The splitting also gives a finitely generated kernel; it is not an independent consequence of bounded coadmissible rank.

(FF17, Propositions 11.2.2–11.2.3, pp. 369–370.)

**Checks.**

- A compatible zero-rank system has sections 0. For a trivial rank-two system, sections are B_I² and scalar extension is B_J²; the identity matrix lifts the splitting.
- On I=(0,ρ] let D be an effective divisor whose points have radii tending to 0. The rank-one system (a_D B_J)_J has compact generators, the finite primitive products of D restricted to J, which change with J; its global sections a_D are free of rank one by §§5.3–5.4, generated by a Weierstrass product. No finite product of primitive factors generates every compact restriction, so the global generator is not one of the compact ones.

*Needs:* §8.5; §8.4; §5.4.

### 8.7 Coherent systems and bounded fibres

For I ⊆ [0,1), Gamma identifies Coh(Y_I) with the coadmissible B_I-modules. Such a module is noncanonically M ⊕ ∏_(y in Y_I) N_y, where M is finite projective, N_y is a finitely generated torsion B_dR,y⁺-module, and the nonzero N_y have locally finite support on compact annuli. It is finitely presented over B_I if and only if the dimensions of all fibres over k(y) are uniformly bounded. The lengths of the torsion modules themselves need not be bounded.

One proof route uses the following steps. Use the imported coadmissible equivalence for the first assertion. At each compact PID split off its finite torsion submodule, identify the torsion through the local DVR jets, and pass to the locally finite product. Lift the projective quotient using exact global sections and the bundle equivalence; choose a splitting to obtain the noncanonical direct sum. Finite presentation bounds all fibre dimensions. Conversely a uniform bound supplies uniformly bounded compact presentations; use the generator approximation obligation and coherent exactness to obtain a global finite presentation.

(FF17, Proposition 11.2.5, p. 370.)

**Checks.**

- The bound is on fibre dimension, not torsion length. A cyclic jet B_dR,y⁺/(xi_y^n) has fibre dimension one for every n.
- A cyclic jet O_y/(ξ^n) has fibre dimension 1 for every n≥1, while its length is n. Jets of lengths 1,2,3,… at escaping points pass the fibre bound; multiplicities O_y/(ξ)^(⊕n) do not.

*Needs:* §8.6; §8.4; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Completed local period rings.

### 8.8 Matrix factorization with a surjective tangent map

For Banach E-algebras B_1,B_2 mapping to A and Z in GL_n(A), assume the bounded linear map (U,V) ↦ U+ZVZ^-1 from M_n(B_1) ⊕ M_n(B_2) to M_n(A) is surjective. Then a neighborhood of 1 in GL_n(A) is contained in {X Z Y Z^-1:X in GL_n(B_1),Y in GL_n(B_2)}. Additive surjectivity B_1+B_2=A alone is not the tangent hypothesis for arbitrary Z. The neighborhood may depend on Z.

One proof route uses the following steps. Use the Banach open mapping theorem in the Mathlib contract to choose a bounded, possibly nonlinear, right inverse of the tangent map. Apply Newton corrections to the analytic polynomial multiplication map (1+U)Z(1+V)Z^-1; a quadratic remainder estimate and the bounded lift force geometric error decay. Use complete Banach balls small enough that both factors are invertible. This proof avoids characteristic-zero exponential/logarithm restrictions and does not require a continuous linear section.

(FF17, Lemmas 11.2.10–11.2.11, pp. 372–373.)

**Checks.**

- The hypothesis is surjectivity of the conjugated tangent map. The theorem supplies no uniform neighborhood for a varying Z; the matrix-independent radius used in §8.9 comes from AdicSpacesPartIII §R3.2 instead.
- For Z=diag(T,T⁻¹), conjugation sends the lower-left matrix unit E₂₁ to T⁻²E₂₁. Expanding the product gives 1+U+ZVZ⁻¹+UZVZ⁻¹, so an unconjugated tangent misses this exponent shift.

*Needs:* `ContinuousLinearMap.isOpenMap`; `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective`; `ApproximatesLinearOn.image_mem_nhds`.

### 8.9 Effective interval gluing of bundles and coherent systems

For I₁,I₂⊆[0,1) with nonempty overlap, identify interval bundles on their union with triples of bundles on the two intervals and an overlap isomorphism. Prove the same for coherent systems. For compact I₁,I₂ prove that B_(I₁∪I₂)→B_(I₁),B_(I₂)→B_(I₁∩I₂) is a glueing square of complete Hausdorff Tate rings in the sense of AdicSpacesPartIII §R3.2: the difference sequence 0→B_(I₁∪I₂)→B_(I₁)×B_(I₂)→B_(I₁∩I₂)→0 is strictly exact, B_(I₂)→B_(I₁∩I₂) has dense image, and every maximal ideal of B_(I₁∪I₂) is the contraction of a prime of B_(I₁)×B_(I₂). Module surjectivity and finite-projective descent are then the supplied *glueing-square-finite-surjectivity* and *glueing-square-finite-projective-descent*; their matrix step is *matrix-factorisation-strict-surjection*, whose radius depends only on the strict surjection and not on the matrix being factored. As a corollary, for I ⊆ [0,1) the categories Fib(Y_I) and Coh(Y_I) of §8.5 are equivalent to the categories of locally free, respectively coherent, O-modules on the period interval subsite of §8.1 over I, by the interval sheaf property of §8.3 and this gluing theorem.

One proof route uses the following steps. Reduce to compact intervals; π is a topologically nilpotent unit of each B_J, so these are Tate rings. Exactness is the compact Mayer–Vietoris sequence of §8.3; strictness follows from `ContinuousLinearMap.isOpenMap` for these Banach E-spaces with normalized norms, which avoid radius 1, and density follows from density of Bᵇ. For maximal-spectrum coverage use §5.1: if B_(I₁∪I₂) is a PID its maximal ideals are the m_y, and y lies over I₁ or I₂, where the kernel of θ_y is a prime contracting to m_y; if it is a field, as for I₁=I₂ an irrational singleton, its zero ideal is the contraction of the zero prime of B_(I₁). Apply the supplied glueing theorems; extend to coherent systems through compact PID presentations and to general intervals by compact limits.

(FF17, Proposition 11.2.12 and Remarks 11.2.13–11.2.14, pp. 373–374.)

**Checks.**

- The overlap comparison has target E_2 restricted to the intersection. The factorization radius used is the constant c of the strict surjection B_(I₁)⊕B_(I₂)→B_(I₁∩I₂), fixed before any matrix is approximated; the Z-dependent neighborhood of §8.8 alone would leave the approximation error unbounded.
- For identity overlap matrix in rank 2, the descended module is B_(I₁∪I₂)². In rank 0 it is 0.
- For the irrational singleton I₁=I₂={ρ}, ρ outside the divisible hull of |F×|, the square has B_(I₁∪I₂)=B_({ρ}) a field with Spm={(0)}; coverage holds through the zero prime, although no classical point exists. A coverage argument by classical points alone would fail here.

*Needs:* §8.1; §8.3; §8.5; §5.1; §0.6; `ContinuousLinearMap.isOpenMap`; TauCetiRoadmap.AdicSpacesPartIII §R3.2, *glueing-square*, *matrix-factorisation-strict-surjection*, *glueing-square-finite-surjectivity* and *glueing-square-finite-projective-descent*.

### 8.10 Closed submodules on a half-open annulus

For R=B_(F,(0,ρ]), 0<ρ<1, and a submodule N of R^d, N is closed if and only if it is finite free; in that case its rank is at most d. This includes general perfect F, rather than only the discrete-coefficient case of RD.0 or the classical cyclotomic case in PadicHodgeTheory.

One proof route uses the following steps. For a closed submodule, extend to every compact PID annulus and use faithful restrictions to keep the generic rank bounded by d. Identify the closed module with the compatible compact system by complete approximation; apply the bundle equivalence and half-open Bézout freeness. Conversely for a finite free embedded submodule use a nonzero rank minor and the local DVR divisibility conditions to express membership as closed finite-jet and linear equalities.

(FF17, Préface Theorem 2.35, p. 26, compared with §§3.5.2 and 11.2.1, pp. 146–147 and 369–370.)

**Checks.**

- Free means finite rank here; an arbitrary infinite free module is not an asserted closed submodule of R^d.
- For d=0 the only closed submodule is 0, of rank 0. For a nonzero a∈R, aR⊂R is closed free of rank 1; the proper dense ideal of §5.5 is not finite free.

*Needs:* §8.6; §5.3.

### Examples

For Z=diag(T,T⁻¹), conjugation sends the lower-left matrix unit E₂₁ to T⁻²E₂₁. Expanding the product gives 1+U+ZVZ⁻¹+UZVZ⁻¹, so an unconjugated tangent misses this exponent shift.

### Dependencies

Earlier layers: 0, 1, 5. Suppliers: TauCetiRoadmap.AdicSpacesPartIII, TauCetiRoadmap.LocallyAnalyticDistributions, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 9: Finite extensions and continuous descent

Prove finite annular extension and effective semilinear descent in each compact norm, including arbitrary real radii.

### 9.1 Finite etale extension of compact period annuli

Let L/F be finite (hence separable, since F is perfect), and let I be a compact interval in [0,1) with endpoints in |F|∩[0,1), the endpoint 0 allowed. Then B_(L,I) is finite étale of constant degree [L:F] over B_(F,I); for a Galois extension its automorphism group is Gal(L/F). For the spectral unit balls, [ε] B_(F,I)^circ is contained in Tr_(L/F)(B_(L,I)^circ) for every nonzero ε in m_F. At I={0} this is the unramified Witt-field extension. Moreover the spectral unit-ball extension is almost finite étale for the ideal generated by [m_F] in the coefficient integral ring. Its almost finite projectivity and almost vanishing cotangent complex are proved through the same root-refined discriminant estimates; this is stronger than the displayed trace inclusion.

One proof route uses the following steps. Choose an integral primitive element alpha and b with b O_L ⊆ O_F[alpha]. Replace alpha by alpha^(1/p^k) so |b^(1/p^k)| exceeds the outer radius. Lift the basis through Witt digits and contract the residual error on the compact annulus. This yields generation over B_(F,I), with rational coefficients, not generation of the whole ring over its unit ball. Compare Galois conjugates for independence and degree. The discriminants of the root-refined bases approach norm 1 uniformly on I; the trace dual basis gives etaleness and the almost trace estimate. Use discriminant-dual finite subalgebras with annihilator losses tending to the almost ideal to obtain almost finite projectivity and almost vanishing of differentials; compare with supplied almost purity on the annular adic pair. Do not replace almost etaleness by trace-surjectivity alone.

(FF17, Proposition 11.2.15(1)–(2) and Remark 11.2.16, pp. 374–376.)

**Checks.**

- The coefficient sum in the printed proof must use B_(F,I), not only its unit ball. The strict exclusion of radius 1 is needed by the contraction.
- For L=F the rank is 1 and trace is identity. For a degree-p separable extension in characteristic p, Tr(1)=0, but the trace ideal still contains the almost ideal. At radius 0 the Witt-field extension is unramified.

*Needs:* §4.1; §0.1; §5.1; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Relative annuli and their section rings.

### 9.2 Completed algebraic-closure invariants on compact annuli

For the same compact intervals I, B_(C,I)^(G_F)=B_(F,I) as topological E-algebras, C=completion(Fbar). Restrictions to smaller such intervals commute with this equality. This extends the global invariant assertion to each compact Banach annulus, including the boundary-0 field.

One proof route uses the following steps. Use the finite-extension almost trace estimates uniformly on the compact interval. Approximate a G_F-invariant C-coefficient function by finite-extension functions and correct the invariant error by traces whose norm loss tends to 1. Take a complete Banach limit in B_(F,I), and prove the inclusion is isometric in the chosen endpoint norm. At radius 0 use the unique Witt expansion directly.

(FF17, Proposition 11.2.18, p. 376.)

**Checks.**

- This scalar invariant theorem is kept separate from the stronger effective module descent.
- At I={0}, invariance of Σ[x_n]π^n gives σ(x_n)=x_n for every n, hence x_n∈F. In particular invariant constants in C are exactly F.

*Needs:* §9.1; §5.8.

### 9.3 Effective continuous semilinear descent

For I compact in [0,1) with endpoints in |F|∩[0,1), the endpoint 0 allowed, extension of scalars gives an equivalence between finite free B_(F,I)-modules and finite free B_(C,I)-modules with continuous semilinear G_F-action; its inverse is fixed vectors and the canonical base-change map is an isomorphism. Continuity uses the Banach norm of the module. The necessary uniform matrix-cocycle corrections are the quantitative input in the quantitative cochain contract.

Establish uniform noncommutative small-cocycle correction on the root-refined annular approximation. The constants belong to the normalized compact norm and remain controlled as the finite-extension approximation improves.

One proof route uses the following steps. Full faithfulness follows from the scalar invariant theorem applied to matrix entries. For effectivity first approximate the cocycle on a sufficiently small open subgroup by finite-extension matrices. Use almost traces and a quantitative noncommutative cocycle correction to trivialize its small part with convergent norm bounds. Descend the remaining finite-level action by faithful flat finite Galois descent. Prove the descended module is finite projective and hence free over the compact PID or field. Full faithfulness alone does not construct the small-cocycle correction.

(FF17, Proposition 11.2.18, p. 376, and its stated appeal to Sen’s method.)

**Checks.**

- For c∈C× let B_(C,I)e carry σ(e)=[σ(c)/c]e. A vector fe is fixed exactly when f[c] is G_F-invariant, so by §9.2 the descended module is B_(F,I)[c]⁻¹e, of rank one. If σ(c)≠c for some σ, then e itself is not fixed; taking the given basis as the descended basis is wrong.
- The trivial rank-one cocycle is 1 and descends to B_(F,I); rank zero descends to 0. Matrix composition in rank 2 is noncommutative: E₁₂E₂₁=E₁₁ and E₂₁E₁₂=E₂₂.

*Needs:* §9.2; §9.1; TauCetiRoadmap.PerfectoidSpaces Layer P3; TauCetiRoadmap.AdicEtaleGeometry §A4.2a.

### 9.4 Continuous descent of interval bundles

For every I ⊆ [0,1), Fib(Y_(F,I)) is equivalent to bundles on Y_(C,I) with a semilinear G_F-action whose action on sections over every compact subinterval is continuous. The equivalence and fixed-vector inverse commute with interval restriction, tensor products and Frobenius. The compact descent theorem for value-group endpoints must be extended to arbitrary compact subintervals by arbitrary-compact descent before taking the limit; density of |F×| alone does not cover an irrational singleton or an included irrational endpoint.

For every compact J⊆[0,1), prove finite-extension completed base change from any enclosing value-group compact K, B_(L,K) ⊗̂_(B_(F,K)) B_(F,J)≅B_(L,J), and derive trace and noncommutative cocycle estimates in the J-norm itself. Do not assume a module or cocycle on J extends to K. This includes irrational singletons and included irrational endpoints.

One proof route uses the following steps. Value-group compact intervals form convenient enclosing neighborhoods of any compact J away from 1, but need not be a cofinal exhaustion contained in the given interval. Prove arbitrary-compact base change and estimates: finite-extension completed base change and the quantitative trace and matrix-cocycle estimates on J itself, with uniform constants from enclosing intervals, without assuming its object or cocycle extends to a neighborhood. With this arbitrary-compact descent input, descend each compact module and its overlap identifications. Full faithfulness makes the cocycles and restriction comparisons unique. Take the 2-limit over every compact subinterval and apply the interval bundle/global-section equivalence. Check continuity and Frobenius on exactly these compact module topologies.

(FF17, Conclusion of §11.2.4, pp. 376–377.)

**Checks.**

- The full interval theorem is conditional on arbitrary-compact descent in addition to the quantitative cochain contract and uniform generation. Test an irrational singleton and a closed irrational endpoint; a contained value-group exhaustion cannot be used in either case.
- For |F×|=q^ℚ and J={q^(−√2)}, there is no nonempty subinterval of J with value-group endpoints. At J=[q^(−√2),q⁻¹] the included irrational endpoint is equally missed.

*Needs:* §9.3; §8.6.

### 9.5 Why radius one is excluded from etale descent

The finite-étale and continuous module descent statements above are not extended to intervals containing 1. For B_(0,1]=B⁺[1/[ϖ]], finite F-extension need not produce the asserted finite-étale annular algebra. Likewise Frobenius modules over B⁺ fail the Galois descent satisfied over B. The positivity boundary quotient retains residue-field Frobenius information that global B-descent loses.

Construct and verify two counterexamples: a finite extension for which endpoint-one finite étaleness fails, and a continuous G_F-representation with nontrivial inertia whose associated B-Frobenius module lies outside the B⁺ essential image. For the first, set E=ℚ_p and use F equal to the completed perfection of 𝔽_p((t)) and the separable ramified Artin–Schreier extension z^p−z=t⁻¹; compare the boundary quotient, its ramification and the proposed étale extension. For the second use the regular E-representation of this cyclic quotient. Establish the essential-image comparison with representations factoring through G_(k_F).

One proof route uses the following steps. Inspect the proof’s required inequality outer_radius<|b^(1/p^k)|: it cannot hold at outer radius 1. Remark 11.1.11 describes the essential image of B-plus Frobenius modules through representations factoring through G_F → G_(k_F). Choose a continuous representation not factoring through this quotient; its associated B-module is outside that image. Identifying such a representation and checking the comparison is the boundary counterexample target. Give the unit/quotient comparison without turning failure of this proof into the sole reason for failure of the theorem; the concrete Frobenius counterexample is a boundary counterexample target.

(FF17, Remark 11.2.17, p. 376, and Remark 11.1.11, p. 366.)

**Checks.**

- Take F the completed perfection of 𝔽_p((t)) and L defined by z^p−z=t⁻¹. Its ramification cannot factor through the residue-field Galois group. The regular E-representation of its cyclic quotient has nontrivial inertia, unlike an unramified representation.

*Needs:* §1.15; §9.1.

### Examples

For |F×|=q^ℚ and J={q^(−√2)}, there is no nonempty subinterval of J with value-group endpoints. At J=[q^(−√2),q⁻¹] the included irrational endpoint is equally missed.

### Dependencies

Earlier layers: 0, 1, 4, 5, 8. Suppliers: TauCetiRoadmap.AdicEtaleGeometry, TauCetiRoadmap.PerfectoidSpaces, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 10: Curve functoriality, positive lines and reconstruction

Use the preceding descent to compare rational functions, covers, Frobenius lines, positive section algebras and adic reconstruction.

### 10.1 Rational functions and the ind-scheme quotient

E(X_F)=Frac(B_F)^(φ=1). For a nonempty open U, O_X(U) is the intersection of the nonnegative local valuation rings at the closed points of U inside this field. The natural φ-invariant map colim_(compact I ⊆ (0,1)) Spec(B_I) → X is universal for φ-invariant maps to schemes. Each Spec(B_I)→X is flat; for I=[ρ_1,ρ_2] with ρ_1≤ρ_2^q it is faithfully flat. The fpqc equivalence relation is the actual kernel pair over X, not an asserted disjoint union of Frobenius graphs.

One proof route uses the following steps. Geometrically write an invariant meromorphic function as a quotient of homogeneous sections of equal degree by clearing its positive and negative orbit divisors. Over general F, coprime numerator and denominator transform by the same continuous character. Multiply both by a positive section with the inverse character, making them invariant. Identify opens and regular functions by the Dedekind valuations. On each target affine open use the invariant localization B[1/t]^(φ=1); glue to prove the universal property. Flatness follows from torsion-free modules over the Dedekind local rings, and the fundamental-annulus condition supplies surjectivity.

(FF17, Proposition 6.6.2, pp. 256–257; Proposition 6.7.1 and Remark 6.7.2, pp. 258–259; Proposition 7.4.1, p. 268.)

**Checks.**

- The quotient is characterized in schemes, with its genuine kernel pair. General-field rational-function descent uses an inverse-character section.
- For ρ₂=1/2,q=2, the interval [1/4,1/2] meets every radius orbit and gives the faithful-flatness condition 1/4≤(1/2)². A shorter window need not cover the curve.

*Needs:* §5.7; §7.7; §7.3.

### 10.2 Separable coefficient change of the curve

Let E′/E be finite separable, and assume the residue constants of E′ embed in F. Then X_(F,E) ⊗_E E′ is canonically X_(F,E′), and the projection is finite étale of degree [E′:E]. For the unramified part the underlying period ring is unchanged and Frobenius is iterated; for the totally ramified part use the completed tensor comparison and rescale radii by the ramification index. The unramified comparison selects the residue-constant factor before changing Frobenius.

One proof route uses the following steps. Split the extension into its unramified and totally ramified parts and use the eigenspace/Veronese comparisons in each case. Compute the resulting invariant function fields, keeping the Frobenius iteration in the unramified calculation. At a closed point decompose K_y ⊗_E E′ as a finite product of finite separable fields and compare the corresponding Dedekind localizations. Glue the normal affine charts. The graded twist over the coefficient field is by tensor powers of a one-dimensional line. A choice of basis gives a graded comparison; changing that basis multiplies degree d by a scalar to the d-th power, hence acts identically on degree-zero basic-open localizations. The resulting Proj map is canonical. Apply the SchemeAndStackFoundations §0.3 positive-Veronese comparison, without a finite-generation assumption.

(FF17, §6.1.3, p. 244; Theorem 6.5.2(2), pp. 255–256; Proposition 7.5.1, p. 269.)

**Checks.**

- For equal-characteristic inseparable coefficient extensions, the tensor can be nonreduced; they are outside this étale statement.
- For unramified degree 2 the ring stays fixed and Frobenius is squared; for a separable quadratic residue-field tensor there are two factors over a geometric point. An inseparable tensor can contain ε≠0 with ε²=0.

*Needs:* §10.1; §6.2; §0.10; TauCetiRoadmap.SchemeAndStackFoundations §0.3.

### 10.3 Finite extensions of the tilt give etale covers

For finite Galois L/F, X_(L,E)→X_(F,E) is finite étale Galois with group Gal(L/F), of degree [L:F]. Closed-point stabilizers act faithfully as Gal(K_z/K_y) on the corresponding residue fields, so inertia is trivial. Non-Galois finite separable extensions give finite étale maps by passage to a Galois closure.

One proof route uses the following steps. Use the finite-orbit point dictionary to identify quotient orbits and the stabilizer action on residue fields. Radius preservation prevents a Galois element from identifying a point with a nontrivial Frobenius translate. Choose invariant degree-one sections nonvanishing on a given finite orbit, using positive-eigenvector cohomology, to put each orbit in an invariant Dedekind affine chart. Identify the invariant chart ring with the F-chart. Faithfulness of the stabilizer on residue fields makes the action free on geometric points; apply the SchemeAndStackFoundations §1.23 scheme-torsor contract to obtain the finite étale torsor.

(FF17, Proposition 7.6.1, pp. 269–270.)

**Checks.**

- Residue stabilizer faithfulness is the no-inertia input; it is stronger than knowing only the quotient set of closed points.
- A nonidentity automorphism of a separable quadratic residue field fixes its underlying closed point but exchanges its two geometric embeddings. Thus a closed-point stabilizer need not be inertia.

*Needs:* §4.4; §7.4; TauCetiRoadmap.SchemeAndStackFoundations §1.23; §7.3.

### 10.4 Curve of the uncompleted algebraic closure

Define X_(Fbar,E)=lim_(finite L/F in Fbar) X_(L,E) in schemes, with affine chart rings the filtered colimits of the finite-étale Dedekind chart rings. It is a regular noetherian curve with constant field E, despite the infinite tower. There are G_F-equivariant maps X_(C,E)→X_(Fbar,E)→X_(F,E), C=completion(Fbar). Finite-orbit points survive as closed points; a point of X_C with infinite G_F-orbit maps to the generic point of the tower curve.

One proof route uses the following steps. Use finite étale affine transition morphisms to construct the scheme inverse limit by its affine chart colimits. For each finite-orbit point choose a normal finite L/F with G_L contained in all stabilizers of its finitely many geometric conjugates. Its primes are then inert at every later finite stage, with unchanged uniformizer because the chart extensions are étale. For a nonzero element f from a finite-level chart, the number of primes above its zeros and their orders eventually stabilize. Each local colimit is an unramified DVR with that uniformizer and a growing residue field. Its quotient by the fixed power of the uniformizer is a truncated DVR of fixed length. Thus the colimit quotient is a finite product of such rings; apply the Dedekind quotient criterion. The finite-stage residue fields, and therefore the quotient rings themselves, need not stabilize.

(FF17, Definition 7.7.1, Proposition 7.7.2 and Lemma 7.7.3, pp. 270–271.)

**API.**

- The inverse-limit curve maps compatibly to each finite-level curve.
- Over a fixed affine chart its ring is the filtered colimit of the finite-level chart rings.
- Compatible point and function maps induce X_C→X_Fbar.
- The G_F-action and all finite projections agree with their quotient actions.

**Checks.**

- Projection followed by a finite transition agrees with projection to the lower stage.
- A geometric closed point with infinite G_F-orbit does not give a closed tower point.
- If a normal finite stage L has G_L contained in each stabilizer of a finite orbit, the associated primes remain prime at every later stage. Their residue fields may grow; only the number of primes and the ramification indices stabilize.
- The uncompleted algebraic closure and its completion give different curves; the noetherian claim uses eventual inertness, not an arbitrary filtered colimit theorem.
- In an inert unramified tower the uniformizer has order 1 at every stage. A quotient by its square has length 2 while the residue field may increase from degree 2 to degree 4; stabilization of quotient fields is false.

*Needs:* §10.3; §7.4; §4.4.

### 10.5 Finite-projective Frobenius modules on B

Specialize the supplied finite-projective semilinear-module pattern of VectorBundlesAndIsocrystals Layer 2, Finite projective Frobenius modules and integral models, to the supplied ring B, not to its Robba germ. Objects are finite projective B-modules M with a semilinear Phi whose linearization φ^*M → M is an isomorphism. Morphisms commute with Phi; tensor products and internal Homs carry the induced Frobenius, and H^0(M)=ker(Phi-1). By Layer 8 this is also the category of interval bundles on (0,1) with invertible Frobenius descent datum. No equivalence with Frobenius modules over the Robba germ is asserted here.

One proof route uses the following steps. Use finite-projective modules over the supplied B; require invertibility of linearized Frobenius in the data. Use the global-section equivalence for (0,1), and its compatibility with pullback by the radius Frobenius, to compare B-modules with interval bundles carrying Frobenius datum. Transport tensor, dual and Hom operations through this comparison; verify H^0 is the fixed-vector E-space.

(FF17, §7.8, pp. 271–272, with invertibility of Frobenius retained.)

**API.**

- The structure supplies an isomorphism φ^*M≅M.
- The B-ring specialization agrees with invertible-Frobenius interval bundles through Layer 8; the supplied linearization convention is unchanged.
- Finite projectivity and invertible Frobenius give tensor products and duals.
- H^0 is the equalizer of Phi and the identity as an E-vector space.

**Checks.**

- (B,φ) is the tensor unit and H^0=E.
- For (B,π^(-d)φ), fixed vectors are B^(φ=π^d).
- (B,0) is excluded, although zero is semilinear.
- A semilinear endomorphism alone would include zero Frobenius and fail to define a rigid tensor category.
- On the rank-one module, Φ(e)=π⁻¹e has invertible linearization; Φ(e)=0 does not. On the zero module the unique endomorphism is invertible as a map 0→0.

*Needs:* §8.6; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Finite projective Frobenius modules and integral models.

### 10.6 Degree and characters of Frobenius lines

For a rank-one object (M,Phi), after extension to B_C choose a basis with Phi(e)=λ e and define deg(M)=-v_π(λ). It is independent of basis and additive on tensor products. Degree maps Pic(φ-Mod_B) onto Z, and its kernel Pic^0 is canonically Hom_cont(G_F,E×) via the action on geometric fixed vectors. The character statement is about degree zero; arbitrary-degree lines do not have a one-dimensional fixed-vector space.

One proof route uses the following steps. Use the imported annular Frobenius-descent equivalence and geometric bundle classification to send M tensor B_C to a rank-one bundle O(d) on X_C. Pull back its standard presentation, obtaining a free B_C-module with Frobenius multiplier π^(-d). A general basis changes this by φ(u)/u, of π valuation zero by the B-unit description. Half-open interval freeness alone would not provide a basis over B_C. Solve the geometric degree-zero difference equation to identify its invariant E-line. Apply effective continuous descent of interval bundles on all compact subintervals to reconstruct the line from its character; use Layer 8 to recover the B-module. Check inverse constructions and continuity on the same compact norms.

(FF17, §7.8, pp. 272–273.)

**Checks.**

- The inverse character construction depends on Layer 10 effectivity, not just full faithfulness of a completed-cover functor.
- For Φ(e)=π⁻¹e, deg=−v_π(π⁻¹)=1; for the dual the degree is −1 and their tensor degree is 0. Only the degree-zero geometric line has a one-dimensional fixed E-space.
- For c in F×, the line with Φ(e)=[c]⁻¹e has degree −v_π([c]⁻¹)=0; over C its fixed line is E·[w]e with w^(q−1)=c, and its character is σ↦σ(w)/w, valued in μ_(q−1)=𝔽_q×⊂E× and trivial exactly when c is a (q−1)-st power in F. For q=2 every such class is trivial, as 𝔽₂×=1; for q=3, F the completed perfection of 𝔽₃((t)) and c=t, w²=t has no solution in F since 1/2 is not in ℤ[1/3], so the class has order 2. A model reading the class off c alone, without the (q−1)-st power quotient, would separate c=t from c=t·s² for s in F×.

*Needs:* §10.5; §6.5; §9.4; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 2, Annular Frobenius descent for bundles; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 4, Classification and Hom/Ext calculations; §1.3.

### 10.7 Every positive Frobenius line presents the same curve

For positive-degree Frobenius lines L_1,L_2, multiplication H^0(L_1) ⊗_E H^0(L_2) → H^0(L_1 tensor L_2) is surjective. For any positive-degree L its section algebra is generated in degree one and X≅Proj(⊕_(d≥0) H^0(L^tensor d)), canonically. In particular for λ in B× with v_π(λ)>0, X≅Proj(⊕_(d≥0) B^(φ=λ^d)).

Retain both character twists in the Koszul sequence and prove the equal-characteristic transfer using the same separable quadratic comparison; the smallest positive degrees are part of the theorem.

One proof route uses the following steps. Over C write both lines as positive integral twists with continuous characters. Use a two-section Koszul sequence that retains both character twists. Use positive-eigenvector H^1-vanishing and the separable quadratic/Veronese argument to prove multiplication, including the smallest positive degrees. For two positive lines replace one by a high tensor power and compare all maps between them on their section-covered affine charts; independence of the map follows from the rank-one interchange identity. Glue inverse scheme maps.

(FF17, Propositions 7.8.1–7.8.2 and Example 7.8.3, pp. 273–274.)

**Checks.**

- The multiplication argument keeps both twists. The Frobenius multiplier in the fixed-vector line is λ^-1, so its degree is positive.
- For Φ(e)=λ⁻¹e, fixed vectors fe satisfy φ(f)=λf and deg=v_π(λ)>0. In the two-section Koszul sequence, (a,b)↦ta+sb sends (−s,t) to −ts+st=0.

*Needs:* §10.6; §7.6; §7.3; TauCetiRoadmap.SchemeAndStackFoundations §0.3.

### 10.8 Runge approximation and recovery of the adic curve

Let I be a compact interval in (0,1) with endpoints in |F×| and I intersect I^q empty. If a nonzero t in P_1 has no zeros on Y_I, Be_t is dense in B_I. The ringed scheme (X,O_X), together with all radial Gauss norms, recovers the adic Frobenius quotient. The bare E-scheme without these norms is not asserted to determine that adic space.

One proof route uses the following steps. Use the Lubin–Tate period sum L(x)=Σ_(n in Z)[x^(q^-n)]π^n and isolate its index-zero Teichmüller term on the whole interval: for I=[ρ₁,ρ₂], replace t by π^n t so that t=L(ε) with ρ₂^(q/(q−1))<|ε|<ρ₁^(1/(q−1)), fix 0<α<1 with ρ₂^(q/(q−1))α^(−2)<|ε|<α²ρ₁^(1/(q−1)), and then for every x∈F in that range L(x)=[x](1+u(x)) with |u(x)|_ρ≤α for all ρ∈I, since the index-one term is bounded by ρ|x|^(−(q−1)/q)≤α and the index-minus-one term by |x|^(q−1)/ρ≤α. Approximate the unit-ball generators [x], [a]/π and π/[b]. For the last use π times (L(ε b^(-1/p^n))/L(ε))^(p^n), whose dominant term is π/[b]. Its only denominator is a power of the chosen t=L(ε), so it belongs to Be_t. Division by this ratio would instead approximate π[b] and introduce an inadmissible pole. Obtain a uniform residue-ball surjection and iterate smaller corrections for density. Complete the chart functions in the specified norms, recover their adic spectra and glue using the radius action. Use the AdicSpaces Layer 6 annular and Frobenius-quotient contract.  The target here is their comparison with the completed schematic charts and norms, not a second quotient construction.

(FF17, Proposition 7.9.1 and Corollary 7.9.2, pp. 274–276.)

**Checks.**

- The compact interval must avoid its Frobenius translate and the chosen pole. Recovery uses the family of norms as additional data.
- The proposed approximant π(L(εb^(−1/p^n))/L(ε))^(p^n) has dominant term π/[b]; its reciprocal ratio gives π[b]. At |b|=1/4 these differ by norm factor 16.

*Needs:* §10.1; §2.11; §1.3; TauCetiRoadmap.AdicSpaces §§6.1–6.4.

### Examples

For Φ(e)=λ⁻¹e, fixed vectors fe satisfy φ(f)=λf and deg=v_π(λ)>0. In the two-section Koszul sequence, (a,b)↦ta+sb sends (−s,t) to −ts+st=0.

### Dependencies

Earlier layers: 0, 1, 2, 4, 5, 6, 7, 8, 9. Suppliers: TauCetiRoadmap.AdicSpaces, TauCetiRoadmap.SchemeAndStackFoundations, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Layer 11: Arithmetic examples and maximal completeness

Give examples separating positive, global and completed carriers, and topological from abstract field isomorphism.

### 11.1 A nonprincipal ideal of B-plus

For E=ℚ_p and F=ℂ_p^♭, choose a convex decreasing sequence beta_j in ℤ[1/p] tending to an irrational beta>0. With Y=[p^♭], put f=Σ_(i≥0) p^i Y^(beta_(2i)) and g=Σ_(i≥0) p^i Y^(beta_(2i+1)). The two-generated ideal (f,g) is not principal in A[1/p], and remains nonprincipal in B⁺. Thus B⁺ is not Bézout in this example. This does not settle whether B itself is Bézout.

One proof route uses the following steps. Successively subtract the initial terms and divide by p to create elements of the ideal whose first residual coefficient valuations approach beta from above. A hypothetical principal generator h can be normalized into A ∖ p A. The divisibility bounds from both sides force v_F(h mod p)=beta. The value group of ℂ_p^♭ is rational, contradicting irrationality. In B⁺ first use the Newton bounds to show a hypothetical generator can be chosen in the bounded subring, then apply the same argument.

(Berger08, Remark 1.1.3, p. 96; compare FF17 Préface Remark 3.10(ii), p. 35.)

**Checks.**

- The explicit example has rational value group. No universal non-Bézout statement over all algebraically closed F is inferred.
- Choose β_j∈ℤ[1/p] decreasing convexly to √2. A hypothetical generator forces v_F(h mod p)≤β_j for every j and ≥√2, hence equality √2∉ℚ. A rational limiting value gives no such contradiction.

*Needs:* §1.7; §1.6.

### 11.2 A strict endomorphism of a completed algebraic closure

For every field k of characteristic p>0, a completed algebraic closure C_k of the t-adically valued field k((t)) admits a continuous k-linear field endomorphism C_k→C_k which is not surjective. The native signature is `exists_strict_laurentClosure_endomorphism`: K is a normed algebraic closure of LaurentSeries k, its norm induces the Laurent valuation ordering, and C_k is UniformSpace.Completion K. The endomorphism fixes the composite image of k, and its nonsurjectivity is asserted on the whole completion.

One proof route uses the following steps. Construct completed Kähler differentials with their maximal nonexpanding seminorm for extensions of analytic fields and the primitive-extension criterion: their vanishing is equivalent to density of the separable closure. Choose nested discs of strictly decreasing radii with positive limit using integers d_n indexed by n≥1 and prime to p and bounded increasing d_n/p^n, with d_(n+1)−pd_n→∞. The point is type IV over the original Laurent field. The differential estimate kills dt over k; after changing ground field to k((x)), the primitive extension is topologically algebraic. Its completed algebraic closure contains the original one strictly, and identifying the two Laurent models gives the endomorphism. Algebraic residue constants can be adjoined inside the algebraic closure. This supplies the analytic-field differential construction as well as its application.

For an isometric extension of complete nonarchimedean fields L/K, equip the algebraic Kähler differential module Ω_(L/K) with the largest seminorm for which d is nonexpanding and take its separated completion. The derivation has source L and target this completed L-module. A primitive extension means L is the closure of K(t) for a specified t; in that setting the completed module is generated by dt, and it vanishes exactly when the separable closure of K in L is dense. (KT16, Definition 2.3 and Lemma 2.4, p. 3.)

**API.**

- The completed differential module receives the continuous nonexpanding derivation from L and has the universal property for bounded K-derivations into complete normed L-modules, with the operator bound retained.
- Isometric towers have the natural map between completed differential modules, sending each da to the differential of its image; the source and target scalar extensions are specified before completion.
- In a primitive extension L=closure(K(t)), every completed differential is an L-multiple of dt, and zero completed differentials characterize density of the separable closure.

**Checks.**

- The identity extension K/K has Ω=0 and d(1)=0.
- A finite separable extension has Ω=0; its separable closure in itself is the whole extension, so the density criterion gives the same answer.
- In characteristic p, for t=s^p one has dt=0, but ds is a nonzero relative differential in the purely inseparable extension K(s)/K when t has no p-th root in K. Killing dt alone cannot prove that the completed module vanishes.

(KT16, Theorem 1.2, p. 1, and its proof, pp. 4–5; Lemma 2.4 and Remark 3.3, pp. 3–4.)

**Checks.**

- The differential vanishing is used after changing the ground field to k((x)); it is not a claim that a type-IV primitive extension has zero relative differentials.
- For p=2 and n≥1 take d_n=1+2^n+Σ_(j=1)^n2^j(n−j). Then d₁=3,d₂=7,d₃=17 and d_(n+1)−2d_n=2n−1→∞; d_n/2^n tends to 3. In characteristic 0 this differential construction does not kill dt.

*Needs:* a prime p, an arbitrary field k of characteristic p, the native Laurent-series, algebraic-closure and uniform-completion carriers in the Mathlib contract, and the analytic-field differential construction of this subsection.

### 11.3 Untilts not topologically isomorphic to Cp

There is an algebraically closed perfectoid field K over ℚ_p with K^♭≅ℂ_p^♭ and K not isomorphic to ℂ_p as a topological field. Consequently the ℚ_p-curve for ℂ_p^♭ has a degree-one closed point with residue field K; this point can be chosen away from the standard ∞ point and hence appears as a maximal quotient of Be. No nonisomorphism of the underlying abstract fields is asserted. The native signature of the field-theoretic part is `exists_untilt_padicComplex_not_continuouslyIsomorphic`: K is a complete algebraically closed field with a valuation in ℝ≥0 satisfying 0<v(p)<1, the tilt `PreTilt` of its valuation ring is ring-isomorphic to `PreTilt` of `𝓞_ℂ_[p]`, and there is no continuous field isomorphism K→`ℂ_[p]`. The tilt of `𝓞_ℂ_[p]` is a ring through the instance `fact_not_isUnit_natCast_padicComplexInt`, which proves that p is not a unit of `𝓞_ℂ_[p]` from the value 1/p of its valuation; the corresponding class for the valuation ring of K is part of the existential statement. A continuous field isomorphism e between two such fields is a homeomorphism: it sends topologically nilpotent elements to topologically nilpotent ones, so the image V of O_K is a valuation ring of ℂ_p with maximal ideal inside m_(ℂ_p); then O_(ℂ_p)⊆V⊊ℂ_p, and a rank-one valuation ring has no other proper overring, so V=O_(ℂ_p). The residue-field interpretation on the curve is not statable at the pins.

One proof route uses the following steps. Apply the strict-endomorphism construction to ℂ_p^♭. Transport the target through the perfectoid untilting equivalence relative to its source ℂ_p to obtain a strict extension ℂ_p→K. The algebraic closure of ℚ_p is dense in ℂ_p, while its integral/algebraic closure inside K is not dense. This property is preserved by a topological field isomorphism because ℚ_p is the closure of the prime field. Use the supplied primitive-untilt dictionary and the orbit-point curve comparison. A topologically nonisomorphic untilt cannot be in the standard point’s Frobenius orbit.

(KT16, Theorem 1.3, p. 2, and proof, p. 5; FF17 Préface note 11, pp. 4–5, and Remark 4.4(i), p. 40.)

**Checks.**

- The difference is topological. Abstract algebraically closed fields of this characteristic and transcendence degree are not distinguished by this theorem.
- The condition 0<v(p) is needed: without it K=ℂ_p^♭ itself, of characteristic p with v(p)=v(0)=0<1, has tilt ℂ_p^♭ and is not isomorphic to ℂ_p, so the statement would hold trivially.
- The closure of the algebraic closure of ℚ_p is all of ℂ_p. In the strict untilt extension it is the proper embedded copy of ℂ_p. This distinguishes topological fields, without comparing their abstract algebraically closed field types.

*Needs:* §11.2; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 0, Marked untilt Cartier divisors and Cartier descent; TauCetiRoadmap.PerfectoidSpaces §P3.7; §7.7.

### 11.4 Closed prime ideals of the integral period ring

Assume F algebraically closed and E of mixed characteristic. For the weak topology on A=W_OE(O_F), the closed prime ideals are (0), the unique maximal ideal (π)+W_OE(m_F), (π), W_OE(m_F), and the primitive degree-one ideals (π-[a]) for nonzero a in m_F modulo equality of ideals. Their residue fields are respectively Frac(A), k_F, F, W_OE(k_F)[1/π], and the marked algebraically closed untilt K_a. Here residue field means Frac(A/p), not the quotient A/p in every case.

One proof route uses the following steps. A prime containing π corresponds to a prime of the rank-one valuation ring O_F, giving (π) or the maximal ideal. For a prime avoiding π and the Teichmüller boundary, a nonzero Newton slope supplies a degree-one primitive factor; its untilt quotient is a valuation ring, so the remaining possibilities are its zero and maximal primes. For the boundary case compare coefficient reductions A→W_OE(k_F) and use the flat-polygon criterion and closedness to exclude additional weakly closed primes. A has a unique maximal ideal; exotic nonclosed primes from localization are not extra maximal ideals of A itself.

(FF17, Préface Corollary 3.3 and note 26, pp. 32–33; §§2.2 and 2.4, pp. 103–113 and 124–127.)

**Checks.**

- W_OE(m_F) is the kernel of the coefficient-residue map and is not generally the principal ideal generated by one Teichmüller element.
- For (π), Frac(A/(π))=F; for the maximal ideal the residue is k_F. For W_OE(m_F) the quotient is W_OE(k_F), whose fraction field inverts π; identifying quotient and residue would conflate them.

*Needs:* §3.3; §2.7; §1.15.

### 11.5 Automorphism orbits under valued homogeneity

Let F be an algebraically closed perfect complete rank-one field and let Aut_top,Fq(F) act on it, allowing positive rescaling of the real valuation. Assume the valued homogeneity property that this group is transitive on m_F ∖ {0}. Then its action on the degree-one primitive point space is transitive, and for a chosen untilt K the closed orbit-point set of X is Aut_top,Fq(F)/(Aut_top,E(K) times φ^Z), with the stabilizer product interpreted through the marked tilting action. Maximal completeness alone is not substituted for this homogeneity property for arbitrary value groups.

In the maximally complete algebraically closed characteristic-p case with residue field 𝔽̄_p and additive value group ℚ, prove the valued automorphism-extension theorem that implies the stated homogeneity: for x,y in m_F∖{0} there is a field automorphism σ of F fixing 𝔽̄_p with σ(x)=y and v_F∘σ=(v_F(y)/v_F(x))·v_F. The rescaling factor is a positive rational, so it preserves ℚ, and σ is a homeomorphism. This is a separate valued-field theorem in this section; it is not inferred from maximal completeness for arbitrary value groups. Its native signature is `exists_hahnSeries_automorphism_rescaling_order`, on the Hahn field F=`HahnSeries ℚ (AlgebraicClosure (ZMod p))` with `HahnSeries.order` as additive valuation and `HahnSeries.C` for the constants: for x,y of positive order there is a ring automorphism σ fixing the constants with σ(x)=y and order(σ(z))=(order(y)/order(x))·order(z) for all z. Every maximally complete algebraically closed field of characteristic p with residue field 𝔽̄_p and value group ℚ is isomorphic to this F as a valued field (Poonen93, Corollary 6), which transports the statement.

One proof route uses the following steps. Use the equivariant Lubin–Tate parametrization of nonzero m_F modulo O_E× to pass transitivity to primitive points. Identify the stabilizer of a marked untilt point by the tilting equivalence; the stabilizer of its Frobenius orbit includes the commuting φ^Z rescalings. Apply the ordinary orbit-stabilizer bijection. To remove the extra homogeneity hypothesis in the intended maximally complete Cp-type setting, prove the valued automorphism-extension theorem as follows. On 𝔽̄_p(x) the valuation is v_F(x) times the x-adic order, since constants have valuation 0; so 𝔽̄_p(y)→𝔽̄_p(x), y↦x, is an isomorphism of valued fields once the valuation of the target is rescaled by s=v_F(y)/v_F(x). F is maximally complete with divisible value group ℚ and algebraically closed residue field 𝔽̄_p, hence isomorphic to the Mal'cev–Neumann field 𝔽̄_p((t^ℚ)). Prove, as part of this target, the embedding theorem for that field: a valued extension of one of its subfields, with value group inside ℚ and residue field inside 𝔽̄_p, embeds into it over that subfield. Apply it to (F,s·v_F) over 𝔽̄_p(y) to obtain an embedding of valued fields σ:(F,s·v_F)→(F,v_F) with σ(x)=y fixing 𝔽̄_p. Its image is maximally complete with value group sℚ=ℚ and residue field 𝔽̄_p, so F is an immediate extension of it and equality follows from maximal completeness.

(FF17, Préface §1.4, p. 9, qualified by an explicit homogeneity hypothesis. Poonen93, Theorem 2, p. 10, and Corollaries 5–6, pp. 12–13, for the embedding theorem and uniqueness of the maximally complete field.)

**Checks.**

- Zero is excluded from the transitive set. Norm-preserving automorphisms cannot move elements of different norm; topological automorphisms allow only value-group-preserving rescalings.
- A norm-preserving automorphism sends elements of valuation 1 to valuation 1 and cannot send one to valuation 2. Permitting the rescaling 1↦2 is necessary, and 0 is excluded from the transitive set.
- Positive order forces x,y≠0, so the ratio order(y)/order(x) has a nonzero denominator; for z=0 both sides of the order identity are the junk value 0.
- For F=𝔽̄_p((t^ℚ)), x=t and y=t² the extension theorem gives σ with σ(t)=t² and v_F∘σ=2v_F; then v_F(σ(t^(1/2)))=1. For a value group ℤ[1/p] with p odd, the factor 1/2 would not preserve it; the divisibility of ℚ is what keeps every ratio v_F(y)/v_F(x) admissible.

*Needs:* §2.11; §7.7; TauCetiRoadmap.LocallyAnalyticDistributions §0.0 and §0.2.

### 11.6 Higher eigenvectors and the boundary of representability

For E=ℚ_p the eigensheaf B^(φ=p^2) must not be modeled by an asserted unique two-sided Teichmüller parametrization in two F-coordinates. Its Banach–Colmez diamond description is imported from VectorBundlesAndIsocrystals Layer 5, Banach–Colmez section and hypercohomology sheaves, while the stronger assertion that it is not represented by an analytic/perfectoid space needs a separate obstruction. The sufficient representability range 0<λ≤1 does not by itself prove failure at λ=2.

One proof route uses the following steps. Compare the imported Banach–Colmez construction and the degree-two fundamental exact sequence. Separate the unique boundary-zero Witt expansion from the much larger completed period ring, and compare the stricter growth defining bivectors. Record the missing degree-two nonrepresentability proof as the degree-two obstruction contract rather than deriving a converse from a one-sided sufficient criterion.

(FF17, Préface Remark 2.32(iii) and note 22, p. 25.)

**Checks.**

- For a single point repeated twice the fundamental sequence has a length-two jet quotient and a one-dimensional kernel. The sufficient slope condition λ≤1 evaluates false at 2; its failure supplies no proof of nonrepresentability.

*Needs:* §1.12; §6.10; TauCetiRoadmap.VectorBundlesAndIsocrystals Layer 5, Banach–Colmez section and hypercohomology sheaves; the degree-two obstruction contract.

### Examples

Choose β_j∈ℤ[1/p] decreasing convexly to √2. A hypothetical generator forces v_F(h mod p)≤β_j for every j and ≥√2, hence equality √2∉ℚ. A rational limiting value gives no such contradiction.

### Dependencies

Earlier layers: 1, 2, 3, 6, 7. Suppliers: TauCetiRoadmap.LocallyAnalyticDistributions, TauCetiRoadmap.PerfectoidSpaces, TauCetiRoadmap.VectorBundlesAndIsocrystals. The subsection Needs lines give the exact sections and hypotheses.

## Downstream consumers

The general-field function theory is the base for extensions of relative Fargues–Fontaine geometry beyond a single perfect field, for theories of admissible pairs and p-adic Hodge structures that need weighted divisors, positive-line sections and de Rham lattices over an arbitrary perfect F, and for period comparisons and finite-jet interfaces in regulator and special-value theories. The interval and valued-field results also supply distribution-algebra and Berkovich arithmetic developments. These consumers contribute no prerequisites to this build.

## Worked examples

These calculations link the definitions to the final curve and expose mistakes that merely checking types would miss.

1. **Norms, scalar homogeneity and slope signs.** For f=([a]π^n), its raw ρ-norm is |a|ρ^n. If ρ=q^-r, then v_r(f)=v_F(a)+nr and n_ρ(π)=q^-1. For f=(π-[a])(π-[b]) with v_F(a)=2 and v_F(b)=5, v_r(f)=min(r,2)+min(r,5): its derivatives are 2, 1 and 0 on the three open ranges, so its two zero multiplicities are 1 at slopes 2 and 5. Replacing the polygon product by pointwise addition of abscissae or replacing the transform by an opposite sign fails this computation.
2. **Coordinate comparison.** In the monomial model |t|=q^-1. The ordinary annulus coordinate X has norm checkrho=q^(-1/r), whereas the period coordinate T=[t] has raw norm q^-1 at ρ=q^-r. Thus ||X||_(checkrho)^r=q^-1=|T|_ρ, and ||π||^r=q^-r=|π|_ρ. A literal isometry without the r-th power fails on both generators. The ℚ_p cyclotomic model requires the strict transformed threshold. The ramified coefficient case is the coordinate theorem in §1.9.
3. **Metric normalization.** In equal characteristic the degree-one ideal y_a=(π-a) has evaluation π↦a. Therefore delta(y_a,y_b)=v_F(a-b), and the ordinary distance is |a-b|. Frobenius sends a to a^q and scales delta by q; it does not preserve the F-normalized untilt valuation. On the Lubin–Tate vector space the norm is 1/v_F(ε), so the π action ε↦ε^q has norm factor q^-1. Using |ε|_F instead would fail scalar homogeneity.
4. **Weights and principal divisors.** A degree-d point becomes d geometric points after completed algebraic closure, each with the same local zero order. A local order m therefore contributes dm to the Newton multiplicity. On the finite orbit divisor carrier a weight-3 point plus a weight-2 point has weighted degree 5, exactly as the pinned `TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree` calculation. Degree is not the number of orbit representatives and is not [K_y:E].
5. **Forward products and the interpolation shift.** For b∈M_d, shifting the convergent product gives φ(Pi_plus(b))=π^d Pi_plus(b)/b. The negative-half divisor uses only n<0. To impose φ^n(x)∈m_y for all n≥0, the divisor of x must contain all backward translates including y itself. Applying φ to the negative-half product supplies that missing zero. Distinct neighboring orbit representatives require the pointwise supremum of tails, not their sum; repeated identical representatives retain their multiplicity.
6. **Geometric and general chart distinction.** In the geometric chart, a Bézout gcd of a minimum-degree nonzero ideal member a and any other b divides a. Additivity of nu and nu=0 exactly on units forces that gcd to be associated with a, so a divides b. This proves principality. In general F the descended generator can transform by a nontrivial continuous E-character; its character class measures the ideal class instead of disappearing in the minimum-degree argument.
7. **Corrected nonlinear factorization.** Expanding (1+U)Z(1+V)Z^-1 yields 1+U+ZVZ^-1+UZVZ^-1. The tangent is therefore U+ZVZ^-1. For Z=diag(T,T^-1) in an annular matrix algebra, the lower-left component of conjugation shifts an exponent by -2, so an unconjugated additive splitting cannot simply be reused. A bounded section of the actual tangent controls the quadratic term near 1. It gives a neighborhood for that Z, not a uniform neighborhood for every approximant chosen in a gluing proof.
8. **Bounded fibre dimension and torsion length.** Locally finite torsion supported at escaping points can have summands B_dR,y^+/Fil^(n_y) with n_y unbounded. Each such cyclic summand has fibre dimension 1. The finite-presentation criterion tests uniform fibre dimension; bounding all n_y would impose an extra, incorrect condition. Conversely the unrestricted coadmissible category permits unbounded fibre dimensions and cannot be replaced wholesale by finitely generated global modules.
9. **Scheme quotients and positive lines.** A nontrivial stabilizer of a closed point may act faithfully on its residue field; then it fixes no geometric point above that point, so inertia is trivial. This is the finite-group quotient condition used for etaleness. For a Frobenius line with Phi(e)=λ^-1 e and v_π(λ)>0, its degree is positive and fixed sections are B^(φ=λ); the sign agrees with the positive section algebra. The Koszul map after (-s,t) is (a,b)↦ta+sb, whose composite is zero, with both character twists retained.


## References

- **FF17:** Laurent Fargues and Jean-Marc Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*, public author copy dated 16 April 2017. The cited theorem numbers and printed pages are those of this copy, a precursor to Astérisque 406 (2018); published numbering is not identified with it. [Author copy](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf). Chapter 1, Chapters 2–7, §§11.1–11.2 and the explicitly located preface results support the targets above.
- **KT16:** Kiran S. Kedlaya and Michael Temkin, *Endomorphisms of power series fields and residue fields of Fargues–Fontaine curves*, author version 6, 29 March 2016, Theorems 1.2–1.3 and Lemma 2.4, printed pp. 1–5. [Author copy](https://math.huji.ac.il/~temkin/papers/Endomorphisms_of_Power_Series.pdf).
- **Berger08:** Laurent Berger, *Construction de (φ,Γ)-modules: représentations p-adiques et B-paires*, Algebra & Number Theory 2 (2008), pp. 91–120, Remark 1.1.3, p. 96. [Publisher open archive](https://msp.org/ant/2008/2-1/ant-v2-n1-p04-p.pdf).
- **ST02:** Peter Schneider and Jeremy Teitelbaum, *Algebras of p-adic distributions and admissible representations*, arXiv math/0206056v1 (2002), §3, definition, Theorems A/B, Corollaries 3.1–3.5 and Lemma 3.6, printed pp. 7–11. [Version read](https://arxiv.org/abs/math/0206056v1). The general complete nonarchimedean-field system theorem is distinct from the distribution-algebra specialization over local fields.
- **Poonen93:** Bjorn Poonen, *Maximally complete fields*, L'Enseignement Mathématique 39 (1993), 87–106, Theorem 2, p. 10, and Corollaries 5–6, pp. 12–13. [Author copy](https://math.mit.edu/~poonen/papers/amsval.pdf).
