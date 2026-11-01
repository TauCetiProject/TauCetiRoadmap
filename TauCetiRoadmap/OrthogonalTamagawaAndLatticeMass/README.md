# Roadmap: orthogonal Tamagawa comparison, arbitrary lattice masses, and class counts

**Summary.** Construct orthogonal gauge and quotient comparisons, arbitrary integral-genus mass formulas, general unramified dyadic integral models and exact class-count applications. Reuse the existing lattice, orthogonal group, local field, restricted-product and generic Haar/Tamagawa carriers; build the missing comparison maps and their complete APIs here.

## Scope and ownership

This roadmap owns the orthogonal algebraic-group/point and gauge comparisons, the rational arbitrary-genus mass formula, arbitrary unramified dyadic smooth models, the binary analytic comparison, and the rank-16/24 classification and rank-32/40 bounds. It builds on IntegralLattices and OrthogonalSpinGroups; it does not re-plan their lattice and point-group theories.

IntegralLattices §§2C/2G own automorphism and class finiteness, §6C owns rank-eight uniqueness, §§6D/6E own the rank-16/24 reference lattices and nonisomorphism, §7A owns proper/full masses, §7G and B8 own the direct small-rank masses, and §9B owns completeness from a distinct mass-saturating list. RootSystems Layers 5–6 own root classification and integral root data. OrthogonalSpinGroups §3A assigns the algebraic Spin groups and approximation applications here; its Layers 0–3 supply the native point groups. GeometryOfNumbersAndQuadraticArithmetic §3.3 owns the number-field orthogonal Tamagawa value and shared gauges, and its maximal-lattice specialization stops short of the rational arbitrary integral genera treated here. TauberianBoundaryConvergence N2/N3 owns the ordered endpoint theorem; this roadmap constructs its same-form arithmetic application. ImaginaryQuadraticClassNumber H1.4 owns the imaginary order-conductor sequence and H2.2 owns the quadratic zeta comparison and imaginary analytic class-number formula. ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”, owns the strict real order-class/regulator identity. Here the additional work is their transport to the same lattice, character, genus and density, together with the ordinary/narrow field normalization. GeometryOfNumbersAndQuadraticArithmetic §3.3.7 owns finite orthogonal-group orders, including characteristic two; §0.1a identifies the quadratic-preserving residue schemes used by Cho with those groups.

The comparison of Tamagawa numbers along an arbitrary central isogeny 1→Z→G′→G→1 of connected reductive groups over a number field (local and adelic lifting obstructions, rational and adelic images, the finite cohomological defect, character-lattice and gauge-Jacobian factors, and the resulting quotient-volume formula) is not part of this roadmap and nothing here consumes it. No roadmap on main or earlier in the merge order owns it: AdelicAlgebraicGroups AA.2 supplies quotient integration and the normalized Tamagawa measure only, and EndoscopicTransferAndUnitaryTraceComparison §6.5 gives scoped Kottwitz ratios only. It is an extension in the direction of AdelicAlgebraicGroups, whose Part II is its home. Its data are not finite in general: for the squaring isogeny of G_m over ℚ the rational cokernel ℚ×/ℚ×² is infinite and the adelic image is not open (AA.1.4), so any such formula must name the finite defect groups it uses. The mass formulas here use only the direct orthogonal value of 1.3 (orthogonalTamagawa_two with the 1.1–1.2 comparisons); neither tau(Spin)=1 nor |mu2| is used as a substitute for that value.


## Conventions

Use native `TauCeti.IntegralLattice` over ℚ, with symmetric bilinear form B integral on the lattice. Write Q(x)=B(x,x)/2 for the half-norm; it is integral exactly when the lattice is even. All positive-definite class sets below classify full integral isometries, not determinant-one isometries. A Gram matrix acts on column vectors, so its isometry equation is AᵀBA=B. The scheme convention M B Mᵀ=B is transported by M↦M⁻ᵀ. Gram representatives use `Fin n → ℚ` and therefore a fixed small universe. The rank-zero empty matrix has determinant 1 and one automorphism. The normalizer construction of Spin is used only in positive rank; Spin of the zero space means the trivial group.

For local densities use the stabilized bilinear matrix count of IntegralLattices §7C, denoted α_p, and put β_p=α_p/2 in positive rank. This division by two is a density normalization, not an assertion that every integral stabilizer contains a determinant-minus-one element. Every determinant, local density and Haar volume used as a denominator below is positive; number-field quadratic spaces are nondegenerate and local residue fields have cardinality at least two.

## Exact supplier contracts

### From Mathlib

Use `Matrix.PosDef`, integral matrix multiplication, determinant and nonsingular inverse for the small Gram presentation; `QuadraticForm`, `CliffordAlgebra`, `lipschitzGroup`, `spinGroup` for point comparisons. Use `Real.Gamma` for real factors, and `bernoulli`, `bernoulli_one`, `sum_bernoulli`, `bernoulliPowerSeries_mul_exp_sub_one` for the Bernoulli convention and recurrence. The native Dirichlet-character conductor, complexification, analytic continuation and nonvanishing declarations consumed by §1.4 retain the nonzero-level and nontrivial-character hypotheses stated there.

### From Tau Ceti

Use `IntegralLattice.ofGramMatrix` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, `IntegralLattice.Isometry` and its group structure in `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Group.lean`, `IntegralLattice.IsPosDef.finite_isometry` in `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean`, `IntegralLattice.IsEven` and `IntegralLattice.IsUnimodular` in the corresponding Even and Unimodular modules. An integral lattice itself need not be positive definite; the Gram subtype in §0.0 carries that hypothesis. The split carriers `TauCeti.TypeBSpinCarrier.groupScheme` and `TauCeti.TypeDSpinCarrier.groupScheme` in the TypeB and TypeD SpinCarrier/Basic modules are also native; the missing comparison attaches a group scheme to an arbitrary nondegenerate form. The form-preserving and standard special orthogonal group schemes used in §0.1, and the character/order/discriminant/residue declarations used in §1.4, are consumed with their actual coefficient hypotheses.

### From TauCetiRoadmap.IntegralLattices

Consume §§0A–0E for the lattice/basis dictionary; §§2C/2G for finiteness; §§3C/3E/3I and §5A for local classification and Jordan data; §§4B/4C for genus and proper spinor-genus carriers; §§6C–6E for reference lattices; §§7A/7C/7E/7G for masses, stabilized local counts, sphere volumes and elementary ranks; B1–B4/B7/B8 for binary orders, genus maps and direct masses; §9B for the general exhaustion implication. The local count of §7C is consumed before the global analytic conclusion, so the mass evaluation does not enter its own premises.

### From TauCetiRoadmap.OrthogonalSpinGroups and TauCetiRoadmap.ReductiveGroups

Consume OrthogonalSpinGroups Layers 0–3 for native point groups, spinor norms, compact-open reference families and rational diagonals. Consume ReductiveGroups Layers 0/3 for the affine Hopf/point dictionary, closed subgroup schemes and components, Layer 5 for unipotent groups, Layer 7a for the ordinary Frobenius Lang and quotient inputs, and Layers 6/8 for semisimplicity, central isogenies, descent and the split root-datum classification. The arbitrary-form Spin instance is constructed in §0.1.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume AA.1–4, specifically AA.2.4's normalization `|d_K|^(-dim G/2) rho_G^(-1) product_v lambda_v |omega|_v`, additive volume one on O_v, dx at real places, 2 dxdy at complex places, and counting measure on rational points. AA.4.2 supplies strong approximation for simply connected semisimple groups when each almost-simple factor has noncompact product over S. Retain finite-change and away-S reference maps from AA.1.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §§2.4/3.3, in particular `orthogonalTamagawa_two`, `orthogonalPinnedGaugeJacobian`, `compactOrthogonalGaugeVolume` and `orthogonalIntegralRealGaugeCompatibility`, for nondegenerate number-field forms of rank at least three. Consume §3.3.7 “Reductive-quotient orders and canonical local volume”, specifically `finiteOrthogonalOrder`, for the split/nonsplit even and odd quadratic-group finite-point orders, retaining disconnected components. The maximal-lattice numerical theorem has totally real degree at least two, total positivity and maximality hypotheses; it is not the arbitrary rational-genus formula.

### From TauCetiRoadmap.GlobalNumberFields and TauCetiRoadmap.TauberianBoundaryConvergence

Consume GlobalNumberFields §9's conductor/parity-compatible Hecke/Dirichlet dictionary and the native quadratic order maps. Consume TauberianBoundaryConvergence N2/N3's increasing-prime endpoint, cofinal cutoff and finite-deletion comparisons. No unordered product at s=1 is imported.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber and TauCetiRoadmap.ArithmeticStatisticsPartV

Consume ImaginaryQuadraticClassNumber H1.4's imaginary conductor sequence and order class-number formula, with the actual unit index at every conductor, and H2.2's quadratic ideal-coefficient/zeta comparison and imaginary class-number formula, including unit orders 6 and 4. Consume ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”, for the primitive strict form/order comparison and the positive norm-one regulator identity at every real quadratic order. In §1.4c these inputs retain primitive invertible ideal classes, Δ=f²D, f≥1, and nonsquare field discriminant D; they do not give a comparison with a single lattice genus or its local-density measure.

### From TauCetiRoadmap.RootSystems

Consume RootSystems Layers 5–6, the reduced crystallographic root classification and lattice comparison for the root and glue stabilizer arguments in Layer 4. Exact lattice automorphism orders are conclusions here, not entries assumed from a root table.

## How to read the build

Layer 0 fixes the small Gram presentation, algebraic groups and point comparisons; its approximation branch is independent of masses. Layer 1 compares quotient measures and gauges and states the density identity, with a separate binary analytic branch. Layer 2 evaluates the arbitrary dyadic factors and assembles the numerical formula. Layer 3 specializes it to even unimodular lattices. Layer 4 applies the supplied exhaustion implication to proved automorphism orders and derives the class-count bounds.

## Layer 0: native and scheme dictionaries

### 0.0 Small Gram presentation of native lattice classes

Define `GramMatrix n` as integral matrices indexed by Fin n and `PositiveGram n` as the subtype of symmetric matrices whose rational extension is positive definite. Define `nativeLattice G` by `IntegralLattice.ofGramMatrix` on the standard rational basis. Define `GramEquivalent G H` by existence of an integral A with unit determinant and AᵀGA=H; its equivalence relation is `gramSetoid n`, its quotient is `GramClass n`, and `classOf G` is the quotient map. This is a presentation of native integral isometry classes, not a new lattice carrier (IntegralLattices §§0B/0E).

The API is:

- prove that integral congruence is equivalent in both directions to a native integral isometry, and that every rank-n positive native lattice admits such a basis presentation;
- transport inverse and composition of isometries to inverse and multiplication of matrices, retaining determinant ±1;
- prove independence of basis for parity, determinant and the full automorphism order, by conjugation of native self-isometries.

*Needs:* Mathlib matrix algebra and `Matrix.PosDef`; Tau Ceti `IntegralLattice.ofGramMatrix` and native isometries; IntegralLattices §§0B/0E.

**Checks.**

- In rank zero the empty Gram matrix is positive definite vacuously, has determinant 1, represents one class, and gives the zero native lattice.
- The matrices [1] and [2] are positive but not integrally congruent: unit 1×1 matrices have square 1, not 2; the zero matrix [0] fails positivity.
- For G=diag(1,2) and A=[[1,1],[0,1]], AᵀGA=[[1,1],[1,3]] represents the same class and native lattice; A=diag(2,1) has determinant 2 and cannot witness integral equivalence.

Define `fullAutomorphismOrder G` as the natural cardinal of the native self-isometry group of `nativeLattice G`. Define `classAutomorphismOrder c` by choosing a Gram representative of c and taking that order. Prove that conjugation by an integral isometry makes it independent of the representative, and identify it with the full order used in IntegralLattices §7A's mass.

The API is positivity from the identity and definite-lattice finiteness, equality on congruent Gram matrices, and transport of reciprocal weights to the native genus class set. *Needs:* the preceding Gram dictionary and IntegralLattices §§2C/7A.

**Checks.**

- The empty Gram matrix has order 1; [1] and [2] each have order 2, from their two sign isometries.
- diag(1,2) has full order 4, whereas its determinant-one subgroup has order 2.
- The congruent matrix [[1,1],[1,3]] also has order 4; replacing an integral basis does not change a class weight of 1/4.

### 0.1 Algebraic orthogonal and Spin groups

Construct the algebraic groups O(V,Q), SO(V,Q) and Spin(V,Q) of a nondegenerate quadratic space of dimension n over a field K of characteristic different from 2, with an arbitrary Gram matrix C, and prove their structure theorems using the general structure and descent contracts above.

- O(V,Q) is Tau Ceti's form-preserving group scheme `TauCeti.ConstantForm.groupScheme K n C`, whose points are the matrices M with M C Mᵀ = C (`TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`); SO(V,Q) is its determinant-one closed subgroup, cut out as `TauCeti.SpecialOrthogonal.definingHopfIdeal` does for C = 1. Prove for every nondegenerate C what the pinned library proves only for the standard form: smoothness (`TauCeti.SpecialOrthogonal.smoothCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`) and, for SO, geometric connectedness and reductivity (`TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`). Route: over an algebraic closure C is congruent to the identity, so the base change is isomorphic to the standard group, and these properties are geometric. Do not reconstruct the form-preserving Hopf ideal or the standard-form SO package.
- For n > 0, Spin(V,Q) is the affine group scheme whose A-points are the even invertible elements g of the Clifford algebra of Q ⊗ A with g V_A g⁻¹ = V_A and spinor norm g ḡ = 1. Prove that on K-points it is Mathlib's `spinGroup` of Q, compatibly with base change. Construct the morphism Spin(V,Q) → SO(V,Q), v ↦ g v g⁻¹, prove that it is a central isogeny in the sense of `TauCeti.CommHopfAlgCat.IsCentralIsogeny` with kernel μ₂ in positive rank, and prove that on K-points it is OrthogonalSpinGroups' native projection `spinToSpecialOrthogonal Q`. Its image on K-points is the spinor-norm kernel, not all of SO(V,Q)(K).
- For n ≥ 3 prove that Spin(V,Q) is smooth of dimension n(n−1)/2, geometrically connected, semisimple (`TauCeti.semisimpleCommHopfAlgProperty K`) and simply connected (`TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K`), both over K and after base change to an algebraic closure. Route: over an algebraic closure Q is split; compute a split maximal torus of Spin, its roots and coroots, and show that its cocharacter lattice is the coroot lattice of type B_m (n = 2m+1) or D_m (n = 2m), so that ReductiveGroups Layer 8 identifies it with the split simply connected group of that type; for n = 3 (type A₁, Spin ≅ SL₁ of the even Clifford quaternion algebra) and n = 6 (Spin ≅ SL₄ split) compare directly. Descend to K with Tau Ceti's `TauCeti.CommHopfAlgCat.IsCentralIsogeny.baseChange` and `TauCeti.CommHopfAlgCat.isCentralIsogeny_baseChangeMap_iff`: a central isogeny onto Spin over K becomes one over the closure, hence an isomorphism there, hence over K by faithfully flat descent.
- Almost-K-simple factors: for n ≥ 3, n ≠ 4, Spin(V,Q) is absolutely almost simple. For n = 4 let Z be the centre of the even Clifford algebra, the étale quadratic algebra K[t]/(t² − d) with d the signed discriminant. Prove an isomorphism of K-groups Spin(V,Q) ≅ Res_(Z/K) SL₁(C₀(Q)): if d is a square this is a product of two forms of SL₂ (two almost-K-simple factors); if not, it is one almost-K-simple factor that is not absolutely almost simple. 0.3 quantifies over exactly these factors.
- For n = 2, Spin(V,Q) is the one-dimensional norm-one torus of K[t]/(t² + det C) and is not semisimple; for n = 1 it is μ₂ and for n = 0 define it separately as the trivial group, with trivial projection kernel. None of these is used as a semisimple simply connected group.

For positive rank the construction and central cover use Milne, *Algebraic Groups* (2022 corrected version), §24i, pp.535–537; the zero branch is the convention determined by native `spinGroup`. The structure and root-datum arguments use the cited ReductiveGroups contracts.

*Needs:* Mathlib Clifford algebra and native Spin; Tau Ceti form-preserving and standard SO group schemes; ReductiveGroups Layers 6/8; OrthogonalSpinGroups §3A point comparison contract.

**Checks.**

- For V=0 over ℚ the unrestricted norm-one normalizer in C⁰=ℚ is {1,−1}, of order 2. The invertible-vector generating set is empty, so native Spin has order 1; the separate zero branch and its kernel both have order 1.
- For a rank-one form ⟨a⟩ with a≠0, Spin=μ₂ has two geometric points while SO has one; the positive-rank kernel has order 2.

- For Q = x² + y² over ℚ, Spin(ℚ) is the group of norm-one elements of ℚ(i), an infinite abelian group containing (3+4i)/5; a definition that declared every Spin group semisimple, or allowed n = 2 in 0.3, would assert strong approximation for a torus, which fails.
- For Q = x² + y² + z² + w² over ℚ the discriminant is 1, a square, and Spin ≅ SL₁(H) × SL₁(H) with H the Hamilton quaternions over ℚ: two almost-ℚ-simple factors, each compact at ∞. For x² + y² + z² + 2w² the discriminant 2 is not a square and Spin is one factor Res_(ℚ(√2)/ℚ) SL₁(D). A model treating rank 4 as one absolutely almost simple group gets the first case wrong.
- For Q = x² + y² + z² over ℚ the product of the reflections in e₁ and e₁ + e₂ lies in SO(ℚ) with spinor norm Q(e₁)Q(e₁ + e₂) = 2, not a square, so it is not the image of a rational Spin point although Spin → SO is a central isogeny: a central isogeny is not surjective on K-points.
- SO(V,Q) for n ≥ 3 is semisimple but not simply connected: Spin → SO is a central isogeny that is not an isomorphism, its kernel μ₂ being nontrivial. A definition of simple connectedness that SO satisfied would be wrong.

### 0.1a Quadratic residue groups in characteristic two

For a finite-dimensional quadratic space (W,q) over a perfect field k of characteristic two, construct the affine subgroup scheme O(q) of GL(W) by the coefficients of q(gx)−q(x), on every commutative k-algebra. Thus the equations preserve q itself, including its square coefficients. Construct its scheme-theoretic reduction and the inclusion O(q)_red → O(q). The generic Hopf-ideal and point-functor constructions are those of ReductiveGroups Layers 0/3. For the regular spaces used here, in even dimension the polar form is nondegenerate; in odd dimension its radical is a line on which q is nonzero. Rank zero is separate. Identify the reduced schemes with the quadratic orthogonal realizations in GeometryOfNumbersAndQuadraticArithmetic §3.3.7 (Cho v3, §4.1, p.16).

The API is:

- the point bijection on every k-algebra is compatible with products, inverses and basis change; over reduced algebras the inclusion of the reduction induces the same points, but this is not asserted over algebras with nilpotents;
- for even dimension 2r>0, O(q) is smooth with two geometric components and its identity component is the kernel of the Dickson invariant; determinant one does not distinguish the components in characteristic two;
- for odd dimension 2r+1, O(q)_red is connected; its action on the quotient by the polar radical gives the characteristic-two isogeny to the symplectic group and a bijection on points over perfect extension fields, without claiming an isomorphism of schemes;
- transport the supplied finite-point counts: at |k|=f, the full even groups have orders 2 f^(r(r−1))(f^r∓1)∏_(j=1..r−1)(f^(2j)−1), r≥1, and the odd reduced groups have order f^(r²)∏_(j=1..r)(f^(2j)−1), r≥0. The zero-dimensional group has order 1. These are comparisons with the supplied orders, not a second finite-group classification.

*Needs:* Mathlib `QuadraticForm`; ReductiveGroups Layers 0/3; GeometryOfNumbersAndQuadraticArithmetic §3.3.7 finite quadratic-group realizations and orders; Cho v3, §4.1, p.16, for the reduction convention.

**Checks.**

- For q=xy on 𝔽₂², O(q) has the identity and coordinate swap, order 2=2(2−1). Its alternating polar stabilizer is GL₂(𝔽₂), of order 6; the shear sends (0,1) to (1,1), changing q from 0 to 1.
- For q=x²+xy+y² on 𝔽₂² every nonzero vector has value 1, so O(q) has order 6=2(2+1). At f=4 the split and nonsplit binary orders are 6 and 10; the split formula cannot be used for both.
- For q=z²+xy on 𝔽₂³ the polar radical is the z-axis, q(z)=1, and the reduced group has 6=2(2²−1) points. For q=z² in dimension one the reduced group has one point, but O(q) has the nonidentity point 1+ε over k[ε]/(ε²), since (1+ε)²=1; reduction cannot preserve points on every algebra.
- Rank zero has one point, while the even split order expression at r=0 would give zero. The nonsingular hypothesis also excludes the zero quadratic form on k², whose isometry group at k=𝔽₂ has order 6 rather than the split binary order 2.

### 0.2 Point, topology and stabilizer comparisons

Construct the group-scheme/point comparisons between the actual OG Spin/SO groups and ReductiveGroups' affine Hopf points over the number field, completions and adeles. Retain matrix action, Spin projection, coefficient change, determinant, rational diagonals, continuity in both directions and compatibility with AA integral models outside an explicitly proved finite exceptional set. Transport compatible reference tuples through finite-change and away-S identifications. A bare forward map or equality of abstract groups is insufficient.


Prove the finite-prime lattice stabilizers compact open on these exact point carriers, consuming IL4B and the completed-lattice embedding dictionary, and identify proper/full arithmetic stabilizers with native integral isometry groups.

This comparison is a deduction from the equations in §0.1, the point topologies and base-change maps of OrthogonalSpinGroups §§2B/3B–3D, and the restricted-product transport of AdelicAlgebraicGroups AA.1: matrix inversion and transpose are continuous on GL, and multiplication and inversion in the finite-dimensional Clifford unit algebra give the Spin comparison its subspace topology. Integral model compatibility follows by clearing the finitely many denominators of the chosen rational bases and of the coordinate formulas of the comparisons and their inverses; compact openness and the lattice dictionary then transport IntegralLattices §4B.

The matrix comparison from scheme points to column isometries is M↦M⁻ᵀ, with inverse A↦A⁻ᵀ. Its API consists of group multiplication, coefficient-change naturality, determinant and Spin projection commutation, and continuous inverse maps on local and restricted-product topologies.

*Needs:* §0.1; OrthogonalSpinGroups Layers 0–3; IntegralLattices §4B; AdelicAlgebraicGroups AA.1–2.

**Checks.**

- With C=diag(1,4) and M=[[0,1/2],[2,0]], MCMᵀ=C whereas MᵀCM=diag(16,1/4); A=M⁻ᵀ gives AᵀCA=C.
- Identity matrices map to identity matrices, and a diagonal reflection has determinant −1 on both sides; a map landing only in SO would lose it.
- For C=[2] at p=3 the stabilizer is {±1}, its determinant-one subgroup is {1}, and their finite Haar volumes have ratio 2. The full/proper distinction survives transport.

### 0.3 Approximation and Eichler applications

For rank n≥3 instantiate AdelicAlgebraicGroups AA.4.2 with a finite S containing all archimedean places and, for every almost-K-simple factor H, noncompact product_(v∈S)H(K_v). Prove rational Spin density in Spin(A^S) and the closure of its image in the same SO(A^S) equals the reference-controlled spinor kernel. Specialization to finite adeles requires these hypotheses for S=all archimedean places; a definite form may instead require finite places in S and does not thereby acquire the finite-adelic conclusion. Prove the IL4D Eichler and indefinite rank≥3 class-finiteness applications separately. Keep definite forms and full-adeles distinctions. This lane is not a prerequisite of the positive-definite mass lane.

*Needs:* §0.1–0.2; AdelicAlgebraicGroups AA.4.2; IntegralLattices §4D's class/spinor-genus interface. The Eichler conclusion is equality of proper classes and proper spinor genera for indefinite rational forms of rank at least three (O’Meara, 104:4–5).

**Checks.**

- A definite ternary form has compact Spin(ℝ); S={∞} fails the noncompactness hypothesis and gives no finite-adelic density assertion.
- For split rank three Spin=SL₂, the real factor is noncompact and S={∞} meets the factor condition.
- In split rank four there are two SL₂ factors; compactness of either S-product would fail the hypothesis even if the other is noncompact.

### Examples

The rank-zero comparison gives the trivial group; rank two gives a norm-one torus; rank four tests two almost-simple factors. These cases separate the domains of the structure and approximation theorems.

### Dependencies

Mathlib matrix/Clifford algebra, Tau Ceti lattice and group schemes, IntegralLattices §§0/4, OrthogonalSpinGroups Layers 0–3, ReductiveGroups Layers 6/8, and AdelicAlgebraicGroups AA.1–4.

## Layer 1: quotient and gauge transport

### 1.1 Proper adelic quotient

On the proper finite-adelic double coset set IL4B, construct the measurable decomposition of SO(V)(K)\SO(V)(A) into pieces indexed by actual proper lattice classes, with arithmetic stabilizer SO(M). Compare this quotient and its measure to AA's actual quotient integration and the shared §3.3 proper mass identity. In the positive-definite rational branch the archimedean group is compact. Each piece has volume vol(K_infinity) product_p vol(K_p^+(M))/|SO(M)|. Prove measurability/disjointness, positivity, independence of representative and finiteness using actual lattice reduction, not strong approximation.

Write G=SO(V), G∞=∏_(v|∞)G(K_v), and K_f=∏_(v finite)K_v⁺(L). For a representative g_i of G(K)\G(A_f)/K_f put Γ_i=G(K)∩g_iK_fg_i⁻¹. Identify the i-th piece of G(K)\G(A) with Γ_i ∖ (G∞×K_f), where γ acts by (x,k)↦(γ∞x,(g_i⁻¹γ_fg_i)k). The map is [(x,k)]↦[(x,g_i k)]. Its inverse sends an adele (a∞,a_f) with a_f=γ_f g_i k to [(γ∞⁻¹a∞,k)]; prove that all choices differ by precisely this Γ_i-action. Only after taking the right K_f quotient does the piece become Γ_i\G∞. In the totally definite branch Γ_i is finite, and the quotient measure is the pushforward of the product Haar measure divided by |Γ_i|, so integrating the retained K_f coordinate gives vol(G∞)vol(K_f)/|Γ_i|. For the general branch use the quotient integration of AA.2 rather than a finite-cardinality division. Prove representative independence, measurability, basis-change equivariance and this disintegration (deduction from AdelicAlgebraicGroups AA.2 and Belolipetsky–Gan v2, §2, pp.2–3).

*Needs:* §0.2; IntegralLattices §§2C/2G/4B/7A; AdelicAlgebraicGroups AA.2 quotient integration; GeometryOfNumbersAndQuadraticArithmetic §3.3 proper mass identity.

**Checks.**

- A full class with |O(M)|=12 and |SO(M)|=6 contributes 1/12 and 1/6 to full and proper mass respectively.
- If O(M)=SO(M) has order 2, its full class splits into two proper classes, each of weight 1/2: the total proper weight is 1 versus full weight 1/2.
- For G=SO(x²+y²+z²) and k∈K_f equal at 3 to the rotation block [[3/5,−4/5],[4/5,3/5]] and identity elsewhere, the block has determinant 1 and squared column length 9/25+16/25=1. The points [(1,1)] and [(1,k)] are distinct in G(ℚ)\G(A), because equality forces the rational multiplier to be 1 at ∞, but coincide after right quotient by K_f.
- In rank zero the quotient and stabilizer are singletons and both masses are 1; the positive-rank factor 2 does not extend there.

### 1.2 Gauge and local-density transport

Transport orthogonalPinnedGaugeJacobian and orthogonalIntegralRealGaugeCompatibility to B and B/2 conventions. For rank n>=3 let V_n be the IL7E sphere-fibration volume of SO(n) for the metric making E_ij-E_ji orthonormal. For the pinned mass gauge in the shared §3.3, prove compactOrthogonalGaugeVolume=s_n V_n, where s_n=2^(-floor(n/2)) in odd rank and s_n=1 in even rank. In particular V_3=8π² while the rank-three mass-gauge volume is 4π². Keep this pinned-gauge scalar distinct from the B versus B/2 coefficient transport and from the global integral/real gauge compatibility. Identify the local Haar density with the stabilized bilinear count IL7C, including the determinant-component index and every factor of two. Do not declare vol(K_p)=alpha_p without this Jacobian theorem. Prove model-independence and form-twist transport with the gauge scaling and global product formula. State measure equality before substituting any numerical tau value.

For a positive-definite integral Gram matrix B of rank n≥3, write D=det B>0, d=n(n−1)/2, and Rₙ=π^(−n(n+1)/4)∏_(j=1..n)Γ(j/2). Let v∞ and v_p be the volumes of SO(B)(ℝ) and K_p⁺(L) in the local measures whose product is the specified Tamagawa measure. Construct the local change-of-gauge maps and prove the combined Jacobian identity

    v∞ · product_p v_p = product_p beta_p / (2 R_n D^((n+1)/2)).

At finite primes the comparison includes the index [K_p:K_p⁺]. For rational integral lattices prove this index is 2 using a reflection in a Jordan constituent (including an even binary constituent at 2); do not infer it from the definition of β_p. The gauge identity includes the B versus B/2 transport and the product formula. It is not the assertion v_p=β_p. Both products converge in the rank range here (Conway–Sloane, equations (2), (3), (6); Belolipetsky–Gan v2, §2, p.3, for the real gauge).

*Needs:* §1.1; IntegralLattices §§3C/3I/7C/7E; GeometryOfNumbersAndQuadraticArithmetic §3.3 gauge/Jacobian contracts; AdelicAlgebraicGroups AA.2.4 and the number-field product formula. Closed dyadic evaluations are supplied by Layer 2, independently of this measure comparison.

**Checks.**

- Rank three has V₃=8π² and s₃=1/2, giving gauge volume 4π²; rank four has V₄=16π⁴ and s₄=1, giving 16π⁴.
- Replacing B by tB for positive integer t preserves all integral isometries; D changes by tⁿ and β_p changes by p^(v_p(t)·n(n+1)/2), cancelling D^((n+1)/2) in the global formula.
- For U=[[0,1],[1,0]] at 2, reflection in (1,1) is [[0,−1],[−1,0]], integral with determinant −1. Its norm is 2; requiring unit norm would miss this local determinant-component witness.

### 1.3 Arbitrary-genus mass identity

For every positive-definite integral lattice L over ℤ of rank n≥3 with nondegenerate Gram matrix B, identify its full genus mass with

    m_full(gen L) = tau(SO(B)) / (2 v_infinity product_p v_p).

First prove this measure identity using §1.1 and IntegralLattices §7A. Then use GeometryOfNumbersAndQuadraticArithmetic §3.3's value τ(SO(B))=2 and §1.2 to obtain

    m_full(gen L) = 2 R_n (det B)^((n+1)/2) product_p beta_p(L)^(-1).

The real power uses det B>0. The finite bad-prime set is S={p : p divides 2 det B}; β_p is the positive stabilized bilinear density α_p/2 at every prime, including S. Section 2.3 specifies the good factors and convergence and evaluates the bad factors, so this is a formula for every integral genus, with no maximality or unimodularity restriction (Conway–Sloane, equations (2), (3), (6)).

Rank zero has full mass 1, rank one has full mass 1/2 and proper mass 1, by IntegralLattices §7G. Positive rank two uses the independent binary ideal-class/norm-torus comparison of §1.4; the same numerical density expression then holds with R₂=1/π and the increasing-prime convention, not from the rank≥3 Tamagawa theorem.

*Needs:* §§0.2/1.1/1.2; IntegralLattices §7A; GeometryOfNumbersAndQuadraticArithmetic §3.3 `orthogonalTamagawa_two`. The binary branch instead needs §1.4 and IntegralLattices B7/B8.

**Checks.**

- For A₂, D=3, β₂=6, β₃=6 and the good product is (3/2)L(1,χ₋₃); with L(1,χ₋₃)=π/(3√3), the expression gives (2/π)·3√3·(1/36)·π/(2√3)=1/12.
- For B=[[4,1],[1,6]], D=23, β₂=2, β₂₃=46 and the good product is L(1,χ₋₂₃)/2; with L(1,χ₋₂₃)=3π/√23 the expression gives (2/π)·23√23·(1/92)·3π/(2√23)=3/4.
- For E₈, D=1, the dyadic factor β₂ is 2⁸ times its good-factor expression. Thus the product is 2⁻⁸ζ(2)ζ(4)²ζ(6); 2R₈=135/(8π¹⁶) gives 1/696729600.

### 1.4 Binary quadratic analytic normalization

Construct the rank-two analytic endpoint independently of the rank≥3 orthogonal
value and AA split-measure lanes. The positive binary class-count mass remains
IL B8's algebraic theorem; the comparison below is required when identifying
its value with local Euler factors. Preserve the indefinite real/narrow/regulator
comparison and the distinct split branch. None follows from a rank≥3 tau theorem.

**1.4a Signed character and conductor.** For a nonsplit nondegenerate rational
binary form, select the fundamental discriminant `D` of its quadratic field and
prove that its square class is the signed determinant `−det B`. For an integral
primitive binary form of discriminant `Δ`, construct `Δ=f²D` with the actual order
conductor `f≥1`; content removal is a separate lattice-to-form map.
For `B=[[A,b],[b,C]]`, the integral classical form `B(x,x)` has coefficients
`(A,2b,C)`. After dividing by its positive gcd content `g`, its primitive
classical discriminant is `Δ=−4 det(B)/g²`. If `B` is even, the integral
half-norm has coefficients `(A/2,b,C/2)`; after its own gcd `g_half`, the
primitive discriminant is `Δ=−det(B)/g_half²`. Prove integrality, primitivity,
`Δ≡0 or1 mod4`, and agreement via `g=2g_half` in the even case. A half-norm
of an odd lattice is not silently an integral classical form. Cancel content in
the integral POLYNOMIAL isometry equations: for the primitive polynomial the
integral polar matrix is `2B/g`; `B/g` need not be integral (A2 is a test). Use
the actual polynomial-to-native-lattice/ideal adapter, not an unsupported
assertion that dividing the bilinear lattice by its polynomial content stays
integral. The signed
extension square class is `−det B` in both conventions, but that square class
alone does not determine the order or its conductor. Construct the actual
quadratic order of discriminant `Δ`, not automatically the maximal order.
 Use the native
`DirichletCharacter ℂ |D|`, `IsPrimitive`, `conductor` and `changeLevel` carriers.
Instantiate the existing native
`TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD`, then complexify it by
`.ringHomComp (Int.castRingHom ℂ)`. Consume native
`isPrimitive_fundamentalDiscriminantChar`, `fundamentalDiscriminantChar_isQuadratic`,
`fundamentalDiscriminantChar_neg_one` and the odd-prime Legendre evaluation,
and native `DirichletCharacter.conductor_ringHomComp` /
`isPrimitive_ringHomComp_iff` with `Int.cast_injective`. Retain the native CRT/prime-discriminant, quadratic-character and primitive-conductor normalizations. Derive `χ_D≠1` from the fundamental nonsplit `D≠1`
and conductor, and keep `[NeZero D.natAbs]` explicit. For the field dictionary,
extract the actual squarefree integral radicand of `−det B` and transport its
square-root field to the chosen native quadratic field. Reuse native
`discr_eq_fundamentalDiscriminant` with its actual integral generator/minpoly/
adjoin/Squarefree data, or `discr_adjoin_singleton_eq_fundamentalDiscriminant`
with its square-root and rational-nonsquare data. Only these SAME-form/field
transport and local dyadic/order dictionaries are new adapters. The `D=1` split
algebra uses the native trivial case and remains separate from a quadratic
number field. Existing native Gauss-sum/fixed-field comparisons may supply
cyclotomic field identification at their exact hypotheses; they are not needed
as a late class-field-theory premise of this endpoint.
Compare the finite-order Hecke character over ℚ through GNF9's actual conductor-
and parity-compatible dictionary, including ideal values and the real sign.
This adapter does not require global class field reciprocity or a new character
carrier. For a changed level or finite excluded prime set use native
`LFunction_changeLevel` with its `χ≠1 ∨ s≠1` and nonzero-level hypotheses; prove
the finite deleted factors individually nonzero at1.

The adapter has source nondegenerate integral binary Gram lattices with a chosen orientation and target primitive integral binary forms, their quadratic orders and native fundamental characters; content is retained as a separate positive integer. Prove that orientation-preserving integral basis changes induce proper form equivalences and order-ideal correspondences; orientation reversal induces conjugation. Coefficient change commutes with the field and local-form comparisons.

*Needs:* §0.0; IntegralLattices B1/B2; GlobalNumberFields §9; native fundamental-discriminant characters, their conductor and field-discriminant theorems cited above.

**Checks.**

- A₂ with B=[[2,−1],[−1,2]] has norm content 2, primitive form (1,−1,1), half-norm content 1, and Δ=−3 by both formulas.
- B=diag(1,1) has primitive norm (1,0,1), Δ=−4 and half-norm (x²+y²)/2, which is not an integral form.
- B=[[4,1],[1,6]] has norm content 2, primitive form (2,1,3), Δ=−23 and conductor 1; replacing B by 2B changes the content to 4 and leaves Δ unchanged.

**1.4b Native endpoint application.** Consume TauberianBoundaryConvergence N2/N3
on the actual primitive native `χ_D` constructed in1.4a, or its explicitly changed
level. Retain `[NeZero N]`, `χ≠1`, native `differentiable_LFunction` and
`LFunction_ne_zero_of_one_le_re` on the ENTIRE closed half-plane. N3 uses the
existing coefficient `χ(n)Λ(n)/Real.log(n)`, its0/1 cases and prime-power bound,
normalized local analytic-log patching, the N2 ordinary endpoint and the absolute
higher-prime-power removal. No second logarithm/Tauberian engine is owned here.
Its exact output is `Tendsto` of finite increasing-prime products outside `S` to
`LFunction χ 1 * ∏ p∈S, (1−χ(p)/p) ≠ 0`. The cutoff comparison, conductor change,
finite deletion factors and real positivity for quadratic `χ_D` are mandatory.
No unordered `HasProd`/`HasSum` or totalized `LSeries` value at1 is substituted.

*Needs:* §1.4a; TauberianBoundaryConvergence N2/N3; native Dirichlet L-function continuation and closed-half-plane nonvanishing with positive level.

**Checks.**

- For D=−3, deleting p=2 multiplies L(1,χ) by 1−χ(2)/2=3/2, not its reciprocal.
- For D=−4 the prime 2 is ramified and χ(2)=0, so deleting it multiplies the endpoint by 1.
- The trivial level-one character gives factors (1−1/p)⁻¹ and diverges; χ≠1 excludes it from the endpoint theorem.

**1.4c Quadratic residue, order and genus dictionary.** Apply ImaginaryQuadraticClassNumber H2.2's all-prime ideal-coefficient identity and quadratic zeta factorization to the field and character identified in §1.4a, retaining equality on Re(s)>1 and the right-hand residue at 1. Its imaginary specialization gives L(1,χ_D)=2πh_D/(w_D√|D|), with imaginary regulator 1. The new comparison is with this same lattice's primitive order and genus, rather than another proof of these field identities. The ordered prime endpoint remains the separate §1.4b output.

For the real quadratic specialization, deduce the residue constant from `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` and `riemannZeta_residue_one`: signature (2,0) and w=2 give 2hR/√D. For `D>0` obtain `L(1,χ_D)=2 h_D R_D/sqrt D`, and prove the equivalent narrow
normalization `h_D^+ R_D^+/sqrt D`. Here the totally positive units
`O_K^{×,+}` form an infinite cyclic group (`−1` is not totally positive); let
`η` be its generator with `σ(η)>1` at a chosen real embedding `σ`, and put
`R_D^+=log σ(η)`. Prove this is independent of `σ`: the other embedding sends
`η` to `N(η)/σ(η)=1/σ(η)`, and the generator with value `>1` there is `η⁻¹`.
There is no least totally positive unit, since `η⁻¹<1`; the regulator is the
positive logarithm of the generator, not a minimum. Distinguish ordinary and
narrow classes and the possible norm−1 unit; prove `h_D^+ R_D^+=2 h_D R_D`
rather than silently identifying the groups or regulators. Check: for `D=5`,
`ε=(1+√5)/2` has norm `−1`, so `η=ε²`, `R^+=2R`, `h^+=h=1`; for `D=12`,
`ε=2+√3` has norm `1` and is totally positive, so `R^+=R`, `h^+=2=2h`.

For imaginary orders consume ImaginaryQuadraticClassNumber H1.4's conductor sequence and its formula h_f=h_K f∏_(p|f)(1−χ_D(p)/p)/[O_K×:O_f×], including dyadic conductor primes and exceptional units. Its finite Picard groups and the unit-order ratio give h(Δ)/w_f=√|Δ| L(1,χ_D)∏_(p|f)(1−χ_D(p)/p)/(2π). For real orders consume ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”: its strict order-class comparison identifies h⁺(Δ)R_f⁺ with √Δ L(1,χ_D)∏_(p|f)(1−χ_D(p)/p), where R_f⁺ is the positive norm-one period of the primitive order. Transport its positive-unit index and logarithmic period through the actual order maps; neither a maximal-order regulator nor an imprimitive form is substituted.

The ordinary/narrow field normalization is a deduction from `NumberFieldOrder.card_narrowPic` in `TauCeti/NumberTheory/NumberField/Global/Orders/NarrowPic/Kernel.lean` and `TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator` in `TauCeti/NumberTheory/NumberField/Units/Regulator.lean`: if the unit signatures have order s∈{2,4}, then h⁺/h=4/s and R⁺/R=s/2, hence h⁺R⁺=2hR. These identities are on finite ideal-class carriers; a total `Nat.card` identity alone is not a finiteness proof. The logarithm of η^a is a log σ(η), so the index of a subgroup of positive units multiplies its regulator by that same positive integer a. These deductions specify the real normalization used in the same-lattice comparison.

Require `Δ=f²D` and the actual primitive/invertible ideal hypotheses; no number-
field theorem is applied to the split product order. Transport these identities
through IL B2/B3/B4's actual proper-form/ideal, unit and principal-genus maps,
retaining the square-subgroup index so B8 uses the number of proper classes in
ONE genus, not the full class number. The maximal-field case reuses native
`isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` with its actual
squarefree generator and prime-discriminant data; it is not a theorem about
every nonmaximal order. The nonmaximal comparison retains IL B3’s genuine
conductor-local/form-to-ideal genus construction, including dyadic conditions,
before transporting its square-subgroup count. Prove the density finite-set `S` and the
order-conductor exclusions agree by their explicit factors. The local `B` versus
`B/2`, O versus SO and real angular/logarithmic measure scalars are the separate
1.2/B7 compatibility theorem, not consequences of this Dirichlet endpoint.

In the square split case the normalized good product reduces to
`∏_(p≤N,p∉S)(1−1/p)⁻¹` and diverges to positive infinity. Prove divergence from
the finite Euler expansion dominating the harmonic sum after discarding a fixed
finite factor; do not apply nontrivial-character continuation. The modulus-one
idele quotient and the split order of conductor `f` remain IL B7's distinct
algebraic/measure targets. Rank0 and rank1 retain their elementary branches.
The nonsplit endpoint, the class-number/residue comparison, and the direct
positive binary mass are three separate outputs with explicit connecting maps.

The compulsory calibrations are A2: primitive polynomial `(1,−1,1)`,
`Δ=−3`, `h=1`, `w=6`, full mass `1/12`; and Gram `[[4,1],[1,6]]`:
polynomial content2, primitive `(2,1,3)`, `Δ=−23`, `h=3`, `w=2`, full genus
mass `3/4`. Prove those class counts by the complete reduced-form list and
retain the actual genus index `|Pic(O_Δ)[2]|`, so the positive binary full
mass is `h(Δ)/(2 w_Δ |Pic(O_Δ)[2]|)`. Positive polynomial content changes
preserve the properly transported automorphism/genus mass; integral bilinear
rescaling is not assumed. Indefinite branches use units/regulators/Haar,
not a finite automorphism cardinality. These calibrations test the general
adapter; they do not replace its proof.

*Needs:* §1.4a–b; IntegralLattices B2/B3/B4/B7/B8; ImaginaryQuadraticClassNumber H1.4/H2.2; ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”; native `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `riemannZeta_residue_one`, `NumberFieldOrder.card_narrowPic`, `TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator`, and GlobalNumberFields Layer 11 order extension/contraction and narrow-unit maps.

The API for the same-lattice order adapter is compatibility with the supplied extension/contraction on conductor-coprime invertible ideals, identity at f=1, composition for nested conductors, transport of the supplied kernel/image equalities, and compatibility with proper forms and conjugation. The regulator map sends a positive unit to its logarithm at the chosen real embedding and changes sign under conjugation before choosing the positive generator.

**Checks.**

- For D=−3 at conductor 1 the imported formula gives L(1,χ)=π/(3√3), while the same-genus mass is 1/(2·6)=1/12; an identification of the L-value with the mass would fail.
- For D=−3, f=2, the residue unit quotient has order 3, the global unit index is 3, and h(−12)=1; dividing by no unit index would incorrectly give 3.
- For D=5, the positive generator is ε², so h⁺R⁺=2R=2hR. For D=12 it is ε, so h⁺R⁺=2R=2hR with h⁺=2; identifying ordinary and narrow class numbers would fail.
- For Δ=−23 the reduced proper forms are (1,1,6), (2,−1,3), (2,1,3). The class group has order 3 and trivial 2-torsion, so the full mass is 3/(2·2·1)=3/4, although there are only two full classes.

### Examples

A₂ and the discriminant −23 genus test the binary character, order and mass together. The real discriminants 5 and 12 separate the two ordinary/narrow unit-index possibilities.

### Dependencies

Layer 0, IntegralLattices §§2C/2G/3/4B/7A/7C/7E and B1–B8, AdelicAlgebraicGroups AA.2, GeometryOfNumbersAndQuadraticArithmetic §3.3, GlobalNumberFields §§9/11, TauberianBoundaryConvergence N2/N3, ImaginaryQuadraticClassNumber H1.4/H2.2, ArithmeticStatisticsPartV “Siegel count of indefinite binary quadratic forms”, and the native analytic/arithmetic declarations named above.

## Layer 2: arbitrary dyadic integral models and densities

### 2.1 Smooth integral model

For a nondegenerate quadratic lattice over every unramified finite extension R/Z_2, construct Cho's smooth affine integral model from the actual IL3I Jordan data; construct its coordinate Hopf algebra, generic-fibre O(V,q) comparison and equality of R-points with O(L). Prove smoothness of relative dimension n(n−1)/2, the successive congruence kernels and their counts. Include rank zero separately (Cho v3, Theorem 3.7, p.15). The model's generic-fibre map has source 𝒢_L⊗Frac(R) and target O(V,Q), and its point comparison is an isomorphism on every étale R-algebra; it is natural in that algebra and in integral lattice isometries. This does not identify its special-fibre points with all points of the naive equation scheme.

The API is generic-fibre compatibility with multiplication and inverse, étale-point naturality, change of integral basis, and the smooth reduction maps and congruence-kernel cardinalities.

*Needs:* IntegralLattices §3I Jordan data and §7C stabilization; §0.1's orthogonal group schemes; the smooth affine model construction in Cho v3, §§2–3.

**Checks.**

- Rank zero gives the trivial smooth model with one residue point and relative dimension 0; the positive-rank density division by 2 is not applied.
- For ⟨1⟩ over ℤ₂ the smooth model has two 𝔽₂-points, whereas the naive equation x²=1 has one; equality of integral points is not equality of special fibres.
- Smooth reduction over a residue field of order f has successive kernels of size f^d, d=n(n−1)/2: rank one gives 1 and rank two over 𝔽₄ gives 4, not 2.

### 2.2 Special fibre and local density

Construct the special fibre, its unipotent radical and reductive quotient, the product of the specified reduced orthogonal factors and elementary abelian 2-component group. Consume from IL3I the Jordan splitting L=⊕L_i, parity types I/II, bound/free, t, b, c, d_i and N_M, N_Q, N=N_Q−N_M. Write q(x)=B(x,x) for Cho's norm, so q=2Q in the half-norm convention of this roadmap. For every integer i define the filtration lattice A_i={x∈L : B(x,L)⊆2^iR}; thus A_i=⊕_j 2^max(0,i−j)L_j. It has full rank, including when L_i=0, and is not a Jordan constituent (Cho v3, §2.3, p.5; Remark 2.8, p.6).

On A_i/2A_i let b_i be the reduction of 2^(−i)B and let X_i be the inverse image of its radical. Let B_i be the inverse image of the zero subspace of 2^(−i)q mod 2; this function is Frobenius-semilinear, and its zero set is a k-subspace. The nonsingular symmetric form induced on A_i/X_i determines a unique vector e_i by b_i(v,e_i)²=b_i(v,v); set e_i=0 when that form is alternating. Let W_i be the inverse image of k e_i in A_i. Let Y_i/2A_i be the radical of the restriction of b_i to B_i/2A_i. Finally let Z_i/2A_i be the quadratic radical of 2^(−i−1)q mod 2 on B_i/2A_i: vectors in its polar radical on which the quadratic form is zero. An isotropic cone alone is not this radical. These definitions give the induced regular quadratic space V̄_i=B_i/Z_i (Cho v3, §2.3 and Remark 2.6, pp.5–6; §4.1, p.16).

The filtration and auxiliary-lattice API is:

- A_(i+1)⊆A_i and 2A_i⊆A_(i+1), with the displayed Jordan expression identifying both inclusions; the construction uses the original B and does not change with a Jordan splitting;
- 2A_i⊆X_i⊆B_i⊆A_i, X_i⊆W_i⊆A_i, and 2A_i⊆Z_i⊆Y_i⊆B_i; the forms used in every quotient descend, and V̄_i has zero quadratic radical;
- integral lattice isometries send each of A_i, X_i, B_i, W_i, Y_i, Z_i to its counterpart, and induce isometries of V̄_i; finite unramified scalar extension commutes with these constructions and their residue-space dimensions;
- the dimensions of A_i/B_i, W_i/X_i and Y_i/Z_i are at most one, including alternating and absent-constituent cases; the uniqueness law for e_i and the quadratic-radical condition determine W_i and Z_i without a choice of basis.

**Checks.**

- For L=⟨1⟩⊕⟨2⟩ and i=0, A₀=L, X₀=B₀=Y₀=2R e₁⊕R e₂, W₀=L and Z₀=2L. On B₀/2L the residual q/2 has values 0,1, so dim(B₀/Z₀)=1; substituting the rank-one constituent L₀ gives dimension 0. At i=1, A₁=2R e₁⊕R e₂ and at i=2, A₂=4R e₁⊕2R e₂, testing both filtration inclusions.
- For a single free block with Gram matrix [[1,1],[1,2]], A₀=L, X₀=2L, B₀=W₀=Y₀=2R e₁⊕R e₂ and Z₀=2L. The residual q/2 on B₀/2L has values {0,1}, and dim(B₀/Z₀)=1 gives Iᵉ₁. Over 𝔽₄ its values are {t²:t∈𝔽₄}=𝔽₄; the kernel still has dimension 0, which tests semilinearity rather than 𝔽₄-linearity.
- For the free block [[1,1],[1,0]], A₀, X₀, B₀, W₀, Y₀ are as above but q/2 has values {0,0}, so Z₀=B₀ and dim(B₀/Z₀)=0 gives Iᵉ₂. Adjoining ⟨2⟩ makes either rank-two constituent bound; neither refinement is then assigned, regardless of the residual dimension.
- For the hyperbolic plane U, A₀=B₀=L, X₀=W₀=Y₀=Z₀=2L and q/2=xy. Its zero set in L/2L has three elements, whereas its quadratic radical has one; using the zero set as Z₀ would not even define a subspace. The quotient has dimension 2. For the zero lattice all six auxiliary lattices and V̄_i are zero, and all three bounded dimensions are 0.

Construct the finer type and special-fibre data:

- the refined types: I^o (type I, odd rank), I^e (type I, even rank), and, for a FREE constituent of type I^e only, I^e_1 when dim(B_i/Z_i) is odd and I^e_2 otherwise (Cho v3, the type assignment after Remark 2.6, p.6); no refined type is given to bound constituents, and the zero lattice counts as modular of parity type II (Cho v3, Definition 2.1(c), p.3);
- the residue quadratic spaces V̄_i = B_i/Z_i over the residue field k with the nonsingular form q̄_i induced by 2^(−i−1)q, the morphisms φ_i from the special fibre to O(V̄_i, q̄_i)_red (Cho v3, §4.1, pp.16–18), and their images by refined type and bound/free (Cho v3, Remark 4.3, p.18);
- Cho's component-group exponents: α = the number of free constituents of type I^e_1, and β = the number of j with L_j of type I and L_(j+2) of type II, the zero lattice included (Cho v3, Lemma 4.2, p.18). These are not the densities α_p and Cho's local density β_L, and the README never writes them under one symbol: write them α_Cho, β_Cho.

Prove that types, V̄_i up to isometry, α_Cho and β_Cho are independent of the Jordan splitting, and that the special fibre maps onto ∏_i O(V̄_i, q̄_i)_red × (ℤ/2)^(α_Cho+β_Cho) with connected unipotent kernel (Cho v3, Theorem 4.12, p.24).

The maps from 𝒢̃_L to the reduced orthogonal factors and component groups have the stated source and targets, are homomorphisms and are natural under lattice isometries. Their API includes image by refined type, surjectivity of the combined map, the connected unipotent kernel, and the multiplicative finite-point count. Prove the resulting density invariant under change of Jordan splitting and integral basis (Cho v3, Lemma 4.2 and Remark 4.3, p.18; Theorem 4.12, p.24; Lemma 5.1 and Theorem 5.2, pp.24–25).

*Needs:* §2.1; IntegralLattices §3I and §7C; ReductiveGroups Layers 5/7a for unipotent groups and ordinary Frobenius Lang surjectivity; quadratic residue-group comparisons from §0.1a and the finite-point orders of GeometryOfNumbersAndQuadraticArithmetic §3.3.7; Cho v3, Remark 2.6, p.6, for the auxiliary sublattices and refined types.

**Checks.**
- ⟨1⟩ over ℤ₂: one free I^o constituent at i=0 with O(V̄_0) trivial; L_2 is the zero lattice, of type II, so β_Cho=1 and #𝒢̃(𝔽₂)=2, giving α_2 = 2^(N−0)·2 = 4 with N=1. Omitting the zero-lattice convention gives β_Cho=0 and α_2=2, contradicting the direct count of x² ≡ 1 mod 2^r.
- ⟨2⟩ over ℤ₂: type I at i=1, L_3 zero, β_Cho=1, N=2, so α_2 = 2²·2 = 8, the count of 2x² ≡ 2 mod 2^r.
- U over ℤ₂: one free type II constituent of rank 2, image O(V̄_0) = O₂⁺(𝔽₂) of order 2, α_Cho=β_Cho=0, N=2, α_2 = 2^(2−1)·2 = 4. Taking the image to be the identity component SO(V̄_0), whose 𝔽₂-points are trivial, would give #𝒢̃(𝔽₂)=1 and α_2=2. Replacing the quadratic group by the polar stabilizer of order 6 would instead give α_2=12.

For the smooth connected unipotent kernel U over the finite residue field, construct its affine-space variety comparison from Cho v3, Lemma 4.2, p.18, and the proof of Theorem 4.12, p.24; deduce #U(k)=f^dim U. Use ordinary Frobenius Lang surjectivity from ReductiveGroups Layer 7a on this smooth connected kernel to lift rational quotient points and obtain the quotient finite-point count (Cho v3, Remark 5.3(i), p.25). Prove Cho's β_L=(1/2)f^(N−dim O)#𝒢̃_L(k) in positive rank and compare with the actual stabilized IL7C bilinear count; for R=ℤ₂ prove α₂=2β_L, retaining the type-II +c term in N (Cho v3, Theorem 5.2 and Remark 5.3(i), p.25). These targets cover every unramified R and every Jordan scale before specialization to rational lattices.

### 2.3 Numerical arbitrary-genus formula

For positive-definite integral L of rank n≥3, with D=det B>0 and S the primes dividing 2D, prove the explicit numerical formula

    m_full(gen L) = 2 pi^(-n(n+1)/4) (product_(j=1..n) Gamma(j/2))
                   D^((n+1)/2) (product_(p in S) beta_p^(-1)) E_S.

For n=2m+1 set E_S=∏_(i=1..m)ζ^(S)(2i). For n=2m set E_S=L^(S)(m,χ)∏_(i=1..m−1)ζ^(S)(2i), where χ is the primitive quadratic character of the signed determinant (−1)^mD, with the trivial character when that square class is trivial. At every p∉S the normalized density is ∏_(i=1..m)(1−p^(−2i)) in odd rank, and (1−χ(p)p^(−m))∏_(i=1..m−1)(1−p^(−2i)) in even rank. The superscript S deletes the indicated Euler factors, including those at 2. All products converge absolutely and are nonzero for n≥3; all bad factors are the stabilized densities, evaluated by IntegralLattices §7C at odd primes and §2.2 at 2 (Conway–Sloane, equations (2), (3), (6); Cho v3, Theorem 5.2, p.25).

For n=2 positive definite, replace E_S by the increasing-prime limit L^(S)(1,χ) of §1.4, with R₂=1/π; the signed determinant is negative and χ is nontrivial. The split indefinite binary case has a divergent Euler product and uses its separate norm-torus quotient, not this definite formula. Ranks 0 and 1 retain IntegralLattices §7G's values. No normalization is inferred from a test value.

*Needs:* §§1.2/1.3 for the measure and Jacobian identities; §1.4 for the binary endpoint; §2.2 and IntegralLattices §7C for all local factors; IntegralLattices §7E for the real factor.

**Checks.**

- A₂ has bad factors β₂=β₃=6 and gives 1/12 by the explicit substitution in §1.3.
- The discriminant −23 genus has β₂=2, β₂₃=46 and gives 3/4; using all three proper classes as full classes of weight 1/2 would give 3/2.
- E₈ has β₂=2⁸(1−2⁻⁴)∏_(i=1..3)(1−2^(−2i)) and gives 1/696729600; dropping the dyadic power gives a result 256 times too large.

### Examples

The unary dyadic factors 4 and 8, the hyperbolic-plane factor 4, and the E₈ factor test the same bilinear density normalization at different scales and ranks.

### Dependencies

IntegralLattices §§3I/7C/7E, §§0.1/0.1a algebraic and residue groups, GeometryOfNumbersAndQuadraticArithmetic §3.3.7, Layers 1 and 2.1–2.2. The integral-model construction uses local counts, never the global mass formula it will evaluate.

## Layer 3: even-unimodular specialization and exact arithmetic

### 3.1 The mass and Bernoulli product

Define `evenUnimodularClasses n` as the subset of `GramClass n` with a representative whose native lattice is even and unimodular. Define `evenUnimodularMass n` as the rational sum of reciprocal `classAutomorphismOrder` over this set. Transport IntegralLattices §§2G/7A's finiteness and mass to this presentation, so the displayed infinite sum is a finite sum and all denominators are nonzero.

The API is representative independence, equality with the native full genus mass when the one-genus theorem applies, invariance under integral isometry, and positivity for a nonempty class set. These properties are consequences of the native lattice comparison and the supplied mass theory.

*Needs:* §0.0; IntegralLattices §§2C/2G/3C/3E/5A/7A; Layer 2's arbitrary-genus formula.

**Checks.**

- In rank zero the empty matrix is even and unimodular and has weight 1, so the class set has one element and mass 1.
- In rank one [1] is unimodular but odd, and [2] is even but not unimodular; neither belongs to the even-unimodular set.
- E₈ belongs to the rank-eight set with weight 1/696729600, whereas the identity matrix I₈ is odd and is excluded even though its determinant is 1.

For n=2m>0 divisible by8 prove all positive even unimodular rank-n lattices belong to the single genus, using the real signature and the odd/dyadic local classifications (IL3/5A). Apply1–2 to that genus; prove the rational full O-mass is

 M_(2m)=|B_m/(2m)| product_(j=1..m-1)|B_(2j)/(4j)|.

Here t/(exp(t)-1)=sum B_k t^k/k!, B_1=-1/2, and all displayed Bernoulli indices are even. Derive this identity from the normalized local and real factors; it is not the odd-unimodular formula. A second check uses the Belolipetsky–Gan proper-SO formula: for even unimodular rational lattices, the local correction lambda2=1, whereas the article's §6 odd-lattice correction is not used. Compare proper mass to full O mass by IL7A, giving exactly a factor2, including classes that split into two proper classes. Rank8 must yield1/696729600. Rank0 is not obtained by this formula.

The headline `evenUnimodularMass_eq` says that for every n>0 divisible by eight, `evenUnimodularMass n = bernoulliFullMass (n / 2)`. Here `bernoulliFullMass m` is the rational absolute-value product displayed above, defined for every natural m; the theorem does not claim a mass interpretation outside its rank hypotheses (Belolipetsky–Gan v2, Theorem 3.1, p.4, and §5, p.11; Conway–Sloane, §9(iv), p.274).

The API of this product is its expression as a finite rational product, positivity when m is positive and divisible by four, and the evaluations needed in Layer 4. The lattice-to-product theorem requires the one-genus and all local/real normalization comparisons.

**Checks.**

- At m=0 totalized rational division gives `bernoulliFullMass 0 = 0`; it is not the rank-zero mass 1.
- At m=4 the product is (1/240)(1/24)(1/240)(1/504)=1/696729600.
- At m=8 the product is 691/277667181515243520000; using proper mass doubles it and would contradict the full reciprocal weights of §4.1.

### 3.2 Exact Bernoulli evaluations

The Bernoulli numbers are Mathlib's `bernoulli : ℕ → ℚ`, with `bernoulli_one : bernoulli 1 = -1/2`; the recurrence sum_(j=0)^k binom(k+1,j)B_j=0 for k≥1 is Mathlib's `sum_bernoulli` at n=k+1, and the generating function t/(exp(t)−1) is Mathlib's `bernoulliPowerSeries_mul_exp_sub_one`. None of these is constructed again. The new work is the evaluation: compute B_2,B_4,…,B_38 from `sum_bernoulli` in ℚ, prove each value as an equality of `bernoulli k` with an explicit rational, and evaluate M8,M16,M24,M32,M40 from them by exact rational arithmetic. Check: the recurrence at k=1 reads B_0+2B_1=0, forcing B_1=−1/2, which `bernoulli` satisfies and Mathlib's `bernoulli'` (with B_1=+1/2) does not; since m=n/2 is even and every index in M_(2m) is even, both conventions give the same masses, so only the recurrence detects a wrong choice. Check: `bernoulli 4 = -1/30`, and M8=|B_4/8|·|B_2/4|·|B_4/8|·|B_6/12| = (1/240)(1/24)(1/240)(1/504) = 1/696729600.

*Needs:* Mathlib `sum_bernoulli`, `bernoulli_one` and rational arithmetic; §3.1's product definition. The native generating function fixes the convention; no new Bernoulli carrier is constructed.

**Checks.**

- The recurrence for k=1 gives 1+2(−1/2)=0; choosing +1/2 instead gives 2.
- Rank 24 needs B₂₂, rank 32 needs B₃₀, and rank 40 needs B₃₈, because the largest index is 2(m−1); stopping at B₂₀ misses all three.
- B₃₈=2929993913841559/6 is included, and the exact products give 80618465<2M₃₂<80618466 and 8·10⁵¹<2M₄₀<9·10⁵¹.

### Examples

The rank-eight mass is the reciprocal E₈ order, and the rank-16 mass is the reciprocal sum of the two distinct reference classes. Rank zero is the separate empty-lattice case.

### Dependencies

IntegralLattices §§2C/2G/3C/3E/5A/7A, Layers 0–2, and Mathlib's Bernoulli recurrence and zeta special values used to convert the mass product.

## Layer 4: automorphism orders and class counts

### 4.1 Automorphism bounds and the rank-16 classification

For a positive rational Gram matrix G on ℤⁿ, prove the existence of c∈ℚ with c>0 and c∑xᵢ²≤xᵀGx for every rational vector x. Each column j of a form-preserving integral matrix then satisfies |aᵢⱼ|²≤Gⱼⱼ/c. Prove that AᵀGA=G forces det A=±1 and identifies exactly the native lattice automorphisms, compatibly with integral basis change. Deduce coercivity by transporting rational positivity to the real form using IntegralLattices §0E. In positive rank the real unit sphere is nonempty and compact; its continuous quadratic form has a positive minimum μ by Mathlib `IsCompact.exists_isMinOn`. Choose a rational 0<c<μ using `exists_rat_btwn`, then scale nonzero vectors to that sphere; the zero vector gives 0≤0. In rank zero take c=1 directly, without minimizing over the empty sphere. The determinant assertion follows from (det A)² det G=det G with det G≠0, and the integral isometry comparison is §0.0. These are boundedness and isometry comparisons; no enumeration procedure is a deliverable.

For the two reference classes of IntegralLattices §6D, prove the full automorphism orders 2·696729600² and 2¹⁵·16!, using root actions and stabilizers of the actual glue subgroup. The first uses the two E₈ components and their interchange; the second uses the D₁₆ roots and the stabilizer of the chosen spinor glue class. Their reciprocal sum is 691/277667181515243520000. Transport IntegralLattices §9B's completeness implication to the Gram quotient and apply §3.1's mass value to prove `rank16_classNumber`: `Nat.card (evenUnimodularClasses 16) = 2`. The automorphism orders are deductions from RootSystems Layers 5–6 and IntegralLattices §§6D/6G: root permutations give W(E₈)≀S₂ in the first case, while the D₁₆ spinor-glue stabilizer is the even-sign subgroup of signed permutations. The classification also has the independent locator Chenevier–Lannes v2, Chapter II, Corollary 3.6, p.41; the mass-exhaustion route here uses §§3.1/3.2 and IntegralLattices §9B. Rank-eight uniqueness belongs to IntegralLattices §6C.

*Needs:* §0.0's Gram/native comparison; IntegralLattices §§0E/2C/2G/6C/6D/6G/9B; Mathlib `IsCompact.exists_isMinOn` and `exists_rat_btwn`; RootSystems Layers 5–6; §3.1.

**Checks.**

- For G=diag(1,2), c=1 works and the automorphisms are the four diagonal sign matrices; a determinant-one restriction would count only two.
- In rank zero the empty matrix is the single automorphism; −id=id, so the positive-rank bound of §4.3 cannot be used.
- The two rank-16 orders are 970864271032320000 and 685597979049984000; their reciprocal sum equals the stated mass exactly, while retaining just one gives a strictly smaller sum.

### 4.2 Rank-24 classification

For all twenty-four actual Gram/glue lattices and their nonisomorphism proofs from IntegralLattices §6E, prove the full automorphism orders and that their reciprocal sum equals the rank-24 mass. A proof route for a lattice with roots is the action on its root lattice, Weyl subgroup and glue stabilizer, including the kernel and image of that action. For the rootless Leech lattice use the action on its minimal vectors and the supplied lattice construction; an empty root system cannot determine its automorphisms. Apply IntegralLattices §9B to obtain `rank24_classNumber`: `Nat.card (evenUnimodularClasses 24) = 24`, and deduce uniqueness of the rootless class (Chenevier–Lannes v2, Chapter II, Theorems 3.16–3.17, p.48). The order targets are specified by Borcherds, “Tables of lattices”, norm-zero table: for each of the 23 root-system entries its recorded finite factor is |O(L)/W(R(L))|, to be multiplied by the Weyl order, while the rootless entry gives the full Leech order 8315553613086720000. Prove these factors from the actual glue/minimal-vector actions, then verify the exact reciprocal sum; the table is a locator for the values, not a hypothesis asserting them.

*Needs:* IntegralLattices §§2C/2G/6E/9B; RootSystems Layers 5–6; §§0.0/3.1/4.1 for Gram transport and mass.

**Checks.**

- The Leech root count is 0 but its minimal-vector count is 196560; the empty-root permutation group has order 1 and cannot be its full automorphism group.
- The full Leech automorphism order is 8315553613086720000, giving reciprocal contribution 1/8315553613086720000; quotienting by {±1} would double this contribution.
- Twenty-four distinct classes are required: repeating any one representative violates injectivity even if a numerical list still has length 24.

### 4.3 Class-count lower bounds

In positive rank, −id≠id, so every full automorphism group has order at least two. For the finite class set, prove 2Mₙ≤hₙ. Use the exact Bernoulli recurrence through index 38 and §3.1 to obtain `rank32_classNumber_lower_bound`, `10 ^ 7 < Nat.card (evenUnimodularClasses 32)`, and `rank40_classNumber_lower_bound`, `10 ^ 51 < Nat.card (evenUnimodularClasses 40)`. These are deductions from §3.1 and the exact evaluations in §3.2: 80618465<2M₃₂<80618466 and 8·10⁵¹<2M₄₀<9·10⁵¹, together with 2Mₙ≤hₙ; no classification table is an input to these lower bounds.

*Needs:* IntegralLattices §§2C/2G; §§0.0/3.1 and the exact Bernoulli evaluations of §3.2.

**Checks.**

- The rank-zero mass and class number are both 1, so 2M≤h would read 2≤1; positive rank is essential.
- Exact rational evaluation gives 80618465 < 2M₃₂ < 80618466, hence the strict bound 10⁷.
- Exact rational evaluation gives 8·10⁵¹ < 2M₄₀ < 9·10⁵¹, hence the strict bound 10⁵¹.

### Examples

The two rank-16 reciprocal contributions exhaust the mass; the rank-32 and rank-40 masses force large numbers of classes without listing them.

### Dependencies

IntegralLattices §§2C/2G/6C–6E/9B, RootSystems, and Layers 0/3. The exhaustion implication takes this roadmap's mass evaluation as an input and is never used to prove that evaluation.

## Downstream consumers

IntegralLattices §§7H/7I and §9B consume the mass values and unconditional classifications. Lattice-count applications consume the rank-32/40 lower bounds. The approximation branch supplies the higher-rank Eichler application independently of the positive-definite mass branch.

## References

- Sungmun Cho, [Group schemes and local densities of quadratic lattices in residue characteristic2](https://arxiv.org/abs/1210.7625v3), for smooth integral models and local densities over unramified dyadic extensions.
- M. Belolipetsky and W. T. Gan, [The mass of unimodular lattices](https://arxiv.org/abs/math/0307195v2), for the parahoric/proper-SO mass comparison; retain the even-versus-odd normalization in §2, p.3, and Theorem 3.1, p.4; even unimodular correction in §5, p.11.
- The IntegralLattices, OrthogonalSpinGroups and linked adelic/orthogonal-value specifications above, at their actual coefficient, rank and gauge hypotheses.
- J. S. Milne, [Algebraic Groups, corrected 2022 version](https://www.jmilne.org/math/Books/iAG2022.pdf), §24i, pp.535–537, for the Clifford construction and simply connected Spin cover.
- J. H. Conway and N. J. A. Sloane, *Low-dimensional lattices. IV. The mass formula*, Proc. Roy. Soc. London A 419 (1988), 259–286, DOI [10.1098/rspa.1988.0107](https://doi.org/10.1098/rspa.1988.0107), equations (2), (3), (6) and §9. Equations (2)–(3), p.263, equation (6), p.266, §9(iv), p.274, and §12, p.281, specify the mass and density conventions; an [author-hosted scan](https://neilsloane.com/doc/Me150.pdf) supplies this text.
- O. T. O’Meara, *Introduction to Quadratic Forms* (1963), 104:4–5, for strong approximation and Eichler's theorem; source text uncertified.

- G. Chenevier and J. Lannes, [Formes automorphes et voisins de Kneser des réseaux de Niemeier, arXiv v2](https://arxiv.org/abs/1409.7616v2), Chapter II, Corollary 3.6, p.41, and Theorems 3.16–3.17, p.48. These are the locators of the cited preprint version.
- R. Borcherds, [Tables of lattices, norm-zero table](https://math.berkeley.edu/~reb/lattices/0), the 23 root-system entries and the rootless entry, for the finite automorphism factors and Leech order; the [table index](https://math.berkeley.edu/~reb/lattices/index.html) identifies the Niemeier correspondence.
