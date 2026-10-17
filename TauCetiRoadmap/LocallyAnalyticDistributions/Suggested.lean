import Mathlib

/-!
# Locally analytic distributions, growth and character spaces: suggested Lean forms

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`, and §k.n below refers to its subsections. The file records the light definitions with
real bodies, the end theorems and layer milestones that can be stated against the pinned Mathlib
and Tau Ceti, and checks that fix the conventions. Theorems are stated with `sorry` proofs; nothing
here is claimed formalised.

Coefficient spaces are Mathlib's `ZeroAtInftyContinuousMap` on a discrete index type (`C₀(I, A)`),
with input index first and output index second; `c0Single i a` is its finitely supported element.
Complete continuity over a normed commutative ring `A` is approximation in operator norm by maps
with finitely generated `A`-image, not finite `K`-rank, and is never identified with Mathlib's
`IsCompactOperator`. Open-disc and entire series are Mathlib power series that are
`PowerSeries.IsRestricted` at every radius below one, respectively every positive radius; their
Gauss norms are Mathlib's `PowerSeries.gaussNorm`. The finite spectral transform
is Mathlib's bounded `Polynomial.resultant` of the reflected characteristic polynomial and
`1 - T B(Y)`.

The README states, and this file omits because their carriers are not at the pins: the
nonarchimedean locally convex categories, their left hearts and completed tensor products; the
finite-dimensional inverse-limit tensor comparison `finiteDimensionalML_completedScalar` of §0.0;
nonproper finite-piece dagger comparison and the Stein and tower Hyodo–Kato spaces and completed
comparisons of §0.CR.6.6, including
`LogCrystalline.towerHK.cofinal`; the topologies of `LA` and `D` with their pullbacks, pushforwards, products and convolution; `C^r`,
order-`r` distributions, vector order and small-order isotropic spaces; the Mellin equivalences
and the geometric character spaces; analytic reduction modulo a monic polynomial; the resolvent
and Riesz-projector lemmas on `(Pr)` modules; global specialization of distribution families and the
universal-character action and its `familySpecialization_radius` projective-limit comparison;
characteristic products of complexes, slope decompositions,
finite-slope windows and the torus slope adapters.

The targets supplied by PadicFunctionalAnalysis, CompactOperators and RestrictedPowerSeries are cited in the README.
These definitions are signature stand-ins for the named supplier APIs. Implementations import
those APIs and retain one owner for each object.
-/

namespace TauCetiRoadmap.LocallyAnalyticDistributions

noncomputable section
open Filter Topology
open scoped ZeroAtInfty AbstractMeasure

/-! ## Layer 0: analytic Banach stages, locally analytic functions and their strong duals -/

namespace LocallyAnalytic.SuggestedTest

/-- §0.1 check `maximum_not_L_points`: `X³ − X` has Gauss norm one on the unit disc but is bounded
by `1/3` on `ℤ_3`, so the maximum principle uses `ℂ_p`-points, not coefficient-field points. -/
example : (Polynomial.X ^ 3 - Polynomial.X : Polynomial ℤ_[3]).coeff 3 = 1 ∧
    ∀ x : ℤ_[3], ‖x ^ 3 - x‖ ≤ (1 / 3 : ℝ) := by sorry

/-- §0.1 and §4.15 check `analyticStage_sqrt_two`: in a normed extension of `ℚ_2`, a square
root of two gives normalized Mahler coefficients of norm `1/2` along `n = 2^k` at level one.
The level-one coefficients fail to tend to zero, while the level-two coefficients do tend to zero. -/
example {K : Type*} [NontriviallyNormedField K] [NormedAlgebra ℚ_[2] K]
    (r : K) (hr : r ^ 2 = 2) :
    (∀ k : ℕ, 1 ≤ k →
      ‖r ^ (2 ^ k) / (Nat.factorial (2 ^ (k - 1)) : K)‖ = (1 / 2 : ℝ)) ∧
    ¬ Tendsto (fun n : ℕ => r ^ n / (Nat.factorial (n / 2) : K)) atTop (𝓝 0) ∧
    Tendsto (fun n : ℕ => r ^ n / (Nat.factorial (n / 4) : K)) atTop (𝓝 0) := by sorry

end LocallyAnalytic.SuggestedTest

namespace NonarchimedeanFredholm

section Coefficients

variable {E : Type*} [TopologicalSpace E] [Zero E]
variable {I : Type*} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

/-- Signature stand-in for PadicFunctionalAnalysis §2.1: the coordinate vector `single i a`,
the finitely supported element of Mathlib's `C₀(I, E)` with value `a` at `i` and zero elsewhere; `c0Single i 1` is the basis vector
`e_i` and supplies the chart monomials of the analytic stages. -/
def c0Single (i : I) (a : E) : C₀(I, E) where
  toFun := Pi.single i a
  continuous_toFun := continuous_of_discreteTopology
  zero_at_infty' := by
    refine tendsto_const_nhds.congr' ?_
    filter_upwards [(isCompact_singleton (x := i)).compl_mem_cocompact] with j hj
    rw [Set.mem_compl_singleton_iff] at hj
    simp [hj]

/-- §0.3: a monomial on one chart has its single specified coefficient. -/
theorem c0Single_apply (i j : I) (a : E) : c0Single i a j = if j = i then a else 0 := by
  sorry

end Coefficients

end NonarchimedeanFredholm

namespace NonarchimedeanTopologyTests

variable {K : Type*} [NontriviallyNormedField K]

/-- §0.0 check `naTopology_product`: in `K^ℕ` the unit vectors tend to zero coordinatewise. -/
example : Tendsto (fun n : ℕ => fun i : ℕ => if i = n then (1 : K) else 0) atTop (𝓝 0) := by
  sorry

/-- §0.0 check `naTopology_product`, continued: in the sup-norm `c₀` they do not. -/
example : ¬ Tendsto (fun n : ℕ => NonarchimedeanFredholm.c0Single n (1 : K)) atTop (𝓝 0) := by
  sorry

/-- §0.0 check `strict_split_line`: the split kernel embedding is a strict map. -/
example : Topology.IsStrictMap (fun x : K => (x, (0 : K))) := by sorry

/-- §0.0 check `c0Tensor_infinite`: the constant array is excluded from `c₀`. -/
example : ¬ ∃ f : C₀(ℕ, K), ∀ n, f n = 1 := by sorry

/-- §0.0 check `projectiveTensor_two_summands`: the finite diagonal coefficient array has max norm
one, the coefficient-norm side of the completed-tensor comparison. -/
example : ‖NonarchimedeanFredholm.c0Single ((0, 0) : Fin 2 × Fin 2) (1 : ℚ_[3]) +
    NonarchimedeanFredholm.c0Single ((1, 1) : Fin 2 × Fin 2) (1 : ℚ_[3])‖ = 1 := by sorry

/-- §0.0 check `projectiveTensor_completion`: the decaying diagonal lies in `c₀(ℕ × ℕ)` but is not
a finite sum of separated coefficient arrays. -/
example : (∃ f : C₀(ℕ × ℕ, ℚ_[3]), ∀ i j, f (i, j) = if i = j then (3 : ℚ_[3]) ^ i else 0) ∧
    ¬ ∃ (r : ℕ) (x y : Fin r → ℕ → ℚ_[3]), ∀ i j,
      (∑ k : Fin r, x k i * y k j) = if i = j then (3 : ℚ_[3]) ^ i else 0 := by sorry

/-- §0.0 check `c0Tensor_basis`: the supplied tensor coefficient comparison preserves the
ordered pair of indices and its norm. -/
example :
    let v := NonarchimedeanFredholm.c0Single ((2, 3) : ℕ × ℕ) (1 : ℚ_[3])
    v (2, 3) = 1 ∧ v (3, 2) = 0 ∧ ‖v‖ = 1 := by sorry

end NonarchimedeanTopologyTests

/-! ## Layer 1: the unbounded Amice transform and operations on distributions -/

namespace LocallyAnalytic.SuggestedTest

/-- Convention 13 and §1.4 (The transpose derivative and logarithm): with `(dμ)(f) = μ(f′)`, the
degree-two coefficient of `log(1 + T)·(1 + aT + a(a − 1)T²/2)` is `a − 1/2`. -/
example (a : ℚ) :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else ((-1 : ℚ) ^ (n + 1) / (n : ℚ)))) *
      (1 + PowerSeries.C a * PowerSeries.X +
        PowerSeries.C (a * (a - 1) / 2) * PowerSeries.X ^ 2)).coeff 2 = a - 1 / 2 := by sorry

/-- §1.1 check `amice_transform_dirac_minus_one`: moments `(-1)^n` times the Amice
factorial weight have supremum one at every analytic stage; the inverse-factorial weights are unbounded. -/
example (h : ℕ) :
    sSup (Set.range (fun n : ℕ => ‖(-1 : ℚ_[3]) ^ n‖ *
      ‖((Nat.factorial (n / 3 ^ h) : ℕ) : ℚ_[3])‖)) = 1 ∧
    ¬ BddAbove (Set.range (fun n : ℕ => ‖(-1 : ℚ_[3]) ^ n‖ /
      ‖((Nat.factorial (n / 3 ^ h) : ℕ) : ℚ_[3])‖)) := by sorry

/-- §0.1 and §1.1 check `amice_stage_single_level`: moments `1/n!` have norm-one basis
values at level zero, unbounded basis values at level one, and a series that fails to converge
on the whole open unit disc. -/
example :
    (∀ n : ℕ, ‖(Nat.factorial n : ℚ_[3])⁻¹‖ * ‖(Nat.factorial n : ℚ_[3])‖ = 1) ∧
    ¬ BddAbove (Set.range (fun n : ℕ => ‖(Nat.factorial n : ℚ_[3])⁻¹‖ *
      ‖(Nat.factorial (n / 3) : ℚ_[3])‖)) ∧
    ¬ (∀ R : ℝ, 0 < R → R < 1 → PowerSeries.IsRestricted R
      (PowerSeries.mk (fun n : ℕ => (Nat.factorial n : ℚ_[3])⁻¹))) := by sorry

end LocallyAnalytic.SuggestedTest

namespace Mellin

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

/-- §1.2 hypothesis (b): an open-disc series is restricted at every radius strictly below one. -/
def OnOpenDisc (F : PowerSeries K) : Prop :=
  ∀ R : ℝ, 0 < R → R < 1 → PowerSeries.IsRestricted R F

/-- §1.2: `E(F, t)`, Mathlib's scalar-series sum of the coefficients of `F`; convergence is
asserted only on the open unit disc. -/
abbrev evalOpen (F : PowerSeries K) (t : K) : K :=
  FormalMultilinearSeries.ofScalarsSum (fun n => F.coeff n) t

/-- §1.2: evaluation is the sum of the evaluated coefficients. -/
theorem evalOpen_def (F : PowerSeries K) (t : K) :
    evalOpen F t = ∑' n : ℕ, F.coeff n * t ^ n := by sorry

/-- §1.2: evaluation at zero is the constant coefficient. -/
theorem evalOpen_zero (F : PowerSeries K) : evalOpen F 0 = F.coeff 0 := by sorry

/-- §1.2: evaluation is additive for open-disc series inside the disc. -/
theorem evalOpen_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F + H) t = evalOpen F t + evalOpen H t := by sorry

/-- §1.2 (Open-disc series and the native analytic radius): the scalar formal multilinear series
of an open-disc series has radius at least one. -/
theorem openDisc_native_radius (F : PowerSeries K) (hF : OnOpenDisc F) :
    (1 : ENNReal) ≤ (FormalMultilinearSeries.ofScalars K (fun n => F.coeff n)).radius := by sorry

/-- §1.2 (Summability inside the open disc). -/
theorem openDisc_summable (F : PowerSeries K) (hF : OnOpenDisc F)
    (t : K) (ht : ‖t‖ < 1) : Summable (fun n : ℕ => F.coeff n * t ^ n) := by sorry

/-- §1.2 (Analytic evaluation of an open-disc series; Colmez Lemma II.2.1 and Theorem II.2.2,
p. 30). -/
theorem analyticOnNhd_evalOpen (F : PowerSeries K) (hF : OnOpenDisc F) :
    AnalyticOnNhd K (evalOpen F) {t : K | ‖t‖ < 1} := by sorry

/-- §1.2 (Evaluation preserves products inside the disc). -/
theorem evalOpen_mul (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F * H) t = evalOpen F t * evalOpen H t := by sorry

/-- §1.2 (Evaluation commutes with an isometric coefficient extension). -/
theorem evalOpen_map {L : Type*} [NontriviallyNormedField L] [CompleteSpace L]
    [IsUltrametricDist L] (φ : K →+* L) (hφ : Isometry φ)
    (F : PowerSeries K) (hF : OnOpenDisc F) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.map φ F) (φ t) = φ (evalOpen F t) := by sorry

/-- §1.2 check `MellinEvalTests.geometric`: the geometric series evaluates to `(1 − t)⁻¹` inside
the disc. -/
example (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.mk (fun _ => (1 : K))) t = (1 - t)⁻¹ := by sorry

/-- §1.2 check `MellinEvalTests.boundary` (non-example): no convergence is claimed on the boundary. -/
example : ¬ Summable (fun _ : ℕ => (1 : K)) := by sorry

/-- §1.2 check `MellinEvalTests.zero_series`: the zero series evaluates to zero everywhere. -/
example (t : K) : evalOpen (0 : PowerSeries K) t = 0 := by sorry

/-- §1.2 check `openDisc_geometric`: the geometric series is open-disc analytic but not
restricted at radius one. -/
example : OnOpenDisc (PowerSeries.mk (fun _ => (1 : ℚ_[3]))) ∧
    ¬ PowerSeries.IsRestricted 1 (PowerSeries.mk (fun _ => (1 : ℚ_[3]))) := by sorry

/-- §1.2 check `openDisc_polynomial`: a quadratic polynomial is open-disc analytic. -/
example : OnOpenDisc (PowerSeries.X ^ 2 : PowerSeries ℚ_[3]) := by sorry

/-- §1.2 check `openDisc_small_radius_failure`: coefficients `3⁻ⁿ` fail restrictedness already
at radius `1/2`, so this formal series is not open-disc analytic. -/
example :
    let F := PowerSeries.mk (fun n : ℕ => (3 : ℚ_[3]) ^ (-(n : ℤ)))
    ¬ PowerSeries.IsRestricted (1 / 2) F ∧ ¬ OnOpenDisc F := by sorry

end Mellin

namespace AnalyticStageTests

/-- §0.3 check `stagePullback_affine`: pulling `y²` back along `y = 1 + 3x` keeps all three
coefficients. -/
example : (Polynomial.X ^ 2 : Polynomial ℚ).comp (1 + 3 * Polynomial.X) =
    1 + 6 * Polynomial.X + 9 * Polynomial.X ^ 2 := by sorry

/-- §1.3 check `pushforward_derivative`: for `f(x) = 1 + 3x`, `f_*(dδ_0)` takes `y²` to `6`. -/
example : (((Polynomial.X ^ 2 : Polynomial ℚ).comp (1 + 3 * Polynomial.X)).derivative).eval 0 = 6 := by
  sorry

/-- §1.3 check `multiply_derivative`: `x·dδ_0 = δ_0` under the positive derivative convention,
witnessed on the constant test function. -/
example : (Polynomial.X : Polynomial ℚ).derivative.eval 0 = 1 := by simp

end AnalyticStageTests

/-! ## Layer 2: admissible growth, vector order and uniqueness -/

namespace LocallyAnalytic.SuggestedTest

/-- §2.1 (The Amice–Vélu–Vishik extension and uniqueness theorem): `d^{N+1}δ₀` kills every
polynomial of degree `≤ N`, so uniqueness fails at `r = N + 1`. -/
example (P : Polynomial ℚ) (N : ℕ) (h : P.natDegree ≤ N) :
    Polynomial.derivative^[N + 1] P = 0 :=
  Polynomial.iterate_derivative_eq_zero (by omega)

/-- §2.1 check (Order zero is bounded measures): the normalised locally constant Haar functional
has mass `p⁻ⁿ` on a residue ball and is additive over its `p` sub-balls. -/
example (p : ℚ) (hp : p ≠ 0) (n : ℕ) : (p ^ n)⁻¹ = p * (p ^ (n + 1))⁻¹ := by
  field_simp
  ring

/-- §2.1 check, continued: those masses are unbounded in the `3`-adic norm, so additivity alone
does not give a bounded measure. -/
example : Tendsto (fun n : ℕ => ‖((3 : ℚ_[3]) ^ n)⁻¹‖) atTop atTop := by sorry

end LocallyAnalytic.SuggestedTest

namespace AnalyticDistributions

section Rectangles

variable {p : ℕ} [hp : Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K]
variable {g : ℕ}

/-- §2.2: the rectangular residue class with one conductor exponent per coordinate. -/
def padicBox (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  {x | ∀ i, x i - a i ∈ Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p])}

/-- §2.2: a finite product of residue classes is clopen. -/
theorem padicBox_isClopen (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : IsClopen (padicBox a m) := by
  have h : padicBox a m = ⋂ i, (fun x : Fin g → ℤ_[p] => x i - a i) ⁻¹'
      (Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p]) : Set ℤ_[p]) := by
    ext x
    simp [padicBox]
  rw [h]
  refine isClopen_iInter_of_finite fun i => IsClopen.preimage ?_ (by fun_prop)
  have hball : (Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p]) : Set ℤ_[p]) =
      Metric.closedBall 0 ((p : ℝ) ^ (-(m i : ℤ))) := by
    ext x
    simp [← PadicInt.norm_le_pow_iff_mem_span_pow]
  rw [hball]
  exact IsUltrametricDist.isClopen_closedBall _ (zpow_pos (by exact_mod_cast hp.out.pos) _).ne'

/-- §2.2: the locally constant indicator of a rectangular residue class. -/
def boxIndicator (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : LocallyConstant (Fin g → ℤ_[p]) K :=
  LocallyConstant.charFn K (padicBox_isClopen a m)

/-- §2.2 check `boxIndicator_center`: the centre has indicator one at every depth. -/
example (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : boxIndicator (K := K) a m a = 1 := by
  sorry

/-- §2.2 check `padicBox_depth_zero`: depth zero gives the whole space. -/
example (a : Fin g → ℤ_[p]) : padicBox a (fun _ => 0) = Set.univ := by sorry

/-- §2.2 check `boxIndicator_outside`: adding one in a coordinate leaves the depth-one box. -/
example (a : Fin g → ℤ_[p]) (i : Fin g) :
    boxIndicator (K := K) a (fun _ => 1) (Function.update a i (a i + 1)) = 0 := by sorry

/-- §2.2 (Rectangular growth for a locally constant functional): a uniform bound
`‖μ(1_{a + ∏ p^{m_i}ℤ_p})‖ ≤ C·p^{Σ r_i m_i}` on all rectangular residue classes. -/
def RectangularGrowth (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) (r : Fin g → ℝ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ a m, ‖μ (boxIndicator a m)‖ ≤ C * (p : ℝ) ^ (∑ i, r i * (m i : ℝ))

/-- §2.2: increasing each component of the order preserves the bound. -/
theorem rectangularGrowth_mono (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r s : Fin g → ℝ) (h : ∀ i, r i ≤ s i) (hμ : RectangularGrowth μ r) :
    RectangularGrowth μ s := by sorry

/-- §2.2: a sum of two functionals of growth `≤ r` has growth `≤ r`. -/
theorem rectangularGrowth_add (μ ν : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r : Fin g → ℝ) (hμ : RectangularGrowth μ r) (hν : RectangularGrowth ν r) :
    RectangularGrowth (μ + ν) r := by sorry

/-- §2.2 check `rectangularGrowth_dirac`: a point mass has every nonnegative growth order. -/
example (a : Fin g → ℤ_[p]) (r : Fin g → ℝ) (hr : ∀ i, 0 ≤ r i) :
    RectangularGrowth (LocallyConstant.evalₗ K a) r := by sorry

/-- §2.2 check `rectangularGrowth_zero`: the zero functional has every rectangular order. -/
example (r : Fin g → ℝ) : RectangularGrowth (p := p) (0 :
    LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) r := by sorry

/-- §2.2 check `rectangularGrowth_refinement`: a box mass is the sum of its `p` children in one
coordinate. -/
example (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) (i : Fin g) :
    μ (boxIndicator a m) = ∑ j : Fin p,
      μ (boxIndicator (Function.update a i (a i + (j.val : ℤ_[p]) * (p : ℤ_[p]) ^ m i))
        (Function.update m i (m i + 1))) := by sorry

/-- §2.3 (Equal-radius growth and unique isotropic extension): the equal-depth ball bound
`‖μ(1_{a+p^mℤ_p^g})‖ ≤ C·p^{rm}`. The extension theorem uses `0 ≤ r < 1`. -/
def IsotropicGrowth (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) (r : ℝ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ a m,
    ‖μ (boxIndicator a (fun _ => m))‖ ≤ C * (p : ℝ) ^ (r * (m : ℝ))

/-- §2.3: increasing the isotropic order preserves the equal-radius bound. -/
theorem isotropicGrowth_mono (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r s : ℝ) (hrs : r ≤ s) (hμ : IsotropicGrowth μ r) : IsotropicGrowth μ s := by sorry

/-- §2.3: a sum of equal-radius growth functionals has the same growth order. -/
theorem isotropicGrowth_add (μ ν : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r : ℝ) (hμ : IsotropicGrowth μ r) (hν : IsotropicGrowth ν r) :
    IsotropicGrowth (μ + ν) r := by sorry

/-- §2.3 check `isotropicGrowth_dirac`: point evaluation has every nonnegative isotropic order. -/
example (a : Fin g → ℤ_[p]) (r : ℝ) (hr : 0 ≤ r) :
    IsotropicGrowth (LocallyConstant.evalₗ K a) r := by sorry

/-- §2.3 check `isotropicGrowth_zero`: the zero functional has every equal-radius order. -/
example (r : ℝ) : IsotropicGrowth (p := p) (0 :
    LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) r := by sorry

end Rectangles

end AnalyticDistributions

namespace AnalyticDistributions

/-- §2.2: compatible normalized finite-residue averages supply a locally constant Haar
functional on `ℤ₃`, with mass `3⁻ᵐ` on every depth-`m` ball. -/
theorem exists_locallyConstantHaar :
    ∃ H : LocallyConstant (Fin 1 → ℤ_[3]) ℚ_[3] →ₗ[ℚ_[3]] ℚ_[3],
      ∀ (a : Fin 1 → ℤ_[3]) (m : ℕ),
        H (boxIndicator a (fun _ => m)) = (3 : ℚ_[3]) ^ (-(m : ℤ)) := by sorry

/-- §2.2: the normalized locally constant Haar functional, determined by its ball masses. -/
def locallyConstantHaar : LocallyConstant (Fin 1 → ℤ_[3]) ℚ_[3] →ₗ[ℚ_[3]] ℚ_[3] :=
  Classical.choose exists_locallyConstantHaar

/-- §2.2: normalized Haar assigns mass `3⁻ᵐ` to each residue ball of depth `m`. -/
theorem locallyConstantHaar_ball (a : Fin 1 → ℤ_[3]) (m : ℕ) :
    locallyConstantHaar (boxIndicator a (fun _ => m)) = (3 : ℚ_[3]) ^ (-(m : ℤ)) :=
  Classical.choose_spec exists_locallyConstantHaar a m

/-- §2.2 check `haar_constant`: normalized Haar takes the constant function one to one. -/
example : locallyConstantHaar 1 = 1 := by sorry

/-- §2.2 check `haar_ball`: the native ball masses have norm `3ᵐ`. -/
example (a : Fin 1 → ℤ_[3]) (m : ℕ) :
    ‖locallyConstantHaar (boxIndicator a (fun _ => m))‖ = (3 : ℝ) ^ m := by sorry

/-- §2.2 check `haar_refinement`: normalized Haar respects the actual three-child
subdivision of each residue ball. -/
example (a : Fin 1 → ℤ_[3]) (m : ℕ) :
    locallyConstantHaar (boxIndicator a (fun _ => m)) = ∑ j : Fin 3,
      locallyConstantHaar (boxIndicator (fun i => a i + (j.val : ℤ_[3]) * (3 : ℤ_[3]) ^ m)
        (fun _ => m + 1)) := by sorry

/-- §2.2 and §2.3 checks `rectangularGrowth_haar_one`, `isotropicGrowth_haar_one`:
normalized Haar has growth one in both conventions. -/
example : RectangularGrowth locallyConstantHaar (fun _ => 1) ∧
    IsotropicGrowth locallyConstantHaar 1 := by sorry

/-- §2.2 and §2.3 checks `rectangularGrowth_haar_zero`, `isotropicGrowth_haar_zero`:
normalized Haar fails growth zero. -/
example : ¬ RectangularGrowth locallyConstantHaar (fun _ => 0) ∧
    ¬ IsotropicGrowth locallyConstantHaar 0 := by sorry

/-- §2.2 and §2.3 checks `rectangularGrowth_haar_subcritical`, `isotropicGrowth_haar_subcritical`:
the ball masses exclude every nonnegative order below one. -/
example (r : ℝ) (hr : 0 ≤ r) (hr1 : r < 1) :
    ¬ RectangularGrowth locallyConstantHaar (fun _ => r) ∧
    ¬ IsotropicGrowth locallyConstantHaar r := by sorry

end AnalyticDistributions

namespace GrowthTests

/-- §2.1 check `Cr_mahler_iff`: the sparse Mahler coefficients `3^k` tend to zero, but their
`C¹`-weighted valuations `k − ℓ(3^k)` stay `−1`. -/
example : Tendsto (fun k : ℕ => (3 : ℚ_[3]) ^ k) atTop (𝓝 0) ∧
    ∀ k : ℕ, (k : ℤ) - (k + 1) = -1 := by sorry

/-- §2.1 check `digit_doubling_not_C2` at `p = 3`: the two `C²` Taylor ratios are `1` and `1/2`. -/
example : (1 : ℚ_[3]) ≠ (2 : ℚ_[3]) / (2 : ℚ_[3]) ^ 2 := by norm_num

/-- §2.1 check `digit_doubling_not_C2` at `p = 2`: the ratios are `1` and `5/9`. -/
example : (1 : ℚ_[2]) ≠ (5 : ℚ_[2]) / (3 : ℚ_[2]) ^ 2 := by norm_num

end GrowthTests

/-! ## Layer 3: character spaces and Mellin transforms -/

namespace Mellin

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

section Components

variable {G Δ : Type*} [TopologicalSpace G] [CompactSpace G]
  [Fintype Δ] [TopologicalSpace Δ] [DiscreteTopology Δ]

/-- §3.1 (Mellin series on a finite-character component; RJW Remark 3.47, pp. 25–26): for a chart
`H : G ≃ Δ × ℤ_p`, a value function `ν : Δ → K` and a bounded measure `μ`, the series
`Σ_n μ(g ↦ ν(H(g)_Δ)·binom(H(g)_ℤ, n)) Tⁿ`. -/
def componentMellin (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ : AbstractMeasure G K K) :
    PowerSeries K :=
  PowerSeries.mk fun n =>
    μ ⟨fun g => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩

omit [CompleteSpace K] [IsUltrametricDist K] [CompactSpace G] [Fintype Δ] in
/-- §3.1: the `n`th coefficient is `μ(ν ∘ H_Δ · binom(H_ℤ, n))`. -/
theorem componentMellin_coeff (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (n : ℕ) :
    (componentMellin H ν μ).coeff n = μ ⟨fun g =>
      ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩ :=
  PowerSeries.coeff_mk _ _

/-- §3.1: `F_{μ+η} = F_μ + F_η`. -/
theorem componentMellin_add (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ η : AbstractMeasure G K K) :
    componentMellin H ν (μ + η) = componentMellin H ν μ + componentMellin H ν η := by sorry

/-- §3.1: `F_{aμ} = a·F_μ`. -/
theorem componentMellin_smul (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (a : K)
    (μ : AbstractMeasure G K K) :
    componentMellin H ν (a • μ) = a • componentMellin H ν μ := by sorry

/-- §3.1: `F_{δ_g} = ν(H_Δ g)·Σ_n binom(H_ℤ g, n) Tⁿ`. -/
theorem componentMellin_dirac (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (g : G) :
    componentMellin H ν (AbstractMeasure.dirac K g) =
      PowerSeries.mk (fun n => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2)) := by sorry

/-- §3.1: `coeff_0 F_{μ,ν,H} = μ(ν ∘ H_Δ)`, the `ν`-weighted mass. -/
theorem componentMellin_mass (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ : AbstractMeasure G K K) :
    (componentMellin H ν μ).coeff 0 = μ ⟨fun g => ν (H g).1, by fun_prop⟩ := by sorry

/-- §3.1 (Bounded component Mellin coefficients): `‖coeff_n F‖ ≤ ‖μ‖·C` when `‖ν‖ ≤ C`. -/
theorem componentMellin_coeff_bound (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (C : ℝ) (hC : 0 ≤ C) (hν : ∀ δ, ‖ν δ‖ ≤ C) (n : ℕ) :
    ‖(componentMellin H ν μ).coeff n‖ ≤ ‖AbstractMeasure.toCLMEquiv μ‖ * C := by sorry

/-- §3.1 (Bounded component series are analytic on the disc). -/
theorem componentMellin_onOpenDisc (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : OnOpenDisc (componentMellin H ν μ) := by sorry

/-- §3.1 (Character evaluation equals the component Mellin value; RJW Remark 3.47 and §5.3,
pp. 25–26 and 34–35): `E(F_{μ,ν,H}, t) = μ(g ↦ ν(H_Δ g)·κ_t(H_ℤ g))` with `κ_t(1) = 1 + t`. -/
theorem componentMellin_eval (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (componentMellin H ν μ) t = μ ⟨fun g => ν (H g).1 *
      PadicInt.addChar_of_value_at_one t
        (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr ht) (H g).2, by fun_prop⟩ := by sorry

/-- §3.1 check `finite_atom`: a point with principal coordinate zero gives a constant series. -/
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (δ : Δ) :
    componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ, 0))) =
      PowerSeries.C (ν δ) := by sorry

/-- §3.1 check `ComponentMellinTests.zero`: the zero measure gives the zero series. -/
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) : componentMellin H ν 0 = 0 := by sorry

/-- §3.1 check `generator_atom`: `F_{δ_(δ,1)} = ν(δ)(1 + T)`. -/
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (δ : Δ) :
    componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ, 1))) =
      PowerSeries.C (ν δ) * (1 + PowerSeries.X) := by sorry

/-- §3.1 check `native_amice` (compatibility): on `ℤ_p` with the trivial chart this is Mathlib's
`AbstractMeasure.amiceTransform`. -/
example (μ : AbstractMeasure ℤ_[p] K K) :
    componentMellin (Homeomorph.uniqueProd PUnit ℤ_[p]).symm (fun _ => (1 : K)) μ =
      μ.amiceTransform := by sorry

end Components

/-- §3.2 (Arithmetic branches stay inside the character disc): `‖κ_q(s) − 1‖ ≤ ‖q‖`. -/
theorem branchCoordinate_norm_le (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    ‖PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1‖ ≤ ‖q‖ := by sorry

/-- §3.2 (Mellin branches in an arithmetic parameter): `B_{F,q}(s) = E(F, κ_q(s) − 1)` with
`κ_q(1) = 1 + q`. -/
def branchMellin (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) : K :=
  evalOpen F (PadicInt.addChar_of_value_at_one q
    (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1)

/-- §3.2: `B_{F,q}(s) = E(F, κ_q(s) − 1)`. -/
theorem branchMellin_def (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin F q hq s = evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1) := rfl

/-- §3.2: `B_{F,q}(0) = coeff_0 F`. -/
theorem branchMellin_zero (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 0 = F.coeff 0 := by sorry

/-- §3.2: `B_{F,q}(1) = E(F, q)`. -/
theorem branchMellin_one (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 1 = evalOpen F q := by sorry

/-- §3.2: additivity in the series, for open-disc series. -/
theorem branchMellin_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (F + H) q hq s = branchMellin F q hq s + branchMellin H q hq s := by sorry

/-- §3.2 (Mellin evaluation at integral weights): `B_{F,q}(n) = E(F, (1 + q)ⁿ − 1)`. -/
theorem branchMellin_nat (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (n : ℕ) :
    branchMellin F q hq (n : ℤ_[p]) = evalOpen F ((1 + q) ^ n - 1) := by sorry

/-- §3.2 check `BranchMellinTests.zero`: the zero series has zero value at every weight. -/
example (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (0 : PowerSeries K) q hq s = 0 := by sorry

/-- §3.2 check `BranchMellinTests.constant`: a constant series is independent of weight. -/
example (a q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (PowerSeries.C a) q hq s = a := by sorry

/-- §3.2 check `linear_at_one`: `B_{T,q}(1) = q`. -/
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) PowerSeries.X q hq 1 = q := by sorry

/-- §3.2 check `generator_at_zero`: `B_{1+T,q}(0) = 1`. -/
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) (1 + PowerSeries.X) q hq 0 = 1 := by sorry

/-- §3.2 check `BranchMellinTests.torsion_point`: a torsion point with zero principal coordinate has
weight-independent value. -/
example {G Δ : Type*} [TopologicalSpace G] [CompactSpace G] [Fintype Δ]
    [TopologicalSpace Δ] [DiscreteTopology Δ] (H : G ≃ₜ Δ × ℤ_[p])
    (ν : Δ → K) (δ : Δ) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ, 0)))) q hq s = ν δ := by
  sorry

/-- §3.2 (Mellin evaluation on a clearing-factor domain): `Q_{F,D}(t) = E(F, t)/E(D, t)`, used
only where `E(D, t) ≠ 0`. -/
def quotientMellin (F D : PowerSeries K) (t : K) : K := evalOpen F t / evalOpen D t

omit [CompleteSpace K] [IsUltrametricDist K] in
/-- §3.2: the defining quotient; meaningful use is guarded by `E(D, t) ≠ 0`. -/
theorem quotientMellin_def (F D : PowerSeries K) (t : K) :
    quotientMellin F D t = evalOpen F t / evalOpen D t := rfl

/-- §3.2: a zero numerator gives zero on every admissible domain. -/
theorem quotientMellin_zero (D : PowerSeries K) (t : K) : quotientMellin 0 D t = 0 := by sorry

/-- §3.2: `E(D, t)·Q_{F,D}(t) = E(F, t)` when `E(D, t) ≠ 0`. -/
theorem quotientMellin_clear (F D : PowerSeries K) (t : K) (hD : evalOpen D t ≠ 0) :
    evalOpen D t * quotientMellin F D t = evalOpen F t := by sorry

/-- §3.2: `Q_{F,1}(t) = E(F, t)`. -/
theorem quotientMellin_one (F : PowerSeries K) (t : K) : quotientMellin F 1 t = evalOpen F t := by
  sorry

/-- §3.2 (Agreement of Mellin clearing expressions): if `F D′ = F′ D` then the two quotients agree
wherever both denominators are nonzero. -/
theorem quotientMellin_independent (F D F' D' : PowerSeries K)
    (hF : OnOpenDisc F) (hD : OnOpenDisc D) (hF' : OnOpenDisc F') (hD' : OnOpenDisc D')
    (h : F * D' = F' * D) (t : K) (ht : ‖t‖ < 1)
    (hDt : evalOpen D t ≠ 0) (hD't : evalOpen D' t ≠ 0) :
    quotientMellin F D t = quotientMellin F' D' t := by sorry

/-- §3.2 check `simple_pole`: `Q_{1,T}(t) = t⁻¹` for `t ≠ 0`. -/
example (t : K) (ht : t ≠ 0) : quotientMellin 1 PowerSeries.X t = t⁻¹ := by sorry

/-- §3.2 check `removable_on_punctured_disc`: equal linear numerator and denominator cancel. -/
example (t : K) (ht : t ≠ 0) : quotientMellin PowerSeries.X PowerSeries.X t = 1 := by sorry

/-- §3.2 check `trivial_character_excluded` (non-example): `E(T, 0) = 0`, so the chart for the
denominator `T` excludes the trivial character. -/
example : evalOpen (PowerSeries.X : PowerSeries K) 0 = 0 := by sorry

end Mellin

/-! ## Layer 4: analytic families, Fredholm theory and finite-slope complexes -/

namespace NonarchimedeanFredholm

section CompleteContinuity

variable {A M N : Type*} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [NormedAddCommGroup N] [Module A N]

/-- Signature stand-in for CompactOperators §0.1: approximation by continuous A-linear maps
of finitely generated range. Over Noetherian A this is its finite-image approximation predicate
by `isFiniteRank_iff_range_fg`. Its comparison with row compactness is supplied by §0.2;
the affinoid lattice comparison is supplied by §0.1 and AdicSpacesPartIII §R3.6. -/
def IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
    (LinearMap.range g.toLinearMap).FG ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖

/-- Signature stand-in for CompactOperators §0.1 (`IsFiniteRank`): the image lies in a finitely
generated `A`-submodule (finite `A`-image, not finite `K`-rank). -/
def HasFiniteAImage (f : M →L[A] N) : Prop :=
  ∃ Q : Submodule A N, Q.FG ∧ LinearMap.range f.toLinearMap ≤ Q

end CompleteContinuity

universe u v

variable {K A : Type u}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [hNontrivialA : Nontrivial A]
variable [NormedAlgebra K A] [hCompleteA : CompleteSpace A] [hNoeth : IsNoetherianRing A]
variable {M N P : Type v}
variable [NormedAddCommGroup M] [NormedSpace K M] [Module A M]
variable [IsScalarTower K A M] [ContinuousSMul A M] [hCompleteM : CompleteSpace M]
variable [NormedAddCommGroup N] [NormedSpace K N] [Module A N]
variable [IsScalarTower K A N] [ContinuousSMul A N] [CompleteSpace N]
variable [NormedAddCommGroup P] [NormedSpace K P] [Module A P]
variable [IsScalarTower K A P] [ContinuousSMul A P] [CompleteSpace P]

section Section41

include hNoeth in
/-- §4.1 (Strict norm approximation by finite-image maps), in the `K`-operator norm. -/
theorem isCompletelyContinuous_iff_norm_approximation (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ‖(f - g).restrictScalars K‖ < ε := by sorry

/-- Signature stand-in for PadicFunctionalAnalysis §2.2: property (Pr), `M` is a continuous
retract of some `C₀(I, A)`. -/
def HasPr (A : Type u) (M : Type v) [NormedCommRing A]
    [NormedAddCommGroup M] [Module A M] : Prop :=
  ∃ (I : Type v) (t : TopologicalSpace I),
    letI : TopologicalSpace I := t
    DiscreteTopology I ∧ ∃ (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M),
      r.comp i = ContinuousLinearMap.id A M

/-- §4.1 check `c0_extension_bounded_action`: in the Q₃ product example the basis image has
norm `1/3`, while its extension takes a unit-norm vector to a vector of norm `1`. -/
example :
    let moduleNorm : ℚ_[3] × ℚ_[3] → ℝ := fun z => max ‖z.1 + z.2 / 3‖ ‖z.2‖
    moduleNorm (1, -3) = 1 / 3 ∧ moduleNorm (1, 0) = 1 ∧
      ∀ a b : ℚ_[3], moduleNorm (a, -3 * b) ≤ max ‖a‖ ‖b‖ := by sorry

end Section41

/-! ### §4.2 Entire power series -/

section Entire

/-- Signature stand-in for RestrictedPowerSeries §7.2: restrictedness at every positive radius.
The analytic algebra and division use complete ultrametric coefficients; the predicate itself
is defined for any normed coefficient ring. The supplier's normalized-root unit criterion
is named `IsEntire.isUnit_of_evalAt_eq_zero`. -/
def IsEntire (f : PowerSeries A) : Prop :=
  ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f

/-- Signature stand-in for RestrictedPowerSeries §§2.1 and 7.2 (`evalAt`, with arguments
swapped): `entireEval f a = evalAt a f`, the total coefficient sum at a scalar.
For entire series over complete ultrametric coefficients this is the convergent evaluation. -/
def entireEval (f : PowerSeries A) (a : A) : A := ∑' n : ℕ, f.coeff n * a ^ n

omit [NormOneClass A] hNontrivialA hCompleteA hNoeth in
/-- §4.12 (Entire series and native restrictedness): entire means Mathlib-restricted at every
positive radius. -/
theorem isEntire_iff_forall_isRestricted (f : PowerSeries A) :
    IsEntire f ↔ ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f := Iff.rfl

end Entire

/-! ### §4.8 Finite generation and projectivity of root kernels -/

section RootKernels

include hNoeth in
/-- §4.8 (Property (Pr) of the complemented root kernel). -/
theorem riesz_kernel_hasPr (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1 - a • u) ^ h).ker F)
    (hp : HasPr A M) : HasPr A ((1 - a • u) ^ h).ker := by sorry

end RootKernels

end NonarchimedeanFredholm

/-! ### §4.3 Entire division by linear and monic factors -/

namespace NonarchimedeanFredholm

section LinearDivision

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A]

/-- §4.3: the linear-tail realization over complete normed commutative rings, without
ultrametricity, extending RestrictedPowerSeries §7.2:
`q_n = Σ_k c_{n+1+k} a^k`. -/
def entireLinearQuotient (a : A) (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => ∑' k : ℕ, f.coeff (n + 1 + k) * a ^ k)

omit [NormOneClass A] [CompleteSpace A] in
/-- §4.3: the coefficient is the total tail sum `Σ_k c_{n+1+k} a^k`; it converges for entire `F`. -/
theorem entireLinearQuotient_coeff (a : A) (f : PowerSeries A) (n : ℕ) :
    (entireLinearQuotient a f).coeff n = ∑' k : ℕ, f.coeff (n + 1 + k) * a ^ k :=
  PowerSeries.coeff_mk _ _

/-- §4.3: `Q_a(0) = 0`. -/
theorem entireLinearQuotient_zero (a : A) : entireLinearQuotient a (0 : PowerSeries A) = 0 := by
  sorry

/-- §4.3: `Q_a(F + G) = Q_a(F) + Q_a(G)` for entire `F`, `G`. -/
theorem entireLinearQuotient_add (a : A) (f g : PowerSeries A) (hf : IsEntire f) (hg : IsEntire g) :
    entireLinearQuotient a (f + g) = entireLinearQuotient a f + entireLinearQuotient a g := by sorry

/-- §4.3: `Q_a(bF) = b·Q_a(F)` for entire `F`. -/
theorem entireLinearQuotient_C_mul (a b : A) (f : PowerSeries A) (hf : IsEntire f) :
    entireLinearQuotient a (PowerSeries.C b * f) = PowerSeries.C b * entireLinearQuotient a f := by
  sorry

/-- §4.3: `Q_a(b) = 0` for a constant `b`. -/
theorem entireLinearQuotient_C (a b : A) : entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry

/-- §4.3: `Q_0(F)` is the shifted series, for every formal `F`. -/
theorem entireLinearQuotient_at_zero (f : PowerSeries A) :
    entireLinearQuotient 0 f = PowerSeries.mk (fun n => f.coeff (n + 1)) := by sorry

/-- §4.3 (An entire linear product cannot be a nonzero constant): the corrected form of Coleman
Lemma A3.1, p. 432. -/
theorem entire_linear_product_constant (a b : A) (f : PowerSeries A) (hf : IsEntire f)
    (h : (PowerSeries.X - PowerSeries.C a) * f = PowerSeries.C b) : f = 0 ∧ b = 0 := by sorry

/-- §4.3 (Uniqueness of the entire quotient and constant remainder). -/
theorem entire_linear_division_unique (a b c : A) (f g h : PowerSeries A)
    (hg : IsEntire g) (hh : IsEntire h)
    (hb : f = (PowerSeries.X - PowerSeries.C a) * g + PowerSeries.C b)
    (hc : f = (PowerSeries.X - PowerSeries.C a) * h + PowerSeries.C c) : g = h ∧ b = c := by sorry

/-- §4.3 (Agreement with native monic polynomial division). -/
theorem entireLinearQuotient_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (P : Polynomial A) :
    entireLinearQuotient a (P : PowerSeries A) =
      ((P /ₘ (Polynomial.X - Polynomial.C a) : Polynomial A) : PowerSeries A) := by sorry

/-- §4.3 check `linear_quotient_quadratic`: `Q_a(T²) = T + a`. -/
example (a : A) :
    entireLinearQuotient a (PowerSeries.X ^ 2 : PowerSeries A) = PowerSeries.X + PowerSeries.C a := by
  sorry

/-- §4.3 check `linear_quotient_zero_divisor`: nonzero nilpotents survive. -/
example (e : A) (he : e ^ 2 = 0) :
    entireLinearQuotient e (PowerSeries.C e * PowerSeries.X ^ 2) =
      PowerSeries.C e * PowerSeries.X := by sorry

/-- §4.3 check `linear_entire_uniqueness_boundary` (non-example): the formal geometric series
inverts `1 − aT` but is not entire for `a = p`, so Coleman A3.1 needs entireness. -/
example (a : A) :
    (1 - PowerSeries.C a * PowerSeries.X) * PowerSeries.mk (fun n : ℕ => a ^ n) = 1 := by sorry

/-- §4.3 check `linear_quotient_constant`: constants have zero linear quotient. -/
example (a b : A) : entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry

/-- §4.3 check `linear_quotient_zero_shift`: division at zero shifts every formal series. -/
example (F : PowerSeries A) :
    entireLinearQuotient 0 F = PowerSeries.mk (fun n => F.coeff (n + 1)) := by sorry

/-- §4.3 check `linear_quotient_native_polynomial`: the actual tail quotient agrees with
native polynomial division. -/
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A) (P : Polynomial A) :
    entireLinearQuotient a (P : PowerSeries A) =
      ((P /ₘ (Polynomial.X - Polynomial.C a) : Polynomial A) : PowerSeries A) := by sorry

end LinearDivision

section MonicDivision

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- Signature stand-in for RestrictedPowerSeries §7.2, **Explicit monic division**:
coefficient n is `Σ_k coeff_{n+d+k}(F) b_k`, with `Σ b_k T^k` the inverse of `Q.reverse`. -/
def entireMonicQuotient (Q : Polynomial A) (F : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk fun n => ∑' k : ℕ, F.coeff (n + Q.natDegree + k) *
    (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k

omit [NormOneClass A] [CompleteSpace A] [Nontrivial A] in
/-- §4.3: the coefficient is the total sum `Σ_k coeff_{n+d+k}(F)·b_k`. -/
theorem entireMonicQuotient_coeff (Q : Polynomial A) (F : PowerSeries A) (n : ℕ) :
    (entireMonicQuotient Q F).coeff n = ∑' k : ℕ, F.coeff (n + Q.natDegree + k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k :=
  PowerSeries.coeff_mk _ _

/-- §4.3: the supplied entire quotient and truncation remainder agree with native polynomial division. -/
theorem entireMonicQuotient_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (P : Polynomial A) :
    entireMonicQuotient Q (P : PowerSeries A) = ((P /ₘ Q : Polynomial A) : PowerSeries A) ∧
    PowerSeries.trunc Q.natDegree
      ((P : PowerSeries A) - (Q : PowerSeries A) * entireMonicQuotient Q (P : PowerSeries A)) =
      P %ₘ Q := by sorry

/-- §4.3: the supplied quotient by `T − a` agrees with the linear-tail realization. -/
theorem entireMonicQuotient_linear (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    entireMonicQuotient (Polynomial.X - Polynomial.C a) F = entireLinearQuotient a F := by sorry

/-- §4.3 check `monic_supplier_one`: division by one returns the original formal series. -/
example (F : PowerSeries A) : entireMonicQuotient 1 F = F := by sorry

/-- §4.3 check `monic_supplier_quadratic`: monic quadratic division has its full remainder. -/
example (a b : A) :
    let Q : Polynomial A := Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b
    entireMonicQuotient Q (PowerSeries.X ^ 3) = PowerSeries.X - PowerSeries.C a ∧
    PowerSeries.X ^ 3 - (Q : PowerSeries A) * entireMonicQuotient Q (PowerSeries.X ^ 3) =
      PowerSeries.C (a ^ 2 - b) * PowerSeries.X + PowerSeries.C (a * b) := by sorry

/-- §4.3 check `monic_polynomial_nilpotent`: a square-zero root has zero quadratic remainder. -/
example (e : A) (he : e ^ 2 = 0) :
    entireMonicQuotient (Polynomial.X - Polynomial.C e) (PowerSeries.X ^ 2) =
      PowerSeries.X + PowerSeries.C e ∧
    PowerSeries.X ^ 2 - ((Polynomial.X - Polynomial.C e : Polynomial A) : PowerSeries A) *
      entireMonicQuotient (Polynomial.X - Polynomial.C e) (PowerSeries.X ^ 2) = 0 := by sorry

/-- §4.3 check `monic_polynomial_low_degree`: low-degree inputs have zero quotient. -/
example (Q P : Polynomial A) (hQ : Q.Monic) (hP : P.degree < Q.degree) :
    entireMonicQuotient Q (P : PowerSeries A) = 0 ∧ P %ₘ Q = P := by sorry

/-- §4.3 check `monic_coeff_X`: the native quotient by `X` shifts coefficients. -/
example (F : PowerSeries A) (n : ℕ) :
    (entireMonicQuotient Polynomial.X F).coeff n = F.coeff (n + 1) := by sorry

/-- §4.3 check `monic_coeff_constant`: a constant input has zero quotient for a
positive-degree monic divisor. -/
example (Q : Polynomial A) (hQ : Q.Monic) (hdeg : 0 < Q.natDegree) (a : A) :
    entireMonicQuotient Q (PowerSeries.C a) = 0 := by sorry

end MonicDivision

end NonarchimedeanFredholm

/-! ### §4.5 Hasse derivatives of power series -/

namespace NonarchimedeanFredholm

section HasseFormal

variable {B : Type*} [Semiring B]

/-- Signature stand-in for RestrictedPowerSeries §2.3: the semiring Hasse derivative,
whose coefficient n is `binom(n+s,s) • coeff_{n+s} f`. The ordered product rule and polynomial
comparison are supplied there without inverse factorials. -/
def hasseSeries (s : ℕ) (f : PowerSeries B) : PowerSeries B :=
  PowerSeries.mk fun n => (n + s).choose s • f.coeff (n + s)

/-- Convention 13 check `hasse_characteristic_two`: the second Hasse derivative of `X²`
is one in characteristic two, while its second ordinary derivative is zero. -/
example : hasseSeries 2 (PowerSeries.X ^ 2 : PowerSeries (ZMod 2)) = 1 ∧
    PowerSeries.derivative (PowerSeries.derivative
      (PowerSeries.X ^ 2 : PowerSeries (ZMod 2))) = 0 := by sorry

end HasseFormal

/-- §4.5: Hasse derivatives preserve every-radius restrictedness over any normed ring,
including noncommutative coefficients, without completeness or ultrametricity. -/
theorem hasseSeries_entire {B : Type*} [NormedRing B] (f : PowerSeries B)
    (hf : ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f) (s : ℕ) (R : ℝ) (hR : 0 < R) :
    PowerSeries.IsRestricted R (hasseSeries s f) := by sorry

end NonarchimedeanFredholm

/-! ### §4.9–§4.11 The finite spectral transform and reciprocal resultants -/

namespace NonarchimedeanFredholm

section FiniteSpectral

open Polynomial

variable {A S : Type*} [CommRing A] [CommRing S]

/-- §4.9 (Monic reversal of a normalized polynomial). -/
theorem spectralReversal_monic [Nontrivial A] (P : A[X]) (n : ℕ)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    (P.reflect n).Monic ∧ (P.reflect n).natDegree = n := by sorry

/-- Signature stand-in for CompactOperators §3.3 (**Prescribed finite rank**,
`colemanDBounded`):
`D_{n,m}(B, P)` is the bounded resultant over `A[T]` of `Q_n = reflect_n P` and `1 − T·B(Y)`. -/
def polynomialSpectralResultant (n m : ℕ) (B P : A[X]) : A[X] :=
  Polynomial.resultant ((P.reflect n).map Polynomial.C)
    (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m

/-- §4.9 (Specializing the spectral parameter). -/
theorem polynomialSpectralResultant_eval (n m : ℕ) (B P : A[X]) (t : A) :
    (polynomialSpectralResultant n m B P).eval t =
      Polynomial.resultant (P.reflect n) (1 - Polynomial.C t * B) n m := by sorry

/-- §4.9 (Normalization of the finite transform). -/
theorem polynomialSpectralResultant_constantCoeff (n m : ℕ) (B P : A[X]) (hP : P.coeff 0 = 1) :
    (polynomialSpectralResultant n m B P).coeff 0 = 1 := by sorry

/-- §4.9 (A single polynomial eigenvalue). -/
theorem polynomialSpectralResultant_linear (m : ℕ) (B : A[X]) (a : A) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant 1 m B (1 - Polynomial.C a * Polynomial.X) =
      1 - Polynomial.C (B.eval a) * Polynomial.X := by sorry

/-- §4.9: fixed-bound coefficient maps over arbitrary commutative rings, without normalization,
degree or boundedness hypotheses, extending CompactOperators §3.3's bounded-map interface. -/
theorem polynomialSpectralResultant_map (f : A →+* S) (n m : ℕ) (B P : A[X]) :
    (polynomialSpectralResultant n m B P).map f =
      polynomialSpectralResultant n m (B.map f) (P.map f) := by sorry


/-- §4.9 (Finite spectral transform as a native algebra norm). -/
theorem polynomialSpectralResultant_norm (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P = Algebra.norm A[X]
      (AdjoinRoot.mk ((P.reflect n).map Polynomial.C)
        (1 - Polynomial.C Polynomial.X * B.map Polynomial.C)) := by sorry

/-- §4.9 (The finite root-product formula), with repetitions and zero roots allowed. -/
theorem polynomialSpectralResultant_split {ι : Type*} (s : Finset ι) (a : ι → A)
    (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant s.card m B (∏ i ∈ s, (1 - Polynomial.C (a i) * Polynomial.X)) =
      ∏ i ∈ s, (1 - Polynomial.C (B.eval (a i)) * Polynomial.X) := by sorry

/-- §4.10: fixed-rank reflection and the bounded resultant give the supplied characteristic
spectral mapping formula over every commutative ring. -/
theorem polynomialSpectralResultant_charpolyRev {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : Matrix ι ι A) (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev =
      (Polynomial.aeval M B).charpolyRev := by sorry

/-- §4.10: the fixed-rank resultant comparison specializes to upper triangular matrices. -/
theorem polynomialSpectralResultant_charpolyRev_of_isUpperTriangular {ι : Type*} [Fintype ι]
    [DecidableEq ι] [LinearOrder ι] {M : Matrix ι ι A} (hM : M.IsUpperTriangular)
    (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev =
      (Polynomial.aeval M B).charpolyRev := by sorry

/-- §4.11 (Reciprocal resultant with swapped factors; Coleman (9), p. 434). -/
theorem resultant_reflect_swap (f g : A[X]) (m n : ℕ) :
    Polynomial.resultant (f.reflect m) (g.reflect n) m n = Polynomial.resultant g f n m := by sorry

/-- §4.11 (Finite reciprocal spectral evaluation). -/
theorem polynomialSpectralResultant_one_sub_reverse_eval
    (Q P : A[X]) (hQ : Q.Monic) (n : ℕ) (hP : P.natDegree ≤ n) :
    (polynomialSpectralResultant n Q.natDegree (1 - Q.reverse) P).eval 1 =
      Polynomial.resultant Q P Q.natDegree P.natDegree := by sorry

end FiniteSpectral

/-- §4.10 check `constant_operator` (non-example): the matrix rank, not `deg P_M`, is the bound. -/
example : polynomialSpectralResultant 2 0 (1 : Polynomial ℤ)
    (0 : Matrix (Fin 2) (Fin 2) ℤ).charpolyRev = (1 - Polynomial.X) ^ 2 := by sorry

/-- §4.11 check `linear_sign`: `D_{1,1}(3T, 1 − 2T)(1) = −5`. -/
example : (polynomialSpectralResultant 1 1 (Polynomial.C 3 * Polynomial.X)
    (1 - Polynomial.C 2 * Polynomial.X : Polynomial ℤ)).eval 1 = -5 := by sorry

/-- §4.11 check `unnormalized` (non-example): without `P(0) = 1` the auxiliary bound matters. -/
example : (polynomialSpectralResultant 0 2 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 4 ∧
    (polynomialSpectralResultant 0 0 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 1 := by sorry

/-- §4.9–§4.10 check `empty_matrix`: rank zero gives the unit transform. -/
example : polynomialSpectralResultant 0 0 (1 : Polynomial ℤ) (1 : Polynomial ℤ) = 1 := by sorry

/-- §4.10 checks `jordan_transform`, `jordan_aeval`: the fixed-rank transform retains a repeated root and
nilpotent off-diagonal entry over `ZMod 8`. -/
example :
    let J : Matrix (Fin 2) (Fin 2) (ZMod 8) := !![2, 1; 0, 2]
    let B : Polynomial (ZMod 8) := Polynomial.X + Polynomial.X ^ 2
    polynomialSpectralResultant 2 2 B J.charpolyRev =
      1 + Polynomial.C 4 * Polynomial.X + Polynomial.C 4 * Polynomial.X ^ 2 ∧
    Polynomial.aeval J B = !![6, 5; 0, 6] := by sorry

/-- §4.11 check `unit_divisor`: a zero functional polynomial gives scalar resultant one. -/
example (n : ℕ) (P : Polynomial ℤ) :
    (polynomialSpectralResultant n 0 0 P).eval 1 = 1 := by sorry

/-- §4.11 check `padding`: fixed-rank reflection preserves the reciprocal scalar value. -/
example : (polynomialSpectralResultant 5 1 (Polynomial.C 2 * Polynomial.X)
    (1 + Polynomial.X ^ 2 : Polynomial (ZMod 8))).eval 1 = 5 := by sorry

/-- §4.14 check `spectralStabilization_quadratic`: the linear transform coefficient for
squaring is the second Newton power-sum expression. -/
example {A : Type*} [CommRing A] (N : ℕ) (hN : 2 ≤ N) (P : Polynomial A)
    (hP : P.coeff 0 = 1) (hdeg : P.natDegree ≤ N) :
    (polynomialSpectralResultant N 2 (Polynomial.X ^ 2) P).coeff 1 =
      2 * P.coeff 2 - (P.coeff 1) ^ 2 := by sorry

section EntireResultantLimit

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.11 check `linear_limit`: for `Q = T − a` the scalar limit is the evaluation `F(a)`. -/
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n 1
      (Polynomial.C a * Polynomial.X) (PowerSeries.trunc (n + 1) F)).eval 1)
      atTop (𝓝 (entireEval F a)) := by sorry

end EntireResultantLimit

end NonarchimedeanFredholm

/-! ### §4.12–§4.13 Gauss convergence and the spectral transform with entire input -/

namespace NonarchimedeanFredholm

section Gauss

variable {A : Type*} [NormedCommRing A]

/-- §4.12 (Bounded coefficient limits converge in Gauss norms). -/
theorem tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, PowerSeries.gaussNorm norm S (F i) ≤ C)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) atTop (𝓝 0) := by sorry

/-- §4.12 (Uniform evaluation of a Gauss limit): RestrictedPowerSeries §2.1's evaluation
bound gives uniform convergence on the closed ball of positive radius `R`. -/
theorem tendstoUniformlyOn_entireEval_of_gauss [CompleteSpace A]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    {ι : Type*} (l : Filter ι) (F : ι → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (f : PowerSeries A) (hf : IsEntire f) (R : ℝ) (hR : 0 < R)
    (hlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) l (𝓝 0)) :
    TendstoUniformlyOn (fun i a => entireEval (F i) a) (entireEval f) l {a : A | ‖a‖ ≤ R} := by
  sorry

/-- §4.12 (Multiplication of Gauss limits). -/
theorem tendsto_gaussNorm_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (F H : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (hH : ∀ i, IsEntire (H i))
    (f h : PowerSeries A) (hf : IsEntire f) (hh : IsEntire h) (R : ℝ) (hR : 0 < R)
    (hFlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) atTop (𝓝 0))
    (hHlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (H i - h)) atTop (𝓝 0)) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R (F i * H i - f * h)) atTop (𝓝 0) := by sorry

/-- §4.12 check `moving_monomials` (non-example): coefficientwise convergence to zero with Gauss
norm and value at `1` constantly one. -/
example [NormOneClass A] :
    (∀ k : ℕ, Tendsto (fun N : ℕ => (PowerSeries.monomial N (1 : A)).coeff k) atTop (𝓝 0)) ∧
    (∀ N : ℕ, PowerSeries.gaussNorm norm 1 (PowerSeries.monomial N (1 : A)) = 1) ∧
    (∀ N : ℕ, entireEval (PowerSeries.monomial N (1 : A)) 1 = 1) := by sorry

/-- §4.12 check `nilpotent_product` (non-example): Gauss norms are not multiplicative. -/
example (e : A) (he : e ^ 2 = 0) (hne : e ≠ 0) (R : ℝ) (hR : 0 < R) :
    let f := PowerSeries.monomial 1 e
    PowerSeries.gaussNorm norm R (f * f) = 0 ∧
      0 < PowerSeries.gaussNorm norm R f * PowerSeries.gaussNorm norm R f := by sorry

/-- §4.12 check `EntireGaussTests.native_polynomial`: polynomial inclusion has its finite
coefficient maximum as the native Gauss norm. -/
example (P : Polynomial A) (R : ℝ) (hR : 0 ≤ R) :
    PowerSeries.gaussNorm norm R (P : PowerSeries A) =
      sSup ((fun n : ℕ => ‖P.coeff n‖ * R ^ n) ''
        (↑(Finset.range (P.natDegree + 1)) : Set ℕ)) := by sorry

/-- §4.12 check `EntireGaussTests.tail_boundary`: truncation at the monomial degree removes
no part of that monomial. -/
example (a : A) (N : ℕ) (R : ℝ) (hR : 0 < R) :
    let F := PowerSeries.monomial N a
    PowerSeries.trunc N F = 0 ∧
    PowerSeries.gaussNorm norm R (F - (PowerSeries.trunc N F : PowerSeries A)) = ‖a‖ * R ^ N := by
  sorry

/-- §4.12 check `EntireGaussTests.zero_truncation`: the degree-zero truncation is zero. -/
example (F : PowerSeries A) (R : ℝ) :
    PowerSeries.trunc 0 F = 0 ∧
    PowerSeries.gaussNorm norm R (F - (PowerSeries.trunc 0 F : PowerSeries A)) =
      PowerSeries.gaussNorm norm R F := by sorry

/-- §4.12 check `EntireGaussTests.radius_loss`: exact norms of moving monomials distinguish
small-radius convergence from large-radius boundedness. -/
example [NormOneClass A] (N : ℕ) :
    PowerSeries.gaussNorm norm (1 / 2) (PowerSeries.monomial N (1 : A)) = (1 / 2 : ℝ) ^ N ∧
    PowerSeries.gaussNorm norm 2 (PowerSeries.monomial N (1 : A)) = (2 : ℝ) ^ N := by sorry

end Gauss

section FixedCharacteristic

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.13 (Spectral transform with entire functional input and fixed polynomial input):
`E_n(B, P) = D_{n,n}(R_{Q_n}(B), P)`, using the entire monic remainder modulo `Q_n = reflect_n P`. -/
def entirePolynomialSpectral (n : ℕ) (B : PowerSeries A) (P : Polynomial A) : Polynomial A :=
  polynomialSpectralResultant n n
    (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) * entireMonicQuotient (P.reflect n) B)) P

omit [NormOneClass A] [CompleteSpace A] [Nontrivial A] in
/-- §4.13: the defining formula. -/
theorem entirePolynomialSpectral_def (n : ℕ) (B : PowerSeries A) (P : Polynomial A) :
    entirePolynomialSpectral n B P = polynomialSpectralResultant n n
      (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) *
        entireMonicQuotient (P.reflect n) B)) P := rfl

/-- §4.13: for `P(0) = 1` the constant coefficient is `1`. -/
theorem entirePolynomialSpectral_constantCoeff (n : ℕ) (B : PowerSeries A) (P : Polynomial A)
    (hP : P.coeff 0 = 1) : (entirePolynomialSpectral n B P).coeff 0 = 1 := by sorry

/-- §4.13: for normalized `P` of degree at most `n`, `E_n(0, P) = 1`. -/
theorem entirePolynomialSpectral_zero (n : ℕ) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) : entirePolynomialSpectral n 0 P = 1 := by sorry

/-- §4.13 (Agreement with the polynomial spectral construction). -/
theorem entirePolynomialSpectral_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n m : ℕ) (B P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n)
    (hm : B.natDegree ≤ m) :
    entirePolynomialSpectral n (B : PowerSeries A) P = polynomialSpectralResultant n m B P := by
  sorry

/-- §4.13 (All-radius Gauss convergence at fixed characteristic rank). -/
theorem tendsto_spectral_fixed_polynomial_gauss (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant n N (PowerSeries.trunc (N + 1) B) P -
        entirePolynomialSpectral n B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := by sorry

/-- §4.13 (Simultaneous truncation convergence for polynomial characteristic input). -/
theorem tendsto_spectral_simultaneous_fixed_polynomial_gauss
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant N N (PowerSeries.trunc (N + 1) B)
        (PowerSeries.trunc (N + 1) (P : PowerSeries A)) -
        entirePolynomialSpectral P.natDegree B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := by
  sorry

/-- §4.13 (The exact zero-root padding law for entire functional input). -/
theorem entirePolynomialSpectral_padding (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral (n + 1) B P =
      entirePolynomialSpectral n B P * (1 - Polynomial.C (B.coeff 0) * Polynomial.X) := by sorry

/-- §4.13 (Factor products for polynomial characteristic inputs). -/
theorem entirePolynomialSpectral_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n k : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P Q : Polynomial A)
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1) (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) :
    entirePolynomialSpectral (n + k) B (P * Q) =
      entirePolynomialSpectral n B P * entirePolynomialSpectral k B Q := by sorry

/-- §4.13 (Linear characteristic input evaluates the entire function). -/
theorem entirePolynomialSpectral_linear (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (B : PowerSeries A) (hB : IsEntire B) (a : A) :
    entirePolynomialSpectral 1 B (1 - Polynomial.C a * Polynomial.X) =
      1 - Polynomial.C (entireEval B a) * Polynomial.X := by sorry

/-- §4.13 check `constant_padding` (non-example): `E_2(c, 1) = (1 − cT)²`. -/
example (c : A) : entirePolynomialSpectral 2 (PowerSeries.C c) 1 =
    (1 - Polynomial.C c * Polynomial.X) ^ 2 := by sorry

/-- §4.13 check `nilpotent_coefficients`: `E_2(T, 1 − eT²) = 1 − eT²` for `e² = 0`. -/
example (e : A) (he : e ^ 2 = 0) :
    entirePolynomialSpectral 2 (PowerSeries.X : PowerSeries A) (1 - Polynomial.C e * Polynomial.X ^ 2) =
      1 - Polynomial.C e * Polynomial.X ^ 2 := by sorry

/-- §4.13 check `empty_rank`: rank zero has unit entire-polynomial transform. -/
example (B : PowerSeries A) : entirePolynomialSpectral 0 B 1 = 1 := by sorry

/-- §4.13 check `zero_function`: normalized bounded-rank input and zero functional input
give the unit transform. -/
example (n : ℕ) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral n 0 P = 1 := by sorry

/-- §4.13 check `unit_input_zero_constant`: zero constant coefficient annihilates the
padded zero roots of the unit characteristic input. -/
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0) :
    entirePolynomialSpectral n B 1 = 1 := by sorry

end FixedCharacteristic

end NonarchimedeanFredholm

/-! ### §4.15 Affinoid-valued stages and their duals -/

namespace AnalyticDistributions

section StageDuals

variable {K : Type*} [NontriviallyNormedField K]
variable {I : Type*} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
variable {A : Type*} [NormedCommRing A]

/-- §4.15 (Affinoid-valued Banach-stage distributions): a continuous `A`-linear functional on
`C₀(I, A)` is determined by its basis values. -/
theorem stageDual_ext [CompleteSpace A] (μ ν : C₀(I, A) →L[A] A)
    (h : ∀ i, μ (NonarchimedeanFredholm.c0Single i (1 : A)) =
      ν (NonarchimedeanFredholm.c0Single i (1 : A))) : μ = ν := by sorry

/-- §4.15 check `distributionStage_bounded_not_c0` (non-example): over an ultrametric field the
coefficient-sum functional has basis values constantly one, a family that is not `c₀`. -/
example [CompleteSpace K] [IsUltrametricDist K] : ∃ μ : C₀(ℕ, K) →L[K] K,
    (∀ n, μ (NonarchimedeanFredholm.c0Single n (1 : K)) = 1) ∧ ¬ ∃ f : C₀(ℕ, K), ∀ n, f n = 1 := by
  sorry

/-- §4.15 check, continued: over `ℝ` no continuous functional has value one on every basis vector. -/
example : ¬ ∃ μ : C₀(ℕ, ℝ) →L[ℝ] ℝ, ∀ n, μ (NonarchimedeanFredholm.c0Single n (1 : ℝ)) = 1 := by
  sorry

variable [NormedAlgebra K A]

/-- §4.15 (Integral distribution lattices): the stage-dual norm unit ball, tied to the chosen
Banach model. -/
def familyIntegralLattice : Set (C₀(I, A) →L[A] A) :=
  {μ | ‖μ.restrictScalars K‖ ≤ 1}

omit [DiscreteTopology I] [DecidableEq I] in
/-- §4.15: membership is the norm bound `≤ 1`. -/
theorem familyIntegralLattice_mem (μ : C₀(I, A) →L[A] A) :
    μ ∈ familyIntegralLattice (K := K) ↔ ‖μ.restrictScalars K‖ ≤ 1 := Iff.rfl

/-- §4.15: multiplication by `a` with `‖a‖ ≤ 1` preserves the lattice. -/
theorem familyIntegralLattice_smul (a : A) (ha : ‖a‖ ≤ 1) (μ : C₀(I, A) →L[A] A)
    (hμ : μ ∈ familyIntegralLattice (K := K)) : a • μ ∈ familyIntegralLattice (K := K) := by sorry

/-- §4.15 check `integralLattice_point`: at a point, multiplication by `a` lies in the lattice iff
`‖a‖ ≤ 1`. -/
example [NormOneClass A] (a : A) (μ : C₀(PUnit, A) →L[A] A) (hμ : ∀ f, μ f = a * f PUnit.unit) :
    μ ∈ familyIntegralLattice (K := K) ↔ ‖a‖ ≤ 1 := by sorry

/-- §4.15 check `integralLattice_zero`: the zero functional belongs to the norm unit ball. -/
example : (0 : C₀(I, A) →L[A] A) ∈ familyIntegralLattice (K := K) := by sorry

end StageDuals

/-- §4.15 check `integralLattice_boundary`: multiplication by `3⁻¹` exceeds the unit ball. -/
example (μ : C₀(PUnit, ℚ_[3]) →L[ℚ_[3]] ℚ_[3])
    (hμ : ∀ f, μ f = (3 : ℚ_[3])⁻¹ * f PUnit.unit) :
    μ ∉ familyIntegralLattice (K := ℚ_[3]) := by sorry

section OneDiscModels

variable {A : Type*} [NormedCommRing A]

/-- §4.15: dilation multiplies coefficient `n` by `aⁿ`, giving pullback along `z ↦ az`. -/
def analyticStageDilate (a : A) (ha : ‖a‖ ≤ 1) : C₀(ℕ, A) →L[A] C₀(ℕ, A) where
  toFun f :=
    { toFun := fun n => a ^ n * f n
      continuous_toFun := continuous_of_discreteTopology
      zero_at_infty' := by sorry }
  map_add' := by sorry
  map_smul' := by sorry
  cont := by sorry

/-- §4.15: the `n`th dilation coefficient is `aⁿ f_n`. -/
theorem analyticStageDilate_coeff (a : A) (ha : ‖a‖ ≤ 1) (f : C₀(ℕ, A)) (n : ℕ) :
    analyticStageDilate a ha f n = a ^ n * f n := rfl

/-- §4.15: successive dilations multiply their parameters. -/
theorem analyticStageDilate_comp (a b : A) (ha : ‖a‖ ≤ 1) (hb : ‖b‖ ≤ 1)
    (hab : ‖a * b‖ ≤ 1) :
    (analyticStageDilate a ha).comp (analyticStageDilate b hb) = analyticStageDilate (a * b) hab := by
  sorry

variable [CompleteSpace A] [IsUltrametricDist A]

/-- §4.15: evaluation is the convergent coefficient sum at a point in the closed unit disc. -/
def analyticStageEvaluate (x : A) (hx : ‖x‖ ≤ 1) : C₀(ℕ, A) →L[A] A where
  toFun f := ∑' n : ℕ, f n * x ^ n
  map_add' := by sorry
  map_smul' := by sorry
  cont := by sorry

/-- §4.15: the coefficient expansion converges to the stage evaluation. -/
theorem analyticStageEvaluate_hasSum (x : A) (hx : ‖x‖ ≤ 1) (f : C₀(ℕ, A)) :
    HasSum (fun n : ℕ => f n * x ^ n) (analyticStageEvaluate x hx f) := by sorry

/-- §4.15: a single coefficient evaluates to its monomial value. -/
theorem analyticStageEvaluate_basis (x : A) (hx : ‖x‖ ≤ 1) (n : ℕ) (c : A) :
    analyticStageEvaluate x hx (NonarchimedeanFredholm.c0Single n c) = c * x ^ n := by sorry

/-- §4.15: evaluation after dilation evaluates at the dilated point. -/
theorem analyticStageEvaluate_dilate (x a : A) (hx : ‖x‖ ≤ 1) (ha : ‖a‖ ≤ 1)
    (hax : ‖a * x‖ ≤ 1) (f : C₀(ℕ, A)) :
    analyticStageEvaluate x hx (analyticStageDilate a ha f) = analyticStageEvaluate (a * x) hax f := by
  sorry

/-- §4.15: the constant-multiplier action is the transpose of multiplier times dilation. -/
def analyticStageConstantTranspose (a : A) (ha : ‖a‖ ≤ 1) (j : A)
    (μ : C₀(ℕ, A) →L[A] A) : C₀(ℕ, A) →L[A] A :=
  (j • μ).comp (analyticStageDilate a ha)

variable {B : Type*} [NormedCommRing B] [CompleteSpace B] [IsUltrametricDist B]

/-- §4.15: specialize analytic coefficients along a bounded ring homomorphism. -/
def analyticStageSpecialization {I : Type*} [TopologicalSpace I] [DiscreteTopology I]
    (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (f : C₀(I, A)) : C₀(I, B) where
  toFun n := η (f n)
  continuous_toFun := continuous_of_discreteTopology
  zero_at_infty' := by sorry

/-- §4.15: uniformly bounded dual coefficients give a summable specialized pairing. -/
theorem familySpecialization_summable (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M)
    (f : C₀(ℕ, B)) :
    Summable (fun n : ℕ => f n * η (μ (NonarchimedeanFredholm.c0Single n 1))) := by sorry

/-- §4.15: the specialized pairing has the uniform bound `C * M`. -/
theorem familySpecialization_sum_norm_le (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M)
    (f : C₀(ℕ, B)) :
    ‖∑' n : ℕ, f n * η (μ (NonarchimedeanFredholm.c0Single n 1))‖ ≤ (C * M) * ‖f‖ := by sorry

/-- §4.15: specialize dual basis values with an explicit uniform bound and extend their pairing
continuously to the new analytic stage. -/
def familySpecialization (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M) :
    C₀(ℕ, B) →L[B] B where
  toFun f := ∑' n : ℕ, f n * η (μ (NonarchimedeanFredholm.c0Single n 1))
  map_add' := by sorry
  map_smul' := by sorry
  cont := by sorry

/-- §4.15: specialization maps each bounded dual basis value by the coefficient homomorphism. -/
theorem familySpecialization_coeff (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M) (n : ℕ) :
    familySpecialization η C hC hη μ M hM hμ (NonarchimedeanFredholm.c0Single n 1) =
      η (μ (NonarchimedeanFredholm.c0Single n 1)) := by sorry

/-- §4.15: the specialized dual coefficients have uniform bound `C * M`. -/
theorem familySpecialization_coeff_bound (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M) :
    ∀ n, ‖familySpecialization η C hC hη μ M hM hμ
      (NonarchimedeanFredholm.c0Single n 1)‖ ≤ C * M := by sorry

/-- §4.15: successive coefficient specializations compose with the transported bound `Cη * M`. -/
theorem familySpecialization_comp
    {D : Type*} [NormedCommRing D] [CompleteSpace D] [IsUltrametricDist D]
    (η : A →+* B) (θ : B →+* D) (Cη Cθ : ℝ) (hCη : 0 ≤ Cη) (hCθ : 0 ≤ Cθ)
    (hη : ∀ a, ‖η a‖ ≤ Cη * ‖a‖) (hθ : ∀ b, ‖θ b‖ ≤ Cθ * ‖b‖)
    (hθη : ∀ a, ‖θ (η a)‖ ≤ (Cθ * Cη) * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M) :
    familySpecialization θ Cθ hCθ hθ (familySpecialization η Cη hCη hη μ M hM hμ)
        (Cη * M) (mul_nonneg hCη hM) (familySpecialization_coeff_bound η Cη hCη hη μ M hM hμ) =
      familySpecialization (θ.comp η) (Cθ * Cη) (mul_nonneg hCθ hCη) hθη μ M hM hμ := by sorry

/-- §4.15: evaluation of the bounded specialization agrees with specialization of the value. -/
theorem familySpecialization_eval (η : A →+* B) (C : ℝ) (hC : 0 ≤ C)
    (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M)
    (f : C₀(ℕ, A)) :
    familySpecialization η C hC hη μ M hM hμ (analyticStageSpecialization η C hC hη f) = η (μ f) := by
  sorry

/-- §4.15 check `specialization_identity`: the identity ring map fixes analytic coefficients
and stage functionals with a specified uniform coefficient bound. -/
example (f : C₀(ℕ, A)) (μ : C₀(ℕ, A) →L[A] A)
    (M : ℝ) (hM : 0 ≤ M) (hμ : ∀ n, ‖μ (NonarchimedeanFredholm.c0Single n 1)‖ ≤ M) :
    analyticStageSpecialization (RingHom.id A) 1 (by norm_num) (by intro a; simp) f = f ∧
    familySpecialization (RingHom.id A) 1 (by norm_num) (by intro a; simp) μ M hM hμ = μ := by sorry

/-- §4.15 check `specialization_discreteRing`: vanishing scalars whose prescribed images are one
obstruct any continuous extension of the specialized dual coefficients. -/
example [Nontrivial B] (η : A →+* B) (μ : C₀(ℕ, A) →L[A] A) (c : ℕ → B)
    (hc : Tendsto c atTop (𝓝 0))
    (hprod : ∀ n, c n * η (μ (NonarchimedeanFredholm.c0Single n 1)) = 1) :
    ¬ ∃ ν : C₀(ℕ, B) →L[B] B, ∀ n,
      ν (NonarchimedeanFredholm.c0Single n 1) =
        η (μ (NonarchimedeanFredholm.c0Single n 1)) := by sorry

/-- §4.15 check `specialization_single`: arbitrary discrete coefficient indices are preserved. -/
example {I : Type*} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
    (η : A →+* B) (C : ℝ) (hC : 0 ≤ C) (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖) (i : I) (a : A) :
    analyticStageSpecialization η C hC hη (NonarchimedeanFredholm.c0Single i a) =
      NonarchimedeanFredholm.c0Single i (η a) := by sorry

/-- §4.15 check `specialization_empty`: the actual coefficient map on an empty chart is zero. -/
example (η : A →+* B) (C : ℝ) (hC : 0 ≤ C) (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖)
    (f : C₀(Empty, A)) : analyticStageSpecialization η C hC hη f = 0 := by sorry

/-- §4.15 check `specialization_atom`: the actual stage specialization maps a weighted
point evaluation to the corresponding specialized point evaluation. -/
example (η : A →+* B) (C : ℝ) (hC : 0 ≤ C) (hη : ∀ a, ‖η a‖ ≤ C * ‖a‖)
    (a x : A) (hx : ‖x‖ ≤ 1) (hηx : ‖η x‖ ≤ 1) :
    familySpecialization η C hC hη (a • analyticStageEvaluate x hx)
        ‖a‖ (norm_nonneg _) (by sorry) =
      η a • analyticStageEvaluate (η x) hηx := by sorry

/-- §4.15 check `specialization_two_factors`: the two actual coefficient projections
select different bounded dual values. -/
example :
    let μ : C₀(ℕ, ℚ_[3] × ℚ_[3]) →L[ℚ_[3] × ℚ_[3]] (ℚ_[3] × ℚ_[3]) :=
      { toFun := fun f => (1, 2) * f 0 + (3, 4) * f 1
        map_add' := by sorry
        map_smul' := by sorry
        cont := by sorry }
    let f := NonarchimedeanFredholm.c0Single 0 (1 : ℚ_[3]) +
      NonarchimedeanFredholm.c0Single 1 (5 : ℚ_[3])
    familySpecialization (AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num)
      (by intro a; simpa using norm_snd_le a) μ 1 (by norm_num) (by sorry) f = 22 ∧
    familySpecialization (AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num)
      (by intro a; simpa using norm_fst_le a) μ 1 (by norm_num) (by sorry) f = 16 := by sorry

/-- §4.15 check `specialization_two_factors`, infinite family: bounded constant dual
coefficients act on a genuinely decaying analytic vector. -/
example :
    let μ := ((1, 2) : ℚ_[3] × ℚ_[3]) •
      analyticStageEvaluate (1 : ℚ_[3] × ℚ_[3]) (by simp)
    let f : C₀(ℕ, ℚ_[3]) :=
      { toFun := fun n => (3 : ℚ_[3]) ^ n
        continuous_toFun := continuous_of_discreteTopology
        zero_at_infty' := by sorry }
    familySpecialization (AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num)
      (by intro a; simpa using norm_snd_le a) μ 1 (by norm_num) (by sorry) f = -1 ∧
    familySpecialization (AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num)
      (by intro a; simpa using norm_fst_le a) μ 1 (by norm_num) (by sorry) f = -1 / 2 := by sorry

/-- §4.15 check `stageDilate_unit`: unit dilation is identity. -/
example (f : C₀(ℕ, A)) (h : ‖(1 : A)‖ ≤ 1) : analyticStageDilate 1 h f = f := by sorry

/-- §4.15 check `stageDilate_zero`: zero dilation retains the constant coefficient. -/
example (f : C₀(ℕ, A)) : analyticStageDilate 0 (by simp) f =
    NonarchimedeanFredholm.c0Single 0 (f 0) := by sorry

/-- §4.15 check `stageDilate_quadratic`: the quadratic coefficient scales by the square. -/
example (a : A) (ha : ‖a‖ ≤ 1) :
    analyticStageDilate a ha (NonarchimedeanFredholm.c0Single 2 (1 : A)) =
      NonarchimedeanFredholm.c0Single 2 (a ^ 2) := by sorry

/-- §4.15 check `stageEvaluate_zero`: evaluation at zero is the constant coefficient. -/
example (f : C₀(ℕ, A)) : analyticStageEvaluate 0 (by simp) f = f 0 := by sorry

/-- §4.15 check `stageEvaluate_quadratic`: the quadratic basis evaluates at the boundary too. -/
example [NormOneClass A] : analyticStageEvaluate 1 (by simp)
    (NonarchimedeanFredholm.c0Single 2 (1 : A)) = 1 := by sorry

/-- §4.15 check `stageEvaluate_zeroFunction`: zero evaluates to zero. -/
example (x : A) (hx : ‖x‖ ≤ 1) : analyticStageEvaluate x hx 0 = 0 := by sorry

end OneDiscModels

/-- §4.15 check `coefficientAction_wrongScalar`: the actual transpose and specialization give
second-fibre value `189` and first-fibre value `90` on the quadratic coefficient vector. -/
example (hd : ‖((3, 3) : ℚ_[3] × ℚ_[3])‖ ≤ 1)
    (hs : ∀ a : ℚ_[3] × ℚ_[3], ‖(AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]) a‖ ≤ 1 * ‖a‖)
    (hf : ∀ a : ℚ_[3] × ℚ_[3], ‖(AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]) a‖ ≤ 1 * ‖a‖) :
    let μ := ((5, 7) : ℚ_[3] × ℚ_[3]) • analyticStageEvaluate (1 : ℚ_[3] × ℚ_[3]) (by simp)
    let acted := analyticStageConstantTranspose (3, 3) hd (2, 3) μ
    let quadratic := NonarchimedeanFredholm.c0Single 2 (1 : ℚ_[3] × ℚ_[3])
    familySpecialization (AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num) hs acted
        1 (by norm_num) (by sorry)
        (analyticStageSpecialization (AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom
          1 (by norm_num) hs quadratic) = 189 ∧
    familySpecialization (AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom 1 (by norm_num) hf acted
        1 (by norm_num) (by sorry)
        (analyticStageSpecialization (AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]).toRingHom
          1 (by norm_num) hf quadratic) = 90 := by sorry

/-! ### §4.16 Banach complexes -/

/-- §4.16: logarithmic valuation `log t / log q` with `0 < q < 1` is at most `h` exactly
when the nonzero eigenvalue norm `t` is at least `q ^ h`, including equality. -/
theorem numericalSlope_norm_iff (q t h : ℝ) (hq : 0 < q) (hq1 : q < 1) (ht : 0 < t) :
    Real.log t / Real.log q ≤ h ↔ q ^ h ≤ t := by sorry

/-- §4.16 check `slope_endpoint`: for `q = |p|`, the eigenvalue `p` lies at slope one. -/
example (q : ℝ) (hq : 0 < q) (hq1 : q < 1) :
    Real.log q / Real.log q = 1 ∧ q ^ (1 : ℝ) ≤ q := by sorry

section Complexes

open CategoryTheory

variable {K A : Type*} [NontriviallyNormedField K] [NormedCommRing A] [NormedAlgebra K A]
variable (C : CochainComplex (ModuleCat A) ℤ) (E : ℤ → Type*)
variable [∀ i, NormedAddCommGroup (E i)] [∀ i, Module A (E i)]
variable (e : ∀ i, C.X i ≃ₗ[A] E i)

/-- §4.16 (Bounded complexes of projective Banach modules): degreewise complete ultrametric norms
on the identified modules, continuous differentials, finite support and (Pr) in every degree. -/
def IsProjectiveBanachComplex : Prop :=
  (∀ i, IsUltrametricDist (E i)) ∧
  (∀ i (k : K) (x : E i), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖) ∧
  (∀ i, ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E i), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖) ∧
  (∀ i, CompleteSpace (E i)) ∧ (∀ i, ContinuousSMul A (E i)) ∧
  (∀ i j, Continuous (fun x : E i => e j (C.d i j ((e i).symm x)))) ∧
  (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → Subsingleton (E i)) ∧
  ∀ i, NonarchimedeanFredholm.HasPr A (E i)

/-- §4.16: the zero complex is a projective Banach complex. -/
theorem projectiveBanachComplex_zero (hz : ∀ i, Subsingleton (E i)) :
    IsProjectiveBanachComplex (K := K) C E e := by sorry

/-- §4.16: degree shifts transport norms, differentials and finite support. -/
theorem projectiveBanachComplex_shift (n : ℤ)
    (D : CochainComplex (ModuleCat A) ℤ) (e' : ∀ i, D.X i ≃ₗ[A] E (i + n))
    (ε : A) (hd : ∀ i j (x : E (i + n)),
      e' j (D.d i j ((e' i).symm x)) = ε • e (j + n) (C.d (i + n) (j + n) ((e (i + n)).symm x)))
    (hC : IsProjectiveBanachComplex (K := K) C E e) :
    IsProjectiveBanachComplex (K := K) D (fun i => E (i + n)) e' := by sorry

/-- §4.16 check `banachComplex_infinite_rank`: `C₀(ℕ, A)` in degree zero is allowed although it is
not a finite `A`-module. -/
example [CompleteSpace A] [Nontrivial A] [IsNoetherianRing A]
    (hu : IsUltrametricDist (E 0))
    (hk : ∀ (k : K) (x : E 0), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖)
    (ha : ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E 0), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖)
    (hother : ∀ i, i ≠ 0 → Subsingleton (E i)) (e0 : E 0 ≃L[A] C₀(ℕ, A)) :
    IsProjectiveBanachComplex (K := K) C E e ∧ ¬ Module.Finite A (E 0) := by sorry

/-- §4.16: the degree map of a cochain endomorphism, transferred to the identified module. -/
def degreeCLM (U : C ⟶ C) (i : ℤ)
    (hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) : E i →L[A] E i :=
  ⟨(e i).toLinearMap.comp ((U.f i).hom.comp (e i).symm.toLinearMap), hc⟩

/-- §4.16 (Degreewise completely continuous representatives). -/
def DegreewiseCompletelyContinuous (U : C ⟶ C) : Prop :=
  ∀ i, ∃ hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x))),
    NonarchimedeanFredholm.IsCompletelyContinuous (degreeCLM C E e U i hc)

/-- §4.16: the zero cochain endomorphism is completely continuous in every degree. -/
theorem degreewiseCompletelyContinuous_zero : DegreewiseCompletelyContinuous C E e 0 := by sorry

/-- §4.16: over Noetherian `A`, sums of degreewise completely continuous representatives
remain completely continuous, using finitely generated ranges of the approximants. -/
theorem degreewiseCompletelyContinuous_add [IsNoetherianRing A] (U V : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) (hV : DegreewiseCompletelyContinuous C E e V) :
    DegreewiseCompletelyContinuous C E e (U + V) := by sorry

/-- §4.16 check `complexCompact_finite_free`: every continuous endomorphism of a complex of finite
modules over Noetherian `A` is degreewise completely continuous. -/
example [IsNoetherianRing A] (U : C ⟶ C) [∀ i, Module.Finite A (E i)]
    (hc : ∀ i, Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) :
    DegreewiseCompletelyContinuous C E e U := by sorry

/-- §4.16 (Compactness of a homotopy endomorphism): some continuously homotopic representative is
degreewise completely continuous. -/
def CompactHomotopyEndomorphism (U : C ⟶ C) : Prop :=
  ∃ V : C ⟶ C, DegreewiseCompletelyContinuous C E e V ∧
    ∃ H : Homotopy U V, ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))

/-- §4.16: a degreewise compact representative determines a compact class. -/
theorem compactHomotopyEndomorphism_of_rep (U : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) : CompactHomotopyEndomorphism C E e U := by sorry

/-- §4.16: continuously homotopic endomorphisms are compact together. -/
theorem compactHomotopyEndomorphism_homotopy (U V : C ⟶ C) (H : Homotopy U V)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e U ↔ CompactHomotopyEndomorphism C E e V := by sorry

/-- §4.16 check `homotopyCompact_zero`: the zero endomorphism has a compact homotopy class. -/
example : CompactHomotopyEndomorphism C E e 0 := by sorry

/-- §4.16 check `homotopyCompact_contractible`: the identity of a contractible complex is
compact. -/
example (H : Homotopy (𝟙 C) 0)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e (𝟙 C) := by sorry

end Complexes

/-! ### §4.17 Fréchet presentations and the torus order -/

section StageFactorizations

variable {A : Type*} [NormedCommRing A]
variable (V : ℕ → Type*) [∀ n, NormedAddCommGroup (V n)] [∀ n, Module A (V n)]

/-- §4.17 (Compact factorization on Fréchet presentations; Urban §2.3.12 and Lemma 2.3.13): compact
transitions `t_n` and bounded `a_n` with `U_n = t_n a_n` and `U_{n+1} = a_n t_n`. -/
def CompactStageFactorization (t : ∀ n, V (n + 1) →L[A] V n) (U : ∀ n, V n →L[A] V n) : Prop :=
  (∀ n, NonarchimedeanFredholm.IsCompletelyContinuous (t n)) ∧
    ∃ a : ∀ n, V n →L[A] V (n + 1), ∀ n, (t n).comp (a n) = U n ∧ (a n).comp (t n) = U (n + 1)

/-- §4.17: compact transitions with zero stage operators factor with `a_n = 0`. -/
theorem compactStageFactorization_zero (t : ∀ n, V (n + 1) →L[A] V n)
    (ht : ∀ n, NonarchimedeanFredholm.IsCompletelyContinuous (t n)) :
    CompactStageFactorization V t (fun _ => 0) := by sorry

/-- §4.17: the factorization makes the stage operators compatible, `U_n t_n = t_n U_{n+1}`. -/
theorem compactStageFactorization_compatible (t : ∀ n, V (n + 1) →L[A] V n)
    (U : ∀ n, V n →L[A] V n) (h : CompactStageFactorization V t U) (n : ℕ) :
    (U n).comp (t n) = (t n).comp (U (n + 1)) := by sorry

/-- §4.17 check `frechetFactor_finite`: the constant system `A` with scalar `U = a`. -/
example (a : A) : CompactStageFactorization (fun _ : ℕ => A)
    (fun _ => ContinuousLinearMap.id A A) (fun _ => a • ContinuousLinearMap.id A A) := by sorry

end StageFactorizations

/-- §4.17 check `frechetFactor_noncompact` (non-example): the constant system `c₀(ℕ, K)` with
identity transitions fails the compact-transition condition. -/
example {K : Type*} [NontriviallyNormedField K] :
    ¬ CompactStageFactorization (fun _ : ℕ => C₀(ℕ, K))
      (fun _ => ContinuousLinearMap.id K C₀(ℕ, K)) (fun _ => 0) := by sorry

namespace TorusValuationTests

/-- §4.17 check `torusSlope_wrong_sign`: the character valuation is `+1` at `p`, the
ReductiveGroupsPartII apartment translation `−1`. -/
example : padicValRat 3 (3 : ℚ) = 1 ∧ -padicValRat 3 (3 : ℚ) = -1 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  exact ⟨h3, by simp only [h3]⟩

/-- §4.17 check `torusValuation_split_line`: `w(p^{−2}) = −2`. -/
example : padicValRat 3 ((3 : ℚ) ^ (-2 : ℤ)) = -2 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  rw [padicValRat.zpow, h3]
  norm_num

/-- §4.17 check `torusPositive_SL2`: the positive root `t ↦ t²` has valuation `2` at `t = p`. -/
example : padicValRat 3 ((3 : ℚ) ^ 2) = 2 ∧ padicValRat 3 ((3 : ℚ)⁻¹) = -1 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  rw [padicValRat.pow, padicValRat.inv, h3]
  norm_num

/-- §4.17 check `torusSlope_SL2`: in the `SL₂` chamber the slope order is the real order. -/
example (s t : ℝ) : (∀ n : ℕ, 0 ≤ (n : ℝ) * (s - t)) ↔ t ≤ s := by sorry

/-- §4.17 check `torusSlope_rootless`: for `𝔾_m` alone comparability is equality. -/
example (s t : ℝ) : (∀ n : ℤ, 0 ≤ (n : ℝ) * (s - t)) ↔ t = s := by sorry

end TorusValuationTests

end AnalyticDistributions

end

end TauCetiRoadmap.LocallyAnalyticDistributions
