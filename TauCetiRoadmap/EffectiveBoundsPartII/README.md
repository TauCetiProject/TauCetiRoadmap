# Roadmap: effective arithmetic bounds and geometry of numbers, part ii

**Summary.** This Part II continues Completed/EffectiveBounds, whose Layer 2 gives a primitive-polynomial count in a fixed ambient field. It constructs compact multi-equation models: every number field is an open and closed field component of a rational Jacobian-open complete intersection with explicit degree and coefficient bounds. Short algebraic integers, arithmetic first-jet interpolation and the integral lattice of polynomial relations give Couveignes’s explicit model theorem. A degree-dependent choice of parameters gives logarithmic models and one absolute constant Q≥3 such that, for every integer n>Q and integer H≥1, the unweighted number Nₙ(H) of ℚ-isomorphism classes of exact degree n and absolute discriminant at most H satisfies

    N_n(H) <= n^(Q*n*(log n)^3) * H^(Q*(log n)^3).

All logarithms are natural. The same Q controls both exponents and the degree threshold; no numerical value is specified (COU20 line 20, Theorem 1, p.487; line 35, Theorem 2, p.488; line 381, §4, pp.495–496).

## Scope and ownership

This roadmap owns the arithmetic specialization of the compact-model argument: the house body on a number field’s mixed space and its volume; short integral rational bases; the embedding parameter change; the kernel of bounded integral evaluation as an integer-matrix kernel; the discriminant-sensitive covolume estimate; the short-equation truncation and common arithmetic Jacobian minor; the compatible map from the supplied Jacobian-open algebra to the given field; central-binomial parameter selection; bounded ordered integer systems; the isolated affine point bound `isolatedAffinePoints_ncard_le_pow` and the Jacobian-open point bound `jacobianOpen_points_finite_ncard_le` of §5.5, derived from projective Bézout; and their field-class counting consequence.

Completed/EffectiveBounds Layers 1–2 and the pinned effective-bounds modules supply the discriminant and primitive-polynomial Hermite theory. Their fixed-ambient count, primitive-generator bounds, class-number and unit-square bounds are not targets here. The new count has a degree-sensitive cubic-logarithmic exponent and counts unweighted isomorphism classes. Regulator estimates, monogenicity, integral-basis reduction and enumeration procedures lie outside this Part II.

Generic bounded polynomial carriers, support bases, evaluation, partial differentiation, torsion-free kernel saturation, central binomial coefficients and Catalan numbers are already in the library. GenericDoublePointInterpolation §§0.1, 0.3, 1.3–1.4 and 5.1–5.3 own their coefficient adapters, first jets, generic rank and universal minors; this roadmap specializes them to the conjugates of one arithmetic tuple. SuccessiveMinima §0.1 and Layer 1 own hermitian Gram–Hadamard and the successive minima with one attaining independent family, and record the upper half of Minkowski’s second theorem as a Tau Ceti theorem. GeometryOfNumbersAndQuadraticArithmetic §1.1 owns ordered-product estimates and intrinsic ball volumes. Étaleness of a Jacobian-open localization over any commutative ring is already in Mathlib through submersive presentations. SchemeAndStackFoundations §5.12 owns the projective Bézout inequality. ArithmeticStatisticsPartI, Layer 0, “Number fields ordered by discriminant”, owns the isomorphism-family quotient, degree and height. These objects are imported by those sections, not reconstructed.

DiophantineApproximationAndTranscendence §2.8, “Saturated kernel-lattice covolume”, owns the covolume formula for W∩𝓞_K^V, which for K=ℚ identifies the covolume of ℤ^ι∩W with `subspaceHeight W`. HeightsAndUnits Layer 2.2, “Integral kernel bases and the minor gcd”, owns `minorGcd` and the identity minorGcd(A)·subspaceHeight(ker A)=√det(AAᵀ) for an integer matrix with ℚ-independent rows. Section 2.2 applies both to the coordinate matrix of bounded evaluation; the arithmetic content here is the comparison of that matrix with the conjugate value matrix and the field discriminant in §2.3.

## Conventions

Let K be a number field in a universe u, n=[K:ℚ]≥1, and 𝓞_K its native ring of integers. Indices of finite families are small; K and fields used for algebraic tests may lie in any universe. The signed integer field discriminant is `NumberField.discr K`. Put δ=`NumberField.rootDiscr K`=|disc K|^(1/n)≥1. Nonzero integral discriminant gives |disc K|≥1; all denominators involving n or disc K are therefore nonzero. An independent family of n integral elements is a rational basis and its ℤ-span can have finite index greater than one; an actual integral basis is named β separately (COU20 line 127, §2, p.490).

The mixed space is ℝ^r₁×ℂ^r₂ with n=r₁+2r₂, carrying Mathlib’s standard product volume; no second measure is used on it. The house is the maximum of all complex embedding moduli, using `NumberField.house`. The house body is the product of closed real intervals and closed complex disks, of volume 2^r₁π^r₂, and is not a Euclidean ball. For ℚ(i), the covolume of the integer lattice is 2^(−1)√4=1 (COU20 line 104, §2, pp.489–490, works with the canonical measure, 2^r₂ times this volume; in the standard volume the Minkowski product bound of §0.3 acquires the factor (2/π)^r₂≤1).

Write V_S(r,d) for `MvPolynomial.restrictTotalDegree (Fin r) S d`. Its monomial index consists of exponent vectors α:Fin r→₀ℕ with sum α≤d, and M=choose(d+r,d). The coefficient metric makes these M monomials orthonormal; a polynomial has squared coefficient norm Σα |aα|². Every lower-rank lattice has its intrinsic volume in its real span, with zero-dimensional covolume 1. Thus X²−2 has coefficient norm √5 and value zero at √2; neither its value nor its maximum coefficient is this norm (COU20 line 255, §3, p.493).

First-jet rows index an embedding τ:K→ℂ and either its value or one of r ordinary partial derivatives. There are n(r+1) rows; derivatives include their exponent factors, with no factorial division. Embedding matrices have embedding rows and basis columns. In §2.3, V=AB and the positive Hermitian matrix is V conjugate(V)ᵗ; coefficient Gram matrices are BBᵗ. These row conventions determine both the determinant sign and the shape n×M of the coordinate matrix B. Mathlib conjugates the first input of its inner product, so VV* is the transpose of the native Gram matrix of the rows; their determinants and diagonal entries agree. For rows (1) and (i), VV* is [[1,−i],[i,1]], while the native Gram matrix is [[1,i],[−i,1]]; both have determinant 0 and diagonal (1,1) (COU20 lines 195, 278–284, §3, pp.491–493; the two-row comparison is a direct calculation).

For the explicit model range assume r≥1, d≥5 and M≥n(r+1), and put

    ell = M - n >= n*r > 0,        D = d*n*(r+1),
    C0 = n*D*delta^2 = n^2*d*(r+1)*delta^2,
    H0 = C0^d,                    G = M*H0^2,
    B(n,r,d,delta) = ell^(ell/(2*n))*sqrt(M)*[n^2*d*(r+1)]^d*delta^(2*d).

The subtraction defining ℓ and the divisions by n are used in this positive range. Real powers have real exponents; degree and coefficient powers have natural exponents. The two uses of the letter H are distinguished: H₀ bounds monomial values, while H≥1 is the integer discriminant cutoff in Nₙ(H). The polynomial zero has native total degree zero and all coefficients zero; all coefficient bounds quantify over every exponent, including outside the support. A generic coefficient box allows r=d=C=0 even though the model theorem has r≥1 and d≥5 (COU20 lines 259, 291, 303, 363, §3, pp.493–495).

Checks of defining expressions may use parameters outside the explicit model range; they test those expressions or conditional linear-algebra steps, without asserting the model theorem at those parameters.

Evaluation of integer polynomials at integral κ lands in 𝓞_K. Surjective algebra evaluation onto K uses rational polynomials. When rational bounded evaluation is onto, the degree-d integer image has finite index and that index can exceed one. Counting uses inclusive cutoffs, ordered equations, and unweighted ℚ-isomorphism classes. A nonnormal cubic field gives three embedded subfields of ℚ̄ and one class; an automorphism weight would count another object (COU20 line 35, Theorem 2, p.488).

## Exact supplier contracts

### From Mathlib

- `NumberField.discr`, `NumberField.discr_ne_zero`, `NumberField.discr_eq_discr_of_algEquiv` in `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` give the signed field discriminant, its nonvanishing and isomorphism invariance. `NumberField.rootDiscr` in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean` is |disc K|^(1/n), and `NumberField.finite_of_discr_bdd` there gives finite bounded-discriminant sets of finite-dimensional intermediate fields of a fixed characteristic-zero ambient field.
- `NumberField.mixedEmbedding.finrank` and `NumberField.mixedEmbedding.latticeBasis` in `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean` provide real dimension n and the lattice basis associated to an actual integral basis. `NumberField.mixedEmbedding.covolume_integerLattice` in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean` uses standard product volume and equals 2^(−r₂)√|disc K|.
- `NumberField.mixedEmbedding.convexBodyLT`, `NumberField.mixedEmbedding.convexBodyLTFactor` and `NumberField.mixedEmbedding.convexBodyLT_volume` in `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/ConvexBody.lean` give the open product of real intervals and complex disks of radius f(w) and its product volume `convexBodyLTFactor K · ∏ f(w)^mult(w)`, with `convexBodyLTFactor K`=2^r₁π^r₂. `NumberField.discr_eq_discr` in `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` computes the field discriminant from any ℤ-basis of 𝓞_K.
- `NumberField.house`, `NumberField.house_eq_sup'`, `NumberField.house_mul_le`, `NumberField.house_sum_le_sum_house`, `NumberField.house_intCast` and `NumberField.one_le_house_of_isIntegral` in `Mathlib/NumberTheory/NumberField/House.lean` supply the house, its embedding interpretation, product and sum bounds, integer normalization and the bound ≥1 for a nonzero algebraic integer. `NumberField.canonicalEmbedding.norm_le_iff` in `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean` relates the canonical supremum norm to all embedding moduli.
- `MvPolynomial.restrictTotalDegree`, `MvPolynomial.mem_restrictTotalDegree` and `MvPolynomial.basisRestrictSupport` in `Mathlib/RingTheory/MvPolynomial/Basic.lean` give the native degree-bounded submodule and support basis. Membership means total degree≤d; it does not mean a separate degree bound in each variable. `MvPolynomial.aeval` in `Mathlib/Algebra/MvPolynomial/Eval.lean` and `MvPolynomial.pderiv` in `Mathlib/Algebra/MvPolynomial/PDeriv.lean` are the actual evaluation and partial-derivative operations. These constructions use a commutative coefficient ring; field-rank arguments explicitly pass to ℚ or ℂ.
- `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` in `Mathlib/Combinatorics/Nullstellensatz.lean` applies over any integral domain and a finite variable type: each grid cardinality is strictly greater than the corresponding variable degree. In §1.2 it is applied over ℂ to a pulled-back polynomial with complex coefficients, using D+1 distinct integer images in each coordinate.
- `Algebra.discr_not_zero_of_basis` and `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two` in `Mathlib/RingTheory/Discriminant.lean` apply to finite separable field extensions and identify basis discriminant with the square of the embedding determinant. Number fields satisfy separability. The field discriminant requires an actual integral basis.
- `Ideal.Quotient.mk`, `Localization.Away` and their algebra structures give the quotient and localization carriers used by `JacobianOpenAlgebra`. `Algebra.Etale.iff_exists_algEquiv_prod` in `Mathlib/RingTheory/Etale/Field.lean` identifies an étale algebra over a field with a finite product of finite separable field extensions; the index set may be empty. It does not state that a Jacobian localization over an arbitrary ring is finite.
- `Algebra.PreSubmersivePresentation.naive` and `Algebra.PreSubmersivePresentation.jacobiMatrix_naive`, `Algebra.SubmersivePresentation.localizationAway`, `Algebra.PreSubmersivePresentation.comp` and `Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian` in `Mathlib/RingTheory/Extension/Presentation/Submersive.lean`, `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` in `Mathlib/RingTheory/Smooth/StandardSmooth.lean`, and the instance making a standard smooth algebra of relative dimension zero étale in `Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean`. For r polynomials in r variables over a commutative ring R, the naive presentation of R[X]/(E) has Jacobian matrix given by the partial derivatives, its composite with the presentation of the localization away from its Jacobian is submersive of relative dimension zero, and so that localization is étale over R. No finiteness over R follows.

- `AddSubmonoid.ker_saturated` in `Mathlib/GroupTheory/Subgroup/Saturated.lean` makes the additive kernel of a map into an additive torsion-free monoid saturated under multiplication by natural numbers; the integer version follows using additive inverses. Apply it to bounded evaluation into the torsion-free additive group of 𝓞_K.
- `Nat.centralBinom`, `Nat.succ_mul_centralBinom_succ` and `Nat.four_pow_le_two_mul_add_one_mul_centralBinom` in `Mathlib/Data/Nat/Choose/Central.lean` give choose(2r,r), its consecutive recurrence and 4^r≤(2r+1)choose(2r,r), including r=0. The native `catalan` and `succ_mul_catalan_eq_centralBinom` in `Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean` give Fᵣ=choose(2r,r)/(r+1) without a new sequence carrier. Section 5.1 selects the least admissible index of this sequence.

### From Tau Ceti

`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` and `NumberField.hermiteCountBound` in `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean` supply Completed/EffectiveBounds Layer 2’s effective fixed-ambient count and its primitive-polynomial bound. Only finiteness and the established arithmetic infrastructure are consumed; the new coefficient system produces a different estimate.

### From TauCetiRoadmap.SuccessiveMinima

Consume §0.1.2, `hermitian_gram_hadamard`: for any finite family v in a normed `RCLike` inner-product space, 0≤Re det Gram(v)≤∏‖vᵢ‖², with no independence assumption and the empty family allowed. Consume §1.5, `exists_successiveMin_witnesses`: for a discrete full lattice L in a finite-dimensional real normed space and a convex body K with 0 in its interior, one real basis of lattice vectors bᵢ has gauge K bᵢ equal to the i-th minimum λᵢ(L,K); it need not be an integral basis. Consume the upper half of Minkowski’s second theorem as SuccessiveMinima records it among its Tau Ceti inputs, `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`: (∏ᵢ λᵢ(L,K))·μ(K)≤2^d·covolume(L,μ) for a discrete full L, a centrally symmetric convex body K and an arbitrary additive Haar measure μ. That Tau Ceti module is newer than the pinned Tau Ceti, so `Suggested.lean` does not use it. In dimension one, L=2ℤ and K=[−3,3] give λ₁=2/3 and (2/3)·6=4=2·2, fixing the product direction and the measure convention.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §1.1.2, `ordered_product_root_bound`, for a nondecreasing finite sequence with every term≥1; the one-based tail length at i is n+1−i>0. Consume §§1.1.3–1.1.5, `orthonormal_cube_volume`, `inscribed_cube` and `intrinsic_ball_lower_bound`: the intrinsic ℓ-ball has volume at least (2/√ℓ)^ℓ=2^ℓℓ^(−ℓ/2) for ℓ≥1. The coordinate cube has half-side 1/√ℓ, and the orthonormal coordinate equivalence preserves volume. For ℓ=2 the lower volume is 2 and the ball volume is π; using ambient volume on a line in a plane would instead give zero.

### From TauCetiRoadmap.HeightsAndUnits and TauCetiRoadmap.DiophantineApproximationAndTranscendence

Consume HeightsAndUnits Layer 2.2, “Integral kernel bases and the minor gcd”: for an integer matrix A with rows indexed by Fin m, columns by a finite linearly ordered type ι and rows linearly independent over ℚ, `minorGcd A` is the gcd of its m×m minors, `one_le_minorGcd` gives 1≤minorGcd A, and `minorGcd_mul_subspaceHeight_ker` gives minorGcd(A)·subspaceHeight(ker A)=√det(AAᵀ). Consume DiophantineApproximationAndTranscendence §2.8, `kernelLattice_covolume`, at K=ℚ: the saturated lattice ℤ^ι∩W of a rational subspace W has covolume `subspaceHeight W` in its real span with the induced Euclidean volume, including W=0 with covolume 1. For the row [2,2] the kernel generator (1,−1) has covolume √2, while √det(AAᵀ)=√8 and minorGcd=2; dropping the minor gcd would give the wrong √8.

### From TauCetiRoadmap.GenericDoublePointInterpolation

Consume §0.1’s monomial count M=choose(d+r,d) and coefficient equivalence, and §0.3’s real coefficient metric on the native bounded module. Consume §1.3’s value map, first-jet map and derivative map on the value kernel, with the statement that first-jet surjectivity makes this joint derivative map onto. Section 1.4 identifies these maps with their actual polynomial matrices.

Consume §§5.1–5.3’s generic affine principal open and selected integer maximal minor for r,n≥1, d≥5 and M≥n(r+1). A selected nonzero minor has total degree at most D=dn(r+1), hence each variable degree at most D; its nonvanishing implies distinctness and surjective first jets. At one affine point in one variable, columns (1,X) give determinant 1; swapping those columns gives −1. The arithmetic parameter change has complex coefficients, so §1.2 applies Mathlib’s grid theorem over ℂ.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §5.12, `bezout_inequality`: for two equidimensional closed subschemes V,W of projective space over a field, the sum of the degrees of the reduced irreducible components of V∩W is at most deg(V)deg(W), without a proper-intersection hypothesis. Its multiplicity-weighted equality requires proper intersection. Section 5.5 derives the distinct isolated-affine-point bound by applying this inequality separately to each reduced irreducible component at every cut; the intermediate intersection need not be equidimensional. The degree and component carriers remain those of the supplier.

### From TauCetiRoadmap.ArithmeticStatisticsPartI

Consume Layer 0, “Number fields ordered by discriminant” (anchor `number-fields-ordered-by-discriminant`): `NumberFieldFamily.Embedded`, `NumberFieldFamily.isoSetoid`, `NumberFieldFamily.isoFamily` and `NumberFieldFamily.isoDegree`. The quotient is by ℚ-algebra isomorphism of finite-dimensional intermediate fields of ℚ̄. Absolute field discriminant and degree descend to the quotient, and every bounded-height sublevel is finite by Hermite’s theorem. Nₙ(H) is the ordinary finite cardinality of its exact-degree-n inclusive height sublevel. The neighboring “Embedded and isomorphism class counts of number fields” identifies an embedded multiplicity n/#Aut(K); that multiplicity is not inserted into Nₙ(H). For a nonnormal cubic field the values are three embedded copies and one class; for a Galois quadratic field they are one and one.

## How to read the build

Layer 0 applies second Minkowski to the house body, with Mathlib’s product volume and discriminant covolume, to obtain a short integral rational basis. Layer 1 moves through its invertible complex embedding matrix to choose bounded integral generators with all first jets onto. Layer 2 identifies the arithmetic relation lattice with an integer-matrix kernel, bounds its covolume through the minor-gcd identity and keeps the discriminant denominator. Layer 3 applies second Minkowski in the coefficient space, discards exactly n−1 relations and selects one integer Jacobian minor nonzero at every conjugate. Layer 4 combines the explicit coefficients with the actual field component map. Layer 5 chooses parameters depending only on the degree, counts ordered coefficient boxes, derives the isolated-point bound from component degrees and uses it to count field factors. Each *Needs* line names the statement and proof-route inputs separately enough to permit another proof. `Suggested.lean` tests eight headline theorems: short integral rational bases, bounded arithmetic first jets, explicit models, logarithmic models, the isolated affine and Jacobian-open point bounds, bounded-system field-class counts and discriminant counts. The two counting signatures use arbitrary finite families of pairwise nonisomorphic number fields; choosing one representative per class gives exactly the unweighted class-cardinality bounds. The supplier retains ownership of the quotient carrier.

## Layer 0: Short algebraic integers

### 0.1 The house body

Work in Mathlib’s mixed space ℝ^r₁ × ℂ^r₂ with its standard product volume, the measure in which `NumberField.mixedEmbedding.covolume_integerLattice` is stated. The house body is a product of closed real intervals and closed complex disks, not a Euclidean ball, and its gauge on embedded K is the house.

Let B be the set of points of the mixed space all of whose real and complex coordinates have modulus at most 1. Then B is compact, convex, centrally symmetric and has 0 in its interior; its volume is 2^r₁π^r₂; and for x∈K and t≥0 the mixed embedding of x lies in tB if and only if house(x)≤t (COU20 line 104, §2, p. 489, for the house body; the volume normalization is Mathlib’s).

A proof route is as follows. B is the closure of the open body `NumberField.mixedEmbedding.convexBodyLT K 1`, whose volume is `convexBodyLTFactor K`=2^r₁π^r₂ by `NumberField.mixedEmbedding.convexBodyLT_volume`. The difference lies in the finite union of the sets on which one coordinate has modulus exactly 1, each a product with a sphere and hence null. Conjugate complex embeddings have equal modulus, so the gauge of B at the embedding of x is the maximum of all embedding moduli, which is `NumberField.house x`.

The API has the following properties.

- B is compact, convex, centrally symmetric and a neighbourhood of 0.
- The volume of B equals the volume 2^r₁π^r₂ of the open body `convexBodyLT K 1`.
- For x∈K and t≥0, the mixed embedding of x lies in tB if and only if house(x)≤t.
- Since n=r₁+2r₂, 2^n·2^(−r₂)/(2^r₁π^r₂)=(2/π)^r₂≤1.

**Checks.**

- For ℚ, B=[−1,1] has volume 2. Taking the radius instead of the length of the interval would give 1.
- For ℚ(i), B is the closed unit disk, of volume π. A measure that doubles each complex coordinate would give 2π and change the constant (2/π)^r₂ to 1.
- For a totally real field of degree n, B is the cube [−1,1]^n of volume 2^n, and (2/π)^0=1.
- In ℚ(√2) the mixed embedding of 1 is (1,1): its gauge is house(1)=1, while its Euclidean norm is √2. Equating gauge and Euclidean norm would give the wrong √2.

*Needs:* Mathlib `NumberField.mixedEmbedding.convexBodyLT`, `NumberField.mixedEmbedding.convexBodyLT_volume`; Mathlib `NumberField.house`; Mathlib `NumberField.canonicalEmbedding.norm_le_iff`.

### 0.2 Discriminant covolume

Use an actual integral basis β, rather than the short rational basis constructed in §0.5.

The image of 𝓞_K in the mixed space has covolume 2^(−r₂)√(|disc K|)=2^(−r₂)δ^(n/2) for the standard product volume. If β is an actual integral basis and A has rows indexed by complex embeddings and columns β, then |det A|²=|disc K|. (COU20 line 127, §2, p. 490, before the first successive-minima application).

A proof route is as follows. The covolume is Mathlib’s `NumberField.mixedEmbedding.covolume_integerLattice`; nonzero integer discriminant gives |disc K|≥1, and positive-real-power laws give √(|disc K|)=δ^(n/2). For A, `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two` gives disc(β)=det(A)², `NumberField.discr_eq_discr` identifies disc(β) with `NumberField.discr K`, and taking absolute values gives |det A|².

**Checks.**

- For ℚ, the basis (1) gives covolume 1 and |det A|²=1=|disc ℚ|.
- For ℚ(i), r₂=1 and |disc K|=4, so the covolume is 2^(−1)·2=1. With β=(1,i), A=[[1,i],[1,−i]] has det A=−2i, so |det A|²=4=|disc K| while det(A)²=−4=disc K. Omitting the absolute value would give the wrong sign.
- In ℚ(√5), (1,√5) has discriminant 20 while the actual integral basis (1,(1+√5)/2) has discriminant 5. Substituting the short rational basis into the field-discriminant equality would be false.

*Needs:* Mathlib `NumberField.mixedEmbedding.covolume_integerLattice`; Mathlib `NumberField.mixedEmbedding.latticeBasis`; Mathlib `NumberField.discr_ne_zero`; Mathlib `NumberField.discr_eq_discr`; Mathlib `NumberField.rootDiscr`; Mathlib `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`.

### 0.3 More than half a degree of short integers

Choose a simultaneous family attaining the successive minima and order it by house. This is an existential family of independent integral elements; the conclusion does not identify its integral span with 𝓞_K. Indices in the displayed tail estimate are one-based.

There exist ℚ-linearly independent ω_1,…,ω_n∈𝓞_K with nondecreasing houses and product of houses at most δ^(n/2). For m=floor(n/2)+1, all ω_i with i≤m have house at most δ. The family need not be an integral basis. (COU20 line 140, §2, p. 490, first Minkowski application and the choice of m).

A proof route is as follows. Apply the imported second-Minkowski upper product inequality and attaining independent witnesses to the closed house body B of §0.1 and the lattice of §0.2 with the standard product volume: the product of the n houses is at most 2^n·2^(−r₂)δ^(n/2)/(2^r₁π^r₂)=(2/π)^r₂δ^(n/2)≤δ^(n/2). Sort the witnesses by gauge, using the built house lower bound 1 on every nonzero algebraic integer. Apply the imported ordered-product root bound: house(ω_i)≤δ^(n/(2(n+1−i))). For i≤m, n≤2(n+1−i) and δ≥1 give the result. Real independence of mixed images implies ℚ-independence; no assertion about the integral span follows.

The API has the following properties.

- The independent ordered family exists together with its product bound.
- The coerced family is ℚ-linearly independent; its first m elements span an m-dimensional space.
- For i≤m, every embedding modulus of ω_i is at most δ.
- The product of all n houses is at most δ^(n/2).
- The witness gauge is the existing house, not a Euclidean norm.

**Checks.**

- For ℚ, n=m=1 and ω_1=1 is a valid witness with δ=1. This rules out dropping the only vector.
- For n=4 one must keep m=3; the exponent bound on the third house is δ^(4/(2·2))=δ. Keeping only two vectors would lose 2m>n.
- For n=5, m=3, and the third-house estimate is δ^(5/6)≤δ. The fractional tail exponent is not 1 in this case.

*Needs:* §0.1; §0.2; Mathlib `NumberField.one_le_house_of_isIntegral`; TauCetiRoadmap.SuccessiveMinima, the upper second Minkowski inequality `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` with an explicit Haar measure; TauCetiRoadmap.SuccessiveMinima §1.5, `exists_successiveMin_witnesses`; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §1.1.2, the ordered-product root bound.

### 0.4 Products span the field

For any finite field extension K/k, this is a statement about the k-span of all products of elements of V. It uses the nondegenerate pairing (a,b)↦f(ab) attached to a nonzero functional f, not the trace pairing; hence inseparability is allowed.

K/k is a finite extension of fields. V≤K and 2 dimₖ V>[K:k].

For a finite field extension K/k of degree n and k-subspace V, if 2 dimₖ V>n then spanₖ{ab:a,b∈V}=K. Neither separability nor normality is required. (COU20 line 150, §2, p. 490, product-span argument before Proposition 1).

A proof route is as follows. If the product span is proper, choose a nonzero k-linear functional f vanishing on it. The map a↦(b↦f(ab)) from K to its dual is injective: for a≠0 choose c with f(c)≠0 and test b=a^(−1)c. The image of V is an m-dimensional subspace of the annihilator of V, of dimension n−m. This forces 2m≤n and contradicts the hypothesis.

**Checks.**

- For K=k and V=K, the inequality is 2>1 and products span the one-dimensional field.
- For V=ℚ in a quadratic field, 2 dim V=2=n but the product span has dimension 1. The strict inequality cannot be weakened.
- For the inseparable degree-two extension 𝔽₂(t)/𝔽₂(t²) and V=K, the products 1 and t span K; separability is unnecessary.
- In the four-dimensional algebra k⁴, the ideal V=k³×0 has dimension 3 and 2·3>4, but its products still lie in that proper ideal. The field hypothesis cannot be replaced by finite algebra.

*Needs:* Mathlib `Submodule.span`, `Module.finrank` and finite-dimensional dual-space linear algebra.

### 0.5 Independent delta-squared-short integers

The headline `exists_short_integral_basis` states this as a rational basis b whose values are integral over ℤ and have house at most δ². Selecting independent products does not assert that b is a ℤ-basis of 𝓞_K.

For every number field K there exist α_1,…,α_n∈𝓞_K whose images form a ℚ-basis of K and satisfy house(α_i)≤δ² for all i. In particular they are ℤ-linearly independent, with no claim that their ℤ-span is 𝓞_K. (COU20 line 161, Proposition 1 and proof, §2, p. 490).

A proof route is as follows. Take the m small integers and apply product-span to their ℚ-span. Select n independent products ω_i ω_j from the finite spanning set. They are integral. For every embedding the modulus of each product is at most δ²; apply the built house/embedding comparison.

**Checks.**

- For ℚ, the rational basis (1) is integral and has house 1=δ²; n=0 cannot occur for a number field.
- For ℚ(i), (1,i) has houses (1,1), δ=2 and δ²=4, so each inequality reads 1≤4.
- For ℚ(√5), (1,√5) has houses (1,√5)≤5=δ² but integral index 2; house control does not force a maximal-order basis.

*Needs:* §0.3; §0.4; Mathlib `NumberField.house_eq_sup'`.

### Examples

For ℚ(i), the integer lattice has covolume 1 and the house disk has area π, so the Minkowski product bound is 2²·1/π=4/π≤2=δ; the embedding determinant of (1,i) has squared modulus 4=|disc K|, while the short elements 1 and i have house 1≤δ²=4. The products of the one-dimensional rational subspace ℚ still span only ℚ, exhibiting the strict product-span boundary.

### Dependencies

Mathlib mixed embeddings, house and discriminant; SuccessiveMinima §1.5 and its upper second Minkowski inequality; GeometryOfNumbersAndQuadraticArithmetic §1.1.2. The product-span argument uses only fields and finite-dimensional duality and does not need the other targets of this layer.

## Layer 1: Bounded generators with independent first jets

### 1.1 Integral generators from a short rational basis

Define the integral parameter family by finite sums in 𝓞_K. Its complex configuration map has source the nr-dimensional complex parameter space and target the nr-dimensional space of embedding-indexed ordered affine configurations. Separability makes the rational-basis embedding matrix invertible; its inverse need not have integral entries.

r≥1; α is an integral rational basis, not necessarily an integral basis. D≥0 is an integer.

Given an integral ℚ-basis α_i, define κ_j(u)=Σ_i u_ij α_i for u∈ℤ^(n×r). Its conjugate configuration is P_τ(u)=(τ(κ_j(u)))_j. Extending u to ℂ makes u↦P(u) a ℂ-linear equivalence on ℂ^(n×r), with each column transformed by the invertible embedding matrix of α. For 0≤u_ij≤D and house(α_i)≤δ², house(κ_j)≤nD δ². (COU20 line 207, §3, pp. 491–492, before the bounded integer parameter choice).

A proof route is as follows. Define κ by the finite integer linear combinations in 𝓞_K; the embedding formula follows by additivity. The embedding matrix of a rational basis has nonzero determinant: use nonzero basis discriminant and its square embedding-determinant formula. Apply its inverse separately in each of the r columns. Bound each conjugate by the triangle inequality and n summands at most D δ².

The API has the following properties.

- For α and u return the tuple κ∈𝓞_K^r with the stated finite-sum formula.
- τ(κ_j)=Σ_i (u_ij:ℂ) τ(α_i).
- The complex-linear parameter-to-conjugate-configuration map is invertible for a rational basis α.
- Parameters in [0,D] give house(κ_j)≤nD δ².
- Reindexing α and the first index of u together leaves κ unchanged; an integral basis change acts by the inverse coefficient change.

**Checks.**

- For K=ℚ, α=(1), and u_11=3, κ_1=3. This fixes the direction of the parameter map.
- The zero parameter matrix gives the zero tuple, whose first jets need not have the required rank. For a quadratic field its repeated value rows have rank 1 rather than 2.
- The integral rational basis (1,√(5)) of ℚ(√(5)) is allowed even though its ℤ-span has index 2 in 𝓞_K. An integral-basis-only hypothesis would wrongly reject it.
- Repeated α entries are rejected by the rational-basis hypothesis; their configuration map is singular. For α=(1,1) the two columns coincide and the determinant is zero.

*Needs:* §0.5; Mathlib `Algebra.discr_not_zero_of_basis`; Mathlib `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`.

### 1.2 Bounded arithmetic first-jet parameters

The headline `exists_bounded_first_jet_generators` includes the short rational basis, its integral parameter matrix, the bounds 0≤uᵢⱼ≤D and the resulting κ. Surjectivity means every independently prescribed value and first partial at every embedding is attained by a complex polynomial of total degree at most d. It quantifies over this actual conjugate configuration, not over an arbitrary function.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1).

Under r≥1,d≥5,M≥n(r+1), there is u∈{0,…,D}^(n×r), D=dn(r+1), such that the degree-d first-jet map at the n conjugate points of κ(u) is surjective over ℂ. These points are distinct and house(κ_j)≤n²d(r+1)δ². (COU20 line 242, §3, pp. 491–492, maximal minor and integer parameter grid).

A proof route is as follows. Import a nonzero n(r+1)-column maximal minor on the generic affine configuration space and its total-degree bound D. Pull it back by the complex-linear parameter equivalence of §1.1. The pullback is nonzero; linear substitution preserves the total-degree bound D, hence bounds every variable degree by D. Apply the built grid-vanishing lemma over ℂ to the coordinate sets {0,…,D}, each of cardinality D+1. The resulting integer tuple has nonzero minor, so first jets are onto and repeated conjugate points are impossible. Insert D into the house bound.

**Checks.**

- For K=ℚ,r=1,d=5, M=6≥2 and D=10. At the parameter u=0, evaluation and derivative at zero have matrix [[1,0],[0,1]] in columns (1,X), of rank 2; the zero point is allowed when there is only one embedding.
- For a quadratic field, the zero parameter tuple repeats the two conjugate points and the two value rows coincide, so first-jet rank is deficient. Distinctness must follow from the chosen nonzero minor.
- A degree-D polynomial given by the product of T−j over 0≤j<D vanishes at D proposed grid values but is nonzero at T=D, with value D!. The grid needs D+1 choices (including D=0, where the empty product is 1).
- For seven distinct points (i,0), i=0,…,6, in the plane and d=5, the jet rank is 6+5=11 rather than 21; the numerical dimension inequality does not replace genericity.

*Needs:* §1.1; TauCetiRoadmap.GenericDoublePointInterpolation §5.3, generic affine Hermite interpolation; TauCetiRoadmap.GenericDoublePointInterpolation §5.3, a nonzero maximal minor; TauCetiRoadmap.GenericDoublePointInterpolation §5.2, degree of a selected first-jet minor; Mathlib `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`.

### 1.3 Descent of value evaluation

Let κ be an integral tuple whose actual conjugate first-jet map is onto. Projection to the value rows gives a rank-n matrix over ℂ. The invertible embedding matrix identifies it with extension of the rational bounded evaluation, so that map already has rational rank n. The full polynomial evaluation then has image K.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). The conjugate first-jet map of κ is onto.

For the chosen tuple κ, evaluation V_ℚ(r,d)→K is ℚ-linearly surjective, and evaluation ℚ[x_1,…,x_r]→K is a surjective ℚ-algebra map. Hence ℚ[κ_1,…,κ_r]=K. The integral bounded-degree evaluation into 𝓞_K is not asserted surjective. (COU20 line 249, §3, p. 492, closed immersion induced by the kappa tuple).

A proof route is as follows. Project the full first-jet map onto its n value rows; this is onto ℂ^n. In a rational basis of K the degree-bounded evaluation is a rational n×M matrix B_ℚ. After extension to ℂ, multiplication by the invertible embedding matrix identifies it with the value matrix, which has rank n. A rational matrix has the same rank after extension to ℂ, by nonvanishing of its minors. Thus the rational bounded evaluation is onto. The full algebra map contains this image and is also onto.

**Checks.**

- At κ=√2, degree-one values 1,√2 span the two-dimensional field, and the full rational algebra map is onto.
- At κ=√5 in ℚ(√5), degree-one rational rank is 2 but the integral image is ℤ[√5], of index 2. Rational surjectivity cannot imply integral surjectivity.
- For κ=0 in a quadratic field, every rational polynomial value is rational, so the image rank is 1<2. A tuple unrelated to the chosen first jets would make the conclusion false.

*Needs:* §1.2; TauCetiRoadmap.GenericDoublePointInterpolation §1.3, the value map; TauCetiRoadmap.GenericDoublePointInterpolation §1.3, first-jet kernel splitting; Mathlib `MvPolynomial.restrictTotalDegree`; Mathlib `MvPolynomial.aeval`.

### Examples

For ℚ(√5), (1,√5) is an admissible integral rational basis despite index 2. The nonzero embedding determinant is −2√5 up to the chosen embedding order, so the complex parameter map is invertible.

### Dependencies

Layer 0; GenericDoublePointInterpolation §§1.3–1.4, 5.1–5.3; Mathlib separable-basis discriminants and complex product-grid vanishing. The value-rank descent depends on actual first-jet surjectivity, not on the numerical size bound alone.

## Layer 2: Arithmetic relation lattices

### 2.1 The integral relation lattice

Define L as the kernel of the actual ℤ-linear map V_ℤ(r,d)→𝓞_K. Its elements carry their bounded-degree membership. The complex span is taken after embedding integer coefficient vectors into the supplied monomial coordinates. Full rational value rank, not integrality alone, is the rank hypothesis.

The kernel is defined for every r,d≥0 and integral tuple κ. For the rank and scalar-extension conclusions assume degree-d rational value evaluation onto K, which forces M≥n. Saturation itself needs only the torsion-free target.

Let V_ℤ(r,d)=MvPolynomial.restrictTotalDegree(Fin r,ℤ,d) and ev_ℤ:V_ℤ→𝓞_K be evaluation at the chosen integral tuple κ. Define L=ker(ev_ℤ) in the existing monomial coordinate lattice ℤ^M. Equip its real span with the coefficient Euclidean metric imported from GenericDoublePointInterpolation §0.3. Then L is saturated, rank_ℤ L=ℓ=M−n, and its complex span is precisely the kernel of value evaluation at all conjugates. (COU20 line 255, §3, p. 493, lattice L and coefficient inner product).

A proof route is as follows. Restrict native algebra evaluation to the existing bounded polynomial submodule; use the supplied coefficient-coordinate equivalence to regard its kernel as an integer submodule of ℤ^M. Apply Mathlib’s torsion-free kernel-saturation theorem to bounded evaluation. Its quotient identifies with the integral evaluation image in 𝓞_K. Use a genuine integral basis to express evaluation by an integer matrix B of rational rank n. Integer null vectors span the rational kernel by clearing denominators in a rational nullspace basis. Extension of this matrix kernel to ℝ or ℂ then gives rank M−n and the stated kernel comparison. Transport the Euclidean metric from the monomial coordinates; do not use a polynomial sup norm.

The API has the following properties.

- L is the kernel of bounded-degree integral evaluation.
- f∈L iff totalDegree(f)≤d and f(κ)=0, with bounded-degree membership carried by the domain.
- The rank is M−n when rational value evaluation is onto.
- If a∈ℤ is nonzero and af∈L, then f∈L, by the supplied torsion-free kernel theorem.
- In coefficient coordinates L⊗ℂ is the kernel of conjugate value evaluation.
- For d≤e, the native degree inclusion maps L_d into L_e compatibly with coefficients and evaluation.

**Checks.**

- For one variable, κ=0 and d=2, the kernel has integral basis X,X²; the constant coefficient must vanish. Its rank is 2 and the constant polynomial 1 is excluded.
- For d=0, constant evaluation ℤ→𝓞_K is injective, so the kernel is zero; the full-value-rank hypothesis then holds only for n=1. When n>1 the image dimension is 1<n; the natural subtraction 1−n=0 does not establish full value rank.
- For κ=√(2), r=1,d=3, the kernel is spanned over ℤ by X²−2 and X³−2X, with rank 2=(d+1)−n. The coefficient vectors (−2,0,1,0),(0,−2,0,1) have disjoint support and squared norm 5.
- The tuple 1/2∈ℚ does not define this map into 𝓞_ℚ=ℤ and is excluded. Its value at X is 1/2, which is not an integer.
- At κ=0 in a quadratic field and d=2, M=3 and the actual kernel has rank 2, whereas M−n=1. This excludes a rank formula without full rational value rank.

*Needs:* §1.3; Mathlib `MvPolynomial.restrictTotalDegree`; Mathlib `MvPolynomial.mem_restrictTotalDegree`; Mathlib `MvPolynomial.aeval`; Mathlib `AddSubmonoid.ker_saturated`; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, monomial coefficient equivalence; TauCetiRoadmap.GenericDoublePointInterpolation §0.3, the real coefficient metric; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, bounded monomial count.

### 2.2 Relation covolume through the minor gcd

Choose an actual integral basis β of 𝓞_K and index the M bounded monomials by Fin M in a fixed linear order. The coordinate matrix B is the integer n×M matrix whose α column holds the β-coordinates of κ^α. Its kernel in ℤ^M is L, and the coefficient metric of §2.1 is the standard Euclidean metric on ℤ^M.

For r,d≥0 and integral κ, assume degree-d rational value evaluation onto K, equivalently that the rows of B are linearly independent over ℚ. All covolumes are intrinsic, including the case M=n and the zero relation space.

With B as above, L=ℤ^M∩ker B and covol(L)=√det(BBᵗ)/minorGcd(B)≤√det(BBᵗ). The minor gcd equals the index [𝓞_K:im(ev_ℤ)], since the index of the column lattice of a full-rank integer matrix is the gcd of its maximal minors; only minorGcd(B)≥1 is used. Changing β multiplies B on the left by a unimodular matrix and leaves √det(BBᵗ)/minorGcd(B) unchanged. (COU20 line 269, §3, p. 493, where the covolume of L is compared with the transpose evaluation lattice; the minor-gcd form of that comparison is HeightsAndUnits Layer 2.2.)

A proof route is as follows. In β-coordinates the integral evaluation of a coefficient vector a is Ba, so L is the integer kernel of B. Rational surjectivity of bounded evaluation makes the rows of B independent over ℚ. The integer kernel of B is the saturated lattice ℤ^M∩ker B_ℚ, whose covolume is `subspaceHeight (ker B_ℚ)` by the K=ℚ case of DiophantineApproximationAndTranscendence §2.8. HeightsAndUnits Layer 2.2 rewrites this as √det(BBᵗ)/minorGcd(B) and gives minorGcd(B)≥1.

The API has the following properties.

- The α column of B is the β-coordinate vector of κ^α, and Ba is the β-coordinate vector of the evaluation of the coefficient vector a; hence ℤ^M∩ker B=L.
- The rows of B are linearly independent over ℚ exactly when degree-d rational value evaluation is onto K.
- Changing the integral basis β replaces B by UB with U∈GL_n(ℤ), leaving L, det(BBᵗ) and minorGcd(B) unchanged.
- covol(L)·minorGcd(B)=√det(BBᵗ), and covol(L)≤√det(BBᵗ).

**Checks.**

- For K=ℚ(√5), κ=√5, d=2 and β=(1,(1+√5)/2), the matrix is B=[[1,−1,5],[0,2,0]]. Its 2×2 minors are 2,0,−10 with gcd 2, which is the index of ℤ[√5] in 𝓞_K; det(BBᵗ)=104, and √104/2=√26 is the covolume of L=ℤ(−5,0,1). Taking the minor gcd equal to 1 would give 2√26.
- For κ=√2 in ℚ(√2), d=1 and β=(1,√2), B=I₂, the relation lattice is zero with covolume 1, and minorGcd=det(BBᵗ)=1. This is the index-one case.
- For κ=0 in ℚ and d=2, B=(1,0,0) has minor gcd 1 and det(BBᵗ)=1; L has basis X,X² and intrinsic covolume 1.
- For the 1×1 integer matrix (2), the kernel is zero with covolume 1, while √det(AAᵀ)=2 and minorGcd=2. This determines the inequality direction 1≤2.

*Needs:* §2.1; TauCetiRoadmap.HeightsAndUnits Layer 2.2, `minorGcd`, `one_le_minorGcd` and `minorGcd_mul_subspaceHeight_ker`; TauCetiRoadmap.DiophantineApproximationAndTranscendence §2.8, `kernelLattice_covolume`; Mathlib `NumberField.discr_eq_discr` for the existence of an integral basis of 𝓞_K.

### 2.3 The Gram–discriminant identity

In these formulas * means conjugate transpose. The row-Hermitian matrix VV* is the transpose of Mathlib’s Gram matrix of the rows, so it has the same determinant and diagonal bounds. The numerator is det(VV*), a positive real number viewed in ℂ; the denominator |disc K| is a positive integer viewed in ℝ or ℂ.

For r,d≥0, integral κ and an actual integral basis β, the matrices have shapes A:n×n, B:n×M, V:n×M. Assume B has row rank n, equivalently rational bounded evaluation is onto.

Let A_τ,i=τ(β_i), B the coordinate matrix of §2.2, and V_τ,α=τ(κ^α), so V=AB. Then det(BBᵗ)=det(V conjugate(V)^t)/|disc K|. Both determinants in the ratio are nonnegative reals; the denominator is nonzero. (COU20 line 278, §3, pp. 493–494, evaluation matrix and determinant computation).

A proof route is as follows. The basis-coordinate identity gives V=AB. Consequently V V*=A(BB^t)A*, where B is real. Take determinants and use det(A)conjugate(det(A))=|disc K| for the genuine integral basis.

**Checks.**

- For ℚ(i), β=(1,i) and monomials (1,X) at κ=i give B=I₂, det(BBᵗ)=1 and det(VV*)=4; the ratio is 4/4=1. In contrast det(VVᵗ)=−4, detecting missing conjugation.
- For ℚ(√5), κ=√5,d=2 and β=(1,(1+√5)/2), B has rows (1,−1,5),(0,2,0). Its Gram determinant is 104. The value Gram matrix is [[31,21],[21,31]], determinant 520, and 520/5=104.
- Replacing β by the rational basis (1,√5) makes the coordinate Gram determinant 26 and the basis discriminant 20, so 520/20=26. Using the field discriminant 5 with this basis would give the wrong 104.

*Needs:* §2.2; §0.2; Mathlib `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`; Mathlib `NumberField.discr_eq_discr`.

### 2.4 Height of monomial values

Every exponent has total size at most d. The constant monomial contributes 1, and C₀≥1 lets its value fit the same H₀ bound. The M terms in each diagonal Gram entry are squared complex moduli; its bound is G, not H₀.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). The chosen tuple has house(κ_j)≤C0.

Put C0=n²d(r+1)δ², H0=C0^d and G=M H0². Every entry of V has modulus at most H0. Thus every diagonal entry of the Hermitian Gram matrix V V* is at most G. These inequalities include the degree-zero monomial because C0≥1. (COU20 line 291, §3, pp. 493–494, entrywise and diagonal Gram estimates).

A proof route is as follows. For each bounded exponent α, the evaluated monomial has modulus at most C0^(sum α)≤C0^d. Each diagonal Gram entry is a sum of M squared moduli. Separate the constant monomial and note C0≥1; there are M, not (d+1)^r, monomials.

**Checks.**

- With r=2,d=2 there are six monomials, not nine. For C₀=1 every monomial bound is H₀=1 and the diagonal sum bound is G=6.
- At κ=0, the constant monomial has value 1 and the other positive-degree monomials vanish. An incorrect bound C₀=0 would give H₀=0 for d>0 and miss that 1.
- For n=2,r=1,d=5, D=20,C₀=40δ²,H₀=40⁵δ¹⁰ and G=6·40¹⁰δ²⁰. This fixes both discriminant exponents.

*Needs:* §1.2; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, bounded monomial count; Mathlib `NumberField.house_eq_sup'`.

### 2.5 Covolume of arithmetic relations

The first inequality retains the arithmetic discriminant improvement; the second alone is used in the explicit coefficient estimate. Positivity justifies the square roots and division. These are intrinsic coefficient-space covolumes, independently of the mixed-space volume of Layer 0.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1).

For G=M[n²d(r+1)]^(2d)δ^(4d), the intrinsic relation covolume satisfies covol(L)≤G^(n/2)/√(|disc K|)≤G^(n/2). The ambient standard monomial lattice is unimodular; all covolumes of L use its ℓ-dimensional real span. (COU20 line 309, §3, p. 494, covolume bound before second Minkowski).

A proof route is as follows. Bound covol(L) by √det(BBᵗ) using §2.2. Use the Gram–discriminant identity and the imported hermitian Gram–Hadamard inequality on the n rows of V, each of squared norm at most G, to bound det(VV*) by G^n. Take positive square roots, retaining √(|disc K|) in the denominator; use |disc K|≥1 only for the second inequality.

**Checks.**

- For ℚ(√5), κ=√5,d=2, the relation X²−5 has covolume √26, whereas √det(BBᵗ)=2√26. Thus √26≤2√26, the factor being the minor gcd 2.
- For that example det(VV*)=520 and disc K=5, so the transpose bound is √(520/5)=2√26. Omitting the discriminant denominator would give √520 instead.
- For κ=0 in ℚ and d=2, L has basis X,X² and intrinsic covolume 1. The value matrix is (1,0,0), with Gram determinant and discriminant both 1.

*Needs:* §2.2; §2.3; §2.4; TauCetiRoadmap.SuccessiveMinima §0.1.2, `hermitian_gram_hadamard`; Mathlib `NumberField.discr_ne_zero`.

### Examples

For κ=√5 and d=2, L=ℤ(X²−5), covol(L)=√26=√104/2 with minor gcd 2. The genuine integral basis gives det(BBᵗ)=104=520/5. For ℚ(i), det(VV*)=4 but det(VVᵗ)=−4, pinning conjugation again.

### Dependencies

Layer 1; GenericDoublePointInterpolation §§0.1, 0.3; HeightsAndUnits Layer 2.2; DiophantineApproximationAndTranscendence §2.8; SuccessiveMinima §0.1.2; Mathlib embedding determinants. No successive-minimum theorem is used inside this layer.

## Layer 3: Small equations and a common Jacobian minor

### 3.1 Independent short relation witnesses

The witnesses are integral coefficient vectors in L, considered in its ℓ-dimensional real span. Apply the intrinsic ball estimate with this span as its ambient Euclidean space. Neither an ambient measure in ℝ^M nor the house body is the body in this application.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1).

There exist ℓ linearly independent integral relations E_1,…,E_ℓ∈L, sorted by coefficient Euclidean norm, with each norm≥1 and product at most ℓ^(ℓ/2) covol(L)≤ℓ^(ℓ/2)G^(n/2). They form a real basis of span_ℝ L but need not be an integral basis of L. (COU20 line 323, §3, p. 494, second Minkowski application to equations).

A proof route is as follows. Use the intrinsic ℓ-dimensional coefficient Euclidean space and the closed unit ball. Its volume is at least 2^ℓ ℓ^(−ℓ/2), by the supplied inscribed-cube inequality. Apply second Minkowski and its attaining independent witnesses to L in that space, then sort them. Each nonzero integer coefficient vector has norm at least one. Substitute the relation-covolume upper bound.

The API has the following properties.

- There are ℓ independent integral equations with nondecreasing norms and the stated product bound.
- Every witness vanishes at κ and has total degree at most d.
- The coefficient vectors form a real basis of span_ℝ L, and a complex basis after extension.
- Every witness has coefficient Euclidean norm at least 1.
- Every absolute coefficient is at most the coefficient Euclidean norm, since monomials are orthonormal.

**Checks.**

- The coefficient Euclidean norm of X²−2 is √(5), not max coefficient 2 or house of its value 0. Its maximum coefficient is 2 and its evaluated value is 0.
- Every nonzero integer coefficient vector has norm≥1; replacing the lattice by rational coefficients would make this false. The rational constant 1/2 has norm 1/2, giving the excluded model.
- Independent full-rank vectors can have nontrivial integral index: (2,0),(0,1) span ℝ² but not ℤ²; no integral-basis conclusion is exported. Their determinant has absolute value 2, not 1.
- For an intrinsic line, the unit interval has volume 2 and the ball lower bound is 2¹·1^(−1/2)=2. In a surrounding plane that interval has area zero, which would invalidate the argument.
- For ℓ=2, the inscribed square has half-side 1/√2, area 2 and vertex norm 1; the disk has area π≥2. Using half-side 1 would put (1,1) outside the ball.

*Needs:* §2.5; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §§1.1.3–1.1.5, intrinsic ball volume; TauCetiRoadmap.SuccessiveMinima, the upper second Minkowski inequality `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` with an explicit Haar measure; TauCetiRoadmap.SuccessiveMinima §1.5, `exists_successiveMin_witnesses`; TauCetiRoadmap.GenericDoublePointInterpolation §0.3, the real coefficient metric.

### 3.2 Dropping exactly n minus one relations

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). E_1,…,E_ℓ are the sorted independent witnesses.

Keep k=ℓ+1−n of the sorted relations, discarding exactly n−1. The number k is positive, and every retained relation has Euclidean norm and hence each coefficient modulus at most ℓ^(ℓ/(2n)) √(G). Their complex span W has codimension n−1 in L_ℂ. (COU20 line 330, §3, p. 494, removing the last n−1 equations).

A proof route is as follows. For one-based i≤k, ℓ+1−i≥n. Apply the imported ordered-product root bound to the witness norms. The product bound gives norm(E_i)≤[ℓ^(ℓ/2)G^(n/2)]^(1/n)=ℓ^(ℓ/(2n))√(G), since both factors are at least one. Full independence gives dim W=k, so its codimension in the ℓ-dimensional relation space is n−1. The rank inequality ℓ≥nr gives k≥n(r−1)+1≥1.

**Checks.**

- For n=2,r=1,d=5, M=6,ℓ=4 and k=3, so the retained codimension is exactly 1=n−1 and the final retained tail has length 2=n.
- For n=1 one retains all ℓ relations, with codimension zero; discarding one more would change the required strict inequality.
- For ordered norms (1,2,4,8), n=2,ℓ=4,G=4, the product is 64=ℓ^(ℓ/2)G^(n/2), and the largest retained norm 4 is at most ℓ^(ℓ/(2n))√G=8.

*Needs:* §3.1; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §1.1.2, the ordered-product root bound.

### 3.3 All conjugate gradient blocks are onto

This is the arithmetic identification of the supplier’s derivative-on-value-kernel map. Its source is the whole L_ℂ and its target contains all nr derivative coordinates. The retained family is used only after this joint surjectivity has been established.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). The chosen conjugate first-jet map is surjective.

The derivative map L_ℂ→Π_τ ℂ^r, f↦((partial_j f)(P_τ))_(τ,j), is surjective. Here L_ℂ is the complex span of the integral relation lattice, equal to the full degree-d value kernel; no reduction to the retained subspace is made yet. (COU20 line 342, §3, p. 494, well-poisedness and the cotangent-space argument).

A proof route is as follows. Use the relation-lattice scalar-extension identification with the value kernel. Apply the imported first-jet kernel splitting theorem: surjectivity of values and first derivatives together gives derivative surjectivity on the value kernel. Record all n blocks at once, so their independent codimension contributions can be used after truncation.

**Checks.**

- At the one point 0 in one variable and d=1, the value kernel is span(X), and differentiation sends X to 1. Its derivative map has rank 1.
- At the same point with d=0, values are onto but the value kernel and derivative rank are both zero. Values alone do not imply first-jet surjectivity.
- At the two points 0 and 1 in one variable, the value-kernel polynomials X(X−1) and X²(X−1) have derivative columns (−1,1) and (0,1). Their determinant is −1, giving joint rank 2.

*Needs:* §2.1; §1.2; TauCetiRoadmap.GenericDoublePointInterpolation §1.3, first-jet kernel splitting; TauCetiRoadmap.GenericDoublePointInterpolation §1.3, derivatives on the value kernel.

### 3.4 A retained family spans one gradient block

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). W has codimension n−1 in L_ℂ. The full gradient map L_ℂ→Π_τ ℂ^r is onto.

For W spanned by the retained k relations, at least one embedding τ has surjective gradient map W→ℂ^r. Equivalently the k×r gradient matrix has rank r at that conjugate. The strict codimension n−1<n is essential. (COU20 line 343, §3, p. 494, existence of a full-rank embedding block).

A proof route is as follows. Let Y be the image of W in the product of gradient blocks. A surjection sends a subspace to a subspace of codimension at most its original codimension, so codim(Y)≤n−1. If all block projections of Y were proper, choose a nonzero functional on each ℂ^r vanishing on that projected image. The n functionals on disjoint blocks are independent and vanish on Y, forcing codim(Y)≥n, a contradiction.

**Checks.**

- For n=2,r=1, the diagonal subspace {(z,z)} of ℂ² has codimension 1 and both block ranks equal 1.
- For n=2,r=2, the hyperplane defined by the first coordinate being zero has block ranks 1 and 2 and codimension 1<2; at least one block is full, not necessarily all blocks.
- The zero subspace in ℂ² has codimension 2=n and both one-dimensional projections have rank zero. The strict codimension threshold is essential.

*Needs:* §3.2; §3.3.

### 3.5 One minor at every conjugate

Select r distinct rows of the retained integer family, not arbitrary complex linear combinations. The determinant is the image of one element J(κ)∈K. Injectivity of each embedding, rather than normality or an action of Aut(K), propagates its nonvanishing.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1).

Choose r retained equations whose r×r gradient minor is nonzero at the full-rank embedding. Their Jacobian determinant evaluated at κ is a nonzero element of K; hence that same chosen minor is nonzero under every embedding K→ℂ. The equations retain degree≤d and the truncation coefficient bound. (COU20 line 349, §3, pp. 494–495, the minor preceding Proposition 2).

A proof route is as follows. Full rank supplies r distinct retained rows and a nonzero determinant at one embedding. Form J(κ)=det((partial_j E_i)(κ)) in K. Evaluation and determinants commute with field embeddings. Nonzero image implies J(κ)≠0; every field embedding is injective, so all its conjugates are nonzero. This does not assume K/ℚ normal.

**Checks.**

- For E=X³−2 at θ=∛2, J(θ)=3θ² has field norm 108≠0, and all three conjugates have modulus 3·2^(2/3). This nonnormal cubic uses no field automorphism transitivity.
- For E=X²−2 at √2, the two derivative values are 2√2 and −2√2. Their signs differ, but the same polynomial minor is nonzero at both embeddings.
- For E=X² at zero the derivative is zero. Vanishing equations without a nonzero minor cannot define the component localization map.

*Needs:* §3.4; §3.2; Mathlib `MvPolynomial.pderiv`.

### Examples

For n=2,ℓ=4, retaining k=3 gives codimension 1. For X²−2 the same chosen derivative polynomial has values ±2√2 at the two conjugates; nonvanishing propagates even though the sign changes. The coefficient norm of X²−2 is √5.

### Dependencies

Layers 1–2; GenericDoublePointInterpolation §1.3; GeometryOfNumbersAndQuadraticArithmetic §§1.1.2–1.1.5; SuccessiveMinima §1.5 and its upper second Minkowski inequality; native polynomial derivatives. The block-codimension argument is elementary linear algebra once joint gradient surjectivity is given.

## Layer 4: Explicit field components

### 4.1 The arithmetic component map

For the ordered integer system E, define `jacobianPolynomial` as the determinant of its rational polynomial derivative matrix, with equation rows and variable columns. Define `JacobianOpenAlgebra` as the native quotient of ℚ[X] by the mapped Eᵢ, localized at that determinant. This is the arithmetic specialization of the supplier presentation. For any commutative ring R and κ∈R^r, form the integer derivative determinant before evaluation in R. This defines the evaluated Jacobian compatibly with every ring homomorphism; it agrees with evaluation of `jacobianPolynomial` whenever R is a ℚ-algebra.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1). E is the r-tuple selected in §3.5.

For the selected integer equations E and J=det(partial_j E_i), form A_E=(ℚ[x_1,…,x_r]/(E_1,…,E_r)) localized away from the class of J. A_E is étale over ℚ by Mathlib’s submersive presentations, and hence a finite product of finite separable field extensions. Since E_i(κ)=0 and J(κ)≠0, polynomial evaluation extends uniquely to a surjective ℚ-algebra map φ:A_E→K. It exhibits Spec K as one open and closed irreducible component of Spec A_E. A_E itself may have other field factors. (COU20 line 354, Proposition 2, p. 495, and §3 pp. 492, 494).

A proof route is as follows. Factor native ℚ-polynomial evaluation through the ideal generated by the E_i using their vanishing. Send the inverted Jacobian to J(κ)^(−1); localization’s universal property gives the actual map, compatible with evaluation. Its image contains the surjective polynomial evaluation image. For étaleness, the naive presentation of the quotient has Jacobian the class of `jacobianPolynomial E`; composing it with the presentation of the localization away from that class gives a submersive presentation of relative dimension zero, so A_E is standard smooth of relative dimension zero and hence étale over ℚ. Apply the pinned field-base finite-product classification, then identify the compatible surjection to K with a factor projection.

The API has the following properties.

- For an ordered r-tuple E of integer polynomials and a tuple κ in a commutative ring R, evaluate the determinant of the r by r matrix of native partial derivatives. This equals evaluation of the polynomial Jacobian determinant.
- For a ring homomorphism f:R→S, applying f to the evaluated Jacobian at κ gives the evaluated Jacobian at f∘κ; hence injective field embeddings preserve nonvanishing.
- The specific evaluation map extends to A_E by inverting J(κ). In a commutative target ring its image must be a unit; for the target field K this is equivalent to J(κ)≠0.
- On the image of f∈ℚ[x], φ equals f(κ).
- The image of the inverse Jacobian is J(κ)^(−1).
- It is the unique algebra map agreeing with polynomial evaluation.
- φ is onto K because bounded-degree rational values already span K.
- The supplier’s finite-product equivalence can be chosen with φ the projection to its K factor.
- The rational polynomial determinant specializes to the evaluated integer derivative determinant in every characteristic-zero field; evaluation commutes with determinants.
- For every ordered integer system E, of any degree and in any number r≥0 of variables, `JacobianOpenAlgebra E` is étale over ℚ; no selection of the equations is needed.
- The quotient sends every Eᵢ to zero, and the localization makes the class of its Jacobian a unit. Its universal maps have sources ℚ[X] and the quotient, and target the localized algebra.
- Permuting two equation rows negates the polynomial Jacobian; its principal open and localized algebra are unchanged by that unit factor. Inverting an arbitrary value, instead of this determinant, would not impose the Jacobian-open condition.

**Checks.**

- For E=X²−2 over ℚ and κ=√(2), J=2X is invertible and A_E≃ℚ(√(2)). The inverse derivative maps to √2/4.
- For E=(X²−2)(X²−3), the Jacobian-open algebra is ℚ(√(2))×ℚ(√(3)); either projection is a component map, not an isomorphism from all A_E. There are four geometric roots but two field components.
- For E=X² at κ=0, J(κ)=0 and the Jacobian-open algebra is zero; no map of this construction onto ℚ exists. Inverting the nilpotent 2X annihilates the quotient.
- For r=1, E=X²−2 and κ=3 in ℚ, the evaluated Jacobian is 6, the evaluated derivative. Substituting E(3)=7 for its derivative would give the wrong 7.
- For r=1, E=X² and κ=0 in ℚ, the evaluated Jacobian is zero; this point cannot define the localization evaluation. No inverse of that Jacobian can map to a field unit.
- For E=(X,Y), the two-variable Jacobian matrix is I₂ and its determinant is 1. Swapping the equations gives [[0,1],[1,0]], determinant −1; both localizations invert a unit and define the same quotient.
- For r=0, the determinant of the empty Jacobian is 1 in every commutative ring; the operation is defined outside the model theorem’s r≥1 range. The empty determinant is 1, including the zero ring where 1=0.
- Over a general base R=A[t], the one-variable system tX−1 has Jacobian t and Jacobian-open algebra A[t,t⁻¹], which is étale but not finite over R. Finiteness of A_E comes from the field base, not from étaleness alone.
- In ℚ[ε]/(ε²), E=X² at κ=ε has E(κ)=0 and J(κ)=2ε≠0, but 2ε is not a unit: its square is zero. Thus a general-ring extension requires a unit, and nonvanishing suffices only for the field target.
- Over 𝔽₂ the integer system X²−X has derivative 1 at both roots, whereas X² has derivative 0. Over 𝔽₃ the derivative of X³−X is 2 at every root. The evaluated integer Jacobian uses no division by 2 or 3; the rational model theorem still assumes a number field.

*Needs:* §3.5; §1.3; Mathlib `Algebra.PreSubmersivePresentation.naive`, `Algebra.SubmersivePresentation.localizationAway`, `Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian` and `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`; Mathlib `Algebra.Etale.iff_exists_algEquiv_prod`; Mathlib `MvPolynomial.pderiv`.

### 4.2 Explicit small field models

Define `HasBoundedModel K r d H` by existence of an integral tuple κ and ordered integer system E with degrees≤d, all coefficient moduli≤H, Eᵢ(κ)=0, rational polynomial evaluation onto K, J(κ)≠0, and an actual compatible surjection from the étale algebra `JacobianOpenAlgebra E` to K. Compatibility means that the map sends the class of every rational polynomial f to f(κ). Thus it determines the localization map, not merely an abstract isomorphism class. Define `explicitCoefficientBound n r d δ` by B in the conventions. The headline `exists_explicit_small_model` asserts this full predicate at that bound; the finite-product classification identifies its surjection with a field-factor projection.

Assume the explicit model range r≥1, d≥5 and M≥n(r+1).

For every number field K and integers r≥1,d≥5 with M=choose(d+r,d)≥n(r+1), there are integral κ_1,…,κ_r and integer polynomials E_1,…,E_r of total degree≤d, all coefficients of modulus at most B(n,r,d,δ)=ℓ^(ℓ/(2n))√(M)[n²d(r+1)]^d δ^(2d), where ℓ=M−n. The equations vanish at κ, the tuple κ generates K as a ℚ-algebra by evaluation, and J(κ)≠0. Thus Spec K is an open and closed irreducible component of the finite-etale Jacobian-open model A_E. (COU20 line 354, Proposition 2, §3, p. 495).

A proof route is as follows. Use bounded arithmetic first jets and the descended value evaluation to construct the relation lattice. Apply the covolume estimate, short independent witnesses, truncation and the full-block argument. Retain the same selected r equations and substitute G into the coefficient bound. Apply the arithmetic component map.

The API has the following properties.

- The model predicate records the same κ and E in all vanishing, generation, coefficient and localization conditions; changing only the named field factor is not an admissible replacement.
- For fixed K and r, increasing d and the nonnegative height bound preserves the predicate. An algebra equivalence K≃ₐ[ℚ]K′ transports its point and compatible map, preserving integrality and all polynomial bounds.
- The explicit coefficient bound is positive for n≥1, r≥1, d≥5, M≥n(r+1) and δ≥1; expanding √G gives exactly B=ℓ^(ℓ/(2n))√M[n²d(r+1)]^dδ^(2d).
- The surjective map is the unique one agreeing with rational polynomial evaluation, because the quotient kills the relations and the inverse Jacobian is forced to map to J(κ)⁻¹.

**Checks.**

- For K=ℚ,r=1,d=5, M=6,ℓ=5,δ=1 and E=X at κ=0 give coefficient height 1≤5^(5/2)√6·10⁵. The Jacobian is 1 and the model algebra is ℚ.
- For K=ℚ(√2),r=1,d=5, use E=X²−2 at κ=√2: height 2, degree 2≤5, Jacobian 2√2≠0 and the localized algebra maps isomorphically to K.
- The system X(X−1),XY has a positive-dimensional line component X=0, but Jacobian value 1 at (1,0). Thus the Jacobian-open model is ℚ, while the full zero locus is not zero-dimensional.
- Replacing a coefficient bound H by a larger H′ preserves every bound; replacing the actual quotient map by a constant zero function fails φ(1)=1, so it is not an algebra map.
- For n=1,r=1,d=5, doubling δ multiplies the explicit bound by 2¹⁰=1024. This checks that the power of δ is 2d rather than d or 4d.
- The bound definition is total: at n=0,r=1,d=5,δ=1, real division by zero gives exponent 0 and B=0 because the remaining positive-degree factor is 0. This is not a number-field instance and supplies no model theorem.

*Needs:* §1.2; §3.2; §3.5; §4.1.

### Examples

The model of X²−2 is the single field ℚ(√2), while (X²−2)(X²−3) gives two distinct quadratic field factors. The model of X² is empty. At √2 the inverse Jacobian is √2/4 and (2√2)(√2/4)=1, fixing the map on the inverted element.

### Dependencies

Layer 1 value surjectivity; Layer 3’s bounded selected equations and common minor; Mathlib submersive presentations, quotient, localization and étale field-product classification. The component statement needs no Bézout bound.

## Layer 5: Logarithmic models and discriminant counts

### 5.1 The least central-binomial rank

Define `centralBinomialRank n` as the infimum in ℕ of the set of positive admissible r. Exponential central-binomial growth makes that set nonempty, so this is its least member. The definition is total and gives 1 also at n=0, while the size and eventual estimates below assume n≥1.

n≥1 is an integer. The estimate r≤3 log n is eventual, not asserted at n=1.

For each n≥1 define r(n) as the least positive integer r with n(r+1)≤choose(2r,r). Use Fᵣ equal to the real value of the native Catalan number, with the supplied identity Fᵣ=choose(2r,r)/(r+1). The supplied central-binomial recurrence gives Fᵣ₊₁/Fᵣ=2(2r+1)/(r+2)<4. Prove that r(n) exists and n(r+1)≤choose(2r,r)≤4n(r+1). Eventually r≥5 and r≤3 log n, for natural logarithm. (COU20 line 385, §4, p. 495, equation (1) and the parameter choice).

A proof route is as follows. The native lower bound 4^r≤(2r+1)choose(2r,r) shows that Fᵣ grows without bound. Thus least positive r exists. For r>1, minimality gives F_(r−1)<n and the exact consecutive ratio gives F_r<4n. At r=1 the bound holds directly. Since F_4=14 and F_r is increasing, n>14 forces r≥5. To get r≤3 log n eventually, use the supplied estimate choose(2r,r)≥4^r/(2r+1). For r=floor(3 log n) the ratio 4^r/((2r+1)(r+1)n) tends to infinity, so F_r≥n for large n.

The API has the following properties.

- The positive admissible set has a least member r for n≥1.
- r>0, n(r+1)≤choose(2r,r), and each positive s<r is inadmissible.
- The monomial count lies between n(r+1) and 4n(r+1).
- There exists an absolute n0 such that n≥n0 implies 5≤r≤3 log n.
- For 1≤n≤m, r(n)≤r(m).

**Checks.**

- r(1)=1 and r(2)=2, because choose(2,1)=2 and choose(4,2)=6. The corresponding Catalan values are 1 and 2.
- r(14)=4 and r(15)=5, since F_4=14 and F_5=42. The threshold is a constraint on the model theorem, not on the definition.
- r(1)=1>3 log 1=0, so an all-n logarithmic bound is rejected. Thus the eventual qualifier is essential.
- At n=0 the admissible set contains 1 and its least positive member is 1; the number-field estimates retain n≥1.

*Needs:* Mathlib `Nat.centralBinom`, `Nat.succ_mul_centralBinom_succ`, `Nat.four_pow_le_two_mul_add_one_mul_centralBinom`, `catalan` and `succ_mul_catalan_eq_centralBinom`; elementary real exponential-growth estimates.

### 5.2 Logarithmic small models

The headline `exists_logarithmic_small_models` fixes r=d=`centralBinomialRank n` for every field of degree n. Its single real constant Q≥3 is chosen before K, and the condition is n>Q. This uniform choice is what places all degree-n fields into one coefficient box in §5.6.

n is larger than the single absolute threshold Q.

There is one absolute real Q≥3 such that for every number field K of degree n>Q one can take r=d=r(n)≤Q log n and M=choose(2r,r)≤Q n log n in the explicit small-model theorem, with every coefficient at most (n δ)^(Q log n). The resulting Jacobian-open model contains Spec K as an irreducible component. (COU20 line 20, Theorem 1, p. 487; proved at lines 381–425, §4, pp. 495–496).

A proof route is as follows. Choose n above the central-binomial threshold and take d=r(n)≥5. We have ℓ≤M≤4n(r+1)=O(n log n). Taking logarithms, log(ℓ^(ℓ/(2n)))=(ℓ/(2n))log ℓ=O((log n)²). Also log(√(M))=O(log n). For the remaining factors, d log(n²d(r+1))=O((log n)²) and 2d log δ=O(log n log δ). Combine into Q log n (log n+log δ). Enlarge one absolute Q to dominate every threshold and constant, then exponentiate and apply the explicit model theorem.

**Checks.**

- The values r(14)=4 and r(15)=5 give M=70 and 252 respectively; the latter satisfies 15·6=90≤252≤360. Only the latter parameter choice meets d≥5.
- At n=1 the proposed bound r≤Q log n would read 1≤0, so the degree threshold is necessary.
- At δ=1, the coefficient-height logarithm is Q(log n)²; for δ>1 the added term is Q log n log δ. No division by log δ is used.

*Needs:* §4.2; §5.1.

### 5.3 Bounded integer equation systems

Define the coefficient box as a subset of native ordered polynomial tuples, not a new polynomial representation or a field-class carrier. Degree and coefficient bounds alone define this subset; no smoothness or nonzero-Jacobian restriction is imposed on it. The geometric restrictions enter only when components of these systems are counted.

r,d,C≥0 are integers. All equations have exactly the same variable index Fin r, and the tuple is ordered.

For naturals r,d,C, let Box(r,d,C) be the set of ordered r-tuples E of native integer polynomials in r variables such that totalDegree(E_i)≤d and |coeff_α(E_i)|≤C for every i and exponent α. In the supplied monomial coordinates this is exactly rM independent integer slots in [−C,C], M=choose(d+r,d). This coefficient-box carrier is separate from any field-isomorphism carrier. (COU20 line 425, §4, p. 496, the number of coefficients to be specified).

A proof route is as follows. Take the subset of (ℤ[x_1,…,x_r])^r specified by the degree and coefficient inequalities. Apply the imported coefficient-coordinate equivalence to the bounded-degree submodule. Coefficients outside the bounded exponent set vanish. This identifies the set with the product over Fin r×A(r,d) of the finite integer interval [−C,C].

The API has the following properties.

- The coefficient box is the subset of ordered r-tuples cut out by total degree≤d and absolute coefficient≤C.
- Membership is exactly the degree and coefficient conjunction, including the zero polynomial.
- Coefficient coordinates identify Box with rM copies of the integer interval [−C,C].
- Box is finite for all natural r,d,C.
- For fixed r, increasing d and C gives inclusion of the corresponding boxes.
- The projection onto each equation lands in the built MvPolynomial.restrictTotalDegree submodule; no new polynomial type is defined.

**Checks.**

- For r=0 the unique tuple is the empty tuple and the box has cardinality 1 for every d,C. There are zero coefficient slots and the empty product is 1.
- For d=0 there are r constant equations and (2C+1)^r choices. The monomial count is 1 per equation.
- For C=0 the only tuple is the zero tuple, independently of d. All coefficient slots are forced to zero.
- For r=2,d=2 there are six monomials per equation and twelve slots overall; using separate variable degree bounds would incorrectly give eighteen slots. The spurious nine monomials per equation would include X²Y², of total degree 4.

*Needs:* Mathlib `MvPolynomial.restrictTotalDegree`; Mathlib `MvPolynomial.mem_restrictTotalDegree`; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, monomial coefficient equivalence; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, bounded monomial count.

### 5.4 The coefficient-box cardinality

All rM coefficient slots are independent. For a nonnegative real height B, use its natural floor C=⌊B⌋. For integer a the equivalence |a|≤B iff |a|≤C holds in both directions, so the passage to the finite box is exact.

r,d,C≥0 are integers. For the floor version B is a nonnegative real number.

The finite set Box(r,d,C) has cardinality exactly (2C+1)^(r choose(d+r,d)), for all natural r,d,C. If a real coefficient bound B≥0 is used, put C=floor(B); all integer coefficients with modulus≤B lie in this box. (COU20 line 425, §4, p. 496, counting r choose(2r,r) coefficients).

A proof route is as follows. Use the coefficient-coordinate product equivalence and the exact count 2C+1 for the integer interval [−C,C]. The number of coordinates is rM by the imported monomial count. For the real bound, integer absolute values satisfy |a|≤B iff |a|≤floor(B), so rounding does not introduce infinitely many choices.

**Checks.**

- For r=1,d=2,C=1 the three coefficients each have choices −1,0,1, giving 3³=27 polynomials.
- For B=3.7 the integer coefficient interval is [−3,3] with seven choices, exactly the natural-floor box; a ceiling would give nine.
- For r=0 the exponent is zero and the count is 1, including C=0; for r=2,d=0,C=1 it is 3²=9.

*Needs:* §5.3; TauCetiRoadmap.GenericDoublePointInterpolation §0.1, bounded monomial count.

### 5.5 From finite models to field classes

The headline `bounded_systems_field_class_bound` states the bound on an arbitrary family Kᵢ, i∈Fin m, of pairwise nonisomorphic number fields. Each Kᵢ admits a surjective ℚ-algebra map from `JacobianOpenAlgebra E` for some E∈Box(r,d,C); the conclusion is m≤(2C+1)^(rM)d^r. This is equivalent to the bound for the ordinary finite isomorphism-class family of the supplier: every such family injects into the represented class set, and choosing one representative per represented class gives the converse. Finiteness follows from the finite coefficient box and finite field-factor sets. The finite product for each Jacobian-open algebra may be empty. Over ℚ̄ its geometric point count is the sum of the degrees of the field factors, so it bounds the number of factors as well. The map from a pair (ordered system, field factor) to a class may identify several different pairs; surjectivity onto the represented set is sufficient.

r,d,C≥0 are integers. The geometric bounds below hold over every algebraically closed field F, in every characteristic; the field-class application uses F=ℚ̄ and the unweighted class carrier of ArithmeticStatisticsPartI, Layer 0.

**Isolated affine point bound.** The headline `isolatedAffinePoints_ncard_le_pow` states: for any ordered system of r polynomials Eᵢ∈F[X₁,…,Xᵣ] of total degree at most d, the set of distinct isolated points of its affine zero locus is finite and has cardinality at most d^r, even if other components have positive dimension. A point x is isolated when its maximal ideal, the kernel of evaluation at x, is a minimal prime over the ideal (E₁,…,Eᵣ); by the Nullstellensatz this means that {x} is an irreducible component of the zero locus. This is a derived result here on the supplier's scheme and component carriers; it counts reduced points, without local intersection multiplicities. (COU20 line 425, §4, p.496, isolated points in the final counting argument; derived from SchemeAndStackFoundations §5.12.)

A proof route is as follows. Homogenize each nonconstant equation to its own positive degree eᵢ≤d in projective r-space. A zero equation leaves the intersection unchanged; a nonzero constant equation makes it empty. Starting with projective space, prove by induction that after j cuts the sum of degrees of all reduced irreducible components is at most d^j. At a nonconstant cut, retain each component contained in the hypersurface; its degree is at most d times its previous degree because d≥1. For every other component, apply the supplier's two-equidimensional-subscheme inequality to that reduced irreducible component and the degree-eᵢ hypersurface. The sum of degrees of the resulting components is at most eᵢ times the old component degree. Take their reduced union and discard duplicate components and components contained in others; degrees are positive, so this only decreases the sum. Each isolated affine point is a zero-dimensional component of this projective intersection in the affine chart. Over F it has degree one, which proves the bound.

**Jacobian-open geometric-point bound.** The headline `jacobianOpen_points_finite_ncard_le` states: for the same F,r,d,E, let J_E be the determinant of the ordinary partial-derivative matrix. The set of points x∈F^r with Eᵢ(x)=0 for all i and J_E(x)≠0 is finite and has at most d^r distinct points. By Mathlib’s submersive presentations over F, the localization of F[X]/(E) away from J_E is étale over F, so its local ring at such a point has dimension zero; the maximal ideal of the point is then minimal over (E), the point is isolated, and the preceding bound applies. For an integer system E, these are exactly the geometric points of `JacobianOpenAlgebra E` after extension from ℚ to ℚ̄. This derived result is the geometric input to the field-class count. (COU20 line 425, §4, p.496; derived from the isolated affine point bound above.)

For all r,d,C≥0, the number of ℚ-isomorphism classes of fields that occur as residue fields of components of Jacobian-open algebras A_E for E∈Box(r,d,C) is at most (2C+1)^(rM) d^r. The same bound holds after restriction to exact degree n and |disc|≤H. This uses a surjection from pairs (equation tuple, field factor) onto the represented classes, not an injection from fields to tuples. (COU20 line 425, §4, p.496, final isolated-point intersection argument; Theorem 2 p.488.)

A proof route is as follows. For every E∈Box(r,d,C), A_E is étale and finitely presented over ℚ by §4.1. Apply the imported field-base finite-etale classification. Its factors give a finite set of residue-field classes; repeated isomorphic factors contribute just one class but can be overcounted. After base change to ℚ̄, apply this section's Jacobian-open geometric-point bound to obtain at most d^r geometric points. Their number is the sum of the factor degrees. Each factor has positive degree, so the number of factors is also at most d^r. Form the finite disjoint union of these factor sets over the coefficient box and map each pair to its field-isomorphism class. Its image is precisely the represented set. Apply the coefficient-box count. Restricting degree or discriminant can only decrease the image size.

**Checks.**

- For E=(X²−2)(X²−3)=X⁴−5X²+6, there are four geometric points, two degree-two field factors and two isomorphism classes. Their discriminants 8 and 12 exclude a ℚ-algebra equivalence. For r=1,d=4,C=6, the family size satisfies 2≤13⁵·4=1485172. One model need not mean one field.
- For E=X(X−1), there are two geometric points and two field factors, both ℚ, giving only one class. A family with two copies of ℚ fails pairwise nonisomorphism; one copy satisfies it and gives 1≤3³·2=54 for r=1,d=2,C=1. Here J=2X−1 has values −1 and 1 at 0 and 1, so A_E≃ℚ×ℚ is étale even though d=2<5. The factor-to-class map need not be injective.
- For E=X², the Jacobian-open algebra is zero: zero geometric points, zero field factors and zero represented classes, consistent with the empty product.
- For X(X−1),XY, the first projective cut has two lines and component-degree sum 2. The second retains X=0 and cuts X=Z into [1:0:1] and [0:1:0]. The latter point already lies on X=0, so the reduced union has component-degree sum 2≤3≤2·2=4. Only (1,0) is an isolated affine point, with Jacobian determinant X(2X−1)=1 there. Thus the Jacobian-open point count is 1≤4; the line and the point at infinity do not enter that count.
- For X² over an algebraically closed field of characteristic zero, the affine zero locus has one reduced isolated point, of local length 2, while its Jacobian-open part has zero points. Distinct isolated points, local lengths and Jacobian-open points are different quantities; the bound is not a multiplicity equality.
- A zero equation has a zero Jacobian row, so its square system has no Jacobian-open points. For the system (0,Y) with d=1 the zero locus is a line: its projective component-degree sum is 1≤1² and its isolated-point count is 0. A nonzero constant equation, such as (1,Y), makes the intersection empty with degree sum and point count 0. Neither equation is treated as a positive-degree hypersurface.
- Over an algebraic closure of 𝔽₂, X²−X has derivative 1 and two Jacobian-open points, attaining d^r=2; X² has derivative 0 and no Jacobian-open points. Over an algebraic closure of 𝔽₃, X³−X has derivative 2 and three such points, attaining d^r=3. The geometric bounds need no characteristic-zero hypothesis.
- For r=0 the Jacobian-open algebra is ℚ, with empty Jacobian determinant 1, so every represented field is ℚ and m≤1=(2C+1)^0·d^0. For d=0 and r≥1 every equation is constant, the Jacobian is 0, the algebra is zero and m=0=d^r. The bound therefore holds for all r,d,C≥0. For the geometric bounds at r=0, affine space is one point, the empty system generates the zero ideal of F, and that point is both isolated and Jacobian-open, so both counts are 1=d^0. At d=0 and r≥1 the ideal is zero or the unit ideal, neither of which has a maximal ideal of a point as a minimal prime, and the Jacobian vanishes, so both counts are 0=0^r.
- The empty family has m=0 and satisfies 0≤(2C+1)^(rM)d^r. For C=0 and r≥1, all equations and their Jacobian vanish, so the localized algebra is zero and no nonempty family admits the required surjections onto fields.

*Needs:* §5.4; §4.1; Mathlib submersive presentations over F for the Jacobian-open point bound, as in §4.1; Mathlib `Ideal.minimalPrimes`; TauCetiRoadmap.SchemeAndStackFoundations §5.12, `bezout_inequality`, for the component-degree induction above; TauCetiRoadmap.ArithmeticStatisticsPartI, Layer 0, “Number fields ordered by discriminant”; Mathlib `Algebra.Etale.iff_exists_algEquiv_prod`; Mathlib `NumberField.discr_eq_discr_of_algEquiv`.

### 5.6 A cubic-logarithmic discriminant exponent

The headline `discriminant_field_class_bound` quantifies over every m∈ℕ and every family Kᵢ, i∈Fin m, of pairwise nonisomorphic number fields, each of degree n and |disc Kᵢ|≤H, and bounds m by the displayed expression. Every such family injects into the class sublevel; conversely, choose one representative per class of the finite sublevel to recover its cardinality bound. The quantifier order is ∃Q≥3, ∀n∈ℕ with n>Q, ∀H∈ℕ with H≥1, followed by the bound for every such family and hence for the actual exact-degree inclusive class sublevel. Finiteness is obtained before taking its ordinary cardinality. The real powers have positive bases n and H, and no reciprocal of log H occurs.

The class carrier has its isomorphism-invariant degree and absolute field discriminant; n>Q and H≥1 are integers.

There exists an absolute real Q≥3 such that, for all integers n>Q and H≥1, the number N_n(H) of ℚ-isomorphism classes of number fields of exact degree n and |disc K|≤H satisfies N_n(H)≤n^(Q n (log n)^3) H^(Q (log n)^3). All logarithms are natural; the same Q is uniform in n and H. (COU20 line 35, Theorem 2, p. 488, and §4 pp. 495–496).

A proof route is as follows. Finiteness is inherited from the completed Hermite–Minkowski infrastructure in a fixed ℚ̄ and the isomorphism-family quotient, rather than defining an unsupported finite count. For each class use the logarithmic model with the same r=d=r(n) and M depending only on n. From δ≤H^(1/n), take the common height B=(n H^(1/n))^(Q0 log n), C=floor(B). All these classes lie in the image counted in §5.5, so N_n(H)≤(2C+1)^(rM) r^r. Since B≥1, 2C+1≤3B. Use rM=O(n(log n)²). The logarithm of the bound is O(n(log n)^3 log n)+O((log n)^3 log H)+O(log n log log n). Absorb the last term and constants into Q n(log n)^3 log n and Q(log n)^3 log H. Choose one Q≥3 dominating Q0, every degree threshold and both constants, then exponentiate. H=1 is included by the same bound; the proof never divides by log H.

**Checks.**

- For H=1 and any n>1, Hermite–Minkowski discriminant bounds exclude all such fields, so Nₙ(1)=0≤n^(Qn(log n)³). Every family satisfying the hypotheses is empty. For any n>Q and H≥1, the empty family also gives 0≤n^(Qn(log n)³)H^(Q(log n)³). The proof must allow log H=0.
- For a nonnormal cubic field with trivial automorphism group, its isomorphism class contributes 1 and its embedded multiplicity is 3. The two counting conventions cannot be exchanged.
- For n=1,H=1 the actual class count is 1, but r(1)=1 and Q log 1=0; the eventual theorem does not justify its parameter estimate at degree one.
- At n=2,H=3, the only class is ℚ(√−3), of discriminant −3; ℚ(i) has discriminant −4 and is excluded. A pairwise nonisomorphic family from this sublevel has size at most 1, and one representative attains 1. This tests equivalence of the two counting formulations, outside the eventual range n>Q≥3.

*Needs:* §5.2; §5.5; §5.1; TauCetiRoadmap.ArithmeticStatisticsPartI, Layer 0, “Number fields ordered by discriminant”; Mathlib `NumberField.finite_of_discr_bdd`; Tau Ceti `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`.

### Examples

The least ranks r(1),r(2),r(14),r(15) are 1,2,4,5. A coefficient box with r=2,d=2,C=1 has 3¹²=531441 ordered systems. The model (X²−2)(X²−3) has two quadratic classes, whereas X(X−1) has two factors of one class.

### Dependencies

Layer 4; GenericDoublePointInterpolation §0.1; §4.1’s étaleness for every system of the box; SchemeAndStackFoundations §5.12 for §5.5’s derived distinct-point bounds; ArithmeticStatisticsPartI, Layer 0, “Number fields ordered by discriminant”; the completed Hermite infrastructure. Central-binomial parameter choice and coefficient boxes are independent of the field-component construction.

## Downstream consumers

The principal exports are the explicit bound of §4.2, the degree-uniform logarithmic models of §5.2 and the exact-degree class bound of §5.6. Arithmetic-statistics consumers may use their coefficient boxes and their bound on the number of field factors per system; they must retain the unweighted isomorphism-class convention. An application that counts embedded fields instead must supply its separate embedding multiplicity. Generic interpolation and lattice users consume the named supplier roadmaps directly. The distinct-point bounds `isolatedAffinePoints_ncard_le_pow` and `jacobianOpen_points_finite_ncard_le` of §5.5 hold over every algebraically closed field and are available to any consumer that counts isolated or nonsingular zeros without multiplicity, such as the finite-fibre target of ArithmeticStatisticsPartV §3.28; a multiplicity-weighted isolated-intersection bound is a separate, stronger statement.

## Worked examples

**An integral index survives rational surjectivity.** Let K=ℚ(√5), κ=√5, d=2 and β=(1,(1+√5)/2). The evaluated monomials 1,κ,κ² have β-coordinate columns (1,0),(−1,2),(5,0). They span ℤ[√5], of index 2 in 𝓞_K, although their rational span is K. The relation lattice has primitive generator (−5,0,1), hence intrinsic covolume √26. The coordinate matrix B=[[1,−1,5],[0,2,0]] has Gram matrix [[27,−2],[−2,4]], determinant 104, and maximal minors 2,0,−10 with gcd 2, so covol(L)=√104/2. The conjugate value rows have Gram matrix [[31,21],[21,31]], determinant 520=5·104. This simultaneously tests saturation, the genuine integral basis, the minor-gcd direction and the discriminant denominator in §§2.1–2.5 (COU20 lines 255–290, §3, p.493; the numerical specialization is a direct calculation).

**The minor selection uses all embedding blocks.** For n=2 and a four-dimensional relation space, keep k=3 independent relations. Their span has codimension 1, so a joint surjection onto two one-dimensional gradient blocks cannot have both retained blocks zero. At codimension 2, taking the kernel of that joint surjection would make both zero. After selecting the same integer equation X²−2, its derivative values at the two conjugates are 2√2 and −2√2. The determinant signs may differ, but both are nonzero. For the nonnormal cubic equation X³−2, the field norm of 3κ² is 108; the same injectivity argument applies without normality (COU20 lines 330–351, §3, p.494).

**One model may represent several classes.** The polynomial (X²−2)(X²−3) has four distinct geometric roots, rational algebra ℚ(√2)×ℚ(√3), and two class images. The two derivative values in those factors are respectively −2√2 and 2√3 up to the chosen roots, so the Jacobian localization retains both factors. The polynomial X(X−1) instead has two rational factors and one class image. For X² the Jacobian localization is zero and the represented set is empty. Counting pairs (system, factor), then taking their image, handles all three cases. The system X(X−1),XY retains an isolated simple point (1,0) alongside the line X=0 before localization, and §5.5’s component-by-component degree argument bounds the isolated point despite that line (COU20 lines 363–380, §3, p.495; line 425, §4, p.496).

**Uniform parameters and inclusive height.** The Catalan values at r=1,2,3,4,5 are 1,2,5,14,42, so r(14)=4 and r(15)=5. For n above the single absolute threshold, take r=d=r(n) and M≤4n(r+1). If |disc K|≤H, then δ≤H^(1/n); the common real coefficient height is B=(nH^(1/n))^(Q₀ log n). Its natural floor C gives exactly (2C+1)^(rM) systems, and each contributes at most r^r field factors. Since rM is bounded by a constant times n(log n)², the logarithm of the total bound is at most a constant times n(log n)⁴ plus a constant times (log n)³log H. Enlarging one Q yields §5.6. At H=1 the second term is zero, not a denominator (COU20 line 385, equation (1), p.495; lines 421–430, §4, p.496).

## References

- **COU20:** Jean-Marc Couveignes, [*Enumerating number fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), Annals of Mathematics 192 (2020), 487–497, DOI 10.4007/annals.2020.192.2.4. Locators use this published version: canonical metric and measure, §2, p.489 (line 104); Proposition 1 and its argument, p.490 (line 127); arithmetic parameters and relation lattice, §3, pp.491–494 (line 169); Proposition 2, p.495 (line 354); Theorems 1–2, pp.487–488 (lines 20, 35); parameter estimates and coefficient counting, §4, pp.495–496 (line 381).

Generic geometry-of-numbers, interpolation and intersection theory enter through the exact supplier contracts above. The arithmetic statements and proof routes here use the cited published argument and the explicitly stated supplier hypotheses.
