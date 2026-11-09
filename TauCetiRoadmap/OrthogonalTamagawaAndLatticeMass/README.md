# Roadmap: orthogonal Tamagawa comparison, arbitrary lattice masses, and class counts

**Summary.** Construct orthogonal gauge and quotient comparisons, arbitrary integral-genus mass formulas, general unramified dyadic integral models and exact class-count applications. Reuse the existing lattice, orthogonal group, local field, restricted-product and generic Haar/Tamagawa carriers; build the missing comparison maps and their complete APIs here.

## Scope and ownership

This roadmap owns the orthogonal algebraic-group/point and gauge comparisons, the rational arbitrary-genus mass formula, arbitrary unramified dyadic smooth models, the binary analytic comparison, and the rank-16/24 classification and rank-32/40 bounds. It builds on IntegralLattices and OrthogonalSpinGroups; it does not re-plan their lattice and point-group theories.

Finiteness of the automorphism group of a definite lattice is Tau Ceti's (IntegralLattices label 2C); IntegralLattices §2G owns class finiteness, §6C owns rank-eight uniqueness, §6D owns the rank-16 reference pair and its non-isometry, §6E owns the pairwise non-isometry of the twenty-four rank-24 lattices, §6G owns |O(E₈)| (native `TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice`), §7A owns proper/full masses, §7G and B8 own the direct small-rank masses, and §9B owns completeness from a distinct mass-saturating list. IntegralLattices §§3F, 7A and 7C also own the genus, the full mass and the local density over ℤ: §1.3 writes them on the Gram presentation of §0.0 (`SameGenus`, `genusMass`, `localDensity`) only so that the arbitrary-genus formula can be stated, and GeometryOfNumbersAndQuadraticArithmetic §3.3.3 owns the mass of a positive-definite genus over a ring of integers, whose case ℤ is IntegralLattices §7A's. The twenty-four rank-24 lattices themselves are Tau Ceti's `RootfulNiemeierType.lattice` and `leechLattice`, constructed under Rank24LatticeConstructions Layers 3 and 6, which also own the root-sublattice theorem of every table row; this roadmap constructs none of them. CFSGBasicProperties P2-L owns the isometry group `Co0 := Aut(Λ)` of that Leech lattice and its order, and the identification of the M₂₄ permutation model with the permutation automorphism group of the extended binary Golay code; SporadicOrders O1 owns the order 244823040 of that model. RootSystems Layer 5 owns the automorphism group of a root system as the Weyl group complemented by the based diagram automorphisms, with its integral-lattice-preserving subgroups, and Layer 6 §6.1 the decomposition into irreducible components. The Weyl group orders of type Aₙ, for every rational root system of that type, and of the pinned root datum of type E₈ are native (`RootPairing.card_weylGroup_of_hasCartanType_A`, `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum`); no supplier states those of types Dₙ (n ≥ 4), E₆ and E₇ as targets, and this roadmap owns them, together with the transport of the E₈ order to every rational root system of type E₈ (§4.1). IntegralLattices §6G uses |W(E₇)| and |W(D₆)| only as steps of its orbit count for |O(E₈)|. OrthogonalSpinGroups §3A assigns the algebraic Spin groups and approximation applications here; its Layers 0–3 supply the native point groups. GeometryOfNumbersAndQuadraticArithmetic §3.3 owns the number-field orthogonal Tamagawa value and shared gauges, the mass gauge `compactOrthogonalGaugeVolume` included, and its maximal-lattice specialization stops short of the rational arbitrary integral genera treated here. Its §3.3.4, the proper mass identity, owns the decomposition of the adelic quotient of SO of a totally positive form over a totally real field, ℚ included, into double cosets of an integral stabilizer, each weighted by the reciprocal order of its proper integral stabilizer, and the resulting volume; its 2.4.6 owns the element of determinant −1 in every local integral stabilizer of positive rank. §1.1 transports §3.3.4 at K = ℚ to the native classes of IntegralLattices (the decomposition IntegralLattices labels 7B) and does not construct it again. TauberianBoundaryConvergence N2/N3 owns the ordered endpoint theorem; this roadmap constructs its same-form arithmetic application. ImaginaryQuadraticClassNumber H1.4 owns the imaginary order-conductor sequence and H2.2 owns the quadratic zeta comparison and imaginary analytic class-number formula. ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”, owns the strict real order-class/regulator identity. Here the additional work is their transport to the same lattice, character, genus and density, together with the ordinary/narrow field normalization. GeometryOfNumbersAndQuadraticArithmetic §3.3.7 owns finite orthogonal-group orders, including characteristic two; §0.1a identifies the quadratic-preserving residue schemes used by Cho with those groups.

The comparison of Tamagawa numbers along an arbitrary central isogeny 1→Z→G′→G→1 of connected reductive groups over a number field (local and adelic lifting obstructions, rational and adelic images, the finite cohomological defect, character-lattice and gauge-Jacobian factors, and the resulting quotient-volume formula) is not part of this roadmap and nothing here consumes it. No roadmap on main or earlier in the merge order owns it: AdelicAlgebraicGroups AA.2 supplies quotient integration and the normalized Tamagawa measure only, and EndoscopicTransferAndUnitaryTraceComparison §6.5 gives scoped Kottwitz ratios only. It is an extension in the direction of AdelicAlgebraicGroups, whose Part II is its home. Its data are not finite in general: for the squaring isogeny of G_m over ℚ the rational cokernel ℚ×/ℚ×² is infinite and the adelic image is not open (AdelicAlgebraicGroups AA.1.3), so any such formula must name the finite defect groups it uses. The mass formulas here use only the direct orthogonal value of §1.3 (`orthogonalTamagawa_two` with the §§1.1–1.2 comparisons); neither τ(Spin) = 1 nor |μ₂| is used as a substitute for that value.


## Conventions

Use native `TauCeti.IntegralLattice` over ℚ, with symmetric bilinear form B integral on the lattice. Write Q(x)=B(x,x)/2 for the half-norm; it is integral exactly when the lattice is even. All positive-definite class sets below classify full integral isometries, not determinant-one isometries. A Gram matrix acts on column vectors, so its isometry equation is AᵀBA=B. The scheme convention M B Mᵀ=B is transported by M↦M⁻ᵀ. Gram representatives use `Fin n → ℚ` and therefore a fixed small universe. The rank-zero empty matrix has determinant 1 and one automorphism. The normalizer construction of Spin is used only in positive rank; Spin of the zero space means the trivial group.

For local densities use the stabilized bilinear matrix count of IntegralLattices §7C, denoted α_p (`localDensity` in §1.3), and put β_p=α_p/2 in positive rank. This division by two is a density normalization, not an assertion that every integral stabilizer contains a determinant-minus-one element. Every determinant, local density and Haar volume used as a denominator below is positive; number-field quadratic spaces are nondegenerate and local residue fields have cardinality at least two.

## Exact supplier contracts

### From Mathlib

Use `Matrix.PosDef`, integral matrix multiplication, determinant and nonsingular inverse for the small Gram presentation; `QuadraticForm`, `CliffordAlgebra`, `lipschitzGroup`, `spinGroup` for point comparisons. Use `Real.Gamma` for real factors, with `Real.Gamma_one_half_eq` and `Real.Gamma_add_one` for its values at half-integers; `bernoulli`, `bernoulli_one`, `sum_bernoulli`, `bernoulliPowerSeries_mul_exp_sub_one` for the Bernoulli convention and recurrence; and `riemannZeta_two_mul_nat` for the even zeta values in terms of Bernoulli numbers. The genus, local density and Euler product of §1.3 use `PadicInt` (ℤ_p), `ZMod`, `Filter.limUnder` and unconditional products `tprod` over `Nat.Primes`. The native Dirichlet-character conductor, complexification, analytic continuation and nonvanishing declarations consumed by §1.4 retain the nonzero-level and nontrivial-character hypotheses stated there.

### From Tau Ceti

Use `IntegralLattice.ofGramMatrix` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, `IntegralLattice.Isometry` and its group structure in `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Group.lean`, `IntegralLattice.IsPosDef.finite_isometry` in `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean`, `IntegralLattice.IsEven` and `IntegralLattice.IsUnimodular` in the corresponding Even and Unimodular modules. An integral lattice itself need not be positive definite; the Gram subtype in §0.0 carries that hypothesis. The split carriers `TauCeti.TypeBSpinCarrier.groupScheme` and `TauCeti.TypeDSpinCarrier.groupScheme` in the TypeB and TypeD SpinCarrier/Basic modules are also native; the missing comparison attaches a group scheme to an arbitrary nondegenerate form. The form-preserving and standard special orthogonal group schemes used in §0.1, and the character/order/discriminant/residue declarations used in §1.4, are consumed with their actual coefficient hypotheses. For a rational quadratic form, §1.1 uses the integral compact-open family `TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` of a basis (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/CompactOpen.lean`), its proper double-coset set `TauCeti.QuadraticMap.OrthogonalCompactOpens.finiteAdelicSpecialOrthogonalDoubleCoset`, the quotient of the finite adelic SO by the range of the rational diagonal on the left and the everywhere-integral subgroup on the right (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/DoubleCoset/Basic.lean`), and the full adelic group `TauCeti.QuadraticMap.OrthogonalCompactOpens.fullAdelicSpecialOrthogonal` with its unrestricted real factor (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/FullAdelic.lean`). Tau Ceti puts no Haar or Tamagawa measure on these groups.

The rank-24 lattices of §4.2 are native: `TauCeti.RootfulNiemeierType` with `RootfulNiemeierType.components_multiset_injective` in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/RootSystems.lean`; `RootfulNiemeierType.lattice`, `RootfulNiemeierType.isEven_lattice`, `RootfulNiemeierType.isPosDef_lattice`, `RootfulNiemeierType.finrank_lattice`, `RootfulNiemeierType.isUnimodular_lattice_iff`, `RootfulNiemeierType.isUnimodular_lattice_of_ne` and `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Niemeier.lean`; `TauCeti.leechLattice` with `isEven_leechLattice`, `isUnimodular_leechLattice`, `isPosDef_leechLattice` and `finrank_leechLattice` in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean`, and `minimum_leechLattice` and `vectorsOfNorm_two_leechLattice` in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Minimum.lean`; and `IntegralLattice.Isometry.map_span_vectorsOfNorm` in `TauCeti/LinearAlgebra/IntegralLattice/PosDef/RepresentationNumber.lean`. `RootfulNiemeierType.isUnimodular_lattice_of_ne` and `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` exclude the four rows A₁²⁴, A₂¹², D₄⁶ and A₁₁D₇E₆. For those rows unimodularity of the table lattice follows from `RootfulNiemeierType.isUnimodular_lattice_iff` and the glue-subgroup orders in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Glue/IdentifiedRows.lean`, while Tau Ceti has the root sublattices only of separately glued models (`span_vectorsOfNorm_two_a1TwentyFourthLattice`, `span_vectorsOfNorm_two_a2TwelfthLattice`, `span_vectorsOfNorm_two_d4SixLattice`, `span_vectorsOfNorm_two_a11d7e6Lattice`); the root-sublattice theorem for the table lattice of these four rows is consumed from Rank24LatticeConstructions Layer 3. `IntegralLattice.Isometry L M` allows different ambient spaces, so these lattices are compared with Gram lattices on `Fin 24 → ℚ` through §0.0.

The Weyl factors of Layer 4 are orders of root-pairing Weyl groups `RootPairing.weylGroup` of rational root systems. They use the following native declarations, each on the carrier named with it.

- `RootPairing.card_weylGroup_of_hasCartanType_A` in `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean` gives the order (n+1)! for a finite reduced crystallographic root system over ℚ with a base of Cartan type Aₙ, n ≥ 1.
- `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType` in `TauCeti/LinearAlgebra/RootSystem/Weyl/CartanType.lean` says that two finite reduced crystallographic root systems over the same characteristic-zero domain, with bases of the same Cartan type, have isomorphic Weyl groups.
- For a valid Dynkin type t, `TauCeti.DynkinType.rationalRootSystem` in `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Rational.lean` is a root system over ℚ with roots indexed by `Fin t.numRoots`, which has 72, 126 and 240 elements for E₆, E₇ and E₈ (`TauCeti.DynkinType.numRoots`). Its base `TauCeti.DynkinType.rationalBase` has Cartan type t (`TauCeti.DynkinType.hasCartanType_rationalRootSystem`), and by `TauCeti.DynkinType.rationalRootSystem_def` it is the entrywise base change to ℚ of the pinned integral root datum `TauCeti.DynkinType.simplyConnectedRootDatum`.
- `TauCeti.weylGroupBaseChangeEquiv` in `TauCeti/LinearAlgebra/RootSystem/Weyl/BaseChange.lean` identifies the Weyl group of a root pairing on `κ → R` with dot-product pairing with that of its entrywise base change, inducing the same permutations of the root indices (`TauCeti.weylGroupToPerm_weylGroupBaseChangeEquiv`).
- For n ≥ 4 the pinned datum of type Dₙ is `TauCeti.DynkinType.typeDSimplyConnectedRootDatum` in `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/D/Basic.lean` (`TauCeti.DynkinType.simplyConnectedRootDatum_D`), an integral root datum whose roots span only an index-four sublattice. Its k-th root and coroot are read off the classical root `TauCeti.DynkinType.typeDRootEquiv n hn k` (`TauCeti.DynkinType.root_typeDSimplyConnectedRootDatum`, `TauCeti.DynkinType.coroot_typeDSimplyConnectedRootDatum`). Here `TauCeti.DynkinType.TypeDRoot` in `TauCeti/LinearAlgebra/RootSystem/ClassicalTypeD.lean` is the set of vectors of `ℤⁿ` of squared length 2, and `TauCeti.DynkinType.typeDRootReflectionEquiv` is the reflection of that set in one of its vectors.
- `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum` in `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/E8/Automorphism.lean` gives 696729600 for the Weyl group of the pinned integral root datum of type E₈ (`TauCeti.DynkinType.simplyConnectedRootDatum_E8`).
- `RootPairing.weylGroupToPerm_injective` in `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean` says that the Weyl group of a root system acts faithfully on the root indices.
- `TauCeti.exists_mem_support_weylGroupToPerm_eq` in `TauCeti/LinearAlgebra/RootSystem/Weyl/Orbit/Basic.lean` says that every root is Weyl-conjugate to a simple root.
- `RootPairing.Base.pairingIn_highestRoot_nonneg` in `TauCeti/LinearAlgebra/RootSystem/HighestRoot.lean` says that the highest root `RootPairing.Base.highestRoot` pairs nonnegatively with every simple coroot.
- `RootPairing.parabolic_wallIndices_eq_stabilizer` in `TauCeti/LinearAlgebra/RootSystem/Weyl/ParabolicQuotient.lean` says, for a finite reduced crystallographic root pairing over a linearly ordered commutative ring whose flip is also reduced (as for every reduced system over ℚ, by Mathlib's `RootPairing.instFlipIsReduced`), that the stabilizer of a dominant weight is the standard parabolic subgroup of the Coxeter system `TauCeti.weylCoxeterSystem` (in `TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean`, for the Coxeter matrix `TauCeti.coxeterMatrixOfBase`) on the simple roots whose coroots vanish on it.
- `CoxeterSystem.parabolicHom` in `TauCeti/GroupTheory/Coxeter/Restriction.lean` is the homomorphism of Coxeter groups induced by a map of index sets along which two Coxeter matrices agree; it is injective (`CoxeterSystem.parabolicHom_injective`) and its image is the standard parabolic subgroup on the image of the map (`CoxeterSystem.range_parabolicHom`).

On the lattice side, `TauCeti.IntegralLattice.card_weylGroup_typeE₈RootLattice` and `TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice` in `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.lean` give 696729600 for the lattice Weyl group `IntegralLattice.weylGroup` (the subgroup of isometries generated by the reflections in norm-2 vectors) and for the full isometry group of the native E₈ lattice. They give |O(E₈)| (IntegralLattices §6G) and the rank-eight mass, not a Weyl factor of a root pairing. Tau Ceti states no Weyl group order of type Dₙ, E₆ or E₇.

### From TauCetiRoadmap.IntegralLattices

Consume §§0A–0E for the lattice/basis dictionary; §§2C/2G for finiteness; §§3C/3E/3I and §5A for local classification and Jordan data; §§4A–4C and N0–N1 for class, genus and proper spinor-genus carriers; §6C for rank-eight uniqueness, §6D for the rank-16 pair and its non-isometry, §6E for the pairwise non-isometry of the twenty-four rank-24 lattices (its statement for two table rows assumes that each row's root sublattice is the row's displayed root lattice), and §6G for |O(E₈)|; §§7A/7C/7E/7G for masses, stabilized local counts, sphere volumes and elementary ranks; B1–B4/B7/B8 for binary orders, genus maps and direct masses; §9B for the general exhaustion implication. The local count of §7C is consumed before the global analytic conclusion, so the mass evaluation does not enter its own premises.

### From TauCetiRoadmap.OrthogonalSpinGroups and TauCetiRoadmap.ReductiveGroups

Consume OrthogonalSpinGroups Layers 0–3 for native point groups, spinor norms, compact-open reference families and rational diagonals. Consume ReductiveGroups Layers 0/3 for the affine Hopf/point dictionary, closed subgroup schemes and components, Layer 5 for unipotent groups, Layer 7a for the ordinary Frobenius Lang and quotient inputs, and Layers 6/8 for semisimplicity, central isogenies, descent and the split root-datum classification. The arbitrary-form Spin instance is constructed in §0.1.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume AA.1–4, specifically AA.2.4's normalization `|d_K|^(-dim G/2) rho_G^(-1) product_v lambda_v |omega|_v`, additive volume one on 𝒪_v, dx at real places, 2 dx dy at complex places, and counting measure on rational points. AA.4.2 supplies strong approximation for simply connected semisimple groups when each almost-simple factor has noncompact product over S. Retain finite-change and away-S reference maps from AA.1.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §§2.4/3.3, in particular `orthogonalTamagawa_two`, `orthogonalPinnedGaugeJacobian`, `compactOrthogonalGaugeVolume` and `orthogonalIntegralRealGaugeCompatibility`, for nondegenerate number-field forms of rank at least three. The mass gauge is §3.3's: `orthogonalMassGaugeScale n` times the measure of total volume Vₙ of IntegralLattices §7E, so that `compactOrthogonalGaugeVolume` is that scale times Vₙ. Consume §3.3.4, the proper mass identity: for a totally positive form q over a totally real field K, ℚ included, G = SO(q), K_f the integral stabilizer of a lattice in its finite adelic genus, and compatible product Haar measures whose product vol(K_f) converges, the proper mass is vol(G(K)\G(𝔸))/(vol(G(K_∞))·vol(K_f)), each double coset contributing the reciprocal order of its proper integral stabilizer; no rank is excluded, and the numerator is not replaced by 2 there. Consume §2.2 `IntegralQuadraticLattice.ofCarrier` for the integral quadratic lattice on which §3.3.4 is stated, and 2.4.6: over a discrete valuation ring whose fraction field has characteristic different from 2, residue characteristic two included, every integral stabilizer of a lattice of positive rank on a nondegenerate quadratic space contains a reflection, of determinant −1, in a vector of least valuation of the form. Consume §3.3.7 “Reductive-quotient orders and canonical local volume”, specifically `finiteOrthogonalOrder`, for the split/nonsplit even and odd quadratic-group finite-point orders, retaining disconnected components. The maximal-lattice numerical theorem has totally real degree at least two, total positivity and maximality hypotheses; it is not the arbitrary rational-genus formula.

### From TauCetiRoadmap.GlobalNumberFields and TauCetiRoadmap.TauberianBoundaryConvergence

Consume GlobalNumberFields §9's conductor/parity-compatible Hecke/Dirichlet dictionary and the native quadratic order maps. Consume TauberianBoundaryConvergence N2/N3's increasing-prime endpoint, cofinal cutoff and finite-deletion comparisons. No unordered product at s=1 is imported.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber and TauCetiRoadmap.ArithmeticStatisticsPartV

Consume ImaginaryQuadraticClassNumber H1.4's imaginary conductor sequence and order class-number formula, with the actual unit index at every conductor, and H2.2's quadratic ideal-coefficient/zeta comparison and imaginary class-number formula, including unit orders 6 and 4. Consume ArithmeticStatisticsPartV, “Siegel count of indefinite binary quadratic forms”, for the primitive strict form/order comparison and the positive norm-one regulator identity at every real quadratic order. In §1.4c these inputs retain primitive invertible ideal classes, Δ=f²D, f≥1, and nonsquare field discriminant D; they do not give a comparison with a single lattice genus or its local-density measure.

### From TauCetiRoadmap.RootSystems

Consume RootSystems Layer 5 (§§5.1–5.3) for the complement of the Weyl group by the based diagram automorphisms and for the subgroups preserving given integral lattices, including permutations of isomorphic components, and Layer 6 §6.1 for the decomposition into irreducible components; these are the root and glue stabilizer inputs of Layer 4. The only type-specific Weyl group orders in RootSystems are the (n+1)! of type A in §3.2 and the rank-two dihedral orders, and both are native. It gives none for types Dₙ, E₆, E₇ or E₈. The other root-side factors are as follows. |W(E₈)| is native for the pinned root datum of type E₈ (`TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum`), and §4.1 transports it to every rational root system of type E₈; the lattice-side |O(E₈)| is IntegralLattices §6G. The orders of W(Dₙ), W(E₆) and W(E₇) are targets of §4.1. The classification of root systems is not an input: every root system in Layer 4 comes with an explicit base of known Dynkin type, and its diagram symmetries are the symmetries of that base's Cartan matrix. Exact lattice automorphism orders are conclusions here, not entries assumed from a root table.

### From TauCetiRoadmap.Rank24LatticeConstructions

Consume Layer 3 for the twenty-three table lattices N_r with their evenness, unimodularity, positive definiteness, rank 24 and literal root-sublattice theorem (every norm-2 vector of N_r lies in the displayed root lattice R_r, whose roots span it), the last in particular for the four rows A₁²⁴, A₂¹², D₄⁶ and A₁₁D₇E₆ that the native statement excludes; Layer 4 for the coordinate permutation carrying the glue group of the A₁²⁴ row to the extended binary Golay code of AlgebraicCodingTheory Layer 5; Layer 5 for the lattice isometry induced by a componentwise root-lattice isometry and permutation of equal-type components that carries one glue subgroup to another; and Layer 6 for the Leech lattice by Construction B with minimum 4 and no roots. That roadmap states no automorphism group and no non-isometry or completeness theorem; these are §4.2's, CFSGBasicProperties P2-L's (for the Leech lattice) and IntegralLattices §6E's.

### From TauCetiRoadmap.CFSGBasicProperties

Consume P2-L, “Leech and Conway bridges”, for the isometry group `Co0 := Aut(Λ)` of the Leech lattice of Rank24LatticeConstructions Layer 6 (the native `leechLattice`): its finiteness from the faithful action on the 196560 minimal vectors, its generation by the Conway generators, and its order 8315553613086720000 = 2·|Co1|. Consume also P2-L's equivalence between the M₂₄ permutation model of its P1 and the full permutation automorphism group of the extended binary Golay code of AlgebraicCodingTheory Layer 5, compatible with the actions on the 24 coordinates. §4.2 uses only this equivalence and the order of `Co0`; the other group-theoretic identifications of P2-L (the Co1 recognition, the mod-two module and the Co2 stabilizer) are not consumed.

### From TauCetiRoadmap.SporadicOrders

Consume O1 for the order 244823040 of the M₂₄ permutation model, the subgroup of `Equiv.Perm (Fin 24)` generated by the two permutations of its named ATLAS file. §4.2 uses it, through the CFSGBasicProperties P2-L equivalence, as the order of the automorphism group of the extended binary Golay code.

## How to read the build

Layer 0 fixes the small Gram presentation, algebraic groups and point comparisons; its approximation branch is independent of masses. Layer 1 transports the supplied proper mass identity to native lattice classes, compares gauges and states the density identity, with a separate binary analytic branch. Layer 2 evaluates the arbitrary dyadic factors and assembles the numerical formula. Layer 3 specializes it to even unimodular lattices. Layer 4 proves the Weyl group orders of types Dₙ, E₆ and E₇, transports the native E₈ order to rational root systems, applies the supplied exhaustion implication to proved automorphism orders and derives the class-count bounds.

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

Construct the group-scheme/point comparisons between OrthogonalSpinGroups' native Spin and SO point groups and the ReductiveGroups affine Hopf points of the §0.1 schemes, over the number field, its completions and its adeles. Retain matrix action, Spin projection, coefficient change, determinant, rational diagonals, continuity in both directions and compatibility with the AdelicAlgebraicGroups AA.1 integral models outside an explicitly proved finite exceptional set. Transport compatible reference tuples through finite-change and away-S identifications. A bare forward map or equality of abstract groups is insufficient.


Prove the finite-prime lattice stabilizers compact open on these exact point carriers, consuming IntegralLattices §4B and the completed-lattice embedding dictionary, and identify proper/full arithmetic stabilizers with native integral isometry groups.

This comparison is a deduction from the equations in §0.1, the point topologies and base-change maps of OrthogonalSpinGroups §§2B/3B–3D, and the restricted-product transport of AdelicAlgebraicGroups AA.1: matrix inversion and transpose are continuous on GL, and multiplication and inversion in the finite-dimensional Clifford unit algebra give the Spin comparison its subspace topology. Integral model compatibility follows by clearing the finitely many denominators of the chosen rational bases and of the coordinate formulas of the comparisons and their inverses; compact openness and the lattice dictionary then transport IntegralLattices §4B.

The matrix comparison from scheme points to column isometries is M↦M⁻ᵀ, with inverse A↦A⁻ᵀ. Its API consists of group multiplication, coefficient-change naturality, determinant and Spin projection commutation, and continuous inverse maps on local and restricted-product topologies.

*Needs:* §0.1; OrthogonalSpinGroups Layers 0–3; IntegralLattices §4B; AdelicAlgebraicGroups AA.1–2.

**Checks.**

- With C=diag(1,4) and M=[[0,1/2],[2,0]], MCMᵀ=C whereas MᵀCM=diag(16,1/4); A=M⁻ᵀ gives AᵀCA=C.
- Identity matrices map to identity matrices, and a diagonal reflection has determinant −1 on both sides; a map landing only in SO would lose it.
- For C=[2] at p=3 the stabilizer is {±1}, its determinant-one subgroup is {1}, and their finite Haar volumes have ratio 2. The full/proper distinction survives transport.

### 0.3 Approximation and Eichler applications

For rank n≥3 instantiate AdelicAlgebraicGroups AA.4.2 with a finite S containing all archimedean places and, for every almost-K-simple factor H, noncompact ∏_(v∈S) H(K_v). Prove rational Spin density in Spin(A^S) and the closure of its image in the same SO(A^S) equals the reference-controlled spinor kernel. Specialization to finite adeles requires these hypotheses for S=all archimedean places; a definite form may instead require finite places in S and does not thereby acquire the finite-adelic conclusion. Prove Eichler's theorem (the statement IntegralLattices labels 4D, owned here) and the indefinite rank≥3 class-finiteness application (the rank≥3 half of its 4E) separately. Keep definite forms and full-adeles distinctions. This lane is not a prerequisite of the positive-definite mass lane.

*Needs:* §0.1–0.2; AdelicAlgebraicGroups AA.4.2; IntegralLattices §§4A–4C and N0–N1, the class, proper-class and proper-spinor-genus interfaces. The Eichler conclusion is equality of proper classes and proper spinor genera for indefinite rational forms of rank at least three (O’Meara, 104:4–5).

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

The decomposition of SO(q)(K)\SO(q)(𝔸) into pieces indexed by the double cosets of an integral stabilizer, for a totally positive form q over a totally real field K, and the resulting proper mass identity are GeometryOfNumbersAndQuadraticArithmetic §3.3.4, the proper mass identity, which includes K = ℚ. This section transports that identity at K = ℚ to the native lattice classes of IntegralLattices; this transport is the decomposition IntegralLattices labels 7B.

Let L be a positive-definite native integral lattice of rank n with Gram matrix B in a basis b, V = ℚ ⊗ L, G = SO(V), K_p⁺(L) its integral proper stabilizers and K_f⁺(L) = ∏_p K_p⁺(L), as in IntegralLattices §4B. On the native side, G and K_f⁺(L) are the groups of the half-norm Q = B/2 with the integral family `TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` of b, and the proper double-coset set of IntegralLattices §4B is `TauCeti.QuadraticMap.OrthogonalCompactOpens.finiteAdelicSpecialOrthogonalDoubleCoset`. On the supplier side let L_ℤ be the integral quadratic ℤ-lattice of GeometryOfNumbersAndQuadraticArithmetic §2.2 `IntegralQuadraticLattice.ofCarrier` with the carrier of L and the form q(x) = B(x,x), which is integral on L, whereas Q need not be. Over ℚ, every ℚ_p and ℝ the forms B, q and Q have the same isometries, so both sides have the one group SO(V). Through the point comparisons of §0.2 over ℚ, the ℚ_p, ℝ and the finite adeles, construct a bijection from the native proper double-coset set SO(V)(ℚ)\SO(V)(𝔸_f)/K_f⁺(L) onto the double cosets G(ℚ)\G(𝔸_f)/K_f of §3.3.4 for L_ℤ, and prove:

- it carries the range of the rational diagonal onto G(ℚ) and K_f⁺(L) onto §3.3.4's integral stabilizer K_f of L_ℤ, and it does not depend on the chosen representatives;
- for the double coset of g, with lattice M = V ∩ ⋂_p g_p L_p, it identifies the arithmetic stabilizer G(ℚ) ∩ g K_f g⁻¹ with the native group SO(M) of determinant-one integral self-isometries of M, finite by IntegralLattices §2C, so that the double coset contributes 1/|SO(M)|;
- composed with the bijection of IntegralLattices §4B, it sends each proper class in the genus of L to the double coset whose lattice M lies in that class.

Deduce the proper mass identity on native classes. For the compatible product Haar measures of §3.3.4 on SO(V)(ℝ) and the SO(V)(ℚ_p), with ∏_p vol(K_p⁺(L)) convergent, and the quotient measure of AdelicAlgebraicGroups AA.2 on the adelic quotient,

    m⁺(gen L) = vol(SO(V)(ℚ) \ SO(V)(𝔸)) / (vol(SO(V)(ℝ)) · ∏_p vol(K_p⁺(L))),

with m⁺ the proper mass of IntegralLattices §7A. No rank is excluded. The numerator is not replaced by τ(SO) = 2 here; §1.3 does that in rank at least three (Belolipetsky–Gan v2, §2, p.3, for the indexing of a genus by these double cosets and the mass as a quotient volume in the totally definite case).

*Needs:* §0.2; IntegralLattices §§2C/4B/7A; GeometryOfNumbersAndQuadraticArithmetic §2.2 `IntegralQuadraticLattice.ofCarrier` and §3.3.4, the proper mass identity; AdelicAlgebraicGroups AA.1–2 for adelic points and quotient measures; Tau Ceti `TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` and `TauCeti.QuadraticMap.OrthogonalCompactOpens.finiteAdelicSpecialOrthogonalDoubleCoset`.

**Checks.**

- A₂, with B=[[2,−1],[−1,2]], is alone in its genus and has |O(A₂)|=12 and |SO(A₂)|=6. Its proper double-coset set is one point, of weight 1/6, so m⁺=1/6=2·(1/12), as IntegralLattices §7A requires. Transporting the stabilizer as O(M) would give 1/12.
- In the genus of B=[[4,1],[1,6]], the class of [[4,1],[1,6]] has O(M)=SO(M)={±1} and gives two points of the proper double-coset set, each of weight 1/2, while the class of [[2,1],[1,12]] has |O(M)|=4, |SO(M)|=2 and gives one. So there are three points and m⁺=3/2=2·(3/4). A bijection onto the full double cosets O(V)(ℚ)\O(V)(𝔸_f)/K_f(L) would see two points.
- For L=ℤ³ with B=I₃, let k∈K_f⁺(L) be the rotation block [[3/5,−4/5],[4/5,3/5]]⊕1 at 3 and the identity elsewhere: it has determinant 1, squared column length 9/25+16/25=1, and 5 is a unit of ℤ₃. The classes of 1 and k in SO(V)(ℚ)\SO(V)(𝔸_f) are distinct, since a rational γ equal to 1 at every p≠3 is 1, but their double cosets coincide, matching the single class of ℤ³. Without the right quotient by K_f⁺(L) the transport would not land in the class set.
- For L=ℤ³ the half-norm Q=B/2 has Q(e₁)=1/2∉ℤ, so (ℤ³,Q) is not an integral quadratic lattice for §3.3.4, while q(x)=B(x,x) has q(e₁)=1. The supplier side uses q.
- In rank zero the quotient and stabilizer are singletons and m⁺=1; the positive-rank relation m⁺=2m does not extend there.

### 1.2 Gauge and local-density transport

Transport `orthogonalPinnedGaugeJacobian` and `orthogonalIntegralRealGaugeCompatibility` to the B and B/2 conventions. For rank n ≥ 3 let Vₙ be the sphere-fibration volume of SO(n) of IntegralLattices §7E for the metric making E_ij − E_ji orthonormal. The pinned mass gauge of GeometryOfNumbersAndQuadraticArithmetic §3.3 is `orthogonalMassGaugeScale n` = sₙ times this measure, where sₙ = 2^(−⌊n/2⌋) in odd rank and sₙ = 1 in even rank, so its `compactOrthogonalGaugeVolume` is sₙ·Vₙ; both are consumed, not proved again. In particular V_3=8π² while the rank-three mass-gauge volume is 4π². Keep this pinned-gauge scalar distinct from the B versus B/2 coefficient transport and from the global integral/real gauge compatibility. Identify the local Haar density with the stabilized bilinear count of IntegralLattices §7C, including the determinant-component index and every factor of two. Do not declare vol(K_p) = α_p without this Jacobian theorem. Prove model-independence and form-twist transport with the gauge scaling and global product formula. State measure equality before substituting any numerical value of τ.

For a positive-definite integral Gram matrix B of rank n≥3, write D=det B>0, d=n(n−1)/2, and Rₙ=π^(−n(n+1)/4)∏_(j=1..n)Γ(j/2). Let v∞ and v_p be the volumes of SO(B)(ℝ) and K_p⁺(L) in the local measures whose product is the specified Tamagawa measure. Construct the local change-of-gauge maps and prove the combined Jacobian identity

    v∞ · product_p v_p = product_p beta_p / (2 R_n D^((n+1)/2)).

At finite primes the comparison includes the index [K_p:K_p⁺], which is 2 at every p, p = 2 included, in positive rank: GeometryOfNumbersAndQuadraticArithmetic 2.4.6, applied over ℤ_p to the form q(x)=B(x,x), which is integral on L, supplies a reflection of determinant −1 in K_p, and IntegralLattices §7C turns it into the index. It is not inferred from the definition of β_p. The gauge identity includes the B versus B/2 transport and the product formula. It is not the assertion v_p=β_p. Both products converge in the rank range here (Conway–Sloane, equations (2), (3), (6); Belolipetsky–Gan v2, §2, p.3, for the real gauge).

*Needs:* §1.1; IntegralLattices §§3C/3I/7C/7E; GeometryOfNumbersAndQuadraticArithmetic §3.3 gauge/Jacobian contracts with `orthogonalMassGaugeScale`, and its 2.4.6 for the determinant −1 element; AdelicAlgebraicGroups AA.2.4 and the number-field product formula. Closed dyadic evaluations are supplied by Layer 2, independently of this measure comparison.

**Checks.**

- Rank three has V₃=8π² and s₃=1/2, giving gauge volume 4π²; rank four has V₄=16π⁴ and s₄=1, giving 16π⁴.
- Replacing B by tB for positive integer t preserves all integral isometries; D changes by tⁿ and β_p changes by p^(v_p(t)·n(n+1)/2), cancelling D^((n+1)/2) in the global formula.
- For U=[[0,1],[1,0]] at 2, reflection in (1,1) is [[0,−1],[−1,0]], integral with determinant −1. Its norm is 2; requiring unit norm would miss this local determinant-component witness.

### 1.3 Arbitrary-genus mass identity

For every positive-definite integral lattice L over ℤ of rank n≥3 with nondegenerate Gram matrix B, identify its full genus mass with

    m_full(gen L) = tau(SO(B)) / (2 v_infinity product_p v_p).

First prove this measure identity using §1.1 and IntegralLattices §7A. Then use GeometryOfNumbersAndQuadraticArithmetic §3.3's value τ(SO(B))=2 and §1.2 to obtain

    m_full(gen L) = 2 R_n (det B)^((n+1)/2) product_p beta_p(L)^(-1).

The real power uses det B>0. The finite bad-prime set is S={p : p divides 2 det B}; β_p is the positive stabilized bilinear density α_p/2 at every prime, including S. At p ∉ S the factor β_p is the unramified value of IntegralLattices §7C, ∏_(i=1..m)(1 − p^(−2i)) for n = 2m+1 and (1 − ε p^(−m))∏_(i=1..m−1)(1 − p^(−2i)) for n = 2m, with ε the Legendre symbol of (−1)^m·det B at p, so for n ≥ 3 every factor differs from 1 by O(p^(−2)) and the product converges absolutely; §2.3 collects the good factors into zeta and L-values and evaluates the bad ones. So this is a formula for every integral genus, with no maximality or unimodularity restriction (Conway–Sloane, equations (2), (3), (6)).

Rank zero has full mass 1, rank one has full mass 1/2 and proper mass 1, by IntegralLattices §7G. Positive rank two uses the independent binary ideal-class/norm-torus comparison of §1.4; the same numerical density expression then holds with R₂=1/π and the increasing-prime convention, not from the rank≥3 Tamagawa theorem.

The second display is stated on the Gram presentation of §0.0 through three definitions. They present IntegralLattices' genus (§3F), full mass (§7A) and local density (§7C) on `PositiveGram n` and `GramClass n`; they are not new carriers, and their API is the comparison with those. GeometryOfNumbersAndQuadraticArithmetic §3.3.3 defines a mass under the same name over a ring of integers; over ℤ it is IntegralLattices §7A's full mass, and so agrees with the one below.

Define `SameGenus G H`, for G and H in `PositiveGram n`, to hold when for every prime p some A ∈ Mₙ(ℤ_p) with unit determinant satisfies AᵀGA = H over ℤ_p. Both matrices are positive definite of rank n, so their real signatures already agree.

- `SameGenus` is an equivalence relation on `PositiveGram n`, and `GramEquivalent G H` implies `SameGenus G H`; so it descends to `GramClass n`.
- `SameGenus G H` holds exactly when `nativeLattice G` and `nativeLattice H` lie in one genus in the sense of IntegralLattices §3F.
- Matrices in one genus have the same determinant and the same parity: det H = (det A)²·det G with det A a unit of every ℤ_p and both determinants positive, and an isometry over ℤ₂ preserves B(x,x) mod 2.

**Checks.**

- In rank one `SameGenus [a] [b]` holds only for a = b, since b/a would be a positive rational that is a unit of every ℤ_p. So [1] and [2] lie in different genera, and so do [1] and [9], although 9 is the square of the unit 3 of every ℤ_p with p ≠ 3, ℤ₂ included, and a square in ℚ: only p = 3 separates them, so a genus defined over the ℚ_p would merge them.
- I₈ and the Gram matrix of E₈ are congruent over ℤ_p for every odd p, and over every ℚ_p, but not over ℤ₂, where E₈ is even and I₈ is odd. A definition that omitted p = 2, or used ℚ_p in place of ℤ_p, would put them in one genus.
- The Gram matrices of E₈ ⊕ E₈ and D₁₆⁺ of IntegralLattices §6D lie in one genus but are not integrally congruent: the genus is coarser than the class.

Define `genusMass G` as the sum of the reciprocals of `classAutomorphismOrder c` over the classes c in `GramClass n` that contain a matrix in the genus of G.

- The index set is finite by IntegralLattices §2G, so the displayed infinite sum is a finite sum of positive rationals and `genusMass G` is positive.
- `SameGenus G H` implies `genusMass G = genusMass H`.
- `genusMass G` is the full mass of the genus of `nativeLattice G` in the sense of IntegralLattices §7A.

**Checks.**

- In rank zero the empty matrix forms the only class, of weight 1, so `genusMass` is 1.
- The genus of [[4,1],[1,6]] consists of the full classes of [[2,1],[1,12]] and [[4,1],[1,6]], with |O| = 4 and 2, so `genusMass` is 1/4 + 1/2 = 3/4. Giving each of the three proper classes the weight 1/2 would give 3/2.
- The genus of I₃ is the single class of I₃, with |O(ℤ³)| = 2³·3! = 48, so `genusMass` is 1/48; for E₈ it is 1/696729600.

Define `localDensity G p` as the limit, as r → ∞, of p^(−r·n(n−1)/2) times the number of X ∈ Mₙ(ℤ/p^r) with XᵀGX ≡ G (mod p^r). This is α_p of the Conventions, and β_p = `localDensity G p`/2 in positive rank.

- For symmetric G with det G ≠ 0 and every prime p, p = 2 included, the normalized count is constant from some level on (IntegralLattices §7C), so `localDensity G p` is that constant, a positive rational. For odd p not dividing det G and n ≥ 1 it is §7C's unramified value: 2∏_(i=1..m)(1 − p^(−2i)) for n = 2m+1, and 2(1 − ε p^(−m))∏_(i=1..m−1)(1 − p^(−2i)) for n = 2m, with ε the Legendre symbol of (−1)^m·det G at p.
- It depends only on the ℤ_p-congruence class of G, so `SameGenus G H` gives `localDensity G p = localDensity H p` at every prime.
- For a positive integer t the density of tG is p^(v_p(t)·n(n+1)/2) times that of G: at level r the condition for tG is the condition for G at level r − v_p(t), and each solution modulo p^(r−v_p(t)) lifts in p^(v_p(t)·n²) ways.

**Checks.**

- For ⟨1⟩ at 2, x² ≡ 1 (mod 2^r) has 4 solutions for r ≥ 3, so the density is 4; ⟨2⟩ at 2 gives 8 and U = [[0,1],[1,0]] at 2 gives 4, the values of §2.2; ⟨1⟩ at an odd prime gives 2.
- I₃ has 6144 and 49152 solutions at levels 3 and 4 modulo powers of 2, and 48 and 1296 at levels 1 and 2 modulo powers of 3. Its densities are therefore 12 at 2 and 16/9 = 2(1 − 3⁻²) at 3. Normalizing by p^(r·n(n+1)/2) instead would send both sequences to 0.
- The empty matrix has density 1 at every prime, not 2, since its count is 1 at every level: the division by 2 in β_p is a positive-rank normalization.

The headline `genusMass_eq` is the second display on this presentation: for n ≥ 3 and every G in `PositiveGram n`, the real number `genusMass G` equals 2·π^(−n(n+1)/4)·∏_(j=1..n) Γ(j/2)·(det G)^((n+1)/2)·∏_p (`localDensity G p`/2)⁻¹, the product running over all primes and converging absolutely, by the unramified values of IntegralLattices §7C.

*Needs:* §§0.0/0.2/1.1/1.2; IntegralLattices §§2G/3F/7A/7C; GeometryOfNumbersAndQuadraticArithmetic §3.3 `orthogonalTamagawa_two`; for the statement, Mathlib `PadicInt`, `ZMod`, `Filter.limUnder`, `Real.Gamma` and unconditional products over `Nat.Primes`. The binary branch instead needs §1.4 and IntegralLattices B7/B8.

**Checks.**

- For I₃, 2R₃ = 1/π², D = 1, β₂ = 6 and the good product is ∏_(p odd)(1 − p⁻²)⁻¹ = (3/4)ζ(2) = π²/8, so the right side of `genusMass_eq` is (1/π²)·(1/6)·(π²/8) = 1/48, the `genusMass` of I₃.
- The rank hypothesis is needed. For ⟨1⟩ in rank one, R₁ = 1, β₂ = 2 and β_p = 1 at odd p, so the expression is 2·(1/2) = 1, whereas the full mass is 1/2 (IntegralLattices §7G): in rank one SO is trivial and its Tamagawa number is 1, not 2. In rank two the good product ∏(1 − χ(p)/p)⁻¹ converges only in the increasing-prime order of §1.4, not absolutely.
- For A₂, D=3, β₂=6, β₃=6 and the good product is (3/2)L(1,χ₋₃); with L(1,χ₋₃)=π/(3√3), the expression gives (2/π)·3√3·(1/36)·π/(2√3)=1/12.
- For B=[[4,1],[1,6]], D=23, β₂=2, β₂₃=46 and the good product is L(1,χ₋₂₃)/2; with L(1,χ₋₂₃)=3π/√23 the expression gives (2/π)·23√23·(1/92)·3π/(2√23)=3/4.
- For E₈, D=1, the dyadic factor β₂ is 2⁸ times its good-factor expression. Thus the product is 2⁻⁸ζ(2)ζ(4)²ζ(6); 2R₈=135/(8π¹⁶) gives 1/696729600.

### 1.4 Binary quadratic analytic normalization

Construct the rank-two analytic endpoint independently of the rank≥3 orthogonal
value and the AdelicAlgebraicGroups split-measure lanes. The positive binary class-count mass remains
IntegralLattices B8's algebraic theorem; the comparison below is required when identifying
its value with local Euler factors. Preserve the indefinite real/narrow/regulator
comparison and the distinct split branch. None follows from a rank ≥ 3 theorem on τ.

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
`Δ ≡ 0 or 1 mod 4`, and agreement via `g=2g_half` in the even case. A half-norm
of an odd lattice is not silently an integral classical form. Cancel content in
the integral polynomial isometry equations: for the primitive polynomial the
integral polar matrix is `2B/g`; `B/g` need not be integral (A₂ is a test). Use
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
with its square-root and rational-nonsquare data. Only these same-form/field
transport and local dyadic/order dictionaries are new adapters. The `D=1` split
algebra uses the native trivial case and remains separate from a quadratic
number field. Existing native Gauss-sum/fixed-field comparisons may supply
cyclotomic field identification at their exact hypotheses; they are not needed
as a late class-field-theory premise of this endpoint.
Compare the finite-order Hecke character over ℚ through GlobalNumberFields §9's actual conductor-
and parity-compatible dictionary, including ideal values and the real sign.
This adapter does not require global class field reciprocity or a new character
carrier. For a changed level or finite excluded prime set use native
`LFunction_changeLevel` with its `χ≠1 ∨ s≠1` and nonzero-level hypotheses; prove
the finite deleted factors individually nonzero at 1.

The adapter has source nondegenerate integral binary Gram lattices with a chosen orientation and target primitive integral binary forms, their quadratic orders and native fundamental characters; content is retained as a separate positive integer. Prove that orientation-preserving integral basis changes induce proper form equivalences and order-ideal correspondences; orientation reversal induces conjugation. Coefficient change commutes with the field and local-form comparisons.

*Needs:* §0.0; IntegralLattices B1/B2; GlobalNumberFields §9; native fundamental-discriminant characters, their conductor and field-discriminant theorems cited above.

**Checks.**

- A₂ with B=[[2,−1],[−1,2]] has norm content 2, primitive form (1,−1,1), half-norm content 1, and Δ=−3 by both formulas.
- B=diag(1,1) has primitive norm (1,0,1), Δ=−4 and half-norm (x²+y²)/2, which is not an integral form.
- B=[[4,1],[1,6]] has norm content 2, primitive form (2,1,3), Δ=−23 and conductor 1; replacing B by 2B changes the content to 4 and leaves Δ unchanged.

**1.4b Native endpoint application.** Consume TauberianBoundaryConvergence N2/N3
on the actual primitive native `χ_D` constructed in §1.4a, or its explicitly changed
level. Retain `[NeZero N]`, `χ≠1`, native `differentiable_LFunction` and
`LFunction_ne_zero_of_one_le_re` on the entire closed half-plane. N3 uses the
existing coefficient `χ(n)Λ(n)/Real.log(n)`, its 0/1 cases and prime-power bound,
normalized local analytic-log patching, the N2 ordinary endpoint and the absolute
higher-prime-power removal. No second logarithm/Tauberian engine is owned here.
Its exact output is `Tendsto` of finite increasing-prime products outside `S` to
`LFunction χ 1 * ∏ p∈S, (1−χ(p)/p) ≠ 0`. The cutoff comparison, conductor change,
finite deletion factors and real positivity for quadratic `χ_D` are mandatory.
No unordered `HasProd`/`HasSum` or totalized `LSeries` value at 1 is substituted.

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

The ordinary/narrow field normalization is a deduction from `NumberFieldOrder.card_narrowPic` in `TauCeti/NumberTheory/NumberField/Global/Orders/NarrowPic/Kernel.lean` and `TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator` in `TauCeti/NumberTheory/NumberField/Units/Regulator/Basic.lean`: if the unit signatures have order s∈{2,4}, then h⁺/h=4/s and R⁺/R=s/2, hence h⁺R⁺=2hR. These identities are on finite ideal-class carriers; a total `Nat.card` identity alone is not a finiteness proof. The logarithm of η^a is a log σ(η), so the index of a subgroup of positive units multiplies its regulator by that same positive integer a. These deductions specify the real normalization used in the same-lattice comparison.

Require `Δ=f²D` and the actual primitive/invertible ideal hypotheses; no number-
field theorem is applied to the split product order. Transport these identities
through IntegralLattices B2/B3/B4's actual proper-form/ideal, unit and principal-genus maps,
retaining the square-subgroup index so B8 uses the number of proper classes in
one genus, not the full class number. The maximal-field case reuses native
`isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` with its actual
squarefree generator and prime-discriminant data; it is not a theorem about
every nonmaximal order. The nonmaximal comparison retains IntegralLattices B3’s genuine
conductor-local/form-to-ideal genus construction, including dyadic conditions,
before transporting its square-subgroup count. Prove the density finite-set `S` and the
order-conductor exclusions agree by their explicit factors. The local `B` versus
`B/2`, O versus SO and real angular/logarithmic measure scalars are the separate
compatibility theorem of §1.2 and IntegralLattices B7, not consequences of this Dirichlet endpoint.

In the square split case the normalized good product reduces to
`∏_(p≤N,p∉S)(1−1/p)⁻¹` and diverges to positive infinity. Prove divergence from
the finite Euler expansion dominating the harmonic sum after discarding a fixed
finite factor; do not apply nontrivial-character continuation. The modulus-one
idele quotient and the split order of conductor `f` remain IntegralLattices B7's distinct
algebraic/measure targets. Rank 0 and rank 1 retain their elementary branches.
The nonsplit endpoint, the class-number/residue comparison, and the direct
positive binary mass are three separate outputs with explicit connecting maps.

The compulsory calibrations are A₂: primitive polynomial `(1,−1,1)`,
`Δ=−3`, `h=1`, `w=6`, full mass `1/12`; and Gram `[[4,1],[1,6]]`:
polynomial content 2, primitive `(2,1,3)`, `Δ=−23`, `h=3`, `w=2`, full genus
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

Layer 0, IntegralLattices §§2C/2G/3/4B/7A/7C/7E and B1–B8, AdelicAlgebraicGroups AA.1–2, GeometryOfNumbersAndQuadraticArithmetic §2.2, 2.4.6 and §3.3 with its §3.3.4, Tau Ceti's integral compact-open family and proper double-coset set, GlobalNumberFields §§9/11, TauberianBoundaryConvergence N2/N3, ImaginaryQuadraticClassNumber H1.4/H2.2, ArithmeticStatisticsPartV “Siegel count of indefinite binary quadratic forms”, and the native analytic/arithmetic declarations named above.

## Layer 2: arbitrary dyadic integral models and densities

### 2.1 Smooth integral model

For a nondegenerate quadratic lattice over every unramified finite extension R/ℤ₂, construct Cho's smooth affine integral model from the Jordan data of IntegralLattices §3I; construct its coordinate Hopf algebra, generic-fibre O(V,q) comparison and equality of R-points with O(L). Prove smoothness of relative dimension n(n−1)/2, the successive congruence kernels and their counts. Include rank zero separately (Cho v3, Theorem 3.7, p.15). The model's generic-fibre map has source 𝒢_L⊗Frac(R) and target O(V,Q), and its point comparison is an isomorphism on every étale R-algebra; it is natural in that algebra and in integral lattice isometries. This does not identify its special-fibre points with all points of the naive equation scheme.

The API is generic-fibre compatibility with multiplication and inverse, étale-point naturality, change of integral basis, and the smooth reduction maps and congruence-kernel cardinalities.

*Needs:* IntegralLattices §3I Jordan data and §7C stabilization; §0.1's orthogonal group schemes; the smooth affine model construction in Cho v3, §§2–3.

**Checks.**

- Rank zero gives the trivial smooth model with one residue point and relative dimension 0; the positive-rank density division by 2 is not applied.
- For ⟨1⟩ over ℤ₂ the smooth model has two 𝔽₂-points, whereas the naive equation x²=1 has one; equality of integral points is not equality of special fibres.
- Smooth reduction over a residue field of order f has successive kernels of size f^d, d=n(n−1)/2: rank one gives 1 and rank two over 𝔽₄ gives 4, not 2.

### 2.2 Special fibre and local density

Construct the special fibre, its unipotent radical and reductive quotient, the product of the specified reduced orthogonal factors and elementary abelian 2-component group. Consume from IntegralLattices §3I the Jordan splitting L=⊕L_i, parity types I/II, bound/free, t, b, c, d_i and N_M, N_Q, N=N_Q−N_M. Write q(x)=B(x,x) for Cho's norm, so q=2Q in the half-norm convention of this roadmap. For every integer i define the filtration lattice A_i={x∈L : B(x,L)⊆2^iR}; thus A_i=⊕_j 2^max(0,i−j)L_j. It has full rank, including when L_i=0, and is not a Jordan constituent (Cho v3, §2.3, p.5; Remark 2.8, p.6).

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

- the refined types: I^o (type I, odd rank), I^e (type I, even rank), and, for a free constituent of type I^e only, I^e_1 when dim(B_i/Z_i) is odd and I^e_2 otherwise (Cho v3, the type assignment after Remark 2.6, p.6); no refined type is given to bound constituents, and the zero lattice counts as modular of parity type II (Cho v3, Definition 2.1(c), p.3);
- the residue quadratic spaces V̄_i = B_i/Z_i over the residue field k with the nonsingular form q̄_i induced by 2^(−i−1)q, the morphisms φ_i from the special fibre to O(V̄_i, q̄_i)_red (Cho v3, §4.1, pp.16–18), and their images by refined type and bound/free (Cho v3, Remark 4.3, p.18);
- Cho's component-group exponents: α = the number of free constituents of type I^e_1, and β = the number of j with L_j of type I and L_(j+2) of type II, the zero lattice included (Cho v3, Lemma 4.2, p.18). These are not the densities α_p and Cho's local density β_L, and the README never writes them under one symbol: write them α_Cho, β_Cho.

Prove that types, V̄_i up to isometry, α_Cho and β_Cho are independent of the Jordan splitting, and that the special fibre maps onto ∏_i O(V̄_i, q̄_i)_red × (ℤ/2)^(α_Cho+β_Cho) with connected unipotent kernel (Cho v3, Theorem 4.12, p.24).

The maps from 𝒢̃_L to the reduced orthogonal factors and component groups have the stated source and targets, are homomorphisms and are natural under lattice isometries. Their API includes image by refined type, surjectivity of the combined map, the connected unipotent kernel, and the multiplicative finite-point count. Prove the resulting density invariant under change of Jordan splitting and integral basis (Cho v3, Lemma 4.2 and Remark 4.3, p.18; Theorem 4.12, p.24; Lemma 5.1 and Theorem 5.2, pp.24–25).

*Needs:* §2.1; IntegralLattices §3I and §7C; ReductiveGroups Layers 5/7a for unipotent groups and ordinary Frobenius Lang surjectivity; quadratic residue-group comparisons from §0.1a and the finite-point orders of GeometryOfNumbersAndQuadraticArithmetic §3.3.7; Cho v3, Remark 2.6, p.6, for the auxiliary sublattices and refined types.

**Checks.**
- ⟨1⟩ over ℤ₂: one free I^o constituent at i=0 with O(V̄_0) trivial; L_2 is the zero lattice, of type II, so β_Cho=1 and #𝒢̃(𝔽₂)=2, giving α_2 = 2^(N−0)·2 = 4 with N=1. Omitting the zero-lattice convention gives β_Cho=0 and α_2=2, contradicting the direct count of x² ≡ 1 mod 2^r.
- ⟨2⟩ over ℤ₂: type I at i=1, L_3 zero, β_Cho=1, N=2, so α_2 = 2²·2 = 8, the count of 2x² ≡ 2 mod 2^r.
- U over ℤ₂: one free type II constituent of rank 2, image O(V̄_0) = O₂⁺(𝔽₂) of order 2, α_Cho=β_Cho=0, N=2, α_2 = 2^(2−1)·2 = 4. Taking the image to be the identity component SO(V̄_0), whose 𝔽₂-points are trivial, would give #𝒢̃(𝔽₂)=1 and α_2=2. Replacing the quadratic group by the polar stabilizer of order 6 would instead give α_2=12.

For the smooth connected unipotent kernel U over the finite residue field, construct its affine-space variety comparison from Cho v3, Lemma 4.2, p.18, and the proof of Theorem 4.12, p.24; deduce #U(k)=f^dim U. Use ordinary Frobenius Lang surjectivity from ReductiveGroups Layer 7a on this smooth connected kernel to lift rational quotient points and obtain the quotient finite-point count (Cho v3, Remark 5.3(i), p.25). Prove Cho's β_L=(1/2)f^(N−dim O)#𝒢̃_L(k) in positive rank and compare with the stabilized bilinear count of IntegralLattices §7C; for R=ℤ₂ prove α₂=2β_L, retaining the type-II +c term in N (Cho v3, Theorem 5.2 and Remark 5.3(i), p.25). These targets cover every unramified R and every Jordan scale before specialization to rational lattices.

### 2.3 Numerical arbitrary-genus formula

For positive-definite integral L of rank n≥3, with D=det B>0 and S the primes dividing 2D, prove the explicit numerical formula, which is `genusMass_eq` of §1.3 with the good factors evaluated by IntegralLattices §7C and collected into E_S

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

The API is representative independence, equality with `genusMass G` of §1.3 for every even unimodular G of rank n divisible by 8 (by the one-genus theorem below), invariance under integral isometry, and positivity for a nonempty class set. These properties are consequences of the native lattice comparison and the supplied mass theory.

*Needs:* §0.0; IntegralLattices §§2C/2G/3C/3E/5A/7A; Layer 2's arbitrary-genus formula (§2.3); Mathlib `riemannZeta_two_mul_nat` for the even zeta values and `Real.Gamma_one_half_eq` and `Real.Gamma_add_one` for the Γ factors.

**Checks.**

- In rank zero the empty matrix is even and unimodular and has weight 1, so the class set has one element and mass 1.
- In rank one [1] is unimodular but odd, and [2] is even but not unimodular; neither belongs to the even-unimodular set.
- E₈ belongs to the rank-eight set with weight 1/696729600, whereas the identity matrix I₈ is odd and is excluded even though its determinant is 1.

For n = 2m > 0 divisible by 8 prove that all positive even unimodular lattices of rank n belong to a single genus, using the real signature and the odd and dyadic local classifications (IntegralLattices Layer 3 and §5A). Apply Layers 1–2 to that genus; prove that the rational full O-mass is

    M_(2m) = |B_m/(2m)| · ∏_(j=1..m−1) |B_(2j)/(4j)|.

Here the Bernoulli numbers are defined by `t/(exp(t) − 1) = Σ_k B_k t^k/k!`, so B₁ = −1/2, and all displayed Bernoulli indices are even. Derive this identity from the normalized local and real factors of §2.3: there D = 1, S = {2}, the character is trivial because the signed determinant (−1)^m·D is 1 for even m, and E_S = ζ^(S)(m)·∏_(i=1..m−1) ζ^(S)(2i) becomes a rational multiple of a power of π through Mathlib's `riemannZeta_two_mul_nat` (ζ(2k) as a rational multiple of π^(2k)·B_(2k)), while the Γ(j/2) are evaluated by `Real.Gamma_one_half_eq` and `Real.Gamma_add_one`. It is not the odd-unimodular formula. A second check uses the Belolipetsky–Gan proper-SO formula: for even unimodular rational lattices, the local correction λ₂ = 1, whereas the article's §6 odd-lattice correction is not used. Compare proper mass to full O-mass by IntegralLattices §7A, giving exactly a factor 2, including classes that split into two proper classes. Rank 8 must yield 1/696729600. Rank 0 is not obtained by this formula.

The headline `evenUnimodularMass_eq` says that for every n>0 divisible by eight, `evenUnimodularMass n = bernoulliFullMass (n / 2)`. Here `bernoulliFullMass m` is the rational absolute-value product displayed above, defined for every natural m; the theorem does not claim a mass interpretation outside its rank hypotheses (Belolipetsky–Gan v2, Theorem 3.1, p.4, and §5, Corollary 5.3, p.7, and p.11; Conway–Sloane, §9(iv), p.274).

The API of this product is its expression as a finite rational product, positivity when m is positive and divisible by four, and the evaluations needed in Layer 4. The lattice-to-product theorem requires the one-genus and all local/real normalization comparisons.

**Checks.**

- At m=0 totalized rational division gives `bernoulliFullMass 0 = 0`; it is not the rank-zero mass 1.
- At m=4 the product is (1/240)(1/24)(1/240)(1/504)=1/696729600.
- At m=8 the product is 691/277667181515243520000; using proper mass doubles it and would contradict the full reciprocal weights of §4.1.

### 3.2 Exact Bernoulli evaluations

The Bernoulli numbers are Mathlib's `bernoulli : ℕ → ℚ`, with `bernoulli_one : bernoulli 1 = -1/2`; the recurrence ∑_(j=0..k) C(k+1, j)·B_j = 0 for k ≥ 1 is Mathlib's `sum_bernoulli` at n = k+1, and the generating function `t/(exp(t) − 1)` is Mathlib's `bernoulliPowerSeries_mul_exp_sub_one`. None of these is constructed again. The new work is the evaluation: compute B₂, B₄, …, B₃₈ from `sum_bernoulli` in ℚ, prove each value as an equality of `bernoulli k` with an explicit rational, and evaluate M₈, M₁₆, M₂₄, M₃₂, M₄₀ from them by exact rational arithmetic. Check: the recurrence at k = 1 reads B₀ + 2B₁ = 0, forcing B₁ = −1/2, which `bernoulli` satisfies and Mathlib's `bernoulli'` (with B_1=+1/2) does not; since m=n/2 is even and every index in M_(2m) is even, both conventions give the same masses, so only the recurrence detects a wrong choice. Check: `bernoulli 4 = -1/30`, and M₈ = |B₄/8|·|B₂/4|·|B₄/8|·|B₆/12| = (1/240)(1/24)(1/240)(1/504) = 1/696729600.

*Needs:* Mathlib `sum_bernoulli`, `bernoulli_one` and rational arithmetic; §3.1's product definition. The native generating function fixes the convention; no new Bernoulli carrier is constructed.

**Checks.**

- The recurrence for k=1 gives 1+2(−1/2)=0; choosing +1/2 instead gives 2.
- Rank 24 needs B₂₂, rank 32 needs B₃₀, and rank 40 needs B₃₈, because the largest index is 2(m−1); stopping at B₂₀ misses all three.
- B₃₈=2929993913841559/6 is included, and the exact products give 80618465<2M₃₂<80618466 and 8·10⁵¹<2M₄₀<9·10⁵¹.

### Examples

The rank-eight mass is the reciprocal E₈ order, and the rank-16 mass is the reciprocal sum of the two distinct reference classes. Rank zero is the separate empty-lattice case.

### Dependencies

IntegralLattices §§2C/2G/3C/3E/5A/7A, Layers 0–2, and Mathlib's Bernoulli recurrence `sum_bernoulli`, even zeta values `riemannZeta_two_mul_nat` and Γ values `Real.Gamma_one_half_eq` and `Real.Gamma_add_one`, used to convert the mass product.

## Layer 4: automorphism orders and class counts

### 4.1 Automorphism bounds, Weyl group orders and the rank-16 classification

For a positive rational Gram matrix G on ℤⁿ, prove the existence of c∈ℚ with c>0 and c∑xᵢ²≤xᵀGx for every rational vector x. Each column j of a form-preserving integral matrix then satisfies |aᵢⱼ|²≤Gⱼⱼ/c. Prove that AᵀGA=G forces det A=±1 and identifies exactly the native lattice automorphisms, compatibly with integral basis change. Deduce coercivity by transporting rational positivity to the real form using IntegralLattices §0E. In positive rank the real unit sphere is nonempty and compact; its continuous quadratic form has a positive minimum μ by Mathlib `IsCompact.exists_isMinOn`. Choose a rational 0<c<μ using `exists_rat_btwn`, then scale nonzero vectors to that sphere; the zero vector gives 0≤0. In rank zero take c=1 directly, without minimizing over the empty sphere. The determinant assertion follows from (det A)² det G=det G with det G≠0, and the integral isometry comparison is §0.0. These are boundedness and isometry comparisons; no enumeration procedure is a deliverable.

Let P be a finite reduced crystallographic root system over ℚ with a base of Cartan type t. Prove that |W(P)| = 2ⁿ⁻¹·n! when t = Dₙ with n ≥ 4, |W(P)| = 51840 = 2⁷·3⁴·5 when t = E₆, and |W(P)| = 2903040 = 2¹⁰·3⁴·5·7 when t = E₇ (Fomin–Reading, arXiv v3, §2.5, Figure 2.8, p.24), and that |W(P)| = 696729600 when t = E₈. Together with the native order (n+1)! of type Aₙ, these are the Weyl factors of every automorphism order in §§4.1–4.2, all on the one carrier `RootPairing.weylGroup` of a rational root system.

Each order is computed on the pinned model of its type. For a valid type t, `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType`, applied to P and to `TauCeti.DynkinType.rationalRootSystem t ht` with its base `TauCeti.DynkinType.rationalBase t ht` of Cartan type t (`TauCeti.DynkinType.hasCartanType_rationalRootSystem`), both over ℚ, makes |W(P)| the order of the model's Weyl group. By `TauCeti.DynkinType.rationalRootSystem_def` and `TauCeti.weylGroupBaseChangeEquiv`, that group is the Weyl group of the pinned integral datum `TauCeti.DynkinType.simplyConnectedRootDatum t ht`, acting by the same permutations of the root indices `Fin t.numRoots` (`TauCeti.weylGroupToPerm_weylGroupBaseChangeEquiv`).

- **Type E₈.** With `TauCeti.DynkinType.simplyConnectedRootDatum_E8`, the native `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum` gives 696729600.
- **Type Dₙ.** A route computes on `TauCeti.DynkinType.typeDSimplyConnectedRootDatum n hn`, which is the pinned datum `simplyConnectedRootDatum` of type Dₙ by `TauCeti.DynkinType.simplyConnectedRootDatum_D`. Its k-th root and coroot are read off the classical root `TauCeti.DynkinType.typeDRootEquiv n hn k`, one of the vectors ±eᵢ±eⱼ (i ≠ j) of `TauCeti.DynkinType.TypeDRoot n`, and its pairing is the dot product (`TauCeti.DynkinType.root_typeDSimplyConnectedRootDatum`, `TauCeti.DynkinType.coroot_typeDSimplyConnectedRootDatum`). So each reflection permutes the root indices as the classical reflection `TauCeti.DynkinType.typeDRootReflectionEquiv` permutes `TypeDRoot n`. The Weyl group of the rational model acts faithfully on its root indices (`RootPairing.weylGroupToPerm_injective`), so it is isomorphic to the group of permutations of `TypeDRoot n` generated by the classical reflections. The reflection in eᵢ−eⱼ exchanges coordinates i and j. The reflection in eᵢ+eⱼ exchanges them and negates both, so the product of the two reflections negates coordinates i and j. Hence that group is the image of the group of coordinate permutations combined with an even number of sign changes: every reflection lies in that group, and transpositions together with double sign changes generate it. That group acts faithfully on `TypeDRoot n`, because an element fixing eᵢ+eⱼ and eᵢ−eⱼ fixes eᵢ, and it has order 2ⁿ⁻¹·n!.
- **Types E₆ and E₇.** A route uses orbit and stabilizer at the highest root θ, `RootPairing.Base.highestRoot` of the rational model's base. In an irreducible simply-laced system the Weyl group is transitive on the roots. Every root is conjugate to a simple root by `TauCeti.exists_mem_support_weylGroupToPerm_eq`, adjacent simple roots α and β satisfy s_α s_β(α) = β, and the Dynkin diagram is connected. So the orbit of θ consists of all `t.numRoots` roots, 72 for E₆ and 126 for E₇. Since θ is dominant (`RootPairing.Base.pairingIn_highestRoot_nonneg`), its stabilizer is the standard parabolic subgroup of `TauCeti.weylCoxeterSystem` on the simple roots orthogonal to θ (`RootPairing.parabolic_wallIndices_eq_stabilizer`). In the Bourbaki numbering of the pinned bases these are α₁, α₃, α₄, α₅, α₆ in E₆, a chain of type A₅, and α₂, …, α₇ in E₇, of type D₆. Match them with the simple roots of the rational model of type A₅, resp. D₆, along an injection of index sets on which the two Coxeter matrices `TauCeti.coxeterMatrixOfBase` agree. Then `CoxeterSystem.parabolicHom` between the two systems `TauCeti.weylCoxeterSystem` is injective (`CoxeterSystem.parabolicHom_injective`) with image that parabolic subgroup (`CoxeterSystem.range_parabolicHom`). So the stabilizer has order |W(A₅)| = 6! by `RootPairing.card_weylGroup_of_hasCartanType_A`, resp. |W(D₆)| = 2⁵·6! by the type-D case. Hence |W(E₆)| = 72·6! and |W(E₇)| = 126·2⁵·6!.

For the two reference classes of IntegralLattices §6D, prove the full automorphism orders 2·696729600² and 2¹⁵·16!, using root actions and stabilizers of the actual glue subgroup. The first uses the two E₈ components and their interchange; the second uses the D₁₆ roots and the stabilizer of the chosen spinor glue class. Their reciprocal sum is 691/277667181515243520000. Transport IntegralLattices §9B's completeness implication to the Gram quotient and apply §3.1's mass value to prove `rank16_classNumber`: `Nat.card (evenUnimodularClasses 16) = 2`. The automorphism orders are deductions from RootSystems Layer 5, RootSystems Layer 6 §6.1, IntegralLattices §§6D/6G and the Weyl group orders above. Root permutations give W(E₈)≀S₂, of order 2·696729600², in the first case. In the second, the D₁₆ spinor-glue stabilizer is W(D₁₆), the even-sign subgroup of signed permutations, of order 2¹⁵·16!. The classification also has the independent locator Chenevier–Lannes v2, Chapter II, Corollary 3.6, p.41; the mass-exhaustion route here uses §§3.1/3.2 and IntegralLattices §9B. Rank-eight uniqueness belongs to IntegralLattices §6C.

*Needs:* §0.0's Gram/native comparison, §3.1's mass formula and §3.2's exact evaluation of M₁₆; IntegralLattices §§0E/2C/2G/6C/6D/6G/9B; Mathlib `IsCompact.exists_isMinOn` and `exists_rat_btwn`; RootSystems Layer 5 and Layer 6 §6.1. For the Weyl group orders, from Tau Ceti: for every type, `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType`, `TauCeti.DynkinType.rationalRootSystem` with `TauCeti.DynkinType.rationalBase`, `TauCeti.DynkinType.hasCartanType_rationalRootSystem` and `TauCeti.DynkinType.rationalRootSystem_def`, and `TauCeti.weylGroupBaseChangeEquiv` with `TauCeti.weylGroupToPerm_weylGroupBaseChangeEquiv`; for E₈, `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum` with `TauCeti.DynkinType.simplyConnectedRootDatum_E8`; for Dₙ, `TauCeti.DynkinType.typeDSimplyConnectedRootDatum` with `TauCeti.DynkinType.simplyConnectedRootDatum_D`, `TauCeti.DynkinType.root_typeDSimplyConnectedRootDatum`, `TauCeti.DynkinType.coroot_typeDSimplyConnectedRootDatum`, `TauCeti.DynkinType.typeDRootEquiv`, `TauCeti.DynkinType.typeDRootReflectionEquiv` and `RootPairing.weylGroupToPerm_injective`; for E₆ and E₇, `TauCeti.exists_mem_support_weylGroupToPerm_eq`, `RootPairing.Base.highestRoot` with `RootPairing.Base.pairingIn_highestRoot_nonneg`, `RootPairing.parabolic_wallIndices_eq_stabilizer`, `TauCeti.weylCoxeterSystem`, `CoxeterSystem.parabolicHom` with `CoxeterSystem.parabolicHom_injective` and `CoxeterSystem.range_parabolicHom`, `RootPairing.card_weylGroup_of_hasCartanType_A` for the A₅ stabilizer in E₆, and the type-D case above for the D₆ stabilizer in E₇.

**Checks.**

- |W(D₄)| = 2³·4! = 192, not the 2⁴·4! = 384 of all signed permutations. A single sign change preserves the D₄ roots but is a diagram symmetry, not a Weyl element. With triality, the full automorphism group of the D₄ root system has order 192·6 = 1152.
- The E₆ diagram involution is not in W(E₆), so the automorphism group of the E₆ root system has order 2·51840 = 103680. Taking that group for W(E₆) would double the E₆ factors of the rank-24 rows A₁₁D₇E₆ and E₆⁴.
- The orbit route agrees with the invariant-degree identity |W| = ∏dᵢ of ReflectionInvariantTheory §3 and the degree table of its §4. For E₆, 72·720 = 51840 = 2·5·6·8·9·12. For E₇, 126·23040 = 2903040 = 2·6·8·10·12·14·18. For Dₙ, 2·4·…·(2n−2)·n = 2ⁿ⁻¹·n!. For E₈, 240·2903040 = 696729600 is the native order.
- In E₆ the highest root (1,2,2,3,2,1) pairs to 1 with α₂ and to 0 with the other five simple roots, so its stabilizer has type A₅ and 72·720 = 51840; taking the walls other than α₁, of type D₅, would give 72·1920 = 138240. In E₇ the highest root (2,2,3,4,3,2,1) pairs to 1 only with α₁, so its stabilizer has type D₆ and 126·23040 = 2903040; taking the walls other than α₇, of type E₆, would give 126·51840 = 6531840.
- For G=diag(1,2), c=1 works and the automorphisms are the four diagonal sign matrices; a determinant-one restriction would count only two.
- In rank zero the empty matrix is the single automorphism; −id=id, so the positive-rank bound of §4.3 cannot be used.
- The two rank-16 orders are 970864271032320000 and 685597979049984000; their reciprocal sum equals the stated mass exactly, while retaining just one gives a strictly smaller sum.

### 4.2 Rank-24 classification

The twenty-four lattices are Tau Ceti's twenty-three table lattices `RootfulNiemeierType.lattice` and `leechLattice`, constructed under Rank24LatticeConstructions Layers 3 and 6; each is even, unimodular, positive definite and of rank 24. Choose a ℤ-basis of each and pass to its class in `GramClass 24` by §0.0; since §0.0 identifies integral congruence of Gram matrices with native integral isometry in both directions, non-isometric lattices give distinct classes. Pairwise non-isometry is IntegralLattices §6E and is not proved again here. Its statement for two table rows assumes that the root sublattice of each row's lattice is the row's displayed root lattice; discharge this hypothesis by the native `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` for the nineteen rows other than A₁²⁴, A₂¹², D₄⁶ and A₁₁D₇E₆, and by Rank24LatticeConstructions Layer 3 for those four. The Leech lattice is separated from every table row by `vectorsOfNorm_two_leechLattice`, also as in §6E.

For the twenty-three table lattices prove the full automorphism orders, take the Leech order from CFSGBasicProperties P2-L, and prove that the twenty-four reciprocal orders sum to the rank-24 mass. A proof route for a lattice with roots is the action on its root lattice, Weyl subgroup and glue stabilizer, including the kernel and image of that action: an automorphism preserves the root sublattice (native `IntegralLattice.Isometry.map_span_vectorsOfNorm`), so it lies in the subgroup of root-system automorphisms preserving the glue subgroup (RootSystems Layer 5, with Layer 6 §6.1 for the components), and conversely Rank24LatticeConstructions Layer 5 extends a glue-preserving root-lattice isometry to the glued lattice. For the rootless Leech lattice an empty root system cannot determine its automorphisms: its isometry group is `Co0 := Aut(Λ)` of CFSGBasicProperties P2-L on the same native `leechLattice`, which that milestone generates by the Conway generators and whose order it computes from the faithful action on the 196560 minimal vectors; this section consumes that order and does not prove it again. Apply IntegralLattices §9B to obtain `rank24_classNumber`: `Nat.card (evenUnimodularClasses 24) = 24`, and deduce uniqueness of the rootless class (Chenevier–Lannes v2, Chapter II, Theorems 3.16–3.17, p.48). The order targets are specified by Borcherds, “Tables of lattices”, norm-zero table: for each of the 23 root-system entries its recorded finite factor is |O(L)/W(R(L))|. It is multiplied by the Weyl order |W(R(L))|, the product of the orders of the irreducible components, each a rational root system with a base of known type: type A from the native `RootPairing.card_weylGroup_of_hasCartanType_A`, and Dₙ, E₆, E₇ and E₈ from §4.1. The rootless entry gives the full Leech order 8315553613086720000. Prove the twenty-three factors from the actual glue actions, then verify the exact reciprocal sum; the table is a locator for the values, not a hypothesis asserting them. In the A₁²⁴ row the Weyl group {±1}²⁴ acts trivially on the glue group, so the factor is the group of permutations of the 24 components preserving the glue code. Rank24LatticeConstructions Layer 4 carries that code to the extended binary Golay code, whose permutation automorphism group CFSGBasicProperties P2-L identifies with the M₂₄ model of order 244823040 (SporadicOrders O1); this section consumes that order and does not prove it again.

*Needs:* Tau Ceti `RootfulNiemeierType.lattice`, `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne`, `leechLattice`, `vectorsOfNorm_two_leechLattice` and `IntegralLattice.Isometry.map_span_vectorsOfNorm`; Rank24LatticeConstructions Layer 3 for the root sublattices of the rows A₁²⁴, A₂¹², D₄⁶ and A₁₁D₇E₆, Layer 4 for the Golay coordinates of the A₁²⁴ glue code, Layer 5 for induced glue isometries and Layer 6 for the Leech lattice; CFSGBasicProperties P2-L for the order of `Co0 := Aut(Λ)` and for the identification of the Golay code's permutation automorphism group with the M₂₄ model; SporadicOrders O1 for the order of that model; IntegralLattices §§2C/2G/6E/9B; RootSystems Layer 5 and Layer 6 §6.1; the Weyl factors from Tau Ceti `RootPairing.card_weylGroup_of_hasCartanType_A` (type A) and §4.1's orders of types Dₙ, E₆, E₇ and E₈; §§0.0/3.1/4.1 for Gram transport and mass, and §3.2's exact evaluation of M₂₄.

**Checks.**

- The separation of IntegralLattices §6E needs each row's root sublattice, not only the inclusion of the root lattice: in the A₁²⁴ row a glue word of weight w has coset minimum w/2, and the Golay minimum weight 8 gives 4, so the lattice has exactly the 48 roots of A₁²⁴; a glue word of weight 4 would add roots of norm 2 and change the root system that separates the row.
- The Leech root count is 0 but its minimal-vector count is 196560; the empty-root permutation group has order 1 and cannot be its full automorphism group.
- The full Leech automorphism order is 8315553613086720000, giving reciprocal contribution 1/8315553613086720000; quotienting by {±1} would double this contribution.
- Twenty-four distinct classes are required: repeating any one representative violates injectivity even if a numerical list still has length 24.
- Fifteen of the twenty-three table rows have a component of type D or E, so their orders need §4.1: fourteen have one of type D, E₆ or E₇, and the fifteenth is E₈³. In the D₄⁶ row the Weyl factor is 192⁶ and the remaining factor is 2160 = 3·720. Using 384 for |W(D₄)| would multiply that row's order by 2⁶, and the twenty-four reciprocals would no longer sum to M₂₄.
- In the A₁²⁴ row the order is 2²⁴·244823040 = 4107449023856640, and its reciprocal is about 3.07% of M₂₄. Taking all 24! permutations of the components instead of the Golay stabilizer M₂₄ would bring the twenty-four reciprocals down to about 0.9693·M₂₄.

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

IntegralLattices §§0E/2C/2G/6C–6E/6G/9B, RootSystems Layer 5 and Layer 6 §6.1, Rank24LatticeConstructions Layers 3–6, CFSGBasicProperties P2-L, SporadicOrders O1, Tau Ceti's native rank-24 lattices, Tau Ceti's native Weyl group orders of type A and of the pinned E₈ datum with its rational models, base-change comparison, Cartan-type rigidity, root-orbit, highest-root, dominant-stabilizer and parabolic-restriction theorems, and Layers 0/3. The exhaustion implication takes this roadmap's mass evaluation as an input and is never used to prove that evaluation.

## Downstream consumers

IntegralLattices consumes nothing here: the statements it labels 7H, 7I and 4D are this roadmap's §§2.3/3.1, §4.1 and §0.3, and its §9B takes a mass as a hypothesis. LatticePackingsAndPerfectForms consumes §§3.1 and 4.1–4.2: the mass values, the rank-16 and rank-24 automorphism orders and the class counts. Lattice-count applications consume the rank-32/40 lower bounds. The approximation branch supplies the higher-rank Eichler application independently of the positive-definite mass branch.

## References

- Sungmun Cho, [Group schemes and local densities of quadratic lattices in residue characteristic 2](https://arxiv.org/abs/1210.7625v3), for smooth integral models and local densities over unramified dyadic extensions.
- M. Belolipetsky and W. T. Gan, [The mass of unimodular lattices](https://arxiv.org/abs/math/0307195v2), for the parahoric/proper-SO mass comparison; retain the even-versus-odd normalization in §2, p.3, and Theorem 3.1, p.4; even unimodular correction in §5, p.11.
- The IntegralLattices, OrthogonalSpinGroups and linked adelic/orthogonal-value specifications above, at their actual coefficient, rank and gauge hypotheses.
- J. S. Milne, [Algebraic Groups, corrected 2022 version](https://www.jmilne.org/math/Books/iAG2022.pdf), §24i, pp.535–537, for the Clifford construction and simply connected Spin cover.
- J. H. Conway and N. J. A. Sloane, *Low-dimensional lattices. IV. The mass formula*, Proc. Roy. Soc. London A 419 (1988), 259–286, DOI [10.1098/rspa.1988.0107](https://doi.org/10.1098/rspa.1988.0107), equations (2), (3), (6) and §9. Equations (2)–(3), p.263, equation (6), p.266, §9(iv), p.274, and §12, p.281, specify the mass and density conventions; an [author-hosted scan](https://neilsloane.com/doc/Me150.pdf) supplies this text.
- O. T. O’Meara, *Introduction to Quadratic Forms* (1963), 104:4–5, for strong approximation and Eichler's theorem; source text uncertified.

- G. Chenevier and J. Lannes, [Formes automorphes et voisins de Kneser des réseaux de Niemeier, arXiv v2](https://arxiv.org/abs/1409.7616v2), Chapter II, Corollary 3.6, p.41, and Theorems 3.16–3.17, p.48. These are the locators of the cited preprint version.
- S. Fomin and N. Reading, [Root systems and generalized associahedra, arXiv v3](https://arxiv.org/abs/math/0505518v3), Lecture 2, §2.5, Figure 2.8, p.24, for the orders of the Weyl groups of types Dₙ, E₆ and E₇ in §4.1. These are the locators of the cited preprint version.
- R. Borcherds, [Tables of lattices, norm-zero table](https://math.berkeley.edu/~reb/lattices/0), the 23 root-system entries and the rootless entry, for the finite automorphism factors and Leech order; the [table index](https://math.berkeley.edu/~reb/lattices/index.html) identifies the Niemeier correspondence.
