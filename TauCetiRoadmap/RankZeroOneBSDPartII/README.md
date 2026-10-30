# Roadmap: rank-zero and rank-one Birch–Swinnerton-Dyer theory, part II — Eisenstein converses and twist proportions

**Summary.** Build the rank-zero and rank-one converse at every good odd Eisenstein prime for a rational elliptic curve with a fixed cyclic isogeny and the two local character exclusions. The route combines complementary quadratic twists, ordinary anticyclotomic control at augmentation, the Heegner index-square equality and the complex Gross–Zagier formula. It gives equality of analytic and Mordell–Weil ranks and finiteness of the whole Tate–Shafarevich group. Its finite-Selmer form converts restricted three-Selmer statistics into positive analytic-rank proportions in quadratic twist families with a good-at-three twist (CGLS Theorem 5.2.1 and Corollaries 5.2.2–5.2.3, pp. 574–575; CGLS line 2027).

## Scope and ownership

The forward direction from which this roadmap starts is supplied by named owners: ArithmeticStatisticsPartVI's supporting targets “Heegner logarithm and low rank” and “Elliptic p-parity” give the forward low-analytic-rank theorem and the elliptic root-number parity, and HeegnerPointEulerSystems §§8b.2 and 8b.10 give the anticyclotomic Iwasawa equalities at Eisenstein primes. The new implication here starts from Selmer corank. Ownership of the imported inputs is specified by the supplier sections below. The CM newform and elliptic converses belong to CMRankZeroConverse §§C.0–C.6, and the irreducible-residual localization criteria belong to RankOneConverse §§PC.0–PC.6. Their hypotheses are not imposed on this branch.

The fixed-isogeny hypothesis predicate, complementary-field assembly, combination of discrete augmentation control with compact specialization, traced Heegner comparison, two converses and admissible statistical conversion are owned here. EulerSystemsAndKolyvaginSystems §8.31 owns discrete augmentation control and its corank-one consequence; compact specialization uses the additional SelmerIwasawaCohomology contract below. The Howard unit-line and level-zero normalization comparison is imported from HeegnerPointEulerSystems §8.13. The traced comparison here differs from its §8.32: it is an exact identity at the trivial character after the full Hilbert-class-field trace, rather than a finite-coefficient congruence for near-trivial characters.

The generic isogeny, degree, Tate module, Weil pairing, quadratic twist, minimal model, height and finite generation constructions are already in the library at the modules named below. EllipticCurves Layers 2, 4, 5 and 7 retain their general Galois, local-reduction, twist and descent APIs. SelmerIwasawaCohomology §§2.9–2.12a, 3.9–3.11, 4.26 and 4.29 own the Selmer carriers, control machinery, Kummer comparisons and alternating Cassels–Tate pairing modulo divisible kernels. No second pairing or Selmer theory is constructed here.

HeegnerPointEulerSystems §§8.6–8.6a, 8.24, 8.31, 8.34, 8b.2 and 8b.10 own the arithmetic tower, source class, rank-one paired-torsion theorem and Eisenstein main-conjecture equality. GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.18 and 8.19 own the height normalization, the general explicit formula, the non-torsion criterion for the trace point and the elliptic X₀(N) specialization; its squarefree-level §8.17 is not used. ModularIwasawaMainConjectures §6.1 owns the comparison formulation, not a second proof of the Eisenstein equality.

ArithmeticStatisticsPartI owns relative density (§0.1), families defined by local conditions (§0.2), squareclasses, their height and the twist family (§0.5), squarefree residue counts (§0.6) and the positive squareclass denominator (§0.15). ArithmeticStatisticsPartVII §5.10 owns the Selmer ratio, the local Tamagawa formula, stratum density and restricted three-Selmer bounds, and its §5.32 owns the attainable local three-isogeny ratios; Part III owns the orbit-counting input. ArithmeticStatisticsPartVI's supporting “Heegner logarithm and low rank” and “Elliptic p-parity” own the forward theorem and elliptic corank parity. Family parity between two arithmetic points in SelmerIwasawaCohomology §4.28 is not substituted for this root-number parity theorem. EllipticCurveModularity Layers R29.3–R29.6 and ModularForms Layer 7 own the actual newform and continued elliptic L-functions. These generic statements are imports, not targets here.

GlobalNumberFields Layer 1 owns mixed-place weak approximation; its endpoint is consumed through the pinned Tau Ceti declaration below.

The concrete nineteen-a3 equation is a worked specialization of native coefficients. Its local density and the no-good-twist obstruction are owned here as scope diagnostics. They, and the elementary coefficient, invariant, point-count and tangent Checks, are mathematical examples, not headline acceptance theorems.

## Conventions

E/ℚ is a `WeierstrassCurve` with `WeierstrassCurve.IsElliptic`; N is its positive conductor. Fix the actual rational cyclic isogeny ι:E→E′ of prime degree p, its kernel character φ:G_ℚ→𝔽_pˣ and quotient character ψ=ωφ⁻¹. Here ω is the mod-p cyclotomic character; φψ=ω is the Weil-pairing determinant convention. The converse condition is p>2, p∤N and φ restricted to G_ℚp unequal to both 1 and ω. Splitting of the residual extension and a parity at infinity are not assumptions. The target is uniform in N and p subject to precisely these hypotheses (CGLS pp. 518–521, line 73 and Theorem 5.2.1, line 2027).

Use classical Kummer conditions on E[pⁿ] and E[p∞]. Corank is the ℤ_p-rank of the Pontryagin dual, equivalently its dimension after tensoring with ℚ_p; tensoring the discrete torsion group itself with ℚ_p gives zero. The rational finite Selmer space comes from the rational Tate-module limit. Finite bad-prime Kummer conditions retain component-group terms even when the rational condition is zero (SelmerIwasawaCohomology §§2.6, 2.11–2.12, 4.26).

For the anticyclotomic route, K has odd fundamental discriminant D<−4, every prime of N splits, and p=v v̄ splits. There is no p∤h_K condition. Put Γ=Gal(K∞/K)≅ℤ_p, Λ=ℤ_p⟦Γ⟧ and P₀=(γ−1) for a topological generator γ. Use inverse tautological action, with the contragredient action on Pontryagin duals. The ordinary self-dual discrete dual X has Λ-rank one; the relaxed-at-v, strict-at-v̄ Greenberg dual X_E is a different torsion module. Characteristic identities are considered in Λ[1/p], where γ−1 remains a nonunit (CGLS pp. 519–520, line 81; §3.4, line 1745; Corollary 4.2.3, line 1891).

Analytic rank is the finite central order of the continued actual arithmetic L-function, at s=1. The traced Heegner point uses a fixed modular parametrization π:X₀(N)→E with π(∞)=O; the same π and trace occur in the Kummer and complex-height comparisons. Write α for the unit root of X²−a_pX+p and β=p/α. The height h_x is Tau Ceti's canonical x-height, equal to twice the (O)-height; its half polar form B_x has B_x(P,P)=h_x(P). This is the convention of GrossZagierAndArithmeticHeights §0.1, not a new height.

Count each squareclass in ℚˣ/ℚˣ² by its unique nonzero signed squarefree integer d with height |d|. Use the cutoff |d|≤X throughout. A finite local prescription has its additive-Haar-induced squarefree mass, not a uniform distribution on local squareclasses. Set T_m={d:c(ιᵈ)=3^m} for signed m∈ℤ; BKLOS §2 instead writes its T_m for the absolute exponent, so its T₁ is our T₁∪T₋₁ (BKLOS p. 4, line 149; §9.1 p. 14, line 612). Analytic-rank proportions are lower limits as X→∞; their limiting density need not exist.

**Checks.**

- At p=3 the permitted unramified character η takes Frobenius to −1 and inertia to 1; its dual ωη has inertia −1. Their product is ω. The alternatives 1 and ω fail the exclusion, including a kernel generated by a rational point of order p (φ=1).
- The character projectors over a quadratic extension are (1+c)/2 and (1−c)/2. On eigenvectors with c=1 and c=−1 they give (1,0) and (0,1); at p=2 division by 2 is not an integral projector.
- In Λ=ℤ₃⟦T⟧, T=γ−1 remains a nonunit in Λ[1/3], while 3 becomes a unit. For the contragredient action γ↦γ⁻¹, T↦−T/(1+T); its order at T=0 is still one. Inverting T would discard that prime.
- For h_(O)(P)=1 and h_(O)(2P)=4, h_x(P)=2, h_x(2P)=8 and B_x(P,P)=(8−2−2)/2=2. Using the half polar form of h_(O) would give 1.
- The two local classes 1 and 2 at 3 each have mass 3/8 among signed squarefree integers; classes 3 and 6 each have mass 1/8. The sum is 1, and the total unit mass is 3/4. The classes of 2 and 18 coincide and are counted once.

## Exact supplier contracts

The following contracts fix mathematical objects and their normalizations. A gap is an additional endpoint required from its named owner; it is not a substitute definition or an extra hypothesis on the final theorem.

### From Mathlib

Consume `WeierstrassCurve`, its five coefficients, `WeierstrassCurve.Δ`, `WeierstrassCurve.c₄`, `WeierstrassCurve.c₆`, `WeierstrassCurve.map`, `WeierstrassCurve.IsElliptic` and `WeierstrassCurve.j` from `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`. The carrier allows singular equations over arbitrary rings; ellipticity means the discriminant is a unit, not merely nonzero over a ring. All arithmetic statements here explicitly restrict to characteristic-zero fields and elliptic curves.

Consume `WeierstrassCurve.minimal`, `WeierstrassCurve.HasGoodReduction` and `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction` from `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`. The good-reduction class includes minimality and discriminant valuation equal to the multiplicative identity 1 (additive valuation 0). Apply it to the chosen minimal model after base change to ℚ₃, rather than to an arbitrary raw twist equation. Consume `NumberField.finite_setOfPred_logHeight₁_le` from `Mathlib/NumberTheory/Height/NumberField.lean` and `WeierstrassCurve.Affine.finite_naiveHeight_le` from `Mathlib/NumberTheory/Height/EllipticCurve.lean` for Northcott. Consume `le_liminf_mul` from `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean`: for real functions u,v that are eventually nonnegative along a nontrivial filter, with u bounded above and v cobounded for ≥ (which holds when v is bounded above), (liminf u)(liminf v)≤liminf(uv). It is applied to cutoff ratios, which lie in [0,1].

`WeierstrassCurve.LSeries` in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` is the literal L-series built from its arithmetic coefficient function; continuation and finite central order are the separate elliptic modularity contract. `ContinuousCohomology.tateShafarevich` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` is a localization kernel for supplied topological Galois data; its identification with classical elliptic Sha and Kummer local conditions is the Selmer supplier's contract.

### From Tau Ceti

Consume `TauCeti.Isogeny` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` and its nonzero coordinate pullback carrier, with degree and point maps from the Isogeny development; no duplicate isogeny carrier is introduced. Consume `WeierstrassCurve.quadraticTwistOf`, `WeierstrassCurve.Δ_quadraticTwistOf`, `WeierstrassCurve.isElliptic_quadraticTwistOf_iff` and `WeierstrassCurve.j_quadraticTwistOf` in `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`. The trace/norm parameters t,n have discriminant parameter t²−4n. For t=0,n=−d, this is 4d; over ℚ and ℚ₃ it represents the squareclass of d.

Consume `WeierstrassCurve.Affine.Point.canonicalHeight_nonneg` and `WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` in `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean`. The latter retains the Northcott hypothesis on canonical height, discharged over number fields by the native height comparisons. The Northcott transfer from naive to canonical height is the instance in the same file. Consume `WeierstrassCurve.Affine.fg_point_of_numberField` from `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` for finite generation over every number field. Neither height assertion alone constructs a Heegner point.

Consume `TauCeti.GlobalNumberFields.weakApproximation_denseRange` from `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean`: for any number field K and finite sets of finite and infinite places, the diagonal K has dense image in the product of their completions. Nonzero local squareclasses are open, so any finite rational prescription, including a real sign, is realized by an element of ℚˣ. Its unique signed squarefree representative preserves all local squareclasses and the sign. This supplies compatibility; ArithmeticStatisticsPartI supplies the height-density statement.

Consume `HeckeRing.GL2.Newform.analyticRank`, `HeckeRing.GL2.Newform.analyticOrderAt_L_ne_top` and `HeckeRing.GL2.Newform.analyticRank_eq_zero_iff` from `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`. These use the entire L-function of a positive-weight newform and its finite central order. The elliptic modularity supplier identifies the rational elliptic curve’s actual coefficient series with this newform L-function; the native newform API by itself does not supply that identification.

### From TauCetiRoadmap.EllipticCurves

Layers 1–2 supply degree, duals, the rational quotient by a stable cyclic subgroup, Weil pairing and actual kernel character; Layers 4–5 supply the local model, invariant differential, formal group, isogeny invariance of good reduction, twist transport and j-invariance; Layer 7 supplies Kummer exact sequences and finite Selmer conditions. The chord/tangent law identifies the two nonidentity flexes below as order-three points. The reduction used at 3 is of the integral coefficient tuple; there is no unital map ℚ→𝔽₃.

What EllipticCurves must provide (gap:eisenstein-local-dictionary): For a fixed rational cyclic odd-prime isogeny at good reduction, identify its actual kernel and quotient characters, deduce ordinarity and local p-torsion vanishing under the two-character exclusion, and at p=3 prove the good unramified versus bad ramified twist dictionary with its connected/étale kernel alternatives.

### From TauCetiRoadmap.EllipticCurveModularity and TauCetiRoadmap.ModularForms

EllipticCurveModularity Layers R29.3–R29.6 supply the rational newform, exact conductor and all Euler factors, modular parametrization, summability, continuation and functional equation. ModularForms Layer 7 supplies the arithmetic newform L-function and its analytic identities. These fix the actual L-function, not an arbitrarily specified germ near 1.

What EllipticCurveModularity must provide (gap:quadratic-analytic-factorization): Identify the continued quadratic base-change L-function with the product of the two actual rational elliptic twist L-functions, including all bad Euler factors, finite central orders and the split-level imaginary-quadratic root sign −1.

### From TauCetiRoadmap.SelmerIwasawaCohomology

Use §§2.9–2.12a for classical elliptic Selmer groups, their coefficient exact sequences, cofinite generation, corank of the Pontryagin dual and the Mordell–Weil/Sha sequence; §4.26 identifies the rational finite Kummer condition. Use §4.28's quadratic-character decomposition with its Shapiro and local-condition compatibility to obtain the rational corank sum. Use §4.29's elliptic specialization, divisible radicals and finite reduced-primary product T×T. This is stronger than square cardinality: finite cyclic p² has square order but is not a nontrivial alternating perfect self-pairing. No full-Sha finiteness is an input. The finite-Selmer dimension comparison uses this endpoint, whereas the p∞ converse does not.

Use §§3.9–3.11 for the actual localization-image and derived specialization diagrams, retaining invariant, H² and Tor errors. They do not authorize dropping the compact cokernel.

What SelmerIwasawaCohomology must provide (gap:cgls-ordinary-control): For the CGLS self-dual ordinary anticyclotomic Selmer groups with both residual local characters nontrivial, prove that compact specialization S[1/p]→H¹_f(K,V_pE) has kernel (γ−1)S[1/p], retaining the local-image, H² and Tor cokernel terms.

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

Use §8.31 “Augmentation control” and its corank-one consequence for finite kernel and cokernel of discrete restriction control and the rational coinvariant dimension. Its good ordinary, split-level, split-p and E(K)[p]=0 hypotheses follow from the local dictionary and the Heegner conditions: at a split place K_v=ℚ_p, so E(K)[p] injects into the vanishing E(ℚ_p)[p]. Section 1.2 of this roadmap supplies corank one for the selected field. Residual irreducibility and the image conditions (Sc) and (Irr) are not hypotheses of this control theorem.

### From TauCetiRoadmap.HeegnerPointEulerSystems

Use §§8.6–8.6a and 8.24 for the norm-compatible source-normalized Heegner family, Kummer/Shapiro comparison and its non-Λ-torsion class, with the actual class-number shift; §§8.31 and 8.34 give the paired rank-one structure. Use §8b.2's rational CGLS comparison and §8b.10's Eisenstein equality, including its independent elliptic-unit/Katz and integral-family reciprocity contracts. Rationalize the exact fixed-isogeny transport factors of §8.6a; a nonzero scalar becomes a unit in Λ[1/p], not necessarily in Λ. For the present corank-one application retain (Sel) before invoking the equality at P₀. The inputs to that equality are independent of this converse. Nonzero tower class alone supplies no nonzero trivial-character specialization.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Layer 4 supplies Λ, its power-series coordinate, height-one localization, characteristic ideals and module structure. Localizing at P₀ gives a DVR with residue field ℚ_p. Finite p-power modules disappear after inverting p; augmentation-primary torsion does not. This distinction is part of the argument, not a change of coefficients after specialization.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

Use §0.1's pinned x-height comparison and §§8.14, 8.18 and 8.19 for the general explicit Gross–Zagier identity, specialized to ℚ, trivial ring-class character, conductor c=1, odd D and all level primes split. Section 8.19 identifies the central derivative with a nonzero explicit constant times the K-relative height of the specified trace point, using the same modular parametrization; its classical case c=1, odd D and (N,D)=1 is also stated by EffectiveClassNumbers §2.8 “Gross–Zagier with exact constants” for every level N with all primes of N split, with the same coefficient ‖ω_E‖²/(C²u²√|D|). Section 8.19 derives it through its own kernel route, using its §§8.15 and 8.4. Section 8.18 with F=ℚ, A=E and B=M₂(ℚ) gives that the trace point has infinite order exactly when the central order over K is one. The Hodge, unit-index, degree and differential normalizations are retained. Section 8.17 assumes squarefree N and is not used; no squarefree-conductor restriction enters this specialization.

### From TauCetiRoadmap.ArithmeticStatisticsPartI

Use §0.1 “Relative density” for the cutoff ratios r_X(S | T), their bounds 0≤r_X≤1 and lower and upper relative densities; §0.2 “Family defined by local conditions”; §0.5 “Quadratic twist squareclass family”; §0.6 “Squarefree integers in residue classes”; and §0.15 “Positive squareclass denominator”. The tower theorem of §0.1 assumes both relative densities exist and is not applied to analytic-rank sets, whose limiting density is not known. For rational signed squarefree d, each compatible nonempty finite local rectangle has positive density; finite unions have the sum of their disjoint masses. The modulus-three residue count gives the mass 3/8 for a fixed nonsquare unit class. The limiting denominator is positive before any conditional proportion is formed.

### From TauCetiRoadmap.ArithmeticStatisticsPartVI

The supporting “Heegner logarithm and low rank” supplies, for every E/ℚ with the modular comparison data, analytic rank zero or one ⇒ that Mordell–Weil rank and finite whole Sha. The supporting “Elliptic p-parity” supplies (−1)^corank=w(E) on that realization. These are used first on the known auxiliary twist and only after the converse on E itself. The root-number theorem is required even when the residual representation is reducible and at p=3.

What ArithmeticStatisticsPartVI must provide (gap:complementary-heegner-twists): For every rational elliptic curve and finite set of rational primes, prove both complementary imaginary-quadratic twist nonvanishing branches with those primes split, infinitely many odd fundamental discriminants below −4, and twist analytic order zero when the original root number is −1 and one when it is +1.

### From TauCetiRoadmap.ArithmeticStatisticsPartVII and TauCetiRoadmap.ArithmeticStatisticsPartIII

Part VII §5.10 supplies “Selmer ratio of an isogeny”, “Local Selmer ratio via Tamagawa numbers”, “Selmer ratio classes are locally defined”, the three-isogeny parity theorem and both restricted zero/one three-Selmer bounds. Their corrected rank is dim Sel₃−dim E(ℚ)[3]. On the admissible family the torsion term is exactly zero. By the Tamagawa formula of §5.10, at 3 the good ordinary ratio is |φ′(0)|₃⁻¹, equal to 1 or 3 according to the étale/connected kernel, and the two real signs give 1 and 1/3. Part VII §5.32 “Attainable local three-isogeny ratios” supplies the Kodaira/twist and differential tables and the existence, at every finite prime ℓ≠3 including ℓ=2, of a local quadratic twist with ratio 1 (BKLOS Propositions 10.1, 10.7 and Theorem 10.5, pp. 14–17; BKLOS line 644, line 681 and line 728). Section 5.10 supplies the ratio definition, the Tamagawa formula, the strata and the statistical bounds.

The Part VII means and low-Selmer proportions retain the seven-part counting condition C(F,ι,Σ) of Part III's “Windowed cubic counting contract”. The following rational instance supplies it for the unconditional endpoints here; a numerical average with C assumed does not discharge this contract.

What ArithmeticStatisticsPartIII must provide (gap:rational-three-isogeny-count): Prove the seven conditions C(ℚ,ι,Σ) for every rational three-isogeny and every nonempty finite-local-squareclass family and ratio stratum, for the isogeny and its dual, with the unweighted signed-squarefree height and the matched local mass normalizations.

### From TauCetiRoadmap.CMRankZeroConverse

Section C.0 “Rank-r p-converse” supplies the shared proposition: corank Sel_(p∞)(E/ℚ)=r implies analyticRank(E)=r. Use it with r=0,1; its shared name adds no hypothesis and is not defined a second time here.

## How to read the build

Layer 0 fixes the actual isogeny condition and compares low finite Selmer dimension with corank. Layer 1 selects a complementary twist and obtains corank one over K. Layer 2 keeps augmentation in the coefficient ring and proves nonzero bottom specialization. Layer 3 subtracts central orders, then imports the forward theorem for the arithmetic conclusions. Layer 4 applies the finite-Selmer result on the same admissible local families as the statistical bounds. Layer 5 computes the model, density and good-reduction obstruction that delimit those applications. The pairing enters the finite-Selmer branch; the p∞ converse uses its own control argument. Each target lists its statement inputs and the inputs to the indicated proof route separately enough that a different proof can replace that route.

## Layer 0: Fixed isogenies and low-dimensional Selmer groups

### 0.1 The fixed-isogeny converse hypotheses

Define the Eisenstein converse condition for (E,p,ι) to record precisely the good odd prime, the actual rational cyclic degree-p isogeny and the local exclusion in the standing hypothesis. The character is the Galois action on ker ι, not an arbitrarily selected semisimple constituent. Use the supplier isogeny, residual-character, reduction and conductor carriers; this is a Prop-valued hypothesis bundle, not a second elliptic-curve structure. Witness equality is inherited from proof irrelevance; no separate extensionality theorem is needed.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹.

Its required API is:

- For fixed E,p,ι, proofs that p is prime and odd, E is good at p, ι is rational cyclic of degree p, and its actual kernel character avoids 1 and ω locally construct the Eisenstein converse condition for (E,p,ι). No freely chosen residual character is an extra field.
- The prime p is greater than 2, E has good reduction at p, and degree(ι)=p.
- ker ι has character φ, ψ=ωφ⁻¹, and φ|G_p is neither 1 nor ω.
- The dual isogeny E′→E satisfies the same local exclusion; good reduction is preserved under isogeny.
- An isomorphism of rational isogeny diagrams transports the bundle and its actual kernel character.
- Transport along the identity isogeny diagram is the identity on the hypothesis bundle.
- Transport along a composite of rational isogeny-diagram isomorphisms equals successive transport, with the canonical identifications of kernel characters.

A proof route is to bundle the existing predicates and kernel-character equality. Import the Weil-pairing identity φψ=ω. Retain the actual isogeny throughout twisting and duality.

**Checks.**

- At p=3 a good ordinary kernel with nontrivial unramified quadratic character η is admitted; its dual has character ωη and is also admitted.
- The local characters 1 and ω are both rejected, including a good curve with a rational point of order p.
- A reducible residual action at a multiplicative prime, or any p=2, fails this bundle.
- A nonsplit residual extension with the permitted actual kernel is admitted; splitting E[p] as a Galois module is not required.
- Good ordinarity and E(ℚ_p)[p]=0 are consequences supplied by the local dictionary; no irreducibility or parity condition on φ at infinity is added.

(CGLS Introduction, standing hypotheses, pp. 518–521, and Theorem E, p. 522; Theorem 5.2.1, p. 574; CGLS line 73, line 205 and line 2027.)

*Needs:* EllipticCurves Layers 1–2, 4–5 and gap:eisenstein-local-dictionary.

### 0.2 A Selmer group of dimension zero or one

Under the Eisenstein converse condition, for r∈{0,1}, dim_𝔽p Sel_p(E/ℚ)=r implies corank_ℤp Sel_(p∞)(E/ℚ)=r. More precisely, E(ℚ)[p]=0 gives Sel_p≅Sel_(p∞)[p]; the latter dimension is corank Sel_(p∞)+2 dim_𝔽p M[p] for a finite p-group M from the paired elementary divisors of the nondivisible Sha part. No finiteness of the whole Sha group is assumed.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. Use cofinite generation of Sel_(p∞) and finite-level Kummer exactness. The Cassels–Tate result of SelmerIwasawaCohomology §4.29 is on Sha modulo its maximal divisible subgroup.

A proof route is to use the coefficient sequence E[p]→E[p∞] and rational p-torsion vanishing to identify the p-torsion Selmer group. Apply the supplier pairing with its divisible kernels to the finite nondivisible p-primary Sha quotient. Its paired elementary divisors contribute an even number to the p-torsion dimension; the divisible Selmer part contributes its corank. For r=0 or 1, nonnegativity in r=corank+2s forces s=0 and corank=r. This also shows the p∞ Selmer group is respectively zero or a divisible line.

**Checks.**

- A finite cyclic group of order p² has square order but cannot have a perfect alternating pairing; square order alone is not the needed argument.
- For a divisible line plus a paired finite part with dim M[p]=1, dim Sel_p=3 and corank=1; equality of dimension and corank is not asserted in higher dimension.

(CGLS Corollary 5.2.2 and preceding paragraph, p. 575; PS §1, p. 2 and Theorem 5, Corollaries 6–7, pp. 10–11, PS line 59 and line 403; CGLS line 2068.)

*Needs:* §0.1; SelmerIwasawaCohomology §§2.11–2.12a, 4.29; EllipticCurves Layer 7.

### Examples

At p=3, η(Frob₃)=−1 gives permitted pair (η,ωη); 1 and ω are rejected. For S=(ℚ₃/ℤ₃)^c⊕M⊕M with dim M[3]=s, dim S[3]=c+2s. The cases (c,s)=(0,0),(1,0),(1,1) give (dimension,corank)=(0,0),(1,1),(3,1). A cyclic group of order 9 has order 9 but only a zero alternating self-pairing, so square order does not replace paired elementary divisors. Identity and composable isomorphisms of isogeny diagrams transport the same kernel action, giving no extra choice of φ.

### Dependencies

EllipticCurves Layers 1–2, 4–5, 7; SelmerIwasawaCohomology §§2.11–2.12a, 4.29; native elliptic carriers.

## Layer 1: Complementary twists and Heegner fields

### 1.1 Auxiliary Heegner fields selected from Selmer parity

Under the Eisenstein converse condition, if corank Sel_(p∞)(E/ℚ)=r∈{0,1}, infinitely many K satisfy the displayed Heegner/split/discriminant conditions and analyticRank(E^K/ℚ)=1−r. In the r=1 case this means L(E^K,1)≠0; in the r=0 case it means a simple central zero of the twist. No analytic-rank assumption on E enters the choice.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. The rational Selmer corank is r=0 or r=1.

A proof route uses the local dictionary for ordinarity and the elliptic p-parity theorem to the weight-two realization, using the rational newform bridge and elliptic Kummer comparison: w(E)=(−1)^r. Apply the value branch of the complementary-twist supplier contract for w(E)=−1, and its derivative branch for w(E)=+1. In the finite splitting set include every prime dividing N and both 2 and p. The sign of the negative discriminant is correct in each branch; splitting at 2 makes it odd. Infinitude excludes D=−3,−4. Splitting at every level prime gives (D,N)=1 and the classical Heegner hypothesis.

**Checks.**

- The r=0 branch uses a simple-zero twist and the r=1 branch a nonzero-value twist.
- Every level prime is split. Skinner’s residual nonsplit-prime auxiliary field is a different input and cannot be substituted here.

(CGLS Proof of Theorem 5.2.1, pp. 574–575, conditions (a)–(d) and (d′); CGLS line 2033.)

*Needs:* §0.1; ArithmeticStatisticsPartVI “Elliptic p-parity” and gap:complementary-heegner-twists; EllipticCurveModularity R29.3–R29.6 and gap:quadratic-analytic-factorization.

### 1.2 The selected field has Selmer corank one

For E,p,r and any K selected in §1.1, corank_ℤp Sel_(p∞)(E/K)=1 and E(K)[p]=0. Thus the precise additional (Sel) hypothesis of CGLS Corollary 4.2.3 is satisfied before the Heegner main conjecture is applied.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. corank Sel_(p∞)(E/ℚ)=r∈{0,1} and analyticRank(E^K)=1−r.

A proof route is to apply the forward rank-at-most-one theorem only to E^K, whose analytic rank is already known. It gives its Mordell–Weil rank 1−r and finite Sha, hence that Selmer corank. Use the odd-primary quadratic Selmer decomposition to add the two coranks: r+(1−r)=1. Because p splits in K, its completions are ℚ_p. The imported local character exclusion kills local p-torsion and therefore E(K)[p].

**Checks.**

- Full Sha finiteness for E is not an input. The forward theorem is used on the twist at this point.

(CGLS Theorem 5.2.1 proof, pp. 574–575; CGLS line 2046.)

*Needs:* §1.1; ArithmeticStatisticsPartVI “Heegner logarithm and low rank”; SelmerIwasawaCohomology §§2.11–2.12a, 4.26, 4.28; §0.1.

### Examples

For r=0 the twist order is 1 and 0+1=1; for r=1 it is 0 and 1+0=1. The signs are respectively (w(E),w(Eᴷ))=(+1,−1) and (−1,+1), giving base-change sign −1. At each split place K_v=ℚ_p, so local p-torsion is zero on both completions. The quadratic projectors send the + and − eigenspaces to themselves with cross terms zero; this uses 2 invertible and preserves the corank sum.

### Dependencies

Layer 0; EllipticCurveModularity R29.3–R29.6; ArithmeticStatisticsPartVI supporting parity, forward and complementary-twist contracts; SelmerIwasawaCohomology §§2.11–2.12a, 4.26, 4.28.

## Layer 2: Augmentation control and the bottom Heegner point

### 2.1 Corank-one control at the augmentation prime

Under the Eisenstein converse condition and the Heegner conditions, suppose corank Sel_(p∞)(E/K)=1. Write Λ=ℤ_p⟦Γ⟧, P₀=(γ−1), M_E=T_pE⊗Λ∨ with inverse tautological action, T=M_E∨(1), S=H¹_FΛ(K,T), and X=H¹_FΛ(K,M_E)∨ in CGLS’s ordinary, self-dual convention. The Pontryagin-dual discrete control map has finite kernel and cokernel, so dim_ℚp((X/P₀X)⊗ℚ_p)=1. Together with the supplied rank-one pseudo-isomorphism X∼Λ⊕M⊕M, this gives length_(Λ_P₀)(X_tors,P₀)=0 and v_P₀(char X_tors)=0. Moreover the specialization S/P₀S→H¹_f(K,V_pE) is injective after inverting p.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. Use the exact ordinary local conditions and contragredient action in CGLS §3.4, not the torsion Greenberg dual X_E. Corank Sel_(p∞)(E/K)=1.

A proof route imports EulerSystemsAndKolyvaginSystems §8.31’s discrete augmentation control and corank-one consequence. The local dictionary gives good ordinarity and E(ℚ_p)[p]=0; splitting at p gives E(K)[p]=0, so every hypothesis of that control theorem is satisfied. Dualize and tensor ℚ_p to obtain the one-dimensional coinvariant quotient. Localize the supplied pseudo-isomorphism at P₀: pseudo-null errors disappear and Λ_P₀ is a DVR. A nonzero finite-length torsion summand has a nonzero residue quotient, whereas the free rank-one summand already accounts for the entire one-dimensional quotient. For compact specialization, use gap:cgls-ordinary-control of SelmerIwasawaCohomology §§3.9–3.11: the rationalized coefficient exact sequence and saturation of the ordinary local conditions identify the kernel with (γ−1)S[1/p]. The local-image and derived-control H²/Tor terms can contribute to the cokernel and are retained; no surjectivity is claimed.

**Checks.**

- X denotes the rank-one ordinary dual throughout; replacing it by the Λ-torsion X_E changes the argument.
- For R=Λ_P₀, X=R has coinvariant dimension 1 and torsion length 0; X=R⊕R/P₀R has coinvariant dimension 2 and torsion length 1, so corank one excludes it.
- Neither γ−1 nor P₀ is inverted. Finite p-power errors disappear after inverting p, which leaves P₀ available.
- For R=Λ_P₀ and k=R/P₀R, Tor₁^R(k,k)=k has dimension 1. An injective compact specialization therefore does not justify discarding the derived cokernel terms.

(CGLS §3.4, Corollary 3.4.2 and proof, p. 566; Theorem 5.2.1 proof, p. 574; CGLS line 1745.)

*Needs:* §1.2 for the selected-field application; EulerSystemsAndKolyvaginSystems §8.31 augmentation control and its corank-one consequence; SelmerIwasawaCohomology §§3.9–3.11 and gap:cgls-ordinary-control; HeegnerPointEulerSystems §§8.31, 8.34; PadicMeasuresIwasawaAlgebras Layer 4.

### 2.2 The bottom Heegner class and its normalization

Let κ∞ be the stabilized Heegner class used in CGLS Corollary 4.2.3, P_K=Tr_(K[1]/K)π(x₁), and α the p-adic unit root of X²−a_pX+p. Its bottom specialization is κ₀=u_K⁻¹(1−α⁻¹)²·Kummer(P_K) in H¹(K,V_pE), where u_K=#O_Kˣ/2=1 for D<−4. Import the Howard comparison pr_K(κ₁^Hg)=u_K α²(β−1)² κ₀ and equality of the two generated Λ-lines from HeegnerPointEulerSystems §8.13, with β=pα⁻¹. The additional conclusion here is that the traced factor u_K⁻¹(1−α⁻¹)² is a unit under the local exclusion; the Howard factor is a unit by the supplied comparison.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. Use the same modular parametrization π with π(∞)=O and ring-class trace in the class and the complex Gross–Zagier formula.

A proof route is to import the actual norm-compatible Heegner family and its Kummer/Shapiro map from HeegnerPointEulerSystems §§8.6–8.6a. At split p take the trace of (1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1]/u_K; the Artin actions disappear after the full ring-class trace. Use the supplied Howard comparison of HeegnerPointEulerSystems §8.13, retaining α, β and u_K. The trace calculation uses CGLS Remark 4.1.3, equation (4.4), with the Artin translates becoming equal after trace. Ordinarity and the two excluded residual factors imply a_p≠1 modulo p, hence α−1 is a unit; β is divisible by p and β−1 is a unit. The same comparison handles p dividing the ring-class number without division by that number.

**Checks.**

- Nonzero tower class alone does not imply nonzero bottom class; §2.1 and the equality are still required.
- The normalization uses (1−α⁻¹)² after the full trace; it is not the finite group-ring initial factor before trace.
- Translating π by a point Q changes the trace by h_KQ: for h_K=2 it adds 2Q. The requirement π(∞)=O excludes this change and fixes the point used by both comparisons.

(CGLS Remark 4.1.3, equations (4.4)–(4.5), pp. 568–569; CGLS line 1828.)

*Needs:* §0.1; HeegnerPointEulerSystems §§8.5–8.6a, 8.13, 8.24; EllipticCurves Layers 1, 7.

### 2.3 The Heegner point is non-torsion from corank one

Under the Eisenstein converse condition and the Heegner conditions, corank Sel_(p∞)(E/K)=1 implies that the specified classical trace point P_K has infinite order. In particular ord_(s=1)L(E/K,s)=1.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. The Heegner point, ordinary modules and stabilized class have the normalization fixed in §2.2.

A proof route is to apply the supplied CGLS prototype equality, including its explicit (Sel) hypothesis, to obtain char(X_tors)=char(S/Λκ∞)² in Λ[1/p], with S and X of Λ-rank one. §2.1 gives valuation zero on the left. At P₀ this equality forces S_P₀=Λ_P₀ κ∞. In particular κ∞ has nonzero image in (S/P₀S)⊗ℚ_p. Use the injective compact specialization map and the exact bottom factor to obtain Kummer(P_K)≠0, hence P_K is non-torsion. Use the existing canonical-height nonnegativity and zero-iff-torsion statements; number-field Northcott and the finite-fiber x-coordinate comparison discharge their finiteness hypothesis. Import GrossZagierAndArithmeticHeights §0.1’s pinned/Poincaré height normalization, which changes this height only by explicit positive factors. Apply the classical X₀(N) Gross–Zagier formula with all level primes split and nonzero normalization to get L′(E/K,1)≠0. Its root number is −1, so the order is exactly one.

**Checks.**

- A divisibility after inverting γ−1 cannot yield this conclusion. The equality is used at P₀ before specialization.
- Do not use the rank-one BSD control formula whose hypotheses already include Mordell–Weil rank one and finite Sha.
- At N=20 and D=−71, 2 and 5 split since D≡1 modulo 8 and D≡4 modulo 5; 3 also splits since D≡1 modulo 3. Here (N,D)=1, c=1 and u_K=1, so §8.19’s factor 2^(−μ(N,D)) is 1 and its coefficient is ‖ω_E‖²/(C²√71), the same as EffectiveClassNumbers §2.8. The squarefree-level hypothesis of §8.17 fails.

(CGLS Corollary 4.2.3, p. 570; Theorem 5.2.1 proof, p. 574; CGLS line 1891.)

*Needs:* §§2.1–2.2; HeegnerPointEulerSystems §§8b.2, 8b.10; PadicMeasuresIwasawaAlgebras Layer 4; GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.18, 8.19; native Northcott and canonical-height theorems; gap:quadratic-analytic-factorization.

### Examples

In R=ℚ₃⟦T⟧, X=R has coinvariant dimension 1 and torsion length 0, whereas X=R⊕R/(T) has dimension 2 and torsion length 1. For κ=T in S=R the tower element is nonzero but the bottom is 0, and char(S/Rκ)²=(T²), not the unit ideal. For the admissible twist of nineteen-a3, a₃=2, the unit root is α≡5 modulo 9 and β≡6 modulo 9. Thus (1−α⁻¹)²≡1 and α²(β−1)²≡4 modulo 9, both units; this distinguishes the two normalizations. With u_K=1 these are precisely the trace factors, and no 1/h_K is taken. For h_(O)(P)=1 the x-height is 2 and B_x(P,P)=2, preserving positivity in the Gross–Zagier comparison.

### Dependencies

Layers 0–1; EulerSystemsAndKolyvaginSystems §8.31 augmentation control; SelmerIwasawaCohomology §§3.9–3.11; HeegnerPointEulerSystems §§8.6–8.6a, 8.24, 8.31, 8.34, 8b.2, 8b.10; PadicMeasuresIwasawaAlgebras Layer 4; GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.18, 8.19; native height finiteness.

## Layer 3: The Eisenstein-prime converses

### 3.1 The Eisenstein-prime p-converse

Under the Eisenstein converse condition, for each r∈{0,1}, corank_ℤp Sel_(p∞)(E/ℚ)=r implies analyticRank(E)=r. Equivalently the shared CMRankZeroConverse §C.0 “Rank-r p-converse” holds for r=0 and r=1 under these hypotheses. The analytic rank is the order of the actual arithmetic L-function at 1.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. r is a natural number equal to 0 or 1.

A proof route is to choose K by §1.1 and establish its Selmer corank one by §1.2. Apply §2.3 to obtain analyticRank(E/K)=1. Use the supplied quadratic L-factorization and addition of central analytic orders: 1=analyticRank(E)+analyticRank(E^K). Subtract the already known complementary twist order 1−r.

**Checks.**

- For r=0 the conclusion is L(E,1)≠0; for r=1 it is a simple zero.
- There is no squarefree-conductor, residual irreducibility, large-p or extra global parity assumption on the kernel character.

(CGLS Theorem 5.2.1, pp. 574–575; CGLS line 2027.)

*Needs:* §§1.1–1.2, 2.3; gap:quadratic-analytic-factorization; CMRankZeroConverse §C.0 “Rank-r p-converse”.

### 3.2 Arithmetic rank equality and finite Sha

Under the Eisenstein converse condition and corank Sel_(p∞)(E/ℚ)=r∈{0,1}, rank_ℤ E(ℚ)=analyticRank(E)=r and Sha(E/ℚ) is finite as a whole group. This conclusion is stronger than finiteness of only Sha[p∞], but it asserts no BSD leading-coefficient or p-valuation identity.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. corank Sel_(p∞)(E/ℚ)=r∈{0,1}.

A proof route is to first apply the p-converse to establish analytic rank r. Apply the existing forward analytic-rank-at-most-one theorem over ℚ. Its separate outputs give the rank and full Sha finiteness.

**Checks.**

- Sha finiteness is an output reached after the analytic converse. It is never an assumption on E.

(CGLS Theorem 5.2.1, p. 574, final conclusions; CGLS line 2030.)

*Needs:* §3.1; ArithmeticStatisticsPartVI “Heegner logarithm and low rank”.

### 3.3 The finite-Selmer converse

Under the Eisenstein converse condition, if dim_𝔽p Sel_p(E/ℚ)=r∈{0,1}, then analyticRank(E)=rank_ℤ E(ℚ)=r and Sha(E/ℚ) is finite.

E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. The finite-level Selmer group uses the Kummer local conditions, not a chosen abstract F_p-vector space.

A proof route is to use §0.2, including the Cassels–Tate modulo-divisible pairing, to obtain the correct p∞ corank. Apply §3.1 and §3.2.

**Checks.**

- A one-dimensional Sel_p does not give corank one by the coefficient identification alone; the paired finite-part argument is essential.
- The theorem includes p=3. It does not import Skinner’s p≥5, irreducible residual localization criterion.

(CGLS Corollary 5.2.2, p. 575; CGLS line 2071.)

*Needs:* §0.2; §§3.1–3.2; SelmerIwasawaCohomology §4.29.

### Examples

Subtract complementary orders only for r=0 or 1: 1−1=0 and 1−0=1. The torsion-free finite-Selmer cases have dimensions 0 and 1 and the same coranks by §0.2. A divisible Sha line has corank 1 despite no nondivisible finite part; it cannot be discarded before the converse. The forward theorem is applied after analytic order is known and gives finiteness of all prime-primary Sha groups together with finite total Sha, rather than inferring total finiteness from a single p-primary group.

### Dependencies

Layers 0–2; CMRankZeroConverse §C.0; EllipticCurveModularity R29.6 quadratic analytic factorization contract; ArithmeticStatisticsPartVI forward theorem.

## Layer 4: Admissible quadratic twists and positive proportions

### 4.1 The admissible three-isogeny twist family

Fix an actual rational cyclic 3-isogeny ι:E→E′ with kernel character φ. Inside the existing unweighted family ℚˣ/ℚˣ² set A₃(E,ι)={d : E^d has good reduction at 3 and (φχ_d)|G₃∉{1,ω}}. Here χ_d is the quadratic character of ℚ(√d), and the twisted isogeny has kernel character φχ_d. Count each squareclass once through its unique nonzero signed squarefree integer representative, ordered by |d|. A₃ is determined solely by its allowed local squareclasses at 3.

E/ℚ is elliptic and ι is an actual degree-3 isogeny. No existence of a good-at-3 twist is built into the definition.

Its required API is:

- Membership is exactly good reduction at 3 plus the displayed restricted kernel-character exclusion.
- Replacing d by d·u², u∈ℚˣ, preserves membership and the associated isogeny diagram up to isomorphism.
- For a fixed initial twist d₀, d∈A₃(E^d₀,ι^d₀) iff d₀d∈A₃(E,ι). This is a squareclass bijection; no height-preservation assertion is made.
- The dual isogeny on E′ gives the same admissible squareclasses, using ψχ_d=ω(φχ_d)⁻¹ and isogeny invariance of good reduction.
- A₃ is the inverse image of a subset of the four local squareclasses ℚ₃ˣ/ℚ₃ˣ².
- For every squareclass d, d∈A₃(E,ι) iff the Eisenstein converse condition for (Eᵈ,3,ιᵈ). This supplies the hypothesis bundle used by the finite-Selmer converse directly from family membership, and conversely constructs membership from the bundle.

A proof route is to pull back the good-reduction and local-character conditions along localization ℚˣ/ℚˣ²→ℚ₃ˣ/ℚ₃ˣ². Use supplier quadratic twisting and the existing squareclass-height family. Good reduction and the local kernel character depend only on the local isogeny diagram, so the subset is independent of representatives.

**Checks.**

- For good ordinary E at 3 whose isogeny kernel is generated by a rational point of order 3 (φ|G₃=1), local classes represented by 1,2,3,6 have exactly the class 2 admissible: class 1 fails exclusion, class 2 gives the unramified character η, and classes 3,6 fail good reduction. Every rational isogeny has a Galois-stable kernel, so this pointwise-rational hypothesis is what separates the case from the Check below with φ|G₃ nontrivial unramified, where class 1 is the admissible one.
- For that E the signed squareclasses of 2 and 18 are equal and both admissible; counting both as distinct is rejected.
- If v₃(j(E))<0 then A₃(E,ι) is empty, regardless of its residual character twists.
- If E is good ordinary and φ|G₃ is nontrivial unramified, the identity squareclass is admissible and the unramified nonsquare twist becomes excluded. The rule d≡2 mod 3 is not universal.
- The family includes good reduction as well as the character exclusion. A rational 3-isogeny alone does not imply it is nonempty.

(CGLS Corollary 5.2.3 and proof, p. 575; BKLOS §2, family and height conventions, pp. 2–3; BKLOS line 90.)

*Needs:* §0.1; EllipticCurves Layers 2, 4–5 and gap:eisenstein-local-dictionary; ArithmeticStatisticsPartI §0.2 family defined by local conditions and §0.5 quadratic twist squareclass family.

### 4.2 Positive Selmer-ratio strata within the admissible family

Suppose E/ℚ has a rational 3-isogeny and at least one quadratic twist with good reduction at 3. For the fixed isogeny write T_m={d:c(ι^d)=3^m} using the signed convention. Then A₃∩T₀ and A₃∩(T₁∪T₋₁) each contain a nonempty finite-local-condition family and have positive density among all signed squarefree parameters ordered by |d|.

ι:E→E′ is a rational cyclic 3-isogeny. There exists d₀ with E^d₀ good at 3. No explicit numerical lower density independent of E is asserted.

A proof route first fixes at 3 a local squareclass d₀u for which the twist is good ordinary and the kernel character is allowed: among the two unramified twists of a good model exactly one avoids both 1 and ω. This also kills local 3-torsion on the chosen twists of E and E′. Use the existing local Selmer-ratio formula: at 3 the good-model ratio is 1 or 3, depending on whether the kernel lies in the formal group. It stays fixed on this chosen local class. At each bad prime ℓ≠3, and at ℓ=2, choose a local twist with c_ℓ=1 by ArithmeticStatisticsPartVII §5.32 “Attainable local three-isogeny ratios” (BKLOS Proposition 10.7); outside the finite set of primes dividing 6N every twist has ratio 1. Include 2 in the finite local prescription even when E is good there. At the real place the two signs give ratios 1 and 1/3. Hence the two choices give global ratios (1,1/3) or (3,1), providing both the zero and an odd signed stratum while preserving the chosen 3-adic class. Weak approximation (GlobalNumberFields Layer 1, through Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`) realizes each finite prescription at the places dividing 6N and at ∞ by an element of ℚˣ. Passing to its signed squarefree representative d preserves every local squareclass and sign, so each prescribed rectangle is compatible and nonempty. Apply the rational squarefree local-density count with its nonuniform local squareclass masses to obtain positive density. The argument is directly on E’s family; translating by d₀ is not assumed to preserve height.

**Checks.**

- The local class at 3 is fixed before applying statistics, and cannot be changed independently after selecting a Selmer-rank set.
- If the finite-place ratio is 1, the odd stratum obtained is T₋₁; if it is 3, it is T₁. Both are covered by the absolute-ratio-one bound.
- For nineteen-a3, prescribe class 2 at 3, the trivial class at 2 and 19, and negative real sign. The signed squarefree d=−31 realizes all four: d≡2 modulo 3, d≡1 modulo 8 and d≡7≡8² modulo 19. For the positive sign, d=137 has residues 2 modulo 3, 1 modulo 8 and 4≡2² modulo 19. These test simultaneous finite-place and real approximation.

(BKLOS Proposition 10.1, p. 14; Theorem 10.5, pp. 15–16; Proposition 10.7, p. 17; §11 proof of Theorem 2.6, p. 18; CGLS Corollary 5.2.3 proof, p. 575; BKLOS line 762.)

*Needs:* §4.1; GlobalNumberFields Layer 1 via Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; ArithmeticStatisticsPartVII §5.10 local Selmer ratios and stratum density and §5.32 “Attainable local three-isogeny ratios”; ArithmeticStatisticsPartI §0.2 family defined by local conditions and §0.15 positive squareclass denominator; gap:eisenstein-local-dictionary.

### 4.3 Analytic-rank bounds in prescribed admissible families

Let Σ⊂A₃ be a nonempty family defined by finitely many local conditions. Put Σ₀=Σ∩T₀ and Σ₁=Σ∩(T₁∪T₋₁). For either nonempty stratum, the lower proportion within Σ₀ of twists with analytic rank and Mordell–Weil rank 0 and finite Sha is at least 1/2, and the lower proportion within Σ₁ with both ranks 1 and finite Sha is at least 5/6. Relative to all signed squarefree twists these give lower bounds (1/2)μ(Σ₀) and (5/6)μ(Σ₁), with μ the same height density.

ι:E→E′ is a rational cyclic 3-isogeny. The finite local prescriptions defining Σ are globally compatible. Each displayed conditional proportion is asserted only when its denominator stratum is nonempty.

A proof route is to import ArithmeticStatisticsPartVII §5.10’s restricted-family 3-Selmer-rank-zero and rank-one bounds, with their signed/absolute ratio convention. For d∈A₃ the local exclusion gives E^d(ℚ)[3]=0, so the supplier’s adjusted 3-Selmer rank equals the actual F₃ dimension. Apply §3.3 to the zero- and one-dimensional subsets. Let B₀⊆Σ₀ be the twists in Σ₀ with both ranks 0 and finite Sha, and B₁⊆Σ₁ the rank-one analogue. Since B₀ contains the d∈Σ₀ with r₃(E^d)=0, r_X(B₀ | Σ₀) is at least the supplier's rank-zero proportion at every cutoff, so its lower limit is at least 1/2; likewise for B₁ with 5/6. For the absolute bounds, B_i⊆Σ_i gives r_X(B_i | all)=r_X(B_i | Σ_i)·r_X(Σ_i | all) at every cutoff, both sides vanishing when Σ_i has no element of height at most X. Both factors lie in [0,1], and r_X(Σ_i | all)→μ(Σ_i) because Σ_i is a finite union of local-condition families (ArithmeticStatisticsPartVII §5.10 “Selmer ratio classes are locally defined”). Mathlib's `le_liminf_mul` then gives liminf r_X(B_i | all)≥(liminf r_X(B_i | Σ_i))·μ(Σ_i). No limiting density of B_i is asserted or used, and the tower theorem of ArithmeticStatisticsPartI §0.1, which assumes both limits, is not invoked.

**Checks.**

- Keep the Σ₀ and Σ₁ denominators, and multiply by their actual densities before reporting percentages among all twists.
- These are lower proportions, not exact Goldfeld densities or percentages for the original unrestricted ratio strata.
- If r_X(B₀ | Σ₀) alternates between 1/2 and 1 along successive cutoff blocks and μ(Σ₀)=1/8, B₀ has no relative density in Σ₀, so a tower theorem requiring two limits does not apply; the lower-limit product still gives absolute lower proportion at least (1/2)(1/8)=1/16, and on the odd stratum with μ(Σ₁)=1/4 it gives (5/6)(1/4)=5/24.

(BKLOS Theorem 2.5, p. 4; §9.1–§9.2, p. 14; CGLS Corollaries 5.2.2–5.2.3, p. 575; BKLOS line 624.)

*Needs:* §4.1; §3.3; ArithmeticStatisticsPartVII §5.10 restricted zero/one three-Selmer bounds and locally defined ratio classes; ArithmeticStatisticsPartI §0.1 relative density; Mathlib `le_liminf_mul`; ArithmeticStatisticsPartIII gap:rational-three-isogeny-count.

### 4.4 Positive proportions of rank-zero and rank-one twists

Let E/ℚ admit a rational cyclic 3-isogeny and at least one quadratic twist with good reduction at 3. Among the distinct nonzero signed squarefree integers d ordered by |d|, a positive lower proportion have rank E^d(ℚ)=analyticRank(E^d)=0 and finite Sha(E^d/ℚ), and a positive lower proportion have the analogous rank-one conclusion.

Existence of a good-at-3 twist is an explicit hypothesis. The family is the unweighted squareclass family, not discriminants ordered by their absolute value or minimal curves ordered by naive height.

A proof route is to use §4.2 to find positive-density finite-local-condition families in the two relevant admissible strata. Apply §4.3 and multiply their positive densities by 1/2 or 5/6. These products are strictly positive.

**Checks.**

- No analytic-rank conclusion is claimed for the complement of A₃ by this argument. No result about density one-half for either rank is asserted.

(CGLS Corollary 5.2.3, p. 575, with the good-at-3 scope made explicit; BKLOS Theorems 2.5–2.6, pp. 4–5; §11, p. 18; CGLS line 2078.)

*Needs:* §§4.2–4.3; ArithmeticStatisticsPartI §0.5 quadratic twist squareclass family.

### Examples

With the fixed admissible local class at 3, finite-place ratio 1 gives global ratios 1 and 1/3 as the real sign varies; finite-place ratio 3 gives 3 and 1. On the zero stratum an even nonnegative Selmer-rank variable of mean at most 1 has mass at zero at least 1/2. On an odd stratum, 1·q+3(1−q)≤4/3 forces q≥5/6. If μ(Σ₀)=1/8 and μ(Σ₁)=1/4, the absolute lower bounds are 1/16 and 5/24. An empty denominator gives no conditional assertion. The local masses remain (3/8,3/8,1/8,1/8), not four equal quarters.

### Dependencies

Layers 0, 3; GlobalNumberFields Layer 1 via Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; EllipticCurves Layers 2, 4–5; ArithmeticStatisticsPartI §§0.1, 0.2, 0.5, 0.15; ArithmeticStatisticsPartVII §§5.10, 5.32; Mathlib `le_liminf_mul`; ArithmeticStatisticsPartIII rational counting contract.

## Layer 5: Concrete models and scope diagnostics

### 5.1 The nineteen-a3 Weierstrass model

Define the nineteen-a3 model on WeierstrassCurve ℚ by (a₁,a₂,a₃,a₄,a₆)=(0,1,1,1,0), so its equation is y²+y=x³+x²+x. This is only a concrete diagnostic model on the existing carrier; it introduces no database label, elliptic-curve type or new twist operation.

The model is over ℚ. Its nonzero discriminant is a theorem, not a data placeholder.

Its required API is:

- The five coefficients are exactly (0,1,1,1,0).
- Δ=−19, c₄=−32 and c₆=8.
- The model is elliptic over ℚ because its discriminant is a nonzero rational number.
- For any IsElliptic instance its existing Mathlib j is 32768/19.
- For every unital ring homomorphism f:ℚ→+*F into a commutative ring, coefficientwise base change gives the same five integer coefficients in F; this does not posit a map ℚ→𝔽₃.

A proof route is to fill the five existing coefficient fields and compute with the existing invariant formulas.

**Checks.**

- The existing discriminant formula gives −19, not +19 or −19².
- Reducing the integral coefficient tuple modulo 3 gives an equation over F₃ with affine point count 5; adding infinity gives 6 and a₃(Frobenius)=−2. The coefficient a₃ of the equation remains 1.
- The native trace-zero norm-−2 twist of the nineteen-a3 model has discriminant −19·8⁶. Its squareclass is 2; the raw discriminant does not equal −19·2⁶ without a change of variables.
- At the point (0,0) the tangent is y=x, and substitution gives x³=0. The point is a nonidentity rational point of order 3.
- The coefficient a₂ is 1 and a₃ is 1. Replacing this by a short Weierstrass equation changes both the model and the tests.

(CGLS Remark 5.2.4, p. 575; CGLS line 2092.)

*Needs:* Mathlib Weierstrass invariants and coefficientwise map; Tau Ceti quadraticTwistOf and its discriminant formula; EllipticCurves Layer 1 for the flex/order-three interpretation.

### 5.2 The actual local family for nineteen-a3

For the nineteen-a3 model with the cyclic isogeny generated by P=(0,0), the admissible signed squarefree parameters are exactly d≡2 modulo 3. Their density among all signed squarefree d ordered by |d| is 3/8. In particular a rank-one analytic subset obtained solely by §3.3 at p=3 inside this family has upper density at most 3/8 in the full family; the number 41.6% cannot be obtained by that restricted conversion.

Use the exact model, its actual rational kernel P, and signed squarefree parameters. This statement puts no upper bound on the actual full rank-one twist set.

A proof route is to compute Δ=−19, hence good reduction at 3. Count six points on E(F₃), giving a₃=−2 and ordinary reduction; the tangent calculation certifies P has order 3, so φ is trivial. The two unit squareclasses at 3 preserve good reduction, but only the nonsquare unit changes the local kernel character to the allowed nontrivial unramified one. The ramified squareclasses have bad reduction. Thus membership is precisely 3∤d and d mod 3=2. Apply the existing squarefree coprime-residue count with modulus 3 separately to positive and negative parameters. The count of 3∤d is 3/4 of all squarefree parameters, and each unit residue accounts for half of it: density 3/8. Any subset of this admissible family has upper density at most 3/8. For valid analytic lower bounds use the intersections with T₀ and T₁∪T₋₁ from Layer 4; no unrestricted numerical percentages are transferred.

**Checks.**

- The density is 3/8 in signed squarefree parameters, not 1/2 from uniform weighting of the two unramified local classes.
- P=(0,0) is a point distinct from the group identity at infinity.
- The diagnostic rejects the proposed argument for the published percentages; it does not disprove those percentages for the full twist family.

(CGLS Remark 5.2.4, p. 575; BKLOS §2, pp. 2–5; §9.2, p. 14; CGLS line 2086.)

*Needs:* §5.1; §§4.1, 4.3; EllipticCurves Layers 1–2, 4–5 and gap:eisenstein-local-dictionary; ArithmeticStatisticsPartI §0.6 squarefree residue counts and §0.1 relative density.

### 5.3 A three-isogeny does not guarantee a good-at-three twist

The rational Weierstrass curve W:y²+xy+3y=x³ has a rational cyclic 3-isogeny, but no quadratic twist has good reduction at 3. Indeed (0,0) has order 3, Δ(W)=−2160, c₄(W)=−71, and j(W)=357911/2160 has 3-adic valuation −3. Every quadratic twist has the same j; good reduction would make j integral. Thus A₃(W,ι)=∅.

W has coefficients (1,0,3,0,0) over ℚ and ι is the isogeny with kernel generated by (0,0).

A proof route is to observe that the tangent at (0,0) is y=0; its intersection with the cubic has multiplicity 3, proving the nonidentity point has order 3. Use upstream quotient-by-stable-kernel to obtain the actual isogeny. Compute the invariant formulas and v₃(j)=−3. Use existing twist invariance of j and the local integral-j consequence of good reduction to exclude every twist. Apply the definition of A₃. This is a counterexample to the claim that the converse method’s good-reduction hypotheses can always be reached by quadratic twisting, not to the full printed analytic density conclusion by other methods.

**Checks.**

- Twisting can change the residual kernel character, but it cannot change j or make a negative valuation integral.

(CGLS Corollary 5.2.3 proof, p. 575; standing good-reduction hypothesis, p. 518; CGLS line 73 and line 2078.)

*Needs:* §4.1 for the empty-admissible-set interpretation; native Weierstrass invariants, quadraticTwistOf, minimal and HasGoodReduction; EllipticCurves Layers 1, 4–5 for the quotient isogeny and integral-j consequence.

Define the obstruction model W on the native rational Weierstrass carrier `WeierstrassCurve` ℚ by the five coefficient fields (1,0,3,0,0). It is a diagnostic model, not a headline object. Its required API is:

- Its five coefficient projections have those values, and Δ=−2160 proves ellipticity over ℚ.
- Its c₄ and c₆ values are −71 and −1837; the native j equals 357911/2160.
- Coefficientwise base change to ℚ₃ gives the same integral tuple; a nonzero raw twist has the same j after minimalization.

**Checks.**

- At (0,0) the y-partial is 3 and the x-partial is 0, giving tangent y=0; substituting gives x³=0, whereas the zero point at infinity is a different point.
- The denominator 2160=2⁴·3³·5 is nonzero in ℚ and ℚ₃. Its 3-valuation is 3, while 71³=357911 has valuation 0, giving −3 rather than +3.
- d=0 gives discriminant parameter 0 and a singular raw equation, so it is excluded from quadratic twisting. For d=1 and d=3 the raw discriminant valuations are respectively 3 and 9; j has valuation −3 in both cases.

Prove the obstruction in its local form for every d∈ℚ₃ with d≠0: the minimal model over ℤ₃ (`WeierstrassCurve.minimal`) of the trace-zero, norm-−d native twist of W base-changed to ℚ₃ fails `WeierstrassCurve.HasGoodReduction`. This scope diagnostic is a negative control for the good-at-three-twist hypothesis of §§4.2–4.4, not a headline theorem. It includes every rational quadratic twist, and tests the curve after minimalization rather than inferring curve reduction from a raw discriminant (CGLS Corollary 5.2.3 proof, p. 575, CGLS line 2078; the displayed invariant and valuation computation).

### Examples

For the nineteen-a3 integral tuple, x=0,1,2 in 𝔽₃ gives respectively 2,2,1 affine y-solutions, hence 6 points including infinity and 4−6=−2 for the Frobenius trace. The tangent y=x at (0,0) gives the residual cubic x³, so the nonidentity flex has order 3. For W:y²+xy+3y=x³ the tangent is y=0 and gives the same x³. Its invariants are Δ=−2160, c₄=−71, c₆=−1837 and j=357911/2160. Since v₃(357911)=0 and v₃(2160)=3, v₃(j)=−3. Multiplying by the twist factors (4d)⁶ in Δ and (4d)² in c₄ cancels in j, so no nonzero local twist can have integral j. For nineteen-a3 the local unit mass is 3/4 and the allowed half is 3/8; consequently every subset of its admissible conversion set has upper density at most 37.5%.

### Dependencies

Layer 4; native Weierstrass invariants, twists and minimal-model reduction; EllipticCurves Layers 1–2, 4–5; ArithmeticStatisticsPartI §§0.1, 0.5, 0.6.

## Downstream consumers

The finite-Selmer converse supplies analytic rank, arithmetic rank and finite Sha for admissible local three-isogeny families. Applications using a different ordering must supply its exact denominator comparison. The p∞ converse applies directly to corank zero and one without the finite-Selmer statistical input. The CM and irreducible-residual converse branches retain their own hypotheses and proof routes.

## Worked examples

The nineteen-a3 family has admissible signed squarefree parameters exactly d≡2 mod 3 and mass 3/8. The analytic lower bounds supplied by this roadmap are (1/2)μ(A₃∩T₀) and (5/6)μ(A₃∩(T₁∪T₋₁)), or the corresponding bounds on specified finite local subfamilies. Their numerical values are not obtained by replacing these intersections with unrestricted Selmer-ratio strata. The 41.6% and 25% analytic conversions in CGLS Remark 5.2.4, p. 575 (CGLS line 2086), require this compatibility; the first percentage exceeds the 37.5% ceiling on the admissible conversion set itself. This observation concerns the stated conversion, not an upper bound on the full analytic rank-one set.

The curve y²+xy+3y=x³ has a rational cyclic three-isogeny and no quadratic twist good at 3, by §5.3. Thus the positive-proportion theorem here retains the good-at-three-twist hypothesis. The unrestricted analytic density assertion of CGLS Corollary 5.2.3 is not an endpoint proved by this method for that curve (CGLS p. 575, line 2078). The distinction keeps good reduction throughout the use of the converse and does not impose a good-prime restriction on the generic local or Selmer theories supplied to it.

## References

All locators refer to the linked legal author copies. Line locators count newline-separated lines in the `pdftotext -layout` extraction of each linked PDF; theorem numbers and printed pages identify the same passages independently. Statements and diagnostic calculations above are written in this roadmap's own words.

- **CGLS.** Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Inventiones Mathematicae 227 (2022), 517–580, DOI 10.1007/s00222-021-01072-y. Published pagination: standing hypotheses pp. 518–521; §3.4 pp. 564–566; §4.1 pp. 566–569; §4.2 pp. 569–570; §5.2 pp. 573–575. CGLS line 73, line 1745, line 1828, line 1891 and line 2027.
- **BKLOS.** Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman, [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf), Duke Mathematical Journal 168 (2019), 2951–2989. Locators use the 25-page author version: §2 pp. 2–5, §9 pp. 13–14, §10 pp. 14–17, §11 p. 18. BKLOS line 149, line 612, line 624, line 681 and line 762.
- **PS.** Bjorn Poonen and Michael Stoll, [The Cassels–Tate pairing on polarized abelian varieties](https://math.mit.edu/~poonen/papers/sha.pdf), Annals of Mathematics 150 (1999), 1109–1149. Locators use the 32-page author version with its 2014 correction: §1 p. 2, §2 pp. 3–4, Theorem 5 and Corollaries 6–7 pp. 10–11, Theorem 8 and Corollary 9 pp. 11–12. PS line 59, line 118 and line 403. Corollary 9's finite-group hypothesis is not an assumption of the converse; the supplier applies the pairing after quotienting divisible subgroups.
