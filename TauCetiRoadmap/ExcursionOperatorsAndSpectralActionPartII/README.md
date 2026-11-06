# Roadmap: excursion operators and the spectral action, part II

**Summary.** The excursion operators, the geometric spectral action on D_lis(Bun_G), its centre map and the semisimple parameter of Fargues–Scholze are constructed in AutomorphicGaloisRepresentationsPartII AG2.6, which stops at the construction. This Part II starts from that centre map Ψ_G, imported in §0.0, and proves that its image in the smooth Bernstein centre consists of very stable distributions for every connected reductive group over every p-adic field. The proof runs through a quantitative Hecke averaging theorem, and very stability gives constancy of the semisimple parameter on the constituents of every atomically stable virtual character. For each extended pure inner form of a quasi-split group, it constructs a surjection between the two image centres and proves compatibility with normalized Levi restriction, stable tempered character transfer and matching test functions (H26, Theorems 1.1 and 1.4, pp. 2–3; H26 line 70 and line 114).

## Scope and ownership

The geometric Hecke functor is AutomorphicGaloisRepresentationsPartII AG2.6's `HeckeFunctor` (“Bundle strata, lisse categories and the geometric Hecke action”), extended to solid coefficients, arbitrary legs and bounds by HeckeStacksAndLocalShtukas HS1 and HS4. The finite wild bound of each compact lisse object, the geometric spectral centre action on D_lis(Bun_G), its Hecke commutation, its stratum restrictions Ψ_G^b and its neutral restriction Ψ_G come from AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”, and so does the semisimple parameter of a Schur-irreducible object. This roadmap imports that action and proves no second construction of it; the universal spectral action of FS24 Chapter X is used by no target here. IgusaVarietiesAndTorsionConcentration §3.0i restricts the same action to its Igusa coefficient categories, and its §7.9a proves normalized Levi compatibility of the parameter only for GL_n, its inner forms and their products; neither is consumed. LanglandsParameterStacks §§1.2, 3.6 and 3.9 supply the spectral algebra and semisimple reconstruction. Section 0.0 owns only two comparisons for every connected reductive G: restriction to a basic stratum equals the intrinsic map of G_b, and normalized spectral Levi compatibility. The remaining targets are the stable and very stable central conditions, their character criteria, decategorified character operators, quantitative averaging, the stability argument and its atomic and inner-form consequences.

SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.1.1, SR.2.2 and SR.3.1–SR.3.3 own the smooth category, convolution, normalized induction, finite length, Bernstein decomposition and centre. EndoscopicTransferAndUnitaryTraceComparison §§1.3, 1.13–1.16, 2.1, 2.4, 2.11, 2.16 and 4.7 own stable conjugacy, signs, orbital measures, matching, local character theory, Weyl integration and smooth transfer. The stable harmonic analysis beyond those sections (character independence, Kazhdan density and the cuspidal splitting, Arthur's elliptic decompositions, the unstable-function criterion, the stable projection, compact elliptic orbital supports, finiteness of torus classes, inversion of stable orbital integrals and inner-form character transfer) is requested from EndoscopicTransferAndUnitaryTraceComparison; the all-weight shriek trace theorem and the general parabolic excursion comparison from HeckeStacksAndLocalShtukas; the distribution realization and Levi restriction of the Bernstein centre from SmoothRepresentationsOfLocalGroups; and the invariant comparison, weight fibres and basic Levi lifts from BunGAndNewtonStrata. These are the exact supplier contracts below; no layer here proves them.

BunGAndNewtonStrata §§0.6, 1.11, 1.13, 1.18–1.19, 1.23 and 1.36 own the Kottwitz set B(G), basic classes, inner forms, acceptable pairs and the integral torus Kottwitz description; the coefficient field and Frobenius of its G-isocrystals are those of VectorBundlesAndIsocrystals Layer 0. GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”, and ReductiveGroupsPartII §RG2.5 own the dual-group and Satake dictionary; GeometricSatakeAndFusion GS4, “Frobenius traces and classical spherical Satake”, §§4.26 and 4.29, owns the normalized spherical trace function and its classical Satake comparison. RepresentationTheory/LieHighestWeight Layer 6 owns the general Weyl formulas. ReductiveGroups Layer 10 supplies the rational algebraic representations, their integral torus characters including central weights, and the Weyl character formula; §2.2 specializes that formula.

The finite-support carrier, finite arithmetic mean, finite abelian Fourier basis, exact Grothendieck group and quotient-to-image equivalence are already in the library; their exact declarations are consumed below. The averaging kernel of §2.3 differs from generic finite Fourier theory by using the actual stable-class invariant and the weight multiplicities of the specified dual-group representations. The image-centre map of §5.2 differs from the generic first isomorphism theorem by the geometric kernel inclusion of §5.1 that makes it applicable.

The quasi-split assertion that the spectral map is injective and has image the whole stable centre is the separate expectation following FS24 Conjecture I.9.5, p. 35 (FS24 line 1298), and is outside this roadmap. Conjecture I.9.5 itself concerns rationality and independence of ℓ (FS24 line 1294). The end theorems here concern inclusion and image quotients. Section 4.3 applies to any finite set of irreducibles with atomically stable character sum; construction and atomic stability of Kaletha’s regular supercuspidal packets, and identification with their defining parameter, are outside its scope (H26, p. 2; H26 line 79).

## Conventions

Let E be any finite extension of ℚ_p, and G a smooth connected reductive E-group. In particular p is prime, the residue cardinality q is at least 2, and E has characteristic zero. Fix ℓ ≠ p, an algebraic closure ℚ̄_ℓ, a field isomorphism ι:ℚ̄_ℓ≃ℂ, a compatible square root of q, and compatible Haar and quotient measures. All representation and spectral coefficients are transported through this fixed dictionary. Continuity of Weil parameters is imposed in the supplied ℓ-adic or relatively discrete coefficient topology before transport; the field isomorphism is not assigned continuity for the usual complex topology (H26, p. 2, footnote 1; H26 line 91; FS24, §I.9, pp. 34–35).

Put Z_spec(G)=O(Z¹(W_E,Ĝ)_(ℚ̄_ℓ))^Ĝ, the ring of global functions on the stack of L-parameters. By LanglandsParameterStacks §1.2 it is the product of the invariant coordinate rings of the disjoint clopen wild-kernel strata; the finite-wild pieces indexed by open wild subgroups themselves overlap and are not the factors of this product. Use the same notation after transport by ι (FS24, Definition I.9.2(iii), p. 35, and proof of Theorem IX.5.2, p. 329; FS24 line 1276 and line 12755).

Write H(G) for the locally constant compactly supported complex functions on G(E), Z(G) for its smooth Bernstein centre realized as essentially compact invariant distributions, and Ψ_G:Z_spec(G)→Z(G) for the spectral map. Essential compactness means that central convolution takes H(G) to H(G). Set Z_FS(G)=range(Ψ_G), with its image-algebra structure. Work in fixed universes containing E, its separable closure, the smooth categories and their essentially small finite-length subcategories; representation indices in finite character sums are isomorphism classes. No cardinality cutoff restricts G or the representation dimensions (H26, §§1.1 and 2.1; H26 line 32 and line 217).

Distribution evaluation z(f) is scalar; z∗f is a test function. Fix usual convolution by `(z*f)(x) = z(g -> f(g^(-1)*x))`. Put `f^vee(g) = f(g^(-1))` and `z^vee(f) = z(f^vee)`. Then `(z*f)(1) = z(f^vee)` and `delta_1(z*f^vee) = z(f)`. The reductive local group is unimodular. For central distributions, `(y*z)(f) = y(z^vee*f)`, and character action is `(z*Theta)(f) = Theta(z*f)`; in prose use z·Θ for this dual action. On an irreducible π, z_π is its scalar. These conventions specify the inversion in the distributional proofs (H26, Lemma 2.3, p. 6; H26 line 283).

Write D(G) for finite complex linear combinations of irreducible finite-length Harish-Chandra characters, D_temp(G) for the tempered span, and D_ell(G) for Arthur's elliptic tempered summand. D_ind(G) denotes the span of proper parabolic inductions in D(G); its intersection with D_temp(G) is the induced summand of the tempered decomposition. Prefix S means the stable subspace. I(G) is H(G) modulo the common kernel of regular orbital integrals; I(G)_cusp consists of classes with every proper-Levi normalized constant term zero, equivalently, by gap:kazhdan-cuspidal-decomposition, with vanishing orbital integrals at every non-elliptic regular semisimple element. The ordinary Arthur summands are centrally invariant; their stable refinements and duality are part of the harmonic-analysis contract (H26, §2.1, pp. 4–6; H26 line 181, line 223 and line 255).

U(G) is the common kernel on H(G) of the strongly regular stable orbital integrals SO_γ of EndoscopicTransferAndUnitaryTraceComparison §2.4, and a central distribution is stable if it vanishes on U(G) (H26 line 39 and line 286). Section 2.4's interface calls a distribution stable if it lies in the closed span of the SO_γ, without naming a topology; for the weak-* closure, pointwise convergence on H(G), that closed span is exactly the annihilator of U(G), by the bipolar theorem for the pairing of H(G) with its algebraic dual. This roadmap uses the annihilator condition. U(G) consists of functions whose stable orbital integrals vanish on every strongly regular semisimple stable class. An elliptic element means a strongly regular semisimple element with elliptic maximal-torus centralizer. R_g is the finite nonempty set of rational conjugacy classes in its stable class, and D_G(g) is the Weyl discriminant. Characters are evaluated only on their regular locus. A discriminant-weighted factor is extended by zero outside that locus only for the integration estimates (H26, Lemma 2.6 and §2.3; H26 line 368 and line 497).

For P=MU use normalized induction `i_P^G(tau) = Ind_P^G(delta_P^(1/2)*tau)`, with `delta_P(m) = |det(Ad(m) on Lie U)|_E`. Use geometric reciprocity and the spectral normalized-induction dictionary whose half-modulus and cyclotomic corrections cancel, leaving ordinary dual-Levi restriction. Rank induction uses absolute semisimple rank. For quasi-split G* and basic b∈B(G*), put G=G*_b; the inner-form theorems concern these extended pure inner forms. On matching elliptic elements transfer is `(Trans_G Theta)(g) = e(G)*Theta(g*)`, with e(G*)=1 and the Kottwitz sign e(G). Normalize matching functions by the dual identity `Theta(f*) = Trans_G(Theta)(f)` (H26, pp. 12–13; H26 line 594).

Hecke labels in the character formulas mean the Hansen/HKW convention: forward uses V_μ dual and reverse uses V_μ, with b∈B(G,μ) and κ(b)=μ^♯, so that the reverse operator i_b^* T_(V_μ) i_(1!) carries the neutral stratum to the stratum of b (H26 line 410; HKW22, Lemma 6.4.4 and Fact 3.2.3, HKW22 line 2991 and line 637). The supplier's functor is AutomorphicGaloisRepresentationsPartII AG2.6's `HeckeFunctor`, written T^AG_V here, whose restriction to lisse objects HeckeStacksAndLocalShtukas §HS1.2 identifies with its own T_V; its labels are opposite to Hansen's. For G=GL₁ the supplier's T^AG_(χ_n) carries the stratum of Kottwitz invariant κ to κ−n (AG2.6's torus Check, degree d to d+1 for n=1; HeckeStacksAndLocalShtukas §HS3.10's torus test κ(b)=κ(b′)−n), whereas Hansen's reverse operator for μ=n carries κ=0 to κ(b)=μ^♯=n. Hence Hansen's T_V is the supplier's T^AG_(V^∨), which for the characteristic-zero irreducibles used here is T^AG_(θ*V) with θ the pinned Chevalley involution of AG2.6: the forward operator i_1^* T_(V_μ^∨) i_(b!) of §1.4 is the supplier's i_1^* T^AG_(V_μ) i_(b!), the reverse i_b^* T_(V_μ) i_(1!) is the supplier's i_b^* T^AG_(V_μ^∨) i_(1!), and the basic class b, its invariant κ(b)=μ^♯ and the duality are transported together. An excursion operator with datum (I,V,α,β,(γ_i)) in Hansen's labels is the HeckeStacksAndLocalShtukas §HS4.2 create–Weil-action–annihilate composite on the family V↦T^AG_(θ*V); that family is the one AG2.6 feeds to its universal equivalence, so these composites are AG2.6's normalized `excursionOperator` and `geometricSpectralAction`, and the raw composites on V↦T^AG_V, the pullback of that action along φ↦θ∘φ, are used nowhere here. The all-weight trace contract is stated in Hansen's labels; it is not an identification of star and shriek extensions (H26 line 408; HKW22 line 3004).

**Checks.**

- For a central element t in a torus, z=δ_t gives `(z*f)(1)=f(t^(-1))` and `delta_1(z*f^vee)=f(t)`. Choose a compact open test with f(t)=1 and f(t⁻¹)=0 when t²≠1. Omitting inversion changes 1 to 0.
- For the upper Borel of GL₂ and m=diag(ϖ,1), δ_P(m)=q⁻¹ and its square root is q⁻¹ᐟ². With K=GL₂(𝒪_E) of volume 1 and normalized induction from unramified torus values 2 and 3, the raw double-coset operator 1_(K diag(ϖ,1) K) has eigenvalue √q(2+3)=5√q, while the Satake-normalized operator q^(−1/2)·1_(K diag(ϖ,1) K) attached to the standard dual representation has eigenvalue 2+3=5 (GeometricSatakeAndFusion GS4, “Frobenius traces and classical spherical Satake”, §4.26, normalized Frobenius function, and §4.29, classical and geometric Satake comparison); at q=2 these are 5√2 and 5. Inducing with the inverse half-modulus gives the raw value q^(3/2)·2+q^(−1/2)·3, which is 11/√2 at q=2, not 5√2. Geometric reciprocity sends ϖ to geometric Frobenius, so a rank-one character with value 2 has value 2 there and 1/2 at arithmetic Frobenius.
- For split GL₂ and its quaternionic basic inner form, μ=(1,0) pairs with the full positive-root sum to give 1. Hence e(GL₂)e(D×)=−1, and a stable elliptic value 3 transfers to −3. Doubling the full sum would give +3 (HKW22, (3.3.3), p. 18, and Lemma A.2.1, p. 72; HKW22 line 850 and line 3497).
- For GL₁ and μ=1, Hansen's reverse operator must carry the neutral stratum κ=0 to κ(b)=μ^♯=1: the supplier's T^AG_(χ₋₁) carries κ=0 to 0−(−1)=1, whereas T^AG_(χ₁) carries it to −1, outside B(GL₁,1). Hansen's forward operator i_1^* T_(χ₋₁) i_(b!) must carry κ=1 to 0: the supplier's T^AG_(χ₁) does, carrying degree d to d+1, whereas T^AG_(χ₋₁) would carry κ=1 to 2. Equal one-dimensional fibres do not determine the direction; the Kottwitz shifts do.
- For the unramified character of GL₁ with geometric-Frobenius value 2, the normalized coordinate t evaluates to 2 and the raw θ-pulled-back coordinate to 1/2, as in AG2.6's own two-leg test, which assigns 2 to its normalized action and 2⁻¹ to the raw one. The representations V_(μ_m) of §2.2 are self-dual, so for them T^AG_(θ*V)≅T^AG_V and the self-Hecke operators of §1.1 do not depend on the labelling.
- The group GL₂(ℚ₂) and coefficients ℚ̄₃ meet the main theorem's hypotheses; q=2 and every d_m is positive. q=1, ℓ=p, a zero coefficient ring and an equal-characteristic local field do not meet these standing hypotheses. They do not receive assertions from the complex-character theorem.

## Exact supplier contracts

### From Mathlib

Use `Finsupp` and `Finsupp.mem_support_iff` in `Mathlib/Data/Finsupp/Defs.lean` for exact finite coefficient support; the definition requires a zero but supplies no smooth representation, topology or character interpretation. Use `Submodule` in `Mathlib/Algebra/Module/Submodule/Defs.lean` and `Subalgebra` in `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean` for the linear and algebraic subobjects.

Use `Finset.expect` and `Fintype.expect_eq_sum_div_card` in `Mathlib/Algebra/BigOperators/Expect.lean` for the arithmetic mean over an actual finite nonempty class set. The total empty mean is zero and is excluded by g∈R_g. Use `AddChar.complexBasis` in `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` and `AddChar.wInner_cWeight_eq_boole` in `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean` on the finite abelian group H_g; they supply the complex Fourier basis and normalized-counting orthogonality, not the stable-class identification.

Use `AlgHom.range`, `AlgHom.rangeRestrict` and `AlgHom.rangeRestrict_surjective` in `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`, and `Ideal.quotientKerEquivRange` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`. Surjectivity is onto the image. For the latter algebra equivalence the source is a ring with the displayed algebra structure; here all algebras are complex and unital. Use `MeasureTheory.norm_integral_le_of_norm_le_const` in `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean` only with a finite restricted Haar measure and a nonnegative bound on the norm.

### From Tau Ceti

Use `TauCeti.ExactK0` and `TauCeti.ExactK0.lift` in `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean` on the specified exact structure of an essentially small additive category with binary biproducts. Use `TauCeti.AbelianK0.homologyEulerChar` in `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean` for a finite set of integer cohomology degrees containing the nonzero cohomology. The generic group and Euler sum do not assert character independence or finite length of a Hecke output.

Use `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` in `TauCeti/Algebra/Lie/HighestWeight/Weyl/Character.lean` and `TauCeti.finrank_eq_prod_coweightPairing_div` in `TauCeti/Algebra/Lie/HighestWeight/Weyl/Dimension.lean`. Their representation-theoretic hypotheses are a finite-dimensional Killing-semisimple Lie algebra over an algebraically closed characteristic-zero field, a Cartan and root-system base, and a finite-dimensional module generated by a specified highest-weight vector; the character formula also carries its finite Weyl-group enumeration. The denominators are the nonzero positive-coroot pairings with the Weyl vector. For the algebraic-group character, including its central weights, use ReductiveGroups Layer 10. For §2.4(a) use `TauCeti.formalCharacter` in `TauCeti/Algebra/Lie/Weights/FormalCharacter.lean`, `TauCeti.IsHighestWeightVector` in `TauCeti/Algebra/Lie/HighestWeight/Basic.lean` and `TauCeti.twoWeylVector` in `TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean`. The highest-weight predicate requires a nonzero vector; a zero module cannot meet it. The formal-character coefficient is the integer dimension of a generalized weight space; diagonalizability for these semisimple modules identifies it with the ordinary multiplicity.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §§SR.0.4, SR.1.1, SR.2.2, SR.3.1–SR.3.3: the smooth category and its complex centre, compactly supported convolution, normalized induction and Jacquet functors, finite length and irreducible scalar actions; Bernstein restriction is the gap below. Section SR.1.3, “bernstein-centre-corners”, identifies this categorical centre with lim_K Z(H(G,K;ℂ)); §SR.0.4 supplies exact smooth duality over the coefficient field and the injective evaluation into the smooth bidual, and §SR.0d.2 supplies its derived form. Section SR.3a.1 (*admissibility-of-irreducibles*) supplies admissibility of irreducibles, hence their scalar Schur endomorphisms over ℂ, and over ℚ̄_ℓ through ι.

What SmoothRepresentationsOfLocalGroups must provide (gap:bernstein-distribution-realization): In §SR.3.2, identify lim_K Z(H(G,K;ℂ)) faithfully with essentially compact invariant distributions, with inversion and z(f)=(z∗f^vee)(1) for the convolution convention fixed above (H26, §1.1 and Lemma 2.3, pp. 1–2 and 6; H26 line 32 and line 283).

What SmoothRepresentationsOfLocalGroups must provide (gap:normalized-bernstein-levi): For every E-rational Levi M of G, provide the Bernstein-centre restriction r_M:Z(G)→Z(M), with z·i_M^G(Θ)=i_M^G(r_M(z)·Θ) and tr σ((z∗f)_M)=tr σ(r_M(z)∗f_M) for every irreducible smooth σ of M(E) and f∈H(G), where f_M is the normalized constant term (H26, §2.1, pp. 4–5; H26 line 192 and line 207).

**Checks.**

- For GL₂ with M=T and an irreducible χ of T(E), let z act by 2 on the block containing i_B(χ) and choose f with tr(f | i_B(χ))=3. Both constant-term traces are 6; using f=0 gives 0 on each side, and z=1 gives 3 on each side.

Compatibility of these maps with the geometric spectral action is the local target of §0.0. Independence of irreducible characters is gap:irreducible-character-independence below; together with finite length it identifies the complexified finite-length Grothendieck group with D(G).

### From TauCetiRoadmap.HeckeStacksAndLocalShtukas

Consume §§HS1.1–HS1.3 and HS1.5–HS1.7 for normalized kernels, relative-homology Hecke operators, units, fusion, adjoints, compactness and duality; §§HS3.8 and HS3.10 supply the star finite-length comparison and basic-source enriched left adjoint. A geometric fibre gives the endofunctors used here. Their smooth categories and coefficient dictionary are the ones fixed above.

Consume HS4.1's finite-set Hecke family and HS4.2's creation, annihilation and dual-leg triangles. HS1–HS4 extend AutomorphicGaloisRepresentationsPartII AG2.6's `HeckeFunctor`, so the excursion operators imported in §0.0 are by construction the HS4.2 create–Weil-action–annihilate composites on the θ-pulled-back family of Conventions; §HS4.2 says that excursion operators are AG2.6's `excursionOperator` on the imported Hecke functor and are not constructed there. Section HS4.6 supplies its geometric parabolic and cyclotomic comparison on unstable strata for ℓ-power torsion coefficients, for quasi-split G only. No spectral centre map is assumed from this supplier.

What HeckeStacksAndLocalShtukas must provide (gap:general-parabolic-excursion-comparison): For every connected reductive G/E, not necessarily quasi-split, E-rational parabolic P=MU, ℓ-power-torsion ℤ_ℓ[√q]-algebra Λ and smooth Λ-representation σ of M(E), prove that each normalized excursion operator of G, the HS4.2 composite on the θ-pulled-back Hecke family of Conventions (AutomorphicGaloisRepresentationsPartII AG2.6's `excursionOperator`), acts on the unnormalized induction Ind_P^G σ as the corresponding excursion operator of M pulled back along `phi -> (w -> (2rho_Ghat - 2rho_Mhat)(sqrt q)^|w| * phi(w))`, |geometric Frobenius|=1, extending the quasi-split single-stratum theorem of §HS4.6 by a z-embedding into a group with connected centre and a quasi-split basic inner form (FS24, §IX.7.1, proof of Theorem IX.7.2 and Corollary IX.7.3, pp. 334–338; FS24 line 12973, line 12996 and line 13097).

The reduction in this contract is the one of FS24 line 12996: a z-embedding G↪G′ with torus quotient and connected centre, the injectivity of B(G)→B(G′), detection of the centre of G_b(E) on restrictions from G′_(b′)(E), the adjoint-isomorphism comparison of §HS4.3, and a basic b₀∈B(G′) with G′_(b₀) quasi-split (BunGAndNewtonStrata §1.44) transported along the basic inner-form equivalence of §HS0.6. A z-embedding is Kaletha's: an embedding G↪G′ with G′/G an induced torus, Z(G′) connected and H¹(E,Z(G))→H¹(E,Z(G′)) bijective; injectivity of that map gives the surjectivity Z(G′)(E)→(G′/G)(E) and the factorization G′(E)=Z(G′)(E)·G(E) that the reduction uses, and every connected reductive G has a z-embedding, the pushout of G and a suitable torus along Z(G) (KAL18, Definition 5.1, Proposition 5.2, Corollary 5.3 and Fact 5.5, pp. 17–19; KAL18 line 777, line 835 and line 860). ReductiveGroupsPartII §RG2.1.5 supplies z-extensions G̃→G, not z-embeddings, so it does not fill this step.

**Checks.**

- For a quaternion division algebra D over E, G=SL₂(D) has the proper rational parabolic with Levi {(a,b)∈D^×× D^× : Nrd(a)Nrd(b)=1}. Since G is an inner form of SL₄, π₁(G)=0, so 1 is its only basic class and no basic twist makes it quasi-split; a contract stated for quasi-split G says nothing about this parabolic.
- The reduced-norm inclusion SL₂(D)↪GL₂(D) has quotient G_m and connected centre G_m, and Nrd:GL₂(D)(E)→E^× is surjective, but it is not a z-embedding: the centre maps by λ↦Nrd(λ)=λ⁴, which misses a uniformizer, so Z(G′)(E)→(G′/G)(E)=E^× is not surjective and E^×·SL₂(D)(E) is the proper subgroup of GL₂(D)(E) with reduced norms in E^(×4); correspondingly, since Z(SL₂(D))=μ₄ (an inner form of SL₄ has the centre of SL₄), H¹(E,μ₄)=E^×/E^(×4)→H¹(E,G_m)=0 is not injective, and KAL18 line 767 excludes SL_n↪GL_n for the same reason. The reduction uses a genuine z-embedding of SL₂(D), which exists by KAL18 Corollary 5.3. Separately, GL₂(D) is (GL₄)_(b₀) for the basic b₀ with κ(b₀)=2 and slope 1/2, and its block Levi D^××D^× corresponds to the standard parabolic of GL₄ of type (2,2).
- For GL₂, its upper Borel and q=4, let σ be the unramified torus character with values 2 and 3. Unnormalized Ind σ is normalized induction from σδ_B^(−1/2), with values 2·√q=4 and 3/√q=3/2, trace 11/2. The twist (2ρ_Ĝ−2ρ_T̂)(√q)=diag(√q,1/√q) at geometric Frobenius also sends diag(2,3) to diag(4,3/2). The opposite twist would give diag(1,6), trace 7. For P=G the twist is trivial.

What HeckeStacksAndLocalShtukas must provide (gap:all-weight-shriek-trace): For dominant μ and basic b∈B(G,μ), prove the elliptic character formula of HKW22 Theorem 6.5.2 for i₁* T_(V_μ dual) i_b! and i_b* T_(V_μ) i₁! in Hansen's labels, that is for the supplier's i₁* T^AG_(V_μ) i_b! and i_b* T^AG_(V_μ dual) i₁! of Conventions, with the sign of (3.3.3), transported from HKW's star extension by smooth duality and inversion (HKW22 line 3018 and line 3190).

The source and target of the first map are D(G_b) and D(G), and of the second D(G) and D(G_b). HKW22 Proposition 6.4.5 and Definition 6.4.6, pp. 61–62 use star extension (HKW22 line 3004 and line 3020); finite length of the shriek outputs follows from the duality of HeckeStacksAndLocalShtukas §HS3.8 and exact smooth duality with injective bidual evaluation from SmoothRepresentationsOfLocalGroups §§SR.0.4 and SR.0d.2. Indeed the dual output has bounded finite-length cohomology, and each original cohomology object injects into its finite-length bidual; §HS3.10 also supplies compactness (HKW22 line 3017). The elliptic trace comparison itself requires the stated duality/inversion transport of Theorem 6.5.2, pp. 65–66 (HKW22 line 3190). No global star-equals-shriek assertion and no refined-LLC hypothesis from Theorem 6.5.1 is part of this contract. Use gap:basic-invariant-comparison for the stable-class comparison and gap:weight-fibre-classes for supported-weight existence and uniqueness; Kottwitz signs are those of EndoscopicTransferAndUnitaryTraceComparison §1.13.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §§1.2(a), 1.3, 1.6(ii)–(iii), 1.13–1.16 for stable conjugacy, rational-class fibres, Kottwitz signs and matching classes; §§2.1, 2.4 and 2.11 for compatible centralizer measures, stable sums and the matching-function quotient; §2.16 for local integrability, discriminant-weighted character boundedness and group Weyl integration; §4.7 for characteristic-zero smooth transfer at every residue characteristic. Section 1.14(a)–(b) parametrizes the G(E)-classes of E-embeddings Ad(x)|_T of a fixed maximal torus T, with x∈G(Ē) and x⁻¹σ(x)∈T for all σ, by the finite set D(T,G;E); since T is its own centralizer these are exactly the E-rational embeddings stably conjugate to the inclusion; §§1.6(ii)–(iii) supply matching elliptic elements in the quasi-split form. For inner-form matching require the Kottwitz-sign specialization and vanishing on irrelevant quasi-split classes. Section 2.1's interface item that J_G(·,f)=|D_G|^(1/2)O_(·)(f) is bounded on G_reg(E) for fixed f supplies that boundedness in its centralizer-quotient normalization; for elliptic T, the A_G(E)\G(E) normalization used in H26 differs by the finite positive factor vol(T(E)/A_G(E)), with compatible measures (H26 line 484 and line 489).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:irreducible-character-independence): For every connected reductive G over E/ℚ_p finite and pairwise nonisomorphic irreducible smooth complex representations π_1,…,π_n of G(E), prove that ∑_i a_iΘ_(π_i)=0 in Dist(G) with a_i∈ℂ forces every a_i=0, so that the complexified Grothendieck group of finite-length smooth representations maps isomorphically onto D(G) (H26, §2.1, p. 5, and proof of Lemma 2.4, p. 7; H26 line 218 and line 318).

Section 2.16 states only nonvanishing of each Θ_π, which does not give independence: the values 1 and 2 are each nonzero and dependent.

**Checks.**

- For GL₁ and unramified characters with values 2 and 3 at ϖ, the tests 1_(ϖ𝒪_E^×) and 1_(𝒪_E^×) give the value matrix [[2,3],[1,1]] times vol(𝒪_E^×), with determinant −vol(𝒪_E^×)²≠0, so the two characters are independent.
- Two distributions with values (1,1) and (2,2) on these two tests are each nonzero but dependent; the contract excludes this for distinct irreducibles.
- For a single irreducible π, independence is Θ_π≠0, which follows from π(f)≠0 for some f∈H(G).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:kazhdan-cuspidal-decomposition): For every connected reductive G/E, identify the common kernels of irreducible characters, tempered characters, regular orbital integrals and conjugation commutators, split I(G) as cuspidal classes plus the annihilator of D_ell(G), and prove that a class f∈I(G) is cuspidal, every proper-Levi normalized constant term f_M being zero, if and only if its orbital integrals vanish at every non-elliptic regular semisimple element (H26, §2.1, pp. 4–5; H26 line 181, line 209 and line 240).

**Checks.**

- For GL₂, its split torus T and f=1_K with K=GL₂(𝒪_E), the normalized constant term f_T(m)=δ_B^(1/2)(m)·vol{u∈U(E) : mu∈K} equals 1 for m∈T(𝒪_E), so f is not cuspidal, and O_(diag(a,b))(1_K)=1 for units a,b with |a−b|=1, so its split-torus orbital integrals are nonzero. For a matrix coefficient of a supercuspidal representation f_T=0 and those orbital integrals vanish. A contract that only split I(G) would not say which of these two functions has vanishing split-torus integrals.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:arthur-stable-decompositions): For every connected reductive G/E, supply the dual Arthur decompositions (1)–(3), the proper-induction kernel of elliptic restriction on all of D(G) with complex coefficients (HKW22, Theorem C.1.1, p. 75, states it for rational combinations in the Grothendieck group of complex or ℚ̄_ℓ-representations; HKW22 line 3635), its injectivity on D_ell(G), and central invariance of the ordinary cuspidal, noncuspidal and elliptic summands (H26, Lemma 2.1, pp. 5–6; H26 line 209, line 223 and line 244).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:unstable-tempered-separation): For every connected reductive G/E, prove that U(G) is the simultaneous annihilator of SD_temp(G), and that δ₁ is a stable distribution (H26, §2.1 and Lemma 2.3, p. 6; H26 line 266 and line 286).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:stable-tempered-projection): For every connected reductive G/E, provide a projection P_st:D_temp(G)→SD_temp(G) whose elliptic restriction is finite arithmetic averaging over rational classes in each stable class (H26, §2.1 and Lemma 2.6, pp. 6 and 10–11; H26 line 262 and line 501).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:bounded-elliptic-orbital-integrals): For every f∈H(G) and elliptic maximal E-torus T, prove that the closure in T(E) of {t∈T(E)∩G(E)_ell : O_t(f)≠0} is compact (H26, §2.3, p. 10; H26 line 486).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:stable-inner-character-transfer): For each extended pure inner form G of quasi-split G*, provide stable tempered character transfer with elliptic value e(G)Θ(g*), its elliptic isomorphism, compatibility with induction from relevant Levis, vanishing on irrelevant Levi summands, and Θ(f*)=Trans_G(Θ)(f) for Θ∈SD_temp(G*) and f*, f with matching stable orbital integrals for the factor e(G) (H26, §2.4, pp. 12–13; H26 line 586, line 594, line 597 and line 632).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:elliptic-torus-representatives): For every connected reductive G over E/ℚ_p finite, provide finiteness of the set of G(E)-conjugacy classes of maximal E-tori of G (HKW22, Lemma 3.1.1 and proof, p. 13; HKW22 line 577).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:stable-orbital-inversion-duality): For every connected reductive G/E and strongly regular γ, prove SO_γ(f^vee)=SO_(γ⁻¹)(f), so f↦f^vee preserves U(G), with the same centralizer measure for γ and γ⁻¹ (deduced by inverting the integrand in HKW22, §3.4, p. 19, HKW22 line 891, and summing the stable classes of H26, §1.1, p. 1, H26 line 39).

Finiteness in gap:elliptic-torus-representatives is the finite representative input of HKW22 Lemma 3.1.1 and its proof, p. 13 (HKW22 line 577). It makes no compactness claim about an entire rational conjugacy orbit. The stable-inner-character-transfer contract fixes e(G) as in H26, p. 12, footnote 4 (H26 line 597).

### From TauCetiRoadmap.BunGAndNewtonStrata

Consume §0.6 (the Kottwitz set B(G), whose coefficient field and Frobenius are those of VectorBundlesAndIsocrystals Layer 0), 1.11 (classification by both invariants), 1.13 and 1.18–1.19 (J_b, basicness and inner forms), 1.23 (B(G,μ)) and 1.36 (torus Kottwitz isomorphism and Newton average). The fundamental-group carrier is the integral coroot quotient with full Galois coinvariants of ReductiveGroupsPartII §RG2.1.5; its torsion is retained.

What BunGAndNewtonStrata must provide (gap:basic-invariant-comparison): For strongly regular stably conjugate g,g′ with centralizer T, identify HKW's inv[1](g,g′) with the image of the stable-class invariant of EndoscopicTransferAndUnitaryTraceComparison §1.14 under H¹(E,T)≃(X_*(T)_Γ)_tors⊂B(T)≃X_*(T)_Γ, using its §1.2(a) and BunGAndNewtonStrata §1.36 integrally with torsion (HKW22, Definition 3.2.2, p. 14; HKW22 line 631).

What BunGAndNewtonStrata must provide (gap:weight-fibre-classes): For strongly regular elliptic g∈G(E), dominant μ, basic b∈B(G,μ) and each weight λ of V_μ relative to T_g, prove existence and uniqueness of the G_b(E)-class [g_b] stably conjugate to g with inv[b](g,g_b)=λ̄ in B(T_g)≃X_*(T_g)_Γ (HKW22, Remark 3.2.5, p. 14; FU25, Lemma 4.2.7, pp. 24–25; HKW22 line 649 and FU25 line 955).

What BunGAndNewtonStrata must provide (gap:basic-levi-lift): For quasi-split G*, basic b∈B(G*) and each E-rational parabolic Levi M of G*_b, provide a standard E-rational parabolic Levi M* of G* and basic b_M∈B(M*) mapping to b with M≃(M*)_(b_M), compatibly with the L-group identification of ReductiveGroupsPartII §RG2.5 (H26, Theorem 1.4(i), p. 3, and §2.4, p. 12; H26 line 116 and line 566).

These are the compatibilities used by H26 §2.2, pp. 6–9 (H26 line 296), HKW22 §3.2, pp. 14–16, and FU25 §§3.2 and 4.2 (FU25 line 778 and line 947). They concern arithmetic classes, not period-point existence.

### From TauCetiRoadmap.GeometricSatakeAndFusion and TauCetiRoadmap.ReductiveGroupsPartII

Consume GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”, for the normalized dual-group/Satake equivalence, tensor and representation duality, and its weight grading. Consume ReductiveGroupsPartII §§RG2.1.5 and RG2.5 for the integral root datum, fundamental group, dual group and pinned Weil action; the algebraic representations V_μ come from ReductiveGroups Layer 10B. Section 2.2 specializes their characteristic-zero highest-weight representations using ReductiveGroups Layer 10B for the group character, retaining the full central weight.

### From TauCetiRoadmap.ReductiveGroups

Consume the main roadmap's Layers 1, 2 and 7 for representations as comodules, their differentials and the derived-group/Cartan/root dictionary, and Layer 10A–10B for the full integral torus-weight character in ℤ[X*(T̂)] and the simple modules L(λ) of a split reductive group with their Weyl characters. In characteristic zero these are the Weyl modules; central weights remain visible. Section 2.2 specializes this supplied group formula.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

Consume AG2.6, “Bundle strata, lisse categories and the geometric Hecke action”, for `HeckeFunctor`, the lisse Hecke transform T^AG_V of Conventions with its unit, monoidality, duality, adjunctions and coherent Weil actions. Consume AG2.6, “The parameter stack and geometric spectral action”, for every connected reductive G/E over the characteristic-zero coefficient field ℚ̄_ℓ, where its integral prime restriction ℓ∤|π₀Z(G)| is unnecessary: the finite wild level of each compact lisse object, an open subgroup P of wild inertia with P^I acting trivially on all its Hecke transforms; the excursion operators `excursionOperator` and their relations; the central action `geometricSpectralAction` of Z_spec(G)=O(Z¹(W_E,Ĝ))^Ĝ on D_lis(Bun_G), commuting with Hecke transforms and coefficient change; and its restrictions Ψ_G^b to the derived smooth stratum categories, the neutral one landing in the smooth centre. All of these are AG2.6's normalized action, built from the family V↦T^AG_(θ*V); its raw action is not used. Consume `semisimpleParameter` only for the attachment of a semisimple parameter to each Schur-irreducible object over an algebraically closed coefficient field. IgusaVarietiesAndTorsionConcentration §3.0i restricts this action to its Igusa coefficient categories, and its §7.9a proves the product, parabolic, reduction and duality compatibilities of the parameter for GL_n, its inner forms and products; neither is consumed.

### From TauCetiRoadmap.LanglandsParameterStacks

Consume §1.2, “Clopen finite-wild pieces”, for the parameter-stack decomposition defining Z_spec(G), and §3.6, “Continuous semisimple parameter characters”, for the centre-valued excursion algebra and the bijection with continuous semisimple Weil-parameter classes with prescribed projection. Section 3.9, “Parameters of Schur objects”, supplies the invariant-coordinate characterization on Schur objects. The imported action of AutomorphicGaloisRepresentationsPartII AG2.6 factors through the finite-wild parameter schemes, so §3.6 supplies continuous semisimple classification. Equality of all those scalars implies equality of conjugacy classes; a complex field isomorphism does not supply a new continuity theorem.

## How to read the build

Layer 0 first imports the geometric centre action and its parameters, compares its basic and normalized Levi restrictions, then fixes the stable central submodule, very stable subalgebra and their character detection. Layer 1 passes the supplied geometric Hecke functors to finite-length Euler characters and compares their two inner-form directions. Layer 2 specializes the dual-root Weyl formula, constructs the stable-class weight kernel and proves quantitative averaging. Layer 3 integrates that estimate against cuspidal functions and proves very stability by rank induction. Layer 4 uses support minimality to obtain parameter constancy. Layers 5 and 6 use the established stability theorem to construct the inner-form image quotient and prove its Levi, character and test-function compatibilities. Each local dependency lists only the statements and route inputs it actually uses; the exact supplier contracts give the common meaning of every gap slug.

## Layer 0: stable central distributions

### 0.0 The Fargues–Scholze centre map

Import the geometric spectral centre action from AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”, over ℚ̄_ℓ, where its integral prime restriction does not enter. It supplies, for every connected reductive G/E: for each compact A∈D_lis(Bun_G) an open subgroup P of wild inertia such that P^I acts trivially on T_V(A) for every finite set I and every finite-leg representation V; excursion operators, defined by creation, the W_E^I-action on T_V in Hansen's labels and annihilation, that factor through the excursion algebra; and a central action Z_spec(G)→π₀End(id_(D_lis(Bun_G))) commuting with the Hecke functors, whose restriction to the neutral stratum [*/G(E)] lands in the smooth centre. That restriction, transported by ι, is Ψ_G. For basic b let Ψ_G^b:Z_spec(G)→Z(G_b) be the restriction of the same action along the fully faithful basic-stratum embedding D(G_b(E))→D_lis(Bun_G) of HeckeStacksAndLocalShtukas §HS3.10; for b=1 it is Ψ_G (FS24, Proposition IX.5.1 and Theorem IX.5.2, pp. 327–329; FS24 line 12683 and line 12745).

HeckeStacksAndLocalShtukas HS1 and HS4 extend AG2.6's `HeckeFunctor`, and §HS1.2 identifies the lisse restriction of its T_V with that functor. Hence each imported excursion operator with datum V is by construction the create–Weil-action–annihilate composite of HS4.2 for the HS4.1 Hecke family with datum θ*V, that is the composite with datum V in Hansen's labels (Conventions), and the imported action commutes with every HS4.1 Hecke functor used in Layer 1.

**(a) Basic restriction.** For every basic b prove Ψ_G^b=Ψ_(G_b) after identifying the spectral centres of G and G_b by the inner twist. This compares the restriction of the imported action of Bun_G with the neutral restriction of the imported action of Bun_(G_b) (FS24, §IX.7.1 and Theorem IX.7.2, pp. 334–335; FS24 line 12950, line 12977 and line 12994).

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”; HeckeStacksAndLocalShtukas §HS3.10; BunGAndNewtonStrata §§1.13, 1.18–1.19; SmoothRepresentationsOfLocalGroups §SR.3.2; LanglandsParameterStacks §1.2; ReductiveGroupsPartII §RG2.5.

**(b) Normalized parabolic compatibility.** For every E-rational parabolic P=MU and a∈Z_spec(G), prove r_M(Ψ_G(a))=Ψ_M(res_M(a)), where res_M:Z_spec(G)→Z_spec(M) is ordinary dual-Levi restriction. Start with the cyclotomic correction in FS24's unnormalized induction, and transport to the normalized convention fixed above. Use the torsion-coefficient excursion comparison gap:general-parabolic-excursion-comparison, which extends the quasi-split theorem of HeckeStacksAndLocalShtukas §HS4.6 to every G by the z-embedding reduction of FS24 line 12996, then the ℓ-adic separation argument of FS24 Theorem IX.7.2 and the characteristic-zero excursion/function identification of AutomorphicGaloisRepresentationsPartII AG2.6; this imposes no extra condition on ℓ. IgusaVarietiesAndTorsionConcentration §7.9a proves this compatibility only for GL_n, its inner forms and their products; here G is any connected reductive group (FS24, Corollary IX.7.3, pp. 337–338; FS24 line 13097; H26 line 128).

*Needs:* (a); AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”; gap:normalized-bernstein-levi; SmoothRepresentationsOfLocalGroups §§SR.1.3 and SR.2.2; ReductiveGroupsPartII §RG2.5; GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”; gap:general-parabolic-excursion-comparison for the parabolic and cyclotomic excursion comparison.

The imported centre map and the two comparisons have the following API.

- The geometric map and every Ψ_G^b are unital algebra maps; an invariant matrix coefficient acts by the corresponding create–Weil-action–annihilate operator.
- The geometric action commutes with each finite-leg Hecke functor of HeckeStacksAndLocalShtukas HS4.1, hence its two basic restrictions give the common action used in §1.5.
- A basic inner twist identifies the source spectral algebras, and restriction agrees with the intrinsic map for G_b.
- The restriction r_M of Ψ_G equals Ψ_M after ordinary dual-Levi restriction, in the normalized induction convention of (b).

**Checks.**

- For the trivial representation as excursion datum, the action is 1; taking the creation map zero gives 0. A zero centre map fails the first computation. For the zero compact object, any open wild subgroup bounds the wild action, since every Hecke transform is zero.
- For G=GL₁ the unramified parameter locus has coordinate ring ℚ̄_ℓ[t,t⁻¹]. For an unramified character of geometric-Frobenius value 2, the evaluation is t↦2 and t⁻¹↦1/2. An arbitrary nonzero rescaling of the coordinate would fail the specified excursion evaluation. Wild inertia acts trivially on this datum, so P can be the full wild inertia group.
- For b=1 the basic comparison fixes Ψ_G(0)=0 and Ψ_G(1)=1. On GL₁ every basic stratum has the same intrinsic centre map; translating the degree changes neither scalar 2 nor 1/2.
- For GL₂ and its diagonal Levi, the trace coordinate restricts at torus values 2 and 3 to 2+3=5, agreeing with trace(diag(2,3)). The Satake-normalized operator q^(−1/2)·1_(K diag(ϖ,1) K) of the standard dual representation has eigenvalue 5, equal to this trace coordinate; the raw double-coset operator has eigenvalue 5√q, hence 5√2 at q=2, as in Conventions. An extra modulus twist changes the spectral restriction and fails the value 5.

**FS parameter.** For every irreducible smooth ℚ̄_ℓ-representation π, admissibility and scalar Schur endomorphisms come from SmoothRepresentationsOfLocalGroups §SR.3a.1 (*admissibility-of-irreducibles*), transported by ι. Write φ_π for the semisimple parameter that AutomorphicGaloisRepresentationsPartII AG2.6 (`semisimpleParameter`) attaches to i_(1!)π, a Schur-irreducible object of D_lis(Bun_G) because i_(1!) is fully faithful and π has scalar endomorphisms: by LanglandsParameterStacks §§3.9 and 3.6 it is the unique Ĝ-conjugacy class of continuous semisimple Weil parameters with the prescribed Weil projection whose invariant-coordinate evaluations are the scalar actions of Ψ_G on π. The GL_n-specific compatibilities of IgusaVarietiesAndTorsionConcentration §7.9a are not used (FS24, Proposition I.9.1, p. 34, and Definition/Proposition IX.4.1, p. 327; FS24 line 1253 and line 12667).

The parameter is used through the following properties.

- Evaluation of every excursion invariant on φ_π equals its central scalar on π.
- φ_π is continuous for the supplied coefficient topology and semisimple, with prescribed projection to the Weil quotient.
- Isomorphic irreducibles give the same class; equality of all invariant coordinates is equivalent to equality of these classes.

**Checks.**

- For GL₁ and the unramified character of geometric Frobenius value 2, the parameter has value 2 there and 1/2 on its inverse; the value 3 is excluded by the same standard-character coordinate. The excursion evaluation is constant on each inertia coset, so it is continuous in the supplied topology.
- Semisimple unramified GL₂ parameters diag(2,3) and diag(3,2) give trace 5 and determinant 6; diag(2,4) gives 6 and 8 and is excluded.
- The nonsemisimple SL₂ parameter sending unramified Frobenius to a nonidentity unipotent has trace 2 and determinant 1, like the trivial parameter. Only its semisimplification represents the FS class; omitting semisimplicity would destroy uniqueness (LanglandsParameterStacks §3.6).

### 0.1 Stable central distributions

Define Z_st(G) as the set of z in Z(G) with z(f)=0 for every f in U(G), where z(f) is distribution evaluation; for the weak-* closure it is the intersection of Z(G) with the stable distributions of EndoscopicTransferAndUnitaryTraceComparison §2.4, as in Conventions. (H26, §1.1, pp. 1–2; H26 line 39.)

Import the categorical Bernstein center from SmoothRepresentationsOfLocalGroups §SR.3.2 and the unstable test-function space from its stable-orbital and matching-function contracts. Use gap:bernstein-distribution-realization for the essentially compact invariant-distribution realization and its pairing. The annihilator condition is the definition; its agreement with the weak-* closed span of the SO_γ of EndoscopicTransferAndUnitaryTraceComparison §2.4 is the bipolar theorem recorded in Conventions; linearity gives the submodule structure.

The construction has the following API.

- z lies in Z_st(G) if and only if every f in U(G) satisfies z(f)=0.
- The inclusion Z_st(G) → Z(G) is complex linear and injective.
- Zero, sums and all complex scalar multiples of stable central distributions are stable.
- Evaluation of any stable central element on an unstable test function is zero.

**Checks.**

- For a torus T, stable and rational conjugacy agree, U(T)=0 and Z_st(T)=Z(T). A definition testing every function rather than every unstable function would incorrectly give the zero centre.
- The zero distribution belongs to Z_st(G), even when U(G) is nonzero: its value on every unstable input is 0. A condition requiring a nonzero stable distribution would fail this case.
- The convolution identity δ₁ belongs to Z_st(G), using the stable-δ₁ theorem: for unstable f its value f(1) is 0. This distinguishes stable evaluation at the identity from vanishing only on regular elliptic points.
- For the pairing on ℂ² and U=span{(1,-1)}, the functional (a,b) annihilates U exactly when a=b; (1,0) fails. This checks the annihilator operation, without representing ℂ² as a p-adic character space.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; Mathlib `Submodule`; gap:bernstein-distribution-realization; gap:unstable-tempered-separation.

### 0.2 Very stable central distributions

Define Z_vst(G)={z in Z(G) | for every f in U(G), z*f belongs to U(G)} as a complex subalgebra of Z(G). The stability of the identity distribution δ₁ is supplied by gap:unstable-tempered-separation, not part of this definition. (H26, §1.1, pp. 1–2; H26 line 41.)

Use the SmoothRepresentationsOfLocalGroups §SR.3.2 categorical Bernstein center, its distribution realization from gap:bernstein-distribution-realization, and the unstable subspace from the stable-orbital contract. The unit, addition, scalar multiplication and composition preserve U(G); convolution multiplication agrees with composition.

The construction has the following API.

- z is very stable if and only if z*f is unstable for every unstable f.
- The inclusion into Z(G) is an injective complex algebra map.
- Convolution by z induces a linear endomorphism of U(G).
- The identity and products of very stable elements are very stable.

**Checks.**

- Every central distribution of a torus is very stable since U(T)=0: every operator sends 0 to 0. Requiring a nonzero unstable test function would incorrectly exclude this case.
- Both zero convolution and identity convolution preserve U(G), with 0∗u=0 and δ₁∗u=u. Requiring the operator to be nonzero or to annihilate U would discard one of these two cases.
- For G=GL_n, n≥1, each strongly regular stable class is a single rational class, so U(G) is the null space of ordinary orbital integrals and Z_vst(G)=Z(G). Indeed Θ_π(z∗f)=z_πΘ_π(f)=0 for null f and every irreducible π; Kazhdan density makes z∗f null (gap:kazhdan-cuspidal-decomposition; H26 line 188). This tests the actual centre beyond the torus case.
- On ℂ² with U=span{(1,-1)}, diagonal convolution diag(a,b) preserves U exactly when a=b; diag(1,0) fails, despite sending zero to U.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; Mathlib `Subalgebra`; gap:bernstein-distribution-realization; gap:kazhdan-cuspidal-decomposition.

### 0.3 Relations between the two stable centers

Z_vst(G) embeds in Z_st(G), and Z_st(G) is a module over Z_vst(G) under convolution. In particular the convolution of a very stable element with a stable element is stable. (H26, §1.1, pp. 1–2; H26 line 48.)

For z very stable and f unstable, inversion gives another unstable function f^vee(g)=f(g^(-1)). Then z*f^vee is unstable; the stability of δ₁ from the EndoscopicTransferAndUnitaryTraceComparison contracts and the usual distribution pairing give δ₁(z*f^vee)=z(f)=0. Put z^vee(f)=z(f^vee). Inversion preserves U(G) and intertwines central convolution, so z^vee is very stable. For stable y and unstable f, (y*z)(f)=y(z^vee*f)=0. These identities follow by unfolding convolution on the unimodular group. For inversion, the centralizers of γ and γ⁻¹ coincide, and (xγx⁻¹)⁻¹=xγ⁻¹x⁻¹ identifies the orbital integrands; inversion also bijects the rational classes in the two stable classes, giving SO_γ(f^vee)=SO_(γ⁻¹)(f) with the fixed measures.

**Checks.**

- For a torus and t²≠1, take f(t)=1 and f(t⁻¹)=0. Then SO_t(f^vee)=0=SO_(t⁻¹)(f) and SO_(t⁻¹)(f^vee)=1=SO_t(f); omitting inversion gives the wrong value in each test.
- For G a torus and z=δ₁, convolution by z fixes a stable distribution y: (y∗δ₁)(f)=y(f). On the two-coordinate diagonal model with a=b=2 and stable functional (3,3), the product is (6,6); unequal diagonal entries would give unequal coordinates.

*Needs:* §0.1; §0.2; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:stable-orbital-inversion-duality; gap:bernstein-distribution-realization; gap:unstable-tempered-separation.

### 0.4 Character criterion for very stability

For z in Z(G), the following are equivalent: z belongs to Z_vst(G); z·SD(G) is contained in SD(G); z·SD_temp(G) is contained in SD_temp(G). Here (z·Θ)(f)=Θ(z*f). (H26, Lemma 2.2, p. 6; H26 line 271.)

The EndoscopicTransferAndUnitaryTraceComparison harmonic-analysis contracts identify unstable functions with the simultaneous annihilator of stable tempered virtual characters and identifies stable characters with their stable orbital behavior. Preservation of U implies preservation of its character annihilators, since center action preserves D and D_temp. If stable tempered characters stay stable, evaluate them on z*f for unstable f and apply the same annihilator criterion to z*f.

**Checks.**

- In the model U=span{(1,−1)} and stable dual line span{(1,1)}, diag(2,2) preserves both lines. diag(1,0) sends (1,−1) to (1,0) outside U and sends (1,1) to (1,0) outside the stable line. Both implications of the criterion distinguish the same failure.

*Needs:* §0.2; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:bernstein-distribution-realization; gap:unstable-tempered-separation.

### 0.5 Stable tempered characters detect the very stable center

The action of Z_vst(G) on SD_temp(G) is faithful: a very stable z annihilating every stable tempered virtual character is zero. (H26, Lemma 2.3, p. 6; H26 line 283.)

The unstable-function criterion in the harmonic-analysis contract implies z*f lies in U(G) for every f in H(G), because every stable tempered character vanishes on it. In particular z*f^vee is unstable for each f. Apply the stability of δ₁ from the EndoscopicTransferAndUnitaryTraceComparison contracts and δ₁(z*f^vee)=z(f) to get z(f)=0 for every f; faithful distribution evaluation gives z=0.

**Checks.**

- For a torus, U=0, so the proof gives z∗f^vee=0 for all f and hence z(f)=0. In the scalar line model, scalar 2 acts nontrivially on the stable vector 1: 2·1=2; scalar 0 is the unique scalar annihilating that space.

*Needs:* §0.2; §0.4; §0.3; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:bernstein-distribution-realization; gap:unstable-tempered-separation.

### Examples

The annihilator model on ℂ² is U=span{(1,−1)}. Its dual annihilator is span{(1,1)}: (a,b)(1,−1)=a−b. Diagonal multiplication preserves U exactly when a=b. At a=b=2 and stable functional (3,3), multiplication gives (6,6). These computations distinguish a stable functional from an operator preserving the unstable kernel. For an actual torus, every rational stable class is a singleton and U=0.

### Dependencies

AutomorphicGaloisRepresentationsPartII AG2.6, “Bundle strata, lisse categories and the geometric Hecke action” and “The parameter stack and geometric spectral action”; HeckeStacksAndLocalShtukas §HS1.2, §HS3.10 and §§HS4.1–HS4.2; gap:general-parabolic-excursion-comparison; LanglandsParameterStacks §§1.2, 3.6 and 3.9; SmoothRepresentationsOfLocalGroups §SR.3a.1; BunGAndNewtonStrata §§1.13, 1.18–1.19; GeometricSatakeAndFusion GS4; gap:normalized-bernstein-levi; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.1.1 and SR.3.2; EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4 and 2.11; gap:bernstein-distribution-realization; gap:unstable-tempered-separation; gap:stable-orbital-inversion-duality; Mathlib submodules and subalgebras.

## Layer 1: Hecke operators on character spaces

### 1.1 Hecke operators on virtual characters

For dominant μ with 1 in B(G,μ), set F_μ=i_1^* T_(V_μ dual) i_(1!). Its bounded finite-length cohomology defines an Euler-class map on K_0 of finite-length smooth representations. After ι and complex linearization obtain T_μ:D(G)→D(G), with T_μ([A])=sum_j (-1)^j [H^j F_μ(A)]. The condition on μ is equivalently trivial action of Z(Ĝ)^Γ on V_μ. Use the geometric-fibre Hecke family with the source, target and normalization of the all-weight shriek trace contract; no t-exactness assumption is made. (H26, §2.2, pp. 6–7; H26 line 296.)

Import the normalized Hecke operator, its unit and duality from the exact HeckeStacksAndLocalShtukas HS1 sections, and basic-stratum shriek extensions from HeckeStacksAndLocalShtukas §HS3.10. For finite-length inputs over ℚ̄_ℓ, HeckeStacksAndLocalShtukas §HS3.8 identifies the smooth dual of the shriek output with a bounded finite-length star output, after its duality and label transport. Exact smooth duality and injective bidual evaluation from SmoothRepresentationsOfLocalGroups §§SR.0.4 and SR.0d.2 make every shriek cohomology object a subobject of a finite-length bidual and detect its vanishing outside finitely many degrees; §HS3.10 supplies compactness preservation. The all-weight shriek trace contract supplies only the adapted elliptic trace identity. Do not replace i_! by i_*. The Euler relation sends distinguished triangles to sums, using the universal property `TauCeti.ExactK0.lift` of the exact Grothendieck group. Identify the complexified finite-length Grothendieck group with the finite span of irreducible characters through gap:irreducible-character-independence.

The construction has the following API.

- T_μ of the character class of A is the alternating sum of the finite-length cohomology classes of F_μ(A).
- T_μ is complex linear on D(G).
- A distinguished triangle of finite-length inputs gives the corresponding Euler sum after F_μ.
- T_0 is the identity, using the unit Hecke kernel and i_1^* i_(1!)=id.
- Before ι and complexification the map is the additive map supplied by `TauCeti.ExactK0.lift`; its finite Euler sum agrees with `TauCeti.AbelianK0.homologyEulerChar` on bounded complexes.

**Checks.**

- For μ=0, T_0(Θ)=Θ; on a rank-one character the coefficient is 1. This excludes replacing the unit kernel by the zero functor.
- The zero representation and zero virtual character map to 0. A constant identity-character assignment fails linearity here.
- For any input complex A and integer n, the Euler character of F_μ(A[n]) is (−1)^n times that of F_μ(A): a unit class shifted once has value −1 and shifted twice +1. Ignoring negative degrees or signs fails this computation.
- For A direct-sum B, its output Euler character is the sum of the two outputs: two unit outputs give 1+1=2, even with cohomology in several degrees. Taking only degree-zero cohomology would not respect Euler additivity.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.4 and SR.0d.2; HeckeStacksAndLocalShtukas §HS1.2; HeckeStacksAndLocalShtukas §HS1.3; HeckeStacksAndLocalShtukas §§HS1.5–HS1.7; HeckeStacksAndLocalShtukas §HS3.10; HeckeStacksAndLocalShtukas §HS3.8; BunGAndNewtonStrata §0.6; BunGAndNewtonStrata §1.23; GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”; ReductiveGroupsPartII §RG2.5; Tau Ceti `TauCeti.ExactK0`; Tau Ceti `TauCeti.ExactK0.lift`; Tau Ceti `TauCeti.AbelianK0.homologyEulerChar`; gap:bernstein-distribution-realization; gap:all-weight-shriek-trace; gap:irreducible-character-independence.

### 1.2 Hecke and excursion commutation on characters

For a in Z_spec(G), z=Ψ_G(a), and Θ in D(G), T_μ(z·Θ)=z·T_μ(Θ) for each μ allowed in the self-Hecke construction. (H26, Lemma 2.4, p. 7; H26 line 305.)

Use the Hecke-compatible geometric center map and its restriction along the chosen basic stratum embedding. Take cohomology Euler classes of the commuting natural transformations; then transport coefficients and complex-linearize.

**Checks.**

- At μ=0, both sides are z·Θ. At the zero character both sides are 0. A two-coordinate diagonal model with z=diag(1,2) and a coordinate swap gives (2,1) versus (1,2) on (1,1), explaining why a general centre operator cannot be substituted for the geometric commuting action.

*Needs:* §1.1; §0.0.

### 1.3 Stable Hecke action modulo induced characters

Let D_ind(G) be the span of characters induced from proper Levi subgroups, equivalently the kernel of elliptic restriction on all of D(G) by gap:arthur-stable-decompositions (HKW22, Theorem C.1.1, p. 75; HKW22 line 3635). T_μ preserves D_ind(G). For every μ as in §1.1 and stable Θ in SD(G), T_μ(Θ) - (dim V_μ)Θ belongs to D_ind(G). (H26, Proposition 2.5, pp. 7–8; H26 line 338.)

The all-weight shriek trace formula shows that T_μ(Θ) has zero elliptic restriction whenever Θ does. For stable Θ the invariant fibers contain exactly one rational conjugacy class for each occurring weight; replace all character values by Θ(g) and sum weight multiplicities to dim V_μ. Apply the elliptic-kernel theorem in the harmonic-analysis contract to both conclusions. The all-weight trace contract supplies the geometric formula; gap:weight-fibre-classes supplies its invariant fibres.

**Checks.**

- For a stable constant elliptic value 3 and dim V_μ=5, the output has elliptic value 15, so the correction has value 15−15=0. An induced input has elliptic value 0 and therefore output value 0 there; neither computation identifies the correction with the zero virtual character.

*Needs:* §1.1; SmoothRepresentationsOfLocalGroups §SR.2.2; gap:normalized-bernstein-levi; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:arthur-stable-decompositions; gap:all-weight-shriek-trace; gap:weight-fibre-classes.

### 1.4 Hecke operators between basic inner forms

For any dominant μ and basic b in B(G,μ), let G_b be the associated extended pure inner form. The functors i_1^* T_(V_μ dual) i_(b!) and i_b^* T_(V_μ) i_(1!) yield complex-linear Euler maps T_μ:D(G_b)→D(G) and T_μ^rev:D(G)→D(G_b). The superscript rev names the reverse geometric operator and does not mean a linear transpose. Bounded finite-length cohomology in both directions follows from HeckeStacksAndLocalShtukas §HS3.8 duality, §HS3.10 compactness preservation and the exact smooth-duality argument of §1.1, for every such μ including nonminuscule μ. (H26, §2.2, p. 9; H26 line 408; HKW22, Proposition 6.4.5, pp. 61–62, HKW22 line 3004.)

Apply the same Euler construction and the finite-length argument of §1.1 to each pair of basic strata. Use dual V_μ only in the forward direction; fix weights and signs in the reverse character formula by the all-weight shriek trace contract duality comparison.

The construction has the following API.

- The forward operator is the Euler class of i_1^* T_(V_μ dual) i_(b!).
- The reverse operator is the Euler class of i_b^* T_(V_μ) i_(1!).
- Both directed maps preserve complex linear combinations.
- For b=1, forward agrees with the self-Hecke construction for the same μ and normalization.
- A shift by n in either input multiplies its Euler output by (-1)^n.

**Checks.**

- For μ=0 and b=1 both maps are the identity, so a unit character returns coefficient 1 in each direction. Neither map may be replaced by zero.
- The zero character has forward and reverse image 0. Constant nonzero assignments fail both equalities.
- For b=1 the forward formula uses V_μ dual and agrees with the self-Hecke formula, including cohomological signs: at μ=0 a class shifted by one has output −1 in either construction. A sign-free comparison would give +1.
- For GL₁ and μ=1, the forward and reverse kernels have opposite representation labels −1 and +1 in Hansen's labels, hence +1 and −1 for the supplier's functor by the dictionary of Conventions. Their common dimension 1 cannot identify the labels; the supplied degree-shift check gives opposite shifts.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.4 and SR.0d.2; §1.1; HeckeStacksAndLocalShtukas §HS1.2; HeckeStacksAndLocalShtukas §HS1.3; HeckeStacksAndLocalShtukas §§HS1.5–HS1.7; HeckeStacksAndLocalShtukas §HS3.10; HeckeStacksAndLocalShtukas §HS3.8; BunGAndNewtonStrata §§1.13, 1.18–1.19; BunGAndNewtonStrata §1.23; §0.0; gap:all-weight-shriek-trace.

### 1.5 Central commutation across inner forms

For dominant μ, basic b∈B(G,μ) and a in the common spectral centre, z=Ψ_G(a), z_b=Ψ_(G_b)(a), T_μ(z_b·Θ)=z·T_μ(Θ) and T_μ^rev(z·Ξ)=z_b·T_μ^rev(Ξ), for all Θ in D(G_b) and Ξ in D(G). (H26, Proposition 2.7(i), p. 9; H26 line 413.)

Restrict the Hecke-compatible natural central transformation to the two basic strata, using the basic case of the stratum-center comparison. Decategorify the two natural commutation squares using the inner Hecke Euler maps.

**Checks.**

- For the trivial modification, b=1 and μ=0, both intertwining equations reduce to z·Θ=z·Θ. In a one-dimensional comparison with common scalar 2 and transfer scalar −2, both compositions give −4; replacing the target scalar by 3 gives −6 and fails the common-action requirement.

*Needs:* §1.4; §0.0.

### 1.6 Stable inner form Hecke formula

For dominant μ, basic b∈B(G,μ), matching strongly regular elliptic elements g in G(E), g_b in G_b(E), and stable Θ in SD(G_b), T_μ(Θ)(g)=e(G)e(G_b)(dim V_μ)Θ(g_b). For stable Ξ in SD(G), T_μ^rev(Ξ)(g_b)=e(G)e(G_b)(dim V_μ)Ξ(g). The signs e are the Kottwitz signs, including e(G*)=1 for a quasi-split form. (H26, Proposition 2.7(ii), p. 9; H26 line 415; HKW22, Theorem 6.5.2, pp. 65–66, HKW22 line 3190.)

Use the all-weight shriek trace contract: the adapted shriek HKW elliptic formula is the sum over pairs (λ,[g_b]) with inv[b](g,g_b)=the coinvariant image of λ, weighted by dim V_μ[λ], multiplied by e(G)e(G_b). HKW Remark 3.2.5 gives uniqueness and Fu Lemma 4.2.7 gives existence for each occurring weight. Stability makes the character value independent of [g_b]. For the reverse operator use the reversed invariant, weight duality, and the same sign product; sum all weight dimensions.

**Checks.**

- For GL₂ and D× with μ=(1,0), the weights (1,0) and (0,1) both have coinvariant image 1 in X_*(T_g)_Γ≃ℤ for the elliptic quadratic torus. Each therefore determines the same unique class [g_b]; the multiplicity sum is 1+1=2, not one copy per distinct class.
- For the GL₂/quaternion pair, e(G)e(G_b)=−1 and dim V_(1,0)=2. A stable elliptic value 3 gives −6 in both directed formulas. The trivial modification gives +1 times the original value; dropping the inner-form sign changes −6 to +6.

*Needs:* §1.4; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; EndoscopicTransferAndUnitaryTraceComparison §1.13; GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”; ReductiveGroupsPartII §RG2.5; gap:all-weight-shriek-trace; gap:weight-fibre-classes.

### Examples

A complex with cohomology dimensions 2 in degree 0 and 1 in degree 1 has Euler value 2−1=1; shifting it once gives −2+1=−1. This is why finite-length cohomology suffices without t-exactness. For the GL₂/quaternionic elliptic comparison and μ=(1,0), a stable value 3 produces −2·3=−6 in either Hecke direction. The sign is the same one as in the conventions.

### Dependencies

Layer 0 for the character conditions; HeckeStacksAndLocalShtukas HS1 and §§HS3.8, HS3.10; BunGAndNewtonStrata §§0.6, 1.13, 1.18–1.19 and 1.23; GeometricSatakeAndFusion GS4; gap:all-weight-shriek-trace; §0.0; gap:weight-fibre-classes; gap:bernstein-distribution-realization; gap:arthur-stable-decompositions; gap:irreducible-character-independence; the exact K₀ and Euler-sum declarations.

## Layer 2: quantitative stable averaging

### 2.1 Finite stable averaging on elliptic classes

For strongly regular elliptic g, let R_g be the finite nonempty set of G(E)-conjugacy classes in the stable class of g. For a conjugation-invariant function h on the elliptic locus define Av(h)(g)=|R_g|^(-1) sum_[g′] in R_g h(g′). This is the finite arithmetic mean, not a measure-weighted mean. For a virtual character the notation Av(Θ) denotes this function only; it is not by definition a virtual character. (H26, §2.2, p. 8; H26 line 365; FU25, §§3.1–3.3, pp. 18–21, FU25 line 717.)

EndoscopicTransferAndUnitaryTraceComparison §1.14(b) supplies finite rational class fibers; membership of g makes R_g nonempty. Use Mathlib finite expectation on the finite class set; conjugation invariance makes representatives immaterial.

The construction has the following API.

- Av(h)(g) equals the finite expectation of h over R_g.
- Av is complex linear on conjugation-invariant elliptic functions.
- Stably conjugate elliptic inputs have the same average.
- Av(Av(h))=Av(h).
- For any enumeration of R_g by a nonempty finite type, the value equals Mathlib finite expectation, independently of the enumeration.

**Checks.**

- If R_g has two classes with h-values 2 and 6, Av(h)(g)=4; a sum without division gives 8.
- If R_g is a singleton with value 2, Av(h)(g)=2; in particular this holds for a torus. Adding a spurious class of value 0 would give 1.
- The average of the zero function is 0; a constant nonzero assignment fails linearity on this degenerate input.
- For the two values 2 and 6, the weighted sum with weights 1/4 and 3/4 equals 5 and is not the stable average 4.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; Mathlib `Finset.expect`; Mathlib `Fintype.expect_eq_sum_div_card`.

### 2.2 The dual-root averaging sequence

For m a nonnegative integer define μ_m=4m ρ_dual=2m sum_(alpha positive root of Ĝ) alpha in X*(T̂)=X_*(T). Write N=the number of positive roots of Ĝ and d_m=dim V_(μ_m)=(4m+1)^N. Then μ_m is dominant, in the dual root lattice, trivial on Z(Ĝ)^Γ, and V_(μ_m) is self-dual. Averaging estimates use m≥1. (H26, §2.2, p. 8, with the positive roots of Ĝ as in FU25; H26 line 365; FU25, Lemmas 3.1.2–3.1.3, pp. 18–19, FU25 line 719 and line 773.)

Use ReductiveGroups Layer 10B for L(μ_m)=V_(μ_m) and its Weyl character in ℤ[X*(T̂)], including its central weights. Specialize the denominator identity and Weyl formula to obtain `ch(V_(mu_m)) = product_(alpha>0) sum_(j=-2*m)^(2*m) e^(j*alpha)`. Evaluate at one for d_m and negate weights for self-duality. Writing μ_m as 2m times the positive-root sum makes it a character even when ρ_dual is not one. Every Weyl-vector pairing with a positive coroot is positive; the resulting finite group-algebra identity has no division by a root value at a singular torus element (FU25, Lemma 3.1.2 and its proof, pp. 18–19; FU25 line 719 and line 731).

The construction has the following API.

- μ_m is 2m times the sum of positive roots of Ĝ, viewed as a cocharacter of G.
- μ_0=0 and d_0=1.
- V_(μ_m) has trivial action of Z(Ĝ)^Γ, hence 1 belongs to B(G,μ_m).
- The formal character is product_(alpha positive root of Ĝ) sum_(j=-2m)^(2m) e^(j alpha), with each root string having length 4m+1.
- d_m=(4m+1)^N is positive.
- There exists a Ĝ-equivariant isomorphism from V_(μ_m) to its contragredient; no canonical choice of invariant pairing is claimed.

**Checks.**

- With no roots, μ_m=0 and d_m=1 for every m. The empty product is 1, so a dimension formula returning 0 would exclude tori.
- In dual type A₁ with positive root α, μ_m=2mα and d_m=4m+1, giving μ₁=2α and d₁=5. Using 2mρ instead would give dimension 3.
- For G of type B2 with positive roots e1-e2,e2,e1,e1+e2, the positive coroot sum is 4e1+2e2, so μ_m=8m e1+4m e2. Using the G-root sum 3e1+e2 would give a different, incorrect sequence.
- At m=0 the representation is trivial of dimension 1 and the Hecke operator is the identity. The asymptotic estimate 1/m is excluded here, so no value is inferred by division by 0.
- For a basic b, choose a cocharacter lifting κ(b)∈π₁(G)_Γ and replace it by its dominant Weyl conjugate μ. BunGAndNewtonStrata §1.23's basic acceptability puts b in B(G,μ); for b=1, membership is equivalent to μ♯=0, equivalently trivial restriction to Z(Ĝ)^Γ by EndoscopicTransferAndUnitaryTraceComparison §1.11. For GL₂, μ=(1,0) gives κ=1 and basic slopes (1/2,1/2), so 1 is excluded; μ=(1,−1) gives κ=0 and includes 1. This distinguishes full integral κ from its rationalization.
- In the differentiated SL₂ representation of highest weight 4, the weights are 4,2,0,−2,−4, each once, and the dimension is 5. Reversing the root system exchanges opposite weights without changing the character.
- On GL₂ the two representations det and 1 restrict to the same trivial derived Lie module but have central characters z↦z² and 1. The supplied full torus-weight character excludes using det as V₀.

*Needs:* ReductiveGroups Layers 1, 2, 7 and 10A–10B; GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”; ReductiveGroupsPartII §RG2.5; Tau Ceti `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` and `TauCeti.finrank_eq_prod_coweightPairing_div`; BunGAndNewtonStrata §1.23; EndoscopicTransferAndUnitaryTraceComparison §1.11.

### 2.3 Normalized weight multiplicity kernel

For m≥1 and g′ representing a class in R_g, define C_m(g,g′)=d_m^(-1) sum_(λ with coinvariant image inv(g,g′)) dim V_(μ_m)[λ]. This is a finitely supported weight sum, and each C_m is a nonnegative real rational number, with sum_(R_g) C_m(g,g′)=1. Equivalently it is the pushforward to H_g=ker(X_*(T_g)_Γ → π₁(G)_Γ) of the normalized weight multiplicity distribution, transported along the invariant bijection R_g≃H_g. (H26, Lemma 2.6 proof, p. 8; H26 line 382; FU25, Lemmas 3.2.1–3.2.3 and 4.2.7, pp. 20 and 24–25, FU25 line 794 and line 955.)

Import integral π₁, the torus Kottwitz description and basic-class classification from BunGAndNewtonStrata §§1.11 and 1.36 and ReductiveGroupsPartII §RG2.1.5. Use gap:basic-invariant-comparison for their compatibility with the stable-conjugacy invariant. Then use gap:weight-fibre-classes for uniqueness and existence of invariant fibers and Fu Lemmas 3.2.1–3.2.3 for the finite H_g quotient of the dual root lattice. Sum nonnegative integer weight dimensions over each fiber and divide by positive d_m. Each occurring weight has exactly one class, so the mass is one. The all-weight trace contract supplies the geometric formula; gap:weight-fibre-classes supplies its invariant fibres.

The construction has the following API.

- Each coefficient is the sum of weight multiplicities in its invariant fiber divided by d_m.
- Every coefficient is nonnegative.
- The coefficients over all classes in R_g sum to one.
- Via R_g≃H_g this is the pushforward of the normalized finite weight multiset; reordering or changing a representative leaves it unchanged.
- For any Θ, normalized self-Hecke elliptic evaluation is the sum of C_m(g,g′)Θ(g′).

**Checks.**

- For an elliptic quadratic norm-one torus in SL₂, X_*(T)_Γ=ℤ/2 and π₁(SL₂)=0, so H_g=ℤ/2 has two invariant classes 0 and 1. Rationalizing the coinvariants gives 0 and would merge those distinct rational classes; the integral comparison must preserve both.
- For a torus, H_g=0, R_g is a singleton and its coefficient is 1. An unnormalized weight count or an empty-fibre convention would lose this unit mass.
- In dual type A1 with root lattice Z alpha and quotient Z/2 mapping alpha to 1, weights j alpha for -2m≤j≤2m have multiplicity one. The two masses are (2m+1)/(4m+1) and 2m/(4m+1), rather than exactly 1/2.
- For m=1 in that quotient, the masses are 3/5 and 2/5 and their sum is 1; replacing the finite kernel by its limiting uniform distribution would incorrectly give 1/2 in each class.
- For G=GL₁ the full cocharacter coinvariant group is Z but H_g=ker(Z→Z)=0. A construction averaging over all of Z fails both finiteness and the singleton coefficient test.

*Needs:* §2.2; §2.1; EndoscopicTransferAndUnitaryTraceComparison §1.2(a); EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”; ReductiveGroupsPartII §RG2.5; ReductiveGroupsPartII §RG2.1.5; BunGAndNewtonStrata §1.36; BunGAndNewtonStrata §1.11; gap:basic-invariant-comparison; gap:weight-fibre-classes; gap:all-weight-shriek-trace.

### 2.4 Uniform quantitative weight equidistribution

First prove the root-lattice form `weightPushforward_sum_abs_sub_uniform_le`: for every finite-dimensional semisimple Lie algebra over an algebraically closed field K of characteristic zero, a Cartan subalgebra and a root-system base b, let Q be the additive subgroup generated by its roots. For every finite abelian group A and surjective homomorphism φ:Q→A, there is C≥0 such that, for every m≥1 and every finite-dimensional module M generated by a highest-weight vector of weight μ_m=2m·2ρ, the pushforward p_m of its weight multiplicities along φ, divided by dim M, satisfies sum_(a∈A)|p_m(a)−1/|A||≤C/m. C is independent of m and M. The nonzero highest-weight vector makes dim M positive; all its weights lie in Q. This is §2.4(a), the general root-lattice estimate deduced here from FU25 Lemma 3.1.2 and the degree bound in the proof of Proposition 3.3.1, pp. 18–21 (FU25 line 719 and line 852); H26 uses the C/m rate in the proof of Lemma 2.6 (H26 line 393).

For §2.4(b), transport that estimate through R_g≃H_g and finitely many rational torus types: there exists C_G≥0 such that for every strongly regular elliptic g and m≥1, sum_(g′ in R_g) |C_m(g,g′)-1/|R_g|| ≤ C_G/m. If N=0 then H_g and R_g are singletons and the left side is zero. (H26, Lemma 2.6 proof, pp. 8–9; H26 line 393; FU25, Proposition 3.3.1 and proof of Theorem 4.3.1, pp. 21 and 26–27, FU25 line 823 and line 1085.)

For N=0 the kernel is the trivial group and the error is zero. For N≥1, Fu identifies H_g as a finite quotient of the dual root lattice; a nontrivial character is nontrivial on some positive dual root. Evaluate the product formula: the corresponding geometric-series factor has absolute value at most 2/|1−χ(α)|, whose denominator is nonzero, while the other N−1 factors are at most 4m+1 in absolute value. Divide by (4m+1)^N. Apply finite abelian Fourier inversion and orthogonality (Mathlib `AddChar.complexBasis` and `AddChar.wInner_cWeight_eq_boole`) to bound the error for every h in H_g. The elliptic-torus representative contract/HKW Lemma 3.1.1 supplies finitely many rational maximal-torus conjugacy types. Take the maximum of the finitely many constants and cardinalities. The bound applies for every positive m; any finitely many initial estimates can be absorbed into the same constant.

**Checks.**

- In the type-A₁ root-lattice quotient ℤ/2 the ℓ¹ error is 1/(4m+1): at m=1 and 2 it is 1/5 and 1/9. C=1/4 works in (a), since 1/(4m+1)≤1/(4m). For A=0, the normalized mass is 1 and the error is 0; if there are no roots, a surjection forces A=0 and a highest-weight-generated module has dimension 1. At m=0 for A=ℤ/2 the masses are (1,0) and the error is 1, whereas Lean's total C/0 is 0; this is why m≥1 is essential. A nonsurjective map from Q=ℤα to ℤ/2 with φ(α)=0 has masses (1,0), error 1 for every m, and violates every fixed C/m estimate. For a torus the error is 0 for every m, including the extension m=0; an estimate containing 1/m is asserted only for m≥1.

*Needs:* For (a), Tau Ceti `TauCeti.formalCharacter`, `TauCeti.IsHighestWeightVector`, `TauCeti.twoWeylVector` and `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`, Mathlib `AddChar.complexBasis` and `AddChar.wInner_cWeight_eq_boole`; for (b), §2.3; gap:basic-invariant-comparison; gap:weight-fibre-classes; §2.2; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:elliptic-torus-representatives.

### 2.5 Discriminant-weighted character averaging

Let Θ be any element of D(G), and U a compact subset of G(E) with this property: for each elliptic stable class meeting U, U contains a representative of every rational conjugacy class in it. Then there is C_(Θ,U)≥0 such that for all m≥1 and g in U strongly regular elliptic, |D_G(g)|^(1/2) |d_m^(-1) T_(μ_m)(Θ)(g)-Av(Θ)(g)| ≤ C_(Θ,U)/m. (H26, Lemma 2.6, pp. 8–9; H26 line 368.)

Use the all-weight shriek trace contract self-Hecke elliptic formula to identify d_m^(-1)T_(μ_m)(Θ)(g) with sum_(R_g) C_m(g,g′)Θ(g′). Subtract the arithmetic average and apply the sum of absolute coefficient errors from uniform weight equidistribution. The Weyl discriminant is stable-invariant: stable conjugacy from EndoscopicTransferAndUnitaryTraceComparison §1.3 conjugates Ad(g) on Lie(G)/Lie(T_g) after extension to Ē, so det(1−Ad(g)) and hence D_G(g) agree in E. Choose representatives in U and use EndoscopicTransferAndUnitaryTraceComparison §2.16 for local boundedness of |D|^(1/2)|Θ| on compact sets. The all-weight trace contract supplies the geometric formula; gap:weight-fibre-classes supplies its invariant fibres.

**Checks.**

- For GL₂ over ℚ₅, g=diag(2,3) and its conjugate diag(3,2) have D=(1−2/3)(1−3/2)=−1/6 and |D|₅=1 in both orders. Inversion leaves the same product. The torus has an empty root product D=1; a diagonal matrix with repeated entries lies outside the strongly regular domain.
- For two class values 2 and 6, A₁ quotient masses 3/5 and 2/5 give 18/5, whereas the average is 4; the error is 2/5. At m=2 the masses 5/9 and 4/9 give 34/9 and error 2/9. With discriminant norm 1 the weighted errors are those same values.

*Needs:* §1.1; §2.3; §2.4; §2.1; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:all-weight-shriek-trace; EndoscopicTransferAndUnitaryTraceComparison §2.16.

### Examples

For dual type A₁ and m=1, the five weights −2α,−α,0,α,2α project to three even and two odd classes in ℤ/2. The kernel is (3/5,2/5), the average kernel is (1/2,1/2), and the ℓ¹ error is 1/5. Values (2,6) therefore give Hecke mean 18/5 and stable average 4. At m=2 these become masses (5/9,4/9), error 1/9, and value 34/9. This is a quotient-lattice example, not a claim that every local torus produces that quotient.

### Dependencies

Layer 1 character operators; BunGAndNewtonStrata §§1.11, 1.36 and gap:basic-invariant-comparison; gap:weight-fibre-classes; EndoscopicTransferAndUnitaryTraceComparison §§1.3, 1.14 and 2.16; gap:elliptic-torus-representatives; gap:all-weight-shriek-trace; the dual group/Satake and pinned Lie Weyl inputs; Mathlib finite Fourier theory.

## Layer 3: stability of the Fargues–Scholze centre

### 3.1 Compact representatives for the cuspidal integrals

Choose finitely many representatives T of rational elliptic maximal-torus conjugacy classes and compact subsets C_T of T(E). There is a compact U in G(E) containing all C_T such that every strongly regular elliptic stable class meeting U has representatives of every rational conjugacy class in U. (H26, §2.3, pp. 10–11, compact-U step; H26 line 505; HKW22, Lemma 3.1.1 and proof, p. 13, HKW22 line 577.)

The elliptic-torus representative contract supplies finitely many torus types. EndoscopicTransferAndUnitaryTraceComparison §1.14(a)–(b) parametrizes the G(E)-classes of E-embeddings Ad(x)|_T with x∈G(Ē) and x⁻¹σ(x)∈T, the embeddings stably conjugate to the inclusion, by the finite set D(T,G;E). For each T choose one representative for each of those embedding classes, including the inclusion. Take the union of their images of C_T. This finite union is compact. A strongly regular element in one image has that embedded torus as centralizer; every rational conjugacy class in its stable class is represented by another chosen embedding of the same original element.

**Checks.**

- For a torus choose C_T={1}; U={1} is compact and its single rational class is represented. Empty C_T give U=∅, with no elliptic class meeting it. For SL₂, conjugating [[0,−1],[1,0]] by diag(ϖ^n,ϖ^(−n)) produces off-diagonal valuations 2n and −2n; the resulting orbit is unbounded, so a compact set of representatives cannot be replaced by its full conjugacy saturation.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:elliptic-torus-representatives.

### 3.2 Averaging against cuspidal test functions

For Ξ in D_temp(G) let P_st(Ξ) in SD_temp(G) be its stable projection from the EndoscopicTransferAndUnitaryTraceComparison contracts. For every cuspidal f in I(G)_cusp, (d_m^(-1)T_(μ_m)(Ξ)-P_st(Ξ))(f) tends to zero as m tends to infinity. More precisely, there exists C_(Ξ,f)≥0, depending only on Ξ and f, such that its absolute value is at most C_(Ξ,f)/m for every m≥1. (H26, §2.3, pp. 10–11; H26 line 497.)

EndoscopicTransferAndUnitaryTraceComparison §2.16(c) gives the Weyl integration formula as a finite sum over representatives of all conjugacy classes of maximal tori; for cuspidal f the terms of the non-elliptic tori vanish by the orbital-integral characterization of cuspidality in gap:kazhdan-cuspidal-decomposition, leaving a finite sum of integrals over elliptic tori. Its §2.1 normalized-orbital-integral theorem gives bounded |D|^(1/2)O_t(f), after the finite measure factor in the supplier contract; gap:bounded-elliptic-orbital-integrals supplies only the compact orbital-support closures C_T. Gap:stable-tempered-projection supplies P_st(Ξ)(g)=Av(Ξ)(g) for elliptic g. Choose compact U using compact stable representatives; character averaging bounds the other factor |D|^(1/2)(d_m^(-1)T(Ξ)-P_st Ξ) by C/m on all C_T. Extend that weighted factor by zero outside the strongly regular locus, and apply `MeasureTheory.norm_integral_le_of_norm_le_const` on each compact C_T. Sum the finitely many Weyl coefficients.

**Checks.**

- For a torus G=T with H26’s central quotient, O_t(f)=c f(t), where c=vol(T(E)/A_T(E)) is finite and positive. Thus the nonzero orbital locus has closure supp(f), compact because f is locally constant and compactly supported; for f=0 it is empty. The test 1_(𝒪_E×) on GL₁ has compact support 𝒪_E×, whereas the constant function 1 is not in H(GL₁).
- On a single compact torus piece of measure 2 with orbital factor bounded by 3 and weighted character error bounded by 5/m, the integral norm is at most 30/m. For f=0 both the integral and constant are 0. Keeping only one half-discriminant would not give the bounded product used in this estimate.
- For GL₂ and f=1_K with K=GL₂(𝒪_E), the split-torus term of the Weyl integration formula is nonzero, since O_(diag(a,b))(1_K)=1 for units a,b with |a−b|=1; f is not cuspidal, its constant term along the split torus being 1 on T(𝒪_E), so the estimate is not asserted for it. For a matrix coefficient of a supercuspidal representation the split term vanishes and only the elliptic tori remain.

*Needs:* §2.5; §3.1; §2.1; SmoothRepresentationsOfLocalGroups §SR.2.2; gap:normalized-bernstein-levi; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; Mathlib `MeasureTheory.norm_integral_le_of_norm_le_const`; gap:kazhdan-cuspidal-decomposition; gap:arthur-stable-decompositions; gap:stable-tempered-projection; gap:bounded-elliptic-orbital-integrals; EndoscopicTransferAndUnitaryTraceComparison §2.16.

### 3.3 Very stability of the Fargues–Scholze center

For every connected reductive G over every finite extension E of ℚ_p, Ψ_G:Z_spec(G)→Z(G) factors through Z_vst(G). Hence Z_FS(G)=range(Ψ_G) is contained in Z_vst(G), and all its elements are stable distributions. There is no tameness, residual-prime-size, quasi-splitness or discrete-parameter restriction. (H26, Theorem 1.1, p. 2; proof §2.3, pp. 9–11; H26 line 438.)

Induct on semisimple rank. For an induced stable tempered character i_M^G Θ_M, use the normalized spectral-Levi target in §0.0 and gap:normalized-bernstein-levi for the central restriction identity z·i_M^G=i_M^G(r_M(z)·-), with r_M(Ψ_G a)=Ψ_M(res a). The smaller-rank result makes this stable. The EndoscopicTransferAndUnitaryTraceComparison harmonic-analysis contracts supply the Arthur decomposition into induced and elliptic stable tempered summands and Hansen Lemma 2.1 preserving the cuspidal/noncuspidal test-function splitting. Reduce to Θ in SD_ell(G) and unstable cuspidal f; z*f is cuspidal. For each admissible μ set C_μ=d_μ^(-1)T_μ(Θ)(z*f). The comparison modulo induced characters makes this equal to the constant Θ(z*f), because induced characters vanish on cuspidal functions. Hecke central commutation rewrites C_(μ_m)=d_m^(-1)T_(μ_m)(Ξ)(f) for Ξ=z·Θ. Ξ is tempered, independently of stability. Subtract P_st Ξ, which vanishes on unstable f, then apply the cuspidal pairing limit to show this constant is zero. The very-stability character criterion finishes the induction. At semisimple rank zero G is a torus and stable conjugacy is rational conjugacy.

**Checks.**

- For a torus, U=0 and every image element preserves it. In the cuspidal reduction, a constant c satisfying |c|≤C/m for every positive integer m is zero: a putative c=1 fails at m>C. This calculation forces Θ(z∗f)=0 without assuming z·Θ stable.

*Needs:* §0.4; §0.3; §1.2; §1.3; §3.2; gap:normalized-bernstein-levi; §0.0; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3; gap:arthur-stable-decompositions; gap:kazhdan-cuspidal-decomposition; gap:unstable-tempered-separation.

### Examples

For f=0 the cuspidal integral and its limit are both 0. On one compact piece of measure 2, bounds 3 for the orbital factor and 5/m for the weighted character factor give 30/m. A constant value c of the normalized pairing satisfying |c|≤30/m for every m is 0; c=1 already fails at m=31. A torus has no proper-Levi summand and no unstable function except 0.

### Dependencies

Layers 0–2; EndoscopicTransferAndUnitaryTraceComparison §§2.1 and 2.16; gap:arthur-stable-decompositions; gap:kazhdan-cuspidal-decomposition; gap:stable-tempered-projection; gap:bounded-elliptic-orbital-integrals; gap:unstable-tempered-separation; gap:elliptic-torus-representatives; gap:normalized-bernstein-levi; §0.0; Mathlib finite-measure integral bounds.

## Layer 4: atomic characters and L-packets

### 4.1 Atomically stable virtual characters

A virtual character Θ=sum_(i in S) a_i Θ_(π_i) is atomically stable if S is a finite nonempty set of pairwise nonisomorphic irreducible smooth representations, every a_i is nonzero, Θ is stable, and every nonzero stable virtual character supported in S has support exactly S. Coefficients of the competing virtual character are arbitrary complex numbers, not necessarily the a_i. Equivalently its irreducible-character coefficient vector is a nonzero support-minimal member of the stable-character subspace. (H26, §1.1 before Corollary 1.2, p. 2; H26 line 74.)

Use gap:irreducible-character-independence for linear independence of irreducible characters to make finite coefficient support intrinsic. Express minimality as the absence of a nonzero vector of smaller support in the stable-character subspace; match it to `Finsupp.support` and `Submodule` without defining a replacement character carrier.

The construction has the following API.

- An atomically stable virtual character is nonzero.
- An atomically stable virtual character belongs to SD(G).
- A nonzero stable vector with support contained in the atomic support has the same support.
- For c nonzero, cΘ is atomically stable if and only if Θ is.
- Under the irreducible-character coefficient isomorphism, atomic stability is precisely nonzero support minimality in the stable submodule of complex finitely supported functions.

**Checks.**

- The zero character has empty support and is not atomically stable. Omitting nonzeroness would make minimality vacuous.
- Each irreducible character of a torus is stable and atomically stable: its support has cardinality 1 and each nonzero competitor has that same support. Requiring at least two constituents fails this case.
- A combination of two distinct irreducible torus characters with both coefficients nonzero is stable but is not atomically stable: either singleton gives smaller stable support, of size 1 instead of 2. If one coefficient is 0 and the other is nonzero, the character is atomically stable; merely requiring the whole combination to be nonzero would give a false negative control.
- In the coefficient-space fixture SD=span{(1,2,0),(1,1,1)} in ℂ³, (1,1,1) is not support minimal because (1,2,0) has smaller support, although none of its nonempty proper 0/1 partial sums is in SD.
- In the line submodule span{(1,2)} of ℂ², every nonzero vector is support minimal; this checks the exact Finsupp/Submodule criterion used on the finite-support carrier.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; Mathlib `Finsupp`; Mathlib `Finsupp.mem_support_iff`; Mathlib `Submodule`; gap:irreducible-character-independence.

### 4.2 Scalar rigidity on an atomic stable support

Let Θ=sum_(i in S) a_i Θ_(π_i) be atomically stable and z in Z_vst(G). Then z_(π_i)=z_(π_j) for every i,j in S, where z_π is the scalar by which z acts on π. (Deduced here using §0.4 and atomic minimality; H26 states Corollary 1.2 without a printed proof, p. 2, H26 line 77.)

Very stability makes z·Θ stable. Fix i in S and subtract z_(π_i)Θ; the result is stable and its i coefficient is zero. Its support is contained in S but is strictly smaller unless the vector is zero. Atomic minimality forces it to be zero. For each j, a_j is nonzero, so the j coefficient equation implies z_(π_j)=z_(π_i).

**Checks.**

- For atomic coefficient vector (1,2), eigenvalues 3 and 3 give z·Θ=(3,6). Unequal eigenvalues 3 and 5 give z·Θ−3Θ=(0,4), a nonzero vector of smaller support; it cannot be stable if Θ is atomic.

*Needs:* §4.1; §0.4; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.3.1–SR.3.3.

### 4.3 FS parameters on atomic stable supports

If Θ=sum_(i in S) a_i Θ_(π_i) is atomically stable, all π_i have the same Fargues–Scholze semisimple L-parameter conjugacy class. Equality is equality in the set of Ĝ-conjugacy classes of continuous semisimple Weil parameters with the prescribed Weil projection, using the coefficient topology of the supplied continuous Weil-parameter object before transport by ι. (H26, Corollary 1.2, p. 2; H26 line 77.)

The statement applies to any finite set of irreducibles whose character sum is atomically stable. H26 Corollary 1.3 (p. 2; H26 line 79) is this instance for Kaletha’s regular supercuspidal packets, whose construction and atomic stability are not targets here; the FKS21v2 reference below records the scope of its stability theorem.

Apply FS very stability and atomic scalar rigidity to every spectral central function. The imported parameter of §0.0 (AutomorphicGaloisRepresentationsPartII AG2.6) and LanglandsParameterStacks §3.9 identify these scalar evaluations with the invariant coordinates of the semisimple parameter. Apply LanglandsParameterStacks §3.6 to conclude equality of the conjugacy classes, with coefficients transported by the fixed ι.

**Checks.**

- For a torus singleton the unique representation has its own FS class. For two semisimple diagonal Weil parameters with Frobenius values diag(2,3) and diag(3,2), all invariant coordinates agree and the classes coincide. diag(2,4) has trace 6 instead of 5 and is separated. Equal trace alone is not asserted to determine arbitrary dual-group parameters.

*Needs:* §3.3; §4.2; §0.0; AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”; LanglandsParameterStacks §3.6; LanglandsParameterStacks §3.9.

### Examples

In the stable line span{(1,2)}, diag(3,3) acts by 3. diag(3,5) would give (3,10), and subtracting 3(1,2) leaves (0,4), contradicting minimal support. In span{(1,2,0),(1,1,1)}, the vector (1,1,1) has a smaller stable competitor (1,2,0), although none of its nonempty proper 0/1 partial sums is stable. Arbitrary coefficients are indispensable.

### Dependencies

Layer 0 and the stability theorem of Layer 3; §0.0; gap:irreducible-character-independence; AutomorphicGaloisRepresentationsPartII AG2.6, “The parameter stack and geometric spectral action”; LanglandsParameterStacks §§3.6 and 3.9.

## Layer 5: centres of extended pure inner forms

### 5.1 Kernel inclusion for extended pure inner forms

Let G* be quasi-split over E, let b be basic in B(G*), and put G=G*_b. Under the canonical identification of the spectral centers, ker(Ψ_(G*)) is contained in ker(Ψ_G). (H26, Theorem 1.4, p. 3; proof §2.4, pp. 11–12; H26 line 522.)

Prove the contrapositive by semisimple-rank induction. If z=Ψ_G(a) is nonzero, §0.5 faithfulness and §3.3 very stability give a stable tempered character detected by z. Use the stable Arthur decomposition from the EndoscopicTransferAndUnitaryTraceComparison contracts. If an induced proper-Levi component is detected, the normalized center restriction is nonzero; choose M* and its basic lift b_M for the detected Levi M using gap:basic-levi-lift; the smaller-rank kernel inclusion for M≃(M*)_(b_M), together with the normalized spectral-Levi target in §0.0, forces Ψ_(G*)(a) nonzero. Otherwise choose Θ in SD_ell(G) with z·Θ nonzero. Central invariance of the ordinary elliptic summand and injectivity of elliptic restriction, from the EndoscopicTransferAndUnitaryTraceComparison contracts, give an elliptic g with nonzero value. BunGAndNewtonStrata §1.23 supplies a dominant μ with b in B(G*,μ), by the lift calculation of §2.2; the all-weight shriek trace contract supplies the adapted shriek trace formula. EndoscopicTransferAndUnitaryTraceComparison §§1.6(ii)–(iii) supply a matching elliptic element g* in G*. The stable inner-Hecke formula makes T_μ(z·Θ)(g*)=e(G)dim(V_μ)(z·Θ)(g), which is nonzero. Inner central commutation identifies this with Ψ_(G*)(a)·T_μ(Θ), so Ψ_(G*)(a) cannot vanish. The rank-zero case uses the same elliptic argument.

**Checks.**

- For G=D×, the quaternionic inner form of G*=GL₂ with κ(b)=1, there is no proper E-rational parabolic Levi: the only M is G, with M*=GL₂ and b_M=b. The diagonal torus of GL₂ is the M* of no Levi of D×; it is irrelevant in §6.1.
- For b=1 both kernels are the same ideal. In the elliptic detection step, scalar action value 3, dimension 2 and sign −1 give −6≠0, forcing the quasi-split operator to be nonzero. The zero spectral element maps to 0 on both forms.

*Needs:* §0.5; §3.3; §1.5; §1.6; gap:normalized-bernstein-levi; BunGAndNewtonStrata §§1.13, 1.18–1.19; BunGAndNewtonStrata §1.11; BunGAndNewtonStrata §1.23; gap:basic-levi-lift; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.6; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:elliptic-torus-representatives; SmoothRepresentationsOfLocalGroups §SR.2.2; gap:arthur-stable-decompositions; gap:all-weight-shriek-trace; §0.0.

### 5.2 The surjective map between FS centers

For G*=quasi-split and G=G*_b with b basic, define τ_G:Z_FS(G*) → Z_FS(G) by τ_G(Ψ_(G*)(a))=Ψ_G(a). This is the unique surjective Z_spec(G*)-algebra map satisfying that identity, where each FS center is the image subalgebra rather than the whole Bernstein center. (H26, Theorem 1.4, p. 3; construction §2.4, pp. 11–12; H26 line 114.)

Use kernel inclusion to show that the formula is independent of the spectral lift. Use `Ideal.quotientKerEquivRange`, the first-isomorphism equivalence between a source modulo the kernel and the image, together with the universal property of the quotient, to obtain the algebra map. Surjectivity follows by choosing the same spectral element for every element of the target image; uniqueness follows because the source is an image.

The construction has the following API.

- Kernel inclusion induces τ_G between the two image algebras.
- τ_G(Ψ_(G*)(a))=Ψ_G(a) for each spectral element a.
- τ_G preserves addition, multiplication, one and the common spectral algebra action.
- Every element of Z_FS(G) is τ_G(x) for a source image element x.
- An algebra map from Z_FS(G*) agreeing with τ_G on every Ψ_(G*)(a) equals τ_G.
- Via `Ideal.quotientKerEquivRange`, τ_G is the quotient map induced by ker(Ψ_(G*)) ≤ ker(Ψ_G).

**Checks.**

- For b=1 on G*, τ_G is the identity of Z_FS(G*); it fixes both 0 and 1. An arbitrary quotient endomorphism would not satisfy the formula on all spectral lifts.
- τ_G maps 0 to 0 and the convolution unit to the convolution unit 1. The zero map fails the second equality in the nonzero complex image algebra.
- In semisimple rank zero, G*=T is a torus and every basic b has T_b=T: the σ-centralizer equation is commutative. The basic comparison in §0.0 identifies both spectral actions, so τ_T is the identity on Z_FS(T) even for b≠1. For T=GL₁ and b of degree 1 it fixes the geometric-Frobenius coordinate as well as 0 and 1; a quotient with nonzero kernel fails this test.
- For source A=ℂ[X], maps id_A and evaluation at zero induce the quotient A → ℂ, sending X to zero and constants to themselves.
- For the two projections ℂ×ℂ→ℂ, ker(pr1) is not contained in ker(pr2); no map τ:ℂ→ℂ can satisfy τ(pr1(x))=pr2(x) for every x. This rejects reversing or omitting kernel inclusion.

*Needs:* §5.1; §0.0; Mathlib `AlgHom.range`; Mathlib `AlgHom.rangeRestrict`; Mathlib `AlgHom.rangeRestrict_surjective`; Mathlib `Ideal.quotientKerEquivRange`.

### 5.3 Compatibility of tau with Levi restriction

If M is an E-rational parabolic Levi of G=G*_b, choose M* and a basic lift b_M as in gap:basic-levi-lift, so M≃(M*)_(b_M); then r_M o τ_G = τ_M o r_(M*) on Z_FS(G*), with all four maps restricted to their FS image subalgebras and normalized parabolic induction. (H26, Theorem 1.4(i), p. 3; §2.4, p. 12; H26 line 566.)

Use the normalized spectral-Levi target in §0.0 to obtain r_M(Ψ_G(a))=Ψ_M(res_(M*) a) and the corresponding identity on G*. Evaluate both composites on Ψ_(G*)(a), use the defining formulas for τ_G and τ_M, and then use surjectivity of Ψ_(G*) onto its own range.

**Checks.**

- For the identity Levi M=G both composites are τ_G. Evaluated on Ψ_(G*)(a), each nontrivial Levi composite is Ψ_M(res a); at a=0 both give 0 and at a=1 both give 1. The required surjectivity is only onto the source image algebra.

*Needs:* §5.2; gap:normalized-bernstein-levi; SmoothRepresentationsOfLocalGroups §SR.2.2; gap:basic-levi-lift; §0.0.

### Examples

For A=ℂ[X], the identity map to A and evaluation at zero have kernels 0 and (X). The resulting image map sends X to 0, 1 to 1 and X+2 to 2. By contrast the projections ℂ×ℂ→ℂ have incomparable kernels: (0,1) lies in ker(pr₁) and not in ker(pr₂). A map satisfying τ(pr₁(x))=pr₂(x) would require τ(0)=1. This detects the direction of kernel inclusion.

### Dependencies

Layers 0, 1 and 3; gap:arthur-stable-decompositions; §0.0; gap:normalized-bernstein-levi; gap:basic-levi-lift; gap:elliptic-torus-representatives; Mathlib image algebras and quotient equivalences.

## Layer 6: stable transfer compatibility

### 6.1 FS center action commutes with stable character transfer

For the extended pure inner form G=G*_b, z in Z_FS(G*) and Θ in SD_temp(G*), Trans_G(z·Θ)=τ_G(z)·Trans_G(Θ). Normalize Trans_G on elliptic stable characters by (Trans_G Θ)(g)=e(G)Θ(g*) for matching elliptic elements; it kills irrelevant Levi summands and commutes with induction from relevant Levi summands. (H26, Theorem 1.4(ii), p. 3; proof §2.4, pp. 12–13; H26 line 586.)

Use gap:stable-inner-character-transfer for the stable tempered transfer decomposition and elliptic isomorphism; the Kottwitz-sign convention and matching-function duality are fixed by that same contract. Induct on rank using the stable Arthur decomposition. On irrelevant Levi summands both sides vanish; on relevant proper-Levi summands choose the basic lift b_M from gap:basic-levi-lift and use smaller-rank character-transfer compatibility, the Levi square for τ and central restriction. For elliptic Θ use reverse inner Hecke: its elliptic restriction is dim(V_μ)Trans_G(Θ). Thus T_μ^rev(Θ)-dim(V_μ)Trans_G(Θ) is in D_ind(G), by the elliptic-kernel theorem in the harmonic-analysis contract. Apply reverse central commutation. The center preserves D_ind(G) and the elliptic summand; the same elliptic comparison applied to stable z·Θ identifies the desired two elliptic restrictions. Divide by the positive dimension and use injectivity of elliptic restriction on D_ell(G).

**Checks.**

- For an elliptic transferred value 3 with e(G)=−1 and common central scalar 2, the two sides have value −6 and −6. For an irrelevant Levi summand both sides are 0. An induced correction has elliptic value 0 even if its full virtual character is nonzero.

*Needs:* §3.3; §5.2; §5.3; §1.5; §1.6; §1.3; SmoothRepresentationsOfLocalGroups §SR.2.2; gap:normalized-bernstein-levi; EndoscopicTransferAndUnitaryTraceComparison §1.3; EndoscopicTransferAndUnitaryTraceComparison §1.14; EndoscopicTransferAndUnitaryTraceComparison §1.13; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:arthur-stable-decompositions; gap:stable-inner-character-transfer; gap:basic-levi-lift; §0.0.

### 6.2 FS central convolution preserves matching test functions

Suppose f* in H(G*) and f in H(G) have matching stable orbital integrals for the inner-form transfer factor e(G). For every z in Z_FS(G*), z*f* and τ_G(z)*f also have matching stable orbital integrals, including vanishing on stable classes in G* with no matching class in G. (H26, Theorem 1.4 final assertion, p. 3; proof §2.4, p. 13; H26 line 628.)

Use EndoscopicTransferAndUnitaryTraceComparison §4.7 smooth transfer in characteristic zero to choose a function h* on G* matching τ_G(z)*f. For every Θ in SD_temp(G*), transfer duality for (f*,f), character-transfer compatibility, and duality for (h*,τ_G(z)*f) give Θ(z*f* - h*)=0. Apply the EndoscopicTransferAndUnitaryTraceComparison harmonic-analysis contracts unstable-function criterion on G*: z*f* - h* has all stable orbital integrals zero. Linearity of matching in the stable-orbital contract gives the required equality and the vanishing on irrelevant classes.

**Checks.**

- If a matching elliptic pair has stable orbital values a and −a in the quaternion sign convention, scalar central element 2 gives 2a and −2a. For a=3 these are 6 and −6. An irrelevant class starts at 0 and remains 0; replacing matching representatives by unstable functions changes no stable orbital value.

*Needs:* §6.1; gap:stable-inner-character-transfer; §5.2; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.11; EndoscopicTransferAndUnitaryTraceComparison §4.7; §0.4; gap:unstable-tempered-separation.

### Examples

In the GL₂/quaternion example, elliptic value 3 transfers to −3. A spectral element acting by 2 gives −6 on both sides of character compatibility. Matching stable orbital values 3 and −3 become 6 and −6 under scalar convolution. Values on irrelevant classes are 0 on both sides throughout. These use the same sign and measures as Layers 0 and 1.

### Dependencies

Layers 0, 1, 3 and 5; gap:arthur-stable-decompositions; gap:stable-inner-character-transfer; gap:unstable-tempered-separation; gap:normalized-bernstein-levi; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 2.11 and 4.7.

## Downstream consumers

The spectral image is a supply of very stable distributions without a classification of local L-packets. Its central scalar rigidity is an interface for comparisons of L-packets once a consumer supplies an atomically stable character. The inner-form image quotient is the algebraic interface for normalized test-function transfer and its global trace applications. None of these consumers supplies an input to the stability or kernel-inclusion proof. SmoothRepresentationsOfLocalGroupsPartII consumes the semisimple parameter of §0.0 with its normalized Levi compatibility §0.0(b), and the atomic stability of §§4.1–4.3, for finite extensions of ℚ_p.

## References

- **H26.** David Hansen, *Excursion operators and the stable Bernstein center*, Forum of Mathematics, Pi 14 (2026), e10, pp. 1–14, DOI [10.1017/fmp.2026.10028](https://doi.org/10.1017/fmp.2026.10028). Definitions and Corollaries 1.2–1.3: pp. 1–2; harmonic analysis: §2.1, pp. 4–6; Hecke identities and averaging: §2.2, pp. 6–9; stability: §2.3, pp. 9–11; inner transfer: §2.4, pp. 11–13. The reverse extension in the p. 13 composite is i₁!, as its source and p. 9 definition require (H26 line 411 and line 622). The averaging highest weight uses the positive roots of Ĝ (H26 line 365; FU25 line 717).
- **FU25.** Chenji Fu, *Stability of elliptic Fargues–Scholze L-packets*, [arXiv:2501.00652v1](https://arxiv.org/abs/2501.00652v1), dated 31 December 2024. Lemmas 3.1.2–3.1.3: pp. 18–19; Lemmas 3.2.1–3.2.3: p. 20; Proposition 3.3.1: p. 21; Lemma 4.2.7: pp. 24–25; Theorem 4.3.1 and proof: pp. 26–27. The line locators above refer to this version.
- **HKW22.** David Hansen, Tasho Kaletha and Jared Weinstein, *On the Kottwitz conjecture for local shtuka spaces*, Forum of Mathematics, Pi 10 (2022), e13, pp. 1–79, DOI [10.1017/fmp.2022.7](https://doi.org/10.1017/fmp.2022.7). Lemma 3.1.1: p. 13; Definition 3.2.2 and Remark 3.2.5: pp. 14–15; (3.3.3): p. 18; Proposition 6.4.5 and Definition 6.4.6: pp. 61–62; Theorem 6.5.2: pp. 65–66; Lemma A.2.1: p. 72; Theorem C.1.1: p. 75. In (3.3.3), ρ is the half-sum, so 2ρ is the full positive-root sum once (HKW22 line 850 and line 3492).
- **FS24.** Laurent Fargues and Peter Scholze, *Geometrization of the local Langlands correspondence*, [arXiv:2102.13459v4](https://arxiv.org/abs/2102.13459v4) (2024), §I.9, pp. 34–35. Conjecture I.9.5 and the distinct following stable-centre expectation are separated at FS24 line 1294 and line 1298.
- **KAL18.** Tasho Kaletha, *Rigid inner forms vs isocrystals*, [arXiv:1502.00650v2](https://arxiv.org/abs/1502.00650v2) (2015), published in J. Eur. Math. Soc. 20 (2018); §5.1, pp. 16–19: Definition 5.1 (pseudo-z-embeddings and z-embeddings), Proposition 5.2, Corollary 5.3 (existence) and Fact 5.5 (central surjectivity on rational points). The line locators refer to the arXiv version.
- **FKS21v2.** Jessica Fintzen, Tasho Kaletha and Loren Spice, *A twisted Yu construction, Harish-Chandra characters, and endoscopy*, [arXiv:2106.09120v2](https://arxiv.org/abs/2106.09120v2) (3 September 2021), §4.3, p. 20, and Theorem 4.4.4, p. 26; published as Duke Mathematical Journal 172 (2023), pp. 2241–2301, DOI [10.1215/00127094-2022-0080](https://doi.org/10.1215/00127094-2022-0080). The hypothesis and theorem locators used here belong to the stated preprint version. Theorem 4.4.4 states stability across inner forms, and endoscopic identities only for the specified part of S_φ⁺, under §4.3’s convergence assumptions; it states no support minimality against arbitrary complex coefficients (FKS21v2 line 993, line 1281 and line 1299).
