# Roadmap: elliptic modularity and effective residual comparisons

**Summary.** Starting from modularity of every elliptic curve over ℚ, build effective comparisons between its residual torsion representation and weight-two newforms. The endpoints are Martin’s sharp newspace dimension bound, the removed-multiplicative-prime exponent bound, Kraus’s exact-conductor realizations with rational and full rational two-torsion, the uniform two-torsion irreducibility bounds, and Lemos’s surjectivity theorem for non-CM curves admitting a nontrivial rational cyclic isogeny. The six layers retain wild conductor contributions and both coefficient-prime and dyadic phenomena.

## Scope and ownership

This roadmap continues EllipticCurveModularity: its Layers R29.3–R29.6 end at modularity, exact arithmetic conductor, modular quotients and parametrisations. Here the new conclusions are effective residual comparisons and uniform image bounds. EllipticCurveModularity R29.1’s finiteness of the reducible-prime set for each fixed curve has no dependency on the uniform bounds here.

The following objects retain their existing owners. Mathlib supplies prime factorization, Möbius convolution, integer and field norms and the Minkowski ideal-class bound. Tau Ceti supplies the actual newspace, diamond eigenspaces, characteristic-zero Sturm equality, geometric torsion action, isogenies and geometric kernels. ModularForms Layers 4, 8G and 10 supply primitive decomposition, coefficient-field orbit degree and the full Γ₀ dimension formula. The coefficient-degree estimate is consumed as the dimension consequence of the independent conjugate eigenlines in Layer 8G. SerreWeightAndLevelOptimisation §§2.8, 4.8, 6.1–6.3 owns optimized lifts and the deletion level. NeronModelsAndSemistableAbelianVarieties §5.3h owns the full residual conductor formula. ModularCurvesPartII §§16.2–16.6 and AutomorphicGaloisRepresentations §§6.1, 6.4 own rational-newform elliptic quotients, their Tate comparison and exact conductor. EisensteinIdealAndRationalTorsion §§2.3, 6.3–6.4 and 7.9 owns the nonzero finite Eisenstein quotient, its cusp formal immersion, the potential-good-reduction consequence and the general geometric cuspidal-divisor torsion theorem of Manin–Drinfeld, for every smooth projective congruence modular curve over a number field, nonsquarefree levels and Cartan quotients included; Layer 5 applies that theorem to the mixed Cartan curves and states no cuspidal-torsion target of its own. HeightsRationalPointsAndObstructions §§1.15b–1.18 owns the full torsion specialization under e<q−1. ImaginaryQuadraticClassNumber H1.1–H1.4, H3.5 and H3.6 owns quadratic integral models, the six values γ₂(τ_D)∈{0,−32,−96,−960,−5280,−640320}, the certified singular values j(τ_D)=γ₂(τ_D)³ with recovery of the order from its CM j-value, and the exhaustive class-number-one classification; its H3.2 owns the general Siegel functions with their transformation law, modular-product criterion and integrality. These results are imports rather than targets below.

Layers 0–5 supply the effective residual comparisons used by continuations of EllipticCurveModularity. The newspace correction formula, the arithmetic norm comparison, Kraus’s filters and realization arguments, the prime and composite rational cyclic-degree classification, and the five-level Cartan argument belong here. The general ideal-valued Sturm comparison and the quantitative elliptic-isogeny bound required by those arguments are explicit targets, with full coefficient and number-field generality. The four exceptional-prime point exhaustions belong here. The winding application retains its specific mixed-level boundary and nonvanishing calculation; general modular curves, integral Hecke pairings and Jacobian quotients are supplied by their named owners. The finite rational-point and residual-image conclusions are mathematical exhaustiveness theorems, with all primes in their quantified ranges.

## Conventions

An elliptic curve E over ℚ is a `WeierstrassCurve ℚ` with `WeierstrassCurve.IsElliptic`; the discriminant is a unit, so a singular cubic is excluded. Arithmetic conductors and minimal discriminant valuations refer to that same curve, and v_q is the nonnegative exponent, not the prime power q raised to that exponent. All levels are positive. Arithmetic functions may have a stated value at zero, but no modular space is assigned level zero.

Write g(N) for `newDimension N`, the complex dimension of `TauCeti.cuspFormsNew N 2` intersected with `cuspFormCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ)`. The Γ₁ newspace is restricted to trivial character before its dimension is used. Write I(N) for `(CongruenceSubgroup.Gamma0 N).index`; thus I(N)=N∏_(q∣N)(1+1/q). This I is Kraus’s μ-index. The Möbius function is written μ, and its convolution square is λ₀=μ∗μ. Here ζ denotes the arithmetic function equal to one at every positive integer and zero at zero, whereas δ is the Dirichlet convolution identity supported at one. A coefficient prime is written λ, so neither λ nor I denotes a correction coordinate; write V∞ for the product of cusp corrections. Martin’s five coordinates are (s,v∞,v₂,v₃,m), with m=μ on prime powers. Subtraction in all dimension expressions is in ℚ or ℝ. Natural exponents in local tables are used only in branches where they are nonnegative.

For a normalized newform f, K_f is the field generated by all its actual Fourier coefficients, and coefficients are integral in its actual ring of integers. A prime λ above ℓ has contraction (ℓ) in ℤ. Bounds for a field norm quantify over every ℚ-embedding into ℂ. Arithmetic Frobenius has elliptic polynomial `X^2 - a_q(E)*X + q` on covariant torsion; its determinant is q. Any cohomological realization is dualized or twisted before this polynomial is used. At a split multiplicative prime the sign is + and the removed-prime trace is q+1; at a nonsplit multiplicative prime it is − and the trace is −(q+1).

M is the arithmetic conductor of E; M₀ deletes q once when q∥M and ℓ divides v_q(Δ_min). The coefficient prime q=ℓ is included in that deletion rule. N is the full Artin conductor of E[ℓ] away from ℓ, including Swan exponents. Equality M₀=N is asserted only with the local hypothesis in Layer 3. For ℓ=5,7 the weight-two hypothesis does not replace that hypothesis.

Geometric endomorphisms and torsion are over a fixed algebraic closure ℚ̄; coefficient fields have independent universes. Irreducible means irreducible over 𝔽_ℓ. All maps of elliptic curves are pointed, and cyclic kernels are geometric kernels. The final image theorem uses geometric non-CM and an isogeny of degree greater than one. In Layer 1 p is a removed conductor prime distinct from ℓ; in Layer 5 p is the residual prime and r is an isogeny prime.

For a positive r coprime to p, the mixed split quotient is `X0(r*p^2)/w_(p^2)`, retaining the r-level. All fibre products of coarse modular curves mean their smooth projective normalizations. The winding path runs from 0 to i∞, and the modular differential is 2πi f(z)dz. With t=exp(2πiz/w) at a cusp of width w, it becomes w f(t)dt/t; f=t+O(t²) therefore gives cotangent w dt. For the unscaled path integral W(f)=i∫₀∞f(it)dt, the identity is L(f,1)=−2πi W(f); for the differential integral it is ∫_(0 to i∞)2πi f(z)dz=−L(f,1). The sign does not affect nonvanishing, and is kept in every comparison.


**Normalization checks.**

- For y²+y=x³−x over 𝔽₂, #E=5, so a₂=−2 and the arithmetic torsion polynomial is X²+2X+2 with roots −1±i. Their product is 2; the inverse geometric operator has polynomial X²+X+1/2 and product 1/2.
- The two Fourier terms q+2q² have Mellin value 1+2/2=2 at s=1. Integration of 2πi(q+2q²)dz along 0 to i∞ gives −2, while the unscaled integral is i/π. This pins the winding sign and 2πi factor without using nonvanishing to conceal a rescaling.
- At a cusp of width p=11, f(t)=t+2t² gives 11dt+22t dt. Its cotangent is 11dt, which is nonzero in residue characteristic 23; replacing the differential by its constant Fourier coefficient gives zero.

## Exact supplier contracts

### From Mathlib

Use `Nat.factorization` and `Nat.prod_factorization_pow_eq_self` in `Mathlib/Data/Nat/Factorization/Defs.lean`; reconstruction requires N≠0. Use `ArithmeticFunction.moebius`, `ArithmeticFunction.moebius_apply_prime_pow`, `ArithmeticFunction.moebius_mul_coe_zeta` in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, and `ArithmeticFunction.sigma`, `ArithmeticFunction.sigma_zero_apply` in `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean` for the integer Dirichlet convolution and divisor multiplicity. The Euler product is `Nat.totient_eq_mul_prod_factors` in `Mathlib/Data/Nat/Totient.lean`.

Use `Algebra.norm_eq_prod_embeddings` and `Algebra.isIntegral_norm` in `Mathlib/RingTheory/Norm/Transitivity.lean`, with finite separable field extension and the displayed scalar tower; `Algebra.norm_ne_zero_iff` in `Mathlib/RingTheory/Norm/Basic.lean`, with finite-free domains; `Ideal.absNorm_mem` and `Ideal.absNorm_dvd_norm_of_mem` in `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`, with the infinite Dedekind and finite-free integer hypotheses; and `Algebra.coe_norm_int` in `Mathlib/NumberTheory/NumberField/Norm.lean` for the ℤ-to-ℚ norm comparison. `card_algHom_le_finrank` in `Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean` bounds embeddings of a finite-free algebra into a domain. The native irreducibility condition is `Representation.IsIrreducible` in `Mathlib/RepresentationTheory/Irreducible.lean`, the simple nontrivial order of subrepresentations. `AddMonoidHom.toZModLinearMap` in `Mathlib/Algebra/Module/ZMod.lean` views an additive map of `ZMod n` modules as linear; `AddSubgroup.torsionBy.zmodModule` in `Mathlib/Algebra/Module/Torsion/Basic.lean` supplies the torsion scalar action. The Minkowski ideal-class representative is `NumberField.exists_ideal_in_class_of_norm_le` in `Mathlib/NumberTheory/NumberField/ClassNumber.lean`, applied only after identifying the actual quadratic discriminant and signature.

### From Tau Ceti

`TauCeti.cuspFormsNew` in `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean` is the Petersson orthogonal complement of old forms inside the Γ₁ cusp space, with an explicit nonzero-level binder. `cuspFormCharSpace` in `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean` supplies the character eigenspace. `TauCeti.cuspFormsNew_inf_cuspFormCharSpace` in `TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean` and `TauCeti.cuspFormCharSpaceOneEquiv` in `TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean` identify the relevant newspace and Γ₀ space. `TauCeti.ModularForm.eq_of_sturm_bound` in `TauCeti/NumberTheory/ModularForms/SturmBound.lean` compares complex forms through the index bound, with its actual strict cusp width and discrete-period hypotheses. The arbitrary-ideal statement is a separate target in Layer 3.

`HeckeRing.GL2.Newform` in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` is used with its actual trivial-character condition and q-expansion. `WeierstrassCurve.torsionGaloisAction` in `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` is the coordinate action restricted to `AddSubgroup.torsionBy`; it does not assert irreducibility or full image. `TauCeti.Isogeny` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean`, `TauCeti.Isogeny.degree` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean`, `TauCeti.Isogeny.ker` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Kernel.lean`, and `TauCeti.Isogeny.map` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/BaseChange/Basic.lean` supply rational maps and geometric kernels. `TauCeti.Isogeny.Hom` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean`, with its ring structure from `Hom/Add.lean`, expresses the geometric endomorphism condition.

### From TauCetiRoadmap.EllipticCurveModularity

Consume Layers R29.3–R29.4 and R29.6 for modularity with the normalized weight-two trivial-character form of exact conductor, the torsion/Tate comparison and every local Euler factor. Its proof and R29.1 are independent of Layers 4–5 here.

### From TauCetiRoadmap.ModularForms

Consume Layers 2–4 for good and bad Hecke recurrences, degeneracy maps, primitive exact level, normalized nonzero newforms and the τ(N/d) oldform multiplicity. Layer 8G gives the generated coefficient field, same-level conjugates and independent eigenlines; its orbit cardinality gives [K_f:ℚ]≤g(N). Layer 10, especially 10C, gives the actual Γ₀ genus/cusp/elliptic-point dimension formula. Layer 6 supplies the exact-divisor Atkin–Lehner action. The weight-two arithmetic inversion and ideal Sturm recognition are the targets here.

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

Consume §§6.1–6.3 for M₀, the level-M₀ weight-two trivial-character lift for ℓ≥3 and irreducible E[ℓ], and the good-prime and removed-multiplicative-prime congruences away from ℓ. Supply the modularity witness from EllipticCurveModularity. Consume Layers 2–4, especially §4.8, for exact tame level and weight optimization.

What SerreWeightAndLevelOptimisation must provide (the optimized elliptic weight-two lift contract): For every modular E/ℚ and prime ℓ≥5 with irreducible E[ℓ] of Serre weight two, provide a primitive trivial-character weight-two newform at the full residual conductor away from ℓ, together with its actual coefficient prime and residual isomorphism, including the finite-flat recipe comparison needed by §4.8.

What SerreWeightAndLevelOptimisation must provide (the weight-two local reduction contract): For ℓ≥11 identify Serre weight two for the elliptic residual representation with good reduction or multiplicative reduction whose minimal-discriminant exponent is divisible by ℓ, without using this implication at ℓ=5,7.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§2.3–2.4 for tame and fundamental characters, §§3.1–3.6 for full Artin/Swan conductors and residual comparison, §§4.2–4.5 for finite subgroups of GL₂, §5.1 for Frobenius recognition, and §§6.1–6.4 for elliptic torsion, the Weil determinant, Tate extensions and image conventions. Reducibility yields a Galois-stable line, rather than a pointwise rational kernel. EllipticCurves Layers 1–2 supplies quotient isogenies and prime-to-degree torsion transport.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Consume §5.3h’s residual elliptic conductor formula for every q≠ℓ and ℓ≥5, including additive potentially good finite inertia and ramified quadratic Tate twists with full Swan terms. Consume §§5.2, 5.4 for isogeny-invariant conductors and §6.4d for exact cotangents of semistable quotients. EllipticCurves Layer 4 supplies the actual reduction and Tate-curve interfaces.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

Consume §§1.15b–1.18 for the formal identity chart and full torsion specialization: at number-field good reduction and e<q−1, the entire torsion group injects into the special fibre, including q-primary torsion. At an unramified odd prime the inequality is 1<q−1. Sections 1.4–1.7 supply Kummer descent and Mordell–Weil, and §1.15 is a complete elliptic example; these are used with EllipticCurves Layers 6–7 to prove the specific rank-zero genus-one modular tables. Section 1.19 supplies the two-isogeny Kummer coordinate and halving comparisons used in the square-class argument; the global four-count implication remains a target here.

### From TauCetiRoadmap.ModularCurvesPartII

Consume §§3.8, 5.2 and 9.5–9.7 for finite-level Borel/Cartan curves, their moduli and the split-normalizer identification; §§9.1, 13.1–13.3, 14.15 and 17.3 for Jacobians, Abel–Jacobi maps, Hecke correspondences and differential comparisons, and §§4.1–4.2, 4.8 and 5.5 for cusp charts; §§16.2–16.6 for newform quotients and their dimension. Sections 14.11–14.12 supply the geometric pairing and relative symbol lattice, not a geometric cuspidal-torsion assertion. Sections 3.8 and 5.2 supply the mixed curves and their j-maps by the open subgroup with the prescribed coprime level factors. Section 13.1 supplies Jacobian pullback and norm for their finite maps, and §§13.2–13.3 supply the Hecke compatibility. The specific split-to-nonsplit correspondence is the target of §5.10 here. The exact-divisor quotient retains the r-level.

What ModularCurvesPartII must provide (the mixed cusp-chart contract): For coprime positive auxiliary and Cartan levels, supply smooth cusp charts on the normalized mixed curves away from 6 times the level, with their actual cusp residue fields and compatibility with the level maps.

What ModularCurvesPartII must provide (the Chen winding comparison contract): Supply the prime-to-p Hecke-equivariant Chen isogeny between the p-new split and nonsplit mixed Jacobians, integral Hecke-annihilator quotients with connected kernel, and their semistable cotangent comparison, without assuming genus zero of the auxiliary level.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

Consume Layer 2 (§§2.1–2.2, 2.5, 2.7–2.8) for the integral q-expansion principle, integral Hecke action, ring-valued eigensequences and the integral cusp lattice, and Layer 4 (§§4.3, 4.6–4.7, 4.9) for the extension-sensitive finite-flat weight recipe together with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5. These inputs retain dyadic phenomena and arbitrary coefficient rings in their stated ranges.

What AlgebraicModularFormsAndSerreWeights must provide (the positive-characteristic support contract): For a weight-two differential in the mixed-level integral cotangent comparison in characteristic q>3 with q∤rp, prove that vanishing of every coefficient indexed prime to p forces descent through the p-degeneracy map to level r, with all descent and level hypotheses explicit.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations and TauCetiRoadmap.DeligneWeightsAndPurity

Consume AutomorphicGaloisRepresentations §§6.1 and 6.4 for the weight-two Tate decomposition and exact conductor of A_f, and DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1) for the abelian Weil estimate. For every embedding σ:K_f→ℂ and q∤N, identify `X^2 - sigma(a_q)*X + q` with that component’s Frobenius polynomial, yielding |σ(a_q)|≤2√q.

What AutomorphicGaloisRepresentations must provide (the all-embedding Frobenius contract): Make the Tate decomposition and Frobenius polynomial comparison simultaneous for every coefficient-field embedding of a weight-two trivial-character newform and preserve the integral lattice and coefficient-prime reduction needed for the elliptic residual comparison.

### From TauCetiRoadmap.EisensteinIdealAndRationalTorsion

Consume §§2.3, 6.3–6.4 for the actual optimal Eisenstein quotient with finite rational group, and §7.9 for the general geometric cuspidal-divisor torsion theorem (for every smooth projective congruence modular curve over a number field, every integral degree-zero divisor supported on geometric cusps has torsion class, and so does its image under every homomorphism to an abelian variety; nonsquarefree levels and Cartan quotients included), for formal immersion at the cusp in every residue characteristic different from two, and for the potential-good-reduction consequence for prime r=11 or r≥17. Layer 5 consumes the torsion theorem on the mixed curves X₀,ns⁺(r,p) and on X₀(rp²)/w_(p²), with their geometric cusps over ℚ(ζ_p)⁺. Its §8.9 excludes invariant vectors; the invariant-line classification and the composite cyclic-degree list are targets of Layer 4.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber, TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity and TauCetiRoadmap.ClassFieldTheory

Consume ImaginaryQuadraticClassNumber H1.1–H1.4 for the actual quadratic integer rings, discriminants and splitting, H3.2 for the Siegel functions g_r (r∈ℚ²∖ℤ²), their SL₂ transformation with its root-of-unity factor, the congruence criterion for a finite exponent product to be a modular function of level N and integrality over ℤ[j], H3.5 for the six values of γ₂(τ_D) in the cube-root branch, and H3.6 for the certified singular values of the reduced representatives, the recovery of the imaginary quadratic order from its CM j-value, and the exhaustive nine imaginary quadratic fields of class number one. Nothing here recomputes a singular value. Consume ComplexMultiplicationAndExplicitReciprocity §§3.1, 5.1–5.5 for integral class polynomials, CM reduction and exact endomorphism comparisons. ClassFieldTheory Layer 13’s narrow Hilbert class field `narrowHilbertClassField` and `gal_rayClassField_equiv_rayClassGroup`, together with the trivial narrow class group of ℚ, give the triviality of finite characters of G_ℚ unramified at every finite prime; thus the global character conclusion is independent of local Raynaud inertia.

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions

Consume §§0.6–0.8 and 1.1–1.2 for homological symbol/differential duality, rational Drinfeld–Manin splitting, integral periods and Mellin comparison. With the conventions above, W(f)=iL(f,1)/(2π) and the normalized differential period is −L(f,1).

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

Consume §§4.7, 5.13 for the rational descent and self-dual finite-length conclusions on genuine arithmetic systems, retaining their local and coefficient hypotheses.

What EulerSystemsAndKolyvaginSystems must provide (the modular rank-zero contract): For every primitive weight-two modular abelian factor A_f over ℚ with L(f,1)≠0, supply the analytic-rank-zero comparison to a genuine arithmetic descent system proving A_f(ℚ) finite, including coefficient-order and CM cases rather than assuming an elliptic-only theorem.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights and TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

Consume ArakelovGeometryAndAbelianHeights §4.4’s stable isogeny-height inequality and §5.9’s explicit h_F(E)≤h(j(E))/12+3. Consume FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7 for semisimplicity and isogeny recognition. The numerical quantitative bound is a target of Layer 5, at the same stable height normalization.

What ArakelovGeometryAndAbelianHeights must provide (the quantitative abelian periods contract): Supply the quantitative period inequalities for positive-dimensional polarized abelian varieties in Gaudron–Rémond Theorems 1.1–1.2 and 4.5, including the dimension-two avoidance estimate of Proposition 6.9 with its exact constants, intersection degree and Faltings-height normalization.

### From TauCetiRoadmap.EllipticCurves and TauCetiRoadmap.Chebotarev

EllipticCurves Layers 1–5 supplies isogenies, duality, full geometric torsion, finite-field Hasse bounds, local reduction and twists, including the explicit two-isogeny formulas. Chebotarev Layer 10’s Dirichlet-density theorem realizes conjugacy classes in every fixed finite torsion or quadratic compositum extension; a finite excluded-prime set may be avoided. Finite samples of Frobenius traces do not supply a uniform residual-image theorem.

## How to read the build

Layer 0 obtains the exact newspace dimension and its sharp bound by inversion of the supplied full-space formula. Layer 1 turns removed-prime congruences into an integer norm bound and then an explicit level exponent. Layer 2 defines the three real Kraus thresholds. Layer 3 recognizes rational coefficients, proves the integral congruence comparison and constructs exact-conductor curves with full two-torsion. Layer 4 proves prime and composite cyclic-isogeny classifications and the uniform irreducibility bounds. Layer 5 combines local image theory, quantitative split-Cartan bounds, mixed winding quotients and exhaustive rational j-value theorems to prove rational-isogeny surjectivity. Each route lists its own direct inputs; unrelated layers are not prerequisites of its statement.

## Layer 0: sharp weight-two newspace dimensions

Start with the full Γ₀ cusp-dimension formula and the old/new divisor multiplicity. Its inversion yields the five correction products. The prime, large composite and finite residual families then prove the sharp bound, including every equality case.

### 0.1 Martin’s prime-power correction table

Define `localTerms`(p,e) in ℚ⁵, ordered (s,v∞,v2,v3,m), with e=0 giving (1,1,1,1,1). For a prime p and e≥1: s is 1−1/p for e=1, 1−1/p−1/p² for e=2, and (1−1/p)(1−1/p²) for e≥3. v∞ is 0 for odd e, p−2 for e=2, and p^(e/2−2)(p−1)² for even e≥4. For v2, at p=2 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at odd p≡1 mod4 they are 0,−1 and thereafter 0; at odd p≡3 mod4 they are −2,1 and thereafter 0. For v3, at p=3 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at p≡1 mod3 they are 0,−1 and thereafter 0; at p≡2 mod3 they are −2,1 and thereafter 0. m=−1 for e=1 and 0 for e≥2. For nonprime p and e>0 set the whole vector to zero. These are one finite table, not new factorization or modular-form carriers. (martin-2003, Definitions 1A–1D and the Möbius term of Theorem 1, p.2, martin-2003 line 77.)

Throughout this subsection, p,e are natural numbers; the prime-power interpretation requires p prime.

Its API includes the following facts.

- For every p, localTerms(p,0)=(1,1,1,1,1).
- For p not prime and e>0, localTerms(p,e) is the zero vector.
- For p prime and e>0 every coordinate is the corresponding entry of the displayed prime-power table.

**Checks.**

- localTerms(0,0)=(1,1,1,1,1). Exponent zero must precede the primality guard.
- localTerms(2,2)=(1/4,0,−1,1,0). Omitting the dyadic exceptional correction changes the third coordinate.
- localTerms(3,2)=(5/9,1,1,−1,0). Treating 3 as an ordinary prime changes the fourth coordinate.
- localTerms(2,3)=(3/8,0,1,0,0). Dropping the exceptional cubic row changes the third coordinate.
- The nonprime base p=4 at exponent one gives the zero vector, while exponent zero gives five ones; this separates the totalization from the prime table.

A proof route is as follows. Use the displayed finite case distinctions and rational arithmetic; exponent zero is treated before the primality test.

Retain the exceptional primes 2 and 3; omitting their exponent-three entries changes the dimension formula.

*Needs:* native rational arithmetic and finite products.

### 0.2 The weight-two arithmetic dimension expression

For N>0 let (S,V∞,A,B,M) be the coordinatewise product of localTerms(p,v_p(N)) over p in the distinct prime divisors of N. Define `martinValue`(N)=N S/12−V∞/2−A/4−B/3+M in ℚ. Set martinValue(0)=0 only as a total-function convention. The equality with an actual modular-form dimension is a separate comparison theorem. In particular this definition does not use a freely supplied dimension or an assumed newspace. (martin-2003, Theorem 1 at k=2 and Definitions 1A–1F, p.2, martin-2003 line 69.)

Throughout this subsection, N is a natural number; every dimension assertion has N>0.

Its API includes the following facts.

- martinValue(0)=0, a junk-level convention only.
- martinValue(1)=0.
- For N>0, martinValue is the displayed five-product expression with the native factorization of N.

**Checks.**

- martinValue(1)=0. The five empty products are all one; omitting the Möbius correction gives −1.
- martinValue(11)=1. This checks the weight-two normalization.
- martinValue(35)=3. The composite equality level must survive the correction terms.
- martinValue(30)=1. This separates the newspace from the full cusp space, whose dimension is 3.
- At N=0 the assigned value is zero, whereas the empty-product formula without its zero branch would give −1/12; level zero is excluded from dimension assertions.

A proof route is as follows. Take five finite products over the native prime-factor finset and the native factorization exponents. Use the empty products at N=1; substitute into the rational expression.

martinValue(1)=0. The value at 0 has no modular-level interpretation.

*Needs:* Layer 0.1 Martin’s prime-power correction table; Mathlib `Nat.factorization`.

### 0.3 Prime-power inversion of the divisor multiplicity

For prime p and e≥0, the Dirichlet-convolution square λ₀=μ*μ of the native Möbius arithmetic function has λ₀(p^0)=1, λ₀(p)=−2, λ₀(p²)=1, and λ₀(p^e)=0 for e≥3. Consequently λ₀*τ is the convolution identity, where τ counts positive divisors. (martin-2003, §2, equations (13)–(15), pp.8–9, martin-2003 lines 429–454.)

Throughout this subsection, p is prime; e is a natural number; λ₀ is the native integer Möbius convolution square and τ=σ₀.

A proof route is as follows. Use μ(p^0)=1, μ(p)=−1 and μ(p^e)=0 for e≥2; evaluate the prime-power convolution sum. Use τ=ζ∗ζ and μ∗ζ=δ; associativity gives (μ∗μ)∗(ζ∗ζ)=δ.

Keep λ₀ distinct from the Möbius coordinate m in localTerms: λ₀(p)=−2 while m(p)=−1.

*Needs:* Mathlib `ArithmeticFunction.moebius`; Mathlib `ArithmeticFunction.moebius_apply_prime_pow`; Mathlib `ArithmeticFunction.moebius_mul_coe_zeta`; Mathlib `ArithmeticFunction.sigma_zero_apply`.

### 0.4 The five inverted dimension terms

At every N>0, convolving the full-space index, cusp count, order-two elliptic count, order-three elliptic count and positive-level constant function with λ₀=μ∗μ gives respectively NS(N), V∞(N), A(N), B(N), and μ(N), where (S,V∞,A,B,μ) are the products of localTerms. Thus the inverse of the full cusp-dimension function is martinValue. (martin-2003, §2, proof of Theorem 1, equation (16) and following calculations, p.9, martin-2003 line 449.)

Throughout this subsection, N>0; λ₀=μ*μ; full-space terms are the actual trivial-character weight-two Γ₀ dimension formula; S,V∞,A,B,M are the local-factor products.

A proof route is as follows. The supplied full-space index and cusp/elliptic counts are multiplicative; evaluate their convolution with λ₀ at each prime power. The e=0,1,2 and e≥3 cases give the exceptional p=2,3 entries and the parity-dependent cusp term. Multiplicativity gives the identities at N; ζ∗λ₀=μ supplies the final weight-two term.

Check e=3 at p=2 and p=3; check empty products at N=1.

*Needs:* Layer 0.3 Prime-power inversion of the divisor multiplicity; Layer 0.1 Martin’s prime-power correction table; ModularForms Layer 10.

### 0.5 Identification with the actual trivial-character newspace

Define `newDimension N` to be the finrank over ℂ of the native newspace intersected with its trivial-character subspace, for positive N. Its API identifies the Γ₀ interpretation through the supplied linear equivalence.

- The carrier is a subspace of the actual weight-two Γ₁ cusp-form space, with the trivial-character restriction included.
- Finite dimensionality is inherited from the cusp-form space, and rational isomorphisms of these spaces preserve its dimension.
- The normalized primitive forms span this space and distinct eigensystems are independent.

**Checks.**

- At N=1 it is zero; using five empty correction products in the dimension formula also gives zero.
- At N=11 it is one, giving 12g=12=N+1.
- At N=35 it is three, giving 12g=36=N+1; at N=30 it is one while the full Γ₀ cusp dimension is three, so forgetting newness changes the result.

For N>0, prove `martin_dimension_formula`: martinValue(N)=g(N), with g the native trivial-character newspace dimension. The Γ₀ interpretation is transported through the trivial-character linear equivalence. (martin-2003, Theorem 1 and its §2 proof; specialization k=2, martin-2003 line 405.)

Throughout this subsection, N>0; character is trivial; weight is 2.

A proof route is as follows. Import the actual Γ₀ full weight-two cusp-dimension formula and the trivial-character direct sum over d|N with τ(N/d) degeneracy multiplicity. Take finite dimensions to obtain fullDimension=g*τ; multiply by the native λ₀=μ*μ, whose inverse identity is §0.3. Substitute §0.4; the displayed expression is martinValue. Transport using the pinned trivial-character equivalence and character intersection, including N=1.

The comparison yields g(11)=1 and g(35)=3; no use of the larger Γ₁ dimension is permitted.

*Needs:* Layer 0.2 The weight-two arithmetic dimension expression; Layer 0.4 The five inverted dimension terms; ModularForms Layer 10; ModularForms Layer 4; `TauCeti.cuspFormsNew_inf_cuspFormCharSpace`; `TauCeti.cuspFormCharSpaceOneEquiv`; Layer 0.3 Prime-power inversion of the divisor multiplicity.

### 0.6 Bounds for the five correction products

For N>0 and the five products (S,V∞,A,B,M) defining martinValue, NS≤φ(N), |A|≤2^ω, |B|≤2^ω, 0≤V∞≤sqrt(N), and |M|≤1, where ω is the number of distinct prime divisors of N. (martin-2003, Lemma 17, p.14, martin-2003 line 766.)

Throughout this subsection, N>0; φ is the native Euler totient and ω=ω(N).

A proof route is as follows. For each prime power check 0≤s≤1−1/p from the three s cases. Multiply these inequalities and use the totient product formula. Each v2 and v3 entry has absolute value at most 2, and each m entry has absolute value at most 1; finite product inequalities give the stated bounds. For v∞ an odd exponent gives zero. At e=2 use p−2≤p; at even e≥4 use (p−1)²≤p². Multiplication gives V∞²≤N, hence the square-root bound.

N=1 must retain V∞=1; setting it to zero changes the level-one formula by 1/2.

*Needs:* Layer 0.1 Martin’s prime-power correction table; Layer 0.2 The weight-two arithmetic dimension expression; Mathlib `Nat.prod_factorization_pow_eq_self`; Mathlib `Nat.totient_eq_mul_prod_factors`.

### 0.7 The totient–prime-factor upper bound

For N>0, 12 martinValue(N)≤φ(N)+7·2^ω(N)+12. (martin-2003, Corollary 18, p.15, martin-2003 line 772.)

Throughout this subsection, N>0.

A proof route is as follows. Multiply the defining expression by 12, drop the nonpositive term −6V∞, bound −3A by 3|A| and −4B by 4|B|, and use M≤1.

Both elliptic corrections are necessary: their absolute coefficients sum to 7.

*Needs:* Layer 0.6 Bounds for the five correction products; Layer 0.2 The weight-two arithmetic dimension expression.

### 0.8 The sharp estimate at prime levels

For every prime p, 12 martinValue(p)≤p+1, with equality exactly when p≡11 mod12. (martin-2003, Lemma 16, p.14, martin-2003 line 747.)

Throughout this subsection, p is prime.

A proof route is as follows. Evaluate p=2,3 directly. For p≥5 the value is (p−1)/12 plus 1/2 when p≡3 mod4 plus 2/3 when p≡2 mod3 minus 1. Check residues 1,5,7,11 modulo 12.

Levels 11 and 23 give equality; level 13 does not.

*Needs:* Layer 0.2 The weight-two arithmetic dimension expression.

### 0.9 Large composite levels with at most two prime factors

If N is composite, N>1521 and ω(N)≤2, then 12 martinValue(N)<N+1. (martin-2003, Lemma 19, p.15, martin-2003 line 776.)

Throughout this subsection, N>1521; N composite; ω(N)≤2.

A proof route is as follows. Use the supplied totient product to get φ(N)≤N−√N for composite N and then apply the coarse bound with ω≤2; √N>39 gives strictness.

1521=39² is the exact cutoff of this estimate, not an arbitrary truncation.

*Needs:* Layer 0.7 The totient–prime-factor upper bound; Mathlib `Nat.prod_factorization_pow_eq_self`; Mathlib `Nat.totient_eq_mul_prod_factors`.

### 0.10 Small composite levels

For composite 1<N≤1521 with ω(N)≤2, 12 martinValue(N)≤N+1, and equality holds exactly at N=35. (martin-2003, Lemma 19, final finite calculation, p.15, martin-2003 line 787.)

Throughout this subsection, N is composite with 1<N≤1521 and ω(N)≤2.

A proof route is as follows. Establish the finite universal arithmetic inequality from the exact five-product expression, with N=35 as its sole equality level.

martinValue(35)=3 is retained rather than discarded as a numerical exceptional case.

*Needs:* Layer 0.2 The weight-two arithmetic dimension expression.

### 0.11 Levels divisible by a sixth prime power

If N>0 and p^6 divides N for some prime p, then 12 martinValue(N)≤N−6, with the subtraction interpreted in ℚ. (martin-2003, Lemma 20, p.15, martin-2003 line 791.)

Throughout this subsection, N>0; p prime; p^6 divides N.

A proof route is as follows. The prime-power product gives N/2^ω≥p^e/2≥16p for e≥6. Since φ(N)≤N−N/p, the coarse bound gives 12 martinValue(N)≤N−9·2^ω+12≤N−6, using ω≥1.

The argument applies to mixed levels, not only to a single prime power.

*Needs:* Layer 0.7 The totient–prime-factor upper bound; Mathlib `Nat.prod_factorization_pow_eq_self`; Mathlib `Nat.totient_eq_mul_prod_factors`.

### 0.12 At least two large prime factors

If N has at least three distinct prime factors and at least two exceed 5, then 12 martinValue(N)≤N−9. (martin-2003, Lemma 21, p.15, martin-2003 line 806.)

Throughout this subsection, N>0; ω(N)≥3; two distinct prime divisors exceed 5.

A proof route is as follows. Choose p0<p1<p2 among the prime divisors with p1≥7 and p2≥11. Then N/2^ω≥77p0/8. Bound φ(N)≤N−N/p0 and apply the coarse estimate: its excess is at most −(21/8)2^ω+12≤−9.

The three-prime hypothesis supplies 2^ω≥8 and cannot be deleted.

*Needs:* Layer 0.7 The totient–prime-factor upper bound; Mathlib `Nat.prod_factorization_pow_eq_self`; Mathlib `Nat.totient_eq_mul_prod_factors`.

### 0.13 A large prime together with a factor of six

If N≥1548, gcd(N,6)>1 and a prime p>41 divides N, then 12 martinValue(N)≤N. (martin-2003, Lemma 22, pp.15–16, martin-2003 line 823.)

Throughout this subsection, N≥1548; gcd(N,6)>1; a prime divisor exceeds 41.

A proof route is as follows. Use φ(N)≤2N/3 and N/2^ω≥43/2. The coarse estimate is at most 2N/3+14N/43+12=N−N/129+12≤N.

The cutoff is 12·129=1548.

*Needs:* Layer 0.7 The totient–prime-factor upper bound; Mathlib `Nat.prod_factorization_pow_eq_self`; Mathlib `Nat.totient_eq_mul_prod_factors`.

### 0.14 The remaining small levels in the large-prime case

For 1≤N<1548 with gcd(N,6)>1 and a prime divisor exceeding 41, 12 martinValue(N)≤N. (martin-2003, Lemma 22, finite calculation, p.16, martin-2003 line 824.)

Throughout this subsection, 1≤N<1548, gcd(N,6)>1 and some prime divisor of N exceeds 41.

A proof route is as follows. Establish the finite universal inequality in the stated range using the exact rational expression; retain the strict upper limit 1548.

No prime factor is replaced by its radical in the evaluation.

*Needs:* Layer 0.2 The weight-two arithmetic dimension expression.

### 0.15 The residual finite family of levels

For p in {7,11,13,17,19,23,29,31,37,41} and a,b,c,d in {0,…,5} with at least three positive entries, put N=2^a 3^b 5^c p^d. Then 12 martinValue(N)≤N−18. (martin-2003, Proof of Theorem 2, residual finite calculation, p.16, martin-2003 line 836.)

Throughout this subsection, p∈{7,11,13,17,19,23,29,31,37,41} and a,b,c,d∈{0,…,5} with at least three positive entries.

A proof route is as follows. Establish the finite universal arithmetic inequality for the indicated prime and exponent sets; its least margin N−12g is 18.

The 11,250 exponent tuples represent 10,125 distinct levels. The inequality concerns their level values, with repeated levels identified.

*Needs:* Layer 0.2 The weight-two arithmetic dimension expression.

### 0.16 Martin’s sharp weight-two newspace bound

For every positive N, prove `martin_sharp_bound`: 12g(N)≤N+1, with equality if and only if N=35 or N is prime and N≡11 modulo 12. (martin-2003, Theorem 2, p.3, and its complete §4 proof, pp.14–16, martin-2003 line 113.)

Throughout this subsection, the level is positive, the weight is two and the nebentypus is trivial.

A proof route is as follows. Use the native dimension comparison. The level-one expression is zero. Handle prime levels and composite levels with at most two prime factors by their separate lemmas. For at least three distinct primes, use the §0.12 bound when possible. Otherwise all but at most one prime lie in {2,3,5}, so gcd(N,6)>1. If the remaining prime exceeds 41, use the two size cases of the near-six estimate. If any exponent is at least six, use the §0.11 bound. Every remaining level is in the bounded family. All branches except the prime and small-composite branches are strict; their equality tests give exactly the stated list.

The comparison is with Γ₀, not Γ₁; 35 is the composite equality case.

*Needs:* Layer 0.5 Identification with the actual trivial-character newspace; Layer 0.2 The weight-two arithmetic dimension expression; Layer 0.8 The sharp estimate at prime levels; Layer 0.9 Large composite levels with at most two prime factors; Layer 0.10 Small composite levels; Layer 0.11 Levels divisible by a sixth prime power; Layer 0.12 At least two large prime factors; Layer 0.13 A large prime together with a factor of six; Layer 0.14 The remaining small levels in the large-prime case; Layer 0.15 The residual finite family of levels.

### Examples

At levels 1,11,30,35 the new dimensions are respectively 0,1,1,3; the full cusp dimension at 30 is 3. At level 35, 12·3=36=35+1, the sole composite equality. At prime 23, 12·2=24=23+1, while at prime 13, 0<14. At N=64 the exact new dimension is 1 and 12≤64−6=58. These values distinguish the exceptional local rows, newness and the equality criterion.

### Dependencies

Mathlib factorization and Dirichlet convolution; ModularForms Layers 3–4, 8G and 10; the pinned trivial-character intersection and equivalence.


## Layer 1: removed-prime norm and exponent bounds

At a removed multiplicative prime, compare p+1 with the signed Hecke eigenvalue in the actual coefficient ring. Nonvanishing, divisibility of the integer norm and a bound at every embedding give the degree exponent; Layer 0 turns it into an explicit level exponent.

### 1.1 Nonvanishing of the removed-prime comparison integer

Let K be a number field, c∈K, p≥2, s∈{1,−1}, and σ:K→ℂ an embedding with |σ(c)|≤2 sqrt(p). Then α=p+1−s c is nonzero. (bennett-siksek-2020, Lemma 2.2 proof, p.359; explicit nonvanishing step, bennett-siksek-2020 line 198.)

Throughout this subsection, p is an integer at least 2; an actual embedding σ is supplied; s=1 or s=−1.

A proof route is as follows. If α=0, applying σ gives p+1=|σ(c)|≤2 sqrt(p). But p+1−2 sqrt(p)=(sqrt(p)−1)²>0, a contradiction.

At the forbidden p=1, c=2 and s=1 give α=0. Divisibility of a zero norm would provide no bound.

*Needs:* native rational arithmetic and finite products.

### 1.2 Congruences force divisibility of the integer norm

Let K be a number field, λ a nonzero prime ideal of O_K lying above a rational prime ℓ, and x∈λ. Then ℓ divides the integer Algebra.norm(ℤ,x). If x≠0, this integer norm is nonzero and ℓ≤|Norm_Z(x)|. (bennett-siksek-2020, §2, proof of Lemma 2.2, p.359, bennett-siksek-2020 lines 198–201.)

Throughout this subsection, K is a number field; ℓ is a rational prime; λ is a nonzero prime ideal of O_K whose contraction to ℤ is (ℓ); x∈λ; the final nonzero-norm inequality additionally assumes x≠0.

A proof route is as follows. Ideal.absNorm_mem puts the integer cast of absNorm(λ) in λ. Ideal.absNorm_dvd_norm_of_mem then puts the integer norm of x in λ. Pull back along ℤ→O_K using λ∩ℤ=(ℓ) to obtain ℓ-divisibility. Use Ideal.absNorm_dvd_norm_of_mem and transitivity of divisibility; preserve the canonical ℤ→O_K and O_K→K maps. Compare the integer norm with the nonzero field norm using Algebra.coe_norm_int; a nonzero divisible integer has absolute value at least ℓ.

The congruence ideal must lie above the same ℓ as E[ℓ]; integrality is not a freely supplied real-number hypothesis.

*Needs:* Mathlib `Ideal.absNorm_mem`; Mathlib `Ideal.absNorm_dvd_norm_of_mem`; Mathlib `Algebra.coe_norm_int`; Mathlib `Algebra.norm_ne_zero_iff`.

### 1.3 Archimedean bound on the comparison norm

For K/ℚ of degree d, c∈K, p≥2 and s∈{1,−1}, if |σ(c)|≤2 sqrt(p) for every complex embedding σ, then |Norm_K/ℚ(p+1−s c)|≤(sqrt(p)+1)^(2d). (bennett-siksek-2020, Lemma 2.2 proof, p.359, bennett-siksek-2020 line 202.)

Throughout this subsection, K is a number field; every complex embedding is included; p≥2.

A proof route is as follows. Apply the native product-of-embeddings formula to α=p+1−s c. Each factor has absolute value at most p+1+2 sqrt(p). The native card_algHom_le_finrank bounds the number of factors by d; equality of the number of embeddings with d is not needed. Since p+1+2 sqrt(p)≥1, enlarge the product bound to its d-th power. Use p+1+2 sqrt(p)=(sqrt(p)+1)².

A bound at only the preferred embedding is not sufficient for the product.

*Needs:* Mathlib `Algebra.norm_eq_prod_embeddings`; Mathlib `card_algHom_le_finrank`.

### 1.4 The removed-prime bound with coefficient degree

Let E/ℚ have conductor M, ℓ≥3 prime and irreducible E[ℓ]. Let M₀ be the exact deletion level of SerreWeightAndLevelOptimisation §6.1. If p≠ℓ is prime, p∥M and ℓ divides the integer exponent v_p(Δ_min(E)), then ℓ≤(√p+1)^(2[K_f:ℚ]) for the SerreWeightAndLevelOptimisation §6.2 normalized weight-two trivial-character newform f at M₀. (bennett-siksek-2020, §2, Lemma 2.1(ii), p.359, bennett-siksek-2020 line 193, for the congruence; proof of Lemma 2.2, p.359, bennett-siksek-2020 lines 198–203, for the norm bound.)

Throughout this subsection, E/ℚ is elliptic of conductor M; ℓ≥3 is prime and E[ℓ] is irreducible; M₀ is the exact deletion level of SerreWeightAndLevelOptimisation §6.1; p≠ℓ is prime with p∥M and ℓ|v_p(Δ_min(E)); f is the supplied normalized weight-two trivial-character newform at M₀.

A proof route is as follows. Import elliptic modularity and the reduced-level newform with its exact residual congruence prime. The hypotheses remove p, so p∤M₀. Import p+1≡s a_p(f) mod λ for s=±1. Its left-hand algebraic-integer difference is nonzero by §1.1 and the all-embedding Frobenius/Weil supplier comparison. Section 1.2 gives ℓ≤absolute integer norm; §1.3 and the integer/field comparison bound it by the displayed power.

The valuation is an exponent v_p(Δ_min), never the largest prime power dividing Δ_min; p=ℓ is excluded.

*Needs:* EllipticCurveModularity Layer R29.6; SerreWeightAndLevelOptimisation §§6.1–6.3; Layer 1.1 Nonvanishing of the removed-prime comparison integer; Layer 1.3 Archimedean bound on the comparison norm; AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1); Layer 1.2 Congruences force divisibility of the integer norm.

### 1.5 Replacing the coefficient degree by the explicit level

For L>0, d≤g(L), p≥2, and 12g(L)≤L+1, one has (√p+1)^(2d)≤(√p+1)^((L+1)/6), where the right power is the real power. (bennett-siksek-2020, §2, Lemma 2.2, p.359, bennett-siksek-2020 line 204.)

Throughout this subsection, L>0; d is a natural number with d≤g(L); p≥2; 12g(L)≤L+1.

A proof route is as follows. The base √p+1 is greater than one. Cast the natural dimension inequality to R, divide by six and use monotonicity of the real power in its exponent. Convert the natural power 2d to the real-power expression before comparing.

A rational exponent is not rounded to an integer; p≥2 supplies the correct monotonicity direction.

*Needs:* Layer 0.16 Martin’s sharp weight-two newspace bound.

### 1.6 The removed-prime residual exponent bound

Let E/ℚ have conductor M and nonzero minimal discriminant Δ. Let ℓ≥3 be prime with E[ℓ] irreducible. Define M₀ by deleting each prime q exactly once when ord_q(M)=1 and ℓ divides the integer valuation ord_q(Δ). If p≠ℓ is prime, ord_p(M)=1 and ℓ divides ord_p(Δ), then ℓ≤(sqrt(p)+1)^((M₀+1)/6). (bennett-siksek-2020, Theorem 3, Lemmas 2.1(ii) and 2.2, pp.358–359, bennett-siksek-2020 line 195.)

Throughout this subsection, E is an actual elliptic curve over ℚ of conductor M; ℓ≥3 is prime; E[ℓ] is irreducible; M₀ is the deletion level of SerreWeightAndLevelOptimisation §6.1; p≠ℓ is prime, p∥M, and ℓ divides the valuation exponent v_p(Δ_min(E)).

A proof route is as follows. Use §1.4 with the actual SerreWeightAndLevelOptimisation §6.2 form at M₀. Apply ModularForms Layer 8G, Galois stability and the coefficient-field orbit dimension and the sharp dimension bound in §0.16. Use §1.5 to obtain ℓ≤(√p+1)^((M₀+1)/6). No equality M₀=N is asserted.

The claim is not a bound on ℓ from a zero norm; no identification M₀=N(ρbar) at ℓ is made here.

*Needs:* Layer 1.4 The removed-prime bound with coefficient degree; ModularForms Layer 8G, Galois stability and the coefficient-field orbit dimension; Layer 1.5 Replacing the coefficient degree by the explicit level.

### Examples

For K=ℚ, p=2, c=1, sign +, the comparison integer is 2, its norm is 2, and the upper bound is (√2+1)²=3+2√2. With sign − it is 4, still below that bound. In K=ℚ(√2), c=√2 gives Norm(3−c)=7; both embeddings satisfy the bound. By contrast c=100−70√2 has one embedding approximately 1.005 but its conjugate approximately 198.995, and |Norm(3−c)|=391>(√2+1)⁴; a single-embedding hypothesis would be false. For the actual Frobenius trace −2 of y²+y=x³−x over 𝔽₂, the two roots are −1±i, with product 2; inversion would instead give product 1/2. A nonzero element in (5) has integer norm divisible by 5; the element zero has norm zero and cannot give 5≤|Norm|. For the curve y²+y=x³−x²−10x−20, M=11 and v₁₁(Δ)=5, so ℓ=5 deletes 11 and gives M₀=1; its rational five-torsion makes E[5] reducible, excluding it from the removed-prime theorem.

### Dependencies

Layer 0; EllipticCurveModularity R29.6; SerreWeightAndLevelOptimisation §§6.1–6.3; ModularForms Layer 8G; AutomorphicGaloisRepresentations §6.1 and the all-embedding Frobenius contract; DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1); Mathlib integral and field norms.


## Layer 2: the exact Kraus thresholds

The thresholds are real numbers attached to the actual subgroup index and actual trivial-character newspace dimension. The square roots belong to Kraus’s original equations (7)–(9), rather than the larger numerical majorants printed by Bennett–Siksek.

### 2.1 Kraus’s coefficient-rationality threshold

For N>0 put I(N)=[SL2(ℤ):Γ₀(N)] using the native subgroup index, and g(N)=the actual trivial-character newspace dimension. Define krausF(N)=(sqrt(I(N)/6)+1)^(2g(N)). (kraus-1997, §3.1, equation (7), p.1143, kraus-1997 line 239.)

Throughout this subsection, N is a positive integer; all index and dimension functions retain their actual mathematical carriers.

Its API includes the following facts.

- krausF is the displayed expression in the native index and newspace dimension.
- For positive N, 1≤krausF(N).
- If the actual g(N)=0 then krausF(N)=1.

**Checks.**

- At level 1 the exponent is zero, so the positive base gives 1; replacing the exponent by 2 would give (1+√(1/6))².
- At level 11 the base is 1+√2, whose square is 3+2√2; omitting the square root gives 9.
- At level 35 the index is 48 and dimension 3, so the value is (1+√8)⁶; the full Γ₁ dimension would change the exponent.

A proof route is as follows. Evaluate the real square root and the natural exponent on the actual index and native trivial-character dimension.

The index equals N times the product of 1+1/p over its distinct prime divisors. It is not the Möbius function.

*Needs:* `TauCeti.cuspFormsNew`; `TauCeti.cuspFormsNew_inf_cuspFormCharSpace`; ModularForms Layer 10.

### 2.2 Kraus’s two-torsion threshold

For N>0 define krausG(N)=(sqrt(I(lcm(N,4))/6)+1)^2, where I is the native Γ₀ index. The lcm is essential and is not replaced by 4N. (kraus-1997, §3.1, equation (8), p.1144, kraus-1997 line 269.)

Throughout this subsection, N is a positive integer; all index and dimension functions retain their actual mathematical carriers.

Its API includes the following facts.

- krausG is the displayed least-common-multiple expression.
- For positive N, 1≤krausG(N).
- If 4 divides N, krausG(N)=(sqrt(I(N)/6)+1)^2.

**Checks.**

- At level 1 the least common multiple is 4 and I(4)=6, giving 4; using I(1) gives a different value.
- At level 4 the same index gives 4, while the incorrect level 16 has index 24 and gives 9.
- At level 11 the least common multiple is 44 and its index is 72, giving 13+4√3; dropping the factor 4 changes the answer.

A proof route is as follows. Use the actual least common multiple, native subgroup index and real square root.

The index equals N times the product of 1+1/p over its distinct prime divisors. It is not the Möbius function.

*Needs:* ModularForms Layer 10.

### 2.3 Kraus’s full-two-torsion comparison threshold

For N>0 define krausH(N)=max(krausF(N),krausG(N)). (kraus-1997, §3.1, equation (9), p.1144, kraus-1997 line 279.)

Throughout this subsection, N is a positive integer; all index and dimension functions retain their actual mathematical carriers.

Its API includes the following facts.

- For N>0, krausH(N)=max(krausF(N),krausG(N)).
- krausF(N)≤krausH(N).
- krausG(N)≤krausH(N).
- For real ℓ, krausH(N)<ℓ iff krausF(N)<ℓ and krausG(N)<ℓ.

**Checks.**

- At level 1 the two arguments of the maximum are 1 and 4, so H=4; the minimum would give 1.
- At level 4 they are 1 and 4, again giving 4; a product happens to agree here and is separated at level 11.
- At level 11 F=3+2√2<G=13+4√3, so H=13+4√3; a product or sum gives a strictly larger number.

A proof route is as follows. Use the maximum of the two real thresholds of §§2.1–2.2.

The index equals N times the product of 1+1/p over its distinct prime divisors. It is not the Möbius function.

*Needs:* Layer 2.1 Kraus’s coefficient-rationality threshold; Layer 2.2 Kraus’s two-torsion threshold.

### Examples

At N=11, I=12, g=1 and I(lcm(11,4))=I(44)=72. Thus F=3+2√2, G=13+4√3 and H=13+4√3. At N=1 and N=4, H=4. Replacing lcm(N,4) by 4N changes G(4) from 4 to 9. For dimension zero F=1, so the separate nonzero-form hypothesis is essential when a witness bound uses F.

### Dependencies

Layer 0’s native dimension; ModularForms Layer 10’s Γ₀ index formula; real square roots and natural powers.


## Layer 3: coefficient recognition and exact-conductor realization

Use the optimized exact weight-two lift from the supplier contract. Rational coefficient recognition and ideal congruence recognition have independent proofs. Their elliptic applications first give exact residual conductor N and then impose full rational two-torsion using global point counts and a two-isogeny.

### 3.1 Finite-prime recognition of rational coefficients

Prove `newform_integral_of_small_primes`. If a normalized weight-two newform f of level N and trivial character has a_q(f)∈ℤ for every prime q≤I(N)/6, then every Fourier coefficient a_n(f), n≥0, lies in ℤ; equivalently K_f=ℚ. (kraus-1997, §3.2, Lemme 1 and its proof, pp.1144–1145, kraus-1997 line 294.)

Throughout this subsection, N>0; f is a normalized weight-two newform of level N and trivial character; for every prime q≤I(N)/6, a_q(f)∈ℤ; I is the Γ₀ index, not the Möbius function.

A proof route is as follows. The prime-power Hecke recurrence and multiplicativity determine every coefficient a_n for n≤I(N)/6 from those prime coefficients, including the bad-prime recurrences. Every coefficient embedding gives the same finite coefficient array. Apply char-zero Sturm equality with constant coefficient zero and Γ₀ cusp width one. The conjugates agree at every coefficient; since the coefficients generate K_f and are integral, they lie in ℤ.

Prime coefficients are recognized via recurrence; Sturm itself compares all coefficients up to the bound.

*Needs:* ModularForms Layer 8; ModularForms Layer 8G; ModularForms Layer 10; `TauCeti.ModularForm.eq_of_sturm_bound`; ModularForms Layer 4.

### 3.2 A small good prime detects a nonrational newform

If K_f≠ℚ for such f, there is a prime q≤I(N)/6 with a_q(f)∉ℤ, and this q does not divide N. (kraus-1997, §3.2, proof of Théorème 3, pp.1144–1145, kraus-1997 line 294.)

Throughout this subsection, N>0; f is a normalized weight-two trivial-character newform with K_f≠ℚ.

A proof route is as follows. Take the contrapositive of §3.1. At q∥N the weight-two trivial-character newform coefficient is ±1; at q²|N it is zero. Both are rational integers.

The witness is good for f; it need not be good for E.

*Needs:* Layer 3.1 Finite-prime recognition of rational coefficients; ModularForms Layer 4 (“Bad-prime eigenvalues”).

### 3.3 The coefficient-recognition witness is below F

If g(N)≥1 and B=I(N)/6>0, then B<(√B+1)^(2g(N))=F(N). Hence any prime q≤B is different from a prime ℓ>F(N). (kraus-1997, §3.2, proof of Théorème 3, pp.1144–1145, kraus-1997 line 239.)

Throughout this subsection, N>0; g(N)≥1; B=I(N)/6>0; the final prime-distinctness conclusion additionally assumes q≤B and ℓ>F(N), with q,ℓ prime.

A proof route is as follows. For B≥0, (√B+1)²=B+2√B+1>B; the base is at least one and exponent 2g≥2. An actual normalized form is nonzero, so its newspace has dimension at least one.

The dimension-zero threshold remains 1, but there is no normalized nonzero form in that case.

*Needs:* Layer 2.1 Kraus’s coefficient-rationality threshold; ModularForms Layer 4.

### 3.4 The norm of a noninteger coefficient minus an elliptic trace

For q∤N and a_q(f)∉ℤ, let b be either an elliptic good-reduction trace at q, or s(q+1) with s=±1. Then b−a_q(f) is a nonzero algebraic integer and |Norm_K/ℚ(b−a_q(f))|≤(√q+1)^(2[K_f:ℚ]). (kraus-1997, §3.2, proof of Théorème 3, pp.1144–1145, kraus-1997 line 301.)

Throughout this subsection, N>0; f is a normalized weight-two trivial-character newform with its generated coefficient field K_f; q is prime, q∤N, and a_q(f)∉ℤ; b is a good-reduction trace of an elliptic curve over F_q, or b=s(q+1) with s∈{1,−1}.

A proof route is as follows. Nonzero follows because b is an integer. In the good case each embedding has absolute difference ≤4√q≤(√q+1)². In the multiplicative case it is ≤q+1+2√q=(√q+1)². Multiply over all embeddings and identify the field norm.

Both good and multiplicative comparisons are needed; Hasse for b is unavailable in the multiplicative case.

*Needs:* AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1); Mathlib `Algebra.norm_eq_prod_embeddings`; ArithmeticGaloisRepresentations §§6.1–6.4.

### 3.5 The F-threshold forces coefficient field Q

Under SerreWeightAndLevelOptimisation §§2.8, 4.8 and 6.2, with the optimized elliptic weight-two lift contract, ℓ>F(N) implies K_f=ℚ. (kraus-1997, §3.2, Théorème 3 proof, pp.1144–1145, kraus-1997 line 301.)

Throughout this subsection, the hypotheses of SerreWeightAndLevelOptimisation §§2.8, 4.8 and 6.2 and of the optimized elliptic weight-two lift contract hold; f and λ are that lift; ℓ>F(N).

A proof route is as follows. Assume the coefficient field is nonrational and take the small good coefficient witness. The F inequality excludes the coefficient prime. At a prime of good reduction compare elliptic traces; at a bad prime outside N use the supplied full residual conductor formula to obtain multiplicative reduction and the signed q+1 congruence. The nonzero integral norm is divisible by ℓ and is bounded above by F(N), a contradiction.

E may have conductor different from N; the local bad-prime branch supplies the comparison in that case.

*Needs:* SerreWeightAndLevelOptimisation §§2.8, 4.8 and 6.2, with the optimized elliptic weight-two lift contract; Layer 3.2 A small good prime detects a nonrational newform; Layer 3.3 The coefficient-recognition witness is below F; Layer 3.4 The norm of a noninteger coefficient minus an elliptic trace; Layer 1.2 Congruences force divisibility of the integer norm; ModularForms Layer 8G, Galois stability and the coefficient-field orbit dimension; ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations §§6.1–6.4; ModularForms Layer 4 (“Bad-prime eigenvalues”); AutomorphicGaloisRepresentations §§6.1, 6.4; NeronModelsAndSemistableAbelianVarieties §5.3h.

### 3.6 Kraus’s rational realization theorem

For E/ℚ modular and ℓ≥5 prime with E[ℓ] irreducible of Serre weight two and prime-to-ℓ residual conductor N, ℓ>F(N) produces E_f/ℚ of conductor exactly N with E_f[ℓ]≅E[ℓ]. (kraus-1997, Théorème 3, p.1144, kraus-1997 line 249.)

Throughout this subsection, E/ℚ is modular; ℓ≥5 is prime; E[ℓ] is irreducible of Serre weight two; N is its prime-to-ℓ Artin conductor; ℓ>F(N).

A proof route is as follows. Apply SerreWeightAndLevelOptimisation §§2.8, 4.8 and 6.2, with the optimized elliptic weight-two lift contract, §3.5, and ModularCurvesPartII §§16.2–16.6 and AutomorphicGaloisRepresentations §§6.1, 6.4.

This intermediate conclusion contains no assertion about E_f[2].

*Needs:* SerreWeightAndLevelOptimisation §§2.8, 4.8 and 6.2, with the optimized elliptic weight-two lift contract; Layer 3.5 The F-threshold forces coefficient field Q; ModularCurvesPartII §§16.2–16.6 and AutomorphicGaloisRepresentations §§6.1, 6.4.

### 3.7 Kraus’s local coefficient filters

For a commutative ring R, p,e∈N and a∈R, define the pair krausLocalFilters(p,e,a)=(V,V′) in R[X]². For p=2,e=0 use (1−aX+2X²,1); for p=2,e=1 use (1−aX,1); for p=2,e≥2 use (1,1). For p≠2,e=0 use (1,1); for p≠2,e=1 use (1,1−(p+1−a)X); for p≠2,e≥2 use (1,1−(p+1)X+pX²). At prime p with e=v_p(N), X acts as R_p:h(z)↦h(pz), so X² acts as R_(p²). (kraus-1997, Appendix II, §8.1, p.1160, kraus-1997 line 1147.)

Throughout this subsection, R is a commutative ring; p,e∈N; a∈R; the rescaling interpretation additionally requires p prime and e=v_p(N) at an actual newform level N.

Its API includes the following facts.

- The three p=2 rows are the displayed e=0, e=1 and e≥2 pairs.
- For p≠2 the e=0, e=1 and e≥2 rows are the displayed pairs.
- Both filters have constant coefficient one.
- Mapping coefficients along a commutative-ring homomorphism sends the filters of a to the filters of its image.

**Checks.**

- Over ℤ, krausLocalFilters(2,0,3)=(1−3X+2X²,1). Here X is rescaling by 2, not the Hecke operator.
- Over ℤ, krausLocalFilters(2,2,0)=(1,1). The high dyadic exponent suppresses both corrections.
- Over ℤ, krausLocalFilters(3,1,−1)=(1,1−5X). The coefficient is p+1−a=5, so reversing the sign of a gives the wrong value 3.
- Over ℤ, krausLocalFilters(3,2,0)=(1,1−4X+3X²). The quadratic factor is required at a square-level prime.
- In the zero coefficient ring both polynomials have constant coefficient 1=0; the definition is still valid, and its modular interpretation separately requires an integral coefficient realization.

A proof route is as follows. Use the finite case table in the native polynomial ring; separate the dyadic and odd-prime cases.

At p=2 the first filter removes the even coefficients; the second acts on the odd Eisenstein series.

*Needs:* native rational arithmetic and finite products.

### 3.7a Integral ideal Sturm recognition

Prove `integral_ideal_sturm` for every positive level N, natural weight k, character χ:(ℤ/N)ˣ→ℂˣ, number field K with embedding σ:K→ℂ, and actual modular form f in the χ-character subspace whose entire q-expansion is σ(a_n) with a_n∈O_K. For every ideal J⊂O_K, if a_n∈J for all natural n with 12n≤kI(N), including n=0, then a_n∈J for every n. This includes J=0, J=O_K and arbitrary prime-power ideals, with no restriction to good coefficient primes. (kraus-1997, Appendix II, Proposition 1, p.1158, kraus-1997 line 1060.)

Apply the integral Sturm argument to the given characteristic-zero form with its actual integral coefficient realization; prove the coefficient-ideal comparison over O_K using the integral q-expansion tools and conjugates, with the exact index bound and constant term. At primes dividing the level, do not identify infinity-integral coefficients with a global integral model without proving the comparison. That bad-prime comparison is part of this target. The coefficient sequence is tied to the actual form by its embedding.

**Checks.**

- Weight zero gives cutoff zero: a nonzero constant 1 fails J=0 at n=0. Omitting n=0 would make the assertion false.
- For the odd weight-two comparison at level four, I(4)=6 and cutoff one; its first coefficient is 1, so it fails J=4ℤ, even though its constant coefficient is zero.
- For J=O_K every coefficient lies in J; for J=0 the assertion reduces to exact vanishing. Reduction modulo λ² distinguishes this theorem from a result modulo λ alone: 2∈2ℤ but 2∉4ℤ.

*Needs:* AlgebraicModularFormsAndSerreWeights §§2.1–2.2 and 2.8 for the integral q-expansion principle and integral cusp lattices; ModularForms Layers 0–1 and the integral q-expansion principle; Tau Ceti’s characteristic-zero Sturm equality for the exact-vanishing case.

### 3.8 The odd weight-two Eisenstein comparison

The series g(z)=Σ_(n≥1 odd) σ₁(n)q^n is a holomorphic weight-two modular form of trivial character on Γ₀(4), with zero constant term, integral coefficients and odd-prime Euler factor (1−(p+1)p^(−s)+p^(1−2s))^−1. (kraus-1997, Appendix II, §8.1, p.1159, kraus-1997 line 1113.)

Throughout this subsection, σ₁ is the native divisor-sum arithmetic function; q=exp(2πiz) for z in the upper half-plane.

A proof route is as follows. Express the odd projection of the weight-two Eisenstein series as a linear combination of E₂(z), E₂(2z), E₂(4z); the quasimodular corrections cancel. Use the divisor-sum coefficient formula and multiplicativity at odd indices to compute the local factors.

The form is not cuspidal: vanishing at infinity alone does not imply vanishing at every cusp.

*Needs:* ModularForms Layer 10; AlgebraicModularFormsAndSerreWeights §§2.1–2.2 and 2.7.

### 3.9 The filtered forms have the required coefficient congruence

Let f be a normalized integral weight-two trivial-character newform at N, λ a coefficient prime, m≥1, and M=lcm(N,4). Apply the products of the first local filters to f and the second local filters to g, over p|2N with e=v_p(N). The resulting forms are weight two at M; if a_q≡q+1 mod λ^m for q≤I(M)/6, q∤2N, and (q+1)(a_q−1)∈λ^m for q≤I(M)/6, q|2N, q²∤4N, their coefficients agree mod λ^m through index I(M)/6. (kraus-1997, Appendix II, §8.1, pp.1159–1160, kraus-1997 line 1145.)

Throughout this subsection, N>0; f is a normalized integral weight-two trivial-character newform; λ is a prime ideal of its actual coefficient ring; m≥1; M=lcm(N,4); for primes q≤I(M)/6 with q∤2N, a_q≡q+1 mod λ^m; for primes q≤I(M)/6 with q|2N and q²∤4N, (q+1)(a_q−1)∈λ^m.

A proof route is as follows. Use degeneracy maps and the six local filter rows to obtain forms at M. The good-prime recurrence and the bad-prime condition compare all prime powers through the cutoff; multiplicativity then compares every coefficient in that range. A filter at p above the cutoff starts at q^p and leaves the tested coefficients fixed. Its additional degeneracy level still divides M.

No condition is needed at p=2 or at p²|N; include constant coefficient zero in the congruence.

*Needs:* Layer 3.7 Kraus’s local coefficient filters; Layer 3.8 The odd weight-two Eisenstein comparison; ModularForms Layer 4; AlgebraicModularFormsAndSerreWeights §§2.1–2.2, 2.5 and 2.7.

### 3.10 Kraus’s global prime-power coefficient congruence

Prove `kraus_prime_power_congruence`. Let K be any number field with an embedding σ:K→ℂ and a:ℕ→O_K a sequence with σ(a_n)=a_n(f) for every n, so that f has coefficients in O_K; let λ be a prime ideal of O_K and m≥1. Under the finite-prime hypotheses of §3.9 for this λ, one has a_q≡q+1 mod λ^m for every prime q∤2N. (kraus-1997, Appendix II, Proposition 2 and conclusion of §8.1, pp.1158–1160, kraus-1997 line 1082.)

Throughout this subsection, the finite-prime hypotheses, the coefficient-ring data and the exponent m≥1 of §3.9 are in force.

A proof route is as follows. Apply the general integral ideal Sturm theorem in §3.7a to the difference of the filtered forms. At a prime outside 2N the filtering factors do not alter the prime coefficient, so the equality modulo λ^m is precisely a_q≡q+1.

Characteristic-zero equality is insufficient; the supplier must handle O_K/λ^m and arbitrary Γ₀(M).

*Needs:* Layer 3.9 The filtered forms have the required coefficient congruence; AlgebraicModularFormsAndSerreWeights §§2.1–2.2 and 2.8; Layer 3.7a Integral ideal Sturm recognition.

### 3.11 A small prime detects failure of divisibility by four

Let C/ℚ be modular of conductor N. If there is a prime q∤2N with 4∤#C(F_q), there is such a prime q≤I(lcm(N,4))/6. (kraus-1997, Appendix II, Corollaire and proof, p.1159, kraus-1997 line 1095.)

Throughout this subsection, C/ℚ is modular of conductor N; some prime q∤2N satisfies 4∤#C(F_q).

A proof route is as follows. Apply the contrapositive of §3.10 with K=ℚ, λ=2Z, m=2 and a_q=q+1−#C(F_q). At odd q∥N the coefficient is ±1, so (q+1)(a_q−1) is automatically divisible by four.

The finite bound is I(lcm(N,4))/6, not I(N)/6 or I(4N)/6.

*Needs:* Layer 3.10 Kraus’s global prime-power coefficient congruence; ModularForms Layer 4 (“Bad-prime eigenvalues”).

### 3.12 The mod-four witness is below G

For B=I(lcm(N,4))/6≥0, B<(√B+1)²=G(N). Consequently q≤B and ℓ>G(N) imply q≠ℓ. (kraus-1997, §3.3, proof of Théorème 4, p.1146, kraus-1997 line 269.)

Throughout this subsection, N>0; B=I(lcm(N,4))/6≥0; for the final distinctness assertion, q≤B and ℓ>G(N), with q,ℓ prime.

A proof route is as follows. Expand the square and use positivity of 2√B+1.

This comparison has no newspace-dimension hypothesis.

*Needs:* Layer 2.2 Kraus’s two-torsion threshold.

### 3.13 The G-threshold transfers full-two point counts

Let E have full rational two-torsion, ℓ≥5, and C of exact residual conductor N with C[ℓ]≅E[ℓ]. If ℓ>G(N), then 4 divides #C(F_q) for every q∤2N. (kraus-1997, §3.3, proof of Théorème 4, p.1146, kraus-1997 lines 386–434.)

Throughout this subsection, E/ℚ has full rational two-torsion; ℓ≥5 is prime; C/ℚ has conductor N, which is the exact prime-to-ℓ conductor of E[ℓ]; C[ℓ]≅E[ℓ]; ℓ>G(N).

A proof route is as follows. If the conclusion fails, take §3.11 q and use §3.12 to exclude ℓ. If E is good at q, the two integral traces are congruent modulo ℓ and differ by at most 4√q≤(√q+1)²≤G(N)<ℓ. They are equal, contradicting the specialization of rational two-torsion in EllipticCurves Layers 2–4. If E is bad at q∤N, import the multiplicative local comparison; a_q(C)≡±(q+1) mod ℓ. The nonzero trace gap has absolute value ≤(√q+1)²≤G(N)<ℓ, a contradiction.

The strict inequality ℓ>G is essential to the integer-lifting contradiction.

*Needs:* Layer 3.11 A small prime detects failure of divisibility by four; Layer 3.12 The mod-four witness is below G; EllipticCurves Layer 2; ArithmeticGaloisRepresentations §§6.1–6.4; Layer 1.1 Nonvanishing of the removed-prime comparison integer; ArithmeticGaloisRepresentations §§3.1–3.6; ModularForms Layer 4 (“Bad-prime eigenvalues”); AutomorphicGaloisRepresentations §§6.1, 6.4; NeronModelsAndSemistableAbelianVarieties §5.3h.

### 3.14 Global four-point counts give a rational two-torsion point

If C/ℚ has 4|#C(F_q) at every good odd prime, then C has a rational point of order two. (kraus-1997, §3.3 proof of Théorème 4, p.1146, and the explicit mod-two Chebotarev argument, kraus-1997 lines 435–441.)

Throughout this subsection, C/ℚ is elliptic; 4 divides #C(F_q) for every prime q of good odd reduction.

A proof route is as follows. Modulo two all such Frobenius elements have characteristic polynomial (X−1)². Chebotarev and the six-element group GL₂(F₂) rule out an image containing an element of order three. A subgroup of GL₂(F₂) with no element of order three is trivial or of order two and fixes a nonzero vector. Identify that vector with an actual rational point of C[2].

Having a Galois-stable subgroup of order two gives a rational generator only because F₂× is trivial.

*Needs:* ArithmeticGaloisRepresentations §§4.2–4.5; ArithmeticGaloisRepresentations §5.1; ArithmeticGaloisRepresentations §§6.1–6.4.

### 3.15 Four-point counts force one quadratic square class

Let C:y²=x(x²+ax+b) over ℚ be nonsingular, with its rational point (0,0). If 4 divides #C(F_q) at every good odd prime q, then b or a²−4b is a square in ℚ. (kraus-1997, §3.3, p.1146, the final two-isogeny conclusion and the coordinate/Chebotarev argument below, kraus-1997 lines 435–441.)

Throughout this subsection, C:y²=x(x²+ax+b) over ℚ is nonsingular, so b(a²−4b)≠0; 4 divides #C(F_q) at every prime of good odd reduction.

A proof route is as follows. If both nonzero rational numbers b and a²−4b are nonsquares, there is an element of the Galois group of their quadratic compositum acting nontrivially on both square roots. This also holds when the two quadratic fields coincide. Chebotarev gives a good odd prime with both reductions nonsquare. The quadratic discriminant condition gives exactly one nonzero rational two-point on the reduction. The standard two-descent halving criterion makes that unique point indivisible by two when b is nonsquare. The finite group then has order 2 modulo 4, a contradiction.

The quadratic compositum argument includes identical fields; it does not require linearly disjoint extensions.

*Needs:* HeightsRationalPointsAndObstructions §1.19; Layer 3.14 Global four-point counts give a rational two-torsion point; EllipticCurves Layer 1; EllipticCurves Layer 2; ArithmeticGaloisRepresentations §5.1.

### 3.16 The full-two curve in the two-isogeny class

If C/ℚ has 4|#C(F_q) at every good odd prime, then there is a ℚ-isogeny C→F of degree one or two with F[2](ℚ)≅(ℤ/2ℤ)². Prove `four_divisible_isogeny_realization` for every integral Weierstrass model W whose rationalization is elliptic: four-divisible native point counts at every odd prime not dividing Δ(W) suffice. The finite set of extra discriminant primes of a nonminimal model can be avoided in the Chebotarev argument; an integral model exists for every rational elliptic curve. (kraus-1997, §3.3 proof of Théorème 4, p.1146, kraus-1997 lines 435–441.)

Throughout this subsection, C/ℚ is elliptic; 4 divides #C(F_q) for every prime q of good odd reduction.

A proof route is as follows. Put the rational two-point from §3.14 at (0,0) in y²=x(x²+ax+b). By §3.15 either a²−4b is square, so C has full two-torsion, or b is square. In the second case the quotient by (0,0) has equation y²=x(x²−2ax+(a²−4b)); its quadratic discriminant is 16b, so it has full rational two-torsion.

The selected rational two-point determines the quotient; other rational two-point quotients need not have full two-torsion.

*Needs:* HeightsRationalPointsAndObstructions §1.19; Layer 3.14 Global four-point counts give a rational two-torsion point; Layer 3.15 Four-point counts force one quadratic square class; EllipticCurves Layer 1; EllipticCurves Layer 2.

### 3.17 Kraus’s full rational two-torsion realization

Let E/ℚ have full rational two-torsion, ℓ≥5 prime, irreducible E[ℓ] of Serre weight two, and prime-to-ℓ residual conductor N. If ℓ>H(N)=max(F(N),G(N)), there is a modular elliptic curve F/ℚ of conductor exactly N, with full rational two-torsion and F[ℓ]≅E[ℓ]. (kraus-1997, Théorème 4, p.1144, kraus-1997 line 284; its proof §3.3, pp.1145–1146, kraus-1997 lines 374–441.)

Throughout this subsection, E/ℚ has full rational two-torsion; ℓ≥5 is prime; E[ℓ] is irreducible of Serre weight two; N is its full prime-to-ℓ Artin conductor; ℓ>H(N).

A proof route is as follows. Parent modularity applies to E. The maximum criterion gives both strict thresholds. Apply §3.6 to obtain C at exact N, then §3.13 and §3.16. Transport conductor and residual representation along the isogeny of degree at most two.

Neither Serre weight two nor exact residual conductor can be replaced by an unspecified lift level.

*Needs:* EllipticCurveModularity Layer R29.6; Layer 2.3 Kraus’s full-two-torsion comparison threshold; Layer 3.6 Kraus’s rational realization theorem; Layer 3.13 The G-threshold transfers full-two point counts; Layer 3.16 The full-two curve in the two-isogeny class; EllipticCurves Layer 1; ArithmeticGaloisRepresentations §§6.1–6.4; ArithmeticGaloisRepresentations §§3.1–3.6.

### 3.18 The finite-flat adapter from deletion level to residual conductor

Let ℓ≥5 be prime and E/ℚ elliptic. Assume E has good reduction at ℓ, or multiplicative reduction at ℓ with ℓ|v_ℓ(Δ_min). Then the exact deletion level of SerreWeightAndLevelOptimisation §6.1 M₀ equals the full prime-to-ℓ conductor N(E[ℓ]). The Serre-weight implication for ℓ≥11 is the supplier contract; at ℓ=5,7 retain the reduction alternative explicitly. (kraus-1997, §3.1 condition (c) and its p≥11 reduction consequence, p.1143, kraus-1997 line 200.)

Throughout this subsection, E/ℚ is elliptic; ℓ≥5 is prime; M₀ is the exact deletion level of SerreWeightAndLevelOptimisation §6.1; N is the full prime-to-ℓ conductor of E[ℓ]; E has good reduction at ℓ, or multiplicative reduction at ℓ with ℓ|v_ℓ(Δ_min(E)).

A proof route is as follows. The away-from-ℓ exponents are the supplied full residual conductor formula. Good reduction at ℓ leaves no coefficient-prime factor in M; in the multiplicative branch the deletion removes that factor once. Thus M₀ is prime to ℓ and equals N. The implication from Serre weight two at ℓ≥11 is the exact supplier contract; retain the local hypothesis at 5 and 7.

For arbitrary irreducible E[ℓ], M₀ and N can differ; the local alternative is explicit. The residual-conductor Kraus endpoint remains valid for ℓ≥5 without any assertion M₀=N; the weight-to-reduction shortcut is restricted to ℓ≥11.

*Needs:* NeronModelsAndSemistableAbelianVarieties §5.3h; SerreWeightAndLevelOptimisation §§6.1–6.3; SerreWeightAndLevelOptimisation §4.8 and the optimized elliptic weight-two lift contract; ArithmeticGaloisRepresentations §§6.1–6.4; AlgebraicModularFormsAndSerreWeights §§4.3, 4.6–4.7 and 4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.

### Examples

For y²=x³−x, the three nonzero rational two-points are (0,0),(1,0),(−1,0). At 3 and 5 the group orders are 4 and 8, both divisible by four; at 3 the arithmetic polynomial is X²+3, while the inverse polynomial is X²+1/3. In the model y²=x(x²+ax+b), taking a=3,b=1 gives nonsquare a²−4b=5 but square b; its quotient has discriminant 16 and roots 1,5, hence full two-torsion. Taking a=0,b=−1 gives square a²−4b=4, so the original curve has full two-torsion. Taking a=0,b=2 gives both b and a²−4b nonsquare; at q=5 there are two points and 4 does not divide 2. The finite prime-power test retains the bad-prime condition: at an odd q with a_q=−1, (q+1)(a_q−1)=−2(q+1), divisible by four.

### Dependencies

Layers 0–2; SerreWeightAndLevelOptimisation §4.8 and §§6.1–6.3; NeronModelsAndSemistableAbelianVarieties §5.3h; EllipticCurveModularity R29.6; ModularForms Layers 2–4 and 8G; AlgebraicModularFormsAndSerreWeights Layer 2; ModularCurvesPartII §§16.2–16.6; AutomorphicGaloisRepresentations §§6.1,6.4; EllipticCurves Layers 1–4; Chebotarev Layer 10; the optimized elliptic weight-two lift contract and the weight-two local reduction contract.


## Layer 4: rational cyclic isogenies and uniform irreducibility

The prime cyclic-degree theorem uses the Eisenstein supplier and the isogeny-character argument. Composite degrees require their own rational-point theorems and extension exclusions. Only after both classifications are proved do the two-torsion irreducibility bounds follow.

### 4.0 Native torsion and cyclic-kernel predicates

Use `GeometricTorsion E n` as the native subgroup of E(ℚ̄) killed by n. The instance `torsionModule` is its native `AddSubgroup.torsionBy.zmodModule` structure. Define `torsionRepresentation E n` by viewing each native additive Galois operator as a `ZMod n`-linear map through `AddMonoidHom.toZModLinearMap`. For prime n, residual irreducibility means `(torsionRepresentation E n).IsIrreducible`, using Mathlib’s `Representation.IsIrreducible`. In this case additive subgroups are 𝔽_n-subspaces, and irreducibility excludes a stable line in the n²-element torsion group. (ArithmeticGaloisRepresentations §6.1; mazur-1978, introduction, pp.129–130, mazur-1978 line 57.)

The torsion abbreviation has the following API.

- It is the actual kernel of multiplication by n on the geometric point group, with its inherited additive group.
- For prime n, its additive automorphisms are exactly its 𝔽_n-linear automorphisms; over characteristic zero it has n² elements.
- Isogenies of degree prime to n transport the action and invariant subgroups.

**Checks.**

- n=1 gives one point and n=2 gives four geometric points; using rational torsion would give fewer than four on many curves.
- n=0 gives the entire geometric point group under the native total convention; no prime-torsion theorem is applied to it.
- In characteristic p the supersingular curve y²=x³+1 over 𝔽₅ has only one geometric 5-torsion point; the characteristic-zero standing hypothesis excludes that case.

The module and linear representation have the following API.

- For every n the module scalar action is repeated addition modulo n, and each representation operator is the native coordinate Galois operator.
- At prime n, native irreducibility is equivalent to absence of a Galois-stable line; the geometric torsion is nonzero.
- It is invariant under rational isomorphism and transport along isogenies of degree prime to n.
- A stable line is a rational cyclic isogeny kernel; its generator need not be rational. On y²=x³+2, the subgroup O,(0,±√2) has order three and is Galois-stable, with no nonzero rational generator.

**Checks.**

- A rational nonzero p-torsion point gives a stable subgroup of order p inside the p²-element geometric group, so irreducibility fails.
- The identity Galois operator fixes every torsion point, and scalar 2 acts as zero on two-torsion. The curve y²=x³−3x−1 has irreducible two-division cubic of discriminant 81, so its mod-two image is cyclic of order three; X²+X+1 gives the companion action and irreducibility holds.
- The curve y²=x³−x+1 has irreducible two-division cubic of discriminant −23 and image GL₂(𝔽₂)≅S₃, with no common invariant line. In contrast y²=x³−2x has two-division splitting field ℚ(√2), an order-two image and the rational point (0,0); its image fixes a line.

Define `CyclicIsogenyDegree E n` by the existence of a rational elliptic target F and an actual rational isogeny E→F of degree n whose kernel after base change to ℚ̄ is cyclic. (mazur-1978, Theorem 1, p.129, mazur-1978 line 35; banwait-najman-padurariu, Theorem 1.1, p.2, banwait-najman-padurariu line 72.)

- Rational isomorphisms transport the predicate and the specified degree.
- It is equivalent in characteristic zero to a Galois-stable cyclic geometric subgroup of order n and its rational quotient.
- For every positive divisor d of n, the unique order-d subgroup gives a rational cyclic d-isogeny.

**Checks.**

- The identity has degree one and a one-element cyclic kernel, so degree one satisfies the predicate; it is excluded from Lemos’s theorem by n>1.
- A quotient by an order-two rational subgroup has degree two and a two-element geometric kernel, independently of other rational two-points.
- Multiplication by two has degree four and geometric kernel (ℤ/2)²; that map fails cyclicity. This separates cyclic kernels from degree alone.

*Needs:* EllipticCurves Layers 1–2; ArithmeticGaloisRepresentations §6.1; the native isogeny, kernel and torsion declarations in the supplier contracts.

### 4.1 The five possible isogeny-character exponents

For E/ℚ with a prime r-isogeny, r=11 or r≥17, its kernel character has the form αχ_r^k, with α^(2t)=1, 2t|12, and k modulo m=(r−1)/2, with t=gcd(m,6), and k equal to 0,1,1/2,1/3 or 2/3; the fractional cases occur only when m is respectively not divisible by 2 or 3. Passing to the dual replaces k by 1−k. (mazur-1978, §5, Lemma 5.2 and Proposition 5.1, pp.149–151, mazur-1978 line 842.)

Throughout this subsection, E/ℚ has a rational cyclic isogeny of prime degree r, with r=11 or r≥17; χ_r is the mod-r cyclotomic character; m=(r−1)/2 and t=gcd(m,6); fractional exponents are interpreted modulo m only when the denominator is invertible.

A proof route is as follows. Use EisensteinIdealAndRationalTorsion §§6.3–6.4 and 7.9 at r and the fundamental-character description after an extension of absolute ramification index 2e0, e0∈{2,3}. Raynaud’s finite-flat bound gives 0≤(e0 k)_m≤e0, which yields the listed residues. The remaining finite-order character is everywhere unramified after its 2t-th power; the narrow Hilbert class field of ℚ is ℚ itself, because the narrow class group of ℚ is trivial, so this character is trivial. The determinant computes the dual character.

The notation 1/2 and 1/3 means multiplicative inverses modulo m; no inverse is used when it does not exist.

*Needs:* EisensteinIdealAndRationalTorsion §§6.3–6.4 and 7.9; ArithmeticGaloisRepresentations §§2.3–2.4 and 6.3; ArithmeticGaloisRepresentations §§6.1–6.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; `TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

### 4.2 Frobenius congruences for a rational prime-isogeny character

Under the isogeny-character hypotheses, at an odd prime q≠r, potential good reduction gives a trace a over F_q with a≡β(q)q^k+β(q)^−1 q^(1−k) mod r, and over F_(q^12) the trace A satisfies A≡q^(12k)+q^(12−12k) mod r. Here β is the unramified part of the finite-order local character, with order dividing 12. (mazur-1978, §6, Proposition 6.3 and Corollary 6.1, pp.152–153, mazur-1978 line 979.)

Throughout this subsection, E,r,α,k,m,t satisfy §4.1; q≠r is an odd prime; the good-reduction model is taken after a totally ramified extension killing inertia; β is the unramified finite-order factor of the local kernel character, of order dividing 12.

A proof route is as follows. Kill the ramified finite-order character by a totally ramified extension. The rational r-kernel point prevents additive reduction there, since additive component-group order is at most four and r>4. Compute the two residual eigenvalues over the same finite residue field; passing to degree twelve kills β.

The trace belongs to the good curve after the stated extension, whose reduction may differ from the original bad reduction.

*Needs:* Layer 4.1 The five possible isogeny-character exponents; EllipticCurves Layer 4; EllipticCurves Layer 3; ArithmeticGaloisRepresentations §§2.3–2.4 and 6.3; ArithmeticGaloisRepresentations §§6.1–6.4.

### 4.3 The finite twelfth-power trace checks

The traces over F_(3^12) of elliptic curves defined over F3 are 658,−1358,1458. The analogous traces over F_(5^12) are obtained by the recurrence A0=2,A1=a,A_(n+1)=a A_n−q A_(n−1), using the actual possible traces over F5. (mazur-1978, §6, example (6.3) and §7 k=0 calculation, pp.153–154, mazur-1978 lines 974–976.)

Throughout this subsection, the curves are elliptic curves defined over F₃ or F₅; A_n is the Frobenius trace after base change to F_(q^n).

A proof route is as follows. Determine the possible base-field traces from the finite-field elliptic models and Hasse bounds; apply the Frobenius recurrence A₀=2, A₁=a, A_(n+1)=aA_n−qA_(n−1) through n=12. The finite trace identities are mathematical targets on the native point-count carrier.

The list is for curves descending to F3, not every elliptic curve over F_(3^12).

*Needs:* EllipticCurves Layer 3.

### 4.4 The zero-exponent prime-isogeny case

If the exponent in §4.1 is k=0 after duality and r=11 or r≥17, then r=37. (mazur-1978, §7, k=0, pp.153–154, mazur-1978 lines 1009–1020.)

Throughout this subsection, the §4.1 hypotheses hold; after passing to the dual isogeny the exponent is k=0 modulo m.

A proof route is as follows. At q=3 compare 1+3^12 against §4.3; a prime divisor of a nonzero difference must lie in {2,3,5,7,13,19,37,97}. At q=5 the analogous possible list is {2,3,5,7,13,17,31,37,61,157,229}; intersect and restrict to r=11 or r≥17.

The second finite-prime test eliminates 19 and 97, leaving 37 in the positive-genus range.

*Needs:* Layer 4.2 Frobenius congruences for a rational prime-isogeny character; Layer 4.3 The finite twelfth-power trace checks.

### 4.5 The one-third prime-isogeny case

If k=1/3 after duality, then r=11 or r=17 in the positive-genus range. (mazur-1978, §7, k=1/3, p.154, mazur-1978 line 1021.)

Throughout this subsection, the §4.1 hypotheses hold; after duality k=1/3 modulo m, with gcd(m,3)=1.

A proof route is as follows. At q=3 the congruence compares 3^4+3^8 against §4.3. Prime factorization gives only {2,3,5,11,17}; restrict the range.

Duality pairs k=1/3 with k=2/3.

*Needs:* Layer 4.2 Frobenius congruences for a rational prime-isogeny character; Layer 4.3 The finite twelfth-power trace checks.

### 4.6 The half-exponent class-number-one reduction

If k=1/2, then r≡3 mod4 and the imaginary quadratic field ℚ(√−r) has class number one; consequently r∈{11,19,43,67,163} in the positive-genus range. (mazur-1978, §7, k=1/2, pp.154–155, mazur-1978 line 1027.)

Throughout this subsection, the §4.1 hypotheses hold; k=1/2 modulo m, with m odd.

A proof route is as follows. For every odd prime q<r/4, §4.2 and Hasse force q to be inert: otherwise an integer trace would square to q or 4q. Apply `NumberField.exists_ideal_in_class_of_norm_le` to K=ℚ(√−r), with its actual discriminant −r and imaginary-quadratic signature: the bound is 2√r/π<r/4 for r≥11. Factor the resulting ideal into primes of smaller norms. Handle a split prime above 2 by (1+√−r)/2 or (3+√−r)/2, whose norms are twice an odd integer below r/4. Use the quadratic integral-basis, discriminant and splitting comparisons of ImaginaryQuadraticClassNumber H1.1–H1.4. Every ideal class is trivial. Apply the independent Heegner–Baker–Stark class-number-one classification; its complete classification is supplied by ImaginaryQuadraticClassNumber H3.6.

The class-number-one theorem is not proved by checking a finite list without a global upper bound.

*Needs:* Layer 4.2 Frobenius congruences for a rational prime-isogeny character; EllipticCurves Layer 3; Mathlib `NumberField.exists_ideal_in_class_of_norm_le`; ImaginaryQuadraticClassNumber H1.1–H1.4 and H3.6; ClassFieldTheory Layer 13.

### 4.7 Mazur’s rational prime-isogeny theorem

Prove `prime_cyclic_isogeny_degrees`. If E/ℚ admits a nontrivial rational cyclic isogeny of prime degree r, then r∈{2,3,5,7,11,13,17,19,37,43,67,163}. (mazur-1978, Theorem 1, p.129; Theorem 7.1 and proof, pp.153–155, mazur-1978 line 35.)

Throughout this subsection, E/ℚ is elliptic and admits a rational cyclic isogeny of prime degree r.

A proof route is as follows. For genus-zero prime levels the possibilities are 2,3,5,7,13, from the Γ₀ genus formula. For r=11 or r≥17 apply EisensteinIdealAndRationalTorsion §§6.3–6.4 and 7.9, §4.1 and duality to reduce to the zero, one-third and half cases. Combine their lists. The small Frobenius computations and class-number-one input are kept separate.

The theorem is uniform in E; it supplies no reverse dependency to parent R29.1.

*Needs:* EisensteinIdealAndRationalTorsion §§6.3–6.4 and 7.9; Layer 4.1 The five possible isogeny-character exponents; Layer 4.4 The zero-exponent prime-isogeny case; Layer 4.5 The one-third prime-isogeny case; Layer 4.6 The half-exponent class-number-one reduction; ModularForms Layer 10.

### 4.8 Mazur’s minimal positive-genus composite levels

If E/ℚ has a rational cyclic n-isogeny and n is not an allowed genus-zero degree or an allowed prime degree, some divisor d|n has positive genus and either is a prime covered by Mazur or belongs to {14,15,20,21,24,26,27,32,35,36,39,49,50,65,91,125,169}. (mazur-1978, introduction, minimal-positive-genus list, p.131, mazur-1978 lines 84–96.)

Throughout this subsection, E/ℚ admits a rational cyclic n-isogeny; n is outside the genus-zero degrees and allowed prime degrees.

A proof route is as follows. A stable cyclic group has a unique subgroup of each divisor order, giving a rational quotient at that divisor. Combine the exact Γ₀ genus formula with the prime-degree theorem to establish the displayed finite set of minimal composite obstructions.

The minimal-divisor list alone does not exclude multiples of an allowed d.

*Needs:* Layer 4.7 Mazur’s rational prime-isogeny theorem; EllipticCurves Layer 1; ModularForms Layer 10.

### 4.9 The genus-one rational-isogeny point tables

The noncuspidal rational points at levels 14,15,20,21,24,27,32,36,49 have respective cardinalities 2,4,0,4,0,1,0,0,0, with the corresponding rational elliptic models and j-maps. These are exact point tables, not a rank-only assertion. (banwait-najman-padurariu, Table 1.1, p.2, and §2, pp.5–6, banwait-najman-padurariu line 61.)

Throughout this subsection, d∈{14,15,20,21,24,27,32,36,49}; the points are noncuspidal ℚ-points of the actual X0(d).

A proof route is as follows. Identify the actual modular elliptic models and j maps. At each of the nine levels prove rank zero by Kummer descent, with local conditions and the known cusp classes giving the matching lower bound. Prove the exact torsion group using reduction at good odd primes and the explicit rational points, then subtract precisely the rational cusps. Finiteness of a Jacobian group or a rank statement alone is insufficient.

**Checks.**

- At d=20, the rational group has six elements and all six points are cusps, leaving 6−6=0 noncuspidal points.
- At d=14 there are six rational points and four rational cusps, leaving 6−4=2.
- At d=27 there are three rational points and two rational cusps, leaving 3−2=1. Rank zero alone distinguishes none of these three outcomes.

*Needs:* ModularCurvesPartII §§5.2, 5.5; EllipticCurves Layers 1, 6–7; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.15, 1.18–1.19.

### 4.10 The cusp-only level 39

Every ℚ-rational point of the actual modular curve X0(39) is a cusp. (banwait-najman-padurariu, §1, p.2, banwait-najman-padurariu line 58; kenku-1979, pp.21–23, cited by published locator.)

Throughout this subsection, P is a ℚ-rational point of the actual modular curve X0(39).

A proof route exhibits a nonzero new optimal quotient A_39 of J₀(39) whose simple factors have nonzero central L-value. Prove these nonvanishings from exact modular symbols. Apply the modular rank-zero contract and determine the entire finite group A_39(ℚ) by Kummer descent and torsion specialization. For the nonconstant cusp-based map X₀(39)→A_39, determine the rational points in every finite algebraic fiber over that group and show each is a cusp. The finite-fiber equations and their rational-solubility exclusions are arithmetic targets of this subsection. EisensteinIdealAndRationalTorsion §7.9 supplies formal immersion at ∞ for this new optimal quotient; it separates sections in the cusp residue disk, while other fibers require their own exact equations.

The claim is the entire rational-point set of X0(39), not a bounded-height search.

*Needs:* ModularCurvesPartII §§5.2, 5.5, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EulerSystemsAndKolyvaginSystems §§4.7, 5.13 and the modular rank-zero contract; EisensteinIdealAndRationalTorsion §7.9.

### 4.11 The cusp-only level 65

Every ℚ-rational point of the actual modular curve X0(65) is a cusp. (banwait-najman-padurariu, §1, p.2, banwait-najman-padurariu line 58; kenku-1980b, pp.15–20, cited by published locator.)

Throughout this subsection, P is a ℚ-rational point of the actual modular curve X0(65).

A proof route exhibits a nonzero new optimal quotient A_65 of J₀(65) whose simple factors have nonzero central L-value. Prove these nonvanishings from exact modular symbols. Apply the modular rank-zero contract and determine the entire finite group A_65(ℚ) by Kummer descent and torsion specialization. For the nonconstant cusp-based map X₀(65)→A_65, determine the rational points in every finite algebraic fiber over that group and show each is a cusp. The finite-fiber equations and their rational-solubility exclusions are arithmetic targets of this subsection. EisensteinIdealAndRationalTorsion §7.9 supplies formal immersion at ∞ for this new optimal quotient; it separates sections in the cusp residue disk, while other fibers require their own exact equations.

The claim is the entire rational-point set of X0(65), not a bounded-height search.

*Needs:* ModularCurvesPartII §§5.2, 5.5, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EulerSystemsAndKolyvaginSystems §§4.7, 5.13 and the modular rank-zero contract; EisensteinIdealAndRationalTorsion §7.9.

### 4.12 The cusp-only level 91

Every ℚ-rational point of the actual modular curve X0(91) is a cusp. (banwait-najman-padurariu, §1, p.2, banwait-najman-padurariu line 58; kenku-1980b, pp.15–20, cited by published locator.)

Throughout this subsection, P is a ℚ-rational point of the actual modular curve X0(91).

A proof route exhibits a nonzero new optimal quotient A_91 of J₀(91) whose simple factors have nonzero central L-value. Prove these nonvanishings from exact modular symbols. Apply the modular rank-zero contract and determine the entire finite group A_91(ℚ) by Kummer descent and torsion specialization. For the nonconstant cusp-based map X₀(91)→A_91, determine the rational points in every finite algebraic fiber over that group and show each is a cusp. The finite-fiber equations and their rational-solubility exclusions are arithmetic targets of this subsection. EisensteinIdealAndRationalTorsion §7.9 supplies formal immersion at ∞ for this new optimal quotient; it separates sections in the cusp residue disk, while other fibers require their own exact equations.

The claim is the entire rational-point set of X0(91), not a bounded-height search.

*Needs:* ModularCurvesPartII §§5.2, 5.5, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EulerSystemsAndKolyvaginSystems §§4.7, 5.13 and the modular rank-zero contract; EisensteinIdealAndRationalTorsion §7.9.

### 4.13 The cusp-only level 125

Every ℚ-rational point of the actual modular curve X0(125) is a cusp. (banwait-najman-padurariu, §1, p.2, banwait-najman-padurariu line 58; kenku-1981, pp.415–427, cited by published locator.)

Throughout this subsection, P is a ℚ-rational point of the actual modular curve X0(125).

A proof route exhibits a nonzero new optimal quotient A_125 of J₀(125) whose simple factors have nonzero central L-value. Prove these nonvanishings from exact modular symbols. Apply the modular rank-zero contract and determine the entire finite group A_125(ℚ) by Kummer descent and torsion specialization. For the nonconstant cusp-based map X₀(125)→A_125, determine the rational points in every finite algebraic fiber over that group and show each is a cusp. The finite-fiber equations and their rational-solubility exclusions are arithmetic targets of this subsection. EisensteinIdealAndRationalTorsion §7.9 supplies formal immersion at ∞ for this new optimal quotient; it separates sections in the cusp residue disk, while other fibers require their own exact equations.

The claim is the entire rational-point set of X0(125), not a bounded-height search.

*Needs:* ModularCurvesPartII §§5.2, 5.5, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EulerSystemsAndKolyvaginSystems §§4.7, 5.13 and the modular rank-zero contract; EisensteinIdealAndRationalTorsion §7.9.

### 4.14 The cusp-only level 169

Every ℚ-rational point of the actual modular curve X0(169) is a cusp. (banwait-najman-padurariu, §1, p.2, banwait-najman-padurariu line 58; kenku-1980a, pp.239–244 and kenku-169-corrigendum, p.428, cited by published locator.)

Throughout this subsection, P is a ℚ-rational point of the actual modular curve X0(169).

A proof route exhibits a nonzero new optimal quotient A_169 of J₀(169) whose simple factors have nonzero central L-value. Prove these nonvanishings from exact modular symbols. Apply the modular rank-zero contract and determine the entire finite group A_169(ℚ) by Kummer descent and torsion specialization. For the nonconstant cusp-based map X₀(169)→A_169, determine the rational points in every finite algebraic fiber over that group and show each is a cusp. The finite-fiber equations and their rational-solubility exclusions are arithmetic targets of this subsection. EisensteinIdealAndRationalTorsion §7.9 supplies formal immersion at ∞ for this new optimal quotient; it separates sections in the cusp residue disk, while other fibers require their own exact equations.

The claim is the entire rational-point set of X0(169), not a bounded-height search.

*Needs:* ModularCurvesPartII §§5.2, 5.5, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EulerSystemsAndKolyvaginSystems §§4.7, 5.13 and the modular rank-zero contract; EisensteinIdealAndRationalTorsion §7.9.

### 4.15 Kenku’s five remaining cusp-only levels

For d∈{39,65,91,125,169}, every rational point of X0(d) is a cusp. (banwait-najman-padurariu, Introduction and §2, Ken79/Ken80a/Ken80b/Ken81 references, pp.2,4–5, banwait-najman-padurariu line 58.)

Throughout this subsection, d∈{39,65,91,125,169}; P∈X0(d)(ℚ).

A proof route is as follows. Apply the five separate cusp-only rational-point theorems of §§4.10–4.14.

The five levels are individually quantified; a list of database records is not a rational-point proof.

*Needs:* Layer 4.10 The cusp-only level 39; Layer 4.11 The cusp-only level 65; Layer 4.12 The cusp-only level 91; Layer 4.13 The cusp-only level 125; Layer 4.14 The cusp-only level 169.

### 4.16 Excluding composite isogeny extensions

For the prime-isogeny and genus-one rational point tables, no noncuspidal point lifts to a larger cyclic-isogeny degree outside {1,…,19,21,25,27,37,43,67,163}; the additional minimal obstruction levels 26,35,50 also have no noncuspidal rational points. (banwait-najman-padurariu, §2, Mazur’s strategy, pp.5–6, banwait-najman-padurariu line 210; mazur-1978, p.131, mazur-1978 lines 97–105; kenku-1982, pp.199–201, cited by published locator.)

Throughout this subsection, the relevant rational point lies in the prime-isogeny or genus-one point table, or on X0(d) with d∈{26,35,50}; a lift means a noncuspidal rational point for a larger cyclic-isogeny degree under the actual modular degeneracy map.

A proof route is as follows. For each positive-genus minimal allowed point, determine all rational lifts under the cyclic-level degeneracy maps; prove the complete exclusion outside the displayed list. At each of 26,35,50 exhibit a nonzero new quotient with nonvanishing central factors, prove its exact finite rational group using the modular rank-zero contract and descent/torsion specialization, and determine every rational fiber of the cusp-based map as in §§4.10–4.14. Mazur’s p.131 cites the exclusions of 35,50 and 26 separately; all three are required. For lifts above an allowed table point use the actual finite degeneracy fiber and prove that it has no rational noncuspidal point at any forbidden degree. The isogeny-graph bound and exhaustion of these fibers are owned parts of this target (kenku-1982, pp.199–201, uncertified).

Checking only the five Kenku levels is not the full classification proof.

*Needs:* Layer 4.8 Mazur’s minimal positive-genus composite levels; Layer 4.9 The genus-one rational-isogeny point tables; Layer 4.15 Kenku’s five remaining cusp-only levels; EllipticCurves Layer 1; ModularCurvesPartII §§5.2, 13.1–13.3, 16.2–16.6, 17.3; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18; EisensteinIdealAndRationalTorsion §7.9; the modular rank-zero contract.

### 4.17 Mazur–Kenku’s rational cyclic-isogeny degrees

Prove `rational_cyclic_isogeny_degrees`. Every rational cyclic isogeny of an elliptic curve over ℚ has degree n∈{1,…,19,21,25,27,37,43,67,163}. In particular, there is no even degree greater than 18. (banwait-najman-padurariu, Theorem 1.1 and Table 1.1, p.2, banwait-najman-padurariu line 72; kenku-1982, pp.199–201, cited by published locator.)

Throughout this subsection, E/ℚ is elliptic; the rational isogeny has cyclic kernel and positive degree n.

A proof route is as follows. Apply §4.8 and the exact finite tables; §4.16 prevents every forbidden extension of an allowed minimal level. Include the genus-zero degrees and the prime degrees from Mazur.

Only the necessary degree restriction is exported; existence at every allowed degree is outside the endpoint proof.

*Needs:* Layer 4.7 Mazur’s rational prime-isogeny theorem; Layer 4.8 Mazur’s minimal positive-genus composite levels; Layer 4.9 The genus-one rational-isogeny point tables; Layer 4.15 Kenku’s five remaining cusp-only levels; Layer 4.16 Excluding composite isogeny extensions.

### 4.18 A rational two-point gives a cyclic twice-prime isogeny

If E/ℚ has a point of exact order two and reducible E[ℓ] for an odd prime ℓ, it admits a rational cyclic isogeny of degree 2ℓ. (bennett-siksek-2020, §3, one rational two-point irreducibility use, p.363, bennett-siksek-2020 line 329.)

Throughout this subsection, E/ℚ has a rational point of exact order two; ℓ is an odd prime; E[ℓ] is reducible.

A proof route is as follows. Combine the rational order-two subgroup with the Galois-stable order-ℓ subgroup supplied by ArithmeticGaloisRepresentations §6.1. Their orders are coprime, their intersection is zero, and their direct sum is cyclic of order 2ℓ; descend its quotient.

The isogeny is defined over ℚ while its whole kernel need not be pointwise rational.

*Needs:* ArithmeticGaloisRepresentations §§6.1–6.4; EllipticCurves Layer 1; EllipticCurves Layer 2.

### 4.19 Full two-torsion gives a cyclic four-isogeny in its class

If E/ℚ has full rational two-torsion, choose distinct rational order-two subgroups T,T′. For E′=E/T, the composite E′→E→E/T′ of the dual first isogeny and the second quotient is a rational cyclic four-isogeny. (EllipticCurves Layer 1, the dual isogeny with its two degree identities and the quotient by a finite Galois-stable subgroup; Layer 2, prime-to-degree torsion transport.)

Throughout this subsection, E/ℚ has full rational two-torsion; T,T′ are distinct order-two rational subgroups; E′=E/T.

A proof route is as follows. The two-step path does not backtrack: the image of E′[2] under the dual is T, whereas the second kernel is T′≠T. The degree-four kernel is therefore cyclic rather than (ℤ/2Z)².

Composing an isogeny with its own dual gives [2] with noncyclic kernel, so distinct T,T′ matter.

*Needs:* EllipticCurves Layer 1; EllipticCurves Layer 2.

### 4.20 Full two-torsion and reducibility give a cyclic four-times-prime isogeny

If E/ℚ has full rational two-torsion and reducible E[ℓ] for an odd prime ℓ, a ℚ-isogenous curve admits a rational cyclic 4ℓ-isogeny. (EllipticCurves Layer 1, the dual isogeny with its two degree identities and the quotient by a finite Galois-stable subgroup; Layer 2, prime-to-degree torsion transport.)

Throughout this subsection, E/ℚ has full rational two-torsion; ℓ is an odd prime; E[ℓ] is reducible.

A proof route is as follows. Transport E[ℓ] to E′=E/T through the degree-two isogeny. Combine its invariant ℓ-line with the cyclic four-kernel from §4.19; coprime cyclic subgroups give a cyclic kernel of order 4ℓ.

The 4ℓ-isogeny lies on the isogenous curve; no rational point of order four is asserted on E.

*Needs:* Layer 4.19 Full two-torsion gives a cyclic four-isogeny in its class; ArithmeticGaloisRepresentations §§6.1–6.4; EllipticCurves Layer 1; ArithmeticGaloisRepresentations §§3.1–3.6.

### 4.21 Uniform irreducibility with one rational two-point

Prove `rational_two_uniform_irreducibility`. If E/ℚ has a rational point of order two, then E[ℓ] is irreducible for every prime ℓ≥11. (bennett-siksek-2020, §3, p.363, bennett-siksek-2020 line 329.)

Throughout this subsection, E/ℚ has a rational point of exact order two; ℓ≥11 is prime.

A proof route is as follows. Otherwise §4.18 gives a cyclic isogeny of degree 2ℓ≥22, contradicting the even-degree consequence of §4.17.

The quantified range is uniform in E; no assertion is made for ℓ∈{3,5,7}.

*Needs:* Layer 4.18 A rational two-point gives a cyclic twice-prime isogeny; Layer 4.17 Mazur–Kenku’s rational cyclic-isogeny degrees.

### 4.22 Uniform irreducibility with full rational two-torsion

Prove `full_two_uniform_irreducibility`. If E/ℚ has full rational two-torsion, then E[ℓ] is irreducible for every prime ℓ≥5. (Layer 4.19–4.20 and the degree classification of §4.17; the ℓ≥7 application is bennett-siksek-2020, Lemma 3.3, pp.361–362, bennett-siksek-2020 lines 294–296.)

Throughout this subsection, E/ℚ has full rational two-torsion; ℓ≥5 is prime.

A proof route is as follows. Otherwise §4.20 gives a cyclic isogeny of even degree 4ℓ≥20, contradicting §4.17.

**Checks.**

- At ℓ=5 the forbidden degree is 20; §4.9 gives no noncuspidal rational point at this level.
- At ℓ=7 the forbidden degree is 28; it is absent from the cyclic list as well.
- At ℓ=3, y²=x(x+5)(x+32) has four rational two-torsion points and (4,36) of order three: its tangent has slope 7 and doubling gives (4,−36). Thus E[3] is reducible, and the cutoff cannot include 3.

*Needs:* Layer 4.20 Full two-torsion and reducibility give a cyclic four-times-prime isogeny; Layer 4.17 Mazur–Kenku’s rational cyclic-isogeny degrees.

### Examples

For q=3 and a=1 the first two Frobenius traces are A₁=1 and A₂=1−6=−5, pinning the minus sign in the recurrence. For the Frobenius recurrence at q=3, base traces 0,1,2,3 give A₁₂=1458,−1358,658,1458, respectively; changing a to −a does not change A₁₂. Hence −1458 is excluded. In GL₂(𝔽₂) the characteristic polynomial of an order-three element is X²+X+1, whose value at 1 is 1; the corresponding elliptic group order is odd, contradicting divisibility by four. Distinct two-isogeny kernels give a cyclic four-isogeny, while backtracking gives multiplication by two and the noncyclic four-element kernel. A reducible representation at ℓ=11 plus a rational two-point would give degree 22, absent from the cyclic list; full two-torsion and ℓ=5 would give degree 20, also absent.

### Dependencies

EisensteinIdealAndRationalTorsion §§6.3–6.4,7.9; ArithmeticGaloisRepresentations §§2.3–2.4,4.2–4.5,6.1–6.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5; ClassFieldTheory Layer 13; ImaginaryQuadraticClassNumber H1.1–H1.4,H3.6; ModularCurvesPartII §§5.2,5.5,9.1; EllipticCurves Layers 1–4; Mathlib Minkowski bound; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.19; EllipticCurves Layers 6–7; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; the modular rank-zero contract. The uniform bounds use the full composite-degree classification, not just the prime list.


## Layer 5: surjectivity with a rational cyclic isogeny

The non-CM proper-image alternatives reduce to a nonsplit normalizer after the Borel, exceptional and split cases are excluded. The mixed winding quotient rules out denominators of j. The actual modular coordinates then reduce the genus-zero isogeny cases to exact finite integer-j sets. Each residual-image conclusion quantifies over every prime above 37.

### 5.0 Geometric endomorphisms and nonsplit image containment

Define `GeometricallyNonCM E` by requiring every geometric endomorphism in the native isogeny Hom ring to be an integer scalar. Define `NonsplitNormalizerImage E p` by the existence of a cyclic subgroup C of the additive automorphism group of E[p](ℚ̄), with |C|=p²−1, such that every actual Galois operator normalizes C. Its nonsplit interpretation is used only for prime p. An element of order p²−1 has irreducible quadratic minimal polynomial: a split semisimple element has order dividing p−1 and a nonsemisimple element order dividing p(p−1). Thus C is the unit group of a quadratic field in End_(𝔽_p)(E[p]). (lemos-2017, §2, equation (2.1), pp.4–5, lemos-2017 line 168.)

The non-CM predicate has the following API.

- It agrees with End_(ℚ̄)(E)=ℤ, with every integer multiple acting as its usual multiplication map.
- Rational isomorphisms and rational isogenies preserve it.
- Endomorphisms are quantified after base change to ℚ̄; rational endomorphisms alone do not determine it.

**Checks.**

- For y²=x³−x, j=1728 and (x,y)↦(−x,iy) has order four over ℚ̄, so it is not an integer scalar and the non-CM predicate fails.
- For y²=x³+1, j=0 and the cube-root automorphism has order three, so the non-CM predicate fails.
- For y²+y=x³−x²−10x−20, Δ=−11⁵ and j=−2¹²·31³/11⁵ is nonintegral; CM integrality excludes CM and the non-CM predicate holds.

Define `SplitNormalizerImage E p` to mean that the actual Galois action preserves an unordered pair of distinct subgroups of order p in E[p](ℚ̄). At prime p these are distinct lines in a two-dimensional vector space and hence complementary. For odd primes p this is containment in the normalizer of the split Cartan subgroup fixing the two lines; at p=2 the split Cartan subgroup is trivial, its normalizer is all of GL₂(𝔽₂), and the line-pair condition is strictly stronger. (ArithmeticGaloisRepresentations §4.2; bilu-parent-rebolledo, Theorem 1.1, pp.958–959, bilu-parent-rebolledo line 104.)

- The predicate is invariant under transport of torsion and change of basis.
- For every Galois operator the two lines are either both fixed or exchanged, and inverse operators preserve the same pair.
- At odd p the stabilizer of the unordered pair has 2(p−1)² elements; requiring each line fixed instead gives the smaller split Cartan of order (p−1)².

**Checks.**

- At p=11 the two coordinate lines have 11 elements and are exchanged by the permutation matrix, so the order-200 split normalizer satisfies the line-pair condition. On y²=x³−x at p=13, 13=(3+2i)(3−2i) gives two order-13 kernels exchanged by complex conjugation, an actual split-normalizer image.
- The order-240 nonsplit normalizer at p=11 cannot be contained in an order-200 pair stabilizer; group containment would force 240 to divide 200.
- At p=2 the pair stabilizer has order two while GL₂(𝔽₂) has order six and acts on three lines; the entire group fails the definition, distinguishing it from the normalizer of the trivial split Cartan subgroup.

The image-containment predicate has the following API.

- It is equivalent to normalizing a quadratic field subalgebra of the torsion endomorphism algebra, and is invariant under change of torsion basis.
- Normalization is group normalization, so conjugation by an inverse Galois operator gives equality of the conjugate subgroup with C.
- The Cartan has p²−1 elements and its normalizer has 2(p²−1) elements for odd p; the normalizer includes the Cartan itself.

**Checks.**

- For y²=x³−x at p=11, the geometric ℤ[i] action reduces to the quadratic field 𝔽₁₂₁ since 11 is inert; Galois normalizes its 120 units. The normalizer has order 240; scalars of order 10 fail the cardinality condition.
- GL₂(𝔽₁₁) has order 120·110=13200, greater than 240, so its full image fails containment.
- The split normalizer at p=11 has order 200, which does not divide 240; it cannot satisfy the nonsplit predicate. At p=2 the nonsplit order-three Cartan has normalizer of order six, so the full image does satisfy it; the large-prime hypotheses are essential.

*Needs:* ArithmeticGaloisRepresentations §§4.2–4.5, 6.1–6.4; EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §3.1.

### 5.1 The CM prime-isogeny exceptions

For each r∈{19,43,67,163}, prove that the noncuspidal rational point set Y₀(r)(ℚ) on the smooth projective X₀(r) consists of exactly one point P_r, with the following j-invariant and full geometric endomorphism-order discriminant. These are four point-exhaustion targets, in addition to the degree-membership theorem of §4.7. (mazur-1977, Introduction, table p.40 and its column definitions p.41, mazur-1977 lines 300–574; mazur-1978, Introduction, table and CM explanation, p.129, mazur-1978 lines 14–29.)

| r | Y₀(r)(ℚ) | j(P_r) | CM discriminant |
| --- | --- | --- | --- |
| 19 | {P₁₉} | −96³ = −884736 | −19 |
| 43 | {P₄₃} | −960³ = −884736000 | −43 |
| 67 | {P₆₇} | −5280³ = −147197952000 | −67 |
| 163 | {P₁₆₃} | −640320³ = −262537412640768000 | −163 |

A proof route at level 19 proves that the genus-one curve, with a rational cusp as origin, has rank zero and rational group of order three by elliptic descent and torsion specialization; its two rational cusps leave exactly one noncuspidal point. At levels 43,67,163 use the nonconstant map X₀(r)→A_r to the nonzero finite Eisenstein quotient. Use EisensteinIdealAndRationalTorsion §6.4’s exact rational group: its order is the numerator of (r−1)/12, hence 7,11,27 respectively. Prove that all rational fibres over that group together contain exactly the two cusps and one noncuspidal point. These three finite-fibre exhaustions are targets here, using descent and the actual curve, quotient and j-maps. Formal immersion controls cusp residue disks; it does not determine other fibres. The genus and cusp formulas give genera 3,5,13 and two rational cusps in these three cases. (mazur-1977, Introduction, Theorems 4 and 6, pp.34–35, mazur-1977 lines 73–97, and point table p.40.)

Identify each remaining point with the supplied CM point. ImaginaryQuadraticClassNumber H3.5–H3.6 supplies the certified singular values j(τ_(−r))=γ₂(τ_(−r))³ with γ₂=−96,−960,−5280,−640320 for r=19,43,67,163, and the recovery of the maximal order of discriminant −r from that j-value. With the Hilbert class polynomial of ComplexMultiplicationAndExplicitReciprocity §3.1, whose degree is the class number, class number one (ImaginaryQuadraticClassNumber H3.6) gives H_(−r)(X)=X−j(τ_(−r)). The target here is the comparison j(P_r)=j(τ_(−r)), together with the identification of the geometric endomorphism order of the curve at P_r through ComplexMultiplicationAndExplicitReciprocity §§5.1–5.5; no singular value is recomputed here.

Deduce that if E/ℚ has a rational prime isogeny of degree r∈{19,43,67,163}, then E has geometric complex multiplication. Therefore a non-CM curve with a nontrivial rational cyclic isogeny has a rational prime isogeny with degree r∈{2,3,5,7,11,13,17,37}. Choose a prime-order subgroup of its stable cyclic kernel, apply §4.7, and use the four point exhaustions above to exclude the four exceptional degrees. (lemos-2017, §2, start of proof of Theorem 1.1, p.5, lemos-2017 line 187.)

Non-CM means End_(Qbar)(E)=ℤ; End_Q(E)=ℤ alone would not exclude CM.

**Checks.**

- At r=19 the genus-one rational group has three elements and there are two rational cusps, leaving 3−2=1 noncuspidal point. Its class polynomial is X+884736, which vanishes at −96³; merely knowing that 19 is an allowed degree does not give this count.
- At r=43 the allowed-degree list contains 43, whereas the point theorem gives the singleton j-image {−884736000}. H_(−43)=X+884736000 vanishes there and takes value 884736000 at j=0, so a different CM j-value is excluded as well.
- At r=67 and 163 the singleton values are −147197952000 and −262537412640768000; the respective polynomials X+147197952000 and X+262537412640768000 have these roots and not zero. The genera are 5 and 13 and the finite quotient groups have orders 11 and 27; neither group order equals the total rational point count three. A genus-one torsion count cannot replace these finite-fibre exhaustions.
- The identity isogeny has degree one and no prime-order kernel subgroup. The condition that the cyclic degree exceed one is required before choosing r.

*Needs:* For the point exhaustions, ModularCurvesPartII §§5.2, 13.1–13.3, 16.2–16.6, 17.3 for the curves, Jacobians, quotient and j-maps; EisensteinIdealAndRationalTorsion §§2.3, 6.3–6.4 for the nonzero quotient and finite rational group; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.14, 1.18 and EllipticCurves Layers 6–7 for descent and torsion; ModularForms Layers 0 and 10 for normalized q-expansions and genus/cusp formulas; ImaginaryQuadraticClassNumber H3.5–H3.6 for the certified singular values and order recovery, and ComplexMultiplicationAndExplicitReciprocity §3.1, §§5.1–5.5 for class polynomials and CM. For the CM corollary, the four point exhaustions in this subsection, Layer 4.7 Mazur’s rational prime-isogeny theorem and EllipticCurves Layer 1.

### 5.2 Serre’s projective inertia bound

For E/ℚ and a prime p≥5, the projective image of inertia at p in E[p] contains an element of order at least (p−1)/4. (serre-1981, §8.4, Lemma18′ and its full proof, printed pp.397–398 / archive197–198, serre-1981 line 2530.)

Throughout this subsection, E/ℚ is elliptic; p≥5 is prime; use the actual projective inertia image on E[p].

A proof route is as follows. If v_p(j)<0, pass to a degree-at-most-two Tate extension: projective tame inertia has order at least (p−1)/2. If j is integral, potential good reduction has ramification index in {1,2,3,4,6}; a quadratic twist reduces e=6 to e=3 without changing projective image, so e≤4. For good ordinary reduction, inertia gives order (p−1)/gcd(e,p−1). In the intermediate supersingular Newton-polygon case the two slopes give an element of order p. In the remaining height-two case, the level-two characters give order (p+1)/gcd(e,p+1). Each is at least (p−1)/4.

The intermediate height-two Newton-polygon branch cannot be omitted by a tame semisimplification.

*Needs:* EllipticCurves Layer 4; EllipticCurves Layer 1; ArithmeticGaloisRepresentations §§2.3–2.4 and 6.3; ArithmeticGaloisRepresentations §§6.1–6.4.

### 5.3 Excluding exceptional projective residual images

For E/ℚ and prime p>37, the projective image of E[p] is not isomorphic to A4, S4 or A5. (serre-1981, §8.4, Lemmas18 and18′, printed pp.397–398 / archive197–198, serre-1981 line 2525.)

Throughout this subsection, E/ℚ is elliptic; p>37 is prime.

A proof route is as follows. Apply §5.2. For p>37 the order is greater than five, whereas A4,S4,A5 have maximum element orders3,4,5.

This is an unconditional local lemma. Serre’s GRH-dependent global prime bound is not used.

*Needs:* Layer 5.2 Serre’s projective inertia bound; ArithmeticGaloisRepresentations §§4.2–4.5.

### 5.3a Quantitative elliptic isogenies over number fields

For every number field K of degree d, and elliptic curves E,E′ defined over K that are geometrically isogenous, prove existence of a geometric isogeny E→E′ of degree at most 10⁷d²(max(h_F(E),985)+4log d)². For non-CM E carrying a K-rational cyclic isogeny of degree δ, prove δ≤10⁷d²(max(h_F(E),985)+4log d)². The second assertion uses cyclicity and the rank-one geometric Hom lattice, rather than bounding an arbitrary multiplication isogeny. For d=2 and δ=p² this implies p≤7000·max(h_F(E),985). (gaudron-remond, Theorem 1.4, arXiv v1 p.4, gaudron-remond lines 168–184; cyclic corollary: bilu-parent-rebolledo, Proposition 4.3, p.971, bilu-parent-rebolledo lines 649–652.)

The target includes every number field, both geometric CM and non-CM in the existence assertion, and the exact stable Faltings normalization. The cyclic corollary uses the primitive Hom generator and the non-CM hypothesis; the existence theorem provides the numerical bound.

A proof route uses the quantitative abelian periods contract. In the non-CM case form the minimal abelian subvariety of E²×E′² containing the vector of two full period bases. Its field of definition has degree at most two over K; it is a surface isomorphic to E×E′, and its intersection with {0}²×E′² has cardinality the least geometric isogeny degree Δ (gaudron-remond, Theorem 7.5, pp.27–28, gaudron-remond lines 1528–1544). Apply Proposition 6.9 with the weighted polarization, whose top intersection degree is 2nΔ for the integer n≥1 chosen from the period basis. Its hypothesis is this intersection degree ≥10¹⁰; below that threshold Δ<10¹⁰ already satisfies the desired bound. Section 7.3 absorbs the logarithmic terms and §7.5 treats real places. For CM use §7.4’s separate period argument on E×E′. These routes use the supplied quantitative period estimates, not qualitative isogeny recognition (gaudron-remond lines 1598–1624, 1722).

For the cyclic corollary let φ have degree δ and let ψ be a bounded geometric isogeny to the same target. Non-CM gives ψ∨φ=[n]. Cyclicity forces δ|n since [n] kills ker φ, while n²=δ deg ψ. Hence δ≤deg ψ; multiplication isogenies with noncyclic kernels do not satisfy this argument.

**Checks.**

- For d=1 and h_F(E)≤985 the upper bound is 10⁷·985²=9702250000000; the identity of degree one lies below it.
- At d=2 and h_F(E)≤985, the square root of the bound is 2√10⁷(985+4log 2), less than 7000·985=6895000.
- With non-CM E=E′ and identical full period bases, the period surface is the graph of the identity on E²: its intersection with {0}²×E² has one point, so Δ=1 and top degree 2nΔ=2 at n=1.
- For a non-CM cyclic two-isogeny, the rank-one Hom lattice gives Δ=2, and the surface’s top degree is 4 at n=1; this is the unnormalized intersection degree, not its half.
- Replacing both full period bases by (ω,0) gives the diagonal elliptic curve inside E²×E², of dimension one. The full-basis hypothesis in the surface comparison excludes it.
- Multiplication by m has degree m² and kernel (ℤ/m)² for m>1, so these maps are excluded from the cyclic-degree corollary.
- The non-CM hypothesis is also essential: on y²=x³−x over ℚ(i), the endomorphism 10⁷+i has cyclic kernel and degree 10¹⁴+1. Its stable height is below 985, and the degree-two bound is less than 4·10⁷·989²=39124840000000<10¹⁴+1; the cyclic-degree assertion would fail on this CM curve.

*Needs:* the quantitative abelian periods contract; ArakelovGeometryAndAbelianHeights §§4.4, 5.9 for the actual stable height; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7; EllipticCurves Layer 1’s degree and duality.

### 5.3b Integrality of split Cartan rational points

For prime p=11 or p≥17 and every noncuspidal rational point P on X_s⁺(p), prove j(P)∈ℤ, without a non-CM restriction. (bilu-parent-split, arXiv 0807.4954v5, Theorem 6.1, pp.8–10, bilu-parent-split lines 430–443, 513–542.)

A proof route uses the difference of the two p-isogeny maps to the finite Eisenstein quotient of J₀(p). For p≥37 use the Appendix’s argument; for p∈{11,17,19,23,29,31} retain the finite-level integrality assertions of Theorem 6.1 as part of this target, with their cusp and isogeny calculations. Prove that a denominator forces specialization to the rational split cusp, and prove the split-cusp differential comparison there in every denominator characteristic, including 2. That comparison is owned here; the formal-immersion theorem for X₀(p), which excludes residue characteristic 2, does not supply it. The required integral Hecke pairing and Eisenstein quotient are imported (bilu-parent-split lines 443–444, 503–552).

**Checks.**

- At p=17 the theorem applies to every noncuspidal rational point; p=13 meets neither permitted alternative.
- An integral value j=0 has absolute logarithmic height log max(1,0)=0, not a logarithm with a nonzero-denominator assumption.
- At p=11 a nonrational split cusp has real-cyclotomic degree (11−1)/2=5, while the split curve also has a rational cusp; the route must distinguish their images.

*Needs:* ModularCurvesPartII §§9.5–9.6, 13.1–13.3, 14.15; EisensteinIdealAndRationalTorsion §§6.3–6.4, 7.9; HeightsRationalPointsAndObstructions §§1.15b–1.18; EllipticCurves Layer 4.

### 5.3c The explicit Runge inequality

For every prime p>3 and integral noncuspidal point P∈Y_s⁺(p)(ℤ), prove h(j(P))≤2π√p+6log p+21(log p)²/√p, where h is the absolute logarithmic Weil height. This includes CM points and, for j∈ℤ, h(j)=log max(1,|j|). (bilu-parent-rebolledo, Theorem 3.1, p.964, bilu-parent-rebolledo lines 328–330; proof, pp.968–970, bilu-parent-rebolledo lines 560–622.)

A proof route imports the Siegel functions of ImaginaryQuadraticClassNumber H3.2 with their exact transformation law, finite exponent-product modularity criterion and integrality over ℤ[j], forms the split-Cartan orbit products of these functions at level p, computes their cusp divisors, and bounds their two cusp expansions on a fundamental domain. The product formula at an integral point and the explicit tail estimates give the displayed constants. This arithmetic estimate is a target here on the supplied modular curve.

**Checks.**

- At p=5 the right side is approximately 48.033; an integral value j=0 has height zero and satisfies the inequality.
- At p=17 the right side is approximately 83.790; replacing √p by p gives a different bound and loses the stated scale.
- At p=3 the hypothesis fails, and at a nonintegral rational value j=1/2 the height is log 2; the integral-point hypothesis cannot be dropped when applying the product-formula argument.

*Needs:* ModularCurvesPartII §§9.5–9.6; ImaginaryQuadraticClassNumber H3.2 for Siegel functions, their transformations, the modular-product criterion and integrality; ModularForms Layers 1 and 10 for q-expansions and divisors; ArakelovGeometryAndAbelianHeights §1.12 for absolute logarithmic height.

### 5.4 The large-prime split Cartan exclusion

For a prime p>1.4·10^7, every rational point of X0^+(p²) is a cusp or CM point. (bilu-parent-rebolledo, Theorem4.1(i) and proof, pp.970–972, bilu-parent-rebolledo line 625.)

Throughout this subsection, p>1.4·10^7 is prime; P∈X0^+(p²)(ℚ).

A proof route is as follows. Use the general quantitative bound in §5.3a, §5.3b’s split-Cartan integrality and §5.3c’s Runge inequality, and the normalized isogeny/height comparisons. A cyclic p²-isogeny over a quadratic field gives p≤7000·max(h_F(E₁),985). Together with the p-isogeny height difference and Runge estimate, this forces p≤1.4·10⁷.

Use the exact stable height comparison of ArakelovGeometryAndAbelianHeights §§4.4,5.9, the arithmetic targets §§5.3a–5.3c.

*Needs:* ModularCurvesPartII §§5.2, 5.5; EllipticCurves Layer 4; EllipticCurves Layer 1; ArakelovGeometryAndAbelianHeights §4.4; ArakelovGeometryAndAbelianHeights §5.9; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7; Layer 5 §5.3a quantitative elliptic isogenies; Layer 5.3b Integrality of split Cartan rational points; Layer 5.3c The explicit Runge inequality.

### 5.4a The generalized Jacobian of X₀(p) and Heegner–Gross vectors

Throughout, p>11 is prime with p≠13, S is the finite set of isomorphism classes of supersingular elliptic curves over 𝔽̄_p, R_s=End(E_s) for s∈S, and s↦s^(p) is the Frobenius permutation of S given by the conjugate curve; every j(s) lies in 𝔽_(p²), and s^(p)=s exactly when j(s)∈𝔽_p. These are the prerequisites of the Heegner–Gross criterion in §5.5; each is a target here. (bilu-parent-rebolledo, §§5.1.1–5.1.2, Propositions 5.1, 5.2 and 5.5 with Corollary 5.3, pp.973–975, bilu-parent-rebolledo lines 731–833.)

Define J₀(p)♯ as the generalized Jacobian of the smooth projective curve X₀(p)/ℚ with respect to the reduced modulus (0)+(∞) of its two rational cusps: the semi-abelian variety of degree-zero divisor classes on Y₀(p) modulo divisors of functions congruent to 1 at both cusps. Prove that it is an extension of J₀(p) by the split one-dimensional torus 𝔾_m, whose coordinate on the class of div(f) is f(0)/f(∞), that the Hecke correspondences T_n act on it compatibly with J₀(p), and define the winding ideal I♯_e as the annihilator in this Hecke algebra 𝕋♯ of the rational winding class e♯ of the relative homology of X₀(p) relative to its cusps, and J♯_e=J₀(p)♯/I♯_e J₀(p)♯ as the winding quotient. The Atkin–Lehner involution w_p exchanges the two cusps, so it acts on J₀(p)♯; prove that w_p=−T_p on J₀(p)♯: on the quotient J₀(p) this is the Atkin–Lehner identity at prime level, and on the toric part w_p acts by inversion while T_p acts trivially, since T_p sends the cusp ∞ to p(∞) and the cusp 0 to (0)+(p−1)(∞). Hence 1+w_p∈𝕋♯; since w_p carries the winding path from 0 to i∞ to its reverse, (1+w_p)e♯=0, so 1+w_p∈I♯_e and w_p acts as −1 on J♯_e. The general smooth-curve generalized Jacobian with a reduced rational modulus is constructed here for this curve; an ordinary Picard Jacobian does not substitute for it, since it loses the toric direction.

Prove the following, for a noncuspidal non-CM rational point P of X₀⁺(p²), a point x∈Y₀(p²)(K) above P over a number field K with [K:ℚ]≤2, π_p:X₀(p²)→X₀(p) the degeneracy map preserving j, x₁=π_p(w_(p²)x) and x₂=w_p(π_p x):

- x₁=x₂ in X₀(p)(K) forces the elliptic curve underlying x to have geometric CM (bilu-parent-rebolledo lines 734–737).
- K is a quadratic field in which p splits, and at every prime of K above p the sections s₁,s₂ of the Deligne–Rapoport model defined by x₁,x₂ are not supersingular and have the same reduction (bilu-parent-rebolledo, Proposition 5.1, line 750). The field K may be real or imaginary.
- The map Y₀(p)→J♯_e sending Q to the class of (Q)−(x₁) extends to a morphism φ_P from the smooth locus of Y₀(p) over O_K to the Néron lft-model of J♯_e over O_K, and φ_P(s₂) is a torsion section (bilu-parent-rebolledo lines 757–771). The torsion is proved as follows. Write y=π_p(x). Since P is rational and x is not (a rational point of Y₀(p²) would carry a rational cyclic p²-isogeny with p²>27, excluded by §4.17), the conjugate of x over ℚ is w_(p²)x, so x₁ is the conjugate ȳ of y and x₂=w_p(y). The class z=[(x₂)−(x₁)] of φ_P(s₂) therefore satisfies z̄=[(w_p ȳ)−(y)]=−w_p z, and w_p=−1 on J♯_e gives z̄=z, so z∈J♯_e(ℚ). Prove that z is a ℤ-section of the identity component G⁰ of the Néron lft-model of J♯_e: at a prime of K above p the sections s₁,s₂ meet the same smooth point of the special fibre, and at every other prime they meet the same connected component of the smooth locus of Y₀(p), so their difference lies in the identity component over O_K; this descends to ℤ because the Néron model commutes with the base change at primes unramified in K, and at a prime ramified in K only the split torus contributes a component group, on which base change is multiplication by the ramification index. Prove that G⁰(ℤ) is finite: it is an extension of a subgroup of (J₀(p)/I♯_e J₀(p))(ℚ) by 𝔾_m(ℤ)={±1}, and J₀(p)/I♯_e J₀(p) is isogenous to the winding quotient J_e=J₀(p)/I_e J₀(p) of X₀(p), where I_e is the annihilator of the winding class e∈H₁(X₀(p),ℚ), because the Eisenstein character T_ℓ↦ℓ+1 of the toric part is distinct from every cuspidal eigencharacter, so I♯_e and I_e have the same image in 𝕋⊗ℚ; its rational points are finite by the modular rank-zero contract. Hence z is torsion. The group of sections of the identity component over O_K itself is infinite when K is real quadratic, since the toric part contributes O_K^×; the descent to ℚ replaces that general assertion. Consequently, since p splits in K and e=1<p−1, if φ_P is a formal immersion at the common reduction of s₁ and s₂ then s₁=s₂.
- After base change to 𝔽_(p²) there is a Hecke-equivariant isomorphism between the cotangent space at the origin of the special fibre of J₀(p)♯ at p and 𝔽_(p²)^S, the character group ℤ^S of the toric reduction tensored with 𝔽_(p²), on which Frobenius acts semilinearly by permuting S; the 𝔽_p-rational cotangent vectors are exactly the tuples with λ_(s^(p))=λ_s^p. Under it v=Σλ_s[s]∈𝔽_(p²)^S gives a cotangent vector ω_v of J♯_e over 𝔽_(p²) exactly when I♯_e v=0, and with j as local parameter at an ordinary point of Y₀(p) over 𝔽_(p²) the pullback of ω_v is Σλ_s/(j(P)−j(s)) dj (bilu-parent-rebolledo lines 773–781). Consequently, if some v∈ℤ^S with I♯_e v=0 has Σλ_s/(j(P)−j(s))≠0 in 𝔽_(p²), then φ_P is a formal immersion at s₁, because a formal immersion is detected after the base change to 𝔽_(p²) (Proposition 5.2, line 783).
- For a negative discriminant −D with p inert or ramified in ℚ(√−D) and p not dividing the conductor of O_(−D), let m_s(D) be the multiplicity of j(s) as a root of the reduction modulo p of the Hilbert class polynomial H_(−D), so that H_(−D)≡∏_s(X−j(s))^(m_s(D)) modulo p and Σ_s m_s(D)=h(−D), and set v_D=Σ_s m_s(D)[s]∈ℤ^S. Prove that I♯_e v_D=0 and that on the ordinary locus the differential attached to v_D is the logarithmic derivative H′_(−D)(j)/H_(−D)(j) dj of the Hilbert class polynomial modulo p (Proposition 5.5 and equation (5.2), lines 805–833). The vector v_D is Frobenius-invariant, since H_(−D) has rational integer coefficients, so it descends to 𝔽_p. Let h_s(−D) be the number of optimal embeddings of O_(−D) into R_s modulo conjugation by R_s^×, and e_D=|O_(−D)^×|^(−1)Σ_s h_s(−D)[s] the embedding-weighted vector of the source. Prove by Deuring lifting that h_s(−D)=2m_s(D) when p is inert in ℚ(√−D) and h_s(−D)=m_s(D) when p is ramified: the pairs (E,ι) of a CM curve with a ring isomorphism ι:O_(−D)≅End(E) number 2h(−D), two orientations for each curve, and each optimal embedding into R_s lifts to such a pair, uniquely when p is inert and to both orientations of one curve when p is ramified. Hence v_D=(|O_(−D)^×|/2)e_D for p inert and v_D=|O_(−D)^×|e_D for p ramified, and I♯_e e_D=0 is equivalent to I♯_e v_D=0. The differential attached to e_D is (2/|O_(−D)^×|)H′_(−D)/H_(−D) dj for p inert and (1/|O_(−D)^×|)H′_(−D)/H_(−D) dj for p ramified; it equals the logarithmic derivative only for p inert and D∉{3,4}. The set S is indexed by curves, not by maximal-order types: Frobenius-conjugate supersingular j-invariants can have isomorphic endomorphism rings, and m_s(D) and h_s(−D) are counted on each curve separately.

**Checks.**

- The generalized Jacobian has dimension g+1, where g is the genus of X₀(p), and its toric part is one-dimensional because the modulus has two rational points; at p=17, g=1, so J₀(17)♯ has dimension two while J₀(17) has dimension one.
- At p=17 and D=3, 17≡2 mod 3 is inert in ℚ(√−3), H_(−3)=X, j=0 is supersingular, m₀(3)=1, v₃=[0] and its differential is dj/j. The curve y²=x³+1 has automorphism group μ₆, the two order-three automorphisms are the two optimal embeddings of ℤ[ζ₃], conjugation by the abelian group μ₆ fixes them, so h₀(−3)=2, e₃=[0]/3 and the differential of e₃ is dj/(3j), with coefficient 6 in 𝔽₁₇; a definition taking the differential of e₃ to be dj/j would be wrong by the unit 3. Every ordinary j₀∈𝔽₁₇ is nonzero, so the formal-immersion criterion holds at every ordinary point once I♯_e v₃=0 is known.
- At p=17 and D=51, 17 divides 51, so 17 is ramified in ℚ(√−51); H_(−51)=X²+5541101568X+6262062317568 reduces to X²+X+13=(X−8)² modulo 17, and 8 is the second supersingular invariant modulo 17, so m₈(51)=2=h(−51), v₅₁=2[8], and the differential of v₅₁ is 2dj/(j−8). The ramified relation gives h₈(−51)=2 and e₅₁=[8], whose differential dj/(j−8) is half the logarithmic derivative; the inert relation would give e₅₁=2[8]. Consistently, H_(−12)=X−54000 reduces to X−8, so v₁₂=[8].
- At p=2, where the single supersingular curve has endomorphism ring the Hurwitz order with 24 units, the counting dichotomy is visible directly: for D=11, with 2 inert, the 24 elements of reduced trace 1 and norm 3 fall into two conjugacy classes of 12, so h(−11)=1 and h_s(−11)=2; for D=8, with 2 ramified, the 12 elements of trace 0 and norm 2 form one class, so h_s(−8)=1=h(−8). This is a test of the embedding count only; the criterion itself is stated for p>11.
- At p=17 and D=4, 17≡1 mod 4 splits in ℚ(i); 1728≡11 is ordinary modulo 17, so no root of H_(−4) reduces to a supersingular invariant, v₄=0, every h_s(−4) is zero because O_(−4) has no embedding into the quaternion algebra ramified at 17 and at infinity, and the differential of v₄ is zero although H′_(−4)/H_(−4)=1/(j−11) is not. The inert-or-ramified hypothesis cannot be dropped.
- At p=37 write t²=2 in 𝔽₁₃₆₉; the supersingular invariants are 8 and 3±10t, with (3+10t)^(37)=3−10t. The vector [3+10t] alone has λ_(s^(p))=0≠λ_s^p=1 and is not 𝔽₃₇-rational; at the ordinary invariant j₀=1 its pullback coefficient 1/(1−(3+10t))=17+26t lies outside 𝔽₃₇. The sum [3+10t]+[3−10t] descends and has coefficient (17+26t)+(17−26t)=34∈𝔽₃₇ at j₀=1. A definition identifying the 𝔽_p-cotangent space with 𝔽_p^S would admit the first vector.
- If P were a CM point, x₁=x₂ could hold; the non-CM hypothesis is what turns s₁=s₂ into a contradiction.
- With p=17 and K either real or imaginary quadratic, the torsion argument for φ_P(s₂) uses only z̄=−w_p z and 𝔾_m(ℤ)={±1}; it never uses the signature of K, whereas O_K^× is infinite for K real.

*Needs:* ModularCurvesPartII §§5.2, 5.5 for X₀(p), X₀(p²), their degeneracy maps and Atkin–Lehner involutions; ModularCurvesPartII §§9.1, 13.1–13.3, 17.3 for Jacobians, Abel maps and Hecke correspondences; ModularForms Layer 6 for w_p and the Atkin–Lehner identity T_p=−w_p at prime level; ModularSymbolsPadicLFunctions §§0.6–0.8 for the relative homology, the rational winding class and the Manin–Drinfeld splitting of the boundary summand; NeronModelsAndSemistableAbelianVarieties §§5.2, 6.4d for Néron models and cotangent comparisons of the abelian part; the modular rank-zero contract and EulerSystemsAndKolyvaginSystems §5.13 for finiteness of the rational points of the winding quotient of J₀(p); HeightsRationalPointsAndObstructions §§1.15b–1.18 for torsion specialization at e<p−1; ComplexMultiplicationAndExplicitReciprocity §3.1 and §§5.1–5.5 for class polynomials, supersingular CM reduction, Deuring lifting and endomorphism comparisons; Layer 4.17 Mazur–Kenku’s rational cyclic-isogeny degrees; EllipticCurves Layer 4.

### 5.5 The Heegner–Gross criterion for split Cartan points

For prime p>11, p≠13, suppose there is a negative fundamental discriminant −D with χ_D(p)∈{0,−1} and p not dividing gcd_(2≤c≤7)Res(H′_(−D),H′_(−c²D)). Then every point of X0^+(p²)(ℚ) is cusp or CM. (bilu-parent-rebolledo, Corollary 5.7, p.976, with p>11, bilu-parent-rebolledo line 847.)

Throughout this subsection, p>11 is prime and p≠13; −D is a negative fundamental discriminant; χ_D(p)∈{0,−1}; p does not divide gcd_(2≤c≤7) Res(H′_(−D),H′_(−c²D)), with H the actual Hilbert class polynomials.

A proof route is as follows. The resultant condition gives a conductor c∈{2,…,7} for which the two derivatives have no common zero modulo p. At every ordinary j₀ at least one of H′_(−D)(j₀), H′_(−c²D)(j₀) is nonzero, and p is inert or ramified in ℚ(√−D)=ℚ(√−c²D). Take a noncuspidal non-CM rational point P with its quadratic lift x and the sections s₁,s₂ of §5.4a. By §5.4a the multiplicity vectors v_D and v_(c²D) lie in ℤ^S, are Frobenius-invariant, satisfy I♯_e v=0, and their differentials are the logarithmic derivatives of H_(−D) and H_(−c²D) modulo p; p>11 never divides the conductor c≤7. At the ordinary common reduction j₀ of s₁ one of them is nonzero, so φ_P is a formal immersion there. Then s₁=s₂, so x₁=x₂ and P is CM, a contradiction (bilu-parent-rebolledo, Proposition 5.6 and proof of Corollary 5.7, p.976, lines 839–859).

The divisor comparison takes place in the generalized Jacobian J₀(p)♯ of §5.4a, not in the Picard Jacobian of X₀(p).

*Needs:* Layer 5.4a The generalized Jacobian of X₀(p) and Heegner–Gross vectors; ModularCurvesPartII §§5.2, 5.5; ComplexMultiplicationAndExplicitReciprocity §3.1 and §5.1.

### 5.6 The finite split Cartan exclusion

For every prime 11<p≤1.4·10⁷ with p≠13, establish the discriminant-and-resultant hypothesis of §5.5, and hence prove that every rational point of X₀⁺(p²) is a cusp or CM point. Use the negative fundamental discriminants and exact resultant identities of bilu-parent-rebolledo §5.2 and §6. The target is the quantified arithmetic implication for this entire interval. (bilu-parent-rebolledo, Corollary 5.7 and Proposition 5.9, pp.976–979, bilu-parent-rebolledo lines 850, 971–974.)

A proof route proves that each prime in the stated interval has a discriminant in the source’s finite family for which χ_D(p)∈{0,−1} and the resultant gcd is prime to p. Apply §5.5 to that discriminant. The exact class-polynomial identities and the universal finite implication are mathematical targets here.

**Checks.**

- The lower boundary 11 fails 11<p, and 13 is separately excluded.
- At p=17 the discriminant −3 has χ_(−3)(17)=−1; H_(−3)=X and H_(−12)=X−54000 give derivatives 1,1 and resultant 1. In contrast χ_(−4)(17)=1, so −4 alone does not meet the criterion.
- The upper cutoff 14000000 is less than 10¹⁴. Equality is retained on the finite side of the split at 14000000, even though this integer itself is composite.

*Needs:* Layer 5.5 The Heegner–Gross criterion for split Cartan points; ComplexMultiplicationAndExplicitReciprocity §§5.1–5.5; ModularForms Layers 1 and 10.

### 5.7 The split Cartan uniformity input

Prove `split_normalizer_exclusion`: for geometrically non-CM E/ℚ and every prime p>11 except p=13, the image of E[p] is not contained in a split Cartan normalizer. This includes the p>37 range used in the proper-image comparison. (bilu-parent-rebolledo, Theorem1.1 and identification Xsplit(p)≅X0^+(p²), pp.958–960; Theorem4.1(i), Proposition5.9, bilu-parent-rebolledo line 104.)

Throughout this subsection, E/ℚ is geometrically non-CM; p>11 is prime and p≠13.

A proof route is as follows. Identify Xsplit(p)≅X0^+(p²). For p>1.4·10^7 use §5.4. For 11<p≤1.4·10^7 use §5.6. A non-CM elliptic point is noncuspidal.

**Checks.**

- At p=11 the strict lower hypothesis fails; the theorem makes no claim for this boundary.
- At p=13 the exception excludes the prime even though 11<13.
- At p=17 the lower and exceptional-prime hypotheses hold, and the finite-range theorem applies. Every p>37 used in §5.8 satisfies both.

*Needs:* Layer 5.4 The large-prime split Cartan exclusion; Layer 5.6 The finite split Cartan exclusion; ModularCurvesPartII §§3.8, 5.2, 9.5–9.7.

### 5.8 Every remaining proper image is in a non-split Cartan normalizer

Prove `proper_image_nonsplit`. For geometrically non-CM E/ℚ and prime p>37, if the image of E[p] is proper in GL₂(F_p), then `NonsplitNormalizerImage E p` holds: the image is contained in the normalizer of a non-split Cartan. (lemos-2017, Theorem 2.3, p.6, lemos-2017 line 223.)

Throughout this subsection, E/ℚ is geometrically non-CM; p>37 is prime; the image of E[p] is a proper subgroup of GL₂(F_p).

A proof route is as follows. The Weil pairing makes the determinant surjective. Apply Dickson’s finite-image classification. A Borel image would give a rational p-isogeny, excluded by the Mazur list and its CM exceptions. Use §5.3 and §5.7 for the other cases; a nonsplit Cartan is contained in its normalizer.

The determinant and local arithmetic information are essential; arbitrary subgroups of GL₂(F_p) do not satisfy this conclusion.

*Needs:* Layer 5.1 The CM prime-isogeny exceptions; ArithmeticGaloisRepresentations §§6.1–6.4; EllipticCurves Layer 1; Layer 5.3 Excluding exceptional projective residual images; Layer 5.7 The split Cartan uniformity input; ArithmeticGaloisRepresentations §§4.2–4.5.

### 5.9 Potentially multiplicative primes under a non-split image

If p≥5 and the image of E[p] is contained in a non-split Cartan normalizer, every potentially multiplicative reduction prime q satisfies q≠p and q≡±1 mod p. In particular E has potentially good reduction at p. (lemos-2017, Proposition 2.2 and complete proof, pp.4–5, lemos-2017 line 141.)

Throughout this subsection, E/ℚ is elliptic; p≥5 is prime; the image of E[p] is contained in a non-split Cartan normalizer.

A proof route is as follows. Over Q_q a potentially multiplicative E is a quadratic twist of a Tate curve, so its residual diagonal characters are ψχ_p and ψ. Squaring each matrix places it in the Cartan and gives eigenvalues χ_p² and 1. The conjugate-eigenvalue description over F_(p²) forces χ_p²=1. At q=p the local cyclotomic character is onto F_p×, contradicting p≥5; at q≠p evaluate arithmetic Frobenius to get q²≡1.

This includes a ramified quadratic twist of the Tate curve; a good-reduction assertion about the original curve is stronger and unjustified.

*Needs:* ArithmeticGaloisRepresentations §§4.2–4.5; ArithmeticGaloisRepresentations §§2.3–2.4 and 6.3; ArithmeticGaloisRepresentations §§6.1–6.4; EllipticCurves Layer 4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.

### 5.10 The Cartan correspondence kills the p-old part

For r∈{2,3,5,7,13}, prime p∉{2,3,5,7,13}, the correspondence through X0(r)×_(X(1)) X(p)/(Nsp∩Nns) induces a prime-to-p Hecke-equivariant homomorphism from Jac(X0(rp²)/w_(p²)) to Jac(X0,ns^+(r,p)) that is zero on the p-old part. (lemos-2017, §3, Lemma 3.2 and proof, p.9, lemos-2017 line 331.)

Throughout this subsection, r∈{2,3,5,7,13}; p is prime outside that set; the involution on X0(rp²) is w_(p²), fixing the r-level structure.

A proof route is as follows. Pull back along the split-normalizer map and push forward along the nonsplit-normalizer map on degree-zero divisor classes. For the two p-degeneracy maps, the pullback divisors are Borel-invariant; Nns B+=Nns B−=GL₂(F_p) makes their pushforward old from X0(r). Since X0(r) has genus zero, its degree-zero Jacobian is zero.

Finite-map pullback multiplies divisor degree; degree-zero classes stay degree zero. No false preservation of every degree is needed.

*Needs:* ModularCurvesPartII §§9.1, 13.1–13.3; ModularCurvesPartII §§16.2–16.6; ArithmeticGaloisRepresentations §§4.2–4.5; ModularForms Layer 10.

### 5.11 The winding class selects exactly nonvanishing central periods

In the full-new quotient B of Jac(X₀(rp²)/w_(p²)), let e_B be the rational winding class and I_e its annihilator in the rational Hecke algebra. Every surviving eigenform in the winding quotient B/I_eB has L(f,1)≠0. The oriented differential period is −L(f,1); the unscaled f(z)dz period is iL(f,1)/(2π). (darmon-merel, Proposition 7.1 proof, author-version pp.20–21, with the orientation convention above, darmon-merel line 614.)

Throughout this subsection, B is the full new quotient of Jac(X0(rp²)/w_(p²)); e_B is its rational winding class; I_e is its annihilator in the rational Hecke algebra.

A proof route is as follows. Decompose the full-new rational Hecke module into eigenspaces and use the actual winding pairing. A surviving eigencomponent has nonzero pairing with the winding class. With the stated orientation that pairing is −L(f,1), hence its central L-value is nonzero.

No arbitrary period-normalization scalar replaces the actual integral from 0 to infinity.

*Needs:* ModularSymbolsPadicLFunctions §§0.6–0.8; ModularSymbolsPadicLFunctions §§1.1–1.2; ModularCurvesPartII §§9.1, 13.1–13.3; ModularCurvesPartII §§13.3, 14.15.

### 5.12 Nonvanishing of the new winding class

For r∈{2,3,5,7,13} and prime p outside that set, let D be the degree-zero divisor on X₀,ns⁺(r,p) obtained by subtracting the sum of cusps over ∞ on X₀(r) from the sum over 0, each with coefficient one. Prove that [D] has exact order p in its Jacobian. Prove also that the rational 0-to-i∞ winding class e on X₀(rp²)/w_(p²) is r-new and is not p-old; consequently its projection e_B to the full new quotient is nonzero. (darmon-merel, Proposition 6.5 and Proposition 7.2, author-version pp.18,21–22, darmon-merel lines 525–550, 670–697; five-level extension: lemos-2017, Theorem 3.4 sketch, p.10, lemos-2017 line 355.)

A proof route chooses a coordinate t on the genus-zero X₀(r) with divisor [0]−[∞]. On the mixed curve div(t)=pD. If D were principal, t would be a pth power up to a complex constant. The connected full-p-level cover over X₀(r) has group PSL₂(𝔽_p); the resulting cyclic degree-p subcover would contradict its lack of a quotient of order p, since p≥11. This argument uses genus zero and coprimality and therefore works at all five r. The w_r action gives −e and the forgetful map to X₀(p²)/w_(p²) kills e; hence both r-degeneracy images vanish. If e were p-old, §5.10 would kill its Cartan image, whereas the Abel–Jacobi denominator has order p by [D]≠0. For the oriented path the boundary maps to −D, which has the same order.

**Checks.**

- At r=5,p=11 the base has genus zero and two rational cusps; div(t)=11D gives 11[D]=0, and PSL₂(𝔽₁₁), of order 660, has no cyclic quotient of order 11, so [D]≠0.
- At r=7,p=17 and r=13,p=17 the same two cusps give 17[D]=0 and [D]≠0; the argument does not assume r≤3.
- Reversing the winding path changes −D to D, so the denominator is p in either direction. At the excluded pair r=2,p=3 the mixed curve has genus zero and [D]=0; PSL₂(𝔽₃)≅A₄ has a quotient of order 3, so the exact-order proof cannot extend there.

*Needs:* ModularSymbolsPadicLFunctions §0.8 for rationality of the winding class and §§0.6–0.7 for duality; ModularCurvesPartII §§3.8, 5.2, 9.6 and 13.1–13.3 for the mixed curves, level covers and divisor classes; Layer 5.10 The Cartan correspondence kills the p-old part; ModularForms Layer 6 for the two Atkin–Lehner actions and Layer 10 for the genus-zero cases.

### 5.13 The nonzero finite winding quotient

For r∈{2,3,5,7,13}, prime p outside that set, Jac(X0,ns^+(r,p)) has a nonzero optimal quotient A/ℚ with A(ℚ) finite and kernel stable under every T_n with (n,p)=1. (lemos-2017, Theorem 3.4 and sketch, p.10; Darmon–Merel Proposition 7.1, lemos-2017 line 355.)

Throughout this subsection, r∈{2,3,5,7,13}; p is prime outside that set; use the actual Cartan fibre-product Jacobian.

A proof route is as follows. Take the connected-kernel quotient by the integral Hecke annihilator of the full-new winding class. Nonvanishing gives positive dimension and the period comparison gives nonzero central values for every surviving factor. The modular-rank-zero contract makes their rational groups finite. Transfer through the prime-to-p Hecke-equivariant Chen isogeny and take the optimal quotient.

A(ℚ) finite refers to this nonzero quotient, with positive dimension; the exact modular-rank-zero contract supplies finiteness for its possibly higher-dimensional factors.

*Needs:* Layer 5.12 Nonvanishing of the new winding class; Layer 5.11 The winding class selects exactly nonvanishing central periods; ModularCurvesPartII §§16.2–16.6; ModularCurvesPartII §§9.1, 13.1–13.3; EulerSystemsAndKolyvaginSystems §5.13 and the modular rank-zero contract.

### 5.14 The cusp residue-field constraint

For the Cartan fibre-product curve X0,ns^+(r,p), every cusp has residue field ℚ(ζ_p)^+. At a prime q∤rp, a rational noncuspidal point with v_q(j)<0 specializes to a cusp, and an F_q-rational cusp exists only if q≡±1 mod p. (lemos-2017, §3, concluding formal-immersion argument, p.10; Darmon–Merel §8, lemos-2017 line 377.)

Throughout this subsection, r∈{2,3,5,7,13}; p is prime outside that set; q∤rp is prime; for the specialization assertion, P is a rational noncuspidal point and v_q(j(P))<0.

A proof route is as follows. Use the level-moduli cusp description and its real-cyclotomic Galois action. A rational section reducing to a cusp forces Frobenius to act trivially on its residue field; the real-cyclotomic condition is q≡±1. The pole divisor of the j-map is supported exactly on cusps; use the smooth cusp chart at q∤rp.

This statement is restricted to q∤rp. The local potentially-multiplicative lemma establishes that restriction before this statement is used.

*Needs:* the mixed cusp-chart contract; ModularCurvesPartII §§3.8, 5.2, 9.5–9.7; ModularCurvesPartII §§13.1–13.3; ModularCurvesPartII §§10.1–10.3; EllipticCurves Layer 4.

### 5.15 Formal immersion into the winding quotient at a cusp

For r∈{2,3,5,7,13}, prime p outside that set and prime q≡±1 mod p, let A be the specified finite winding quotient. The map φ:P↦[P−∞] followed by the quotient to A, extended to the smooth integral model at q, is a formal immersion at the cusp infinity. (darmon-merel, Lemma 8.2, author-version pp.23–24; Lemos §3 conclusion, darmon-merel line 737.)

Throughout this subsection, r∈{2,3,5,7,13}; p is prime outside that set; q is prime with q≡±1 mod p; A is the quotient specified in §5.13; choose infinity over ℚ(ζ_p)^+ and the smooth integral model at q.

A proof route is as follows. For prime p outside the five levels, p≥11 and q≡±1 forces q≥2p−1≥21>r,3. Use the smooth cusp chart and cotangent injection for the specified quotient. Vanishing of the cotangent map would, by Hecke stability, force support only at indices divisible by p; the positive-characteristic support contract descends it to level r, whose weight-two cusp space has dimension zero.

Hecke stability of the quotient and the cotangent injection are indispensable. The inequality q≥2p−1>r,3 places every prime in this statement in the same smooth, prime-to-level characteristic range.

*Needs:* the mixed cusp-chart contract; Layer 5.13 The nonzero finite winding quotient; ModularCurvesPartII §§4.1–4.2, 4.8, 13.1–13.3, 14.15, 17.3; AlgebraicModularFormsAndSerreWeights §§2.1–2.2 and 2.8; ModularForms Layer 10; the positive-characteristic support contract; the Chen winding comparison contract.

### 5.16 The rational modular point has torsion quotient image

For a rational point P on X0,ns^+(r,p) and a cusp infinity over K=ℚ(ζ_p)^+, its image φ(P) in A(K) is torsion. (darmon-merel, Lemma 8.3, author-version p.24, darmon-merel line 770.)

Throughout this subsection, r∈{2,3,5,7,13}; p is prime outside that set; A is the specified quotient with A(ℚ) finite; P is a rational point of X0,ns^+(r,p); infinity is a cusp over K=ℚ(ζ_p)^+; φ(P) is the Abel–Jacobi image in A(K).

A proof route is as follows. For σ∈Gal(K/ℚ), (σ−1)[P−∞] is a cuspidal divisor and has torsion class by the geometric cuspidal-divisor torsion theorem of EisensteinIdealAndRationalTorsion §7.9, applied to each individual difference [∞−σ∞] and to its image in A. A common positive annihilator n for these finitely many classes makes nφ(P) Galois fixed and hence rational. If m is the exponent of A(ℚ), then mnφ(P)=0.

A(ℚ) finite does not directly imply A(K) finite; the cuspidal Galois argument is required.

**Checks.**

- If all individual cusp differences are killed by n=5 and A(ℚ) has exponent m=7, then 5φ(P) is rational and 35φ(P)=0. The bound concerns this image, not every element of A(K).
- For σ fixing P, σ[P−∞]−[P−∞]=[∞−σ∞]. Reversing this difference negates the class and preserves its annihilator, agreeing with the path conventions of §5.12.
- On X₀(1)=ℙ¹ every degree-zero divisor class is zero, of order one, and D=0 has order one on every curve: the imported theorem asserts torsion, not nonzero torsion, so n=1 is admissible.
- In ℝ/ℤ, a=√2 and b=1/11−√2 have a+b=1/11, killed by 11, although neither a nor b is torsion. The exact order p of the sum of all cusp differences in §5.12 cannot replace torsion of each individual difference [∞−σ∞], which is what the imported theorem supplies.
- If infinity is rational, each difference is zero, so n=1 suffices and mφ(P)=0; if also m=1 then φ(P)=0.

*Needs:* EisensteinIdealAndRationalTorsion §7.9 for geometric cuspidal-divisor torsion; Layer 5.13 The nonzero finite winding quotient; ModularCurvesPartII §§9.1, 13.1–13.3; ModularCurvesPartII §§3.8, 5.2, 9.5–9.7; ModularSymbolsPadicLFunctions §§0.6–0.8.

### 5.16a Moving the specialization cusp to infinity

For r∈{2,3,5,7,13}, prime p outside that set, a prime q∤rp and a rational noncuspidal point P of X₀,ns⁺(r,p) that specializes at a prime above q to a cusp c, prove that there are an isomorphism α:X₀,ns⁺(r,p)→X₀,ns⁺(r,p)′ over ℚ, given by a change of the nonsplit Cartan subgroup (conjugation in GL₂(𝔽_p)) composed if necessary with w_r, and the corresponding fibre-product curve with its own choice of cusp ∞, such that α(P) is a rational noncuspidal point specializing to ∞ at the same prime. Prove that α commutes with the Hecke correspondences T_n for n prime to rp, carries the full-new winding quotient, its Hecke annihilator and the specified quotient A of §5.13 to the corresponding objects, and carries the integral cusp charts at q to each other. The elliptic curve underlying α(P) is E or its quotient by the rational r-isogeny kernel, so its j-invariant has a denominator at q exactly when j(E) does. (darmon-merel, §8, proof of Theorem 8.1, author-version p.22, darmon-merel lines 716–725.)

A proof route is as follows. The cusps of X_ns⁺(p)=N(C)\X(p) are the double cosets N(C)\GL₂(𝔽_p)/B̄, where B̄ is the stabilizer of the cusp ∞ of the full-level curve X(p) over ℚ; a cusp represented by g is the image of g∞. The element g⁻¹ acts on the full-level moduli problem over ℚ and so induces an isomorphism over ℚ from N(C)\X(p) to N(g⁻¹Cg)\X(p), carrying the cusp represented by g to the cusp ∞ of the target curve; the target is again a nonsplit Cartan normalizer curve, geometrically connected because det N(g⁻¹Cg)=𝔽_p^×. The (p−1)/2 cusps are not in bijection with the nonsplit Cartan subgroups, which number p(p−1)/2. Galois conjugation over ℚ(ζ_p)⁺ moves cusps only within the fibre lying over one cusp of X₀(r); w_r exchanges the fibres over 0 and ∞. The Hecke statements follow from commutation of these operators with T_n for (n,rp)=1 and from w_r(e)=−e (§5.12), which preserves the annihilator. The j-statement uses isogeny invariance of potentially multiplicative reduction (NeronModelsAndSemistableAbelianVarieties §5.2).

**Checks.**

- At r=5, p=11 the curve has 2·(11−1)/2=10 geometric cusps, five over each of the two cusps of X₀(5), each fibre conjugate over ℚ(ζ₁₁)⁺ of degree five. A cusp over 0 cannot be moved to the fibre over ∞ by Galois conjugation or by a change of Cartan; w₅ is needed.
- At p=11, GL₂(𝔽₁₁) has order 13200 and N(C) order 240, so there are 55 nonsplit Cartan subgroups, while X_ns⁺(11) has 5 cusps; each cusp is nevertheless carried to ∞ by one change of Cartan.
- At q=23≡1 mod 11 every cusp is 𝔽₂₃-rational, so a denominator point can reduce to a cusp in either fibre; §5.14 alone does not decide which.
- Without the transport, the base-point map φ_∞ sends P to a class reducing to π[c−∞], a torsion cuspidal class by EisensteinIdealAndRationalTorsion §7.9 that need not vanish: by §5.12 the class of the difference of the two fibres has exact order p. The transported map specializes α(P) to φ(∞)=0 by construction.

*Needs:* ModularCurvesPartII §§3.8, 5.2, 9.5–9.7 for the Cartan curves, their moduli and cusps; ModularCurvesPartII §§13.1–13.3 for Hecke correspondences; ModularForms Layer 6 for w_r; the mixed cusp-chart contract; Layer 5.12 Nonvanishing of the new winding class; Layer 5.13 The nonzero finite winding quotient; NeronModelsAndSemistableAbelianVarieties §5.2.

### 5.17 Formal immersion excludes every denominator away from p

For r∈{2,3,5,7,13}, prime p outside that set, and E/ℚ with a rational r-isogeny and residual image contained in a non-split Cartan normalizer, j(E) lies in ℤ[1/p]. (lemos-2017, Theorem 1.4 and §3 concluding proof, pp.3,10, lemos-2017 line 107.)

Throughout this subsection, E/ℚ admits a rational r-isogeny with r∈{2,3,5,7,13}; p is prime outside that set; the image of E[p] is contained in a non-split Cartan normalizer.

A proof route is as follows. A denominator prime q≠p gives potentially multiplicative reduction. Apply §5.9 to get q≡±1 mod p. Since p≥11, an odd prime q≡±1 satisfies q≥2p−1>r,3. Now §5.14 applies on the smooth cusp model: P specializes to some cusp c at a prime above q. By §5.16a replace P by α(P), which is noncuspidal, specializes to ∞ and still has a denominator at q; write P for it. The real-cyclotomic field is unramified at q and A has good reduction there; torsion specialization is injective for e=1<q−1. Since P specializes to ∞, φ(P) reduces to φ(∞)=0, and §5.16 makes φ(P) torsion, so φ(P)=0. Formal immersion at the common reduction point forces the two sections to coincide, so the noncuspidal point would be the cusp, a contradiction.

The same denominator exclusion holds throughout the stated range p∉{2,3,5,7,13}: its possible denominator primes satisfy the required characteristic bound.

*Needs:* Layer 5.14 The cusp residue-field constraint; Layer 5.15 Formal immersion into the winding quotient at a cusp; Layer 5.16 The rational modular point has torsion quotient image; Layer 5.16a Moving the specialization cusp to infinity; ModularCurvesPartII §§13.1–13.3, 17.3; NeronModelsAndSemistableAbelianVarieties §§5.3h, 6.4d; Layer 5.9 Potentially multiplicative primes under a non-split image.

### 5.18 A proper residual image forces integral j

For geometrically non-CM E/ℚ with a rational r-isogeny, r∈{2,3,5,7,13}, and prime p>37, a proper mod-p image forces j(E)∈ℤ. Prove the source’s more general `cyclic_isogeny_integral_j`: whenever p is prime outside {2,3,5,7,13} and `NonsplitNormalizerImage E p` holds, a rational cyclic r-isogeny for r in this set forces j(E)∈ℤ, without a non-CM hypothesis. The same integral cusp argument applies since p≥11 gives q≥2p−1>r,3. (lemos-2017, Proposition 2.1 and proof, pp.4–5, lemos-2017 line 136.)

Throughout this subsection, E/ℚ is non-CM and admits a rational r-isogeny with r∈{2,3,5,7,13}; p>37 is prime; the mod-p image is proper.

A proof route is as follows. Use §5.8 and §5.17 to obtain integrality away from p. Use §5.9 at p: potential good reduction makes v_p(j)≥0.

Potential good reduction is enough for integral j; actual good reduction is unnecessary.

*Needs:* Layer 5.8 Every remaining proper image is in a non-split Cartan normalizer; Layer 5.17 Formal immersion excludes every denominator away from p; Layer 5.9 Potentially multiplicative primes under a non-split image; EllipticCurves Layer 4.

### 5.19 The five genus-zero j-numerators

Define lemosNumerator(r) in ℤ[X] by the five formulas: r=2:(X+16)³; r=3:(X+27)(X+3)³; r=5:(X²+10X+5)³; r=7:(X²+5X+1)³(X²+13X+49); r=13:(X⁴+7X³+20X²+19X+1)³(X²+5X+13). At every other r set it to zero. (lemos-2017, §2, j-map table, p.6, lemos-2017 line 231.)

Throughout this subsection, r is a natural number; the polynomial-table definition is total and has modular interpretation only at r∈{2,3,5,7,13}.

Its API includes the following facts.

- For the five levels the polynomial is exactly the displayed formula.
- For r∈{2,3,5,7,13}, lemosNumerator(r) is monic of degree r+1.
- The five constant terms are 4096,729,125,49,13 respectively.
- Outside {2,3,5,7,13}, lemosNumerator(r)=0.

**Checks.**

- lemosNumerator(2)(0)=4096. A rescaling of the coordinate changes the constant.
- lemosNumerator(7) has degree 8 and constant term 49. The final quadratic factor is not cubed.
- lemosNumerator(13) has degree 14 and constant term 13. The quartic factor is the cubed factor.
- lemosNumerator(11)=0: the genus-one level does not use a genus-zero formula. This is a totalization, with no modular coordinate interpretation.
- The degree at r=13 is 14 and its constant term is 13; cubing the degree-two factor instead changes both constraints.

A proof route is as follows. Use the displayed integer polynomial table. The actual modular coordinate and its j-map identity are the separate target of the next subsection.

The polynomial has degree r+1, not r, and a nonzero constant term at exactly the five intended levels.

*Needs:* native rational arithmetic and finite products.

### 5.20 The modular meaning of the five j-polynomials

For r∈{2,3,5,7,13}, identify X0(r) with P1_Q in the specified coordinate, sending the two cusps to t=0 and t=infinity. On the noncuspidal open t∈ℚ×, the actual j-map is lemosNumerator(r)(t)/t. (lemos-2017, §2, table and references [3] pp.179–180, [7] p.54, p.6, lemos-2017 line 231.)

Throughout this subsection, r∈{2,3,5,7,13}; t∈ℚ×; use the source coordinate on the actual X0(r), with cusps at 0 and infinity.

A proof route is as follows. Identify the coordinate by its two cusp pole orders and its normalized q-expansion; compare that modular function with the displayed rational function using exact coefficient recognition. The chosen coordinate includes the identification of both cusps, so rescaling t is not allowed without changing the polynomial.

An integer polynomial with correct degree is not enough to identify the modular function.

*Needs:* Layer 5.19 The five genus-zero j-numerators; ModularCurvesPartII §§5.2, 5.5; ModularCurvesPartII §§3.8, 5.2, 9.5–9.7; ModularForms Layers 1 and 10.

### 5.21 Integral j forces a signed constant-term divisor

For r∈{2,3,5,7,13} and t∈ℚ×, if lemosNumerator(r)(t)/t is an integer, then t is a nonzero integer dividing lemosNumerator(r)(0). (lemos-2017, §2, denominator and constant-term calculation, pp.6–7, lemos-2017 line 243.)

Throughout this subsection, r∈{2,3,5,7,13}; t∈ℚ×; lemosNumerator(r)(t)/t∈ℤ.

A proof route is as follows. For the general monic polynomial f∈ℤ[T] of degree d≥2, write t=a/b with b>0 and coprime a,b. The homogenized numerator is a^d+bG(a,b), coprime to b. Integrality of its quotient by a b^(d−1) forces b=1. Then f(a)≡f(0) modulo a gives a∣f(0). Apply this theorem to the five polynomials. The degree condition is necessary: f(T)=T and t=1/2 give f(t)/t=1 with nonintegral t. The value t=0 is excluded since it is a cusp; the total quotient value 0 at a zero denominator has no modular meaning.

Use monicity and t≠0. The conclusion is a signed divisor, so negative parameters must be retained.

*Needs:* Layer 5.19 The five genus-zero j-numerators.

### 5.22 The finite integral j-candidate sets

Define lemosIntegralJ(r) as the finite set of integers lemosNumerator(r)(t)/t for all signed nonzero divisors t of the polynomial’s constant term; use the exact integer quotient, and the empty set outside the five levels. (lemos-2017, §2, five finite sets, p.7, lemos-2017 line 249.)

Throughout this subsection, r is a natural number; use the native finite set of signed nonzero integer divisors of the absolute constant term.

Its API includes the following facts.

- j belongs iff r∈{2,3,5,7,13} and there is a nonzero signed divisor t of the constant term with j equal to the exact quotient f(t)/t.
- For r outside {2,3,5,7,13}, lemosIntegralJ(r) is empty.
- The cardinalities at 2,3,5,7,13 are 25,13,8,6,4.

**Checks.**

- lemosIntegralJ(2) has 25 elements and contains 0 and 1728. Repeated divisor images are counted once.
- lemosIntegralJ(5) has 8 elements and contains 64. Negative divisors contribute values that positive divisors miss.
- lemosIntegralJ(13)={−64·9·4079³,576,4096·27·19,4096·27·19·991³}. All four signed divisors are present.
- lemosIntegralJ(11) is empty; its separate finite j-table is used instead. The genus-one case uses a distinct point table.
- At r=2 there are 26 signed divisors of 4096 but only 25 j-values: t=8 and t=−64 both give 1728; the set must remove repetitions.

A proof route is as follows. Take the image of both signs of the positive divisors of the nonzero absolute constant term under the exact quotient f(t)/t. Divisibility of f(t) by t follows from f(t)≡f(0) modulo t. Outside the five levels the set is empty.

The exact set has repeated-value collisions: count image values, not signed parameters.

*Needs:* Layer 5.19 The five genus-zero j-numerators.

### 5.23 Integral j-values are the finite divisor candidates

For r∈{2,3,5,7,13} and j∈ℤ, j∈lemosIntegralJ(r) if and only if there is a noncuspidal rational point P of the actual X0(r) with j(P)=j. (lemos-2017, §2, denominator and signed-divisor argument, pp.6–7, lemos-2017 line 231.)

Throughout this subsection, r∈{2,3,5,7,13}; j is an integer; the j-map and rational points use the actual modular curve X0(r).

A proof route is as follows. For a candidate choose its signed nonzero divisor t. Polynomial evaluation is divisible by t; the genus-zero coordinate gives a noncuspidal rational point with that exact j-value. Conversely, take the nonzero rational coordinate t of a point with integral j. Section 5.21 makes t a signed nonzero divisor of the constant term, giving membership.

Use both signs of every nonzero divisor and identify image values, allowing collisions. This statement is geometric; the finite-set definition and its cardinality tests alone do not prove it.

*Needs:* Layer 5.22 The finite integral j-candidate sets; Layer 5.20 The modular meaning of the five j-polynomials; Layer 5.21 Integral j forces a signed constant-term divisor.

### 5.24 Surjectivity is invariant under quadratic twist

For prime p≥5 and quadratic-twist elliptic curves E,E′ over ℚ, their mod-p representations are surjective simultaneously. (lemos-2017, §2, paragraph following the S11,S17,S37 lists, p.5, lemos-2017 line 204.)

Throughout this subsection, p≥5 is prime; E,E′/ℚ are quadratic twists of elliptic curves.

A proof route is as follows. Write ρ′=ψρ with ψ valued in {±1}. If ψ is nontrivial on kerρ, the twisted image contains −I and covers GL₂. Otherwise ψ factors through GL₂(F_p); every quadratic character factors through the determinant, and g↦ψ(g)g is an involutive automorphism because det(−g)=det(g). Apply the same argument to the inverse twist.

The statement does not claim all mod-p subgroup labels remain identical under a twist.

*Needs:* ArithmeticGaloisRepresentations §§4.2–4.5; ArithmeticGaloisRepresentations §§6.1–6.4; EllipticCurves Layer 5.

### 5.25 The finite j-table at prime degrees 11,17,37

For r=11,17,37 the possible rational noncuspidal j-values are respectively {−11·131³,−2^15,−11²}, {−17²·101³/2,−17·373³/2^17}, and {−7·137³·2083³,−7·11³}. Among these seven values, −2^15 is the only geometric CM value. (lemos-2017, §2, S11,S17,S37 and CM observation, pp.5–6, lemos-2017 line 193.)

Throughout this subsection, r∈{11,17,37}; consider noncuspidal rational points of X0(r) and geometric CM.

A proof route is as follows. At levels 11 and 17 prove rank zero by elliptic descent and the complete torsion group by reduction and rational cusp/point coordinates, as in §4.9. At level 37 exhibit a nonzero rank-zero new quotient using a factor with nonzero central value, obtain its finite rational group through the modular rank-zero contract and descent, and determine all rational fibers of X₀(37)→A₃₇. This last finite-fiber determination is a target here; formal immersion is used only on cusp disks. Evaluate the actual j-maps, preserving the rational denominators at r=17 (mazur-1978, Theorem 7.1 and introduction’s point table, pp.129–130,153, mazur-1978 lines 14–30, 993–998). Identify CM using exact class polynomials and geometric endomorphisms. The rational-point exhaustion uses the explicit point-set theorem, without a rank-zero assertion for the entire Jacobian of X₀(37).

There are six non-CM values after excluding −2^15; a Jacobian rank assertion alone proves no exact point table.

*Needs:* Layer 4.7 Mazur’s rational prime-isogeny theorem; ModularCurvesPartII §§5.2, 5.5; ComplexMultiplicationAndExplicitReciprocity §3.1 and §5.1; EllipticCurves Layers 6–7; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.15, 1.18–1.19; ModularCurvesPartII §§13.1–13.3, 16.2–16.6, 17.3; EisensteinIdealAndRationalTorsion §7.9; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; the modular rank-zero contract.

### 5.25a A witness bound for nonsurjective primes

Let E/ℚ be geometrically non-CM with set S of primes of bad reduction. For a prime p≥17 with `NonsplitNormalizerImage E p`, let C be the nonsplit Cartan subgroup and ε_p:G_ℚ→N(C)/C≅{±1} the induced quadratic character. Prove: (i) ε_p is nontrivial and odd, and unramified at every prime outside S, including p; (ii) for every prime q∉S∪{p} with ε_p(Frob_q)=−1, p divides a_q(E). Then for every odd quadratic character ε unramified outside S there is a prime q_ε∉S with ε(Frob_(q_ε))=−1 and a_(q_ε)(E)≠0. For any such choice put B(E)=max_ε max(q_ε,|a_(q_ε)(E)|), the maximum over the finitely many odd quadratic characters unramified outside S (and B(E)=1 if there are none). Prove that every prime p≥17 with `NonsplitNormalizerImage E p` satisfies p≤B(E), and hence, with §5.8, every prime p>37 at which E[p] is not surjective satisfies p≤B(E). (serre-1981, §8.4, proof of Lemme 19, printed pp.398–399 / archive pp.198–199, serre-1981 lines 2569–2594; the unconditional part used here is the character and trace argument, not the GRH bound for q_ε.)

A proof route is as follows. Complex conjugation has eigenvalues 1 and −1 on E[p], whereas an element of C with both eigenvalues in 𝔽_p is scalar; so it lies outside C and ε_p is odd. At q∉S∪{p} the representation is unramified. At p, Lemos's Proposition 2.2 (§5.9) gives potentially good reduction with ramification index e∈{1,2,3,4,6}, so inertia acts through a cyclic tame quotient. An element of N(C)∖C has square in 𝔽_p^×, hence order dividing 2(p−1), and an element of N(C) with both eigenvalues in 𝔽_p has eigenvalue ratio ±1. In the level-one case the eigenvalue ratio is χ_pψ^(−2) with ψ of order dividing e, of order greater than two once p∉{3,7}; in the level-two case the inertia image has order at least (p²−1)/6>2(p−1) for p>11, so its generator lies in C. Thus for p≥17 the inertia image lies in C and ε_p is unramified at p. If ε_p(Frob_q)=−1, ρ(Frob_q) lies in N(C)∖C, whose elements have trace zero, so a_q(E)≡0 mod p. For the witnesses: if a_q(E)=0 at every good q with ε(Frob_q)=−1, then E and its twist E^ε have equal traces at all good primes and are ℚ-isogenous by FaltingsFinitenessAndIsogenyTheorems §R28.4.7; composing with the twisting isomorphism over the quadratic field of ε gives an endomorphism that Galois conjugation negates, contradicting geometric non-CM. Finally, if p is a nonsplit prime, ε_p is one of the characters ε, and either p=q_ε or p divides the nonzero integer a_(q_ε)(E); in both cases p≤B(E).

**Checks.**

- For E₁₁: y²+y=x³−x²−10x−20, S={11}; the only odd quadratic character unramified outside 11 is that of ℚ(√−11), and 2 is inert there since −11≡5 mod 8. Counting gives #E₁₁(𝔽₂)=5, so a₂=−2≠0 and B(E₁₁)=2: E₁₁ has no prime p≥17 with nonsplit-normalizer image, consistent with its nonintegral j and §5.18.
- For the CM curve y²=x³−x and ε the character of ℚ(i), every good q with ε(Frob_q)=−1 is ≡3 mod 4 and has a_q=0, so no witness exists; indeed the image at every p≡3 mod 4 lies in a nonsplit normalizer. The non-CM hypothesis is essential.
- The lower bound p≥17 is used at p itself: at p=7 a potentially ordinary curve with e=3 can have eigenvalue ratio χ₇ψ^(−2) with ψ=χ₇² of order three; this ratio is χ₇³, of order two, so the inertia argument gives nothing there. At p=11 an element of the order-120 nonsplit Cartan with eigenvalues in 𝔽₁₁ is a scalar, and complex conjugation has eigenvalues 1 and −1; an even character, such as that of ℚ(√5), can therefore never be ε_p, and a zero trace a_q=0 would give the empty condition p|0, which is why the witness must have a_q≠0.

*Needs:* Layer 5.0 Geometric endomorphisms and nonsplit image containment; Layer 5.2 Serre’s projective inertia bound; Layer 5.8 Every remaining proper image is in a non-split Cartan normalizer; Layer 5.9 Potentially multiplicative primes under a non-split image; ArithmeticGaloisRepresentations §§2.3–2.4, 4.2–4.5, 5.1, 6.1–6.4; FaltingsFinitenessAndIsogenyTheorems §R28.4.7; EllipticCurves Layers 4–5.

### 5.26 Residual-image theorems for the six large-isogeny j-values

For each of the six non-CM j-values in §5.25, every E/ℚ with that j-value has surjective mod-p representation for every prime p>37. (lemos-2017, §2, LMFDB check of the seven j-values, pp.5–6, lemos-2017 line 204.)

Throughout this subsection, j is one of the six non-CM values in §5.25; E/ℚ has j(E)=j; p>37 is prime.

A proof route is as follows. For one rational model E of each of the six non-CM j-values, apply §5.25a: every nonsurjective prime p>37 is a nonsplit prime with p≤B(E). For each of the finitely many primes 37<p≤B(E) and each odd quadratic character ε unramified outside S, exhibit a good prime q≠p with ε(Frob_q)=−1 and p∤a_q(E); this shows ε_p≠ε for every ε, so p is surjective. Transport the resulting theorem to all curves with that j by quadratic twisting.

A finite set of sampled Frobenius traces cannot by itself certify all p>37.

*Needs:* Layer 5.25 The finite j-table at prime degrees 11,17,37; Layer 5.25a A witness bound for nonsurjective primes; Layer 5.24 Surjectivity is invariant under quadratic twist; ArithmeticGaloisRepresentations §§4.2–4.5; ArithmeticGaloisRepresentations §§6.1–6.4.

### 5.27 Residual-image theorems for the integral j-lists

For each non-CM integer j in the union of lemosIntegralJ(r) over r∈{2,3,5,7,13}, every E/ℚ with that j-value is surjective mod p for every prime p>37. (lemos-2017, §2, final LMFDB check, p.7, lemos-2017 line 261.)

Throughout this subsection, r∈{2,3,5,7,13}; j∈lemosIntegralJ(r) is non-CM; E/ℚ has j(E)=j; p>37 is prime.

A proof route is as follows. For one rational model E of every non-CM integer j in the five finite sets, apply §5.25a to bound every nonsurjective prime p>37 by B(E), and exclude each remaining prime 37<p≤B(E) by a good prime q≠p with ε(Frob_q)=−1 and p∤a_q(E) for every odd quadratic character ε unramified outside the bad primes of E. Distinguish CM by geometric endomorphisms. Quadratic twisting then gives the theorem for every rational model with that j.

The original five set sizes do not imply how many distinct non-CM twist classes remain after intersections.

*Needs:* Layer 5.22 The finite integral j-candidate sets; Layer 5.25a A witness bound for nonsurjective primes; Layer 5.24 Surjectivity is invariant under quadratic twist; ArithmeticGaloisRepresentations §§4.2–4.5; ArithmeticGaloisRepresentations §§6.1–6.4; ComplexMultiplicationAndExplicitReciprocity §§5.1–5.5.

### 5.28 Lemos’s rational cyclic-isogeny surjectivity theorem

Prove `lemos_uniform_surjectivity`. Let E/ℚ satisfy End_(Qbar)(E)=ℤ and admit a rational cyclic isogeny of degree greater than one. Then for every prime p>37 the actual mod-p Galois representation E[p] has image GL₂(F_p). (lemos-2017, Theorem 1.1 and complete §2 proof, pp.2,4–7, lemos-2017 line 44.)

Throughout this subsection, E/ℚ is elliptic with End_(Qbar)(E)=ℤ; E admits a rational cyclic isogeny of degree greater than one; p>37 is prime.

A proof route is as follows. Use §5.1 to select a rational prime isogeny degree r∈{2,3,5,7,11,13,17,37}. For r∈{11,17,37}, apply §§5.25–5.26. For the five genus-zero degrees, a proper image would force integral j by §5.18. The exact modular parameter theorem puts j in lemosIntegralJ(r), and §5.27 rules out the proper image.

The identity isogeny does not qualify. No statement about non-CM curves without a nontrivial rational cyclic isogeny is exported.

*Needs:* Layer 5.1 The CM prime-isogeny exceptions; Layer 5.18 A proper residual image forces integral j; Layer 5.22 The finite integral j-candidate sets; Layer 5.26 Residual-image theorems for the six large-isogeny j-values; Layer 5.27 Residual-image theorems for the integral j-lists; Layer 5.23 Integral j-values are the finite divisor candidates.

### Examples

At residual p=11 and local q=3, a quadratic Tate twist has squared diagonal eigenvalues 9 and 1. A nonsplit conjugate pair with one eigenvalue 1 would have both equal to 1, so these are excluded; for q=43≡−1 the squared pair is 1,1 and the obstruction vanishes. At p=41, Serre’s inertia order bound is (41−1)/4=10>5, excluding A₄,S₄,A₅. At p=11 a nonsplit normalizer has order 240, while the full group has order 13200; its involution exchanges the two conjugate eigenvalues, rather than fixing two rational eigenlines. The genus-zero coordinate has t=−16 at r=2 giving j=0, and t=8 or −64 giving j=1728. At r=5, t=−1 gives j=64. At r=13 the four signed divisors give exactly the four displayed integer j-values. The winding differential f=t+2t²+O(t³) has cotangent w dt, not a₀dt=0; reversing the path reverses the period sign but not its nonvanishing. A degree-p degeneracy map sends a degree-one divisor by pullback to degree p, while degree zero remains zero. The rank-zero quotient is essential: finiteness is not inferred for the entire Jacobian of X₀(37). At r=43 the point exhaustion gives j=−884736000, beyond the fact that 43 is an allowed degree. For the cusp descent, n=5 and m=7 give 35φ(P)=0; the exact order p of the sum D supplies no annihilator for its individual summands.

### Dependencies

Layer 4; EllipticCurves Layers 1–5; ArithmeticGaloisRepresentations §§2.3–2.4,4.2–4.5,6.1–6.4; ModularCurvesPartII §§9.5–9.7,13.1–13.3,14.11–14.12,16.2–16.6; EisensteinIdealAndRationalTorsion §7.9; ModularSymbolsPadicLFunctions §§0.6–0.8,1.1–1.2; ComplexMultiplicationAndExplicitReciprocity §§3.1,5.1–5.5; ImaginaryQuadraticClassNumber H3.2, H3.5–H3.6; ArakelovGeometryAndAbelianHeights §§4.4,5.9; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7; EulerSystemsAndKolyvaginSystems §§4.7,5.13; the mixed cusp-chart contract, the Chen winding comparison contract, the positive-characteristic support contract, the modular rank-zero contract and the quantitative abelian periods contract; the exceptional-prime point-exhaustion, mixed-boundary and split-height targets; and the full-torsion specialization theorem of HeightsRationalPointsAndObstructions §1.18. Each finite image theorem includes an exhaustive all-primes bound.

## Downstream consumers

The contract “Required effective modular comparisons” EC.0–EC.5 of ErdosProgressionPowers, used in its Layers 1–6, consists of Martin’s sharp newspace bound, the removed-prime exponent bound, the Kraus thresholds with their realization, the two uniform irreducibility bounds and the p>37 surjectivity theorem for a non-CM curve with a rational cyclic isogeny: these are the theorems of Layers 0–5 here, with the same hypotheses. ErdosProgressionPowers cites EllipticCurveModularityPartII, which plans the same six results under its own layer numbering, as the supplier of EC.0–EC.5. Arithmetic applications with a rational cyclic isogeny use the all-primes p>37 surjectivity conclusion with geometric non-CM retained. Neither application supplies modularity, irreducibility or a conductor identity by definition.

## References

The source identifiers used in the layer locators are the bold keys below. Page and theorem numbering refers to the editions specified here; a line locator refers to the numbered text of that edition.

- **martin-2003.** Greg Martin, [Dimensions of the Spaces of Cusp Forms and Newforms on Γ₀(N) and Γ₁(N)](https://arxiv.org/pdf/math/0306128v1), arXiv math/0306128v1 (2003). Definitions 1A–1F and Theorems 1–2, pp.2–3; §2, pp.7–9; §4, pp.14–16. The journal edition is J. Number Theory 112 (2005), 298–331; the locators here use v1.
- **bennett-siksek-2020.** Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Annals of Mathematics 191 (2020), 355–392. Equation (3), Theorem 3 and Lemmas 2.1–2.2, pp.358–359; the larger threshold majorants and Theorem 4, p.360; irreducibility applications, pp.361–363.
- **kraus-1997.** Alain Kraus, [Majorations effectives pour l’équation de Fermat généralisée](https://doi.org/10.4153/CJM-1997-056-2), Canadian Journal of Mathematics 49 (1997), 1139–1161. §3.1–3.3, equations (7)–(9), Theorems 3–4 and Lemma 1, pp.1143–1146; Appendix II, Propositions 1–2 and corollary, pp.1158–1160.
- **mazur-1978.** Barry Mazur, with an appendix by Dorian Goldfeld, [Rational isogenies of prime degree](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), Inventiones Mathematicae 44 (1978), 129–162. Theorem 1 and table, pp.129–130; §5, character analysis; §7, Theorem 7.1, pp.153–155.
- **mazur-1977.** Barry Mazur, [Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), Publications Mathématiques IHÉS 47 (1977), 33–186. Introduction, Theorems 4 and 6, pp.34–35; point table p.40, column definitions p.41.
- **lemos-2017.** Pedro Lemos, [Serre’s uniformity conjecture for elliptic curves with rational cyclic isogenies](https://arxiv.org/pdf/1702.01985v2), arXiv:1702.01985v2 (2017). Theorem 1.1, p.2; Theorem 1.4, p.3; Proposition 2.1, p.4; Proposition 2.2, pp.4–5; Theorem 2.3, p.6; §2 tables, pp.5–7; §3, Lemma 3.2 and Theorems 3.3–3.4, pp.8–10. The journal edition is Trans. AMS 371 (2019), 137–146; no journal-numbering claim is made here.
- **darmon-merel.** Henri Darmon and Loïc Merel, [Winding quotients and some variants of Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Research/18.Merel/paper.pdf), author version dated 9 September 2007 of J. reine angew. Math. 490 (1997), 81–100. Theorem 6.1, Proposition 6.5, Propositions 7.1–7.2 and Lemmas 8.2–8.3, author-version pp.16–24. Its boundary proof is extended in §5.12 to the five genus-zero auxiliary prime levels.
- **banwait-najman-padurariu.** Barinder S. Banwait, Filip Najman and Oana Padurariu, [Cyclic isogenies of elliptic curves over fixed quadratic fields](https://arxiv.org/pdf/2206.08891v3), arXiv:2206.08891v3 (2026). §1, Theorem 1.1 and Table 1.1, p.2; §2, Mazur’s strategy, pp.5–6. The rational-curve classification and original Kenku references are the portions used.
- **serre-1981.** Jean-Pierre Serre, [Quelques applications du théorème de densité de Chebotarev](https://www.numdam.org/article/PMIHES_1981__54__123_0.pdf), Publications Mathématiques IHÉS 54 (1981), archive pp.123–201. §8.4, Lemmas 18–18′, printed pp.397–398 / archive pp.197–198. The inertia estimate is unconditional.
- **bilu-parent-rebolledo.** Yuri Bilu, Pierre Parent and Marusia Rebolledo, [Rational points on X₀⁺(pʳ)](https://www.numdam.org/item/10.5802/aif.2781.pdf), Annales de l’Institut Fourier 63 (2013), 957–984. Theorem 1.1; Theorems 4.1–4.2 and Propositions 4.3–4.4, pp.970–972; Proposition 5.6, Corollary 5.7 and Proposition 5.9, pp.976–979. The finite universal exclusion is a mathematical rational-point theorem.
- **gaudron-remond.** Éric Gaudron and Gaël Rémond, [Théorème des périodes et degrés minimaux d’isogénies](https://arxiv.org/abs/1105.1230v1), arXiv:1105.1230v1 (2011). Theorem 1.4, p.4; Theorem 7.5, pp.27–28; §§7.3–7.5, pp.28–32; period inputs: Theorems 1.1–1.2, 4.5 and Proposition 6.9. These locators use v1 rather than the journal edition.
- **bilu-parent-split.** Yuri Bilu and Pierre Parent, [Serre’s uniformity problem in the split Cartan case](https://arxiv.org/abs/0807.4954v5), arXiv:0807.4954v5 (2009). Appendix, Theorem 6.1 and its proof, pp.8–10.
- **kenku-1979.** M. A. Kenku, [The modular curve X₀(39) and rational isogeny](https://doi.org/10.1017/S0305004100055444), Math. Proc. Cambridge Philos. Soc. 85 (1979), 21–23. Cited by published locator; original text uncertified.
- **kenku-1980a.** M. A. Kenku, [The modular curve X₀(169) and rational isogeny](https://doi.org/10.1112/jlms/s2-22.2.239), J. London Math. Soc. (2) 22 (1980), 239–244. Use with **kenku-169-corrigendum**, [corrigendum](https://doi.org/10.1112/jlms/s2-23.3.428-s), (2) 23 (1981), 428. Both are cited by published locator; original texts uncertified.
- **kenku-1980b.** M. A. Kenku, [The modular curves X₀(65) and X₀(91) and rational isogeny](https://doi.org/10.1017/S0305004100056462), Math. Proc. Cambridge Philos. Soc. 87 (1980), 15–20. Cited by published locator; original text uncertified.
- **kenku-1981.** M. A. Kenku, [On the modular curves X₀(125), X₁(25), and X₁(49)](https://doi.org/10.1112/jlms/s2-23.3.415), J. London Math. Soc. (2) 23 (1981), 415–427. Cited by published locator; original text uncertified.
- **kenku-1982.** M. A. Kenku, [On the number of ℚ-isomorphism classes of elliptic curves in each ℚ-isogeny class](https://doi.org/10.1016/0022-314X(82)90025-7), J. Number Theory 15 (1982), 199–202, especially pp.199–201. Cited by published locator; original text uncertified.
