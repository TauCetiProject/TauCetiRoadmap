# Roadmap: rank-one converses and anticyclotomic localization

**Summary.** Build Skinner’s p-converse from a rational Bloch–Kato Selmer line with injective localization. Ordinary anticyclotomic reverse divisibility and augmentation control force a nonzero p-adic L-value; the supplied logarithm and complex height formulas give a non-torsion Heegner point and a simple complex zero. This proves the quadratic-field Theorem B. Locally prescribed quadratic twists then give the rational rank-one converses A and A′, the finite-Selmer criterion C, and the rank-zero converse E (skinner-2020, Theorems A–C, pp.330–332; Theorem E, pp.351–352).

## Scope and ownership

This is the converse continuation of the forward rank-zero/rank-one theory: the base theory goes from a nonzero complex value or derivative to arithmetic rank and finite Sha; this roadmap starts from arithmetic or Selmer information and proves the analytic conclusion. It owns residual restriction for the chosen quadratic field, componentwise arithmetic localization, the two-dimensional semilocal-image argument, the arithmetic specialization of the one-sided anticyclotomic Selmer module, reverse divisibility and its augmentation obstruction, locally prescribed quadratic nonvanishing, and the five converse theorems. General constructions keep a single earlier owner.

The following are stated by their named suppliers and are consumed as contracts, rather than rebuilt as targets here:

- TauCetiRoadmap.EllipticCurves Layers 1–2, 3–5 and 7: elliptic formal groups, Tate modules, local reduction, quadratic twisting, discrete Selmer structures and finite Kummer/Sha theory.
- TauCetiRoadmap.SelmerIwasawaCohomology §§2.1–2.12a, 2.19–2.20, 3.0, 3.8–3.16, 4.9, 4.26, 4.28–4.29: canonical cohomological kernels, Kummer and Sha carriers, Iwasawa-algebra coordinates and involution, duality, control and quadratic decomposition. The coefficientwise and unconditional sign extensions are the explicit contracts below; family-parity constancy alone does not supply a root-number theorem.
- TauCetiRoadmap.GrossZagierAndArithmeticHeights §§0a.3–0a.4, 3.2–3.4, 8.13, 8.17 and 9.6–9.22: the two Heegner geometries, normalized trace eigenpoint and rational Hodge representative, rational transfer/differential comparisons, height criterion, integral imprimitive analytic dictionary and squared-logarithm criterion. In particular the ramified modular Case I formula is in §9.17. This roadmap defines no second Heegner point, height formula, p-adic measure or eigenlogarithm theorem.
- TauCetiRoadmap.HeegnerPointEulerSystems §§1.4–1.6 and 7.11–7.12: integral CM/Jacobian classes, quotient functoriality, all-prime descent and full-Sha finiteness; the precise GL₂-type realization extension is a contract below.
- TauCetiRoadmap.AutomorphicGaloisRepresentations §§1.4–1.5, 4.1, 6.1–6.4 and 7.5–7.7: projectors, attached representations, local compatibility, large residual image and the ordinary-prime choice. TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3.1, R17.3.8 and R17.4 supplies local parameters, rational Jacquet–Langlands and base change.
- TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layers 1–2, §§4.1–4.6, 5.1–5.2 and 6.5: measures, completed group rings, characteristic divisors, determinants and topological Nakayama; the involution ι:γ↦γ⁻¹ used in §2.1 is SelmerIwasawaCohomology §3.0. Generic Fitting ideals and their base change are already in the pinned Tau Ceti library.
- TauCetiRoadmap.AutomorphicCongruences §2.22: Wan's ordinary two-variable Rankin–Selberg divisibility.
- TauCetiRoadmap.EllipticCurveModularityPartII §6.0e: finiteness of A_g(ℚ) for every weight-two trivial-character newform g with L(g,1)≠0.
- TauCetiRoadmap.MetaplecticAutomorphicForms §§8.85–8.87: the genus-two coefficient, kernel and ramified local-test inputs. The final twist-residue, positivity, noncancellation, infinitude and local-prescription deductions, which MetaplecticAutomorphicForms §8.85 and its list of downstream consumers leave to a consumer it calls RankZeroOneBSD, are owned by §4.1 here: no roadmap of that name states them, and §4.1 is their single owner.

TauCetiRoadmap.ArithmeticStatisticsPartVI owns the elliptic instances with (D,N)=1 and an inert residually ramified prime: “Anticyclotomic main-conjecture implication” (reverse divisibility and the augmentation obstruction), “Heegner logarithm and low rank” (the squared-logarithm and height deductions over K, and elliptic low-rank forward implications), and §4.22 “Rank one selmer criterion” and “Twisted rank one selmer criterion” (Theorem C for squarefree conductor with at least two odd prime factors, and its fixed-field twisted form). Its “Positive simultaneous rank one” uses those targets and does not consume this roadmap. Sections 2.2–2.4 and 3.1 here prove the general statements: arbitrary GL₂-type coefficient fields and ramified Case I on the canonical supplier carriers; §5.3 adds the single odd nonsplit multiplicative alternative and full Sha finiteness.

TauCetiRoadmap.ModularIwasawaMainConjectures §5.4, “The rank-zero p-converse”, owns the main-conjecture rank-zero converses: Skinner–Urban, Fouquet–Wan, and for E/ℚ of arbitrary conductor the implication from rank 0 and finite Sha[p∞] at a good ordinary p>3 with E[p] irreducible to L(E,1)≠0. Theorem E of §6.2 differs in route and scope: it is deduced from Theorem B through a derivative twist, holds for GL₂-type coefficient degree d under the squarefree local alternatives, and concludes nonvanishing of the conjugate product L(A_f,s); for d=1 it is a special case of §5.4(3). Broader CM, Eisenstein and supersingular converses retain their own mathematical scopes; none changes the hypotheses of A–E here. Native vector-space kernels, continuous cohomology, abelian varieties, newforms with their Fricke signs and analytic ranks, analytic newform L-functions, fundamental discriminants with their quadratic characters, the quadratic-twist Weierstrass model, the formal Weierstrass L-series with local reduction types, and the explicit two-descent subgroup are already in the library. The pinned formal Weierstrass L-series has no analytic continuation. The explicit two-descent subgroup is not an odd-p Bloch–Kato Selmer group.

## Conventions

Let f be a normalized cuspidal weight-two newform, of positive squarefree level N and trivial nebentypus. Its totally real Hecke field is M, A=A_f is its rational modular abelian isogeny class with its M-action, and d=[M:ℚ]=dim A≥1. The complex functions are actual analytically continued finite Euler products. Their motivic centre is 1; the corresponding unitary automorphic centre is 1/2. Conjugate-product and base-change identities include ramified primes. An analytic order is finite because these functions are holomorphic and not identically zero near the centre (skinner-2020 §§1–2.1, pp.329–335).

Fix p≥5, a coefficient prime λ|p, a finite extension L/M_λ with integers O, and a stable O-lattice T in the geometric Tate realization V=V_p(A)⊗_(M⊗ℚ_p)L. Thus dim_L V=2, V*≅V(−1), and its Hodge–Tate weights are 0,−1. The cyclotomic character has weight −1. Good ordinary means p∤N and a_p is a λ-adic unit. Residual representations are the semisimplified reductions of stable lattices; the nonzero unipotent inertia at a squarefree bad prime is established on the actual local reduction. Local geometric Euler factors use geometric Frobenius; L(V*,s)=L(f,s), so the Euler polynomial belongs to the dual of the geometric Tate representation. The ordinary and local-Langlands suppliers transport their Frobenius conventions through this comparison. All coefficient extensions preserve the chosen embeddings and actions (skinner-2020 §2.1, pp.334–336).

For the quadratic-field layers K/ℚ is imaginary quadratic of fundamental discriminant D<0, D odd, with 2 split and p=𝔭𝔭̄ split. Fix the embeddings selecting these primes and the compatible coefficient embedding. Conjugation exchanges the two local spaces. Let S be a finite set of places of ℚ containing ∞ and every prime dividing pND; G_(K,S) is the Galois group of the maximal extension of K unramified outside the places over S, a set stable under complex conjugation. All restricted-ramification cohomology, finite-generation and control statements use this finite S, and the imprimitive analytic function removes the Euler factors at the same finite set (skinner-2020 §2.3, p.338; §2.7, p.344). The set of all places is excluded: relaxing the local condition at infinitely many primes makes the residual Selmer dimension unbounded, and no finitely generated Λ-dual has that property. Continuous cohomology retains the compact, discrete or rational topology appropriate to its coefficients. Work in a fixed universe containing the number fields, their separable closures, local fields and coefficient modules; no cardinal bound is imposed on these canonical constructions. Rings are nonzero unital coefficient domains; a zero ring cannot be a coefficient field or DVR here.

H¹_f at p is the crystalline-period kernel, on T its inverse image, and on W=V/T its propagated image. Away from p the rational finite condition is unramified; for this pure geometric representation the whole rational local H¹ is zero. Finite-level Tamagawa errors remain. The global finite group is the kernel of localization modulo those finite subspaces. The arithmetic comparisons below identify it with the appropriate λ-component of the classical rational Selmer group. The subscript f never denotes unrestricted global H¹ (skinner-2020 §§2.2–2.3, pp.336–339).

A special local representation is denoted St; ξ is the nontrivial unramified quadratic character. In Case I every level prime splits or ramifies; a ramified level prime has type St⊗ξ and every other level prime splits. Case II has (D,N)=1 and N=N⁺N⁻, with N⁻ a nonempty product of an even number of inert primes and all primes of N⁺ split. The ramified-level condition is imposed only when (D,N)>1. Under Theorem B the residual nonsplit prime excludes the all-split coprime case. These conventions include the infinite sign −1 (skinner-2020 §2.1 and §2.4, pp.335–336,339–340).

**Checks.**

- With two inert level primes the sign is (−1)·(−1)²=−1 and N⁻ has two factors. With one inert prime it is +1. Treating the quaternion algebra as definite would reverse this parity.
- With one ramified St⊗ξ prime and all others split, the sign is (−1)·(+1)=−1; replacing St⊗ξ by St gives +1. For (D,N)=1 the conditional clause imposes no extra splitting.
- The cyclotomic character and its inverse have weights −1 and +1; V has weights 0,−1 while V* has weights 0,+1. Swapping these representations changes the ordinary filtration and the logarithm quotient.
- At q=5 and a_q=1 the geometric-Frobenius Euler polynomial on V* is 1−T+5T²; on V it is 1−T/5+T²/5. Replacing geometric by arithmetic Frobenius without dualizing would exchange these polynomials.
- Two conjugate newform factors each of order one give order 1+1=2 for the abelian L-function when d=2. Order one for that product would lose a coefficient embedding.
- The finiteness of S is not decorative. For S={∞,2,3,5,37}, the curve y²+y=x³−x of conductor 37, p=5 and D=−111, the S-ramified mod-5 cohomology is finite-dimensional. Allowing every place instead adds, for each further prime split in K(E[5]), a two-dimensional singular local term, so the residual Selmer dimension grows without bound and the Λ-dual of §2.1 could not be finitely generated.
- At p=5 and a_p=1 the good logarithmic Euler factor is (1+5−1)/5=1; at a_p=0 it is 6/5. Its possible zero a_p=6 violates |a_p|≤2√5<6. The same strict inequality holds for every p>1.

## Exact supplier contracts

### From Mathlib

Use `Module.finrank`, `LinearMap.ker`, `LinearMap.prod`, `LinearMap.fst` and `LinearMap.snd` for dimensions and actual maps. `continuousCohomology` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` is homology of the continuous cochain complex. `ContinuousCohomology.tateShafarevich` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` is the intersection of localization kernels for a supplied topological Galois module, a supplied family of field extensions and a degree; its definition does not include a point/Kummer comparison, finite-dimensionality, or a finiteness theorem. `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries` in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` are the formal Euler product of local Euler factors and its Dirichlet series, and `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`, `WeierstrassCurve.HasSplitMultiplicativeReduction` and `WeierstrassCurve.HasAdditiveReduction` in `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` are the local reduction types; they supply the Dirichlet series and local types used in A′, C and E, but not its continuation to s=1, a central order or Sha. Number fields, linear submodules and finite group actions retain their native carriers.

### From Tau Ceti

In the pinned Tau Ceti library, `TauCeti.AlgebraicGeometry.AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` bundles a proper geometrically integral group scheme over a field; it does not bundle modularity, a Hecke-field action or analytic L-function. The tangent-space module is in `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean`. `HeckeRing.GL2.Newform` in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`, Mathlib `ModularForm.L` in `Mathlib/NumberTheory/ModularForms/LFunction.lean` together with the normalization adapter in `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean`, and `HeckeRing.GL2.Newform.analyticRank` in `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean` supply the analytic newform side, rather than arbitrary analytic germs. `HeckeRing.GL2.Newform.frickeSign` in `TauCeti/NumberTheory/ModularForms/Newforms/Fricke.lean` is the Fricke eigenvalue of a trivial-character newform, and `TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean` proves the functional equation `Λ_N(k−s,f)=i^k ε_N(f) Λ_N(s,f)` (`HeckeRing.GL2.Newform.frickeCompletedL_sub_eq`), so `i^k ε_N(f)` is the root number ε(f)∈{±1} of §4.1. `TauCeti.Multiquadratic.IsFundamentalDiscriminant` in `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean` includes D=1, and `TauCeti.Multiquadratic.fundamentalDiscriminantChar` in `.../FundamentalDiscriminant/Character.lean` is the primitive quadratic character of conductor |D|, the splitting character of ℚ(√D). The quadratic-twist model `WeierstrassCurve.quadraticTwistOf`, with `WeierstrassCurve.isElliptic_quadraticTwistOf_iff`, `WeierstrassCurve.j_quadraticTwistOf` and `WeierstrassCurve.quadraticTwistOf_quadraticTwistOf`, is in `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`; EllipticCurves Layer 5 supplies only the pointed-twist classification and the twist of the Galois representation. `WeierstrassCurve.FormalGroupPoint.eq_zero_of_nsmul_eq_zero` and `WeierstrassCurve.eq_zero_of_mem_kerReduction_of_nsmul_eq_zero` in `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Torsion.lean` give the torsion-freeness of the formal group Ê(I) and of the kernel of reduction E₁ for orders n that are units of the coefficient ring, that is prime to the residue characteristic; the p-power case over ℚ_p, which §5.1 needs, is not in the pinned library and is the EllipticCurves contract below. `WeierstrassCurve.Affine.selmerGroup₂` in `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` is a particular square-class descent subgroup. Use `TauCeti.fittingIdeal` and `TauCeti.fittingIdeal_baseChange` from `TauCeti/RingTheory/FittingIdeal/Basic.lean` and `TauCeti/RingTheory/FittingIdeal/BaseChange.lean`; the latter is an arbitrary commutative algebra base-change identity for the finite module, not an arithmetic Selmer-control theorem.

### From TauCetiRoadmap.EllipticCurves

Layers 1–2 supply formal groups, differentials, Tate modules and Weil pairings. Layer 3 supplies the Hasse bound; Layer 4 the good-reduction filtration; Layer 5 the classification of quadratic twists and the twist of the Galois representation, on the pinned twist model. Layer 7 supplies the actual discrete Selmer structures, finite local Kummer images and the finite Selmer/Sha exact sequence. The point at infinity is the identity. The local input in §5.1 uses p≥5: reduction is injective on E(ℚ_p)[p∞] because the kernel of reduction E₁(ℚ_p)≅Ê(pℤ_p) is torsion-free for p≥3, the contract below, and #Ẽ(𝔽_p)≤p+1+2√p<p² then forces the order of E(ℚ_p)[p∞] to be at most p. Layer 1's four formal-group milestones state the law, the formal logarithm and exponential over ℚ-algebras, convergence and the identification Ê(𝔪)≅E₁(K), and Layer 4 the reduction filtration, without a torsion statement at the residue characteristic; the pinned torsion lemmas cover only orders prime to it.

What EllipticCurves must provide (gap:formal-group-p-torsion): For an elliptic curve over ℚ_p with p ≥ 3 and an integral Weierstrass model, prove that the kernel of reduction E₁(ℚ_p) ≅ Ê(pℤ_p) has no nonzero torsion, by the formal-group torsion valuation bound or the formal-logarithm isomorphism Ê(pℤ_p) ≅ pℤ_p, so that reduction is injective on E(ℚ_p)[p^∞].

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Use §§1.4–1.5 for the rational orbit projector, coefficient idempotent and rank-two realization; §4.1 for local-global compatibility; §§6.1–6.4 for the weight-two Tate-module, residual and conductor comparisons; §§7.5–7.7 for residual large image, squarefree residual ramification and density-one ordinary primes. For a fixed non-CM f, some λ over each ordinary rational p is ordinary, while every λ over sufficiently large p satisfies the residual conditions. The two quantifiers are distinct. The finite exceptional set may depend on f and its fixed bad primes.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R16.3.2, R16.3.5–R16.3.6 supply special parameters, twisting and archimedean factors; R16.4.6 supplies the self-twist meaning of non-CM. R17.3.1 and R17.3.8 supply global Jacquet–Langlands and rational-model transport with actual models over a splitting coefficient field. R17.4 supplies quadratic base change and the normalized twist. Three further squarefree inputs follow from existing suppliers. The global sign of f over K is the product of local base-change signs, (−1) raised to the number of places where the local sign is −1 (GrossZagierAndArithmeticHeights §8.3, with the Saito–Tunnell dichotomy of §4.2 for the admissible definite or indefinite algebra and the base-change versus Rankin–Selberg sign convention of §0.7). The elliptic multiplicative dictionary combines three suppliers: `WeierstrassCurve.localPolynomial` in the pinned Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` is 1−X at split and 1+X at nonsplit multiplicative reduction, so a_q(E)=+1 and a_q(E)=−1 respectively; AutomorphicGaloisRepresentations §6.4 identifies the elliptic conductor and L-function with those of f, so a_q(f)=a_q(E); and R16.3.2 gives L(s,π_q)=L(s+1/2,μ) for π_q=St⊗μ with μ unramified, so a_q(f)=μ(q) in weight two, μ=1 being the type St and μ=ξ the type St⊗ξ. Squarefree level excludes CM: a nontrivial quadratic self-twist character is ramified at some prime q; there π_q must be ramified, so q|N and π_q=St⊗μ with μ unramified, while St⊗μη_q has conductor 2a(η_q)≥2 by R16.3.2, contradicting the self-twist condition of R16.4.6. AutomorphicGaloisRepresentations §7.7 then applies with its non-CM hypothesis met. The explicit local base-change root numbers of the Steinberg types are the contract below. R16.3.6 with R17.4.3 gives the archimedean sign: real-to-complex transfer restricts the weight-two real Weil parameter to W_ℂ, where it is the sum of the characters of angular weights +1 and −1, each with root number i, so the root number of the base change of the weight-two discrete series to ℂ is i·i=−1, the infinite sign of the conventions.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:squarefree-base-change-signs): For a quadratic étale algebra K_q over ℚ_q, q odd, and μ an unramified character with μ²=1, give the root number ε(1/2, BC_(K_q)(St⊗μ)) as +1 when K_q is split, −1 when K_q is the unramified field, and −μ(q) when K_q is ramified, independently of the additive character.

### From TauCetiRoadmap.SelmerIwasawaCohomology

Use §§2.1–2.12a for the canonical rational/compact Selmer kernels, propagation, contragredient dual and abelian Kummer/Sha carriers; §§2.19–2.20 for Selmer Poitou–Tate; §3.0 for the coordinates of the Iwasawa algebra O[[Γ]] and the involution ι:γ↦γ⁻¹ through which §2.1 compares the two dual actions; §§3.8–3.13 and 3.16 for completed actions, local correction complexes, control and finite generation; §§4.9 and 4.26 for finite conditions and elliptic arithmetic comparison. The quadratic decomposition in §4.28 supplies the rational ± splitting on compatible Selmer diagrams. Section 4.29 supplies the elliptic alternating Cassels–Tate pairing with divisible radicals and the paired finite primary quotient. In particular a nonzero finite cyclic p-group is excluded by its perfect alternating pairing, including cyclic order p². The ordinary modular application of §4.28 compares two family points; the absolute root-number comparison needed here is specified separately.

What SelmerIwasawaCohomology must provide (gap:gl2-rational-kummer): Extend the canonical abelian Kummer and Bloch–Kato comparison to every coefficient component of A_f, identifying the rational Selmer cokernel with the corresponding rational Tate module of Sha, proving rational local vanishing away from p and compatibility with finite coefficient extension.

What SelmerIwasawaCohomology must provide (gap:quadratic-abelian-sha): For every abelian variety A over a number field and quadratic extension K, supply the isogeny A × A^D → Res_(K/F) A of degree a power of two, the identification of (Res_(K/F) A)(F), its Selmer groups and its Sha over F with those of A over K, and the rational ± point and Selmer decompositions, with the finite two-primary restriction/corestriction errors retained.

What SelmerIwasawaCohomology must provide (gap:ordinary-root-number-parity): For weight-two trivial-character newforms at good ordinary odd coefficient primes over ℚ and imaginary quadratic K, prove (−1)^(dim H¹_f(F,V)) = w(f/F) for the geometric Tate realization, including the ramified quadratic twists used here, with the realization and local hypotheses proved from those arithmetic assumptions.

What SelmerIwasawaCohomology must provide (gap:strict-anticyclotomic-control): For Skinner’s geometric ordinary rank-two representation in both admissible Heegner cases and a finite set S of places of ℚ containing ∞ and every prime dividing pND, prove finite generation of its G_(K,S) one-inertia-strict otherwise-relaxed dual, exact ψ₀-twisted two-variable specialization after inverting p, injective augmentation control with finite cokernel computed from local inertia invariants, and identification of its rational Tate module with the full one-sided local kernel using vanishing of the unramified local kernel.

What SelmerIwasawaCohomology must provide (gap:good-local-torsion-comparison): For an elliptic curve with good reduction at p ≥ 5 and E(ℚ)[p] = 0, compare finite Sel_p with Sel_(p∞)[p] and prove that a local mod-p Kummer image outside the image of E(ℚ_p)[p], using E(ℚ_p)[p∞] = E(ℚ_p)[p], detects a nonzero rational localization.

The GL₂-type Kummer comparison has source (A(K)⊗ℚ_p)⊗_(M⊗ℚ_p)L and target H¹_f(K,V); its cokernel is V_p(Sha(A/K))⊗_(M⊗ℚ_p)L. At v|p the local source is the completed point group tensored with ℚ_p and the analogous coefficient factor. The quadratic map is (x,y)↦x+y over K, with y in the χ_D-twisted factor; its inverse up to [2] uses x+c(x) and x−c(x). These are statements about these actual maps.

**Checks.**

- If rank_ℤ A(K)=d=2 and Sha[p∞] is finite, each coefficient component has dimension 2/2=1 and rational Tate-Sha cokernel zero; the integral Selmer quotient can still have finite torsion.
- A quadratic point with c(x)=x maps to the + eigenspace: (1+c)x=2x and (1−c)x=0; for c(y)=−y the values are 0 and 2y. Dividing by 2 is legitimate rationally, while two-primary integral errors survive.
- A cyclic group of order p² has square cardinality p², but every alternating pairing is zero since b(ng,mg)=nm b(g,g)=0; it cannot be perfectly paired with itself unless it is zero.
- A finite Sha[p∞] has rational Tate module zero. The group ℚ_p/ℤ_p has Tate module ℤ_p and rational Tate module ℚ_p, so finiteness cannot be replaced by finiteness of p-torsion.
- Root-number parity at dimensions 0,1,2 must give +1,−1,+1. An odd function (s−1)³ has sign −1 and central order 3, so parity alone cannot give a nonzero derivative.

The local compatibility of the point Kummer map with the Bloch–Kato logarithm at v|p is GrossZagierAndArithmeticHeights §9.20, through the point-Kummer and logarithm supplier that section declares. Invariance of entire Sha finiteness under an isogeny φ:A→B is derived from §2.12a: its exact descent sequence and the finiteness of the φ-Selmer group for every isogeny make ker(Sha(A)→Sha(B)) finite, and the same for an isogeny ψ:B→A with ψφ=[deg φ], so Sha(A) is finite exactly when Sha(B) is. Applied to A × A^D → Res_(K/F) A and Sha(Res_(K/F) A/F)=Sha(A/K), finiteness over K is equivalent to finiteness for A and A^D over F.

### From TauCetiRoadmap.ArithmeticGaloisDuality

R02.1.3 supplies compact/rational/torsion coefficients; R02.3.1 supplies restricted-ramification finiteness; R02.4.2–R02.4.4 supply local duality, Poitou–Tate, cohomological dimension and Euler characteristics; R02.5.1 supplies the comparison of local conditions. On this Tate realization over imaginary quadratic K, global H⁰ and the requisite dual H⁰ vanish, local H² vanishes and H¹ away from p vanishes rationally. Consequently dim H¹−dim H²=2 and the strict kernel has dimension dim H²; §1.3 applies these general formulas. These conclusions do not assert that unrestricted H² is zero.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Use Layers 1–2 for measures and completed group rings, §§4.1–4.3 for pseudo-null modules, structure and Weierstrass theory, §4.5 for the Iwasawa coordinate, §4.6 for characteristic divisors and ideals over every noetherian normal UFD, including Ô^ur[[T]] with its infinite residue field, and the pseudo-null criterion char(X)=(1) exactly for pseudo-null X, and §§5.1–5.2 for determinants and topological Nakayama. Section 6.5 and the pinned Fitting API supply base change; arithmetic exactness is supplied separately. The torsion characteristic ideal is the divisorial closure of the zeroth Fitting ideal under its finite-presentation hypotheses. Characteristic ideal zero for a positive-rank module is the extended convention used here.

What PadicMeasuresIwasawaAlgebras must provide (gap:unramified-augmentation-divisor): Prove that characteristic ideals of finitely generated torsion O[[T]]-modules are preserved by the faithfully flat coefficient extension O[[T]]→Ô^ur[[T]] to the completed maximal-unramified coefficient DVR, and that for a finitely generated O[[T]]-module X a torsion characteristic ideal contained in (T) after inverting p, or positive Λ-rank, forces positive O-rank of X/TX.

For R=O[[t]], R/(t) has characteristic ideal (t) and coinvariants O of O-rank 1. R/(p,t) is finite and pseudo-null with characteristic ideal (1); its coinvariants have rank 0. R itself has extended characteristic ideal 0 and coinvariants O. These witnesses fix both the divisibility direction and the nontorsion branch (skinner-2020 §2.7, pp.346–347; skinner-urban-author §3.1.6 and Corollary 3.2.9, pp.19–24).

### From TauCetiRoadmap.AutomorphicCongruences

Section 2.22, “Wan's ordinary GU(3,1) Rankin–Selberg divisibility”, supplies Wan's single-form two-variable theorem: for p≥5, the p-adic avatar of ξ|·|^(κ/2)(ω⁻¹∘Nm) factoring through Γ_K with κ≥6 even and κ≡0 mod 2(p−1), residual irreducibility over G_K and a prime q∥N nonsplit in K, the imprimitive function generates a fractional ideal of Ô^ur_L[[Γ_K]]⊗L containing the characteristic ideal of the dual Selmer module, in both global root-number cases, with Wan's exceptional-prime and normality arguments. It is constructed there and is not assumed here in its anticyclotomic form (wan-2020, Theorem 1.2, pp.385–386; §7E, pp.445–449; proof, pp.479–480). For a finitely generated torsion module over the regular ring Ô^ur_L[[Γ_K]] the zeroth Fitting ideal lies in the characteristic ideal, its divisorial hull, so the same containment holds for the Fitting ideal; that is the form §2.2 specializes.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

Sections 0a.3–0a.4, 3.2–3.4 and 8.17 supply the CM divisor D_K on the admissible modular or indefinite quaternionic curve X, J=Jac(X), the Hecke-equivariant quotient φ:J→A_f and the coefficient idempotent ε_f. For ℓ∤pND they supply the rational normalization Q_K(f)=ε_f[(T_ℓ−1−ℓ)D_K]/(a_ℓ−1−ℓ), its independence of ℓ, and P_K(f)=φQ_K(f). The rational point Q_K^ξ=[D_K−deg(D_K)ξ] precedes coefficient projection and Q_K(f)=ε_fQ_K^ξ. The denominator is nonzero by |a_ℓ|≤2√ℓ<1+ℓ at every embedding (skinner-2020 §2.4, pp.339–340).

Fix the invariant eigendifferential ω by φ*ω=ω_f, with upper-half-plane pullback ω_f=2πi f(z) dz. For q=exp(2πiz), this is f dq/q. The required point API is:

- All permitted auxiliary Hecke primes give the same rational eigenpoint.
- The eigenpoint is the coefficient projection of the rational Hodge-divisor point before scalar extension; on the modular curve the cusp-normalized and Hodge-normalized projections agree.
- A Hecke-equivariant isogeny u:A_f→A′ carries P_K(f) to the point for uφ.
- For the matching eigendifferential ω, log_ω P_K(f)=log_ω φ(Q_K^ξ); equality of φε_f and φ is not asserted.

Section 9.6 gives a nonzero Petersson-norm ratio; §9.10 gives differential and quotient functoriality. Sections 8.13 and 8.17 give P_K(f)≠0 ⇒ ord₁L(f/K)=1 and ord₁L(A_f/K)=d, using all real coefficient embeddings. Sections 9.7, 9.13, 9.16–9.22 give the integral function over O^ur[[Γ]], its imprimitive dictionary, the two geometric cases and L_𝔭^S(f,1)=c(log_ωP_K(f))² with c≠0. The reverse implication from a nonzero point to a nonzero scalar logarithm uses the actual rational point φ(Q_K^ξ), clearing denominators, and the eigenlogarithm theorem. The latter applies to an abelian variety with a field of endomorphisms of degree its dimension having a real embedding (bsw-2026, Theorem 1.1 p.3; Theorem 2.3 and Remark 2.4 pp.4–5). No arbitrary coefficient tensor has this property.

For interpolation O^ur is the integer ring in the completed maximal unramified extension of L. A finite enlargement of L contains the needed Hilbert class-field image. Classical interpolating ψ have weights (−n,n), n>0 divisible by p−1; in geometric reciprocity the corresponding algebraic Hecke character has infinity type (n,−n). The value at the trivial character is supplied by the weight-two formula, outside that interpolation range. Euler factors removed away from p and period ratios have nonzero augmentation; the p-factor ((1+p−a_p)/p)² is retained. These hypotheses belong to the supplied formulas, including the ramified Case I local signs (skinner-2020 §2.6, pp.341–344).

What GrossZagierAndArithmeticHeights must provide (gap:wan-period-dictionary): Compare Wan’s ψ₀-twisted two-variable specialization with Skinner’s imprimitive anticyclotomic function in both Heegner cases over O^ur[[Γ]][1/p], retaining identical removed Euler factors, a period comparison whose augmentation is nonzero and the rational pre-projector point.

**Checks.**

- For a normalized expansion f=q+O(q²), the differential f dq/q has leading term dq, because dq/q=2πi dz. Omitting 2πi would give leading coefficient 1/(2πi).
- If ℓ=2 is permitted and a₂=0, the denominator is −3 and P_K(f)=−u/3 for u=φε_f[D_K,2]. For u=3 this gives −1; dropping the denominator gives 3 and the zero construction gives 0.
- An Eisenstein correction has zero ε_f-projection; adding it changes a divisor but changes the eigenpoint by 0. The cusp and Hodge corrections likewise differ by an element with zero f-projection.
- Replacing φ by [2]φ sends a point with logarithm 1 to one with logarithm 2; its squared logarithm is 4. Height also scales by 4. This separates a point, a linear logarithm and its square.
- For an isogeny u:A→A′, the pullback identity is log_(u*ω′)(P)=log_ω′(uP) for P∈A. A point of A′ cannot be inserted in u. With u=[2], both sides at log_ω′P=1 are 2.
- Rescaling ω to 2ω multiplies its logarithm by 2. If the analytic function is fixed, c changes to c/4, so c(log_ωP)² remains c when log_ωP=1. If the transferred form and its analytic normalization scale together, their squared value scales by 4.
- At d=2, the multiplication idempotent in M⊗M has component values (1,0), whereas the rational orbit projector acts as (1,1); identifying them would retain the wrong embedding. The matching eigenlogarithm annihilates the second component.
- The zero Heegner point has logarithm 0 and analytic value c·0²=0. A nonzero arbitrary Selmer class may also have logarithm 0; only the actual-point eigenlogarithm input proves the converse.

### From TauCetiRoadmap.HeegnerPointEulerSystems

Sections 1.4–1.6 supply integral Hodge-denominator clearing and quotient-compatible CM point families. Section 7.11 supplies the classical all-prime full-Sha theorem from a non-torsion trace, and §7.12 the admissible RM Kolyvagin–Logachev application. The latter retains its maximal endomorphism order, non-CM, central quotient and chosen Hodge realization. The following extension covers all primary components of Sha and nonsquarefree quadratic twists; rank-zero Mordell–Weil finiteness is not part of it.

What HeegnerPointEulerSystems must provide (gap:gl2-full-forward): For every weight-two trivial-character newform g of any positive level, including the primitive newforms of nonsquarefree quadratic twists f⊗χ_D, prove that L(g,1)≠0 implies finiteness of the entire Sha(A_g/ℚ), and that ord₁L(g,s)=1 implies rank_ℤ A_g(ℚ)=[M_g:ℚ] and finiteness of the entire Sha(A_g/ℚ), transferring the maximal-endomorphism-order and non-CM realization hypotheses of the RM descent to A_g and its Hodge or quaternionic realization.

Its coefficient-degree-one instance is ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, whose low-analytic-rank implication over ℚ holds for every elliptic curve with modular comparison data: analytic rank 0 or 1 gives the same algebraic rank and finiteness of Sha(E/ℚ). Sections 4.3–4.4 and 5.3 cite it for E/ℚ and for the elliptic twists E^D; the gap is consumed for coefficient degree d≥2, for A_f and for its twists A_f^D alike.

### From TauCetiRoadmap.EllipticCurveModularityPartII

Section 6.0e, “Unconditional rank zero for modular abelian factors”, proves for every weight-two trivial-character newform g of any positive level and coefficient degree that L(g,1)≠0 implies A_g(ℚ) finite. It applies to the primitive newform of every quadratic twist f⊗χ_D, squarefree or not, and to A_f itself; rational rank is an isogeny invariant, so it transfers to the twist A_f^D. This is the rank-zero Mordell–Weil input of §§4.3 and 5.3; the Sha clauses are the contract above.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AL.1–AL.3 supply actual local factors, their ramified Rankin–Selberg comparisons, analytic continuations and global functional equations. The motivic shift is L(π,s−1/2)=L(f,s). The product contract concerns these actual functions, not independent analytic continuations chosen for different embeddings.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:gl2-analytic-products): Identify the actual finite L-functions of A_f, all conjugate newforms and quadratic base change by their products at every local factor, including ramified conductor primes, and supply nonzero analytic continuation and central-order additivity compatible with the Tate realization and primitive quadratic twisting.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Sections 8.85–8.87 supply, from one BFH datum, the two-cusp coefficient and local-test export, the metaplectic kernel comparison and ramified/dyadic quadratic-twist kernel inputs. Keep the first-cusp factor (2mN³)⁻¹, opposite-cusp full-rank factor (2m)⁻¹ and unscaled rank-zero term, joint polar continuation, justified residue/derivative interchanges, and the specified nonzero finite K-types. Section 4.1 uses these exports for the final nonvanishing argument and is its owner; its infinitude is not presumed in the kernel inputs. A ramified local character is specified in full, rather than by the zero value of its Dirichlet character at a conductor prime.

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

Sections 2.10 and 4.7–4.8 supply weight-two level lowering and the finite-flat coefficient-prime bridge at odd p≥5, with the residual coefficient embeddings and irreducibility hypotheses. Repeated lowering at all odd bad primes of a semistable E good at p gives level dividing 2 if none of those primes is residually ramified. The dimensions dim S₂(Γ₀(1))=dim S₂(Γ₀(2))=0 are the genus-zero weight-two boundary in this application; §5.2 spells out the contradiction. It uses no large-p replacement for the specified p in C.

### From TauCetiRoadmap.EllipticCurveModularity

R29.5 supplies modular parametrization and rational-isogeny comparison; R29.6 supplies the identification of the actual elliptic L-function and its continuation. Semistable E has squarefree conductor, split multiplicative local type St and nonsplit multiplicative local type St⊗ξ. These comparisons, with the Kummer/Sha isogeny contract above, transport A to A′.

### From TauCetiRoadmap.ArithmeticStatisticsPartI

Section 0.6, “Squarefree integers in residue classes”, supplies the positive main term with square-root error for fixed modulus q≥1 and gcd(a,q)=1. After extracting the prescribed valuation-one ramified factors, §4.1 applies this count to the remaining coprime residue class. This is an elementary family-counting input, independent of the rank-one applications in Part VI. For q=8 and an odd residue the main term is X/π²; its positive coefficient ensures existence for sufficiently large X. The count itself is not redeveloped here.

### From TauCetiRoadmap.ModularForms and TauCetiRoadmap.ModularCurvesPartII

ModularForms Layer 10B supplies the compact modular-surface genus formula and Layer 10C the canonical differential dictionary; ModularCurvesPartII §7.2 transports weight-two cusp forms to regular differentials on the arithmetic curve. At levels 1 and 2 the genera, and hence cusp-space dimensions, are both 0. ModularForms Layer 5, “Cross-level strong multiplicity one, for newforms”, supplies the uniqueness used by §4.1: two normalized newforms of the same weight whose coefficients agree at all but finitely many primes away from both levels have the same level and the same nebentypus and are equal; the pinned `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` in `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean` is the fixed-space form, which takes equal level and nebentypus as hypotheses. ModularForms Layer 4 supplies the primitive associate, the newform attached to an eigenform away from the level, and Layer 9, “Inner twists”, the twisting API: the twist g⊗ψ of a q-expansion by a Dirichlet character ψ, its modularity, level bound and nebentypus χψ², the good-prime formula a_q(g⊗ψ)=ψ(q)a_q(g), and the passage to its primitive associate. The API following `IsPrimitiveQuadraticTwist` in §4.1 is imported from these targets; double twisting by the same discriminant follows from the good-prime formula and the cross-level uniqueness. The primitive newform/oldform and twisting comparisons keep these modular and automorphic supplier carriers.

## How to read the build

Layer 0 verifies residual restriction and fixes the imported Heegner normalization. Layer 1 proves arithmetic localization and strict-kernel vanishing on the canonical rational cohomology spaces. Layer 2 specializes the ordinary congruence/Fitting input and combines it with finite-error control to obstruct augmentation vanishing. Layer 3 assembles B using the supplied logarithm and height criteria. Layer 4 develops general locally prescribed twist nonvanishing from the earlier metaplectic exports and applies B to obtain A and A′. Layer 5 treats the specified finite Selmer prime and proves C. Layer 6 uses the derivative branch of the same quadratic nonvanishing theorem to prove E. Each proof route uses the listed inputs; alternative proofs of a target need only its statement’s hypotheses and their own inputs.

## Layer 0: residual restriction and the Heegner normalization

### 0.1 Irreducibility after restriction

Let f,N,p,λ,K,V satisfy the conventions. If the residual representation is irreducible over G_ℚ and is ramified at an odd q|N nonsplit in K, prove its restriction to G_K is irreducible. The squarefree local compatibility input gives nontrivial unipotent residual inertia. If U=1+J with J²=0 and J≠0, then U²=1+2J≠1 in odd characteristic, and the square of an inertia lift belongs to G_K. Any invariant line of the restricted representation is the unique fixed line of this unipotent. Normality of G_K makes that unique line globally invariant, giving the contradiction (skinner-2020, Lemma 2.8.1, p.347).

The argument uses the actual residual local reduction: semisimplifying a characteristic-zero local parameter cannot establish residual ramification. Its conclusion concerns the restriction; global irreducibility alone does not imply irreducibility over an index-two subgroup. *Needs:* TauCetiRoadmap.AutomorphicGaloisRepresentations §§4.1 and 6.2–6.4, for the residual carrier, squarefree local compatibility and nontrivial local inertia.

**Checks.**

- Over 𝔽₅, U=(1 1;0 1) has square (1 2;0 1), with the same unique fixed line spanned by (1,0); the off-diagonal entry remains nonzero.
- In characteristic 2 the same square is the identity. The fixed-line proof therefore requires odd characteristic; p=2 is outside the theorem.
- The irreducible two-dimensional representation of S₃ in characteristic 5 restricts to C₃ as two eigenlines after adjoining cube roots of unity. Its transpositions have eigenvalues 1,−1, rather than nontrivial unipotent inertia of odd order. This is a negative control for dropping the local ramification input.

### Examples

The local sign witnesses in the conventions apply unchanged: two inert primes contribute +1 finitely and −1 globally; one ramified St⊗ξ prime contributes +1 finitely and −1 globally. The supplied normalized point has denominator −3 at ℓ=2,a₂=0, so u=3 gives point −1. Replacing φ by [2]φ gives point −2, logarithm twice the original, and squared logarithm four times the original. A case with a ramified untwisted St prime fails the specified sign condition.

### Dependencies

AutomorphicGaloisRepresentations §§4.1, 6.1–6.4; GL2AutomorphicRepresentationsAndTransfer R16.3 and R17.3.1, R17.3.8; GrossZagierAndArithmeticHeights §§3.2–3.4, 8.17 and 9.6, 9.10, 9.13; HeegnerPointEulerSystems §§1.4–1.6. The residual-restriction theorem uses these inputs; the geometric and normalization objects enter through the exact supplier contracts.

## Layer 1: rational localization and strict kernels

### 1.1 The rank-one localization condition

For a field L, a finite-dimensional L-vector space S₀, an L-vector space P₀ and an actual linear map loc:S₀→P₀, define the rank-one localization condition to mean dim_L S₀=1 and injectivity of loc. Its arithmetic instance has source H¹_f(K,V), target H¹_f(K_𝔭,V)⊕H¹_f(K_𝔭̄,V), and the actual restriction map with this finite-condition codomain (skinner-2020, B(e), p.331; Lemma 2.3.2, p.339).

Its API is:

- The source has dimension one, with finite dimensionality retained as a hypothesis of the dimension convention.
- The specified map is injective; replacing it by another map is not part of the condition.
- Equivalently, the source has dimension one and the kernel of that same map is zero.
- Source and target linear equivalences transport the condition through a commuting square: for e:S₀≃S₁ and h:P₀≃P₁, use h∘loc∘e⁻¹:S₁→P₁.

*Needs:* Mathlib `Module.finrank`, `LinearMap.ker`; for the arithmetic instance, the SelmerIwasawaCohomology Kummer/finite-condition contracts.

**Checks.**

- The identity ℚ→ℚ has dimension 1 and kernel 0, so satisfies the condition. The zero map on ℚ has the same source dimension and kernel ℚ, so fails.
- The unique map from the zero vector space is injective and has dimension 0; it fails the line condition. Likewise an injection ℚ²→ℚ² fails because its dimension is 2.
- Let loc(x)=(x,2x), e(x)=2x and h(y,z)=(3y,3z). The transported map sends x to (3x/2,3x); its kernel is still 0 and the commuting square gives h(loc(1))=(3,6)=loc′(e(1)). Transporting the spaces without transporting the map would not test the condition.

### 1.2 Arithmetic rank one at every coefficient place

Assume f,N,K as above, p≥5 good and split in K, rank_ℤ A_f(K)=d, and Sha(A_f/K)[p∞] finite. For every λ|p and finite L/M_λ, prove dim_L H¹_f(K,V)=1 and injectivity of each restriction to H¹_f(K_v,V), v|p. In particular the semilocal map satisfies §1.1. Ordinarity is not needed for this point-logarithm implication (skinner-2020, Lemma 2.2.2, pp.337–338; bsw-2026, Theorem 1.1 p.3, Theorem 2.3 and Remark 2.4 pp.4–5).

The supplied Kummer sequence identifies the finite Selmer group with the λ-component of A(K)⊗ℚ_p. Choose a nonzero generator in the rank-one M-space A(K)⊗ℚ and clear a rational denominator to get an actual non-torsion point. The eigenlogarithm theorem gives nonzero logarithm at every matching embedding. Local Kummer/logarithm compatibility makes each map nonzero on a line, hence injective. Freeness of an M⊗ℚ_p-module alone cannot exclude a zero local coefficient component. *Needs:* §1.1; SelmerIwasawaCohomology gap:gl2-rational-kummer; GrossZagierAndArithmeticHeights §§9.13 and 9.20, with its point-Kummer/logarithm supplier comparison.

**Checks.**

- For M=ℚ and arithmetic rank 1, the source dimension is 1/1=1; a nonzero local logarithm gives a rank-one local map.
- If p has two coefficient places, an abstract map L×L→L×L given by (x,y)↦(x,0) has nonzero full image and zero second component. The algebraic-point eigenlogarithm theorem excludes this wrong model for the actual generator.
- A torsion point has logarithm 0, and rational Kummer class 0. It is ineligible as the nonzero M-generator, even if it is nonzero in A(K).
- If Sha[p∞] contains a divisible line, its rational Tate module has dimension 1 and the Kummer cokernel need not vanish. The arithmetic-rank calculation alone then does not give the claimed Selmer dimension.

### 1.3 The unrestricted semilocal image

For the irreducible geometric Tate realization, good p split in imaginary quadratic K, and S as in the conventions, prove each H¹(K_v,V), v|p, has dimension 2 and each finite local subspace dimension 1. Prove that the image of H¹(G_(K,S),V) in their direct sum has dimension 2. Global H⁰ and the dual invariant terms vanish, local H² vanishes, and away-p rational H¹ vanishes. Poitou–Tate identifies the strict kernel with the dual of global H², while the imaginary-quadratic Euler characteristic gives dim H¹−dim H²=2. Subtracting the kernel gives the image dimension (skinner-2020, Lemma 2.3.1, pp.338–339).

*Needs:* ArithmeticGaloisDuality R02.1.3, R02.4.2–R02.4.4; SelmerIwasawaCohomology §§2.16–2.20 and gap:gl2-rational-kummer; the weight, irreducibility and purity identifications from AutomorphicGaloisRepresentations §§6.1 and 7.2. The proof does not assume global H²=0.

**Checks.**

- The target dimension is 2+2=4, while the image dimension is 2. A surjectivity assertion would claim 2=4 and is rejected.
- If dim H²=0, the formula gives dim H¹=2 and strict-kernel dimension 0. If dim H²=1, it gives dim H¹=3 and strict-kernel dimension 1; both give image dimension 2.
- A trivial one-dimensional coefficient has H⁰ dimension 1 and fails the invariant hypotheses. It cannot be substituted into the rank-two weight −1 calculation.

### 1.4 Strict and one-sided kernels

Set H=H¹(G_(K,S),V) and loc=(loc_𝔭,loc_𝔭̄). Define the strict kernel H_str=ker loc, and the one-sided kernels H_𝔭=ker loc_𝔭 and H_𝔭̄=ker loc_𝔭̄. Their source is unrestricted rational cohomology; no additional away-p condition is introduced. The finite Selmer subspace is the preimage of the product of the two finite lines. Under §1.3 and the conjugation that exchanges both full local spaces and their finite lines, prove that a one-dimensional localized finite image implies H_𝔭=H_str=H_𝔭̄. If the finite Selmer group itself also has dimension 1, all three vanish (skinner-2020, Lemma 2.3.2, p.339).

If the two-dimensional image contains a nonzero coordinate-axis vector, its conjugate supplies the other axis. The image splits as those two lines. Its intersection with the finite local product has dimension 0 or 2, since conjugation exchanges the two intersections. Dimension 1 is impossible. Thus both coordinate projections are injective on the image and the kernels agree. The strict kernel lies in the finite Selmer group; dimension 1 of both that group and its image then kills the kernel. *Needs:* §1.1, §1.3; SelmerIwasawaCohomology §4.24 and the conjugation-compatible finite-condition diagram; Mathlib submodules, kernels and dimension formulas.

The kernel API is:

- The strict kernel is contained in each one-sided kernel, and is their intersection.
- Conjugation maps the 𝔭-kernel onto the 𝔭̄-kernel; it is not an endomorphism fixing the selected local place.
- Under the one-dimensional finite-image hypothesis the three kernels coincide.
- Under the additional dimension-one source hypothesis their common dimension is 0.

**Checks.**

- In P=L² with finite line Le₁, the diagonal image X={(x,x):x∈P}⊂P⊕P has dimension 2 and finite intersection {(ae₁,ae₁)} of dimension 1. Both coordinate projections have zero kernel.
- For the axis image X=(Le₁⊕0)⊕(0⊕Le₁), the finite intersection is all X, dimension 2. This is the wrong model excluded by dimension 1. If the axes use Le₂, their finite intersection has dimension 0 instead.
- If the finite Selmer group has dimension 2, image dimension 1 and kernel dimension 1 are compatible with rank-nullity. The equality of one-sided kernels does not by itself make them zero.
- At B(e), source dimension 1 and injective semilocal map give finite-image dimension 1 and strict-kernel dimension 1−1=0; individual injectivity is then a conclusion, not an additional hypothesis.

### Examples

For a diagonal semilocal image the two local coordinates of (e₁,e₁) are nonzero and conjugation exchanges them. The image on both coordinate axes instead gives finite-intersection dimension 2, contradicting the Selmer line. On the arithmetic M-line a non-torsion algebraic generator has nonzero scalar logarithm at every λ; the abstract projection (x,y)↦(x,0) shows exactly why the eigenlogarithm input is needed. Under the parity supplier contract, dimensions 0 and 1 give signs +1 and −1, but the sign −1 alone admits central order 3.

### Dependencies

Layer 0; SelmerIwasawaCohomology §§2.12a, 2.16–2.20, 4.24, 4.26 and the coefficient, quadratic and parity gaps; ArithmeticGaloisDuality R02.1.3 and R02.4.2–R02.4.4; GrossZagierAndArithmeticHeights §§9.13 and 9.20; AutomorphicGaloisRepresentations §§6.1 and 7.2. The arithmetic localization theorem uses the Kummer/logarithm comparison; the pure semilocal argument uses duality and dimensions without an arithmetic-rank assumption.

## Layer 2: reverse divisibility and augmentation control

### 2.1 The one-sided anticyclotomic specialization

Let K_∞/K be the canonical anticyclotomic ℤ_p-extension, Γ its Galois group, Λ=O[[Γ]], and Ψ:G_K→Γ⊂Λ× the tautological character. Write Λ*=Hom_cts(Λ,ℚ_p/ℤ_p). Specialize the supplied completed-coefficient construction to M_∞=T⊗_OΛ* with inverse Ψ-action. Define Sel_∞ as the kernel of H¹(G_(K,S),M_∞)→H¹(I_𝔭,M_∞), relaxed at 𝔭̄ and every other place over S, and X_∞=Hom_Λ(Sel_∞,Λ*) as its Λ-linear dual, which is the compact Pontryagin dual with Λ acting by (λ·φ)(x)=φ(λx). The source, target and inertia restriction are actual continuous-cohomology objects. Prove finite generation of X_∞ in this arithmetic instance (skinner-2020 §2.7, pp.344–345).

Choose a topological generator γ. Fix an O-linear identification Hom_cts(O,ℚ_p/ℤ_p)≅L/O, equivalently a generator of the inverse different. Then identify M_∞[γ−1] with W=V/T as G_K-modules. The identification uses this coefficient-duality choice; it is not canonical without it. Use the same inertia kernel to define Sel_𝔭(W) and its compact dual X_𝔭. Write the characteristic ideal as zero when X_∞ has positive Λ-rank. At an arithmetic ψ of weights (−n,n), n>0, specialization gives V⊗ψ⁻¹, with weights n,n−1 at 𝔭 and −n,−n−1 at 𝔭̄. Its induced representation has two negative weights, equal to the +1 complex-conjugation multiplicity. This is the Panchishkin convention for the imported analytic function, not an assumed main conjecture.

The arithmetic specialization API is:

- The γ−1-torsion coefficient fibre is W, with its original G_K-action through the chosen coefficient duality.
- Membership in Sel_∞ is precisely zero restriction to I_𝔭; the other p-place is relaxed.
- For T⊆T′⊆p^(−m)T, coefficient and induced global/local comparison errors are killed by a power of p. Compact duals agree after inverting p; those Λ-level errors need not be finite.
- The Λ-action on X_∞ is (λ·φ)(x)=φ(λx), with no inversion, as in the source. The inverted action (γ·φ)(x)=φ(γ⁻¹x) would replace the characteristic ideal by its image under the involution ι:γ↦γ⁻¹; the augmentation ideal is ι-stable because γ⁻¹−1=−γ⁻¹(γ−1), but the containment of §2.2 is stated for the un-inverted dual.
- For positive Λ-rank X_∞ the extended characteristic ideal is zero; finite generation is an arithmetic conclusion supplied by the control contract.

*Needs:* SelmerIwasawaCohomology §§2.1–2.10, 2.24, 3.0, 3.8–3.13, 3.16 and gap:strict-anticyclotomic-control; PadicMeasuresIwasawaAlgebras §§4.1–4.6. The canonical extension and completed action come through these class-field/Iwasawa supplier constructions.

**Checks.**

- At the trivial character, Ψ⁻¹=1 and the fibre is W, a discrete divisible torsion module; it is not the compact lattice T.
- A global class whose 𝔭 restriction is zero and whose 𝔭̄ restriction is nonzero remains in this kernel. Imposing strictness at both places would reject it.
- For X=Λ, the extended characteristic ideal is 0 and X/(γ−1)X=O. Assigning the unit ideal to X would erase this nontorsion branch.
- With n=2, the specialized weights are (2,1) and (−2,−3), so exactly two are negative. Using Ψ in place of Ψ⁻¹ reverses the character contribution and gives (−2,−3) and (2,1).
- Λ/(p) is infinite, killed by p and has characteristic ideal (p); after inverting p it is zero with characteristic ideal (1). A promise of finite lattice-change error at the Λ-level fails this test.
- For X=Λ/(γ−a) with a=1+p, the un-inverted convention gives characteristic ideal (γ−a); the inverted one gives (γ⁻¹−a)=(γ−a⁻¹), since γ⁻¹−a=−aγ⁻¹(γ−a⁻¹), and a⁻¹≠a because a²=1+2p+p²≠1. These are distinct height-one primes, so the convention matters for the containment. At a=1 both give (γ−1), so the augmentation obstruction does not see the choice.

### 2.2 The ordinary reverse divisibility

Assume squarefree f, good λ-ordinary p≥5 split in K, 2 split, odd D, residual irreducibility over G_K, root number w(f/K)=−1, the conditional ramified-level condition, and residual ramification at an odd nonsplit q|N. For the supplied imprimitive function L_𝔭^S(f)∈Λ^ur=O^ur[[Γ]], prove

    char_Λ(X_∞) · Λ^ur[1/p] ⊆ (L_𝔭^S(f)).

The same conventions apply if X_∞ is nontorsion: its extended characteristic ideal is zero. This is a single inclusion. It does not assert torsion or equality of ideals. The elliptic instance with (D,N)=1 and an inert residually ramified prime is ArithmeticStatisticsPartVI, “Anticyclotomic main-conjecture implication”; GL₂-type coefficients and ramified Case I are proved here (skinner-2020, Proposition 2.7.2, pp.345–346; wan-2020, Theorem 1.2 pp.385–386 and its proof pp.479–480).

One route chooses ψ₀ with n₀>6 divisible by p−1, sets κ=2n₀, and applies the two-variable divisibility of AutomorphicCongruences §2.22 in the Fitting form recorded in the supplier contract. Its branch character has infinity type (κ/2,−κ/2), κ even, κ≥6 and κ divisible by 2(p−1); the avatar of ξ|·|^(κ/2)(ω⁻¹∘Nm) factors through Γ_K. The ring map is the anticyclotomic quotient O^ur[[Γ_K]]→Λ^ur followed by γ↦ψ₀(γ)⁻¹γ. Exact Selmer control after inverting p and the analytic period/Euler dictionary identify both sides under this map. Fitting base change carries the bound to the specialization; divisorial closure of the principal containing ideal gives the characteristic containment. Principality of a two-variable characteristic ideal alone does not justify this step. Retain the exceptional-prime and normality arguments in Wan’s proof (wan-2020 §2B–C pp.392–394, §7E Proposition 7.7 and (7-2)–(7-6) pp.445–449; skinner-urban-author §3.1.6 pp.19–20, Proposition 3.2.8 and Corollary 3.2.9 pp.23–24).

*Needs:* §0.1 and §2.1; AutomorphicCongruences §2.22; SelmerIwasawaCohomology gap:strict-anticyclotomic-control; GrossZagierAndArithmeticHeights §§9.21–9.22 and gap:wan-period-dictionary; pinned Tau Ceti Fitting base change; PadicMeasuresIwasawaAlgebras §4.6 and gap:unramified-augmentation-divisor. The published ordinary source is used throughout.

**Checks.**

- In R=O[[t]], (t²)⊆(t); when L=t, the inclusion forces a t-divisor on a nonzero torsion characteristic ideal. The reversed inclusion allows char=(1), which gives no augmentation class.
- For p=5 choose n₀=8; then κ=16≥6 and 2(p−1)=8 divides κ. n₀=4 fails the chosen n₀>6 interpolation branch.
- At ψ₀(γ)=a, the twist sends γ to a⁻¹γ, and evaluating γ at a gives 1. The map γ↦aγ instead gives a², so misses the required specialization.
- A finite module R/(p,t) has characteristic ideal (1). An arbitrary pseudo-null error cannot be discarded inside a Fitting specialization without its exact control terms; at t=0 it gives the nonzero finite module O/(p).

### 2.3 Finite-error augmentation control

Under the same residual and good ordinary local hypotheses, prove the natural map Sel_𝔭(W)→Sel_∞[γ−1] is injective with finite cokernel. Thus X_𝔭 is infinite exactly when X_∞/(γ−1)X_∞ is infinite. The rational Tate module of the maximal divisible part of Sel_𝔭(W) is H_𝔭=ker[H¹(G_(K,S),V)→H¹(K_𝔭,V)] (skinner-2020 §2.7, equation (2.7.1) and following argument, pp.346–347).

Residual irreducibility kills the global invariants and identifies the two global augmentation cohomology groups. The exact global-to-inertia diagram bounds the cokernel by (M_∞^(I_𝔭)/(γ−1)M_∞^(I_𝔭))^(G_(K_𝔭)); the ordinary local invariant calculation makes this group finite. On V, the map H¹(K_𝔭,V)→H¹(I_𝔭,V) is injective because its unramified kernel vanishes by Frobenius/purity. Therefore the rational inertia and full-local kernels agree exactly, while the integral augmentation error remains finite. Cofinite generation is required to turn infinitude into positive divisible corank. *Needs:* §0.1, §2.1; SelmerIwasawaCohomology §§3.9–3.13, 3.16 and gap:strict-anticyclotomic-control; local purity and the rational-coefficient exact sequences.

**Checks.**

- A finite group ℤ/p² has rational Tate module 0; ℚ_p/ℤ_p has rational Tate module ℚ_p of dimension 1. This distinguishes infinitude with finite cotype from a finite control error.
- A map with cokernel ℤ/p has the same divisible corank on both sides. A cokernel ℚ_p/ℤ_p would raise corank by 1 and invalidate the conclusion; “torsion error” is insufficient.
- If a Frobenius eigenvalue on V^I is a≠1, the unramified cohomology quotient is V^I/(a−1)V^I=0. At a=1 it is V^I, exhibiting the exceptional case excluded by purity.

### 2.4 The augmentation obstruction

Under §2.2 and §2.3, prove L_𝔭^S(f,1)=0 ⇒ H_𝔭≠0, equivalently H_𝔭=0 ⇒ L_𝔭^S(f,1)≠0. The elliptic (D,N)=1 inert instance is ArithmeticStatisticsPartVI, “Anticyclotomic main-conjecture implication”; GL₂-type coefficients and ramified Case I are proved here. Vanishing means L_𝔭^S(f) belongs to the height-one augmentation ideal (γ−1), which remains after inverting p. The reverse divisibility forces an augmentation divisor when X_∞ is torsion. Its coinvariants then have positive O-rank. For positive-rank X_∞, localization at the augmentation prime and Nakayama give the same conclusion directly. Faithful O→O^ur comparison descends it to O. Finite-error control gives positive corank for Sel_𝔭(W) and hence the nonzero rational kernel (skinner-2020, Proposition 2.7.3 and (2.7.2), p.347).

*Needs:* §2.2, §2.3; PadicMeasuresIwasawaAlgebras §§4.2, 4.6, 5.2 and gap:unramified-augmentation-divisor. No torsion or main-conjecture equality is added to the hypotheses.

**Checks.**

- X=Λ/(t²) has char=(t²)⊆(t) and coinvariant O-rank 1, so contributes a nonzero rational class. For Λ/(t−p), t acts as p and the coinvariant O/(p) has rank 0; its characteristic ideal is not contained in (t) after inverting p.
- A finite Λ/(p,t) has characteristic ideal (1) and coinvariant O-rank 0. It cannot create a height-one augmentation zero.
- For X=Λ, char=0 and coinvariant rank 1. The nontorsion argument is necessary even though ideal containment is automatic in that branch.

### Examples

Write t=γ−1. The examples Λ/(t), Λ/(p,t), Λ/(p) and Λ have respectively characteristic ideals (t),(1),(p),0 and coinvariant O-ranks 1,0,0,1. The bounded p-primary error Λ/(p) is infinite before rationalization and zero afterwards. With n=2 the inverse-character specialization has two negative weights. At p=5,a_p=1 the retained logarithmic Euler factor is 1, so it cannot itself create an augmentation zero.

### Dependencies

Layers 0–1; SelmerIwasawaCohomology §§2.10, 2.24, 3.8–3.16 and its strict-control gap; PadicMeasuresIwasawaAlgebras §§4.1–4.6 and 5.1–5.2; AutomorphicCongruences §2.22; GrossZagierAndArithmeticHeights §§9.21–9.22 and its Wan-period gap. The augmentation obstruction needs finite generation and finite-error control, not a conjectural equality of characteristic and analytic ideals.

## Layer 3: the quadratic-field p-converse

### 3.1 Theorem B

Let f be a normalized weight-two newform with trivial character and squarefree positive level N, p≥5, λ|p, and K imaginary quadratic of odd fundamental discriminant D. Assume exactly these arithmetic hypotheses:

1. p∤N and f is λ-ordinary.
2. The residual G_ℚ-representation is irreducible and ramified at an odd prime nonsplit in K.
3. Both 2 and p split in K.
4. If (D,N)>1, every prime dividing (D,N) has type St⊗ξ and every prime dividing N/(D,N) splits in K.
5. The finite Selmer group H¹_f(K,V) has L-dimension 1 and its actual restriction into the product of the two finite local spaces at p is injective.

Prove ord₁L(f/K,s)=1, rank_ℤ A_f(K)=d=ord₁L(A_f/K,s), and finiteness of the entire Sha(A_f/K). No uniqueness of λ|p, nondegeneracy of a p-adic height or full main-conjecture equality is required. The elliptic (D,N)=1 inert instance is ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”; GL₂-type coefficients and ramified Case I are proved here (skinner-2020, Theorem B p.331; §2.9 pp.348–349).

The ordinary parity contract gives global sign −1. Residual restriction and the local root numbers of gap:squarefree-base-change-signs, multiplied by GrossZagierAndArithmeticHeights §8.3, give the admissible Heegner geometry. Section 1.4 makes H_𝔭 zero, so §2.4 gives L_𝔭^S(f,1)≠0. Insert this into the supplied squared-log formula: the same normalized P_K(f) is nonzero. The height criterion gives order 1 for each appropriate newform base-change factor and order d for the abelian product. The Kummer injection bounds rank A_f(K) by d, and the nonzero M-component of the rational point supplies rank at least d.

For full Sha, the two nonnegative orders ord₁L(f) and ord₁L(f⊗χ_D) sum to 1. Apply the full GL₂-type forward theorem to each factor, including the possibly nonsquarefree twist, and use the quadratic isogeny/Sha comparison. This step proves entire Sha finiteness, not just finiteness at the coefficient prime. The supplied height and logarithm criteria refer to the same rational Hodge representative, coefficient projector, quotient and differential; no point or period is changed between them.

*Needs:* §0.1, §1.3–§1.4, §2.4; SelmerIwasawaCohomology gaps:gl2-rational-kummer, quadratic-abelian-sha and ordinary-root-number-parity; GrossZagierAndArithmeticHeights §§8.13, 8.17, 9.13, 9.16–9.22; GL2AutomorphicRepresentationsAndTransfer gap:squarefree-base-change-signs with GrossZagierAndArithmeticHeights §§4.2 and 8.3; HeegnerPointEulerSystems gap:gl2-full-forward; AutomorphicLFunctionsAndLocalFactors gap:gl2-analytic-products. The nonzero-value-to-point direction only needs the squared-log identity; the full point/value equivalence also uses the eigenlogarithm theorem.

**Checks.**

- When (D,N)=1 and two level primes are inert, condition 4 is vacuous, the global sign is −1 and Case II is allowed. Requiring all other level primes to split in this branch would wrongly exclude it.
- At d=2, newform base-change order 1 gives abelian order 2 and arithmetic rank 2. It does not assert abelian order 1.
- Orders (0,1) and (1,0) of the rational and twisted factors each sum to 1; both are permitted. Orders (1,1) sum to 2 and are excluded.
- The abstract torsion group ℤ/5 ⊕ ℚ₇/ℤ₇ has finite 5-primary subgroup and is infinite. Finiteness at the coefficient prime alone cannot supply the full-Sha conclusion; the forward theorem and quadratic comparison account for every primary component.
- The zero Heegner point gives logarithm 0 and analytic value 0. With c≠0, an analytic value c at logarithm 1 forces a nonzero point; replacing c by 0 would destroy this implication and is excluded by the period/Euler contract.

### Examples

The Case II pattern of two inert primes has N⁻ with even positive cardinality. A Case I pattern has one ramified St⊗ξ prime and all others split. In either case the finite Selmer line has zero strict kernel and the augmentation value is nonzero. For coefficient degree 2 the analytic and arithmetic ranks over K are both 2, while the single f/K factor has order 1.

### Dependencies

Layers 0–2; the exact sign, Kummer, parity, analytic-product and full-forward supplier contracts. The height and logarithm comparisons are supplied by GrossZagierAndArithmeticHeights; their source locators are Proposition 2.5.1 pp.340–341 and Proposition 2.6.1/Corollary 2.6.2 pp.343–344, of skinner-2020. These statements retain all coefficient embeddings and all local factors.

## Layer 4: prescribed quadratic twists and rational rank one

### 4.1 General quadratic nonvanishing with local prescriptions

For newforms g of level M₀ and g′ of level M′, both of weight k, and a fundamental discriminant δ, define `IsPrimitiveQuadraticTwist` g g′ δ to mean that a_q(g′)=χ_δ(q)a_q(g) for every prime q not dividing M₀M′δ, where a_q is the q-th Fourier coefficient at ∞ and χ_δ is `TauCeti.Multiquadratic.fundamentalDiscriminantChar`. At most one newform g′ satisfies it: by cross-level strong multiplicity one for newforms (ModularForms Layer 5), coefficients agreeing at all but finitely many primes away from both levels force equal levels, equal nebentypus and equality, so the nebentypus of g′ is not assumed in advance but recovered, and the fixed-level pinned theorem does not apply before that. The primitive associate of g⊗χ_δ (ModularForms Layers 4 and 9) satisfies it by the good-prime formula, so the predicate names that twist without constructing it, together with its ramified factors; when g has trivial nebentypus so does g′, since χ_δ²=1 away from δ. Its API is imported from those ModularForms targets: the predicate determines g′ uniquely; for (δ,M₀)=1 the twist has level M₀δ², each q|δ contributing the local conductor 2a(χ_δ,q) of GL2AutomorphicRepresentationsAndTransfer R16.3.5, and coefficients χ_δ(n)a_n(g) at every n; twisting the twist by the same δ returns g when (δ,M₀)=1, by χ_δ(q)²=1 at good q and the same uniqueness.

For every normalized cuspidal newform g of positive weight k, trivial nebentypus and positive level M₀ (its weight is then even), let ε(g)=i^k ε_(M₀)(g)∈{+1,−1} be its root number, the sign in Λ(s,g)=ε(g)Λ(k−s,g). For every finite set S₀ of rational primes containing all primes dividing M₀, prove the following two assertions on actual primitive quadratic twists. `infinite_twist_analyticRank_eq_zero`: there are infinitely many fundamental discriminants δ with ε(g)δ>0, χ_δ(q)=1 (q split in ℚ(√δ)) for every q∈S₀, and primitive twist g′ of analytic rank 0, that is L(g′,k/2)≠0. `infinite_twist_analyticRank_eq_one`: there are infinitely many fundamental δ with ε(g)δ<0, every prime of S₀ split, and primitive twist of analytic rank 1, that is ord_(k/2)L(g′,s)=1. The chosen fields avoid any prescribed finite list. The conductor M₀ may be nonsquarefree. Since every prime of M₀ splits, (δ,M₀)=1, the twist has level M₀δ² and L(g′,s)=Σχ_δ(n)a_nn^(−s), the series of the source, whose twisted sign is ε(g)χ_δ(−M₀)=ε(g)·sgn(δ) (bfh-1990, Introduction, functional equation and unnumbered Theorem (i)–(ii), printed pp.543–544).

Use the normalized primitive newform attached to the twist; coefficients a_nχ_δ(n) alone give an imprimitive series at common conductor primes. The metaplectic two-cusp coefficient, kernel and ramified local-test exports supply the double-series continuation and local factors. Complete the twist-residue and central-derivative comparison, positivity and noncancellation in the general theorem above, with the source’s even-weight/trivial-character hypotheses, rather than treating kernel nonvanishing as the final nonvanishing statement. Infinitude follows by enlarging S₀ with a ramified prime from each field of a finite excluded list: every returned field splits there and hence differs from that field. This also keeps the local conditions simultaneous (bfh-1990 §0 pp.543–546 and §9 pp.614–617).

To obtain the full local prescription needed here, first choose a negative odd fundamental D₀ realizing the specified local squareclasses, with 2,p split. At an odd ramified prime fix the entire local quadratic character. The Chinese remainder theorem and squarefree numbers in the resulting residue classes give such D₀; after fixing valuation 1 at the selected ramified primes, apply the residue-class theorem to the remaining squarefree factor. Put g equal to the primitive newform for f⊗χ_(D₀), and put every prime of 2pND₀ cond(g) in S₀. If ε(g)=+1 use the value branch, and if ε(g)=−1 use the derivative branch. In both cases the second discriminant δ is positive, coprime to D₀ and a square in every ℚ_ℓ for ℓ∈S₀. Then D=D₀δ is negative, odd and fundamental, and has exactly the original local characters at those primes. Primitive double twisting gives f⊗χ_D, including its ramified factors (skinner-2020 §3 pp.350–351 and §4 p.352; bfh-1990 pp.543–544).

*Needs:* MetaplecticAutomorphicForms §§8.85–8.87, with its preceding construction layers; ModularForms Layer 5, “Cross-level strong multiplicity one, for newforms”, for the uniqueness in `IsPrimitiveQuadraticTwist`, and Layers 4 and 9, “Inner twists”, for the primitive associate, the twisting API and double twisting; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3.5 and R17.4 for local characters and primitive twisting; AutomorphicLFunctionsAndLocalFactors AL.3 and gap:gl2-analytic-products; ArithmeticStatisticsPartI §0.6, “Squarefree integers in residue classes”, for the squarefree local-prescription existence; for the statement, Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.Newform.frickeSign`, `HeckeRing.GL2.Newform.analyticRank`, `TauCeti.Multiquadratic.IsFundamentalDiscriminant` and `TauCeti.Multiquadratic.fundamentalDiscriminantChar`. No arithmetic converse enters this theorem.

The quadratic-field selection API is:

- The chosen fundamental discriminant has the specified sign and full local squareclasses, hence the required split, inert or ramified places.
- In the value branch the central analytic order is 0; in the derivative branch it is 1.
- Enlarging the finite split set preserves every previous splitting condition.
- Every finite excluded list can be avoided while preserving both the local characters and the analytic conclusion.

**Checks.**

- With ε(g)=+1 the value branch has δ>0; with ε(g)=−1 the derivative branch has δ>0. Exchanging the branches gives a negative δ and changes an imaginary D₀δ to a positive discriminant.
- D₀=−7 and δ=17 are coprime fundamental discriminants, δ≡1 mod8, and D₀δ=−119 is fundamental and congruent to 1 mod8. This checks the sign and the split-2 condition only; it makes no claim of nonvanishing or of extra splitting for this pair.
- Locally at 3, 13≡1 mod3 is a square in ℚ₃, so multiplying the squareclass of 3 by 13 preserves it. Multiplication by the nonsquare unit 2 changes that ramified squareclass. The Dirichlet value at 3 is 0 in both cases and cannot distinguish them.
- An excluded field ℚ(√5) is ramified at 5; a returned field with 5 split cannot equal it. Enlarging the split set supplies avoidance without a quantitative counting claim.
- For g of level 11 and weight 2 (root number +1), take δ=−4 and S₀={11}: δ is fundamental, χ_(−4)(11)=−1 since 11≡3 mod 4, so 11 is inert and δ is not admissible; δ=5 has χ_5(11)=+1 (11≡1 mod 5), sign ε·sgn(5)=+1, as the value branch needs. A definition of splitting by χ_δ(q)≠−1 would wrongly admit ramified q.
- The predicate rejects the untwisted form: at a good q with a_q(g)=−2 and χ_δ(q)=−1 it demands a_q(g′)=2, so g′=g fails unless a_q(g)=0 at every such q.
- At δ=1 the character is trivial at level 1, the predicate reads a_q(g′)=a_q(g) at every prime away from M₀M′, and g′=g satisfies it; by the cross-level uniqueness it is the only solution, the degenerate member of the family.
- For g=Δ of level 1 and weight 12 and δ=5, χ_5(2)=χ_5(3)=−1 because 2 and 3 are nonresidues mod 5, so the predicate demands a_2(g′)=24 and a_3(g′)=−252 from τ(2)=−24 and τ(3)=252; the level-25 newform Δ⊗χ_5, of trivial nebentypus, has them, and Δ itself fails at q=2 because −24≠24.
- The predicate is a relation, not a function of g′: a CM newform g with self-twist character χ_(D_K) has a_q(g)=χ_(D_K)(q)a_q(g) at every good q, both sides vanishing at the primes inert in K, so for δ coprime to D_K the fundamental discriminants δ and δD_K name the same primitive twist; for the level-27 CM form with D_K=−3 and δ=5, the discriminants 5 and −15 give one g′. Uniqueness is of g′ given δ; δ is not recovered from g′.
- The rescaled cusp form 2g′ has the twisted coefficients up to the factor 2 but is not a candidate: its first coefficient is 2, whereas `HeckeRing.GL2.Newform` requires a₁=1, so the predicate is tested only on normalized newforms and a scalar multiple cannot satisfy it.
- A negative functional-equation sign permits an analytic germ (s−1)³ of order 3. A nonzero derivative, supplied by the derivative branch on the actual L-function, is the extra property giving order 1.

### 4.2 The auxiliary Heegner field

Suppose f satisfies the local alternatives of Theorem A below and w(f)=−1. Fix a good ordinary p≥5 and λ with residual irreducibility and an odd residual-ramified q|N. If π_q=St⊗ξ, prescribe q ramified and every other level prime split. If π_q=St, prescribe q and another distinct odd q′|N inert, with every other level prime split. Such q′ exists: either the local alternative supplies two odd St primes, or an odd St⊗ξ prime can serve as q′. Its type need not be untwisted St. Prove there are infinitely many imaginary quadratic K with odd D, 2,p split, the prescribed pattern, w(f/K)=−1 and L(f⊗χ_D,1)≠0 (skinner-2020 §3, pp.350–351; bfh-1990 introductory Theorem (ii), pp.543–544).

Apply §4.1 to the fixed locally prescribed first twist. The local signs give w(f/K)=−1 and therefore twist sign +1. Its positive second discriminant preserves all local squareclasses. For Theorem A, the ordinary-prime supplier permits p sufficiently large that every selected bad prime remains residually ramified. For C, p is fixed and the selected q must remain nonsplit. Its elliptic instance with (D,N)=1 and an inert residually ramified prime, the auxiliary twist with nonzero central value and prescribed splitting, is proved inside ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”; §4.2 proves the GL₂-type and ramified Case I versions. *Needs:* §4.1; GL2AutomorphicRepresentationsAndTransfer gap:squarefree-base-change-signs with GrossZagierAndArithmeticHeights §§4.2 and 8.3; AutomorphicGaloisRepresentations §7.7; the ordinary-root-number parity contract when the sign is inferred from arithmetic data.

The auxiliary-field API is:

- The returned negative fundamental discriminant has the prescribed ramification or inertness, with 2,p split.
- Its twist has nonzero central value, hence analytic order 0.
- The selected residual-ramified q remains inert or ramified.
- Any finite excluded set of quadratic fields can be avoided with every condition retained.

**Checks.**

- At a nonsplit-multiplicative q the ramified St⊗ξ contribution is +1, and the global sign with the archimedean factor is −1. A coprime-only twist-sign formula cannot be used at q.
- Two distinct odd inert primes give N⁻ with two factors and global sign −1; one inert prime gives sign +1 and fails the selection.
- Making every residual-ramified prime split makes B(b) false, even if the twist value is nonzero. If q has St type, q′ must be odd because 2 is prescribed split.
- A positive second discriminant δ that is square at the specified local fields preserves the negative sign of D₀δ and every local character; a merely positive δ that is nonsquare at a level prime would fail.
- Root number +1 allows central order 2. The selected twist instead has order 0 by nonvanishing; this separates the analytic selection from the local sign conditions.

### 4.3 Theorem A

Let f be a normalized weight-two newform of trivial character and squarefree N. Suppose either π_q=St⊗ξ for some odd q|N, or π_q₁=π_q₂=St for two distinct odd primes q₁,q₂|N. If rank_ℤ A_f(ℚ)=d and the entire Sha(A_f/ℚ) is finite, prove ord₁L(f,s)=1 and ord₁L(A_f,s)=d (skinner-2020, Theorem A p.330; §3 pp.350–351).

Squarefree level excludes CM by the self-twist derivation in the GL2AutomorphicRepresentationsAndTransfer contract. Choose a sufficiently large ordinary coefficient prime satisfying the residual conditions. The arithmetic Kummer and parity contracts give w(f)=−1. Choose K by §4.2. EllipticCurveModularityPartII §6.0e makes the complementary twist rank 0; its entire Sha is finite by ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, when d=1, the twist then being an elliptic curve, and by the full-forward contract when d≥2. Quadratic descent gives rank A_f(K)=d and finite Sha, so §1.2 supplies B(e) at the chosen λ. Apply B and subtract the twist’s order 0. Run the same deduction for every conjugate f^σ: its rational abelian isogeny class, rank/Sha hypotheses and special local alternatives are unchanged. Each factor has order 1, and only then does the conjugate product give order d.

*Needs:* §1.2, §3.1, §4.2; AutomorphicGaloisRepresentations §§7.5–7.7; GL2AutomorphicRepresentationsAndTransfer gap:squarefree-base-change-signs, with R16.3.2 and R16.4.6 for the non-CM derivation; SelmerIwasawaCohomology coefficient, quadratic and root-parity contracts; EllipticCurveModularityPartII §6.0e; ArithmeticStatisticsPartVI “Heegner logarithm and low rank” for d=1 or the HeegnerPointEulerSystems full-forward contract for d≥2; AutomorphicLFunctionsAndLocalFactors analytic-product contract.

**Checks.**

- For d=1 the arithmetic rank and the final analytic order are both 1. For d=2 two conjugate orders 1 give 2; proving order 1 in a single embedding would not by itself establish the product claim.
- There may be several λ|p. The prime-selection theorem requires some ordinary λ and all sufficiently large λ residually admissible; no uniqueness of λ is needed.
- An odd St⊗ξ prime alone satisfies the first local alternative. A conductor 2q with only split multiplicative types at 2 and q has only one odd St prime and fails both alternatives.

### 4.4 Theorem A′

Let E/ℚ be semistable. Assume a nonsplit multiplicative odd prime, or split multiplicative reduction at two distinct odd primes. If rank_ℤ E(ℚ)=1 and Sha(E/ℚ) is finite, prove ord₁L(E,s)=1. Modularity gives a weight-two trivial-character newform of squarefree conductor; the local dictionary identifies the two alternatives, and rational-isogeny comparison transports the rank and entire Sha finiteness to its modular abelian variety. Apply A (skinner-2020, Theorem A′ pp.330–331).

*Needs:* §4.3, with ArithmeticStatisticsPartVI “Heegner logarithm and low rank” as its elliptic forward input; EllipticCurveModularity R29.5–R29.6; Mathlib `WeierstrassCurve.localPolynomial`, AutomorphicGaloisRepresentations §6.4 and GL2AutomorphicRepresentationsAndTransfer R16.3.2 for the multiplicative dictionary; EllipticCurves Layers 4–5 and 7; SelmerIwasawaCohomology §2.12a for entire-Sha isogeny invariance.

**Checks.**

- Nonsplit multiplicative reduction corresponds to a_q=−1 and St⊗ξ, while split multiplicative reduction corresponds to a_q=+1 and St. Reversing the dictionary exchanges the two alternatives.
- Two split multiplicative primes, both odd, satisfy the second alternative; replacing one by 2 leaves only one odd prime and no longer satisfies it.
- A rational isogeny has finite kernel and cokernel on rational points after tensoring with ℚ, so rank 1 maps to rank 1. Entire Sha finiteness is transferred by the §2.12a descent sequences for the isogeny and a dual isogeny, each with finite kernel on Sha.

### Examples

The first local pattern ramifies an odd St⊗ξ prime. The second makes two odd level primes inert. Both give sign −1, whereas a single inert prime gives +1. With a fixed negative D₀, a positive split-at-S₀ second discriminant preserves the local pattern and provides the nonzero value branch for w(f)=−1. For coefficient degree 2, the resulting rational abelian order is 1+1=2.

### Dependencies

Layers 0–3; MetaplecticAutomorphicForms §§8.85–8.87; the general twisting, analytic-factor and squarefree-density inputs of §4.1; AutomorphicGaloisRepresentations §§7.5–7.7; GL2AutomorphicRepresentationsAndTransfer R16.3, R16.4.6 and R17.4; EllipticCurveModularity R29.5–R29.6; EllipticCurveModularityPartII §6.0e; ArithmeticStatisticsPartVI “Heegner logarithm and low rank” for coefficient degree one; ModularForms Layers 4, 5 and 9 for the primitive-twist predicate; the full-forward, quadratic and root-parity supplier contracts. The general nonvanishing theorem precedes the arithmetic converses and is independent of them.

## Layer 5: the finite-Selmer criterion

### 5.1 A mod-p Selmer line detects rational localization

Let E/ℚ have good reduction at p≥5 and irreducible E[p]. Suppose the actual finite Selmer group Sel_p(E) is an 𝔽_p-line and its localization in E(ℚ_p)/pE(ℚ_p) is not contained in the image of E(ℚ_p)[p]. Prove Sel_(p∞)(E/ℚ)≅ℚ_p/ℤ_p as a ℤ_p-module, dim_ℚp H¹_f(ℚ,V_pE)=1, and injectivity of restriction to H¹_f(ℚ_p,V_pE). No finiteness of Sha is assumed. For squarefree conductor with at least two odd prime factors the elliptic deduction is part of ArithmeticStatisticsPartVI, “Rank one selmer criterion”; the local comparison and pairing argument are stated here for every good p≥5 with no conductor condition (skinner-2020, proof of C, §3 p.351; poonen-stoll, §1 pp.1–2 and Theorems 5 and 8, Corollaries 6–7 and 9, §§5–6 pp.10–12).

Irreducibility implies E(ℚ)[p]=0, so finite-to-infinite comparison identifies Sel_(p∞)[p] with Sel_p. Finite cotype leaves either a divisible line or a nonzero finite cyclic p-group. In the finite case the Mordell–Weil rank is zero and Sha[p∞] is finite cyclic. The elliptic perfect alternating Cassels–Tate pairing excludes this case: every alternating pairing on a cyclic group vanishes. Thus the p∞ Selmer group is the divisible line. At good p≥5 the kernel of reduction E₁(ℚ_p) is torsion-free (EllipticCurves gap:formal-group-p-torsion, stated for p≥3), so E(ℚ_p)[p∞] injects into Ẽ(𝔽_p), and the Hasse bound #Ẽ(𝔽_p)<p² gives E(ℚ_p)[p∞]=E(ℚ_p)[p]. The torsion-avoidance condition makes the localization of that divisible line nonzero; rational Kummer comparison then gives a nonzero map on a one-dimensional source, hence injectivity.

*Needs:* EllipticCurves Layers 1, 3–4 and 7 and gap:formal-group-p-torsion; SelmerIwasawaCohomology §§2.12–2.12a, 4.26, 4.29 and gap:good-local-torsion-comparison. This theorem uses the local Kummer condition, not a raw unramified finite-level replacement.

**Checks.**

- For p=5, a cyclic group ℤ/25 has cardinality 25, a square, but b(ng,mg)=nm b(g,g)=0 for every alternating form. Square cardinality cannot replace perfect alternation.
- ℚ_p/ℤ_p has p-torsion 𝔽_p and rational Tate module dimension 1; ℤ/p² also has p-torsion 𝔽_p but rational Tate module 0. The pairing argument separates these alternatives.
- At p=5, #E(𝔽₅)≤10<25, so injective reduction gives local p-primary torsion order at most 5 and exponent at most 5. The analogous bound at p=3 is 7<9, but the theorem’s p≥5 hypotheses and specified global suppliers remain; no p=3 converse is asserted.
- The torsion-freeness of E₁(ℚ_p) is the input that bounds the p-part, and p≥3 is sharp for it: a formal-group point of exact order p has parameter valuation at most v(p)/(p−1), which is 1/(p−1)<1 for p≥3 but 1 for p=2, and the multiplicative formal group over ℤ₂ realizes it, [2](−2)=(1−2)²−1=0 with v(−2)=1. With only the pinned prime-to-p lemmas nothing bounds E(ℚ₅)[5∞].
- In the local model lim_n E(ℚ_p)/p^nE(ℚ_p)≅ℤ_p⊕ℤ/p of the p-adically completed point group, the torsion image modulo p is the second coordinate. The class (1,0) lies outside it and has nonzero rational component; (0,1) lies inside it and has rational component 0.

### 5.2 An odd residual-ramified bad prime

Let E/ℚ be semistable, p≥5 a good ordinary prime and E[p] irreducible. Prove that E[p] is ramified at an odd q|N, with N its conductor. If every odd bad prime were residually unramified, weight-two level lowering removes them one at a time. Good reduction at p supplies the finite-flat coefficient-prime condition, and the trivial nebentypus is retained. The resulting weight-two form has level dividing 2. The genus-zero modular curves X₀(1), X₀(2) have no regular differentials, so S₂(Γ₀(1))=S₂(Γ₀(2))=0, a contradiction (skinner-2020 §3 p.351).

*Needs:* SerreWeightAndLevelOptimisation §§2.10 and 4.7–4.8; EllipticCurveModularity’s residual realization; ModularForms Layer 10B for the genus formula at X₀(1), X₀(2), and ModularCurvesPartII §7.2 for the weight-two differential identification. This uses the specified p, with no large-image or sufficiently-large-p replacement.

**Checks.**

- Removing every odd prime from squarefree N leaves N′∈{1,2}. The genus formula gives 1+1/12−1/4−1/3−1/2=0 at level 1 and 1+3/12−1/4−0−2/2=0 at level 2, hence cusp dimensions 0,0. A nonzero weight-two witness cannot remain.
- If odd q remains residually ramified, its conductor exponent is 1 and the lowering hypothesis at q fails, so the contradiction cannot remove it.
- A reducible residual representation can be Eisenstein and fails the irreducible lowering hypothesis. The reducible mod-5 representation of the semistable curve 11a1 therefore is not a counterexample to this argument.

### 5.3 Theorem C

Let E/ℚ be semistable with a nonsplit multiplicative odd prime or two distinct split multiplicative odd primes. Fix p≥5 good ordinary such that E[p] is irreducible, Sel_p(E) is an 𝔽_p-line, and its localization in E(ℚ_p)/pE(ℚ_p) is not contained in the image of E(ℚ_p)[p]. Prove rank_ℤ E(ℚ)=ord₁L(E,s)=1 and finiteness of the entire Sha(E/ℚ). The rank-one conclusion for at least two odd prime factors is ArithmeticStatisticsPartVI, “Rank one selmer criterion”; the single odd nonsplit multiplicative alternative and the full Sha conclusion are proved here (skinner-2020, Theorem C p.332; §3 p.351).

Section 5.1 gives the rational Selmer line and local injection; parity gives sign −1. Section 5.2 selects an odd residual-ramified q for this very p. Section 4.2 keeps q nonsplit, choosing it ramified for St⊗ξ, or choosing it and another odd q′ inert for St. The complementary twist E^D has analytic order 0; EllipticCurveModularityPartII §6.0e gives rank 0 and ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, finite Sha of this elliptic twist, hence zero rational Selmer. Quadratic decomposition now gives the base-change Selmer line with injective semilocal restriction. Theorem B and subtraction of the twist’s order give ord₁L(E)=1. The elliptic forward theorem over ℚ, the same ArithmeticStatisticsPartVI target, gives arithmetic rank 1 and finite entire Sha.

*Needs:* §5.1–§5.2, §4.2, §3.1; SelmerIwasawaCohomology quadratic and ordinary-root-number parity contracts; EllipticCurveModularityPartII §6.0e; ArithmeticStatisticsPartVI “Heegner logarithm and low rank” (the elliptic forward theorem over ℚ); the modular and actual analytic-product comparisons. The global finite-Sha conclusion is obtained after the analytic converse and is not inserted as a premise.

**Checks.**

- For a fixed p the chosen residual-ramified q cannot be replaced by a prime that is ramified only for another coefficient prime; condition B(b) would then be unsupported.
- Over K, the rational Selmer dimensions add as 1+0=1. If the twist instead had dimension 1, the sum would be 2 and B(e) would fail.
- If the mod-p local image is contained in the local torsion image, its rational component may be 0; the line condition alone does not prove the injection.
- The conclusion includes every primary part of Sha. A bound at p alone cannot yield that conclusion; the full forward theorem is used after analytic order 1 is established.

### Examples

For the local model ℤ_p⊕ℤ/p, the residue (1,0) detects the rational line while (0,1) detects only torsion. The finite cyclic order-p² alternative has a one-dimensional p-torsion subgroup but no perfect alternating pairing. The base-change dimensions 1+0=1 and the fixed-prime field choice together recover the hypotheses of B without any starting finiteness assumption on Sha.

### Dependencies

Layers 1, 3 and 4; EllipticCurves Layers 1, 3–5 and 7 and gap:formal-group-p-torsion; SelmerIwasawaCohomology §§2.12–2.12a, 4.26, 4.29 and the local-torsion, quadratic and root-parity contracts; SerreWeightAndLevelOptimisation §§2.10 and 4.7–4.8; ModularForms Layer 10B and ModularCurvesPartII §7.2; EllipticCurveModularity; EllipticCurveModularityPartII §6.0e; ArithmeticStatisticsPartVI “Heegner logarithm and low rank”. The rank-one counting applications use this conclusion without entering its proof.

## Layer 6: the rational rank-zero converse

### 6.1 Base change with a derivative twist

Let f satisfy the squarefree and local alternatives of A, with A_f(ℚ) finite and Sha(A_f/ℚ) finite. Choose a sufficiently large ordinary p,λ as in §4.3. Prove the existence of imaginary quadratic K with odd D, 2,p split and the same admissible local pattern, such that ord₁L(f⊗χ_D)=1, rank_ℤ A_f(K)=d, Sha(A_f/K) is finite and B(e) holds (skinner-2020 §4 pp.351–352; bfh-1990 introductory Theorem (i), pp.543–544).

Kummer and parity give rational Selmer dimension 0 and w(f)=+1. The local pattern still gives w(f/K)=−1, hence the twist has sign −1. Choose D₀ with this pattern and apply §4.1 to g=f⊗χ_(D₀) using the derivative branch: ε(g)=−1 forces δ>0. Take all primes of 2pND₀ cond(g) in the split set. Then D=D₀δ remains negative fundamental with the same full local characters, and its primitive twist has a simple zero. The full forward theorem makes A_f^D rank d with finite entire Sha; quadratic comparison gives the corresponding arithmetic conditions over K. Section 1.2 supplies B(e) at the selected λ. This construction uses no rank-one or negative-sign assumption on the original f.

*Needs:* §4.1 and the local prescriptions of §4.2; §1.2; AutomorphicGaloisRepresentations §§7.5–7.7; GL2AutomorphicRepresentationsAndTransfer gap:squarefree-base-change-signs with GrossZagierAndArithmeticHeights §§4.2 and 8.3; SelmerIwasawaCohomology coefficient, quadratic and root-parity contracts; HeegnerPointEulerSystems full-forward contract. The analytic simple zero is obtained before invoking B.

**Checks.**

- Rational sign +1 and twist sign −1 multiply to base-change sign −1. The nonzero value branch would instead force twist order 0 and could not supply this rank-d arithmetic base change.
- The arithmetic ranks add as 0+d=d. For d=2 this is 0+2=2, yielding a one-dimensional coefficient Selmer group rather than a two-dimensional one.
- If the twist merely had root sign −1, order 3 would remain possible. The derivative branch gives a nonzero first derivative and order 1, which is the input to the forward theorem.
- A positive δ square at every specified local field preserves D₀’s negative sign and residual nonsplit prime; a negative δ would produce a positive D and fail the imaginary-quadratic hypothesis.

### 6.2 Theorem E

Let f be weight two with trivial character, squarefree N and the same two local alternatives as A. If A_f(ℚ) and Sha(A_f/ℚ) are finite, prove L(f,1)≠0, equivalently ord₁L(f)=0, and ord₁L(A_f)=0. Apply §6.1 and B to get base-change order 1 while the twist already has order 1. Additivity of the actual analytic orders forces the original order to be 0. Repeat for every Galois conjugate, retaining the same arithmetic isogeny class and local alternatives, and then multiply their nonzero values (skinner-2020, Theorem E and proof, pp.351–352).

*Needs:* §6.1, §3.1; AutomorphicLFunctionsAndLocalFactors gap:gl2-analytic-products. This theorem is the squarefree local-type rank-zero converse, with no claim about additional main-conjecture or CM branches.

**Checks.**

- Base-change order 1 minus twist order 1 is 0. A twist order 0 instead would give original order 1 and prove the wrong conclusion.
- For d=2, each conjugate order 0 gives product order 0+0=0; nonvanishing of only one conjugate factor would not establish this.
- If the original factor had order 2 and the twist order 1, the product would have order 3, contradicting B’s order 1. Nonnegative analytic orders rule out cancellation of zeros.

### Examples

With rational arithmetic rank 0 and a derivative twist of arithmetic rank d, quadratic base change has rank d. The local signs are the same −1 patterns as Layers 0, 3 and 4, and the p-Euler factor at p=5,a_p=1 is still 1. The final analytic order subtraction is 1−1=0 in each coefficient embedding. A value-nonvanishing twist belongs to the rank-one construction and would give 1−0=1 instead.

### Dependencies

Layers 1, 3 and 4; the full-forward, quadratic, parity and analytic-product supplier contracts. Layer 6 changes the analytic branch in the quadratic nonvanishing theorem, while retaining every local condition used for B.

## Downstream consumers

Ordinary anticyclotomic and rank-zero/rank-one BSD applications can use the localization criterion and augmentation obstruction with the same local conditions. Such applications import these conclusions and do not supply any prerequisite back to this roadmap. The complementary imaginary-quadratic twist branches for a rational elliptic curve, with a finite set of primes split, infinitely many fundamental discriminants and twist analytic order 0 or 1 according to the root number, are the weight-two, coefficient-degree-one case of §4.1 and are imported from it.

## Worked examples

1. **Degree-two coefficients.** For M of degree 2, arithmetic rank A(K)=2 and finite Sha[p∞] give a one-dimensional finite Selmer group at each λ. The two local H¹ spaces have dimensions 2,2; the global semilocal image has dimension 2 and its finite intersection dimension 1. Strict kernels vanish. A nonzero supplied squared-log value gives a nonzero point and base-change analytic order 2 for A, equal to 1+1 over the two newform embeddings.
2. **Ramified modular geometry.** Choose one odd q with St⊗ξ, ramify q in K and split every other level prime, 2 and p. The finite sign contribution is +1 and the infinite contribution −1. The coefficient at a permitted ℓ=2,a₂=0 is −1/3, so a numerator 3 gives the normalized point −1. Its logarithm squared is unchanged by the two minus signs in an equivalent auxiliary normalization.
3. **Quaternionic geometry.** Make two distinct odd level primes inert and all others split. Then N⁻ has two factors, giving an indefinite quaternion algebra, and the sign is −1. With only one inert factor the sign is +1 and the same B hypotheses cannot hold.
4. **Augmentation and bounded errors.** Λ/(t²), Λ/(p,t), Λ/(p), Λ have coinvariant ranks 1,0,0,1. The second module is finite pseudo-null, the third infinite bounded p-primary, and the fourth nontorsion. The obstruction proof uses the first and fourth branches and retains the two different error notions.
5. **Finite-Selmer versus local torsion.** Sel_p≅𝔽_p allows both a divisible Selmer line and a cyclic finite p-group before duality is used. The cyclic alternative has zero alternating pairing. In the local model ℤ_p⊕ℤ/p, (1,0) modulo p avoids torsion and detects rational localization, while (0,1) does not. These two tests are separate inputs to C.
6. **The two twist branches.** For rational sign −1, the prescribed twist has sign +1 and the value branch gives order 0, so B yields 1−0=1. For rational sign +1, the prescribed twist has sign −1 and the derivative branch gives order 1, so B yields 1−1=0. A root sign alone supplies neither nonzero value nor nonzero first derivative.

## References

Locators name the theorem, section and printed page of the linked version of each source; published and author-copy pagination are distinguished.

- **skinner-2020.** Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Annals of Mathematics 191 (2020), 329–354. Published Theorems A, A′, B, C, E; §§2–4.
- **bsw-2026.** Ashay Burungale, Christopher Skinner and Xin Wan, [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), arXiv:2603.20886v2 (2026). Theorem 1.1 p.3; Theorem 2.3 and Remark 2.4 pp.4–5; proofs §4 pp.9–11.
- **wan-2020.** Xin Wan, [Iwasawa main conjecture for Rankin–Selberg p-adic L-functions](https://msp.org/ant/2020/14-2/ant-v14-n2-p04-p.pdf), Algebra & Number Theory 14 (2020), 383–483. Published ordinary version of arXiv:1408.4044; Theorem 1.2 pp.385–386, §2B–C pp.392–394, §7E pp.445–449 and proof pp.479–480.
- **brooks-2015.** E. Hunter Brooks, [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), International Mathematics Research Notices 2015 (12), 4177–4241. Published institutional copy, §2.7 p.4190; Theorem 8.11 pp.4237–4238; Propositions 8.12–8.13 p.4239. The supplied weight-two formula retains the logarithm square of Theorem 8.11 and the source domain in pullback functoriality.
- **skinner-urban-author.** Christopher Skinner and Eric Urban, [The Iwasawa main conjectures for GL₂](https://www.math.columbia.edu/~urban/eurp/MC.pdf), author copy of the 2014 work. Section 3.1.6 pp.19–20; Proposition 3.2.8 and Corollary 3.2.9 pp.23–24; these are author-copy pages.
- **poonen-stoll.** Bjorn Poonen and Michael Stoll, [The Cassels–Tate pairing on polarized abelian varieties](https://math.mit.edu/~poonen/papers/sha.pdf), 1999 author copy. Sections 1 and 5–6, Theorems 5 and 8, Corollaries 6–7 and 9, author-copy pp.1–2,10–12. The elliptic rational origin gives alternation; general principally polarized varieties need not have an alternating pairing.
- **bfh-1990.** Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Inventiones Mathematicae 102 (1990), 543–618. Introduction, unnumbered Theorem (i)–(ii), pp.543–544; local-twist discussion pp.544–546; proof §9 pp.614–617.
