# Roadmap: quadratic and symmetric arithmetic at dyadic primes

**Summary.** Develop quadratic and symmetric arithmetic at dyadic primes over general Dedekind domains. Starting from the integral form and Poincaré theories of GeometryOfNumbersAndQuadraticArithmetic and HermitianKTheoryOfPoincareCategories, and the Dedekind L-group tables of ArithmeticKTheory, construct explicit residue and Arf coordinates, prove arithmetic fracture and integral quadratic rigidity, and identify the total-cokernel obstruction. The endpoints are its parity quotient, the integral dyadic comparison, and the symmetric and quadratic L-groups of the Eisenstein integers. Explicit Witt arithmetic over ℚ₂ supplies the input to Layer 5. The quadratic Eisenstein groups in degrees 0, 1, 2, 3 modulo four are 0, 0, ℤ/2, ℤ/4. Characteristic two, ramified dyadic primes and infinite residue fields enter the general theory with their own hypotheses.

## Scope and ownership

GeometryOfNumbersAndQuadraticArithmetic stops at exact-category hermitian K-theory, the derived Poincaré foundations, Dedekind localization, and integral L-theory comparisons in Layer 6, especially §§6.8a–6.11. This Part II develops their dyadic arithmetic consequences. Polynomial lattices over Laurent-series fields and joinings on adelic toral quotients are separate mathematical directions; neither is an input to this build.

The following constructions and theorems are owned elsewhere and are imported with their maps:

- Mathlib owns quadratic maps, their full polar bilinear maps, isometry equivalence, ideal-adic completion, ideal Chinese remainders and additive quotients. Its cyclotomic arithmetic supplies the Eisenstein ring of integers, PID property, units and the ramification and residue degrees at two; §5.1 uses these to identify the completion. Tau Ceti owns the field Witt ring, Scharlau transfer, local classification and the ℚ₂ Hilbert formula. The specific three-generator presentation and its ideal calculation here extend those results by explicit arithmetic coordinates.
- GeometryOfNumbersAndQuadraticArithmetic §§6.2–6.5 owns exact symmetric spaces and their metabolic Witt quotient; §§6.8a–6.9 owns derived coefficients, Poincaré structures, L-spectra, residue lines and localization. HermitianKTheoryOfPoincareCategories §§3.4, 4.5–4.6, 6.6 and 7.9 owns the quadratic Witt carrier, surgery comparisons, controlled variants and field L-computations. Its 𝔽₂ Arf isomorphism is imported; §0.4 here adds the absolute-trace coordinate over every finite characteristic-two field and its extension-degree law.
- ArithmeticKTheory §3.5 owns the characteristic-not-two quadratic-to-symmetric Witt injection, the general Dedekind symmetric and quadratic four-periodic tables, their degree-three exact extension, and the global residue cokernel Pic(R)/2. The Dedekind localization–completion square used there is supplied with its maps. These results are not separate targets here. Their characteristic-two continuation, explicit local maps, concrete two-image quotient and arithmetic examples are developed below.
- GeometryOfNumbersAndQuadraticArithmetic §6.10a owns both integer L-tables, the signature and signature-divided-by-eight normalizations, and multiplication by eight under symmetrization. The integral Witt groups in §4.2 and the integer tables among the examples are supplied consequences, not new classifications. The new E₈ calculation is its actual quadratic refinement modulo two.
- QuadraticFormInvariants Layers 4, 6 and 9 owns field Witt theory in characteristic different from two, nonarchimedean classification, Hilbert symbols and transfer. GlobalQuadraticForms §§8.1–8.3 owns number-field Hasse–Minkowski, classification and global Witt injectivity. No global-function-field theorem is inferred from its number-field scope.
- Completed/IntegralLattices Layers 1–5 and IntegralLattices milestones 1I and 1L own the integral lattice, dual, unimodularity, evenness and E₈. KTheoryFiniteLocalFields §1.7 owns the perfect-characteristic-two symmetric comparison; its symmetric rank coordinate is distinct from the quadratic Arf coordinate.
- SchemeAndStackFoundations §§0.12–0.15 and 0.21 owns henselizations of pairs, henselian lifting, Néron–Popescu and G-rings; the regularity of ideal-adic completions of G-rings and of their henselizations is requested from its §0.21 as a supplier contract. GeneralAlgebraicKTheory §§11.3–11.4 and 11.15 owns dense triangulated subcategories and ordinary nonconnective localization. Homotopy groups, fibres, cofibres, long exact sequences and detection of equivalences in the shared spectrum category carrying the L-spectra are GeometryOfNumbersAndQuadraticArithmetic §6.1a's. These generic theories are consumed, not reconstructed.

## Conventions

R is a commutative Dedekind domain with fraction field K unless a statement explicitly treats an associative ring with anti-structure. Nonzero primes are height-one primes. Fields are permitted as Dedekind domains and then have no nonzero primes. A finite projective module need not be free. All categories are made small by a skeleton in a fixed universe; scalar extension may enlarge the universe. All coefficient modules and duals use that same choice.

A quadratic form q has full polar b(x,y)=q(x+y)−q(x)−q(y). Nonsingularity means the adjoint P→Hom_R(P,R) of b is an isomorphism. For symmetric forms the same condition is imposed on the pairing itself. Nonzero determinant is insufficient over a ring. A Lagrangian is a direct summand equal to its perpendicular; the quadratic form must also vanish on it. Ws(R) and Wq(R) are the corresponding metabolic Witt groups. Their rank-zero representatives are zero, with perfect adjoint 0→0. The zero ring has only the zero module and both theories vanish. Over a field of characteristic two a nonzero square on a line has zero polar and is excluded.

Ls and Lq denote positive-sign periodic symmetric and quadratic Poincaré L-spectra; L_n=π_n for n∈ℤ. Genuine symmetric theory is denoted Lgs and is kept distinct. The negative-sign theory is Σ² of the positive-sign theory: its degree n is positive degree n−2. Four-periodicity also identifies n−2 with n+2, but suspension itself uses subtraction. In characteristic two the sign involutions coincide, giving the specified two-periodic theories. The homotopy pullback of A→D←B uses the difference map A⊕B→D, (a,b)↦f(a)−g(b); for f=g=id on ℤ it sends (1,1) to 0 and (2,1) to +1. (CDHHLMNNS-III-v4, Remarks 2.3.3 and 2.3.11, pp.42 and 45; lines 1933 and 2097; GeometryOfNumbersAndQuadraticArithmetic §6.1a.)

For a nonzero prime p, the unshifted residue line is lₚ=p⁻¹/R after localization at p. Its derived coefficient has shift −1. A uniformizer trivializes the line only for a displayed residue coordinate. The second residue uses bilinear diagonal coefficients: ∂ₚ⟨πu⟩=⟨ū⟩. A change π′=vπ changes the displayed Witt coefficient by v̄⁻¹ up to squares. Canonical line-valued maps are independent of this choice; ramified base change retains its linking comparison. Direct sums over primes always mean finite support. (CDHHLMNNS-III-v4, Lemma 2.2.2 and Lemma 2.2.9, pp.37 and 40; line 1840.)

When char K≠2, I is the finite set of primes containing two, d=|I|, and C is the ordinary (2)-adic completion. No finiteness or perfection is imposed on a residue field unless stated. For a general ring, comparison of ordinary and derived completion is an explicit hypothesis; a Dedekind domain of fraction characteristic different from two is two-torsion-free. Pic(R)/2 is a cokernel, not the subgroup of two-torsion. The obstruction A(R) is a quotient by the sum of two images. An exact extension involving it is not given a splitting. (CDHHLMNNS-III-v4, Proposition 2.3.9, pp.44–45; line 2044.)

In characteristic two the Arf coordinate over a finite field is the absolute trace to 𝔽₂. In characteristic different from two, symmetric diagonal coefficients are read as the same diagonal coefficients in the native field Witt ring. This is a unital tensor-ring identification B↦(x↦B(x,x)); the inverse of polarisation instead uses B(x,x)/2 and is an additive comparison. These two comparisons differ by the line ⟨2⟩. For an n-dimensional bilinear form, plain determinant is det B and signed determinant is (−1)^(n(n−1)/2)det B modulo squares. Over a local field the Hasse invariant of a diagonal form ⟨a₁,…,aₙ⟩ is the product Π_(i<j)(aᵢ,aⱼ) of Hilbert symbols, which is +1 in ranks zero and one. Adding a hyperbolic plane to a form of determinant d multiplies it by (d,−1), so Witt classes are compared through rank, determinant and Hasse invariant only after stabilizing to equal dimension. E₈ has positive Gram matrix, roots of norm two, and quadratic refinement q(x)=B(x,x)/2.

## Exact supplier contracts

### From Mathlib

Use `QuadraticMap`, `QuadraticMap.polarBilin`, `QuadraticMap.proj`, `QuadraticMap.weightedSumSquares`, `QuadraticMap.Anisotropic` and `QuadraticMap.Equivalent` from `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` and `IsometryEquiv.lean`. A quadratic map supplies homogeneity and a bilinear companion; it supplies neither finite projectivity nor a perfect polar map. In characteristic two the polar API is used directly. The general `QuadraticForm.baseChange` in `TensorProduct.lean` requires two invertible, so it is not an integral dyadic scalar-extension construction. For §0.4 use `QuadraticMap.prod` in `Mathlib/LinearAlgebra/QuadraticForm/Prod.lean` for orthogonal sums and `Algebra.trace` in `Mathlib/RingTheory/Trace/Defs.lean` for absolute trace; `Module.Basis`, `Submodule` and `Module.finrank` express the bases and half dimension.

Use `AdicCompletion` and `AdicCompletion.of` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`, and its ring/algebra structure in `Algebra.lean`. Its definition is a compatible inverse-limit subtype; completeness needs the finitely generated ideal hypothesis. Here ideals are finitely generated. Use `Ideal.quotientMulEquivQuotientProd` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` for coprime ideals, including their powers. Use `IsDedekindDomain.HeightOneSpectrum` for prime indices and `Padic` for ℚ₂. Use `AddMonoidHom.range`, `QuotientAddGroup.mk'` and the quotient by an `AddSubgroup` for the obstruction's algebraic quotient. These imports supply no arithmetic identification of that quotient. For the characteristic-two divisor argument use ideal factorization and `ClassGroup.mk0_surjective`, `ClassGroup.mk_eq_one_iff` in `Mathlib/RingTheory/ClassGroup/Basic.lean`, with `ClassGroup.equivPic` in `Mathlib/RingTheory/PicardGroup.lean`: invertible fractional ideals modulo principal ideals give the divisor-class quotient in every Dedekind characteristic.

For the Eisenstein arithmetic consume `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton_of_prime` in `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:126`, `IsCyclotomicExtension.Rat.three_pid` in `Cyclotomic/PID.lean:34`, and `IsCyclotomicExtension.Rat.Three.Units.mem` in `Cyclotomic/Three.lean:50`. For a prime above two use `IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd` and `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd` in `Cyclotomic/Ideal.lean:291,311`, specialized to conductor three: orderOf(2 mod 3)=2 and the ramification index is one. Together with `ClassGroup.equivPic` these supply Pic(R)=0. The unit list gives μ₆ with square-class representatives ±1.

### From Tau Ceti

Consume `TauCeti.WittRing`, `TauCeti.wittClass`, `TauCeti.regularFormSetoid`, and `TauCeti.WittRing.dimMod2` from `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean` and its imports. The carrier requires a field with two invertible. Its unit is ⟨1⟩ and its relations kill hyperbolic planes. It cannot serve as a ring-valued integral Witt group or a characteristic-two quadratic Witt group. Consume `TauCeti.oneFoldPfisterClass` from `Witt/FundamentalIdeal.lean`, the class ⟨⟨a⟩⟩=⟨1,−a⟩ of a unit a; thus v=⟨1,−2⟩ is ⟨⟨2⟩⟩ and c=⟨1,3⟩ is ⟨⟨−3⟩⟩. For ℚ₂ the invertibility of two is Mathlib's instance `invertibleTwo` for division semirings of characteristic zero (`Algebra/CharP/Invertible.lean`). Scalar extension is `TauCeti.WittRing.baseChange` in `Witt/BaseChange.lean`. Transfer and Frobenius reciprocity are `TauCeti.WittRing.scharlauTransfer` and `TauCeti.WittRing.scharlauTransfer_baseChange_mul` in `Transfer/Witt.lean`, for a finite field extension and a nonzero linear functional. The functional in §5.5 is specified on a basis.

Consume `TauCeti.hilbertSymbol_padicTwo` in `TauCeti/NumberTheory/LocalField/QuadraticForm/PadicTwo.lean`, and `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` in `Classification.lean`, with its field, nonarchimedean local topology, valuation and invertibility hypotheses. Its Hasse invariant is `TauCeti.RegularFormClass.localHasse` in `Hasse.lean`, the product Π_(i<j)(aᵢ,aⱼ) of the Conventions. In the formula a=2^αu, b=2^βv, the exponent is ε(u)ε(v)+αω(v)+βω(u) modulo two, where ε(u)=(u−1)/2 and ω(u)=(u²−1)/8 modulo two. Thus (−1,−1)₂=−1 and (2,5)₂=−1; (−1,2)₂=+1.

Consume `IsDedekindDomain.HeightOneSpectrum.isAdicComplete_adicCompletionIntegers` and `IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletionIntegers` in `TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean`. They supply complete DVR integers and the canonical residue-field equivalence for an arbitrary Dedekind domain and its fraction field. They do not require a finite residue field. The native `TauCeti.IntegralLattice` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` supplies the rational ambient lattice and integral symmetric form used with the E₈ supplier.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §6.1a's shared spectrum category, in which the L-spectra live, with its integer homotopy groups, fibres, cofibres, their long exact sequences and detection of equivalences by all integer homotopy groups; §§6.2–6.5's symmetric spaces and metabolic Witt group; §6.8a's perfect derived enhancement, invertible coefficients with involution, quadratic/symmetric/genuine Poincaré structures, stable GW and L, localizing invariance and filtered-colimit compatibility; §§6.8a–6.9's canonical residue line, shifted torsion duality and symmetric dévissage; and §6.10a's integral invariant maps and L-tables. Section 6.9.2 supplies the valuation-defined overring R_S even when no single element can invert exactly S. Section 6.9.3's GW localization is combined with §6.8a's L-localization and symmetric heart dévissage, preserving the residue shift.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:derived-localization-completion-square): for an associative unital ring R and a positive integer ℓ with bounded ℓ-power torsion in R, ordinary ℓ-adic completion C represents derived completion and the square R→C over R[1/ℓ]→C[1/ℓ] is a pullback in D(R).

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:poincare-change-of-rings-criterion): for a homomorphism f:R→B of discrete rings, invertible coefficient bimodules M,N with involution, an involution-compatible f⊗f-linear map α:M→N, a multiplicative subset S⊂R, and m∈ℤ∪{±∞}, for every involution-stable subgroup c⊂K₀(R) the square with the saturated control c̄ and its image controls from CDHHLMNNS-II-v5 §4.5 is Poincaré–Verdier if B⊗_R M→N is an isomorphism, S is compatible with M, R/s→B/f(s) is an equivalence in D(R) for every s∈S (cofibers of right multiplication), (R,S) and (B,f(S)) satisfy the left Ore condition, and the boundary Ĥ^(−m)(C₂;N[f(S)⁻¹])→Ĥ^(−m+1)(C₂;M) vanishes (vacuous for m=±∞), as in CDHHLMNNS-II-v5 Proposition 4.5.5, pp.108–110, lines 5253–5274.

### From TauCetiRoadmap.HermitianKTheoryOfPoincareCategories

Consume §3.4's classical Witt quotient on the genuine Poincaré carriers, §§4.5–4.6's quadratic degree-zero and controlled surgery comparisons, §6.6's symmetric Dedekind degree-zero description, and §7.9's field computations. Over every field of characteristic different from two the positive-sign periodic groups are W(K),0,0,0. Over every characteristic-two field the odd symmetric groups vanish and the even ones are Ws(K). Section 7.9 supplies the 𝔽₂ Arf isomorphism, with xy representing zero and x²+xy+y² representing one. Consume §1.6's `bordism_invariant_periodicity` for the coefficient sign comparison and periodicity. The commutative-ring polarisation map uses the supplied quadratic and symmetric carriers; only the quadratic degree-zero identification is unconditional on the ring. Symmetric periodic L₀ is identified with Ws(R) here under the Dedekind hypotheses.

### From TauCetiRoadmap.ArithmeticKTheory

Consume §3.5's injectivity Wq(R)→Ws(R) for every Dedekind domain with char K≠2, and its Dedekind tables, including actual localization maps and the completion comparison square. For every integer degree, the symmetric residues modulo four are Ws(R), ⊕_(p∈I)Ws(kₚ), 0, coker ∂₀. The quadratic residues zero, one and two are Wq(R), 0, ⊕_(p∈I)Wq(kₚ); residue three fits 0→A(R)→Lq₃(R)→Ls₃(R)→0, with A the total cokernel. The extension is retained with its injection and quotient map. In global fraction characteristic different from two, coker ∂₀=Pic(R)/2. Global fields include number fields and finite extensions of finite rational function fields; this contract includes kernel exactness of the residue-to-Picard map. For number fields the residue fields are finite. The number-field specializations and explicit quotient description below refine these maps rather than introduce new tables. Consume §§1.1–1.3's number-field localization, finite localized Picard groups and Steinitz comparisons; §2.2's divisor comparison has residue generator sent to the inverse ideal class. Modulo two this inverse sign agrees with the usual divisor class.

### From TauCetiRoadmap.QuadraticFormInvariants

Consume Layers 4 and 6's field Witt tensor/base-change theory, square classes, local invariants and classification over every finite extension of ℚ₂. Consume Layer 9's Scharlau transfer and projection formula. For symmetric diagonal coefficients the comparison in Conventions is used, including (−1,−1)₂=−1. The special explicit ℚ₂ presentation below is not an additional field classification.

What QuadraticFormInvariants must provide (gap:quadratic-extension-witt-exactness): for a field F with char F≠2 and a nonsquare a∈F×, restriction to E=F(√a), transfer for a nonzero F-linear functional s:E→F with s(1)=0, and multiplication by ⟨1,−a⟩ form an exact cyclic sequence, identifying the restriction kernel with that principal ideal and its cokernel with that element's annihilator.

### From TauCetiRoadmap.GlobalQuadraticForms

Consume §§8.1–8.3's number-field classification, hyperbolicity criterion and global-to-local Witt injection, together with the local invariant compatibility of §§2–4 and the Hilbert product formula of §4.4. Use them only over number fields. The rank-zero form is adjoined separately to the positive-rank classification. The Eisenstein proof has no real places and uses the product of local Hilbert signs; a rank-one unit has Hasse invariant +1.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Consume §1.7's symmetric perfect-characteristic-two equivalence and its rank-parity normalization: Ws(k)=ℤ/2 for every perfect characteristic-two field k. In particular 𝔽₂→𝔽₄ sends the symmetric unit class to the symmetric unit class. This supplies no quadratic Arf scalar-extension law and no integral dyadic quadratic rigidity theorem.

### From the lattice, commutative-algebra and K-theory suppliers

Completed/IntegralLattices §§1–2 and Layer 5 supplies the even unimodular positive E₈ Gram model and its half-norm convention; IntegralLattices milestones 1I and 1L supply the signature-divisibility theorem. SchemeAndStackFoundations §§0.12–0.13 supplies the henselization of a pair, its Noetherianity for a Noetherian base and the identifications R^h/(I^h)^n=R/I^n; §0.14 supplies henselian smooth lifting; §0.15 supplies ind-smoothness for regular maps of Noetherian rings; §0.21 supplies regular maps and G-rings, with ℤ and its finite-type algebras excellent, and regularity of the completion of a local G-ring. It does not state regularity of the ideal-adic completion of a nonlocal G-ring or the G-ring property of a henselization along an ideal; these are the contract below. GeneralAlgebraicKTheory §§11.3–11.4 and 11.15 supplies the dense K₀-image criterion and ordinary nonconnective localization. None of these imports identifies a K₀-image subcategory with all perfect complexes without a surjectivity argument.

What SchemeAndStackFoundations must provide (gap:henselian-pair-completion-regular): for a Noetherian G-ring A and an ideal I⊆A, the map A→AdicCompletion I A is a regular ring map, and the henselization of the pair (A,I) is again a Noetherian G-ring (Stacks, Lemmas 15.51.14 and 15.51.15, tags 0AH2 and 0AH3).

## How to read the build

Layer 0 fixes the arithmetic maps on the supplied forms, then Layer 1 treats the characteristic-two global continuation and the residue diagrams underlying the supplied characteristic-not-two tables. Layer 2 proves the completion decomposition and the general fracture, lifting and rigidity theorems. Layer 3 expresses the supplied degree-three extension by an actual quotient, proves its parity obstruction and establishes nondyadic quadratic dévissage. Layer 4 derives the ℚ₂ presentation and the two integral comparisons. Layer 5 computes the Eisenstein images and the corrected obstruction. The routes explain the stated dependency choices; the targets are the mathematical statements and their maps. Examples retain the integer tables as supplied comparisons and separate symmetric rank parity from quadratic Arf trace.

## Layer 0: integral forms and residue coordinates

### 0.1 Integral Witt comparison

On the supplied classical Witt groups of a commutative ring, construct the comparison induced by the native full polar map, σ:Wq(R)→Ws(R). It carries a finite projective nonsingular quadratic form to its perfect symmetric polar form. Isometries, orthogonal sums and quadratic Lagrangians descend through this map. If two is a unit, prove σ is an additive isomorphism with inverse b↦(x↦b(x,x)/2). Use the supplier's identification Lq₀(R)=Wq(R); identify Ls₀(R)=Ws(R) under the Dedekind hypotheses, using symmetric surgery. This last identification has a separate ring hypothesis from the construction of σ.

The comparison σ is the degree-zero map of the symmetrization norm in GeometryOfNumbersAndQuadraticArithmetic §6.8a, read through HermitianKTheoryOfPoincareCategories §§3.4, 4.5 and 6.6. Its inverse when two is a unit follows from b(x+y,x+y)−b(x,x)−b(y,y)=2b(x,y) and b_q(x,x)=2q(x). The L₀ identifications use CDHHLMNNS-III-v4, proof of Proposition 2.3.1, p.41, line 1896, and proof of Proposition 2.3.9, p.44, line 2050, with the separate hypotheses stated above.

The defining map has the following API.

- For finite projective forms with perfect polar, polarisation commutes with isometries and scalar extension, using actual tensor-product maps.
- Orthogonal sums map to orthogonal sums and the zero class maps to zero.
- A direct-summand quadratic Lagrangian is a symmetric Lagrangian, so the map descends to metabolic quotients.
- When two is invertible, the half-diagonal and full polar are inverse additive comparisons.

**Checks.**

- Over ℚ the pairing b(x,y)=xy has half-diagonal x²/2, whose polar at (1,1) is 1. Using x² would give 2.
- Over 𝔽₂ the plane x²+xy+y² has Arf one but its alternating polar represents zero in Ws(𝔽₂); σ cannot be an unconditional isomorphism.
- On ℤ the pairing 2xy has determinant 2 and cokernel ℤ/2, so it is excluded although its determinant is nonzero; on the zero module the adjoint 0→0 is an isomorphism.
- In R=ℤ[√−5], the nonprincipal ideal I=(2,1+√−5) satisfies I²=2R. The pairing I×I→R, (x,y)↦xy/2, is perfect on the rank-one projective I although I has no R-basis. Restricting the carrier to free modules would discard it.

*Needs:* Mathlib full quadratic polar; GeometryOfNumbersAndQuadraticArithmetic §§6.3–6.5 and 6.8a; HermitianKTheoryOfPoincareCategories §§3.4, 4.5 and 6.6.

### 0.2 Integral Witt injection

Prove Ws(R)→Ws(K) is injective for every Dedekind domain R, including fraction characteristic two. Intersect a generic Lagrangian with the integral projective module, prove the intersection is saturated, and use projectivity of torsion-free finite modules to split the quotient. Perfection identifies the resulting rank-half submodule with its perpendicular. For char K≠2, consume ArithmeticKTheory §3.5's injectivity of σ; together with the field comparison it gives injectivity Wq(R)→Wq(K). For char R=2 prove instead that σ is zero: a polar form is alternating, is metabolic over K, and descends to zero by symmetric injectivity. No perfection of the field K is assumed.

(CDHHLMNNS-III-v4, Proposition 2.3.1, proof, p. 41; Remark 2.3.17 and proof after Corollary 2.3.16, pp. 47–48; CDHHLMNNS-III-v4 line 2226.)

**Checks.**

- For R=ℤ the line ⟨1⟩ has signature one over both ℤ and ℚ and cannot enter the kernel.
- Over R=𝔽₂[t] the polar of xy is alternating and zero in Ws(R), even though the symmetric unit line stays nonzero by rank parity.
- For R=K the extension map is the identity; the zero form has the whole zero module as its Lagrangian.

*Needs:* §0.1; finite torsion-free projectivity over a Dedekind domain; ArithmeticKTheory §3.5; HermitianKTheoryOfPoincareCategories §7.9.

### 0.3 Second residue

For each nonzero prime p of a Dedekind domain R, construct the symmetric Witt boundary ∂p:Ws(K)→Ws(kp;lp), where lp=p⁻¹/R at p is the canonical residue duality line. Choose a uniformizer π only to identify lp with kp. In that coordinate ∂p⟨πu⟩=⟨ū⟩ and ∂p⟨u⟩=0 for units u; valuation parity determines the general rank-one value. The family has finite support and gives ∂0:Ws(K)→⊕p Ws(kp;lp).

(CDHHLMNNS-III-v4, Lemma 2.2.9 and Remark 2.2.10, pp. 40–41; Lemma 2.2.2, p. 37; CDHHLMNNS-III-v4 line 1840.)

The linking form is on L∨/L for an integral lattice L, with values in K/R. For ⟨πu⟩ on the standard line, L∨=π⁻¹R and multiplication by π identifies the residue duality line with k. The coefficient u⁻¹ arising from the dual generator has the same square class as u. Diagonalization handles nonalternating field summands; alternating summands are metabolic. Only primes dividing the denominators or Gram determinant can contribute. This proves finite support rather than replacing the direct sum by an unrestricted product.

The defining map has the following API.

- For each nonzero prime p, the residue is an additive homomorphism from Ws(K) to Ws(kₚ;lₚ).
- For a unit u in Rₚ, the rank-one form ⟨u⟩ has zero residue.
- For a uniformizer π and unit u in Rₚ, the class ⟨πu⟩ has residue ⟨ū⟩ in the π-coordinate.
- Scaling a coefficient by a square leaves its residue class unchanged.
- For π′=vπ, the displayed coordinate is multiplied by ⟨v̄⁻¹⟩; the line-valued map is unchanged.
- For any class, only finitely many ∂p are nonzero.
- Residue is additive under orthogonal sum and descends through metabolic relations.

**Checks.**

- For ℤ_(2), ∂⟨3⟩=0. This tests the vanishing on unit lines; reducing the coefficient would give ⟨1⟩.
- For ℤ_(2), ∂⟨2⟩=⟨1⟩≠0 in Ws(𝔽₂). This tests the odd-valuation residue; coefficient reduction would instead give the singular zero form.
- ∂⟨4⟩=0, so merely testing divisibility by 2 gives the wrong map. This tests valuation parity, since valuation two is even.
- At 3 with π=3, ∂⟨6⟩=⟨2⟩ in Ws(𝔽₃), retaining the unit square class. This tests the nonsquare unit coefficient after removing the uniformizer.
- For ℤ→ℤ[i], the residue map Ws(𝔽₂)→Ws(𝔽₂) at 2 and 1+i is zero, although the residue-field map is the identity: the ramified linking pairing has zero Witt class (Remark 2.2.6). This tests the ramified linking comparison: an unweighted residue-field extension would incorrectly give the identity.
- At R=ℤ_(5), for ⟨5⟩ and π=5 the coordinate is ⟨1⟩; for π′=10 it is ⟨3⟩ because 2⁻¹=3 modulo five. The line-valued class is unchanged, whereas an unadjusted coordinate would change the map.

*Needs:* §§0.1–0.2; GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.9, including L-localization and residue dévissage; HermitianKTheoryOfPoincareCategories §§6.6 and 7.9.

### 0.4 Finite Arf coordinate

For k=𝔽_(2^r), r≥1, and a finite-dimensional quadratic map q with perfect full polar, define its finite-field Arf coordinate to be Tr_(k/𝔽₂)(Σᵢ q(eᵢ)q(fᵢ)) in 𝔽₂ for a symplectic basis. Prove basis independence, descent to Wq(k), and an additive isomorphism Wq(k)≃ℤ/2. For every finite extension k′/k of degree m, prove scalar extension acts on these coordinates by multiplication by m modulo two. The construction extends the supplied 𝔽₂ invariant; it does not reconstruct that special-case quotient.

The completeness theorem `arf_trace_classifies` states that for any finite field k of characteristic two with its 𝔽₂-algebra structure, finite-dimensional k-spaces V and W, and forms q and q′ with symplectic bases of n and m pairs respectively, their absolute-trace sums are equal if and only if q⊥q′ vanishes on a subspace L with 2 dim L=dim(V×W). The basis hypotheses require all e–e and f–f polar pairings to be zero and b(eᵢ,fⱼ)=δᵢⱼ for each form; these imply perfect polars. The dimensions n and m may differ or be zero. Such an L is a quadratic Lagrangian, since the sum has perfect polar. Taking q′=q with two choices of basis and the diagonal L proves basis independence.

(CDHHLMNNS-III-v4, Corollary 2.3.10, p. 45; Examples 2.3.13–14, pp. 46–47; CDHHLMNNS-III-v4 line 2095.)

A symplectic basis splits q into planes ax²+xy+by². Such a plane is metabolic exactly when the Artin–Schreier equation has a solution, equivalently Tr(ab)=0. Symplectic changes alter the raw sum by an element z²+z, killed by trace. The orthogonal sum of two trace-one planes is metabolic. Trace transitivity gives Tr_(k′/𝔽₂)(a)=m Tr_(k/𝔽₂)(a) for a∈k, fixing the extension map itself.

The defining map has the following API.

- For every perfect-polar quadratic form over k, its coordinate is the absolute trace of the symplectic-basis sum.
- Changing the symplectic basis preserves the absolute trace, although it need not preserve the raw sum.
- For two nonsingular forms over k, the coordinate of their orthogonal sum is the sum of their coordinates.
- Every hyperbolic plane over k has coordinate zero.
- A nonsingular finite-field form has invariant zero exactly when metabolic.
- The descended map is an additive isomorphism Wq(k)≃ℤ/2.
- For degree m, the base-change map is multiplication by m on ℤ/2.
- Regularity is perfectness of Mathlib `QuadraticMap.polarBilin`, rather than `QuadraticMap.associated` in characteristic two.

**Checks.**

- Over 𝔽₂, q(x,y)=xy has perfect polar and Arf 0. This fixes the hyperbolic normalization at zero.
- Over 𝔽₂, x²+xy+y² has perfect polar and Arf 1; all three nonzero vectors have value 1. Against xy the traces are 1 and 0 and their sum has no two-dimensional quadratic Lagrangian. This distinguishes the anisotropic plane from the hyperbolic plane despite their equal polars.
- Over 𝔽₄, x²+xy+y² has Arf 0 and is hyperbolic: if ζ²+ζ+1=0, (ζ,1) is isotropic. Against xy both traces are zero and their sum has a two-dimensional quadratic Lagrangian. The value tests the full polar and absolute trace, rather than the untraced symplectic sum.
- Over 𝔽₂, x² has zero polar and is excluded despite being a nonzero quadratic map. This tests nonsingularity of the full polar.
- The zero-dimensional nonsingular form has invariant 0. Against xy it has equal trace 0 and a one-dimensional vanishing subspace in dimension two; against the 𝔽₂ Arf-one plane it has unequal traces and no such subspace. This tests both directions with unequal dimensions.
- Over 𝔽₄ with ζ²+ζ+1=0, the plane x²+xy+ζy² has trace invariant ζ+ζ²=1, whereas the plane with last coefficient one has trace 1+1=0.
- For q=xy over 𝔽₄, the standard symplectic basis has raw Arf sum zero. The basis ((1,1),(ζ,ζ²)) has polar pairing ζ+ζ²=1 and raw sum 1·1=1, but both absolute traces are zero. Raw basis independence would be false.

*Needs:* §0.1; Mathlib quadratic maps and full polar; finite-field trace and Artin–Schreier theory; HermitianKTheoryOfPoincareCategories §§3.4 and 7.9.

### Examples

The hyperbolic quadratic plane xy over 𝔽₂ has polar matrix [[0,1],[1,0]] and Arf zero. The plane x²+xy+y² has the same polar but Arf one: at (1,0), (0,1), (1,1) its values are 1,1,1. Over 𝔽₄ its value at (ζ,1) is ζ²+ζ+1=0. Thus equal alternating polars do not imply quadratic isometry, and quadratic base change can kill a nonzero class while symmetric rank parity preserves the unit line.

### Dependencies

Native quadratic maps, finite-field linear algebra, and the supplied exact/Poincaré Witt theories. The integral descent argument needs Dedekind projectivity, not the completion or global classification layers. The residue route additionally uses the supplied derived residue line and localization. The Arf extension calculation uses finite-field trace, not any global L-table.

## Layer 1: global characteristic two and residue diagrams

### 1.1 Characteristic two table

If R is Dedekind with global fraction field K of characteristic 2, Ls_(2a)(R)=Ws(R) and Ls_(2a+1)(R)=Pic(R)/2 for every integer a. The spectrum is 2-periodic. The map Ws(R)→Ws(K) is injective, whereas Wq(R)→Ws(R) is zero.

(CDHHLMNNS-III-v4, Corollary 2.3.4 and Remark 2.3.17, pp. 42, 48; CDHHLMNNS-III-v4 line 1936.)

Reduce the divisor/principal-divisor/Picard exact sequence modulo two. In each finite residue field, symmetric Witt class is rank parity. Section 0.3 identifies the residue of ⟨a⟩ with the valuation of a modulo two. Symmetric Witt groups over an arbitrary characteristic-two field are generated by diagonal lines after discarding metabolic alternating summands; no square root of every coefficient is needed. Multiplying a by a square clears its denominator. The two cokernels therefore agree, proving both directions of the Picard identification. The sign involution is unchanged in characteristic two, so the identification has period two.

**Checks.**

- For R=𝔽₂[t], Pic(R)=0, so the odd groups are zero; ∂_(t)⟨t⟩ has rank parity one, matching v_(t)(t)=1.
- For R=𝔽₂(t) the prime family is empty, Pic=0 and Ws(R) is the even-degree group; the global field itself is not required to be perfect.
- For R=𝔽₂[t,t⁻¹], the t-prime has been inverted and contributes no residue term; using all primes of 𝔽₂[t] would produce an extra coordinate.

*Needs:* §§0.2–0.3; GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.9; HermitianKTheoryOfPoincareCategories §7.9; Mathlib ideal factorization, `ClassGroup.mk0_surjective`, `ClassGroup.mk_eq_one_iff` and `ClassGroup.equivPic`; ArithmeticKTheory §2.2 for the compatible divisor normalization.

### 1.2 Local and global residue diagrams

Use the supplied characteristic-not-two Dedekind table with its exact sequence
`0 -> Ls_(2a)(R) -> Ls_(2a)(K) -> directSum_p Ls_(2a)(k_p;l_p) -> Ls_(2a-1)(R) -> 0`
for every a∈ℤ. Over a DVR the second residue is surjective: lift a residue symmetric matrix to a unimodular matrix and multiply its generic form by a uniformizer. Its kernel is Ws(R). For arbitrary residue field k, this gives positive-sign residues Ws(R), Ws(k),0,0 if char K≠2 and char k=2; it gives Ws(R),0,0,0 if char k≠2. In equal characteristic two the odd groups vanish and the even groups are Ws(R). Completeness, henselianity and finiteness of k are not hypotheses. (CDHHLMNNS-III-v4, Remark 2.3.5, p.42; line 1960.)

For a Dedekind domain with global fraction field of characteristic different from two, consume the residue-to-Picard exactness in ArithmeticKTheory §3.5. The residue parity map is the valuation divisor modulo two, and its cokernel is Pic(R)/2, including kernel exactness beyond the parity surjection. Every dyadic residue field is finite, so the degree-one group is (ℤ/2)^d. In odd global function-field characteristic, d=0. (CDHHLMNNS-III-v4, Corollary 2.3.2 and proof, pp.41–42; lines 1904 and 1930; Scharlau-1985, Chapter 6 §6, Theorem 6.11.)

**Checks.**

- Over ℤ_(2), ∂⟨2⟩=⟨1⟩ generates Ws(𝔽₂)=ℤ/2, and the symmetric degree-one group is ℤ/2. Over ℤ_(3) the residue map remains onto but degree one is zero: the residue field's L₂ is zero.
- Over 𝔽₂[[t]], ∂⟨t⟩ has parity one and every odd L-group of the DVR is zero. The imperfect generic field is allowed.
- Over ℤ, Pic/2=0 and d=1, giving symmetric residues ℤ,ℤ/2,0,0 with signature normalization. Over 𝔽₃[t], Pic/2=0 and d=0, giving Ws(R),0,0,0.
- Under the negative-sign equivalence, degree two over ℤ has positive degree zero, hence ℤ; degree zero has positive degree −2, hence zero. This checks the suspension direction with two adjacent even degrees.

*Needs:* §§0.2–0.3 and 1.1; ArithmeticKTheory §3.5; HermitianKTheoryOfPoincareCategories §§1.6 and 7.9; GeometryOfNumbersAndQuadraticArithmetic §6.9.

### Examples

At 3, π=3 sends ⟨6⟩ to ⟨2⟩; the map retains the nonsquare unit rather than only its rank. For the global comparison, a principal divisor is zero in Pic/2, while a divisor D maps to its class modulo twice Pic. Over ℤ all ideals are principal, giving zero in residue degree three. The characteristic-two construction above uses the same parity square without assuming a characteristic-not-two Hasse–Minkowski theorem.

### Dependencies

Layer 0, supplied field L-theory and Dedekind localization, and the divisor-class exact sequence. The characteristic-not-two global residue theorem is supplied by ArithmeticKTheory §3.5. The local residue surjectivity uses only matrix lifting and the uniformizer formula. Sign comparisons use the generic supplied shift equivalence and do not depend on arithmetic fracture.

## Layer 2: dyadic completion and quadratic rigidity

### 2.1 Dyadic completion

For a Dedekind domain R with char K≠2, prove the canonical R-algebra equivalence C=limₘ R/(2^m)≃∏_(p|2)R̂ₚ. Here R̂ₚ may be represented by the native ideal-adic completion and is identified with the valuation-completion integer ring, hence is a complete DVR. The empty product is the zero ring. Preserve the maps R→C and C→C[1/2], as well as every quotient projection.

(CDHHLMNNS-III-v4, proof of Proposition 2.3.9 ii), p.45, line 2068; proof of Corollary 2.3.10, p.45, lines 2087–2091.)

Factor (2)=∏p^eₚ, with every eₚ>0, and apply Chinese remainders to (2)^m=∏p^(eₚm). For each p, the subsequence eₚm is cofinal among all powers, so the limit of R/p^(eₚm) is R̂ₚ. Construct the inverse by compatible quotient projections; equality in every quotient proves equality in the inverse limit. This gives the ring operations and the R-algebra comparison, not merely a set bijection. Since two is nonzero, multiplication by every power of two is injective and ordinary completion represents the required derived completion.

The defining map has the following API.

- The completion comparison is an R-algebra equivalence C≃∏_(p|2)R̂ₚ, compatible with the quotient projections.
- Its p-projection composed with R→C is local completion.
- The p-component has residue field R/p.
- After inverting 2 the p-component is Frac(R̂_p).
- Inverting only nondyadic primes induces an equivalence on C.
- When (2)=R, C is the zero ring, not R.
- Two ring maps into C agree if their composites with every completed-DVR projection agree; for an empty dyadic set the condition is vacuous.

**Checks.**

- For R=ℤ there is one factor ℤ₂ with residue 𝔽₂. This tests the single degree-one factor.
- For ℤ[1/2] the dyadic set is empty and C=0. This tests the empty product.
- For ℤ[ζ₃] there is one unramified quadratic factor with residue 𝔽₄, not two factors and not 𝔽₂. This tests the residue degree.
- For ℤ[i] the single dyadic factor remains one factor although (2) has exponent 2. This counts prime factors, not their ramification multiplicities.
- For R=ℚ the ideal (2) is the unit ideal, every quotient R/(2^m) is zero, and the limit is zero. For R=ℤ_(3), the same calculation gives zero; it does not give the 3-adic completion.
- When two splits, the two completed projections are both needed: maps from ℤ[x] sending x to (0,0) and (0,1) agree in the first factor and differ in the second. In the empty product every map is equal, so projection extensionality is vacuous and valid.

*Needs:* Mathlib ideal factorization and ideal-adic completion; coprime-ideal Chinese remainders; Tau Ceti general-Dedekind completion and residue comparison.

### 2.2 Arithmetic fracture

Let R be a ring, M an invertible module with involution over R, in the coefficient-duality sense of the source, and ℓ a positive integer. Assume ordinary ℓ-adic completion R̂_ℓ represents derived completion (bounded ℓ-power torsion suffices). For each m∈ℤ∪{±∞}, the square Dp(R)→Dp(R̂_ℓ), over Dc(R[1/ℓ])→Dc′(R̂_ℓ[1/ℓ]), with structures Q_M^(≥m), is Poincaré–Verdier. Here c and c′ are precisely the involution-stable images of the respective K₀ maps. Applying GW or L gives a homotopy pullback square. The coefficient M is the supplied invertible coefficient bimodule with its action-swapping involution and coherent evaluation duality; a merely self-dual module is insufficient.

(CDHHLMNNS-III-v4, Proposition 2.3.6, p. 43; CDHHLMNNS-III-v4 line 1976.)

Apply the supplied change-of-rings criterion to the derived ring square and its completed coefficient module (CDHHLMNNS-II-v5, Proposition 4.5.5, pp.108–110; line 5253). The underlying square is a derived localization–completion pullback. Keep c=im(K₀(R)→K₀(R[1/ℓ])) and c′=im(K₀(C)→K₀(C[1/ℓ])) as involution-stable subgroups. The rational overlap kills the relevant C₂-Tate obstruction; bounded power torsion is a sufficient condition for the ordinary/derived comparison, not a hypothesis on a residue cardinality. Localizing invariance then gives both GW and L pullbacks.

**Checks.**

- For ℓ=1, completion is zero, R[1/ℓ]=R and the controlled category is all Perf(R); the square becomes R→0 over R→0 and is a pullback.
- For R=ℤ, ℓ=2 and M=ℤ, the overlap is ℚ₂. The additive difference map ℤ[1/2]⊕ℤ₂→ℚ₂, (a,b)↦a−b, sends (1,1) to 0 and (2,1) to 1, so ℤ→ℤ[1/2]⊕ℤ₂→ℚ₂ composes to zero on 1↦(1,1). The sum map would send (1,1) to 2 and fail to give a complex.
- For the dense even-Euler subcategory of Dᵇ(k), the K₀ image is 2ℤ and k[0] has class 1 outside it. This excludes deleting a control subgroup merely because its category is dense.
- For R=ℤ/4 and ℓ=2, power torsion is bounded and the completion is R, while R[1/2]=0. The square is an identity horizontally on top and zero below.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a, gap:derived-localization-completion-square and gap:poincare-change-of-rings-criterion; HermitianKTheoryOfPoincareCategories §§4.6 and 1.6; GeneralAlgebraicKTheory §§11.3–11.4 and 11.15; GeometryOfNumbersAndQuadraticArithmetic §6.1a for homotopy groups, fibres and the long exact sequence of the pullback.

### 2.3 Quadratic isometry lifting

Let R have a Wall anti-structure: an anti-automorphism α and unit u with α²(a)=uau⁻¹ and α(u)=u⁻¹. Let J be a two-sided ideal preserved by α, and suppose R is complete and separated for the powers of J. For a finite projective right module, quadratic refinements are sesquilinear maps, φ(xa,yb)=α(a)φ(x,y)b, modulo the relation generated by T−1, where Tφ(x,y)=α(φ(y,x))u; nonsingularity means the adjoint of φ+Tφ is invertible. Prove projectives and nonsingular refinements lift from R/J. Every prescribed residue isometry between reductions of two such forms lifts to an isometry over R. In particular, refinements on one module agreeing modulo J are related by an automorphism congruent to the identity modulo J. For commutative R with α=id and u=1 these are the full-polar quadratic forms of Layer 0. No invertibility of two is imposed.

(CDHHLMNNS-III-v4, Proposition 2.3.7, pp. 43–44, invoking Wall (1970), Lemma 1 and Theorem 2.)

Lift a residue module map using projectivity; Nakayama upgrades the lift of an isomorphism to an isomorphism. After that lift, the forms agree modulo J. If the discrepancy has order J^r, use the nonsingular adjoint to choose a correction whose remaining discrepancy is in J^(2r). Completeness constructs the limiting isometry and separation proves the limiting equality. For projectives, lift idempotents and use the same radical criterion for nonsingularity.

**Checks.**

- Over ℤ₂, q=xy has perfect polar determinant −1 and lifts the hyperbolic plane over 𝔽₂. The error-correction argument never uses 1/2.
- The quadratic plane x²+xy+y² over ℤ₂ reduces to Arf one, whereas xy reduces to Arf zero; no residue isometry exists between them, so lifting does not identify them.
- For J=0, the reduction is the identity and the specified isometry lifts as itself. For the square-zero pair 𝔽₂[ε]/(ε²)→𝔽₂, an error in J is sent to J²=0 in one correction.
- The symmetric ℤ₂-lines with coefficients 1 and 3 reduce to the same 𝔽₂-line but are not isometric because 3 is not a square in ℚ₂. This excludes replacing quadratic refinements by arbitrary symmetric pairings.
- Over ℚ with α=id and u=−1, the rank-one refinement φ(x,y)=xy has Tφ(x,y)=−yx, so φ+Tφ=0 and the form is singular. Omitting u in T would give 2xy, which is nonsingular.
- On ℚ² with α=id, the refinement with matrix [[0,1],[0,0]] has symmetrization [[0,1],[−1,0]], of determinant 1, for u=−1, and [[0,1],[1,0]], of determinant −1, for u=1. The sign u decides between alternating and symmetric polar forms.
- On M₂(ℚ) with α the transpose and u=1, α(E₁₂E₂₁)=α(E₁₁)=E₁₁=α(E₂₁)α(E₁₂), whereas α(E₁₂)α(E₂₁)=E₂₂. The anti-automorphism reverses products, which is why φ(xa,yb)=α(a)φ(x,y)b is the sesquilinearity matching right modules.

*Needs:* finite-projective module lifting and Nakayama; supplied classical quadratic carrier and its reduction maps; J-adic completeness and separation.

(Wall-1970, Lemma 1, p.427, and Theorem 2 with proof, pp.428–429; lines 104, 132 and 155.)

### 2.4 Complete quadratic rigidity

For any associative unital ring R with involution, complete and separated for the powers of an involution-stable two-sided ideal J, reduction is an equivalence Lq(R;ε)≃Lq(R/J;ε) of periodic spectra for ε=±1 and every homotopy degree. The coefficient is the standard ring duality with its specified sign; no arbitrary invertible-coefficient extension is asserted.

(CDHHLMNNS-III-v4, Proposition 2.3.7, pp. 43–44; CDHHLMNNS-III-v4 line 2000.)

Section 2.3 identifies the isometry classes and K₀ controls, hence gives the degree-zero comparison for both signs. In degree one use the fundamental fibre sequence K_(hC₂)→GWq→Lq. Surjectivity of lifted isometries is only part of the argument: the relation/kernel comparison must identify the image of elementary quadratic formations. Use the free/projective comparison and the surjection on the two vertical kernels in Wall-1973, Corollary 1, Lemma 1 and Proposition 4. This proves injectivity as well as surjectivity on Lq₁. Sign shift and four-periodicity cover every integer degree; detection of equivalences by all integer homotopy groups gives the spectrum equivalence.

**Checks.**

- For R=ℤ₂, J=(2), both quadratic degree-zero and degree-two groups are ℤ/2 and the odd groups are zero. The reduction equivalence is integral at the residue characteristic.
- For R=𝔽₂[ε]/(ε²), J=(ε), reduction preserves all quadratic L-groups despite the nonreduced source; reducedness is not required.
- For J=0 the map is the identity; for J=R separated completeness forces R=0, so both spectra are zero.
- Symmetric degree zero does not satisfy the same theorem: Ws(ℤ₂) has order 16 and Ws(𝔽₂) has order 2.

*Needs:* §2.3; GeometryOfNumbersAndQuadraticArithmetic §6.8a fundamental fibre sequence; HermitianKTheoryOfPoincareCategories §1.6 `bordism_invariant_periodicity` and §§4.5–4.6; GeometryOfNumbersAndQuadraticArithmetic §6.1a homotopy groups and detection of equivalences; the degree-one relation comparison of Wall-1973.

(Wall-1973, Corollary 1, Lemma 1, Proposition 4 and Lemma 5; cited by locator only. CDHHLMNNS-III-v4 lines 2019–2021 gives the precise use of these inputs.)

### 2.5 Henselian quadratic rigidity

For every commutative henselian pair (R,J), reduction induces Lq(R)≃Lq(R/J), integrally, for both signs. Neither 2 invertible nor nilpotence of J is required.

(CDHHLMNNS-III-v4, Remark 2.3.8, p. 44; CDHHLMNNS-III-v4 line 2023.)

By filtered colimits reduce to henselizations of finitely presented pairs. A finitely presented ℤ-algebra A is a G-ring, so its henselization H along I is a Noetherian G-ring and H→Ĥ, the completion along the extended ideal, is regular (gap:henselian-pair-completion-regular); Néron–Popescu then makes it ind-smooth. A smooth algebra mapping to that completion has a section over the henselian base by smooth henselian lifting. The completion map is therefore a filtered colimit of split injections. Apply the retraction argument to the functor Lq, using complete rigidity and preservation of filtered colimits. The result concerns all homotopy degrees and both signs.

**Checks.**

- For (ℤ₂,(2)) reduction gives the same ℤ/2 quadratic groups as §2.4; no prime-to-two coefficient restriction is present.
- For (𝔽₂[ε]/(ε²),(ε)) the pair is henselian and the quadratic theory ignores the nilpotent thickening.
- For a ring with J=0 the reduction is the identity. A nonnilpotent ideal such as (2) in ℤ₂ is allowed; nilpotence is not the definition of a henselian pair.
- For A=ℤ[x] and I=(2), the henselization H satisfies H/2H=𝔽₂[x], which has infinitely many maximal ideals, and every maximal ideal of H contains 2H. So H is not local, and regularity of H→Ĥ is the ideal-adic statement for a G-ring, not regularity of the completion of a local G-ring.

*Needs:* §2.4; GeometryOfNumbersAndQuadraticArithmetic §6.8a filtered-colimit compatibility; SchemeAndStackFoundations §§0.12–0.13 henselization, §0.14 smooth lifting, §0.15 Néron–Popescu and §0.21 G-rings of finite type over ℤ; gap:henselian-pair-completion-regular for regularity of the completion map of these henselizations.

(CMM, Remark 5.6, p.39, lines 1659–1674; smooth lifting is Theorem 3.15, p.21, line 892.)

### Examples

For ℤ[1/2] the dyadic completion is zero, so the comparison square degenerates to the quadratic-to-symmetric equivalence over a two-inverted ring. For ℤ[i], (2)=(1+i)² contributes one completed DVR, not two; the cofinal sequence of exponents is 2m. For ℤ[ζ₃], (2) remains prime and its residue is 𝔽₄, giving one unramified quadratic dyadic factor. These three rings distinguish empty, ramified and unramified residue-degree-two products.

### Dependencies

The completion decomposition needs ideal factorization, Chinese remainders, inverse limits and the pinned completion comparison. General arithmetic fracture needs the supplied derived/Poincaré criterion and both K₀-image controls. Quadratic lifting needs finite projectives and completeness, not the global tables. Complete rigidity additionally needs the degree-one relation comparison. Henselian rigidity additionally uses filtered colimits, regularity and smooth approximation. None of the rigidity theorems uses symmetric dyadic rigidity.

## Layer 3: the total cokernel and quadratic arithmetic

### 3.1 Dyadic correction

For C=R̂₂, define A(R)=Ws(C)/(im(Ws(R)→Ws(C))+im(σ_C:Wq(C)→Ws(C))). Equivalently it is the cokernel of coker(σ_R)→coker(σ_C), since the comparison square commutes. The definition is an additive quotient, without choosing a splitting of any L-group extension.

(CDHHLMNNS-III-v4, Proposition 2.3.9, pp. 44–45; Remark 2.3.12, pp. 45–46; CDHHLMNNS-III-v4 line 2044.)

Take the supremum of the two additive subgroup ranges in Ws(C), then the native quotient by that subgroup. A homomorphism from Ws(C) factors through A(R) precisely when it kills both ranges. The commutative comparison square sends im σ_R into im σ_C; applying the quotient universal property twice identifies the result with the cokernel on cokernels. Functoriality is asserted for ring maps for which the maps of completions and the two polarisation maps commute, rather than for an unrelated square of groups.

The defining map has the following API.

- The obstruction is the additive quotient of Ws(C) by the sum of the global symmetric and completed quadratic images.
- The quotient map Ws(C)→A(R) is surjective.
- A representative is zero exactly when it is a global symmetric image plus a completed quadratic image.
- An additive map out factors uniquely precisely when it kills both images.
- Identify A with coker(coker σ_R→coker σ_C).
- A commuting comparison/completion diagram induces the unique quotient map.
- The native quotient by the supremum of the two additive subgroup ranges supplies the inherited abelian group structure.

**Checks.**

- If Ws(R)→Ws(C) is onto, then A(R)=0, even if σ_C is not onto. This tests that the global image alone can kill the quotient.
- If σ_C is onto, A(R)=0, even if the global image vanishes. This tests that the completed quadratic image alone can kill the quotient.
- For D=(ℤ/2)^d, s the constant diagonal and q zero, the quotient has order 2^(d−1) for d≥1. This tests the diagonal relation between distinct components.
- The parity quotient is zero at d=1, but it does not force A(R)=0; the Eisenstein computation supplies a nonzero example. This tests that rank parity need not detect the whole obstruction.
- When 2 is a unit, C=0 and A(R)=0. This tests the zero target of both image maps.
- In D=ℤ/4 with global image 2D and quadratic image zero, the quotient is ℤ/2. With quadratic image D it becomes zero. Quotienting by the intersection of the images would leave ℤ/4 in the first case.

*Needs:* §0.1 and §2.1; Mathlib additive subgroup ranges and quotient; the completion comparison square of ArithmeticKTheory §3.5.

### 3.2 Number field quadratic table

For a Dedekind domain R with number-field fraction field and d dyadic primes, identify each degree-two summand in the supplied quadratic table by the absolute Arf coordinate. This gives Lq₂(R)≃(ℤ/2)^d with its actual residue maps, and 0→A(R)→Lq₃(R)→Pic(R)/2→0. Prove A(R) is a finite two-primary group. The first two residue classes are the supplied Wq(R),0. The exact extension is not replaced by a direct sum.

(CDHHLMNNS-III-v4, Corollary 2.3.10 and proof, p. 45; CDHHLMNNS-III-v4 line 2072.)

Each completed symmetric Witt group injects into the Witt group of a finite extension of ℚ₂. Local classification makes this a finite two-primary group. A finite product and its quotient A retain that property. Each residue field is finite of characteristic two, so §0.4 gives its named degree-two coordinate. Localized number-field Picard groups are finite, but this does not choose a splitting of the L-group extension.

**Checks.**

- For R=ℤ, d=1 and the degree-two group is ℤ/2, not zero; A(ℤ)=0 follows from §4.3, not from d=1.
- For R=ℤ[1/2], d=0 and degree two is zero; C=0 forces A=0.
- For R=ℤ[ζ₃], d=1 again but A=ℤ/4 by Layer 5. Thus residue degree two does not determine the degree-three obstruction.

*Needs:* §0.4 and §§2.1, 2.4, 3.1; ArithmeticKTheory §§1.1–1.3 and 3.5; QuadraticFormInvariants Layer 6.

### 3.3 Dyadic parity obstruction

For every Dedekind domain R with char K≠2 and its finite set I of dyadic primes, rank parity induces a canonical surjection A(R)→(ℤ/2)^I/Δ(ℤ/2). If d=|I|≥2, its target is isomorphic to (ℤ/2)^(d−1), so A(R) is nonzero. For d=1 the target is zero and gives no vanishing conclusion about A; for d=0, C=0 and A(R)=0. No residue-field finiteness or perfection is assumed.

(CDHHLMNNS-III-v4, Remark 2.3.12, pp. 45–46; CDHHLMNNS-III-v4 line 2099.)

A completed quadratic form reduces to a perfect alternating polar, hence has even rank in every component. A global projective has constant rank, so its parity vector is diagonal. Independent unit lines in the completion factors realize every parity vector. Pass to the quotient by the two images. The surjection onto the diagonal quotient is canonical; identifying that quotient with (ℤ/2)^(d−1) uses a chosen coordinate and is not called canonical.

**Checks.**

- At d=2 the diagonal subgroup of (ℤ/2)² is {(0,0),(1,1)} and its quotient has two elements; the class of (1,0) is nonzero.
- At d=3 the eight parity vectors have four diagonal cosets, giving (ℤ/2)².
- At d=1 the quotient has one element although the Eisenstein A has four; at d=0 both the parity quotient and A are zero. The exponent formula 2^(d−1) is used only for d≥1.
- Let A=ℤ[t]_(2), the DVR obtained by localizing at (2), and R=A[(1+√17)/2]. The polynomial x²−x−4 is irreducible over ℚ(t) and has unit discriminant 17 in A, so R is a finite étale Dedekind domain. Modulo two it is x(x+1), giving exactly two dyadic primes, both with residue field 𝔽₂(t), which is infinite and imperfect since t is not a square. Thus the parity quotient is (ℤ/2)²/Δ≃ℤ/2, with nonzero class (1,0), and A(R)≠0. A restriction to finite or perfect residue fields would miss this nonzero obstruction.

*Needs:* §3.1; constant rank for finite projectives over a domain; finite-dimensional alternating linear algebra in characteristic two.

### 3.4 Quadratic localization

For a Dedekind domain R with char K≠2 and any set S of nondyadic nonzero primes, use the supplied valuation overring R_S. Prove the fibre sequence Lq(R)→Lq(R_S)→⊕_(p∈S)Lq(kₚ) after choosing residue-line trivializations. Before trivialization retain the canonical line and derived shift. The result includes infinite S via finite support and filtered colimits; it does not require the primes to be principal. Dyadic S is outside the assertion.

(CDHHLMNNS-III-v4, Remark 2.3.15, p. 47; Remark 2.2.8, pp. 39–40; CDHHLMNNS-III-v4 lines 2206 and 1807–1818.)

R→R_S induces an equivalence of dyadic completions. Paste the supplied quadratic/symmetric completion pullbacks to obtain a pullback for R→R_S. Symmetric localization identifies its cofiber with the residue sum. At nondyadic primes two is a unit, so the residue quadratic and symmetric theories agree. The residue coefficient shift and the rotation of the localization triangle cancel exactly as in §0.3.

**Checks.**

- For S empty, R_S=R and the third spectrum is zero, giving the identity fibre sequence.
- For R=ℤ and S={(3)}, R_S=ℤ[1/3]; both dyadic completions are ℤ₂ and the residue term is the quadratic theory of 𝔽₃.
- For R=ℤ and S={(2)}, the asserted sequence would have π₃Lq(𝔽₂)=0 and π₂Lq(ℤ[1/2])=0, forcing π₂Lq(ℤ)=0, contrary to ℤ/2. This is a negative control on the nondyadic hypothesis.
- For infinite S every boundary element still has finitely many nonzero components; a tuple with one nonzero value at every prime is excluded.

*Needs:* §2.1; ArithmeticKTheory §3.5 completion comparison square; GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.9; the quadratic-to-symmetric equivalence where two is a unit.

### Examples

The completion comparison supplied by ArithmeticKTheory §3.5 is the pullback Lq(R)→Lq(C) over Ls(R)→Ls(C). For Dedekind rings, K₀ controls disappear because every projective over a localization admits a projective lattice; the Picard localization map is onto. This is not a K₀-surjectivity claim for arbitrary rings. Its long exact sequence gives the supplied quadratic table and identifies its extra degree-three kernel with §3.1's quotient. At R=ℤ the completed images span Ws(ℤ₂), so this kernel is zero; at the Eisenstein ring the quotient is ℤ/4. The diagonal parity test detects every d≥2 and leaves both of these one-prime outcomes possible.

### Dependencies

The supplied Dedekind tables and comparison square, Layer 0's Arf maps and Layer 2's completion/rigidity inputs. The concrete quotient needs only the commutative comparison diagram and additive quotient theory. Its number-field finiteness uses complete local classification. The parity map needs no local classification, while nondyadic dévissage needs canonical residue coefficients and symmetric localization. No characteristic-two global quadratic table is asserted.

## Layer 4: explicit dyadic Witt arithmetic

### 4.1 Dyadic Witt coordinates

In the native field Witt ring W(ℚ₂), let u=⟨1⟩ be the unit, v=⟨1,−2⟩ and c=⟨1,3⟩. For a∈ℤ/8 and b,e∈ℤ/2 define the coordinate function as au+bv+ec using least nonnegative representatives. Prove this function is the underlying function of an additive equivalence and that multiplication by c sends (a,b,e) to ac+4bu. Hence W(ℚ₂)=ℤ/8{u}⊕ℤ/2{v}⊕ℤ/2{c}, (c)=⟨c,4u⟩≃(ℤ/2)² and ann(c)=⟨2u,c⟩≃ℤ/4⊕ℤ/2. Also c=⟨1,−5⟩ and ⟨1,−3⟩=2u+c.

The headline theorem `wittRing_padicTwo_coordinates` states the additive equivalence on `TauCeti.WittRing ℚ_[2]`, and `wittRing_padicTwo_mul_c` states the multiplication formula for every coordinate triple. In both, u is the unit 1, and v and c are the one-fold Pfister classes ⟨⟨2⟩⟩ and ⟨⟨−3⟩⟩ given by `TauCeti.oneFoldPfisterClass`.

(CDHHLMNNS-III-v4, Examples 2.3.13–14, pp. 46–47, lines 2120–2124 for the order 32 and the abstract group and lines 2175–2182 for c; Lam-2005, VI Theorem 2.29; the ring computations here are derived from the imported local invariant classification.)

Use dimension parity, signed determinant and Hasse invariant to distinguish the 32 classes. To compare Witt classes by the local isometry theorem, first stabilize representatives of the same rank parity to equal dimension using ⟨1,−1⟩; determinant and Hasse signs change under that stabilization and must be recomputed. The Hilbert formula then gives cu=c, cv=4u and c²=0. Solving ac+4bu=0 forces a even and b=0. This excludes the coefficient pair 1,−2 from the annihilator generators in the cited example; 1,−3 is the correct alternative.

The defining map has the following API.

- For v, its defining diagonal presentation uses two nonzero coefficients, its additive order is two, and its residue at two is the nonzero rank-parity class.
- For c, its defining presentation is independent of replacing 3 by −5 up to a square, its additive order is two, and multiplication by c has the displayed image and kernel.
- For the coordinate function, addition agrees with Witt addition after reduction in the three cyclic groups, every Witt class has a coordinate, and that coordinate is unique.

**Checks.**

- For v, the signed determinant is 2 and its second residue is one. It has order two and cv=4u≠0, excluding v as an annihilator generator.
- For v, the tensor c·v has diagonal ⟨1,3,−2,−6⟩: rank four, determinant 36, a square, and Hasse invariant (3,−2)(3,−6)(−2,−6)=(+1)(−1)(−1)=+1, the symbols involving the entry 1 being trivial. These are the invariants of ⟨1,1,1,1⟩, so c·v=4u. The hyperbolic four-form ⟨1,−1,1,−1⟩ has square determinant but Hasse invariant (−1,−1)=−1, so 4u≠0; a Hasse sign −1 for c·v would instead make it zero.
- For v, doubling gives 2v=0; it is independent of u and c because its 2-adic residue is one, while both of theirs are zero.
- For c, the ratio −5/3 is 1 modulo eight and a square, giving ⟨1,3⟩=⟨1,−5⟩. Its signed determinant is −3, the unramified quadratic square class.
- For c, 2c=0 and c²=0. Multiplying the corrected binary class ⟨1,−3⟩ by c gives a hyperbolic four-form, whereas multiplying v by c gives 4u.
- For c, multiplication by 2u is 2c=0 and multiplication by u is c≠0; the annihilator is neither zero nor the whole Witt ring.
- For the coordinate map, (0,0,0), (1,0,0) and (0,1,0) give 0,u,v, with rank parities 0,1,0. The full set has 32 distinct classes.
- For the coordinate map, the kernel of multiplication by c consists of a even and b=0, so it has 4·2=8 elements. Its image consists of 0,c,4u,c+4u and has four elements.
- For the coordinate map, a=8 is represented by zero in ℤ/8 and b=2 by zero in ℤ/2; taking integer coefficients without the quotient relations would destroy uniqueness.
- Stabilizing c=⟨1,3⟩ by ⟨1,−1⟩ preserves its Witt class and signed determinant −3, but changes rank from two to four, plain determinant from 3 to −3, and Hasse invariant from +1 to (3,−1)₂=−1. Comparing unstabilized Hasse invariants would incorrectly separate equal Witt classes.

*Needs:* Tau Ceti native Witt ring; QuadraticFormInvariants Layers 4 and 6, including the normalized ℚ₂ Hilbert formula and square criterion.

### 4.2 Integral signature

Use the supplied identifications Ws(ℤ)≃ℤ by signature and Wq(ℤ)≃ℤ by signature divided by eight; polarisation is multiplication by eight. The positive E₈ lattice with q(x)=B(x,x)/2 is the quadratic generator. Prove that its actual quadratic refinement modulo two has Arf invariant zero. In a simple-root basis take the E₈ graph with arms of lengths 2,4,1; the quadratic polynomial is Σxᵢ²−Σ_(edges ij)xᵢxⱼ. Its zero set in 𝔽₂⁸ has cardinality 136, giving Arf zero. This is a calculation of the refinement, not only its alternating polar.

(CDHHLMNNS-III-v4, Example 2.3.13, p. 46; §3.2 introduction, pp. 54–55; CDHHLMNNS-III-v4 line 2110.)

**Checks.**

- For a simple root eᵢ, B(eᵢ,eᵢ)=2 and q(eᵢ)=1. Reducing B(x,x) itself would give zero and the wrong refinement.
- For adjacent roots, q(eᵢ+eⱼ)=1+1−1=1 and the full polar is −1, hence one modulo two. For nonadjacent roots the polar is zero.
- There are 136 zeros and 120 ones among 256 vectors, matching 2⁷+2³ for Arf zero; Arf one would have 120 zeros.
- The E₈ signature is eight and its quadratic integer invariant is one. The bilinear line has signature one but admits no integral quadratic refinement with perfect polar.

*Needs:* §0.4; GeometryOfNumbersAndQuadraticArithmetic §6.10a; Completed/IntegralLattices Layer 5 and IntegralLattices milestones 1I and 1L (signature divisibility).

### 4.3 Dyadic integral Witt group

Ws(ℤ₂) is the kernel of the surjective second residue W(ℚ₂)→ℤ/2, hence has order 16 and is ℤ/8⊕ℤ/2. The section of the residue is ⟨−1,2⟩ of order 2. The map Wq(ℤ₂)=ℤ/2→Ws(ℤ₂) is injective and its image together with ⟨1⟩ spans Ws(ℤ₂); it is represented by the polar matrix [[2,1],[1,2]], whose ℚ₂ Witt class is c+4u.

(CDHHLMNNS-III-v4, Example 2.3.13, p. 46; CDHHLMNNS-III-v4 line 2110.)

The second residue of §0.3 and the 32 coordinates identify Ws(ℤ₂) with ⟨u,c⟩. Complete quadratic rigidity and the 𝔽₂ Arf isomorphism identify Wq(ℤ₂) with ℤ/2. Diagonalize the full polar of its Arf-one lift and compare equal-rank local invariants to obtain c+4u. Its order is two and it is independent of u. This computes A(ℤ)=0 through the two images in §3.1.

**Checks.**

- u and c have second residue zero and v has residue one, so the integral kernel has 16 of the 32 classes. Counting all even-rank classes would instead omit the integral line u.
- The residue section ⟨−1,2⟩=−v has order two and residue one. Since v has order two, this agrees with v as a Witt class.
- The polar of x²+xy+y² is [[2,1],[1,2]], with signed determinant −3; diagonalization gives ⟨2,3/2⟩ and the local class c+4u, not c.
- The two classes u and c+4u span the 16-element kernel. The global symmetric image generated by u and the local quadratic image therefore have zero joint cokernel.

*Needs:* §§0.3–0.4, 2.4 and 4.1; the DVR residue diagram of §1.2; local field classification.

### Examples

The supplied integer periodic tables and their actual invariant maps are

| Theory | n≡0 | n≡1 | n≡2 | n≡3 |
| --- | --- | --- | --- | --- |
| Ls(ℤ) | ℤ | ℤ/2 | 0 | 0 |
| Lq(ℤ) | ℤ | 0 | ℤ/2 | 0 |

In residue zero the comparison is multiplication by eight. Section 4.3 proves directly that A(ℤ)=0 from the global and completed images, agreeing with the supplied degree-three extension and Pic(ℤ)=0. Reduction of the quadratic integer generator has Arf zero by §4.2, so Wq(ℤ)→Wq(ℤ₂) is the zero map despite multiplication by eight being injective on the global Witt group. (CDHHLMNNS-III-v4, Example 2.3.13, p.46; line 2110.)

### Dependencies

Layer 0's residue and Arf normalizations, complete quadratic rigidity, supplied integral lattice/signature theory, and native field Witt/local classification. The 32-class presentation needs no arithmetic L-spectrum. The integral dyadic subgroup uses residue exactness and lifting. The E₈ refinement needs the actual half-norm polynomial and finite-field Arf theory, not just the bilinear reduction. The integer tables are consumed through the supplier's invariant maps.

## Layer 5: Eisenstein integers and the quadratic obstruction

### 5.1 Eisenstein dyadic place

Let ζ²+ζ+1=0 and R=ℤ[ζ] inside K=ℚ(√−3). Using the supplied cyclotomic arithmetic, identify the completion O at the unique dyadic prime as the unramified quadratic extension of ℤ₂, with fraction field E=ℚ₂(√−3) and residue field 𝔽₄.

(CDHHLMNNS-III-v4, Example 2.3.14, p. 46; CDHHLMNNS-III-v4 line 2150.)

The cyclotomic inertia and ramification formulas give residue degree two and ramification index one at two. The completion preserves these invariants. The relation ζ=(−1+√−3)/2 identifies its quadratic fraction field; the irreducible reduction of t²+t+1 selects the dyadic place.

**Checks.**

- At 0 and 1, t²+t+1 has values 1 and 1 modulo two, so it has no root. Thus (2) gives 𝔽₄, one prime, and residue degree two.
- The discriminant is −3, odd, and the derivative 2t+1 reduces to one. The extension at two is unramified, in addition to the separate irreducibility argument for inertness.
- For ℚ(√−7), the integral polynomial t²+t+2 reduces to t(t+1) modulo two. Two is unramified but split; a discriminant test alone cannot prove inertness.
- The norm of a+bζ is a²−ab+b². Norm one has the six solutions (1,0),(−1,0),(0,1),(0,−1),(1,1),(−1,−1); their unit squares have index two.

*Needs:* the Mathlib cyclotomic declarations in the exact supplier contracts, fraction fields and completions; §2.1.

### 5.2 Eisenstein symmetric Witt group

For R=ℤ[ζ₃], Ws(R)≃ℤ/4 generated by u=⟨1⟩. Under generic and completed base change this generator still has order 4.

(CDHHLMNNS-III-v4, Example 2.3.14, p.46, line 2159; the proof here uses GlobalQuadraticForms §§8.1–8.3.)

Inject Ws(R) into W(K). A unimodular determinant is a unit; modulo squares the units are ±1. At every odd finite place unit diagonalization gives local Hasse sign +1. There are no real places, and reciprocity forces the remaining dyadic Hasse sign. The Hamilton obstruction of 4u disappears after the quadratic extension at two and at the complex place. Compare forms after hyperbolic stabilization using the supplied number-field classification. This gives four classes and identifies the integral and completed generators.

**Checks.**

- The class 2u has signed determinant −1. Since −1 is nonsquare in K and in E, 2u≠0.
- The class 4u=⟨1,1,1,1⟩ has determinant 1 and Hasse invariant +1 at every place, and the hyperbolic ⟨1,−1,1,−1⟩ has determinant 1 and Hasse invariant (−1,−1)_v. At odd places −1 is a unit and this is +1; at the dyadic place (−1,−1)_E=(−1,N_(E/ℚ₂)(−1))_(ℚ₂)=(−1,1)=+1. The invariants agree everywhere, so 4u=0, whereas over ℚ₂ itself (−1,−1)=−1 keeps 4u≠0. The generator therefore has order four, not two.
- The classes 0,u,2u,3u have pairs (rank parity,signed determinant) respectively (0,1),(1,1),(0,−1),(1,−1). Their completed images remain distinct.

*Needs:* §§0.2 and 5.1; `IsCyclotomicExtension.Rat.three_pid` and `IsCyclotomicExtension.Rat.Three.Units.mem`; GlobalQuadraticForms §4.4 and §§8.1–8.3; QuadraticFormInvariants Layer 6.

### 5.3 Unramified restriction

For E=ℚ₂(√−3), let θ′:W(ℚ₂)→W(E) be restriction. Prove ker θ′=(c)=⟨c,4u⟩≃(ℤ/2)² and identify its cokernel with ann(c)=⟨2u,c⟩≃ℤ/4⊕ℤ/2 by Scharlau transfer for λ(1)=0, λ(√−3)=1. The same kernel and cokernel describe θ:Ws(ℤ₂)→Ws(O), because two is a uniformizer in both rings and the symmetric residue map Ws(𝔽₂)→Ws(𝔽₄) preserves rank parity. In the field sequence the ordered basis is (1,s) with s²=−3, the transfer kernel is the restriction image, and the transfer image is ann(c).

(CDHHLMNNS-III-v4, Example 2.3.14, p. 47; CDHHLMNNS-III-v4 line 2168.)

Apply the supplied quadratic-extension restriction/transfer sequence with a=−3. Section 4.1 gives its ideal and annihilator explicitly. Compare the two symmetric DVR residue sequences; their right vertical rank-parity map is an isomorphism, so the kernel/cokernel lemma gives the integral comparison. The identification of the cokernel with ann(c) retains the functional λ, which fixes the transfer used in §5.5.

**Checks.**

- c and 4u restrict to zero; u has image of order four. The 16-element integral source therefore has image of order four and kernel of order four.
- Multiplication by c kills exactly the eight coordinates with a even and b=0. This gives the eight-element restriction cokernel through transfer, rather than the four-element restriction kernel.
- The symmetric 𝔽₂→𝔽₄ map sends ⟨1⟩ to ⟨1⟩ and is the identity on ℤ/2. Replacing it by the quadratic zero map would invalidate the kernel/cokernel comparison.
- On the ordered basis (1,s), λ(a+bs)=b, so λ((1+s)²)=λ(−2+2s)=2. The opposite functional −λ gives −2 and the half functional λ/2 gives 1, so this value fixes the normalization and not only the kernel of λ.
- Transfer of the unit line ⟨1⟩ along λ has Gram matrix [[λ(1),λ(s)],[λ(s),λ(s²)]]=[[0,1],[1,0]], a hyperbolic plane with Witt class zero, as exactness at W(E) requires of a restricted class. The ordinary trace Tr(a+bs)=2a gives instead diag(2,−6), whose signed determinant 12 is the nonsquare class 3 in ℚ₂, so its transfer of ⟨1⟩ is nonzero.
- Transfer of the line ⟨s⟩ along λ has Gram matrix [[λ(s),λ(s²)],[λ(s²),λ(s³)]]=diag(1,−3), the class ⟨1,−3⟩=2u+c of §4.1. Along −λ it is ⟨−1,3⟩=6u+c. The two differ by 4u≠0, so the sign of λ is visible in the cokernel identification, which transfer of the class t of §5.4 alone cannot detect.

*Needs:* §§0.3, 4.1 and 5.1; native Witt base change and Scharlau transfer; QuadraticFormInvariants Layer 9 and gap:quadratic-extension-witt-exactness.

(Lam-2005, VII Theorem 3.5; cited by locator only, with the exact application specified in CDHHLMNNS-III-v4 lines 2175–2182.)

### 5.4 Eisenstein Arf base change

The map Wq(ℤ₂)→Wq(O) is zero, since its residue degree is 2. Let t be the image in Ws(O) of the Arf-one form q=x²+xy+ζy² over O. It has order 2 and signed determinant d=1−4ζ. Norm_(E/ℚ₂)(d)=21 is not a ℚ₂ square. Consequently t∉⟨u⟩⊂Ws(O): the only possible nonzero order-two class there is 2u, whose signed determinant −1 has square norm. Thus ⟨u⟩∩⟨t⟩=0.

(CDHHLMNNS-III-v4, Example 2.3.14, diagram pp. 46–47, corrected by the finite-field Arf scalar-extension calculation; CDHHLMNNS-III-v4 line 2159.)

Complete rigidity and the extension-degree law make Wq(ℤ₂)→Wq(O) zero, since the residue degree is two. The new trace-one plane gives the nonzero class of Wq(O). Its polar class has order two by injectivity of quadratic-to-symmetric comparison over the mixed-characteristic DVR. A square in E has square norm in ℚ₂. Comparing norms of signed determinant classes therefore excludes equality of t with either zero or 2u.

**Checks.**

- The 𝔽₂ Arf-one plane x²+xy+y² has value zero at (ζ,1) over 𝔽₄. Its scalar extension is hyperbolic; the quadratic residue map is zero.
- For the new plane x²+xy+ζy², the trace of ζ is ζ+ζ²=1, so it is the nonzero local quadratic class. Its full polar is [[2,1],[1,2ζ]].
- The polar has plain determinant 4ζ−1 and signed determinant 1−4ζ. The norm of the latter is 21≡5 modulo eight, a nonsquare ℚ₂ unit.
- The only nonzero order-two class in ⟨u⟩ is 2u, with signed determinant −1 and norm one. The norm-square obstruction separates it from t, proving the intersection is zero.

*Needs:* §§0.4, 2.4 and 5.1–5.3; signed determinant in the even-rank Witt ideal; the ℚ₂ unit-square criterion.

### 5.5 Eisenstein L-groups

For R=ℤ[ζ₃], identify the positive-sign periodic symmetric groups in residues 0,1,2,3 modulo four as ℤ/4,ℤ/2,0,0 and the quadratic groups as 0,0,ℤ/2,ℤ/4. In particular Wq(R)=0 and A(R)=ℤ/4 although d=1. These identifications use the zero quadratic Arf scalar-extension map and the additional local quadratic image, not only the symmetric restriction cokernel.

(CDHHLMNNS-III-v4, Example 2.3.14, pp. 46–47; corrected calculation from Proposition 2.3.9 and finite Arf base change; CDHHLMNNS-III-v4 line 2183.)

Use the completion pullback Lq(R)→Lq(O) over Ls(R)→Ls(O) in degree zero. Its Mayer–Vietoris sequence identifies Lq₀(R)=Wq(R) with the kernel of Wq(O)⊕Ws(R)→Ws(O), because the boundary from Ls₁(O) vanishes: Ls₁(R)→Ls₁(O) is the identity of Ws(𝔽₄) under the residue descriptions of §1.2, so Lq₁(O)⊕Ls₁(R)→Ls₁(O) is onto (CDHHLMNNS-III-v4, proof of Proposition 2.3.9, step iv, line 2070). Both maps into Ws(O) are injective, since Ws(R)=ℤ/4 maps onto ⟨u⟩ of order four and Wq(O)=ℤ/2 onto ⟨t⟩ of order two; hence ⟨u⟩∩⟨t⟩=0 makes the kernel zero. In the native ℚ₂ coordinates, θ kills c and 4u, so its integral image is precisely the global subgroup ⟨u⟩. Under the transfer identification of its cokernel with ann(c), the additional local quadratic image has class c. Thus A=ann(c)/⟨c⟩, generated by 2u of order four. Apply the supplied symmetric and quadratic tables and Pic(R)=0.

**Checks.**

- The global symmetric image ⟨u⟩ has order four and the local quadratic image ⟨t⟩ has order two; their intersection is zero. The degree-zero pullback kernel is zero, hence Wq(R)=0.
- The symmetric restriction cokernel is ℤ/4⊕ℤ/2. Transfer sends t to c, so the additional quotient is ⟨2u,c⟩/⟨c⟩=ℤ/4, not ℤ/4⊕ℤ/2.
- The transferred polar matrix has determinant 21 and diagonalization ⟨1,−1,4,−21/4⟩. Removing the hyperbolic pair gives ⟨1,−21⟩=c because −7≡1 modulo eight is a ℚ₂ square.
- Pic(R)/2=0 and d=1, so the supplied tables give quadratic degree two ℤ/2 and degree three A(R)=ℤ/4. A zero parity quotient at d=1 is compatible with this nonzero obstruction.

*Needs:* §1.2, §§3.1–3.2 and 5.1–5.4; `IsCyclotomicExtension.Rat.three_pid` and `ClassGroup.equivPic`; the supplied Dedekind tables and comparison pullback of ArithmeticKTheory §3.5.

### Examples

Let s=√−3 and ζ=(−1+s)/2. Transfer the polar of q=x²+xy+ζy² along λ(1)=0, λ(s)=1 using the ordered basis (1,s) in each coordinate. Its symmetric matrix is

| | | | |
| --- | --- | --- | --- |
| 0 | 2 | 0 | 1 |
| 2 | 0 | 1 | 0 |
| 0 | 1 | 1 | −1 |
| 1 | 0 | −1 | −3 |

Its determinant is 21. A rational diagonalization is ⟨1,−1,4,−21/4⟩; after removing the hyperbolic pair its Witt class is c. The source's Example 2.3.14 uses an identity on the quadratic ℤ/2 residue factor, while absolute trace makes that arrow zero. The symmetric arrow remains the identity. Retaining the two distinct arrows gives the groups above. (CDHHLMNNS-III-v4, Example 2.3.14, pp.46–47, lines 2159–2182; corrected arithmetic derivation in §§5.3–5.5.)

### Dependencies

The Eisenstein ring calculation and the supplied global classification establish its symmetric group. The local restriction uses the exact quadratic-extension transfer contract and the explicit ℚ₂ arithmetic. The quadratic map uses complete rigidity and finite-field Arf base change. The final quotient needs all three images: global symmetric, restricted integral symmetric and new local quadratic. The number-field table assembles these computations; no splitting of a general degree-three extension is used.

## Downstream consumers

Hermitian arithmetic over Dedekind rings can use the explicit residue coordinates, completion decomposition, general quadratic rigidity, and the maps in the total-cokernel extension. Integral classification and local-global comparisons can use the parity quotient as an obstruction to replacing quadratic by symmetric arithmetic at two. The integer and Eisenstein examples provide two different one-dyadic-prime obstruction groups, with the same normalized Arf and rank-parity arrows. Higher arithmetic GW computations consume the supplied periodic L-tables together with these integral comparison maps; they do not turn periodic Ls into genuine Lgs.

## Worked examples

| Ring | d | A(R) | Symmetric residues 0,1,2,3 | Quadratic residues 0,1,2,3 |
| --- | --- | --- | --- | --- |
| ℤ | 1 | 0 | ℤ, ℤ/2, 0, 0 | ℤ, 0, ℤ/2, 0 |
| ℤ[1/2] | 0 | 0 | Ws(R), 0, 0, 0 | Wq(R), 0, 0, 0 |
| ℤ[ζ₃] | 1 | ℤ/4 | ℤ/4, ℤ/2, 0, 0 | 0, 0, ℤ/2, ℤ/4 |

For every Dedekind R of fraction characteristic different from two, the supplied symmetric degree-three term is coker ∂₀; for global K it is Pic(R)/2. The supplied quadratic degree-three group is an extension of that term by A(R), not a selected direct sum. For a characteristic-two global fraction field, §1.1 instead gives alternating groups Ws(R), Pic(R)/2 with period two. These formulas retain the distinction between a characteristic-two fraction field and a characteristic-two residue field of a mixed-characteristic ring.

## References

All source locators use the editions below. Statements and arithmetic derivations are expressed in this roadmap's own words.

- **CDHHLMNNS-III-v4.** B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus and W. Steimle, [Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/abs/2009.07225v4), arXiv v4, 2026, 63 pages. Sections 2.2–2.3, pp.36–48; especially Lemma 2.2.9, Propositions 2.3.1, 2.3.6, 2.3.7 and 2.3.9, and Examples 2.3.13–2.3.14. Extracted locators are cited as CDHHLMNNS-III-v4 line N. The journal pagination is not used. The annihilator, inertness argument and quadratic Eisenstein values are given with the arithmetic corrections proved above.
- **CDHHLMNNS-II-v5.** The same nine authors, [Hermitian K-theory for stable ∞-categories II: Cobordism categories and additivity](https://arxiv.org/abs/2009.07224v5), arXiv v5, 2025. Proposition 4.5.5, pp.108–110; CDHHLMNNS-II-v5 line 5253. The coefficient comparison, central Ore maps, cofiber equivalence and Tate-boundary conditions are retained in the supplier contract.
- **Wall-1970.** C. T. C. Wall, [On the classification of hermitian forms. I. Rings of algebraic integers](https://www.numdam.org/item/CM_1970__22_4_425_0/), Compositio Mathematica 22 (1970), 425–451. Lemma 1, p.427, and Theorem 2, pp.428–429; Wall-1970 lines 104, 132 and 155.
- **Wall-1973.** C. T. C. Wall, [On the classification of hermitian forms. III. Complete semilocal rings](https://doi.org/10.1007/BF01418851), Inventiones Mathematicae 19 (1973), 59–71. Corollary 1, Lemma 1, Proposition 4 and Lemma 5. Uncertified; cited by locator only. The precise comparison needed is also described in CDHHLMNNS-III-v4 lines 2019–2021.
- **CMM.** D. Clausen, A. Mathew and M. Morrow, [K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/abs/1803.10897v2), arXiv v2, 2020. Theorem 3.15, p.21, and Remark 5.6, p.39; CMM lines 892 and 1659–1674.
- **Stacks.** The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu), Chapter 15, More on Algebra, Lemmas 15.51.14 and 15.51.15, tags 0AH2 and 0AH3: regularity of ideal-adic completion of a G-ring and the G-ring property of its henselization along an ideal, for the SchemeAndStackFoundations contract of §2.5.
- **Lam-2005.** T. Y. Lam, [Introduction to Quadratic Forms over Fields](https://doi.org/10.1090/gsm/067), GSM 67, AMS, 2005. VII Theorem 3.5 for restriction/transfer exactness; VI Theorem 2.29 for the local finite two-primary Witt group. Uncertified; cited by locator only.
- **Scharlau-1985.** W. Scharlau, [Quadratic and Hermitian Forms](https://doi.org/10.1007/978-3-642-69971-9), Springer, 1985. Chapter 6 §6, Theorem 6.11, for the global Witt residue cokernel consumed from ArithmeticKTheory §3.5. Uncertified; cited by locator only.
