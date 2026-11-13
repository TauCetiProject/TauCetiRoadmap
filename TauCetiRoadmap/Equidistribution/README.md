# Roadmap: equidistribution, three gaps and rhythm on the circle

**Summary.** Build the elementary theory of the orbit `{nα}` of a rotation of the circle:
the dichotomy between periodic and dense orbits, the equidistribution of the orbit of a point of
infinite order on a circle of any period, the best-approximation and Hurwitz theory of
continued-fraction convergents with the golden ratio as the extremal number, and the three-gap
(Steinhaus) theorem with its gap lengths read off the continued fraction of `α`. The foundations
are Mathlib's `AddCircle`, its continued-fraction computation `GenContFract.of`, and its Dirichlet,
Legendre and Hurwitz theorems, with Tau Ceti's empirical measures of sequences.

Suggested homes:

```text
TauCeti/Dynamics/Rotation/            (Layers 1, 2 and 4: orbits, equidistribution, gaps)
TauCeti/NumberTheory/ContinuedFractions/ (Layer 3: convergents, best approximation, golden ratio)
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
for infinite order) and its cardinality for rational `α`; the transfer of the equidistribution of `nα` to a
circle of arbitrary period `T`; the integer numerator/denominator data of `GenContFract.of ξ` for real `ξ`,
the alternation and decay of the convergent errors, the characterization of the convergent
denominators as the best approximations of the second kind (Lagrange), the convergent form of
Hurwitz's theorem, its sharpness at `φ`, and the continued fraction of `φ`; the three-gap theorem
for `{nα}`, uniform in `α`, and the identification of the gap lengths through the convergent
denominators when `α` is irrational.

It cites ProbabilisticAndMetricNumberTheory, which owns on the unit circle and the torus
`UnitAddTorus d`: the definition of an equidistributed sequence through the empirical measures
(§2.1), Weyl's criterion (§2.4), the equidistribution of `n • α + β` and the frequencies of
`Int.fract (n α)` in an interval (§2.5), discrepancy, Koksma's inequality and the Erdős–Turán
inequality (§2.7), and the pointwise Birkhoff ergodic theorem (§4.1). Nothing here restates those
targets. The mean ergodic theorem, Koopman operators and invariant σ-algebras are the content of
the completed [Exchangeability](../../Completed/Exchangeability/README.md) roadmap; none of them
is needed here, because every averaging statement below holds for every starting point and is
proved from Weyl sums rather than almost everywhere. Circular discrepancy and its adapters are
DiophantineApproximationAndTranscendencePartII §§3.1–3.4.

It also cites the
[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
roadmap, which owns: the lower bound `|ξ − pₖ/qₖ| > 1/(qₖ(qₖ + qₖ₊₁))` and the limsup formula for
the irrationality exponent (its §0.5), the predicate `BadlyApproximable` and its stability lemmas
(its §0.6), simultaneous and inhomogeneous (Kronecker) approximation in several dimensions
(its §0.4), and everything about transcendence. Hurwitz's theorem and its sharpness at `φ` are
stated directly in terms of `q · ‖q φ‖` and do not pass through `BadlyApproximable`.

It does not own homogeneous dynamics on `G/Γ`, unipotent flows or Ratner-type equidistribution
(GeometryOfNumbersAndQuadraticArithmetic §4.2), equidistribution of small points of bounded
height (ArithmeticDynamics), or effective Diophantine methods and exact rational point counts
(EffectiveDiophantineMethods). Kronecker–Weyl equidistribution in several dimensions is
ProbabilisticAndMetricNumberTheory §2.5 (`linear_equidistribution_tfae`), and inhomogeneous
Kronecker approximation is DiophantineApproximationAndTranscendence §0.4.

## Conventions

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
  the circle is `AddCircle.coe_fract`. The three-gap theorem (Layer 4) is stated for
  `Int.fract (n * α)`, `n < N`, as a `Finset ℝ` inside `Set.Ico 0 1`, so that the gaps are real
  numbers and the wrap-around gap is explicit.
- **Measure and averages.** Averages are integrals against `AddCircle.haarAddCircle`, the Haar
  *probability* measure (`AddCircle.volume_eq_smul_haarAddCircle` relates it to `volume`). The
  empirical measure of a sequence `x : ℕ → α` is Tau Ceti's
  `TauCeti.Probability.empiricalMeasure x n : ProbabilityMeasure α`, which averages the first
  `n + 1` terms `x 0, …, x n`, as does Mathlib's `MeasureTheory.empiricalMeasure f x₀ n` on the
  iterates of a map. Equidistribution is weak convergence of these measures to the Haar
  probability measure, tested through
  `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.
- **Continued fractions.** The continued fraction of `ξ : ℝ` is `GenContFract.of ξ`; its
  convergents are `(GenContFract.of ξ).convs n`, equal to `Real.convergent ξ n : ℚ` by
  `Real.convs_eq_convergent`. The roadmap's integer data are `ContFrac.convNum ξ n`, the numerator
  of `Real.convergent ξ n`, and `ContFrac.convDen ξ n`, its denominator, so that
  `(GenContFract.of ξ).nums n` and `.dens n` are their casts to `ℝ` (Layer 3). Index from `0`:
  `p₀/q₀ = ⌊ξ⌋/1`, and `q₀ = 1` (`GenContFract.zeroth_den_eq_one`). The partial denominators
  are `a₀ = ⌊ξ⌋ = (GenContFract.of ξ).h` (`GenContFract.of_h_eq_floor`) and, for `n ≥ 0`,
  `aₙ₊₁ = (GenContFract.of ξ).partDens.get? n` (a `Stream'.Seq ℝ`): Mathlib's stream index `n`
  carries the `(n + 1)`-st quotient. Check: for `π`, `partDens.get? 0 = 7 = a₁`, and
  `q₂ = a₂q₁ + q₀ = 15·7 + 1 = 106`. The signed error is
  `ContFrac.convErr ξ n := convDen ξ n * ξ − convNum ξ n`.
- **The golden ratio.** `Real.goldenRatio = (1 + √5)/2`, notation `φ` in `Real`; its conjugate
  is `Real.goldenConj`, notation `ψ`. Fibonacci numbers are `Nat.fib` with `fib 0 = 0`,
  `fib 1 = 1`.
- **Namespaces.** The roadmap's own declarations live in `Rotation` (Layers 1, 2 and 4) and
  `ContFrac` (Layer 3); every name qualified by `AddCircle`, `Real`, `GenContFract`, `Int` or
  `Nat` is Mathlib's or Tau Ceti's.
- **Generality.** Rotation and density statements are over `AddCircle p` for arbitrary real
  `p > 0`; equidistribution is over `AddCircle T`; continued fractions and the three-gap theorem
  are over `ℝ` with the circle of length `1`. Do not generalize the continued-fraction layer to
  an arbitrary `FloorRing`; the integer data and the inequalities are stated for `ℝ`.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- **Rotations, density and ergodicity.** `AddCircle.denseRange_zsmul_iff` and
  `AddCircle.denseRange_zsmul_coe_iff` (Topology/Instances/AddCircle/DenseSubgroup.lean);
  `denseRange_zsmul_iff_nsmul`, which says that in a compact additive group the `ℤ`-orbit of a
  point is dense iff its `ℕ`-orbit is (Topology/Algebra/Group/SubmonoidClosure.lean);
  `AddCircle.ergodic_add_left` (Dynamics/Ergodic/AddCircleAdd.lean).
- **Torsion and order.** `AddCircle.addOrderOf_coe_rat`, `AddCircle.isOfFinAddOrder_iff_exists_rat_eq_div`,
  `AddCircle.coe_fract` (Topology/Instances/AddCircle/Defs.lean); `AddCircle.compactSpace`
  (Topology/Instances/AddCircle/Real.lean); `IsOfFinAddOrder.multiples_eq_zmultiples`,
  `IsOfFinAddOrder.finite_multiples`, `nsmul_eq_nsmul_iff_modEq`
  (GroupTheory/OrderOfElement.lean); `Nat.card_zmultiples` (Data/ZMod/QuotientGroup.lean).
- **Norm.** `AddCircle.norm_eq`, `UnitAddCircle.norm_eq` (Analysis/Normed/Group/AddCircle.lean).
- **Haar measure.** `AddCircle.haarAddCircle` with `AddCircle.volume_eq_smul_haarAddCircle`
  (Analysis/Fourier/AddCircle.lean).
- **Empirical measures.** `MeasureTheory.empiricalMeasure` and
  `MeasureTheory.integral_empiricalMeasure_eq_birkhoffaverage`
  (Dynamics/Ergodic/EmpiricalMeasure.lean); `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`
  (MeasureTheory/Measure/ProbabilityMeasure.lean).
- **Diophantine approximation.** `Real.exists_int_int_abs_mul_sub_le` (Dirichlet),
  `Real.exists_rat_eq_convergent` (Legendre), `Real.convergent`
  (NumberTheory/DiophantineApproximation/Basic.lean); `Real.convs_eq_convergent`
  (NumberTheory/DiophantineApproximation/ContinuedFractions.lean);
  `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational`, Hurwitz's theorem
  `{t : ℚ | |ξ − t| < 1 / (√5 * t.den ^ 2)}.Infinite` for irrational `ξ`
  (NumberTheory/DiophantineApproximation/Hurwitz.lean); `AddCircle.exists_norm_nsmul_le`
  (NumberTheory/WellApproximable.lean).
- **Continued fractions.** `GenContFract.of` (Algebra/ContinuedFractions/Computation/Basic.lean),
  `GenContFract.nums`, `GenContFract.dens`, `GenContFract.convs`, `GenContFract.partDens`
  (Algebra/ContinuedFractions/Basic.lean); `GenContFract.nums_recurrence`,
  `GenContFract.dens_recurrence` (Algebra/ContinuedFractions/ContinuantsRecurrence.lean);
  `GenContFract.determinant` (Algebra/ContinuedFractions/Determinant.lean);
  `GenContFract.zeroth_den_eq_one`, `GenContFract.terminatedAt_iff_partDen_none`
  (Algebra/ContinuedFractions/Translations.lean); `GenContFract.of_h_eq_floor`,
  `GenContFract.of_s_succ` (Algebra/ContinuedFractions/Computation/Translations.lean);
  `GenContFract.exists_int_eq_of_partDen`, `GenContFract.of_partNum_eq_one`,
  `GenContFract.of_one_le_get?_partDen`, `GenContFract.succ_nth_fib_le_of_nth_den`,
  `GenContFract.of_den_mono`, `GenContFract.abs_sub_convs_le`, `GenContFract.sub_convs_eq`
  (Algebra/ContinuedFractions/Computation/Approximations.lean);
  `GenContFract.of_convergence` (Algebra/ContinuedFractions/Computation/ApproximationCorollaries.lean);
  `GenContFract.terminates_iff_rat` (Algebra/ContinuedFractions/Computation/TerminatesIffRat.lean).
- **Golden ratio.** `Real.goldenRatio`, `Real.goldenConj`, `Real.goldenRatio_sq`,
  `Real.goldenRatio_irrational`, `Real.coe_fib_eq`, `Real.fib_succ_sub_goldenRatio_mul_fib`,
  `Real.inv_goldenRatio` (NumberTheory/Real/GoldenRatio.lean); `Nat.fib_add_two`
  (Data/Nat/Fib/Basic.lean).
- **Fractional parts and finite sets.** `Int.fract_add_intCast`, `Int.fract_fract_sub_fract`,
  `Int.fract_eq_fract` (Algebra/Order/Floor/Ring.lean); `Irrational.ne_rat`
  (NumberTheory/Real/Irrational.lean); `Finset.sort` (Data/Finset/Sort.lean);
  `Finset.card_le_three`, `Finset.exists_ne_map_eq_of_card_lt_of_maps_to` (Data/Finset/Card.lean).

### From Tau Ceti

- `TauCeti.Probability.empiricalMeasure`, the empirical probability measure of the first `n + 1`
  terms of a sequence, with `TauCeti.Probability.integral_empiricalMeasure` (its integral is the
  average) and `TauCeti.Probability.empiricalMeasure_apply_toReal` (its mass of a measurable set
  is the proportion of terms in the set) (TauCeti/Probability/Process/EmpiricalMeasure.lean).
- `Real.num_convergent`, `Real.den_convergent`, `Real.fib_succ_le_den_convergent`,
  `Real.monotone_den_convergent`, `Real.abs_sub_convergent_le`,
  `Real.one_div_lt_abs_sub_convergent` and `Irrational.not_of_terminatedAt`
  (TauCeti/NumberTheory/DiophantineApproximation/ContinuedFractions.lean): the casts of the
  convergent numerator and denominator to the continuants, the Fibonacci lower bound and
  monotonicity of the denominators, the two-sided bounds on the convergent error, and the
  non-termination of the continued fraction of an irrational number.
- `AddCircle.torsionBy_eq_zmultiples` and `AddCircle.eq_torsionBy_of_natCard_eq`
  (TauCeti/Algebra/AddCircle.lean): a finite subgroup of `AddCircle p` of cardinality `n` is the
  `n`-torsion `(AddCircle p)[n]`.
- `TauCeti.Probability.birkhoffAverage_tendsto_metProjection`, the mean ergodic theorem for
  Birkhoff averages (TauCeti/Probability/Ergodic/MeanErgodic.lean), the Tau Ceti realization of
  the completed Exchangeability roadmap's ergodic layer; it is not needed by any target here and
  is listed so that consumers know where it lives.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §2.1 defines an equidistributed sequence `x : ℕ → X` for a Borel probability measure `μ` as
  convergence of `TauCeti.Probability.empiricalMeasure x` to `μ` in `ProbabilityMeasure X`, and
  proves the bounded-continuous-test, frequency and dense-range consequences. Its averaging
  convention is `(n + 1)⁻¹ ∑_{i ≤ n}`, not `N⁻¹ ∑_{n < N}`; the two agree because equidistribution
  ignores a finite shift of the index.
- §2.4 proves Weyl's criterion: a sequence in `UnitAddTorus d` is equidistributed for the Haar
  measure iff the averages of every nontrivial character tend to `0`.
- §2.5 proves that `n ↦ n • α + β` is equidistributed on `UnitAddTorus d` iff `α` is irrational,
  and on `UnitAddCircle` that the proportion of `n ≤ N` with `Int.fract` of the orbit point in
  `[a, b)` tends to the length of the interval.
- §2.7 owns star discrepancy, Koksma's inequality and the Erdős–Turán inequality.
- §4.1 owns the pointwise Birkhoff ergodic theorem.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§0.5: the lower bound `1/(qₖ(qₖ + qₖ₊₁)) < |ξ − pₖ/qₖ|` and the upper bound `|ξ − pₖ/qₖ| ≤ 1/(qₖ qₖ₊₁)`,
which are Tau Ceti's `Real.one_div_lt_abs_sub_convergent` and `Real.abs_sub_convergent_le`, and the
limsup formula for the irrationality exponent. §0.6: `BadlyApproximable` and its stability lemmas. §0.4: Kronecker
approximation. Nothing of these is restated here; Layer 3 cites §0.5 for the lower bound on the
convergent error and never reproves it.

## How to read the build

The layers are independent of one another except where a *Needs:* line says otherwise. Layer 1
validates the `AddCircle` conventions and is small. Layer 2 transfers the equidistribution of the
orbit from the unit circle to a circle of any period, on Tau Ceti's empirical measures. Layer 3
builds the integer convergent data of a real number, then the alternation and decay of the
errors, Lagrange's characterization of best approximations, the convergent form of Hurwitz's
theorem with its sharpness at the golden ratio, and the continued fraction of the golden ratio.
Layer 4 proves the three-gap theorem uniformly in `α`, then the multiplicities, then the gap
lengths through the convergent denominators, then the golden rotation; its first two items use
only Layer 1's conventions, and its continued-fraction identification uses Layer 3.

A name in code font that is qualified by `Rotation` or `ContFrac` is a declaration of
`Suggested.lean`, with the signature given there. The facts of each definition's API that the text
states in prose are targets too; a contributor names them in the same namespace.

## Layer 1: the orbit of a rotation

Suggested home: `TauCeti/Dynamics/Rotation/Orbit.lean`. Names live in the namespace `Rotation`.

Fix `p : ℝ` with `[Fact (0 < p)]` and `a : AddCircle p`.

### 1.1 Dense and periodic orbits

The `ℕ`-orbit is dense iff the `ℤ`-orbit is, by `denseRange_zsmul_iff_nsmul` (`AddCircle p` is
compact), so the `ℕ`-orbit of `a` is dense iff `addOrderOf a = 0`; this is a one-line corollary
of `AddCircle.denseRange_zsmul_iff` and needs no argument of its own. In terms of a real number
`x`, the orbit of `(x : AddCircle p)` is dense iff `x / p` is irrational, by
`AddCircle.denseRange_zsmul_coe_iff`. Also record that for `addOrderOf a = 0` every nonempty
closed set invariant under `(a + ·)` is the whole circle, so that the `IsMinimal` vocabulary of
`Dynamics/Minimal.lean` is available without choosing an `AddAction ℤ` instance (Einsiedler–Ward
§1.1: minimality of an irrational rotation).

For `q : ℚ` and `a = ((q * p : ℝ) : AddCircle p)`, Mathlib gives the group-theoretic half:
`addOrderOf a = q.den` (`AddCircle.addOrderOf_coe_rat`), the `ℕ`-orbit equals the `ℤ`-orbit as
sets (`IsOfFinAddOrder.multiples_eq_zmultiples`), `n • a = m • a ↔ n ≡ m [MOD addOrderOf a]`
(`nsmul_eq_nsmul_iff_modEq`), and `Nat.card (zmultiples a) = addOrderOf a` (`Nat.card_zmultiples`).
Consume these and prove what is specific to the circle: the orbit is the `q.den`-torsion
`(AddCircle p)[q.den]`, by Tau Ceti's `AddCircle.eq_torsionBy_of_natCard_eq` applied to
`zmultiples a`, whose `Nat.card` is `q.den`; hence

- `Rotation.ncard_range_nsmul_coe_rat : (Set.range (· • a : ℕ → AddCircle p)).ncard = q.den`,
  through `Nat.card_zmultiples` and `AddSubmonoid.coe_multiples`-style bridges between the range
  of `(· • a)` and `AddSubmonoid.multiples a`. This is the statement "the polyrhythm resolves
  after `q.den` beats" (Einsiedler–Ward §1.1).

Package the dense and finite cases as the rhythmic dichotomy

- `Rotation.denseRange_nsmul_xor_finite_range : Xor (DenseRange (· • a : ℕ → _)) (Set.range (· • a : ℕ → _)).Finite`,

so the two cases are stated as exclusive; the finite case is `IsOfFinAddOrder.finite_multiples`
with `AddCircle.isOfFinAddOrder_iff_exists_rat_eq_div`. This is the first exercised consumer of
the layer. *Needs:* Mathlib `denseRange_zsmul_iff_nsmul`, `AddCircle.denseRange_zsmul_iff`,
`AddCircle.addOrderOf_coe_rat`, `IsOfFinAddOrder.finite_multiples`.

**Checks.**

- `n • ((1/2 : ℝ) : UnitAddCircle) = m • ((1/2 : ℝ) : UnitAddCircle) ↔ n ≡ m [MOD 2]`, the orbit
  of `1/2` has exactly `2` points and is not dense.
- The orbit of `((√2 : ℝ) : UnitAddCircle)` is dense and infinite.
- For `q = 0` the orbit is the single point `0`, with `(0 : ℚ).den = 1`; it is finite and not
  dense.

### Examples

- The beats of period `3/2` against a cycle of length `1` hit the two points `0` and `1/2`.
- The golden pulse `φ` visits every arc of the circle, and no point twice.

### Dependencies

Mathlib density of the `ℤ`-orbit and `denseRange_zsmul_iff_nsmul`; the order of a rational
point; the finite multiples of a finite-order element.

## Layer 2: equidistribution of the orbit

Suggested home: `TauCeti/Dynamics/Rotation/Equidistribution.lean`. Names live in the namespace
`Rotation`.

Fix `T : ℝ` with `[Fact (0 < T)]`. The notion of an equidistributed sequence, Weyl's criterion and
the equidistribution of `n • α + β` are ProbabilisticAndMetricNumberTheory §§2.1, 2.4 and 2.5,
on `UnitAddCircle` and `UnitAddTorus d`; this layer adds the statement about a circle of
arbitrary period that those sections do not make.

### 2.1 Empirical measures of an orbit

For `x₀ a : AddCircle T` and `N : ℕ`, Tau Ceti's empirical measure of the sequence
`n ↦ x₀ + n • a` equals Mathlib's empirical measure of the map `(a + ·)` at `x₀`; this is one
`simp` and is not a target. Both sides average `N + 1` Dirac masses, and `(a + ·)^[k] x₀ = x₀ + k • a`. This makes
`MeasureTheory.integral_empiricalMeasure_eq_birkhoffaverage` available on orbits, so that
equidistribution of the orbit reads as convergence of the Birkhoff averages
`birkhoffAverage ℂ (a + ·) f N x₀`. *Needs:* Tau Ceti `TauCeti.Probability.empiricalMeasure`;
Mathlib `MeasureTheory.empiricalMeasure`.

**Checks.**

- `N = 0`: both sides are the Dirac mass at `x₀`.
- `a = 0`: both sides are the Dirac mass at `x₀` for every `N`.

### 2.2 Equidistribution on a circle of any period

Prove

- `Rotation.tendsto_empiricalMeasure_nsmul : addOrderOf a = 0 → Tendsto (TauCeti.Probability.empiricalMeasure (fun n ↦ n • a)) atTop (𝓝 haarAddCircle.toProbabilityMeasure)`

for `a : AddCircle T`, by transferring ProbabilisticAndMetricNumberTheory §2.5
`linear_equidistribution_tfae` at `d = Unit`, `β = 0`, whose hypothesis is equivalent to
`addOrderOf a = 0` by §2.3. The transfer runs along the homeomorphism
`AddCircle T ≃ₜ (Unit → UnitAddCircle)` that rescales by `T`; it is additive and carries
`haarAddCircle` to `torusHaar Unit`. Weak convergence is carried by the push-forward because the
homeomorphism is continuous. *Needs:* ProbabilisticAndMetricNumberTheory §§2.1, 2.3 and
2.5 (Kuipers–Niederreiter Ch. 1 §2: Weyl's theorem on the equidistribution of `nα`); §2.1 of this
layer.

**Checks.**

- `a = 0` has `addOrderOf a = 1 ≠ 0` and the empirical measures are Dirac at `0`, which do not
  converge to Haar.
- `T = 1`: the statement is §2.5 at `d = Unit`, and `a = (√2 : UnitAddCircle)` has
  infinite order because `√2` is irrational.
- `T = 2π`, `a = ((2π√2 : ℝ) : AddCircle (2π))`: infinite order, and the statement is the same as
  for `T = 1` after rescaling.

### Examples

- For `a = (√2 : UnitAddCircle)` the proportion of the first `N` beats in `[u, v)` tends to
  `v − u`; this is §2.5's frequency statement and is not restated.
- The orbit of `1/2` is not equidistributed (Check of §1.1), although its Weyl sums vanish for
  every odd frequency.

### Dependencies

Tau Ceti empirical measures; ProbabilisticAndMetricNumberTheory §§2.1, 2.4 and 2.5.

## Layer 3: convergents, best approximations and Hurwitz

Suggested home: `TauCeti/NumberTheory/ContinuedFractions/Real.lean`, `…/BestApprox.lean`,
`…/Hurwitz.lean`, `…/GoldenRatio.lean`. Names live in the namespace `ContFrac`.

Fix `ξ : ℝ` and write `cf ξ := GenContFract.of ξ`.

### 3.1 Integer data

Define `ContFrac.convNum ξ n : ℤ := (Real.convergent ξ n).num` and
`ContFrac.convDen ξ n : ℕ := (Real.convergent ξ n).den`. Tau Ceti's `Real.num_convergent` and `Real.den_convergent` identify their casts with
`(cf ξ).nums n` and `(cf ξ).dens n`; they apply to `convNum` and `convDen` by unfolding. Build the
API around the definition:

- the recurrences `qₙ₊₂ = aₙ₊₂ qₙ₊₁ + qₙ` and `pₙ₊₂ = aₙ₊₂ pₙ₊₁ + pₙ` with `aₙ₊₂ : ℕ` the partial
  denominator (`GenContFract.nums_recurrence`, `GenContFract.dens_recurrence`,
  `GenContFract.exists_int_eq_of_partDen`), with the proviso `¬ (cf ξ).TerminatedAt n` where the
  recurrence needs the `(n + 1)`-st partial denominator to exist; for irrational `ξ` the proviso
  is discharged by Tau Ceti's `Irrational.not_of_terminatedAt`;
- positivity of `qₙ`, and monotonicity of `qₙ` by Tau Ceti's `Real.monotone_den_convergent`; strict
  monotonicity of `qₙ` from index `1` needs `aₙ ≥ 1`, `GenContFract.of_one_le_get?_partDen`;
- the Fibonacci lower bound `Nat.fib (n + 1) ≤ qₙ` for irrational `ξ` is Tau Ceti's
  `Real.fib_succ_le_den_convergent`, consumed, not a target;
- `pₙ` and `qₙ` are coprime, and `pₙ qₙ₊₁ − pₙ₊₁ qₙ = (−1)ⁿ⁺¹`, from
  `GenContFract.determinant`;
- the convergent is the reduced fraction, `Real.convergent ξ n = pₙ / qₙ`, which is the
  definition read in the other direction (Hardy–Wright Theorems 149 and 150: the recurrences and the
determinant).

The cast identities, positivity, monotonicity and coprimality hold for every `ξ`. Strict
monotonicity from index `1`, the determinant identity at `n` and the Fibonacci bound need
`¬ (cf ξ).TerminatedAt n`, which holds for every `n` when `ξ` is irrational. *Needs:* Mathlib `Real.convergent`, `Real.convs_eq_convergent`,
`GenContFract.determinant`, `GenContFract.dens_recurrence`.

**Checks.**

- `ContFrac.convDen (√2) n` is `1, 2, 5, 12, …`: `convDen √2 2 = 5` and `convNum √2 2 = 7`.
- `ξ = 1/2`: `convDen ξ 0 = 1`, `convDen ξ 1 = 2`, `convDen ξ 2 = 2` (the expansion
  terminates), so strict monotonicity and the Fibonacci bound `fib 4 = 3 ≤ convDen ξ 3 = 2` fail
  without irrationality.

### 3.2 Signed error and alternation

`ContFrac.convErr ξ n = qₙ ξ − pₙ`. For irrational `ξ`, prove

- `ContFrac.convErr_pos_iff : 0 < convErr ξ n ↔ Even n`: the convergents alternate around `ξ`;
- `ContFrac.abs_convErr_succ_lt : |convErr ξ (n + 1)| < |convErr ξ n|`;
- `ContFrac.abs_convErr_lt_inv_convDen_succ : |convErr ξ n| < 1 / convDen ξ (n + 1)`.

Both inequalities need irrationality and are proved through the complete quotient
`ξₙ₊₁ = [aₙ₊₁; aₙ₊₂, …]`: one has `|qₙ ξ − pₙ| = 1 / (ξₙ₊₁ qₙ + qₙ₋₁)` and
`|convErr ξ (n + 1)| = |convErr ξ n| / ξₙ₊₂`, and for irrational `ξ` the complete quotient
satisfies `ξₙ₊₁ > aₙ₊₁ ≥ 1`. The first gives `|convErr ξ n| < 1/(aₙ₊₁ qₙ + qₙ₋₁) = 1/qₙ₊₁`, the
second, with `ξₙ₊₂ > 1`, the decrease. `GenContFract.abs_sub_convs_le` gives only the non-strict inequality, so it
is not enough for the strict bound. The lower bound
`1 / (convDen ξ n + convDen ξ (n + 1)) < |convErr ξ n|` is **not** restated here: it is
DiophantineApproximationAndTranscendence §0.5, and consumers cite it there. *Needs:* §3.1;
`GenContFract.sub_convs_eq`, `GenContFract.of_convergence` (Hardy–Wright Theorems 170–172).

**Checks.**

- `ξ = √2`: `convErr ξ 0 = √2 − 1 > 0` and `convErr ξ 1 = 2√2 − 3 < 0`, with
  `|convErr ξ 1| = 0.1716… < 0.4142… = |convErr ξ 0|`.
- Negative control, `ξ = 1/2`, `n = 0`: `convErr ξ 0 = 1/2` and `convDen ξ 1 = 2`, so the bound
  `|convErr ξ 0| < 1/convDen ξ 1` reads `1/2 < 1/2`, which is false; at `n = 1` the decrease reads
  `0 < 0`. The irrationality hypothesis cannot be dropped from either inequality.

### 3.3 Best approximation (Lagrange)

Prove, for irrational `ξ` and every `n ≥ 0`, with `q` natural and `0 < q < convDen ξ (n + 1)`,

- `ContFrac.abs_convErr_le_norm_of_lt_convDen_succ : |convErr ξ n| ≤ ‖((q * ξ : ℝ) : UnitAddCircle)‖`.

At `n = 0` this is elementary: `|convErr ξ 0| = Int.fract ξ =: f`, and for `0 < q < a₁` one has
`q f ≥ f` and `1 − q f ≥ f` because `(q + 1) f ≤ a₁ f ≤ 1`. The inequality is strict for
`q ≠ convDen ξ n`. The characterization of the convergent denominators is

- `ContFrac.isBestApprox_iff : 0 < q → ((∀ q', 0 < q' → q' < q → ‖(q * ξ)‖ < ‖(q' * ξ)‖) ↔ ∃ n, convDen ξ n = q)`

for irrational `ξ`, with `n ≥ 0` and no separate case: when `a₁ = 1` we have `q₀ = q₁ = 1`, and
`q = 1` is a best approximation vacuously, being `convDen ξ 0`. Use `Real.exists_rat_eq_convergent`
(Legendre) for one direction and the determinant identity for the other. Derive that a
denominator whose `‖q ξ‖` beats every smaller denominator is a convergent denominator.
*Needs:* §§3.1 and 3.2; Mathlib `Real.exists_rat_eq_convergent`, `GenContFract.determinant`
(Hardy–Wright Theorem 181; Khinchin §§6, 9, 16).

**Checks.**

- `ξ = √2`: `‖3√2‖ = 0.2426… > ‖2√2‖ = 0.1716…`, so `q = 3` is not a best approximation, and the
  best approximations are `1, 2, 5, 12, …`.
- Negative control: `q = 1` is a best approximation of every irrational `ξ`, and `1 = convDen ξ 0`;
  for `ξ = √2` (where `a₁ = 2`) this shows that restricting the characterization to `n ≥ 1` would
  exclude a best approximation.
- `ξ = (1 + √5)/2`, where `a₁ = 1`: `q₀ = q₁ = 1`, and the best approximations are `1, 2, 3, 5, 8, …`.

### 3.4 Hurwitz

Hurwitz's infinitude theorem is in Mathlib:
`Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational` says that for irrational
`ξ` the set `{t : ℚ | |ξ − t| < 1 / (√5 * t.den ^ 2)}` is infinite. It is consumed, not a target.
The target is the convergent form: for irrational `ξ` and every `n`, one of `k ∈ {n, n + 1, n + 2}`
has

- `ContFrac.exists_convDen_mul_abs_convErr_lt_inv_sqrt_five : convDen ξ k * |convErr ξ k| < 1 / √5`

(Hardy–Wright Theorems 193–195; Khinchin §19), which records which rationals Hurwitz's theorem
produces, namely convergents, three consecutive ones at a time. Prove the sharpness

- `ContFrac.finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt : √5 < c → {q : ℚ | |φ − q| < 1 / (c * q.den ^ 2)}.Finite`

and the limit `qₙ |convErr φ n| → 1/√5` along the convergents of `φ`, which with Legendre shows
that `√5` cannot be improved for `φ`. The sharpness uses the explicit continued fraction of `φ`
of §3.5 and `Real.fib_succ_sub_goldenRatio_mul_fib`. The sharpness at `φ` is not in Mathlib.
*Needs:* §§3.2 and 3.5; Mathlib `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational`
(Hardy–Wright Theorems 193–195).

**Checks.**

- `ξ = √2`: `5 |5√2 − 7| = 0.3553… < 1/√5 = 0.4472…` at `n = 2`, and `5√2 − 7 = 0.0711… < 1/12`.
- `ξ = φ`: `5 |5φ − 8| = 0.4508… < 0.5` and the products `qₖ |convErr φ k|` for `k = 0, …, 5` are
  `0.618…, 0.382…, 0.472…, 0.438…, 0.451…, 0.446…`, each at least `0.38` and tending to `0.4472…`.
- Strictness of `√5 < c` in the sharpness: at `c = √5` the products `qₖ |convErr φ k|` for odd `k`
  are below `1/√5` (at `k = 5` the value is `0.4458…`), so the set is infinite, as Hurwitz's
  theorem requires.

### 3.5 The golden ratio

Prove that the continued fraction of `φ` is `[1; 1, 1, …]`,
`ContFrac.goldenRatio_partDens : ∀ n, (cf φ).partDens.get? n = some 1`, and
`(cf φ).h = 1` (from `Real.goldenRatio_sq`, `Real.inv_goldenRatio`, `GenContFract.of_s_succ`,
`GenContFract.of_h_eq_floor`); that the convergent denominators are Fibonacci numbers,
`ContFrac.convDen_goldenRatio : convDen φ n = Nat.fib (n + 1)`, and the numerators
`convNum φ n = Nat.fib (n + 2)` (`Nat.fib_add_two`); the exact error
`ContFrac.convErr_goldenRatio : convErr φ n = −(ψ ^ (n + 1))` (`Real.fib_succ_sub_goldenRatio_mul_fib`;
`convErr` is the negative of that lemma's left-hand side, hence the sign), so that
`|convErr φ n| = φ ^ (−(n + 1))`; and `(Nat.fib (n + 1) : ℝ) / Nat.fib n → φ`, as the consumer
of `GenContFract.of_convergence` (Hardy–Wright Theorems 193–195). *Needs:* §3.1.

**Checks.**

- `convDen φ 4 = 5`, `convNum φ 4 = 8`, and `5 |5φ − 8| < 1/2`.
- `convErr φ 0 = φ − 1 = −ψ` and `convErr φ 1 = φ − 2 = −ψ²`.

### Examples

- Lagrange's characterization on `√2`: `1, 2, 5, 12, 29, …` are the best approximations.
- The extremality of `φ`: the products `qₖ |convErr φ k|` approach `1/√5` from both sides, and no
  irrational does better than `1/√5` infinitely often.

### Dependencies

Mathlib continued fractions, `Real.convergent`, Legendre's theorem, Hurwitz's theorem and the
golden ratio; DiophantineApproximationAndTranscendence §0.5 for the lower bound on the error.

## Layer 4: the three-gap theorem

Suggested home: `TauCeti/Dynamics/Rotation/ThreeGap.lean`,
`TauCeti/Dynamics/Rotation/ThreeGapContFract.lean`. Names live in the namespace `Rotation`.

Fix `α : ℝ` and `N : ℕ`.

### 4.1 The point set and its gaps

Define `Rotation.orbitFract α N : Finset ℝ := (range N).image (fun n ↦ Int.fract (n * α))`. Its
API: it lies in `Set.Ico 0 1`; it contains `0` for `N ≥ 1`; for irrational `α` its card is `N`
(`Int.fract_eq_fract` and `Irrational.ne_rat`); for `α = (q : ℚ)` its card is `min N q.den`.

Define `Rotation.gaps α N : Multiset ℝ` as the multiset of successive differences of the sorted
points (`Finset.sort`), with the wrap-around gap `1 − max`: with `s` the sorted list, it is
`zipWith (· − ·) (s.tail ++ [1]) s`. The API: the gaps sum to `1` for `N ≥ 1`; their number is
`(orbitFract α N).card`; every gap is positive. Pin: the gap *from* the point `y` is the distance
to the next point counterclockwise, with the last point's gap reaching `1`, so that on
`UnitAddCircle` (through `AddCircle.coe_fract`) the gaps are the arcs between consecutive orbit
points. Define the two return lengths `Rotation.etaPos α N := sInf ↑((orbitFract α N).erase 0)`
(the least positive point, written `η⁺`) and `Rotation.etaNeg α N := 1 − sSup ↑(orbitFract α N)`
(the wrap-around gap, written `η⁻`); both are meaningful when the orbit has at least two points,
and both occur as gaps then. *Needs:* Mathlib `Finset.sort`, `Int.fract_eq_fract`,
`Irrational.ne_rat`.

**Checks.**

- `α = 1/3`, `N = 5`: `orbitFract` has card `3` and `gaps` is `{1/3, 1/3, 1/3}`; the card is
  `min 5 3`.
- `N = 1`: the single point `0`, one gap of length `1`.
- `N = 0`: no points, no gaps.
- `α = √2`, `N = 3`: `η⁺ = √2 − 1` and `η⁻ = 3 − 2√2`; without `erase 0` the infimum would be `0`.

### 4.2 Three gaps, uniform in `α`

Prove

- `Rotation.gaps_toFinset_subset : 2 ≤ (orbitFract α N).card → (gaps α N).toFinset ⊆ {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N}`

for every real `α`; this is the statement the two headline theorems are read off from. From it,
`Rotation.card_toFinset_gaps_le_three : (gaps α N).toFinset.card ≤ 3` for every real `α` and
every `N` (`Finset.card_le_three`); and when exactly three lengths occur they are
`η⁺`, `η⁻` and `η⁺ + η⁻`. The proof pattern is the first-return argument (Liang): the gap from
`Int.fract (n α)` to its successor is `Int.fract ((m − n) α)` for the index `m` of the successor
(`Int.fract_fract_sub_fract`), and the successor index differs from `n` by one of two fixed return
times, except on the last stretch where it is the sum. Handle rational `α` (where points coincide)
without a case split, by working with the card of `orbitFract` rather than with `N` (Alessandri–Berthé §3;
Liang, *A short proof of the 3d distance theorem*). *Needs:* §4.1; Mathlib
`Int.fract_fract_sub_fract`, `Finset.card_le_three`.

**Checks.**

- `α = 2/5`, `N = 4`: the points are `0, 2/5, 4/5, 1/5`, the gaps are `{1/5, 1/5, 2/5, 1/5}`, and
  the set of lengths `{1/5, 2/5}` is inside `{η⁺, η⁻, η⁺ + η⁻} = {1/5, 1/5, 2/5}`.
- `α = 0`, `N = 3`: one point, `2 ≤ card` fails, and the statement is silent; `card_toFinset_gaps_le_three`
  still holds with a single gap length `1`.

### 4.3 Multiplicities

For irrational `α` and `N ≥ 2` define the return indices `r⁺` and `r⁻`: the unique (by the card
of `orbitFract`) indices `< N` with `Int.fract (r⁺ * α) = etaPos α N` and
`Int.fract (r⁻ * α) = 1 − etaNeg α N`. Prove that the gap `η⁺`
occurs `N − r⁺` times, `η⁻` occurs `N − r⁻` times, and `η⁺ + η⁻` occurs `r⁺ + r⁻ − N` times
(`Multiset.count`) (Alessandri–Berthé, §3, *Three distance theorem*, p. 12 of the authors' copy,
the three counts, with the returns of §4.4). *Needs:* §4.2.

**Checks.**

- `α = √2`, `N = 3`: `r⁺ = 1` and `r⁻ = 2`, so `η⁺ = √2 − 1` occurs twice, `η⁻ = 3 − 2√2` once and
  the sum `2 − √2` zero times.
- `α = φ`, `N = 4`: the returns are `{3, 2}`, so `r⁺ + r⁻ − N = 1` and all three lengths occur,
  `φ⁻³` twice, `φ⁻²` once and `φ⁻⁴` once.

### 4.4 Gap lengths from the continued fraction

For irrational `α` and `N ≥ 2`, let `k` be the index with `convDen α k < N ≤ convDen α (k + 1)`
(it exists and is unique by the strict monotonicity of §3.1 and `convDen α 0 = 1`), and let
`m := (N − 1 − convDen α (k − 1)) / convDen α k` (natural-number division). For `k = 0` the index
`k − 1` refers to the conventional `q₋₁ = 0`, `p₋₁ = 1`, so read `convDen α (k − 1)` as `0` and
`|convErr α (k − 1)|` as `1`; state the `k = 0` case as its own theorem rather than through a
shifted index, and state the `k ≥ 1` case with the index written `k + 1`:

- `Rotation.gaps_toFinset_subset_of_convDen_lt : convDen α (k + 1) < N → N ≤ convDen α (k + 2) → (gaps α N).toFinset ⊆ {e₁, e₀ − m e₁, e₀ − m e₁ + e₁}`

with `e₁ = |convErr α (k + 1)|`, `e₀ = |convErr α k|` and `m = (N − 1 − convDen α k)/convDen α (k + 1)`:
the gap lengths are among `|qₖ₊₁ α − pₖ₊₁|`, `|qₖ α − pₖ| − m |qₖ₊₁ α − pₖ₊₁|` and their sum. The
first two are `η⁺` and `η⁻` in the order fixed by the parity of `k` (`ContFrac.convErr_pos_iff`),
and the returns satisfy `{r⁺, r⁻} = {convDen α k, convDen α (k − 1) + m convDen α k}`. The
positivity of the second length comes from `|convErr α (k − 1)| = aₖ₊₁ |convErr α k| + |convErr α (k + 1)|`
and `m ≤ aₖ₊₁ − 1`, which follows from `N ≤ convDen α (k + 1)` and the recurrence. When
`N = convDen α (k + 1)` then `m = aₖ₊₁ − 1`, the third multiplicity `r⁺ + r⁻ − N` is `0`, and there
are exactly two gap lengths, `|convErr α k|` (occurring `convDen α (k + 1) − convDen α k` times)
and `|convErr α k| + |convErr α (k + 1)|` (occurring `convDen α k` times).

*Source.* Alessandri–Berthé, §3, the *Three distance theorem* (unnumbered), pp. 11–12 of the
authors' copy: for `0 < α < 1`, writing `n = m qₖ + qₖ₋₁ + r` with `1 ≤ m ≤ cₖ₊₁` (`cₖ₊₁` the
partial quotient) and `0 ≤ r < qₖ`, the `n + 1` points have the gap lengths `ηₖ`,
`ηₖ₋₁ − m ηₖ` and their sum `ηₖ₋₁ − (m − 1) ηₖ`, where `ηₖ = ‖qₖ α‖ = |qₖ α − pₖ|`.
Reindexing: this roadmap's `N` is the source's `n + 1`. The range `qₖ < N ≤ qₖ₊₁`, that is
`qₖ ≤ n < qₖ₊₁`, merges the top of the source's index-`(k − 1)` range (`n < qₖ + qₖ₋₁`), where
this roadmap's `m` is `0`, with the source's index-`k` range, where the two `m` agree. The
extension to every real `α` holds because the gaps and the errors `|qₖ α − pₖ|` are unchanged by
integer translation of `α`. *Needs:* §§3.1–3.3, 4.2 and 4.3; DiophantineApproximationAndTranscendence
§0.5 is not needed.

**Checks.**

- `α = √2`, `N = 3`: the points are `0, √2 − 1, 2√2 − 2`, the gaps are `√2 − 1, √2 − 1, 3 − 2√2`.
  With `convDen √2 0 = 1`, `convDen √2 1 = 2`, `convErr √2 0 = √2 − 1` and `convErr √2 1 = 2√2 − 3`,
  `N = 3` gives `k = 1`, `m = (3 − 1 − 1)/2 = 0`, returns `{2, 1}`, lengths `|convErr √2 1| = 3 − 2√2`
  and `|convErr √2 0| = √2 − 1`; the sum `2 − √2` does not occur because `r⁺ + r⁻ − N = 0`.
- The case `k = 0`: for `N = 2` and `α = √2`, the lengths are among `f`, `1 − (N − 1) f`,
  `1 − (N − 2) f` with `f = Int.fract √2`.
- `α = φ`, `N = 4`: the sorted points are `0, φ⁻³, φ⁻¹, 1 − φ⁻⁴`, the gaps are
  `φ⁻³, φ⁻², φ⁻³, φ⁻⁴`, three lengths with `max/min = φ²`; `k = 3`, `m = 0`, returns `{3, 2}`.
- `α = φ`, `N = 5 = convDen φ 4`: exactly two gap lengths, `φ⁻³` three times and `φ⁻⁴` twice.

### 4.5 The golden rotation

Prove that for `α = φ` every gap length is `φ ^ (−j)` for some natural `j`, and that the lengths
present at any `N ≥ 2` are among three consecutive powers `φ^{−(j+2)}, φ^{−(j+1)}, φ^{−j}`; hence

- `Rotation.gaps_goldenRatio_le_sq_mul : ∀ s ∈ gaps φ N, ∀ t ∈ gaps φ N, s ≤ φ ^ 2 * t`

for every `N ≥ 1`. This is the roadmap's precise form of "the golden rhythm is the most even":
it consumes `ContFrac.convErr_goldenRatio` from §3.5 and the theorem of §4.4 with `aₖ₊₁ = 1`, so
`m = 0` and the lengths are `|convErr φ k| = φ^{−(k+1)}`, `|convErr φ (k − 1)| = φ^{−k}` and
their sum `φ^{−(k−1)}` (corollary of §§3.5 and 4.4). *Needs:* §§3.5 and 4.4.

**Checks.**

- `N = 1`: the single gap is `1 ≤ φ² · 1`.
- Equality: for `N = 4` the largest gap `φ⁻²` and the smallest `φ⁻⁴` have ratio exactly `φ²`.

### Examples

- `α = 1/3`, `N = 5`: three points, one gap length `1/3`.
- `α = √2`, `N = 3`: gap lengths `√2 − 1` (twice) and `3 − 2√2`.
- `α = φ`: at `N = Fₖ ≥ 2` two gap lengths, at `N = 1` one, at every other `N` three, all powers of `φ⁻¹`.

### Dependencies

Mathlib `Int.fract` and `Finset.sort`; Layer 3 for the continued-fraction identification and the
golden rotation.

## Downstream consumers

No roadmap consumes this one. Layer 3 is stated on Mathlib's `Real.convergent`, the carrier of
Tau Ceti's `Real.den_convergent`, so later roadmaps use it without conversion. Layer 4 is the
finite-`N` structure of the point set whose limit is ProbabilisticAndMetricNumberTheory §2.5.

## References

- L. Kuipers and H. Niederreiter, *Uniform Distribution of Sequences*, Wiley 1974, Ch. 1 §§1–2
  (Weyl's criterion, `nα`).
- A. Ya. Khinchin, *Continued Fractions*, Dover, §§4–6 (convergents, best approximations), §16
  (Lagrange) and §19 (Hurwitz and `√5`).
- G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Ch. X–XI
  (Theorem 181: convergents as best approximations; Theorems 193–195: Hurwitz and the golden
  ratio).
- V. T. Sós, *On the distribution mod 1 of the sequence nα*, Ann. Univ. Sci. Budapest 1 (1958)
  127–134; and N. B. Slater, *Gaps and steps for the sequence nθ mod 1*, Proc. Cambridge Philos.
  Soc. 63 (1967) 1115–1123 (the three-gap theorem with multiplicities through convergents).
- P. Alessandri and V. Berthé, *Three distance theorems and combinatorics on words*,
  Enseign. Math. 44 (1998) 103–132 (survey; §3, the unnumbered *Three distance theorem*, is
  Layer 4's gap-length statement, read in the authors' copy; Theorem 1 there concerns
  `lim inf` and `lim sup` of `n hₙ` and `n Hₙ`).
- F. M. Liang, *A short proof of the 3d distance theorem*, Discrete Math. 28 (1979) 325–326.
- H. Weyl, *Über die Gleichverteilung von Zahlen mod. Eins*, Math. Ann. 77 (1916) 313–352.
- M. Einsiedler and T. Ward, *Ergodic Theory with a view towards Number Theory*, GTM 259,
  §§1.1, 2.1, 4.4 (circle rotation, unique ergodicity, Weyl).
- An existing Lean formalization of the three-gap theorem, uniform in `α`, by D. Kunert
  (`dkunert/three-gap-theorem-lean`, MIT), whose statement shape Layer 4 follows (uniform in `α`,
  `Int.fract`, a multiset of gaps) because it is the stronger theorem.
