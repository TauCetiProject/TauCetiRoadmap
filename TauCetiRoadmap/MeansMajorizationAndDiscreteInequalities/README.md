# Roadmap: Means, majorization and discrete inequalities

**Summary.** This roadmap builds the classical theory of means and of the inequalities that
compare them, organised around one idea: most of these inequalities are statements that some
functional is monotone along an order on vectors or on laws, and the orders are majorization of
finite vectors and the convex order of probability laws on `ℝ`. It owns weighted power means and
their comparison, quasi-arithmetic means and the characterisation of their comparisons and of the
homogeneous ones, the logarithmic mean with Lin's sharp bound, the equality case of Jensen's
inequality, the Jensen–Steffensen inequality with signed weights, Hermite–Hadamard, Kantorovich,
weighted Chebyshev and Grüss, Bergström's equality case, the reverse Minkowski inequality, the
generalized Hölder inequality with extended exponents and the equality cases of Hölder and
Minkowski. It then owns majorization of real vectors on an arbitrary finite index type, the
Hardy–Littlewood–Pólya theorem in both directions, Karamata's inequality with its equality case,
the Tomić–Weyl theory of weak majorization including doubly substochastic matrices, the doubly
stochastic contraction of permutation-invariant seminorms, the Schur–Ostrowski criterion,
Muirhead's theorem with its converse, Schur's inequality, Schur-concavity and the maximum of
Shannon entropy, the convex order on `ℝ` through the stop-loss transform, its identification with
majorization on empirical laws, and the log-sum inequality with its equality case.

The sources are Hardy, Littlewood and Pólya (*Inequalities*), Marshall, Olkin and Arnold
(*Inequalities: Theory of Majorization and Its Applications*), Bullen (*Handbook of Means and
Their Inequalities*), Mitrinović (*Analytic Inequalities*), Mitrinović, Pečarić and Fink
(*Classical and New Inequalities in Analysis*), Niculescu and Persson (*Convex Functions and Their
Applications*) and Shaked and Shanthikumar (*Stochastic Orders*). No layer follows the
organisation of any one of them: the layers follow proof dependency, from one-variable convexity
through finite and integral inequalities to the two orders and their test functions.

## Scope and ownership

The roadmap is complete when every target below is a theorem of the TauCeti namespace with the
hypotheses stated here, every owned definition has the API its Checks name, and every statement
in `Suggested.lean` is proved. The headlines with a Lean name are stated in `Suggested.lean`, each
with every conclusion this README attaches to it; that file is not an exhaustive acceptance test,
and the other headlines here are targets of the same standing, stated in prose.

Owned here:

- weighted power means `powerMean`, their monotonicity, strictness, continuity and limits, and the
  log-convexity of moments in finite and integral form;
- quasi-arithmetic means `quasiArithMean`: internality, comparison, equivalence and the
  homogeneous ones;
- the logarithmic mean `logMean`: integral representation, the chain of Lin's bounds and its
  sharpness;
- the equality case of Jensen's inequality, Jensen–Steffensen, Hermite–Hadamard with its equality
  cases, Kantorovich in measure and finite form;
- weighted Chebyshev and Grüss, Bergström's equality case, reverse Minkowski, generalized Hölder
  with extended exponents, the equality cases of Hölder and Minkowski;
- majorization `Majorizes`, the largest-subset-sum functional `maxSubsetSum`, weak majorization
  `WeaklyMajorizes`, doubly substochastic matrices `doublySubstochastic`, and the theorems of
  Layer 4;
- Schur-convexity `SchurConvexOn`, the Muirhead sum `muirheadSum`, Shannon entropy `entropy` of a
  real vector, and the theorems of Layer 5;
- the convex order `ConvexOrderLE` on laws on `ℝ` and the theorems of Layer 6.

**Not owned here.**

- The roadmap OperatorTheory/Majorization owns, in its Part A (labels MAJ-A01 to MAJ-A40),
  prefix sums, weak majorization of antitone nonnegative tuples, Robin Hood transfers and
  T-transforms, symmetric-convex sets, symmetric gauges, transfer descent, gauge monotonicity,
  the forward Schur–Horn theorem and Ky Fan sums. All of it is implemented in Tau Ceti and is
  consumed here through the declarations listed under the supplier contracts; none of it is
  restated as a target.
- The roadmap MathematicalStatisticsFoundations owns, in its §7.5, Strassen's theorem for laws
  carried by a compact convex subset of `ℝ^d` (a Markov kernel with barycentre the identity
  carrying one law to the other). The martingale-coupling characterisation of the convex order
  is consumed from there and is not restated.
- The roadmap ComplexHessianEquations owns, in its §2.1, elementary symmetric functions with the
  Newton inequalities for all real tuples and the Maclaurin inequalities on the Gårding cones,
  whose closure contains the nonnegative orthant. The normalised Newton and Maclaurin
  inequalities are consumed from there.
- Integral inequalities of Hardy, Hilbert and Carleman type, rearrangement of functions and
  symmetrisation are not in this roadmap; see Beyond.

## Conventions

- **Finite index types.** Vectors are functions `ι → ℝ` on a `Fintype` index type; theorems that
  need a total order on positions use `Fin n`. Sums and products over the whole type are written
  with `∑ i` and `∏ i`. Statements valid for an empty type are stated without `Nonempty`; where a
  maximum or minimum of the entries appears, `[Nonempty ι]` is a hypothesis and the extremes are
  `Finset.univ.sup'` and `Finset.univ.inf'`.
- **Weights.** A weight vector `w` is nonnegative with `∑ i, w i = 1` wherever a theorem says so.
  Zero weights are allowed, and a statement about equality refers to the entries of positive
  weight (the support of `w`). Jensen–Steffensen is the only place where weights may be negative.
- **Positivity.** Means are stated for positive data. Real powers are `Real.rpow`; for positive
  bases this is the usual power, so no junk value enters a mean of positive data.
- **Majorization direction.** `Majorizes x y` is `x ≺ y`, read "`x` is majorized by `y`" (so
  `y` is the more spread vector). It is defined, in the shape of the open Mathlib pull request
  #41898, by equal total sums and, for every `i < card ι`, `maxSubsetSum i x ≤ maxSubsetSum i y`,
  where `maxSubsetSum i x` is the largest sum of `i` coordinates of `x`. This is independent of a
  total order on `ι`. On `Fin n` it agrees with the prefix sums of the decreasing rearrangements,
  which is the form used by Tau Ceti and by OperatorTheory/Majorization.
- **Weak majorization.** `WeaklyMajorizes x y` is weak submajorization `x ≺_w y`: the same
  inequalities between largest subset sums and `∑ x ≤ ∑ y`. It is defined for all real vectors,
  not only for antitone nonnegative ones; the bridge to Tau Ceti's `IsWeaklyMajorizedBy` is a
  target.
- **Doubly stochastic matrices** are Mathlib's `doublyStochastic ℝ ι`, a submonoid of
  `Matrix ι ι ℝ`; doubly substochastic matrices are the set `doublySubstochastic ι`.
- **Measures and infinite quantities.** Integral inequalities whose sides can be infinite are
  stated with `∫⁻` in `ℝ≥0∞`, where `⊤ ^ t` and `0 * ⊤ = 0` follow Mathlib. Bochner integrals
  appear only where integrability is a hypothesis or follows from boundedness on a probability
  space. Laws on `ℝ` are measures with `IsProbabilityMeasure`.
- **Logarithms.** `Real.log 0 = 0` in Mathlib. Entropy is written with `Real.negMulLog`, so
  `0 log 0 = 0` is the intended value and not junk. The log-sum inequality requires `b i > 0`,
  so no `log (a / 0)` occurs; zero `a i` contributes `0` through `0 * log 0 = 0`.
- **Partial derivatives.** For `φ : (ι → ℝ) → ℝ` the `i`-th partial derivative at `x` is
  `fderiv ℝ φ x (Pi.single i 1)`.
- **Namespace.** Implementations live in the TauCeti namespace; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.MeansMajorizationAndDiscreteInequalities`.

## Exact supplier contracts

### From Mathlib

Means and finite inequalities:

- `Real.geom_mean_le_arith_mean_weighted`, `Real.geom_mean_eq_arith_mean_weighted_iff_of_pos`,
  `Real.harm_mean_le_geom_mean_weighted` (`Mathlib/Analysis/MeanInequalities.lean`): weighted
  AM–GM with its equality case and HM–GM.
- `Real.rpow_arith_mean_le_arith_mean_rpow`, `Real.arith_mean_le_rpow_mean`
  (`Mathlib/Analysis/MeanInequalitiesPow.lean`): the comparison of `M_1` with `M_p` for `p ≥ 1`.
- `Real.young_inequality`, `Real.young_inequality_eq_iff_of_nonneg`
  (`Mathlib/Analysis/MeanInequalities.lean`): Young's inequality with its equality case.
- `Real.inner_le_Lp_mul_Lq`, `Real.Lp_add_le` (`Mathlib/Analysis/MeanInequalities.lean`): finite
  Hölder and Minkowski.
- `Finset.sum_mul_sq_le_sq_mul_sq`, `Finset.sq_sum_div_le_sum_sq_div`
  (`Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`): Cauchy–Schwarz for sums and the
  Bergström (Sedrakyan) inequality without equality case.
- `norm_inner_le_norm`, `norm_inner_eq_norm_iff`
  (`Mathlib/Analysis/InnerProductSpace/Basic.lean`): Cauchy–Schwarz with its equality case.
- `MonovaryOn.sum_mul_sum_le_card_mul_sum` (`Mathlib/Algebra/Order/Chebyshev.lean`): Chebyshev's
  sum inequality with uniform weights.
- `MonovaryOn.sum_smul_comp_perm_le_sum_smul`, `Monovary.sum_mul_comp_perm_le_sum_mul`
  (`Mathlib/Algebra/Order/Rearrangement.lean`): the rearrangement inequality.

Convexity:

- `ConvexOn.map_sum_le`, `StrictConvexOn.map_sum_eq_iff` (`Mathlib/Analysis/Convex/Jensen.lean`):
  finite Jensen with the strict equality case.
- `ConvexOn.map_integral_le`, `StrictConvexOn.ae_eq_const_or_map_average_lt`
  (`Mathlib/Analysis/Convex/Integral.lean`): integral Jensen and its strict equality case.
- `ConvexOn.slope_mono_adjacent` (`Mathlib/Analysis/Convex/Slope.lean`): monotone slopes, used for
  supporting lines and Hermite–Hadamard.

Integral inequalities:

- `ENNReal.lintegral_mul_le_Lp_mul_Lq`, `ENNReal.lintegral_mul_norm_pow_le`,
  `ENNReal.lintegral_prod_norm_pow_le`, `ENNReal.lintegral_Lp_add_le`,
  `ENNReal.lintegral_Lp_add_le_of_le_one` (`Mathlib/MeasureTheory/Integral/MeanInequalities.lean`):
  Hölder in `∫⁻` form, its weighted product forms for exponents summing to `1`, and Minkowski.
- `MeasureTheory.eLpNorm_smul_le_mul_eLpNorm`, `MeasureTheory.eLpNorm_le_eLpNorm_of_exponent_le`
  (`Mathlib/MeasureTheory/Function/LpSeminorm/CompareExp.lean`): Hölder for a `HolderTriple`
  of extended exponents (`ENNReal.HolderTriple`, `Mathlib/Data/ENNReal/Holder.lean`) and the
  Lyapunov comparison of norms on a probability space.
- `ProbabilityTheory.variance_le_sq_of_bounded` (`Mathlib/Probability/Moments/Variance.lean`):
  Popoviciu's variance bound `Var f ≤ ((b − a)/2)²`.

Doubly stochastic matrices and sorting:

- `doublyStochastic` (`Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean`): the submonoid of
  nonnegative matrices with row and column sums `1`.
- `doublyStochastic_eq_convexHull_permMatrix`, `exists_eq_sum_perm_of_mem_doublyStochastic`,
  `extremePoints_doublyStochastic`, `Matrix.l2_opNorm_le_one_of_mem_doublyStochastic`
  (`Mathlib/Analysis/Convex/Birkhoff.lean`): the Birkhoff–von Neumann theorem, its extreme
  points, and the Euclidean contraction.
- `Tuple.sortDesc`, `Tuple.antitone_sortDesc` (`Mathlib/Data/Fin/Tuple/Sort.lean`): the
  decreasing rearrangement.

Entropy and divergence:

- `Real.negMulLog`, `Real.strictConcaveOn_negMulLog`, `Real.strictConvexOn_mul_log`
  (`Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`).
- `Real.binEntropy_le_log_two` (`Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`): the case
  of two outcomes of the entropy maximum.
- `InformationTheory.klDiv`, `InformationTheory.klDiv_eq_zero_iff`
  (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`) and `InformationTheory.klDiv_map_le`
  (`Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`): the Gibbs inequality with
  its equality case, and data processing.

### From Tau Ceti

- `TauCeti.prefixSum` (`TauCeti/Algebra/BigOperators/Finset/PartialSum.lean`): `prefixSum k x` is
  the sum of the first `min k n` entries of `x : Fin n → M` (MAJ-A01).
- `TauCeti.IsWeaklyMajorizedBy`, `TauCeti.IsWeaklyMajorizedBy.apply_le`, `TauCeti.robinHood`,
  `TauCeti.mem_of_prefixSum_le_of_sum_eq`, `TauCeti.IsSymmetricConvex.mem_of_prefixSum_le`,
  `Seminorm.IsSymmetricGauge`, `Seminorm.isSymmetricGauge_piLp`
  (`TauCeti/Analysis/Convex/Majorization.lean`): weak majorization of antitone nonnegative tuples
  as a structure with prefix-sum field, Robin Hood transfers, transfer closure of
  symmetric-convex sets, and symmetric gauges with the `ℓ^p` examples (MAJ-A02 to MAJ-A17).
- `Matrix.mulVec_mem_convexHull_range_comp_perm`, `TauCeti.mem_convexHull_range_comp_perm_iff`,
  `TauCeti.mem_convexHull_range_comp_perm_iff_of_antitone`
  (`TauCeti/Analysis/Convex/PermutationOrbit.lean`): a doubly stochastic image of `w` lies in the
  convex hull of the permutations of `w`, and Rado's theorem: for antitone `w`, `x` lies in that
  hull exactly when the prefix sums of the decreasing rearrangement of `x` are bounded by those of
  `w` and the totals agree.
- `ConvexOn.sum_map_mulVec_le_of_mem_doublyStochastic`,
  `Monovary.dotProduct_mulVec_le_of_mem_doublyStochastic`
  (`TauCeti/Analysis/Convex/DoublyStochasticMatrix.lean`): for convex `φ` on a convex set
  containing the entries, `∑ φ ((D *ᵥ x) i) ≤ ∑ φ (x i)`, and the rearrangement form for doubly
  stochastic matrices.
- `TauCeti.sub_le_fenchelConjugate` (`TauCeti/Analysis/Convex/Conjugate.lean`): the Fenchel–Young
  inequality.
- `TauCeti.Probability.empiricalFiniteMeasure`,
  `TauCeti.Probability.integral_empiricalFiniteMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`): the uniform empirical law of a finite
  family and its integrals.
- `TauCeti.etvDist_sq_le_two_mul_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`):
  Pinsker's inequality.

### From other roadmaps

- OperatorTheory/Majorization, Part A, labels MAJ-A01 to MAJ-A17: the weak-majorization calculus
  and transfer descent, through the Tau Ceti declarations above. Used in 4.1, 4.4 and 4.5.
- MathematicalStatisticsFoundations §7.5: Strassen's theorem on compact convex sets. Used in the
  remark of 6.1.
- ComplexHessianEquations §2.1: the Newton and Maclaurin inequalities. Used in the remark of 5.2.

### Mathlib pull requests followed

- #41898 (majorization preorder and T-transform decomposition, in the file
  `Mathlib/Analysis/Convex/Majorization.lean` of the PR): the shape of `maxSubsetSum` and
  `Majorizes` here is that of
  the PR, with `ι` an arbitrary `Fintype`, `≺` read as "majorized by", and the descending
  prefix-sum form as a theorem. Implementation uses Mathlib's declarations when they are present
  at the pin, and the targets of Layer 4 then become statements about them.
- #33406 (basics of majorization) is earlier prior art in the same direction.
- #42876 (the Newton and Maclaurin inequalities for normalised elementary symmetric means) and
  #42874 (multiset elementary symmetric functions) concern the material owned by
  ComplexHessianEquations §2.1.

## How to read the build

There are six layers. Layer 1 builds the means. Layer 2 proves the one-variable convexity
inequalities that Layer 1 does not already take from Mathlib, and Layer 3 the inequalities for
sums and integrals. Layer 4 builds majorization and proves the Hardy–Littlewood–Pólya and
Karamata theorems; Layer 5 turns them into theorems about symmetric functions (Schur-convexity,
Muirhead, entropy), and Layer 6 extends the test-function picture from vectors to laws on `ℝ`.

Each subsection states its targets and gives locators into the sources and a proof route; a
target with a Lean name is a declaration in `Suggested.lean`. Each subsection ends with a
*Needs:* line naming what it uses. Locators give the theorem or section number and the printed
page.

## Layer 1: Means

### 1.1 Weighted power means

**Definition.** For weights `w` and positive data `x`, `powerMean w x r` is
`(∑ i, w i * x i ^ r) ^ r⁻¹` for `r ≠ 0` and `∏ i, x i ^ w i` at `r = 0`. The arithmetic,
geometric and harmonic means are `r = 1, 0, −1`.

**Targets.** Let `w ≥ 0` with `∑ w = 1` and `x > 0`.

- **Power-mean inequality** (`powerMean_le_powerMean`): `r ≤ s` implies
  `powerMean w x r ≤ powerMean w x s`. Hardy–Littlewood–Pólya, Thm 16, p. 26; Bullen, Ch. III,
  §3.1.1, Thm 1, p. 203.
- **Strictness** (`powerMean_lt_powerMean_iff`): for `r < s`, the inequality is strict exactly
  when two entries of positive weight differ. Hardy–Littlewood–Pólya, Thm 16, p. 26 (positive
  data, so the exceptional case with a zero entry does not arise).
- **Continuity in the index** (`continuous_powerMean`): `r ↦ powerMean w x r` is continuous on
  `ℝ`, at `0` included. Hardy–Littlewood–Pólya, Thm 3, p. 15, is the limit at `0`.
- **Limits at infinity** (`tendsto_powerMean_atTop_atBot`): for nonempty `ι` and all weights
  positive, the limits at `+∞` and `−∞` are the largest and the smallest entry. With a zero
  weight the limits are the extremes over the support; the target takes positive weights so
  that the statement uses `Finset.univ.sup'`.
- **Internality and homogeneity** (prose target): `powerMean w x r` lies between the smallest
  and largest entry of positive weight, and `powerMean w (k • x) r = k * powerMean w x r` for
  `k > 0`.

**Proof route.**

- For `0 < r < s`, `t ↦ t ^ (s / r)` is convex on `[0, ∞)` (`convexOn_rpow`, via
  `ConvexOn.map_sum_le` applied to the values `x i ^ r`), then take `s`-th roots. The cases
  with `r < 0` follow by applying the positive case to `x⁻¹`, since
  `powerMean w x⁻¹ (−r) = (powerMean w x r)⁻¹`. The cases with `0` among `r, s` are
  weighted AM–GM applied to `x ^ s` (`Real.geom_mean_le_arith_mean_weighted`).
- Strictness uses `StrictConvexOn.map_sum_eq_iff` and
  `Real.geom_mean_eq_arith_mean_weighted_iff_of_pos` in the same three cases.
- Continuity at `0`: `log (∑ w x ^ r) / r → ∑ w log x` by the derivative of
  `r ↦ log (∑ w x ^ r)` at `0`, which is `∑ w log x` since `∑ w = 1`.
- Limits: `max x ≥ powerMean w x r ≥ (min w) ^ (1/r) * max x` for `r > 0`, and the reciprocal
  for `r → −∞`.

*Needs:* `ConvexOn.map_sum_le`, `StrictConvexOn.map_sum_eq_iff`,
`Real.geom_mean_le_arith_mean_weighted`, `Real.geom_mean_eq_arith_mean_weighted_iff_of_pos`.

### 1.2 Log-convexity of moments

**Targets.**

- **Finite form** (`convexOn_log_sum_mul_rpow`): for `w ≥ 0` with some `w i > 0` and `x > 0`,
  `r ↦ Real.log (∑ i, w i * x i ^ r)` is convex on `ℝ`. Hardy–Littlewood–Pólya, Thm 17, p. 27.
  The hypothesis `∃ i, 0 < w i` keeps the sum positive; for `w = 0` the function is
  `Real.log 0 = 0`, which is convex, but the hypothesis records the intended domain.
- **Integral form** (`lintegral_rpow_le_rpow_mul_rpow`): for `f : α → ℝ≥0∞` a.e.-measurable,
  `r, s > 0` and `t ∈ [0, 1]`,
  `∫⁻ f ^ ((1 − t) r + t s) ≤ (∫⁻ f ^ r) ^ (1 − t) * (∫⁻ f ^ s) ^ t`. Hardy–Littlewood–Pólya,
  Thm 197, p. 146, states it for integrals of positive functions. No finiteness hypothesis is
  needed in `ℝ≥0∞`.
- **Lyapunov** (consumed): on a probability space `‖f‖_p ≤ ‖f‖_q` for `0 < p ≤ q ≤ ∞` is
  `MeasureTheory.eLpNorm_le_eLpNorm_of_exponent_le`.

**Proof route.** The finite form is Hölder with exponents `1/(1−t)` and `1/t` applied to
`w x ^ ((1−t) r)` and `x ^ (t s)` (`Real.inner_le_Lp_mul_Lq`), with `t ∈ {0, 1}` trivial. The
integral form is `ENNReal.lintegral_mul_norm_pow_le` with the two functions `f ^ r`, `f ^ s`
and weights `1 − t`, `t`, after rewriting `f ^ (a + b) = f ^ a * f ^ b` for nonnegative
exponents in `ℝ≥0∞`.

*Needs:* `Real.inner_le_Lp_mul_Lq`, `ENNReal.lintegral_mul_norm_pow_le`.

### 1.3 Quasi-arithmetic means

**Definition.** For a generator `φ` and a set `I`, `quasiArithMean φ I w x` is
`Function.invFunOn φ I (∑ i, w i * φ (x i))`. It is used for an order-connected `I` and `φ`
continuous and strictly increasing on `I`. A strictly decreasing generator `φ` gives the same
mean as `−φ`, so the theory is stated for increasing generators.

**Targets.** Let `I` be order-connected and `φ, ψ` continuous and strictly increasing on `I`.

- **Well defined and internal** (`quasiArithMean_mem_Icc`): for nonempty `ι`, weights summing
  to `1` and `x i ∈ I`, the mean lies in `I`, satisfies
  `φ (quasiArithMean φ I w x) = ∑ i, w i * φ (x i)`, and lies between the smallest and the
  largest entry.
- **Comparison** (`quasiArithMean_le_quasiArithMean_iff`): `M_φ ≤ M_ψ` for all finite weighted
  data in `I` exactly when `ψ ∘ φ⁻¹` is convex on `φ '' I`. Hardy–Littlewood–Pólya, Thm 92,
  p. 75; Bullen, Ch. IV, Thm 5, p. 276.
- **Equivalence** (`quasiArithMean_eq_iff`): `M_φ = M_ψ` for all data exactly when
  `ψ = a φ + b` on `I` with `a > 0`. Hardy–Littlewood–Pólya, Thm 83, p. 66; Bullen, Ch. IV,
  §1.2, Thm 5, p. 271. (With both generators increasing, `a ≠ 0` forces `a > 0`.)
- **Homogeneous means are power means** (`exists_powerMean_eq_of_homogeneous`): a
  quasi-arithmetic mean on `(0, ∞)` that is positively homogeneous for all weighted data is a
  power mean `powerMean w x r` for one `r ∈ ℝ`. Bullen, Ch. IV, Thm 6, p. 272. The converse,
  that power means are quasi-arithmetic with generator `t ^ r` (or `−t ^ r` for `r < 0`, `log`
  at `r = 0`) and homogeneous, is a prose target.
- **Power means as quasi-arithmetic means** (prose target): `powerMean w x r` equals
  `quasiArithMean φ (Set.Ioi 0) w x` for the generator just named; this is how 1.1 enters the
  comparison theorem, giving a second proof of the power-mean inequality.

**Proof route.**

- Internality: `φ '' I` is an interval by the intermediate value theorem, the weighted average
  of points of `φ '' I` lies in it (convexity of intervals), and `Function.invFunOn_eq` gives
  the identity; monotonicity of `φ⁻¹` gives the bounds.
- Comparison, `⇐`: Jensen (`ConvexOn.map_sum_le`) for `χ = ψ ∘ φ⁻¹` at the points `φ (x i)`,
  then apply the increasing `ψ⁻¹`. `⇒`: two-point data `x = (a, b)` with weights `(1 − t, t)`
  give midpoint-type convexity inequalities for `χ` at all pairs and all `t`, which is
  `ConvexOn`.
- Equivalence: both comparisons hold, so `ψ ∘ φ⁻¹` is convex and concave on an interval, hence
  affine; strict monotonicity forces a positive slope.
- Homogeneity: Bullen's route. Fix `k > 0`; `φ_k (t) = φ (k t)` gives the same mean as `φ`, so
  `φ (k t) = a(k) φ (t) + b(k)` by Equivalence. The functional equation with continuous
  strictly monotone `φ` forces `φ` affine in `t ^ r` or in `log t`.

*Needs:* `ConvexOn.map_sum_le`, 1.1.

### 1.4 The logarithmic mean

**Definition.** `logMean a b` is `(a − b) / (Real.log a − Real.log b)` for `a ≠ b` and `a` for
`a = b`. It is used for `a, b > 0`.

**Targets.** Let `a, b > 0`.

- **Integral representation** (`logMean_eq_integral`):
  `logMean a b = ∫ t in 0..1, a ^ (1 − t) * b ^ t`. This also covers `a = b`.
- **Lin's bounds** (`sqrt_mul_lt_logMean_and_logMean_lt_powerMean`): for `a ≠ b`,
  `√(ab) < L(a, b) < M_(1/3)(a, b)`, the last with equal weights. Bullen, Ch. II, Thm 15,
  p. 168, for `G < L` (with `L < I < A`); Bullen, Ch. VI, Remark (xi), p. 389, for Lin's bound
  `L ≤ M_(1/3)`.
- **Sharpness** (`exists_powerMean_lt_logMean`): for every `r < 1/3` there are `a, b > 0` with
  `M_r(a, b) < L(a, b)`. Bullen, Ch. VI, Thm 7, pp. 388–389 (Pittenger's characterisation of
  the power means comparable with `L`) gives the sharpness.
- **Chain** (prose target): with 1.1, `G < L < M_(1/3) < A` for `a ≠ b`.

**Proof route.**

- Integral: `a ^ (1 − t) * b ^ t = a * exp (t log (b/a))`, integrate an exponential.
- `G < L`: with `a = e ^ u`, `b = e ^ v`, the claim is `sinh (s) / s > 1` for `s = (u − v)/2 ≠ 0`.
- `L < M_(1/3)`: both sides are homogeneous of degree `1` and symmetric, so take `a = 1` and
  `b = t ³` with `t > 0`, `t ≠ 1`. Then `M_(1/3)(1, t ³) = ((1 + t)/2) ³`, and the claim is
  `g (t) > 0` for `t > 1` and `g (t) < 0` for `t < 1`, where
  `g (t) = log t − 8 (t ³ − 1) / (3 (1 + t) ³)`. Since `g (1) = 0` and
  `g' (t) = (t − 1) ⁴ / (t (1 + t) ⁴) > 0` for `t ≠ 1`, `g` is strictly increasing.
- Sharpness: the Taylor expansions at `b = a (1 + ε)` are
  `L = a (1 + ε/2 − ε²/12 + O(ε³))` and `M_r = a (1 + ε/2 + (r − 1) ε²/8 + O(ε³))`, so
  `M_r < L` for small `ε` when `(r − 1)/8 < −1/12`, that is `r < 1/3`.

*Needs:* 1.1 (`powerMean`), interval integrals of exponentials.

**Checks.**

- `powerMean ![1/2, 1/2] ![1, 4]` takes the values `1.6`, `2`, `2.5` and `√8.5 ≈ 2.91548` at
  `r = −1, 0, 1, 2`.
- At `r = 0` the value is the geometric mean `2` for `x = (1, 4)`. Negative control: the
  formula `(∑ w x ^ r) ^ r⁻¹` without the case split gives `1 ^ 0 = 1` at `r = 0`, which is not
  a mean of `(1, 4)`.
- `powerMean ![1, 0] ![2, 7] r = 2` for every `r`: a zero weight removes the entry. Negative
  control: an unweighted convention gives `4.5` at `r = 1`.
- Negative control for strictness: with `w = (1, 0)`, `x = (2, 7)` the entries differ but
  `M_r = M_s`; the condition of `powerMean_lt_powerMean_iff` is about entries of positive weight.
- `quasiArithMean id Set.univ` is the arithmetic mean: `2.5` on `(1, 4)` with equal weights.
- `quasiArithMean Real.log (Set.Ioi 0)` is the geometric mean `2`, and the generator
  `t ↦ −t⁻¹` on `Set.Ioi 0` gives the harmonic mean `1.6`; the generator `Real.exp` on `ℝ` gives
  `log ((e + e ^ 4) / 2) ≈ 3.35544`.
- Negative control: `t ↦ t ^ 2` with `I = Set.univ` is not injective, and `Function.invFunOn`
  may return `−√8.5`; on `I = Set.Ioi 0` the mean is `√8.5`. The hypothesis `StrictMonoOn φ I`
  excludes the first choice.
- `logMean 1 4 = 3 / log 4 ≈ 2.16404`, between `G = 2` and `M_(1/3)(1, 4) ≈ 2.16522`.
- `logMean a a = a`, and `logMean a b = logMean b a`.
- Negative control for sharpness: `M_(0.3)(1, 4) ≈ 2.14835 < L(1, 4)`, so the exponent `1/3`
  cannot be lowered to `0.3`; at `r = 1/3` the reverse holds at `(1, 4)`.

### Examples

- `M_(−∞) ≤ H ≤ G ≤ L ≤ M_(1/3) ≤ A ≤ M_2 ≤ M_∞` on `(1, 4)` reads
  `1 ≤ 1.6 ≤ 2 ≤ 2.16404 ≤ 2.16522 ≤ 2.5 ≤ 2.91548 ≤ 4`.
- `powerMean ![1/2, 1/2] ![1, 4] 200 ≈ 3.98616` and
  `powerMean ![1/2, 1/2] ![1, 4] (−200) ≈ 1.00347`, approaching the limits `4` and `1`.
- The geometric mean is `quasiArithMean Real.log`; its comparison with the arithmetic mean is
  convexity of `exp`.

### Dependencies

Layer 1 uses Mathlib's finite Jensen, AM–GM, finite Hölder and `∫⁻` Hölder. 1.3 uses 1.1;
1.4 uses 1.1. No other layer is needed.

## Layer 2: Convex functions of one variable

### 2.1 The equality case of Jensen's inequality

**Target** (`map_integral_eq_integral_comp_iff`). Let `μ` be a probability measure, `s ⊆ ℝ`
open and convex, `φ` convex on `s`, `f` integrable with values a.e. in `s`, and `φ ∘ f`
integrable. Then `φ (∫ f) = ∫ φ ∘ f` exactly when there is a slope `c` such that the line
through `(∫ f, φ (∫ f))` of slope `c` lies below `φ` on `s` and `φ ∘ f` equals that line almost
everywhere. Hardy–Littlewood–Pólya, Thm 90, p. 74 (finite form: equality only if the
points are equal or `φ` is linear on an interval containing them).

**Corollaries** (prose targets).

- For strictly convex `φ`, equality holds exactly when `f` is a.e. constant; this is Mathlib's
  `StrictConvexOn.ae_eq_const_or_map_average_lt` and is not restated.
- Finite form: for weights `w ≥ 0` summing to `1`, equality in `ConvexOn.map_sum_le` holds
  exactly when `φ` is affine on the convex hull of the points of positive weight.

**Proof route.** The mean `m = ∫ f` lies in `s`: `s` is an open interval and `f` lies in it
a.e., so `m` lies strictly between its endpoints. A supporting slope `c` at `m` exists since `s`
is open
(`ConvexOn.slope_mono_adjacent`: take `c` between the left and right derivatives). Then
`g = φ ∘ f − (φ m + c (f − m)) ≥ 0` a.e. with `∫ g = ∫ φ ∘ f − φ m`. Equality makes `∫ g = 0`
and so `g = 0` a.e. (`integral_eq_zero_iff_of_nonneg_ae`). The converse integrates the line.

*Needs:* `ConvexOn.map_integral_le`, `ConvexOn.slope_mono_adjacent`.

### 2.2 The Jensen–Steffensen inequality

**Target** (`jensen_steffensen`). Let `x : Fin n → ℝ` be monotone or antitone with values in a
convex set `s`, `φ` convex on `s`, and `w : Fin n → ℝ` with `∑ w = 1` and every prefix sum
`TauCeti.prefixSum k w` in `[0, 1]`. Then `φ (∑ w x) ≤ ∑ w φ (x)`. Some weights may be
negative. Bullen, Ch. I, §4.3, Thm 20, pp. 37–38; Niculescu–Persson, Thm 1.9.4, p. 57.

**Normalisation.** The sources state the condition `0 ≤ W_k ≤ W_n`, `W_n > 0`, with
`W_k = ∑_(i ≤ k) w_i`. Dividing by `W_n` gives the condition used here; the general statement
is a prose corollary.

**Strictness** (prose target). If `φ` is strictly convex and `0 < W_k < 1` for `1 ≤ k < n`,
equality holds only when `x` is constant. Without the strict bounds this fails: `w = (1, 0)`
gives equality for every `x`. Bullen, Ch. I, Thm 20, pp. 37–38, treats the strict case.

**Proof route.** Abel summation writes `∑ w x = x_n − ∑_(k<n) W_k (x_(k+1) − x_k)`, so the
mean `m` lies in `[x_1, x_n]` (resp. `[x_n, x_1]`) because `0 ≤ W_k ≤ 1`; hence `m ∈ s`. Take
a supporting slope `c` of `φ` at `m` (or a one-sided slope if `m` is an endpoint). Then
`∑ w φ (x) − φ (m) = ∑ w (φ (x) − φ (m) − c (x − m))`, and Abel summation again expresses it
as `∑ W_k (Δ_k) + (1 − W_k) (Δ'_k)` with increments `Δ` of the nonnegative function
`φ − φ(m) − c (· − m)`, which is decreasing to the left of `m` and increasing to its right.

*Needs:* `TauCeti.prefixSum`, `ConvexOn.slope_mono_adjacent`.

### 2.3 The Hermite–Hadamard inequality

**Target** (`hermite_hadamard`). For `a < b` and `φ` convex on `[a, b]`,
`φ ((a + b)/2) ≤ (b − a)⁻¹ ∫_a^b φ ≤ (φ a + φ b)/2`. Bullen, Ch. I, Thm 9, p. 29;
Niculescu–Persson, (1.32), p. 60.

**Equality cases** (prose targets). The left inequality is an equality exactly when `φ` is
affine on the open interval `(a, b)`; the right one exactly when `φ` is affine on `[a, b]`.
Niculescu–Persson, p. 60, states equality for `φ` affine on `(a, b)`.

**Integrability.** A convex function on `[a, b]` is bounded (above by `max (φ a) (φ b)`, below
by a supporting line at the midpoint) and continuous on `(a, b)`, so it is interval integrable;
this is part of the target's proof, not a hypothesis.

**Proof route.** Left: `φ ((a+b)/2) ≤ (φ (m − t) + φ (m + t))/2` for `m = (a+b)/2`, integrate
over `t ∈ [0, (b−a)/2]` after the change of variables `x ↦ a + b − x`. Right: `φ` lies below
the chord on `[a, b]`; integrate the chord.

*Needs:* interval integrals, `ConvexOn.slope_mono_adjacent`.

### 2.4 The Kantorovich inequality

**Target** (`integral_mul_integral_inv_le`). Let `μ` be a probability measure, `0 < m`, and `f`
a.e.-measurable with `m ≤ f ≤ M` a.e. Then
`(∫ f) (∫ f⁻¹) ≤ (M + m)² / (4 M m)`. Bullen, Ch. III, Thm 5(a), p. 235, in the finite
weighted form.

**Finite form** (prose corollary). For weights `w` summing to `1` and `m ≤ x_i ≤ M`,
`(∑ w x)(∑ w / x) ≤ (M + m)² / (4 M m)`; this is the target for a finite measure.

**Sharpness** (prose target). Equality holds for the law giving mass `1/2` to each of `m` and
`M`.

**Proof route.** For `t ∈ [m, M]`, `(t − m)(t − M) ≤ 0` gives `t + m M / t ≤ m + M`. Integrate:
`∫ f + m M ∫ f⁻¹ ≤ m + M`. Then AM–GM on the two nonnegative terms:
`4 m M (∫ f)(∫ f⁻¹) ≤ (∫ f + m M ∫ f⁻¹)² ≤ (m + M)²`. Boundedness gives integrability of `f`
and `f⁻¹`.

*Needs:* integral monotonicity on a probability space.

**Checks.** Layer 2 owns no definitions. Theorem checks:

- Jensen–Steffensen with `w = (1/2, −1/2, 1)`, `x = (0, 1, 2)` and `φ = t ²`: prefix sums
  `1/2, 0, 1`, mean `1.5`, `φ (1.5) = 2.25 ≤ 3.5`.
- Negative control for Jensen–Steffensen: the same weights on the non-monotone `x = (0, 2, 1)`
  give mean `0` and `∑ w φ (x) = −1 < 0 = φ (0)`.
- Hermite–Hadamard for `t ²` on `[0, 1]`: `1/4 ≤ 1/3 ≤ 1/2`.
- Kantorovich on `{1, 4}` with masses `1/2`: `2.5 · 0.625 = 1.5625 = 25/16`, the bound.
- Negative control for Kantorovich: at `m = 0` the bound `(M + m)² / (4 M m)` is the junk value
  `x / 0 = 0` in Lean, and the statement would claim `(∫ f)(∫ f⁻¹) ≤ 0`; `0 < m` is a
  hypothesis.

### Examples

- Jensen equality for `φ = |t|` on `ℝ`: `f` with values in `[0, ∞)` gives equality, with
  supporting slope `1`, although `f` is not constant.
- Hermite–Hadamard for `exp` on `[0, 1]`:
  `e ^ (1/2) ≈ 1.64872 ≤ e − 1 ≈ 1.71828 ≤ (1 + e)/2 ≈ 1.85914`.

### Dependencies

Layer 2 uses Mathlib's convexity and integration. 2.2 uses `TauCeti.prefixSum`.

## Layer 3: Inequalities for sums and integrals

### 3.1 Chebyshev, Grüss and Popoviciu

**Targets.**

- **Weighted Chebyshev** (`sum_mul_sum_le_sum_mul_of_monovary`): for weights `w ≥ 0` summing to
  `1` and `a`, `b` similarly ordered (`Monovary a b`),
  `(∑ w a)(∑ w b) ≤ ∑ w a b`. Hardy–Littlewood–Pólya, Thm 43, p. 43; Bullen, Ch. II, §5.3,
  Thm 4, p. 161.
- **Opposite ordering and equality** (prose targets): for oppositely ordered vectors the
  inequality reverses; with positive weights equality holds exactly when `a` or `b` is constant
  on the support. Bullen, Ch. II, Thm 4, p. 161.
- **Grüss** (`abs_integral_mul_sub_le`): on a probability space, if `m ≤ f ≤ M` and
  `r ≤ g ≤ R` a.e., then `|∫ f g − ∫ f ∫ g| ≤ (M − m)(R − r)/4`. Mitrinović, §2.13, (1),
  p. 70, with `1/4` best possible.
- **Popoviciu** (consumed): `Var f ≤ ((M − m)/2)²` is
  `ProbabilityTheory.variance_le_sq_of_bounded`.

**Proof route.**

- Chebyshev: `∑_(i,j) w_i w_j (a_i − a_j)(b_i − b_j) ≥ 0` termwise from `Monovary`, and this sum
  is `2 (∑ w a b − ∑ w a ∑ w b)`. The uniform case is Mathlib's
  `MonovaryOn.sum_mul_sum_le_card_mul_sum`.
- Grüss: the covariance is a semi-inner product, so `Cov(f, g)² ≤ Var f · Var g`; Popoviciu
  bounds each variance by `((M − m)/2)²` and `((R − r)/2)²`. Boundedness gives integrability.

*Needs:* `ProbabilityTheory.variance_le_sq_of_bounded`, `MonovaryOn.sum_mul_sum_le_card_mul_sum`.

### 3.2 Bergström's inequality and its equality case

**Target** (`sq_sum_div_eq_sum_sq_div_iff`). For a finset `s` and `b > 0` on `s`,
`(∑ a)² / ∑ b = ∑ a² / b` exactly when `a = c b` on `s` for some real `c`. The inequality is
Mathlib's `Finset.sq_sum_div_le_sum_sq_div`; for empty `s` both sides are `0` and the condition
holds vacuously.

**Proof route.** `∑ a² / b − (∑ a)² / ∑ b = (∑ b)⁻¹ ∑_(i<j) (a_i b_j − a_j b_i)² / (b_i b_j)`
(Lagrange identity), which vanishes exactly when all `a_i / b_i` agree. Equivalently, apply the
Cauchy–Schwarz equality case `norm_inner_eq_norm_iff` to `a / √b` and `√b`.

*Needs:* `Finset.sq_sum_div_le_sum_sq_div`, `norm_inner_eq_norm_iff`.

### 3.3 The reverse Minkowski inequality

**Target** (`lintegral_rpow_add_rpow_le`). For `f, g : α → ℝ≥0∞` a.e.-measurable and
`0 < p < 1`,
`(∫⁻ f ^ p) ^ (1/p) + (∫⁻ g ^ p) ^ (1/p) ≤ (∫⁻ (f + g) ^ p) ^ (1/p)`.
Hardy–Littlewood–Pólya, Thm 198, (6.13.2), p. 146 (integrals), and Thm 24, (2.11.2), p. 30
(sums).

**Equality** (prose target). For finite nonzero integrals equality holds exactly when `f` and
`g` are proportional a.e., Hardy–Littlewood–Pólya, Thm 198, p. 146.

**Remark.** Nonnegativity is essential: for signed functions the `L^p` quasi-norm with
`0 < p < 1` satisfies only `‖f + g‖ ≤ 2 ^ (1/p − 1) (‖f‖ + ‖g‖)`, which is
`ENNReal.lintegral_Lp_add_le_of_le_one`.

**Proof route.** Infinite integrals first: `f ^ p ≤ (f + g) ^ p`, so `∫⁻ f ^ p = ∞` forces
`∫⁻ (f + g) ^ p = ∞`. Put `S = f + g`, `F = ∫⁻ S ^ p`, and work on `{S ≠ 0}`, since `f = g = 0`
off it.

- Ordinary Hölder with the exponents `1/p` and `1/(1 − p)`
  (`ENNReal.lintegral_mul_norm_pow_le` with weights `p` and `1 − p`) applied to `f S ^ (p − 1)`
  and `S ^ p` gives `∫⁻ f ^ p ≤ (∫⁻ f S ^ (p − 1)) ^ p F ^ (1 − p)`, because
  `f ^ p = (f S ^ (p − 1)) ^ p (S ^ p) ^ (1 − p)` on `{S ≠ 0}`. This is the reverse Hölder
  inequality `(∫⁻ f ^ p) ^ (1/p) F ^ ((p − 1)/p) ≤ ∫⁻ f S ^ (p − 1)`.
- The same for `g`, and `∫⁻ f S ^ (p − 1) + ∫⁻ g S ^ (p − 1) = F`. Adding and dividing by
  `F ^ ((p − 1)/p)` (the case `F = 0` being trivial) gives the target.

*Needs:* `ENNReal.lintegral_mul_norm_pow_le`.

### 3.4 Hölder and Minkowski: extended exponents and equality cases

**Targets.**

- **Generalized Hölder** (`eLpNorm_prod_le`): for a finset `s` of indices, a.e.-strongly
  measurable real functions `f i`, exponents `p i ∈ ℝ≥0∞` and `r ∈ ℝ≥0∞` with
  `∑ (p i)⁻¹ = r⁻¹`, `eLpNorm (∏ f i) r μ ≤ ∏ eLpNorm (f i) (p i) μ`.
  Hardy–Littlewood–Pólya, Thm 188, p. 140 (integrals) and Thm 11, p. 22 (sums), with weights
  `α, β, …` summing to `1`. Exponents may be `∞`, and `r` may be `< 1`.
- **Hölder equality** (`lintegral_mul_eq_iff`): for `f, g : α → ℝ≥0∞`, conjugate `p, q > 1`, and
  `∫⁻ f ^ p`, `∫⁻ g ^ q` finite and nonzero, equality in
  `∫⁻ f g ≤ (∫⁻ f ^ p) ^ (1/p) (∫⁻ g ^ q) ^ (1/q)` holds exactly when `f ^ p = c g ^ q` a.e.
  for some `c > 0`. Hardy–Littlewood–Pólya, Thm 189, p. 140; Thm 13, p. 24, for sums.
- **Minkowski equality** (`lintegral_Lp_add_eq_iff`): for `f, g : α → ℝ≥0∞`, `p > 1`, and
  finite nonzero `∫⁻ f ^ p`, `∫⁻ g ^ p`, equality in `ENNReal.lintegral_Lp_add_le` holds exactly
  when `f = c g` a.e. for some `c > 0`. Hardy–Littlewood–Pólya, Thm 198, p. 146.
- **Signed versions** (prose targets): for real `f, g` with finite nonzero `L^p` norms and
  `1 < p < ∞`, equality in `|∫ f g| ≤ ‖f‖_p ‖g‖_q` holds exactly when `|f| ^ p` and `|g| ^ q`
  are proportional and `f g` has a.e. constant sign; equality in Minkowski holds exactly when
  `f = c g` a.e. with `c > 0`. Both follow from the targets applied to `|f|, |g|` and the
  equality case `|f + g| = |f| + |g|`.
- **Cauchy–Schwarz and the endpoint cases** (consumed): `norm_inner_le_norm` with
  `norm_inner_eq_norm_iff`, and the `p ∈ {1, ∞}` cases of Hölder through
  `MeasureTheory.eLpNorm_smul_le_mul_eLpNorm` with a `HolderTriple`.

**Proof route.**

- Generalized Hölder: induction on `s`, using Mathlib's three-exponent Hölder
  `MeasureTheory.eLpNorm_smul_le_mul_eLpNorm` with `ENNReal.HolderTriple` for the exponents
  `p a`, `(∑_(i ∈ s') (p i)⁻¹)⁻¹` and `r` at the insertion step. The empty case: `r = ∞`, the
  product is `1`, and `eLpNorm 1 ∞ μ ≤ 1`.
- Hölder equality: normalise to `∫⁻ f ^ p = ∫⁻ g ^ q = 1`; Young's inequality pointwise,
  `f g ≤ f ^ p / p + g ^ q / q`, integrates to `≤ 1`, and equality forces pointwise equality
  a.e., which by `Real.young_inequality_eq_iff_of_nonneg` is `f ^ p = g ^ q`.
- Minkowski equality: the standard proof writes
  `∫⁻ (f + g) ^ p = ∫⁻ f (f + g) ^ (p − 1) + ∫⁻ g (f + g) ^ (p − 1)` and applies Hölder to each
  term; equality forces equality in both Hölder steps, so `f ^ p` and `g ^ p` are both
  proportional to `(f + g) ^ p`.

*Needs:* `MeasureTheory.eLpNorm_smul_le_mul_eLpNorm`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`,
`ENNReal.lintegral_Lp_add_le`, `Real.young_inequality_eq_iff_of_nonneg`.

**Checks.** Layer 3 owns no definitions. Theorem checks:

- Weighted Chebyshev with `w = (1/4, 3/4)`, `a = (1, 2)`, `b = (3, 5)`:
  `1.75 · 4.5 = 7.875 ≤ 8.25`.
- Negative control: the oppositely ordered `b = (5, 3)` gives `1.75 · 3.5 = 6.125 > 5.75`, so
  `Monovary a b` cannot be dropped.
- Grüss is sharp: for a Rademacher `f = g` (values `±1`, mass `1/2` each) the left side is `1`
  and the bound `(2 · 2)/4 = 1`.
- Bergström: `a = (1, 1)`, `b = (1, 2)` give `4/3 < 3/2`; `a = b = (1, 2)` give `3 = 3`, and
  `a = 1 · b`.
- Reverse Minkowski for counting measure on two points, `f = (1, 0)`, `g = (0, 1)`, `p = 1/2`:
  `1 + 1 = 2 ≤ 4`.
- Hölder equality with `p = q = 2` on two points: `f = g = (1, 2)` give `5 = √5 · √5`; the
  non-proportional `f = (1, 0)`, `g = (0, 1)` give `0 < 1`.
- Negative control for Hölder equality: if `∫⁻ g ^ q = 0` then `g = 0` a.e., both sides are `0`
  for every `f`, and no `c > 0` need exist; the nonzero hypotheses exclude this.

### Examples

- Popoviciu is sharp at the two-point law on `{m, M}` with masses `1/2`: the variance is
  `((M − m)/2)²`.
- Generalized Hölder with three exponents `p = (2, 4, 4)` and `r = 1` gives
  `∫ |f g h| ≤ ‖f‖_2 ‖g‖_4 ‖h‖_4`.

### Dependencies

Layer 3 uses Mathlib's `∫⁻` Hölder and Minkowski, its variance bound, Cauchy–Schwarz and
Young's equality case. No earlier layer is needed.

## Layer 4: Majorization

### 4.1 Majorization and weak majorization of real vectors

**Definitions.**

- `maxSubsetSum i x`, for `i : Fin (Fintype.card ι)`, is the largest sum of `x` over a subset of
  `ι` of size `i`, as a `Finset.sup'` over `Finset.powersetCard i`.
- `Majorizes x y` (`x ≺ y`): `∑ x = ∑ y` and `maxSubsetSum i x ≤ maxSubsetSum i y` for every
  `i`.
- `WeaklyMajorizes x y` (`x ≺_w y`): `∑ x ≤ ∑ y` and the same inequalities between largest
  subset sums.

The value at `i = 0` is `0`, and the condition at the full size is the total-sum field; that is
why the index runs over `Fin (Fintype.card ι)`. Marshall–Olkin–Arnold, 1.A.1, p. 8, define
majorization, and 1.A.2, p. 12, weak majorization, by partial sums of decreasing
rearrangements; the largest-subset-sum form is equivalent by the sorted-form target below.

**Targets.**

- **Sorted form** (`majorizes_iff_prefixSum`): on `Fin n`, `Majorizes x y` holds exactly when
  `TauCeti.prefixSum k (x ∘ Tuple.sortDesc x) ≤ TauCeti.prefixSum k (y ∘ Tuple.sortDesc y)` for
  every `k` and the totals agree. The same holds for `WeaklyMajorizes` with `≤` between the
  totals (prose target).
- **Bridge to Tau Ceti** (`weaklyMajorizes_iff_isWeaklyMajorizedBy`): for antitone nonnegative
  `x, y : Fin n → ℝ`, `WeaklyMajorizes x y ↔ TauCeti.IsWeaklyMajorizedBy x y`. This makes every
  closure law of MAJ-A07 to MAJ-A13 available for `WeaklyMajorizes` on sorted tuples.
- **Order properties** (prose targets): `Majorizes` is reflexive and transitive, invariant under
  permuting either argument, and `Majorizes x y ∧ Majorizes y x` holds exactly when `x` is a
  permutation of `y`; the same reflexivity, transitivity and invariance for `WeaklyMajorizes`.
  The constant vector `fun _ ↦ (∑ y) / card ι` is majorized by every `y` with the same total
  (nonempty `ι`).
- **Monotonicity of largest subset sums** (prose target): `maxSubsetSum` is monotone in the
  vector, subadditive, `maxSubsetSum i (x + y) ≤ maxSubsetSum i x + maxSubsetSum i y`, and
  positively homogeneous, `maxSubsetSum i (c • x) = c * maxSubsetSum i x` for `c ≥ 0`.

**Proof route.** For the sorted form, the largest sum of `k` entries is attained by the first
`k` entries of the decreasing rearrangement: for any `k`-subset `S`, exchange an element of `S`
outside the first `k` positions for a missing one among them without decreasing the sum. The
bridge unfolds both definitions and uses that an antitone tuple is its own decreasing
rearrangement up to ties.

*Needs:* `TauCeti.prefixSum`, `Tuple.sortDesc`, `Tuple.antitone_sortDesc`,
`TauCeti.IsWeaklyMajorizedBy`.

### 4.2 The Hardy–Littlewood–Pólya theorem and Rado's theorem

**Targets.**

- **Hardy–Littlewood–Pólya** (`majorizes_iff_exists_doublyStochastic`): `Majorizes x y` holds
  exactly when `x = D *ᵥ y` for some `D ∈ doublyStochastic ℝ ι`. Hardy–Littlewood–Pólya, Thm 46,
  p. 49 ("average" in their sense); Marshall–Olkin–Arnold, 2.B.2, p. 33;
  Niculescu–Persson, Thm 4.1.5, p. 188.
- **Rado** (prose target on arbitrary `ι`): `Majorizes x y` holds exactly when `x` lies in the
  convex hull of `Set.range fun σ ↦ y ∘ σ`. On `Fin n` with antitone `y` this is Tau Ceti's
  `TauCeti.mem_convexHull_range_comp_perm_iff` combined with 4.1; for general `ι` transport along
  an equivalence `ι ≃ Fin n` that sorts `y`. Marshall–Olkin–Arnold, 2.B.3, p. 34, and 4.C.1,
  p. 162.
- **T-transforms** (prose target): `Majorizes x y` holds exactly when `x` is obtained from `y` by
  at most `card ι − 1` T-transforms (convex combinations of the identity and a transposition).
  Marshall–Olkin–Arnold, 2.B.1, p. 32, and 2.B.1.a, p. 33.
- **Birkhoff** (consumed): `doublyStochastic_eq_convexHull_permMatrix` and
  `extremePoints_doublyStochastic`. Marshall–Olkin–Arnold, 2.A.2, p. 30.

**Proof route.**

- `⇐`: `Matrix.mulVec_mem_convexHull_range_comp_perm` places `D *ᵥ y` in the permutation hull of
  `y`; the hull is contained in `{x | Majorizes x y}`, which is convex because each
  `maxSubsetSum i` is a maximum of linear functionals (so convex) and the total is linear.
- `⇒`: by Rado `x = ∑_σ λ_σ (y ∘ σ)` with `λ` a probability vector; then
  `D = ∑_σ λ_σ P_σ` is doubly stochastic (convexity of `doublyStochastic ℝ ι`) with
  `D *ᵥ y = x`.

*Needs:* 4.1, `Matrix.mulVec_mem_convexHull_range_comp_perm`,
`TauCeti.mem_convexHull_range_comp_perm_iff`, `doublyStochastic_eq_convexHull_permMatrix`.

### 4.3 Karamata's inequality

**Targets.**

- **Karamata** (`Majorizes.sum_le_sum_of_convexOn`): if `x ≺ y`, `φ` is convex on a set `s` and
  all entries of `x` and `y` lie in `s`, then `∑ φ (x i) ≤ ∑ φ (y i)`. Bullen, Ch. I, Thm 10,
  p. 30; Marshall–Olkin–Arnold, 3.C.1, p. 92; Hardy–Littlewood–Pólya, Thm 108, p. 89.
- **Characterisation** (`majorizes_iff_forall_convexOn`): `x ≺ y` exactly when
  `∑ φ (x i) ≤ ∑ φ (y i)` for every convex `φ : ℝ → ℝ`. Hardy–Littlewood–Pólya, Thm 108,
  p. 89; Marshall–Olkin–Arnold, 4.B.1, p. 156.
- **Equality case** (`Majorizes.sum_eq_sum_iff_of_strictConvexOn`): if `x ≺ y` and `φ` is
  strictly convex on `s ⊇` the entries, `∑ φ (x i) = ∑ φ (y i)` exactly when `x = y ∘ σ` for a
  permutation `σ`. Marshall–Olkin–Arnold, 3.C.1.a, p. 92.

**Proof route.**

- Karamata: by 4.2, `x = D *ᵥ y`; Tau Ceti's
  `ConvexOn.sum_map_mulVec_le_of_mem_doublyStochastic` gives the inequality (the convex hull of
  the entries of `y` contains those of `x`, and lies in `s`).
- Characterisation `⇐`: `φ = id` and `φ = −id` give equal totals; for the subset sums use
  `φ (t) = max (t − c) 0` with `c` the `i`-th largest entry of `y`: then
  `maxSubsetSum i x − i c ≤ ∑ max (x − c) 0 ≤ ∑ max (y − c) 0 = maxSubsetSum i y − i c`.
- Equality: with `x = ∑_σ λ_σ (y ∘ σ)` (Rado), strict Jensen in each coordinate
  (`StrictConvexOn.map_sum_eq_iff`) forces, at every `i`, all `y (σ i)` with `λ_σ > 0` to be
  equal, so `x i = y (σ₀ i)` for any `σ₀` in the support of `λ`.

*Needs:* 4.2, `ConvexOn.sum_map_mulVec_le_of_mem_doublyStochastic`,
`StrictConvexOn.map_sum_eq_iff`.

### 4.4 Weak majorization: Tomić–Weyl and doubly substochastic matrices

**Definition.** `doublySubstochastic ι` is the set of real `ι × ι` matrices with nonnegative
entries and all row and column sums at most `1`.

**Targets.**

- **Tomić–Weyl** (`weaklyMajorizes_iff_forall_monotone_convexOn`): `x ≺_w y` exactly when
  `∑ φ (x i) ≤ ∑ φ (y i)` for every increasing convex `φ : ℝ → ℝ`.
  Marshall–Olkin–Arnold, 3.C.1.b, p. 92, and 4.B.2, p. 157; Niculescu–Persson, Cor 4.1.4,
  p. 187; Bullen, Ch. I, Thm 10, p. 30, for Tomić's form.
- **Majorized upper bound** (`weaklyMajorizes_iff_exists_le_majorizes`): `x ≺_w y` exactly when
  `x ≤ z` coordinatewise for some `z ≺ y`. Marshall–Olkin–Arnold, 5.A.9, p. 177.
- **Doubly substochastic form** (`weaklyMajorizes_iff_exists_doublySubstochastic`): for
  `x, y ≥ 0`, `x ≺_w y` exactly when `x = P *ᵥ y` for some `P ∈ doublySubstochastic ι`.
  Marshall–Olkin–Arnold, 2.C.4, p. 40.
- **Weighted form** (prose target): Tomić–Weyl with a convex `φ` on a set `s` containing the
  entries, increasing on `s`.

**Proof route.**

- Majorized upper bound, `⇒`: on `Fin n` with sorted vectors raise the smallest entry of `x` by
  `∑ y − ∑ x`; the prefix inequalities persist because the increase is at the last position
  after sorting. `⇐`: `maxSubsetSum` is monotone and `z ≺ y`.
- Tomić–Weyl, `⇒`: with `x ≤ z ≺ y`, monotonicity of `φ` then Karamata. `⇐`: test with
  `φ (t) = max (t − c) 0` as in 4.3, and with `φ = id` for the totals.
- Doubly substochastic, `⇐`: `P` is dominated entrywise by a doubly stochastic `D` (add to
  `P` a nonnegative matrix whose row and column sums are the deficits `1 − ∑`, built greedily
  as for transport plans), so `P *ᵥ y ≤ D *ᵥ y ≺ y` for `y ≥ 0`.
  `⇒`: `x ≤ z = D *ᵥ y`, and scaling the rows of `D` by `x i / z i ∈ [0, 1]` (with `0/0 = 0`)
  gives `P`.
- Bridge to transfer descent: on sorted nonnegative tuples,
  `weaklyMajorizes_iff_isWeaklyMajorizedBy`
  lets `TauCeti.IsSymmetricConvex.mem_of_prefixSum_le` serve as an alternative route.

*Needs:* 4.1, 4.3, `TauCeti.IsSymmetricConvex.mem_of_prefixSum_le`, `doublyStochastic`.

### 4.5 Doubly stochastic contraction

**Target** (`apply_mulVec_le_of_mem_doublyStochastic`). For a seminorm `p` on `ι → ℝ` invariant
under permutations of coordinates and `D` doubly stochastic, `p (D *ᵥ x) ≤ p x`.
Marshall–Olkin–Arnold, 3.C.2, p. 97 (a symmetric convex function is Schur-convex), applied
with 4.2.

**Corollaries** (prose targets).

- Every `ℓ^p` norm, `1 ≤ p ≤ ∞`, decreases under `D`; for `p = 2` this is Mathlib's
  `Matrix.l2_opNorm_le_one_of_mem_doublyStochastic`.
- If `x ≺ y` then `p x ≤ p y` for every permutation-invariant seminorm `p`.
- Symmetric gauges of MAJ-A06 (`Seminorm.IsSymmetricGauge`) are such seminorms, so 4.5 gives a
  second proof of gauge monotonicity on majorized pairs.

**Proof route.** Birkhoff writes `D = ∑_σ λ_σ P_σ`; the triangle inequality and homogeneity give
`p (D x) ≤ ∑_σ λ_σ p (x ∘ σ) = p x`.

*Needs:* `exists_eq_sum_perm_of_mem_doublyStochastic`.

**Checks.**

- `maxSubsetSum` of `x = (3, 1, 2)` is `0, 3, 5` at sizes `0, 1, 2`.
- Negative control for `maxSubsetSum`: for `x = (−1, −2)` the size-`1` value is `−1`, not `0`;
  a convention maximising over subsets of size at most `i` would give `0` and break the sorted
  form for negative entries.
- `Majorizes ![1/2, 1/2] ![1, 0]`: equal totals, `1/2 ≤ 1` at size `1`.
- `Majorizes ![2, 0] ![0, 2]` and `Majorizes ![0, 2] ![2, 0]`: permutations majorize each other.
- `Majorizes ![0, 0] ![1, −1]`: totals `0`, and `0 ≤ 1` at size `1`. Negative control: comparing
  increasing rearrangements instead (`−1` against `0`) would reverse the relation.
- Negative control for `Majorizes`: `(1, 1)` and `(3, 0)` have different totals, so
  `¬ Majorizes ![1, 1] ![3, 0]`, while `WeaklyMajorizes ![1, 1] ![3, 0]`.
- `WeaklyMajorizes ![−5, 0] ![0, 0]`: weak majorization is defined for signed vectors.
- Negative control for `WeaklyMajorizes`: `¬ WeaklyMajorizes ![2, 2] ![3, 0]`, since `4 > 3`,
  although the size-`1` condition `2 ≤ 3` holds.
- `0`, `1` and `(1/2) • 1` (the all-`1/2` matrix for two indices) lie in
  `doublySubstochastic (Fin 2)`; every doubly stochastic matrix does.
- Negative control for `doublySubstochastic`: `!![1, 0; 1, 0]` has row sums `1, 1` but first
  column sum `2`, so it is not doubly substochastic; a definition bounding only row sums would
  accept it.

### Examples

- The averaging matrix `J / n` (all entries `1/n`) sends every `y` to the constant vector
  `(∑ y / n, …)`, which is therefore majorized by `y`.
- Karamata with `φ = t ²` on `(1/2, 1/2) ≺ (1, 0)`: `1/2 ≤ 1`.
- The `ℓ^1` norm of `(1/2, 1/2)` equals that of `(1, 0)`, while the `ℓ^2` norms are
  `√(1/2) < 1`: contraction can be strict for some seminorms and an equality for others.

### Dependencies

4.1 consumes MAJ-A01 and MAJ-A02 through Tau Ceti; 4.2 consumes Tau Ceti's Rado theorem and
Mathlib's Birkhoff theorem; 4.3 uses 4.2; 4.4 uses 4.1 and 4.3; 4.5 uses Birkhoff.

## Layer 5: Schur-convex and symmetric functions

### 5.1 Schur-convexity and the Schur–Ostrowski criterion

**Definition.** `SchurConvexOn s φ` holds when `φ x ≤ φ y` for all `x, y ∈ s` with `x ≺ y`.
Schur-concavity is `SchurConvexOn s (−φ)`.

**Targets.**

- **Schur–Ostrowski** (`schurConvexOn_iff_fderiv`): let `I ⊆ ℝ` be open and order-connected and
  `φ` differentiable on `Iⁿ = Set.univ.pi fun _ ↦ I`. Then `φ` is Schur-convex on `Iⁿ` exactly
  when it is symmetric on `Iⁿ` and `(x i − x j) (∂_i φ (x) − ∂_j φ (x)) ≥ 0` for all `x ∈ Iⁿ`
  and all `i, j`. Marshall–Olkin–Arnold, 3.A.4, p. 84; Bullen, Ch. I, Thm 48, p. 57;
  Niculescu–Persson, Thm 4.3.3, p. 198 (differentiability suffices; no `C¹` hypothesis).
- **Symmetric convex functions** (prose target): a symmetric function convex on a
  permutation-invariant convex set is Schur-convex there. Marshall–Olkin–Arnold, 3.C.2, p. 97.
- **Separable functions** (prose target): `x ↦ ∑ g (x i)` is Schur-convex on `Iⁿ` exactly when
  `g` is convex on `I`; this is 4.3 in this vocabulary. Marshall–Olkin–Arnold, 3.C.1, p. 92.

**Proof route.** Symmetry is necessary since `x ≺ x ∘ σ ≺ x`. For the criterion, a T-transform
moves along a segment `x + t (e_j − e_i)` with `x i ≥ x j`, and the derivative of `φ` along it
is `∂_j φ − ∂_i φ`. Necessity: Schur-convexity makes `φ` decrease along the segment as `t`
increases from `0` (the point becomes less spread), giving the sign. Sufficiency: by 4.2 a
majorized pair is joined by finitely many T-transforms, each inside `Iⁿ` because `I` is an
interval, and the sign condition with the mean value theorem shows `φ` does not increase along
each one.

*Needs:* 4.2 (T-transforms, from Marshall–Olkin–Arnold, 2.B.1), the mean value theorem.

### 5.2 Muirhead's theorem

**Definition.** `muirheadSum α x` is `∑_σ ∏_i x (σ i) ^ α i`, the sum over all permutations
`σ` of `ι` (so the symmetric sum counts each monomial with its multiplicity in `ι!`).

**Target** (`majorizes_iff_forall_muirheadSum_le`). For real exponent vectors `α, β`,
`α ≺ β` exactly when `muirheadSum α x ≤ muirheadSum β x` for every `x > 0`.
Hardy–Littlewood–Pólya, Thm 45, p. 45, with the equality case; Marshall–Olkin–Arnold, 4.B.5,
p. 159, and 3.G.2.e, p. 125; Bullen, Ch. V, Thm 1, p. 358; Niculescu–Persson, Thm 4.1.9,
p. 190.

**Exponents.** The sources state nonnegative exponents; the target allows real exponents, for
which the same proof works because `x > 0`. This is an adaptation, with the proof route below.

**Equality** (prose target). For `α ≺ β` with `α` not a permutation of `β`, equality for some
`x > 0` holds exactly when all `x i` are equal. Hardy–Littlewood–Pólya, Thm 45, p. 45.

**Newton and Maclaurin** (consumed). The normalised Newton inequalities for all real tuples and
Maclaurin's inequalities on the nonnegative orthant are ComplexHessianEquations §2.1; the
special case `S_k ≤ S_1 ^ k` is also in NumberFieldEnumeration §1.1. They are not restated.

**Proof route.**

- `⇒`: `muirheadSum α x = ∑_σ exp (∑_i α i log x (σ i))` is a convex function of `α` (a sum of
  exponentials of linear forms) and symmetric in `α` (reindex `σ`), hence Schur-convex by the
  prose target of 5.1, or directly by Rado (4.2) and Jensen.
- `⇐`: `x = (t, …, t)` for `t > 0` gives `t ^ ∑ α ≤ t ^ ∑ β` for `t` near `0` and near `∞`, so
  the totals agree. For size `k`, take `x = t` on a `k`-subset and `1` elsewhere; as `t → ∞`
  the dominant term on each side is `t ^ maxSubsetSum k` with a positive coefficient.

*Needs:* 4.1, 4.2, 5.1.

### 5.3 Schur's inequality

**Target** (`schur_inequality`). For `x, y, z > 0` and real `t`,
`x ^ t (x − y)(x − z) + y ^ t (y − z)(y − x) + z ^ t (z − x)(z − y) ≥ 0`.
Mitrinović, §2.17, Thm 1, p. 119, with equality exactly when `x = y = z`.

**Equality and the cubic** (prose targets).

- For `x, y, z > 0`, equality holds exactly when `x = y = z` (Mitrinović, p. 119).
- The cubic case `t = 1` extends to `x, y, z ≥ 0` by continuity, with equality exactly when
  `x = y = z` or two of them are equal and the third is `0`.

**Proof route.** By symmetry assume `x ≥ y ≥ z`. For `t ≥ 0` group as
`(x − y) [x ^ t (x − z) − y ^ t (y − z)] + z ^ t (x − z)(y − z)`, both terms nonnegative. For
`t < 0` group the first and last terms instead:
`x ^ t (x − y)(x − z) + (y − z) [z ^ t (x − z) − y ^ t (x − y)] ≥ 0`, since `z ^ t ≥ y ^ t` and
`x − z ≥ x − y`.

*Needs:* nothing beyond ordered-field algebra and monotonicity of `rpow`.

### 5.4 Shannon entropy and mixing

**Definition.** `entropy p` is `∑ i, Real.negMulLog (p i)`, that is `−∑ p log p` with
`0 log 0 = 0`. It is defined on all real vectors and used for nonnegative ones.

**Targets.**

- **Schur-concavity** (`Majorizes.entropy_le`): if `p ≺ q` and `q ≥ 0`, then
  `entropy q ≤ entropy p`. (Then `p ≥ 0` as well, by 4.2.) Marshall–Olkin–Arnold, 3.D.1, p. 101.
- **Maximum** (`entropy_le_log_card`): for a probability vector `p`,
  `entropy p ≤ Real.log (card ι)`, with equality exactly when `p` is uniform.
  Marshall–Olkin–Arnold, 3.D.1, p. 101, also gives `entropy (1, 0, …, 0) = 0` as the minimum.
- **Mixing** (prose target): `entropy (D *ᵥ p) ≥ entropy p` for doubly stochastic `D` and
  `p ≥ 0`, by 4.2 and Schur-concavity.
- **Minimum** (prose target): `entropy p ≥ 0` for a probability vector, with equality exactly at
  the vertices `Pi.single i 1`.
- **Gibbs and Pinsker** (consumed): `InformationTheory.klDiv_eq_zero_iff` and
  `TauCeti.etvDist_sq_le_two_mul_klDiv`, with the finite form of the divergence in Tau Ceti.
  Mitrinović–Pečarić–Fink, Ch. XXIII, (2.2), p. 636, states the Gibbs inequality with equality
  exactly when the two distributions agree.

**Proof route.** Schur-concavity is 4.3 for the strictly convex `t ↦ t log t` on `[0, ∞)`
(`Real.strictConvexOn_mul_log`). The maximum: the uniform vector is majorized by every
probability vector (4.1), so `entropy p ≤ entropy (uniform) = log n`; equality uses the equality
case of 4.3, which makes `p` a permutation of the uniform vector.

*Needs:* 4.1, 4.3, `Real.strictConvexOn_mul_log`.

**Checks.**

- `SchurConvexOn Set.univ (fun x ↦ ∑ i, x i ^ 2)` holds (4.3 with `t ²`).
- `SchurConvexOn Set.univ (fun x ↦ Finset.univ.sup' _ x)` holds on nonempty `ι`: the largest
  entry is `maxSubsetSum 1`.
- Negative control for `SchurConvexOn`: `fun x ↦ x 0` is not Schur-convex, since `(1, 0) ≺ (0, 1)`
  but `1 > 0`; the symmetry clause of Schur–Ostrowski fails.
- `muirheadSum ![1, 1] ![1, 2] = 4` and `muirheadSum ![2, 0] ![1, 2] = 5`, matching
  `(1, 1) ≺ (2, 0)`.
- `muirheadSum 0 x = (card ι)!` for every `x`.
- Negative control for `muirheadSum`: summing over distinct monomials instead of permutations
  gives `2` rather than `4` for `α = (1, 1)`, `x = (1, 2)`; with three variables the targets
  compare `36` (`α = (1, 1, 1)`) with `72` (`β = (3, 0, 0)`) at `x = (1, 2, 3)`.
- `entropy ![1/2, 1/2] = log 2 ≈ 0.69315`, `entropy ![1, 0] = 0`, and
  `entropy ![1/2, 1/4, 1/4] = (3/2) log 2 ≈ 1.03972 < log 3 ≈ 1.09861`.
- Negative control for `entropy`: it is not normalised, so `entropy ![2, 0] = −2 log 2 < 0`;
  the hypothesis `∑ p = 1` in `entropy_le_log_card` is not decorative.
- Schur's inequality at `t = 1`: `(1, 1, 1)` and `(1, 1, 0)` give `0`, `(2, 1, 0)` gives `3`.
  Negative control: `(1, 1, −1)` gives `−4`, so the cubic needs nonnegative arguments.

### Examples

- AM–GM is Muirhead for `α = (1/n, …, 1/n) ≺ β = (1, 0, …, 0)`, divided by `n!`.
- `x ↦ ∏ x i` is Schur-concave on `(0, ∞)ⁿ`: Schur–Ostrowski with
  `∂_i φ − ∂_j φ = φ (x) (1/x i − 1/x j)`, which has the sign opposite to `x i − x j`.
- `entropy (D *ᵥ (1, 0)) = log 2` for the averaging matrix `D` on two indices.

### Dependencies

5.1 and 5.2 use 4.2; 5.4 uses 4.1 and 4.3. 5.3 is self-contained.

## Layer 6: Convex order and the log-sum inequality

### 6.1 The convex order on the line

**Definition.** For measures `μ, ν` on `ℝ`, `ConvexOrderLE μ ν` holds when both have finite first
moment (`Integrable id`) and `∫ φ dμ ≤ ∫ φ dν` for every convex `φ : ℝ → ℝ` integrable under
both. It is used for probability measures.

**Targets.** Let `μ, ν` be probability measures on `ℝ`.

- **Stop-loss characterisation** (`convexOrderLE_iff_stopLoss`): `ConvexOrderLE μ ν` holds
  exactly when both have finite first moment, the means agree, and
  `∫ max (x − t) 0 dμ ≤ ∫ max (x − t) 0 dν` for every `t`. Shaked–Shanthikumar, Thm 3.A.1,
  p. 110, with the definition (3.A.1), p. 109.
- **Absolute-deviation form** (prose target): equivalently, equal means and
  `∫ |x − t| dμ ≤ ∫ |x − t| dν` for every `t`. Shaked–Shanthikumar, Thm 3.A.2, p. 111.
- **Strong form** (`ConvexOrderLE.integrable_and_integral_le`): if `ConvexOrderLE μ ν` and `φ`
  is convex and `ν`-integrable, then `φ` is `μ`-integrable and `∫ φ dμ ≤ ∫ φ dν`. So the
  two-sided integrability in the definition is not a restriction.
- **Order properties** (prose targets): reflexive and transitive on probability measures with
  finite first moment; antisymmetric (the stop-loss transform determines the law); `δ_m` is the
  least element among laws with mean `m`.
- **Martingale coupling** (consumed): for laws carried by a compact interval, the dilation
  characterisation is MathematicalStatisticsFoundations §7.5 (Strassen's theorem in `ℝ^d`).
  Shaked–Shanthikumar, Thm 3.A.4, p. 112, is the one-dimensional statement for laws with finite
  mean, which is not owned here (see Beyond).

**Proof route.**

- `⇒`: `φ (x) = x`, `−x` give equal means, and `max (x − t) 0` is convex and integrable.
- `⇐`: a convex `φ` is the increasing limit of piecewise-linear convex functions
  `φ_n = a_n + b_n x + ∑_k c_(n,k) max (x − t_(n,k)) 0` with `c ≥ 0` (interpolate `φ` at a
  growing finite grid and extend linearly by one-sided slopes). Each `∫ φ_n` is ordered by
  the hypothesis and equal means; pass to the limit by monotone convergence applied to
  `φ_n − ℓ ≥ 0`, where `ℓ` is an affine minorant of `φ`.
- Strong form: the same approximation with `φ` only `ν`-integrable: `φ ≥ ℓ` makes the negative
  part `μ`-integrable, and the monotone limit bounds `∫ φ⁺ dμ` by `∫ φ dν − ∫ ℓ dν` plus the
  affine terms.

*Needs:* monotone convergence, Mathlib's convexity slopes.

### 6.2 Majorization as convex order of empirical laws

**Target** (`majorizes_iff_convexOrderLE`). For nonempty `ι` and `x, y : ι → ℝ`, `x ≺ y` exactly
when the empirical law of `x` is below that of `y` in the convex order. The empirical law is Tau
Ceti's `TauCeti.Probability.empiricalFiniteMeasure`, the uniform probability measure on the
family. Marshall–Olkin–Arnold, 4.B.3 and 4.B.4, p. 158, state the stop-loss form of
majorization, `∑ max (x i − t) 0 ≤ ∑ max (y i − t) 0` for all `t` with equal totals.

**Proof route.** `TauCeti.Probability.integral_empiricalFiniteMeasure` turns every integral into
`(card ι)⁻¹ ∑ φ (x i)`, every function being integrable for a finitely supported law. Then the
target is 4.3's characterisation `majorizes_iff_forall_convexOn`.

*Needs:* 4.3, 6.1, `TauCeti.Probability.integral_empiricalFiniteMeasure`.

### 6.3 The log-sum inequality

**Targets.** Let `s` be a finset, `a ≥ 0` and `b > 0` on `s`.

- **Log-sum** (`sum_mul_log_div_le`):
  `(∑ a) log ((∑ a)/(∑ b)) ≤ ∑ a log (a / b)`.
- **Equality** (`sum_mul_log_div_eq_iff`): equality holds exactly when `a = c b` on `s` for some
  real `c` (necessarily `c ≥ 0`).
- **Zero conventions** (prose target): with `b i = 0` allowed and `a i log (a i / 0) := +∞` for
  `a i > 0`, the inequality holds in `EReal`; this extension is stated through
  `InformationTheory.klDiv` on finite measures and is the Gibbs inequality when `∑ a = ∑ b`.

The hypothesis `b > 0` avoids the junk value `Real.log (a / 0) = 0`; a zero `a i` contributes
`0 · log 0 = 0`, which is the intended value.

**Proof route.** The inequality is Jensen for the convex `t ↦ t log t` with weights
`b i / ∑ b` at the points `a i / b i` (`ConvexOn.map_sum_le` with `Real.strictConvexOn_mul_log`);
equality is the strict case `StrictConvexOn.map_sum_eq_iff`, which forces all `a i / b i` equal.
The empty finset gives `0 = 0` on both sides and the condition is vacuous.

*Needs:* `Real.strictConvexOn_mul_log`, `StrictConvexOn.map_sum_eq_iff`.

**Checks.**

- `ConvexOrderLE δ₀ ρ` for the Rademacher law `ρ` (masses `1/2` at `±1`): equal means `0`, and
  `∫ max (x − t) 0` is `max (−t) 0 ≤ (max (1 − t) 0 + max (−1 − t) 0)/2` for every `t`; at
  `t = 0` it is `0 ≤ 1/2`.
- `¬ ConvexOrderLE δ₀ δ₁`: the means differ (`φ = −x` gives `0 > −1`).
- `¬ ConvexOrderLE ρ δ₀`: `φ = x ²` gives `1 > 0`.
- Negative control for `ConvexOrderLE`: for the Cauchy law `κ`, `¬ ConvexOrderLE κ κ` because
  `Integrable id κ` fails, while the clause about convex test functions alone would hold
  reflexively; the first-moment clauses make the order a relation between laws with a mean.
- Log-sum with `a = (1, 2)`, `b = (2, 1)`: `3 log 1 = 0 < log 2 ≈ 0.69315`; with `a = (1, 2)`,
  `b = (2, 4)` both sides are `−3 log 2 ≈ −2.07944`, and `a = (1/2) b`.

### Examples

- For `x = (1/2, 1/2)` and `y = (1, 0)`, the empirical laws are `δ_(1/2)` and the two-point
  law on `{0, 1}`, a mean-preserving spread.
- The stop-loss transform of `δ_m` is `max (m − t) 0`, the smallest among laws with mean `m`,
  by Jensen.

### Dependencies

6.1 is self-contained apart from integration; 6.2 uses 4.3 and 6.1; 6.3 uses Mathlib's Jensen.

## Downstream consumers

- MathematicalStatisticsFoundations §7.5 (comparison of experiments) works with the convex order
  of laws of likelihood vectors on a simplex; the one-dimensional stop-loss characterisation and
  the strong form of 6.1 apply to the real projections of those laws.
- OperatorTheory/PrincipalAngles, its rearrangement and eigenvalue-perturbation part (label
  PA-B31, the Birkhoff bilinear bound), uses doubly stochastic mixtures of permutations; 4.2 and
  4.5 give the majorization form of those bounds.
- SymplecticGeometry/ConvexityToric §3.2 identifies the diagonals of a unitary orbit with the
  convex hull of the permutations of the eigenvalues; Rado's theorem in 4.2 restates that hull
  as `{x | Majorizes x s}` on an arbitrary finite index type.
- ComplexHessianEquations §2.1 works with elementary symmetric functions of eigenvalues;
  Schur–Ostrowski (5.1) gives the Schur-concavity of the normalised elementary symmetric means
  on the positive orthant.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Integral inequalities of Hardy type.** Hardy's inequality for sums and integrals, Hilbert's
  double series theorem, Carleman's inequality, and the discrete Hardy inequality. They rest on
  weighted `L^p` operator bounds and Schur tests rather than on means of finitely many numbers,
  and form their own roadmap with Hardy–Littlewood maximal functions.
- **Rearrangement of functions.** Decreasing rearrangements of measurable functions, the
  Hardy–Littlewood rearrangement inequality for integrals, Riesz's rearrangement inequality and
  symmetrisation. They need a theory of distribution functions on measure spaces that this
  roadmap does not build.
- **Strassen's theorem on the line for laws with a finite mean.** The martingale coupling
  `E [Y | X] = X` for `ConvexOrderLE μ ν` without compact support. It needs disintegration and
  a tightness argument beyond the compact case of MathematicalStatisticsFoundations §7.5.
- **Stochastic orders beyond the convex order.** The increasing convex order, the dispersive and
  star orders, and the multivariate convex order in `ℝ^d`. They need the coupling theory of the
  previous item.
- **Majorization of matrices and eigenvalues beyond OperatorTheory/Majorization.** Lidskii's
  theorem and the converse Schur–Horn theorem are continuous-spectrum and operator statements,
  not inequalities between finitely many numbers.
- **Further means.** Gini and Stolarsky means, the identric mean beyond its role in Bullen's
  chain, Heinz and operator means. The scalar ones extend 1.3–1.4 by two-parameter families and
  their comparison theorems; the operator ones belong with matrix means.

## Prior formalization

- **lean-CKMA** (the author's project; admitted targets only, design ideas and provenance):
  `CKMA/Analysis/Convex/Majorization.lean` defines majorization by subset sums and states the
  Hardy–Littlewood–Pólya theorem and Karamata with its strict equality case;
  `CKMA/Analysis/Inequalities/ClassicalSequences.lean` and its `NewtonMaclaurin.lean` state
  Newton, Maclaurin and the discrete Hardy inequality. Coverage of the synopsis entries of this
  area:
  - provided by Mathlib or Tau Ceti and consumed: 11.1, 11.2, 11.4, 11.12, 11.16, 11.18, 11.23,
    11.30;
  - targets here: 11.3, 11.5, 11.6, 11.7, 11.8, 11.10, 11.11, 11.13, 11.14, 11.15, 11.17,
    11.19, 11.20, 11.21, 11.22, 11.24, 11.25, 11.26, 11.27, 11.29, 11.31, 11.64, 11.65, 11.71,
    11.72;
  - owned by another roadmap on main: 11.9 (ComplexHessianEquations §2.1), 11.28 for compact
    support (MathematicalStatisticsFoundations §7.5); 11.28 for laws with a finite mean is in
    Beyond.
- **Mathlib pull requests.** #41898 (majorization preorder and T-transform decomposition) and
  #33406 (basics of majorization) formalise the order of 4.1 and the T-transform part of 4.2;
  #42876 and #42874 formalise Newton and Maclaurin.
- **Tau Ceti.** Weak majorization of sorted tuples, Rado's theorem, the doubly stochastic
  Karamata inequality, symmetric gauges and the forward Schur–Horn theorem, as listed under the
  supplier contracts.

## References

- P. S. Bullen, *Handbook of Means and Their Inequalities*, Mathematics and Its Applications
  560, Kluwer, Dordrecht, 2003. Used: Ch. I, Thm 9, p. 29; Thm 10, p. 30; Thm 20, pp. 37–38;
  Thm 48, p. 57. Ch. II, Thm 4, p. 161; Thm 15, p. 168. Ch. III, Thm 1, p. 203; Thm 5(a),
  p. 235. Ch. IV, §1.2, Thm 5, p. 271; Thm 6, p. 272; Thm 5, p. 276. Ch. V,
  Thm 1, p. 358. Ch. VI, Thm 7, pp. 388–389; Remark (xi), p. 389.
- G. H. Hardy, J. E. Littlewood and G. Pólya, *Inequalities*, Cambridge University Press, 1934.
  Used: Thm 3, p. 15; Thm 11, p. 22; Thm 13, p. 24; Thm 16, p. 26; Thm 17, p. 27; Thm 24,
  p. 30; Thm 43, p. 43; Thm 45, p. 45; Thm 46, p. 49; Thm 83, p. 66; Thm 90,
  p. 74; Thm 92, p. 75; Thm 108, p. 89; Thm 188 and Thm 189, p. 140; Thm 197 and Thm 198,
  p. 146.
- A. W. Marshall, I. Olkin and B. C. Arnold, *Inequalities: Theory of Majorization and Its
  Applications*, 2nd ed., Springer Series in Statistics, Springer, New York, 2011. Used:
  1.A.1, p. 8; 1.A.2, p. 12; 2.A.2, p. 30; 2.B.1, p. 32; 2.B.1.a and 2.B.2, p. 33; 2.B.3,
  p. 34; 2.C.4, p. 40; 3.A.4, p. 84; 3.C.1, 3.C.1.a and 3.C.1.b, p. 92; 3.C.2, p. 97; 3.D.1,
  p. 101; 3.G.2.e, p. 125; 4.B.1, p. 156; 4.B.2, p. 157; 4.B.3 and 4.B.4, p. 158; 4.B.5,
  p. 159; 4.C.1, p. 162; 5.A.9, p. 177.
- D. S. Mitrinović, *Analytic Inequalities*, Grundlehren 165, Springer, Berlin, 1970. Used:
  §2.13, (1), p. 70; §2.17, Thm 1, p. 119.
- D. S. Mitrinović, J. E. Pečarić and A. M. Fink, *Classical and New Inequalities in Analysis*,
  Mathematics and Its Applications 61, Kluwer, Dordrecht, 1993. Used: Ch. XXIII, (2.2), p. 636.
- C. P. Niculescu and L.-E. Persson, *Convex Functions and Their Applications: A Contemporary
  Approach*, 2nd ed., CMS Books in Mathematics, Springer, Cham, 2018. Used: Thm 1.9.4, p. 57;
  (1.32), p. 60; Cor 4.1.4, p. 187; Thm 4.1.5, p. 188; Thm 4.1.9, p. 190; Thm 4.3.3, p. 198.
- M. Shaked and J. G. Shanthikumar, *Stochastic Orders*, Springer Series in Statistics,
  Springer, New York, 2007. Used: (3.A.1), p. 109; Thm 3.A.1, p. 110; Thm 3.A.2, p. 111;
  Thm 3.A.4, p. 112.
