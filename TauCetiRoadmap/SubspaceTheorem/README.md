# Roadmap: Roth's theorem and the Subspace Theorem over number fields

Diophantine approximation asks how well an algebraic number can be approximated by elements of a
number field, and its central theorem, Schmidt's Subspace Theorem in the `S`-adic form of
Schlickewei and Evertse, says that the good approximations to a system of linear forms lie in
finitely many proper linear subspaces. This roadmap builds that theorem over a number field `K`
with a finite set of places, points in `K` and coefficients in a finite extension `F`, by the route
of Bombieri–Gubler's Chapters 6 and 7, with Roth's theorem as the milestone halfway up, and then
what the theorem exists to prove: the approximation exponents of algebraic numbers, the
transcendence of numbers whose expansions are too simple, the `S`-unit equation in any number of
variables, Thue, Thue–Mahler and hyperelliptic equations over `S`-integers, decomposable-form
equations, the Corvaja–Zannier gcd bound, and the elementary half of the quantitative theory,
which counts the subspaces.

It stands on four roadmaps and on what Tau Ceti already holds. The height foundation, the
approximation exponents, the Roth machinery (Hasse derivatives, the weighted index, generalized
Wronskians, Roth's lemma) and the Siegel lemma are
[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)'s
(DAT below), and so are the theorems of Diophantine approximation over `ℚ` at integer points in
Evertse's lecture-notes form and the absolute quantitative Subspace Theorem. The affine height,
the Northcott instances, Kronecker's theorem, the heights of units and the `S`-unit lattice are
[HeightsAndUnits](../HeightsAndUnits/README.md)'s (HAU below). The places of a number field with
their normalized absolute values and the local extension formulas are
[GlobalNumberFields](../GlobalNumberFields/README.md)'s Layer 0. Successive minima, Minkowski's
second theorem and the Gram–Hadamard bound are [SuccessiveMinima](../SuccessiveMinima/README.md)'s
(SM below). Everything here is stated so that the `K = ℚ` instances in DAT are specializations,
recorded as acceptance tests and never restated.

"Done" means a contributor who needs a finiteness statement in Diophantine approximation or
Diophantine equations finds it here in the form the literature applies it in, over a number field
and with a finite set of places, and finds the tools behind it, the approximation classes, the
`S`-adic approximation domains with their successive minima over `K`, Evertse's lemma and the
exterior powers of a system of forms, as developed objects with their own API, so that the next
theorem proved by the same method starts from a library and not from a paper.

Suggested home: `TauCeti/NumberTheory/DiophantineApproximation/`, beside the files Tau Ceti already
has there, with subdirectories `Roth/`, `Parallelepiped/`, `Subspace/`, `Transcendence/`,
`UnitEquation/` and `Counting/`; Layer 0 in `TauCeti/NumberTheory/NumberField/PlacesOver/` and
`TauCeti/RingTheory/DedekindDomain/SInteger/`, with the absolute-value infrastructure it needs in
`TauCeti/Analysis/AbsoluteValue/`.

## Scope and boundaries

### Owned here

- **Absolute values of a finite extension lying over a place**, in Mathlib's
  `AbsoluteValue.LiesOver` vocabulary: their classification at infinite and at finite places, the
  Galois action on them, and the general infrastructure it needs (bounded on `ℕ` implies
  nonarchimedean, the `rpow` of a nonarchimedean absolute value). This is what lets every theorem
  below take algebraic targets and algebraic coefficients without a completion appearing in any
  statement (Layer 0).
- The **`S`-adic dictionary**: the enlargement of `S` that makes the `S`-integers principal,
  **primitive** points and the height identity they satisfy, the fundamental inequality and
  **Liouville's inequality over a number field** (Layer 0).
- The theory of the **approximation exponents** beyond DAT's definitions and first inequalities:
  Möbius invariance, Northcott's theorem for integer polynomials, Liouville's bound for the
  value of an integer polynomial, **Wirsing's inequalities**, and **Mahler's and Koksma's
  classifications** (Layer 1).
- The **volume estimates** of Roth's method and the **auxiliary polynomial of prescribed index at
  several points**, with coefficients in `K` and points in a finite extension `F` (Layer 2).
- **Roth's theorem** over a number field with a finite set of places and targets in a finite
  extension, with the approximation classes it is proved with, the core of its proof as a
  statement about chains of solutions, the forms the applications quote (targets at infinity,
  Ridout, `p`-adic), Roth's theorem on the projective line with the central quantity of the
  Subspace Theorem, Mahler's theorem on `(p/q)^k`, the gap principle and the count of
  approximations, and moving targets (Layer 3).
- The **geometry of numbers of a parallelepiped over a number field**: approximation domains as a
  lattice and a convex body, the covolume of a finitely generated `𝓞 K`-module of `Kⁿ⁺¹`,
  successive minima over `K` with Minkowski's second theorem for them, the rank of a domain,
  **Evertse's lemma**, and the exterior powers of a system of forms (Layer 4).
- The **Subspace machinery**: the reductions to approximation domains, the multihomogeneous
  auxiliary polynomial, the index along linear forms and the generalized Roth lemma, the height
  of the span of a domain and the exceptional subspace, and the penultimate-minimum theorem
  (Layer 5).
- The **Subspace Theorem** for a number field and a finite set of places: parametric, with
  coefficients in `K`, with algebraic coefficients, affine, in general position, on a subspace,
  and the consistency with Layer 3 (Layer 6).
- The applications that are theorems about numbers: the exponents of an algebraic number,
  Schmidt's simultaneous approximation theorems, the combinatorial transcendence criterion and
  the complexity of the digits of an algebraic irrational (Layer 7).
- The applications that are theorems about equations over `S`-integers and `S`-units of a number
  field: the `S`-unit equation in two and in `n` variables, triangularly connected decomposable
  forms, Thue and Thue–Mahler, the hyperelliptic equation, and the Corvaja–Zannier gcd bound,
  together with the vocabulary of counting unit equations and the local Nullstellensatz
  inequality (Layer 8).
- The **elementary half of the quantitative theory**: systems of inequalities, the gap principle,
  the count of small solutions and the passage from an interval result to a count of subspaces
  (Layer 9).

### Consumed

- **Mathlib.** `Mathlib/NumberTheory/Height/`: `Height.AdmissibleAbsValues`, `Height.mulHeight`,
  `mulHeight₁`, `logHeight`, `NumberField.mulHeight_eq`, `mulHeight₁_eq`, `totalWeight_eq_finrank`,
  `Height.mulHeight_fun_prod_eq`, `Height.mulHeight_comp_le`, `Height.mulHeight₁_sub_le`,
  `Height.mulHeight₁_inv`, `Rat.mulHeight₁_eq_max`, `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`,
  `Projectivization.mulHeight`, the `Northcott` class and `NumberField.finite_setOfPred_mulHeight₁_le`.
  `Mathlib/NumberTheory/DiophantineApproximation/` and `…/Transcendental/Liouville/`: Dirichlet,
  Legendre, `LiouvilleWith` with its affine API, `Liouville.exists_pos_real_of_irrational_root`.
  Places: `NumberField.InfinitePlace` with `mult`, `comap`, `InfinitePlace.LiesOver`,
  `exists_smul_eq_of_comap_eq`, `sum_inertiaDeg_eq_finrank`, `mult_mul_finrank`;
  `NumberField.FinitePlace` with `FinitePlace.mk`, `maximalIdeal`, `equivHeightOneSpectrum` and
  `equivHeightOneSpectrum_symm_apply_algebraMap`; `NumberField.prod_abs_eq_one`; over `ℚ`,
  `Rat.AbsoluteValue.real`, `Rat.AbsoluteValue.padic` and `Rat.AbsoluteValue.equiv_real_or_padic`.
  Absolute values: `AbsoluteValue.under`, `AbsoluteValue.LiesOver`, `AbsoluteValue.IsEquiv`,
  `isEquiv_of_lt_one_imp`, `isEquiv_iff_exists_rpow_eq`, and Gelfand–Mazur,
  `NormedAlgebra.Real.nonempty_algEquiv_or`; `InfinitePlace.Completion.ringEquivRealOfIsReal` and
  `ringEquivComplexOfIsComplex`. `S`-integers and `S`-units: `Set.integer`, `Set.unit`,
  `Set.unitEquivUnitsInteger`; `ClassGroup.mk0_surjective`, `Ideal.finite_factors`,
  `IsDedekindDomain.HeightOneSpectrum.exists_primeCompl_mul_eq_of_integer`,
  `HeightOneSpectrum.valuationOfNeZero`. Polynomials: `Polynomial.hasseDeriv`, `Polynomial.taylor`,
  `Polynomial.homogenize`, `Polynomial.supNorm`, `Polynomial.rootMultiplicity`,
  `Polynomial.gaussNorm`, `MvPolynomial.IsWeightedHomogeneous`, `MvPolynomial.finSuccEquiv`,
  `MvPolynomial.divMonomial`, `MvPolynomial.modMonomial`. Exterior powers: `⋀[R]^n M`,
  `exteriorPower.ιMulti`, `Module.Basis.exteriorPower`. Geometry of numbers: `ZLattice`,
  `ZLattice.covolume`, `ZLattice.covolume_comap`, `NumberField.mixedEmbedding` with `latticeBasis`,
  `latticeBasis_repr_apply`, `integralBasis`, `norm` with `norm_apply`, `ZSpan.fract`, and
  `Int.Matrix.exists_ne_zero_int_vec_norm_le`. `Asymptotics.IsLittleO`. `OnePoint`.
- **Tau Ceti.** The Hasse derivative `MvPolynomial.hasseDeriv` with `hasseDeriv_comp`,
  `hasseDeriv_mul`, `coeff_taylor` and `eval_add_eq_finsum_hasseDeriv`
  (`TauCeti/Algebra/MvPolynomial/HasseDeriv/`, `TauCeti/RingTheory/MvPolynomial/HasseDeriv/`); the
  weighted index `MvPolynomial.weightedIndex` with `weightedIndex_mul`, `weightedIndex_eq_top_iff`,
  `weightedIndex_le_weightedIndex_hasseDeriv_add`, `weightedIndex_rename`,
  `weightedIndex_toMvPolynomial`, `weightedIndex_le_sum_degreeOf`
  (`TauCeti/RingTheory/MvPolynomial/WeightedIndex.lean`); `MvPolynomial.genWronskian` with
  `linearIndependent_iff_exists_genWronskian_ne_zero` and `Polynomial.hasseWronskian`;
  `MvPolynomial.taylor`, `orderAt`, `linearSubst` with `exists_aeval_pderiv_linearSubst_ne_zero`,
  `dehomogenize`, and the Kronecker substitution `MvPolynomial.exists_injOn_weight`
  (`TauCeti/RingTheory/MvPolynomial/`). Successive minima: `ZLattice.successiveMin` for a
  `ZLattice` and a `ConvexBody`, zero-based
  (`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`), and the upper half of Minkowski's
  second theorem `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`
  (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`). Heights:
  `TauCeti.absoluteProjectiveTupleHeight` with `absoluteProjectiveTupleHeight_eq`,
  `NumberField.mulHeight_algebraMap`, `absMulHeight₁_eq_rpow`,
  `mahlerMeasure_eq_absMulHeight₁_pow`, `finite_setOf_absMulHeight₁_le`, `TauCeti.naiveHeight`,
  `TauCeti.house`, `Polynomial.mulHeight` and `MvPolynomial.mulHeight` with their logarithmic
  forms, `Polynomial.mulHeight_mul_le`, the Gelfond inequality
  `mulHeight_mulHeight_le_two_pow_mul_mulHeight`, `rootMultiplicity_mul_logHeight₁_le` and
  `weightedIndex_toMvPolynomial_le` (`TauCeti/NumberTheory/Height/`); `Height.mulHeightAff` with
  its API, `mulHeight₁_sum_mul_le` and `mulHeight₁_det_le`; the Northcott instances on
  projective space; `absMulHeight₁_eq_one_iff` (Kronecker); `Set.mem_integer_iff_finitePlace`,
  `Set.mem_unit_iff_finitePlace`, `mulHeight₁_eq_of_mem_integer`, `mulHeight₁_eq_iff_mem_integer`
  and `NumberField.FinitePlace.mk_apply_le_one_iff`. The `S`-integers as a Dedekind domain,
  `IsDedekindDomain.integerHeightOneSpectrumEquiv`, `integerClassGroupEquiv`,
  `finite_integer_classGroup`, `subsingleton_integer_classGroup_iff`, `Set.mem_integer_empty_iff`,
  `mem_unit_empty_iff`, `unit_fg`, `unitValuation` and `finrank_sUnits_numberField`
  (`TauCeti/RingTheory/DedekindDomain/SInteger/`, `TauCeti/NumberTheory/NumberField/Units/SUnit/`);
  `HeightOneSpectrum.primesAbove` with `primesAbove_finite`
  (`TauCeti/RingTheory/DedekindDomain/PrimesAbove.lean`). The `S`-logarithmic embedding
  `TauCeti.NumberField.SUnit.logEmbedding`, the lattice `SUnit.unitLattice` with its
  `DiscreteTopology` and `IsZLattice ℝ` instances, `SUnit.fundSystem` and
  `exist_unique_eq_mul_prod` (`TauCeti/NumberTheory/NumberField/SUnits/`); the full logarithmic
  lattice of the units in the sum-zero hyperplane, `TauCeti.fullUnitLattice`
  (`TauCeti/NumberTheory/NumberField/Units/Log/Hyperplane.lean`). The places of a number field:
  `TauCeti.GlobalNumberFields.Place`, `normalizedAbsValue`, `finprod_normalizedAbsValue_eq_one`,
  the local extension formulas `normalizedAbsValue_inl_algebraMap`,
  `finprod_normalizedAbsValue_inl_algebraMap`, `normalizedAbsValue_inr_algebraMap`,
  `finprod_normalizedAbsValue_inr_algebraMap`, the logarithmic identities
  `logHeight₁_eq_finsum_posLog_normalizedAbsValue`, `abs_log_normalizedAbsValue_le_logHeight₁`
  and `sum_log_adicAbv_add_sum_mult_mul_log_eq_zero` (`TauCeti/NumberTheory/NumberField/Global/Places/`);
  `NumberField.InfinitePlace.prod_comap_pow_mult`, `sum_mult_eq_mult_mul_finrank` and
  `mem_placesOver`. Siegel's lemma with integer unknowns,
  `NumberField.exists_ne_zero_int_vec_abs_le_of_house_le`. `TauCeti.irrationalityExponent` with
  its API, `BadlyApproximable`, and `Rat.AbsoluteValue.IsStandard` with
  `AbsoluteValue.IsEquiv.eq_of_isStandard` (`TauCeti/Analysis/AbsoluteValue/Equivalence.lean`).
- **DAT**, by section, under Tau Ceti's names where it is in Tau Ceti. §0.1
  `TauCeti.primitiveMinpoly` (`TauCeti/FieldTheory/Minpoly/Primitive.lean`). §0.5
  `TauCeti.linearFormExponent`, `mahlerExponent` and `algebraicApproximationExponent`, with the box
  principle `card_le_linearFormExponent`, its form `natCast_le_mahlerExponent` (`w_n ≥ n` unless
  `ξ` is algebraic of degree at most `n`), and `algebraicApproximationExponent_le_mahlerExponent`
  for every `n` and every real `ξ` (`TauCeti/NumberTheory/DiophantineApproximation/`). §1.2 the
  coefficient bound `MvPolynomial.abv_coeff_hasseDeriv_le`, and its nonarchimedean form without
  the factor `2 ^ |m + d|`. §1.3 `MvPolynomial.logHeight` with `logHeight_mul_of_disjoint_vars`.
  §1.4 the height of a determinant of Hasse derivatives, `MvPolynomial.logHeight_det_hasseDeriv_le`
  (`TauCeti/NumberTheory/Height/MvPolynomial.lean`), and the separation of variables,
  `MvPolynomial.exists_sum_mul_linearIndependent` and `det_hasseDeriv_sum_mul_toMvPolynomial`
  (`TauCeti/RingTheory/MvPolynomial/`). §1.5 **Roth's lemma**,
  `TauCeti.weightedIndex_le_of_logHeight_le`, over a number field with relative heights, at the
  constants `2 n σ ^ (1 / 2 ^ (n − 1))` and `4 n r₁ [K : ℚ]`
  (`TauCeti/NumberTheory/DiophantineApproximation/Roth/IndexEstimate.lean`). §1.7
  `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm` with
  `hasseDeriv_aeval_blockLinearForm_hasseDeriv` and `degreeOf_aeval_blockLinearForm_le`
  (`TauCeti/RingTheory/MvPolynomial/HasseDeriv/ChainRule.lean`), and the block-homogeneous calculus:
  residual block degrees, a zero block, and blocks of degree `0`. §2.1 `TauCeti.InGeneralPosition`
  with `inGeneralPosition_iff_det_ne_zero`, `inGeneralPosition_coords_add_sum` and
  `InGeneralPosition.map` (`TauCeti/LinearAlgebra/LinearIndependent/GeneralPosition.lean`);
  `finite_small_linear_form` (one linear form, Theorem 7.7) and
  `finite_approximation_bounded_degree` (Theorem 7.8), which 7.1 consumes as stated. §2.3
  `IsNondegenerateSolution` and `IsNondegenerateHomogeneousSolution`. §2.5 `TauCeti.plucker` with
  Cauchy–Binet, `det_mul_transpose_eq_sum_plucker_mul`
  (`TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean`); `Submodule.relativePluckerPoint`
  (`TauCeti/LinearAlgebra/Projectivization/Plucker.lean`); `Submodule.relativeSubspaceHeight` with
  `relativeSubspaceHeight_euclideanDual`, `relativeSubspaceArakelovHeight`, `subspaceHeight` with
  `subspaceHeight_euclideanDual`, `finite_subspaceHeight_le`, `height2` and `arakelovMulHeight`
  (`TauCeti/NumberTheory/Height/`); and `orthogonalBilin_eq_dualAnnihilator_comap`,
  `relativeSubspaceHeight_dualAnnihilator` and `subspaceHeight_le_prod`. §2.6 the grid lemma
  `exists_rectangular_int_grid_jet` and the block form
  `exists_nonzero_block_grid_jet_of_restriction`. §2.8 the extraction lemma
  `TauCeti.exists_linearIndependent_comp_finrank_mul`
  (`TauCeti/LinearAlgebra/LinearIndependent/Extraction.lean`), `exists_ne_zero_height2_le`,
  `siegelKernelBasis`, `siegelRelativeKernelBasis` and `siegelCoefficientConditions`.
- **HAU**, by milestone. 0.1 and 0.2, the affine height and the value bounds (in Tau Ceti); 1.1
  Northcott on projective space (in Tau Ceti); 1.2 the `Northcott` instances for DAT's three
  subspace heights (in Tau Ceti); 1.3 Kronecker's theorem (in Tau Ceti); 4.1 the height of an
  `S`-integer (in Tau Ceti); 4.2 the `S`-unit theorem with a fundamental system (in Tau Ceti); 4.3
  the `S`-logarithmic lattice (in Tau Ceti).
- **GlobalNumberFields** Layer 0, through the Tau Ceti declarations named above: the place
  carrier `Place K`, the normalized absolute values, the product formula and its functoriality
  under a finite extension with the local degrees in the exponents.
- **SM**, by milestone. 1.5 `exists_successiveMin_witnesses`; 2.1.4 `minkowski_second_lower`;
  0.1.2 `hermitian_gram_hadamard`.

### Instances owned by other roadmaps

The statements below are DAT's targets, over `ℚ` or in the absolute theory, and this roadmap does
not restate them. Each is the instance of a milestone here that the right-hand column names; the
milestone's acceptance test is that its statement specializes to DAT's, and a contributor who
lands the milestone discharges the instance in the same pull request.

| DAT target | Milestone here |
| --- | --- |
| §1.6 Roth's theorem for a real algebraic `α` and rational `ξ`, and `¬ LiouvilleWith p α` for `p > 2`; in Tau Ceti as `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg` and `IsAlgebraic.not_liouvilleWith` | 3.3, `K = ℚ`, `S∞ = {∞}`, `S₀ = ∅`; the specialization is the acceptance test, and there is nothing to discharge |
| §1.6 `thue_equation_finite`, Thue's equation over `ℤ` | 8.4 at `K = ℚ`, `S = ∅` |
| §2.1 `subspace_theorem`, `subspace_theorem_general_position` | 6.3 and 6.5 at `K = ℚ`, `S∞ = {∞}`, `S₀ = ∅`, integer points |
| §2.1 `padic_subspace_theorem`, `padic_subspace_theorem_general_position` | 6.3 and 6.5 at `K = ℚ` with `S₀` the chosen primes |
| §2.1 `finite_two_forms_strict`, `roth_of_subspace_theorem` | 3.4 and 6.6 at `K = ℚ` |
| §2.3 the `p`-adic Roth theorem over `ℚ` with targets in the completions | 3.3, `K = ℚ`, through Layer 0.1 |
| §2.3 `finite_thueMahler` over `ℤ` | 8.4 at `K = ℚ` |
| §2.3 `finite_two_term_unit_equation_rat`, `finite_nondegenerate_solutions_rat` | 8.1 and 8.2 at `K = ℚ`, through `Γ ≤ S.unit ℚ` for a finite `S` |

### Not owned here

- **Metric Diophantine approximation**: Khinchin, Jarník–Besicovitch, Sprindžuk. Layer 1 proves
  what holds for every number; almost-every statements are not here.
- **Continued fractions** beyond Mathlib's, and the exponents themselves: `irrationalityExponent`
  is Tau Ceti's and `linearFormExponent`, `mahlerExponent`, `algebraicApproximationExponent`,
  `simultaneousExponent` are DAT §0.5's. Layer 1 adds theorems about them.
- **The Roth machinery**: Hasse derivatives, the weighted index, generalized Wronskians, the
  height of a product in disjoint variables, the height of a determinant of derivatives and
  Roth's lemma itself are DAT §§1.2–1.5, in Tau Ceti where landed. Layer 2 consumes them.
- **Heights of polynomials, matrices and subspaces**, the Plücker point, Cauchy–Binet, duality
  and the Siegel lemma in every form: DAT §§1.3, 2.5, 2.8.
- **Thue's equation over `ℤ`** (DAT §1.6), **norm-form equations** (DAT §2.2, Schmidt's theorem
  and its criterion), **unit equations over finitely generated and finite-rank groups** with
  their counts (DAT §§2.3–2.4), and **Vojta's exceptional subspace** (DAT §2.1, Theorem 7.14).
- **The absolute and quantitative Subspace Theorem**: twisted heights, the absolute minima, the
  sharp Roth lemma through Faltings's product theorem, and the counts of Evertse–Schlickewei and
  Evertse–Ferretti (DAT §§2.5–2.8). Layer 9 is the elementary half, in the language of systems of
  inequalities, and 6.1 is the parametric statement those counts strengthen.
- **Effective methods**: Baker's theory, effective unit and Thue equations, the hypergeometric
  method (DAT Layers 3–4, [LinearFormsInLogarithms](../LinearFormsInLogarithms/README.md)). Every
  finiteness theorem here is ineffective in the height, and no statement below bounds a height.
- **Function fields.** The Subspace Theorem fails in positive characteristic (Bombieri–Gubler
  6.2.8). Everything from Layer 2 on is a number-field statement.
- **Siegel's theorem on integral points on curves** by the Corvaja–Zannier method. 6.4 is
  stated so that [AlgebraicCurves](../AlgebraicCurves/README.md) or
  [EllipticCurves](../EllipticCurves/README.md) can consume it; the curve-side argument is not
  here.
- **Tori and the Mordell–Lang circle**: Laurent's theorem, unit equations over arbitrary fields of
  characteristic zero by specialization, linear recurrences and Skolem–Mahler–Lech (DAT §2.4).
- **Automatic sequences.** 7.2 and 7.3 take an arbitrary sequence of digits; that the digits of
  an automatic sequence satisfy their hypotheses needs Cobham's theorem, which no roadmap builds.

## Standing hypotheses

`K` is a number field of degree `d = [K : ℚ]` from Layer 0 on, except in Layer 1, which is about
real numbers, and in the parts of Layers 2, 4 and 5 that are algebra over an arbitrary field or
commutative ring, each of which says so. The theorems of Layers 3–9 are false over a general
`Height.AdmissibleAbsValues` field, since a global field of positive characteristic has a product
formula and Weil heights while Roth's theorem fails there for one place and one target
(Bombieri–Gubler 6.2.8); none of them is stated at that generality.

Points are tuples `x : ι → K` with `[Fintype ι]`, following `Height.mulHeight`, and the dimension
`n + 1` of the literature is `Fintype.card ι`. Every form of the Subspace Theorem carries
`[Nontrivial ι]`, that is `n ≥ 1`: for a one-element `ι` the only proper subspace is `0`, every
nonzero `x` has height `1`, the hypothesis can hold, and the statement is false there rather than
empty. Subspaces are `Submodule K (ι → K)`, never `Module.Grassmannian` or
`Projectivization.Subspace`, because DAT's subspace height is defined on `Submodule`.

## Pinned conventions

| Question | Convention |
| --- | --- |
| a finite set of places | **Two typed finsets**, `Sinf : Finset (InfinitePlace K)` and `Sfin : Finset (FinitePlace K)`, in the shape of `NumberField.mulHeight_eq`, a product over `InfinitePlace K` with exponent `mult` times a product over `FinitePlace K`. The prose writes them `S∞` and `S₀`. ⚠ **Never `S : Finset (AbsoluteValue K ℝ)` without a hypothesis that its members are places**: `\|·\|^{1/j}` is an absolute value on `ℚ` for every `j ≥ 1`, and with `S = {\|·\|, \|·\|^{1/2}, \|·\|^{1/3}, \|·\|^{1/4}}`, the coordinate forms and `ε = 1/12`, every `(1, q)` satisfies the inequality of the Subspace Theorem with equality while no finite set of lines contains them all. The untyped statement is false. |
| `S` for `S`-integers and `S`-units | `S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`, **finite places only**, the carrier of Mathlib's `S.integer K` and `S.unit K` and HAU's convention, with every infinite place implicitly present: there `S∞ = Finset.univ` and `S₀ = S.image FinitePlace.mk`. ⚠ Bombieri–Gubler's `S` always contains the archimedean places; translate. |
| products over all places | `TauCeti.GlobalNumberFields.Place K` with `normalizedAbsValue`, the carrier of the product formula and of the local extension formulas. A product over a finite set of places is a product over the two typed finsets. |
| normalization | **Mathlib's, which is relative.** The local factor of `y` at `v : InfinitePlace K` is `v y ^ v.mult` and at `v : FinitePlace K` it is `v y`; the height is `Height.mulHeight`. Bombieri–Gubler's absolute values and heights are the `d`-th roots. Every inequality below is homogeneous in that normalization, so it reads the same in both; any statement that mixes a relative quantity with an explicit constant or with a height over another field says which it is in. |
| where the points live, where the coefficients live | **Points in `K`, coefficients and targets in a finite extension `F` of `K`**, with `[Algebra K F]`, measured at `v` by an absolute value `w v : AbsoluteValue F ℝ` with `(w v).LiesOver v`. This is Bombieri–Gubler's Theorem 6.4.1 and 7.2.2 and the one formulation that contains both forms in print: `F = K` is the Evertse–Schlickewei number-field form, `K = ℚ` with `F` generated by the coefficients is Schmidt's form with algebraic coefficients. Neither specializes to the other. No completion `K_v` appears in any statement: a `K`-algebraic element of `K_v` is an element of some `F` together with a `w` over `v`. |
| the central quantity | `NumberField.approxProd Sinf Sfin w L x`, the product over `v ∈ Sinf` of `(∏ i, w v (L v i x) / ⨆ j, v (x j)) ^ v.mult` times the product over `v ∈ Sfin` of `∏ i, w v (L v i x) / ⨆ j, v (x j)`, with `L v i : Module.Dual F (ι → F)` and `x` mapped into `F`. The forms and the absolute values are indexed by the underlying `AbsoluteValue K ℝ` of a place, `L : AbsoluteValue K ℝ → ι → Module.Dual F (ι → F)`, so that one family serves both finsets; their values off `S∞ ∪ S₀` are irrelevant. It is invariant under scaling `x` by `Kˣ` **because `w v` lies over `v`**, bounded above in terms of the forms alone, raised to `[K' : K]` under extension of `K`, and multiplicative in `S`. The local sup norm `⨆ j, v (x j)` is written out and has no name. |
| strict or non-strict | **`≤`.** `approxProd … x ≤ mulHeight x ^ (−(card ι) − ε)`. The literature writes `<`; the two are equivalent (pass to `ε/2` and discard the finitely many projective points of height `1`), and `≤` is what a consumer's estimate produces. |
| the conclusion | `∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧ ∀ x ≠ 0, … → ∃ W ∈ T, x ∈ W`, subspaces of `Kⁿ⁺¹`, the field of the points. Finiteness of a set of solutions is `Set.Finite`. |
| multiplicative or logarithmic | **Both**, multiplicative primary, as in Mathlib. The Roth machinery is additive, so Layers 2 and 5 are stated in `logHeight`; Layers 3, 6, 7 and 8 in `mulHeight`; Layer 9 in the affine height `Height.mulHeightAff` and its `[K : ℚ]`-th root, as Evertse states it. |
| derivatives and the index | Tau Ceti's `MvPolynomial.hasseDeriv` and `MvPolynomial.weightedIndex r a P`, with weights `r : σ → ℕ`, `0 < r j`, and value in `ℝ≥0∞` with `weightedIndex r a 0 = ⊤`. |
| approximation exponents | Tau Ceti's `irrationalityExponent` and DAT's `mahlerExponent n ξ` (Mahler's `w_n`, through `linearFormExponent`) and `algebraicApproximationExponent n ξ` (Koksma's `w_n^*`, with complex algebraic approximants of degree at most `n` and the naive height), all `ℝ≥0∞`-valued. A real approximant is a complex one, so every lower bound proved with real approximants holds for DAT's exponent. |
| targets at infinity | `OnePoint F`, with local factor `(max 1 (w v β))⁻¹` at the target `∞`, which is `1` at `β = 0`; the formula `min 1 (w v β)⁻¹` is `0` there under Lean's `0⁻¹ = 0` and is not used. |
| declaration names | Statement-named, as in Mathlib; Roth, Ridout, Schmidt, Schlickewei, Evertse, Thue, Mahler and Wirsing go in docstrings. |
| effectivity | None. No statement bounds the height of a solution or of a subspace. Statements that bound a **number**, of approximations in 3.6 and of subspaces in Layer 9, say which solutions they count. |

## The build, in layers

### Layer 0: absolute values above a place and the `S`-adic dictionary

Algebraic number theory only. It exists so that no later layer has to mention a completion.

**0.1 Absolute values above a place** (Bombieri–Gubler 1.3). For a finite extension `F/K` of
number fields and a place `v` of `K`, classify the `w : AbsoluteValue F ℝ` with `w.LiesOver v`.
For `v : InfinitePlace K` they are exactly the underlying absolute values of the
`w' : InfinitePlace F` with `w'.LiesOver v` (`NumberField.isInfinitePlace_of_liesOver`, proved
for an arbitrary field extension: the argument runs in the completion `F_w`, whose copy of `ℝ`
is imported from `K_v` through `InfinitePlace.Completion.ringEquivRealOfIsReal` and
`ringEquivComplexOfIsComplex`, and Gelfand–Mazur asks neither for completeness nor for finite
dimension). For `v = FinitePlace.mk 𝔭` they are exactly the functions
`y ↦ (FinitePlace.mk 𝔓 y) ^ ((e * f : ℝ)⁻¹)` for the primes `𝔓` of `𝓞 F` over `𝔭`, with `e` and
`f` the ramification index and inertia degree (`NumberField.exists_finitePlace_rpow_inv_eq_of_liesOver`),
a **root** of a finite place of `F`, because `FinitePlace.mk 𝔓` restricted to `K` is
`(FinitePlace.mk 𝔭) ^ (e f)` (Mathlib's `equivHeightOneSpectrum_symm_apply_algebraMap`). Deduce
that the set of such `w` is finite and nonempty, that `w` is nonarchimedean exactly when `v` is
finite, that every `w` over `v` extends to every further finite extension `F'/F`, and the two
size bounds `max (w x) 1 ≤ mulHeight₁ x` for `x ∈ F` and `w` over an infinite or a finite place
of `K`. Route for the nonarchimedean half: a `w` over a finite place is bounded on `ℤ`, hence
nonarchimedean and at most `1` on `𝓞 F`, so `{y ∈ 𝓞 F | w y < 1}` is a prime over `𝔭` and `w` is
equivalent to its adic absolute value by `AbsoluteValue.isEquiv_of_lt_one_imp` after writing
`x = n / d` with `d ∉ 𝔓` (`exists_primeCompl_mul_eq_of_integer`), the exponent being fixed by
`w.under K = v`; the fibre is the image of the finite set of primes above `𝔭`. ⚠ `w` is **not** in
general the absolute value of a `FinitePlace F`, and a statement that asks for one excludes every
ramified or non-split prime. The classification is what is proved; the hypothesis consumers
state is `w.LiesOver v`.

Three pieces of absolute-value infrastructure Mathlib lacks are part of this milestone and live
beside `Mathlib/Analysis/AbsoluteValue/`: *bounded by `1` on `ℕ` implies nonarchimedean*
(Mathlib proves it only inside its `ℚ`-specific Ostrowski development); *a nonarchimedean
absolute value bounded by `1` on `ℤ` is bounded by `1` on the integral elements*; and
`AbsoluteValue.nonarchRpow`, **the `t`-th power of a nonarchimedean absolute value for every
`t > 0`**, which is what makes the fibre over a finite place nonempty (the exponent `(e f)⁻¹` is
known only after the prime is produced). For an archimedean absolute value only `t ≤ 1` works
(`Real.rpow_add_le_add_rpow`); the rejection test is `t = 2` on `ℚ`. Also: *an absolute value of
`ℂ` that restricts to `|·|` on `ℝ` is `|·|*` (`AbsoluteValue.eq_norm_of_apply_ofReal`), which
closes the gap between Gelfand–Mazur's algebra isomorphism and an isometry; and *an infinite place
and a finite place never have the same underlying absolute value*
(`NumberField.InfinitePlace.val_ne_finitePlace_val`, from `v 2 = 2` against `v 2 ≤ 1`), which
3.4 needs to spread a choice made on `S` to every `AbsoluteValue K ℝ`.

**0.2 Conjugate absolute values** (Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5). Define the
action `σ • w = w ∘ σ⁻¹` as a `MulAction (F ≃ₐ[K] F) (AbsoluteValue F ℝ)` for any algebra of
semirings, extending Mathlib's action on `InfinitePlace`; it has to be on all of
`AbsoluteValue F ℝ`, because the elements of the fibre over a finite place are not finite
places. For `F/K` Galois prove that the action on the absolute values over `v` is transitive,
the `AbsoluteValue.LiesOver` form of `InfinitePlace.exists_smul_eq_of_comap_eq` and of
`Ideal.exists_comap_galRestrict_eq`. Route: classify `w ∘ σ` by 0.1 as an absolute value over `v`
and name its prime through 0.1's uniqueness clause, `{y ∈ 𝓞 F | w (σ y) < 1}` being the
contraction of `{y | w y < 1}` along `σ`; no equivariance of `absNorm` or of the adic valuation
under `σ` is needed. The **local extension formula** is Tau Ceti's: the product over the places
of `F` above `v` of the normalized absolute values of `y ∈ K` is `v y ^ [F : K]`, at infinite
places `finprod_normalizedAbsValue_inr_algebraMap` and at finite places
`finprod_normalizedAbsValue_inl_algebraMap`; what this milestone adds is the restatement for the
absolute values of 0.1, where a finite place of `F` is the `(e f)`-th power of an absolute value
over `v` and the `(e f)` cancels against `sum_localDegree` exactly as `mult` cancels against
`sum_mult_eq_mult_mul_finrank`. The vocabulary Mathlib has for infinite places and not for finite
ones, `FinitePlace.LiesOver`, `FinitePlace.localDegree = e f`, `FinitePlace.placesOver` with its
finiteness and nonemptiness, is part of this milestone. ⚠ `NumberField.FinitePlace.LiesOver` says
the primes lie over each other; `AbsoluteValue.LiesOver` says `w` restricts to `v` on the nose.
They agree exactly when the local degree is `1` (`FinitePlace.liesOver_val_iff_localDegree_eq_one`).
⚠ `InfinitePlace.inertiaDeg` is the local degree `[F_w : K_v]`, `1` or `2`, not a residue degree.

**0.3 The `S`-adic dictionary** (Bombieri–Gubler, Theorem 7.2.6 and Proposition 5.3.6). For
`S : Finset (HeightOneSpectrum (𝓞 K))`:
- The `S`-product formula in multiplicative form,
  `(∏ v : InfinitePlace K, v u ^ v.mult) * ∏ v ∈ S, v u = 1` for an `S`-unit `u`, two lines on
  Tau Ceti's `sum_log_adicAbv_add_sum_mult_mul_log_eq_zero`.
- For `x : ι → K`, `x ≠ 0`, with coordinates in `S.integer K`, `mulHeight x` is at most the
  product over the infinite places and `S` of the local sup norms
  (`NumberField.mulHeight_le_prod`), with equality when the coordinates generate the unit ideal
  of `S.integer K`, which is `Set.IsPrimitive S x`
  (`NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`); primitivity implies that every local
  sup norm outside `S` is `1`, by the ultrametric inequality on `1 = ∑ cᵢ xᵢ`. The converse, that
  local sup norms equal to `1` away from `S` imply primitivity, is a statement about the maximal
  ideals of `S.integer K` through `IsDedekindDomain.integerHeightOneSpectrumEquiv`, and is part of
  the milestone. `[Finite ι]` throughout, `Fintype` only where a statement sums over `ι`.
- **Every finite `S` is contained in a finite `S'` with `S'.integer K` a principal ideal
  domain.** Choose one representative ideal per class of `ClassGroup (𝓞 K)`
  (`ClassGroup.mk0_surjective`), one nonzero element of each, and adjoin to `S` the finitely many
  primes containing those elements (`Ideal.finite_factors`); then the classes of `S'` generate
  the class group, `IsDedekindDomain.subsingleton_integer_classGroup_iff` makes `Cl(𝒪_{S'})`
  trivial, and a Dedekind domain with trivial class group is principal. No prime factorization of
  a representative and no class number enters.
- Over a principal `S'.integer K` every nonzero point of `Kⁿ⁺¹` has a primitive scalar multiple,
  and hence (`NumberField.exists_finset_superset_forall_exists_mulHeight_eq`) every finite `S` is
  contained in a finite `S'` such that the height of every nonzero point is, after one scaling,
  the product of its local sup norms over the infinite places and `S'`. This is the assembly
  Theorem 7.2.6 opens with, and it is what 5.1 and 6.4 consume.
- `NumberField.FinitePlace.hasFiniteMulSupport_iSup`: for `x ≠ 0`, the finite support of
  `v ↦ ⨆ᵢ |xᵢ|_v`, bounded by the union over the nonzero coordinates. Mathlib proves it for a
  field with `AdmissibleAbsValues` but keeps it private, and its public form asks every
  coordinate to be nonzero. `x ≠ 0` is needed here and in the height bound above: the zero tuple
  has height `1` and local sup norm `0` at every place.
The membership dictionaries and the height of a single `S`-integer are HAU 4.1, in Tau Ceti, and
the `S`-unit theorem is HAU 4.2; neither is restated. Exponent bookkeeping is done in `ℤ` through
`HeightOneSpectrum.valuationOfNeZero`, whose normalization is the negative of the usual order.

**0.4 The fundamental inequality and Liouville's inequality** (Bombieri–Gubler (1.8), Theorem
1.5.21, Theorem 2.8.21). The truncated local factors `min 1 (v α)` of a nonzero `α ∈ K`, taken
over all places, multiply to `(mulHeight₁ α)⁻¹` exactly
(`NumberField.prod_min_one_apply_eq_inv_mulHeight₁`, the product formula read through
`min 1 t * max t 1 = t`); cutting the product down to `S∞` and `S₀` can only increase it, so the
product of the local factors of `α` over `S∞` and `S₀` is at least `(mulHeight₁ α)⁻¹`
(`NumberField.inv_mulHeight₁_le_prod_apply`) and, applied to `α⁻¹` with `Height.mulHeight₁_inv`,
at most `mulHeight₁ α`; at a single place, `(mulHeight₁ α)⁻¹ ≤ min 1 (v α)` and
`max (v α) 1 ≤ mulHeight₁ α`. **Liouville's inequality**: for `α ∈ F`, `β ∈ K`, `α ≠ β`, and
`w v` over `v`, the product over `S∞` of `min 1 (w v (β − α)) ^ v.mult` times the product over
`S₀` of `min 1 (w v (β − α))` is at least
`(2 ^ [F : ℚ] * mulHeight₁ α * mulHeight₁ (β : K) ^ [F : K])⁻¹`
(`NumberField.inv_le_prod_min_one_sub`), the heights being Mathlib's relative ones of `α` over
`F` and of `β` over `K`: Bombieri–Gubler's `(2 H(α) H(β))^{−[F : K]}` raised to the power `d`,
weaker than theirs at a place where `F_w ≠ K_v`. The constant is `Height.mulHeight₁_sub_le`'s; the
exponent `[F : K]` is Tau Ceti's `NumberField.mulHeight₁_algebraMap`; above an infinite place the
multiplicity comparison is `InfinitePlace.mult_comap_le` through 0.1, above a finite place it is
`min 1 (s ^ t) ≥ min 1 s` for the exponent `t ≤ 1` of 0.1, and the chosen places above distinct
`v` are distinct by `FinitePlace.maximalIdeal_inj`. Also the real-number corollary with the degree
of the minimal polynomial, `Real.exists_pos_one_le_pow_natDegree_mul_abs_sub_div`, from which
Mathlib's `Liouville.exists_pos_real_of_irrational_root` follows with the constant
`2 ^ [F : ℚ] * mulHeight₁ ξ * (⌈|ψ ξ|⌉₊ + 1) ^ [F : ℚ]` for `F = ℚ⟮ξ⟯` in place of its compactness
constant. Nothing in 0.4 uses 0.2. This is the local step of every proof in Layers 3, 5 and 7, and
the gap principle of 3.6 is this inequality against the triangle inequality.

### Layer 1: approximation exponents

Real numbers only; the definitions are Tau Ceti's and DAT's. Nothing here uses Layers 2–6, and
Layer 7 returns to it with the Subspace Theorem in hand.

**1.1 Möbius invariance and Northcott for integer polynomials** (Bugeaud, *Approximation by
Algebraic Numbers*, Ch. 3). `LiouvilleWith.inv`: for `1 < p` and `ξ ≠ 0`, `LiouvilleWith p ξ`
implies `LiouvilleWith p ξ⁻¹`. The approximations to `ξ⁻¹` are indexed by the numerators of
those to `ξ`, a different `atTop` filter, and the numerator is bounded below only past the
threshold `C / n ^ p ≤ ξ / 2`, which is where `1 < p` is used; below `p = 1` the statement is
`liouvilleWith_one`. With Mathlib's affine API and Tau Ceti's `irrationalityExponent_add_ratCast`,
`ratCast_mul`, `neg`, this gives invariance of `irrationalityExponent` under
`ξ ↦ (a ξ + b) / (c ξ + d)` for a rational matrix of nonzero determinant, by the partial-fraction
decomposition into four maps. The same for `mahlerExponent n` (the affine part is
`Polynomial.comp` with a linear substitution, the inversion is `Polynomial.reflect n`, which
permutes the coefficients and preserves `supNorm` exactly) and for `algebraicApproximationExponent n`
(roots move by `Polynomial.scaleRoots`, and the minimal polynomial of the transformed approximant
is extracted as an irreducible factor of the transform with Gelfond's inequality,
`Polynomial.mulHeight_mulHeight_le_two_pow_mul_mulHeight` in its integer form, controlling its
height). Also the characterization `Real.le_irrationalityExponent_iff` by
`|ξ − p/q| < q^{−μ}` with `H(p/q) = max |p| q` in place of `q`, for `0 < μ`, and
`liouvilleWith_iff_frequently_max`. **Northcott for integer polynomials**,
`Polynomial.finite_setOf_natDegree_le_supNorm_le`: the `P : ℤ[X]` with `natDegree P ≤ n` and
`supNorm P ≤ B` form a finite set; and the height gap that every statement of this layer runs on,
`Polynomial.exists_pos_lt_supNorm_of_abs_aeval_lt` (below a threshold depending only on a height
bound, a nonzero value `|P ξ|` forces `supNorm P` above the bound) with its root form
`Polynomial.exists_pos_lt_supNorm_of_abs_sub_root_lt`. Also the rigidity
`Polynomial.supNorm_eq_of_isPrimitive_of_irreducible`: two primitive irreducible integer
polynomials with a common root in a `ℚ`-algebra that is a domain have the same `supNorm`, so the
naive height of an algebraic number is a function of it (DAT's `naiveHeight`). Rejection tests:
`mahlerExponent 1` is not the irrationality exponent (`0` against `1` at a rational), the
determinant hypothesis is load-bearing, the degree bound in Northcott cannot be dropped, and
the constant `2 ^ deg` in Gelfond's inequality cannot be dropped (`(2X + 1)(X − 2)` has height `3`
while both factors have height `2`).

**1.2 Liouville's bound and Wirsing's inequalities** (Bugeaud, Ch. 3; Wirsing 1961). For `ξ`
real algebraic of degree `D`: **Liouville's inequality for the value of an integer polynomial**,
`|P ξ| ≥ c H(P) ^ (−(D − 1))` for `P` of degree at most `n` with `P ξ ≠ 0`, where `c` depends on
`n` and `ξ`, hence `mahlerExponent n ξ ≤ D − 1` (`Real.mahlerExponent_le_of_isAlgebraic`). The
exponent `D − 1`, not `D`, comes from the norm: `∏_w w(γ)^{mult w} = |N(γ)| ≥ 1` for the algebraic
**integer** `γ = (P.scaleRoots t)(t ξ)`, and only the other `D − 1` places are estimated by `H(P)`,
the distinguished real place having `mult = 1`; this consumes
`NumberField.InfinitePlace.prod_eq_abs_norm`, not 0.4. **Wirsing's three lower bounds** on
Koksma's exponent, for `ξ` not algebraic of degree at most `n` and `1 ≤ n`, with
`w = mahlerExponent n ξ` and `w^* = algebraicApproximationExponent n ξ`, in `ℝ≥0∞` with the
conventions that make each true at `w = ⊤`:
- `w − n + 1 ≤ w^*`, stated as `w + 1 ≤ w^* + n`;
- `(w + 1) / 2 ≤ w^*`, stated as `w + 1 ≤ 2 w^*`;
- `w / (w − n + 1) ≤ w^*` (`Real.div_le_algebraicApproximationExponent`), which at `w = n` reads
  `n ≤ w^*` and holds without `1 ≤ n`.
The third is proved by construction: a polynomial at most `H ^ (−w')` at `ξ` and at most `H` at
`n − 1` further test points, `2` apart from `ξ` and `1` apart from each other, from a pigeonhole on
`n` linear forms (`Real.exists_int_coeff_forall_abs_eval_le`, a box principle in place of
Minkowski's linear forms theorem, at the cost of a constant); for `w'` above the Mahler exponent
its height is forced above `H ^ (1 + ε)`, so it is large relative to its height at every test
point and has a root within `1/4` of each, one per point, all simple, the one near `ξ` real
because its disc is conjugation-stable; the limit `w' ↓ w` is taken once at the end by continuity.
The bounds on `H(P)` and `|lc P|` from the roots are Mathlib's
`mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm` and
`supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`. The first two bounds start from an
arbitrary Mahler approximant, whose nearest root need not be real: following Bell–Bugeaud, a
strictly nearest root is real, and when the minimum is attained `r ≥ 2` times the estimate
`|P ξ| ≤ c H(P) |ξ − α| ^ r` forces the complex-approximant exponent below `(w − 1)/2`. The first
inequality therefore needs the nearest-root estimate `|ξ − α| ≤ c |P ξ| H(P) ^ (n − 2)`, which is
`|P'(α)| ≥ 2 ^ (−(d−1)(d−2)/2) M(P) ^ (−(d−2))` from `|disc P| ≥ 1` and
`disc P = lc(P) ^ (2d − 2) ∏_{i<j} (α_i − α_j) ^ 2`; that product formula for Mathlib's
`Polynomial.discr`, pairing the roots into a square, is part of this milestone. The second is
Wirsing's generalized-resultant construction, a basis selected among the monomial multiples of a
family of polynomials, as in Poëls's and Dixit's treatments. In the range `n ≤ w ≤ 2n − 3` the
first needs the second. Both are false at `n = 0`, where both exponents are `0`.

**1.3 Mahler's and Koksma's classifications** (Bugeaud, Ch. 3; Mahler 1932; Koksma 1939). With
`w(ξ) = limsup_n mahlerExponent n ξ / n` in `ℝ≥0∞`: `Real.IsANumber` (`w = 0`), `IsSNumber`
(`0 < w < ⊤`), `IsTNumber` (`w = ⊤`, every `w_n` finite) and `IsUNumber` (some `w_n = ⊤`), and
Koksma's `IsAStarNumber`, `IsSStarNumber`, `IsTStarNumber`, `IsUStarNumber` from
`algebraicApproximationExponent`. Prove: the `A`-numbers are exactly the real algebraic numbers;
the two classifications coincide class by class, from 1.2's second inequality and
`w^* ≤ w`, which give `w / 2 ≤ w^* ≤ w` (including `A = A^*`, because a transcendental number has
`w_n ≥ n`, hence `w_n^* ≥ (n + 1) / 2` and `w^* ≥ 1/2`); Liouville numbers are `U`-numbers with
`w_1 = ⊤` (Mathlib's `Liouville`); and **Mahler's theorem** that two algebraically dependent
transcendental numbers lie in the same class, through the exponents' invariance under polynomial
relations. That `T`-numbers exist (Schmidt) and that almost every number is an `S`-number
(Sprindžuk) are not targets: the first needs Layer 6 and a construction of its own, the second is
metric.

### Layer 2: the auxiliary polynomial over a number field

The non-vanishing technology Layers 3 and 5 share. The Hasse derivative, the weighted index, the
generalized Wronskian and Roth's lemma are Tau Ceti's and DAT's; this layer adds the two estimates
Bombieri–Gubler's Chapter 6 needs beyond them.

**2.1 Counting and volume** (Bombieri–Gubler 6.3.3 and the proof of Lemma 6.3.4, Lemma 6.3.5,
(7.23)–(7.25)). With `Real.simplexVolume m t` the volume `V_m(t)` of `{x ∈ [0,1]^m | ∑ x j ≤ t}`:
- *lattice points*: the number of `i` with `0 ≤ i j ≤ d j` and `∑ j, i j / d j ≤ t` lies between
  `V_m(t) ∏ d j` and `V_m(t) (1 + max 1 t⁻¹ ∑ j, 1 / d j) ^ m ∏ d j`, the upper bound for `t > 0`;
- *the tail*: `V_m((1/2 − ε) m) ≤ exp (−6 m ε²)` for `0 ≤ ε`;
- *the multihomogeneous tail*: for `1 ≤ n` and `0 ≤ η`, the proportion of exponent tuples `J` of
  multidegree `(d_1, …, d_m)` in `m` blocks of `n + 1` variables with
  `∑ h, J h i / d h ≤ m / (n + 1) − m η` for a fixed `i` is, in the limit, less than
  `exp (−(n + 1)(n + 2) η² m / 4)`, stated against the normalized density
  `n (1 − x) ^ (n − 1)` of one simplex coordinate together with the lattice-point comparison that
  makes it a count.
All three are one exponential-moment estimate, `MeasureTheory.setIntegral_prod_le_exp_mul_pow`:
for a nonnegative weight `g` on the line, `∫_{∑ x j ≤ s} ∏ j, g (x j) ≤ exp (λ s) (∫ exp (−λ x) g x) ^ m`,
decoupled by `MeasureTheory.integral_fintype_prod_volume_eq_pow`, applied at the indicator of
`[0, 1]` and at the Beta density. The book's restrictions `ε ≤ 1/2`, `0 < λ ≤ n + 4` and
`η ≤ 2 / (n + 1)` are artefacts of its truncated alternating series and are not hypotheses:
`exp (−u) ≤ 1 − u + u² / 2` for every `u ≥ 0` gives the three terms the book keeps. The uniform
weight needs `Real.sinh_le_mul_exp_sq_div_six`, `sinh u ≤ u exp (u² / 6)`, from `6 ^ k k! ≤ (2k + 1)!`,
sharp at `k = 1`, which is where the `6` comes from. The lattice-point bounds are one covering by
half-open boxes `∏ j, [i j / d j, (i j + 1) / d j)`, the upper one through
`Measure.addHaar_smul` on `(1 + ρ) 𝒱_m(t)`; at `t = 0` the origin is an admissible point and
`V_m(0) = 0`, so `t > 0` is load-bearing there. Also `0 < V_m(t)` for `t > 0`, `V_m(t) = 1` for
`t ≥ m`, `V_m(t) = 0` for `t < 0`, and `V_1(t) = min 1 t` for `t ≥ 0`, which pins the
normalization. State all
of it in a file that imports no number theory. DAT §1.5's count of the `d` with
`∑ d i / r i ≤ (n/2)(1 − ε)` is the shape Roth over `ℚ` uses; what 2.2 and 5.2 need is the
volume form with the book's constants.

**2.2 The auxiliary polynomial** (Bombieri–Gubler, Lemma 6.3.4). Let `F/K` be a finite extension
of number fields of degree `r`, let `α k : Fin m → F` for `k : Fin N` be points, and let
`t k > 0` with `r ∑ k, V_m(t k) < 1`. For every `δ > 0` there is `D₀` such that for all
`d : Fin m → ℕ` with `D₀ ≤ d j` there is a nonzero `P : MvPolynomial (Fin m) K` with
`degreeOf j P ≤ d j`, `weightedIndex d (α k) P ≥ t k` for every `k`, and
`P.logHeight ≤ r / (1 − r ∑ k, V_m(t k)) · ∑ k, ∑ j, V_m(t k) (logHeight₁ (α k j) / r + [K : ℚ] log 2 + δ) d j`
in relative logarithmic heights, `P` over `K` and `α k j` over `F`
(`MvPolynomial.exists_ne_zero_le_weightedIndex_logHeight_le`). This is the book's bound in absolute
heights multiplied by `[K : ℚ]`: the relative height of `P` is `[K : ℚ]` times the absolute one,
that of `α k j` is `[F : ℚ] = r [K : ℚ]` times it, and the `log 2` becomes `[K : ℚ] log 2`. The
factor on `log 2` is load-bearing and no `δ` absorbs its absence: at `F = K = ℚ(2 ^ (1/256))`,
`m = N = 1`, `α = 1`, `t = 1/2`, `δ = log 2`, the bound with `log 2` in place of `[K : ℚ] log 2`
asks for `P.logHeight ≤ 2 D log 2` at multiplicity `D / 2` at `1`, while Jensen's formula at each
of the `256` embeddings gives `P.logHeight ≥ (32 log 2 / (e π)) D − 256 log (D + 1)`.
This is the `ε`–`D₀` reading of the book's `o(1)`, and every application lets `d j → ∞` with `m`
fixed. Route: DAT's relative Siegel lemma `siegelRelativeKernelBasis` applied on the **box** of
bounded partial degrees `∀ j, Fin (d j + 1)`, through a dictionary `MvPolynomial.ofBox` between
coefficient vectors and polynomials, whose cardinality `∏ j, (d j + 1)` is then free; the
conditions are the vanishing of `hasseDeriv μ P` at `α k` for `∑ j, μ j / d j < t k`
(`MvPolynomial.hasseDeriv_eq_zero_of_lt` says an order leaving the box carries no condition),
counted by 2.1; a condition row is the multiplication table
`(∏ j, (I j).choose (μ j)) ∏ j, α j ^ (I j − μ j)`, whose height is a product of one-variable heights
exactly by `Height.mulHeight_fun_prod_eq`, with the tuple of powers `α ^ k, k ≤ d`, of height
`mulHeight₁ α ^ d` exactly (`NumberField.mulHeight_pow_range`), and the single estimate
`(I j).choose (μ j) ≤ 2 ^ d j` is the `[K : ℚ] log 2`: the condition rows have entries in `F`,
whose relative heights enter divided by `r` as that of `α k j` does, and an integer `n` has
relative height `n ^ [F : ℚ]` over `F`. The `δ` pays for three quantities of three orders,
all `o(∑ j, d j)`: the lattice-point correction `(1 + ρ) ^ m − 1 = O(m² / D₀)`, the `√M` by which
the Arakelov normalization of Siegel's lemma exceeds the sup-norm one, and the discriminant of
`K`. Rejection tests: with no variables `V₀(t) = 1` forces `N = 0`, since a nonzero constant has
index `0`; and `r S < 1` does not imply `r (1 + ε) S < 1`, so `ε` is chosen before `D₀`. Also the
one-input transport from local factors to the height, `Height.mulHeight_le_pow_totalWeight`: a
tuple whose local factors are at most a constant at the archimedean absolute values and at most
`1` at the others has height at most the constant to the `totalWeight`. DAT §1.5's auxiliary
polynomial for one algebraic `α` over `ℤ` is the shape `K = ℚ`, `N = 1`, and is not restated.

### Layer 3: Roth's theorem

**3.1 Approximation classes** (Bombieri–Gubler 6.4.2–6.4.4). For a finite index set `A` and a
family of maps `φ a : X → [0, 1]` with `∑ a, φ a x ≤ 1`, the partition of `X` by the cell of side
`1 / N` containing `(φ a x)_a`: `Set.cellIndex`; the count of labels,
`Set.ncard_setOf_sum_le = (N + |A|).choose |A|`, an equality, since adding one coordinate for
`N − ∑ a, c a` turns the labels into the tuples on `Option A` that sum to `N`
(`Finset.card_finsuppAntidiag_nat_eq_choose`); the bound `Set.ncard_image_cellIndex_le` on the
nonempty cells; and `Set.Infinite.exists_cellIndex_eq`, that an infinite `X` has an infinite cell
for every `N`. The book's (6.9), which the consumers quote: for `f : A → (0, 1]` with
`Λ = ∏ b, f b < 1`, the cell traps every coordinate,
`Λ ^ ((c a + 1) / N) < f a ≤ Λ ^ (c a / N)` (`Real.le_rpow_cellIndex_div`,
`Real.rpow_cellIndex_add_one_div_lt`), the upper half attained. Without `∑ φ ≤ 1` the labels are
the `(N + 1) ^ |A|` cells of the cube, four against three at `N = 1`, `|A| = 2`. With it:
`(L, M)`-**independent** sequences, `NumberField.IsHeightIndependent L M β` meaning
`logHeight₁ (β 0) ≥ L` and `logHeight₁ (β (j + 1)) ≥ M logHeight₁ (β j)`, exist inside every
infinite subset of `K` by Northcott (`NumberField.exists_isHeightIndependent`), with distinct
terms for `1 < M`, `0 < L`; and the two reductions together,
`NumberField.exists_cellIndex_eq_and_isHeightIndependent`. Over a number field the index set is
the disjoint union `↥Sinf ⊕ ↥Sfin` of the two typed finsets, with `NumberField.sPlaceAbsValue`
and `NumberField.sPlaceWeight` reading off the absolute value and the weight `mult`. The
milestone is stated abstractly because 3.2 and 3.6 use it for different families `φ`, and 5.1
does not use it at all (its classes are cells of a cube).

**3.2 Roth's theorem** (Bombieri–Gubler, Theorem 6.4.1; Roth 1955; Ridout 1958; Lang). Let `F/K`
be a finite extension, `S∞` and `S₀` finite sets of places of `K`, `w v` an absolute value of `F`
over `v` and `α v ∈ F` for each `v` in them, and `κ > 2`. Then the set of `β ∈ K` with

```text
(∏ v ∈ S∞, min 1 (w v (β − α v)) ^ v.mult) * ∏ v ∈ S₀, min 1 (w v (β − α v))  ≤  mulHeight₁ β ^ (−κ)
```

is finite: `NumberField.finite_setOf_prod_min_one_le`, the book's statement raised to the power
`d`. Prove it as the constant case of a theorem about chains, the core of Roth's proof:
`NumberField.roth_no_moving_chain`. With `ε = NumberField.rothEps κ`,
`N = NumberField.rothClassSize κ |S|`, `m = NumberField.rothChainLength κ |S| [F : K]` and
`M = NumberField.rothRatio κ |S| [F : K]`, definitions in `κ`, `|S|` and `[F : K]` alone, there is
`δ > 0`, depending on `K`, `S`, `[F : ℚ]` and `κ` and on no target, such that no `(L, M)`-independent
chain of `m + 1` solutions in one approximation class, each member `β j` a solution for its own
targets `α j`, has `1 + ∑ v, absLogHeight₁ (α j v) ≤ δ absLogHeight₁ (β j)` throughout. Its
constant-target case is `NumberField.roth_no_chain`, and Roth's theorem is that fed by 3.1's
reduction. Route, Steps 0–V of 6.4.2–6.4.10: discard the finitely many `β` of height at most `1`
(Northcott) and the at most `|S|` values equal to a target; classify the rest by the profile
`log Λ_v(β) / log Λ(β)` (3.1) with `N` chosen so `|S| / N` is small; take `m` with
`[F : K] |S| exp (−6 m ε²) < 1/2` and an `(L, M)`-independent `(m + 1)`-tuple in one class; build
`P` by 2.2 at the target points `(α 0 v, …, α m v)` with `d j = ⌈D / h(β j)⌉` (Steps I, II,
`NumberField.exists_auxiliary_deriv`); find by Roth's lemma
(`TauCeti.weightedIndex_le_of_logHeight_le`) a derivative `Q` of `P` of small
weighted order with `Q(β) ≠ 0`; bound `Q(β)` above at each place of `S` by the Taylor expansion at
the target point (`eval_add_eq_finsum_hasseDeriv`, with the size of a target bounded by its height
through 0.1), below by the product formula, and compare
(`NumberField.roth_key_inequality`, Steps III–V). **Step IV is the product formula over all the
places against local upper bounds at every place**, `NumberField.one_le_of_forall_apply_le_sum`,
and not the fundamental inequality of 0.4 over `S`: the local bound on `|Q(β)|_v` carries the
local factor of the coefficients of `Q`, whose product over `S` alone is not bounded by `h(Q)`,
and charging `h(Q)` twice proves the theorem only for `κ > 4`. `κ > 2` is used exactly once, as
`1 / κ < 1/2`, leaving room for the two losses `4 ε` and `|S| / N`; the contradiction is
`κ (1 − |S| / N)(1/2 − 4 ε) > 1`. Nothing tends to infinity: every error term is `O(D / L)` except
`([K : ℚ] + 2 ∑ w_v) log (D + 2)` from the `∏ j, (d j + 1)` monomials of the box, and
`Real.exists_le_and_mul_log_add_lt` produces one explicit `D`. The book's Theorem 6.2.3, with
targets in the completions, is this theorem and not a different one, by 0.1. Beside it, the local
bounds on the value of a polynomial at one absolute value, trivially and through the Taylor
expansion (`MvPolynomial.apply_eval_le`, with a constant depending on the height and not on the
polynomial, which varies with `D`), and their translation into the base field along
`AbsoluteValue.LiesOver`.

**3.3 The forms applications quote.** Each is 3.2 for a choice of data, and each is stated.
*Targets at infinity* (6.2.5): `AbsoluteValue.onePointApprox w β t` for `t : OnePoint F`, equal to
`min 1 (w (β − t))` at a finite target and `(max 1 (w β))⁻¹` at `∞`; 3.2 with targets in
`OnePoint F`, `NumberField.finite_setOf_prod_onePointApprox_le`, and the form with a constant in
front of the height, `NumberField.finite_setOf_prod_onePointApprox_le_const`, which every later
form consumes. Route: the Möbius change of variable `β ↦ (β − c)⁻¹` with a base point `c ∈ K`
avoiding every finite target (inverting alone exchanges `0` and `∞`), whose distortion at each
place is bounded (`AbsoluteValue.min_one_sub_onePointMobius_le`) and absorbed by lowering `κ` to
some `κ₁ ∈ (2, κ)` and collecting the finitely many solutions of small height by Northcott. *The
dictionary between the finite places of `ℚ` and `padicNorm`*: `Rat.exists_prime_padic_eq`, every
`v : FinitePlace ℚ` is `padicNorm p` for a prime `p`, with exponent exactly `1`, and conversely.
Mathlib's Ostrowski gives only a power; the exponent is pinned by a height computation,
`mulHeight₁ p⁻¹ = p` with infinite part `1` and Ostrowski at every finite place at once, and
Tau Ceti's `Rat.AbsoluteValue.IsStandard` with `AbsoluteValue.IsEquiv.eq_of_isStandard` is the
companion. A power `≠ 1` would turn Ridout's `2 + ε` into `(2 + ε) / t`. *The real-place
statement over `ℚ`* with the naive height, `Real.finite_setOf_min_one_abs_sub_le`, and **Roth's
theorem as a value**, `Real.irrationalityExponent_eq_two`: `irrationalityExponent α = 2` for every
real algebraic irrational `α`, the value Layer 1 leaves between `2` and `D`, and the first
acceptance test with `α = 2 ^ (1/3)`. *Ridout*, `Rat.finite_setOf_ridout`: for real algebraic `α`,
finite sets of primes `S₁`, `S₂` and `ε > 0`, finitely many `p/q` in lowest terms with
`|α − p/q| · ∏_{ℓ ∈ S₁} |p|_ℓ · ∏_{ℓ ∈ S₂} |q|_ℓ ≤ max(|p|, |q|) ^ (−2 − ε)`, with target `0` at `S₁`
and `∞` at `S₂`, the solutions split into `2 ^ |S₁ ∩ S₂|` classes by which of `p`, `q` a prime of
`S₁ ∩ S₂` divides, and the workhorse `Rat.finite_setOf_onePointApprox_mul_prod_le`, one target at
the infinite place of `ℚ` and one at each prime of a finite set. *`p`-adic* (6.2.6),
`Rat.finite_setOf_apply_intCast_sub_le`: for `α` in a number field `F`, `w` over
`Rat.AbsoluteValue.padic p` and `ε > 0`, finitely many `n ∈ ℤ` with `w (α − n) ≤ |n| ^ (−1 − ε)`;
the exponent `1 + ε` comes from the target `∞` at the infinite place, where an integer has local
factor exactly `H(n)⁻¹`. DAT §1.6's Roth theorem
(`IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`) and §2.3's `p`-adic Roth are the
instances: the milestone specializes to the first and discharges the second. Rejection tests:
Roth's theorem is false at `κ = 2` (Dirichlet at `√2 − 1`, where every approximation in Mathlib's
infinite Dirichlet set has naive height its denominator), false at `κ = 0`, and the `p`-adic form
is false at `ε = 0`
(the powers of `p`).

**3.4 Roth's theorem on the projective line** (Bombieri–Gubler, Example 7.2.7). Define the
central quantity `NumberField.approxProd` of the conventions table, and prove
`NumberField.approxProd_smul`, its invariance under `x ↦ c • x`, from the `LiesOver` hypotheses;
`NumberField.approxProd_le_approxProd_of_subset`, monotonicity under enlarging the places when
the added places carry the coordinate forms, whose local factor is at most `1`
(`NumberField.prod_proj_div_iSup_le_one`); and its multiplicativity in `S`. Then, for
`Fintype.card ι = 2`, two linearly independent forms at each place and `ε > 0`, the Subspace
Theorem of 6.3: finitely many proper subspaces of `K²` contain every `x ≠ 0` with
`approxProd … x ≤ mulHeight x ^ (−2 − ε)`
(`NumberField.exists_finset_submodule_of_approxProd_le_card_two`), proved from 3.3: at each place a
solution is close to the zero `AbsoluteValue.formRoot` of at most one of the two forms, a point of
`OnePoint F`, so the solutions split into `2 ^ |S|` sets by a choice function extended off `S`
twice with `Function.extend` (which composes only because of `val_ne_finitePlace_val`), and on
each set `approxProd` is comparable to the left side of 3.3 at `β = x 1 / x 0` by Cramer's rule
read at one absolute value, `|det| · max(1, |β|) ≤ (∑ |coefficients|) · max_i |L_i|`, with a
constant growing with the target. Conversely 3.2 is this statement for `L v 0 = X 0`,
`L v 1 = X 1 − α v X 0` (`NumberField.finite_setOf_prod_min_one_le_of_subspace`, taking the
subspace statement as a hypothesis), and the roundtrip
`NumberField.finite_setOf_prod_min_one_le_card_two`. ⚠ The conclusion is "finitely many points of
`ℙ¹(K)`", never "finitely many `β ∈ K`": for the coordinate forms, `(0, 1)` makes one factor of
`approxProd` vanish and is a solution for every `ε` on no line `K ⬝ (1, β)`. State the milestone
for an arbitrary index type with two elements, never `Fin 2`, so that 6.6 is an equation between
theorems. This is the interface 8.1, 8.3, 8.4 and 8.5 would consume if Layers 4–6 were absent, and
the file where `approxProd` lives.

**3.5 Mahler's theorem on `(p/q)^k`** (Mahler 1957; Bombieri–Gubler 6.2.7). For coprime integers
`p > q ≥ 2` and `ε > 0`, the distance from `(p/q)^k` to the nearest integer exceeds `exp (−ε k)`
for all but finitely many `k` (`Nat.eventually_exp_neg_lt_abs_sub_round`), and only finitely many
`k` admit any integer within `exp (−ε k)` of `(p/q)^k`
(`Nat.finite_setOf_exists_int_abs_sub_ratPow_le`). Route: Ridout's theorem with `S₁` the primes
of `q`, `S₂` the primes of `p` and the target `1` at the infinite place, applied to
`β = N q^k / p^k` with `N` the nearest integer, in this orientation so that the denominator of `β`
divides `p^k` and the product over the primes of `p` is `1 / β.den` exactly. The arithmetic input
is `Nat.primesOf`, the primes of an integer as a `Finset Nat.Primes`, and
`Rat.prod_padicNorm_natCast`: the product of `|n|_ℓ` over the primes of `n` is `1 / n` exactly,
and over a set missing a prime factor it is too large. The exceptional set is nonempty (`k = 0`),
so the conclusion is `∀ᶠ`; `q ≥ 2` and coprimality are both load-bearing, at `(3, 1)` and `(4, 2)`.
This is the acceptance test of 3.3's finite places: without them the left side of Ridout's
inequality is smaller by `p ^ (−2k)` and no `ε` works.

**3.6 Counting approximations** (Bombieri–Gubler, Theorem 6.5.4, Lemma 6.5.6, 6.5.7; Davenport
and Roth 1955). *The strong gap principle*
(`NumberField.mul_absLogHeight₁_sub_le_of_approxClass_eq`): if `β ≠ β'` are solutions of 3.2 in
one approximation class `NumberField.approxClass` of size `1 / N` with `h(β) ≤ h(β')`, then
`h(β') ≥ ((1 − |S| / N) κ − 1) h(β) − log 4`, in absolute logarithmic heights, from 0.4 against the
triangle inequality; a solution equal to a target sits in the corner `N e_v` of the simplex, where
(6.9) and (6.10) still hold, so no place of `S` has to be discarded. *The count in a window*
(`NumberField.ncard_setOf_absLogHeight₁_mem_Ioc_le`): with `c = (1 − |S| / N) κ − 1 > 1`, at most
`⌈log A / log ((c + 1) / 2)⌉ · (N + |S|).choose |S|` solutions have `h(β) ∈ (X, A X]`, for
`X ≥ log 16 / (c − 1)` (the book writes `>` and applies it at equality). *The count of large
solutions* (`NumberField.ncard_setOf_lt_absLogHeight₁_le`): the solutions with `h(β) > L` number at
most `NumberField.rothLargeCount κ |S| [F : K] = m ⌈log M / log ((c + 1) / 2)⌉ (N + |S|).choose |S|`,
from `roth_no_chain` and a greedy grouping (`Finset.card_le_mul_of_not_exists_chain`, a finite set
with small blocks and no chain of `m + 1` points); and `NumberField.ncard_setOf_rothGapHeight_lt_absLogHeight₁_le`,
every solution above `NumberField.rothGapHeight κ |S| = log 16 / (c − 1)` counted by
`NumberField.rothTotalCount κ |S| [F : K] [F : ℚ] Ht`, `Ht` bounding `∑ v, h(α v)`, which is
`O(log (1 + Ht))`, Davenport and Roth's `c₁ + c₂ log log H(α)`. ⚠ A bound on the **number** of
solutions and no bound on their height. *The interval form*
(`NumberField.exists_forall_mem_interval_of_prod_min_one_le`): above a threshold `L' ≥ L`, the
solutions have absolute height `mulHeight₁ β ^ (1 / [K : ℚ])` in at most `m (N + |S|).choose |S|`
intervals `[Q, Q ^ M)` with `Q > exp L'`, by the greedy grouping with its starting points kept
(`Finset.exists_subset_card_le_of_not_exists_chain`) and no gap principle; with targets in
`OnePoint F` and a constant it holds in logarithmic heights with windows `[t − e, M t + e)` at
Roth's parameters for `(κ + 2) / 2` (`NumberField.exists_forall_mem_interval_of_prod_onePointApprox_le`).
*The link into 9.4* (`NumberField.exists_finset_submodule_of_card_eq_two`): for a normalized
system of 9.1 in two variables, the solutions above the explicit height
`NumberField.systemRothThreshold s r [F : ℚ] [K : ℚ] δ H` lie in at most
`s + 1 + m (N + s).choose s · (1 + log (3 r s M) / log (1 + δ / 4))` proper subspaces, `s` the
number of places of the system and `r = [F : K]`, Roth's parameters at `2 + δ / 2`: the system is
Roth's inequality at its small forms with `β = x₁ / x₀`; the affine height of a solution is at
most `C H(β) ^ (r s)` by Liouville's inequality at one place; the windows become windows
`[Q, Q ^ (3 r s M))` of the affine height and 9.4 covers them; the `s` lines where a small form
vanishes and the line `x₀ = 0` are counted apart. The threshold is `O_{δ, s, r}(log H + 1)` in the
coefficient bound `H`; the count is Roth's, not Evertse's. Two combinatorial lemmas know no
heights: `Set.ncard_le_ceil_mul_ncard_of_gap` (points with a multiplicative gap in a window) and
the chain lemmas above.

**3.7 Moving targets** (Vojta; Bombieri–Gubler, Theorem 6.5.2). For a sequence of pairs
`(α j, β j)` with `α j : S → F`, `β j ∈ K` and `1 + ∑ v, h(α j v) = o(h(β j))` along `atTop`
(`Asymptotics.IsLittleO`, absolute heights), only finitely many `j` have `β j` a solution of 3.2's
inequality with targets `α j` (`NumberField.finite_setOf_prod_min_one_le_of_isLittleO`), and no
infinite sequence consists of solutions (`NumberField.not_forall_prod_min_one_le_of_isLittleO`).
The proof is five lines on `roth_no_moving_chain`: the `o` supplies the `δ`, and Mahler's
reduction, run on the indices with each pair classified at its own targets, supplies the chain.
The targets enter Roth's proof twice, in the height of the auxiliary polynomial and in the Taylor
expansion at a place of `S`, where `log⁺ |α_v|_w` is bounded by the height of the target through
0.1's `max (w x) 1 ≤ mulHeight₁ x`. The conclusion counts indices, since a sequence may repeat a
pair; the `1 +` is load-bearing (the constant pair `(0, 0)` over `ℚ`), and `o` cannot be weakened
to `O` (the constant pair `(2, 2)`). Conformance test: constant targets give 3.2 back.

### Layer 4: parallelepipeds over a number field

Schmidt's proof is geometry of numbers applied to a family of parallelepipeds. Bombieri–Gubler
work in the adèles (7.5.6 and Appendix C.2); this layer works in SM's real formulation, a
`ZLattice` in a real vector space together with a convex body, for forms whose coefficients lie in
`K`. Neither choice costs anything: 6.3 removes the restriction on the coefficients by the book's
Remark 7.2.3, and the adelic form of Minkowski's second theorem is recovered in 4.2 from the real
one. No adèle and no Haar measure on a local field appears. Throughout Layers 4 and 5 and in 6.1
the places are **all** the infinite places together with a finite `S₀`, because a domain with no
condition at an infinite place is unbounded there; 6.2 adds the missing infinite places first.

**4.1 Approximation domains** (Bombieri–Gubler 7.5.6, Lemma 7.5.7, Corollary 7.5.8). Fix forms
`L v i : Module.Dual K (ι → K)`, linearly independent for each infinite `v` and each `v ∈ S₀`,
exponents `c v i : ℝ` and a level `Q`. The **approximation domain**
`NumberField.approxDomain S₀ L c Q : Set (ι → K)` consists of the `x` with `v (L v i x) ≤ Q ^ c v i`
at every infinite place and every `v ∈ S₀`, for all `i`, and `v (x j) ≤ 1` at every finite place
outside `S₀`, for all `j`. Its **weight** `NumberField.approxWeight S₀ c` is
`∑ v : InfinitePlace K, v.mult * ∑ i, c v i + ∑ v ∈ S₀, ∑ i, c v i`, the exponent of `Q` in the
product of the local bounds (Bombieri–Gubler's `d ∑ c`, after their `Q` becomes `Q ^ d`), and its
**absolute weight** `NumberField.approxAbsWeight S₀ c` is the same sum taken over `|c v i|`.
Deliverables:
- *Structure*, `NumberField.approxDomain_eq`: the finite-place conditions cut out a full
  `𝓞 K`-submodule `NumberField.approxModule` of `ι → K`, the infinite-place conditions a compact
  convex symmetric body `NumberField.approxBody` in `ι → mixedSpace K`, and the domain is their
  intersection. The body is balanced over every completion: multiplying a point by an element of
  `mixedSpace K` of norm at most `1` at every place keeps it inside
  (`NumberField.mul_mem_approxBody`). The module is defined with `|Q|`, so it is a submodule for
  every real `Q`, and `approxDomain_eq` is stated for `0 ≤ Q`. Every statement that reads
  `Q ^ c v i` as a positive real, the value floors, the covolume, the volume and the comparison
  with `Q` below, and the interior of the body, assumes `0 < Q`. No statement carries
  `DecidableEq ι`: the coefficients of a form are its values at `Pi.basisFun K ι j`.
- *The value floor*, `NumberField.FinitePlace.floorValue v t`: the largest value of `v` on `Kˣ`
  that is at most `t > 0`. It exists because those values are the integer powers of the norm of
  the prime; with it, `v x ≤ t ↔ v x ≤ floorValue v t`.
- *Covolume*, `NumberField.covolume_approxLattice`: with `a v i = floorValue v (Q ^ c v i)`, the
  covolume of the image of `approxModule` in `ι → mixedSpace K` is
  `∏ v ∈ S₀, v (det (L v)) * ∏ i, (a v i)⁻¹` times the covolume of `(𝓞 K)^ι`.
- *Volume*, `NumberField.volume_approxBody`: the volume of `approxBody` is
  `2 ^ (r₁ · card ι) · π ^ (r₂ · card ι)` times
  `∏ v : InfinitePlace K, (v (det (L v))⁻¹ * ∏ i, Q ^ c v i) ^ v.mult`. Route: the body is the
  preimage of a product of closed balls under one `mixedSpace K`-linear map, whose real
  determinant is the algebra norm of `det L`, `∏ v, v (det L v) ^ v.mult`
  (`LinearMap.det_restrictScalars`); one change of variables, not one per place.
- *Comparison with `Q`*: `vol B / covol Λ` lies between `Q ^ approxWeight` times two constants
  depending only on `K`, `S₀`, `card ι` and the determinants, at most
  `NumberField.approxConst S₀ L` and at least that divided by `∏ v ∈ S₀, N 𝔭_v ^ card ι`
  (`NumberField.volume_div_covolume_le`, `NumberField.le_volume_div_covolume`).

⚠ The book states the finite-place factor as an equality in `Q ^ c v i`. It is an equality in the
floors `a v i` and only an inequality, up to `∏ v ∈ S₀, N 𝔭_v ^ card ι`, in `Q ^ c v i`, which
need not be a value of `v`. Check: at the `2`-adic place of `ℚ`, one variable, `L = id`, `c = 1`,
`Q = 3/2`, the module is `ℤ` with covolume `1`, against the book's `2/3`.

Three pieces of infrastructure sit beneath 4.1, each its own target.
- **Pseudo-bases** (`Submodule.exists_pseudoBasis`): a finitely generated `𝓞 K`-submodule of
  `ι → K` spanning it is `⊕ i, J i • y i` for a `K`-basis `y` and nonzero integral ideals `J i`.
  This is the structure theorem for finitely generated torsion-free modules over a Dedekind domain
  in the form a covolume computation needs.
- **The covolume of an `𝓞 K`-module** (`Submodule.covolume_mixedImage`): for a finitely
  generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, the covolume of its image under the mixed
  embedding is `(∏ᶠ v : FinitePlace K, B v)⁻¹ · covol (𝓞 K) ^ card ι`, where `B v` is the largest
  value of `v` on the determinants of `card ι` vectors of `Λ`. Route: from a pseudo-basis the
  covolume is `|N (det y)| · ∏ i, N (J i)` times `covol (𝓞 K) ^ card ι` (Mathlib's ideal
  lattices and one change of variables), and both norms are read place by place. For the
  approximation module, `B v` at a place of `S₀` is `v (det L v)⁻¹ ∏ i, a v i` by the
  ultrametric bound on a determinant, attained by `(L v)⁻¹` of a diagonal vector with entries of
  value `a v i`, moved into `Λ` by an algebraic integer that is a unit at `v`; off `S₀` it is `1`.
  No localization, Smith normal form or quotient index is needed, so the class group never
  enters.
- **The mixed image of an `𝓞 K`-module**, `Submodule.mixedImage Λ`, as a `ZLattice` in
  `ι → mixedSpace K` when `Λ` is finitely generated and spans, with its `DiscreteTopology` and
  `IsZLattice ℝ` instances: the bridge from `𝓞 K`-modules to SM's vocabulary.

**4.2 Successive minima over `K`** (Bombieri–Gubler, Definition C.2.9; Theorem C.2.11 in shape, with
the constants of SM 2.1.4 and of Tau Ceti's upper half of Minkowski's second theorem). For an
`𝓞 K`-module `Λ` and a body `B` as in 4.1, the `K`-minimum `NumberField.successiveMinimum Λ B l`,
indexed from `0` like `ZLattice.successiveMin`, is the infimum of the `t > 0` for which `Λ ∩ t • B`
contains `l + 1` vectors linearly independent over `K`, and `0` for `l ≥ card ι`. Statements take
`Λ` only through `[DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]`. Deliverables:
- *Attainment by one family*,
  `NumberField.exists_linearIndependent_mem_smul_successiveMinimum`: there are `card ι` vectors of
  `Λ`, linearly independent over `K`, the `l`-th in `successiveMinimum Λ B l • B`. Each minimum is
  attained because a dilate of a compact body holds finitely many lattice points; the single
  family is then assembled one vector at a time, since `l + 1` independent vectors realizing the
  `l`-th minimum include one outside the span of the `l` already chosen. Cassels's greedy
  construction with its minimality clause is not needed.
- *Comparison with the real minima*: with `λ` Tau Ceti's `ZLattice.successiveMin` of
  `Λ.mixedImage` and `B` (a lattice of rank `d · card ι`),
  `λ l ≤ μ l` (`NumberField.successiveMin_mixedImage_le`) and `μ l ≤ λ (d l)`
  (`NumberField.successiveMinimum_le_successiveMin_mixedImage`), the second by DAT §2.8's
  extraction lemma `exists_linearIndependent_comp_finrank_mul` applied to the `d (l + 1)` real
  witnesses; and `λ (d (l + 1) − 1) ≤ c_K · μ l`
  (`NumberField.successiveMin_mixedImage_le_mul`), where `c_K = NumberField.integralBasisHouse K`
  is the largest house of a member of a fixed integral basis `NumberField.reducedIntegralBasis K`,
  `1 ≤ c_K`: for `l + 1` vectors `x i` independent over `K` in `Λ ∩ t • B`, the `d (l + 1)`
  products `ω j • x i` lie in `Λ` (an `𝓞 K`-module), are independent over `ℝ`, and lie in
  `c_K t • B` because `B` is balanced over every completion. The lower bound is the only
  statement here that uses balancedness; over `ℚ`, `c_ℚ = 1`.
- *Minkowski's second theorem over `K`*, two-sided and multiplicative, for any Haar measure:

  ```text
  c_K ^ (−d·card ι) · 2 ^ (d·card ι) / (d·card ι)! · covol Λ  ≤  (∏ l, μ l) ^ d · vol B  ≤  2 ^ (d·card ι) · covol Λ
  ```

  (`NumberField.covolume_le_prod_successiveMinimum_pow_mul_measure`,
  `NumberField.prod_successiveMinimum_pow_mul_measure_le`), from SM's `minkowski_second_lower`,
  Tau Ceti's `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` and the
  comparison above. This is Bombieri–Vaaler and McFeat's adelic theorem in the generality the
  Subspace Theorem needs.
- *For an approximation domain*, combined with 4.1: `(∏ l, μ l) ^ d` is `Q ^ (−approxWeight)` up
  to two constants depending on `K`, `S₀`, `card ι` and the determinants
  (`NumberField.le_prod_successiveMinimum_approx`, `NumberField.prod_successiveMinimum_approx_le`).
  The lower bound, the one 4.3 uses, takes the half of 4.1's comparison that is lossless.

**4.3 The rank of an approximation domain** (Bombieri–Gubler, Definition 7.5.11, Lemma 7.5.12).
`NumberField.approxSpan S₀ L c Q`, written `V(Q)`, is the `K`-span of the domain. Deliverables:
- `NumberField.finrank_approxSpan`: `finrank K V(Q)` is the number of `l` with `μ l ≤ 1`, and
  `NumberField.approxSpan_eq_span_image`: `V(Q)` is spanned by the first `finrank K V(Q)` members
  of any family realizing the minima. Both are proved first for the points of any lattice in any
  closed bounded convex body balanced over the completions
  (`NumberField.finrank_span_setOf_mem`, `NumberField.span_setOf_mem_eq_span_image`). Note that
  the count is of minima `≤ 1`, not `< 1`: over `ℚ` with `c = 0` the domain is `{−1, 0, 1}` and its
  one minimum is exactly `1`.
- *Eventual properness*: if `approxWeight S₀ c < 0` then `finrank K V(Q) < card ι` for all large
  `Q` (`NumberField.eventually_finrank_approxSpan_lt`), stated also as `∀ᶠ Q in atTop, V(Q) ≠ ⊤`
  (`NumberField.eventually_approxSpan_ne_top`), the form 6.1 consumes. Route: 4.2's lower bound
  with every minimum replaced by the last gives `μ (card ι − 1) ^ (d · card ι) ≥ C · Q ^ (−weight)`
  (`NumberField.le_successiveMinimum_approx_pow`), which exceeds `1` eventually. The statement
  is eventual and not uniform: over `ℚ` with `S₀ = ∅` and the coordinate forms `L i = X i`, the
  domain at `Q = 1` contains the standard basis, so it has full rank whatever the exponents.
- *Bounded levels*: for `0 < Q₁ ≤ Q ≤ Q₂` every domain lies in the domain of the exponents `|c|`
  at level `max Q₂ Q₁⁻¹`, which holds finitely many points
  (`NumberField.finite_approxDomain`, `NumberField.finite_biUnion_approxDomain`), so a bounded
  range of levels produces finitely many subspaces `V(Q)`
  (`NumberField.finite_image_approxSpan`). `0 < Q₁` is needed: as `Q → 0` the bounds with negative
  exponent blow up.

Bombieri–Gubler's Lemma 7.5.12 states `1 ≤ rank ≤ n` along the heights of a hypothetical infinite
set of solutions; that is a statement about solutions, and its content about domains is the
eventual statement above. A domain can have rank `0` (over `ℚ` with `c = −1`, at every level above
`1`).

**4.4 Evertse's lemma** (Evertse 1996; Bombieri–Gubler, Lemma 7.5.29). It replaces Mahler's
theorem on compound bodies and Davenport's lemma in Schmidt's original argument (7.5.27–7.5.28),
neither of which is built.
- *Simultaneous approximation by `S₀`-integers* (`NumberField.exists_forall_apply_add_le`): there
  is `A`, depending only on `K`, such that for every family `γ v ∈ K` indexed by the infinite
  places and `S₀` some `ξ ∈ K`, integral at every finite place outside `S₀`, has
  `v (ξ + γ v) ≤ 1` at each `v ∈ S₀` and `v (ξ + γ v) ≤ A` at each infinite place. Route: at one
  finite place `v₀` with prime `𝔭`, choose an algebraic integer `s` that is a unit at `v₀` and
  clears the denominators of `γ v₀` at the other finite places, `a` with `a s ≡ 1 mod 𝔭`, and
  `p ∈ 𝔭` with `a s + p = 1`; then `−γ v₀ · s a ∑_{i < N} p ^ i` matches `−γ v₀` at `v₀` up to
  `γ v₀ · p ^ N` (`NumberField.FinitePlace.exists_apply_add_le_one`). Sum these over `S₀` and
  translate by an element of `𝓞 K` into a fundamental domain of `𝓞 K` in `mixedSpace K`, which
  disturbs no finite condition (`NumberField.exists_integer_forall_infinitePlace_add_le`, with `A`
  the sum of the norms of the embedded integral basis). No Chinese remainder theorem is used.
- *The lemma* (`NumberField.exists_evertse`): let `x` be a basis of `ι → K` indexed by
  `Fin (card ι)`, and at each infinite place and each `v ∈ S₀` let weights `ν v k > 0` and a
  nondecreasing `μ v` satisfy `v (L v k (x j)) ≤ ν v k · μ v j`. Then there are
  `y j = x j + ∑ i < j, ξ j i • x i` with each `ξ j i` integral outside `S₀`, and bijections
  `π v` of the index sets, such that
  `v (L v (π v i) (y j)) ≤ C · ν v (π v i) · min (μ v i) (μ v j)` at the infinite places and the
  same without `C` at the places of `S₀`, with `C` depending only on `K` and `card ι`. The
  unweighted statement `NumberField.exists_evertse_unweighted` is `ν = 1`. Route: Bombieri–Gubler's
  induction, run once for any field with a set of absolute values admitting simultaneous
  approximation by a subring (`AbsoluteValue.exists_evertse_of_approx`), a sum of `m` terms
  costing `m` at an archimedean place and `1` at a nonarchimedean one.

Three features are load-bearing. The constant is chosen before `S₀`, the forms and the vectors:
6.1 applies the lemma to forms rescaled by `Q`, which change with `Q`. The forms carry weights
because over `K` they cannot be rescaled: at a finite place `Q ^ (−c v i)` is in general not a
value of `v`, and rescaling would lose the factor `N 𝔭` that 4.1 found; 4.5 takes
`ν v i = Q ^ c v i`. And `μ v` must be nondecreasing, since the first vector is never corrected;
with that, no positivity of `μ v` is needed. The constant at the infinite places is not `1` even
over `ℚ`.

**4.5 Exterior powers of a system of forms** (Bombieri–Gubler 7.5.2, (7.16)–(7.17), Lemma 7.5.33,
7.5.30–7.5.31). Exterior powers are read in Plücker coordinates `Set.powersetCard p ι → K`, DAT
§2.5's `plucker`, so that 4.2, 4.3 and 5.5 apply to domains in `⋀^p` verbatim. For `1 ≤ p < card ι`:
- *Wedge forms* `exteriorPower.wedgeForms L p`, indexed by the `p`-subsets of the index set of
  the forms, with **Laplace's identity** `wedgeForms L p I (plucker y J) = det (L (I a) (y (J b)))`
  (`exteriorPower.wedgeForm_plucker`, from Cauchy–Binet,
  `TauCeti.det_mul_transpose_eq_sum_plucker_mul`), linearly independent
  when the `L i` are (`exteriorPower.linearIndependent_wedgeForms`), as are the Plücker vectors
  of the `p`-subsets of a basis (`exteriorPower.linearIndependent_plucker_comp`). The determinant
  of the wedge system (Sylvester–Franke) is not needed: the constants of 4.1–4.3 see the forms
  only through their determinants, and independence comes from a biorthogonal family.
- **Lemma 7.5.33** (`exteriorPower.wedgeSpan`): for a basis `x` and `k + p = card ι`, the span of
  the Plücker vectors of the `p`-subsets meeting `{0, …, k − 1}` depends only on the span of
  `x 0, …, x (k − 1)` and determines it (`exteriorPower.wedgeSpan_eq_wedgeSpan_iff`,
  `exteriorPower.mem_span_iff_forall_plucker_mem_wedgeSpan`). It is the kernel of the wedge of the
  last `p` coordinate forms of `x`, a hyperplane missing the top block
  (`exteriorPower.wedgeSpan_eq_ker`, `exteriorPower.plucker_topBlock_notMem_wedgeSpan`,
  `exteriorPower.finrank_wedgeSpan_add_one`). Route through the dual basis, with no pairing
  between `⋀^p` and `⋀^k`: if a coordinate form `f j₀` with `j₀ ≥ k` is nonzero on `u`, putting `u`
  in place of `x j₀` in the top block gives a wedge on which the kernel form is `f j₀ u`.
- **(7.44)–(7.45) in 7.5.30** (`NumberField.exists_plucker_mem_approxDomain_wedgeForms`): for
  vectors `x` realizing the `K`-minima `μ` of the domain of `L`, `c` at a level `Q > 1`, Evertse's
  lemma with `ν v i = Q ^ c v i` gives `y` and `π v` whose Plücker vectors `y J`, `J` meeting the
  first `k` indices, lie in the approximation domain of `wedgeForms` with exponents
  `NumberField.wedgeExponent` (the book's `S(Q)`), with a constant depending only on `K` and
  `card ι`. The constant is absorbed into the exponent, `c + Real.logb Q (C · μ)`, so `S(Q)` is an
  approximation domain whose exponents move with `Q` and 4.2–4.3 apply with constants uniform in
  `Q`; the book's normalization (7.42) disappears.
- *The weight of `S(Q)`*, exact: `Q ^ approxWeight (wedgeExponent …)` equals `Q ^ (e · weight)`
  times `(C ^ M · (∏ l, μ l) ^ e · μ (k − 1) / μ k) ^ d`, with `e = (card ι − 1).choose (p − 1)` and
  `M` the number of `p`-subsets (`NumberField.rpow_approxWeight_wedgeExponent`), since each index
  lies in `e` subsets and exactly one subset is the top block; hence it is at most a constant times
  `(μ (k − 1) / μ k) ^ d` (`NumberField.rpow_approxWeight_wedgeExponent_le`). This is what 6.1
  consumes. The book's packaged form, Lemma 7.5.31, all minima of `S(Q)` but the last at most `1`
  and the last at least a constant times `μ k / μ (k − 1)`, is
  `NumberField.exists_successiveMinimum_wedge`, with its consequence (7.41)
  (`NumberField.exists_div_pow_le_inv`: for rank `R` with `1 ≤ R < card ι` some `k ∈ [R, card ι)`
  has `(μ (k − 1) / μ k) ^ (card ι − R) ≤ (μ (card ι − 1))⁻¹`) and
  `NumberField.exists_successiveMinimum_wedge_pow`. Any large jump serves; `R ≥ 1` is needed.

### Layer 5: the Subspace machinery

Bombieri–Gubler's Theorem 7.5.13, the Subspace Theorem under the extra hypothesis that the
penultimate minimum is small, proved by the Roth machinery in multihomogeneous form. Coefficients
in `K` throughout, as in Layer 4. Statements that read a subspace through its Plücker
coordinates carry `[LinearOrder ι]`, as DAT §2.5's `plucker` does, and the height of a subspace is
DAT's `relativeSubspaceHeight`, in its logarithmic form.

**5.1 Reductions** (Bombieri–Gubler, Theorem 7.2.6, Lemma 7.5.4, Corollary 7.5.5, 7.5.6).
- *Projective to affine*: after enlarging `S₀` (0.3) every nonzero point has a primitive
  multiple, and the height of a primitive point is the product of its local sup norms over the
  infinite places and `S₀` (0.3's `NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`).
- *Unit normalization* (Lemma 7.5.4, `NumberField.exists_forall_logHeightAff_smul_le`): there is
  `C`, depending only on `K` and `S₀` and quantified before the index type, such that every
  primitive `x` has an `S₀`-unit multiple `u • x` with
  `log (Height.mulHeightAff (u • x)) ≤ logHeight x + C`. Route: HAU 4.3's `S`-logarithmic lattice
  is a full lattice in the sum-zero hyperplane, so the sum-zero vector with entries
  `(mult v / D) · logHeight x − mult v · log ⨆ j, v (x j)` (with `D` the total multiplicity of the
  places) is within a bounded distance of a lattice point
  (`NumberField.SUnit.exists_forall_abs_log_sub_le`), and summing positive parts gives the bound
  with every place handled at once and no coordinate singled out. The unit is load-bearing: over
  `ℚ` with `S₀` the `2`-adic place, the one-point tuples `(2 ^ k)` are primitive of projective
  height `1` and affine height `2 ^ k`.
- *Size of the forms at a normalized point* (Corollary 7.5.5): every nonzero value `L v i (u • x)`
  has `logHeight₁ ≤ logHeight x + C'` (`NumberField.exists_forall_logHeight₁_apply_smul_le`, from
  Tau Ceti's `mulHeight₁_sum_mul_le` against the affine height; no independence of the forms is
  used), hence by 0.4 at one place `mult v · |log (v (L v i (u • x)))| ≤ logHeight x + C'`
  (`NumberField.InfinitePlace.abs_mult_mul_log_le_logHeight₁` and its finite-place companion),
  and the book's (7.19), `≤ C'' · logHeight x`, for `logHeight x` at least a positive threshold.
  The threshold is needed: over `ℚ` with no finite places, `x = (1)` and `L = 2 X` have
  `logHeight x = 0` and `|log |L (u • x)|| = log 2` for both units `u`. The bound is sharp:
  `|log |2|₂| = log H(2)`.
- *Classes* (7.5.6, `NumberField.exists_finset_forall_exists_smul_mem_approxDomain`): above a level
  `Q₀`, every solution of 6.2's inequality at which no `L v i` vanishes has a normalized multiple
  in `approxDomain S₀ L c (mulHeight x)` for one of finitely many exponent systems `c`, each of
  weight at most `−ε/2`. The exponents `log v (L v i (u • x)) / log H(x)` have both signs, so the
  classes are the cells of side `1 / N` of the cube `[−2, 2]`, not 3.1's simplex cells, and their
  number is finite because they are functions on finitely many places with values in a finite
  grid. Solutions on a kernel of some `L v i` are left to 6.2, which puts them in that kernel.
- *The package* `NumberField.exists_forall_approxProd_le_imp`, which 6.2 consumes: the three
  steps together with the enlargement of `S₀` and the addition of the missing infinite places,
  both carrying the coordinate forms, whose local factor is at most `1` and which are independent
  (`NumberField.approxProd_le_approxProd_of_subset` from 3.4).

Acceptance tests: the unit example above; the height identity needs primitivity (over `ℚ` with
`S₀ = ∅`, `(2, 2)` has height `1` and sup-norm product `2`); (7.19) is attained.

**5.2 The multihomogeneous auxiliary polynomial** (Bombieri–Gubler 7.5.14, Lemma 7.5.15). For `m`
blocks of variables indexed by `κ × ι` and a multidegree `d : κ → ℕ`:
- `MvPolynomial.IsMultiHomogeneous d P`, with monomials `MvPolynomial.multiMons d`, the products
  over the blocks of the monomials of one degree, of cardinality
  `∏ h, (d h + card ι − 1).choose (card ι − 1)` (`MvPolynomial.card_multiMons`); and
  `IsMultiHomogeneous.hasseDeriv`: a Hasse derivative of order `I` is multihomogeneous of
  multidegree `d h − ∑ i, I (h, i)`.
- `MvPolynomial.blockSubst A`, the substitution `X (h, j) ↦ ∑ i, A j i • X (h, i)` applied to every
  block, and `MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero`: if the coefficients of
  `blockSubst A⁻¹ P` vanish at every monomial `N` with `∑ h, N (h, i) / d h` below a threshold,
  then the coefficients of `blockSubst A⁻¹ (hasseDeriv I P)` vanish at every `J` with
  `∑ h, J (h, i) / d h` below the threshold minus the weighted order of `I`. Route: induction on
  the order with `hasseDeriv_comp`; the expansion coefficients `a(L v; J; I)` of 7.5.14 are never
  written out. Characteristic zero is needed to invert the integer factor `hasseDeriv_comp`
  produces. The vanishing along one row depends on that row alone
  (`MvPolynomial.blockSubst_coeff_mem_of_row`), so the conditions are imposed once per distinct
  form (Evertse–Schlickewei), at most `card ι · |S|` of them.
- *The lemma*
  (`MvPolynomial.exists_ne_zero_isMultiHomogeneous_forall_coeff_blockSubst_hasseDeriv_eq_zero`):
  for `0 < η` and `4 log (2 · #F) < card ι · (card ι + 1) · η² · m`, with `F` the distinct forms,
  there are `C₂`, `C₃` and `D₀` such that for every `d` with `D₀ ≤ d h` for all `h` there is a
  nonzero multihomogeneous `P` of multidegree `d` with `logHeight P ≤ C₂ ∑ h, d h` and with the
  coefficients of `blockSubst (L v)⁻¹ (hasseDeriv I P)` at `J` zero, for every `v`, whenever the
  weighted order of `I` is at most `m η` and some `i` has `∑ h, J (h, i) / d h` outside
  `(m / card ι − 2 m η, m / card ι + 2 (card ι − 1) m η)`; their heights are at most `C₃ ∑ h, d h`.
  Route: DAT §2.8's Siegel lemma over `K` (`exists_ne_zero_height2_le` through
  `siegelCoefficientConditions`), with the conditions imposed at order `0` only and the omitted
  monomials counted by an exact exponential moment.
- *The count*: under the uniform distribution on the monomials of degree `N` in `card ι` variables,
  the mean of one exponent is `N / card ι` and the mean of its binomial square is
  `N (N − 1) / (card ι (card ι + 1))` (`Finset.sum_choose_two_monomials`, from an upper-index
  Vandermonde convolution), and `exp (−t) ≤ 1 − t + t² / 2` turns these into a Chernoff bound with
  one explicit error `λ² / (2 N card ι)`. This replaces the book's volume computation and its
  restriction `λ ≤ n + 4`; `d` must be large only to make the error small.

Four points of the statement are load-bearing. The upper half of the interval follows from the
lower half by multihomogeneity: the exponent sums total `m` minus the weighted order, so one large
exponent forces a small one among the other `card ι − 1`, which needs `Nontrivial ι`. The
hypothesis on `m` is strict, since the Chernoff error is positive for every `d`. The book's
`η ≤ 2 / (n + 1)` is not needed. `C₂` and `C₃` may depend on `m`, `S` and `η`, because 5.5 fixes `m`
first.

**5.3 The index along linear forms and the generalized Roth lemma** (Bombieri–Gubler, Definition
7.5.17, 7.5.18, Lemma 7.5.19).
- *Definition*: for nonzero forms `M h` on the `h`-th block, the ideal `MvPolynomial.formIdeal t d M`
  generated by the products `∏ h, (M h (X h)) ^ (j h)` with `∑ h, j h / d h ≥ t`, and
  `MvPolynomial.formIndex d M P = sup {t | P ∈ formIdeal t d M}`, valued in `ℝ≥0∞`.
- *Reduction to a weighted index*: choosing in each block a coordinate where `M h` is nonzero and
  solving `M h = X (h, i₀ h)` for it (`MvPolynomial.substForm`, `MvPolynomial.substFormInv`,
  mutually inverse substitutions written on the generators) turns `formIdeal` into a monomial
  ideal, so `formIndex` is Tau Ceti's `weightedIndex` in the new coordinates, with weight on the
  coordinates `i₀ h` only (`MvPolynomial.formIndex_eq_weightedIndex_substFormInv`). The
  valuation properties follow: `formIndex_eq_top_iff`, `le_formIndex_add`, `formIndex_mul`,
  `formIndex_smul`; and for two coordinates per block and `M h = X (h, 1) − α h • X (h, 0)` it is
  the weighted index of the dehomogenization at `α`
  (`MvPolynomial.formIndex_eq_weightedIndex_dehomogenize`, through Tau Ceti's `dehomogenize`).
  Multihomogeneity is what makes the dehomogenization injective on monomials: in one block, with
  `M = x₁`, the polynomial `x₁ + x₀² − x₀` has index `0` along `M`, while its dehomogenization at
  `x₀ = 1` is `t`, of index `1` at `0`.
- *Specialization*: setting all but two coordinates of each block to `0`, one variable at a time,
  by Mathlib's `MvPolynomial.divMonomial` and `MvPolynomial.modMonomial`, keeps `P` nonzero, does
  not raise its height (the result has a subfamily of its coefficients) and does not lower the
  index (`MvPolynomial.exists_elimination`). Each step truncates the forms with the variables
  (`MvPolynomial.evalZeroAt_substFormInv`). A single slice at the componentwise minimum fails:
  `X 1 + X 2` has no monomial where both exponents are minimal. The heights of the truncated forms
  lose at most a factor `card ι − 1`: `logHeight (M h) ≤ (card ι − 1) · logHeight₁` of some ratio
  of two coefficients (`Height.exists_logHeight_le_mul_logHeight₁_div`), by Mathlib's
  `Height.mulHeight_fun_prod_eq` applied to the table of products and `Height.mulHeight_comp_le`.
- *The generalized Roth lemma* (`MvPolynomial.formIndex_le_of_degree_ratio`): if `P` is nonzero
  and multihomogeneous of multidegree at most `d`, `0 < σ ≤ 1/2`, `d (h + 1) ≤ σ · d h`, and
  `(card ι − 1) σ⁻¹ (logHeight P + 4 m d 0 [K : ℚ]) ≤ d h · logHeight (M h)` for all `h`, then
  `formIndex d M P ≤ 2 m σ ^ ((1/2) ^ (m − 1))`: specialize, dehomogenize, and apply Roth's lemma,
  `TauCeti.weightedIndex_le_of_logHeight_le`.
- *From a small index to a nonvanishing derivative on a product of hyperplanes*
  (`MvPolynomial.exists_linSubst_hasseDeriv_ne_zero_of_formIndex_le`): if `formIndex d M P ≤ t`
  then some Hasse derivative of `P` of weighted order at most `t`, in the original coordinates,
  does not vanish identically on `∏ h, ker (M h)`. The change of coordinates is a block-wise linear
  substitution (`MvPolynomial.substFormInv_eq_linSubst`, through Tau Ceti's `linearSubst`), and a
  surviving coefficient moves between the two systems with the same degree in every block; the
  derivative order is the transverse part of the surviving monomial, whose binomial factor is `1`.
  Only `K` infinite is used.

**5.4 The height of `V(Q)` and the exceptional subspace** (Bombieri–Gubler, Lemma 7.5.21;
Evertse–Schlickewei 2002, Lemmas 12.3–12.4). For the domains of 4.1 with `c` of weight at most
`−ε/2` there are a subspace `W₀` (or none), depending only on the forms, `S₀` and `c`, and
constants `C₄`, `C₅`, `C₆` independent of `Q`, such that at every level with `log Q ≥ C₄ / ε` at
which `V(Q)` has dimension `card ι − 1`, either `V(Q) = W₀` or

```text
ε log Q / (4 t) − C₅  ≤  log (relativeSubspaceHeight V(Q))  ≤  (card ι − 1) · (∑ v, mult v · cMax v) · log Q + C₆ ,
```

with `t = card (InfinitePlace K) + #S₀` the number of places, counted without multiplicity
(`NumberField.exists_forall_logHeight_approxSpan`). Deliverables beneath it:
- *Liouville for the value of a linear form*: for tuples `a`, `z : σ → K` with
  `∑ s, a s * z s ≠ 0`, at an infinite place
  `((⨆ s, v (a s)) (⨆ s, v (z s))) ^ mult v ≤ (card σ) ^ [K : ℚ] · H(a) H(z) · v (∑ s, a s * z s) ^ mult v`
  and at a finite place the same without the exponent `mult v`, **with the same factor
  `(card σ) ^ [K : ℚ]`** (`NumberField.InfinitePlace.iSup_mul_iSup_pow_mult_le`,
  `NumberField.FinitePlace.iSup_mul_iSup_le`), by dividing by the value, which leaves the height
  unchanged by the product formula. The factor is the triangle inequality at the infinite places,
  which enters the height even when the place singled out is finite; it cannot be `1` there:
  over `ℚ` at the `2`-adic place, `a = z = (1, 1)` gives `1 ≤ |2|₂ = 1/2`. With it,
  the comparisons between a `finprod` over the finite places and a subproduct,
  `NumberField.prod_le_finprod_of_one_le` and `NumberField.finprod_le_prod_of_le_one_outside`.
  ⚠ The book bounds the height of a single wedge value `L̂_{vi}(w)` by `h(V(Q)) + C₇`; that is
  false, since the left side changes when `w` is rescaled: over `ℚ`, `w = (N, 0)` spans a line of
  height `1` and its first coordinate has height `|N|`. What the proof needs is the inequality
  above between a local factor of the Plücker point and its projective height; include the
  counterexample as an `example`.
- *The normal vector* (`Submodule.exists_normal`): a hyperplane is the kernel of one vector, and
  the Plücker coordinate of a basis at the subset omitting `i` (`Set.powersetCard.omitOne`)
  vanishes exactly when the `i`-th coordinate of that vector does; with
  `exteriorPower.plucker_pi_apply` (the Plücker coordinates of the transformed family are the
  wedge forms at the Plücker point) and the local bounds `exteriorPower.apply_plucker_le`. Two
  normal vectors of one hyperplane are proportional (`exists_smul_eq_of_forall_dotProduct_eq_zero`).
- *The two bounds*: the upper bound through the inverse of the system of forms at one place
  (`LinearMap.exists_inverse_forms`) and `NumberField.mulHeight_plucker_le_prod`, the height of an
  `S`-integral tuple at most the product of its local factors over `S`; the lower bound over all
  places of `S` (`NumberField.exists_pos_forall_prod_le`), against the upper bound on the same
  product from the domain (`NumberField.prod_apply_plucker_pi_le`). Constants are made uniform
  over a finite family by `Finset.exists_pos_forall_le`, hence independent of `Q`.
- *The exceptional subspace*: the **pattern** of `V(Q)` at a place is the set of `i` whose wedge
  omitting `i` does not vanish at the Plücker point; with `k v` its index of largest exponent, the
  dichotomy is whether the weight along `k`, `NumberField.weightAt`, is below `−ε/4`. In original
  coordinates the vanishing says the normal vector lies in the span of the coefficient vectors of
  the forms in the pattern (`NumberField.mem_span_vec_of_normal`), a condition independent of
  `Q`, so no Hodge star or cofactor appears. The threshold set `{i | c v i ≤ c v (k v)}` contains
  the pattern and depends on `k` alone (Evertse 1996, Lemma 27), so whether some `k` of weight
  below `−ε/4` admits a nonzero vector in its threshold span is independent of `Q`, and if so one
  such vector, scaled to be integral at every finite place (`NumberField.exists_smul_apply_le_one`),
  vanishes on every exceptional `V(Q)` by the product formula
  (`NumberField.one_le_mul_rpow_weightAt`). Hence at most one exceptional subspace
  (`NumberField.exists_forall_mem_of_weightAt_lt`), which removes a factor `2 ^ (card ι · t)` from
  5.5's count. Without the exceptional alternative the lower
  bound is false.

**5.5 The penultimate-minimum theorem** (Bombieri–Gubler, Theorem 7.5.13, Steps IV–VI). For forms
with coefficients in `K`, independent at every place, and `c` of weight at most `−ε/2`, the set
`{V(Q) | 1 ≤ Q, finrank K V(Q) = card ι − 1}` is finite: `NumberField.finite_setOf_approxSpan`.
Above a level every such `V(Q)` is 5.4's `W₀` (`NumberField.exists_forall_approxSpan_mem`); below,
5.4's upper bound, which holds at every level (`NumberField.logHeight_approxSpan_le`), and HAU
1.2's Northcott for subspaces leave finitely many.
- *The interval form* (`NumberField.exists_forall_mem_interval_approxSpan`): above a level, the
  levels at which `V(Q)` is a hyperplane other than `W₀` have `log Q` in at most `m` intervals
  `[q, 4 σ⁻¹ q)`, with explicit `m = NumberField.subspaceChainLength (card ι) s ε A` and
  `σ = NumberField.subspaceRatio (card ι) s ε A`, where `A` bounds `approxAbsWeight` and `s` is any
  natural number with `NumberField.formCount S₀ L ≤ card ι · s`, `formCount` being the number of
  distinct forms `L v i` over the infinite places and `S₀` (at most `card ι · t`,
  `NumberField.formCount_le`). The covering is the greedy one of 3.6
  (`Set.exists_forall_mem_Ico_of_not_exists_chain`). 6.1 needs one `A` for all its grid systems,
  so `m` and `σ` depend on `c` only through `A`; and **`m` and `σ` do not depend on the number of
  places `t`**, which enters only the threshold and the denominator of 5.4's lower bound. This is
  what makes 6.1's and 9.5's counts independent of the places: the same coordinate forms can be
  repeated at arbitrarily many finite places, so no bound on `t` in terms of the forms exists.
  The forms enter the chain length through 5.2, whose conditions are imposed once per distinct
  form.
- *The contradiction* (`NumberField.exists_forall_not_chain`, under `formCount S₀ L ≤ card ι · s`):
  no `m + 1` levels above a threshold, growing at rate `2 σ⁻¹`, all carry hyperplanes of height
  at least `ε log Q / (4 t) − C₅`. Given such a chain take
  `d h ≈ D / log Q h`, `P` from 5.2, `M h` the normal form of `V(Q h)`, whose height 5.4 bounds
  below. 5.3 bounds `formIndex d M P` by `(m + 1) η / 2` and produces a derivative of that weighted
  order not vanishing on `∏ h, V(Q h)`; DAT §2.6's block grid lemma
  `exists_nonzero_block_grid_jet_of_restriction`, on a basis of each `V(Q h)` drawn from the domain
  (`Submodule.exists_basis_subset`), produces a derivative of weighted order at most `(m + 1) η`
  nonzero at a point `∑ l, z h l • y h l` with integers `|z h l| ≤ ⌈2 (card ι − 1) / η⌉ + 1`.
  `NumberField.subspace_key_inequality` bounds that value above at every place (the inverse
  matrices of the forms and the grid integers charged to one reference family,
  `NumberField.refFamily`, with exponent `2 ∑ h, d h`) and below by the product formula over all
  places (`NumberField.one_le_of_forall_apply_le`, with every infinite place present), and letting
  `D → ∞` against fixed `m` closes it.
- *Two invariants*: besides `approxWeight`, the estimate needs `approxAbsWeight`, because the local
  bound is `Q ^ (mean · ∑ i, c v i)` only up to `Q ^ (Δ · ∑ i, |c v i|)`, with
  `mean = (m + 1) / card ι` and `Δ = 2 (card ι − 1)(m + 1) η`; `η` is chosen against it,
  `η ≤ ε / (8 card ι ² (approxAbsWeight + 1))`. 5.2's asymmetric interval enters only through the
  symmetric bound `|ρ j − mean| ≤ Δ`, which needs `Nontrivial ι`.

### Layer 6: the Subspace Theorem

**6.1 The parametric Subspace Theorem** (Bombieri–Gubler 7.5.30–7.5.32, Steps VIII and IX;
Evertse–Schlickewei for the formulation). For forms with coefficients in `K`, linearly
independent at every infinite place and every place of `S₀`, and exponents of negative weight,
there are a finite set `T` of proper subspaces of `ι → K` and a level `Q₀` such that
`approxDomain S₀ L c Q` lies in a member of `T` for every `Q ≥ Q₀`
(`NumberField.exists_finset_submodule_forall_approxDomain_subset`). This is the primary form,
because it is the one the quantitative theory counts: Layer 9 and every quantitative Subspace
Theorem in print bound the size of `T`. Bombieri–Gubler state it only along the heights of a
hypothetical sequence of solutions; their argument proves it for every level.

*The interval form* (`NumberField.exists_forall_mem_interval_approxDomain`): for
`approxWeight ≤ −ε` and `approxAbsWeight ≤ A` there are at most
`NumberField.parametricSubspaceCount` proper subspaces and a level `Q₀ > 0` such that for every
`Q₀' ≥ Q₀` a level `Q` with `log Q ≥ Q₀'` either has its domain in one of those subspaces or has
`log Q` in one of at most `NumberField.parametricIntervalCount` intervals `[t, ρ t)` with `t ≥ Q₀'`,
`ρ = NumberField.parametricRatio`, under `NumberField.formCount S₀ L ≤ s`. The counts and `ρ` are
closed forms in `card ι`, `[K : ℚ]`, `s`, `ε` and `A`, and do not depend on the number of places;
the number of subspaces does not depend on `s` either. The parametric theorem is read off it.

Route, at a level where the domain has rank `R < card ι` (4.3):
- `R = 0`: the domain spans `⊥`.
- *Confining the minima* (`NumberField.exists_pos_forall_rpow_le_successiveMinimum`,
  `NumberField.exists_pos_forall_rpow_le_successiveMinimum_le`): every `K`-minimum lies between
  `Q ^ (−B)` and `Q ^ B` with `B = card ι · (A + 1) / [K : ℚ]`. Minkowski's theorem bounds only the
  product; the lower bound on each minimum is the product formula (a nonzero point of `Λ ∩ t • B`
  has height at least `1` and at most a constant times `t ^ d` times a power of `Q`), and the upper
  bound is Minkowski's with the others replaced by the lower bound.
- *Minima at one infinite place* (`NumberField.exists_balance`; after Evertse–Schlickewei 2002,
  §9): each minimal vector is scaled by a nonzero integer, from Minkowski's first theorem for one
  scalar, so that its minimum moves to one infinite place `w₀` with `mult w₀ ∣ [K : ℚ]`. Evertse's
  lemma then has minima at `w₀` alone, and only one bijection matters. The cost is a constant
  `NumberField.unitConst K ^ card ι`, `unitConst K = 2 ^ [K : ℚ] · √|D_K|`, seen only by the
  thresholds.
- *The wedge domain*: (7.41) chooses `k ∈ [R, card ι)` with a large jump of the minima; with
  `k + p = card ι`, 4.4 and 4.5 move the Plücker vectors of the `p`-subsets meeting the first `k`
  minimal vectors into a domain of `wedgeForms` whose exponents `NumberField.wedgeExponentAt`
  move with `Q`. The case `R = card ι − 1` is `k = card ι − 1`, `p = 1`, the original domain
  re-indexed by one-element subsets, so 5.5 is used only through this construction and one
  mechanism covers every rank. A wedge form is the wedge of a `p`-tuple of forms, so
  `formCount S₀ (wedgeForms L p) ≤ formCount S₀ L ^ p` (`NumberField.formCount_wedgeForms_le`),
  and 5.5 runs in `⋀^p` with form parameter `s ^ p`.
- *The grid* (`NumberField.minimaGrid`, `NumberField.gridExponent`; Evertse 1996, Lemma 18): round
  the `card ι` minima, not the wedge exponents, to a grid of mesh `γ`. The constant rounds to `1`
  above a threshold, and the top block's jump is absorbed by rounding `μ (k − 1)` in place of
  `μ k` (`NumberField.minimaJump`). This gives at most `(card ι)! · (2 m + 1) ^ card ι` grid systems,
  `m = ⌈B / γ⌉`, independent of the number of infinite places
  (`NumberField.ncard_minimaGridSet_le`), all with one bound on `approxAbsWeight`
  (`NumberField.approxAbsWeight_gridExponent_le`); rounding each wedge entry separately would be
  doubly exponential in `card ι`. A system of exponents is a function on `AbsoluteValue K ℝ`, so
  the grid carries an integer per infinite place and per `p`-subset and nothing is rounded at the
  finite places, where the wedge exponent is exact. The rounding is a function of the level and its
  range is finite, so no pigeonhole or subsequence is taken and 3.1's cells are not used.
- *Finiteness in `⋀^p`*: the rounded system has negative weight; its domain has rank exactly
  `M − 1`, since the wedges span a hyperplane and 4.3 caps the rank; 5.5 in `⋀^p` makes these
  hyperplanes finitely many (`NumberField.exists_forall_mem_interval_approxSpan_le`, per `k`).
- *Back to `ι → K`*: `exteriorPower.recoverSpan p U`, the span of the vectors all of whose wedges
  lie in `U`, inverts `wedgeSpan` (`exteriorPower.recoverSpan_wedgeSpan`, Lemma 7.5.33 as a
  function on subspaces), and recovers the span of the first `k` minimal vectors, which contains
  `V(Q)` and is proper because `k < card ι`. `T` holds subspaces containing the `V(Q)`, not the
  `V(Q)` themselves.

**6.2 The Subspace Theorem, coefficients in `K`** (Schmidt 1972; Schlickewei 1977;
Bombieri–Gubler, Theorem 7.2.2 with `F = K`). For `[Nontrivial ι]`, forms
`L v i : Module.Dual K (ι → K)` linearly independent for each `v` in `Sinf` and `Sfin`, and
`ε > 0`, there is a finite set of proper subspaces of `ι → K` containing every `x ≠ 0` with
`approxProd Sinf Sfin L x ≤ mulHeight x ^ (−card ι − ε)`
(`NumberField.exists_finset_submodule_of_approxProd_le`, with the inclusion form
`NumberField.exists_finset_submodule_setOf_approxProd_le_subset`). Route, with no new
definition: 5.1's package, then 6.1 for each of its finitely many exponent systems (their levels
combined by one `max`, with no uniformity), the kernels of the forms for the solutions where a
form vanishes, and Tau Ceti's `Projectivization.instNorthcottMulHeight` for the solutions of small
height. Those are finitely many **projective** points, each contributing the line it spans; the
tuples of bounded height are never finite in number. A line is proper because `Nontrivial ι`; for
one-element `ι` the theorem is false. The normalizing scalars of 5.1 never have to be undone,
since a subspace is closed under scaling.

**6.3 Algebraic coefficients** (Bombieri–Gubler, Theorem 7.2.2 and Remark 7.2.3). The same with
`L v i : Module.Dual F (ι → F)` over a finite extension `F/K`, linearly independent over `F`,
measured by `w v` over `v`: the solutions `x : ι → K` lie in finitely many proper subspaces of
`ι → K` (`NumberField.exists_finset_submodule_of_approxProd_le_extension`, with
`…_extension_subset`). **This is the form consumers apply.** `F = K` is 6.2; `K = ℚ` is Schmidt's
theorem with algebraic coefficients at `∞` and at finite places, DAT §2.1's targets. Over `K` of
degree `> 1` the two differ on rational points: the height relative to `K` of a rational point is
its `[K : ℚ]`-th power, so 6.2 over `K` loses a factor `[K : ℚ]` in the exponent, and only 6.3 over
`ℚ` is sharp. Route:
- Pass to the Galois closure `F'` of `F/K` (0.1), and at each place of `F'` over `v` put the
  conjugate system `σ (L v)`, `σ` carrying the chosen absolute value to that place (0.2). Base
  change and conjugation are one operation, `Module.Dual.compRingHom f` for a ring hom `f`
  (`σ ∘ algebraMap`), with no semilinear map or tensor product; independence survives because
  the family is square and `RingHom.map_det` carries invertibility.
- `NumberField.approxProd_conjSystem` is an **identity**: a point of `ι → K` has the same local
  factor at every place above `v`, and the local degrees sum to `[F' : K]`, the factor by which the
  relative height grows (GNF's local extension formulas). At finite places the `e f`-th root of
  0.1's `AbsoluteValue.nonarchRpow` cancels against `NumberField.FinitePlace.sum_localDegree` as
  `mult` does at infinite places. Putting coordinate forms at the other places, 5.1's device,
  would weaken the inequality in the wrong direction.
- The system on `F'` is a function of an absolute value, defined by choosing for each absolute
  value a triple (place of `K`, place of `F'`, automorphism) in the right relation, and the place
  of `K` so chosen is proved to be the intended one by restricting to `K`.
- Apply 6.2 over `F'` and pull back: `W ∩ (ι → K)` is `(W.restrictScalars K).comap φ` for the
  inclusion `φ`, proper because otherwise `W` contains the standard basis.

**6.4 The affine form** (Bombieri–Gubler, Corollary 7.2.5 and Theorem 7.2.6). For
`S : Finset (HeightOneSpectrum (𝓞 K))`, forms as in 6.3 at every infinite place and every place
of `S`, and `ε > 0`: the `x ≠ 0` with coordinates in `S.integer K` and

```text
NumberField.affineProd S w L x
  = (∏ v : InfinitePlace K, (∏ i, w v (L v i x)) ^ v.mult) * ∏ v ∈ S, ∏ i, w v (L v i x)  ≤  mulHeight x ^ (−ε)
```

lie in finitely many proper subspaces
(`NumberField.exists_finset_submodule_of_integer_of_affineProd_le`, with the inclusion form).
**This is the form Layer 8 uses.** The passage is one identity,
`NumberField.affineProd_eq_approxProd_mul`: dropping the local denominators multiplies by the part
of the height carried by the infinite places and `S`, once per form. Forwards
(`NumberField.approxProd_le_of_affineProd_le`) an `S`-integral point needs only 0.3's inequality
between the height and its `S`-part, since at an `S`-integral point the affine inequality is the
stronger one. Backwards (`NumberField.exists_finset_forall_exists_smul_affineProd_le`) a solution
of 6.3 must be scaled to an `S`-primitive point, for which 0.3 makes the two equal, after enlarging
`S` (0.3), completing the infinite places with coordinate forms (5.1) and extending `w` to the
added places (0.1); the converse therefore returns a new family of absolute values and a multiple
of the point. The affine form indexes finite places by height-one primes and the projective form
by `FinitePlace`; the translation is `FinitePlace.mk`, whose injectivity
`NumberField.FinitePlace.mk_injective` is owned here.

**6.5 General position** (Vojta 1987; Bombieri–Gubler, Definition 7.2.8, Theorem 7.2.9). A family
of forms is in **general position**, `Module.Dual.IsGeneralPosition`, if every subfamily of at
most `card ι` members is linearly independent; for families of at least `card ι` members it is
DAT §2.1's `InGeneralPosition` of the coefficient vectors
(`Module.Dual.isGeneralPosition_iff_inGeneralPosition`), and the at-most form is used so that
small families need no separate hypothesis. For
`L : AbsoluteValue K ℝ → κ → Module.Dual F (ι → F)` with `[Finite κ]` and
`B : AbsoluteValue K ℝ → Finset κ`, each `L v` in general position on `B v`, the solutions of

```text
NumberField.generalProd Sinf Sfin w B L x  ≤  mulHeight x ^ (−card ι − ε),
```

the product of 6.3 over all of `B v` instead of a basis, lie in finitely many proper subspaces
(`NumberField.exists_finset_submodule_of_generalProd_le`, with the inclusion form). One carrier
type `κ` with a finset per place, not a family of index types, makes the chosen systems one finite
type. Route: at a place with at least `card ι` forms keep the `card ι` smallest values; their forms
are a basis, which bounds the local sup norm by the largest of them, so each discarded value is at
least the sup norm over a constant. At a place with fewer forms, complete to a basis by coordinate
forms, at no cost (`Module.Dual.exists_index_extendProj`, Mathlib's `Basis.extendLe`); the two cases
cannot be merged, since the extended family need not be in general position. Then 6.3 at `ε / 2`
and Northcott as in 6.2. Conversely, with exactly `card ι` forms general position is independence,
and `NumberField.generalProd_univ_eq_approxProd` is `rfl`.

**6.6 Consistency with Layer 3.** For `Fintype.card ι = 2`, 6.3 is 3.4, as an equation between
theorems:

```text
@NumberField.exists_finset_submodule_of_approxProd_le_card_two
  = @NumberField.exists_finset_submodule_of_approxProd_le_card_two_of_extension := rfl
```

with `…_card_two_of_extension` 3.4's statement proved from 6.3 and `…_card_two_of_generalPosition`
proved from 6.5; `NumberField.finite_setOf_approxProd_le_card_two`, the reading as finitely many
points of `ℙ¹(K)`, from `Projectivization.subsingleton_setOf_rep_mem` (a proper subspace of a plane
holds at most one projective point); and `NumberField.finite_setOf_prod_min_one_le_of_extension`,
Roth's theorem of 3.2 discharged from 6.3 through 3.4's converse. The `rfl` is a genuine check,
since proof irrelevance is definitional: it holds because 3.4 was stated with `approxProd` for an
arbitrary two-element index type. Rejection test: the count cannot be moved to tuples, since a
solution has infinitely many nonzero multiples.

**6.7 The Subspace Theorem on a subspace.** For a subspace `U ⊆ ι → K` with `2 ≤ finrank K U`
and forms whose restrictions to the `K`-points of `U` are `F`-linearly independent, the `x ∈ U`,
`x ≠ 0`, with `generalProd Sinf Sfin w univ L x ≤ mulHeight x ^ (−finrank K U − ε)` lie in finitely
many proper subspaces of `U` (`NumberField.exists_finset_submodule_lt_of_generalProd_le`). Route:
6.3 in the coordinates of a basis `M` of `U`; each local factor changes by at most
`max 1 (∑ k, v (M j k))` per form (`NumberField.iSup_mulVec_le`), the height by a constant through
a left inverse of `M` (`Matrix.mulHeight_mulVec_le`), removed by halving `ε` and Northcott.
Independence on the `K`-points of `U` is independence on its `F`-span, so no base change of `U`
is formed. `U = ⊤` is 6.3. This is the form Faltings–Wüstholz's method consumes.

### Layer 7: approximation of algebraic numbers, and transcendence

What the Subspace Theorem says about numbers. Each milestone is 6.3 over `K = ℚ` with algebraic
coefficients, at the infinite place and, in 7.2, at the primes of a base, followed by an argument
on the finitely many subspaces. The theorems for one linear form in integer points and for
approximation by algebraic numbers of bounded degree are DAT §2.1's
(`finite_small_linear_form`, `finite_approximation_bounded_degree`); this layer consumes them and
owns what lies beyond.

**7.1 The exponents of an algebraic number, and simultaneous approximation** (Schmidt 1970;
Schmidt, *Diophantine Approximation*, Ch. VI; Bombieri–Gubler, Remark 7.3.4).
- *The exponents* (`Real.mahlerExponent_eq_of_isAlgebraic`,
  `Real.algebraicApproximationExponent_eq_of_isAlgebraic`): for real algebraic `α` of degree `D`
  and every `n`, `mahlerExponent n α = algebraicApproximationExponent n α = min n (D − 1)`. Route:
  `mahlerExponent n α ≤ D − 1` is 1.2; the lower bounds are the box principle
  `TauCeti.natCast_le_mahlerExponent`, at `n` when `n < D` and at `D − 1` then monotonicity when
  `n ≥ D`; the missing bound `mahlerExponent n α ≤ n` (`Real.mahlerExponent_le_natCast_of_isAlgebraic`)
  is DAT's `finite_small_linear_form` at `1, α, …, α ^ n`, the polynomials vanishing at `α` being
  excluded by the definition of the exponent; and Wirsing's third inequality of 1.2 with
  `TauCeti.algebraicApproximationExponent_le_mahlerExponent` carry the value to Koksma's
  exponent. At `n = 0` all three sides vanish, so no `1 ≤ n` is assumed. Acceptance test: at
  `n = 1` and `α`
  irrational, `D ≥ 2`, this is `irrationalityExponent α = 2` through DAT's
  `algebraicApproximationExponent_one_add`, a proof of Roth's theorem through Layer 6 and not
  Layer 3.
- *The Subspace step with a product* (`Rat.exists_finset_submodule_of_prod_le`): 6.3 over `ℚ` at
  `∞` alone, where `approxProd` is `(∏ i, |L i x|) / M ^ card ι` with `M` the sup norm of an
  integer point, so the hypothesis is `∏ i, |L i x| ≤ M ^ (−ε)`. The height of an integer point is
  at most its sup norm (`Rat.mulHeight_intCast_le_iSup`). Schmidt's theorems are read against the
  product `∏ i, |q i|`, which can be much smaller than `M ^ n`, so the one-linear-form theorem,
  which charges the coordinate forms `M ^ n`, does not suffice.
- *The two theorems*: for real algebraic `α i` with `1, α 1, …, α n` linearly independent over
  `ℚ` (Mathlib's `LinearIndependent ℚ (fun o : Option ι ↦ o.elim 1 α)`) and `ε > 0`, finitely many
  `q ≥ 1` have `q ^ (1 + ε) · ∏ i, |q α i − p i| < 1` for some integers `p i`
  (`Real.finite_setOf_mul_prod_dist_lt`), and finitely many `q : ι → ℤ` with no zero coordinate
  have `(∏ i, |q i|) ^ (1 + ε) · |∑ i, α i q i − p| < 1` for some integer `p`
  (`Real.finite_setOf_prod_abs_mul_dist_lt`), through the linear-form theorem
  `Real.finite_setOf_prod_abs_mul_abs_sum_lt`. The first needs no induction: one exceptional
  subspace `c₀ q + ∑ c_i p_i = 0` gives `q (c₀ + ∑ c_i α_i) = ∑ c_i θ_i` with `|θ_i| ≤ 1/2`, and
  the left factor is nonzero by the independence. The second eliminates one variable on each
  exceptional subspace and recurses, a relation involving the numerator turning the distance into
  a linear form `∑ q_i (α_i + c_i / c₀)` that the first-stage theorem finishes; a threshold
  `∏ |q i| ≥ ∑ |α i| + 2` absorbs the numerator, and below it `Int.finite_setOf_prod_abs_le`
  counts. Writing the distance to the nearest integer as an existential over the numerator agrees
  with the `round` reading (`Real.abs_sub_round_le`, the nearest integer is nearest). Rejection
  tests: with a zero coordinate allowed the second set is all of `ℤⁿ`; the independence hypothesis
  forces every `α i` irrational.

**7.2 The combinatorial transcendence criterion** (Adamczewski–Bugeaud–Luca 2004;
Adamczewski–Bugeaud 2007; Ferenczi–Mauduit 1997).
- *Vocabulary*: for a finite word `V` and real `w ≥ 1`, `List.rpow V w` is `V` repeated `⌊w⌋`
  times followed by its prefix of length `⌈(w − ⌊w⌋) |V|⌉`, of length `⌈w |V|⌉`. A sequence
  `a : ℕ → α` satisfies `Function.IsStammeringWith w a` if there are finite words `U k`, `V k` with
  `U k ++ List.rpow (V k) w` a prefix of `a`, `|U k| ≤ C |V k|` and `|V k|` strictly increasing,
  and `Function.IsStammering a` if this holds for some `w > 1`. The bounded ratio is stated as
  `|U k| ≤ C |V k|`, since `x / 0 = 0` would make a quotient say nothing at `|V k| = 0`.
- *The criterion* (`Real.transcendental_ofDigits_of_isStammering`): for `b ≥ 2` and
  `a : ℕ → Fin b` stammering and not eventually periodic, Mathlib's `Real.ofDigits b a` is
  transcendental; and the weak form from Ridout alone,
  `Real.transcendental_ofDigits_of_isStammeringWith_of_two_lt`, for `w > 2`. Both are proved in a
  working form on periodic segments (`Real.transcendental_ofDigits_of_forall_periodic`, `…_of_two_lt`),
  to which `Function.IsStammeringWith.exists_periodic` reduces the definition, with the converse
  `Function.isStammeringWith_of_periodic`.
- *Irrationality* (`Real.irrational_ofDigits_iff`): for `b ≥ 2` the value is irrational exactly
  when `a` is not eventually periodic. Route through the tails `T k` of `a` itself,
  `b · T k = a k + T (k + 1)` with `0 ≤ T k ≤ 1`, which for a rational value take finitely many
  values; no uniqueness of expansions is used.
- *The Subspace step* (`Rat.exists_finset_submodule_of_prod_mul_prod_padicNorm_le`): 6.3 over `ℚ`
  with forms at `∞` and the coordinate forms at a finite set of primes, the height of an integer
  point bounded by its sup norms at `∞` and the primes (`Rat.mulHeight_intCast_le_iSup_mul_prod`);
  the previous milestone's step is its case of no primes.
- Route: a repetition of period `s` after position `r` puts `(b ^ (r + s) − b ^ r) ξ` within
  `b ^ (−(w − 1) s)` of an integer `p` (`Real.abs_mul_ofDigits_sub_le_rpow`, exact, from
  `Real.pow_mul_ofDigits` and Mathlib's `Real.abs_ofDigits_sub_ofDigits_le`); the forms
  `X, Y, ξ X − ξ Y − Z` at `∞` and the coordinate forms at the primes of `b` put the points
  `(b ^ (r + s), b ^ r, p)` into finitely many proper subspaces
  (`Real.exists_finset_submodule_of_repetition`). One of them holds infinitely many; its equation
  either omits `Z`, and holds for at most one `s`, or forces `ξ` rational. At `∞` alone the
  product of the three forms is small only for `w > 2 + 2 r / s`; the primes of `b` contribute
  `b ^ (−(2 r + s))` and lower the threshold to `w > 1`. Ridout's theorem, with the primes of `b`
  as its `S₂` (the denominator side), sees only the factor `b ^ r` and gives `w > 2`; the
  approximant in lowest terms keeps a denominator part prime to `b` below `b ^ s`
  (`Rat.mul_prod_padicNorm_le_of_dvd`).
- Acceptance tests: `∑ j, 10 ^ (−(2 ^ j + 1))` is transcendental three ways (the criterion with
  `w = 3`, the `w > 2` form, the working form). Rejection tests: the constant sequence `0` is
  stammering with an algebraic value; every sequence satisfies the condition at `w = 1`.

**7.3 The complexity of an algebraic irrational** (Adamczewski–Bugeaud 2007, Theorem 1;
Morse–Hedlund 1938). For `a : ℕ → α`, `Function.factor a i n` is the word `a i ⋯ a (i + n − 1)` and
the **complexity** `Function.complexity a n` is the number of distinct factors of length `n`.
Over a finite alphabet:
- `Function.complexity_mono` and `complexity a 0 = 1`;
- **Morse–Hedlund** (`Function.isEventuallyPeriodic_tfae`, `Function.lt_complexity`): `a`
  eventually periodic, `complexity a` bounded, and `complexity a n ≤ n` for some `n` are
  equivalent. Route: some `m < n` has `p (m + 1) = p m`, so `List.take m` is injective on the
  factors of length `m + 1` (`Set.injOn_of_ncard_image_eq`), every factor has one right
  extension, and two equal factors make `a` periodic from the first on;
- *the combinatorial lemma* (`Function.isStammering_of_frequently_complexity_le`):
  `complexity a n ≤ C n` for infinitely many `n` implies `a` stammering, by pigeonhole on the
  first `C n + 1` positions and a re-cut period `P = (⌊n / 2 s⌋ + 1) s`, which gives one exponent
  for every `n` with no case split (`Function.exists_periodic_of_frequently_complexity_le`);
- *the theorem* (`Real.tendsto_complexity_div_atTop`): for `b ≥ 2`, if `Real.ofDigits b a` is
  algebraic and irrational then `complexity a n / n → ∞`, proved as the transcendence criterion
  `Real.transcendental_ofDigits_of_frequently_complexity_le`, consuming 7.2's working form.

The alphabet must be finite: over `ℕ` the identity has infinitely many factors of length `1`,
which `Set.ncard` counts as `0` (`Function.complexity_id_one`). Acceptance tests: the binary digits
of `∑ k, 2 ^ (−2 ^ k)` have complexity at most `3 n + 1`, so the number is transcendental; an
algebraic irrational has more than `1000 n` distinct blocks of `n` decimal digits for all large
`n`. Rejection: the constant sequence `0` has algebraic value and `p n / n → 0`.

### Layer 8: unit equations and Diophantine equations

Throughout, `S : Finset (HeightOneSpectrum (𝓞 K))` and `S.unit K`, `S.integer K` are Mathlib's.
Every finiteness statement is qualitative; the counts are DAT §§2.3–2.4's and Layer 9's.

**8.1 The unit equation in two variables** (Siegel, Mahler, Lang). For `a, b ∈ Kˣ`, finitely many
pairs of `S`-units satisfy `a x + b y = 1` (`NumberField.finite_setOf_unit_add_unit_eq_one`).
Route: enlarge `S` until `a`, `b` are `S`-units (`NumberField.exists_finset_mem_unit`) and absorb
them (`NumberField.finite_setOf_add_eq_one`); apply 6.5 with the three forms `X₀`, `X₁`, `X₀ + X₁`
at every infinite place and every place of `S`, which are in general position
(`NumberField.isGeneralPosition_unitEquationForms`), and `ε = 1`. At a solution the central
quantity is **exactly** `mulHeight (x, y) ^ (−3)` (`NumberField.generalProd_unitEquationForms_eq`):
the numerators multiply to `1` by the `S`-product formula, and the denominators to `H ^ 3`
because the equation itself is the Bézout relation that makes `(x, y)` `S`-primitive. No
coordinate is compared and no case is split. A proper subspace of `K²` meets `X₀ + X₁ = 1` at most
once (`NumberField.eq_of_mem_of_add_eq_one`). DAT §2.3's `finite_two_term_unit_equation_rat` is the
case `K = ℚ`. Acceptance test: `(2, −1)`, `(3, −2)`, `(4, −3)`, `(9, −8)` solve `x + y = 1` in
`{2, 3}`-units of `ℚ`. Rejection: in `ℚˣ`, `(n + 2, −(n + 1))` solves it for every `n`.

**8.2 The unit equation in `n` variables** (Evertse; van der Poorten–Schlickewei;
Bombieri–Gubler, Theorem 7.4.2 and Corollary 7.4.3). For `a : ι → Kˣ`, finitely many
`x : ι → S.unit K` satisfy DAT §2.3's `IsNondegenerateSolution a x`, the equation
`∑ i, a i * x i = 1` with no vanishing nonempty subsum
(`NumberField.finite_setOf_sum_unit_eq_one`). Alongside:
- *Corollary 7.4.3* (`NumberField.exists_finite_forall_exists_mul_mem`): without nondegeneracy,
  a finite `Φ ⊆ K` such that every solution has a coordinate with `a i * x i ∈ Φ`; and its
  homogeneous form (`NumberField.exists_finite_forall_exists_div_mem`): for the solutions of
  `∑ i, a i * x i = 0` in `S`-units with `IsNondegenerateHomogeneousSolution`, finitely many
  values of each ratio `x i / x j`, which 8.6 consumes.
- *Finitely generated groups* (`NumberField.finite_setOf_sum_mem_eq_one`): the same for `x i ∈ Γ`,
  `Γ ≤ Kˣ` finitely generated, since such a `Γ` lies in `S.unit K` for a finite `S`
  (`NumberField.exists_finset_le_unit`). At `K = ℚ` this discharges DAT §2.3's
  `finite_nondegenerate_solutions_rat`. DAT §2.4's `finite_nondegenerate_solutions`, over an
  arbitrary field of characteristic zero, follows from it by DAT's own specialization lemma and is
  not an instance of anything here.
- *Subsums* (`NumberField.exists_subset_sum_eq_forall_ne_zero`): a sum equal to `c` has a subsum
  equal to `c` with no vanishing nonempty subsum, and the nonempty variant
  `NumberField.exists_subset_nonempty_sum_eq_zero_forall_ne_zero` for a vanishing sum; a proper
  subspace lies in a hyperplane `∑ i, b i * y i = 0`, `b ≠ 0`
  (`NumberField.exists_ne_zero_forall_sum_mul_eq_zero_of_ne_top`).

Route, by strong induction on `Fintype.card ι` over all index types in one universe, with the
coefficients carried as nonzero elements of `K` (`NumberField.unitSolutions`) so that restriction
to a subtype needs no repackaging: absorb the coefficients; apply 6.5 with the `card ι + 1` forms
`X i` and `∑ i, X i` (in general position, `NumberField.isGeneralPosition_sumEquationForms`;
the central quantity is exactly `H(x) ^ (−card ι − 1)`, `NumberField.generalProd_sumEquationForms_eq`);
on each subspace a relation with `c j ≠ 0` shortens the equation
(`NumberField.exists_sum_mul_eq_one_of_ne_top`). The shortened equation may be degenerate, so the
step is in two parts: a minimal subsum equal to `1` has fewer variables and is nondegenerate, which
puts some coordinate of every solution in a fixed finite set
(`NumberField.exists_finite_forall_exists_apply_eq`, Corollary 7.4.3); fixing `x k = u` leaves
`∑ i ≠ k, x i = 1 − u` with `u ≠ 1` because the subsum over `i ≠ k` does not vanish
(`NumberField.finite_setOf_apply_eq`). Acceptance test: `1/2 + 1/3 + 1/6 = 1` in `{2, 3}`-units.
Rejection: `(2 ^ k, −2 ^ k, 1)` for every `k`.

**8.3 Triangularly connected decomposable forms** (Győry–Papp; Evertse–Győry, *Unit Equations in
Diophantine Number Theory*, Ch. 9). For `l : κ → Module.Dual K V`, `Module.Dual.TriangleAdj l j j'`
when some `l k = a • l j + b • l j'` with `a, b ≠ 0`, and `Module.Dual.IsTriangularlyConnected l`
when every two indices are joined in `Relation.ReflTransGen`. For such a family with
`⨅ j, LinearMap.ker (l j) = ⊥`:
- the points at which every `l j` takes an `S`-unit value are `S`-unit multiples of finitely many
  points (`NumberField.exists_finite_forall_eq_smul`, on any `K`-vector space);
- for `G = c * ∏ j, l j ^ e j` with every `e j ≠ 0` and `m ≠ 0`, finitely many `S`-integral `x`
  satisfy `G x = m` (`NumberField.finite_setOf_mul_prod_eq`);
- the `S`-integral `x` with `G x ∈ S.unit K` are `S`-unit multiples of finitely many solutions
  (`NumberField.exists_finite_forall_mul_prod_mem_unit`).

Route: along a triangle, `a (l j x / l k x) + b (l j' x / l k x) = 1` is 8.1, so the ratio
`l j' x / l j x` takes finitely many values (`NumberField.finite_setOf_div_of_triangleAdj`), and
along a path the ratios multiply (`NumberField.finite_setOf_div_of_reflTransGen`); the common
kernel `0` makes `LinearMap.pi l` injective, so the ratios determine the point up to a scalar. For
`G`, enlarge `S` until `c` is a unit and the coefficients integral
(`NumberField.exists_finset_integer_coeff`); integral factors with a unit product of positive
powers are units (`NumberField.exists_mem_unit_of_mul_prod`); and `G (u • y) = u ^ E * G y`,
`E = ∑ j, e j` (`NumberField.mul_prod_apply_smul`). For the unit version, two solutions on one line
differ by a scalar whose `E`-th power is an `S`-unit, hence an `S`-unit, so each line carries one
class and no valuation is bounded. Pairwise non-proportionality is not a hypothesis. Forms whose
factors are defined only over an extension are 8.4's. Only 8.1 is used. Acceptance test:
`x y (x + y) = 2` has finitely many integer solutions, among them `(1, 1)`. Rejection: `X, Y` are not
triangularly connected and `x y = 1` has the `{2}`-integral solutions `(2 ^ k, 2 ^ (−k))`.

**8.4 Thue and Thue–Mahler** (Thue 1909; Mahler 1933; Bombieri–Gubler 5.3.1–5.3.2). For
`g ∈ K[X]` of degree at most `d` with at least three distinct roots in an algebraically closed
`Ω ⊇ K`, counting the point at infinity as one when `natDegree g < d` (that is,
`G = g.homogenize d` has at least three pairwise non-proportional linear factors over `Ω`):
- `G (x, y) = m` with `m ≠ 0` has finitely many solutions in `S.integer K`
  (`NumberField.finite_setOf_eval_homogenize_eq`), DAT §1.6's `thue_equation_finite` at `K = ℚ`,
  `S = ∅`;
- the `S`-integral `(x, y)` with `G (x, y) ∈ S.unit K` are `S`-unit multiples of finitely many
  solutions (`NumberField.exists_finite_forall_eval_homogenize_mem_unit`);
- *Thue–Mahler over `ℤ`* (`Polynomial.finite_setOf_natAbs_eval_homogenize_eq_prod_pow`): for
  `g ∈ ℤ[X]` with the hypothesis over `ℂ` and primes `p 1, …, p s`, finitely many coprime `x, y`
  and exponents `z` have `|G (x, y)| = ∏ k, p k ^ z k`, DAT §2.3's `finite_thueMahler`.

Route: over the splitting field `L`, `G` is a constant times powers of pairwise non-proportional
binary forms (`Polynomial.exists_eval_homogenize_eq_mul_prod_binary`); three such forms are
triangularly connected, since two span the dual of `L²` and Cramer's rule writes the third with
nonzero coefficients (`Module.Dual.isTriangularlyConnected_binary`); so 8.3 applies over `L` with
the primes above `S` (`NumberField.finite_setOf_eval_homogenize_eq_of_splits`). *Passage to
primes above `S`*: `HeightOneSpectrum.under (𝓞 K) ⁻¹' S` is finite (Tau Ceti's `primesAbove`),
and an element of `K` is an `S`-integer or `S`-unit exactly when its image is one above `S`
(`NumberField.algebraMap_mem_integer_iff`, `NumberField.map_mem_unit_iff`), the exponent `e f`
used only through its positivity. The unit version descends without degrees or norms: two
`K`-solutions on one line of `L²` differ by a scalar in `K` that is a unit above `S`. Over `ℤ`, a
line carries at most two coprime integer points `±c` (`Int.finite_setOf_isCoprime_eq_mul`), and the
exponents are bounded by `|G (x, y)|`. Only 8.3, hence only 8.1, is used. Acceptance tests: in every
number field and for every `S`, `x³ − 2 y³ = 1` has finitely many `S`-integral solutions;
`x³ − 2 y³ = ± 2 ^ a 3 ^ b` has finitely many coprime solutions, among them `(2, 1)` with
`a = b = 1`. Rejection: `(2 ^ k, 0)` without coprimality; `x² − 2 y² = ± 1`, two factors (Pell).

**8.5 The hyperelliptic equation** (Siegel 1926; Bombieri–Gubler, Theorem 5.3.5). For `f ∈ K[X]`
with at least three distinct roots of **odd multiplicity** in an algebraically closed `Ω ⊇ K` and
`b ≠ 0`, finitely many `(x, y)` in `S.integer K` satisfy `b y² = f x`
(`NumberField.finite_setOf_mul_sq_eq_eval`), with the book's squarefree statement of degree at least
`3` (`NumberField.finite_setOf_mul_sq_eq_eval_of_squarefree`) and the split case
(`NumberField.finite_setOf_mul_sq_eq_eval_of_splits`) as corollaries; neither the coefficients of
`f` nor `b` need be `S`-integral or `S`-units. Route:
- enlarge `S` until the leading coefficient, `b`, the nonzero roots and their nonzero differences
  are units and `S.integer K` is principal (0.3, through Tau Ceti's
  `subsingleton_integer_classGroup_iff`; `NumberField.exists_finite_superset_forall_mem_unit`);
- at a solution `x − α i` is coprime in `S.integer K` to the other factors, its differences being
  units, so it is one of finitely many constants times a square
  (`NumberField.exists_eq_mul_sq_of_pow_mul_prod_eq`, `NumberField.exists_finset_forall_eq_mul_sq`,
  from Mathlib's `exists_associated_pow_of_mul_eq_pow'`); the square classes are finite because
  `Set.unit_fg` and Mathlib's `Subgroup.finiteIndex_range_powMonoidHom_of_fg`. No ideal is factored
  and no valuation counted. Odd multiplicity suffices, since `z ^ (2 k + 1) = v d²` gives
  `z = v (d / z ^ k)²`;
- over the splitting field of `∏ e, (X² − e)`, `x − α i = δ i ²` with `δ i` integral above `S`, and
  Siegel's identity `(δ 1 − δ 2) / (δ 1 − δ 3) + (δ 2 − δ 3) / (δ 1 − δ 3) = 1` is one unit
  equation (8.1) whose solution `t` determines `x` rationally; each `x` carries at most two `y`.

Only 8.1 and 8.4's passage to an extension are used. Acceptance tests: in every number field and
for every `S`, `y² = x³ − 2` and `y² = x³ (x² − 2)` (not squarefree) have finitely many
`S`-integral solutions; `(3, 5)` solves the first. Rejection: `y² = x² (x − 1)` has the solutions
`(t² + 1, t (t² + 1))`; `y² = 2 x² + 1` is Pell's equation.

**8.6 The Corvaja–Zannier gcd bound** (Corvaja–Zannier 2003, 2005; Bugeaud–Corvaja–Zannier 2003;
Bombieri–Gubler, Theorem 7.4.10 and Corollary 7.4.11). For a finite set `P` of primes and `ε > 0`
there are `R` and a finite set `E ∌ (0, 0)` of exponent pairs such that every pair of nonzero
integers `u, v` with prime factors in `P` and `Int.gcd (u − 1) (v − 1) ≥ (max |u| |v|) ^ ε` has
`max |u| |v| ≤ R` or `u ^ a * v ^ b = 1` for some `(a, b) ∈ E`
(`Int.exists_forall_of_rpow_le_gcd_sub_one`); in particular only finitely many such pairs are
multiplicatively independent (`Int.finite_setOf_rpow_le_gcd_sub_one`). Corollaries: the greatest
prime factor of `(a b + 1)(a c + 1)` tends to infinity with `a`, for `a > b > c ≥ 1`
(`Nat.finite_setOf_primeFactors_subset`); and `gcd (a ^ n − 1) (b ^ n − 1) < exp (ε n)` for all
large `n`, for multiplicatively independent `a, b ≥ 2` (`Nat.finite_setOf_exp_le_gcd_pow_sub_one`).
Route, with `d` the gcd and `N = ⌈4 / ε⌉ + 2`: the integral point
`z (i, j) = (u ^ (i + 1) v ^ j − 1) / d`, `i, j < N` (`Int.dvd_pow_mul_pow_sub_one`); the coordinate
forms at `∞` and, at every `p ∈ P`, the forms `z (i, j) − z top` and `z top` with `top` the monomial
`u ^ N v ^ (N − 1)`, smallest at every prime at once
(`NumberField.FinitePlace.apply_sub_le_mul`); 6.4 with exponent `1`, the `N²` powers of
`d ≥ H ^ ε` winning against a height at most `2 H ^ (2 N − 1)`; and the relation on each
subspace, a homogeneous unit equation, put through 8.2's homogeneous corollary. A ratio `1` of two
monomials is a curve `u ^ a v ^ b = 1`; a ratio `r / s ≠ 1` forces `d ∣ r − s`
(`Int.dvd_num_sub_den`), bounding `d`. The theorem is stated with the ordinary `Int.gcd`, not its
part prime to `P`. Acceptance tests: `gcd (2 ^ n − 1) (3 ^ n − 1) < exp (n / 100)` for all large
`n`; the greatest prime factor of `(a b + 1)(a c + 1)` exceeds `7` for all large `a`. Rejection:
`(2 ^ k, 2 ^ k)` satisfies the hypothesis at `ε = 1/2`; `b = c = 1`, `a = 2 ^ k − 1`.

**8.7 The vocabulary of counting unit equations** (Evertse 1984, §2; Schlickewei 1990, §3). The
pieces of the quantitative theory of unit equations that are not specific to one paper, so that
later counts consume them from one place:
- `NumberField.placeProd S T g`, the product of `g` over the places of `T` among the infinite
  places and `S`, in the product-formula normalization, with `relevantPlaces`, `placeProd_mul`,
  `placeProd_le_placeProd`, `placeProd_inter_mul_diff`, `placeProd_prod`; the product formula for
  an algebraic integer (`one_le_placeProd_univ`, `one_le_placeProd_univ_of_mem_integer`); the
  `S`-product formula (`placeProd_univ_eq_one_of_mem_unit`, `placeProd_univ_mul_unit`); the height
  of an `S`-integral tuple (`mulHeight_le_placeProd_univ`, `mulHeight_eq_placeProd_mul_finprod`,
  `mulHeight_mul_unit_mul_placeProd`, `placeProd_iSup_le_mulHeight_of_eq_one`) and
  `mulHeight_le_iSup_house_pow`.
- `NumberField.sumForms r`, the coordinates with the one `r v` names replaced by their sum, for
  `r : AbsoluteValue K ℝ → Option ι` (Schlickewei's class (3.12)), linearly independent at every
  place (`linearIndependent_sumForms`), with coefficients `0` and `1` (`sumForms_basisFun`,
  `sumForms_mem_range`), their products at a point (`prod_sumForms_mul`, `affineProd_sumForms_mul`),
  exact on the hyperplane `∑ y = 0` (`prod_sumForms_mul_eq_prod_option`,
  `apply_sumForms_eq`), `det_sumForms_apply`, `det_pi_sumForms`, `iSup_le_card_mul_iSup_sumForms`,
  and `mulHeight_elim_neg_sum_le`, `H (y, −∑ y) ≤ (card ι) ^ [K : ℚ] · H (y)` for nonempty `ι`
  (for empty `ι` the left side is `1` and the right side `0`).
- *A balanced representative* (`NumberField.exists_smul_balanced`,
  `NumberField.exists_smul_systemValue_le`): for a chosen prime `P₀ ∈ S` (so `S` nonempty; a
  caller with `S = ∅` first adjoins one prime, which only enlarges the set of solutions), every
  projective point has an `S`-integral representative meeting Evertse's normalization (2.4) for
  the largest exponents, with fixed constants `balancedConst P₀` of product `1`, at a cost
  `scalarConst K S` from one Minkowski scalar rather than the `S`-unit covering radius of 5.1. The
  scalar's factor `scalarConst K S` is pushed to `P₀`, where the representative is made at most
  `(scalarConst K S)⁻¹`; this cancels the archimedean constants
  `scalarConst K S ^ (mult v / [K : ℚ])` in the product; with the normalization of coefficients by
  Minkowski's bound on ideal classes (`exists_mul_isIntegral_inv_le_finprod_iSup`,
  `placeProd_iSup_le_mul_mulHeight`) and `exists_absNorm_le_two_pow` (a prime above `2` has norm at
  most `2 ^ [K : ℚ]`).
- *Subclasses* (`NumberField.exists_le_rpow_prod_grid`): if `0 < u p i ≤ 1` with product `b`,
  grid exponents `k p i / N` with `u p i ≤ b ^ (k p i / N)` and `∑ k / N ≥ 1 − #P · card ι / N`.

**8.8 The local Nullstellensatz inequality** (Corvaja–Zannier 2004, Lemma 3.3).
- `MvPolynomial.exists_sum_mul_eq_of_isHomogeneous`: if a homogeneous polynomial lies in an ideal
  generated by homogeneous polynomials, it is a combination with homogeneous coefficients of the
  right degrees.
- `MvPolynomial.exists_le_abv_eval_of_pow_mem`: if every `X s` has a power in
  `(X₀, G ^ h, homogenize δ f)` with `natDegree (f i) ≤ δ`, then at any absolute value of `K` there
  are `c > 0` and `R` with `c · ‖P‖_v ^ δ ≤ |f i (P)|_v` for some `i`, for every zero `P` of `G`
  with `‖P‖_v ≥ R`. Route: evaluate `X s ^ M = A₀ X₀ + ∑ B G ^ h + ∑ A f ^ h` at `(1, P)` with
  homogeneous coefficients from the first item, and bound the coefficients at `v`
  (`MvPolynomial.abv_eval_le`, from the product bound `MvPolynomial.abv_eval_prod_le`). It
  replaces the limit points at infinity in the Corvaja–Zannier argument for `f₁ ⋯ f_r = g`.

### Layer 9: counting subspaces

The elementary half of the quantitative Subspace Theorem (Evertse, "On the Quantitative Subspace
Theorem", 2010, §§2–4; "Evertse" in this layer is this paper), in the language of systems of
inequalities. It uses
Layer 0, the product formula, determinant bounds and Layer 4's geometry of numbers, and of Layers
2–6 only 6.4, in Theorem A: it bounds how many subspaces the solutions in a range of heights
need. Write `N = Fintype.card ι`. Heights are **affine**, Tau Ceti's `Height.mulHeightAff`, and its
`[K : ℚ]`-th root, as Evertse states them; his absolute values are the `[K : ℚ]`-th roots of
Mathlib's, so the exponents are his and only the constants change. The sharp count of the large
solutions for general `N`, Evertse's Theorem 2.1 and its successors, is DAT §2.8's
(`parametric_subspace_theorem`, `subspace_theorem_for_systems`); 9.5 proves the weaker count that
Layers 4–6 give, with `[E : ℚ]`, `[E : K]` and `R` in place of the absolute theory's constants.

**9.1 Systems of inequalities** (Evertse, §2, systems (2.3) and normalization (2.4)). For `S`, `w`
and forms as in 6.4, constants `C p` and exponents `c p i` indexed by `p : InfinitePlace K ⊕ S`:
- `NumberField.systemSet`, the `S`-integral `x` with `w p (L p i x) ^ mult p ≤ C p * H(x) ^ c p i`,
  with local values `NumberField.systemValue`, weight `NumberField.systemWeight`, determinant
  `NumberField.systemDet` and `NumberField.systemExponent` (`mult v / [K : ℚ]` at the infinite
  places, `0` at the finite ones);
- `NumberField.IsNormalizedSystem`, the normalization (2.4): coefficients of absolute height at
  most `H` and degree at most `D` over `K`, at most `R` distinct forms,
  `∏ C p ≤ (∏ |det L p|_p) ^ (1 / N)`, weight at most `−δ` with `0 < δ ≤ 1`, and
  `max i, c p i = systemExponent p`; with `IsNormalizedSystem.two_le_card` (for `N = 1` the last
  condition forces weight `1`);
- `NumberField.IsLargeSolution`: `H(x) ^ (1 / [K : ℚ]) ≥ max (2 H) (N ^ (2 N / δ))`;
- *the product inequality and systems*, both ways: a solution of a system satisfies
  `affineProd ≤ (∏ C p) ^ N · H(x) ^ systemWeight` (`NumberField.affineProd_le_of_mem_systemSet`),
  and under (2.4) Schmidt's `affineProd ≤ ∏ |det L p|_p · H(x) ^ (−δ)`
  (`NumberField.affineProd_le_systemDet_mul_rpow`); conversely finitely many exponent systems of
  weight at most `−δ/2` catch, for any positive constants and above a level, every `S`-integral
  solution of `affineProd ≤ H(x) ^ (−δ)` (`NumberField.exists_finset_forall_exists_mem_systemSet`).
  Against the affine height every local value is at most `A · H(x)`
  (`NumberField.exists_systemValue_le_mul_mulHeightAff`), so no unit normalization, fundamental
  inequality or independence of the forms is needed, unlike 5.1; exponents are clamped below at
  `−(2 · #(places × forms) + δ + 1)`, which also handles the kernels. The last condition of (2.4)
  is not produced: at a finite place it requires moving the point by an `S`-unit;
- *normalized systems from a grid* (`NumberField.exists_mem_systemSet_systemGridExponent`): with
  `t` the number of places of the system, an `S`-integral `x` with `H = H_aff(x) > 1`, every form
  at most `C p · H ^ s(p)`, no form zero, and
  `∏ p, ∏ i, |L i x|_p · H ^ (N + 2 δ) ≤ (∏ p, max i, |L i x|_p) ^ N` solves the system of
  a grid point `k` with entries at most `(N + 1) M`, a zero at every place and `∑ k / M ≥ N + δ`,
  once `M δ ≥ t N`, with exponents `s(p) − k p i / M`. Their weight is exactly `N − ∑ k / M`
  (`systemWeight_systemGridExponent`), hence at most `−δ`
  (`systemWeight_systemGridExponent_le`), and they meet (2.4) with the constants unchanged
  (`systemGridExponent_le`, `exists_systemGridExponent_eq`), with no existential level and at most
  `((N + 1) M + 1) ^ (t N)` systems. The exponent `N + 2 δ` on the left is load-bearing: the
  weight is `N − ∑ k / M`, so the grid sum has to exceed `N`. The lower bound on the largest
  forms is the caller's, through `placeProd_iSup_le_mul_prod_iSup_systemValue`;
- **Theorem A** (`NumberField.exists_finset_submodule_of_systemWeight_neg`): one system of negative
  weight has its solutions in finitely many proper subspaces, from 6.4 for large affine height and
  Northcott below (the affine height of a tuple bounds the height of each coordinate).

Acceptance test: the coordinate forms of `ℚ²` with exponents `(1, −2)` satisfy (2.4) with
`H = D = δ = 1`, `R = 2`, and that system's solutions `(k, 0)` lie on one line. Rejection: for
`N = 1`, `|x| ≤ H(x) ^ (−1)` has the solution `1`; over `ℚ` with `S = {2}` the coordinate system
with exponents `(1, 0)` at `∞` and `(−1, 0)` at `2` has weight `0` and the solutions `(2 ^ k, 1)`,
no two on a proper subspace.

**9.2 The gap principle** (Evertse, Proposition 4.1). Under (2.4) and for `Q ≥ N ^ (2 N / δ)`, the
solutions with `Q ≤ H(x) < Q ^ (1 + δ / (2 N))`, `H` the absolute affine height, lie in a
**single** proper subspace (`NumberField.exists_submodule_ne_top_of_window`), because any `N` of
them have determinant `0` (`NumberField.det_eq_zero_of_window`). Route: the determinant is an
`S`-integer, so its local sizes over the places of the system multiply to at least `1`
(`NumberField.one_le_prod_systemAbs_algebraMap`); in the window each local value is at most
`C p · Q ^ ([K : ℚ] · (c p i + s(p) δ / (2 N)))` (`NumberField.systemValue_le_rpow_of_window`,
applied at the relative level `Q ^ [K : ℚ]`, since `Q` bounds the absolute affine height and
`systemValue` is a relative local value; the one use of `c p i ≤ s(p)`); and the determinant of
the forms at the points is bounded row by row by the
Leibniz expansion (`AbsoluteValue.apply_det_le_factorial_mul_prod`,
`AbsoluteValue.apply_det_le_prod_of_isNonarchimedean`; `NumberField.systemAbs_det_le`,
`NumberField.det_eq_zero_of_systemAbs_det_le`, `NumberField.prod_systemBound_le`). The places are
absolute values with no inner product, so Leibniz's `N!` replaces Hadamard's `N ^ (N / 2)`, and
`Q ≥ N ^ (2 N / δ)` still beats it. The forms need not be independent, since `∏ C p > 0` makes
every determinant nonzero. A chain of windows is covered by the union of their subspaces
(`NumberField.exists_finset_submodule_of_chain`). Acceptance test: a normalized system over `ℚ`
in two variables and a window containing two independent solutions is rejected by the
determinant bound.

**9.3 Small solutions** (Evertse, Theorem 2.2, Proposition 4.2, Lemmas 4.3–4.5). The solutions
that are not large lie in at most `δ⁻¹ ((10³ N) ^ (N d) + 4 N log log (4 H))` proper subspaces
(`NumberField.exists_finset_submodule_of_not_isLargeSolution`), proved once from any count per
window (`NumberField.exists_finset_submodule_of_not_isLargeSolution_of_window`): 9.2 above
`N ^ (2 N / δ)`, and below it the second gap principle, at most `(90 N) ^ (N d)` subspaces for the
solutions with `Q ≤ H(x) < 2 Q ^ (1 + δ / (2 N))`, `Q ≥ 1`
(`NumberField.exists_finset_submodule_of_window_two_mul`), with `δ⁻¹ (1 + 4 N (N − 1))` windows
below the threshold from `log (1 + log₂ N) ≤ N − 1`, which Evertse's constants absorb. Beneath it:
- *Lemma 4.3* (`Matrix.exists_det_partition`): a partition of `Fin N → ℂ` into at most
  `(20 N) ^ N · M²` classes on each of which `|det (y 1, …, y N)| ≤ M⁻¹ ∏ i, ‖y i‖`, with the pivot
  coordinate not gridded (classes `Σ i, ({j // j ≠ i} → Fin A × Fin A)`) and grid `⌈3 A⌉`; with
  Hadamard's inequality in the sup norm (`Matrix.norm_det_le_card_rpow_mul_prod_norm`), from SM's
  `hermitian_gram_hadamard`. False for `N = 1`. The infinite places are read through complex
  embeddings (0.1), Evertse's vector being `(φ (L i x) / t i)_i` with `t i` the `mult v`-th root of
  the bound, and `M = (9/2) ^ (N / 2)` beats the doubled window;
- *over `ℚ`*: at most `200 ^ N` subspaces per window
  (`Rat.exists_finset_submodule_of_window_two_mul`) and `δ⁻¹ (10 ^ (3 N) + 4 N log log (4 H))` in
  all (`Rat.exists_finset_submodule_of_not_isLargeSolution`), from *Lemma 4.5* with another constant
  (`Rat.exists_finset_submodule_of_det_le`; the paper has `100 ^ N D ^ (1 / (N − 1))`): `S`-integral
  points any `N` of which have determinant at most `D v` at every place lie in at most
  `3 ^ N (4 N² + 2)² · max 1 (∏ v, D v) ^ (1 / (N − 1))` proper subspaces, with *Lemma 4.4*
  (`Rat.exists_finset_submodule_of_abs_det_le`, `100 ^ N`) its case `S = ∅`. Route for 4.5, proved
  directly: the dual of the lattice `⋂ v, M v` is an approximation module of Layer 4 at level `1`
  with exponents `0`, so 4.2 with 4.1's volume and covolume gives `∏ k, μ k ≤ ∏ v, D v` with no
  loss; the minimal vectors take integer values of size at most `2 N μ k` on the points by Cramer's
  rule, and a pigeonhole on a prefix of them
  (`Module.Dual.exists_finset_submodule_of_forall_eq_intCast`) finishes. `max 1` is needed, since a
  set in a proper subspace needs one subspace however small `D` is.

**9.4 From intervals to subspaces** (Evertse, proof of Theorem 2.1). If the solutions of a
normalized system outside a subspace `U₀` have `H(x) ∈ ⋃ i < m, [Q i, Q i ^ ω)` with `ω ≥ 1` and
`Q i ≥ N ^ (2 N / δ)`, they lie in at most `m (1 + log ω / log (1 + δ / (2 N)))` proper subspaces
(`NumberField.exists_finset_submodule_of_forall_mem_interval`), and the general form for the
solutions in any set (`NumberField.exists_finset_submodule_of_forall_mem_interval_of_mem`). Each
interval is `⌈log ω / log (1 + δ / (2 N))⌉` windows of 9.2. The interval hypothesis is explicit,
since every quantitative Roth or Subspace theorem is proved as an interval result: for `N = 2`
3.6 supplies it (`NumberField.exists_finset_submodule_of_card_eq_two`); for general `N` the
interval results at Schmidt's parameters are 5.5's `exists_forall_mem_interval_approxSpan` for one
system of forms and 6.1's `exists_forall_mem_interval_approxDomain`, and the absolute count is DAT
§2.8's. `ω ≥ 1` is load-bearing, since for `ω < 1` the bound can be negative while the intervals
are empty.

**9.5 The count for normalized systems** (Schlickewei 1992; Evertse 2010, the proof of Theorem 2.1
from Theorem 3.1 and Proposition 4.1, with 6.1 in place of Theorem 3.1). For a normalized system of
9.1 with forms over a Galois extension `E/K`, `N` forms per place, `t` places and coefficients of
absolute height at most `H`, the solutions with `log H(x) ≥ NumberField.systemThreshold` lie in at
most `NumberField.systemLargeCount` proper subspaces, a number depending only on `N`, `δ`,
`[E : ℚ]`, `[E : K]` and the number `R` of distinct forms, not on `t` or `|S|`
(`NumberField.exists_finset_submodule_of_systemThreshold_le`); all solutions lie in at most that
number plus 9.3's count plus `1 + log ω / log (1 + δ / (2 N))`
(`NumberField.exists_finset_submodule_of_isNormalizedSystem`); and the threshold is linear in
`log H` (`NumberField.systemThreshold_le`). The heights enter only the threshold; the sharp absolute
count is DAT §2.8's `subspace_theorem_for_systems`, and 9.5 is the statement Layers 4–6 prove
without the absolute theory. Deliverables:
- *From systems to domains over `E`* (`NumberField.mem_approxDomain_conjSystem`): an `S`-integral
  `x` with `systemValue p i x ≤ Q ^ c' p i` at every place, for a level `Q ≥ 0` and exponents `c'`,
  read in `ι → E`, lies in the approximation domain over `E` of 6.3's conjugated forms
  `NumberField.conjSystem`, at the places of `E` above `S` (`NumberField.systemPlacesOver`), with
  exponents `NumberField.conjExponent c'` (`c' v i / mult v` above an infinite place,
  `e f · c' v i` above a prime of `S`), at level `Q`. The level is a free parameter, not the
  height of `x`, because the scalar step below applies the bridge to `β x` at the level `H(x)`.
  For a solution `x` whose constants satisfy `C p ≤ H(x) ^ γ p` for a family `γ` it gives the
  exponents `conjExponent (c + γ)` at level `H(x)`
  (`NumberField.mem_approxDomain_conjSystem_of_mem_systemSet`). Both weights of `conjExponent c'`
  are `[E : K]` times those of `c'` (`NumberField.approxWeight_conjExponent`,
  `NumberField.approxAbsWeight_conjExponent`), the shift by `γ` adds `N ∑ p, γ p` to the weight, and
  the forms are independent at every place the domain reads. The constants cannot be dropped: over
  `ℚ` with the forms `(2 X, 2 Y)`, `C ∞ = 2` and `c = (1, −2)`, a normalized system, every `(k, 0)`
  is a solution and none lies in the domain of `conjExponent c` at level `k`. A system over an
  intermediate field is
  the same system over its Galois closure (`NumberField.systemSet_compRingHom`). No unit
  normalization and no Northcott are used, unlike 5.1 and 6.2.
- *Raised exponents* (`NumberField.IsNormalizedSystem.exists_raise`): since `max i, c p i = s(p)`,
  the positive exponents sum to at most `N`, and scaling the negative ones leaves weight `−δ` and
  absolute weight at most `2 N + δ`, for any number of places.
- *One scalar for the constants* (`NumberField.exists_ne_zero_systemAbs_le`, Minkowski's first
  theorem on `K`): a nonzero `S`-integer `β` with `|β|_p ^ mult p ≤ κ / C p` at every place, where
  `κ ^ t = scalarConst K S · Z ^ (2 t / N)` with `Z = N! H ^ (N [E : ℚ])` depends only on `N`,
  `H`, `[E : ℚ]`, `K` and `S`. The degree is that of the coefficient field `E`: a coefficient of
  absolute height at most `H` is at most `H ^ [E : ℚ]` at every place of the system
  (`NumberField.IsNormalizedSystem.apply_coeff_le`), so `∏ p, |det L p|_p ≤ Z ^ (2 t)`
  (`NumberField.IsNormalizedSystem.systemDet_le`), (2.4) gives `∏ C p ≤ Z ^ (2 t / N)`, and
  `scalarConst K S ≤ ∏ p, κ / C p` is the hypothesis of Minkowski's theorem. Then
  `systemValue p i (β x) ≤ κ · H(x) ^ c p i` (`NumberField.systemValue_mul`), and once
  `log H(x) ≥ NumberField.systemHeightThreshold = (2 N log (scalarConst K S) + 4 t log Z) / δ`,
  `κ ≤ H(x) ^ (δ / (2 N t))`. So the bridge applies to `β x` at the level `H(x)` of `x`, which in
  general differs from `H(β x)`, with the raised exponents shifted by `δ / (2 N t)` at every
  place. The shift costs `δ / 2` of weight: the exponents over `E` have weight `−[E : K] δ / 2` and
  absolute weight at most `[E : K] (2 N + 2)`, which are the `ε` and `A` given to 6.1. `x` lies in
  every subspace `β x` lies in, so the constants cost `systemHeightThreshold` in the threshold,
  which is linear in `log H`, and nothing in the count. Rejection test for `[K : ℚ]` in place of
  `[E : ℚ]`: over `ℚ` with `S = ∅`, let `α` be the real root of `T ^ 3 − 100 T ^ 2 − 1`, an
  algebraic integer with `100 < α < 101` whose conjugates have modulus below `1`, so that
  `H(α) = α ^ (1 / 3) < 5`. The forms `(α X, α Y)` with `C ∞ = α` and `c = (1, −2)` make a
  normalized system with `H = 5`, `D = 3`, `R = 2` and `δ = 1`, every `(k, 0)` is a solution, and
  `[K : ℚ]` would give `κ = 100 < α`, so no nonzero integer `β` would exist.
- *The thresholds are linear in the heights* (`NumberField.parametricThreshold_le`, with
  `NumberField.thresholdScale = formLogHeight + log |D_K| + ∑ v ∈ Sfin, log N v + 1`): every
  threshold of Layers 4, 5.4, 5.5 and 6.1 bounded by the heights of the entries of the matrices of
  the forms (`NumberField.logHeight₁_det_le`, `NumberField.logHeight₁_inv_apply_le`,
  `NumberField.approxConst_le`, `NumberField.inv_le_approxConst`,
  `NumberField.penultimateThreshold_le`, `NumberField.formLogHeight_wedgeForms_le`,
  `NumberField.evertseConst_le`), in the form `X ≤ exp (c Λ)`, whose coefficients add under
  products and multiply under powers.
- *Assembly* (`NumberField.exists_finset_submodule_of_forall_interval`): for any interval result
  for the conjugated forms above `X₀`, with 6.1 as one and, for `N = 2`, 5.5 as another, used once
  with the weight and absolute-weight budget of the previous item; the conjugated forms are at
  most `R [E : K]` in number (`NumberField.formCount_conjSystem_le`), the form parameter `s` of
  5.5 and 6.1 over `E`, which is why the count sees `R` and not `t`; 9.4 turns each interval into
  windows; below `X₀` one interval covers the large solutions.

## Relationship to Mathlib

Mathlib's `NumberTheory/Height/`, `NumberTheory/DiophantineApproximation/` and
`…/Transcendental/Liouville/` are the floor, and nothing there is restated. Several milestones are
not about Diophantine approximation and are written in Mathlib's namespaces and style because that
is what they are: the classification of the absolute values over a place (0.1), the fragment of
Ostrowski's theorem over a number field that Mathlib's `NumberTheory/Ostrowski.lean` proves over
`ℚ`, with `AbsoluteValue.nonarchRpow` and the bounded-on-`ℕ` criterion; `FinitePlace.mk_injective`
(6.4); `LiouvilleWith.inv` (1.1); pseudo-bases of finitely generated modules over a Dedekind domain
(4.1); `MvPolynomial.exists_sum_mul_eq_of_isHomogeneous` (8.8); the Leibniz bounds for the
determinant at an absolute value (9.2); and the complexity function with the Morse–Hedlund theorem
(7.3). Before building any of these, search the open Mathlib pull requests and the Lean Zulip and
adopt the names and shapes found there; then build it here regardless, so that adopting Mathlib's
version later is a deletion plus an import. Follow Mathlib's shape throughout: `ℝ≥0∞`-valued
invariants as `iSup`s, typed places, `AbsoluteValue.LiesOver`, `Set.integer` and `Set.unit`, and
heights through `Height.mulHeight` and the `Northcott` class.

## Worked examples

Each milestone above carries its own acceptance and rejection tests; these are the ones that keep
the central definitions honest, and each is an `example` in the file of its milestone.
- **The places must be typed.** Over `ℚ`, with the untyped set
  `{|·|, |·|^{1/2}, |·|^{1/3}, |·|^{1/4}}`, the coordinate forms and `ε = 1/12`, every `(1, q)`
  meets the Subspace inequality with equality while no finite set of lines contains them all.
  The statement with `Sinf`, `Sfin` excludes this.
- **`approxProd` is projective because `w v` lies over `v`.** With `K = F = ℚ`, `v` the real
  place and `w` the `3`-adic absolute value, scaling `x` by `3` changes `approxProd` by
  `(1/9) ^ card ι`; with `w = v` it does not.
- **Roth at `κ = 2` and the `p`-adic form at `ε = 0` are false** (3.3), and the roundtrip of 3.4
  concludes with points of `ℙ¹(K)`, not with elements of `K`.
- **The Subspace Theorem for one variable is false** (6.2): with `Fintype.card ι = 1` the roots of
  unity are solutions spanning everything.
- **6.3 is sharper than 6.2 on rational points**: the height relative to `K` of a point of
  `ℚⁿ⁺¹` is the `[K : ℚ]`-th power of its height over `ℚ`, so 6.2 over `K` applied to rational
  points loses the factor `[K : ℚ]` in the exponent, and 6.3 over `ℚ` with coefficients in `K` does
  not.
- **The `rfl` checks of 6.6** between 3.4 and its proofs from 6.3 and 6.5, and between the three
  proofs of Roth's theorem (3.2, 3.4's roundtrip, 6.6).
- **Mahler's `(3/2)^k`** (3.5): finitely many `k` with `‖(3/2)^k‖ ≤ exp (−k / 100)`.
- **Applications**: `x + y = 1` in `{2, 3}`-units (8.1), `x³ − 2 y³ = 1` over every `S` (8.4),
  `y² = x³ − 2` (8.5), `gcd (2 ^ n − 1) (3 ^ n − 1) < exp (n / 100)` eventually (8.6),
  `∑ k, 2 ^ (−2 ^ k)` transcendental (7.3).

## Ordering

```text
Layer 0 ──► Layer 1 (real numbers only; needs 0.4 for Liouville's bound)
Layer 0 ──► Layer 2 ──► 3.1 ──► 3.2 ──► 3.3 ──► 3.4, 3.5
                                  └───► 3.6, 3.7
Layer 0 ──► 4.1 ──► 4.2 ──► 4.3 ──► 4.4 ──► 4.5
3.4 (approxProd), 4.* ──► 5.1 ──► 5.2 ──► 5.3 ──► 5.4 ──► 5.5
4.5, 5.5 ──► 6.1 ──► 6.2 ──► 6.3 ──► 6.4, 6.5, 6.6, 6.7
6.3 ──► 7.1 ──► 7.2 ──► 7.3
6.5 ──► 8.1 ──► 8.2 ──► 8.6;  8.1 ──► 8.3 ──► 8.4 ──► 8.5;  8.7, 8.8 need only Layer 0
Layer 0, 4.1–4.2, 6.4 ──► 9.1 ──► 9.2 ──► 9.3 ──► 9.4 ◄── 3.6;  6.1, 9.4 ──► 9.5
```

Within this, the work splits into independent lanes once 0.1–0.3 and the conventions of 3.4 are
in place: Layer 1; Layers 2–3; Layer 4; 5.2–5.3 (pure algebra over a field of characteristic
zero, with no place in sight); 7.2–7.3's combinatorics on words; 8.3's linear algebra; 8.7–8.8;
and 9.2–9.3. Layers 3 and 6 can be built in either order: 6.6 checks that they agree, and 3.4 is
the interface 8.1–8.5 would consume if Layers 4–6 were absent. DAT's §§1.2–1.5 and §2.8, HAU 4.3
and SM Layers 0–3 are consumed by name; where one has not landed, state the milestone against the
target's pinned statement and keep going.

## Long horizon

Beyond this roadmap, each a roadmap of its own or part of one, and not to be attempted here: the
absolute and quantitative Subspace Theorem with polynomial dependence on `δ⁻¹` (Evertse 1995's
sharp Roth lemma through Faltings's product theorem, the absolute Minkowski theorem of Roy–Thunder
and Zhang; DAT §§2.5–2.8), and its applications to the complexity of algebraic numbers
(Bugeaud–Evertse 2008); Vojta's exceptional subspace (DAT §2.1); the Faltings–Wüstholz theorem for
forms of higher degree; the Subspace Theorem with moving targets (Ru–Vojta); the uniform bounds for
unit equations of Evertse–Schlickewei–Schmidt and Beukers–Schlickewei; Laurent's theorem and the
Mordell–Lang circle for tori; Siegel's theorem by the Corvaja–Zannier method; the existence of
`T`-numbers; and every effective statement.

## Provenance

Secondary to everything above: the milestones are the specification. The milestones have
sorry-free implementations in
[`rwst/Subspace-Theorems` at `09835cb`](https://github.com/rwst/Subspace-Theorems/tree/09835cb23557ae5ae0cf55a9c4ab9055f5d60338/DiophantineApproximation),
directory `DiophantineApproximation/`, with helpers in `STForMathlib/`, Apache 2.0, by the author
of this roadmap. Three items are exceptions and have none: Wirsing's first two inequalities (1.2),
the classifications with Mahler's theorem (1.3), and the acceptance tests of 9.2–9.4. That code
was written against a private height layer (`ArithmeticHeights/`) that predates DAT's and HAU's,
and it carries its own copies of Hasse derivatives, the weighted index, generalized Wronskians,
Roth's lemma and the grid lemma, which DAT and Tau Ceti now own; so a port restates each statement
in the vocabulary of the conventions table and consumes those pieces by name instead of copying
them.

| Milestone | Source files (`DiophantineApproximation/`) |
| --- | --- |
| 0.1 | `PlacesOver.lean`, `PlacesOverInfinite.lean`, `PlacesOverFinite.lean`, `Nonarchimedean.lean` |
| 0.2 | `ConjugatePlaces.lean`, `LocalExtension.lean` |
| 0.3 | `SIntegerLocalization.lean`, `SAdicHeight.lean`, `HeightTransport.lean` |
| 0.4 | `FundamentalInequality.lean`, `LiouvilleInequality.lean` |
| 1.1 | `IrrationalityExponent.lean`, `KoksmaMobius.lean`, `PolynomialSupNorm.lean`, `IrreducibleExponent.lean` |
| 1.2 | `LiouvilleExponent.lean`, `MahlerExponent.lean`, `AlgebraicExponent.lean`, `KoksmaComparison.lean`, `PolynomialEval.lean`, `RootLocation.lean`, `WirsingSystem.lean`, `WirsingThird.lean` |
| 2.1 | `CountingVolume.lean` |
| 2.2 | `AuxiliaryPolynomial.lean`, `BoxMonomial.lean`, `MonomialHeight.lean`, `IndexConditions.lean`, `MvPolynomialEvalBound.lean` |
| 3.1 | `ApproximationClass.lean`, `IndependentHeights.lean` |
| 3.2 | `RothClass.lean`, `RothAuxiliary.lean`, `RothLocalBound.lean`, `RothKeyInequality.lean`, `GlobalBound.lean`, `RothTheorem.lean` |
| 3.3 | `RationalPlaces.lean`, `RothInfinity.lean`, `RothRational.lean`, `Ridout.lean` |
| 3.4 | `ProjectiveTarget.lean`, `ApproxProd.lean`, `RothProjective.lean` |
| 3.5 | `PrimeProducts.lean`, `MahlerPowers.lean` |
| 3.6 | `GapPrinciple.lean`, `CountingApproximations.lean`, `RothIntervals.lean`, `RothSubspaceCount.lean` |
| 3.7 | `MovingTargets.lean` |
| 4.1 | `FinitePlaceValues.lean`, `ModuleCovolume.lean`, `ApproximationDomain.lean`, `ApproximationVolume.lean` |
| 4.2 | `FieldMinima.lean`, `FieldMinkowski.lean`, `ReducedIntegralBasis.lean` |
| 4.3 | `ApproximationRank.lean` |
| 4.4 | `SIntegerApproximation.lean`, `EvertseLemma.lean` |
| 4.5 | `WedgeForm.lean`, `WedgeDomain.lean` |
| 5.1 | `UnitNormalization.lean`, `SubspaceReduction.lean` |
| 5.2 | `MultiHomogeneous.lean`, `MonomialDeviation.lean`, `SubspaceAuxiliary.lean` |
| 5.3 | `FormIndex.lean`, `FormSpecialization.lean`, `GeneralizedRothLemma.lean`, `FormIndexSubspace.lean` |
| 5.4 | `LinearFormValue.lean`, `SubspaceNormal.lean`, `SubspaceHeightBounds.lean`, `ExceptionalSubspace.lean` |
| 5.5 | `LogComparison.lean`, `SubspaceValueBound.lean`, `SubspaceKeyInequality.lean`, `PenultimateMinimum.lean` (the grid lemma of `PolynomialGrid.lean`, `SmallPoint.lean` is DAT §2.6's) |
| 6.1 | `WedgeRecovery.lean`, `MinimaBounds.lean`, `ExponentGrid.lean`, `WedgeExponentBound.lean`, `WedgeDomainAt.lean`, `MinimaGrid.lean`, `ParametricSubspace.lean` |
| 6.2 | `SubspaceTheorem.lean` |
| 6.3 | `FormBaseChange.lean`, `PlaceConjugation.lean`, `ExtensionApproxProd.lean`, `SubspaceAlgebraic.lean` |
| 6.4 | `AffineProd.lean`, `SubspaceAffine.lean` |
| 6.5 | `GeneralPosition.lean`, `SubspaceGeneralPosition.lean` |
| 6.6 | `SubspaceConsistency.lean` |
| 6.7 | `SubspaceSubmodule.lean` |
| 7.1 | `SchmidtExponents.lean`, `SimultaneousSubspaces.lean`, `SimultaneousApproximation.lean`, `SimultaneousBox.lean` (consuming `OneLinearForm.lean`, `LinearFormSubspaces.lean`, `BoundedDegreeApproximation.lean`, which prove DAT's two targets) |
| 7.2 | `StammeringWords.lean`, `DigitExpansions.lean`, `RepetitionSubspaces.lean`, `TranscendenceCriterion.lean` |
| 7.3 | `FactorComplexity.lean`, `ComplexityTranscendence.lean` |
| 8.1 | `UnitEquation.lean` |
| 8.2 | `UnitEquationSeveral.lean` |
| 8.3 | `DecomposableForm.lean` |
| 8.4 | `SIntegerExtension.lean`, `ThueMahler.lean`, `BinaryForm.lean` (`ThueEquation.lean` proves DAT's Thue target over `ℤ` through Roth) |
| 8.5 | `SIntegerSquares.lean`, `Hyperelliptic.lean` |
| 8.6 | `GcdBound.lean` |
| 8.7 | `PlaceProd.lean`, `SumForms.lean`, `BalancedPoint.lean`, `SystemGrid.lean` |
| 8.8 | `LocalNullstellensatz.lean`; `STForMathlib/RingTheory/MvPolynomial/DehomogenizeIdeal.lean`, `EvalBound.lean`, `Product.lean` |
| 9.1 | `SubspaceSystem.lean`, `SystemGrid.lean` |
| 9.2 | `SubspaceGap.lean` |
| 9.3 | `DetPartition.lean`, `DetCount.lean`, `SubspaceSmall.lean` |
| 9.4 | `SubspaceIntervals.lean` |
| 9.5 | `SystemDomain.lean`, `ThresholdHeights.lean`, `ThresholdBound.lean`, `SystemSubspaceCount.lean` |

The files of the source directory that implement what DAT and Tau Ceti own (`MvHasseDeriv*.lean`,
`WeightedOrder.lean`, `PolynomialIndex.lean`, `IndexRename.lean`, `Wronskian.lean`,
`GeneralizedWronskian.lean`, `DisjointVariables.lean`, `PolynomialDeterminantHeight.lean`,
`RothDecomposition.lean`, `RothDeterminant.lean`, `RothEstimates.lean`, `RothBaseCase.lean`,
`RothLemma.lean`, `TaylorAtPrimeHasse.lean`, `BoxPrinciple.lean`, `NormForm.lean`,
`PolynomialGrid.lean`, `SmallPoint.lean`) are evidence for those roadmaps' targets, not milestones
here.

## References

- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge New Mathematical
  Monographs 4, 2006. The reference for the whole roadmap: §1.3 extensions of absolute values;
  §1.5 the fundamental and Liouville inequalities; Chapter 5 the unit equation, Thue–Mahler and the
  hyperelliptic equation; Chapter 6 Roth's theorem and its proof (6.3–6.5); Chapter 7 the Subspace
  Theorem (7.2), its applications (7.3–7.4) and its proof (7.5, Steps 0–IX); Appendix C.2. Layer 4
  replaces the adelic part of 7.5 and nothing else, and the route takes 7.5.3 (Step 0, `F = K`) with
  Remark 7.2.3.
- W. M. Schmidt, "Norm form equations", *Ann. of Math.* **96** (1972), 526–551; "Simultaneous
  approximation to algebraic numbers by rationals", *Acta Math.* **125** (1970), 189–201;
  *Diophantine Approximation*, LNM 785, Springer, 1980; *Diophantine Approximations and Diophantine
  Equations*, LNM 1467, Springer, 1991.
- H. P. Schlickewei, "The `p`-adic Thue–Siegel–Roth–Schmidt theorem", *Arch. Math.* **29** (1977),
  267–270; "The quantitative Subspace Theorem for number fields", *Compositio Math.* **82** (1992),
  245–273.
- J.-H. Evertse, "An improvement of the quantitative Subspace theorem", *Compositio Math.* **101**
  (1996), 225–311; "On the norm form inequality `|F(x)| ≤ h`", *Publ. Math. Debrecen* **56** (2000),
  337–374; "The Subspace Theorem of W. M. Schmidt", LNM 1566 (1993), 31–50; "On the Quantitative
  Subspace Theorem", *J. Math. Sci.* **171** (2010) (arXiv:1008.2268); "On sums of `S`-units and
  linear recurrences", *Compositio Math.* **53** (1984), 225–244.
- J.-H. Evertse and H. P. Schlickewei, "A quantitative version of the Absolute Subspace Theorem",
  *J. reine angew. Math.* **548** (2002), 21–127; J.-H. Evertse and R. G. Ferretti, "A further
  improvement of the Quantitative Subspace Theorem", *Ann. of Math.* **177** (2013), 513–590.
- K. F. Roth, "Rational approximations to algebraic numbers", *Mathematika* **2** (1955), 1–20;
  H. Davenport and K. F. Roth, *ibid.*, 160–167; D. Ridout, "The `p`-adic generalization of the
  Thue–Siegel–Roth theorem", *Mathematika* **5** (1958), 40–48; K. Mahler, "On the fractional parts
  of the powers of a rational number II", *Mathematika* **4** (1957), 122–124.
- Y. Bugeaud, *Approximation by Algebraic Numbers*, Cambridge Tracts in Mathematics 160, 2004;
  E. Wirsing, "Approximation mit algebraischen Zahlen beschränkten Grades", *J. reine angew. Math.*
  **206** (1961), 67–77.
- B. Adamczewski and Y. Bugeaud, "On the complexity of algebraic numbers I. Expansions in integer
  bases", *Ann. of Math.* **165** (2007), 547–565; B. Adamczewski, Y. Bugeaud and F. Luca, "Sur la
  complexité des nombres algébriques", *C. R. Acad. Sci. Paris* **339** (2004), 11–14; S. Ferenczi
  and C. Mauduit, "Transcendence of numbers with a low complexity expansion", *J. Number Theory*
  **67** (1997), 146–161; M. Morse and G. A. Hedlund, "Symbolic dynamics", *Amer. J. Math.* **60**
  (1938), 815–866.
- J.-H. Evertse and K. Győry, *Unit Equations in Diophantine Number Theory*, Cambridge Studies in
  Advanced Mathematics 146, 2015.
- P. Corvaja and U. Zannier, "On the greatest prime factor of `(ab+1)(ac+1)`", *Proc. Amer. Math.
  Soc.* **131** (2003), 1705–1709; "A lower bound for the height of a rational function at `S`-unit
  points", *Monatsh. Math.* **144** (2005), 203–224; "On the general Thue's equation", *Amer. J.
  Math.* **126** (2004), 1033–1055; *Applications of Diophantine Approximation to Integral Points
  and Transcendence*, Cambridge Tracts in Mathematics 212, 2018. Y. Bugeaud, P. Corvaja and
  U. Zannier, "An upper bound for the G.C.D. of `a^n − 1` and `b^n − 1`", *Math. Z.* **243** (2003),
  79–84.
- P. Vojta, *Diophantine Approximations and Value Distribution Theory*, LNM 1239, Springer, 1987.
