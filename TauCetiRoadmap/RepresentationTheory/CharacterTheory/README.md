# Roadmap: character theory of finite groups, and computing character tables

**Summary.** This roadmap builds the ordinary character theory of a finite group `G` on the group
algebra `k[G]` and its categorical mirror `FDRep k G`, from Mathlib's trace characters, Maschke,
Schur and Artin–Wedderburn and from the pinned Tau Ceti character-table library (class functions
and their bilinear pairing, class sums and structure constants, completeness, the labeled table,
column orthogonality, central characters, primitive central idempotents, degree divisibility, the
cyclotomic Galois action, Brauer's splitting field, Burnside's `pᵃqᵇ` theorem, and the exact
cyclotomic Burnside–Dixon–Schneider solver with its checker and soundness theorem). What it adds
are the theorems those objects do not yet carry: the canonical irreducible index with finite
models and the cross-universe regrouping of a finite-dimensional representation into isotypic
pieces; character recognition in characteristic zero; the irreducibles of a product group as
external tensor products; the Burnside–Brauer faithful tensor-generation theorem and the
generating series of tensor multiplicities; the field of values of an irreducible character as a
fixed field; the exact-coordinate bound `B_G = |G|·A_e` on central characters, which makes the
native solver succeed at every prime `p > 2B_G` and makes its prime search terminate; the
Frobenius–Schur, Frobenius-group and `GL₂(𝔽_q)` applications as comparisons with the pinned
library; and worked finite-group and spring-system examples. The end theorems are the
complete-reconstruction theorem for the native solver (`characterTableDixon_isSome`,
`characterTableDixonSearch_eventually_some`), the Burnside–Brauer theorem
(`exists_pos_finrank_hom_tensorPower`) with its generating series
(`tensorMultiplicitySeries_eq_characterFractions`, `arbitrarily_large_tensorPowers`), and the
field-of-values theorem (`fieldOfValues_eq_map_fixedField_stabilizer`).

The work divides into four strands, and the layers below are grouped by them:

- **A. Ordinary character theory and the character table** (Layers 0–4): the classical
  development, with the pinned library as its foundation and the missing comparisons as targets.
- **B. The class algebra and the Dixon–Schneider specification** (Layer 5): the theorem that the
  structure constants plus integrality *determine* the table, and the checker it yields.
- **C. Exact reconstruction for the executable solver** (Layer 6): the explicit prime threshold at
  which the pinned exact cyclotomic solver is complete, and the termination of its prime search.
- **D. Structural theorems and worked families** (Layers 7–11): the Frobenius–Schur trichotomy,
  Frobenius's theorem `G = N ⋊ H`, the character table of `GL₂(𝔽_q)`, small finite-group
  representations, and the symmetry analysis of finite spring systems.

Suggested home: `TauCeti/RepresentationTheory/CharacterTable/`, mirroring Mathlib's
`RepresentationTheory/`.

## Scope and ownership

The roadmap owns:

- the canonical index of the irreducible `k[G]`-modules with a finite model in each class, the
  universe-independent class lookup of a simple module, and the regrouping of a finite-dimensional
  representation into `m_ρ(i)` copies of the `i`-th finite model (Layer 2, Layer 3);
- the intrinsic multiplicities `m_ρ(i)`, their API, the character expansion `ρ.character = ∑ᵢ m_ρ(i) • χᵢ`, the modular congruence criterion and characteristic-zero character recognition
  at arbitrary carrier universes (Layer 3);
- external tensor products of representations of a product group `G × H`, the classification of
  the irreducibles of `G × H` as external products, the Kronecker-product character table, the
  external Hom representation, and the `G × G`-bimodule comparison of the Wedderburn map (Layer 3);
- the **Burnside–Brauer theorem** (faithful tensor generation over `ℂ`, with the bound by the number
  of distinct character values) and the **tensor-multiplicity generating series** with its
  noncancelling pole (Layer 3). This roadmap is the owner of that theorem for finite groups over
  `ℂ`: it is finite-group character theory with no McKay-specific input, and the McKaySkewGroup
  roadmap (§1.1, the McKay matrix) already consumes this roadmap's Layers 2–3, so the acyclic
  arrangement is that McKaySkewGroup cites this subsection rather than proving the theorem itself;
- the cyclotomic lift of character values with its embedding adapter, the `ULift`/`Shrink`
  transport of Brauer's splitting-field theorem, and the **field of values** of an irreducible
  character as the image of a fixed field (Layer 4);
- the exact-coordinate reconstruction for the pinned solver: the computable bound `A_e` on the
  canonical coordinates of powers of the generator, the comparison of the exact ring with the ring
  of integers of `ℚ(ζ_e)` on the same generator, exact preimages of all character and central
  values, the division-free identity `d·w_C = |C|·x_g`, the bound `B_G = |G|·A_e`, strong Dixon
  primes `p > 2B_G`, the exact certificate with bounded coefficients, the class-power Galois
  identity and the degree identity on central rows, the completeness of the native solver at every
  strong prime, and the termination of its prime search (Layer 6);
- the comparisons that tie the pinned Frobenius–Schur, Frobenius-group and `GL₂(𝔽_q)` theorems to
  the table and the pairing of this roadmap, the arbitrary-universe transport of the
  principal-series irreducibility criterion, and the explicit `GL₂` character values (Layers 7–9);
- the small finite-group representations (symmetric powers of the `S₃` standard module, the cube
  modules of `S₄`, restriction to `A₄`) and the spring-system applications, with their explicit
  intertwiners and spectra (Layers 10–11).

It does not own, and consumes by name:

- class functions, the bilinear pairing and its nondegeneracy, class sums and their centrality,
  the dimension of the center, structure constants, the integrality of class sums, the Wedderburn
  equivalence and the count, completeness of the irreducible characters, the labeled character
  table, column orthogonality, labeled uniqueness, primitive central idempotents, central
  characters and their integrality, degree divisibility, the class-multiplication matrices, the
  eigenrow characterization and the specification: all are Tau Ceti's
  `RepresentationTheory/CharacterTable` library (the contract below);
- the cyclotomic Galois action on virtual and irreducible characters
  (`TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean` and `Galois.lean`) and
  Brauer's splitting-field theorem (`Induction/Cyclotomic/SplittingField.lean`);
- Burnside's `pᵃqᵇ` theorem and the coprime zero-or-scalar alternative
  (`TauCeti/RepresentationTheory/CharacterTable/Solvable.lean`): the character-theoretic route is
  recalled in Layer 4 as background, not planned again;
- the exact cyclotomic ring `TauCeti.Cyclotomic e`, its complex embedding, the executable class
  data `TauCeti.ClassData`, the modular eigenrow search, Dixon primes, the all-conjugate lift, the
  exact checker, the `Option`-valued solver, its soundness and its completeness theorem
  conditional on bounded coefficients (`CharacterTable/Dixon/`);
- the Frobenius–Schur indicator, its trichotomy, realizability over `ℝ`, the involution count and
  the real-class count (`CharacterTable/FrobeniusSchur/`, `CharacterTable/RealClasses.lean`);
  Frobenius's theorem with the bundled kernel subgroup, the T.I. isometry and the degree-corrected
  exceptional extension (`FrobeniusGroup/`, `Induction/TrivialIntersection.lean`); the `GL₂`
  Borel, principal series, Steinberg, non-split torus and cuspidal objects with their dimension
  and irreducibility theorems (`CharacterTable/GL2/`);
- the Schur collapse `End_{k[G]}(S) ≃ₐ[k] k` for a simple module over an algebraically closed
  field and the block/simple-module dictionary: **SemisimpleAlgebras** Layer 1 (simple modules,
  Schur, isotypic components) and Layer 2;
- induced representations, the induced-character formula and Frobenius reciprocity:
  **InductionRestriction** Layer 2; the Mackey formula and the irreducibility criterion: its
  Layers 3–4;
- the `G × G`-isotypic decomposition `L²(G) ≅ ⨁̂_π End(V_π)` of a compact group:
  **CompactGroups** Layer 5 (the isotypic decomposition), compared here on a finite group;
- the categorical Frobenius–Schur indicator of a pivotal category: **PivotalSpherical**, compared
  here on `FDRep G`;
- Thompson's theorem that a Frobenius kernel is nilpotent, and the Deligne–Lusztig theory the
  cuspidal series of `GL₂` specializes: neither is planned in this roadmap.

## Conventions

- **The group.** `G` is a finite group throughout (`[Group G] [Finite G]`, and `[Fintype G]`
  `[DecidableEq G]` for anything computed). Write `Nat.card G` for its order and `Monoid.exponent G`
  for its exponent `e`; `e ≠ 0` for a finite group (`Monoid.neZero_exponent_of_finite`).
- **The coefficient field, and the three arenas.** The **theory** (orthogonality, completeness, the
  count, the structure theory) is stated over a field `k` that is **algebraically closed with
  `char k ∤ |G|`**, where Mathlib's `char_orthonormal` and `k[G] ≅ ∏ Matₙᵢ(k)` live. The
  **character table as a concrete object** is over `ℂ`. Arithmetic statements live in the
  cyclotomic field `ℚ(ζ_e)`. Do not bundle "algebraically closed and `char ∤ |G|`" into a class;
  spell the hypotheses each result uses, and state each transfer between the three arenas
  explicitly.
- **Exact arithmetic computes; `ℂ` only specifies.** `Complex` is not a computable type, so nothing
  is evaluated in `ℂ`. Strand C computes in the exact cyclotomic-integer type
  `TauCeti.Cyclotomic e`, coefficient vectors on the power basis of `ℤ[ζ_e] = ℤ[X]/Φ_e`, with a
  definite embedding `TauCeti.Cyclotomic.complexEmbedding : Cyclotomic e →+* ℂ` sending the
  generator `TauCeti.Cyclotomic.zeta e` to the distinguished root `TauCeti.Cyclotomic.complexRoot e`.
  The complex table is the image of the exact table under this embedding. The Galois group that
  acts on character values is `Gal(ℚ(ζ_e)/ℚ)`, through the power maps `σ_j : ζ ↦ ζ^j`
  (`IsPrimitiveRoot.autToPow`); no automorphism of `ℂ` is ever chosen.
- **The group algebra is the spine; `FDRep` is the mirror.** Develop the theory on
  `k[G] = MonoidAlgebra k G`, its modules, `Representation.character` and
  `Representation.IsIrreducible`; transport along `Rep.equivalenceModuleMonoidAlgebra` where the
  categorical statement is cleaner, and keep the `FDRep`/`CategoryTheory.Simple` mirror in step.
  Use Mathlib's vocabulary (`ConjClasses G`, `MonoidAlgebra`, `IsIntegral`, `IsPrimitiveRoot`,
  `CyclotomicField`, `Monoid.exponent`), never a private synonym.
- **The pairing is bilinear; Hermitian is a `ℂ`-only refinement.** The pairing
  `⟨f₁, f₂⟩ = (Nat.card G)⁻¹ • ∑ g, f₁ g * f₂ g⁻¹` on class functions
  (`TauCeti.ClassFunction.characterPairing`) is bilinear and symmetric over a general field and
  not Hermitian there. Over `ℂ`, and only for virtual characters, `f₂ g⁻¹ = conj (f₂ g)`, so it
  agrees with the conjugate-linear inner product; that is a separate `ℂ`-lemma, and "Hermitian"
  is reserved for it. The orientation used for tensor powers is
  `⟨χ_{U^⊗n}, χ_X⟩ = finrank ℂ (X ⟶ U^⊗n)`.
- **Central characters versus character values.** The solver's primary object is the
  **central-character table** `Ω`, `Ω_{χ,j} = ω_χ(K_j)` (values on class sums), not the ordinary
  table `X`, `X_{i,j} = χᵢ(g_j)`; they are related by `ω_χ(K_j) = |C_j| · χ(g_j) / χ(1)`, both are
  named, and the ordinary table is a conversion from `Ω`.
- **Computable means compiler-executable.** "Compute" means a definition the compiler executes on
  `[DecidableEq G] [Fintype G]` data. Kernel reduction is not required and not available: the
  pinned `TauCeti.Cyclotomic.lift` is executable but does not reduce in the kernel, because
  `ZMod.inv` is `Nat.gcdA`, defined by well-founded recursion; facts about it are proved through
  its specification lemmas, never by `decide`. Mathlib's noncomputable character API is the
  specification the solver is proved against, not a step in it.
- **Left eigenrows.** Class-multiplication matrices follow Tau Ceti's convention
  `(M_i)_{j,k} = a_{i,k,j}`, acting on row vectors from the left (`Matrix.vecMul`, `ᵥ*`); a left
  eigenspace is the right kernel of `M_iᵀ − λI`, never of `M_i − λI`. The witness is in Layer 5.

## Exact supplier contracts

### From Mathlib

| Use here | Exact declarations |
|---|---|
| characters as traces | `Representation.character`, `FDRep.character`, `Representation.char_one`, `char_conj`, `char_mul_comm`, `char_tensor`, `char_dual`, `char_linHom`, `FDRep.char_iso`, `FDRep.char_one` |
| first orthogonality and Hom dimensions | `FDRep.char_orthonormal`, `FDRep.scalar_product_char_eq_finrank_equivariant`, `Representation.card_inv_mul_sum_char_mul_char_eq_finrank`, `Representation.average_char_eq_finrank_invariants`, `FinGroupCharZero.simple_iff_char_is_norm_one` |
| Maschke, semisimplicity, Schur | `MonoidAlgebra.isSemisimpleRing` (Maschke), `IsSemisimpleModule`, `IsSemisimpleModule.exists_linearEquiv_fin_dfinsupp`, `LinearMap.bijective_or_eq_zero`, `finrank_endomorphism_simple_eq_one`, `finrank_hom_simple_simple`, `FDRep.simple_iff_end_is_rank_one`, `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` |
| Artin–Wedderburn | `isSemisimpleRing_iff_pi_matrix_divisionRing`, `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` |
| intertwiners and invariants | `Representation.IntertwiningMap`, `Representation.IntertwiningMap.equivLinearMapAsModule`, `Representation.asModuleEquiv`, `Representation.invariantsEquivIntertwiningMap`, `Representation.invariantsEquivFDRepHom`, `Representation.isIntertwiningMap_of_mem_center`, `Subrepresentation.subrepresentationSubmoduleOrderIso`, `Representation.tprod`, `Representation.dual`, `Representation.linHom`, `Action.mkIso` |
| conjugacy classes, computably | `ConjClasses`, `ConjClasses.carrier`, `Fintype (ConjClasses α)`, `DecidableRel IsConj` for `[DecidableEq α] [Fintype α]`, `card_comm_eq_card_conjClasses_mul_card`, `Subgroup.index_centralizer_eq_ncard` |
| concrete groups and the group algebra | `Equiv.Perm (Fin n)`, `alternatingGroup`, `DihedralGroup n`, `QuaternionGroup n`, `Multiplicative (ZMod n)`, `MonoidAlgebra` |
| integrality | `IsIntegral`, `IsIntegral.add`, `IsIntegral.mul`, `Representation.isIntegral_character`, `FDRep.isIntegral_character`, `IsIntegrallyClosed`, `IsIntegral.ratCast_iff`, `isIntegral_algHom_iff`, `NumberField.RingOfIntegers` |
| roots of unity and cyclotomic fields | `IsPrimitiveRoot`, `IsPrimitiveRoot.map_of_injective`, `IsPrimitiveRoot.eq_pow_of_pow_eq_one`, `IsCyclotomicExtension`, `CyclotomicField`, `CyclotomicField.isCyclotomicExtension`, `IsCyclotomicExtension.zeta_spec`, `IsPrimitiveRoot.autToPow`, `IsPrimitiveRoot.autEquivPow`, `IsPrimitiveRoot.integralPowerBasis`, `IsPrimitiveRoot.integralPowerBasis_gen`, `IsPrimitiveRoot.integralPowerBasis_dim`, `IsPrimitiveRoot.adjoinEquivRingOfIntegers`, `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton`, `IsCyclotomicExtension.Rat.cyclotomicRing_isIntegralClosure`, `NumberField.Embeddings.pow_eq_one_of_norm_le_one`, `Nat.exists_prime_gt_modEq_one`, `Monoid.exponent`, `Monoid.neZero_exponent_of_finite` |
| Galois theory | `IntermediateField.adjoin`, `IntermediateField.fixedField`, `IntermediateField.map`, `IsGalois.fixedField_fixingSubgroup` |
| finite fields and linear algebra | `ZMod`, `ZMod.inv`, `Field (ZMod p)`, `Matrix.vecMul`, `Matrix.card_GL_field`, `Module.End.isSemisimple_of_squarefree_aeval_eq_zero`, `Lagrange.basis`, `Matrix.det_vandermonde` |
| group theory for the applications | `IsPGroup.isNilpotent`, `IsPGroup.center_nontrivial`, `Sylow.card_eq_multiplicity`, `Group.isSolvable_of_comm`, `Group.isSolvable_iff_subgroup_quotient`, `Subgroup.Normal.eq_bot_or_eq_top`, `Subgroup.center_eq_top_iff`, `Subgroup.IsComplement'`, `SemidirectProduct` |
| power series and analysis | `PowerSeries`, `PowerSeries.C`, `PowerSeries.X`, `PowerSeries.mk`, `PowerSeries.coeff`, the inverse of a power series with unit constant term over a field, `Polynomial.toPowerSeries`, `Real.sqrt`, `Filter.Tendsto`, `nhdsWithin` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| class functions and the pairing | `TauCeti.ClassFunction`, `TauCeti.ClassFunction.equivConjClasses`, `TauCeti.ClassFunction.toConjClasses`, `TauCeti.ClassFunction.ofFDRep`, `TauCeti.ClassFunction.finrank_eq_card_conjClasses`, `TauCeti.ClassFunction.characterPairing`, `TauCeti.ClassFunction.characterPairing_apply`, `TauCeti.ClassFunction.characterPairing_nondegenerate`, `TauCeti.ClassFunction.le_span_irreducibleCharacters`, `TauCeti.irreducibleCharacters`, `TauCeti.virtualCharacters`, `TauCeti.mem_irreducibleCharacters_of_characterPairing_self_eq_one` |
| the center and class sums | `TauCeti.classSum`, `TauCeti.classSum_coeff`, `TauCeti.classSum_mem_center`, `TauCeti.classSumCenter`, `TauCeti.classSumCenter_coe`, `TauCeti.finrank_center_monoidAlgebra`, `TauCeti.structureConstant`, `TauCeti.classSum_mul`, `TauCeti.classSumCenter_mul`, `TauCeti.isIntegral_classSum`, `TauCeti.isIntegral_classSumCenter` |
| Wedderburn and the count | `TauCeti.exists_algEquiv_pi_matrix`, `TauCeti.sum_sq_eq_card_of_algEquiv_pi_matrix`, `TauCeti.centerMonoidAlgebraAlgEquivPi`, `TauCeti.card_eq_card_conjClasses_of_algEquiv_pi_matrix` |
| the table and its specification | `TauCeti.characterTable`, `TauCeti.characterDegree`, `TauCeti.centralCharacterTable`, `TauCeti.sum_characterTable_mul_conj`, `TauCeti.IsCharacterTableSpec`, `TauCeti.isCharacterTableSpec_characterTable`, `TauCeti.characterTable_unique_rows`, `TauCeti.classMultMatrix`, `TauCeti.classMultMatrix_commute`, `TauCeti.isClassEigenrow_centralCharacterTable`, `TauCeti.isClassEigenrow_iff_exists_algHom`, `TauCeti.isClassEigenrow_def`, `TauCeti.classSumRow_apply` |
| central characters and idempotents | `TauCeti.Representation.centralCharacter`, `TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`, `TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`, `TauCeti.Representation.finrank_dvd_card`, `TauCeti.Representation.primitiveCentralIdempotent` |
| kernels, tensor powers, finite models | `Representation.char_eq_finrank_iff`, `FDRep.ker_eq_bot_iff`, `Representation.tensorPower`, `Representation.char_tensorPower`, `FDRep.ofShrink`, `FDRep.simple_iff_isIrreducible`, `FDRep.character_of`, `FDRep.char_biprod`, `FDRep.finrank_hom_eq_sum_of_character_eq`, `FDRep.nonempty_iso_of_character_eq`, `TauCeti.standardRepresentation` |
| Galois action and splitting field | `IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv`, `IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv_apply`, `IsPrimitiveRoot.cyclotomicVirtualCharacterAction`, `IsPrimitiveRoot.cyclotomicVirtualCharacterAction_apply`, `IsPrimitiveRoot.cyclotomicVirtualCharacterAction_equiv_apply`, `IsPrimitiveRoot.cyclotomicVirtualCharacterAction_mem_irreducibleCharacters`, `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction`, `TauCeti.ClassFunction.powMap`, `Representation.map_ofCharacter_eq_powMap`, `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot`, `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot`, `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension`, `FDRep.exists_simple_nonempty_iso_baseChange_adjoin_of_isPrimitiveRoot` |
| Burnside | `Representation.char_eq_zero_or_exists_apply_eq_smul`, `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` |
| the exact ring | `TauCeti.Cyclotomic`, `TauCeti.Cyclotomic.zeta`, `TauCeti.Cyclotomic.coeff`, `TauCeti.Cyclotomic.coeffs`, `TauCeti.Cyclotomic.ofCoeffList`, `TauCeti.Cyclotomic.equivAdjoinRoot`, `TauCeti.Cyclotomic.complexRoot`, `TauCeti.Cyclotomic.isPrimitiveRoot_complexRoot`, `TauCeti.Cyclotomic.complexEmbedding`, `TauCeti.Cyclotomic.complexEmbedding_zeta`, `TauCeti.Cyclotomic.complexEmbedding_injective`, `TauCeti.Cyclotomic.evalRingHom`, `TauCeti.Cyclotomic.reduceRingHom`, `TauCeti.Cyclotomic.coeffs_intCast_mul`, `TauCeti.Cyclotomic.primitiveExponent`, `TauCeti.Cyclotomic.conjugateRoot`, `TauCeti.Cyclotomic.conjugateResidues`, `TauCeti.Cyclotomic.lift`, `TauCeti.Cyclotomic.lift_eq_of_conjugateResidues_eq` |
| the executable solver | `TauCeti.ClassData`, `TauCeti.ClassData.equivConjClasses`, `TauCeti.ClassData.centralCharacterSearch`, `TauCeti.kernelBasis`, `TauCeti.eigenvalueSearch`, `TauCeti.DixonPrimeData`, `TauCeti.DixonPrimeData.candidates`, `TauCeti.IsGoodDixonPrime`, `TauCeti.exists_isGoodDixonPrime`, `TauCeti.ClassData.CyclotomicCharacterTableData`, `TauCeti.ClassData.IsCyclotomicCharacterTableSpec`, `TauCeti.ClassData.cyclotomicCharacterTableChecker`, `TauCeti.ClassData.complexTableOfCyclotomic`, `TauCeti.ClassData.complexTableOfCyclotomic_apply_classOf`, `TauCeti.ClassData.IsCyclotomicCharacterTableSpec.isCharacterTableSpec`, `TauCeti.ClassData.dixonCyclotomicCharacterTable?`, `TauCeti.ClassData.isCharacterTableSpec_of_dixonCyclotomicCharacterTable?_eq_some`, `TauCeti.ClassData.isSome_dixonCyclotomicCharacterTable_of_spec`, `TauCeti.ClassData.characterTableDixon?`, `TauCeti.dihedralGroupThreeCharacterTable`, `TauCeti.symmetricGroupFourCharacterTable`, `TauCeti.alternatingGroupFourClassData`, `TauCeti.alternatingGroupFourExactCharacterTable`, `TauCeti.alternatingGroupFourOmega` |
| the representation ring | `TauCeti.repRing`, `TauCeti.repRingCharacter`, `TauCeti.repRingCharacter_mem_classFunction`, `TauCeti.repRingCharacter_injective` |
| Frobenius–Schur and real classes | `FDRep.frobeniusSchurIndicator`, `TauCeti.Representation.frobeniusSchurIndicator`, `TauCeti.Representation.frobeniusSchurIndicator_def`, `TauCeti.Representation.frobeniusSchurIndicator_eq_one_or_eq_zero_or_eq_neg_one`, `TauCeti.Representation.frobeniusSchurIndicator_eq_one_iff`, `TauCeti.Representation.frobeniusSchurIndicator_eq_neg_one_iff`, `TauCeti.Representation.IsInvariantForm`, `Representation.IsRealForm`, `Representation.IsRealizableOverReal`, `Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal`, `TauCeti.frobeniusSchurIndicatorRow`, `TauCeti.card_squareRoot_eq_sum_frobeniusSchurIndicatorRow_mul_characterTable`, `TauCeti.IsRealClass`, `TauCeti.card_realValued_eq_card_realClasses` |
| Frobenius groups | `TauCeti.IsFrobeniusComplement`, `TauCeti.IsTISubgroup`, `TauCeti.IsTISet`, `TauCeti.isometry_ind_of_isTISet`, `TauCeti.frobeniusKernel`, `TauCeti.frobeniusKernelSubgroup`, `TauCeti.coe_frobeniusKernelSubgroup`, `TauCeti.frobeniusKernelSubgroup_normal`, `TauCeti.frobeniusKernel_isComplement'`, `TauCeti.ClassFunction.indExtend`, `TauCeti.ClassFunction.characterPairing_indExtend_indExtend` |
| `GL₂(𝔽_q)` | `TauCeti.card_conjClasses_GL2`, `TauCeti.GL2Borel`, `TauCeti.GL2PrincipalSeries`, `TauCeti.character_one_GL2PrincipalSeries`, `TauCeti.simple_GL2PrincipalSeries_iff` (stated for `F : Type`), `TauCeti.GL2Steinberg`, `TauCeti.GL2NonSplitTorus`, `TauCeti.GL2Cuspidal`, `TauCeti.finrank_GL2Cuspidal`, `Algebra.IsQuadraticExtension` |

The pinned Galois action is stated for a characteristic-zero field `K` containing a primitive
`n`-th root `ζ` with `exponent G ∣ n`, an algebraically closed extension `L`, and `K`, `L`, `G` in
one universe. The pinned `simple_GL2PrincipalSeries_iff` specializes the field to `Type`; its
arbitrary-universe form is a target of Layer 9.

### From `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras`

| Use here | Section |
|---|---|
| Schur's lemma in the form `End_{k[G]}(S) ≃ₐ[k] k` for a simple module over an algebraically closed `k`, and isotypic components | Layer 1 (simple modules, Schur, and isotypic components) |
| the block/simple-module dictionary of Artin–Wedderburn (`blocks_equiv_simpleModules`) | Layer 2 (Artin–Wedderburn, assembled with uniqueness) |

### From `TauCetiRoadmap.RepresentationTheory.InductionRestriction`

| Use here | Section |
|---|---|
| `Representation.ind`, the induced-character formula and Frobenius reciprocity | Layer 2 (induced characters and Frobenius reciprocity) |
| the Mackey decomposition and the irreducibility criterion for `GL₂` | Layers 3–4 |

### From `TauCetiRoadmap.RepresentationTheory.CompactGroups`

| Use here | Section |
|---|---|
| the `G × G`-isotypic decomposition `L²(G) ≅ ⨁̂_π End(V_π)` with probability Haar measure | Layer 5 (the Peter–Weyl theorem, the isotypic decomposition) |

### From `TauCetiRoadmap.PivotalSpherical`

| Use here | Section |
|---|---|
| the categorical Frobenius–Schur indicator on a pivotal category, compared with the finite-group indicator on `FDRep G` | its Frobenius–Schur indicator section |

## How to read the build

Layers 0 and 1 are supplier layers: they fix the names and conventions of the class-function and
class-algebra objects this roadmap consumes and add the two executable adapters it needs. Layer 2
builds the irreducible index and finite models, Layer 3 the multiplicity theory, character
recognition, product groups, the Burnside–Brauer theorem and the generating series; Layer 4 the
arithmetic of values and the field of values. Layer 5 records the specification the solver is
proved against. Layer 6 is the summit of strand C: the exact-coordinate bound and the completeness
and termination of the pinned solver. Layers 7–9 are independent applications built on Layer 3 and
the pinned library; Layers 10 and 11 are worked families on Layers 0–3. `README.md` is normative;
`Suggested.lean` states the headline theorems (the two solver theorems, Burnside–Brauer and its
generating series, the field of values, the exact-ring comparisons and bounds, the
arbitrary-universe principal-series criterion, and the quartic transverse energy) against the
pinned APIs with the few definitions they need, and nothing else.

---

## Layer 0: class functions and their pairing

### 0.1 Class functions

`TauCeti.ClassFunction k G` is the submodule of `G → k` of functions constant on conjugacy classes;
every `Representation.character ρ` and `FDRep.character V` is a member, by `char_conj`.
`TauCeti.ClassFunction.equivConjClasses : ClassFunction k G ≃ₗ[k] (ConjClasses G → k)` makes the
character table a square matrix indexed by classes, and
`TauCeti.ClassFunction.finrank_eq_card_conjClasses` gives `finrank k (ClassFunction k G) = Nat.card (ConjClasses G)` for finite `G`. *Needs:* Tau Ceti `TauCeti.ClassFunction` and the two
declarations named.

### 0.2 The pairing

`TauCeti.ClassFunction.characterPairing f₁ f₂ = (Nat.card G)⁻¹ • ∑ g, f₁ g * f₂ g⁻¹` is bilinear,
symmetric and nondegenerate when `Nat.card G` is invertible in `k`
(`TauCeti.ClassFunction.characterPairing_nondegenerate`); its value is the raw sum of Mathlib's
`char_orthonormal` (`TauCeti.ClassFunction.characterPairing_apply`), so `char_orthonormal` reads
`⟨χᵢ, χⱼ⟩ = δᵢⱼ` on irreducibles. One adapter is a target of this layer: over `ℂ`, for a virtual
character `f`, `f g⁻¹ = conj (f g)`, so the pairing of two virtual characters is the Hermitian
inner product `(Nat.card G)⁻¹ ∑ g, f₁ g * conj (f₂ g)` (Isaacs, Ch. 2; Serre, §2.3). *Needs:*
Tau Ceti `TauCeti.virtualCharacters`; Mathlib `Representation.char_dual`, the unit-modulus
eigenvalues of a finite-order operator (Layer 4.1).

**Checks.**
- Nondegeneracy needs the invertibility hypothesis: for `k = 𝔽₂` and `G = C₂`, the normalization
  `(Nat.card G)⁻¹` is `0`, the pairing vanishes identically, and "nondegenerate" would assert that
  every class function is zero.
- For `G = C₃` and the character `χ(g) = ω`, `⟨χ, χ⟩ = (1 + ω·ω² + ω²·ω)/3 = 1` with the `g⁻¹`
  convention, whereas the model "`(Nat.card G)⁻¹ ∑ f₁ g * f₂ g`" gives `(1 + ω² + ω)/3 = 0`.
- For `S₃` the pairing of the two-dimensional character `(2, 0, −1)` with the trivial character is
  `(2 + 3·0 + 2·(−1))/6 = 0`, and with itself `(4 + 0 + 2)/6 = 1`.

### Examples

The orthonormality of the rows of the `S₃` table `(1,1,1)`, `(1,−1,1)`, `(2,0,−1)` under the
class-size weighted pairing, and the failure of the unweighted sum `∑_C f₁(C) f₂(C⁻¹)` to be
orthonormal on the same rows.

### Dependencies

Mathlib `Representation.character`, `char_conj`, `FDRep.char_orthonormal`; Tau Ceti
`TauCeti.ClassFunction` and its pairing API.

## Layer 1: the group algebra, its center, and structure constants

### 1.1 Class sums and the center

`TauCeti.classSum k C = ∑_{g ∈ C} g ∈ k[G]` for `C : ConjClasses G`; it lies in the center
(`TauCeti.classSum_mem_center`), the class sums are a basis of `Z(k[G])`, and
`finrank k (Z(k[G])) = Nat.card (ConjClasses G)` (`TauCeti.finrank_center_monoidAlgebra`); the
center is commutative. The structure constants `TauCeti.structureConstant Cᵢ Cⱼ Cₖ = #{(x, y) : x ∈ Cᵢ, y ∈ Cⱼ, x * y = gₖ}` for a fixed `gₖ ∈ Cₖ` are representative-independent natural
numbers with `classSum Cᵢ * classSum Cⱼ = ∑ₖ aᵢⱼₖ • classSum Cₖ` (`TauCeti.classSum_mul`,
`TauCeti.classSumCenter_mul`); they are the entire input to Dixon–Schneider. Each class sum is
integral over `ℤ` as an element of `Z(ℤ[G])` (`TauCeti.isIntegral_classSum`,
`TauCeti.isIntegral_classSumCenter`), the base of central-character integrality; this is the
statement in the integral class center, the `ℤ`-subalgebra of `Z(ℤ[G])` spanned by the class sums,
not in `ℤ[G]` itself, where it is trivial. *Needs:* the named Tau Ceti declarations.

### 1.2 Executable class sums

Two adapters are targets of this layer, on `[Fintype G] [DecidableEq G]` data `d : TauCeti.ClassData G`:

- the class sum of the numbered class `i : Fin d.numClasses` as the finite sum
  `∑_{g ∈ d.classFinset i} of k G g` in `k[G]`, equal to `TauCeti.classSum k (d.classOf i)`;
- its coefficient function `g ↦ if d.index g = i then 1 else 0`, computable, equal to the
  coefficient of the group-algebra element at `g` (by `TauCeti.classSum_coeff`).

The group-algebra additive instance is noncomputable; executable class constants and matrices use
the numbered finite data. *Needs:* Tau Ceti `TauCeti.ClassData`, `TauCeti.classSum_coeff`.

**Checks.**
- For `G = S₃`, class of transpositions `C` with `|C| = 3`: `a_{C,C,1} = 3` (three ordered pairs
  `(t, t)`), `a_{C,C,C} = 0`, and `a_{C,C,T} = 3` for `T` the class of `3`-cycles; a definition counting
  unordered pairs would give `a_{C,C,1} = 3` but `a_{C,C,T} = 3/2`.
- For the trivial group the center is `k`, with one class sum `1` and `a_{1,1,1} = 1`.
- The coefficient function of the numbered class sum at `g ∉ C_i` is `0` and at `g ∈ C_i` is `1`,
  for every numbering `d` of the same group.

### Examples

`S₃` with its three class sums and the multiplication table of its class algebra;
`DihedralGroup 4` with five classes.

### Dependencies

Mathlib `MonoidAlgebra`, `ConjClasses`; Tau Ceti `TauCeti.classSum`, `TauCeti.structureConstant`,
`TauCeti.ClassData`.

## Layer 2: Wedderburn, the irreducible index, and the count

### 2.1 Wedderburn and the sum of squares

For `k` algebraically closed with `Nat.card G` invertible, `TauCeti.exists_algEquiv_pi_matrix`
gives a noncomputable `k[G] ≃ₐ[k] ∏ᵢ Matₙᵢ(k)` over a finite index with every `nᵢ > 0`, and
`TauCeti.sum_sq_eq_card_of_algEquiv_pi_matrix` gives `∑ᵢ nᵢ² = |G|` (from `finrank k k[G] = |G|`).
This layer consumes Mathlib's Artin–Wedderburn directly; what SemisimpleAlgebras supplies is the
block/simple-module dictionary `blocks_equiv_simpleModules` of its Layer 2, which §2.2 may consume
instead of reproving. *Needs:* Mathlib `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`,
Maschke; Tau Ceti as named.

### 2.2 The canonical irreducible index and finite models

Define the index of isomorphism classes of simple `k[G]`-modules, with `character`, `degree` and
the equivalence with the Wedderburn block index, and for each class `i` choose a representative
`Zᵢ : Representation k G (Fin (degree i) → k)` whose associated `k[G]`-module is simple. The carrier
lies in the universe of `k`, so `FDRep.of Zᵢ` is an object of `FDRep k G`; build the
representative by transporting a basis of a finite-dimensional simple module to this finite model.

Prove the universe-independent class lookup: a simple `k[G]`-module `S` in any universe has a
unique class `i` with `Nonempty (S ≃ₗ[k[G]] Zᵢ.asModule)`. Route:
`IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` identifies `S` with a simple left
ideal of `k[G]`, the regular-module/isotypic class bijection assigns that ideal its class, and a
finite basis transports the class representative to `Zᵢ`. This lookup lets the finite
simple-submodule decomposition of §3.2 be regrouped without placing its submodules in `FDRep`;
`char_orthonormal` is consumed on the finite models through `FDRep.of Zᵢ` and does not define the
lookup. *Needs:* Mathlib `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule`,
`Representation.asModuleEquiv`; §2.1; SemisimpleAlgebras Layer 2 `blocks_equiv_simpleModules`.

**Checks.**
- For `G = S₃` and `k = ℂ` the index has three elements with degrees `1, 1, 2`; `∑ nᵢ² = 6`.
- For the trivial group the index is a singleton with `Z = (Fin 1 → k)` and the trivial action.
- The class lookup of `S = Zᵢ.asModule` itself is `i`, and the lookup of `ULift (Zᵢ.asModule)` in a
  higher universe is the same `i`; a lookup defined only for carriers in the universe of `k`
  cannot be applied to the second.

### 2.3 The center splits, and the count

`Z(k[G]) ≃ₐ[k] (index → k)` by central-character evaluation
(`TauCeti.centerMonoidAlgebraAlgEquivPi`): central characters separate points of the center, the
sharp form Layer 5 needs. Combined with Layer 1's center dimension,
`Nat.card (index) = Nat.card (ConjClasses G)`
(`TauCeti.card_eq_card_conjClasses_of_algEquiv_pi_matrix`). *Needs:* §2.1, Layer 1.

**Checks.**
- `S₃`: three classes, three irreducibles; `Q₈` and `D₄`: five each.
- The evaluation map on the center of the trivial group algebra `k` is the identity `k ≃ k`.

### Examples

`S₃`, `D₄`, `Q₈`, `A₄` (four irreducibles of degrees `1, 1, 1, 3`, four classes).

### Dependencies

Layer 1; Mathlib Artin–Wedderburn and Maschke; SemisimpleAlgebras Layers 1–2.

## Layer 3: the character table, multiplicities, and tensor generation

The additivity, multiplicity, decomposition and recognition targets of this layer concern
finite-dimensional representations at arbitrary carrier universes.

### 3.1 Completeness and additivity

The irreducible characters span `ClassFunction k G`
(`TauCeti.ClassFunction.le_span_irreducibleCharacters`); with `char_orthonormal` and the count they
are an orthonormal basis `Basis (index) k (ClassFunction k G)`. Prove that `Representation.prod` has
character the sum of the two characters, that `Representation.directSum` over a finite index has
character the finite sum, and the finite-biproduct identity in `FDRep` (`FDRep.char_biprod`); use
`char_iso` to transport across equivalent presentations. *Needs:* Mathlib `char_iso`; Tau Ceti as
named.

### 3.2 Pairing to Hom, intrinsic multiplicities and cross-universe regrouping

For finite-dimensional `ρ : Representation k G V` and `σ : Representation k G W`, Mathlib's
`Representation.card_inv_mul_sum_char_mul_char_eq_finrank` is the identity
`⟨σ.character, ρ.character⟩ = finrank k (IntertwiningMap ρ σ)`, with only the finite-group and
invertible-order hypotheses; in `FDRep` it is `FDRep.scalar_product_char_eq_finrank_equivariant`.
Own the comparison `finrank k (FDRep.of Zᵢ ⟶ V) = finrank k (IntertwiningMap Zᵢ V.ρ)` through
`invariantsEquivFDRepHom` and `invariantsEquivIntertwiningMap`; do not reprove either pinned
identity.

Under finite `G`, algebraically closed `k` and invertible `Nat.card G`, define the **intrinsic
multiplicity** `m_ρ(i) := finrank k (IntertwiningMap Zᵢ ρ)` for finite-dimensional `ρ`, with `Zᵢ`
the finite model of §2.2; the pairing identity gives `⟨ρ.character, Zᵢ.character⟩ = m_ρ(i)`.

Prove the cross-universe regrouping: Maschke makes `k[G]` semisimple and finite-dimensionality
makes `ρ.asModule` finitely generated, so `IsSemisimpleModule.exists_linearEquiv_fin_dfinsupp`
decomposes it into finitely many simple submodules `Sⱼ`, possibly in a universe other than that of
`k`; assign each its class by §2.2; identify intertwiners from `Zᵢ` with `k[G]`-linear maps
(`IntertwiningMap.equivLinearMapAsModule`); `LinearMap.bijective_or_eq_zero` makes the Hom space
zero when the classes differ, and when they agree a chosen equivalence identifies it with
`Module.End k[G] Zᵢ.asModule`, a finite-dimensional division `k`-algebra, which SemisimpleAlgebras
Layer 1 collapses to `k`. Package the two cases as the cross-universe Hom-dimension formula, and
prove the regrouping theorem: the number of summands in class `i` is `m_ρ(i)`, by additivity of
equivariant Hom over the finite sum, so `ρ.asModule` is a finite direct sum of exactly `m_ρ(i)`
copies of `Zᵢ.asModule`. *Needs:* §2.2; Mathlib `IsSemisimpleModule.exists_linearEquiv_fin_dfinsupp`,
`LinearMap.bijective_or_eq_zero`, `IntertwiningMap.equivLinearMapAsModule`; SemisimpleAlgebras
Layer 1.

**Checks.**
- For `ρ` the regular representation of `S₃`, `m_ρ(i) = degree i`, giving `1, 1, 2`.
- For `ρ = Zⱼ`, `m_ρ(i) = 1` when `i = j` and `0` otherwise; a model using `finrank k (IntertwiningMap ρ Zᵢ)` with the arguments reversed gives the same numbers only because `k` is
  algebraically closed, and the orientation is fixed as stated.
- For the trivial group and `ρ` on `Fin 3 → k`, `m_ρ = 3`.

### 3.3 Module-to-representation adapters

Build the conversions: a `k[G]`-linear equivalence `ρ.asModule ≃ₗ[k[G]] σ.asModule` induces
`Representation.Equiv ρ σ` (through `Representation.asModuleEquiv` and
`IntertwiningMap.equivLinearMapAsModule`); a `k[G]`-linear equivalence identifies
`(Representation.directSum Z).asModule` with the finite `Π₀ i, Zᵢ.asModule` of
`exists_linearEquiv_fin_dfinsupp`; a simple submodule of `ρ.asModule` becomes a representation on
its carrier through `Subrepresentation.subrepresentationSubmoduleOrderIso`. These transport the
primary decomposition into a `Representation.Equiv` statement at arbitrary universes; use
`Rep.equivalenceModuleMonoidAlgebra` for the categorical mirror, and to lift the finite
decomposition to `FDRep`, put its finite-dimensional summands into `FDRep` and derive additivity of
the forgetful functor from `PreservesFiniteColimits`. *Needs:* the Mathlib declarations named.

### 3.4 Multiplicity API and character recognition

The intrinsic multiplicities obey `m_{ρ.prod σ}(i) = m_ρ(i) + m_σ(i)`, `m_{Zⱼ}(i) = δᵢⱼ`, and
`finrank k V = ∑ᵢ m_ρ(i) * degree i`; with §3.1 and the regrouping,
`ρ.character = ∑ᵢ (m_ρ(i) : k) • χᵢ`. For `[CharP k p]` with `0 < p`, `p ∤ |G|` and `k`
algebraically closed, the character basis gives the sharp criterion
`ρ.character = σ.character ↔ ∀ i, Nat.ModEq p (m_ρ(i)) (m_σ(i))`. If `k` is algebraically closed of
characteristic zero, casts of natural multiplicities are injective and
`Nonempty (Representation.Equiv ρ σ) ↔ ρ.character = σ.character` for finite-dimensional
representations at arbitrary carrier universes; for `V W : FDRep k G` obtain the categorical
statement from the representation result with `Action.mkIso` (compare Tau Ceti's
`FDRep.nonempty_iso_of_character_eq`, which is the `FDRep` form). *Needs:* §3.1–3.3.

**Checks.**
- For the trivial group over `k` of characteristic `p`, one trivial copy and `p + 1` trivial copies
  have the same character and different dimensions, so recognition fails in characteristic `p` and
  the congruence criterion is sharp.
- For `C₂` over `ℂ`, the regular representation and `1 ⊕ 1` have characters `(2, 0)` and `(2, 2)`
  and are not equivalent.
- `finrank` of the regular representation of `S₃` is `1·1 + 1·1 + 2·2 = 6`.

### 3.5 Idempotents, virtual characters, the table and column orthogonality

`TauCeti.Representation.primitiveCentralIdempotent ρ = (χ(1)/|G|) • ∑_g χ(g⁻¹) • g ∈ Z(k[G])`, with
class-sum expansion, orthogonality `eᵢ eⱼ = δᵢⱼ eᵢ`, `∑ᵢ eᵢ = 1`, and `e_χ` the Wedderburn projector
onto the `χ`-block (Layer 5 uses them directly). The virtual characters `TauCeti.virtualCharacters`
are the `ℤ`-span of the irreducible characters inside `ClassFunction ℂ G`, with integer-valued
pairing; they are the arena of integrality, the Galois action and table recognition. The table
`TauCeti.characterTable ℂ G : Matrix (Fin (Nat.card (ConjClasses G))) (ConjClasses G) ℂ` has entry
`χᵢ(g_C)` for any representative (well defined by `char_conj`), first column the degrees
`TauCeti.characterDegree ℂ i`, `∑ nᵢ² = |G|`. Column orthogonality carries the class-size weights:
`∑ᵢ χᵢ(g_C) conj(χᵢ(g_{C'})) = if C = C' then |G|/|C| else 0`
(`TauCeti.sum_characterTable_mul_conj`), proved from completeness, not from an informal "rescaling
is unitary". With columns the actual classes, the table is determined up to a permutation of rows
only (`TauCeti.characterTable_unique_rows`, Layer 5). Make the indexing adapters explicit: each
row index selects its irreducible character, exactly one row is the trivial character, and a
class-column entry is the value at any representative. *Needs:* Tau Ceti as named.

**Checks.**
- `S₃`: columns `1`, transposition, `3`-cycle have `∑ᵢ |χᵢ|² = 6, 2, 3 = |G|/|C|`.
- `C₃`: the table is the `3`rd-root-of-unity matrix; column orthogonality for the two nontrivial
  classes gives `1 + ω·ω̄² + ω²·ω̄ = 1 + ω² + ω = 0`, which a model without conjugation
  (`1 + ω·ω² + ω²·ω = 3`) gets wrong.
- The primitive central idempotent of the trivial character of `S₃` is `(1/6) ∑_g g`.

### 3.6 External tensor products and irreducibles of product groups

For finite `G, H` and an algebraically closed characteristic-zero `k`, construct the external tensor
product on `V ⊗[k] W`, `(g,h)·(v ⊗ w) = (ρ g v) ⊗ (σ h w)`, as `Representation.tprod` of the
pullbacks of `ρ` and `σ` along the two projections; export the pure-tensor equation, the group laws,
transport of intertwiners and equivalences, and the associativity, factor-swap, unit, dual and
finite-direct-sum comparisons. Keep it distinct from `Representation.prod` (a direct sum) and from
the internal tensor product of two representations of the same group.

Prove `χ_{ρ ⊠ σ}(g, h) = χ_ρ(g) χ_σ(h)` and the factorization of the pairing of Layer 0; for
irreducible `ρ, σ` the external product has norm one, hence is irreducible by the semisimple
irreducibility criterion, and two external products are equivalent iff their factors are.
Construct `ConjClasses (G × H) ≃ ConjClasses G × ConjClasses H` with its representative and
class-size equations; Layer 2's count and the pairwise distinct external irreducibles prove
completeness; construct the bijection between the index of `G × H` and the product of the indices,
with inverse and representative-equivalence equations. Every finite-dimensional irreducible of the
product, at arbitrary carrier universes, is assigned its pair by §2.2's lookup: constructing some
external irreducibles alone is not the classification. For `k = ℂ`, under these row and column
equivalences, Layer 3's table of `G × H` is the Kronecker product of the two tables; degrees
multiply, the trivial pair gives the trivial character, and regular multiplicities are products of
the factor degrees.

Construct the external Hom representation on `V →ₗ[k] W`, `(g,h)·f = σ(h) ∘ f ∘ ρ(g⁻¹)`, compare it
with `V* ⊠ W` (in that factor order) through the pinned dual, `linHom` and dual-tensor-Hom
equivalence after the product pullbacks, and with `ContRepresentation.biLinHom` on finite discrete
groups through its explicit factor-order conversion; its character is `χ_ρ(g⁻¹) χ_σ(h)`, and it is
irreducible when its two constituents are.

For `G = H` prove the bimodule compatibility of Layer 2's Wedderburn map: on `k[G]`, `(a, b)` sends
`e_g` to `e_{a g b⁻¹}`; on each `End(Vᵢ)` it sends `T` to `ρᵢ(a) T ρᵢ(b⁻¹)`; the Fourier map sends
`e_g` to `(ρᵢ(g))ᵢ`. Prove its algebra-equivalence and bimodule-equivariance equations and recover
that the left regular multiplicity of `Vᵢ` is `dim Vᵢ`. Identifying `k[G]` with functions on `G` by
coefficients, its multiplication is the unnormalized convolution `(f * g)(x) = ∑_y f(y) g(y⁻¹ x)`,
not pointwise multiplication; for probability-Haar convolution the comparison multiplies
coefficient functions by `|G|`: prove that scaling and the Fourier inverse and trace conventions,
and compare over `ℂ` with the isotypic decomposition of CompactGroups Layer 5 on the finite group.
The separate left and right actions need not be algebra automorphisms. *Needs:* §2.1–2.3, §3.2,
§3.5; Mathlib `Representation.tprod`, `Representation.dual`, `Representation.linHom`; Tau Ceti
`ContRepresentation.biLinHom`; CompactGroups Layer 5.

**Checks.**
- `C₂ × C₂`: the four external one-dimensional representations give its regular decomposition, and
  the Kronecker product of two copies of `[[1,1],[1,−1]]` is its table.
- A trivial factor: the table of `G × 1` is the table of `G`.
- For `G = H = S₃`, the external product of the two-dimensional representation with itself has
  degree `4` and norm `1·1 = 1`; the internal tensor product of the same two has character
  `(4, 0, 1)` and norm `2`, so the two notions differ.
- The left regular multiplicity of the two-dimensional irreducible of `S₃` is `2 = dim`.

### 3.7 Faithful tensor generation over ℂ (Burnside–Brauer)

For every finite `G` and `U : FDRep ℂ G`, define `characterValues U : Finset ℂ`, the set
`S_U = {χ_U(g) | g ∈ G}`, and `characterValueCount U := |S_U|`, written `r_U`. API: membership
and image, the description as the image of `TauCeti.ClassFunction.toConjClasses (ClassFunction.ofFDRep U)` on `ConjClasses G`, `0 < r_U ≤ Nat.card (ConjClasses G)`, invariance
under isomorphism of representations and under isomorphism of groups with transport of the action.
No choice of class representatives or irreducible enumeration enters.

With `Lagrange.basis` define `P_U(T) = ∏_{z ∈ S_U, z ≠ χ_U(1)} (T − z)/(χ_U(1) − z)`: its degree is
`r_U − 1`, it is `1` at `χ_U(1)` and `0` at the other nodes, so
`P_U(χ_U(g)) = if χ_U(g) = χ_U(1) then 1 else 0`; distinct nodes make the denominators nonzero and
a zero node causes no exception; give the coefficient expansion in powers `0, …, r_U − 1` including
the constant term.

If `U.ρ` is injective, `χ_U(g) = finrank ℂ U.V ↔ g = 1`: this is the pinned finite-order trace
criterion `Representation.char_eq_finrank_iff` with `FDRep.ker_eq_bot_iff`, whose proof
diagonalizes the finite-order operator and uses its unit-modulus eigenvalues (an arbitrary matrix
of trace `dim U` need not be the identity). So `P_U ∘ χ_U` is the indicator of `1`, and for a simple
`X : FDRep ℂ G`, bilinearity gives `⟨P_U ∘ χ_U, χ_X⟩ = χ_X(1)/|G| = dim X/|G| ≠ 0`. Own the
coefficient/pairing interchange `∑_{n < r_U} coeff(P_U, n) ⟨χ_U^n, χ_X⟩`, consume
`Representation.tensorPower` with its zero-fold action and `char_tensorPower`, and the pairing-to-Hom
identity in the orientation `⟨χ_{U^⊗n}, χ_X⟩ = finrank ℂ (X ⟶ U^⊗n)`. Over `ℂ` the order is
invertible and a simple object has positive dimension; if all these Hom dimensions vanished the
nonzero pairing would vanish. Hence the theorem `exists_pos_finrank_hom_tensorPower`: for
faithful `U` and simple `X` there is `n < r_U` with `0 < finrank ℂ (X ⟶ tensorPowerFDRep U n)`,
where `tensorPowerFDRep U n = FDRep.of (U.ρ.tensorPower n)`; and its weaker form with
`n < Nat.card (ConjClasses G)` (Isaacs, Theorem 4.3; Steinberg, *On the Burnside–Brauer–Steinberg
theorem*, Introduction). Occurrence is in the actual tensor power, not in a virtual-character
expression; §3.2 identifies the number with the intrinsic multiplicity, giving the
nonzero-intertwiner, injective-intertwiner and direct-summand forms, and the transport
`exists_pos_finrank_intertwining_tensorPower` to representations at arbitrary carrier universes
through `FDRep.ofShrink`. No irreducibility, self-duality, two-dimensionality or unitary embedding
of `U` is assumed.

Give also the grouped Vandermonde route: enumerate the nodes `z_a`, set `b_a = ∑_{χ_U(g) = z_a} χ_X(g⁻¹)`, and use `∑_a b_a z_a^n = 0` for `0 ≤ n < r_U`; the Vandermonde determinant forces all
`b_a = 0`, contradicting the identity fibre `b_{χ_U(1)} = dim X`. This uses the same bilinear
convention, with `χ_X(g⁻¹) = conj(χ_X(g))` and no conjugation of `z_a`. *Needs:* §3.2, §3.5;
Tau Ceti `Representation.char_eq_finrank_iff`, `FDRep.ker_eq_bot_iff`, `Representation.tensorPower`,
`Representation.char_tensorPower`, `FDRep.ofShrink`; Mathlib `Lagrange.basis`,
`Matrix.det_vandermonde`, `FDRep.scalar_product_char_eq_finrank_equivariant`.

**Checks.**
- The zero-fold tensor power is the trivial one-dimensional module, with `0^0 = 1` in its character
  formula; for the trivial group `r_U = 1` for every `U`, and exponent `0` supplies its only simple
  class.
- A faithful zero-dimensional `U` forces `G` trivial, has `S_U = {0}` and satisfies the theorem at
  `n = 0`; a hypothesis `dim U > 0` would exclude it needlessly.
- Nonfaithful `U`: the trivial module of `C₂` has `r_U = 1`, the interpolation isolates the kernel,
  and no tensor power contains the sign module; the faithfulness hypothesis is necessary.
- `S₃` with `U` its two-dimensional irreducible: `S_U = {2, 0, −1}`, `r_U = 3`; `U^⊗0 = 1`,
  `U^⊗1 = U`, `U^⊗2 = 1 ⊕ sgn ⊕ U`, so every irreducible occurs with `n < 3`, and sgn needs `n = 2`.
- For the faithful `U = χ₁ ⊕ χ₃` of `C₄` (§3.8), `r_U = 3` while `C₄` has `4` classes; every
  irreducible occurs with `n ≤ 2 < 3`.

### 3.8 Tensor-multiplicity generating series and positive powers

For `U, X : FDRep ℂ G`, put `m_n = finrank ℂ (X ⟶ U^⊗n)` and define
`tensorMultiplicitySeries U X := PowerSeries.mk (n ↦ m_n) : PowerSeries ℂ`, written `F_X`. The
theorem `tensorMultiplicitySeries_eq_characterFractions` is

`F_X(z) = |G|⁻¹ ∑_{g ∈ G} χ_X(g⁻¹) · (1 − χ_U(g) z)⁻¹`,

each factor inverted as a formal power series with constant coefficient `1`; no analytic
convergence enters. Group the sum by `S_U` with `b_a = ∑_{χ_U(g) = a} χ_X(g⁻¹)`, and in `ℂ[z]`
construct `Q(z) = ∏_{a ∈ S_U} (1 − a z)` and `N_X(z) = |G|⁻¹ ∑_{a ∈ S_U} b_a ∏_{b ≠ a} (1 − b z)`;
prove `Q(0) = 1` and `Q · F_X = N_X` after `Polynomial.toPowerSeries`, with coefficient,
constant-term, reindexing, representation-isomorphism and group-isomorphism comparisons. For
`R(T) = ∏_{a ∈ S_U} (T − a) = ∑_{j ≤ r_U} c_j T^j` prove the recurrence `∑_{j ≤ r_U} c_j m_{n+j} = 0`
for every `n ≥ 0`. A zero character value is a node of `R` and contributes the factor `1` to `Q`;
the zero-dimensional `U` is included.

When `U` is faithful and `d = dim U > 0`, §3.7 gives `b_d = dim X` and `χ_U(g) ≠ d` for `g ≠ 1`, so
for nonzero `X`, `N_X(1/d) = (dim X/|G|) ∏_{a ≠ d} (1 − a/d) ≠ 0` while `Q(1/d) = 0`; hence `F_X`
is not a polynomial (a polynomial identity `Q F_X = N_X` would fail at `1/d`). For simple `X` this
is `arbitrarily_large_tensorPowers`: for every `B` there is `n ≥ B` with `m_n > 0`. The sharp
positive-power bound `exists_positive_tensorPower_le_valueCount`, `1 ≤ n ≤ r_U`, follows by
replacing `P_U(T)` with `(T/d) P_U(T)`, of zero constant term and degree `r_U`; if all positive
coefficients vanished, the constant series would be `m_0 = dim Hom_G(X, 1)`, which is `0` for a
nontrivial simple `X` and `1` for the trivial one. The hypothesis `d > 0` is essential: the zero
representation of the trivial group is faithful and all its positive tensor powers are zero.
*Needs:* §3.7; Mathlib `PowerSeries`, the inverse of a power series with unit constant term,
`Polynomial.toPowerSeries`; Steinberg, Introduction and Remark 1.

**Checks.**
- `G = Multiplicative (ZMod 4)` with generator `g`, `χⱼ(g^a) = i^{ja}`, `U = χ₁ ⊕ χ₃`, faithful with
  character `(2, 0, −2, 0)` on `1, g, g², g³`; `S_U = {2, 0, −2}`. `U^⊗0 ≅ χ₀`, `U ≅ χ₁ ⊕ χ₃`,
  `U^⊗2 ≅ χ₀^⊕2 ⊕ χ₂^⊕2`, with explicit intertwiners. The exact series are
  `F_0 = (1 − 2z²)/(1 − 4z²)`, `F_2 = 2z²/(1 − 4z²)`, `F_1 = F_3 = z/(1 − 4z²)`, with nonnegative
  integral coefficients and the recurrence `m_{n+3} = 4 m_{n+1}` from `R(T) = T³ − 4T`. A model
  taking `χ_U(g)^0 = 0` at `χ_U(g) = 0` would give `m_0 = 1/2` for `χ₀`.
- The span of the characters of all tensor powers of that `U` is exactly the three-dimensional
  space of class functions with `f(g) = f(g³)`, while every one of the four irreducibles occurs:
  spanning by characters and occurrence of summands are different statements.
- Trivial group, `U` the zero representation: `F_1 = 1`, a polynomial, so `arbitrarily_large_tensorPowers`
  fails without `d > 0`.

### Examples

The `S₃` and `C₄` tensor-power decompositions above; the Kronecker table of `C₂ × C₂`.

### Dependencies

Layers 0–2; SemisimpleAlgebras Layer 1; CompactGroups Layer 5 (for the bimodule comparison only);
Mathlib `Lagrange.basis`, `PowerSeries`; Tau Ceti `Representation.tensorPower`,
`Representation.char_eq_finrank_iff`. This layer does not depend on Layer 4, on degree
divisibility, on a McKay graph or on a finite-subgroup classification.

## Layer 4: the arithmetic of character values

### 4.1 Diagonalizability, per arena

Over general `k` with `char ∤ |G|`, `ρ g` annihilates the squarefree `X^d − 1` (`d = orderOf g ∣ e`),
so it is semisimple (`Module.End.isSemisimple_of_squarefree_aeval_eq_zero`) with eigenvalues among
the `d`-th roots of unity in `k`. Over `ℂ` those eigenvalues are complex `e`-th roots of unity, so
`χ(g)` is a sum of `χ(1)` roots of unity of modulus one. Own the adapter that a semisimple
endomorphism over `ℂ` with a single eigenvalue is scalar, and the finite-sum equality case of the
triangle inequality for unit complex numbers. *Needs:* Mathlib as named.

### 4.2 Values are cyclotomic integers

Over `ℂ`, exhibit the eigenvalues of `ρ g` as `e`-th roots and lift their sum into
`K = CyclotomicField e ℚ`: for an embedding `ι : K →+* ℂ` carrying a chosen primitive root to a
primitive root of `ℂ`, every complex `e`-th root lies in the image (`IsPrimitiveRoot.map_of_injective`,
`IsPrimitiveRoot.eq_pow_of_pow_eq_one`), and there is a multiset `μ` of exactly `χ(1)` elements of
`K` with `ξ^e = 1`, `χ_K(g) = μ.sum` and `ι(χ_K(g)) = χ(g)`. Mathlib already proves
`Representation.isIntegral_character`; the targets are the lift, its membership in the ring of
integers of `K`, and the embedding-transfer adapter (`isIntegral_algHom_iff` for the injective
`ι.toIntAlgHom`). No cyclotomic-integrality theorem is stated over an arbitrary `k`. *Needs:* §4.1;
Mathlib `CyclotomicField`, `IsPrimitiveRoot.map_of_injective`, `isIntegral_algHom_iff`.

**Checks.**
- `C₃`, `χ(g) = ω`: the lift is `ζ₃` in `ℚ(ζ₃)`, integral; `e = 3`, `K = ℚ(ζ₃)`.
- `S₃`, the two-dimensional character at a `3`-cycle: `ω + ω² = −1`, lifted as `ζ + ζ²`, an integer.
- `Q₈`, the two-dimensional character at `i`: `i + (−i) = 0`; the lift is `ζ₄ + ζ₄³ = 0`.

### 4.3 Central characters and degree divisibility

`TauCeti.Representation.centralCharacter ρ : Z(k[G]) →ₐ[k] k` is the scalar by which the center
acts on the simple module (Schur, through `isIntertwiningMap_of_mem_center`), with
`ω_χ(K_j) = |C_j| · χ(g_j) / χ(1)`
(`TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`); its value on a class
sum is an algebraic integer (`TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`),
because `classSum C` is integral in the integral class center (Layer 1) and an algebra
homomorphism preserves integrality. From row orthogonality `|G| = ∑ⱼ |Cⱼ| χ(gⱼ) χ(gⱼ⁻¹)` the sum
`|G|/χ(1) = ∑ⱼ ω_χ(Kⱼ) χ(gⱼ⁻¹)` is an algebraic integer, Galois-invariant hence rational, hence an
integer: `χ(1) ∣ |G|` (`TauCeti.Representation.finrank_dvd_card`). *Needs:* Tau Ceti as named.

**Checks.**
- `S₃`, the two-dimensional `χ`, class of `3`-cycles: `ω_χ = 2·(−1)/2 = −1`, an integer; class of
  transpositions: `3·0/2 = 0`.
- `Q₈`, the two-dimensional `χ` at the class `{i, i⁻¹}`: `2·0/2 = 0`; at `−1`: `1·(−2)/2 = −1`.
- A model `ω_χ(K_j) = χ(g_j)/χ(1)` without the class size gives `−1/2` on the `3`-cycles of `S₃`,
  not an integer.

### 4.4 The Galois action and the field of values

The action lives on `K = ℚ(ζ_e)`, never on `ℂ`. Tau Ceti supplies it: for a characteristic-zero
`K` with a primitive `n`-th root `ζ`, `exponent G ∣ n`, and an algebraically closed extension `L`
in the same universe, `IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv` identifies
`virtualCharacters K G` with `virtualCharacters L G` by scalar extension;
`IsPrimitiveRoot.cyclotomicVirtualCharacterAction` is the homomorphism
`Gal(K/ℚ) →* Multiplicative (AddAut (virtualCharacters L G))`, so the action laws are the
homomorphism laws; `IsPrimitiveRoot.cyclotomicVirtualCharacterAction_apply` is the value formula
`(σ · χ)(g) = χ(g ^ j)` with `j = (hζ.autToPow ℚ σ).val`;
`IsPrimitiveRoot.cyclotomicVirtualCharacterAction_equiv_apply` says that on a descended character
the action is `σ` on the `K`-values; `IsPrimitiveRoot.cyclotomicVirtualCharacterAction_mem_irreducibleCharacters`
and `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction` (`Gal(K/ℚ) →* Equiv.Perm (irreducibleCharacters L G)`) give the permutation of the irreducible characters, independent of
any row enumeration. On class functions the same twist is `TauCeti.ClassFunction.powMap j`
(`Representation.map_ofCharacter_eq_powMap`). The Galois action and the power maps of group
elements meet on the table in the class-power identity of §6.6.

The target of this subsection is `fieldOfValues_eq_map_fixedField_stabilizer`: for `G : Type`
finite, `K` with `IsCyclotomicExtension {exponent G} ℚ K` and a field embedding `K → ℂ`, an
irreducible complex character `χ` (a member of `TauCeti.irreducibleCharacters ℂ G`), and the
subgroup `H ≤ Gal(K/ℚ)` of those `σ` with `χ(g ^ j) = χ(g)` for all `g` (`j` the cyclotomic
exponent of `σ` relative to the distinguished primitive root of `K`, so `H` is the stabilizer of
`χ` for the action above), the field `ℚ(χ) = ℚ(χ(g) : g ∈ G) ⊆ ℂ` is the image under the embedding
of the fixed field `K^H` (Isaacs, Chapter 9; Serre, Ch. 12, §§12.3–12.4). Route: by the descent
equivalence `χ = ι ∘ χ_K` for a `K`-valued `χ_K`; the value formula and injectivity of `ι` show
`σ ∈ H` iff `σ` fixes every `χ_K(g)`, that is iff `σ` fixes `ℚ(χ_K) ⊆ K`; the Galois
correspondence for `K/ℚ` gives `ℚ(χ_K) = K^H`; and `ι` maps `ℚ(χ_K)` onto `ℚ(χ)`. The statement
holds for every embedding, since `H` is defined from `χ` alone. *Needs:* Mathlib
`IsCyclotomicExtension`, `IsPrimitiveRoot.autToPow`, `IntermediateField.fixedField`,
`IsGalois.fixedField_fixingSubgroup`; Tau Ceti `IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv`,
`IsPrimitiveRoot.cyclotomicVirtualCharacterAction_apply` (equivalently
`TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` with `Representation.map_ofCharacter_eq_powMap`).

**Checks.**
- `G = C₄ = ⟨g⟩`, `χ(g) = i`, `e = 4`, `K = ℚ(i)`: the nontrivial `σ` has `j = 3` and
  `χ(g³) = −i ≠ i`, so `H = 1` and `ℚ(χ) = ℚ(i)`, not `ℚ`.
- The sign character of `S₃`, `e = 6`, `j = 5`: `sgn(g⁵) = sgn(g)`, so `H = Gal(K/ℚ)` and `ℚ(χ) = ℚ`
  although `K = ℚ(√−3) ≠ ℚ`; the model "`ℚ(χ) = K`" is wrong.
- The two-dimensional character of `Q₈` (values `2, −2, 0`), `e = 4`: `H = Gal(ℚ(i)/ℚ)`, `ℚ(χ) = ℚ`.
- The trivial group: `e = 1`, `K = ℚ`, `j = 0`, `g⁰ = 1 = g`, `H = ⊤`, both sides `ℚ`.
- With an arbitrary class function in place of `χ` the statement is false: for `G = C₃` and
  `f(g) = f(g²) = i`, every `σ` fixes `f` in the sense of `H` but `ℚ(f) = ℚ(i) ≠ ℚ`; hence the
  irreducibility hypothesis.

### 4.5 Brauer's splitting field, and the universe adapter

`ℚ(ζ_e)` is a splitting field: every irreducible `ℂ`-representation is realizable over it. This is
consumed from Tau Ceti: `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` (virtual-character
descent), `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` and
`FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension` (an absolutely irreducible
model over a field containing the roots of unity, including an abstract `K` with
`IsCyclotomicExtension {exponent G} ℚ K`, for any algebraically closed extension in the same
universe), and `FDRep.exists_simple_nonempty_iso_baseChange_adjoin_of_isPrimitiveRoot` (the
intermediate field `ℚ⟮ζ⟯ ⊆ ℂ`, for `G : Type`). The one target is the transport of the realization
along `ULift`/`Shrink` for `G : Type v`, since the pinned statements put `K`, `L`, `G` in one
universe and `ℂ : Type`. The compatibility of the realization field `ℚ⟮ζ⟯`,
`ζ = TauCeti.Cyclotomic.complexRoot e`, with the exact ring is §6.1, through which the Galois
action of `ℚ⟮ζ⟯` becomes the one of the class-power identity. *Needs:* Tau Ceti as named; Mathlib
`ULift`, `Shrink`.

### 4.6 Background: Burnside's `pᵃqᵇ` theorem

Every group of order `pᵃqᵇ` (primes `p, q`, `a, b ≥ 0`) is solvable:
`TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow`, consumed, with its first step
`Representation.char_eq_zero_or_exists_apply_eq_smul` (for an irreducible `χ` and `g` with
`gcd(|gᴳ|, χ(1)) = 1`, either `χ(g) = 0` or `ρ g` is scalar). The route the pinned proof follows,
recalled for orientation: the central value `|C| χ(g)/χ(1)` and `χ(g)` are integral, Bézout makes
`χ(g)/χ(1)` integral, every Galois conjugate has modulus at most one
(`NumberField.Embeddings.pow_eq_one_of_norm_le_one`), so `|χ(g)| = χ(1)` and the equality case of
§4.1 makes `ρ g` scalar; for a nonabelian simple group no `g ≠ 1` has a class of prime-power size
(column orthogonality against the identity class, `1 + p·β = 0` with `β` integral, `IsIntegral.ratCast_iff`);
and strong induction on the order with `IsPGroup.center_nontrivial`, `Subgroup.index_centralizer_eq_ncard`,
`Sylow.card_eq_multiplicity`, `IsPGroup.isNilpotent` and `Group.isSolvable_iff_subgroup_quotient`
(Isaacs, Ch. 3; Burnside). This application is not a prerequisite of the solver.

**Checks.**
- `|G| = 12 = 2²·3`: `A₄` and `D₆` are solvable.
- `A₅`, of order `60 = 2²·3·5`, is not of the form `pᵃqᵇ` and is not solvable; the theorem does not
  apply and the class of `5`-cycles of size `12` is not a prime power.
- `S₃`: the transpositions form a class of size `3 = 3¹` and `χ(t) = 0` for the two-dimensional
  `χ`, the "zero" branch of the alternative; the sign character has scalar action, the other branch.

### Examples

The cyclotomic lifts of the `C₃`, `A₄` and `A₅` tables (values in `ℚ(ζ₃)` and `ℚ(√5) ⊆ ℚ(ζ₅)`);
the fields of values `ℚ(χ)` of all irreducibles of `A₄` (`ℚ(ζ₃)` for the two nontrivial linear
characters, `ℚ` for the others) and `A₅` (`ℚ(√5)` for the two three-dimensional characters).

### Dependencies

Layer 3's table and Layer 1's integral class center; Mathlib cyclotomic fields, Galois theory;
Tau Ceti `CyclotomicAction`, `Galois`, `SplittingField`, `Solvable`.

## Layer 5: the Dixon–Schneider characterization (the specification)

This layer records the theorem that the structure constants plus Layer 4's arithmetic determine the
table, and the checker it yields; it is stated over `ℂ`, and strand C computes it. All of it is
pinned; the roadmap fixes the conventions and the witnesses.

### 5.1 The coordinate identity and the class-multiplication matrices

From multiplicativity of `ω_χ` and `Kᵢ Kⱼ = ∑ₖ aᵢⱼₖ Kₖ`: `ω_χ(Kᵢ) ω_χ(Kⱼ) = ∑ₖ aᵢⱼₖ ω_χ(Kₖ)`, the
algebraic fact the eigenvector theorem rests on. `TauCeti.classMultMatrix i` is `(Mᵢ)ⱼₖ = aᵢₖⱼ`,
acting on row vectors from the left (`ᵥ*`); the `{Mᵢ}` commute (`TauCeti.classMultMatrix_commute`),
and the row `v_χ = (ω_χ(K₁), …, ω_χ(K_r))` of `TauCeti.centralCharacterTable ℂ G` satisfies
`v_χ ᵥ* Mᵢ = ω_χ(Kᵢ) v_χ` (`TauCeti.isClassEigenrow_centralCharacterTable`): the rows of `Ω` are
common left eigenvectors. Conversely a vector `v` with `v(1) = 1` is a common left eigenvector of
every `Mᵢ` iff it is the evaluation of an algebra homomorphism `Z(ℂ[G]) → ℂ` on the class sums
(`TauCeti.isClassEigenrow_iff_exists_algHom`): the homomorphisms of the split class algebra are
finite in number, orthonormality forbids repetitions, and the row count exhausts them. The
column/`*ᵥ` convention would need the transposed matrix `(Mᵢ)ⱼₖ = aᵢⱼₖ`; exactly one pairing of
matrix and side is pinned. *Needs:* Layer 1, §2.3, §4.3; Tau Ceti as named.

**Checks (the convention witness).**
- `S₃` with classes `1`, `T` (transpositions, size `3`), `R` (`3`-cycles, size `2`):
  `K_T² = 3K_1 + 3K_R`, `K_T K_R = 2K_T`, `K_R² = 2K_1 + K_R`. In the order `(1, T, R)` the pinned
  `(M_T)_{j,k} = a_{T,k,j}` is `M_T = [[0,3,0],[1,0,2],[0,3,0]]`. The central rows are `(1,3,2)`
  (trivial), `(1,−3,2)` (sign) and `(1,0,−1)` (degree `2`), and `v ᵥ* M_T` is `(3,9,6)`,
  `(−3,9,−6)`, `(0,0,0)`: eigenvalues `3, −3, 0 = ω_χ(K_T)`. The column action `M_T *ᵥ v` sends
  `(1,3,2)` to `(9,5,9)`, not a multiple: the convention is pinned by this example.
- The identity class gives `M_1 = 1`, eigenvalue `1` on every row, which both conventions satisfy;
  it is not a witness.
- The trivial group: one `1 × 1` matrix `[[1]]`.

### 5.2 Normalization, degree recovery, and the specification

Normalize each eigenrow by `ω_χ(K₁) = 1`. Then `d_χ² = |G| / ∑ⱼ |Cⱼ|⁻¹ ω_χ(Kⱼ) ω_χ(Kⱼ⁻¹)` recovers
only the square of the degree, and the checker additionally requires `d_χ ∈ ℕ`, `d_χ > 0`,
`d_χ ∣ |G|` and `∑_χ d_χ² = |G|`, which pin the degree and hence, through
`χ(gⱼ) = d_χ · ω_χ(Kⱼ)/|Cⱼ|`, the ordinary table from `Ω`. `TauCeti.IsCharacterTableSpec G X` over
`ℂ` says: rows are orthonormal class functions of the right count, each normalized row is a common
left eigenvector of the `{Mᵢ}`, and the degrees are positive integers dividing `|G|` with
`∑ dᵢ² = |G|`. `TauCeti.characterTable ℂ G` satisfies it
(`TauCeti.isCharacterTableSpec_characterTable`), and any `X'` satisfying it equals the table up to
a permutation of rows (`TauCeti.characterTable_unique_rows`): "the algorithm produced *a* table"
means "the algorithm produced *the* table". *Needs:* §5.1; Tau Ceti as named.

**Checks.**
- `S₃`, degree-`2` row `(1, 0, −1)`: `∑ⱼ |Cⱼ|⁻¹ ω ω̄ = 1 + 0 + 1/2 = 3/2`, so `d² = 6/(3/2) = 4`,
  `d = 2`.
- The formula alone admits `d = −2`; the positivity clause excludes it, and the integrality clause
  excludes `d = √2` for the hypothetical row with `∑ = 3`.
- The identity-class normalization fails for a row with `ω(K₁) = 0`: such a row is not a central
  character (every central character has `ω(K₁) = 1`).

### Examples

The three `S₃` eigenrows above; the five commuting `5 × 5` matrices of `D₄`.

### Dependencies

Layers 1–4 (the coordinate identity, idempotents, center splitting, central-character integrality
and degree divisibility); Tau Ceti `Eigenrow`, `Specification`.

## Layer 6: exact reconstruction for the executable solver

The pinned solver `TauCeti.ClassData.dixonCyclotomicCharacterTable?` returns an `Option` of an
exact central table `omega`, ordinary table `table` and positive natural degrees
(`TauCeti.ClassData.CyclotomicCharacterTableData`), and its soundness theorem applies to every
successful result. Its completeness theorem is conditional on a bound on the coefficients of an
exact certificate. This layer supplies that certificate with an explicit bound, hence an explicit
prime threshold at which the solver is complete, and the termination of its prime search
`TauCeti.ClassData.characterTableDixon?`. It replaces none of the pinned objects and weakens no
certificate.

### 6.1 The exact ring and its comparison with the ring of integers

`TauCeti.Cyclotomic e` has computable ring operations, decidable equality, the generator
`TauCeti.Cyclotomic.zeta e`, coordinates `TauCeti.Cyclotomic.coeff x k` (the stored list is
descending; `coeff x k` reads the ascending power coordinate), `ofCoeffList`, `equivAdjoinRoot`,
and for `e > 0` the embedding `TauCeti.Cyclotomic.complexEmbedding` sending `zeta e` to the primitive
root `complexRoot e`, injective. `TauCeti.Cyclotomic.evalRingHom` evaluates at any root of the
mapped cyclotomic polynomial, and `reduceRingHom` at a primitive root supplies the solver's
reductions; no evaluation at a nonroot is asserted.

The target `exists_ringOfIntegers_equiv_integralPowerBasis` compares the exact ring with Mathlib's
cyclotomic field on the same generator: for `K = CyclotomicField e ℚ` with its distinguished
primitive root `ζ = IsCyclotomicExtension.zeta e ℚ K`, there are a ring isomorphism
`E : Cyclotomic e ≃+* 𝓞 K` and a field embedding `ι : K →+* ℂ` such that `ι ζ = complexRoot e`,
`E (zeta e) = ζ`, `ι ∘ algebraMap ∘ E = complexEmbedding` on every exact element, and the
coordinates of `E x` in the integral power basis `hζ.integralPowerBasis` (of dimension `φ(e)`,
`IsPrimitiveRoot.integralPowerBasis_dim`) are the native `coeff x k`, `k < φ(e)`; not an arbitrary
integral basis. Route: `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton` and
`cyclotomicRing_isIntegralClosure` identify `𝓞 K` with `ℤ[ζ] ≅ ℤ[X]/Φ_e`, `equivAdjoinRoot`
identifies the exact ring with the same quotient, and the embedding is the one of
`IsCyclotomicExtension` composed with the choice of root; `ι` exists because `K` is a number field.
*Needs:* Mathlib as named; Tau Ceti `TauCeti.Cyclotomic.equivAdjoinRoot`,
`TauCeti.Cyclotomic.complexEmbedding_zeta`, `TauCeti.Cyclotomic.isPrimitiveRoot_complexRoot`.

**Checks.**
- `e = 1`: `Cyclotomic 1 = ℤ[X]/(X − 1) ≅ ℤ`, `K = ℚ`, `𝓞 K = ℤ`, `φ(1) = 1`, `zeta 1 = 1`,
  `complexRoot 1 = 1`; the coordinate of `x` is `x` itself.
- `e = 4`: `Φ₄ = X² + 1`, `𝓞 K = ℤ[i]`, `complexRoot 4 = i`; `zeta 4 ^ 2` has coordinates
  `(−1, 0)`, and `E` must send it to `−1`, which the clause `E (zeta e) = ζ` enforces; an
  isomorphism sending `zeta` to `−i` would satisfy every clause except that one.
- `e = 3`: `ζ²` has coordinates `(−1, −1)` on the basis `1, ζ` since `ζ² = −1 − ζ`.

### 6.2 Executable input and the left-row convention

Consume `TauCeti.ClassData G` (finite class enumeration, representatives, class sizes, structure
constants, `equivConjClasses`). The conductor `e` is an explicit natural with
`he : e = Monoid.exponent G` on the executable path, since `Monoid.exponent` is not computed.
`TauCeti.kernelBasis` returns the right kernel; with the convention of §5.1 a left eigenspace is the
right kernel of `M_iᵀ − λI`, and `TauCeti.ClassData.centralCharacterSearch` transposes the family
before its joint eigenvalue search, with the normalized-eigenrow/algebra-homomorphism equivalence.
Good Dixon primes `TauCeti.IsGoodDixonPrime` split the center of `(ZMod p)[G]`
(`TauCeti.IsGoodDixonPrime.nonempty_center_algEquiv_pi`); no "no-merging" oracle is assumed.
*Needs:* Tau Ceti as named.

### 6.3 A computable canonical bound and eigenvalue multiplicities

For `e > 0` define `canonicalPowerBound e = max(1, max_{j < e, k < φ(e)} |coeff(zeta e ^ j, k)|)`,
written `A_e`, by the native finite coordinate computations, and
`centralCoefficientBound G e = |G| · A_e`, written `B_G`; own the finite-maximum and
coordinate-additivity adapters (`|coeff(x + y, k)| ≤ |coeff(x,k)| + |coeff(y,k)|`,
`coeff(m • x, k) = m · coeff(x, k)` for `m ∈ ℤ`, from `TauCeti.Cyclotomic.coeffs_intCast_mul`).
The theorem `exists_eigenvalue_multiplicities`: for `V : FDRep ℂ G`, `e = exponent G` and `g ∈ G`,
there are multiplicities `m : Fin e → ℕ` of the eigenvalues `complexRoot(e)^j` of `V.ρ g` with
`∑ mⱼ = dim V`, such that `x_g = ∑ mⱼ zeta(e)^j` has complex image `χ(g)` and
`|coeff(x_g, k)| ≤ dim V · A_e` for every `k`. This includes `dim V = 0` without a central character
for the zero representation. *Needs:* §4.1, §6.1; Tau Ceti `TauCeti.Cyclotomic.coeff`,
`TauCeti.Cyclotomic.coeffs_intCast_mul`.

**Checks.**
- `e = 1`: `A_1 = 1`; for the trivial group `B_G = 1`.
- `e = 4`: the powers `1, ζ, −1, −ζ` have coordinates `(1,0), (0,1), (−1,0), (0,−1)`, so `A_4 = 1`;
  `e = 3`: `ζ² = −1 − ζ` gives `A_3 = 1`; `e = 12`: `Φ₁₂ = X⁴ − X² + 1`, so `ζ⁴ = ζ² − 1`,
  `ζ⁵ = ζ³ − ζ`, `ζ⁶ = −1`, and every power `ζ^j`, `j < 12`, has coordinates in `{−1, 0, 1}`, so
  `A_12 = 1`. A model reading the stored descending list by raw index would report
  `coeff(ζ⁴, 1) = 1` instead of `0` for `e = 12`: `coeff` is the ascending coordinate.
- `S₄`, `e = 12`: `B_G = 24`.

### 6.4 Exact central values and the division-free identity

For a simple representation `d > 0`. Using
`TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one` and
`isIntegral_centralCharacter_classSumCenter`, the embedding `ι` of §6.1 (carrying `ζ` to
`complexRoot e`), the lift of every complex `e`-th root through `ι`, and the transfer of complex
integrality back to `K` along the injective `ι`, `χ(g)` and `Ω_C = |C| χ(g)/d` lie in the image of
`𝓞 K`, hence in the image of the exact ring by §6.1. The theorem
`exists_exact_of_integral_mem_cyclotomic`: an algebraic integer `z ∈ ℂ` lying in
`Algebra.adjoin ℚ {complexRoot e}` is the image of an exact element. The theorem
`exists_exact_character_and_central_values`: for every row `i` of `TauCeti.characterTable ℂ G` and
class `C` there are exact `x, w` with images the ordinary and central entries, the division-free
identity `d · w = |C| · x` in `Cyclotomic e` (`d = TauCeti.characterDegree ℂ i`), and
`|coeff(w, k)| ≤ |C| · A_e ≤ B_G`. Route: injectivity of the embedding gives `d·w = |C|·x`; the
canonical coordinates give `d·bₖ = |C|·aₖ` in `ℤ`; absolute values and cancellation of the positive
integer `d` give `|bₖ| ≤ |C| A_e`. No claim `d ∣ |C|`, no division in the integral ring and no bound
read off complex absolute values is used. *Needs:* §4.2, §4.3, §6.1, §6.3.

**Checks.**
- `S₄`, trivial row, class of `4`-cycles (`|C| = 6`): `Ω = 6`, `x = 1`, `w = 6`, `d = 1`,
  `|coeff| = 6 ≤ 6·1`.
- `S₄`, trivial row, class of `3`-cycles (`|C| = 8`): `Ω = 8`, `w = 8`, and the lift from residues
  needs `2·8 = 16 < p`. The pinned threshold `2⌊√24⌋ = 8 < p` admits `p = 13`, for which `16 > 13`
  and the residue `8 ≡ −5 (mod 13)` does not determine the entry; the bound `B_G = 24` with
  `p > 48` does.
- `A₄`, the linear character `L₁` at the class of `(012)` (`|C| = 4`): `Ω = 4ω`, `w` has coordinates
  `(0, 4)` on `1, ζ₃`, `|coeff| = 4 ≤ 4·A_3 = 4`.

### 6.5 Stronger primes, with the native predicate unchanged

Keep `TauCeti.IsGoodDixonPrime` and `TauCeti.DixonPrimeData` with its primitive modular root. Their
inequality `2⌊√|G|⌋ < p` does not bound every canonical central coefficient (the `S₄` entry above).
For complete reconstruction require additionally `p > 2B_G`. The theorem `exists_strongDixonPrime`:
for `e = exponent G` there is `q : DixonPrimeData G` with `2 · B_G < q.p`, from
`Nat.exists_prime_gt_modEq_one` above `max(|G|, 2B_G)` and `e ≠ 0`; such a `p` also satisfies
`p ∤ |G|`, splits the center and satisfies the weaker native threshold.
`TauCeti.exists_isGoodDixonPrime` is the existing ordinary-prime theorem; no new Dirichlet theory
is needed, and the native finite candidate enumeration `TauCeti.DixonPrimeData.candidates` with its
primitive-root search reaches such a prime with a finite budget. *Needs:* §6.3; Mathlib
`Nat.exists_prime_gt_modEq_one`; Tau Ceti as named.

**Checks.**
- The trivial group: `e = 1`, `B_G = 1`, and `p = 3 > 2` is a strong prime.
- `S₄`: `e = 12`, `B_G = 24`, so `p ≡ 1 (mod 12)` with `p > 48`: `p = 61` is the first; `p = 13` and
  `p = 37` are good Dixon primes but not strong.
- `C₃`: `e = 3`, `B_G = 3`, `p = 7` is strong.

### 6.6 The exact certificate, the class-power identity and the degree identity

Construct the exact ordinary and central tables from the irreducible rows and §6.4, in the native
`ClassData` numbering. Injectivity of the embedding transfers central normalization,
multiplicativity, orthogonality, degree positivity and divisibility, the sum of degree squares and
`dᵢ · omegaᵢⱼ = |Cⱼ| · tableᵢⱼ` to `TauCeti.ClassData.IsCyclotomicCharacterTableSpec`, whose
conjugation comparison carries complex conjugation. The theorem
`exists_bounded_exact_character_table`: for `d : ClassData G` and `e = exponent G` there is an
exact `out` satisfying the specification, with `TauCeti.ClassData.complexTableOfCyclotomic e out.table = TauCeti.characterTable ℂ G` and every coordinate of every `omega` entry bounded by
`B_G`. The pinned solver enumerates row permutations at every primitive conjugate root and every
degree vector satisfying the degree constraints; its certificate-reduction theorem proves
injectivity of the reduced rows at every conjugate root, and
`TauCeti.ClassData.isSome_dixonCyclotomicCharacterTable_of_spec` constructs the compatible
permutations. The tuple is indexed by `Fin φ(e)` through `TauCeti.Cyclotomic.primitiveExponent`,
`conjugateRoot` and `conjugateResidues`; one reduction does not determine an entry, and Frobenius is
trivial when `p ≡ 1 (mod e)`. The inequality `2|coeff(w_C, k)| < p` is exactly the hypothesis of
`TauCeti.Cyclotomic.lift_eq_of_conjugateResidues_eq`.

Two further theorems about the central rows, stated on `TauCeti.centralCharacterTable ℂ G`:

- **The class-power Galois identity.** For `gcd(b, e) = 1`, powering `g ↦ g^b` is a
  conjugation-equivariant bijection of `G` with inverse exponent modulo `e`, so it induces a
  permutation `P_b` of `ConjClasses G` that is representative-independent, fixes the identity class
  and preserves class sizes. For an irreducible `χ`, `Ω_χ(P_b(C)) = σ_b(Ω_χ(C))`, where `σ_b` is
  the automorphism `ζ ↦ ζ^b` of `ℚ(ζ_e)` applied to the descended values (§4.4): this follows from
  `Ω_χ(C) = |C| χ(C)/χ(1)`, since `|C|` and `χ(1)` are fixed by `σ_b` and `χ(g^b) = σ_b(χ(g))`.
  Transfer the identity to the exact elements of §6.4 through the injective generator-compatible
  embedding, and derive the corresponding identity of reductions at the conjugate roots.
- **The degree identity.** With `n = |G|`, `s_C = |C|` (`s_C ∣ n`, so `n/s_C` is exact natural
  division) and `C⁻¹` the class of inverses, `∑_C (n/s_C) Ω_χ(C) Ω_χ(C⁻¹) = (n/χ(1))²` in `ℚ(ζ_e)`,
  from §5.2; and the positive integer `m` with `m² · T = n²` is unique, since `T ≠ 0` in a field of
  characteristic zero and positive integer squares determine their roots.

*Needs:* §4.4, §5.2, §6.4, §6.5; Tau Ceti as named.

**Checks.**
- `S₃`, `e = 6`, `b = 5`: `P_5` fixes every class (`t⁵ = t`, `r⁵ = r⁻¹ ∼ r`), and `σ_5` is complex
  conjugation on `ℚ(ζ₆)`, which fixes the rational entries of the `S₃` table.
- `C₅`, `χ(g) = ζ₅`, `b = 2`: `P_2` sends the class of `g` to that of `g²`, and
  `Ω(g²) = ζ₅² = σ_2(ζ₅)`; the inverse convention `σ_{b⁻¹} = σ_3` would give `ζ₅³`. For `e = 3`
  the two conventions coincide (`2⁻¹ ≡ 2 (mod 3)`), so `C₃` is not a witness.
- `A₅`, `b = 2`: `P_2` swaps the two classes of `5`-cycles and `σ_2(√5) = −√5`, exchanging the two
  three-dimensional rows' values `(1 ± √5)/2`.
- `S₃`, degree-`2` row `(1, 0, −1)`: `T = 6·1·1 + 2·0 + 3·(−1)(−1) = 9 = (6/2)²`; `m = 2` is the
  unique positive solution of `m² · 9 = 36`.
- `e = 1` (trivial group): `b = 0` is the only residue, `P_0` is the identity on the single class.

### 6.7 Totality, conversion and acceptance

From the bounded exact certificate prove `characterTableDixon_isSome`: the pinned solver returns
`some` at every strong prime (`2B_G < q.p`), by `isSome_dixonCyclotomicCharacterTable_of_spec`.
Native exact division computes the ordinary table from `degree · omega`, and the division-free
certificate proves every coordinate division exact. `TauCeti.ClassData.complexTableOfCyclotomic`,
its `complexTableOfCyclotomic_apply_classOf` reindexing and
`IsCyclotomicCharacterTableSpec.isCharacterTableSpec` convert any successful output to a complex
matrix satisfying the specification, and `TauCeti.characterTable_unique_rows` identifies it with
the labeled table up to rows. Finally `characterTableDixonSearch_eventually_some`: some finite
prime-search budget makes `TauCeti.ClassData.characterTableDixon?` succeed, by its candidate
membership and success lemmas and §6.5. This is a termination theorem, not success-conditional
soundness or a coefficient bound supplied by a caller. *Needs:* §6.5, §6.6; Tau Ceti as named.

**Checks (the named evaluations of the pinned solver).** For `DihedralGroup 4` (`e = 4`), `C₃`
(`e = 3`), `A₄` (`e = 6`), `S₄` (`e = 12`) and `A₅` (`e = 30`), with executable `ClassData`, its
exponent equality and a concrete successful prime budget, the pinned solver computes the complete
exact output: degrees, `omega` and ordinary entries in the fixed class order, the checker returns
`true`, and the complex image equals the labeled table up to rows. Supplying a known table to the
checker or an abstract `isSome` proof does not discharge these; they are computed by the solver.
- `C₃`: degrees `1,1,1`, the `3`rd-root-of-unity matrix, `p = 7`.
- `D₄`: degrees `1,1,1,1,2`, all entries in `ℤ`, the same table as `Q₈`.
- `A₄`: degrees `1,1,1,3`, the two linear rows with values `ω, ω²`, a Galois-conjugate pair.
- `S₄`: degrees `1,1,2,3,3`, repeated nonlinear degrees, so row identification is nontrivial; the
  trivial row has central value `8` at the `3`-cycle class, excluded from the `p = 13` window.
- `A₅`: degrees `1,3,3,4,5`, the two three-dimensional rows with values `(1 ± √5)/2` on the two
  classes of `5`-cycles, lifted through `ℚ(ζ₃₀)`.

### Examples

The staged acceptance of the worked-examples section: rational tables (`C₂`, `S₃`, `D₄`, `Q₈`),
small cyclotomic (`C₃`, `A₄`), and the hard cases `S₄` and `A₅`.

### Dependencies

Layers 4 and 5; Tau Ceti `Cyclotomic`, `ClassData`, `Dixon`; Mathlib cyclotomic integers and
`Nat.exists_prime_gt_modEq_one`. The proof order is: the ring-of-integers comparison (§6.1), the
eigenvalue multiplicities and exact ordinary values (§6.3), exact central preimages and the
division-free identity (§6.4), the bound `B_G` and strong primes (§6.5), the exact certificate and
the two row identities (§6.6), completeness and termination (§6.7).

## Layer 7: the Frobenius–Schur indicator and real/quaternionic type

Layer 7 is stated over `ℂ`. The indicator `ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` separates `D₄` from `Q₈`; this
layer records what it measures, all of it pinned, and the comparisons that tie it to this
roadmap's table.

### 7.1 The indicator and the trichotomy

`TauCeti.Representation.frobeniusSchurIndicator ρ = |G|⁻¹ ∑_g ρ.character (g²)` on the module spine
(`frobeniusSchurIndicator_def`) and `FDRep.frobeniusSchurIndicator` on the categorical side; own
their agreement under `Rep.equivalenceModuleMonoidAlgebra`. The symmetric and exterior squares
have characters `χ_{Sym²}(g) = ½(χ(g)² + χ(g²))` and `χ_{Λ²}(g) = ½(χ(g)² − χ(g²))`; the invariant
bilinear forms `TauCeti.Representation.IsInvariantForm ρ B` (`B (ρ g x) (ρ g y) = B x y`) are the
`G`-invariants of `V* ⊗ V*`, splitting as symmetric plus alternating, with dimensions the
multiplicities `⟨χ_{Sym²}, 1⟩` and `⟨χ_{Λ²}, 1⟩`; for irreducible `ρ` the total `⟨χ², 1⟩` is `0` or
`1`. The trichotomy: for irreducible `ρ`, `ν₂ ∈ {+1, 0, −1}`
(`frobeniusSchurIndicator_eq_one_or_eq_zero_or_eq_neg_one`); `+1` iff a nonzero invariant
symmetric nondegenerate form exists (`frobeniusSchurIndicator_eq_one_iff`, orthogonal type), `−1`
iff an alternating one exists (`frobeniusSchurIndicator_eq_neg_one_iff`, quaternionic type), `0`
iff `χ ≠ χ̄` (complex type, no nonzero invariant form). *Needs:* Tau Ceti as named; Layer 3.

### 7.2 Realizability over ℝ, involutions and real classes

The symmetric complex form of the `+1` case is not itself a real representation: realizability
means a `Representation ℝ G W` whose scalar extension recovers `ρ` (`Representation.IsRealForm`,
`Representation.IsRealizableOverReal` on the carrier `Fin (finrank ℂ V) → ℝ`), and
`Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal` is the separate, stronger
theorem. The involution count `#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`
(`TauCeti.card_squareRoot_eq_sum_frobeniusSchurIndicatorRow_mul_characterTable`, with the per-row
indicator `TauCeti.frobeniusSchurIndicatorRow`) is the degree-weighted signed sum; at `x = 1`,
`#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)`, distinct from the unweighted `∑_χ ν₂(χ) = #orthogonal − #quaternionic`. A real class `TauCeti.IsRealClass C` has `g ∼ g⁻¹`; the number of real-valued rows of
`TauCeti.characterTable ℂ G` equals the number of real classes
(`TauCeti.card_realValued_eq_card_realClasses`). The categorical mirror is the indicator of
PivotalSpherical on `FDRep G` with its standard pivotal structure; own the comparison. *Needs:*
Tau Ceti as named; PivotalSpherical.

**Checks.**
- `D₄` and `Q₈` share the table (four degree-`1` rows, one degree-`2`); on the degree-`2` row
  `ν₂ = +1` for `D₄` (`#{g² = 1} = 6 = 1+1+1+1+2·1`) and `ν₂ = −1` for `Q₈` (`#{g² = 1} = 2 = 1+1+1+1−2`).
- `S₃`, `S₄`, `A₅` are totally orthogonal (every `ν₂ = +1`): `#{g² = 1}` is `4 = 1+1+2`, `10 = 1+1+2+3+3`, `16 = 1+3+3+4+5`.
- `C₃`: the two nontrivial characters have `ν₂ = 0` (`χ(g²) = ω²`, `1 + ω² + ω = 0`), one real class
  (`{1}`) and one real-valued row; the unweighted sum `1` and the weighted sum `#{g² = 1} = 1` agree
  here but differ for `D₄` (`5` versus `6`).

### Examples

`D₄` versus `Q₈`; `C₃`; `GL₂(𝔽₃)` (its degree-`2` cuspidal rows are quaternionic).

### Dependencies

Layer 3's completeness and table, Layer 0's pairing; Tau Ceti `FrobeniusSchur`, `RealClasses`;
PivotalSpherical for the categorical comparison only.

## Layer 8: Frobenius groups and Frobenius's theorem

The character-theoretic companion to Burnside's theorem and the signature use of induced
characters, consumed from the pinned T.I.-set route and compared with this roadmap's pairing.

### 8.1 Complement, kernel and the theorem

`TauCeti.IsFrobeniusComplement H` for `H : Subgroup G`: proper, nontrivial, and trivial-intersection
(`H ⊓ gHg⁻¹ = ⊥` for `g ∉ H`; `TauCeti.IsTISubgroup`). `TauCeti.frobeniusKernel H = {1} ∪ (G ∖ ⋃_g gHg⁻¹)`, of size `|G : H|`; that it is a subgroup is the content of Frobenius's theorem, bundled as
`TauCeti.frobeniusKernelSubgroup` with `coe_frobeniusKernelSubgroup`, normal
(`frobeniusKernelSubgroup_normal`) and a complement to `H` (`frobeniusKernel_isComplement'`), so
`G = N ⋊ H`. *Needs:* Tau Ceti as named.

### 8.2 The T.I.-set machinery and the exceptional characters

With `S = H# = H ∖ {1}`, `TauCeti.IsTISet S H` records that the distinct `G`-conjugates of `S` are
disjoint and `S` is `H`-normalized; the load-bearing lemma `TauCeti.isometry_ind_of_isTISet` says
that a class function on `H` supported on `S`, extended by zero and induced to `G`
(`Representation.ind` and the induced-character formula of InductionRestriction Layer 2), preserves
the norm. A raw difference `χᵢ − χⱼ` vanishes at `1` only when the degrees agree; for arbitrary
degrees `TauCeti.ClassFunction.indExtend H φ = Ind_H^G(φ − φ(1)·1_H) + φ(1)·1_G` preserves the
pairing (`characterPairing_indExtend_indExtend`) and the degree. Compute the norm `2` of a
difference of distinct irreducibles by row orthogonality, and only then transport it. The
exceptional-character correspondence has its own milestones: the isometry; the bijection matching
a subset of `Irr H` with a subset of `Irr G` with coherent signs; the class function cutting out
`N`; and that its support is a normal subgroup. Consequences: `|H| ∣ |N| − 1`; the affine groups
`𝔽_q ⋊ 𝔽_q^×` and the odd dihedral groups `D_n = C_n ⋊ C₂` are the model instances (Isaacs, Ch. 7,
Thm 7.2). *Needs:* §8.1; InductionRestriction Layer 2; Tau Ceti as named.

**Checks.**
- `S₃ ≅ C₃ ⋊ C₂`, `H = ⟨(1 2)⟩`: `N = A₃`, `|N| = 3`, `|H| = 2 ∣ 2`.
- `𝔽₅ ⋊ 𝔽₅^×` of order `20`, `H = C₄`: `N = C₅`, `|H| = 4 ∣ 4`.
- `D₄ = ⟨r, s⟩` with `H = ⟨s⟩`: the central `r² ∉ H` has `r² H r⁻² = H ≠ ⊥`, so `H` is not
  malnormal and not a Frobenius complement; the set `{1} ∪ (G ∖ ⋃_g gHg⁻¹) = {1, r, r², r³, rs, r³s}` has `6` elements, not `|G : H| = 4`, and is not a subgroup. The T.I. hypothesis is
  necessary.

### Examples

`S₃`; the order-`20` affine group; `A₄ = V₄ ⋊ C₃` with complement `C₃`.

### Dependencies

Layer 3; InductionRestriction Layer 2; Tau Ceti `FrobeniusGroup`, `TrivialIntersection`.

## Layer 9: the representation theory of GL₂(𝔽_q)

Over `𝔽_q`, every irreducible complex representation of `GL₂(𝔽_q) = GL (Fin 2) F` and the assembled
table. The cuspidal series needs a degree-`2` extension `E/F` (Frobenius `x ↦ x^q`, the norm, the
non-split torus), not recoverable from `[Field F] [Fintype F]` alone, so the family is stated over
`[Field F] [Fintype F]` with a supplied `[Field E] [Fintype E] [Algebra F E]` and
`Algebra.IsQuadraticExtension F E` (from `finrank F E = 2`). It consumes `Representation.ind` and the
induced-character formula of InductionRestriction Layer 2 and the Mackey criterion of its Layers
3–4.

### 9.1 Classes, principal series, Steinberg, cuspidals

Four class families, separated by minimal polynomial: the `q − 1` central `diag(a, a)`; the
`½(q−1)(q−2)` split semisimple `diag(a, b)`, `a ≠ b`; the `q − 1` unipotent `[[a,1],[0,a]]`; the
`½q(q−1)` elliptic classes with eigenvalues a conjugate pair `ξ, ξ^q ∈ E ∖ F`. `q² − 1 = Nat.card (ConjClasses (GL (Fin 2) F))` (`TauCeti.card_conjClasses_GL2`), `|GL₂(𝔽_q)| = (q²−1)(q²−q)`
(`Matrix.card_GL_field`); retain the representative, centralizer-size and indexing comparisons.
`TauCeti.GL2Borel F` is the upper-triangular `B = TU`; `TauCeti.GL2PrincipalSeries F α β = Ind_B(α ⊗ β)` has dimension `q + 1` (`TauCeti.character_one_GL2PrincipalSeries`), is irreducible iff
`α ≠ β`, and `Ind_B(α β) ≅ Ind_B(β α)`: `½(q−1)(q−2)` irreducibles of dimension `q + 1`. When
`α = β`, `Ind_B(α α)` has length two: `α ∘ det` (degree `1`, `q − 1` of them) and the Steinberg
constituent `TauCeti.GL2Steinberg F` twisted by `α` (dimension `q`, `q − 1` of them).
`TauCeti.GL2NonSplitTorus F E` is `Eˣ ↪ GL₂(𝔽_q)`; a character `θ : Eˣ →* ℂˣ` with `θ^q ≠ θ` gives
`TauCeti.GL2Cuspidal θ` of dimension `q − 1` (`TauCeti.finrank_GL2Cuspidal`), with `θ` and `θ^q`
giving the same one: `½q(q−1)` irreducibles of dimension `q − 1`, exactly those absent from every
principal series.

The pinned irreducibility theorem `TauCeti.simple_GL2PrincipalSeries_iff` specializes `F : Type`,
because its Mackey argument does. The target `simple_GL2PrincipalSeries_iff` is the same
statement for `F : Type u`, by transport along a finite-field small model (`Shrink`), consuming the
pinned theorem rather than reproving irreducibility. *Needs:* Tau Ceti as named;
InductionRestriction Layers 2–4; Mathlib `Shrink`.

### 9.2 Character values and the table

The table is not fixed by the dimension counts: pin the explicit values of the linear, Steinberg,
principal-series and cuspidal rows on each of the four class families (central, split, unipotent,
elliptic), consuming the pinned `GL2` character formulas, and prove the tally
`(q−1)·1² + (q−1)·q² + ½(q−1)(q−2)·(q+1)² + ½q(q−1)·(q−1)² = (q²−1)(q²−q)` with `#irreducibles = q² − 1 = #classes`. The acceptance criterion is the full `(q²−1) × (q²−1)` table with the four
dimension families `1, q, q+1, q−1`, rows orthonormal for the pairing, for `q ≥ 3` where all four
families are nonempty (Fulton–Harris, §5.2; Bonnafé). *Needs:* §9.1; Layer 3.

**Checks.**
- `GL₂(𝔽₃)`, order `48`: degrees `1,1,2,2,2,3,3,4` (two linear, two Steinberg of degree `q = 3`,
  one principal series of degree `q + 1 = 4`, three cuspidals of degree `q − 1 = 2`); `8 = q² − 1`
  classes; `2·1 + 2·9 + 16 + 3·4 = 48`.
- `GL₂(𝔽₂) ≅ S₃`: no split-semisimple classes and no genuine principal series (`½(q−1)(q−2) = 0`),
  degrees `1, 1, 2`; the uniform family theorems assume the lower bounds they need.
- A character `θ` factoring through the norm (`θ^q = θ`) gives no cuspidal: the dimension claim
  `q − 1` is false without the regularity hypothesis.

### Examples

`GL₂(𝔽₂)` and `GL₂(𝔽₃)` as above.

### Dependencies

Layers 0–3; InductionRestriction Layers 2–4; Tau Ceti `GL2`, `GeneralLinearGroup/ConjugacyClasses`.

## Layer 10: small finite-group representations

Applications of Layers 0–3 over `ℂ` on the native permutation, augmentation, symmetric-power and
restricted carriers; `TauCeti.standardRepresentation` is the sum-zero standard module with its
finite-function coordinate comparison. Each character is identified with the pinned table by
explicit row and class maps; equality of degrees alone does not label an irreducible.

### 10.1 Symmetric powers of the S₃ standard module

Let `S₃` act on `V₃ = {(z₀, z₁, z₂) ∈ ℂ³ : z₀ + z₁ + z₂ = 0}` by `(g·z)ᵢ = z_{g⁻¹(i)}`. Put
`σ = (0 1)`, `τ = (0 1 2)`, `ω = exp(2πi/3)`, and the basis `α = (1, ω, ω²)`, `β = (ω, 1, ω²)`. Prove
`τα = ω²α`, `τβ = ωβ`, `σα = β`, `σβ = α`, and that `α, β` is a basis. On `Sym² V₃` and `Sym³ V₃`
construct the monomial bases and the equivariant isomorphisms

`Sym² V₃ ≃ 1 ⊕ V₃`, `Sym³ V₃ ≃ 1 ⊕ sgn ⊕ V₃`:

for `Sym²` send the trivial generator to `αβ` and `α, β` to `β², α²`; for `Sym³` send the trivial
and sign generators to `α³ + β³` and `α³ − β³`, and `α, β` to `α²β, αβ²`. Prove the maps intertwine
`σ` and `τ`, give inverse coordinates and complementary images. In the basis `(α², β², αβ)` the `τ`
eigenvalues are `ω, ω², 1`. In the class order identity, transposition, `3`-cycle, verify
`χ_{V₃} = (2, 0, −1)`, `χ_{Sym²} = (3, 1, 0)`, `χ_{Sym³} = (4, 0, 1)`, and compare with
`TauCeti.dihedralGroupThreeCharacterTable` through the isomorphism sending a rotation to `τ` and a
reflection to `σ`, including the class-order permutation and the trivial/sign/standard rows
(Fulton–Harris, §1.3 and §2.1). *Needs:* Layer 3; Tau Ceti as named.

**Checks.**
- `χ_{Sym²}(g) = ½(χ(g)² + χ(g²))`: `½(4 + 2) = 3`, `½(0 + 2) = 1`, `½(1 − 1) = 0`; a model with
  `χ_{Λ²}` instead gives `(1, −1, 1) = sgn`.
- `χ_{Sym³}` from `(χ(g)³ + 3χ(g)χ(g²) + 2χ(g³))/6`: `(8 + 12 + 4)/6 = 4`, `0`, `(−1 + 3 + 4)/6 = 1`.
- `1 ⊕ sgn ⊕ V₃` has character `(4, 0, 1)`, while `1 ⊕ 1 ⊕ V₃` has `(4, 2, 1)`: the sign summand is
  detected at the transposition.

### 10.2 Cube permutation modules and the S₄ labels

Let `X = {−1, 1}³` be the cube vertices and `Y` its twelve edges (unordered pairs differing in one
coordinate). Construct the rotation group of determinant-one signed permutation matrices on `ℝ³`
and its actions on `X` and `Y`; label the four body-diagonal lines by `(1,1,1)`, `(1,−1,−1)`,
`(−1,1,−1)`, `(−1,−1,1)` in that order, prove the induced permutation of lines is an isomorphism
with `S₄ = Equiv.Perm (Fin 4)`, and transport the vertex and edge actions through its inverse. Use
`ℂ[X]` and `ℂ[Y]` with these permutation actions (scalar permutation of four tetrahedron vertices is
a different action).

Pin the class order of `TauCeti.symmetricGroupFourCharacterTable`: `1, (01), (01)(23), (012), (0123)`, sizes `1, 6, 3, 8, 6`, and its row order `1, sgn, E, V₄, sgn ⊗ V₄`, `V₄` the sum-zero
four-point module. Realize `E`: on the three perfect matchings `M₀ = 01|23`, `M₁ = 03|12`,
`M₂ = 02|13` construct `q : S₄ → S₃`, prove it surjective with kernel `{1, (01)(23), (02)(13), (03)(12)}`, construct `S₄/ker q ≃ S₃`, and set `E = q^* V₃`; prove irreducibility and identify its
row; its kernel follows from the action and faithfulness of `V₃`, not from eigenvalues of modulus
one. Compute the fixed vertices and edges of each class (half-turn about opposite-edge midpoints
for a transposition, half-turn about opposite-face centers for a double transposition,
body-diagonal third-turn, face-axis quarter-turn):

| module | 1 | (01) | (01)(23) | (012) | (0123) |
| --- | ---: | ---: | ---: | ---: | ---: |
| `ℂ[X]` | 8 | 0 | 0 | 2 | 0 |
| `ℂ[Y]` | 12 | 2 | 0 | 0 | 0 |

and prove by class-size weighted pairings `ℂ[X] ≃ 1 ⊕ sgn ⊕ V₄ ⊕ (sgn ⊗ V₄)` and
`ℂ[Y] ≃ 1 ⊕ E ⊕ V₄^{⊕2} ⊕ (sgn ⊗ V₄)`, constructing the intertwiners and inverses from Layer 3's
idempotents and evaluation on the intertwining-map multiplicity spaces. For the two-dimensional
`V₄` multiplicity space in `ℂ[Y]`, choose a basis and prove that evaluation
`V₄ ⊗ Hom_{S₄}(V₄, ℂ[Y]) → ℂ[Y]` identifies its image with the `V₄`-isotypic component; pairings
determine multiplicities, not the two summands (Fulton–Harris, §2.3; James–Liebeck, Ch. 18).
*Needs:* Layer 3, §3.5; Tau Ceti as named.

**Checks.**
- With rows `1 = (1,1,1,1,1)`, `sgn = (1,−1,1,1,−1)`, `E = (2,0,2,−1,0)`, `V₄ = (3,1,−1,0,−1)`,
  `sgn ⊗ V₄ = (3,−1,−1,0,1)`: `1 + sgn + V₄ + sgn⊗V₄ = (8,0,0,2,0)` and
  `1 + E + 2V₄ + sgn⊗V₄ = (12,2,0,0,0)`.
- A transposition acts on the cube as a half-turn about an axis through two opposite edge
  midpoints, fixing exactly those `2` edges and no vertex; a model assigning the transposition to
  the face-axis quarter-turn would give `0` fixed edges and the wrong row.
- `⟨χ_{ℂ[Y]}, χ_{V₄}⟩ = (36 + 6·2·1 + 0 + 0 + 0)/24 = 2`, the two-dimensional multiplicity space.

### 10.3 Restriction from S₄ to A₄

With the inclusion of `alternatingGroup (Fin 4)` and `q` above, prove `q(A₄) = A₃`, construct
`κ : A₄ → ℤ/3ℤ` with `κ((012)) = 1` and kernel `ker q`, and for `j = 0, 1, 2` the one-dimensional
`L_j` with character `g ↦ ω^{j κ(g)}`. Put `T = Res_{A₄} V₄`. In the order of
`TauCeti.alternatingGroupFourClassData`, `1, (01)(23), (012), (021)` with sizes `1, 3, 4, 4`, prove

| module | 1 | (01)(23) | (012) | (021) |
| --- | ---: | ---: | ---: | ---: |
| `L₀` | 1 | 1 | 1 | 1 |
| `L₁` | 1 | 1 | ω | ω² |
| `L₂` | 1 | 1 | ω² | ω |
| `T` | 3 | −1 | 0 | 0 |

compare with `TauCeti.alternatingGroupFourExactCharacterTable` under its distinguished complex
embedding, proving that the image of `TauCeti.alternatingGroupFourOmega` is `ω`, prove
irreducibility, pairwise inequivalence and completeness from the table and pairing contracts, and
construct `Res(1) ≃ Res(sgn) ≃ L₀`, `Res(V₄) ≃ Res(sgn ⊗ V₄) ≃ T`, `Res(E) ≃ L₁ ⊕ L₂`, the last with
the vectors `v_j = ∑_{r=0}^{2} ω^{−jr} δ_{q((012))^r M₀}`, `j = 1, 2`, in the sum-zero matching
module (`q((012))` cycles the matchings in the displayed order, `v_j` has eigenvalue `ω^j`, and the
two span). Conclude that every `A₄`-irreducible occurs in a restriction of an `S₄`-irreducible
(Fulton–Harris, §2.3; James–Liebeck, Ch. 18). *Needs:* §10.2; Tau Ceti as named.

**Checks.**
- `Res E = (2, 2, −1, −1) = L₁ + L₂`; `Res V₄ = (3, −1, 0, 0) = T`; sign is identically `1` on `A₄`.
- `∑ degrees² = 1 + 1 + 1 + 9 = 12 = |A₄|`.
- `(012)` and `(021)` are not conjugate in `A₄` (two classes of size `4`), though they are in `S₄`;
  a model merging them would give `A₄` three classes and contradict the count.

### Examples

The three constructions above; `C₂ × C₂` as the kernel of `q`.

### Dependencies

Layers 0–3; Tau Ceti `standardRepresentation`, the `S₃`, `S₄` and `A₄` tables.

## Layer 11: symmetry and normal modes of finite spring systems

Finite-dimensional applications of Layers 0–3 over `ℝ`, compared through complexification with the
complex table, with the standard inner product on displacement coordinates. Consume Layer 3's
idempotents and finite decomposition, SemisimpleAlgebras Layer 1's Schur and isotypic theory, and
the matrix, trace and linear-map APIs. Build the character-idempotent action adapter and its
orthogonal-projector formula for these unitary representations; for a chosen isotypic
identification `Vᵢ ⊗ Hom_G(Vᵢ, W)` prove that an equivariant operator acts as `id ⊗ Hᵢ`. Build the
action, equivariance and the stated eigenspaces; a character calculation alone discharges none of
these. For these groups the characters are real-valued and the projector matrices have real
entries; each real irreducibility statement is justified by the irreducible complexification, not
by applying complex Schur to a real module. The force operators are linearizations; no nonlinear
stability follows from their zero eigenvalues.

### 11.1 Two particles, and the transverse zero mode

Particles at `(0,0)` and `(1,0)`, displacements `u₁ = (x₁, y₁)`, `u₂ = (x₂, y₂)`, coordinate order
`(x₁, y₁, x₂, y₂)`, force matrix `H = [[−1,0,1,0],[0,0,0,0],[1,0,−1,0],[0,0,0,0]]`. (The source
stacks the coordinates as `(x₁, x₂, y₁, y₂)` with `x = (x₁, x₂)` the displacement of the first
particle; the dictionary is source `x₂ ↦ y₁`, source `y₁ ↦ x₂`, the others fixed, giving exactly
this matrix.) Construct the commuting involutions `r = diag(1, −1, 1, −1)` and
`s = [[0,0,−1,0],[0,0,0,1],[−1,0,0,0],[0,1,0,0]]`, identify this representation of `C₂ × C₂` with its
regular representation, and prove that `(1,0,−1,0)`, `(0,1,0,1)`, `(1,0,1,0)`, `(0,1,0,−1)` have
`(r, s)`-signs `(+,+)`, `(−,+)`, `(+,−)`, `(−,−)` and `H`-eigenvalues `−2, 0, 0, 0`; construct their
orthogonal projectors. For stiffness `κ > 0`, mass `m > 0` and rest vector `v ≠ 0`, derive the
linearization of the pair force `Fᵢ = κ(‖r‖ − ‖v‖) r/‖r‖`, `r = v + uⱼ − uᵢ`, `Fⱼ = −Fᵢ`: the
acceleration on `i` is `(κ/m) P_v(uⱼ − uᵢ)` with `P_v(w) = ⟪v, w⟫ v/‖v‖²`; pin equal masses and
stiffnesses.

The transverse zero mode, made exact (`transverseLength`, `transverseEnergy`,
`transverseEnergy_quartic`): with rest length `1` and `u₁ = (0, ε)`, `u₂ = (0, −ε)`, the relative
vector is `(1, −2ε)` of length `ℓ(ε) = √(1 + 4ε²)`, the potential is
`E(ε) = (κ/2)(ℓ(ε) − 1)² = 8κε⁴/(ℓ(ε) + 1)²`, and the force on particle `1` is
`F₁(ε) = κ(1 − 1/ℓ(ε))(1, −2ε)`, `F₂ = −F₁`. Prove `E(0) = E′(0) = E″(0) = 0`, `E(ε) > 0` for
`ε ≠ 0`, the limit `E(ε)/ε⁴ → 2κ` as `ε → 0`, `ε ≠ 0` (the punctured neighbourhood is necessary:
real division gives `0` at `ε = 0`), and that the first force coordinate is positive for `ε ≠ 0`.
Hence the affine paths `u₁(t) = (0, at)`, `u₂(t) = (0, −at)`, `a ≠ 0`, which `H` annihilates, fail
the exact Newton equation at every `t ≠ 0` for every `m > 0`: their acceleration is zero and the
exact force is not. Compare with the rotated rest configurations `p₁(ε) = (½ − ½cos 2ε, ½ sin 2ε)`,
`p₂(ε) = (½ + ½cos 2ε, −½ sin 2ε)`, at distance `1`, zero potential, and the same tangent
`(0,1,0,−1)` at `ε = 0`; these are configuration curves, not solutions of the unconstrained spring
equation. This is the limitation of the linear approximation in the tetrahedron handout
(knutson-tetrahedron, pp. 1–3). *Needs:* Layer 3, SemisimpleAlgebras Layer 1; Mathlib `Real.sqrt`,
differentiation and `Filter.Tendsto` on `nhdsWithin`.

**Checks.**
- `H(1,0,−1,0) = (−2,0,2,0)`, `H(0,1,0,1) = 0`, `H(1,0,1,0) = 0`, `H(0,1,0,−1) = 0`.
- `(0,1,0,1)` ("both up") is sent by `r` to `(0,−1,0,−1)`: `r = −1`, `s = +1`; the handout's page 2
  prints the labels `r = 1, s = −1` for this vector, which is the interchange of the two signs.
- At `ε = 1/2`: `ℓ = √2` and `E(1/2)/(1/2)⁴ = 8κ/(√2 + 1)² ≈ 1.37κ`, below the limit `2κ`; at
  `ε = 0` the quotient is `0/0 = 0` in Lean, which is why the limit is punctured.
- The rotated configurations have `|p₂ − p₁| = |(cos 2ε, −sin 2ε)| = 1` and derivative
  `(sin 2ε, cos 2ε, −sin 2ε, −cos 2ε) → (0,1,0,−1)`.

### 11.2 Three particles on a line

`H = [[−1,1,0],[1,−2,1],[0,1,−1]]` and `r(x₁, x₂, x₃) = (−x₃, −x₂, −x₁)`. The representation has one
trivial and two sign constituents; `(1,0,−1)`, `(1,1,1)`, `(1,−2,1)` have eigenvalues `−1, 0, −3`.
Identify the trivial line and the sign isotypic plane, and prove that `H` is not scalar on that
plane: an equivariant operator preserves isotypic components and acts on multiplicity spaces, not
necessarily on chosen irreducible copies (knutson-tetrahedron, p. 3). *Needs:* as §11.1.

**Checks.**
- `χ = (3, −1)`: `⟨χ, 1⟩ = (3 − 1)/2 = 1`, `⟨χ, sgn⟩ = (3 + 1)/2 = 2`.
- `H(1,−2,1) = (−3, 6, −3)`; `H(1,1,1) = 0`; `H(1,0,−1) = (−1,0,1)`.
- The vector `(1,0,−1)` is `r`-fixed (`r(1,0,−1) = (1,0,−1)`): the trivial line is the
  "pull outer particles apart" mode, not the uniform translation.

### 11.3 The tetrahedron

Vertices `p₁ = (0,0,0)`, `p₂ = (1,1,0)`, `p₃ = (1,0,1)`, `p₄ = (0,1,1)`, `c = (½,½,½)`, `qᵢ = pᵢ − c`.
Construct the orthogonal action `R_σ` with `R_σ qᵢ = q_{σ(i)}` for `σ ∈ S₄` and the displacement
representation `(σ·u)ᵢ = R_σ u_{σ⁻¹(i)}` on `(ℝ³)⁴`; identify the ambient module with the sum-zero
submodule of the four-point permutation representation with its inner-product normalization. For
each edge `i < j` let `z_{ij} ∈ ℝ¹²` have block `pᵢ − pⱼ` at `i`, its negative at `j`, zero
elsewhere; define `H = −∑_{i<j} z_{ij} z_{ij}ᵀ`, symmetric, negative semidefinite and
`S₄`-equivariant. Each edge has squared length `2`, so physical unit-direction springs give the
acceleration operator `(κ/(2m)) H`, and the pair-spring matrix on the `(1,2)` edge has entries
`±1`.

In the class order `(1⁴), (2,1²), (3,1), (4), (2,2)` the displacement character is `(12, 2, 0, 0, 0)` with decomposition `1 ⊕ E ⊕ 2V ⊕ (sgn ⊗ V)`, `V` the standard three-dimensional module and `E`
the two-dimensional irreducible. Construct the orthogonal decomposition and intertwiners:
translations `uᵢ = t` and infinitesimal rotations `uᵢ = A qᵢ`, `Aᵀ = −A`, give the kernel, of
dimension `6`, of types `V` and `sgn ⊗ V`; diagonal trace-zero symmetric `A` gives the `E`
eigenspace, dimension `2`, eigenvalue `−2`; symmetric `A` with zero diagonal gives the other `V`,
dimension `3`, eigenvalue `−4`; the breathing line `uᵢ = a qᵢ` has eigenvalue `−8`. Every
displacement is uniquely a translation plus `uᵢ = A qᵢ`; rotations are `Λ² V` through the
Euclidean metric; the two copies of `V` are distinguished by translation versus vibration, not by
Schur on their sum. Prove the characteristic polynomial `X⁶ (X+2)² (X+4)³ (X+8)` and the kernel and
eigenspace dimensions; for `m, κ > 0` the six vibrational frequencies are `√(κ/m)` twice, `√(2κ/m)`
three times and `2√(κ/m)` once; construct the solutions of `u″ = (κ/(2m)) H u` on these modes and
the affine solutions on the zero modes (knutson-tetrahedron, pp. 3–5).

Restriction to the vertex stabilizer `S₃` and the square subgroup `D₄ = ⟨(1234), (13)⟩`: the
invariant spaces have dimensions `3` and `2`. For `S₃` construct a fixed vector on the breathing
line and one in each standard copy, and prove that the `S₄`-orbit of the seed `uⱼ = Aᵢ qⱼ`,
`Aᵢ = qᵢ qᵢᵀ − ¼ I` for the fixed vertex `i`, consists of exactly four vectors summing to zero and
spanning the vibrational standard module (the four `Aᵢ` are distinct, sum to zero and span the
off-diagonal symmetric matrices); the translation seeds `uⱼ = qᵢ` give the four-point standard
comparison, and the `S₃`-orbit of the seed is a singleton. For `D₄` construct the fixed line in `E`,
separate it from breathing by orthogonal projection, and prove that the `S₄`-orbit of the seed
`A = diag(−1, 2, −1)` in `uⱼ = A qⱼ` is the three diagonal matrices with one entry `2` and the
others `−1`, summing to zero as their sole linear relation and spanning the trace-zero diagonal
plane; its `D₄`-orbit is a singleton. Give the restriction characters and fixed-space projectors;
these are symmetric spanning sets, not a canonical basis in an irreducible. *Needs:* Layer 3,
§3.5, §10.2; Mathlib matrices.

**Checks.**
- The characteristic polynomial of `H` is `X¹² + 24X¹¹ + 228X¹⁰ + 1104X⁹ + 2880X⁸ + 3840X⁷ + 2048X⁶ = X⁶(X+2)²(X+4)³(X+8)`; `trace H = −24 = −2·2 − 4·3 − 8` and `−12·2 = −24` from the twelve
  diagonal entries `−2`.
- `u = (A qᵢ)ᵢ` with `A = diag(1, −1, 0)` satisfies `H u = −2u`; with `A = [[0,1,0],[1,0,0],[0,0,0]]`,
  `H u = −4u`; with `A = I`, `H u = −8u`; with `A = [[0,1,0],[−1,0,0],[0,0,0]]` or `u = (t)ᵢ`,
  `H u = 0`.
- The transposition `(2 3)` acts by the orthogonal `R` with `R q₂ = q₃`, `R q₃ = q₂`, `R q₄ = q₄`,
  and the induced `12 × 12` matrix commutes with `H`; a model with `(σ·u)ᵢ = R_σ u_{σ(i)}` fails to
  commute.
- The `D₄`-seed `diag(−1, 2, −1)` has orbit `{diag(2,−1,−1), diag(−1,2,−1), diag(−1,−1,2)}` under
  `S₄`, whose sum is `0`.

### Examples

The two-particle, three-particle and tetrahedron systems above.

### Dependencies

Layers 0–3, §10.2; SemisimpleAlgebras Layer 1; Mathlib real analysis and matrices.

---

## Worked examples (acceptance criteria), staged

Staged from rational to genuinely cyclotomic, so that early milestones do not wait on the general
lift:

- **Rational tables.** `C₂`; `S₃ ≅ DihedralGroup 3` (degrees `1,1,2`); `D₄ = DihedralGroup 4` and
  `Q₈ = QuaternionGroup 2`, the classic pair with the same table yet non-isomorphic, distinguished
  by the Frobenius–Schur indicator `ν₂` (`+1` for `D₄`, `−1` for `Q₈`), the invariant
  PivotalSpherical defines categorically on `FDRep G`. All values in `ℤ`.
- **Small cyclotomic.** `C₃` (the `3`rd-root-of-unity matrix); `A₄` (degrees `1,1,1,3`, cube-root
  values, a nontrivial Galois orbit on rows): the quadratic/cubic lift.
- **Genuinely hard.** `S₄` (degrees `1,1,2,3,3`, repeated nonlinear degrees); `A₅` (values
  `(1 ± √5)/2`, a Galois-conjugate row pair, `√5`-type lifting, a real bad-prime avoidance check).
- **The checker is sound on each.** For every group the solver's table satisfies
  `TauCeti.IsCharacterTableSpec`, and labeled uniqueness pins it (Layer 5).
- **Burnside on a small solvable group.** `|G| = 12 = 2²·3` (Layer 4).
- **Frobenius–Schur type (Layer 7).** `D₄` orthogonal and `Q₈` quaternionic on the shared
  two-dimensional row; `S₃`, `S₄`, `A₅` totally orthogonal; the involution count and the real-class
  match on each.
- **A Frobenius group (Layer 8).** `S₃ ≅ C₃ ⋊ C₂` and the order-`20` group `𝔽₅ ⋊ 𝔽₅^×`.
- **`GL₂(𝔽_q)` (Layer 9).** `GL₂(𝔽₂) ≅ S₃` as the degenerate case and `GL₂(𝔽₃)` of order `48`.
- **Finite-group representations and springs (Layers 10–11).** The `S₃`, `S₄`, `A₄` constructions
  and the three spring systems.

## Downstream consumers

- **McKaySkewGroup** §1.1 (the McKay matrix): the Wedderburn decomposition and block scalars of
  Layer 2, completeness and the primitive central idempotents of §3.5, and the Burnside–Brauer
  theorem of §3.7 for the connectedness of the McKay graph.
- **InductionRestriction**: the pairing and the table that its induced-character computations
  record multiplicities against.
- **ModularInduction**: the ordinary character theory of Layer 3 and the virtual-character
  lattice of §3.5.
- **SchurWeyl** and **LieHighestWeight**: the finite-group character theory of `S_n` of Layers 2–3.
- **CompactGroups** and **PivotalSpherical**: the finite-group instances of their comparisons.
- **BelyiMaps**: the character tables of the small finite groups of Layer 10.

## References

- I. M. Isaacs, *Character Theory of Finite Groups*, AMS Chelsea (1976): class functions and
  orthogonality (Ch. 2), central characters, idempotents, integrality, `χ(1) ∣ |G|`, Burnside's
  `pᵃqᵇ` theorem (Ch. 3), the Burnside–Brauer theorem (Thm 4.3), the Frobenius–Schur indicator and
  the real/complex/quaternionic classification (Ch. 4), Frobenius groups via T.I. sets and
  exceptional characters (Ch. 7, Thm 7.2), fields of values and Galois action (Ch. 9).
- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977): Part I
  (characters, orthogonality, the number of irreducibles, the canonical decomposition); Ch. 12,
  §§12.3–12.4 (realizability over cyclotomic fields and the Galois action); §13.2 (the
  Frobenius–Schur indicator).
- G. James, M. Liebeck, *Representations and Characters of Groups*, 2nd ed., CUP (2001): the
  character table as a computational object, column orthogonality, and the tables of `S₄` and `A₄`
  (Ch. 18).
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991): the `S₃`
  standard representation and its tensor and symmetric powers (§1.3, §2.1), the `S₄` and `A₄`
  tables and restrictions (§2.3), the character table of `GL₂(𝔽_q)` (§5.2).
- C. W. Curtis, I. Reiner, *Methods of Representation Theory, Vol. I*, Wiley (1981): the group
  algebra, its center, class sums, structure constants, the integral group ring and Wedderburn
  theory (Ch. 1–3).
- J. D. Dixon, *High speed computation of group characters*, Numer. Math. 10 (1967) 446–450: the
  class-multiplication matrices, the reduction to eigenvectors over `ZMod p` with `p ≡ 1 (mod e)`,
  and the size bound making the cyclotomic lift unique.
- G. J. A. Schneider, *Dixon's character table algorithm revisited*, J. Symbolic Comput. 9 (1990)
  601–606: the refinement splitting eigenspaces along successive class-multiplication matrices.
- W. Burnside, *Theory of Groups of Finite Order*, 2nd ed. (1911): the `pᵃqᵇ` theorem and the
  central-character method.
- A. Hulpke, *Computational representation theory* (lecture notes): the practical form of
  Dixon–Schneider as implemented in GAP.
- B. Steinberg, *On the Burnside–Brauer–Steinberg theorem*, [arXiv:1409.7632](https://arxiv.org/abs/1409.7632)
  (2014): the Introduction states Brauer's bound by the number of distinct character values (the
  first `r` tensor powers), and Remark 1 the positive-power refinement.
- A. Knutson, *Group theory in physics: an example* (summary for Math 261, Fall 2001; tetrahedron
  handout, 5 pages), [pi.math.cornell.edu/~allenk/courses/12spring/6500/notes1/tetrahedron.pdf](https://pi.math.cornell.edu/~allenk/courses/12spring/6500/notes1/tetrahedron.pdf):
  the two-particle, three-particle and tetrahedron spring systems of Layer 11.
- W. Fulton, J. Harris as above and Bonnafé below for Layer 9: C. Bonnafé, *Representations of
  `SL₂(𝔽_q)`*, Springer Algebra and Applications 13 (2011): conjugacy classes, the Borel and
  parabolic induction, the cuspidal series from the non-split torus.
- P. Deligne, G. Lusztig, *Representations of reductive groups over finite fields*, Ann. of Math.
  103 (1976) 103–161: the general theory that the cuspidal series of Layer 9 specializes to `GL₂`.
