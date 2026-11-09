# Roadmap: equidistribution, three gaps and rhythm on the circle

**Summary.** Build the elementary theory of the orbit `{nα}` of a rotation of the circle:
the dichotomy between periodic and dense orbits, Weyl's criterion and the equidistribution of
`nα mod 1` for irrational `α`, the best-approximation and Hurwitz theory of continued-fraction
convergents with the golden ratio as the extremal number, and the three-gap (Steinhaus) theorem
with its gap lengths read off the continued fraction of `α`. The foundations are Mathlib's
`AddCircle`, its Fourier monomials and Haar measure, its continued-fraction computation
`GenContFract.of`, and its Dirichlet and Legendre theorems.

Suggested homes:

```text
TauCeti/Dynamics/Rotation/            (Layers A and D: orbits, gaps)
TauCeti/NumberTheory/Equidistribution/ (Layer B: Weyl)
TauCeti/NumberTheory/ContinuedFractions/ (Layer C: convergents, Hurwitz, golden ratio)
```

## Motivation: rhythm and polyrhythm

Two pulses of periods `1` and `α` played together produce the orbit `{nα}` of the rotation of the
circle by `α`, one point per beat of the second pulse against the cycle of the first. When `α = p/q`
in lowest terms the orbit is periodic: it consists of the `q` points `k/q`, equally spaced, and the
polyrhythm resolves after `q` beats. When `α` is irrational the orbit never repeats, is dense, and
in Weyl's sense is equidistributed: a window of the circle of length `ℓ` receives beats with
asymptotic frequency `ℓ`. How evenly the beats fall for finite `N` is governed by how well `α` is
approximated by rationals; by Hurwitz's theorem the golden ratio `φ` is the number furthest from
all rationals in the sense of the constant `√5`, and for `φ` the three-gap theorem gives gap
lengths that are consecutive powers of `φ⁻¹`, so the largest gap is never more than `φ²` times the
smallest. That is the sense, and the only sense this roadmap makes precise, in which the golden
rotation is the most even rhythm.

## Scope and ownership

This roadmap owns: the `ℕ`-orbit of a rotation of `AddCircle p` (periodic for finite order, dense
for infinite order) and its cardinality for rational `α`; the definition of a uniformly
distributed sequence in `AddCircle T` through the Haar probability measure `haarAddCircle`,
with Weyl's criterion, the arc-counting characterization, and the identification with weak
convergence of the empirical probability measures; the equidistribution of `nα`; the integer
numerator/denominator data of `GenContFract.of ξ` for real `ξ`, the best-approximation property
of convergents (Lagrange), the Hurwitz theorem `|ξ − p/q| < 1/(√5 q²)` infinitely often, its
sharpness at `φ`, and the continued fraction of `φ`; the three-gap theorem for `{nα}`,
uniform in `α`, and the identification of the gap lengths through the convergent denominators
when `α` is irrational.

This roadmap does not own, and consumes from Mathlib: density and ergodicity of the `ℤ`-orbit
(`AddCircle.denseRange_zsmul_iff`, `AddCircle.ergodic_add_left`), the Fourier monomials and
their density in `C(AddCircle T, ℂ)` (`fourier`, `span_fourier_closure_eq_top`), the Hilbert
basis `fourierBasis`, Dirichlet's theorem (`Real.exists_int_int_abs_mul_sub_le`), Legendre's
theorem (`Real.exists_rat_eq_convergent`), the convergent error bound
(`GenContFract.abs_sub_convs_le`), the determinant formula (`GenContFract.determinant`), the
convergence of convergents (`GenContFract.of_convergence`), and the golden ratio
(`Real.goldenRatio`, `Real.coe_fib_eq`, `Real.goldenRatio_irrational`).

It cites the
[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
roadmap, which owns: the lower bound `|ξ − pₖ/qₖ| > 1/(qₖ(qₖ + qₖ₊₁))` and the limsup formula for
the irrationality exponent (its §0.5), the predicate `BadlyApproximable` and its stability lemmas
(its §0.6), simultaneous and inhomogeneous (Kronecker) approximation in several dimensions
(its §0.4), and everything about transcendence. Nothing here restates those targets; Hurwitz's
theorem and its sharpness at `φ` are stated directly in terms of `q · ‖q φ‖` and do not pass
through `BadlyApproximable`.

It cites [Exchangeability](../Exchangeability/README.md) Layer 5, which owns the mean ergodic
theorem, Koopman operators, and invariant σ-algebras; the pointwise Birkhoff
ergodic theorem is not a target of any roadmap and is not needed here, because every averaging
statement below is proved for every starting point by the Fourier method, not almost everywhere.
It does not own homogeneous dynamics on `G/Γ`, unipotent flows or Ratner-type equidistribution
(proposed in roadmap pull request [#851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851), §4.2).
Equidistribution of small points of bounded height (arithmetic dynamics, Baker–Rumely, Yuan) is out
of scope; it is the subject of roadmap pull request
[#1335](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1335). Effective Diophantine methods
and exact rational point counts are the subject of roadmap pull request
[#1046](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1046); this roadmap's Layer C stays
with the classical qualitative statements.

## Conventions, pinned

- **The circle.** The ambient space is `AddCircle T` for `T : ℝ` with `[Fact (0 < T)]`, and the
  rhythmic statements specialize to `UnitAddCircle = AddCircle (1 : ℝ)`. Points of `ℝ` are sent
  to the circle by the coercion `((x : ℝ) : AddCircle T)`; the rotation by `a : AddCircle T` is
  the map `(a + ·)`, matching `AddCircle.ergodic_add_left`. The `ℕ`-orbit of `a` is
  `fun n : ℕ ↦ n • a` and the `ℤ`-orbit is `fun n : ℤ ↦ n • a`, matching
  `AddCircle.denseRange_zsmul_iff`.
- **Distance to the nearest integer.** `‖(x : AddCircle p)‖` is Mathlib's quotient norm, and
  `UnitAddCircle.norm_eq : ‖(x : UnitAddCircle)‖ = |x − round x|`. Never introduce a private
  `‖·‖`-to-nearest-integer function; write `‖((q * ξ : ℝ) : UnitAddCircle)‖`.
- **Fractional parts.** Statements about points in `[0, 1)` use `Int.fract`, and the bridge to
  the circle is `AddCircle.coe_fract : ((Int.fract x : ℝ) : AddCircle (1 : 𝕜)) = x`. The three-gap
  theorem (Layer D) is stated for `Int.fract (n * α)`, `n < N`, as a `Finset ℝ` inside
  `Set.Ico 0 1`, so that the gaps are real numbers and the wrap-around gap is explicit.
- **Measure.** Averages are integrals against `AddCircle.haarAddCircle`, the Haar *probability*
  measure (`volume_eq_smul_haarAddCircle` relates it to `volume`); on `UnitAddCircle` the two
  agree (`UnitAddCircle.measure_univ`). Empirical measures are `ProbabilityMeasure (AddCircle T)`
  and converge in Mathlib's weak topology, tested through
  `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` against `AddCircle T →ᵇ ℝ`.
- **Characters.** The exponential `e(k x)` is `fourier k x` with `k : ℤ`, of modulus one
  (`fourier_norm`), multiplicative in `x` (`fourier_add`), and `fourier 0 = 1`.
- **Sums.** A Weyl sum is `∑ n ∈ Finset.range N, fourier k (x n)` and a Cesàro average is
  `(N : ℂ)⁻¹ • ∑ n ∈ Finset.range N, f (x n)`; where the sequence is an orbit this is
  `birkhoffAverage ℂ (a + ·) f N 0` and the identification is a target, not a convention.
- **Continued fractions.** The continued fraction of `ξ : ℝ` is `GenContFract.of ξ`; its
  convergents are `(GenContFract.of ξ).convs n`, equal to `Real.convergent ξ n : ℚ` by
  `Real.convs_eq_convergent`; its denominators `(GenContFract.of ξ).dens n` are real numbers that
  Layer C shows are casts of natural numbers `qₙ` with `q₀ = 1` (`GenContFract.zeroth_den_eq_one`),
  and its numerators `nums n` are casts of integers `pₙ`. Index from `0`: `p₀/q₀ = ⌊ξ⌋/1`. The
  partial denominators `aₙ` are `(GenContFract.of ξ).partDens.get? n` (a `Stream'.Seq ℝ`), with
  `a₀` written `(GenContFract.of ξ).h = ⌊ξ⌋` (`GenContFract.of_h_eq_floor`).
- **The golden ratio.** `Real.goldenRatio = (1 + √5)/2`, notation `φ` in `Real`; its conjugate
  is `Real.goldenConj`, notation `ψ`. Fibonacci numbers are `Nat.fib` with `fib 0 = 0`,
  `fib 1 = 1`.
- **Generality.** Rotation and density statements are over `AddCircle p` for arbitrary real
  `p > 0`; equidistribution and Weyl are over `AddCircle T`; continued fractions and the
  three-gap theorem are over `ℝ` with the circle of length `1`. Do not generalize the
  continued-fraction layer to an arbitrary `FloorRing`; the integer data and the inequalities
  are stated for `ℝ`.

## What Mathlib already has (consume)

Every declaration below is named with the Mathlib file (relative to `Mathlib/`) that holds it.

- **Rotations, density and ergodicity.**
  `AddCircle.denseRange_zsmul_iff : DenseRange (· • a : ℤ → AddCircle p) ↔ addOrderOf a = 0`
  (`Topology/Instances/AddCircle/DenseSubgroup.lean`), with the real form
  `AddCircle.denseRange_zsmul_coe_iff : … ↔ Irrational (a / p)` and
  `dense_addSubgroupClosure_pair_iff` (same file);
  `AddCircle.ergodic_add_left : Ergodic (a + ·) ↔ addOrderOf a = 0` and `ergodic_add_right`
  (`Dynamics/Ergodic/AddCircleAdd.lean`);
  `AddCircle.ergodic_zsmul`, `ergodic_nsmul` (`Dynamics/Ergodic/AddCircle.lean`);
  the abstract bridge `ergodic_smul_of_denseRange_zpow`, `ergodic_mul_left_iff_denseRange_zpow`
  (`Dynamics/Ergodic/Action/OfMinimal.lean`); and `MulAction.IsMinimal`,
  `MulAction.dense_orbit` (`Dynamics/Minimal.lean`).
- **Torsion and order.** `AddCircle.addOrderOf_coe_rat : addOrderOf (↑(↑q * p)) = q.den`,
  `addOrderOf_period_div`, `addOrderOf_div_of_gcd_eq_one`, `isOfFinAddOrder_iff_exists_rat_eq_div`,
  `finite_setOfPred_addOrderOf_eq`, `card_addOrderOf_eq_totient`, `AddCircle.coe_fract`,
  `equivIco`, `equivIoc`, `coe_eq_coe_iff_of_mem_Ico` (`Topology/Instances/AddCircle/Defs.lean`);
  `UnitAddCircle`, `AddCircle.compactSpace` (`Topology/Instances/AddCircle/Real.lean`); for a
  point of finite order in any additive group, `IsOfFinAddOrder.multiples_eq_zmultiples`,
  `nsmul_eq_nsmul_iff_modEq`, `finite_multiples` (`GroupTheory/OrderOfElement.lean`) and
  `Nat.card_zmultiples` (`Data/ZMod/QuotientGroup.lean`).
- **Norm.** `AddCircle.norm_eq : ‖(x : AddCircle p)‖ = |x − round (p⁻¹ * x) * p|`,
  `norm_le_half_period`, `norm_coe_eq_abs_iff`, `UnitAddCircle.norm_eq`
  (`Analysis/Normed/Group/AddCircle.lean`).
- **Fourier.** `AddCircle.haarAddCircle` with `volume_eq_smul_haarAddCircle`; `fourier`,
  `fourier_coe_apply`, `fourier_zero`, `fourier_neg`, `fourier_add`, `fourier_norm`;
  `span_fourier_closure_eq_top`; `fourierLp`, `orthonormal_fourier`; `fourierCoeff`,
  `fourierBasis`, `hasSum_fourier_series_L2`, `tsum_sq_fourierCoeff`, `fourierCoeff_fourier`
  (all `Analysis/Fourier/AddCircle.lean`); `AddCircle.toCircle_nsmul`, `injective_toCircle`
  (`Analysis/SpecialFunctions/Complex/Circle.lean`). Tau Ceti adds
  `ContinuousMap.eq_zero_of_forall_fourierCoeff_eq_zero`
  (`TauCeti/Analysis/Fourier/AddCircle.lean`).
- **Averages.** `birkhoffSum`, `birkhoffAverage` (`Dynamics/BirkhoffSum/Basic.lean`,
  `Dynamics/BirkhoffSum/Average.lean`); `MeasureTheory.empiricalMeasure` with its
  `IsProbabilityMeasure` instance and `integral_empiricalMeasure_eq_birkhoffaverage`
  (`Dynamics/Ergodic/EmpiricalMeasure.lean`); `Filter.Tendsto.cesaro`
  (`Analysis/Asymptotics/SpecificAsymptotics.lean`); the mean ergodic theorem
  `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`
  (`Analysis/InnerProductSpace/MeanErgodic.lean`), consumed only as a cross-check.
- **Weak convergence.** `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`
  (`MeasureTheory/Measure/ProbabilityMeasure.lean`), `integral_dirac`
  (`MeasureTheory/Integral/Bochner/Basic.lean`), `BoundedContinuousFunction.mkOfCompact`
  (`Topology/ContinuousMap/Bounded/Basic.lean`).
- **Geometric sums.** `geom_sum_eq : x ≠ 1 → ∑ i ∈ range n, x ^ i = (x ^ n − 1)/(x − 1)`
  (`Algebra/Field/GeomSum.lean`).
- **Diophantine approximation.** `Real.exists_int_int_abs_mul_sub_le` (Dirichlet),
  `exists_nat_abs_mul_sub_round_le`, `exists_rat_abs_sub_le_and_den_le`,
  `exists_rat_abs_sub_lt_and_lt_of_irrational`,
  `infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational`,
  `Real.infinite_rat_abs_sub_lt_one_div_den_sq_iff_irrational`, `Real.convergent`,
  `convergent_zero`, `convergent_succ`, Legendre `Real.exists_rat_eq_convergent`
  (`NumberTheory/DiophantineApproximation/Basic.lean`); `Real.convs_eq_convergent`,
  `exists_convs_eq_rat` (`NumberTheory/DiophantineApproximation/ContinuedFractions.lean`);
  `AddCircle.exists_norm_nsmul_le` (`NumberTheory/WellApproximable.lean`).
- **Continued fractions.** `GenContFract.of` (`Algebra/ContinuedFractions/Computation/Basic.lean`),
  `nums`, `dens`, `convs`, `partDens` (`Algebra/ContinuedFractions/Basic.lean`);
  `nums_recurrence`, `dens_recurrence` (`Algebra/ContinuedFractions/ContinuantsRecurrence.lean`);
  `GenContFract.determinant` (`Algebra/ContinuedFractions/Determinant.lean`); `zeroth_den_eq_one`,
  `zeroth_num_eq_h`, `first_den_eq`, `first_num_eq`, `terminatedAt_iff_partDen_none`
  (`Algebra/ContinuedFractions/Translations.lean`); `of_h_eq_floor`, `of_s_succ`, `of_s_head`
  (`Algebra/ContinuedFractions/Computation/Translations.lean`); `exists_int_eq_of_partDen`,
  `of_partNum_eq_one`, `of_one_le_get?_partDen`, `succ_nth_fib_le_of_nth_den`, `of_den_mono`,
  `abs_sub_convs_le`, `abs_sub_convergents_le'`, `sub_convs_eq`
  (`Algebra/ContinuedFractions/Computation/Approximations.lean`); `of_convergence`,
  `convs_succ` (`Algebra/ContinuedFractions/Computation/ApproximationCorollaries.lean`);
  `terminates_iff_rat` (`Algebra/ContinuedFractions/Computation/TerminatesIffRat.lean`).
- **Golden ratio.** `Real.goldenRatio`, `goldenConj`, `goldenRatio_sq`, `one_lt_goldenRatio`,
  `goldenRatio_irrational`, `coe_fib_eq`,
  `fib_succ_sub_goldenRatio_mul_fib : fib (n+1) − φ * fib n = ψ ^ n`,
  `goldenRatio_mul_goldenConj`, `inv_goldenRatio` (`NumberTheory/Real/GoldenRatio.lean`);
  `Nat.fib_add_two`, `Nat.fib_coprime_fib_succ` (`Data/Nat/Fib/Basic.lean`).
- **Fractional parts.** `Int.fract_add_intCast`, `fract_fract_add`, `fract_add_fract`,
  `fract_fract_sub`, `fract_sub_fract`, `fract_fract_sub_fract`, `fract_eq_fract`
  (`Algebra/Order/Floor/Ring.lean`); `Irrational.ne_rat` (`NumberTheory/Real/Irrational.lean`);
  `Finset.orderEmbOfFin` (`Data/Finset/Sort.lean`); `Finset.card_le_three`,
  `Finset.exists_ne_map_eq_of_card_lt_of_maps_to` (`Data/Finset/Card.lean`).

## What is missing (build here)

Absent from Mathlib and Tau Ceti: any notion of a uniformly distributed or equidistributed
sequence (`equidistrib`, `UnifDistributed`, `Weyl`, `discrepancy`, `van der Corput`), Weyl's
criterion, the equidistribution of `nα`, the empirical measure of a sequence (Mathlib's
`MeasureTheory.empiricalMeasure` is the orbit-of-a-map form, consumed in Layer B), density of
the `ℕ`-orbit `n • a` (only the `ℤ`-orbit is there), the integer numerator/denominator sequences
of `GenContFract.of ξ` as `ℤ`- and `ℕ`-valued functions, the best-approximation property of
convergents, Hurwitz's theorem (the infinitude statement is the open Mathlib pull request
[#43281](https://github.com/leanprover-community/mathlib4/pull/43281), whose name and statement
Layer C adopts; its sharpness at `φ` is nowhere), the continued fraction of `φ`, and the three-gap
theorem (`three gap`, `three distance`, `Steinhaus`). Fejér kernels and approximate identities are
also absent, and are not needed: the density of trigonometric polynomials is
`span_fourier_closure_eq_top`.

Two external Lean formalizations of the three-gap theorem are cited as sources, not
specifications: Mathlib pull request
[#40037](https://github.com/leanprover-community/mathlib4/pull/40037) (S. Shai, not merged,
irrational `α` only, Liang's proof through `Finset.orderEmbOfFin` and a jump trichotomy); and
[dkunert/three-gap-theorem-lean](https://github.com/dkunert/three-gap-theorem-lean) (MIT, commit
`2419d729`, uniform in `α`, first-return proof through `Int.fract`, declarations
`ThreeGap.three_gap_card_le_three` and `ThreeGap.three_gap_lengths_eq`), whose README names a
third unpublished development. Layer D follows the second's statement shape (uniform in `α`,
`Int.fract`, a `Multiset ℝ` of gaps) because it is the stronger theorem; coordinate with its
author before copying any proof text, per the porting guidance.

---

## The build, in layers

### Layer A: the orbit of a rotation

Suggested home: `TauCeti/Dynamics/Rotation/Orbit.lean`.

Fix `p : ℝ` with `[Fact (0 < p)]` and `a : AddCircle p`.

- **The `ℕ`-orbit is dense iff the `ℤ`-orbit is.** Prove
  `AddCircle.denseRange_nsmul_iff : DenseRange (· • a : ℕ → AddCircle p) ↔ addOrderOf a = 0`.
  The forward direction is `AddCircle.denseRange_zsmul_iff` through `DenseRange.mono`; the
  reverse is the content: for `addOrderOf a = 0` and any open `U`, some `n • a ∈ U` with `n ≥ 0`.
  Prove it by compactness of `AddCircle p` (`AddCircle.compactSpace`): finitely many translates of
  `U` by orbit points cover, so the `ℤ`-orbit hits `U` at a bounded negative index, which is
  pushed to a positive one. State also `AddCircle.denseRange_nsmul_coe_iff` in terms of
  `Irrational (x / p)` for `a = (x : AddCircle p)`, matching `denseRange_zsmul_coe_iff`.
- **Minimality.** Prove that for `addOrderOf a = 0` every nonempty closed set invariant under
  `(a + ·)` is the whole circle, as a theorem `AddCircle.eq_univ_of_isClosed_of_add_left_subset`,
  so that the `IsMinimal` vocabulary of `Dynamics/Minimal.lean` is available without choosing an
  `AddAction ℤ` instance.
- **Periodic orbits.** For `q : ℚ` and `a = ((q * p : ℝ) : AddCircle p)`, Mathlib already gives
  the group-theoretic half: `addOrderOf a = q.den` (`AddCircle.addOrderOf_coe_rat`), the `ℕ`-orbit
  equals the `ℤ`-orbit as sets (`IsOfFinAddOrder.multiples_eq_zmultiples`), `n • a = m • a ↔
  n ≡ m [MOD addOrderOf a]` (`nsmul_eq_nsmul_iff_modEq`), and `Nat.card (zmultiples a) = addOrderOf a`
  (`Nat.card_zmultiples`). Consume these and prove what is specific to the circle:
  `AddCircle.range_nsmul_coe_rat_eq_setOf_nsmul_eq_zero` (the orbit is the set
  `{x | q.den • x = 0}` of `q.den`-torsion points; it is the finite set
  `finite_setOfPred_addOrderOf_eq` describes) and the corollary
  `AddCircle.ncard_range_nsmul_coe_rat : (Set.range (· • a : ℕ → AddCircle p)).ncard = q.den`,
  through `Nat.card_zmultiples` and `AddSubmonoid.coe_multiples`-style bridges between the range
  of `(· • a)` and `AddSubmonoid.multiples a`. These are the "polyrhythm resolves after `q.den`
  beats" statements.
- **The rhythmic dichotomy.** Package the two previous items as
  `AddCircle.denseRange_nsmul_xor_finite_range : Xor (DenseRange (· • a : ℕ → _)) (Set.range (· • a : ℕ → _)).Finite`,
  so the two cases are stated as exclusive; the finite case is `finite_multiples` with
  `AddCircle.isOfFinAddOrder_iff_exists_rat_eq_div`. This is the first exercised consumer of the
  layer.

**Checks.**

- `n • ((1/2 : ℝ) : UnitAddCircle) = m • ((1/2 : ℝ) : UnitAddCircle) ↔ n ≡ m [MOD 2]`, and the
  orbit of `1/2` is not dense.
- The orbit of `((√2 : ℝ) : UnitAddCircle)` is dense and infinite.

### Layer B: Weyl's criterion and the equidistribution of `nα`

Suggested home: `TauCeti/NumberTheory/Equidistribution/Weyl.lean`,
`…/Equidistribution/Rotation.lean`.

Fix `T : ℝ` with `[hT : Fact (0 < T)]` and a sequence `x : ℕ → AddCircle T`. Every name in this
layer that is not prefixed `AddCircle.` lives in the namespace `AddCircle` as well (the
suggested file opens it), so `UnifDistributed` is `AddCircle.UnifDistributed`.

- **Definition.** `UnifDistributed x : Prop` holds when for every `f : C(AddCircle T, ℂ)`,
  `Tendsto (fun N ↦ (N : ℂ)⁻¹ • ∑ n ∈ range N, f (x n)) atTop (𝓝 (∫ t, f t ∂haarAddCircle))`.
  Its API: `unifDistributed_iff_real` (the same with `C(AddCircle T, ℝ)`, both directions
  through real and imaginary parts); `UnifDistributed.denseRange` (an equidistributed sequence
  is dense; use a bump function supported in a given open set with positive integral);
  `UnifDistributed.add_const` (translation invariance: `fun n ↦ x n + c`);
  `UnifDistributed.neg`; `UnifDistributed.of_tendsto_dist` (two sequences at vanishing distance
  are equidistributed together); and the shift lemma `unifDistributed_shift_iff`
  (`fun n ↦ x (n + 1)` is equidistributed iff `x` is).
- **Empirical measures.** Mathlib's `MeasureTheory.empiricalMeasure f x₀ n` is the orbit form,
  `birkhoffAverage ℝ≥0 f Measure.dirac (n + 1) x₀`, for the iterates of a map `f`. The sequence
  form is a target: define `seqEmpiricalMeasure x N : ProbabilityMeasure (AddCircle T)` for
  `N ≥ 1` as `(N⁻¹ : ℝ≥0) • ∑ n ∈ range N, dirac (x n)` (and `dirac (x 0)` for `N = 0`, stated
  and simp-normalized), with `integral_seqEmpiricalMeasure` through `integral_dirac`, and the
  bridge `seqEmpiricalMeasure_const_add_nsmul :
  (seqEmpiricalMeasure (fun n ↦ x₀ + n • a) (N + 1) : Measure (AddCircle T)) = MeasureTheory.empiricalMeasure (a + ·) x₀ N`,
  so that `integral_empiricalMeasure_eq_birkhoffaverage` is available on orbits. Prove
  `unifDistributed_iff_tendsto_seqEmpiricalMeasure :
  UnifDistributed x ↔ Tendsto (seqEmpiricalMeasure x) atTop (𝓝 haarAddCircle.toProbabilityMeasure)`
  through `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` and
  `BoundedContinuousFunction.mkOfCompact`.
- **Weyl's criterion.** Prove `unifDistributed_iff_forall_weylSum_tendsto_zero :
  UnifDistributed x ↔ ∀ k : ℤ, k ≠ 0 → Tendsto (fun N ↦ (N : ℂ)⁻¹ • ∑ n ∈ range N, fourier k (x n)) atTop (𝓝 0)`.
  Forward: `fourierCoeff_fourier` gives `∫ fourier k ∂haarAddCircle = 0` for `k ≠ 0`. Reverse: the
  averages are linear and `1`-Lipschitz in `f` for the sup norm, they converge on each
  `fourier k` (to `1` for `k = 0`, which is the `fourier_zero` case), hence on the span, hence on
  its closure, which is everything by `span_fourier_closure_eq_top`. State the intermediate
  `tendsto_average_of_forall_fourier` for a general linear, sup-norm-bounded family of
  functionals, so the same argument serves `AddCircleMulti` consumers.
- **Arc counting.** Prove `UnifDistributed.tendsto_card_filter_mem_Ico_div`: for
  `UnifDistributed x` and reals `u ≤ v` with `v − u ≤ T`, the proportion of `n < N` with
  `x n ∈ (equivIco T u) ⁻¹' Ico u v` tends to `(v − u)/T`. Approximate the indicator of the arc
  from above and below by continuous functions with integrals within `ε` (the trapezoids), and
  compare. State the converse `unifDistributed_of_forall_tendsto_card_filter_mem_Ico_div` (arc
  counting for every arc implies equidistribution), by uniform approximation of a continuous
  function by step functions on arcs; together they are the classical definition. The real form
  on `UnitAddCircle`, `tendsto_card_filter_fract_mem_Ico_div`, is stated below under the
  consequences for `nα`.
- **Equidistribution of `nα`.** For `a : AddCircle T` with `addOrderOf a = 0`, prove
  `AddCircle.unifDistributed_nsmul : UnifDistributed (fun n : ℕ ↦ n • a)`, through Weyl's
  criterion: `fourier k (n • a) = fourier k a ^ n` (`fourier_apply`, `toCircle_nsmul`), the sum
  is a geometric sum, `geom_sum_eq` and `fourier_norm` bound it by `2 / ‖fourier k a − 1‖`, and
  `fourier k a ≠ 1` for `k ≠ 0` is exactly `addOrderOf a = 0` through `injective_toCircle`.
  State the real form `unifDistributed_nsmul_coe : Irrational (α / T) → UnifDistributed (fun n ↦ ((n * α : ℝ) : AddCircle T))`
  and the converse direction `UnifDistributed (fun n ↦ n • a) → addOrderOf a = 0` through
  `UnifDistributed.denseRange` and `denseRange_nsmul_iff`.
- **Consequences for `nα`.** Prove the arc-counting form on `UnitAddCircle`,
  `tendsto_card_filter_fract_mem_Ico_div`: for irrational `α` and `0 ≤ u ≤ v ≤ 1`, the
  proportion of `n < N` with `Int.fract (n * α) ∈ Ico u v` tends to `v − u`. Prove
  `AddCircle.unifDistributed_const_add_nsmul` (the orbit `fun n ↦ x₀ + n • a` of any starting
  point, from `UnifDistributed.add_const`), and record the identification
  `AddCircle.birkhoffAverage_add_left_eq : birkhoffAverage ℂ (a + ·) f N x₀ = (N : ℂ)⁻¹ • ∑ n ∈ range N, f (x₀ + n • a)`
  (from `birkhoffSum` and `iterate` of a translation), so the layer's statements read as
  Birkhoff averages. Also prove the `L²` cross-check `AddCircle.tendsto_birkhoffAverage_add_left_L2`:
  for `f ∈ Lp ℂ 2 haarAddCircle` and `addOrderOf a = 0`, the mean ergodic theorem
  `tendsto_birkhoffAverage_orthogonalProjection` applied to the Koopman operator of the rotation
  yields the constant `∫ f`; this consumes Mathlib, reproves nothing, and is the only
  measure-theoretic averaging statement in the roadmap.

**Checks.**

- The constant sequence is not uniformly distributed (`¬ UnifDistributed (fun _ ↦ x₀)`).
- For `α = 1/2` on `UnitAddCircle`, `fun n ↦ n • (1/2 : UnitAddCircle)` is not uniformly
  distributed, although its Weyl sums vanish for every odd `k`: the criterion fails at `k = 2`.
- `fun n ↦ n • ((√2 : ℝ) : UnitAddCircle)` is uniformly distributed (`irrational_sqrt_two`).

### Layer C: convergents, best approximations and Hurwitz

Suggested home: `TauCeti/NumberTheory/ContinuedFractions/Real.lean`, `…/BestApprox.lean`,
`…/Hurwitz.lean`, `…/GoldenRatio.lean`.

Fix `ξ : ℝ` and write `cf ξ := GenContFract.of ξ`. Every name in this layer lives in the
namespace `Real`, so `convDen_pos` is `Real.convDen_pos`.

- **Integer data.** Define `Real.convNum ξ : ℕ → ℤ` and `Real.convDen ξ : ℕ → ℕ` with
  `Real.coe_convNum : ((convNum ξ n : ℤ) : ℝ) = (cf ξ).nums n` and
  `Real.coe_convDen : ((convDen ξ n : ℕ) : ℝ) = (cf ξ).dens n`
  (`GenContFract.exists_int_eq_of_partDen`, `of_partNum_eq_one`, `nums_recurrence`,
  `dens_recurrence`, `zeroth_den_eq_one`), the recurrences `convDen_add_two :
  convDen ξ (n + 2) = aₙ₊₂ * convDen ξ (n + 1) + convDen ξ n` with `aₙ₊₂ : ℕ` the partial
  denominator (and `convNum_add_two` over `ℤ`), `convDen_pos`, `convDen_strictMono` from
  index `1` (`of_den_mono` gives monotone; strictness needs `aₙ ≥ 1`,
  `of_one_le_get?_partDen`), `fib_succ_le_convDen : Nat.fib (n + 1) ≤ convDen ξ n` (from
  `succ_nth_fib_le_of_nth_den`), `isCoprime_convNum_convDen : IsCoprime (convNum ξ n) (convDen ξ n)`
  and `convNum_mul_convDen_succ_sub : convNum ξ n * convDen ξ (n+1) − convNum ξ (n+1) * convDen ξ n = (-1)^(n+1)`
  (from `GenContFract.determinant` with all partial numerators `1`), and
  `convergent_eq_convNum_div_convDen : Real.convergent ξ n = convNum ξ n / convDen ξ n` with
  `den_convergent : (Real.convergent ξ n).den = convDen ξ n`.
  All of these are stated for every `ξ`, with the proviso `¬ (cf ξ).TerminatedAt n` where the
  recurrence needs the `(n+1)`-st partial denominator to exist; for irrational `ξ` the proviso is
  discharged by `terminates_iff_rat`.
- **Signed error and alternation.** Define `Real.convErr ξ n := convDen ξ n * ξ − convNum ξ n`.
  Prove `convErr_pos_iff : 0 < convErr ξ n ↔ Even n` for irrational `ξ` (the convergents
  alternate around `ξ`), `abs_convErr_succ_lt : |convErr ξ (n + 1)| < |convErr ξ n|`, and the
  upper bound `abs_convErr_lt_inv_convDen_succ : |convErr ξ n| < 1 / convDen ξ (n + 1)` (this is
  `abs_sub_convs_le` multiplied out). The lower bound
  `1 / (convDen ξ n + convDen ξ (n + 1)) < |convErr ξ n|` is **not** restated here: it is
  DiophantineApproximationAndTranscendence §0.5, and consumers cite it there.
- **Best approximation (Lagrange).** Prove `Real.abs_convErr_le_norm_of_lt_convDen_succ`: for
  irrational `ξ`, `n ≥ 1`, and every natural `q` with `0 < q < convDen ξ (n + 1)`,
  `|convErr ξ n| ≤ ‖((q * ξ : ℝ) : UnitAddCircle)‖`; and the strict companion
  `abs_convErr_lt_norm_of_lt_convDen_succ_of_ne` (strict for `q ≠ convDen ξ n`). Prove the
  characterization `isBestApprox_iff`: `q ≥ 1` satisfies
  `∀ q', 0 < q' → q' < q → ‖(q * ξ)‖ < ‖(q' * ξ)‖` iff `q = convDen ξ n` for some `n ≥ 1`
  (with the usual caveat at `n = 0` when `a₁ = 1`, which is why the index starts at `1`; state the
  `n = 0` case separately as `convDen_one_isBestApprox_iff`). Use
  `Real.exists_rat_eq_convergent` (Legendre) for one direction and the determinant identity for
  the other. Derive `exists_convDen_eq_of_forall_norm_lt`: a denominator whose `‖qξ‖` beats
  every smaller denominator is a convergent denominator.
- **Hurwitz.** Prove `exists_convDen_mul_abs_convErr_lt_inv_sqrt_five`: for irrational `ξ` and
  every `n`, one of `k ∈ {n, n+1, n+2}` has `convDen ξ k * |convErr ξ k| < 1 / √5`, hence
  `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational :
  {t : ℚ | |ξ − t| < 1 / (√5 * (t.den : ℝ) ^ 2)}.Infinite`. The name and statement are those of
  the Mathlib pull request
  [#43281](https://github.com/leanprover-community/mathlib4/pull/43281), which proves the same
  infinitude through Farey brackets without continued fractions; build it here from the
  convergent form, so that if that pull request lands the statement is replaced by an import and
  the convergent form stays. Prove the sharpness
  `Real.finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt`: for every `c > √5` the set
  `{q : ℚ | |φ − q| < 1 / (c * q.den ^ 2)}` is finite; and the limit
  `tendsto_convDen_mul_abs_convErr_goldenRatio : Tendsto (fun n ↦ convDen φ n * |convErr φ n|) atTop (𝓝 (1 / √5))`,
  which with Legendre shows `√5` cannot be improved for `φ`. The sharpness uses the explicit
  continued fraction of `φ` below, and `fib_succ_sub_goldenRatio_mul_fib`.
- **The golden ratio.** Prove `Real.goldenRatio_partDens : ∀ n, (cf φ).partDens.get? n = some 1`
  and `goldenRatio_h : (cf φ).h = 1` (from `goldenRatio_sq`, `inv_goldenRatio`, `of_s_succ`,
  `of_h_eq_floor`); `convNum_goldenRatio : convNum φ n = Nat.fib (n + 2)` and
  `Real.convDen_goldenRatio : convDen φ n = Nat.fib (n + 1)` (`Nat.fib_add_two`); the exact
  error `Real.convErr_goldenRatio : convErr φ n = -(ψ ^ (n + 1))` (`fib_succ_sub_goldenRatio_mul_fib`,
  sign: `convErr` is the negative of that lemma's left-hand side),
  so `abs_convErr_goldenRatio : |convErr φ n| = φ ^ (-(n + 1 : ℤ))`; and
  `tendsto_fib_succ_div_fib : Tendsto (fun n ↦ (Nat.fib (n + 1) : ℝ) / Nat.fib n) atTop (𝓝 φ)`
  as the consumer of `of_convergence`.

**Checks.**

- `convDen (√2) n` is `1, 2, 5, 12, …`: `convDen √2 2 = 5`, with `convNum √2 2 = 7`, and
  `|5 √2 − 7| < 1/12`.
- `q = 3` is not a best approximation to `√2` (`‖3√2‖ > ‖2√2‖`).
- `convDen φ 4 = 5`, `convNum φ 4 = 8`, and `5 * |5 φ − 8| < 1/2`.

### Layer D: the three-gap theorem

Suggested home: `TauCeti/Dynamics/Rotation/ThreeGap.lean`,
`TauCeti/Dynamics/Rotation/ThreeGapContFract.lean`.

Fix `α : ℝ` and `N : ℕ`. Every name in this layer lives in the namespace `Rotation`, so
`orbitFract` is `Rotation.orbitFract`.

- **The point set and its gaps.** Define `Rotation.orbitFract α N : Finset ℝ :=
  (range N).image (fun n ↦ Int.fract (n * α))`, with `orbitFract_subset_Ico : ↑(orbitFract α N) ⊆ Ico 0 1`,
  `zero_mem_orbitFract` for `N ≥ 1`, `card_orbitFract_of_irrational : Irrational α → (orbitFract α N).card = N`
  (`Int.fract_eq_fract` and `Irrational.ne_rat`), and `card_orbitFract_ratCast` for
  `α = (q : ℚ)`: the card is `min N q.den`. Define `Rotation.gaps α N : Multiset ℝ` as the
  multiset of successive differences of the sorted points (`Finset.orderEmbOfFin` or
  `Finset.sort`) together with the wrap-around gap `1 − max`, so that `gaps_sum : (gaps α N).sum = 1`
  for `N ≥ 1`, `card_gaps : Multiset.card (gaps α N) = (orbitFract α N).card`, and
  `pos_of_mem_gaps` (every gap is positive). Pin: the gap *from* the point `y` is the distance to
  the next point counterclockwise, with the last point's gap reaching `1`, so that on
  `UnitAddCircle` (through `AddCircle.coe_fract`) the gaps are the arcs between consecutive orbit
  points. Define the two return lengths `Rotation.etaPos α N : ℝ := sInf ↑((orbitFract α N).erase 0)`
  (the least positive point, written `η⁺`) and `Rotation.etaNeg α N : ℝ := 1 − sSup ↑(orbitFract α N)`
  (the wrap-around gap, written `η⁻`); both are meaningful when the orbit has at least two points
  (`2 ≤ (orbitFract α N).card`), and `etaPos_mem_gaps`, `etaNeg_mem_gaps` record that both occur
  as gaps.
- **Three gaps, uniform in `α`.** Prove `Rotation.gaps_toFinset_subset :
  2 ≤ (orbitFract α N).card → (gaps α N).toFinset ⊆ {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N}`
  for every real `α`; this is the statement the two headline theorems are read off from. From it,
  `Rotation.card_toFinset_gaps_le_three : (gaps α N).toFinset.card ≤ 3` for every real `α` and
  every `N` (`Finset.card_le_three`), and `Rotation.gaps_toFinset_eq_of_card_eq_three`: when
  exactly three lengths occur, `(gaps α N).toFinset = {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N}`.
  The proof pattern is the first-return argument: the gap from `Int.fract (n α)` to its successor
  is `Int.fract ((m − n) α)` for the index `m` of the successor (`fract_fract_sub_fract`), and the
  successor index differs from `n` by one of two fixed return times, except on the last stretch
  where it is the sum. Handle rational `α` (where points coincide) without a case split, by
  working with the card of `orbitFract` rather than with `N`.
- **Multiplicities.** For irrational `α` and `N ≥ 2` define `Rotation.retPos α N : ℕ` and
  `Rotation.retNeg α N : ℕ` as the (unique, by `card_orbitFract_of_irrational`) indices `< N` with
  `Int.fract (retPos α N * α) = etaPos α N` and `Int.fract (retNeg α N * α) = 1 − etaNeg α N`,
  written `r⁺` and `r⁻`. Prove `Rotation.count_gaps_of_irrational`: the gap `η⁺` occurs `N − r⁺`
  times, `η⁻` occurs `N − r⁻` times, and `η⁺ + η⁻` occurs `r⁺ + r⁻ − N` times
  (`Multiset.count`).
- **Gap lengths from the continued fraction.** For irrational `α` and `N ≥ 2`, let `k` be the
  index with `convDen α k < N ≤ convDen α (k + 1)` (it exists and is unique by
  `convDen_strictMono` and `convDen α 0 = 1`), and let `m := (N − 1 − convDen α (k − 1)) / convDen α k`
  (natural-number division). For `k = 0` the index `k − 1` refers to the conventional
  `q₋₁ = 0`, `p₋₁ = 1`, so read `convDen α (k − 1)` as `0` and `|convErr α (k − 1)|` as `1`; state
  the `k = 0` case as its own theorem rather than through a shifted index, and state the `k ≥ 1`
  case with the index written `k + 1`, as in `Suggested.lean`. Prove
  `Rotation.retPos_retNeg_eq_of_convDen_lt`: `({r⁺, r⁻} : Finset ℕ) = {convDen α k, convDen α (k − 1) + m * convDen α k}`
  with the assignment to `r⁺` or `r⁻` decided by the parity of `k` (`convErr_pos_iff`), and
  `Rotation.gaps_toFinset_subset_of_convDen_lt` (the `k ≥ 1` case) and
  `Rotation.gaps_toFinset_subset_of_lt_convDen_one` (the `k = 0` case): the gap lengths are among
  `|convErr α k|`, `|convErr α (k − 1)| − m * |convErr α k|` and their sum, the first two being
  `η⁺` and `η⁻` in the order fixed by the parity of `k`. The positivity of the second expression
  comes from `|convErr α (k − 1)| = aₖ₊₁ |convErr α k| + |convErr α (k + 1)|` and
  `m ≤ aₖ₊₁ − 1`, which follows from `N ≤ convDen α (k + 1)` and the recurrence. Derive
  `Rotation.gaps_toFinset_eq_of_eq_convDen`: when `N = convDen α (k + 1)` then `m = aₖ₊₁ − 1`,
  the third multiplicity `r⁺ + r⁻ − N` is `0`, and there are exactly two gap lengths,
  `|convErr α k|` (occurring `convDen α (k + 1) − convDen α k` times) and
  `|convErr α k| + |convErr α (k + 1)|` (occurring `convDen α k` times).
- **The golden rotation.** Prove `Rotation.exists_zpow_eq_of_mem_gaps_goldenRatio`: for `α = φ`
  every gap length is `φ ^ (-(j : ℤ))` for some `j`, and
  `Rotation.gaps_goldenRatio_toFinset_subset`: the lengths present at any `N ≥ 2` are among
  three consecutive powers `φ^{-(j+2)}, φ^{-(j+1)}, φ^{-j}`; hence
  `Rotation.gaps_goldenRatio_le_sq_mul : ∀ s ∈ gaps φ N, ∀ t ∈ gaps φ N, s ≤ φ ^ 2 * t` for
  every `N ≥ 1`. This is the roadmap's precise form of "the golden rhythm is the most even": it
  consumes `Real.convErr_goldenRatio` from Layer C and `gaps_toFinset_subset_of_convDen_lt` with
  `aₖ₊₁ = 1`, so `m = 0` and the lengths are `|convErr φ k| = φ^{-(k+1)}`,
  `|convErr φ (k − 1)| = φ^{-k}` and their sum `φ^{-(k-1)}`.

**Checks.**

- `α = 1/3`, `N = 5`: `orbitFract` has card `3` and `gaps` is `{1/3, 1/3, 1/3}`.
- `α = √2`, `N = 3`: the points are `0, √2 − 1, 2√2 − 2`, the gaps are
  `√2 − 1, √2 − 1, 3 − 2√2`, with `η⁺ = √2 − 1` at index `r⁺ = 1` and `η⁻ = 3 − 2√2` at index
  `r⁻ = 2`. With `convDen √2 0 = 1`, `convDen √2 1 = 2`, `convErr √2 0 = √2 − 1` and
  `convErr √2 1 = 2√2 − 3`, `N = 3` gives `k = 1`, `m = (3 − 1 − 1)/2 = 0`, returns `{2, 1}`,
  lengths `|convErr √2 1| = 3 − 2√2` and `|convErr √2 0| = √2 − 1`; the sum `2 − √2` does not
  occur because `r⁺ + r⁻ − N = 0`.
- `α = φ`, `N = 4`: the sorted points are `0, φ⁻³, φ⁻¹, 1 − φ⁻⁴`, the gaps are
  `φ⁻³, φ⁻², φ⁻³, φ⁻⁴`, three lengths with `max/min = φ²`; `k = 3`, `m = 0`, returns `{3, 2}`.
- `α = φ`, `N = 5 = convDen φ 4`: exactly two gap lengths, `φ⁻³` three times and `φ⁻⁴` twice.

### Layer E: roadmap-for-a-roadmap. DO NOT FOLLOW.

This section is motivation for a future roadmap and names no targets; contributors must not
attempt anything in it under this roadmap. Three continuations are natural once Layers A–D
exist: quantitative equidistribution (the discrepancy `D_N` of `{nα}`, the Erdős–Turán
inequality, and `D_N = O(log N / N)` for badly approximable `α`, which would consume
DiophantineApproximationAndTranscendence §0.6 and Layer C); Kronecker–Weyl in several
dimensions (equidistribution of `(nα₁, …, nαₐ)` on `UnitAddTorus d` under `ℚ`-linear
independence of `1, α₁, …, αₐ`, through `span_mFourier_closure_eq_top`, with the inhomogeneous
approximation statements of DiophantineApproximationAndTranscendence §0.4 as its consumers);
and the ergodic generalizations (unique ergodicity of minimal rotations of compact abelian groups,
Weyl's polynomial equidistribution through van der Corput differencing, and the pointwise ergodic
theorem), of which the homogeneous-space cases are proposed in roadmap pull request #851.

## Ordering

Layer A first; it is small and validates the `AddCircle` conventions. Layer B next, the
definition and Weyl's criterion before the arc-counting characterization, then `nα`. Layer C is
independent of A and B and can proceed in parallel: integer data, then alternation and
Lagrange, then the golden ratio, then Hurwitz. Layer D's three-gap theorem depends only on
Layer A's conventions and Mathlib; its continued-fraction identification depends on Layer C.
Within D, the uniform theorem precedes the multiplicities, which precede the convergent
identification, which precedes the golden rotation.

## References

- L. Kuipers and H. Niederreiter, *Uniform Distribution of Sequences*, Wiley 1974, Ch. 1 §§1–2
  (Weyl's criterion, `nα`).
- A. Ya. Khinchin, *Continued Fractions*, Dover, §§6, 9, 16 (best approximations, Lagrange),
  §19 (Hurwitz and `√5`).
- G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Ch. X–XI
  (Theorems 181, 193–195: convergents as best approximations, Hurwitz, the golden ratio).
- V. T. Sós, *On the distribution mod 1 of the sequence nα*, Ann. Univ. Sci. Budapest 1 (1958)
  127–134; and N. B. Slater, *Gaps and steps for the sequence nθ mod 1*, Proc. Cambridge Philos.
  Soc. 63 (1967) 1115–1123 (the three-gap theorem with multiplicities through convergents).
- P. Alessandri and V. Berthé, *Three distance theorems and combinatorics on words*,
  Enseign. Math. 44 (1998) 103–132 (survey; Theorem 1 is Layer D's gap-length statement).
- F. M. Liang, *A short proof of the 3d distance theorem*, Discrete Math. 28 (1979) 325–326.
- H. Weyl, *Über die Gleichverteilung von Zahlen mod. Eins*, Math. Ann. 77 (1916) 313–352.
- M. Einsiedler and T. Ward, *Ergodic Theory with a view towards Number Theory*, GTM 259,
  §§1.1, 2.1, 4.4 (circle rotation, unique ergodicity, Weyl).
