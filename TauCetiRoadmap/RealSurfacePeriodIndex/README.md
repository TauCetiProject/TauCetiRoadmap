# Roadmap: period and index on real surfaces

**Summary.** Build Olivier Benoist's solution of the period-index problem for function fields of real algebraic surfaces (B19), starting from the Brauer groups, central simple algebras, orderings, real closed fields and quadratic forms of the pinned Mathlib and Tau Ceti. Layer 0 develops the real-function-field theory the argument needs: the space of orderings with the Harrison topology, real closures at an ordering, signatures, the Elman–Lam u-invariant, the Tsen–Lang theorem, the period and index of a Brauer class, and the classical inputs of Witt, Springer, Amer–Brumer, Albert, Elman–Lam and Pfister. Layers 1–2 set up real evaluation and the Kummer and topological Brauer sequences of real surfaces and give Benoist's Hodge-theoretic proof of de Jong's theorem (per = ind for function fields of complex surfaces) together with the norm bound ind | 2 per over real closed fields. Layers 3–6 construct ramified double covers with prescribed real topology, kill a period-two class on such a cover by a Noether–Lefschetz argument with Green's infinitesimal criterion over ℝ, and transport the Kummer data along the family. The end theorems are: period equals index on real surfaces without real points (Theorem 0.3) and for classes vanishing at every real point (Theorem 0.4); the topological criterion for period equals index of unramified classes, with the dichotomy ind ∈ {per, 2 per} (Theorem 0.5); the classification of real Enriques surfaces carrying classes with ind ≠ per (Theorem 0.6); the failure of the criterion over the real Puiseux field (Proposition 0.7); isotropy of quadratic forms of rank ≥ 5 over real surfaces without real points (Theorem 0.10); the Elman–Lam bound u ≤ 4 in transcendence degree 2 with equality for function fields of real surfaces (Theorem 0.12); and rational points on degree-four del Pezzo surfaces over real curves without real points (Theorem 0.13).

## Scope and ownership

This roadmap owns everything specific to Benoist's argument: the ramified double covers and their topology, the corrected evaluation term on the avoided set with the exact criteria that replace the source's Propositions 4.4 and 4.5 for a given cover, the source's Proposition 6.6, the Noether–Lefschetz locus of the double-cover family, the real-locus control by branch sections with prescribed signs, the degree-two splitting, the induction on the period, the obstruction for covers of even degree, the real Enriques criterion and the Puiseux counterexample. It also owns the inputs no other roadmap states:

- the real-function-field theory of Layer 0 (the space of orderings with the Harrison topology, real closures at an ordering, the Artin–Lang theorem (§0.5a), the signature as a function of a varying ordering, the clopen survival locus of a Brauer class, the Elman–Lam u-invariant and Pfister's local–global principle identifying it with the torsion-form invariant (§0.6a)), the Tsen–Lang theorem (§0.7: C_i fields, the Lang–Nagata theorem for systems of forms, closure under algebraic and transcendental extensions), the period and index of a Brauer class of a field (§0.12), and the classical theorems of Witt, Springer, Amer–Brumer, Albert, Elman–Lam and Pfister's criterion; Layer 0 never imports Layers 1–9;
- the Kummer and topological Brauer sequences of real varieties with the real class of a two-torsion line bundle (the source's Lemma 2.1), invariance of period and index under extension of algebraically closed fields, and de Jong's reduction to unramified classes with its two local inputs: Azumaya models of prescribed degree over regular schemes of dimension at most two, and Saltman's local form of a class whose ramification has normal crossings on a two-dimensional excellent regular local ring;
- the weight-two variation of a family of surfaces with Griffiths' formula, Voisin's open cone, open cones meeting lattice cosets, the Kodaira–Spencer factorisation through normal bundles, Green's criterion over ℝ and the stratification of the double-cover family;
- the anticanonical model of degree-four del Pezzo surfaces, and the classical real-geometric inputs of Bochnak–Coste–Roy (Nash approximation), Bröcker (real divisors with prescribed signs) and Colliot-Thélène–Parimala (prescribed evaluation functions).

The following material has other owners and is consumed through their interfaces.

- **Equivariant and real-locus cohomology.** Borel equivariant Betti and semialgebraic cohomology of real varieties, the real–complex exact sequences, the canonical real-locus decompositions, Krasnov's equivariant cycle class cl and the Borel–Haefliger class cl_R, equivariant purity and pushforward are MotivesAndAlgebraicCycles §§7.6a–7.6b; the complex and real Lefschetz (1,1) theorems are §7.8; the real Picard image and cl_R(K) = w₁ on real Enriques surfaces are §7.10; Gersten complexes and residues are §0.5b.
- **Double-cover topology.** Free descent above twice the dimension is AlgebraicTopologyPartII Layer 6 (consumed there from MotivesAndAlgebraicCycles §7.6a); the Bockstein in canonical coordinates is §7.4, and its sign-twisted form β + e ∪ (·), with e = ω for the real–complex covering, is §14.2; the self-intersection class γ and the canonical splitting are §§9.2–9.3; the corrected localisation sequence and its self-duality are §§10.3 and 10.5; γ = w and the surface identities for w₁ are §12.1; embedded loop representatives are §12.2; sign local systems, the double-cover extension and the ramified trace triangle are §§14.1–14.3; permutation quotients, the trace-zero operator, trace-quotient lifts, the corrected integral lift, cyclic reduction and the circle extension are §§15.1–15.6, the circle extension obtaining the vanishing of the positive equivariant Ext stalks of a free permutation stalk on a fixed circle, its truncation input, from MotivesAndAlgebraicCycles §7.6a; equivariant Ehresmann transport, stratified pair transport, the finite-index equivariant lattice and the double-cover chase are §§16.1–16.4.
- **Brauer groups of schemes and fields.** Brauer groups of schemes with `brauer_field`, the Kummer sequence, Hilbert 90 and Tsen's theorem for one-variable function fields are SchemeAndStackFoundations §§2.11, 2.16 and 2.22; Brauer residues, purity and residues of pullbacks are HeightsRationalPointsAndObstructions §2.16b; the corestriction of Brauer classes along a finite locally free morphism, with cor ∘ res equal to multiplication by the degree, is HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`), applied here to Spec L → Spec K for finite field extensions L/K. The index of a central simple algebra and a splitting field of that degree are Tau Ceti's `TauCeti.Algebra.index` and `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; the index through maximal subfields is SemisimpleAlgebras Layer 6. The coniveau spectral sequence of étale cohomology with supports is PurityForFlatCohomology §8.4 and Gabber's absolute purity is LefschetzPencilsAndVanishingCycles §0.10; together they give the residue complex and purity of a two-dimensional excellent regular local ring used in §1.7. Reflexive hulls are SchemeAndStackFoundations §0.6, and freeness of reflexive modules over regular local rings of dimension at most two is Tau Ceti's `TauCeti.IsRegularLocalRing.free_of_isReflexive`.
- **General geometry.** Principalization, SNC compactification and resolution are ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2 and 7.8; projective bundles and ample powers are AlgebraicModuliForArithmeticGeometry §§1.1 and 1.4; the remaining scheme theory (relative Spec, depth, Noetherian approximation, Leray, quasi-coherent and Serre duality, Picard groups, formal functions, blow-ups, Bertini, SNC divisors, projective bundles, intersection numbers on surfaces) is SchemeAndStackFoundations by section; blow-ups of surfaces are StableReduction Layer 4; miracle flatness is ModularCurves §0.9; purity of the branch locus is PurityOfBranchLocus §2.3.
- **Complex geometry.** Ehresmann's theorem, Gauss–Manin connections, relative Hodge bundles, Riemann existence and the Artin comparison over ℂ are ComplexComparisonPartII §§C5.2, C5.3, C6.2 and C6.3; the Kodaira–Spencer class of a smooth morphism is PELModuli M2.10; the carrier of variations of Hodge structure is ShimuraData §3.1; integral weak Lefschetz and the cohomological dimension of affine varieties are AffineMorseLefschetz A5 and A3; singular cohomology with products and duality is AlgebraicTopology Stage 6.
- **Quadratic forms and real algebra.** Square classes, diagonal calculus, hyperbolic planes, Witt theory, quaternion algebras, the Witt ring and the Brauer-valued invariants are QuadraticFormInvariants Layers 0, 1, 2, 4 and 5. The signature over an ordered field (inertia indices, isometry invariance, additivity and multiplicativity, Sylvester's law over real closed fields) is Mathlib's `sigPos` and `sigNeg` with Tau Ceti's `TauCeti.RegularFormClass.signature`; this roadmap adds only its dependence on a varying ordering (§0.4). Totally isotropic subspaces, in which the zero-total-signature condition is phrased, are Tau Ceti's `QuadraticMap.IsTotallyIsotropic`. Real closures of ordered fields, the extension of preorderings to orderings and the algebraic closedness of R(√−1) for real closed R are Tau Ceti's `TauCeti.RealClosure.exists_realClosure`, `Subsemiring.IsPreordering.exists_le_isOrdering` and `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`, the formal form of RealAlgebraicGeometry Layer 1; the converse criterion, that a field in which −1 is not a square is real closed once adjoining √−1 gives an algebraically closed field, is Tau Ceti's `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`. Quantifier elimination and model completeness for real closed ordered fields, the transfer step of the Artin–Lang theorem (§0.5a), are K3BlochGroups §5.8.
- **Enriques surfaces and Puiseux series.** The Enriques condition (a smooth proper geometrically connected surface with numerically trivial canonical bundle and χ(O) = 1, stable under field extension) is WeilConjectures WC.7; the characteristic-zero invariants of Enriques surfaces are EnriquesSurfaces §§1.1, 1.3 and 1.4; the Puiseux field and its ramified levels are FormalLaurentPuiseux L4, and its algebraic closedness over an algebraically closed field of characteristic zero is the root theorem of FormalLaurentPuiseux L5; all three are already in Tau Ceti and are consumed in that form, `TauCeti.puiseuxField`, `LaurentSeries.ramifiedEmbedding` and `TauCeti.puiseuxField.instIsAlgClosed`; only its order and its real closedness are planned here (§9.11).

The avoided set Ψ ⊃ Θ is allowed to contain components where the class evaluates to 0, and the printed computation of the source omits the factor [α̃]₀ in the boundary component on Ψ (§5.4, source correction E3). For a given double cover, the source's Propositions 4.4 and 4.5 are replaced by exact criteria under their own hypotheses: the topological obstruction vanishes if and only if the corrected term ([α̃]₀ ∪ cl_R(L(R)))|_Ψ is the restriction to Ψ of the degree-one real component [ξ]₁ of a class ξ ∈ H²_G(S(ℂ), ℤ(1)) (§5.5), and the integral pushforward adjustment exists if and only if that term is the Borel–Haefliger class of a line bundle (§5.8). Both hold when the evaluation is constant on Ψ or cl_R(L(R)) vanishes on Ψ, and the first fails for a cover of a real Enriques surface with mixed evaluation (§5.5), so the unconditional form of Proposition 4.4 is false and is not planned. The source's Proposition 6.6, which constructs the cover, is planned in its stated generality (§6.13): taking the auxiliary ample bundle of §4.9 to be a square makes cl_R(L(R)) = 0. The Tsen–Lang theory of §0.7 (C_i fields, the Lang–Nagata theorem for systems of forms, algebraic and transcendental extensions) is owned here; QuadraticFormInvariantsPartII consumes it for its Layer 5. Lang's conjecture (function fields of i-dimensional real varieties without real points are C_i) and Pfister's conjecture (u ≤ 2^i in transcendence degree i) are the context of Theorems 0.10 and 0.12 and are not used; Lieblich's bound ind | per² over finite fields (the source's Theorem 0.2) is background.

## Conventions

ℝ is the field of real numbers except where an arbitrary real closed field is named (Layer 0, §2.10, Layer 9). G = Gal(ℂ/ℝ) acts on X(ℂ) by complex conjugation σ with fixed locus X(ℝ). H^i(Y) means H^i(Y, 𝔽₂). ℤ(j) is ℤ with σ acting by (−1)^j (Benoist's i^jℤ), and ω ∈ H¹_G(pt, ℤ(1)) ≅ ℤ/2 is the nonzero class. Equivariant cohomology is Borel equivariant sheaf cohomology as constructed in MotivesAndAlgebraicCycles §7.6a. For a smooth integral X, Br(X) = H²_ét(X, 𝔾_m) ⊂ Br(k(X)). For an equivariant class ξ, [ξ]_i is its degree-i real component: restrict to X(ℝ), use the canonical decomposition H^k_G(X(ℝ), 𝔽₂) = `⊕_{i ≤ k} H^i(X(ℝ))`, and project. Θ(α) is the nonzero evaluation locus of α (§1.4), Ψ ⊃ Θ the set a double cover must avoid, and Ξ = S(ℝ) ∖ Ψ.

Brauer groups are written additively in the prose and multiplicatively in Lean (Tau Ceti's `TauCeti.BrauerGroup.instCommGroup` on Mathlib's `BrauerGroup`). The period per(α) is the order of α; in Lean, for a central simple algebra A of class `TauCeti.BrauerGroup.mk A`, it is `orderOf (TauCeti.BrauerGroup.mk A)`. The index ind(α) is the index of any central simple algebra of class α (§0.12); in Lean it is `TauCeti.Algebra.index K A`, and the headline statements quantify over all central simple algebras A, which is the same as quantifying over all classes because every class has a representative.

A field K is the function field of an integral surface over ℝ exactly when K is a finitely generated field extension of ℝ of transcendence degree 2; in Lean this is `Algebra.EssFiniteType ℝ K` together with `Algebra.trdeg ℝ K = 2`. The upper bound u ≤ 4 of Theorem 0.12 and the isotropy statements of Theorems 0.10 and 0.13 (§§7.8, 7.11, 7.13) hold for every field of the given transcendence degree over ℝ and are stated without finite generation; the other field-theoretic headline statements keep `Algebra.EssFiniteType`, which their routes through projective models use. K is nonreal when −1 is a sum of squares in K, which in Lean is `¬ IsSemireal K`; for a smooth projective model S of K, K is nonreal exactly when S(ℝ) = ∅ (a real point x embeds K into the real field ℝ((z₁))((z₂)) through the completed local ring; conversely the Artin–Lang theorem, §0.5a). The Elman–Lam u-invariant counts forms of zero signature at every ordering, which by Pfister's local–global principle (§0.6a) are the forms with torsion Witt class; for nonreal fields it is the classical u-invariant. The zero-total-signature condition used by the Lean statements is `HasZeroTotalSignature` (§0.6), stated for quadratic forms on finite-dimensional vector spaces over a field in which 2 is invertible, and phrased through base change to real closed fields so that it needs no choice of diagonalisation.

Locators to B19 refer to the published version, printed pages 63–110. Statements are stated at the generality of the source unless a correction is recorded in "Source corrections".

## Exact supplier contracts

### From Mathlib

Mathlib at the pin of the content repository's lake manifest; file and line locators refer to that pin.

- `BrauerGroup` (Algebra/BrauerGroup/Defs.lean:100) is the quotient of `CSA K` by Brauer equivalence; it carries no group structure at the pin (Tau Ceti adds it).
- `Subsemiring.IsPreordering` (Algebra/Order/Ring/Ordering/Defs.lean:61) and `Subsemiring.IsOrdering` (same file, line 40), predicates on a subsemiring: a preordering contains all squares and not −1; an ordering S has S ∪ (−S) the whole ring, support S ∩ (−S) a proper prime ideal (so {0} over a field), hence contains all squares and not −1. Tau Ceti's extension and restriction lemmas are stated for them. The older `RingPreordering` and `RingPreordering.IsOrdering` (same file, lines 115, 287) are deprecated at the pin in their favour and are not used.
- Cone orders: `LinearOrder.ofAddSubmonoid` (the additive form of `LinearOrder.ofSubmonoid`, Algebra/Order/Group/Cone.lean:63: a pointed spanning additive submonoid M of an abelian group defines the linear order a ≤ b iff b − a ∈ M), `IsOrderedRing.ofSubsemiring` (Algebra/Order/Ring/Cone.lean:33: for a pointed subsemiring S the cone order of S is an ordered-ring order, with nonnegative cone S), `Subsemiring.IsPointed.nonneg` and `Subsemiring.IsSpanning.nonneg` (same file, lines 25 and 28: the nonnegative cone of an ordered ring is pointed, and it is spanning when the order is linear), `Subsemiring.IsOrdering.of_isPrime_supportIdeal` (Algebra/Order/Ring/Ordering/Defs.lean:54: a spanning subsemiring whose support ideal is prime is an ordering), `Subsemiring.IsPreordering.isPointed` (Algebra/Order/Ring/Ordering/Basic.lean:88: a preordering of a field is pointed) and `IsOrderedRing.toIsStrictOrderedRing` (Algebra/Order/Ring/Defs.lean:107: a nontrivial ordered ring without zero divisors is strictly ordered).
- Signatures over a linearly ordered field: the inertia indices `sigPos` and `sigNeg` (LinearAlgebra/QuadraticForm/Signature.lean:65, 98; the maximal dimension of a positive, respectively negative, definite subspace, defined as 0 on infinite-dimensional spaces), their isometry invariance `QuadraticMap.Equivalent.sigPos_eq` and `QuadraticMap.Equivalent.sigNeg_eq` (lines 121, 133), and the diagonal count `QuadraticForm.sigPos_of_equiv_weightedSumSquares` (line 243). What the pins lack is the space X_F of all orderings of a field with the Harrison topology, its functoriality and compactness, and the signature as a function of a varying ordering, with its independence of the real closure and its local constancy (§§0.1, 0.2, 0.4).
- `IsSemireal` (Algebra/Ring/Semireal/Defs.lean:38) and `IsRealClosed` (FieldTheory/IsRealClosed/Basic.lean:52): a real closed field is semireal, has x or −x a square for every x, and has a root of every odd-degree polynomial; the class does not fix an order relation. `IsRealClosed.isSquare_neg_of_not_isSquare` (line 80).
- Quadratic forms: `QuadraticMap.Anisotropic` (LinearAlgebra/QuadraticForm/Basic.lean:1054), `QuadraticForm.baseChange` (LinearAlgebra/QuadraticForm/TensorProduct.lean:128, which assumes 2 invertible in the base ring), the diagonalisation `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177) and Sylvester's law over ℝ `QuadraticForm.equivalent_signType_weighted_sum_squared` (LinearAlgebra/QuadraticForm/Real.lean:78); `CliffordAlgebra.even`.
- `QuadraticAlgebra` and `QuadraticAlgebra.basis` (Algebra/QuadraticAlgebra/Defs.lean:44, 387), with `QuadraticAlgebra.finrank_eq_two` (same file, line 405: over a ring with the strong rank condition, `QuadraticAlgebra` R a b has `Module.finrank` 2, being free on the basis 1, i) and `QuadraticAlgebra.discr_def` (Algebra/QuadraticAlgebra/Discriminant.lean:54: the discriminant of `QuadraticAlgebra` R a b, in which i² = a + b·i, is b² + 4a, so `QuadraticAlgebra` O b 0, where z² = b, has discriminant 4b), used for the local model of the finite double cover.
- `ModuleCat.matrixEquivalence` (RingTheory/Morita/Matrix.lean:187): for a ring R and a nonempty finite index type, R-modules and modules over the matrix ring over R are equivalent categories (Morita), used to compute commutants of Azumaya algebras in §1.6.
- Field theory: `Algebra.trdeg` (RingTheory/AlgebraicIndependent/Basic.lean:45, a cardinal), `Algebra.EssFiniteType` (RingTheory/EssentialFiniteness.lean:40), `Algebra.IsQuadraticExtension` (LinearAlgebra/Dimension/StrongRankCondition.lean:666: S is a free R-module of rank 2), `Algebra.IsAlgebraic`, `RatFunc`, `PowerSeries`, `HahnSeries`, `HenselianLocalRing`, `IsDiscreteValuationRing`, `IsLocalRing.maximalIdeal`, `MvPolynomial.IsHomogeneous`, and Krull's height theorem `Ideal.height_le_spanFinrank` (RingTheory/Ideal/KrullsHeightTheorem.lean:282).
- Topology and schemes: `TopologicalSpace.generateFrom`, `isCompact_univ_pi` (Topology/Compactness/Compact.lean:1172), `IsClosed`, `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Scheme.isBasis_affineOpens` (AlgebraicGeometry/AffineScheme.lean:303: the affine opens of a scheme form a basis of its topology), `AlgebraicGeometry.Scheme.functionField`, `Equiv.Perm.sign`, `ENat`, `TensorProduct`; `Module.finrank` and `Metric.ball` (finite-dimensional real vector spaces and their balls, §2.6).

Mathlib has no Brauer group of a scheme, no equivariant Betti cohomology of real varieties, no cycle class maps and no variations of Hodge structure at the pin; these come from the roadmaps below.

### From Tau Ceti

Tau Ceti at the pin of the content repository's lake manifest; file and line locators refer to that pin.

- `TauCeti.BrauerGroup.instCommGroup` (Algebra/BrauerGroup/Group.lean:174), the abelian group structure on `BrauerGroup` by tensor product, with the class map `TauCeti.BrauerGroup.mk` (line 139).
- `TauCeti.BrauerGroup.baseChange` (Algebra/BrauerGroup/BaseChange.lean:136), the restriction Br(K) → Br(L), a group homomorphism, for any field extension L/K (finite or not) in the same universe, with `TauCeti.BrauerGroup.baseChange_mk` (line 148: it sends the class of A to the class of L ⊗_K A).
- `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (Algebra/BrauerGroup/Division.lean:69): every class has a finite-dimensional central division representative.
- `TauCeti.Algebra.index` (Algebra/CentralSimple/Index.lean:99), the degree of the central division algebra in a Wedderburn presentation, with `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix` (line 112), `TauCeti.Algebra.index_dvd_deg` (line 196: the index divides the degree) and `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` (line 255); `TauCeti.Algebra.deg_baseChange` (Algebra/CentralSimple/BaseChange.lean:109: deg_L(L ⊗_K A) = deg_K A for any field extension L/K). The index of a central simple algebra is not the index of its Brauer class as the gcd of splitting degrees; §0.12 proves that they agree.
- `TauCeti.Quaternion.brauerGroupMulEquiv` (Algebra/BrauerGroup/Real.lean:102): Br(ℝ) ≃ ℤ/2.
- `TauCeti.IsRegularLocalRing.free_of_isReflexive` (RingTheory/RegularLocalRing/DimensionTwo.lean:202): over a regular local ring of Krull dimension at most 2, a finite reflexive module is free.
- `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk` (AlgebraicGeometry/Scheme/Regular/Scheme.lean:200): the local ring of a regular scheme at a point of codimension at most 2 is a unique factorization domain; so a surface smooth over a field, regular by `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (same file, line 90: the source of a smooth morphism to a regular scheme is regular; the spectrum of a field is regular by the instance `TauCeti.AlgebraicGeometry.isRegular_Spec`, line 118), is locally factorial.
- Serre's criterion `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (RingTheory/SerreCondition/Normal.lean:214): a Noetherian ring is normal (every localisation at a prime is an integrally closed domain) iff it satisfies (R₁) and (S₂).
- `TauCeti.brauerCohomologyEquiv` (Algebra/CrossedProduct/Comparison.lean:274), the crossed-product comparison Br(K) ≃ H²(G_K, K_s^×), with `TauCeti.brauerCohomologyEquiv_unique` (line 317).
- `TauCeti.hyperbolicPlane` (LinearAlgebra/QuadraticForm/Hyperbolic.lean:76) and `QuadraticForm.not_anisotropic_baseChange` (LinearAlgebra/QuadraticForm/BaseChange.lean:389).
- `QuadraticMap.IsTotallyIsotropic` (LinearAlgebra/QuadraticForm/TotallyIsotropic.lean:51): a submodule W is totally isotropic for Q when Q vanishes at every vector of W; the polar form then vanishes on W × W as well. It is the isotropy notion in `HasZeroTotalSignature`.
- Signature over a field with `LinearOrder` and `IsStrictOrderedRing`: `TauCeti.RegularFormClass.signature` (LinearAlgebra/QuadraticForm/RegularFormClass/Signature.lean:52) on isometry classes of nondegenerate forms, with `TauCeti.signature_formClass` (line 66: the signature of the class of a nondegenerate form is `sigPos − sigNeg`, for 2 invertible), `TauCeti.RegularFormClass.signatureHom` (line 140: a semiring homomorphism to ℤ, so additive under orthogonal sums and multiplicative under tensor products), `TauCeti.RegularFormClass.signature_hyperbolicClass` (line 111: the hyperbolic plane has signature 0), and Sylvester's law over an ordered real closed field `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq` (LinearAlgebra/QuadraticForm/Witt/Signature.lean:133).
- Orderings and real closures: `Subsemiring.IsPreordering.exists_le_isOrdering` (Algebra/Order/Ring/Ordering/Extension.lean:62: a preordering of a field lies in an ordering), `Subsemiring.IsOrdering.comap` (Algebra/Order/Ring/Ordering/Map.lean:64: orderings restrict along ring maps), `Subsemiring.IsOrdering.strictMono_comap` and `Subsemiring.IsOrdering.strictMono_iff_nonneg_iff_mem_comap` (same file, lines 105 and 85: for an ordering Q of a field L and a field embedding ι : F → L, ι is strictly monotone from the cone order of ι⁻¹(Q) to the cone order of Q, and an embedding from a linearly ordered field is strictly monotone for the cone order of Q exactly when ι⁻¹(Q) is its nonnegative cone), and `TauCeti.RealClosure.exists_realClosure` (FieldTheory/RealClosure/Basic.lean:120: a strictly ordered field K has a real closed, strictly ordered extension in the universe of K, algebraic over K, with a strictly monotone embedding).
- Quadratic extensions of real closed fields: `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension` (FieldTheory/RealClosure/QuadraticExtension.lean:63: if R is real closed and K/R is a quadratic extension, in the sense of Mathlib's `Algebra.IsQuadraticExtension`, then K is algebraically closed) and `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin` (same file, line 144: if −1 is not a square in a field R, and i is an element of a field extension of R with i² = −1 such that R(i) is algebraically closed, then R is real closed).
- The Puiseux field: `TauCeti.puiseuxField` (RingTheory/LaurentSeries/Puiseux/Basic.lean:70: for any field K, the intermediate field of `HahnSeries` ℚ K over K formed by the series lying in the image of some ramified level), `LaurentSeries.ramifiedEmbedding` (RingTheory/LaurentSeries/Ramified.lean:418: the level-n embedding K((X)) → `HahnSeries` ℚ K, an algebra map sending the coefficient of `X^k` to that of `t^{k/n}`) and `TauCeti.puiseuxField.instIsAlgClosed` (RingTheory/LaurentSeries/Puiseux/AlgClosure.lean:63: for K algebraically closed of characteristic zero, the Puiseux field of K is algebraically closed).

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.1 (quasi-coherent algebras and relative Spec), §0.6 (reflexive sheaves on locally Noetherian schemes, `isReflexive_iff_forall_stalk`, and on normal integral ones the reflexive hull `reflexiveHull` with `reflexiveHull.lift`), §0.9 (Noetherian approximation and spreading out), §0.17 (depth, Cohen–Macaulay modules; a hypersurface in a regular scheme is Cohen–Macaulay), §2.2 (Leray and Čech spectral sequences), §2.6 (quasi-coherent cohomology, `ample_serre_vanishing`, `projectiveSpace_cohomology`), §2.11 (Kummer sequence and Hilbert 90), §2.16 (`tsen_theorem`), §2.20 (Serre duality), §2.22 (Azumaya algebras, étale locally matrix algebras of locally constant degree, and Brauer groups of schemes: `mk_opposite`, `mk_tensor`, `mk_eq_zero_iff`, `brauer_field`, `brauer_regular_injectivity`, `brauer_kummer_sequence`, `brauer_henselian_local`), §3.4 (Picard groups through Weil divisors: `classGroup_picard_locallyFactorial`, Pic(X) → Cl(X) is injective on a normal integral locally Noetherian X and bijective when X is locally factorial, and `picard_excision_sequence`, ℤ → Cl(X) → Cl(U) → 0 is exact with 1 ↦ [D] for U the complement of an integral closed subscheme D of codimension one, and Pic(X) → Pic(U) is onto for X locally factorial; with the local factoriality of smooth surfaces these give the surjectivity of Pic(S) → Pic(V) for a dense open V of a smooth surface S, §1.9), §4.9 (formal functions and Stein factorisation), §4.11 (modifications, blow-ups, strict transforms), §4.13 (Bertini's smoothness theorem `bertini_smoothness`: a general member of a very ample linear system on a smooth variety over an infinite field is smooth; the regular schemes and Serre's criterion of that section are the Tau Ceti declarations of the contract above), §4.17 (strict normal crossings divisors), §5.4 (projective bundles and Chern classes), §5.10 (adjunction, Riemann–Roch and intersection numbers on smooth projective surfaces). Each is used as stated there.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

§5.1 (principalization of a coherent ideal, nonzero at every generic point, by smooth blow-ups that are isomorphisms off its zero locus), §6.2 (SNC compactification of a smooth quasi-projective variety), §7.8 (field resolution: a projective birational resolution, smooth over the field, of every generically reduced finite-type scheme in characteristic zero; its Lean form is `exists_resolution`, a proper surjective resolution with smooth source that is an isomorphism over the smooth locus).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§1.1 (the projective bundle P(E) = Proj Sym E with its twisting sheaves, quotient convention) and §1.4 (`amplePowersAndFixedTwists`: for A ample and B fixed on a proper scheme, B ⊗ A^m is very ample for m ≫ 0).

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§2.16b: `smoothBrauer_residueExact` (finitely many nonzero residues, exactness of 0 → Br X → Br U → ⊕ H¹(k(D), ℚ/ℤ) for every dense open U, removal of codimension two, and the generic injection Br X ↪ Br k(X), with no affineness assumed) and `pullbackMultiplicity` (pullback multiplies residues by the ramification index), for smooth varieties in characteristic zero; `brauerResidue_henselianFormula` (for a henselian discrete valuation ring, n invertible, an unramified character χ and a uniformiser t, the residue of (χ, t) is χ). §2.19a: `finiteFlatBrauerCorestriction` for a finite locally free morphism of rank d, with `pullback_comp` (corestriction after pullback is multiplication by d); for Spec L → Spec K and Br(Spec K) = Br(K) (SchemeAndStackFoundations §2.22, `brauer_field`) this is the corestriction `cor_{L/K}` with `cor_{L/K}(α_L) = [L : K]·α`.

### From TauCetiRoadmap.PurityForFlatCohomology and TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

PurityForFlatCohomology §8.4 (for a Noetherian scheme X of finite dimension, a closed Z ⊂ X and an abelian sheaf F on X_ét, the convergent coniveau spectral sequence `E_1^{a,b} = ⊕_{z ∈ Z, dim O_{X,z} = a} H^{a+b}_z(Spec O_{X,z}, F) ⇒ H^{a+b}_Z(X, F)`). LefschetzPencilsAndVanishingCycles §0.10 (Gabber's absolute purity: for a regular Noetherian scheme X, a closed immersion i : Z → X with Z regular of pure codimension c and n invertible on X, `Ri^!(ℤ/n) ≅ ℤ/n(−c)[−2c]` through the fundamental class of Z, with the localisation sequences and their boundaries). Both are used, with F = μ_l^⊗2 on the spectrum of a two-dimensional excellent regular local ring, in §1.7.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§0.5b (Gersten complexes of étale cohomology with residues; the differential squares to zero), §7.6a (Borel equivariant Betti cohomology of real varieties, semialgebraic over real closed fields, restriction to the real locus, norm, the real–complex exact sequences, Hochschild–Serre), §7.6b (equivariant purity and proper pushforward, the canonical mod-two and sign-twisted integral decompositions of the cohomology of the real locus with their coefficient reductions, including [ξ]_i = [ξ ∪ ω]_i; Krasnov's equivariant cycle class cl, the Borel–Haefliger class cl_R and the real-locus component equations, in particular cl_R(M) = [cl(M)]₁ for line bundles and compatibility of cl with Kummer boundaries), §7.8 (the complex and real Lefschetz (1,1) theorems), §7.10 (for a real Enriques surface, the image of cl_R : Pic → H¹(X(ℝ), 𝔽₂) is w₁(X(ℝ))^⊥, and cl_R(K_X) = w₁(X(ℝ))).

What MotivesAndAlgebraicCycles must provide (gap:picard-cokernel-torsion-free): for X smooth over ℝ, the cokernel of cl : Pic(X) → H²_G(X(ℂ), ℤ(1)) is torsion-free (BW20, Proposition 2.9), stated as a named result in §7.8, which already uses it inside its divisor theorem.

### From TauCetiRoadmap.AlgebraicTopologyPartII

Layer 6 (free descent: for X of dimension d over ℝ, restriction H^i_G(X(ℂ), M) → H^i_G(X(ℝ), M) is an isomorphism for i > 2d, consumed there from MotivesAndAlgebraicCycles §7.6a), §7.4 (component formula: the mod-two reduction of the ordinary equivariant integral Bockstein of a class with canonical components a_i has components β(`a_{i−1}`) + (k − i)a_i; it carries no sign twist), §9.2 (the class γ_X with γ_0 = 1), §9.3 (canonical splitting of the localisation sequence), §10.3 (corrected localisation sequence), §10.5 (its self-duality), §12.1 (γ_X = w(TX(ℝ)); for a compact surface, w₁ = 0 iff orientable and deg(w₁²) = χ mod 2), §12.2 (embedded loop representatives transverse to finitely many immersed curves and avoiding a finite set), §14.1 (sign local system of an equivariant double covering and the classification of double covers by H¹_G(S, 𝔽₂)), §14.2 (extension class e_L with β_L(x) = β(x) + e ∪ x; for the real–complex covering S × G → S the sign system is ℤ(1) and e = ω), §14.3 (ramified trace triangle), §15.1 (permutation quotient Q and the exact sequence 0 → p_*ℤ → ℤ ⊕ Q → ℤ/n → 0, under the adjunction hypotheses stated there, which hold for the generically finite maps of smooth surfaces used here), §15.2 (trace-zero operator ψ with ψ mod n = p*φ), §15.3 (trace-quotient lifting criterion), §15.4 (the corrected integral lift b = p*η − ψ(ζ), with the minus sign), §15.5 (reduction ℤ/n → 𝔽₂ in sign degrees one and two), §15.6 (circle extension and the degree-one component of φζ; its truncation step uses the vanishing of the positive equivariant Ext stalks of a free permutation stalk on a fixed circle, the finite-group Ext-stalk comparison it obtains from MotivesAndAlgebraicCycles §7.6a), §16.1 (equivariant Ehresmann transport), §16.2 (equivariant stratified pair transport, given invariant control data), §16.3 (finite index of the image of H²_G(T, ℤ(j)) in H²(T, ℤ(j))^G), §16.4 (double-cover chase comparison g(δ) + ζ ∪ ω = g(η₀ ∪ ω), with the plus sign and modulo the image recorded there).

What AlgebraicTopologyPartII must provide (gap:at2-stratified-pair-transport): for manifolds M and B with smooth involutions σ_M and σ_B, a smooth map f : M → B with f ∘ σ_M = σ_B ∘ f, and a closed subset A ⊂ M with a Whitney stratification each of whose strata is σ_M-invariant, such that f is proper on A and restricts to a submersion on every stratum, A has f-compatible control data invariant under σ_M, so that §16.2 applies without assuming them.

### From TauCetiRoadmap.AlgebraicTopology

Stage 6 (singular cohomology, cup products and manifold duality), used as stated there.

### From TauCetiRoadmap.ComplexComparisonPartII

§C5.2 (`ehresmannFibration`, `relativeBettiLocalSystem`, `GaussManin`, `relativeDeRhamBetti` for smooth proper families), §C5.3 (`properPureHodge`, `relativeHodgeBundles`: the Hodge filtration of a smooth proper family is by locally direct summands), §C6.2 (`riemannExistence`), §C6.3 (`artinComparison`: étale and Betti cohomology of a complex variety with finite coefficients agree).

What ComplexComparisonPartII must provide (gap:real-artin-comparison): for X of finite type over ℝ and a finite G-module M, a natural isomorphism H^i_ét(X, M) ≅ H^i_G(X(ℂ), M) compatible with cup products and with the boundary maps of short exact coefficient sequences (SCH94, Corollary 15.3.1), in §C6.3.

### From TauCetiRoadmap.PELModuli

M2.10 (the Kodaira–Spencer class of a smooth morphism f : X → S over U, the extension class of 0 → `f*Ω¹_{S/U}` → `Ω¹_{X/U}` → `Ω¹_{X/S}` → 0), used with U = Spec ℂ for the families of surfaces of §2.2; its fibre at a point is the Kodaira–Spencer map κ_b of §2.2 up to sign.

### From TauCetiRoadmap.ShimuraData

§3.1 (`Variation`, the carrier of a real or rational variation of Hodge structure on a complex manifold).

### From TauCetiRoadmap.AffineMorseLefschetz

A3, its Layer 3 (a smooth closed affine complex submanifold of complex dimension n has integral cohomology zero above degree n), and A5, its Layer 6 (integral weak Lefschetz: for a hyperplane section A of a projective variety X of pure dimension n containing its singular points, H_j(X, A; ℤ) = 0 for j < n).

### From TauCetiRoadmap.QuadraticFormInvariants and TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

QuadraticFormInvariants Layer 0 (square classes, diagonal calculus and chain equivalence), Layer 1 (hyperbolic planes and Witt theory), Layer 2 (quaternion algebras and the four-fold splitting criterion), Layer 4 (the Witt ring and the fundamental ideal) and Layer 5 (the Brauer-valued invariants, including the Clifford invariant); SemisimpleAlgebras Layer 6 (the Brauer group and splitting fields).

### From TauCetiRoadmap.RealAlgebraicGeometry and TauCetiRoadmap.FormalLaurentPuiseux

RealAlgebraicGeometry Layer 1 (adjoining √−1 to a real closed field gives an algebraically closed field, consumed as `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`; its real closures and preordering extension are consumed in their Tau Ceti form, `TauCeti.RealClosure.exists_realClosure` and `Subsemiring.IsPreordering.exists_le_isOrdering`). FormalLaurentPuiseux L4 (the ramified levels K((`t^{1/n}`)) inside `HahnSeries` ℚ K, the Puiseux field as their union, the common level of a finite family and the algebraicity of each level) and L5 (for K algebraically closed of characteristic zero, the root theorem: every nonconstant polynomial over the Puiseux field has a root at a finite level); the field, its levels and its algebraic closedness are consumed in their Tau Ceti form `TauCeti.puiseuxField`, `LaurentSeries.ramifiedEmbedding` and `TauCeti.puiseuxField.instIsAlgClosed`.

### From TauCetiRoadmap.K3BlochGroups

§5.8 (quantifier elimination for the theory of real closed ordered fields in the language of ordered rings, with its consequence that every ordered-field embedding between real closed fields is elementary for formulas with parameters in its domain), used in §0.5a for the inclusion of a real closed field R into a real closure of a function field over R. Only this model-theoretic statement is consumed, not the Bloch-group applications of that section.

### From TauCetiRoadmap.StableReduction, TauCetiRoadmap.ModularCurves and TauCetiRoadmap.PurityOfBranchLocus

StableReduction Layer 4 (blow-ups and intersection theory on surfaces), ModularCurves §0.9 (miracle flatness for finite morphisms between regular local schemes of equal dimension), PurityOfBranchLocus §2.3 (Zariski–Nagata purity of the ramification and branch loci of a finite cover of a regular scheme).

### From TauCetiRoadmap.WeilConjectures and TauCetiRoadmap.EnriquesSurfaces

WeilConjectures WC.7 (the Enriques condition: a smooth proper geometrically connected surface whose canonical bundle is numerically trivial and with χ(O) = 1; it is stable under field extension and isomorphism). EnriquesSurfaces §1.1 (for an Enriques surface over an algebraically closed field of characteristic ≠ 2: H²(O) = 0, the kernel of Pic → Num is {O, K}, and the canonical cover is a connected étale K3 double cover), §1.3 (for a complex Enriques surface, c₁ : Pic(S) ≅ H²(S(ℂ), ℤ)), §1.4 (π₁(S(ℂ)) = ℤ/2, H³(S(ℂ), ℤ) = ℤ/2 and the Brauer term of the 2-primary Kummer sequence is ℤ/2).

## How to read the build

Layer 0 is the theory of real function fields and their quadratic forms, including the Artin–Lang theorem that connects orderings with real points, and feeds every later layer. Layer 1 attaches to a Brauer class of a real surface its unramified locus, its Kummer and topological data and its real evaluation, and proves the two reductions behind de Jong's theorem. Layer 2 runs Benoist's strategy over ℂ (hypersurface families, weak Lefschetz, Voisin's cone, lattice cosets) to prove de Jong's theorem and the real norm bound. Layer 3 constructs the ramified double covers and computes their topology. Layers 4 and 5 are two independent branches built on it: Layer 4 is the geometry of the family of covers, finding a cover carrying a real-pointless curve whose Noether–Lefschetz locus has the expected dimension, and Layer 5 is the cohomology of a single cover, pulling a period-two class back to it and deciding exactly when its topological obstruction vanishes and its integral lift can be adjusted; Layer 4 comes first because the square auxiliary bundle it constructs is what makes the criteria of Layer 5 hold for the covers used later. Layer 6 joins the two branches: it controls the real locus of the branch curve, applies Green's criterion over ℝ and transports the Kummer data, giving the degree-two splitting. Layer 7 runs the induction on the period and proves Theorems 0.3, 0.4, the sufficient half of 0.5, 0.10, 0.12 and 0.13. Layer 8 proves the obstruction half of Theorem 0.5 from the topology of covers of even degree. Layer 9 applies the criterion to real Enriques surfaces (Theorem 0.6) and builds the Puiseux counterexample (Proposition 0.7). Each target's *Needs:* line lists what its statement and its suggested route use; a different route is not bound to it.

## Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant

The space of orderings of a field with the Harrison topology, its compactness and inverse limits; real closures at a specified ordering, built on Tau Ceti's real closures of ordered fields; the Artin–Lang theorem, which realises an ordering of a finitely generated domain by a real point; signatures of quadratic forms at orderings and the clopen locus of orderings where a Brauer class survives; the Elman–Lam u-invariant and the zero-total-signature predicate of the Lean statements, with Pfister's local–global principle identifying zero total signature with torsion in the Witt ring; the Tsen–Lang theorem; Witt's theorem on Brauer classes of real curves; Springer's theorem over complete discretely valued fields; the Amer–Brumer theorem; the period and index of a Brauer class; Albert's isotropy criterion; the Elman–Lam bound for fields with u(F(√−1)) ≤ 4; and Pfister's criterion in transcendence degree 2. Nothing in this layer refers to surfaces.

### 0.1 The space of orderings with the Harrison topology

F is a field; orderings are positive cones of total orders compatible with the field operations. The topology is generated by the subbasis H(a), a ∈ Fˣ; complements H(a)ᶜ = H(−a) are again basic.

For a field F, the space of orderings X_F is the set of positive cones P ⊂ F of field orderings, that is the subsemirings P of F with P ∪ (−P) = F and P ∩ (−P) = {0} (Mathlib's `Subsemiring.IsOrdering`; such a P contains all squares and not −1, so it is a preordering in the sense of `Subsemiring.IsPreordering`). For a ∈ Fˣ write a >_P 0 when a ∈ P, and H(a) = {P ∈ X_F : a >_P 0}. The Harrison topology on X_F is the topology generated by the sets H(a), a ∈ Fˣ. A field embedding ι : F → L induces the restriction map X_L → X_F, Q ↦ ι⁻¹(Q). X_F is empty exactly when F is nonreal, that is when −1 is a sum of squares in F. (BCR, Example 7.1.4 a), p. 135; B19, §6.4, p. 95; EKM, §33, p. 133)

A construction can proceed as follows.

1. Take the subsemirings P of F with `Subsemiring.IsOrdering` P; H(a) is the set of P containing a.
2. The complement of H(a) in X_F is H(−a), because for a ≠ 0 exactly one of a, −a lies in P; so each H(a) is clopen.
3. Restriction along ι sends an ordering Q of L to ι⁻¹(Q), an ordering of F (Tau Ceti `Subsemiring.IsOrdering.comap`), and pulls H(a) back to H(ι a); hence it is continuous.
4. Emptiness: an ordering contains all sums of squares and not −1; conversely if −1 is not a sum of squares, the sums of squares form a proper preordering, contained in an ordering by Zorn (Tau Ceti `Subsemiring.IsPreordering.exists_le_isOrdering`).

The definition has the following API.

- The type of orderings of F, the subsemirings P of F with `Subsemiring.IsOrdering` P.
- H(a) = {P : a ∈ P} for a ∈ Fˣ.
- The Harrison topology, generated by the sets H(a).
- Each H(a) is clopen, with complement H(−a).
- A field embedding ι : F →+* L gives a continuous map X_L → X_F, Q ↦ ι⁻¹(Q), with restrict id = id and restrict (ι' ∘ ι) = restrict ι ∘ restrict ι'.
- restrict ι ⁻¹' H(a) = H(ι a).
- X_F is empty iff ¬ `IsSemireal` F, that is iff −1 is a sum of squares.
- sign_P(a) ∈ {±1} for a ∈ Fˣ, with sign_P(ab) = sign_P(a) sign_P(b) and sign_P(c²) = 1.
- The cone order of an ordering P, a ≤ b iff b − a ∈ P (Mathlib `LinearOrder.ofAddSubmonoid`, P being pointed by `Subsemiring.IsPreordering.isPointed` and spanning), is an ordered-ring order (`IsOrderedRing.ofSubsemiring`), hence makes F a strictly ordered field (`IsOrderedRing.toIsStrictOrderedRing`) with nonnegative cone P. Conversely, the nonnegative cone of a linear order making F an ordered ring is pointed and spanning (`Subsemiring.IsPointed.nonneg`, `Subsemiring.IsSpanning.nonneg`), so its support is the prime ideal {0} and it is an ordering (`Subsemiring.IsOrdering.of_isPrime_supportIdeal`). Both directions are the pinned constructions.

**Checks.**

- The space of orderings of ℝ has exactly one element, the cone of nonnegative reals.
- The space of orderings of ℂ is empty, since −1 is a square.
- For K = ℚ(√2) (any field with finrank ℚ K = 2 containing a square root of 2), the space of orderings of K has exactly two elements, distinguished by the sign of √2.
- The preordering of sums of squares of the rational function field ℝ(t) is not an ordering: neither t nor −t is a sum of squares.

*Needs:* Mathlib `Subsemiring.IsOrdering`; Mathlib `Subsemiring.IsPreordering`; Mathlib `IsSemireal`; Mathlib `TopologicalSpace.generateFrom`; Mathlib `LinearOrder.ofAddSubmonoid`; Mathlib `IsOrderedRing.ofSubsemiring`; Mathlib `IsOrderedRing.toIsStrictOrderedRing`; Mathlib `Subsemiring.IsPreordering.isPointed`; Mathlib `Subsemiring.IsPointed.nonneg`; Mathlib `Subsemiring.IsSpanning.nonneg`; Mathlib `Subsemiring.IsOrdering.of_isPrime_supportIdeal`; Tau Ceti `Subsemiring.IsOrdering.comap`; Tau Ceti `Subsemiring.IsPreordering.exists_le_isOrdering`.

### 0.2 Compactness of the Harrison space and inverse limits

F is a field; the F_i form a directed family of subfields with union F.

For every field F the space X_F is compact, Hausdorff and totally disconnected. If F is the directed union of subfields F_i, the restriction maps identify X_F with the inverse limit of the `X_{F_i}`; consequently, if Z_i ⊂ `X_{F_i}` are closed subsets with restriction mapping Z_j into Z_i for F_i ⊂ F_j, and the inverse limit of the Z_i is empty, then some Z_i is empty. (BCR, Example 7.1.4 a), p. 135; Proposition 7.1.7, p. 136; B19, §6.4, p. 96)

A proof can proceed as follows.

1. Embed X_F into the product `{±1}^{Fˣ}` by P ↦ (sign_P(a))_a; the image is closed, being cut out by the cone axioms, each of which involves finitely many coordinates.
2. Tychonoff gives compactness; the product is Hausdorff and totally disconnected, and so is the closed subspace.
3. An ordering of F is the union of its restrictions to the F_i, and compatible orderings of the F_i glue, so X_F → lim `X_{F_i}` is a continuous bijection of compact Hausdorff spaces, hence a homeomorphism.
4. An inverse limit of nonempty compact Hausdorff spaces is nonempty; so empty limit forces some Z_i to be empty.

**Checks.**

- For F = ℝ(t) the space X_F is infinite and compact.
- Inverse limit, computed: let F_n = ℚ(√p₁, …, √p_n) for the first n primes and F their union. F_n has degree 2ⁿ over ℚ and all its embeddings are real, so `X_{F_n}` has 2ⁿ points, indexed by the signs of the √p_i; each restriction `X_{F_{n+1}}` → `X_{F_n}` is two-to-one and onto (`p_{n+1}` is positive at every ordering, so both signs of `√p_{n+1}` occur), and X_F is {±1}^ℕ, a Cantor set: compact, Hausdorff, totally disconnected and uncountable, although every `X_{F_n}` is finite. With Z_n the orderings of F_n at which −1 is positive, every Z_n is empty and so is the limit; with Z_n the orderings at which √p₁ < 0, every Z_n has 2ⁿ⁻¹ points and the limit is the nonempty half {ε : ε₁ = −1} of {±1}^ℕ. A family of closed Z_n with nonempty members and empty limit cannot occur, as step 4 requires.

*Needs:* §0.1; Mathlib `isCompact_univ_pi`; Mathlib `IsClosed`.

### 0.3 Real closure at a specified ordering

F a field, P an ordering of F; R real closed; ι algebraic. No uniqueness of the real closure is used: the vanishing predicates quantify over all real closures at P.

For a field F and an ordering P ∈ X_F, a real closure of F at P is a field R with `IsRealClosed` R together with a ring homomorphism ι : F → R making R algebraic over F, such that ι(P) is contained in the set of squares of R (equivalently, since an ordering contained in another is equal to it, ι⁻¹ of the squares of R is P, and then ι is strictly monotone from the cone order of P to the cone order of the squares of R by Tau Ceti `Subsemiring.IsOrdering.strictMono_comap`). Every pair (F, P) has a real closure. A class β ∈ Br(F) vanishes at P if β becomes trivial in Br(R) for every real closure (R, ι) at P; it vanishes at all real closures if this holds for every P. (B19, §6.4, p. 95; BCR, §1.3 and Example 7.1.4 a), pp. 9–14, 135)

A construction can proceed as follows.

1. Existence: give F the cone order of P (§0.1: `LinearOrder.ofAddSubmonoid` with `IsOrderedRing.ofSubsemiring`), a strictly ordered field with nonnegative cone P, then apply Tau Ceti's `TauCeti.RealClosure.exists_realClosure`, which gives an algebraic ordered real closure with a strictly monotone embedding.
2. Strict monotonicity sends P into the nonnegative elements of R, which are the squares of R because R is real closed (`IsRealClosed.isSquare_neg_of_not_isSquare`).
3. Brauer groups restrict along ι by `TauCeti.BrauerGroup.baseChange`; for real closed R, Br(R) has two elements, the trivial class and the quaternion class (−1,−1), because R(i) is algebraically closed (Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`) and Br(R(i)/R) ≅ Rˣ/(R(i)ˣ norms) = `Rˣ/R_{>0}`.

The definition has the following API.

- A real closed field R, a ring map ι : F →+* R with R algebraic over F, and ι(P) ⊆ squares of R.
- Every ordering P of F has a real closure (from Tau Ceti `TauCeti.RealClosure.exists_realClosure`).
- ι⁻¹ of the cone of squares of R is P.
- If F is real closed, (F, id) is a real closure at its unique ordering.
- A real closure of L at Q, composed with F → L, is a real closure of F at the restricted ordering when L/F is algebraic.
- For real closed R, Br(R) ≃* Multiplicative (ZMod 2), generated by the class of the quaternion algebra (−1,−1); for R = ℝ this is Tau Ceti's `TauCeti.Quaternion.brauerGroupMulEquiv`.
- The predicate on β ∈ Br(F): for every P and every real closure (R, ι) at P, the image of β in Br(R) is trivial.

**Checks.**

- (ℝ, id) is a real closure of ℝ at the cone of nonnegative reals.
- If F is nonreal, every β ∈ Br(F) vanishes at all real closures (there are no orderings).
- Over F = ℝ the Hamilton quaternion class does not vanish at all real closures.
- For R = ℝ the identification of Br(R) with ℤ/2 agrees with `TauCeti.Quaternion.brauerGroupMulEquiv`.
- The real algebraic numbers with the inclusion form a real closure of ℚ at its unique ordering.
- ℂ with an embedding of ℝ is not a real closure: it is not real closed.

*Needs:* §0.1; Mathlib `IsRealClosed`; Mathlib `IsRealClosed.isSquare_neg_of_not_isSquare`; Mathlib `Algebra.IsAlgebraic`; Mathlib `LinearOrder.ofAddSubmonoid`; Mathlib `IsOrderedRing.ofSubsemiring`; Tau Ceti `Subsemiring.IsOrdering.strictMono_comap`; Tau Ceti `TauCeti.RealClosure.exists_realClosure`; Tau Ceti `TauCeti.BrauerGroup.baseChange`; Tau Ceti `TauCeti.Quaternion.brauerGroupMulEquiv`; Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`.

### 0.4 Signature of a quadratic form at an ordering

char F = 0 (2 invertible suffices); q nondegenerate on a finite-dimensional space. The signature over an ordered field is the native one (Mathlib `sigPos`, `sigNeg`; Tau Ceti `TauCeti.RegularFormClass.signature`); only its dependence on the ordering is built here.

Let F be a field of characteristic 0, q a nondegenerate quadratic form on a finite-dimensional F-vector space and P ∈ X_F. Write F_P for F with the cone order of P (§0.1: Mathlib `LinearOrder.ofAddSubmonoid` with `IsOrderedRing.ofSubsemiring`), a strictly ordered field with nonnegative cone P. The signature sign_P(q) ∈ ℤ is the native signature of q over F_P, `sigPos q − sigNeg q`, which is Tau Ceti's `TauCeti.RegularFormClass.signature` of the isometry class of q (`TauCeti.signature_formClass`); on an orthogonal diagonalisation q ≅ ⟨a_1, …, a_n⟩ it is #{i : a_i >_P 0} − #{i : a_i <_P 0} (`QuadraticForm.sigPos_of_equiv_weightedSumSquares`). Isometry invariance, additivity under orthogonal sums, multiplicativity under tensor products and the value 0 on the hyperbolic plane are the native laws (`QuadraticMap.Equivalent.sigPos_eq`, `TauCeti.RegularFormClass.signatureHom`, `TauCeti.RegularFormClass.signature_hyperbolicClass`). What is proved here: sign_P(q) equals the signature of q_R over every real closure (R, ι) of F at P (§0.3), hence does not depend on the real closure; for a field embedding ι : F → L and Q ∈ X_L, sign_Q(q_L) = `sign_{ι⁻¹Q}(q)`; and P ↦ sign_P(q) is locally constant on X_F. The form q has zero total signature if sign_P(q) = 0 for every P ∈ X_F; for nonreal F this condition is empty. (EKM, §33, pp. 133–137; B19, §0.5, p. 66)

A proof can proceed as follows.

1. Diagonalise q = ⟨a_1, …, a_n⟩ over F (`QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'`); the same diagonal form is a diagonalisation of q_L and of q_R after extension of scalars.
2. Real closure: ι : F_P → R is strictly monotone for the order of R (§0.3), so ι(a_i) > 0 in R iff a_i >_P 0, and the diagonal counts over R and over F_P agree (`QuadraticForm.sigPos_of_equiv_weightedSumSquares` on both sides). The same argument along a field embedding ι : F → L gives sign_Q(q_L) = `sign_{ι⁻¹Q}(q)`, since ι is strictly monotone from `F_{ι⁻¹Q}` to L_Q (Tau Ceti `Subsemiring.IsOrdering.strictMono_comap`).
3. Local constancy: for the fixed diagonalisation, sign_P(q) = Σ sign_P(a_i), and each sign_P(a_i) is constant on the clopen sets H(a_i) and H(−a_i) (§0.1).

The definition has the following API.

- sign_P(q) ∈ ℤ for a nondegenerate quadratic form q and an ordering P: the native signature of q over F_P.
- sign_P(q) equals the signature of q_R over every real closure (R, ι) at P.
- sign_Q(q_L) = `sign_{ι⁻¹Q}(q)` for a field embedding ι : F → L and Q ∈ X_L, whether or not L/F is algebraic.
- P ↦ sign_P(q) is locally constant on X_F.
- The predicate: sign_P(q) = 0 for every P ∈ X_F.

**Checks.**

- Over ℝ, with its unique ordering, ⟨1, 1⟩, ⟨1, −1⟩ and ⟨−1, −1⟩ have signatures 2, 0 and −2, the values of the native signature over ℝ (the count of ±1 weights in `QuadraticForm.equivalent_signType_weighted_sum_squared`) and over every real closed field: an adapter that changed the native values would be detected here.
- The hyperbolic plane (`TauCeti.hyperbolicPlane`) has signature 0 at every ordering of every real field, as `TauCeti.RegularFormClass.signature_hyperbolicClass` requires.
- Over ℝ(t), ⟨1, −t⟩ has signature 0 at orderings with t > 0 and 2 at orderings with t < 0: the signature is locally constant on X_F but not constant, so it is not a function of the form alone.
- Along ℝ ⊂ ℝ(t), ⟨1, 1⟩ has signature 2 at the ordering of ℝ and its extension has signature 2 at every ordering of ℝ(t), although no real closure of ℝ(t) is algebraic over ℝ: the restriction formula does not pass through real closures of ℝ.
- Over ℚ(√2) at the ordering with √2 < 0, ⟨√2⟩ has signature −1, computed equally over the real closure given by the real algebraic numbers with √2 ↦ −√2; the ordering, not the abstract field, determines the value.

*Needs:* §0.1; §0.3; Mathlib `LinearOrder.ofAddSubmonoid`; Mathlib `IsOrderedRing.ofSubsemiring`; Mathlib `sigPos`; Mathlib `sigNeg`; Mathlib `QuadraticMap.Equivalent.sigPos_eq`; Mathlib `QuadraticForm.sigPos_of_equiv_weightedSumSquares`; Mathlib `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'`; Mathlib `QuadraticForm.equivalent_signType_weighted_sum_squared`; Tau Ceti `TauCeti.RegularFormClass.signature`; Tau Ceti `TauCeti.signature_formClass`; Tau Ceti `TauCeti.RegularFormClass.signatureHom`; Tau Ceti `TauCeti.RegularFormClass.signature_hyperbolicClass`; Tau Ceti `TauCeti.hyperbolicPlane`; Tau Ceti `Subsemiring.IsOrdering.strictMono_comap`.

### 0.5 The locus where a Brauer class survives is clopen

char F = 0; β ∈ Br(F) represented by a central simple algebra A of degree d; the extension L/F in the restriction statement may be transcendental.

Let F be a field of characteristic 0 and β ∈ Br(F). For an ordering P, whether β becomes trivial over a real closure at P does not depend on the real closure, and the set Z(β) = {P ∈ X_F : β does not vanish at P} is clopen in X_F. For every field extension ι : F → L, algebraic or not, Z(β_L) is the preimage of Z(β) under restriction X_L → X_F. (B19, §6.4, p. 96, citing ARA75, Hilfssatz 2)

A proof can proceed as follows.

1. Let T_A be the reduced trace form x ↦ Trd(x²) on A, a nondegenerate quadratic form of dimension d² over F.
2. Over a real closed field R, A_R ≅ M_d(R) or `M_{d/2}(ℍ_R)`; the trace form of M_d(R) has signature d (symmetric minus antisymmetric matrices), and that of ℍ_R is 2⟨1,−1,−1,−1⟩ of signature −2, so the trace form of `M_{d/2}(ℍ_R)` has signature −d.
3. Hence β vanishes at P iff sign_P(T_A) = d, a condition independent of the real closure (§0.4).
4. P ↦ sign_P(T_A) is locally constant, so Z(β) = {P : sign_P(T_A) = −d} is clopen.
5. Restriction: (T_A)_L = `T_{A_L}`, and sign_Q(`T_{A_L}`) = `sign_{ι⁻¹Q}(T_A)` for Q ∈ X_L by the restriction formula of §0.4, which uses no real closure; step 3 then gives Z(β_L) = res⁻¹ Z(β). A real closure of L at Q need not be a real closure of F at ι⁻¹Q: when L/F is transcendental it is not algebraic over F. Where real closures are compared, the relative algebraic closure R_F of F in a real closure R_L of L at Q is a real closure of F at ι⁻¹Q: it is algebraic over F, and it is real closed because an element of R_L algebraic over R_F lies in R_F, so the square roots of its positive elements and the roots in R_L of its odd-degree polynomials stay in R_F.

The definition has the following API.

- Z(β) ⊂ X_F, the orderings at which β does not vanish.
- β vanishes over one real closure at P iff it vanishes over every real closure at P.
- P ∈ Z(β) iff sign_P(T_A) = −d, and P ∉ Z(β) iff sign_P(T_A) = d.
- Z(β) is open and closed in X_F.
- Z(β_L) = res⁻¹ Z(β) for every field extension L/F.
- Z(β + β′) is the symmetric difference of Z(β) and Z(β′), because Br(F) → Br(R) ≅ ℤ/2 is a homomorphism for each real closure R.
- Z(0) = ∅, and Z(β) = ∅ for every β when F is nonreal.

**Checks.**

- Over ℝ, Z of the quaternion class is the whole one-point space.
- For β = (−1, t) over ℝ(t), Z(β) = H(−t), the orderings with t < 0.
- Z(0) = ∅, the trace form of M_d(F) having signature d at every ordering, while for the Hamilton class over ℝ, Z is the whole space: a locus independent of β is excluded by these two values.
- Negative control for the restriction step: for the Hamilton class ℍ over ℝ and L = ℝ(t), Z(ℍ_L) = X_L = res⁻¹(pt), as the signature formula gives, although no real closure of ℝ(t) is a real closure of ℝ (each contains the transcendental t); "a real closure of L is one of F" would be false here.

*Needs:* §0.1; §0.2; §0.3; §0.4; Tau Ceti `TauCeti.BrauerGroup.baseChange`; Tau Ceti `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`; SemisimpleAlgebras Layer 6.

### 0.5a The Artin–Lang theorem

R real closed, with its unique ordering (the squares); A a finitely generated R-algebra that is a domain. An integral variety over R is an integral separated scheme of finite type over R, with function field R(V); a smooth R-point is an R-point in the smooth locus of V → Spec R.

Let R be a real closed field, A a finitely generated R-algebra that is a domain, K its field of fractions, P an ordering of K and f_1, …, f_r ∈ A with f_i >_P 0 for every i. Then there is an R-algebra homomorphism x : A → R with f_i(x) > 0 for every i. Consequently, for an integral variety V over R the following are equivalent: R(V) is real; V has a smooth R-point; V(R) is Zariski dense in V. In particular V(R) = ∅ makes R(V) nonreal; and for every ordering P of R(V), every dense open V′ ⊂ V and finitely many f_1, …, f_r ∈ R(V)ˣ with f_i >_P 0, there is a smooth point x ∈ V′(R) at which every f_i is regular and invertible with f_i(x) > 0. (BCR, §4.1, Artin–Lang homomorphism theorem and its corollaries, pp. 85–87)

A proof can proceed as follows.

1. Let (R′, ι) be a real closure of K at P (§0.3). The composite R → K → R′ is an embedding of real closed fields, and it preserves the orders because the nonnegative elements of R are its squares.
2. Write A = R[t_1, …, t_n]/(g_1, …, g_m) and choose polynomials representing the f_i. The images ι(t_j) solve g_1 = ⋯ = g_m = 0 and f_1 > 0, …, f_r > 0 in R′, since ι⁻¹ of the squares of R′ is P (§0.3).
3. The existence of a solution of this finite system is an existential formula of ordered rings with parameters, the coefficients of the g_k and the f_i, in R. Every ordered-field embedding between real closed fields is elementary (K3BlochGroups §5.8), so the formula holds in R; a solution in R is the homomorphism x.
4. Density: suppose R(V) has an ordering P, and let V′ ⊂ V be a dense open and Z ⊊ V a proper closed subset. The smooth locus of V → Spec R (Mathlib `AlgebraicGeometry.Scheme.Hom.smoothLocus`) is open and contains the generic point, R(V) being separable over R in characteristic 0. Choose a nonempty affine open Spec A inside it, inside V′, off Z and inside the domains of regularity of the f_i and the 1/f_i (affine opens form a basis, Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`; V is irreducible). Then Frac A = R(V), and steps 1–3 applied to A, P and f_1, …, f_r give a smooth point x ∈ V′(R) ∖ Z with f_i(x) > 0. Taking r = 0, smooth real points are Zariski dense.
5. Conversely, a smooth point x ∈ V(R) with local parameters z_1, …, z_d embeds R(V) into Frac R[[z_1, …, z_d]] ⊂ R((z_1))⋯((z_d)), a field ordered recursively (a nonzero series in z_d is positive when its lowest-order coefficient, an element of `R((z_1))⋯((z_{d−1}))`, is positive), so R(V) is real. A Zariski-dense V(R) meets the nonempty open smooth locus. This closes the cycle of equivalences.

**Checks.**

- V = {x² + y² + z² = −1} ⊂ 𝔸³_ℝ has V(ℝ) = ∅, and −1 = x² + y² + z² is a sum of squares in ℝ(V), as the theorem requires.
- Negative control for "smooth": V = {x² + y² = 0} ⊂ 𝔸²_ℝ is integral (x² + y² is irreducible over ℝ) with the single real point (0, 0), which is singular; ℝ(V) contains y/x with (y/x)² = −1, so ℝ(V) is nonreal and V(ℝ) is not Zariski dense. "V has a real point" in place of "a smooth real point" would be false.
- A = ℝ[t], P the ordering of ℝ(t) in which t is positive and smaller than every positive real, f_1 = t, f_2 = 1 − t: the homomorphism t ↦ 1/2 makes both positive, although no real number realises the infinitesimal ordering itself; the theorem produces a real point, not an order-preserving embedding of K into R.
- Negative control for "real closed": over R = ℚ, A = ℚ[t]/(t² − 2) is a domain whose fraction field ℚ(√2) has two orderings, yet there is no ℚ-algebra map A → ℚ; the transfer of step 3 needs R real closed.

*Needs:* §0.1; §0.3; K3BlochGroups §5.8; Mathlib `IsRealClosed`; Mathlib `AlgebraicGeometry.Scheme.Hom.smoothLocus`; Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`; Mathlib `PowerSeries`.

### 0.6 The Elman–Lam u-invariant

char F ≠ 2 (a field of positive characteristic has no orderings, so for it the signature condition is empty). The supremum is taken in ℕ∞; forms with nonzero signature somewhere are not counted.

For a field F of characteristic ≠ 2, u(F) ∈ ℕ ∪ {∞} is the supremum of dim q over nondegenerate anisotropic quadratic forms q over F with zero total signature (sign_P(q) = 0 for every P ∈ X_F); the zero form counts with dimension 0. For nonreal F the signature condition is empty and u(F) is the classical maximal dimension of an anisotropic form. By definition u(F) ≤ n iff every nondegenerate form of dimension > n with zero total signature is isotropic. (B19, §0.5, p. 66; EKM, §36, p. 161; BEC05, §2, p. 3) EKM counts forms that become hyperbolic over every real closure and Elman–Lam and Becher count forms with torsion Witt class; §0.6a shows that both give this invariant.

The Lean statements use the predicate `HasZeroTotalSignature q` for a quadratic form q on a finite-dimensional vector space V over a field K in which 2 is invertible: for every real closed field R and every K-algebra structure on R, the base change q_R on R ⊗_K V has a totally isotropic R-subspace of dimension ½·dim V, one on which q_R vanishes identically (Tau Ceti `QuadraticMap.IsTotallyIsotropic`). Every ordering of K is induced from some real closure (§0.3) and every K-algebra map to a real closed field induces an ordering; over R a nondegenerate form of signature s and dimension n has maximal totally isotropic subspaces of dimension (n − |s|)/2 (Sylvester's law over R, §0.4), so for nondegenerate q the predicate says exactly that sign_P(q) = 0 for every ordering P. For degenerate q it can hold with nonzero signature (⟨1, 0⟩ over ℝ); this is harmless in the u-invariant statements, because in characteristic ≠ 2 a degenerate form is isotropic (a vector v of the radical has 2q(v) = b_q(v, v) = 0). For nonreal K there is no K-algebra map to a real closed field, and the predicate holds for every form.

A construction can proceed as follows.

1. Define the set of dimensions of anisotropic zero-signature forms and take its supremum in ℕ∞.
2. The characterisation of u(F) ≤ n is the definition of the supremum; isotropy is the negation of Mathlib's `QuadraticMap.Anisotropic`.
3. For nonreal F, every form has zero total signature because X_F is empty (§0.1).

The definition has the following API.

- u(F) : ℕ∞, the supremum of dimensions of anisotropic zero-signature forms.
- u(F) ≤ n iff every nondegenerate zero-signature form of dimension > n is isotropic.
- An anisotropic zero-signature form of dimension m gives m ≤ u(F).
- For nonreal F, u(F) is the supremum of dimensions of all anisotropic nondegenerate forms.
- u(R) = 0 for real closed R.
- For nondegenerate q, `HasZeroTotalSignature q` holds iff sign_P(q) = 0 for every ordering P of K.
- The predicate `HasZeroTotalSignature` is invariant under isometry and holds for every hyperbolic form; it fails for every nondegenerate form of odd dimension over a real field.

**Checks.**

- u(ℝ(t)) = 2: ⟨1, −(1 + t²)⟩ is anisotropic with zero signatures, and EKM Corollary 37.8 bounds u by 2.
- Over ℝ(t), n⟨1⟩ is anisotropic for every n but has signature n everywhere, so the classical anisotropic-dimension supremum is ∞ while u(ℝ(t)) = 2.
- u(ℂ) = 1.
- u(ℝ) = 0: a zero-signature form over ℝ is hyperbolic.
- Over ℝ the half-dimensional isotropic-subspace condition holds for ⟨1, −1⟩ (the line x = y) and fails for ⟨1, 1⟩, whose base change to every real closed field is anisotropic; a signature-blind condition such as "q_R is isotropic" would accept ⟨1, 1, −1⟩, of signature 1.
- Over ℝ(t), the form ⟨1, −t⟩ fails the condition: at a real closure where t < 0 its base change is positive definite, matching sign = 2 at those orderings.
- Over ℂ(x, y) the condition is empty and holds for ⟨1, x, y, xy⟩, which is anisotropic; this is the classical computation u(ℂ(x, y)) = 4.
- In odd characteristic the invariant is the classical one: u(𝔽₃) = 2, since ⟨1, 1⟩ is anisotropic (−1 is not a square modulo 3) while every form of dimension 3 over a finite field is isotropic (Chevalley–Warning). A definition restricted to characteristic 0 would leave u(𝔽₃) undefined, although 𝔽₃ satisfies the hypothesis u(𝔽₉) = 2 ≤ 4 of §0.14, whose conclusion u(𝔽₃) ∈ {0, 1, 2, 4, 6} it meets.

*Needs:* §0.4; §0.1; §0.3; Mathlib `QuadraticMap.Anisotropic`; Mathlib `QuadraticForm.baseChange`; Mathlib `IsRealClosed`; Mathlib `ENat`; Tau Ceti `QuadraticMap.IsTotallyIsotropic`.

### 0.6a Pfister's local–global principle

char F ≠ 2; q nondegenerate; W(F) is the Witt ring of QuadraticFormInvariants Layer 4; m·q is the orthogonal sum of m copies of q, so that m·q represents m times the class of q.

Let F be a field of characteristic ≠ 2 and q a nondegenerate quadratic form over F. Then sign_P(q) = 0 for every P ∈ X_F if and only if the Witt class of q is torsion in W(F), and in that case 2^m·q is hyperbolic for some m ≥ 0. In particular, when F is nonreal every class of W(F) is killed by a power of 2. Consequently the u-invariant of §0.6 is the supremum of the dimensions of anisotropic forms with torsion Witt class, which is the invariant of EL73 and BEC05 (BEC05, §2, p. 3), and it is also EKM's invariant, whose forms are those hyperbolic over every real closure, since by Sylvester's law over a real closed field a nondegenerate form of signature 0 is hyperbolic. (EKM, Theorem 31.22, p. 128, and Lemma 31.19, p. 126; EKM, Corollary 34.12, p. 141; EKM, §36, p. 161)

A proof can proceed as follows.

1. For each P, sign_P is a ring homomorphism W(F) → ℤ (§0.4: additive, multiplicative, zero on the hyperbolic plane), and ℤ is torsion-free, so a torsion class has signature 0 at every ordering.
2. Conversely, suppose sign_P(q) = 0 for every P but no 2^m·q is hyperbolic. By Zorn's lemma there is an algebraic extension K/F maximal among those over which no 2^m·q_K is hyperbolic: hyperbolicity over the union of a chain is witnessed over a finitely generated subextension, hence over a member of the chain.
3. Witt kernel of a quadratic extension: let a ∈ Kˣ be a nonsquare and φ an anisotropic form on V over K that is isotropic over K(√a), say φ(v + √a·w) = 0 with v, w ∈ V. Then φ(v) + a·φ(w) = 0 and b_φ(v, w) = 0, both v and w are nonzero, and they span a plane on which φ is φ(w)⟨1, −a⟩. With Witt cancellation (QuadraticFormInvariants Layer 1) and induction on the dimension, an anisotropic form that is hyperbolic over K(√a) is isometric to ⟨1, −a⟩ ⊗ ψ; so the kernel of W(K) → W(K(√a)) is ⟨1, −a⟩·W(K) (EKM, Corollary 34.12).
4. Let a ∈ Kˣ. If a is not a square, maximality of K gives m with 2^m·q hyperbolic over K(√a), so 2^m·q_K = ⟨1, −a⟩·y in W(K) by step 3, and ⟨1, a⟩·2^m·q_K = 0 because ⟨1, a⟩ ⊗ ⟨1, −a⟩ = ⟨1, a, −a, −a²⟩ is hyperbolic. If −a is not a square either, likewise ⟨1, −a⟩·2^(m′)·q_K = 0; since ⟨1, a⟩ + ⟨1, −a⟩ = ⟨1, 1⟩ = 2 in W(K), adding gives 2^(M+1)·q_K = 0 for M = max(m, m′), a contradiction. So for every a ∈ Kˣ, a or −a is a square.
5. −1 is not a square in K, for otherwise ⟨1, 1⟩ ≅ ⟨1, −1⟩ and 2·q_K = 0. A sum b² + c² with (b, c) ≠ (0, 0) is then nonzero, and it is a square: otherwise −(b² + c²) = d² with d ≠ 0, so ⟨1, 1, 1⟩ is isotropic, the norm form ⟨1, 1, 1, 1⟩ of the quaternion algebra (−1, −1) is isotropic, hence hyperbolic (QuadraticFormInvariants Layer 2), and 4·q_K = 0. Hence the squares of K form the positive cone of an ordering P_K, every diagonal entry of q_K is ± a square, and q_K ≅ r⟨1⟩ ⊥ s⟨−1⟩ with r ≠ s since q_K is not hyperbolic. For the restricted ordering P = P_K ∩ F (§0.1), sign_P(q) = `sign_{P_K}(q_K)` = r − s ≠ 0 (§0.4), contradicting the hypothesis.
6. The consequences: the forms counted in §0.6 and the torsion forms coincide by steps 1–5; a nondegenerate form is hyperbolic over a real closure at P exactly when its signature there is 0 (Tau Ceti `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq` over the real closure, with §0.4).

**Checks.**

- Over ℝ(t), q = ⟨1, −(1 + t²)⟩ is anisotropic (1 + t² is not a square) and has zero total signature (1 + t² is positive at every ordering). Since ⟨1, 1⟩ represents 1 + t² = 1² + t² and has square determinant, ⟨1, 1⟩ ≅ ⟨1 + t², 1 + t²⟩, so 2·q = ⟨1, 1, −(1 + t²), −(1 + t²)⟩ is hyperbolic: the class of q has order exactly 2.
- Over ℝ(t), n·⟨1, −t⟩ has signature 2n at the orderings with t < 0, so no multiple of ⟨1, −t⟩ is hyperbolic and its class has infinite order; the signature condition fails, as it must.
- Over the nonreal field ℂ(x, y), 2·q = ⟨1, 1⟩ ⊗ q = ⟨1, −1⟩ ⊗ q is hyperbolic for every q, while ⟨1, x, y, xy⟩ is anisotropic (§0.7 Checks): torsion does not mean hyperbolic, which is why u counts anisotropic torsion forms.
- Over 𝔽₃, which is nonreal, ⟨1, 1⟩ is anisotropic (−1 is not a square modulo 3) and ⟨1, 1⟩ ≅ ⟨−1, −1⟩ (it represents −1 = 1 + 1), so 4·⟨1⟩ = ⟨1, 1, −1, −1⟩ is hyperbolic: ⟨1⟩ has order exactly 4 in W(𝔽₃), a power of 2, as the principle requires; a statement allowing torsion of odd order would not be sharp here.
- Over ℝ, W(ℝ) ≅ ℤ by the signature is torsion-free, and a zero-signature form is hyperbolic: u(ℝ) = 0 under each of the three definitions.

*Needs:* §0.1; §0.4; §0.6; QuadraticFormInvariants Layer 1; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 4; Tau Ceti `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq`.

### 0.7 The Tsen–Lang theorem

Fix an integer i ≥ 0. A field F is a C_i-field if every homogeneous polynomial over F of degree d ≥ 1 in more than d^i variables has a nontrivial zero in F. If F is a C_i-field and E/F is a field extension of finite transcendence degree t, then E is a `C_{i+t}-field`. In particular every field of transcendence degree t over an algebraically closed field is a C_t-field, and every quadratic form of dimension > 2^t over it is isotropic. (EKM, §97, definition and Theorem 97.2, p. 385; Corollaries 97.5 and 97.6 and Theorem 97.7, p. 386; B19, Theorem 0.8, p. 65)

A proof can proceed as follows.

1. Systems of forms (Lang–Nagata): over a C_i-field, r forms of degree d in N > r·d^i common variables have a common nontrivial zero. If F is algebraically closed (for any i; this covers i = 0, a C₀-field being algebraically closed), N > r·d^i ≥ r, so the ideal the forms generate in the polynomial ring in N variables has height ≤ r < N (Krull's height theorem), and its zero set in affine N-space is a cone of positive dimension, which contains a nonzero point. If d = 1 the forms are linear and r < N gives a nonzero common zero by linear algebra. Otherwise F is not algebraically closed and d ≥ 2: compose a normic form (a form of degree e in e variables with no nontrivial zero, which exists in every degree a power of some e > 1 over a field that is not algebraically closed) of degree ≥ r with the given forms, iterate, and compare the growth of degrees and numbers of variables (EKM Theorem 97.2, whose proof passes to normic forms after excluding i = 0 and d = 1; the algebraically closed case with i > 0 is the first branch here).
2. Algebraic extensions: a form over an algebraic extension E/F has coefficients in a finite subextension E′/F of some degree r; writing each variable in an F-basis of E′ splits the form into r forms over F in rN variables, and step 1 gives a common zero when N > d^i (EKM Corollary 97.5).
3. One transcendental: F(x) is a `C_{i+1}-field`. Clear denominators so that the coefficients are polynomials in x of degree ≤ c, substitute polynomials of degree m in x for the N variables, and compare the N(m + 1) unknown coefficients with the dm + c + 1 coefficient equations of degree d; for N > `d^{i+1}` and m large, step 1 applies (EKM Corollary 97.6).
4. Choose a transcendence basis of E/F, apply step 3 t times and step 2 once (EKM Theorem 97.7). For quadratic forms take d = 2.

The definition has the following API.

- The predicate C_i on fields, for i ∈ ℕ: every homogeneous polynomial of degree d ≥ 1 in more than d^i variables has a nontrivial zero.
- C_i implies C_j for i ≤ j, since d^i ≤ d^j for d ≥ 1.
- A field is C₀ iff it is algebraically closed (homogenise a one-variable polynomial of degree d ≥ 1 to a form in two variables).
- Over a C_i-field, r forms of degree d ≥ 1 in N > r·d^i variables have a common nontrivial zero.
- An algebraic extension of a C_i-field is C_i.
- If F is C_i then F(x) is `C_{i+1}`, and an extension of transcendence degree t of a C_i-field is `C_{i+t}`.
- Over a C_t-field every quadratic form of dimension > 2^t is isotropic.

**Checks.**

- Algebraically closed fields are C_0, and ℝ is not C_i for any i: the form x₁² + ⋯ + x_N² has no nontrivial real zero for every N, so no transcendence-degree bound holds over ℝ itself; ⟨1, 1, 1⟩ is anisotropic over ℝ(t).
- ℂ(x) is C_1, so every ternary quadratic form over it is isotropic (consistent with SchemeAndStackFoundations §2.16, `tsen_theorem`), while ⟨1, x⟩ is anisotropic since −x is not a square: the bound d^i is attained for d = 2, i = 1.
- ℂ(x, y) is C_2, so quadratic forms of dimension 5 are isotropic, while ⟨1, x, y, xy⟩ is anisotropic by two applications of Springer's theorem (§0.10) at x = 0 and y = 0: the bound 2² = 4 is attained.
- Degree d = 0 is excluded: a nonzero constant is a homogeneous polynomial of degree 0 in any number of variables with no zero, so the definition would make no field C_i if d = 0 were allowed.
- The systems theorem over ℂ viewed as a C₁-field, with r = 2 quadratic forms in N = 5 > 2·2 variables: ℂ is algebraically closed and has no normic form of degree e > 1, so the first branch applies (height ≤ 2 < 5 gives a nonzero common zero); a proof that went to normic forms whenever i > 0 and d > 1 would have no input here.

*Needs:* Mathlib `MvPolynomial.IsHomogeneous`; Mathlib `Ideal.height_le_spanFinrank`; Mathlib `Algebra.trdeg`; Mathlib `RatFunc`.

### 0.8 The u-invariant of a real curve function field

F/R of transcendence degree 1 with R real closed; char 0.

If F has transcendence degree 1 over a real closed field, then u(F) ≤ 2. In particular, for every integral curve C over ℝ, every nondegenerate quadratic form of dimension ≥ 3 over ℝ(C) with zero total signature is isotropic. (EKM, Corollary 37.8, p. 169; BEC05, §1, p. 1)

A proof can proceed as follows.

1. F(√−1) has transcendence degree 1 over R(√−1), which is algebraically closed (Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`), hence is C₁ by Tsen–Lang (§0.7), so u(F(√−1)) ≤ 2.
2. Elman–Lam's comparison of u(F) with u(F(√−1)) for the quadratic extension F(√−1)/F, in the refined form EKM proves (EKM Proposition 37.7, whose argument runs through torsion forms, read in the sense of §0.6 by §0.6a), gives u(F) ≤ 2.

**Checks.**

- u(ℝ(t)) ≤ 2, attained by ⟨1, −(1 + t²)⟩.

*Needs:* §0.6; §0.6a; §0.7; Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`.

### 0.9 Witt's theorem on Brauer classes of real curves

C smooth, integral, of finite type and separated over ℝ; ramification of β at finitely many points is allowed. W ⊂ C(ℝ) dense for the Euclidean topology. β is unramified at x ∈ C(ℝ) when it lies in the image of Br(`O_{C,x}`) → Br(F), which is injective for the regular local ring `O_{C,x}` (SchemeAndStackFoundations §2.22, `brauer_regular_injectivity`), and then β(x) ∈ Br(ℝ) is its image under `O_{C,x}` → κ(x) = ℝ; no surface notion of Layer 1 is used.

Let C be a smooth integral curve over ℝ with function field F = ℝ(C). (a) A class β ∈ Br(F) that vanishes at every real closure of F is zero. (b) If β is unramified at the points of a Euclidean-dense subset W of C(ℝ) and β(x) = 0 ∈ Br(ℝ) for x ∈ W, then β vanishes at every real closure, hence β = 0; the class may be ramified elsewhere. (c) If C(ℝ) = ∅, then F is nonreal and Br(F) = 0. (B19, Proposition 4.2 proof, p. 80; EKM, Corollary 37.8, p. 169; BCR, §10.3, pp. 254–256; BCR, §4.1, for the real points used in (b) and (c))

A proof can proceed as follows.

1. Tsen: Br(ℂ(C)) = 0 (SchemeAndStackFoundations §2.16, `tsen_theorem`), so β is split by the quadratic extension F(i)/F and equals the quaternion class (−1, f) for some f ∈ Fˣ (cyclic algebras; QuadraticFormInvariants Layers 2 and 5).
2. At an ordering P, β vanishes over the real closure iff f >_P 0 (§0.3, Br(R) = {0, (−1,−1)}).
3. (a) If f is positive at every ordering, the norm form ⟨1, 1, −f, −f⟩ of (−1, f) has zero total signature; by §0.8 it is isotropic, so (−1, f) splits.
4. (b) Suppose f <_P 0 for some ordering P of F. Let C′ ⊂ C be the dense open on which f and 1/f are regular. By the Artin–Lang theorem (§0.5a, applied to −f >_P 0) there is x ∈ C′(ℝ) with f(x) < 0, so f < 0 on a Euclidean neighbourhood of x in C′(ℝ), which contains a point w of the dense set W. There β is unramified, f is a unit, and β(w) = (−1, f(w)) ≠ 0 in Br(ℝ), a contradiction. So f >_P 0 for every P, and (a) applies.
5. (c) If C(ℝ) = ∅, then F is nonreal by §0.5a (an integral variety without real points has a nonreal function field); X_F is empty, every β vanishes at all real closures, and (a) gives β = 0.

**Checks.**

- Br(ℝ(C)) = 0 for the conic C : x² + y² = −1.
- Over ℝ(t), the class (−1, t) is nonzero: it does not vanish at the orderings with t < 0, matching (a).
- Over ℝ(t), the class (−1, 1 + t²) is zero, consistent with (b): it evaluates to 0 at every real point.
- Step 4 on (−1, t) over ℝ(t), with W = C(ℝ) ∖ {0}: f = t is negative at the orderings with t < 0, and §0.5a produces real points t₀ < 0 where (−1, t₀) is the Hamilton class, so the hypothesis of (b) fails, as it must for a nonzero class.

*Needs:* §0.3; §0.4; §0.5a; §0.8; SchemeAndStackFoundations §2.16 (`tsen_theorem`); SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`); QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 5.

### 0.10 Springer's theorem for complete discretely valued fields

K complete for a discrete valuation; char k ≠ 2; all u_i, v_j units.

Let K be a complete discretely valued field with residue field k of characteristic ≠ 2 and uniformizer π. A diagonal form q = ⟨u_1, …, u_r⟩ ⊥ π⟨v_1, …, v_s⟩ with units u_i, v_j is anisotropic over K iff both residue forms ⟨ū_1, …, ū_r⟩ and ⟨v̄_1, …, v̄_s⟩ are anisotropic over k. Applied twice, the form ⟨1, y₁, −y₂, −y₁y₂⟩ is anisotropic over the iterated Laurent series field ℂ((y₁))((y₂)). (EKM, Lemma 19.4, p. 80, for the direction "an isotropic residue form makes q isotropic", which uses completeness; EKM, Lemma 19.5, p. 80, for the direction "anisotropic residue forms make q anisotropic", valid over any discrete valuation ring; EKM, Lemma 19.10 and Exercise 19.15, pp. 81–82, for the Witt-ring form; EKM §19, p. 79, attributes these results to SPR55; B19, §6.4, p. 96, citing SPR55)

A proof can proceed as follows.

1. If a residue form is isotropic, Hensel's lemma (completeness, char k ≠ 2) lifts a nonsingular zero to a zero of the corresponding unit form, so q is isotropic (EKM Lemma 19.4).
2. Conversely, let q(x) = 0 with x = (x′, x″) primitive (all coordinates in the valuation ring O, one of them a unit), so that q₁(x′) + π q₂(x″) = 0 for q₁ = ⟨u_1, …, u_r⟩ and q₂ = ⟨v_1, …, v_s⟩. If some coordinate of x′ is a unit, reduction modulo π gives q̄₁(x̄′) = 0 with x̄′ ≠ 0. Otherwise x′ = π y′ with y′ integral, so π² q₁(y′) + π q₂(x″) = 0, hence q₂(x″) + π q₁(y′) = 0 with a unit coordinate in x″, and reduction gives q̄₂(x̄″) = 0 with x̄″ ≠ 0. So an isotropic q has at least one isotropic residue form (EKM Lemma 19.5, where completeness is not needed); together with step 1, q is anisotropic iff both residue forms are.
3. The Witt-ring form: the two residue homomorphisms give a split exact sequence identifying W(K) with W(k) ⊕ W(k).
4. For ℂ((y₁))((y₂)): write ⟨1, y₁⟩ ⊥ (−y₂)⟨1, y₁⟩; both residue forms are ⟨1, y₁⟩ up to sign over ℂ((y₁)), which is anisotropic by the same theorem since ⟨1⟩ is anisotropic over ℂ.

**Checks.**

- ⟨1, t⟩ is anisotropic over ℂ((t)): its two residue forms ⟨1⟩ and ⟨1⟩ are anisotropic over ℂ. By contrast ⟨1, 1⟩ is isotropic over ℂ((t)), its first residue form ⟨1, 1⟩ being isotropic over ℂ.
- ⟨1, −1⟩ is isotropic over every K, and its residue form ⟨1, −1⟩ is isotropic.
- Negative control for step 2: over ℝ((t)), q = ⟨1, −1⟩ ⊥ t⟨1⟩ has the primitive zero (1, 1, 0), while its residue forms ⟨1, −1⟩ and ⟨1⟩ are isotropic and anisotropic respectively; an isotropic q forces one isotropic residue form, not both.

*Needs:* Mathlib `QuadraticMap.Anisotropic`; Mathlib `IsDiscreteValuationRing`; Mathlib `HenselianLocalRing`; QuadraticFormInvariants Layer 1.

### 0.11 The Amer–Brumer theorem

F arbitrary, including characteristic 2 (Leep's case of EKM Theorem 17.14); a form is isotropic when it has a nonzero zero; φ, ψ on the same space V.

Let F be any field and φ, ψ quadratic forms on the same finite-dimensional F-vector space V. Then φ and ψ have a common nonzero isotropic vector in V iff the form φ + tψ on V ⊗ F(t) over the rational function field F(t) is isotropic. (EKM, Theorem 17.14, p. 74; B19, §0.5, p. 66)

A proof can proceed as follows.

1. A common zero v gives the constant vector v with (φ + tψ)(v) = 0.
2. Conversely take a nonzero polynomial vector v(t) ∈ V[t] with (φ + tψ)(v) = 0 of minimal degree; a degree-reduction argument (EKM Theorem 17.14) shows deg v = 0, and then the coefficients of 1 and t give φ(v) = ψ(v) = 0.

**Checks.**

- Over ℝ, φ = ⟨1, −1⟩ and ψ = ⟨1, −1⟩ share the isotropic vector (1, 1), and φ + tψ = (1 + t)⟨1, −1⟩ is isotropic over ℝ(t).
- Over ℝ, φ = ⟨1, 1⟩ and ψ = ⟨1, −1⟩ have no common nonzero zero, and φ + tψ = ⟨1 + t, 1 − t⟩ is anisotropic over ℝ(t), since −(1 + t)/(1 − t) is not a square there.
- For two forms in five variables over ℝ(C) with C(ℝ) = ∅, isotropy of φ + tψ over ℝ(C)(t) gives a rational point of their intersection.
- In characteristic 2, over 𝔽₂, φ = ψ = x² + xy + y² (the norm form of 𝔽₄) have no common nonzero zero, and φ + tψ = (1 + t)(x² + xy + y²) is anisotropic over 𝔽₂(t), because 𝔽₄ ⊗ 𝔽₂(t) is still a field.

*Needs:* Mathlib `QuadraticMap.Anisotropic`; Mathlib `RatFunc`.

### 0.12 Period and index of a Brauer class

K any field; per(0) = ind(0) = 1. For a field extension L/K, finite or not, α_L is the image of α under the restriction `TauCeti.BrauerGroup.baseChange`, a group homomorphism Br(K) → Br(L). A splitting field of α is a finite field extension L/K with α_L = 0.

Let K be a field and α ∈ Br(K). The period per(α) is the order of α. The index ind(α) is `TauCeti.Algebra.index` K A for any central simple K-algebra A of class α; it does not depend on A and is the degree of the central division algebra of class α. Equivalently ind(α) is the least degree, and also the greatest common divisor of the degrees, of finite separable extensions L/K with α_L = 0; every finite splitting field has degree divisible by ind(α). Moreover per(α) divides ind(α), both have the same prime divisors; for every field extension L/K, finite or not, per(α_L) divides per(α) and ind(α_L) divides ind(α); and for a finite extension L/K, ind(α) divides [L : K]·ind(α_L). (CT05, §2.2 and Proposition 2.2, pp. 382–383; B19, §0.1, p. 63)

A construction can proceed as follows.

1. Every class has a central division representative D, unique up to isomorphism (`TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`); for any representative A ≅ M_n(D), `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix` gives `TauCeti.Algebra.index` K A = deg D, so ind(α) is well defined.
2. Some splitting field has degree ind(α) (`TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`), and it may be chosen separable (a separable maximal subfield of D). If a finite L splits α, then D ⊗_K L ≅ M_d(L) acts on L^d, a left D-module of K-dimension d[L : K], hence free of rank [L : K]/d over D; so d = ind(α) divides [L : K].
3. For any field extension L/K, restriction Br(K) → Br(L) is a group homomorphism, so per(α_L) divides per(α); and α_L is the class of D ⊗_K L (`TauCeti.BrauerGroup.baseChange_mk`), a central simple L-algebra of degree deg D = d (`TauCeti.Algebra.deg_baseChange`), so D ⊗_K L ≅ M_r(D′) gives ind(α_L) = deg D′ dividing d (`TauCeti.Algebra.index_dvd_deg`). For finite L/K, a splitting field of α_L of degree ind(α_L) over L splits α and has degree [L : K]·ind(α_L) over K, so ind(α) divides [L : K]·ind(α_L).
4. Corestriction along Spec L → Spec K for a splitting field L of degree ind(α) (HeightsRationalPointsAndObstructions §2.19a, `finiteFlatBrauerCorestriction` with `pullback_comp`, read on Br(K) through SchemeAndStackFoundations §2.22, `brauer_field`) gives ind(α)·α = cor(α_L) = cor(0) = 0, so per(α) | ind(α); for a prime l not dividing per(α), the fixed field F of an l-Sylow subgroup of a Galois splitting field L has [L : F] a power of l, so α_F is killed both by per(α) and by a power of l, hence α_F = 0 with [F : K] prime to l, and l does not divide ind(α).

The definition has the following API.

- ind(α) := `TauCeti.Algebra.index` K D for the central division representative D of α.
- ind(α) = `TauCeti.Algebra.index` K A for every central simple A of class α.
- Every finite splitting field L has ind(α) | [L : K].
- Some finite separable splitting field has degree ind(α).
- per(α_L) | per(α) and ind(α_L) | ind(α) for every field extension L/K, finite or not.
- ind(α) | [L : K]·ind(α_L) for finite L/K.
- per(α) | ind(α).
- per(α) and ind(α) have the same prime divisors.

**Checks.**

- The Hamilton quaternion class over ℝ has per = ind = 2.
- ind(0) = per(0) = 1.
- The class of M₂(ℍ) over ℝ has index 2 although the algebra has degree 4: the index is that of the division algebra in the class, not the degree of a representative.
- On a central division algebra, the index of its class agrees with `TauCeti.Algebra.index`.
- Period divides index without equality: for Albert's class (x, x) + (y, xy) over ℝ(x, y) the period is 2 and the index is 4 (§2.10); the gcd of splitting degrees, not the period, is the index.
- Along the transcendental extensions ℝ ⊂ ℝ(t) and ℝ ⊂ ℂ(t) the Hamilton class has index 2 (ℝ(t) is real, so the norm form ⟨1, 1, 1, 1⟩ stays anisotropic and ℍ ⊗ ℝ(t) is a division algebra) and 1 (ℍ ⊗ ℂ ≅ M₂(ℂ)): ind(α_L) | ind(α) holds for both, while the reverse bound ind(α) | [L : K]·ind(α_L) is stated for finite L/K only, [L : K] being infinite here.

*Needs:* HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`); SchemeAndStackFoundations §2.22 (`brauer_field`); Tau Ceti `TauCeti.Algebra.index`; Tau Ceti `TauCeti.Algebra.index_dvd_deg`; Tau Ceti `TauCeti.Algebra.deg_baseChange`; Tau Ceti `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; Tau Ceti `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`; Tau Ceti `TauCeti.BrauerGroup.baseChange`; Tau Ceti `TauCeti.BrauerGroup.baseChange_mk`; SemisimpleAlgebras Layer 6.

### 0.13 Albert's isotropy criterion for six-dimensional forms

char F ≠ 2; dim φ = 6; signed discriminant of φ trivial.

Let F be a field of characteristic ≠ 2 and φ a nondegenerate quadratic form of dimension 6 and trivial discriminant (an Albert form). Its Clifford invariant c(φ) ∈ Br(F)[2] is the class of a central simple algebra of degree 4, and φ is isotropic iff the index of c(φ) is at most 2. (BEC05, §2–§3, pp. 2–3; EKM, Theorem 98.19, p. 392; Lemma 38.1 and Corollary 38.2, pp. 170–171)

A proof can proceed as follows.

1. Scaling by e = −x₁x₂x₃ puts φ = ⟨x₁,…,x₆⟩ of trivial discriminant into the normal form eφ ≅ ⟨a, b, −ab, −c, −d, cd⟩ with a = ex₁, b = ex₂, c = −ex₄, d = −ex₅ (then ex₃ ≡ −ab and ex₆ ≡ cd modulo squares, the second because the signed discriminant −x₁⋯x₆ is a square) (diagonal calculus, QuadraticFormInvariants Layer 0); similarity preserves isotropy and the Clifford invariant of an even-dimensional form of trivial discriminant.
2. For this normal form the even Clifford algebra is A × A with A = (a, b) ⊗ (c, d), so c(φ) = [A] (QuadraticFormInvariants Layer 5, Clifford invariant).
3. Albert's theorem: ⟨a, b, −ab, −c, −d, cd⟩ is isotropic iff the biquaternion algebra (a, b) ⊗ (c, d) is not a division algebra, that is iff its index is ≤ 2. If the factors are division algebras, a common nonzero value e of the forms ⟨a, b, −ab⟩ and ⟨c, d, −cd⟩ is the same as a common quadratic subfield F(√e), so both directions are EKM Theorem 98.19. These ternary forms are the square forms x ↦ x² on the trace-zero quaternions, in the bases i, j, ij. They are the negatives of the pure reduced norm forms ⟨−a, −b, ab⟩ and ⟨−c, −d, cd⟩ of QuadraticFormInvariants Layer 2, because Nrd(x) = −x² for a trace-zero quaternion x (EKM §98, p. 390); if a factor is split, the corresponding ternary subform is isotropic and the index is ≤ 2.

**Checks.**

- The Albert form ⟨a, b, −ab, −c, −d, cd⟩ over ℝ with a = b = c = d = −1 is isotropic, and (−1,−1) ⊗ (−1,−1) ≅ M₄(ℝ) has index 1.
- Over a field where (a,b) ⊗ (c,d) is a division algebra, the corresponding Albert form is anisotropic.
- Square form versus pure norm, in Hamilton's quaternions (−1, −1). The trace-zero element i has i² = −1 but Nrd(i) = i·(−i) = 1. So ⟨a, b, −ab⟩ = ⟨−1, −1, −1⟩ takes −1 at (1, 0, 0), while the pure reduced norm ⟨−a, −b, ab⟩ = ⟨1, 1, 1⟩ takes 1. For a = b = c = d = −1 the common square value −1 gives the common quadratic subfield ℝ(√−1) = ℂ of both factors, as (−1,−1) ⊗ (−1,−1) ≅ M₄(ℝ) requires. Taking the norm value 1 as radicand would give ℝ(√1) = ℝ, which is not a quadratic extension.

*Needs:* Mathlib `CliffordAlgebra.even`; Mathlib `QuadraticMap.Anisotropic`; QuadraticFormInvariants Layer 0; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 5; §0.12.

### 0.14 Elman–Lam: u-invariants when u(F(√−1)) ≤ 4

char F ≠ 2; u(F(√−1)) ≤ 4 (for transcendence degree 2 over ℝ this follows from Tsen–Lang). Becher recalls the conclusion when u(F(√−1)) = 4, the case of a C₂ field such as ℂ(x, y). When u(F(√−1)) < 4 (for example F real closed, where F(√−1) is algebraically closed), no field having u-invariant 3 (EKM Corollary 36.4) gives u(F(√−1)) ≤ 2, hence u(F) ≤ 2 and I²F torsion-free (EKM Proposition 37.7 and its proof), so the conclusions hold with the Albert-form clause empty.

Let F be a field of characteristic ≠ 2 with u(F(√−1)) ≤ 4. Then I³F is torsion-free, u(F) ≤ 6, hence u(F) ∈ {0, 1, 2, 4, 6}, and if u(F) = 6 there is an anisotropic Albert form over F with zero total signature. If F ⊇ ℝ has transcendence degree 2 over ℝ, then F(√−1) is C₂, so u(F(√−1)) ≤ 4 and these conclusions apply. (EKM, Proposition 35.9, p. 150, and Theorem 35.12, p. 152, for the torsion-freeness of I³F; EL73 for the bound u(F) ≤ 6 when u(F(√−1)) = 4, in the form recalled without proof in BEC05, §3, p. 3, and, for transcendence degree 2 over a real closed field, in BEC05, §1, p. 1; EKM, Corollary 36.4, p. 162, and Proposition 37.7 and proof, pp. 168–169, for the remaining values; EKM, Theorem 37.4 (2) and Corollary 37.5, pp. 167–168, give only the coarser bound u(F) < 16; the Albert form is Elman–Lam's, recalled without proof in BEC05, §3, p. 3, and step 3 proves it from step 2)

A proof can proceed as follows.

1. For F of transcendence degree 2 over ℝ, F(√−1) has transcendence degree 2 over ℂ, hence is C₂ by Tsen–Lang (§0.7), so every form of dimension ≥ 5 over it is isotropic and u(F(√−1)) ≤ 4.
2. Torsion-freeness of I³F: if √−1 ∈ F, then F = F(√−1) is nonreal with u(F) ≤ 4, so every 3-fold Pfister form over F, of dimension 8, is isotropic, hence hyperbolic, and I³F = 0. Otherwise F(√−1)/F is a quadratic, hence normal, extension; F(√−1) is nonreal, so all its forms are torsion, and u(F(√−1)) ≤ 4 makes every 3-fold Pfister form over it isotropic, hence hyperbolic. So F(√−1) has no anisotropic torsion 3-fold Pfister form, this property descends to F (EKM, Theorem 35.12, p. 152), and for F it is equivalent to the torsion-freeness of I³F (EKM, Proposition 35.9, p. 150). The values: if u(F(√−1)) = 4, Elman–Lam's bound gives u(F) ≤ 6 (EL73, as recalled in BEC05, §3, p. 3); if u(F(√−1)) < 4, then u(F(√−1)) ≤ 2 (EKM Corollary 36.4) and EKM Proposition 37.7 gives u(F) ≤ 2. Odd values above 1 are excluded: for real F a torsion form has signature 0 at an ordering (§0.6a), hence even dimension; for nonreal F no field has u-invariant 3, 5 or 7 (EKM Corollary 36.4). These sources count torsion forms, which are the forms of §0.6 by §0.6a.
3. If u(F) = 6, let φ = φ′ ⊥ ⟨a⟩ be anisotropic of dimension 6 with zero total signature, hence torsion (§0.6a), and let d = −det φ be its signed discriminant. At every ordering φ has three positive and three negative diagonal entries, so d is positive there and ⟨1, −d⟩ has zero total signature, hence is torsion. Put A = φ′ ⊥ ⟨ad⟩: it has dimension 6 and signed discriminant d², a square, and A − φ = −a⟨1, −d⟩ in W(F), so A is a torsion Albert form. A is anisotropic: if not, A ≅ ℍ ⊥ ρ with ρ of dimension 4, determinant −det A = d², hence trivial discriminant, and torsion Witt class. Diagonal calculus (QuadraticFormInvariants Layer 0) gives ρ ≅ ⟨r₁, r₂, r₃, r₁r₂r₃⟩, so π = r₁ρ ≅ ⟨1, r₁r₂, r₁r₃, r₂r₃⟩ is a 2-fold Pfister form with torsion Witt class. For every z ∈ Fˣ the 3-fold Pfister form π ⊗ ⟨1, −z⟩ is torsion, hence hyperbolic because I³F is torsion-free (step 2); so π ≅ zπ (QuadraticFormInvariants Layer 4: forms of equal dimension and equal Witt class are isometric), and π, which represents 1, represents z. Hence π is universal and ρ ≅ r₁π ≅ π. Witt cancellation of ⟨ad⟩ from φ′ ⊥ ⟨ad⟩ ≅ ⟨ad, −ad⟩ ⊥ π (QuadraticFormInvariants Layer 1) gives φ′ ≅ π ⊥ ⟨−ad⟩, so φ ≅ π ⊥ ⟨−ad, a⟩; as π represents −a, φ is isotropic, a contradiction. Finally A, being torsion, has zero total signature (§0.6a, step 1).

**Checks.**

- For F = ℝ(x, y), u(F(√−1)) = 4 and the bound gives u(F) ≤ 6 before Benoist's theorem; Theorem 0.12 excludes 6.
- One degree lower the conclusion fails: over F = ℝ(x, y), the 2-fold Pfister form π = ⟨1, −(1 + x²)⟩ ⊗ ⟨1, −y⟩ is anisotropic (Springer's theorem, §0.10, over ℝ(x)((y)): its residue forms ⟨1, −(1 + x²)⟩ and ⟨−1, 1 + x²⟩ are anisotropic over ℝ(x), 1 + x² not being a square) and torsion (2·π = ⟨1, 1⟩ ⊗ ⟨1, −(1 + x²)⟩ ⊗ ⟨1, −y⟩ is hyperbolic because ⟨1, 1⟩ ⊗ ⟨1, −(1 + x²)⟩ is, by the §0.6a Checks). So I²F is not torsion-free while I³F is: the exponent 3 in step 2 is sharp.
- The universality in step 3, on the same π over ℝ(x, y), where I³F is torsion-free by step 2: π takes the value −1 at (x, 1, 0, 0), since x² − (1 + x²) = −1, and the value y at (0, 0, x, 1), since −x²y + y(1 + x²) = y, although neither −1 nor y is a square.

*Needs:* §0.6; §0.6a; §0.13; §0.7; QuadraticFormInvariants Layer 0; QuadraticFormInvariants Layer 1; QuadraticFormInvariants Layer 4.

### 0.15 Pfister's criterion: index two implies u ≤ 4

K ⊇ ℝ of transcendence degree 2, not necessarily finitely generated; index as in §0.12.

Let K be a field extension of ℝ of transcendence degree 2. If every nonzero class α ∈ Br(K)[2] that vanishes at all real closures of K has index 2, then u(K) ≤ 4 in the Elman–Lam sense. (Pfister proves the equivalence; only this direction is a target.) (B19, §6.4, p. 95, which states the criterion and attributes it to Pfister; BEC05, §3, p. 3, which recalls the anisotropic torsion Albert form used in step 1, proved in §0.14. BEC05's Theorem 3.1 and Remark 3.2 are different criteria for u ≤ 4, by universality of four-dimensional forms, and are not used.)

A proof can proceed as follows.

1. By §0.14, u(K) ∈ {0, 1, 2, 4, 6}, so u(K) > 4 means u(K) = 6; suppose so and take an anisotropic Albert form φ with zero total signature.
2. At every ordering P, φ_R over a real closure R at P is six-dimensional of signature 0, hence hyperbolic; so c(φ)_R = c(φ_R) = 0 (Clifford invariant commutes with base change). Thus c(φ) vanishes at all real closures.
3. By hypothesis c(φ) has index ≤ 2 (index 1 if c(φ) = 0), so φ is isotropic by §0.13, a contradiction. Hence u(K) ≤ 4.

**Checks.**

- For nonreal K the hypothesis is that every class of Br(K)[2] has index ≤ 2, and the conclusion is the classical bound u(K) ≤ 4.
- Benoist's Theorem 0.4 supplies the hypothesis for every K of transcendence degree 2 over ℝ (§7.8).

*Needs:* §0.14; §0.13; §0.3; §0.4; §0.6; §0.12; QuadraticFormInvariants Layer 5.

### Examples

The space of orderings of ℝ is one point and that of ℝ(t) is infinite and compact. Over ℝ the Hamilton quaternions have period and index 2, and M₂(ℍ) has the same class and index 2 although its degree is 4. Over ℝ(t) the form ⟨1, −(1 + t²)⟩ is anisotropic, since 1 + t² is not a square, and has signature 1 − 1 = 0 at every ordering because 1 + t² is positive everywhere, so u(ℝ(t)) ≥ 2, with equality by §0.8. Over ℂ(x, y) the form ⟨1, x, y, xy⟩ is anisotropic, so the Tsen–Lang bound of §0.7 (every five-dimensional form is isotropic) is sharp. (EKM §§36–37, pp. 162–169; BCR Example 7.1.4.)

### Dependencies

HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`); K3BlochGroups §5.8; Mathlib `AlgebraicGeometry.Scheme.Hom.smoothLocus`; Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`; Mathlib `PowerSeries`; Mathlib `Algebra.IsAlgebraic`; Mathlib `Algebra.trdeg`; Mathlib `CliffordAlgebra.even`; Mathlib `ENat`; Mathlib `HenselianLocalRing`; Mathlib `Ideal.height_le_spanFinrank`; Mathlib `IsClosed`; Mathlib `IsDiscreteValuationRing`; Mathlib `IsRealClosed.isSquare_neg_of_not_isSquare`; Mathlib `IsRealClosed`; Mathlib `IsSemireal`; Mathlib `MvPolynomial.IsHomogeneous`; Mathlib `QuadraticForm.baseChange`; Mathlib `QuadraticForm.equivalent_signType_weighted_sum_squared`; Mathlib `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'`; Mathlib `QuadraticMap.Anisotropic`; Mathlib `RatFunc`; Mathlib `Subsemiring.IsOrdering`; Mathlib `Subsemiring.IsPreordering`; Mathlib `Subsemiring.IsPreordering.isPointed`; Mathlib `Subsemiring.IsPointed.nonneg`; Mathlib `Subsemiring.IsSpanning.nonneg`; Mathlib `Subsemiring.IsOrdering.of_isPrime_supportIdeal`; Mathlib `LinearOrder.ofAddSubmonoid`; Mathlib `IsOrderedRing.ofSubsemiring`; Mathlib `IsOrderedRing.toIsStrictOrderedRing`; Mathlib `TopologicalSpace.generateFrom`; Mathlib `isCompact_univ_pi`; Mathlib `sigPos`; Mathlib `sigNeg`; Mathlib `QuadraticMap.Equivalent.sigPos_eq`; Mathlib `QuadraticForm.sigPos_of_equiv_weightedSumSquares`; QuadraticFormInvariants Layer 0; QuadraticFormInvariants Layer 1; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 4; QuadraticFormInvariants Layer 5; SchemeAndStackFoundations §2.16 (`tsen_theorem`); SchemeAndStackFoundations §2.22 (`brauer_field`); SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`); SemisimpleAlgebras Layer 6; Tau Ceti `Subsemiring.IsOrdering.comap`; Tau Ceti `Subsemiring.IsOrdering.strictMono_comap`; Tau Ceti `Subsemiring.IsPreordering.exists_le_isOrdering`; Tau Ceti `TauCeti.RealClosure.exists_realClosure`; Tau Ceti `TauCeti.RegularFormClass.signature`; Tau Ceti `TauCeti.RegularFormClass.signatureHom`; Tau Ceti `TauCeti.RegularFormClass.signature_hyperbolicClass`; Tau Ceti `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq`; Tau Ceti `TauCeti.signature_formClass`; Tau Ceti `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; Tau Ceti `TauCeti.Algebra.index`; Tau Ceti `TauCeti.Algebra.index_dvd_deg`; Tau Ceti `TauCeti.Algebra.deg_baseChange`; Tau Ceti `TauCeti.BrauerGroup.baseChange`; Tau Ceti `TauCeti.BrauerGroup.baseChange_mk`; Tau Ceti `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`; Tau Ceti `TauCeti.Quaternion.brauerGroupMulEquiv`; Tau Ceti `TauCeti.hyperbolicPlane`; Tau Ceti `QuadraticMap.IsTotallyIsotropic`; Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`.

## Layer 1: period, index and real evaluation on real surfaces

The unramified locus U_α of a class of Br(ℝ(S)), with residues and purity from HeightsRationalPointsAndObstructions §2.16b; the complex and real Kummer and topological Brauer sequences and the real class of a two-torsion line bundle (the source's Lemma 2.1); real evaluation, the clopen nonzero-evaluation locus Θ(α) and the degree-zero component of Kummer lifts; invariance of period and index under extension of algebraically closed fields; Azumaya models of prescribed degree over regular schemes of dimension at most two and Saltman's local form of a class with normal-crossings ramification, the two local inputs of de Jong's reduction to unramified classes; extension of line bundles from dense opens and injectivity of H¹ under removal of finitely many points.

### 1.1 Unramified locus of a Brauer class

X smooth integral over k, char k = 0; residues are those of HeightsRationalPointsAndObstructions §2.16b at the DVRs `O_{X,Γ}`. Br(U) ↪ Br(k(X)) for every nonempty open U, affine or not: U is again smooth and integral with k(U) = k(X), and the generic injection of HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`, exact at Br U for each dense open of U) applies to it.

Let k be a field of characteristic 0 and X a smooth integral k-variety, with Br(X) = H²_ét(X, 𝔾_m) ⊂ Br(k(X)). Say that α ∈ Br(k(X)) ramifies along a prime divisor Γ ⊂ X when its residue res_Γ(α) ∈ H¹(k(Γ), ℚ/ℤ) is nonzero. A class ramifies along only finitely many prime divisors; the reduced divisor they form is called the ramification divisor, and U_α denotes its complement in X. An open V ⊂ X satisfies α ∈ Br(V) ⊂ Br(k(X)) exactly when V meets none of the prime divisors along which α ramifies; hence U_α is itself such an open and contains every other one. For a smooth proper surface S over ℝ and α ∈ Br(ℝ(S)), U_α is a dense open of S whose complement is a curve or empty, and the complement is empty exactly when α ∈ Br(S). (B19, §2.4, p. 75)

A construction can proceed as follows.

1. α lies in Br(V) for a dense open V (a central simple algebra over k(X) spreads out to an Azumaya algebra over some V), so res_Γ(α) = 0 for every Γ meeting V, and only the finitely many divisors in X ∖ V can carry nonzero residue.
2. On U = X ∖ (ramified divisors), α is unramified at every codimension-one point; the residue exact sequence for smooth varieties in characteristic zero (HeightsRationalPointsAndObstructions §2.16b, `smoothBrauer_residueExact`) puts α in Br(U).
3. Maximality: if α ∈ Br(W) then every residue at a divisor meeting W vanishes by the residue sequence, so W ⊂ U.

The definition has the following API.

- U_α : X.Opens, the complement of the prime divisors with nonzero residue.
- For open V ⊂ X, α ∈ Br(V) iff V ⊂ U_α.
- Only finitely many prime divisors have nonzero residue.
- U_0 = X.
- U_α ⊂ `U_{mα}` for every integer m.
- For a dominant morphism f : Y → X of smooth integral varieties, f⁻¹(U_α) ⊂ `U_{f*α}`.

**Checks.**

- If α ∈ Br(X) then U_α = X.
- For α = (x, y) over ℝ(x, y) on 𝔸², U_α = 𝔸² ∖ {xy = 0}.
- For α = (x, y) on 𝔸², 2α = 0 has `U_{2α}` = 𝔸² ≠ U_α: the locus is not preserved by multiples.
- For X = Spec of a field (dimension 0) U_α = X and Br(X) is Mathlib's `BrauerGroup`.
- If S is a smooth projective real surface and α ∈ Br(S), then U_α = S.
- The injection Br(U) ↪ Br(k(X)) is not an affine statement: for U = ℙ²_ℝ, Br(ℙ²_ℝ) = Br(ℝ) = ℤ/2 maps to Br(ℝ(x, y)) with the Hamilton class going to ℍ ⊗ ℝ(x, y), which is still a division algebra because −1 is not a sum of two squares in the real field ℝ(x, y); a version of the injection restricted to affine opens would not cover this projective U.

*Needs:* HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); Mathlib `AlgebraicGeometry.Scheme.functionField`.

### 1.2 Kummer and topological Brauer sequences

Br(X) = H²_ét(X, 𝔾_m) and X smooth over ℂ or ℝ. μ_n(ℂ) is identified with ℤ/n(1) = √−1·ℤ/n as a G-module by √−1·k ↦ exp(2π√−1·k/n).

Let X be a smooth variety and n ≥ 1. Over ℂ there are exact sequences 0 → Pic(X)/n → H²(X(ℂ), ℤ/n) → Br(X)[n] → 0 and 0 → H²(X(ℂ), ℤ)/⟨n, cl_ℂ(Pic X)⟩ → Br(X)[n] → H³(X(ℂ), ℤ)[n] → 0. Over ℝ, with G = Gal(ℂ/ℝ), there are exact sequences 0 → Pic(X)/n → H²_G(X(ℂ), ℤ/n(1)) → Br(X)[n] → 0 and 0 → H²_G(X(ℂ), ℤ(1))/⟨n, cl(Pic X)⟩ → Br(X)[n] → H³_G(X(ℂ), ℤ(1))[n] → 0, with cl Krasnov's cycle class map; if X is moreover proper and geometrically connected, there is an exact sequence 0 → ℝˣ/ℝˣ² → H¹_G(X(ℂ), 𝔽₂) → Pic(X)[2] → 0. (B19, (1.1)–(1.2), p. 69; B19, (2.16)–(2.17), p. 76; B19, Proof of Theorem 0.6, p. 106)

A proof can proceed as follows.

1. The étale Kummer sequence and Hilbert 90 (SchemeAndStackFoundations §2.11; with its Brauer term, §2.22 `brauer_kummer_sequence`) give 0 → Pic(X)/n → H²_ét(X, μ_n) → Br(X)[n] → 0.
2. Over ℂ, ComplexComparisonPartII §C6.3 (`artinComparison`) identifies H²_ét(X, μ_n) with H²(X(ℂ), ℤ/n); over ℝ, the étale–equivariant comparison (gap:real-artin-comparison) identifies it with H²_G(X(ℂ), ℤ/n(1)).
3. The coefficient sequence 0 → ℤ(1) → ℤ(1) → ℤ/n(1) → 0, multiplication by n first, gives 0 → H²(ℤ(1))/n → H²(ℤ/n(1)) → H³(ℤ(1))[n] → 0 (equivariantly over ℝ, plainly over ℂ). The Kummer class of a line bundle M is the reduction modulo n of its cycle class, κ(M) = cl(M) mod n (compatibility of cl with Kummer boundaries, MotivesAndAlgebraicCycles §7.6b), so its Bockstein is 0 and the image of Pic(X)/n lies in H²(ℤ(1))/n, where it is the image of cl(Pic X). Dividing the coefficient sequence by this image gives 0 → H²(ℤ(1))/⟨n, cl(Pic X)⟩ → Br(X)[n] → H³(ℤ(1))[n] → 0. (The Bockstein relation of a Kummer class with a cycle class is the degree-one statement of §1.3, for the boundary of a class of H¹.)
4. In degree one, H⁰(X, 𝔾_m) = ℝˣ when X is proper and geometrically connected, and H¹_ét(X, 𝔾_m) = Pic(X).

**Checks.**

- For X = Spec ℝ: Pic = 0, H²_G(pt, ℤ(1)) = H²(G, ℤ(1)) = 0 and H³_G(pt, ℤ(1)) = ℤ/2, so the quaternion class of Br(ℝ)[2] ≅ ℤ/2 is purely topological.
- For X = ℙ¹_ℂ, H²(ℙ¹(ℂ), ℤ/n) = ℤ/n = Pic/n, so Br(ℙ¹_ℂ)[n] = 0.
- For X = Spec ℝ in degree one, H¹_G(pt, 𝔽₂) = 𝔽₂ ≅ ℝˣ/ℝˣ² and Pic = 0.
- Degree check on X = ℙ¹_ℂ, M = O(1), n = 2: κ(M) = 1 ∈ H²(ℙ¹(ℂ), ℤ/2), its Bockstein is 0 ∈ H³(ℙ¹(ℂ), ℤ) = 0, and cl(M) = c₁(M) = 1 ∈ H²(ℙ¹(ℂ), ℤ) reduces to κ(M); the cycle class is the integral lift of the Kummer class, not its Bockstein, which lies in degree 3.

*Needs:* SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §2.22 (`brauer_kummer_sequence`); ComplexComparisonPartII §C6.3 (`artinComparison`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); MotivesAndAlgebraicCycles §7.6b.

### 1.3 The real class of a two-torsion line bundle

X smooth over ℝ; υ uses the étale–equivariant comparison in degree one (gap:real-artin-comparison) and μ₂ ⊂ 𝔾_m. [e]₁ is the degree-one component of the canonical decomposition H¹_G(X(ℝ), 𝔽₂) = H⁰(X(ℝ)) ⊕ H¹(X(ℝ)).

Let X be a smooth variety over ℝ, e ∈ H¹_G(X(ℂ), 𝔽₂), and υ(e) ∈ Pic(X)[2] its image under H¹_G(X(ℂ), 𝔽₂) ≅ H¹_ét(X, μ₂) → Pic(X). Then cl_R(υ(e)) = [e]₁ in H¹(X(ℝ), 𝔽₂). (B19, Lemma 2.1 and proof, p. 75; BW20, Proof of Lemma 3.4)

A proof can proceed as follows.

1. The Kummer boundary of e in H²_G(X(ℂ), ℤ(1)) is cl(υ(e)) (compatibility of Krasnov's class with the Kummer boundary, MotivesAndAlgebraicCycles §7.6b).
2. Restricted to X(ℝ), the Bockstein of 0 → ℤ(1) → ℤ(1) → 𝔽₂ → 0 followed by reduction modulo 2 is (a₀, a₁) ↦ (0, a₁, Sq¹a₁) in canonical components. The untwisted component formula of AlgebraicTopologyPartII §7.4 gives (a₀, 0, Sq¹a₁) in degree 1; the coefficients ℤ(1) are the sign system of the covering X(ℂ) × G → X(ℂ), whose extension class is ω, so the boundary is β + ω ∪ (·) (AlgebraicTopologyPartII §14.2), and adding ω ∪ (a₀, a₁) = (a₀, a₁, 0) gives (0, a₁, Sq¹a₁) (with [ξ]_i = [ξ ∪ ω]_i from MotivesAndAlgebraicCycles §7.6b).
3. Krasnov's compatibility cl_R(M) = [cl(M)]₁ (MotivesAndAlgebraicCycles §7.6b) identifies the degree-one component a₁ = [e]₁ with cl_R(υ(e)).

**Checks.**

- For X = Spec ℝ, H¹(X(ℝ)) = 0 and both sides vanish.
- For X = ℙ¹_ℝ, Pic(X)[2] = 0 and H¹_G(ℙ¹(ℂ), 𝔽₂) is the constant class of ℝˣ/ℝˣ², whose degree-one component on the circle ℙ¹(ℝ) is 0, as the formula predicts.
- On a real Enriques surface, a lift of K_S has [e]₁ = cl_R(K_S) = w₁ (§9.5).
- The sign twist of step 2 is needed: on X = Spec ℝ and e = ω (a₀ = 1, a₁ = 0), the untwisted formula of AlgebraicTopologyPartII §7.4 alone gives degree-zero component 1, that is ω² ≠ 0, whereas the target H²_G(pt, ℤ(1)) is 0 (§1.2 Checks); the term ω ∪ e = ω² of §14.2 cancels it, 1 + 1 = 0.

*Needs:* §1.2; ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); AlgebraicTopologyPartII §7.4; AlgebraicTopologyPartII §14.2; MotivesAndAlgebraicCycles §7.6b.

### 1.4 Real evaluation and the nonzero evaluation locus

U smooth over ℝ; G = Gal(ℂ/ℝ) acts on U(ℂ) with fixed locus U(ℝ). Real components [ξ]_i are those of the canonical decompositions of MotivesAndAlgebraicCycles §7.6b.

Let U be a smooth variety over ℝ and α ∈ Br(U). For x ∈ U(ℝ) the evaluation α_x ∈ Br(ℝ) ≅ ℤ/2 is the pullback along x : Spec ℝ → U. The nonzero evaluation locus Θ(α) = {x ∈ U(ℝ) : α_x ≠ 0} is a union of connected components of U(ℝ). If α ∈ Br(U)[n] and α̃ ∈ H²_G(U(ℂ), ℤ/n(1)) lifts α in the Kummer sequence, then for n = 2 the degree-zero real component of α̃ is the indicator of Θ(α); for n even, the mod-2 reduction of α̃ lifts (n/2)α and its degree-zero component is `(n/2 mod 2)·1_{Θ(α)}`, which vanishes when 4 | n. (B19, §0.3, p. 64; §4, p. 79; §6.3, p. 95; B19, (2.16), p. 76)

A construction can proceed as follows.

1. Evaluation is a group homomorphism Br(U) → Br(ℝ) for each x, through Tau Ceti's `TauCeti.Quaternion.brauerGroupMulEquiv`.
2. Local constancy: restriction to U(ℝ) followed by the canonical decomposition H²_G(U(ℝ), 𝔽₂) ≅ H⁰ ⊕ H¹ ⊕ H² (MotivesAndAlgebraicCycles §7.6b) makes x ↦ [α̃]_0(x) a locally constant function, and it equals α_x under H²_G(pt, 𝔽₂) ≅ Br(ℝ)[2].
3. For even n, the reduction ℤ/n(1) → ℤ/2 sends a mod-n lift of α to a lift of (n/2)α; at a real point it multiplies the evaluation by n/2, so the degree-zero component is (n/2 mod 2)·1_Θ.

The definition has the following API.

- α_x ∈ Br(ℝ) for x ∈ U(ℝ), a group homomorphism in α.
- Θ(α) ⊂ U(ℝ).
- Θ(α) is open and closed in U(ℝ) with the Euclidean topology.
- (α + β)_x = α_x + β_x and 0_x = 0.
- Θ(mα) = Θ(α) if m is odd and ∅ if m is even.
- For a mod-n Kummer lift α̃ with n even, `[α̃ mod 2]_0 = (n/2 mod 2)·1_{Θ(α)}`.
- (f*α)_y = `α_{f(y)}` for f : V → U and y ∈ V(ℝ).

**Checks.**

- For α the pullback of the Hamilton quaternion class, Θ(α) = U(ℝ).
- If U(ℝ) = ∅ then Θ(α) = ∅.
- Θ(2α) = ∅ for every α, so the half-period class need not detect Θ(α) when 4 | per α.
- For U = Spec ℝ, real evaluation is the identity of Br(ℝ) under `TauCeti.Quaternion.brauerGroupMulEquiv`.
- For α = (−1, x) on 𝔾_m over ℝ, Θ(α) = {x < 0}.
- If α has period 4, Θ(2α) = ∅ while Θ(α) can be nonempty.

*Needs:* §1.1; §1.2; Tau Ceti `TauCeti.Quaternion.brauerGroupMulEquiv`; MotivesAndAlgebraicCycles §7.6b.

### 1.5 Period and index under extension of algebraically closed fields

k and K algebraically closed, of any characteristic; X_K = X ×_k K is integral because k is algebraically closed, and k(X) ⊂ K(X_K). Period and index as in §0.12.

Let k ⊂ K be algebraically closed fields, X an integral variety over k and α ∈ Br(k(X)), with image α_K ∈ Br(K(X_K)). Then per(α_K) = per(α) and ind(α_K) = ind(α). This is the Lefschetz-principle step by which de Jong's theorem is reduced to ℂ (B19, §0.6, p. 68, which invokes it without proof); it is proved here by spreading out (SchemeAndStackFoundations §0.9) from the description of the index as the gcd of the degrees of the finite splitting fields (CT05, §2.2, p. 382).

A proof can proceed as follows.

1. ind(α_K) divides ind(α) and per(α_K) divides per(α) (§0.12).
2. Let L/K(X_K) be a finite separable splitting field of α_K of degree d = ind(α_K). Spread out: there are a finitely generated k-subalgebra A ⊂ K, a dense open V ⊂ X ×_k Spec A, a finite étale V-scheme W of degree d whose base change along Spec K → Spec A is an integral finite étale cover of the dense open `V_K = V ×_{Spec A} Spec K` of X_K with function field L, and an Azumaya algebra on V, pulled back from one representing α on a dense open of X, whose pullback to W is split (SchemeAndStackFoundations §0.9).
3. Since k is algebraically closed, k-points of Spec A are dense; for a in a dense open set, V_a is a dense open of X, W_a → V_a is finite étale of degree d, and W_a splits α. Each component of W_a has function field a finite splitting field of degree at most d, so ind(α) ≤ d.
4. With the first step, ind(α) = ind(α_K). Applied to the multiples mα: mα_K = 0 gives ind(mα) = 1, so mα = 0, and per(α) = per(α_K).

**Checks.**

- For k = K the statement is empty.
- For ℚ̄ ⊂ ℂ, X = 𝔸² and α = (x, y): per = ind = 2 over ℚ̄(x, y) and over ℂ(x, y), the norm form ⟨1, −x, −y, xy⟩ being anisotropic over both by Springer's theorem at the origin.
- Algebraic closedness of k is needed: for ℝ ⊂ ℂ and X = Spec ℝ, the quaternion class has index 2 over ℝ and 1 over ℂ.
- The spread-out cover W of step 2 does not have function field L when k ≠ K, since it is of finite type over k: for ℚ̄ ⊂ ℂ, X = 𝔸², α = (x, y) and L = ℂ(x, y)(√x) one may take A = ℚ̄ and W = Spec ℚ̄[x, y, z, (xy)⁻¹]/(z² − x), whose function field is ℚ̄(x, y)(√x); L is the function field of its base change to ℂ, and specialising at the only point of Spec ℚ̄ gives a splitting field of degree 2 = d, so ind(α) ≤ 2.

*Needs:* §0.12; SchemeAndStackFoundations §0.9.

### 1.6 Azumaya models of prescribed degree over regular schemes of dimension at most two

X regular, integral and Noetherian of dimension at most 2, with function field K. Br(X) is the Brauer group of Azumaya algebras up to stabilised equivalence of SchemeAndStackFoundations §2.22; an Azumaya algebra on the connected X has constant degree. The degree of a central simple algebra A is the integer d with dim A = d².

Let X be a regular integral Noetherian scheme of dimension at most 2 with function field K, β ∈ Br(X), and A a central simple K-algebra of degree d whose class in Br(K) is the restriction β_K of β. Then there is an Azumaya O_X-algebra 𝒜 of degree d and class β with an isomorphism of K-algebras `𝒜 ⊗_{O_X} K ≅ A`. Consequently, at every point x of X the fibre 𝒜 ⊗ κ(x) is a central simple κ(x)-algebra of degree d whose class is the restriction β(x) of β, and ind(β(x)) divides d. (CT05, Theorem 2.5, first assertion, p. 385; its dimension-one case is the step that ends the proof of Theorem 3.14, CT05 p. 401)

A proof can proceed as follows.

1. Let 𝒞 be an Azumaya O_X-algebra of class −β, the opposite algebra of a representative of β (SchemeAndStackFoundations §2.22, `mk_opposite`), and c its degree. Let D be the central division K-algebra of class β_K and e its degree; then 𝒞_K ≅ M_r(D^op) with c = re, and A ≅ M_m(D) with d = me (Wedderburn). For V the sum of m copies of the simple left 𝒞_K-module (D^op)^r, whose endomorphism algebra is D, `End_{𝒞_K}(V)` ≅ M_m(D) ≅ A and dim_K V = mre².
2. Let N₀ be the 𝒞-submodule of the constant sheaf V generated by a K-basis of V, a torsion-free coherent sheaf with generic fibre V, and N its reflexive hull (SchemeAndStackFoundations §0.6, `reflexiveHull`; the 𝒞-action extends by `reflexiveHull.lift`). The stalks of N are finitely generated reflexive modules over regular local rings of dimension at most 2 (`isReflexive_iff_forall_stalk`), hence free (Tau Ceti `TauCeti.IsRegularLocalRing.free_of_isReflexive`), so N is a locally free O_X-module of rank mre² with a structure of 𝒞-module.
3. Let 𝒜 = End_𝒞(N) be the commutant of 𝒞 in `End_{O_X}(N)`; it is coherent and its formation commutes with flat base change. Étale locally 𝒞 ≅ M_c(O) (the definition of an Azumaya algebra in SchemeAndStackFoundations §2.22), and Morita theory for matrix algebras (Mathlib `ModuleCat.matrixEquivalence`) writes N ≅ O^c ⊗ P with P locally free of rank mre²/c = d, so that 𝒜 ≅ End_O(P). Hence 𝒜 is Azumaya of degree d; the natural map 𝒞 ⊗ 𝒜 → `End_{O_X}(N)` is an isomorphism, being one étale locally, and `End_{O_X}(N)` has class 0, so [𝒜] = −[𝒞] = β (`mk_eq_zero_iff`, `mk_tensor`); and 𝒜_K = `End_{𝒞_K}(V)` ≅ A.
4. The fibre at x is a central simple κ(x)-algebra of degree d and class β(x), so its index divides d (§0.12).

**Checks.**

- Over the discrete valuation ring ℝ[t]_(t), with β the constant Hamilton class and A = ℍ ⊗ ℝ(t) (d = 2), the model is ℍ ⊗ ℝ[t]_(t), whose fibre at t = 0 is ℍ, of index 2 = d: the divisibility ind(β(x)) | d is sharp.
- With the same β and A = M_2(ℍ ⊗ ℝ(t)) (d = 4), the model M_2(ℍ ⊗ ℝ[t]_(t)) has degree 4 and its fibre at t = 0 has index 2: the degree prescribed by A is kept, not replaced by the index of β_K.
- The class (−1, t) over ℝ(t) has residue at t = 0 the class of −1 in ℝˣ/ℝˣ², which is nonzero (HeightsRationalPointsAndObstructions §2.16b), so it does not come from Br(ℝ[t]_(t)) and has no Azumaya model of any degree over ℝ[t]_(t): the hypothesis on the class cannot be dropped.
- Over R = ℂ[t]_(t), the order O of M_2(ℂ(t)) of matrices with entries in R and lower-left entry in tR has generic fibre M_2(ℂ(t)) but is not Azumaya. It is free over R with basis e₁₁, e₁₂, te₂₁, e₂₂, so its fibre O/tO at t = 0 has dimension 4. The classes x of e₁₂ and y of te₂₁ satisfy x² = y² = 0 and xy = yx = 0 (xy = te₁₁ and yx = te₂₂ lie in tO), so they span a two-sided ideal J with J² = 0, the radical of O/tO, and (O/tO)/J ≅ ℂ × ℂ. The fibre is therefore not simple, whereas the fibre M_2(ℂ) of M_2(R) has radical 0. Reducing the entries of O modulo t gives only the three-dimensional algebra of upper triangular matrices, the quotient of O/tO by the line spanned by y, so it is not the fibre. An order with generic fibre A need not be Azumaya, and the construction produces End_𝒞(N) (here 𝒞 = R, N = R² and 𝒜 = M_2(R)).

*Needs:* SchemeAndStackFoundations §2.22 (`mk_opposite`); SchemeAndStackFoundations §2.22 (`mk_eq_zero_iff`); SchemeAndStackFoundations §2.22 (`mk_tensor`); SchemeAndStackFoundations §0.6 (`reflexiveHull`); Tau Ceti `TauCeti.IsRegularLocalRing.free_of_isReflexive`; Mathlib `ModuleCat.matrixEquivalence`; §0.12.

### 1.7 Saltman's local form of a class whose ramification has normal crossings

R excellent regular local of dimension 2, with maximal ideal 𝔪, residue field κ and fraction field K; l a prime invertible in R. For a, b ∈ Kˣ, (a, b) ∈ H²(K, μ_l^⊗2) is the cup product of their Kummer classes. For a height-one prime 𝔭, R_𝔭 is a discrete valuation ring whose residue field κ(𝔭) has characteristic different from l.

Let R be as above and α ∈ H²(K, μ_l^⊗2). For a height-one prime 𝔭 let ∂_𝔭(α) ∈ H¹(κ(𝔭), μ_l) be the residue of α at R_𝔭; it is nonzero for only finitely many 𝔭, and the ramification locus of α is the union of the corresponding closed sets V(𝔭). Suppose that this locus is a strict normal crossings divisor of Spec R: it is empty, or V(s) for an s ∈ 𝔪 with R/s regular, or V(st) for s, t generating 𝔪. Then (i) if the locus is empty, α lies in the image of H²_ét(Spec R, μ_l^⊗2) → H²(K, μ_l^⊗2); (ii) if it is V(s), there is u ∈ Rˣ with α − (u, s) in that image; (iii) if it is V(st), there are u, v ∈ Rˣ and r ∈ ℤ/l with α − (u, s) − (v, t) − r(s, t) in that image. When R contains a primitive l-th root of unity, a choice of it identifies H²(K, μ_l^⊗2) with Br(K)[l] and (a, b) with the class of a cyclic algebra, and the image of H²_ét(Spec R, μ_l^⊗2) with the image of Br(R)[l] (Kummer sequence, with Pic R = 0). (CT05, Proposition 2.6 and proof, p. 386; the residue complex and purity it uses are CT05, Proposition 2.3, pp. 384–385)

A proof can proceed as follows.

1. Residue complex and purity. The coniveau spectral sequence of Spec R for the sheaf μ_l^⊗2 (PurityForFlatCohomology §8.4), with Gabber's absolute purity applied at each point z to the closed point of Spec `O_{R,z}`, a regular closed subscheme of codimension dim `O_{R,z}` (LefschetzPencilsAndVanishingCycles §0.10), has the row `H²(K, μ_l^⊗2) → ⊕_𝔭 H¹(κ(𝔭), μ_l) → H⁰(κ, ℤ/l)` on its first page. This row is a complex; its first map is the residue, and on the summand of a prime 𝔭 = (s) with R/s regular its second map is the valuation of the discrete valuation ring R/s, taken modulo l on κ(𝔭)ˣ/l = H¹(κ(𝔭), μ_l). The only later differential leaving the H²(K) term lands in a subquotient of H³_𝔪(Spec R, μ_l^⊗2), which vanishes by purity (H^q_𝔪 = 0 for q < 4), and Spec R has no points of codimension above 2, so the image of H²_ét(Spec R, μ_l^⊗2) in H²(K, μ_l^⊗2) is the kernel of the residue map.
2. Residues of symbols. For 𝔭 = (π) and units u, u′ of R_𝔭, ∂_𝔭(u, π) is the Kummer class of the image ū of u and ∂_𝔭(u, u′) = 0, with a sign fixed once for all: the boundary of the Kummer class of π is the fundamental class of V(π) (LefschetzPencilsAndVanishingCycles §0.10) and the boundary is linear over classes coming from R_𝔭; when R contains the l-th roots of unity this is HeightsRationalPointsAndObstructions §2.16b, `brauerResidue_henselianFormula`, applied after henselisation of R_𝔭, which does not change residues.
3. (i) is the exactness of step 1.
4. (ii): the residue ξ = ∂_s(α) has valuation divisible by l at 𝔪, because V(s) is the only branch of the ramification locus through 𝔪 and step 1 is a complex; so ξ is the class of a unit of R/s, which lifts to u ∈ Rˣ since R is local. By step 2, α − (u, s) has zero residue along s = 0 and along every other height-one prime, at which u and s are units; apply (i).
5. (iii): the residue of (s, t) along s = 0 is the class of ±t̄, of valuation ±1 at 𝔪, so for one r ∈ ℤ/l the residue of α − r(s, t) along s = 0 has valuation divisible by l at 𝔪, and by the complex property of step 1 so does its residue along t = 0. The argument of (ii) on each branch gives u, v ∈ Rˣ, and α − r(s, t) − (u, s) − (v, t) has zero residue at every height-one prime (t is a unit at (s) and s at (t)); apply (i).

**Checks.**

- Crossing term: on R = ℂ[s, t]_(s,t) with l = 2 and α = (s, t), the ramification locus is V(st), and (iii) holds with u = v = 1 and r = 1. The value r = 0 is impossible: for units u, v the residue of α − (u, s) − (v, t) along s = 0 is the class of t̄·ū⁻¹, of valuation 1 at 𝔪. After adjoining √(st) the crossing term vanishes: (s, t) = (s, st) + (s, −1) = (s, st) = 0, by (s, −s) = 0, since −1 is a square in ℂ and st becomes a square.
- One branch: on the same R, α = (1 + t, s) has ramification locus V(s) and residue the class of 1 + t̄, a unit at 𝔪, and (ii) holds with u = 1 + t. No class of H²(K, μ_2) is ramified along V(s) alone with residue the class of t̄, whose valuation at 𝔪 is 1, with no second branch to cancel it in the complex of step 1; the class (t, s), which has this residue along s = 0, is ramified along t = 0 as well.
- Empty locus: on R = ℝ[s, t]_(s,t) with l = 2, α = (−1, 1 + s² + t²) has zero residue at every height-one prime, both entries being units of R, so it comes from H²_ét(Spec R, μ_2), and its restriction to the residue field ℝ is (−1, 1) = 0. It is nonzero: otherwise 1 + s² + t² would be a sum of two squares in ℝ(s)(t), hence of two squares (a + bt)² + (c + dt)² with a, b, c, d ∈ ℝ(s) (EKM, Corollary 17.6, p. 72, over ℝ(s), with degrees bounded because ℝ(s) is real), and b² + d² = 1, ab + cd = 0 force a² + c² = 1 + s² to be a square in ℝ(s), which it is not. So (i) does not say that α vanishes.

*Needs:* PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles §0.10; HeightsRationalPointsAndObstructions §2.16b (`brauerResidue_henselianFormula`); SchemeAndStackFoundations §2.22 (`brauer_kummer_sequence`).

### 1.8 De Jong's reduction to unramified classes

char k = 0; X connected smooth projective; α possibly ramified, of prime period l. Index and period as in §0.12. As k is algebraically closed, a primitive l-th root of unity identifies Br(F)[l] with H²(F, μ_l^⊗2) for every field F ⊃ k, so §1.7 applies to α at the local rings of a smooth surface over such a field.

Let k be an algebraically closed field of characteristic 0, X a connected smooth projective surface over k, α ∈ Br(k(X)) of prime period l, and Ω an algebraic closure of k(t). There are a connected smooth projective surface Y over Ω and a dominant generically finite morphism r : Y → X_Ω such that r*α_Ω ∈ Br(Ω(Y)) lies in Br(Y) and ind(α) divides ind(r*α_Ω). (CT05, §3.6, Theorem 3.14 and proof, Lemma 3.15, pp. 400–403, with source correction E24; CT05, Theorem 2.5 and Proposition 2.6, pp. 385–386; B19, §0.6, p. 68)

A proof can proceed as follows.

1. Blow up X so that the ramification divisor D of α is a strict normal crossings divisor (ResolutionOfSingularitiesCharacteristicZero §5.1, principalization).
2. Choose smooth effective divisors E, E′ with D + E linearly equivalent to l(D + E′), no two of D, E, E′ with a common component, and D + E + E′ normal crossings (Bertini, SchemeAndStackFoundations §4.13); with sections s₀ of O(D + E) and s₁ of O(D + E′), form s_t = t^l s₁^l + (1 − t)^l s₀ on X × 𝔸¹ and the generically cyclic degree-l cover of X × 𝔸¹ extracting an l-th root of s_t (CT05 Lemma 3.15).
3. Over t = 1 the cover is z^l = s₁^l, the union of the l components z = ζ^i s₁ (ζ a primitive l-th root of unity), each of multiplicity one and isomorphic to X; over t = 0 it is z^l = s₀, which is irreducible and of degree l over X because s₀ vanishes to order one along D (source correction E24). Since the zero locus D + E of s₀ has strict normal crossings, so has the zero locus of s_t for general t (Bertini), and the generic fibre has only `A_{l−1}` singularities. The cover is a hypersurface in the total space of O(D + E′) over X × 𝔸¹, étale over the complement of the divisor {s_t = 0}; that divisor is reduced (it contains no fibre of X × 𝔸¹ → 𝔸¹, since s_t restricts to s₁^l at t = 1, to s₀ at t = 0 and to nonzero sections elsewhere, and it is reduced on the general fibre), so its singular locus, over which all singular points of the cover lie, has dimension at most one. The generic points of the fibre components over 0 and 1 lie in the étale locus, where z ≠ 0. Field resolution (ResolutionOfSingularitiesCharacteristicZero §7.8, `exists_resolution`: a projective birational morphism from a scheme smooth over k, an isomorphism over the smooth locus) therefore resolves the cover without changing anything above those generic points, and gives an open W of the resolution with f : W → 𝔸¹ smooth, geometric generic fibre Y := W_Ω connected smooth projective, and fibre over 1 containing a multiplicity-one component birational to X (CT05 properties (i)–(iii), with the fibre over 1 in (iii)).
4. r*α_Ω is unramified on Y. Over components of D the residue is multiplied by the ramification index l (HeightsRationalPointsAndObstructions §2.16b, `pullbackMultiplicity`). Over a closed point N of D_Ω, §1.7 applies at the local ring of X_Ω at N, which is excellent and regular of dimension 2. If N lies on a single component s = 0 of D, then α = (u, s) + (a class from the local ring), and the residue of (u, s) along a divisor of Y over N is a power of the image of u in its residue field, trivial because it factors through the algebraically closed residue field of N. If N is a crossing s = s′ = 0 of D, then N lies neither on E′ nor on the residual divisor E_t of the zero locus D + E_t of s_t (at most two branches of a normal crossings divisor on a surface pass through a point), so s_t/s₁^l = c·s·s′·h^l with c a unit at N and h = (ss′)⁻¹; then (s, s′) = (s, s_t/s₁^l) + (s, −c⁻¹), by (s, −s) = 0, the first term vanishes on Y, which extracts an l-th root of s_t/s₁^l, and the remaining terms (u, s), (v, s′) and (s, −c⁻¹) have trivial residues over N as before (CT05 pp. 402–403).
5. Specialisation. A central simple algebra B of degree d = ind(r*α_Ω) and class r*α_Ω is defined over the function field of the generic fibre of W base-changed to a finite extension L/k(t) inside Ω, with class there the pullback of α. Let C be the normalisation of 𝔸¹ in L and M a k-point of C above 1 (k is algebraically closed). `Z = W ×_{𝔸¹} C` is smooth over C, so the local ring O of Z at the generic point ξ of a component of the fibre Z_M lying over a component of the fibre over 1 birational to X is a discrete valuation ring with residue field κ(ξ) ≅ k(X); Spec O → X factors through the generic point of X, so the pullback of α is a class β ∈ Br(O) whose restriction to κ(ξ) is α. By §1.6 in dimension one, B is the generic fibre of an Azumaya O-algebra of degree d and class β, whose fibre at ξ is a central simple k(X)-algebra of degree d and class α. Hence ind(α) | d.

**Checks.**

- If α is unramified, Y = X_Ω and r = id satisfy the statement, which then reads ind(α) | ind(α_Ω), an equality by §1.5.
- For α = (x, y) on ℙ² over ℂ, of period 2 and ramified along the two axes and the line at infinity, the construction extracts a square root of a function vanishing to order one along the ramification, after which the pulled-back class is unramified.
- The fibre used for specialisation is the one over 1: for l = 2 and local equations s₀ = s₁ = x of D near a point of D off E ∪ E′, the fibre over 0 is z² = x, irreducible over k(x, y) and of degree 2 over X, while the fibre over 1 is (z − x)(z + x) = 0, with two components of degree 1 over X. Specialising at a point above 0 would give a residue algebra over the quadratic extension k(X)(√x), hence only ind(α) | 2d by §0.12.

*Needs:* ResolutionOfSingularitiesCharacteristicZero §5.1 (principalization); ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); SchemeAndStackFoundations §4.13; HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); §1.1; §1.6; §1.7; §0.12.

### 1.9 Removing finitely many points and extending line bundles

S smooth, hence regular and locally factorial, so Weil and Cartier divisors agree; Σ a surface (two-dimensional manifold) and Z finite.

Let S be a smooth integral surface over ℝ and V ⊂ S a dense open. Every line bundle on V extends to S (Pic(S) → Pic(V) is onto). If Z ⊂ S is finite and Σ ⊂ S(ℝ) is open (for instance a union of connected components, or a subset open and closed in U(ℝ) for an open U ⊂ S), restriction H¹(Σ, 𝔽₂) → H¹(Σ ∖ Z, 𝔽₂) is injective. These are the extension and injectivity steps used to pass from the finite-flat open U₀ to U. (B19, Proof of Proposition 7.1, pp. 103–104; Proposition 4.5 proof, p. 85)

A proof can proceed as follows.

1. S is regular (Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`, applied to S → Spec ℝ) and every point of the surface S has codimension at most 2, so its local rings are factorial (Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk`), and so are those of V; hence Pic = Cl on S and on V (SchemeAndStackFoundations §3.4, `classGroup_picard_locallyFactorial`). A line bundle on V is O_V(D) for a Weil divisor D on V; its closure in S is a Weil divisor, Cartier because S is locally factorial, restricting to D. Equivalently: remove the codimension-one components of S ∖ V one at a time (SchemeAndStackFoundations §3.4, `picard_excision_sequence`), then the finitely many remaining closed points, which changes neither the prime divisors nor the principal divisors.
2. Σ ∖ Z ⊂ Σ: removing points from a surface does not change H¹ except through H¹ classes supported near the points, and the long exact sequence of the pair with H¹ of a punctured disc neighbourhood shows the restriction is injective (excision gives H¹(Σ, Σ ∖ Z) = ⊕ H¹(D, D ∖ {pt}) = 0).

**Checks.**

- For Σ = S² and Z one point, H¹(S²) = 0 → H¹(ℝ²) = 0 is injective.
- For Σ a torus and Z a point, H¹ is unchanged.
- For Σ = ℝ² ⊂ ℝℙ² and Z a point, H¹(ℝ²) = 0 → H¹(ℝ² ∖ pt) = 𝔽₂ is injective though not surjective; compactness of Σ is not needed.
- For S = ℙ²_ℝ and V = 𝔸²_ℝ, the excision sequence reads ℤ → Cl(ℙ²) = ℤ → Cl(𝔸²) = 0 → 0 with 1 ↦ [line], and Pic(ℙ²) = ℤ → Pic(𝔸²) = 0 is onto.
- Negative control: on the quadric cone X = Spec ℝ[x, y, z]/(xy − z²), which is normal but not smooth at the vertex, Pic(X) = 0 while Cl(X) = ℤ/2 is generated by the ruling x = z = 0; for V = X ∖ {vertex}, smooth, Pic(V) = Cl(V) = ℤ/2, so Pic(X) → Pic(V) is not onto: the smoothness (local factoriality) of S cannot be dropped.

*Needs:* Mathlib `AlgebraicGeometry.Scheme`; SchemeAndStackFoundations §3.4 (`classGroup_picard_locallyFactorial`, `picard_excision_sequence`); Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`; Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk`; AlgebraicTopology Stage 6.

### Examples

For α = (x, y) over ℝ(x, y), the unramified locus in 𝔸² is the complement of the two axes, while 2α = 0 is unramified everywhere. For α = (−1, x) on 𝔾_m over ℝ, the evaluation at a real point x₀ is the quaternion class (−1, x₀), nonzero exactly when x₀ < 0, so Θ(α) = {x < 0} is open and closed in 𝔾_m(ℝ). On Spec ℝ the topological Brauer sequence identifies the quaternion class with the generator of H³_G(pt, ℤ(1)) = ℤ/2: it is purely topological, Pic and H²_G(pt, ℤ(1)) being zero. (B19 §2, pp. 71–75.)

### Dependencies

Layer 0; AlgebraicTopology Stage 6; AlgebraicTopologyPartII §7.4; AlgebraicTopologyPartII §14.2; ComplexComparisonPartII §C6.3 (`artinComparison`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); HeightsRationalPointsAndObstructions §2.16b (`brauerResidue_henselianFormula`); HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); LefschetzPencilsAndVanishingCycles §0.10; Mathlib `AlgebraicGeometry.Scheme.functionField`; Mathlib `AlgebraicGeometry.Scheme`; Mathlib `ModuleCat.matrixEquivalence`; MotivesAndAlgebraicCycles §7.6b; PurityForFlatCohomology §8.4; ResolutionOfSingularitiesCharacteristicZero §5.1 (principalization); ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); SchemeAndStackFoundations §0.6 (`reflexiveHull`); SchemeAndStackFoundations §0.9; SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §2.22 (`brauer_kummer_sequence`); SchemeAndStackFoundations §2.22 (`mk_eq_zero_iff`); SchemeAndStackFoundations §2.22 (`mk_opposite`); SchemeAndStackFoundations §2.22 (`mk_tensor`); SchemeAndStackFoundations §3.4 (`classGroup_picard_locallyFactorial`); SchemeAndStackFoundations §3.4 (`picard_excision_sequence`); SchemeAndStackFoundations §4.13; Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`; Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk`; Tau Ceti `TauCeti.IsRegularLocalRing.free_of_isReflexive`; Tau Ceti `TauCeti.Quaternion.brauerGroupMulEquiv`.

## Layer 2: de Jong's theorem by Hodge theory, and the norm bound over real closed fields

The weight-two variation of a family of surfaces and Griffiths' formula; Benoist's Hodge-theoretic proof of de Jong's theorem for unramified classes: the family of hypersurfaces of degree divisible by the period in ℙ¹ × S, vanishing of the topological obstruction by weak Lefschetz, the compatible integral lift and pushforward adjustment, Voisin's open cone and the lattice argument, density of splitting hypersurfaces, and ind = per for α ∈ Br(S); then de Jong's theorem in characteristic 0 and the norm bound ind | 2 per over any real closed base field.

### 2.1 Hypersurfaces in P¹ × S of degree divisible by the period

S connected smooth projective over ℂ; A very ample with A² > A·K_S; d ≥ 1.

Let S be a connected smooth projective complex surface, α ∈ Br(S) of period n, and A a very ample line bundle with A² > A·K_S. Put X = ℙ¹ × S and H = pr₁*O(1) ⊗ pr₂*A, very ample on X; then H²·K_X = 2(A·K_S − A²) < 0. For d ≥ 1 let B_d ⊂ |dnH| be the Zariski-open locus of smooth surfaces and T → B_d the universal family; each fibre T_b comes with p_b : T_b → S, generically finite of degree dn, and its class in H²(X(ℂ), ℤ) is dn·c₁(H), divisible by n. (B19, §1, p. 69)

A construction can proceed as follows.

1. K_X = `pr₁*K_{ℙ¹}` + pr₂*K_S; expand H²·K_X with h² = 0 on ℙ¹ and A²·K_S = 0 on the surface S to get 2(A·K_S − A²).
2. H is very ample (Segre embedding of very ample bundles; AlgebraicModuliForArithmeticGeometry §1.4, `amplePowersAndFixedTwists`, for its powers), and Bertini (SchemeAndStackFoundations §4.13) makes the smooth members of |dnH| a dense Zariski open B_d; the universal family is the incidence divisor in B_d × X.
3. The degree of p_b is the intersection of T_b with a fibre ℙ¹ × {s}, namely dn.

The construction has the following API.

- The data (S, α, A, d) with X, H, B_d, the universal family and the projections p_b.
- H²·K_X = 2(A·K_S − A²) < 0.
- p_b : T_b → S is generically finite of degree dn.
- cl(T_b) = dn·c₁(H) in H²(X(ℂ), ℤ).
- B_d is a nonempty Zariski open of |dnH|.

**Checks.**

- For S = ℙ², A = O(1): H²·K_X = 2(−3 − 1) = −8.
- For n = d = 1 a member of |H| is {t₀a₀ + t₁a₁ = 0} ⊂ ℙ¹ × S with a₀, a₁ ∈ H⁰(S, A) and [t₀ : t₁] the coordinates of ℙ¹. Over a point s with (a₀(s), a₁(s)) ≠ (0, 0) its fibre is the single point [a₁(s) : −a₀(s)], and over each of the A² base points a₀ = a₁ = 0 of a general pencil it is all of ℙ¹; so T_b is the blow-up of S at those points and p_b is birational, of degree dn = 1. For S = ℙ², A = O(1) it is a divisor of bidegree (1, 1) in ℙ¹ × ℙ², the blow-up of ℙ² at one point.
- deg p_b equals the intersection number T_b·(ℙ¹ × {s}) of SchemeAndStackFoundations §5.10.
- For S = ℙ² and A = O(1), A² = 1 > −3 = A·K_S.
- For a quintic surface in ℙ³ with A = O(1), A² = 5 = A·K_S, so A = O(1) is excluded and A = O(2) is required.

*Needs:* SchemeAndStackFoundations §5.10; SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §4.13; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); Mathlib `AlgebraicGeometry.Scheme`.

### 2.2 The weight-two variation of a family of surfaces

π smooth projective with two-dimensional fibres, B smooth over ℂ, or over ℝ with π defined over ℝ. ℝ(1) carries conjugation by −1; with √−1·ℝ or 2π√−1·ℝ the G-invariant subspaces are the same.

Let π : 𝒯 → B be a smooth projective morphism of smooth complex varieties whose fibres are surfaces. The local system H²_ℚ = R²π_*ℚ on B(ℂ), with the Gauss–Manin connection ∇ on H² = H²_ℚ ⊗ `O_{B(ℂ)}` and the relative Hodge filtration F²H² ⊂ F¹H² ⊂ H², is a weight-two variation of Hodge structure (ShimuraData §3.1, `Variation`). For b ∈ B(ℂ) the Kodaira–Spencer map κ_b : `T_{B,b}` → H¹(T_b, `T_{T_b}`) is the connecting homomorphism, on the constant sections H⁰(T_b, `T_{B,b}` ⊗ `O_{T_b}`) = `T_{B,b}`, of the fibre tangent sequence 0 → `T_{T_b}` → `T_𝒯|_{T_b}` → `T_{B,b}` ⊗ `O_{T_b}` → 0, which is exact because π is smooth. It is the fibre at b of the Kodaira–Spencer class of the smooth morphism π (PELModuli M2.10, the class of 0 → π*Ω¹_B → Ω¹_𝒯 → `Ω¹_{𝒯/B}` → 0, restricted to T_b, in H¹(T_b, `T_{T_b}`) ⊗ `Ω¹_{B,b}`) up to the sign by which dualising an extension changes its class (BEN18, §2.1, pp. 6–7); the connecting-map description is the one used here. Contraction with λ ∈ H¹(T_b, Ω¹) is the cup product H¹(T_b, `T_{T_b}`) ⊗ H¹(T_b, Ω¹) → H²(T_b, O) induced by the pairing of vector fields with one-forms. Griffiths' formula: for b ∈ B(ℂ) and λ ∈ `H^{1,1}(T_b)`, the map ∇(λ) : `T_{B,b}` → `H^{0,2}_b` = H²(T_b, O) obtained by evaluating ∇ on λ is κ_b followed by contraction with λ, up to a sign fixed by the conventions for ∇ and for connecting maps; only its image and kernel are used (§§2.5, 4.8, 6.9, 6.10). If π is defined over ℝ, then G = Gal(ℂ/ℝ) acts on H²_ℚ compatibly with its action on B(ℂ), the induced ℂ-antilinear action on H² preserves the Hodge decomposition, and for b ∈ B(ℝ) the class of a line bundle on T_b defined over ℝ lies in `H^{1,1}_ℝ(T_b)(1)^G`. (BEN18, §1.1 and §1.4, pp. 3–5; BEN18, Remark 1.4, p. 5; B19, Proof of Proposition 6.6, p. 94)

A construction can proceed as follows.

1. The Betti local system and its flat bundle with the Gauss–Manin connection: ComplexComparisonPartII §C5.2 (`ehresmannFibration`, `relativeBettiLocalSystem`, `GaussManin`, `relativeDeRhamBetti`).
2. The Hodge filtration of H²_dR(𝒯/B) is by locally direct summands compatible with base change (ComplexComparisonPartII §C5.3, `relativeHodgeBundles`), and on each fibre it is the Hodge filtration of a pure weight-two Hodge structure (`properPureHodge`).
3. Griffiths transversality ∇F^p ⊂ `F^{p−1}` ⊗ Ω¹_B and Griffiths' formula: compute ∇ through the filtration of the absolute de Rham complex used to define `GaussManin`; the connecting map lowers the Hodge filtration by at most one, and on graded pieces it is cup product with the Kodaira–Spencer class (Griffiths' computation, as used in B19 p. 94 and BEN18 §1.4).
4. Real structure: σ acts antiholomorphically on 𝒯(ℂ) and B(ℂ); the antilinear action on H² is the composite of conjugation of coefficients, which exchanges `H^{p,q}` and `H^{q,p}`, and pullback by the antiholomorphic σ, which also exchanges them; first Chern classes of real line bundles are of type (1,1) and lie in the (−1)-twisted invariants, by the G-action on the exponential sequence.

The construction has the following API.

- The weight-two ShimuraData §3.1 Variation on B(ℂ) attached to π.
- κ_b : `T_{B,b}` → H¹(T_b, `T_{T_b}`) is ℂ-linear; for a morphism g : B′ → B of smooth varieties, b′ ↦ b, and the pulled-back family, `κ_{b′}` = κ_b ∘ `dg_{b′}`.
- Griffiths' formula ∇(λ) = ±(contraction with λ) ∘ κ_b on `H^{1,1}`, the sign depending only on conventions.
- The G-action for π defined over ℝ, compatible with B(ℂ) and preserving Hodge types.
- Classes of real line bundles on T_b, b ∈ B(ℝ), lie in `H^{1,1}_ℝ(T_b)(1)^G`.

**Checks.**

- For a constant family T × B → B the fibre tangent sequence splits, `T_𝒯|_{T_b}` = `T_{T_b}` ⊕ `T_{B,b}` ⊗ `O_{T_b}`, so κ_b = 0; correspondingly ∇ is the trivial connection and ∇(λ) = 0 for every λ.
- For the universal family of smooth quartic surfaces T ⊂ ℙ³, κ_b has rank 19, neither 0 nor h¹(T, T_T) = 20: `T_{B,b}` = H⁰(T, O_T(4)) has dimension 35 − 1 = 34, the kernel is the image of H⁰(T, `T_{ℙ³}|_T`) = H⁰(ℙ³, `T_{ℙ³}`) ≅ ℂ¹⁵ (restriction is bijective because H⁰ and H¹ of `T_{ℙ³}(−4)` vanish, and the map to H⁰(T, `N_{T/ℙ³}`) is injective because H⁰(T, T_T) = 0), and 34 − 15 = 19 is the dimension of the deformations of T preserving O_T(1).
- For the universal family of smooth quartic surfaces in ℙ³, the Hodge numbers are `h^{2,0}` = `h^{0,2}` = 1 and `h^{1,1}` = 20.
- `H^{1,1}` = F¹ ∩ conj(F¹) is a real-analytic subbundle of H² and in general not a holomorphic one: only F²H² and F¹H² vary holomorphically, as for the quartic family, whose period map is nonconstant.
- At b ∈ B(ℂ) the fibre is the pure Hodge structure `properPureHodge` on H²(T_b(ℂ), ℚ).

*Needs:* ComplexComparisonPartII §C5.2 (`GaussManin`); ComplexComparisonPartII §C5.3 (`relativeHodgeBundles`); ShimuraData §3.1 (`Variation`); PELModuli M2.10; SchemeAndStackFoundations §2.6.

### 2.3 The pulled-back class has no topological obstruction

The setting of §2.1.

In §2.1, for every b ∈ B_d(ℂ), the image τ of p_b*α ∈ Br(T_b)[n] in H³(T_b(ℂ), ℤ)[n] under the complex topological Brauer sequence 0 → H²(ℤ)/⟨n, Pic⟩ → Br[n] → H³(ℤ)[n] → 0 vanishes. (B19, Lemma 1.3, pp. 69–70)

A proof can proceed as follows.

1. With i : T_b ↪ X, the composite i_*i* is cup product with cl(T_b) = dn c₁(H) (projection formula), hence kills the n-torsion class pr₂*τ_S.
2. i_* : H³(T_b, ℤ) → H⁵(X, ℤ) is an isomorphism by integral weak Lefschetz (AffineMorseLefschetz A5 for the hyperplane section T_b of X embedded by |dnH|, with Poincaré duality on the compact manifolds T_b(ℂ) and X(ℂ)).
3. τ = p_b*τ_S = i*pr₂*τ_S maps to zero under the isomorphism i_*, so τ = 0.

**Checks.**

- If H³(S(ℂ), ℤ) has no torsion (S = ℙ²), τ_S = 0 already.

*Needs:* §2.1; §1.2; AffineMorseLefschetz A5; AlgebraicTopology Stage 6.

### 2.4 Compatible integral lift and pushforward adjustment

The setting of §2.1; the compatibility β mod n = p_b*α̃ is imposed (an arbitrary integral lift of p_b*α in the Brauer sequence is not enough; source correction E2).

In §2.1 fix a Kummer lift α̃ ∈ H²(S(ℂ), ℤ/n) of α. Choose β ∈ H²(T_b(ℂ), ℤ) whose reduction modulo n is exactly p_b*α̃; such β exists because the Bockstein of p_b*α̃ is τ = 0. Then `p_{b*}β` is divisible by n, and there is γ ∈ H²(T_b(ℂ), ℤ) with `p_{b*}(β − nγ)` = 0. The class β − nγ lies in H²(T_b, ℤ)_S = ker `p_{b*}` and still induces p_b*α in Br(T_b). (B19, Lemma 1.4, p. 70; B19, Lemma 1.3 and (1.1)–(1.2), p. 69)

A construction can proceed as follows.

1. By §2.3 the integral Bockstein of p_b*α̃ vanishes, so it lifts to β ∈ H²(T_b, ℤ).
2. `p_{b*}β` reduces to `p_{b*}p_b*α̃` = dn·α̃ = 0 modulo n, so `p_{b*}β` = nε for some ε ∈ H²(S, ℤ).
3. H²(T_b, ℤ) → H⁴(X, ℤ) is onto (AffineMorseLefschetz A5 with Poincaré duality) and H⁴(ℙ¹ × S, ℤ) → H²(S, ℤ) is onto by the Künneth formula, so ε = `p_{b*}γ` for some γ.
4. β − nγ reduces to p_b*α̃ modulo n, so it still induces p_b*α.

The construction has the following API.

- β ∈ H²(T_b(ℂ), ℤ) with β mod n = p_b*α̃.
- The compatible lift of α̃ reduces modulo n to p_b*α̃.
- n ∣ `p_{b*}β`.
- γ with `p_{b*}(β − nγ)` = 0.
- β − nγ maps to p_b*α under H²(T_b, ℤ) → Br(T_b)[n].

**Checks.**

- For α̃ = 0, β = 0 is a compatible lift.
- For n = 1 every integral class β is compatible, and the kernel adjustment gives γ with `p_{b*}γ` = `p_{b*}β`.
- An integral lift β′ of p_b*α in the topological Brauer sequence that differs from a compatible lift by cl(L) with `p_{b*}cl(L)` not divisible by n has `p_{b*}β′` not divisible by n.
- β − nγ lies in ker(`p_{b*}` : H²(T_b, ℤ) → H²(S, ℤ)).

*Needs:* §2.3; AffineMorseLefschetz A5; §1.2; AlgebraicTopology Stage 6.

### 2.5 Voisin's open cone in the kernel of the pushforward

S connected smooth projective over ℂ; A very ample with A² > A·K_S; X = ℙ¹ × S and H = pr₁*O(1) ⊗ pr₂*A, so that X → S has rational fibres and H²·K_X < 0. Voisin's degree is m = dn (source correction E16). Transport along Λ is the Ehresmann identification (ComplexComparisonPartII §C5.2, `ehresmannFibration`).

In §2.1, for all sufficiently large d there is a nonempty Zariski open V ⊂ B_d such that for every b ∈ V(ℂ) and every contractible open neighbourhood Λ ⊂ V(ℂ) of b there is a nonempty open cone Ω ⊂ H²(T_b(ℂ), ℝ)_S := ker(p_* : H²(T_b(ℂ), ℝ) → H²(S(ℂ), ℝ)) such that for every ν ∈ Ω some x ∈ Λ makes ν, transported to H²(T_x(ℂ), ℝ) along Λ, of type (1,1). (B19, Theorem 1.5 and proof, pp. 70–71; VOI06, Propositions 8 and 9, pp. 20–21 (arXiv))

A proof can proceed as follows.

1. X → S and H satisfy the standing hypotheses of Voisin's §3: a morphism to a surface with rational generic fibre and H²·K_X < 0.
2. For m = dn large, Voisin's Proposition 9 gives a nonempty Zariski open V such that every T_b, b ∈ V, carries λ ∈ H¹(T_b, Ω¹)_S with μ_λ : H⁰(T_b, O(mH)) → H²(T_b, O)_S surjective, μ_λ being the contraction with λ of the first-order deformations of T_b in X (Griffiths' formula, §2.2).
3. As in the proof of Voisin's Proposition 8, the map from the real (1,1)-bundle of the kernel variation over Λ to H²(T_b(ℂ), ℝ)_S is then a submersion at (b, λ), so its image, a cone, contains a nonempty open cone Ω.

**Checks.**

- If H²(S, O_S) = 0, then H²(T_b, O)_S = H²(T_b, O) and μ_λ must be onto all of H²(T_b, O).
- Classes p*σ with σ ∈ H²(S(ℂ), ℝ) not of type (1,1) are of type (1,1) on no fibre, since p_*p*σ = dn·σ and p_* preserves Hodge types; this is why the cone is taken in ker p_*.

*Needs:* §2.1; §2.2; ComplexComparisonPartII §C5.2 (`ehresmannFibration`).

### 2.6 Open cones meet lattice cosets

W finite-dimensional over ℝ; Γ contains a basis v₁, …, v_r of W; Ω nonempty, open, and tΩ = Ω for t > 0.

Let W be a finite-dimensional real vector space, Γ ⊂ W an additive subgroup containing an ℝ-basis of W, n ≥ 1 an integer and Ω ⊂ W a nonempty open cone (an open subset stable under multiplication by positive reals). Then every coset x + nΓ, x ∈ W, meets Ω. (B19, Proof of Proposition 1.2, p. 71; B19, Proof of Proposition 6.6, p. 94)

A proof can proceed as follows.

1. The parallelepiped P spanned by nv₁, …, nv_r meets every coset of the subgroup generated by the nv_i, so every ball of radius larger than the diameter of P meets x + nΓ.
2. Ω contains a ball B(c, ρ), hence the balls B(tc, tρ) for all t > 0; take tρ larger than the diameter of P.

**Checks.**

- W = ℝ, Γ = ℤ, n = 2, Ω = (0, ∞): the coset 1 + 2ℤ meets Ω at 1.
- The cone hypothesis is needed: the open ball of radius 1/2 about 0 in ℝ misses 1 + 2ℤ.
- The spanning hypothesis is needed: in ℝ² with Γ = ℤ × {0} and Ω = {y > 0}, the coset Γ misses Ω.

*Needs:* Mathlib `Module.finrank`; Mathlib `Metric.ball`.

### 2.7 Dense splitting hypersurfaces

d large enough for §2.5. Transport over contractible opens uses ordinary Ehresmann; the compatible lift is transported as the restriction of the family class pulled back from S, so its reduction stays p_x*α̃.

In §2.1, for all sufficiently large d the points b ∈ B_d(ℂ) with p_b*α = 0 ∈ Br(T_b) are dense in B_d(ℂ) for the Euclidean topology. (B19, Proposition 1.2 and its proof, pp. 69, 71; B19, Theorem 1.5, pp. 70–71, citing VOI06, Propositions 8 and 9)

A proof can proceed as follows.

1. Fix a nonempty Euclidean open W ⊂ B_d(ℂ); it meets Voisin's Zariski open V; take b ∈ V ∩ W and a contractible neighbourhood Λ ⊂ V ∩ W.
2. §2.4 gives β − nγ in H²(T_b, ℤ)_S; its image in H²(T_b, ℝ)_S is a lattice coset point modulo n·(lattice).
3. Voisin's open cone Ω ⊂ H²(T_b, ℝ)_S (§2.5) meets the coset β − nγ + n·H²(T_b, ℤ)_S (§2.6; the image of H²(T_b, ℤ)_S spans H²(T_b, ℝ)_S): choose δ with β − nγ − nδ ∈ Ω.
4. Ehresmann transport over the contractible Λ (ComplexComparisonPartII §C5.2, `ehresmannFibration`) identifies the cohomology of the fibres; some x ∈ Λ makes β − nγ − nδ of type (1,1) on T_x; integral Lefschetz (1,1) (MotivesAndAlgebraicCycles §7.8) writes it as c₁ of a line bundle.
5. The transported β still reduces to p_x*α̃, so in the topological Brauer sequence p_x*α = 0 ∈ Br(T_x).

**Checks.**

- For α = 0 every b qualifies.

*Needs:* §2.4; §2.5; §2.6; ComplexComparisonPartII §C5.2 (`ehresmannFibration`); MotivesAndAlgebraicCycles §7.8; §1.2.

### 2.8 Unramified period equals index on complex surfaces

S connected smooth projective over ℂ; α unramified on S.

Let S be a connected smooth projective surface over ℂ and α ∈ Br(S) ⊂ Br(ℂ(S)). Then ind(α) = per(α). (B19, Theorem 1.1 and its proof, p. 69)

A proof can proceed as follows.

1. Put n = per(α). §2.7 holds for every d beyond some bound; fix such a d, so that it holds for d + 1 as well. The splitting loci of §2.7 are dense in the nonempty spaces B_d(ℂ) and `B_{d+1}(ℂ)`, so there are b ∈ B_d(ℂ) and b′ ∈ `B_{d+1}(ℂ)` with p_b*α = 0 and `p_{b′}*α` = 0.
2. Over the generic point of S, the surface T_b meets ℙ¹ over ℂ(S) in the zero scheme of a nonzero binary form of degree dn, a finite ℂ(S)-scheme of length dn (§2.1). As T_b is smooth this scheme is reduced, so it is Spec(L₁ × ⋯ × L_r), where the L_i are the function fields of the irreducible components of T_b dominating S and the degrees [L_i : ℂ(S)] add up to dn. The image of α in Br(L_i) is the restriction of p_b*α = 0 to the generic point of a component, so each L_i is a finite splitting field of α; by §0.12 ind(α) divides every [L_i : ℂ(S)], hence their sum dn. The same reasoning for b′ gives ind(α) | (d + 1)n, so ind(α) divides gcd(dn, (d + 1)n) = n.
3. per(α) divides ind(α) (§0.12), so ind(α) = n.

**Checks.**

- For S an Enriques surface over ℂ and α the nonzero class of Br(S) ≅ ℤ/2, ind(α) = 2: the two degrees are 2d and 2d + 2, with gcd 2.
- One degree alone does not suffice: for that Enriques class and d = 2 the splitting member gives only ind(α) | 4, which also allows 4; the coprime multipliers d and d + 1 bring the bound down to n.
- Smoothness of the member is what makes the degrees of the dominating components add up to dn: for α = 0 the nonreduced divisor 2T₀ with T₀ ∈ |H| lies in |2H|, its generic fibre has length 2, yet its only component has function field of degree 1 over ℂ(S).

*Needs:* §2.7; §2.1; §0.12.

### 2.9 De Jong's period-index theorem in characteristic zero

k algebraically closed of characteristic 0; S connected smooth projective of dimension 2; α possibly ramified. Index and period are those of §0.12.

Let k be an algebraically closed field of characteristic 0 and S a connected smooth projective surface over k. For every α ∈ Br(k(S)), ind(α) = per(α). Equivalently, in the form stated in Lean as `index_eq_orderOf_of_isAlgClosed`: for every field K finitely generated of transcendence degree 2 over k and every central simple K-algebra A, the index of A equals the period of its class; such a K is the function field of a connected smooth projective surface over k by the field resolution of ResolutionOfSingularitiesCharacteristicZero §7.8. (B19, Theorem 0.1, p. 63; §0.6, p. 68; CT05, §3.6, Theorem 3.14 and proof, pp. 400–403)

A proof can proceed as follows.

1. Prime-power reduction: α is the sum of its primary components and its index is the product of theirs (a central division algebra is the tensor product of division algebras of coprime prime-power degrees), so assume per(α) = l^r with l prime. For r ≥ 2, β = lα has period `l^{r−1}`; a splitting field E of β of degree `l^{r−1}` is the function field of a connected smooth projective surface Y (ResolutionOfSingularitiesCharacteristicZero §7.8, field resolution), and the prime-period case on Y splits α_E by an extension of degree l, so ind(α) divides l^r (CT05 §3.6, p. 400).
2. Prime period: §1.8 gives a connected smooth projective surface Y over an algebraic closure Ω of k(t) and an unramified class β ∈ Br(Y) with ind(α) dividing ind(β); since lβ = 0, the unramified case over Ω gives ind(β) dividing l, so ind(α) = l.
3. Unramified case over an algebraically closed field K of characteristic 0: the surface and the class are defined over a countable algebraically closed subfield K₀ ⊂ K, which embeds into ℂ; unramified classes stay unramified under base change, and §1.5 for K₀ ⊂ K and for K₀ ⊂ ℂ reduces to K = ℂ, where §2.8 gives ind = per.

**Checks.**

- For S = ℙ²_ℂ and α = 0 the index is 1.
- Every class of Br(ℂ(x, y)) of period 2 is a quaternion class.
- Over k = ℚ̄ the class (x, y) ∈ Br(ℚ̄(x, y)) has period and index 2, as over ℂ.

*Needs:* §2.8; §1.5; §1.8; §0.12; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution).

### 2.10 Norm bound over a real closed field

R real closed (any, including the real Puiseux field); F of transcendence degree 2 over R; char 0.

Let R be a real closed field and F the function field of an integral surface over R. For α ∈ Br(F) of period n, ind(α) divides 2n; hence ind(α) ∈ {n, 2n}, and ind(α) = n if n is odd. In Lean (`index_dvd_two_mul_orderOf_of_isRealClosed`): for K finitely generated of transcendence degree 2 over R and A a central simple K-algebra, the index of A divides twice the period of its class. (B19, §0.2, p. 63; §6.3, p. 95; §7.5, p. 104; §8.2, p. 108; B19, §0.4, p. 65)

A proof can proceed as follows.

1. If √−1 ∈ F, F is the function field of a connected smooth projective surface over the field R(√−1), algebraically closed by Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension` (a projective model resolved by ResolutionOfSingularitiesCharacteristicZero §7.8, field resolution), and §2.9 gives ind = per.
2. Otherwise L = F(√−1) is likewise the function field of a connected smooth projective surface over R(√−1); by de Jong, ind(α_L) = per(α_L), which divides n.
3. Reverse index divisibility (§0.12): ind(α) divides [L : F]·ind(α_L) = 2 ind(α_L), which divides 2n.
4. Period divides index and both have the same prime divisors (§0.12), so ind(α) ∈ {n, 2n}, and for odd n the factor 2 is excluded.

**Checks.**

- For Albert's class (x, x) + (y, xy) over ℝ(x, y), the period is 2 and the index is 4 = 2n.
- Every class of odd period over ℝ(S) has index equal to its period.

*Needs:* §2.9; §0.12; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`.

### Examples

For S = ℙ² and A = O(1), A² = 1 > −3 = A·K_S and the hypersurface family of §2.1 exists; for a quintic surface in ℙ³, A = O(1) has A² = A·K_S = 5 and A = O(2) is used instead. The lattice lemma of §2.6 already needs both hypotheses in dimension one: 1 + 2ℤ meets the cone (0, ∞) but misses the ball of radius ½ about 0. Albert's class (x, x) + (y, xy) over ℝ(x, y) has period 2 and index 4, the extreme case of the norm bound. (B19 §1, pp. 67–71; CT05 §3.)

### Dependencies

Layer 0; Layer 1; AffineMorseLefschetz A5; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); AlgebraicTopology Stage 6; ComplexComparisonPartII §C5.2 (`GaussManin`); ComplexComparisonPartII §C5.2 (`ehresmannFibration`); ComplexComparisonPartII §C5.3 (`relativeHodgeBundles`); Mathlib `AlgebraicGeometry.Scheme`; Mathlib `Metric.ball`; Mathlib `Module.finrank`; MotivesAndAlgebraicCycles §7.8; PELModuli M2.10; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §5.10; ShimuraData §3.1 (`Variation`); Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`.

## Layer 3: double covers branched along a curve: finite and incidence models and their cohomology

The finite rank-two cover Spec_S(O_S ⊕ L⁻¹(−R)) branched along R ∪ D, which is normal with ordinary double points over the singular points of the branch locus; the incidence model rv² = sw² in a projective bundle, its map to the finite model, its fixed singular points and their resolution, and the family in a fixed threefold; local structure and Stein factorisation; the étale and finite-flat strata; pushforward is an isomorphism on `H^{≥3}` and onto on H² for L(R) ample; and the image of the equivariant pushforward, cut out by the first real component.

### 3.1 The finite double cover branched along R ∪ D

char 0; R SNC; D smooth, transverse to R, disjoint from Sing R. If R ∪ D = ∅ the cover is étale and may be disconnected; normality does not assert integrality.

Let S be a smooth surface over a field of characteristic 0, R ⊂ S an SNC divisor with equation r ∈ H⁰(S, O(R)), L a line bundle and s ∈ H⁰(S, L²(R)) with smooth zero divisor D meeting R transversally and avoiding Sing R. Put M = L(R) and b = rs ∈ H⁰(S, M²). The finite model is C = Spec_S(O_S ⊕ M⁻¹), with multiplication M⁻¹ ⊗ M⁻¹ → O_S given by b. It is finite locally free of rank 2, locally z² = rs, étale exactly over S ∖ (R ∪ D), normal, with ordinary double points exactly over Sing(R ∪ D); it carries the involution z ↦ −z with invariant subring O_S. (B19, §3.1, pp. 76–77; B19, (5.5), p. 87)

A construction can proceed as follows.

1. Locally, with M⁻¹ trivialised by z, the algebra is O_S[z]/(z² − b): Mathlib's `QuadraticAlgebra` O b 0, finite free of rank 2 with basis 1, z.
2. The discriminant is 4b, so the cover is étale exactly where rs is a unit, that is off R ∪ D.
3. Normality by Serre's criterion: a hypersurface in a smooth threefold is Cohen–Macaulay, hence S2 (SchemeAndStackFoundations §0.17; Serre's criterion is Tau Ceti `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two`, applied on affine opens); it is regular in codimension one because rs vanishes to order 1 along each component of R ∪ D.
4. At a point of Sing(R ∪ D), local coordinates make b = xy and z² = xy is an ordinary double point; elsewhere on R ∪ D, b is a coordinate and the cover is smooth.

The construction has the following API.

- C = Spec_S(O_S ⊕ M⁻¹) with multiplication by b = rs.
- C → S is finite locally free of rank 2.
- C → S is étale over x iff x ∉ R ∪ D.
- C is normal.
- The singular points of C are ordinary double points, one over each point of Sing(R ∪ D).
- The involution z ↦ −z, with invariants O_S and anti-invariants M⁻¹.
- Over an open where M is trivial with b ↦ a, C is Spec of `QuadraticAlgebra` O a 0.

**Checks.**

- Locally C ≅ Spec (`QuadraticAlgebra` O b 0), with the basis `QuadraticAlgebra.basis`.
- C is not regular over R ∩ D: a finite flat double cover of a smooth surface branched along an SNC divisor need not be smooth.
- S = 𝔸², R = {x = 0}, D = {y = 0}: C = Spec k[x, y, z]/(z² − xy), an A₁ singularity at the origin.
- R = D = ∅ and b = 1: C = S ⊔ S.

*Needs:* Mathlib `QuadraticAlgebra`; Mathlib `QuadraticAlgebra.basis`; Mathlib `QuadraticAlgebra.finrank_eq_two`; Mathlib `QuadraticAlgebra.discr_def`; SchemeAndStackFoundations §0.17; Tau Ceti `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two`; SchemeAndStackFoundations §0.1; SchemeAndStackFoundations §4.17.

### 3.2 The incidence model and its resolution

B ⊂ H⁰(S, L²(R)) the open set of sections with D smooth, transverse to R and disjoint from Sing R. X̄, T̄ and T are projective over S for every smooth S; the threefold X and the family over B are projective over the ground field only for S projective, which also makes H⁰(S, L²(R)) finite-dimensional (the source fixes a connected smooth projective S, B19 §3.1, p. 76). The fixed singular centres are where w vanishes (the published text says v; see source correction E17).

In §3.1, let X̄ = ℙ_S(O ⊕ L) with tautological sections v ∈ H⁰(O(1)) and w ∈ H⁰(O(1) ⊗ f*L⁻¹), and T̄ = {rv² = sw²} ⊂ X̄ with projection p̄ : T̄ → S. There is a proper morphism h : T̄ → C, given by z = r v/w where w ≠ 0 and z = s w/v where v ≠ 0, which is an isomorphism away from R ∩ D. The singular points of T̄ are exactly the points over Sing R with w = 0 (that is [v : w] = [1 : 0]), ordinary double points whose position in X̄ does not depend on s. T is the blow-up of T̄ at these points, and p : T → S is projective and generically of degree 2. If S is projective, blowing up X̄ at the same fixed points gives a smooth projective threefold X in which the T for s ∈ B form a smooth projective family π : 𝒯 → B ⊂ B × X. The map p is not finite: its fibres over R ∩ D and over Sing R are ℙ¹. (B19, §3.1, pp. 76–77; B19, §5.1–5.2, pp. 85–86)

A construction can proceed as follows.

1. On w ≠ 0 write t = v/w, so T̄ is r t² = s; then z = r t satisfies z² = r²t² = rs. On v ≠ 0 write u = w/v, so r = s u², and z = s u satisfies z² = rs. On v, w ≠ 0 both give z = r v/w = s w/v, so h is well defined.
2. Away from R ∩ D one of r, s is a unit locally and h is an isomorphism; over R ∩ D the fibre of T̄ is the whole ℙ¹ (§3.3).
3. Jacobian criterion: over Sing R (where s is a unit and r = xy) the only singular point of the fibre is w = 0, an ordinary double point; elsewhere T̄ is smooth. The point w = 0 over Sing R is the same for every s.
4. Blow up these finitely many fixed points of X̄ to get X; strict transforms of the T̄ are the resolved T and form a smooth family over B (blow-ups and strict transforms: StableReduction Layer 4 and SchemeAndStackFoundations §4.11).

The construction has the following API.

- T̄ = {rv² = sw²} ⊂ ℙ_S(O ⊕ L) with p̄ : T̄ → S.
- h : T̄ → C, proper, an isomorphism off R ∩ D.
- Sing T̄ = {points over Sing R with w = 0}, independent of s.
- T = `Bl_{Sing T̄}` T̄ with p : T → S projective and generically of degree 2.
- For S projective, the smooth projective family 𝒯 → B inside B × X, X the blow-up of X̄ at the fixed points, a smooth projective threefold.
- The covering involution v ↦ −v extends to T and commutes with p.

**Checks.**

- At a crossing r = x, s = y, the charts (x, a) with y = xa², z = xa and (y, c) with x = yc², z = yc cover T̄ and glue by c = a⁻¹.
- p_*O_T ≅ O_S ⊕ L⁻¹(−R), the structure sheaf of §3.1.
- If R ∩ D ≠ ∅, p̄ has a ℙ¹ fibre and is not finite.
- If R ∩ D = ∅ and R is smooth, T̄ = C is finite over S and T = T̄.
- Over a node of R, T has a single exceptional ℙ¹, mapping to the node.
- Projectivity of S is needed for the absolute statements: for S = 𝔸²_ℝ, L = O, R = D = ∅ and s = 1, X̄ = ℙ¹ × 𝔸² and T̄ = T = 𝔸² ⊔ 𝔸² (the sections v = ±w) are projective over S but not proper over ℝ, and H⁰(S, O) = ℝ[x, y] is infinite-dimensional; for S = ℙ²_ℝ the threefold X is projective.

*Needs:* §3.1; AlgebraicModuliForArithmeticGeometry §1.1; SchemeAndStackFoundations §5.4; SchemeAndStackFoundations §4.11; StableReduction Layer 4.

### 3.3 Local structure and Stein factorisation of the incidence model

The setting of §3.2.

At a point of R ∩ D the surface T̄ is smooth and h : T̄ → C is the minimal resolution of the node z² = rs, with exceptional ℙ¹ of self-intersection −2 (equivalently the blow-up of the ideal (r, z)). The resolved cover factors as T → C → S, both T → C and T̄ → C satisfy h_*O = O_C, R^i h_*O = 0 for i > 0 and have geometrically connected fibres, so C = Spec_S(p_*O_T) and p_*O_T = O_S ⊕ L⁻¹(−R) compatibly with the involution. (B19, §3.1, p. 76; Lemma 5.3 proof, p. 87)

A proof can proceed as follows.

1. Charts at a crossing: s = r x², z = r x and r = s y², z = s y with y = x⁻¹; both are affine planes, so T̄ is smooth there, and the exceptional curve is ℙ¹ with normal bundle O(−2).
2. The Čech computation on the two charts gives Γ(O) = k[r, rx, rx²] ≅ k[r, z, s]/(z² − rs) and vanishing higher cohomology, hence h_*O = O_C and R^i h_*O = 0 (SchemeAndStackFoundations §2.2 Čech comparison).
3. Over Sing R the blow-up of the ordinary double point has the same two properties (rational singularity), and h is proper birational onto the normal C, so h_*O = O_C (proper birational maps to normal schemes; SchemeAndStackFoundations §4.9 Stein factorisation).
4. Hence p_*O_T = (C → S)_*O_C = O_S ⊕ M⁻¹ with M = L(R), and the involution acts by +1 and −1 on the two summands.

**Checks.**

- The exceptional curve over a crossing has self-intersection −2 on T.

*Needs:* §3.2; §3.1; SchemeAndStackFoundations §4.9; SchemeAndStackFoundations §2.2.

### 3.4 The étale and finite-flat strata of the double cover

G = Gal(ℂ/ℝ) when S is defined over ℝ; geometric point counts are not flat degrees.

For p : T → S of §3.2 put Δ = R ∪ D, S* = S ∖ Δ, S₀ = S ∖ Sing Δ, T* = p⁻¹S*, T₀ = p⁻¹S₀, j₀ : S* ↪ S₀ and E = p⁻¹(Sing Δ) = T ∖ T₀. Then p : T* → S* is finite étale of degree 2, p : T₀ → S₀ is finite locally free of rank 2, E(ℂ) is a disjoint union of copies of ℙ¹(ℂ), one over each point of Sing Δ(ℂ), and the sign local system Z̃ of T*(ℂ) → S*(ℂ) is the G-equivariant rank-one local system of AlgebraicTopologyPartII §14.1. Over a smooth point of Δ the scheme fibre has length 2 and is nonreduced. (B19, §3.2, p. 77; §3.3, p. 78)

A construction can proceed as follows.

1. Over S₀ the map T₀ → S₀ is the finite model C restricted to S₀ (§3.3: h is an isomorphism off R ∩ D and the fixed centres), hence finite locally free of rank 2.
2. Over S* it is étale (§3.1).
3. Over Sing Δ the fibre of T is ℙ¹: over R ∩ D the incidence fibre, over Sing R the exceptional curve of the blow-up.

The definition has the following API.

- S*, S₀, T*, T₀, E, P = Sing Δ and j₀ for the double cover p.
- p : T* → S* is finite étale of degree 2.
- p : T₀ → S₀ is finite locally free of rank 2.
- E(ℂ) ≅ P(ℂ) × ℙ¹(ℂ) over P(ℂ).
- Z̃ on S*(ℂ), the sign local system (AlgebraicTopologyPartII §14.1) of T* → S*.

**Checks.**

- Over x ∈ R ∖ (Sing R ∪ D), the fibre is Spec κ(x)[z]/(z²), of length 2 with one geometric point.
- E is empty iff Δ is smooth, and then T₀ = T.
- Z̃ is coker(ℤ → p_*ℤ) on S*(ℂ), as in AlgebraicTopologyPartII §14.1.
- The number of geometric points in the fibre is 1 over Δ ∖ Sing Δ and 2 over S*, although the flat degree over S₀ is constantly 2.

*Needs:* §3.2; §3.3; AlgebraicTopologyPartII §14.1.

### 3.5 Pushforward on the complex double cover

S connected smooth projective; L(R) ample (Assumption 3.1), so O_S(Δ) ≅ L²(2R) is ample and S*, T* are affine.

If S is a connected smooth projective surface and L(R) is ample, then p_* : H^i(T(ℂ), ℤ) → H^i(S(ℂ), ℤ) is an isomorphism for i ≥ 3 and surjective for i = 2. (B19, Assumption 3.1 and Proposition 3.2, p. 78)

A proof can proceed as follows.

1. S* and its finite étale cover T* are smooth affine surfaces, so their integral cohomology vanishes in degrees ≥ 3 (AffineMorseLefschetz A3); the sign sequence then kills H^i(S*, Z̃) for i ≥ 3.
2. The triangle Rj₀_*Z̃ → p_*ℤ → ℤ on S₀(ℂ) (AlgebraicTopologyPartII §14.3) gives p_* : H^i(T₀) ≅ H^i(S₀) for i ≥ 3 and onto for i = 2.
3. Compare the long exact sequences with supports along E ⊂ T and P ⊂ S; p_* : H^j(E) → `H^{j−2}(P)` is an isomorphism for j ≥ 1 because E is a union of ℙ¹'s over P, and the five lemma concludes.

**Checks.**

- The connected components of T(ℂ) and S(ℂ) correspond (i = 4).

*Needs:* §3.4; AffineMorseLefschetz A3; AlgebraicTopologyPartII §14.3; AlgebraicTopology Stage 6.

### 3.6 Image of the equivariant pushforward

S connected smooth projective over ℝ; L(R) ample; real components [ξ]₁ as in MotivesAndAlgebraicCycles §7.6b.

Let S be a connected smooth projective surface over ℝ and L(R) ample. Put I = im(p_* : H¹(T(ℝ), 𝔽₂) → H¹(S(ℝ), 𝔽₂)). For every i ≥ 2 the image of p_* : H^i_G(T(ℂ), ℤ(i−1)) → H^i_G(S(ℂ), ℤ(i−1)) is exactly {ξ : [ξ]₁ ∈ I}. (B19, Proposition 3.3, p. 79)

A proof can proceed as follows.

1. For i ≥ 5, restriction to the real locus is an isomorphism (AlgebraicTopologyPartII Layer 6, i > 2·dim) and the canonical decomposition identifies both groups with H¹ of the real loci; pushforward acts on real coordinates by the real Gysin map (MotivesAndAlgebraicCycles §7.6b), which for the finite cover p, of relative dimension 0, keeps the twist ℤ(i − 1) on both sides (source correction E11).
2. Descending induction: the real–complex exact sequences (MotivesAndAlgebraicCycles §7.6a) for T and S, connected by pushforwards, with §3.5 on the ordinary terms and the induction hypothesis in degree i + 1, identify the image with {ξ : [ξ ∪ ω]₁ ∈ I}.
3. [ξ ∪ ω]₁ = [ξ]₁ (invariance of integral components under ω, MotivesAndAlgebraicCycles §7.6b).

**Checks.**

- If T(ℝ) → S(ℝ) is onto in H¹, every class is a pushforward for i ≥ 2.

*Needs:* §3.5; AlgebraicTopologyPartII Layer 6 (free descent, from MotivesAndAlgebraicCycles §7.6a); MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b.

### Examples

For S = 𝔸², R = {x = 0} and D = {y = 0}, the finite double cover is z² = xy, an A₁ singularity over the crossing, while the incidence model has a whole ℙ¹ over the crossing, covered by the charts y = xa², z = xa and x = yc², z = yc glued by c = a⁻¹. When R ∩ D = ∅ and R is smooth the two models agree and are finite over S. (B19 §3.1, pp. 76–77; source correction E1.)

### Dependencies

AffineMorseLefschetz A3; AlgebraicModuliForArithmeticGeometry §1.1; AlgebraicTopology Stage 6; AlgebraicTopologyPartII Layer 6 (free descent, from MotivesAndAlgebraicCycles §7.6a); AlgebraicTopologyPartII §14.1; AlgebraicTopologyPartII §14.3; Mathlib `QuadraticAlgebra.basis`; Mathlib `QuadraticAlgebra.discr_def`; Mathlib `QuadraticAlgebra.finrank_eq_two`; Mathlib `QuadraticAlgebra`; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; SchemeAndStackFoundations §0.1; SchemeAndStackFoundations §0.17; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §4.11; SchemeAndStackFoundations §4.17; SchemeAndStackFoundations §4.9; SchemeAndStackFoundations §5.4; StableReduction Layer 4; Tau Ceti `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two`.

## Layer 4: a real-pointless curve on a double cover and the dimension of its Noether–Lefschetz locus

The parameters for a real-pointless curve C on the double cover; the point s = a₁s₀ + a₂c of the parameter space and the lift of C to the cover; restriction of the anti-invariant summand to C; the auxiliary cohomological hypotheses on a line bundle N; the bounds h¹(C, `N_{C/X}`) ≤ h²(O_S) and H²(T, O_T(C)) = 0; the Kodaira–Spencer contraction through normal bundles; the Noether–Lefschetz locus of the expected dimension; and blowing up points to realise the auxiliary hypotheses.

### 4.1 Parameters for a curve on the double cover

l even and large enough for Serre vanishing and very ampleness simultaneously (AlgebraicModuliForArithmeticGeometry §1.4, `amplePowersAndFixedTwists`; SchemeAndStackFoundations §2.6, `ample_serre_vanishing`).

Let S be a connected smooth projective surface over ℝ, R ⊂ S an SNC divisor with equation r, A very ample and N a line bundle. For an even integer l ≫ 0 put L = A^l ⊗ N(−R); Assumption 5.1 asks H¹(S, A^l) = H¹(S, L) = H¹(S, L ⊗ N) = 0 and L, L ⊗ N very ample. For a basis (u_i) of H⁰(S, `A^{l/2}`), Σ u_i² has no real zeros; a general small deformation c ∈ H⁰(S, A^l) of Σ u_i² cuts out a smooth curve C = {c = 0} transverse to R in its smooth locus, with C(ℝ) = ∅ and c > 0 on S(ℝ). (B19, §5.1, Assumption 5.1, pp. 85–86)

A construction can proceed as follows.

1. Serre vanishing and very ampleness of high twists give Assumption 5.1 for all large even l.
2. The u_i have no common zero because A is very ample, so Σ u_i² is positive on S(ℝ) and has no real zeros.
3. Bertini gives a smooth transverse member among small deformations; having no real zeros and being positive on the compact S(ℝ) are open conditions.

The construction has the following API.

- (A, N, l, L, c, C) with Assumption 5.1.
- H¹(A^l) = H¹(L) = H¹(L ⊗ N) = 0.
- L and L ⊗ N are very ample.
- C(ℝ) = ∅ and c > 0 on S(ℝ).
- C is smooth and meets R transversally in its smooth locus.

**Checks.**

- On ℙ²_ℝ with A = O(1), l = 2, N = O and R a real line: L = O(2) ⊗ O(−1) = O(1) and L ⊗ N = O(1) are very ample, H¹(O(2)) = H¹(O(1)) = 0, and c = x² + y² + z² cuts out a smooth real-pointless conic meeting R in two conjugate points. With N = O(−1) instead, L = O is not very ample and Assumption 5.1 fails.
- If S(ℝ) = ∅, positivity on S(ℝ) is vacuous and any smooth transverse c works.
- For odd l, `A^{l/2}` is undefined and the sum-of-squares section is not available: l must be even.
- The vanishing for large l is SchemeAndStackFoundations §2.6, `ample_serre_vanishing`, applied to A^l, L and L ⊗ N.

*Needs:* AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`); §3.2.

### 4.2 The point of B whose cover contains the curve

a₁ > 0 real; (a₁, a₂) general; g general.

In §4.1 choose a general g ∈ H⁰(C, L) (reduced zeros, disjoint from R) and lift rg² ∈ H⁰(C, L²(R)) to s₀ ∈ H⁰(S, L²(R)) (possible as H¹(S, L ⊗ N) = 0). For a₁ ∈ `ℝ_{>0}` and a₂ ∈ H⁰(S, L ⊗ N) general, s = a₁s₀ + a₂c lies in B: its zero locus D is smooth and transverse to R in its smooth locus (Bertini off the finite base locus {c = s₀ = 0}, and a direct derivative computation there). Over C the incidence equation is rv² = a₁rg²w², and the strict transform of C splits into two copies of C, v = ±√a₁·g·w; the chosen copy C ⊂ T (v = √a₁ g w) avoids the singular points, w does not vanish on it, and w gives L|_C ≅ O_X(1)|_C. The full preimage of C also contains the ℙ¹ fibres over R ∩ C, which are not part of the lifted curve. (B19, §5.1, pp. 86–87)

A construction can proceed as follows.

1. The restriction H⁰(S, L²(R)) → H⁰(C, L²(R)|_C) is onto because its kernel twist L²(R)(−C) = L ⊗ N has H¹ = 0.
2. The linear system {a₁s₀ + a₂c} has base locus {c = s₀ = 0}, finite since L ⊗ N is very ample; Bertini applies off it, and at a base point the choice a₁ = 0, a₂(x) ≠ 0 already gives smoothness and transversality, an open condition (SchemeAndStackFoundations §4.13).
3. On C, s = a₁rg², so the equation factors as r(v − √a₁ g w)(v + √a₁ g w) = 0 after removing the R-component; the two graph sections are closed curves isomorphic to C.
4. v and w do not vanish together on X̄, and on the chosen section v = √a₁ g w, so w ≠ 0 there.

The construction has the following API.

- The closed curve C ⊂ T given by v = √a₁ g w.
- p restricts to an isomorphism from the lifted curve to C.
- w induces L|_C ≅ O_X(1)|_C (display (5.1)).
- s = a₁s₀ + a₂c lies in B for general (a₁, a₂) with a₁ > 0.
- The lifted curve avoids Sing T̄ and the exceptional curves of T → T̄.

**Checks.**

- The strict transform of C has exactly two components, v = ±√a₁ g w, meeting over {g = 0}.
- For a₂ = 0, s = a₁s₀ restricts to a₁rg² on C, but D may fail to be smooth away from C; generality of a₂ is needed.
- p⁻¹(C) is not the lifted curve: it also contains the other component and the ℙ¹ fibres over R ∩ C.
- Under the identification of §3.2, w is the tautological section and the trivialisation is its restriction.
- The lifted curve does not meet the exceptional curves over Sing R.

*Needs:* §4.1; §3.2; SchemeAndStackFoundations §4.13.

### 4.3 Restriction of the anti-invariant summand to the curve

The splitting of p_*O_T is §3.3.

For the lifted curve C ⊂ T of §4.2, the restriction p_*O_T = O_S ⊕ L⁻¹(−R) → O_C is (a, b) ↦ a + √a₁·r·g·b when the anti-invariant summand is generated by z = r v/w, and (a, b) ↦ a + r g b after rescaling the generator by √a₁; p_*O_T(−C) is its kernel. The same holds on T̄; left exactness of pushforward suffices, without finiteness of p. (B19, (5.5), p. 87)

A proof can proceed as follows.

1. On the chosen component v = √a₁ g w, the anti-invariant function z = r v/w restricts to √a₁ r g.
2. Pushing forward 0 → O_T(−C) → O_T → O_C → 0 gives a left exact sequence 0 → p_*O_T(−C) → p_*O_T → O_C.

**Checks.**

- With the rescaled generator z′ = r v/(√a₁ w), the coefficient is rg, as printed in (5.5).

*Needs:* §4.2; §3.3.

### 4.4 The auxiliary cohomological hypotheses on N

Coherent cohomology of S and of the curve R; injectivity for one η implies it for general η (an open condition on H¹(S, N)).

For S, R as in §4.1, a line bundle N satisfies Assumption 5.2 if there is η ∈ H¹(S, N) such that ∪η : H⁰(S, K_S) → H¹(S, N ⊗ K_S) is injective (then a general η works), and H⁰(S, N ⊗ K_S) = 0, H⁰(S, N⁻¹ ⊗ K_S(R)) = 0 and H¹(R, N|_R) = 0. (B19, Assumption 5.2, p. 87)

A construction can proceed as follows.

1. The four conditions are conditions on coherent cohomology; §4.9 constructs N after blowing up points off R.

The definition has the following API.

- N with η and the four conditions of Assumption 5.2.
- ∪η is injective on H⁰(S, K_S).
- H⁰(N ⊗ K_S) = H⁰(N⁻¹ ⊗ K_S(R)) = H¹(R, N|_R) = 0.
- If ∪η is injective for one η, it is injective for η in a dense open of H¹(S, N).

**Checks.**

- If H⁰(S, K_S) = 0 the cup condition holds for η = 0.
- On ℙ²_ℝ with R a line and N = O(−1): H⁰(O(−4)) = 0, H⁰(O(1)⊗O(−3)⊗O(1)) = H⁰(O(−1)) = 0, H¹(ℙ¹, O(−1)) = 0.
- N = O_S fails H⁰(N ⊗ K_S) = 0 whenever p_g(S) > 0.
- H⁰(N⁻¹ ⊗ K_S(R)) = 0 iff H²(S, N(−R)) = 0, by Serre duality (SchemeAndStackFoundations §2.20).

*Needs:* SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §2.20.

### 4.5 Normal-bundle cohomology bound

Assumptions 5.1 and 5.2; X the blown-up threefold, an isomorphism near C.

Under Assumptions 5.1 and 5.2, h¹(C, `N_{C/X}`) ≤ h²(S, O_S) for the lifted curve C ⊂ T ⊂ X. (B19, Lemma 5.3, first statement, pp. 87–88)

A proof can proceed as follows.

1. 0 → `T_{X/S}|_C` → `N_{C/X}` → `N_{C/S}` → 0 with `T_{X/S}` ≅ O_X(2) ⊗ L⁻¹, so `T_{X/S}|_C` ≅ L|_C by (5.1), and `N_{C/S}` ≅ A^l|_C.
2. H¹(C, L|_C) = 0 from H¹(S, L) = 0 and H²(S, N(−R)) = 0, the latter Serre dual to H⁰(N⁻¹ ⊗ K_S(R)) = 0.
3. H¹(S, A^l) = 0 gives h¹(C, A^l|_C) ≤ h²(S, O_S) from 0 → O_S → A^l → A^l|_C → 0; the long exact sequence concludes.

**Checks.**

- For a rational surface S, h²(O_S) = 0 and the bound gives H¹(C, `N_{C/X}`) = 0.

*Needs:* §4.2; §4.4; §4.1; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §5.10.

### 4.6 Vanishing of H² after twisting by the curve

As in §4.5; the rational double points of T̄ avoid C.

Under Assumptions 5.1 and 5.2, H²(T, O_T(C)) = 0. (B19, Lemma 5.3, second statement, pp. 87–88)

A proof can proceed as follows.

1. The resolution T → T̄ has rational singularities away from C, so H²(T, O_T(C)) ≅ H²(T̄, `O_{T̄}(C)`) (Leray; §3.3).
2. T̄ is a Cartier divisor in X̄, hence Gorenstein with `ω_{T̄}` ≅ p̄*(K_S ⊗ L(R)); by Serre duality it suffices that H⁰(T̄, ω(−C)) = 0.
3. Push forward by p̄ using §4.3: H⁰(ω(−C)) is the kernel of H⁰(K_S ⊗ L(R)) ⊕ H⁰(K_S) → H⁰(C, K_S ⊗ L(R)), (x, y) ↦ x + rg·y.
4. Using H⁰(N ⊗ K_S) = 0, injectivity reduces to injectivity of H⁰(K_S) → H¹(S, N ⊗ K_S), cup with ∂(rg) = r ∪ ∂g; ψ : H⁰(C, L) → H¹(S, N(−R)) → H¹(S, N) is onto by H¹(S, L) = H¹(R, N|_R) = 0, so for general g, ψ(g) is general and Assumption 5.2 gives injectivity (connecting maps commute with cup products: BRE97, Chapter II, Theorem 7.1 (c)).

**Checks.**

- If H⁰(S, K_S) = 0 the last step is empty.

*Needs:* §4.3; §4.4; §4.1; §3.3; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.20.

### 4.7 Kodaira–Spencer contraction through normal bundles

C, T, X smooth projective over ℂ; T moves in an open subset of its linear system. The third map lands in H¹(C, `N_{C/T}`) (source correction E12).

Let C ⊂ T ⊂ X be smooth projective complex varieties of dimensions 1, 2 and 3, λ ∈ H¹(T, Ω¹_T) the class of C, and B ⊂ |O_X(T)| an open set of smooth members containing T, with universal family 𝒯 → B. Then the composite φ_λ : `T_{B,T}` → H¹(T, T_T) → H²(T, O_T) of the Kodaira–Spencer map κ_T of §2.2 and contraction with λ equals the composite `T_{B,T}` → H⁰(T, `N_{T/X}`) → H⁰(C, `N_{T/X}|_C`) → H¹(C, `N_{C/T}`) → H²(T, O_T) of the classifying map of embedded deformations, restriction to C, the boundary of 0 → `N_{C/T}` → `N_{C/X}` → `N_{T/X}|_C` → 0 and the boundary of 0 → O_T → O_T(C) → O_T(C)|_C ≅ `N_{C/T}` → 0. (BEN18, Proposition 2.1 and proof, pp. 6–7; B19, Proof of Proposition 5.4, p. 88; SER06, Proposition 3.2.9 (i))

A proof can proceed as follows.

1. For the universal family 𝒯 ⊂ B × X, the differential of the projection 𝒯 → X, restricted to T, maps the fibre tangent sequence 0 → T_T → `T_𝒯|_T` → `T_{B,T}` ⊗ O_T → 0 of §2.2 to the normal sequence 0 → T_T → T_X|_T → `N_{T/X}` → 0. It is the identity on T_T, and on global sections of the quotients it is the classifying map `T_{B,T}` → H⁰(T, `N_{T/X}`), which sends a tangent vector of B to the normal field of the corresponding first-order deformation of T in X. Connecting maps are natural, so κ_T is the classifying map followed by the boundary of the normal sequence (SER06, Proposition 3.2.9 (i), states this).
2. The boundary maps of short exact sequences of locally free sheaves are cup products with their extension classes, and the commutative diagram comparing 0 → T_T → T_X|_T → `N_{T/X}` → 0 with 0 → `N_{C/T}` → `N_{C/X}` → `N_{T/X}|_C` → 0 identifies the contraction with λ with the displayed composite (BEN18 Proposition 2.1).

**Checks.**

- If C = ∅ (λ = 0) both composites vanish.
- For a general smooth quartic T ⊂ ℙ³ containing a line C, the composite `T_{B,T}` → H²(T, O_T) ≅ ℂ is onto: quartics containing a line form a Noether–Lefschetz component of the expected codimension one.

*Needs:* §2.2; SchemeAndStackFoundations §2.6.

### 4.8 Noether–Lefschetz locus of the expected dimension

The boundary of the normal sequence lands in H¹(C, `N_{C/T}`) (the published (5.7) prints H⁰; see source correction E12).

Under Assumptions 5.1 and 5.2, let λ ∈ H¹(T, Ω¹_T) be the class of the lifted curve C and φ_λ : `T_{B,s}` → H²(T, O_T) the Kodaira–Spencer contraction of the family 𝒯 → B at s. Then dim coker φ_λ ≤ h²(S, O_S). (B19, Proposition 5.4, pp. 88–89)

A proof can proceed as follows.

1. §4.7 writes φ_λ as `T_{B,s}` → H⁰(T, `N_{T/X}`) → H⁰(C, `N_{T/X}|_C`) → H¹(C, `N_{C/T}`) → H²(T, O_T).
2. The last map is onto because H²(T, O_T(C)) = 0 (§4.6); the third has cokernel of dimension ≤ h¹(C, `N_{C/X}`) ≤ h²(S, O_S) (§4.5).
3. The first two maps compose to H⁰(S, L²(R)) → H⁰(C, L²(R)|_C) followed by multiplication by w², an isomorphism by (5.1); the restriction is onto since H¹(S, L ⊗ N) = 0.

**Checks.**

- For S rational, φ_λ is surjective.

*Needs:* §4.5; §4.6; §4.2; §4.7.

### 4.9 Blowing up points to realise the auxiliary hypotheses

P, Q general and large; A₀ ample with H¹(R, A₀|_R) = 0, and A₀ may be taken to be the square of an ample line bundle.

Let S be a connected smooth projective surface over ℝ, R an SNC divisor and A₀ an ample line bundle with H¹(R, A₀|_R) = 0 (a sufficiently positive twist of any ample bundle works). Let μ : S′ → S be the blow-up of two disjoint finite sets P, Q of sufficiently many general closed points off R, with exceptional divisors E = μ⁻¹P, F = μ⁻¹Q, and N = μ*A₀(2F − 2E). Then there is η ∈ H¹(S′, N) with (i) H⁰(S′, N ⊗ `K_{S′}`) = 0, (ii) H⁰(S′, N⁻¹ ⊗ `K_{S′}(R′)`) = 0, (iii) H¹(R′, `N|_{R′}`) = 0, (iv) ∪η : H⁰(S′, `K_{S′}`) → H¹(S′, N ⊗ `K_{S′}`) injective, where R′ = μ⁻¹R ≅ R. The same holds after further blow-ups at general points off R. If A₀ = `A′^{⊗2}` is a square, then cl_R(N) = 2·cl_R(μ*A′) + 2·cl_R(F) − 2·cl_R(E) = 0 in H¹(S′(ℝ), 𝔽₂), and this persists on further blow-ups, where N is pulled back. A₀ is unrelated to the very ample A of Proposition 6.6. (B19, Proposition 5.5 and proof, pp. 89–90)

A construction can proceed as follows.

1. A₀ exists: a sufficiently high power of an ample bundle has H¹(R, A₀|_R) = 0 by Serre vanishing on the curve R (SchemeAndStackFoundations §2.6, `ample_serre_vanishing`); taking an even power gives a square A₀ = `A′^{⊗2}`, and cl_R is additive on Pic (MotivesAndAlgebraicCycles §7.6b), so cl_R(N) = 0.
2. (iii): `N|_{R′}` ≅ A₀|_R because the blow-ups avoid R.
3. (i): H⁰(S′, N ⊗ `K_{S′}`) = H⁰(S, A₀ ⊗ K_S ⊗ I_P) vanishes for P large and general; (ii) likewise with Q.
4. (iv): through the injective Leray edge maps, reduce to ν ∈ H¹(S, A₀ ⊗ I_P) with ∪ν injective on H⁰(K_S); take ν = ∂ξ for ξ ∈ H⁰(P, A₀|_P) vanishing on P₂ but at no point of P₁, where P = P₁ ⊔ P₂ is split so that no nonzero section of K_S vanishes on P₁ and none of A₀ ⊗ K_S vanishes on P₂; lift ν to H¹(S, A₀ ⊗ I_P²) and map it to H¹(S′, N).

The construction has the following API.

- (S′, μ, N, η) from (S, R, A₀) and general P, Q.
- N satisfies Assumption 5.2 on S′ with R′ = μ⁻¹R.
- `N|_{R′}` ≅ A₀|_R.
- The conclusion persists after blowing up further general points off R.
- For A₀ = `A′^{⊗2}` a square, cl_R(N) = 0 on S′(ℝ) and on every further blow-up.

**Checks.**

- On ℙ²_ℝ with R a line and A₀ = O(1), (iii) is H¹(ℙ¹, O(1)) = 0 and (iv) is empty since H⁰(K_S) = 0, so only (i)–(iii) need blow-ups.
- With P = Q = ∅, N = A₀ and (i) fails as soon as H⁰(A₀ ⊗ K_S) ≠ 0.
- A₀ need not be very ample and is not the bundle A of §4.1; conflating them changes the vanishing conditions.
- H¹(S, A₀ ⊗ I_P) → H¹(S′, μ*A₀(−E)) is the injective Leray edge map of μ.
- On ℙ²_ℝ with R a line: A₀ = O(2) has H¹(ℙ¹, O(2)) = 0 and gives cl_R(N) = 0, while A₀ = O(1) gives cl_R(N) = μ*h ≠ 0 in H¹(S′(ℝ), 𝔽₂); only the first gives cl_R(L(R)) = cl_R(A^l ⊗ N) = 0 for l even, which is what the double covers of §6.13 use.

*Needs:* §4.4; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`); StableReduction Layer 4; MotivesAndAlgebraicCycles §7.6b.

### Examples

On ℙ²_ℝ with A = O(1), l = 2, N = O and R a real line, L = O(1) and L ⊗ N = O(1) are very ample, and x² + y² + z² cuts out a smooth conic without real points meeting R in two conjugate points; with N = O(−1), L = O is not very ample. For quartic surfaces in ℙ³, lines form a four-dimensional family and containing a given line imposes five conditions, so quartics containing a line form a divisor, of codimension `h^{2,0}` = 1, the expected dimension of a Noether–Lefschetz locus. (B19 §5, pp. 86–90; BEN18, Introduction, p. 2, on Noether–Lefschetz loci of the expected dimension.)

### Dependencies

Layer 2; Layer 3; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); MotivesAndAlgebraicCycles §7.6b; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`); SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §5.10; StableReduction Layer 4.

## Layer 5: classes of period two on a branched double cover: residues, topological obstruction and integral lifts

The hypotheses on a double cover killing a period-two class (avoidance of the set Ψ ⊃ Θ, generation of a kernel by curves avoiding Ψ, injectivity on H²); the pulled-back class is unramified, componentwise on a possibly disconnected cover; its topological obstruction is killed by ω; the boundary component on the avoided set with the corrected evaluation term; and the exact criteria replacing the source's Propositions 4.4 and 4.5 for a given cover: vanishing of the obstruction, the Picard correction through the trace quotient, the curve adjustment, and the integral pushforward adjustment.

### 5.1 Hypotheses on a double cover killing a period-two class

Cohomology of real loci with 𝔽₂ coefficients; cl_R is the Borel–Haefliger class of MotivesAndAlgebraicCycles §7.6b. Ψ need not be closed in S(ℝ).

Let S be a connected smooth projective surface over ℝ, α ∈ Br(ℝ(S)) of period 2 whose ramification divisor R is SNC, U = S ∖ R, Θ = Θ(α) ⊂ U(ℝ), and Ψ ⊂ U(ℝ) a subset open and closed in U(ℝ) with Θ ⊂ Ψ. For a double cover p : T → S of §3.2 ramified over R ∪ D, Assumption 4.1 consists of three conditions: (i) no real point of T maps into Ψ, that is p(T(ℝ)) ∩ Ψ = ∅; (ii) every class of H¹(S(ℝ), 𝔽₂) that restricts to 0 on Ψ is a sum of a pushforward p_*c with c ∈ H¹(T(ℝ), 𝔽₂) and of classes cl_R(Γ) of curves Γ ⊂ S with Γ(ℝ) ∩ Ψ = ∅; (iii) p_* : H²(T(ℝ), 𝔽₂) → H²(S(ℝ), 𝔽₂) is injective. As the real branch locus Δ(ℝ) lies in p(T(ℝ)), condition (i) puts Ψ inside S*(ℝ). (B19, §4 and Assumption 4.1, pp. 79–80)

A construction can proceed as follows.

1. (i)–(iii) are conditions on the real topology of the cover; their consequences are proved in Layer 5 and their verification in §6.8.
2. Over a point of Δ(ℝ) the fibre of p has a real point (the ramification point or a real ℙ¹), so Δ(ℝ) ⊂ p(T(ℝ)) and (i) gives Ψ ∩ Δ(ℝ) = ∅.

The definition has the following API.

- The three conditions (i)–(iii) for (S, α, Ψ, p).
- p(T(ℝ)) ∩ Ψ = ∅.
- ker(H¹(S(ℝ)) → H¹(Ψ)) = p_*H¹(T(ℝ)) + span of cl_R of curves avoiding Ψ.
- p_* is injective on H² of real loci.
- Ψ ⊂ S*(ℝ).

**Checks.**

- If S(ℝ) = ∅ the hypotheses hold for Ψ = ∅ and every cover.
- If T(ℝ) = ∅, (i) and (iii) hold for every Ψ, and (ii) says the kernel is spanned by classes of curves avoiding Ψ.
- If D(ℝ) ∩ Ψ ≠ ∅, condition (i) fails.
- Ψ = Θ(α) is always admissible, Θ(α) being open and closed in U(ℝ) (§1.4).
- On S = ℙ²_ℝ no class has a single line as ramification divisor: the complement of a line is 𝔸²_ℝ, and Br(𝔸²_ℝ) = Br(ℝ) consists of classes unramified everywhere on ℙ²_ℝ. Take instead α = (−1, x/z): its residue is the class of −1 along {x = 0} and along {z = 0}, where x/z has valuation 1 and −1 and −1 is not a square in the residue field ℝ(t), and 0 along every other prime divisor; so R = {x = 0} ∪ {z = 0} is SNC and α has period 2. Then U(ℝ) = {x/z ≠ 0} is two open half-planes, Θ(α) = {x/z < 0} ≅ ℝ², and Ψ = Θ(α) is open and closed in U(ℝ) but not closed in S(ℝ). Condition (ii) holds for every cover: H¹(Ψ, 𝔽₂) = 0, so the kernel is all of H¹(ℝℙ², 𝔽₂) = 𝔽₂, generated by cl_R of the line {x = 0}, whose real locus misses Ψ; cl_R(R) = 2h = 0 would not generate it.

*Needs:* §3.2; §3.4; §1.4; §1.1; MotivesAndAlgebraicCycles §7.6b.

### 5.2 The pulled-back class is unramified

Assumption 4.1 (§5.1). T is smooth but need not be connected (§3.1 allows split covers), so the statement is componentwise; T_U = p⁻¹(U).

Under Assumption 4.1, the class p*α ∈ Br(T_U)[2] extends to a class α_T ∈ Br(T)[2], unique because Br(T) → Br(T_U) is injective for the regular scheme T whose components all meet T_U. On each connected component T_i of T, which is integral and dominates S, the image of α_T in Br(ℝ(T_i))[2] is the restriction `α_{ℝ(T_i)}`. When T is integral, in particular under Assumption 3.1 (§5.3), α_T is written `α_{ℝ(T)}` ∈ Br(T)[2] ⊂ Br(ℝ(T))[2]. (B19, Proposition 4.2 and proof, p. 80)

A proof can proceed as follows.

1. Fix a component T_i. Residues of `α_{ℝ(T_i)}` vanish along integral curves of T_i not lying over R, because α is unramified on U and pullback preserves this.
2. Along a curve dominating a component of R, the ramification index is 2 and the residue of the restriction is the ramification index times the restricted residue (HeightsRationalPointsAndObstructions §2.16b, `pullbackMultiplicity`), which kills a class of period 2.
3. The remaining curves Γ are ℙ¹'s contracted by p: the exceptional curves over Sing R and the ℙ¹ fibres over R ∩ D of the incidence model (both kinds must be treated; source correction E18). The ramification locus of `α_{ℝ(T_i)}` is then smooth, so, the Gersten complex being a complex (MotivesAndAlgebraicCycles §0.5b), res_Γ(α) ∈ H¹(ℝ(Γ), ℤ/2) is unramified on Γ.
4. If Γ ≅ ℙ¹_ℂ, H¹_ét(Γ, ℤ/2) = 0. If Γ ≅ ℙ¹_ℝ, it suffices to show res_Γ(α)|_x = 0 at one x ∈ Γ(ℝ): choose a curve Γ′ ⊂ T_i through x transverse to Γ and meeting T_U; at general real points y of Γ′, p(y) ∉ Ψ ⊃ Θ by (i), so (p*α)_y = 0, and Witt's theorem (§0.9 (b), which allows ramification of the class on Γ′) gives `p*α|_{ℝ(Γ′)}` = 0, so its residue at x, which is res_Γ(α)|_x, vanishes.
5. All residues along curves of T_i vanish, so `α_{ℝ(T_i)}` ∈ Br(T_i) by purity for the regular surface T_i (HeightsRationalPointsAndObstructions §2.16b, `smoothBrauer_residueExact`); these classes form α_T ∈ Br(T) = ⊕ Br(T_i), which restricts to p*α on T_U.

**Checks.**

- If R = ∅ the statement is that α_T = p*α is unramified on T, which is immediate.
- For the split cover of §3.1 (R = D = ∅, L = O, s = 1), T = S ⊔ S and α_T = (α, α) ∈ Br(S) ⊕ Br(S); the total ring of fractions ℝ(S) × ℝ(S) of T is not a field ((1, 0)·(0, 1) = 0), so only the componentwise restrictions are Brauer classes of function fields.

*Needs:* §5.1; HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); MotivesAndAlgebraicCycles §0.5b; §0.9; §1.1; §3.4.

### 5.3 The topological obstruction is killed by ω

Assumptions 3.1 and 4.1; S connected. Under Assumption 3.1, T is integral: the components of T(ℂ) correspond to those of S(ℂ) (§3.5, i = 4, conjugation exchanging two components of T(ℂ) when it exchanges those of S(ℂ)), so the smooth surface T is connected, and α_T of §5.2 is `α_{ℝ(T)}`.

Under Assumptions 3.1 and 4.1, let τ ∈ H³_G(T(ℂ), ℤ(1))[2] be the image of `α_{ℝ(T)}` ∈ Br(T)[2] in the real topological Brauer sequence 0 → H²_G(ℤ(1))/⟨2, Pic⟩ → Br[2] → H³_G(ℤ(1))[2] → 0. Then τ ∪ ω = 0 in H⁴_G(T(ℂ), ℤ). (B19, Proposition 4.3 and proof, pp. 80–81)

A proof can proceed as follows.

1. The pushforward square from Br(T)[2] → H³_G(T, ℤ(1)) → H⁴_G(T, ℤ) → H⁰ ⊕ H²(T(ℝ)) to the same row for S commutes (equivariant Gysin compatibility, MotivesAndAlgebraicCycles §7.6b).
2. p_*(α_T) = 2α = 0, so p_*[τ ∪ ω]₂ = 0; by (iii) [τ ∪ ω]₂ = 0. By (i), α evaluates to 0 at p(x) for x ∈ T(ℝ), so [τ ∪ ω]₀ = 0.
3. The norm sequence H⁴(T(ℂ), ℤ) → H⁴_G(T(ℂ), ℤ) → H⁰ ⊕ H²(T(ℝ)) is exact: the kernel of ∪ω is the norm image (real–complex sequence, MotivesAndAlgebraicCycles §7.6a; BW20 Lemma 2.11 (ii)), restriction H⁵_G(T(ℂ), ℤ(1)) → H⁵_G(T(ℝ), ℤ(1)) is an isomorphism above twice the dimension (AlgebraicTopologyPartII Layer 6), and the real components of ξ ∪ ω are those of ξ (MotivesAndAlgebraicCycles §7.6b). So τ ∪ ω = N(c) for some c; T(ℂ) has one component or two exchanged by conjugation (§3.5 in degree 4), so τ ∪ ω = m·cl(y + σy) for a point y.
4. Pushing forward to H⁴(S(ℂ), ℤ) kills τ ∪ ω, so m·cl(p(y) + p(σy)) = 0, forcing m = 0.

**Checks.**

- If T(ℝ) = ∅ then the real components vanish trivially and only the norm argument is needed.

*Needs:* §5.2; §3.5; §1.2; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; AlgebraicTopologyPartII Layer 6 (free descent, from MotivesAndAlgebraicCycles §7.6a).

### 5.4 The boundary component on the avoided set

Ψ ⊂ S*(ℝ) (consequence of Assumption 4.1 (i)); on Ψ conjugation acts by −1 on Z̃, so the relevant coefficient twist has +1 stalks. M = L(R) is the line bundle of §3.1, with b = rs ∈ H⁰(S, M²). The evaluation of α may vary on Ψ: a₀ = [α̃]₀ is the locally constant function equal to 1 on Θ and 0 on Ψ ∖ Θ (§1.4).

In the setting of §5.1 let α̃ ∈ H²_G(U(ℂ), 𝔽₂) lift α, with components a₀ = [α̃]₀ and a₁ = [α̃]₁ on Ψ, let ζ = ∂(`α̃|_{S*}`) ∈ H³_G(S*(ℂ), Z̃(1)) for the boundary of 0 → Z̃(1) → Z̃(1) → 𝔽₂ → 0, and let e ∈ H¹_G(S*(ℂ), 𝔽₂) be the class of the double cover. Then [ζ]₁|_Ψ = a₁ + a₀ ∪ [e]₁|_Ψ, and [e]₁ = `cl_R(M)|_{S*(ℝ)}`. In particular, if a₁ = 0 then [ζ]₁|_Ψ = a₀ ∪ cl_R(M)|_Ψ, the class equal to cl_R(M) on the components of Ψ in Θ and to 0 on the others. (B19, Proof of Proposition 4.4, (4.8), p. 84; B19, Lemma 2.1, p. 75)

A proof can proceed as follows.

1. The boundary for the twisted sequence is the twisted Bockstein: Bockstein plus cup with e + ω (AlgebraicTopologyPartII §14.2, AlgebraicTopologyPartII §7.4).
2. On Ψ, [e + ω]₀ = 1 + 1 = 0 and [e + ω]₁ = [e]₁, so in canonical components (a₀, a₁, a₂) ↦ (0, a₁ + a₀ ∪ [e]₁, β(a₁) + a₁ ∪ [e]₁) (cup-product formula in canonical components, MotivesAndAlgebraicCycles §7.6b).
3. The double cover over S* is the μ₂-torsor of square roots of the trivialisation b of M² on S*, and the Kummer map H¹_ét(S*, μ₂) → Pic(S*)[2] sends it to `M|_{S*}` (SchemeAndStackFoundations §2.11); so υ(e) = `M|_{S*}` and §1.3 gives [e]₁ = `cl_R(M)|_{S*(ℝ)}`.

**Checks.**

- Constant evaluation a₀ = t on Ψ with a₁ = 0: [ζ]₁|_Ψ = t·cl_R(M)|_Ψ; t = 0 (the case 4 | n of the induction) gives 0, and t = 1 recovers the printed formula [ζ]₁ = [e]₁ of the source.
- Mixed evaluation: if Ψ has two components Ψ₀, Ψ₁ with a₀ = (0, 1), a₁ = 0 and [e]₁ = (e₀, e₁), then [ζ]₁ = (0, e₁); the printed formula gives (e₀, e₁), and a constant t gives 0 or (e₀, e₁), so neither is right when e₀ and e₁ are nonzero.
- If L = A^l ⊗ N(−R) with l even (§4.1), then M = A^l ⊗ N and cl_R(M) = cl_R(N); when cl_R(N) = 0 (§4.9 with A₀ a square), [ζ]₁|_Ψ = a₁ whatever a₀ is.
- Along a circle γ ⊂ Ψ over which M is the Möbius bundle, b is negative, its two conjugate square roots in `M_x ⊗ ℂ` are exchanged once around γ, and [e]₁(γ) = w₁(`M|_γ`) = 1, as the formula [e]₁ = cl_R(M) predicts.

*Needs:* §5.1; §3.1; §3.4; AlgebraicTopologyPartII §14.2; AlgebraicTopologyPartII §7.4; MotivesAndAlgebraicCycles §7.6b; §1.3; SchemeAndStackFoundations §2.11.

### 5.5 Vanishing of the topological obstruction

The homological comparison (4.5) is AlgebraicTopologyPartII §16.4, with its plus sign and indeterminacy. M = L(R), I = p_*H¹(T(ℝ), 𝔽₂) ⊂ H¹(S(ℝ), 𝔽₂) as in §3.6, and J ⊂ H¹(S(ℝ), 𝔽₂) is the image of H²_G(S(ℂ), ℤ(1)) under ξ ↦ [ξ]₁; J contains cl_R(Pic(S)), since cl_R(N) = [cl(N)]₁ (MotivesAndAlgebraicCycles §7.6b). The criterion concerns the class c_Ψ = ([α̃]₀ ∪ cl_R(M))|_Ψ of §5.4, which depends only on the evaluation of α on Ψ and on M.

Under Assumptions 3.1 and 4.1, suppose α has a Kummer lift α̃ ∈ H²_G(U(ℂ), 𝔽₂) with [α̃]₁|_Ψ = 0. Then the obstruction τ of §5.3 vanishes if and only if c_Ψ ∈ H¹(Ψ, 𝔽₂) is the restriction to Ψ of an element of J; when it does, `α_{ℝ(T)}` lifts to a class β ∈ H²_G(T(ℂ), ℤ(1)). The criterion holds, so τ = 0, whenever c_Ψ = cl_R(φ_Ψ)|_Ψ for some φ_Ψ ∈ Pic(S): with φ_Ψ = M^t when [α̃]₀ is constant equal to t on Ψ (t = 1 is the case the source's computation treats), and with φ_Ψ = O_S when cl_R(M) vanishes on Ψ, for any evaluation on Ψ. It can fail when the evaluation of α is not constant on Ψ (Checks). (B19, Proposition 4.4 and proof, pp. 81–84; B19, (4.3)–(4.8), pp. 82–84; source correction E3)

A proof can proceed as follows.

1. By §5.3 and the real–complex sequence, τ = N(γ) with γ ∈ H³(T(ℂ), ℤ); p_*γ lifts to δ ∈ H³_G(S(ℂ), ℤ), unique up to H²_G(S(ℂ), ℤ(1)) ∪ ω. Then τ = 0 iff γ comes from H³_G(T(ℂ), ℤ), iff (p_* being an isomorphism on H³ of the complex loci, §3.5) δ ∈ p_*H³_G(T(ℂ), ℤ) + H²_G(S(ℂ), ℤ(1)) ∪ ω, iff (§3.6 with i = 3, and [ξ ∪ ω]₁ = [ξ]₁) [δ]₁ ∈ I + J.
2. The double-cover chase comparison (AlgebraicTopologyPartII §16.4) gives η₀ on S₀ with g(`δ|_{S₀}`) + ζ ∪ ω = g(η₀ ∪ ω); extend η₀ to η on S by equivariant purity (MotivesAndAlgebraicCycles §7.6b) and replace δ by δ − η ∪ ω, which changes neither the criterion of step 1 nor p_*γ.
3. Restricting to Ψ in canonical components, [g(δ)]₁ = [δ]₁ and [ζ ∪ ω]₁ = [ζ]₁ = c_Ψ (§5.4, using [α̃]₁|_Ψ = 0), so the relation gives [δ]₁|_Ψ = c_Ψ.
4. If c_Ψ = [ξ]₁|_Ψ with ξ ∈ H²_G(S(ℂ), ℤ(1)), then [δ − ξ ∪ ω]₁ vanishes on Ψ, Assumption 4.1 (ii) puts it in I + cl_R(Pic(S)) ⊂ I + J, and τ = 0 by step 1. Conversely, if τ = 0 then [δ]₁ = p_*c + [ξ]₁ with c ∈ H¹(T(ℝ), 𝔽₂); the pushforward p_*c restricts on the open set Ψ to the pushforward from p⁻¹(Ψ) ∩ T(ℝ), which is empty by Assumption 4.1 (i), so c_Ψ = [ξ]₁|_Ψ.

**Checks.**

- For S(ℝ) = ∅ the hypotheses are empty and τ = 0 for every cover satisfying Assumption 3.1.
- Constant evaluation t on Ψ: c_Ψ = t·cl_R(M)|_Ψ = cl_R(M^t)|_Ψ ∈ J|_Ψ; t = 1 is the source's Picard correction M, and t = 0 needs none.
- Mixed evaluation on Ψ = Ψ₀ ⊔ Ψ₁ with a₀ = (0, 1): c_Ψ = `(0, cl_R(M)|_{Ψ₁})`, while the source's correction by M leaves [δ − cl(M) ∪ ω]₁|_Ψ = `(cl_R(M)|_{Ψ₀}, 0)`, nonzero when `cl_R(M)|_{Ψ₀}` ≠ 0; c_Ψ = 0 when cl_R(M)|_Ψ = 0.
- The criterion can fail, so the source's Proposition 4.4 does not hold for every Ψ. Let X ⊂ ℙ⁵_ℝ be the K3 surface x_j² = Σ_l B_jl y_l² (j = 0, 1, 2) with B = ((1, 1, 1), (1, 2, 4), (1, 3, 9)), all of whose minors are nonzero (determinant 2), so X is a smooth intersection of three quadrics, and ι(x, y) = (x, −y), which is free (a fixed point would have y = 0, forcing x = 0, or x = 0, forcing By² = 0 and y = 0); S = X/ι is a real Enriques surface. For real y ≠ 0 every (By²)_j is positive, so X(ℝ) is four spheres, one for each sign vector of x modulo ±1 and parametrised by y/|y|, each mapped to itself antipodally by ι, and a point with conj(P) = ι(P) would need x_j² = −(By′²)_j ≤ 0 with x, y′ real; so S(ℝ) = N₁ ⊔ N₂ ⊔ N₃ ⊔ N₄ with N_i ≅ ℝℙ² and one empty half. With h_i the generator of H¹(N_i), w₁ = Σ h_i and h_i² = 1, and J = {Σ c_i h_i : Σ c_i = 0}, the orthogonal of w₁ (MVH98, Proposition 4.2, p. 12), which is also cl_R(Pic(S)) (MVH98, Theorem 4.4). The only nonzero δ ∈ H¹_G(S(ℂ), 𝔽₂) with [δ]₀ = 0 has [δ]₁ = w₁ (B19, proof of Theorem 0.6, p. 107), and deg(w₁ ∪ (h₁ + h₂)) = 1 + 1 = 0, so B19 Proposition 8.1 (p. 105) gives α̃ ∈ H²_G(S(ℂ), 𝔽₂) with [α̃]₀ = 1 on N₁ ⊔ N₂, 0 on N₃ ⊔ N₄, and [α̃]₁ = 0; its class α ∈ Br(S)[2] has R = ∅ and Θ = N₁ ⊔ N₂. Take Ψ = S(ℝ), L = θ ⊗ A²ᵏ very ample (A ample, k large) with cl_R(θ) = h₁ + h₃ ∈ J, and s ∈ H⁰(S, L²) near −Σ t_i² (t_i ∈ H⁰(S, L) without common zero), hence negative on S(ℝ), with D smooth: T(ℝ) = ∅, Assumptions 3.1 and 4.1 hold, and c_Ψ = h₁, whose coefficient sum is 1, is not in J. So τ ≠ 0.
- On the same surface with cl_R(L) = h₁ + h₂ instead, c_Ψ = h₁ + h₂ = cl_R(L), so τ = 0 although the evaluation is not constant on Ψ.

*Needs:* §5.3; §5.4; §3.6; §3.5; AlgebraicTopologyPartII §16.4; MotivesAndAlgebraicCycles §7.6b.

### 5.6 Primitive Picard correction of the trace comparison

n = 2; V the open where p is finite flat; the minus sign in b is essential.

Let α ∈ Br(U)[2] and the cover satisfy Assumptions 3.1 and 4.1, with a Kummer lift α̃ ∈ H²_G(U(ℂ), 𝔽₂), V = U ∩ S₀ the finite-flat part, and let η, ζ be the trace-quotient lift of `α̃|_V` (AlgebraicTopologyPartII §15.3), with b = p*η − ψ(ζ) on T_V (AlgebraicTopologyPartII §15.4). If β ∈ H²_G(T(ℂ), ℤ(1)) lifts `α_{ℝ(T)}`, write `β|_{T_V}` = b + 2γ₀ + cl(φ₀) and p_*β = 2δ + cl(θ₁). Then there is μ ∈ Pic(S) with δ|_V − η − p_*γ₀ = cl(μ|_V). (B19, Proposition 4.5 proof, pp. 84–85; BW20, Proposition 2.9, first assertion)

A proof can proceed as follows.

1. `β|_{T_V}` and b both lift p*α in the topological Brauer sequence on T_V, so they differ by 2γ₀ + cl(φ₀).
2. p_*β induces p_*p*α = 2α = 0, so p_*β = 2δ + cl(θ₁).
3. Push the first identity forward: p_*b = 2η since Tr∘ψ = 0; thus 2(δ|_V − η − p_*γ₀) = cl(p_*φ₀ − θ₁|_V).
4. The cokernel of cl : Pic(V) → H²_G(V(ℂ), ℤ(1)) is torsion-free (gap:picard-cokernel-torsion-free; BW20, Proposition 2.9), and Pic(S) → Pic(V) is onto (§1.9, from SchemeAndStackFoundations §3.4), which produces μ.

**Checks.**

- If α̃ = 0 (in particular α = 0 with its zero lift) one may take η, ζ, β zero and μ = 0; a nonzero lift α̃ = κ(N′) = cl(N′) mod 2 of α = 0, for a line bundle N′ on V, needs η = cl(N′) instead.

*Needs:* §5.5; AlgebraicTopologyPartII §15.3; AlgebraicTopologyPartII §15.4; AlgebraicTopologyPartII §15.2; §3.4; §1.2; §1.9; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); SchemeAndStackFoundations §3.4.

### 5.7 Curve adjustment before the pushforward criterion

Assumption 4.1 (ii); for the second assertion Assumption 3.1.

Under Assumption 4.1 (ii), if d ∈ H²_G(S(ℂ), ℤ(1)) has [d]₁|_Ψ = 0, there is ν ∈ Pic(S), an integral combination of curves whose real loci avoid Ψ, such that [d − cl(ν)]₁ ∈ p_*H¹(T(ℝ), 𝔽₂). If moreover L(R) is ample, d − cl(ν) = p_*γ for some γ ∈ H²_G(T(ℂ), ℤ(1)). (B19, Proposition 4.5 proof, p. 85, application of Assumption 4.1 (ii) and Proposition 3.3)

A proof can proceed as follows.

1. [d]₁ lies in the kernel of H¹(S(ℝ)) → H¹(Ψ), so by (ii) it is a sum of p_*c and of cl_R(Γ_k) for curves Γ_k avoiding Ψ.
2. cl_R(Γ) = [cl(O(Γ))]₁ (compatibility of Krasnov and Borel–Haefliger classes, MotivesAndAlgebraicCycles §7.6b), so ν = Σ Γ_k works.
3. §3.6 in degree 2 gives γ.

**Checks.**

- If [d]₁ = 0 on all of S(ℝ), one may take ν = 0.

*Needs:* §5.1; §3.6; MotivesAndAlgebraicCycles §7.6b.

### 5.8 Integral pushforward adjustment

Assumptions 3.1 and 4.1, a Kummer lift α̃ with [α̃]₁|_Ψ = 0, and τ = 0 (§5.5), so that integral lifts β of `α_{ℝ(T)}` exist; c_Ψ = ([α̃]₀ ∪ cl_R(M))|_Ψ with M = L(R), as in §5.5; no integral lift of α̃ on U is used.

Under these hypotheses the following are equivalent: (a) for every β ∈ H²_G(T(ℂ), ℤ(1)) lifting `α_{ℝ(T)}` there are γ ∈ H²_G(T(ℂ), ℤ(1)) and θ ∈ Pic(S) with p_*(β − 2γ) = cl(θ) in H²_G(S(ℂ), ℤ(1)); (b) the same holds for some such β; (c) c_Ψ = cl_R(φ_Ψ)|_Ψ for some φ_Ψ ∈ Pic(S). In particular they hold with φ_Ψ = M^t when [α̃]₀ is constant equal to t on Ψ (t = 1 is the case the source's computation treats), and with φ_Ψ = O_S when cl_R(M) vanishes on Ψ, for any evaluation on Ψ. (B19, Proposition 4.5, pp. 84–85; source corrections E3, E4, E5)

A proof can proceed as follows.

1. §5.6 gives δ|_V = η + p_*γ₀ + cl(μ|_V) with p_*β = 2δ + cl(θ₁).
2. Real components on Ψ ∩ V(ℝ): [p_*γ₀]₁ = p_*[γ₀]₁ vanishes on Ψ because Ψ has no real preimage (Assumption 4.1 (i)); only this restriction to Ψ is claimed, not vanishing on V(ℝ) (source correction E21); the component computation of §5.4 applied to α̃ = η mod 2 − φ(ζ) gives [η]₁ = [α̃]₁ + [α̃]₀ ∪ [e]₁ = [α̃]₀ ∪ cl_R(M) on Ψ ∩ V(ℝ); so [δ − cl(μ)]₁ = c_Ψ on Ψ ∩ V(ℝ), hence on Ψ by §1.9.
3. (c) ⇒ (a): δ′ = δ − cl(μ) − cl(φ_Ψ) has [δ′]₁ = 0 on Ψ; §5.7 gives ν and γ with δ′ − cl(ν) = p_*γ, and p_*(β − 2γ) = 2δ + cl(θ₁) − 2(δ − cl(μ) − cl(φ_Ψ) − cl(ν)) = cl(θ) with θ = θ₁ + 2μ + 2φ_Ψ + 2ν.
4. (a) ⇒ (b) because β exists; (b) ⇒ (c): from p_*(β − 2γ) = cl(θ) and p_*β = 2δ + cl(θ₁), 2(δ − p_*γ) = cl(θ − θ₁); the cokernel of cl : Pic(S) → H²_G(S(ℂ), ℤ(1)) being torsion-free (gap:picard-cokernel-torsion-free), δ − p_*γ = cl(θ₂) with θ₂ ∈ Pic(S). Restricting first components to Ψ, [p_*γ]₁|_Ψ = 0 by Assumption 4.1 (i), so c_Ψ = [δ − cl(μ)]₁|_Ψ = cl_R(θ₂ − μ)|_Ψ.

**Checks.**

- For φ_Ψ = O_S (constant evaluation t = 0, or cl_R(M)|_Ψ = 0 with any evaluation) the correction is absent and θ = θ₁ + 2μ + 2ν.
- For constant evaluation t = 1 and φ_Ψ = M, θ = θ₁ + 2μ + 2M + 2ν, the source's correction.
- Criterion (c) asks for an algebraic class, whereas τ = 0 (§5.5) only asks for c_Ψ ∈ J|_Ψ; when H²(S, O_S) = 0 the real Lefschetz (1,1) theorem (MotivesAndAlgebraicCycles §7.8) gives J = cl_R(Pic(S)) and the two agree. On the real Enriques surface of the §5.5 Checks with Θ = N₁ ⊔ N₂ and cl_R(L) = h₁ + h₂, (c) holds with φ_Ψ = L although the evaluation is not constant on Ψ.

*Needs:* §5.6; §5.4; §5.7; §1.9; §5.5; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free).

### Examples

If S(ℝ) = ∅ then Ψ = ∅, every cover satisfies the hypotheses of §5.1, and the topological obstruction vanishes for every cover that also satisfies Assumption 3.1 (§5.5); ampleness of L(R) is needed: a complex Enriques surface E viewed as a surface over ℝ has E(ℝ) = ∅, and for its nonzero Brauer class α the split cover (L = O, R = D = ∅, s = 1, so L(R) = O is not ample) gives T = E ⊔ E and τ = (τ_E, τ_E) ≠ 0, where τ_E is the nonzero element of H³(E(ℂ), ℤ)[2] = ℤ/2 (G exchanges the two copies E(ℂ) and Ē(ℂ) of the complex locus of E, so its equivariant cohomology is that of E(ℂ), and Pic(E) ≅ H²(E(ℂ), ℤ) makes Br(E)[2] → H³(E(ℂ), ℤ)[2] an isomorphism; EnriquesSurfaces §§1.3–1.4). On ℙ²_ℝ with α = (−1, x/z), ramified along the two real lines {x = 0} and {z = 0} (§5.1 Checks; no class is ramified along a single line), Ψ = Θ(α) = {x/z < 0} ≅ ℝ² is open and closed in U(ℝ) but not closed in ℝℙ². The boundary component on Ψ is [ζ]₁ = [α̃]₀ ∪ cl_R(L(R)): for constant evaluation t it is 0 when t = 0 (the case 4 | n of the induction) and [e]₁, the formula printed in the source, when t = 1; on a Ψ with components of both kinds it is cl_R(L(R)) on Θ and 0 on Ψ ∖ Θ, it vanishes altogether when cl_R(L(R)) = 0, and whether the obstruction vanishes then depends on whether this class is the restriction of [ξ]₁ for some ξ ∈ H²_G(S(ℂ), ℤ(1)): on the real Enriques surface with four real components ℝℙ² of §5.5, with Θ = N₁ ⊔ N₂, it is h₁ for cl_R(L) = h₁ + h₃ (τ ≠ 0) and h₁ + h₂ for cl_R(L) = h₁ + h₂ (τ = 0). (B19 §4, pp. 79–85; source correction E3.)

### Dependencies

Layer 0; Layer 1; Layer 3; AlgebraicTopologyPartII Layer 6 (free descent, from MotivesAndAlgebraicCycles §7.6a); AlgebraicTopologyPartII §14.2; AlgebraicTopologyPartII §15.2; AlgebraicTopologyPartII §15.3; AlgebraicTopologyPartII §15.4; AlgebraicTopologyPartII §16.4; AlgebraicTopologyPartII §7.4; HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); MotivesAndAlgebraicCycles §0.5b; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §3.4.

## Layer 6: real-locus control and the degree-two splitting

Positivity in squared real line bundles; the topological conditions on the real branch locus, their stability and their realisation after blow-ups; Nash approximation and Bröcker's real divisors; the branch section with prescribed real locus and sign; the branch conditions imply the cover hypotheses of Layer 5; Green's infinitesimal criterion over ℝ; the vanishing variation of the double-cover family; the stratification of the family of pairs (T, p⁻¹R) and the transport of the normalised Kummer lift; and the source's Proposition 6.6 in its stated generality.

### 6.1 Positivity in a squared real line

Real points only; the tensor-square presentation is fixed.

Let M be a real line, that is, a one-dimensional ℝ-vector space. Call t ∈ `M^{⊗2}` positive when t = m ⊗ m for some nonzero m ∈ M, and negative when −t is positive; this half-line is attached to the given expression of the space as the square of M, not to the underlying one-dimensional space alone. If X is a real variety, M a line bundle on X and x ∈ X(ℝ), a section s of `M^{⊗2}` is positive (negative) at x when s(x) is positive (negative) in the square `M_x^{⊗2}` of the real fibre. (B19, §6, p. 90)

A construction can proceed as follows.

1. m ⊗ m and (−m) ⊗ (−m) agree, and the squares form one of the two half-lines of `M^{⊗2}`.

The definition has the following API.

- Positivity of a section of `M^{⊗2}` at a real point.
- m ⊗ m is positive for m ≠ 0.
- Products of positive sections of squared bundles are positive.
- A nonzero value is either positive or negative, not both.

**Checks.**

- For the trivial line bundle, positivity is positivity of the real function.
- The zero section is neither positive nor negative.
- Rescaling the identification `M^{⊗2}` ≅ ℝ by −1 exchanges positive and negative: the notion is not intrinsic to the line `M^{⊗2}`.
- Σ u_i² for sections u_i of M without common real zero is positive on X(ℝ).

*Needs:* Mathlib `TensorProduct`.

### 6.2 Topological conditions on the real branch locus

Homology classes via Poincaré duality on the compact surface Ξ; cl_R from MotivesAndAlgebraicCycles §7.6b.

Let S be a connected smooth projective surface over ℝ, R an SNC divisor and Ξ ⊂ S(ℝ) a union of connected components with R(ℝ) ⊂ Ξ. Assumption 6.1 is the existence of a compact one-manifold 𝒮, possibly empty, and a C^∞ embedding ι : 𝒮 → Ξ whose image crosses R(ℝ) only at smooth points of R, and transversally there, subject to four conditions, labelled (i)–(iv) as in the source. (i) No connected component of Ξ is disjoint from ι(𝒮). (ii) The pushforward of the mod-2 fundamental class, ι_*[𝒮], equals cl_R(R) in H¹(Ξ, 𝔽₂). (iii) H¹(Ξ, 𝔽₂) is spanned by the classes of the individual circles of ι(𝒮) together with the classes cl_R(Γ) of the curves Γ ⊂ S with Γ(ℝ) ⊂ Ξ. (iv) For a component Σ of Ξ put Σ₀ = Σ ∩ (ι(𝒮) ∪ R(ℝ)); whenever Σ ∖ Σ₀ is the disjoint union of two subsets Σ₊ and Σ₋, each open and closed in Σ ∖ Σ₀, such that every point of Σ₀ lies both in the closure of Σ₊ and in the closure of Σ₋, the set Σ₊ ∪ Σ₀ is connected. (B19, Assumption 6.1, pp. 90–91)

A construction can proceed as follows.

1. The conditions are topological; §6.4 realises them on a blow-up and §6.8 uses them.

The definition has the following API.

- The data: a compact one-manifold 𝒮 and an embedding ι : 𝒮 → Ξ crossing R(ℝ) only at smooth points of R, transversally.
- Condition (i): every component of Ξ meets ι(𝒮).
- Condition (ii): ι_*[𝒮] = cl_R(R) in H¹(Ξ, 𝔽₂).
- Condition (iii): the circle classes of ι(𝒮) and the classes cl_R(Γ) with Γ(ℝ) ⊂ Ξ span H¹(Ξ, 𝔽₂).
- Condition (iv): on each component Σ, every splitting of Σ ∖ Σ₀ into two open and closed parts adherent to all of Σ₀ has Σ₊ ∪ Σ₀ connected.

**Checks.**

- On Ξ = S² with R(ℝ) = ∅, one embedded circle satisfies (i)–(iv): H¹(S²) = 0, its class is 0 = cl_R(R), and for (iv) Σ₀ is the circle, the only splitting adherent to all of Σ₀ is into the two open discs, and an open disc together with the circle is a closed disc, which is connected.
- On a torus Ξ with R(ℝ) = ∅, a single null-homotopic circle fails (iii) unless curve classes generate H¹(Ξ).
- (ii) is equality of Poincaré duals of ι_*[𝒮] and of the Borel–Haefliger class of R.
- If Ξ = ∅ (so R(ℝ) = ∅), the empty embedding satisfies Assumption 6.1.

*Needs:* MotivesAndAlgebraicCycles §7.6b; AlgebraicTopology Stage 6.

### 6.3 Stability of the branch conditions

Strong C^∞ topology; 𝒮 compact.

Assumption 6.1 is an open condition on the map: an embedding ι : 𝒮 → Ξ satisfying it has a neighbourhood in C^∞(𝒮, Ξ), for the strong (Whitney) C^∞ topology, consisting of embeddings that satisfy it as well. (B19, Lemma 6.2, p. 91)

A proof can proceed as follows.

1. (i)–(iii) are preserved by small isotopies (homology classes are locally constant).
2. Transversality to R(ℝ) at smooth points and (iv) persist because (ι, id) : 𝒮 ⊔ R̃(ℝ) → Ξ, with R̃ the normalisation of R, is a normal-crossings immersion and these are stable (GG73, Chapter III, Theorem 3.11).

**Checks.**

- Perturbing ι by a small normal isotopy keeps all four conditions.

*Needs:* §6.2.

### 6.4 Blow-ups producing the branch conditions

The points are transverse self-intersection points of an immersed union of loops, general in Ξ and off R.

For S, R, Ξ as in §6.2 there is a blow-up μ : S′ → S at finitely many general real points such that (S′, Ξ′ = μ⁻¹(Ξ)) with R′ the strict transform of R admits an embedding satisfying Assumption 6.1. The exceptional curves contribute Borel–Haefliger classes generating the new part of H¹(Ξ′). (B19, Lemma 6.3 and proof, p. 91)

A construction can proceed as follows.

1. Choose loops generating H¹(Ξ), add loops so that every component is met and the total class becomes cl_R(R) (one further loop in the class of the difference), and by smooth approximation and transversality get an immersion ι : 𝒮 → Ξ transverse to R(ℝ), injective except at finitely many transverse double points, with ι_*[𝒮] = cl_R(R) and Σ ∩ (ι(𝒮) ∪ R(ℝ)) connected for each component Σ (AlgebraicTopologyPartII §12.2).
2. Blow up the double points; ι lifts to an embedding into Ξ′; the cohomology of the blow-up gives (ii) and (iii), the exceptional real loci being curve classes.
3. (iv): each exceptional real circle meets ι′(𝒮) in two points separating it into arcs in Σ′₊ and Σ′₋, which forces the required connectedness.

The construction has the following API.

- μ : S′ → S and an embedding ι′ satisfying Assumption 6.1 on (S′, Ξ′).
- The centres lie off R, so R′ ≅ R.
- H¹(Ξ′) = μ*H¹(Ξ) ⊕ span of the exceptional real circles.
- Further general blow-ups off R preserve the conclusion and §4.9.

**Checks.**

- For Ξ = S², R(ℝ) = ∅, μ = id works with one circle.
- For Ξ a torus with R(ℝ) = ∅ (so cl_R(R) = 0 on Ξ), take loops a, b, c with c in the class a + b, pairwise meeting transversally once: the total class a + b + (a + b) is 0. Blowing up the three double points gives Ξ′ = T² # 3ℝℙ², on which the strict transforms are disjoint circles of total class μ*(a + b + c) + 2(e₁ + e₂ + e₃) = 0, and together with the exceptional circles e₁, e₂, e₃ they generate H¹(Ξ′, 𝔽₂) ≅ 𝔽₂⁵. Two loops a, b meeting once would not do: their class a + b ≠ 0 violates (ii), before and after the blow-up.
- Without blowing up, an immersed family with a double point does not give an embedding, so Assumption 6.1 can fail on S itself.
- The real locus of an exceptional curve is a circle whose Borel–Haefliger class is its Poincaré dual in H¹(Ξ′).
- If H¹(Ξ) = 0 and R(ℝ) = ∅ no blow-up is needed.

*Needs:* §6.2; AlgebraicTopologyPartII §12.2; StableReduction Layer 4; MotivesAndAlgebraicCycles §7.6b.

### 6.5 Algebraic approximation of a hypersurface

X compact nonsingular affine (a smooth projective real variety's real locus is affine in this sense); algebraic homology class.

Let X be a compact nonsingular affine real algebraic variety of dimension d and Y ⊂ X a compact C^∞ hypersurface. If the homology class [Y] ∈ `H_{d−1}(X, ℤ/2)` is algebraic (lies in `H^alg_{d−1}`), then there is a diffeotopy F of X, with F₁ arbitrarily close to the identity, such that F₁(Y) is a nonsingular algebraic hypersurface of X. For a smooth projective real surface and Y = ι(𝒮) with class cl_R(R), this gives an algebraic curve H ⊂ S smooth along S(ℝ) with H(ℝ) = ι′(𝒮), ι′ close to ι. (BCR, Theorem 12.4.11, p. 318; B19, Lemma 6.4 proof, p. 92)

A proof can proceed as follows.

1. Cited: BCR, Theorem 12.4.11, via algebraic line bundles realising the class (BCR Theorem 12.4.6) and transversality.

**Checks.**

- On ℝℙ², every embedded circle is isotopic to the real locus of a smooth real algebraic curve.

*Needs:* MotivesAndAlgebraicCycles §7.6b.

### 6.6 Bröcker's real divisors and prescribed signs

Applied to D = H − R, the signed divisor (simple zero along H, simple pole along R).

On a smooth projective real surface S: (b) if D is a divisor whose Borel–Haefliger class cl_R(D) ∈ H¹(S(ℝ), 𝔽₂) vanishes, there is h ∈ ℝ(S)ˣ whose divisor agrees with D along S(ℝ) (it has the prescribed orders along the components of D meeting S(ℝ) and no other zeros or poles meeting S(ℝ)); (a) for any locally constant sign function on a union of components of S(ℝ) there is h ∈ ℝ(S)ˣ, invertible along S(ℝ), with those signs. (BRO80, Satz a), b); B19, Lemma 6.4 proof, p. 92)

A proof can proceed as follows.

1. Cited: BRO80, Satz a), b).

**Checks.**

- On ℝℙ², a divisor of even degree has trivial Borel–Haefliger class and is the real divisor of a rational function.

*Needs:* MotivesAndAlgebraicCycles §7.6b; §6.5.

### 6.7 A branch section with prescribed real locus and sign

Bröcker is applied to the signed divisor H − R; the printed choice (simple zero along R) leaves an extra factor 2R (source correction E20).

Fix on S a very ample line bundle A and a line bundle N, an embedding ι : 𝒮 → Ξ satisfying Assumption 6.1, and a neighbourhood 𝒰 of ι in C^∞(𝒮, Ξ); let r be the equation of R (§3.1). Branch sections with a prescribed real zero set and sign exist in all large even twists: there is l₀, depending on these data, such that for each even l ≥ l₀ some embedding ι′ ∈ 𝒰 and some section t of A^l ⊗ N²(−R) have three properties. (1) The real points of the curve {t = 0} form exactly the set ι′(𝒮). (2) That curve is smooth at each of these real points. (3) At every real point of S outside Ξ, the product rt, a section of the square of `A^{l/2}` ⊗ N, is negative in the sense of §6.1. (B19, Lemma 6.4 and proof, p. 92)

A construction can proceed as follows.

1. §6.5 gives ι′ ∈ 𝒰 and H smooth along S(ℝ) with H(ℝ) = ι′(𝒮); cl_R(H − R) = 0 by Assumption 6.1 (ii).
2. §6.6 (b) gives h₁ with a simple pole along R, a simple zero along H and no other real zeros or poles; (a) gives h₂ invertible along S(ℝ) with the sign of h₁ on S(ℝ) ∖ Ξ.
3. Let D′ be the remaining polar divisor of h₁h₂ (disjoint from S(ℝ)); it depends only on the choices of steps 1–2. By AlgebraicModuliForArithmeticGeometry §1.4 there is l₀ such that `A^{l/2}` ⊗ N(−R − D′) is very ample for every even l ≥ l₀; for such l take a basis (u_i) of its sections viewed in `A^{l/2}` ⊗ N(−R) vanishing on D′, and u = Σ u_i² ∈ H⁰(A^l ⊗ N²(−2R)).
4. t = −h₁h₂ r u is regular, its real zero locus is H(ℝ) (the R-orders cancel: −1 from h₁, +1 from r), and rt = −h₁h₂ r² u is negative off Ξ (§6.1).

The construction has the following API.

- (ι′, t) for every even l ≥ l₀, with l₀ depending on A, N, ι and 𝒰.
- {t = 0}(ℝ) = ι′(𝒮), smooth along it.
- rt is negative on S(ℝ) ∖ Ξ.
- ι′ ∈ 𝒰.

**Checks.**

- If Ξ = S(ℝ), any t with the real locus condition works.
- ord_R(t) = ord_R(h₁) + ord_R(r) = −1 + 1 = 0 along every component of R.
- With h₁ vanishing to order one along R, t = −h₁h₂ru vanishes to order 2 along R and is not a section of A^l ⊗ N²(−R) with real locus ι′(𝒮).
- u is positive on S(ℝ) as a sum of squares of sections without common real zero (§6.1).

*Needs:* §6.5; §6.6; §6.2; §6.1; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`).

### 6.8 The branch conditions imply the cover hypotheses

Ψ = S(ℝ) ∖ Ξ, the open and closed set to avoid (the published proof says Θ; see source correction E22).

Let s ∈ H⁰(S, L²(R)) have smooth zero locus D with rs negative on S(ℝ) ∖ Ξ, let p : T → S be the double cover of §3.2 ramified over R ∪ D, and suppose the inclusion ι : 𝒮 = D(ℝ) → Ξ satisfies Assumption 6.1. Then p satisfies Assumption 4.1 with Ψ = S(ℝ) ∖ Ξ. (B19, Lemma 6.5 and proof, p. 92)

A proof can proceed as follows.

1. (i): the equation rv² = sw² has real solutions over x only if rs(x) ≥ 0, so p(T(ℝ)) ⊂ Ξ.
2. (ii): D lifts to T, so ι lifts to T(ℝ) and the classes of components of ι(𝒮) are pushforwards; Assumption 6.1 (iii) concludes.
3. (iii): for each component Σ of Ξ, p(p⁻¹Σ) = Σ₊ ∪ (Σ ∩ Δ(ℝ)) is connected by Assumption 6.1 (iv), and fibres over Δ(ℝ) are connected; if p⁻¹Σ were disconnected two components would have overlapping images and would meet over a boundary point of Δ(ℝ), a contradiction. Connected preimages give injectivity of p_* on H².

**Checks.**

- If Ξ = S(ℝ), Ψ = ∅ and (i) is empty.

*Needs:* §6.2; §6.1; §5.1; §3.2.

### 6.9 Green's infinitesimal criterion over ℝ

H a G-stable sub-local system whose complexification is compatible with the Hodge filtration; ℝ(1) carries conjugation by −1. Such Λ exists for every b ∈ B(ℝ): intersect a contractible neighbourhood with its conjugate, remove a closed subset of its real points and keep the component of b.

Let π : 𝒯 → B be a smooth projective family of surfaces over ℝ, H ⊂ H²_ℚ a G-stable sub-variation of the variation of §2.2, b ∈ B(ℝ), and Λ ⊂ B(ℂ) a G-stable connected open neighbourhood of b over which H is trivialised, with Λ(ℝ) connected and contractible. If some λ ∈ `H^{1,1}_{ℝ,b}(1)^G` ∩ H_b has ∇(λ) : `T_{B(ℂ),b}` → `H^{0,2}_b` surjective onto the (0,2)-part of H_b, then there is a nonempty open cone Ω ⊂ `H_{ℝ,b}(1)^G` such that every ω ∈ Ω is, under the trivialisation, of type (1,1) at some b′ ∈ Λ(ℝ). (BEN18, Proposition 1.1 and §1.2, pp. 3–4; BEN18, Proposition 1.3, p. 5; B19, Proof of Proposition 6.6, p. 94)

A proof can proceed as follows.

1. Trivialise H over Λ; the map φ from the real (1,1)-bundle `H^{1,1}_ℝ|_Λ` to `H_{ℝ,b}`, inclusion followed by the trivialisation, is G-equivariant and, by surjectivity of ∇(λ), a submersion at (b, λ) (as in the proof of BEN18 Proposition 1.1).
2. Tensor with ℝ(1) and take G-invariants: the fixed locus of a smooth involution is a submanifold whose tangent space is the invariants, so φ′ : `H^{1,1}_ℝ(1)^G|_{Λ(ℝ)}` → `H_{ℝ,b}(1)^G` is still a submersion at (b, λ).
3. The image of φ′ contains a nonempty open set and is stable under positive scalars, so it contains a nonempty open cone Ω.

**Checks.**

- If the (0,2)-part of H_b vanishes, every class of `H_{ℝ,b}(1)^G` is of type (1,1) at b itself and Ω may be the whole space.
- For the universal family of quartic surfaces at a quartic whose real locus is ten spheres, `H^{1,1}_ℝ(1)^G` has rank one, spanned by the hyperplane class, which stays (1,1) on every fibre; the hypothesis fails there (BEN18 Remark 1.5).
- In the vanishing variation of the double-cover family the hypothesis is supplied by λ_van, the H²_van-component of the class λ of the lifted curve C (§6.10), not by λ itself, whose pushforward l·cl(A) to S is nonzero.

*Needs:* §2.2; ShimuraData §3.1 (`Variation`).

### 6.10 The vanishing variation of the double-cover family

S connected smooth projective; p of degree 2 so p_*p* = 2 and the pullback is injective rationally. The variation and its real structure are those of §2.2, on the carrier ShimuraData §3.1 (`Variation`).

For the real family π : 𝒯 → B of §3.2, the G-equivariant local system R²π_*ℚ on B(ℂ) splits orthogonally for the cup product as p*H²(S(ℂ), ℚ) ⊕ `H²_{ℚ,van}`; both are sub-variations of Hodge structure, the first constant. Let λ be the class of the lifted curve C ⊂ T_s (§4.2) and λ_van = λ − ½·p*p_*λ ∈ H²(T_s(ℂ), ℚ(1)). Then p_*λ_van = 0, so λ_van lies in `H²_{ℚ,van}`; λ_van is of type (1,1) and lies in `H^{1,1}_ℝ(1)^G`; and ∇(λ_van) = ∇λ. If dim coker φ_λ ≤ h²(S, O_S) (§4.8), then ∇(λ_van) = ∇λ : `T_{B(ℂ),s}` → H²(T, O_T)_van is surjective. (B19, Proof of Proposition 6.6, p. 94)

A construction can proceed as follows.

1. p* : H²(S, ℚ) → H²(T_b, ℚ) is injective with p_*p* = 2; its image is a constant sub-local system on which the cup pairing is nondegenerate (projection formula), so its orthogonal complement is a sub-variation (the orthogonal complement, for the polarising cup pairing, of a sub-variation on which that pairing is nondegenerate is again a sub-variation).
2. Flat sections of a constant sub-variation have zero Gauss–Manin derivative; Griffiths' formula (§2.2) identifies ∇λ with φ_λ.
3. The codimension bound and H²(T, O_T) = H²(S, O_S) ⊕ H²(T, O_T)_van give surjectivity onto the vanishing part, since the image of ∇λ has zero component in the constant summand.
4. λ_van: p_*p* = 2 gives p_*λ_van = p_*λ − p_*λ = 0; λ and p_*λ = cl(C_S), C_S = p(C) ∈ |A^l|, are real G-invariant classes of type (1,1) (§2.2), hence so is p*p_*λ and so is λ_van; p*p_*λ is a flat section of the constant summand, whose Gauss–Manin derivative vanishes (step 2), so ∇(λ_van) = ∇λ.

The construction has the following API.

- `H²_{ℚ,van}` ⊂ R²π_*ℚ, the orthogonal of p*H²(S, ℚ).
- It is a sub-variation of Hodge structure stable under the real action.
- R²π_*ℚ = p*H²(S, ℚ) ⊕ `H²_{ℚ,van}`, orthogonally.
- λ_van = λ − ½·p*p_*λ lies in `H^{1,1}_ℝ(1)^G` ∩ `H²_{ℚ,van}` and ∇(λ_van) = ∇λ.
- ∇(λ_van) : `T_{B(ℂ),s}` → H²(T, O_T)_van is onto under the codimension bound.

**Checks.**

- rank `H²_{ℚ,van}` = b₂(T) − b₂(S).
- The summand p*H²(S, ℚ) is a constant variation with zero Gauss–Manin derivative.
- The rational splitting is not an integral one: the integral vanishing classes H²(T, ℤ) ∩ `H²_{ℚ,van}` are the inverse image of a rational subspace, hence saturated, and split off H²(T, ℤ) abstractly, but p*H²(S, ℤ) need not be a complement. For the quotient p : ℙ¹ × ℙ¹ → Sym²ℙ¹ = ℙ² branched along the diagonal conic, H² = ℤ², p*h = (1, 1) and p_*(a, b) = a + b, so the vanishing lattice is ℤ(1, −1); it is complemented by ℤ(0, 1), with det((1, −1), (0, 1)) = 1, while ℤ(1, 1) ⊕ ℤ(1, −1) has det((1, 1), (1, −1)) = −2, index 2.
- The vanishing part is the kernel of p_* : R²π_*ℚ → H²(S, ℚ).
- If h²(S, O_S) = 0 the vanishing part carries all of H²(T, O_T).
- For S = ℙ²_ℝ, A = O(1) and l = 2, C maps isomorphically to a conic, p_*λ = 2h and λ_van = λ − p*h, so p_*λ_van = 2h − p_*p*h = 2h − 2h = 0; λ itself, with p_*λ = 2h ≠ 0, is not in the vanishing part.

*Needs:* §4.8; §2.2; ShimuraData §3.1 (`Variation`).

### 6.11 The double-cover family is a stratified family of pairs

Λ ⊂ B(ℝ) consists of real parameters, so σ acts on every fibre; transversality of D_x to R and its disjointness from Sing R are open conditions, so they persist over a small Λ. These are the hypotheses of AlgebraicTopologyPartII §16.2 other than the invariant control data, whose existence for such a family is asked of that roadmap (gap:at2-stratified-pair-transport).

In §3.2 let s ∈ B(ℝ) and Λ ⊂ B(ℝ) a contractible open neighbourhood of s over which R ∩ D_x is finite étale. Put M = π⁻¹(Λ) ⊂ 𝒯(ℂ), with complex conjugation σ and f = π|_M : M → Λ. Then P = p⁻¹(R)(ℂ) ∩ M is a union of strata of a Whitney stratification of M whose strata, each σ-invariant, are: the exceptional curves over the points of Sing R, minus their points on the strict transform R̃; the ℙ¹ fibres over the points of R ∩ D_x, minus their points on R̃; the strict transform R̃ of R, the same curve {r = w = 0} for every x, minus its points on the previous curves; those finitely many points; and the open stratum M ∖ P. The map f is proper and its restriction to every stratum is a submersion onto Λ. (B19, §3.1, pp. 76–77; B19, Proof of Proposition 6.6, pp. 94–95)

A proof can proceed as follows.

1. p⁻¹(R) is the union of R̃, the exceptional curves over Sing R and the ℙ¹ fibres over R ∩ D_x: over a smooth point of R off D_x the fibre equation sw² = 0 has the single solution w = 0, and {r = w = 0} lies on every T̄_x.
2. The strata are submanifolds submersive over Λ: the exceptional curves are conics in fixed exceptional planes varying smoothly with x, the points of R ∩ D_x form a finite étale family over Λ, and R̃ is constant.
3. Locally analytically the family of pairs is a product: near a point over R ∩ D_x, coordinates (s_x, u) with r = s_x u² trivialise T̄_x and p⁻¹(R) = {s_x u = 0} uniformly in x; near the exceptional curves the minimal resolution of xy = s_x u² is likewise uniform (§3.3). Products of the fibre stratification by a normal crossings curve with Λ satisfy Whitney's conditions.
4. π is proper, so f is proper; σ preserves R, Sing R and D_x for real x, hence every stratum.

**Checks.**

- If R = ∅, P = ∅ and the statement is the properness and submersivity of f, the input of ordinary equivariant Ehresmann.
- If R is smooth and R ∩ D_x = ∅, P = R̃ × Λ is a single stratum.
- An Ehresmann trivialisation of M chosen without regard to P need not map p_s⁻¹(R) onto p_x⁻¹(R), so these strata are needed to compare the restrictions to `T_{x,U}` (§6.12).

*Needs:* §3.2; §3.3.

### 6.12 Transport of the chosen Kummer lift along the family

The pair (T, p⁻¹R) is transported by AlgebraicTopologyPartII §16.2; its stratification, properness and submersion hypotheses for this family are §6.11. The normalisation and the pair transport complete the source's proof of Proposition 6.6 (source correction E19).

Before deforming the fibre T_s in Proposition 6.6, normalise the integral lift β of the pulled-back class so that `(β mod 2)|_{T_{s,U}} = p_s*α̃` (subtract cl(φ̄) for φ̄ ∈ Pic(T_s) extending the difference on `T_{s,U}`), and reapply §5.8 to the normalised lift. Over a small G-stable contractible real parameter neighbourhood Λ(ℝ), transport the pair (T, p⁻¹R) equivariantly so that the restriction to T_U and the pullback of the fixed class α̃ correspond on every fibre: `(β_x mod 2)|_{T_{x,U}} = p_x*α̃` for x ∈ Λ(ℝ). (B19, Proof of Proposition 6.6, pp. 94–95, citing DIM85, Lemma 4; B19, Proposition 1.2 proof, p. 71)

A construction can proceed as follows.

1. The difference of β mod 2 and p_s*α̃ on `T_{s,U}` is the class of a line bundle there (Kummer sequence on `T_{s,U}`); extend it to T_s and subtract.
2. Equivariant Ehresmann (AlgebraicTopologyPartII §16.1) trivialises 𝒯(ℂ) over Λ(ℝ); to keep track of T_U, transport the pair (T, p⁻¹R) by AlgebraicTopologyPartII §16.2, whose hypotheses hold by §6.11.
3. The class p*α̃ is the restriction of a class on the total space over Λ(ℝ) pulled back from U(ℂ), so its transport is the fibrewise pullback; hence the normalisation persists.

The construction has the following API.

- β with `(β mod 2)|_{T_U} = p*α̃`.
- The normalisation equation on T_U.
- The transported class on T_x for x ∈ Λ(ℝ).
- The transported lift β_x satisfies `(β_x mod 2)|_{T_{x,U}} = p_x*α̃`, using §6.11.
- Transport commutes with p_* and with the constant summand.

**Checks.**

- For α = 0 and α̃ = 0, β = 0 is normalised and transports to 0.
- If R = ∅, pair transport reduces to ordinary equivariant Ehresmann transport on T, but the normalisation must still be imposed: for the double cover p : ℙ¹ × ℙ¹ → ℙ² branched along a conic (R = ∅) and α = α̃ = 0, β = cl(O(1, 0)) lifts p*α = 0, yet β mod 2 = κ(O(1, 0)) = (1, 0) ≠ 0 = p*α̃, and the normalisation subtracts cl(O(1, 0)).
- A trivialisation of 𝒯(ℂ) that does not preserve p⁻¹R does not identify the restrictions to T_U, so it does not certify `(β_x mod 2)|_{T_{x,U}} = p_x*α̃`.
- On the constant summand p*H²(S) transport is the identity.

*Needs:* §5.8; AlgebraicTopologyPartII §16.1; AlgebraicTopologyPartII §16.2 (gap:at2-stratified-pair-transport); §6.11; §3.2; §1.2.

### 6.13 Degree-two splitting with real-point avoidance

The source's Proposition 6.6 in its stated generality: the evaluation of a may vary on Ψ. The boundary class c_Ψ of §§5.4–5.5 vanishes once the auxiliary bundle of §4.9 is chosen to be a square (source correction E3), so the criteria of §§5.5 and 5.8 hold for the cover constructed here.

Let S be a connected smooth projective surface over ℝ, a ∈ Br(ℝ(S)) of period 2, U its unramified locus, Θ = Θ(a), and S(ℝ) = Ξ ⊔ Ψ a decomposition into open and closed subsets with Θ ⊂ Ψ ⊂ U(ℝ). Suppose a has a Kummer lift ã ∈ H²_G(U(ℂ), 𝔽₂) with [ã]₁|_Ψ = 0; no condition is put on the evaluation of a on Ψ, which is nonzero on Θ and zero on Ψ ∖ Θ. Then there are a connected smooth projective surface T over ℝ and a morphism p : T → S of degree 2 with p(T(ℝ)) ⊂ Ξ and `a_{ℝ(T)}` = 0. (B19, Proposition 6.6 and proof, pp. 93–95; BW20, Proposition 2.8)

A proof can proceed as follows.

1. Replace S by a modification S′ → S that is an isomorphism over U and makes S′ ∖ U an SNC divisor: principalization of the ideal of S ∖ U (ResolutionOfSingularitiesCharacteristicZero §5.1) gives a composite of blow-ups S′ → S, an isomorphism over U, with S′ ∖ U an SNC divisor; the ramification divisor of a on S′ is a union of its components, hence SNC, and Ψ stays open and closed in S′(ℝ) since it is compact and open in U(ℝ); then blow up general points off R to obtain N with Assumption 5.2 (§4.9), taking A₀ to be the square of an ample bundle so that cl_R(N) = 0, and an embedding ι satisfying Assumption 6.1 (§6.4); modifications off U do not change the hypotheses, and N stays a pullback with cl_R(N) = 0.
2. Choose A very ample, L = A^l ⊗ N(−R) with l large even so that Assumptions 3.1, 5.1 and §6.7 hold; get t with rt negative on Ψ and real locus ι(𝒮). Then M = L(R) = A^l ⊗ N has cl_R(M) = l·cl_R(A) + cl_R(N) = 0.
3. Take s = a₁s₀ + a₂c (§4.2) with a₁ > 0 small and a₂ near t; then rs < 0 on Ψ, D(ℝ) = ι(𝒮) after moving ι (§6.3), and p satisfies Assumption 4.1 (§6.8).
4. Since cl_R(M) = 0, the class c_Ψ = ([ã]₀ ∪ cl_R(M))|_Ψ of §5.5 vanishes, so the criteria of §5.5 and §5.8 hold with φ_Ψ = O_S, whatever the evaluation on Ψ. §5.2, §5.5 and §5.8 give a_T ∈ Br(T)[2], an integral lift β normalised as in §6.12, and γ, θ with p_*(β − 2γ) = cl(θ).
5. Split β − 2γ = (ε₁, ε₂) along p*H²(S) ⊕ H²_van (§6.10). Let H²_G(T(ℂ), ℤ(1))_van be the subgroup of equivariant classes whose component in p*H²(S(ℂ), ℝ(1))^G vanishes. The image of H²_G(T(ℂ), ℤ(1)) in Γ_T = H²(T(ℂ), ℤ(1))^G has finite index m (AlgebraicTopologyPartII §16.3); for y ∈ Γ_T in the rational subspace V = ker(p_*) ⊗ ℝ the class my lies in the image of the subgroup _van, so that subgroup maps onto a full lattice of H²(T(ℂ), ℝ(1))^G_van. Apply §6.9 to H = H²_van, on a G-stable neighbourhood Λ of s as in §§6.9 and 6.12, with the class λ_van = λ − ½·p*p_*λ, λ the class of C: by §6.10 it lies in `H^{1,1}_ℝ(1)^G` ∩ H²_van and ∇(λ_van) = ∇λ is onto H²(T, O_T)_van. The resulting open cone meets ε₂ + 2·(this lattice) (§2.6): choose δ ∈ H²_G(T(ℂ), ℤ(1))_van and ν in the cone with ε₂ = 2δ + ν.
6. For some x ∈ Λ(ℝ), ν is of type (1,1) on T_x. Since δ has no constant component, the real class of β − 2γ − 2δ is ε₁ + ν, and ε₁ = ½·p*p_*(β − 2γ) = ½·p*cl(θ) is of type (1,1); so β − 2γ − 2δ is an integral equivariant class of type (1,1) and the real Lefschetz (1,1) theorem (MotivesAndAlgebraicCycles §7.8) writes it as cl(φ) on T_x.
7. By the transported normalisation, a vanishes on `T_{x,U}` in the Kummer sequence, hence in Br(ℝ(T_x)); replace T by T_x. p(T_x(ℝ)) ⊂ Ξ for x near s.

**Checks.**

- If S(ℝ) = ∅ (Theorem 0.3 setting), Ψ = Ξ = ∅ and the conclusion is a degree-2 splitting cover of S.
- For a = (n/2)α with 4 | n and Ψ = Θ(α), the evaluation of a is 0 on all of Ψ; for n ≡ 2 mod 4 it is nonzero on all of Ψ (§7.1). A Ψ = Θ ⊔ Ψ′ with a = 0 on Ψ′ ≠ ∅ and Θ ≠ ∅ is also allowed: with cl_R(M) = 0 the boundary component [ζ]₁ = [ã]₀ ∪ cl_R(M) vanishes on both parts, whereas with M = A^l ⊗ N for an N with cl_R(N) ≠ 0 on Ψ′ the source's correction would leave `cl_R(N)|_{Ψ′}` behind.
- Lattice step: if δ were allowed to have a nonzero constant component, the constant component of β − 2γ − 2δ would be ε₁ − p*p_*δ, and p_*δ need not be of type (1,1); with δ in the subgroup _van the constant component stays ε₁ and p_*(β − 2γ − 2δ) is still cl(θ) in real cohomology.
- Green step: the class λ of C is not in H²_van, since p_*λ = l·cl(A) ≠ 0 (for a conic on ℙ², 2h); its component λ_van = λ − ½·p*p_*λ has p_*λ_van = 2h − 2h = 0 and the same derivative, which is what §6.9 needs.

*Needs:* §5.2; §5.5; §5.8; §4.9; §4.2; §4.8; §6.4; §6.3; §6.7; §6.8; §6.10; §6.12; ResolutionOfSingularitiesCharacteristicZero §5.1 (principalization); AlgebraicTopologyPartII §16.3; §6.9; §2.6; MotivesAndAlgebraicCycles §7.8; MotivesAndAlgebraicCycles §7.6b.

### Examples

On a torus component Ξ with R(ℝ) = ∅, take loops a, b and c, with c in the class a + b, meeting pairwise once; after blowing up the three double points the strict transforms are disjoint embedded circles on Ξ′ = T² # 3ℝℙ² with total class μ*(a + b + c) + 2(e₁ + e₂ + e₃) = 0, and H¹(Ξ′) ≅ 𝔽₂⁵ is generated by curve classes, so the conditions of §6.2 hold. The real Green criterion has content: at a quartic whose real locus is ten spheres the invariant (1,1) part has rank one, spanned by the hyperplane class, which stays of type (1,1) on every fibre. (B19 §6, pp. 90–95; BEN18 Remark 1.5.)

### Dependencies

Layer 1; Layer 2; Layer 3; Layer 4; Layer 5; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); AlgebraicTopology Stage 6; AlgebraicTopologyPartII §12.2; AlgebraicTopologyPartII §16.1; AlgebraicTopologyPartII §16.2 (gap:at2-stratified-pair-transport); AlgebraicTopologyPartII §16.3; Mathlib `TensorProduct`; MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8; ResolutionOfSingularitiesCharacteristicZero §5.1 (principalization); ShimuraData §3.1 (`Variation`); StableReduction Layer 4.

## Layer 7: period equals index: the main theorems and the u-invariant

Uniform evaluation of the half-period class; the induction step on the period and the sufficient condition for period equals index (the source's Proposition 6.7); Theorem 0.3; vanishing at real closures implies vanishing at real points; Theorem 0.4 and the sufficient half of Theorem 0.5; Theorem 0.12 (u ≤ 4 in transcendence degree 2 and u(ℝ(S)) = 4 with the corrected anisotropic witness); Theorem 0.10; the anticanonical model of degree-four del Pezzo surfaces and Theorem 0.13. The headline statements are stated in Lean in their field-theoretic form, recorded in each section.

### 7.1 Uniform evaluation of the half-period class

n even; Θ(α) a union of components of S(ℝ) inside U(ℝ).

Let α ∈ Br(ℝ(S)) have even period n, U = U_α, and Ψ = Θ(α), assumed to be a union of components of S(ℝ) contained in U(ℝ). The period-2 class a = (n/2)α evaluates at every x ∈ Ψ to (n/2 mod 2)·(−1,−1) and to 0 at every x ∈ U(ℝ) ∖ Ψ. Hence any Kummer lift of a restricted to U(ℂ) has [·]₀|_Ψ constant equal to t = n/2 mod 2: t = 1 if n ≡ 2 mod 4 and t = 0 if 4 | n; in the latter case Θ(a) = ∅ although Ψ need not be empty. (B19, Proof of Proposition 6.7, p. 95)

A proof can proceed as follows.

1. α_x ∈ Br(ℝ) ≅ ℤ/2 equals the nonzero element on Ψ and 0 off Ψ; multiplying by n/2 gives the stated values.
2. The degree-zero component of a Kummer lift is the evaluation (§1.4).

**Checks.**

- For n = 2, t = 1 and Θ(a) = Θ(α).
- For n = 4, t = 0.

*Needs:* §1.4; §1.1.

### 7.2 The induction step on the period

The setting of §7.1.

Let α ∈ Br(ℝ(S)) have even period n, with Θ(α) a union of components of S(ℝ) and a lift ξ ∈ H²_G(U_α(ℂ), 𝔽₂) of (n/2)α with `[ξ]₁|_{Θ(α)} = 0`. Then there is a degree-2 morphism p : T → S of connected smooth projective real surfaces with p(T(ℝ)) ∩ Θ(α) = ∅ such that `α_{ℝ(T)}` has period exactly n/2 and evaluates to 0 at every real point of its unramified locus. (B19, Proof of Proposition 6.7, p. 95; B19, Proposition 6.7 statement, p. 95)

A proof can proceed as follows.

1. a = (n/2)α has unramified locus U_a ⊃ U_α; lift a on U_a and compare with ξ on U_α: the difference is the reduction of a Picard class of U_α, which extends to U_a (§1.9); subtract it to get a lift ã on U_a restricting to ξ.
2. Ψ = Θ(α) is a union of components inside U_α(ℝ) ⊂ U_a(ℝ), and Θ(a) ⊂ Ψ by density of U_α and local constancy, a evaluating to 0 off Ψ (§7.1); §6.13 needs no more of the evaluation on Ψ.
3. §6.13 with Ξ = S(ℝ) ∖ Ψ gives p : T → S of degree 2 with `a_{ℝ(T)}` = 0 and p(T(ℝ)) ∩ Ψ = ∅.
4. Period: m = per(`α_{ℝ(T)}`) divides n/2 since (n/2)α_T = a_T = 0; corestriction (HeightsRationalPointsAndObstructions §2.19a) gives cor(α_T) = 2α, of period n/2, so n/2 divides m.
5. Evaluation: for y ∈ V(ℝ), V the unramified locus of α_T, either y ∈ p⁻¹(U)(ℝ), where α_T(y) = α(p(y)) = 0 as p(y) ∉ Θ, or y lies in a component of V(ℝ) meeting p⁻¹(U)(ℝ) densely; local constancy gives α_T(y) = 0.

**Checks.**

- For n = 2, `α_{ℝ(T)}` = 0.

*Needs:* §7.1; §6.13; §1.9; §1.4; HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`); §1.2.

### 7.3 Sufficient condition for period equals index

The odd case needs no lift condition; the half-period lift is imposed only for even n (source correction E8).

Let S be a connected smooth projective surface over ℝ and α ∈ Br(ℝ(S)) of period n, U = U_α, Θ = Θ(α), assumed to be a union of components of S(ℝ). If n is odd, ind(α) = n. If n is even and some lift ξ ∈ H²_G(U(ℂ), 𝔽₂) of (n/2)α has [ξ]₁|_Θ = 0, then ind(α) = n. (B19, Proposition 6.7 and proof, p. 95)

A proof can proceed as follows.

1. Odd n: §2.10.
2. Even n, by induction on n: §7.2 gives p : T → S of degree 2 with α_T of period n/2 evaluating to 0 at all real points of its unramified locus; then Θ(α_T) = ∅ and the lift condition holds trivially for α_T (zero first component on the empty set), so by induction (or by the odd case) ind(α_T) = n/2.
3. Reverse index divisibility: ind(α) divides 2·ind(α_T) = n (§0.12), and n = per(α) divides ind(α).

**Checks.**

- For α of period 2 with Θ = ∅ and any lift, ind(α) = 2.

*Needs:* §7.2; §2.10; §0.12.

### 7.4 Period equals index on real surfaces without real points

S connected smooth projective over ℝ, S(ℝ) = ∅.

Let S be a connected smooth projective surface over ℝ with S(ℝ) = ∅. Then ind(α) = per(α) for every α ∈ Br(ℝ(S)), ramified or not. Equivalently, in the form stated in Lean as `index_eq_orderOf_of_not_isSemireal`: if K is finitely generated of transcendence degree 2 over ℝ and −1 is a sum of squares in K, then every central simple K-algebra has index equal to the period of its class. (B19, Theorem 0.3, p. 64; §6.3, p. 95)

A proof can proceed as follows.

1. Θ = ∅ is a union of components of the empty S(ℝ), and the lift condition is empty; apply §7.3.
2. Field form: a smooth projective model S of K exists (ResolutionOfSingularitiesCharacteristicZero §7.8, field resolution) and S(ℝ) = ∅, because a real point x would give K ⊂ Frac ℝ[[z₁, z₂]] ⊂ ℝ((z₁))((z₂)), a field ordered by the sign of the leading coefficient, in which −1 is not a sum of squares.

**Checks.**

- For S the anisotropic quadric x² + y² + z² + w² = 0 in ℙ³_ℝ, every class of Br(ℝ(S)) has index equal to its period.
- K = ℝ(x, y, z | x² + y² + z² = −1) is a field of cohomological dimension 2 on which period equals index.
- Negative control: for the real field K = ℝ(x, y), Albert's class (x, x) + (y, xy) has period 2 and index 4 (§2.10), so the hypothesis that K is nonreal (S(ℝ) = ∅) cannot be dropped.

*Needs:* §7.3; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); Mathlib `IsSemireal`.

### 7.5 Vanishing at real closures implies vanishing at real points

α unramified on U.

Let U be a smooth real surface and α ∈ Br(U). If α vanishes at every real closure of ℝ(U), then α_x = 0 for every x ∈ U(ℝ). No restriction on the period of α is needed: Br(ℝ[[z₁, z₂]]) ≅ Br(ℝ) is of order 2 whatever the period. (B19, Proof of Theorem 0.12, p. 96)

A proof can proceed as follows.

1. At x ∈ U(ℝ) choose local parameters z₁, z₂; completion gives ℝ(U) ⊂ Frac ℝ[[z₁, z₂]] ⊂ ℝ((z₁))((z₂)), a field ordered by the sign of the leading coefficient. Let K be a real closure of ℝ((z₁))((z₂)) at this ordering (§0.3).
2. In Br(ℝ) → Br(ℝ[[z₁, z₂]]) → Br(K), the first map is an isomorphism with retraction given by restriction to x (henselian local rings, SchemeAndStackFoundations §2.22, `brauer_henselian_local`), and the composite is an isomorphism because both groups are generated by (−1, −1) (§0.3); hence Br(ℝ[[z₁, z₂]]) → Br(K) is injective.
3. K itself is not algebraic over ℝ(U). The relative algebraic closure R₀ of ℝ(U) in K is real closed (an element of K algebraic over R₀ lies in R₀, so square roots of positive elements and roots of odd-degree polynomials over R₀ stay in R₀) and algebraic over ℝ(U), hence a real closure of ℝ(U) at the ordering induced from K. By hypothesis `α_{R₀}` = 0, so α_K = 0; by injectivity the restriction of α to ℝ[[z₁, z₂]] vanishes, and α_x = 0.

**Checks.**

- For α = (−1, −1) pulled back to U, α does not vanish at real closures when U(ℝ) ≠ ∅, consistently: its images over R₀ and over K are both nonzero.

*Needs:* §0.3; §1.4; SchemeAndStackFoundations §2.22 (`brauer_henselian_local`); Mathlib `PowerSeries`; Mathlib `IsRealClosed`.

### 7.6 Period equals index for classes vanishing at real points

U connected smooth over ℝ, not necessarily proper and not assumed quasi-projective: the proof passes to a nonempty affine open, which is quasi-projective.

Let U be a connected smooth surface over ℝ and α ∈ Br(U) ⊂ Br(ℝ(U)) with α_x = 0 ∈ Br(ℝ) for every x ∈ U(ℝ). Then ind(α) = per(α). Birationally, in the form stated in Lean as `index_eq_orderOf_of_forall_isRealClosed`: if K is finitely generated of transcendence degree 2 over ℝ and A is a central simple K-algebra whose class becomes trivial over every real closed field R with a K-algebra structure, then the index of A equals the period of its class. (B19, Theorem 0.4, p. 64; §6.3, p. 95)

A proof can proceed as follows.

1. Replace U by a nonempty affine open U′ ⊂ U (affine opens form a basis, Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`). A presentation of its finitely generated coordinate ring embeds U′ as a closed subscheme of some 𝔸ⁿ_ℝ ⊂ ℙⁿ_ℝ, so U′ is quasi-projective; it is smooth, and integral because U, connected and smooth, is integral. Then ℝ(U′) = ℝ(U), α restricts to Br(U′), and α_x = 0 for x ∈ U′(ℝ) ⊂ U(ℝ); period and index depend only on the class of α in Br(ℝ(U)). Compactify U′ to a connected smooth projective S with ℝ(S) = ℝ(U) (ResolutionOfSingularitiesCharacteristicZero §6.2, SNC compactification); then U′ ⊂ U_α (§1.1).
2. Each nonempty component of S(ℝ) is a smooth surface, and the real points of S ∖ U′, a closed subset of dimension ≤ 1, have empty interior in it, so U′(ℝ) is dense in S(ℝ) and in its open subset U_α(ℝ); evaluation is locally constant on U_α(ℝ) (§1.4) and vanishes on U′(ℝ), hence Θ(α) = ∅.
3. Apply §7.3 with Θ = ∅, a union of (no) components, for which the lift condition is empty.
4. Birational form: take a smooth projective model S of K (field resolution) and U = U_α, the unramified locus of α (§1.1), which is a smooth open surface with α ∈ Br(U). By §7.5, α_x = 0 for every x ∈ U(ℝ); apply the first part. Conversely the scheme form follows from the birational form: if α survives at some ordering P of ℝ(U), the survival locus Z(α) is clopen (§0.5), so it contains a basic open set H(f_1) ∩ ⋯ ∩ H(f_r) around P; by §0.5a there is a point x ∈ U(ℝ) at which the f_i are regular and positive, each f_i, a unit of ℝ[[z₁, z₂]] with positive constant term, is positive at the ordering induced through ℝ((z₁))((z₂)) at x (as in §7.5), so that ordering lies in Z(α); and α_x ≠ 0, because α_x = 0 would make α vanish at it by the comparison Br(ℝ) ≅ Br(ℝ[[z₁, z₂]]) ↪ Br(K) of §7.5, steps 2–3.

**Checks.**

- For α = (−1, 1 + x²) on 𝔸², α_x = 0 everywhere and ind α = per α = 1 (α = 0).
- For U = ℙ²_ℝ, U′ = 𝔸²_ℝ and S = ℙ²_ℝ (the closure of the standard immersion, whose boundary z = 0 is already a smooth divisor), the complement of U′(ℝ) in ℝℙ² is a real projective line, with empty interior, so a class vanishing on U′(ℝ) has Θ(α) = ∅ on all of ℝℙ²: passing to the affine open loses nothing. Br(ℙ²_ℝ) = Br(ℝ), and the Hamilton class, nonzero at every point of 𝔸²(ℝ), is excluded on U′ as on U.
- For U = ℙ²_ℝ and U′ the complement of the conic x² + y² = z², U′(ℝ) is ℝℙ² minus a circle, a disc and a Möbius band, dense in ℝℙ²; an affine open cannot miss a whole component of S(ℝ), which is two-dimensional, whereas (S ∖ U′)(ℝ) has dimension at most 1.

*Needs:* §7.3; §1.4; §1.1; §7.5; §0.5; §0.5a; Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`; ResolutionOfSingularitiesCharacteristicZero §6.2 (SNC compactification); ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); Tau Ceti `TauCeti.BrauerGroup.baseChange`.

### 7.7 Unramified classes: the sufficient half of Theorem 0.5

α unramified on S, so U = S and Θ = Θ(α) is a union of components of S(ℝ).

Let S be a connected smooth projective surface over ℝ and α ∈ Br(S) of period n. If n is odd, or if some lift ξ ∈ H²_G(S(ℂ), 𝔽₂) of (n/2)α in the Kummer sequence 0 → Pic(S)/2 → H²_G(S(ℂ), 𝔽₂) → Br(S)[2] → 0 satisfies [ξ]₁|_Θ = 0, then ind(α) = per(α). (B19, Theorem 0.5, first statement, p. 64; §6.3, p. 95)

A proof can proceed as follows.

1. Apply §7.3 with U = S.

**Checks.**

- For S = ℙ²_ℝ and α the Hamilton class (n = 2, Θ = ℝℙ²), Pic(S)/2 = ℤ/2 and Br(S)[2] = ℤ/2, so H²_G(ℙ²(ℂ), 𝔽₂) has four elements, two over α: the pullback ξ₀ of the generator ω² of H²(G, 𝔽₂), with components (1, 0, 0) on ℝℙ², and ξ₀ + κ(O(1)), whose first component is cl_R(O(1)) = h, the generator of H¹(ℝℙ², 𝔽₂). Exactly one lift has [ξ]₁ = 0, so the condition is met although ℝℙ² is nonorientable, and ind(α) = per(α) = 2 (ℍ ⊗ ℝ(x, y) is a division algebra, ℝ(x, y) being real). The condition asks for some lift, not every lift: ξ₀ + κ(O(1)) fails it.
- In general, when cl_R : Pic(S) → H¹(S(ℝ), 𝔽₂) is onto, a Picard correction always produces such a lift: for any lift ξ choose a line bundle M with cl_R(M) = [ξ]₁; then ξ + κ(M) is a lift with [ξ + κ(M)]₁ = [ξ]₁ + cl_R(M) = 0.

*Needs:* §7.3; §1.4.

### 7.8 The Elman–Lam invariant in transcendence degree two

trdeg_ℝ K = 2.

Let K be a field extension of ℝ of transcendence degree 2, not necessarily finitely generated. Then u(K) ≤ 4 (Elman–Lam invariant). In Lean (`not_anisotropic_of_hasZeroTotalSignature`): every quadratic form over K on a vector space of dimension > 4 satisfying `HasZeroTotalSignature` is isotropic. (B19, Theorem 0.12, first assertion, p. 66; proof, pp. 95–96)

A proof can proceed as follows.

1. By §0.15 it suffices that every nonzero α ∈ Br(K)[2] vanishing at all real closures of K has index 2.
2. Choose a finitely generated K₀ ⊂ K containing a transcendence basis of K/ℝ and over which α is defined (so K/K₀ is algebraic; source correction E9), write K as the union of the finite extensions K_i of K₀, and α_i ∈ Br(K_i)[2]. The sets Z_i ⊂ `X_{K_i}` of orderings where α_i survives are closed (§0.5) with empty limit, so some Z_i is empty (§0.2): replace K by K_i (ind(α) divides ind(α_i) by §0.12, K/K_i being algebraic, possibly infinite, and α_i ≠ 0 because α ≠ 0).
3. Now K = ℝ(S) for an integral surface; let U be an open with α ∈ Br(U); α_x = 0 for x ∈ U(ℝ) (§7.5), so ind(α) = 2 by §7.6 (on the smooth locus).

**Checks.**

- u(ℝ(x, y)) ≤ 4; the general bounds of §0.14 give only u(ℝ(x, y)) ≤ 6.

*Needs:* §0.15; §0.12; §0.5; §0.2; §7.5; §7.6.

### 7.9 A four-dimensional anisotropic zero-signature form

x smooth with residue field ℂ (exists on any integral surface over ℝ); the replacement of w is the corrected choice (source correction E10).

Let S be an integral surface over ℝ and x a smooth closed point with κ(x) ≅ ℂ. Let w ∈ `O_{S,x}` lift √−1 and replace it by w′ = (w² − 1)/(2w), which again lifts √−1 and satisfies w′² + 1 = (w² + 1)²/(4w²) ∈ m_x². For any regular system of parameters z₁, z₂ at x, y_j = (1 + z_j)² + (w′ + z_j)² (j = 1, 2) is again a regular system of parameters, each y_j is a sum of two squares (hence positive at every ordering), and q = ⟨1, y₁, −y₂, −y₁y₂⟩ has zero total signature and is anisotropic over ℝ(S). (B19, Proof of Theorem 0.12, lower bound, p. 96)

A construction can proceed as follows.

1. dy_j = 2(1 + z_j)dz_j + 2(w′ + z_j)(dw′ + dz_j) ≡ 2(1 + i)dz_j modulo m_x and the differential of w′² + 1 ∈ m_x², so y₁, y₂ are regular parameters.
2. Completion gives ℝ(S) ⊂ ℂ((y₁))((y₂)) (κ(x) = ℂ); by §0.10 applied twice, q is anisotropic there, hence over ℝ(S) (anisotropy descends to subfields).
3. y_j is a sum of two squares, so y_j >_P 0 at every ordering and sign_P(q) = 1 + 1 − 1 − 1 = 0.

The construction has the following API.

- The form ⟨1, y₁, −y₂, −y₁y₂⟩ over ℝ(S) from (x, w, z₁, z₂).
- y₁, y₂ is a regular system of parameters at x.
- The form q is anisotropic over ℝ(S).
- The form q has zero signature at every ordering of ℝ(S).
- w′ = (w² − 1)/(2w) lifts √−1 and w′² + 1 ∈ m_x².

**Checks.**

- On 𝔸²_ℝ = Spec ℝ[u, v] at the closed point 𝔪 = (u² + 1, v), with residue field ℂ, w = u and i the class of u: w′ = (u² − 1)/(2u) and w′² + 1 = (u² + 1)²/(4u²) ∈ 𝔪², u being a unit at 𝔪. For the regular parameters z₁ = v, z₂ = −v − (1 − u)(u² + 1)/2 one gets y₁ ≡ 2(1 + i)v and y₂ ≡ −2(1 + i)v − 2(u² + 1) modulo 𝔪², using (1 + i)(1 − i) = 2; these are independent in 𝔪/𝔪² (determinant 4(1 + i) in the basis u² + 1, v), so y₁, y₂ are regular parameters.
- The form has dimension 4 and signature 0 at every ordering, so it witnesses u ≥ 4 and not more.
- With w itself the same parameters fail, although neither z₁ nor z₂ is proportional to w² + 1 = u² + 1 in 𝔪/𝔪²: y_j ≡ (w² + 1) + 2(1 + i)z_j modulo 𝔪², so y₁ ≡ (u² + 1) + 2(1 + i)v and y₂ ≡ −(u² + 1) − 2(1 + i)v = −y₁, and y₁ + y₂ ∈ 𝔪². In general, writing w² + 1 ≡ α₁z₁ + α₂z₂ in 𝔪/𝔪², the determinant of y₁, y₂ in the basis z₁, z₂ is 2(1 + i)(α₁ + α₂ + 2(1 + i)), so they are regular parameters exactly when α₁ + α₂ ≠ −2(1 + i); here α₁ = α₂ = −(1 + i). The source's two non-proportionality conditions exclude only the points (−2(1 + i), 0) and (0, −2(1 + i)) of that line (source correction E10), and they exclude unnecessarily z₁ = u² + 1, z₂ = v, for which y₁ ≡ (3 + 2i)z₁ and y₂ ≡ z₁ + 2(1 + i)z₂ are regular parameters.
- Anisotropy over ℂ((y₁))((y₂)) implies anisotropy over ℝ(S) by the contrapositive of `QuadraticForm.not_anisotropic_baseChange`.

*Needs:* §0.10; §0.4; Mathlib `QuadraticMap.Anisotropic`; Tau Ceti `QuadraticForm.not_anisotropic_baseChange`; Mathlib `IsLocalRing.maximalIdeal`; Mathlib `PowerSeries`.

### 7.10 The u-invariant of a real surface function field is four

S integral of dimension 2 over ℝ.

For every integral surface S over ℝ, u(ℝ(S)) = 4, including when S(ℝ) ≠ ∅. The lower bound is stated in Lean as `exists_anisotropic_hasZeroTotalSignature`: for K finitely generated of transcendence degree 2 over ℝ there is an anisotropic quadratic form on K⁴ satisfying `HasZeroTotalSignature`. (B19, Theorem 0.12, second assertion, p. 66; proof, p. 96)

A proof can proceed as follows.

1. u ≤ 4 by §7.8; u ≥ 4 by §7.9 and §0.6.

**Checks.**

- u(ℝ(x, y)) = 4.

*Needs:* §7.8; §7.9; §0.6.

### 7.11 Quadratic forms of rank five over surfaces without real points

K nonreal (no orderings), so its Elman–Lam invariant is the classical one; K need not be finitely generated over ℝ. For K = ℝ(S) with S an integral surface over ℝ and S(ℝ) = ∅, ℝ(S) is nonreal.

Let K be a field extension of ℝ of transcendence degree 2, not necessarily finitely generated, in which −1 is a sum of squares; for instance K = ℝ(S) for an integral surface S over ℝ with S(ℝ) = ∅, the case of B19's Theorem 0.10. Every quadratic form over K on a vector space of dimension ≥ 5 is isotropic (Lean: `not_anisotropic_of_not_isSemireal`). (B19, Theorem 0.10, p. 66, for K = ℝ(S), and §6.4, p. 95, for its deduction from Theorem 0.12, which holds for every field of transcendence degree 2 over ℝ; BCR, §4.1, Artin–Lang homomorphism theorem, pp. 85–87, through §0.5a)

A proof can proceed as follows.

1. K is nonreal, so it has no orderings (§0.1) and the zero-total-signature condition is empty (§0.6); §7.8, which asks only for transcendence degree 2, says that every quadratic form over K of dimension ≥ 5 is isotropic.
2. For K = ℝ(S) with S(ℝ) = ∅, K is nonreal: by the Artin–Lang theorem (§0.5a) the function field of an integral real variety is real iff the variety has a smooth real point, and S has no real points at all.

**Checks.**

- Over ℝ(x, y, z | x² + y² + z² = −1), ⟨1, 1, 1, 1, a⟩ is isotropic for every a.
- Finite generation is not used: an algebraic closure of ℝ(x, y) has transcendence degree 2 over ℝ, contains √−1 and is not finitely generated over ℝ, and every form of dimension ≥ 2 over it is isotropic, as §7.8 gives for every nonreal field of transcendence degree 2.
- Nonreality cannot be dropped: over ℝ(x, y) the form ⟨1, 1, 1, 1, 1⟩ is anisotropic, being positive at every ordering.
- Transcendence degree 2 cannot be raised: over the nonreal field ℂ(x, y, z) the eight-dimensional form ⟨1, x⟩ ⊗ ⟨1, y⟩ ⊗ ⟨1, z⟩ is anisotropic, by Springer's theorem (§0.10) applied three times in ℂ((x))((y))((z)).

*Needs:* §7.8; §0.6; §0.1; §0.5a.

### 7.12 Degree-four del Pezzo surfaces are intersections of two quadrics

F any field; del Pezzo surfaces and their degree as in VA13 Definition 1.5.

Let X be a del Pezzo surface of degree 4 over a field F (a smooth projective geometrically integral surface with ample anticanonical sheaf and K_X² = 4). The anticanonical linear system embeds X in ℙ⁴_F, and its image is a smooth complete intersection of two quadrics defined over F. (VA13, Definition 1.5, p. 4; anticanonical dimension formula, p. 9; Remark 1.11, p. 10)

A proof can proceed as follows.

1. h⁰(X, −mK_X) = 1 + m(m + 1)d/2 for a del Pezzo surface of degree d (VA13 p. 9); with d = 4 this gives h⁰(−K_X) = 5 and h⁰(−2K_X) = 13.
2. For d ≥ 3 the anticanonical system is very ample and embeds X as a smooth surface of degree d in ℙ^d (VA13 Remark 1.11), not contained in a hyperplane.
3. Restriction H⁰(ℙ⁴, O(2)) → H⁰(X, −2K_X) goes from a 15-dimensional space to a 13-dimensional one, so its kernel, defined over F, contains two independent quadrics Q₁, Q₂. Each Q_i is irreducible, since X is irreducible and lies in no hyperplane, so Q₁ ∩ Q₂ is a complete intersection of pure dimension 2 and degree 4 containing X, which also has degree 4; it is therefore generically reduced along X and equal to X, a complete intersection having no embedded components.

**Checks.**

- Over ℂ, the surface {x₀² + ⋯ + x₄² = a₀x₀² + ⋯ + a₄x₄² = 0} with distinct a_i is a degree-four del Pezzo surface.
- The count fails in degree 3: for a cubic surface h⁰(−2K) = 10 = h⁰(ℙ³, O(2)), and the surface lies on no quadric.
- A complete intersection of two quadrics in ℙ⁴ with a singular point is not a del Pezzo surface; smoothness is part of the conclusion, inherited from X.

*Needs:* SchemeAndStackFoundations §2.6 (`projectiveSpace_cohomology`); SchemeAndStackFoundations §5.10.

### 7.13 Degree-four del Pezzo surfaces over real curves without real points

A degree-4 del Pezzo surface over a field F is a smooth complete intersection of two quadrics in ℙ⁴_F by §7.12. K nonreal of transcendence degree 1 over ℝ, not necessarily finitely generated.

Let K be a field extension of ℝ of transcendence degree 1, not necessarily finitely generated, in which −1 is a sum of squares; for instance K = ℝ(C) for an integral curve C over ℝ with C(ℝ) = ∅, which is nonreal by §0.5a. Any two quadratic forms q₁, q₂ on a K-vector space of dimension ≥ 5 have a common nonzero zero (Lean: `exists_common_zero_of_not_isSemireal`). Consequently every del Pezzo surface of degree 4 over K has a K-rational point; for K = ℝ(C) with C(ℝ) = ∅ this is B19's Theorem 0.13. (B19, Theorem 0.13 and its deduction from Theorem 0.10 by Amer–Brumer, §0.5, p. 66)

A proof can proceed as follows.

1. Write the surface as {q₁ = q₂ = 0} ⊂ ℙ⁴ over K (§7.12).
2. The rational function field K(t) has transcendence degree 2 over ℝ and is nonreal, an expression of −1 as a sum of squares in K remaining one in K(t) (for K = ℝ(C), K(t) = ℝ(C × ℙ¹)); so q₁ + tq₂ is isotropic over K(t) by §7.11.
3. Amer–Brumer (§0.11) gives a common nonzero zero of q₁, q₂ over K; on the model of step 1 it is a K-rational point.

**Checks.**

- When C is the anisotropic conic, this is equivalent to the real integral Hodge conjecture for 1-cycles on degree-4 del Pezzo fibrations over C (BW20II, Proposition 8.3).
- Finite generation is not used: over an algebraic closure of ℝ(x), two quadratic forms in N ≥ 3 variables always have a common nonzero zero, since two quadrics in a projective space of dimension N − 1 ≥ 2 over an algebraically closed field meet.
- Nonreality cannot be dropped: over ℝ(x), q₁ = ⟨1, 1, 1, 1, 1⟩ has no nonzero zero, so it shares none with any q₂.
- Transcendence degree 1 cannot be raised: over the nonreal field ℂ(x, y), q₁ = ⟨1, x, y, xy, 0⟩ and q₂ = ⟨0, 0, 0, 0, 1⟩ on ℂ(x, y)⁵ have no common nonzero zero, since q₂ = 0 forces the last coordinate to vanish and ⟨1, x, y, xy⟩ is anisotropic (Springer's theorem, §0.10, applied twice).

*Needs:* §7.11; §0.11; §7.12; §0.5a.

### Examples

For n = 2 the half-period class is α itself and t = 1 on Θ(α); for n = 4 the half-period class 2α has t = 0 (§7.1). The form ⟨1, y₁, −y₂, −y₁y₂⟩ of §7.9, with y₁, y₂ sums of two squares, has signature 1 + 1 − 1 − 1 = 0 at every ordering and is anisotropic over ℝ(x, y), so u(ℝ(x, y)) = 4. The field ℝ(x, y, z | x² + y² + z² = −1) is nonreal, so every five-dimensional form over it, for instance ⟨1, 1, 1, 1, a⟩, is isotropic, and every central simple algebra over it has index equal to its period. (B19 §§6.3–6.4, pp. 95–96.)

### Dependencies

Layer 0; Layer 1; Layer 2; Layer 6; HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`); Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`; Mathlib `IsLocalRing.maximalIdeal`; Mathlib `IsRealClosed`; Mathlib `IsSemireal`; Mathlib `PowerSeries`; Mathlib `QuadraticMap.Anisotropic`; ResolutionOfSingularitiesCharacteristicZero §6.2 (SNC compactification); ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); SchemeAndStackFoundations §2.22 (`brauer_henselian_local`); SchemeAndStackFoundations §2.6 (`projectiveSpace_cohomology`); SchemeAndStackFoundations §5.10; Tau Ceti `QuadraticForm.not_anisotropic_baseChange`; Tau Ceti `TauCeti.BrauerGroup.baseChange`.

## Layer 8: covers of even degree and the case ind = 2 per

The finite-flat open U₀ and the restricted evaluation locus Θ₀; the alternating double cover of a generically finite cover and its branch multiplicities; the trace-quotient lift and the sign-corrected pullback lift; the circle double cover attached to the quotient class and its local monodromy correction; the correcting line bundle and algebraicity of the quotient component; the source's Proposition 7.1 (the obstruction to splitting by a cover of even degree) and the obstruction half of Theorem 0.5 (ind = 2 per).

### 8.1 The finite-flat open and the restricted evaluation locus

n even; p*α = 0 in Br(ℝ(T)).

Let p : T → S be a generically finite morphism of connected smooth projective real surfaces of even degree n, α ∈ Br(ℝ(S))[n] with p*α = 0, U = U_α and Θ = Θ(α). Let U₀ ⊂ U be the largest open over which p is finite flat with smooth branch locus Δ ∩ U₀; U ∖ U₀ is finite. Put Θ₀ = Θ ∩ U₀(ℝ). Then p(T(ℝ)) ∩ Θ = ∅; in particular no point of Θ₀ has a real preimage. (B19, §7.1, p. 96; §7.2, p. 98)

A construction can proceed as follows.

1. If y ∈ T(ℝ) with p(y) ∈ Θ, then `α_{p(y)}` = (p*α)_y = 0 after restricting to a real point, contradicting p(y) ∈ Θ (evaluation commutes with pullback; p*α is unramified near y).
2. A finite-type map of smooth surfaces is flat where it is finite (miracle flatness, ModularCurves §0.9), and the locus where the branch divisor is not smooth or p not finite is finite in U.

The definition has the following API.

- U₀ ⊂ U, the largest open where p is finite flat with smooth branch locus.
- U ∖ U₀ is finite.
- p(T(ℝ)) ∩ Θ = ∅.
- Θ₀ = Θ ∩ U₀(ℝ), with no real preimage under p.

**Checks.**

- If p is finite étale over U, U₀ = U and Θ₀ = Θ.
- At an isolated point where p is not finite (a contracted curve), U₀ ≠ U.
- Θ₀ is dense in Θ and H¹(Θ) ↪ H¹(Θ₀) (§1.9).

*Needs:* §1.4; §1.1; ModularCurves §0.9.

### 8.2 The alternating double cover and branch multiplicities

Purity of the branch locus (Zariski–Nagata; PurityOfBranchLocus §2.3) for the normal double cover.

For p : T → S as in §8.1 with étale locus S* (degree n), compose the monodromy π₁^ét(S*) → 𝔖_n with the sign to get a finite étale double cover Ŝ* → S*, independent of the numbering; its normalisation Ŝ → S is a finite double cover. For a branch component Δ_i with geometric generic fibre F_i put m_i = n − |F_i| = `Σ_{y ∈ F_i}(e_y − 1)`. The maximal open over which Ŝ → S is étale is V = `S ∖ ⋃_{m_i odd} Δ_i`, and the restricted evaluation locus Θ₀ of §8.1 is contained in V(ℝ). (B19, §7.2, pp. 97–98)

A construction can proceed as follows.

1. The sign of the monodromy is a homomorphism to ℤ/2, giving the double cover; renumbering conjugates the monodromy and does not change the sign. Its topological class ê is read off through the étale–equivariant comparison in degree one (gap:real-artin-comparison); over ℂ, étale and topological covers correspond by ComplexComparisonPartII §C6.2 (`riemannExistence`).
2. Local monodromy around Δ_i is a permutation with cycle type given by the ramification indices; it is odd iff m_i is odd.
3. The branch locus of the normal double cover has pure codimension one, so V is as stated.
4. If x ∈ Δ_i(ℝ) ∩ Θ₀ with m_i odd, a general such x has geometric fibre of odd cardinality n − m_i, hence a real point, so x ∈ p(T(ℝ)), which §8.1 excludes for points of Θ; hence Θ₀ ⊂ V(ℝ).

The construction has the following API.

- The finite double cover Ŝ → S.
- m_i = n − |F_i| for each branch component.
- m_i = `Σ_{y ∈ F_i}(e_y − 1)`.
- Ŝ → S is étale exactly over `S ∖ ⋃_{m_i odd} Δ_i`.
- ê ∈ H¹_G(V(ℂ), 𝔽₂), the class of the étale part.
- Θ₀ ⊂ V(ℝ).

**Checks.**

- For n = 2 the sign 𝔖₂ → ℤ/2 is an isomorphism, so the alternating cover is p itself over S* and V = S ∖ Δ. Then Θ₀ ⊂ V(ℝ) says that Θ₀ avoids Δ(ℝ), as it must since Δ(ℝ) ⊂ p(T(ℝ)).
- For a simple branch point (one ramification point of index 2), m_i = 1.
- If all m_i are even, V = S even though p is ramified.
- The monodromy of Ŝ* is the composite of the monodromy of p with `Equiv.Perm.sign`.

*Needs:* §8.1; ComplexComparisonPartII §C6.2 (`riemannExistence`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); PurityOfBranchLocus §2.3; Mathlib `Equiv.Perm.sign`.

### 8.3 Lifting the Kummer class through the trace sequence

p finite over U₀, so the Leray spectral sequence of `T_{U₀}` → U₀ degenerates.

In §8.1 let α̃ ∈ H²_G(U(ℂ), ℤ/n(1)) lift α in the Kummer sequence. Then `α̃|_{U₀}` = η mod n − φ(ζ) for some η ∈ H²_G(U₀(ℂ), ℤ(1)) and ζ ∈ H²_G(U₀(ℂ), Q(1)), where Q = coker(ℤ → p_*ℤ) and φ : Q → ℤ/n is induced by the trace. (B19, Lemma 7.2 and proof, p. 98)

A proof can proceed as follows.

1. The obstruction is the image of `α̃|_{U₀}` in H³_G(U₀(ℂ), p_*ℤ(1)) ≅ H³_G(`T_{U₀}(ℂ)`, ℤ(1)).
2. Comparing the Kummer sequence with the trace sequence 0 → p_*ℤ → ℤ ⊕ Q → ℤ/n → 0, this image is the topological obstruction of `p*α|_{U₀}`, which vanishes since p*α = 0.
3. Apply AlgebraicTopologyPartII §15.3.

**Checks.**

- If α̃ = 0 one can take η = ζ = 0, and if α̃ = κ(M′) = cl(M′) mod n is the Kummer class of a line bundle M′ on U₀ one can take η = cl(M′), ζ = 0.
- Negative control: α = 0 does not make η = ζ = 0 admissible. On S = ℙ¹ × ℙ¹ over ℝ with α = 0, n = 2 and the lift α̃ = κ(O(1, 0)), whose reduction (1, 0) mod 2 is nonzero, η = ζ = 0 gives 0 ≠ α̃, while η = cl(O(1, 0)), ζ = 0 gives α̃.

*Needs:* §8.1; AlgebraicTopologyPartII §15.3; AlgebraicTopologyPartII §15.1; §1.2.

### 8.4 The sign-corrected pullback lift

The minus sign matches the convention (1, −φ); equality of maps Q → p_*(ℤ/n) is checked on the target, which injects into j_*j*.

With η, ζ from §8.3 and ψ : Q → p_*ℤ the trace-zero operator, `p*α̃|_{U₀}` ∈ H²_G(`T_{U₀}(ℂ)`, ℤ/n(1)) is the reduction modulo n of p*η − ψ(ζ). (The published Lemma 7.3 and (7.13) have +ψ(ζ).) (B19, Lemma 7.3 and proof, pp. 98–99)

A proof can proceed as follows.

1. α̃ = η mod n − φ(ζ); p*(η mod n) = (p*η) mod n.
2. ψ mod n = p*∘φ as maps Q → p_*(ℤ/n): they agree on étale stalks and the target p_*(ℤ/n) → j_*j*p_*(ℤ/n) is injective (AlgebraicTopologyPartII §15.2; source correction E7); hence p*φ(ζ) = ψ(ζ) mod n.
3. This is AlgebraicTopologyPartII §15.4 on the surface.

**Checks.**

- Tr(p*η − ψ(ζ)) = nη, since Tr∘ψ = 0.

*Needs:* §8.3; AlgebraicTopologyPartII §15.4; AlgebraicTopologyPartII §15.2.

### 8.5 The circle double cover attached to the quotient class

n even; ι transverse to the branch locus (such embedded circles represent every class of H₁(Θ₀, 𝔽₂): AlgebraicTopologyPartII §12.2); the input ζ has normalised degree-two component 1 because φ(ζ)|_x = −α̃|_x ≠ 0 at x ∈ 𝕊¹ ⊂ Θ.

Let ι : 𝕊¹ → Θ₀ be a C^∞ embedding meeting the branch locus of p transversally at general points. On 𝕊¹ the permutation stalks of p_*ℤ are free ℤ[G]-modules (no real sheets). The sheaf 𝒢 = coker[(φ₂, 1 + σ) : ι*Q(1) → 𝔽₂ ⊕ (ι*Q(1))^G] sits in an exact sequence 0 → 𝔽₂ → 𝒢 → 𝔽₂ → 0 (AlgebraicTopologyPartII §15.6), with stalks 𝔽₂² if 4 | n and ℤ/4 if n ≡ 2 mod 4. The elements of 𝒢 mapping to 1 form a double cover ρ̃ : 𝕊̃¹ → 𝕊¹ whose class ε̃ ∈ H¹(𝕊¹, 𝔽₂) is the boundary of 1, namely ι*[φ(ζ)]₁. (B19, (7.5)–(7.9) and Lemma 7.5, pp. 99–100; B19, p. 100–101)

A construction can proceed as follows.

1. Ext stalks: (Ext^q_G(ℤ, ι*p_*ℤ))_x = H^q(G, ℤ[G]^k) = 0 for q > 0 by Shapiro's lemma; this finite-group Ext-stalk comparison is the input of the truncation step of AlgebraicTopologyPartII §15.6, which obtains it from MotivesAndAlgebraicCycles §7.6a.
2. AlgebraicTopologyPartII §15.6 gives exactness and identifies the boundary of 1 with the degree-one component of φζ; the degree-zero normalisation holds because η|_x = 0 (H²(G, ℤ(1)) = 0) and α̃|_x ≠ 0 on Θ.
3. The reduction from ℤ/n(1) to 𝔽₂ on the two twisted cyclic degrees is (id, n/2 mod 2) (AlgebraicTopologyPartII §15.5), which gives the stalk computation and forbids treating both cases as split.

The construction has the following API.

- 𝒢 on 𝕊¹ with 0 → 𝔽₂ → 𝒢 → 𝔽₂ → 0.
- The double cover of 𝕊¹ given by the elements of 𝒢 over 1.
- Its class is ι*[φ(ζ)]₁ ∈ H¹(𝕊¹, 𝔽₂).
- Stalks are 𝔽₂² if 4 | n and ℤ/4 if n ≡ 2 mod 4.

**Checks.**

- For n = 2 every stalk of 𝒢 is ℤ/4.
- For n = 4 every stalk of 𝒢 is 𝔽₂ ⊕ 𝔽₂.
- If φ(ζ) has zero first component along 𝕊¹, the circle cover is trivial.
- For n ≡ 2 mod 4 the extension 𝒢 is not split: its stalk ℤ/4 is not 𝔽₂².

*Needs:* §8.4; §8.1; AlgebraicTopologyPartII §15.6; AlgebraicTopologyPartII §15.5; AlgebraicTopologyPartII §12.2.

### 8.6 Local monodromy correction of circle covers

ι meets the branch components at general points of Δ_i(ℝ) ∩ Θ₀.

In §8.5 let ε̂ ∈ H¹(𝕊¹, 𝔽₂) be the class of the double cover of 𝕊¹ obtained by pulling back along ι the complex points of the alternating double cover of §8.2 over V; if ê ∈ H¹_G(V(ℂ), 𝔽₂) is the class of that cover, then ε̂ = ι*[ê]₁, since ι takes values in Θ₀ ⊂ V(ℝ), where G acts trivially and forgetting the G-action projects H¹_G(V(ℝ), 𝔽₂) = H⁰(V(ℝ)) ⊕ H¹(V(ℝ)) (the canonical decomposition, MotivesAndAlgebraicCycles §7.6b) onto its degree-one component. Then ε̃ = `ε̂ + Σ_{4 ∤ m_i} ι*cl_R(Δ_i)` in H¹(𝕊¹, 𝔽₂). On Θ₀ every m_i met by 𝕊¹ is even, and the local discrepancy at a crossing with Δ_i is m_i/2 mod 2. (B19, Lemma 7.6 and proof, pp. 101–102)

A proof can proceed as follows.

1. Off the finitely many crossings, a canonical bijection χ_x between the fibres of the two covers comes from orderings (a₁, …, `a_{n/2}`, σa₁, …, `σa_{n/2}`) of p⁻¹(x) up to even permutations and the functions equal to √−1 on the a_j and 0 on the σa_j.
2. At a crossing with Δ_i, the monodromy of a small loop exchanges the a's with conjugates of the b's in a way whose two permutations have the same cycle type, odd iff 4 ∤ m_i; so χ extends iff 4 | m_i.
3. Each nonextending crossing contributes ι*cl_R(Δ_i).

**Checks.**

- If no branch component meets 𝕊¹, ε̃ = ε̂.

*Needs:* §8.5; §8.2; MotivesAndAlgebraicCycles §7.6b.

### 8.7 The line bundle correcting the obstruction

Pic(S) → Pic(V) onto (§1.9); υ(ê) ∈ Pic(V)[2] extended to S.

Let ê ∈ H¹_G(V(ℂ), 𝔽₂) be the class of the alternating double cover over V. By §1.3 there is ϕ ∈ Pic(S) with [ê]₁ = `cl_R(ϕ)|_{V(ℝ)}`; put θ = ϕ ⊗ `O(Σ_{4 ∤ m_i} Δ_i)` ∈ Pic(S). (B19, Proof of Proposition 7.4, pp. 102–103)

A construction can proceed as follows.

1. cl_R(υ(ê)) = [ê]₁ (§1.3); extend υ(ê) to ϕ on S (§1.9, from SchemeAndStackFoundations §3.4).
2. Add the branch components with 4 ∤ m_i.

The construction has the following API.

- `θ = ϕ ⊗ O(Σ_{4∤m_i} Δ_i)`.
- `cl_R(θ)|_{V(ℝ)} = [ê]₁ + Σ_{4∤m_i} cl_R(Δ_i)|_{V(ℝ)}`.
- ϕ restricts to υ(ê) on V.

**Checks.**

- If p is étale (no Δ_i) and the alternating cover is trivial, θ = O_S.
- For a branch component with m_i = 2, 4 ∤ m_i and Δ_i contributes to θ.
- A component with m_i = 4 does not contribute, although it is in the branch locus.
- cl_R(υ(ê)) = [ê]₁ is §1.3 (Lemma 2.1 of the source).
- For n = 2 the alternating cover is p itself over S*, every m_i equals 1, and every branch component contributes to θ.

*Needs:* §8.2; §1.9; §1.3; SchemeAndStackFoundations §3.4.

### 8.8 Algebraicity of the quotient component

The setting of §7: n even, p*α = 0.

In §8.3, `[φ(ζ)]₁|_{Θ₀} = cl_R(θ)|_{Θ₀}` in H¹(Θ₀, 𝔽₂) for the θ ∈ Pic(S) of §8.7 (brackets include reduction modulo 2). (B19, Proposition 7.4 and proof, pp. 99, 102–103)

A proof can proceed as follows.

1. H¹(Θ₀, 𝔽₂) is detected by smooth embedded circles transverse to the branch locus at general points (AlgebraicTopologyPartII §12.2 and duality).
2. For each such ι, ι*[φ(ζ)]₁ = ε̃ (§8.5) = `ε̂ + Σ_{4∤m_i} ι*cl_R(Δ_i)` (§8.6), and ε̂ = ι*[ê]₁ = ι*cl_R(ϕ).

**Checks.**

- If α evaluates to 0 everywhere, Θ₀ = ∅ and the statement is empty.

*Needs:* §8.5; §8.6; §8.7; AlgebraicTopologyPartII §12.2; AlgebraicTopology Stage 6.

### 8.9 Obstruction to splitting by an even-degree cover

n even.

Let p : T → S be a generically finite morphism of even degree n between connected smooth projective real surfaces, α ∈ Br(ℝ(S))[n] with p*α = 0, U = U_α, Θ = Θ(α), α̃ ∈ H²_G(U(ℂ), ℤ/n(1)) a Kummer lift and ξ its reduction modulo 2. Then [ξ]₁|_Θ = cl_R(ν)|_Θ for some ν ∈ Pic(S). (B19, Proposition 7.1, p. 96; proof §7.5, pp. 103–104)

A proof can proceed as follows.

1. §8.4: `p*α̃|_{U₀}` = (p*η − ψ(ζ)) mod n; `p*α|_{U₀}` = 0 gives p*η − ψ(ζ) = nγ + cl(ϕ) on `T_{U₀}` (real topological Brauer sequence, §1.2).
2. Push forward: p_*ψ(ζ) = 0, so n(η − p_*γ) = cl(p_*ϕ); torsion-freeness of the cokernel of cl on Pic(U₀) (gap:picard-cokernel-torsion-free) and extension to S give μ with η − p_*γ = cl(`μ|_{U₀}`), hence [η]₁ − p_*[γ]₁ = cl_R(μ) on U₀(ℝ).
3. p_*[γ]₁ vanishes on Θ₀ (no real preimages); with §8.8, [ξ]₁ = [η]₁ + [φ(ζ)]₁ = cl_R(μ + θ) on Θ₀.
4. H¹(Θ) → H¹(Θ₀) is injective (§1.9), so the identity holds on Θ.

**Checks.**

- If T(ℝ) = ∅ and Θ = S(ℝ), the conclusion says [ξ]₁ is algebraic on all of S(ℝ).

*Needs:* §8.4; §8.8; §8.1; §1.9; §1.2; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); MotivesAndAlgebraicCycles §7.6b.

### 8.10 Unramified classes: the obstruction half of Theorem 0.5

α unramified on S; the criterion is existential in the lift.

Let S be a connected smooth projective surface over ℝ and α ∈ Br(S) of even period n. If no lift ξ ∈ H²_G(S(ℂ), 𝔽₂) of (n/2)α satisfies [ξ]₁|_Θ = 0, then ind(α) = 2n. (B19, Theorem 0.5, second statement, p. 64; proof, p. 104)

A proof can proceed as follows.

1. ind(α) ∈ {n, 2n} (§2.10). Suppose ind(α) = n: take a degree-n splitting field L of ℝ(S) (§0.12), the normalisation N of S in L (finite over S), and a resolution T → N with T smooth projective and connected (ResolutionOfSingularitiesCharacteristicZero §7.8, field resolution); p : T → S is generically finite of degree n.
2. Let α̃ ∈ H²_G(S(ℂ), ℤ/n(1)) lift α; its reduction ξ lifts (n/2)α, and §8.9 gives ν with [ξ]₁|_Θ = cl_R(ν)|_Θ.
3. ξ′ = ξ − (cl(ν) mod 2) is another lift of (n/2)α with [ξ′]₁|_Θ = 0 (compatibility of cl and cl_R, MotivesAndAlgebraicCycles §7.6b), contradicting the hypothesis.

**Checks.**

- Period-4 classes on real Enriques surfaces have index 4 (§9.4), consistent with this dichotomy.

*Needs:* §8.9; §2.10; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); §0.12; MotivesAndAlgebraicCycles §7.6b.

### Examples

For n = 2 the alternating double cover is p itself and V = S ∖ Δ. At n = 4 the trace-zero operator gives ψ[(1, 0, 0, 0)] = (−3, 1, 1, 1), of trace 0; with η = 0 and ζ = [(1, 0, 0, 0)], the class α̃ = η − φ(ζ) is −1 = 3 mod 4 and the corrected lift p*η − ψ(ζ) = (3, −1, −1, −1) reduces to (3, 3, 3, 3) = p*α̃, whereas the printed sign would give (1, 1, 1, 1). The circle extension has stalks ℤ/4 for n = 2 and 𝔽₂ ⊕ 𝔽₂ for n = 4. (B19 §7, pp. 97–104; source correction E6.)

### Dependencies

Layer 0; Layer 1; Layer 2; AlgebraicTopology Stage 6; AlgebraicTopologyPartII §12.2; AlgebraicTopologyPartII §15.1; AlgebraicTopologyPartII §15.2; AlgebraicTopologyPartII §15.3; AlgebraicTopologyPartII §15.4; AlgebraicTopologyPartII §15.5; AlgebraicTopologyPartII §15.6; ComplexComparisonPartII §C6.2 (`riemannExistence`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); Mathlib `Equiv.Perm.sign`; ModularCurves §0.9; MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); PurityOfBranchLocus §2.3; ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution); SchemeAndStackFoundations §3.4.

## Layer 9: real Enriques surfaces and the Puiseux counterexample

The image of the first two real components (the source's Proposition 8.1); real Enriques surfaces and their two halves, the Brauer group killed by 4, period-four classes, the identity deg(w₁²) = 0, the half detector and Theorem 0.6; real closedness of the Puiseux field over a real closed field, the sextic double plane and its K3 resolution with four sphere components, a class evaluating to zero on exactly one component, the quaternion sign contradiction and Proposition 0.7.

### 9.1 Image of the first two real components

𝔽₂ coefficients; deg the mod-2 degree on H²(S(ℝ)).

Let S be a connected smooth projective surface over ℝ with total Stiefel–Whitney class w = (w_i) of S(ℝ). The image of ρ : H²_G(S(ℂ), 𝔽₂) → H⁰(S(ℝ)) ⊕ H¹(S(ℝ)), restriction followed by the canonical decomposition and projection, is the set of (a₀, a₁) with deg([δ]₁ ∪ (a₁ + a₀ ∪ w₁)) = 0 for every δ ∈ H¹_G(S(ℂ), 𝔽₂) with [δ]₀ = 0. (B19, Proposition 8.1 and proof, pp. 105–106; BW20, Proposition 1.3, Definition 1.4, Remark 1.6(i), Theorem 1.12)

A proof can proceed as follows.

1. The localisation sequence with supports on S(ℝ) is canonically split (AlgebraicTopologyPartII §9.3), giving H²_G = `H²_{G,S(ℝ)}` ⊕ H²_G(S(ℂ) ∖ S(ℝ)).
2. Equivariant purity identifies `H²_{G,S(ℝ)}` with H⁰(S(ℝ)), and its image under ρ is {(a₀, a₀ ∪ w₁)}, since the self-intersection class γ is the total Stiefel–Whitney class (AlgebraicTopologyPartII §9.2, AlgebraicTopologyPartII §12.1).
3. The image of the complement factor is {(0, a₁)} with a₁ orthogonal to all [δ]₁ with [δ]₀ = 0, by the self-duality of the corrected localisation sequence (AlgebraicTopologyPartII §10.5).

**Checks.**

- If S(ℝ) = ∅ the image is 0.

*Needs:* AlgebraicTopologyPartII §9.3; AlgebraicTopologyPartII §9.2; AlgebraicTopologyPartII §12.1; AlgebraicTopologyPartII §10.5; AlgebraicTopologyPartII §10.3; MotivesAndAlgebraicCycles §7.6b; AlgebraicTopology Stage 6.

### 9.2 Real Enriques surfaces and their two halves

The canonical cover is the connected étale K3 double cover (EnriquesSurfaces §1.1). The two lifts differ by the constant class of ℝˣ/ℝˣ² in the degree-one Kummer sequence 0 → ℝˣ/ℝˣ² → H¹_G(S(ℂ), 𝔽₂) → Pic(S)[2] → 0.

A real Enriques surface is a smooth projective geometrically connected surface S over ℝ such that S_ℂ satisfies the Enriques condition of WeilConjectures WC.7, that is the canonical bundle of S_ℂ is numerically trivial and χ(O) = 1 on S_ℂ; in characteristic 0 this is the classical condition h¹(O) = 0 with K of order 2 used in EnriquesSurfaces §1.1. The two lifts of K_S ∈ Pic(S)[2] in H¹_ét(S, μ₂) ≅ H¹_G(S(ℂ), 𝔽₂) define the two real forms Y₁, Y₂ → S of the canonical K3 double cover; their real images are the halves S₁, S₂ of S, open and closed with S(ℝ) = S₁ ⊔ S₂, either of which may be empty. (B19, §0.3, p. 64; §8.1, p. 106; DK96, §1.3)

A construction can proceed as follows.

1. Pic(S) → Pic(S_ℂ) is injective (Hilbert 90 for H¹(G, ℂˣ)), Pic(S_ℂ)[2] = {0, K}, the kernel of Pic → Num being {O, K} and Num torsion-free (EnriquesSurfaces §1.1), and K_S is defined over ℝ, so Pic(S)[2] = {0, K_S}.
2. Each lift is a finite étale double cover, a real form of the canonical cover; a real point x of S lifts to exactly one of the two forms, which defines the partition of S(ℝ).

The definition has the following API.

- S/ℝ smooth projective geometrically connected with S_ℂ Enriques.
- The halves S₁, S₂ ⊂ S(ℝ).
- S(ℝ) = S₁ ⊔ S₂ with both open and closed.
- Changing the lift of K_S by the constant class exchanges the halves.
- Pic(S)[2] = {0, K_S}.

**Checks.**

- If S(ℝ) = ∅ both halves are empty.
- Every real point lies in exactly one half.
- The halves are unions of components but need not be single components.
- S is a real Enriques surface iff S itself satisfies the Enriques condition of WeilConjectures WC.7, since that condition is stable under field extension: numerical triviality of K and χ(O) = 1 are both unchanged by base change to ℂ.

*Needs:* WeilConjectures WC.7; EnriquesSurfaces §1.1; §1.2.

### 9.3 The Brauer group of a real Enriques surface is killed by four

Enriques invariants from EnriquesSurfaces §§1.1, 1.3 and 1.4: H²(O) = 0, c₁ : Pic(S_ℂ) ≅ H²(S(ℂ), ℤ), π₁(S(ℂ)) = ℤ/2.

For a real Enriques surface S, H²(S, O_S) = 0 and H³(S(ℂ), ℤ)_tors ≅ ℤ/2, so Br(S_ℂ) ≅ ℤ/2 by the complex topological Brauer sequence; restriction and corestriction to S_ℂ show that Br(S) is killed by 4. (B19, Proof of Theorem 0.6, p. 106)

A proof can proceed as follows.

1. H²(O) = 0 (EnriquesSurfaces §1.1) and c₁ : Pic(S_ℂ) ≅ H²(S(ℂ), ℤ) (EnriquesSurfaces §1.3), so the complex topological Brauer sequence (§1.2) gives Br(S_ℂ) ≅ H³(S(ℂ), ℤ)_tors, which is ℤ/2 by Poincaré duality H³ ≅ H₁ and π₁ = ℤ/2 (EnriquesSurfaces §1.4).
2. For α ∈ Br(S), corestriction along the finite locally free morphism S_ℂ → S of rank 2 (HeightsRationalPointsAndObstructions §2.19a, `finiteFlatBrauerCorestriction` with `pullback_comp`) gives cor(res α) = 2α in Br(S) itself, and res α ∈ Br(S_ℂ) is killed by 2, so 4α = cor(2·res α) = 0; no passage to the function field ℝ(S) is needed.

**Checks.**

- Br(S_ℂ) has exactly two elements.

*Needs:* §9.2; EnriquesSurfaces §1.1; EnriquesSurfaces §1.3; EnriquesSurfaces §1.4; §1.2; HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`).

### 9.4 Period-four classes on real Enriques surfaces

S real Enriques.

If α ∈ Br(S) has period 4 on a real Enriques surface S, then ind(α) = 4. (B19, Proof of Theorem 0.6, p. 106)

A proof can proceed as follows.

1. α_ℂ has period 2 (Br(S_ℂ) ≅ ℤ/2), so index 2 by §2.9.
2. ind(α) divides 2·ind(α_ℂ) = 4 and is divisible by per(α) = 4.

**Checks.**

- Classes of period 4 exist exactly when S(ℝ) is nonempty and orientable and both halves are nonempty: Br(S) is then `(ℤ/2)^(2s−2) ⊕ ℤ/4`, s the number of components of S(ℝ), and Br(S) is killed by 2 in every other case (MVH98, Theorem 1.3, p. 3 (arXiv v1)).

*Needs:* §9.3; §2.9; §0.12.

### 9.5 Detecting an empty half

S(ℝ) ≠ ∅ (if S(ℝ) = ∅ all three nonzero classes have zero restriction and uniqueness fails).

Let S be a real Enriques surface with S(ℝ) ≠ ∅. In 0 → ℝˣ/ℝˣ² → H¹_G(S(ℂ), 𝔽₂) → Pic(S)[2] → 0 the constant nonzero class has degree-zero component 1. A nonzero δ ∈ H¹_G(S(ℂ), 𝔽₂) with [δ]₀ = 0 exists iff exactly one half of S is empty; it is then unique, and [δ]₁ = cl_R(K_S) = w₁(S(ℝ)). (B19, Proof of Theorem 0.6, pp. 106–107)

A proof can proceed as follows.

1. H¹_G has four elements: 0, the constant class c (with [c]₀ = 1 on S(ℝ)), and the two lifts of K_S; [·]₀ of a lift of K_S is the indicator of the complement of its half.
2. A lift with [δ]₀ = 0 exists iff its half is all of S(ℝ), that is iff the other half is empty; it is the unique nonzero such class, since the two lifts differ by c and 0 also has [0]₀ = 0 (source correction E15).
3. [δ]₁ = cl_R(υ(δ)) = cl_R(K_S) (§1.3) and cl_R(K_S) = w₁ (Kahn's theorem, MotivesAndAlgebraicCycles §7.10).

**Checks.**

- If both halves are nonempty, no such δ exists.

*Needs:* §9.2; §1.3; MotivesAndAlgebraicCycles §7.10; §1.2.

### 9.6 Orientable or empty real locus

S real Enriques.

If S is a real Enriques surface with S(ℝ) empty or orientable, every α ∈ Br(S) has ind(α) = per(α). (B19, Proof of Theorem 0.6, p. 106)

A proof can proceed as follows.

1. S(ℝ) = ∅: §7.4.
2. Br(S) is killed by 4 (§9.3); classes of period 4 have index 4 (§9.4).
3. For α of period 2 and any lift α̃, cl_R is onto when S(ℝ) is orientable (MotivesAndAlgebraicCycles §7.10), so [α̃]₁ = cl_R(θ) = [cl(θ)]₁ (MotivesAndAlgebraicCycles §7.6b) and α̃ − (cl(θ) mod 2) is a lift with zero first component; §7.7 gives index 2.

**Checks.**

- Real Enriques surfaces whose real locus is a union of spheres and tori satisfy period = index for all unramified classes.

*Needs:* MotivesAndAlgebraicCycles §7.10; MotivesAndAlgebraicCycles §7.6b; §9.4; §7.7; §7.4.

### 9.7 Two nonempty halves and a nonorientable real locus

S real Enriques; both halves nonempty; w₁ ≠ 0.

If S(ℝ) is nonorientable and both halves of S are nonempty, there is α ∈ Br(S) of period 2 and index 4. (B19, Proof of Theorem 0.6, pp. 106–107)

A proof can proceed as follows.

1. No nonzero δ with [δ]₀ = 0 exists (§9.5), so by §9.1 every (1, a₁) is in the image of ρ; choose a₁ ∉ im cl_R (cl_R is not onto since w₁ ≠ 0, MotivesAndAlgebraicCycles §7.10).
2. The induced α has Θ = S(ℝ) and no lift with zero first component: lifts differ by Picard classes, whose components are cl_R; §8.10 gives index 4.

**Checks.**

- Such surfaces exist (DIK00, Appendix C, the classification of the real loci of real Enriques surfaces).

*Needs:* §9.5; §9.1; MotivesAndAlgebraicCycles §7.10; §8.10.

### 9.8 The square of w₁ on a real Enriques surface

S real Enriques (§9.2); for S(ℝ) = ∅ both sides vanish.

Let S be a real Enriques surface. Then deg(w₁(S(ℝ)) ∪ w₁(S(ℝ))) = 0 in 𝔽₂; equivalently, S(ℝ) has an even number of connected components of odd Euler characteristic. (MVH98, Theorem 4.4 and proof of Proposition 4.2, p. 12 (arXiv v1); B19, Theorem 0.6 and proof, pp. 65, 107)

A proof can proceed as follows.

1. w₁(S(ℝ)) = cl_R(K_S) (MotivesAndAlgebraicCycles §7.10, Kahn's theorem).
2. The image of cl_R : Pic(S) → H¹(S(ℝ), 𝔽₂) is the orthogonal complement of w₁ (MotivesAndAlgebraicCycles §7.10; MVH98 Theorem 4.4); as K_S ∈ Pic(S), w₁ is orthogonal to itself.
3. On each component Σ, deg(w₁(Σ)²) ≡ χ(Σ) mod 2 (AlgebraicTopologyPartII §12.1), so deg(w₁²) is the number of components of odd Euler characteristic modulo 2.

**Checks.**

- If S(ℝ) = ∅ the statement is empty.
- A real locus ℝℙ² ⊔ ℝℙ² has two components of Euler characteristic 1 and is not excluded; a real locus with a single ℝℙ² component, or any odd number of components of odd Euler characteristic, cannot occur.
- Two Klein bottles: χ = 0 for both, and deg(w₁²) = 0 although w₁ ≠ 0.

*Needs:* §9.2; MotivesAndAlgebraicCycles §7.10; AlgebraicTopologyPartII §12.1.

### 9.9 One nonempty half

S real Enriques with exactly one half nonempty, so S(ℝ) ≠ ∅; deg(w₁²) = 0 holds automatically (§9.8).

If exactly one half of the real Enriques surface S is nonempty, every period-2 class α ∈ Br(S) has index 2. (B19, Proof of Theorem 0.6, p. 107)

A proof can proceed as follows.

1. For a lift α̃ and the unique nonzero δ of §9.5 ([δ]₀ = 0, [δ]₁ = w₁), §9.1 gives deg([α̃]₁ ∪ w₁ + [α̃]₀ ∪ w₁²) = 0.
2. If deg([α̃]₁ ∪ w₁) = 0 take a = [α̃]₁. Otherwise deg([α̃]₀ ∪ w₁²) = 1, so Θ = Θ(α) contains an odd number of components of odd Euler characteristic; as their total number is even (§9.8), some component Σ of odd Euler characteristic lies outside Θ, and a = [α̃]₁ + w₁(Σ) on Σ, a = [α̃]₁ elsewhere, has deg(a ∪ w₁) = 1 + χ(Σ) = 0 and agrees with [α̃]₁ on Θ.
3. deg(a ∪ w₁) = 0, so a = cl_R(θ) for some θ ∈ Pic(S) (MotivesAndAlgebraicCycles §7.10); subtracting cl(θ) mod 2 gives a lift whose first component vanishes on Θ, and §7.7 gives index 2.

**Checks.**

- Real Enriques surfaces with S(ℝ) a union of two Klein bottles in one half satisfy period = index.
- If S(ℝ) is orientable, w₁ = 0 and a = [α̃]₁ always works.

*Needs:* §9.1; §9.5; §9.8; MotivesAndAlgebraicCycles §7.10; §7.7; AlgebraicTopologyPartII §12.1.

### 9.10 Real Enriques surfaces with period different from index

S real Enriques; Br(S) ⊂ Br(ℝ(S)). The source's condition also admits a single nonempty half carrying an odd number of components of odd Euler characteristic; by §9.8 that case never occurs (source correction E23), so it is not part of the criterion.

Let S be a real Enriques surface. Some class of Br(S) has index different from its period exactly when both halves of S are nonempty and S(ℝ) has a nonorientable component. (B19, Theorem 0.6, p. 65; proof §8.1, pp. 106–107; with source correction E23)

A proof can proceed as follows.

1. Br(S) is killed by 4 (§9.3) and classes of period 4 have index 4 (§9.4), so only period 2 matters. S(ℝ) is the disjoint union of the two halves, so four cases exhaust it: S(ℝ) empty, or both halves nonempty and S(ℝ) orientable, where §9.6 gives ind = per; exactly one half nonempty, where §9.9 gives ind = per; both halves nonempty and a nonorientable component, where §9.7 gives a class of period 2 and index 4.

**Checks.**

- For the surface of the §5.5 Checks, S(ℝ) is four copies of ℝℙ² with one empty half: nonorientable, yet every class has ind = per (§9.9), so the condition on the halves cannot be dropped. The source's condition gives the same answer there only because the number 4 of components of odd Euler characteristic is even (§9.8).
- If S(ℝ) is a union of spheres and tori, no class has ind ≠ per (§9.6), whichever halves are nonempty: nonorientability cannot be dropped either.
- Many possible real loci (DIK00, Appendix C) satisfy the condition and many do not.

*Needs:* §9.3; §9.4; §9.6; §9.7; §9.8; §9.9.

### 9.11 The Puiseux field over a real closed field is real closed

R real closed; f > 0 in K iff the leading coefficient of f is positive in R. `IsRealClosed` is Mathlib's class: semireal, every element or its negative a square, and every polynomial of odd degree has a root.

For a real closed field R let K = `TauCeti.puiseuxField` R ⊂ `HahnSeries` ℚ R be the Puiseux field (the series whose support lies in (1/n)ℤ and is bounded below for some n; FormalLaurentPuiseux L4 in its Tau Ceti form), ordered by the sign of the leading coefficient. Then K is real closed (`IsRealClosed` K), R ⊂ K is an ordered subfield, t is positive and smaller than every positive element of R, and K(√−1) = `TauCeti.puiseuxField` (R(√−1)). For R = ℝ this is the field K = ⋃_n ℝ((`t^{1/n}`)) of Proposition 0.7, which is non-archimedean. Semialgebraic topology and cohomology over K are those of MotivesAndAlgebraicCycles §7.6a. (B19, §0.4, p. 65; §8.2, p. 107; BCR, Example 15.2.2, p. 392)

A construction can proceed as follows.

1. The leading-coefficient order is a linear order compatible with addition and multiplication (the leading coefficient of a product is the product of leading coefficients), so K is an ordered field and in particular semireal.
2. Squares: write f = a t^q (1 + ε) with a ∈ Rˣ, q ∈ ℚ and ε of positive order, all at a single level R((`t^{1/n}`)), the image of `LaurentSeries.ramifiedEmbedding` R n (FormalLaurentPuiseux L4). If a > 0 then `f = (√a · t^{q/2} · (1 + ε)^{1/2})²`, the binomial series converging t-adically at level 2n; if a < 0 the same applies to −f.
3. Odd-degree roots: R(√−1) is algebraically closed of characteristic 0 (Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`, RealAlgebraicGeometry Layer 1), so `TauCeti.puiseuxField` (R(√−1)) = K(√−1) is algebraically closed (Tau Ceti `TauCeti.puiseuxField.instIsAlgClosed`, FormalLaurentPuiseux L5). Coefficientwise conjugation is a K-automorphism of order 2; the roots in K(√−1) of an odd-degree f ∈ K[X] are permuted in pairs, so one of them is fixed and lies in K. Alternatively, steps 2 and 3 can be replaced by one application of `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`: −1 is not a square in the ordered field K of step 1, and for i = √−1 in `TauCeti.puiseuxField` (R(√−1)) the field K(i) is the whole of that algebraically closed field (a series splits coefficientwise as g + i·h with g, h in K at the same level).
4. t − r has leading coefficient −r for r > 0 in R, so 0 < t < r; for R = ℝ, n·t < 1 for every natural n, so K is non-archimedean.

The definition has the following API.

- The leading-coefficient order on `TauCeti.puiseuxField` R, making it a strictly ordered field.
- `IsRealClosed` (`TauCeti.puiseuxField` R) for every real closed R.
- 0 < t and t < r for every positive r ∈ R.
- `TauCeti.puiseuxField` (R(√−1)) is (`TauCeti.puiseuxField` R)(√−1), coefficientwise, with conjugation acting on coefficients.

**Checks.**

- `t^{1/2}` · `t^{1/2}` = t in `TauCeti.puiseuxField` ℝ, while −t has negative leading coefficient and is not a square.
- `TauCeti.puiseuxField` ℝ is not archimedean: n·t < 1 for every natural n.
- The constant series form an ordered subfield isomorphic to R; the order does not depend on a choice of root of unity or uniformiser.
- `IsRealClosed` in Mathlib's sense, so §0.3 applies to (`TauCeti.puiseuxField` ℝ, id).
- X² − t has the two roots `±t^{1/2}` in K.
- X³ − t has the root `t^{1/3}` in K and two further roots in K(√−1) ∖ K.

*Needs:* FormalLaurentPuiseux L4; FormalLaurentPuiseux L5; RealAlgebraicGeometry Layer 1; Tau Ceti `TauCeti.puiseuxField`; Tau Ceti `LaurentSeries.ramifiedEmbedding`; Tau Ceti `TauCeti.puiseuxField.instIsAlgClosed`; Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`; Tau Ceti `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`; Mathlib `HahnSeries`; Mathlib `IsRealClosed`; MotivesAndAlgebraicCycles §7.6a.

### 9.12 The sextic double plane and its K3 resolution

The K3 property is proved from the equation: a double plane branched along a sextic with only ADE singularities has rational double points, and its minimal resolution has trivial canonical bundle and H¹(O) = 0.

Over ℝ[[t]] let 𝒳 = {z² = (w² − u² − v²)u²v² − t w⁶}, a double cover of ℙ² branched along a sextic. Its base change to K = `TauCeti.puiseuxField` ℝ has rational double points only, and the minimal resolution S of 𝒳_K is a K3 surface over K (smooth projective geometrically connected with K_S ≅ O_S and H¹(O_S) = 0). The real locus S(K) is the disjoint union of four semialgebraic 2-spheres, one for each pair of signs taken by the functions u/w and v/w; these spheres are the semialgebraically connected components of S(K), and since a sphere has no degree-one cohomology, H¹(S(K), 𝔽₂) = 0 in semialgebraic cohomology. (B19, Proof of Proposition 0.7, p. 107; BCR, Example 15.2.2, pp. 392–393)

A construction can proceed as follows.

1. The branch sextic f = (w² − u² − v²)u²v² − tw⁶ has only ADE singularities over K (for t ≠ 0 the components separate), so the double cover has rational double points and its minimal resolution has trivial canonical bundle and q = 0.
2. Real points: z² = f requires f ≥ 0; BCR Example 15.2.2 shows the semialgebraic set {f ≥ 0} in the affine chart w = 1 has four bounded components, one in each sign quadrant of (u, v), and the double cover over each is a sphere.
3. Semialgebraic cohomology of a semialgebraic sphere vanishes in degree 1 (MotivesAndAlgebraicCycles §7.6a).

The construction has the following API.

- 𝒳 over ℝ[[t]] and its generic fibre over K.
- The minimal resolution S of 𝒳_K.
- S is a K3 surface over K.
- S(K) has exactly four semialgebraically connected components, indexed by signs of u/w and v/w.
- H¹(S(K), 𝔽₂) = 0.

**Checks.**

- At t = 0 the double plane is z² = (w² − u² − v²)u²v², reducible branch locus, not a K3 surface.
- The number of semialgebraic components of S(K) is 4.
- No f ∈ K(S)ˣ is, outside its zeros and poles, positive on exactly one of the four components and negative on the other three (BCR, Example 15.2.2): for Ξ of §9.13 this is the case f = g of the sign argument of §9.14, and the sign changes of u and v, automorphisms of S, permute the four components. Pairs of components are told apart: on the components where (u/w, v/w) has signs (+, +), (+, −), (−, +), (−, −), the function u/w has signs (+, +, −, −), v/w has (+, −, +, −) and uv/w² has (+, −, −, +), each two against two. Over ℝ every locally constant sign pattern on the real locus of a smooth projective surface is that of a rational function invertible along it (§6.6 (a)).
- H¹(S(K), 𝔽₂) is computed in the semialgebraic theory of MotivesAndAlgebraicCycles §7.6a.
- At t = 0 the special fibre is the double cover z² = (w² − u² − v²)u²v², whose normalisation is the quadric z² = w² − u² − v².

*Needs:* §9.11; MotivesAndAlgebraicCycles §7.6a; StableReduction Layer 4; SchemeAndStackFoundations §5.10.

### 9.13 A class evaluating to zero on exactly one component

This is Colliot-Thélène–Parimala's realisation of locally constant evaluation functions by 2-torsion Brauer classes on varieties over real closed fields.

For the K3 surface S of §9.12 and the component Ξ ⊂ S(K) where u/w, v/w > 0, there is α ∈ Br(S)[2] whose evaluation at x ∈ S(K) vanishes iff x ∈ Ξ. (CTP90, Proposition 3.1.2; B19, Proof of Proposition 0.7, p. 107)

A construction can proceed as follows.

1. Cited input (CTP90 Proposition 3.1.2): every locally constant function S(K) → Br(K)[2] constant on semialgebraic components is the evaluation function of a class of Br(S)[2].

The construction has the following API.

- α ∈ Br(S)[2] with evaluation vanishing exactly on Ξ.
- α_x = 0 iff x ∈ Ξ.
- per α = 2.

**Checks.**

- Θ(α) = S(K) ∖ Ξ, three components.
- α ≠ 0 since it evaluates nontrivially off Ξ.
- Restricted to a point of Ξ, α is trivial.
- Evaluation at K-points uses Br(K) ≅ ℤ/2 of §0.3.

*Needs:* §9.12; §1.4; MotivesAndAlgebraicCycles §7.6a.

### 9.14 The class is not a quaternion class

Generic-point form of the source's sign argument (source correction E13).

The class α of §9.13 has index ≠ 2, hence index 4. (B19, Proof of Proposition 0.7, pp. 107–108)

A proof can proceed as follows.

1. If α = (f, g) in Br(K(S)) with f, g ∈ K(S)ˣ (source correction E14), then at points x outside zeros and poles, x ∈ Ξ iff f(x) > 0 or g(x) > 0.
2. Descend f, g to ℝ((`t^{1/n}`)) and multiply by suitable powers of the positive `t^{1/n}` (preserving signs) so that they specialise to nonzero rational functions f₀, g₀ on the special fibre, viewed on the quadric Q = {z² = w² − u² − v²}.
3. On the divisor D = {u = 0} ⊂ Q, choose general real points on the arc v/w < 0, avoiding zeros and poles of the unit parts of f₀, g₀ after factoring the powers of u; the sign pattern there forces even orders of f₀, g₀ along D.
4. At general points of the arc v/w > 0, the signs of f₀, g₀ are then constant across D, contradicting the required jump between u/w > 0 (in Ξ) and u/w < 0 (not in Ξ).
5. ind(α) divides 4 by §2.10 (de Jong over K(√−1)), and is not 2, so it is 4.

**Checks.**

- The index of α is 4 while its period is 2.

*Needs:* §9.13; §2.10; §9.11.

### 9.15 Failure of the criterion over a non-archimedean real closed field

K the real Puiseux field.

There are a K3 surface S over K = ⋃_n ℝ((`t^{1/n}`)) with H¹(S(K), 𝔽₂) = 0 (semialgebraic cohomology) and α ∈ Br(S)[2] with ind(α) = 4. Since every Kummer lift has zero first real component (H¹(S(K)) = 0), the analogue of Theorem 0.5 over K fails. (B19, Proposition 0.7, p. 65; proof §8.2, pp. 107–108)

A proof can proceed as follows.

1. §9.12, §9.13 and §9.14.

**Checks.**

- Over ℝ the same criterion holds (§7.7, §8.10).

*Needs:* §9.12; §9.13; §9.14.

### Examples

Two disjoint copies of ℝℙ² have deg(w₁²) = 1 + 1 = 0, as the real locus of a real Enriques surface must, while a single ℝℙ² has deg(w₁²) = 1 and is excluded (§9.8); two Klein bottles have Euler characteristic 0 and w₁ ≠ 0. A class of period 4 on a real Enriques surface restricts to a nonzero class of period 2 and index 2 over ℂ(S), and has index 4 = per. Over the real Puiseux field, X² − t has the roots `±t^{1/2}` while −t, with leading coefficient −1, is not a square; at t = 0 the sextic z² = (w² − u² − v²)u²v² normalises to the quadric z² = w² − u² − v². (B19 §8, pp. 104–110; MVH98, Theorem 1.3, p. 3, for the classes of period 4.)

### Dependencies

Layer 0; Layer 1; Layer 2; Layer 7; Layer 8; AlgebraicTopology Stage 6; AlgebraicTopologyPartII §10.3; AlgebraicTopologyPartII §10.5; AlgebraicTopologyPartII §12.1; AlgebraicTopologyPartII §9.2; AlgebraicTopologyPartII §9.3; EnriquesSurfaces §1.1; EnriquesSurfaces §1.3; EnriquesSurfaces §1.4; FormalLaurentPuiseux L4; FormalLaurentPuiseux L5; HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction`); Mathlib `HahnSeries`; Mathlib `IsRealClosed`; MotivesAndAlgebraicCycles §7.10; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; RealAlgebraicGeometry Layer 1; SchemeAndStackFoundations §5.10; StableReduction Layer 4; WeilConjectures WC.7; Tau Ceti `LaurentSeries.ramifiedEmbedding`; Tau Ceti `TauCeti.puiseuxField`; Tau Ceti `TauCeti.puiseuxField.instIsAlgClosed`; Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`; Tau Ceti `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`.

## Downstream consumers

QuadraticFormInvariantsPartII consumes §0.7 for its Layer 5: its C_i fields, Lang–Nagata theorem for systems, algebraic-extension step and Tsen–Lang theorem (its §§5.1, 5.4, 5.5 and 5.6) are those of §0.7, and its finite-field and Kronecker-dimension applications (its §§5.3 and 5.7) build on them; nothing flows from it to this roadmap. Layer 0 is general real-function-field theory (orderings, signatures at a varying ordering, the Elman–Lam invariant, the Tsen–Lang theorem, the period and index of a Brauer class) for any roadmap on quadratic forms over function fields. Layers 3–8 are the natural input for period-index and integral Hodge questions on other real varieties (Benoist–Wittenberg, BW20 and BW20II); Theorems 0.3, 0.4, 0.10, 0.12 and 0.13 are stated in field-theoretic form in `Suggested.lean` for direct use.

## Source corrections
Each entry records what the source has at the locator (B19, published version, unless the entry names another source) and the corrected statement the targets of this roadmap use. The targets cite these entries as source corrections.

- **E1** (error, §3.1, p. 76). The surface T = {rv² = sw²} is called a finite double cover of S ramified over Δ. *Correction:* The incidence model is proper and generically of degree 2 but has ℙ¹ fibres over R ∩ D; it is finite flat only over S₀. The finite flat model is Spec_S(O_S ⊕ L⁻¹(−R)) with multiplication by rs (§3.1). *Reason:* Over a crossing x of R and D both r and s vanish, so the fibre equation rv² = sw² is identically zero and the fibre is all of ℙ¹. *Affects:* a stated result.
- **E2** (gap, Lemma 1.4, p. 70). The proof uses that the reduction of p*β modulo n is p*p*α̃ for an integral β lifting p*α. *Correction:* Choose β with β mod n = p*α̃ before Lemma 1.4; Lemma 1.3 kills the Bockstein of p*α̃, so such β exists (§2.4). *Reason:* An integral lift of p*α in (1.2) is determined only up to n·H² + cl(Pic), so its reduction need not be p*α̃. *Affects:* the proof.
- **E3** (error, Proposition 4.4, p. 84, after (4.8)). The computation concludes ([ζ]₁)|_Ψ = ([e]₁)|_Ψ from ([α̃]₁)|_Ψ = 0, and the proposition asserts τ = 0 for every Ψ ⊃ Θ. *Correction:* The diagonal-arrow formula gives [ζ]₁ = [α̃]₀ ∪ [e]₁ on Ψ, and [e]₁ = cl_R(L(R)) because the 2-torsion line bundle of the cover is L(R) on S*. For a given cover, τ = 0 if and only if ([α̃]₀ ∪ cl_R(L(R)))|_Ψ is the restriction of the degree-one real component [ξ]₁ of a class ξ ∈ H²_G(S(ℂ), ℤ(1)) (§5.5), and the conclusion of Proposition 4.5 holds if and only if it is the restriction of the Borel–Haefliger class of a line bundle on S (§5.8); both hold when the evaluation is constant on Ψ (the Picard correction is multiplied by its value t) and when cl_R(L(R)) vanishes on Ψ. The unconditional statement fails: on a real Enriques surface whose real locus is four copies of ℝℙ², with Θ two of them, Ψ = S(ℝ) and cl_R(L) the sum of the generators of H¹ of one component in Θ and one outside it, its hypotheses hold and τ ≠ 0 (§5.5, Checks). Proposition 6.6 holds as stated: choosing the ample bundle of Proposition 5.5 to be a square makes cl_R(N) = 0, hence cl_R(L(R)) = cl_R(A^l ⊗ N) = 0 for l even (§§4.9, 6.13). *Reason:* Ψ ⊃ Θ may contain components where α evaluates to 0, where [α̃]₀ = 0, while the printed computation takes [α̃]₀ = 1 on all of Ψ; the remaining correction class need not come from H²_G(S(ℂ), ℤ(1)). *Affects:* a stated result (Propositions 4.4 and 4.5 are replaced by the criteria of §§5.5 and 5.8; Proposition 6.6 and the theorems are unaffected, since they use Ψ = Θ, where the evaluation is constant, or cl_R(L(R)) = 0).
- **E4** (gap, Proposition 4.5, pp. 84–85). The proof writes `β|_{T_U}` = p*α̃ + 2ε + cl(ϕ), adding the mod-2 class p*α̃ to integral classes. *Correction:* Use the integral class b = p*η − ψ(ζ) from the trace quotient and Picard primitivity (§5.6, §5.8). *Reason:* α̃ lies in H²_G(U(ℂ), 𝔽₂) while β lives in integral equivariant cohomology; the displayed sum is not typed. *Affects:* a stated result.
- **E5** (gap, Proposition 4.5, p. 85, application of Assumption 4.1 (ii)). δ − cl(θ₂) is fed to Proposition 3.3 after its first component vanishes on Ψ. *Correction:* First subtract cl(ν) for a combination ν of curves avoiding Ψ given by Assumption 4.1 (ii), then apply Proposition 3.3; add 2ν to θ (§5.7). *Reason:* Proposition 3.3 needs [ξ]₁ ∈ I on all of S(ℝ), not only vanishing on Ψ. *Affects:* the proof.
- **E6** (misprint, Lemma 7.3, p. 98, and (7.13), p. 103). p*α̃ is the reduction of p*η + ψ(ζ). *Correction:* p*η − ψ(ζ), consistently with the map (1, −φ) in (7.2); (7.14) is unchanged since Tr∘ψ = 0. *Reason:* α̃ = η mod n − φ(ζ) and ψ mod n = p*φ give p*α̃ = (p*η − ψ(ζ)) mod n. *Affects:* nothing.
- **E7** (misprint, Proof of Lemma 7.3, p. 99). Equality of the two maps out of Q is deduced from injectivity of Q → j_*j*Q. *Correction:* Use injectivity of the target p_*(ℤ/n) → j_*j*p_*(ℤ/n). *Reason:* Injectivity of the source does not separate two maps out of it; injectivity of the target does. *Affects:* nothing.
- **E8** (misprint, Proposition 6.7, p. 95). The statement imposes a lift of (n/2)α for every n. *Correction:* State the odd case separately and impose the half-period lift only for even n; the restricted period is exactly n/2 by corestriction (§7.3, §7.2). *Reason:* (n/2)α is undefined for odd n. *Affects:* nothing.
- **E9** (gap, Proof of Theorem 0.12, p. 95). K is written as the union of all finite extensions of a finitely generated K₀ carrying α. *Correction:* Enlarge K₀ by a transcendence basis of K/ℝ first, so that K/K₀ is algebraic. *Reason:* Otherwise K is not a union of finite extensions of K₀. *Affects:* the proof.
- **E10** (gap, Proof of Theorem 0.12, lower bound, p. 96). Parameters z₁, z₂ are chosen with neither proportional to w² + 1 in m/m², and y_j = (1 + z_j)² + (w + z_j)² are claimed to be local parameters. *Correction:* Replace w by w′ = (w² − 1)/(2w), so that w′² + 1 ∈ m²; then for any regular parameters z_j the y_j are regular parameters (§7.9). *Reason:* dy_j = a + 2(1 + i)dz_j with a the differential of w² + 1; separate non-proportionality conditions do not make the 2×2 determinant nonzero. *Affects:* the proof.
- **E11** (misprint, (2.1), p. 72). The source of the Gysin map has coefficient M(−k). *Correction:* M(d′ − d), as in BW20, (1.22). *Reason:* The twist depends on the codimension, not on the degree k. *Affects:* nothing.
- **E12** (misprint, (5.7), p. 88). The normal-sequence boundary in the factorisation of φ_λ lands in H⁰(C, `N_{C/T}`). *Correction:* H¹(C, `N_{C/T}`). *Reason:* It is the boundary of 0 → `N_{C/T}` → `N_{C/X}` → `N_{T/X}|_C` → 0 from H⁰ of the last term (BEN18, Proposition 2.1). *Affects:* nothing.
- **E13** (gap, Proof of Proposition 0.7, p. 108). Signs of f₀, g₀ are compared at the fixed point [0 : −1 : 1 : 0] and near general points avoiding poles only. *Correction:* On both arcs v/w < 0 and v/w > 0 of D = {u = 0} choose general real points avoiding zeros and poles of the unit parts after factoring the D-orders (§9.14). *Reason:* The fixed point may lie on zeros or poles of f₀, g₀; avoiding poles alone does not make the signs locally constant. *Affects:* the proof.
- **E14** (misprint, Proof of Proposition 0.7, p. 107). α = (f, g) is written in Br(R(S)). *Correction:* Br(K(S)) for the real Puiseux field K. *Reason:* S is defined over K, not ℝ. *Affects:* nothing.
- **E15** (misprint, Proof of Theorem 0.6, p. 107). The class δ with [δ]₀ = 0 is called unique. *Correction:* Unique nonzero class, as on p. 106. *Reason:* δ = 0 always satisfies [δ]₀ = 0. *Affects:* nothing.
- **E16** (misprint, Proof of Theorem 1.5, p. 71). Voisin's Proposition 9 is applied with n = dl. *Correction:* Use a separate letter for Voisin's degree, m = dn for surfaces in |dnH|. *Reason:* n is already the period of α. *Affects:* nothing.
- **E17** (misprint, §3.1, p. 77). The fixed singular points of T are the points over Sing R where v vanishes. *Correction:* where w vanishes (and v ≠ 0). *Reason:* Over Sing R the equation rv² = sw² with s a unit and r vanishing forces w = 0 at points with r = 0; v and w do not vanish together. *Affects:* nothing.
- **E18** (gap, Proposition 4.2, p. 80). After curves over R, the remaining curves are treated as exceptional divisors of the blow-up T → T̄. *Correction:* Treat both the exceptional ℙ¹'s over Sing R and the ℙ¹ fibres over R ∩ D of the incidence model, by the same Gersten and Witt argument (§5.2). *Reason:* The ℙ¹ fibres over R ∩ D lie in T̄ already and are not exceptional for T → T̄. *Affects:* the proof.
- **E19** (gap, Proposition 6.6, pp. 94–95). The proposition follows by replacing T with T_x. *Correction:* Normalise the integral lift so that its reduction on T_U is p*α̃ and transport the pair (T, p⁻¹R) so that this persists on T_x; only then does algebraicity modulo 2 give splitting (§6.12, §6.11). *Reason:* An Ehresmann trivialisation that does not preserve p⁻¹R need not identify the Kummer data on T_U. *Affects:* the proof.
- **E20** (error, Lemma 6.4, p. 92). h₁ is chosen vanishing to order one along R and H, and t = −h₁h₂ru. *Correction:* Choose h₁ with real divisor H − R (simple pole along R, simple zero along H); then t = −h₁h₂ru has real zero locus H(ℝ) (§6.7). *Reason:* With a zero of h₁ along R, t vanishes to order 2 along R, so its real zero locus contains R(ℝ) and is not ι′(𝒮). *Affects:* the proof.
- **E21** (misprint, Proof of Proposition 4.5, p. 85). [p_*ε]₁ = 0 in H¹(S(ℝ)). *Correction:* [p_*ε]₁ ∈ H¹(U(ℝ)) vanishes on Ψ. *Reason:* ε lives over T_U; only its restriction to Ψ, which has no real preimage, vanishes. *Affects:* nothing.
- **E22** (misprint, Proof of Lemma 6.5, p. 92). p(T(ℝ)) is said to be disjoint from Θ. *Correction:* Disjoint from Ψ = S(ℝ) ∖ Ξ, the set to avoid in Assumption 4.1. *Reason:* Lemma 6.5 concerns Assumption 4.1 with Ψ = S(ℝ) ∖ Ξ; Θ does not occur in its statement. *Affects:* nothing.
- **E23** (error, Theorem 0.6 (ii), p. 65, and its proof, p. 107). If exactly one half of S is nonempty and S(ℝ) has an odd number of components of odd Euler characteristic, the lift with components (1, w₁) gives a class of index 4. *Correction:* This case never occurs: w₁ = cl_R(K_S) lies in im cl_R = w₁^⊥, so deg(w₁²) = 0 and the number of components of odd Euler characteristic is even (§9.8). Theorem 0.6 stays true; its condition (ii) is equivalent to S(ℝ) being nonorientable with both halves nonempty. *Reason:* Kahn's cl_R(K_S) = w₁ and Mangolte–van Hamel's description of im cl_R as the orthogonal of w₁. *Affects:* the proof.
- **E24** (misprint, CT05, Proof of Theorem 3.14 and Lemma 3.15, pp. 400–402). Property (iii) and the requirement that the specialisation be an l-th power put the fibre with a multiplicity-one component birational to X over 0 ∈ 𝔸¹, while the family is s_t = t^l s₁^l + (1 − t)^l s₀. *Correction:* For this family that fibre lies over t = 1, where the cover has l components isomorphic to X, as property (c) of the same proof records; the specialisation is taken at a point above 1 (§1.8). Equivalently, exchange t and 1 − t in the family. *Reason:* At t = 0 the equation is z^l = s₀, and s₀ vanishes to order one along D, so that fibre is irreducible of degree l over X; at t = 1 it is z^l = s₁^l, a product of l factors z − ζ^i s₁. *Affects:* the proof.

## References


Works marked *cited by locator* are cited at the locator given; their statements are used only as stated there.

- **B19**: Olivier Benoist, *The period-index problem for real surfaces*, Publications Mathématiques de l'IHÉS 130 (2019), 63–110; published version (Numdam), printed page numbers. <https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf>
- **CT05**: Jean-Louis Colliot-Thélène, *Algèbres simples centrales sur les corps de fonctions de deux variables (d'après A. J. de Jong)*, Séminaire Bourbaki, exposé 949, Astérisque 307 (2006), 379–413. <https://www.numdam.org/item/SB_2004-2005__47__379_0.pdf>
- **BW20**: Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, I*, Inventiones Mathematicae 222 (2020), 1–77; arXiv:1801.00872v3. <https://arxiv.org/abs/1801.00872v3>
- **BW20II**: Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, II*, Journal de l'École polytechnique 7 (2020), 373–429; arXiv:1801.00873v3. <https://arxiv.org/abs/1801.00873v3>
- **BEN18**: Olivier Benoist, *Sums of three squares and Noether–Lefschetz loci*, Compositio Mathematica 154 (2018), 1048–1065; arXiv:1706.02053v2. <https://arxiv.org/abs/1706.02053v2>
- **VOI06**: Claire Voisin, *On integral Hodge classes on uniruled or Calabi–Yau threefolds*, Moduli Spaces and Arithmetic Geometry, Adv. Stud. Pure Math. 45 (2006), 43–73; arXiv:math/0412279v1. <https://arxiv.org/abs/math/0412279v1>
- **MVH98**: Frédéric Mangolte and Joost van Hamel, *Algebraic cycles and topology of real Enriques surfaces*, Compositio Mathematica 110 (1998), 215–237; arXiv:alg-geom/9606007v1. <https://arxiv.org/abs/alg-geom/9606007v1>
- **EKM**: Richard Elman, Nikita Karpenko and Alexander Merkurjev, *The Algebraic and Geometric Theory of Quadratic Forms*, AMS Colloquium Publications 56 (2008); author PDF, printed page numbers. <https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf>
- **BEC05**: Karim Johannes Becher, *On fields of u-invariant 4*, Linear Algebraic Groups and Related Structures preprint 154 (2005). <https://www.math.uni-bielefeld.de/lag/man/154.pdf>
- **VA13**: Anthony Várilly-Alvarado, *Arithmetic of del Pezzo surfaces*, Birational Geometry, Rational Curves, and Arithmetic, Springer (2013), 293–319; editor-hosted final version. <https://math.nyu.edu/~tschinke/books/simons12/final/varilly-alvarado/varilly-alvarado.pdf>
- **BCR**: Jacek Bochnak, Michel Coste and Marie-Françoise Roy, *Real Algebraic Geometry*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 36, Springer (1998); cited by locator. <https://doi.org/10.1007/978-3-662-03718-8>
- **ARA75**: J. K. Arason, *Primideale im graduierten Wittring und im mod 2 Cohomologiering*, Mathematische Zeitschrift 145 (1975), 139–143; cited by locator. <https://doi.org/10.1007/BF01214778>
- **SPR55**: T. A. Springer, *Quadratic forms over fields with a discrete valuation. I*, Indagationes Mathematicae 17 (1955), 352–362; cited by locator. <https://doi.org/10.1016/S1385-7258(55)50049-3>
- **EL73**: R. Elman and T. Y. Lam, *Quadratic forms and the u-invariant. I*, Mathematische Zeitschrift 131 (1973), 283–304; cited for the bound u(F) ≤ 6 when u(F(√−1)) = 4, in the form recalled in BEC05, §1, p. 1, and §3, p. 3. <https://doi.org/10.1007/BF01174904>
- **BRO80**: L. Bröcker, *Reelle Divisoren*, Archiv der Mathematik 35 (1980), 140–143; cited by locator. <https://doi.org/10.1007/BF01235331>
- **DK96**: A. Degtyarev and V. Kharlamov, *Halves of a real Enriques surface*, Commentarii Mathematici Helvetici 71 (1996), 628–663; cited by locator. <https://doi.org/10.1007/BF02566440>
- **DIK00**: A. Degtyarev, I. Itenberg and V. Kharlamov, *Real Enriques Surfaces*, Lecture Notes in Mathematics 1746, Springer (2000); cited by locator. <https://doi.org/10.1007/BFb0103960>
- **CTP90**: J.-L. Colliot-Thélène and R. Parimala, *Real components of algebraic varieties and étale cohomology*, Inventiones Mathematicae 101 (1990), 81–99; cited by locator. <https://doi.org/10.1007/BF01231498>
- **SCH94**: C. Scheiderer, *Real and Étale Cohomology*, Lecture Notes in Mathematics 1588, Springer (1994); cited by locator. <https://doi.org/10.1007/BFb0074269>
- **SER06**: E. Sernesi, *Deformations of Algebraic Schemes*, Grundlehren 334, Springer (2006); cited by locator. <https://doi.org/10.1007/978-3-540-30615-3>
- **GG73**: M. Golubitsky and V. Guillemin, *Stable Mappings and Their Singularities*, Graduate Texts in Mathematics 14, Springer (1973); cited by locator. <https://doi.org/10.1007/978-1-4615-7904-5>
- **BRE97**: G. E. Bredon, *Sheaf Theory*, 2nd edition, Graduate Texts in Mathematics 170, Springer (1997); cited by locator. <https://doi.org/10.1007/978-1-4612-0647-7>
- **DIM85**: A. Dimca, *Monodromy and Betti numbers of weighted complete intersections*, Topology 24 (1985), 369–374; cited by locator. <https://doi.org/10.1016/0040-9383(85)90009-3>
