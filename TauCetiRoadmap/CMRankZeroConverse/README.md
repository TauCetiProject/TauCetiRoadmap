# Roadmap: cm rank-zero converses and twist nonvanishing

**Summary.** This roadmap develops the all-prime rank-zero converse: for a CM newform of even weight k≥2, vanishing of the central Bloch–Kato Selmer space forces a nonzero central L-value; for an elliptic curve over its imaginary quadratic CM field, zero p∞-Selmer corank forces analytic rank zero, for every prime p and every CM order. Rational Poitou–Tate produces a global cohomology line, central specialization of the actual Beilinson–Kato class produces its basis, and explicit reciprocity detects the L-value. Applications give exact half-density for congruent-number twists in two orderings and lower proportion at least one half for CM twists and for their non-descending members. (BT, Theorems 1.1–1.2, Proposition 1.3 and Theorem 3.1, pp. 1–2, 5–7; BT lines 39, 50, 58, 224, 277.)

## Scope and ownership

This roadmap owns the converse deduction, its central specializations, the two rational CM doubling identities, the analytic twist applications, the explicit cube-sum model comparison, and the descent-coset theorem. Its elementary sign and proposition definitions are local conventions, not new realizations or new Selmer theories. The rank-r p-converse proposition has this owner and is consumed by RankZeroOneBSDPartII; RankOneConverse owns its rank-one results.

The general cohomological realization and conjugate-dual dictionary are stated by AutomorphicGaloisRepresentations §§1.5, 4.4–4.8, 6.4 and 7.2. They are consumed here at the centre, rather than constructed again. KatoEulerSystems §§4.4, 4.6, 5.1, 5.3 and 7.2 own the actual zeta morphism, independent Iwasawa module structure, general twist compatibility, interpolation and the cohomological bound, with the full-range zeta contract specified below. ModularIwasawaMainConjectures §§0.6–0.7 own the rational Kato equality as a proposition and its lattice independence. SelmerIwasawaCohomology §§2.10–2.12a, 2.15, 3.0, 3.6, 3.10, 3.13–3.16, 4.9 and 4.26 own coranks, the unramified finite condition away from p, semilocal cohomology, the completed cyclotomic algebra interface, derived control and the finite Kummer comparisons. ArithmeticGaloisDuality §§R02.4.3–R02.4.4 and D7.3–D7.7 own duality and Shapiro. PadicHodgeRegulators §§1.1–1.8 own the Bloch–Kato maps and their general dimension formulas. PadicMeasuresIwasawaAlgebras §§4.3 and 4.6 own the regularity, height-one primes and character idempotents of one-variable Iwasawa algebras.

ArithmeticStatisticsPartI §§0.1–0.2, 0.5–0.7 and 0.15 own families, relative density, squareclass height, finite support-ideal fibres, squarefree denominators, the general piecewise height comparison and the positive linear squareclass denominator. In particular its §0.1 already includes the weights 3 and 6 for the congruent-number discriminant comparison. The application here uses that comparison with the analytic nonvanishing subset. ArithmeticStatisticsPartVII §§5.9–5.11 own the statistical corank inputs and the maximal-order CM reduction; their unconditional endpoints required here are specified below. No probability distribution, three-isogeny average or squarefree counting theory is reconstructed here. GL2AutomorphicRepresentationsAndTransfer §R17.4.16 owns quadratic automorphic induction and its full L-function identity. ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, 4.1–4.2 own the CM self-twist, coefficient components, theta induction and full factors, together with the extensions specified below. ModularIwasawaMainConjecturesPartII §§CZ.4–CZ.6 owns the full rational cyclotomic CM equality and its normalization dictionary; the anticyclotomic theories of NonordinaryCMSpecialValues and InertAnticyclotomicCMMainConjecture supply different main-conjecture statements.

The five-coefficient curve, discriminant, ellipticity, j-invariant and base change are already in the library: Mathlib's `WeierstrassCurve`, `WeierstrassCurve.Δ`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `WeierstrassCurve.map`. Tau Ceti supplies `WeierstrassCurve.shortCurve`, `WeierstrassCurve.quadraticTwistOf` and changes of variables, including fourth- and sixth-power scaling between short forms. EllipticCurves Layers 1, 2, 5 and 7 own general isogenies, Tate modules, pointed-twist classification and the classical Kummer Selmer groups; isogeny invariance of the p∞ Selmer corank at every prime follows from SelmerIwasawaCohomology §4.26. AlgebraicCurves Layer 10 owns plane-curve function fields and their degree-one places, including the general pointed comparison specified below. Only the explicit cube-sum substitutions, CM-specific applications and descent-coset bound remain here. The native endomorphism ring is `TauCeti.Isogeny.Hom` with its ring instance in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean`; this roadmap specializes that ring to the cube-sum model. Mathlib's `WeierstrassCurve.LFunction` supplies the multiplicative L-series coefficients and `WeierstrassCurve.LSeries` their total Dirichlet series. Agreement with it on Re(s)>3/2 specifies the unique entire continuation and makes the elliptic analytic headlines statable. EllipticCurveModularity §R29.6 supplies the continuation theorem. The newform analytic function, finite analytic order, Euler product and Fricke functional equation are supplied by the pinned Mathlib and Tau Ceti declarations below.

The five headline signatures in [Suggested.lean](Suggested.lean) are the three congruent-number limits, CM twist nonvanishing and non-descending nonvanishing. The cube-sum full-CM theorem verifies the geometric input to the cube-sum application; the two-coset theorem and descent count supply the non-descending proportion. The newform and elliptic converse end theorems lack the carriers specified in the module docstring. The definition `squareclassHeight` restates ArithmeticStatisticsPartI §0.5's squareclassHeight for every number field K; this local copy is needed only to state the headline theorems against the pinned imports. Its height and counting theory retain that supplier as their owner. Sign identities, discriminant identities, API facts and Checks stay in this README.

## Conventions

A newform is a normalized nonzero cuspidal newform of level N≥1, weight k≥2 and coefficient field F. For the central argument k is even, h=k/2, p is any rational prime, λ|p, E=F_λ and O is its integer ring. The native newform carrier has integral weight; a natural even k is cast to that weight. Set M_f=ρ_f^∨ in Kato's cohomological normalization, W=M_f(h), and W′=W^∨(1), the h-th Tate twist of the realization attached to f*, where f* has complex-conjugate Fourier coefficients. Geometric Frobenius on M_f at good ℓ≠p has polynomial `X^2 - a_l X + eps(l) l^(k-1)`. At weight two, M_f(1)=ρ_f^∨(1)≅ρ_(f*), rather than M_f, is a Tate-module component: through the Weil pairing it is the λ-component of the rational Tate module V_p(A_f) of the modular abelian quotient A_f, with complex-conjugate coefficient action. It is two-dimensional over E, so it is the Tate module of a whole modular Jacobian only when that Jacobian is one-dimensional, as at level 11; when f has rational coefficients and trivial character it is V_p of the attached elliptic curve. These are specializations of the supplied realization dictionary. (Kato (14.10.1)–(14.10.5), pp. 240–241; Kato lines 4793–4812; Kato §6.3, p. 161, Kato lines 1750–1756, for the two-dimensional f-quotient; AutomorphicGaloisRepresentations §§1.5, 6.1.)

Layers 2–3 retain every coefficient pair (f,λ). The full-range zeta morphism, twist compatibility and interpolation are required by gap:all-coefficient-places-zeta wherever the stated range of KatoEulerSystems does not provide them; rank-one/torsion structure remains a separate hypothesis of §§2.3 and 3.2. (Kato Theorems 12.4 and 12.5(1), p. 221; Kato lines 4039–4071.)

The notation Hⁱ_global(W) means `H^i(Spec Z[1/p], j_*T(h))[1/p]`, where T⊂M_f is a stable O-lattice and j extends across the specified bad primes away from p. Its rational value is lattice independent. In degree one it embeds into restricted-ramification cohomology and imposes the unramified condition at those primes. It is not unrestricted cohomology for an arbitrarily enlarged ramification set, and degree-two comparisons retain higher direct-image corrections. (SelmerIwasawaCohomology §§3.15–3.16; Kato §8.2 and §14.8, pp. 180–181, 238–239.)

Selmer corank is the ℚ_p-dimension of the rationalized Pontryagin dual of the classical discrete p∞ Kummer Selmer group, assumed of finite cotype. The rational Kummer comparison instead uses its Tate module: `H_f^1(F,V_p A) = T_p Sel_(pInfinity)(A/F) tensor Q_p`. No isomorphism with an untyped dual is meant. All coefficient extensions are finite extensions of ℚ_p. Complex periods are applied to F-rational vectors before completion; no embedding F_λ→ℂ is chosen. (SelmerIwasawaCohomology §§2.11–2.12a, 4.26; BT line 256 specifies the comparison whose types must be restored.)

At p=2 retain real-place Tate terms, finite errors killed by 2, and the integral Δ={±1} action. Projectors `(1+c)/2`, `(1-c)/2` and finite-character idempotents are used only after rationalization. The Tate convention has φ=p⁻¹ on the invariant line of ℚ_p(1); inverting arithmetic Frobenius gives geometric Frobenius. At weight two the sign ε=+1 satisfies ε(−1)ʰ=−1; at weight four ε=−1 satisfies the same relation. These witnesses are repeated where the conventions are used. (Kato lines 4755–4787; PadicHodgeRegulators §0.1.)

Arithmetic L-functions use arithmetic normalization. Analytic rank is the finite order of their unique holomorphic continuation at 1, or at h for f; it is zero exactly when the value is nonzero. Nonzero continuation follows from its Euler product in the convergence half-plane. Twists are pointed elliptic curves, indexed by nonzero squareclasses, and the trivial class is included. Positive squarefree n are ordered by n≤X. Fundamental discriminants have both signs and height |d|≤X; the trivial character d=1 affects only a finite set. Over any number field K the height is `H(t) = product_(v_p(t) odd) N(p)` on K×/K×², each class once, with cutoff H(t)<X. At X≤1 this last family is empty; all ratios and limit statements use sufficiently large X with positive denominator. (BT §1.0.2, p. 2, BT lines 47–60; BKLOS §2, p. 2, BKLOS lines 80–98; ArithmeticStatisticsPartI §§0.1, 0.5, 0.15.)

All representations and vector spaces use the coefficient-field universe of their suppliers; all number fields are characteristic zero and finite over ℚ. Elliptic curves mean `WeierstrassCurve` with `WeierstrassCurve.IsElliptic`. For the descent theorem K may be any native quadratic extension of ℚ with a chosen unit θ satisfying θ²=D for a rational D<0. Thus K=ℚ(θ) is imaginary quadratic. This formulation does not require choosing an integral generator or a maximal CM order.

## Exact supplier contracts

### From Mathlib

Use `WeierstrassCurve` and its five coefficients in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`, lines 76–86; `WeierstrassCurve.Δ` at line 131; `WeierstrassCurve.map` at line 230; `WeierstrassCurve.IsElliptic` at line 366 and `WeierstrassCurve.j` at line 388. Ellipticity is exactly invertibility of Δ, including over rings; over ℚ it is equivalent to Δ≠0. It does not assert smoothness of a singular model after forgetting this hypothesis. Use `NumberField.RingOfIntegers` in `Mathlib/NumberTheory/NumberField/Basic.lean`, line 101, and `CyclotomicField` in `Mathlib/NumberTheory/Cyclotomic/Basic.lean`, line 652, for the cube-sum application. Use `WeierstrassCurve.VariableChange` for pointed isomorphisms, `Algebra.IsQuadraticExtension` for quadratic fields, and the ordinary finite-dimensional, ideal, localization and limit APIs. Their routine algebra is not a target here. The coefficient function and raw series are `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries` in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`, lines 79 and 84; neither definition includes holomorphic continuation. Use `ModularForm.L` and `CuspForm.differentiable_L` in `Mathlib/NumberTheory/ModularForms/LFunction.lean`, lines 134 and 190, for the positive-weight cusp-form entire L-function. Use `analyticOrderAt_mul` and `analyticOrderNatAt_mul` in `Mathlib/Analysis/Analytic/Order.lean`, lines 523 and 528; the natural-order formula requires both analytic orders to be finite. Use `AnalyticOnNhd.eq_of_eventuallyEq` in `Mathlib/Analysis/Analytic/Uniqueness.lean`, line 234, for uniqueness of entire continuation on connected ℂ, and `LSeries.tendsto_atTop` in `Mathlib/NumberTheory/LSeries/Injectivity.lean`, line 124: a Dirichlet series with finite abscissa of absolute convergence tends to its first coefficient along the positive real axis.

For the support height use `FractionalIdeal.count` and `FractionalIdeal.finite_factors` in `Mathlib/RingTheory/DedekindDomain/Factorization.lean`, lines 309 and 596, for the integer valuation and its finite support, and `Ideal.absNorm` in `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`, line 258. The count of the zero ideal is defined to be zero; squareclass representatives are units of the field, so that boundary never enters. For cyclotomic arithmetic use `IsCyclotomicExtension.Rat.discr_odd_prime'` in `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean`, line 56, and `IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`, `IsCyclotomicExtension.Rat.map_eq_span_zeta_sub_one_pow`, `IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one` in its `Ideal.lean`, lines 83, 106 and 124, specialized to p=3 and exponent one.

### From Tau Ceti

Use `HeckeRing.GL2.Newform` in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`, line 104: it extends the nonzero good-prime cuspidal eigenform with nebentypus `HeckeRing.GL2.EigenformAwayFromLevel` of the same file, line 84, and adds newspace membership and the normalization that the first Fourier coefficient is one. The parent alone admits both f and 2f; only the normalization field excludes 2f. It does not bundle Galois realizations, CM, Selmer groups or analytic continuation. Use `TauCeti.completedGroupAlgebra` in `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`, line 145, the compatible inverse limit over open normal subgroups, through the Iwasawa supplier's continuous character interface. An ordinary finite-support group ring is not this algebra.

Use `WeierstrassCurve.quadraticTwistOf` in `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`, line 169, and `WeierstrassCurve.isElliptic_quadraticTwistOf`, line 411. The former is a five-coefficient formula with discriminant parameter t²−4n and has no ellipticity hypothesis. In characteristic zero the specialization (t,n)=(0,−a) represents the squareclass a because the parameter is 4a; for a short equation its coefficients become `(4a)^2 A, (4a)^3 B`. Use `WeierstrassCurve.exists_smul_eq_or_exists_smul_eq_quadraticTwist`, line 739, only with its j≠0,1728 hypotheses. For short forms use `WeierstrassCurve.shortCurve` and `WeierstrassCurve.smul_shortCurve` in `TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean`, lines 109 and 168, and `WeierstrassCurve.variableChange_a₄_of_isShortNF`, `WeierstrassCurve.variableChange_a₆_of_isShortNF` in `TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean`, lines 131 and 140. When two and three are non-zero-divisors and both forms are short, they give scaling by u⁻⁴ and u⁻⁶ and hence the exceptional-j coefficient classifications.

Use `TauCeti.Isogeny.Hom` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean`, line 106, and its ring instance in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean`, line 174, for actual algebraic endomorphisms. The latter requires ellipticity and takes multiplication to be composition; an arbitrary additive endomorphism of the point group is not substituted.

Use `TauCeti.SquareClassGroup` and `TauCeti.squareClass_toMul_out` in `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`, lines 45 and 66: the carrier is the additive quotient of Kˣ by squares, and the chosen representative has the prescribed class. Use `HeckeRing.GL2.Newform.analyticOrderAt_L_ne_top`, `HeckeRing.GL2.Newform.analyticRank` and `HeckeRing.GL2.Newform.analyticRank_eq_zero_iff` in `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`, lines 72, 80 and 107. For positive weight these give finite analytic order and the central nonvanishing equivalence for the native newform. Use `HeckeRing.GL2.Newform.L_eulerProduct` in `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean`, line 217, including the linear factor at primes dividing the level; `CuspForm.frickeCompletedL_functional_equation` in its `FunctionalEquation.lean`, line 324, for positive integral weight, nonzero level and width-one cusp forms, with its normalized Fricke partner; and `CuspForm.conj` in `TauCeti/NumberTheory/ModularForms/Conjugate.lean`, line 309, for coefficient conjugation.

### From TauCetiRoadmap.ModularForms

What ModularForms must provide (gap:newform-central-analytic-interface): for every normalized cuspidal newform of weight k≥2 and every coefficient embedding, export L(f*,h)=conjugate L(f,h) for the coefficient-conjugate cusp form, and L⁽ᵖ⁾(f*,s)=P_p(f*,p⁻ˢ)L(f*,s) on all of ℂ, with the actual bad-prime factor when p divides the level.

### From TauCetiRoadmap.EllipticCurveModularity

Section R29.6, “Continuation and the functional equation”, supplies the entire elliptic continuation agreeing with its actual Euler product and the modular L-function, together with the sign of its functional equation; its “Elliptic coefficient summability” gives absolute convergence of the elliptic Dirichlet series on Re(s)>3/2. The order at 1 of this function is the analytic rank used here. The first coefficient of `WeierstrassCurve.LFunction` is one, because every local polynomial has constant term one (EllipticCurveModularity, “Coefficient and local-reduction notation”, records this normalization); so by Mathlib's `LSeries.tendsto_atTop` the continuation tends to one along the positive real axis; it is not identically zero, and its analytic order is finite at every point. Section R29.3, “Attachment and uniqueness across levels”, makes attachment of a newform depend only on the ℚ-isogeny class, and R29.4's IsNewformOf.coeff_eq identifies every Dirichlet coefficient of an attached newform with that of the curve. Applied to the attached form newformOf E, these give equal Dirichlet coefficients, hence equal L-series and continuations, for ℚ-isogenous curves at every prime, including the bad ones.

What EllipticCurveModularity must provide (gap:elliptic-quadratic-analytic-identities): for every elliptic A/ℚ and every quadratic field K, export the identity L(A_K,s)=L(A,s)L(Aᶜʰⁱ_K,s) of entire continuations, including the local factors at primes dividing the conductor and at primes ramified in K.

What EllipticCurveModularity must provide (gap:congruent-number-root-numbers): for every positive squarefree n, export the sign of the functional equation of y²=x³−n²x, namely +1 for n≡1,2,3 modulo eight and −1 for n≡5,6,7, including the local contributions at two and at the primes dividing n.

The sign requested is the sign w_E of R29.6, the eigenvalue of −W_N on the attached newform. SelmerIwasawaCohomology §4.29 proves the local Kummer-image signs σ_φ and the parity of the 2∞-Selmer corank of these curves; it relates them to root numbers only by citation and leaves root numbers of modular forms outside its scope, so it fixes no sign of an analytic functional equation. Its local table is the Selmer-side check of this contract: at n=1, 5 and 6 the products of σ_φ over ∞, 2 and the primes dividing n are +1, −1 and −1.

### From TauCetiRoadmap.EllipticCurves

Layers 1 and 5 supply general isogenies, the pointed-twist classification and quadratic twists. Layer 2 supplies the Tate module with its Galois action; a quadratic twist by χ has rational Tate module V_pA⊗χ. Layer 7 supplies the classical Kummer Selmer functor. These are used for arbitrary number fields, with every local Kummer image.

An isogeny φ composed with its dual is multiplication by deg φ, which is invertible on rational Tate modules, so φ induces a Galois isomorphism of rational Tate modules at every prime p, including p dividing deg φ. Since H_f¹ depends only on the rational representation, SelmerIwasawaCohomology §4.26 then gives equal classical p∞ Selmer coranks for curves isogenous over any number field F; no further export is requested.

### From TauCetiRoadmap.AlgebraicCurves

Layer 10, “Model classes — elliptic, hyperelliptic, plane curves”, supplies integral plane-curve function fields, genus-one function fields with a degree-one divisor, and the Weierstrass point–place dictionary.

What AlgebraicCurves must provide (gap:pointed-cubic-model-comparison): over a characteristic-zero field k, for a smooth integral projective plane cubic C with marked k-point P and an elliptic Weierstrass cubic W with origin O, an invertible projective linear map M sending C onto W and P to O induces a k-isomorphism k(W)→k(C) identifying the degree-one places at O and P, and hence a pointed elliptic-curve isomorphism through Layer 10’s point–place dictionary.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Sections 1.5 and 4.8 give the rank-two cohomological realization, conjugate-dual and arithmetic dictionary, oddness and characteristic-zero absolute irreducibility at every λ. Sections 4.4–4.7, 6.4 and 7.2 give strict local compatibility, conductor factors and monodromy purity, including the coefficient prime. On the central twist the crystalline eigenvalues of W′, when present, have absolute values p⁻¹ᐟ² or p⁻¹; use the latter for the monodromy kernel at a bad prime. No residual irreducibility, ordinarity or p∤N condition is imposed on this classical input. The polynomial and Tate-twist witness in §0.3 fixes its use.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Use §§R02.4.3–R02.4.4 for finite-coefficient Poitou–Tate and real-place corrections, D7.3 for compact Shapiro and projection, and D7.5–D7.7 for lattice/rational duality and dual local conditions. A finite-module Euler characteristic alone is not the rational Euler identity needed here.

What ArithmeticGaloisDuality must provide (gap:kato-rational-duality): in the precise j_* lattice convention export the rational form of Kato (14.9.3) and (14.9.5), rational amplitude at most two and h⁰−h¹+h²=−dim Wᶜ⁼⁻¹, retaining the integral real-place terms and errors killed by two before rationalization.

### From TauCetiRoadmap.SelmerIwasawaCohomology

Use §§2.10–2.12a for contragredient Pontryagin duals, corank and finite-cotype p∞ Kummer groups; §§2.4, 2.19–2.20 for functoriality and dual finite conditions; §§3.0, 3.7, 3.10, 3.13–3.16 for completed Iwasawa algebras, semilinear twists, derived control, rational amplitude and the j_* comparison; §§4.9, 4.26 for finite conditions and the elliptic rational Kummer comparison, which with §2.11 identifies the classical p∞ Selmer corank over any number field with dim H_f¹ of the rational Tate module; §3.6 for semilocal cohomology. Section 3.15 identifies j_* cohomology in degree one and retains its higher direct-image corrections in degree two: by its target “Stalks of j_* and R^q j_*, and the degree-one Leray sequence”, degree-one j_* classes are exactly the classes unramified at every omitted bad prime. Away from p the rational Bloch–Kato condition is the unramified one (§2.15 and §4.9, “The Bloch–Kato local condition on T and W”), and rational H¹ at the real place vanishes. Hence every class of H¹_global(W) is finite at every place except p, and H_f¹(ℚ,W) is its subspace of classes finite at p; no further comparison is requested. Section 4.29 supplies dyadic parity for congruent-number twists.

What SelmerIwasawaCohomology must provide (gap:central-jstar-control): apply its derived control to the actual Kato j_* complex in every degree used here, with finite generation, rational amplitude at most two, and the degree-one Tor₁(H²,E) and degree-two Tor₁(H³,E) sequences.

What SelmerIwasawaCohomology must provide (gap:finite-condition-shapiro): for a finite extension F′/F of number fields and a finite-dimensional continuous p-adic representation V of G_F′, export that the global Shapiro isomorphism H¹(F′,V)≅H¹(F,Ind V) matches the Bloch–Kato finite conditions place by place through the semilocal decomposition, with the unramified condition at places away from p, and therefore restricts to H_f¹(F′,V)≅H_f¹(F,Ind V).

At places above p the local input is PadicHodgeRegulators §1.7(d). Coefficient extension needs no export: for a finite extension L/E, V⊗_E L is a direct sum of [L:E] copies of V as an E-representation, and every Bloch–Kato condition commutes with finite direct sums, so H_f¹(F,V⊗_E L) has E-dimension [L:E]·dim_E H_f¹(F,V) and vanishes exactly when H_f¹(F,V) does. For an elliptic A/F and a quadratic extension F′/F with character χ, Ind V_pA≅V_pA⊕(V_pA⊗χ) and V_p(Aᶜʰⁱ)≅V_pA⊗χ, so the Shapiro export and §4.26 give corank Sel_(pInfinity)(A/F′)=corank Sel_(pInfinity)(A/F)+corank Sel_(pInfinity)(Aᶜʰⁱ/F) at every p; the decomposition uses the projectors (1±σ)/2, defined only after inverting two.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Section 4.3 supplies that O⟦T⟧ is a regular local ring of dimension two whose height-one primes are (ϖ) and the ideals (F) for F irreducible distinguished, with O⟦T⟧/(F) free of rank deg F; §4.6 supplies the character idempotents e_ω of O[Δ] when #Δ is prime to p, while at p=2 the idempotents (1±σ₋₁)/2 exist only in E[Δ], after inverting two. With the coordinate and twists of SelmerIwasawaCohomology §3.0 these give the central specialization prime of §0.4; no further export is requested.

### From TauCetiRoadmap.PadicHodgeRegulators

Sections 1.1, 1.4–1.8 supply H_f⊆H_g, the dual exponential with kernel H_g, local finite duality, Shapiro, and the de Rham formulas dim H_g−dim H_f=dim D_cris(V^∨(1))ᵠ⁼¹ and dim H¹=dim V+dim H⁰(V)+dim H⁰(V^∨(1)) over ℚ_p. With E-coefficients these dimensions are over E. Section 0.1 fixes φ=p⁻¹ on ℚ_p(1). For ℚ_p(1), H_g=H¹ has dimension two whereas H_f has dimension one; this negative control prevents applying the central equality to arbitrary de Rham representations.

### From TauCetiRoadmap.KatoEulerSystems

Section 2.2 supplies the literal-dual and Tate-twist dictionary. Section 4.4 supplies independent rational rank-one/torsion structure in its stated admissible range. Section 4.6 supplies twisting and specialization of Iwasawa cohomology; these operations involve no zeta element, and for the j_* lattice of every pair (f,λ) the same twist and degree-one specialization are SelmerIwasawaCohomology §§3.7 and 3.16, so the control theorem of §2.1 needs no full-range zeta contract. Sections 5.1 and 5.3 supply the actual E-linear zeta morphism, its relation z(cγ)=−σ₋₁z(γ), and its critical period formula on F-rational vectors in their stated range; no extension to other pairs is inferred from these section citations. Section 7.2 supplies the cohomological upper bound in its stated range. The all-prime CM structure and equality use ModularIwasawaMainConjecturesPartII §§CZ.5–CZ.6 below. The CM module argument includes Kato §15.14 when K⊂ℚ(μ_p∞); for imaginary quadratic K these include ℚ(i) and ℚ(√−2) at two and ℚ(√−p) for p≡3 mod 4, not only the case p=3.

What KatoEulerSystems must provide (gap:central-modular-local-dimensions): export Kato Proposition 14.12 for f and f*, every prime p and every 1≤r≤k−1, with local H⁰=H²=0, dim H¹=2 and dim H_f¹=1, including the bad-prime weight-two exception check that κ⁻¹ differs from κ⁻² times a finite character.

What KatoEulerSystems must provide (gap:all-coefficient-places-zeta): for every normalized cuspidal newform of weight k≥2, every prime p and every coefficient place λ|p at which (f,λ) is not admissible in its Conventions, extend §§5.1 and 5.3 to supply the actual E-linear zeta morphism of Kato Theorem 12.5(1), its relation z(cγ)=−σ₋₁z(γ) and critical interpolation on F-rational vectors, compatibly with rational lattice change, Tate twisting and central specialization. Here admissible means that f is CM, or that f is non-CM and some element of G_(ℚ(μ_p∞)) has a one-dimensional fixed space on its realization; all CM pairs are therefore covered directly by §§5.1 and 5.3.

The full-range source is Kato Theorem 12.5(1), pp. 221–222 (Kato lines 4039–4071), independent of the rank-one/torsion hypotheses assumed in §2.3.

### From TauCetiRoadmap.ModularIwasawaMainConjectures

Sections 0.6–0.7 supply the Kato-normalized j_* Iwasawa modules and zeta submodule, KMC_rational as equality of their characteristic ideals in A=Λ[1/p], and KMC.changeLattice for rational lattice independence. Use the full cyclotomic algebra, retaining its rational finite-character components. At p=2 the proposition is equality of lengths at height-one primes not containing two, equivalently equality of characteristic ideals after inverting two; it asserts nothing at primes containing two. No ordinary, residual-image or reduction-type hypothesis is imposed merely to state this proposition. (Kato Conjecture 12.10, pp. 223–224; Kato lines 4165–4168.) Its truth is assumed in §§2.3 and 3.2; the CM proof comes from ModularIwasawaMainConjecturesPartII §CZ.6.

### From TauCetiRoadmap.ModularIwasawaMainConjecturesPartII

Use §CZ.4 target rational-equivariant-main-conjecture for the rational equivariant input with conductor corrections; §CZ.5 targets cm-contained-descent and cm-h2-torsion for the contained-cyclotomic-field case and independent CM module structure; and §CZ.6 targets cm-kato-main-conjecture and cm-kato-normalization-dictionary for the all-prime rational equality char_A H²_Iw=char_A(H¹_Iw/Z(f)) and its normalization dictionary. The equality uses the full cyclotomic Kato complex after inverting p, for every CM newform of weight k≥2 and every λ|p, including K⊂ℚ(μ_p∞).

The equality is BT Theorem 2.6, p. 5 (BT lines 208–218); Kato Proposition 15.17, p. 265 (Kato lines 5762–5772), gives only the bound. The all-prime cyclotomic endpoint belongs to this supplier's cohomological theory rather than to a restricted anticyclotomic theory.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Section R17.4.16, quadraticInduction, supplies quadratic automorphic induction with the induced local parameter at every place, cuspidality exactly when ψ≠ψ^σ, and L_ℚ(s,AI ψ)=L_K(s,ψ). Use this identity in the arithmetic normalization of the CM characters; their distinct infinity types give the cuspidal case.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

Section 1.1 supplies idealLatticeCurve.endomorphismRing and idealLatticeCurve.automorphism_factors over ℂ. Sections 1.2 and 4.1–4.2 supply the rational CM self-twist isogeny, actual Hecke characters, completed coefficient decomposition, conjugate duals and full L-factors. In §4.2, ellipticCMLFactorization applies to A/K without rational descent, whereas cmInductionComparison assumes A/ℚ. Their rational comparison allows primes dividing the order index.

What ComplexMultiplicationAndExplicitReciprocity must provide (gap:theta-induction-arbitrary-cm-curve): for every elliptic A/K with all CM endomorphisms defined over its imaginary quadratic field and any CM order, realize the automorphic inductions of its two attached Hecke characters as normalized weight-two newforms f_ψ and f_ψ̄ and supply the central Galois comparison M_(f_ψ)(1)⊗L=Ind η̄ with its conjugate, without descent to ℚ.

What ComplexMultiplicationAndExplicitReciprocity must provide (gap:cube-sum-full-cm): for every elliptic curve of j=0 over an arbitrary characteristic-zero field k containing a primitive cube root ζ, descend the geometric endomorphism-ring identification of §1.1 to End_k(E)≅ℤ[ζ₃], with ζ₃ acting in a short model by (x,y)↦(ζx,y), so that every geometric endomorphism is defined over k.

### From TauCetiRoadmap.ArithmeticStatisticsPartI

Use §0.1 for arithmetic families, relative density, finite-change, restriction to positive-density subfamilies and piecewise height rescaling; §0.5 for the squareclass family and its finite fibres over squarefree ideals in Cl(K)²; §0.6 for the six equal squarefree residue counts and the half-density parity classes; §0.7 for quadratic fields ordered by |Disc|, which are the fundamental discriminants d≠1 through d↦ℚ(√d) with |Disc ℚ(√d)|=|d|, the discriminant d=1 being the single finite exception; §0.15, “Positive squareclass denominator”, for `# {t : H(t)<X} = c_K X + o(X)` with c_K>0. This exact denominator includes the support class restriction and unit/Selmer fibres. Northcott finiteness alone would not suffice.

### From TauCetiRoadmap.ArithmeticStatisticsPartVII

Use §5.9, “P infinity selmer corank distribution in twist families” and its Smith/parity deductions, and §5.11, “CM twists have corank zero at least half”. Preserve the corank endpoint, the unweighted squareclass height and every hypothesis of its numerator theorem.

What ArithmeticStatisticsPartVII must provide (gap:smith-unconditional-positive-corank): export the unconditional relative-density-one corank-zero theorem for positive squarefree n≡1,2,3 modulo eight for y²=x³−x, including the Smith law and its parity/subfamily transfer, rather than only the deduction given that law.

What ArithmeticStatisticsPartVII must provide (gap:cm-three-selmer-unconditional): export its §5.11 CM 3∞-Selmer-corank-zero lower proportion at least one half over every imaginary quadratic K with three split or ramified and every CM order, discharging the windowed cubic counting hypothesis retained in its three-isogeny numerator theorems.

The required unconditional arithmetic statements are BT Theorems 3.3 and 3.5, pp. 6–7 (BT lines 265–275). BKLOS §9.2, p. 14 and §11, pp. 18–19 (BKLOS lines 654–661, 831–879) justify the stronger Selmer input and the nonmaximal-order passage; the statistical proof has this supplier as its single owner.

## How to read the build

Layer 0 fixes the shared propositions, sign and central kernel on the supplied realizations. Layer 1 proves the dual finite-level vanishings and the global line. Layer 2 specializes the genuine Kato class and uses characteristic-ideal equality to prove it is a basis. Layer 3 turns nonfinite localization into a nonzero central L-value and applies the CM equality. Layer 4 transfers the theorem to CM elliptic curves and proves the two rational doubling identities. Layers 5 and 6 combine the converse with the exact statistical contracts in their specified heights. Each *Needs* line separates inputs to the statement from inputs used by the indicated proof route.

## Layer 0: Central conventions and shared propositions

### 0.1 The rank-r p-converse proposition

For an elliptic A/ℚ, prime p and r∈ℕ, define the rank-r p-converse proposition to mean `corank Sel_(pInfinity)(A/Q) = r implies analyticRank(A) = r`. The analytic rank is the finite order at 1 of the actual elliptic continuation. This definition proves no rank-r converse. (BT (1.1), p. 1; BT lines 24–34.)

For a native Weierstrass W over a number field define `ellipticLNonvanishingAtOne` to mean that there exists an entire F:ℂ→ℂ agreeing with W.LSeries on Re(s)>3/2 and satisfying F(1)≠0. The identity theorem makes the entire continuation unique; absolute convergence of the Hasse–Weil series in that half-plane ties the definition to the full arithmetic Euler product. This predicate includes existence of the continuation and is used only on elliptic curves in the headline theorems. (BT Theorem 1.1, p. 1, BT lines 39–43, for the central nonvanishing endpoint; EllipticCurveModularity §R29.6 for continuation.)

Its analytic API is:

- Any entire continuation agreeing in that half-plane has the same value at one, by the identity theorem.
- For an elliptic curve over ℚ the continuation is not identically zero: its Dirichlet series converges absolutely on Re(s)>3/2 and has first coefficient one, so it tends to one along the positive real axis. Its central order is therefore finite, and the predicate is equivalent to analytic rank zero.
- Isomorphic elliptic curves have identical full local factors, so their predicates agree.

**Checks.**

- For the nonvanishing congruent-number twist n=1, the unique continuation has F(1)≠0 and the predicate holds; for n=5 the root number is −1 and F(1)=−F(1)=0, so it fails.
- Replacing F by 2F multiplies its first Dirichlet coefficient from 1 to 2, so it fails agreement on the convergence half-plane. A zero function has first coefficient 0 and also fails agreement.
- The raw series at one is not used: only the half-plane values fix F. The singular model at n=0 is outside every analytic headline's family.

The p-converse API is:

- It holds exactly when the displayed corank-to-analytic-rank implication holds.
- At r=0 it is equivalent to corank zero implying L(A,1)≠0, using the supplied analytic-order equivalence.
- At fixed p and r, equality of the two coranks and equality of the two analytic ranks transport the proposition between curves.
- Its failure is equivalent to corank=r and analytic rank different from r.

**Checks.**

- With corank=0 and L(A,1)≠0, the rank-zero proposition is true, also at p=2.
- The hypothetical pair (corank, analytic rank)=(0,1) makes the rank-zero proposition false and the rank-one proposition vacuously true. Reversing the implication would fail this truth table.
- With corank Sel₂∞=0 and A[2](ℚ)≅(ℤ/2)², the antecedent is true but dim Sel₂≥2 by Kummer. Finite Sel₂=0 would be a different antecedent.

*Needs:* statement: SelmerIwasawaCohomology §§2.11–2.12a; EllipticCurveModularity §R29.6 continuation; Mathlib analytic order and the native elliptic L-series. Route: the same inputs, EllipticCurveModularity §R29.6 elliptic coefficient summability, Mathlib `LSeries.tendsto_atTop` and the identity theorem for entire functions.

### 0.2 The central sign and rational projection

For natural k define the central sign as (−1)^(k/2−1)∈ℤ, with natural division and subtraction. Its arithmetic domain is even k≥2. Write ε for this sign. On the supplied involutive cohomological realization define its rational projection by `P_eps(v) = (v + eps c(v))/2`. Characteristic-zero coefficients make division by two valid at every p. (BT proof of Theorem 3.1, p. 6, BT line 235; Kato Theorem 12.5(1), p. 221, Kato lines 4053–4071.)

Its API is:

- The square of the sign is one for every natural k, including the total-function boundary.
- For even k≥2, ε(−1)ʰ=−1. For k≥2, replacing k by k+4 preserves ε.
- For every vector v, c(Pε(v))=εPε(v). If c(v)=εv, then Pε(v)=v.
- The complementary projection is zero on that eigenspace, and the two rational projections sum to the identity. Neither projection is asserted to preserve an integral dyadic lattice.

**Checks.**

- At k=2, ε=1 and Pε(1,−1)=(1,0) for c=diag(1,−1); the negative line is the wrong line.
- At k=4, ε=−1 and Pε(1,−1)=(0,−1); at k=6 the projection returns to (1,0). The expression (−1)^(k−1) would give −1 at all three weights.
- At k=0 the total sign is 1 and ε(−1)⁰=1, so the arithmetic relation −1 does not extend there. At odd k=3 the central newform theorem is not asserted.
- Over ℤ₂, projecting (1,0) for the involution exchanging the two coordinates gives (1/2,1/2) in ℚ₂², outside ℤ₂². This excludes an integral dyadic direct sum.

*Needs:* statement: the realization/involution of AutomorphicGaloisRepresentations §1.5; characteristic-zero linear algebra. Route: KatoEulerSystems §5.1 for the use of this sign on zeta classes.

### 0.3 The central realization dictionary

Apply the supplied dictionary to M_f, W and W′ of the conventions. In particular W′≅M_f*(h), both are de Rham at p, and each complex-conjugation sign has dimension one. Use geometric Frobenius on M_f with polynomial `X^2 - a_l X + eps(l) l^(k-1)`; the central twist scales its roots by ℓ⁻ʰ. This subsection fixes how the imported comparison is used. (Kato (14.10.1)–(14.10.5), pp. 240–241; Kato lines 4793–4812.)

**Checks.**

- At weight two and trivial character, det M_f=χ_cyc⁻¹ and det M_f(1)=χ_cyc. The latter is the E-determinant of the λ-component of V_p(A_f), and of V_pE_f when the coefficients are rational, by the Weil pairing; omitting the twist reverses it.
- For roots α,β with αβ=ℓ at weight two, the geometric roots after twisting by one are α/ℓ,β/ℓ, with product 1/ℓ. Taking arithmetic Frobenius inverts both roots and gives determinant ℓ.
- At weight four, h=2 and 1−k+h=−1=1−h, so M_f*(h)=M_f^∨(1−h)=W′. Using a twist of h−1 would instead give M_f^∨(−2).

*Needs:* statement and route: AutomorphicGaloisRepresentations §§1.5, 4.4–4.8, 6.4, 7.2; KatoEulerSystems §2.2; the native newform carrier.

### 0.4 The central specialization prime

For G∞=Gal(ℚ(μ_p∞)/ℚ), κ(σ_c)=c, Λ=O[[G∞]] and A=Λ[1/p], define ev_h as the augmentation Λ→O composed with the twist Tw of SelmerIwasawaCohomology §3.0 by the continuous character κ⁻ʰ, so that `ev_h(sigma_c) = c^(-h)`. Its integral source and target are Λ→O; after inverting p they are A→E. Define the central prime 𝔮 to be its kernel. On the rational component selected by κ⁻ʰ, 𝔮 is height-one maximal, the quotient is E and A_𝔮 is a DVR. Prove this as follows. Write G∞=Γ₀×Δ with Γ₀ procyclic, topological generator γ and Δ finite of order p−1, or two when p=2; #Δ is invertible in E, so the idempotents of E[Δ] split A into components O⟦T⟧[1/p], T=γ−1, and ev_h kills every component except the one on which Δ acts through κ⁻ʰ. On that component ev_h sends T to a=κ(γ)⁻ʰ−1, which lies in the maximal ideal of O; so T−a is a degree-one distinguished polynomial, (T−a) is a height-one prime of the regular local ring O⟦T⟧ with quotient O (PadicMeasuresIwasawaAlgebras §4.3), its image after inverting p is maximal with residue field E, and the localization of a two-dimensional regular local ring at a height-one prime is a DVR. For p=2 the finite part Δ={±1} remains present until rationalization. (BT p. 6, BT lines 240–244; Kato §14.13, p. 242.)

Its API is:

- Evaluation of σ_c is c⁻ʰ, and evaluation of σ₋₁ is (−1)ʰ.
- An element belongs to the central prime exactly when its evaluation is zero.
- The quotient A/𝔮 is E as an E-algebra, with the quotient map identified with evaluation.
- Semilinear twisting `Tw_h(sigma_c) = c^(-h) sigma_c`, followed by augmentation, equals this evaluation.
- The finite-character component seen by evaluation has σ₋₁ acting by (−1)ʰ. All other components are killed by the map to E.

**Checks.**

- At p=2,k=2, σ₋₁ evaluates to −1, so σ₋₁+1 lies in 𝔮 while σ₋₁−1 evaluates to −2≠0. Erasing Δ would lose this character.
- At k=4, σ₋₁ evaluates to 1, so σ₋₁−1 lies in 𝔮 and σ₋₁+1 evaluates to 2. This switches the selected component.
- At p=3,h=1,c=4, the value is 1/4, not 4. Moreover ev_h(p)=p≠0 and p is a unit in A, so p∉𝔮.
- At p=3,h=1 with κ(γ)=4, T=γ−1 evaluates to 1/4−1=−3/4, so the component kernel is (T+3/4) with residue field ℚ₃; at p=2,h=1 with κ(γ)=5 it is (T+4/5) on the component where σ₋₁ acts by −1, selected by the idempotent (1−σ₋₁)/2, which evaluates to one and exists only after inverting two. Using the untwisted augmentation instead would give (T) and the value at h=0.

*Needs:* statement: SelmerIwasawaCohomology §3.0, coordinates, augmentation and continuous character twists; §0.3. Route: PadicMeasuresIwasawaAlgebras §4.3, regularity and distinguished height-one primes, and §4.6, character idempotents.

### Examples

For k=2 the input sign is +1, the evaluation of σ₋₁ is −1, and their product is −1. For k=4 they are −1 and +1, again with product −1. The rank-zero converse at two uses these characteristic-zero calculations together with a potentially nonzero finite Sel₂ group.

### Dependencies

The statement carriers come from the native curves/newforms, SelmerIwasawaCohomology, ModularForms and EllipticCurveModularity; the central specialization prime of §0.4 also uses the ring theory of PadicMeasuresIwasawaAlgebras §§4.3 and 4.6. The realization conventions come from AutomorphicGaloisRepresentations. The zeta sign comes from KatoEulerSystems; no converse theorem supplies any of these inputs.

## Layer 1: Finite-level vanishing and the global line

### 1.1 Global modular invariants

For every normalized cuspidal newform of weight k≥2, every coefficient place λ and every integer r, prove H⁰(ℚ,M_f(r))=0. A nonzero invariant vector would define a proper invariant line in the actual absolutely irreducible rank-two representation; duals and twists preserve irreducibility. Thus H⁰(W)=H⁰(W′)=0. This is a global statement, not local invariant vanishing for arbitrary twists. (Kato Proposition 14.11(1) and proof, p. 241; Kato lines 4814–4819.)

**Checks.** A two-dimensional irreducible representation has invariant dimension zero. The reducible representation 1⊕χ_cyc has invariant dimension one and is excluded. At p=2 the coefficient field still has characteristic zero, so the argument is unchanged.

*Needs:* statement: §0.3 and the actual realization. Route: AutomorphicGaloisRepresentations §4.8, dual/twist irreducibility.

### 1.2 Selmer zero forces global H² to vanish

For even k≥2, every p, every λ|p and every stable T⊂M_f, prove `H_f^1(Q,W)=0 implies H_global^2(W)=0`. Use the exact j_* convention, with the supplied local central dimensions H⁰=H²=0, dim H¹=2 and dim H_f¹=1 for both W and W′. (BT (3.1), p. 6, BT lines 231–234; Kato (14.9.3), (14.9.5), Proposition 14.12, pp. 240–242, Kato lines 4771–4790, 4832–4849.)

A proof route uses rational Poitou–Tate twice. First apply it to W′: the Tate-dual finite Selmer term is that of W and vanishes by hypothesis. Local H²(W′)=0 then gives global H²(W′)=0 and an isomorphism from H¹_global(W′)/H_f¹(ℚ,W′) to H¹(ℚ_p,W′)/H_f¹(ℚ_p,W′), of dimension 2−1=1. By §1.1 and the Euler identity, dim H¹_global(W′)=1. Subtracting the quotient dimension proves H_f¹(ℚ,W′)=0. Apply Poitou–Tate to W with that dual Selmer vanishing to obtain H²_global(W)=0. At two carry the real terms and integral errors through both applications, then rationalize. No identification of the two finite Selmer spaces is assumed.

**Checks.** The dual calculation gives h⁰=0,h²=0, hence −h¹=−1 and h¹=1; its kernel has dimension 1−(2−1)=0. If the first quotient had dimension zero, this computation would give kernel dimension one and would not prove dual Selmer vanishing. The rationalization of a real correction ℤ/2 at p=2 is zero, whereas its integral group has two elements.

*Needs:* statement: §0.3, the central local-dimension contract of KatoEulerSystems. Route: §1.1; ArithmeticGaloisDuality D7.6–D7.7 and gap:kato-rational-duality; SelmerIwasawaCohomology §§2.19–2.20, §3.15, “Stalks of j_* and R^q j_*, and the degree-one Leray sequence”, and §§2.15, 4.9 for the finite conditions away from p.

### 1.3 The global central line

Under H_f¹(ℚ,W)=0, prove dim_E H¹_global(W)=1, for every p including two. The rational complex has amplitude at most two, §1.1 gives h⁰=0, §1.2 gives h²=0, and oddness gives dim Wᶜ⁼⁻¹=1. Consequently `0 - h1 + 0 = -1`. This is a nonzero global line whose finite Selmer subspace is zero. (BT lines 238–239; Kato (14.9.5), p. 240, Kato lines 4783–4787.)

**Checks.** A rank-two involution diag(1,−1) has negative dimension one, giving h¹=1. The zero representation instead has negative dimension zero and Euler value zero. Substituting +1 for the Euler sign would force h¹=−1, contradicting nonnegativity.

*Needs:* statement: §0.3 and global cohomology. Route: §§1.1–1.2; AutomorphicGaloisRepresentations §1.5; gap:kato-rational-duality.

### 1.4 The central geometric condition is finite

For W=M_f(h), even k≥2 and arbitrary p, prove H_g¹(ℚ_p,W)=H_f¹(ℚ_p,W). The dual exponential therefore induces an injection from H¹(ℚ_p,W)/H_f¹(ℚ_p,W) to Fil⁰D_dR(W); this quotient has E-dimension one. There is no good-reduction or ordinary assumption. (Kato (14.10.4)–(14.10.5), Proposition 14.12, pp. 241–242, Kato lines 4807–4812, 4832–4849; BT line 248.)

Use local compatibility and purity for f*: the crystalline eigenvalues on W′ have complex absolute value p⁻¹ᐟ² or p⁻¹ when they occur. At a monodromic prime this is the weight on the monodromy kernel, not a claim that every WD eigenvalue has weight −1. Neither modulus is one. Thus D_cris(W′)ᵠ⁼¹=0. The supplied dimension formula and inclusion H_f⊆H_g give equality; the supplied kernel formula gives the injection. The local dimensions give 2−1=1.

**Checks.** At p=2, 2⁻¹ᐟ²<1 and 2⁻¹=1/2<1; at p=3 the bad-prime value is 1/3. For V=ℚ_p(1), its dual twist is ℚ_p and has a φ-fixed line: dim H_g=2 and dim H_f=1. This non-example excludes applying the conclusion to all de Rham representations.

*Needs:* statement: §0.3; PadicHodgeRegulators §§1.1, 1.4–1.5. Route: AutomorphicGaloisRepresentations §§4.4–4.7, 6.4, 7.2; gap:central-modular-local-dimensions.

### Examples

At weight two, W=M_f(1)≅ρ_(f*) is the λ-component of V_p(A_f) with complex-conjugate coefficient action, and W′≅ρ_f is the λ-component with the given action (AutomorphicGaloisRepresentations §§1.5, 6.1). Each is two-dimensional over E and in general is not the Tate module of a modular Jacobian: dim S₂(Γ₀(37))=2, so V_pJ₀(37) has ℚ_p-dimension four, whereas each of the two rational newforms of level 37 contributes a two-dimensional component. At level 11, where X₀(11) has genus one, the two agree. For trivial character and rational coefficients, W and W′ are both isomorphic to V_pE_f. At a bad monodromic prime its crystalline modulus after the central twist is p⁻¹. The finite local quotient is still a line. At two the rational Euler identity gives one global dimension while the integral real correction can remain nonzero.

### Dependencies

Layer 0 supplies the signs and representations. ArithmeticGaloisDuality supplies both Tate-dual sequences, Euler characteristic and amplitude. KatoEulerSystems supplies local dimensions independently of a converse. AutomorphicGaloisRepresentations supplies irreducibility and bad/coefficient-prime purity. PadicHodgeRegulators supplies the local maps and dimensions.

## Layer 2: Central specialization of the Kato class

### 2.1 Control at the central character

For the actual Kato Iwasawa complex, with finite generation, rational amplitude at most two and local conditions matching §0.3, prove that H_f¹(ℚ,W)=0 implies H²_Iw(M_f)_𝔮=0 and an E-linear identification `H_Iw^1(M_f)_q / q = H_global^1(W)`. The identification is induced by the supplied semilinear twist by h followed by finite-level evaluation, at κ⁻ʰ. (BT lines 234–244; Kato §14.13, p. 242; SelmerIwasawaCohomology §3.16.)

Apply derived control, retaining `0 -> H_Iw^1/q -> H_global^1(W) -> Tor_1^A(H_Iw^2,E) -> 0`. Degree two also retains Tor₁(H³_Iw,E). Only after amplitude removes H³ does §1.2 identify H²_Iw,𝔮/𝔮 with zero. Finite generation and Nakayama then kill H²_Iw,𝔮. Its degree-one Tor correction vanishes, proving the identification. At two perform the procyclic computation on the rational Δ component of §0.4.

**Checks.** Over a DVR R with uniformizer π, the complex R→R with differential π has H²=R/π; specialization produces a degree-one Tor₁(R/π,R/π)=R/π of length one. Dropping it prematurely changes degree-one dimension from one to zero. If the localized H² is zero, that Tor is zero. The central character sends σ₋₁ to −1 at h=1 and +1 at h=2, as in §0.4.

*Needs:* statement: §0.4 and the Kato complex. Route: §1.2; SelmerIwasawaCohomology §§3.7, 3.10, 3.13, 3.15–3.16 and gap:central-jstar-control; KatoEulerSystems §4.6.

### 2.2 The specialized central zeta class

For γ∈M_f over E, define the central zeta class in H¹_global(W) by composing the actual Kato zeta morphism with the twist by h and finite-level evaluation. This map has source M_f and target the specified global cohomology. It is E-linear and independent of the stable lattice after rationalization. (BT (3.2), p. 6, BT lines 235–237; Kato Theorem 12.5(1), pp. 221–222, Kato lines 4053–4071.)

Its API is:

- Addition and multiplication by a scalar in E commute with this map.
- Replacing T by a commensurable stable lattice preserves the class in rational cohomology.
- The class is the image under precisely the control map in §2.1.
- It sends cγ to −(−1)ʰ times the class of γ.
- It depends only on Pε(γ), where ε=(−1)^(h−1); the other eigenspace specializes to zero.

**Checks.**

- The zero vector gives the zero class and cannot be a basis of the global line.
- At weight two, a vector with cγ=−γ has class z=−z and hence z=0 over E, including E/ℚ₂. The plus line survives.
- At weight four, the plus eigenspace is killed and the minus line survives. Keeping the weight-two projection would give zero on a possible basis.
- If z(γ) is nonzero, z(2γ)=2z(γ)≠z(γ) in characteristic zero, and z(γ/2)=z(γ)/2. Normalizing away this scalar would violate linearity.

*Needs:* statement: §0.3; KatoEulerSystems §5.1 in its stated range and gap:all-coefficient-places-zeta for the full range; SelmerIwasawaCohomology §3.16. Route: §§0.2, 0.4, 2.1; KatoEulerSystems §4.6 with the same full-range contract.

### 2.3 The central Kato class is a basis

Assume H_f¹(ℚ,W)=0, H¹_Iw free of rank one over A, H²_Iw torsion, and ModularIwasawaMainConjectures §0.7 KMC_rational, the rational Kato equality `char_A H_Iw^2 = char_A(H_Iw^1/Z(f))`. Here Z(f) is the A-submodule generated by the actual zeta morphism, with the same full cyclotomic, local-extension and Euler-factor conventions as the complex. If Pε(γ)≠0, prove that the class of §2.2 is an E-basis of H¹_global(W). (BT Theorem 2.6 and proof of Theorem 3.1, pp. 5–6; BT lines 208–218, 235–244.)

By §2.1 the localized H² is zero, so its characteristic ideal is a unit. Equality over the DVR A_𝔮 forces the torsion quotient H¹_Iw/Z(f) to have length zero there, hence Z(f)_𝔮=H¹_Iw,𝔮. The conjugation relation kills the wrong sign in the selected component. The correct eigenspace in M_f is one-dimensional; any nonzero projection spans it, so its image generates Z(f)_𝔮. Reducing modulo 𝔮 and applying control gives the asserted basis. A mere divisibility does not imply equality of these localized lengths. The equality hypothesis is precisely KMC_rational, rather than a separately defined main-conjecture proposition.

**Checks.** For a DVR R, a quotient R/π has length one and characteristic ideal (π), so it cannot coexist with the required unit equality when H²=0. The zero projection gives zero despite a nonzero vector in the other eigenspace. At h=1 the input sign +1 and evaluated σ₋₁=−1 multiply to −1; at h=2 they again multiply to −1.

*Needs:* statement: §2.2 and ModularIwasawaMainConjectures §§0.6–0.7 KMC_rational, supplied as a hypothesis for this theorem; KatoEulerSystems §5.1 with gap:all-coefficient-places-zeta outside its stated range; the rank-one/torsion hypotheses are explicit. Route: §§0.2–0.4, 1.3, 2.1; DVR length/characteristic theory from SelmerIwasawaCohomology §3.14.

### 2.4 The basis is not finite at p

Under exactly the hypotheses of §2.3, prove that localization of the central zeta class at p lies outside H_f¹(ℚ_p,W). At every finite ℓ≠p its localization satisfies the finite condition, by the j_* and bad-prime comparisons. If its p-localization were also finite, the nonzero global basis class would lie in the zero global finite Selmer space. This argument concerns that class; it does not assert injectivity of localization on arbitrary global cohomology. (BT (3.3), p. 6, BT lines 245–248; Kato §14.8, pp. 238–239.)

**Checks.** A nonzero vector spanning E cannot belong to its zero subspace. A zero class is finite at every place and gives no contradiction, explaining the sign hypothesis in §2.3. A class ramified at an omitted bad prime fails the global finite condition even if finite at p; this is why the degree-one j_* identification with unramified classes, supplied by SelmerIwasawaCohomology §3.15, is an input.

*Needs:* statement: §2.3; SelmerIwasawaCohomology §3.15, “Stalks of j_* and R^q j_*, and the degree-one Leray sequence”, §2.15 and §4.9, “The Bloch–Kato local condition on T and W”. Route: AutomorphicGaloisRepresentations §§6.4, 7.2 for the bad-prime bounds.

### Examples

The two-term DVR complex in §2.1 has a nonzero Tor correction before H² is killed. The quotient R/π in §2.3 has length one and is excluded by equality with the unit ideal. At weight two a negative-sign Betti vector still specializes to zero, so nonzero input alone never suffices.

### Dependencies

Layer 1 gives finite-level H² vanishing and the global line. SelmerIwasawaCohomology supplies control with both Tor degrees, amplitude and the bad-prime finite comparisons. KatoEulerSystems supplies the actual morphism in its stated range, with gap:all-coefficient-places-zeta for the general pair. Rank-one/torsion module structure is an explicit hypothesis in §2.3. ModularIwasawaMainConjectures §§0.6–0.7 supplies the proposition KMC_rational used as a hypothesis here; ModularIwasawaMainConjecturesPartII supplies its unconditional CM proof in Layer 3.

## Layer 3: The rational rank-zero newform converse

### 3.1 Reciprocity detects nonvanishing

For a normalized newform of even weight k≥2, any p, λ|p and γ∈M_f over E, prove that nonfinite p-localization of its central zeta class implies L(f,h)≠0. The L-function and period embeddings are those of f, not independent scalar data. (BT proof of Theorem 3.1, p. 6, BT lines 245–249; Kato Theorem 12.5(1), pp. 221–222, Kato lines 4053–4071.)

By §1.4 its dual exponential is nonzero. Choose an F-basis γ₁,γ₂ before completion. The zeta morphism, specialization, localization and dual exponential are E-linear, so at least one basis vector has nonzero image. Apply Kato's complex period formula to that F-rational vector. At r=h and trivial finite character, the twist k−r equals h and the period expression is `(2 pi i)^(h-1) L^(p)(f*,h) P_eps(gamma_i)`. The comparison on the designated period line is an isomorphism; hence the omitted-factor L-value is nonzero. The identity `L^(p)(f*,s) = P_p(f*,p^(-s)) L(f*,s)` implies nonvanishing of the full L-value without division by its Euler polynomial. Finally use coefficient conjugation. No complex period formula on an arbitrary completed-coefficient vector is required.

**Checks.** At k=2 the exponent is zero, the sign is +1 and 1≤h=1≤k−1. At k=4 the exponent is one and the sign is −1; at k=6 the exponent is two and the sign is +1. If the Euler polynomial evaluates to zero, the product is zero for every finite full L-value, so it cannot satisfy the nonzero-product hypothesis; no inverse of zero occurs.

*Needs:* statement: §§0.3, 2.2; Mathlib `ModularForm.L`; KatoEulerSystems §5.3 in its stated range and gap:all-coefficient-places-zeta for the full range. Route: §1.4; the F-rational structure in AutomorphicGaloisRepresentations §1.5; gap:newform-central-analytic-interface and the native newform Euler factors.

### 3.2 The converse under rational Kato equality

For every normalized newform of even weight k≥2 and every λ|p, assume ModularIwasawaMainConjectures §0.7 KMC_rational and the independent rank-one/torsion module structure of §2.3. Prove `H_f^1(Q,M_f(h))=0 implies L(f,h) != 0`. Choose a nonzero vector of the ε-line, use §2.3 for a basis, §2.4 for nonfinite localization and §3.1 for nonvanishing. The theorem has no CM assumption; it also does not prove a main conjecture for a non-CM form. (BT Remark 3.2, p. 6; BT lines 251–252.)

**Checks.** Over A, replacing z by 2z preserves Z(f) and all characteristic-ideal lengths because two is a unit, including at p=2 after rationalization; its critical period value doubles. Thus KMC_rational does not determine the normalized reciprocity map required by gap:all-coefficient-places-zeta. With localized quotient length zero the basis route applies; a quotient of length one is outside its equality hypothesis. The same reasoning at p=2 uses rational Δ components. A non-CM form without the equality does not satisfy the theorem's input merely by having Selmer zero.

*Needs:* statement: §2.3, ModularIwasawaMainConjectures §§0.6–0.7 KMC_rational and the actual newform L-function. Route: §§2.3–2.4, 3.1, including gap:all-coefficient-places-zeta outside the supplier’s stated range; the correct-sign line in §0.2.

### 3.3 The all-prime CM newform converse

For every normalized CM newform of even weight k≥2, every prime p and every λ|p, prove `H_f^1(Q,M_f(h))=0 implies L(f,h) != 0`, equivalently analytic order zero at h. Apply §3.2 to the all-prime rational cohomological equality supplied by ModularIwasawaMainConjecturesPartII §CZ.6, cm-kato-main-conjecture and cm-kato-normalization-dictionary. Its independent module structure precedes the zeta construction. The proof of that equality, including elliptic units, conductor factors and the cyclotomic-field cases, belongs to its supplier. (BT Theorems 2.6 and 3.1, pp. 5–6; BT lines 208–228.)

**Checks.** Weight two at p=2 and K=ℚ(i) is included. Also at p=2, ζ₈+ζ₈³ has square −2, so K=ℚ(√−2) lies in ℚ(μ₈) and uses Kato §15.14. Weight two at ramified p=3 and K=ℚ(ζ₃) is included. For K=ℚ(√−7),p=7, the cyclotomic-field case is also included. There is no condition p∤N, no integral characteristic-ideal equality and no leading-term valuation in the conclusion.

*Needs:* statement: the CM predicate of AutomorphicGaloisRepresentations §3.15 and the central carriers of §0.3. Route: §3.2; KatoEulerSystems §§5.1, 5.3; ModularIwasawaMainConjecturesPartII §CZ.4 rational-equivariant-main-conjecture, §CZ.5 cm-contained-descent and cm-h2-torsion, and §CZ.6 cm-kato-main-conjecture and cm-kato-normalization-dictionary.

### Examples

At weights 2,4,6 the period powers are 1, 2πi, (2πi)², and the corresponding signs are +,−,+. These nonzero complex factors are used only on F-rational basis vectors. The nonzero-product implication for Euler factors works even at conductor primes and never divides by a potentially zero factor.

### Dependencies

Layer 2 supplies the basis and nonfinite localization; Layer 1 supplies the central kernel of the dual exponential. KatoEulerSystems supplies the zeta morphism and reciprocity in its stated range, with gap:all-coefficient-places-zeta for other pairs; ModularIwasawaMainConjectures §§0.6–0.7 supplies the rational equality proposition and ModularIwasawaMainConjecturesPartII §CZ.6 supplies its CM proof; pinned Mathlib and Tau Ceti supply the newform L-function and conjugate form, and ModularForms supplies the central conjugation and removed-factor identities. No consumer supplies an input to this deduction.

## Layer 4: CM elliptic curves and quadratic descent

### 4.1 The typed CM Selmer comparison

Let K be imaginary quadratic and A/K an elliptic curve with End_K(A) an order in K. Choose a finite p-adic coefficient extension L containing both embeddings of K and the coefficient fields of its two weight-two theta forms. Write `V_p A tensor L = eta directSum etaBar`, with η̄=η^∨(1) from the Weil pairing. The actual theta comparison gives `M_(f_eta) tensor L = Ind_(G_K)^(G_Q) eta^dual` and therefore `M_(f_eta)(1) tensor L = Ind etaBar`, with the conjugate statement for the other form. Apply coefficient extension, rational Kummer and finite-condition Shapiro to obtain

    H_f^1(K,V_p A) tensor_(Q_p) L
      = H_f^1(Q,M_(f_eta)(1) tensor L)
          directSum H_f^1(Q,M_(f_etaBar)(1) tensor L).

The order of the two summands reflects the conjugate dual. In particular zero classical p∞ Selmer corank over K implies that both modular finite Selmer spaces vanish. The left side is the Tate-module comparison, not a Pontryagin dual tensored with the number field K. No integral rank-one freeness at primes dividing the CM order index is needed. (BT proof of Theorem 1.1, p. 6, BT lines 253–259; the display at line 256 requires these coefficient and twist types.)

A route uses the supplied decomposition and theta induction, and global Shapiro matching the finite conditions at every place through the semilocal decomposition (gap:finite-condition-shapiro, with PadicHodgeRegulators §1.7(d) above p). Extending coefficients from ℚ_p to L multiplies the ℚ_p-dimension of every H_f¹ by [L:ℚ_p], because the Bloch–Kato conditions commute with finite direct sums; hence vanishing after tensoring with L reflects vanishing before extension. This includes curves which have no model over ℚ.

**Checks.** For K=ℚ(i),p=2 and the order of conductor two, only the rational coefficient decomposition is used. For K=ℚ(ζ₃),p=3 the two coefficient embeddings still separate after a splitting extension L. At weight two omitting the twist gives Ind η^∨, whereas the Kummer summand is Ind η̄=Ind η^∨(1); their arithmetic determinants differ by χ_cyc².

*Needs:* statement: ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2 and gap:theta-induction-arbitrary-cm-curve; §0.3. Route: GL2AutomorphicRepresentationsAndTransfer §R17.4.16 quadraticInduction; SelmerIwasawaCohomology §§2.11–2.12a, 3.6, 4.26 and gap:finite-condition-shapiro; ArithmeticGaloisDuality D7.3; PadicHodgeRegulators §1.7(d).

### 4.2 The all-prime elliptic converse over K

For any imaginary quadratic K, elliptic A/K with End_K(A) an order in K and any prime p, prove `corank_(Z_p) Sel_(pInfinity)(A/K)=0 implies L(A/K,1) != 0`. Its analytic order at one is then zero. By §4.1 both theta-form finite Selmer spaces vanish. Apply §3.3 to each and the full arithmetic factorization `L(A/K,s)=L(f_eta,s)L(f_etaBar,s)`. The product includes every conductor prime and is the actual continuation of the elliptic Euler product. (BT Theorem 1.1 and its proof, pp. 1, 6; BT lines 39–43, 253–259.)

**Checks.** The implication allows p=2 when K=ℚ(i), p=3 ramified in ℚ(ζ₃), and p dividing the conductor of the CM order. For two nonzero central factors a,b the central product ab is nonzero. The conclusion alone says nothing about finiteness of the whole Tate–Shafarevich group or its BSD valuation.

*Needs:* statement: the actual CM action, classical p∞ Selmer group and full analytic L-function in §4.1. Route: §§3.3, 4.1; ComplexMultiplicationAndExplicitReciprocity §4.2 ellipticCMLFactorization; GL2AutomorphicRepresentationsAndTransfer §R17.4.16 quadraticInduction; gap:theta-induction-arbitrary-cm-curve and gap:newform-central-analytic-interface.

### 4.3 Rational Selmer corank doubles

If A/ℚ has CM by an order in the imaginary quadratic K, prove for every p that `corank Sel_(pInfinity)(A/K)=2 corank Sel_(pInfinity)(A/Q)`. Finite-condition Shapiro for K/ℚ, the decomposition Ind V_pA≅V_pA⊕(V_pA⊗χ_K) and V_p(Aᶜʰⁱ)≅V_pA⊗χ_K identify H_f¹(K,V_pA) with H_f¹(ℚ,V_pA)⊕H_f¹(ℚ,V_pAᶜʰⁱ); the rational Kummer comparison turns these dimensions into the three coranks. The rational CM self-twist isogeny induces an isomorphism of rational Tate modules, so the two summands have equal dimension. At p=2 the decomposition of the induced representation uses the projectors (1±σ)/2, which exist only after inverting two; it is a rational, not an integral, direct sum. (BT last paragraph of Theorem 1.1 proof, p. 6; BT lines 260–261.)

**Checks.** Corank zero gives 0=2·0; corank one gives two over K. For a dyadic involution exchanging the coordinates of ℤ₂², the rational projectors have images generated by (1,1) and (1,−1); their integral sum has index two. Thus rational doubling does not prove an integral decomposition. The self-twist is only required to be an isogeny, including when two divides its degree.

*Needs:* statement: §0.1 and the base-change curve. Route: gap:finite-condition-shapiro; SelmerIwasawaCohomology §§2.11, 4.26; EllipticCurves Layers 1–2 for the isogeny on rational Tate modules and Layer 5 for the twist; ComplexMultiplicationAndExplicitReciprocity §1.2.

### 4.4 Rational analytic order doubles

For the same A/ℚ and K, prove `ord_(s=1) L(A/K,s)=2 analyticRank(A/Q)`, without a rank bound. The full quadratic factorization and the self-twist isogeny identify L(A/K,s) with L(A,s)² as actual analytic functions. Product additivity of finite analytic order yields the formula. An isogeny theorem restricted to BSD defects at ranks at most one does not supply this general identity. (BT lines 260–261.)

On native curves the hypotheses are: K is a totally complex number field of ℚ-dimension two, A is elliptic over ℚ, and the integer-scalar map to the endomorphism ring of A_K is not surjective. In characteristic zero this means that End_K(A_K) is an order in K. For any entire F,G agreeing respectively with A.LSeries and A_K.LSeries on Re(s)>3/2, prove `analyticOrderNatAt G 1 = 2 * analyticOrderNatAt F 1`. These continuations are uniquely determined. F has finite order at one by §0.1. The χ_K-twist is ℚ-isogenous to A, so its L-series equals that of A and its continuation is F; the factorization therefore gives G=F², whose order is finite.

**Checks.** A local analytic factor `(s-1)^r u(s)` with u(1)≠0 squares to order 2r: r=0,1,2 give 0,2,4. The units u(1),u(1)² are nonzero, so the finite-order convention is applicable. Omitting a conductor factor would not establish equality of the full functions.

*Needs:* statement: the unique arithmetic continuations and finite order of §0.1; the native endomorphism ring. Route: ComplexMultiplicationAndExplicitReciprocity §1.2 for the rational self-twist isogeny; gap:elliptic-quadratic-analytic-identities; EllipticCurveModularity R29.3 attachment and R29.4 IsNewformOf.coeff_eq for equal L-series of ℚ-isogenous curves; Mathlib `analyticOrderAt_mul` and `analyticOrderNatAt_mul` with analytic-at-one and finite-order hypotheses.

### 4.5 The elliptic converse over ℚ

Every CM elliptic A/ℚ satisfies the rank-zero p-converse of §0.1 for every prime p. Indeed corank zero gives corank zero over K by §4.3; §4.2 gives order zero over K; §4.4 gives 2·analyticRank(A)=0, hence analyticRank(A)=0. (BT Theorem 1.1 and (1.1), pp. 1, 6; BT lines 33, 39–42, 260–261.)

**Checks.** At p=2,K=ℚ(i) the arithmetic calculation is still 2r=0⇒r=0 in ℕ, not reduction modulo two. At p=3,K=ℚ(ζ₃) the ramification of p does not alter it. This proves the rank-zero implication only; it makes no rank-r converse for arbitrary r.

*Needs:* statement: §0.1 and CM over ℚ. Route: §§4.2–4.4.

### Examples

The Gaussian congruent-number curve supplies the dyadic case of §4.5; the Eisenstein j=0 curves supply its ramified-three case. The swapped-coordinate lattice of §4.3 has a rational ± decomposition and integral index two, making the precise dyadic boundary visible. Neither example imposes maximal CM order in §4.2.

### Dependencies

Layer 3 is the modular input. ComplexMultiplicationAndExplicitReciprocity supplies actual theta induction, CM characters and the rational self-twist. SelmerIwasawaCohomology and ArithmeticGaloisDuality supply the typed finite-condition comparison, with finite-condition Shapiro under gap:finite-condition-shapiro; isogeny invariance of rational corank at every prime follows from SelmerIwasawaCohomology §4.26 and the isomorphism of rational Tate modules induced by an isogeny of EllipticCurves Layers 1–2. EllipticCurveModularity supplies equal L-series of ℚ-isogenous curves through R29.3–R29.4 and the quadratic factorization under gap:elliptic-quadratic-analytic-identities; the central newform analytic contract supplies the newform identities. The two doubling identities are applications here, with no forward BSD theorem used as a converse input.

## Layer 5: Congruent-number twists and even Goldfeld

### 5.1 The even Goldfeld proposition

For an elliptic A/ℚ define the even Goldfeld proposition to assert that the proportion of fundamental discriminants d, counted with both signs and `0<abs d<=X`, for which L(A⁽ᵈ⁾,1)≠0 tends to 1/2. The family is unweighted (the quadratic fields of ArithmeticStatisticsPartI §0.7 ordered by |Disc|, plus d=1) and includes the trivial quadratic character up to finite-change conventions. The proposition is an exact limit. (BT §1.0.2 and footnote 1, p. 2; BT lines 47–52, 96.)

Its API is:

- It is equivalent to convergence of the stated ratio of unweighted finite counts to 1/2.
- The nonvanishing subset agrees with the subset whose actual analytic rank is zero.
- Changing finitely many parameters or the trivial-character convention preserves it, since the denominator tends to infinity.
- If two curves have identical arithmetic L-functions for each twist, the proposition holds for one exactly when it holds for the other.

**Checks.**

- If every twist has analytic rank zero, the limiting ratio is 1, so the proposition is false.
- If none has analytic rank zero, the limiting ratio is 0, again false.
- The positive squarefree parameters n=1,2,3 have discriminant magnitudes (1,4), (8,8), (12,3) for their two signs. Treating both cutoffs as n would change the height.
- A constant limiting ratio 3/4 has liminf at least 1/2 but fails this proposition. A lower bound cannot replace the exact limit.

*Needs:* statement: ArithmeticStatisticsPartI §§0.1, 0.7; EllipticCurves Layer 5; §0.1 analytic order. Route: its §0.1 finite-change and relative-density rules.

### 5.2 Density-one nonvanishing in the even positive family

Let A:y²=x³−x and `S(X)={n : 0<n<=X, Squarefree n, n mod 8 in {1,2,3}}`. Prove that the proportion of n∈S(X) with L(A⁽ⁿ⁾/ℚ,1)≠0 tends to one. Apply the unconditional positive-family Smith corank-zero input to obtain a relative-density-one subset with corank Sel₂∞=0. Every twist remains CM by ℤ[i], so §4.5 at p=2 gives nonvanishing. Inclusion and the upper bound one squeeze the ratio. (BT Theorems 1.2, 3.3 and their proof, pp. 2, 6; BT lines 50–52, 265–269.)

Define `congruentTwist` on all integers n as the native short curve with a₄=−n² and a₆=0. For n≠0 this is A⁽ⁿ⁾ up to pointed isomorphism; the sign n↦−n leaves the displayed model unchanged. The headline `congruentNumber_densityOne` states the limit with natural cutoffs X, finite intervals 1≤n≤X and `ellipticLNonvanishingAtOne` as the numerator predicate. Natural cutoffs give the same limit as real cutoffs by taking integer parts.

Its model API is:

- The first three coefficients and a₆ vanish, and a₄=−n².
- Its discriminant is 64n⁶; it is elliptic exactly when n≠0, and then j=1728.
- Its models at n and −n coincide; for n≠0 it represents the quadratic twist class of n.

**Checks.**

- At n=1 the model is y²=x³−x and Δ=64; at n=2 it is y²=x³−4x and Δ=4096. A coefficient −n would give Δ=512 at n=2 and the wrong twist.
- At n=−1 the coefficients again give y²=x³−x and Δ=64, testing the sign isomorphism used in §5.4.
- At n=0 its discriminant is zero; the positive-squarefree and nonzero-discriminant filters exclude this singular value.

- The curve has four rational two-torsion points, so dim Sel₂≥2 even on the corank-zero subset; corank zero does not mean that the finite Sel₂ group vanishes.
- The roots 0,1,−1 give the Smith obstruction products −1,2,2, none rational squares.
- In the family of positive squarefree n, each residue 1,2,3 has count X/π²+o(X); hence #S(X)=3X/π²+o(X)>0 eventually.

*Needs:* statement: §5.1 twists and actual L-values; ArithmeticStatisticsPartI §§0.5–0.6. Route: §4.5; ArithmeticStatisticsPartVII §5.9 and gap:smith-unconditional-positive-corank; SelmerIwasawaCohomology §4.29.

### 5.3 Exactly half in positive-squarefree ordering

For A:y²=x³−x and `P(X)={n : 0<n<=X, Squarefree n}`, prove `# {n in P(X) : L(A^(n),1) != 0}/#P(X) -> 1/2`. The root numbers of positive squarefree twists are +1 precisely in residues 1,2,3 modulo eight. The remaining residues 5,6,7 have sign −1; the functional equation forces their central value to vanish. Thus all nonzero values lie in S. Since #P(X)=6X/π²+o(X) and §5.2 gives #S(X)+o(X) nonzero values, the exact density is one half. (BT abstract, Theorem 1.2 and footnote 2, pp. 1–2; BT lines 12–13, 50–52, 97.)

The headline `congruentNumber_half_positive` uses the same native model, nonvanishing predicate and natural cutoffs as §5.2, with the residue condition omitted from both counts and limit 1/2.

**Checks.** Residues 0 and 4 contain no squarefree positive integers; each of the other six has mass 1/6, so the three permitted classes have mass 1/2. Sign −1 gives Λ(1)=−Λ(1), hence Λ(1)=0 over ℂ. It implies an odd positive analytic order, not order exactly one. Applying this positive residue table to negative n without a character conversion is excluded.

*Needs:* statement: §5.2 and the full analytic functions. Route: EllipticCurveModularity §R29.6 functional equation and gap:congruent-number-root-numbers; ArithmeticStatisticsPartI §0.6 and its density-one-to-half comparison.

### 5.4 Exact half-density for fundamental discriminants

Prove the even Goldfeld proposition of §5.1 for A:y²=x³−x, with both signs ordered by |d|. Use A⁽⁻ⁿ⁾≅A⁽ⁿ⁾ and the signed-squarefree-part description of a fundamental discriminant. For odd n its two sign cutoffs are n and 4n; for even squarefree n they are both 4n. Apply ArithmeticStatisticsPartI §0.1's piecewise rescaling with its §0.6 residue asymptotics. The allowed residues have total reciprocal-cutoff weight `5/4 + 1/2 + 5/4 = 3` out of total weight 6. Density one restricts from S to each of its positive-density residue classes, so the bad subset remains o(X) after each of these finitely many rescalings. Root numbers give the matching upper bound. (BT §1.0.2 and Theorem 1.2, p. 2; BT lines 47–52; ArithmeticStatisticsPartI §0.1, “Piecewise rescaling of a height”.)

The headline `congruentNumber_half_discriminants` counts d∈[−X,X]⊂ℤ, d≠0, satisfying either d≡1 modulo four and Squarefree d, or d=4m with Squarefree m and m≡2 or 3 modulo four. This is the both-sign fundamental-discriminant family including d=1. Its numerator tests `congruentTwist d`: when d=4m, scaling X↦4X,Y↦8Y identifies that model with the twist at m, so the central L-value is the intended one.

**Checks.** At n=1 the discriminants are 1,−4; n=2 gives 8,−8; n=3 gives 12,−3. The filter rejects 0, 4 and 9; 4 would require m=1 in a residue-two-or-three branch, and 9 is not squarefree. At d=8 the coefficient is −64, while the squarefree twist n=2 has coefficient −4; scaling by 2⁴ gives −64 as required. The even class contributes 1/4+1/4=1/2, not two. The allowed total 3 and full total 6 give 1/2; using an identical height for both signs of every n would miss these terms.

*Needs:* statement: §5.1. Route: §§5.2–5.3; ArithmeticStatisticsPartI §0.1 and §§0.5–0.7; EllipticCurves Layer 5 for the sign isomorphism; EllipticCurveModularity §R29.6 functional equation and gap:congruent-number-root-numbers for the upper bound.

### Examples

The six positive squarefree residue classes all contribute X/π² in the n-ordering. In discriminant ordering the odd classes each have reciprocal weight 5/4 and the even classes each 1/2. The three allowed classes therefore contribute 3X/π² of the total 6X/π². The rank-zero subset has precisely these leading constants by §5.2; an unspecified positive proportion would not establish either exact half-density result.

### Dependencies

Layer 4 provides the all-prime elliptic converse. ArithmeticStatisticsPartVII supplies the unconditional Smith endpoint specified by its gap, and SelmerIwasawaCohomology provides dyadic parity. ArithmeticStatisticsPartI supplies every family, count and height-rescaling theorem. EllipticCurveModularity §R29.6 supplies the analytic continuation and functional equation, and gap:congruent-number-root-numbers specifies their signs on this family. None of these statistics is inferred from a finite Sel₂ dimension.

## Layer 6: CM twists, cube sums and non-descent

### 6.1 At least half of CM twists are nonvanishing

Let K be imaginary quadratic with three split or ramified and A/K elliptic with CM by any order of K, all endomorphisms defined over K. With H(t) the odd-valuation support height and each t∈K×/K×² counted once, prove

    liminf_(X -> infinity)
      # {t : H(t)<X, L(A^(t)/K,1) != 0} / # {t : H(t)<X} >= 1/2.

For every number field K, define `squareclassHeight` as the finite product of absolute norms of primes where the principal fractional ideal of a representative has odd integer valuation. Its domain is `TauCeti.SquareClassGroup K`; a chosen nonzero representative is used only to evaluate the formula. This restates ArithmeticStatisticsPartI §0.5's squareclassHeight on the same carrier for the headline signatures; all height API facts below apply to every number field K. The CM nonvanishing theorem uses the imaginary quadratic case. (BKLOS §2, p. 2, BKLOS lines 80–98.)

Its height API is:

- Changing a representative by a square changes every valuation by an even integer and leaves the height unchanged.
- The odd support is finite, the height is a positive integer, and the identity class has height one.
- The sets with height less than X are finite; for X≤1 they are empty. Their cardinalities are the finite-set cardinalities used by the statistics supplier.

**Checks.**

- Over ℚ the classes of 2 and 1/2 have valuations 1 and −1 at two; both heights are 2. Using only positive odd valuations would give height 1 for 1/2.
- In ℚ(i), H([5])=25 and H([3])=9, for split five and inert three. Replacing 5 by 5·2² changes valuations by even integers and leaves height 25.
- The distinct unit classes [1] and [i] in ℚ(i) both have height 1; also 2=−i(1+i)² gives [2]=[i] and height 1. Thus H<1 is empty and H<2 has at least these two classes. Height one does not force a trivial squareclass.

The headline `cmTwists_nonvanishing_lowerHalf` takes K totally complex of ℚ-dimension two, the non-primality of the ideal (3), an elliptic A/K, and non-surjectivity of ℤ→End_K(A). For such K the last condition means CM by an order of K, and non-primality of (3) means three is split or ramified. It states that for each real ε>0 and all sufficiently large real X, the nonvanishing count is at least (1/2−ε) times the total count. It uses native squareclasses once each and the trace/norm twist at (0,−t), which represents the class t. The supplier's positive linear denominator makes this formulation equivalent to the displayed lower proportion.

The supplier's unconditional 3∞-corank-zero subset has lower proportion at least one half. Apply §4.2 at p=3 to every member and use monotonicity. The supplier's maximal-order route uses a norm-three ideal isogeny with Selmer ratio one; its passage to other orders uses isogeny invariance of rational corank, including when three divides the degree. No hypothesis on a windowed cubic count is silently discharged in this application: gap:cm-three-selmer-unconditional specifies the needed unconditional endpoint. (BT Proposition 1.3, Theorem 3.5, pp. 2, 7, BT lines 58–60, 273–276; BKLOS Theorem 2.7, §9.2 and §11, pp. 5, 14, 18–19, BKLOS lines 654–661, 831–879.)

**Checks.** In ℚ(ζ₃), three ramifies and the theorem applies; in ℚ(i), three is inert and this twist theorem's hypothesis fails even though the all-prime converse itself holds. In ℚ(√−2), three splits: T²+2=(T−1)(T+1) modulo three, and the quotient of the integer ring by (3) is 𝔽₃×𝔽₃, so (3) is not prime. The height-one set need not be a singleton: in ℚ(i), [1] and [i] have height one. A ratio tending to 3/4 is consistent with this lower bound, so no exact half-density is claimed.

*Needs:* statement: the CM, twist, actual L-function and height carriers of §4.2 and ArithmeticStatisticsPartI §0.5. Route: §4.2; ArithmeticStatisticsPartVII §5.11 and gap:cm-three-selmer-unconditional; SelmerIwasawaCohomology §4.26 with the isogeny isomorphism of rational Tate modules from EllipticCurves Layers 1–2; ArithmeticStatisticsPartI §0.15 for the positive denominator.

### 6.2 The cube-sum model and pointed comparison

For n∈ℤ define the cube-sum model as `WeierstrassCurve.shortCurve 0 (-27 * (n : Q)^2)`, the cube-sum model over ℚ with coefficients `(a1,a2,a3,a4,a6)=(0,0,0,0,-27 n^2)`. Thus Y²=X³−27n². The definition is total; all elliptic applications require n≠0. Its smooth projective cubic comparison has source `x^3+y^3=2n z^3` with origin [1:−1:0] and target the Weierstrass cubic with origin [0:1:0]. For n≠0 use

    [x:y:z] -> [6n z : 9n(x-y) : x+y],
    [X:Y:Z] -> [9n Z+Y : 9n Z-Y : 3X].

Both composites are multiplication by 18n, nonzero over any characteristic-zero coefficient extension. For `F=x^3+y^3-2n z^3` and `G=Y^2 Z-X^3+27n^2 Z^3`, direct polynomial expansion gives `G(forward)=108n^2 F` and `F(inverse)=54n G`. This verifies both directions and the origins. On the affine chart x+y≠0 the map is X=6n/(x+y), Y=9n(x−y)/(x+y); the projective map supplies the points outside that chart. (BT Remark 3.6(i), p. 7, BT lines 277–278; the substitutions and identities are the explicit algebraic calculation for this model.)

Its API is:

- Its first four coefficients are zero and its sixth coefficient is −27n².
- The discriminant is −2⁴·3⁹·n⁴. Over ℚ it is elliptic exactly when n≠0.
- Replacing n by −n leaves the same Weierstrass model.
- For n≠0 its native j-invariant is zero, since c₄=0 and Δ is a nonzero unit.
- The displayed projective maps give a pointed isomorphism for n≠0, including the origin rather than only the affine chart.
- Coefficient base change is the native map; all displayed substitutions commute with it. For the equation x³+y³=2n, the conventional coefficient −1728n² is obtained by X↦4X,Y↦8Y. The coefficient −432n² is the conventional model for x³+y³=n, with a different source parameter.

**Checks.**

- At n=1, a₆=−27, Δ=−314928 and (x,y)=(1,1) maps to (X,Y)=(3,0), with 0=27−27. The coefficient −432 would fail this point at this scale.
- At n=0, Δ=0 and the curve is not elliptic. Both composite scalars are zero, so the displayed linear maps are not an isomorphism.
- At n=−1 the model is the same and (−1,−1) maps to (3,0), because 6(−1)/(−2)=3.
- At n=3, a₆=−243 and Δ=−314928·81=−25509168. Using n or n³ instead of n² changes the discriminant scaling.
- The source origin maps to [0:18n:0]=[0:1:0]. Pullback sends the target uniformizer X/Y to 2z/(3(x−y)), of order one at [1:−1:0]; thus the degree-one origin places agree. At n=1, marking (1,1) instead would give (3,0), not the target origin. An affine-only correspondence would not establish the pointed comparison.

*Needs:* statement: native Weierstrass curves, `WeierstrassCurve.shortCurve` and invariants; AlgebraicCurves Layer 10 and gap:pointed-cubic-model-comparison for the plane cubic’s function field and its marked degree-one place. Route: that general pointed comparison and elementary polynomial algebra; no new projective-scheme carrier.

### 6.3 CM and ramified three for the cube-sum family

For each fixed n≠0, prove that the model of §6.2 over K=ℚ(ζ₃) has full CM by ℤ[ζ₃]. Prove both ellipticity over ℚ and an isomorphism from the native ring of integers of `CyclotomicField` to its native algebraic endomorphism ring after base change. This is an existence statement about the full CM ring; the geometric action below identifies its two conjugate choices of generator. Its automorphism `(X,Y) -> (zeta_3 X,Y)` fixes the origin and satisfies 1+α+α²=0 in the elliptic endomorphism ring. It gives the injective action of the maximal order ℤ[ζ₃]; the characteristic-zero elliptic endomorphism classification identifies the full ring. Since disc K=−3 and (3) is the square of its unique prime above three, §6.1 applies to the quadratic twists of this fixed curve over K. (BT Remark 3.6(i), p. 7, BT lines 277–278; the explicit action uses §6.2 and the CM-order contract.)

**Checks.**

- ζ₃³=1 preserves X³−27n² while α≠1 and α³=1; the identity automorphism would give 1+1+1=3≠0 in the endomorphism ring.
- Over ℚ the same nonzero-n model has endomorphism ring ℤ; the order-three automorphism requires ζ₃ in the coefficient field. This tests the field hypothesis in the descent contract.
- The field polynomial T²+T+1 has discriminant −3; the prime above three has norm three and square norm nine.
- At n=0 the singular cubic is outside the elliptic statement. The parameter n is fixed, so no density of rational cube sums in integer n follows.

*Needs:* statement: §6.2 and the native algebraic endomorphism ring. Route: j=0 in §6.2; ComplexMultiplicationAndExplicitReciprocity §1.1 idealLatticeCurve.endomorphismRing and idealLatticeCurve.automorphism_factors, and gap:cube-sum-full-cm for descent to the coefficient field. For the application of §6.1 use Mathlib `IsCyclotomicExtension.Rat.discr_odd_prime'`, `IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`, `IsCyclotomicExtension.Rat.map_eq_span_zeta_sub_one_pow` and `IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one` at p=3; they give discriminant −3, prime norm 3 and ramification index 2.

### 6.4 Descending twists lie in at most two cosets

For any field K with a specified ℚ-algebra structure, hence of characteristic zero, and a Weierstrass curve W/K define pointed descent to ℚ by `descendsToRat`: there exist an elliptic Weierstrass E/ℚ and a native change of variables C over K with `C • E.map(algebraMap Q K)=W`. Its domain is the actual curve; the descent is of the pointed elliptic curve, not of its displayed equation or its chosen CM action. Its API below holds over any such K; the coset and counting theorems of §§6.4–6.6 apply it with K imaginary quadratic. This definition is used in the headline `cmTwists_nondescending_nonvanishing_lowerHalf` in Suggested.lean. (BT Remark 3.6(ii), p. 7; BT lines 279–282, for pointed descent.)

Its API is:

- A base change of an elliptic E/ℚ descends, taking the identity change of variables.
- A pointed K-isomorphism preserves descent in both directions, by composing or inverting changes of variables.
- Descent forces the j-invariant to belong to the image of ℚ in K; that necessary condition alone does not select a rational twist class.
- Replacing the nonzero twist parameter by a square multiple leaves the descent predicate unchanged. Twisting by the trivial squareclass preserves the isomorphism class.

**Checks.**

- The base change of Y²=X³−X over ℚ(i) descends with C=1; requiring the chosen equation coefficients themselves to be rational after every variable change would reject an isomorphic model.
- The elliptic model Y²=X³+X+(1+i) over ℚ(i) has j=6912/(4+54i), with nonzero imaginary part, so it does not descend. Its discriminant −16(4+54i) is nonzero.
- In K=ℚ(√−2), the twist parameter t=√−2 of Y²=X³−X descends to Y²=X³+2X. It is outside ℚ×K×²: a square (a+b√−2)² with rational part zero would require a²=2b² with nonzero rational a,b. This witnesses the necessary second coset at j=1728.
- For any nonzero t, replacing it by 4t multiplies short-twist coefficients by 4² and 4³ and gives an isomorphic curve. The parameter zero is excluded and cannot represent a quadratic twist.

For any elliptic A/K let D_A be the set of squareclasses t whose twist descends. If it is empty, it satisfies every upper bound below. If t₀∈D_A, prove D_A is contained in the rational squareclass coset t₀·im(ℚ×/ℚ×²), except that at j=1728 it may also meet t₀√D·im(ℚ×/ℚ×²). Here K=ℚ(√D) with D<0; one coset suffices when j≠1728, including j=0. Use any negative rational D, a chosen unit θ with θ²=D, arbitrary quadratic K/ℚ and the native twist specialization (0,−t), whose parameter is 4t. For all nonzero t,t₀ whose twists descend, conclude `t=t0 q u^2` or, with j=1728, `t=t0 theta q u^2`, for q∈ℚ× and u∈K×. (BT Remark 3.6(ii), p. 7, BT lines 279–282; this explicit coset bound is the model-classification argument giving its descent estimate.)

A proof route first replaces A by one descended twist E₀/ℚ. Put s=t/t₀. For j≠0,1728 all rational curves with that j are rational quadratic twists, giving one coset. At j=0 use rational short coefficients B,B′: an isomorphism requires B·s³/B′ to be a sixth power in K. In K×/(ℚ×K×²) this says [s]³=1, and the quotient has exponent two, hence [s]=1. At j=1728 the fourth-power condition gives s²∈ℚ×K×⁴. After dividing by a square, s has square in ℚ, so it is rational or rational times √D. These are pointed Weierstrass comparisons and require no descent of A itself.

**Checks.** For j=0, an element of an exponent-two group has [u]³=[u], so [u]³=1 forces the identity. For j=1728 over ℚ(√−2), the parameter √−2 sends Y²=X³−X to a short twist Y²=X³+2X, both rational models, and supplies the second coset described above. At t=t₀ the first branch holds with q=u=1; no hypothesis that t₀=1 occurs.

*Needs:* statement: native curves, `WeierstrassCurve.VariableChange`, `WeierstrassCurve.quadraticTwistOf`, `Algebra.IsQuadraticExtension` and `descendsToRat`. Route: EllipticCurves Layer 5 for pointed twists; `WeierstrassCurve.variableChange_a₄_of_isShortNF`, `WeierstrassCurve.variableChange_a₆_of_isShortNF` and `WeierstrassCurve.smul_shortCurve` for the exceptional values in characteristic zero; the native generic twist classification with its exceptional values excluded.

### 6.5 Descending twists have height density zero

For every fixed elliptic A/K with K imaginary quadratic, prove `# {t in D_A : H(t)<X} = O_(A,K)(sqrt X)`. This is independent of CM and does not require A to descend. In a fixed coset a·im(ℚ×/ℚ×²), represent rational classes by signed squarefree integers n. Outside the fixed finite set of primes ramified in K or in the odd support of a, a rational prime ℓ|n contributes ℓ² to H_K([n]): two split primes each of norm ℓ, or one inert prime of norm ℓ². Ramified primes and fixed support give only bounded factors. Thus H_K(a[n])≥c·n_out² for a fixed c>0. There are O(√X) possible n_out and finitely many choices at the excluded primes and for the sign. Duplicate rational images only decrease the count. Apply §6.4 to at most two cosets. (BT Remark 3.6(ii), p. 7, BT lines 279–282; BKLOS §2, p. 2, BKLOS lines 80–98 for the height; this support calculation proves the stated bound.)

Equivalently, for every totally complex number field K of ℚ-dimension two and every elliptic A/K, prove: there exists a real C>0 such that, for all sufficiently large real X, the count of native squareclasses below `squareclassHeight` X whose twists satisfy `descendsToRat` is at most C√X. If the descent set is empty take C=1; otherwise one descending twist supplies t₀ in §6.4.

By ArithmeticStatisticsPartI §0.15, the total count is c_KX+o(X), c_K>0, so division gives height density zero. Its support-ideal proof counts squarefree ideals with class in Cl(K)² and finite unit/Selmer fibres; it never assumes every ideal is principal.

**Checks.** In K=ℚ(i), ℓ=5 splits and H([5])=5·5=25; ℓ=3 is inert and H([3])=9, agreeing with ℓ² in both cases. The ramified rational 2 has even valuation at the prime above two and H([2])=1, showing why ramified primes are separated. A finite union of two O(√X) sets is O(√X), and √X/X→0.

*Needs:* statement: §6.4; ArithmeticStatisticsPartI §0.5 support height and Northcott finiteness. Route: its finite support fibres and §0.15 positive linear denominator; elementary quadratic prime factorization. No statistical numerator theorem is used.

### 6.6 Non-descending nonvanishing twists

Under the hypotheses of §6.1, prove that the lower proportion of t with H(t)<X, A⁽ᵗ⁾ not descending to ℚ and L(A⁽ᵗ⁾/K,1)≠0 is at least one half. The same bound holds when the denominator is restricted to non-descending twists. Subtract the O(√X) descending set of §6.5 from the nonvanishing numerator of §6.1. Against c_KX+o(X) the lost ratio tends to zero. The restricted denominator divided by the full denominator tends to one, so it is positive eventually and the second lower bound follows. (BT Remark 3.6(ii), p. 7; BT lines 279–282; the source states a positive proportion, and the one-half bound is derived here from §§6.1 and 6.5.)

The headline `cmTwists_nondescending_nonvanishing_lowerHalf` uses exactly the field, prime, ellipticity and CM hypotheses of `cmTwists_nonvanishing_lowerHalf`. For each ε>0 it gives the eventual lower count (1/2−ε) times the full denominator, with `¬ descendsToRat` added to the numerator. The bound with the restricted denominator is the consequent comparison described above.

**Checks.** If total count is cX+o(X), nonvanishing count has lower ratio 1/2, and the excluded count is at most C√X, the new ratio has lower bound `1/2 - (C/c)/sqrt X + o(1)`, tending to 1/2. If the original limit were 3/4, removal of this set would leave 3/4; the theorem does not force equality with 1/2. Empty descent set gives the original numerator and denominator exactly.

*Needs:* statement: §6.1 and the actual pointed descent predicate of §6.4. Route: §§6.1, 6.5; ArithmeticStatisticsPartI §§0.1–0.2, 0.15.

### Examples

For n=1 the cube-sum cubic maps (1,1) to (3,0) on Y²=X³−27; for n=−1 the point (−1,−1) maps to the same point on the same model. Both have j=0 and Eisenstein CM. Fixing either curve, the ramified-three statistical input yields the lower half-proportion over ℚ(ζ₃). The non-descending restriction retains that lower bound. This is a statement about K-squareclasses of twists of a fixed curve, not a density statement in n.

### Dependencies

Layer 4 supplies the all-prime converse over K. ArithmeticStatisticsPartVII supplies the unconditional corank numerator in its exact height; ArithmeticStatisticsPartI supplies the positive total denominator. Native curves and EllipticCurves supply Weierstrass models and twist comparisons; AlgebraicCurves Layer 10 supplies the general plane-cubic function-field comparison. ComplexMultiplicationAndExplicitReciprocity supplies the full CM identification for the cube-sum application. The descent estimate itself uses only model classification, quadratic prime factorization and the height-family contract.

## Downstream consumers

RankZeroOneBSDPartII consumes the rank-r implication of §0.1 and the all-prime CM nonvanishing theorem for rank-zero BSD comparisons without a good-reduction restriction. Analytic twist applications use §5.4 for both-sign fundamental discriminants and §6.6 for non-descending K-twists; those two heights and the distinction between exact density and a lower proportion are part of the interface. Arithmetic refinements involving an integral characteristic ideal, a leading BSD quotient or the distribution of positive-rank analytic orders require their own theorems.

## References

All external locators use the versions listed here; line numbers refer to their source-service extractions.

- **BT.** Ashay A. Burungale and Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2), arXiv:2506.03465v2, 11 October 2025, pp. 1–7; published in Annals of Mathematics 203 (2026), 1–13. The numbered locators here are the seven-page arXiv version: (1.1) and Theorem 1.1, p. 1, BT lines 24–43; Theorem 1.2 and Proposition 1.3, p. 2, BT lines 47–60; Theorem 2.6, p. 5, BT lines 208–218; Theorem 3.1 and proof, pp. 5–6, BT lines 224–261; Theorems 3.3, 3.5 and Remark 3.6, pp. 6–7, BT lines 265–282.
- **Kato.** Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/article/AST_2004__295__117_0.pdf), Astérisque 295 (2004), 117–290. §6.3, p. 161, Kato lines 1750–1756; Theorems 12.4–12.5, pp. 221–222, Kato lines 4046–4095; Conjecture 12.10, p. 224, Kato lines 4165–4168; (14.9.3), (14.9.5), pp. 239–240, Kato lines 4740–4790; (14.10.1)–(14.10.5), pp. 240–241, Kato lines 4793–4812; Proposition 14.12 and §14.13, pp. 241–242, Kato lines 4832–4861; §§15.13–15.17, pp. 264–265, Kato lines 5704–5772.
- **BKLOS.** Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman, [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf), Duke Mathematical Journal 168 (2019), 2951–2989. Locators here use the 25-page author version: height in §2, p. 2, BKLOS lines 80–98; Theorems 2.5 and 2.7, pp. 4–5; §9.2, p. 14, BKLOS lines 654–661; Theorem 11.2 and the proof of Theorem 2.7, pp. 18–19, BKLOS lines 831–879. The Selmer-strength input is the even three-Selmer argument inside §9.2, transported to arbitrary orders by the isogeny in §11.
