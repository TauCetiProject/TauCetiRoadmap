# Roadmap: exact arithmetic presentations and quantitative number theory

**Summary.** Build mathematical presentations of algebraic numbers, local balls, finite fields,
prime factors and number-field orders, together with integral modular data, local descent
comparisons and quantitative analytic enclosures on native library carriers. The headline theorems are Rabin's irreducibility equivalence (§0.15); Pratt
soundness, completeness and quadratic size (§§1.3–1.6); the Miller–Rabin bound (§1.9),
AKS equivalence (§1.14) and Pocklington criterion (§1.16); coprime Hensel factorization
(§§1.26–1.26a); the p-radical multiplier criterion (§2.6), Ore's residual criterion
(§2.20), the local square and prime-decomposition root criteria (§§2.22–2.23);
integral Miller and modular bases and the congruence Sturm bound (§§3.3–3.4);
the nonordinary classification below 200 and the companion eigensystem theorems
(§§3.13–3.16); complete local descent images and the finite elliptic p-saturation
criterion (§§3.19–3.26); complete root isolation (§4.19), quantitative continued
Dirichlet and cusp-form error bounds (§§4.19a, 4.20a), and Platt's finite-conductor
zero and central nonvanishing theorems (§§4.22–4.23).

The targets specify native arithmetic objects, finite presentation data, mathematical validity
predicates, and soundness and existence theorems. The scope is mathematical: existence, uniqueness, cardinality, comparison maps and explicit error inequalities on native carriers.

Suggested homes are `TauCeti/NumberTheory/Computational/` for the arithmetic adapters and
`TauCeti/Analysis/ValidatedNumerics/` for enclosure arithmetic, under the namespace
`TauCeti.Computational`. [Suggested.lean](Suggested.lean) records, in the namespace
`TauCetiRoadmap.ComputationalNumberTheory`, the headline theorems that can be stated against the pinned libraries, with only their
necessary simple definitions. The companion eigensystems use scalar extensions of the integral cusp lattices;
this document specifies every construction, API fact and Check.

## Scope and ownership

This roadmap owns:

1. **Exact presentations** (Layer 0): isolated algebraic numbers with exact arithmetic and
   equality predicates; canonical rational-centred finite `p`-adic balls; Rabin irreducibility predicates,
   finite-field presentations and changes of presentation with explicit inverses.
2. **Primality and factorization presentations** (Layer 1): Pratt trees with soundness,
   completeness and size bounds; strong liars and the Miller–Rabin bound; the AKS congruence criterion and
   its primality equivalence; Pocklington presentations; integer factor presentations; factor presentations over
   finite fields and their transport; Hensel lifting modulo prime powers; rational polynomial
   factor presentations and the existence of rational factor presentations.
3. **Order presentations and local arithmetic** (Layer 2): order bases, multiplier rings, local
   maximality, Frobenius nilradicals, `p`-radicals and the multiplier criterion, integral-basis
   presentations and their existence over any full order, prime-ideal decompositions, `φ`-adic expansions,
   `φ`-Newton sides, residual polynomials and Ore's criterion, finite local expansions, squares of
   units in finite extensions of `ℚ_p`, and roots in `ℚ_p` read off from prime decompositions.
4. **Exact modular and elliptic data** (Layer 3): integral `q`-expansion lattices at level one,
   Miller bases, the congruence Sturm bound, exact equality of coefficient data, integral Hecke
   matrices, the ordinary and nonordinary witnesses and companion eigensystems of
   Boxer–Calegari–Gee; the finite-enumeration form of point counts over finite fields, exact local images
   of the `x − T` descent map, and a finite `p`-saturation criterion by exact divisibility and reduction homomorphisms.
5. **Validated numerics** (Layer 4): signed rational interval and complex box arithmetic,
   outward dyadic rounding, unique-integer recovery, `p`-adic precision propagation, the Odlyzko
   kernel and the eight scalar quantities of Chenevier–Lannes and Chenevier–Taïbi with exact
   enclosures, complete root isolation, enclosures of Dirichlet and level-one cusp-form `L`-values,
   Platt's finite-conductor theorems, Gram negativity witnesses, finite integer ellipsoids,
   and validity of finite families.
6. **Interpretation of finite arithmetic families** (Layer 5).

It consumes the following mathematics by its existing ownership:

- **Mathlib and Tau Ceti** at the pins, listed under *Exact supplier contracts*: native
  order integrality and monogenic Dedekind criteria are inputs. The `multiplierRing` (2.2)
  variant accepts every ℤ-submodule of a characteristic-zero field, including zero;
  the native order version accepts fractional ideals of an order. `IsPMaximal` (2.3)
  permits nonmonogenic orders.
- **TauCetiRoadmap ModularForms** (Layers 7–11): `L`-functions and functional equations, modular
  symbols and the integral Hecke algebra, LMFDB labels, cusp widths and dimension formulas, and the
  level-one trace formula. The lattices of Layer 3 live on the `q`-expansion side and are
  distinct from the integral modular-symbol module there.
- **TauCetiRoadmap EllipticCurves** (Layers 1, 3, 4, 6, 7): isogenies and formal groups, the Hasse
  bound, reduction of points and the filtration `E₁ ⊆ E₀ ⊆ E` over local fields, Mordell–Weil with
  explicit `2`-descent and Nagell–Lutz, and Selmer groups. Layer 3 adds presentations on top of
  those objects; it does not construct them again.
- **EllipticLegendreCharacterInterfaces** §§5.1–5.2: the character-sum point count and the trace
  of quadratic twists for Weierstrass equations with `a₁ = a₃ = 0` over every finite field of odd
  characteristic, singular equations included. Section 3.17 keeps the finite-enumeration form of
  the count and its comparison with these identities.
- **TauCetiRoadmap LocalFieldsRamification** (Layers 0–1): complete discretely valued fields,
  uniformizers, residue fields, ramification indices and residue degrees, Teichmüller
  representatives. Its Layer 2 supplies surjectivity of the norm on units in unramified
  extensions, provided by `TauCeti.map_normUnits_unitFiltration` at depth zero in
  `NumberTheory/LocalField/Norm/Unramified/Basic`; this is an input to the good-odd-prime count.
- **TauCetiRoadmap RealAlgebraicGeometry** (Layers 1–4): Sturm–Tarski, signed remainder sequences,
  subresultants, distinct-root counts, root separation and multiplicity-sensitive root matching.
  Layers 0 and 4 add finite rational presentations and rational-box comparison on top of that theory.
- **TauCetiRoadmap PolynomialGaloisGroups** (Layer 5): degrees of irreducible factors over a finite
  field are Frobenius orbit sizes. Layer 0 turns this into a checked irreducibility presentation.
- **[NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md)** (Layers 3, 5 and 7): the index–discriminant identity,
  Kummer–Dedekind under its index hypothesis, explicit integral bases, rank-one unit presentations,
  and the global completion decomposition with its local/global invariant comparisons (§§5.3, 5.5).
  Layer 2 adds full-order presentations and local maximality comparisons.
- **ClassicalArithmeticCompletion** §§3.3, 3.5, 3.25, 3.27, 3.33 and 3.48 supplies Smith and
  column Hermite decompositions, pivot indices, ordinary Newton polygons and Hermite bases.
  Its §§5.1–5.3, 5.10–5.11, 5.16 and 5.22 own factor-base generation, relation lattices,
  class-group quotients, regulator index comparisons and joint class–unit completeness.
  This roadmap consumes these comparisons; it defines no second relation lattice or stopping bound.
- **AlgebraicModularFormsAndSerreWeights** (Layers R15.1–R15.3, R15.5): the `q`-expansion
  principle and bounded denominators at level one, the theta operator and the Hasse invariant, and
  the Deligne–Serre lifting of residual eigensystems to characteristic zero.
- **[ContourIntegration](../../Completed/ContourIntegration/README.md)** Layer 3: the
  null-homologous argument principle with multiplicities and pole corrections, including its
  star-convex specialization. Layer 4 applies this interface on rectangular contours.
- **ZerosOfLFunctions** §§4.1, 4.3–4.4, 4.9, 7.1–7.2a and Layer 9 own generic divisor and
  zero counts, rectangle boundaries and their argument principle, and abstract localization
  semantics. Section 4.21a adds the native Dirichlet normalization, the symmetric
  character/conjugate-character count comparison, and explicit Turing upper bounds.
- **HeightsRationalPointsAndObstructions** (§1.17): the index of multiplication by two on the
  points of an abelian variety over a local field, used for the size check of local images.
- **NewtonPolygons** §§0.1, 0.3 and 3.2 supplies lower convex envelopes, maximal supporting
  faces and polygon sums. The φ-Newton objects in §§2.18–2.20 differ by applying that geometry
  to polynomial-valued φ-coefficients and by retaining residue-field data and the φ-divisible part.
- **FormalLaurentPuiseux** L5 owns coprime factor lifting over K[[t]]. The complete-DVR
  statement in §1.26a differs by allowing every complete DVR, including mixed characteristic
  and arbitrary residue field; no separate K[[t]] lifting target is specified here.
- **IntegralLattices** Layer 2, milestone 2A owns positive-definite bounded-norm
  finiteness. Sections 4.26–4.27 add the rational affine-coordinate comparison and exact
  boundary membership; they use that finiteness theorem without a second lattice carrier.
- **GlobalNumberFields** Layer 11 owns intrinsic orders and their fractional ideals. The
  finite rational bases in §2.1 and arbitrary-submodule stabilizers in §2.2 are presentation
  comparisons with those carriers, rather than another order or ideal-class theory.

The common foundations used by EffectiveDiophantineMethods have one owner here:

| Foundation owned here | Consumer refinement in EffectiveDiophantineMethods |
| --- | --- |
| Canonical rational-centred p-adic records and normalization (§§0.14, 4.10–4.13) | Enclosures of a specified value (§0.1), and balls in general number-field completions (§0.9) |
| Rectangular isolated-root presentations, arithmetic, equality and complete isolation (§§0.8–0.13, 4.19) | Squarefree annihilators, labelled embeddings, discs and quantitative refinement (§§0.2–0.3) |
| Local-image spans, cardinality completeness and good-odd-prime equality (§§3.18–3.21) | Factorwise coordinates, square witnesses and global Selmer data (§§3.2–3.5) |
| Generic p-saturation, finite-index and joint-reduction criteria (§§3.22–3.25) | Height and index data and Mordell–Weil assembly (§§3.17–3.22) |
| Rational affine ellipsoid membership and its reduction to IntegralLattices 2A (§§4.26–4.27) | LDL identities and Fincke–Pohst tail witnesses (§§1.7–1.8) |

These consumer refinements retain their extra data and use the shared objects through
value-, subgroup- and membership-preserving comparisons described under *Downstream consumers*.
The direction of supply is from this roadmap to EffectiveDiophantineMethods.

Downstream roadmaps build on this one and are listed at the end. In particular the `2`-Selmer
groups, rank bounds, canonical-height enclosures, index bounds and Mordell–Weil bases of elliptic
curves are built on Layers 2–4 by the effective Diophantine roadmap, while intrinsic automorphic positivity statements are outside this roadmap's scope.

## Conventions

Carriers are universe-polymorphic (`Type*`) where Mathlib permits it; ℚ, ℝ and ℂ and their
standard embeddings are fixed. Finite index types are `Fin n`, and `Nat.card` is used for
intrinsic finite cardinalities without choosing an enumeration. Every arithmetic theorem
carries its own primality, finite-generation, completeness and scalar-tower hypotheses.

* A rational interval is Mathlib `NonemptyInterval ℚ`, with ordered closed endpoints. A complex
  box is a pair of such intervals; its denotation is a subset of `ℂ`. An isolated algebraic root
  decodes into ℂ with membership in `algebraicClosure ℚ ℂ`; its rectangle is a set of possible values.
* Polynomials use `Polynomial`; quotient rings and fields use `AdjoinRoot` and `AdjoinRoot.mk`.
  Distinct roots and roots counted with multiplicity are kept apart. A nonzero constant has no
  roots, and finite root-list existence requires a nonzero polynomial.
* A finite field is presented over its prime field `ZMod p`, or over a smaller presented field,
  as `AdjoinRoot f` with `f` monic with a proof of irreducibility; there is one prime field and no
  second copy of it. Changes of presentation carry both directions explicitly.
* A `p`-adic approximation describes a ball, with absolute precision `N`, valuation lower bound
  `v`, and relative precision `N − v` when its mantissa is nonzero. Zero mantissa describes
  `p^N ℤ_p`. Mathlib's `padicValRat` is `0` at `0`; the polynomial valuation here uses `WithTop ℕ`
  so that the zero polynomial has valuation `∞`.
* Matrices act on column vectors. A Hecke matrix entry `(i, j)` is the `i`-th coordinate of the
  image of basis vector `j`. Level-one `q`-expansions have width one; a finite-index subgroup uses
  its actual strict cusp width. Eisenstein series have constant term one and `Δ = q + ⋯`.
* An elliptic curve over `ℚ` in Layer 3 is a `WeierstrassCurve` with `a₁ = a₃ = 0`
  (Mathlib `IsCharNeTwoNF`) and integral `a₂, a₄, a₆`; its cubic is
  `f = X³ + a₂X² + a₄X + a₆`, its étale algebra `A = ℚ[X]/(f)` and its descent map is Tau Ceti's
  `x − T` map into `A^×/A^×²`. A place `v` is a prime `p` or the real place, with `|2|_v` the
  normalized absolute value (`|2|_2 = 1/2`).
* Entrywise matrix bounds control quadratic forms only on vectors with nonnegative coordinates.
  Bounds for arbitrary real vectors need a positive-semidefinite difference or full interval
  arithmetic.
* A class-group relation matrix supplies checked relations, not their completeness. The unit
  regulator index is measured after adjoining all torsion units. A numerical inequality is used
  only together with its rigorous remainder bound.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Elementary arithmetic and primality: `lucas_primality`, `reverse_lucas_primality`
  (`Mathlib.NumberTheory.LucasPrimality`),
  `Nat.primeFactorsList`, `Nat.prod_primeFactorsList`, `Nat.prime_of_mem_primeFactorsList` (`Mathlib.Data.Nat.Factors`),
  `padicValRat` (`Mathlib.NumberTheory.Padics.PadicVal.Basic`),
  `PadicInt.toZModPow` (`Mathlib.NumberTheory.Padics.RingHoms`),
  `hensels_lemma` (`Mathlib.NumberTheory.Padics.Hensel`, a root-lifting theorem).
- Polynomials and finite fields: `AdjoinRoot`, `AdjoinRoot.equiv'`, `AdjoinRoot.algHom_ext` (`Mathlib.RingTheory.AdjoinRoot`),
  `PowerBasis.ofAdjoinEqTop` (`Mathlib.RingTheory.Adjoin.PowerBasis`), `Polynomial.Monic.irreducible_iff_natDegree` (`Mathlib.Algebra.Polynomial.Monic`),
  `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X` (`Mathlib.FieldTheory.Finite.Extension`), `FiniteField.algEquivOfCardEq` (`Mathlib.FieldTheory.Finite.GaloisField`),
  `FiniteField.frobeniusAlgHom` (`Mathlib.FieldTheory.Finite.Basic`), `UniqueFactorizationMonoid.normalizedFactors_prod_eq`
  (`Mathlib.RingTheory.UniqueFactorizationDomain.NormalizedFactors`),
  `Polynomial.norm_coeff_le_choose_mul_mahlerMeasure_of_one_le_mahlerMeasure`
  (Mignotte-type bound for a factor), `Polynomial.mahlerMeasure_le_sum_norm_coeff`
  (the coefficient-norm bound), both in `Mathlib.Analysis.Polynomial.MahlerMeasure`,
  `quadraticChar` (`Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic`).
- `Complex.exists_continuousOn_eqOn_exp_comp` (`Mathlib.Analysis.Complex.BranchLogRoot`):
  continuous logarithm branches on open simply connected domains where the function never vanishes;
  `Complex.Gamma_ne_zero_of_re_pos` (`Mathlib.Analysis.SpecialFunctions.Gamma.Beta`)
  and `Complex.differentiableAt_Gamma` (`Mathlib.Analysis.SpecialFunctions.Gamma.Deriv`)
  apply on the right half-plane.
- `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`,
  `Real.tendsto_eulerMascheroniSeq` and `Real.tendsto_eulerMascheroniSeq'`
  (`Mathlib.NumberTheory.Harmonic.EulerMascheroni`): lower and upper harmonic–logarithm
  bounds converging to Euler's constant.
- Algebraic numbers and intervals: `algebraicClosure`, `mem_algebraicClosure_iff`
  (`Mathlib.FieldTheory.AlgebraicClosure`), `Polynomial.finite_setOfPred_isRoot`
  (`Mathlib.Algebra.Polynomial.Roots`, applied after coefficient extension to ℂ),
  `NonemptyInterval` (`Mathlib.Order.Interval.Basic`; its multiplication is the monotone one and does not apply to signed
  rational endpoints; its inverse is a group inverse, not a field reciprocal).
- Number fields: `NumberField.classNumber`,
  `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib.NumberTheory.NumberField.ClassNumber`),
  `ClassGroup.mk0` (`Mathlib.RingTheory.ClassGroup`),
  `NumberField.Units.regOfFamily_div_regulator` (`Mathlib.NumberTheory.NumberField.Units.Regulator`),
  `Ideal.radical` (`Mathlib.RingTheory.Ideal.Operations`).
- Submodule division: `Submodule.mem_div_iff_forall_mul_mem`,
  `Submodule.mem_div_iff_smul_subset` and `Submodule.le_div_iff_mul_le`
  (`Mathlib/Algebra/Algebra/Operations.lean`, lines 875–885) identify I / J with
  the elements x for which xJ⊆I. Section 2.2 packages I / I as a ℤ-subalgebra.
- Modular forms and `L`-functions: `ModularForm.dimension_level_one`,
  `ModularForm.sturm_bound_levelOne_nat`
  (`Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula`), `ModularForm.weakFEPair`, `ModularForm.L` (`Mathlib.NumberTheory.ModularForms.LFunction`),
  `WeakFEPair.functional_equation` (`Mathlib.NumberTheory.LSeries.AbstractFuncEq`), `DirichletCharacter.LFunction` (`Mathlib.NumberTheory.LSeries.DirichletContinuation`),
  `DirichletCharacter.IsPrimitive` (`Mathlib.NumberTheory.DirichletCharacter.Basic`),
  `DirichletCharacter.completedLFunction`, `DirichletCharacter.gammaFactor`,
  `DirichletCharacter.LFunction_eq_completed_div_gammaFactor`,
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`
  (`Mathlib.NumberTheory.LSeries.DirichletContinuation`),
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`
  (`Mathlib.NumberTheory.LSeries.Nonvanishing`), `Complex.digamma`, `Complex.digamma_one`, `Complex.digamma_apply_add_nat`
  (`Mathlib.Analysis.SpecialFunctions.Gamma.Digamma`, recurrence with all poles excluded),
  `CuspFormClass.qExpansion_isBigO` (`Mathlib.NumberTheory.ModularForms.Bounds`), and
  `ModularForm.L` (`Mathlib.NumberTheory.ModularForms.LFunction`);
  `ModularForm.discriminant_eq_q_prod` (`Mathlib.NumberTheory.ModularForms.Discriminant`)
  identifies the normalized discriminant with its convergent q-product.
- Elliptic curves: `WeierstrassCurve.IsCharNeTwoNF`
  (`Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms`), `WeierstrassCurve.Affine.equation_iff`
  (`Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic`, the affine equation as the displayed
  polynomial identity), the division polynomials `WeierstrassCurve.Φ`
  and `WeierstrassCurve.ΨSq` with `WeierstrassCurve.natDegree_Φ`, `WeierstrassCurve.leadingCoeff_Φ`
  and `WeierstrassCurve.natDegree_ΨSq`
  (`Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Degree`); the polynomial
  definitions are in `Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Basic`.
- Scalar extension of integer operators: `LinearMap.baseChange`
  (`Mathlib/LinearAlgebra/TensorProduct/Tower.lean`, line 657) acts on pure tensors
  by applying the original map to the second factor; `Module.Basis.baseChange`
  (`Mathlib/LinearAlgebra/TensorProduct/Basis.lean`, line 63) extends a basis.
- Finite analytic expressions: `ascPochhammer` (`Mathlib/RingTheory/Polynomial/Pochhammer.lean`,
  line 50) is the rising-factorial polynomial, and `bernoulli`
  (`Mathlib/NumberTheory/Bernoulli.lean`, line 194) uses B₁=−1/2.
  `ModularForm.weakFEPair` and `ModularForm.L`
  (`Mathlib/NumberTheory/ModularForms/LFunction.lean`, lines 61 and 134) fix the
  Fricke factor i^k and the uncompleted L-value normalization.
- Matrices: `Matrix.PosDef` and `Matrix.PosSemidef` (`Mathlib.LinearAlgebra.Matrix.PosDef`).

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `TauCeti.Contour.argumentPrinciple_starConvex` (`TauCeti.Analysis.Contour.StarConvex`)
  and `TauCeti.Contour.argumentPrinciple_nullHomologous`
  (`TauCeti.Analysis.Contour.Argument.Cycle`): on a closed piecewise-C¹ contour avoiding
  the zeros and poles, the log-derivative integral is the winding-weighted sum of
  meromorphic orders. A convex neighborhood of the rectangle supplies null-homology;
  only finitely many zeros and poles occur in its compact closure.
- `TauCeti.GlobalNumberFields.NumberFieldOrder.isIntegral`
  (`TauCeti.NumberTheory.NumberField.Global.Orders.Basic`),
  `TauCeti.GlobalNumberFields.NumberFieldOrder.multiplierRing`
  (`TauCeti.NumberTheory.NumberField.Global.Orders.ProperIdeal`), and
  `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff`
  (`TauCeti.NumberTheory.NumberField.Index.DedekindCriterion`).
- `TauCeti.unitFiltration_le_range_powMonoidHom_two`
  (`TauCeti.NumberTheory.LocalField.Squares`), with explicit local-field and characteristic
  assumptions: units of depth `2*v_L(2)+1` are squares.

- `TauCeti.ModularForm.eq_of_sturm_bound` (equality of two forms on a finite-index subgroup from
  agreement of their coefficients up to the Sturm bound at the actual strict width;
  `TauCeti.NumberTheory.ModularForms.SturmBound`) and
  `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`
  (`TauCeti.NumberTheory.ModularForms.HeckeSlash.Recurrence`; the coefficient recurrence of `T_p` on `Γ₁(N)` with its nebentypus and coprimality hypotheses).
- `CuspForm.hasEntireExtension_qExpansion_coeff` (the coefficient Dirichlet series of a cusp form
  continues to the native `L`-function, with the cusp-width factor;
  `TauCeti.NumberTheory.ModularForms.LFunction.Basic`).
- `TauCeti.kernelBasis` with `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis`,
  `linearIndepOn_kernelBasis` and `length_kernelBasis` (the field-kernel basis comparison;
  `TauCeti.LinearAlgebra.Matrix.Echelon.KernelBasis`).
- `WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_def`, `WeierstrassCurve.frobeniusTrace`,
  `WeierstrassCurve.frobeniusTrace_def` and `WeierstrassCurve.pointCount_eq_card_point` (the
  projective count as `Nat.card` of all affine solutions plus one, singular point included, the
  trace `q + 1` minus that count, and its comparison with Mathlib's point type on an elliptic model;
  `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`).
- `WeierstrassCurve.quadraticTwistOf` (`TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic`):
  with `a₁ = a₃ = 0`, the twist by `(0, −d/4)` multiplies `a₂, a₄, a₆` by `d, d², d³`.
- The `x − T` descent: `WeierstrassCurve.Affine.A`, `WeierstrassCurve.Affine.M`,
  `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.ker_μ_eq`,
  `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`, `WeierstrassCurve.Affine.localRes`,
  `WeierstrassCurve.Affine.localCondition`, `WeierstrassCurve.Affine.mem_localCondition_iff`,
  `WeierstrassCurve.Affine.selmerGroupA`, `WeierstrassCurve.Affine.normM`,
  `WeierstrassCurve.Affine.card_ker_nsmul_two`, all for `W : WeierstrassCurve.Affine K` with
  `[W.IsElliptic] [W.IsCharNeTwoNF]`. Their modules are
  `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT` (A, M, μ, its kernel,
  `μX_of_eval_f_ne_zero`, `normM`),
  `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition` (local restriction
  and condition), `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA`
  (`selmerGroupA`), and `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.TwoTorsion`
  (`card_ker_nsmul_two`).
- `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul` (if `n • P = P′` then
  `x(P′)·ΨSq_n(x(P)) = Φ_n(x(P))`;
  `TauCeti.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Descent`).

- `TauCeti.map_normUnits_unitFiltration`
  (`TauCeti.NumberTheory.LocalField.Norm.Unramified.Basic`), at depth zero for finite
  unramified extensions, supplies surjectivity of the unit norm.
- `TauCeti.isOpen_range_powMonoidHom`
  (`TauCeti.NumberTheory.LocalField.PowerSubgroup.Open`) gives openness of nonzero square
  classes in characteristic different from two.
- `WeierstrassCurve.Affine.range_μ_le_selmerGroupA` and
  `WeierstrassCurve.Affine.range_μ_le_ker_normM`
  in `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA` and
  `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT`, respectively, supply the two
  inclusions at integral good models with 2 invertible.

### From TauCetiRoadmap.ModularForms

Layers 7–11 supply the functional equation with its Fricke sign, modular-symbol and integral
Hecke-algebra comparisons, labels, strict cusp widths, congruence-subgroup index and dimension
conventions, and the level-one trace formula. Equality of finite-index forms uses their actual
strict cusp width and coefficients including index zero.

### From TauCetiRoadmap.EllipticCurves

Layer 4 supplies the homomorphism on points at good reduction; Layer 6 supplies the
Mordell–Weil group and the exact rational torsion subgroup. Apply the rational-point reduction
map only at a good prime. Descent in this roadmap uses the pinned x − T carriers listed above.

### From TauCetiRoadmap.EllipticLegendreCharacterInterfaces

§5.1, “Character-sum point counts and symmetric cubics”, supplies for every finite field F of odd
characteristic with q elements and every Weierstrass equation W over F with a₁ = a₃ = 0, singular
or not, the identity (W.pointCount : ℤ) = q + 1 + Σ_x quadraticChar F (f(x)), with
f(x) = x³ + a₂x² + a₄x + a₆, and W.frobeniusTrace = −Σ_x quadraticChar F (f(x)). §5.2,
“Quadratic-twist trace over odd finite fields”, supplies, with decidable equality on F and for
every d ∈ F, the trace of W.quadraticTwistOf 0 (−d/4) as quadraticChar F (d) times
W.frobeniusTrace, with no ellipticity or d ≠ 0 hypothesis. Section 3.17 applies both to Tau Ceti's
projective count through its enumeration; the square-root count is not reproved here.

### From TauCetiRoadmap.LocalFieldsRamification

Layer 0 supplies local fields, finite extensions, normalized uniformizers, residue maps and
ramification/residue degrees; Layer 1 supplies Teichmüller sections. Layer 2 supplies surjectivity
of the norm on units for finite unramified extensions, with compatible base-field embeddings.

### From Completed.NumberFieldArithmetic

Layers 3 and 7 supply the index–discriminant and integral-basis comparisons.
Sections 5.3 and 5.5 supply `semilocalEquiv`, `completionFactorsEquivPlaces`,
`factorFieldEquivCompletion`, and the separate comparisons of completion ramification indices
and residue degrees with `Ideal.ramificationIdx` and `Ideal.inertiaDeg`. Apply these with the
minimal-polynomial and generating-root hypotheses, before the local degree formula for K/ℚ.

### From Completed.ContourIntegration

Layer 3 supplies the null-homologous argument principle, realized by
`TauCeti.Contour.argumentPrinciple_nullHomologous` and its star-convex specialization
`TauCeti.Contour.argumentPrinciple_starConvex`. Use an open neighborhood of the contour,
analyticity and nonvanishing off a finite set containing every zero and pole, meromorphy
and the correct order at those points, a closed piecewise-C¹ contour avoiding the set,
and null-homology in that neighborhood. A convex neighborhood of a rectangle supplies
null-homology. The two conductor-one poles are retained in §4.21a.

### From TauCetiRoadmap.ZerosOfLFunctions

Sections 4.1, 4.3–4.4 and 4.9 supply `divisorCount`, `zeroCount`, half-open height
additivity and monotonicity, and the distinction between positive and symmetric counts.
Sections 7.1–7.2a supply `rectBoundary`, its positive orientation and winding numbers,
and the rectangle argument principle with localization to a relatively compact
neighborhood. Apply these with nondegenerate rectangles, a meromorphic function on an
open neighborhood, and pointwise analyticity and nonvanishing on the boundary; the
finite singular set is obtained inside that neighborhood. A zero meromorphic order
alone does not supply boundary regularity. Convert the signed divisor count into the
zero count only after accounting for all poles. Layer 9 supplies abstract localization
semantics; §4.21a adds arithmetic inequalities that establish equality with a sign-change
lower count, rather than another abstract localization relation.

### From TauCetiRoadmap.RealAlgebraicGeometry

Layers 1–3 supply real closed-field root and sign counts, signed remainder/subresultant
comparisons and root separation. Layer 4 supplies multiplicity-sensitive matching of complex
roots in fixed-degree coefficient families. These statements distinguish distinct values from
roots with multiplicity and require nonzero polynomials where finiteness is used.

### From TauCetiRoadmap.PolynomialGaloisGroups

Layer 5, “Factor degrees are Frobenius orbit sizes”, identifies monic irreducible-factor degrees
of a squarefree finite-field polynomial with the orbit sizes of x ↦ x^q on its roots.

### From TauCetiRoadmap.NewtonPolygons

Sections 0.1 and 0.3 supply lower convex envelopes and maximal supporting faces; §3.2 supplies
polygon sums. Here the input sequence is the valuation of each φ-coefficient. Nonzero input,
finite support and the −∞ part are explicit in §§2.18–2.19a.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- ClassicalArithmeticCompletion §3.3 `IntMatrix.IsSmithDecomposition`; §3.5
  `IntMatrix.IsHermiteNormalForm`; §3.25 `IntMatrix.IsHermiteDecomposition`; §3.27
  (index equals the product of positive Hermite pivots); §3.48 (the unique Hermite basis
  of a sublattice). Matrices act on columns and the Hermite convention is upper triangular.
- ClassicalArithmeticCompletion §§5.1–5.3, 5.10–5.11, 5.16 and 5.22:
  `classGroupPresentation`, `relationLattice`, `ClassGroupPresentation.index_relationLattice`,
  Minkowski generation, the full-rank found-relation index comparison, and the regulator
  and joint completeness inequalities. Use nonzero ideals generating the class group,
  a relation matrix with nonzero determinant, and an `IsMaxRank` unit family together
  with all torsion units; any analytic lower bound for `h_K*R_K` is a separate input.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

- R15.1, “Level-one and level-two descent”, supplies the level-one geometric comparison
  after inverting 6. R15.2, “The integral cusp lattice and its reduction image”, supplies
  the localized coefficient lattice and the image of its geometric reduction map.
  Section 3.13a identifies our integer Fourier lattice after localization and reduction
  with those inputs before R15.3 is applied; arbitrary Katz cusp forms are not identified
  with the reduction image. R15.3 (theta
  operator with the shift `a_ℓ ↦ ℓ·a_ℓ`, Hasse invariant), R15.5 (Deligne–Serre lifting of a
  residual eigensystem to a characteristic-zero eigenform).

### From TauCetiRoadmap.IntegralLattices

Layer 2, milestone 2A supplies finiteness of `{x in L | B(x,x) <= C}` for every
positive-definite integral lattice L and rational C. Section 4.26 applies it after
clearing denominators in G and in the rational translate t; it constructs no new
lattice, bounded-norm theorem, reduction theory or successive-minimum interface.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

- §1.17 `card_quotient_two_padic`, with its real analogue: `#(A(F)/2A(F)) = |2|_F^(−g)·#A(F)[2]` for an abelian
  variety of dimension `g` over a finite extension `F` of `ℚ_p`, and `#A(ℝ)[2]/2^g` over `ℝ`.
  The nonarchimedean formula follows from Mattuck, Theorem 7, p.114: choose an open
  finite-index subgroup isomorphic to the additive group of the ring of integers in `F`
  to the power `g`, and compare multiplication by two on this subgroup and its finite
  quotient. The finite quotient's kernel and cokernel have equal size. Over `ℝ`, use the
  connected compact real torus and its finite component group instead. FPS §7 applies
  this argument in dimension two; Layer 3 uses its dimension-one specialization.

## How to read the build

Layer 0 fixes exact presentations and their native meanings. Layer 1 supplies primality
criteria and factor presentations. Layer 2 develops order presentations, prime decompositions,
φ-Newton factorization and local square and root criteria. Layer 3 binds integral Fourier
coefficients and matrices to modular forms, and finite local-image and divisibility data to
elliptic curves. Layer 4 supplies quantitative analytic error estimates and rational enclosures,
finite ellipsoid sets and Gram inequalities. Layer 5 interprets finite families using these
comparisons. Root presentation arithmetic specifies existence independently of the disjoint-root
existence theorem in Layer 4.

## Layer 0: exact presentations

Build exact presentations and their native decoding maps. The targets concern
algebraic numbers, local balls and finite-field extensions; their statements are independent
of how the finite data are obtained.

### 0.8 Isolated algebraic root presentation (`IsolatedAlgebraicRoot`)

This is a presentation adapter for Mathlib's relative algebraic closure. Its native
intermediate-field structure supplies closure under addition, multiplication and inversion.
A nonzero polynomial has finitely many distinct complex roots, separated by rational rectangles.
Arb §5 (Arb line 779) supplies only the meaning of enclosing a value and bounding its error.

An IsolatedAlgebraicRoot stores a nonzero polynomial f∈ℚ[X], two closed rational intervals R,I, and a proof that exactly one complex z satisfies f(z)=0 and Re(z)∈R, Im(z)∈I. Repeated polynomial roots are permitted: uniqueness concerns distinct roots, not their multiplicities. The decoded value lies in ℂ, with a proof of membership in the native relative algebraic closure of ℚ; the finite polynomial and rectangle present that value. The uniqueness proof is a separate checked obligation, not inferred from small diameter.

- The decoded root belongs to the native relative algebraic closure.
- `IsolatedAlgebraicRoot.value`: Decode the unique root in ℂ, together with its algebraicity comparison.
- The decoded value is a root lying in both displayed intervals.
- Any root in the rectangle equals the decoded value.

Use native Polynomial and NonemptyInterval for finite data. Define the root-and-rectangle predicate explicitly and require unique existence. The uniqueness proof is part of the mathematical presentation. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* Mathlib `algebraicClosure`; Mathlib `mem_algebraicClosure_iff`; Mathlib `NonemptyInterval`.

**Checks.**

- *Degenerate case.* X with both intervals [0,0] isolates zero.
- *Computed value.* X² with the singleton zero rectangle is allowed.
- *Non-example.* X²−1 cannot isolate a unique root in [−2,2]×[0,0].

### 0.9 Exact rational root presentation

For r∈ℚ, its rational root presentation consists of X−r, the singleton real interval [r,r] and singleton imaginary interval [0,0]. Its decoded value is the native embedding of r into the complex algebraic numbers. Integers and rationals themselves use native ℤ and normalized ℚ; no new arithmetic carrier is introduced.

- Decoding is the rational algebra map.
- Rational addition commutes with decoding.
- Rational multiplication commutes with decoding.

The linear polynomial has exactly the root r. The rational casts commute with addition and multiplication by the existing field homomorphism laws. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* `IsolatedAlgebraicRoot` (0.8).

**Checks.**

- *Degenerate case.* Zero decodes to zero.
- *Computed value.* One half plus one third decodes as five sixths.
- *Non-example.* One half and one third have different decoded values.

### 0.9a Every algebraic value has an isolated presentation

For every z∈ℂ algebraic over ℚ, prove that there is an
`IsolatedAlgebraicRoot` whose value is z. Choose a nonzero annihilating polynomial and
separate z from its other finitely many distinct roots by a closed rational rectangle
with z in its interior. Rationality of z is unnecessary; repeated roots remain single values.
This is finite-root separation on Mathlib `IsAlgebraic` and `mem_algebraicClosure_iff`
(`Mathlib/FieldTheory/AlgebraicClosure.lean`, line 54).
*Needs:* §0.8; native polynomial root finiteness and density of ℚ in ℝ.

**Checks.**

- A rational z has the singleton presentation of §0.9.
- The repeated root of X² has one value and admits the singleton zero rectangle.
- A rectangle containing both roots of X²−1 fails uniqueness, regardless of their multiplicities.

### 0.10 Addition of isolated algebraic numbers

Given isolated algebraic inputs a,b, there exists an isolated-root presentation whose value is their sum.

Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* `IsolatedAlgebraicRoot` (0.8); every algebraic value has an isolated presentation (0.9a); Mathlib `algebraicClosure`.

### 0.11 Multiplication of isolated algebraic numbers

Given isolated algebraic inputs a,b, there exists an isolated-root presentation whose value is their product.

Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* `IsolatedAlgebraicRoot` (0.8); every algebraic value has an isolated presentation (0.9a); Mathlib `algebraicClosure`.

### 0.12 Inversion of a nonzero algebraic number

Given an isolated algebraic input a with nonzero decoded value, there exists an isolated-root presentation whose value is its inverse.

Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* `IsolatedAlgebraicRoot` (0.8); every algebraic value has an isolated presentation (0.9a); Mathlib `algebraicClosure`.

### 0.13 Equality of isolated algebraic numbers

The equality predicate compares the decoded native algebraic numbers of two exact isolated-root presentations. It is the proposition that their values are equal; overlapping rectangles alone do not prove equality, and disjoint rectangles are only a sufficient inequality test.

- The proposition is equality in the native relative algebraic closure.
- Every presentation equals itself.
- The verdict is symmetric.

Use equality of the decoded values. A common root of both annihilating polynomials in both isolating rectangles characterizes this equality. (Mathlib `algebraicClosure` and `mem_algebraicClosure_iff`,
`Mathlib/FieldTheory/AlgebraicClosure.lean`, lines 39 and 54.) *Needs:* `IsolatedAlgebraicRoot` (0.8).

**Checks.**

- *Degenerate case.* Two rational zero inputs compare equal.
- *Computed value.* Different rational expressions for the same number compare equal.
- *Non-example.* One half and one third compare unequal.

### 0.14 Canonical finite p-adic approximation

For prime p, p-adic approximation p stores integers N,v and a natural mantissa s. It is either (N,N,0), or v<N with 0<s<p^(N−v) and p∤s. Its centre is p^v·s∈ℚ and its denotation is {x∈ℚ_p | ‖x−centre‖≤p^(−N)}. N is absolute precision and N−v is relative precision in the nonzero case. Zero mantissa means the entire ball p^Nℤ_p, not the exact number zero.

- The exact rational centre is p^v s.
- The ball has radius p^(−N) in the native p-adic field.
- The centre always belongs to its ball.
- Zero belongs precisely to the zero-mantissa ball.

Store the two normalization alternatives. Use a rational centre and the native p-adic field/norm to define the closed ball. Prime p is a hypothesis of semantic theorems; syntax is parameterized by p. ([CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.) *Needs:* Mathlib `padicValRat`; Mathlib `PadicInt.toZModPow`.

**Checks.**

- *Degenerate case.* The canonical zero ball at precision N has valuation N.
- *Computed value.* The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3.
- *Non-example.* A nonzero mantissa divisible by p cannot be canonical.

### 0.15 Rabin irreducibility criterion (`RabinCriterion`)

For a finite field F of cardinality q and f ∈ F[X], `RabinCriterion f`
is the proposition that f is monic of positive degree n, that `f ∣ X^(q^n)-X`, and that
`IsCoprime (X^(q^(n/s))-X) f` for every prime s dividing n. Coprimality means existence
of a Bézout identity, expressed intrinsically in F[X].

- The polynomial is monic.
- The stated conditions imply irreducibility.
- Every monic irreducible polynomial satisfies the conditions.

The acceptance theorem `rabin_iff_irreducible` states both directions.

Rabin's criterion: a monic f of degree n ≥ 1 is irreducible exactly when f divides X^(q^n) − X and gcd(X^(q^(n/s)) − X, f) = 1 for every prime s dividing n. For soundness, X^(q^n) − X is the product of the monic irreducibles whose degree divides n, each once; so f is squarefree and each irreducible factor has degree d dividing n. The Bézout identities show that no factor divides X^(q^(n/s)) − X, so d does not divide n/s for any prime s dividing n, which forces d = n and a single factor. For completeness, an irreducible f of degree n divides X^(q^n) − X and is coprime to X^(q^(n/s)) − X, and Bézout identities exist in the Euclidean domain F[X]. ([Shoup](#source-shoup), Exercise 20.2(a), printed p.524; Theorem 19.10, p.513; Algorithm IPT and Theorem 20.1, §20.1, p.523.) *Needs:* Mathlib `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`; Mathlib `Polynomial.Monic.irreducible_iff_natDegree`; TauCetiRoadmap PolynomialGaloisGroups Layer 5.

**Checks.**

- *Computed value.* Over ZMod 2, f = X²+X+1 is accepted: X⁴ ≡ X (mod f), and for s = 2 the identity 1·(X²−X) + 1·f = 1 holds.
- *Degenerate case.* For f = X − a of degree one no prime divides 1. Both X^q and X reduce to the constant a, so every monic linear polynomial is accepted; comparing the reduced remainder a with the unreduced polynomial X would wrongly reject it.
- *Non-example.* Over ZMod 5, f = X²+1 satisfies X^25 ≡ X (mod f) but gcd(X⁵ − X, f) = f, so no Bézout pair exists and f is rejected; indeed X²+1 = (X−2)(X−3) there.
- *Non-example.* For every prime p, X⁴+1 over ZMod p has no accepted presentation, because it is reducible modulo every prime.

### 0.16 Exact presentation of a finite field

Let F be a finite field and K a field with an F-algebra structure. A finite-field presentation F K consists of a monic f ∈ F[X] satisfying `RabinCriterion`, an element α ∈ K with f(α) = 0, and the equation finrank F K = natDegree f. It determines an F-algebra isomorphism `AdjoinRoot f ≃ₐ[F] K` sending the class of X to α; the inverse sends x ∈ K to the class of Σ_(i<n) c_i X^i, where (c_i) are the coordinates of x in the power basis 1, α, …, α^(n−1). Every finite extension K of F has a presentation. A tower F ⊆ E ⊆ K is presented one step at a time; the prime field is Mathlib's `ZMod p`, never a second copy.

- The F-algebra map from `AdjoinRoot poly` to K sending the quotient root to the specified root.
- This map is bijective under the full-degree condition.
- The F-algebra isomorphism AdjoinRoot f ≃ₐ[F] K.
- The class of X is sent to α.
- The inverse is read off from power-basis coordinates.
- The minimal polynomial of α over F is f.
- Nat.card K = (Nat.card F)^(natDegree f).
- Every finite extension of F admits a presentation.

Rabin soundness makes f irreducible. A monic irreducible polynomial vanishing at α is the minimal polynomial of α, so F(α) has degree natDegree f = finrank F K and equals K; the power basis of α then gives the isomorphism with AdjoinRoot f and the coordinate formula for its inverse. Existence: a primitive element of K over F has a monic irreducible minimal polynomial of degree finrank F K, which has an accepted presentation. ([Shoup](#source-shoup), Theorem 19.14 and its proof, pp.515–516; §20.1, p.523.) *Needs:* `RabinCriterion` (0.15); Mathlib `AdjoinRoot.equiv'`; Mathlib `PowerBasis.ofAdjoinEqTop`; Mathlib `FiniteField.algEquivOfCardEq`.

**Checks.**

- *Computed value.* For K = GaloisField 2 2 presented by X²+X+1 with root α: equiv sends the class of X+1 to α+1, and α² = α+1.
- *Degenerate case.* Presenting F over itself by X − a with α = a, the inverse sends x to the class of the constant x.
- *Agreement with the library notion.* The polynomial of a presentation equals Mathlib's minpoly F α.
- *Non-example.* X⁴+1 is the polynomial of no presentation over any ZMod p.

### 0.17 Change of presentation with an explicit inverse

Let F be a finite field and f, g ∈ F[X] monic irreducible of the same degree n. A change of presentation is a pair (b, c) of polynomials with g ∣ f∘b, f ∣ g∘c and f ∣ b∘c − X, each checked by a remainder computation. It defines the F-algebra isomorphism `AdjoinRoot f ≃ₐ[F] AdjoinRoot g` sending the class of X to the class of b, with inverse sending the class of X to the class of c; the reverse congruence g ∣ c∘b − X follows. Every such pair f, g admits a presentation, and presentations compose by substitution.

- The presentation: the pair (b, c) with its three divisibilities.
- The class of X is sent to the class of b.
- The inverse sends the class of X to the class of c.
- Monic irreducible f, g of equal degree admit a presentation.
- Composing presentations (b, c) and (b′, c′) gives the presentation (b∘b′, c′∘c).

The divisibilities say that b is a root of f modulo g and c a root of g modulo f, so both maps exist as lifts out of the quotient algebras. Their composite on AdjoinRoot f sends the class of X to the class of b∘c, which is the class of X; an algebra map out of AdjoinRoot f is determined by the image of the root, so the composite is the identity. Both fields have q^n elements, so the forward map is bijective with the stated inverse. Existence: f has a root in the field F[X]/(g) because two extensions of F of the same degree are isomorphic. ([Shoup](#source-shoup), Theorem 19.14 and its proof, pp.515–516.) *Needs:* finite-field presentation (0.16); Mathlib `AdjoinRoot.algHom_ext`; Mathlib `FiniteField.algEquivOfCardEq`.

**Checks.**

- *Degenerate case.* (X, X) is a presentation from f to itself.
- *Computed value.* Over ZMod 3, (b, c) = (X+2, X+1) is a presentation from X²+1 to X²+X+2: (X+2)²+1 = X²+X+2, (X+1)²+(X+1)+2 = X²+1 and b∘c = X+3 = X.
- *Non-example.* Over ZMod 7 with f = g = X³−2, b = 2X is a root of f modulo f since 2³ = 1, but (2X, 2X) fails f ∣ b∘c − X because b∘c = 4X; the presentation is (2X, 4X).

### Examples

- The rational presentations of `1/2` and `1/3` add to the presentation of `5/6`, and the presentations of `1/2` and `1/3` compare unequal (rational root presentation (0.9), equality of algebraic values (0.13)).
- At `p = 3` the canonical approximation `(N, v, s) = (0, −1, 1)` has centre `1/3` and denotes `1/3 + ℤ_3` (p-adic approximation (0.14)).
- Over `ZMod 2`, `X²+X+1` has the Rabin presentation `X⁴ ≡ X (mod f)`, `1·(X²−X) + 1·f = 1`, and presents `GaloisField 2 2` (`RabinCriterion` (0.15), finite-field presentation (0.16)).
- Over `ZMod 3`, `(X+2, X+1)` changes the presentation `X²+1` of `𝔽₉` into `X²+X+2` (change of presentation (0.17)).

### Dependencies

Mathlib (integers, rationals, lists, `NonemptyInterval`, `algebraicClosure`, `Polynomial`, `AdjoinRoot`, finite fields, `padicValRat`, `PadicInt.toZModPow`); TauCetiRoadmap RealAlgebraicGeometry Layers 1–4; TauCetiRoadmap PolynomialGaloisGroups Layer 5.

## Layer 1: primality and factorization presentations

Pratt and Pocklington criteria imply primality unconditionally. The strong-liar count
concerns the uniform independent distribution on all nonzero residues. AKS contributes its
congruence characterization of primes. Polynomial presentations retain multiplicities and the
leading scalar, over arbitrary finite fields and over ℚ.

*Proof obligations of the layer.* The strong-liar count uses prime-power kernel cardinalities,
the CRT and the Carmichael case (Shoup Theorem 10.3, pp.309–312). The AKS proof uses the
quotient-algebra cardinality estimates of Shoup Lemmas 21.6–21.11, pp.550–558. Pratt size is
a combinatorial existence bound on finite trees. Factorization existence uses unique
factorization and preserves arbitrary nonmonic input; no irreducible-reduction hypothesis is
imposed on a rational irreducible polynomial.

### 1.1 Recursive Pratt presentation (`PrattTree`)

A PrattTree is either the leaf two or a node (n,a,children), where n and a are natural numbers and children is a finite list of Pratt trees. Its decoded `PrattTree.value` is 2 at the leaf and n at a node. Repeated children encode repeated prime factors of n−1. Primality is a consequence of the validity predicate, rather than a field of the raw tree.

- The leaf has value 2.
- A node stores its claimed value n.
- Two nodes are equal precisely when all their raw data are equal.

Define a finite inductive tree with the leaf and node constructors. Define value by pattern matching. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* Mathlib `lucas_primality`; Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`.

**Checks.**

- *Degenerate case.* The base leaf represents 2.
- *Computed value.* The candidate (3,2,[two]) represents 3.
- *Non-example.* A malformed node may represent 1; existence of raw syntax is not primality.

### 1.2 Validity of a Pratt tree (`PrattTree.valid`)

Define `PrattTree.nodeConditions n a cs` as `3 ≤ n`, `0 < a < n`, product of child
values equal to n−1, `a^(n-1) mod n = 1`, and `a^((n-1)/q) mod n ≠ 1` for every child
value q. Define `PrattTree.valid` recursively: the leaf is valid and a node is valid
exactly when these conditions hold and all children are valid. `PrattTree.validList`
means validity of every tree in a list.

- The leaf is valid.
- Node validity is the displayed conjunction.
- Validity excludes values zero and one.

The conditions are arithmetic propositions on finite data (PrattNotes, pp.1–4).
*Needs:* §1.1; Mathlib `lucas_primality`.

**Checks.**

- The leaf is valid; this distinguishes the base case from the node's strict bound.
- The node `(3,2,[two])` is valid and supplies the first odd prime.
- The node `(9,2,[two,two,two])` is invalid, although its child product is eight.

### 1.3 Soundness of Pratt presentations (`PrattTree.sound`)

For every finite Pratt tree c, c.valid implies Nat.Prime(c.value).

Induct on the presentation tree. The children are prime by induction. Every prime divisor of the product n−1 occurs among the child values, so the checked modular inequalities supply all hypotheses of lucas_primality. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattTree.valid` (1.2); Mathlib `lucas_primality`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.4 Completeness of Pratt presentations (`PrattTree.complete`)

Every prime n is the value of a Pratt presentation satisfying validity.

Use strong induction on n, with leaf 2. For n≥3, reverse_lucas_primality supplies a Lucas witness; take its representative in 1,…,n−1. Factor n−1 using primeFactorsList. Every factor q≤n−1<n has a recursively accepted presentation. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattTree.valid` (1.2); Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.5 Bit size of a Pratt tree (`prattBitSize`)

prattBitSize assigns one tag bit to the leaf. A node contributes 1 plus the binary lengths of n, a and its child count, plus the sizes of the children. Binary length is log₂(x)+1, including one bit for zero. This is a combinatorial measure on a finite tree.

- `prattBitSizeList`: The sum of the sizes of the trees in a finite list.
- The leaf costs one bit.
- The charge is the sum of header lengths and all child charges.
- Every finite tree has positive size.

Recurse over the existing finite tree; retain repeated factors and charge every occurrence. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattTree` (1.1).

**Checks.**

- *Degenerate case.* The leaf has size one.
- *Computed value.* The tree presenting 3 has size seven.
- *Non-example.* Repeated children are charged repeatedly, not silently shared as a DAG.

### 1.6 Quadratic bit-size bound for Pratt presentations (`pratt_small_tree`)

There is an absolute natural constant C such that every prime n has an accepted Pratt tree c of value n and prattBitSize(c)≤C·(log₂(n)+1)². This is an existence bound for presentations, not a bound on the cost of discovering the factorization of n−1.

Induct using the prime factors of n−1 with multiplicity, as in the source proof-length bound. Bound every header by a constant times the binary length of n. Sum the recursive charges. The translation of the source proof lines to this tree measure is an additional proof requirement. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `prattBitSize` (1.5); `PrattTree.complete` (1.4).

### 1.7 Strong Miller–Rabin liar (`StrongLiar`)

For n,a∈ℕ write h=v₂(n−1) and t=(n−1)/2^h. StrongLiar n a means n>1 is odd, 0<a<n, and in ZMod n either a^t=1 or a^(t·2^j)=−1 for some j<h. The sample space is the nonzero residues 1,…,n−1; it is not restricted to units. The predicate is restricted to odd n>1 and rejects n=0,1 and even n.

- The defining modular alternatives use the odd part of n−1.
- A strong liar is coprime to n, although the sampling space contains nonunits.
- The base 1 passes for every odd n>1.

Use the multiplicity of 2 in n−1 via Nat.factorization and exact exponentiation in ZMod n. ([Shoup](#source-shoup), §10.2, pp.308–310.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* Base 3 passes for 7.
- *Degenerate case.* Input 1 is rejected.
- *Non-example.* 2047 is composite but passes the strong base-2 test.

### 1.8 Prime inputs pass every admissible base

If n is an odd prime and 0<a<n, then StrongLiar n a.

Fermat gives a^(n−1)=1. In the repeated-squaring chain in the field ZMod n, the predecessor of the first 1 is either absent (a^t=1) or is −1, since the only square roots of 1 are ±1. ([Shoup](#source-shoup), Theorem 10.3, prime-input case, p.309.) *Needs:* `StrongLiar` (1.7).

### 1.9 Miller–Rabin strong-liar bound (`strongLiar_card_le`)

For odd composite n>1, the number of bases a with 0<a<n and StrongLiar n a is at most (n−1)/4. Equivalently, four times this cardinality is at most n−1.

Split prime powers from numbers with at least two distinct prime factors. On prime powers use the cyclic-unit power-map kernel count; on at least two factors apply the CRT and the common 2-adic exponent to bound the two permitted fibres. The cyclic kernel, CRT fibre count, and Carmichael-at-least-three-primes steps are separate proof requirements. ([Shoup](#source-shoup), Theorem 10.3, pp.309–312.) *Needs:* `StrongLiar` (1.7).

### 1.10 Error bound for independent Miller–Rabin rounds

For odd composite n>1 and k∈ℕ, among all (n−1)^k equally likely tuples of bases in {1,…,n−1}, at most (n−1)^k/4^k tuples pass every strong test. Equivalently, 4^k times the number of accepting tuples is at most (n−1)^k. This counting formulation is the uniform independent product distribution; it makes no promise for correlated or adversarially chosen bases.

An accepting tuple is a function into the strong-liar subset, so its cardinality is the kth power of the one-round cardinality. Raise the one-round bound to k. ([Shoup](#source-shoup), §10.2 algorithm and Theorem 10.3, pp.309–312.) *Needs:* `strongLiar_card_le` (1.9).

### 1.11 AKS order parameter (`aksParameter`)

For n>1 let `aksParameter n` be the least r≥2 for which `1 < gcd(n,r)` or
`gcd(n,r)=1` and `4*(aksLen n)^2 < aksOrder n r`. Put `aksLen n = Nat.log 2 n + 1`
and `aksOrder n r = orderOf (n : ZMod r)`. For n≤1 set the parameter to zero.
The candidate r=n proves existence when n>1.

- For n>1 the parameter is between 2 and n and has the stated property.
- No smaller admissible integer has that property.
- The parameter is zero for n≤1.

Use the least-element property of ℕ (Shoup §21.2, Figure 21.1, printed p.550).
*Needs:* Mathlib `orderOf`, `ZMod`.

**Checks.**

- At n=2 the least admissible r is 2.
- At n=9 it is 3, while r=2 has order one and is inadmissible.
- At n=1 the sentinel is zero, outside the positive-input bounds.

### 1.12 AKS polynomial congruences (`AKSIdentities`)

AKSIdentities n r ℓ means that for each integer j with 1≤j≤ℓ, (X+j)^n and X^n+j have the same remainder on division by X^r−1 in (ZMod n)[X]. The definition is a finite family of decidable polynomial identities, separate from claims that the coefficient ring is a field.

- The empty check range holds.
- Passing a larger check range implies passing a smaller one.
- The predicate is exactly the finite remainder comparison.

Use Polynomial.modByMonic over the commutative ring ZMod n. The AKS criterion uses r>1, so the modulus is monic of degree r. ([Shoup](#source-shoup), §21.2, pp.549–550; Figure 21.1, p.550.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* The characteristic-5 identity passes at every r and every check range.
- *Degenerate case.* With no bases, even input 9 passes the identity predicate.
- *Non-example.* At n=9, r=2, ℓ=1 the identity fails: modulo `(9,X^2-1)`,
  `(X+1)^9=4*X+4`, whereas `X^9+1=X+1`.

### 1.13 AKS arithmetic predicate (`AKSAccepts`)

Define `AKSAccepts n` to mean n>1, n is not a power `a^b` with a,b>1, and either
`aksParameter n = n` or that parameter is coprime to n and `AKSIdentities n r ℓ`, with
`r = aksParameter n` and `ℓ = 2*aksLen n*Nat.sqrt r+1`.

- Integers at most one fail this predicate.
- A power with base and exponent greater than one fails it.
- The predicate is exactly the stated arithmetic conjunction.

This is Shoup's arithmetic primality criterion (§21.2, Figure 21.1, p.550).
*Needs:* §§1.11–1.12.

**Checks.**

- Two satisfies the r=n alternative.
- Nine fails the non-power condition, independently of its polynomial congruences.
- One fails n>1 even though every empty family of congruences holds.

### 1.13a Finite-algebra inputs to the AKS criterion

Let n>1, r>1 and ℓ≥1, let p be a prime dividing n, and assume gcd(n,r)=1.
Put `E = F_p[X]/(X^r-1)` and ξ=[X]. For gcd(k,r)=1 the substitution
`aksSubstitution k : E ≃ₐ[F_p] E` sends g(ξ) to g(ξ^k). Prove
aks substitution comp, aks substitution eq iff and aks substitution frobenius:
composition multiplies the exponents, equality is congruence modulo r, and the p
substitution is the p-power map (Shoup Lemma 21.6, printed pp.553–554;
Shoup line 21678). Set `D(k)={a : sigma_k(a)=a^k}`. Prove
aks power compatible mul and aks power compatible exponents mul: D(k) is multiplicative,
and σ_k(a)=a^k together with σ_j(a)=a^j implies σ_(kj)(a)=a^(kj)
(Shoup Lemmas 21.7–21.8, p.555; Shoup line 21756).

Take a finite extension F/𝔽_p of degree `s=ord_r(p)`, a root ζ of exact order r,
and `tau : E →ₐ[F_p] F` with τ(ξ)=ζ. Let `S=tau(D(n))` and
`t=|⟨p mod r,n mod r⟩|` in `(ℤ/rℤ)^×`. Prove these three inputs:

- if n is not a prime power, `|S| <= n^(2*floor(sqrt(t)))`.
  Distinct integers n^u p^v with 0≤u,v≤⌊√t⌋ give two congruent exponents;
  all elements of S satisfy the resulting nonzero polynomial
  (Shoup Lemma 21.9, pp.556–557; Shoup line 21783).
- if p>r and `(ξ+j)^n=ξ^n+j` for 1≤j≤ℓ, then
  `|S| >= 2^min(t,l)-1`. Products over proper subsets of the first min(t,ℓ)
  linear factors have distinct evaluations, since a degree at most t−1 polynomial
  cannot vanish at t distinct powers of ζ
  (Shoup Lemma 21.10, pp.557–558; Shoup line 21819).
- if `ord_r(n)>4*(aksLen n)^2` and
  `l>2*aksLen n*floor(sqrt(r))`, then `2^min(t,l)-1>n^(2*floor(sqrt(t)))`.
  Use `ord_r(n) <= t < r` and `log_2(n) <= aksLen n`
  (Shoup Lemma 21.11, p.558; Shoup line 21864).

*Needs:* §0.16; finite-field cyclicity, quotient algebras, polynomial root bounds;
§§1.11–1.12. These are algebraic cardinality theorems, independent of any procedure.

**Checks.**

- σ₁ is the identity and σ_kσ_j=σ_(kj), fixing the substitution direction.
- At n=p=2, r=31, D(2)=E and S=𝔽₃₂. Its size 32 exceeds
  `2^(2*floor(sqrt(5)))=16`; the upper bound requires n not to be a prime power.
- At n=9, r=2, p=3, ℓ=1 the linear-factor hypothesis fails as in §1.12;
  an empty range supplies no lower-count contradiction.

### 1.14 AKS characterization of primes (`aks_correct`)

For every natural n, `AKSAccepts n` holds iff n is prime.

Prime inputs satisfy the polynomial identities by Frobenius. For a composite that reaches the final branch choose a prime p dividing n; the least-modulus property gives p>r and gcd(n,r)=1. Shoup’s quotient-algebra endomorphisms, upper bound on the evaluation image and lower bound from products of distinct linear factors contradict the order and length bounds. The three named cardinality inputs in §1.13a provide this contradiction. ([Shoup](#source-shoup), §21.2 and Lemmas 21.6–21.11, pp.549–558.) *Needs:* `AKSAccepts` (1.13); `AKSIdentities` (1.12); `aksParameter` (1.11);
aks substitution comp, aks power compatible mul, aks power compatible exponents mul,
aks eval image upper, aks eval image lower, aks growth contradiction (1.13a).

### 1.15 Pocklington prime-divisor congruence

Let n>1, F>1 and F∣n−1. Suppose that for each prime q∣F there is an integer a with a^(n−1)≡1 modulo n and gcd(a^((n−1)/q)−1,n)=1. Then every prime divisor p of n satisfies F∣p−1. The witness a may depend on q; F and (n−1)/F need not be coprime.

For every prime-power q^e∣F, the order of a modulo p divides n−1 but does not divide (n−1)/q. Thus its q-adic exponent is at least e, and q^e divides p−1. Combine these prime powers. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

### 1.16 Pocklington primality criterion (`pocklington_prime`)

Under the prime-divisor criterion’s hypotheses, if F²>n then n is prime.

If n were composite it would have a prime divisor p≤√n<F. The preceding congruence F∣p−1 contradicts 0<p−1<F. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* pocklington prime-divisor congruence (1.15).

### 1.17 Finite Pocklington presentation

Pocklington presentation stores a list of Pratt trees and one integer witness for each occurrence. Its exact part F is the product of the child values. Validity requires n>1, F>1, F∣n−1, n<F², all children accepted, and for each (q,a), a^(n−1)≡1 mod n and gcd(a^((n−1)/q)−1,n)=1. Repeated q encode multiplicity. The uncatalogued cofactor is allowed to remain unfactored.

- F is the product of exact child values.
- The conjunction of the bounds, divisibility, recursive validity and gcd conditions.
- Validity is equivalent to the stated finite conjunction.

Represent the entries as a finite list of pairs. Every prime divisor of F is an exact child, so the list supplies the universal witnesses needed by the Pocklington criterion. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* `PrattTree.valid` (1.2); `PrattTree.sound` (1.3); `pocklington_prime` (1.16).

**Checks.**

- *Computed value.* F=8 with three factors 2 and witness 3 establishes 17.
- *Degenerate case.* An empty factor list is rejected.
- *Non-example.* A single factor 2 cannot present 17 because 2²≤17.

### 1.18 Soundness of finite Pocklington presentations

If the Pocklington data are valid for n, then n is prime.

Pratt soundness makes every child value prime. Every prime divisor of F occurs in the list, so select its recorded integer witness and apply the Pocklington criterion. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* Pocklington presentation (1.17); `PrattTree.sound` (1.3); `pocklington_prime` (1.16).

### 1.19 Integer factorization with prime presentations

An integer factor presentation stores a sign ε∈{−1,1} and a list of raw Pratt trees. Its value is ε times the product of their natural values, viewed in ℤ. It is valid for z precisely when every Pratt tree is valid and this product equals z. Units ±1 have an empty factor list. Zero has no accepted presentation, and repeated primes remain repeated list entries.

- Decode the signed product.
- The signed product equals z and all prime trees are valid.
- Acceptance is the product equation together with acceptance of all prime witnesses.

Use a Bool for the sign and a finite list of existing Pratt trees. Decode by an integer product and require each tree to be valid. This expresses factorization as a signed product of primes. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattTree.valid` (1.2); `PrattTree.sound` (1.3); Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`.

**Checks.**

- *Degenerate case.* The negative sign and empty list present −1.
- *Computed value.* Two copies of 2 and the accepted presentation for 3 present 12.
- *Non-example.* No zero product presentation is accepted.

### 1.20 Soundness of integer factorization presentations

An accepted presentation for z gives z≠0 and a list of prime absolute factors whose signed product is z. Thus every prime divisor of |z| occurs among its child values; no completeness inference is made from a partial list.

Apply Pratt soundness to each child. Prime factors are positive and nonzero, so their signed product is nonzero. Euclid’s lemma identifies prime divisors of the product. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* integer factor presentation (1.19); `PrattTree.sound` (1.3).

### 1.21 Every nonzero integer admits a factor presentation

Every nonzero integer z admits an accepted integer factor presentation. Use the native primeFactorsList of |z| and Pratt completeness, retaining the sign of z.

The native product theorem reconstructs the positive absolute value. Each list element is prime and therefore has an accepted Pratt tree. Restore the sign. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* integer factor presentation (1.19); `PrattTree.complete` (1.4); Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.22 Factorization presentation over a finite field

For a finite field F and f ∈ F[X], a finite-field factor presentation f stores a nonzero constant c ∈ F and a finite list of triples (g_i, e_i, R_i) with g_i monic and pairwise distinct, e_i ≥ 1 and R_i an accepted RabinCriterion of g_i. Its fields include the exact polynomial identity f = C c · ∏ g_i^(e_i). The zero polynomial has no accepted presentation, because c ≠ 0 makes the product nonzero.

- The conjunction of the product identity and every Rabin condition; the displayed structure carries these as proof fields.
- The multiset Σ e_i·{g_i} of exact factors.
- On acceptance, c is the leading coefficient of f.

Store the data as a list with the product identity, positive exponents and Rabin proofs as fields. Repeated factors are recorded by their exponents, not by repetition in the list. ([Shoup](#source-shoup), §20.3, p.527 (factorization of a monic polynomial into irreducibles) and Exercise 20.2(a), p.524.) *Needs:* `RabinCriterion` (0.15); Mathlib `UniqueFactorizationMonoid.normalizedFactors_prod_eq`.

**Checks.**

- *Degenerate case.* The polynomial 1 has scalar c=1 and an empty list; a required positive factor count would exclude units.
- *Computed value.* Over ZMod 5, X²+1 has c=1 and factors X−2, X−3 with exponent one; treating the input as irreducible would miss its two roots.
- *Non-example.* Over ZMod 5 the single factor X²+1 with exponent one is rejected, since X²+1 has no accepted Rabin presentation there.
- *Non-example.* The zero polynomial has no accepted presentation.

### 1.23 Soundness of finite-field factorization presentations

If a finite-field factor presentation of f ∈ F[X] is accepted, then f ≠ 0, leadingCoeff f = c, and its multiset Σ e_i·{g_i} equals Mathlib's normalizedFactors f.

Each g_i is irreducible by Rabin soundness and monic, hence normalized. The product of a multiset of normalized irreducibles has that multiset as its normalized factors; the nonzero constant c is a unit and contributes nothing. Comparing leading coefficients of the monic product gives the second claim. ([Shoup](#source-shoup), §20.3, p.527; Exercise 20.2(a), p.524.) *Needs:* finite-field factor presentation (1.22); `RabinCriterion` (0.15); Mathlib `UniqueFactorizationMonoid.normalizedFactors_prod_eq`.

### 1.24 Nonzero finite-field polynomials have factor presentations

Every nonzero polynomial over an arbitrary finite field has a
finite-field factor presentation, with distinct monic factors and positive exponents.

Unique factorization supplies the normalized factors and their multiplicities;
Rabin completeness supplies the conditions on each irreducible factor. ([Shoup](#source-shoup), §§20.3–20.5, pp.527–544 (Theorem 20.5, p.528; §20.4, pp.531–538; §20.5, pp.539–544).) *Needs:* finite-field factor presentation (1.22); `RabinCriterion` (0.15).

### 1.25 Transport of exact finite-field factors

Let `e : F ≃+* K` be an exact change from a finite-field presentation to the intrinsic finite field. For nonzero f=c∏g_i with c≠0 and all g_i monic irreducible, mapping coefficients by e yields map(e,f)=e(c)∏map(e,g_i), again with monic irreducible factors. The presentation of §1.22 and existence theorem of §1.24 supply the data; transport reconstructs the intrinsic factorization.

Use soundness of finite-field factorization presentations (1.23) for the presented factorization. A field isomorphism preserves leading coefficients, products and irreducibility. Check the presentation’s explicit inverse before transport. ([Shoup](#source-shoup), Theorem 19.14, pp.515–516; Chapter 20.) *Needs:* soundness of finite-field factorization presentations (1.23); change of presentation (0.17); finite-field presentation (0.16).

### 1.26 Coprime factor lifting modulo prime powers (`henselLift`)

For a prime p, k≥1 and monic f∈ℤ[X], let `f mod p = g₀*h₀` with g₀,h₀
monic and coprime. There exists exactly one monic factor pair over `ZMod (p^k)` with
product `f mod p^k` and reductions g₀,h₀. Prove the pairwise lifting theorem for a finite pairwise coprime monic factorization
with a lift of each factor, the same reductions and the same product identity. Monicity fixes the degrees, including degree-zero factors.

Induct on k with degree-bounded Bézout corrections: the correction to g has
degree below deg(g₀), and the correction to h has degree below deg(h₀). The homogeneous
correction equation has only the zero such pair, giving uniqueness. This proves the
factor statement directly (MilneANT, Theorem 7.33 and Lemmas 7.34–7.35, printed pp.121–122).
*Needs:* finite-field Bézout identities and reduction maps between `ZMod (p^k)`.

**Checks.**

- At k=1 the unique pair is the supplied pair itself.
- At p=7, `X²-2` with factors `X-3`, `X+3` lifts at k=2 to `X-10`, `X+10`.
- Coprimality is essential: at p=2, k=2, `X²` has the two monic factorizations
  `X*X` and `(X+2)*(X+2)` with the same reduction.

### 1.26a Coprime factors over complete DVRs (`henselFactor_completeDVR`)

Let O be any DVR complete and separated for its maximal-ideal topology, with residue
field κ, and let f∈O[X] be monic. Prove `henselFactor_completeDVR`: every factorization
`f mod m = g0*h0` into coprime monic κ-polynomials lifts to exactly one pair of monic
O-polynomials g,h with f=gh and the specified reductions. Prove
the pairwise complete-DVR lifting theorem for a finite pairwise coprime monic factorization.
Constant factors are included, with no restriction on the residue characteristic or its
cardinality. Construct degree-bounded corrections modulo successive powers of m and take
coefficientwise limits in O; separatedness gives uniqueness. The finite-quotient statement
§1.26 is its specialization to integer inputs over ℤ_p, followed by reduction modulo p^k
(MilneANT Theorem 7.33, Lemmas 7.34–7.35 and Remark 7.36, printed pp.121–122;
MilneANT lines 5346 and 5389).
*Needs:* complete DVRs, residue maps and polynomial Bézout identities from Mathlib.

**Checks.**

- Lifting `1*(f mod m)` gives exactly (1,f), retaining degree-zero factors.
- Over 𝔽₂[[t]], `X*(X-1)` lifts with these same coprime factors; mixed characteristic is unnecessary.
- Over ℤ₂, `X²` reduces to two equal linear factors: the coprime uniqueness theorem does
  not apply, and its modulus-four specialization has the two pairs in §1.26.

### 1.27 Rational polynomial factor presentation

For f∈ℚ[X], rational factor presentation f consists of a nonzero rational leading factor c, a finite list of monic polynomials, proofs that each is irreducible over ℚ, and the exact identity f=c∏g_i. Multiplicity is represented by repeated factors. The definition uses actual irreducibility proofs; a CAS assertion or irreducibility modulo a single prime without a valid lifting criterion is insufficient. For f∈ℤ[X], present its coefficientwise rational image and separately retain integer content and primitive-factor normalization.

- The presentation reconstructs f exactly.
- No presentation exists for the zero polynomial.
- The scalar equals the leading coefficient of f because every listed factor is monic.

Store finite polynomial data and exact proof obligations. The finite data present a factorization on the native polynomial carrier. Each listed factor has an intrinsic irreducibility proof over ℚ. ([LLL82](#source-lll82), §3, algorithm 3.5 and Theorem 3.6, printed pp.25–26 of the linked report, for rational factorization and reconstruction.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* The unit polynomial uses scalar 1 and an empty list.
- *Computed value.* (X−1)² has the repeated linear list [X−1,X−1].
- *Non-example.* The zero polynomial has no such factor presentation.

### 1.28 Existence of rational factor presentations

For every nonzero f∈ℚ[X], there exists a rational factor presentation f
whose scalar is `f.leadingCoeff`. The factors are monic and irreducible, with multiplicity
represented by repetition. No reduction-irreducibility hypothesis is imposed.

Unique factorization gives normalized irreducibles; units in ℚ[X] are
nonzero constants, and comparison of leading coefficients identifies the scalar
(LLL82, Theorem 3.6, printed p.26 of the report, for the factorization statement).
*Needs:* §1.27 and unique factorization in ℚ[X].

**Checks.**

- A nonzero constant has no irreducible factors.
- `(X-1)^2` has two copies of `X-1`.
- `2*X^2+3*X+1 = C 2*(X+C (1/2))*(X+1)`, retaining the nonmonic scalar.
- `X^4+1` remains irreducible over ℚ despite having no irreducible reduction modulo a prime.

### Examples

- The Pratt tree `(3, 2, [2])` is accepted and has bit size `7`; the candidate for `9` with three factors `2` and witness `2` is rejected (`PrattTree.valid` (1.2), `prattBitSize` (1.5)).
- `2047 = 23·89` is composite but passes the strong test to base `2`; base `3` passes for the prime `7` (`StrongLiar` (1.7)).
- `aksParameter 9 = 3` exposes the factor `3`, and `AKSAccepts 9` rejects `9` as a perfect power (`aksParameter` (1.11), `AKSAccepts` (1.13)).
- `F = 8` with three factors `2` and witness `3` establishes `17` by Pocklington, since `8² > 17`; the single factor `2` does not, since `2² ≤ 17` (Pocklington presentation (1.17)).
- Over `ZMod 5`, `X²+1 = (X−2)(X−3)`; over `ℤ`, `X² − 2 ≡ (X−3)(X+3) (mod 7)` lifts to `(X−10)(X+10) (mod 49)` (finite-field factor presentation (1.22), `henselLift` (1.26)).
- `X²+1` stays irreducible over `ℚ` although it splits over `ℂ` (existence of rational factor presentations (1.28)).

### Dependencies

Layer 0; Mathlib (complete DVRs and residue maps, `lucas_primality`, `reverse_lucas_primality`, `Nat.primeFactorsList`, Carmichael numbers, `ZMod`, `Polynomial.modByMonic`, unique factorization, `PadicInt.toZModPow`, the Mahler-measure coefficient bound).

## Layer 2: order presentations and local arithmetic

All coordinates refer to the native number field and its native ring of integers. A full
multiplication-stable integer lattice containing one is an order; maximality is a separate
property. The multiplier criterion applies to arbitrary full orders, including at divisors
of a power-basis index. First-order φ-Newton data keep their sign, normalization and
residual-factor hypotheses, including repeated and inseparable residual polynomials. The local targets treat finite extensions of ℚ_p and primes of
arbitrary ramification.

*Proof obligations of the layer.* Prove the p-primary multiplier-overorder comparison and
containment in `(1/p)R` (Stevenhagen Proposition 9.3, p.235), and use the
index–discriminant identity of NumberFieldArithmetic. At index divisors, prime presentations
use the maximal order. The φ-polygon product and factorization theorems are specified in
§2.19a; repeated residual factors carry no first-order irreducibility conclusion. Local
expansions retain the residue section, embedding and uniformizer.

### 2.1 Finite order basis presentation

For a number field K and n∈ℕ, an order basis presentation stores b₀,…,bₙ₋₁∈K forming a ℚ-basis, integer coordinates for 1, and integer structure constants b_i b_j=Σ_k m_ijk b_k. These finite identities prove that the integer span of b is a full order. The presentation does not assert maximality.

- The integer span of the displayed rational basis.
- That lattice is closed under multiplication.
- Package the integer span as a native ℤ-subalgebra of K.
- Membership is existence of integer coordinates in b.
- Integer coordinates in the basis are unique.

Check rational linear independence and spanning, the coordinate equation for 1, and all n² multiplication equations. The integer span is then closed under multiplication. The column Hermite decompositions of ClassicalArithmeticCompletion §3.25 supply coordinate reconstruction. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- *Computed value.* The singleton basis 1 presents ℤ in ℚ.
- *Degenerate case.* A number field has no rank-zero order presentation.
- *Non-example.* The singleton rational basis 1/2 is not closed under multiplication over ℤ.

### 2.2 Multiplier ring of an integral lattice (`multiplierRing`)

For a field K of characteristic zero and an integer submodule I⊆K, multiplierRing I is the ℤ-subalgebra {x∈K | xI⊆I}. This definition also permits I=0, in which case the multiplier ring is all of K. Finiteness and the full-lattice condition are hypotheses of the maximal-order theorems, not hidden in this carrier. For a fractional ideal of an order it is the same set as the `Subring` `NumberFieldOrder.multiplierRing` of the native order carrier; the version here accepts any ℤ-submodule of K.

- Membership means preservation of every lattice element by multiplication.
- The underlying submodule satisfies `(multiplierRing I).toSubmodule = I / I`,
  with membership given by `Submodule.mem_div_iff_forall_mul_mem`.
- The zero lattice has the whole field as multiplier ring.
- For a fractional ideal I of a native number-field order O, the underlying subring equals `O.multiplierRing I`.
- Multiplying a lattice by a nonzero field element does not change its multiplier ring.

Use Mathlib's submodule-division API for the underlying submodule I / I. The stabilizing condition is closed under addition, multiplication and negation, and every integer scalar stabilizes I, giving the Subalgebra ℤ K packaging. ([NumberRings](#source-numberrings), §9, Proposition 9.3, pp.234–235.) *Needs:* Mathlib `Submodule.mem_div_iff_forall_mul_mem`, `Submodule.mem_div_iff_smul_subset` and `Submodule.le_div_iff_mul_le`.

**Checks.**

- *Degenerate case.* For I=0 in ℚ, both the multiplier submodule and I / I are all of ℚ: x·0=0 for every rational x. This is not a finite order.
- *Agreement with the library notion.* For I=ℤ in ℚ, both the multiplier submodule and I / I equal ℤ, since x·1∈ℤ forces x to be integral.
- *Non-example.* For I=ℤ in ℚ, 1/2 belongs to neither submodule, because (1/2)·1=1/2∉ℤ.
- *Scaling.* For I=2ℤ in ℚ, both submodules equal ℤ, rather than 2ℤ: x·2∈2ℤ iff x∈ℤ, and the multiplier 1 is not an element of I.

### 2.3 Local maximality of an order (`IsPMaximal`)

For a ℤ-subalgebra R of a characteristic-zero field K and a prime p, IsPMaximal R p means that for every x∈K integral over ℤ there is an integer a not divisible by p with a·x∈R. For a full finite order R this says its localization at p equals that of the maximal order, or equivalently p does not divide its index. The predicate is meaningful at arbitrary p, but arithmetic theorems assume primality.

- Local maximality is the stated prime-to-p denominator-clearing property.
- Enlarging R preserves local maximality.
- The whole field satisfies the predicate at primes; finiteness must be imposed separately for orders.

Express equality after localization by clearing a denominator prime to p. Keep the intrinsic integral closure as the target. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* The usual copy of ℤ in ℚ is p-maximal at every prime.
- *Non-example.* At p=1 no denominator passes, so the predicate is false.
- *Agreement with the library notion.* Every overorder of a p-maximal order remains p-maximal.

### 2.4 Nilradical from a Frobenius kernel

Let A be a finite-dimensional commutative algebra over ZMod p, p prime, and let p^k≥dim A. Then x is nilpotent iff x^(p^k)=0. Consequently the nilradical is the kernel of the kth iterate of the Frobenius algebra endomorphism, identified in coordinates with a linear-map kernel.

A nilpotent multiplication operator on the d-dimensional space has nilpotency exponent at most d. Thus x^d=0 and x^(p^k)=0. The reverse implication is the definition of nilpotence. The semantic kernel is native linear algebra. The kernel of the Frobenius iterate in a supplied basis is represented by Tau Ceti's `TauCeti.kernelBasis` (a field-kernel basis, with `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis` and `linearIndepOn_kernelBasis`); the bound x^d = 0 for nilpotent x is Cayley–Hamilton for the multiplication operator. ([NumberRings](#source-numberrings), §9, pp.233–234.) *Needs:* Mathlib `FiniteField.frobeniusAlgHom`; Mathlib `Ideal.radical`; Tau Ceti `TauCeti.kernelBasis`.

### 2.5 The p-radical in field coordinates (`pRadicalLattice`)

For a ℤ-subalgebra R of a number field K and natural p, pRadicalLattice R p is the integer submodule of x∈R with x^k∈pR for some k≥1. The nilradical and maximality results use full finite orders and prime p. It is the inverse image of the nilradical of R/pR. The exponent excludes the empty-power convention. This is a coordinate adapter for the native ideal radical, not a second definition of radical.

- Membership is a positive power in pR.
- The element p belongs to the p-radical.
- The lattice is stable under multiplication by its order.

Take the native radical of pR in R and map its underlying integer module through the inclusion R→K. For prime p and a full finite order, its image in R/pR is the Frobenius kernel of §2.4 at any exponent with p^k≥dim(R/pR). ([NumberRings](#source-numberrings), Equation (9-2) and following paragraph, pp.234–235.) *Needs:* Mathlib `Ideal.radical`; nilradical from a frobenius kernel (2.4); ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- *Degenerate case.* For a characteristic-zero field the zero-radical of an order is zero.
- *Computed value.* The p-radical of ℤ inside ℚ is pℤ for prime p.
- *Non-example.* 1 does not belong to the p-radical of ℤ at a prime.

### 2.6 Multiplier criterion for p-maximality (`pRadical_multiplier_eq_iff`)

For a full order R presented by an order basis presentation and a prime p, the multiplier ring of pRadicalLattice R p equals R iff IsPMaximal R p. In the nonmaximal case it is a strictly larger integral overorder contained in (1/p)R; its quotient over R is p-primary.

Apply Stevenhagen Proposition 9.3 to the p-primary saturation. If the order is already p-maximal, the multiplier ring lies between R and its p-primary saturation, forcing equality. Otherwise Proposition 9.3 supplies a multiplier outside R. Finite-lattice coordinate conversion is provided by ClassicalArithmeticCompletion §§3.25 and 3.48. ([NumberRings](#source-numberrings), Proposition 9.3 and its proof, p.235.) *Needs:* order basis presentation (2.1); `pRadicalLattice` (2.5); `multiplierRing` (2.2); `IsPMaximal` (2.3); ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

### 2.7 Integral basis presentation

An integral basis presentation K n is an order basis presentation K n together with a proof that its order is exactly the set of elements integral over ℤ. Thus its basis spans the native ring of integers, not merely a suborder. The multiplier criterion at every prime whose square divides the starting discriminant, together with the index–discriminant identity, implies this maximality.

- The presentation identifies the order with the integral closure.
- The rank is the rational field degree.
- Transport the checked coordinates to a native ℤ-basis of the ring of integers.

Store the full order basis and the exact maximality equation. The finite local checks are converted to this equation by the discriminant-index theorem; the resulting basis transports to the native RingOfIntegers carrier. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* order basis presentation (2.1); `pRadical_multiplier_eq_iff` (2.6); integer factor presentation (1.19).

**Checks.**

- *Computed value.* ℚ has an integral basis presentation of rank one.
- *Degenerate case.* A presentation has positive rank.
- *Non-example.* The rational 1/2 is excluded by the presentation for ℚ.

### 2.8 Integral bases extending any full order

For a number field K and any order basis presentation K n with lattice R,
there exists an integral basis presentation K n whose lattice contains R. Its lattice is the
native integral closure; its rank equals the input rank and the degree of K.

The input identities make every element integral. The native integer ring
is finite free of the same rank and contains R ([NumberRings](#source-numberrings), §9, printed pp.233–235).
*Needs:* §2.7; NumberFieldArithmetic Layers 3 and 7; ClassicalArithmeticCompletion
§3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- Over ℚ the output lattice is the integer ring, for every full input order.
- Rank zero cannot occur because K is a field containing ℚ.
- An input already spanning the integer ring gives the same lattice, with no chosen-basis equality asserted.

### 2.9 Prime-ideal decomposition presentation

For K a number field and a natural p, a prime-ideal decomposition K p stores a finite list of pairwise distinct nonzero prime ideals P_i of the native ring of integers, positive exponents e_i, and the identity pO_K=∏P_i^e_i. The arithmetic decomposition theorem assumes p is prime; the raw structure also permits p=1 with the empty list. Each ideal is presented in the exact integral basis. Primality may be checked by an explicit finite-field quotient presentation. At primes dividing a chosen power-basis index, the ideal identity is still required in the maximal order.

- The product is exactly the rational prime ideal.
- Every listed exponent is strictly positive.
- For prime p the decomposition cannot be empty.

Use native ideals, ideal multiplication and primality. The exact product and prime checks present the decomposition without trusting a discovered factor list. Residue fields are presented by finite-field presentation (0.16), and ideals by the integral basis coordinates. ([NumberRings](#source-numberrings), §9, pp.234–235; §12, p.248.) *Needs:* integral basis presentation (2.7); finite-field presentation (0.16).

**Checks.**

- *Computed value.* A rational prime stays a single prime of exponent one over ℚ.
- *Non-example.* A zero exponent cannot pad the output.
- *Degenerate case.* The zero ideal cannot occur.

### 2.16 Exact φ-adic polynomial expansion (`phiExpansion`)

For a commutative ring R and monic φ∈R[X] of positive degree m, phiExpansion φ f returns coefficients a_i∈R[X] of degree less than m, zero for i>floor(natDegree f/m), with f=Σa_iφ^i. It uses successive division by the monic polynomial φ; the coefficients are polynomials in R[X]. The zero polynomial has all coefficients zero.

- The finite φ-adic sum is f.
- Each coefficient has degree strictly below deg φ.
- Indices beyond the quotient-degree bound have zero coefficient.

Repeated monic quotient/remainder division lowers degree. The remainders are the a_i. Induction gives reconstruction, the degree bound and uniqueness. ([GMN](#source-gmn), §1.2, Definition 1.6, p.7.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* The expansion of zero is identically zero.
- *Agreement with the library notion.* For φ=X the coefficients are the constant polynomials C(f.coeff i).
- *Computed value.* For φ=X−1, X² has coefficients 1,2,1.

### 2.17 Valuation of a φ-coefficient (`coefficientValuation`)

For prime p and a∈ℤ[X], coefficientValuation p a is infinity if a=0, and otherwise the minimum v_p(a_i) over the nonzero coefficients. It uses WithTop ℕ, so the zero polynomial has infinite valuation; the native default v_p(0)=0 is never inserted into the minimum.

- Zero has infinite valuation.
- A nonzero constant has its usual integer valuation.
- A lower valuation bound means coefficientwise divisibility by p^N.

Take the finite minimum over the support of a, with top for the empty support. This is the Gauss valuation used only to compute the points of the φ-adic polygon.  ([GMN](#source-gmn), §1.2, p.7.) *Needs:* `phiExpansion` (2.16); Mathlib `padicValRat`.

**Checks.**

- *Degenerate case.* The zero polynomial gives top.
- *Computed value.* 3X+9 has 3-adic coefficient valuation 1.
- *Non-example.* X² has valuation zero, regardless of its zero constant coefficient.

### 2.18 A finite negative φ-Newton side (`IsPhiNewtonSide`)

For prime p and monic positive-degree φ∈ℤ[X], IsPhiNewtonSide p φ f s u e h d establishes the entire supporting side from (s,u) to (s+ed,u−hd), with slope −h/e. Require e,h,d>0, gcd(e,h)=1 and hd≤u. The two endpoint coefficient valuations equal their displayed ordinates. Every φ-expansion point lies on or above the line e·v_p(a_i)+h·i=e·u+h·s, and every point on that line has s≤i≤s+ed. Zero coefficients have valuation infinity. The φ-divisible initial segment has slope −∞ and is recorded separately by its multiplicity; it is not encoded with a finite e,h. The finite supporting-face geometry is NewtonPolygons §0.3.

- The slope denominator is positive.
- The left endpoint coefficient is nonzero.
- A side has strictly positive horizontal length ed.

Use the already specified φ-expansion and coefficient Gauss valuation. Clear the slope denominator to use exact integer inequalities. The inequalities identify a maximal supporting side of the φ-coefficient polygon. ([GMN](#source-gmn), Definitions 1.6–1.9, pp.7–8.) *Needs:* `phiExpansion` (2.16); `coefficientValuation` (2.17).

**Checks.**

- *Computed value.* X²−3 has the single 3-adic side of slope −1/2.
- *Degenerate case.* The zero polynomial has no finite side.
- *Non-example.* The slope of X²−3 is not −1.

### 2.19 Residual polynomial of a φ-Newton side (`phiResidualPolynomial`)

For side data (s,u,e,h,d), phiResidualPolynomial has coefficient at Y^j equal to the reduction in F_φ=(ℤ/pℤ)[X]/(φ mod p) of a_(s+ej)/p^(u−hj), for 0≤j≤d. Divide each integer coefficient exactly before reducing. For an exact side the divisions are exact; points strictly above the side give zero. The endpoint coefficients are nonzero when φ mod p is irreducible, so the residual degree is d and Y does not divide it. Uniformizer p and reduction of the chosen φ are fixed conventions.

- No coefficient above d occurs.
- On an exact side over an irreducible residue polynomial the degree is exactly d.
- The left endpoint gives a nonzero constant coefficient.

Use integer coefficient division, the native quotient AdjoinRoot and the finite monomial sum. Reduction and exact divisibility lemmas are separate proof requirements. ([GMN](#source-gmn), Definition 1.9, p.8.) *Needs:* `IsPhiNewtonSide` (2.18); finite-field presentation (0.16).

**Checks.**

- *Computed value.* For X²−3 the residual polynomial is Y−1, not Y or Y²−1.
- *Degenerate case.* Raw zero input gives zero residual output.
- *Non-example.* (X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.

### 2.19a Products and factorization of φ-polygons

Use a finite extension L/ℚ_p, its valuation ring O, residue field κ and a fixed uniformizer π.
Fix monic φ∈O[X] of positive degree whose reduction is irreducible. Extend the coefficient
Gauss valuation, φ-expansion and residual construction of §§2.16–2.19 to O, with π in place
of p; denote the negative principal polygon by the principal φ-polygon and the residual at
λ<0 by phi residual at slope. The polygon uses the lower convex envelope and supporting-face API of NewtonPolygons
§§0.1 and 0.3 on the finite φ-coefficient valuation sequence, restricted to negative slopes, with an initial −∞ side of length `ord_φ(f)`.
The residual polynomial uses the normalized coefficients at the supporting line of slope λ,
even when its λ-component has length zero. API: the principal φ-polygon slope comparison,
phi residual at slope ne zero, phi residual at slope uniformizer change; for `π′=ρπ` with
residue c, the change is `R′(Y)=c^(-u)*R(c^h*Y)` at a side starting at (s,u), of slope −h/e.
The integer definitions are their ℚ_p specialization (GMN Definitions 1.6, 1.8–1.10,
printed pp.7–8; GMN line 395).

**Checks.**

- At L=ℚ₃, φ=X, f=X²−3, the polygon has slope −1/2 and residual Y−1.
- A nonzero constant has a point polygon and a nonzero constant residual; f=0 is excluded.
- Changing π=3 to π′=−3 changes the residual of X²−3 from Y−1 to Y+1, fixing the unit factor.

Prove the φ-polygon and residual product identities: for arbitrary nonzero f,g∈O[X] and every
negative rational λ, the principal polygon of fg is the slope-ordered polygon sum and
`R_λ(fg)=R_λ(f)*R_λ(g)`. Monicity of f,g is unnecessary (GMN Theorem 1.13, printed
pp.10–11; GMN line 495). *Needs:* §§2.16–2.19 over O, NewtonPolygons §§0.1, 0.3, 3.2 and the displayed definitions.

**Checks.**

- Multiplication by one preserves the polygon and its residual polynomial exactly.
- At ℚ₃, `(X-3)^2` has slope −1 and residual `(Y-1)^2`, retaining multiplicity.
- `(X-3)*(X-9)` has two slopes −2 and −1; replacing both by the mean slope fails.

Prove factorization by φ-Newton sides: for monic f∈O[X] whose reduction is divisible by φ̄,
let f_φ be its unique monic Hensel factor reducing to the full φ̄-primary part.
It factors uniquely into monic factors for the distinct negative slopes. Each has the
corresponding side up to translation and the same residual up to a nonzero scalar;
for a root θ of the λ-factor, `v_L(φ(θ))=-λ`, with v_L extended from L, and the −∞
factor is `φ^ord_φ(f)` (GMN Theorem 1.15, printed pp.11–12; GMN line 575).
*Needs:* the φ-polygon product identity, the residual product identity, `henselFactor_completeDVR` (1.26a).

**Checks.**

- `(X-3)*(X-9)` over ℚ₃ splits into the two stated slope factors.
- `X²−3` has one slope and one polygon factor, although φ=X has degree one.
- `φ²` has only its −∞ factor; a finite-slope formulation would omit it.

Prove factorization by residual factors: for such monic f, a finite side of slope λ=−h/e,
and a factorization `R_λ(f) ~ ∏ ψ_i^a_i` into pairwise distinct monic irreducibles,
with every a_i>0, its slope factor is a product of monic G_i with
`R_λ(G_i) ~ ψ_i^a_i`, and each G_i has that single slope. For a root θ of G_i,
`e | e(L(θ)/L)` and `deg φ*deg ψ_i | f(L(θ)/L)`; if a_i=1, G_i is irreducible and
both divisibilities are equalities (GMN Theorem 1.19 and Corollary 1.20, printed
pp.14–15; GMN line 684). *Needs:* factorization by φ-Newton sides and the residual product identity.

**Checks.**

- At ℚ₃, `X²−3` has residual Y−1 with exponent one, giving e=2 and residue degree one.
- At ℚ₅, `X²-25` has slope −1 and residual `(Y-1)*(Y+1)`, producing two linear factors.
- At ℚ₃, `(X-3)^2` has exponent two in its residual factor; irreducibility cannot be concluded.

### 2.20 Ore residual irreducibility criterion (`ore_residual_irreducible`)

Let p be prime, φ and f monic in ℤ[X], deg φ>0, and φ mod p irreducible. Suppose f mod p=(φ mod p)^n, n>0, and the whole φ-polygon is the finite side from (0,hd) to (ed,0), with n=ed and coprime positive h,e. If its residual polynomial is irreducible over F_φ, then f is irreducible over ℚ_p. For a root θ the resulting local extension has ramification index e and residue degree deg(φ)·deg(R); these intrinsic invariants and their normalization are supplied by LocalFieldsRamification.

Use the product theorem for φ-polygons and residual polynomials, the polygon factorization theorem and residual factorization theorem. An irreducible residual factor of exponent one admits only one irreducible local factor. The native local degree formula then gives the ramification and residue degrees. ([GMN](#source-gmn), Theorem 1.19 and Corollary 1.20, pp.14–15.) *Needs:* `phiResidualPolynomial` (2.19); the φ-polygon product identity, the residual product identity, factorization by φ-Newton sides, factorization by residual factors (2.19a); TauCetiRoadmap LocalFieldsRamification Layer 0; `henselLift` (1.26).

### 2.21 Finite local expansion presentation

For a normed field L, chosen nonzero element π with ‖π‖<1, element x and digit count N, a finite local expansion stores an integer initial exponent v, digits d₀,…,dₙ₋₁ of norm at most one, and a proved remainder bound ‖x−π^vΣd_iπ^i‖≤‖π‖^(v+N). For local digit extraction, π is a uniformizer and the local field and reduction map are those of TauCetiRoadmap LocalFieldsRamification Layer 0; the presentation itself records only the norm conditions. A chosen residue section is a separate input; canonical Teichmüller representatives belong to TauCetiRoadmap LocalFieldsRamification Layer 1. Without a fixed residue section these finite digits are not canonical; equality of decoded approximations is not asserted to imply equality of digits.

- The exact finite centre is π^v times the digit polynomial.
- The supplied exact x lies in the exact local ball.
- Every exact digit has norm at most one.

Store exact native field elements and the norm inequality. A choice of residue section is additional data for any digit normalization; the record itself asserts precisely the displayed finite error inequality. Layer 0 supplies field and valuation structure, not an expansion theorem. Preserve the chosen prime, embedding and uniformizer normalization in comparisons. ([CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.) *Needs:* TauCetiRoadmap LocalFieldsRamification Layer 0; p-adic approximation (0.14); prime-ideal decomposition (2.9).

**Checks.**

- *Degenerate case.* Zero has a presentation with zero digits at every finite length.
- *Computed value.* π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1.
- *Non-example.* A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.

### 2.22 Squares of units in a finite extension of ℚ_p (`isSquare_iff_isSquare_mod`)

Let L be a characteristic-zero nonarchimedean local field, O_L its native valuation ring and π an irreducible element of O_L (a uniformizer). In particular this includes every finite extension of ℚ_p. A unit u ∈ O_L^× is a square in L exactly when u ≡ w² (mod 4π O_L) for some w ∈ O_L. Consequently the square class of a nonzero element of L is decided by the parity of its valuation and a finite computation in O_L/4πO_L. For odd p the condition says that the residue of u is a square in the residue field; for L = ℚ_2 it says u ≡ 1 (mod 8).

If u ≡ w² modulo 4π then w is a unit, and the polynomial X² − u satisfies |w² − u| ≤ |4π| < |2w|², so Newton's lemma gives a root of X² − u near w. The converse is immediate. For odd p, 4π generates the maximal ideal; for L = ℚ_2, 4π = 8 and the unit squares modulo 8 are 1. ([MilneANT](#source-milneant), Theorem 7.32 (Newton's lemma), printed p.120.) *Needs:* TauCetiRoadmap LocalFieldsRamification Layer 0; Tau Ceti `TauCeti.unitFiltration_le_range_powMonoidHom_two` in `TauCeti.NumberTheory.LocalField.Squares`.

For a characteristic-zero nonarchimedean local field L, irreducible π∈O_L with π²=2,
and u∈O_Lˣ with u=3+2π in L, prove that u is a square
and has a square representative modulo 4π, witnessed by 1+π.
The native `ℤ_[p]` specialization is is square iff is square mod padic;
local square controls bundles the 17, 5 and 6 comparisons below.

**Checks.**

- In ℚ₂, 17 is square while 5 is not; testing modulo four would falsely accept 5.
- In ℚ₅, 6 is square since its unit residue is one.
- in ℚ₂(√2), with π=√2, the unit 3+2π equals
  `(1+pi)^2`, so it passes the `4*pi` test; replacing π by the base prime changes the quotient.

### 2.23 Roots in ℚ_p from the decomposition of p (`card_padicRoots_eq`)

Let f ∈ ℚ[X] be monic irreducible, K = ℚ[X]/(f) and p a prime. The number of roots of f in ℚ_p equals the number of prime ideals P of O_K above p with ramification index and residue degree both equal to 1. For a separable f with irreducible factors f_j and fields K_j, the number of roots of f in ℚ_p is the sum of these counts over j. The prime-ideal decomposition of each K_j at p expresses this count as a finite cardinality.

K ⊗_ℚ ℚ_p is the product of the completions K_P over the primes P above p, and [K_P : ℚ_p] = e(P|p)·f(P|p). A root of f in ℚ_p is a ℚ-algebra map K → ℚ_p, equivalently a factor K_P of degree one. Distinct roots give distinct factors because f is separable. ([MilneANT](#source-milneant), Proposition 8.2 and its proof, printed p.136.) *Needs:* prime-ideal decomposition (2.9); existence of rational factor presentations (1.28);
NumberFieldArithmetic §§5.3, 5.5 (`semilocalEquiv`, `completionFactorsEquivPlaces`,
`factorFieldEquivCompletion`, and both local/global invariant comparisons);
TauCetiRoadmap LocalFieldsRamification Layer 0.

### Examples

- The `p`-radical of `ℤ` in `ℚ` is `pℤ`, whose multiplier ring is `ℤ`, so `ℤ` is `p`-maximal (`pRadicalLattice` (2.5), `pRadical_multiplier_eq_iff` (2.6)).
- `X² − 3` has the single `3`-adic side of slope `−1/2` with residual polynomial `Y − 1`; `(X − 3)²` has the repeated residual `(Y − 1)²`, so the square-free hypothesis of Ore's criterion fails there (`IsPhiNewtonSide` (2.18), `phiResidualPolynomial` (2.19)).
- In `ℚ_2`, `17` is a square and `5` is not, although `5 ≡ 1 (mod 4)`; in `ℚ_5`, `6` is a square because `6 ≡ 1 (mod 5)` (`isSquare_iff_isSquare_mod` (2.22)).
- `X² − 2` has two roots in `ℚ_7`, because `7` splits in `ℚ(√2)`, and none in `ℚ_2`, because `2` ramifies (`card_padicRoots_eq` (2.23)).
- `π⁻¹` has a length-one expansion with initial exponent `−1` and digit `1` (finite local expansion (2.21)).

### Dependencies

Layers 0–1; NewtonPolygons §§0.1, 0.3, 3.2; ClassicalArithmeticCompletion §§3.25, 3.27 and 3.48; Completed NumberFieldArithmetic Layers 3, 5 and 7; TauCetiRoadmap LocalFieldsRamification Layers 0–1; Mathlib (number fields, `Ideal.radical`, Frobenius); Tau Ceti `TauCeti.kernelBasis`.

## Layer 3: exact modular and elliptic arithmetic data

The integral Fourier-coefficient lattice lives inside the complex space of level-one forms.
Construct its Miller basis from the normalized `E₄`, `E₆` and `Δ`, and keep it distinct from the
integral modular-symbol lattice. Mathlib's characteristic-zero Sturm theorem gives exact equality;
congruence modulo a prime needs the integral model and its own theorem. Hecke matrices and finite
coefficient arrays are bound to the intrinsic operators before any numerical example or database
identification is exported. The second half of the layer treats elliptic curves over `ℚ`: point
counts over finite fields, exact local images of the `x − T` descent map with a size check
that decides completeness, and a finite criterion for `p`-saturation of a subgroup of the
Mordell–Weil group.

*Proof obligations of the layer.* Prove coefficient integrality of the normalized E₄, E₆ and Δ, the dimension-compatible monomial family, its leading powers and integral unitriangular elimination (Stein Algorithm 2.18, Lemma 2.20 and Remark 2.21, pp.19–21). The full modular lattice uses the constant-term-one monomial and cusp basis in `exists_integralModularBasis` (§3.3a), avoiding Bernoulli denominators. The congruence Sturm bound uses its integral pivot coordinates and the level-one q-expansion principle of AlgebraicModularFormsAndSerreWeights R15.2 (Stein Theorem 9.18, pp.171–172). In the BCG examples a singular residual determinant gives a finite witness, and a characteristic-zero eigenform comes from the Deligne–Serre lifting lemma of R15.5. A companion system needs one common eigenvector for all Hecke operators, the theta operator and Hasse invariant of R15.3, and a finite congruence Sturm presentation; matching roots of two characteristic polynomials is not enough. The classification includes determinant or congruence identities for every listed witness and every exclusion in the finite ranges. In the cohomological convention of BCG, a_g(ℓ) = ℓ^(p−k)·a_f(ℓ), so the exponent at (107, 26) is 81; at (151, 52) and (151, 100) the gcd condition gives 3, not 1. For elliptic curves, every finite output is bound to Tau Ceti's objects: point counts to `WeierstrassCurve.pointCount`, local images to the subgroup range μ of `W_v.M`, and saturation verdicts to divisibility in W(ℚ).

### 3.1 Integral q-expansion lattice (`integralModularLattice`)

For integer weight k, integralModularLattice k is the ℤ-submodule of ModularForm SL₂(ℤ) k consisting of forms whose width-one q-expansion coefficients all belong to the image of ℤ in ℂ. This is a coefficient lattice inside the space of forms. It is distinct from the upstream integral modular-symbol module, which lives on the homological side.

- Membership is integrality of every q coefficient.
- The zero form is integral.
- Elements agree if their underlying modular forms agree.

Use the existing modular-form carrier and q-expansion. Close the integral coefficient condition under addition and integer scalar multiplication. ([Stein](#source-stein), Lemma 2.20 and Remark 2.21, pp.20–21.) *Needs:* Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

**Checks.**

- *Degenerate case.* Zero is in the weight-zero lattice.
- *Agreement with the library notion.* Mathlib’s unit-constant E₄ is integral.
- *Non-example.* One half of E₄ is not integral because its constant term is 1/2.

### 3.2 Integral cusp-form lattice (`integralCuspLattice`)

integralCuspLattice k is the ℤ-submodule of CuspForm SL₂(ℤ) k consisting of forms with every width-one q coefficient in ℤ⊆ℂ. Its inclusion in the modular-form coefficient lattice is the native cusp-to-modular inclusion. It contains no Eisenstein summand.

- Membership is integrality of all coefficients.
- Its constant coefficient is zero by native cuspidality.
- Equality is equality of underlying cusp forms.

Restrict the integral q-coefficient condition to the native cusp-form carrier. ([Stein](#source-stein), Lemma 2.20, pp.20–21.) *Needs:* `integralModularLattice` (3.1).

**Checks.**

- *Computed value.* The normalized discriminant is in the weight-12 lattice.
- *Degenerate case.* The weight-zero cusp lattice is zero.
- *Non-example.* One half of Δ fails integrality at the first coefficient.

### 3.3 Integral Miller basis

For even k∈ℕ and d=dimℂ S_k(SL₂(ℤ)), Miller basis k is a ℤ-basis f₁,…,f_d of integralCuspLattice k satisfying a_j(f_i)=δ_ij for 1≤i,j≤d. Use unit-constant F₄=1+240Σσ₃(n)qⁿ and F₆=1−504Σσ₅(n)qⁿ. They agree with Mathlib E₄,E₆; Stein’s unnormalized symbols require his scaling factors.

- `exists_millerBasis`: Such a normalized integer basis exists at every even nonnegative weight.
- The first d positive coefficients form the identity matrix.
- For `i : Fin d`, coordinate i is the coefficient at i+1.
- A basis with the same first-d coefficient normalization is this basis.

At k=0,2 the cusp space is zero. Otherwise choose a,b≥0 with 4a+6b in {0,4,6,8,10,14} and k=12d+4a+6b, choosing a=b=0 when k≡0. The forms Δ^j F₆^(2(d−j)+b) F₄^a have leading coefficient 1 at q^j. Integral triangular elimination gives the Kronecker first-d coefficients. The native dimension bound shows these span over ℂ; the leading coefficients then force integral coordinates for each integral cusp form. ([Stein](#source-stein), Algorithm 2.18 and Lemma 2.20, pp.19–21.) *Needs:* `integralCuspLattice` (3.2); Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

**Checks.**

- *Degenerate case.* At weight zero the basis index type is empty.
- *Computed value.* At weight 12 the sole basis form is Δ.
- *Non-example.* Weight two has no cusp basis vector.

### 3.3a Full integral modular basis (`exists_integralModularBasis`)

For every k∈ℕ prove `exists_integralModularBasis`: the full integral modular lattice
has a finite ℤ-basis b_i, indexed by its complex dimension, and distinct nonnegative
pivot indices n_i≤⌊k/12⌋ with `a_(n_i)(b_j)=delta_ij`. For every nonzero even
weight with forms, adjoin a constant-term-one monomial in normalized E₄,E₆ to the
cusp Miller basis, then clear its positive pivot coefficients integrally. At weight zero
use the constant form 1; at weight two and at odd weights use the empty basis.
The dimension and q-expansion theorems give spanning, and the pivot coefficients force
integral coordinates (Stein Algorithm 2.18, Lemma 2.20 and Remark 2.21, pp.19–21;
Stein lines 1096, 1134 and 1162).
*Needs:* §§3.1–3.3; Mathlib `ModularForm.dimension_level_one`,
`ModularForm.sturm_bound_levelOne_nat`; AlgebraicModularFormsAndSerreWeights R15.2.

**Checks.**

- Weight zero has the singleton basis 1 with pivot zero; a cusp-only construction misses it.
- Weight two and all odd weights have empty bases, despite the nonempty coefficient range.
- Weight twelve has basis `E4^3-720*Delta`, Δ with pivots 0,1; both leading coefficients
  are one and their two pivot rows form the identity matrix.

### 3.4 Level-one congruence Sturm bound (`levelOne_congruence_sturm`)

Let k∈ℕ and f belong to integralModularLattice k. For a prime p, if every coefficient a_n(f) for 0≤n≤floor(k/12) is divisible by p, then every coefficient is divisible by p. This is a congruence statement in the integral lattice, not the characteristic-zero identity theorem.

Use the integral triangular basis at level one to propagate divisibility from the initial coefficients to all integral coordinates. Stein’s alternative proof uses the integral polynomial-in-j expansion and multiplication by Δ. Apply `exists_integralModularBasis` to recover each integral coordinate at its pivot. ([Stein](#source-stein), Theorem 9.18, pp.171–172, level-one case.) *Needs:* `integralModularLattice` (3.1); `exists_integralModularBasis` (3.3a); AlgebraicModularFormsAndSerreWeights R15.2.

### 3.5 Equality of finite modular coefficient data

modularDataEqual B a b is coefficientwise equality of two arrays of isolated algebraic values indexed by 0,…,B. For two same-weight modular forms on a finite-index subgroup Γ of SL₂(ℤ), set B=(k·[SL₂(ℤ):Γ]).toNat/12 and require that the decoded arrays equal the forms’ coefficients at their actual strict cusp width. Acceptance then proves equality by the native Sturm bound. The two coefficient binding proofs are hypotheses: a database label alone provides neither of them.

- Acceptance is coefficientwise equality of native algebraic values.
- Correctly bound finite-index modular forms coincide on acceptance.
- Swapping the arrays preserves the verdict.

Apply the exact algebraic-value comparison at each index. Use the two coefficient binding proofs and the native Sturm theorem, including coefficient zero. Modular symbols, integral Hecke algebras, orbit labels and trace formulas stay with TauCetiRoadmap ModularForms Layers 8, 9 and 11; this comparison uses only q-expansions and the Sturm bound. ([Stein](#source-stein), Theorem 9.18, pp.171–172; §9.4.) *Needs:* equality of algebraic values (0.13); Tau Ceti `TauCeti.ModularForm.eq_of_sturm_bound`; TauCetiRoadmap ModularForms Layer 10.

**Checks.**

- *Degenerate case.* Bound zero still checks the constant coefficient.
- *Computed value.* Identical arrays pass.
- *Non-example.* Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.

### 3.6 Level-one Hecke recurrence contract

For arbitrary natural k and p, the level-one prime recurrence for an endomorphism T records the coefficient formula a_m(Tf)=a_pm(f)+p^(k−1)a_(m/p)(f) when p∣m, with second term zero otherwise, for every level-one cusp form f. T is a supplied complex linear endomorphism on the native space. For k≥2 and prime p the canonical operator comes from the upstream Hecke action and its pinned coefficient theorem; this predicate specifies the coefficient comparison.

- The first coefficient of T_p f is a_p(f) for p>1.
- At fixed k,p the recurrence determines the endomorphism uniquely.
- The endomorphism preserves the integral cusp lattice.

State the native recurrence on the level-one cusp space after identifying Γ₁(1) with SL₂(ℤ). Keep p and k explicit. ([Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.) *Needs:* Tau Ceti `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`; `integralCuspLattice` (3.2).

**Checks.**

- *Degenerate case.* The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence.
- *Computed value.* At weight 12 and p=2, T₂ acts by −24.
- *Non-example.* The zero endomorphism does not represent T₂ at weight 12.

### 3.7 Integral Hecke matrix in the Miller basis

For even k≥2, prime p and an endomorphism T satisfying the level-one recurrence, integral Hecke matrix k p T is its integer matrix in the Miller basis, using column vectors. Entry (i,j) is a_(i+1)(T f_j), uniquely read as an integer; the recurrence computes it from coefficients of f_j through degree p·d. It represents an operator on the forms lattice, distinct from the dual modular-symbol matrix.

- Column j consists of the integral coefficients a_(i+1)(T f_j).
- The matrix acts on the native integer coordinate column of every lattice form.
- The coefficient comparison uniquely determines the integer matrix.

For the acceptance statements, `IntegralHeckeAction k` bundles the integer
endomorphisms of `integralCuspLattice k` and the complete prime recurrence.
Its API is restriction to the integral lattice, uniqueness from all Fourier
coefficients, and agreement of its coordinate matrices with the displayed column
convention. This record specifies the operators used in the eigenvector statements.

The recurrence preserves the integral cusp lattice. Restrict T to a ℤ-linear map and apply the native matrix-of-linear-map construction to the Miller basis. Its first-d coefficient property gives the entry formula. ([Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.) *Needs:* level-one prime recurrence (3.6); Miller basis (3.3).

**Checks.**

- *Degenerate case.* The weight-two matrix has dimension zero and determinant one.
- *Computed value.* The weight-12 T₂ determinant is −24; for a two-coordinate column (u,v), the weight-38 matrix at 79 sends it to (3u+17v,25u+10v) modulo 79, fixing the column convention.
- *Non-example.* At p=2, weight 12 is nonordinary: −24 reduces to zero.
- At weight 12 the zero endomorphism fails the recurrence at p=2,n=1:
  it gives zero where a₂(Δ)=−24 is required; arbitrary operators cannot satisfy the record.

### 3.8 The coefficient at 107 of ΔE₄²E₆

With the unit-constant Mathlib E₄,E₆ and normalized discriminant Δ, the coefficient at q^107 of ΔE₄²E₆ equals 35830422465487817813321292. This exact integer is −1 modulo 107. The coefficient theorem establishes ordinarity once the existing eigenform and reduction interfaces are supplied.

Use the exact integral coefficient formulas and truncate products beyond degree 107. Multiply over ℤ, then compare the resulting coefficient through the native q-expansion multiplication map. The coefficient identity follows in the native q-expansion ring, independently of labels. ([BCG](#source-bcg), §2.3, proof of Theorem 2.4, p.515.) *Needs:* `integralModularLattice` (3.1); `integralCuspLattice` (3.2).

### 3.9 Ordinary reduction at 107

The exact coefficient 35830422465487817813321292 reduces to −1 in ZMod 107, hence is nonzero.

Reduce the exact numeral modulo 107. This arithmetic check uses the exact coefficient theorem for its interpretation as a Hecke eigenvalue. ([BCG](#source-bcg), §2.3, p.515.) *Needs:* the coefficient identity of §3.8 (3.8).

### 3.10 Nonordinary determinant at weight 38 and prime 79

The determinant of the level-one T₇₉ matrix on the integral weight-38 cusp lattice is divisible by 79. Together with the Deligne–Serre lifting lemma, this yields a characteristic-zero eigenform with a₇₉ in a prime above 79. Also gcd(37,80)=1. The determinant statement alone is kept separate from that eigenform-lifting input.

Construct the dimension-two Miller basis, compute the recurrence through degree 158, and reduce its exact integer determinant modulo 79. A singular reduction gives a residual eigensystem, which lifts to a characteristic-zero eigenform by the Deligne–Serre lifting lemma of AlgebraicModularFormsAndSerreWeights R15.5. ([BCG](#source-bcg), Corollary 3.2 proof, p.518.) *Needs:* integral Hecke matrix (3.7); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

### 3.11 Exact nonordinary weight-prime pair (`NonordinaryLevelOnePair`)

NonordinaryLevelOnePair k p means p is prime, k≥2 is even, and the determinant of an integral matrix for the intrinsic level-one T_p action on S_k vanishes modulo p. The matrix must satisfy the complete coefficient recurrence, which determines the operator uniquely. To export existence of a characteristic-zero eigenform with nonordinary reduction, use the Deligne–Serre lifting lemma of AlgebraicModularFormsAndSerreWeights R15.5.

- An exact pair has prime residue characteristic.
- An exact pair has even positive weight.
- The cusp space of an exact pair has positive dimension.

Equivalently, `NonordinaryLevelOnePair k p` asserts that an integral cusp form has
at least one coefficient not divisible by p, while every coefficient of its T_p
recurrence is divisible by p. This is a nonzero kernel vector over 𝔽_p: the Miller
basis identifies the coefficient lattice modulo p with 𝔽_p^d, so it is equivalent
to the determinant formulation. It requires no choice of a characteristic-zero
Hecke eigenform or of an independent eigenvalue at each prime.

Use the matrix construction and reduce its integer determinant into ZMod p. The empty matrix has determinant one, so zero-dimensional spaces never pass. ([BCG](#source-bcg), Corollary 3.2 and Remark 3.3, p.518.) *Needs:* integral Hecke matrix (3.7); level-one prime recurrence (3.6); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

**Checks.**

- *Computed value.* The pair (38,79) passes.
- *Degenerate case.* No weight-two pair passes.
- *Non-example.* The weight-26 form is ordinary at 107.
- A form all of whose coefficients are divisible by p, including zero and pΔ,
  cannot be a nonzero witness even when its T_p recurrence vanishes modulo p.

### 3.12 The first two nonordinary level-one primes

Among primes p≤79, a level-one nonordinary eigenform of even weight 2≤k<p exists exactly for p=59 or p=79. The determinant witnesses occur at weights 16 and 46 for 59, and 38 and 44 for 79. The weight-16 witness at 59 fails gcd(k−1,p+1)=1, whereas weight 38 at 79 passes it.

The Miller basis and coefficient recurrence identify the determinant reduction for every prime p≤79 and every even weight below p, with nonzero determinants for the exclusions. The Sturm/basis comparison proves these are the intrinsic operators; dimension-zero cases contribute determinant one. ([BCG](#source-bcg), Remark 3.3, p.518, for the filtered primes; [CG13](#source-cg13), Appendix, Table of results, p.14, N-marked entries and the companion-weight relation.) *Needs:* `NonordinaryLevelOnePair` (3.11); integral Hecke matrix (3.7).

### 3.13 Nonordinary pairs below 200 (`nonordinary_pairs_lt_200`)

For prime p<200 and even 2≤k<p, the nonordinary pairs (p,k) are exactly (59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124). Filtering by gcd(k−1,p+1)=1 gives the primes 79,151,173,193 used in the nonordinary part of BCG Remark 3.3.

Identify the determinant reductions for every prime and even weight in the stated finite range, including the nonzero reductions for excluded pairs; the integer gcd condition gives the filtered list. ([BCG](#source-bcg), Remark 3.3, p.518, for the filtered primes; [CG13](#source-cg13), Appendix, Table of results, p.14, N-marked entries and the companion-weight relation.) *Needs:* `NonordinaryLevelOnePair` (3.11); integral Hecke matrix (3.7).

### 3.13a Localized Fourier lattice and geometric reduction image

Let k≥2 be even, fix a number field K with embedding K→ℂ, a finite place λ over a
prime p, and O=O_(K,λ) with residue field κ. Let L_q be the submodule of
S_k(SL₂(ℤ),K) whose Fourier coefficients lie in O, as in
AlgebraicModularFormsAndSerreWeights R15.2, “The integral cusp lattice and its reduction image”.
Prove the O-linear equivalence `O tensor_Z integralCuspLattice(k) ≃ L_q`
sending a⊗f to af. It preserves every Fourier coefficient and intertwines all integer
Hecke operators. Indeed, the Miller pivots a_i(f_j)=δ_ij show that a form has all
coefficients in O exactly when its coordinates in this basis lie in O; the inverse
reads off its first d coefficients. This is the coefficient-lattice consequence of
Stein Lemma 2.20 and Remark 2.21, printed pp.20–21 (Stein lines 1134–1165).

Choose an embedding κ→𝔽̄_p. Reducing this equivalence and extending scalars gives
`ResidualCuspSpace p k ≃ Fbar_p tensor_O L_q`, with the same coefficient and Hecke
comparisons. For p>3, identify L_q with the geometric cusp lattice L through
AlgebraicModularFormsAndSerreWeights R15.1, “Level-one and level-two descent”, and R15.2's
analytic and q-expansion comparisons. Prove that the induced map identifies this
residual space with `Fbar_p tensor_kappa S_red`, where
`S_red = im(L/λL → S_k(X_κ))` is R15.2's reduction image. Injectivity follows from
the pivot coefficients, which remain the identity matrix after reduction. The target
is this image; no surjectivity onto all Katz forms is assumed. The companion examples
in §§3.14–3.16 all have p>3, so theta and Hasse act on the supplied geometric forms
after this comparison.

*Needs:* Miller basis (3.3); integral Hecke recurrence and matrices (3.6–3.7);
Mathlib `Module.Basis.baseChange` and `LinearMap.baseChange`;
AlgebraicModularFormsAndSerreWeights R15.1, “Level-one and level-two descent”, and R15.2,
“The integral cusp lattice and its reduction image”.

**Checks.**

- At k=2, d=0: both localized lattices and their reduction images are zero.
- At k=12, the inverse sends aΔ to a=a₁(aΔ); after reduction 1⊗Δ has first
  coefficient 1 and 1⊗(pΔ) has first coefficient 0. T₂ acts by −24 on both sides.
- At k=38,p=79 the two pivot coordinates remain independent, and T₇₉ has matrix
  `[[3,17],[25,10]]` on both sides; its value on (47,1) is (158,1185)=(0,0) modulo 79.
- At p=3 the Katz cusp form AΔ has weight 14 and first coefficient 1, whereas
  the characteristic-zero weight-14 cusp lattice and its reduction image are zero.
  Thus an assertion about all Katz forms would exceed this comparison's hypotheses.

### 3.14 Complete companion eigensystem at weight 82 (`weight82_companion_system`)

Let a_n be the exact integer coefficients of f=ΔE₄²E₆. The level-one integral Hecke matrices at weight 82 admit a common nonzero eigenvector over an algebraic closure of 𝔽₁₀₇, with eigenvalue ℓ⁸¹a_ℓ for every prime ℓ≠107. Equivalently a_ℓ(f)=ℓ²⁵a_ℓ(g) modulo 107. This coefficient convention matches BCG’s cohomological Galois normalization ρ̄_f≅ε̄⁻²⁵ρ̄_g, whose determinant is ε̄^(1−k). A common root of two separate characteristic polynomials is insufficient.
At ℓ=2, a₂(f)=−48≡59 and 2⁸¹≡45 modulo 107, so the companion eigenvalue is
87; at ℓ=3, a₃(f)=−195804≡6 and 3⁸¹≡53, giving 104. Using the opposite
exponent 25 would instead give 56 and 95, fixing the twist convention.

Use §3.13a to identify the localized and residual Fourier lattices with R15.2’s
coefficient lattice and geometric reduction image. Construct a common residual eigensystem, apply the mod-p theta/Hasse weight comparison, and prove the full congruence with a congruence Sturm bound. The theta operator, its eigenvalue shift a_ℓ ↦ ℓ·a_ℓ and the Hasse invariant are AlgebraicModularFormsAndSerreWeights R15.3's; the lift of a residual eigensystem is R15.5's; the cohomological normalization is the one fixed in this statement. These proof inputs are not inferred from two Hecke eigenvalues. ([BCG](#source-bcg), Theorem 2.4 proof, p.515.) *Needs:* localized Fourier lattice and geometric reduction image (3.13a); integral Hecke matrix (3.7); `levelOne_congruence_sturm` (3.4); the coefficient identity of §3.8 (3.8); AlgebraicModularFormsAndSerreWeights R15.3; AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

The acceptance carrier `ResidualCuspSpace p k` is
`AlgebraicClosure (ZMod p) ⊗[ℤ] integralCuspLattice k`, using the prime-field
scalar map. The operator `residualHecke T l` is `LinearMap.baseChange` of the
integer operator, with that same algebraic closure as coefficient field.
The weight-82 statement takes any integral weight-26 form with first coefficient
one; its one-dimensional space identifies it with ΔE₄²E₆. It produces one
nonzero vector for the whole prime family, with the exact integer Fourier
coefficients of that form in the eigenvalue formula.

The residual space has this API:

- A Miller basis extends to a basis over the algebraic closure, of the same dimension.
- An integer scalar acts through its residue class, so p times any pure tensor is zero.
- The map from the integral lattice to the residual space sends f to 1⊗f.

**Checks.**

- At k=2 the Miller basis is empty, so the residual space has dimension zero.
- At k=12 it has dimension one, and 1⊗Δ is nonzero while 1⊗(pΔ)=0.
- At k=38,p=79 it has dimension two; replacing it by the complex cusp space
  would give characteristic zero instead of 79.

The residual operator has this API:

- On a pure tensor a⊗f it acts as a⊗T_l(f).
- In the extended Miller basis its matrix is the reduction of the integer matrix.
- It is linear over the algebraic closure, so one vector carries the complete eigenvalue family.

**Checks.**

- At k=12,p=5,l=2 its scalar is −24≡1, rather than zero.
- At k=12,p=2,l=2 its scalar is −24≡0, so reduction can create a kernel.
- At k=38,p=79,l=79 the reduced matrix is `[[3,17],[25,10]]`, and
  `(47,1)` is a nonzero kernel vector: both coordinates of the product are zero modulo 79.

### 3.15 Ordinary level-one companion pair (`OrdinaryCompanionPair`)

For a prime p, ordinary companion pair p k means 2≤k<p, both k and k′=p+1−k are even, and the integral level-one Hecke operators in these weights have common residual eigensystems over an algebraic closure of 𝔽_p. The first eigensystem has eigenvalues a_ℓ and a_p≠0. For every prime ℓ≠p the companion eigenvalue is ℓ^(p−k)a_ℓ, equivalently a_ℓ=ℓ^(k−1)b_ℓ. Each eigensystem is represented by one nonzero vector simultaneously for all prime Hecke matrices, not a collection of independently chosen eigenvalues.

- The weight is even and strictly between 1 and p.
- The first cusp space has positive dimension. Ordinarity belongs to the selected eigensystem; other eigensystems in the same space may be nonordinary.
- The companion cusp space is also nonzero.

The acceptance predicate `OrdinaryCompanionPair p k` uses two instances of
`IntegralHeckeAction`, nonzero vectors in their `ResidualCuspSpace`s, and eigenvalue
functions a,b satisfying the eigenvector equations for every prime, including p.
The twist comparison is imposed at every prime other than p.

Use §3.13a for the coefficient-lattice and geometric-reduction comparisons, then the integer Hecke matrices and coefficientwise reduction into the algebraic closure. Record both operator families, their intrinsic recurrence comparisons, two nonzero simultaneous eigenvectors and their eigenvalue function. Characteristic-zero lifting is the Deligne–Serre lemma of AlgebraicModularFormsAndSerreWeights R15.5. ([BCG](#source-bcg), Theorem 2.1 and §2.3, pp.513–515; Remark 3.3, p.518.) *Needs:* localized Fourier lattice and geometric reduction image (3.13a); integral Hecke matrix (3.7); level-one prime recurrence (3.6); complete companion eigensystem at weight 82 (3.14); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

**Checks.**

- *Computed value.* Weight 26 at 107 has companion weight 82.
- *Degenerate case.* There is no eligible weight for p=2.
- *Non-example.* Weight two has no cusp eigensystem.

### 3.16 Ordinary companion witnesses and coprimality (`ordinary_companion_list`)

For (p,k)=(107,26),(139,20),(173,68),(179,30),(191,30),(193,48), an ordinary companion pair p k exists and gcd(k−1,p−1)=1. The candidate at p=151 has weights 52 and 100, and gcd(51,150)=gcd(99,150)=3, so those companion forms do not satisfy BCG Theorem 2.1. No exhaustive statement about all primes is made.

Establish the simultaneous eigensystem for each pair, lift it with the Deligne–Serre lemma of AlgebraicModularFormsAndSerreWeights R15.5, and check the integer gcd. T₂/T₃ checks are discovery evidence; the target requires full congruence presentations. ([BCG](#source-bcg), Remark 3.3, p.518; [CG13](#source-cg13), §§6–7, pp.11–12 and Appendix, Table of results, p.14, C-marked entries.) *Needs:* ordinary companion pair (3.15); `levelOne_congruence_sturm` (3.4); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

### 3.17 Point counts over a finite field by enumeration

Let F be a finite field with q elements and decidable equality, of any characteristic, and W a Weierstrass curve over F, singular or not. Write S(W) ⊆ F × F for the finite set obtained by filtering `Finset.univ` by the affine equation y² + a₁xy + a₃y = x³ + a₂x² + a₄x + a₆. Then Tau Ceti's projective count is W.pointCount = #S(W) + 1, so W.frobeniusTrace = q − #S(W); on an elliptic model #S(W) + 1 is also the cardinality of Mathlib's point type.

The character-sum form of this count is imported. For odd q and a₁ = a₃ = 0, with f(x) = x³ + a₂x² + a₄x + a₆ and χ = quadraticChar F, EllipticLegendreCharacterInterfaces §5.1 supplies the identity between W.pointCount and q + 1 + Σ_(x∈F) χ(f(x)), singular equations included, and §5.2 supplies the trace of the quadratic twist W.quadraticTwistOf 0 (−d/4) as χ(d) times the trace of W, for every d ∈ F. This section owns the enumeration and its comparison with those identities.

- W.pointCount = #S(W) + 1 and W.frobeniusTrace = q − #S(W).
- For odd q and a₁ = a₃ = 0: #S(W) = q + Σ_(x∈F) χ(f(x)), and for every d ∈ F, q − #S(W′) = χ(d)·(q − #S(W)) with W′ = W.quadraticTwistOf 0 (−d/4).

The filtered set is the solution subtype whose `Nat.card` defines W.pointCount (Tau Ceti `WeierstrassCurve.pointCount_def`), and on a finite type the two cardinalities agree; `WeierstrassCurve.frobeniusTrace_def` gives the trace, and Mathlib's `WeierstrassCurve.Affine.equation_iff` unfolds the affine equation to the displayed identity. The comparison rewrites W.pointCount and both traces by the enumeration and then applies EllipticLegendreCharacterInterfaces §§5.1–5.2; the square-root count behind those identities belongs to that roadmap. The comparison with Mathlib's point type on an elliptic model is Tau Ceti's pointCount_eq_card_point. ([Sutherland](#source-sutherland), §7.3, p.3, counting the affine solutions in F_q × F_q and adding the point at infinity.) *Needs:* EllipticLegendreCharacterInterfaces §5.1 (character-sum point count); EllipticLegendreCharacterInterfaces §5.2 (quadratic-twist trace); Tau Ceti `WeierstrassCurve.pointCount_def`; Tau Ceti `WeierstrassCurve.frobeniusTrace_def`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; Mathlib `WeierstrassCurve.Affine.equation_iff`; Mathlib `quadraticChar`.

**Checks.**

- *Computed value.* For y² = x³+x over ZMod 3, S(W) = {(0,0), (2,1), (2,2)}; x = 1 contributes nothing because f(1) = 2 is not a square. So W.pointCount = 4 and the trace is 0.
- *Computed value.* For y² = x³+x+1 over ZMod 5, #S(W) = 8, so W.pointCount = 9 and the trace is −3. The values χ(f(x)) at x = 0,…,4 are 1, −1, 1, 1, 1, with sum 3 = #S(W) − q, as the comparison with §5.1 requires.
- *Computed value.* The twist of the same W by the nonsquare d = 2, W.quadraticTwistOf 0 (−2/4), is y² = x³+4x+3 over ZMod 5. Its filtered set is {(2,2), (2,3)}, so its count is 3 and its trace is 3 = χ(2)·(−3), as the comparison with §5.2 requires.
- *Degenerate case.* The cusp y² = x³ over ZMod 5 has #S(W) = 5, the singular solution (0,0) included, so W.pointCount = 6 and the trace is 0. Mathlib's point type has 5 elements here, so on a singular model the enumeration, not pointCount_eq_card_point, gives the count.
- *Boundary case.* Over ZMod 2, y² = x³+1 has S(W) = {(0,1), (1,0)} and W.pointCount = 3, so the enumeration holds in characteristic two. There q + 1 + Σ χ(f(x)), with Mathlib's quadraticChar of ZMod 2, is 4: the comparison with §5.1 needs odd q.

### 3.18 Exact local image of the 2-descent map

Let W be an elliptic Weierstrass curve over ℚ with a₁ = a₃ = 0 and integral a₂, a₄, a₆, with cubic f, and let v be a prime p or the real place, K_v = ℚ_p or ℝ. Write W_v for its base change, A_v = K_v[X]/(f), M_v = A_v^×/A_v^(×2) (Tau Ceti `W_v.M`) and μ_v : W_v(K_v) → M_v the x − T map (Tau Ceti `μ`). A local image presentation W v consists of: (i) finitely many rationals x₁, …, x_k with f(x_i) a nonzero square in K_v, checked exactly (at ℝ: f(x_i) > 0; at p: the p-adic valuation of f(x_i) is even and its unit part passes the square test of `isSquare_iff_isSquare_mod` (2.22)); (ii) the number r_v of roots of f in K_v, exact at ℝ by the sign of the discriminant (three real roots when it is positive, one when it is negative) and at p by `card_padicRoots_eq` (2.23); (iii) the subgroup H_v of M_v generated by the classes of x_i − T. Its target size is N_v = (1 + r_v)·|2|_v^(−1) at a prime and N_v = (1 + r_v)/2 at ℝ, and the presentation is complete when #H_v = N_v. The order of H_v is computed by deciding which products of the generators are squares in each field factor of A_v.

- `localImageSpan`: The subgroup H_v ≤ W_v.M generated by the classes `W_v.μX x_i` of the x_i − T.
- H_v ≤ range μ_v whenever every f(x_i) is a nonzero square in K_v.
- N_v = (1 + r_v)·|2|_v^(−1), or (1 + r_v)/2 at ℝ.
- The predicate #H_v = N_v.
- #H_v = 2^(rank over 𝔽₂ of the classes of the x_i − T).

Each x_i is the abscissa of a point P_i ∈ W_v(K_v), and μ_v(P_i) is the class of x_i − T because f(x_i) ≠ 0 (Tau Ceti μX_of_eval_f_ne_zero), so the y-coordinate is never needed. A_v is the product of the fields K_v[X]/(f_j) for the irreducible factors f_j of f over K_v, and a class is trivial exactly when each component is a square, which the square test decides. The discriminant criterion over ℝ is the statement that E(ℝ) has one or two components according to its sign. ([FPS](#source-fps), §7, Lemma 4 and its proof, p.17; [Cremona](#source-cremona), §3.6, printed p.93, the two discriminant signs.) *Needs:* `isSquare_iff_isSquare_mod` (2.22); `card_padicRoots_eq` (2.23); Tau Ceti `WeierstrassCurve.Affine.μ`; Tau Ceti `WeierstrassCurve.Affine.M`; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`.

**Checks.**

- *Computed value.* For y² = x³ − x at ℝ, the cubic discriminant 4 is positive, r_∞ = 3 and N_∞ = 2; the abscissae −1/2 and 2 give the two classes (+,−,−) and (+,+,+) of signs of x − e_i, so #H_∞ = 2 and the presentation is complete.
- *Degenerate case.* With no abscissae H_v is trivial; this is complete exactly when N_v = 1, for example at ℝ for y² = x³ + 1, whose discriminant is negative.
- *Non-example.* For y² = x³ − x at p = 2, N_2 = (1+3)·2 = 8, while the single abscissa 1/4 (f(1/4) = −15/64, unit part −15 ≡ 1 mod 8) gives #H_2 ≤ 2; the presentation is not complete.

### 3.19 The size check completes a local image

The local comparison holds for every elliptic W over ℚ_p, with prime p, or over ℝ,
with a₁=a₃=0, and every finite list of abscissae in that local field for which f(x) is a
nonzero square. In these general forms, `localImageSpan_eq_range_of_card_padic` uses
`#H=(1+r)*(if p=2 then 2 else 1)`, and `localImageSpan_eq_range_of_card_real` uses
`2*#H=1+r`. The rational-abscissa presentations of §3.18 specialize these statements.

For every local image presentation C of W at v, H_v ≤ range μ_v. If C is complete then H_v = range μ_v, and Tau Ceti's local condition W.localCondition K_v is the preimage of H_v under W.localRes K_v. If #H_v < N_v then H_v ≠ range μ_v, so the size check is both sufficient and necessary.

Every generator is μ_v of an actual point. The kernel of μ_v is 2W_v(K_v) (Tau Ceti ker_μ_eq), so #range μ_v = [W_v(K_v) : 2W_v(K_v)]. This index is #W_v(K_v)[2]·|2|_v^(−1) at a prime and #W_v(ℝ)[2]/2 at ℝ, and #W_v(K_v)[2] = 1 + r_v (Tau Ceti card_ker_nsmul_two); so #range μ_v = N_v. A subgroup of a finite group with the same order is the whole group, and mem_localCondition_iff identifies the local condition. ([Mattuck](#source-mattuck), Theorem 7, p.114, for the local subgroup used in the index calculation; [FPS](#source-fps), §7, proofs of Lemmas 3 and 4, pp.16–17, for the dimension-two application of that calculation.) *Needs:* local image presentation (3.18); HeightsRationalPointsAndObstructions §1.17 (local indices of multiplication by two); Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Tau Ceti `WeierstrassCurve.Affine.mem_localCondition_iff`.

### 3.20 Complete local images exist

For every W as above and every place v there is a complete local image presentation.
The acceptance theorems `exists_complete_localImage_padic` and
`exists_complete_localImage_real` express this with finite lists of rational abscissae.
Their base changes retain a₁=a₃=0. The existence statements hold for every rational
elliptic model in this normal form, independently of coefficient integrality.

Every coset of 2W_v(K_v) is open and infinite: multiplication by two maps a sufficiently small local Lie subgroup onto an open subgroup. Thus each coset has a point away from the finite 2-torsion subgroup and the point at infinity. The map P ↦ μ_v(P) is locally constant there, and the abscissa determines the class. The set of x ∈ K_v with f(x) a nonzero square is open, and ℚ is dense in K_v, so every class in the finite group range μ_v is the class of x − T for some rational x. Finitely many such x generate range μ_v, which gives the required finite presentation. ([Mattuck](#source-mattuck), Theorem 7, p.114, for the nonarchimedean local subgroup; [FPS](#source-fps), §7, Lemma 4, p.17, as a concrete local-generator example. The general argument uses openness of nonzero square classes, local constancy of μ, and density of ℚ in ℝ and ℚ_p.) *Needs:* the size check completes a local image (3.19); Tau Ceti `WeierstrassCurve.Affine.μ`; `TauCeti.isOpen_range_powMonoidHom` in `TauCeti.NumberTheory.LocalField.PowerSubgroup.Open`; density of rational casts in ℝ and ℚ_p.

**Checks.**

- For y²=x³−x over ℝ, the rational abscissae −1/2 and 2 generate an image of order two.
- For y²=x³+1 over ℝ, the image has order one, so an empty abscissa list is complete.
- For y²=x³−x over ℚ₂, the rational abscissae −4, −16, −23 have cubic values
  −60, −4080, −12144, with valuations 2,4,4 and unit parts 1 modulo eight.
  Their x−T classes are independent and generate order eight; retaining only 1/4
  would generate order two.

### 3.21 Local images at good odd primes (`localImage_of_good_odd`)

Let p be an odd prime and W an elliptic Weierstrass curve over ℚ_p with a₁ = a₃ = 0, integral coefficients and no bad primes over ℤ_p (Tau Ceti `badPrimes`). Then range μ equals the intersection of Tau Ceti's unramified subgroup W.selmerGroupA ℤ_p with the kernel of the norm map W.normM. In particular, for a curve over ℚ and a set S containing 2 and the bad primes, the local conditions at primes outside S impose nothing beyond being unramified with square norm, so the Selmer local conditions reduce to those at S and ℝ together with unramifiedness and square norm.

The inclusion is Tau Ceti's range_μ_le_selmerGroupA together with range_μ_le_ker_normM. For the count, f has distinct roots modulo p, so every field factor of A is unramified over ℚ_p and contributes two unit square classes. The unramified norm-on-units contract of LocalFieldsRamification Layer 2 makes the norm on unit square classes onto ℤ_p^×/ℤ_p^(×2). Thus its kernel has order 2^((number of factors) − 1) = 1 + r_p: the cubic splitting types are (3), (1,2) and (1,1,1), with kernel orders 1, 2 and 4. The index formula at odd p gives #range μ = 1 + r_p, so the inclusion is an equality. This count is the argument for the equality; Cremona supplies the local-solubility context, rather than this norm-kernel theorem. ([Cremona](#source-cremona), §3.6, Checking local solubility, p.80; [FPS](#source-fps), §7, proof of Lemma 3, pp.16–17, for the local index argument in dimension two.) *Needs:* the size check completes a local image (3.19); HeightsRationalPointsAndObstructions §1.17 (local indices of multiplication by two); TauCetiRoadmap LocalFieldsRamification Layer 2; Tau Ceti `WeierstrassCurve.Affine.selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.normM`.

**Checks.**

- At p=5, y²=x³−x has three residue roots, three unramified factors and norm-kernel order 2²=4.
- At p=5, X³+X+1 has no residue root, one unramified cubic factor and norm-kernel order 2⁰=1.
- At p=5, X³+1 has one residue root and two unramified factors, giving norm-kernel order 2¹=2.
- At p=2 the factor |2|₂⁻¹ is two; the image of y²=x³−x has order eight,
  so the good-odd comparison cannot replace the all-prime local-image theorem.

### 3.22 p-saturated subgroups (`IsPSaturated`)

Let A be an additive commutative group, G ≤ A a subgroup and p a natural number. G is p-saturated in A when every a ∈ A with p·a ∈ G lies in G. Equivalently A[p] ≤ G and G ∩ pA = pG. When [A : G] is finite and p is prime, G is p-saturated exactly when p does not divide [A : G], and G = A exactly when it is p-saturated for every prime p dividing the index.

- IsPSaturated G p ↔ A[p] ≤ G ∧ G ⊓ p•⊤ = p•G.
- For finite index and prime p: IsPSaturated G p ↔ ¬ p ∣ G.index.
- The whole group is p-saturated.
- A finite-index subgroup that is p-saturated for every prime p ≤ [A : G] is the whole group.

If G is p-saturated then A[p] ≤ G, and pa ∈ G forces a ∈ G. Conversely, if pa = pg with g ∈ G then a − g ∈ A[p] ≤ G. For finite index, Cauchy's theorem in A/G gives a ∉ G with pa ∈ G when p divides the index; when it does not, the class of such an a has order dividing both p and the index, so it is trivial. ([Siksek](#source-siksek), §4, p.17, equation (39).) *Needs:* Mathlib `AddSubgroup.index`.

**Checks.**

- *Computed value.* In ℤ, 6ℤ is 5-saturated and is neither 2- nor 3-saturated.
- *Degenerate case.* ⊤ ≤ A is p-saturated for every p.
- *Non-example.* In ℤ × ℤ/2, G = ℤ × 0 satisfies G ∩ 2A = 2G but is not 2-saturated, because A[2] is not contained in G.

### 3.23 p-saturation reduces to finitely many divisibility tests

Let A be an additive commutative group, p a prime and G ≤ A generated by g₁, …, g_m. The set V_p of b̄ ∈ 𝔽_p^m with Σ b_i g_i ∈ pA is a well-defined 𝔽_p-subspace, because p·g_i ∈ pA. Then V_p = 0 and A[p] ≤ G hold together exactly when G is p-saturated and the classes of g₁, …, g_m are linearly independent in G/pG. V_p = 0 is decided by testing Σ b_i g_i ∈ pA for one representative of each line of 𝔽_p^m: use |b_i| ≤ (p−1)/2 for odd p and b_i ∈ {0,1} for p = 2. In particular the nonzero class modulo 2 must be tested.

Suppose V_p = 0 and A[p] ≤ G. If pa ∈ G, write pa = Σ c_i g_i; then c̄ ∈ V_p, so c = p·c′, and a − Σ c′_i g_i lies in A[p] ≤ G, hence a ∈ G. Independence in G/pG holds because pG ⊆ pA. Conversely, saturation gives A[p] ≤ G and G ∩ pA = pG, so an element of V_p has Σ b_i g_i ∈ pG and b̄ = 0 by independence. Lines suffice because V_p is a subspace. ([Siksek](#source-siksek), §4, equation (39), and §4.1, p.17; §4.2, projective representatives and the p = 2 exception, p.18.) *Needs:* `IsPSaturated` (3.22).

The variant is psaturated iff forall not dvd of span quotient assumes only g_i ∈ G and that their classes generate G/pG: every x ∈ G can be written Σ c_i g_i + py with y ∈ G. It has the same equivalence between V_p = 0 together with A[p] ≤ G, and p-saturation together with independence in G/pG. In the forward proof write pa = Σ c_i g_i + py, then apply the preceding argument to a − y. This is the version used when prime-to-p torsion is omitted from the generator list.

**Checks.**

- At p=2, A=ℤ and g₁=2, coefficient one witnesses failure; rounding the odd-prime bound down to zero would miss it.
- At A=ℤ/3, p=2 and G=A, the empty list generates G/2G=0 and the quotient-generating variant establishes saturation; it does not generate G itself.
- At A=ℤ/2, p=2 and G=0, the empty candidate space is insufficient because A[2] is not contained in G.

### 3.24 Exact test for divisibility of a rational point by p

Let W be an elliptic Weierstrass curve over ℚ, p a prime and P = (x_P, y_P) a nonzero point of W(ℚ). Then P ∈ pW(ℚ) exactly when the monic polynomial Φ_p(X) − x_P·ΨSq_p(X) ∈ ℚ[X] of degree p², built from Mathlib's division polynomials, has a rational root x₀ for which one of the at most two points Q = (x₀, y₀) ∈ W(ℚ) above x₀ satisfies pQ = P. The degree-one factors of a rational factor presentation give exactly the rational roots, a finite set. The zero point is always divisible.

If pQ = P with Q = (x₀, y₀), Tau Ceti's mul_eval_ΨSq_eq_eval_Φ_of_zsmul gives x_P·ΨSq_p(x₀) = Φ_p(x₀). The polynomial is monic of degree p² because Φ_p is monic of degree p² and ΨSq_p has degree p² − 1, so it is nonzero and has finitely many rational roots. Conversely, a candidate Q is checked directly with the group law, and W(ℚ) has at most two points with a given abscissa. ([Siksek](#source-siksek), §4.2, equation (41), pp.18–19.) *Needs:* existence of rational factor presentations (1.28); Tau Ceti `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul`; Mathlib `WeierstrassCurve.natDegree_Φ`; Mathlib `WeierstrassCurve.leadingCoeff_Φ`; Mathlib `WeierstrassCurve.natDegree_ΨSq`.

### 3.25 The reduction sieve for p-saturation

First prove the generic joint-reduction criterion. Let A and C_i be additive
commutative groups, G≤A, p prime, and ψ_i:A→C_i a finite family of homomorphisms
with pC_i=0. If their induced joint map G/pG→∏_i C_i is injective and A[p]≤G,
then G is p-saturated. Every ψ_i kills pA, so injectivity gives G∩pA=pG;
§3.22 then applies. This criterion needs neither finite index nor a free generator list.

**Checks.**

- In A=ℤ, G=3ℤ, p=2, reduction to ℤ/2 sends the generator 3 to 1. The induced
  map G/2G is injective and G is 2-saturated: 2a divisible by 3 forces 3 to divide a.
- In A=ℤ, G=2ℤ, p=2, reduction modulo 2 sends the generator 2 to 0. Its joint
  kernel is nonzero, and 2·1∈G with 1∉G witnesses failure of saturation.
- In A=ℤ/2, G=0, p=2, the map from G/2G=0 is injective even for an empty
  reduction family, but 2·1=0 with 1∉G. The ambient-torsion condition excludes it.

Let W be an elliptic Weierstrass curve over ℚ with integral coefficients, p a prime and g₁, …, g_m ∈ W(ℚ). For a prime q of good reduction let ρ_q : W(ℚ) → W̃(𝔽_q)/pW̃(𝔽_q) be reduction followed by the quotient. Each ρ_q vanishes on pW(ℚ), so V_p is contained in the kernel of the 𝔽_p-linear map 𝔽_p^m → W̃(𝔽_q)/pW̃(𝔽_q), b ↦ Σ b_i ρ_q(g_i). If the intersection of these kernels over finitely many good primes is 0, then V_p = 0. A prime q contributes only when p divides #W̃(𝔽_q).

Reduction at a prime of good reduction is a group homomorphism W(ℚ) → W̃(𝔽_q), so it sends pW(ℚ) into pW̃(𝔽_q). Hence an element of V_p maps to zero under every ρ_q. The p-part of W̃(𝔽_q)/pW̃(𝔽_q) is trivial unless p divides the group order. ([Siksek](#source-siksek), §4.1, equation (40), pp.17–18.) *Needs:* p-saturation reduces to finitely many divisibility tests (3.23); TauCetiRoadmap EllipticCurves Layer 4; point counts over a finite field by enumeration (3.17).

### 3.26 Finite p-saturation criterion

Define the finite p-saturation criterion for an integral elliptic Weierstrass curve W/ℚ,
a prime p, rational points g₁,…,g_r and representatives t₁,…,t_s of a basis of
`W(ℚ)_tors/p W(ℚ)_tors`. Let G be generated by these g_i and all rational torsion.
The predicate says no nonzero coefficient class in `𝔽_p^(r+s)` represents a p-divisible
point of W(ℚ). It is a finite family of exact divisibility conditions.

- `pSaturationCriterion_iff`: This predicate holds iff G is p-saturated and the displayed
  classes of g and t are independent in G/pG.
- The reduction-kernel containment of §3.25 preserves
  every possible divisibility class.
- If G has finite index and the criterion holds,
  p does not divide that index.

The acceptance theorem `pSaturationCriterion_iff` states the quotient-generation
criterion on the actual group of rational points: for a subgroup G and a finite
list g_i∈G generating G/pG, the finite tests range over coefficients in `Fin p`.
Their triviality together with containment of ambient p-torsion is equivalent to
p-saturation and independence of the displayed classes in G/pG. For the stated
rational-torsion application, G contains every torsion point.

The quotient-generation version of §3.23 applies because G contains every torsion point;
the division-polynomial comparison of §3.24 identifies the exact divisibility conditions
(Siksek, §4, equations (39)–(41), printed pp.17–19).
*Needs:* §§3.23–3.25; EllipticCurves Layer 6.

**Checks.**

- For `y²=x³-x`, r=0 and G is the full rational group; the criterion holds at every prime.
- If g₁=2Q with Q of infinite order, the coefficient class one violates it at p=2.
- For g=(Q,2Q), the classes are dependent at every p; the criterion fails even if G is saturated.

### Examples

- Mathlib's `E₄` is integral and `E₄/2` is not; at weight `12` the Miller basis is `{Δ}` and `T₂` acts by `−24`, so `2` is nonordinary there (`integralModularLattice` (3.1), Miller basis (3.3), integral Hecke matrix (3.7)).
- The coefficient of `q^107` in `ΔE₄²E₆` is `35830422465487817813321292 ≡ −1 (mod 107)` (the coefficient identity of §3.8 (3.8)).
- At weight `38` the integral matrix of `T₇₉` in the Miller basis reduces modulo `79` to `[[3, 17], [25, 10]]`, whose determinant `30 − 425 = −395 = −5·79` vanishes modulo `79` (nonordinary determinant at weight 38 and prime 79 (3.10)).
- `y² = x³ + x + 1` over `ZMod 5` has `9` points and Frobenius trace `−3` (point counts over a finite field by enumeration (3.17)).
- For `y² = x³ − x` at the real place the abscissae `−1/2` and `2` give a complete local image of order `2` (local image presentation (3.18)).
- In `ℤ`, `6ℤ` is `5`-saturated and neither `2`- nor `3`-saturated (`IsPSaturated` (3.22)).

### Dependencies

Layers 0–2; TauCetiRoadmap LocalFieldsRamification Layer 2; TauCetiRoadmap ModularForms Layers 7–11; AlgebraicModularFormsAndSerreWeights R15.1–R15.3, R15.5; TauCetiRoadmap EllipticCurves Layers 4 and 6; EllipticLegendreCharacterInterfaces §§5.1–5.2; HeightsRationalPointsAndObstructions §1.17; Mathlib (level-one modular forms, `quadraticChar`, division polynomials); Tau Ceti (Sturm bound, Hecke recurrence, point count, `x − T` descent, division-polynomial identity).

## Layer 4: quantitative analytic bounds and finite Gram data

Every enclosure contains a specified native value. Analytic truncation error is part of
the bound. Polynomial root sets carry both distinct-root isolation and completeness.
The scalar CT formulas and their enclosures are unconditional; their automorphic
positivity interpretation is outside this roadmap. Entrywise matrix bounds are used on
nonnegative vectors; unrestricted vectors require a positive-semidefinite comparison.

*Proof obligations of the layer.* Prove the explicit remainders in §§4.17a, 4.19a and
4.20a, including their domains and decay. Pair polynomial root finiteness with rational
separation. The finite-conductor zero theorems require the mathematical character and zero
counts of Platt §§4–7, printed pp.3–15. For CT, keep the gamma shifts, the weighted
alternating-tail threshold, and the diagonal `A/m_i` with lift `t_i/m_i`. An enlarged
ellipsoid bound gives a cover; extra points are retained explicitly.

### 4.1 Rational interval multiplication

For I=[a,b] and J=[c,d] with rational endpoints, the signed interval product of I and J is [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]. These are enclosing intervals in ℝ under the rational embedding. The existing monotone interval multiplication does not apply to arbitrary signed rational endpoints.

- The lower endpoint is the minimum of the four corner products.
- Multiplication is symmetric in its two intervals.
- Singleton intervals multiply as rational numbers.

Evaluate all four corner products. Their minimum is at most their maximum; package these as the endpoints of the existing NonemptyInterval ℚ carrier. ([Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* [−2,3] times [−4,5] is [−12,15].
- *Degenerate case.* The singleton zero times any interval is the singleton zero.
- *Non-example.* [−1,1] times itself has lower endpoint −1, not +1.

### 4.2 Enclosure under multiplication

For x,y∈ℝ, if a≤x≤b and c≤y≤d, then xy lies between the endpoints of signed interval product [a,b] [c,d], with all rational endpoints cast into ℝ.

Split each input interval at zero. In each of the four sign cases, order compatibility of multiplication bounds xy by the corresponding corner products. ([Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.) *Needs:* signed interval product (4.1).

### 4.3 Partial interval reciprocal

The partial interval reciprocal of I returns none when 0∈I and otherwise returns the interval [1/I.upper,1/I.lower]. Failure is data and carries no assertion that the mathematical reciprocal exists at zero.

- Successful inversion twice recovers the input interval.
- Failure is equivalent to the input interval containing zero.
- Successful output has reciprocals of the reversed input endpoints.

Decide whether the rational endpoints straddle zero. On either remaining sign component, inversion reverses order. ([Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* The reciprocal of [2,4] is [1/4,1/2].
- *Degenerate case.* The singleton zero is rejected.
- *Computed value.* The reciprocal of [−4,−2] is [−1/2,−1/4].

### 4.4 Enclosure under reciprocal

If partial interval reciprocal I=some J and x∈ℝ lies in I, then x≠0 and 1/x lies in J.

Unfold the successful branch and distinguish positive and negative intervals; apply order reversal of inversion in that sign component. ([Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.) *Needs:* partial interval reciprocal (4.3).

### 4.5 Outward dyadic rounding

For precision p∈ℕ, outward dyadic hull p [a,b]=[floor(2^p a)/2^p,ceil(2^p b)/2^p]. Negative endpoints use floor and ceiling, not truncation toward zero. The representation remains NonemptyInterval ℚ.

- Both output endpoints lie on the 2^(−p) rational grid.
- The original interval is contained in the rounded interval.
- Rounding again at the same precision does not change the interval.

Use the integer floor and ceiling of each scaled endpoint. Positivity of 2^p proves the endpoints are ordered. ([Arb](#source-arb), §3.1, p.4; §5, p.7.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* At p=2 the singleton 1/3 becomes [1/4,1/2].
- *Non-example.* At p=0 the singleton −1/3 becomes [−1,0].
- *Degenerate case.* Exact zero remains exact at every precision.

### 4.6 Width added by dyadic rounding

The width of outward dyadic hull p I is less than width(I)+2·2^(−p). The strict bound includes exact endpoints.

Each endpoint moves outward by strictly less than 2^(−p); add the two floor/ceiling error inequalities. ([Arb](#source-arb), §3.1, p.4; §5, p.7.) *Needs:* outward dyadic hull (4.5).

### 4.7 Rational complex-box denotation (`complexBoxSet`)

A complex box is represented by the native pair (R,I) of closed nonempty rational intervals. complexBoxSet(R,I) is {z∈ℂ | Re(z)∈R and Im(z)∈I}. No new complex-number carrier or rounded value equality is introduced. Degenerate boxes and boxes meeting branch cuts are allowed; analytic evaluators must account for their entire image.

- Membership is membership of both real components in their endpoint intervals.
- Every nonempty component pair denotes a nonempty complex set.
- Expanding each component interval expands the denotation.

Define the four real endpoint inequalities using rational casts. ([Arb](#source-arb), §5 and §5.3, pp.7–8.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Degenerate case.* The pair of singleton zero intervals contains only zero.
- *Computed value.* The box [0,0]×[1,1] contains i.
- *Non-example.* A strictly positive real lower endpoint excludes zero.

### 4.8 Unique integer extraction

unique-integer recovery I returns the integer ceil(I.lower) precisely when ceil(I.lower)=floor(I.upper); otherwise it returns none. It asserts uniqueness inside the closed interval, not that an unknown real number in it is integral.

- A returned integer lies in the input interval.
- The output is z iff z is the unique integer in I.
- A singleton integer is recovered.

Compute the smallest and largest integers in the rational interval. Compare them exactly. ([Arb](#source-arb), §2.3, pp.3–4.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* [3/4,5/4] contains exactly the integer 1.
- *Non-example.* [0,1] is rejected because both endpoints are integers.
- *Degenerate case.* The singleton 1/2 contains no integer and is rejected.

### 4.9 Recovery of a known integral value

If z is an integer, its real image belongs to I, and unique-integer recovery I=some w, then z=w. An enclosure around zero alone never proves that a general real or complex analytic value vanishes.

Cast the rational endpoint inequalities and apply uniqueInteger_iff to the known integer z. ([Arb](#source-arb), §2.3, pp.3–4.) *Needs:* unique-integer recovery (4.8).

### 4.10 Normalize a rational p-adic ball

For prime p, rational centre c and absolute precision N∈ℤ, padicNormalize p c N returns the unique canonical p-adic approximation at precision N with denotation {x | ‖x−c‖≤p^(−N)}. Its valuation field is N if c=0, and min(v_p(c),N) otherwise. For v<N the mantissa is the unique residue in [1,p^(N−v)) prime to p representing c·p^(−v) modulo p^(N−v).

- Absolute precision is retained.
- Normalization preserves the entire rational-centred ball.
- The zero branch avoids the native valuation-at-zero default.
- Normalizing an already canonical centre and precision recovers the approximation.

Separate the zero and high-valuation cases. Otherwise invert the denominator prime to p modulo p^(N−v) and reduce the scaled numerator. Native p-adic truncation compares this residue with the original rational centre. ([CarusoPublished](#source-carusopublished), §2.1.1, Proposition 2.1.1 and Definition 2.1.2, pp.II–17–II–18.) *Needs:* p-adic approximation (0.14); Mathlib `PadicInt.toZModPow`; Mathlib `padicValRat`.

**Checks.**

- *Degenerate case.* Zero at precision 5 has valuation 5 and mantissa zero.
- *Computed value.* 5 modulo 3 normalizes to mantissa 2.
- *Non-example.* 9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.

### 4.11 Exact p-adic addition

Add two canonical p-adic approximations by normalizing the sum of centres at absolute precision min(N,N′). For every independently chosen x in the first ball and y in the second, the sum lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

- The output has the stated absolute precision.
- The output contains every result from independently chosen inputs.
- The canonical result is symmetric in its inputs.

Expand the error around the exact rational centres and apply the ultrametric inequality. ([CarusoPublished](#source-carusopublished), §2.1.2, Proposition 2.1.3, equation (2.1), p.II–18.) *Needs:* normalize a rational p-adic ball (4.10); p-adic approximation (0.14).

**Checks.**

- *Degenerate case.* The operation on two precision-zero zero-centred balls contains zero.
- *Computed value.* At p = 3, (1 + O(3²)) + (2 + O(3³)) has centre 3 and absolute precision 2, so its canonical form is (N, v, s) = (2, 1, 1).
- *Agreement with the library notion.* At p = 3, O(3²) + (1 + O(3⁴)) is 1 + O(3²), with canonical tuple (2,0,1); using the larger input precision would lose admissible sums.

### 4.12 Exact p-adic multiplication

Multiply two canonical p-adic approximations by normalizing the product of centres at absolute precision min(v+N′,N+v′). For every independently chosen x in the first ball and y in the second, the product lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

- The output has the stated absolute precision.
- The output contains every result from independently chosen inputs.
- The canonical result is symmetric in its inputs.

Expand the error around the exact rational centres and apply the ultrametric inequality. For multiplication the mixed error has valuation at least N+N′, which is no smaller than either retained bound because v≤N and v′≤N′. ([CarusoPublished](#source-carusopublished), §2.1.2, Proposition 2.1.3, equation (2.3) and its proof, pp.II–18–II–19.) *Needs:* normalize a rational p-adic ball (4.10); p-adic approximation (0.14).

**Checks.**

- *Degenerate case.* The operation on two precision-zero zero-centred balls contains zero.
- *Computed value.* At p = 3, O(3²)·(1 + O(3⁴)) is O(3²), with canonical tuple (2,2,0); replacing the zero centre by valuation zero would give the wrong precision.
- *Agreement with the library notion.* At p = 3, O(3²)·O(3⁴) is O(3⁶), with canonical tuple (6,6,0); taking the minimum of the input precisions would miss this gain.
- *Computed value.* At p=3, multiply 3+O(3^4) by 1/3+O(3^2): the normalized output has centre 1 and absolute precision min(1+2,4−1)=3.

### 4.13 Partial p-adic inversion

padicInverse rejects a zero-mantissa approximation, because its ball contains zero. Otherwise it returns the normalized reciprocal of the rational centre at absolute precision N−2v. Every element in the input ball is nonzero and its inverse lies in this output. The input relative precision N−v is preserved.

- Rejection is exactly the presence of zero in the input ball.
- A successful output has precision N−2v.
- A successful output encloses reciprocals of every input value.

Write x=c+h with v(h)≥N>v(c). Then x has the same valuation as c and x⁻¹−c⁻¹=−h/(cx), of valuation at least N−2v. ([CarusoPublished](#source-carusopublished), §2.1.2, proof of Proposition 2.1.3, equation (2.5), p.II–19.) *Needs:* normalize a rational p-adic ball (4.10); p-adic approximation (0.14).

**Checks.**

- *Degenerate case.* The zero-centred ball is rejected.
- *Computed value.* Inverting a precision-four unit preserves absolute precision four.
- *Non-example.* Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.

### 4.14 Odlyzko tail kernel

Odlyzko tail kernel(x)=2π²exp(−x)/(x²+π²)² for real x. It is positive everywhere and decreases on [0,∞). This is the scalar exponentially decaying kernel in the evaluation formulas for both F_ℓ and G_ℓ.

For every ℓ>0, CT's F_ℓ satisfies (POS): F_ℓ is nonnegative on ℝ, and the real part
of its Fourier transform is nonnegative when |Im ξ|≤1/(4π). Its automorphic positivity
application is therefore unconditional. The corresponding application of G_ℓ uses GRH
and the weaker requirement that the test function and its Fourier transform be
nonnegative on ℝ (CT Definition 2.1 and Proposition 2.2, printed pp.276–277;
§2.4.3, p.281; §4.3, p.298). Neither automorphic implication is a target here.
The scalar kernel, evaluation formulas and error bounds for both families are unconditional.

- The kernel is strictly positive.
- At zero its value is 2/π².
- For x,t≥0, r(x+t)≤exp(−t)r(x).

Use native real exp and π. Positivity follows from π≠0. On the nonnegative half-line both the exponential factor decreases and the positive denominator increases. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* At x=0 the kernel is exactly 2/π², rather than zero or 2π².
- *Computed value.* r(1) is strictly below r(0).
- *Non-example.* The kernel is not even: r(−1)>r(1).

### 4.15 Geometric bound for the Odlyzko tail

For α>0, b≥0 and N∈ℕ, the series Σr(α(b+n)) converges and its tail after indices 0,…,N−1 lies in [0,r(α(b+N))/(1−exp(−α))]. N=0 includes the entire series.

The preceding kernel inequality gives a geometric majorant with ratio exp(−α)<1. Sum that majorant and use termwise positivity. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* Odlyzko tail kernel (4.14).

### 4.16 Alternating Odlyzko tail bound

For α>0 and b≥0, the absolute error after the first N terms of Σ(−1)^n r(α(b+n)) is at most r(α(b+N)). The weighted n·r(αn) variant used by J_F(1−ε) needs its own monotonicity threshold; α(N+1)≥1 is a sufficient rationally checkable replacement for the sharper decimal threshold in the source.

The kernel decreases to zero, so apply the alternating-series remainder theorem. For the weighted variant, differentiate log(xr(x)); it is decreasing for x≥1. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* Odlyzko tail kernel (4.14); geometric bound for the odlyzko tail (4.15).

### 4.17 Closed scalar formulas for CT evaluation

For ℓ>0 and w∈ℕ, define the eight CT real scalar expressions in the following order. Put
`phi(z) = (digamma((z+1)/2)-digamma(z/2))/2`,
`z0 = 1/2+i*pi/l`, `z1 = 1+i*pi/l`, `zF = 1/2+w/4+i*pi/(2*l)` and
`zG = (1+w)/2+i*pi/l`. Let `r = ctTailKernel`,
`S(a,b) = sum(n>=0, r(a*(b+n)))`, `T(a,b) = sum(n>=0, (-1)^n*r(a*(b+n)))`, and
`W(a) = sum(n>=1, (-1)^(n+1)*n*r(a*n))`. Primes on ψ and φ mean complex derivatives.
The scalar order is the Fourier values at zero and i/(4π), then the I_w and 1−ε
functionals, first for F and then for G; this order specifies numerical expressions.

| Index | Real expression |
| --- | --- |
| 0 | `4*Re(phi(z0))-4/pi*Im(phi(z0))+4/l*Re(phi'(z0))+4*l*T(l,1/2)` |
| 1 | `8*l/pi^2` |
| 2 | `log(pi)-Re(psi(zF))+Im(psi(zF))/pi-Re(psi'(zF))/(2*l)+2*l*S(2*l,1/2+w/4)` |
| 3 | `1+2*pi/l*Im(phi(z1))+2*pi/l^2*Im(phi'(z1))+2*l*W(l)` |
| 4 | `8*l/pi^2` |
| 5 | `4*pi^2*l*(1+cosh(l/2))/(l^2/4+pi^2)^2` |
| 6 | `log(2*pi)-Re(psi(zG))+Im(psi(zG))/pi-Re(psi'(zG))/l+l*S(l,(1+w)/2)` |
| 7 | `Re(phi(z0))-Im(phi(z0))/pi+Re(phi'(z0))/l+l*T(l,1/2)` |

- Indices 1 and 4 agree, even for the total real-valued
  expression at arbitrary real ℓ; the analytic formulas and error bounds require ℓ>0.
- Their common value is 8ℓ/π².
- Index 5 has the displayed cosh expression.

These formulas fix the Fourier/Laplace normalization `Fhat(0)=Phi_F(1/2)` and
`Fhat(i/(4*pi))=Phi_F(0)` (CL Proposition 3.17, printed pp.304–305;
CT Proposition 4.4, printed pp.298–299). *Needs:* §§4.14–4.16;
Mathlib `Complex.digamma` and complex derivatives.

**Checks.**

- At ℓ=1, both indices 1 and 4 are exactly 8/π² and lie between 4/5 and 41/50.
- At ℓ=2, both become 16/π²; this tests the factor ℓ rather than its inverse.
- Weight zero gives `Re zF=Re zG=1/2`, while the arguments of ψ inside φ have
  real part at least 1/4; all denominators in §4.17a remain nonzero.

### 4.17a Explicit digamma and trigamma remainders

For z∈ℂ with `Re z > 0`, N≥1 and `a = min(1,Re z)`, let
`D_N(z) = -gamma + sum(n<N, 1/(n+1)-1/(n+z))` and
`T_N(z) = sum(n<N, 1/(n+z)^2)`, where γ is Euler's constant.
Prove `digamma_series_remainder` and `trigamma_series_remainder`:
`norm(psi(z)-D_N(z)) <= norm(z-1)/(N-1+a)` and
`norm(psi'(z)-T_N(z)) <= 1/(N-1+a)`.
Every n+z is nonzero since its real part is positive, and N−1+a>0.
The harmonic–logarithm bounds for Euler's constant in the supplier contracts give its
arbitrarily narrow enclosures. Both bounds tend to zero as N→∞; the bounds hold uniformly when `Re z ≥ a0>0`
and `norm(z-1) ≤ C`, with a replaced by min(1,a0). For the weighted series in
§4.16, prove the weighted alternating-tail estimate: at α>0 and α(N+1)≥1,
the error in W(α) after n=1,…,N is at most `(N+1)*r(alpha*(N+1))`.

The series identities are DLMF equation 5.7.6 (DLMF line 254) and equation 5.15.1
(DLMF15 line 64). Bound each tail by a multiple of `sum(n>=N, (n+a)^(-2))`,
then by its integral from N−1 to infinity. The weighted bound follows from decrease of
`x*r(x)` for x≥1 (CL numerical comments (3), printed pp.306–307).
*Needs:* §§4.14–4.16; the named DLMF series identities; native ψ and ψ′.

**Checks.**

- At z=1 all terms of the digamma tail vanish: D_N(1)=−γ exactly for every N≥1.
- At z=1, N=1, T_N=1 and the error `pi^2/6-1` lies strictly between zero and one;
  at N=2, T_N=5/4 and the bound is 1/2.
- Re z=0 is outside this contract; z=0 would give a zero denominator in the first term.

### 4.18 Rational enclosures of CT scalars

For rational ℓ>0, weight w∈ℕ, q∈Fin 8 and P∈ℕ, prove existence of a rational interval
CT scalar enclosure l w q P containing the exact scalar in §4.17 with width at most 2^(−P).
The chosen family has equal intervals at indices 1 and 4.

- A family of eight intervals exists at every precision with identical slots 1 and 4.
- The exact scalar is contained.
- Its interval has the stated width.
- Indices 1 and 4 use the same interval.

The finite sums and explicit remainders in §§4.15–4.17a, combined with rational bounds for
elementary functions, give arbitrarily small error before outward rounding (CL Proposition
3.17 and numerical comments (3), pp.304–307; Arb §5, pp.7–8).
*Needs:* eight CT scalar expressions (4.17), outward dyadic hull (4.5), geometric bound for the odlyzko tail,
alternating odlyzko tail bound, the weighted alternating-tail estimate,
`digamma_series_remainder`, `trigamma_series_remainder`.

**Checks.**

- At ℓ=1 and P=5, `[4/5,41/50]` is an admissible interval at indices 1 and 4.
- At ℓ=2 and P=4, `[8/5,41/25]` encloses their shared value 16/π².
- no singleton rational interval contains 8/π², since π² is irrational (Zhou, §4, proof of Theorem 1, printed pp.4–5; Zhou line 234).

### 4.19 Disjoint presentations of every distinct root (`exists_disjoint_root_presentations`)

For every nonzero f∈ℚ[X], there exists a list of `IsolatedAlgebraicRoot`s
all using f, with distinct decoded values, pairwise disjoint closed rational rectangles,
and decoded root set exactly the complex roots of f. Multiplicities are not counted.

Finiteness of the distinct root set gives pairwise disjoint rational neighborhoods;
isolation uses the root-count and separation comparisons of RealAlgebraicGeometry
Layers 1–4 (Arb §5, printed pp.7–8, for enclosure semantics).
*Needs:* §0.8; every algebraic value has an isolated presentation (0.9a); polynomial root finiteness;
RealAlgebraicGeometry Layers 1–4.

**Checks.**

- A nonzero constant gives the empty list.
- `(X-1)^2` gives one root value, with multiplicity two represented separately.
- `X²+1` gives two distinct values; no single rectangle can isolate both.

### 4.19a Uniform continued Dirichlet remainder (`dirichlet_eulerMaclaurin_remainder`)

For a character χ of positive modulus q, use
`L(s,chi) = q^(-s)*sum(a=1..q, chi(a)*zeta(s,a/q))`.
For N,m≥1 and t=a/q, define the finite approximation to ζ(s,t) as
`sum(n<N, (n+t)^(-s)) + (N+t)^(1-s)/(s-1) + (N+t)^(-s)/2`
plus `sum(r=1..m, B_(2*r)/(2*r)! * rising(s,2*r-1)*(N+t)^(1-s-2*r))`.
In the acceptance signatures, `hurwitzEMPartial` is this finite Hurwitz expression,
`dirichletEMPartial` is its character sum with the factor q^(−s), and
`bernoulliBound m` is the constant C_m below. At s=1 the Hurwitz expression omits
its polar part and uses −log(N+t); this value is used only for nonprincipal χ.
The finite Hurwitz approximation has this API:

- Its finite power sum retains all indices 0,…,N−1 and each Bernoulli term through order 2m.
- At s=1 its polar-free contribution is the displayed logarithm, with no division by zero.
- At s≠1 it uses the native complex powers on positive real bases and the actual factor s−1.

**Checks.**

- At s=0,t=1,N=m=1 the three nonzero terms give 1−2+1/2=−1/2.
- At s=2,t=1,N=m=1 the value is 1+1/2+1/8+1/48=79/48.
- At s=1,t=1,N=m=1 the polar-free value is 1−log(2)+1/4+1/48=61/48−log(2);
  substituting total division by zero into the nonremovable expression would omit −log(2).

The character-sum approximation has this API:

- Its sum includes one representative of each residue class, namely a=1,…,q.
- Multiplication by q^(−s) fixes the normalization relative to the native Dirichlet continuation.
- For a nonprincipal character at s=1 the omitted Hurwitz polar parts cancel because Σχ(a)=0.

**Checks.**

- For the conductor-one character and s=2,N=m=1 its value is 79/48.
- For the conductor-one character at s=0,N=m=1 it is −1/2.
- For the odd character modulo four at s=0,N=m=1, the two nonzero terms are 1/4
  and −(−1/4), giving 1/2; omitting the q^(−s) normalization at s=2 would multiply
  its approximation by sixteen.

The Bernoulli constant has this API:

- `bernoulliBound m` is nonnegative and bounds the absolute periodic polynomial of order 2m.
- Its j=0 summand is one, so the bound is at least one.
- It uses absolute Bernoulli coefficients, retaining the j=1 contribution regardless of its sign.

**Checks.**

- At m=0 the finite constant is one.
- At m=1 it is 1+1+1/6=13/6, whereas |B₂(0)|=1/6 and |B₂(1/2)|=1/12.
- At m=2 it is 1+2+1+1/30=121/30; cancelling the negative B₄ term would give 119/30.

The remainder is the even-order Euler–Maclaurin integral with periodic B_(2m),
coefficient `-rising(s,2*m)/(2*m)!` and integrand `(x+t)^(-s-2*m)` on [N,∞).

For Re s≥σ₀, ‖s‖≤B and σ₀+2m>1, prove the uniform L-remainder bound
`q^(1-sigma0)*C_m*prod(j<2*m, B+j)/(2*m)! * N^(1-sigma0-2*m)/(sigma0+2*m-1)`,
where `C_m = sum(j=0..2*m, binomial(2*m,j)*abs(B_j))` bounds the periodic
Bernoulli polynomial. It tends to zero as N→∞. All x+t are positive and the final
denominator is positive. At s=1 for nonprincipal χ, replace
`((N+t)^(1-s)-1)/(s-1)` by its removable value `-log(N+t)` and use Σχ(a)=0;
the principal-character pole remains excluded.

This is the shifted even-order form of DLMF equations 25.11.4 and 25.11.7, obtained
by one integration by parts (DLMF25 lines 213 and 419). *Needs:* native Hurwitz and
Dirichlet continuations; Bernoulli polynomials; finite algebraic character values.

**Checks.**

- For q=1, s=2, m=1 the estimate is a bound for the ζ(2) tail, with positive denominator three.
- At s=0 the continued value ζ(0)=−1/2 is recovered, unlike the divergent raw series.
- At s=1 and χ of conductor four the removable expression gives L(1,χ)=π/4;
  the same point for the principal conductor-one character is excluded.

### 4.20 Enclosures of continued Dirichlet values

For primitive χ of positive modulus q, any complex z away from a principal-character pole,
and P∈ℕ, prove existence of rational component intervals containing the native
`DirichletCharacter.LFunction chi z`, each of width at most 2^(−P).

- The rectangle contains that native continued value.
- Both widths meet the bound.
- Excluding zero implies nonvanishing.

Use §4.19a to relate finite sums with vanishing errors to the native continuation
(Platt §§4–6, printed pp.3–13; DLMF25 equation 25.11.7).
*Needs:* `dirichlet_eulerMaclaurin_remainder`, `complexBoxSet` (4.7),
`IsolatedAlgebraicRoot` (0.8), Mathlib `DirichletCharacter.LFunction`.

**Checks.**

- At q=1, z=2, `[8/5,5/3]×{0}` is an admissible P=3 rectangle for ζ(2)=π²/6.
- The principal conductor-one value at one is outside the pole hypothesis.
- At z=0 the continued conductor-one value is −1/2, enclosed by the singleton −1/2.

### 4.20a Uniform two-tail bound for cusp forms (`cusp_mellin_tail`)

Fix k>0 and a level-one cusp form f with Fourier coefficients a_n.
The acceptance signatures use natural k with k>0, parametrizing all positive integer weights. Put κ=k/2.
Choose a positive rational C with `abs(a_n) ≤ C*n^kappa` for every n≥1, obtained
from Mathlib `CuspFormClass.qExpansion_isBigO` and the finitely many initial coefficients.
For `sigma0 ≤ Re s ≤ sigma1`, put `B = max(0,sigma1-1,k-sigma0-1)` and
`H = sup norm((2*pi)^s/Gamma(s))` on a specified compact set of arguments, with the
entire reciprocal-Gamma convention at nonpositive integers. Prove the split Mellin identity

`L(f,s) = (2*pi)^s/Gamma(s) * sum(n>=1, a_n * integral(t=1..infinity, exp(-2*pi*n*t)*(t^(s-1)+i^k*t^(k-s-1))))`.

Define `cuspMellinPartial k f s N` as the first N positive-index terms of this
split Mellin expression, including its reciprocal-Gamma prefactor. The acceptance
theorem `cusp_mellin_tail` assumes the displayed coefficient bound and an explicit
upper bound H for that prefactor; the compact-set version uses the same H for all s.

The finite Mellin expression has this API:

- N=0 gives the empty sum zero, without asserting that the L-value vanishes.
- It is complex linear in f and retains each Fourier coefficient at its positive index.
- Both integrals use t≥1 and the second carries i^k, with the native entire reciprocal-Gamma convention.

If N≥0, `2*pi*(N+1)>B` and `kappa/(N+1)<2*pi`, the error after n=1,…,N is at most

`2*C*H*(N+1)^kappa*exp(-2*pi*(N+1))/((2*pi*(N+1)-B)*(1-exp(kappa/(N+1)-2*pi)))`.

Both denominators are positive. The bound tends to zero uniformly on that compact set.
It bounds both integrals: `t^B ≤ exp(B*(t-1))` for t≥1, followed by a geometric majorant.
The finite integrals are upper incomplete-Gamma values; their defining integral is DLMF8
8.2.2 (DLMF8 line 122). The Mellin identity and sign are the level-one specialization of
Mathlib `ModularForm.weakFEPair` and `ModularForm.L` in
`Mathlib.NumberTheory.ModularForms.LFunction`. *Needs:* those declarations,
`CuspFormClass.qExpansion_isBigO` in `Mathlib.NumberTheory.ModularForms.Bounds`,
and the incomplete-Gamma integral identity.

**Checks.**

- For f=0 both finite sums and both tails vanish; C may be any positive rational.
- At k=12, s=6, the two integrals have equal positive sign; at k=18, s=9, they
  cancel, giving exact central vanishing because i¹⁸=−1.
- At k=12, s=12, N=3, B=11, both denominator guards hold; N=0 fails the first guard.

### 4.21 Enclosures of cusp-form values

For k>0, an integral level-one cusp form f, complex z and P∈ℕ, prove existence of rational
component intervals containing the native `ModularForm.L hk f z`, each of width at most
2^(−P), where hk states k>0.
The finite sums in §4.20a specify the value and both tail bounds.

- The rectangle contains the native continuation.
- Both widths meet the bound.
- Exclusion implies nonvanishing.

The coefficient growth and uniform Mellin-tail comparison of §4.20a give arbitrary
accuracy on compact argument sets (Arb §§5–6, pp.7–10, for enclosing semantics;
DLMF8 equation 8.2.2 for the finite Gamma terms).
*Needs:* `cusp_mellin_tail`, `complexBoxSet` (4.7), `integralCuspLattice` (3.2),
Mathlib `ModularForm.L` and `ModularForm.weakFEPair`.

**Checks.**

- The zero form admits the singleton rectangle `{0}×{0}` at every precision.
- For normalized Δ, delta l twelve bounds states
  `1/2 < Re L(Delta,12) < 3/2` and `Im L(Delta,12)=0`. Thus
  `[1/2,3/2]×{0}` is an admissible P=0 output excluding zero. Positivity also follows
  independently from Δ(it)>0 and its Mellin integral. The coefficient-growth target states
  `abs(tau(n)) ≤ 1000*n^6` for every n≥1; this bound, three Mellin terms and §4.20a give the displayed rational bounds;
  prove that bound from `ModularForm.discriminant_eq_q_prod` on the standard fundamental domain (`Mathlib/NumberTheory/ModularForms/Discriminant.lean`, line 114).
- For −Δ the reflected rectangle `[−3/2,−1/2]×{0}` is admissible; a sign-insensitive
  enclosure would fail to distinguish these values. This follows from linearity in f.

### 4.21a Argument counts and Turing comparison

For a primitive complex character χ of modulus q≥1, put a=0 or 1 according to χ(−1),
and let Λχ be the meromorphic continuation of
`(q/pi)^((s+a)/2)*Gamma((s+a)/2)*L_chi(s)` from Re s>1.
Prove the completed-function normalization:
`Lambda_chi(s)=q^((s+a)/2)*DirichletCharacter.completedLFunction chi s`
away from its poles, with equality of meromorphic germs everywhere. The Gamma-product
expression is used away from Gamma poles; at trivial zeros its removable continuation
is essential. The native comparison is
`DirichletCharacter.LFunction_eq_completed_div_gammaFactor`
(`Mathlib.NumberTheory.LSeries.DirichletContinuation`, line 258).
Define the horizontal Dirichlet argument by
`S_chi(t)=Im(integral(sigma=infinity to 1/2, L'_chi/L_chi(sigma+i*t)))/pi`,
using the right-hand limit at a zero or pole ordinate (for q=1 the path at t=0 meets the pole of ζ at s=1). Prove local integrability, the
conjugate-character comparison and agreement with the horizontal argument continued
from the right half-plane. This fixes the direction and avoids choosing an arbitrary
principal argument at each point (Platt Theorems 3.1–3.2, pp.4–5; Platt lines 227 and 271).

Use ZerosOfLFunctions §4.1 `zeroCount` on the open critical strip with |Im s|<T
to define Nχ(T), retaining multiplicities. Apply its §§7.1–7.2a rectangle argument
principle to prove the argument-count identity: for T>0 not a zero ordinate, c>1 and
the positively oriented rectangle C with vertical sides 1−c,c and horizontal sides −T,T,
`N_chi(T)-2*delta_(q=1)=(2*pi*i)^(-1)*integral_C Lambda'_chi/Lambda_chi`.
Here N counts all strip zeros with |Im s|<T with multiplicity; the correction counts
the two poles of the completed conductor-one function at 0 and 1. The completed
function has no other poles or zeros outside the strip. With
`theta_chi(t)=t*log(q/pi)/2+Im(logGamma((1/2+a+i*t)/2))`, choosing the continuous
logGamma branch on the right half-plane real on its positive real axis, prove
the argument-count difference identity: for 0<T₁<T₂ with zero-free endpoint ordinates,
`N_chi(T2)-N_chi(T1)=2*(theta_chi(T2)-theta_chi(T1))/pi+S_chi(T2)+S_bar_chi(T2)-S_chi(T1)-S_bar_chi(T1)`.

Prove the integrated argument-count identity: for t₀,h>0 with zero-free endpoint ordinates,
let `Z_chi(t0,t)` count positive ordinates in [t₀,t) with multiplicities. Then
`h*N_chi(t0)=integral(t0 to t0+h, N_chi(t)-Z_chi(t0,t)-Z_bar_chi(t0,t))`.
Substituting the argument identities evaluates this through the Gamma term and the two
integrated S terms, with the absolute count fixed by the contour identity. Do not discard
pole or endpoint contributions (Platt Theorems 3.1–3.2, pp.4–5; Platt line 271).
*Needs:* ZerosOfLFunctions §§4.1, 4.3–4.4, 4.9 and 7.1–7.2a;
ContourIntegration Layer 3 null-homologous argument principle; Tau Ceti
`TauCeti.Contour.argumentPrinciple_starConvex`; Mathlib
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`,
`DirichletCharacter.LFunction_ne_zero_of_one_le_re` and the completed/Gamma comparisons
in the supplier contracts; `Complex.exists_continuousOn_eqOn_exp_comp` for the Gamma branch;
§4.20 for value enclosures.

The horizontal Dirichlet argument has as its API the horizontal argument comparison, its right-limit
convention and its local integrability; the count identities above are its applications.

**Checks.**

- A zero-free band has N(T₂)−N(T₁)=0; a change of argument without a branch continuation
  cannot be substituted for the displayed difference.
- χ and its conjugate have equal symmetric counts, while their positive counts can differ;
  both Z terms are needed.
- At conductor one the completed function has two poles; omitting the correction would
  lower the recovered zero count by two. A zero on an endpoint is counted using the stated
  one-sided convention, not as a sign change at a nonzero endpoint.

Prove the explicit Turing integral bound: for primitive χ of modulus q≥1, t₀>50 and h>0,
`abs(integral(t0 to t0+h, S_chi(t))) <= 1.8397+0.1242*log(q*(t0+h)/(2*pi))`
(Platt Theorem 3.3, p.5; Platt line 321). Apply the same bound to the conjugate character.

In the sign test choose εχ with `norm(epsilon_chi)=1` and
`epsilon_chi^2=(DirichletCharacter.rootNumber chi)^(-1)` and use the critical function
`Z_chi(t)=epsilon_chi*q^((1/2+i*t)/2)*DirichletCharacter.completedLFunction chi (1/2+i*t)`.
The primitive functional equation and complex conjugation make it real-valued; its
nonzero factors preserve the critical-line zeros and their multiplicities. Replacing εχ
by −εχ reverses every sign together and preserves sign changes (Platt lines 50–74).

Prove completeness of the zero count: fix a primitive χ, T>0, an auxiliary
[t₀,t₀+h] with t₀>max(50,T), zero-free endpoints, and a finite family of disjoint
intervals inside [−T,T]. If exact sign changes of the real normalized critical-line
function in those intervals give an integer lower count M∈ℕ, and the integrated argument identity
and its enclosed Gamma and S terms give a real upper bound U for Nχ(T) with U<M+1,
then Nχ(T)=M and every strip zero in that band lies on the critical line. The finite
family and upper comparison concern the same symmetric band, and zeros at |Im s|=T
are separately isolated or included by a zero-free outer height T'>T and restriction.
This is the counting consequence of Platt §3, pp.4–5, retaining multiplicities.
*Needs:* the argument-count identity, the integrated argument-count identity,
the Turing integral bound, Dirichlet value enclosure (4.20).

**Checks.**

- M=0 and U<1 force an empty strip band; value enclosures alone do not.
- Disjointness makes two intervals contribute two distinct zeros; overlapping intervals
  cannot be counted twice.
- A double zero contributes multiplicity two to N but gives no simple sign-change
  witness; an incomplete lower count cannot pass equality with the upper count.

### 4.22 Platt’s finite-conductor zero theorem (`platt_bounded_height`)

For primitive χ of modulus q≤400000, every zero s of the native LFunction in 0<Re(s)<1 with |Im(s)|≤H(q) has Re(s)=1/2, where H(q)=max(10⁸/q,7.5·10⁷/q+200) for even q and max(10⁸/q,3.75·10⁷/q+200) for odd q. This parity is the modulus parity, not character parity. This is an unconditional theorem about the stated finite conductor and height range.

Prove the finite character-family count and the matching lower and upper zero counts from the value inequalities, sign changes and Turing comparison. Equality between the isolated zero count and the upper count excludes missed off-line zeros. The zero-count comparison and the specified finite character range are part of the theorem. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.) *Needs:* Dirichlet value enclosure (4.20); the argument-count identity,
the integrated argument-count identity, the Turing integral bound,
zero-count completeness (4.21a); Mathlib `DirichletCharacter.LFunction`;
Mathlib `DirichletCharacter.IsPrimitive`.

### 4.23 Platt’s central nonvanishing target (`platt_central_nonvanishing`)

For every primitive complex Dirichlet character of modulus q≤2000000, LFunction(χ,1/2)≠0. This is a separate finite-range theorem from the bounded-height zero-line theorem.

A finite family of rectangles excluding zero establishes nonvanishing for every primitive character in the stated range. The exact-value containment and exhaustiveness of that family are the mathematical obligations. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.) *Needs:* Dirichlet value enclosure (4.20); Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

### 4.24 No real zeros for conductor at most 400000

For primitive χ of modulus q≤400000 and real s with 0<s<1, the native continued LFunction(χ,s) is nonzero. This is the finite-conductor nonvanishing input of Bennett–Siksek Proposition 7.2.

A hypothetical real zero has height zero, so the bounded-height theorem forces s=1/2. The separate central nonvanishing theorem excludes that value. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15; [BennettSiksek](#source-bennettsiksek), §7, proof of Proposition 7.2, p.376.) *Needs:* `platt_bounded_height` (4.22); `platt_central_nonvanishing` (4.23).

### 4.25 Entrywise lower bounds on effective vectors

Let A,B be real n×n matrices. If B_ij≤A_ij for every i,j and x_i≥0 for every i, then Σ_ij B_ij x_i x_j≤Σ_ij A_ij x_i x_j. Symmetry is unnecessary for this inequality. The nonnegative-coordinate hypothesis is essential.

Every x_i x_j is nonnegative. Multiply each entry inequality by this number and sum. ([CT](#source-ct), Remark 2.11, pp.281–282.) *Needs:* enclosure under multiplication (4.2).

### 4.26 Integer points of a rational ellipsoid

For any rational n×n matrix G, t∈ℚⁿ and R∈ℚ, define
integer ellipsoid set G t R as the native set of x∈ℤⁿ satisfying `(x-t)ᵀG(x-t) ≤ R`.
When G is symmetric and positive definite, this sublevel set is bounded, hence finite.
Dimension zero is allowed; all finiteness statements require positive definiteness.

- For positive-definite G and R<0 the set is empty.
- For t=0 it is closed under negation.
- Increasing R gives an inclusion.
- For t=0 and R≥0 it contains zero.

For positive-definite G choose positive integers a,D so that aG has integral entries
and Dt∈ℤⁿ. The injective map x↦D(x−t) sends the set into the bounded-norm set of
the integral lattice with Gram matrix aG, at bound aD²R, because
`(D(x-t))^T (aG) (D(x-t)) = a*D^2*((x-t)^T G (x-t))`.
Apply IntegralLattices Layer 2, milestone 2A; positive scaling preserves definiteness.
The coordinate comparison retains equality at the boundary (deWeger, §3.6, printed pp.51–53).
*Needs:* Mathlib `Matrix.PosDef`; IntegralLattices Layer 2, milestone 2A.

**Checks.**

- G=I₂, t=0, R=1 gives `{0, ±(1,0), ±(0,1)}`.
- G=`[[2,1],[1,2]]`, t=0, R=2 gives seven points; `(1,1)` has value six and is excluded.
- G=`[1]`, t=1/2, R=1/4 gives `{0,1}`; negation symmetry requires t=0.
- In dimension zero the empty vector belongs iff R≥0.
- G=`[0]` at R=0 has infinitely many integer points, showing why definiteness is required.

### 4.27 Completeness of the ellipsoid set

For symmetric positive-definite G and arbitrary rational t,R,
integer ellipsoid set G t R is finite and membership is equivalent to the defining quadratic inequality. For t=0, if this set is `{0}`,
every nonzero integer vector has value strictly above R. If R≤R′, the set at R′
is a finite cover of the set at R, with the extra points retained explicitly
(deWeger, §3.6, printed pp.51–53).
*Needs:* §4.26.

### 4.28 Loewner lower bounds on unrestricted vectors

For real matrices A and B with A−B positive semidefinite, xᵀBx≤xᵀAx for every real vector x, including mixed signs. Positive semidefiniteness includes symmetry of the difference; A and B need not separately be symmetric.

Evaluate the positive-semidefinite inequality on x and expand the difference. ([CT](#source-ct), Remark 2.11, pp.281–282.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

### 4.29 Rational witness of Gram negativity

For an n×n matrix I of rational enclosing intervals and a rational vector t, rational negative Gram witness I consists of t_i≥0 for every i, t≠0, and the strictly negative rational upper bound Σ_ij I_ij.upper t_i t_j<0. It does not store an approximate eigenvalue as evidence.

- The stored endpoint quadratic value is strictly negative.
- The witness vector is nonzero.
- Multiplying the vector by a positive rational preserves validity.
- The scaled presentation uses exactly r times the original vector.

The fields are exact rational inequalities. Nonnegativity permits endpointwise upper bounding. ([CT](#source-ct), Algorithm 2.4.4, pp.282–283.) *Needs:* Mathlib `NonemptyInterval`; entrywise lower bounds on effective vectors (4.25).

**Checks.**

- *Computed value.* The one-dimensional interval [−2,−1] admits vector 1.
- *Degenerate case.* Dimension zero admits no nonzero vector presentation.
- *Non-example.* The one-dimensional enclosure [−1,1] establishes no negative value by this rule.

### 4.30 Negativity of every enclosed Gram matrix

If A_ij lies in interval I_ij and c is a rational negative Gram witness I, then c.vectorᵀ A c.vector<0 over ℝ.

Cast the exact rational upper inequality to ℝ. Sum entrywise upper bounds weighted by nonnegative vector products. ([CT](#source-ct), Algorithm 2.4.4, step 4, pp.282–283.) *Needs:* rational negative Gram witness (4.29); entrywise lower bounds on effective vectors (4.25).

### 4.31 Effective vectors from an exact ellipsoid cover

Given an exact finite cover S of all integer vectors x with xᵀBx≤c, effectiveEllipsoidCover filters S by nonnegative coordinates and the exact rational bound xᵀBx≤c. If B is entrywise below the real target Gram matrix A, then every effective integer x with xᵀAx≤c remains in the output. The result may contain vectors failing the true A-bound, so it is a cover of the required set, not an exact list for A. A safety factor such as 1.001 must appear in the supplied c and never be silently described as the original cutoff.

- Membership is membership in S plus the two exact filter conditions.
- Filtering never invents a vector.
- Every nonnegative B-short vector is retained when S is exhaustive.

For symmetric positive-definite B, the finite set integer ellipsoid set B 0 c supplies S by §4.27. Intersect S with the nonnegative orthant and the stated quadratic sublevel set. The effective Gram comparison proves that each required A-short vector is B-short and therefore belongs to S. ([CT](#source-ct), Remark 2.11 and §2.4.3, pp.281–282.) *Needs:* completeness of the ellipsoid set (4.27); entrywise lower bounds on effective vectors (4.25).

**Checks.**

- *Degenerate case.* The zero vector survives any nonnegative cutoff when supplied.
- *Non-example.* A negative coordinate is rejected even inside the ellipsoid.
- *Computed value.* A vector on the exact rational boundary is retained.

### 4.32 Validity of a rational Gram witness

Define rational Gram validity for I,t as `∀ i, 0 ≤ t_i`, `t ≠ 0`, and
`∑ i,j, I_ij.upper*t_i*t_j < 0`. All entries and vector coordinates are rational.
This predicate is a mathematical condition on proposed data.

- Validity is the displayed conjunction.
- Validity supplies a rational negative Gram witness with vector t.
- Scaling by a positive rational preserves validity.

These conditions give the upper quadratic bound of CT §2.4.4, printed pp.282–283.
*Needs:* §4.29.

**Checks.**

- I=`[[-2,-1]]`, t=1 satisfies the predicate.
- The zero vector fails even for a strictly negative matrix.
- I=`[[-1,1]]`, t=1 fails because its upper endpoint is positive.
- The singleton matrix `[[0,1],[1,0]]` has quadratic value −2 on `(1,−1)`, but rational Gram validity rejects that vector because its second coordinate is negative; dropping nonnegativity would invalidate entrywise comparison (CT Remark 2.11, pp.281–282).

### 4.33 Validity of a finite Gram family

A row is a dimension n, an n×n rational interval matrix and a rational n-vector.
Define validity of a finite Gram family to mean rational Gram validity for every row in the list.
Validity proves negativity only after each row's intervals have been related to the
specified analytic matrix; exhaustiveness requires a separate finite cover.

- Validity means validity of every member.
- Validity of a concatenation is validity of both lists.
- Reordering preserves validity.

Use dependent pairs over n and ordinary list membership (CT §§2.4.6 and 4.1–4.3,
printed pp.284–286 and 295–299). *Needs:* §§4.18, 4.31–4.32.

**Checks.**

- The empty family is valid but establishes no exhaustiveness.
- A single row I=`[[-2,-1]]`, t=1 is valid.
- Appending a zero-vector row to that family makes it invalid.

### 4.34 Correct multiplicity lift for Gram witnesses

Define the multiplicity lift by x_(i,r)=t_i/m_i and
expanded block Gram matrix m A K (i,r) (j,s)=(if (i,r)=(j,s) then A else 0)-K_ij
on the sigma index `Σ i, Fin (m i)`. These are real-valued definitions, including empty
blocks; positivity is a hypothesis of the reduction theorem. Their APIs are
the coordinate formula for the multiplicity lift, the block-sum identity (for m_i>0),
the expanded Gram entry formula and the transpose comparison (transpose K).

Let m_i>0 be block sizes, A∈ℝ and K an n×n real matrix. On the expanded index set {(i,r):0≤r<m_i}, put B_(i,r),(j,s)=A·δ_(i,r),(j,s)−K_ij. For any vector t, the expanded vector x_(i,r)=t_i/m_i satisfies xᵀBx=tᵀβt, where β_ij=(A/m_i)δ_ij−K_ij. Thus an exact negative value for β gives one for B. The lift is t_i/m_i; replacing it by t_i/√m_i changes the off-diagonal normalization. This equality does not assert equality of Euclidean unit-sphere minima.

Sum each constant block contribution and the diagonal terms separately. Each diagonal block contributes A·m_i·(t_i/m_i)²=A t_i²/m_i, while each off-diagonal block contributes −K_ij t_i t_j. ([CT](#source-ct), §2.4.2, Equation (2.4.4), p.278 and reduction pp.280–281; Algorithm 2.4.5, p.283.) *Needs:* rational negative Gram witness (4.29).

**Checks.**

- With every m_i=1 the lift is t and the expanded matrix is `A*1-K`; singleton blocks
  introduce no scaling.
- For m=(2,3), A=6, K=`[[1,2],[2,4]]`, t=(2,3), the lift is five ones and its
  expanded value is −34, agreeing with the reduced form. This tests division by m_i.
- For n=1, m₀=0, A=0, K₀₀=1 and t₀=1, the expanded sum is empty and equals zero,
  while the proposed reduced value is −1. Positive block sizes are necessary.

### Examples

- `[−2, 3]·[−4, 5] = [−12, 15]`, and `[−1, 1]·[−1, 1]` has lower endpoint `−1`, not `1` (signed interval product (4.1)).
- At precision `2` the outward dyadic hull of `1/3` is `[1/4, 1/2]`; at precision `0` that of `−1/3` is `[−1, 0]` (outward dyadic hull (4.5)).
- At `p = 3`, `(3 + O(3⁴))·(1/3 + O(3²))` has centre `1` and absolute precision `min(1 + 2, 4 − 1) = 3`, and inverting `3 + O(3⁴)` gives absolute precision `2` (exact p-adic multiplication (4.12), partial p-adic inversion (4.13)).
- The shared Fourier value `8ℓ/π²` at `ℓ = 1` lies in `(4/5, 41/50)` (CT scalar enclosure (4.18)).
- For `G = [[2, 1], [1, 2]]` and `R = 2` the ellipsoid has seven integer vectors and excludes `(1, 1)` (integer ellipsoid set (4.26)).
- The multiplicity lift sends `t_i` to `t_i/m_i`, so each diagonal block contributes `A·m_i·(t_i/m_i)² = A t_i²/m_i` (correct multiplicity lift for gram witnesses (4.34)).
- With two block sizes `(2,3)`, `A = 6`, `K = [[1,2],[2,4]]` and `t = (2,3)`, the reduced matrix is `[[2,−2],[−2,−2]]` and its value is `8 − 24 − 18 = −34`. The lift is the five-coordinate vector `(1,1,1,1,1)`, whose expanded value is `30 − (4 + 24 + 36) = −34`; division by square roots of block sizes would give a different value (correct multiplicity lift for gram witnesses (4.34)).

### Dependencies

Layers 0–3; IntegralLattices Layer 2, milestone 2A; Mathlib (`NonemptyInterval`, digamma, `DirichletCharacter.LFunction`, `ModularForm.L`, `WeakFEPair`, `Matrix.PosDef`); TauCetiRoadmap RealAlgebraicGeometry Layers 1–4; ContourIntegration Layer 3; ZerosOfLFunctions §§4.1, 4.3–4.4, 4.9, 7.1–7.2a and Layer 9.

## Layer 5: interpretation of finite arithmetic families

A finite arithmetic family is interpreted by its maps to the native objects and the
mathematical validity of every member. The family includes its exact parameter range,
coefficient embeddings, normalizations and rational endpoints. Completeness is a separate
claim about that exact range.

For modular data the comparisons are equality of finite modular coefficient data (3.5) and integral Hecke matrix
(3.7). For elliptic data they are local image presentation (3.18) and finite p-saturation criterion
(3.26). The CT applications use CT scalar enclosure (4.18), effective vectors from an exact ellipsoid cover (4.31)
and finite Gram family validity (4.33); Platt's two finite ranges use `platt_bounded_height` (4.22)
and `platt_central_nonvanishing` (4.23). These are propositions about all members of a
finite family (CT §§2.4.6, 4.1–4.3, pp.284–286, 295–299; Platt §§4–7, pp.3–15).

### 5.1 Finite families and their analytic interpretations

Prove soundness of valid finite Gram families: for a finite list of dimensions, rational interval matrices
and vectors satisfying finite Gram family validity, and a real matrix of the same dimension for each
row whose entries lie in the row's intervals, the quadratic value at that row's displayed
vector is strictly negative. The interval-containment hypotheses bind every row to its own
native matrix; an empty family proves only an empty conjunction (CT §§2.4.6 and 4.1–4.3,
printed pp.284–286 and 295–299). *Needs:* §§4.30, 4.32–4.33.

### Examples

- The family with I=`[[-2,-1]]`, t=1 is valid; adjoining a zero-vector row makes it invalid.

### Dependencies

Layers 0, 3 and 4.

## Downstream consumers

- **EffectiveDiophantineMethods** consumes the common foundations through these comparisons:
  - For its §0.1 proof-bearing p-adic enclosure of x with rational centre c and precision N,
    use §4.10's normalized record and transport containment along equality of denotations.
    For its §0.9 general-completion balls this comparison applies only to K=ℚ, K_v=ℚ_p,
    ord(p)=1 and rational centres; it does not identify general-completion records.
  - Its §§0.2–0.3 rectangular selected-root data forget squarefreeness and the embedding
    label to give `IsolatedAlgebraicRoot`, with exactly the same complex value. A disc
    datum first chooses a rational rectangle containing the selected root and contained
    in the disc's interior, so this restriction requires the root to be in that interior;
    for boundary roots choose a new isolating rectangle by §0.9a instead. Arithmetic and
    equality use §§0.10–0.13, and complete isolation uses §4.19.
  - Its §§3.2–3.4 coordinate-rich local-image data transport their coordinate subgroup to
    `localImageSpan` under the specified square-class isomorphism. Cardinality completeness
    uses §3.19 and good-odd-prime equality uses `localImage_of_good_odd` (§3.21), with
    all square witnesses and the integral good-model hypothesis retained.
  - Its §§3.17–3.18 saturation and joint-reduction data use `IsPSaturated` (§3.22) and
    §§3.23–3.25, retaining A[p]≤G; §3.26 specializes the finite criterion to rational
    elliptic points. Heights, global index bounds and Mordell–Weil assembly remain
    its §§3.5–3.22's applications of these foundations.
  - Its §§1.7–1.8 LDL and Fincke–Pohst witnesses identify their finite output with
    §§4.26–4.27's affine integer set by the same inequality, including equality at the
    boundary. This comparison assumes positive definiteness; an empty totalized output
    for a non-positive-definite matrix is not identified with the native sublevel set.
  Its worked Diophantine examples also consume the order presentations of Layer 2,
  the enclosures of Layer 4 and the finite-family comparisons of Layer 5.

## References

Locators use the printed page numbers of the linked version unless explicitly marked as PDF
pages. The sources prove or motivate the mathematical statements at the cited locations; the
finite-data presentations use the stated maps into native carriers. Arb
supplies enclosure semantics; LLL82 supplies factorization and coefficient bounds. The CL
reference is the French preprint and its Proposition 3.17; the English edition numbers it
differently.

### Source Shoup

- **Shoup**: Victor Shoup, [A Computational Introduction to Number Theory and Algebra](https://shoup.net/ntb/ntb-v2.pdf), Version 2.

### Source Stein

- **Stein**: William Stein, [Modular Forms: A Computational Approach](https://wstein.org/books/modform/stein-modform.pdf), Author PDF.

### Source Arb

- **Arb**: Fredrik Johansson, [Arb: efficient arbitrary-precision midpoint-radius interval arithmetic](https://arxiv.org/pdf/1611.02831), arXiv:1611.02831v1.

### Source CT

- **CT**: Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), Publ. Math. IHÉS 131 (2020), 261–323.

### Source BCG

- **BCG**: George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), JAMS 38 (2025), 509–520.

### Source NumberRings

- **NumberRings**: Peter Stevenhagen, [The arithmetic of number rings](https://library.slmath.org/books/Book44/files/08psh.pdf), MSRI 44 (2008), pp.209–266.

### Source GMN

- **GMN**: Jordi Guàrdia, Jesús Montes, Enric Nart, [Newton polygons of higher order in algebraic number theory](https://arxiv.org/pdf/0807.2620), arXiv:0807.2620v2.

### Source CarusoPublished

- **CarusoPublished**: Xavier Caruso, [Computations with p-adic numbers](https://www.numdam.org/item/10.5802/ccirm.25.pdf), Les cours du CIRM 5 (2017), no.1, II.

### Source BennettSiksek

- **BennettSiksek**: Michael Bennett, Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Annals of Mathematics 191 (2020), 355–392.

### Source Thery

- **Thery**: Laurent Théry, [Primality Tests and Prime Certificate](https://arxiv.org/pdf/2203.16341), arXiv:2203.16341.

### Source Platt

- **Platt**: David Platt, [Numerical computations concerning the GRH](https://arxiv.org/pdf/1305.3087), arXiv:1305.3087, 15-page preprint.

### Source PrattNotes

- **PrattNotes**: Vašek Chvátal, [Pratt’s primality proofs](https://users.encs.concordia.ca/~chvatal/notes/ppp.pdf), Author lecture notes, 5 pages.

### Source CL

- **CL**: Gaëtan Chenevier and Jean Lannes, [Formes automorphes et voisins de Kneser des réseaux de Niemeier](https://arxiv.org/pdf/1409.7616), arXiv:1409.7616, French 461-page preprint.

### Source CG13

- **CG13**: Craig Citro and Alexandru Ghitza, [Computing level one Hecke eigensystems (mod p)](https://arxiv.org/pdf/1102.3321v2), arXiv:1102.3321v2, 29 March 2011.

### Source MilneANT

- **MilneANT**: J. S. Milne, [Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf), course notes, version 3.08 (2020).

### Source Sutherland

- **Sutherland**: Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 7: Point counting](https://math.mit.edu/classes/18.783/2023/LectureNotes7.pdf), MIT lecture notes, Fall 2023.

### Source Cremona

- **Cremona**: J. E. Cremona, [Algorithms for Modular Elliptic Curves, Chapter III](https://johncremona.github.io/book/fulltext/chapter3.pdf), 2nd edition (1997), author's online text.

### Source FPS

- **FPS**: E. V. Flynn, Bjorn Poonen, Edward F. Schaefer, [Cycles of quadratic polynomials and rational points on a genus-2 curve](https://arxiv.org/abs/math/9508211), arXiv:math/9508211v1; Duke Math. J. 90 (1997).

### Source Siksek

- **Siksek**: Samir Siksek, [Infinite descent on elliptic curves](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf), author preprint (1995); Rocky Mountain J. Math. 25 (1995).

### Source deWeger

- **deWeger**: B. M. M. de Weger, [Algorithms for Diophantine Equations](https://ir.cwi.nl/pub/13190/13190D.pdf), CWI Tract 65 (1989).

### Source LLL82

- **LLL82**: A. K. Lenstra, H. W. Lenstra Jr. and L. Lovász, [Factoring polynomials with rational coefficients](https://ir.cwi.nl/pub/9304/9304D.pdf), CWI report (1982), printed pages 1–31; published in Math. Ann. 261 (1982), 515–534. Locators above refer to the report's printed pagination.

### Source Mattuck

- **Mattuck**: Arthur Mattuck, *Abelian varieties over p-adic ground fields*, Annals of Mathematics 62 (1955), 92–119; Theorem 7, printed p.114, DOI 10.2307/2007101.

### Source DLMF

- **DLMF**: NIST, [Digital Library of Mathematical Functions §5.7](https://dlmf.nist.gov/5.7), equation 5.7.6.

### Source DLMF15

- **DLMF15**: NIST, [Digital Library of Mathematical Functions §5.15](https://dlmf.nist.gov/5.15), equation 5.15.1.

### Source DLMF25

- **DLMF25**: NIST, [Digital Library of Mathematical Functions §25.11](https://dlmf.nist.gov/25.11), equations 25.11.4 and 25.11.7.

### Source DLMF8

- **DLMF8**: NIST, [Digital Library of Mathematical Functions §8.2](https://dlmf.nist.gov/8.2), equation 8.2.2.

### Source Zhou

- **Zhou**: Li Zhou, [Irrationality proofs à la Hermite](https://arxiv.org/pdf/0911.1929v2), arXiv:0911.1929v2 (2010), §4, Theorem 1 and its proof, printed pp.4–5; the proof also establishes irrationality of π².
