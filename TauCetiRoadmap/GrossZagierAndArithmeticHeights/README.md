# Roadmap: gross–zagier formulas and arithmetic heights

**Summary.** Build the normalized comparison between derivatives of Rankin L-functions and heights of character-weighted CM points, first on modular curves and then on quaternionic Shimura curves over totally real fields. The construction passes through Poincaré heights, admissible intersection theory, toric test vectors, and analytic and arithmetic theta kernels. Its weight-two anticyclotomic extension compares central p-adic L-values with squared formal logarithms, keeping periods, Euler factors, and integral normalizations explicit.

## Scope and ownership

This roadmap owns the arithmetic height comparisons and the local-to-global kernel identities needed for Gross–Zagier. Section 7.58 owns the CM specialization of the p-power Hecke divisor, its marked quasi-canonical orbit cycles and their intersection/Hom-lifting comparison; the general Hecke correspondences and cyclic-isogeny deformation rings belong to ModularCurvesPartII §§9.9–9.10 and 11.2. It also owns the weight-two adaptation of the BDP and Brooks formulas and the comparison of their square-root measures with central-value functions. The earlier CM and class-field roadmaps supply ideal actions and reciprocity. Preparatory Layer 0a supplies their cyclic-level and quaternionic CM-point comparisons; this roadmap then supplies the height and logarithm identities consumed by Heegner point Euler systems. Point Kummer and Bloch–Kato comparisons come from the earlier general cohomological and regulator interfaces. The auxiliary quadratic field enters only as a hypothesis, and no rank, Sha or leading-term deduction is a target here. The conclusions here concern individual points and character components.

Section 8.6 proves Gross–Zagier's identity between Hecke heights of Heegner divisors and coefficients of the projected Rankin derivative, through the local heights of Layers 2 and 7 and the kernels of Layer 6. Sections 8.15 and 8.19 derive from it the odd-discriminant, conductor-one class-character and elliptic trace formulas, with their quotient-polarization and relative-height comparisons, and from the Cai–Shu–Tian formula 8.14 the formulas at ring conductors, even discriminants and ramified level under their stated hypotheses. EffectiveClassNumbers §2.8 states the class-character and elliptic formulas without a kernel or local-height route; it is not a supplier of §§8.15 and 8.19, whose proofs are the route of Layers 2–8 here. NeronModelsAndSemistableAbelianVarieties §6.4d supplies semistable quotient cotangents over finite extensions of ℚ_p with e<p−1, including good reduction. Section 9.1 extends the good-reduction statement to the stated mixed-characteristic DVRs; §9.18 supplies the separate coefficient-prime optimal isogeny comparison.

Tau Ceti already provides the elliptic canonical height, its polarized pairing and the regulator: `WeierstrassCurve.Affine.Point.canonicalHeight`, the limit of the naive x-height of 2ⁿP divided by 4ⁿ (`Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`); `WeierstrassCurve.Affine.neronTatePairing`, its half polar form (`neronTatePairing_self`); and `regulator`, with `regulator_eq_abs_det_neronTateGramMatrix` and the rank-zero value `regulator_eq_one_of_finrank_eq_zero`. These definitions are used as they stand. Layer 0 fixes their relation to the normalizations used by the sources; the rational tensor extension in Layer 0 and the dual-abelian, coefficient-field pairing in Layer 1 add different domains.

TauCetiRoadmap.EllipticCurves, Layer 7, supplies the full real period Ω(E) over ℚ, defined on the global minimal model as 2∫dx/√D_W over the locus D_W>0; the identity-component period and the factor c_∞ are compared in 0.6. The pinned Hasse declarations are `WeierstrassCurve.hasse_bound` and `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card`. TauCetiRoadmap.ModularCurves supplies the curve, Jacobian, Picard duality and Cartier–Nishi pairing of isogenies; its Layer 7F ST-1 supplies the elliptic Serre–Tate deformation equivalence, while the explicit CM coordinates, lift filtrations and local lengths here are additional comparisons; the arithmetic height of the Poincaré biextension is the additional construction here. MetaplecticAutomorphicForms, Layers 4–6, supplies the Weil representation, the theta kernels and the ordinary and regularized Siegel–Weil identities. The degree-(3,1) split quaternionic Shimizu identity required here has its own target and hypotheses; a general regularized identity does not automatically supply it. AutomorphicSpectralTheory §§2.23–2.25 constructs the level-N resolvent kernel G_(N,s) on Γ₀(N), its meromorphic continuation to s=1 and its residue κ_N=−12/[SL₂(ℤ):Γ₀(N)]; Layer 7 uses them as they stand. IntegralLattices supplies quadratic lattices, and OrthogonalSpinGroups supplies the general Clifford and orthogonal-group structures. DifferentialGeometry's integration pairing is the de Rham Poincaré pairing; the height pairing here uses metrized line bundles on abelian varieties.

General projective heights, Weil's height machine, field-extension compatibility and Néron–Tate heights with their bilinear form belong to HeightsRationalPointsAndObstructions §§0.11–0.21, and the Mordell–Weil theorem with positive definiteness to its §§1.7–1.8; the product formula is Mathlib's `NumberField.prod_abs_eq_one`. These height targets are built on the height foundation of TauCetiRoadmap.DiophantineApproximationAndTranscendence §0.2 (absolute projective heights and the multiplicities of places in a finite extension). The Néron symbols of disjoint degree-zero divisors on a curve are constructed here, at finite places from regular models (§2.5) and at complex places from the Arakelov Green function (§2.11). The point-metric local Weil and Néron functions of HeightsRationalPointsAndObstructions §§0.22–0.24 are not that symbol: they depend on a chosen metric on one Cartier divisor, and a bounded nonconstant change ψ_v of the metric changes their value on (x)−(y) by ψ_v(x)−ψ_v(y). Abelian schemes and arithmetic moduli, A2 and A6, supply abelian varieties, duals, polarizations and endomorphism algebras. Local/global Jacquet–Langlands and rational models belong to GL₂ automorphic representations and transfer, R17.3. The primitive integral differential line and its ratio-integrality theorem are constructed in Layer 9; a rational JL map is not asserted to preserve integral lattices. The p-adic measure algebra, Amice transform, twisting and pushforward belong to p-adic measures and Iwasawa algebras, L1–L2. The weight-two CM periods, ordinary root distributions and their special-value comparison are constructed in Layer 9 from its CM moments; no separate automorphic p-adic L-function supplier is assumed. TropicalAndBerkovichArithmetic §§2.7, 2.10–2.13, 3.1–3.3 and 6.6–6.8 owns the split semistable skeleton and its retraction, the polarized metric graph, the admissible measure, the normalized graph Green kernel, the model-metric curvature and the scaling of potentials; §2.3 adds only the pushed-forward measure i_*μ_ad on the analytic curve.

TauCetiRoadmap.ImaginaryQuadraticClassNumber counts the units of an imaginary quadratic field (H1.2: six at discriminant −3, four at −4, two otherwise) and constructs the orders O_f with their Picard groups, the conductor sequence Pic(O_f)→Cl(O_K)→1 and the class-number formula with its unit-index exceptions (H1.4). Its H3.1 also plans, for every imaginary quadratic order, the ideal-lattice CM curves, the class-group action with its stated Artin convention and the Hilbert class polynomial. The unit index of 0.4 and the conductor checks of 0a.1 use H1.2 and H1.4. Layer 0a consumes the ideal action through the named interfaces of ComplexMultiplicationAndExplicitReciprocity §§1.1–3.1 and adds only level structures, optimal embeddings and quaternionic points.

AutomorphicSpectralTheory §§0.39–0.45 owns the archimedean Fourier integral V_s, its zero-frequency value, entire nonzero-frequency continuation, completed reflection law, terminating polynomials and negative-frequency central derivative. Section 6.2 asks only for the additional decay-integral derivative bounds and finite-part adapters. AutomorphicSpectralTheory §§1.25–1.30 owns the character Eisenstein seeds and their Fourier expansions; §§6.14, 6.33 and 6.58 add cusp transformation, the genus-weighted combination and the resulting Rankin kernel. Its §§1.14–1.15, 1.30 and 2.17–2.18 supply the weight-two Eisenstein family through the continued weight-zero family; §6.18 adds the comparison with Mathlib's normalized E₂ and its Mellin finite parts. AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25 supplies partial ideal zeta series, imaginary-quadratic genus characters and their Hecke factorization.

Section 0a.2 constructs the cyclic CM pairs, their trace and inverse-ideal Galois action for every proper invertible quadratic order with conductor prime to the level, the maximal order included, retaining the full exceptional-unit stabilizers. ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, owns its marked classical/quaternionic CM divisor, projection to the marked f-Jacobian factor, transport through its specified isogeny to E, and the associated logarithm, height and low-rank formulas under its ordinary, squarefree-level, residual and Selmer hypotheses. Those marked divisors and images are reused in that scope. Sections 0a.2 and 0a.4 identify their CM moduli points, and §8.8 compares the general point with that same quotient, isogeny and basepoint; §9.8 transports its logarithm. Layers 8–9 own the broader coefficient-field and character identities without those Selmer assumptions; low-rank and finite-Sha deductions stay with Statistics.

## Conventions

### Heights, coefficients and periods

All displayed heights carry a field of computation. Relative height over F is [F:ℚ] times absolute height. In particular, relative H-height equals [H:K] times relative K-height on K-points. Mathlib's NumberField.instAdmissibleAbsValues uses local-degree weights, and NumberField.totalWeight_eq_finrank gives their total. Transporting heights across fields requires compatible extensions of places, not just equal cardinalities of place sets.

Write h_(O) for the elliptic canonical height of the divisor (O), h_x=2h_(O), and B_x(P,Q)=½(h_x(P+Q)−h_x(P)−h_x(Q)). Thus B_x(P,P)=h_x(P), and B_x is also the full polarization h_(O)(P+Q)−h_(O)(P)−h_(O)(Q) of the (O)-height. In Tau Ceti, `canonicalHeight` is h_x, `neronTatePairing` is B_x and `regulator` is the absolute Gram determinant of B_x, the regulator of the Birch–Swinnerton-Dyer formula. A source written with h_(O) (Silverman's normalization) differs by the factor 2, and a rank-r Gram determinant formed from the half polar form ½(h_(O)(P+Q)−h_(O)(P)−h_(O)(Q)) of h_(O) by 2^r. On Jacobians the Gross–Zagier height is the height of 2Θ. Over a coefficient field M, height values lie in M⊗ℚℝ and are recovered by the trace-duality identity, not by choosing one embedding. A Hermitian self-height additionally conjugates the second character component.

For a finite-level Jacobian J, write λ_J:J→J∨ for its canonical principal polarization. A composition pairing uses J→A and A→J∨ with λ_J⁻¹ between them, as in §3.6; every unnormalized composition in Layer 8 uses the same map.

Petersson products in classical formulas are linear in their first variable. Tau Ceti's inner product is conjugate-linear in the first; comparisons explicitly interchange these conventions. For weight 2 the invariant norm is ∫|f(z)|²y² dx dy/y²=∫|f(z)|²dx dy. Fix Néron differentials before comparing logarithms or periods. The full real period Ω equals c_∞Ω⁰, with c_∞=2 for positive discriminant and 1 for negative discriminant. The Manin constant C is a nonzero rational scalar; its integrality or p-unit property requires the separate theorems of Layer 3.

### Characters, signs and measures

Arithmetic reciprocity sends a uniformizer to arithmetic Frobenius. Under the selected ideal-class indexing it acts on CM points by the inverse ideal class. The Galois-weighted sum P⁰_χ=∑_σ χ(σ)P^σ and its probability average use the χ^(-1) Galois eigenspace. An ideal-indexed sum is converted using the inverse-ideal action before making this assertion. A source sum written with χ^(-1) is compared by replacing χ, including the second dual character. A character of Pic(O_c) at tame conductor c is not automatically a character of Γ=Gal(K_∞/K).

Distinguish a character χ_G of a finite Galois quotient from a torus character χ_T in an automorphic period. For the reference quaternionic CM point x=[z,1], 0a.4 computes the actual translation reciprocity σ_z(t) from the reflex norm, so x·t=x^(σ_z(t)). The transport is χ_T(t)=χ_G(σ_z(t)). The Galois sum with weights χ_G belongs to the inverse-χ_G eigenspace; its toric functional transforms by χ_T⁻¹ and the central-character condition is ω_Aχ_T|𝔸_F×=1. Analytic formulas use χ_T, while finite-representation formulas use χ_G. Identify them only through this transport, never merely because both are written χ in a source. For the ideal-indexed modular pair, Art(a) sends P_b to P_(ba⁻¹), so Σ_a χ_G(Art(a))P^(Art(a))=Σ_b χ_G(Art(b))⁻¹P_b. This last inverse concerns the lattice index, independently of the reflex-norm conversion.

Unitary Rankin L-functions have centre 1/2; weight-two motivic ones have centre 1. The complex gamma factor is the existing `Complex.Gammaℂ(s)=2(2π)^{−s}Γ(s)`. For λ(s)=N^(s/2)Γ_ℂ(s)L(s), a central zero gives λ′(1)=√N L′(1)/π. Using half of Γ_ℂ changes this constant by 2. The base-change sign convention is ε_BC,v(1/2,π_(K,v)⊗χ_v)=χ_v(−1)ε(B_v); the Rankin convention multiplies it by η_v(−1). Keep the local Langlands λ-factor in this comparison.

Local measures (used from Layer 4 on). At every place v the local measures are those of Cai–Shu–Tian §2: da is self-dual for ψ_v and d^×a=L(1,1_v)da/|a|_v; on a separable quadratic algebra or quaternion algebra L over F_v with reduced norm q, dx is self-dual for (ψ_v,q) and d^×x is L(1,1_v)²dx/|q(x)|_v for L=F_v², L(1,1_L)dx/|q(x)|_v for a field and L(1,1_v)dx/|q(x)|_v² for a quaternion algebra, with the quotient measure on L^×/F_v^×; and Vol(GL₂(O_v))=L(2,1_v)⁻¹|δ|², Vol(O_(B_v)^×)=L(2,1_v)⁻¹(q−1)⁻¹|δ|² for B_v division (CST §2, p. 13, cst line 808; §3.3, p. 23, cst line 1453). Their products give the global volumes 2L(1,η) of K_𝔸^×/K^×𝔸^× and 2 of B_𝔸^×/B^×𝔸^×. Under these measures, for K_v/F_v unramified and δ, D units, O_(K_v)^×/O_(F_v)^× has volume L(1,1_(K_v))(1−q^(−2))/(L(1,1_v)(1−q^(−1))) = 1. The torus quotient measure used for finite CM averaging has total volume 2L(1,η), with L completed as specified in each formula. Its probability measure divides by that volume. The quaternionic Petersson measure is Tamagawa measure, of volume 2. These are separate measure comparisons. A double probability average divides a double unnormalized period by the square of the torus volume. Pairings defined by an integral remain meaningful when b(f,f′)=0; normalized matrix-coefficient quotients require b(f,f′)≠0.

### Complex and finite intersections

The complex Néron symbol of disjoint degree-zero divisors is defined on every compact connected complex curve, of any genus, by degree-zero Green functions: for deg(b)=0, g_b is harmonic off |b| with ddᶜg_b=−δ_b, and the symbol is −2∑n_i g_b(x_i) (2.11). No probability form enters it, so genus-zero curves such as X₀(2)(ℂ) are covered. For a compact connected complex curve of genus g>0 use the probability form μ_Ar=(i/(2g))∑ω_j∧overline(ω_j) for an L²-orthonormal holomorphic basis. Set ddᶜ=(i/π)∂∂bar. The Green equation is ddᶜg_D=deg(D)μ_Ar−δ_D, and the unsquared metric is ||s_D||=exp(−g_D). A principal complex height symbol consequently contains −2∑g_D, matching log|f|². At real places descend conjugation-invariant metrics. Genus 1 requires the translation-invariant probability measure; division by 2g−2 is restricted to g>1.

At a finite place ord_π(π)=1; local intersection length is multiplied by log q_v. Reduction graphs retain component genera, edge lengths and loops. Bridges have infinite complementary resistance and zero edge density; the genus-one case has a separate normalization. For CM diagrams, half Hom counts, coarse stabilizers, tangent symbols, tensor intersections and modified intersections are different objects. Their conversion is proved before summing local terms.

### Classical settings

1. Use the classical CM setting: K=ℚ(√D), D<0 an odd fundamental discriminant, (D,N)=1, and D a square modulo 4N. Write O=O_K, H for the Hilbert class field, h=#Cl_K, u=#O×/2, t=#{ℓ:ℓ∣D}, s=#{ℓ:ℓ∣N}, Γ=Γ₀(N) in PSL₂(ℤ), R_N=(ℤ ℤ;Nℤ ℤ), and √D=i√|D|. The integer m is positive and coprime to N.

2. Use the marked classical CM setting, with N>1 and the preceding splitting and discriminant assumptions. Choose the primitive norm-N ideal 𝔫, so O/𝔫≅ℤ/Nℤ, and the associated cyclic CM isogeny x:E→E′ over H. Set c=(x)−(∞), d=(x)−(0), w=2u, ε=(D/·), and identify σ with its ideal class A by arithmetic reciprocity. T_m is the degree-m Hecke correspondence, r_A(m) counts integral ideals of norm m in A, and σ_ν(m)=∑_(a∣m)a^ν.

3. For finite CM intersections, take N≥1 and the classical splitting assumptions. The cyclic CM diagram x, its conjugate x^σ, and the primitive ideal 𝔫 are fixed. At v∣p of H, let A_v=O_(H_v), π be a uniformizer, q_v its residue cardinality, and W the completed maximal unramified extension of A_v. Use the coarse Deligne–Rapoport/Katz–Mazur model, and define degree-m Hom sets of Γ₀(N)-diagrams over W/πⁿ. Put h_n(y,x)_m=½#Hom_(W/πⁿ)(y,x)_m. The different is 𝔡=(√D), and ord_π(π)=1.

4. For intersections of the marked divisors c and T_m d^σ, impose N>1 in the finite CM intersection setting. This separates the cusps 0 and ∞; at N=1 the asserted disjointness is unavailable. All models, local uniformizers, diagram Hom sets, h_n and reciprocity conventions are as in that setting.

5. For classical Rankin series take a fundamental D<0, δ=|D|, ε=(D/·), K=ℚ(√D), an ideal class A, N≥1 prime to D, and an integer k≥1. The newform f=∑a(n)qⁿ has weight 2k. Put r_A(0)=1/#O_K×, and r_A(n)=#{integral ideals in A of norm n} for n>0. Here q=exp(2πiz), z=x+iy, e(x)=exp(2πix), and e_n(a)=exp(2πia/n).

6. For the explicit Fourier kernels, add D odd to the classical Rankin setting. The source Petersson product is first-variable linear: ∫ f(z) overline(g(z)) y^(2k) dx dy/y². The kernel Φ̃_s is characterized by (f,Φ̃_s̄)=(4π)^(−s−2k+1)N^sΓ(s+2k−1)L_A(f,s+2k−1). Its Fourier sum is over n∈ℤ,l≥0 with Nn+l≡0 mod D, with factor e_s(n,Ny/δ)r_A(l)exp(−2πly/δ)e((Nn+l)x/δ). For d>0 dividing a nonzero signed n, ε_A(n,d)=0 when (d,n/d,D)≠1; otherwise, writing D=D₁D₂ and |D₂|=(d,D), it equals ε_(D₁)(d)ε_(D₂)(−Nn/d)χ_(D₁D₂)(A). Use V_s, V_s*=(π|t|)^(−s−2k+1)Γ(s+2k−1)V_s, p_(k,r), and q_(k−1)(t)=∫₁^∞(x−1)^(k−1)x^(−k)exp(−xt)dx with the normalizations specified in the coefficient targets.

7. For the weight-two central-derivative specialization take the odd fundamental D, prime-to-D level N, ideal class A and norm counts above, with k=1 and ε(N)=1. Thus r_A(0)=1/(2u).

8. For the logarithmic weight-two projection: a weight-two form Φ̃=Σ_m a_m(y)e^(2πimz) on Γ₀(N) satisfies the growth condition (6.1) of Gross–Zagier IV if at every cusp ξ it is A_ξ log y+B_ξ+O(y^(−ε)) for some ε>0, and the cusp constants are of level type if A_ξ=A(N₁) and B_ξ=B(N₁) depend only on N₁=gcd(N, denominator of ξ). Then α(M), β(M) for M|N denote the solution of the linear systems (6.3) Σ_(M|N)((M,N₁)²/M²)α(M)=A(N₁) and (6.4) Σ_(M|N)((M,N₁)²/M²){β(M)+α(M)log((M,N₁)²/M)}=B(N₁) for N₁|N, whose matrix C_N=((M,N₁)²/M²)_(N₁,M) is invertible (Gross–Zagier IV §6, (6.1)–(6.4), pp. 295–296, gz86 line 2726, where the system is stated to be non-singular).

The use of these settings below is indicated by name. Extra restrictions in an individual statement are retained. In particular N=1 is allowed for analytic kernels where stated, and N>1 is required for the marked-divisor intersection argument. The class-number quantities h, w=2u, the level-prime count s, and a complex analytic parameter are never identified.

### Quaternionic and Colmez settings

For the global quaternionic formulas F is totally real and E/F is CM, with quadratic character η and a fixed self-dual additive character ψ. An incoherent quaternion algebra is totally definite at the real places and contains the adelic CM algebra. A nearby coherent algebra switches the invariant at the specified place. The normalized degree-one Hodge class has positive component degrees. Integral models and arithmetic intersections use the selected admissible metrics and local measures.

The Colmez resolvent Green function is weakly admissible: its Hodge-line mean is −1. Full admissibility requires a constant correction. The height and derivative comparisons retain the resulting Eisenstein terms until the orbit condition S² at the auxiliary split places (Yuan–Zhang–Zhang Assumption 5.4) makes them vanish (Yuan, Modular heights, §4.2–§4.5, pp. 58–71; Yuan–Zhang–Zhang, author erratum of 28 June 2026, items 62–63).

The Colmez comparison uses |Σ|>1 and no common finite ramification of E and the quaternion algebra. Choose U as the unit group of a maximal order containing Ô_E itself. Containment of Ô_E× alone is insufficient at a split residue-𝔽₂ place. The special test function requires two distinct auxiliary split places S₂, and their local constructions appear in Layer 6 before the derivative expansion. At v, q_v is residue cardinality, d_v the different of F_v/ℚ_p, and D_v the relative discriminant of E_v/F_v. The classical Q_(s−1) resolvent starts in Re(s)>1 and is regularized at s=1. The Colmez Q_s resolvent uses the shifted variable, starts in Re(s)>0 and is regularized at s=0. Archimedean Gaussian formulas apply to their specified Gaussian vectors; they do not describe arbitrary Schwartz functions.

### Standing hypothesis blocks

Many targets below assume one or more of the following eight blocks of data, referred to by their labels. A target that names a block assumes every clause of it; extra restrictions are stated at the target.

- **(C) Classical Rankin data.** K=ℚ(√D), D<0 a fundamental discriminant; ε=(D/·), h=#Cl(K), w=#O_K×=2u; A an ideal class; r_A(n) counts integral ideals of norm n and r_A(0)=1/w; N≥1 is prime to D; f is a weight-2k newform, k≥1, with a(1)=1 where eigenform normalization is used. Petersson pairing is linear in the first argument, with y^(2k)dxdy/y² and no implicit volume division.
- **(H) Classical Heegner local data.** For the classical Heegner local statements: D is odd, D≡square mod4N, every p|N splits in K; x is the CM cyclic N-isogeny diagram over the Hilbert class field H, c=(x)−∞, d=(x)−0; σ corresponds to A under the stated Artin convention; m≥1 with gcd(m,N)=1. At a finite place v|p, ord_v(π)=1, q_v=#κ(v); W is the completed maximal unramified extension of O_Hv. Actual chosen integral diagrams, not a canonical Hom functor of arbitrary coarse Artinian points, are used.
- **(G) Genus decomposition data** (Gross–Zagier, Chapter IV, §2 onwards). D is odd, which with (D, N) = 1 from (C) gives (D, 2N) = 1; D is squarefree and D ≡ 1 mod 4. For a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_(D_i) (mod δ_i), 𝔡_i is the integral ideal of norm δ_i (the product of the ramified primes, 𝔡_i² = (D_i)), 𝒟₁ is the class of 𝔡₁, χ_(D₁·D₂) is the class-group genus character, characterized on integral ideals 𝔞 prime to D by χ([𝔞]) = ε_(D₁)(N𝔞) = ε_(D₂)(N𝔞). On an arbitrary class its value is computed using a prime-to-D representative, independently of that choice (Gross–Zagier IV §0, p.268), and κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0.
- **(L) Chapter III local data** (Gross–Zagier, Chapter III). v is a finite place of H over the prime p; A_v is the ring of integers of H_v, π a uniformizer and q = q_v = p^f = #A_v/π; W is the completion of the maximal unramified extension of A_v (π is prime in W) and 𝔽 = W/π an algebraic closure of A_v/π; X is the model of X₀(N) over ℤ; x and x^σ also denote the sections of X ⊗ A_v (or X ⊗ W) extending x and x^σ.
- **(Q) CM quaternionic data.** F is totally real, E/F is CM quadratic with character η; additive characters and self-dual measures follow the source; when quaternionic data occur, 𝔅 is totally definite incoherent with an embedding E𝔸→𝔅; B(v) is its nearby coherent algebra.
- **(Q′) Colmez computation data.** For the Colmez local computations (Yuan–Zhang, §7.2): |Σ(𝔅)|>1; no finite place is ramified in both E and 𝔅; U=Ô𝔅× for a chosen maximal order Ô𝔅⊃ÔE; φ has all five local components of Yuan–Zhang §7.2; S² has two E-split, ℚ-unramified places; original 𝔧 belongs to 𝔅, nearby j to B(v); N_v is residue cardinality, d_v the different of F_v/ℚ_p, D_v the relative discriminant of E_v/F_v; arithmetic degrees are relative to F.
- **(A) Anticyclotomic labels** (Jetchev–Skinner–Wan §§3–5; Castella–Hsieh). For a newform f of level N=N⁺N⁻, an imaginary quadratic K of discriminant −D_K and a prime p: (gen-H) means that every prime dividing N⁺ splits or ramifies in K and N⁻ is a squarefree product of an even number of primes inert in K; (JSW-H) is (gen-H) with (N, D_K)=1 (written (H) by Jetchev–Skinner–Wan; unrelated to block (H) above); (good) means p ∤ N; (split) means p = v v̄ splits in K, with v fixed by ι_p; (ST) at ramified level means a_ℓ(f) = −1 for every ℓ | (N, D_K). The constant t_K := w_K/([O_K^× : ℤ^×]·#Cl_K^ram), where w_K = #μ(K) is the order of Burungale's U^alg = Û_K ∩ (K^×)^(1−c) (every root of unity has norm one, hence the form x/x̄ by Hilbert 90) and Cl_K^ram ⊂ Cl_K is the subgroup generated by the classes of the ramified primes (Burungale, Theorem 5.6, p. 29, burungale line 1080). Since w_K/[O_K^× : ℤ^×] = 2 for every K and Cl_K^ram = Cl_K[2] has order 2^(t−1) by genus theory, t is the number of primes dividing D_K, t_K = 2^(2−t), a unit at every odd p: ℚ(√−3) gives 6/(3·1) = 2 and ℚ(√−5) gives 2/(1·2) = 1, whereas the product w_K·[O_K^× : ℤ^×]·#Cl_K^ram would give 18 and 4.
- **(D) Degenerate Gross–Zagier data** (Yuan–Zhang–Zhang, Assumptions 5.2–5.6; restated by Disegni, §6.1, pp. 50–51). Data (Q), with σ a cuspidal representation of GL₂(𝔸_F) of parallel weight two and χ a finite-order character of E^×\𝔸_E^× with ω_σ·χ|_(𝔸_F^×)=1. S₁ is a finite set of finite places nonsplit in E, with |S₁|≥2, containing every finite place nonsplit in E at which E/F or F/ℚ is ramified, 𝔅 is ramified, χ is ramified, or σ_v is not an unramified principal series. S₂ is a set of two finite places split in E, at which σ and χ are unramified. φ=⊗φ_v∈S(𝔅×𝔸^×) is a pure tensor, standard at the archimedean places and ℚ-valued at the finite places; φ_v∈S¹ for v∈S₁ and φ_v∈S² for v∈S₂, where, writing 𝔅_v=E_v⊕E_v𝔧_v and x=x₁+x₂, S¹ consists of the Φ_v with Φ_v(x,u)=0 whenever ord_v(uq(x))≥−ord_v(d_v) or ord_v(uq(x₂))≥−ord_v(d_v), and S² of the Φ_v with (r(g)Φ_v)(0,u)=0 for every g∈GL₂(F_v) and u∈F_v^× (their properties are 7.4); and φ_v=1_(O_(𝔅_v))⊗1_(d_v^(-1)O_(F_v)^×) at every finite place nonsplit in E outside S₁, for a maximal order O_(𝔅_v)⊃O_(E_v). U=∏U_v has U_v=(1+ϖ_v^(r_v)O_(𝔅_v))^× for some r_v≥0 at every finite v, maximal at the nonsplit places outside S₁ and at S₂; χ is invariant under U∩E^×(𝔸_f); φ is invariant under U×U for the Weil action r(h₁,h₂)φ(x,u)=φ(h₁^(-1)xh₂,q(h₁)q(h₂)^(-1)u); −1∉U; and U is small enough that every connected component of X_U(ℂ) is an unramified quotient of the upper half-plane.

## Exact supplier contracts

A supplier provides only the named general object below. The right-hand column identifies the specialization proved in this roadmap; a shared subject name does not supply that specialization. CM points and their class-field action precede every height construction. The cyclic-level and optimal-embedding comparisons of Layer 0a use only those earlier suppliers. The Hodge class and rational realization are constructed in Layer 3. The good-reduction point Kummer comparison is PadicHodgeRegulators §1.9; the comparison of the abelian exponential with the Bloch–Kato exponential at arbitrary reduction is owned by §9.5. Euler-system classes and descent are downstream consumers.

| Supplier and actual interface | Imported content | Specialization owned here |
| --- | --- | --- |
| From Mathlib `Matrix.det_smul`, `QuadraticMap`, `TensorProduct` | determinant scaling and algebraic scalar extension | Layers 0–1 apply these to the already constructed height pairing |
| From TauCetiRoadmap.ClassFieldTheory | the Artin map of the Hilbert and ring class fields of an imaginary quadratic field | [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points) fixes its arithmetic normalization and its action on CM points |
| From Tau Ceti elliptic `canonicalHeight`, `neronTatePairing`, `regulator`; TauCetiRoadmap.EllipticCurves Layers 3, 6–7 | existing elliptic height, pairing, regulator, Hasse and period data | [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), [0.2 The canonical height on E(K) ⊗ ℚ](#02-the-canonical-height-on-ek--ℚ), real/full-period adapter |
| From HeightsRationalPointsAndObstructions §§0.11–0.12 (normalized heights, finite extension of the height base), §0.16 (Weil's height machine), §§0.18–0.21 (Tate's limit, Néron–Tate heights, positivity, the symmetric bilinear form) and §§1.7–1.8 (Mordell–Weil, positive definiteness) | general line-bundle height machine, canonical heights and their bilinear form, compatible extensions of places, finite generation and positivity; its §§0.22–0.24 point-metric Weil and Néron functions are not consumed as the curve symbol | [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [2.12 Faltings–Hriljac comparison](#212-faltingshriljac-comparison); the Néron symbols of disjoint degree-zero divisors on a curve are constructed in [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves) and [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol) and extended to common support in [7.19 Tangent-normalized CM height symbol](#719-tangent-normalized-cm-height-symbol); no Jacobian 2Θ or tangent comparison is presumed from a generic height name |
| From AbelianSchemesAndArithmeticModuli A2.2, A2.3 and A2.6; A1.2 and A1.3; A4.9 (Serre–Tate equivalence with polarizations and prescribed endomorphisms); A4.10 (`SerreTate.homCriterion`); A6.1 and A6.13 degree formulas | duals, actual rigidified Poincaré line, graph pullback, polarizations and rational endomorphisms; injectivity of Hom under nilpotent reduction; the Serre–Tate equivalence for abelian schemes with structures (used for false elliptic surfaces); the ordinary Serre–Tate coordinate with its Hom-lifting criterion (the elliptic Serre–Tate equivalence itself is TauCetiRoadmap.ModularCurves Layer 7F ST-1) | [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.46a Principal-level integral models](#746a-principal-level-integral-models-cm-sections-and-čerednikdrinfeld-charts); the diagram functor is not an A6 import |
| From ArakelovGeometryAndAbelianHeights §§1.1–1.4, 1.8–1.10, 1.15, named `HermitianBundle`, `ArithmeticDivisor`, `ArithmeticChow1.pairing` | Hermitian rational lines, principal arithmetic divisors, arithmetic degrees and product formula | [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves); convert squared Green G to 2g, since the supplier uses ddᶜ=(i/2π)∂∂bar |
| From TauCetiRoadmap.StableReduction Layers 4–5 | intersection multiplicities on regular arithmetic surfaces, the negative-semidefinite intersection matrix of the special fibre, common resolution of two regular proper models, regular proper models of smooth curves and the multiplicities of their special fibres | [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves); [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves) proves Zariski's kernel statement, the existence and model independence of orthogonal extensions and the laws of the symbol |
| From ComplexComparisonPartII C1.2 Hodge Laplacian and C5.3 compact elliptic Hodge comparison; ComplexKahlerGeometry K5a–K5b.1 harmonic projection and Green operator | compact elliptic inverse, regularity, self-adjointness and harmonic projection | [2.7 Complex admissible metric existence](#27-complex-admissible-metric-existence), [2.8 Normalized Arakelov Green function](#28-normalized-arakelov-green-function), [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol) (degree-zero Green functions in every genus); no Green PDE is imported from automorphic spectral theory |
| From TropicalAndBerkovichArithmetic §2.7 and §§2.10–2.13 (semistable reduction, formal-model skeleton and metric dual graph, vertex genera, refinement and valued extension), §§3.1–3.3 (polarized metric graphs and the weak Laplacian), §6.6 (admissible probability measure and symmetric mean-zero Green kernel, including genus one and the one-point graph) and §§6.7–6.8 (model curvature, Laplacian approximation and the unit/natural-log scaling) | split semistable skeleton with inclusion and retraction, polarized metric graph, admissible measure and Green kernel, model-metric curvature, all within that roadmap's split-semistable complete-field scope | [2.3 Arithmetic normalization of the admissible skeleton measure](#23-arithmetic-normalization-of-the-admissible-skeleton-measure); the graph, measure, resistance formula and Green kernel stay with the supplier |
| From AutomorphicLFunctionsAndLocalFactors AL.0 `standard-additive-character`, `self-dual-haar`, AL.1 local factors, AL.2 GL₂ newvectors (in particular “The normalized Whittaker newvector”), AL.3 Rankin functions, AL.4 `local-parameter-comparison`; ArithmeticGaloisRepresentations §2.7 (ε-factors of Weil–Deligne representations with their monodromy factor, inductivity in degree zero for Weil representations; λ and λ²=η(−1) are proved in §0.7); GL2AutomorphicRepresentationsAndTransfer R17.4 prime-cyclic base change (here of degree 2), R17.5 quadratic induction | local factors of actual parameters, Rankin continuation and parameter transfer | [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), [6.10 Ideal-class Rankin series](#610-ideal-class-rankin-series), [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction), [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two) (inert Euler factors of the base change, with R17.4 `local-compatibility` for the Steinberg branch); exact norm lattices and wild correction are computed here |
| From Mathlib `Complex.Gamma`, `Complex.Gammaℂ`, `mellin`; AutomorphicSpectralTheory §§0.39–0.45; AL.0 `bessel-laplace-mellin` | gamma functions, Mellin transforms, V-kernel continuation, its polynomial and q-integral specializations, and the Bessel–Laplace Mellin identity | [6.2 The classical V-kernel, terminating polynomials and decay](#62-the-classical-v-kernel-terminating-polynomials-and-decay) and their finite-part bounds |
| From ArithmeticStatisticsPartVI, “Heegner logarithm and low rank” | its marked CM divisor, f-Jacobian quotient, specified elliptic isogeny, point and logarithm/height identities within its stated hypotheses | §§0a.2, 0a.4, 8.8 and 9.8 compare the general CM construction and formulas with those same markings |
| From GL2AutomorphicRepresentationsAndTransfer R16.1 `iwasawa-cartan`, R16.2 `local-classification`, R17.1 local/real quaternionic comparison, R17.3 `global-jl`, `rational-models` | actual representations, comparison of already supplied coefficient-field models under JL, and local characters | [3.4 Strict GL₂ realization and transfer](#34-strict-gl-realization-and-transfer), [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors); §3.4 constructs rational Hecke descent and the endomorphism field, rather than inferring either from rational JL; no lattice-preserving integral JL map is presumed |
| From SmoothRepresentationsOfLocalGroups SR.0 (smooth representations as discrete continuous ones, contragredients) and SR.2 `frobenius-reciprocity`; AutomorphicFormsOnReductiveGroups §2.7 and AutomorphicSpectralTheory §§0.48–0.49 (the archimedean Casselman–Wallach category) | smooth/continuous morphisms, contragredients, restriction and Frobenius reciprocity | [4.1 Local toric functional space](#41-local-toric-functional-space) with its exact inverse-character convention and central obstruction |
| From ModularCurvesPartII §7.2 weight-two differentials, §§7.5–7.6 Fourier/Hecke perfect pairing, §9 Hecke correspondences, §§13.2–13.4 Jacobian Hecke/adjoints, §§14.5–14.7 Hodge comparison, §16 modular quotients and §17.3 cusp AJ | named generic curve, Hecke, Jacobian and differential interfaces (its §§7.5–7.6 own the Fourier pairing) | Layer 3's composition/degree realization; [3.1 Integral modular differential lattices at bad primes](#31-integral-modular-differential-lattices-at-bad-primes) adds the comparison with minimal Néron differential lattices |
| From ModularCurvesPartII §§2.1–2.3, 4.1–4.8 and 5.1–5.3 | generalized elliptic compactification, Tate cusp charts, coarse model and its generic comparison | fine-level stabilizer descent in the [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams); no unqualified smooth coarse model at every prime |
| From ModularCurvesPartII §§9.1–9.2, 9.9–9.10, 11.2, 11.5 and 12.4 | full versus cyclic isogeny correspondences, scalar-subgroup factors, coprime composition, rigidified cyclic-isogeny deformation rings, and the special-fibre Frobenius/transpose maps with their level transport | [7.58 CM Hom intersection count](#758-cm-hom-intersection-count) identifies the CM orbit divisors, proves their negative congruence and compares ramified branch lengths with the Hom filtration |
| From ModularCurvesPartII §§5.1–5.4, 11.2–11.5 and 12.1 | compactified integral coarse X₀(N) with its cusps, the Γ₀(pM) local models, corrected singular locus, regular resolution and one-factor semistable model at p≥5, p∥N, and the modular dual graph with node thicknesses | [9.5 The semistable integration adapter for p-new weight two](#95-the-semistable-integration-adapter-for-p-new-weight-two) places its wide opens, annuli and cusp normalization on that model; the fine/coarse quotient and resolution distinctions are retained |
| From NeronModelsAndSemistableAbelianVarieties R11.1 invariant differentials and Néron mapping property; §1.8 abelian schemes are Néron models; §6.4d SemistableQuotientCotangent | Néron lattices, isogeny pullback, good-reduction Néron models and exact free quotient cotangents over finite K/ℚ_p with e<p−1 | [9.1 Cotangent saturation for good-reduction optimal quotients](#91-cotangent-saturation-for-good-reduction-optimal-quotients), then coefficient-prime optimality; these are not automatic from an integral pullback |
| From TauCetiRoadmap.SchemeAndStackFoundations §2.20 relative dualizing modules and the curve comparison, §§0.17–0.18 Cohen–Macaulay modules and schemes | dualizing complexes, curve dualizing sheaves and extension in codimension two | [3.1 Integral modular differential lattices at bad primes](#31-integral-modular-differential-lattices-at-bad-primes) |
| From HilbertModularVarietiesAndShimuraCurves R18.1.3 canonical curve and finite Hecke tower, R18.2.6 (Carayol split-place model, for [F:ℚ]>1) and R18.2.8–R18.2.10 integral models maximal at division primes, R18.5.3 standard Drinfeld formal model, R18.5.15 maximal-level uniformization and R18.5.20–R18.5.21 rigid towers; SerreWeightAndLevelOptimisation §2.6 (Deuring–Eichler supersingular comparison) for the modular case | the integral models within those level hypotheses; the all-level assertion is on generic fibres | [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.13 Superspecial multiplicity by uniformization](#713-superspecial-multiplicity-by-uniformization); [7.46a Principal-level integral models](#746a-principal-level-integral-models-cm-sections-and-čerednikdrinfeld-charts) constructs the principal-level models, CM sections and charts used by §7.47 |
| From HilbertModularVarietiesAndShimuraCurves R18.4.25a–R18.4.25 and R18.3.29; ModularCurvesPartII §§14.1–14.7, 14.13 and 16.2–16.5 for the split rational curve | compact quaternionic cohomological eigenspaces over actual splitting-field models, with the supplier’s topological coefficient, central quotient, local-system descent and comparison hypotheses; the separate rank-two Galois realization with its dual/Frobenius conventions and source-qualified local compatibility | §3.4 compares the actual Jacobian Hom⁰ spaces with these realizations and proves rational Hecke descent and the strict endomorphism-field conclusion |
| From TauCetiRoadmap.GlobalNumberFields Layer 11 (`NumberFieldOrder`, `Pic`, `NumberFieldOrder.Hom.mapPic`); ClassFieldTheory Layers 11–13 (globalArtinMap, globalClassFieldCorrespondence, `ringClassField`, ringClassArtinMap, gal_ringClassField_equiv_pic) | actual quadratic orders, Picard groups, arithmetic reciprocity, ring-class fields and Galois quotients | [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons) specializes extension of orders and restriction; no second class field or class group is planned |
| From TauCetiRoadmap.ImaginaryQuadraticClassNumber H1.2 and H1.4 | the unit count of an imaginary quadratic field; orders O_f, the conductor sequence Pic(O_f)→Cl(O_K)→1 and the class-number formula | [0.4 The unit index u](#04-the-unit-index-u) halves the unit count; [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons) uses the conductor sequence at conductors c∣d |
| From ComplexMultiplicationAndExplicitReciprocity §§1.1–1.3 (`cmPeriodPairings`, `cmHodgeEigenspaces`, `idealLatticeCurve`, `idealAction`, `idealAction.picardEquiv`, `idealAction.degree_eq_norm`, `quadraticFormsCMComparison`), §2.3 (`explicitLevelReciprocity`, `relativeCMModuliOrbit`), §3.1 (`classPolynomial.galois`, `classPolynomial.ringClassField`) | proper invertible order-ideal action, CM curves and their degrees, level reciprocity and the generalized dihedral class-field action, including extra units | [0a.2 Cyclic-isogeny pairs](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant) and [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary) add the cyclic Γ₀(N) moduli comparison for all imaginary quadratic fields |
| From ShimuraVarieties §§4.1–4.4 (`geometricArtin`, `ReflexNorm`, `CanonicalModel.special_action`) and §8.5; HilbertModularVarietiesAndShimuraCurves §§R18.1.3–R18.1.4 and R18.3.1 | canonical quaternionic curves, actual torus-special-point reciprocity, effective kernels and definite class sets | [0a.4 Quaternionic CM-point comparison](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent) identifies the embedded order, level stabilizer, field and split modular specialization; Layer 3 adds Hodge classes and parametrizations |
| From PELModuli M2.9 (`universal`), M4.1 (cmReciprocity), M6.2 (arbitraryLevelStack) and M6.9 (hodgeBundle, `hodgeLine`) | actual PEL fibres, their Galois action and descent at fine and stack level | [0a.5 CM level triples](#0a5-from-cm-moduli-points-to-level-triples) identifies Brooks's false elliptic surface, its specified level and differential; R18.2's auxiliary PEL dimension is not presumed to be two |
| From ComplexMultiplicationAndExplicitReciprocity §5.2 (`supersingularLevelOrderComparison`); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 p-divisible groups and Dieudonné theory; LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 and LT.6 (universal deformations of finite-height formal O_(K_v)-modules, canonical and quasi-canonical lifts) | maximal versus Eichler orders on the special fibre and p-divisible groups (the elliptic Serre–Tate equivalence is TauCetiRoadmap.ModularCurves Layer 7F ST-1) | [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths); nilpotent Hom rigidity and lifting lengths are proved on the actual Artinian bases |
| From AutomorphicFormsOnReductiveGroups §7.2 (the GL₂ adelization and its inverse), §4.2 (cuspidal L² realization), §4.5 (Maass forms) and §2.7 (smooth Fréchet globalization); Mathlib and Tau Ceti slash actions and Petersson integration | actual cuspidal functions, tensor factorization, slash actions and rapid decay | [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), Layer 5 Whittaker/Petersson factorization, Layer 6 moderate/logarithmic growth of nonholomorphic kernels |
| From AutomorphicSpectralTheory §§0.35, 0.37–0.38 (Legendre-Q, point-pair kernel and near-diagonal asymptotic), §§1.25–1.30 (character and weight-two Eisenstein families); §§2.17–2.18 and 2.23–2.25 (Eisenstein continuation, the level-N resolvent, its continuation and residue, and the automorphic Green kernel) | the existing level-N resolvent, continuation and residue; general spectral objects | [6.24 Incoherent central derivative](#624-incoherent-central-derivative), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains); these projections are not imports from AutomorphicSpectralTheory Layer 4 |
| From MetaplecticAutomorphicForms §5.9 (extended Schwartz Weil action) and Layer 5 theta kernels, §6.1 (theta measure conventions), §§6.7–6.9 (coherent and incoherent sections), §6.15 (global see-saw), §6.16 (norm-form theta integrals), §6.22 (`toricTheta_pairingComparison`, the toric theta pairing for division B) and Siegel–Weil | actual Weil/theta constructions and coherent/incoherent sections | Layers 5–6 specialize the quaternion norm decomposition and split (3,1) Shimizu calculation; the general Siegel–Weil identity alone is insufficient |
| From MetaplecticAutomorphicForms §§7.28–7.34 shimura_eigenlineBijection, §§7.35–7.38 signed trace normalizations | weight-one-half Kohnen-plus eigenline correspondence with the local multiplier/Hecke data | [5.2 Half-weight Waldspurger value](#52-half-weight-waldspurger-value) retains the finite L-series and 12π coefficient conversion; MetaplecticAutomorphicForms §§7.28–7.34 supply the correspondence, while the central-value norm identity and its scalar comparison are proved here |
| From AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25 | class ideal counts r_A(n), genus characters with their values ε_(D₁)(Na) on ideals prime to D, Kronecker's factorization; quadratic reciprocity and character orthogonality | [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function), sign reversal and ordered-discriminant sums; the Nn+l congruence is proved here |
| From AutomorphicGaloisRepresentations §4.2 Hilbert Ramanujan–Petersson, specialized to ℚ | purity bound for weight-two newforms at good primes | [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point); elliptic point counts use Tau Ceti's Hasse theorem |
| From AbelianSchemesAndArithmeticModuliPartII §§P4.1–P4.3 | fixed-CM Poincaré trivialization, connection and torsion translation | [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves); a fixed abelian scheme does not supply its moduli deformation |
| From Mathlib `PadicInt.mahlerEquiv`, `AbstractMeasure.amiceTransform`, AbstractMeasure.injective_amiceTransform; TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layers 1–2, in particular §2.5 boundedInvTransform; TauCetiRoadmap.NewtonPolygons §§6.3–6.4 | Mahler basis and the Amice transform (Mathlib's `AbstractMeasure.amiceTransform`, with its inverse `AbstractMeasure.amiceTransformEquiv` only for ℤ_p coefficients), the inverse transform for every complete ultrametric coefficient ring (PadicMeasuresIwasawaAlgebras §2.5), convolution and twisting; μ, λ, preparation with a uniformizer power, their additivity and the zero count in the open unit disc | [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness) proves only interpolation uniqueness and the parity of unit × square |
| From ColemanIntegrationPartII §§4.2–4.3, 7.2, 7.4 and 7.7 | harmonic semistable integration, proper holomorphic integration through the Jacobian, degree-zero divisor evaluation and Tate normalization at every prime | §9.5 proves only the additional p-new relation, cusp normalization, Castella AJ comparison and root interpolation |
| From ColemanIntegration Layer L1, EffectiveDiophantineMethods §§4.2–4.6 (abelian logarithm, abelian integrals, tiny integrals and the Coleman comparison) | good-reduction holomorphic integration and the abelian logarithm | [9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm), [9.5 The semistable integration adapter for p-new weight two](#95-the-semistable-integration-adapter-for-p-new-weight-two) |
| From SelmerIwasawaCohomology §4.26 (elliptic_exponential_kummer and elliptic_local_comparison_descent); PadicHodgeRegulators §1.9 (good-reduction abelian Kummer image and log_BK∘κ=log_A) and §§0.1, 1.1–1.3 (period conventions, Bloch–Kato conditions, exponential and logarithm) | elliptic tangent, exponential/Kummer and descent comparison, and the good-reduction abelian comparison; the arbitrary-reduction abelian exponential comparison is proved in §9.5 | [9.5 The semistable integration adapter for p-new weight two](#95-the-semistable-integration-adapter-for-p-new-weight-two); no assertion that all semistable H¹_f equals H¹_e |
| From EllipticCurveModularity Layer R29.5 (quotient isogenies and modular parametrisations) | the actual cusp-normalized modular quotient | Layer 3 Manin constants and Layer 9 differential/character transport |
| From ModularSymbolsPadicLFunctions Layer 1 (periods and critical values); AutomorphicSpectralTheory §§1.14–1.15, 1.30 and 2.17–2.18; Mathlib `EisensteinSeries.E2`, `EisensteinSeries.hasSum_qExpansion_E2`, `EisensteinSeries.E2_slash_action` | critical-value algebraicity, the continued Eisenstein family and native normalized E₂ | derivative algebraicity and the explicit cusp subtraction/projection targets |

The p-adic analytic subgroup theorem and its abelian algebraic-point form are [9.2 The algebraic-point subgroup input to eigenlogarithms](#92-the-algebraic-point-subgroup-input-to-eigenlogarithms), with Fuchs–Pham's and Burungale–Skinner–Wan's precise hypotheses. TauCetiRoadmap.DiophantineApproximationAndTranscendence supplies heights and the Siegel lemma, not this theorem. Likewise the [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms) owns the rational-structure and primitive-lattice integrality results of Prasanna, and the [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn) owns the derivative/test-vector specialization and its exact constants.

## How to read the build

Preparatory Layer 0a constructs the CM level points, tower comparisons and their specified abelian moduli triples. Layers 0–3 then fix constants and construct the height and geometric realizations. Layers 4–5 construct toric functionals and the coherent central-value comparison. Layer 6 constructs analytic and arithmetic kernels, including the auxiliary local data required to differentiate them. Layer 7 computes local intersections and removes the error terms. Layer 8 joins the projected identity with character averaging to obtain the global formulas. Layer 9 constructs and compares weight-two anticyclotomic functions and logarithms. The *Needs* lists determine the construction order inside each layer; the classical modular route and the Colmez quaternionic route meet at the height comparison rather than identifying their different kernels.

## Layer 0a: CM level points and ring-class towers

Start with the supplied order, Picard group, class field and CM elliptic curve. The additional constructions identify their cyclic level structures and optimal embeddings, and specialize canonical-model reciprocity to the quaternionic CM points used by the height formulas. No Euler-system norm relation or Selmer condition is needed here.

### 0a.1 Ring-class tower comparisons

Let K⊂ℂ be any imaginary quadratic field, c,d≥1 with c|d, O_c=ℤ+cO_K and H_c the ring class field of O_c, `ringClassField` of TauCetiRoadmap.ClassFieldTheory Layer 13, realized compatibly in a fixed algebraic closure of K. The order inclusion O_d⊂O_c induces the existing extension map `NumberFieldOrder.Hom.mapPic`, denoted e_(d,c):Pic(O_d)→Pic(O_c). Prove ringClassTower_restrict: H_c⊂H_d and restriction of arithmetic Artin automorphisms corresponds exactly to e_(d,c). In particular Gal(H_d/H_c) identifies with ker e_(d,c), and e_(d,c) is surjective. These comparisons apply to every conductor, including conductors divisible by 2 or 3; they assert neither a procyclic full tower nor that its torsion quotient is trivial.

The fields and their Artin/Picard equivalences are ClassFieldTheory Layer 13's `ringClassField`, ringClassArtinMap and gal_ringClassField_equiv_pic, not new constructions. The generalized dihedral action is imported from ComplexMultiplicationAndExplicitReciprocity §3.1 `classPolynomial.galois` and `classPolynomial.ringClassField`: H_c/ℚ is Galois and complex conjugation ι satisfies ι Art_c(a) ι⁻¹=Art_c(a)⁻¹. The additional tower comparison ringClassTower_conjugation says restriction commutes with these involutions. On a CM point conjugation also conjugates its level ideal; it need not fix a point with a chosen orientation.

*Outline.* Represent proper invertible ideal classes by ideals prime to d. Extension sends such an ideal to the same ambient K-ideal class at conductor c. Equivalently, the ring-class idele quotients commute with extension and their norm subgroups are nested. Apply ClassFieldTheory Layer 12's order-reversing correspondence and Layer 11's tower compatibility. The conjugation square follows from the imported inversion law and e_(d,c)(a⁻¹)=e_(d,c)(a)⁻¹.

Its API consists of the following facts:

- ringClassTower_restrict gives the commuting Artin square.
- ringClassTower_kernel identifies the relative Galois group.
- ringClassTower_trans agrees for c|d|e.
- ringClassTower_conjugation compares the involutions on the same supplied fields.

**Checks.**

- At c=d, restriction and e_(c,c) are identity maps and the relative group is trivial.
- For K=ℚ(i), c=1 and d=3, Pic(O_1)=1 and #Pic(O_3)=2; H_3/H_1 has degree two. Replacing Pic(O_3) by the maximal-order class group loses this extension.
- For K=ℚ(√−23), Pic(O_K)=C₃. If g generates it, ιgι⁻¹=g²≠g; Gal(H_1/ℚ) is S₃, not C₆. The coefficient witness ζ=2∈𝔽₇ has ζ³=1 and ζ⁻¹=4≠2.
- A quadratic class character cannot distinguish inversion. No cyclicity or ℤ_p-quotient assertion is inferred from that test, including at p=2.

([Gross, Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf), §I.4, (4.1)–(4.2), pp.89–90, for conjugation, ring-class rationality and arithmetic Artin action; the tower square is the order-inclusion specialization of the cited class-field functoriality.)

*Needs:* TauCetiRoadmap.GlobalNumberFields Layer 11 (`NumberFieldOrder`, `Pic`, `NumberFieldOrder.Hom.mapPic`); TauCetiRoadmap.ImaginaryQuadraticClassNumber H1.4 (conductor sequence and class-number formula of O_f); TauCetiRoadmap.ClassFieldTheory Layer 11 (globalArtinMap, tower compatibility), Layer 12 (globalClassFieldCorrespondence, globalClassField_unique) and Layer 13 (ringClassIdeleQuotient, ringClassNormSubgroup, ringClassArtinMap, gal_ringClassField_equiv_pic); ComplexMultiplicationAndExplicitReciprocity §3.1 (`classPolynomial.galois`, `classPolynomial.ringClassField`).

### 0a.2 The Heegner cyclic-isogeny pair at every quadratic discriminant

Let K⊂ℂ be any imaginary quadratic field, c,N≥1 with gcd(c,N)=1, O=O_c, and 𝔫⊂O a nonzero proper invertible integral ideal with O/𝔫≅ℤ/Nℤ as rings. For every proper invertible fractional O-ideal b, define cmCyclicPair(b,𝔫) to be the O-linear isogeny ℂ/b→ℂ/𝔫⁻¹b induced by the identity on ℂ, with the fixed CM type. Its kernel is 𝔫⁻¹b/b, cyclic of order N, and both elliptic curves have full endomorphism order O. The underlying CM curves and ideal isogeny are the supplied `idealLatticeCurve` and `idealAction`; the additional target is their cyclic Γ₀(N) structure and its algebraic coarse point x_(b,𝔫)∈Y₀(N)(H_c)⊂X₀(N)(H_c).

The condition on 𝔫 is the precise Heegner condition here. With gcd(c,N)=1 it is possible exactly when every ℓ|N splits or ramifies in K and every ℓ with ℓ²|N splits. In particular it covers every N whose prime divisors split, for every K, including D_K=−3,−4. There is no odd-discriminant restriction on this construction. Ramified level is also allowed in the stated cyclic-ideal range; the later analytic identities retain their own stronger hypotheses.

*Outline.* Apply CM §1.1's ideal isogeny and §1.2's degree/index comparison, then the cyclic subgroup moduli problem of ModularCurves. Tensoring an invertible ideal with O/𝔫 gives a rank-one module over that finite ring, so the kernel is cyclic of cardinal N. Algebraize the point and use CM level reciprocity: arithmetic Art_c(a) sends x_(b,𝔫) to x_(ba⁻¹,𝔫). The units in Ô× preserve the O-stable cyclic subgroup, so the action factors through Pic(O) and gives coarse H_c-rationality. No distinguished elliptic equation or universal family over the coarse curve is chosen. The automorphism group of the geometric pair is O×; its effective quotient by {±1} has size u_c. In the marked classical elliptic scope of ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, prove that this cyclic pair gives its supplied CM point, with the same oriented level ideal and inverse-ideal Artin indexing. Reuse that point there; the quotient and isogeny comparison is §8.8. Retain this group through any fine-level descent, rather than dividing a point by its order.

Its API consists of the following facts:

- cmCyclicPair_kernel, cmCyclicPair_degree and cmCyclicPair_fullEnd identify the kernel, degree and multiplier orders.
- cmCyclicPair_principal gives the canonical isomorphism after b↦αb.
- cmCyclicPair_descent gives its coarse H_c-point.
- cmCyclicPair_idealAction states the inverse-ideal Artin formula.
- cmCyclicPair_units identifies the stabilizer.
- cmCyclicPair_conjugate sends (b,𝔫) to (b̄,𝔫̄). These are constructions on actual supplied curves and their moduli point, not a chosen presentation of a Galois set.

**Checks.**

- At N=1, 𝔫=O and the isogeny is the identity. For O=ℤ[i] and O=ℤ[ω], ω²+ω+1=0, the automorphism groups still have orders 4 and 6; their effective stabilizers have orders 2 and 3.
- For O=ℤ[i], 𝔫=(2+i) has norm 5 and O/𝔫≅ℤ/5ℤ. Its cyclic kernel is generated by (2−i)/5 modulo O, and the coarse point is defined over K=H_1 even though u_1=2.
- For O=ℤ[ω], 𝔫=(2−ω) has norm 7, quotient ℤ/7ℤ and kernel generated by (3+ω)/7 modulo O. Here H_1=K and u_1=3.
- The ideal (2) has norm 4 but O/(2) has additive group (ℤ/2ℤ)²; the multiplication-by-2 isogeny is not a cyclic level-4 pair.
- At K=ℚ(i), c=3, N=1 the orbit has two classes and only two units per pair. Using the maximal-order class group or its four units gives the wrong orbit or stabilizer.
- An inert prime ℓ cannot give a cyclic norm-ℓ ideal. A ramified ℓ can occur once in N, while its square cannot occur under gcd(c,N)=1.

([Gross, Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf), §§I.1–I.4, pp.87–90, especially the lattice construction in I.2 and (4.2); [Gross–Zagier, Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), I §3 p.227 and II §1 pp.235–236, maximal-order specialization; [Cai–Shu–Tian](https://arxiv.org/abs/1408.1733v2), §1.1 pp.1–2, cyclic proper-ideal points at conductor c.)

*Needs:* ComplexMultiplicationAndExplicitReciprocity §1.1 (`idealLatticeCurve`, `idealAction`, `idealAction.picardEquiv`, `idealLatticeCurve.automorphism_factors`), §1.2 (`idealAction.degree_eq_norm`), §2.3 (`explicitLevelReciprocity`, `relativeCMModuliOrbit`) and §3.1 (`classPolynomial.ringClassField`); TauCetiRoadmap.GlobalNumberFields Layer 11; TauCetiRoadmap.ClassFieldTheory Layer 13; TauCetiRoadmap.ModularCurves Layers 2A–2E (isogenies), 3B (exact order and cyclic subgroups), 8D (Γ₀(N) cyclicity) and 9 (coarse moduli); ModularCurvesPartII §§1.1–1.5 and §3.14 (analytic and algebraic comparison). ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, for the shared marked CM point in its scope.

### 0a.3 Optimal embeddings and the cyclic-level dictionary

For K,O_c,c,N as in 0a.2, put R₀(N)={M∈M₂(ℤ):N|M₂₁}. Define cmOptimalEmbedding to be a unital embedding ι:O_c↪R₀(N) that is optimal, meaning ι(K)∩R₀(N)=ι(O_c), together with the selected complex CM type. Quotient by Γ₀(N)-conjugacy, retaining the stabilizer group before passing to classes. Prove cmOptimalEmbedding_cyclicPair: these oriented embedding classes correspond to the cyclic CM pairs of 0a.2, with full order O_c at both endpoints. The gcd(c,N)=1 hypothesis is retained in this endpoint-order comparison; an arbitrary optimal embedding at conductor-dividing level does not supply it.

*Outline.* On an oriented basis (b₁,b₂) of b with 𝔫⁻¹b=ℤb₁+ℤ(b₂/N), record multiplication by α in row convention: αb₁=a b₁+b b₂ and αb₂=c b₁+d b₂. Preservation of the second lattice is exactly N|c. Its matrix fixes τ=b₁/b₂ in the upper half-plane. The intersection with K is the endomorphism order of the pair. Conversely the upper-half-plane fixed point of the oriented field embedding recovers the two lattices, and optimality together with gcd(c,N)=1 identifies both multiplier orders with O_c. Integral lattices supplies the underlying proper-ideal/binary-form classification; only the Γ₀(N) level adapter is additional here. At fixed 𝔫 the Pic(O_c) action is simply transitive. If all primes of N split, there are 2^s choices of 𝔫 and 2^s #Pic(O_c) points, with s=# {ℓ:ℓ|N}; the stabilizers do not divide this coarse point count.

Its API consists of the following facts:

- cmOptimalEmbedding_toPoint, cmOptimalEmbedding_ofPair and cmOptimalEmbedding_cyclicPair give the correspondence and its inverse laws.
- cmOptimalEmbedding_stabilizer identifies O_c×.
- cmOptimalEmbedding_idealAction and cmOptimalEmbedding_conjugate transport the two arithmetic actions of 0a.2. The Atkin–Lehner action is compared in 0.12.

**Checks.**

- In the Gaussian level-5 example, b₁=−1 and b₂=−2+i give ι(i)=((2,−1),(5,−2)), whose square is −I and whose determinant is 1. It belongs to R₀(5); replacing the level condition by 5|M₁₂ rejects this chosen embedding.
- In the Eisenstein level-7 example, b₁=−1 and b₂=3+ω give M=ι(ω)=((−3,−1),(7,2)), with M²+M+I=0 and det M=1. Both extra-unit embeddings remain admissible.
- At N=1 this recovers the imported oriented proper-ideal classification, with no additional level orientation.
- For K=ℚ(i), c=3, embedding the full ℤ[i] and merely restricting its source to O_3 is not optimal in M₂(ℤ). The multiplier-order requirement rejects it.
- At a split prime ℓ, the two norm-ℓ ideals give different cyclic subgroups; at a ramified prime there is only one. The 2^s count is restricted to the split case.

([Gross, Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf), §§I.1–I.3, pp.87–89, lattice and quadratic-equation descriptions; [Gross–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), II §1, (1.3)–(1.5), pp.235–236. The embedding dictionary follows by the displayed multiplication matrices.)

*Needs:* [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant); TauCetiRoadmap.IntegralLattices B2 (forms and ideal classes) and B5 (reduction of forms); ComplexMultiplicationAndExplicitReciprocity §1.2 (`quadraticFormsCMComparison`); Mathlib `Matrix`, `Matrix.det`; ModularCurvesPartII §§1.1–1.5.

### 0a.4 Quaternionic CM points, levels and canonical-model descent

Let F be any totally real field, E/F CM quadratic and B/F a quaternion algebra split at exactly one real place τ. Fix an embedding E↪B, one of its two fixed points z∈H^±, and a compact open U⊂B_f×. Define `quaternionCMPoint(E↪B,z,g,U)` as the point [z,g] of the existing canonical quaternionic curve, for g∈B_f×. This is the specialization of the supplied special-pair point map, not another construction of the curve or of general Shimura reciprocity. Let (T,h_z) be its torus subdatum, with reflex field E in the chosen embedding and the existing multiplicative reflex norm r_z. In arithmetic Artin convention its action is

x^(Art_E(s))=[z,ι(r_z(s)⁻¹)g].

Prove quaternionCMPoint_stabilizer: its field over E is the finite abelian class field cut out by the open stabilizer of this action; equivalently ι(r_z(s))∈ι(E×)gUg⁻¹. Inversion does not change that subgroup. For U=R̂×, the embedded order at g is O_g=E∩gR̂g⁻¹ and E_f×∩gUg⁻¹=Ô_g×. Keep the reflex norm in the field formula; do not replace this stabilizer by an unspecified ring-class quotient. The finite-level construction is compatible with U′⊂U and with right Hecke translation, and is available over E^ab without a fine-level assumption. Rational central kernels and noncentral elliptic stabilizers are those of the supplied canonical curve.

quaternionCMPoint_translationReciprocity computes the comparison with right translation. For the reference point [z,1], identify its torus with Res_(E/ℚ)G_m using the chosen embedding. The single active cocharacter makes r_z an isomorphism of these tori (with the reflex-field embedding specified). Put a_z(t)=r_z⁻¹(t⁻¹) and σ_z(t)=Art_E(a_z(t)); then [z,t]=[z,1]^(σ_z(t)). At [z,g], use the conjugated right torus g⁻¹ι(E_f×)g. Thus a character χ_G of the Galois action pulls back to χ_T=χ_G∘σ_z on the actual Hecke torus. The formula remains in terms of r_z; an identification of t itself with an arithmetic Artin lift requires this cocharacter computation, and is not assumed.

quaternionCMPoint_modularComparison identifies F=ℚ, B=M₂(ℚ), U=R₀(N)̂× and the optimal order O_c with 0a.2–0a.3, including the inverse-ideal Artin action and the coarse H_c-field. The totally definite case uses the existing finite quaternionic class set rather than a curve: definiteCMOrbitComparison specializes E_f×→B_f×→B×\B_f×/(U A_(F,f)×), with its specified central quotient. It supplies the definite CM evaluations in 6.75, without claiming that a class-set orbit is itself an elliptic moduli problem.

*Outline.* Insert the actual torus subdatum into ShimuraVarieties §§4.2–4.4 and §8.5. Its unique active embedding gives reflex field E, as the analogous cocharacter computation gives τ(F) for the ambient curve. Convert the supplier's geometric Artin formula by s↦s⁻¹. Equality of [z,g] and [z,ι(r_z(s))g] means that a rational element fixing z lies in the embedded E×, giving the stated stabilizer. Apply the earlier class-field correspondence to its open idele-class subgroup. For order-unit levels intersect with E_f× to recover the local multiplier order. In the split rational case compare the actual two lattices, not just their j-values. For a definite class set use its double-coset map and record its possibly larger rational stabilizer: t fixes [g] exactly when ι(t)∈B×g(U A_(F,f)×)g⁻¹. If a central-character calculation uses the unquotiented double-coset set instead, retain U in this formula and compare its central fibres separately. No E×-centralizer simplification is asserted there. In the quaternionic elliptic scope of ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, identify this canonical-model point with its marked CM point using the same embedding, fixed point and finite level. The marked elliptic divisor and image remain the supplied ones; §8.8 compares their basepoint and quotient normalizations.

Its API consists of the following facts:

- quaternionCMPoint is the canonical-model point.
- quaternionCMPoint_reciprocity, quaternionCMPoint_stabilizer, quaternionCMPoint_changeLevel, quaternionCMPoint_hecke, quaternionCMPoint_translationReciprocity and quaternionCMPoint_modularComparison expose the action, field, level maps, translations and modular comparison. definiteCMOrbitComparison records the finite-set evaluation map and its actual fibres.
- its existence does not imply injectivity or a free Picard action.

**Checks.**

- For F=ℚ and B=M₂(ℚ), the Gaussian level-5 and Eisenstein level-7 examples give the same coarse points as 0a.2, including stabilizers 4 and 6 before removing {±1}.
- For an order-three Artin element, inversion changes the action on the lattice index; it cannot be tested using only the trivial or a quadratic character. The 𝔽₇ witness in 0a.1 applies.
- For U′=U the level map is identity; for U′⊂U the stabilizer at U′ is contained in that at U, so the point field at finer level contains the coarser one.
- A totally definite B has no H^± fixed-point curve. Its finite double-coset CM map may identify ideal classes and has its own stabilizer; it is not asserted to be a Picard torsor.
- At a non-neat level the coarse point still descends, while a universal family on that coarse curve is not supplied. A rational Hodge class or a rational parametrization is additional Layer 3 data.

([Cai–Shu–Tian](https://arxiv.org/abs/1408.1733v2), §1.2 pp.4–6, especially the fixed-point locus and reciprocity construction on p.6, and §1.1 pp.2–3 for the definite class-set CM evaluation. The canonical-model action is the earlier ShimuraVarieties §§4.1–4.4 contract, specialized to the actual quaternionic torus subdatum.)

*Needs:* HilbertModularVarietiesAndShimuraCurves §R18.1.3 (QuaternionicShimuraCurve, quaternionicCurve_complex, quaternionicCurve_splitQ), §R18.1.4 (quaternionicEffectiveStabilizers) and §R18.3.1 (DefiniteClassSet); ShimuraVarieties §§4.1–4.4 (`geometricArtin`, `ReflexNorm`, `CanonicalModel.special_rational`, `CanonicalModel.special_action`), §8.5 (datum functoriality); TauCetiRoadmap.ClassFieldTheory Layer 12; [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant); [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary). ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, for the shared marked CM point in its scope.

### 0a.5 From CM moduli points to level triples

For a supplied PEL datum at neat level, an actual CM point x over a number field L and a specified rank-one eigensummand ℓ of its invariant cotangent space, define cmLevelTriple(x,ℓ,ω) by pulling back the supplied universal abelian scheme, its polarization, action and level, and adjoining a nonzero ω∈ℓ. Prove cmLevelTriple_forget and cmLevelTriple_reciprocity: forgetting ω recovers x, and Galois base change of the entire tuple agrees with the canonical-model CM action. The differential itself is extra data and need not be fixed by the point's stabilizer. At arbitrary level make this construction on a neat cover or the existing moduli stack; only invariant data descend to its coarse space. This target specializes the existing universal-family and Hodge-bundle APIs; it constructs neither another moduli problem nor a canonical differential.

cmFalseEllipticTriple is the particular comparison required by Brooks. Take F=ℚ, B indefinite of discriminant N⁻>1 (a squarefree product of an even number of primes), a maximal order O_B with Brooks's positive involution and polarization datum, an optimal normalized O_K-embedding in the Eichler order of level N⁺ prime to N⁻, and its fixed point τ. Use the complex surface A_τ=ℂ²/O_B(τ,1), with O_B acting on the left and K on the right, and the principal polarization of Brooks Proposition 2.3. Prove that it is the false elliptic moduli point underlying 0a.4. Choose Brooks's V₁(N⁺) level by a point P=eP of exact order N⁺ in the corresponding CM-isogeny kernel, and choose nonzero ω in the rank-one summand eΩ¹_A after the auxiliary coefficient extension splitting O_B. A chosen primitive N⁺-th root of unity identifies this level with the μ-level convention of Brooks §8.3. For N⁺>3 the source's fine moduli scheme and universal surface apply; at smaller levels retain a neat auxiliary cover and its descent data, chosen prime to p in a p-adic specialization. The coarse CM point's field does not by itself define this fine-level tuple. In the maximal-order Heegner setting the level can be taken over the ray class field of modulus N⁺; extend further for the splitting coefficients and chosen ω. Brooks's later choice of ω over H is additional specified data on his H-model, not a deduction for every fine triple.

For integral O_K-ideals a prime to the chosen level and auxiliary primes, cmLevelTriple_idealTransport uses the actual isogeny φ_a:A→A/A[a], transports P by φ_a, and chooses ω_a by φ_a^*ω_a=ω. Its degree is (Na)² on the false elliptic surface; the Morita rank-one kernel has order Na. The same construction has degree Na on the elliptic specialization. Keep ideal representatives and their principal-ideal covariance: under the normalized identification for a=(α), P maps to αP and ω maps to α⁻¹ω. A chosen differential and fine level do not form a free Picard torsor. The Hecke-character weights and modular-form homogeneity that make character sums independent of ideal representatives belong to the CM sums of Layer 9, not to this construction.

*Outline.* Pull back PELModuli M2.9 and M6.9 along the specified classifying point and apply M4.1's CM reciprocity, converting its geometric Artin convention as in 0a.4. For the rational quaternionic comparison, use Brooks §§2.1–2.5: right multiplication by J_τ supplies the complex structure on (B⊗ℝ)/O_B, the trace form supplies the polarization, and O_B·a supplies the isogeny lattice. Compare its adelic level and fixed point with 0a.4. Its real dimension is four, hence its complex dimension is two. The index [O_B:O_B a]=(Na)² proves the degree; the idempotent gives the rank-one factor. In characteristic zero, pullback by the isogeny is an isomorphism on invariant differentials. On a non-neat quotient descend the tuple on the stack; use the actual inertia action on ω rather than averaging a chosen vector. The auxiliary PEL realization in R18.2 need not have dimension two, and is not identified with this surface merely because both parametrize a quaternionic curve.

Its API consists of the following facts:

- cmLevelTriple_forget, cmLevelTriple_baseChange, cmLevelTriple_reciprocity and cmLevelTriple_levelPullback compare actual fibres and actions.
- cmFalseEllipticTriple_uniformization identifies Brooks's surface and level with its curve point.
- cmLevelTriple_idealTransport, cmLevelTriple_principal and cmLevelTriple_differentialScale expose isogenies, principal covariance and the rule f(A,P,bω)=b^(−k)f(A,P,ω) for a weight-k form.

**Checks.**

- For the unit ideal the isogeny, level transport and differential transport are identities. For a=(2) prime to the level, Na=4 and the false surface map [2] has degree 16; its Morita factor has order 4, while an elliptic [2] has degree 4.
- Replacing ω by 2ω scales a weight-two value by 1/4 and its square by 1/16. Pulling a target differential back by [2] multiplies it by 2, so the transported differential is ω/2, not 2ω.
- At a coarse point with automorphism [−1], the differential is multiplied by −1. Thus that point alone does not supply a nonzero differential on a universal family over the coarse curve; fine level or stack data are essential, including for K=ℚ(i), ℚ(√−3).
- At N⁺=1 a coarse CM point may already be H-rational, while auxiliary fine level can enlarge its field. At N⁺>3 the specified V₁-level removes the source's automorphism obstruction; no equality between ray and ring-class fields is asserted.
- The surface has complex dimension two. An auxiliary regular-representation PEL variety of dimension four cannot be substituted without a separate comparison.

([Brooks, Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §§2.1–2.5 pp.4182–4188, Theorem 2.2 p.4185 and Proposition 2.3 pp.4185–4186; §8.3 p.4233 for triples and transport; §8.4 p.4236 for the chosen H-differential and its periods. General PEL fibres, CM reciprocity and stack descent are imported from the named supplier targets.)

*Needs:* [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent); PELModuli M1.13 (heckeTranslate), M2.8–M2.9 (`representability`, `universal`), M4.1 (cmReciprocity), M6.2 (arbitraryLevelStack) and M6.9 (hodgeBundle, `hodgeLine`); AbelianSchemesAndArithmeticModuli A1 (`relative-invariant-forms`) and A6 (invariant differentials and isogeny degrees); ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2 (the elliptic ideal-isogeny specialization).

### Examples

The identity level, the split Gaussian level 5 and the split Eisenstein level 7 give CM points with all their unit stabilizers. The conductor-3 Gaussian order separates the order Picard group from the maximal-order class group. At class number three conjugation inverts a nontrivial class; at class number one the ring-class extension over K is trivial but the quadratic extension over ℚ remains. Quaternionic curve points and definite CM evaluations have different stabilizers. Their abelian moduli fibres, fine levels and nonzero differentials remain distinct data; the false elliptic fibre has dimension two.

### Dependencies

GlobalNumberFields Layer 11; ClassFieldTheory Layers 11–13; ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, 2.3 and 3.1; ImaginaryQuadraticClassNumber H1.4; IntegralLattices B2 and B5; ModularCurves' cyclic-kernel and coarse-moduli constructions; ModularCurvesPartII §§1.1–1.5, 3.14; ShimuraVarieties §§4.1–4.4 and 8.5; HilbertModularVarietiesAndShimuraCurves R18.1 and its definite class sets; PELModuli M1–M2, M4.1, M6.2 and M6.9 for universal fibres and descent. No height, modular parametrization, Kummer map or Euler-system relation is used in this layer.

## Layer 0: Normalization and character conventions

Fix the dictionary before any analytic or arithmetic identity is transported. The maps below keep track of absolute versus relative fields, character inverses, scalar periods and the normalization of a polarized height.

### 0.1 The dictionary of height conventions

Fix the relation between Tau Ceti's elliptic height and the normalizations of the sources. In Tau Ceti, `canonicalHeight` is the x-height h_x, its `neronTatePairing` is B_x and its `regulator` is the absolute Gram determinant of B_x. HeightsRationalPointsAndObstructions §0.19 gives h_x=2h_(O) (the Néron–Tate height of O_E(O) is half of `canonicalHeight`), and its §0.21 gives B_x(P,Q)=h_(O)(P+Q)−h_(O)(P)−h_(O)(Q) (its symmetric form for O(O) is `neronTatePairing`); both are used as they stand. Prove that for a basis of a rank-r Mordell–Weil lattice the Gram determinant formed from the half polar form ½(h_(O)(P+Q)−h_(O)(P)−h_(O)(Q)) of h_(O) is 2^(−r) times `regulator`, and the field bookkeeping below. Relative height over a number field F uses the local-degree weights and has total weight [F:ℚ]; absolute height divides by that degree. The extension comparison is stated only after fixing the compatible places of HeightsRationalPointsAndObstructions §0.12. This target fixes normalizations; it adds no second canonical height or regulator.

*Outline.* Import h_x=2h_(O) and the form identity from HeightsRationalPointsAndObstructions §§0.19 and 0.21. Compute the Gram determinants with `regulator_eq_abs_det_neronTateGramMatrix` and `Matrix.det_smul`. Use Mathlib NumberField.instAdmissibleAbsValues and totalWeight_eq_finrank. Apply the compatible-place finite-extension comparison of HeightsRationalPointsAndObstructions §0.12 before changing the field of a displayed height. Transport the existing quadraticity, torsion, symmetry and Gram-congruence APIs to the stated normalization. On the free quotient require Module.Finite; strict positivity and the zero-height converse require Northcott.

**Checks.**

- h_(O)(0)=0 and `canonicalHeight 0 = 0`.
- `canonicalHeight (2 • P) = 4 * canonicalHeight P`, and h_(O)(2P)=4h_(O)(P): both heights are quadratic.
- `neronTatePairing W P P = canonicalHeight P`: the half polar form on the diagonal is the height itself, not twice it.
- `neronTatePairing W (2 • P) P = 2 * canonicalHeight P`.
- Under Northcott finiteness, a point P of infinite order has h_(O)(P) ≠ `canonicalHeight P`: the positive heights differ by the factor 2.
- In rank 0 both regulators are 1 (`regulator_eq_one_of_finrank_eq_zero`).
- In rank 1 the Gram determinant formed from the half polar form ½(h_(O)(P+Q)−h_(O)(P)−h_(O)(Q)) of h_(O) is half of `regulator`; for 37.a1 with generator (0,0), `regulator` is the LMFDB value 0.0511114082…, so h_(O)(0,0)=0.0255557041….
- Changing an integral basis by a unimodular matrix preserves the absolute Gram determinant; a non-unimodular index-d sublattice multiplies it by d².

*Consequences.* No consumer infers a factor of 2 from the name 'Néron–Tate': every formula states whether it uses h_(O), h_x (Tau Ceti's `canonicalHeight`) or B_x (Tau Ceti's `neronTatePairing`). A BSD consumer that forms its regulator from h_(O) is off by 2^r; in rank 1 this is a factor of 2 in the 2-part of Ш.

([Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), §3, p. 3, and Remark 3.1, p. 4 (arXiv v2); [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), elliptic curve 37.a1: Mordell–Weil generator, BSD invariants and their normalization conventions (accessed 2026-10-10).)

*Needs:* Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`, Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`, Tau Ceti `WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, Mathlib `Matrix.det_smul`, Mathlib NumberField.instAdmissibleAbsValues, Mathlib NumberField.totalWeight_eq_finrank, `HeightsRationalPointsAndObstructions:§§0.12, 0.16, 0.19, 0.21`.

### 0.2 The canonical height on E(K) ⊗ ℚ

For rational scalar denominators m≠0, the canonical x-height h_x (Tau Ceti's `canonicalHeight`) extends uniquely to a quadratic form h_ℚ on the ℚ-vector space ℚ ⊗_ℤ E(K), written scalar first as in the Lean carrier, with h_ℚ(q ⊗ P) = q²·h_x(P); torsion goes to zero. Later layers write the same space E(K) ⊗ ℚ, identified with it by `TensorProduct.comm`. The same holds for h_(O)=h_x/2 and for the pairings B_x and ½B_x. Equivalently, the restriction of h_ℚ along P ↦ 1 ⊗ P is Tau Ceti's `canonicalHeightQuadratic`. Averages of points, such as a normalised average of a Galois orbit, live here.

Assume K is a field with admissible absolute values and decidable equality, and W is an elliptic Weierstrass curve over K. The headline `canonicalHeightRat_exists_unique` asserts a unique q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ with q(1 ⊗ P)=P.canonicalHeight. Use Mathlib `TensorProduct.leftModule` on this scalar-first carrier. Transport through `TensorProduct.comm` to the point-first notation E(K) ⊗ ℚ of later layers; the transported ℚ-action is part of that convention.

*Outline.* h_x is a ℤ-quadratic map W.Point → ℝ (canonicalHeightQuadratic) and ℝ is a ℚ-vector space; a ℤ-quadratic map into a ℚ-vector space extends uniquely along M → M ⊗ ℚ, because M ⊗ ℚ is the localisation of M at the nonzero integers and h_x(nP) = n²h_x(P) forces the value on P ⊗ (1/n). Torsion maps to zero in M ⊗ ℚ, consistently with h_x vanishing on torsion.

Its API consists of the following facts:

- The rational extension is a ℚ-quadratic map with value q²·P.canonicalHeight on q ⊗ P.
- Its value on a pure tensor is the rational scalar squared times the original height.
- Agreement on 1 ⊗ P determines the extension uniquely.
- The rational extension is nonnegative.

**Checks.**

- For a nonzero integer m, h_ℚ((1/m) ⊗ P)=h_x(P)/m²; at m=2 the value is h_x(P)/4.
- For torsion P, h_ℚ(1 ⊗ P)=0, since the tensor itself is zero.
- At scalar 1, h_ℚ(1 ⊗ P)=h_x(P).
- Under Northcott finiteness, an infinite-order P has h_x(P)>0 and h_ℚ(2 ⊗ P)=4h_x(P)≠2h_x(P); a linear extension fails this test.

*Consequences.* In the point-first notation, h_ℚ(P ⊗ (1/m)) = h_ℚ((1/m) ⊗ P) = h_x(P)/m².

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1, after Theorem 1.1, p. 2 (arXiv v2).)

*Needs:* Tau Ceti `WeierstrassCurve.Affine.canonicalHeightQuadratic`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, Mathlib `QuadraticMap`, Mathlib `TensorProduct`, Mathlib `QuadraticMap.map_smul`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_nonneg`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (under `Northcott`).

### 0.3 The motivic centre s = 1 and the unitary centre s = 1/2

Transport the unitary GL₂ Rankin function to the weight-two motivic variable by L_mot(s)=L_unit(s−1/2). Their central points are 1 and 1/2 respectively, and the derivative is unchanged by this translation. For a motivic completion λ(s)=N^(s/2)Γ_ℂ(s)L_mot(s), N>0, and a central zero L_mot(1)=0, the derivative is λ′(1)=√N L_mot′(1)/π. The derivative of the completion factor contributes no term because L_mot(1)=0. Here Γ_ℂ is Mathlib's existing factor 2(2π)^(−s)Γ(s); with its half-factor convention the displayed derivative constant is halved.

Prove this product-rule comparison for any complex function L differentiable at 1, under N>0 and L(1)=0; it constructs no arithmetic L-function. Tau Ceti's completed L-function of a cusp form, `CuspForm.frickeCompletedL f N` (equal to N^(s/2)(2π)^(−s)Γ(s)L(f,s) by `CuspForm.frickeCompletedL_eq_cpow_mul_Λ`), uses the half-factor convention: it is λ/2, and at a central zero of L(f,·) in weight two its derivative at s=1 is √N L′(f,1)/(2π).

Assume N > 0 and L differentiable at 1 with L(1) = 0.

*Outline.* The shift s ↦ s + 1/2 has derivative 1. Product rule (deriv_mul) at a zero of L: (G·L)′(1) = G(1)·L′(1) + G′(1)·L(1) = G(1)·L′(1). G(1) = N^(1/2)·Γ_ℂ(1) = N^(1/2)·2(2π)^(−1)Γ(1) = N^(1/2)/π (Complex.Gammaℂ_def, Complex.Gamma_one).

*Consequences.* The factor 2 between Γ_ℂ and (2π)^(−s)Γ(s) is a convention and must be written, not absorbed. Cai–Shu–Tian write L_v(s, A, M) = L(s − 1/2, π_v) at finite places, and the complete L(s, π_A) includes the archimedean factors.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 4 (arXiv v2).)

*Needs:* Mathlib `Complex.Gammaℂ`, Mathlib `Complex.Gammaℂ_def`, Mathlib `Complex.Gamma_one`, Mathlib `deriv_mul`, Mathlib `HasDerivAt.mul`.

### 0.4 The unit index u

Define u(K)=NumberField.Units.torsionOrder(K)/2 in ℚ for any number field K. Its interpretation as the index of the full unit group modulo {±1}, and the classification below, require K imaginary quadratic. For a real quadratic field the full unit group is infinite.

Define the effective CM stabilizer u=#(O_K×/{±1}) for an imaginary quadratic field K. With w=NumberField.Units.torsionOrder(K), the intended scalar is w/2, and 2u=w. TauCetiRoadmap.ImaginaryQuadraticClassNumber H1.2 counts the units: six at discriminant −3, four at −4 and two otherwise. Hence u=3, u=2 and u=1 respectively. For a nonmaximal order use its own unit group. This explains the u² denominators in height identities without replacing u by the full automorphism count w.

Assume K imaginary quadratic.

*Outline.* An imaginary quadratic field has unit rank zero, so mem_torsion identifies its unit group with the torsion subgroup, of order w=torsionOrder K. ImaginaryQuadraticClassNumber H1.2 gives w=6, 4 or 2 according as the discriminant is −3, −4 or neither. The subgroup {±1} has order 2, so its index is w/2. Apply this to the Gaussian, Eisenstein and discriminant −7 tests.

Its API consists of the following facts:

- u(K) := NumberField.Units.torsionOrder K / 2 for K imaginary quadratic.
- 2 * u(K) = torsionOrder K.
- for K totally complex of degree 2, u(K) is 3, 2 or 1 according as disc K is −3, −4 or neither; in particular u(K) = 1 unless K is ℚ(√−3) or ℚ(√−1).

**Checks.**

- u(ℚ(√−1)) = 2.
- u(ℚ(√−3)) = 3.
- u(ℚ(√−7)) = 1.
- For every imaginary quadratic K, u(K)≠torsionOrder K; compare Conrad’s inconsistent p.69 and p.119 uses explicitly.

*Consequences.* Conrad's §1 defines u_x as #μ(K) itself, but his §9 uses u_x ∈ {1, 2, 3}; the Gross–Zagier constant needs #μ(K)/2 (the stabilizer normalization).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1, Theorem 1.1, p. 2 (arXiv v2); [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §1, 'Some conventions', p. 69; with u equal to half the full automorphism count; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Published Invent. Math. 84 (1986), Chapter I, §6, p.230.)

*Needs:* Mathlib `NumberField.Units.torsionOrder`, Mathlib `NumberField.Units.mem_torsion`, TauCetiRoadmap.ImaginaryQuadraticClassNumber H1.2 (the unit count of an imaginary quadratic field).

### 0.5 The Artin-map convention and the Galois action on Heegner points

Compare arithmetic reciprocity with geometric reciprocity by inversion in Gal(H/K), for the Hilbert class field H of an imaginary quadratic K. Fix CM points indexed by ([b],𝔫), representing ℂ/b→ℂ/𝔫^(-1)b. The arithmetic Artin element of [a] sends this index to ([b][a]^(-1),𝔫). Consequently every character-indexed formula must invert its character when transported to geometric reciprocity. An order-three character distinguishes the conventions; a quadratic character does not.

Assume K imaginary quadratic with Hilbert class field H; a primitive norm-N ideal 𝔫 has O_K/𝔫≅ℤ/Nℤ. Use 0a.2 at c=1, including D_K=−3,−4 and its full unit stabilizer. This target compares the two reciprocity conventions on that supplied cyclic pair; it defines no second CM point.

*Outline.* The two reciprocity maps Cl_K → Gal(H/K) differ by inversion, by definition. The action on Heegner points is Conrad's statement, p. 69, which he derives from the analytic description C/b → C/n⁻¹b.

*Interface.* Apply cmCyclicPair_idealAction from 0a.2 and `classPolynomial.galois` from CM §3.1 to the same proper-ideal indexing. cmArtinConvention_compare identifies geometric Artin action at a with arithmetic Artin action at a⁻¹. Character inversion is transported through this equality, including the dual character in a height pairing.

**Checks.**

- For N=1 the pair is the identity and the extra automorphisms at D=−3 survive.
- For D=−4 and an admissible split N the pair still defines a coarse H-point; no division by its automorphism order defines the point.
- An order-three ideal class character distinguishes a from a^(-1); a quadratic character does not.
- A nonprimitive ideal with noncyclic quotient fails the cyclic-level hypothesis even if its norm is N.

*Consequences.* The action and character inversion use the same reciprocity convention.

([Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §1, 'Some conventions', p. 69.)

*Needs:* Mathlib `IsGalois`, TauCetiRoadmap.ClassFieldTheory (the Artin map of the Hilbert class field), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), ComplexMultiplicationAndExplicitReciprocity §1.1 (`idealAction`, `idealAction.picardEquiv`), ComplexMultiplicationAndExplicitReciprocity §3.1 (`classPolynomial.galois`, `classPolynomial.ringClassField`), ComplexMultiplicationAndExplicitReciprocity §2.3 (`explicitLevelReciprocity`).

### 0.6 Full real period, identity-component period and c∞

Compare the identity-component period appearing in a source formula with the full real period Ω fixed in the conventions. If Ω⁰=∫_(E(ℝ)⁰)|ω| for the fixed minimal Néron differential, then Ω=c_∞Ω⁰. Translation identifies the component integrals. The comparison therefore moves the component factor into or out of the analytic constant exactly once. On 37.a1, Δ=37>0 and Ω=2Ω⁰; a negative-discriminant curve gives Ω=Ω⁰.

Assume E/ℚ; minimal model; Δ ≠ 0.

*Outline.* E(ℝ) has two components exactly when the cubic 4x³ + b₂x² + 2b₄x + b₆ has three real roots, i.e. Δ > 0. The integral over E(ℝ) is the sum over its components, which have equal ∫|ω| because translation by a point of the non-identity component preserves |ω|.

*Consequences.* 37.a1 has Δ = 37 > 0, so c∞ = 2, and the LMFDB real period 5.9869172924… is the full period Ω = 2Ω⁰.

([The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), 37.a1 curve page, Mordell–Weil generators and BSD invariants/computation conventions (accessed2026-10-10).)

*Needs:* Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.b₂`, Mathlib `Real.sqrt`, Mathlib `MeasureTheory.lintegral`, TauCetiRoadmap.EllipticCurves Layer 7.

### 0.7 Base-change signs and measure comparison

Compare the base-change and Rankin-over-F local signs for a CM quadratic K/F with quadratic character η and ω_πχ|A_F×=1. They satisfy ε_RS,v=η_v(−1)ε_BC,v, while the toric criterion is ε_BC,v=χ_v(−1)ε(B_v). Normalize the specified torus quotient measure to probability by dividing it by 2L(1,η), with completed L as in the global identity. A product of two probability periods is the raw product divided by 4L(1,η)². The Petersson measure on the quaternion quotient has Tamagawa volume 2 and is compared separately.

Assume F is totally real. K/F is CM quadratic; fixed additive characters and self-dual measures. The product torus measure is the specified quotient measure, not an asserted Tamagawa measure.

Define the Langlands constant of the quadratic extension K_v/F_v by λ_(K_v/F_v)(ψ_v) := ε_F(Ind_(K_v/F_v)1, ψ_v)/ε_K(1, ψ_v∘Tr), and prove λ_(K_v/F_v)(ψ_v)² = η_v(−1).

*Outline.* Let σ_v be the two-dimensional Weil–Deligne parameter supplied by AL.4/local-parameter-comparison. ArithmeticGaloisRepresentations §2.7 supplies the ε-factor of a Weil–Deligne representation with its monodromy factor det(−r(F)|V^I/(ker N)^I) and inductivity in degree zero for Weil representations; it does not supply λ or its square, which are proved here. Since Ind 1 = 1 ⊕ η_v, λ = ε_F(1,ψ_v)ε_F(η_v,ψ_v)/ε_K(1,ψ_v∘Tr), and the character identity ε(μ,ψ)ε(μ^(-1),ψ)=μ(−1), applied to 1 over F, 1 over K and η_v=η_v^(-1), gives λ² = 1·η_v(−1)/1 = η_v(−1), including at dyadic places; at a split place K_v = F_v × F_v and λ = 1. For a Weil parameter σ_v, inductivity in degree zero applied to the degree-zero virtual representation (σ_v|_(K_v)⊗χ_v) − 2·1 gives ε_F(σ_v⊗Ind χ_v,ψ_v)=λ_(K_v/F_v)(ψ_v)^2 ε_K(σ_v|_(K_v)⊗χ_v,ψ_v∘Tr). For a Steinberg parameter σ_v = sp(2)⊗μ_v, both sides acquire a monodromy factor, and this target proves that they agree: σ_v⊗Ind χ_v = Ind(sp(2)⊗μ_Kχ_v) with μ_K = μ_v∘N, the space V^I/(ker N)^I is the inertia invariants of the twisted character in both cases, and the determinant of −Frobenius on it is the same over F_v and over K_v (when K_v/F_v is unramified, Frob_F acts on the two-dimensional invariants of the induced character with determinant −μ_Kχ_v(ϖ_K) up to the common twist, and Frob_K = Frob_F²; when it is ramified the invariants are one-dimensional and Frob_F restricts to Frob_K). Determinants and conductor terms use the same ψ_v on both sides. This target owns that quadratic-induction specialization (author erratum item 5), rather than importing it from a GL₂×GL₁ Rankin theorem. Divide each period by the quotient volume; the two period factors account for 4L(1,η)². Keep the independent Petersson volume in every local-to-global pairing.

Its API consists of the following facts:

- quadraticBaseChangeSign is the ε_K sign with ψ_v∘Tr.
- quadraticInductionSign compares it with ε_F by λ².
- quadraticBaseChangeSign_split has factor 1.
- torusProbability_period divides by 2L(1,η).
- torusProbability_doublePeriod divides by its square.

**Checks.**

- At a split place η_v=1 and the correction is 1.
- At a real CM place η_v(−1)=−1, so omitting λ² reverses the criterion; λ_(ℂ/ℝ)(ψ) is ±i, whose square −1 is η_v(−1) for η_v the sign character.
- At an unramified K_v/F_v with ψ_v of conductor O_(F_v), all three ε-factors in λ are 1, so λ=1, and η_v(−1)=1 because −1 is a unit and η_v is unramified.
- Two raw periods of the constant function 1 become probability product 1, not 2L(1,η).
- A dyadic ramified extension still uses the quadratic λ identity; an unramified conductor formula alone is insufficient.

*Consequences.* A place with ηv(−1)=−1 changes the Rankin sign but not the base-change criterion. Probability and quotient period products differ by exactly 4L(1,η)².

([Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items 4, 5, 10, 13, 15.)

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`, ArithmeticGaloisRepresentations §2.7 (ε-factors of Weil–Deligne representations with their monodromy factor, inductivity in degree zero for Weil representations), MetaplecticAutomorphicForms §6.1.

### 0.8 Genus-character factorization

For a normalized weight-2k newform f of level N prime to the quadratic discriminant D, define the genus-character Rankin combination L_K(f,χ,s)=∑_Aχ(A)L_A(f,s). If D=D₁D₂ is its fundamental discriminant factorization and χ=χ_(D₁D₂), prove L_K(f,χ,s)=L(f,ε_(D₁),s)L(f,ε_(D₂),s). The ideal-class convolution before restoring its Rankin factor contains L^((N))(2s−2k+1,ε_D)^(-1). This is the factor compatible with weight 2k and the local Satake products α_pβ_p=p^(2k−1) for p∤N, and 0 for p∣N.

Assume the classical Rankin data (C).

*Outline.* Use AnalyticNumberTheoryPartI §§2.10 and 2.25 for the genus-character classification and its ideal-character L-factorization. Compare the four local Satake products of the newform with its two quadratic twists, including discriminant and level primes; restore the Rankin convolution factor with exponent 2s−2k+1. Continue from the common absolute-convergence half-plane using AutomorphicLFunctionsAndLocalFactors AL.3.

Its API consists of the following facts:

- The finite class-character combination is linear in the ideal-class Rankin functions.
- For the supplied genus character it equals the product of the two quadratic twists, in the same motivic variable.
- The ideal-class convolution uses the reciprocal level-deleted factor at 2s−2k+1 before restoration.

**Checks.**

- For D=−7 at the split prime 2 away from N, the first coefficient of the twist product is a₂(1+1)=2a₂, matching the two norm-2 ideals.
- At an inert prime away from ND, the degree-one coefficient is a_p(1−1)=0; inserting a split-prime coefficient there fails.
- At k=1 the convolution exponent is 2s−1 and at k=2 it is 2s−3. At s=k both give 1; using 2s−1 in every weight gives 3 in the second case.


([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, introduction, (0.3)–(0.4), p. 268.)

*Needs:* AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 0.9 Trace versus normalised average of a Galois orbit

Fix H/K, a finite Galois extension of degree h and P ∈ E(H). The trace Tr(P) = Σ_(σ ∈ Gal(H/K)) σP lies in E(K), and the normalised average Av(P) = (1/h)·Tr(P) lies in E(K) ⊗ ℚ. Prove that ĥ_ℚ(Av(P)) = ĥ(Tr P)/h², and the same factor relates any pairing of averages to the pairing of traces. A formula written with averages and one written with traces differ by h² in every height.

Assume H/K Galois of degree h; the heights over H and over K are compared by the same normalisation.

*Outline.* Av(P) = Tr(P) ⊗ (1/h), and [0.2 The canonical height on E(K) ⊗ ℚ](#02-the-canonical-height-on-ek--ℚ) gives the factor (1/h)².

*Consequences.* Cai–Shu–Tian take the trace P_K(f) = Tr_(H_K/K) f(P) ∈ E(K); an average-based statement of the same formula carries h_K² in its constant.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1, after Theorem 1.1, p. 2 (arXiv v2).)

*Needs:* [0.2 The canonical height on E(K) ⊗ ℚ](#02-the-canonical-height-on-ek--ℚ), Mathlib `IsGalois`.

### 0.10 Rescaling height and period identities

For a bilinear identity H(P,Q)=C·L·α(f₁,f₂), replacing H by aH, torus measure dt by bdt, invariant local forms by cv( , )v with ∏cv=c, and the global form compatibly, multiplies the corresponding sides by their actual linear factors: heights by a, each toric period by b, their product by b², local αv by bv cv, and a rank-r regulator by a^r for a>0. Rescaling a differential by d multiplies its absolute period by |d| and its Petersson squared norm by |d|². Coefficient embeddings commute with these algebraic rescalings when they preserve the chosen rational structures.

Assume All measures positive; all nonzero differential/pairing scalars; finitely many nonunit local rescalings. The same periods and pairings are used on both sides; embeddings fixed.

*Outline.* Use linearity of integration and each pairing. Apply Matrix.det_smul to the Gram matrix, retaining |a|^r if a is not assumed positive. Separate period rescaling from the quadratic height rescaling.

*Consequences.* Scaling a torus measure by 3 multiplies a period product by 9. Scaling a positive pairing by 2 multiplies a rank-two regulator by 4. The zero-period case still obeys the cross-multiplied identity.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1, normalizations; §2, local toric integrals.)

*Needs:* [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), Mathlib `Matrix.det_smul`, [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions).

### 0.11 Relative-field height comparison

For the same canonical pairing computed over the Hilbert class field H, the quadratic field K and in absolute normalization, prove B_H(a,b)=h B_K(a,b)=2h B_abs(a,b), where h=[H:K]. The input points and line bundle are transported along the compatible places before the sums are compared. Thus an identity with H-relative heights cannot be changed to K-relative heights without changing its constant by h.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Apply the compatible-place local-degree comparison to the same canonical height. Sum the local degrees to obtain the field-degree ratio; retain the squared complex norm convention.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §6, (6.4), p. 230.)

*Needs:* [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), `HeightsRationalPointsAndObstructions:§0.12`.

### 0.12 CM action convention comparison

Describe three actions on the CM index (A,𝔫) in the classical split setting. Conjugation sends it to (A^(-1),overline(𝔫)). Arithmetic Artin reciprocity for class B sends it to (AB^(-1),𝔫). For an exact divisor d of N and 𝔡=(d,𝔫), Atkin–Lehner sends it to (A[𝔡]^(-1),𝔫𝔡^(-1)overline(𝔡)); in particular w_N gives (A[𝔫]^(-1),overline(𝔫)). The product of the class group and the Atkin–Lehner group acts simply transitively on the 2^s h CM points with these choices. This is an action comparison; the CM-point construction and class-field statement are supplied independently.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Reverse the selected cyclic isogeny at d using the two lattices of 0a.2–0a.3. Compare the new source lattice with b𝔡⁻¹ and its new level ideal with 𝔫𝔡⁻¹𝔡̄. The two principal factors cancel on applying the involution twice. Compare inverse-character and ideal-inverse conventions before taking eigencomponents.

**Checks.**

- For N=1 the Atkin–Lehner action is identity, while complex conjugation can still invert a nontrivial ideal class.
- For K=ℚ(√−23), N=2 and a norm-2 ideal 𝔫 of class g∈C₃, w₂ sends (1,𝔫) to (g²,𝔫̄), not (g,𝔫̄). Since [𝔫̄]=g², applying it twice gives (1,𝔫). In additive class coordinates this is 0↦−1=2↦2+1=0; the orientation changes at each step.
- Gross–Zagier, Chapter II, §1 (i), p.236, print the image class under w_N as 𝒜[𝔫]. With their indexing (ℂ/𝔞→ℂ/𝔞𝔫⁻¹)↦([𝔞],𝔫) of p.235, the dual isogeny is ℂ/𝔞𝔫⁻¹→ℂ/𝔞𝔫⁻¹𝔫̄⁻¹, so the class is 𝒜[𝔫]⁻¹, as Gross (5.2) states; the printed form holds for indexing by the inverse class. In the preceding example the printed form would send (1,𝔫) to (g,𝔫̄) rather than (g²,𝔫̄).
- The Gaussian level-5 pair of 0a.2 has two possible level ideals and unit stabilizer 4. The pair construction and involution still exist at D=−4; the odd-D analytic setting used in this target is a separate restriction, and a stabilizer is not divided into the coarse orbit count.

([Gross, Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf), §I.5, (5.1)–(5.2), p.90; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §1, pp. 235–236 (i), (ii); p. 243.)

*Needs:* [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), ComplexMultiplicationAndExplicitReciprocity §3.1 (`classPolynomial.galois`, `classPolynomial.ringClassField`), ComplexMultiplicationAndExplicitReciprocity §1.2 (`quadraticFormsCMComparison`).

### Examples

For K=ℚ(√−7), u=1; for K=ℚ(i), u=2; for K=ℚ(√−3), u=3. A rank-one Gram determinant formed from the half polar form ½(h_(O)(P+Q)−h_(O)(P)−h_(O)(Q)) of h_(O) is half of Tau Ceti's `regulator`; a rank-zero determinant is 1 in both normalizations. For a nontrivial order-three character, replacing χ by χ^(-1) changes its eigenvalue, unlike a quadratic character. On a curve with two real components, Ω=2Ω⁰.

### Dependencies

The direct external interfaces used above are Mathlib `Complex.Gamma_one`, Mathlib `Complex.Gammaℂ_def`, Mathlib `Complex.Gammaℂ`, Mathlib `HasDerivAt.mul`, Mathlib `IsGalois`, Mathlib `Matrix.det_smul`, Mathlib `MeasureTheory.lintegral`, Mathlib `NumberField.Units.mem_torsion`, Mathlib `NumberField.Units.torsionOrder`, Mathlib NumberField.instAdmissibleAbsValues, Mathlib NumberField.totalWeight_eq_finrank, Mathlib `QuadraticMap.map_smul`, Mathlib `QuadraticMap`, Mathlib `Real.sqrt`, Mathlib `TensorProduct`, Mathlib `WeierstrassCurve.b₂`, Mathlib `WeierstrassCurve.Δ`, Mathlib `deriv_mul`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`, Tau Ceti `WeierstrassCurve.Affine.canonicalHeightQuadratic`, Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`, Tau Ceti `WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, TauCetiRoadmap.ClassFieldTheory, TauCetiRoadmap.EllipticCurves Layer 7, TauCetiRoadmap.ImaginaryQuadraticClassNumber H1.2, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`, ComplexMultiplicationAndExplicitReciprocity §1.1 (`idealAction`, `idealAction.picardEquiv`), ComplexMultiplicationAndExplicitReciprocity §1.2 (`quadraticFormsCMComparison`), ComplexMultiplicationAndExplicitReciprocity §2.3 (`explicitLevelReciprocity`), ComplexMultiplicationAndExplicitReciprocity §3.1 (`classPolynomial.galois`, `classPolynomial.ringClassField`), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), `HeightsRationalPointsAndObstructions:§§0.12, 0.16, 0.19, 0.21`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_nonneg`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`, MetaplecticAutomorphicForms §6.1. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 1: Poincaré and coefficient-valued heights

Construct heights on a dual pair of abelian varieties, then extend them through endomorphism fields and characters. A self-height uses a polarization and complex conjugation; the bilinear dual-pair statement has a different domain.

### 1.1 Poincaré height pairing

For a number field F and an abelian variety A/F with dual A∨, let 𝒫 be the Poincaré bundle rigidified along both zero sections. Define h𝒫(x,y) as its canonical height on A×A∨, normalized relative to F. The biextension laws make h𝒫 bilinear in x and y, zero on torsion, and adjoint under u:A→B: h𝒫_B(ux,y)=h𝒫_A(x,u∨y). For a symmetric ample line bundle L on A and φL(y)=Ty*L⊗L⁻¹, h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y).

Assume A is projective, smooth and geometrically connected; dual and rigidified 𝒫 supplied by A2. Canonical heights use the relative-to-F normalization of HeightsRationalPointsAndObstructions §§0.12 and 0.19.

*Outline.* Import Weil's height machine (HeightsRationalPointsAndObstructions §0.16) and the canonical limit with its bounded-error uniqueness (§§0.18–0.19). Apply the rigidified biextension identities to eliminate the bounded errors in each variable. Pull back 𝒫 under u×1 and 1×u∨; uniqueness proves adjunction. The full-polarization identity is HeightsRationalPointsAndObstructions §0.21 and is not reproved here.

Its API consists of the following facts:

- The canonical height of the rigidified Poincaré bundle evaluated at (x,y).
- h𝒫(x+x′,y)=h𝒫(x,y)+h𝒫(x′,y).
- h𝒫(x,y+y′)=h𝒫(x,y)+h𝒫(x,y′).
- h_B(ux,y)=h_A(x,u∨y), including identity and composition.
- h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y): this is the Poincaré comparison of HeightsRationalPointsAndObstructions §0.21, used as it stands.

**Checks.**

- h𝒫(0,y)=h𝒫(x,0)=0.
- For L=(O), h𝒫(P,φL P)=2h_(O)(P), which is Tau Ceti's `Point.canonicalHeight P` (the x-height) under the same field normalization.
- h𝒫(nx,y)=h𝒫(x,ny)=n h𝒫(x,y) for n∈ℤ.

*Consequences.* Diagonal on a principally polarized elliptic curve is 2ĥ_(O), not ĥ_(O).

(B. Conrad, [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9: the canonical pairing A(K̄)×A∨(K̄)→ℝ and its bilinearity, p. 33; the field-extension factor (9.8), the adjointness (9.9), Remark 9.9 (the identification with the canonical height of the Poincaré bundle) and Theorem 9.10 (the polarization identity), p. 34.)

*Needs:* `HeightsRationalPointsAndObstructions:§§0.12, 0.16, 0.18–0.19, 0.21`, [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), AbelianSchemesAndArithmeticModuli A2.2, AbelianSchemesAndArithmeticModuli A2.3, AbelianSchemesAndArithmeticModuli A2.6.

### 1.2 Endomorphism-field height pairing

Fix A/F, simple of strict GL₂ type with End_F⁰(A)=M a number field, and identify End_F⁰(A∨) with M by duality m↦m∨. For x∈A(F̄)⊗ℚ and y∈A∨(F̄)⊗ℚ define the unique H_M(x,y)∈M⊗ℚℝ satisfying Tr_(M/ℚ)(m·H_M(x,y))=h𝒫(mx,y) for every m∈M. The nondegenerate trace form gives existence and uniqueness. It satisfies H_M(mx,y)=mH_M(x,y)=H_M(x,m∨y), and its trace is h𝒫(x,y).

Assume the M-action is F-rational. M is finite separable over ℚ; h𝒫 is adjoint for dual endomorphisms.

*Outline.* Represent the ℚ-linear functional m↦h𝒫(mx,y) using the trace-dual basis of M. Use adjunction and trace nondegeneracy to prove M-bilinearity and independence of that basis.

Its API consists of the following facts:

- The trace-dual coefficient H_M(x,y).
- Tr(m H_M(x,y))=h𝒫(mx,y) for every m∈M.
- H_M(mx,y)=m H_M(x,y)=H_M(x,m∨y).
- Any two trace-dual bases construct the same coefficient.
- The coefficient-valued pairing is additive in each variable: H(x+x′,y)=H(x,y)+H(x′,y) and H(x,y+y′)=H(x,y)+H(x,y′). Nondegeneracy of the coefficient-field trace pairing identifies these values uniquely.

**Checks.**

- For M=ℚ, H_M equals the scalar Poincaré pairing.
- The coefficient is zero if either point is torsion.
- If M is quadratic and H_M=1, its trace is 2, although each real embedding evaluates it to 1.

*Consequences.* No individual coefficient embedding is substituted for the trace characterization.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.2.4, printed p.15; §7.1.1 Proposition7.1.3, printed p.219.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 6 (coefficient-field trace characterization).

*Needs:* [1.1 Poincaré height pairing](#11-poincaré-height-pairing), AbelianSchemesAndArithmeticModuli A6.12, Mathlib `TensorProduct`.

### 1.3 Elliptic Poincaré comparison

For a Weierstrass elliptic curve E/K with translation T_P(x)=x+P and polarization φ_(O)(P)=T_P*O((O))⊗O((O))⁻¹, corresponding to [−P]−[O] in Pic⁰(E), HeightsRationalPointsAndObstructions §0.19 (the height of O_E(O) is one half of Tau Ceti's `Point.canonicalHeight`, relative to K using NumberField.instAdmissibleAbsValues) and §0.21 (the Poincaré comparison and the identification of its form for O(O) with `neronTatePairing`) give h𝒫(P,φ_(O) Q)=neronTatePairing(P,Q)=B_x(P,Q); they are used as they stand. The owned content of this target is the Abel–Jacobi sign below and the identification of the full-polarization regulator with Tau Ceti's `regulator`. A change to absolute heights divides both pairings by [K:ℚ]. Under the Abel–Jacobi identification Q↦[Q]−[O] instead, the canonical Poincaré height is −neronTatePairing(P,Q). These two identifications must not be interchanged.

Assume K a number field; the absolute values of HeightsRationalPointsAndObstructions §0.11 are Mathlib's. E nonsingular.

*Outline.* Import the half-height and Poincaré comparisons of HeightsRationalPointsAndObstructions §§0.19 and 0.21. Compare φ_(O)(Q)=[−Q]−[O] with the Abel–Jacobi class [Q]−[O] through [−1], which gives the sign. Take the full polar form, then apply the determinant scaling of 0.1.

*Consequences.* Test a non-torsion diagonal and rank-two basis; rank zero cannot detect the factor.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), I §4 (4.3), p.228; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp. 217–219.)

*Needs:* [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), `HeightsRationalPointsAndObstructions:§§0.16, 0.19, 0.21`.

### 1.4 Character-component height pairing

For a finite abelian extension H/K, a coefficient extension L/M and finite-order χ:Gal(H/K)→L×, set Vχ={x∈(A(H)⊗_ℤℚ)⊗_M L : σx=χ(σ)x}; use (A∨(H)⊗_ℤℚ)⊗_M L with its dual M-action for V∨χ⁻¹. Quasi-endomorphisms act after rationalization, rather than on the integral point group. Extend H_M L-bilinearly to Vχ×V∨χ⁻¹ with values L⊗ℚℝ. Galois invariance makes distinct inverse-character components orthogonal. The χ-projector is eχ=|G|⁻¹Σσ χ(σ)⁻¹σ; its normalization distinguishes trace and average. On rational points modulo torsion the pairing is nondegenerate on paired components once the imported canonical height is positive definite on a finite-rank group.

Assume H/K finite abelian, characteristic-zero coefficients; the strict GL₂ data of the statement above. Finite generation is imported from HeightsRationalPointsAndObstructions §1.7 (Mordell–Weil) only for the finite-rank nondegeneracy formulation.

*Outline.* Extend the bilinear map along M→L and apply the finite character idempotents. Use σ-invariance to force χχ′=1 for a nonzero pairing. Apply the positive definiteness of HeightsRationalPointsAndObstructions §1.8 to the real finite-rank realization and scalar extension.

Its API consists of the following facts:

- The restriction of scalar-extended H_M to Vχ×V∨χ⁻¹.
- H_L(eχx,y)=H_L(x,eχ⁻¹y).
- H_L(ax,by)=ab H_L(x,y).
- H_L(σx,σy)=H_L(x,y).

**Checks.**

- For χ=1 the pairing is the H_M pairing on G-invariants after scalar extension.
- If χχ′≠1, H_L(Vχ,V∨χ′)=0.
- Replacing both trace inputs by their |G|⁻¹ averages divides the pairing by |G|².
- For a non-torsion elliptic point P, the quasi-endomorphism 1/2 sends P⊗1 to P⊗(1/2), and H(P/2,Q)=H(P,Q)/2. An integral point P need not be divisible by 2; torsion maps to zero in the rational carrier.

*Consequences.* A nontrivial χ is paired with χ⁻¹, rather than with χ again.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §3, p. 228; §6, p. 230; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 308; Chapter I, §6, p. 230; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.3.1–§1.3.2, printed pp.16–17; §1.2.4, printed p.15.)

*Needs:* [1.2 Endomorphism-field height pairing](#12-endomorphism-field-height-pairing), [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit), `HeightsRationalPointsAndObstructions:§§1.7–1.8`.

### 1.5 Rational Galois descent of Mordell–Weil spaces

For a finite Galois extension H/K of number fields with group G and an abelian variety A over K, prove that the map A(K)⊗_ℤℚ → (A(H)⊗_ℤℚ)^G induced by A(K)⊆A(H) is an isomorphism, with inverse x ↦ |G|⁻¹Σ_(σ∈G)σx. A G-invariant vector need not come from a K-rational point, only from a point whose conjugates differ from it by torsion; its trace is K-rational. With the Mordell–Weil theorem over H (HeightsRationalPointsAndObstructions §1.7), A(H)⊗_ℤℚ and A(K)⊗_ℤℚ are finite-dimensional. For a number field M acting on A through End_K⁰(A) and a field extension L/M, taking G-invariants commutes with ⊗_M L, so (A(H)_ℚ⊗_M L)^G = A(K)_ℚ⊗_M L; this is the trivial-character case of the eigenspaces A(χ) of Layer 8.

Assume H/K finite Galois with group G. A an abelian variety over K. M ⊆ End_K⁰(A) a number field, so that its action commutes with G.

*Outline.* Injectivity: A(K)→A(H) is injective and ⊗_ℤℚ is exact. Surjectivity: write a G-invariant vector as P⊗(1/m) with P∈A(H); averaging over G gives P⊗(1/m)=Tr_(H/K)(P)⊗(1/(m|G|)), and Tr_(H/K)(P)∈A(K). For the scalar extension, the averaging operator is an M-linear idempotent with image the invariants, and ⊗_M L is exact.

*Consequences.* A point P∈A(H) with σP−P torsion for every σ but P∉A(K) still defines a vector of A(K)⊗ℚ, namely |G|⁻¹Tr_(H/K)(P)⊗1: the descent is a statement about ℚ-vector spaces, not about points. Without the factor |G|⁻¹ the map is not the inverse: the trace multiplies a K-rational vector by |G|.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, definition of the Heegner cycle P⁰_χ(f) ∈ A(K^ab)_ℚ⊗_M L, p. 6.)

*Needs:* `HeightsRationalPointsAndObstructions:§1.7`, Mathlib `IsGalois`, Mathlib `TensorProduct`, [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit).

### Examples

On an elliptic curve, φ_(O)(P)=T_P*(O)−(O)=[−P]−[O]. Pairing with this dual point gives the positive full polarization; using the Abel–Jacobi class [P]−[O] gives its negative. A torsion input has zero height. Trace duality over a quadratic coefficient field is tested on both embeddings, not just on their sum in a single coordinate.

### Dependencies

Earlier layers 0a, 0. The direct external interfaces used above are Mathlib `IsGalois`, Mathlib `TensorProduct`, AbelianSchemesAndArithmeticModuli A2.3, AbelianSchemesAndArithmeticModuli A2.2, AbelianSchemesAndArithmeticModuli A2.6, AbelianSchemesAndArithmeticModuli A6.12, `HeightsRationalPointsAndObstructions:§§0.12, 0.16, 0.18–0.21`, `HeightsRationalPointsAndObstructions:§§1.7–1.8`. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 2: Admissible arithmetic intersection

Construct local arithmetic pairings from metrics and reduction graphs, glue them by the product formula, and compare degree-zero admissible intersections with canonical heights. Nonzero component degrees need the Hodge corrections of the next layer.

### 2.1 Global arithmetic intersection on curves

For a smooth proper geometrically connected curve X/F and a regular model 𝒳/𝒪_L after finite L/F, an arithmetic divisor is (D,(gσ)σ) with ddᶜgσ+δDσ smooth and complex conjugation compatible. Its intersection for generically disjoint D₁,D₂ is the sum of finite intersection lengths times log Nv, plus the archimedean Green evaluation and curvature integral, summed over all embeddings σ:L→ℂ with each embedding counted once; a complex place, which carries the two conjugate embeddings σ and σ̄, therefore counts twice a real place. Divide by [L:F]. Model pullbacks and finite-extension projection formulas identify the total intersection, and compatible arithmetic classes glue in the directed system of models; horizontal and vertical summands separately depend on the model.

Assume 𝒳 regular with imported local intersections; finite extension chosen semistable where needed. Green singularities and logarithm conventions fixed; generically disjoint representatives.

*Outline.* Import ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, the arithmetic first-Chern-class map of §1.9 and §1.10 `ArithmeticChow1.pairing`, with §1.15 for rational Hermitian lines. That supplier uses ddᶜ=(i/2π)∂∂bar and squared-norm Green functions G. Transport by G=2g and −log‖s‖²=2g, so its half-weighted infinite degree becomes exactly this roadmap's unsquared-metric degree. Finite lengths keep log Norm(𝔭).  Import regular models and the finite length pairing from StableReduction. Combine the finite local lengths with conjugation-invariant archimedean Green data. Use local projection formulas and the product formula to descend the normalized total through models and extensions.

Its API consists of the following facts:

- The normalized finite-plus-infinite intersection on compatible arithmetic divisor classes.
- The pairing is additive in each variable and symmetric.
- For a finite map f:X→Y and compatible arithmetic divisors D on Y and E on X, the projection formula is (f^*D,E)_X=(D,f_*E)_Y, with proper push-forward multiplicities.
- Unnormalized intersection multiplies by [L′:L]; normalized intersection is unchanged.
- The global arithmetic intersection is symmetric: D-hat·E-hat=E-hat·D-hat, for the compatible regular models and Green normalizations.

**Checks.**

- An entire fibre has zero finite intersection with a degree-zero divisor.
- A principal arithmetic divisor with Green −log|f| has global intersection zero by the product formula.
- Over an imaginary quadratic L the single complex place carries two embeddings and contributes 2g(D₁,D₂) at one of them, since g is conjugation compatible; weighting each embedding by 2 gives 4g and counting the place once gives g, and both change the pairing.

*Consequences.* The entire fibre is in the vertical intersection kernel; no ordinary matrix inverse is used.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Sec. 7.1.4, printed pp. 211-212; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §4, (4.2), p. 228; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224.)

*Needs:* TauCetiRoadmap.StableReduction Layer 1, TauCetiRoadmap.StableReduction Layer 4, TauCetiRoadmap.StableReduction Layer 5, TauCetiRoadmap.StableReduction Layer 7, ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.2 Arakelov probability form

On C let (α,β)=(i/2)∫C α∧β̄ on H⁰(C,ωC), and choose an orthonormal basis α₁,…,αg. Set μAr=(i/(2g))Σj αj∧ᾱj. It is a smooth positive probability form, independent of the orthonormal basis. This is a genus-normalized form: the unscaled Bergman sum has mass g.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* Import holomorphic one-forms, integration and the positive definite hermitian pairing. A unitary change of basis preserves the sum; integrate each diagonal term to obtain total mass one.

Its API consists of the following facts:

- The form (i/(2g))Σαj∧ᾱj.
- The measure agrees for any two orthonormal bases.
- ∫C μAr=1.
- A biholomorphism pulls the target Arakelov form back to the source form.

**Checks.**

- For g=2 each orthonormal summand contributes 1/2 to the mass.
- For C=ℂ/Λ with area A, μAr is Euclidean area divided by A.
- For g=2 the unscaled Bergman form has mass 2 and is not μAr.

*Consequences.* Do not omit the factor 1/g.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.)

*Needs:* ComplexComparisonPartII C1.2 for holomorphic/de Rham Hodge theory and the integration pairing, C5.3 compactEllipticHodge for the compact harmonic decomposition. The genus normalization is proved here.

### 2.3 Arithmetic normalization of the admissible skeleton measure

Let C/K be smooth, proper and geometrically connected of genus g>0 with a K-point and split semistable reduction over a complete DVR. Import its polarized metric graph from TropicalAndBerkovichArithmetic §§3.1–3.3, the probability measure μ_ad and normalized Green kernel from its §6.6, the skeleton inclusion i from its §2.11, the retraction r from its §2.7, and refinement and valued extension from its §2.13; its §§6.7–6.8 supply the model potentials, the metric–Laplacian comparison and the unit and natural-logarithm scaling, all used as they stand. Define the arithmetic analytic measure to be i_*μ_ad. With ord_K(π)=1, graph lengths use −log|t|/log|π|^(-1); the real Green function in arithmetic degrees is log|π|^(-1) times that graph Green function. This adapter does not reconstruct μ_ad, the resistance formula, the model curvature or the base-change subdivision; its owned content is the measure i_*μ_ad on the analytic curve and its mass.

*Outline.* Push μ_ad forward along i; its mass is 1 because i is a closed embedding and μ_ad is a probability measure (TropicalAndBerkovichArithmetic §6.6). The scaling of potentials by log|π|^(-1), the model curvature (2g−2)i_*μ_ad of the dualizing divisor with coefficients 2g_v−2+val(v), and subdivision under ramified extension are TropicalAndBerkovichArithmetic §§6.7–6.8 and 2.13, applied to this measure.

Its API consists of the following facts:

- The arithmetic skeleton measure is i_*μ_ad.
- Its total mass is 1, and it is supported on i(Γ).

**Checks.**

- Good reduction gives the Dirac mass at the sole vertex, including genus one.
- A split Tate curve gives uniform length probability; the identity 0·μ=0 alone cannot determine it.
- A bridge contributes zero continuous mass, whereas a loop contributes positive mass, as in TropicalAndBerkovichArithmetic §6.6.
- Changing |π| while keeping ord_K(π)=1 rescales Green values, not total probability mass.

([Arithmetic bigness and a uniform Bogomolov-type result](https://math.berkeley.edu/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, Proposition A.5, pp. 115–118 of the 2024 author manuscript.)

*Needs:* TropicalAndBerkovichArithmetic §2.7, §§2.10–2.13, 3.1–3.3 and 6.6–6.8, TauCetiRoadmap.StableReduction Layer 7.

### 2.4 Archimedean admissible metric

A smooth hermitian metric on a holomorphic line bundle L/C is admissible when c₁(L,‖·‖)=deg(L)μAr. A smooth metric on L/C² is admissible when its restrictions to {x}×C and C×{x} are admissible for every x∈C. Multiplication of a norm by a positive constant preserves admissibility; degrees need not be one or positive.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* Use the imported Chern current of a smooth hermitian metric. Define the two fibrewise restrictions on C² and impose the same degree-weighted equation.

Its API consists of the following facts:

- c₁(L)=deg(L)μAr, and the analogous two-fibre condition on C².
- Tensor products and duals add and negate degrees and Chern forms.
- Multiplication of the norm by a positive constant preserves admissibility.
- Either fibre restriction of an admissible metric on C² is admissible.

**Checks.**

- An admissible metric on a degree-zero bundle is flat.
- For degree two the curvature mass is 2.
- Curvature μAr is inadmissible for a bundle of degree two.

*Consequences.* A degree-zero bundle has zero Chern form.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.)

*Needs:* [2.2 Arakelov probability form](#22-arakelov-probability-form), ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.5 Finite-place Néron symbol on curves

Let H_v be a finite extension of ℚ_p with ring of integers A_v, residue field of q_v elements and normalized absolute value |·|_v (|π_v|_v=q_v^(−1)), extended to H̄_v, and let X/H_v be a smooth proper geometrically connected curve. Let a, b be divisors of degree zero on X_(H̄_v) with disjoint supports. Choose a finite extension L_w/H_v over which every point of the supports of a and b is rational, a regular proper model 𝒳 of X_(L_w) over A_w, a ℚ-divisor A on 𝒳 with generic fibre a and (A·C)=0 for every irreducible component C of the special fibre, and any divisor B on 𝒳 with generic fibre b. Define the finite-place Néron symbol

```text
⟨a, b⟩_v := −[L_w : H_v]^(−1) · (A · B)_𝒳 · log q_w .
```

Prove that A exists, that the value is independent of L_w, 𝒳, A and B, and that ⟨·,·⟩_v is Néron's local symbol: it is biadditive, symmetric and continuous off the supports, and ⟨a, div f⟩_v = log|f(a)|_v = Σ_x m_x log|f(x)|_v for a = Σ_x m_x(x) with support disjoint from div f (Gross–Zagier I (4.1)); these properties characterize it.

*Outline.* The special fibre of 𝒳 is connected, and its intersection matrix is negative semidefinite (StableReduction Layer 4); its kernel is ℚ·F for the full fibre F=div(π_w) (Zariski's lemma, with the multiplicities of StableReduction Layer 5). Since (ā·F)=deg a=0 for the closure ā, the vector ((ā·C))_C lies in the image of the intersection matrix, so a rational vertical V with A=ā+V exists, unique up to ℚ·F. Changing A by a multiple of F changes (A·B) by a multiple of (F·B)=deg b=0; changing B by a vertical divisor changes it by 0 because A is orthogonal to every component. Two regular models are dominated by a third (StableReduction Layer 4); along a proper birational map of regular models the pullback of A stays orthogonal by the projection formula, so the value is model independent. Under a finite extension L′/L_w the unnormalized quantity −(A·B)log q_w is multiplied by [L′:L_w] (projection formula for the finite map of models), so the normalized value is unchanged. Symmetry follows by choosing both extensions orthogonal. For b=div f take B=div_𝒳(f), which is orthogonal to every component, and the closure of a: for a section x̄, (x̄·div_𝒳(f))=v_w(f(x)), which gives log|f(a)|_v. Continuity off the supports is the local description of intersections of sections; at a point x of b of multiplicity m, apply the principal-divisor law to g^m for a uniformizing parameter g at x and use that b−div(g^m) avoids x. Uniqueness is Néron's characterization recalled by Gross–Zagier I §4: two such symbols have the same logarithmic singularities, so their difference vanishes on principal divisors and descends to a continuous biadditive pairing on the compact groups J(L)×J(L), L/H_v finite, J the Jacobian; it is 0 because ℝ has no nonzero compact subgroup.

Its API consists of the following facts:

- Well-definedness: the value does not depend on L_w, on the regular model, on the orthogonal extension A (determined up to ℚ·F) or on the extension B.
- Biadditivity and symmetry on pairs of degree-zero divisors with disjoint supports.
- Principal-divisor law: ⟨a, div f⟩_v = Σ_x m_x log|f(x)|_v for a = Σ_x m_x(x) disjoint from div f.
- Continuity and logarithmic singularity: for fixed b and y₀ ∉ supp b, the function y ↦ ⟨(y)−(y₀), b⟩_v is continuous on X(H̄_v)−supp b; if x has multiplicity m in b and g is a uniformizing parameter at x, then y ↦ ⟨(y)−(y₀), b⟩_v − m log|g(y)|_v extends continuously to y=x.
- Uniqueness: every biadditive, symmetric, continuous symbol on disjoint degree-zero divisors satisfying the principal-divisor law equals ⟨·,·⟩_v.

**Checks.**

- On X=ℙ¹ over ℚ_p with smooth model ℙ¹_(ℤ_p), a=(0)−(∞) and b=(1)−(p): the sections of 0 and p meet with multiplicity v_p(p−0)=1 and the other three pairs do not meet, so (ā·b̄)=−1 and ⟨a,b⟩_p=log p. The principal-divisor law gives the same value with f=(t−1)/(t−p): log|f(0)/f(∞)|_p=log|p^(−1)|_p=log p. The sign convention +(A·B)log q would give −log p.
- On a regular model whose special fibre is C₁+C₂ with C₁·C₂=2 and C₁²=C₂²=−2, take a=(x)−(y) and b=(x′)−(y′) with x, x′ reducing into C₁, y, y′ into C₂ and disjoint sections. Then A=ā+½C₁ and (A·b̄)=½, so ⟨a,b⟩_v=−½log q_v. The closure ā alone, which is not orthogonal to the components, gives 0.
- Degree zero is needed: for b=(x′) of degree 1, replacing A by A+F changes (A·b̄) by (F·x̄′)=1, so the value is not defined.
- Over the ramified quadratic extension ℚ_p(√p) the first example has −(A·B)log q_w=2log p, since v_w(p)=2 and q_w=p; dividing by [L_w:ℚ_p]=2 recovers log p.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §4, (4.1) and the preceding paragraph, p. 228 (the characterization), gz86 line 151; Chapter III, introduction, (0.1), p. 252 (the regular-model formula), gz86 line 1065.)

*Needs:* TauCetiRoadmap.StableReduction Layer 4 (intersection multiplicities on regular arithmetic surfaces, the negative-semidefinite fibre matrix, common resolution of two regular models), TauCetiRoadmap.StableReduction Layer 5 (regular proper models, components and multiplicities of the special fibre), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves) for the finite lengths and projection formulas.

### 2.6 Degree-weighted admissible Green function

For a Cartier divisor D on C a Green function is a smooth real gD off |D| such that gD+log|f| extends smoothly whenever div(f)=D locally. It is admissible if the metric ‖1‖=exp(−gD) on O(D) is admissible, equivalently ddᶜgD=deg(D)μAr−δD as currents. The printed equation with μAr−δD is valid only for degree one.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* Apply the Poincaré–Lelong formula with the selected unsquared norm. Insert c₁(O(D))=deg(D)μAr; both sides of the current equation then have total mass zero.

Its API consists of the following facts:

- The singularity and degree-weighted current equation characterize admissibility.
- gD+gE is admissible for D+E.
- Adding a real constant preserves admissibility.
- exp(−gD) defines the admissible metric on O(D).

**Checks.**

- A constant is an admissible Green function for D=0.
- The smooth term for D=x+y is 2μAr.
- For D=0 the printed equation ddᶜg=μAr has incompatible total masses 0 and 1.

*Consequences.* Integrate the current equation for D=0 and for a divisor of degree two.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.)

*Needs:* [2.4 Archimedean admissible metric](#24-archimedean-admissible-metric), ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.7 Complex admissible metric existence

Every holomorphic line bundle on C, and every holomorphic line bundle on C² with the two-fibre criterion, has a smooth admissible hermitian metric. It is unique up to multiplication of its norm by one positive constant on the connected base. Equivalently two admissible Green metrics differ by an additive constant.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* On C solve the zero-mass curvature difference by the imported elliptic Green operator. For C² use the fibrewise construction and the line-bundle decomposition, including the Jacobian/Poincaré component. The ratio of two solutions is pluriharmonic in each fibre; compactness makes it constant.

*Consequences.* Admissibility alone does not select an absolute multiplicative constant.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.)

*Needs:* [2.4 Archimedean admissible metric](#24-archimedean-admissible-metric), ComplexKahlerGeometry K5b.1 (compact harmonic projection and Green operator, identified by ComplexComparisonPartII C5.3), ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.8 Normalized Arakelov Green function

There is a unique symmetric smooth Green function gAr on C²∖Δ with singularity −log|local diagonal equation|, ddᶜ_y gAr(x,y)=μAr(y)−δx and ∫C gAr(x,y)μAr(y)=0. It defines a fibrewise admissible metric exp(−gAr) on O(Δ). Symmetry follows from the self-adjoint Green operator; the mean-zero condition removes the constant ambiguity.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* In a coordinate disc choose a cutoff of −log|z−z(x)|. Its ddᶜ is −δ_x plus a smooth form of mass one. Correct the smooth difference from μ_Ar using the preceding smooth Green inverse, then subtract the μ_Ar mean. Changing cutoff or coordinate changes only the smooth correction, so uniqueness glues the solutions. Use elliptic regularity away from Δ and the symmetric Green operator to glue the kernel. Convert the logarithmic singularity to the diagonal line-bundle metric.

Its API consists of the following facts:

- The normalized symmetric Green kernel on C²∖Δ.
- gAr(x,y)=gAr(y,x).
- ∫gAr(x,y)μAr(y)=0.
- exp(−gAr) extends to the admissible metric on O(Δ).

**Checks.**

- For a nonzero real c, gAr+c fails the mean-zero condition.
- For D=x−y, gAr(x,·)−gAr(y,·) has smooth curvature zero.
- gAr+log|z−w| is smooth near a diagonal coordinate chart.

*Consequences.* Use the unsquared metric convention in both the Green function and diagonal metric.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.103.)

*Needs:* [2.6 Degree-weighted admissible Green function](#26-degree-weighted-admissible-green-function), [2.7 Complex admissible metric existence](#27-complex-admissible-metric-existence), ComplexKahlerGeometry K5b.1 (compact harmonic projection and Green operator, identified by ComplexComparisonPartII C5.3).

### 2.9 Admissible arithmetic extension

Fix a compatible arithmetic class ξ̂ of degree one on each geometric connected component of X. For D, its ξ̂-admissible extension D̄ is characterized by: D̄−deg(D)ξ̂ has zero curvature and is orthogonal to every finite vertical component; ∫g_D c₁(ξ̂)=0 at each infinite place; and the vertical correction V_D has (V_D·ξ̂)v=0. The singular fibre matrix is solved on the quotient by the total fibre; the last condition fixes that remaining fibre ambiguity. The construction is unique in the compatible model system and extends by rational linearity. Distinguish a weakly ξ̂-admissible extension: impose the flatness/component-orthogonality condition and the finite vertical normalization, but allow a nonzero archimedean Green mean. Subtracting that mean on each component produces the fully normalized extension. A weakly admissible Green function g, whose mean ∫g(P,·)c₁(ξ̂) against the fixed degree-one line ξ̂ is a constant c_P on the component of P, becomes fully normalized after subtracting c_P on that component. This constant must be retained in positive-degree pairings; componentwise degree-zero pairings eliminate it.

Assume Semistable regular model after base change; degree taken componentwise; ξ̂ fixed with compatible admissible Green data.

*Outline.* Solve the vertical linear equations modulo the fibre kernel using the imported matrix result. Solve the archimedean Green equation and fix its additive constant by the mean-zero condition. Normalize the vertical fibre multiple against ξ̂ and verify uniqueness.

Its API consists of the following facts:

- The unique ξ̂-admissible extension of D.
- The three normalization conditions characterize the extension.
- Extension is rational-linear in divisors.
- Pullback preserves admissibility when ξ̂ and its measure are pulled back compatibly.
- For componentwise degree zero the extension is flat.
- The same curvature, vertical orthogonality and finite fibre normalization as admissibleExtension, with no mean-zero condition at infinity; a chosen Green constant is part of its data.
- Subtracting the componentwise Green mean gives admissibleExtension; only positive-degree pairings can change under this operation.
- Compatibility with 2.5: if X and a, b are defined over a number field H and v is a finite place of H, then the finite Néron symbol ⟨a,b⟩_v of 2.5 is minus the v-summand of the intersection of 2.1 applied to the flat extensions of a and b, since for degree-zero divisors that extension is an orthogonal extension of a at v and the remaining fibre normalization pairs to 0 with b.

**Checks.**

- The extension of zero is zero.
- The fixed normalized representative of ξ extends to ξ̂.
- A divisor of total degree zero with nonzero degrees on two components is not flat.
- Adding a nonzero real constant to a normalized Green function leaves curvature and finite vertical normalization unchanged, but fails full mean-zero admissibility.
- A Green function with constant mean c=−1 against ξ̂ on a component pairs a positive-degree divisor of component degree d with an extra −d; declaring its mean zero drops that term.

*Consequences.* Positive-degree extensions depend on ξ̂ and do not descend through arbitrary rational equivalence.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Sec. 7.1.5, printed p. 212; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224; [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.2, pp. 58–61; §4.3, Lemma 4.2(2), pp. 63–64.)

*Needs:* [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves) for the compatibility statement, TauCetiRoadmap.StableReduction Layer 4, TauCetiRoadmap.StableReduction Layer 7, ComplexKahlerGeometry K5b.1 (compact harmonic projection and Green operator, identified by ComplexComparisonPartII C5.3) (the archimedean Green equation against c₁(ξ̂), which needs no positive-genus hypothesis), [2.8 Normalized Arakelov Green function](#28-normalized-arakelov-green-function) for the positive-genus Arakelov instance, [2.3 Arithmetic normalization of the admissible skeleton measure](#23-arithmetic-normalization-of-the-admissible-skeleton-measure).

### 2.10 Arakelov dualizing metric

For each x∈C the residue map (ωC⊗O(x))|x→ℂ is an isometry when O(x) has the normalized Green metric and ℂ has its ordinary absolute value. These conditions determine the smooth Arakelov metric on ωC. Its curvature is (2g−2)μAr; in genus one the metric is flat.

Assume C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

*Outline.* Use adjunction O(Δ)|Δ≃ωC⁻¹ and the smooth diagonal metric. Dualize its diagonal restriction so that the residue trivialization has norm one. Apply the curvature formula for the canonical Bergman measure.

Its API consists of the following facts:

- The residue-normalized smooth metric on ωC.
- All the residue maps are isometries.
- c₁(ωC)=(2g−2)μAr.
- It is the dual of O(Δ)|Δ with its diagonal metric.

**Checks.**

- For genus one its Chern form is zero.
- For genus two its curvature mass is 2.
- Multiplying only the dualizing norm by c≠1 destroys the residue isometry.

*Consequences.* Do not replace the ordinary ℂ norm by its square.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.103.)

*Needs:* [2.8 Normalized Arakelov Green function](#28-normalized-arakelov-green-function), ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.11 Squared-norm complex height symbol

Let C be a compact connected Riemann surface of arbitrary genus. For a divisor b=Σ_j m_j(y_j) of degree zero, a degree-zero Green function of b is a real function g_b on C∖|b|, harmonic there, such that g_b+m_j log|z_j| is continuous near y_j for a local coordinate z_j with z_j(y_j)=0; equivalently ddᶜg_b=−δ_b as currents, with ddᶜ=(i/π)∂∂̄. Prove that g_b exists and is unique up to an additive constant. For disjoint degree-zero divisors a=Σ_i n_i(x_i) and b define the complex Néron height symbol ⟨a,b⟩_v:=−2Σ_i n_i g_b(x_i); the constant drops out because deg a=0. Prove that it is biadditive, symmetric and continuous off the supports, that ⟨a,div f⟩_v=Σ_i n_i log|f(x_i)|² (the squared complex absolute value, so the factor 2 is essential), and that these properties characterize it (Gross–Zagier, II §2, (2.1) and the uniqueness paragraph, pp. 236–237, stated there for any compact Riemann surface, gz86 lines 478–491). In positive genus it equals the contraction −2Σ_(i,j) n_i m_j g_Ar(x_i,y_j) of the normalized Arakelov kernel of 2.8; in genus zero every degree-zero divisor is principal and the symbol is the principal-divisor law. Keep the smooth curve, disjointness and degree-zero assumptions in every local comparison.

Assume only that C is compact and connected; no positive-genus hypothesis and no probability form is used. In the classical application C=X₀(N)(ℂ) under (C) and (H), which includes genus-zero levels such as N=2.

*Outline.* Around each y_j take a cutoff χ_j·(−m_j log|z_j|). Its ddᶜ is −δ_b plus a smooth 2-form ω, and ∫_C ω=deg b=0 by Stokes, so ω is orthogonal to the harmonic 2-forms and the compact Green operator gives ψ with ddᶜψ=−ω; put g_b=Σ_j χ_j·(−m_j log|z_j|)+ψ. Changing cutoffs or coordinates changes only ψ. Two solutions differ by a harmonic function on the compact connected surface, hence by a constant. For b=div f, −log|f| is a degree-zero Green function of b, which gives the principal-divisor law. Symmetry is Green's second identity on C minus small discs around |a|∪|b|; the boundary circles contribute −2Σn_i g_b(x_i) and −2Σm_j g_a(y_j) by the logarithmic singularities. For uniqueness, the difference of two symbols with the same principal-divisor law vanishes on principal divisors and is a continuous homomorphism from the compact group Jac(C) to ℝ, hence zero; in genus zero Jac(C) is a point. In positive genus, y ↦ Σ_j m_j g_Ar(y_j,y) is a degree-zero Green function of b by 2.8, since its ddᶜ is Σ_j m_j(μ_Ar−δ_(y_j))=−δ_b.

Its API consists of the following facts:

- Compatibility with 2.1 and 2.5: for disjoint degree-zero divisors a,b on a smooth proper curve over a number field L and an archimedean place v of L, give a degree-zero Green function at each embedding over v. Then minus the archimedean summand of 2.1 at the embeddings over v equals ⟨a,b⟩_v, where ⟨,⟩_v is the symbol above at a complex place and half of it at a real place, because the normalized absolute value |·|_v is the squared complex absolute value only at complex places.
- For disjoint degree-zero a,b, the symbol is −2Σ_i n_i g_b(x_i) for any degree-zero Green function g_b of b, independent of that choice.
- For b=div(f), the value is Σ_i n_i log|f(x_i)|².
- Additive and symmetric on disjoint degree-zero divisors.
- Any continuous biadditive symbol with the principal-divisor law equals it.
- In genus g>0 it equals −2Σ_(i,j) n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function of 2.8.
- In genus zero, writing b=div(f), it equals Σ_i n_i log|f(x_i)|², independent of the choice of f because deg a=0; symmetry is then Weil reciprocity f(div h)=h(div f).
- Logarithmic singularity: if x has multiplicity m in b and z is a local coordinate at x with z(x)=0, then y ↦ ⟨(y)−(y₀), b⟩_v − m log|z(y)|² extends continuously to y=x, because ⟨(y)−(y₀),b⟩_v=−2g_b(y)+2g_b(y₀), g_b(y)+m log|z(y)| is continuous near x, and −2m·(−log|z(y)|)=m log|z(y)|². This holds in every genus. With the finite-place law of 2.5 this is the input to the tangent regularization of 7.19.

**Checks.**

- Zero divisor has symbol zero.
- Replacing f by cf has the same symbol because deg a=0.
- Using −Σ g_b rather than −2Σ g_b gives log|f| instead of log|f|².
- Weil reciprocity on ℙ¹ with coordinate t: for a=(1)−(2) and b=(0)−(∞)=div(t), ⟨a,b⟩=log|1|²−log|2|²=−2log 2. In the other order a=div((t−1)/(t−2)), whose value is 1/2 at 0 and 1 at ∞, so ⟨b,a⟩=log(1/4)−0=−2log 2 as well; an unsquared convention gives −log 2.
- Genus-zero scope: N=2, D=−7, k=4 and f=η(z)^8η(2z)^8 (the newform 2.8.a.a of [The L-functions and modular forms database](https://www.lmfdb.org/ModularForm/GL2/Q/holomorphic/2/8/a/a/)) satisfy (C) and (H), since −7 is odd, prime to 2 and −7≡1=1² mod 8, so 2 splits in ℚ(√−7). X₀(2) has genus zero, so μ_Ar would divide by 2g=0 and the degree-one Green equation would have total masses 0 and −1; the Arakelov presentation alone does not define the symbol there. With the Hauptmodul t=(η(z)/η(2z))^24, which has a simple pole at ∞ and a simple zero at the cusp 0, (x′)−(0)=div((t−t(x′))/t) and ⟨(x)−(∞),(x′)−(0)⟩=log|t(x)−t(x′)|²−log|t(x)|². This tends to 0 as x→∞, grows like log|t(x′)|²=4πy′+O(1) as x′→∞, and like −log|t(x)|²=4πy/(2|z|²)+O(1) as x→0, which are the normalizations of 7.17 and 7.68 at N=2. For m=3, inert in ℚ(√−7), r_A(3)=0, so this is the disjoint-support branch of 7.19.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.1) and the uniqueness paragraph, pp. 236–237 (recalling Chap. I §4), gz86 lines 478–491.)

*Needs:* ComplexKahlerGeometry K5b.1 (compact harmonic projection and Green operator, identified by ComplexComparisonPartII C5.3) (the compact Green operator on functions, in every genus); [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves) for the compatibility statement; [2.8 Normalized Arakelov Green function](#28-normalized-arakelov-green-function) only for the positive-genus presentation.

### 2.12 Faltings–Hriljac comparison

For componentwise degree-zero divisors D,E on a smooth proper curve X/F, choose disjoint representatives over L and flat admissible extensions on a regular semistable model. Prove that −[L:F]⁻¹(D̄·Ē)=h𝒫_J([D],φΘ[E]), the full-polarization canonical Jacobian pairing relative to F. It is independent of representatives and model. For disconnected curves the summands are orthogonal. Consequently, for disjoint degree-zero divisors a, b on a curve over a number field L, the sum over all places v of L of the local symbols of 2.5 (finite v) and 2.11 (archimedean v, halved at real places) is the height pairing over L, that is [L:F]·h𝒫(a,b) for the pairing h𝒫 relative to F (Gross–Zagier I (4.2)–(4.3), p. 228); by 2.9's compatibility with 2.5 and 2.11's compatibility with 2.1, both sides are minus the intersection of the flat extensions. Only degree-zero divisors descend to Pic⁰; the ξ̂-admissible positive-degree pairing is not asserted to factor through Pic.

Assume X has positive genus on the Jacobian components; canonical principal polarization imported. Flat extensions, compatible local weights and generically disjoint representatives.

*Outline.* Identify the intersection height with a Weil height for the Jacobian theta divisor. Apply the canonical-height limit and the Hodge index theorem, with the minus sign. Use projection formulas and the product formula to remove choices.

*Consequences.* For an elliptic curve the diagonal is 2h_(O), which is Tau Ceti's `canonicalHeight`. A positive-degree principal-equivalence change is not incorrectly declared invisible.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 7, Thm. 7.4, printed p. 212; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §4, (4.3), p. 228 (the bilinear-height theorem quoted in Gross–Zagier, I §4, equation (4.3), p. 228); [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224.)

*Needs:* [2.9 Admissible arithmetic extension](#29-admissible-arithmetic-extension), [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves), [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [1.1 Poincaré height pairing](#11-poincaré-height-pairing), `HeightsRationalPointsAndObstructions:§§0.16, 0.18–0.19` (Weil height of the theta divisor and the canonical limit), TauCetiRoadmap.JacobianChallenge Layer F, AbelianSchemesAndArithmeticModuli Layer A2.

### 2.13 Admissible metrics at real places

For a smooth projective geometrically integral curve over ℝ of positive genus, its canonical complex Arakelov probability, diagonal and dualizing metrics are invariant under complex conjugation with the line-bundle real structure. They descend to Cᵃⁿ=C(ℂ)/Gal(ℂ/ℝ). The residue and diagonal compatibilities of 2.10 (Yuan, Arithmetic bigness, Theorem A.1) remain isometries. For complex places use the complex metrics directly.

Assume the real line-bundle structure is included; the quotient keeps the conjugation action.

*Outline.* Conjugation preserves the positive hermitian pairing and normalized Green equations. Apply uniqueness to establish invariant metrics. Descend the invariant norms, preserving the canonical residue isomorphisms.

Its API consists of the following facts:

- The conjugation-descended canonical metric.
- Pullback to C(ℂ) is the complex Arakelov metric.
- The real metric is determined by this pullback.
- The descended residue/diagonal isomorphisms are isometries.

**Checks.**

- A point and its conjugate have equal induced norms.
- At a real point the residue norm is ordinary absolute value.
- A metric with unequal conjugate-point norms cannot descend.

*Consequences.* The quotient does not identify real and complex place weights in global arithmetic sums.

([Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.6, p.119.)

*Needs:* [2.2 Arakelov probability form](#22-arakelov-probability-form), [2.8 Normalized Arakelov Green function](#28-normalized-arakelov-green-function), [2.10 Arakelov dualizing metric](#210-arakelov-dualizing-metric), ArakelovGeometryAndAbelianHeights §1.8 `ArithmeticDivisor`, ArakelovGeometryAndAbelianHeights §1.10 `ArithmeticChow1.pairing`.

### 2.14 Residue-normalized adjunction line

Over H, the Hilbert class field of E, let Pbar be the admissible arithmetic CM divisor, e its generic elliptic ramification index, and Mbar=LU,OH⊗O(Pbar/e). Residue gives a canonical generic trivialization M|P≃H; its integral image is a fractional ideal N with induced metric.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the orbifold Hodge bundle identity to identify its tensor with O(P/e) at P with (ω⊗O(P))|P. Use the residue coordinate to trivialize the generic fibre and take the image of the integral lattice with its metric.

Its API consists of the following facts:

- The residue image fractional ideal N of (L_U⊗O(P/e))|P, with induced metric.
- The generic residue trivialization is independent of the local coordinate.
- At w, N_w is the image integral lattice in H_w.
- The arithmetic degree equals the sum of residue-lattice lengths and negative log norms.

**Checks.**

- Replacing local coordinate z by az+O(z²), a≠0, preserves the residue trivialization.
- For e=1 the bundle is L_U⊗O(P).
- For e>1, replacing O(P/e) by O(P) gives the wrong orbifold adjunction line.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2, pp. 629–630.)

*Needs:* [2.9 Admissible arithmetic extension](#29-admissible-arithmetic-extension), HilbertModularVarietiesAndShimuraCurves R18.2.12.

### 2.15 Archimedean CM height sum

In the marked classical CM setting, assume r_A(m) = 0, so that c and T_m d^σ have disjoint support. Define ⟨c, T_m d^σ⟩_∞ := Σ_(v|∞) ⟨c, T_m d^σ⟩_v, the sum over the h complex places of H of Néron's archimedean local symbols. Since Gal(H/K) ≅ Cl_K permutes these places simply transitively, ⟨c, T_m d^σ⟩_∞ = Σ_(A₁, A₂ ∈ Cl_K, A₁A₂⁻¹ = A) ⟨(τ_(A₁,𝔫)) − (∞), T_m((τ_(A₂,𝔫)) − (0))⟩_ℂ, where τ_(A,𝔫) ∈ 𝔥 are the points of Chap. II §1 (roots of aτ² + bτ + c = 0 of discriminant D with N | a) attached to the class A and the ideal 𝔫.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Sum over the h complex places of the Hilbert class field. Identify each embedding with the corresponding ideal class under reciprocity; the local symbol already uses |·|².

Its API consists of the following facts:

- Σ_(v|∞) of the classical complex local symbols, one squared-norm symbol for each complex place.
- Equals the class-pair sum with A₁A₂⁻¹=A.
- Biadditive on admissible inputs.
- H has h complex places; no extra factor two is applied to their squared-norm symbols.

**Checks.**

- For h=1 the sum is one complex-place symbol.
- Counting every embedding and also using |·|² doubles the complex-place total.
- r_A(m)=0 is exactly the off-diagonal input condition when N>1.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §4, first two displays, p. 248.)

*Needs:* [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), ComplexMultiplicationAndExplicitReciprocity §1.2 (`quadraticFormsCMComparison`).

### Examples

Integrating the Green equation for a degree-two divisor gives 2−2=0. Omitting the degree would give 1−2. A circle graph has genus-one probability length measure, whereas a bridge contributes no edge density. The Faltings–Hriljac identity applies after componentwise degree-zero correction.

### Dependencies

Earlier layers 0a, 0, 1. The direct external interfaces used above are ArakelovGeometryAndAbelianHeights §§1.8–1.10, 1.15, ComplexComparisonPartII C1.2 and C5.3, TauCetiRoadmap.JacobianChallenge Layer F, TauCetiRoadmap.StableReduction Layer 1, TauCetiRoadmap.StableReduction Layer 4, TauCetiRoadmap.StableReduction Layer 5, TauCetiRoadmap.StableReduction Layer 7, AbelianSchemesAndArithmeticModuli Layer A2, ComplexKahlerGeometry K5b.1 (compact harmonic projection and Green operator, identified by ComplexComparisonPartII C5.3), ComplexMultiplicationAndExplicitReciprocity §1.2 (`quadraticFormsCMComparison`), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), `HeightsRationalPointsAndObstructions:§§0.16, 0.18–0.19`, HilbertModularVarietiesAndShimuraCurves R18.2.12, TropicalAndBerkovichArithmetic §2.7, §§2.10–2.13, 3.1–3.3 and 6.6–6.8. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 3: Hodge classes, realizations and differential constants

A normalized Hodge class replaces a base point uniformly across a Shimura curve. The realization and composition pairing connect parametrizations to automorphic vectors, with the Manin scalar controlling the passage to Néron differentials.

### 3.1 Integral modular differential lattices at bad primes

**Integral Whittaker and cusp-expansion bounds.** Let F/ℚ_p be finite with p odd, π an irreducible admissible infinite-dimensional representation of GL₂(F) with trivial central character and conductor exponent a≥2, ψ of conductor O_F, and W its normalized Whittaker newvector (W(1)=1); fix a field isomorphism ℂ≃ℚ̄_p and normalize v_p(p)=1, with v_p(0)=+∞. For t∈ℤ, 0≤ℓ≤a and v∈O_F×, prove the valuation bounds of CNS Theorem 3.14, including the middle-conductor refinements for the supercuspidal, quadratic Steinberg and principal-series cases. For p=2 prove Theorem 3.15 over ℚ₂, with its exceptional a=4,6 and middle-conductor cases; this theorem does not assert those bounds over an arbitrary extension of ℚ₂. The low-conductor a=0,1 bounds are CNS Proposition 3.4. These are local representation targets, independent of integral modular differentials.

For a ℤ-linear combination f of normalized newforms of weight k on Γ₀(N), a cusp with denominator L∣N and a chosen p-adic embedding of the coefficients, set a=v_p(N), b=v_p(L), d=min(b,a−b). Prove v_p(f at that cusp)≥−(k/2)(a−min(2b,a))+c, where c=0 for d=0 or for d=1 and a>2; c=−1/2 for a=2,b=1; and c=1−d/2 in the other cases. At p=2 also prove the stronger values c=0 at a=2,b=1; c=k/2 at a=2b with b∈{2,3,4}; c=k/2+1−a/4 at a=2b>8; and c=0 if d=3,a>6. Bounds that overlap are imposed together. Here the valuation is the infimum of the Fourier coefficient valuations at the specified cusp, with its actual width (CNS Theorem 4.6, p. 30; cns line 1557). The character is trivial; forms with other nebentypus require their own bounds.

The API consists of the normalized-local-value bounds, their dyadic specialization, and the resulting cusp bound. The proof uses local newvector theory, local factors and the supplied cusp charts. It does not use the integral differential lattice or the Manin constant.

**Checks for the bounds.**

- At b=0 the cusp bound is −ka/2; at b=a it is 0. These distinguish the two ends of the cusp normalization.
- At p odd, a=2, b=1 the correction is −1/2; replacing it by 0 would erase the exceptional conductor-two bound.
- At p=2, a=4, b=2 and k=2, the improved cusp bound is 1, whereas the general bound is 0. No theorem over ℚ₂ is silently used over a ramified dyadic field.

*Needs for these bounds:* AutomorphicLFunctionsAndLocalFactors AL.2, “The normalized Whittaker newvector”, and GL2AutomorphicRepresentationsAndTransfer R16.2.1 local classification; AutomorphicLFunctionsAndLocalFactors AL.1 local factors and additive characters; ModularCurvesPartII §§4.1–4.8 cusp charts. (CNS Theorems 3.14–3.15, pp. 21–22, and Theorem 4.6, p. 30; cns line 1016, cns line 1053, cns line 1557.)

Let Γ₁(N)⊆Γ⊆Γ₀(N), let X_Γ be the compactified integral modular curve (and 𝒳_Γ the corresponding stack), and let Ω denote the relative dualizing sheaf, distinguished from the sheaf of Kähler differentials at a singular fibre. Let K be a number field and f a weight-two cusp form over K whose complex base change is a ℤ-linear combination of normalized newforms on Γ₀(N), that is, of trivial character. Then the differential ω_f=2πif(z)dz lies in H⁰(X_(Γ,O_K),Ω) and in H⁰(𝒳_(Γ,O_K),Ω), including at the primes dividing N (CNS Theorem 5.15). For a single normalized newform on Γ₀(N), ω_f is a primitive element of H⁰(X_Γ^sm,Ω¹) (CNS Remark 5.16). A newform with nontrivial character is not covered by this statement.

Compare with Néron differentials through the Jacobian. Let R be an excellent discrete valuation ring and X a normal, proper, flat R-curve with irreducible generic fibre and a smooth point on the special fibre; let J be the Néron model of its Jacobian. Then H⁰(J,Ω¹)⊆H⁰(X,Ω), and the quotient is H⁰(X,R¹π_*O_Z) for any resolution π:Z→X. Equality holds if and only if X has rational singularities (CNS Proposition 6.2). For X₀(N) with N not a power of 2, this quotient is killed by 6 (CNS Remark 6.11), so 6ω_f is a Néron differential on J₀(N) for every normalized newform f on Γ₀(N), and ω_f itself is one when X₀(N) has rational singularities (CNS Corollary 6.14). (X₀(N))_(ℤ_(p)) has rational singularities when p≥5; when p=3 and either v₃(N)≤2 or some prime p′∣N has p′≡2 mod 3; and when p=2 and either v₂(N)≤2 or some prime p′∣N has p′≡3 mod 4 (CNS Theorem 6.12). At the remaining primes the cokernel is retained and the identification is not asserted.

*Outline.* Prove the local cusp criterion using each denominator, cusp width, stabilizer and different. The preceding local Whittaker and cusp-expansion targets give the valuation bound of CNS Proposition 5.14 and Theorem 5.15. Extend over codimension two using the Cohen–Macaulay dualizing module. Pass from Γ₀(N) to intermediate Γ by the tower formula for differents at height-one points. The q-expansion argument on X₁(N) gives Remark 5.16's primitivity. Compare with Néron differentials by Grothendieck–Serre duality and the identification of H¹(X,O_X) with the Lie algebra of Pic⁰, then compute the cokernel on a resolution (Proposition 6.2). This target supplies the integral bridge used by the Manin statements. ModularCurvesPartII §7.2 (`weightTwoRegularDifferentials`) supplies only the characteristic-zero correspondence S₂(Γ)≅H⁰(X,Ω¹) over ℂ, and its §13.7 the dualizing-module lattices H⁰(C,ω_C/S) on its stated models; the comparison with Néron differentials at bad primes is proved here.

Its API consists of the following facts:

- Trivial-character normalized-newform combinations give integral dualizing differentials with the prescribed generic fibre.
- A single normalized newform gives a primitive differential on the smooth locus.
- The Néron and dualizing lattices coincide under rational singularities; in general their quotient is H⁰(X,R¹π_*O_Z).
- For X₀(N) with N not a power of 2, six times the differential belongs to the Néron lattice.
- For a surjection φ:X_Γ→E sending a rational cusp to 0, with Albanese map π:J_Γ→E, the composite π∘π^∨ is multiplication by deg φ on E (CNS Lemma 7.1, p. 46), and π^* and (π^∨)^* carry Néron cotangent lattices into Néron cotangent lattices.

**Checks.**

- At a smooth good prime Ω=Ω¹ and the Néron comparison is an equality.
- At a node the dualizing sheaf permits opposite residues on the branches; replacing it by regular Kähler differentials gives the wrong lattice.
- Multiplying f by p destroys primitivity at p, although it preserves integrality.
- For N=40 (v₂(N)=3, and the only odd prime factor 5 is ≡1 mod 4) Theorem 6.12 gives no rational-singularity statement at p=2. Only 6ω_f, not ω_f, is then known to be a Néron differential, and the bound of [3.8 Manin constant and modular degree](#38-manin-constant-and-modular-degree) carries δ₂=1.
- For N=11 and the newform 11a the identification is an equality at every prime: X₀(11) has genus 1 and rational singularities (CNS Example 6.7).

([The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), §5 Proposition 5.14 and Theorem 5.15, pp. 39–40, Remark 5.16, p. 40; §6 Proposition 6.2, p. 41, Example 6.7, p. 43, Remark 6.11, p. 45, Theorem 6.12 and Corollary 6.14, p. 46; §7 Theorem 7.2, p. 47.)

*Needs:* the preceding integral Whittaker and cusp-expansion bounds; `ModularCurvesPartII:§§2.1–2.3` (generalized elliptic curves), `ModularCurvesPartII:§§4.1–4.8` (cusp charts) and `ModularCurvesPartII:§§5.1–5.3` (the integral coarse curve), `ModularCurvesPartII:§§7.2,13.7`, `ModularCurvesPartII:§13.1`, `NeronModelsAndSemistableAbelianVarieties:R11.1` for Néron models and invariant differentials, TauCetiRoadmap.SchemeAndStackFoundations §2.20 (relative dualizing modules and the curve comparison) and §§0.17–0.18 (Cohen–Macaulay modules and schemes).

### 3.2 Normalized Hodge class

On each geometric component of a finite-level quaternionic Shimura curve X_U, let ℒ_U be the imported rational arithmetic Hodge line, with orbifold canonical generic class in the compact case and the specified logarithmic cusp class in the modular case. Define ξ_U=c₁(ℒ_U)/deg(ℒ_U) on that component. It has degree one, is Galois invariant and rational. For a finite level map p:X_V→X_U, p^*ξ_U=deg(p)ξ_V and p_*ξ_V=ξ_U, with degrees taken on each mapped component. Thus ξ-normalization is compatible with level maps; on a compact curve no rational cusp is chosen.

Assume the Hodge degree on each component is positive; coarse stack stabilizer and cusp corrections retained. Finite levels, including the exceptional modular case, are treated individually.

*Outline.* Use the imported Hodge pullback isomorphism and its orbifold/cusp generic-fibre formula. Divide by the component degree and use the finite-map degree formula. Descend the rational class by Galois equivariance.

Its API consists of the following facts:

- c₁(ℒ_U)/deg(ℒ_U), component by component.
- Each geometric component has degree one.
- p^*ξ_U=deg(p)ξ_V, with identity and composite level maps.
- p_*ξ_V=ξ_U.

**Checks.**

- A component with Hodge degree d has normalized degree d/d=1.
- Normalization does not require a rational cusp or a chosen rational point.
- For a connected degree-two level cover, pullback is 2ξ_V and push-forward of ξ_V is ξ_U.

*Consequences.* A compact Shimura curve without rational cusp still has a degree-one rational ξ class.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.2.1, printed pp. 2-3; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.1.3, Lemma 3.1.1, pp. 70–71.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 4 (componentwise Hodge class, including orbifold and cusp terms).

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.2.12, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 3.3 Rational ξ-normalized realization

For a simple A/F that is a quotient of some Jacobian J_U, define π_A^U=Hom_F⁰(J_U,A), equivalently rational maps from X_U to A modulo constants whose rational extension to zero-cycles kills ξ_U. Take π_A=colim_U π_A^U under level pullback. The Hecke/right B_f× action and End_F⁰(A) action commute. A genuine integral map is ξ-normalized only when its value on ξ vanishes in A⊗ℚ; rational maps are not asserted to be ordinary morphisms divided by a denominator.

Assume A is geometrically parametrized by the given Shimura tower. Hom⁰=Hom⊗ℚ; no modularity statement for arbitrary A.

*Outline.* Use the Abel–Jacobi universal property to identify Hom(J_U,A) with maps modulo constants. Use ξ to choose the rational constant and form the filtered colimit. Check commuting actions by the functoriality of correspondences.

Its API consists of the following facts:

- The colimit of Hom_F(J_U,A)⊗ℚ.
- The canonical map from a finite-level Hom⁰ space.
- Two representatives agree iff they agree after pullback to a common finer level.
- The Hecke and endomorphism actions commute.
- The representative rational map sends ξ to zero.

**Checks.**

- A constant map represents zero.
- For A=J_U the Abel–Jacobi map normalized by ξ represents the identity homomorphism.
- A map and its level pullback have the same colimit class.

*Consequences.* Changing a map by a constant does not change its Hom⁰ realization.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.2.1, printed pp. 2-3; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.2.3, pp. 86–87.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 4 (rational ξ-normalized maps and Hom⁰(J_U,A) colimit).

*Needs:* [3.2 Normalized Hodge class](#32-normalized-hodge-class), TauCetiRoadmap.JacobianChallenge Layer F, AbelianSchemesAndArithmeticModuli A6.7.

### 3.4 Strict GL₂ realization and transfer

For a simple F-abelian quotient A of the quaternionic Shimura tower in characteristic zero, the Hecke isotypic summand gives a number field M=End_F⁰(A) with [M:ℚ]=dim A. The rational realization π_A is irreducible over M, its scalar extension to each fixed coefficient embedding is the specified automorphic quaternionic constituent, and it matches the GL₂ Jacquet–Langlands transfer. The rational endomorphism and Galois-field statements concern this parametrized A and its chosen rational Hecke summand.

Fix a nonconstant F-parametrization and its simple quotient A, not an arbitrary abelian variety with matching Hecke traces. For the compact cohomological route, use HilbertModularVarietiesAndShimuraCurves R18.4.25a–R18.4.25 with trivial weight-two coefficients, sufficiently small effective level, trivial rational-scalar stabilizer action, the specified central quotient and all its topological coefficient/completion comparison hypotheses. First enlarge to a splitting characteristic-zero field E admitting actual models of both transferred finite-part representations, as that supplier and GL2AutomorphicRepresentationsAndTransfer R17.3.8 require. Equality of rationality fields is not a model-existence hypothesis. Use R18.3.29 separately for the rank-two Galois multiplicity; retain its homological dual and arithmetic Frobenius convention, and its hypothesis (C) wherever full local compatibility is used. The split rational modular route uses parabolic Jacobian cohomology of ModularCurvesPartII §§14.1–14.7 and 14.13, with its coefficient-comparison hypotheses, and its actual quotient realization in §§16.2–16.5.

*Outline.* Prove the Jacobian comparison here: realization of a homomorphism J_U→A identifies Hom_F⁰(J_U,A), after the chosen splitting extension, with the corresponding weight-two multiplicity maps, compatibly with Hecke actions, level pullback and the rational endomorphism action. The input is the actual Jacobian realization and the supplied cohomological eigenspaces, not rational JL alone. Prove rational Hecke descent from these geometric Hom spaces: the Hecke coefficient field acts faithfully on the simple quotient, its rank-two realization makes Lie(A) rank one over that field tensored with F, and the commuting endomorphism algebra is exactly that field. In particular establish M=End_F⁰(A) and [M:ℚ]=dim A as conclusions of this argument. Construct the M-model on the existing rational Hom⁰ colimit, prove its absolute irreducibility and coefficient-embedding comparison, and only then use R17.3.8 to compare already constructed models under JL. This geometric descent is an owned target; a choice of an E-model alone does not prove descent to M.

**Checks.**

- The zero abelian quotient has Hom⁰(J_U,0)=0 and a zero-dimensional realization; it is excluded by the nonconstant parametrization hypothesis.
- For an elliptic quotient, dim A=[M:ℚ]=1 and a one-dimensional level-invariant automorphic factor times its rank-two multiplicity gives H¹ of dimension 2.
- For dim A=2 and [M:ℚ]=2, the homological realization has rational dimension 4 and M-rank 2. A two-dimensional automorphic invariant factor then gives an isotypic H¹ of dimension 8, not 2.
- A quaternion division algebra D over ℚ has dimension 4 and becomes M₂(E) over a splitting field E, with a two-dimensional simple module there. That module has no two-dimensional ℚ-model: a nonzero D-module has ℚ-dimension divisible by 4. Thus splitting-field irreducibility cannot replace the geometric descent step.

*Consequences.* The theorem contains no assertion that every abelian variety is modular.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.2.1, printed pp. 2-3; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Theorem 3.2.6 and Lemma 3.2.7, pp. 87–88.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 4 (strict GL₂ type and rational realization).

*Needs:* [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, AbelianSchemesAndArithmeticModuli A6.4 and A6.8, `GL2AutomorphicRepresentationsAndTransfer:R17.3`; HilbertModularVarietiesAndShimuraCurves R18.4.25a–R18.4.25, R18.3.29 with the hypotheses just specified; ModularCurvesPartII §§14.1–14.7, 14.13 and 16.2–16.5 for the split rational route; AbelianSchemesAndArithmeticModuli A4.3 (abelian de Rham realization and Hodge sequence).

### 3.5 Manin constant

For a normalized rational newform f of weight two and conductor N, a nonconstant parametrization φ:X₀(N)_ℚ→E and a chosen minimal Néron differential ω_E, define cφ∈ℚ× by φ*ω_E=cφ·ω_f with ω_f=f(q)dq/q=2πif(z)dz. Its sign changes with ω_E, but its p-adic valuation does not. For an isogeny ψ:E→E′ with ψ*ω_E′=aψω_E, c_(ψ∘φ)=aψcφ. Multiplication by n changes c by n and degree by n².

Assume f has a₁=1 and matches E; φ pulls back nontrivially; invariant differential is the minimal one.

*Outline.* Use multiplicity one to identify the pullback differential line. Take the coefficient against ω_f and retain its nonzero rational value. Compose differential pullbacks to prove the isogeny law.

Its API consists of the following facts:

- The nonzero rational coefficient of ω_f in φ*ω_E.
- φ*ω_E=cφω_f.
- c_(ψ∘φ)=aψ cφ, including identity/composition of isogenies.
- Changing ω_E to −ω_E changes cφ to −cφ.

**Checks.**

- For a nonconstant modular parametrization φ and n≠0, composition with [n] multiplies the Manin constant by n and the modular degree by n². The nonzero hypothesis keeps the composite nonconstant.
- The p-adic valuation is invariant under ω_E↦−ω_E.
- For the minimal X₀(11)→11a3 isogeny, cφ=deg φ=5 after a sign choice, so nonoptimal constants are not universally 1.

*Consequences.* The definition does not assume that cφ=1.

([The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction, p.2; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Published Invent. Math. 84 (1986), Chapter V, §2, p.310.)

*Needs:* [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), `NeronModelsAndSemistableAbelianVarieties:R11.1`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 3.6 Volume-normalized composition pairing

For f₁∈Hom⁰(J_U,A) and f₂∈Hom⁰(J_U,A∨), define (f₁,f₂)=(f₁∘λ_J⁻¹∘f₂∨)/vol(X_U), as an element of End⁰(A)=M using the canonical principal polarization λ_J, and its level-U form (f₁,f₂)_U=vol(X_U)·(f₁,f₂)=f₁∘λ_J⁻¹∘f₂∨, the unnormalized composition (CST's notation). The quotient volume is the fixed YZZ geometric volume, scaling by degree under level covers. The projection formula makes the pairing level independent, M-bilinear with the dual action, and perfect on the paired realizations. In dimension one, using the principal polarization of E, (f,f) is deg(f)/vol(X_U) and (f,f)_U=deg f; for dim A>1, (f₁,f₂)_U is an element of the coefficient field M, not a degree.

Assume A and A∨ satisfy the parametrized strict GL₂ hypotheses. The composition includes λ_J⁻¹; f₂∨:A→J_U∨ is not silently identified with a map to J_U.

*Outline.* Compose the two Hom⁰ maps through the Jacobian principal polarization. Use push-pull=[degree] for a finite level map and divide by its geometric volume. Compare the induced polarization to prove perfectness; specialize the pull-push composition to [deg f] for E.

Its API consists of the following facts:

- The End⁰(A) composition divided by curve volume.
- Pullback of both maps preserves the volume-normalized pairing.
- The M action on the first map is adjoint to the dual action on the second.
- The polarized elliptic self-composition is deg(f)/vol(X_U); its level-U form is deg f.
- For the fixed level volume, the composition pairing is additive in each Hom variable, with the dual map additive in the second variable.

**Checks.**

- The pairing is zero when either map is zero.
- A degree-d cover multiplies both the unnormalized composition and the volume by d.
- Postcomposition by a polarized elliptic isogeny of degree m multiplies the self-composition by m.

*Consequences.* Both composition order and dualization are type-correct before taking the scalar coefficient.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.2.2, printed pp. 3-4; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.2.4, Lemma 3.2.9 and Theorem 3.2.10, pp. 89–91.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, pp. 4–5 (composition through Jacobian duality and geometric volume).

*Needs:* [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [3.4 Strict GL₂ realization and transfer](#34-strict-gl-realization-and-transfer), AbelianSchemesAndArithmeticModuli Layer A2, AbelianSchemesAndArithmeticModuli A6.13.

### 3.7 Integral Manin constant and p-unit range

For any modular parametrization φ:X₀(N)_ℚ→E the Manin constant cφ is an integer up to sign. If φ is X₀(N)-optimal and p>2 is a semistable prime for E, then p∤cφ. In particular p∤2N suffices, hence p∤2ND supplies the p-unit statement used by JSW for E and, on choosing its own optimal parametrization, E^D. The sharper semistable statement including p=2 is available by Česnavičius; it does not make a nonoptimal parametrization p-optimal automatically.

Assume Optimal means the Jacobian quotient has connected kernel, equivalently minimal parametrization within the relevant isogeny class. The JSW consumer also needs its stated residual/isogeny hypotheses for transfer to its chosen E.

*Outline.* Prove integrality by reduction to Γ₁(N) and q-expansion lattices (CNS Lemma 6.5). For the p-unit statement let 0→A→J₀(N)→E→0 be the optimal quotient, which has connected kernel A, and apply NeronModelsAndSemistableAbelianVarieties §6.4d (`SemistableQuotientCotangent`) over ℚ_p, where e=1<p−1 because p>2 and J₀(N) is semistable at p because p²∤N: the pullback ω_E→ω_(J₀(N)) of Néron cotangent lattices is injective with free cokernel. By 3.1, X₀(N)_(ℤ_(p)) has rational singularities for such p (CNS Theorem 6.12), so ω_f lies in the Néron lattice H⁰(J₀(N)_(ℤ_(p)),Ω¹) (CNS Corollary 6.14), where it is primitive (CNS Remark 5.16). Since φ^*ω_E=c_φω_f and the cokernel is free, c_φ is a p-adic unit.

*Consequences.* At p∤2ND both optimal constants are p-units. The 11a3 nonoptimal parametrization with c=5 prevents a universal isogeny-class p-unit claim.

([The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction p.2; Lemma6.5; [Global divisibility of Heegner points and Tamagawa numbers](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf), §1, p.812.)

*Needs:* [3.5 Manin constant](#35-manin-constant), [3.1 Integral modular differential lattices at bad primes](#31-integral-modular-differential-lattices-at-bad-primes), NeronModelsAndSemistableAbelianVarieties §6.4d (`SemistableQuotientCotangent`) and R11.1 (Néron lattices and their functoriality).

### 3.8 Manin constant and modular degree

For Γ₁(N)⊆Γ⊆Γ₀(N) and any surjection φ:X_Γ,ℚ→E, define cφ by φ^*ω_E=cφ·ω_f, where ω_E is a Néron differential and ω_f=2πif(z)dz is the differential of the normalized newform f of E pulled back to X_Γ; then cφ divides 6deg φ; if 8∤N and 27∤N, cφ divides deg φ. More precisely v_p(cφ)≤v_p(deg φ)+δp, where δ₂=1 only if v₂(N)≥3 and no prime p′|N has p′≡3 mod4, δ₃=1 only if v₃(N)≥3 and no p′|N has p′≡2 mod3, and δp=0 otherwise.

Assume Néron differential and normalized newform fixed; all constants taken up to sign.

*Outline.* Use CNS's integral dualizing differential theorem and their bounds on the p-adic valuations of local Whittaker newform values (§3, Theorems 3.14–3.15, p.21), which give the bound on cusp expansions of newforms (Theorem 4.6, p.30). The local and cusp-expansion bounds are the preceding targets of 3.1, proved before its integral-lattice comparison. Choose a rational cusp P, the Abel–Jacobi embedding X_Γ→J_Γ and the Albanese map π:J_Γ→E with π^*ω_E=cφω_f. When some Γ⊆Γ′⊆Γ₀(N) has (X_Γ′)_(ℤ_(p)) with rational singularities, ω_f lies in the Néron lattice of J_Γ′ and hence of J_Γ (CNS Theorem 5.15 and Proposition 6.2), so (π^∨)^*ω_f lies in the Néron lattice of E. Then CNS Lemma 7.1, π∘π^∨=[deg φ] on E, gives deg φ·ω_E=(π^∨)^*π^*ω_E=cφ(π^∨)^*ω_f, so v_p(cφ)≤v_p(deg φ). Without rational singularities, track the exceptional 2/3 denominators exactly as CNS Theorem 7.2.

*Consequences.* For X₀(11)→11a3, c=deg=5 satisfies the bound while c=1 would be false.

([The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Theorems1.1–1.2, p.3; §3, Theorems 3.14–3.15, p.21; Theorem 4.6, p.30; Theorem 5.15 and Proposition 6.2; Lemma 7.1 and Theorem 7.2, pp. 46–47.)

*Needs:* [3.5 Manin constant](#35-manin-constant), [3.1 Integral modular differential lattices at bad primes](#31-integral-modular-differential-lattices-at-bad-primes), [3.6 Volume-normalized composition pairing](#36-volume-normalized-composition-pairing), `AutomorphicLFunctionsAndLocalFactors:AL.3`, AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors (the normalized Whittaker newvector), NeronModelsAndSemistableAbelianVarieties R11.1 (Néron lattices and isogeny pullback), TauCetiRoadmap.JacobianChallenge Layers E–F (Jacobians, Abel–Jacobi and Albanese functoriality).

### 3.9 Petersson and modular-degree comparison

Under the fixed complex embedding of M, the composition form on π_A×π_A∨ agrees with the automorphic Petersson invariant form after the stated YZZ volume normalization. Fix local invariant forms whose restricted tensor product is this global form. For f∈S₂(Γ₀(N)) with ω_f=2πif(z)dz and unnormalized Petersson (f,f)=∫|f(z)|²dxdy, i∫ω_f∧overline(ω_f)=8π²(f,f); for φ:X₀(N)→E, φ*ω_E=cφω_f implies i∫φ*ω_E∧overline(φ*ω_E)=|cφ|²8π²(f,f)=deg(φ) i∫_Eω_E∧overline(ω_E).

Assume Pairings use the same coefficient embedding and differential; modular parametrization is nonconstant. The geometric-to-automorphic invariant-form comparison is a theorem, not equality by arbitrary renormalization.

*Outline.* Use weight-two Hodge/cohomology duality and the polarizations to compare the invariant forms. Fix the tensor factorization with unramified unit normalizations. Compute ω_f∧overline(ω_f) and apply finite-map integration to obtain the modular-degree formula.

*Consequences.* An isogeny changing both degree and differential respects the equality.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.2.2, printed pp. 3-4; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), I §6, p.230; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.3.1 and §3.3.3, pp. 94–99; §3.6.3–§3.6.4, Theorem 3.6.2, pp. 110–113; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I, §6, p. 230, and Chapter V, §2, p. 310 (the period and modular-degree identities).)

*Needs:* [3.6 Volume-normalized composition pairing](#36-volume-normalized-composition-pairing), [3.5 Manin constant](#35-manin-constant), AutomorphicFormsOnReductiveGroups §4.2, AutomorphicFormsOnReductiveGroups §7.2, `ModularCurvesPartII:§14.5`, `ModularCurvesPartII:§§14.6–14.7`.

### 3.10 Manin isogeny and twist transfer

For optimal φ₀:X₀(N)→E₀ and ψ:E₀→E, write ψ*ω_E=aψω_E₀. Prove that v_p(c_(ψφ₀))=v_p(aψ)+v_p(cφ₀); the dual isogeny gives aψ aψ∨=deg ψ up to the fixed differential signs. If p∤deg ψ, both valuations of aψ are zero and p-unitness transfers. For a squarefree quadratic twist D and p∤2ND, choose local minimal differentials and the twist isomorphism over ℚ_p(√D); its differential factor is a p-unit, and the optimal twist’s Manin constant is a p-unit. A chosen nonoptimal twist parametrization still requires the same p-prime-to-isogeny condition.

Assume Differentials are minimal at p; twist isomorphism and optimal parametrizations are specified. Isogeny degree is prime to p whenever p-unit transfer is asserted.

*Outline.* Compose the pullback differential equations. Use ψ∨ψ=[deg ψ] on differential lattices to control the two integral factors. At p∤2D the quadratic twist is unramified and its minimal differential scaling is a local unit; apply the optimal p-unit theorem to the twist.

*Consequences.* A degree-p isogeny is not allowed to transfer p-unitness without computing its differential factor.

([The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction pp.2–3.)

*Needs:* [3.7 Integral Manin constant and p-unit range](#37-integral-manin-constant-and-p-unit-range), [3.5 Manin constant](#35-manin-constant), `NeronModelsAndSemistableAbelianVarieties:R11.1`.

### 3.13 Quadratic-twist real-period comparison

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. Let ω be a Néron differential of E and ‖ω‖² = ∫_(E(ℂ)) |ω ∧ ω̄| its norm (Gross–Zagier V §2, p. 310, gz86 line 3325; for E = ℂ/(ℤ+ℤτ) and ω = dz it is 2 Im τ, twice the covolume). With Ω⁰ the fundamental period over E(ℝ)⁰ and (Ω′)⁰ the analogous period of the transported ω′ on E′: ‖ω‖²/|D|^(1/2) = [E(ℝ) : E(ℝ)⁰]·Ω⁰·(Ω′)⁰. These are identity-component periods; Ω in 0.6 denotes the full real period. The ω′ appearing in this formula is the transported differential ω/√D for the chosen complex branch of √D, not automatically a minimal Néron differential of E^D; changing to the minimal differential contributes its explicit rational scalar.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Transport the chosen invariant differential across the quadratic-twist complex isomorphism. The invariant and anti-invariant cycles exchange; compare the period of the transported differential ω/√D. A minimal Néron differential may add a separate rational factor.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §2, p. 312.)

*Needs:* [0.11 Relative-field height comparison](#011-relative-field-height-comparison), [3.5 Manin constant](#35-manin-constant), EllipticCurveModularity Layer R29.5 for the covering π:X₀(N)→E.

### Examples

For a parametrization f and an isogeny ψ of degree d, the target height and deg(ψ∘f) both multiply by d, while the differential multiplier must be included in the Manin scalar. A nonoptimal 11a3 parametrization has Manin constant 5, so an unrestricted p-unit conclusion at p=5 is false.

### Dependencies

HilbertModularVarietiesAndShimuraCurves R18.4.25a–R18.4.25 and R18.3.29, with their stated comparison hypotheses; ModularCurvesPartII §§14.1–14.7, 14.13 and 16.2–16.5; AbelianSchemesAndArithmeticModuli A4.3; Earlier layers 0a, 0. The direct external interfaces used above are TauCetiRoadmap.JacobianChallenge Layer F, AbelianSchemesAndArithmeticModuli Layer A2, AbelianSchemesAndArithmeticModuli A6.13, AbelianSchemesAndArithmeticModuli A6.4 and A6.8, AbelianSchemesAndArithmeticModuli A6.7, AutomorphicFormsOnReductiveGroups §7.2, AutomorphicFormsOnReductiveGroups §4.2, `AutomorphicLFunctionsAndLocalFactors:AL.3`, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.30 (Raynaud's uniqueness of finite flat models for e<p−1), NeronModelsAndSemistableAbelianVarieties §6.4d (SemistableQuotientCotangent), AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors (the normalized Whittaker newvector), `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, EllipticCurveModularity Layer R29.5, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, HilbertModularVarietiesAndShimuraCurves R18.2.12, `ModularCurvesPartII:§§7.2,13.7`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`, `ModularCurvesPartII:§13.1`, ModularCurvesPartII §§7.3–7.4, 9 and 13.2–13.4, `ModularCurvesPartII:§§14.6–14.7`, `ModularCurvesPartII:§14.5`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, TauCetiRoadmap.SchemeAndStackFoundations §§0.17–0.18, TauCetiRoadmap.SchemeAndStackFoundations §2.20. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 4: Local toric functionals and test vectors

Use the actual irreducible local representation and its conductor to determine the toric functional and its test line. A formal eigencondition on an arbitrary representation cannot prove multiplicity one or nonvanishing.

### 4.1 Local toric functional space

For a local field Fv of characteristic zero, a quadratic étale algebra Kv embedded in Bv, an irreducible admissible representation πv of Bv× (generic if split), and χv with χv|Fv×·ωπv=1, define P(πv,χv)=Hom_Kv×(πv,χv⁻¹). Its elements are continuous linear functionals ℓ with ℓ(πv(t)f)=χv(t)⁻¹ℓ(f). At real places use the smooth Casselman–Wallach representation and continuous Hom (AutomorphicFormsOnReductiveGroups §2.7; AutomorphicSpectralTheory §§0.48–0.49); at nonarchimedean places use the smooth category.

Assume Quadratic étale includes Fv×Fv; coefficient field and continuity category fixed.

*Outline.* Restrict the existing representation to the embedded torus. Form the equivariant Hom space using the matching-centre condition.

Its API consists of the following facts:

- The torus-equivariant continuous Hom space.
- ℓ(π(t)f)=χ(t)⁻¹ℓ(f).
- An intertwining isomorphism induces an isomorphism of toric Hom spaces.
- If the centre does not match, every toric functional is zero.

**Checks.**

- If χ(z)ωπ(z)≠1 for some central z, the Hom space is zero.
- Every functional evaluates the zero vector to zero.
- A vector with torus character χ⁻¹ can pair with the functional; one with a different torus character is killed.

*Consequences.* The central-character condition is necessary for a nonzero functional.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1, p.21.)

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.2`, AutomorphicFormsOnReductiveGroups §2.7 and AutomorphicSpectralTheory §§0.48–0.49 for the archimedean Casselman–Wallach category, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`.

### 4.2 Saito–Tunnell dichotomy

For the data of 4.1, dim P(πv,χv)≤1 and equals one precisely when εBC(1/2,πv,Kv⊗χv)=χv(−1)ε(Bv). For a nonsplit quadratic field and a discrete-series GL₂ representation, exactly one of the split algebra and its division inner form is distinguished. For split Kv the distinguished algebra is split. Include the real discrete-series/compact-quaternion alternative using the actual torus weights; nonarchimedean characteristic-zero local fields include dyadic and wildly ramified cases.

Assume πv generic in the split case; division case is compared with its discrete-series transfer. Use base-change epsilon convention, or translate the Rankin convention by ηv(−1).

*Outline.* Import the genuine local correspondence and epsilon factors. Prove multiplicity one and the epsilon criterion by the Tunnell/Saito local character argument. Treat split tori and real discrete-series weights separately; translate CST’s Rankin sign using Layer 0.

*Consequences.* A wrong local Hasse invariant forces zero Hom, including at a dyadic place.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.3, printed p. 10; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1, theorem preceding Lemma3.1; [On Tunnell’s formula for characters of GL(2)](https://www.numdam.org/article/CM_1993__85_1_99_0.pdf), §1, pp.99–100; §2 proof, pp.100–108.)

*Needs:* [4.1 Local toric functional space](#41-local-toric-functional-space), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 4.3 Normalized local toric form

For an essentially unitary local pair (πv,χv) with fixed invariant pairing b_v, define αv(f₁,f₂)=L(1,ηv)L(1,πv,ad)/(ζv(2)L(1/2,πv,Kv⊗χv))·∫_(Kv×/Fv×) b_v(πv(t)f₁,f₂)χv(t)dtv. Use the matching nonzero local factors and the quotient measure on K_v^×/F_v^× of the local measures fixed in Conventions (Characters, signs and measures). The integral is absolutely convergent for these local data and generates P(πv,χv)⊗P(π̃v,χv⁻¹) when distinguished; it is zero otherwise. Define βv=αv/b_v only for pairs with b_v≠0; αv itself is defined for all pairs.

Assume Invariant pairing and quotient Haar measure fixed; essentially unitary; generic in split case. Algebraic rationality is asserted only at finite places with the supplied rational structures. Essentially unitary pair means there is a character μ=|·|^s such that π⊗μ and χ⊗μ_K^(-1) are both unitary, as in CST §3.1. It is not a condition on π alone.

*Outline.* Apply the local matrix-coefficient decay/convergence theorem. Use equivariance of Haar integration and multiplicity one to identify the generated tensor functional. Evaluate spherical data and compare rational structures at nonarchimedean places.

Its API consists of the following facts:

- The L-normalized torus integral αv on πv×π̃v.
- αv is bilinear in its two vectors.
- Scaling dtv by b and b_v by c scales αv by bc.
- Replacing (π,χ) by (π⊗μ,χ⊗μ_K⁻¹) preserves the form with compatible pairings.
- αv=0 if the toric Hom space is zero.

**Checks.**

- For unramified π,χ,K/F and unit-volume compact quotient, αv(f₁,f₂)=b_v(f₁,f₂) on spherical vectors.
- αv(0,f₂)=0 even when βv would be undefined.
- Doubling dtv doubles αv; it does not halve it.

*Consequences.* No denominator b_v is used in the bilinear αv formula.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1, pp.21–22.)

*Needs:* [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [0.10 Rescaling height and period identities](#010-rescaling-height-and-period-identities).

### 4.4 Admissible toric order

Fix n, the conductor of πv^JL, c the conductor of χv, and c₁=0 when Kv is nonsplit and c<n, c₁=c otherwise. An admissible order Rv⊂Bv has discriminant p^n and Rv∩Kv=𝒪_(c₁). When 0<c₁ and n>0 in the split algebra, require Rv=R′∩R″ with R′∩Kv=𝒪_c and R″∩Kv=𝒪_(max(c−n,0)). If Kv is split and 0<c<n, there are two Kv×-conjugacy choices; choose the one whose χ_i(a)=χ(a,1) or χ_i(a)=χ(1,a) has conductor c. This is CST’s order, not every order with the same discriminant.

Assume the Saito–Tunnell matching condition; local characteristic zero. At conductor mismatch where c₁<n, the nonsplit field part uses the torus-character eigenspace rather than claiming all R× invariants work.

*Outline.* Classify torus-conjugacy classes of Eichler orders by their two lattices. Apply CST Definition1.3’s conductor orientation to select an order. For division B use the unique compatible maximal/suborder data and torus eigencondition.

Its API consists of the following facts:

- The order together with its embedded torus and conductor orientation.
- Rv∩Kv=𝒪_(c₁).
- disc Rv=p^n.
- Kv×-conjugation preserves admissibility with transported vectors.

**Checks.**

- For n=c=0 take the maximal order with full 𝒪_K intersection.
- For nonsplit K and c<n, the required intersection is 𝒪_K, not 𝒪_c.
- For 0<c<n in split K, the chosen lattice orientation corresponds to the conductor-c character factor.

*Consequences.* The two split mismatch orders are not interchanged without also changing the character direction.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), Definition1.3 and preceding conditions, pp.5–6.)

*Needs:* [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), AutomorphicLFunctionsAndLocalFactors AL.2, Casselman’s newvector theorem.

### 4.5 Unramified toric value and finite product

For spherical unramified πv and χv on a split Bv, an unramified quadratic field Kv/Fv and dtv the quotient measure of the Conventions, which gives O_(K_v)^×/O_(F_v)^× volume one when δ and D are units, βv(f₁,v,f₂,v)=1. Thus α=⊗vαv is defined on restricted pure tensors with standard vectors and local invariant forms at almost all v; only finitely many normalized factors differ from one. Split unramified tori are evaluated separately with the multiplicative Haar normalization, including both GL₂ Whittaker directions.

Assume the local invariant vector pairing is nonzero when β is used. All unramified normalizations are compatible with the global factorization.

*Outline.* Evaluate the toric matrix coefficient using the spherical Whittaker/Satake expansion. Cancel the local L-factors and quotient volume. Use the restricted tensor product and bilinearity to define the global form, including zero pairs.

*Consequences.* An unramified newvector with ramified χ is not covered by this theorem.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1, spherical-value paragraph.)

*Needs:* [4.3 Normalized local toric form](#43-normalized-local-toric-form), `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`.

### 4.6 Nonzero toric test vectors

For a distinguished local pair, a nonzero toric functional has a nonzero test vector. In the nonarchimedean CST conductor setting the line V(πv,χv) is the central-character eigenspace for the specified admissible-order/newvector subgroup and, when nonsplit c<n, the χv⁻¹ torus eigenspace; CST Proposition3.7 gives dimension one and nonzero toric evaluation. In the split conductor-mismatch case the correct translate/orientation is required. At real places use the matching discrete-series/compact-quaternion weight. The general distinguished characteristic-zero theorem includes dyadic data; the explicit order formulas carry their individual hypotheses.

Assume the exact admissible order and conductor choices of 4.4. For a particular explicit local value, use the relevant CST case rather than a universal spherical assertion.

*Outline.* Apply local multiplicity one and construct the CST invariant/eigenline. Compute its toric integral using the local order and newvector translates. Use the archimedean weight decomposition for the real case.

*Consequences.* Ramified χ can kill the untranslated spherical vector; a nonzero translate is required.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), Definition1.4; Proposition3.7; §3.3.)

*Needs:* [4.4 Admissible toric order](#44-admissible-toric-order), [4.3 Normalized local toric form](#43-normalized-local-toric-form), AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors (the normalized Whittaker newvector).

### 4.7 Explicit local toric constants at test vectors

Let v be a place of F, (π_v,χ_v) a distinguished unitary local pair with π_v of conductor exponent n and χ_v of conductor exponent c, c₁ as in [4.4 Admissible toric order](#44-admissible-toric-order), σ_v the GL₂ Jacquet–Langlands transfer of π_v, f a nonzero vector of the test line V(π_v,χ_v) of [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), and W₀ the normalized new vector of σ_v in its ψ_v-Whittaker model, defined as follows. At nonarchimedean v, ψ_v has conductor δ⁻¹ with δ the different of F_v, and W₀(g)=|δ|^(−1/2)W^♮(diag(δ,1)g), where W^♮ is the normalized Whittaker newvector of AutomorphicLFunctionsAndLocalFactors AL.2 for the conductor-O_v character x↦ψ_v(δ⁻¹x); thus W₀ is ψ_v-Whittaker, W₀(diag(δ⁻¹,1))=|δ|^(−1/2) and |δ|^(s−1/2)Z(s,W₀)=L(s,σ_v). At a real place, with ψ_v(x)=e^(2πix) and σ_v the discrete series of weight k, W₀(diag(y,1))=|y|^(k/2)e^(−2π|y|) for both signs of y (CST §3.4, pp. 26–27, cst line 1652 and cst line 1693). The local measures are those fixed in Conventions, Characters, signs and measures. Write (W,W)=∫_(F_v^×)|W(diag(a,1))|²d^×a, α(W)=(W,W)/(L(1,σ_v,ad)L(1,1_v)L(2,1_v)⁻¹), β(f) the normalized toric integral of [4.3 Normalized local toric form](#43-normalized-local-toric-form) divided by the pairing of f with itself, D the relative discriminant of K_v/F_v, e its ramification index and q the residue cardinality of F_v. For nonarchimedean v, with B_v split in the cases where n ≤ c or K_v is split, prove the following.

- (a) α(W₀)|δ|^(1/2)=1 if σ_v is unramified, and otherwise α(W₀)|δ|^(1/2)=L(2,1_v)L(1,1_v)⁻¹L(1,σ_v,ad)^(−δ_σ), where δ_σ∈{0,1} is 0 exactly when σ_v is a subrepresentation of a principal series Ind(μ₁,μ₂) with at least one μ_i unramified.
- (b) β(f)|Dδ|^(−1/2) equals 1 if n=c=0; L(1,η_v)²|ϖ^c| if n=0<c; L(1,1_v)L(1,π_v,ad)^(δ_π)/L(2,1_v) if n>0, c=0 and K_v is split; L(1,1_v)L(1,η_v)²|ϖ^c|L(1,π_v,ad)^(δ_π)/(L(2,1_v)L(1/2,π_v,χ_v)) if nc>0 and either K_v is split or c≥n; and e(1−q^(−e))L(1,π_v,ad)/L(1/2,π_v,χ_v) if n>c and K_v is nonsplit. Here δ_π is δ_σ for σ_v=π_v, and the value is independent of the choice of f.
- (c) α(W₀)β(f)γ|D|^(−1/2)=2^(δ(Σ_D))L(1/2,π_v,χ_v)^(−δ(Σ))L(1,η_v)^(2δ(c₁))q^(−c₁), where δ(Σ_D)=1 exactly when K_v is ramified, n>0 and c<n; δ(Σ)=1 exactly when n>0, K_v is ramified or c>0, and c≥1 in case n=1; δ(c₁)=1 exactly when c₁≠0. The volume factor γ is the ratio Vol(R^×)/Vol(U₀(ϖ^n)) for the admissible order R, computed with the local measures fixed above, so that it is defined for B_v split or division; it is 1 when n=0, and for n>0 it is L(1,1_v)(1−e(R)q⁻¹), where the Eichler symbol e(R) is 1 if K_v is split, or K_v is ramified with n=1 and B_v split, or K_v is nonsplit with c≥n; −1 if K_v is inert with c<n, or K_v is ramified with n=1, B_v division and c=0; and 0 if K_v is ramified with n≥2 and c<n.
- (d) For archimedean v: α(W₀)β(f)=C(π_v,χ_v)⁻¹L(1/2,π_v,χ_v)⁻¹ if K_v/F_v=ℂ/ℝ, and α(W₀)β(f)=C(π_v,χ_v)⁻¹ if K_v=F_v², where C(π_v,χ_v)=π/(2(W₀,W₀)) in the first case and (W₀′,W₀′)/(W₀,W₀) in the second, W₀′ the new vector of π_v⊗χ₁ for χ₁(a)=χ_v(diag(a,1)). For the discrete series of weight k, (W₀,W₀)=2(4π)^(−k)Γ(k), α(W₀)=2^(−k), and C(π_v,χ_v)=4^(k−1)π^(k+1)Γ(k)⁻¹ if K_v=ℂ and 1 if K_v=ℝ².

Require π_v and χ_v themselves to be unitary and use their invariant positive Hermitian pairings. For an essentially unitary pair first choose μ=|·|^s with π_v⊗μ and χ_v⊗μ_K⁻¹ unitary, evaluate all squared norms on that realization, and transport the bilinear form on π_v×π̃_v by §4.3. Do not apply its Hermitian squared norm to the original nonunitary Whittaker function. Assume the matching conditions of [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy) at v; the local measures fixed above, whose product gives total volume 2L(1,η); the admissible order and test line of 4.4 and 4.6.

*Outline.* (a) Insert the explicit new vectors of principal series, special and supercuspidal representations and integrate |W₀|² over F_v^×. (b) Reduce to β⁰=∫_(F_v^×\K_v^×)(π(t)f,f)/(f,f)·χ(t)dt; when n>c and K_v is nonsplit, f is χ⁻¹-eigen and β⁰=Vol(F_v^×\K_v^×); otherwise B_v is split, choose the embedding of K_v for which the standard Eichler order of level n is admissible, and evaluate the matrix-coefficient integral using the explicit Whittaker new vector. (c) Multiply (a), (b) and γ, computing e(R) from the residue algebra of R. (d) Use Barnes' lemma for (W₀,W₀) and evaluate β⁰ at the explicit archimedean vector.

**Checks.**

- For F_v=ℚ₃, π₀=Ind(1,1) and the unramified quadratic torus, W₀(diag(3^m,1))=(m+1)3^(−m/2). With unit shell measure its squared norm is Σ_(m≥0)(m+1)²3^(−m)=9/2; the adjoint normalization gives α(W₀)=1.
- For π=π₀⊗|det|⁻¹ and χ=|N_(K_v/F_v)| the corresponding terms are (m+1)²3^m, beginning 1,12,81. They do not tend to zero, so that squared norm is outside this theorem. Twisting by μ=|·| recovers the preceding unitary norm and the same bilinear toric form.
- In weight two with K_v=ℂ, (W₀,W₀)=1/(8π²), α(W₀)=1/4 and C=4π³. These use the unitary discrete series, with a positive self-pairing.

*Consequences.* At a place where F_v/ℚ_p and K_v/F_v are unramified, so that δ and D are units, and n=c=0, every factor in (c) equals 1, recovering [4.5 Unramified toric value and finite product](#45-unramified-toric-value-and-finite-product). For n=c=0 with K_v ramified, (c) gives α(W₀)β(f)=|D|^(1/2) instead. In weight two at a real place with K_v=ℂ, C(π_v,χ_v)=4π³ and α(W₀)β(f)=1/(4π³L(1/2,π_v,χ_v)). Replacing γ by 1 at a ramified place with n≥2 and c<n loses the factor L(1,1_v).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1, p.21, unitary reduction (cst line 1328 and cst line 1344); §3.4, Proposition 3.11, p. 26; Proposition 3.12, p. 27; §3.3, Lemma 3.5, p. 23; Lemma 3.13, p. 30; Lemma 3.14, p. 31.)

*Needs:* [4.3 Normalized local toric form](#43-normalized-local-toric-form), [4.4 Admissible toric order](#44-admissible-toric-order), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors (the normalized Whittaker newvector), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### Examples

At an unramified place use the spherical vector with the exact local measure to get α_v=1. If a torus element t fixes f but χ(t)=ζ₃≠1, the vector is outside the χ^(-1) test line. With q=p², conductor lengths are ord_π lengths and are not ord_p lengths.

### Dependencies

Earlier layers 0a, 0. The direct external interfaces used above are `AutomorphicLFunctionsAndLocalFactors:AL.3`, AutomorphicLFunctionsAndLocalFactors AL.2, Casselman’s newvector theorem, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors (the normalized Whittaker newvector), `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `SmoothRepresentationsOfLocalGroups:SR.2`. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 5: Coherent theta lifting and central values

The coherent theta comparison gives products of toric periods and central L-values. The split quaternionic case uses its Shimizu specialization; the binary norm space may remain anisotropic when its containing quaternion algebra is split.

### 5.1 Coherent quaternionic theta specialization

For coherent quaternionic B/F and an embedded nontrivial quadratic field K/F, specialize the imported extended Weil representation and unit-quotiented theta kernel to q=Nrd_B and its binary norm subspaces K and Kj. Each binary norm is anisotropic even when B is split: with probability Haar, E(0,g,Φ)=2∫θ(g,h,Φ)dh. In YZZ’s toric convention, where the quotient has volume2L(1,η), the double toric theta integral is L(1,η)I(0,g,χ,Φ). For division B the toric Shimizu/Petersson contraction and its unfolding are MetaplecticAutomorphicForms §6.22 (`toricTheta_pairingComparison`), used as they stand; the owned content of this target is the split case. For split B the generic ternary second-term identity remains an identity modulo the residual image. Prove the needed exact Shimizu comparison separately by the cuspidal split calculation below.

Assume Adelic additive character, self-dual measures, torus quotient and probability measures compared by Layer 0. Convergence/regularization regime is matched to binary/ternary Witt index, not assumed. For O(V_m)×Sp_(2n), ordinary convergence requires r=0 or m−r>n+1. Here n=1; a quadratic-field norm has (m,r)=(2,0), division trace-zero data have (3,0), and split trace-zero data have (3,1), outside the ordinary range. The generic split binary (2,1) is an additional MP supplier case, not the norm of this K/F. YZZ’s 2011 draft Proposition2.2.1 proves the nonsplit case by Siegel–Weil and refers its split case to a different Waldspurger argument.

*Outline.* Import the exact binary norm and ternary trace-zero exports of MetaplecticAutomorphicForms §6.16 (`normTheta_integralRange`). Compare their Haar and Weil splittings to the toric conventions. For division B import MetaplecticAutomorphicForms §6.22. For B=M₂(F), contract the matrix-norm theta series against a nonzero cusp vector φ in π using the invariant Petersson pairing. Its image, as the Schwartz vector varies, is the automorphic external tensor π⊠π∨ in the two GL₂ variables (the dual is identified using the invariant pairing); this is the split case of Waldspurger II.1 Theorem 1. For a pure tensor Φ, take the double Whittaker coefficient U_Φ of this contracted kernel. Waldspurger II.2 Proposition 3 gives U_Φ(g₁,g₂)=∏_v U_(Φ_v)(g₁,v,g₂,v), with factor 1 at almost every normalized unramified place. Locally U_(Φ_v) is the N(F_v)\GL₂(F_v) integral of W_v(σ) times the partial Fourier transform of r(σ,g₁,g₂)Φ_v evaluated at (1,−1,0,1,−1); the Fourier transform and its self-dual measure are fixed in II.2, p. 184. Under (g₁,g₂)↦(n(a)g₁,n(b)g₂) it transforms by ψ_v(a+b), in that source convention. The integral converges. Use this coefficient identity, uniqueness of Whittaker models and cuspidality to obtain the contraction with its scalar, rather than discarding residual terms of a ternary regularized formula. Translate the right-action/dual convention when converting it to the bilinear toric formula.

Its API consists of the following facts:

- thetaNormSpecialization compares the actual norm-form Weil kernel.
- splitShimizuContraction is the cuspidal matrix-norm contraction.
- splitShimizu_range identifies its automorphic tensor image.
- splitShimizu_doubleWhittaker is the product formula with the chosen partial Fourier transform.
- splitShimizu_unramified fixes the almost-everywhere scalar to 1. These split comparisons are owned here, not exported from a ternary identity modulo residual forms.

**Checks.**

- For split B and a nonzero cusp representation the contraction spans its nonzero automorphic external tensor; a zero residual-class representative cannot be used in place of the kernel.
- At a normalized unramified place the local factor is 1, so changing an unramified factor to the torus volume gives the wrong global scalar.
- The two translations n(a),n(b) multiply U by ψ_v(a+b); taking b=−a gives factor 1. Reversing only one character fails this witness.
- The zero Schwartz vector has zero contraction and zero Whittaker coefficients, without dividing by a vector value.

*Consequences.* The binary norm identity alone is insufficient: the ternary identity is a separate prerequisite. The generic split binary supplier uses A₁=B₀; it is not the quadratic-field norm used here. Neither that exceptional formula nor the split ternary quotient identity alone replaces the explicit split contraction above.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.4.2, printed pp. 11-12; [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3), arXiv:1207.4709v3 §1.7, pp.3–4; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), Public 2011 draft, §2.2.1, Proposition 2.2.1 and proof, printed pp.47–49; [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf), II.1 Theorem 1, p. 184; II.2 Proposition 3 and corollary, pp. 184–187.)

*Needs:* MetaplecticAutomorphicForms §6.16, MetaplecticAutomorphicForms §6.22, MetaplecticAutomorphicForms §6.15, [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison).

### 5.2 Half-weight Waldspurger value

Fix φ(z)=2√y Σ_(n≠0) a(n)K_(ir)(2π|n|y)e(nx), a nonzero even level-one Hecke–Maass eigenform, a(1)=1. Choose the associated weight-1/2 Kohnen-plus eigenline at parameter r/2 and its vector F(z)=Σ b(n)W_(sgn(n)/4,ir/2)(4π|n|y)e(nx), normalized by (F,F)=1 under the DIT Petersson convention. For a nonzero fundamental discriminant d, 12π|d||b(d)|²=(φ,φ)⁻¹Γ(1/2+ir/2−sgn(d)/4)Γ(1/2−ir/2−sgn(d)/4)L(1/2,φ⊗χ_d). The phase of F is free and both sides are phase-invariant. The twisted L-function is the finite Dirichlet-series L-function; the two displayed gamma factors are not already included in it.

Assume r is real; φ is even and normalized by a(1)=1, rather than unit Petersson norm. The half-weight form has the specified Whittaker and Petersson normalization, including the plus condition at 2.

*Outline.* Import the Hecke-equivariant Kohnen-plus/GL₂ eigenline correspondence, including the operator at 2 and the eigenvalue parameter r/2. Own the coefficient-norm identity (DIT (5.17)), in addition to that eigenline correspondence: compare the global relative Whittaker/Bessel distributions and factor their norms on the selected vectors. The unramified odd-prime factors are the finite twist Euler factors; at primes dividing d use the ramified quadratic newvector, at 2 use the Kohnen-plus vector, and at infinity evaluate the signed Whittaker Mellin integrals. Their product in the displayed classical Fourier normalization is the two gamma factors divided by 12π|d|. This scalar identity is proved here, rather than presumed from the eigenline bijection of MetaplecticAutomorphicForms §7.34. Compare the unnormalized Γ₀(4) area with its index 6 in the level-one group. Pass to the unit half-weight vector; its arbitrary phase disappears in |b(d)|².

Its API consists of the following facts:

- halfWeightCoefficient_norm states the displayed identity for a unit vector.
- halfWeightCoefficient_norm_rescale multiplies the right side by the squared Petersson norm of an arbitrary nonzero half-weight vector.
- halfWeightCoefficient_phase and halfWeightCoefficient_signedGamma record phase invariance and the two real signs.

**Checks.**

- At d>0 the gamma arguments have real part 1/4; at d<0 they have real part 3/4. Replacing both by 1/2 loses the real Whittaker type.
- Rescaling F to have squared norm 6 changes the coefficient 12 to 2; normalized-area Petersson measure cannot be substituted without this factor.
- Multiplication by a unit complex phase leaves |b(d)|² unchanged; multiplication by 2 multiplies both |b(d)|² and its squared norm by 4.
- A zero central L-value forces b(d)=0; the proof cannot divide by b(d) or by an auxiliary central value.

*Consequences.* d>0 uses gamma real part 1/4; d<0 uses 3/4. Multiplying F by e^(iθ) leaves the identity unchanged. Rescaling φ without a(1)=1 would change its Dirichlet coefficients and is not allowed without an explicit adapter.

([Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), published Annals 184 (2016), §5 Theorem4 pp.965–966 and (5.17) p.966.)

*Needs:* MetaplecticAutomorphicForms Layer 7, `AutomorphicLFunctionsAndLocalFactors:AL.3`, AutomorphicFormsOnReductiveGroups §4.5.

### 5.3 Waldspurger period formula

Fix π, a cuspidal quaternionic automorphic representation, K/F quadratic with ωπχ|A_F×=1, and χ unitary. Define Pχ using probability measure on K×A_F×\A_K×, the global invariant form using quaternionic Tamagawa volume 2, and α as the restricted tensor product of Layer 4’s local bilinear forms α_v, each formed with a local invariant pairing b_v on π_v×π̃_v. The b_v are normalized so that ⊗_v b_v is the Petersson pairing of π×π̃ for Tamagawa measure of volume 2 on B^×𝔸_F^×\B_𝔸^×; doubling b_v at one place doubles α(f₁,f₂) and leaves the period product unchanged, so this normalization is part of the statement. Here ζ_F(2) denotes the complete value L(2,1_F)=Γ_ℝ(2)^[F:ℚ]·ζ_F^fin(2), where ζ_F^fin is the Dedekind zeta function without archimedean factors; every archimedean factor is Γ_ℝ because F is totally real (for a field with r₂ complex places the factor would be Γ_ℝ(2)^(r₁)Γ_ℂ(2)^(r₂)), and L(1/2,π_K⊗χ), L(1,π,ad) and L(1,η) are complete, with their archimedean factors, matching the local factors of α_v at every place (CST §2, (2.1) and the definition of β_v, p. 13, cst line 789; the convention for L(s,1_F), p. 3, cst line 168). For all f₁∈π and f₂∈π̃, Pχ(f₁)Pχ⁻¹(f₂)=ζ_F(2)L(1/2,π_K⊗χ)/(8L(1,η)²L(1,π,ad))·α(f₁,f₂). This is an identity of bilinear forms, including zero global/local pairings. With quotient-volume2L(1,η) periods, the constant becomes ζ_F(2)L(1/2)/(2L(1,π,ad)).

Assume π is cuspidal; relevant local L-factors and adjoint value are nonzero/finite. The toric and Petersson measures are the distinct normalizations above.

*Outline.* Use the quadratic-field binary Siegel–Weil identity and toric see-saw, together with the normalized Shimizu factorization. Its nonsplit case is the toric theta pairing of MetaplecticAutomorphicForms §6.22; its split case is the separate comparison of [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), not an automatic consequence of GQT’s quotient formula. Unfold the global pairing to local Whittaker/toric integrals. Evaluate the unramified factors and compare the adjoint Petersson normalization. Translate quotient periods to probability periods and extend by bilinearity without division.

*Consequences.* Zero toric Hom at any place forces the global form to vanish. Scaling torus Haar measures respects the squared period factor.

Its period API consists of the following facts:

- The period is linear in its vector and uses the fixed probability measure.
- The product of the two inverse-character periods is the displayed bilinear form, including zero inputs.
- Replacing each probability measure by its quotient-volume measure multiplies the product by (2L(1,η))².

**Checks.**

- A zero vector gives period product 0 and local bilinear product 0; no normalized matrix-coefficient quotient is needed.
- Scaling the first vector by 2 and the second by 3 multiplies both sides by 6.
- For torus volume 4, the product of volume periods is 16 times the probability product; dividing by 4 alone leaves a factor 4 error.


([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.4, printed p. 11; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2 equation(2.1), pp.12–13; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math.84(1986), Chapter IV §5, p.292, discussion of the squares furnished by Waldspurger’s theorem; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.4.2 Theorem1.4.2 pp.20–23; §2.4 pp.53–55; [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf), II.1 Theorem 1, p. 184; II.2 Proposition 3 and corollary, pp. 184–187.)

*Needs:* [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), [4.5 Unramified toric value and finite product](#45-unramified-toric-value-and-finite-product), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), [4.3 Normalized local toric form](#43-normalized-local-toric-form), [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors), `AutomorphicLFunctionsAndLocalFactors:AL.3`; the local measures of the Conventions.

### 5.4 Toric period nonvanishing criterion

A cuspidal quaternionic π has a nonzero χ toric period precisely when every local Hom P(πv,χv) is nonzero and L(1/2,π_K⊗χ)≠0. In the matching case, choose local vectors with αv≠0 at the finitely many ramified places and spherical vectors elsewhere; their global period product is nonzero by Waldspurger. If either condition fails every period vanishes. This criterion does not assert the existence of a nonvanishing quadratic twist without a separate analytic nonvanishing input.

Assume the invariant dual pairings and L-function hypotheses of 5.3.

*Outline.* Use local distinction for necessity of the Hom conditions. Use the bilinear identity for the central-value condition and construct a pure tensor with nonzero local form for sufficiency.

*Consequences.* A local sign mismatch yields zero even when the central L-value is nonzero.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.1 and Theorem1.8.)

*Needs:* [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors).

### 5.5 Finite test-vector variation

For pure tensors fᵢ and fᵢ′ agreeing outside a finite set S, the cross-multiplied Waldspurger identities compare the two period products by the corresponding αv products at S. Where all pairings and toric factors are nonzero, the ratio form is ∏_(v∈S)βv(f₁,v′,f₂,v′)/βv(f₁,v,f₂,v), together with the changed Petersson pairing. This specializes to split, ramified and definite quaternionic admissible-order lines without dropping conductor, unit-index, removed-Euler or archimedean factors.

Assume Ratio notation used only when each stated denominator is nonzero. Explicit CST local factors apply only in their stated conductor cases.

*Outline.* Apply the bilinear formula twice and cancel equal unramified factors. Translate the trace/class-group sum period to the quotient integral using its class number and volume. For explicit cases insert CST §3’s local toric values.

*Consequences.* The formula remains cross-multiplied if a test-vector pairing is zero.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), Theorem1.9, pp.11–12.)

*Needs:* [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [0.10 Rescaling height and period identities](#010-rescaling-height-and-period-identities).

### 5.6 Petersson pairing as a product of local Whittaker pairings

Let σ be a cuspidal automorphic representation of GL₂(𝔸_F) with contragredient σ̃, ψ the fixed additive character, W₁(g)=∫_(N(F)\N(𝔸))φ₁(ng)ψ(n)⁻¹dn and W₂(g)=∫_(N(F)\N(𝔸))φ₂(ng)ψ(n)dn for φ₁∈σ and φ₂∈σ̃, so W₁∈W(σ,ψ) and W₂∈W(σ̃,ψ⁻¹), ⟨W₁,W₂⟩_v=∫_(F_v^×)W₁(diag(a,1))W₂(diag(a,1))d^×a the invariant pairing of the local Whittaker models of σ_v and σ̃_v, and ⟨φ₁,φ₂⟩_Pet=∫_(Z(𝔸)GL₂(F)\GL₂(𝔸))φ₁(g)φ₂(g)dg with the measures fixed in Conventions (Characters, signs and measures). Prove that for pure tensors φ₁∈σ, φ₂∈σ̃ with W_i=⊗_vW_(i,v), ⟨φ₁,φ₂⟩_Pet=2L(1,σ,ad)L(2,1_F)⁻¹∏_vα_v(W_(1,v),W_(2,v)), where α_v(W₁,W₂)=⟨W₁,W₂⟩_v/(L(1,σ_v,ad)L(1,1_v)L(2,1_v)⁻¹). For the normalized new vectors almost every factor is 1 by [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors)(a), so the product is finite.

Assume σ cuspidal; ψ and the local Haar measures as fixed in Conventions (Characters, signs and measures), with dg=|b|dx d^×a d^×b dk in the Iwasawa coordinates and the maximal compact subgroup of volume L(2,1_v)⁻¹|δ_v|² at finite v. L(1,σ,ad) and L(2,1_F)=ζ_F(2) in the same completion convention as [5.3 Waldspurger period formula](#53-waldspurger-period-formula).

*Outline.* Unfold the Petersson pairing against the Eisenstein series E(s,g,Φ) built from a Schwartz function on 𝔸², use the local identity ∫_(F_v^××U_v)Φ([0,b]k)|b|²d^×b dk=Φ̂_v(0) for the compact volumes, and take the residue at s=1, where the Rankin–Selberg integral of σ×σ̃ has the pole whose residue is the adjoint value. Normalize each local Rankin–Selberg zeta integral by its L-factor.

*Consequences.* It is the comparison of L(1,σ,ad) with the Petersson norm (φ,φ)_(U₀(N)) of the newform used by [8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian](#814-the-explicit-grosszagier-formula-of-caishutian). Scaling one local Whittaker pairing by c scales α_v and the product by c, consistently with the bilinear form; the global constant 2 is the quotient volume of Layer 0 and changes if that volume is changed.

**Checks.**

- In the unitary case φ₂=overline(φ₁), the opposite-character definition gives W₂=overline(W₁), so the local integral is ∫|W₁|²d^×a.
- At a real place, the holomorphic weight-two vector and its antiholomorphic contragredient have opposite support if both use ψ; their product then vanishes. Giving the second vector ψ⁻¹ recovers the nonzero Petersson norm.
- A zero tensor gives zero on both sides without division by its pairing.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.1, Proposition 2.1 and (2.2), p. 14.)

*Needs:* AutomorphicFormsOnReductiveGroups §4.2, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors).

### Examples

For a trivial finite torus orbit the probability period is the value of the vector; the raw period is multiplied by its quotient volume. A double raw period has the square of that volume. Zero vectors force both sides of the bilinear formula to vanish without dividing by their Petersson pairing.

### Dependencies

Earlier layers 0a, 0, 3, 4. The direct external interfaces used above are AutomorphicFormsOnReductiveGroups §4.5, AutomorphicFormsOnReductiveGroups §4.2, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, MetaplecticAutomorphicForms §6.15, MetaplecticAutomorphicForms §6.16, MetaplecticAutomorphicForms §6.22, MetaplecticAutomorphicForms Layer 7. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 6: Rankin and arithmetic theta kernels

Build the Fourier kernels and the proper cycle-valued kernels together with their normalizations. Projection and central averaging are named operations. Auxiliary local functions come before the derivative formulas that use them. Sections are listed in dependency order and are cited by their numbers, so the numbers do not always increase down the page.

### 6.1 Petersson projectors and their growth domains

At fixed level and central character let S be the finite-dimensional holomorphic cuspidal space of parallel weight two, with its unnormalized Petersson pairing. For a smooth automorphic H for which pairing with every cusp form converges absolutely, define Π_cusp H by ⟨f,Π_cusp H⟩=⟨f,H⟩ for every f∈S (first-variable linear convention). An orthonormal basis gives the finite Riesz sum, independently of basis. This definition also covers logarithmic cusp growth, since cusp forms decay exponentially. It does not say that H is holomorphic.

For the classical Fourier kernels in weight 2k>2, Gross–Zagier IV (5.1) applies to H=Σ_m b_m(y)e^(2πimx) of moderate growth O(y^(−ε)) at every cusp: the m-th coefficient (m>0) of the projection is (4πm)^(2k−1)/(2k−2)! times ∫₀∞ b_m(y)e^(−2πmy)y^(2k−2)dy. Prove that this coefficient formula and the pairing definition give the same cusp form. In weight two (5.1) does not apply, because the kernel grows like A_ξ log y+B_ξ at the cusp ξ; the projector is still defined by the pairing, and its coefficients in that case are given by 6.55, which builds on this target. Eisenstein series have zero cuspidal pairing; old cusp forms are removed only by the additional orthogonal new projector.

For F totally real, decompose fixed-level forms into the finite central-character quotient F×\A_f×/(U∩A_f×). Define Π_cusp on each component. Under (Q′), the two split auxiliary local conditions r(g)φ_v(0,u)=0 for every g,u give the Whittaker growth needed to identify this projector with the projected derivative formula. This is the projection input to the Colmez computation, not a consequence of ordinary spectral decomposition alone.

*Outline.* Finite-dimensional positivity gives existence/uniqueness and adjunction. For the classical coefficient formula in weight 2k>2 unfold the Poincaré series P_m. Bound truncated tails against the exponentially decreasing cusp form to pass finite parts through the pairing. For the quaternionic kernel prove the two-auxiliary-place vanishing eliminates the nondecaying constant terms, as in Yuan–Zhang §7.1 Assumption 7.1 and Theorem 7.2, and use the same pairing characterization. Apply AutomorphicFormsOnReductiveGroups §7.2 (the GL₂ adelization) only to transfer the resulting cuspidal forms to their adelic realization.

Its API consists of the following facts:

- The weight-two cuspidal projector is defined on precisely the domain of absolute pairing with all cusp forms and satisfies its defining pairing equality.
- It fixes cusp forms and is independent of the orthonormal basis; in weight 2k>2 its Fourier coefficients are those of Gross–Zagier IV (5.1) displayed above.
- The orthogonal new projector additionally removes the old cuspidal summand.
- The parallel-weight-two projector is compatible with the finite central-character decomposition.
- Both auxiliary split-place conditions give the growth domain required for the Colmez derivative projection.

**Checks.**

- Π_cusp f=f for a nonzero cusp form; projecting to zero fails the pairing test.
- E₂* has zero cuspidal projection, but a nonzero old cusp form retains itself until the new projector is applied.
- For H=f=Σa(m)e^(−2πmy)e^(2πimx), the coefficient integral returns a(m), detecting either a missing 4πm or a doubled exponential.
- With k=2 and b_m(y)=e^(−2πmy), the weight-four factor (4πm)³/2! times ∫₀∞e^(−4πmy)y²dy=2/(4πm)³ gives 1; using the weight-two factor 4πm alone gives the wrong value.
- Dropping one of the two auxiliary split-place conditions does not give the asserted Colmez growth theorem; the surviving Eisenstein correction must remain.
- Changing orthonormal basis by a unitary matrix leaves the finite Riesz sum unchanged.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), IV §5, Proposition (5.1), pp. 288–289; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §7.1, Assumption 7.1 and Theorem 7.2, pp. 587–588.)

*Needs:* Tau Ceti `CuspForm.peterssonInnerCosets`, AutomorphicFormsOnReductiveGroups §7.2, AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18 for meromorphic Eisenstein families, Mathlib finite-dimensional inner-product spaces.

### 6.2 The classical V-kernel, terminating polynomials and decay

For the polynomials p_(k,r), p_n and the decay integral q_n(t) of AutomorphicSpectralTheory §§0.43–0.44, prove the derivative and uniform-tail bounds needed by the Rankin Mellin calculation. Here k≥1, 0≤r≤k−1, n≥0 and t>0. For each a>0 and derivative order j≥0, give a constant C_(n,j,a) bounding the j-th derivative on t≥a by C_(n,j,a)e^(−t)/t. Differentiation under the integral is justified by an integrable majorant on each such half-line. In particular q₀′(t)=−e^(−t)/t. Compare p_(k,k−1) with p_(k−1)(t)=Σ_(j=0)^(k−1) C(k−1,j)(−t)^j/j!, and construct the Mellin finite part by subtracting its explicit constant and logarithmic terms before continuation. Use the removable extension of the completed V-kernel at gamma poles.

Its API consists of the following facts:

- The supplied polynomial specializations agree with the Laguerre normalization used in the coefficient formulas.
- Differentiating q_n under its integral is valid on every closed half-line t≥a>0.
- Every fixed derivative has the stated exponential tail bound with its dependence on n, j and a.
- The Mellin finite part is the continued remainder after the specified constant and logarithmic subtractions.

**Checks.**

- p₀(t)=1, p₁(t)=1−t and p₂(t)=1−2t+t²/2; at t=1 these are 1, 0 and −1/2. Omitting the binomial coefficient gives the wrong third value.
- p_(2,0)(t)=t²/8, whereas p_(2,1)(t)=1−t; at t=2 these are 1/2 and −1.
- q₀(t)>0 and q₀′(1)=−e^(−1). A polynomial branch has neither this derivative nor the required tail.
- At k=1 and t>0 the supplied V₀(t)=−2πi e^(−2πt); its negative-frequency value is 0 and its central derivative is nonzero.
- q₀ diverges logarithmically at 0; no bound on t≥0 follows by setting a=0.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter IV §3, Proposition (3.3d–e), pp. 278–281, and §5, pp. 288–294; the derivative and tail bounds follow by differentiation and x=1+u in the displayed q-integral.)

*Needs:* AutomorphicSpectralTheory §§0.39–0.45; Mathlib `MeasureTheory.integral`; AutomorphicLFunctionsAndLocalFactors AL.0 for Mellin transforms and their differentiation.

### 6.3 Special correspondence cycle

For x∈B_f× and U_x=U∩xUx⁻¹, define Z(x)_U as the proper cycle push-forward of [X_(U_x)] under (p,p∘T_x):X_(U_x)→X_U×X_U. Multiplicities are generic residue degrees, including a noninjective level map; Z(x)_U is not its reduced image. Its action on Pic⁰ is the actual Hecke correspondence push-pull. Level composition obeys the double-coset convolution with multiplicities.

Assume Finite levels and proper maps; coarse/stack multiplicities specified by the imported cycle formalism.

*Outline.* Construct the two finite level maps from the imported Hecke tower. Apply proper push-forward to the fundamental cycle, with residue degrees. Use base change and composition of proper push-forward to identify its Pic⁰ action.

Its API consists of the following facts:

- The proper push-forward cycle Z(x)_U.
- Its Pic⁰ action is the Hecke push-pull map.
- Level pullback/push-forward matches the proper-cycle multiplicities.
- Composition is double-coset convolution with its counting coefficients.

**Checks.**

- At x=1 the cycle is the diagonal with its proper multiplicity.
- A generically degree-two parametrization produces twice the reduced image.
- The induced correspondence sends the zero Pic⁰ class to zero.

*Consequences.* A degree-d map onto its image contributes d times that image.

([Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), item30 and §2; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607.)

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.1.3 (QuaternionicShimuraCurve and quaternionicCurve_changeLevel); ShimuraVarieties §§8.3–8.5 and 8.22 (finite Hecke tower and datum maps); ModularCurvesPartII §§9.1, 9.9–9.10, 9.13 and 13.2–13.4 for the split modular specialization; MotivesAndAlgebraicCycles §0.1 (graded correspondences); SchemeAndStackFoundations §§5.1–5.8 (cycles, proper pushforward, flat pullback and projection formulas).

### 6.4 ξ-normalized CM divisor

For an imported CM point [h] on X_U and its geometric component c(h), define [h]⁰=[h]−ξ_(U,c(h)) in Pic⁰(X_U)⊗ℚ, then in the Jacobian via the Abel–Jacobi identification. Subtraction is componentwise: a Hodge class on a different component does not give a degree-zero divisor. The finite-character sum uses the same trace/average and reciprocity convention as Layer 0.

Assume the quaternionic CM points and their reciprocity are supplied by 0a.4; the rational Hodge class is fixed by 3.2.

*Outline.* Subtract the degree-one class on the point’s component. Pass to the imported Pic⁰/Jacobian and check Galois/Hecke equivariance.

Its API consists of the following facts:

- The class [h]−ξ on the CM component.
- It has degree zero on every component.
- Galois transport sends the point and its component Hodge class together.
- Character sums use the selected inverse-character projector.

**Checks.**

- 1−1=0 on the point’s component and zero on all others.
- Subtracting ξ on a different component leaves degrees 1 and −1, so is not componentwise Pic⁰.
- A divisor equal to the chosen ξ has normalized class zero.

*Consequences.* An unnormalized degree-one CM divisor cannot be used directly in a Jacobian height.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.5.5, printed p.24; §3.1.3, printed pp.70–71; §5.1.2, printed p.183.)

*Needs:* [3.2 Normalized Hodge class](#32-normalized-hodge-class), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), TauCetiRoadmap.JacobianChallenge Layer F.

### 6.5 Pseudo-theta datum

Fix an even-dimensional positive definite quadratic space V over F and V₁⊆V an even-dimensional F-subspace with the induced form. Either V₀=∅, or V₀ is a proper even-dimensional F-subspace of V₁; equality V₁=V is allowed. Let S be a finite set of nonarchimedean places, φ^S ∈ S̄(V(A^S)×A^(S,×)) with standard archimedean components, and for v ∈ S let φ′_v : GL2(F_v)×(V1−V0)(F_v)×F_v^× → ℂ be locally constant, invariant under right translation of g by some open compact K_v ⊂ GL2(F_v), and, for each g, of bounded support in (x,u); let µ ⊂ O_F^× have finite index with φ^S and φ′_S = ∏_(v∈S)φ′_v invariant under (x,u) ↦ (αx, α^(−2)u), α ∈ µ. The pseudo-theta series is A^((S))_(φ′)(g) = Σ_(u∈µ²\F^×) Σ_(x∈V1−V0) φ′_S(g,x,u) r_V(g)φ^S(x,u), with the Weil representation of V (not V1). It is nondegenerate if V1 = V, nontruncated if V0 = ∅, and nonsingular if each φ′_v(1,·,·) extends to a Schwartz function on V1(F_v)×F_v^×, uniquely because the complement of a proper subspace is dense (or because V₀=∅); then its outer theta series is θ_(A,1)(g) = Σ_u Σ_(x∈V1) r_(V1)(g)φ′_S(1,x,u) r_(V1)(g)φ^S(x,u) and its inner theta series θ_(A,0) is the same with V0 in place of V1 (θ_(A,0) = 0 if V0 = ∅).

Assume the CM quaternionic data (Q). In the constructor require u-support compact in F_v× and x-support contained in a fixed bounded set, uniformly for g in compact subsets. If V₀=∅ require Schwartz data. Otherwise fix a local norm and its distance to V₀, and require |φ′_v(g,x,u)|≤C(1+|log dist_v(x,V₀)|)^m on that support, with C and m uniform on each compact g-set. Require the same bounds after each translation and differentiation used in a consumer. Local intersection and derivative kernels must satisfy these estimates before they enter the sum.

*Outline.* Use the imported Weil representation on V and the stated unit invariance to form the quotient sum. The product formula bounds the logarithmic proximity of rational x to V₀ by a polynomial in its archimedean size on the bounded finite support. Positive definite Gaussian decay then gives absolute and locally uniform convergence; bounded support alone gives neither. Restrict the nonsingular data to construct the two usual theta series.

Its API consists of the following facts:

- The absolutely and locally uniformly convergent unit-quotient sum in the stated ambient Weil representation.
- The nonsingular outer theta uses the V₁ Weil representation.
- The inner theta uses V₀; it is zero for the empty truncation.
- The summand is invariant under (x,u)↦(αx,α⁻²u).

**Checks.**

- V₀=V₁=V=0 is rejected: with the standard Gaussian and finite-unit data the empty pseudo-theta sum is 0 while its outer theta at 1 is 1. For V₀=∅ and V₁=V=0 the nontruncated sum and outer theta are both 1.
- For V₀=∅ the inner theta is zero; for V₀={0} it is the zero-vector theta term.
- For V₁=V and genuine Weil translates at bad places, the nontruncated series is the usual theta series.
- Over ℚ with V₁=V=ℚ², V₀={0}, S={p} and u-support ℤ_p×, the g-independent shell value exp(p^(4n)) at min ord_p(x_i)=n≥0 is rejected: at x=pⁿe₁ its Gaussian-weighted term is exp(p^(4n)−2πp^(2n)), which grows instead of tending to zero. It violates the logarithmic bound, despite bounded support and local constancy off zero.
- Empty x-support gives the zero series; the logarithmic bound allows growth like n^m on these shells, whose terms n^m exp(−2πp^(2n)) tend to zero.
- Using rV₁ in place of rV loses the positive-codimension (ρ∞δ) power in the comparison.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §6.2, pp. 579–580.)

*Needs:* MetaplecticAutomorphicForms Layer 5.

### 6.6 Mixed theta–Eisenstein kernel

Fix B, a totally definite incoherent quaternion algebra over A = A_F with E_A → B, and φ ∈ S̄(B×A^×) invariant under U×U. Prove that I(s,g,φ)_U = Σ_(u∈µ_U²\F^×) Σ_(γ∈P^1(F)\SL2(F)) δ(γg)^s Σ_(x1∈E) r(γg)φ(x1,u). For φ = φ1⊗φ2 with respect to B = E_A ⊕ E_A j, I(s,g,φ)_U = Σ_u θ(g,u,φ1)E(s,g,u,φ2), where θ(g,u,φ1) = Σ_(x1∈E) r(g)φ1(x1,u) and E(s,g,u,φ2) = Σ_γ δ(γg)^s r(γg)φ2(0,u). By incoherence I(0,g,φ) = 0.

Assume the CM quaternionic data (Q).

*Outline.* Use the E⊕E𝔧 orthogonal decomposition and the imported theta/Eisenstein families. Continue the absolutely convergent initial series meromorphically; apply incoherence for its central zero.

Its API consists of the following facts:

- The unit-quotient sum over P¹(F)∖SL₂(F) and x₁∈E.
- For φ=φ₁⊗φ₂ the kernel is Σu θ(g,u,φ₁)E(s,g,u,φ₂).
- The kernel and its meromorphic continuation are linear in φ.
- I(0,g,φ)=0 for incoherent data.

**Checks.**

- For φ=0 the meromorphic family is zero.
- For a pure tensor the theta factor uses E and the Eisenstein factor its orthogonal line.
- The central family value is zero, while its derivative need not be zero.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540.)

*Needs:* MetaplecticAutomorphicForms Layer 5, AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

### 6.7 Normalized local Whittaker terms

For a place v, a ∈ F_v, u ∈ F_v^× and φ_(2,v) ∈ S̄(E_v𝔧_v×F_v^×), put W_(a,v)(s,g,u,φ_(2,v)) = ∫_(F_v) δ(wn(b)g)^s r(wn(b)g)φ_(2,v)(0,u) ψ_v(−ab) db. For a ∈ F_v^×, W°_(a,v) = γ_(u,v)^(−1)W_(a,v), where γ_(u,v) is the Weil index of (E_v𝔧_v, uq). For a = 0, W°_(0,v)(s,g,u,φ_(2,v)) = γ_(u,v)^(−1)·(L(s+1,η_v)/L(s,η_v))·|D_v|^(−1/2)|d_v|^(−1/2)·W_(0,v)(s,g,u,φ_(2,v)), with D_v the relative discriminant of E_v/F_v and d_v the local different of F_v. Prove that W°_(0,v)(0,g,u) = r(g)φ_(2,v)(0,u) for all v, and W°_(0,v)(s,g,u) = δ_v(g)^(−s)r(g)φ_(2,v)(0,u) for almost all v; at an archimedean v this s-dependent formula uses the standard Gaussian component. Globally W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_(0,v)(s,g,u), since ∏_vγ_(u,v) = −1 for incoherent B.

Assume the CM quaternionic data (Q). The archimedean s-dependent zero-index identity is asserted for the standard Gaussian, as in Yuan–Zhang §7.3 Lemma7.6; it is not an assertion for arbitrary archimedean Schwartz functions.

*Outline.* Take the Fourier integral with the source’s self-dual measure. Apply the local intertwiner and Weil-index normalization separately to nonzero and zero Fourier indices; use its value at s=0 and the incoherent product sign.

Its API consists of the following facts:

- Normalize the Fourier integral separately at a≠0 and a=0.
- W°₀,v(0,g,u)=r(g)φ₂,v(0,u).
- For a≠0 only the inverse Weil index changes the raw integral.
- At a=0 include L(s+1,ηv)/L(s,ηv), |Dv|⁻¹/² and |dv|⁻¹/².

**Checks.**

- At standard almost-all-place data W°₀,v(s,g,u)=δv(g)⁻s r(g)φ₂,v(0,u).
- Omitting the zero-index L-factor fails W°₀,v(0,g,u)=r(g)φ₂,v(0,u).
- The product of local Weil indices is −1, hence the global zero coefficient carries the minus sign.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1 pp584–586; §7.3 pp599–600.)

*Needs:* AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

### 6.8 Finite CM orbit average

CU=E*\Ef*/(Ef*∩U); integrate a function on CU using |CU|^−1Σ, not its unnormalized trace. The factor e=[OE*:OF*] is separate.

Assume the CM quaternionic data (Q).

*Outline.* Use the finite CM class quotient and its counting probability measure. Check quotient invariance and compare its cardinality with the unnormalized sum, keeping the independent elliptic unit index.

Its API consists of the following facts:

- Average a function over the finite quotient C_U.
- The average of a constant c is c.
- A quotient-invariant function has representative-independent average.
- Unnormalized orbit sum equals |C_U| times the average.

**Checks.**

- The average of 1 is 1 even when |C_U|>1.
- On a singleton quotient averaging is evaluation.
- The elliptic index e=[O_E×:O_F×] is not the orbit cardinality and cannot replace |C_U|.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1 p585;§8.1 pp606–609.)

*Needs:* [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit).

### 6.9 Two auxiliary split places

Choose distinct finite places v₁,v₂ of F. Require E to split at both and their extensions over ℚ to be unramified. Put S2={v₁,v₂}; for either v the subgroup U_v is maximal, and r(g)φ_v(0,u)=0 whenever g∈GL₂(F_v) and u∈F_v^×.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Define the two-place condition inside the imported Schwartz/Weil data. Verify that the special Hecke-difference functions satisfy it; this is the source’s projection growth assumption.

Its API consists of the following facts:

- Two distinct finite E-split, ℚ-unramified maximal-level places with full Weil-orbit zero evaluation.
- Each auxiliary place is E-split and its F_v/ℚ_p extension is unramified.
- r(g)φv(0,u)=0 for every g∈GL₂(F_v),u∈F_v×.
- The local vanishing subspace is closed under addition and scalar multiplication.

**Checks.**

- The zero local function satisfies full Weil-orbit vanishing.
- One split place does not satisfy the two-place assumption.
- φv(0,u)=0 alone is insufficient: its Fourier/Weil transform can be nonzero at zero.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Assumption 7.1 p587.)

*Needs:* MetaplecticAutomorphicForms Layer 5.

### 6.10 Ideal-class Rankin series

(5.3) For f = Σ a_n qⁿ in the new space and 𝒜 ∈ Cl_K: L_𝒜(f, s) = Σ_(n≥1, (n, DN)=1) ε(n) n^(1−2s) · Σ_(n≥1) a_n r_𝒜(n) n^(−s). The first factor is L(2s − 1, ε) with the Euler factors at all p | N removed (Gross–Zagier, I §5, equation (5.3), printed p. 229). For weight 2k (§9, Chapter IV (0.1)): n^(1−2s) is replaced by n^(2k−1−2s).

Assume the classical Rankin data (C). No splitting condition is imposed at the primes dividing N: because (N,D)=1, each p|N is split or inert in K, and both occur in the ε(N)=−1 central-value branch. The Heegner case of (H), in which every p|N splits, is a specialization (Gross–Zagier, Chapter IV, (0.1) and (0.3), pp. 267–268, define L_𝒜 and its character sums for every N prime to D).

*Outline.* Form the ideal-class norm coefficients and multiply their Dirichlet series by the quadratic L-factor with the p|N factors removed. Use the finite character orthogonality relations to compare with character-indexed series; own the Euler-factor comparison with the actual quadratic base-change and induction parameters of R17.4–R17.5. At an unramified split prime, expand the two degree-two factors; at an inert prime use the degree-two residue norm p²; at a discriminant prime use the ramified quadratic character and the primitive theta factor. At p|N the actual degree-at-most-one local newvector factor of f replaces the unramified factor, and newform multiplicativity gives a(mp^j)=a(m)a(p)^j for m prime to p. For a split p∥N, expand over the two primes above p against the Steinberg parameter. For an inert p∥N the only ideals of p-power norm are the principal ideals (p^i), so r_𝒜(mp^(2i))=r_𝒜(m), r_𝒜(mp^(2i+1))=0, and the local series is Σ_i a(p)^(2i)p^(−2is)=(1−p^(2k−2−2s))^(−1), using a(p)²=p^(2k−2); this is the Rankin factor of the Steinberg parameter against the parameters ±1 of the class-group character at an inert prime. For higher conductor a(p)=0 and the series has trivial p-factor; retain the local inertia invariants in the parameter comparison. The quadratic correction omits precisely the p|N Euler factors. Match the arithmetic variable to the unitary one by s↦s−k+1/2. These computations identify the character sum with the stated finite Rankin series, including its bad factors.

Its API consists of the following facts:

- L_A(f,s)=L^(N)(2s−2k+1,ε) Σ a(n)r_A(n)n^(−s).
- Σ_A χ(A)L_A(f,s)=L(f,χ,s), with the bad Euler factors of the normalization comparison.
- L_A=h⁻¹Σ_χ χ(A)⁻¹L(f,χ,s).
- The split, inert, discriminant and level Euler factors agree with the parameter construction after the shift s−k+1/2.
- L^(N)(t,ε)=L(t,ε)Π_(p|N)(1−ε(p)p^(−t)).

**Checks.**

- Σ_A L_A=L(f,1_K,s).
- At p|N the factor 1−ε(p)p^(1−2s) is present in weight two; restoring its inverse changes the series.
- The inverse finite character transform selects A and no other class.
- For N=11, D=−3 and the weight-two newform of level 11 (a(11)=1), 11 is inert in K, so ε(11)=−1 and the 11-part of the series is 1+11^(−2s)+11^(−4s)+⋯=(1−11^(−2s))^(−1); a split-prime expansion at 11 would wrongly produce odd powers 11^(−s).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267.)

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.3` for the general Rankin function, `GL2AutomorphicRepresentationsAndTransfer:R17.4` for quadratic base change, `GL2AutomorphicRepresentationsAndTransfer:R17.5` for quadratic induction, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, MetaplecticAutomorphicForms Layer 5.

### 6.11 Hecke height-series cuspidality

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; at N = 1 there are no weight-two cusp forms, S₂(SL₂(ℤ)) = 0, so the statements hold trivially); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). Prove that the series g_𝒜(z) = Σ_(m≥1) ⟨c, T_m c^σ⟩ e^(2πimz) is a cusp form of weight 2 on Γ₀(N).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Apply the imported Hecke-equivariant Jacobian/local-height pairing to the finite-dimensional Hecke module. Use the perfect Fourier-coefficient pairing of the Hecke algebra and weight-two cusp forms to produce the series with coefficient ⟨a,T_m b⟩. This imports Mordell–Weil and the Jacobian instead of defining either again.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §6, (6.1) Theorem, p. 230; proved in Chapter V, §1, p. 306 (formal argument: for any ℚ-linear α: 𝕋 → ℂ, Σ α(T_m) qᵐ ∈ S₂(Γ₀(N)), via the perfect pairing 𝕋 × S₂(Γ₀(N), ℚ) → ℚ, (T, f) ↦ a₁(Tf); here α(T) = ⟨c, T c^σ⟩); [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 306 (proof of the first assertion of Theorem (6.1) of Chap. I).)

*Needs:* `HeightsRationalPointsAndObstructions:§§0.19–0.21`, `HeightsRationalPointsAndObstructions:§1.7`, ModularCurvesPartII §§7.5–7.6 (perfect Fourier/Hecke pairing) and §§13.2–13.4 (Jacobian Hecke action and adjoints).

### 6.12 Classical trace adjunction

For N | M, f ∈ S_(2k)(Γ₀(N)) and g ∈ M̃_(2k)(Γ₀(M)): (f, g)_(Γ₀(M)) = (f, Tr^M_N g)_(Γ₀(N)). Consequently (4π)^(−s−2k+1)Γ(s+2k−1)L_𝒜(f, s+2k−1) = (f, Tr^M_N(θ_𝒜 E_s̄))_(Γ₀(N)) for Re(s) large, with M = N|D|.

Assume the classical Rankin data (C).

*Outline.* Use the trace coset decomposition and change variables in the Petersson integral. Compare the index-normalized trace with the source unnormalized trace before applying adjunction.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, p. 271.)

*Needs:* ModularCurvesPartII §§7.3–7.4 (characteristic-zero pullback and unnormalized trace); AutomorphicFormsOnReductiveGroups §§4.2 and 7.2 (cuspidal realization and the GL₂ adelization) and Mathlib's `SlashAction` for the slash actions.

### 6.13 Prime-to-level newform detection

In the classical Rankin setting, write Φ̃_s(z) = Σ_(m∈ℤ) A_m(s, y)e(mx) (1.3). The proof of (1.2) used only the orthogonality of f with forms of level strictly dividing N. f ∈ S^new_(2k)(Γ₀(N)) is also orthogonal to g(dz) for d > 1 and g of level dividing N/d, so in (1.2) only the A_m(s, y) with (m, N) = 1 are relevant. If Φ̃, Φ̃′ ∈ M̃_(2k)(Γ₀(N)) (with the growth of §5) have A_m = A′_m for all m prime to N, then (f, Φ̃) = (f, Φ̃′). In particular, the functional equation (0.2) and the formulas for L_𝒜(f, k) and L′_𝒜(f, k) reduce to identities for A_m(s, y), (m, N) = 1.

Assume the classical Rankin data (C).

*Outline.* Use the Hecke algebra/Fourier-coefficient perfect pairing on the newform subspace. Prime-to-N Hecke operators determine each newform component; do not extend the assertion to arbitrary oldforms.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, Remark after (1.2) and (1.3), p. 272.)

*Needs:* ModularCurvesPartII §§7.5–7.6 and 13.2–13.4; TauCetiRoadmap.ModularForms Layer 3 (old/new decomposition) and Layer 5 (multiplicity one).

### 6.14 Classical Eisenstein transformation

In the classical Rankin setting with the genus decomposition data (G): For γ = (a b; c d) ∈ SL₂(ℤ) with (c, D) = |D₂|, D₁D₂ = D, and c* an inverse of c (mod D₁) with c* ≡ 0 (mod D₂): (E^((1))_s|_(2k−1)γ)(z) = ε_(D₁)(c) ε_(D₂)(dδ₁) δ₁^(−s−2k+1) E^((D₁))_s((z + c*d)/δ₁), where (F|_(2k−1)γ)(z) = (cz+d)^(−(2k−1))F(γz).

Assume the classical Rankin data (C).

*Outline.* Apply the Eisenstein transformation law with each ordered factorization D=D₁D₂. Retain the κ(D₁) phase, especially κ= i for a negative discriminant.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.2), pp. 273–274.)

*Needs:* AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.15 Ramified theta reindexing

In the classical Rankin setting with the genus decomposition data (G): For every 1-periodic function f on ℌ: (f(z)θ_(𝒜𝒟₁)(z))|U_(δ₁) = (f(δ₂z)θ_(𝒜𝒟₁)(δ₂z))|U_δ = (f(δ₂z)θ_𝒜(z))|U_δ. The reason is that θ_(𝒜𝒟₁)(δ₂z) and θ_𝒜(z) have the same n-th Fourier coefficient for every n divisible by δ₂: r_(𝒜𝒟₁)(n/δ₂) = r_𝒜(n). This holds because 𝒜𝒟₁ = 𝒜𝒟₂ and every integral ideal of norm n (δ₂ | n) is 𝔡₂ times an integral ideal of norm n/δ₂.

Assume the classical Rankin data (C).

*Outline.* Transform the theta series under the ramified ideal and cusp coset. Reindex by multiplication with the different and use the genus character for the resulting class change.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.)

*Needs:* MetaplecticAutomorphicForms Layer 5, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.16 Rankin genus-sign function

In the classical Rankin setting with the genus decomposition data (G): For n ∈ ℤ ∖ {0} and d a positive divisor of n: ε(n, d) = ε_𝒜(n, d) = 0 if (d, n/d, D) ≠ 1, and ε(n, d) = ε_(D₁)(d) ε_(D₂)(−N n/d) χ_(D₁·D₂)(𝒜) if (d, n/d, D) = 1, where D = D₁D₂ is the decomposition with (d, D) = |D₂|.

Assume the classical Rankin data (C) and (G). For the complementary-divisor identity additionally require l>0, r_A(l)>0 and Nn+l≡0 mod D; it is not asserted for arbitrary n and ideal class A.

*Outline.* Choose D₂ by |D₂|=gcd(d,D) and set zero on common ramification. Evaluate the two primitive quadratic characters and the genus character with signed n/d. Prove the norm/genus bridge: if an integral ideal 𝔞 in A has norm l, then for each discriminant factor D_i prime to l its genus value is ε_(D_i)(l); at common ramified primes use a prime-to-D representative and the ramified-ideal class 𝒟_i. Combine Nn≡−l mod D with quadratic reciprocity to derive the displayed complementary-divisor sign, including the sign of n. This arithmetic bridge is proved here from the genus characters of AnalyticNumberTheoryPartI §2.10; it is not an extra norm-congruence theorem attributed to that roadmap.

Its API consists of the following facts:

- The piecewise genus-character value ε_A(n,d), zero when gcd(d,n/d,D)>1.
- The values are 0,1,−1.
- For the source norm congruence, ε_A(n,|n|/d)=−ε(N)sgn(n)ε_A(n,d).
- the norm/genus evaluation with a prime-to-D representative and ramified-ideal transport.
- Multiplicative in coprime divisors d of fixed n.

**Checks.**

- If l|D divides both d and n/d, the sign is zero.
- For ε(N)=1,n>0 satisfying Nn+l≡0 with l a norm from A, Σ_d ε_A(n,d)=0.
- For D=−15=D₁D₂ with D₁=−3,D₂=5, the prime over 3 has norm 3: ε_(−3)(3)=0 and ε_5(3)=−1. Its class instead has genus value −1, computed using the norm-2 ideal in that class, for which ε_(−3)(2)=ε_5(2)=−1. The equality on norm evaluations is restricted to prime-to-D ideals.
- For D=−3,N=1,A=1, n=3 gives ε_A(3,1)=1, ε_A(3,3)=−1, whereas n=−3 gives both values 1. Thus σ_A(3)=0 and σ_A(−3)=2; replacing n by |n| loses the sign.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, (3.2) Proposition, p. 277.)

*Needs:* AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, [0.8 Genus-character factorization](#08-genus-character-factorization).

### 6.17 Different ideal reindexing

With the standing notation (D odd, so D squarefree), for every m ≥ 0 and every class A: r_A(m|D|) = r_A(m). (The different 𝔡 = (√D) is principal and every integral ideal of norm m|D| is divisible by every ramified prime, hence equals 𝔡·𝔟 with N(𝔟) = m; for m = 0 both sides are 1/w.)

Assume the classical Rankin data (C).

*Outline.* Multiply ideals by the different and track the ideal class and norm |D| factor. This is a theta coefficient reindexing, not an equality of individual ideal representatives.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, used in (4.4) and (4.5) (the n = 0 term of Cor. (3.4), r_A(mδ − 0·N), is printed as r_A(m)), pp. 283–284; Theorems (5.6), (5.8) use both forms.)

*Needs:* MetaplecticAutomorphicForms Layer 5, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.18 Eisenstein Mellin asymptotics

Use the continued family E_(2,s)(z)=(2i/(s+1))∂_z E(z,s+1) of AutomorphicSpectralTheory §1.30, with the normalized primitive-coset weight-zero E of §§1.14–1.15 and its continuation of §§2.17–2.18. At s=−1 this expression means meromorphic continuation, not totalized division. Prove its regularity near s=0 and identify E_(2,0)(z)=E₂(z)−3/(π Im z), where E₂ is Mathlib `EisensteinSeries.E2`. Put E=E_(2,0) and F=∂_s E_(2,s)|_(s=0). Compare their Fourier coefficients, cusp leading terms and Mellin finite parts as follows (Gross–Zagier IV §6, pp.296–299).

Its normalization API has the following facts:

- E has weight two on SL₂(ℤ), with leading term 1−3/(πy) and the Fourier coefficients of the native normalized E₂.
- F has leading term log y+O(y⁻¹log y), with the derivative taken in the specified family.
- E and F have zero pairing with every holomorphic cusp form in the convergent Petersson domain.

**Checks.**

- At z=i, the weight-two S-transformation gives E(i)=−E(i), hence E(i)=0 and E₂(i)=3/π. The holomorphic E₂ alone fails this modular equation.
- The positive Fourier coefficients at indices 1 and 2 are −24 and −72 because σ₁(1)=1 and σ₁(2)=3; doubling the primitive-coset sum doubles both.
- Differentiating y^s at s=0 gives log y; at y=1 and y=e the values are 0 and 1. Rescaling the continued family changes this normalization.

Write E(z) = Σ_m e(m,y)e^(2πimz), F(z) = Σ_m f(m,y)e^(2πimz). For m > 0: e(m,y) = −24σ₁(m), and as s → 0 (Re s > 0): ∫₀^∞ e(m,y)e^(−4πmy)y^s dy = −(6/(πm))σ₁(m) + o(1); ∫₀^∞ f(m,y)e^(−4πmy)y^s dy = ∂/∂t[−2π^(3/2+t)m^(−1/2−t)Γ(s+t+1)Γ(s−t)σ_(1+2t)(m)/((4πm)^(s+1/2)Γ(2+t)Γ(s)ζ(2+2t))]_(t=0) = −24 Γ(s+1)/(4πm)^(s+1) · [2σ′₁(m) + σ₁(m)(log(π/m) + γ − 1 − 2ζ′/ζ(2) + 1/s)] = −(6/(πm))σ₁(m)s^(−1) − (12/(πm))σ′₁(m) + (12/(πm))σ₁(m)(log 2m + ½ + ζ′/ζ(2)) + o(1), γ = Euler's constant. For (m, N) = 1 the m-th coefficient of Φ̃* = Φ̃ − Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)} is a*_m(y) = a_m(y) − α(1)f(m,y) − β(1)e(m,y); these give (6.5).

Assume the classical Rankin data (C).

*Outline.* Use E₂*=E₂−3/(πy) and its Eisenstein derivative family. Evaluate the Mellin transforms, keeping the Laurent pole and constant before differentiating at zero.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 298-299.)

*Needs:* AutomorphicSpectralTheory §§1.14–1.15, 1.30 and 2.17–2.18, AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.19 Cusp constant matrix inverse

Fix C_N = (C_N(N₁, M))_(N₁, M | N), C_N(N₁, M) = (M, N₁)²/M² (a σ₀(N) × σ₀(N) matrix). The entries are multiplicative, C_(∏p^(ν_p))(∏p^(λ_p), ∏p^(μ_p)) = ∏ C_(p^(ν_p))(p^(λ_p), p^(μ_p)), so C_N is the Kronecker product of the C_(p^ν) (N = ∏ p^ν). For N = p^ν, C_(p^ν)(p^λ, p^μ) = p^(2 min(λ,μ) − 2μ) (rows λ = 0..ν: (1, p^(−2), …, p^(−2ν)), (1, 1, p^(−2), …, p^(−2ν+2)), …, (1, …, 1)), and (6.6) C_(p^ν)^(−1) = (p² − 1)^(−1) × the tridiagonal matrix with diagonal (p², p²+1, …, p²+1, p²), superdiagonal −1, subdiagonal −p². In particular C_N is invertible and (6.3)-(6.4) have a unique solution. The displayed tridiagonal inverse is for ν≥1; for ν=0 use the 1×1 matrix (1).

Assume the classical Rankin data (C).

*Outline.* Factor C_N as the tensor product of its prime-power matrices. Multiply the prime-power matrix by the displayed tridiagonal inverse; both corner rows must be checked. The ν=0 matrix is (1), handled separately.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 299-300, (6.6).)

*Needs:* Mathlib `Matrix.mul_apply`.

### 6.20 Picard-valued generating series

For U-biinvariant extended Schwartz Φ, let ϕ be its archimedean average. Define Z(g,Φ)_U=Z₀(ϕ)_U+w_U Σ_(a∈F×)Σ_(x∈U\B_f×/U) r(g)ϕ(x,a/q(x)) Z(x)_U in Pic(X_U×X_U)⊗ℂ, with the fixed Hodge/constant term and unit stabilizer w_U. The series converges coefficientwise in the stated Picard realization and defines a weight-two automorphic form. Its appropriately volume-rescaled level classes are compatible. The modularity assertion is a theorem about these actual cycle coefficients.

Assume Standard Gaussian archimedean data and allowed finite support; proper-cycle coefficients. Compact case or the cuspidal finite-level case with its separate boundary terms.

*Outline.* Form the proper-cycle coefficients and Hodge term with ϕ, not unaveraged Φ. Use the imported Weil action/product formula and the source’s curve-cycle theta calculation to prove modularity. Check coefficientwise convergence and level push-pull with volumes.

Its API consists of the following facts:

- The explicit Hodge-plus-Hecke series with Picard coefficients.
- The nonzero Fourier coefficients are the weighted proper special cycles.
- The specified volume-rescaled classes are level compatible.
- The series transforms by the weight-two Weil automorphy law.

**Checks.**

- Zero Schwartz input gives the zero series.
- The identity double coset contributes the actual diagonal cycle.
- For F=ℚ the whole factor is 1/2 (Yuan–Zhang–Zhang erratum); substituting 2 changes coefficients by four.

*Consequences.* The modular X₀(N) example recovers the Hecke generating series with this normalization.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.5.4, printed p. 15; [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items8,30,31; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607, with Theorem 8.1, p. 606, which is the book's Theorem 3.17 (modularity of the generating series); [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §4.2.1–§4.2.2, (4.2.1)–(4.2.2), Lemma 4.2.1, pp. 121–122.)

*Needs:* [6.3 Special correspondence cycle](#63-special-correspondence-cycle), MetaplecticAutomorphicForms §5.9, [3.2 Normalized Hodge class](#32-normalized-hodge-class), `ModularCurvesPartII:§§13.1–13.4`.

### 6.21 Special test function and integral j

Choose a maximal order Ô_𝔹 ⊇ Ô_E in the finite incoherent quaternion algebra, and put U = Ô_𝔹^×, U_v = O_(𝔹_v)^×. Retain compactness |Σ(𝔹)| ≥ 2 and no common finite ramification of E and 𝔹. Every O_(B_v) below denotes this same chosen local order O_(𝔹_v). Order containment is an explicit hypothesis, not an inference from Ô_E^× ⊂ U. Take φ = ⊗φ_v with: (1) v|∞: the standard Gaussian; (2) v finite, nonsplit in E, split in B: 1_(O_(B_v)×O_(F_v)^×); (3) v nonsplit in B: 1_(O_(B_v)^××O_(F_v)^×); (4) v ∈ S2, a set of two finite places split in E and unramified over ℚ: 1_(O_(B_v)^××O_(F_v)^×) − (1+N_v+N_v²)^(−1)·1_(ϖ_v^(−1)(O_(B_v))_2×O_(F_v)^×), where (O_(B_v))_2 = {x ∈ O_(B_v) : v(q(x)) = 2}; (5) v split in E, v ∉ S2: 1_(O_(B_v)×O_(F_v)^×). For each finite v, fix 𝔧_v ∈ O_(B_v) orthogonal to E_v with v(q(𝔧_v)) ∈ {0,1}, equal to 1 iff B_v is nonsplit (then E_v/F_v is inert). In the split-B case, 𝔧_v acts as Galois conjugation on O_(E_v) ≅ M = O_(F_v)², transported by t ↦ t·m0 with m0 an O_(E_v)-module generator of M, and q(𝔧_v) = −1.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the containing maximal order and primitive O_E-module generator for the integral conjugation element. Form the stated five types of local characteristic functions. At S² apply the Hecke difference with degree N_v²+N_v+1 to prove full Weil-orbit zero evaluation.

Its API consists of the following facts:

- The five-place restricted tensor product with the stated original integral 𝔧.
- φ is invariant under the left and right U actions.
- For v∈S², r(g)φv(0,u)=0 for all g,u.
- The chosen maximal order explicitly contains O_E,v.

**Checks.**

- For N_v=2, the second auxiliary term has coefficient −1/7.
- At a division place φv is supported on order units, not the whole order.
- The split-B identification uses an O_E-module generator; a nonprimitive nonzero vector need not give an integral isomorphism.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.2 pp590–592.)

*Needs:* [6.9 Two auxiliary split places](#69-two-auxiliary-split-places), MetaplecticAutomorphicForms Layer 5.

### 6.22 Norm congruence shells and ramified correction

For v finite and nonsplit in E, u ∈ O_(F_v)^× and a ∈ uq(E_v^×j_v) (the nearby line), put D_n(a) = {x2 ∈ E_v𝔧_v : uq(x2) − a ∈ p_v^n d_v^(−1)} and D_n = {x2 ∈ E_v𝔧_v : uq(x2) ∈ p_v^n d_v^(−1)}, with dx2 self-dual for (E_v𝔧_v, uq). Put α_v(y,u) = (log N_v/|D_v|^(1/2))·1_(D_v^(−1)O_(E_v)−O_(E_v))(y)·Σ_(n=0)^(v(d_v)−1) N_v^n ∫_(D_n) φ_v(y+x2,u)dx2.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Define norm-congruence sets in the original quadratic line with its self-dual measure. Use the local different for the additive-character threshold; define α by the finite shell sum on D⁻¹O_E∖O_E.

Its API consists of the following facts:

- D_n(a)={x₂:uq(x₂)−a∈pⁿd⁻¹} and D_n with a=0.
- Use the self-dual measure of the original quadratic line (E𝔧,uq).
- α uses the finite n<v(d) shell sum off O_E inside D⁻¹O_E.
- In the inert opposite norm class D_n(a) is empty above v(ad).

**Checks.**

- For v(ad)=0 and v inert in E, or ramified with v(D_v)=1, the only possible nonnegative shell is n=0. When v(D_v)≥2 the shells v(ad)<n≤v(ad)+v(D_v)−1 can be nonempty (Yuan–Zhang Lemma 7.5(2)): for E=ℚ(i) at v=2, v(D_v)=2 and n=1 occurs at v(ad)=0.
- If v(d)=0 the finite sum defining α is empty.
- Replacing v(d) by v(D) changes the shell bound and is not the same definition.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594).)

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.1`, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 6.23 Local Whittaker series for incoherent sections

Fix v, finite, u ∈ O_(F_v)^× and φ_(2,v) ∈ S̄(E_v𝔧_v×F_v^×). For a ∈ F_v^×: W°_(a,v)(s,1,u,φ_(2,v)) = |d_v|^(1/2)(1−N_v^(−s)) Σ_(n≥0) N_v^(−ns+n) ∫_(D_n(a)) φ_(2,v)(x2,u)dx2. For a = 0: W_(0,v)(s,1,u,φ_(2,v)) = γ_(u,v)|d_v|^(1/2)(1−N_v^(−s)) Σ_(n≥0) N_v^(−ns+n) ∫_(D_n) φ_(2,v)(x2,u)d_ux2. Here dx2 is the self-dual measure for (E_v𝔧_v, uq), with vol(O_(E_v)𝔧_v) = |D_v|^(1/2)|d_v u q(𝔧_v)|; YZZ13 Prop. 6.10(1) as stated is correct only for a ≠ 0. Hence, for every φ_v and extending linearly: k_(φ_v)(1,y,u) = (L(1,η_v)/vol(E_v^1))·d/ds|_(s=0)[|d_v|^(1/2)(1−N_v^(−s))Σ_n N_v^(−ns+n)∫_(D_n(a)) φ_v(y1+x2,u)dx2] with a = uq(y2); and c_(φ_v)(1,y,u) = d/ds|_(s=0)[|D_v|^(−1/2)(L(s+1,η_v)/L(s,η_v))(1−N_v^(−s))Σ_n N_v^(−ns+n)∫_(D_n) φ_v(y+x2,u)d_ux2].

Assume the CM quaternionic data (Q).

*Outline.* Expand the Whittaker integral by additive-character conductor shells. For a≠0 use finite opposite-norm support; for a=0 retain the additional local L-ratio before differentiating.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, pp. 593–594 (a ≠ 0) and pp. 599–600 (a = 0; the constant there differs from Yuan–Zhang–Zhang, Proposition 6.10(1), and the one stated here is Yuan–Zhang's).)

*Needs:* [6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms), [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction), `AutomorphicLFunctionsAndLocalFactors:AL.1`.

### 6.24 Incoherent central derivative

For the source’s incoherent quaternionic extended Weil data, form the actual mixed theta–Eisenstein kernel I(s,g,χ,Φ), initially in its convergence half-plane, then meromorphically continue it. Its sign at the centre forces I(0,g,χ,Φ)=0, and I′(0,g,χ,Φ) is its analytic derivative. Prove the following continuation estimate as part of this target. For a compact g-set C and a closed s-disc about 0 avoiding the other poles, subtract the finite Laurent principal parts of the constant coefficients. The remaining Fourier expansion and its s-derivatives of orders 0, 1 and 2 have summable majorants uniform on C times that disc. The torus variable ranges over its compact quotient with the fixed central character. Thus differentiation commutes with its torus integral and the pole-subtracted expansion. For noncompact g the permitted bound is polynomial in the Iwasawa height times a power of its logarithm; Petersson pairing with a cusp form is still integrable. The zero-frequency Whittaker term has its separate normalized formula; it is not a limit of the nonzero-frequency formula.

Assume Incoherent Hasse signs and χ central condition; fixed holomorphic section in s. The initial section is holomorphic in s and Schwartz at the finite places, with the fixed archimedean Gaussian. At the Colmez projection step also impose (Q′) and both auxiliary vanishing conditions.

*Outline.* Use the imported incoherent section and functional equation to obtain central vanishing. Prove the displayed majorant by decomposing the theta sum into its zero orbit and nonzero lattice orbits. At the finitely many bad places use the compact support and finite conductor bounds of the local Whittaker targets; at infinity use Gaussian decay with its first two parameter derivatives. Isolate the zero-orbit Laurent polynomial before taking derivatives; its terms are the separate normalized constant term. Differentiate the factorized Fourier expansion and keep the constant term separate.

*Consequences.* At a Fourier index with exactly one bad nonsplit place the derivative occurs at that place.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.5.6, printed p. 16; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §7.1 and §7.3; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.5.6, printed pp.24–25; §3.6.1, printed pp.109–110; §5.1.1, printed pp.182–183; Chapter6, printed pp.194–216.)

*Needs:* [6.6 Mixed theta–Eisenstein kernel](#66-mixed-thetaeisenstein-kernel), MetaplecticAutomorphicForms §§6.7–6.9, AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18 for meromorphic Eisenstein/resolvent families, [6.23 Local Whittaker series for incoherent sections](#623-local-whittaker-series-for-incoherent-sections), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains).

### 6.25 Pseudo-theta comparison on a small bad-place compact

Fix A = A^((S))_(φ′), a nonsingular pseudo-theta series on V₁⊆V, with V₀=∅ or V₀ a proper subspace of V₁ as in §6.5 (d = dim V, d_i = dim V_i for nonempty V_i; omit the inner term and every V₀-complement requirement when V₀=∅), with φ^S standard at the archimedean places. Let S′ ⊇ S be a finite set of nonarchimedean places outside of which φ_v is standard, compatible with V=V₁⊕V₁^⊥ and, when V₀≠∅, V=V₀⊕V₀^⊥, and the discriminant characters χ_(V1^⊥), χ_(V0^⊥) are unramified. Prove that there is an open compact K_(S′) ⊂ GL2(F_(S′)) such that for all g ∈ K_(S′)GL2(A^(S′)): A(g) = χ_(V1^⊥)(a(g)) ρ∞(g)^((d−d1)/2) δ(g)^((d−d1)/2) θ_(A,1)(g) − χ_(V0^⊥)(a(g)) ρ∞(g)^((d−d0)/2) δ(g)^((d−d0)/2) θ_(A,0)(g). Here δ(g) = ∏_(all v) δ_v(g_v) with δ_v([[a,b],[0,d]]k) = |a/d|_v^(1/2); ρ∞(g) = ∏_(v|∞) e^(iθ_v) for g_v = [[a,b],[0,d]]k_(θ_v), a > 0; and χ_W(a(g)) := ∏_(w∉S′ finite) χ_(W,w)(a_w), where a_w is the upper-left Iwasawa entry of g_w and χ_W is the quadratic character of the discriminant of W. The characters are trivial when the complement has square discriminant, e.g. for quaternionic complements. As printed (without the characters), the identity holds only where every χ_(W,w)(a_w) = 1.

Assume the CM quaternionic data (Q).

*Outline.* Factor the archimedean Gaussian/weight terms and retain the full adelic δ. At finite places outside S′, splitting V = V_i ⊕ V_i^⊥ contributes χ_(V_i^⊥)(a(g)) as well as δ^((d−d_i)/2). Choose a common stabilizer K_(S′) at the exceptional places. Compare the V1 theta series and the truncated V0 term on K_(S′)GL2(A^(S′)); omit a discriminant character only where it is actually trivial.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §6.2, equation (6.2.1), p. 581.)

*Needs:* [6.5 Pseudo-theta datum](#65-pseudo-theta-datum), MetaplecticAutomorphicForms Layer 5, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

### 6.26 Classical Rankin normalization

(5.4) For f a Hecke eigenform in the new space of weight 2 on Γ₀(N), normalized by a₁ = 1, and χ a complex character of Cl_K: L(f, χ, s) = Σ_(𝒜 ∈ Cl_K) χ(𝒜) L_𝒜(f, s).

Assume the classical Rankin data (C). The level primes may be split or inert in K; their Euler factors are those computed in [6.10 Ideal-class Rankin series](#610-ideal-class-rankin-series), and the Heegner case (every p|N split) is the specialization used in Chapter I.

*Outline.* Sum the partial series against χ. Match the theta lift and Rankin local zeta integrals, including the removed level factors; shift the arithmetic centre k to the unitary centre 1/2.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.4), p. 229; Chapter IV, (0.3), p. 268, for N prime to D without a splitting condition.)

*Needs:* [6.10 Ideal-class Rankin series](#610-ideal-class-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [0.3 The motivic centre s = 1 and the unitary centre s = 1/2](#03-the-motivic-centre-s--1-and-the-unitary-centre-s--12).

### 6.27 Rankin absolute convergence

For a weight-2k form, absolute convergence holds when Re(s)>k+1/2 for both the ideal-class series L_𝒜(f,s) and the Euler expansion of L(f,χ,s). In particular, the weight-2 case k = 1 converges absolutely for Re(s) > 3/2.

Assume the classical Rankin data (C); the estimate uses no splitting condition at the primes dividing N.

*Outline.* Import the AL.3 arithmetic-to-unitary coefficient comparison and absolute-convergence estimates, with shift s↦s−k+1/2, and the ideal-count bound r_A(n)≪_ε n^ε. For any strict margin Re(s)−k−1/2>0 choose a smaller ε to justify the product and rearrangement. Chapter I p.229 explicitly records the weight-two specialization; the weight-2k bound is a derived extension, not a quotation from p.267. The half-plane is Re(s)>k+1/2; no rearrangement at the central point is used.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §5, p. 229 ('It is not difficult to show'; no proof given); [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter IV, introduction, p. 267, after (0.1).)

*Needs:* [6.10 Ideal-class Rankin series](#610-ideal-class-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 6.28 CM Hecke disjointness criterion

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; at N = 1 there are no weight-two cusp forms, S₂(SL₂(ℤ)) = 0, so the statements hold trivially); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). Let m ≥ 1 with (m, N) = 1. The divisors c = (x) − (∞) and T_m d^σ = T_m(x^σ) − T_m(0) are relatively prime if and only if N > 1 and r_𝒜(m) = 0.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Identify a common CM point in the determinant-m Hecke orbit with an integral O_K-ideal of norm m in the corresponding Artin class. Count the automorphisms modulo ±1; for N>1 the two cusp subtractions are distinct and cause no additional CM intersection.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §9, (9.1) Proposition, p. 232 ('it is easy to show'); refined in Chapter III, (4.3) Proposition, p. 258 (the multiplicity of x in T_m x^σ is r_𝒜(m), m prime to N) and Chapter II §5, p. 249.)

*Needs:* [6.4 ξ-normalized CM divisor](#64-ξ-normalized-cm-divisor), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), ModularCurvesPartII §§9.1 and 9.9–9.10 (Hecke correspondences on X₀(N)).

### 6.29 Classical Rankin unfolding

In the classical Rankin setting, let f = Σ a(n)qⁿ ∈ S_(2k)(Γ₀(N)) (any cusp form) and M = N|D|. For Re(s) large, Γ(s+2k−1)(4π)^(−s−2k+1) L_𝒜(f, s+2k−1) = ∬_𝓕 f(z) overline{θ_𝒜(z) E_s̄(z)} y^(2k) dxdy/y² = (f, θ_𝒜 E_s̄)_(Γ₀(M)), with E_s(z)=½Σ_(c,d∈ℤ, M|c, gcd(d,M)=1) ε(d)y^s(cz+d)^(−2k+1)|cz+d|^(−2s), and 𝓕 a fundamental domain for Γ₀(M). The unfolded equality is: Γ(s+2k−1)(4π)^(−s−2k+1) Σ a(n)r_𝒜(n)n^(−s−2k+1) = ∬_(Γ_∞\ℌ) f overline{θ_𝒜} y^(s+2k) dxdy/y². Proof: write Γ_∞\ℌ = ∪_(γ ∈ Γ_∞\Γ₀(M)) γ𝓕, use the transformation laws of f and θ_𝒜 under Γ₀(M), and interchange sum and integral.

Assume the classical Rankin data (C).

*Outline.* Unfold against the level-N Eisenstein family in its absolute-convergence region. Integrate each Fourier exponential to obtain the Γ(s+2k−1)/(4π)^(s+2k−1) factor; keep the kernel and L-series parameters distinct.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 270–271.)

*Needs:* [6.10 Ideal-class Rankin series](#610-ideal-class-rankin-series), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, MetaplecticAutomorphicForms Layer 5.

### 6.30 Möbius level decomposition

In the classical Rankin setting, with M=N|D|, let E^((1))_s be the Eisenstein sum of 6.29 with N=1, hence M=|D|; equivalently its primitive condition on d may be omitted because ε(d)=0 when gcd(d,D)>1. Initially take Re(s) large. Then E_s(z) = ½ Σ_(e|N) μ(e) Σ_((c,d)∈ℤ²∖{(0,0)}, M|c, e|d) ε(d)(cz+d)^(−(2k−1)) y^s|cz+d|^(−2s) = Σ_(e|N) μ(e)ε(e) e^(−(2s+2k−1)) (N/e)^(−s) E^((1))_s(Nz/e). Only e squarefree and prime to D contribute. For e > 1 the term Tr^M_N(θ_𝒜(z)E^((1))_s(Nz/e)) has level N/e < N: any system of representatives of Γ₀(M)\Γ₀(N) is one of Γ₀(M/e)\Γ₀(N/e), because (e, D) = 1. Hence, for f ∈ S^new_(2k)(Γ₀(N)), those terms are orthogonal to f. For non-holomorphic terms this uses §5: the product of f with a non-holomorphic form equals its product with a holomorphic form of the same level.

Assume the classical Rankin data (C).

*Outline.* Separate the level divisors by inclusion–exclusion. Apply trace adjunction to the resulting oldform/newform terms, retaining the Möbius factor.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 271–272.)

*Needs:* [6.29 Classical Rankin unfolding](#629-classical-rankin-unfolding), [6.12 Classical trace adjunction](#612-classical-trace-adjunction), ModularCurvesPartII §§7.3–7.4 and 9.1 (level pullback, trace and degeneracy maps); TauCetiRoadmap.ModularForms Layer 3 (old/new orthogonality); §6.1 (same-level holomorphic projection).

### 6.31 Classical Rankin kernel

In the classical Rankin setting, φ̃_s(z) = Φ̃_(s,𝒜)(z) = Tr^(ND)_N(θ_𝒜(z) E^((1))_s(Nz)) ∈ M̃_(2k)(Γ₀(N)), where Tr^(ND)_N means Tr^(N|D|)_N. Its Fourier expansion in x is Φ̃_s(z) = Σ_(m∈ℤ) A_m(s, y) e(mx) (1.3).

Assume the classical Rankin data (C).

*Outline.* Multiply the class theta series by the character-compatible Eisenstein family and trace from N|D| to N. Check weight and cusp growth; the Fourier convolution has Nn+l=m|D|.

Its API consists of the following facts:

- Tr_N^(N|D|)(θ_A(z)E_s^(1)(Nz)).
- The result has level N, weight 2k and polynomial cusp growth in its initial convergence region.
- Its Fourier coefficient is the convolution with Nn+l=m|D|.
- The construction is linear in the ideal-class theta series.

**Checks.**

- For the normalized weight-two newform of 37a1, D=−7 and s=2, the characterization of the explicit Fourier-kernel setting gives (f,Φ̃₂)=(4π)^(−3)·37²·Γ(3)·L_A(f,3)=1369 L_A(f,3)/(32π³)≠0. Here the class number is one and the Rankin value factors into nonzero Euler products in the absolute convergence region; multiplying the kernel by 2 changes this pairing by 2.
- For N=37, D=−7 and m=16, the Fourier convolution at index m|D|=112 has the n=3 term with theta index 1, since 37·3+1=112. In the principal class r_A(1)=1, whereas using n+l=112 gives r_A(109)=2: 109 splits in ℚ(√−7). Thus this term has coefficient e_s(3,Ny/δ)·r_A(1)=e_s(3,Ny/δ) in the notation of the explicit Fourier-kernel setting, rather than 2e_s(3,Ny/δ). That coefficient is the combined Eisenstein coefficient of the trace, not the index-3 coefficient of E^(1)_s alone.
- With those inputs, replacing θ by 2θ doubles the kernel and replacing θ by θ+θ′ adds the kernels, with the trace scalar fixed by the nonzero pairing. A nonlinear construction fails these equalities.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, (1.2) Proposition and (1.3), p. 272.)

*Needs:* AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, MetaplecticAutomorphicForms Layer 5, MetaplecticAutomorphicForms Layer 7, [6.12 Classical trace adjunction](#612-classical-trace-adjunction), AutomorphicFormsOnReductiveGroups §7.2, AutomorphicFormsOnReductiveGroups §7.2, [6.29 Classical Rankin unfolding](#629-classical-rankin-unfolding), [6.30 Möbius level decomposition](#630-möbius-level-decomposition).

### 6.32 Trace coset classification

In the classical Rankin setting with the genus decomposition data (G): [Γ₀(N) : Γ₀(N|D|)] = Σ_(δ₁|δ) δ₁. The cosets Γ₀(N|D|)γ, γ = (a b; c d) ∈ Γ₀(N), are classified by δ₂ = (c, D) together with the residue class of c*d modulo δ₁ = δ/δ₂. So Tr^(ND)_N F = Σ_(D=D₁D₂) Σ_(j mod δ₁) F|_(2k)γ_(D₁,j), where γ_(D₁,j) is any representative with (c, D) = δ₂ and c*d ≡ j (mod δ₁).

Assume the classical Rankin data (C).

*Outline.* Classify the trace cosets by the denominator gcd and the source ramified divisor. Use this finite decomposition to reorganize the level N|D| trace.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.)

*Needs:* [6.12 Classical trace adjunction](#612-classical-trace-adjunction), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 6.33 Genus Eisenstein combination

In the classical Rankin setting with the genus decomposition data (G): ℰ_s(z) = Σ_(D=D₁·D₂) ε_(D₁)(N) χ_(D₁·D₂)(𝒜) / (κ(D₁)|D₁|^(s+2k−3/2)) · E^((D₁))_s(|D₂|z), the sum over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed; (D₁, D₂) and (D₂, D₁) are different terms, so there are 2^t terms, t the number of prime factors of D). ℰ_s depends on N (in fact only on N mod D) and on 𝒜 (in fact only on the genus of 𝒜); the paper suppresses this in the notation.

Assume the classical Rankin data (C).

*Outline.* Sum over all ordered discriminant factorizations with their κ and genus factors. The transformation formulas prove genus and residue-class dependence; ordered pairs must not be identified.

Its API consists of the following facts:

- The 2^t ordered D=D₁D₂ terms, with ε_D₁(N)χ_D₁D₂(A)/(κ(D₁)|D₁|^(s+2k−3/2)) factors.
- Depends on A only through its genus.
- Depends on N only modulo D.
- For k=1,D=−p,ε(N)=1 it is E_s^(1)(pz)−i p^(−s−1/2)E_s^(D)(z).

**Checks.**

- A prime discriminant gives two ordered terms.
- Identifying (D₁,D₂) and (D₂,D₁) loses half the terms.
- Negative D₁ has κ(D₁)=i; replacing it by 1 changes the Fourier coefficients.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277.)

*Needs:* [0.8 Genus-character factorization](#08-genus-character-factorization), [6.14 Classical Eisenstein transformation](#614-classical-eisenstein-transformation), [6.15 Ramified theta reindexing](#615-ramified-theta-reindexing), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.34 Genus-sign reversal

In the explicit Fourier-kernel setting, let n ≠ 0 satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and let d be a positive divisor of n. Prove that ε_A(n, |n|/d) = −ε(N)·sgn(n)·ε_A(n, d). (Both sides vanish unless (d, n/d, D) = 1. If (d, n/d, D) = 1 write D = D₀D′D″ with D₀, D′, D″ discriminants, |D′| = (d, D), |D″| = (n/d, D), D₀ prime to n; then the product ε_A(n,d)ε_A(n,|n|/d) equals ε_(D₀)(|n|) ε_(D′D″)(−N sgn n) χ_(D₀·D′D″)(A), and (4.2) gives χ_(D₀·D′D″)(A) = ε_(D₀)(l) = ε_(D₀)(−Nn), whence the product is ε_D(−N sgn n) = −ε(N)sgn(n).) In particular, if ε(N) = +1 and n > 0 satisfies (4.2), then Σ_(d|n, d>0) ε_A(n,d) = 0.

Assume the classical Rankin data (C).

*Outline.* Replace d by |n|/d and evaluate the two primitive character signs. The claimed reversal uses the norm congruence and ε(N); it is not a universal unsigned-divisor identity.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.3) and its proof, pp. 282–283.)

*Needs:* [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.35 Signed divisor sums

In the explicit Fourier-kernel setting, for an integer n ≠ 0: σ_A(n) := Σ_(d|n, d>0) ε_A(n,d). For n > 0: σ′_A(n) := Σ_(d|n, d>0) ε_A(n,d) log(n/d²). p_(k−1)(t) := Σ_(j=0)^(k−1) C(k−1, j)(−t)^j/j! (= p_(k,k−1)(t) of Prop. (3.3d)). Note that ε_A(n,d), hence σ_A(n), depends on the sign of n: ε_A(−n,d) = ε_(D₂)(−1)ε_A(n,d), D₂ as in the definition of ε_A. The polynomial p_(k−1) is this terminating Laguerre-type polynomial; its kernel identities are proved in [6.2 The classical V-kernel, terminating polynomials and decay](#62-the-classical-v-kernel-terminating-polynomials-and-decay).

Assume the classical Rankin data (C).

*Outline.* Define the signed divisor sum and its log(n/d²) companion on their different domains. Expand log(n/d²)=log n−2log d; retain signed n in σ, including the archimedean negative tail.

Its API consists of the following facts:

- The pair (σ_A(n),σ′_A(n)), with σ defined for n≠0 and σ′ for n>0.
- σ′=log n·σ−2Σ_d ε_A(n,d)log d.
- Under the norm congruence, σ′ is a sum over primes with ε(p)≠1.
- σ_A(−n) retains the discriminant-dependent sign, as required in the resolvent tail.

**Checks.**

- σ′_A(1)=0 because log1=0.
- A split prime contributes zero to the logarithmic prime decomposition under its hypotheses.
- For D=−3,N=1,A=1,n=3, σ_A(3)=0 and σ_A(−3)=2; substituting σ_A(3) deletes the analytic tail.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, Proposition (4.4) (σ_A, p_(k−1)), p. 283; Proposition (4.5) (σ′_A), p. 284.)

*Needs:* [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, [6.2 The classical V-kernel, terminating polynomials and decay](#62-the-classical-v-kernel-terminating-polynomials-and-decay).

### 6.36 Genus-sign multiplicativity

In the explicit Fourier-kernel setting, for fixed n ≠ 0 and coprime positive divisors d′, d″ of n with d′d″ | n: ε_A(n, d′d″) = ε_A(n, d′) ε_A(n, d″). Consequently Σ_(d|n) ε_A(n,d) d^(−s) has an Euler product, and, writing n = p₁^(ν₁)⋯p_s^(ν_s)n₀ with p_i | D and (n₀, D) = 1, σ_A(n) = ∏_(i=1)^(s)(1 + ε_A(n, p_i^(ν_i)))·Σ_(d₀|n₀) ε(d₀) (only d = p₁^(μ₁)⋯p_s^(μ_s)d₀ with μ_i ∈ {0, ν_i} contribute).

Assume the classical Rankin data (C).

*Outline.* Factor the primitive characters on coprime divisors of fixed n. Check the common-ramification zero branch before using multiplicativity. Multiplicativity itself holds for every fixed nonzero n: for coprime d-prime,d-double-prime the discriminant factors D2-prime and D2-double-prime are coprime, their genus characters multiply, and the two cross character evaluations cancel as squares. The norm congruence (4.2) is required for the subsequent genus identification, not for this multiplicativity.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, proof of (4.6a), p. 286 (also used in (4.6b), p. 287, and the remark on p. 288).)

*Needs:* [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function).

### 6.37 Boundary Eisenstein cusp constants

Fix M | N and ξ = a/c with (a,c) = 1, (c, N) = N₁; α = (a b; c d) ∈ SL₂(ℤ). Put a′ = (M/(M,N₁))a, c′ = c/(M,N₁) ((a′,c′) = 1), complete to α′ = (a′ b′; c′ d′) ∈ SL₂(ℤ), and relate z, z′ by c′z′ + d′ = ((M,N₁)/M)(cz+d); then (a′z′+b′)/(c′z′+d′) = M(az+b)/(cz+d), y′ = ((M,N₁)²/M)y, and E_(2,s)(Mz)|₂α = ((M,N₁)^(2+2s)/M^(2+s)) y^s + O(y^(−1−s)); hence E(Mz)|₂α = (M,N₁)²/M² + O(1/y), F(Mz)|₂α = ((M,N₁)²/M²)(log y + log((M,N₁)²/M)) + O(y^(−1) log y). Therefore Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)} has expansion A(N₁) log y + B(N₁) + O(y^(−1) log y) at ξ iff (6.3), (6.4) hold.

Assume the classical Rankin data (C).

*Outline.* Transform E₂* and the derivative to each finite-level cusp. The leading log y and constant terms depend only on gcd(N,denominator); keep the y^(-1)log y remainder.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 297-298.)

*Needs:* AutomorphicSpectralTheory §§1.14–1.15, 1.30 and 2.17–2.18, [6.18 Eisenstein Mellin asymptotics](#618-eisenstein-mellin-asymptotics), ModularCurvesPartII §§4.1–4.8 and 9.1–9.4 (cusp charts, degeneracy and Atkin–Lehner maps).

### 6.38 Arithmetic height kernel

Evaluate the level-compatible Picard correspondence Z̃(g,Φ) on [h₁]⁰ and pair its resulting Jacobian class with [h₂]⁰ by the Layer 1 Poincaré height. Define Z̃(g,(h₁,h₂),Φ) this way. Its χ-geometric kernel is the starred torus integral of Z̃(g,(t,1),Φ)χ(t): first probability-average over the central ideles, then integrate on [T]=T(F)\T(A)/Z(A) with the Layer 0 quotient measure. This central averaging is defined on a compact quotient for functions invariant under Z(F∞). Dividing the starred integral by vol([T]) gives the regularized average; for T(F∞)-invariant finite-level CM data that average is the finite-orbit average. Keep the factor vol([T])=2L(1,η) when converting back to the starred kernel. Preserve the proper cycle action and χ/χ⁻¹ inputs.

Assume Both CM classes have componentwise degree zero. The toric integrand is Z(F∞)-invariant; [T] has finite volume and its centrally averaged integrand is integrable. Finite-orbit specialization additionally assumes T(F∞)-invariance and an open compact stabilizer.

*Outline.* Apply the proper correspondence to the actual Pic⁰ class and use the full Poincaré height with finite-extension normalization. Probability-average the integrand on the compact central idele quotient of Disegni §1.9; integrate the result on [T] to define the starred kernel. For finite-level, T(F∞)-invariant CM data, identify the normalized regularized average with the finite-orbit average. Multiply by vol([T]) for the starred integral; separate this operation from later removal of Eisenstein/Hodge projection terms.

Its API consists of the following facts:

- The χ correspondence-height integral, with compact central probability averaging followed by the quotient-measure torus integration.
- The kernel is bilinear in the two normalized Pic⁰ inputs and linear in Φ.
- Compatible finer-level representatives give the same kernel.
- On disjoint divisors it is the normalized finite-plus-infinite intersection height.
- The starred kernel is vol([T]) times its normalized regularized average; on a constant toric integrand c it is 2L(1,η)c, while its average is c.

**Checks.**

- A zero normalized CM class gives zero kernel.
- Averaging both trace inputs divides the height kernel by h².
- Replacing a degree-two push-forward by its reduced image halves that cycle’s height contribution.
- For a constant integrand c=1 and vol([T])=3, the starred kernel is 3 and the normalized regularized average is 1. A constructor silently returning the average fails this test.

*Consequences.* A finite class-group average differs from the trace height by the square of its cardinality.

([Yuan–Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Annals 187 (2018), §8.1, pp. 605–607 (the complex correspondence-height kernel); [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), §1.9, p. 17 (the starred integral, regularized average and measures), and §5.3, p. 48 (the same correspondence-height construction for a p-adic pairing). Here the torus measure is dt of p. 17, with volume 2L(1,η); Disegni's p-adic kernel on p. 48 instead uses d◦t=|D_F|^(1/2)|D_(E/F)|^(1/2)dt, and is rescaled by that factor before comparison.)

*Needs:* [6.20 Picard-valued generating series](#620-picard-valued-generating-series), [6.4 ξ-normalized CM divisor](#64-ξ-normalized-cm-divisor), [1.4 Character-component height pairing](#14-character-component-height-pairing), [2.12 Faltings–Hriljac comparison](#212-faltingshriljac-comparison), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison).

### 6.39 Arithmetic theta lifting comparison

For Φ in the extended Schwartz space and φ in the specified weight-two constituent σ, the correspondence-valued arithmetic theta lift, defined by Petersson projection of Z̃(g,Φ), equals L(1,π,ad)/(2ζ_F(2)) times the homomorphism associated with the coherent theta lift θ(Φ⊗φ). This is an equality of actual Jacobian homomorphisms, using Pic(X_U×X_U)→Hom(J_U,J_U∨) before rational scalar extension.

Assume Rational realizations and dualities fixed; finite level for the trace computation. Compact case and modular cusp boundary terms are treated separately.

*Outline.* Use multiplicity one to compare the two lifts up to scalar. Compute traces on H⁰,¹ by Lefschetz intersection of the proper-cycle correspondence with the diagonal. Evaluate the Hodge/cusp/CM contributions to obtain the stated adjoint/zeta constant.

*Consequences.* The scalar is L(1,ad)/(2ζ_F(2)), not an unspecified proportionality.

([The Gross-Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Sec. 1.5.6-1.5.7, printed pp. 16-17; [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items18,19,30; [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Theorem 3.6.2, pp. 110–111; §4.4.1, Propositions 4.4.1–4.4.3, pp. 134–137. The book's form is Theorem 3.22, restated as the arithmetic theta lifting theorem by [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), Theorem 5.4.1, p. 49.)

*Needs:* [6.20 Picard-valued generating series](#620-picard-valued-generating-series), [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), [3.6 Volume-normalized composition pairing](#36-volume-normalized-composition-pairing), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains).

### 6.40 Automorphic sum reduces to nondegenerate outer theta

For a finite sum of nonsingular pseudo-theta data V_(ℓ,1)⊆V_ℓ over F, with each V_(ℓ,0) empty or a proper subspace of V_(ℓ,1) as in §6.5, with positive definite even-dimensional ambient spaces, assume the sum is automorphic on GL₂(A_F). Prove that the sum equals the sum of its associated outer theta series for those indices with V_(ℓ,1)=V_ℓ. The cancellation argument separates codimensions by a Vandermonde matrix with n+1 distinct values (1+iN)^(−[F:ℚ]), for distinct positive sufficiently divisible integers N. Finiteness of the family and the finite-adelic compact-open invariance are needed for choosing these N.

Assume the CM quaternionic data (Q).

*Outline.* Separate codimension powers using weak approximation and a Vandermonde system; choose distinct positive integral lower-unipotent parameters, not arbitrary distinct integers. Apply Tau Ceti's mixed-place weak approximation independently to the four matrix entries at the finite exceptional set S. The nonzero determinant locus is open, so the approximating rational matrix can be chosen invertible. Outside S an arbitrary element of GL₂(A^S) adjusts the remaining components. Thus GL₂(F)GL₂(A^S) is dense in GL₂(A); continuity and the common left GL₂(F)-automorphic law extend equality from 1^SGL₂(A^S). This uses weak approximation, with no restriction on determinants from strong approximation.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma6.1(1) pp582–583.)

*Needs:* [6.25 Pseudo-theta comparison on a small bad-place compact](#625-pseudo-theta-comparison-on-a-small-bad-place-compact), Mathlib `Matrix.det_vandermonde`, Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

### 6.41 Rankin kernel pairing

In the classical Rankin setting, let D be a fundamental discriminant, N ≥ 1 prime to D, and define Φ̃_s = Φ̃_(s,𝒜) ∈ M̃_(2k)(Γ₀(N)) by Φ̃_s(z) = Tr^(ND)_N(θ_𝒜(z) E^((1))_s(Nz)), where θ_𝒜 is the theta series (1.1) and E^((1))_s(z) = ½ Σ_((c,d)∈ℤ²∖{(0,0)}, D|c) ε(d)(cz+d)^(−(2k−1)) y^s|cz+d|^(−2s). Prove that for every f ∈ S^new_(2k)(Γ₀(N)): (4π)^(−s−2k+1) N^s Γ(s+2k−1) L_𝒜(f, s+2k−1) = (f, Φ̃_s̄), first for Re(s) large, with the Petersson product (f, g) = ∬_(Γ₀(N)\ℌ) f ḡ y^(2k) dxdy/y².

Assume the classical Rankin data (C).

*Outline.* Combine the unfolded integral, trace adjunction and Möbius level decomposition. For the newform subspace obtain the exact Rankin-kernel pairing with the stated gamma and level factors.

**Checks.**

- At s real, s̄=s, so the central real pairing is unchanged. At s=i the kernel input is Φ̃_(−i), rather than Φ̃_i.
- Multiplying a kernel vector by i multiplies its Petersson pairing with f by −i. Thus a coefficient a(s)=s in the second slot contributes s̄; using a(s̄) instead contributes s, as required by the meromorphic Rankin expression.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, (1.2) Proposition, p. 272.)

*Needs:* [6.29 Classical Rankin unfolding](#629-classical-rankin-unfolding), [6.30 Möbius level decomposition](#630-möbius-level-decomposition), [6.31 Classical Rankin kernel](#631-classical-rankin-kernel).

### 6.42 Rankin kernel U formula

In the classical Rankin setting with the genus decomposition data (G): Assume (D, 2N) = 1. Prove that Φ̃_s(z) = Tr^(ND)_N(E^((1))_s(Nz)θ_𝒜(z)) from Proposition (1.2) equals (ℰ_s(Nz)θ_𝒜(z))|U_(|D|), where ℰ_s(z) = Σ_(D=D₁·D₂) ε_(D₁)(N)χ_(D₁·D₂)(𝒜)/(κ(D₁)|D₁|^(s+2k−3/2)) E^((D₁))_s(|D₂|z), summed over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed). χ_(D₁·D₂) is the corresponding genus character, κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0, and E^((D₁))_s is the Eisenstein series (2.1).

Assume the classical Rankin data (C).

*Outline.* Apply the trace coset classification to the theta–Eisenstein product. Use the ramified theta reindexing to obtain the U_|D| formula.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition, p. 276.)

*Needs:* [6.31 Classical Rankin kernel](#631-classical-rankin-kernel), [6.32 Trace coset classification](#632-trace-coset-classification), [6.15 Ramified theta reindexing](#615-ramified-theta-reindexing), [6.33 Genus Eisenstein combination](#633-genus-eisenstein-combination).

### 6.43 Prime-discriminant Eisenstein formula

In the classical Rankin setting, if k = 1, |D| = p is prime (so D = −p, p ≡ 3 mod 4) and ε(N) = 1, then ℰ_s(z) = E^((1))_s(pz) − i p^(−s−1/2) E^((D))_s(z) (the source prints the superscript (p)).

Assume the classical Rankin data (C).

*Outline.* For a prime discriminant enumerate the two ordered factorization terms. Insert ε(N)=1 and κ(D)=i to obtain the explicit difference.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, note after (2.4), p. 277.)

*Needs:* [6.33 Genus Eisenstein combination](#633-genus-eisenstein-combination).

### 6.44 Eisenstein zero coefficient

In the classical Rankin setting with the genus decomposition data (G): The 0-th Fourier coefficient of the Eisenstein combination ℰ_s(z) of [6.33 Genus Eisenstein combination](#633-genus-eisenstein-combination) is e_s(0, y) = L(2s+2k−1, ε)(δy)^s + (ε(N)/(i√δ)) V_s(0) L(2s+2k−2, ε) (δy)^(−s−2k+2).

Assume the classical Rankin data (C).

*Outline.* Compute the zero Fourier integral separately from nonzero indices. Retain both quadratic L-factors and the gamma factors; it is not the n→0 limit of the nonzero formula.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (first formula), p. 277; proof pp. 278–279.)

*Needs:* [6.33 Genus Eisenstein combination](#633-genus-eisenstein-combination), [6.14 Classical Eisenstein transformation](#614-classical-eisenstein-transformation), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.45 Eisenstein nonzero coefficient

In the classical Rankin setting with the genus decomposition data (G): For n ≠ 0, the n-th Fourier coefficient of ℰ_s(z) is e_s(n, y) = (ε(N)/(i√δ)) (δy)^(−s−2k+2) V_s(ny) Σ_(d|n, d>0) ε_𝒜(n, d) d^(−(2s+2k−2)), with ε_𝒜(n, d) as in [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function).

Assume the classical Rankin data (C).

*Outline.* Poisson-sum the nonzero Eisenstein coefficient and evaluate its integral V_s. The divisor sum has the signed genus factors; keep both signs of the Fourier index.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (second formula), p. 277; proof p. 279.)

*Needs:* [6.33 Genus Eisenstein combination](#633-genus-eisenstein-combination), [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.46 Genus sigma identity

In the explicit Fourier-kernel setting, genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_(A𝔫)(n) counts those integral ideals belonging to {A𝔫} whose norm equals n (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Let n be an integer satisfying (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and ε(N)n < 0. Prove that σ_A(n) = δ(n)·R_(A𝔫)(|n|). (For n prime to D: σ_A(n) = Σ_(d|n) ε(d) = R(n), the total number of ideals of norm n, and by (4.2) all of them lie in {A𝔫}.)

Assume the classical Rankin data (C).

*Outline.* Use the complement sign under the explicit norm congruence Nn+l≡0 mod D, l a norm from A. Apply genus orthogonality to obtain δ(n)R_(A𝔫)(|n|); without the norm congruence the printed shortcut is false.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition a), p. 285; proof pp. 285–287.)

*Needs:* [6.34 Genus-sign reversal](#634-genus-sign-reversal), [6.35 Signed divisor sums](#635-signed-divisor-sums), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.47 Boundary Eisenstein orthogonality

Fix N ≥ 1 and M | N, and let E(z) = E_(2,s)(z)|_(s=0), F(z) = ∂_sE_(2,s)(z)|_(s=0) as in the proof of Gross–Zagier, Chapter IV, (6.2). Prove that z ↦ E(Mz) and z ↦ F(Mz) lie in M̃₂(Γ₀(N)) and (f, E(M·)) = (f, F(M·)) = 0 for every f ∈ S₂(Γ₀(N)). Consequently Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)} has the same Petersson products with cusp forms as 0, and Φ̃ and Φ̃* = Φ̃ − Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)} have the same holomorphic projection.

Assume the classical Rankin data (C).

*Outline.* Pair the boundary Eisenstein families with cusp forms in their convergence region. Continue the pairing and differentiate; cusp decay kills the boundary terms, giving zero for both E and F.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), p. 298 ('the function Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms').)

*Needs:* [6.37 Boundary Eisenstein cusp constants](#637-boundary-eisenstein-cusp-constants), ModularCurvesPartII §§7.3–7.4; AutomorphicFormsOnReductiveGroups §§4.2 and 7.2.

### 6.48 Projection boundary coefficients

In the setting of (6.2): α(1) = ρ^(−1) Σ_(N₁|N) (μ(N₁)/N₁²) A(N₁), β(1) = ρ^(−1) Σ_(N₁|N) (μ(N₁)/N₁²)(B(N₁) − 2A(N₁) log N₁) − 2α(1) Σ_(p|N) log p/(p² − 1), where μ is the Möbius function and ρ = ∏_(p|N)(1 − p^(−2)) = Σ_(N₁|N) μ(N₁)/N₁². (Proof: C_N^(−1)(1, N₁) = ρ^(−1)μ(N₁)/N₁², and Σ_(N₁|N) (μ(N₁)/N₁²) s_p(N₁) = −2 Σ_(N₁|N) (μ(N₁)/N₁²) A(N₁)(v_p(N₁) + 1/(p²−1)) with s_p(N₁) = Σ_(M|N) C_N(N₁,M)α(M)(v_p(M) − 2 min{v_p(N₁), v_p(M)}).)

Assume the classical Rankin data (C).

*Outline.* Use C_N^(-1) first for α and then for β after removing the α logarithmic term. Extract the M=1 entries and verify the prime-power tensor factorization.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.7) Proposition, pp. 300-301.)

*Needs:* [6.19 Cusp constant matrix inverse](#619-cusp-constant-matrix-inverse), [6.37 Boundary Eisenstein cusp constants](#637-boundary-eisenstein-cusp-constants).

### 6.49 Positive-codimension theta cancellation

For the finite automorphic sum of §6.40, with each truncation empty or proper as in §6.5, suppose that for each k > 0 the orthogonal complements V_ℓ ⊖ V_(ℓ,1) (ℓ ∈ L_(k,1)) and V_ℓ ⊖ V_(ℓ,0) (ℓ ∈ L_(k,0)) all have the same quadratic discriminant character. Prove that Σ_(ℓ∈L_(k,1)) θ_(A_ℓ,1) − Σ_(ℓ∈L_(k,0)) θ_(A_ℓ,0) = 0, where L_(k,1) = {ℓ : dim V_ℓ − dim V_(ℓ,1) = k} and L_(k,0) = {ℓ : V_(ℓ,0)≠∅ and dim V_ℓ − dim V_(ℓ,0) = k}. Without the hypothesis the proof gives only the character-twisted identity on GL2(A_f^S).

Assume the CM quaternionic data (Q). Assume also that within each positive codimension all complements have the same discriminant character.

*Outline.* Apply pseudo-comparison including its discriminant characters. Choose distinct positive sufficiently divisible N so |(1+iN)^(−[F:Q])| are distinct; the Vandermonde argument isolates the character-twisted coefficient in each codimension. The common quadratic character hypothesis in that codimension permits cancellation of that nonzero factor to give the stated untwisted theta identity. Without it keep only the twisted identity. The §9 application has common character η in codimension two and trivial character in codimension four.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma6.1(2) pp582–583.)

*Needs:* [6.40 Automorphic sum reduces to nondegenerate outer theta](#640-automorphic-sum-reduces-to-nondegenerate-outer-theta).

### 6.50 Local derivative and zero-term corrections

At nonsplit v define kφv from L(1,ηv)/vol(Ev¹) times φ1,v and the derivative of W° at a=u q(y2), with y∈B(v)−E. Define cφv from the normalized zero Whittaker derivative plus logδ(g)φ; extend general φ by fiberwise integration/linearity.

Assume the CM quaternionic data (Q).

*Outline.* Differentiate the separately normalized local Whittaker integrals and extend from pure tensors by linearity. Use the shell expressions for coherent integral formulas and the local P-action for covariance.

Its API consists of the following facts:

- The nearby nonzero-index derivative k and the zero-index correction c.
- k=L(1,ηv)/vol(Ev¹) times φ₁,v and W°′ at uq(y₂).
- Both corrections extend linearly from pure tensors.
- c contains W°′₀,v plus logδv times r(g)φv.

**Checks.**

- Both corrections vanish for the zero Schwartz function.
- For the standard archimedean Gaussian, c=0.
- Substituting the a≠0 normalization at a=0 omits its L-ratio and gives the wrong correction.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600.)

*Needs:* [6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms), [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction).

### 6.51 Automorphy and cuspidality of the height series

For φ ∈ S(𝔹×A^×) invariant under U×U (|Σ| > 1), 6.20 gives that the series Z(g,φ)_U is an automorphic form in g ∈ GL2(A) with coefficients in Pic(X_U×X_U)_C (Theorem 8.1 = [YZZ13, Th. 3.17]); it is used as it stands. For t1,t2 ∈ E^×(A_f), prove that the height series Z(g,(t1,t2),φ)_U = ⟨Z(g,φ)_U t1°, t2°⟩_NT is an automorphic form, and it is a cusp form by [YZZ13, Lemma 3.19].

Assume the CM quaternionic data (Q).

*Outline.* Apply the degree-zero height functional to the automorphic form of 6.20; prove cuspidality using the vanishing constant terms.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, Theorem 8.1, p. 606 (= [YZZ13, Theorem 3.17]); cuspidality of the height series: §8.1, p. 607 (= [YZZ13, Lemma 3.19]).)

*Needs:* [6.20 Picard-valued generating series](#620-picard-valued-generating-series), [6.38 Arithmetic height kernel](#638-arithmetic-height-kernel).

### 6.52 Hodge-class terms vanish and the height series splits into horizontal and vertical parts

Fix the Colmez quaternionic setting with |Σ|>1 and the five local components of φ, including the two auxiliary split places. For each coefficient choose a permitted finite extension H/F defining its finite CM support, unramified over the division places. Normalize intersections on its Q-factorial model by [H:F]; further permitted base change scales the weighted intersection by its degree, so normalized values agree over a common compositum. Use weakly ξ̂-admissible extensions with the chosen resolvent Green functions. First express Z as the four terms ⟨Z_*t₁,t₂⟩−⟨Z_*t₁,ξ_(t₂)⟩−⟨Z_*ξ_(t₁),t₂⟩+⟨Z_*ξ_(t₁),ξ_(t₂)⟩. For the first term, −i−j includes j_v=∫g(t₂,·)c₁((Z_*t₁)̂) at each real place. Its contribution is −½[F:ℚ]E*(0,g,r(t₁,t₂)φ), where E* denotes the nonconstant Eisenstein part. Both auxiliary degeneracy conditions annihilate E* and the three Hodge cross terms. Only then is Z=−i−∑_(v finite)j_v log N_v, with the source normalized C_U averages. A single field suffices for C_U, but not for all varying-conductor CM points. Keep local ramification, residue-degree weights and real multiplicities in the base-change comparison.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Choose a permitted finite field coefficientwise, compare choices over a common permitted compositum, and divide weighted arithmetic intersections by [H:F]. Use weakly admissible extensions with their chosen resolvent Green functions. First write the four Hodge-class terms, including archimedean j_v. Then impose both auxiliary split-place conditions, which kill the Hodge cross terms and the extra nonconstant Eisenstein term. Only after these vanish identify j with its finite vertical sum.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, pp. 607–608 ([YZZ13, Prop. 7.5]); [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.4, Theorem 4.3 and Remark 4.4, pp. 67–69.)

*Needs:* HilbertModularVarietiesAndShimuraCurves Layer R18.5, [6.9 Two auxiliary split places](#69-two-auxiliary-split-places), [6.38 Arithmetic height kernel](#638-arithmetic-height-kernel), [2.9 Admissible arithmetic extension](#29-admissible-arithmetic-extension).

### 6.53 Rankin kernel Fourier expansion

In the classical Rankin setting with the genus decomposition data (G): Write ℰ_s(z) = Σ_(n∈ℤ) e_s(n, y) e(nx) (z = x+iy ∈ ℌ). Prove that Φ̃_(s,𝒜)(z) = Σ_(n∈ℤ, l≥0, Nn+l≡0 (mod D)) e_s(n, Ny/δ) r_𝒜(l) e^(−2πly/δ) e((Nn+l)x/δ), with δ = |D|.

Assume the classical Rankin data (C).

*Outline.* Expand the transformed Eisenstein combination and the ideal-class theta series. Convolve the coefficients subject to Nn+l=m|D|, including the l=0 term r_A(0)=1/w.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.1), p. 277.)

*Needs:* [6.42 Rankin kernel U formula](#642-rankin-kernel-u-formula), [6.16 Rankin genus-sign function](#616-rankin-genus-sign-function), [6.44 Eisenstein zero coefficient](#644-eisenstein-zero-coefficient), [6.45 Eisenstein nonzero coefficient](#645-eisenstein-nonzero-coefficient).

### 6.54 Logarithmic prime decomposition

In the explicit Fourier-kernel setting, genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_(A𝔫)(n) counts those integral ideals belonging to {A𝔫} whose norm equals n (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Suppose ε(N) = +1 and n > 0 satisfies (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A [the hypothesis (4.2) is omitted in the printed statement of b); it is needed]. Prove that σ′_A(n) = Σ_(p|n) a_p(n) log p with a_p(n) = 0 if ε(p) = 1; a_p(n) = (ord_p(n) + 1)·δ(n)·R_(A𝔫𝔠)(n/p) if ε(p) = −1; a_p(n) = ord_p(n)·δ(n)·R_(A𝔫𝔠)(n/p) if ε(p) = 0, where, for ε(p) = −1 and ε(p) = 0, {𝔠} denotes the genus containing the integral ideals 𝔠 with N(𝔠) ≡ −p (mod D) (Remark 1). (Proof: a_p(n) = −2Σ_(d|n) ε_A(n,d) ord_p(d); multiplicativity reduces to the p-part; ε(p) = −1 and ν odd use ε_A(n,d₁) = ε_(A𝔠)(−n₁,d₁) and part a); p | D uses ε_A(n,d) = −ε_A(n,n/d) and ε_A(n,d₁) = ε_(A𝔠𝔭^(ν−1))(−n₁,d₁).)

Assume the classical Rankin data (C).

*Outline.* Expand σ′=log n·σ−2Σ ε_A(n,d)log d and separate prime powers. Use multiplicativity and the norm congruence to cancel split primes and evaluate inert/ramified contributions.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition b), p. 285; proof p. 287.)

*Needs:* [6.35 Signed divisor sums](#635-signed-divisor-sums), [6.36 Genus-sign multiplicativity](#636-genus-sign-multiplicativity), [6.46 Genus sigma identity](#646-genus-sigma-identity), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.55 Logarithmic weight-two projection

Fix Φ̃(z) = Σ_(m∈ℤ) a_m(y)e^(2πimz) ∈ M̃₂(Γ₀(N)) satisfy the growth condition (6.1) at all cusps ξ, and suppose A_ξ = A(N₁), B_ξ = B(N₁) depend only on N₁ = gcd(N, denominator of ξ). Let {α(M), β(M) : M | N} be the solution of the systems (6.3)–(6.4) of Classical setting 8. Prove that there is a holomorphic cusp form Φ = Σ_(m≥1) a_m e^(2πimz) ∈ S₂(Γ₀(N)) with (Φ, f) = (Φ̃, f) for all f ∈ S₂(Γ₀(N)) and, for (m, N) = 1, (6.5) a_m = lim_(s→0) [4πm ∫₀^∞ a_m(y) e^(−4πmy) y^s dy + 24α(1)σ₁(m)s^(−1)] + 24β(1)σ₁(m) + 48α(1)[σ′₁(m) − σ₁(m)(log 2m + 1/2 + ζ′/ζ(2))], where σ₁(m) = Σ_(d|m) d, σ′₁(m) = Σ_(d|m) d log d. (Proof: subtract Σ_(M|N){α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms and has expansion A(N₁) log y + B(N₁) + O(y^(−1) log y) at ξ, then apply the case A = B = 0.)

Assume the classical Rankin data (C).

*Outline.* Solve the two cusp-constant systems, using the invertible C_N matrix. Subtract Σ_M(α(M)F(Mz)+β(M)E(Mz)), which is cusp-orthogonal. Apply the weight-two Petersson projector to the decaying remainder and evaluate the regularized Fourier Mellin integral; restore the exact α(1),β(1) correction. Here a_m(y) is the coefficient after extracting e^(2πimz), so the Petersson unfolding has e^(−4πmy). With coefficients multiplying e^(2πimx) the corresponding exponential would be e^(−2πmy).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.2) Proposition, pp. 295-300.)

*Needs:* [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains), [6.18 Eisenstein Mellin asymptotics](#618-eisenstein-mellin-asymptotics), [6.37 Boundary Eisenstein cusp constants](#637-boundary-eisenstein-cusp-constants), [6.19 Cusp constant matrix inverse](#619-cusp-constant-matrix-inverse), [6.48 Projection boundary coefficients](#648-projection-boundary-coefficients), [6.47 Boundary Eisenstein orthogonality](#647-boundary-eisenstein-orthogonality).

### 6.57 Derivative of the mixed theta–Eisenstein series before projection

For φ ∈ S̄(B×A^×) invariant under U×U (B incoherent): W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_(0,v)(s,g,u), with L(s,η) completed. This gives the analytic continuation of the constant term. Moreover I′(0,g,φ) = −Σ_(v nonsplit) I′(0,g,φ)(v) − c0 Σ_(u∈µ_U²\F^×)Σ_(y∈E) r(g)φ(y,u) − Σ_v Σ_u Σ_(y∈E) c_(φ_v)(g,y,u) r(g)φ^v(y,u) + 2 log δ(g) Σ_u Σ_(y∈E) r(g)φ(y,u), where c0 = d/ds|_(s=0) log(L(s,η)/L(s+1,η)) = 2L′(0,η)/L(0,η) + log|d_E/d_F|, by L(1−s,η) = |d_E/d_F|^(s−1/2)L(s,η). For each fixed nonzero Fourier index only finitely many places contribute. The complete derivative is the convergent sum of placewise kernels and need not have finite place support.

Assume the CM quaternionic data (Q).

*Outline.* Differentiate the completed global zero coefficient product and the nonzero Fourier terms separately. For a fixed nonzero index the local Whittaker factors are the unramified values outside the primes dividing that index, the discriminants and the test-data conductors; their derivative contributions vanish there. Obtain local uniform convergence of the placewise Fourier sum from the differentiated Eisenstein expansion in its absolute-convergence half-plane, then its continued derivative and the projection bounds of 6.1. Use the quadratic functional equation for c₀; finite bad-place support applies to the normalized correction, rather than to the whole derivative.

**Checks.**

- For E=ℚ(i), each inert p≡3 mod4 admits y=j in B(p) with j²=−p; at u=1 the good-place derivative is log p, so infinitely many places occur as the Fourier index varies.
- At a fixed index a≠0, primes outside its divisors and the fixed conductor/discriminant set contribute zero.
- At those good places the arithmetic term equals the analytic term; their difference is zero even when each equals log p.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, 'Decomposition of the constant term', pp. 585–586 (from [YZZ13, §6.1.2, Prop. 6.7]).)

*Needs:* [6.6 Mixed theta–Eisenstein kernel](#66-mixed-thetaeisenstein-kernel), [6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 6.58 Rankin kernel meromorphic continuation

For each decomposition D = D₁·D₂ and each z ∈ ℌ, use the meromorphic character-Eisenstein family E^((D₁))_s(z) and Fourier expansion of AutomorphicSpectralTheory §§1.26–1.28, agreeing with (2.1) for Re(s) > 3/2 − k. Apply its expansion ([6.44 Eisenstein zero coefficient](#644-eisenstein-zero-coefficient) and [6.45 Eisenstein nonzero coefficient](#645-eisenstein-nonzero-coefficient)): the terms n ≠ 0 are entire in s (V_s(t) is entire for t ≠ 0, (3.3b)) and the series converges locally uniformly in (s, z) by the estimate V_s(t) = |t|^(O(1))e^(−2π|t|); the only possible poles come from the constant term V_s(0)L(2s+2k−2, ε)y^(−s−2k+2). The continued function keeps the transformation law of [6.14 Classical Eisenstein transformation](#614-classical-eisenstein-transformation). Consequently ℰ_s and Φ̃_s = (ℰ_s(Nz)θ_𝒜(z))|U_(|D|) continue meromorphically, Φ̃_s keeps its Γ₀(N) transformation law, and the expansions (3.1) and (3.2) hold for all s. This is what gives meaning to Φ̃_(−r) in Corollary (3.4) and to the values and derivatives at s = 0 and s = 1 − k used in §4.

Assume the classical Rankin data (C).

*Outline.* Use the continued zero and nonzero Eisenstein coefficient formulas. Prove the locally uniform Fourier bounds from the explicit continued Eisenstein coefficients and the Gaussian decay of the theta factor, retaining the source poles; the mixed derivative target gives the corresponding pole-subtracted bounds.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, implicit in Corollary (3.4) ('Φ̃_(−r)(z)', p. 281) and in §4 (p. 282); the paper states continuation only for V_s(t) (pp. 280–281).)

*Needs:* AutomorphicSpectralTheory §§0.39–0.45 and 1.26–1.28; [6.53 Rankin kernel Fourier expansion](#653-rankin-kernel-fourier-expansion), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.59 Logarithmic coefficient parity

In the explicit Fourier-kernel setting, under the hypotheses of (4.6b) (ε(N) = +1, n > 0, n satisfying (4.2)): Σ_(d|n) ε_A(n,d) = 0 (from (4.3)), hence σ′_A(n) = −2 Σ_(d|n) ε_A(n,d) log d; and every a_p(n) lies in 2ℤ. For a ramified divisor of n, the factor δ(n) supplies the 2. For an inert divisor p with R(n/p)≠0, the valuation ord_p(n) is odd, so its successor supplies the 2.

Assume the classical Rankin data (C).

*Outline.* Pair complementary divisors at the given prime power. The quadratic sign forces the stated parity restriction on the surviving logarithmic coefficient.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, Remark 2 after (4.6), p. 285.)

*Needs:* [6.54 Logarithmic prime decomposition](#654-logarithmic-prime-decomposition).

### 6.60 Single-prime logarithm criterion

In the explicit Fourier-kernel setting, genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_(A𝔫)(n) counts those integral ideals belonging to {A𝔫} whose norm equals n (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Under the hypotheses of (4.6b): σ′_A(n)=0 whenever at least two K-inert prime factors of n have odd valuation; if there is exactly one such prime p, σ′_A(n) = (ord_p(n) + 1)·δ(n)·R_(A𝔫𝔠)(n/p)·log p (the source prints ‘R_(A𝔫)(p)’); if there is none, n is a norm, and letting q be the norm of an ideal prime to D in the genus of (an ideal of norm n)·{A𝔫}, (−q/p) = −1 for an odd number of primes p | D, and σ′_A(n) = δ(n) ord_p(n) R(n) log p if there is exactly one such p, 0 if there are several. A priori reason: Σ_(d|n) ε_A(n,d)d^(−s) vanishes at s = 0 with derivative ½σ′_A(n) and has an Euler product, so σ′_A(n) ≠ 0 only if exactly one Euler factor vanishes at s = 0.

Assume the classical Rankin data (C).

*Outline.* Apply the prime decomposition and the parity restriction. The source genus condition leaves one nonsplit prime; preserve the ramified alternative instead of claiming the same valuation coefficient.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, remark following the proof of (4.6), p. 288.)

*Needs:* [6.54 Logarithmic prime decomposition](#654-logarithmic-prime-decomposition).

### 6.61 Archimedean holomorphic projection of log δ∞·W^(2)

Fix W^(2)(g_∞) = ∏_(v|∞) W_v^(2), with W_v^(2)(diag(y,1)) = y e^(−2πy)1_(y>0). Under the holomorphic-projection formula of [YZZ13, Prop. 6.12], whose per-place factor is 4π lim_(s→0)∫_0^∞ y^s W(y) W^(2)(y) dy/y² (so that W^(2) projects to itself), log δ_v(g_v)·W^(2)(g_∞) projects to −(1/2)(γ+log 4π)·W^(2)(g_∞). Hence log δ∞(g)W^(2)(g_∞) projects to c2·W^(2)(g_∞) with c2 = −([F:Q]/2)(γ+log 4π). Consequently c1 = c0 − 2c2 = 2L′(0,η)/L(0,η) + log|d_E/d_F| + [F:Q](γ+log 4π) = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, using L_∞(s,η) = Γ_ℝ(s+1)^([F:Q]) and L′_∞/L_∞(0,η) = −([F:Q]/2)(γ+log 4π).

Assume the CM quaternionic data (Q).

*Outline.* Apply the regularized weight-two Whittaker projection at each real place. Evaluate 2π∫₀∞e^(−4πy)log y dy=−(γ+log4π)/2 and add the real places. Remove the completed gamma logarithmic derivative to obtain the finite-part L constant.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, proof of Theorem 7.2, pp. 589–590.)

*Needs:* [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains), [6.57 Derivative of the mixed theta–Eisenstein series before projection](#657-derivative-of-the-mixed-thetaeisenstein-series-before-projection).

### 6.56 Projected derivative decomposition

Fix F, totally real, E/F a totally imaginary quadratic extension with character η, B a totally definite incoherent quaternion algebra over A_F with E_A → B, U ⊂ B_f^× open compact, and φ ∈ S̄(B×A^×) invariant under U×U, standard at every archimedean place, satisfying Assumption 7.1. Prove that Pr I′(0,g,φ)_U = −Σ_(v|∞) I′(0,g,φ)(v) − Σ_(v∤∞ nonsplit in E) I′(0,g,φ)(v) − c1·Ω_φ(g) − Σ_(v∤∞) Σ_(u∈µ_U²\F^×) Σ_(y∈E^×) c_(φ_v)(g,y,u) r(g)φ^v(y,u) + Σ_(u∈µ_U²\F^×) Σ_(y∈E^×) (2 log δ_f(g_f) + log|uq(y)|_f) r(g)φ(y,u). Here Ω_φ(g) = Σ_(u∈µ_U²\F^×)Σ_(y∈E^×) r(g)φ(y,u), and I′(0,g,φ)(v) = 2⨍_(C_U) K^((v))_φ(g,(t,t))dt is the normalized average over C_U = E^×\E^×(A_f)/(E^×(A_f)∩U). For v|∞, K^((v))_φ(g,(t1,t2)) = w_U Σ_(a∈F^×) lim_(s→0) Σ_(y∈µ_U⧵(B(v)^×_+ − E^×)) r(g,(t1,t2))φ(y)_a k_(v,s)(y), with k_(v,s)(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^(s+1)) and λ(y) = q(y2)/q(y) ∈ F_v. For finite nonsplit v, K^((v))_φ(g,(t1,t2)) = Σ_u Σ_(y∈B(v)−E) k_(r(t1,t2)φ_v)(g,y,u) r(g,(t1,t2))φ^v(y,u), with k_(φ_v)(g,y,u) = (L(1,η_v)/vol(E_v^1))·r(g)φ_(1,v)(y1,u)·W°′_(uq(y2),v)(0,g,u,φ_(2,v)) (y2 ≠ 0) for φ_v = φ_(1,v)⊗φ_(2,v), extended linearly. c1 = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, with L_f the finite part and d_E, d_F absolute discriminants. c_(φ_v)(g,y,u) = r_E(g)φ_(1,v)(y,u)W°′_(0,v)(0,g,u,φ_(2,v)) + log δ(g_v)r(g)φ_v(y,u) for pure tensors, extended linearly.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Differentiate the incoherent Fourier expansion, use the parallel-weight-two projector with its two-place growth theorem and the archimedean logarithmic integral, removing exactly the global gamma derivative.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, Theorem 7.2, p. 588; proof pp. 589–590.)

*Needs:* [6.6 Mixed theta–Eisenstein kernel](#66-mixed-thetaeisenstein-kernel), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains), [6.9 Two auxiliary split places](#69-two-auxiliary-split-places), [6.57 Derivative of the mixed theta–Eisenstein series before projection](#657-derivative-of-the-mixed-thetaeisenstein-series-before-projection), [6.61 Archimedean holomorphic projection of log δ∞·W^(2)](#661-archimedean-holomorphic-projection-of-log-δw2).

### 6.62 Integral Rankin kernel values

In the classical Rankin setting with the genus decomposition data (G): For r ∈ ℤ, 0 ≤ r ≤ k−1 (Φ̃ continued in s through its Fourier coefficients): Φ̃_(−r)(z) = Σ_(m=0)^(∞) ( Σ_(0≤n≤mδ/N) e_(n,r)(y) r_𝒜(mδ − nN) ) e^(2πimz), where e_(n,r)(y) := e_(−r)(n, Ny/δ) e^(2πNny/δ) is given by e_(0,r)(y) = L(2k−2r−1, ε)(Ny)^(−r) if r < k−1, and e_(0,k−1)(y) = [L(1, ε) − ε(N)(π/√δ) L(0, ε)] (Ny)^(1−k); e_(n,r)(y) = (−1)^(k−r) ε(N) (2π/√δ) (Ny)^(r−2k+2) p_(k,r)(4πNny/δ) Σ_(d|n, d>0) ε_𝒜(n, d) d^(2r−2k+2) for n > 0, with p_(k,r) as in (3.3d) and ε_𝒜(n, d) as in (3.2). The coefficients are polynomials in 1/y of degree at most r, including the zero polynomial.

Assume the classical Rankin data (C).

*Outline.* At integral s evaluate the gamma-normalized V_s and its derivative. Separate polynomial positive-index terms from the decaying q_(k−1) negative-index integral.

**Checks.**

- At k=1,r=0,ε(N)=1 the regular central coefficient functional equation gives a=−a, hence a=0. The coefficient polynomial is zero, with degree ⊥; it satisfies the bound but has no exact degree 0.
- At k=2,r=0, p_(2,0)(t)=t²/8 cancels the y⁻² prefactor, leaving a constant or zero. At r=1, p_(2,1)(t)=1−t gives a constant plus a multiple of 1/y, of degree at most 1.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.4) Corollary, pp. 281–282.)

*Needs:* [6.44 Eisenstein zero coefficient](#644-eisenstein-zero-coefficient), [6.45 Eisenstein nonzero coefficient](#645-eisenstein-nonzero-coefficient), [6.58 Rankin kernel meromorphic continuation](#658-rankin-kernel-meromorphic-continuation), [6.2 The classical V-kernel, terminating polynomials and decay](#62-the-classical-v-kernel-terminating-polynomials-and-decay).

### 6.63 Kernel coefficient functional equation

In the explicit Fourier-kernel setting, let n ∈ ℤ satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A, and y > 0. Put e*_s(n,y) := π^(−s) δ^s Γ(s+2k−1) e_s(n,y). Prove that e*_s(n,y) = −ε(N) e*_(2−2k−s)(n,y) for all s. Explicitly: e*_s(0,y) = (s+k)(s+k+1)⋯(s+2k−2)[π^(−s)δ^sΓ(s+k)L(2s+2k−1,ε)](δy)^s − ε(N)(2−k−s)(3−k−s)⋯(−s)[π^(1/2−s)δ^(s−1/2)Γ(s+k−1/2)L(2s+2k−2,ε)](δy)^(2−2k−s), the two brackets being interchanged by s ↦ 2−2k−s by the functional equation of L(s,ε); and for n ≠ 0, e*_s(n,y) = −iε(N)|n|^k π^(2k−1) δ^(−2k+3/2) y V*_s(ny) Σ_(d|n, d>0) ε_A(n,d)(|n|/d²)^(s+k−1), so that (4.1) for n ≠ 0 follows from V*_s(t) = sgn(t)V*_(2−2k−s)(t) (Prop. 3.3c) and (4.3).

Assume the classical Rankin data (C).

*Outline.* Apply the gamma reflection and integral continuation to the coefficient formula. Compare s with 2−2k−s; the signed divisor complement yields the source sign.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.1)–(4.2) and the two displays after (4.2), p. 282.)

*Needs:* [6.44 Eisenstein zero coefficient](#644-eisenstein-zero-coefficient), [6.45 Eisenstein nonzero coefficient](#645-eisenstein-nonzero-coefficient), [6.58 Rankin kernel meromorphic continuation](#658-rankin-kernel-meromorphic-continuation).

### 6.64 Central kernel holomorphy

In the classical Rankin setting with the genus decomposition data (G): At s = 0, Φ̃_(0,𝒜) ∈ M_(2k)(Γ₀(N)) (holomorphic, not in general cuspidal). This is the case r = 0 of (3.4); a priori it holds because ℰ_s(z) is holomorphic in z at s = 0.

Assume the classical Rankin data (C).

*Outline.* Evaluate the Fourier expansion at the central kernel parameter. The negative-index terms vanish and the remaining series has the exact holomorphic weight 2k transformation law.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, after (3.4), p. 282.)

*Needs:* [6.62 Integral Rankin kernel values](#662-integral-rankin-kernel-values), [6.53 Rankin kernel Fourier expansion](#653-rankin-kernel-fourier-expansion).

### 6.65 Classical L functional equation

In the explicit Fourier-kernel setting, l_A(f,s) extends to an entire function of s and L*_A(f,s) := (2π)^(−2s) N^s |D|^s Γ(s)² L_A(f,s) satisfies L*_A(f,s) = −ε(N) L*_A(f, 2k−s). In particular, if ε(N) = +1 then L_A(f,k) = 0. (§4 deduces this from Prop. (1.2), Eq. (3.1) and (4.1), which applies to every coefficient because the n occurring in (3.1) satisfy (4.2).)

Assume the classical Rankin data (C).

*Outline.* Pair the kernel functional equation with the newform. Cancel the exact unfolding gamma and level factors to obtain Λ(s)=−ε(N)Λ(2k−s).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math.84(1986), ChapterIV (0.2), p.267; completion of the functional-equation proof in §4, pp.282–283.)

*Needs:* [6.41 Rankin kernel pairing](#641-rankin-kernel-pairing), [6.63 Kernel coefficient functional equation](#663-kernel-coefficient-functional-equation).

### 6.66 Classical central-value kernel

In the explicit Fourier-kernel setting, suppose ε(N) = −1. Prove that L_A(f,k) = 2^(2k+1) π^(k+1) / ((k−1)! √δ) · (f, Φ̃), where Φ̃ ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_(m=0)^∞ ( Σ_(0<n≤mδ/N) σ_A(n) r_A(mδ − Nn) p_(k−1)(4πNny/δ) + (h/u) r_A(m) ) y^(1−k) e^(2πimz). The coefficients of Φ̃ are polynomials in y^(−1) of degree ≤ k−1; for k = 1, Φ̃ is a holomorphic modular form (not a cusp form). (Φ̃ = (N^(k−1)√δ/2π)·Φ̃_(1−k); the proof is Prop. (1.2) and Cor. (3.4) with r = k−1.)

Assume the classical Rankin data (C).

*Outline.* Evaluate the holomorphic central kernel and express its finite coefficients with σ. Apply the norm congruence/genus relation; preserve the endpoint r_A(0)=1/w.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.4) Proposition, p. 283.)

*Needs:* [6.62 Integral Rankin kernel values](#662-integral-rankin-kernel-values), [6.53 Rankin kernel Fourier expansion](#653-rankin-kernel-fourier-expansion), [6.35 Signed divisor sums](#635-signed-divisor-sums).

### 6.67 Classical central-derivative kernel

In the explicit Fourier-kernel setting, suppose ε(N) = +1. Prove that L′_A(f,k) = 2^(2k+1) π^(k+1) / ((k−1)! √δ) · (f, Φ̃), where Φ̃ = (N^(k−1)√δ/2π)·∂Φ̃_s/∂s|_(s=1−k) ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_(m=−∞)^(∞) [ −Σ_(0<n≤mδ/N) σ′_A(n) r_A(mδ − Nn) p_(k−1)(4πnNy/δ) + (h/u) r_A(m)(log y + Γ′/Γ(k) + log Nδ − log π + 2L′/L(1, ε)) − Σ_(n=1)^∞ σ_A(−n) r_A(mδ + Nn) q_(k−1)(4πnNy/δ) ] y^(1−k) e^(2πimz) (the first two terms are absent if m < 0; in the third term n has been replaced by −n). The paper prints σ_A(n) in the third term; it must be σ_A(−n) (= δ(n)R_(A𝔫)(n) by Prop. (4.6a), under the norm congruence (4.2)). Ingredients (p. 283–284): ∂e_s(0,y)/∂s|_(1−k) = 2L(1,ε)(δy)^(1−k)[Γ′/Γ(k) + log(δ²y/π) + 2L′/L(1,ε)]; for n > 0, ∂e_s(n,y)/∂s|_(1−k) = 2iδ^(1/2−k)y^(1−k)V_(1−k)(ny)Σ_(d|n)ε_A(n,d) log d; for n < 0, ∂e_s(n,y)/∂s|_(1−k) = −iδ^(1/2−k)y^(1−k)·∂V_s(ny)/∂s|_(1−k)·Σ_(d|n)ε_A(n,d), with V_(1−k), ∂V_s/∂s|_(1−k) from Prop. (3.3d,e).

Assume the classical Rankin data (C).

*Outline.* Differentiate each continued Fourier branch at the central parameter. The positive-index term uses σ′, the negative-index term uses σ(−n) and q_(k−1); the zero coefficient is differentiated separately.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, pp. 283–284: the three derivative displays and (4.5) Proposition.)

*Needs:* [6.62 Integral Rankin kernel values](#662-integral-rankin-kernel-values), [6.53 Rankin kernel Fourier expansion](#653-rankin-kernel-fourier-expansion), [6.35 Signed divisor sums](#635-signed-divisor-sums), [6.17 Different ideal reindexing](#617-different-ideal-reindexing).

### 6.68 Completed Rankin functional equation

Under the standing hypotheses (in particular D ≡ □ mod 4N, so ε(N) = 1), for f in the new space of weight 2 on Γ₀(N) (normalized eigenform for L(f, χ, s)), the functions L_𝒜(f, s) and L(f, χ, s) have analytic continuations to the entire s-plane, satisfy functional equations under s ↦ 2 − s, and vanish at s = 1. Precisely (Chapter IV (0.2) with k = 1): L*_𝒜(f, s) := (2π)^(−2s) N^s |D|^s Γ(s)² L_𝒜(f, s) = −ε(N) L*_𝒜(f, 2 − s), and −ε(N) = −1.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Pair the continued kernel with newforms and use its coefficient functional equation. The completed factor is (2π)^(-2s)(N|D|)^sΓ(s)^2; reflection s↦2k−s has sign −ε(N).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.5) Proposition, p. 229; proved in Chapter IV: continuation via Rankin's method (§1, Proposition (1.2)), functional equation (0.2) proved in §4, pp. 282–283 ('This completes the proof of the functional equation').)

*Needs:* [6.26 Classical Rankin normalization](#626-classical-rankin-normalization), [6.65 Classical L functional equation](#665-classical-l-functional-equation).

### 6.69 Weight-two central-value formula

In the explicit Fourier-kernel setting, suppose ε(N) = −1 and k = 1. For m ≥ 0 define b_(m,A) = r_A(m|D|)·h/u + Σ_(0<n≤m|D|/N) δ(n) R_(A𝔫)(n) r_A(m|D| − nN), with δ(n), R_(A𝔫)(n) as in (4.6). Prove that Σ_(m≥0) b_(m,A)q^m is a modular form of weight 2 and level N, and L_A(f,1) = (8π²/√|D|)·(f, Σ_m b_(m,A)q^m) for every f in the space spanned by newforms of weight 2 and level N. (At k = 1 the constant (2π)^(2k)2^(2k−1)(k−1)!/((2k−2)!|D|^(k−1/2)) of Gross–Zagier IV (5.6) equals 8π²/√|D|, and no holomorphic projection is needed because Φ̃ of (4.4) is holomorphic.) Only k = 1 is a target. For general k the projection of 6.66 by Gross–Zagier IV (5.1) gives the constant 2^(4k−1)π^(2k)/((2k−2)!|D|^(k−1/2)); the constant printed in (5.6) carries an extra factor (k−1)!, which agrees with it for k ≤ 2 and not for k ≥ 3.

Assume the classical Rankin data (C).

*Outline.* Use the weight-two holomorphic central kernel, which needs no regularized projection. Pair with the newform and simplify the constant to 8π²/√|D|; retain ε(N)=−1.

Its coefficient API consists of the following facts:

- The coefficient at m≥0 is the displayed finite norm-count convolution, including its separate endpoint term.
- The sequence is the Fourier expansion of the stated holomorphic weight-two form.
- Its newform Petersson pairing has exactly the scalar 8π²/√|D|.

**Checks.**

- For D=−7 and h=u=1, the formal constant coefficient is r_A(0)h/u=1/2; suppressing it incorrectly makes the seed cuspidal. This coefficient control does not require a level-one newform.
- At k=1 the kernel polynomial is p₀=1, so the coefficient is independent of y; retaining a factor 1/y fails holomorphy.
- The endpoint has δ(0)R(0)=2·(1/2)=1 for D=−7, giving the same h/u=1 coefficient as the separate endpoint term.


([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, (5.6) Theorem, p. 291.)

*Needs:* [6.66 Classical central-value kernel](#666-classical-central-value-kernel), [6.41 Rankin kernel pairing](#641-rankin-kernel-pairing), [6.46 Genus sigma identity](#646-genus-sigma-identity).

### 6.70 Rankin cusp constants

In the weight-two central-derivative setting, let Φ̃ be the function of Prop. (4.5) for k = 1, i.e. Φ̃ = (√δ/2π)·∂/∂s Φ̃_s|_(s=0) with Φ̃_s = Tr^(ND)_N(θ_𝒜(z)E_s^((1))(Nz)) (Prop. (1.2)). Prove that Φ̃ satisfies the hypotheses of (6.2) with A(N₁) = (h/(2u²)) ε(N₁)N₁/N, B(N₁) = A(N₁)(log(N₁²δ/(Nπ)) − γ + 2(L′/L)(1, ε)) (N₁ | N), γ = Euler's constant. (Proof: at a cusp with invariant N₁, (Φ̃_s|₂α)(z) = (1/(2u))(ε(N₁)/N₂)[L(2s+1,ε)(N₁y/N₂)^s − (iV_s(0)/|D|^(1/2)) L(2s,ε)(N₁y/N₂)^(−s)] + … with N₂ = N/N₁, V_s(0) = −π^(1/2)Γ(s+½)i/Γ(s+1), using Lemma (2.3) and (2.2) of Chap. IV and the count of cosets of Γ₀(ND)\Γ₀(N)α with D | c (one) and (c, D) = 1 (|D| of them).)

Assume the classical Rankin data (C).

*Outline.* Compute the central derivative kernel at each cusp via its theta/Eisenstein transform. The A(N₁)log y and B(N₁) terms retain the quadratic L logarithmic derivative and level factors.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.8) Proposition and proof, pp. 301-303.)

*Needs:* [6.67 Classical central-derivative kernel](#667-classical-central-derivative-kernel), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18.

### 6.71 Rankin Mellin regularization

In the weight-two central-derivative setting, for m > 0, a_m(y) = A_m log y + B_m + Σ_(n≥1) C_(mn) q₀(4πnNy/δ) (from Prop. (4.5); q₀(t) = ∫₁^∞ e^(−tx)dx/x), with A_m = (h/u)r_𝒜(m), B_m = A_m(log(Nδ/π) − γ + 2(L′/L)(1,ε)) − Σ_(1≤n≤mδ/N) σ′_𝒜(n) r_𝒜(mδ − Nn), C_(mn) = −σ_𝒜(−n) r_𝒜(mδ + Nn) (σ_𝒜, σ′_𝒜 as in Prop. (4.6)). Prove that ∫₀^∞ a_m(y)e^(−4πmy)y^s dy = Γ(s+1)(4πm)^(−s−1)(A_m (Γ′/Γ)(s+1) − A_m log 4πm + B_m) + Σ_n C_(mn) ∫₀^∞ q₀(4πnNy/δ)e^(−4πmy)y^s dy, and ∫₀^∞ q₀(4πnNy/δ)e^(−4πmy)y^s dy = 2Γ(2s+2)/((4πm)^(s+1)Γ(s+2)) · Q_s(1 + 2nN/(mδ)) + ε_n(s), ε_n(s) = O(n^(−s−2)) (uniformly near s = 0), ε_n(0) = 0, using Q₀(1+2t) = ½ log(1 + 1/t) and Q_s(1+2t) = (Γ(s+1)²/(2Γ(2s+2)))[t^(−s−1) + O(t^(−s−2))] (t → ∞). Since C_(mn) = O(n^c) for all c > 0, 4πm ∫₀^∞ a_m(y)e^(−4πmy)y^s dy = B_m − A_m(γ + log 4πm) + (2Γ(2s+2)/((4πm)^sΓ(s+2))) Σ_n C_(mn) Q_s(1 + 2nN/(mδ)) + o(1) (s → 0).

Assume the classical Rankin data (C).

*Outline.* Apply the continued Fourier integral to the differentiated positive, negative and zero branches. Evaluate the logarithmic exponential integral and Legendre tail; only after this continuation extract the constant at s=0.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 303-304.)

*Needs:* [6.67 Classical central-derivative kernel](#667-classical-central-derivative-kernel), AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, [6.2 The classical V-kernel, terminating polynomials and decay](#62-the-classical-v-kernel-terminating-polynomials-and-decay).

### 6.72 Central-value endpoint normalization

In the explicit Fourier-kernel setting with k = 1, in the coefficients b_(m,A) of 6.69 one may drop the term r_A(m|D|)h/u and extend the sum to 0 ≤ n ≤ m|D|/N, because δ(0) = 2^t (t = number of prime factors of D) and R_(A𝔫)(0) = h/(2^t u) (each genus contains h/2^(t−1) classes and r_B(0) = 1/(2u) for each class B), while the kernel polynomial is P₀ = 1.

Assume the classical Rankin data (C).

*Outline.* Keep the l=0 and n=0 endpoints of the finite central kernel sum. Use r_A(0)=1/w and the class number formula to check the constant coefficient.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, p. 291 (paragraph after Theorem (5.6)).)

*Needs:* [6.69 Weight-two central-value formula](#669-weight-two-central-value-formula), [6.46 Genus sigma identity](#646-genus-sigma-identity).

### 6.73 Central-value genus-sum filter

In the explicit Fourier-kernel setting, for positive integers n and l: Σ_A R_(A𝔫)(n) r_A(l) = Σ_(genera G) R_(G𝔫)(n) R_G(l), which equals R(n)R(l) if the genus of an ideal of norm nl (if any) is {𝔫}, and 0 otherwise; here R(n) = Σ_(d|n) ε(d). If ε(N) = −1 (so N(𝔫) ≡ −N mod D) and l = m|D| − nN > 0, the genus conditions at the primes p | D with p ∤ n are automatic (l ≡ N(𝔫)n mod p), and δ(n) Σ_A R_(A𝔫)(n) r_A(m|D| − nN) = R(n) R(m|D| − nN) ∏_(p|(n,D)) (1 + ε̂_p((nN − m|D|)/(nN))), where ε̂_p : ℚ^× → {±1} is the homomorphism with ε̂_p(q) = (q/p) for primes q ≠ p, ε̂_p(−1) = (−1/p), and ε̂_p(p) = ((|D|/p)/p). [The source prints the prime-divisor condition with p|N where p|D is required.]

Assume the classical Rankin data (C).

*Outline.* Sum the ideal-class central value over its genus characters. Apply orthogonality to isolate the stated class/genus contribution and its 2^t factor.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, p. 292 (first half).)

**Negative control.** n=0 is excluded: the argument of ε̂_p contains nN in its denominator. The separate boundary coefficients of 6.72 handle that endpoint.

*Needs:* [6.69 Weight-two central-value formula](#669-weight-two-central-value-formula), [6.46 Genus sigma identity](#646-genus-sigma-identity), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 6.74 Rankin boundary coefficients

In the weight-two central-derivative setting, for Φ̃ as in (6.8): α(1) = (h/(2u²)) N^(−1) ρ^(−1) Σ_(N₁|N) μ(N₁)ε(N₁)/N₁ = (h/(2u²)) N^(−1) ∏_(p|N)(1 + ε(p)/p)^(−1), β(1) = α(1)(log(δ/(Nπ)) − γ + 2(L′/L)(1, ε) − 2 Σ_(p|N) log p/(p² − 1)).

Assume the classical Rankin data (C).

*Outline.* Insert these Rankin cusp constants into the two linear systems. Use the matrix inverse to obtain α(1),β(1), keeping the product Π_(p|N)(1+ε(p)/p)^(-1).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, display after (6.8), p. 303.)

*Needs:* [6.19 Cusp constant matrix inverse](#619-cusp-constant-matrix-inverse), [6.70 Rankin cusp constants](#670-rankin-cusp-constants).

### 6.75 Definite period specialization

In the definite ε(N)=−1, weight-two specialization, identify the CM class vector in the rational quaternionic eigenspace with the probability-normalized toric period. Under the local/global pairing and measure conventions of the normalized Waldspurger period formula, its χ,eigencomponent norm computes L(f,χ,1) with that formula’s exact product of local factors. This is a specialization of the coherent formula, not a theorem with an unspecified proportionality constant.

Assume the classical Rankin data (C).

*Outline.* Interpret the definite CM class vector as a toric period in the coherent quaternionic realization. Apply the normalized Waldspurger formula already planned here; the historical announcement alone does not supply its unspecified scalar.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §3, p. 314.)

*Needs:* [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [6.69 Weight-two central-value formula](#669-weight-two-central-value-formula), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent).

### 6.76 Projected Rankin derivative cusp form

In the weight-two central-derivative setting, there exists a holomorphic cusp form Φ_𝒜(z) = Σ_(m≥1) a_(m,𝒜) e^(2πimz) of weight 2 and level N such that L_𝒜(f, 1) = 0 and L′_𝒜(f, 1) = (8π²/√δ)(f, Φ_𝒜) for every cusp form f in the space spanned by newforms of weight 2 and level N. (δ = |D|; the constant equals 8π²/√|D|, consistent with Chap. I (6.2).)

Assume the classical Rankin data (C).

*Outline.* Check the logarithmic growth condition at every cusp. Apply the boundary-corrected weight-two projection; pairing with a cusp form is unchanged.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (i), p. 305; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §9, (9.2) with k = 1, p. 233; proved in Chapter IV, Theorem (6.9), p. 305 (via Rankin's method §§1–3, the functional equation §4 and holomorphic projection with Hecke's trick §6).)

*Needs:* [6.55 Logarithmic weight-two projection](#655-logarithmic-weight-two-projection), [6.67 Classical central-derivative kernel](#667-classical-central-derivative-kernel), [6.70 Rankin cusp constants](#670-rankin-cusp-constants), [6.74 Rankin boundary coefficients](#674-rankin-boundary-coefficients), [6.71 Rankin Mellin regularization](#671-rankin-mellin-regularization).

### 6.77 Definite central-value square class

Fix a nonzero rational generator e of the one-dimensional M_f quaternionic eigenspace and its bilinear form. If the trivial-character CM projection is x_(1,f)=a_K e with a_K∈M_f, its norm is a_K²(e,e). The coherent normalized central-value identity then gives L(f,1_K,1)/C_K=a_K²(e,e), with C_K its specified discriminant, measure, Petersson and local factors; for a_K≠0 and (e,e)≠0, the square class of this nonzero normalized value in M_f^×/(M_f^×)² is independent of K. The norm identity also holds when a_K=0, giving a zero central value, to which no multiplicative square class is assigned.

Assume the classical Rankin data (C), k=1, ε(N)=−1, and the nondegenerate coefficient-field pairing of 6.75; every factor of C_K is nonzero for the specified distinguished test vector.

*Outline.* Use the one-dimensional rational coefficient-field eigenspace and its fixed nondegenerate bilinear pairing. Writing x_(1,f)=a·e makes its norm a² times the fixed nonzero norm of e; the completed-period normalization must remain fixed when K varies.

**Checks.**

- If a_K=0, both sides of the norm identity are zero, but there is no element of M_f^×/(M_f^×)² represented by that value.
- If a_K=2, its norm is 4(e,e), with the same nonzero square class as (e,e).
- Replacing e by 2e replaces a_K by a_K/2; the norm and its nonzero square class are unchanged.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §3, p. 314.)

*Needs:* [6.75 Definite period specialization](#675-definite-period-specialization), [3.4 Strict GL₂ realization and transfer](#34-strict-gl-realization-and-transfer).

### 6.78 Projected Rankin derivative coefficients

In the weight-two central-derivative setting, for m prime to N, a_(m,𝒜) = − Σ_(1≤n≤m|D|/N) σ′_𝒜(n) r_𝒜(m|D| − nN) + (h/u) r_𝒜(m)[log(N|D|/(4π²m)) − 2γ + 2(L′/L)(1, ε)] + lim_(s→0)[−2 Σ_(n≥1) σ_𝒜(−n) r_𝒜(m|D| + nN) Q_s(1 + 2nN/(m|D|)) − (hκ/u²) σ₁(m) s^(−1)] + (hκ/u²)[σ₁(m)(log(N/|D|) + 2 Σ_(p|N) log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_(d|m) d log(m/d²)], where σ₁(m) = Σ_(d|m) d, κ = −12/(N ∏_(p|N)(1 + ε(p)/p)), σ_𝒜, σ′_𝒜 as in Prop. (4.6), Q_s = Legendre function of the second kind, γ = Euler's constant.

Assume the classical Rankin data (C).

*Outline.* Insert the explicit Mellin constants and α(1),β(1) into the projection formula. Combine the divisor logs using σ₁(m)log m−2σ′₁(m); the archimedean tail carries σ_A(−n).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (ii), p. 305.)

*Needs:* [6.76 Projected Rankin derivative cusp form](#676-projected-rankin-derivative-cusp-form), [6.71 Rankin Mellin regularization](#671-rankin-mellin-regularization), [6.35 Signed divisor sums](#635-signed-divisor-sums).

### Examples

For D=−3, the signed divisor sums give σ(3)=0 and σ(−3)=2. They cannot be replaced by a function of |n|. In the weight-two derivative Mellin integral the Fourier decay is exp(−4πmy), after extracting exp(2πimz). At an auxiliary S₂-place the two nonzero contributions are n_φ=−ψ₂/(1+q+q²) and c_φ=2n_φ log q; their combined defect d_φ is zero.

### Dependencies

HilbertModularVarietiesAndShimuraCurves R18.1.3 (finite quaternionic Hecke tower); MotivesAndAlgebraicCycles §0.1; SchemeAndStackFoundations §§5.1–5.8; ModularForms Layers 3 and 5; Earlier layers 0a, 0, 1, 2, 3, 5. The direct external interfaces used above are AutomorphicSpectralTheory §§0.39–0.45 and 1.25–1.30, Mathlib `EisensteinSeries.E2`, Mathlib `EisensteinSeries.hasSum_qExpansion_E2`, Mathlib `EisensteinSeries.E2_slash_action`, Mathlib `Complex.Gamma`, Mathlib `Matrix.det_vandermonde`, Mathlib `Matrix.mul_apply`, Mathlib `MeasureTheory.integral`, Mathlib `Polynomial`, Tau Ceti `CuspForm.peterssonInnerCosets`, Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`, TauCetiRoadmap.JacobianChallenge Layer F, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, AutomorphicFormsOnReductiveGroups §7.2, AutomorphicFormsOnReductiveGroups §7.2, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, AutomorphicSpectralTheory §§1.25–1.30 and 2.17–2.18, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), `HeightsRationalPointsAndObstructions:§§0.19–0.21`, `HeightsRationalPointsAndObstructions:§1.7`, HilbertModularVarietiesAndShimuraCurves Layer R18.5, MetaplecticAutomorphicForms §5.9, MetaplecticAutomorphicForms Layer 5, MetaplecticAutomorphicForms §§6.7–6.9, MetaplecticAutomorphicForms Layer 7, `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`, ModularCurvesPartII §9, `ModularCurvesPartII:§§13.1–13.4`, ModularCurvesPartII §§7.3–7.4, 9 and 13.2–13.4, ModularCurvesPartII §§7.5–7.6 and 13.2–13.4, AutomorphicSpectralTheory §§1.14–1.15, 1.30 and 2.17–2.18. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 7: Local intersections, Green kernels and cancellation

Compare the local analytic singularity with the actual local deformation or Green height. Keep diagonal finite parts, tangent corrections, vertical divisors and stabilizer factors until the global cancellation has been proved. Sections are listed in dependency order and are cited by their numbers, so the numbers do not always increase down the page.

### 7.1 Ordinary CM lift charts and split intersection lengths

Let G be an ordinary height-two p-divisible group over an algebraically closed field of characteristic p, with fixed connected and étale rank-one factors and their Tate-module bases. Its deformations over a complete local base with nilpotent Artinian quotients have Serre–Tate coordinate Q=1+t∈1+𝔪. For two such coordinates Q,Q′, a special-fibre homomorphism with scalars (a on the connected factor, b on the étale factor) lifts exactly when Q^a=(Q′)^b. This is the elliptic, rank-one case of the Hom criterion of AbelianSchemesAndArithmeticModuli A4.10 (`SerreTate.homCriterion`); the scalar form, the lengths and the charts below are the additions here. In the formal O_v-module variant use the height-one formal group law, so the equation is [a]q−_H[b]q′=0, not ordinary multiplication of q by a. The canonical split CM lift has t=0, and all its special-fibre Hom maps respecting the CM splitting lift. For nonidentical sections, the local intersection multiplicity is the length of the quotient by the difference of their coordinates; if the coordinates coincide, use the separately defined tangent/diagonal symbol, not an infinite sum of finite counts.

*Outline.* Compute extension classes of the connected and étale factors. Push out the source extension by its connected scalar a and pull back the target extension by its étale scalar b; equating these classes gives the displayed exponents. CM idempotents select the split extension t=0. On a fine integral curve chart its regular one-dimensional completed local ring identifies intersections with the displayed length. In the quaternionic ordinary chart, express the upper/lower unipotent translates of the CM section in these coordinates and compute the two valuations separately; summing over the finite stabilizer quotient gives the formula in the finite-local-multiplicity target. At division places use Čerednik–Drinfeld's vertex/edge charts instead, as in the superspecial target. This target supplies the missing chart calculation, while R18 supplies the integral models and uniformization.

Its API consists of the following facts:

- The marked ordinary deformation has its multiplicative coordinate Q, and the scalar Hom-lifting criterion is Q^a=(Q′)^b.
- The canonical split lift carries every special-fibre Hom respecting the connected/étale splitting.
- Distinct CM sections have intersection length equal to the coordinate-difference quotient length, with the specified unipotent coordinate.
- The fine-cover coordinate comparison descends with the stabilizer-weighted projection formula.
- The marked split level-s orbit has size q^s(1−q⁻¹) for s>0; level 0 has one canonical lift.

**Checks.**

- Q=Q′=1 lifts every diagonal pair (a,b), giving full Hom on the canonical split lift.
- If a=1,b=0, liftability forces Q=1: an identity on the connected factor with zero étale map splits the source extension. If a=0,b=1 it instead forces Q′=1. Swapping a,b gives the wrong condition.
- For sections t=0 and t=π^r, r>0, their intersection has length r, not r log q. The latter factor enters the height afterwards.
- For identical sections the coordinate difference vanishes and the proper-intersection formula is inapplicable.
- Over the square-zero ring k[ε]/(ε²), k an algebraic closure of 𝔽₂, Q=1+ε satisfies Q³=1+3ε=1+ε=Q. The exponents 1 and 3 therefore satisfy the multiplicative lifting equation; replacing it by equality of the two exponents fails in this dyadic deformation.
- At split level 1 the quasi-canonical orbit has q−1 elements, contrasting with q+1 in the unramified field case.

([ARGOS seminar](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/argos.pdf), Meusers, Chapter 9 §2 Proposition 2.1, p. 102, §3 Propositions 3.4–3.5, pp. 104–105; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), III §§3–6, pp. 257–260; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §§8.2–8.3, pp. 614–619.)

*Needs:* TauCetiRoadmap.ModularCurves Layer 7F ST-1 for the elliptic deformation equivalence, AbelianSchemesAndArithmeticModuli A4.10 (`SerreTate.homCriterion`) for the ordinary coordinate and its Hom criterion, HilbertModularVarietiesAndShimuraCurves R18.2.6, HilbertModularVarietiesAndShimuraCurves R18.5.15 for division-place charts, Mathlib length of finite modules.

### 7.2 CM lifts and the integral endomorphism filtration

Let K_v be a nonarchimedean local field of mixed characteristic, with residue cardinality q, and let G over its algebraically closed residue field be a height-two one-dimensional formal O_(K_v)-module. Set O_D=End(G). Fix a quadratic field L/K_v and an embedding O_L→O_D. Over the completed strict integer ring A of L, with uniformizer π_L, construct the canonical lift F with this O_L-action and its prescribed action on Lie(F). For F_n over A/π_L^(n+1), prove
End(F_n)=O_L+π_L^n O_D (n≥1), inside End(G).
Thus the exponent for a quotient written A/π_L^m is m−1, not m. This theorem includes ramification at 2. The splitting case is treated by the preceding ordinary target, not by declaring O_D division in that case.

For O_s=O_(K_v)+π_(K_v)^s O_L, s≥1, construct the level-s quasi-canonical lifts together with their marking and canonical-to-quasi-canonical isogeny of degree q^s. Their marked Galois orbit is O_L×/O_s×, of size q^(s−1)(q+1) for unramified L/K_v and q^s for ramified L/K_v. Level 0 is one canonical lift. Compute liftability of a special-fibre endomorphism by the length of its intersection with this lift, retaining the different exponent and the uniformizer of L. Derive the negative-norm congruence counts used below from this filtration, not from an unramified formula with q substituted for p.

More precisely, let M=Frac(A) and choose the standard totally ramified field of definition M′/M of the marked level-s lift, of degree # (O_L×/O_s×). Put A′=O_(M′), let π′ be its uniformizer, e_s=e(A′/O_(K_v)), and π_D a uniformizer of O_D. Set a(j)=(q^j−1)(q+1)/(q−1) for integers j. Then e_s=2q^s in the ramified case and q^s+q^(s−1) in the unramified case for s≥1. For an integer ℓ≥0 and an element in the nonempty stratum
(O_s+π_D^ℓO_D)∖(O_s+π_D^(ℓ+1)O_D),
the lift exists over A′/(π′)^n, n≥1, precisely for n≤n_ℓ, where

```text
n_ℓ = a(ℓ/2)+1                                      if ℓ≤2s and ℓ even,
      a((ℓ−1)/2)+q^((ℓ−1)/2)+1                      if ℓ≤2s and ℓ odd,
      a(s−1)+q^(s−1)+((ℓ+1)/2−s)e_s+1               if ℓ≥2s−1.
```

The overlapping formulas agree on every nonempty stratum. For unramified L/K_v the even strata ℓ≥2s are empty; applying the last formula to such an ℓ can produce a noninteger and is forbidden. Elements of O_s lift at every order. The quotient exponent n is one more than the index of F′_(n−1). Transport to another base multiplies lengths by its ramification index.

*Outline.* Deform the marked formal O_L-module with its Lie condition; uniqueness fixes the canonical lift. Wewers's lifting argument identifies successively the congruence order above; valuations are on L. Construct level-s quotients by cyclic O_(K_v)-subgroups and identify stabilizer O_s× to get orbit sizes. For intersection lengths use the quasi-canonical deformation rings and Vollaard's endomorphism-lifting formula, separating canonical level 0, positive level and ramified different. Combine the height-two formal calculation with Serre–Tate equivalence and the diagram rigidity target to count elliptic isogeny diagrams. Ordinary and quaternionic cases remain distinct.

Its API consists of the following facts:

- The canonical CM lift has its specified action, special-fibre marking and uniqueness property.
- Its endomorphism order modulo π_L^(n+1) is O_L+π_L^nO_D for n≥1.
- Each quasi-canonical level has its specified order, marking and degree-q^s isogeny.
- The orbit has q^(s−1)(q+1) elements in the unramified quadratic case and q^s in the ramified case for s>0.
- The endomorphism lifting length and negative-norm congruence counts follow the stated nonempty-stratum formulas.
- Uniformizer transport multiplies lengths by the ramification index.

**Checks.**

- Modulo π_L the whole O_D acts; modulo π_L² the order is O_L+π_LO_D.
- At unramified level 1 the orbit has q+1 elements, at ramified level 1 it has q, while level 0 has one; a single q^s formula fails.
- Replacing π_L-length by π_(K_v)-length in the ramified case changes the answer unless the ramification factor is included.
- At q=3,s=1, a nonempty stratum ℓ=1 has n_ℓ=2, while ℓ=3 has n_ℓ=6 in the unramified case and 8 in the ramified case. The element lifts modulo (π′)^n_ℓ but fails modulo (π′)^(n_ℓ+1).
- In the dyadic ramified case keep v(D_(L/K_v)); the tame value cannot be assumed.

([ARGOS seminar on intersections of modular correspondences](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/argos.pdf), Wewers, Chapter 8 §1 Theorem 1.4, p. 79 and §3 Theorem 3.2, p. 84; Vollaard, Chapter 11 §2 Theorems 2.1 and 2.3, pp. 114–115; [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §8.3, p. 618.)

*Needs:* LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 (marked deformations and the universal deformation of finite-height formal O_(K_v)-modules) and LT.6 (canonical and quasi-canonical lifts, their endomorphism rings, quadratic CM orders and smallest marked fields of definition), TauCetiRoadmap.ModularCurves Layer 7F ST-1 for transport between elliptic and p-divisible deformations, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` for Dieudonné theory of formal groups, ComplexMultiplicationAndExplicitReciprocity §5.2 (`supersingularLevelOrderComparison`) for the special-fibre quaternion/Eichler orders. The endomorphism filtration End(F_n)=O_L+π_L^nO_D and the lifting lengths n_ℓ are the owned part of this target.

### 7.3 Hom of actual integral CM isogeny diagrams

For a complete DVR W with algebraically closed residue field, R_n=W/π^n (n≥1), and chosen cyclic degree-N isogenies x=(φ:E→E′), y=(ψ:F→F′) of elliptic schemes over W, define
Hom_R(y,x)={(f:F→E,f′:F′→E′) | φ∘f=f′∘ψ}.
End_R(x)=Hom_R(x,x), with componentwise addition and composition. Define Hom_R(y,x)_m by deg f=m>0; compatibility forces deg f′=m. The data are actual schemes and maps, not arbitrary lifts of coarse Artinian points. Reduction identifies Hom_Rn as a subgroup of the special-fibre Hom, and Hom_W is the intersection of the liftable subgroups. A fixed positive-degree fibre is finite; f↦−f acts freely on it. Put h_n=½#Hom_Rn(y,x)_m, which is therefore integral. If Hom_R(y,x)_m is nonempty, postcomposition gives a faithful Aut_R(x)-action on it, since a nonzero elliptic isogeny is faithfully flat. No faithful action on an empty fibre is asserted.

*Outline.* Rigidity of homomorphisms of abelian schemes gives injectivity under nilpotent reduction. Proper formal existence identifies the compatible inverse limit with Hom_W. On the special fibre use positivity of the degree quadratic form on Hom of elliptic curves for finiteness; equal degrees follow by multiplying by N in deg(φf)=deg(f′ψ). A map fixed by sign has 2f=0, hence f=0, excluded by m>0. Extend prime-to-p cyclic kernels uniquely as finite étale subgroups; p-power kernels require the lifting targets below. For intersections use a fine auxiliary level prime to Np, prove the identity there and descend by the projection formula, retaining stabilizers.

Its API consists of the following facts:

- The Hom group and endomorphism ring consist of actual commuting pairs of elliptic-scheme maps with the given degree fibres.
- Reduction is injective, and the intersection of all liftable special-fibre subgroups is the integral Hom group.
- Every positive-degree fibre is finite, and its free sign action makes the half count integral.
- The automorphism action on a nonempty positive-degree fibre is faithful.
- A prime-to-p isogeny kernel extends uniquely through the nilpotent bases and gives the factorization used in the intersection count.

**Checks.**

- For N=1 this is the usual Hom of elliptic schemes, with f=f′.
- The zero map occurs only in degree 0; allowing m=0 invalidates the free-sign proof.
- At residue characteristic 2 the maps f and −f are still distinct for a nonzero elliptic isogeny, although −1=1 on the residue field.
- Two pairs with the same coarse moduli point can have different markings; the definition keeps the chosen diagram.
- For m=1 the fibre is the set of diagram isomorphisms, so the intersection formula uses its actual stabilizer order.
- An empty degree-m fibre has no faithful action of a nontrivial automorphism group; nonemptiness is essential.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), III §§1–2, pp. 255–256; §4 Proposition 4.4, p. 258; §6 Proposition 6.1, pp. 259–260.)

*Needs:* AbelianSchemesAndArithmeticModuli A1.2 for injectivity of Hom under nilpotent reduction, AbelianSchemesAndArithmeticModuli Layer A6 for degrees, TauCetiRoadmap.ModularCurves Layer 7F ST-1 for the deformations of elliptic curves and their p-divisible groups, ModularCurvesPartII §§3.4, 5.1 and 9.9 for the Γ₀(N) moduli problem and its isogeny correspondences.

### 7.4 Degenerate Schwartz classes

At a finite place v, write 𝔅_v=E_v⊕E_v𝔧_v and x=x₁+x₂ in these orthogonal summands, and let d_v generate the different of F_v/ℚ_p. Define S¹ as the space of Φ_v∈S(𝔅_v×F_v^×) with Φ_v(x,u)=0 whenever ord_v(uq(x))≥−ord_v(d_v) or ord_v(uq(x₂))≥−ord_v(d_v). Define S² as the space of Φ_v with (r(g)Φ_v)(0,u)=0 for every g∈GL₂(F_v) and u∈F_v^×. These are the support condition of Yuan–Zhang–Zhang's Assumption 5.3 and the orbit condition of their Assumption 5.4; the data (D) of the Conventions use S¹ at the nonsplit exceptional set S₁ and S² at the two split places S₂. Prove:

1. **Vanishing near E_v and near 0.** If Φ_v∈S¹, then Φ_v vanishes on E_v×F_v^× (there x₂=0), on {(x,u): ord_v(uq(x))≥−ord_v(d_v)}, and, when Φ_v is U_v×U_v-invariant for the Weil action of (D), on (U_vE_v^×U_v)×F_v^×.
2. **Terms on the line E.** Under (D), S² at a place of S₂ gives r(g)φ(0,u)=0 for every g∈GL₂(𝔸) and u∈F^×. Let K_(S₁)⊂GL₂(F_(S₁)) be an open compact subgroup fixing φ_(S₁) in the Weil representation, and g∈K_(S₁)GL₂(𝔸^(S₁)). Then every term of I(s,g,φ) and of its derivative at s=0 that is supported on the line E vanishes: the theta terms over y∈E, and the products of r(g)φ₁(x₁,u) with the constant term E₀(s,g,u,φ₂), for pure tensors φ_v=φ_(1,v)⊗φ_(2,v) along 𝔅_v=E_v⊕E_v𝔧_v (general φ are sums of these). At v∈S₁ one has φ_(1,v)(x₁,u)φ_(2,v)(0,u)=φ_v(x₁,u)=0 for x₁∈E_v, and W°_(0,v)(0,g,u)=r(g)φ_(2,v)(0,u) ([6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms)); since |S₁|≥2, every term of the product rule at s=0, including the term of [6.57 Derivative of the mixed theta–Eisenstein series before projection](#657-derivative-of-the-mixed-thetaeisenstein-series-before-projection) that carries c_(φ_v) at v∈S₁, keeps such a vanishing factor at another place of S₁.
3. **Existence.** For every (𝔅,σ,χ) as in (D) satisfying the local sign matching Σ(𝔅)=Σ(σ,χ), where Σ(σ,χ) is the set of places v with ε_BC(1/2,σ_v,K_v⊗χ_v)=−χ_v(−1), at which 4.2 makes the division algebra the distinguished one, there are data (D) whose normalized local toric contractions (4.6) are nonzero at every place, with the standard function and an unramified vector at almost every place. Section 8.1 uses this existence to pass from data (D) to all admissible data.

*Outline.* Items 1 and 2 are direct: S¹ contains both inequalities, and invariance moves the vanishing on E_v^× to U_vE_v^×U_v. For item 2, r(k)φ_v=φ_v for k∈K_v, so at g_v∈K_v the local factors are those of φ_v itself; item 1 gives the vanishing on E_v, and the product rule is applied with two distinct places of S₁. For item 3 assume Σ(𝔅)=Σ(σ,χ), so the local toric Hom spaces are nonzero by 4.2. At nonsplit places use the anisotropic complementary summand and unipotent differences to obtain a nonzero theta image in each infinite irreducible representation. At each auxiliary split place apply a Hecke operator minus its degree to the standard function; its Satake eigenvalue differs from the degree for the required infinite unitary representation, while its entire Weil orbit vanishes at zero. Use multiplicity one and factorization to select pure tensor data with nonzero normalized toric contraction. The zero function alone does not prove this nonvanishing. The reduction from general data to data (D) is the multiplicity-one argument of 8.1.

Its API consists of the following facts:

- The support-vanishing subspace S¹.
- The orbit-zero subspace S².
- Either of the two valuation inequalities forces Φ_v(x,u)=0.
- Φ_v vanishes on E_v×F_v^×, and on (U_vE_v^×U_v)×F_v^× when it is U_v×U_v-invariant.
- Every Weil translate evaluates to zero at (0,u).
- under Σ(𝔅)=Σ(σ,χ), data (D) with nonzero local toric contractions exist.

**Checks.**

- The zero function belongs to both subspaces.
- If the local sign at a place fails the matching condition of 4.2, its toric Hom space is zero. No choice of degenerate Schwartz data can give a nonzero contraction there; item 3 requires sign matching.
- Equality ord_v(uq(x₂))=−ord_v(d_v) already forces zero.
- Vanishing of Φ_v(0,u) alone is insufficient for S²: every r(g) translate must vanish there.
- A U_v×U_v-invariant function that is nonzero at some point of U_vE_v^×U_v×F_v^× is not in S¹, even if it vanishes near x=0.
- With S₁={v₀} only, the derivative of the product ∏_wW°_(0,w)(s,g,u) at s=0 keeps W°′_(0,v₀)(0,g,u)·∏_(w≠v₀)r(g)φ_(2,w)(0,u), which need not vanish; two places of S₁ are needed.
- Item 2 is stated for g∈K_(S₁)GL₂(𝔸^(S₁)): for g_v=w at v∈S₁, r(w)φ_v(·,u) is a Weil-index multiple of the Fourier transform of φ_v(·,u) and need not vanish on E_v.
- At a nonsplit place outside S₁ the standard function has u-support d_v^(-1)O_(F_v)^×. Such a place is unramified over ℚ, because S₁ contains the nonsplit places ramified over ℚ, so the u-support is O_(F_v)^×, as the good places of 7.25 require.

*Consequences.* Under (D), φ vanishes on E×𝔸^×, so every theta term supported on the line E, and every self-intersection of a CM point with itself, drops out of the comparison of 7.47 and 8.1. The global reduction assumes Σ(𝔅)=Σ(σ,χ) and uses the nonzero toric contraction of item 3 and the level conditions of (D), not membership in a degenerate subspace alone.

(Yuan–Zhang–Zhang's assumptions on the Schwartz function, Assumptions 5.2–5.6, their existence result, Proposition 5.8, and the equivalent form of Assumption 5.4, Lemma 5.10, are restated by [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), §6, p. 50 (the sets S₁, S₂ and Assumptions 6.1.1–6.1.4) and p. 51 (Assumption 6.1.5 and Lemma 6.1.6); his Assumptions 6.1.1 and 6.1.5 are the forms adapted to his places above p. [Yuan–Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Annals 187 (2018), p. 585 (Assumption 5.3 removes the constant-term derivative E′₀(0,g,u)), Assumption 7.1, p. 587 (= Assumption 5.4, with maximal U_v at S₂), p. 591 (Lφ₀−deg(L)φ₀ satisfies S² for a compactly supported U_v-bi-invariant Hecke function L; for φ₀=1_(O_(𝔅_v)^××O_(F_v)^×) and L the norm-valuation-two Hecke function its degree is 1+N_v+N_v²), and p. 608 (Assumption 5.3 removes all self-intersections). [Yuan, Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §1.5, pp. 7–8, with footnote 7 (Assumptions 5.3 and 5.4 are the strongest, and Theorem 5.7 shows they lose no generality). The book is [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), §5.2.)

*Needs:* MetaplecticAutomorphicForms §5.9, [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms), [6.57 Derivative of the mixed theta–Eisenstein series before projection](#657-derivative-of-the-mixed-thetaeisenstein-series-before-projection).

### 7.5 Nearby coherent kernel orthogonality

Let (𝔅,σ,χ) be as in (D) with Σ(𝔅)=Σ(σ,χ), the distinction set of 4.2 in the base-change convention of 0.7. Let v be a finite place nonsplit in E, and B(v) the coherent quaternion algebra over F with B(v)_w≅𝔅_w for w≠v and the opposite Hasse invariant at v; E embeds in B(v). For Φ∈S(B(v)_𝔸×𝔸^×) invariant under an open compact subgroup, let I(0,g,χ,Φ) be the coherent kernel of 5.1: L(1,η)^(-1) times the double toric integral, against χ, of the theta series θ(g,(t₁,t₂),Φ) of B(v), whose quotient has volume 2L(1,η). Prove that (I(0,·,χ,Φ),f)_Pet=0 for every f∈σ. The function I(0,·,χ,Φ) itself need not vanish.

*Outline.* Unfold the Petersson pairing against f: it becomes the toric integral, against χ, of the Shimizu theta lift θ(f,Φ) of f to B(v)^××B(v)^× (5.1). If σ has no Jacquet–Langlands transfer to B(v), the lift is zero. Otherwise the lift lies in π(v)⊠π̃(v), and the toric integral is a T(𝔸)-invariant linear functional on π(v)⊗χ, tensored with one on π̃(v)⊗χ^(-1). Such a functional is a product of local invariant functionals (4.1). At w=v the local space Hom_(E_v^×)(π(v)_v⊗χ_v,ℂ) is zero by the Saito–Tunnell dichotomy (4.2), because Σ(B(v))=Σ(𝔅)△{v}≠Σ(σ,χ). Equivalently, Waldspurger's formula (5.3) writes the squared period as a product of local forms α_w, and α_v=0.

**Checks.**

- If Σ(B(v)) were equal to Σ(σ,χ), the local space at v would be one-dimensional and the argument would give nothing; the change of Hasse invariant at v is what forces the vanishing.
- A nonzero coherent kernel is allowed: only its σ-component vanishes, so a comparison that removes these terms is an identity of σ-components, not of functions.
- At a place v split in E there is no nearby algebra B(v) with E↪B(v), because both algebras would have to be split at v; split places never contribute coherent kernels.

*Consequences.* A nonzero coherent kernel with the wrong local sign is allowed; only its σ-component is zero. In 7.47 this removes the bad-place terms after projection.

(Yuan–Zhang–Zhang, §7.4.3, as used by [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), proof of Theorem 5.4.2 after Theorem 8.3.2, p. 58: the S₁-terms vanish by the local theorem of Tunnell and Saito together with Waldspurger's formula. The book is [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), §7.4.3, as identified by Disegni.)

*Needs:* [4.1 Local toric functional space](#41-local-toric-functional-space), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), MetaplecticAutomorphicForms §6.15.

### 7.6 Integral order sandwich

Use the chosen O_(B_v) ⊇ O_(E_v) and original integral 𝔧_v of test-function, with no common finite ramification. If D_v is the relative discriminant ideal of E_v/F_v, then D_v O_(B_v) ⊂ O_(E_v) + O_(E_v)𝔧_v ⊂ O_(B_v), with equality on the right iff E_v/F_v is unramified (including split E_v).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* When B_v is split, identify the chosen maximal order with End_(O_F)(O_E) using a primitive O_E-generator. Compare the trace-form discriminants of the maximal order and O_E + O_E𝔧_v and compute the dual lattice to obtain D_v O_(B_v) ⊂ O_E + O_E𝔧_v. The index is trivial precisely for unramified E_v/F_v. When B_v is division, E_v/F_v is unramified by the no-common-ramification hypothesis, and O_(B_v) = O_(E_v) + O_(E_v)𝔧_v directly. Do not apply the split maximal-order discriminant-one calculation to this branch.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma7.3 p592.)

*Needs:* [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.7 Inert norm-shell cutoff

If Ev/Fv is unramified quadratic and a lies in the opposite nearby norm class, Dn(a)=Dn for n≤v(a dv), and Dn(a)=∅ for n>v(a dv).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use opposite parity of the valuations of represented norms.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.5(1), p. 594; proof p. 595.)

*Needs:* [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.8 Ramified norm-shell volume

For ramified Ev/Fv, Dn(a)=Dn for n≤v(a dv), is empty for n>v(a dv)+v(Dv)−1, and for v(a dv)<n≤v(a dv)+v(Dv)−1 has volume |Dv|^1/2 |dv| |a| q^(v(a dv)−n).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the conductor of the local quadratic norm subgroup and index-two unit cosets, including wild/dyadic conductor.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.5(2), p. 594; proof p. 595.)

*Needs:* [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.9 Archimedean zero-term correction

For standard archimedean φ and all g,y,u, cφv(g,y,u)=0.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Evaluate normalized W0(s) as δ(g)^−s r(g)φ(0,u); derivative cancels the logδ term.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.6(1), p. 599 (via [YZZ13, Prop. 2.11]).)

*Needs:* [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.10 Finite zero-term correction

For v non-archimedean, (y,u) ∈ E_v×F_v^× and φ as in (Q′) (Yuan–Zhang §7.2). If v ∉ S2: c_(φ_v)(1,y,u) = φ_v(y,u)·log|d_vq(𝔧_v)| plus φ_v(y,u)·2(|d_vq(𝔧_v)|−1)log N_v/((1+N_v^(−1))(1−N_v)) if E_v/F_v is inert; plus φ_v(y,u)·(|d_vq(𝔧_v)|−1)log N_v/(1−N_v) + α_v(y,u) if ramified; plus 0 if split. If v ∈ S2: c_(φ_v)(1,y,u) = −(2 log N_v/(1+N_v+N_v²))·1_(ϖ_v^(−1)(O_(B_v))_2)(y)·1_(O_(F_v)^×)(u), i.e. 2 log N_v·(φ_v(y,u) − 1_(O_(B_v)^××O_(F_v)^×)(y,u)); on E_v the set ϖ_v^(−1)(O_(B_v))_2 is {y ∈ ϖ_v^(−1)O_(E_v) : q(y) ∈ O_(F_v)^×}. Here α_v is as in Yuan–Zhang Lemma 7.4.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the a=0 Whittaker normalization of Yuan–Zhang Lemma 7.6(2); compute inert/ramified geometric series and the split norm-product volumes; verify both S2 summands separately.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.6(2), p. 599; proof pp. 599–604.)

*Needs:* [6.7 Normalized local Whittaker terms](#67-normalized-local-whittaker-terms), [6.22 Norm congruence shells and ramified correction](#622-norm-congruence-shells-and-ramified-correction), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.11 Regularized archimedean multiplicity

For distinct CM lifts use ms(γ)=Qs(1−2λγ), with Qs(t)=∫0∞(t+sqrt(t²−1)cosh u)^−1−s du. Define extended diagonal Green sums by excluding E* and taking the constant Laurent coefficient at s=0. The finite-part Green function is weakly admissible, with L_U-mean −1 and a simple-pole residue 1/κ_U° on the same connected component, zero on other components; here κ_U° is the degree of the Hodge bundle L_U on one geometric connected component of X_U, the same on every component, so ξ̂ = L_U/κ_U° has degree one on each (Yuan, Modular heights, §4.1 and Lemma 4.2, yuan-modular line 2166 and yuan-modular line 2583). Full admissibility requires the mean correction of Layer 2. The horizontal Green value is not by itself the fully admissible local pairing of positive-degree divisors.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the genuine resolvent meromorphic continuation, form the off-E nearby-quaternion sum and retain its residue as well as its Laurent constant. Compare the constant with the horizontal Green term and compute its Hodge-line mean. Apply the separate mean correction when a fully admissible pairing is required.

Its API consists of the following facts:

- Take the Laurent constant at s=0 of the E×-omitted nearby-quaternion Green sum.
- For distinct points this is the horizontal Green contribution from the chosen weakly admissible extension; the positive-degree admissible local pairing additionally includes its Hodge-mean correction.
- The extended diagonal omits E× multipliers.
- The finite part discards the simple-pole term, not the whole Laurent germ.
- The L_U-mean is −1, while the residue is 1/κ_U° on the component of the fixed point.

**Checks.**

- The resolvent finite part has L_U-mean −1, hence mean −1/κ_U° against ξ̂=L_U/κ_U° on the component of the fixed point; declaring its mean zero before the correction of 2.9 drops this constant from positive-degree pairings.
- At s=0, Q₀(t)=½log((t+1)/(t−1)) for t>1.
- Including an E× multiplier on the diagonal introduces the undefined singular term.
- For a/s+b+O(s), the regularized value is b.
- Multiplying a Laurent germ a/s+b+O(s) by 1+cs+O(s²) changes its finite part to b+ca; a factor tending to one cannot be discarded when a≠0.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, pp. 609–610; [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.3, Lemma 4.2, pp. 63–66.)

*Needs:* AutomorphicSpectralTheory §§2.19–2.25, HilbertModularVarietiesAndShimuraCurves R18.5.15, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.12 Finite local multiplicities and diagonal omission

(i) Let v be finite and nonsplit in E, and B = B(v). The multiplicity function m is defined on 𝔥_(U_v) = B_v^× ×_(E_v^×) 𝔹_v^×/U_v away from the image of (1,1), with m(b^(-1),β^(-1)) = m(b,β). For distinct [β1]_U ∈ CM_U and [t2]_U ∈ C_U, ī_v(β1,t2) = Σ_(γ∈μ_U\B^×) m(γt_(2v), β_(1v)^(-1)) 1_(U^v)((β_1^v)^(-1)γt_2^v) ([YZZ13, Lemma 8.2]). For all pairs, ī_v is defined by the same sum over γ ∈ μ_U⧵(B^× − E^×∩β1Ut2^(-1)), equivalently over (B^×−E^×) ∪ (E^× − β1U_vt2^(-1)). For (y,u) ∈ (B_v−E_v)×F_v^×, m_(φ_v)(y,u) = Σ_(x∈𝔹_v^×/U_v) m(y,x^(-1)) φ_v(x, uq(y)/q(x)). For (y,u) ∈ E_v^××F_v^×, n_(φ_v)(y,u) = Σ_(x∈(𝔹_v^×−yU_v)/U_v) m(y,x^(-1)) φ_v(x, uq(y)/q(x)). (ii) Let v be split in E, with ν1, ν2 above v and E_v diagonal in 𝔹_v ≅ M2(F_v). The function m_ν̄1 on GL2(F_v)/U_v is supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_(𝔹_v))^×, m_ν̄1(n(b)) = 1/(N_v^(r−v(b)−1)(N_v−1)) when v(b) ≤ r−1. The function m_ν̄2 is the same with lower unipotents N^t, and m_v̄ = ½(m_ν̄1+m_ν̄2). The extended pairing is ī_ν(β1,t2) = Σ_(γ∈μ_U⧵(E^×−β1U_vt2^(-1))) m_ν̄(t2^(-1)γ^(-1)β1) 1_(U^v)(β1^(-1)γt2), and ī_v(t,t) = 0. Finally n_(φ_v)(y,u) = ½Σ_(x∈(N(F_v)U_v−U_v)/U_v) φ_v(yx,u) m_ν̄1(x) + ½Σ_(x∈(N^t(F_v)U_v−U_v)/U_v) φ_v(yx,u) m_ν̄2(x).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Import CM deformation and ordinary/superspecial uniformization multiplicities. Omit exactly the undefined diagonal orbit before forming the extended sum. Change Hecke coset variables to form mφ and nφ; average the two split-prime ordinary functions.

Its API consists of the following facts:

- The geometric multiplicity m away from the diagonal orbit and its mφ,nφ sums.
- For an extended pairing omit precisely the undefined E×∩β₁Ut₂⁻¹ summands.
- m(b⁻¹,β⁻¹)=m(b,β).
- At an E-split place use ½(mν₁+mν₂), upper and lower unipotents.

**Checks.**

- For r=1,v(b)=0 the upper-unipotent multiplicity is 1/(N_v−1).
- The extended ordinary diagonal is zero.
- Repeating mν₂ twice misses an upper-unipotent contribution; the two prime contributions must be averaged.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2 pp611–616.)

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.5.15, [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.13 Superspecial multiplicity by uniformization

For B-division and E-inert v, m(γ,β) vanishes unless qγ qβ is a unit and γ∈Ev*(1+OE,v πv jv); in that support m(γ,β)=v(λγ)/2.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Import the formal upper-half-plane uniformization, then construct the two O_E-fixed sections explicitly in its vertex P¹ chart: their reductions are the two nonrational O_E-eigenlines. In that chart write γ=a+bj and solve equality of the two section coordinates modulo π_E^n. The largest such n gives the intersection length. The unit condition and γ∈E_v×(1+O_Eπ_vj_v) are exactly the support of this calculation; conjugate the coordinates to check independence of the chosen vertex chart. This CM fixed-section calculation is owned here, while R18.5 supplies the formal model.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.8 pp619–621.)

*Needs:* HilbertModularVarietiesAndShimuraCurves Layer R18.5, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j), HilbertModularVarietiesAndShimuraCurves R18.5.15.

### 7.14 Vertical correction vanishes at B-split places

At a finite B-split place in the maximal-level setup, jv(Z*t1,t2)=0.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use a smooth auxiliary-level cover with disjoint irreducible fiber components and descend their underlying component decomposition to the quotient.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.3 p621.)

*Needs:* HilbertModularVarietiesAndShimuraCurves Layer R18.5, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.15 Nonzero associated weight-one theta

Fix (F,E,𝔹,U,φ), as in (Q′) (Yuan–Zhang §7.2). The weight-one theta series θ_(Ω,1)(g) = Σ_(u∈μ_U²\F^×) Σ_(y∈E) r_E(g)φ(y,u), which is the outer theta series of Ω_φ, is not identically zero. Take g_v = [[0,1],[−1,0]] at v ∈ Σ_f ∪ S2 and g_v = 1 elsewhere. Every term r_E(g)φ(0,u) is ε times a nonnegative number, with ε = Π_(v∈Σ_f)λ(E_v/F_v,ψ_v) ∈ {±1}, and |r_E(g)φ(0,1)| > 0. At v ∈ S2, ∫_(E_v)φ_v(y,1)dy = (1−N_v^(-1))²(1 − 3/(1+N_v+N_v²)) > 0. So the finite sum over u ∈ O_F^(×,+)/μ_U² is nonzero.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the Weil action of E itself, rather than the ambient quaternion algebra, at the specified g. Inert division places contribute their Weil index λ(E_v/F_v,ψ_v), which is independent of u on the allowed support. Their product is the common sign ε. Every constant-term summand is ε times a nonnegative quantity. At S2 the integral is (1−N_v^(-1))²(1−3/(1+N_v+N_v²)) > 0, and the remaining factors at u = 1 have nonzero absolute value. Therefore |r_E(g)φ(0,1)| > 0; the finite sum over O_F^(×,+)/μ_U² has sign ε and cannot vanish. Positivity of the signed constant term is not required.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1, p. 628.)

*Needs:* [6.21 Special test function and integral j](#621-special-test-function-and-integral-j), MetaplecticAutomorphicForms Layer 5.

### 7.16 Archimedean derivative kernel

At a real place use B(v)_v=E_v+E_v j, y=y₁+y₂ of positive norm outside E×, and λ=q(y₂)/q(y)<0. Define k_(v,s)(y)=Γ(s+1)/(2(4π)^s)∫₁^∞dt/[t(1−λt)^(s+1)], and K_φ^(v) as the Laurent finite part of its μ_U⧵(B(v)×_+−E×) sum, weighted by the a-th Whittaker coefficients and w_U∑_(a∈F×). The projected derivative is twice its normalized diagonal C_U average. To compare with the Green sum retain A(s)=Γ(2s+2)/((4π)^sΓ(s+2)). The underlying integral is 2Γ(2s+2)/(Γ(s+1)Γ(s+2))Q_s(1−2λ)+O_s(|λ|^(−s−2)), with error vanishing at s=0. Since A(0)=1 but A′(0)=1−γ−log(4π), multiplying a Green sum with a pole changes its finite part. Before auxiliary degeneracy, K_φ^(v)−M_φ^(v)=½(γ+log(4π)−1)E*(0,g,r(t₁,t₂)φ). The two auxiliary split-place conditions kill this correction; they are used when identifying the two regularized kernels.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the archimedean Whittaker projection and the Γ-normalized integral for λ<0. Sum with the stated positive-norm/off-E restriction, take the source finite part, and apply the normalized CM orbit average.

Its API consists of the following facts:

- The Γ-normalized integral k_v,s for λ<0 and its nearby-quaternion sum.
- λ(y)<0 for the positive-norm off-E inputs.
- The projected v-derivative is twice the normalized C_U diagonal average.
- For λ<0, k_v,0=½log((1−λ)/(−λ)).
- Before auxiliary degeneracy, K^(v)−M^(v)=½(γ+log(4π)−1)E*(0,g,r(t₁,t₂)φ). The extra term vanishes under the two auxiliary split-place conditions.

**Checks.**

- For λ=−1, k_v,0=½log2.
- As λ→0⁻ the value diverges, so λ=0 is not an ordinary kernel input.
- Omitting the prefactor 1/2 doubles k_v,0.
- For a Green sum with residue a, the factor A(s)=Γ(2s+2)/((4π)^sΓ(s+2)) changes the finite part by (1−γ−log(4π))a; setting A(0)=1 before regularization gives the wrong answer.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, Theorem 7.2(1), p. 588; [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.5, Proposition 4.5 and Remark 4.6, pp. 70–71; Yuan–Zhang–Zhang author erratum, 28 June 2026, items 62–63.)

*Needs:* AutomorphicSpectralTheory §§2.19–2.25, [6.8 Finite CM orbit average](#68-finite-cm-orbit-average), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.17 Marked Green height characterization

Fix x₀ ≠ y₀ in S and put G(x, y) = ⟨(x) − (x₀), (y) − (y₀)⟩ (x ≠ y₀, y ≠ x₀, x ≠ y). Prove that ⟨a, b⟩ = Σ_(i,j) n_i m_j G(x_i, y_j) for a = Σ n_i(x_i), b = Σ m_j(y_j) (at least if y₀ ∉ |a|, x₀ ∉ |b|). Conversely any G such that for fixed x the function y ↦ G(x, y) is continuous and harmonic on S ∖ {x, x₀} with logarithmic singularities of residue +1 at y = x and −1 at y = x₀ (g − C log|ρ|² continuous near the point, ρ a local parameter), and symmetrically in x, defines by (2.2) a symbol satisfying (2.1); G is determined up to an additive constant, fixed e.g. by G(x₀, y) = 0 for one y. For S = X₀(N)(ℂ), N > 1, x₀ = ∞, y₀ = 0 this means a function G on 𝔥 × 𝔥 with (2.3a) G(γz, γ′z′) = G(z, z′) for γ, γ′ ∈ Γ₀(N); (b) G continuous and harmonic for z ∉ Γ₀(N)z′; (c) G = e_z log|z − z′|² + O(1) as z′ → z, e_z the order of the stabilizer of z in Γ₀(N); (d) G = 4πy′ + O(1) as z′ = x′ + iy′ → ∞ and O(1) as z′ → any other cusp; G = 4πy/(N|z|²) + O(1) as z → 0 and O(1) as z → any other cusp (local parameters (z′ − z)^(e_z)(1 + O(z′ − z)), e^(2πiz), e^(−2πi/Nz)).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct. No genus condition is imposed: the symbol of 2.11 is defined on X₀(N)(ℂ) for every N, including the genus-zero levels such as N=2.

*Outline.* Apply the principal-divisor law to c=(z)−∞ and d=(z′)−0. The difference of two candidate kernels is a smooth harmonic function on the compact curve, hence constant; the marked cusp normalization fixes it.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.2), (2.3), p. 237.)

*Needs:* [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 7.18 CM Eisenstein sum

In the marked classical CM setting, let E(z, s) = Σ_(γ ∈ Γ_∞\SL₂(ℤ)) Im(γz)^s be the weight-0 Eisenstein series of SL₂(ℤ) (Γ_∞ = ±(1 *; 0 1); this normalization is the one forced by κ_N in (2.13) and by the identity 2^s ζ(2s) E(τ_A, s) = u|D|^(s/2) ζ_K(A, s) used on pp. 248, 252), E_N(z, s) the Eisenstein series (2.14) of Γ₀(N) at ∞, w_N z = −1/(Nz), Re s > 1. Prove that Σ_(A∈Cl_K) E_N(w_N τ_(A,𝔫), s) = Σ_(A∈Cl_K) E_N(τ_(A,𝔫), s) = N^(−s) Π_(p|N)(1 − p^(−2s))^(−1) Σ_(d|N) (μ(d)/d^s) Σ_(A∈Cl_K) E((N/d) τ_(A,𝔫), s). For each d | N the points (N/d)τ_(A,𝔫) again satisfy quadratic equations over ℤ of discriminant D, and the inner sum is independent of d and equals Σ_(A) E(τ_A, s), where τ_A ∈ 𝔥 is any root of a primitive form of discriminant D in the class A. Hence Σ_A E_N(τ_(A,𝔫), s) = N^(−s) Π_(p|N)(1 + p^(−s))^(−1) Σ_A E(τ_A, s) (the combination used in the display at the top of p. 249).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Unfold the CM point evaluation of the Eisenstein series. Regroup primitive lattice vectors by integral ideals and extract the quadratic zeta and gamma factors.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §4, (4.1) and the paragraph after it, p. 248.)

*Needs:* AutomorphicSpectralTheory §§2.19–2.25, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant).

### 7.19 Tangent-normalized CM height symbol

Fix X, a curve over the number field H, v a place of H, and a, b divisors of degree 0 on X whose supports meet exactly in the point x. Let g be a uniformizing parameter at x (a function on X with ord_x(g) = 1). Define ⟨a, b⟩_v := lim_(y→x) {⟨a_y, b⟩_v − ord_x(a) ord_x(b) log|g(y)|_v}, where a_y=a−ord_x(a)(x)+ord_x(a)(y), with y approaching x through points outside supp(b), and ⟨·,·⟩_v on the right is the disjoint-support symbol of [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves) at a finite place and of [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol) at a complex place. The limit exists by the logarithmic-singularity laws of 2.5 and 2.11 (Gross–Zagier, II §5, equation (5.1), p. 250). This target extends those disjoint-support symbols to the specified CM common-support situation; its tangent regularization and parameter-change law are proved here.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Construct the extension to common support directly: in a local parameter z at a common point, replace a rational function f=z^m u(z) by its leading coefficient u(0) and evaluate the chosen nonzero tangent on z. Changing z to az+O(z²) multiplies the regularized value by a^(−m); this is the tangent factor in the symbol below. Apply this to both divisors, and prove independence using the local principal-divisor law. The symbols of 2.5 and 2.11 are used only away from common support.  Use that extension at the common CM point with multiplicity r_A(m). Subtract that multiplicity times log|g|_v; changing g modifies only the displayed scalar term.

Its API consists of the following facts:

- Apply the constructed common-support symbol to c=(x)−∞ and T_m d^σ using the eta-normalized tangent; subtraction coefficient r_A(m).
- For r_A(m)=0 it is the ordinary Néron symbol.
- Replacing g by g′ adds r_A(m)log|(g/g′)(x)|_v.
- Its sum over v equals the global class pairing for one global tangent choice.

**Checks.**

- If x occurs twice in T_mx^σ subtract 2log|g|, not log|g|.
- Multiplication of the tangent by μ₆ changes no local value.
- A scalar α with |α|_v≠1 changes the individual place, although the global sum is unchanged.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.1), pp. 249–250; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter I, §9, p. 232; constructed in Chapter II, §5, pp. 249–252 and Chapter III, §8, pp. 262–264; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.3), p. 250.)

*Needs:* [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves), [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), [6.28 CM Hecke disjointness criterion](#628-cm-hecke-disjointness-criterion).

### 7.20 Eta-normalized CM tangent

ω := η⁴(z) dq/q = 2πi η⁴(z) dz (5.4). It is well defined on X₀(N) only up to a 6th root of unity (η⁴ has a multiplier of order 6), which by (5.2) does not affect the sum of the local symbols. If x is not an elliptic point of X₀(N) (u = 1), ω is non-zero at x, the tangent vector ∂/∂t is taken dual to ω, and the uniformizing parameter g satisfies ω = (g + a₂g² + a₃g³ + …) dg/g near x. In general ω has order 1/u − 1 at x and g is normalized so that ω = (1/u)(g^(1/u) + higher degree terms) dg/g near x, i.e. ω = d(g^(1/u))·(1 + …) [the printed display omits the factor 1/u].

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use Δ(dq/q)^⊗6, rather than assert that η⁴dq/q descends as a differential on the coarse curve. In the orbifold parameter g=c^u(w−z)^u(1+o(1)), differentiate to obtain the necessary factor 1/u; sixth powers remove the branch ambiguity.

Its API consists of the following facts:

- The CM tangent class obtained from Δ(q)(dq/q)^⊗6, with g=(2πiη⁴(z)(w−z))^u(1+o(1)).
- ω=(1/u)(g^(1/u)+higher terms)dg/g.
- For u=1 the tangent is dual to ω.
- The only branch ambiguity is multiplication by μ₆, invisible to local heights.

**Checks.**

- For u=1, dg at x equals ω.
- For D=−3, u=3, omission of 1/3 in the orbifold formula introduces a spurious 3log|3|_v.
- The sixth tensor power is defined over the ground field even when a branch of η⁴ is not.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.4) and the two paragraphs after it, p. 250.)

*Needs:* [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 7.21 Supersingular Eichler realization

In the marked classical CM setting with the Chapter III local data (L). Let p be inert in K and p ∤ N (in the paper's illustration p ∤ ND, m = 1). The endomorphism ring R = End_(W/π)(x mod π) of the (supersingular) reduction of the Heegner diagram is an Eichler order of index (level) N in the definite quaternion algebra B over ℚ of discriminant p (ramified exactly at p and ∞), and Hom_(W/π)(x^σ, x) is isomorphic to the left R-module R𝔞 (𝔞 an ideal in the class A). The points x and x^σ meet mod π if and only if R𝔞 is principal; then Card(Isom_(W/π)(x^σ, x)) is the number of generators of R𝔞.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Apply the supersingular reduction theorem for a chosen cyclic-isogeny diagram. Its endomorphism order has level N in the definite quaternion algebra ramified at p and ∞.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253.)

*Needs:* [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), ComplexMultiplicationAndExplicitReciprocity §5.2 (`supersingularLevelOrderComparison`).

### 7.22 CM level reduction component

In the marked classical CM setting with the Chapter III local data (L). Suppose p | N (so p = 𝔭𝔭̄ splits and v divides exactly one of 𝔫, 𝔫̄, where O/𝔫 ≅ ℤ/Nℤ is the annihilator of ker φ). The reductions of both CM sections are ordinary; their component is 𝓕_(0,n) if v | 𝔫̄, and 𝓕_(n,0) if v | 𝔫 (n = ord_p N).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Use the Deligne–Rapoport reduction and the ordinary CM level isogeny to identify the fibre component. Compare the two cusp sections and the Hecke action on the same component.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, (3.1) Proposition, p. 256.)

*Needs:* [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 7.23 Half Hom count

For sections y, x over W as in (2.1) Hom_S(y, x) between Γ₀(N)-diagrams, its degree: h_n(y, x)_(deg m) := ½ Card Hom_(W/πⁿ)(y, x)_(deg m).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Fix actual integral cyclic-isogeny diagrams before taking Hom. The sign involution on nonzero degree-m maps is free; its orbits define the half count.

Its API consists of the following facts:

- h_n(y,x)_m=(1/2)#Hom_(W/πⁿ)(y,x)_m for chosen integral cyclic-isogeny diagrams.
- For m>0 it counts the free ±1 orbits.
- Degree-one elements are diagram isomorphisms.
- Reduction n+1→n injects the degree-m Hom sets; h_(n+1)≤h_n.

**Checks.**

- An empty Hom degree fibre gives zero.
- If the only degree-one maps are ±f then h_n=1.
- With six isomorphisms the half count is 3; quotienting by all automorphisms instead gives 1 and changes the coarse intersection weight.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §4, last sentence before §5, p. 258.)

*Needs:* AbelianSchemesAndArithmeticModuli Layer A6, [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams).

### 7.25 Good-place arithmetic identity

A finite place v of F is *good* for the data (𝔅,U,φ) of 7.4 if v∉S₁∪S₂, F_v/ℚ_p is unramified (the different d_v is a unit), U_v=O_(𝔅_v)^× for a maximal order O_(𝔅_v)⊃O_(E_v), φ_v=1_(O_(𝔅_v)×O_(F_v)^×), and ψ_v has conductor O_(F_v). All but finitely many places are good. If v is good and nonsplit in E, then E_v/F_v is unramified and 𝔅_v≅M₂(F_v), so the nearby algebra B(v) is ramified at v. Write y=y₁+y₂ for B(v)_v=E_v⊕E_vj_v, where j_v∈B(v)_v is orthogonal to E_v with v(q(j_v))=1. Let k_(φ_v), c_(φ_v) be the local derivative functions of 6.50 and m_(φ_v), n_(φ_v) the local multiplicities of 7.12(i) at this maximal local level, with Haar measures normalized as in those targets. Prove the following.
1. Let v be good and nonsplit in E. For (y,u)∈(B(v)_v−E_v)×F_v^×, k_(φ_v)(1,y,u)=m_(φ_v)(y,u)·log N_v=φ_v(y₁,u)·1_(O_(E_v)j_v)(y₂)·½(v(q(y₂))+1)·log N_v.
2. Let v be good, split or nonsplit in E. For (y,u)∈E_v^×× F_v^×, c_(φ_v)(1,y,u)=0 and n_(φ_v)(y,u)=½v(q(y))φ_v(y,u). Hence d_(φ_v)(1,y,u):=2n_(φ_v)(y,u)log N_v−c_(φ_v)(1,y,u)+log|uq(y)|_vφ_v(y,u)=0, since φ_v(y,u)≠0 forces u to be a unit.
3. Let v be good and g∈GL₂(F_v), and put δ_v(n(b)diag(α,β)κ)=|α/β|_v^(1/2) for b∈F_v, α,β∈F_v^× and κ∈GL₂(O_(F_v)). If v is nonsplit in E, then k_(φ_v)(g,y,u)=m_(r(g)φ_v)(y,u)·log N_v on (B(v)_v−E_v)×F_v^×. For every good v, c_(φ_v)(g,y,u)=0 and d_(φ_v)(g,y,u):=2n_(r(g)φ_v)(y,u)log N_v−c_(φ_v)(g,y,u)+(2log δ_v(g)+log|uq(y)|_v)·r(g)φ_v(y,u)=0 on E_v^××F_v^×. At g=1 these are items 1 and 2. The closed valuation formulas of items 1 and 2 hold only at g=1: for g∈n(b)diag(α,β)GL₂(O_(F_v)) one has n_(r(g)φ_v)(y,u)=(½v(q(y))+v(α))·r(g)φ_v(y,u), and |u|_v=|αβ|_v on the support of r(g)φ_v. In d_(φ_v)(g,y,u) the extra 2v(α)log N_v from n is cancelled by 2log δ_v(g)+log|u|_v=log|α/β|_v+log|αβ|_v=2log|α|_v, while log|q(y)|_v cancels only the term v(q(y))log N_v; without 2log δ_v(g) the sum is −log|α/β|_v·r(g)φ_v(y,u), in general nonzero.
At an archimedean place with the standard Gaussian, the archimedean kernel and the archimedean Green term agree and c_(φ_v)=0 there; this is a separate statement, proved with the resolvent targets and 7.48. Consequently, at good and archimedean places the v-components of Pr I′ and 2Z̃ cancel identically, and the comparison is reduced to the finite set of places that are not good.

*Outline.* For 1, φ_v=φ_(1,v)⊗1_(O_(E_v)𝔧_v×O_(F_v)^×), where 𝔧_v is the original-algebra element of 𝔅_v orthogonal to E_v with q(𝔧_v) a unit. Write W° at a=uq(y₂) as (1−N_v^(−s))Σ_(n≥0)N_v^(n(1−s))∫_(D_n(a))φ_(2,v), where D_n(a)={x₂: uq(x₂)−a∈p_v^n}. For v(a)≥0, D_n(a)=D_n for n≤v(a) and is empty beyond; for v(a)<0 the sum is empty. Since v(a) is odd, summing gives W°(s)=(1+X/N_v)(1−X^(v(a)+1))/(1+X) with X=N_v^(−s). Its derivative at s=0 is (1+N_v^(−1))·½(v(a)+1)·log N_v. Multiplying by L(1,η_v)=(1+N_v^(−1))^(−1) and the unit volume of E_v¹ gives the stated value. The remainder term of the general computation is proportional to |d_vq(𝔧_v)|−1, which vanishes here. On the geometric side, sum the canonical-lifting multiplicity ½(v(λ)+1) of 7.2 over 𝔅_v^×/U_v in that general multiplicity definition. For 2, the constant-term derivative reduces to φ_v(y,u)log|d_vq(𝔧_v)|, plus a remainder proportional to |d_vq(𝔧_v)|−1; both vanish. The split-place multiplicity sums to ½(v(a)+v(d))=½v(q(y)) for y=diag(a,d). For 3, every term is right GL₂(O_(F_v))-invariant: at a good place φ_v is fixed by GL₂(O_(F_v)) in the Weil representation, and δ_v is right GL₂(O_(F_v))-invariant. On the four-dimensional space the Weil action of p=n(b)diag(α,β) is r(p)φ(x,u)=ψ_v(buq(x))|α/β|_vφ(αx,(αβ)^(-1)u). The cosets x↦αx of 𝔅_v^×/U_v and the relation m(y,αx^(-1))=m(αy,x^(-1)) for central α show that m_(r(p)φ_v)(y,u) and n_(r(p)φ_v)(y,u) are the values of m_(φ_v), n_(φ_v) at (αy,(αβ)^(-1)u) times the same factor ψ_v(buq(y))|α/β|_v. The derivative k_(φ_v)(p,y,u) obeys the same rule: the index a=uq(y₂) of y∈B(v)_v−E_v is not represented by the original line E_v𝔧_v, so W°_(a,v)(0,·,u)=0 and the factor δ_v(p)^(−s) produced by the left translation contributes nothing to the derivative at s=0. On E_v the shift y↦αy raises ½v(q(y)) by v(α), while 2log δ_v(p)=log|α/β|_v and |u|_v=|αβ|_v on the support; these three contributions cancel in d_(φ_v). At a good place W°_(0,v)(s,g,u)=δ_v(g)^(−s)r(g)φ_(2,v)(0,u): both sides have the same P(F_v)- and GL₂(O_(F_v))-behaviour, and they agree at g=1 for every s by the unramified evaluation of the intertwining integral (in the inert case the s-dependent remainder in the proof of Yuan–Zhang's Lemma 7.6(2) is proportional to |d_vq(𝔧_v)|−|d_vq(𝔧_v)|^s, which is 0 at a good place). For y∈E_v the j-component of y is 0, so r(g)φ_v(y,u)=r_E(g)φ_(1,v)(y,u)·r(g)φ_(2,v)(0,u) and the two terms of c_(φ_v)(g,y,u) cancel. The Iwasawa decomposition GL₂(F_v)=P(F_v)GL₂(O_(F_v)) then deduces item 3 from items 1 and 2.

**Checks.**

- If y₂ is a unit multiple of j_v, so v(q(y₂))=1, both sides equal φ_v(y₁,u)log N_v.
- If 𝔅_v is division (a place of S₁), the two principal parts are both ½v(q(y₂)), but the analytic remainder restricted to E_v×F_v^× is φ_v(y,u)log N_v/(N_v+1)≠0. The place is not good.
- If F_v/ℚ_p is ramified, the remainder (|d_v|−1)log N_v/((1+N_v^(−1))(1−N_v)) is nonzero even with E_v/F_v unramified and 𝔅_v split; such a v is excluded.
- At a good split place, y=diag(a,d) with a,d integral gives n_(φ_v)=½(v(a)+v(d)), cancelling log|uq(y)|_v=−(v(a)+v(d))log N_v.
- At a good split place take g=diag(ϖ_v,ϖ_v^(-1)), y=1 and u=1. Then r(g)φ_v=N_v^(−2)·1_(ϖ_v^(-1)M₂(O_(F_v))×O_(F_v)^×). Each unipotent sum of 7.12(ii) has N_v−1 nonzero cosets b∈(ϖ_v^(-1)O_(F_v)−O_(F_v))/O_(F_v) of weight 1/(N_v−1), so n_(r(g)φ_v)(1,1)=N_v^(−2), in agreement with (½v(q(1))+v(ϖ_v))N_v^(−2). The valuation expression ½v(q(1))r(g)φ_v(1,1) is 0 instead. With 2log δ_v(g)=−2log N_v, d_(φ_v)(g,1,1)=2N_v^(−2)log N_v−2N_v^(−2)log N_v=0; dropping the δ-term leaves 2N_v^(−2)log N_v≠0.
- At g=diag(1,c) with v(c)=1 the support of r(g)φ_v requires v(u)=1, so log|uq(y)|_v=−log N_v+log|q(y)|_v, and 2log δ_v(g)=log N_v cancels the extra −log N_v; the valuation part n_(r(g)φ_v)=½v(q(y))r(g)φ_v is unchanged.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Annals 187 (2018), §7.2, Lemma 7.3, pp. 590–592; Lemma 7.4(1) and the formula following it, pp. 592–594; Lemma 7.5(1), p. 594; Lemma 7.6(2), p. 599; Lemma 8.7 and its proof, pp. 617–619; §9.1, items (1)–(3), pp. 625–626, which identify the book's counterparts as [YZZ13] Propositions 8.1 and 8.8; the all-g function d_(φ_v)(g,y,u), with its term 2log δ(g), is defined on p. 626 (yuan-zhang line 4334), and δ_v on p. 580 (yuan-zhang line 1967). These Yuan–Zhang computations use only the local data at v listed above. The Weil action of the diagonal torus on S(V×F_v^×) is restated from [YZZ13, §2.1.3] by [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), §3.1, p. 27, disegni line 1297.)

*Needs:* [7.4 Degenerate Schwartz classes](#74-degenerate-schwartz-classes), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [6.24 Incoherent central derivative](#624-incoherent-central-derivative), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains), MetaplecticAutomorphicForms §5.9 (`extendedSchwartzWeil`) for the Weil action of P(F_v) and GL₂(O_(F_v)), `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, HilbertModularVarietiesAndShimuraCurves R18.5.15, TauCetiRoadmap.ModularCurves Layer 7F ST-1.

### 7.26 Inert logarithmic singularity and diagonal extension

For inert v with (Q′) data, kφv(1,y,u)−(1/2)φv(y1,u)1OEj(y2)(v(q(y2)/q(jv))+1)log q extends to a Schwartz function; its restriction to E is φv(y,u)(|dv qjv|−1)log q/((1+q^−1)(1−q)). The jv in the singular term is the original test-function j, not the nearby j.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Insert shell cutoff into normalized Whittaker derivative and evaluate finite geometric sums; verify source's nearby-line convention when implementing.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.4(1), pp. 592–593; proof pp. 596–597.)

*Needs:* [7.7 Inert norm-shell cutoff](#77-inert-norm-shell-cutoff), [7.6 Integral order sandwich](#76-integral-order-sandwich), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.27 Ramified logarithmic singularity and diagonal extension

For ramified v with (Q′) data, subtract (1/2)φv(y1,u)1OEj(y2)(v(qy2)+1)log q from kφv(1,y,u). It extends to Schwartz; on E its value is φv(y,u)[(|dv|−1)/(2(1−q))+(v(Dv)−1)/2]log q+αv(y,u)/2.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Split the shell series into n<v(dv), n≤v(a dv), and the conductor tail; keep α on Dv^−1OE−OE.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.4(2), p. 593; proof pp. 597–598.)

*Needs:* [7.8 Ramified norm-shell volume](#78-ramified-norm-shell-volume), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), [7.6 Integral order sandwich](#76-integral-order-sandwich), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.28 Diagonal coefficient and modified self-intersection

Set Ωφ=Σu∈μU²\F* Σy∈E* r(g,(t1,t2))φ(y,u). The coefficient of t2 in Z*t1 is Ωφ/e, e=[E*∩U:μU]=[OE*:OF*] at maximal level. Define i0(t,t)=i(t,t)−Σv iv(t,t)logNv, where iv is the extended local diagonal pairing, not the actual global self-intersection.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Count the double cosets contributing the CM point t₂ and divide by [E×∩U:μU]. Subtract that diagonal coefficient to isolate proper intersection; use the extended local symbols for their own finite-part sum.

Its API consists of the following facts:

- Ωφ and i₀=i−Σv i_v logN_v, with extended local diagonals.
- The coefficient of t₂ in Z*t₁ is Ωφ/e.
- Subtract Ωφt₂/e before taking the proper horizontal intersection.
- i_v is the normalized C_U average of the extended local pairing.

**Checks.**

- At an E-split finite place the extended local diagonal is zero.
- For e=2 the diagonal coefficient is Ωφ/2.
- The actual global arithmetic self-intersection i is not replaced by the sum of formal extended local diagonals.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_(C_U) ī_v(tt2,tt2)dt).)

*Needs:* [6.3 Special correspondence cycle](#63-special-correspondence-cycle), [6.8 Finite CM orbit average](#68-finite-cm-orbit-average), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [7.11 Regularized archimedean multiplicity](#711-regularized-archimedean-multiplicity), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.29 Nonsplit proper-height expression

For nonsplit finite v, ivbar(Z*t1,t2)proper=Mφ^(v)+Nφ^(v)−ivbar(t2,t2)Ωφ/e, with M from mφ and N from nφ, and the distinct torus-translation conventions of Proposition8.3.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Separate B(v)*−E* terms from E* off-diagonal terms in the multiplicity sum and regroup through Hecke cosets.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition8.3 pp611–612.)

*Needs:* [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.30 Ordinary multiplicity and local pairing

Fix v, split in E, with 𝔹_v ≅ M2(F_v), E_v the diagonal torus, and ν1 corresponding to the upper-left idempotent. For every open compact U and distinct CM points [β1]_U ∈ CM_U, [t2]_U ∈ C_U: ī_ν1(β1,t2) = Σ_(γ∈μ_U\E^×) m_ν̄1(t2^(-1)γ^(-1)β1) 1_(U^v)(β1^(-1)γt2). Here m_ν̄1 and m_ν̄2 are Zhang's ordinary multiplicities of 7.12(ii), with the support and values stated there; this target adds the pairing formula and its extension to all pairs. Extended to all pairs by summing over γ ∈ μ_U⧵(E^×−β1U_vt2^(-1)), the formula gives ī_ν1(t2,t2) = 0 for every [t2]_U ∈ C_U.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* At small level the only contributing global γ is unique modulo μ; pass to general level using projection and the factor [μU:μU'].

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, Lemma 8.4, pp. 613–614; ν2 version and m_v̄, i_v̄, pp. 614–615.)

*Needs:* [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.31 Superspecial local intersection

For B-division (hence E-inert) v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·v(qy2)/2.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the integral upper-half-plane multiplicity of Lemma8.8 and Bv*/Uv≃Z.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), third case pp617–619.)

*Needs:* [7.13 Superspecial multiplicity by uniformization](#713-superspecial-multiplicity-by-uniformization), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.32 Vertical correction is nonsingular pseudo-theta

Fix v, finite, nonsplit in 𝔹 and inert in E, with (U,φ) as in (Q′) (Yuan–Zhang §7.2; U_v = O_(𝔹_v)^×, φ_v = 1_(O_(𝔹_v)^×)⊗1_(O_(F_v)^×)), and B = B(v), so B_v ≅ M2(F_v). Fix a lift Ṽ = Σ_i a_iW̃_i to Ω̂⊗O_(F_v^ur) of the vertical divisor V_1. For t1,t2 ∈ C_U: j̄_v(Z_*(g,φ)t1,t2) = Σ_(u∈μ_U²\F^×) Σ_(γ∈B^×) r(g,(t1,t2))φ^v(γ,u) l^((t1,t2))_(r(g)φ_v)(γ,u), where l^((t1,t2))_(φ_v)(γ,u) = Σ_(x∈𝔹_v^×/U_v) φ_v(x, uq(t1^(-1)γt2)/q(x)) 1_(O^×)(q(x)/q(t1^(-1)γt2)) (γ^(-1)z0·Ṽ) = (γ^(-1)z0·Ṽ)·1_(O^×)(q(γ)q(t2)/q(t1))·1_(O^×)(u), and γ^(-1)z0·Ṽ = Σ_i a_i1_(α_iF_v^×GL2(O_(F_v)))(γ^(-1)). This kernel is supported on finitely many cosets of GL2(O_(F_v)) in B_v^× and on u ∈ O^×. It therefore extends by zero to a Schwartz function on B_v×F_v^×, so j̄_v and j_v = ∫_(C_U) j̄_v(Z_*(g)tt1,tt2)dt are finite sums of nonsingular pseudo-theta series on the full space B(v). Remark 8.10: the same holds for any U_v-invariant φ_v with φ_v(0,u) = 0.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the direct kernel in the second displayed formula on p. 623 with the fixed lift Ṽ. Its dependence on t1,t2 enters through q(t2)/q(t1); on φ_v = 1_(O_(𝔹_v)^×)⊗1_(O_F^×) the x-sum reduces to the unit-norm indicator times (γ^(-1)z0·Ṽ). No assertion that t2 fixes every component, and no equivariant-lift argument, is needed. Index the finitely many components of Ṽ by α_i F_v^×GL2(O_F). Their indicators give the direct component pairing on p. 624. Combined with the fixed norm valuation, each such support is a finite union of GL2(O_F)-cosets, hence compact and open away from singular matrices. Extend by zero to a Schwartz function and apply the finite C_U average.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.9,Remark8.10 pp622–624.)

*Needs:* [7.13 Superspecial multiplicity by uniformization](#713-superspecial-multiplicity-by-uniformization), [6.5 Pseudo-theta datum](#65-pseudo-theta-datum), [2.9 Admissible arithmetic extension](#29-admissible-arithmetic-extension), HilbertModularVarietiesAndShimuraCurves R18.5.15, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.33 Archimedean adjunction constant

With Petersson norm ||dz||=2 Im z and Q0(t)=(1/2)log((t+1)/(t−1)), the limit of m0(z0,z1)−log(2 Im z1/|z1−z0|) as z1→z0 is 0, so −log||1||w=iw(P,P)/e.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Algebraically rewrite as (1/2)log(1+|z1−z0|²/(4Imz0 Imz1))−(1/2)log(Imz1/Imz0); both limits vanish.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2 pp631–632.)

*Needs:* [7.11 Regularized archimedean multiplicity](#711-regularized-archimedean-multiplicity), [2.14 Residue-normalized adjunction line](#214-residue-normalized-adjunction-line), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.34 Extended local diagonal vanishes at small away-v level

For nonsplit finite v, with U'v sufficiently small and U'v normal in Uv away from v as in Yuan–Zhang §9.2, ivbar([1]U',[1]U')=0. For split v it is zero without shrinking.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Bound support in a compact local subgroup; in a totally definite nearby algebra global units modulo central μ are finite; shrink the away-v level to exclude the noncentral cosets.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2, Lemma 9.5, p. 634 (split case, p. 635).)

*Needs:* [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), HilbertModularVarietiesAndShimuraCurves R18.5.15, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.35 CM multiplicity at 𝔹-split, E-nonsplit places

Fix v, a finite place of F nonsplit in E and split in 𝔹, and B = B(v), so B_v is the division algebra. Let U_v = GL2(O_(F_v)). For c ≥ 0 write E_v^×h_cGL2(O_(F_v)) for the elements β whose lattice has multiplier ring O_(F_v) + ϖ_v^cO_(E_v). The multiplicity function m on B_v^× ×_(E_v^×) GL2(F_v)/GL2(O_(F_v)), defined away from the image of (1,1), satisfies m(b,β) ≠ 0 only if q(b)q(β) ∈ O_(F_v)^×. In that case, for β ∈ E_v^×h_cGL2(O_(F_v)) and λ(b) = q(b2)/q(b) (b = b1 + b2, b1 ∈ E_v, b2 ⊥ E_v): m(b,β) = ½(v(λ(b))+1) if c = 0 and E_v/F_v is unramified; m(b,β) = ½v(D_vλ(b)) if c = 0 and E_v/F_v is ramified (tame or wild); m(b,β) = N_v^(1−c)(N_v+1)^(-1) if c > 0 and E_v/F_v is unramified; m(b,β) = ½N_v^(−c) if c > 0 and E_v/F_v is ramified. Proof of the c = 0 ramified case: by Gross's theorem, End of the canonical lifting mod π_E^m is O_E + π_E^(m−1)O_(B_v), so 2m(b,β) = 1 + max_(a∈O_E)v(N(b1−a) + q(b2)). The quotient −q(b2)/N(t) is a non-norm, and 1+p^(v(D_v)) ⊂ N(E_v^×) while 1+p^(v(D_v)−1) is not, so the maximum is v(λ(b)) + v(D_v) − 1.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Import Gross’s lifting endomorphism filtration and the conductor-vs-norm coset classification. At conductor zero maximize the lifting length; the ramified norm conductor gives v(λ)+v(D)−1, including wild ramification. For positive conductor evaluate the local coset-volume factors; keep the unit-norm support and omitted diagonal.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.3, proof of Lemma 8.7, p. 618, whose multiplicity differs from Yuan–Zhang–Zhang, Lemma 8.6, and Zhang (2001), Lemma 5.5.2; the one stated here is Yuan–Zhang's.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.36 Hecke kernel action

For m ≥ 1, (m, N) = 1: T_m acts on constants by σ₁(m) = #{γ ∈ Γ\R_N : det γ = m}, on E_N(z′, s) by m^s σ_(1−2s)(m) = m^s Σ_(d|m) d^(1−2s), and G_(N,s)(z, z′)|_(z′) T_m = Σ_(γ ∈ R_N/{±1}, det γ = m) g_s(z, γz′). Since T_m((0)) = σ₁(m)(0), T_m((x′) − (0)) = Σ_(γ ∈ Γ\R_N, det γ = m) ((γx′) − (0)), hence ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = Σ_(γ ∈ Γ\R_N, det γ = m) G(z, γz′). Gross–Zagier justify this step by the statement that T_m maps each cusp to itself (p. 241), which fails for general N; the step uses only T_m((0)) = σ₁(m)(0) and T_m((∞)) = σ₁(m)(∞), which hold for every N.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Reindex determinant-m matrices as the usual prime-to-N Hecke cosets. Use invariance of the resolvent and the Eisenstein Hecke eigenvalue m^s σ_(1−2s)(m) in the initial half-plane Re(s)>1; only after continuation to s=1 does it specialize to m·σ_(−1)(m)=σ₁(m), the eigenvalue on constants.

**Checks.**

- For m=2 and s=2 the Eisenstein eigenvalue is 2²(1+2^(−3))=9/2, while σ₁(2)=3; an argument that uses σ₁(m) throughout Re(s)>1 is wrong there.
- The eigenvalue m^sσ_(1−2s)(m) is invariant under s↦1−s (substitute m/d for d), so it equals σ₁(m) at s=0 as well as at s=1. For m=2 the values are 2(1+2^(−1))=3 and 2⁰(1+2)=3; for real s, 2^s+2^(1−s)=3 forces 2^s∈{1,2}, so these are the only real points of agreement. The specialization this argument uses is the one at s=1.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, pp. 241–242.)

*Needs:* AutomorphicSpectralTheory §2.25, ModularCurvesPartII §§9.9–9.10 and 13.2–13.4.

### 7.37 Tangent product formula

In the setting of (5.1), the tangent-vector local symbol of [7.19 Tangent-normalized CM height symbol](#719-tangent-normalized-cm-height-symbol) for divisors with a common point: if g′ is another uniformizing parameter at x and g/g′ has the value α at x, then ⟨a, b⟩′_v = ⟨a, b⟩_v + ord_x(a) ord_x(b) log|α|_v. Consequently ⟨a, b⟩_v depends only on the non-zero tangent vector ∂/∂t at x determined by ∂g/∂t = 1, is unchanged if ∂/∂t is multiplied by a root of unity (|α|_v = 1 for all v), and — g being a single global function — Σ_v ⟨a, b⟩_v is independent of g and (product formula) equals the global height pairing of the classes of a and b (Gross–Zagier, II §5, equation (5.2), p. 250).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Sum the tangent change at all places of H. Apply the product formula to the single global scalar; do not assert that its individual local logs vanish.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.2) and the following paragraph, p. 250.)

*Needs:* [7.19 Tangent-normalized CM height symbol](#719-tangent-normalized-cm-height-symbol), Mathlib `NumberField.prod_abs_eq_one` (the product formula), [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves) and [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol) (compatibility of the local symbols with the global intersection), [2.12 Faltings–Hriljac comparison](#212-faltingshriljac-comparison) (the global height pairing of classes).

### 7.38 Complex tangent asymptotic

Fix v, a complex place of H (|·|_v = |·|² on ℂ), g the normalized uniformizer at x attached to ω = η⁴ dq/q by (5.4), as in [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent). Prove that log|g(y)|_v − u log|2πi η⁴(z)(w − z)|_v → 0 as y → x, where z, w ∈ 𝔥 map to x, y on X₀(N)(ℂ).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Expand the source local symbol in the uniformizer at the common CM point. Compare its leading term with g=(2πiη⁴(z)(w−z))^u; retain the stabilizer multiplicity u.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.5), p. 251.)

*Needs:* [7.19 Tangent-normalized CM height symbol](#719-tangent-normalized-cm-height-symbol), [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent), [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol).

### 7.40 Inert quaternionic order model

In the marked classical CM setting, let p be inert in K (p ∤ ND) and q a prime with pq ≡ −1 (mod D), i.e. −pq ≡ 1 (mod D) (printed: 'q ≡ −p (mod D)', which makes the lattice below an order only when p² ≡ 1 modulo every prime l | D; either condition gives (q/l) = (−p/l) for all l | D); then (q) = 𝔮𝔮̄ splits in K and B = K + Kj with jα = ᾱj (α ∈ K) and j² = −pq is the definite quaternion algebra of discriminant p. For some place v | p the order R = End_(W/π)(x mod π) is R = {α + βj ∈ B : α ∈ 𝔡⁻¹, β ∈ 𝔡⁻¹𝔮⁻¹𝔫, α − β integral at all primes dividing 𝔡}, 𝔡 = (√D) the different of K and 𝔫 the primitive ideal of norm N attached to x. For any nonzero fractional ideal 𝔞 in the class A, choose at each 𝔣|𝔡 a local generator a_𝔣 of 𝔞O_𝔣. Then Hom_(W/π)(x^σ, x) ≅ R𝔞 = {α + βj : α ∈ 𝔡⁻¹𝔞, β ∈ 𝔡⁻¹𝔮⁻¹𝔫𝔞̄, α/a_𝔣 − β/ā_𝔣 ∈ O_𝔣 for every 𝔣|𝔡}. If 𝔞 is prime to 𝔡 take a_𝔣=1 and recover α−β∈O_𝔣. With the printed q≡−p mod D, replace these by α−pβ for R and α/a_𝔣−pβ/ā_𝔣 for R𝔞. The generator and representative comparisons below apply to both conventions.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Choose q with pq≡−1 modulo D so that the ramified congruence lattice has integral reduced norms. Identify the lattice and its local completions with the CM reduction order; multiplication on the right conjugates the β coefficient. Localize R𝔞=R·a_𝔣 at 𝔣, then divide the two coefficients by a_𝔣 and ā_𝔣 respectively before testing the original congruence. Replacing a_𝔣 by a_𝔣u, u∈O_𝔣×, gives the same lattice because R contains O_K and hence R·u=R. For 𝔞′=t𝔞, t∈K×, right multiplication b↦bt gives R𝔞≅R𝔞′, compatible with every endomorphism filtration; N(bt)/N(t𝔞)=N(b)/N𝔞. Thus degree fibres and their Hom counts are representative-independent, including at primes of the different.

Its API consists of the following facts:

- The integral congruence lattice in (D,−pq), with pq≡−1 mod D, identified with the CM reduction order at a specified place.
- N(α+βj)=Nα+pqNβ is integral on the lattice.
- Reduced discriminant Np; locally Eichler away from p and maximal at p.
- Right multiplication by 𝔞 conjugates the β coefficient by 𝔞̄ and transports the local congruence using a_𝔣,ā_𝔣.
- Changing local generators preserves the lattice; changing 𝔞 to t𝔞 transports its degree fibres by b↦bt.

**Checks.**

- D=−7,p=3,N=2 permits q=23, since −69≡1 mod7.
- q=11 satisfies q≡−p mod7 but gives nonintegral norms in the printed α≡β lattice; use pq≡−1.
- Multiplication (α+βj)𝔞 yields α𝔞+β𝔞̄j, not β𝔞j.
- For D=−7,p=3,N=2,q=23, put δ=√−7 and 𝔞=(δ). At the different the candidate α=1,β=0 gives α/δ=1/δ of valuation −1, so 1∉Rδ. Keeping the untransported congruence would admit it.
- For 𝔞′=(2)𝔞, the norm ratio is N(2b)/N(2𝔞)=4N(b)/(4N𝔞)=N(b)/N𝔞. Taking 𝔞=O and b=1 gives degree 1 on both sides.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265; gz86 line 1584). The arbitrary-ideal congruence and representative comparison follow by the displayed right multiplication and localization.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.21 Supersingular Eichler realization](#721-supersingular-eichler-realization), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

### 7.41 CM component orthogonality

In the marked classical CM setting with the Chapter III local data (L). One of the divisors c = (x) − (∞) and d^σ = (x^σ) − (0) (printed 'd = (x^σ) − (0)') has zero intersection with every fibral component 𝓕_(a,b) of X ⊗ A_v: when p | N (so v divides exactly one of 𝔫, 𝔫̄), c does if v | 𝔫 and d^σ does if v | 𝔫̄; when p ∤ N the special fibre is irreducible and both do.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Use the component intersection matrix and its fibre kernel. The corrected divisor has zero pairing with the components; this is an intersection statement and does not require each CM section to be fixed by a torus action.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, (3.2) Corollary and proof, pp. 256–257.)

*Needs:* [7.22 CM level reduction component](#722-cm-level-reduction-component), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves).

### 7.43 Diagram isomorphism intersection count

In the finite CM intersection setting, let x and y be W-sections of X which intersect properly (no common component) and reduce to regular, non-cuspidal points of the special fibre. Prove that (y·x) = Σ_(n≥1) h_n(y,x)_(deg 1) = Σ_(n≥1) ½·#Hom_(W/π^n)(y,x)_(deg 1). This is a general fact, independent of y and x being Heegner points.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Apply the local deformation length of a diagram isomorphism and sum over isomorphisms. Divide by the correct sign/stabilizer factors; do not assert coarse Artinian Hom is independent of diagram choices.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §6, (6.1) Proposition, p. 259 (proof pp. 259–260, including (6.2)).)

*Needs:* [7.23 Half Hom count](#723-half-hom-count), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams).

### 7.46 Tangent self-intersection number

In the finite CM intersection setting, suppose r_𝒜(m) ≠ 0, so c and T_m d^σ share the point x and ⟨c, T_m d^σ⟩_v is defined by Ch. II (5.1)/(5.3) using the tangent vector ∂/∂t at x. Here ∂/∂t is dual to ω = η⁴(q)dq/q when u = 1, is defined in general through the normalisation of the uniformiser g in Ch. II §5, here ω = (1/u)(g^(1/u) + …)dg/g (Gross–Zagier print it without the factor 1/u), defined up to a 6th root of unity. Define (x·x) := ord_v(α), where α ∈ H_v^× is given by ∂/∂t = α·(a basis of the free W-module T_x X); Gross–Zagier print this as 'α∂/∂t is a basis', and the convention here is the displayed one. With this convention the intersection formula (0.2), ⟨c, T_m d^σ⟩_v = −(x·T_m x^σ) log q_v, continues to hold.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Write ∂/∂t=αe with e an integral tangent basis. The principal-divisor tangent law gives (x·x)=ord_v α and hence the negative local-height sign.

Its API consists of the following facts:

- ord_v(α) for tangent ∂/∂t=αe, e an integral tangent basis.
- Replacing e by a unit multiple leaves ord_v(α) unchanged.
- Scaling the tangent by a multiplies α by a and adds ord_v(a).
- The diagonal local height is minus this number times log q_v.

**Checks.**

- A tangent basis has self-intersection zero.
- The tangent πe has self-intersection 1.
- Defining α∂/∂t=e gives −1 for πe and reverses the local height sign.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250).)

*Needs:* [7.19 Tangent-normalized CM height symbol](#719-tangent-normalized-cm-height-symbol), [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent), [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves).

### 7.46a Principal-level integral models, CM sections and Čerednik–Drinfeld charts

Assume (D), and let 𝔅 be its incoherent algebra with its fixed maximal order O_𝔅 ⊃ Ô_E. When F = ℚ and 𝔅 is ramified only at ∞ (the modular case), U is an open subgroup of O_𝔅^× = GL₂(Ẑ), and the principal-level integral model 𝒳_U is by definition the integral coarse modular curve X_U of ModularCurvesPartII §5.2, with its cusps from ModularCurvesPartII §§4.1–4.8 and its level maps from ModularCurvesPartII §5.15. Otherwise HilbertModularVarietiesAndShimuraCurves R18.2.9 applies; let U♮ ⊇ U be the level equal to O_(𝔅_v)^× at every finite place v where 𝔅 ramifies and equal to U_v elsewhere, and define 𝒳_U as the normalization of the coarse model 𝒳_(U♮) of R18.2.9 in the function field of X_U along the finite level map X_U → X_(U♮). Prove the following.

1. **Model.** 𝒳_U is normal, projective and flat over O_F with generic fibre X_U. It agrees with R18.2.9 when U = U♮; when [F:ℚ] > 1, it agrees with R18.2.6 (the Drinfeld-basis regular model) at a 𝔅-split place v with principal U_v; in the modular case it is, at every prime, the coarse space of the regular Drinfeld-level stack of ModularCurvesPartII §5.1; and it agrees with Yuan's quotient model when U_v is maximal at every ramified place (Yuan, Modular heights, §4.1, printed p. 52; yuan-modular line 2106). A level map X_U → X_U′ with U ⊆ U′ of the same kind extends uniquely to a finite map 𝒳_U → 𝒳_U′. Regularity of 𝒳_U itself is not asserted.
2. **Hecke correspondences on regular models.** For a finite place v and a finite extension L/F_v, the regular proper models of X_U ⊗ L dominating the normalization of 𝒳_U ⊗ O_L, their common resolutions and, after a further finite extension, their semistable models are those of TauCetiRoadmap.StableReduction Layers 4–5 and 7. Prove that Hecke correspondences and level maps extend to common dominating regular models, and that the projection formula holds for their pullback and pushforward.
3. **Čerednik–Drinfeld charts at principal level.** At a finite place v where 𝔅_v is division, let Ω̂ be the standard Drinfeld formal model over O_(F_v) (HilbertModularVarietiesAndShimuraCurves R18.5.3), and let Σ̂_(U_v) be the normalization of (Ω̂ ⊗ O_(F̆_v)) × ℤ in the level-U_v covering of the rigid Drinfeld tower of R18.5.20–R18.5.21. Here the index set ℤ is 𝔅_v^×/O_(𝔅_v)^× through the valuation of the reduced norm, and an element of B(v)^× acts on it by translation by ord_v of its reduced norm; a chart with a single copy of Ω̂ would not be stable under the elements of odd ord_v(q). First let U^v be contained in (1+N·Ô_𝔅^v)^× for some N ≥ 3 prime to v and to the ramified places of 𝔅, the small tame level for which R18.5.20–R18.5.21 are stated. Prove that the formal completion of 𝒳_U ⊗ O_(F̆_v) along its special fibre is the quotient B(v)^× \ (Σ̂_(U_v) × 𝔅_f^(v,×)/U^v), compatible with the maximal-level uniformization R18.5.15 under U ⊆ U♮ and with level maps. For general U choose such a U′ normal in U and take invariants under the finite group U/U′; taking invariants commutes with the flat base change to the completion.
4. **Supersingular charts at 𝔅-split, E-nonsplit places.** Let v be a finite place nonsplit in E at which 𝔅_v is split, so that B(v)_v is the quaternion division algebra over F_v. Let 𝓜̂_(U_v) be the normalization of ⊔_(ℤ) Spf O_(F̆_v)⟦t⟧, the universal deformation space of the one-dimensional formal O_(F_v)-module of height two with its quasi-isogeny height as index (LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 when [F:ℚ] > 1; when F = ℚ, the universal deformation over W(k)⟦T⟧ of E₀[p^∞] for a supersingular E₀ of TauCetiRoadmap.ModularCurves Layer 7F ST-2, every connected one-dimensional height-two p-divisible group over an algebraically closed k being isomorphic to E₀[p^∞]), in its Drinfeld level-U_v covering (for F = ℚ, ModularCurves Layer 7F ST-4); B(v)_v^×, the group of self-quasi-isogenies of that formal module, acts on it. Prove: (a) every CM point by E reduces at v into the supersingular locus, the finite set of points whose special height-two O_(F_v)-divisible group is connected; (b) for U^v small as in item 3, the formal completion of 𝒳_U ⊗ O_(F̆_v) along the supersingular locus is B(v)^× \ (𝓜̂_(U_v) × 𝔅_f^(v,×)/U^v), compatibly with level maps, and the supersingular locus itself is B(v)^× \ (ℤ × 𝔅_f^(v,×)/U^v); (c) for general U, take invariants as in item 3. Part (a) holds because E_v is a field: the endomorphism ring of an ordinary special divisible group is O_(F_v) × O_(F_v), which contains no quadratic field extension of F_v.
5. **Resolved uniformizing models, CM sections and local charts.** Let H/E be finite with every CM point of the support of the CM divisors rational over H, and let w be a place of H over v. Let 𝒳_(U,w) be the canonical resolution of the normalization of 𝒳_U ⊗ O_(H_w), obtained by repeatedly blowing up the whole finite singular locus and normalizing (StableReduction Layer 4). Being canonical, it commutes with completion and with étale localization and is equivariant for every automorphism; for U^v small as in item 3, B(v)^× acts with trivial stabilizers modulo F^× ∩ U, and canonicity therefore lifts the charts of items 3 and 4 to a uniformization of the completion of 𝒳_(U,w) ⊗ O_(H̆_w) along the special fibre (item 3) or along the preimage of the supersingular locus (item 4), by the canonical resolution of the normalized chart over O_(H̆_w). This is the principal-level uniformizing model used in 7.47: the multiplicity m of 7.47, item 2, the lengths i_w and the lift Ṽ of 7.47, item 3, are read on it. Each CM point extends uniquely to a section of 𝒳_(U,w) and of every regular proper model of item 2, and its completed local ring at the closed point is computed by item 3 at a 𝔅-division place and by item 4 at a 𝔅-split place nonsplit in E. For two distinct CM points x and y, let i_w(x,y) be the intersection length of their sections on 𝒳_(U,w), divided by the ramification index e(H_w/F_v), and let j_w(x,y) be the pairing of the vertical correction of the ξ̂-admissible extension of 2.9 with the section of y. The sum i_w + j_w is the finite part at w of the ξ̂-admissible local pairing of degree-one divisors; it does not depend on the regular model or on H, while i_w and j_w individually depend on the model. On degree-zero combinations of CM points the ξ̂-normalization pairs to zero, and the sum is the finite Néron symbol of 2.5 (2.9, compatibility with 2.5). The self-intersection of a CM point is excluded from the pairing.
6. **Cusps in the modular case.** In the modular case a CM section never meets a cuspidal section, because a CM elliptic curve has potentially good reduction at every place. The Hodge class enters the height kernel through its admissible arithmetic extension ξ̂ of 2.9, with the logarithmically singular Petersson metric at the cusps fixed by 3.2; the local pairings of item 5 between CM points involve no cusp.

The model construction is Yuan–Zhang–Zhang's §7.2 (yzz-book), whose integral models are taken at arbitrary level. HilbertModularVarietiesAndShimuraCurves R18.2.8–R18.2.10 are maximal at the ramified places, R18.2.6 is stated for [F:ℚ] > 1, R18.2.9 excludes B = M₂(ℚ), and R18.5.20–R18.5.21 describe generic fibres only. The supersingular description of item 4 is Carayol's (Carayol §§6.6 and 11.2, as restated by Yuan, Modular heights, p. 55; yuan-modular line 2239).

*Outline.* Item 1 is normalization of a normal projective flat model in a finite separable extension of function fields, with excellence of O_F for finiteness; a level map extends because the normalization is functorial for the finite map of function fields, and the extension is unique because 𝒳_U′ is separated and 𝒳_U is reduced with dense generic fibre. Item 3 normalizes the maximal-level formal uniformization in the rigid covering, using that normalization commutes with formal completion for excellent schemes. Item 4, for [F:ℚ] > 1: the auxiliary moduli problem of R18.2.6 carries a special height-two O_(F_v)-divisible group whose deformations are represented by the completed local rings of 𝒳_U (Carayol §6.6), the supersingular points form one B(v)^×-class set (Carayol §11.2), and Drinfeld level is added on both sides. In the modular case, the supersingular points are the Deuring–Eichler class set of SerreWeightAndLevelOptimisation §2.6 (`deuring-eichler-supersingular-comparison`), the completed local rings are the deformation rings of the elliptic curve with Drinfeld level (ModularCurves Layer 7F ST-1 and ModularCurvesPartII §5.1), and ModularCurves Layer 7F ST-2 and ST-4 identify them with the universal deformation of E₀[p^∞] with Drinfeld [Γ(pⁿ)]-level, so LT.3 is not used when F = ℚ. When F = ℚ and 𝔅 is ramified at a finite place, the curve is the moduli space of false elliptic curves (PELModuli M2.9), an idempotent of O_𝔅 ⊗ ℤ_p ≅ M₂(ℤ_p) splits its p-divisible group into two copies of a height-two one-dimensional group, which at a supersingular point is connected and so isomorphic to E₀[p^∞] for a supersingular elliptic E₀ (Dieudonné classification, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`), and the elliptic charts transport to it in three steps. First, the Serre–Tate equivalence for abelian schemes with prescribed endomorphisms and polarizations (AbelianSchemesAndArithmeticModuli A4.9) identifies deformations of the false elliptic surface A₀ with its O_𝔅-action with deformations of A₀[p^∞] with its M₂(ℤ_p)-action. Second, Morita equivalence for M₂(ℤ_p) identifies these with deformations of G₀ = e·A₀[p^∞]; the polarization imposes nothing more, since an M₂(ℤ_p)-compatible alternating self-duality of e·A[p^∞] ⊗ ℤ_p² is a ℤ_p^×-multiple of the alternating self-duality of the height-two group e·A[p^∞], and every deformation of G₀ ≅ E₀[p^∞] carries the Weil pairing of the elliptic deformation that ST-1 attaches to it. Third, the Drinfeld [Γ(pⁿ)]-level on A[pⁿ] with its O_𝔅-action is, through the same idempotent, a [Γ(pⁿ)]-structure on e·A[pⁿ]; a [Γ(pⁿ)]-structure is a full set of sections of the finite flat group of pⁿ-torsion and so depends on that group alone, and the fixed isomorphism G₀ ≅ E₀[p^∞] with ST-1 carries it to a [Γ(pⁿ)]-structure on the elliptic deformation, where ST-2 and ST-4 apply. Item 5 uses the valuative criterion of properness and Zariski's lemma as in 2.5 and 2.9.

**Checks.**

- A local map t=s² gives pullback (t)=2(s), with horizontal multiplicity 2, rather than 1. Likewise base change π=π′² sends length 1 for O/(π) to length 2 over O′; division by e(H_w/F_v) restores 1, so normalized lengths are compared, never raw lengths after ramified base change.
- Under a blow-up at the intersection point of two transverse sections x, y, the strict transforms x̃, ỹ have intersection 0, while the pullback x̃+E of x meets ỹ with (x̃+E)·ỹ = 0+1 = 1, the original value. The horizontal length on the blown-up model alone changes from 1 to 0, so a comparison of local multiplicities across models must carry the exceptional contribution.
- Degree one needs the ξ̂-normalization: on a fibre C₁+C₂ with C₁·C₂ = 1 and C₁² = C₂² = −1, a point x meeting C₁ has (x̄·C₁, x̄·C₂) = (1, 0), and the orthogonal corrections V = a C₁ + b C₂ solve −a + b = −1, a − b = 0 only modulo the fibre, which has no solution: the vector (1, 0) has nonzero sum. So a single point has no orthogonal extension, and its pairing with y depends on how the fibre degree is normalized; for (x) − (y) with y also meeting C₁ the vector is (0, 0) and the correction is 0.
- In a division algebra with residue cardinality q=2 on F_v, a division uniformizer Π has Π² equal to the central uniformizer up to a unit. The quotient O_D×/(1+ΠO_D) has 4−1=3 elements, while O_D×/(1+Π²O_D) has 4·3=12. The principal level in (D) uses the central uniformizer, so the local index [O_D^× : U_v] is 12, not 3.
- Supersingular count at F = ℚ, 𝔅 = M₂ at all finite places, U = GL₂(Ẑ) and v = p = 5, which is inert in E = ℚ(√−7) since −7 ≡ 3 is not a square modulo 5: the only supersingular j-invariant in characteristic 5 is 0, with #Aut/{±1} = 3, and the mass 1/3 equals (p−1)/12 = 4/12. The CM point j = −3375 = −27·5³ reduces to 0, as (a) requires; at the split prime 11 (−7 ≡ 2² mod 11) the same point reduces to −3375 ≡ 2, which is ordinary in characteristic 11 (the supersingular values there are 0 and 1728 ≡ 1), so (a) does not extend to split places.
- False elliptic chart at F = ℚ, 𝔅 of discriminant 6 and p = 5, where 𝔅 splits: a false elliptic surface A₀ supersingular at 5 has A₀[5^∞] of height four and dimension two, whose unrestricted deformation space has dimension 2·2 = 4, and with its principal polarization g(g+1)/2 = 3; the O_𝔅-action cuts this to the deformations of e·A₀[5^∞], of height two and dimension one, with 1·1 = 1 parameter, the dimension of W(k)⟦T⟧ in ST-2. A chart that applied ST-2 to A₀[5^∞] without the idempotent would have the wrong dimension.
- F = ℚ, 𝔅 ramified only at ∞, CM discriminant −7: the CM point has j = −3375, an integer, so its section meets neither the cusp of j = ∞ nor any cusp of a principal-level cover at any prime.

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.2.6, R18.2.9, R18.2.10, R18.5.3, R18.5.15 and R18.5.20–R18.5.21; ModularCurvesPartII §§4.1–4.8, 5.1–5.3 and 5.15; TauCetiRoadmap.StableReduction Layers 4–5 and 7 (regular proper models, canonical resolution by normalized blowups, common resolution, intersection multiplicities, semistable reduction); TauCetiRoadmap.ModularCurves Layer 7F (Serre–Tate, ST-1, ST-2 and ST-4, the height-two deformation space when F = ℚ); LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 (universal deformations at height two, when [F:ℚ] > 1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` (Dieudonné classification, false elliptic case); AbelianSchemesAndArithmeticModuli A4.9 (Serre–Tate equivalence with endomorphisms and polarizations, false elliptic case); SerreWeightAndLevelOptimisation §2.6 (Deuring–Eichler supersingular comparison); PELModuli M2.9; [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves); [2.9 Admissible arithmetic extension](#29-admissible-arithmetic-extension); [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent); [3.2 Normalized Hodge class](#32-normalized-hodge-class).

### 7.47 Nearby quaternionic approximation

**General-level prerequisites for data (D).** The following four targets use (D) and the principal-level integral models of 7.46a, with their deep principal U_v at S₁, both S² places, and no exclusion of common finite ramification. The kernels carry the character χ_T transported in 0a.4. Put A_χH(g)=∫* χ(t)⨍_(C_U) H(g,(s,st⁻¹)) ds dt. The inner average is the counting probability of 6.8. The outer starred integral is exactly 6.38: central probability averaging followed by quotient measure of volume V=2L(1,η). Thus a constant kernel 1 has A₁-value V; dividing the outer integral by V gives the finite character probability average. Finite sums at fixed level and the convergent kernels below justify this operation. No second factor V comes from the inner average.

1. **Projected derivative.** With Ω, c₁, c_(φ_v), K^(v) and I′(v) defined by the formulas of 6.56 at this level, prove
   `Pr I′(0,g,χ,φ) = A_χ(−2Σ_(v|∞) K^(v) − 2Σ_(v finite nonsplit) K^(v) − c₁Ω − Σ_(v finite) C_v + R_f)`.
   Here `C_v(g,(t₁,t₂))=Σ_u Σ_(y∈E×) c_(r(t₁,t₂)φ_v)(g,y,u) r(g,(t₁,t₂))φ^v(y,u)` and `R_f(g,(t₁,t₂))=Σ_u Σ_(y∈E×)(2 log δ_f(g_f)+log|uq(y)|_f) r(g,(t₁,t₂))φ(y,u)`. Each K^(v) is the torus-pair kernel of 6.56, with its factor 2 displayed before the normalized diagonal average. Nonzero coefficients have finite place support, and the Fourier/place expansion converges in the projection domain of 6.1. On K_(S₁)GL₂(𝔸^(S₁)), the E-supported terms vanish by 7.4. This target uses the normalized Whittaker derivative and the general projector, rather than the maximal-order local formulas (YZZ Proposition 6.7 and §6.3, especially Proposition 6.12; Yuan–Zhang Theorem 7.2, pp. 588–590, for the displayed normalization; yuan-zhang line 2338).
2. **Multiplicity and omitted diagonal.** For nonsplit finite v, define m at the actual principal level on `B(v)_v× ×_(E_v×) 𝔅_v×/U_v` outside the diagonal orbit. For β₁≠t₂ prove
   `ī_v(β₁,t₂)=Σ_(γ∈μ_U\B(v)×) m(γt_(2v),β_(1v)⁻¹) 1_(U^v)((β₁^v)⁻¹γt₂^v)`.
   For all pairs omit precisely `γ∈E×∩β₁Ut₂⁻¹`. Set `m_(φ_v)(y,u)=Σ_(x∈𝔅_v×/U_v)m(y,x⁻¹)φ_v(x,uq(y)/q(x))` off E_v, and on E_v× define n by omitting x∈yU_v. These definitions use the actual intersection lengths and CM sections on the resolved uniformizing model of 7.46a, item 5, with the Čerednik–Drinfeld charts of its item 3 at 𝔅-division places and the supersingular charts of its item 4 at 𝔅-split places; at every nonsplit v the γ-sum is the B(v)^×-quotient of the chart. At split v use the two prime components of that model with their half-sum; no maximal-order closed formula is substituted at deep level. Prove m(b⁻¹,β⁻¹)=m(b,β) and the local constancy and support statements needed in 7.47 (YZZ §7.2.2, Lemma 8.2 and Theorem 7.8(4); Disegni Proposition 8.3.1(3), disegni line 2832).
3. **Vertical kernel.** For a lift Ṽ of the vertical correction on the resolved uniformizing model of 7.46a, item 5, define `l^(t₁,t₂)_(φ_v)(y,u)=Σ_(x∈𝔅_v×/U_v) φ_v(x,uq(t₁⁻¹yt₂)/q(x)) · (Z_x(t₁⁻¹yt₂)·Ṽ)`, where Z_x is the translated local CM section indexed by x, and the intersection is the vertical local pairing of 2.9, with its component/norm condition. Prove `j̄_v(Z_*(g,φ)t₁,t₂)=Σ_u Σ_(y∈B(v)×)r(g,(t₁,t₂))φ^v(y,u) l^(t₁,t₂)_(r(g)φ_v)(y,u)`. Under S¹ the kernel extends by zero to a Schwartz function; prove the finite-coset support at the principal level before summing. The unit-norm indicator simplification in 7.32 is only the maximal-level specialization (YZZ Theorem 7.8(4) and §7.4.3; Disegni Proposition 8.3.1(3), disegni line 2832).
4. **Full height decomposition.** At this same level prove
   `Z(g,(t₁,t₂),φ)_U = −Σ_(v nonsplit)(log N_v)⨍ M_φ^(v)(g,(tt₁,tt₂))dt − Σ_(v finite)N_φ^(v)(g,(t₁,t₂))log N_v − Σ_(v finite)j_v(Z_*(g,φ)t₁,t₂)log N_v − i₀(t₂,t₂)Ω_φ(g,(t₁,t₂))/[E×∩U:μ_U]`.
   Use log N_v=1 at real v; M is the omitted-diagonal horizontal multiplicity series of item 2 (the regularized resolvent at infinity), N its E-supported n-series, and i₀ the global intersection minus the normalized local horizontal intersections, as in 7.28. Before imposing S² at the two places of S₂, retain all four Hodge pairings, including `−[F:ℚ]E*(0,g,r(t₁,t₂)φ)/2`; prove their vanishing from S² at those two places alone, at this level (S¹ is not used for it). Apply A_χ to this full equality to obtain the height kernel used below (YZZ §7.3 and Theorem 7.8; its local statements are restated in Disegni §§8.1–8.3, disegni line 2735 and disegni line 2769; the weakly admissible correction is Yuan, Theorem 4.3 and Remark 4.4, pp. 68–69).

**Checks for the general-level prerequisites.**

- Projected derivative: two local zero factors s and s have product s², whose derivative at 0 is 0. A single factor s instead gives derivative 1; this is the reason for two nonsplit degeneracy conditions.
- Projected derivative: at a good inert prime with uq(y₂) of valuation one, the local derivative is log q_v, while its arithmetic partner is also log q_v. The difference is 0, rather than either term being 0.
- Projected derivative: if V=3, the constant torus-pair kernel 1 has A₁-value 3 and its normalized outer average is 1. Its A_χ-value is 0 for nontrivial χ. An unnormalized inner sum would multiply this value by #C_U, a level count unrelated to V=2L(1,η).
- Multiplicity: in the split algebra at q=2 the maximal unit group has six cosets modulo its first principal subgroup, since #GL₂(𝔽₂)=(4−1)(4−2)=6. A deep-level sum therefore retains six refined cosets, rather than one.
- Multiplicity: the diagonal orbit is outside the domain of m; after omitting it its sum is 0 when it was the only orbit. Assigning m the value 1 there gives 1 instead.
- Multiplicity: under S¹ every coefficient at a forbidden torus orbit is 0. Omitting it agrees with the zero geometric contribution; multiplying an undefined m-value by 0 is not a definition.
- Vertical kernel: Ṽ=0 gives each intersection and l-value 0, and hence a zero vertical theta series.
- Vertical kernel: replacing Ṽ by 2Ṽ multiplies l and its theta series by 2; a squared intersection coefficient would multiply by 4.
- Vertical kernel: the norm-support condition excludes y=0 and singular matrices. Extending by zero gives value 0 there; a nonzero constant extension fails the support condition.
- Full height: before auxiliary vanishing, [F:ℚ]=1 gives coefficient −1/2 on E*, and degree 2 gives −1. The orbit condition S² at the auxiliary split places (Yuan–Zhang–Zhang Assumption 5.4) alone reduces that contribution to 0 (Yuan, Modular heights, Remark 4.4).
- Full height: the four Hodge pairings expand with coefficients +1,−1,−1,+1; dropping only the first cross term does not yield the horizontal/vertical sum. S² at the two places of S₂ kills the cross terms: it makes Z_*(g,φ)ξ zero and the component degrees of Z_*(g,φ)t₁ zero (Disegni, Proposition 8.1.1(1)–(2), disegni line 2735).
- Full height: zero Schwartz data give M=N=j=Ω=E*=0 and Z=0. The signs of the nonzero terms are fixed by the horizontal formula, not this zero-data check alone.

*Needs for these four targets:* 0a.4, 6.1, 6.5 with its growth bounds, 6.7, 6.8, 6.9, 6.38, 6.50, 6.56, 7.1–7.4, 7.28, 2.9, [7.46a Principal-level integral models](#746a-principal-level-integral-models-cm-sections-and-čerednikdrinfeld-charts) for the integral geometry. On a regular common refinement, lengths, vertical corrections and translated sections are compared by 7.46a, item 5, before using the multiplicity sums. The book locators in these targets refer to Yuan–Zhang–Zhang, Chapters 6–8. No maximal-level Colmez computation is used as their proof.

Take data (Q) and (D) of the Conventions: S¹ at the nonsplit exceptional set S₁, S² at the two split places S₂, standard data and maximal level at the other nonsplit places, and the standard Gaussian at infinity. Let S′ be the finite set of finite places that are not good in the sense of 7.25. Then S′⊇S₁∪S₂, and for the standard additive character ψ=ψ_ℚ∘Tr_(F/ℚ) the nonsplit places of S′ are exactly those of S₁: a nonsplit place outside S₁ has E_v/F_v and F_v/ℚ_p unramified, 𝔅_v split, U_v maximal, φ_v standard and ψ_v of conductor O_(F_v). Define:
- for v∈S′ nonsplit in E, Φ′_v(y,u):=k_(φ_v)(1,y,u)−m_(φ_v)(y,u)log N_v on (B(v)_v−E_v)×F_v^×;
- for v∈S′, d_(φ_v)(1,y,u) as in 7.25 on E_v^××F_v^×;
- for every v∈S′ nonsplit in E, that is every v∈S₁, whether 𝔅_v is division or split, the j-part kernel l_(φ_v)(1,γ,u) of the vertical correction on B(v)_v^××F_v^×, given by item 3 of the general-level prerequisites. At a place of S₁ where 𝔅_v is split and U_v is a deep principal subgroup the vertical correction is not known to vanish: 7.14 proves its vanishing only at maximal level under (Q′). So no j-term is dropped here; Yuan–Zhang–Zhang's Theorem 7.8(4) supplies both the horizontal and the vertical kernel at every place of S₁ (restated by Disegni, Proposition 8.3.1(3), p. 57, disegni line 2832). Off S₁ the j-part of item 4 of the prerequisites is zero by a stated theorem, never by omission. At places split in E, S₂ and every other split place of S′ included, the local i- and j-parts vanish by Yuan–Zhang–Zhang's Theorem 7.8(1). At nonsplit places outside S₁, U_v is maximal at an unramified 𝔅-split place, the integral model is smooth there, and the vertical correction is zero by its definition (both restated by Disegni, Proposition 8.3.1(1)–(2) and its proof, disegni line 2828 and disegni line 2854).

Prove the following.
1. **Local nonsingularity.** Each Φ′_v extends to a Schwartz function on B(v)_v×F_v^×, each d_(φ_v)(1,·,·) to a Schwartz function on E_v×F_v^×, and each l_(φ_v)(1,·,·) extends by zero to a Schwartz function on B(v)_v×F_v^×.
2. **Vanishing off S′.** For finite v∉S′ and every g∈GL₂(F_v), k_(φ_v)(g,·,·)−m_(r(g)φ_v)·log N_v vanishes on (B(v)_v−E_v)×F_v^× when v is nonsplit in E, and d_(φ_v)(g,·,·), with its term 2log δ_v(g), vanishes on E_v^××F_v^× (7.25, item 3). These are the v-components of Pr I′−2Z̃ grouped as in Yuan–Zhang §9.1 (yuan-zhang line 4302): the E-supported part of the grouping is Σ_v Σ_u Σ_(y∈E^×) d_(φ_v)(g,y,u)r(g)φ^v(y,u), to which R_f of the projected-derivative prerequisite contributes its local term (2log δ_v(g_v)+log|uq(y)|_v)·r(g)φ(y,u) at each v. The j-part vanishes off S₁ as stated above, and the archimedean difference vanishes.
3. **Pseudo-theta form.** For g in K_(S′)GL₂(A^(S′)), for a sufficiently small open compact K_(S′)⊂GL₂(F_(S′)), the difference Pr I′(0,g,χ,φ)−2Z̃(g,χ,φ) is a finite sum of nonsingular pseudo-theta series (6.25). These are the terms built from Φ′_v and l_(φ_v) on the full space B(v), the terms built from d_(φ_v) on the line E⊂B(v), and a multiple of Ω_φ, also on E.
4. **Identity.** The difference is automorphic. By 6.40 it therefore equals the sum of the outer theta series of the full-space terms: Pr I′(0,g,χ,φ)−2Z̃(g,χ,φ)=Σ_(v∈S′ nonsplit)I(0,g,χ,Φ(v)), where Φ(v)=φ^v⊗Φ″_v∈S(B(v)_A×A^×). Here Φ″_v is the Schwartz extension of −2Φ′_v+2log N_v·l_(φ_v)(1,·,·) at every nonsplit v∈S′, with the signs of Yuan–Zhang §9.1. At maximal level under (Q′) the l-term vanishes at the 𝔅-split places by 7.14, which recovers Yuan–Zhang's sum of vertical terms over the 𝔅-division places only (yuan-zhang line 4363); under (D) it is kept at every place of S₁. The identity holds for every g∈GL₂(A). The E-supported terms and the inner theta series have codimension two in B(v); they enter only the companion identity of 6.49, which this target does not need.
5. **Projection.** Assume in addition Σ(𝔅)=Σ(σ,χ), as in 7.5. Each I(0,·,χ,Φ(v)) is a coherent kernel for B(v), so its σ-component vanishes by 7.5. The σ-cuspidal projections of Pr I′ and 2Z̃ therefore agree; this is the input of 8.1.

*Outline.* Item 2 is 7.25. Item 3 combines the general-level projected derivative and full height decomposition just stated; every v-sum has finite support by item 2. Item 4 is Lemma 6.1(1) of Yuan–Zhang (6.40): compare the pseudo-theta series with their theta series on K_(S′)GL₂(A^(S′)) by (6.2.1), and separate codimensions with the Vandermonde argument in (1+iN)^(−[F:ℚ]). That argument uses automorphy and the density of GL₂(F)GL₂(A^(S′)_f) in GL₂(A); density never yields a local identity at a bad place. Item 5 uses 7.5 with the additional sign-matching hypothesis; items 1–4 do not require that hypothesis.

The analytic part of item 1 follows from S¹. Let v∈S₁ and v(uq(y₂))≥−v(d_v). For n≥0, every x₂ in D_n(a), a=uq(y₂), satisfies v(uq(x₂))≥−v(d_v), so φ_v(y₁+x₂,u)=0 by S¹. Hence every term of the derivative formula of 6.50 vanishes, and k_(φ_v)(1,·,·) vanishes on a neighbourhood of E_v×F_v^×. Away from E_v it is locally constant and compactly supported, hence Schwartz. Also φ_v vanishes on E_v×F_v^× (there x₂=0), so the constant-term derivative c_(φ_v)(1,·,·) vanishes on E_v×F_v^×. Under (D) the E-supported terms of item 3 also vanish for g∈K_(S₁)GL₂(𝔸^(S₁)), by 7.4, item 2; item 4 does not need this.

The geometric part of item 1 is Yuan–Zhang–Zhang's Theorem 7.8(4): under (D), at every v∈S₁ the local i-part and j-part of the height kernel are theta series of Schwartz functions m_(φ_v), l_(φ_v)∈S(B(v)_v×F_v^×). The route is as follows, with the general-level multiplicity sums just stated; steps (a) and (b) use only S¹ and the definitions, while (c) and (d) use the local constancy and support properties of the multiplicity function established with Theorem 7.8(4).
- (a) *The singular orbit is killed.* The multiplicity m(y,x^(-1)) is defined on 𝔥_(U_v) except at the image of (1,1), that is, except when y∈E_v^× and x lies in the U_v-coset of y. By 7.4, item 1, φ_v vanishes on (U_vE_v^×U_v)×F_v^×, so every such x drops out of m_(φ_v) and n_(φ_v), and the self-intersection terms of the height kernel vanish.
- (b) *Finitely many cosets.* By the first inequality of S¹, φ_v(x,uq(y)/q(x))=0 whenever ord_v(uq(y))≥−ord_v(d_v), since the product of q(x) with the second argument is uq(y). Compact support of φ_v bounds |uq(y)|_v above. On the remaining range q(x) lies in a fixed compact subset of F_v^× and x in a fixed compact subset of 𝔅_v^×, so only finitely many cosets xU_v contribute, uniformly in (y,u).
- (c) *Local constancy across E_v.* Off the image of (1,1) the multiplicity is locally constant. Each surviving term is therefore locally constant in y near every point of E_v^×, and m_(φ_v) extends across E_v; near y=0 it vanishes by (b).
- (d) *Compact support.* A nonzero multiplicity requires the CM point and its translate to lie on the same connected component and to have the same reduction. Together with (b) this bounds ord_v q(y). If B(v)_v≅M₂(F_v), so that 𝔅_v is division and the reduction at v is of Čerednik–Drinfeld type, it also confines y to finitely many cosets of F_v^×GL₂(O_(F_v)), as in the support argument of Yuan–Zhang's Lemma 8.9.

For l_(φ_v), S¹ gives φ_v(0,u)=0. The argument of Yuan–Zhang's Lemma 8.9 and Remark 8.10, written there for maximal U_v at a 𝔅-division place through the Čerednik–Drinfeld uniformization, shows that the vertical kernel is supported on finitely many cosets; at deep U_v, and at the 𝔅-split places of S₁, this is again Theorem 7.8(4). For maximal U_v and the Colmez data (Q′), the whole of item 1 is proved in public form by Yuan–Zhang's Lemmas 7.4, 7.6, 8.7 and 8.9.

**Checks.**

- Each good place contributes zero individually. Under (D), S′ contains S₁ with at least two places, so S′ cannot be empty.
- If Σ(𝔅) differs from Σ(σ,χ) only at v, then the nearby coherent B(v) can have a nonzero σ-component. The projection conclusion in item 5 cannot be inferred without sign matching.
- Dropping S¹ at an E-ramified place of S₁ leaves the logarithmic singularity ½(v(q(y₂))+v(D_v)) in m_(φ_v). Then Φ′_v need not extend across E_v, and 6.40 does not apply.
- A coherent term I(0,·,χ,Φ(v)) need not vanish as a function; only its σ-component does.
- A vertical correction need not vanish once the fibre at v is reducible, as it can be at a 𝔅-split place of S₁ with deep U_v. On a regular model whose fibre at v is C₁+C₂ with C₁·C₂=s and C₁²=C₂²=−s, a degree-zero divisor x−y with x meeting C₁ and y meeting C₂ needs V=(1/s)C₁: (x−y+V)·C₁=1−1=0 and (x−y+V)·C₂=−1+1=0. Then V·(x′−y′)=1/s for a second such divisor. A j-part kept only at 𝔅-division places would put 0 in place of this nonzero term.
- Equality only on K_(S′)GL₂(A^(S′)) before item 4 is insufficient for a local conclusion at v∈S′. The global identity follows from automorphy, not from weak approximation at v.

*Consequences.* The bad-place contributions are explicit coherent theta series for the nearby algebras, determined by the local differences Φ′_v, d_(φ_v) and l_(φ_v); no explicit wild coefficient is needed.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Annals 187 (2018), §6.2, (6.2.1), pp. 579–581; Lemma 6.1 and proof, pp. 582–583; Theorem 7.2, pp. 587–588; the derivative formula, pp. 593–594; Theorem 8.6, pp. 616–617; Lemma 8.9 and Remark 8.10, pp. 619–624; §9.1, pp. 624–627; p. 608 (Assumption 5.3 removes the self-intersections); p. 611 (domain of the multiplicity function); p. 621 (under Assumption 5.3 the j-part is a nonsingular pseudo-theta series, proved by Yuan–Zhang–Zhang); Lemma 8.9 and Remark 8.10, pp. 622–624. Yuan–Zhang–Zhang's Theorem 7.8(1) and (4), Proposition 8.8 and §7.2.2 are restated by [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), Proposition 8.3.1, p. 57, and Lemma 8.2.1, p. 56. The book is [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Theorem 7.8, as identified by Disegni.)

**Source note.** Steps (c) and (d) of the geometric half of item 1 at deep level U_v are proved only in the Yuan–Zhang–Zhang book (Theorem 7.8(4)); its statement and numbering are confirmed by Disegni, Proposition 8.3.1(3), p. 57, and, for the j-part, by Yuan–Zhang, p. 621. The geometric argument and the four general-level prerequisites retain their stated book inputs; the public maximal-level calculations identify their specializations and normalization.

*Needs:* the four general-level prerequisites of this section; [7.4 Degenerate Schwartz classes](#74-degenerate-schwartz-classes), [7.25 Good-place arithmetic identity](#725-good-place-arithmetic-identity), [7.5 Nearby coherent kernel orthogonality](#75-nearby-coherent-kernel-orthogonality), [6.38 Arithmetic height kernel](#638-arithmetic-height-kernel), [6.24 Incoherent central derivative](#624-incoherent-central-derivative), [6.25 Pseudo-theta comparison on a small bad-place compact](#625-pseudo-theta-comparison-on-a-small-bad-place-compact), [6.40 Automorphic sum reduces to nondegenerate outer theta](#640-automorphic-sum-reduces-to-nondegenerate-outer-theta), [6.49 Positive-codimension theta cancellation](#649-positive-codimension-theta-cancellation), [6.50 Local derivative and zero-term corrections](#650-local-derivative-and-zero-term-corrections), Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

### 7.48 Archimedean proper-height expression

At a real place, ivbar(Z*t1,t2)proper=Mφ^(v)(g,(t1,t2))−ivbar(t2,t2)Ωφ/e, where M is the regularized ms-weighted nearby-quaternion sum. This is the proper horizontal i-part computed with the weakly admissible resolvent extension. The complete positive-degree pairing also has the archimedean j correction; under the auxiliary degeneracy assumptions its Eisenstein contribution vanishes.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Subtract the explicit diagonal multiplicity and apply the off-diagonal Green expansion; justify meromorphic continuation separately.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, Proposition 8.2, p. 610; [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.4–§4.5, Theorem 4.3 and Proposition 4.5, pp. 68–71.)

*Needs:* [7.11 Regularized archimedean multiplicity](#711-regularized-archimedean-multiplicity), [7.28 Diagonal coefficient and modified self-intersection](#728-diagonal-coefficient-and-modified-self-intersection), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.49 Split proper height and zero extended diagonal

For E-split v, ivbar(t,t)=0 and ivbar(Z*t1,t2)proper=Nφ^(v), the half-sum of the two ordinary unipotent multiplicities.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use commutativity for the diagonal and change Hecke coset variables for the proper terms.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition8.5 pp615–616.)

*Needs:* [7.30 Ordinary multiplicity and local pairing](#730-ordinary-multiplicity-and-local-pairing), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.50 Supersingular inert local intersection

For E-inert and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+1)/2.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use YZZ local deformation multiplicity with its inert norm classes; the nearby j belongs to the switched algebra.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), first case pp617–618.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.35 CM multiplicity at 𝔹-split, E-nonsplit places](#735-cm-multiplicity-at-𝔹-split-e-nonsplit-places).

### 7.51 Wild-inclusive ramified local intersection

For E-ramified and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+v(Dv))/2, including wild ramification.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the c=0 multiplicity (1/2)v(Dv λ), valid with wild ramification, rather than the tame-only formula of Zhang (2001) and Yuan–Zhang–Zhang; its proof uses the canonical-lift filtration constructed in [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), second case pp617–618.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.35 CM multiplicity at 𝔹-split, E-nonsplit places](#735-cm-multiplicity-at-𝔹-split-e-nonsplit-places).

### 7.52 Diagonal-correction local coefficient

Fix (U,φ), as in (Q′) (Yuan–Zhang §7.2). For every finite place v ∉ S2 and (y,u) ∈ E_v^××F_v^×, n_(φ_v)(y,u) = φ_v(y,u)·½v(q(y)). For 𝔹_v nonsplit this is identically 0, since v(q(y)) = 0 on supp φ_v; for v nonsplit in E and 𝔹_v split it is the c ≥ 1 sum Σ_c m(y^(-1),h_c)vol(E_v^×h_cGL2(O)∩M2(O)_n); for v split it is ½(v(a)+v(d)) for y = diag(a,d). For v ∈ S2: n_(φ_v)(y,u) = −(1+N_v+N_v²)^(-1)·1_(ϖ_v^(-1)(O_(𝔹_v))_2)(y)·1_(O_(F_v)^×)(u). The ψ1 part vanishes, and the ψ2 part equals ½((1+v(a))+(1+v(d))) = 1 on its support. With Yuan–Zhang's Lemma 7.6(2) at S2, in the form stated here, c_(φ_v)(1,y,u) = −(2log N_v/(1+N_v+N_v²))ψ2(y,u), so d_(φ_v)(1,y,u) = 0 still holds there.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use the chosen order and original 𝔧_v of test-function. Outside S2, omit conductor c = 0 in the nonsplit-E/split-B sum; at division B the norm valuation vanishes on support; in the split case the shell counts give ½(v(a)+v(d)). At S2 compute each summand separately: n_(ψ1) = 0, while n_(ψ2) = ½((1+v(a))+(1+v(d))) = 1 on ψ2 support because v(a)+v(d) = 0. Thus n_φ = −ψ2/(1+N_v+N_v²), not zero. Use c_φ = −2ψ2 log N_v/(1+N_v+N_v²) = 2n_φ log N_v, and log|u q(y)| = 0 there, to obtain d_φ = 0.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(2) pp617–619.)

*Needs:* [7.30 Ordinary multiplicity and local pairing](#730-ordinary-multiplicity-and-local-pairing), [7.12 Finite local multiplicities and diagonal omission](#712-finite-local-multiplicities-and-diagonal-omission), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j), [7.10 Finite zero-term correction](#710-finite-zero-term-correction).

### 7.53 Geometric realization of extended self-intersection

Fix (B,E,U), as in (Q′) (Yuan–Zhang §7.2) with |Σ| > 1, P = [1]_U ∈ X_U(H) (H the Hilbert class field of E), w a finite place of H over v, and R = O_(H_w^ur). Let U′ = U_vU′^v, where U′^v ⊂ U^v is open, normal and small enough that X_(U′,R) is regular, E^× ∩ U′μ_U = μ_U, and Yuan–Zhang Lemma 9.5 (p. 634) holds. Let π: X_(U′,R) → X_(U,R) be the projection. Prove that every irreducible component 𝒫′ of the divisor π^*𝒫_R is the image of a section Spec R → X_(U′,R) and occurs in π^*𝒫_R with multiplicity e = [O_E^×:O_F^×]. Moreover i_w(P,P) = ī_v(P,P) = ⟨π^*𝒫_R − e𝒫′, 𝒫′⟩, a proper intersection on the special fibre of X_(U′,R). If v is split in E, both sides are 0.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Choose U′ away from v so the model is regular and E^× ∩ U′μ_U = μ_U. Since U′_v = U_v contains O_(E_v)^×, the class fields defining the CM lifts and their U-translates are unramified at w over the Hilbert class field H. Thus the lifts are H_w^ur-rational; properness extends them to sections over R. The stabilizer condition gives ramification multiplicity e in π^*𝒫_R. Use small-level diagonal vanishing, Yuan–Zhang Lemma 9.5 (p. 634) and the U/U′ projection sum, dividing by [μ_U:μ_(U′)], to obtain the proper intersection. The coarse projection need not be étale.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma9.4 pp632–635, )

*Needs:* [7.34 Extended local diagonal vanishes at small away-v level](#734-extended-local-diagonal-vanishes-at-small-away-v-level), [7.28 Diagonal coefficient and modified self-intersection](#728-diagonal-coefficient-and-modified-self-intersection), HilbertModularVarietiesAndShimuraCurves Layer R18.5, TauCetiRoadmap.StableReduction Layer 4, [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.54 Resolvent cusp expansion

At the cusp ∞, the Fourier expansion in z gives G_(N,s)(z, z′) = −(4π/(2s − 1)) E_N(z′, s) y^(1−s) + O(e^(−y)) as y = Im z → ∞; at any other cusp G_(N,s)(z, z′) = α(s) Y^(1−s) + O(e^(−Y)), Y = Im(γz) for a width-one scaling γ ∈ SL₂(ℝ): γ carries the cusp to ∞ and conjugates its effective stabilizer to {z↦z+n : n∈ℤ}. With an arbitrary scaling γ, replace the remainder by O(e^(−c_γY)) for some c_γ>0; the constant depends on its cusp width. The remainders are holomorphic near s=1 and locally uniform there, as in the source convention.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Insert the Fourier expansion of the cusp Eisenstein series into the resolvent. Separate the identity/stabilizer term; continue the remainder and its constant term to s=1.

**Checks.**

- In a width-one coordinate the first nonzero Fourier mode decays as e^(−2πY), hence is O(e^(−Y)); the stabilizer generator is translation by 1.
- Replacing that coordinate by Y=10Y₀ changes this mode to e^(−πY/5). Its ratio to e^(−Y) is e^((1−π/5)Y), which tends to infinity. The arbitrary-scaling version must retain c_γ.
- Translation of a width-one coordinate by a real constant leaves Y unchanged and preserves the decay bound; it does not introduce a new scale.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.19), p. 240.)

*Needs:* AutomorphicSpectralTheory §2.25, AutomorphicSpectralTheory §§2.23–2.24, AutomorphicSpectralTheory §§2.19–2.25.

### 7.55 Hecke Green kernel

For m ≥ 1, (m, N) = 1, name G^m_(N,s)(z, z′) := G_(N,s)(z, z′)|_(z′)T_m the Hecke-translated kernel of 7.36. Prove its matrix form ½ Σ_(a,b,c,d ∈ ℤ, N | c, ad − bc = m) g_s(z, (az′ + b)/(cz′ + d)), in which each matrix and its negative are both counted, and G¹_(N,s) = G_(N,s).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Apply the prime-to-N correspondence to the second argument of the resolvent. Pass from SL₂ matrices to their ±1 quotient, retaining the 1/2 convention.

Its API consists of the following facts:

- The determinant-m resolvent sum modulo ±1 for (m,N)=1.
- G¹_N,s=G_N,s.
- G^m_N,s=G_N,s|_(z′)T_m.
- Simultaneous Atkin–Lehner invariance.

**Checks.**

- The identity correspondence returns the original kernel.
- The factor 1/2 in the matrix sum is indispensable.
- For prime ℓ∤N the constant Hecke eigenvalue is ℓ+1, rather than 1.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.24), p. 242.)

*Needs:* AutomorphicSpectralTheory §2.25, [7.36 Hecke kernel action](#736-hecke-kernel-action).

### 7.56 Norm-one generator count

In the marked classical CM setting, with the explicit model of B, of the order R and of R𝔞 from Gross–Zagier, Chapter III, (0.5), R𝔞 is principal iff it contains b = α + βj with reduced norm Nb = Nα + pqNβ = N𝔞. If b is a generator, the ideals 𝔠 = (α)𝔡𝔞⁻¹ and 𝔠′ = (β)𝔡𝔮𝔫⁻¹𝔞̄⁻¹ are integral (0.6) and satisfy N𝔠 + pN·N𝔠′ = |D| (0.7). Putting n = pN𝔠′ and l = N𝔠 gives a solution of l + nN = |D| with n ≡ 0 (mod p) and r_A(l) ≠ 0; The converse requires actual generators α,β of the stated ideal pairs satisfying the defining lattice and congruence conditions of R𝔞; a numerical solution l+nN=|D| alone does not supply a generator. Count those admissible pairs to obtain their contribution to (0.4).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Count actual α,β in the defining lattice of R𝔞, modulo simultaneous sign, satisfying the reduced-norm equation and the ramified congruences. The norms l,n and class conditions are necessary; retain the ideal-pair and congruence data in the converse. The exceptional unit classes are counted with u=#O_K×/2, not #O_K×.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.6)–(0.7), p. 254.)

*Needs:* [7.40 Inert quaternionic order model](#740-inert-quaternionic-order-model).

### 7.57 Finite CM intersection height

In the marked classical CM setting with the Chapter III local data (L). Assume m ≥ 1 is prime to N and r_A(m) = 0. Prove that ⟨c, T_m d^σ⟩_v = −(x · T_m x^σ) log q.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Apply the regular-model local-height theorem to c and T_m d^σ. The CM component orthogonality removes the vertical correction and gives the explicit horizontal intersection formula.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, (3.3) Proposition, p. 257 (announced as (0.2), p. 252).)

*Needs:* [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves), [7.41 CM component orthogonality](#741-cm-component-orthogonality), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant).

### 7.60 Special j tangent values

Fix N = 1, so X = Y = X₀(1) and X′ = Y′. For a point x as in (8.2), modulo μ₆ (printed 'mod μ₀'): α ≡ j(x)^(2/3)(j(x) − 1728)^(1/2) if j(x) ≠ 0, 1728; α ≡ 2⁶·3⁴ if j(x) = 1728; α ≡ 2⁹·3^(3/2) if j(x) = 0. Under (H), D is odd, so j(x) = 1728, which requires D = −4, does not occur; the case is kept for the general formula of Gross–Zagier III (8.3).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Compute the leading modular discriminant/j coordinate at j=0 and j=1728. Apply the cotangent/tangent comparison of the displayed congruences, keeping the valuations at 2 and 3.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.3), p. 263.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent), [7.46 Tangent self-intersection number](#746-tangent-self-intersection-number), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

### 7.61 Inert CM Hom lattice

In the finite CM intersection setting, p inert, v | p, 𝔟 as in Eichler-order model S and Eichler's connecting-ideal theorem (as used in Gross–Zagier, III §9, equation (9.3), p. 265), 𝔞 ∈ 𝒜 (prime to p and to 𝔡). Prove that R𝔞 = {α + βj : α ∈ 𝔡^(−1)𝔞, β ∈ 𝔡^(−1)𝔮^(−1)𝔫𝔟̄𝔟^(−1)𝔞̄, α ≡ (−1)^(ord_𝔣(𝔟))β mod O_𝔣 for 𝔣 | 𝔡}. As printed this holds for 𝔟R = S𝔟; with R𝔟 = 𝔟S replace 𝔟̄𝔟^(−1) by 𝔟𝔟̄^(−1).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Choose the connecting ideal with identity 𝔟R=S𝔟. Transport the explicit reduction lattice; its anti-linear coefficient transforms by 𝔟̄/𝔟. Reversing the identity requires reversing that ratio.

Its API consists of the following facts:

- The fractional R𝔞 congruence lattice with connecting ideal chosen by 𝔟R=S𝔟.
- Its β ideal is 𝔡⁻¹𝔮⁻¹𝔫𝔟̄𝔟⁻¹𝔞̄.
- Using R𝔟=𝔟S instead replaces 𝔟 by 𝔟̄ in the formula.
- A lattice element has isogeny degree N(b)/N𝔞.

**Checks.**

- 𝔟=O recovers the simpler inert-order lattice.
- For non-ambiguous [𝔟], reversing the connecting identity while leaving 𝔟̄/𝔟 fixed changes the lattice.
- The lattice and the degree fibre are preserved under b↦−b.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.3), p. 265.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.40 Inert quaternionic order model](#740-inert-quaternionic-order-model), ComplexMultiplicationAndExplicitReciprocity §5.2 (`supersingularLevelOrderComparison`).

### 7.62 Ramified quaternionic order model

In the finite CM intersection setting, p ramified in K with prime 𝔭; f = order of [𝔭] in Cl_K. There are h/f places v | 𝔭 in H, each with q_v = p^f (printed 'residual degree p^f'). Choose a prime q with (q/p′) = (−1/p′) for all primes p′ ≠ p dividing D and (−q/p) = −1; for the order model one must also impose −q ≡ 1 (mod D/p). Prove that q = 𝔮𝔮̄ splits in K, B has Hilbert symbol (D, −q), and B = K + Kj with j² = −q. With 𝔟 normalised by 𝔟R = S𝔟 as in the printed (9.8) (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout), let 𝔞 be any nonzero fractional ideal and choose a_𝔣 generating 𝔞O_𝔣 for every 𝔣|𝔡. Then (9.8) R𝔞 = {α + βj : α ∈ 𝔭𝔡^(−1)𝔞, β ∈ 𝔭𝔡^(−1)𝔮^(−1)𝔫𝔟̄𝔟^(−1)𝔞̄, α/a_𝔣 ≡ (−1)^(ord_𝔣(𝔟))β/ā_𝔣 mod O_𝔣 for 𝔣|𝔡}. For 𝔞 prime to 𝔡 this specializes to the congruence with a_𝔣=1 (β is missing in print). Local-generator independence and transport under 𝔞↦t𝔞 are as in §7.40. The class of 𝔟 is well defined in Cl_K/[𝔭] by v. For b = α + βj ∈ R𝔞 with N(b) = m·N(𝔞) and N(b₋) ≠ 0, when α≠0, (9.9) 𝔠 = (α)𝔡𝔞^(−1) ∈ 𝒜^(−1) and 𝔠′ = (β)𝔡𝔮𝔫^(−1)𝔟̄^(−1)𝔟𝔞̄^(−1) ∈ 𝒜[𝔮𝔫^(−1)]𝔅² are integral and both divisible by 𝔭, and (9.10) N𝔠 + N·N𝔠′ = m|D|. The integer n = N𝔠′ is non-zero, with ord_p(n) = ord_p(D·N(b₋))−ord_p(N𝔞). The printed equality without the last term holds when p∤N𝔞. If α=0, 𝔠=(0) has norm zero and no ideal class; 𝔠′ remains nonzero, divisible by 𝔭, and the same norm relation holds. The α=0 endpoint is counted separately with r_A(0)=1/w.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Choose the ramified model q with −q≡1 modulo D/p and the prescribed nonsquare residue at p. Transport the connecting ideal as in the inert case, divide by the two local generators in the congruence, and form the two norm ideals, each divisible by 𝔭. The norm ideals and their classes are unchanged by (𝔞,b)↦(t𝔞,bt), since the factors (t) and (t̄) cancel in their definitions.

Its API consists of the following facts:

- The CM reduction lattice in (D,−q), with −q≡1 mod D/p and (−q/p)=−1, together with its norm-ideal map.
- N(α+βj)=Nα+qNβ.
- For α≠0 both nonzero integral ideals 𝔠,𝔠′ are divisible by 𝔭 and N𝔠+NN𝔠′=m|D|.
- h/f places, residue size p^f, f=order[𝔭].

**Checks.**

- The congruence has α≡(−1)^ord𝔣(𝔟)β; omission of β does not define the claimed lattice.
- With D=−7, N=1, p=7, q=2, 𝔞=𝔟=O and b=j, α=0, m=2, N𝔠=0 and N𝔠′=14 give 0+14=2·7. The zero ideal has no class, while its endpoint weight is 1/2.
- With D=−15,p=3,N=2,q=19,𝔟=O and 𝔞=(5), α=δ=√−15,β=0 gives α/5=δ/5 of valuation −1 at the prime over 5. Thus δ∉5R, although the untransported congruence admits it. Here (−19/3)=−1 and −19≡1 mod5.
- n=N𝔠′ is positive and divisible by p.
- For D=−7, N=1, p=7, q=2, 𝔞=(7), 𝔟=O and b=7(1+j), m=3 gives N𝔠=7 and N𝔠′=14, hence 7+14=3·7. The valuation is 1=3−2, since |D·N(b₋)|=686 and N𝔞=49; the uncorrected value 3 is false.
- For f=2 the weight is 2log p at each of h/2 places.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, pp. 266 ((9.8)–(9.10)).)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.40 Inert quaternionic order model](#740-inert-quaternionic-order-model), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

### 7.45 CM endomorphism congruence order

In the finite CM intersection setting, assume p has a unique prime factor 𝔭 in K, and let R = End_(W/π)(x) ⊂ B = K + Kj as in (7.2). Prove that for all n ≥ 1: End_(W/π^n)(x) = {b ∈ R : D·N(b₋) ≡ 0 mod p·(N𝔭)^(n−1)}.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Import the CM deformation theorem giving the endomorphism congruence filtration. Intersect its quaternionic filtration with the chosen reduction order to obtain End_(W/π^n)(x).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 1), p. 262.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.21 Supersingular Eichler realization](#721-supersingular-eichler-realization), [7.62 Ramified quaternionic order model](#762-ramified-quaternionic-order-model).

### 7.59 CM Hom quaternion realization

In the finite CM intersection setting, assume p non-split. For any ideal 𝔞 in the class 𝒜 there is an isomorphism Hom_(W/π^n)(x^σ,x) ≅ End_(W/π^n)(x)·𝔞 ⊂ B, compatible in n. If the isogeny ϕ: x^σ → x corresponds to b ∈ B, then deg ϕ = N(b)/N(𝔞). It rests on Serre's construction x^σ ≅ Hom_O(𝔞, x).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use the right ideal realizing Hom between the two CM reductions. Intersect it with the endomorphism congruence filtration and check the norm/degree ratio N(b)/N(𝔞).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 2), p. 262 (with (4.2), p. 257).)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.45 CM endomorphism congruence order](#745-cm-endomorphism-congruence-order), [7.40 Inert quaternionic order model](#740-inert-quaternionic-order-model), AbelianSchemesAndArithmeticModuli Layer A6.

### 7.24 New CM homomorphisms

In the finite CM intersection setting, for non-cuspidal W-sections y, x of X and n ≥ 1, reduction Hom_W(y, x) → Hom_(W/πⁿ)(y, x) is injective (4.5); set Hom^(new)_(W/πⁿ)(y, x) := Hom_(W/πⁿ)(y, x) ∖ (image of Hom_W(y, x)) and Aut^(new)_(W/πⁿ)(x) := Aut_(W/πⁿ)(x) ∖ Aut_W(x). For the Heegner points x, x^σ and p non-split in K, under the identification Hom_(W/πⁿ)(x^σ, x) ≅ End_(W/πⁿ)(x)·𝔞 ⊂ B of Gross–Zagier III (7.3)(2), which is 7.59, whose image of Hom_W(x^σ, x) ≅ 𝔞 lies in K, an element b is new exactly when b ∉ K, i.e. b₋ ≠ 0.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Embed the characteristic-zero Hom set into every Artinian reduction by rigidity. Take its complement; at a nonsplit CM place new maps are exactly those with nonzero quaternionic anti-linear part.

Its API consists of the following facts:

- The complement of the injective image Hom_W in Hom_(W/πⁿ), and analogously for Aut.
- The full degree-m set is the disjoint union of liftable and new maps.
- At a non-split CM place a map is new iff b₋≠0.
- The new set is empty for canonical ordinary CM lifts.

**Checks.**

- A split prime contributes no new CM maps.
- An element of K is liftable and is excluded from every valuation sum.
- b₋≠0 permits the norm valuation; b₋=0 has no finite lifting-length valuation.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, Lemma (8.2), p. 263 (Aut^(new)) and (8.4) with the following paragraph, p. 264 (Hom^(new), and the reading b₋ ≠ 0); uses (4.5), p. 258.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), AbelianSchemesAndArithmeticModuli Layer A6, [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.59 CM Hom quaternion realization](#759-cm-hom-quaternion-realization).

### 7.42 Prime-to-p Hom decomposition

In the finite CM intersection setting, assume p ∤ m. Every point y of the divisor T_m x^σ is a Heegner point over H̄ in the ideal-lattice sense of Gross, Heegner points on X₀(N), §I.2, pp. 87–88 (defined over the ring class field of its conductor, not in general over H), with End_(H̄)(y) = O_y an order in K of conductor dividing m. Each y is rational over W ⊗ ℚ_p and is the canonical lifting of its reduction. For every n ≥ 1, h_n(x^σ,x)_(deg m) = Σ_(y ∈ T_m x^σ) h_n(y,x)_(deg 1). Reason: a degree-m isogeny f: x^σ → x over W/π^n has an étale kernel, and that kernel has a unique lift C⊂x^σ over W of order m, and f induces an isomorphism x^σ_C ≅ x over W/π^n.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Separate the maps already lifting to W from the new maps. For m prime to p, use the étale kernel to identify the prime-to-p degree fibres and their stabilizer count.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §5, (5.1), p. 258.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.23 Half Hom count](#723-half-hom-count), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), AbelianSchemesAndArithmeticModuli Layer A6.

### 7.58 CM Hom intersection count

In the marked classical CM setting with the Chapter III local data (L), assume m≥1 is prime to N and r_A(m)=0. Prove that (x · T_m x^σ)=Σ_(n≥1)h_n(x^σ,x)_m=½Σ_(n≥1)Card(Hom_(W/πⁿ)(x^σ,x)_(deg m)). Assume the classical Rankin data (C) and the classical Heegner local data (H). The vanishing of r_A(m) excludes a common horizontal component; it does not exclude p∣m.

Write m=p^t r, with t≥0 and (r,p)=1. For every W-section z occurring in T_r x^σ, construct the comparison between T_(p^t)z and the marked quasi-canonical lifts of §§7.1–7.2. Here T denotes the full degree-isogeny correspondence, including noncyclic kernels, with its cycle multiplicities. For s≥0 let Y_s denote the orbit divisor obtained from a level-s lift with its special-fibre marking, summing its conjugates over W; level zero has degree one. Use a fine auxiliary level prime to Npm to perform the marked calculation, and retain the projection multiplicities when forgetting it. Distinct marked neighbours can have the same coarse point. Prove the following API (Gross–Zagier III §5, (5.2)–(5.4), p. 259):

- If p splits, T_(p^t)z=Σ_(s=0)^t Σ_(j=1)^(t−s+1)Y_(s,j), where each positive-level orbit has degree p^s−p^(s−1). If p is inert, T_(p^t)z=Σ_(0≤s≤t, s≡t mod2)Y_s, where a positive-level orbit has degree p^s+p^(s−1). If p ramifies, T_(p^t)z=Σ_(s=0)^tY_s, with degree p^s. These are marked orbit cycles with multiplicity, rather than counts of distinct coarse CM points.
- At p∤N identify the special-fibre correspondence with Σ_(i=0)^t F^(t−i)(F′)^i, where F is the p-power Frobenius correspondence and F′ its transpose. This specializes the general modular correspondence on the CM locus, retaining the cyclic N-isogeny and its transported level. Every branch y reduces to a canonical level-zero lift y₀. Inert p gives y₀=z for even t and y₀=z^(p) for odd t, where z^(p) is the canonical lift of the Frobenius-twisted diagram. Ramified p gives y₀=z for even t and y₀=z^(σ_𝔭) for odd t, with 𝔭 the prime over p and σ_𝔭 its ideal-class Artin action. In the split case the canonical lift with that reduction occurs among the level-zero terms. The case p∣N has t=0 and uses the prime-to-p comparison instead.
- On the compatible marked deformation chart over a branch's integer ring W_y, with uniformizer π_y, prove y≡y₀ modulo π_y but y≢y₀ modulo π_y² for every s≥1. Thus the canonical/quasi-canonical intersection has π_y-length one. Descend this negative congruence with the actual stabilizer factors; do not identify the branch with a W-section.
- For a finite totally ramified extension W′/W of index e, prove that pulling back both divisors multiplies their proper intersection length by e. For an orbit divisor Y whose marked field of definition is W′, prove e(x·Y)_W=Σ_τ(x_(W′)·y^τ)_(W′), summing all its conjugates with multiplicity. Apply this on the fine cover and descend by the projection formula of §7.43. In particular, e conjugate branches each of length one contribute one to (x·Y)_W, not e. Further base extension preserves this equality.

Prove that this comparison gives the following equalities, and prove the corresponding identifications of the Hom-lifting filtrations, including their converses (Gross–Zagier III §6, pp. 260–261). All sums over n start at 1, and all h_n retain the half-count convention of §7.23. The maximal lifting orders are finite: an integral degree-m map would give a horizontal component excluded by r_A(m)=0.

- For inert p and even t, (x·T_m x^σ)=Σ_n h_n(x^σ,x)_r+(t/2)h_1(x^σ,x)_r. A degree-r special-fibre map whose maximal lifting order is k acquires maximal order k+t/2 under multiplication by p^(t/2), and every degree-m map arises this way.
- For inert p and odd t, (x·T_m x^σ)=((t+1)/2)h_1(x^σ,x)_(pr). Every degree-pr special-fibre map has maximal lifting order one; multiplying by p^((t−1)/2) gives exactly the degree-m maps, each of maximal order (t+1)/2.
- For ramified p, put Z=x^σ when t is even and Z=x^(σσ_𝔭) when t is odd. Then (x·T_m x^σ)=Σ_n h_n(Z,x)_r+t h_1(Z,x)_r. Composition with the canonical ideal isogeny x^σ→Z attached to 𝔭^t, of degree p^t, identifies the special-fibre degree-r and degree-m maps and increases their maximal W/πⁿ lifting orders by t. Here ord_π(p)=2; the shift is not t/2.
- For split p both the intersection and every degree-m half Hom count vanish under r_A(m)=0. Ordinary canonical lifting identifies the integral and Artinian Hom groups; an intersecting orbit branch would force x to be its canonical reduction lift, hence a level-zero term of T_m x^σ, contradicting r_A(m)=0.

*Outline.* For t=0 combine §7.42 with §7.43. For t>0 use the full Hecke correspondence and its prime-to-p composition law to separate T_r. Identify its p-power quotient lattices and markings with the orbit divisors above, using the cyclic-isogeny deformation rings for each cyclic factor and retaining the scalar factors for noncyclic kernels. Prove the CM specialization of the Frobenius congruence and the negative congruence from the marked lift charts. Compare lengths over ramified branch fields before descending, then identify the degree fibres in both directions using the integral CM filtration of §7.2. The three splitting cases give precisely Σ_n h_n(x^σ,x)_m. This constructs the Hecke–CM comparison here from general modular geometry.

**Checks.**

- At t=0 every splitting type gives T_1z=z, an orbit of degree 1 and zero lifting-order shift. The result is the prime-to-p formula of §7.42 followed by §7.43.
- For D=−7,N=2,p=m=3 and A principal, 2 splits since −7≡1 mod8, whereas 3 is inert since −7≡2 mod3. Thus r_A(3)=0 and T_3x has one marked level-one orbit of degree 3+1=4, over a totally ramified degree-four extension. The intersection formula is ½#Hom_(W/π)(x,x)_3; it does not treat the four neighbours as W-sections. The reduction x̄ lies over j=0=1728 in characteristic 3, and its Γ₀(2)-diagram has #Aut(x̄)=4. Each of the four norm-3 elements of the order of §7.40 lifts to order exactly 1, so ½#Hom_(W/π)(x,x)_3=2 and the terms with n≥2 vanish. Gross–Zagier III (9.7) gives the same value: among n=3,6,9 only n=6 has r_A(21−2n)=r_A(9)≠0. Dividing four length-one branches by #Aut(x̄)=4 would give 1 instead.
- At inert p=3,t=2 the levels are 0 and 2, giving degree 1+(9+3)=13=σ₁(9). A cyclic-only correspondence has degree 12 and loses the scalar branch. A degree-r map of lifting order k=2 gives a degree-9r map of order 2+1=3; at t=3 a degree-3r reduced map instead has order (3+1)/2=2 after multiplication by 3.
- At split p=3,t=2 the degrees are 3·1+2·(3−1)+(9−3)=13. Omitting the multiplicities t−s+1 gives 1+2+6=9. Under r_A(m)=0 the intersection and Hom sums are both 0 despite this nonempty Hecke divisor.
- At p=3,t=1, the Frobenius graph sends a geometric point to its Frobenius image with multiplicity 1, while the transpose contributes its inverse Frobenius image with multiplicity 3. Thus the degree is 1+3=4; at t=2 it is 1+3+9=13. Replacing the transpose by an inverse graph of degree 1 would give 2 and 3 instead.
- At ramified p=3,t=1 the degrees are 1+3=4 and the canonical reduction is the 𝔭-twist. At t=2 they are 1+3+9=13; a degree-r map of order k=2 acquires order 2+2=4, whereas the inert shift would incorrectly give 3.
- At inert p=2,t=1 the marked orbit degree is 3, not 2; at t=2 it is 1+(4+2)=7. In the D=−3 unit-exception case, forgetting the marking can identify neighbours, so these are cycle degrees with multiplicity, not a count of distinct j-invariants. The fine-cover projection retains the stabilizers.
- For local equations a=0 and a=π in a fine chart, the W-intersection has length 1; over W′ with π a unit times (π′)^e it has length e. An orbit of e branches each meeting a canonical section to order one has descended length e/e=1. Identical sections have infinite local quotient length and are excluded by r_A(m)=0; no degree-zero Hom fibre is used.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, Proposition (4.4), p. 258; §5, (5.1), p. 258 and (5.2)–(5.4), p. 259; §6, Proposition (6.1), (6.2) and the inert, ramified and split comparisons, pp. 259–261.)

*Needs:* [7.23 Half Hom count](#723-half-hom-count), [7.43 Diagram isomorphism intersection count](#743-diagram-isomorphism-intersection-count), [7.42 Prime-to-p Hom decomposition](#742-prime-to-p-hom-decomposition), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), ModularCurvesPartII §§9.1–9.2 and 9.9–9.10 for the full isogeny correspondence, scalar factors and coprime composition, §§11.2, 11.5 and 12.4 for cyclic deformation rings and special-fibre Frobenius/transpose maps.

### 7.39 Degree-one CM intersection count

In the marked classical CM setting with the Chapter III local data (L). Let m = 1, v | p with p ∤ ND, and r_A(1) = 0 (σ ≠ 1, so x ≠ x^σ over H). Prove that ⟨(x) − (∞), (x^σ) − (0)⟩_v = ⟨c, d^σ⟩_v = −½ Σ_(n≥1) Card(Isom_(W/π^n)(x^σ, x)) log q_v. The sum is zero unless x and x^σ meet mod π; by Deuring's theory it is zero if p splits in K; otherwise p is inert (as p ∤ D) and log q_v = 2 log p.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* At good reduction identify degree-one diagram Hom pairs with isomorphisms. Use the source deformation-length formula, quotienting precisely by ±1 and retaining larger stabilizers.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.4) and following paragraph, p. 253.)

*Needs:* [2.5 Finite-place Néron symbol on curves](#25-finite-place-néron-symbol-on-curves), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.23 Half Hom count](#723-half-hom-count), [7.43 Diagram isomorphism intersection count](#743-diagram-isomorphism-intersection-count), [7.57 Finite CM intersection height](#757-finite-cm-intersection-height), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count).

### 7.44 Split CM intersection vanishing

In the finite CM intersection setting, if p splits in K and r_𝒜(m) = 0, then (x·T_m x^σ) = 0 at every place v | p (v ∤ N or v | N alike). Proof: Hom_(W/π^n)(x^σ,x) = Hom_W(x^σ,x) for all n ≥ 1, and this group has no element of degree m since r_𝒜(m) = 0.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use canonical ordinary CM lifting to show every reduced CM map lifts. Thus the new-map part vanishes at split p; any tangent correction is dealt with separately.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.1) Proposition, p. 261.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count).

### 7.63 CM tensor stabilizer height

Fix x, a chosen integral Γ₀(N)-diagram over the complete characteristic-zero DVR W whose section is in the smooth locus of the coarse model. Let ω_x be a nonzero rational cotangent vector, F=Frac(W), u_x=#Aut_F(x)/2, and θ a nonzero global differential tensor of weight k with order r_x at x; assume r_x+k≠0. Define C_x by the leading expansion θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k for dt_x=ω_x, and ord_(v,x)(θ) using the integral universal deformation coordinate. Prove that (x·x)_(v,ω_x)= 1/2 Σ_(n≥0)(#Aut_(W/π^(n+1))(x)−#Aut_W(x)) + [ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). The sum is finite. For θ=Δ, k=6, u_x=1 and v∤N the tensor-corrected eta intersection equals the new-automorphism sum; at elliptic points and v|N retain the displayed correction.

Assume Chosen actual integral diagram and formally smooth one-dimensional deformation ring R₀=W[[T₀]]. Finite effective stabilizer G=Aut_k(x)/±1 acts faithfully; invariant ring is the coarse completed local ring; x is smooth there.

*Outline.* First reduce to one cotangent. Replacing ω_x by cω_x lowers the left side by ord_v(c), by the tangent scaling law of 7.46. It lowers the right side by the same amount: C_x is multiplied by c^(−r_x−k) (the API below), while u_x, ord_(v,x)(θ) and the automorphism sum do not depend on ω_x (Conrad, proof of Theorem 9.2, conrad line 2538). Form the invariant coordinate T_x=Norm_G(T₀)=Π_g[g](T₀). A g lifts to W/π^(n+1) precisely when the constant term of [g](T₀) is divisible by π^(n+1); the finite automorphism sum is ord_v(b_x) for T_x=b_xT₀^(u_x)+…. Take ω_x=dT_x, so t_x=T_x (conrad line 2604). In this normalization substitute T_x into θ and compare leading coefficients: ord_(v,x)(θ)=ord_v(C_x u_x^k)+(r_x+k)ord_v(b_x) (conrad line 2611). This equality needs ω_x∈W^×·dT_x: for ω_x=c·dT_x with c∈F^×, ord_v C_x moves by −(r_x+k)ord_v(c), while b_x and ord_(v,x)(θ) stay fixed, so it holds exactly when c is a unit of W. With ω_x=dT_x the self-intersection is 0, and the right side is ord_v(b_x)−ord_v(b_x)=0. Transport back to the given ω_x by the first step. For Δ, apply the extra integral leading coefficient rather than deleting it at small residue characteristics.

*Consequences.* At u_x=1,v∤N the eta correction recovers the historical half automorphism sum. At u_x>1 the u_x^k and tensor order terms must be retained. Scaling ω by c changes the self-intersection by −ord_v(c).

Its leading-coefficient API consists of the following facts:

- The chosen rational cotangent determines the first nonzero coefficient C_x of the differential tensor.
- Multiplication of the tensor by a nonzero scalar multiplies C_x and its integral leading lattice by the same scalar.
- A cotangent change ω_x↦aω_x multiplies C_x by a^(−r_x−k), so its valuation correction changes by −ord_v(a).

**Checks.**

- For k=6, r_x=0 and primitive integral tensor data, the correction is 0/6=0.
- Multiplying the tensor by π adds 1 to both numerator valuations, so the correction changes by (1−1)/6=0.
- Replacing a cotangent by π times itself changes C_x by π⁻⁶ when r_x=0,k=6; the correction changes by −6/6=−1. The dual tangent scales by π⁻¹, with the same self-intersection change.
- Take u_x=1, r_x=0, k=6 and ord_v(b_x)=1. With ω_x=dT_x the leading-coefficient identity gives ord_(v,x)(θ)=ord_v(C_x)+6, so the right side is 1+(−6)/6=0, which is the self-intersection of an integral tangent basis. With ω_x=π dT_x, ord_v C_x drops by 6 while b_x and ord_(v,x)(θ) are unchanged. The identity is then off by 6, and both sides of the theorem equal −1. Applying the identity to ω_x=π dT_x would make the bracket −6·ord_v(b_x) for every cotangent, so the right side would be 0, contradicting the left side −1.


([Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf), author final copy §9 Theorem9.2, (9.5)–(9.10), pp.38–40 (published pp.123–126); [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Published MSRI 49 (2004), §9, Theorem 9.2, pp. 123–125; Definition 9.5, pp. 126–127.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), AbelianSchemesAndArithmeticModuli Layer A6, [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.46 Tangent self-intersection number](#746-tangent-self-intersection-number), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 7.65 Full local decomposition of the height series

With the full Colmez setting and the two auxiliary split-place conditions, prove Z(g,(t₁,t₂),φ)_U=−∑_(v nonsplit in E)(log N_v)⨍_(C_U)M_φ^(v)(g,(tt₁,tt₂))dt−∑_(v finite)N_φ^(v)(g,(t₁,t₂))log N_v−∑_(v finite)j_v(Z_*(g,φ)t₁,t₂)log N_v−i₀(t₂,t₂)Ω_φ(g,(t₁,t₂))/[E×∩U:μ_U]. At real v use log N_v=1. Set i₀=i−∑_v i_v log N_v, where i_v is the normalized C_U average of the extended local horizontal pairing. The local M and N functions are those already constructed for each place type; N is invariant under diagonal C_U translation. Before imposing auxiliary degeneracy, the first weakly admissible Hodge pairing additionally contains −½[F:ℚ]E*(0,g,r(t₁,t₂)φ), and the other three Hodge terms must be retained. These disappear under the specified two-place hypotheses; a single auxiliary condition does not justify dropping them.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Expand the four weakly admissible Hodge pairings coefficientwise over a permitted field, normalized by its degree over F. Retain the archimedean j-part −½[F:ℚ]E*(0,g,r(t₁,t₂)φ). The condition S² at the two auxiliary split places annihilates this nonconstant Eisenstein term and the Hodge cross terms. Then assemble the stated local M, N, finite vertical j and modified self-term expression, with normalized C_U averages.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Theorem8.6 pp616–617; [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §4.4, Theorem 4.3 and Remark 4.4, pp. 68–69.)

*Needs:* [7.48 Archimedean proper-height expression](#748-archimedean-proper-height-expression), [7.29 Nonsplit proper-height expression](#729-nonsplit-proper-height-expression), [7.49 Split proper height and zero extended diagonal](#749-split-proper-height-and-zero-extended-diagonal), [7.28 Diagonal coefficient and modified self-intersection](#728-diagonal-coefficient-and-modified-self-intersection), [6.9 Two auxiliary split places](#69-two-auxiliary-split-places), [6.52 Hodge-class terms vanish and the height series splits into horizontal and vertical parts](#652-hodge-class-terms-vanish-and-the-height-series-splits-into-horizontal-and-vertical-parts), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.66 Split diagonal cancellation

For split finite v, with the chosen order and original 𝔧_v of test-function, d_φ(1,y,u) = −log|d_v q(𝔧_v)| φ_v(y,u). At v ∉ S2 use the usual local-n and c-finite formulas. At v ∈ S2 one has c_φ = 2n_φ log N_v, log|u q(y)| = 0 on support, q(𝔧_v) = −1 and |d_v| = 1, so both sides are zero.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* For v ∉ S2, n_φ = ½v(q(y))φ_v, c_φ = φ_v log|d_v q(𝔧_v)|, and u is a unit on support. Substitute in d_φ = 2n_φ log N_v − c_φ + log|u q(y)|φ_v (p. 626). Since log|q(y)| = −v(q(y))log N_v, the valuation terms cancel, leaving −c_φ. At S2 use the separate formulas n_φ = −ψ2/(1+N_v+N_v²), c_φ = 2n_φ log N_v and log|u q(y)| = 0. With the same d_φ convention as Yuan–Zhang Proposition 9.2 (p. 628), the two correction contributions cancel, giving d_φ = 0. The different is a unit since F_v/Q_p is unramified, and the original 𝔧_v has norm −1. Never replace the S2 computation by the usual valuation formula.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition9.2(2) p628.)

*Needs:* [7.52 Diagonal-correction local coefficient](#752-diagonal-correction-local-coefficient), [7.10 Finite zero-term correction](#710-finite-zero-term-correction), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.67 Finite adjunction lattice identity

For the residue image N at a finite place w, Nw contains OHw and length(Nw/OHw)=iw(P,P)/e.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Pull to the small-level regular model; compare π*O(P/e)|P' with O(P')|P', take the ideal of π*P/e−P', and apply the proper intersection formula.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2 pp633–634.)

*Needs:* [7.53 Geometric realization of extended self-intersection](#753-geometric-realization-of-extended-self-intersection), [2.14 Residue-normalized adjunction line](#214-residue-normalized-adjunction-line), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.69 Atkin–Lehner kernel invariance

For every d ‖ N: G^m_(N,s)(w_d z, w_d z′) = G^m_(N,s)(z, z′) (in particular for m = 1), because g_s(γz, γz′) = g_s(z, z′) for γ ∈ SL₂(ℝ) and w_d normalises {γ ∈ R_N : det γ = m}; compatible with the invariance of the height pairing under automorphisms.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Conjugate the determinant-m matrix set by the chosen Atkin–Lehner involution. The reindexing preserves the kernel and both CM inputs.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.25), p. 242.)

*Needs:* [7.55 Hecke Green kernel](#755-hecke-green-kernel), ModularCurvesPartII §§9.3–9.4 and 13.2–13.4.

### 7.70 CM kernel invariants

In the classical CM setting, for m ≥ 1, (m, N) = 1, 𝒜 ∈ Cl_K with r_𝒜(m) = 0 (r_𝒜(k) = number of integral ideals of norm k in 𝒜), and τ_(𝒜ᵢ,𝔫) as in §2.15 (Gross–Zagier II §1, equations (1.4)–(1.5)): the values G^m_(N,s)(τ_(𝒜₁,𝔫), τ_(𝒜₂,𝔫)) with 𝒜₁𝒜₂⁻¹ = 𝒜 (3.1); γ^m_(N,s)(𝒜; 𝔅) = Σ_(𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅) G^m_(N,s)(τ_(𝒜₁,𝔫), τ_(𝒜₂,𝔫)) (3.2); γ^m_(N,s)(𝒜) = Σ_(𝒜₁𝒜₂⁻¹ = 𝒜) G^m_(N,s)(τ_(𝒜₁,𝔫), τ_(𝒜₂,𝔫)) = Σ_(𝔅 ∈ Cl_K) γ^m_(N,s)(𝒜; 𝔅) (3.3). Because σ_𝒜 maps τ_(𝒜₁,𝔫) to τ_(𝒜₁𝒜⁻¹,𝔫) and Gal(H/K) permutes the archimedean places of H simply transitively, (3.3) with Proposition (2.23) computes Σ_(v|∞) ⟨c, T_m d^σ⟩_v (c = (x) − (∞), d = (x) − (0)); r_𝒜(m) = 0 is needed for (3.1) to be defined (x ∉ T_m x^σ).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Form the finite class-pair sums of the off-diagonal Hecke kernel. Apply ideal change and Atkin–Lehner reindexing to prove that the choice of norm-N ideal does not affect them.

Its API consists of the following facts:

- The class-pair sums γ^m_N,s(A;B) and their B-sum γ^m_N,s(A), with r_A(m)=0.
- Σ_B γ(A;B)=γ(A).
- Changing the primitive norm-N ideal leaves γ(A;B) unchanged.
- γ(A;B)=0 unless {A}={B𝔫}.

**Checks.**

- For prime |D| each nonempty refined sum has one class pair.
- A wrong genus has an empty sum.
- If r_A(m)>0, use the diagonal finite-part kernel instead of this off-diagonal definition.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.1)–(3.3), pp. 242–243.)

*Needs:* [7.55 Hecke Green kernel](#755-hecke-green-kernel), [6.28 CM Hecke disjointness criterion](#628-cm-hecke-disjointness-criterion), [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant).

### 7.72 Inert disjoint intersection formula

In the finite CM intersection setting, assume r_𝒜(m) = 0, p inert in K, v | p (so v ∤ N), and 𝔞 ∈ 𝒜 prime to p (implicit in the source). Prove that q_v = p² and (x·T_m x^σ) = Σ_(b ∈ R𝔞/±1, N(b) = m·N(𝔞)) ½(1 + ord_p N(b₋)), with R = End_(W/π)(x). For p ∤ D, ord_p N(b₋) is always odd.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use the Hom realization and inert lifting length (ord_p N(b₋)+1)/2. Sum only b₋≠0 and then divide by the ±1 action.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 1), p. 262.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count), [7.59 CM Hom quaternion realization](#759-cm-hom-quaternion-realization), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

### 7.73 Ramified disjoint intersection formula

In the finite CM intersection setting, assume r_𝒜(m) = 0, p ramified in K with prime 𝔭, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit in the source). Prove that q_v = p^k with k the order of [𝔭] in Cl_K, and (x·T_m x^σ) = Σ_(b ∈ R𝔞/±1, N(b) = m·N(𝔞)) ord_p(D·N(b₋)).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use the ramified lifting length ord_p(D·N(b₋)), including the different contribution. The disjoint-support hypothesis excludes b₋=0, so this valuation is finite. Sum the new maps and retain the residue degree and ramified local correction.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 2), p. 262.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count), [7.59 CM Hom quaternion realization](#759-cm-hom-quaternion-realization), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration).

### 7.74 New automorphism length

For a chosen integral Γ₀(N)-diagram x in the smooth coarse locus, assume v∤N and u_x=#Aut_F(x)/2=1 (a non-elliptic point). With the eta-normalized cotangent of the tangent-symbol construction and α as in Chapter III (8.1), ord_v(α)=1/2 Σ_(n≥1)(#Aut_(W/π^n)(x)−#Aut_W(x))=1/2 Σ_(n≥1)#Aut^new_(W/π^n)(x). The sum is finite. Its value is zero exactly when the eta tangent is integral primitive, equivalently no new automorphisms occur at any level. Elliptic points and level primes use [7.63 CM tensor stabilizer height](#763-cm-tensor-stabilizer-height) with its nonzero tensor correction; this specialization makes no blanket assertion for them.

Assume W is the complete characteristic-zero DVR with uniformizer π and normalized ord_v; x is an actual chosen integral cyclic N-isogeny diagram, with smooth section in the coarse model; v∤N and the effective stabilizer u_x equals one; the differential is the specified eta-normalized branch.

*Outline.* Apply cmTensor_stabilizer_height with θ=Δ and k=6. In the non-elliptic, prime-to-N case specialize the tensor correction to zero; for elliptic and level places compute and retain it before the global product-formula cancellation.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.2) Lemma, p. 263.)

*Needs:* [7.46 Tangent self-intersection number](#746-tangent-self-intersection-number), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), [7.2 CM lifts and the integral endomorphism filtration](#72-cm-lifts-and-the-integral-endomorphism-filtration), [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.63 CM tensor stabilizer height](#763-cm-tensor-stabilizer-height).

### 7.75 Inert norm-ideal map

In the finite CM intersection setting, p inert. For b = α + βj ∈ R𝔞 with (9.4) N(b) = N(α) + pq·N(β) = m·N(𝔞) and N(b₋) = pq·N(β) ≠ 0, define, with 𝔟 normalised as in the printed (9.3), i.e. 𝔟R = S𝔟 (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout), the integral ideals (9.5) 𝔠 = (α)𝔡𝔞^(−1) and 𝔠′ = (β)𝔡𝔮𝔫^(−1)𝔟̄^(−1)𝔟𝔞̄^(−1). For α≠0 (and β≠0 by b₋≠0), prove that 𝔠 ∈ 𝒜^(−1) and 𝔠′ ∈ 𝒜𝔅²[𝔮𝔫^(−1)], and (9.6) N𝔠 + N·p·N𝔠′ = m|D|. When α=0 retain N𝔠=0 and the same norm relation, but assign no ideal class to the zero ideal 𝔠. Count this endpoint separately with r_A(0)=1/w; it is allowed when N=1. The integer n = p·N𝔠′ is non-zero and ord_p(n) = ord_p(N b₋)−ord_p(N𝔞); for p∤N𝔞 this is ord_p(N b₋). δ(n) = Π_(l | (n,D)) 2 as in Ch. II (3.15).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Multiply α and β by the indicated different and fractional ideals to obtain integral ideals 𝔠 and 𝔠′. Take ideal norms, and take the class of 𝔠 only when α≠0: N𝔠+NpN𝔠′=m|D|; prime-to-p N𝔞 gives the valuation equality.

Its API consists of the following facts:

- From b=α+βj with N(b)=mN𝔞 and b₋≠0 form the two integral ideals 𝔠,𝔠′ of (9.5).
- For α≠0, [𝔠]=A⁻¹; for every β≠0, [𝔠′]=AB²[𝔮𝔫⁻¹] in the printed connecting convention.
- N𝔠+NpN𝔠′=m|D|.
- For p∤N𝔞, ord_p(pN𝔠′)=ord_p N(b₋).

**Checks.**

- b₋≠0 implies N𝔠′>0, so the finite sum excludes n=0.
- For D=−7, N=1, p=3, q=23, 𝔞=𝔟=O and b=j, α=0 and β=1 give m=69, N𝔠=0 and N𝔠′=161: 0+3·161=69·7. The class [𝔠] is undefined; its endpoint weight is r_A(0)=1/2.
- b and −b produce the same ideal pair.
- If p|N𝔞 the valuation equality requires the extra ord_p(N𝔞), so the prime-to-p hypothesis cannot be dropped.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.4)–(9.6), p. 265.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.61 Inert CM Hom lattice](#761-inert-cm-hom-lattice).

### 7.76 Modified CM intersection pairing

For chosen integral Γ₀(N)-diagrams with sections in the smooth coarse locus over a complete characteristic-zero DVR W, put W_n=W/π^(n+1). Define I_v^GZ(x,x)=½Σ_(n≥0)(#Aut_(W_n)(x)−#Aut_W(x)). For distinct generic sections use their ordinary local intersection number, and extend additively to a Hecke divisor. This is a modified pairing: for a rational cotangent ω_x, a differential tensor θ of weight k, r_x=ord_x(θ)≠−k, and θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k with dt_x=ω_x, I_(v,ω_x)(x,T_m x^σ)=I_v^GZ(x,T_m x^σ)+r_A(m)[ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). Here u_x=#Aut_(Frac(W))(x)/2 is the generic stabilizer, and ord_(v,x)(θ) uses the universal deformation coordinate. The automorphism sum is finite. Its equality with an eta-normalized self-intersection requires the separate non-elliptic prime-to-level specialization.

Assume W is a complete characteristic-zero DVR with algebraically closed residue field; the diagrams are chosen over W and their sections lie in the relative smooth coarse locus. For the comparison, k is an integer, θ is a nonzero differential tensor with r_x+k≠0, and ω_x is a nonzero rational cotangent. For a Hecke divisor, use the classical Heegner hypotheses, gcd(m,N)=1 and multiplicity r_A(m) at x.

*Outline.* Subtract precisely the automorphisms lifting to W at each nilpotent level; rigidity and the stabilizer-norm calculation give finite support. Use the ordinary intersection on each distinct section and the defined self-term on the diagonal. Apply cmTensor_stabilizer_height to the diagonal multiplicity r_A(m); no correction occurs on distinct sections.

Its API consists of the following facts:

- The additive CM intersection pairing using the finite new-automorphism sum on the diagonal.
- For distinct generic sections the modified value equals the ordinary local intersection number.
- On (x,x) the value is one half the sum of #Aut(W_n)−#Aut(W).
- The second divisor argument is additive, so its diagonal contribution is its multiplicity at x times the self-term.
- The cotangent pairing differs by the displayed r_A(m) tensor correction with denominator r_x+k.

**Checks.**

- If every reduction automorphism lifts to W, the modified self-value is zero.
- If #Aut(W_0)−#Aut(W)=2 and all later differences vanish, the self-value is 1, rather than 2.
- For u_x=1, k=6, r_x=0, ord_v(C_x)=0 and ord_(v,x)(θ)=6, the cotangent self-value is the modified value minus 1; identifying the two pairings fails.

*Consequences.* Keep the generic stabilizer distinct from the larger special-fiber automorphism group.

([Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §9, (9.9)–(9.12), printed pp.126–127.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count), [7.63 CM tensor stabilizer height](#763-cm-tensor-stabilizer-height).

### 7.77 Analytic–arithmetic difference is a finite pseudo-theta sum

For (Q′) data, archimedean K−M=0; at finite nonsplit v, k−m logq extends to Schwartz; dφ=2nφ logq−cφ+(2logδ+log|uqy|)rφ extends to Schwartz on E. All but finitely many local differences vanish identically.

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Use Yuan–Zhang's Lemmas 7.4, 7.6 and 8.7 and unramified Iwasawa covariance; combine with the vertical nonsingular series.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1 pp625–627.)

*Needs:* [7.26 Inert logarithmic singularity and diagonal extension](#726-inert-logarithmic-singularity-and-diagonal-extension), [7.27 Ramified logarithmic singularity and diagonal extension](#727-ramified-logarithmic-singularity-and-diagonal-extension), [7.10 Finite zero-term correction](#710-finite-zero-term-correction), [7.52 Diagonal-correction local coefficient](#752-diagonal-correction-local-coefficient), [7.32 Vertical correction is nonsingular pseudo-theta](#732-vertical-correction-is-nonsingular-pseudo-theta), [6.56 Projected derivative decomposition](#656-projected-derivative-decomposition), [7.65 Full local decomposition of the height series](#765-full-local-decomposition-of-the-height-series), [7.48 Archimedean proper-height expression](#748-archimedean-proper-height-expression), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.78 Arithmetic adjunction for the CM point

For compact (Q′) data, i0(P,P)/[OE*:OF*]=−h_LU(P).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Sum finite residue-lattice lengths and archimedean norms; the arithmetic degree of the residue-normalized line gives the identity.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Theorem9.3 pp629–635.)

*Needs:* [7.33 Archimedean adjunction constant](#733-archimedean-adjunction-constant), [7.67 Finite adjunction lattice identity](#767-finite-adjunction-lattice-identity), [2.1 Global arithmetic intersection on curves](#21-global-arithmetic-intersection-on-curves), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.79 Modular Green constant

For N > 1: lim_(s→1)[4πE_N(w_N z, s) + κ_N/(s−1)] = κ_N log y + λ_N + O(e^(−y)) (y = Im z → ∞), with λ_N = lim_(s→1)[4πN^(−s)φ(s) ∏_(p|N) (1 − p^(−2s+1))/(1 − p^(−2s)) + κ_N/(s−1)] = κ_N[log N + 2 log 2 − 2γ + 2(ζ′/ζ)(2) − 2Σ_(p|N) p log p/(p² − 1)], γ Euler's constant; also lim_(s→1)[4πE_N(z′, s)(1 − y^(1−s)/(2s−1))] = −κ_N(log y + 2).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Before constructing §7.68, extract the constant term of the cusp Eisenstein series. Its Γ and quadratic Euler-factor logarithmic derivatives give the stated λ_N and fix the additive Green constant.

**Checks.**

- At N=2 the index is 3 and κ₂=−4. The bracket defining λ₂ becomes (5/3)log 2−2γ+2ζ′(2)/ζ(2), since 3log 2−(4/3)log 2=(5/3)log 2.
- The two finite cusp contributions are κ_N log y+λ_N and −κ_N(log y+2); their sum is λ_N−2κ_N. Adding C=2κ_N−λ_N gives zero at ∞.
- Replacing C by C+1 changes that cusp limit to 1, although κ_N−κ_N−κ_N+κ_N remains zero. Residue cancellation alone does not normalize the kernel.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.21), p. 241.)

*Needs:* AutomorphicSpectralTheory §§2.19–2.25 for the continued Eisenstein family, [7.54 Resolvent cusp expansion](#754-resolvent-cusp-expansion).

### 7.68 Marked modular Green kernel

Fix N > 1. G(z, z′) = lim_(s→1)[G_(N,s)(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] + C with C = 2κ_N − λ_N (λ_N the constant of Gross–Zagier, Chapter II, (2.21)). It satisfies (2.3a)–(2.3d) (Green's-function description of the height symbol (2.2), (2.3)), tends to 0 as z → ∞, and G(z, z′) = G(w_N z′, w_N z) (2.20); the pole cancels since the residues are κ_N − κ_N − κ_N + κ_N.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct. Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Cancel the four residues κ−κ−κ+κ. Check the marked squared-log singularities and harmonicity; choose C=2κ_N−λ_N to obtain the zero limit at ∞.

Its API consists of the following facts:

- The constant Laurent coefficient of G_N,s+4πE_N(w_Nz,s)+4πE_N(z′,s)+κ_N/(s−1), plus 2κ_N−λ_N.
- The value tends to zero as z→∞ with z′ fixed.
- Harmonic away from marked points and diagonal, with the stated squared-log singularities.
- G(z,z′)=G(w_Nz′,w_Nz).

**Checks.**

- The four residues sum κ−κ−κ+κ=0.
- Subtracting only κ/(s−1) leaves Laplacian κ rather than zero.
- N=1 makes 0 and ∞ coincide and does not satisfy the two-marked-point construction.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.15), (2.20), pp. 239–241.)

*Needs:* [7.17 Marked Green height characterization](#717-marked-green-height-characterization), AutomorphicSpectralTheory §2.25, AutomorphicSpectralTheory §§2.23–2.24, [7.54 Resolvent cusp expansion](#754-resolvent-cusp-expansion), [7.79 Modular Green constant](#779-modular-green-constant).

### 7.80 CM genus-orbit count

(3.1) depends on 𝔫, but γ^m_(N,s)(𝒜; 𝔅) does not: w_d (d ‖ N) replaces (𝒜₁, 𝒜₂, 𝔫) by (𝒜₁[𝔡]⁻¹, 𝒜₂[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄) (Actions of c, Gal(H/K) and W on Heegner points), leaving 𝒜₁𝒜₂⁻¹ and 𝒜₁𝒜₂[𝔫]⁻¹ unchanged, and G^m_(N,s) is w_d-invariant (2.25). The sum (3.2) has 2^(t−1) terms if {𝒜} = {𝔅𝔫} and is empty otherwise ({𝒜} = genus = class of 𝒜 in Cl_K/Cl_K² ≅ (ℤ/2ℤ)^(t−1)); all 𝔫 of norm N lie in one genus; if D is prime (|Cl_K| odd) the sum has one term.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Use the genus quotient of the ideal-class group to classify admissible pairs. Fix A₁A₂⁻¹ = A and A₁A₂[𝔫]⁻¹ = B. Substitution gives A₂² = B[𝔫]A⁻¹. A nonempty fibre of squaring is a torsor under Cl(K)[2], of cardinality 2^(t−1); it is not a fibre of the genus quotient, whose cardinality is h/2^(t−1).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, p. 243.)

*Needs:* [7.70 CM kernel invariants](#770-cm-kernel-invariants), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant).

### 7.81 Hyperbolic norm parameter

Fix τ₁, τ₂, Heegner points with the same 𝔫, roots of A_iτ_i² + B_iτ_i + C_i = 0 as in (1.4) with the same β. For γ = (a b; c d) ∈ R_N with det γ = m > 0: g_s(γτ₁, τ₂) = −2Q_(s−1)(1 + |γτ₁ − τ₂|²/(2 Im(γτ₁) Im τ₂)) = −2Q_(s−1)(1 + 2nN/(|D| det γ)) with n = (A₁A₂/N)|cτ₁τ₂ + dτ₂ − aτ₁ − b|² (3.4), and n = (1/N)[c²C₁C₂ + ad(D − B₁B₂)/2 − bc(D + B₁B₂)/2 + a²C₁A₂ + d²A₁C₂ − cdB₁C₂ + acC₁B₂ + b²A₁A₂ + bdA₁B₂ − abB₁A₂] ∈ ℤ (Gross–Zagier II (3.5), with the coefficients displayed here). Summing over γ gives the representation-count expansion of G^m_(N,s), which is 7.88. As a matrix-identity check outside the standing odd-discriminant arithmetic range, take N = 1, D = −4, τ₁ = τ₂ = i: n = a² + b² + c² + d² − 2(ad − bc), (a − d)² + (b + c)² = n, (a + d)² + (b − c)² = n + 4m.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Express the hyperbolic distance invariant by the norm of the corresponding quadratic pair. Check both positive norm contributions and the determinant relation before substituting in Q_(s−1).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.4), (3.5), p. 244.)

*Needs:* [7.70 CM kernel invariants](#770-cm-kernel-invariants).

### 7.82 Renormalized resolvent self-value

For z∈ℍ and Re(s)>1, define g_s(z) := lim_(w→z) (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²) = −log|2π (z − z̄) η(z)⁴|² + 2 Γ′/Γ(s) − 2 Γ′/Γ(1).

Assume the classical Rankin data (C) and the classical Heegner local data (H). The local expression continues to s=1 and elsewhere only where its meromorphic continuation is regular.

*Outline.* Before constructing §7.71, use the local Legendre-Q asymptotic at t=1 and subtract the eta-normalized logarithmic singularity of §7.20. Start with the real near-one asymptotic supplied by AutomorphicSpectralTheory §0.38; its integral in §0.35 gives the complex-parameter continuation on Re(s)>1. This calculation involves the local kernel g_s alone, without a global diagonal resolvent.

**Checks.**

- At s=1 the two digamma terms cancel, giving −log|2π(z−z̄)η(z)⁴|².
- At s=2, Γ′/Γ(2)−Γ′/Γ(1)=1, so g₂(z)−g₁(z)=2; reversing the digamma sign gives −2.
- Replacing the subtracted tangent factor by twice itself reduces the finite part by log 4; the prescribed factor 2πiη(z)⁴ excludes this rescaling.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, p. 251.)

*Needs:* AutomorphicSpectralTheory §§0.35, 0.37–0.38 for the local Legendre-Q kernel and its diagonal asymptotic, [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent).

### 7.71 Diagonal Green finite part

For all z, z′ ∈ 𝔥 (previously defined only for z ∉ T_m z′): G^m_(N,s)(z, z′) := Σ_(γ ∈ R_N/±1, det γ = m, γz′ ≠ z) g_s(z, γz′) + Σ_(γ ∈ R_N/±1, det γ = m, γz′ = z) lim_(w→z) (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²). With this definition (5.6) is literally the formula of Proposition (2.23); the second sum equals a·g_s(z), a = #{γ ∈ R_N/±1 : det γ = m, γz′ = z} (= u r_A(m) for z, z′ over x, x^σ), g_s(z) the renormalized self-value of [7.82 Renormalized resolvent self-value](#782-renormalized-resolvent-self-value).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Form the off-diagonal sum initially for Re(s)>1, and use Laurent continuation at s=1.

*Outline.* Use the ordinary resolvent off T_m and define the diagonal term by its eta-normalized local finite part. Count the determinant-m diagonal matrices modulo ±1 as u r_A(m).

Its API consists of the following facts:

- Use g_s off the determinant-m diagonal and its eta-normalized finite part on that diagonal.
- Agrees with G^m_N,s off T_m.
- For CM inputs the diagonal coefficient is u r_A(m).
- The extended kernel has the Laurent pole and tangent-height comparison of the disjoint case.

**Checks.**

- If r_A(m)=0 no finite-part term occurs.
- For D=−3, m=1 and σ=1, there are three stabilizer terms modulo ±1.
- Deleting all diagonal terms loses u r_A(m)g_s(z), even though the remaining sum converges for Re s>1.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.7) and the paragraph after it, p. 251.)

*Needs:* [7.55 Hecke Green kernel](#755-hecke-green-kernel), [7.82 Renormalized resolvent self-value](#782-renormalized-resolvent-self-value), [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent).

### 7.83 New Hom intersection formula

In the finite CM intersection setting, allow r_𝒜(m) ≠ 0, with (x·x) defined by (8.1). Using I_v^GZ of [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing), for every generic stabilizer u and v ∤ mN, I_v^GZ(x,T_m x^σ) = ½ Σ_(n≥1) #Hom^(new)_(W/π^n)(x^σ,x)_(deg m). Consequently the quaternionic formulas (7.4) remain true when p is non-split, provided the sum runs only over b ∈ R𝔞 with b ∉ K, i.e. b₋ ≠ 0; this is needed for the terms ord_p(Nb₋) to make sense. For u=1 and v∤N this also equals the eta-normalized pairing. In all other cases compare to a cotangent pairing by its explicit tensor correction.

Assume the classical Rankin data (C) and the classical Heegner local data (H). The displayed count uses the modified pairing I_v^GZ. Equality with the eta-normalized self-pairing is asserted only for u=1 and v∤N.

*Outline.* Separate the lifted diagonal from new homomorphisms. Use the modified automorphism self-term on the diagonal and the ordinary Hom count on distinct sections; Conrad (10.3) then applies for every generic stabilizer. Specialize the tensor correction only in the non-elliptic prime-to-level case.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.4), p. 264; [Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf), §9 (9.9)–(9.11), and §10 (10.2)–(10.3), author-copy pp.40–43; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §10, (10.2)–(10.3), pp.130–131.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.58 CM Hom intersection count](#758-cm-hom-intersection-count), [7.24 New CM homomorphisms](#724-new-cm-homomorphisms), [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

### 7.84 Inert unit-orbit count

Standing notation (Ch. III) with N > 1, p inert in K, the auxiliary prime q chosen with −pq ≡ 1 (mod D) and 𝔞 ∈ 𝒜 prime to pD. Let 𝔠 ∈ 𝒜^(−1) and 𝔠′ be integral ideals with 𝔠′ in the class 𝒜[𝔮𝔫^(−1)]𝔅² for some 𝔅 ∈ Cl_K, with N𝔠 + N·p·N𝔠′ = m|D| and n = p·N𝔠′ > 0. Reversing (9.5) determines α, β up to units of O; integrality of N(α) + pqN(β) = m·N𝔞 forces α ≡ ±β mod O_𝔣 for every prime 𝔣 | 𝔡, and the resulting b = α + βj lie in R_(v′)𝔞 for places v′ | p in one Gal(H/K)-orbit. Each such pair contributes exactly u²·δ(n) elements b ∈ ⊔_(v|p) R_v𝔞/±1 (printed '2·u²·δ(n)'), each of weight ½(1 + ord_p N(b₋)) = ½·ord_p(pn) in Σ_(v|p)(x·T_m x^σ)_v; summing over pairs and over 𝔅 gives the second term of (9.7).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* For each norm-ideal pair count the unit generators and ramified congruence choices. Quotient once by the simultaneous sign; this yields u²δ(n), not the printed doubled coefficient.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, proof of Proposition (9.7), p. 266.)

*Needs:* [7.75 Inert norm-ideal map](#775-inert-norm-ideal-map), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 7.85 Tensor-normalized local-to-global CM height

For the classical Heegner data over H, choose a nonzero global differential tensor θ of weight k, r_x=ord_x(θ)≠−k and u_x the generic stabilizer. At each complex place choose a lift z_v to the upper half-plane and an analytic parameter g_(z_v) for which the pulled-back θ has leading coefficient 1. Prove that ⟨c,T_m d^σ⟩=−Σ_(v finite)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(θ)/(r_x+k)]log q_v+Σ_(v complex)lim_(y_v→z_v)[⟨c_(y_v),T_m d^σ⟩_v−u_x r_A(m)log|g_(z_v)(y_v)|_v]. Complex absolute values are squared. For θ=Δ and k=6, r_x+6=6/u_x, ord_(v,x)(Δ)=6ord_v(𝔫̄), and one may take g_(z_v)(z)=(2πi)η⁴(z_v)(z−z_v). Thus the finite terms use I_v^GZ−u_x r_A(m)ord_v(𝔫̄), and the archimedean terms are exactly the eta-normalized limits in Chapter II §5. Each individual finite term need not equal the local symbol for an independently chosen global cotangent.

Assume the classical Heegner local data (H). Use one global θ with r_x+k≠0 and the associated fractional ideal with valuations ord_(v,x)(θ); analytic parameters have leading coefficient 1 for its pullback. For the Δ specialization, 𝔫 kills the level subgroup, (N)=𝔫𝔫̄; use the connected/étale orientation of [7.22 CM level reduction component](#722-cm-level-reduction-component). N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Apply the tensor correction at every finite place, and express the remaining ideal contribution as r_A(m)log Norm(a_θ)/(r_x+k). Pull θ to the universal upper-half-plane family. Its order is u_x r_x+k(u_x−1); normalizing the leading coefficient changes the complex tangent logarithm by the global scalar C_x u_x^k. The product formula cancels that scalar across all places; the fractional ideal leaves the displayed finite correction. For Δ, its pullback is ((2πi)η⁴(z)dz)^⊗6, so its analytic order is zero and r_x+6=6/u_x. Use the Kodaira–Spencer isomorphism away from level primes and on the connected level branch. On the étale branch the Serre–Tate coordinate satisfies 1+T=(1+T′)^(p^e), giving ord_(v,x)(Δ)=6ord_v(𝔫̄).

*Consequences.* At u_x=3 one has r_x+6=2, not 6; at v|𝔫̄ the finite correction is u_x r_A(m)ord_v(N). For r_A(m)=0 the tensor correction vanishes and the ordinary disjoint local-symbol decomposition is recovered.

([Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem9.6, (9.16)–(9.18), pp.129–130; Lemma10.1 and its proof, pp.131–133; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter II §5, (5.3)–(5.5), pp.250–251.)

*Needs:* [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing), [7.63 CM tensor stabilizer height](#763-cm-tensor-stabilizer-height), [7.37 Tangent product formula](#737-tangent-product-formula), [7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent), [7.22 CM level reduction component](#722-cm-level-reduction-component), `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`.

### 7.86 Nonsplit diagonal cancellation

Fix v, finite and nonsplit in E, with (U,φ,𝗃_v,j_v) as in (Q′) (Yuan–Zhang §7.2). For (y,u) ∈ E_v×F_v^×: 2k_(φ_v)(1,y,u) − 2m_(φ_v)(y,u)log N_v + d_(φ_v)(1,y,u) = −log|d_vq(𝗃_v)|_v·φ_v(y,u). Here k_(φ_v)(1,·) − m_(φ_v)·log N_v is the Schwartz extension from B(v)_v−E_v to B(v)_v×F_v^× of Lemmas 7.4 and 8.7, evaluated on E_v, and d_(φ_v)(1,y,u) = 2n_(φ_v)(y,u)log N_v − c_(φ_v)(1,y,u) + log|uq(y)|_vφ_v(y,u).

Assume the CM quaternionic data (Q) and the Colmez computation data (Q′).

*Outline.* Insert inert or ramified singularity-subtracted restrictions. In the ramified case α cancels and the remaining v(Dv) term cancels the geometric multiplicity correction.

([On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1, Proposition 9.2(1), pp. 627–628.)

*Needs:* [7.77 Analytic–arithmetic difference is a finite pseudo-theta sum](#777-analyticarithmetic-difference-is-a-finite-pseudo-theta-sum), [7.51 Wild-inclusive ramified local intersection](#751-wild-inclusive-ramified-local-intersection), [7.50 Supersingular inert local intersection](#750-supersingular-inert-local-intersection), [7.31 Superspecial local intersection](#731-superspecial-local-intersection), [6.21 Special test function and integral j](#621-special-test-function-and-integral-j).

### 7.87 Archimedean modular height formula

Fix N > 1 and x, x′ distinct non-cuspidal points of X₀(N)(ℂ), represented by z, z′ ∈ 𝔥. Prove that ⟨(x) − (∞), (x′) − (0)⟩_ℂ = lim_(s→1)[G_(N,s)(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] − λ_N + 2κ_N, with G_(N,s), E_N, κ_N, λ_N as in (2.10), (2.14), (2.13), (2.21).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct. Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Contract the marked Green kernel with the disjoint degree-zero divisors. The Eisenstein and scalar terms disappear by degree zero; compare with the squared-norm local symbol.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.22) Proposition, p. 241.)

*Needs:* [2.11 Squared-norm complex height symbol](#211-squared-norm-complex-height-symbol), [7.68 Marked modular Green kernel](#768-marked-modular-green-kernel), [7.79 Modular Green constant](#779-modular-green-constant).

### 7.88 Quadratic-pair representation count

Fix 𝒜₁, 𝒜₂ ∈ Cl_K, 𝔫 primitive of norm N, 𝔞ᵢ ∈ 𝒜ᵢ integral with 𝔫 | 𝔞ᵢ, N(𝔞ᵢ) = Aᵢ, and — a hypothesis the source leaves implicit — 𝔞₁, 𝔞₂ prime to D; τ_(𝒜ᵢ,𝔫) the roots attached to 𝔞ᵢ by (1.4)–(1.5). Prove that for m ∈ ℕ (with (m, N) = 1) and r_(𝒜₁𝒜₂⁻¹)(m) = 0: G^m_(N,s)(τ_(𝒜₁,𝔫), τ_(𝒜₂,𝔫)) = −2 Σ_(n≥1) ρ^m(n) Q_(s−1)(1 + 2nN/(m|D|)), ρ^m(n) = ρ^m_(𝒜₁,𝒜₂,𝔫)(n) = #{(α, β) ∈ (𝔞₁⁻¹𝔞̄₂⁻¹ × 𝔞₁⁻¹𝔞₂⁻¹𝔫)/{±1} : N(α) = (Nn + m|D|)/(A₁A₂), N(β) = Nn/(A₁A₂), A₁A₂α ≡ A₁A₂β (mod 𝔡)}, 𝔡 = (√D) the different. The bijection is γ ↦ (α, β), α = cτ₁τ̄₂ + dτ̄₂ − aτ₁ − b, β = cτ₁τ₂ + dτ₂ − aτ₁ − b (3.6), with α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹, β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 (3.7), l = A₁A₂N(α), n = N⁻¹A₁A₂N(β) ∈ ℤ (3.8), l − Nn = |D| det γ (3.9), A₁A₂α ≡ A₁A₂β (mod 𝔡) (3.10); the inverse is cτ₁ + d = (A₂/√D)(β − α), aτ₁ + b = (A₂/√D)(τ̄₂β − τ₂α). (r_(𝒜₁𝒜₂⁻¹)(m) = 0 ensures n > 0.)

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Pass from lattice pairs to integral ideal pairs and their generators. Separate the unit orbits from the ramified congruence choices.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.6)–(3.11) Proposition, pp. 244–245.)

*Needs:* [7.81 Hyperbolic norm parameter](#781-hyperbolic-norm-parameter), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 7.89 Inert total intersection formula

In the finite CM intersection setting, assume v ∤ N, p inert in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit in the source). Prove that I_v^GZ(x,T_m x^σ) = Σ_(b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0) ½(1 + ord_p N(b₋)) + ½·u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

*Outline.* Use the modified new-Hom formula and the inert lifting/Hecke calculation. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 1), p. 264; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(1), pp.134–139.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.83 New Hom intersection formula](#783-new-hom-intersection-formula), [7.72 Inert disjoint intersection formula](#772-inert-disjoint-intersection-formula), [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

### 7.90 Ramified total intersection formula

In the finite CM intersection setting, assume v ∤ N, p ramified in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit in the source). Prove that I_v^GZ(x,T_m x^σ) = Σ_(b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0) ord_p(D·N(b₋)) + u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

*Outline.* Use the modified new-Hom formula and the ramified lifting/Hecke calculation. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 2), p. 264; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(2), pp.134–139.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.83 New Hom intersection formula](#783-new-hom-intersection-formula), [7.73 Ramified disjoint intersection formula](#773-ramified-disjoint-intersection-formula), [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

### 7.91 Split total intersection formula

In the finite CM intersection setting, assume v ∤ N, p = 𝔭𝔭̄ split in K, v | 𝔭. Prove that I_v^GZ(x,T_m x^σ) = u·r_𝒜(m)·k_𝔭, where k_𝔭 ≥ 0 and k_𝔭 + k_𝔭̄ = ord_𝔭(m) (printed with subscript 𝔭; equal to ord_p(m) since p splits). The k_𝔭 need not be integers: by Conrad (10.8), printed p.139, u·r_𝒜(m)·k_𝔭 = u·κ_𝔭 with κ_𝔭 = Σ_𝔟 ord_𝔭(𝔟) over the integral ideals 𝔟 of norm m in 𝒜^(−1), so dividing the integer κ_𝔭 by r_𝒜(m), when r_𝒜(m)>0, may give a noninteger. When r_𝒜(m)=0, both κ values and the intersection vanish; use the intrinsic κ formula below, without defining k by 0/0. Conrad's form: I_v^GZ(x,T_m x^σ) = u·κ_𝔭 with κ_𝔭, κ_𝔭̄ ∈ ℤ≥0 intrinsic to 𝔭, 𝔭̄ and κ_𝔭 + κ_𝔭̄ = r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

*Outline.* Use the modified new-Hom formula and the split lifting/Hecke calculation. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 3), p. 264; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(3), pp.134–139.)

*Needs:* [7.3 Hom of actual integral CM isogeny diagrams](#73-hom-of-actual-integral-cm-isogeny-diagrams), [7.44 Split CM intersection vanishing](#744-split-cm-intersection-vanishing), [7.60 Special j tangent values](#760-special-j-tangent-values), [7.83 New Hom intersection formula](#783-new-hom-intersection-formula), [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing).

### 7.92 Level intersection formula

In the finite CM intersection setting, assume v|N, so p splits in K and p∤m. Put J_v=I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6). Prove that J_v=0 for v|𝔫 and J_v=−u r_A(m)ord_p(N) for v|𝔫̄. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). This is the finite contribution in [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height), rather than an equality between the modified and arbitrary cotangent pairings.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* The Serre–Tate canonical lift at a split level prime has no new automorphisms; its modified self-value vanishes. Compute the connected and étale level branches using Lemma10.1, then insert the discriminant correction into J_v.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.6) Proposition, p. 264; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Lemma10.1 and Theorem10.4, pp.131–134.)

*Needs:* [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing), [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height), [7.22 CM level reduction component](#722-cm-level-reduction-component).

### 7.93 Rational-prime CM height sum

For the classical Heegner data, define the tensor-normalized contribution at a rational prime p by ⟨c,T_m d^σ⟩_p^Δ=−Σ_(v|p)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6)]log q_v. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). Combine this finite sum with the eta-normalized complex contribution through [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height). For disjoint divisors r_A(m)=0 it is the ordinary sum of local symbols; for a diagonal at an exceptional CM point it is a redistribution of cotangent local symbols, not their uncorrected sum for an arbitrary tangent.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Use the Δ specialization of the tensor global decomposition. Group its finite contributions by rational p and use log q_v=f_v log p. Keep the paired eta normalization at infinity; an independently chosen cotangent sum may have additional scalar terms at p.

Its API consists of the following facts:

- The finite sum of modified CM intersections minus the discriminant tensor correction, weighted by −log q_v.
- Each summand uses log q_v=f_vlog p.
- Reindexing the places by Gal(H/K) does not change the sum.
- The finite Δ-normalized contribution is Σ_p cmPrimeHeightSum, with finite support; its eta-normalized archimedean partner gives the global height.
- If r_A(m)=0, this contribution equals Σ_(v|p)⟨c,T_m d^σ⟩_v for the ordinary local symbols.

**Checks.**

- For inert p, each q_v=p² and there are h places of H above p.
- If [𝔭] has order f, there are h/f places and each log q_v=f log p.
- p^f is the residue cardinality, not the residue degree f.
- At a place v|𝔫̄ with u=3, r_A(m)=1 and ord_v(N)=1, the tensor correction contributes +3log q_v to the height sum, not +log q_v.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.1), p. 264; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), (9.18), p.130; TheoremA.1 and (A.9)–(A.10), pp.139–140.)

*Needs:* [7.76 Modified CM intersection pairing](#776-modified-cm-intersection-pairing), [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height), [7.57 Finite CM intersection height](#757-finite-cm-intersection-height), [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions).

### 7.94 Hecke archimedean height formula

Fix N > 1, m ≥ 1, (m, N) = 1, x, x′ ∈ X₀(N)(ℂ) non-cuspidal with x ∉ T_m x′, represented by z, z′. Prove that ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = lim_(s→1)[G^m_(N,s)(z, z′) + 4πσ₁(m)E_N(w_N z, s) + 4πm^s σ_(1−2s)(m)E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)λ_N + 2σ₁(m)κ_N, σ_ν(m) = Σ_(d|m) d^ν.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct. Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Use the disjointness criterion and the Hecke kernel action. Contract with c and T_m d^σ, retaining the σ₁(m) cusp terms.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.23) Proposition, p. 242.)

*Needs:* [7.87 Archimedean modular height formula](#787-archimedean-modular-height-formula), [7.55 Hecke Green kernel](#755-hecke-green-kernel), [6.28 CM Hecke disjointness criterion](#628-cm-hecke-disjointness-criterion).

### 7.95 Ramified-congruence pair count

If n ≡ 0 (mod D) (in the setting of Gross–Zagier, Chapter II, Proposition (3.11), where ρ^m counts pairs (α, β)): ρ^m_(𝒜₁,𝒜₂,𝔫)(n) = ½ #{α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹ : N(α) = l/(A₁A₂)} · #{β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 : N(β) = Nn/(A₁A₂)} = 2u² r_(𝒜₁𝒜₂⁻¹)(l) r_(𝒜₁𝒜₂[𝔫]⁻¹)(n), l = Nn + m|D|, u = ½#𝒪^×.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* At each l|D compare the two congruence classes of generators. A factor 2 occurs exactly when l divides the relevant norm index; multiply the independent local counts.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.12), p. 246.)

*Needs:* [7.88 Quadratic-pair representation count](#788-quadratic-pair-representation-count), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 7.96 Diagonal archimedean CM formula

In the marked classical CM setting, let v be a complex place of H and z, z′ ∈ 𝔥 points mapping to x, x^σ. With R_N = {(a b; c d) ∈ M₂(ℤ) : N | c}, g_s(z, z′) = −2Q_(s−1)(1 + |z − z′|²/(2 Im z Im z′)) (2.9), κ_N, λ_N as in (2.13), (2.21): ⟨c, T_m d^σ⟩_v = lim_(s→1) [Σ_(γ ∈ R_N/±1, det γ = m, γz′ ≠ z) g_s(z, γz′) + 4πσ₁(m) E_N(w_N z, s) + u r_A(m) lim_(w→z) {g_s(z, w) − log|2πi η⁴(z)(w − z)|_v} + 4π m^s σ_(1−2s)(m) E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)(λ_N − 2κ_N) [the source prints '−σ₁(m)(λ_N + 2κ_N)']. The number of γ ∈ R_N/±1 of determinant m with γz′ = z is u r_A(m).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Apply the preceding local asymptotic to each occurrence of x in T_mx^σ. Combine the disjoint terms with r_A(m) copies of the tangent finite part.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.6), p. 251.)

*Needs:* [7.38 Complex tangent asymptotic](#738-complex-tangent-asymptotic), [7.87 Archimedean modular height formula](#787-archimedean-modular-height-formula), [7.55 Hecke Green kernel](#755-hecke-green-kernel).

### 7.97 Split-prime height sum

In the marked finite CM intersection setting, if p splits in K, then ⟨c, T_m d^σ⟩_p^Δ = −u·r_𝒜(m)·h·ord_p(m/N)·log p. The value is the Δ-normalized contribution. At p∤N use κ_𝔭+κ_𝔭̄=r_A(m)ord_p(m); at p|N the discriminant correction produces the N term. The residue-weighted place sum above either split prime is h log p.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Combine the split total intersection and level terms. The global tensor decomposition combines the modified intersection with its discriminant correction, giving the claimed p-height.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.2) Proposition, p. 265; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), TheoremA.1, p.139.)

*Needs:* [7.93 Rational-prime CM height sum](#793-rational-prime-cm-height-sum), [7.91 Split total intersection formula](#791-split-total-intersection-formula), [7.92 Level intersection formula](#792-level-intersection-formula), [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height).

### 7.98 Inert-prime height sum

In the marked finite CM intersection setting, if p is inert in K (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_(0 < n < m|D|/N, n ≡ 0 (mod p)) ord_p(pn)·r_𝒜(m|D| − nN)·δ(n)·R_({𝒜𝔮𝔫})(n/p). Here δ(n) = 2^(#{primes l | (n,D)}), R_({𝒞})(k) is the number of integral ideals of norm k in the genus of 𝒞 (Ch. II (3.17)), and 𝔮 | q is the auxiliary prime of [7.40 Inert quaternionic order model](#740-inert-quaternionic-order-model). The value does not depend on the choice of q, of 𝔮 | q, or of 𝔫 versus 𝔫̄.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Use the u²δ(n) count of preimages of each norm-ideal pair. Multiply by the inert half-valuation length, reindex n=pN𝔠′>0 and sum the residue-weighted places.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.7) Proposition, p. 266; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253 (proved as the r_A(m) = 0 case of Proposition (9.7), p. 266); [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), (A.9)–(A.10), p.140; Theorem A.17, pp.156–161.)

*Needs:* [7.93 Rational-prime CM height sum](#793-rational-prime-cm-height-sum), [7.89 Inert total intersection formula](#789-inert-total-intersection-formula), [7.92 Level intersection formula](#792-level-intersection-formula), [7.75 Inert norm-ideal map](#775-inert-norm-ideal-map), [7.84 Inert unit-orbit count](#784-inert-unit-orbit-count), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height).

### 7.99 Ramified-prime height sum

In the marked finite CM intersection setting, if p is ramified in K with prime 𝔭 (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_(0 < n < m|D|/N, n ≡ 0 (mod p)) ord_p(n)·r_𝒜(m|D| − nN)·δ(n)·R_({𝒜𝔮𝔭𝔫})(n/p), with δ and R as in [7.98 Inert-prime height sum](#798-inert-prime-height-sum) and 𝔮 the auxiliary prime of the ramified-case model of Gross–Zagier, Chapter III, (9.8)–(9.10), p. 266 (q, B = (D, −q), R𝔞 and the ideals 𝔠, 𝔠′).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Apply the ramified norm-ideal count and lifting valuation to n=N𝔠′>0. There are h/f places with q_v=p^f; their aggregate log weight is h log p.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.11) Proposition, p. 267; [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem A.20, p.162.)

*Needs:* [7.93 Rational-prime CM height sum](#793-rational-prime-cm-height-sum), [7.90 Ramified total intersection formula](#790-ramified-total-intersection-formula), [7.92 Level intersection formula](#792-level-intersection-formula), [7.62 Ramified quaternionic order model](#762-ramified-quaternionic-order-model), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height).

### 7.100 Prime-discriminant pair count

If |D| is prime (in the setting of Gross–Zagier, Chapter II, Proposition (3.11), where ρ^m counts pairs (α, β)): ρ^m_(𝒜₁,𝒜₂,𝔫)(n) = u² r_(𝒜₁𝒜₂⁻¹)(nN + m|D|) r_(𝒜₁𝒜₂[𝔫]⁻¹)(n) × (1 if D ∤ n, 2 if D | n); for D ∤ n exactly one of (α, β), (α, −β) satisfies the congruence (a quadratic residue mod D has exactly two square roots).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Specialize the ramified-congruence count to a prime discriminant. Use the single genus and retain the exceptional u=3 unit factor.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.13), p. 246.)

*Needs:* [7.95 Ramified-congruence pair count](#795-ramified-congruence-pair-count).

### 7.101 Genus pair count

D arbitrary (standing hypotheses), 𝒜, 𝔅 ∈ Cl_K, r_𝒜(m) = 0: Σ_(𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅) ρ^m_(𝒜₁,𝒜₂,𝔫)(n) = u² δ(n) r_𝒜(nN + m|D|) r_𝔅(n) if {𝒜} = {𝔅𝔫}, and 0 otherwise, where δ(n) = ∏_(p|(n,D)) 2 (3.15) and {𝒜}, {𝔅𝔫} are the genera of 𝒜 and 𝔅[𝔫]. Proof: the other terms come from 𝔞ᵢ ↦ 𝔞ᵢ𝔠 with 𝔠² = (γ₀), (α, β) ↦ (α/N(𝔠), β/γ₀); the 2^(t−1) classes [𝔠] ∈ Cl_K[2] correspond to ±r (mod D) with r² ≡ 1 (mod D).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Apply the genus norm criterion to the ideal pair. Combine the local congruence factors with the unit count; wrong-genus pairs contribute zero.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.14), (3.15), pp. 246–247.)

*Needs:* [7.95 Ramified-congruence pair count](#795-ramified-congruence-pair-count), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 7.102 Total finite CM height formula

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. Combining Chap. III Props. (9.2), (9.7), (9.11) over all p and Chap. IV Prop. (4.6)(b): for (m, N) = 1, <c, T_m d^σ>_finite^Δ = −u² Σ_(0<n≤m|D|/N) σ′_𝒜(n) r_𝒜(m|D| − nN) + hu r_𝒜(m) log(N/m), where σ′_𝒜(n) = Σ_(d|n) ε_𝒜(n, d) log(n/d²). The finite superscript Δ means the sum over p of the contributions of [7.93 Rational-prime CM height sum](#793-rational-prime-cm-height-sum), with their discriminant correction; its archimedean partner uses the eta-normalized limit in [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height).

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Add the split-zero, inert and ramified prime height sums with finite support. Use the single-prime logarithm coefficient identity to express their total by the source σ′ sum.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 307 (second display).)

*Needs:* [7.97 Split-prime height sum](#797-split-prime-height-sum), [7.98 Inert-prime height sum](#798-inert-prime-height-sum), [7.99 Ramified-prime height sum](#799-ramified-prime-height-sum), [7.93 Rational-prime CM height sum](#793-rational-prime-cm-height-sum), [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height), [6.54 Logarithmic prime decomposition](#654-logarithmic-prime-decomposition), [6.60 Single-prime logarithm criterion](#660-single-prime-logarithm-criterion).

### 7.103 Genus kernel evaluation

In the classical CM setting, for m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_(N,s)(𝒜; 𝔅) = −2u² Σ_(n≥1) δ(n) r_𝒜(nN + m|D|) r_𝔅(n) Q_(s−1)(1 + 2nN/(m|D|)) if {𝒜} = {𝔅𝔫}, and γ^m_(N,s)(𝒜; 𝔅) = 0 otherwise (δ(n) as in (3.15)).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Insert the quadratic-pair count in the locally uniformly convergent resolvent sum. Regroup by the positive norm index and apply the source Legendre kernel argument.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.16) Proposition, p. 247.)

*Needs:* [7.70 CM kernel invariants](#770-cm-kernel-invariants), [7.101 Genus pair count](#7101-genus-pair-count).

### 7.104 CM orbit kernel evaluation

In the classical CM setting, for m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_(N,s)(𝒜) = −2u² Σ_(n≥1) δ(n) R_({𝒜𝔫})(n) r_𝒜(nN + m|D|) Q_(s−1)(1 + 2nN/(m|D|)), where R_({𝒜𝔫})(n) is the count of norm-n integral ideals belonging to that genus {𝒜𝔫}.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Sum the refined genus formula over B. Use the genus fibre count and finite class-group orthogonality.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.17) Corollary, p. 247.)

*Needs:* [7.80 CM genus-orbit count](#780-cm-genus-orbit-count), [7.103 Genus kernel evaluation](#7103-genus-kernel-evaluation).

### 7.105 Genus-character filter

R_({𝒜𝔫})(n) is either R(n) or 0, where R(n) = Σ_(𝒜 ∈ Cl_K) r_𝒜(n) = Σ_(d|n) (D/d) is the number of integral ideals of norm n. If (n, D) = 1 then R_({𝒜𝔫})(n) may be replaced by R(n) in (3.17) (r_𝒜(nN + m|D|) ≠ 0 ⇒ (A(nN + m|D|)/p) = 1 ∀p | D ⇒ (AN·n/p) = 1 ∀p | D ⇒ R_({𝒜𝔫})(n) = R(n), A any integer prime to D that is a norm from the genus {𝒜}); in general δ(n)R_({𝒜𝔫})(n)r_𝒜(nN + m|D|) may be replaced by ∏_(p|(n,D)) (1 + ε̂_p((nN + m|D|)/(nN))) · R(n) r_𝒜(nN + m|D|), where ε̂_p is the character of the group of norms of fractional ideals with ε̂_p(N𝔞) = 1 for 𝔞 principal and ε̂_p(n) = (n/p) for n ∈ ℤ, p ∤ n.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Multiply by the genus character and sum over A. Use quadratic character orthogonality and the class-independent term to obtain the displayed filter.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §3, p. 247.)

*Needs:* [7.103 Genus kernel evaluation](#7103-genus-kernel-evaluation), AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25.

### 7.106 Self-value CM orbit sum

Σ_(A∈Cl_K) g_s(τ_A) = 2h[Γ′/Γ(s) + Γ′/Γ(1) − log 2π] + lim_(σ→1) [(2u/π)|D|^(σ/2) ζ_K(σ) − 2h/(σ − 1)] = 2h[Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|].

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Sum the renormalized self values over the CM orbit. Use the ideal-pair calculation and CM Eisenstein evaluation on the diagonal contribution.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, §5, first display, p. 252.)

*Needs:* [7.82 Renormalized resolvent self-value](#782-renormalized-resolvent-self-value), [7.103 Genus kernel evaluation](#7103-genus-kernel-evaluation), [7.18 CM Eisenstein sum](#718-cm-eisenstein-sum).

### 7.107 Disjoint archimedean CM formula

In the marked classical CM setting, let x ∈ X₀(N) be a Heegner point for the full ring of integers of K, c = (x) − (∞), d = (x) − (0), σ ∈ Gal(H/K), m ∈ ℕ prime to N, and A ∈ Cl_K the ideal class corresponding to σ under the Artin isomorphism. Assume that no norm-m integral ideal belongs to A. Prove that ⟨c, T_m d^σ⟩_∞ = lim_(s→1) [γ^m_(N,s)(A) − h σ₁(m) κ_N/(s − 1)] + h κ_N [σ₁(m)(log(N/|D|) + 2 Σ_(p|N) log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_(d|m) d log(m/d²)], where γ^m_(N,s)(A) is the invariant (3.3) (evaluated in Corollary (3.17)), κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N^(−1) Π_(p|N)(1 + 1/p)^(−1) (2.13), and L(s, ε) is the L-function of K.

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct. Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.

*Outline.* Insert the genus/orbit kernel formula and CM Eisenstein evaluation into the disjoint height formula. Take the Laurent constant at s=1, retaining the cancelled pole and logarithmic derivative.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, (4.2) Proposition, p. 249 (derivation pp. 248–249).)

*Needs:* [7.94 Hecke archimedean height formula](#794-hecke-archimedean-height-formula), [7.104 CM orbit kernel evaluation](#7104-cm-orbit-kernel-evaluation), [2.15 Archimedean CM height sum](#215-archimedean-cm-height-sum), [7.18 CM Eisenstein sum](#718-cm-eisenstein-sum).

### 7.108 Total archimedean CM formula

In the marked classical CM setting, Proposition (4.2) of Gross–Zagier, Chapter II (the archimedean contribution when r_A(m) = 0, [7.107 Disjoint archimedean CM formula](#7107-disjoint-archimedean-cm-formula)), remains true when m is the norm of an ideal in A, provided that the local symbols ⟨c, T_m d^σ⟩_v (v | ∞) in the definition of ⟨c, T_m d^σ⟩_∞ are defined by (5.3) with the normalized uniformizer g of (5.4) ([7.20 Eta-normalized CM tangent](#720-eta-normalized-cm-tangent)), and γ^m_(N,s)(A) is defined by (3.3) with G^m_(N,s) as in (5.7). This invariant is then γ^m_(N,s)(A) = (expression in Corollary (3.17)) + 2h u r_A(m) (Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|).

Assume the classical Rankin data (C) and the classical Heegner local data (H). Assume also that N>1 where the marked cusps 0 and ∞ must be distinct.

*Outline.* Add the disjoint and diagonal formulas with their tangent asymptotics. Use the global tangent product formula to eliminate dependence on the one global branch choice.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter II, (5.8) Proposition, p. 252.)

*Needs:* [7.107 Disjoint archimedean CM formula](#7107-disjoint-archimedean-cm-formula), [7.96 Diagonal archimedean CM formula](#796-diagonal-archimedean-cm-formula), [7.106 Self-value CM orbit sum](#7106-self-value-cm-orbit-sum), [7.37 Tangent product formula](#737-tangent-product-formula).

### 7.109 Global-local archimedean comparison

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. For (m, N) = 1, <c, T_m d^σ> = Σ_v <c, T_m d^σ>_v over places v of H (Néron local symbols; when |c| ∩ |T_m d^σ| ≠ ∅, i.e. r_𝒜(m) ≠ 0, defined as in Chap. II §5). By Chap. II Props. (4.2), (5.8) and Chap. IV Prop. (4.6)(a): Σ_(v|∞) <c, T_m d^σ>_v = lim_(s→1)[−2u² Σ_(n≥1) σ_𝒜(−n) r_𝒜(m|D| + nN) Q_(s−1)(1 + 2nN/(m|D|)) − hκσ₁(m)/(s − 1)] + hκ[σ₁(m)(log(N/|D|) + 2Σ_(p|N) log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_(d|m) d log(m/d²)] + hu r_𝒜(m)[2(L′/L)(1, ε) − 2γ − 2 log 2π + log|D|], with σ_𝒜(n) = Σ_(d|n) ε_𝒜(n, d) (ε_𝒜(n,d) ∈ {0, 1, −1} as in Chap. IV Prop. (3.2)), κ = κ_N = −12/(N ∏_(p|N)(1 + 1/p)), σ₁(m) = Σ_(d|m) d. This archimedean contribution uses the Δ/eta analytic parameters of [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height) and is paired with the finite superscript Δ contribution.

Assume the classical Rankin data (C) and the classical Heegner local data (H).

*Outline.* Translate the local modular height sum into the field-relative canonical pairing. Separate the complex norm, unit index and degree-of-field factors before comparing coefficients.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), published Invent. Math. 84 (1986), Chapter V, §1, pp. 306-307 (first display on p. 307).)

*Needs:* [7.108 Total archimedean CM formula](#7108-total-archimedean-cm-formula), [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), [7.85 Tensor-normalized local-to-global CM height](#785-tensor-normalized-local-to-global-cm-height), [6.46 Genus sigma identity](#646-genus-sigma-identity).

### Examples

For D=−7 and inert p=3, the order presentation with α≡β needs pq≡−1 mod 7: q=23 works, q=11 does not. For a CM point with u=3, the half-new-automorphism term and tensor intersection differ before their tangent correction is applied. A negative product of finite Weil indices makes the weight-one constant negative but still nonzero.

### Dependencies

HilbertModularVarietiesAndShimuraCurves R18.2.6, R18.2.8–R18.2.10, R18.5.3, R18.5.15 and R18.5.20–R18.5.21 within their separate integral/generic domains, extended to principal level in 7.46a; ModularCurvesPartII §§4.1–4.8, 5.1–5.3 and 5.15; LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 (when [F:ℚ] > 1; ModularCurves Layer 7F ST-2 and ST-4 when F = ℚ, with AbelianSchemesAndArithmeticModuli A4.9 for false elliptic surfaces); SerreWeightAndLevelOptimisation §2.6 (Deuring–Eichler supersingular comparison); PELModuli M2.9; TauCetiRoadmap.StableReduction Layers 4–5 and 7; Earlier layers 0a, 0, 2, 4, 5, 6. The direct external interfaces used above are AutomorphicSpectralTheory §§0.35, 0.37–0.38, Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`, TauCetiRoadmap.ModularCurves Layer 7F, TauCetiRoadmap.StableReduction Layer 4, AbelianSchemesAndArithmeticModuli A1.2, AbelianSchemesAndArithmeticModuli A4.10 (`SerreTate.homCriterion`), AbelianSchemesAndArithmeticModuli Layer A6, AnalyticNumberTheoryPartI §§2.8, 2.10 and 2.25, AutomorphicSpectralTheory §2.25, AutomorphicSpectralTheory §§2.23–2.24, AutomorphicSpectralTheory §§2.19–2.25, ComplexMultiplicationAndExplicitReciprocity §5.2 (`supersingularLevelOrderComparison`), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), Mathlib `NumberField.prod_abs_eq_one`, MetaplecticAutomorphicForms §5.9 (`extendedSchwartzWeil`), `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, HilbertModularVarietiesAndShimuraCurves R18.2.6, HilbertModularVarietiesAndShimuraCurves R18.5.15, HilbertModularVarietiesAndShimuraCurves Layer R18.5, MetaplecticAutomorphicForms §5.9, MetaplecticAutomorphicForms Layer 5, MetaplecticAutomorphicForms §6.15, `ModularCurvesPartII:§§2.1–2.3`, `ModularCurvesPartII:§§4.1–4.8`, `ModularCurvesPartII:§§5.1–5.3`, ModularCurvesPartII §§7.3–7.4, 9 and 13.2–13.4, ModularCurvesPartII §§7.5–7.6 and 13.2–13.4; §§9.1–9.2, 9.9–9.10, 11.2, 11.5 and 12.4 for the Hecke–CM comparison of §7.58. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 8: Global Gross–Zagier formulas

The local calculations yield a projected kernel comparison. Character sums, spectral decomposition and explicit test vectors then turn that comparison into global height formulas, including their zero and nonzero cases. Sections are listed in dependency order and are cited by their numbers, so the numbers do not always increase down the page.

### 8.2 The χ-isotypic Mordell–Weil space A(χ)

The finite-representation adapters the inverse-character submodule, the finite character sum and the probability average use a finite abelian G, a field L and an L-linear representation. The finite character sum Σ_σ χ(σ)σx is defined for every L and lies in the inverse-character eigenspace; the probability average (1/#G)Σ_σ χ(σ)σx is defined only when #G is invertible in L, and only then is it an idempotent projector onto that eigenspace. Bilinearity gives the inverse-square pairing identity for the character sums for every finite G. The inverse-character submodule itself is defined without a finiteness assumption. The arithmetic interpretation below uses a number field L, hence characteristic zero. Here χ is the Galois-side character χ_G (or its pullback along arithmetic Artin); a torus character is transported by 0a.4 before using this adapter.

Fix F, a totally real field, K/F a totally imaginary quadratic extension, A/F a simple abelian variety of strict GL(2)-type with M = End⁰(A) a field, L a finite extension of M and χ : K^× \ 𝔸_K^× → L^× a Hecke character of finite order. Put A(K^ab)_ℚ = A(K^ab) ⊗_ℤ ℚ, an M-module through End⁰(A), and let 𝔸_K^× act on A(K^ab)_ℚ ⊗_M L through the reciprocity map t ↦ σ_t (Layer 0's convention). Define A(χ) = {x ∈ A(K^ab)_ℚ ⊗_M L : σ_t x = χ(t)^(-1) x for all t ∈ 𝔸_K^×}; the exponent is fixed so that the χ-Heegner point P_χ(f) = ∫ f(P)^(σ_t) χ(t) dt lies in A(χ), as in YZZ Thm. 1.2, where P_χ(f1) ∈ A(χ) is paired with P_(χ^(-1))(f2) ∈ A^∨(χ^(-1)). If χ factors through Gal(H/K) for a finite abelian H/K, then A(χ) is the image of the idempotent e_χ = [H:K]^(-1) Σ_(σ ∈ Gal(H/K)) χ(σ) σ on A(H)_ℚ ⊗_M L, and it is a finite-dimensional L-vector space.

Assume A simple of strict GL(2)-type over F, M = End⁰(A) a field (YZZ Sec. 1.2.3. CST §1.2); χ of finite order with values in L ⊇ M; the reciprocity convention is Layer 0's (arithmetic Frobenius), and changing it replaces A(χ) by A(χ^(-1)). For F = ℚ use the supplied ring-class fields and the comparisons of 0a.1; for general F only a finite abelian H/K through which χ factors is used. Finite dimensionality uses the Mordell–Weil theorem for A over the number field H. The sum of all character projectors requires L to be a splitting field for the finite quotient G, in addition to |G| being invertible. A single χ-projector does not require this extra assumption; [1.4 Character-component height pairing](#14-character-component-height-pairing) writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this roadmap's notation V_χ = A(χ^(-1)), and Layer 1's e_χ = |G|^(-1)Σ_σ χ(σ)^(-1)σ is this roadmap's e_(χ^(-1)).

*Outline.* σ_t acts L-linearly on A(K^ab)_ℚ ⊗_M L because the Galois action commutes with End⁰(A) for A defined over F ⊂ K. For a fixed χ, character orthogonality gives an idempotent projecting onto the χ^(-1)-eigenspace. If L contains every character of G, the projectors over all characters sum to 1 and give the direct-sum decomposition; without that splitting hypothesis do not claim this sum. Rational invariants descend by finite averaging: represent a vector over a finite Galois extension H′/H, average its conjugates, and divide by [H′:H]. Thus invariants after tensoring with ℚ are A(H)_ℚ, even when a representative point is fixed only modulo torsion. Finite dimensionality then uses the Mordell–Weil theorem of HeightsRationalPointsAndObstructions §1.7.

Its API consists of the following facts:

- A(χ) as the L-submodule {x | ∀ t, σ_t • x = χ(t)^(-1) • x} of a module with a commuting group action.
- x ∈ A(χ) ↔ ∀ t, σ_t • x = χ(t)^(-1) • x.
- e_χ = |G|^(-1) Σ_σ χ(σ) • σ for a finite abelian quotient G.
- e_χ x ∈ A(χ) for every x.
- x ∈ A(χ) → e_χ x = x.
- A(1) is the submodule of K-rational vectors (fixed by every σ_t).
- A(χ) ⊓ A(χ') = ⊥ for χ ≠ χ'.
- If L contains all characters of the finite abelian quotient G and |G| is invertible, Σ_χ e_χ = 1 on the G-module.
- An L-linear G-equivariant map φ sends x ∈ A(χ) to φ(x) ∈ A′(χ).

**Checks.**

- For the trivial representation of C₃ over 𝔽₃, #C₃ = 3 = 0 in 𝔽₃, so the probability average (1/#G)Σ_σ χ(σ)σx is undefined, while the finite character sum Σ_σ σ(1) = 3·1 = 0 is defined and vanishes on the nonzero fixed vector 1. A definition that set the undefined average to the finite sum would give the zero map, not the identity on the fixed subspace; idempotent-projector claims require the group order to be invertible.
- For χ = 1 the χ-isotypic subspace is the space of vectors fixed by every σ_t (A(1) = A(K)_ℚ ⊗_M L).
- e_χ ∘ e_χ = e_χ, and e_χ ∘ e_χ' = 0 for χ ≠ χ' (orthogonal idempotents).
- For G = ℤ/2 acting on V = L² by swapping coordinates and χ the nontrivial character, A(χ) = {(a, −a)}, while A(1) = {(a, a)}.
- A(χ) is not A(H)_ℚ ⊗_M L: for G = ℤ/2 swapping coordinates, (1, 0) lies in neither eigenspace.
- For G = ℤ/3 = ⟨σ⟩ acting on V = L³ by σ(a,b,c) = (c,a,b), with ζ ∈ L a primitive cube root of unity and χ(σ) = ζ: A(χ) = L·(1,ζ,ζ²) and A(χ^(-1)) = L·(1,ζ²,ζ), since σ(1,ζ,ζ²) = ζ²(1,ζ,ζ²) = χ(σ)^(-1)(1,ζ,ζ²). Order-two characters cannot distinguish χ from χ^(-1), so this test fixes the exponent convention.

*Consequences.* For χ = 1, A(χ) = A(K)_ℚ ⊗_M L. Torsion points contribute nothing: A(K^ab)_tors ⊗ ℚ = 0. Replacing the arithmetic by the geometric reciprocity convention exchanges A(χ) and A(χ^(-1)) ([0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points)).

([The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1(2), p. 588.)

*Needs:* [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [3.2 Normalized Hodge class](#32-normalized-hodge-class), Mathlib `TensorProduct`, Mathlib `Module.End.eigenspace`, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), Layer 1, Mathlib `NumberField.IsCMField`, [1.4 Character-component height pairing](#14-character-component-height-pairing), [1.5 Rational Galois descent of Mordell–Weil spaces](#15-rational-galois-descent-of-mordellweil-spaces)

### 8.3 Matching local signs force the global sign −1

If Σ(B) = Σ(A, χ), then the global root number is ε(1/2, π_A, χ) = ∏_v ε(1/2, π_(A,v), χ_v) = (−1)^(#Σ(B)) = −1, so L(1/2, π_A, χ) = 0 and the Gross–Zagier identity concerns the first derivative. More generally ε(1/2, π_A, χ) = (−1)^(#Σ(A,χ)) whenever ω_A · χ|_(𝔸_F^×) = 1.

Assume ω_A · χ|_(𝔸_F^×) = 1, which makes every local ε_v equal to ±1. Separately, ∏_v χ_v(−1) = χ(−1) = 1 because χ is trivial on K^× ∋ −1. Base-change root numbers; in the Rankin–Selberg convention the same computation uses ∏_v η_v(−1) = 1.

*Outline.* ε(1/2, π_A, χ) = ∏_v ε_v, and ε_v = χ_v(−1) for v ∉ Σ(A, χ), ε_v = −χ_v(−1) for v ∈ Σ(A, χ), all ε_v = ±1. ∏_v χ_v(−1) = 1 because χ is trivial on K^× ∋ −1; hence ε = (−1)^(#Σ(A,χ)). #Σ(B) is odd for an incoherent B.

*Consequences.* F = ℚ, Heegner hypothesis (every p | N split in K), χ = 1: Σ(A, 1) = {∞}, so ε = −1 and L(E/K, 1) = 0, as in Gross–Zagier. JSW's hypothesis (JSW-H): every ℓ | N⁺ splits in K and N⁻ is a squarefree product of an even number of inert primes; Σ(A,1) = {∞} ∪ {q | N⁻}, odd, so ε = −1. Under (gen-H) a ramified ℓ ∥ N⁺ with untwisted Steinberg π_ℓ lies in Σ(A,1): for E = 11a1 and K = ℚ(√−11), Σ(A,1) = {∞, 11} and ε = +1, so JSW's (sign −1) needs a local condition such as Skinner's (ram). The type-two analogue is the condition (ST) of §§9.9, 9.11 and 9.15: there the parity of N⁻ fixes the sign only when every ramified level prime satisfies (ST).

([The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 586; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §4.1, after (gen-H), p. 25.)

*Needs:* [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 8.4 Petersson norm, parametrisation degree and Manin constant

Fix φ ∈ S₂(Γ₀(N)), a newform with rational coefficients, ω_φ = 2πi φ(z) dz on X₀(N)(ℂ), f : X₀(N) → E a modular parametrisation of an elliptic curve E/ℚ (optimal or not) with f(∞) = O, ω₀ a Néron differential and C the Manin constant of f in the sense of [3.5 Manin constant](#35-manin-constant), f^*ω₀ = ±C·ω_φ, a positive integer after choosing the sign ([3.7 Integral Manin constant and p-unit range](#37-integral-manin-constant-and-p-unit-range)). Prove that (φ, φ)_(Γ₀(N)) = ∫_(Γ₀(N)\ℍ) |φ(z)|² dx dy is Tau Ceti's CuspForm.peterssonInnerCosets φ φ at weight 2 for Γ₀(N), equal to peterssonInner 2 D φ φ over the explicit fundamental domain D of CuspForm.peterssonInnerCosets_eq_peterssonInner, and it is positive for φ ≠ 0. With this identification the Layer 3 identities read ∫_(X₀(N)(ℂ)) |ω_φ ∧ ω̄_φ| = 8π² (φ, φ)_(Γ₀(N)) ([3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison)) and 8π² (φ, φ)_(Γ₀(N)) = deg f · ‖ω₀‖² / C² ([3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison)), where ‖ω₀‖² = ∫_(E(ℂ)) |ω₀ ∧ ω̄₀|. The new content here is only the identification with the Tau Ceti product.

Assume (φ, φ) is integrated against dx dy, the convention of CST and of Tau Ceti's peterssonInner with weight k = 2 ((Im τ)² against dx dy / y²). C is the Manin scalar of the chosen parametrization (3.5); no claim C = 1 is made.

*Outline.* Unfold CuspForm.peterssonInnerCosets_eq_peterssonInner: the sum over the cosets of Γ₀(N) (which contains −I) is peterssonInner 2 over a union of translates of the standard domain forming a fundamental domain; at weight 2 the integrand |φ|²(Im τ)² against dx dy / y² is |φ|² dx dy. Positivity combines peterssonInnerCosets_self_re_nonneg and peterssonInnerCosets_self_im (a nonnegative real) with peterssonInnerCosets_self_eq_zero (zero only at φ = 0). Import the two Layer 3 identities (|ω_φ ∧ ω̄_φ| = 8π²|φ|² dx dy, and f finite of degree deg f with f^*ω₀ = ±C ω_φ) and rewrite them with the identification of the first step.

*Consequences.* Isogeny test: for ψ : E → E' of degree d with ψ^*ω₀' = c_ψ ω₀, the composite ψ ∘ f has degree d·deg f and Manin constant c_ψ C, and ‖ω₀'‖² = c_ψ² ‖ω₀‖² / d; the combination deg f · ‖ω₀‖² / C² is unchanged, as it must be, since the left side depends only on φ. For the X₀(11) parametrisation f = id of 11a1 (deg 1, C = 1), 8π²(φ, φ) = ‖ω₀‖².

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, before Theorem 1.1, p. 1; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, after Theorem 1.1, p. 2; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, after (6.4), p. 230; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §2, display before Theorem (2.1), p. 310.)

*Needs:* Tau Ceti `UpperHalfPlane.peterssonInner`, Mathlib `UpperHalfPlane.petersson`, Mathlib `CuspForm`, Mathlib `CongruenceSubgroup.Gamma0`, EllipticCurveModularity Layer R29.5, [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), Tau Ceti `CuspForm.peterssonInnerCosets`, Tau Ceti `CuspForm.peterssonInnerCosets_eq_peterssonInner`, Tau Ceti `CuspForm.peterssonInnerCosets_self_eq_zero`, [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), [3.7 Integral Manin constant and p-unit range](#37-integral-manin-constant-and-p-unit-range), Tau Ceti CuspForm.peterssonInnerCosets_self_re_nonneg, Tau Ceti CuspForm.peterssonInnerCosets_self_im.

### 8.5 Admissible orders and the test-vector line V(π, χ)

Fix N, the conductor of π^JL, D = D_(K/F), c ⊂ O_F the largest ideal with χ trivial on ∏_(v∤c) O_(K,v)^× · ∏_(v|c) (1 + cO_(K,v)) (CST’s conductor; this is χ trivial on Ô_c^× only when ω_A is unramified), Σ₁ = {v | N nonsplit in K : ord_v(c) < ord_v(N)}, c₁ the Σ₁-off part of c, N₁ the Σ₁-off part of N and N₂ = N/N₁ its Σ₁-part. An Ô-order R of B_f is admissible for (π, χ) if it has discriminant N, R ∩ K̂ = Ô_(c₁), and each local component R_v is the admissible local order of [4.4 Admissible toric order](#44-admissible-toric-order), including its orientation rule in the split case 0 < ord_v(c₁) < ord_v(N). With U = R̂^×, U^((N₂)) its N₂-off part, and ω the central character extended to U^((N₂)) = U′·(Z ∩ U^((N₂))) trivially on U′ = ∏_(v∤N₂∞) U′_v (U′_v = U_v for v ∤ N, U′_v ≅ U₁(N)_v for v | N₁), V(π, χ) ⊂ π_A ⊗_M L is the space of f satisfying u·f=ω(u)f for u∈U^((N₂)) and t·f=χ_v(t)^(-1)f for t∈K_v^×, v∈Σ₁. By [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors) at each v and multiplicity one, V(π, χ) is one-dimensional over L and every nonzero vector is a test vector: α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_(A^∨), χ^(-1)) (CST Proposition 3.7).

Assume ω_A · χ|_(𝔸_F^×) = 1 and the local condition ε(π_v, χ_v) = χ_v η_v(−1) ε(B_v) (Rankin–Selberg convention of CST, equivalent to the erratum's base-change form). At v | N₁ the algebra B_v is split (CST Lemma 3.1(5)). The dimension and nonzero-toric conclusions require the actual irreducible local representation, its conductor, the root-number condition and this full admissibility predicate, not just a unit-group intersection or abstract eigenline.

*Outline.* Existence and uniqueness of admissible R_v up to K_v^×-conjugacy away from (c₁, N), and the two conjugacy classes when 0 < ord_v(c₁) < ord_v(N) (CST Lemmas 3.3–3.4). Local test-vector theory: the fixed space is one-dimensional and the local toric integral is nonzero on it (CST Propositions 3.7–3.8, §3.3–3.4); it imports the local toric functional of Layer 4.

Its API consists of the following facts:

- CST Definition 1.3: discriminant, optimal intersection, two-maximal-order intersections and the explicitly conductor-selected split orientation when 0<c_v<n_v.
- V(π, χ): the subspace of π ⊗_M L that is eigen under U^((N₂)) for the extension of ω trivial on U′, and χ_v^(-1)-eigen under K_v^× for v ∈ Σ₁.
- dim_L V(π, χ) = 1 (CST Proposition 3.7).
- α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_(A^∨), χ^(-1)).
- For F = ℚ and the Heegner conditions, the Eichler order of level N is admissible.
- Membership in V(π,χ) is exactly the ω-eigencondition under U^((N₂)), with its specified central-character extension, and the χ_v^(-1)-eigencondition under K_v× at v∈Σ₁.

**Checks.**

- For K=ℚ(√−7), N=11, c=1, the image !![1,−1;22,−8] of (−7+√−7)/2 has lower-left entry divisible by 11 and satisfies X²+7X+14=0. This tests the explicit embedding fragment. The matrix and its conjugate must satisfy the optimal-intersection and orientation conditions as well as the level condition; the displayed polynomial alone does not certify admissibility.
- With trivial ω and no local torus conditions, the defining predicate is precisely U-fixedness. A vector moved by one u∈U fails it, even if fixed by all the selected tori.
- An order of the correct discriminant whose intersection with K_v is O_(c_v+1), instead of O_(c₁,v), fails admissibility; equality of discriminants alone cannot pass the predicate.
- For a local torus element t with χ(t)≠1, a nonzero t-fixed vector cannot satisfy the required χ^(-1)-eigencondition. For example, at v ∤ N with χ_v ramified, an O_(K,v)^×-fixed vector has zero toric evaluation as soon as χ_v is nontrivial on that unit group.
- For T₁ = ⟨t⟩ with χ(t) = ζ (ζ³ = 1, ζ ≠ 1), U trivial and ω = 1: a vector f with t·f = ζ^(-1) f lies in V, while a nonzero g with t·g = ζ g does not. This detects the χ versus χ^(-1) convention.
- At v∈Σ₁ with χ_v ramified, choose t∈O_(K,v)× with χ_v(t)≠1. The test vector has t·f=χ_v(t)⁻¹f≠f; since R_v∩K_v=O_(K,v), requiring invariance under the full U_v would reject it. The eigencondition is imposed only on the N₂-off unit group.

*Consequences.* F = ℚ, Heegner conditions: R = {(a b; c d) ∈ M₂(ℤ̂) : N | c} is admissible and f : X₀(N) → A, ∞ ↦ O lies in V(π_A, χ) (CST, Example after Theorem 1.5). The line depends on the optimal embedding, not just the level: at v ∤ N with χ_v ramified (c_v ≥ 1), the vector fixed by a maximal order meeting K_v in O_(K,v) is O_(K,v)^×-fixed and χ_v is nontrivial there, so its toric integral is 0; the test line is fixed by a maximal order meeting K_v in O_(c,v). At v ∥ N, v | D, c_v = 0 the U₀(N)-newline is the test line (CST Proposition 3.8, Lemma 3.4).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Definition 1.3, p. 5; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Definition 1.4, p. 6; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.3 Proposition 3.7 p.24.)

*Needs:* [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, [4.4 Admissible toric order](#44-admissible-toric-order), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`.

### 8.6 The main identity on X₀(N): heights as Fourier coefficients

Fix N > 1, K = ℚ(√D) imaginary quadratic with D odd, (D, N) = 1 and every p | N split in K, x ∈ X₀(N)(H) a Heegner point of discriminant D, c the class of (x) − (∞) in J₀(N)(H), σ ∈ Gal(H/K) ↔ 𝒜 ∈ Cl_K under the Artin map, ⟨ , ⟩ the Néron–Tate pairing over H extended Hermitian to J(H) ⊗ ℂ, u = #O_K^×/2, and Φ_𝒜 = Σ a_(m,𝒜) q^m the weight-two cusp form of Gross–Zagier IV Theorem (6.9), which satisfies L'_𝒜(f, 1) = 8π²|D|^(-1/2) (f, Φ_𝒜) for newforms f. Prove that for every m ≥ 1 with (m, N) = 1, ⟨c, T_m c^σ⟩ = u² a_(m,𝒜). Moreover g_𝒜 = Σ_(m ≥ 1) ⟨c, T_m c^σ⟩ q^m is a cusp form of weight two on Γ₀(N) (Gross–Zagier V §1 p.306), so g_𝒜 − u² Φ_𝒜 is an old form, and (f, g_𝒜) = u²|D|^(1/2)/(8π²) · L'_𝒜(f, 1) for every newform f (Gross–Zagier I Theorem (6.1)–(6.2)), where L_𝒜(f, s) = Σ_((n,DN)=1) ε(n) n^(1−2s) · Σ a_n r_𝒜(n) n^(−s).

Assume N > 1 (the N = 1 boundary has S₂(SL₂(ℤ))=0). D odd, so D ≡ 1 mod 4 and (D, 2N) = 1; the Heegner hypothesis D ≡ β² mod 4N; g_𝒜 depends on the choice of the Heegner point x only through old forms; ⟨c, T_m c^σ⟩ for (m, N) = 1 does not depend on it (action of W × Gal(H/K)); x is built from 0a.2 at c=1, with its extra-unit stabilizer retained when D=−3 (u=3). The odd-D restriction belongs to this analytic kernel identity, not to the CM-point construction.

*Outline.* g_𝒜 is a cusp form: 𝕋 × S₂(Γ₀(N))_ℚ → ℚ, (T, f) ↦ a₁(Tf), is perfect, so m ↦ ⟨y, T_m z⟩ is the coefficient sequence of a cusp form ([6.11 Hecke height-series cuspidality](#611-hecke-height-series-cuspidality)). Replace c^σ by d^σ, d = (x) − (0), using that (0) − (∞) is torsion (Manin–Drinfeld), and decompose ⟨c, T_m d^σ⟩ (disjoint divisors when r_A(m)=0; otherwise use the tangent-normalized extension) into local heights: archimedean contribution from Chapter II Propositions (4.2) and (5.8) (Layer 7), finite contributions from Chapter III Propositions (9.2), (9.7) and (9.11) (Layer 7). Rewrite both through Chapter IV Proposition (4.6) (the Fourier coefficients of the holomorphic projection of the derivative of the Rankin kernel, Layer 6) and add: ⟨c, T_m c^σ⟩ = u² a_(m,𝒜) for (m, N) = 1. Two cusp forms whose m-th coefficients agree for (m, N) = 1 differ by an old form, which has the same Petersson product with every newform; use L'_𝒜(f, 1) = 8π² u^(-2) |D|^(-1/2) (f, g_𝒜).

*Consequences.* The identity is between coefficients with (m, N) = 1 only; a statement for all m would be false because g_𝒜 depends on x through old forms. Gross–Zagier V §3 announces the indefinite quaternionic analogue (the coefficients a_(m,𝒜) are a fixed multiple of ⟨x, T_m x^σ⟩ on Pic(X)); here that case is the specialisation of the Yuan–Zhang–Zhang formula (8.11) to F = ℚ, not a separate theorem.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, Theorem (6.1)–(6.2), p. 230; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p. 307.)

*Needs:* [6.76 Projected Rankin derivative cusp form](#676-projected-rankin-derivative-cusp-form), [6.78 Projected Rankin derivative coefficients](#678-projected-rankin-derivative-coefficients), [6.11 Hecke height-series cuspidality](#611-hecke-height-series-cuspidality), [6.13 Prime-to-level newform detection](#613-prime-to-level-newform-detection), [7.108 Total archimedean CM formula](#7108-total-archimedean-cm-formula), [7.102 Total finite CM height formula](#7102-total-finite-cm-height-formula), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), Mathlib `CuspForm`, Mathlib `CongruenceSubgroup.Gamma0`, Tau Ceti `UpperHalfPlane.peterssonInner`, TauCetiRoadmap.ModularForms Layer 4, TauCetiRoadmap.ModularForms Layer 8G, Tau Ceti `CuspForm.peterssonInnerCosets`, Tau Ceti `TauCeti.cuspFormsOld`, Tau Ceti `TauCeti.cuspFormsNew`, Tau Ceti `TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, Tau Ceti `HeckeRing.GL2.Newform`, Tau Ceti `HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq`, [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant).

### 8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))

Import from Layer 1 the Poincaré height pairing B_(k,M): V × W → M⊗_ℚℝ for A and A^∨, with the dual M-action in the second slot and tr_(M⊗ℝ/ℝ) B_(k,M)=B_k. For M⊂L define B_(k,L) on (L⊗_M V) × (L⊗_M W) by L-bilinear extension, with target L⊗_M(M⊗_ℚℝ)≃L⊗_ℚℝ. On pure tensors B_(k,L)(a⊗x,b⊗y)=ab⊗B_(k,M)(x,y). Invariant Galois actions give B_(k,L)(A(χ),A^∨(χ′))=0 unless χ′=χ^(-1). For base-field vectors its full real trace is [L:M]B_k(x,y), rather than B_k itself. Take k=F for the YZZ formula and k=K for CST; the field-relative pairings satisfy B_K=[K:F]B_F on the common algebraic points.

Assume M and L finite separable coefficient fields. V and W are rational Mordell–Weil modules with the Layer 1 dual M-actions. The Galois action preserves the imported M-pairing and commutes with M and L. The M-valued trace characterization is imported, not reconstructed by taking a trace of the L-extension. The YZZ height is relative to F. CST uses the K-relative height, a factor of two for K/F quadratic (CST p.18); [1.4 Character-component height pairing](#14-character-component-height-pairing) writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this roadmap's notation V_χ = A(χ^(-1)), and Layer 1's e_χ = |G|^(-1)Σ_σ χ(σ)^(-1)σ is this roadmap's e_(χ^(-1)).

*Outline.* Use the universal property of both tensor products to extend the imported M-bilinear map; associativity identifies the target with L⊗_ℚℝ. Check the pure-tensor formula and both L-scalar laws; Galois invariance extends by linearity. For an unmatched eigencharacter, invariance gives B=χ(t)^(-1)χ′(t)^(-1)B; choose t with product different from one. Apply transitivity of finite separable trace to a base-field coefficient: tr_(L/M)(m)=[L:M]m. Keep the original rational trace recovery at M. For E and M=L=ℚ compare with the full polar form of the (O)-height, which is Tau Ceti’s `neronTatePairing`.

Its API consists of the following facts:

- L-bilinear scalar extension of the supplied mixed-source M-bilinear height, with target L⊗_M S; it is not a second construction of the M-valued height.
- For B valued in M and base-field inputs, tr_(L/M)(B_L(1⊗x,1⊗y))=[L:M]B(x,y); compose with the Layer 1 real trace in the arithmetic case.
- B_L(a·x,y)=a·B_L(x,y), for a∈L.
- B_L(x,a·y)=a·B_L(x,y), where W already carries the dual M-action.
- ⟨σx, σy⟩_(K,L) = ⟨x, y⟩_(K,L) for σ ∈ Gal(K̄/K).
- ⟨A(χ), A^∨(χ')⟩_(K,L) = 0 unless χ' = χ^(-1).
- The pairing kills the images of torsion points; after rationalisation these images are zero, so the signature needs characteristic zero (over ZMod p every vector has finite additive order).
- At M=L=ℚ and after tensoring the point groups with ℚ, the BSD height pairing is the rational linear extension of Tau Ceti’s `neronTatePairing`.
- On pure tensors the value is ab⊗B(x,y).

**Checks.**

- If M = L = ℚ the coefficient pairing equals the ℚ-bilinear Néron–Tate pairing (the trace is the identity).
- In a quadratic L/M extension, the trace of B_L(1⊗x,1⊗y) is 2B(x,y). In particular, for M=ℚ and L=ℚ(√5), a base value 1 has trace 2.
- For an elliptic curve with M = L = ℚ, ⟨P, P⟩_(K,L) = canonicalHeight P over K (the x-height), the BSD pairing of Layer 0; the value 2 · canonicalHeight P would be the full polar form of h_x, which is not this pairing.
- In a characteristic-zero quadratic L/M extension, a base pairing value 1 has extended trace 2, hence not 1. Reusing the M trace-recovery law after L-extension fails.
- For M = ℚ, L = ℚ(i) and a base value B(x,y) = 1, the extension gives B_L(i⊗x, i⊗y) = i²·1 = −1; an extension conjugate-linear in one slot would give +1, so the extension is bilinear, not Hermitian.

*Consequences.* Restricted to χ = 1, M = L = ℚ and A = E an elliptic curve with its principal polarisation, ⟨P, P⟩_(K,L) equals the K-relative BSD pairing ⟨P, P⟩_BSD of Layer 0, i.e. Tau Ceti's `canonicalHeight` over K. The pairing kills torsion and is ℝ-valued after tr_(L⊗ℝ/ℝ).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6; [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2 p.6 and §2.3 p.18 after (2.4).)

*Needs:* [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [1.2 Endomorphism-field height pairing](#12-endomorphism-field-height-pairing), [1.4 Character-component height pairing](#14-character-component-height-pairing), [8.2 The χ-isotypic Mordell–Weil space A(χ)](#82-the-χ-isotypic-mordellweil-space-aχ), [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), Mathlib `LinearMap`, Mathlib `TensorProduct`, Mathlib `Algebra.trace`, Mathlib `QuadraticMap.polar`, Layer 1, Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`.

### 8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)

For the ξ-normalized CM point P=[z,1] and f∈π_A, first form the toric function t↦f([z,t])⊗χ_T(t). It descends through K×\𝔸_K×/𝔸_F× when ω_Aχ_T|𝔸_F×=1. Use the translation reciprocity σ_z(t) of 0a.4 and χ_T(t)=χ_G(σ_z(t)) to rewrite it as a Galois-weighted orbit; denote this Galois-side character χ_G by χ in the finite formulas of this subsection. Let G=Pic_(K/F)(O_c) be a finite quotient through which this weighted integrand factors, h=#G, and P⁰_χ(f)=Σ_(t∈G)f([z,t])⊗χ_T(t), using representatives and the central cancellation. On a finite Galois quotient through which both factors separately descend this is Σ_σ f(P)^σ⊗χ_G(σ). Define the YZZ point P_χ(f)=h⁻¹P⁰_χ(f) in A(K^ab)_ℚ⊗_M L. Neither χ nor the unweighted orbit is separately asserted to descend to G when the central character is nontrivial. For the abstract character projector, instead take a finite Galois quotient G′ through which both the character and orbit factor; collapsing repeated weighted terms recovers the relative average. The point is independent of refinement and satisfies σ_sP_χ=χ(s)⁻¹P_χ. A toric measure of volume v=2L(1,η), with L(1,η) the completed value (factor π^(-1) at each real place of F), gives P^(vol)_χ=v(1⊗P_χ) in ℂ⊗_L(A(K^ab)_ℚ⊗_M L), after fixing L↪ℂ. The analytic scalar v is not asserted to lie in L.

Assume the weighted integrand descends through the central-character cancellation and factors through the specified relative ring-class quotient; the finite Galois projector uses the larger quotient G′ when necessary; h is invertible in L; the module is rationalized and L has characteristic zero. The probability normalization is established by CST §2.3 p.18 and Skinner §2.5 p.341. Erratum item 25 corrects the integration group at book p.82 to Gal(E^ab/E); it does not state a probability convention. The analytic integral uses L↪ℂ; its height and curve-volume conventions must also be converted before substituting it into a YZZ formula. For F = ℚ, L(1, η) is π^(-1) times Mathlib's DirichletCharacter.LFunction value at s = 1; for general F it is the completed Hecke L-value of CST Lemma 2.3; its use in the toric comparison is 8.9, which builds on this target.

*Outline.* Use 0a.2–0a.4 CM reciprocity and Layer 3 ξ-normalization to obtain the finite orbit and its relative class-group quotient. Sum the character-weighted orbit, divide by h, and reindex to check χ^(-1)-equivariance. If a quotient is refined, every original orbit term is repeated by the kernel size; this cancels against the refined cardinality. Push Haar measure to the finite quotient: probability mass is 1/h per coset; volume-v mass is v/h. Scalar-extend to ℂ for the latter. Use CST Lemma 2.3 and (2.4) for the class-number/relative regulator-unit comparison, and Skinner p.341 for P_K=h_K P(f_1).

**Shared marked elliptic point comparison.** In the overlapping scope of ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, fix its supplied CM divisor and E-valued point P_K, its actual curve C, quotient q:J(C)→A_f and isogeny ψ:A_f→E. Use the moduli identifications of §§0a.2 and 0a.4 to identify its CM orbit with the orbit above, keeping the oriented ideal or optimal embedding and arithmetic Artin indexing. Write B_stat for its degree-one cusp or Hodge basepoint and ξ for the componentwise degree-one Hodge class of §3.2. For the same trace of h CM points prove the marked elliptic point comparison

P_K = ψ(P⁰_1(q_ξ)) + h·ψq(ξ−B_stat) = h·ψ(P_1(q_ξ)) + h·ψq(ξ−B_stat).

Here q_ξ(x)=q([x−ξ]), and q acts on the degree-zero class ξ−B_stat; the equality is in E(K)⊗ℚ after the chosen trace descent. The supplied divisor is the point definition in this scope. When the basepoints agree, or their difference is killed by ψq in the rational point group, the correction is zero and P_K=h·ψ(P_1(q_ξ)). For the supplied classical cusp and quaternionic Hodge choices, prove that correction is zero in the rational f-quotient: in the classical case ξ and ∞ are Eisenstein and their difference is killed by q, while in the quaternionic Hodge construction the same ξ is used. If the supplied point instead uses the degree-zero divisor (T_ℓ−1−ℓ)Σ[x] divided on the f-factor by a_ℓ−1−ℓ, compare it with this Hodge normalization using the Hecke eigenvalue and the Eisenstein action on ξ; choose ℓ prime to N with a_ℓ−1−ℓ≠0, as follows from |a_ℓ|≤2√ℓ<ℓ+1. This proves P_K=h·ψ(P_1(q_ξ)) for the actual supplied point (Skinner §2.4, pp.339–340, skinner-published line 459 and skinner-published line 468). For other basepoints retain the displayed correction before evaluating a height or logarithm. Under a finite character, the basepoint correction has coefficient Σ_σχ(σ), which is 0 for nontrivial χ and h for χ=1.

Retain the fixed differential: if (ψq)*ω_E=c·ω_f with c≠0, then log_(ω_E)(ψqD)=c·log_(ω_f)(D) on rational degree-zero classes in the logarithm domain. The height comparison uses the pullback polarization (ψq)∨λ_E(ψq) of §3.6; for the elliptic isogeny ψ of degree d, B_E(ψQ,ψR)=d·B_(A_f)(Q,R) in the same relative field. Thus trace/average, differential and polarization factors remain attached to the same marked quotient. These comparisons specialize §§0.9, 0.10, 1.3 and 3.6 and the actual CM-orbit equality; they supply no rank or Sha deduction (CST §1.2 p.4, §2.3 p.18; Skinner §§2.4–2.6 pp.338–344).

Its shared-data API identifies the actual CM points and quotient maps, gives the displayed basepoint correction, and commutes with the fixed isogeny on heights and logarithms.

**Checks for the shared marking.**

- With h=3 and ψ the identity, a trace 3Q has probability point Q: P_K=3Q when the basepoint correction is 0. Its height is 9h_x(Q), whereas its logarithm is 3log(Q).
- If ψ=[2] on an elliptic factor and h=3, the same point becomes 6Q, with differential scale 2 and height 36h_x(Q). Treating the isogeny as an unmarked identification would give 3Q and height 9h_x(Q).
- For ℓ=2 and a_2=1, the Hecke regularization has degree 3−3=0 and eigenvalue 1−3=−2; division by −2 returns the original f-component. The denominator is nonzero, since 2√2<3.
- If ψq(ξ−B_stat)=T, the trace correction is 3T at h=3; it is 0 after rationalization when T is torsion. For a character of order three the coefficient 1+ζ₃+ζ₃² is 0; replacing the trace by a probability average divides both terms by 3.

Its API consists of the following facts:

- P⁰_χ(x) = Σ_(g ∈ G) χ(g) • (g • x) for a finite group G acting on a module and a character χ.
- P⁰_χ(h • x) = χ(h)^(-1) • P⁰_χ(x).
- h • P⁰_χ(x) = χ(h)^(-1) • P⁰_χ(x), so P⁰_χ(x) ∈ A(χ).
- P⁰_1(x) = Σ_g g • x, the trace.
- P⁰_χ(x + y) = P⁰_χ(x) + P⁰_χ(y).
- For an equivariant linear map φ, P⁰_χ(φ x) = φ(P⁰_χ x): the Heegner point of a composite parametrisation is the image point.
- The analytic integral equals (v/h)·(1⊗the finite character sum), in the complex scalar extension.
- Gross–Zagier's eigencomponent c_χ = Σ_σ χ^(-1)(σ) c^σ is P⁰_(χ^(-1))(c) in this notation; the two conventions differ by χ ↔ χ^(-1) ([0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points)).
- For a ∈ L, P⁰_χ(a • x) = a • P⁰_χ(x), distinct from the group-action equivariance formula.
- h^(-1)P⁰_χ in the original L-module; this is the YZZ probability-normalized point.
- The probability average is the character projector applied to the CM orbit vector.
- For v∈ℂ the volume-scaled point is v·(1⊗the probability average) in ℂ⊗_L V.
- Any L-bilinear pairing of the χ and χ^(-1) averages is h^(-2) times the pairing of the corresponding finite sums.

**Checks.**

- For G trivial, P⁰_χ(x) = x.
- For G = ℤ/2 = {1, σ} and χ(σ) = −1, P⁰_χ(x) = x − σx; for x = (1, 0) in L² with σ swapping coordinates, P⁰_χ(x) = (1, −1).
- If x is G-fixed and χ ≠ 1 then P⁰_χ(x) = 0: a K-rational point has no χ-component for a nontrivial χ.
- For χ = 1, P⁰_1(x) is the trace Σ_g g • x, the trace point y_K = Tr_(H/K) P.
- For G = ℤ/3 = ⟨σ⟩ acting on L³ by σ(a,b,c) = (c,a,b) and χ(σ) = ζ a primitive cube root of unity: P⁰_χ(e₁) = (1,ζ,ζ²) and σ•P⁰_χ(e₁) = ζ²•P⁰_χ(e₁) = χ(σ)^(-1)•P⁰_χ(e₁); the χ^(-1)-weighted (Gross–Zagier) sum gives (1,ζ²,ζ) instead.
- For ℤ/2 swapping the coordinates of ℚ² and χ the sign character, the probability average χ (1,0) = (1/2,−1/2), half of P⁰_χ(1,0) = (1,−1). Its dot-product self-pairing is 1/2, a quarter of the unnormalized self-pairing 2, not half of it.
- Over 𝔽₇, ζ=2 and ζ²=4 realize the C₃ check as the explicit vector e₀+2e₁+4e₂=(1,2,4); its cyclic shift is 4 times that vector and is not 2 times it.

*Consequences.* For F = ℚ, the incoherent quaternion algebra with ramification set {∞} (the modular case), U = U₀(N) and the Heegner condition, P⁰_χ(f) for f = (X₀(N) → E, ∞ ↦ O) is Σ_([a]) f(P_a)χ([a])^(-1) with P_a the CM point C/a → C/a𝔑^(-1), because σ_a sends P_b to P_(a^(-1)b) in Layer 0's convention. CST's sum Σ_([a]) f(P_a)χ([a]) (§1.1; Example p.7) is therefore P⁰_(χ^(-1))(f); the inversion is invisible in CST's formula, which is symmetric under χ ↔ χ^(-1). For χ = 1, P⁰_1(f) = Tr_(H_c/K) f(P) ∈ A(K).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 587; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, p. 230; [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Item 25, correction to book p.82; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3, Lemma 2.3 p.17 and (2.4) with following paragraph p.18.)

*Needs:* ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, for the shared marked divisor, quotient and isogeny; §§0a.2, 0a.4, 0.9, 0.10, 1.3, 3.6 and 3.5 for its CM, height and differential comparisons; [8.2 The χ-isotypic Mordell–Weil space A(χ)](#82-the-χ-isotypic-mordellweil-space-aχ), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), Mathlib `DirichletCharacter.LFunction`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### 8.10 The Heegner map is a toric-invariant functional

Let χ_G be the character weighting the Galois sum of 8.8 and χ_T(t)=χ_G(σ_z(t)) its pullback along the actual CM translation reciprocity of 0a.4. For t∈𝔸_K× acting on π_A by right translation, prove P_(χ_G)(π_A(t)f)=χ_T(t)⁻¹P_(χ_G)(f). Thus f↦P_(χ_G)(f) belongs to Hom_(𝔸_K×)(π_A⊗χ_T,ℂ)⊗_ℂ(ℂ⊗_L A(χ_G)), after fixing L↪ℂ. With Layer 4's local toric spaces it factors through ⊗_v Hom_(K_v×)(π_(A,v)⊗χ_(T,v),ℂ).

Assume ω_Aχ_T|𝔸_F×=1; the weighted orbit factors through a finite quotient and its order is invertible in L as in 8.8. The point, torus embedding and σ_z are those constructed in 0a.4, rather than an unrelated action. If a source's Artin map is the inverse of the arithmetic one, its Galois-side character is inverted during this transport.

*Outline.* At the reference CM point, π_A(t)f=f∘R_t and R_t(P)=P^(σ_z(t)). Galois commutes with the Hecke action. Reindex the finite sum by σ↦σσ_z(t); its weight changes by χ_G(σ_z(t))⁻¹=χ_T(t)⁻¹. Apply the central cancellation before passing to relative representatives and extend scalars for the complex toric functional. This uses the actual reflex norm, not the assumption r_z=id.

**Checks.**

- The trivial character gives a torus-invariant trace; the zero point gives the zero functional.
- For G=C₃ and χ_G(σ)=2∈𝔽₇, the Galois-weighted orbit vector (1,2,4) is multiplied by 4 under σ. If σ_z(t)=σ⁻¹, then χ_T(t)=4 and the same functional is multiplied by 2 under t. Both inversions are visible; C₂ would hide them.
- In the modular ideal indexing, σ_aP_b=P_(a⁻¹b). Therefore the ideal-weighted sum Σ_b χ(Art(b))P_b transforms by χ(Art(a)), whereas the Galois-weighted sum P⁰_χ transforms by χ(Art(a))⁻¹. They agree only after the character conversion of 8.8, or for quadratic χ.

*Consequences.* A vanishing local toric Hom space for the transported χ_T forces P_(χ_G)=0 (8.12). The toric character in the analytic L-function, central character and local integrals must all be χ_T; keeping χ_G there without the comparison changes the statement.

([Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2 p.6, CM reciprocity and Heegner cycle, and §2.3 pp.18–19, the global pairing; the character conversion is the direct reindexing above, with the canonical-model convention of ShimuraVarieties §§4.1–4.4.)

*Needs:* [8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#88-the-χ-heegner-point-p_χf-and-its-finite-form-p_χf), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points).

### 8.9 Toric integral versus finite trace

For a χ-weighted orbit factoring through G=Pic_(K/F)(O_c), probability integration is P_χ=P⁰_χ/h in A⊗_M L, whereas volume-v integration is v·(1⊗P_χ) in ℂ⊗_L(A⊗_M L). Thus B_F(P_χ,P_(χ^(-1)))=h^(-2)B_F(P⁰_χ,P⁰_(χ^(-1))); the complex volume-scaled pairing gains a further v². In CST §2.3 let h_b=#Pic_(K/F)(O_b), κ_b=ker(Pic(O_F)→Pic(O_b)), w_b the torsion-unit quotient, R_b the regulator quotient and r=r_K−r_F. Its class-number identity is L^((b))(1,η)||Db²δ||^(1/2)2^(-r)=h_b R_b/(#κ_b w_b); setting ν_b=2^(-r)R_b^(-1)#κ_b w_b gives CST P_(χ_T)=2L(1,η)P⁰_(χ_G)/h_b after the character transport of 8.10. Here L(1,η) is the completed value, with factor π^(-1) at each real place of F (for K=ℚ(i), b=1 the identity gives L(1,η)=1/4=π^(-1)·L(1,χ_(−4))); ||·|| is the absolute ideal norm and L^((b)) omits the Euler factors at the places dividing b. CST also has B_K=2B_F and vol(X)_YZZ=2vol(X)_CST: CST measure H by dxdy/(4πy²) (p.9), YZZ by dxdy/(2πy²) (as in Zhang 2010 p.580), so CST's pairing (f1,f2) is twice YZZ's. All three conversions must be made together. For F=ℚ and χ=1, the finite sum is the trace point and the YZZ average is its quotient by h_c; Skinner p.341 checks the case c = 1, P_K(f) = h_K·P(f_1).

Assume the orbit and χ factor through the finite quotient with h≠0 in L. Fix the coefficient embedding for the analytic integral; v=2L(1,η) is a complex scalar. Use the same finite-level curve, local toric normalizations and base field when comparing heights.

*Outline.* Equal coset masses give the two finite formulas. Bilinearity gives h^(-2) and v². Prove CST Lemma 2.3 from the two exact sequences (κ_b, unit indices), the local index [Ô_K^×:Ô_b^×] = N(b)/L_b(1,η) and the class-number formulas for K and F; then simplify the coset volume to 2L(1,η)/h_b. Apply CST’s adjacent height and curve-volume comparisons, rather than mixing its point with YZZ’s constant.

*Consequences.* CST Theorem 1.6's normalisation #Pic_(K/F)(O_(c1)) (CST print #Pic(O_(c1)); their proof, pp.19–20, uses Pic_(K/F)) / Vol(K^× F̂^× \ K̂^×, dt) · ∫ is exactly the inverse of this factor, so the variation formula reproduces P⁰_χ. For F = ℚ, K of class number one and c = 1: #Pic_(K/F)(O_K) = 1 and the factor is the whole toric volume 2L(1, η).

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 587; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3 Lemma 2.3 pp.17–18, equation (2.4) and following paragraph; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Published §2.5 p.341, derivation of Proposition 2.5.1.)

*Needs:* [8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#88-the-χ-heegner-point-p_χf-and-its-finite-form-p_χf), [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), Mathlib `NumberField.classNumber`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, [8.10 The Heegner map is a toric-invariant functional](#810-the-heegner-map-is-a-toric-invariant-functional).

### 8.12 The zero case: vanishing of the toric Hom space

In the setting of the Yuan–Zhang–Zhang formula, suppose Σ(B) ≠ Σ(A, χ) (equivalently, Hom_(K_v^×)(π_(A,v) ⊗ χ_v, ℂ) = 0 for some place v, by the Saito–Tunnell dichotomy with the erratum's convention). Prove that P_(χ_G)(f) = 0 in A(χ_G) for every f ∈ π_A, and α(f1, f2) = 0 for all f1, f2; the Gross–Zagier identity holds as 0 = 0 and gives no information about L'(1/2, π_A, χ).

Assume ω_A · χ|_(𝔸_F^×) = 1; Σ(A, χ) computed with ε(1/2, π_(A,v), χ_v) ≠ χ_v(−1) (base-change convention).

*Outline.* By 8.10, f ↦ P_(χ_G)(f) lies in Hom_(𝔸_K^×)(π_A ⊗ χ, ℂ) ⊗ A(χ_G), and a K_A^×-invariant functional on a restricted tensor product restricts to a nonzero local invariant functional at each v if it is nonzero. By Saito–Tunnell (Layer 4) the local space at v is zero exactly when B_v is not the quaternion algebra prescribed by ε(1/2, π_(A,v), χ_v) χ_v(−1); Σ(B) ≠ Σ(A, χ) means this happens at some v. α is the product of local α_v, and α_v vanishes on the zero local Hom space.

*Consequences.* Example: F = ℚ, K with a prime q | N inert in K and q ∥ N, χ = 1, and B = M₂ at q; then Σ(A, 1) contains q and P_1(f) = 0 for every parametrisation by the modular curve — the classical Heegner hypothesis is one sufficient condition that avoids this (Skinner's (ram) case, p.341, is another). The vacuous case is recorded, not assumed away: the theorem is stated for all f1, f2.

([The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9.)

A public source for this interface is [Cai–Shu–Tian, Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, p. 6 (Heegner map), and §3.1, p. 21 (zero local toric Hom); the vanishing follows by the tensor-factor argument above.

*Needs:* [8.10 The Heegner map is a toric-invariant functional](#810-the-heegner-map-is-a-toric-invariant-functional), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy).

### 8.1 Projected arithmetic kernel identity

For the fixed quaternionic constituent σ and admissible factorizable Φ, (I′(0,·,χ,Φ),φ)_Pet=2(Z̃(·,χ,Φ),φ)_Pet for every φ∈σ. Equivalently the σ-cuspidal projections agree with factor2. The equality is not pointwise in g: constant, Eisenstein, old and nearby-coherent terms are removed by their separately proved projection/orthogonality statements. Extend from the degenerate test data to all permitted data by local toric multiplicity one and the existence of a nonzero distinguished test pair.

Assume (Q) with Σ(𝔅)=Σ(σ,χ), σ of parallel weight two and χ of finite order with ω_σ·χ|_(𝔸_F^×)=1, and the derivative, regularization and projection hypotheses of 6.24, 6.38 and 6.1. The degenerate case is the case of data (D) (Conventions; 7.4).

*Outline.* For data (D): decompose both kernels place by place; the good and archimedean places cancel (7.25), split places contribute nothing (the analytic kernel has no split-place terms by 6.57, and the local heights vanish by Yuan–Zhang–Zhang's Theorem 7.8(1), restated by Disegni, Proposition 8.3.1(1), p. 57), and the bad places give coherent kernels (7.47), whose σ-components vanish (7.5). For general data: both sides of the identity depend on the pair (f,Φ), f∈σ, through its Shimizu lift in π_𝔅⊗π̃_𝔅 (5.1), and are toric-invariant bilinear forms there; that space has dimension at most one (4.1, 4.2). So it suffices to prove the identity for one pair whose local toric contractions are all nonzero; such a pair with Φ of type (D) exists by 7.4, item 3.

*Consequences.* The right-hand coherent error may be nonzero before projection. A vanishing global invariant pairing causes no division by zero.

**Checks.**

- The factor is 2, in the normalization of 6.38: the difference Pr I′(0,g,φ)−2Z(g,(1,1),φ) is perpendicular to σ. The constant ζ_F(2)/(4L(1,η)²L(1,π_A,ad)) of 8.11 is derived with this factor; replacing 2 by 1 doubles it.
- If Σ(𝔅)≠Σ(σ,χ), both σ-projections vanish, as in 8.12, so the identity gives no information there.
- For data (D) with a single place in S₁ the constant-term derivative need not vanish (7.4, Checks); the reduction to (D) needs |S₁|≥2.

(The reduction to data (D) is Yuan–Zhang–Zhang's Theorem 5.7; [Yuan, Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), §1.5, pp. 7–8, with footnote 7, states the identity in this form (the difference Pr I′−2Z is perpendicular to the cusp form) and cites Theorem 5.7. The same reduction, by multiplicity one and a Shimizu lift with nonzero local integrals, is [Disegni, The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), Proposition 5.4.3, pp. 49–50, and his assembly of the local terms, Theorem 8.3.2 and the proof after it, pp. 57–58, follows Yuan–Zhang–Zhang's §7.4.3. The book is [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Theorem 5.7 and §§5.1–5.2, as identified by Yuan and Disegni.)

**Source note.** The reduction by multiplicity one is public (Disegni's proof of Proposition 5.4.3). Two inputs are proved in the book only, with statements and numbering confirmed by the public restatements cited: the existence of data (D) with nonzero local toric contractions at the places of S₁ (Proposition 5.8; 7.4, item 3) and the deep-level local nonsingularity (Theorem 7.8(4); 7.47, item 1). The four general-level prerequisites of 7.47 also retain their stated YZZ book locators; their maximal-level public specializations do not replace those inputs.

*Needs:* [7.4 Degenerate Schwartz classes](#74-degenerate-schwartz-classes), [7.5 Nearby coherent kernel orthogonality](#75-nearby-coherent-kernel-orthogonality), [7.25 Good-place arithmetic identity](#725-good-place-arithmetic-identity), [4.1 Local toric functional space](#41-local-toric-functional-space), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), [6.24 Incoherent central derivative](#624-incoherent-central-derivative), [6.38 Arithmetic height kernel](#638-arithmetic-height-kernel), [6.39 Arithmetic theta lifting comparison](#639-arithmetic-theta-lifting-comparison), [7.47 Nearby quaternionic approximation](#747-nearby-quaternionic-approximation), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [6.1 Petersson projectors and their growth domains](#61-petersson-projectors-and-their-growth-domains), [8.12 The zero case: vanishing of the toric Hom space](#812-the-zero-case-vanishing-of-the-toric-hom-space), [6.57 Derivative of the mixed theta–Eisenstein series before projection](#657-derivative-of-the-mixed-thetaeisenstein-series-before-projection).

### 8.11 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)

Write χ for the toric character χ_T and χ_G for its Galois transport through 0a.4 and 8.10; every local integral, root number and L-function below uses χ_T. Fix F, totally real, B an incoherent quaternion algebra over 𝔸_F with ramification set Σ(B) of odd cardinality and B_∞ totally definite, X the Shimura curve system of B, A a simple abelian variety over F parametrised by X with M = End⁰(A) and π_A = Hom⁰_ξ(X, A), K/F totally imaginary quadratic with a fixed embedding 𝔸_K ↪ B, L ⊇ M a finite extension and χ : K^× \ 𝔸_K^× → L^× of finite order with ω_A · χ|_(𝔸_F^×) = 1. Then, as an identity in L ⊗_ℚ ℂ, for all f1 ∈ π_A and f2 ∈ π_(A^∨): ⟨P_(χ_G)(f1), P_(χ_G⁻¹)(f2)⟩_(F,L) = ζ_F(2) L'(1/2, π_A, χ) / (4 L(1, η)² L(1, π_A, ad)) · α(f1, f2). Here L(s, π_A, χ) is the base-change Rankin L-function L(s, π_(A,K) ⊗ χ) in the unitary normalisation (centre 1/2), α = ∏_v α_v is the product of the normalised local toric integrals of Layer 4, P_(χ_G) denotes probability averaging, the height is relative to F, ζ_F(2), L(s,π_A,χ), L(1,η) and L(1,π_A,ad) are completed L-functions as CST's dictionary requires (CST Lemma 2.3 uses the completed L(1,η); finite parts would change the constant by (2π²)^([F:ℚ])), and the local measures are those of 4.7. The volume-scaled complex integral is a separate object. The identity is first an equality of the two elements ⟨P_(χ_G)(·), P_(χ_G⁻¹)(·)⟩_L and α of the space Hom_(𝔸_K^×)(π_A ⊗ χ, ℂ) ⊗ Hom_(𝔸_K^×)(π_(A^∨) ⊗ χ^(-1), ℂ), of dimension at most one; it is proved for factorisable f1, f2 and extended by bilinearity, and no zero pairing is placed in a denominator.

Assume A simple and parametrised by X; χ of finite order; ω_A · χ|_(𝔸_F^×) = 1. B incoherent (#Σ(B) odd) and totally definite at infinity. K/F totally imaginary. These are the standing hypotheses of YZZ Secs. 1.2.1 and 1.3.1. Root numbers in the base-change convention of the erratum: Σ(A, χ) = {v : ε(1/2, π_(A,v), χ_v) ≠ χ_v(−1)}. Rankin–Selberg-over-F sources (Zhang 2010, CST) carry the extra η_v(−1), which is the same condition (Layer 0). The erratum (item 1) keeps the claim that the tower X is a regular, locally noetherian scheme only under #Σ(B) > 1; in the modular case Σ(B) = {∞} work with the finite-level curves X_U. Probability-normalized CM points and F-relative height. The CST comparison changes the point by 2L(1,η), multiplies the height by two and halves the curve volume; keep these changes explicit.

*Outline.* Reduce to the projector form, YZZ Thm. 3.15: ⟨T(f1 ⊗ f2) P_(χ_G), P_(χ_G⁻¹)⟩_NT = the same constant times α(f1 ⊗ f2), using T_alg(f1 ⊗ f2) = f2^∨ ∘ f1 and the projection formula for heights (YZZ Sec. 1.5.3). Skinner p.341 cites the χ=1 point-pairing form as YZZ Theorem 3.13. Reduce Thm. 3.15 to the kernel identity (1.5.4) by the arithmetic theta lifting identity (1.5.5) (Layer 6). Reduce the kernel identity for general Schwartz data to degenerate data using the one-dimensionality of the toric Hom spaces (Layer 4) and the local existence results (Layer 7). Prove the degenerate kernel identity by decomposing both kernels over the nonsplit places: archimedean and good finite places by the local intersection computations, bad places by the nearby-quaternion approximation (Layer 7); the coherent kernels left over are perpendicular to σ by Saito–Tunnell at the nearby algebras B(v) (Layer 4). Check the displayed constant against CST (2.4): its point is 2L(1,η) times the probability point after complex extension; its height is K-relative, twice the F-relative height; its curve-volume measure dxdy/(4πy²) is half of YZZ's dxdy/(2πy²), so CST's (f1,f2) is twice YZZ's; then (2.4) reads 8L(1,η)²⟨P_(χ_G),P_(χ_G⁻¹)⟩_(F,L) = 2·ζ_F(2)L'(1/2,π_A,χ)L(1,π_A,ad)^(-1)·(f1,f2)_YZZ·∏_vβ_v, which is the displayed identity since α = (f1,f2)_YZZ·∏_vβ_v. Convert all three before identifying α and the coefficient ζ_F(2)/(4L(1,η)²L(1,π_A,ad)). The projector-to-kernel step is the book's arithmetic theta lifting, Theorem 3.22 (6.39), followed by 8.1.

*Consequences.* Vacuous case: if Σ(B) ≠ Σ(A, χ) both sides vanish (8.12). Essential case: Σ(B) = Σ(A, χ) forces ε(1/2, π_A, χ) = −1 (8.3). Specialisation F = ℚ, Σ(B) = {∞}, Heegner hypothesis: recovers CST Theorem 1.1 after 8.9 and the comparison of α with the Petersson norm (8.15). Scaling: replacing f1 by c f1 multiplies both sides by c; replacing a local pairing by c times it multiplies α_v by c .

([The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9; [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Secs. 1.2.1 and 1.3.1, printed pp. 2–3 and 6; [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Erratum items 1 and 16; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, Theorem 4.2.1, p. 587; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3, equation (2.4) and following normalization comparison, p.18; [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Erratum items 28–31, 47, 57, 62.)

*Needs:* [8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#88-the-χ-heegner-point-p_χf-and-its-finite-form-p_χf), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), [8.10 The Heegner map is a toric-invariant functional](#810-the-heegner-map-is-a-toric-invariant-functional), [8.9 Toric integral versus finite trace](#89-toric-integral-versus-finite-trace), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [8.1 Projected arithmetic kernel identity](#81-projected-arithmetic-kernel-identity), [7.47 Nearby quaternionic approximation](#747-nearby-quaternionic-approximation), [0.3 The motivic centre s = 1 and the unitary centre s = 1/2](#03-the-motivic-centre-s--1-and-the-unitary-centre-s--12), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`.

### 8.13 Heegner points detect a nonzero central derivative

Use the toric character χ and Galois character χ_G of 8.10–8.11. In the essential case, fix a coefficient embedding ι:L↪ℂ. If both L′(1/2,π_A^ι,χ^ι) and the evaluated local product α^ι(f_1,f_2) are nonzero, then P_(χ_G)(f_1) is nonzero: the Gross–Zagier identity has nonzero right side in that same component. Nonzeroness of the form α alone is insufficient. For χ=1, totally real M and a polarization λ with f_2=λ∘f_1, a nonzero probability-averaged point has positive polarized height in every real coefficient realization; by the identity in each real embedding, this implies every conjugate derivative is nonzero. For strict GL(2)-type A, the product L(A/K,s) consequently has order dim A. The corresponding converse for an arbitrary finite χ would need a conjugated dual parametrization and a Hermitian coefficient-height comparison with positivity in every coefficient embedding; no target of this roadmap asserts that converse, and it does not follow merely by setting f_2=λ∘f_1.

Assume Essential case and the nonzero evaluated toric product in the same embedding as the nonzero derivative. For the proved trace-point converse: χ=1, totally real coefficient field, positive polarization, and, only to identify Skinner's P_K(f) with h_K·P_1(f_1), his (sqf), (sgn), (ram).

*Outline.* In a single embedding, the nonzero derivative times a nonzero evaluated α has nonzero product; a bilinear pairing with zero input would vanish. The constant is finite and nonzero because ζ_F(2), L(1,η) and L(1,π_A^ι,ad) are finite and nonzero (AL.3). For χ=1 identify the finite trace with h times the probability point (Skinner p.341); positivity of the polarized height detects its nonzero rational point. Apply the identity in each real embedding. Skinner’s coefficient-basis argument shows simultaneous nonzero trace realizations; then multiply the conjugate L-functions. For χ≠1 the same argument would need the Hermitian scalar-extension comparison with conjugated dual data, which does not follow from Rosati positivity of an unconjugated bilinear pairing; it is not part of this target.

*Consequences.* Skinner Proposition 2.5.1 and Corollary 2.5.2, under (sqf), (sgn), (ram): P_K(f) ≠ 0 ⇒ ord_(s=1) L(A_f/K, s) = [M_f : ℚ]. Tian–Zhang (Zhang 2010, Theorem 4.3.1(1)): ord_(s=1) L(s, π, χ) = 1 implies the same for every conjugate (external comparison: for χ ≠ 1 this target does not prove it, and Tian–Zhang use Kolyvagin's method). A non-example: a nonzero element of the Selmer group of A over K does not give a non-torsion point; the first part of the statement produces the point P_(χ_G)(f1) itself.

([A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.5, Proposition 2.5.1, arXiv v1 p. 12; published p. 341; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.5, Corollary 2.5.2, arXiv v1 p. 12; published p. 341; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1, p. 588; [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9.)

*Needs:* [8.11 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#811-the-yuanzhangzhang-grosszagier-formula-yzz-theorem-12), [8.3 Matching local signs force the global sign −1](#83-matching-local-signs-force-the-global-sign-1), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), Layer 1.

### 8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian

Use χ for the toric character, with Galois transport χ_G as in 8.10. Fix F, totally real of degree d, A/F an abelian variety parametrised by a Shimura curve with Hilbert newform φ of parallel weight two, K/F totally imaginary with relative discriminant D and absolute discriminant D_K, χ a finite Hecke character of conductor c with values in L ⊇ M. Assume ω_A · χ|_(𝔸_F^×) = 1 and ε(π_(A,v), χ_v) = χ_v η_v(−1) ε(B_v) for every v. For nonzero f1 ∈ V(π_A, χ), f2 ∈ V(π_(A^∨), χ^(-1)): L^((Σ)')(1, A, χ) = 2^(−#Σ_D) · (8π²)^d (φ, φ)_(U₀(N)) / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_(χ_G)(f1), P⁰_(χ_G⁻¹)(f2)⟩_(K,L) / (f1, f2)_(R^×), an equality in L ⊗_ℚ ℂ, with Σ = {v | (N, Dc) : if v ∥ N then ord_v(c/N) ≥ 0}, Σ_D = {v | (N, D) : ord_v(c) < ord_v(N)}, u₁ = #κ_(c₁) · [O_(c₁)^× : O^×] and L^((Σ)) the L-series with the Euler factors at Σ removed. Special case (CST Special case 1): if moreover ω_A is unramified and (N, Dc) = 1, B is the nearby quaternion algebra at a real place τ, R an admissible O-order of B, U = R̂^×, P = [h₀, 1] with h₀ the K^×-fixed point and u = #κ_c·[O_c^× : O^×], then L'(1, A, χ) = (8π²)^d (φ, φ)_(U₀(N)) / (u² √(|D_K| ‖c²‖)) · ⟨P⁰_(χ_G)(f1), P⁰_(χ_G⁻¹)(f2)⟩_(K,L) / (f1, f2)_U for any non-constant f1 : X_U → A, f2 : X_U → A^∨ sending a Hodge class to torsion, where (f1, f2)_U = f1 ∘ λ_J^(-1) ∘ f2^∨.

Here L(s, A, χ) is the L-series of the ℓ-adic realization of A tensored with the induction of χ, without archimedean Euler factors, as in Gross–Zagier V (2.1); the completed L-functions of 8.11 differ from it by the archimedean factors. Assume the local sign condition is in the Rankin–Selberg convention; it is the erratum's base-change condition ε(1/2, π_(K,v) ⊗ χ_v) = χ_v(−1) ε(B_v) because the two local root numbers differ by λ(K_v/F_v, ψ_v)² = η_v(−1) (Layer 0); (f1, f2)_U = Vol(X_U)(f1, f2) with (f1, f2) = Vol(X_U)^(-1) f1 ∘ λ_J^(-1) ∘ f2^∨ ∈ M; for an elliptic curve (f, f)_U = deg f; Unit index u₁ includes #κ_(c₁) ∈ {1, 2}, the kernel of Pic(O_F) → Pic(O_(c₁)); [0.4 The unit index u](#04-the-unit-index-u) gives u₁ only for F = ℚ and c₁ = 1; the general u₁ is defined here from CST §1.2.

*Outline.* Apply the Yuan–Zhang–Zhang formula to f1 ∈ V(π_A, χ), f2 ∈ V(π_(A^∨), χ^(-1)) and convert P_χ to P⁰_χ (8.9). Evaluate α(f1, f2) at the test vectors by the local computations of CST Proposition 2.5 (formula (2.5)), §3.4 Propositions 3.11–3.12 and Lemmas 3.13–3.14 (assembled in the proof of Theorem 1.5, p.19) and the Petersson pairing formula (CST Proposition 2.1), using the Waldspurger-side normalisations of Layer 5. Compare L(1, π_A, ad) with (φ, φ)_(U₀(N)) (CST Proposition 2.1) and collect the local factors into 2^(−#Σ_D), u₁ and ‖c₁‖.

*Consequences.* F = ℚ with the Heegner conditions recovers 8.15 (CST's Example after Theorem 1.5). Special case 2 (ω_A trivial) removes the Euler factors exactly at Σ = {v | (cD, N) : v ∥ N ⇒ v ∤ D}. Unit factor u₁ = 1 for K/F with O_(c₁)^× = O^× and κ_(c₁) = 1.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.5, p. 6; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Special case 1, p. 7; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.4, proof of Theorem 1.5, p. 19.)

*Needs:* [8.11 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#811-the-yuanzhangzhang-grosszagier-formula-yzz-theorem-12), [8.5 Admissible orders and the test-vector line V(π, χ)](#85-admissible-orders-and-the-test-vector-line-vπ-χ), [8.9 Toric integral versus finite trace](#89-toric-integral-versus-finite-trace), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [0.7 Base-change signs and measure comparison](#07-base-change-signs-and-measure-comparison), [0.4 The unit index u](#04-the-unit-index-u), Layer 4, Layer 5, [4.4 Admissible toric order](#44-admissible-toric-order), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors), [5.6 Petersson pairing as a product of local Whittaker pairings](#56-petersson-pairing-as-a-product-of-local-whittaker-pairings)

### 8.15 The Gross–Zagier formula on X₀(N) for ring-class characters

Fix φ ∈ S₂(Γ₀(N)), a newform, K imaginary quadratic of discriminant D, c ≥ 1, O_c = ℤ + cO_K and χ a primitive character of Pic(O_c). Assume (1) (c, N) = 1, no prime p | N is inert in K, and p splits in K if p² | N; (2) χ([𝔭]) ≠ a_p for every p | (N, D), 𝔭 the prime of O_K above p. Let 𝔑 ⊂ O_c be a proper ideal with O_c/𝔑 ≅ ℤ/Nℤ, P_a ∈ X₀(N)(H_c) the point of C/a → C/a𝔑^(-1), P_χ = Σ_([a] ∈ Pic(O_c)) [P_a − ∞] ⊗ χ([a]) ∈ J₀(N)(H_c) ⊗ ℂ and P_χ^φ its φ-isotypic component. Prove that L'(1, φ, χ) = 2^(−μ(N,D)) · 8π²(φ, φ)_(Γ₀(N)) / (u² √|Dc²|) · ĥ_K(P_χ^φ), where L(s, φ, χ) is the Rankin L-series of φ and the theta series of χ without the archimedean factor (centre s = 1), μ(N, D) is the number of primes dividing (N, D), u = [O_c^× : ℤ^×] and ĥ_K(a) = ⟨a, a⟩_K is the Néron–Tate height on J₀(N) relative to K for the class 2Θ (the canonical pairing of Gross–Zagier I (4.3)), extended Hermitian-linearly. For c = 1, D odd and every p | N split, this is Gross–Zagier I Theorem (6.3) in its K-relative form (6.5); YZZ Thm. 1.1 states it with the height over H, which is h_K times ĥ_K.

Assume Conditions (1)–(2) imply sign −1 for L(s, φ, χ) and B = M₂(ℚ) (CST Lemma 3.1); u = [O_c^× : ℤ^×] is half the number of roots of unity in O_c ([0.4 The unit index u](#04-the-unit-index-u) for c = 1). Heights relative to K; the cusp ∞ may be replaced by the normalised Hodge class without changing P_χ^φ, cuspidal divisors being Eisenstein. The Heegner points P_a are the coarse cyclic pairs of 0a.2 on proper O_c-ideals, for all imaginary quadratic K, including K=ℚ(√−1), ℚ(√−3). Their stabilizers are O_c×, with u=2,3 respectively at c=1. Nontrivial extra units occur only at c=1.

*Outline.* For c = 1, D odd and every p | N split, derive the formula from 8.6. Weight its identity (f, g_𝒜) = u²|D|^(1/2)/(8π²) · L'_𝒜(f, 1) by χ(𝒜) and sum over Cl_K: L(s, φ, χ) = Σ_𝒜 χ(𝒜)L_𝒜(φ, s), and bilinearity of the height pairing turns Σ_𝒜 χ(𝒜)⟨c, T_m c^σ⟩ into the coefficients of the χ-component. Projecting to φ gives ĥ_H(c_(χ,φ)) = h u²|D|^(1/2)/(8π²(φ, φ)) · L'(φ, χ, 1), with c_χ = Σ_σ χ^(-1)(σ)c^σ, which is Gross–Zagier I Theorem (6.3); the χ ↔ χ^(-1) comparison of 8.8 identifies c_χ with P_χ, and ĥ_H = h·ĥ_K (Gross–Zagier I (6.4)) gives the displayed formula with μ = 0 (Gross–Zagier I §6, p. 230; V §1, pp. 307–308). For the remaining ring-conductor, even-discriminant and ramified-level cases, use the special case of CST Theorem 1.5 (8.14) with F = ℚ, the admissible order R = {(a b; c d) ∈ M₂(ℤ̂) : N | c}, A the abelian variety of φ with M = End⁰(A), and f₁ : X₀(N) → A, f₂ : X₀(N) → A^∨, ∞ ↦ O, nonzero test vectors in V(π_A, χ^(-1)) and V(π_(A^∨), χ). The CM point fixed by K^× represents C/O_c → C/𝔑^(-1); the sum Σ_([a]) f₁(P_a)χ([a]) over Pic(O_c) is P⁰_(χ^(-1))(f₁) (8.8), which is exactly Gross–Zagier's c_χ (§8.8, the χ ↔ χ^(-1) comparison); apply Theorem 1.5 to χ^(-1), which also satisfies (1)–(2) and has L(s, φ, χ^(-1)) = L(s, φ, χ). Translate Theorem 1.5: here Σ₁ = Σ_D = {p | (N, D)}, c₁ = c and κ = 1, so 2^(−#Σ_D) = 2^(−μ(N, D)), u₁ = u and |D_K|‖c₁²‖ = |Dc²|; Σ = ∅ because p | (N, D) forces p ∥ N by condition (1) while ord_p(c/N) < 0, so L^((Σ)) = L. The denominator (f₁, f₂)_(R^×) = f₁ ∘ λ_J^(-1) ∘ f₂^∨ = c ∈ M is the level-U composition of [3.6 Volume-normalized composition pairing](#36-volume-normalized-composition-pairing), nonzero because that pairing is perfect on the two test-vector lines; for dim A > 1 it is not a degree. Then e = λ_J^(-1) ∘ f₂^∨ ∘ c^(-1) ∘ f₁ ∈ End⁰(J₀(N)) satisfies e² = e, since f₁ ∘ λ_J^(-1) ∘ f₂^∨ = c, and its image is the A-isotypic factor. The adjunction h𝒫(f₁x, f₂y) = h𝒫(x, f₁^∨f₂y) of [1.1 Poincaré height pairing](#11-poincaré-height-pairing), extended L-linearly as in 8.7, identifies ⟨P⁰_(χ^(-1))(f₁), P⁰_χ(f₂)⟩_(K,L)/(f₁, f₂)_(R^×), at the embedding L → ℂ that gives the coefficients of φ, with the Jacobian height ĥ_K(P_χ^φ) of the φ-isotypic component. Only when A is an elliptic curve and f₁ = f₂ = f under A^∨ = A is (f, f)_(R^×) = deg f (3.6), which gives the elliptic form ĥ_K(P⁰_χ(f))/deg f of CST Theorem 1.1.

*Consequences.* Constant check against YZZ Theorem 1.1: ⟨P_χ(f), P_χ(f)⟩^H_NT = h u² |D|^(1/2)/(8π²(f, f)) · L'(f, χ, 1) for odd D and c = 1 is the same identity after ⟨,⟩^H = h·ĥ_K. Unit factor: K = ℚ(√−3), c = 1 gives u = 3 and the factor 1/9; K = ℚ(i) gives u = 2. μ(N, D) > 0 only when a prime of N ramifies in K, allowed by condition (1) when p² ∤ N.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, Theorem 1.1, p. 2; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, conditions (1)–(2), p. 1; [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.1, printed p. 1; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, Theorem (6.3) and (6.5), p. 230.)

*Needs:* [8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#88-the-χ-heegner-point-p_χf-and-its-finite-form-p_χf), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), [8.4 Petersson norm, parametrisation degree and Manin constant](#84-petersson-norm-parametrisation-degree-and-manin-constant), [3.6 Volume-normalized composition pairing](#36-volume-normalized-composition-pairing), [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [0.4 The unit index u](#04-the-unit-index-u), [0.3 The motivic centre s = 1 and the unitary centre s = 1/2](#03-the-motivic-centre-s--1-and-the-unitary-centre-s--12), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), Mathlib `NumberField.classNumber`, Mathlib `NumberField.Units.torsionOrder`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, [8.6 The main identity on X₀(N): heights as Fourier coefficients](#86-the-main-identity-on-xn-heights-as-fourier-coefficients), [8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian](#814-the-explicit-grosszagier-formula-of-caishutian), [8.5 Admissible orders and the test-vector line V(π, χ)](#85-admissible-orders-and-the-test-vector-line-vπ-χ), `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent).

### 8.16 Variation of the explicit formula for other test vectors

With (A, χ), f1 ∈ V(π_A, χ), f2 ∈ V(π_(A^∨), χ^(-1)) as in 8.14, let S be a finite set of finite places and f1' ∈ π_A, f2' ∈ π_(A^∨) pure tensors agreeing with f1, f2 outside S, with ⟨f'_(1,v), f'_(2,v)⟩_v ≠ 0 and β⁰(f'_(1,v), f'_(2,v)) ≠ 0 for v ∈ S, where β⁰(f'_1, f'_2) = ∫_(F_v^× \ K_v^×) ⟨π(t) f'_1, f'_2⟩_v / ⟨f'_1, f'_2⟩_v · χ_v(t) dt. Put P⁰_χ(f1') = #Pic_(K/F)(O_(c₁)) / Vol(K^× F̂^× \ K̂^×) · ∫ f1'(P)^(σ_t) χ(t) dt (CST print #Pic(O_(c₁)); the relative group is needed for agreement with 8.14 at S = ∅, and the two counts agree for F = ℚ). Prove that L^((Σ)')(1, A, χ) = 2^(−#Σ_D) (8π²)^d (φ, φ) / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_χ(f1'), P⁰_(χ^(-1))(f2')⟩_(K,L) / (f1', f2')_(R^×) · ∏_(v ∈ S) β⁰(f_(1,v), f_(2,v)) / β⁰(f'_(1,v), f'_(2,v)), independent of the Haar measures at v ∈ S.

Assume Same hypotheses as 8.14; the ratio β⁰/β⁰ is independent of the local measure.

*Outline.* Both sides are bilinear invariant forms; by the one-dimensionality of the toric Hom spaces their ratio for (f1', f2') against (f1, f2) is the ratio of the local toric integrals at v ∈ S. Apply 8.14 to (f1, f2) and substitute.

*Consequences.* CST's example: A = X₀(36), K = ℚ(√−3), p ≡ 2 mod 9 prime, χ the cubic character of K(∛p)/K (c = 3p, c₁ = p, #Σ_D = 1, u₁ = 1), f' = id: here Σ = {3} and the Euler factor at 3 is 1, so L^((Σ)) = L, and L'(1, A, χ) = 9 · 8π²(φ, φ)_(Γ₀(36)) / √(3p²) · ⟨P⁰_χ(f'), P⁰_(χ^(-1))(f')⟩_(K,K), from (f', f')_(R^×) = 2/9 and β⁰(f_v, f_v)/β⁰(f'_v, f'_v) = 1 at v = 2 and 4 at v = 3 (9 = 2^(−1)·(9/2)·4); CST write L'^((∞)). Taking S = ∅ recovers 8.14.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8; [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Example after Theorem 1.6, p. 8.)

*Needs:* [8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian](#814-the-explicit-grosszagier-formula-of-caishutian), [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), Layer 4, [4.4 Admissible toric order](#44-admissible-toric-order), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), [4.7 Explicit local toric constants at test vectors](#47-explicit-local-toric-constants-at-test-vectors)

### 8.17 Heegner points on X_(N⁺,N⁻) over ℚ and the trivial character

Fix f ∈ S₂(Γ₀(N)), a normalized newform with trivial nebentypus and Hecke field M_f, K imaginary quadratic of discriminant D, and assume (sqf) N squarefree, (sgn) ε(f, K) = −1 and (ram) — if (D, N) ≠ 1 then π_ℓ ≅ σ_ℓ ⊗ ξ_ℓ for ℓ | (D, N), where σ_ℓ is Steinberg and ξ_ℓ is the unramified quadratic character, and every ℓ | N/(D, N) splits in K. Then either (Case I) every ℓ | N splits or ramifies in K and X = X₀(N), or (Case II) N = N⁺N⁻ with N⁻ a nontrivial product of an even number of inert primes and N⁺ the product of the primes of N that split in K (so (D, N) = 1), and X = X_(N⁺,N⁻) is the Shimura curve of the indefinite quaternion algebra of discriminant N⁻ and an Eichler order of level N⁺. Let φ : J(X) → A_f be the quotient by the kernel of the f-eigencharacter, P_K(f) ∈ (A_f(K) ⊗_ℤ ℚ) ⊗_ℚ M_f = A_f(K) ⊗_ℤ M_f the trace Heegner eigenpoint of Skinner §2.4, selected by the coefficient projector, and L a symmetric ample line bundle on A_f with polarisation λ. Write f1 for the induced Hodge-normalized rational morphism X → A_f and f2 = λ ∘ f1. Put u_K = [O_K^× : ℤ^×] and μ(N,D) = #{ℓ : ℓ | (N,D)}. For the embedding ι : M_f ↪ ℝ selecting f, prove

```text
⟨P_K(f)^ι, P_K(f)^ι⟩_{L,K}
  = 2^{μ(N,D)} u_K² √|D| / (8π² (f,f)_{Γ₀(N)})
      · L'(f,K,1) · (f1 ∘ λ_J^(-1) ∘ f2^∨)^ι.
```

Here L(s,f,K) is the finite Rankin L-series, with centre 1 and no archimedean factor, and the height is relative to K: it is the diagonal of the Poincaré pairing with λ, equivalently the full polarization of the canonical L-height (1.1). For M_f ≠ ℚ it is the ι-component obtained from the trace-dual M_f-valued pairing of 8.7; the real eigenpoint notation means that same component, rather than the trace over all embeddings. Consequently P_K(f) ≠ 0 if and only if L'(f,K,1) ≠ 0, and then ord_(s=1) L(A_f/K,s) = [M_f : ℚ].

Inside the scope of ArithmeticStatisticsPartVI, “Heegner logarithm and low rank” (an elliptic curve E with its specified isogeny from the marked f-Jacobian factor, its ordinary, squarefree-level and residual hypotheses, and a one-dimensional Bloch–Kato Selmer group with injective restriction), the height formula for its E-valued Heegner class is that target's, imported with its marked divisor, quotient and isogeny; 8.8 identifies that class with the image of P_K(f). This target owns the formula outside that scope: for every f and K satisfying (sqf), (sgn) and (ram), with A_f of any dimension and without Selmer, residual or ordinary hypotheses.

*Outline.* The sign condition and (ram) give the two cases of Skinner §2.4. Choose the optimal embedding O_K into the Eichler order specifying its CM point. In Case I, (ram) gives a_ℓ = −1 at ℓ | (N,D), so χ=1 satisfies CST's condition χ([𝔩]) ≠ a_ℓ; in Case II (N,D)=1. Thus f1 and f2 are the test vectors in CST Theorem 1.5 and its Special case 2 (8.14). With c=1, its exceptional Euler set Σ is empty: a prime in (N,D) has valuation one in N and divides D. Also Σ_D consists of the μ(N,D) common primes, κ_1=1 and u₁=u_K. Its finite Heegner sum P⁰_1(f1) is the trace of the Hodge-normalized point. The coefficient projector of Skinner §2.4 selects its ι-component, so the numerator of CST's pairing is exactly the height displayed here; do not introduce an extra class-number factor into this finite-sum formula. Solve 8.14 for that height. The norm, u_K and √|D| are positive, and f1 ∘ λ_J^(-1) ∘ f2^∨ ≠ 0 by the positive Rosati pairing and the nonzero quotient f1. Positivity of the polarized height and 8.13 give nonvanishing and the product order over the conjugate newforms.

**Checks.**

- In the split modular case with M_f=ℚ and A_f=E, f1 ∘ λ_J^(-1) ∘ f2^∨ = deg(f1) for the principal polarisation. Dividing the displayed height by deg(f1) gives exactly 8.15 at c=1, χ=1.
- For (N,D)=1 the coefficient is u_K²√|D|/(8π²(f,f)); each ramified level prime contributes an additional factor 2. The inverse derivative formula has 2^(−μ(N,D)).
- K=ℚ(√−3) has u_K=3, hence a factor 9 in the height formula; replacing u_K by the full root-of-unity count would multiply this constant by 4.
- For the probability-averaged eigenpoint P_K(f)/h_K the height and the right-hand side are divided by h_K². The finite trace formula itself contains no additional h_K².
- Replacing λ by nλ for a positive integer n multiplies both the height and f1 ∘ λ_J^(-1) ∘ f2^∨ by n; replacing f1 by 2f1 multiplies both by 4.

*Consequences.* Case I with (D,N)=1 and D odd is the classical setting; Case I with ramified primes includes JSW's (gen-H) with N⁻=1; Case II is (JSW-H) with N⁻≠1 at squarefree N. The ℚ-relative height of the same algebraic eigenpoint is half the K-relative height. A formula using completed adjoint and quadratic values requires the simultaneous point, measure and height conversions of 8.9 before comparison with this finite L-series formula.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.5, p. 6, Special cases 1–2, p. 7; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.4, Cases I and II and the trace eigenpoint, pp. 10–11; §2.5, Proposition 2.5.1 and proof, pp. 11–12.)

*Needs:* [8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian](#814-the-explicit-grosszagier-formula-of-caishutian), [8.5 Admissible orders and the test-vector line V(π, χ)](#85-admissible-orders-and-the-test-vector-line-vπ-χ), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), [8.13 Heegner points detect a nonzero central derivative](#813-heegner-points-detect-a-nonzero-central-derivative), [8.9 Toric integral versus finite trace](#89-toric-integral-versus-finite-trace), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), HilbertModularVarietiesAndShimuraCurves R18.1.3, [1.1 Poincaré height pairing](#11-poincaré-height-pairing), `AutomorphicLFunctionsAndLocalFactors:AL.3`, HilbertModularVarietiesAndShimuraCurves R18.1.4, ArithmeticStatisticsPartVI, “Heegner logarithm and low rank” (its marked divisor, isogeny and point, for the comparison inside its scope).

### 8.18 Non-torsion of the trace point on a parametrised GL(2)-type quotient

Fix F, totally real, B/F ramified at all real places but one and at a finite set S_B with #S_B ≡ [F:ℚ] − 1 mod 2, R an admissible order for (π_A, 1) in the sense of 8.5, X_U the Shimura curve of U = R̂^×, A/F a simple quotient of J(X_U) of strict GL(2)-type with M = End⁰(A), K/F totally imaginary with ε(1/2, π_(A,v), 1_(K,v)) = η_v(−1)ε(𝔹_v) for every place v, where 𝔹 is the incoherent algebra with B as nearby algebra (CST Theorem 1.5 (2); in particular every v ∈ S_B is nonsplit in K), x ∈ X_U a CM point by K of the admissible level, and f : X_U → A the quotient map normalised by the Hodge class (ι(P) = m[P] − mξ). Assume ω_A is trivial (CST hypothesis (1) with χ = 1) and (N, D) = 1. Put y = Tr_(K(x)/K) f(x) ∈ A(K)_ℚ; here K(x) = H_K and y = (h_F/#κ_1)·P⁰_1(f) with κ_1 = ker(Pic(O_F) → Pic(O_K)), so y and P⁰_1(f) are torsion together. Prove that y has infinite order if and only if L'(1, A, 1_K) ≠ 0 in M ⊗ ℂ, if and only if ord_(s=1) L(A/K, s) = [M : ℚ] = dim A. In particular, analytic rank exactly dim A over K for L(A/K, s) certifies that this specified y is non-torsion; analytic rank alone without the admissible level does not.

Assume the CM point x has the admissible level, so f is a test vector (α(f, f^∨) ≠ 0); for a non-admissible level y may be torsion although L'(1, A, 1_K) ≠ 0. Each conjugate L(s, π_A^ι, 1_K) has root number −1 because the local signs match B (8.3), so its order is odd. The rank deduction by Kolyvagin–Logachev descent belongs to the downstream Euler-system roadmap and is not used here.

*Outline.* Apply the special case (N, Dc) = 1 of 8.14 with χ = 1: L'(1, A, 1) is a nonzero multiple of ⟨y, λ y⟩_(K,M) / (f, λ ∘ f)_U. Positivity of the Néron–Tate pairing for the polarisation λ (Layer 1) makes ⟨y, λ y⟩_(K,M) totally positive in M ⊗ ℝ when y has infinite order and zero otherwise. Conclude with the χ = 1 part of 8.13: the conjugate derivatives vanish simultaneously, and L(A/K, s) = ∏_ι L(s − 1/2, π_A^ι, 1_K).

*Consequences.* For F = ℚ, A = E and B = M₂(ℚ) this is the Gross–Zagier criterion y_K non-torsion ⟺ L'(E/K, 1) ≠ 0. The integer m clearing the Hodge denominator scales y by m and does not affect non-torsion.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Special case 1, p. 7; [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1, p. 588.)

*Needs:* [8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian](#814-the-explicit-grosszagier-formula-of-caishutian), [8.5 Admissible orders and the test-vector line V(π, χ)](#85-admissible-orders-and-the-test-vector-line-vπ-χ), [8.13 Heegner points detect a nonzero central derivative](#813-heegner-points-detect-a-nonzero-central-derivative), [8.3 Matching local signs force the global sign −1](#83-matching-local-signs-force-the-global-sign-1), [1.1 Poincaré height pairing](#11-poincaré-height-pairing), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), HilbertModularVarietiesAndShimuraCurves R18.1.3, [4.4 Admissible toric order](#44-admissible-toric-order), [4.6 Nonzero toric test vectors](#46-nonzero-toric-test-vectors), HilbertModularVarietiesAndShimuraCurves R18.1.4.

### 8.19 Heights of Heegner points on an elliptic curve

Fix E/ℚ of conductor N, f : X₀(N) → E a modular parametrisation with f(∞) = O, Manin constant C and Néron differential ω₀, and K, c, χ as in 8.15. Put P⁰_χ(f) = Σ_([a] ∈ Pic(O_c)) f(P_a) ⊗ χ([a])^(-1) ∈ E(H_c)_ℂ (8.8; CST’s sum with χ([a]) is P⁰_(χ^(-1))(f) and has the same K-height). Prove that L'(1, E, χ) = 2^(−μ(N,D)) · 8π²(φ, φ)_(Γ₀(N)) / (u² √|Dc²|) · ĥ_K(P⁰_χ(f)) / deg f = 2^(−μ(N,D)) · ‖ω₀‖² ĥ_K(P⁰_χ(f)) / (C² u² √|Dc²|). For χ = 1 and c = 1, P⁰_1(f) = P_K(f) = Tr_(H_K/K) f(P_(O_K)) ∈ E(K), with P_(O_K) the Heegner point P_a of 8.15 at a = O_K, and ĥ_K(P_K(f)) = ⟨P_K(f), P_K(f)⟩_BSD computed over K, which is Tau Ceti's `canonicalHeight` of the K-point P_K(f) for the K-relative height; it is nonzero exactly when P_K(f) has infinite order.

Assume Heegner conditions (1)–(2) of CST; ĥ_K is the Néron–Tate height relative to K for the class 2(O) (Gross–Zagier I (4.3); the x-height normalisation of Layer 0). With Mathlib NumberField.instAdmissibleAbsValues on K, Tau Ceti's `canonicalHeight` on E(K) is the K-relative x-height, so on K-points ĥ_K = canonicalHeight = Layer 0's h_x over K, while on points over H_c the K-relative height is 1/[H_c:K] times the H_c-relative one; deg f and C are data of f; replacing f by its composite with an isogeny changes both and leaves the formula invariant.

*Outline.* The φ-isotypic projection commutes with f_*: J₀(N) → E, and the height on E pulls back along f to deg f times the height on the f-isotypic part of J₀(N) (projection formula ⟨f x, f x⟩_E = ⟨x, f^∨ f x⟩_J; since f ∘ f^∨ = [deg f] on E, f^∨ ∘ f acts as deg f on the φ-isotypic part f^∨(E) ⊗ ℂ). Combine 8.15 with 8.4. For χ = 1 and c = 1 the χ-sum is the Galois trace over Pic(O_K) ≅ Gal(H_K/K) ([0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit)).

*Consequences.* Gross–Zagier's form L'(E/K, 1) = ‖ω₀‖² ĥ_K(y_K) / (C² u² √|D|) (Gross–Zagier write c for the Manin constant C) for (N, D) = 1 and c = 1 is the case μ = 0. Isogeny invariance: for ψ : E → E' of degree d, ĥ(ψ P) = d ĥ(P), deg(ψ ∘ f) = d deg f, and C changes by c_ψ; both sides of the second formula are unchanged. For 37.a1 and K = ℚ(√−7) the right side must match L'(E/K, 1) = L'(E, 1) L(E^K, 1), a positive real number; a sign or factor-2 error in the height convention is detected by this check. Gross–Zagier I Theorem (7.3) (L'(E, 1) is a nonzero rational multiple of Ω·⟨P, P⟩) is deduced from this target (Theorem V (2.1)) together with a choice of K with L(E^K, 1) ≠ 0, which is a hypothesis and not a target here.

([Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, Theorem 1.1, second display, p. 2; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.4, p. 11; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §2, Theorem (2.1), p. 311.)

*Needs:* [8.15 The Gross–Zagier formula on X₀(N) for ring-class characters](#815-the-grosszagier-formula-on-xn-for-ring-class-characters), [8.4 Petersson norm, parametrisation degree and Manin constant](#84-petersson-norm-parametrisation-degree-and-manin-constant), [0.1 The dictionary of height conventions](#01-the-dictionary-of-height-conventions), [0.9 Trace versus normalised average of a Galois orbit](#09-trace-versus-normalised-average-of-a-galois-orbit), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), EllipticCurveModularity Layer R29.5, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`, Mathlib `WeierstrassCurve.Affine.Point`, Mathlib NumberField.instAdmissibleAbsValues.

### 8.20 Corollaries on derivatives: positivity and Galois invariance

Under the hypotheses of the Gross–Zagier formula on X₀(N): (a) for every newform f ∈ S₂(Γ₀(N)) and every character χ of Gal(H/K), L'(f, χ, 1) ≥ 0; (b) either all conjugates L(f^α, χ^α, s), α ∈ Gal(ℚ̄/ℚ), have a simple zero at s = 1, or all have a zero of order ≥ 3; (c) for every newform f and α, ord_(s=1) L(f, s) = 0 iff ord_(s=1) L(f^α, s) = 0, hence also ≥ 2 iff ≥ 2 when the root number w(f) = +1; and if there is an imaginary quadratic K with the Heegner hypothesis, D odd and L(f ⊗ ε_K, 1) ≠ 0 (which forces w(f) = −1, so all orders are odd), then ord_(s=1) L(f, s) = 1 iff ord_(s=1) L(f^α, s) = 1, and ord ≥ 3 iff ord ≥ 3. (Gross–Zagier's '≥ 3' line for w(f) = +1 is not claimed.)

Assume (a)–(b): the Heegner hypothesis and D odd, as in 8.6; the order-one part of (c) takes as a hypothesis an imaginary quadratic K with the Heegner hypothesis and L(f ⊗ ε_K, 1) ≠ 0 (such a K forces w(f) = −1, and Waldspurger's theorem provides one when w(f) = −1; it is a hypothesis of (c)). Galois conjugates are taken on the coefficients of f and the values of χ.

*Outline.* (a) L'(f, χ, 1) = 8π²(f, f)/(h u² |D|^(1/2)) ĥ(c_(χ,f)); here (f, f) > 0 for f ≠ 0 (CuspForm.peterssonInnerCosets_self_re_nonneg, _self_im and _self_eq_zero: a nonnegative real, zero only at f = 0) and the Néron–Tate pairing is positive definite. (b) ord_(s=1) L(f^α, χ^α, s) is odd by the functional equation (sign −1); L'(f^α, χ^α, 1) = 0 iff c_(χ^α, f^α) = 0, and c_(χ^α, f^α) = (c_(χ,f))^α, so all vanish together. Order zero: L(f, 1)/Ω_f is algebraic and Galois-equivariant (Shimura), so L(f, 1) = 0 iff L(f^α, 1) = 0; with equal root numbers this also gives ≥ 2 for w(f) = +1. Order one (w(f) = −1): with K as in (c), L(f^α ⊗ ε_K, 1) ≠ 0 for all α by the same algebraicity applied to f ⊗ ε_K; then ord L(f^α, s) = ord L(f^α/K, s) and (b) with χ = 1 gives simultaneous simple zeros; odd parity turns ≥ 2 into ≥ 3.

*Consequences.* (a) is what the Riemann hypothesis predicts for the real function L(f, χ, s) on the real axis. Agreement with the χ = 1 part of 8.13 over a totally real field.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, Corollaries (1.1)–(1.2), pp. 308–309; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, Corollary (1.3), p. 309.)

*Needs:* [8.15 The Gross–Zagier formula on X₀(N) for ring-class characters](#815-the-grosszagier-formula-on-xn-for-ring-class-characters), [8.13 Heegner points detect a nonzero central derivative](#813-heegner-points-detect-a-nonzero-central-derivative), [8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1))](#87-the-l-linear-nérontate-pairing-on-aχ--aχ-1), `AutomorphicLFunctionsAndLocalFactors:AL.3`, TauCetiRoadmap.ModularForms Layer 8G, Tau Ceti `CuspForm.peterssonInnerCosets_self_eq_zero`, ModularSymbolsPadicLFunctions Layer 1, Tau Ceti CuspForm.peterssonInnerCosets_self_re_nonneg, Tau Ceti CuspForm.peterssonInnerCosets_self_im.

### Examples

For F=ℚ the relative finite torus orbit has #Pic(O_c) elements. A probability average is h^(-1) times its finite sum, and its height is h^(-2) times the finite-sum height over the same field. For K=ℚ(√−3), c=1, the classical global constant has the factor u^(-2)=1/9. A ramified level prime contributes the separate 2^(−μ(N,D)) factor.

### Dependencies

ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, for the marked overlap comparison; earlier layers 0a, 0, 1, 3, 4, 5, 6, 7. The direct external interfaces used above are Mathlib `Algebra.trace`, Mathlib `CongruenceSubgroup.Gamma0`, Mathlib `CuspForm`, Mathlib `DirichletCharacter.LFunction`, Mathlib `LinearMap`, Mathlib `Module.End.eigenspace`, Mathlib `NumberField.IsCMField`, Mathlib `NumberField.Units.torsionOrder`, Mathlib `NumberField.classNumber`, Mathlib NumberField.instAdmissibleAbsValues, Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, Mathlib `QuadraticMap.polar`, Mathlib `TensorProduct`, Mathlib `UpperHalfPlane.petersson`, Mathlib `WeierstrassCurve.Affine.Point`, Mathlib `completedRiemannZeta`, Mathlib `riemannZeta`, Tau Ceti `CuspForm.peterssonInnerCosets_eq_peterssonInner`, Tau Ceti `CuspForm.peterssonInnerCosets_self_eq_zero`, Tau Ceti CuspForm.peterssonInnerCosets_self_im, Tau Ceti CuspForm.peterssonInnerCosets_self_re_nonneg, Tau Ceti `CuspForm.peterssonInnerCosets`, Tau Ceti `HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq`, Tau Ceti `HeckeRing.GL2.Newform`, Tau Ceti `TauCeti.cuspFormsNew`, Tau Ceti `TauCeti.cuspFormsOld`, Tau Ceti `TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, Tau Ceti `UpperHalfPlane.peterssonInner`, Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`, Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`, TauCetiRoadmap.ModularForms Layer 4, TauCetiRoadmap.ModularForms Layer 8G, `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, EllipticCurveModularity Layer R29.5, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, [0a.1 Ring-class tower comparisons](#0a1-ring-class-tower-comparisons), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), HilbertModularVarietiesAndShimuraCurves R18.1.3, HilbertModularVarietiesAndShimuraCurves R18.1.4, ModularSymbolsPadicLFunctions Layer 1. The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Layer 9: Weight-two anticyclotomic functions and logarithms

Start with a bounded linear root measure on the fixed tame branch. Twist and push it to the anticyclotomic quotient before squaring, and compare the resulting central-value function with squared formal logarithms using the selected differential and period.

### 9.1 Cotangent saturation for good-reduction optimal quotients

Let R be a mixed-characteristic DVR of residue characteristic p with e=v_R(p)<p−1. Suppose 0→B→J→A→0 is an exact sequence of abelian varieties, with connected kernel B and good reduction of J. Then all three extend to abelian schemes and the Néron sequence is exact with J→A smooth and surjective. The cotangent sequence
0→ω_A→ω_J→ω_B→0
is exact over R; since ω_B is finite free, ω_A is a direct summand and its quotient is torsion free. This conclusion does not require a prime-to-p isogeny assumption. Over finite extensions of ℚ_p it is the good-reduction specialization of NeronModelsAndSemistableAbelianVarieties §6.4d; this target proves its extension to the stated general DVRs.

*Outline.* For finite K/ℚ_p import NeronModelsAndSemistableAbelianVarieties §6.4d, SemistableQuotientCotangent, specializing its semistable middle variety to good reduction. Extend the good-reduction statement to the stated mixed-characteristic DVRs by BLR §7.5 Theorem 4(iii), which gives exactness of the abelian schemes under e<p−1. Smoothness gives the exact Lie sequence, duality the displayed cotangent sequence, and finite projectivity splits it as R-modules.

Its API consists of the following facts:

- The stated general-DVR good-reduction quotient has the exact sequence of Néron models and the dual exact sequence of invariant cotangents.
- The cotangent inclusion is saturated and is a direct summand because its quotient is finite free.
- These sequences and splittings as modules are compatible with unramified base extension.

**Checks.**

- Over ℤ_p with p odd, e=1<p−1; at p=2 this argument supplies no conclusion.
- For R=ℤ₃ and J=B×A, the imported cotangent sequence splits with ranks dim A, dim A+dim B, dim B. The zero A or B case has ranks 0,dim B,dim B or dim A,dim A,0.
- An inclusion pR⊂R has torsion quotient and is not saturated; integrality of a pullback alone is insufficient.
- An isogeny with nontrivial finite kernel does not meet the connected-abelian-kernel hypothesis and cannot inherit the statement from optimality terminology alone.

(Bosch–Lütkebohmert–Raynaud, *Néron Models*, §7.5 Theorem 4, printed pp. 186–188, especially (iii), p. 187; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), proof of Proposition 5.1.7, pp. 34–35.)

*Needs:* `NeronModelsAndSemistableAbelianVarieties:R11.1` for Néron models and invariant cotangents, AbelianSchemesAndArithmeticModuli A1.3 for invariant differentials and the Lie algebra of abelian schemes; NeronModelsAndSemistableAbelianVarieties §6.4d for finite K/ℚ_p; this target owns its good-reduction general-DVR extension.

### 9.2 The algebraic-point subgroup input to eigenlogarithms

Fix an embedding ℚ̄→ℂ_p. For a commutative algebraic group G over ℚ̄, let log_G be the p-adic logarithm on its domain G(ℂ_p)_f, with values in Lie(G)⊗ℂ_p.

**The p-adic analytic subgroup theorem** (Fuchs–Pham Theorem 2.2; also Matev). Let G have positive dimension and let V⊆Lie(G) be a nonzero ℚ̄-subspace. If γ∈G(ℚ̄) lies in the domain of log_G and 0≠log_G(γ)∈V⊗ℂ_p, then there is an algebraic subgroup H⊆G of positive dimension, defined over ℚ̄, with Lie(H)⊆V and γ∈H(ℚ̄).

**The abelian algebraic-point form** (Burungale–Skinner–Wan Theorems 3.1–3.2). Let A be an abelian variety over ℚ̄ and x∈A(ℚ̄); every such point lies in the domain of log_A, since it is defined over a finite extension of ℚ_p, where A has compact points. For a ℚ̄-linear subspace W⊆Lie(A) with log_A(x)∈W⊗ℂ_p, there is an algebraic subgroup B⊆A over ℚ̄ with Lie(B)⊆W and x∈B(ℚ̄). Its identity component B° contains mx for some nonzero integer m. If a number field F acts through End⁰(A) and W is F-stable, then B° may be chosen F-stable, with the same Lie inclusion and mx∈B°. The statement concerns algebraic points only; it does not apply to arbitrary ℂ_p-points or formal tensor vectors.

*Outline.* For the theorem, induct on dim G (Fuchs–Pham §4.4). In the semistable case of a pair (G,V) with V proper (Proposition 2.5), a nontorsion algebraic point cannot have its logarithm in V⊗ℂ_p. To prove this, construct an auxiliary polynomial vanishing to high order along V at many multiples of γ by Siegel's lemma (§4.2), extrapolate with the p-adic Schwarz lemma (§3.3), and contradict a multiplicity estimate (§4.3). If (G,V) is not semistable, pass to a semistable quotient G→G′ (Lemma 3.1): the image of γ has logarithm in the image of V, hence is torsion, and a multiple of γ lies in the kernel, of smaller dimension. For the abelian form, if log_A(x)=0 then x is torsion and B is finite; otherwise apply the theorem with V=W. Pass to the identity component and a multiple of x. Choose an order O⊂F acting on A with ℤ-basis 1,α₁,…,α_r and replace B° by B°+α₁B°+…+α_rB°; F-stability of W keeps the Lie algebra inside W. The eigenlogarithm target then applies Burungale–Skinner–Wan's dimension and real-embedding argument.

Its API consists of the following facts:

- The analytic subgroup theorem gives the positive-dimensional subgroup under the stated nonzero-logarithm hypotheses.
- For an algebraic abelian point the subgroup contains the point, and its identity component contains a nonzero integer multiple.
- An endomorphism-stable Lie subspace permits an endomorphism-stable connected subgroup.
- The zero Lie-subspace case is equivalent to torsion of the algebraic point.

**Checks.**

- W=0 forces x torsion, since the subgroup has dimension zero; it does not force x=0.
- For A=A₁×A₂ and x=(x₁,0), W=Lie(A₁) gives the proper subgroup A₁×0, so no simplicity conclusion is implicit.
- For a torsion point, log_A(x)=0 and a zero-dimensional H is allowed.
- For G=𝔾_a×𝔾_m and V the diagonal line in Lie(G)=ℚ̄², no positive-dimensional algebraic subgroup has Lie algebra in V. Hence for algebraic α≠0 in the convergence disc of the p-adic exponential, α and exp_p(α) are not both algebraic: the theorem has the p-adic Hermite–Lindemann theorem as a special case.
- A nonalgebraic p-adic point lying on an analytic line has no asserted algebraic subgroup here.

([The p-adic analytic subgroup theorem revisited](https://arxiv.org/abs/1502.00768v1), C. Fuchs and D. H. Pham, §2 Theorem 2.2, p. 2, Proposition 2.5, p. 3, §§3.2–3.3, p. 4, §4.2, p. 7, §4.4, p. 12; [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §3, Theorems 3.1–3.2, pp. 9–10; their use in Theorem 1.1, §2.)

*Needs:* AbelianSchemesAndArithmeticModuli Layer A6 for abelian subvarieties, endomorphisms and connected components, EffectiveDiophantineMethods §4.2 for log_A and its tangent map, TauCetiRoadmap.DiophantineApproximationAndTranscendence Layer 0 (heights) and §2.8 (the fixed-field Siegel lemma); the multiplicity estimate and the p-adic Schwarz lemma are part of this target.

### 9.3 CM coefficient rings, Amice series and interpolation uniqueness

Let p be a prime and R a complete discrete valuation ring of mixed characteristic (0,p) containing the coefficient integers, with uniformizer ϖ and v(ϖ)=1. For the weight-two BDP application p is odd and R may be the completion of O_L·O_(ℚ_p^ur), whose residue field is infinite; the two consequences below hold for every p. Bounded R-valued measures on ℤ_p, their moments and their Amice transforms are those of TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §§2.1 and 2.5. Its boundedInvTransform inverts the Amice transform for every complete ultrametric coefficient ring, so every series in R⟦T⟧ is the transform of a unique bounded measure. The invariants μ(F) and λ(F) of a nonzero F∈R⟦T⟧, the factorization F=ϖ^μ·U·P with U a unit and P distinguished of degree λ, the additivity of μ and λ under products, and the count of zeros of F in the open unit disc by λ are TauCetiRoadmap.NewtonPolygons §§6.3–6.4. Neither imposes a finite residue field, and neither is restated here.

This target proves the two consequences used in this layer.
1. Interpolation uniqueness. If F,G∈R⟦T⟧ agree at infinitely many distinct points of the open unit disc of a complete extension of R, then F=G, since a nonzero F−G has at most λ(F−G) zeros there. The statement is false for unbounded analytic functions on the open disc.
2. Parity. For a unit U and a nonzero G in R⟦T⟧, μ(UG²)=2μ(G) and λ(UG²)=2λ(G).

*Outline.* For (1) apply the zero count of NewtonPolygons §6.4 to F−G after passing to a complete splitting extension; evaluation at a point of the open disc converges because the coefficients are bounded. For (2) apply the additivity of NewtonPolygons §6.3 and note that a unit has μ=λ=0.

Its API consists of the following facts:

- Agreement at infinitely many distinct open-disc evaluations determines a bounded series uniquely.
- A nonzero unit times a square has μ and λ twice those of the root.
- For a continuous isometric coefficient extension, transport of measures and series precedes evaluation and commutes with it.

**Checks.**

- For F=ϖ²(T+ϖ)³, μ=2 and λ=3, whether or not the residue field is finite.
- The series ϖ+T has the single zero −ϖ in the open disc; a nonzero constant has none.
- For F=U·G²≠0, μ(F)=2μ(G) and λ(F)=2λ(G); a scalar of odd positive valuation is not a unit, and multiplying by it breaks the parity of μ.
- log(1+T) vanishes at ζ−1 for every p-power root of unity ζ, infinitely many points of the open disc, yet is nonzero: its coefficients are unbounded, so uniqueness needs coefficients in R.
- The Dirac mass at 1 has series 1+T, and its convolution square is the Dirac mass at 2, with series (1+T)²; squaring moment values without convolution does not define the central-value adapter.

([On the non-triviality of generalised Heegner cycles modulo p, II](https://arxiv.org/abs/1504.02342v1), §5.2 Lemma 5.5, pp. 27–29, for this unramified CM coefficient ring.)

*Needs:* TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §§2.1, 2.5 (moments, Amice transform and boundedInvTransform), TauCetiRoadmap.NewtonPolygons §§6.3–6.4 (μ, λ, preparation with a uniformizer power, additivity, zeros in the open unit disc), Mathlib `PowerSeries`.

### 9.4 Integral ordinary CM moments on modular and Shimura curves

Let p split in the imaginary quadratic CM field K. Either p is prime to the curve's level, or the curve is X₀(N) with p∥N and we restrict to the ordinary component with its canonical connected cyclic p-subgroup (the infinity component). In the latter case forgetting that canonical subgroup identifies its completed ordinary deformation with the prime-to-p-level deformation; no supersingular point or opposite component is included. Work first on a fine auxiliary prime-to-p level cover of the smooth ordinary locus of X₀(N), X₁(N) or the indefinite quaternionic curve. Choose the CM idempotent, bases of its connected and étale Tate modules and an invariant differential. Serre–Tate deformation theory gives a formal coordinate Q=1+t; the Gauss–Manin/unit-root splitting identifies the differential operator with D=(1+t)d/dt. For an integral modular form F, let F_x(t)∈R⟦t⟧ be its expansion at the CM point x. Construct its bounded local measure by ∫(1+t)^z dμ_x(z)=F_x(t), and prove ∫z^j dμ_x(z)=D^jF_x(0) for all j≥0. Define ideal translates before summing over the actual finite CM orbit.

If a change of Tate-module basis replaces the coordinate Q by Q′=Q^a with a∈ℤ_p×, then D′=a^(−1)D, so the j-th moments are multiplied by a^(−j). By contrast the function Q^a, in a fixed coordinate, is the Dirac mass at a, with j-th moment a^j. Changing the differential by a unit changes the weight-k expansion by that unit's −k power, together with the corresponding CM period change. Prove compatibility with the prime-to-p ideal action, norm and conductor using the integral isogeny, not just equality of complex CM points. Descend the finite translated sum from the fine cover by equivariance of sections and pushforward of measures. Do not average by an automorphism or class-group order that may be divisible by p.

**CM periods and the root distribution.** Consume ComplexMultiplicationAndExplicitReciprocity §1.3 (`cmPeriodPairings`, `cmHodgeEigenspaces`) for the complex CM eigenspaces and integration pairing, and AbelianSchemesAndArithmeticModuliPartII §§P4.1–P4.3 for the fixed ordinary CM formal trivialization. For the marked ordinary CM elliptic curve or false elliptic surface and its chosen differential of 0a.5, specialize those supplied pairings to compare the marked algebraic differential with its complex uniformizing differential and ordinary formal-group differential; fix the ratios by ω_alg=Ω_∞ω_uniform and ω_alg=Ω_pω_formal; these equations define the nonzero periods in the selected embeddings. For a weight-k form and its j-th invariant derivative, prove that division by Ω_∞^(k+2j) gives the algebraic CM value and that its p-adic image is the corresponding ordinary derivative divided by Ω_p^(k+2j). The period is attached to the marked differential and its Tate-module trivialization, rather than to the unmarked CM point. Form the finite ideal-translated moments of the p-depleted weight-two form, with the fixed tame character and conductor, and prove compatibility under every ring-class trace map. Their compatible integral distributions define a bounded anticyclotomic linear root. At an algebraic character ψ in the central-critical interpolation range, its value is the weighted sum of these normalized CM derivatives with the local p-depletion factors; convolution square with the specified normalization gives the values in §9.15. The GL₂ specialization is Castella–Hsieh §3.3, Definition 3.7 and Proposition 3.8, pp. 13–14 (castella-hsieh line 670 and castella-hsieh line 680); the quaternionic specialization is Brooks §8.4, definition preceding Proposition 8.9, and Proposition 8.10. These are owned weight-two root targets; the general measure algebra is supplied by PadicMeasuresIwasawaAlgebras.

**Checks for CM periods and roots.**

- For weight two, scaling ω_alg by 2 divides the algebraic value by 4 and multiplies Ω_∞² by 4, so their product, the analytic value, stays fixed: (1/4)·4=1. The normalized algebraic value itself changes by 1/4.
- A one-point CM orbit with expansion 1+t has zeroth moment 1 and second moment 1; using the ordinary second derivative would give 0.
- Before squaring, the compatible finite CM sum is linear in the modular form: replacing f by 2f multiplies the root by 2 and its convolution square by 4.

*Outline.* Combine the ordinary deformation equation with the Poincaré trivialization and horizontal splitting of AbelianSchemesAndArithmeticModuliPartII §§P4.1–P4.3. That supplier fixes an individual CM abelian scheme; the moduli-coordinate and descent assertions here are additional. Brooks §3 constructs the QM ordinary coordinate and its differential operator. Apply the inverse Amice transform boundedInvTransform of TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §2.5 to each integral expansion, then use Burungale Lemma 5.5 and the shape of (5.8), summed over all of Cl(O_K) as in 9.11, for the finite translated orbit sum. For the p∥N alternative, use the canonical connected subgroup to identify the chosen ordinary completed chart with that at level N/p; use the pullback differential and its unit-root trivialization on this chart. Annular continuation across the supersingular locus is the separate semistable-integration target. Check the auxiliary-level descent on both the modular form and the Igusa trivialization. This supplies boundedness before any central L-value comparison.

Its API consists of the following facts:

- The marked CM expansion is integral and its invariant differential operator is D=(1+t)d/dt.
- Its Amice measure has j-th moment D^jF_x(0).
- Changing the Tate basis by Q′=Q^a changes the j-th moment by a^(−j).
- Prime-to-p ideal translation commutes with the actual isogeny and conductor transport.
- Equivariant fine-cover descent and the integral finite-orbit sum give a linear bounded measure without class-number division.

**Checks.**

- F_x=1 gives Dirac at 0 and all positive moments zero.
- F_x=1+t gives Dirac at 1, whose jth moment is 1; using d/dt instead of D fails at j=2.
- For p odd and the new coordinate Q′=Q², the function F=Q equals (Q′)^(1/2): its measure becomes the Dirac mass at 1/2 and its first moment is halved, not doubled. In the old coordinate the function Q² is the Dirac mass at 2, with j-th moment 2^j.
- For a three-point orbit at p=3 with integral values 1,0,0, the sum is 1, while its probability average is 1/3 of valuation −1. A finite integral CM sum therefore requires no class-number division.
- Changing the auxiliary fine level leaves the descended form/measure unchanged, while a coordinate without its Tate-module basis has no canonical identification with R⟦t⟧.
- At p∥N the canonical-subgroup ordinary chart is allowed; a supersingular intersection of components is excluded and cannot be treated as a smooth Serre–Tate disc.

([Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §3, Serre–Tate theory and p-adic differential operators; [On the non-triviality of generalised Heegner cycles modulo p, II](https://arxiv.org/abs/1504.02342v1), §5.2 Lemma 5.5 and equation (5.8), pp. 27–29.)

*Needs:* [7.1 Ordinary CM lift charts and split intersection lengths](#71-ordinary-cm-lift-charts-and-split-intersection-lengths), [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness), `AbelianSchemesAndArithmeticModuliPartII:§§P4.1–P4.3` for the fixed-CM Poincaré/connection trivialization, HilbertModularVarietiesAndShimuraCurves R18.2.6, the CM-period comparison of §9.4.

### 9.5 The semistable integration adapter for p-new weight two

Let p≥5, p∥N, and let f be p-new of weight two and trivial nebentypus. On the semistable modular curve X₀(N) at p, use the two ordinary wide opens and their supersingular annular overlaps. Use the harmonic semistable integral of ColemanIntegrationPartII §§4.2–4.3, 7.2 and 7.4 to obtain local primitives of ω_f; normalize the primitive on the infinity component to vanish at the cusp ∞. Their differences on an annulus are the residue/logarithm terms specified by the p-new relation. At a split CM point on that component, identify the semistable p-adic Abel–Jacobi value on ω_f with this normalized primitive, and use the supplier’s degree-zero divisor/Jacobian logarithm comparison.

For an elliptic quotient import SelmerIwasawaCohomology §4.26 (`elliptic_exponential_kummer`, `elliptic_local_comparison_descent`); for a general abelian variety A over a finite extension of ℚ_p, with any reduction, prove here that κ∘exp_A=exp_BK on a neighbourhood of 0 in Lie(A), under the de Rham identification D_dR(V_pA)/Fil⁰≅Lie(A) of PadicHodgeRegulators §§0.1 and 1.1–1.3, using the fundamental exact sequence and the formal group of the Néron model (Bloch–Kato, Example 3.10.1); for good reduction this is PadicHodgeRegulators §1.9. Specialize these point-class comparisons to prove log_BK κ(P)=log_J(P) on the image of exp_BK, via the formal group and extension by a nonzero integer multiple. This statement concerns point classes and the indicated de Rham quotient; it does not assert H¹_e=H¹_f for every semistable representation. ColemanIntegrationPartII §7.7 supplies the Tate normalization log_p(z)−ord_p(z)log_p(q_E)/ord_p(q_E), which is invariant under z↦q_Ez. Keep this correction when comparing branch choices on overlaps.

**p-new root interpolation and Abel–Jacobi formula in weight two.** Let f be as above, so a_p(f) = ε ∈ {+1, −1}, and let L_p(f) be the p-new CM root of the BDP construction at conductor c prime to Np, with Castella's p-adic and complex periods Ω_p and Ω and his constants w(f, χ), C(f, χ, c). Prove, for both signs ε: (i) for χ of conductor c and infinity type (2 + j, −j), j ≥ 0, L_p(f)(χ)²/Ω_p^(2(2+2j)) = (1 − ε χ^(-1)(p̄))² · w(f, χ)^(-1) C(f, χ, c) L(f, χ^(-1), 0)/Ω^(2(2+2j)); (ii) for χ of conductor c and infinity type (1, 1), defined by continuity, L_p(f)(χ) = (1 − ε χ^(-1)(p̄)) · Σ_([a]∈Pic(O_c)) χ^(-1)(a) N(a) · AJ_p(Δ_(φ_aφ_0))(ω_f), with AJ_p the semistable Abel–Jacobi map of this target on the degree-zero CM divisor Δ_(φ_aφ_0) (Castella, On the exceptional specializations of big Heegner points, Theorems 2.10–2.11, p. 15, castella-exceptional line 737 and castella-exceptional line 748, at k = 2, r = j = 0). A multiplier with ε replaced by +1 for every f would give 1 − χ^(-1)(p̄) when a_p = −1, which differs from the correct 1 + χ^(-1)(p̄) whenever χ^(-1)(p̄) ≠ 0.

*Outline.* Apply the supplied harmonic primitives and prove the additional p-new residue matching of Castella §§2.2–2.4. His Proposition 2.7 identifies the AJ evaluation with F_∞(x), and the r=0 specialization gives the abelian integral. Use the supplied comparison between the formal-group exponential and the Kummer exponential on a sufficiently small neighborhood; multiply an arbitrary point into it and divide in the rational coefficient space. For the p-new root construction use Castella Theorems 2.10–2.11; the multiplier is 1 − a_p χ^(-1)(p̄) = 1 − ε χ^(-1)(p̄), with no quadratic good-prime term. Castella states them under his standing hypothesis a_p=1 (split multiplicative reduction, stated at the start of his Introduction); their proofs use a_p only through this multiplier and the p-new relation U_p=a_p, and the case a_p=−1 is proved here by the same route, which is the case used by Castella's later Theorem 3.2 for semistable E (On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes, proof of Theorem 3.2, p. 9). The owned assertions are the p-new modular-form relation, cusp normalization, comparison with Castella’s Abel–Jacobi evaluation, and p-new CM root interpolation.

Its API consists of the following facts:

- The p-new Coleman primitive has the specified cusp value and the p-new residue/logarithm differences on annular overlaps.
- The semistable Abel–Jacobi value equals that primitive at the specified ordinary CM point and equals the Jacobian logarithm on degree-zero divisors.
- The point Kummer logarithm agrees on the exponential image with the same de Rham quotient and Tate correction.
- The bounded p-new CM root measure has Castella’s character interpolation and linear Abel–Jacobi evaluation; its integral coefficients come from the CM moment measures.

**Checks.**

- At a Tate point z=q_E the corrected logarithm is zero, as required by the quotient; log_p(z) alone need not be zero.
- Changing the primitive by a constant changes its value at a single CM point and violates the cusp normalization, but cancels on a degree-zero divisor.
- At split multiplicative reduction a_p=1 the factor is 1 − χ^(-1)(p̄); at the norm character χ = N, of infinity type (1, 1), χ^(-1)(p̄) = p^(-1) and the factor is (p−1)/p ≠ 0, while at a_p = −1 it is (p+1)/p. The Hida-family factor 1−a_p^(-1) is a different factor: it vanishes at a_p = 1.
- A torsion point has zero AJ/logarithm even when its divisor representative has nonzero values before subtracting its base point.

([On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), §§2.2–2.5, Proposition 2.7, pp. 11–13, Theorems 2.10–2.11, p. 15; [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2), Theorem 3.2 and proof, p. 9; [Edixhoven, Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/item/10.5802/aif.1202.pdf), §1.1 and §1.4, pp. 33–36 and 47, for the minimal resolution of X₀(pM) at p ≥ 5 and the graph of its special fibre.)

*Needs:* TauCetiRoadmap.ColemanIntegrationPartII §§4.2–4.3, 7.2, 7.4 and 7.7 for harmonic integration, proper holomorphic integration, divisor evaluation and the Tate normalization, EffectiveDiophantineMethods §4.2, SelmerIwasawaCohomology §4.26 for elliptic point classes, PadicHodgeRegulators §1.9 and §§0.1, 1.1–1.3 for the good-reduction abelian comparison and de Rham conventions, NeronModelsAndSemistableAbelianVarieties R11.1 for the formal group of the Néron model, ModularCurvesPartII §§11.2–11.5 for the semistable model of X₀(N) at p in the range p≥5, p∥N (with that roadmap's fine/coarse quotient and regular-resolution distinctions), its §§5.1–5.4 for the compactified integral coarse curve and its cusps, and its §12.1 for the modular dual graph and node thicknesses, [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves).

### 9.6 The ratio α(f, f_B) of Petersson norms

Fix f ∈ S₂(Γ₀(N)), a newform, N = N⁺N⁻ with N⁻ a squarefree product of an even number of primes, B the indefinite quaternion algebra over ℚ of discriminant N⁻, O_(B,N⁺) an Eichler order of level N⁺ and Γ₀^B(N⁺) its norm-one units. Let f_B be the weight-two cusp form on Γ₀^B(N⁺)\ℍ with the Hecke eigenvalues of f at all ℓ ∤ N⁻ (Jacquet–Langlands), with its rational differential line V_B over K_f. At a coefficient prime λ|p, define L_B=V_B∩H⁰(𝒳_B,ω_(𝒳_B/O_(K_f,λ))) in the generic differential space, on the minimal regular model; choose s_(f_B)=2πi f_B(z)dz a primitive generator of this rank-one O_(K_f,λ)-lattice. Define α(f, f_B) = ⟨f, f⟩_(Γ₀(N)) / ⟨f_B, f_B⟩_(Γ₀^B(N⁺)), with ⟨g, g⟩_Γ = ∫_(Γ\ℍ) |g(z)|² dx dy, the weight-two Petersson norm. For squarefree N and trivial nebentypus, prove α∈K_f with this K_f-rational differential structure. If p>3 and p∤∏_(ℓ|N)ℓ(ℓ−1)(ℓ+1), prove v_λ(α)≥0. These are the weight-two cases of the algebraicity and integrality targets below. For N⁻=1 choose f_B=f, so α=1. The displayed definition remains meaningful at other levels, but the Prasanna integrality theorem is used only for squarefree N.

Assume the normalisation of f_B (integral at p and nonzero mod p) fixes it up to a unit of ℤ(f)_(p); α(f, f_B) is therefore defined up to the square-norm of such a unit, which is how it enters the interpolation formula 'up to a p-adic unit'. For a weight-two form the Petersson integrand is |g(z)|² (Im z)² against the invariant measure dx dy / y², i.e. |g(z)|² dx dy. JSW §5.1 prints dx dy / y² (recorded as a misprint).

*Outline.* Rational JL gives V_B; properness makes its intersection with the integral differential module a finite torsion-free rank-one lattice over the coefficient DVR, hence free. This is a lattice selection, not an assertion that an arbitrary rational JL map is integral. Prove the ratio algebraicity by the rational theta-lift comparison in Prasanna §2.2 Theorem 2.3(ii) (the Harris–Kudla rational-structure result, α∈ℚ when K_f=ℚ) and the first assertion of Theorem 2.4 (α∈K_f in general). For integrality, follow Prasanna Theorem 2.4: the precisely normalized theta lift has norm equal to that of f; the CM-value integrality criterion of §2.3 and the toric L-value argument of §§3–5 show its coefficient relative to a primitive f_B has nonnegative valuation. The output is v_λ(α)≥0, not α a unit. The standing hypotheses of that paper include squarefree N. These two theorems are targets here and are not supplied by rational JL.

Its API consists of the following facts:

- α(f, f_B) = ⟨f, f⟩_(Γ₀(N)) / ⟨f_B, f_B⟩_(Γ₀^B(N⁺)) for weight-two Petersson norms.
- For N⁻ = 1 and f_B = f, α = 1.
- α(f, u f_B) = α(f, f_B) / |u|².
- α(f, f_B) > 0.
- the intersection lattice L_B with its generic fibre and unit ambiguity.
- α∈K_f for the specified rational structures, squarefree N and trivial nebentypus.
- v_λ(α)≥0 under p>3 and the stated product exclusion.
- evaluation of a section of L_B at an integral ordinary CM triple is integral in the integral differential/Igusa trivialization; this is pullback of the chosen integral section, without asserting a lattice-preserving JL isomorphism.

**Checks.**

- α(f, f) = 1 when the quaternion algebra is split (N⁻ = 1).
- Replacing f_B by 2 f_B multiplies α by 1/4; at λ|2 this changes primitivity, so the integral theorem cannot be applied to both normalizations.
- A positive valuation of α is permitted by the theorem; level-lowering congruences can produce it, so algebraicity plus integrality does not prove α is a unit.
- A rational generator multiplied by a uniformizer is integral but not primitive.
- The numerator is Tau Ceti's peterssonInner 2 D f f for a fundamental domain D of Γ₀(N).
- The integral of |g|² against dx dy / y² is not Γ-invariant for weight two (it changes by |cz + d|⁴ under γ), so it does not define the norm.

*Consequences.* N⁻ = 1: B = M₂(ℚ), f_B = f and α = 1, so JSW (5.1.a) reduces to BDP's normalisation. Scaling f_B by u ∈ ℤ(f)_(p)^× divides α by |u|².

([The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, list after (5.1.a), p. 32; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.2, after Theorem 8.2, p. 4232; [Integrality of a ratio of Petersson norms and level-lowering congruences](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p04.pdf), §2.1 standing assumptions, p. 907; §2.2 Theorem 2.3, p. 910; Theorem 2.4, p. 912.)

*Needs:* Tau Ceti `UpperHalfPlane.peterssonInner`, Mathlib `CuspForm`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, HilbertModularVarietiesAndShimuraCurves R18.1.3, this roadmap's Layer 5, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

### 9.7 The Euler factor at the BDP point

The rational adapter E(p,a)=(1+p−a)/p represents the untwisted good-prime factor. Its arithmetic use requires p prime; its nonvanishing milestone the good-prime nonvanishing bound assumes p>1 and the real Hasse inequality |a|≤2√p, and then 1+p−a≥(√p−1)²>0. At p=1,a=2 the numerator is zero, so the strict inequality is necessary.

For a weight-two newform f with trivial nebentypus and p ∤ N, E_p(f) = 1 − a_p/p + 1/p = (1 + p − a_p)/p is nonzero, by |σ(a_p)| ≤ 2√p < p + 1 for each complex embedding. For an elliptic curve E/ℚ with good reduction at p, E_p(E) = #Ẽ(𝔽_p)/p. For elliptic curves and p ≥ 7 its p-adic valuation is 0 if a_p = 1 and −1 otherwise. At p = 5 it is 0 when a₅ = 1 or −4, and −1 otherwise; no such rational-integer dichotomy is asserted for a general Hecke field. For general f, ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) ≥ 1. For a finite-order χ prime to p the twisted factor is 1 − χ^(-1)(p̄) a_p/p + χ^(-2)(p̄)/p, obtained from Brooks/BDP at χ′ = χN of infinity type (1, 1), where χ′(p̄) = pχ(p̄).

Assume p ∤ N, so f has good reduction at p and ε_f(p) = 1. The Hasse bound |a_p| ≤ 2√p for elliptic curves (TauCetiRoadmap.EllipticCurves Layer 3. Tau Ceti `WeierstrassCurve.hasse_bound`) and the Ramanujan–Petersson bound for weight-two newforms (AutomorphicGaloisRepresentations §4.2 (Hilbert Ramanujan–Petersson, including F=ℚ)) give |a_p| < p + 1.

*Outline.* 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1 for E (the identity is a point), or > 0 by |a_p| ≤ 2√p < p + 1. For elliptic curves and p ≥ 7, 1 ≤ #Ẽ(𝔽_p) ≤ p + 1 + 2√p < 2p. Hence divisibility by p occurs exactly at #Ẽ = p, and gives valuation zero. At p = 5 Hasse permits #Ẽ = 10 as well as 5; these correspond to a₅ = −4 and 1. Otherwise the numerator is prime to p and E_p has valuation −1. The χ-twisted factor is the specialisation of Brooks's (1 − χ^(-1)(p̄) a_p + χ^(-2)(p̄) ε_f(p) p) at a character of infinity type (1, 1), divided by the norm.

*Consequences.* 11a1, p = 5 (split in ℚ(√−19)): a₅ = 1, E_p = 1, a unit — p = 5 is anomalous for 11a1. 11a1, p = 23 (split in ℚ(√−19), since −19 ≡ 2² mod 23): a₂₃ = −1, so E_p = 25/23 has valuation −1. Supersingular p (a_p = 0): E_p = (1 + p)/p, never zero. At p=5 there is a second valuation-zero case: y² = x³ + 3x over 𝔽₅ has affine point counts 1, 2, 2, 2, 2 for x = 0,1,2,3,4 and the point at infinity, so #E = 10, a₅ = −4, E₅ = 2 and v₅(E₅) = 0.

([The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.6, p. 34; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, Proposition 8.12, p. 4239.)

*Needs:* TauCetiRoadmap.EllipticCurves Layer 3, AutomorphicGaloisRepresentations §4.2 `Hilbert Ramanujan–Petersson`.

### 9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm

Fix C, X₀(N), X₁(N), X_(N⁺,N⁻) or Brooks's cover ℍ/Γ_(1,N⁺) of it, over a finite extension F_𝔭 of ℚ_p with p ∤ N, J its Jacobian, and ε_f the Hecke projector with ε_f Fil¹H_dR^1(C/F) = F ω_f (after choosing a coefficient field containing the eigenvalues; the full ε_f H¹_dR has dimension two). For a degree-zero divisor D on C over F_𝔭 (for instance ε_f Δ₀ for an arbitrary divisor Δ₀, which is automatically homologically trivial), the p-adic Abel–Jacobi image AJ_p(D)(ω_f) equals log_(ω_f)([D]), where for ω ∈ H⁰(J, Ω¹) = Fil¹H¹_dR the map log_ω : J(F_𝔭) → F_𝔭 is the unique locally analytic homomorphism with d log_ω = ω. On BDP's curve X₁(N) with D = ε_f(Δ_φ − ∞) this is the r = 0 case of BDP's Abel–Jacobi map (its image on X₀(N) is obtained by pushforward along X₁(N) → X₀(N), which pulls ω_f back to ω_f); a choice of base point changes AJ on C(F_𝔭) but not on Pic⁰(C).

Assume Good reduction of C at p (p ∤ N); for X_(N⁺,N⁻) the smooth model over ℤ_(p) of R18.2; r = 0: the generalized Kuga–Sato variety is C itself and the de Rham target is (S₂ ⊗ F)^∨ = (Fil¹H¹_dR)^∨. The coefficient field contains the chosen Hecke eigenvalues and the logarithm is locally analytic. Only the Fil¹ eigenspace is a line.

*Outline.* For r = 0 the p-adic Abel–Jacobi map CH¹(C)₀ → (Fil¹ H¹_dR(C/F))^∨ is given by Coleman integration of holomorphic differentials (BDP §3; Brooks §7.1), and the Coleman integral of a holomorphic form along a degree-zero divisor is the logarithm of the formal group of J evaluated on its class (EffectiveDiophantineMethods §4.6 (Coleman integrals are abelian integrals) and §4.3 (abelian integrals); Brooks §6.4). Hecke-equivariance: the projector ε_f acts compatibly on divisors and on differentials, and log_(ω_f)(ε_f x) = log_(ω_f)(x) since ε_f^* ω_f = ω_f (Brooks Lemma 7.5).

In the shared marked elliptic scope, apply the point comparison of §8.8 to the supplied P_K, keeping ψq and (ψq)*ω_E=cω_f. The logarithm is c times the ω_f-evaluation on that same divisor, including the basepoint correction if nonzero. The square in the special-value identity therefore scales by c²; an equality of unmarked isogeny classes does not fix this factor.

*Consequences.* Base-point independence: two Abel–Jacobi maps C → J differing by a translation give the same value on degree-zero divisors. Cusps are Eisenstein: replacing ∞ by another cusp changes D by a torsion class (Manin–Drinfeld), which log kills.

([Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §6.4, p. 4224; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §7, Lemma 7.5, p. 4229; [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), Remark 2.6 and Proposition 2.7, published p. 1063.)

*Needs:* §8.8 (shared marked point comparison), §3.5 (differential scale), ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, in its marked scope, EffectiveDiophantineMethods §4.6, EffectiveDiophantineMethods §4.2, HilbertModularVarietiesAndShimuraCurves R18.1.3, Mathlib `Module.Dual`, HilbertModularVarietiesAndShimuraCurves R18.2.6, EffectiveDiophantineMethods §4.3.

### 9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)

**Dyadic CM toric constants.** Use every imaginary quadratic K allowed in Brooks §2.1, including even discriminant, and the optimal order and test line of 4.4–4.7 at 2. Normalize ψ₂ to have conductor ℤ₂, take its self-dual additive measure, and use the quotient torus measure and Whittaker normalization of 0.7 and 4.7. Write d=v₂(d_K), n=v₂(N), c=0 (χ is unramified), and α₂, β₂ and γ₂ for the Whittaker, toric and order-volume factors of 4.7. Prove the full dyadic instance of that target. In particular, for ramified K₂, Brooks’s hypotheses force n=0 or 1. For n=0, β₂=2^(−d/2), α₂=γ₂=1. For n=1 the nebentypus is unramified (a character of ℤ₂× cannot have conductor exponent 1), π₂ is an unramified Steinberg twist and the distinguished test line gives α₂=2/3, γ₂=1 and β₂=3·2^(−d/2). Thus α₂β₂γ₂·2^(d/2) equals 1 for n=0 and 2 for n=1. In the latter case L(1,π₂,ad)=4/3 and L(1/2,π₂,χ₂)=2/3: the distinguished split-quaternionic test line fixes the sign; using the opposite toric sign gives a zero toric functional instead.

For split or unramified quadratic K₂ use the remaining dyadic cases of 4.7 with the actual conductor n and admissible vector; there is no odd-residue-characteristic assumption in the matrix-coefficient computation of CST Proposition 3.12. The quotient measure retains its discriminant factor. Combine these evaluations with the archimedean factor and the odd-place factors to obtain exactly the C(f,χ) below: the n=1 ramified dyadic factor is already the member 2 of 2^(#S_f). No further power of 2 is inserted. The global stabilizer contributes w_K once, including w_K=4 for K=ℚ(i); this is separate from the local quotient measure. This completes the even-discriminant input for §§9.9, 9.11, 9.15 and 9.16, while the BDP theorem of §9.17 retains its stated odd-discriminant hypothesis (CST Propositions 3.11–3.12 and Lemma 3.13, pp. 26–30, cst line 1645, cst line 1710 and cst line 2009; Brooks §2.1, brooks line 199, and Theorem 8.2, brooks line 1831).

**Checks for the dyadic constants.**

- For K₂=ℚ₂(i), d=2 and n=0 give β₂=1/2 and normalized product (1/2)·2=1; erasing the discriminant measure would give 2.
- For d=2,n=1 the product is (2/3)·(3/2)·1·2=2, the single factor required at the ramified level prime. Omitting the order/Whittaker normalization changes this value.
- For K₂=ℚ₂(√−2), d=3 and n=0 give β₂=1/(2√2), whose product with 2√2 is 1; the discriminant exponent cannot be replaced by 2 for every ramified dyadic field.
- For K=ℚ(i), N⁻=21, N⁺=1, p=5, k=2 and j=1, the type (3,−1) respects all four units. The displayed C is (1/4)π³·Γ(2)Γ(3)·4·2·(2/4)(6/8)=3π³/2. This legitimate even-discriminant case is retained.

*Needs for the dyadic constants:* 4.3–4.7, 0a.5 and 0.7; the CM triples and chosen differential are fixed before this evaluation.

Fix χ, an unramified Hecke character of K of infinity type (k + j, −j), j ≥ 0, whose central character is the nebentypus of f, and let (A, P, ω_ℂ) be the actual false elliptic CM triple of 0a.5, with its level, differential and complex period, using the CM-period comparison of §9.4. The point, its auxiliary level structure and its differential are separate specified data. Prove that C(f, χ) L(f, χ^(-1), 0) = α(f, f_B) W(f, χ) (Σ_(a ∈ Cl(O_K)) χ^(-1)(a) Na^(-j) (Θ^j_∞ f_B)(a ⋆ (A, P, ω_ℂ)))², with α(f, f_B) = ⟨f, f⟩_(Γ₀(N))/⟨f_B, f_B⟩_(Γ₀^B(N⁺)) the ratio of weight-k Petersson norms ∫_(Γ\ℍ)|g(z)|²y^k dx dy/y² (the ratio of 9.6 when k = 2), C(f, χ) = ¼ π^(k+2j−1) Γ(j + 1) Γ(k + j) w_K |d_K|^(1/2) 2^(#S_f) ∏_(ℓ | N⁻) (ℓ − 1)/(ℓ + 1), S_f the primes ramified in K dividing N⁺ but not the conductor of the nebentypus, and W(f, χ) of absolute value one. Consequently L^alg(f, χ^(-1), 0) is algebraic and equals the square of the CM sum of Θ^j_∞ f_B at the algebraic triple (A, t, ω) (Brooks Proposition 8.7).

Assume χ unramified, of type two. N⁻ a squarefree product of an even, nonzero number of inert primes; every prime dividing N⁺ splits or ramifies in K, and each prime dividing (N, d_K) divides N exactly once (Brooks §2.1; this is (gen-H) with N⁻ > 1); (ST) at the ramified level primes: for every ℓ ∈ S_f the split algebra M₂(ℚ_ℓ) carries a nonzero (K_ℓ^×, χ_ℓ)-toric functional on π_ℓ, i.e. ℓ lies outside the Saito–Tunnell set of [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy). Writing π_ℓ = St ⊗ μ_ℓ with μ_ℓ unramified and χ° = χ·N^(−k/2) for the unitary normalization, Tunnell's criterion makes this χ°_ℓ ≠ μ_ℓ ∘ N_(K_ℓ/ℚ_ℓ); with trivial nebentypus and 𝔩² = ℓO_K it reads a_ℓ(f)·χ(𝔩) = −ℓ^(k−1), Castella–Hsieh's condition (ST). Under (ST) the Saito–Tunnell set of (f, χ) is exactly the set of primes dividing N⁻, so the sign of L(f, χ^(-1), s) is +1. The parity of N⁻ alone does not give this: a ramified ℓ ∈ S_f with a_ℓ(f)χ(𝔩) = +ℓ^(k−1) contributes a further local sign −1, and the toric functional of the split algebra at ℓ is then zero, so the right side vanishes for every f_B while the left side need not. Brooks's parity inference (§8.1, p. 4230) is valid when (N, d_K) = 1. BDP §4 assumes d_K odd (BDP Remark 4.7); the preceding dyadic target supplies the remaining cases of Brooks’s range. The complex conjugation on CM triples is compared with an Atkin–Lehner involution (Brooks Propositions 8.3–8.5) to replace |·|² by a square. W(f, χ) records that comparison.

*Outline.* Obtain the algebraic CM triple and complex period from 0a.5 before constructing a p-adic measure. Choose ideal representatives prime to the auxiliary level. Verify that their principal-ideal covariance, together with weight k+2j homogeneity and the infinity type of χ, makes the weighted sum independent of those representatives. At a non-fine level work on a neat cover with the pulled-back form and cotangent line, compare the Petersson measures by the degree of that cover, and descend the invariant weighted sum; do not assert a universal surface on the coarse curve. This identity provides the analytic input to that construction and does not use its output. First prove cmMaassDerivative_toricNorm: the absolute square of the character-weighted Maass–Shimura CM sum, multiplied by α(f,f_B), equals C(f,χ)L(f,χ^(-1),0), with C exactly as displayed and with the chosen CM differential. Derive it from Layer 5 by evaluating every local factor on these vectors, including the archimedean raising vector, the dyadic constants just stated, the odd-discriminant factors and the factors (ℓ−1)/(ℓ+1) at N⁻. This is Brooks Theorem 8.2 and the specialization of the local integrals in BDP §4. Prasanna §3.4 Theorem 3.2, p. 940, supplies its squarefree, trivial-nebentypus p-unit version; that statement alone does not supply the exact constant for Brooks's range. Brooks Proposition 8.3 and Lemma 8.4: complex conjugation of a CM triple is b ⋆ w_N applied to a rescaled triple; f^ρ ∘ w_N = W_f f. Sum over Cl(O_K) to obtain Proposition 8.5, then divide by Ω^(2(k+2j)) (Proposition 8.7).

Its API consists of the following facts:

- cmMaassDerivative_toricNorm is the absolute-square identity before conjugation.
- cmMaassDerivative_conjugation is the Atkin–Lehner/ideal comparison.
- cmMaassDerivative_waldspurger is the displayed square identity with W.
- cmMaassDerivative_algebraic divides by Ω_∞^(2(k+2j)) and gives Brooks Proposition 8.7.

**Checks.**

- At j=0 the gamma factor is Γ(1)Γ(k), not Γ(k+1).
- Each inert ℓ|N⁻ contributes (ℓ−1)/(ℓ+1); deleting all these factors fails for any nonempty N⁻.
- Replacing the chosen CM differential by b times itself scales each weight-(k+2j) value by b^(−k−2j), hence its square by b^(−2k−4j).
- For a principal generator α preserving the chosen level, χ_j=χN^j has type (k+2j,0), so its inverse weight gains α^(−k−2j), while ω↦α⁻¹ω makes the derivative value gain α^(k+2j). These factors cancel. The weight-two scalar check is (1/4)·4=1. Reversing differential transport would leave 1/16 instead of 1.
- The toric-norm formula uses an absolute square; replacing it directly by a square loses the Atkin–Lehner phase W.
- Even CM discriminants use the preceding dyadic constants; for K=ℚ(i) the unit count is 4, rather than the generic value 2.
- (ST) negative control: for y²+xy+y=x³+x+2 (conductor 30, a₂=a₅=−1, a₃=+1, a₇=−4), K=ℚ(√−3), N⁺=3, N⁻=10, k=2 and χ((α))=α⁷ᾱ^(−5) (type (7,−5), j=5, well defined because every unit of K is a sixth root of unity), χ((√−3))=3, so a₃χ(𝔩)=+3 and (ST) fails at 3. The Saito–Tunnell set is {2, 3, 5}, the sign of L(f, χ^(-1), s) is −1 although N⁻ has two prime factors, and both sides of the identity vanish.

*Consequences.* BDP Theorem 5.4 is the analogous identity on X₀(N) at N⁻ = 1 (with α = 1), which lies outside the hypothesis N⁻ > 1 of this target. Absolute values: |W(f, χ)| = 1, so the formula is consistent with the positivity of L(f, χ^(-1), 0) up to the square.

([Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.2, Theorem 8.2, p. 4232; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.3, Proposition 8.5, p. 4235.)

*Needs:* the preceding dyadic CM toric constants; [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), [5.3 Waldspurger period formula](#53-waldspurger-period-formula), [5.1 Coherent quaternionic theta specialization](#51-coherent-quaternionic-theta-specialization), [0a.5 CM level triples](#0a5-from-cm-moduli-points-to-level-triples), the ordinary CM root-distribution target of §9.4, HilbertModularVarietiesAndShimuraCurves R18.1.3, Layer 5.

### 9.10 Compatibility with isogenies, differentials and characters

(a) For a homomorphism φ : A → A' of abelian varieties over K_v and ω' ∈ H⁰(A', Ω¹), log_(φ^*ω')(P) = log_(ω')(φ(P)). (b) If π' = ψ ∘ π for an isogeny ψ : A_f → A' with ψ^*ω_(A') = c_ψ ω_(A_f), then log_(ω_(A'))(π'(x)) = c_ψ log_(ω_(A_f))(π(x)), so log_(ω_(A'))(π'x)² = c_ψ² log_(ω_(A_f))(πx)², and a BDP-point formula rewritten with log_(ω_(A'))² gains the factor c_ψ^(-2); for a modular parametrisation with π^*ω₀ = c_π ω_f, log_(ω₀)(π x) = c_π log_(ω_f)(x) and the squared identity gains c_π^(-2) when written with log_(ω₀). (c) For a finite-order character χ of Pic(O_c), Galois transport of the χ-sum must transport the p-adic embedding, completion and differential as well as the points and coefficients. For σ fixing the coefficients and preserving the chosen place, the compatible local automorphism gives σ(Σ χ^(-1)(a) log_ω(P_a)) = Σ χ^(-1)(a) log_(σ ω)(P_a^σ). Complex conjugation exchanges the two places over p and cannot be applied as an automorphism commuting with one fixed local logarithm; the complex Fricke/character comparison is the separate identity in [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn). (d) Anticyclotomic specialisation: evaluation of L_p(f) ∈ R⟦Γ⟧ at a character factoring through Γ via the projection Γ̃ → Γ commutes with the projection (pushforward) R⟦Γ̃⟧ → R⟦Γ⟧ induced by Γ̃ → Γ: (ψ∘pr)(μ) = ψ(pr_*μ).

Assume Logarithms are the p-adic logarithms of abelian varieties over K_v of EffectiveDiophantineMethods §4.2 (the p-adic abelian logarithm); c_ψ, c_π are nonzero; no claim that they are p-adic units without p-optimality ([9.18 The formula for a p-optimal quotient](#918-the-formula-for-a-p-optimal-quotient)).

*Outline.* (a) d(log_(ω') ∘ φ) = φ^*ω' and both sides are homomorphisms vanishing at 0 with the same derivative, so they agree (uniqueness of the logarithm). (b) apply (a) to ψ and to the parametrisation. (c) The place-preserving case is functoriality under a compatible continuous isomorphism of local fields. For a global σ that changes the place, transport the embedding to ι_p ∘ σ^(-1); use the complex conjugation/Atkin–Lehner identity of [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn) before transporting the CM points and the embedding. Local logarithm functoriality alone does not identify the two p-adic places. (d) the projection R⟦Γ̃⟧ → R⟦Γ⟧ is the ring map induced by Γ̃ → Γ and character evaluation is functorial (PadicMeasuresIwasawaAlgebras L1).

*Consequences.* Brooks §8.6: log_(φ^*ω)(P) = log_ω(φ(P)) for the map C → C'. The differential transport of §9.8 gives the factor: replacing the Abel–Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_π^(-2), not c_π^(-1).

([Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, before Proposition 8.13, p. 4239; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, p. 34.)

*Needs:* [9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm), [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), EllipticCurveModularity Layer R29.5, TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §1.6 (characterIntegralAlgHom), EffectiveDiophantineMethods §4.2, TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1, the coefficient and measure interfaces of §9.3.

### 9.11 Brooks's quaternionic p-adic L-function

Assume (gen-H) with N⁻ > 1, (good) and (split) of block (A). Let X = X_(N⁺,N⁻) be the Shimura curve of false elliptic curves with K-level structure, f_B the Jacquet–Langlands form of f normalised as in [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), A a false elliptic curve with normalised CM by O_K and level structure t, ω a nonvanishing invariant differential defined over the Hilbert class field, Ω ∈ ℂ^× and Ω_p ∈ ℂ_p^× its complex and Serre–Tate p-adic periods. For a central critical character χ of type two (infinity type (k + j, −j), j ≥ 0, k = 2) put L_p(f, χ) = Ω_p^(2(k+2j)) (1 − χ^(-1)(p̄) a_p + χ^(-2)(p̄) ε_f(p) p^(k−1))² L^alg(f, χ^(-1), 0), where L^alg(f, χ^(-1), 0) = α(f, f_B)^(-1) W(f, χ)^(-1) C(f, χ) L(f, χ^(-1), 0) / Ω^(2(k+2j)). Prove that L_p(f, χ) = (Σ_([a] ∈ Cl(O_K)) χ_j^(-1)(a) · θ^j f_B^♭(a ⋆ (A, t, ω̂)))², where θ is the Atkin–Serre operator in Serre–Tate coordinates, χ_j is the character of infinity type (k + 2j, 0) with χ_j^(-1)(a) = χ^(-1)(a)Na^(-j) (Brooks Proposition 8.5), and f_B^♭ = f_B|(VU − UV) the p-depletion; the function χ ↦ L_p(f, χ) extends continuously to the completion Σ̂_cc. The linear root of this target sums over a set D of representatives of all of Cl(O_K), prime to pN, so that its square interpolates exactly Brooks's values displayed above, with Brooks's constant and no further factor. It has the shape of Burungale's (5.8), which instead sums over representatives D₁ of Cl(O_K)/Cl_K^ram and whose interpolation formula (Burungale Theorem 5.6) carries the factor t_K of block (A); that variant is not used here. The constant t_K of JSW (5.1.a) is introduced only in [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two), as an explicit constant multiplier of the square of this root. Construct the bounded measure first: at each ordinary CM point the integral Serre–Tate expansion of f_B^♭ is the Amice transform of a Z_p-measure with binomial moments binom(d,m)f_B^♭ evaluated at that point (Burungale Lemma 5.5). The p-depleted local measure is supported on ℤ_p^×. Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12). Twist it by the local component at v of the fixed type-two base character, which shifts the moment index by one (x ↦ x^(-1) in JSW’s normalisation of the reciprocity chart; with the inverse chart, compose with inversion), and push it forward along the fixed reciprocity chart to Γ, which is trivial on μ_(p−1) and so performs that folding. At a Γ-character of weight n with (p − 1) | n the twisted, folded moment is θ^j f_B^♭ with j = n − 1; without the twist it would be θ^n f_B^♭, and the right values would occur only for n ≡ 1 mod (p − 1). Translate by the ideal-class Artin elements of a ∈ D, and sum with the fixed tame-character weights as in (5.8), with D in place of D₁. Squaring this linear root gives the central-value function. The series prototype takes these integral local Amice transforms as inputs; [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves) constructs them geometrically, and TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §2.5 supplies their Amice inverse over the coefficient ring of [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness). Normalization between Burungale’s tame branch and Brooks’s χ-family is required explicitly, rather than inferred from continuity.

Assume k = 2 and trivial nebentypus; χ ranges over type-two central critical characters satisfying (ST) of [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn), a_ℓ(f)χ(𝔩) = −ℓ for every ℓ | (N, D_K) with 𝔩² = ℓO_K; together with the even number of primes dividing N⁻ this makes the sign of L(f, χ^(-1), s) equal to +1, which the parity of N⁻ alone does not. The completion Σ̂_cc is taken inside this set: Brooks's twisting characters ψ_t satisfy ψ_t(𝔩) = 1 at a ramified 𝔩, since 𝔩^h has a generator α with ᾱ/α a unit of K, of order dividing 4 or 6, and the indices t = pⁿ(p−1) used for the completion are even, so (ᾱ/α)^(6t) = 1; thus (ST) is preserved by ψ_t-translation and by p-adic limits. The Serre–Tate period Ω_p depends on a basis of the Tate module of the reduction of A; changing it by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^(2(k+2j)). That the continuous function is a measure is Burungale's refinement (JSW Remark 5.1.1(c)); its integral structure is part of this construction. Burungale states §5.2 under his (H1)–(H3) (N squarefree and prime to D_K); the extension to tame ramified primes in N⁺ is proved by the fine-cover descent below, rather than attributed to that paper.

*Outline.* Use the primitive p-integral differential line of [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms) and its ordinary-CM expansion from [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves); p-depletion makes the local measure supported on ℤ_p^× (Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12)). Use the coefficient-ring binomial-moment/Amice correspondence of [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness) to obtain each bounded local measure. Twist each local measure by the local component of the fixed type-two base character (a shift of the moment index by one), push forward along the fixed reciprocity chart (which folds the Teichmüller classes), translate by the ideal-class elements of D, and take the finite weighted sum over D (the shape of Burungale (5.8), summed over all of Cl(O_K)); convolution-square produces a bounded central-value measure. For primes in N⁺ ramified in K, p remains split and prime to N. The ordinary deformation and integral isogeny argument is therefore unchanged at p: carry the tame ramified level structure along on a fine prime-to-p cover, prove equivariance of the differential and each ideal translate, and descend the finite sum without division by a stabilizer. The exact ramified local constants enter only in the independently constructed Waldspurger identity. This construction precedes interpolation. Evaluate moments at algebraic characters and identify θ^j f_B^♭. Brooks Propositions 8.5–8.9 and the CM comparison give the displayed squared Waldspurger interpolation. Brooks Proposition 8.10 then supplies the continuity comparison on the completed tame family. It is a consequence/comparison, not the boundedness argument. Transport the fixed tame branch to Γ using L0; specify the period and constant normalization in the required comparison. Do not assume that a character of Pic(O_c) factors through Γ. Translation by a group-like series is an R-linear operation on Amice transforms, not a unital algebra endomorphism. Scalar linearity gives quadratic scaling of the convolution square.

Its API consists of the following facts:

- The convolution square of the translated finite sum of integral CM moment measures, represented in R⟦T⟧; supplied geometric CM transforms are inputs, not arbitrary scalar CM values.
- L_p(f, χ) = (Σ_([a]) χ_j^(-1)(a) θ^j f_B^♭(a ⋆ (A, t, ω̂)))² (Brooks Proposition 8.9).
- χ ↦ L_p(f, χ) extends continuously to Σ̂_cc (Brooks Proposition 8.10).
- Changing Ω_p by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^(2(k+2j)).
- The integral local transforms define bounded measures via Amice; transport and finite sum commute with character integration, and convolution-square evaluates to the squared CM sum. The geometric moment identity and the tame/Γ normalization are separate inputs.
- Pointwise equality of the whole local CM Amice series yields equality of the squared measures; equality only at the trivial character is insufficient.
- The linear series Σ_(a∈D) C(weight(a))·translate_a(CMSeries_a), D a set of representatives of Cl(O_K), with CMSeries_a the integral Amice transform and translate_a the transported reciprocity action.

**Checks.**

- For class number one the sum has one term, so L_p(f, χ) = (θ^j f_B^♭(A, t, ω̂))².
- For K = ℚ(√−7), of class number one with t = 1, the root has the single term θ^j f_B^♭(A, t, ω̂), and its square is Brooks's value V; t_K = 2/(1·1) = 2, so the element of 9.15 satisfying JSW (5.1.a) evaluates to 2V there. A normalization that made the square of this root itself satisfy JSW (5.1.a) would assert V = 2V, false whenever L(f, χ^(-1), 0) ≠ 0.
- For K = ℚ(√−5), Cl(O_K) = Cl_K^ram has order 2, generated by the ramified prime 𝔩 = (2, 1+√−5): the root has the two terms at a = 1 and a = 𝔩, whereas Burungale's D₁ sum has one; replacing the root by the D₁ sum while keeping Brooks's constant changes the interpolated value.
- For f_B = 0 the function is identically zero (the construction is quadratic in f_B).
- Replacing every local CM Amice transform by c times that transform multiplies the squared measure by c². For real c=2 the Petersson ratio is divided by 4, so both sides of the interpolation formula are multiplied by 4.
- The value is a square in R; the unsquared CM sum (the square-root convention) is a different object, which scales by c rather than c² when f_B is replaced by c f_B.

*Consequences.* For N⁻ = 1 the same construction with q-expansions is BDP §5.2, so the two agree on overlapping data. Changing the trivialisation of the formal group by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^(2(k+2j)) (BDP Remark 5.8).

([Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.4, definition before Proposition 8.9, p. 4237; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.5, Proposition 8.10, p. 4237; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, p. 31; [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1), §5.2 pp.27–29, Lemma 5.5 and (5.8).)

*Needs:* [0a.5 CM level triples](#0a5-from-cm-moduli-points-to-level-triples), [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves), [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), HilbertModularVarietiesAndShimuraCurves R18.1.3, the ordinary CM root-distribution target of §9.4, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, HilbertModularVarietiesAndShimuraCurves Layer R18.2, TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1, the coefficient and measure interfaces of §9.3, [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, HilbertModularVarietiesAndShimuraCurves R18.2.6, HilbertModularVarietiesAndShimuraCurves R18.2.10, Mathlib `AbstractMeasure.amiceTransform`, Mathlib `AbstractMeasure.injective_amiceTransform`, [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness).

### 9.12 The weight-two formula at a multiplicative prime

Fix E/ℚ, semistable of conductor N, optimal, with modular parametrisation π : X₀(N) → E, π(∞) = O, π^*ω_E = c·ω_f with c ∈ ℤ_(p)^×; let p ≥ 5 divide N exactly (multiplicative reduction, a_p = ±1), K imaginary quadratic with every prime of N split or ramified in K and p split, and L_p(f) ∈ Λ_(R₀) the anticyclotomic p-adic L-function interpolating Γ(n)Γ(n + 1)(1 − a_p p^(-1) φ(𝔭))² (𝔭 the prime above p fixed by ι_p) Ω_p^(4n) L(f/K, φ, 1)/(π^(2n+1) Ω_K^(4n)) at unramified φ of infinity type (−n, n), n > 0 (the square of the twisted Castella–Hsieh measure, extended to p | N). Prove that L_p(f, 1) = (1 − a_p p^(-1))² · (log_(ω_E) P_K)² up to a p-adic unit, P_K ∈ E(K) the trace Heegner point. The factor 1 − a_p p^(-1) = 1 ∓ p^(-1) is nonzero: there is no exceptional zero in this formula. The exceptional zero occurs instead for the weight-two specialisation of Howard's big Heegner points, where the family factor 1 − a_p^(-1) vanishes when a_p = 1 and Castella's derivative formula Z'_(p,f,0) = 𝓛_p(f, K) · loc_p(κ_f) carries the L-invariant 𝓛_p(f, K) = 𝓛_p(f) − log_p(ϖ_p)/ord_p(ϖ_p); that formula concerns Hida families and is not a target of this roadmap.

Assume p ∥ N, p ≥ 5, split in K; the Heegner hypothesis allows p | N because p splits; ε_p = 0 in Castella's Euler factor (1 − a_p p^(-1) φ(𝔭) + ε_p φ²(𝔭)) since p | N; it is p^(-1) when p ∤ N, recovering [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point). The p-adic L-function is the square of the twisted toric measure: Castella's proof writes L_p(f) := Tw_(ψ^(-1))(L_(p,ψ)(f)) without the square, while the interpolation he states is that of the square. Residual irreducibility is not required for this logarithm identity: Castella-exc. §2.5, Theorems 2.10–2.11, pp. 15–16, supplies the p-new root interpolation and Abel–Jacobi formula before the residual assumptions introduced in §3.1, under that paper's standing hypothesis a_p=1; the case a_p=−1 is the extension proved in 9.5. The proof uses the semistable Abel–Jacobi comparison and the specified differential unit.

*Outline.* Extend the BDP construction to p-new f: the p-adic multiplier becomes (1 − a_p χ^(-1)(p̄))² because β_p = 0 (Castella, Theorem 2.10). Apply the p-new semistable integration comparison and its p-new root construction. Apply Castella Theorem 2.11 pp.15–16 to the unsquared p-new root; at r=j=0 its value is (1−a_p/p) times the Heegner logarithm. Square only in the central-value adapter. At r = j = 0 the cycle is [(A, A[𝔑]) − (∞)] and AJ_F(Δ)(ω_f) = log_(ω_f)(Δ) by Bloch–Kato Example 3.10.1 for the semistable Jacobian J₀(N) (Castella's proof of Theorem 3.2; the good-reduction target [9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm) does not apply since p | N); sum over Gal(H/K) and push to E with π^*ω_E = c ω_f ([9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters)).

*Consequences.* Castella's Theorem 3.2: L_p(f, 1) = (1 − a_p p^(-1) + ε_p)² (log_(ω_E) P_K)² up to a p-adic unit, uniformly for p ∤ N (ε_p = p^(-1)) and p | N (ε_p = 0). Split multiplicative a_p = 1: the factor is ((p − 1)/p)² = p^(-2)(p − 1)², of p-adic valuation −2 because p − 1 is a p-adic unit, and never zero; for non-split a_p = −1 it is ((p + 1)/p)², also of valuation −2. Up to a p-adic unit the formula reads L_p(f, 1) ≐ p^(-2)(log_(ω_E) P_K)². The L-invariant does not appear: a version of the formula containing 𝓛_p(f) is the big-Heegner-point derivative formula, not this one.

([On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2), §3, Theorem 3.2, p. 9; [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), §2.5, Theorem 2.11, p. 15; [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), Introduction, Theorem and (0.4), pp. 2–3.)

*Needs:* EffectiveDiophantineMethods §4.2, [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), EllipticCurveModularity Layer R29.5, the ordinary CM root-distribution target of §9.4, the coefficient and measure interfaces of §9.3, [9.5 The semistable integration adapter for p-new weight two](#95-the-semistable-integration-adapter-for-p-new-weight-two), [3.5 Manin constant](#35-manin-constant), [3.7 Integral Manin constant and p-unit range](#37-integral-manin-constant-and-p-unit-range).

### 9.13 Heegner points have nonzero logarithm in every eigencomponent

Fix A_f, the modular abelian variety of a weight-two newform f with Hecke field M_f (totally real) and dim A_f = [M_f : ℚ], and ω a nonzero M_f-eigendifferential (a^*ω = σ(a)ω for some σ : M_f ↪ ℚ̄); in (b), σ = ι_p|_(M_f) and log_ω is extended to A_f(K_v) ⊗ M_f through ι_p, so that the Hecke action on ω agrees with the scalar action (Skinner’s φ*ω = ω_f). For the other embeddings log_ω kills P_K(f): with M_f = ℚ(√5) the idempotent is e_f = ½(1⊗1 + ⅕√5⊗√5). (a) Every non-torsion x ∈ A_f(ℚ̄) has log_ω(x) ≠ 0; more generally, for any abelian variety A/ℚ̄ and field F ⊂ End⁰(A) with dim A = [F : ℚ] and at least one real embedding of F, every non-torsion x ∈ A(ℚ̄) has log_ω(x) ≠ 0 for every nonzero F-eigendifferential ω (Burungale–Skinner–Wan Theorem 1.1). (b) In Skinner's Cases I and II, let Q^ξ_K ∈ J(X)(K) ⊗ ℚ be the rational Hodge-divisor class, y = φ(Q^ξ_K) ∈ A_f(K) ⊗ ℚ and P_K(f) = φ(ε_f Q^ξ_K). Prove that log_ω P_K(f) = log_ω y, and if P_K(f) ≠ 0 then log_ω P_K(f) ≠ 0. (c) Let A₀ be an abelian variety over a totally real field L with O_F ⊂ End_L(A₀) for a totally real F of degree dim A₀ (after an L-isogeny), E ⊇ F totally real, H/K a finite abelian (e.g. ring class) extension of a finite extension K/L, y ∈ A₀(H), and ω₀ a nonzero F-eigendifferential on A₀. For a character χ : Gal(H/K) → O_E^× (necessarily ±1-valued), the χ-twisted sum Σ_τ χ(τ) log_(ω₀)(τ y) is nonzero whenever the algebraic point x = Σ τ(y) ⊗ χ(τ) on the Serre tensor abelian variety A₀⊗_(O_F)O_E is non-torsion (BSW Theorem 2.8(i)). The application to nonvanishing of L^S_𝔭(f, 1) is made in [9.19 The formal logarithm detects non-torsion Heegner points](#919-the-formal-logarithm-detects-non-torsion-heegner-points), which depends on this target, rather than used to prove this target.

Assume dim A_f = [M_f : ℚ] and M_f has a real embedding: the input of the p-adic analytic subgroup theorem in BSW's form. The statement concerns actual algebraic points and the specific Heegner tensor P_K(f) obtained from one; it asserts nothing about an arbitrary nonzero M_f- or ℂ_p-linear tensor or an arbitrary nonzero cohomology class. For (b), φ is Hecke-equivariant, so P_K(f) = φ(ε_f Q^ξ_K) = e_f·(y ⊗ 1) with e_f the image of ε_f in O_f ⊗ M_f (the idempotent of multiplication M_f ⊗ M_f → M_f; e_f = 1 only if M_f = ℚ). Hence P_K(f) ≠ 0 ⇒ y ≠ 0, and since a^*ω = ι_p(a)ω for a ∈ O_f, log_ω kills (1 − e_f), so log_ω P_K(f) = log_ω y; a nonzero integral multiple of y is an actual non-torsion point. For (c), E is totally real and χ has finite order, hence its values are ±1; use the actual Serre tensor variety and point, not an arbitrary nonzero C_p-tensor.

*Outline.* Apply the eigenlogarithm theorem only to actual algebraic points: clear denominators in y ∈ A_f(K) ⊗ ℚ. The analytic subgroup input has an algebraic point as a hypothesis. For (a), apply [9.2 The algebraic-point subgroup input to eigenlogarithms](#92-the-algebraic-point-subgroup-input-to-eigenlogarithms) and the dimension/real-embedding argument of BSW Theorems 1.1 and 2.3. (b) Hecke-equivariance gives P_K(f) = e_f·(y ⊗ 1), so P_K(f) ≠ 0 ⇒ y ≠ 0; the eigen-property of ω (ε_f·ω_f = ω_f, Skinner p.344) gives log_ω P_K(f) = log_ω y. Clear denominators in y and apply (a). Do not assert φ ∘ ε_f = φ: it holds for the rational Galois-orbit projector but fails for the M_f-coefficient projector when [M_f : ℚ] > 1. (c) BSW Theorem 2.8(i) for E totally real.

*Consequences.* For an elliptic curve (M_f = ℚ) (a) is the elementary fact that the formal logarithm kills only torsion; for [M_f : ℚ] > 1 it is a transcendence theorem: freeness of A_f(K) ⊗ ℚ_p over M_f ⊗ ℚ_p alone does not give componentwise nonvanishing. Skinner Corollary 2.6.2 (P_K(f) ≠ 0 ⇔ L^S_𝔭(f, 1) ≠ 0) is proved this way; its deduction requires the eigencomponent nonvanishing theorem.

([A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §1.4, Theorem 1.1, p. 3; [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §1.3, p. 3; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Corollary 2.6.2, p. 14; [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §2.3, Theorem 2.8(i), p. 6.)

*Needs:* [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [9.2 The algebraic-point subgroup input to eigenlogarithms](#92-the-algebraic-point-subgroup-input-to-eigenlogarithms).

### 9.14 Normalization of the toric root and its square

Fix the character, coefficient and period data of the BDP construction, independently of its central-value function, and take N⁻=1. The all-split-level specialization is constructed from §9.4 using Castella–Hsieh §3.3, Proposition 3.8. For squarefree ramified level primes this target constructs the additional Castella–Hsieh specialization using the CM moment target and the local (ST) test vector; it is not an all-split Hsieh import. Let ψ₀ be an anticyclotomic Hecke character of infinity type (1, −1) whose conductor is a power of p (Castella–Hsieh's c_o = 1, so that ψ₀φ is unramified outside p like the characters of Γ), and L_(p,ψ₀)(f) the Castella–Hsieh measure on Γ̃ = Gal(K_(p^∞)/K), the F=ℚ, n⁻=1 distribution of Castella–Hsieh §3.3 constructed from §9.4. For every p-adic avatar φ̂ of an anticyclotomic character of infinity type (m, −m), m ≥ 0, and p-power conductor, (L_(p,ψ₀)(f)(φ̂) / Ω_p^(2+2m))² = L^alg(1/2, π_K ⊗ ψ₀φ) · e_p(f, ψ₀φ) · φ(𝔑^(-1)) · 2^(#A(ψ₀)+3) ε(f) u_K² √D_K (Castella–Hsieh Prop. 3.8 with c_o = 1). Comparing with JSW (5.1.a), the restriction of L_p(f) to the characters of Γ equals L_(p,ψ₀)(f)², transported to Γ by twisting by ψ̂₀^(-1), times an explicit unit of Λ_R, whose character evaluations include the character-dependent factor φ(𝔑^(-1)) and the scalar factors t_K, w_K, u_K, ε(f) and 2; proving that this comparison factor is a unit of Λ_R is part of this target. Consequently: L_p(f) is a square in Λ_R up to a unit; its μ-invariant is even and its λ-invariant is even; and the value at the BDP point is the square of an element linear in the Heegner-point logarithm. The linear root distribution and the central-value square have different normalizations.

Assume N⁻ = 1, i.e. no inert prime divides N. Castella–Hsieh's (Heeg′) then requires their N_f⁻ (the part of N at non-split primes, here the ramified ones) to be squarefree; for N⁻ > 1 Hsieh's GL₂ toric period vanishes because the type-two characters need B ramified at the inert primes of N⁻ (Saito–Tunnell), and Brooks's quaternionic construction replaces it. The comparison is an identity of measures, proved on the Zariski-dense set of characters where both interpolation formulas hold. Even μ and λ conclusions apply to a nonzero power series, with μ and λ defined over the specified complete discrete valuation ring. For μ the twisted root must have coefficients in R: take L large enough to contain the values of ψ̂₀ (λ-parity holds regardless). Castella–Hsieh Proposition 3.8 assumes (ST) and (c_o,pN⁺)=1 as well as (Heeg′); (ST) is vacuous when (N, D_K) = 1; otherwise ψ₀ (with c_o = 1) must be chosen to satisfy it, and that choice is part of the normalization comparison. The unit property of the comparison factor is proved here, by the normalization comparison of the outline.

*Outline.* Start with the integral translated CM root g, before defining L_p(f). At ramified level reproduce Castella–Hsieh Proposition 3.8 from their Definition 3.7 and Proposition 3.6, evaluating the ramified test integrals under (Heeg′) and (ST); their all-split Hsieh specialization alone is insufficient. Use the same CM elliptic curve, differential and Igusa trivialization on both sides. Define the normalization factor from the explicit toric constants and the period dictionary, not by dividing values at a possibly vanishing L-value. At such ψ pass between JSW's ψ^alg (with χ^(-1) = ψ^alg |·|_(𝔸_K), JSW Remark 5.1.1(b)) and Castella–Hsieh's ψ₀φ of infinity type (1 + m, −1 − m), and compare the constants of JSW (5.1.a) with those of Castella–Hsieh Proposition 3.8 (using the toric evaluation of Castella–Hsieh Proposition 3.6, pp. 11–12). The character-dependent factor φ(𝔑^(-1)) must be represented by a group-like unit of Λ_R after the character/twist transport; it is not a fixed scalar in R. Cancel the common L-value, gamma factors, p-Euler factors and period powers as symbolic expressions before any evaluation. Retain the factors 2, u_K, √D_K, ε(f), t_K and the Atkin–Lehner phase with their displayed exponents. Powers depending on n are transported by the fixed local reciprocity unit from the CM-coordinate/period dictionary; φ(𝔑^(-1)) is a group-like factor, not a coefficient scalar. The period dictionary first absorbs the complex 2πi and archimedean-coordinate powers into the chosen differential periods; these are not p-adic valuations of complex numbers. For the remaining factors use the following valuation ledger: powers of 2 and t_K = 2^(2−t) are units because p is odd; u_K and √D_K are units because p splits in K; ideals b and the auxiliary scalar b_N in Brooks are chosen prime to p, so their reciprocity/weight factors are group-like or coefficient units. The Fricke phase W_f is a unit by the integral Fricke operator and its inverse at p∤N on the primitive eigenline; complex absolute value one alone would not prove this. The same argument handles its Atkin–Lehner phase. Thus every remaining scalar factor has valuation zero. No class-number division or Petersson-ratio inversion is used to prove this unit claim. Define bdpRootNormalization to be precisely this scalar times these group-like factors. Then the later constructor u·g² has JSW interpolation by the computed identity. Equality for the resulting measures follows from interpolation uniqueness, without invoking a logarithm formula.

Its API consists of the following facts:

- castellaHsiehRoot_ramifiedLevel constructs the bounded root in the (Heeg′),(ST) range.
- bdpRootCharacterTransport fixes the inverse/twist and tame branch.
- bdpRootNormalization is the explicitly cancelled constant/group-like product.
- bdpRootNormalization_isUnit proves its valuation and group-like inverse.
- bdpRootPeriodTransport records the differential-period conversion before cancellation.
- bdpRootFrickePhase_isUnit uses integral Fricke and inverse on the primitive line.
- bdpRootSquare_interpolation proves JSW's right side before naming the central-value series.

**Checks.**

- A factor φ(𝔑^(-1)) varies with φ; treating it as a constant fails on a character nontrivial at 𝔑.
- At K=ℚ(√−3), u_K=3; p=3 is excluded by splitness, so u_K remains a p-unit in the actual range.
- The zero root still gives the zero square and the same unit construction; division by a root evaluation would be undefined.
- A tame character of Pic(O_c) does not descend to Γ until the branch restriction and twist have been made.
- At a ramified level prime, omitting (ST) changes the test-vector constant; the all-split specialization cannot justify it.

*Consequences.* Square versus square root: at a simple zero of the square-root distribution L_p(f) has a double zero; a wrong identification would make the λ-invariant odd. Any downstream main-conjecture comparison must use L_BDP for the square-root distribution and L_p(f) for its unit multiple square. No Selmer characteristic-ideal identity is an input to this normalization target.

([Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Definition 3.7, p. 13; [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Proposition 3.8, p. 13.)

*Needs:* [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves), the ordinary CM root-distribution target of §9.4, the coefficient and measure interfaces of §9.3, [4.2 Saito–Tunnell dichotomy](#42-saitotunnell-dichotomy), TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1, [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness).

### 9.15 The BDP anticyclotomic p-adic L-function in weight two

Fix f ∈ S₂(Γ₀(N)), a newform, K imaginary quadratic of discriminant −D_K with (gen-H) for N = N⁺N⁻, p ≥ 3, p ∤ N (good) and p = v v̄ split in K, v fixed by ι_p. Let Γ = Gal(K_∞/K) be the anticyclotomic ℤ_p-extension, O ⊂ L the coefficients (L containing the Hecke field and the Hilbert class field of K), R the completion of the ring of integers of L·ℚ_p^ur, and Λ_R = R⟦Γ⟧. Let Σ_cc be the set of continuous ψ : G_K → ℚ̄_p^× factoring through Γ with ψ^τ = ψ^(-1), crystalline at v and v̄, of Hodge–Tate weights −n < 0 at v and n at v̄, and ψ^alg its algebraic Hecke character (infinity type (n, −n)). The BDP p-adic L-function is the unique L_p(f) ∈ Λ_R such that for all ψ ∈ Σ_cc with n ≡ 0 mod (p − 1): ψ(L_p(f)) = E_v̄(f, ψ)² · t_K · C(f, ψ) / (α(f, f_B) W(f, ψ)) · Ω_p^(4n) · L(f, ψ^alg, 1) / Ω_∞^(4n), where E_v̄(f, ψ) = 1 − ψ^alg(ϖ_v̄) a_p p^(-1) + ψ^alg(ϖ_v̄)² p^(-1), t_K is the constant of block (A) (Burungale Theorem 5.6, p. 29; JSW (5.1.a), where it is a power of 2 depending only on K); C(f, ψ) = 2^(#S_f) · ¼ π^(2n−1) Γ(n) Γ(n + 1) w_K √D_K ∏_(ℓ|N⁻) (ℓ − 1)/(ℓ + 1) (the factor 2^(#S_f) is that of Brooks's C(f, χ), brooks line 1836, and of Burungale (5.10); JSW (5.1.a) is the case S_f = ∅ of their hypothesis (JSW-H), where it equals 1), W(f, ψ) is Brooks's constant W(f, χ) of absolute value one (defined before his Proposition 8.5, p. 4235, from the auxiliary ideal b and scalar b_N of Proposition 8.3 and the norm-one scalar W_f following Lemma 8.4), transported by χ^(-1) = ψ^alg|·| (the exact transported expression, and its comparison with the expression displayed by JSW, are part of the normalization comparison), α(f, f_B) is the Petersson ratio, Ω_p ∈ R^×, Ω_∞ ∈ ℂ^× are the p-adic and complex CM periods, and L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2). The trivial character (the BDP point) is not in Σ_cc: L_p(f, 1) lies outside the interpolation range.

Assume (gen-H): N⁺ divisible only by split or ramified primes, N⁻ a squarefree product of an even number of inert primes; (good) p ∤ N; (split) p = v v̄; (ST) at ramified level: a_ℓ(f) = −1 for every ℓ | (N, D_K). Every ψ ∈ Σ_cc is unramified at such ℓ with ψ(Frob_𝔩) = 1: complex conjugation fixes 𝔩 and acts on Γ ≅ ℤ_p by inversion, so Frob_𝔩 is 2-torsion in Γ and trivial for odd p. Hence for χ^(-1) = ψ^alg|·| one has χ(𝔩) = ℓ, and (ST) of [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn) and Castella–Hsieh's (ST) for every ψ ∈ Σ_cc both reduce to a_ℓ(f) = −1, which is Skinner's (ram). With it the sign of L(f, ψ^alg, s) at s = 1 is +1 for every ψ ∈ Σ_cc; (gen-H) alone does not give this. If a_ℓ(f) = +1 at a ramified ℓ, the split toric functional at ℓ vanishes for the whole family, so neither the quaternionic CM sums of §9.11 nor the GL₂ root of §9.14 supplies the interpolation constants. The standing JSW convention also requires p to be odd. Each prime dividing (N, D_K) divides N exactly once (Brooks §2.1. Castella–Hsieh (Heeg′)), and when such primes occur the displayed 2^(#S_f) factor uses S_f={ℓ∣(N,D_K)} in the trivial-nebentypus case and is independent of t_K, which depends only on K. JSW itself states existence under (JSW-H), and BDP's N⁻ = 1 construction also assumes D_K odd. Ordinarity of f at p is not assumed: the CM points are ordinary because p splits in K, and L_p(f) is a bounded measure even for supersingular f. Uniqueness uses that the n ≡ 0 mod (p − 1) characters give infinitely many distinct values ψ(γ) − 1 in the open unit disc of ℂ_p (inside the maximal ideal of R itself for n ≡ 0 mod (p − 1)p^k, where p^k is the index of the image of 1 + pℤ_p in Γ), and a nonzero element of R⟦T⟧ has finitely many zeros there (Weierstrass preparation). The incomplete L_p^Σ(f) = L_p(f) · ∏_(w ∈ Σ) P_w(ε^(-1)Ψ^(-1)(Frob_w)) for a finite set Σ of places not above p interpolates the incomplete L-values. P_w is the local Euler polynomial of the base change of f to K at w, formed with geometric Frobenius on inertia invariants (the convention of JSW and Skinner, jsw line 436). At an inert w = (ℓ), complex conjugation fixes w and inverts Γ, so Frob_w is trivial in Γ for odd p. The factor at w is therefore the constant L_w(f_K, 1)^(-1): the reciprocal of the w-Euler factor of L(f, ψ^alg, s) at s = 1, which is the same for every ψ ∈ Σ_cc. It has two branches. For ℓ ∤ N, with α + β = a_ℓ and αβ = ℓ, it is (1 − α²ℓ^(-2))(1 − β²ℓ^(-2)) = (1 − a_ℓ ℓ^(-1) + ℓ^(-1))(1 + a_ℓ ℓ^(-1) + ℓ^(-1)). For ℓ | N, (gen-H) gives ℓ | N⁻ and ℓ ∥ N. Then f is Steinberg at ℓ up to an unramified quadratic twist, a_ℓ = ±1, and the inertia invariants form a line on which Frob_w = Frob_ℓ² acts by a_ℓ² = 1; the factor is (1 − a_ℓ ℓ^(-1))(1 + a_ℓ ℓ^(-1)) = 1 − ℓ^(-2). The good-place expression would give 1 + 2ℓ^(-1) at such ℓ. JSW Remark 5.1.4 prints only the good-place expression, without the qualifier ℓ ∤ N (jsw line 1352), while its Σ may contain level primes (jsw line 1345). Either branch can raise the μ-invariant. Construct the linear root first: [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square) in the GL₂ case (§9.4 constructs its all-split subcase), the integral CM-moment measure of [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function) in the quaternionic case. The character/period transport fixes its central-value normalization before this constructor: [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square) supplies it in the GL₂ case with its stated (Heeg′),(ST) hypotheses at ramified level, and [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function) supplies the exact CM-sum normalization in the quaternionic case. These inputs depend on neither the central-value function nor the weight-two logarithm formula.

*Outline.* Fix the character avatars and coefficient ring of §9.3, the tame branch and the CM periods of §9.4. For N⁻=1 use the already normalized root of [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square); for N⁻>1 use the bounded quaternionic root and normalization of [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function). Apply the specified Λ-unit normalization and square; this is the algebraic construction u·root². Construction does not call interpolation or a comparison theorem that assumes L_p already exists. Evaluate the supplied roots using their previously proved normalization identities to obtain JSW (5.1.a). The GL₂ group-like/period factor was fixed in [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square); in the quaternionic case the exact CM-sum square was fixed in [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function) with Brooks's constant and no t_K, and the unit u of the quaternionic case is t_K times the transport unit of the character and period dictionary, so that ψ(L_p(f)) = t_K·(Brooks's value) at every ψ ∈ Σ_cc with n ≡ 0 mod (p − 1); t_K = 2^(2−t) is prime to p because p is odd. This constructor does not supply a second proof of its root normalization. Use the coefficient-series target and Mathlib Weierstrass preparation over the complete DVR R to deduce uniqueness from infinitely many distinct interpolation values in its maximal ideal. The coefficient-series target proves the analytic uniqueness consequence for this R with infinite residue field.

Its API consists of the following facts:

- For an already constructed linear root in Λ_R and a specified Λ_R-unit u, return u·root². Both GL₂ and quaternionic roots come from the CM moment construction of §9.4. Identifying u with JSW normalization is separate.
- For ψ ∈ Σ_cc with n ≡ 0 mod (p − 1), ψ(L_p(f)) is given by JSW (5.1.a).
- Two elements of R⟦T⟧ agreeing at infinitely many points ψ(γ) − 1 of the maximal ideal are equal.
- A convergent character-evaluation ring map sends u·root² to ev(u)·ev(root)². The evaluation identity follows from preservation of multiplication and powers by any ring map from the power-series ring; it supplies no analytic convergence or character interpretation.
- The value at the trivial character is the constant coefficient: L_p(f, 1) = constantCoeff L_p(f).
- L_p^Σ(f) = L_p(f) · ∏_(w ∈ Σ) P_w(ε^(-1)Ψ^(-1)(Frob_w)).
- At an inert w = (ℓ) ∈ Σ the factor is a constant of Λ_R. It is (1 − a_ℓ ℓ^(-1) + ℓ^(-1))(1 + a_ℓ ℓ^(-1) + ℓ^(-1)) when ℓ ∤ N, and 1 − ℓ^(-2) when ℓ | N (then ℓ ∥ N and a_ℓ = ±1).
- Replacing Ω_p by u Ω_p with u ∈ ℤ_p^× (the ambiguity of the formal-group trivialisation, BDP Remark 5.8; for a general unit of R the rescaled values need not come from an element of Λ_R) multiplies ψ(L_p(f)) by u^(4n) for ψ of weight (−n, n).
- The adapter equals u·root² for the supplied root and unit; the arithmetic identification of that unit is the square-root comparison.
- Multiply the central-value series by the specified finite collection of local Euler-factor series.

**Checks.**

- For the imprimitive series, the empty Euler set leaves F unchanged.
- With F=1+T and a singleton factor 1−T, the result is 1−T².
- With F=1 and two distinct factors 1−T and 1+T, the result is 1−T²; adding the factors instead gives 2.
- A zero factor makes the imprimitive series zero.
- For root 1+T and unit u=1, the normalized central-value square is 1+2T+T²: its linear coefficient is 2, whereas the unsquared root has linear coefficient 1.
- Replacing the root by c·root multiplies the normalized central-value square by c²; a definition that forgot the square would scale by c.
- The constant coefficient of u·root² is u(0)·root(0)²; dropping the normalization unit changes it whenever u(0)≠1, for example u=2 over ℤ_p with p odd.
- Evaluation at T = 0 (the trivial character) is the constant coefficient of the power series.
- If F ∈ R⟦T⟧ vanishes at infinitely many distinct points of the maximal ideal then F = 0; so the interpolation property determines L_p(f).
- For the minimal model y²+y=x³−x²−10x−20 of 11a1, #E(𝔽₅)=5 and #E(𝔽₂₃)=25. Thus a₅=1 and E₅=1, while a₂₃=−1 and E₂₃=25/23. The curve y²=x³+3x over 𝔽₅ has ten points, hence a₅=−4 and E₅=2, a 5-adic unit although #E(𝔽₅) ≠ 5; and E₂₃ = 25/23 for 11a1 shows that a good-reduction Euler factor need not be a p-adic unit (or even p-integral). These are point-count tests; identifying the modular form and split CM data requires their owners.
- Inert level primes. E : y²+xy=x³+x²−11x has discriminant 3⁶·11² and c₄ = 553 = 7·79, which is prime to 33. So it has conductor 33 with multiplicative reduction at 3 and 11. Counting points gives #E(𝔽₃) = 5 and #E(𝔽₁₁) = 11 (singular point included), so a₃ = −1 and a₁₁ = +1. For K = ℚ(√−31) and p = 5, the symbols (−31/3), (−31/11) and (−31/5) are −1, −1 and +1. Thus N⁻ = 33 and N⁺ = 1, (gen-H), (good) and (split) hold, and (ST) is vacuous. The inert factors are 1 − 3^(-2) = 8/9, a 5-adic unit, and 1 − 11^(-2) = 120/121, of 5-adic valuation one. The good-place expression would give 5/3 and 13/11, of 5-adic valuations one and zero, which misplaces the μ-contribution at both primes.
- The trivial character has Hodge–Tate weight n = 0 and is not in Σ_cc (n > 0, n ≡ 0 mod p − 1): L_p(f, 1) is not an interpolated value. A function interpolating at n = 0, such as the cyclotomic Mazur–Tate–Teitelbaum function at its critical twists, is a different object (and unbounded for supersingular f, whereas L_p(f) is bounded).

*Consequences.* Compatibility with BDP's normalisation for N⁻ = 1: α = 1, and L(f, ψ^alg, 1) = L(f, χ^(-1), 0) for χ^(-1) = ψ^alg|·|, where χ has BDP/Brooks infinity type (2 + j, −j) with j = n − 1 (so Γ(j + 1)Γ(k + j) = Γ(n)Γ(n + 1) and Ω^(2(k+2j)) = Ω^(4n); JSW Remark 5.1.1(b) prints j = n + 1, with the indicated normalization). Supersingular test: for a_p = 0 the element still lies in Λ_R (bounded), unlike the cyclotomic p-adic L-function of a supersingular form. The trivial character is not interpolated: L(f, K, 1) = 0 when the local sign conditions give the global sign −1; (gen-H) alone does not imply this at ramified level primes while L_p(f, 1) need not vanish.

([The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, display (5.1.a), p. 32; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, Remark 5.1.1(c), p. 32; [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §5.2, (5.2.3) and Proposition 5.10, pp. 1134–1135; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Published §2.6, p. 342 (preprint p. 13 uses O[[Γ]]).)

*Needs:* [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square), [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves), [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §1.6 (characterIntegralAlgHom), [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness), TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1, the coefficient and measure interfaces of §9.3, the ordinary CM root-distribution target of §9.4, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison` and `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility` for the inert Euler factors (geometric Frobenius on inertia invariants of the base-change parameter, Steinberg monodromy retained), Mathlib `PowerSeries`, Mathlib `PowerSeries.eval₂`, Mathlib `IsTopologicallyNilpotent`, Mathlib `ContinuousMonoidHom`, [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function).

### 9.16 The quaternionic weight-two formula of Brooks and JSW

Assume p odd, (gen-H) with N⁻ > 1, (-free) N squarefree, (good), (split) and (ST) at ramified level as in [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two): a_ℓ(f) = −1 for every ℓ | (N, D_K). Let X* = X_(N⁺,N⁻), ℓ₀ ∤ pN a prime split in K with 1 − a_(ℓ₀) + ℓ₀ ≠ 0, ι_(N⁺,N⁻)(x) = (T_(ℓ₀) − ℓ₀ − 1)[x], and x_K^(N⁺,N⁻) ∈ J(X*)(K) the Heegner point of JSW §4.3. Prove that L_p(f, 1) = (1 − a_(ℓ₀) + ℓ₀)^(-2) · ((1 + p − a_p)/p)² · log_(ω_f)(x_K^(N⁺,N⁻))² up to a p-adic unit, where, for the coefficients O ⊂ L of 9.15 completed at the prime above p given by ι_p (so L is a finite extension of ℚ_p) and the O-basis ω_f ∈ Ω¹(J(X*)/ℤ_p) ⊗_(ℤ_p) O attached to f_B, log_(ω_f) : J(X*)(K_v) ⊗_ℤ O → K_v ⊗_(ℚ_p) L is the O-linear extension of the logarithm with d log_(ω_f) = ω_f. Since p splits in K, K_v = ℚ_p and the target is L; the logarithm is K_v-valued only when ω_f is defined over K_v, for instance when L = ℚ_p (9.8 enlarges the coefficient field in the same way). Exactly (Brooks Proposition 8.13 with the square restored): for a central critical χ of infinity type (1, 1), L_p(f, χ) = (1 − χ^(-1)(p̄) a_p + χ^(-2)(p̄) ε_f(p) p)² · log_(ω'_f)(Δ'_χ)², with Δ'_χ = φ(ε_f Δ_χ) ∈ Div(C')(H) ⊗ ℚ̄ (in the eigenspace on which Gal(H/K) acts through the finite-order part χN^(-1) or its inverse. K-rational when χN^(-1) is trivial) on the quotient C' = ℍ/Γ_(0,N⁺) and Δ_χ = Σ_a χ^(-1)(a) N(a) P_a, the sum of the CM points a ⋆ (A, t) (Brooks prints P_χ inside the sum).

Assume (-free) and (gen-H) as in JSW Proposition 5.1.6, and p odd (Brooks §2.1); f need not be ordinary at p. The exact form is Brooks's. JSW's restatement is up to a p-adic unit and replaces Brooks's x̃_K = Σ_σ ε_f[x]^σ by x_K^(N⁺,N⁻), where ε_f x_K^(N⁺,N⁻) = (a_(ℓ₀) − ℓ₀ − 1) x̃_K (JSW print the factor as 1 − a_(ℓ₀) + ℓ₀; the sign is irrelevant after squaring). Brooks prints log_(ω_f)(ε_f Δ_χ) without the square in Propositions 8.12–8.13. Theorem 8.11, from which they are deduced, and JSW's restatement have the square. JSW §5.1.5 display the codomain of log_(ω_f) as K_v (jsw line 1361), although ω_f lies in Ω¹(J(X*)/ℤ_p) ⊗_(ℤ_p) O; the values lie in K_v ⊗_(ℚ_p) L, as stated above.

*Outline.* Brooks Theorem 8.11 at k = 2, j = 0: L_p(f, χ) = (Euler factor)² · (Σ χ^(-1)(a) N(a) AJ_p(Δ_a)(ω_f))², obtained from the continuity of [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function), θ^(-1) f^♭ as the Coleman primitive (Brooks Lemma 7.3) and the Euler-factor removal of Lemma 8.6. Weight two: compute with Δ_χ rather than ε_f Δ_χ (Brooks Lemma 7.5) and identify AJ_p with log_(ω_f) ([9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm)). Descend from C to C' = ℍ/Γ_(0,N⁺) with log_(φ^*ω)(P) = log_ω(φ(P)); Shimura reciprocity shows Δ'_χ is defined over H and is Gal(H/K)-equivariant through the finite part χN^(-1); it is K-rational when χN^(-1) = 1. JSW's form: log_(ω_f) x_K^(N⁺,N⁻) = log_(ω_f) ε_f x_K^(N⁺,N⁻) = (a_(ℓ₀) − ℓ₀ − 1) log_(ω_f) x̃_K^(N⁺,N⁻), whose square is (1 − a_(ℓ₀) + ℓ₀)² log_(ω_f)(x̃_K^(N⁺,N⁻))².

*Consequences.* Squared logarithm: both sides are quadratic in ω_f; replacing ω_f by u ω_f multiplies the right side by u² and the left side through the normalisation of f_B by the same u², a test a non-squared version fails. The auxiliary ℓ₀ cancels: changing ℓ₀ multiplies log_(ω_f) x_K (equivalently ε_f x_K) by (1 − a_(ℓ₀') + ℓ₀')/(1 − a_(ℓ₀) + ℓ₀) and the prefactor by its inverse square.

([The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.6, p. 34; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, Proposition 8.13, p. 4239; [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.5, Theorem 8.11, p. 4238.)

*Needs:* [0a.5 CM level triples](#0a5-from-cm-moduli-points-to-level-triples), [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function), [9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm), [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point), [9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻)](#99-the-waldspurger-formula-at-cm-points-of-x_nn), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), HilbertModularVarietiesAndShimuraCurves R18.1.3, HilbertModularVarietiesAndShimuraCurves Layer R18.2, [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters), HilbertModularVarietiesAndShimuraCurves R18.2.6.

### 9.17 The BDP p-adic Gross–Zagier formula in weight two

Fix f ∈ S₂(Γ₀(N)), a newform, K of odd discriminant, with a proper cyclic ideal 𝔑_c⊂O_c such that O_c/𝔑_c≅ℤ/Nℤ, c odd and prime to N d_K, p ∤ Nc split in K, and χ a finite-order character of Pic(O_c), viewed as the central critical character χN of infinity type (1, 1) in Σ_cc^((1))(𝔑). Let P_a ∈ X₀(N)(H_c) be the image of BDP's CM point a ⋆ (C/O_c, t₀), i.e. the 0a.2 pair attached to a^(-1), C/a^(-1) → C/a^(-1)𝔑_c^(-1) (BDP (1.4.7)–(1.4.8), p.1054, and §5.1, p.1127); with 0a.2 indexed instead by C/a → C/a𝔑_c^(-1) the sum below carries χ(a) in place of χ^(-1)(a). Let ω_f be the differential of f. Use BDP’s continuous p-adic L-function on the completed central-critical character family with fixed tame conductor c and finite type (c, 𝔑, 1), rather than evaluating the Γ-only measure at an arbitrary character of Pic(O_c). For this BDP function, L_p(f, χN) = (1 − χ^(-1)(p̄) a_p p^(-1) + χ^(-2)(p̄) p^(-1))² · (Σ_([a] ∈ Pic(O_c)) χ^(-1)(a) log_(ω_f)([P_a − ∞]))². For χ = 1 and c = 1 this reads L_p(f, 1) = ((1 + p − a_p)/p)² · log_(ω_f)(P_K)², with P_K = Σ_σ [P^σ − ∞] = the trace Heegner divisor class on J₀(N), and equivalently log_ω(P_K(f))² for the point P_K(f) on A_f with φ^*ω = ω_f.

Assume BDP Assumption 5.12 at k = 2: D_K odd, Heegner hypothesis, c odd prime to N d_K, p split and prime to Nc. Also require the finite local signs ε_q(f,χ⁻¹)=+1 at every finite q, condition (4) of Assumption 5.12 (including at ramified level primes; retain BDP’s exceptional set S(f) and its finite-type conditions, pp.1093–1094); the fixed finite type satisfies its central-critical compatibility. The value is at a character outside the range of interpolation. L(f, χ^(-1), 0) vanishes there, and the formula is a special value, not a derivative. This is not a p-adic height formula: it involves the logarithm (Abel–Jacobi image), not the cyclotomic p-adic height of Perrin-Riou. The identification of the c = 1 trivial-character value with JSW’s Γ-measure uses a character, period and normalization transport. For general c the tame branch is extra data; χ need not factor through Γ. P_a is built from 0a.2, including its unit stabilizer at D_K=−3. Its validity at even discriminant does not extend this analytic formula beyond BDP’s stated odd-discriminant hypotheses.

*Outline.* At ramified level retain the cyclic CM pair and verify the local test-vector and finite-type conditions by §§4.4–4.7 and the ordinary CM moments of §9.4. Prove the r=j=0 case of BDP Theorem 5.13 under every clause of Assumption 5.12, by comparing the CM primitive with the moments of §9.4 and the toric values of §9.9: L_p(f, χ') = E(f, χ')² (Σ χ'^(-1)(a) N(a) AJ_F(Δ_(φ_aφ_0))(ω_f))² for χ' of infinity type (1, 1), with c^0/0! = 1 and Ω_p^0 = 1. For r = 0 the cycle attached to φ_a φ_0 is the CM point P_a corrected by a cusp on BDP's curve X₁(N), and AJ_F(P_a − ∞)(ω_f) = log_(ω_f)([P_a − ∞]) ([9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm)); push forward along X₁(N) → X₀(N), which pulls ω_f back to ω_f, using [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters) (a). Rewrite χ^(-1)(a)N(a) for the character χN of infinity type (1, 1) as the finite-order χ^(-1)(a), and the Euler factor at χN as in [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point). For χ = 1 and c = 1 the sum over Pic(O_K) is the Galois trace; through the quotient φ : J₀(N) → A_f with φ^*ω = ω_f, log_(ω_f)(Q) = log_ω(φ(Q)) ([9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters)).

**Checks.**

- For 37a1 and K=ℚ(√−7), 37 splits (−7≡17² mod37), and p=11 splits (−7≡4 mod11). The cyclic level ideal and the all-split specialization satisfy the geometric hypotheses.
- For 37a1, K=ℚ(√−111), c=1, p=5 and χ=1, the ramified ideal above 37 has quotient 𝔽₃₇ and −111≡4 mod5. Counting the reduction y²+y=x³−x gives 39 projective points, hence a₃₇=38−39=−1. Its nonsplit Steinberg twist has the required trivial-character ramified local sign; this case is admitted by Assumption 5.12.
- An inert prime ℓ dividing N has no cyclic norm-ℓ ideal in O_c when ℓ∤c, so a formally identical point sum at such a level is outside these hypotheses.

*Consequences.* Skinner Proposition 2.6.1, Case I: L_p^S(f, 1) ≐ (log_ω P_K(f))², with the Euler factors at S removed. Here ≐ is Skinner's equality up to a nonzero constant, which depends on the Hecke eigenvalues at the primes of S (skinner-published line 609). It is not equality up to a p-adic unit, because the removed factors need not be units. At a ramified w | ℓ with ℓ ∤ N, Frob_w is trivial in Γ and the factor is 1 − a_ℓ ℓ^(-1) + ℓ^(-1) = (ℓ + 1 − a_ℓ)/ℓ. For 11a1 at ℓ = 23 this is 25/23, which is divisible by 25 at p = 5 (the point-count Check of [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two)). Class number one, unit group of order 2: BDP's introduction reduces the formula to L_p(f, 1) = ((1 + p − a_p)/p)² log_(ω_f)(P_A − ∞)². A non-example: replacing the logarithm by the p-adic height of P_K gives Perrin-Riou's formula for the cyclotomic derivative, a different statement.

([Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §5.3, Theorem 5.13, p. 1137; [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), Introduction, p. 1038; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Proposition 2.6.1, p. 14.)

*Needs:* §§4.4–4.7 (ramified local order, test-vector and constant comparisons), §9.4 (ordinary CM moments), [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two), [9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm](#98-in-weight-two-the-p-adic-abeljacobi-map-is-the-formal-logarithm), [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point), [0.5 The Artin-map convention and the Galois action on Heegner points](#05-the-artin-map-convention-and-the-galois-action-on-heegner-points), [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#88-the-χ-heegner-point-p_χf-and-its-finite-form-p_χf), the coefficient and measure interfaces of §9.3, [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters).

### 9.18 The formula for a p-optimal quotient

Assume (good) and (irred_K): the residual representation of V = V_f is irreducible over G_K. Take the quotient π : J(X*_(N⁺,N⁻)) → A_f to be (ℤ(f), 𝔭)-optimal, i.e. π = φ ∘ π₀ with π₀ an optimal quotient and φ : A₀ → A_f an isogeny such that φ(T_p A₀) ⊄ 𝔭 T_p A_f, 𝔭 the prime of ℤ(f) fixed by ι_p, and ω_(A_f) the differential of A_f with the image of the 𝔭-summand basis. Prove that π^*(ω_(A_f)) ∈ O^× ω_f, and with y_K = π(x_K^(N⁺,N⁻)), JSW's z_K = y_K/(a_(ℓ₀) − ℓ₀ − 1), and ℓ₀ ∤ pN split in K with 1 − a_(ℓ₀) + ℓ₀ a 𝔭-adic unit: L_p(f, 1) = ((1 + p − a_p)/p)² · log_(ω_(A_f))(z_K)², equivalently log_(ω_(A_f))(y_K)², up to a unit in O.

Assume the standing JSW §3–§5 setting includes p odd, squarefree N, (split), (gen-H) and (ST) at ramified level (a_ℓ(f) = −1 for every ℓ | (N, D_K), as in [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two)), with the curve and Hecke auxiliary prime chosen as in [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw); (good) and (irred_K) supplement that setting rather than replace it; (good) p ∤ N; (irred_K); p − 1 > 1 (p odd) for the direct-summand argument of BLR Theorem 4, p. 187. The choice of a 𝔭-optimal quotient and of ℓ₀ with 1 − a_(ℓ₀) + ℓ₀ ∈ O^× (possible under (irred_K)).

*Outline.* Néron models of J, A₀ and A_f are abelian schemes over ℤ_p by (good); π, π₀, φ extend. π₀ optimal gives a good-reduction exact abelian-scheme sequence. Apply [9.1 Cotangent saturation for good-reduction optimal quotients](#91-cotangent-saturation-for-good-reduction-optimal-quotients) over R=ℤ_p (e=1<p−1, where it is the good-reduction case of NeronModelsAndSemistableAbelianVarieties §6.4d) to obtain the direct summand π₀^* Ω¹(A₀/ℤ_p)⊂Ω¹(J/ℤ_p). Ω¹(A_f/ℤ_p) ⊗ O/p = Lie_(𝔽_p)(A_f[p]⁰)^∨ ⊗ O/p; T_p A₀ → T_p A_f not landing in 𝔭 T_p A_f and irreducibility give A₀[p] ↠ A_f[𝔭^(e_𝔭)], hence injectivity on cotangent spaces, so φ^*ω_(A_f) is part of an O-basis. Substitute log_(π^*ω)(x) = log_ω(π(x)) into [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw).

*Consequences.* Without (irred_K) the optimal-quotient differential can fail to be a unit multiple of ω_f, and the formula holds only up to the index of φ^*ω_(A_f) — a test that a version dropping the hypothesis fails. For the analogous N⁻ = 1 statement (cotangent argument unchanged; formula from [9.17 The BDP p-adic Gross–Zagier formula in weight two](#917-the-bdp-p-adic-grosszagier-formula-in-weight-two)) and E optimal, π^*ω_E = c_E ω_f with the Manin constant c_E; the statement says c_E is a p-adic unit under these hypotheses, consistent with the known results for p odd.

([The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.7, p. 34; [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, proof of Proposition 5.1.7, pp. 34–35.)

*Needs:* [9.1 Cotangent saturation for good-reduction optimal quotients](#91-cotangent-saturation-for-good-reduction-optimal-quotients), [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw), EffectiveDiophantineMethods §4.2, [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), HilbertModularVarietiesAndShimuraCurves R18.1.3, HilbertModularVarietiesAndShimuraCurves Layer R18.2, [9.10 Compatibility with isogenies, differentials and characters](#910-compatibility-with-isogenies-differentials-and-characters), NeronModelsAndSemistableAbelianVarieties §6.4d, SemistableQuotientCotangent, HilbertModularVarietiesAndShimuraCurves R18.2.6, HilbertModularVarietiesAndShimuraCurves R18.2.10.

### 9.19 The formal logarithm detects non-torsion Heegner points

Fix A, an abelian variety over K with good reduction at v | p, K_v = ℚ_p, and ω a nonzero invariant differential. (a) For an elliptic curve E (dim 1), log_ω(P) ≠ 0 if and only if P ∈ E(K) has infinite order: log_E : E(K_v) → K_v has kernel the torsion subgroup and E(K) ⊂ E(K_v). (b) For A of strict GL(2)-type with M = End⁰(A) a field of degree dim A having a real embedding and ω an M-eigendifferential, the same equivalence holds for actual points by [9.13 Heegner points have nonzero logarithm in every eigencomponent](#913-heegner-points-have-nonzero-logarithm-in-every-eigencomponent); it is not a consequence of freeness of A(K) ⊗ ℚ_p over M ⊗ ℚ_p, since log_A(P) ≠ 0 only says that some eigencomponent is nonzero. Consequently, under the hypotheses of [9.17 The BDP p-adic Gross–Zagier formula in weight two](#917-the-bdp-p-adic-grosszagier-formula-in-weight-two) (resp. [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw)), P_K(f) ≠ 0 if and only if L_p(f, 1) ≠ 0. A nonzero Selmer class whose localisation at v vanishes has Bloch–Kato logarithm zero; the equivalence is for the Kummer classes of global points only.

Assume Lie(A) is free of rank one over M ⊗ K_v (strict GL(2)-type), so A(K_v) ⊗ ℚ is free of rank one over M ⊗ ℚ_p. E_p(f) ≠ 0 ([9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point)) and 1 − a_(ℓ₀) + ℓ₀ ≠ 0 are needed to pass from the logarithm to L_p(f, 1). Part (b) needs the real-embedding hypothesis of BSW Theorem 1.1 and an actual algebraic point. Strict GL(2)-type alone does not include this hypothesis.

*Outline.* The logarithm of the commutative p-adic Lie group A(K_v) is a homomorphism with kernel the torsion subgroup and is an isomorphism A(K_v) ⊗ ℚ → Lie(A/K_v) (EffectiveDiophantineMethods §4.2 (the p-adic abelian logarithm)); A(K) ⊂ A(K_v). dim 1: Lie(E/K_v) is one-dimensional and ω ≠ 0 identifies it with K_v, so log_ω(P) = 0 iff log_E(P) = 0 iff P is torsion. GL(2)-type: use [9.13 Heegner points have nonzero logarithm in every eigencomponent](#913-heegner-points-have-nonzero-logarithm-in-every-eigencomponent) for the λ-eigencomponent singled out by ι_p. Insert into the weight-two formulas: L_p(f, 1) is a nonzero multiple of log_ω(P_K(f))² ([9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point)).

*Consequences.* Skinner Corollary 2.6.2: P_K(f) ≠ 0 iff L^S_𝔭(f, 1) ≠ 0, with the eigencomponent input of [9.13 Heegner points have nonzero logarithm in every eigencomponent](#913-heegner-points-have-nonzero-logarithm-in-every-eigencomponent). Non-example: for M = ℚ(√5) and a point P with log_A(P) ≠ 0, the projection of log_A(P) to one λ-eigenline can a priori vanish; excluding this needs transcendence, not linear algebra.

([A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Corollary 2.6.2, p. 14; [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, after Proposition 2.6.1, p. 14.)

*Needs:* [9.17 The BDP p-adic Gross–Zagier formula in weight two](#917-the-bdp-p-adic-grosszagier-formula-in-weight-two), [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw), [9.7 The Euler factor at the BDP point](#97-the-euler-factor-at-the-bdp-point), EffectiveDiophantineMethods §4.2, Mathlib `FormalGroup`, [9.13 Heegner points have nonzero logarithm in every eigencomponent](#913-heegner-points-have-nonzero-logarithm-in-every-eigencomponent).

### 9.20 Bloch–Kato logarithm of the Heegner Kummer class

Fix A/K, an abelian variety with good reduction at v | p, V = V_p A, and the point Kummer map κ_v : (lim_n A(K_v)/p^n A(K_v)) ⊗_ℤ_p ℚ_p → H¹(K_v, V) of PadicHodgeRegulators §1.9. For P∈A(K), write loc_v κ(P)=κ_v(P⊗1), where κ is the ordinary global cohomology boundary with values in H¹(K,V); no global Selmer condition is inferred from good reduction at this one place. PadicHodgeRegulators §1.9 gives that κ_v(P⊗1) lies in H¹_f(K_v, V) = H¹_e(K_v, V) (D_cris(V)^(φ=1) = 0 by purity) and that under D_dR(V)/Fil⁰ D_dR(V) ≅ Lie(A/K_v) the Bloch–Kato logarithm of loc_v κ(P) is the formal logarithm log_A(P); SelmerIwasawaCohomology §4.26 gives the elliptic case; both are used as they stand. The owned content is the Heegner and differential specialization: prove that for an invariant differential ω ∈ H⁰(A, Ω¹) ⊗ K_v, viewed in Fil⁰ D_dR(V^*(1)), the dual of D_dR(V)/Fil⁰ ≅ Lie(A/K_v), ⟨log_BK loc_v κ(P_K(f)), ω⟩ = log_ω(P_K(f)) for ω ∈ H⁰(A_f, Ω¹) ⊗ M_f with φ^*ω = ω_f, and the BDP-point formulas may be written L_p(f, 1) = E_p(f)² ⟨log_BK loc_v κ(P_K(f)), ω⟩² with the exact differential normalisation of the formula used.

Assume good reduction at v. Write q=p^f for the residue cardinality of K_v. On D_cris(V_p A), φ is semilinear and φ^f is linear over the maximal unramified subfield; its eigenvalues have complex absolute value q^(−1/2), equivalently they are α/q with |α|=√q. Hence φ has no fixed vector and H¹_e=H¹_f. Only for residue degree f=1 does this become the α/p formula. The identification D_dR(V_p A)/Fil⁰ ≅ Lie(A) ⊗ K_v and the pairing with differentials use the de Rham comparison (PadicHodgeRegulators §§0.1 and 1.1–1.3); the sign convention of log_BK as the inverse of exp_BK is the one fixed there. V_f is the λ-summand of V_p(A_f), not its cohomological dual; the geometric L-function in JSW is that of V_f^∨⊗ψ. Identify D_dR(V_f)/Fil⁰ with Lie(A_f)_λ and its dual differential pairing with Fil⁰D_dR(V_f^*(1)) by the supplied comparison conventions. Purity for the Tate module has weight −1, so Frobenius eigenvalues cannot equal 1; dual H¹ has weight +1.

*Outline.* Import SelmerIwasawaCohomology §4.26 for elliptic point classes and PadicHodgeRegulators §1.9 for general abelian point classes with good reduction: log_BK ∘ κ_v = log_A on A(K_v) ⊗ ℚ_p. Restrict along A(K)→A(K_v); no Heegner-specific Kummer or Euler-system construction is required. Pair with ω ∈ Fil⁰ D_dR(V^*(1)) (for A = A_f, the differential with φ^*ω = ω_f) through the de Rham pairing, as Castella–Hsieh §4.5 do for generalized Heegner classes.

*Consequences.* A global Selmer class with trivial localisation at v has log_BK = 0 although it may be nonzero: logarithms detect points, not Selmer classes ([9.19 The formal logarithm detects non-torsion Heegner points](#919-the-formal-logarithm-detects-non-torsion-heegner-points)). Compatibility with the weight-two divisor comparison of §9.8: the étale Abel–Jacobi class of ε_f(P − ∞) maps to κ(P) under the modular quotient, so the same logarithm appears.

**Checks.**

- A torsion point has zero Kummer class after rationalization and zero logarithm.
- Over an unramified quadratic extension, φ² has eigenvalues of absolute value p^(−1); treating φ as a linear operator with the same eigenvalues is invalid.
- Replacing V_p A by its cohomological dual changes the weight and the de Rham quotient; the point exponential uses the Tate module.

([Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §4.5, p. 19; [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §4.5, Theorem 4.9, p. 20.)

*Needs:* [9.19 The formal logarithm detects non-torsion Heegner points](#919-the-formal-logarithm-detects-non-torsion-heegner-points), PadicHodgeRegulators §1.9, SelmerIwasawaCohomology §4.26, EffectiveDiophantineMethods §4.2, [9.17 The BDP p-adic Gross–Zagier formula in weight two](#917-the-bdp-p-adic-grosszagier-formula-in-weight-two).

### 9.21 The BDP function lies in the Iwasawa algebra

Under (sqf), (sgn), (ram), (flt), (odd) and (L-lrg) of Skinner §2 (Case I: every prime of N split or ramified in K; Case II: N = N⁺N⁻ as in [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw)), let O^ur be the ring of integers of the completion of the maximal unramified extension of L. The imprimitive function L^S_𝔭(f), defined by BDP (Case I) and Brooks (Case II) only as a continuous function on the characters of Γ, is the evaluation map of an element of O^ur⟦Γ⟧. Its coefficients lie in O^ur; they are not known to lie in O, because the p-adic CM period Ω_p is a unit of O^ur that need not lie in L.

Use interpolation at characters ramified above p from Castella–Hsieh Proposition 3.8 in the GL₂ case and the integral CM moments in the quaternionic case; Skinner's preprint writes O⟦Γ⟧; the published version corrects this to O^ur⟦Γ⟧.

*Outline.* Case I with N⁻ = 1: by [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square) L_p(f) is a unit times the square of the image of the ordinary CM root distribution of §9.4, which is a measure: Castella–Hsieh Proposition 3.8 covers m≥0 and characters of conductor p^n. This needs [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square) in the form allowing squarefree ramified level ((Heeg′) and (ST) for a ψ₀ of p-power conductor); its comparison unit is supplied by the normalized-root target. Case II: Burungale §5.2 Lemma 5.5 constructs bounded local CM measures as Amice transforms of integral Serre–Tate expansions. The shape of equation (5.8), summed over all of Cl(O_K) as in 9.11, forms their finite translated sum. Twist and push forward this linear measure, then square by convolution. Brooks Proposition 8.10 supplies a continuity statement, not a proof of boundedness. The CM-coordinate and Waldspurger targets identify this root with Brooks’s normalized finite sum; the primitive differential lattice makes the values integral before squaring. Remove the Euler factors at S ∖ {p} by multiplying by the elements P_w(ε^(-1)Ψ^(-1)(Frob_w)) of O⟦Γ⟧.

*Consequences.* Without the extension to characters ramified at p a continuous function on the crystalline characters is not known to be a measure, and the Iwasawa main conjecture of Skinner §2.7 could not be formulated. Coefficient ring test: Ω_p ∉ L in general, so a statement with coefficients in O⟦Γ⟧ is not justified (Skinner's published text corrects the preprint's O⟦Γ⟧).

([A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Published §2.6, pp. 342–343; [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Proposition 3.8, p. 13; [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1), §5.2, Lemma 5.5 and (5.8), pp.27–29.)

*Needs:* [9.4 Integral ordinary CM moments on modular and Shimura curves](#94-integral-ordinary-cm-moments-on-modular-and-shimura-curves), [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two), [9.14 Normalization of the toric root and its square](#914-normalization-of-the-toric-root-and-its-square), [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function), the ordinary CM root-distribution target of §9.4, TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1, Mathlib `AbstractMeasure.amiceTransform`, Mathlib `AbstractMeasure.injective_amiceTransform`, [9.3 CM coefficient rings, Amice series and interpolation uniqueness](#93-cm-coefficient-rings-amice-series-and-interpolation-uniqueness).

### 9.22 Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions

For ψ crystalline of weight (−n, n), n > 0, n ≡ 0 mod (p − 1), let χ be the Hecke character with χ^(-1) = ψ^alg |Nm(·)|_ℚ. Prove that L^S_𝔭(f) is the imprimitive variant, with the Euler factors at the primes of S = {ℓ | pND} not dividing p removed, of BDP's L_p(f, χ) in Case I and of Brooks's L_p(f, χ) in Case II; the corresponding characters χ, of BDP/Brooks infinity type (2 + j, −j) with j = n − 1, form a subfamily of Σ^((2))_cc(𝔫) and Σ^((2))_cc(𝔫⁺) respectively; the interpolated values L(f, χ^(-1), 0) equal L(f, ψ^alg, 1); and the constants correspond by C(f, K) = α(f, f_B)^(-1) and w(f, ψ) = w_K w(f, χ)^(-1). Skinner's further identity e_∞(f, ψ) w_K (2πi)^(1+2n) = C(f, χ, 1) is false as printed (its left side is purely imaginary): the archimedean constants match only together with Skinner's Ω(ψ^alg) and a relation between his CM periods and BDP's, which is part of the normalization comparison (the period comparison). In JSW's normalisation the corresponding function, equal to it up to the explicit Λ_R-unit of the normalization comparison, is L^Σ_p(f) = L_p(f) ∏_(w ∈ Σ) P_w(ε^(-1)Ψ^(-1)(Frob_w)), with JSW's (5.1.a) related to BDP and Brooks by the same substitution χ^(-1) = ψ^alg|·|_(𝔸_K).

Assume Same hypotheses as [9.21 The BDP function lies in the Iwasawa algebra](#921-the-bdp-function-lies-in-the-iwasawa-algebra). Skinner's e_p(f, ψ) = E_𝔭̄/E_𝔭 is a ratio of Euler-type factors. Because p ∈ S, his L^S also omits the Euler factors at 𝔭 and 𝔭̄, which contribute E_𝔭E_𝔭̄; so e_p·L^S = E_𝔭̄²·L^(S∖{p}), BDP's and JSW's squared multiplier times the L-value with only the Euler factors away from p removed.

*Outline.* Match the interpolation formulas character by character: Skinner's §2.6 formula, BDP (5.2.3) with Theorem 5.5's L^alg, Brooks §8.4 with Proposition 8.7's L^alg and JSW (5.1.a). Uniqueness of a measure with prescribed values on a dense set of characters ([9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two)) turns the agreement of values into an identity in O^ur⟦Γ⟧.

*Consequences.* At ψ = 1 the dictionary gives Skinner's Proposition 2.6.1 from BDP's and Brooks's formulas ([9.17 The BDP p-adic Gross–Zagier formula in weight two](#917-the-bdp-p-adic-grosszagier-formula-in-weight-two), [9.16 The quaternionic weight-two formula of Brooks and JSW](#916-the-quaternionic-weight-two-formula-of-brooks-and-jsw)). Removing the Euler factor at an inert w = (ℓ) multiplies by the constant of [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two). That constant is (1 − a_ℓ ℓ^(-1) + ℓ^(-1))(1 + a_ℓ ℓ^(-1) + ℓ^(-1)) when ℓ ∤ N, and 1 − ℓ^(-2) when ℓ | N⁻. An inert prime divides neither p (split) nor D, so the inert primes of S = {ℓ | pND} are exactly the primes of N⁻. Case I has none. In Case II only the second branch occurs, f being Steinberg at ℓ. Each branch can raise μ (JSW Remark 5.1.4 states only the first, jsw line 1352).

([A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Published §2.6, pp. 342–343.)

*Needs:* [9.15 The BDP anticyclotomic p-adic L-function in weight two](#915-the-bdp-anticyclotomic-p-adic-l-function-in-weight-two), [9.11 Brooks's quaternionic p-adic L-function](#911-brookss-quaternionic-p-adic-l-function), [9.6 The ratio α(f, f_B) of Petersson norms](#96-the-ratio-αf-f_b-of-petersson-norms), [9.21 The BDP function lies in the Iwasawa algebra](#921-the-bdp-function-lies-in-the-iwasawa-algebra), the coefficient and measure interfaces of §9.3.

### Examples

At p=5, a_p=1 gives (1+p−a_p)/p=1; a_p=−4 gives 2, and the squared Euler multiplier is 4. Scaling a differential by b multiplies its logarithm by b and its squared logarithm by b². The trivial character belongs to the c=1 branch; a nontrivial Pic(O_c) character must first be transported through the specified tame branch.

### Dependencies

Earlier layers 0a, 0, 3, 4, 5, 7, 8. The direct external interfaces used above are Mathlib `AbstractMeasure.amiceTransform`, Mathlib `AbstractMeasure.injective_amiceTransform`, Mathlib `ContinuousMonoidHom`, Mathlib `CuspForm`, Mathlib `FormalGroup`, Mathlib `IsTopologicallyNilpotent`, Mathlib `Module.Dual`, Mathlib `PowerSeries.eval₂`, Mathlib `PowerSeries`, Tau Ceti `UpperHalfPlane.peterssonInner`, TauCetiRoadmap.DiophantineApproximationAndTranscendence Layer 0 and §2.8, TauCetiRoadmap.EllipticCurves Layer 3, TauCetiRoadmap.NewtonPolygons §§6.3–6.4, TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 1 (in particular §1.6 characterIntegralAlgHom) and §§2.1, 2.5, AbelianSchemesAndArithmeticModuli A1.3, AbelianSchemesAndArithmeticModuli Layer A6, `AbelianSchemesAndArithmeticModuliPartII:§§P4.1–P4.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, the coefficient and measure interfaces of §9.3, the CM-period comparison of §9.4, the ordinary CM root-distribution target of §9.4, `ColemanIntegration:L1`, EffectiveDiophantineMethods §4.3, EffectiveDiophantineMethods §4.2, EffectiveDiophantineMethods §4.6, EllipticCurveModularity Layer R29.5, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, the weight-two divisor/AJ target of §9.8, the BDP special-value target of §9.17, [0a.2 The Heegner cyclic-isogeny pair](#0a2-the-heegner-cyclic-isogeny-pair-at-every-quadratic-discriminant), [0a.4 Quaternionic CM points](#0a4-quaternionic-cm-points-levels-and-canonical-model-descent), [3.3 Rational ξ-normalized realization](#33-rational-ξ-normalized-realization), [3.2 Normalized Hodge class](#32-normalized-hodge-class), [0a.3 Optimal embeddings](#0a3-optimal-embeddings-and-the-cyclic-level-dictionary), [3.5 Manin constant](#35-manin-constant), [3.9 Petersson and modular-degree comparison](#39-petersson-and-modular-degree-comparison), PadicHodgeRegulators §1.9 and §§0.1, 1.1–1.3, HilbertModularVarietiesAndShimuraCurves R18.1.3, HilbertModularVarietiesAndShimuraCurves R18.2.6, HilbertModularVarietiesAndShimuraCurves R18.2.10, HilbertModularVarietiesAndShimuraCurves Layer R18.2, ModularCurvesPartII §§5.1–5.4, 11.2–11.5 and 12.1, `NeronModelsAndSemistableAbelianVarieties:R11.1`, NeronModelsAndSemistableAbelianVarieties §6.4d (SemistableQuotientCotangent). The exact division of general imports and owned comparisons is given in Exact supplier contracts.
## Source and interface limits

The geometric constructions require actual arithmetic models, metrized lines, admissible pairings and automorphic representations. The named local constructions, primitive lattices and projectors above are prerequisites of the global formulas. Generic reduction, rational transfer and a formal eigencondition do not replace them.

The 2013 Yuan–Zhang–Zhang book locators identify the published proof inputs. Cai–Shu–Tian, Zhang's survey, Yuan–Zhang's Colmez paper, Yuan's modular-heights paper, Disegni's p-adic Gross–Zagier paper and the 2026 author erratum give accessible statements and many local calculations; the 2011 author draft has different numbering. The book numbering used in Layers 7 and 8 (Assumptions 5.2–5.6, Proposition 5.8, Lemma 5.10, Theorems 3.17, 3.22, 5.7 and 7.8, Proposition 8.8, §§7.2.2 and 7.4.3) is confirmed by Disegni's and Yuan–Zhang's citations, which restate the statements. 1.1 is sourced from Conrad's public notes. 7.4 states the exact data (D). 7.5, 7.25 and the multiplicity-one reduction in 8.1 are proved from public sources. The final pseudo-theta step of 7.47 uses Yuan–Zhang’s comparison lemma; its four general-level prerequisites retain their own book locators. In particular, two inputs identified by public restatements require the book proof: the existence of data (D) with nonzero local toric contractions at the places of S₁ (Proposition 5.8; 7.4, item 3; the S² part is public, Yuan–Zhang p. 591) and the deep-level local nonsingularity (Theorem 7.8(4); 7.47, item 1, steps (c) and (d)). A formalization of those two steps needs the book. The split (3,1) Shimizu comparison is a separate owned target. The principal-level integral models, CM sections and Čerednik–Drinfeld charts required by §7.47 are constructed in 7.46a from the maximal-level models and the all-level rigid tower. PadicHodgeRegulators §1.9 supplies the good-reduction point Kummer comparison; §9.5 proves the abelian exponential comparison at arbitrary reduction.

The CM Waldspurger constants include the ramified dyadic evaluations of §9.9. The BDP specialization of §9.17 retains the odd-discriminant hypotheses of that source. Prasanna's ratio-integrality range also requires squarefree level and the displayed exclusions on p. The Manin p-unit theorem retains its optimality and reduction hypotheses. The Amice inverse (PadicMeasuresIwasawaAlgebras §2.5), the uniformizer-power preparation (NewtonPolygons §6.3) and the interpolation uniqueness of 9.3 all allow infinite residue fields.

The p-adic analytic subgroup theorem of 9.2 is the commutative-algebraic-group transcendence input to the abelian algebraic-point form. Arbitrary-character Hermitian positivity is not asserted: it requires a dual-conjugate comparison beyond a bilinear character pairing. Eigenlogarithm nonvanishing concerns actual algebraic points under the real-embedding hypotheses of its subgroup argument. The multiplicative-prime target uses a semistable integration adapter, and its Euler factor is distinct from the Hida-family exceptional-zero factor.

## Downstream consumers

HeegnerPointEulerSystems consumes the Layer 0a cyclic pairs, ring-class tower and quaternionic comparisons (§§0a.2–0a.4), the Artin-map convention of 0.5, the Layer 3 Hodge classes, realizations and Manin constants, the local toric functionals of Layer 4, the central-value identities of Layer 5, the Yuan–Zhang–Zhang formula 8.11 and §§9.10, 9.14, 9.20 and 9.22. Its Euler-system norm relations, derived cohomology classes and descent follow these targets. The integral family logarithm and explicit reciprocity law on the Iwasawa cohomology of the anticyclotomic Heegner family, which HeegnerPointEulerSystems also uses, is a Perrin-Riou regulator statement and not a target here; its regulator inputs are PadicHodgeRegulators §§8.17–8.22. ModularIwasawaMainConjectures uses the Manin-constant targets §§3.5, 3.7 and 3.10, with their isogeny transfer, together with §§0.4 and 3.1. The comparison it also uses between the parabolic lattice of an X₀(N)-optimal quotient and the full cusp-divisor modular-symbol lattice of ModularSymbolsPadicLFunctions §§0.4 and 1.1, with the ratios r_E^± and their behaviour under X₁(N) → X₀(N), is a modular-symbol period comparison and not a target here. Sections 9.8 and 9.17 own the weight-two divisor Abel–Jacobi comparison and the BDP special-value identity; no higher-dimensional generalized-cycle construction is needed for these degree-zero divisors. No target here has a prerequisite in these later roadmaps.

## References

Locators of the form `<id> line N` refer to the line-numbered text of the work listed below under the key `<id>`, as recorded under that key in this roadmap's sources.toml.

- Key muller-stoll: [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), J. Steffen Müller and Michael Stoll; arXiv:1509.08748v2 (22 Dec 2015); published in LMS J. Comput. Math. 19 (2016).
- Key lmfdb: [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), The LMFDB Collaboration; Curve 37.a1, Mordell–Weil generators and BSD invariants, accessed 10 October 2026.
- Key gross84: [Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf), Benedict H. Gross; in *Modular Forms*, Ellis Horwood (1984), pp.87–105; §§I.1–I.5, pp.87–90 supply the proper-ideal cyclic pairs and Artin convention.
- Key conrad: [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Brian Conrad (with an appendix by W. R. Mann); Heegner Points and Rankin L-Series, MSRI Publications 49 (2004) 67–163; SLMath library PDF, printed page = PDF page + 65 (an author final copy is on the author's Stanford page).
- Key cst: [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), Li Cai, Jie Shu and Ye Tian; arXiv:1408.1733v2 (18 Nov 2014); published in Algebra & Number Theory 8 (2014) 2523–2572.
- Key gz86: [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Benedict H. Gross and Don B. Zagier; Inventiones mathematicae 84 (1986), 225–320; Zagier author scan with text layer.
- Key zhang-survey: [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), Shou-Wu Zhang; Science China Mathematics 53 (2010), no. 3, 573–592, doi:10.1007/s11425-010-0046-2; author's PDF.
- Key yzz-erratum-pku: [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), X. Yuan, S.-W. Zhang and W. Zhang; 28 June 2026 (the same erratum is posted on the first author's Berkeley page).
- Key jetchev: [Global divisibility of Heegner points and Tamagawa numbers](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf), D. Jetchev; Compositio Math. 144 (2008).
- Key cns: [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), K. Česnavičius, M. Neururer and A. Saha; arXiv:1911.09446, 3 November 2022.
- Key dit: [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), W. Duke, Ö. İmamoğlu and Á. Tóth; Ann. Math. 184 (2016), 949–990.
- Key yuan-zhang: [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), X. Yuan and S. Zhang; Ann. Math. 187 (2018), 533–638.
- Key gqt: [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3), W. T. Gan, Y. Qiu and S. Takeda; arXiv:1207.4709v3.
- Key yuan-bigness-pku: [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), X. Yuan; author manuscript 21 August 2024; Ann. Math. 203 (2026), 15–119 (the author manuscript supplies the locators here).
- Key yzz-draft: [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), Xinyi Yuan; Shou-Wu Zhang; Wei Zhang; Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book.
- Key saito: [On Tunnell’s formula for characters of GL(2)](https://www.numdam.org/article/CM_1993__85_1_99_0.pdf), Hiroshi Saito; Compositio Mathematica 85 (1993), 99–108, Numdam published scan.
- Key waldspurger: [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf), Jean-Loup Waldspurger; Compositio Mathematica 54 (1985), 173–242, Numdam published scan.
- Key edixhoven: [Edixhoven, Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/item/10.5802/aif.1202.pdf), Bas Edixhoven; Ann. Inst. Fourier40 (1990), pp.31–67.
- Key yzz-book: [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Xinyi Yuan, Shou-Wu Zhang and Wei Zhang; Annals of Mathematics Studies 184, Princeton University Press, 2013. Book locators (chapter, theorem and printed page) refer to this edition; many of its statements used here have public counterparts in Cai–Shu–Tian §§1–2, Zhang (2010) §4, Yuan–Zhang (2018) §§7–9 and Disegni (2017) §§5–8. The 2011 author draft has different numbering.
- Key skinner-published: [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Christopher Skinner; Annals of Mathematics 191 (2020), 329–354, especially §2.6, pp. 342–343. The [arXiv v1 preprint](https://arxiv.org/abs/1405.7294v1), dated 28 May 2014, has its §2.6 on pp. 13–14 and a different coefficient ring.
- Key jsw: [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Dimitar Jetchev, Christopher Skinner and Xin Wan; arXiv:1512.06894v1 (21 Dec 2015), published in Cambridge Journal of Mathematics 5 (2017) 369–434.
- Key brooks: [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), Ernest Hunter Brooks; International Mathematics Research Notices 2015, no. 12, 4177–4241, doi:10.1093/imrn/rnu062 (published version, EPFL Infoscience copy).
- Key bdp: [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), Massimo Bertolini, Henri Darmon and Kartik Prasanna (appendix by Brian Conrad); Duke Mathematical Journal 162 (2013), no. 6, 1033–1148, doi:10.1215/00127094-2142056 (published version, from Darmon's publication page).
- Key castella-hsieh: [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), Francesc Castella and Ming-Lun Hsieh; arXiv:1505.08165v2 (7 Jan 2017); published in Mathematische Annalen 370 (2018) 567–628.
- Key castella-exceptional: [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), Francesc Castella; arXiv:1507.04260v1 (15 Jul 2015; manuscript dated 19 Sep 2018); published in Journal of the Institute of Mathematics of Jussieu.
- Key castella-multiplicative: [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2), Francesc Castella; arXiv:1704.06608v2 (14 Jun 2017); published in Cambridge Journal of Mathematics 6 (2018).
- Key bsw: [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), Ashay Burungale, Christopher Skinner and Xin Wan; arXiv:2603.20886v2 (10 May 2026).
- Key burungale: [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1), Ashay A. Burungale; arXiv:1504.02342v1, 9 April 2015.
- Key yuan-modular: [Modular heights of quaternionic Shimura curves](https://arxiv.org/abs/2205.13995), Xinyi Yuan; arXiv:2205.13995v3, 26 May 2024; manuscript dated 28 May 2024.
- Key disegni: [The p-adic Gross–Zagier formula on Shimura curves](https://arxiv.org/abs/1510.02114v3), Daniel Disegni; arXiv:1510.02114v3 (30 July 2019), identical to the published version in Compositio Mathematica 153 (2017) apart from footnotes; §6.1 restates the Yuan–Zhang–Zhang assumptions on the Schwartz function.
- Key argos: [ARGOS seminar on intersections of modular correspondences](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/argos.pdf), Bonn seminar notes: Chapters 8 (Wewers), 9 (Meusers), 11 (Vollaard), printed pp. 75–120.
- Key prasanna: [Integrality of a ratio of Petersson norms and level-lowering congruences](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p04.pdf), Kartik Prasanna; Annals of Mathematics 163 (2006), 901–967.
- Key blr: Bosch, Lütkebohmert and Raynaud, *Néron Models*, Springer (1990), §7.5 Theorem 4, pp. 186–188.
- Key conrad-trace: [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), Brian Conrad; L'Enseignement Mathématique 52 (2006), 37–108; author's copy.
- S. Bloch and K. Kato, *L-functions and Tamagawa numbers of motives*, The Grothendieck Festschrift, Vol. I, Progress in Mathematics 86, Birkhäuser (1990), 333–400; Example 3.10.1.
- T. Matev, *The p-adic analytic subgroup theorem and applications*, preprint (2010).
- Key fuchs-pham: [The p-adic analytic subgroup theorem revisited](https://arxiv.org/abs/1502.00768v1), Clemens Fuchs and Duc Hiep Pham; arXiv:1502.00768v1 (3 Feb 2015); published in p-Adic Numbers, Ultrametric Analysis and Applications 7 (2015), 143–156.
