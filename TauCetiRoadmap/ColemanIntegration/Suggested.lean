import Mathlib
import TauCeti.Algebra.Polynomial.Laurent.Basic
import TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic
import TauCetiRoadmap.RestrictedPowerSeries.Suggested

/-!
# ColemanIntegration: representative target signatures

The roadmap is `README.md`. This file records lightweight definitions and representative
milestone signatures expressible in the pinned Mathlib and Tau Ceti APIs. It is not exhaustive.
The README specifies the geometric, Coleman, Bloch-group and regulator constructions and all
their APIs and Checks. Definitions here have real bodies; theorem proofs are left as `sorry`.

The formal primitive has zero constant coefficient. Whole-disc analyticity requires positive
radius. DirichletPadicLFunctions §0.6 supplies the Iwasawa decomposition and normalized logarithm
`iwasawaLog p`, including value zero at zero, restriction and equivariance. General branches
are its valuation adapters `iwasawaLog p x + a * v_p(x)` on nonzero inputs, with value zero
at zero; the signatures below characterize these adapters by their series and value at `p`.
The `ℚ_p` logarithm-series theory is supplied by PadicFunctionalAnalysis §4.5; L0.10 and
L0.13 extend it to general ultrametric fields of characteristic zero. The Laurent coefficient predicates,
convolution and Gauss norms below are adapters to PadicDifferentialEquationsAndRigidCohomology
RD.0.1–RD.0.2. Compact preparation, finite Newton breaks and the dominant-term unit criterion
come from RD.0.18, with derivation supplied by RD.0.36. Its annulus series are two-sided coefficient families `ℤ → K` with a decay predicate, not Mathlib's `LaurentSeries`,
whose supports are bounded below. The complex polylogarithm uses its scalar series, with a
principal logarithm at weight one. Cross-ratios use homogeneous determinants in the displayed
order. The Amice operator is `(1 + T) d/dT`, and smoothing cancels poles before formal inversion.
The Coleman coefficient extension is algebraic: `B = A_K⁺ ⊗_K ℂ_p`, with word algebra
`U_B = U_K ⊗_K ℂ_p`. L1.17a supplies meromorphic-primitive descent into `B` and
restriction injectivity; the full `ℂ_p` dagger algebra is a distinct coefficient ring.
-/

open Filter Topology
open scoped PowerSeries

noncomputable section

namespace TauCetiRoadmap.ColemanIntegration

/-! ## Layer L0: power series, residues and logarithm branches -/

section NatCastBound

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

/-- L0.1: in an ultrametric field of characteristic zero, `‖1/n‖` grows at most polynomially. -/
theorem norm_natCast_inv_le_rpow :
    ∃ s : ℝ, 0 ≤ s ∧ ∀ n : ℕ, 0 < n → ‖(n : K)‖⁻¹ ≤ (n : ℝ) ^ s := by
  sorry

end NatCastBound

/-! ### L0.F: the rational coefficient series -/

/-- The rational series `q_k = ∑_{n ≥ 1} n^{-k} Xⁿ`, shared by the p-adic and complex
polylogarithms. -/
def rationalPolylogSeries (k : ℤ) : PowerSeries ℚ :=
  PowerSeries.mk fun n => if n = 0 then 0 else ((n : ℚ) ^ k)⁻¹

/-- Euler differentiation lowers the weight, for every integer weight. -/
theorem X_mul_derivative_rationalPolylogSeries (k : ℤ) :
    PowerSeries.X * PowerSeries.derivative (rationalPolylogSeries k) =
      rationalPolylogSeries (k - 1) := by
  sorry

/-- `q_k` is characterised by its Euler derivative and its zero constant term. -/
theorem rationalPolylogSeries_unique (k : ℤ) (f : PowerSeries ℚ)
    (h0 : PowerSeries.constantCoeff f = 0)
    (hD : PowerSeries.X * PowerSeries.derivative f = rationalPolylogSeries (k - 1)) :
    f = rationalPolylogSeries k := by
  sorry

example : PowerSeries.coeff 2 (rationalPolylogSeries 1) = 1 / 2 := by sorry

/-- Negative weights are included: `q_{-1} = X/(1 - X)²`. -/
example : rationalPolylogSeries (-1) =
    PowerSeries.X * (1 - (PowerSeries.X : PowerSeries ℚ))⁻¹ ^ 2 := by sorry

example : PowerSeries.coeff 0 (rationalPolylogSeries 1) = 0 := by sorry

example : PowerSeries.coeff 3 (rationalPolylogSeries 1) = 1 / 3 := by sorry

example : PowerSeries.coeff 1 (rationalPolylogSeries (-2)) = 1 := by sorry

example : algebraMap ℚ ℂ (PowerSeries.coeff 2 (rationalPolylogSeries 2)) = 1 / 4 := by sorry

/-- At weight one the Euler derivative is the geometric series without its constant. -/
example : PowerSeries.X * PowerSeries.derivative (rationalPolylogSeries 1) =
    PowerSeries.X * (1 - (PowerSeries.X : PowerSeries ℚ))⁻¹ := by sorry

/-! ### L0.2–L0.5: the normalised formal primitive -/

namespace PowerSeries

open _root_.PowerSeries

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- The normalised formal primitive `∑ aₙ Xⁿ ↦ ∑ aₙ Xⁿ⁺¹/(n+1)` over a `ℚ`-algebra. -/
def primitive : A⟦X⟧ →ₗ[A] A⟦X⟧ where
  toFun f := mk fun n => if n = 0 then 0 else algebraMap ℚ A (1 / (n : ℚ)) * coeff (n - 1) f
  map_add' := by sorry
  map_smul' := by sorry

/-- L0.3. -/
theorem derivative_primitive (f : A⟦X⟧) : derivative (primitive f) = f := by
  sorry

/-- L0.4: the primitive with a given constant term is unique. -/
theorem eq_C_add_primitive_iff (f g : A⟦X⟧) (c : A) :
    (derivative g = f ∧ constantCoeff g = c) ↔ g = C c + primitive f := by
  sorry

example : primitive (0 : A⟦X⟧) = 0 := by sorry

example : primitive (1 : A⟦X⟧) = X := by sorry

/-- The primitive of the alternating geometric series is Mathlib's formal `log (1 + X)`. -/
example : primitive (mk fun n => (-1 : A) ^ n) = log A := by sorry

/-- Non-example: over `ZMod p` the monomial `X^(p-1)` has no primitive. -/
example (p : ℕ) [Fact p.Prime] : ¬ ∃ g : (ZMod p)⟦X⟧, derivative g = X ^ (p - 1) := by
  sorry

end PowerSeries

section Radius

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [CompleteSpace K]

/-- L0.5 (a): termwise integration does not change the radius of convergence. -/
theorem radius_ofScalars_primitive (f : PowerSeries K) :
    (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n (PowerSeries.primitive f))).radius =
      (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n f)).radius := by
  sorry

/-- L0.5 (b): restricted at `ρ` implies the primitive is restricted at every `r < ρ`. -/
theorem isRestricted_primitive_of_lt {f : PowerSeries K} {ρ r : ℝ} (hr : 0 < r)
    (hrρ : r < ρ) (hf : f.IsRestricted ρ) : (PowerSeries.primitive f).IsRestricted r := by
  sorry

open Classical in
/-- L0.6: `∑ pᵏ X^(pᵏ-1)` is restricted at `1` but its primitive `∑ X^(pᵏ)` is not. -/
theorem not_isRestricted_primitive_closedDisc (p : ℕ) [Fact p.Prime]
    (hp : ‖(p : K)‖ < 1) :
    let f : PowerSeries K :=
      PowerSeries.mk fun n => if ∃ k : ℕ, n + 1 = p ^ k then ((n + 1 : ℕ) : K) else 0
    f.IsRestricted 1 ∧ ¬ (PowerSeries.primitive f).IsRestricted 1 := by
  sorry

end Radius

/-! ### L0.7–L0.9: functions analytic on a whole open disc -/

section Disc

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- The functions on the open disc `D⁻(a, r)` given by one convergent power series on the whole
disc (stronger than `AnalyticOnNhd`, which only asks for local power series). -/
def discAnalytic (a : K) (r : ENNReal) (hr : 0 < r) :
    Subalgebra K (Metric.eball a r → K) where
  carrier := {f | ∃ (F : K → K) (P : FormalMultilinearSeries K K K),
    HasFPowerSeriesOnBall F P a r ∧ ∀ z : Metric.eball a r, f z = F z}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- L0.7: a whole-disc series restricts about an interior centre to a positive numerical
radius no larger than the original radius. -/
theorem discAnalytic.restrict {a b : K} {r r' : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r)
    (hb : b ∈ Metric.eball a r) (hr' : 0 < r') (hle : r' ≤ r) :
    ∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall f Q b r' := by
  sorry

/-- Constants are analytic on every disc of positive radius, including `r = ∞`. -/
example (a c : K) (r : ENNReal) (hr : 0 < r) :
    (fun _ : Metric.eball a r => c) ∈ discAnalytic a r hr := by sorry

/-- Radius zero is excluded by the analytic-series predicate, even for a constant function. -/
example (a c : K) :
    ¬ ∃ P : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall (fun _ => c) P a 0 := by
  rintro ⟨P, hP⟩
  exact (lt_irrefl (0 : ENNReal)) hP.r_pos

/-- Non-example: the indicator of a smaller disc is locally analytic but not given by one power
series on `D⁻(0, 1)`. -/
example (p : ℕ) [Fact p.Prime] :
    AnalyticOnNhd ℂ_[p] (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p])))
        (Metric.ball 0 1) ∧
      ¬ ∃ P : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
        HasFPowerSeriesOnBall
          (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p]))) P 0 1 := by
  sorry

/-- L0.8: on an open disc a whole-disc analytic function has a unique whole-disc analytic
primitive with a chosen value at a base point. -/
theorem existsUnique_primitive_disc [CharZero K] {a : K} {r : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r) {b : K}
    (hb : b ∈ Metric.eball a r) (c : K) :
    ∃ F : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q a r) ∧
      (∀ z ∈ Metric.eball a r, HasDerivAt F (f z) z) ∧ F b = c ∧
      ∀ G : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall G Q a r) →
        (∀ z ∈ Metric.eball a r, HasDerivAt G (f z) z) → G b = c →
          Set.EqOn G F (Metric.eball a r) := by
  sorry

end Disc

/-- L0.9: locally analytic functions with zero derivative need not be constant on a disc. -/
theorem exists_locallyConstant_nonconst (p : ℕ) [Fact p.Prime] :
    ∃ g : ℂ_[p] → ℂ_[p], AnalyticOnNhd ℂ_[p] g (Metric.ball 0 1) ∧
      (∀ z ∈ Metric.ball (0 : ℂ_[p]) 1, HasDerivAt g 0 z) ∧
      ¬ ∃ c, Set.EqOn g (fun _ => c) (Metric.ball 0 1) := by
  sorry

/-! ### L0.10 and L0.13: the logarithm series of Tau Ceti over an ultrametric field -/

section LogSeries

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

/-- L0.10: Tau Ceti's logarithm series has radius at least `1` over an ultrametric field of
characteristic zero (Tau Ceti's own radius theorem needs a continuous `ℚ≥0`-action, which
p-adic fields lack). -/
theorem one_le_radius_logOneAddSeries_of_ultrametric :
    1 ≤ (NormedSpace.logOneAddSeries K K).radius := by
  sorry

/-- L0.13: the series logarithm is a homomorphism on principal units. -/
theorem logOneAdd_add_mul_of_ultrametric [CompleteSpace K] {u v : K} (hu : ‖u‖ < 1)
    (hv : ‖v‖ < 1) :
    NormedSpace.logOneAdd K K (u + v + u * v) =
      NormedSpace.logOneAdd K K u + NormedSpace.logOneAdd K K v := by
  sorry

/-- The series logarithm defines one analytic function on the whole unit disc. -/
example [CompleteSpace K] :
    (fun z : Metric.eball (0 : K) 1 => NormedSpace.logOneAdd K K z) ∈
      discAnalytic (0 : K) 1 (by norm_num) := by sorry

/-- Whole-disc convergence does not imply restricted coefficients at the boundary. -/
example [CompleteSpace K] :
    (fun z : Metric.eball (0 : K) 1 => (1 - (z : K))⁻¹) ∈
        discAnalytic (0 : K) 1 (by norm_num) ∧
      ¬ ((1 - (PowerSeries.X : PowerSeries K))⁻¹).IsRestricted 1 := by sorry

end LogSeries

/-! ### L0.A1–L0.A2: Laurent carriers of annuli -/

section LaurentCarrier

variable {K : Type*} [NontriviallyNormedField K]

/-- L0.A1: the coefficient adapter to the annulus carrier `A_K(I)` supplied by
PadicDifferentialEquationsAndRigidCohomology RD.0.1–RD.0.2. These are the coefficient families `a : ℤ → K` of Laurent series `∑ aₙ Tⁿ` converging on the
annulus `‖T‖ ∈ I`: `‖aₙ‖ ρⁿ → 0` as `|n| → ∞` for every radius `ρ ∈ I`. The open annulus
`r < ‖z - e‖ < s` is `I = Set.Ioo r s` in the coordinate `T = z - e`, and the punctured unit
disc is `Set.Ioo 0 1`. -/
def IsLaurentOn (I : Set ℝ) (a : ℤ → K) : Prop :=
  ∀ ρ ∈ I, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)

/-- The coefficient formula for the imported RD.0.1 `ρ`-Gauss norm `sup_n ‖aₙ‖ ρⁿ` of a two-sided coefficient family. -/
def laurentGaussNorm (a : ℤ → K) (ρ : ℝ) : ℝ :=
  ⨆ n : ℤ, ‖a n‖ * ρ ^ n

/-- The coefficient adapter to RD.0.1 multiplication: the two-sided Cauchy product `cₙ = ∑ₘ aₘ b_{n - m}`. -/
def laurentMul (a b : ℤ → K) : ℤ → K :=
  fun n => ∑' m : ℤ, a m * b (n - m)

/-- The value of the Laurent series with coefficients `a` at the coordinate value `w = z - e`. -/
def laurentSeriesEval (a : ℤ → K) (w : K) : K :=
  ∑' n : ℤ, a n * w ^ n

/-- Restriction to a smaller set of radii is the identity on coefficients. -/
theorem IsLaurentOn.mono {I J : Set ℝ} {a : ℤ → K} (ha : IsLaurentOn I a) (hJI : J ⊆ I) :
    IsLaurentOn J a :=
  fun ρ hρ => ha ρ (hJI hρ)

variable [IsUltrametricDist K] [CompleteSpace K]

/-- L0.A1: on a nonempty set of positive radii the Cauchy product of two members converges
coefficientwise and is a member. -/
theorem IsLaurentOn.laurentMul {I : Set ℝ} (hI : I ⊆ Set.Ioi 0) (hne : I.Nonempty)
    {a b : ℤ → K} (ha : IsLaurentOn I a) (hb : IsLaurentOn I b) :
    (∀ n : ℤ, Summable fun m : ℤ => a m * b (n - m)) ∧ IsLaurentOn I (laurentMul a b) := by
  sorry

/-- L0.A1: every Gauss norm at a positive radius of the carrier is multiplicative. -/
theorem laurentGaussNorm_laurentMul {I : Set ℝ} {a b : ℤ → K} (ha : IsLaurentOn I a)
    (hb : IsLaurentOn I b) {ρ : ℝ} (hρ : ρ ∈ I) (hρ0 : 0 < ρ) :
    laurentGaussNorm (laurentMul a b) ρ = laurentGaussNorm a ρ * laurentGaussNorm b ρ := by
  sorry

/-- L0.A1: the adapter to RD.0.18’s dominant-term unit criterion on the Laurent carrier. -/
theorem isUnit_laurentOn_iff {I : Set ℝ} (hI : I ⊆ Set.Ioi 0) (hne : I.Nonempty) {a : ℤ → K}
    (ha : IsLaurentOn I a) :
    (∃ b : ℤ → K, IsLaurentOn I b ∧ laurentMul a b = Pi.single 0 1) ↔
      ∃ j : ℤ, ∀ ρ ∈ I, ∀ n ≠ j, ‖a n‖ * ρ ^ n < ‖a j‖ * ρ ^ j := by
  sorry

/-- L0.A1: a nonzero member has a single dominant index on some open interval of radii. -/
theorem exists_subinterval_single_dominant {I : Set ℝ} (hI : I ⊆ Set.Ioi 0)
    (hint : (interior I).Nonempty) {a : ℤ → K} (ha : IsLaurentOn I a) (ha0 : a ≠ 0) :
    ∃ (ρ₁ ρ₂ : ℝ) (j : ℤ), ρ₁ < ρ₂ ∧ Set.Ioo ρ₁ ρ₂ ⊆ I ∧
      ∀ ρ ∈ Set.Ioo ρ₁ ρ₂, ∀ n ≠ j, ‖a n‖ * ρ ^ n < ‖a j‖ * ρ ^ j := by
  sorry

end LaurentCarrier

section LaurentExamples

variable (p : ℕ) [Fact p.Prime]

/-- The radius condition is not vacuous: `∑ p^|n| Tⁿ` converges on `1/p < |T| < p` only. -/
example : IsLaurentOn (Set.Ioo (p : ℝ)⁻¹ p) (fun n : ℤ => (p : ℚ_[p]) ^ n.natAbs) ∧
    ¬ IsLaurentOn (Set.Ioo (p : ℝ)⁻¹ ((p : ℝ) ^ 2)) (fun n : ℤ => (p : ℚ_[p]) ^ n.natAbs) := by
  sorry

/-- A member with infinitely many negative terms: no formal `LaurentSeries` has this family. -/
example : IsLaurentOn (Set.Ioi 0)
      (fun n : ℤ => if n ≤ 0 then (p : ℚ_[p]) ^ (n.natAbs ^ 2) else 0) ∧
    ¬ BddBelow (Function.support
      (fun n : ℤ => if n ≤ 0 then (p : ℚ_[p]) ^ (n.natAbs ^ 2) else 0)) := by
  sorry

/-- The Gauss norm is a maximum, not a weighted `ℓ¹` sum: `|T + p|₁ = 1`, not `1 + 1/p`. -/
example :
    laurentGaussNorm
      ((Pi.single 1 1 : ℤ → ℚ_[p]) + (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p])) 1 = 1 := by
  sorry

/-- Multiplicativity witnesses for `(T + p)(T⁻¹ + p)`: Gauss norm `1 · 1` at `ρ = 1` and
`p⁻¹ · p² = p` at `ρ = p⁻²`. -/
example :
    laurentGaussNorm
        (laurentMul ((Pi.single 1 1 : ℤ → ℚ_[p]) + (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p]))
          ((Pi.single (-1) 1 : ℤ → ℚ_[p]) + (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p]))) 1 = 1 ∧
      laurentGaussNorm
        (laurentMul ((Pi.single 1 1 : ℤ → ℚ_[p]) + (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p]))
          ((Pi.single (-1) 1 : ℤ → ℚ_[p]) + (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p])))
        ((p : ℝ) ^ (-2 : ℤ)) = p := by
  sorry

/-- `T - p` is a unit for the radii `(1/p, 1)`, where index `1` dominates, but not for
`(1/p², 1)`, which contains the tie at `1/p`. -/
example :
    (∃ b : ℤ → ℚ_[p], IsLaurentOn (Set.Ioo (p : ℝ)⁻¹ 1) b ∧
      laurentMul ((Pi.single 1 1 : ℤ → ℚ_[p]) - (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p])) b =
        Pi.single 0 1) ∧
    ¬ ∃ b : ℤ → ℚ_[p], IsLaurentOn (Set.Ioo ((p : ℝ) ^ (-2 : ℤ)) 1) b ∧
      laurentMul ((Pi.single 1 1 : ℤ → ℚ_[p]) - (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p])) b =
        Pi.single 0 1 := by
  sorry

/-- `T - p` vanishes at `p`, on the circle `|T| = 1/p` where its two coefficients tie, so it is
not a unit for any set of radii containing `1/p`. -/
example :
    laurentSeriesEval ((Pi.single 1 1 : ℤ → ℚ_[p]) - (Pi.single 0 (p : ℚ_[p]) : ℤ → ℚ_[p])) p = 0 ∧
      ‖(1 : ℚ_[p])‖ * (p : ℝ)⁻¹ ^ (1 : ℤ) = ‖(p : ℚ_[p])‖ * (p : ℝ)⁻¹ ^ (0 : ℤ) := by
  sorry

/-- A Laurent polynomial lies in the carrier of the punctured plane, and its value at a unit is
Tau Ceti's evaluation of Laurent polynomials. -/
example (P : LaurentPolynomial ℚ_[p]) (u : ℚ_[p]ˣ) :
    IsLaurentOn (Set.Ioi 0) (fun n => P.coeff n) ∧
      laurentSeriesEval (fun n => P.coeff n) (u : ℚ_[p]) = TauCeti.laurentEval u P := by
  sorry

/-- The annulus `1/p < |z| < 1` has no `ℚ_p`-points: evaluation must use points of `ℂ_p`. -/
example (z : ℚ_[p]) : ¬ ((p : ℝ)⁻¹ < ‖z‖ ∧ ‖z‖ < 1) := by
  sorry

/-- At `ℚ_p`-points of the unit circle `|z^p - z| < 1`, although `T^p - T` has Gauss norm `1`. -/
example (z : ℚ_[p]) (hz : ‖z‖ = 1) :
    ‖z ^ p - z‖ < 1 ∧
      laurentGaussNorm ((Pi.single (p : ℤ) 1 : ℤ → ℚ_[p]) - (Pi.single 1 1 : ℤ → ℚ_[p])) 1 = 1 := by
  sorry

/-- Over `ℂ_p`, the only zero of `T - p` on the circle `|T| = 1/p` is `p`. -/
example :
    {w : ℂ_[p] | ‖w‖ = (p : ℝ)⁻¹ ∧
      laurentSeriesEval ((Pi.single 1 1 : ℤ → ℂ_[p]) - (Pi.single 0 (p : ℂ_[p]) : ℤ → ℂ_[p]))
        w = 0} = {(p : ℂ_[p])} := by
  sorry

/-- No point of `ℂ_p` has norm `p^√2`: circles of radius outside `p^ℚ` have no points. -/
example (z : ℂ_[p]) : ‖z‖ ≠ (p : ℝ) ^ Real.sqrt 2 := by
  sorry

/-- Finitely many unit roots do not imply that a Laurent polynomial is zero. -/
example :
    let a : ℤ → ℂ_[p] := Pi.single ((p - 1 : ℕ) : ℤ) 1 - Pi.single 0 1
    a ≠ 0 ∧ (Polynomial.nthRootsFinset (p - 1) (1 : ℂ_[p])).card = p - 1 ∧
      ∀ z ∈ Polynomial.nthRootsFinset (p - 1) (1 : ℂ_[p]),
        ‖z‖ = 1 ∧ laurentSeriesEval a z = 0 := by sorry

end LaurentExamples

section LaurentPoints

variable (p : ℕ) [Fact p.Prime]

/-- L0.A2 (b), (c): on a circle whose radius is a norm of `ℂ_p`, the Gauss norm bounds `|f|` and
is attained. -/
theorem laurentGaussNorm_eq_max_on_circle {I : Set ℝ} {a : ℤ → ℂ_[p]} (ha : IsLaurentOn I a)
    {c : ℂ_[p]} (hc0 : c ≠ 0) (hc : ‖c‖ ∈ I) :
    (∀ w : ℂ_[p], ‖w‖ = ‖c‖ → ‖laurentSeriesEval a w‖ ≤ laurentGaussNorm a ‖c‖) ∧
      ∃ w : ℂ_[p], ‖w‖ = ‖c‖ ∧ ‖laurentSeriesEval a w‖ = laurentGaussNorm a ‖c‖ := by
  sorry

/-- L0.A2 (d): RD.0.18 compact preparation gives finiteness of the evaluated zero set
on each closed sub-annulus over `ℂ_p`. -/
theorem finite_zeros_closedSubannulus {I : Set ℝ} {a : ℤ → ℂ_[p]} (ha : IsLaurentOn I a)
    (ha0 : a ≠ 0) {ρ₁ ρ₂ : ℝ} (h₁ : ρ₁ ∈ I) (h₂ : ρ₂ ∈ I) (hρ₁ : 0 < ρ₁) :
    {w : ℂ_[p] | ρ₁ ≤ ‖w‖ ∧ ‖w‖ ≤ ρ₂ ∧ laurentSeriesEval a w = 0}.Finite := by
  sorry

/-- L0.A2 (e), the identity principle: vanishing on a nonempty open subset of the annulus
`‖z - e‖ ∈ I` in `ℂ_p` forces every coefficient to vanish. -/
theorem eq_zero_of_eval_eq_zero_on_open {I : Set ℝ} (hI : I ⊆ Set.Ioi 0) {a : ℤ → ℂ_[p]}
    (ha : IsLaurentOn I a) {e : ℂ_[p]} {U : Set ℂ_[p]} (hU : IsOpen U) (hne : U.Nonempty)
    (hUI : ∀ z ∈ U, ‖z - e‖ ∈ I) (h0 : ∀ z ∈ U, laurentSeriesEval a (z - e) = 0) : a = 0 := by
  sorry

end LaurentPoints

/-! ### Logarithm branches on `ℂ_p` -/

section Branch

variable (p : ℕ) [Fact p.Prime]

/-- The interface used by Layers L2 and L3: `L` is multiplicative on `ℂ_p^×`, is the logarithm
series on `1 + 𝔪`, and sends `p` to `a`. -/
structure IsLogBranch (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

/-- L0.15: the valuation adapter to the Iwasawa logarithm of DirichletPadicLFunctions §0.6
is the unique branch on `ℂ_p` with parameter `a` and value zero at zero. -/
theorem existsUnique_logBranch (a : ℂ_[p]) :
    ∃! L : ℂ_[p] → ℂ_[p], IsLogBranch p a L ∧ L 0 = 0 := by
  sorry

/-- L0.16: the valuation adapters to the supplied Iwasawa logarithm differ by the parameter
difference times the rational valuation specified by the norm, on nonzero inputs. -/
theorem logBranch_sub {a b : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p b L')
    {x : ℂ_[p]} (hx : x ≠ 0) (v : ℚ) (hv : ‖x‖ = (p : ℝ) ^ (-(v : ℝ))) :
    L' x - L x = (b - a) * (v : ℂ_[p]) := by
  sorry

/-- The normalization distinguishes branches already at `p`. -/
example {L L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p 0 L)
    (hL' : IsLogBranch p 1 L') : L' p - L p = 1 := by
  sorry

/-- Evaluation at `p · p` fixes the sign and valuation normalization at `p²`. -/
example {a b : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p b L') :
    L' ((p : ℂ_[p]) ^ 2) - L ((p : ℂ_[p]) ^ 2) = 2 * (b - a) := by
  sorry

/-- Every branch kills the multiplicative identity and the order-two root of unity. -/
example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    L 1 = 0 ∧ L (-1) = 0 := by
  sorry

/-- The principal-unit series and normalization identify independent branch constructions
on nonzero inputs; the predicate leaves the value at zero unrestricted. -/
example {a : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p a L') :
    Set.EqOn L L' {x | x ≠ 0} := by
  sorry

/-- Different normalizations still agree on every unit of the valuation ring. -/
example {a b : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p b L') {x : ℂ_[p]} (hx : ‖x‖ = 1) :
    L' x = L x := by
  sorry

open Classical in
/-- A change only at zero preserves the branch predicate, whose laws concern nonzero inputs. -/
example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) (c : ℂ_[p]) :
    IsLogBranch p a (Function.update L 0 c) := by
  sorry

/-- The Iwasawa specialization is valid also at `p = 2`: torsion and powers of `2` vanish. -/
example {L : ℂ_[2] → ℂ_[2]} (hL : IsLogBranch 2 0 L) :
    L (-1) = 0 ∧ L 4 = 0 := by
  sorry

/-- The normalization at `3` removes the factor `9` in `63 = 9 · 7`. -/
example {L : ℂ_[3] → ℂ_[3]} (hL : IsLogBranch 3 0 L) : L 63 = L 7 := by
  sorry

/-- The zero function fails the principal-unit logarithm condition. -/
example (a : ℂ_[p]) : ¬ IsLogBranch p a (fun _ => 0) := by
  sorry

/-- The principal-unit logarithm at `4` has this residue modulo `3^12`. -/
example {a : ℂ_[3]} {L : ℂ_[3] → ℂ_[3]} (hL : IsLogBranch 3 a L) :
    ‖L 4 - 303798‖ ≤ (3 : ℝ) ^ (-12 : ℤ) := by sorry

/-- A fourth root congruent to `2` modulo `5` has logarithm zero. -/
example [Fact (Nat.Prime 5)] {a ζ : ℂ_[5]} {L : ℂ_[5] → ℂ_[5]} (hL : IsLogBranch 5 a L)
    (hζ : ζ ^ 4 = 1) (hres : ‖ζ - 2‖ ≤ (5 : ℝ)⁻¹) : L ζ = 0 := by sorry

example [Fact (Nat.Prime 5)] {a : ℂ_[5]} {L : ℂ_[5] → ℂ_[5]} (hL : IsLogBranch 5 a L) :
    L (-2) = L 16 / 4 := by sorry

/-- Every branch agrees with the principal-unit series throughout its disc. -/
example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    {u : ℂ_[p]} (hu : ‖u‖ < 1) : L (1 + u) = NormedSpace.logOneAdd ℂ_[p] ℂ_[p] u := by sorry

/-- At `p` the terms of the series about `1` do not tend to zero. -/
example : ¬ Summable (fun n : ℕ =>
    (-1 : ℂ_[p]) ^ n * ((p : ℂ_[p]) - 1) ^ (n + 1) / (n + 1)) := by sorry

end Branch

/-! ### L0.20: logarithmic Laurent expansions at a puncture -/

section LogLaurent

variable (p : ℕ) [Fact p.Prime]

/-- On `0 < ‖z - c‖ < 1`, `f` is a polynomial in `L (z - c)` whose coefficients are values of
members of the Laurent carrier of the punctured unit disc around `c` (L0.A1). -/
def IsLogLaurentNear (L f : ℂ_[p] → ℂ_[p]) (c : ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (g : ℕ → ℤ → ℂ_[p]), (∀ k, IsLaurentOn (Set.Ioo 0 1) (g k)) ∧
    ∀ z : ℂ_[p], 0 < ‖z - c‖ → ‖z - c‖ < 1 →
      f z = ∑ k ∈ Finset.range (N + 1), laurentSeriesEval (g k) (z - c) * L (z - c) ^ k

/-- The same shape at `∞`, in the parameter `1/z`, on `‖z‖ > 1`. -/
def IsLogLaurentAtInfty (L f : ℂ_[p] → ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (g : ℕ → ℤ → ℂ_[p]), (∀ k, IsLaurentOn (Set.Ioo 0 1) (g k)) ∧
    ∀ z : ℂ_[p], 1 < ‖z‖ →
      f z = ∑ k ∈ Finset.range (N + 1), laurentSeriesEval (g k) z⁻¹ * L z⁻¹ ^ k

/-- Constants and poles belong to the punctured-disc logarithmic Laurent class. -/
example (L : ℂ_[p] → ℂ_[p]) (c b : ℂ_[p]) :
    IsLogLaurentNear p L (fun _ => b) c ∧
      IsLogLaurentNear p L (fun z => (z - c)⁻¹) c ∧
      IsLogLaurentNear p L (fun z => L (z - c)) c := by sorry

/-- Both signs of Laurent degree occur at infinity in the parameter `1/z`. -/
example (L : ℂ_[p] → ℂ_[p]) (b : ℂ_[p]) :
    IsLogLaurentAtInfty p L (fun _ => b) ∧
      IsLogLaurentAtInfty p L (fun z => z) ∧
      IsLogLaurentAtInfty p L (fun z => z⁻¹) := by sorry

example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    IsLogLaurentAtInfty p L (fun z => L z⁻¹) ∧ L (((p : ℂ_[p])⁻¹)⁻¹) = a := by sorry

/-- Local analyticity alone does not give a logarithmic Laurent expansion at infinity. -/
example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ¬ IsLogLaurentAtInfty p L
      (Set.indicator {z : ℂ_[p] | (p : ℝ) < ‖z‖} fun _ => 1) := by sorry

/-- L2.63: a logarithmic Laurent expansion is determined by its values on an outer annulus
`r < ‖z - c‖ < 1`. -/
theorem IsLogLaurentNear.eqOn_punctured {a : ℂ_[p]} {L f g : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) {c : ℂ_[p]} (hf : IsLogLaurentNear p L f c)
    (hg : IsLogLaurentNear p L g c) {r : ℝ} (hr0 : 0 ≤ r) (hr : r < 1)
    (hfg : ∀ z, r < ‖z - c‖ → ‖z - c‖ < 1 → f z = g z) :
    ∀ z, 0 < ‖z - c‖ → ‖z - c‖ < 1 → f z = g z := by
  sorry

/-- The indicator of `|z| < 1/p` is locally constant and vanishes on the outer end, but has no
logarithmic Laurent expansion at `0` for a logarithm branch (L2.63). -/
example {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ¬ IsLogLaurentNear p L (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) fun _ => 1) 0 := by
  sorry

open Classical in
/-- The values of a logarithmic Laurent expansion are only constrained off the puncture: the
expansion near `c` says nothing about `f c`. -/
example {L f : ℂ_[p] → ℂ_[p]} {c : ℂ_[p]} (hf : IsLogLaurentNear p L f c) (v : ℂ_[p]) :
    IsLogLaurentNear p L (Function.update f c v) c := by
  sorry

end LogLaurent

/-! ## Layer L1: Frobenius continuation and Coleman functions -/

/-- L1.5: the integral dagger lift `z ↦ z^p + p/(z - 1)` sends the point `1 + p²`
of the removed residue disc of `1` into the residue disc of `∞`. Pullback at a removed
point uses an outer annulus and its end germ. -/
example (p : ℕ) [Fact p.Prime] :
    ‖(1 + (p : ℚ_[p]) ^ 2) - 1‖ < 1 ∧
      ‖(1 + (p : ℚ_[p]) ^ 2) ^ p +
        (p : ℚ_[p]) / ((1 + (p : ℚ_[p]) ^ 2) - 1)‖ = (p : ℝ) := by
  sorry

/-- L1.7: a Frobenius lift `φ` of an algebra `A` with differentials `Ω`, its action on `Ω`,
forms `ω`, the matrix `M` and the functions `g` with `φ^* ω_i = ∑_j M_ij ω_j + d g_i`. The
hypotheses (H0), (H1), (Hw) are the `Prop`-valued definitions below. -/
structure FrobeniusDatum (K A Ω : Type*) [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω]
    [Module A Ω] [Module K Ω] [IsScalarTower K A Ω] (r : ℕ) where
  /-- the exterior derivative -/
  d : Derivation K A Ω
  /-- the Frobenius lift -/
  φ : A →ₐ[K] A
  /-- its action on differentials -/
  φΩ : Ω →+ Ω
  φΩ_d : ∀ a, φΩ (d a) = d (φ a)
  φΩ_smul : ∀ (a : A) (w : Ω), φΩ (a • w) = φ a • φΩ w
  /-- the forms -/
  ω : Fin r → Ω
  /-- the Frobenius matrix -/
  M : Matrix (Fin r) (Fin r) K
  /-- the correction functions -/
  g : Fin r → A
  frobenius_eq : ∀ i, φΩ (ω i) = ∑ j, M i j • ω j + d (g i)

namespace FrobeniusDatum

variable {K A Ω : Type*} [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω] [Module A Ω]
  [Module K Ω] [IsScalarTower K A Ω] {r : ℕ} (𝔇 : FrobeniusDatum K A Ω r)

/-- (H0): the kernel of `d` is `K`. -/
def H0 : Prop := ∀ a : A, 𝔇.d a = 0 → a ∈ Set.range (algebraMap K A)

/-- (H1): the classes of the `ω i` form a basis of `Ω / dA`. -/
def H1 : Prop := ∀ η : Ω, ∃! c : Fin r → K, ∃ h : A, η = 𝔇.d h + ∑ i, c i • 𝔇.ω i

/-- (Hw): no product of `n ≥ 1` eigenvalues of `M` is a root of unity. -/
def Hw : Prop :=
  ∀ (n m : ℕ), 0 < n → 0 < m → ∀ μ : Fin n → AlgebraicClosure K,
    (∀ i, (𝔇.M.charpoly.map (algebraMap K (AlgebraicClosure K))).IsRoot (μ i)) →
      (∏ i, μ i) ^ m ≠ 1

/-- Constant algebras with zero differential satisfy the kernel-of-differentiation condition. -/
example (𝔇 : FrobeniusDatum K K Ω r) : 𝔇.H0 := by
  sorry

/-- Zero forms cannot be a one-element cohomology basis, even when `Ω = 0`. -/
example (𝔇 : FrobeniusDatum K A Ω 1) (hω : 𝔇.ω 0 = 0) : ¬ 𝔇.H1 := by
  sorry

/-- With no cohomology coordinates, the positive-weight condition is vacuous. -/
example (𝔇 : FrobeniusDatum K A Ω 0) : 𝔇.Hw := by
  sorry

/-- In rank one the unit Frobenius eigenvalue violates the weight condition. -/
example (𝔇 : FrobeniusDatum K A Ω 1) (hM : 𝔇.M = 1) : ¬ 𝔇.Hw := by
  sorry

end FrobeniusDatum

/-- L1.8: for `q > 1`, a nonempty product of numbers of positive Weil weight is not a root
of unity. -/
theorem weil_weight_product_ne_one {q : ℕ} (hq : 1 < q) {n m : ℕ} (hm : 0 < m) (hn : 0 < n)
    (ev : Fin n → ℂ) (w : Fin n → ℕ) (hw : ∀ i, 1 ≤ w i)
    (habs : ∀ i, ‖ev i‖ = (q : ℝ) ^ ((w i : ℝ) / 2)) : (∏ i, ev i) ^ m ≠ 1 := by
  sorry

/-- L1.10: Frobenius equations along a bijection with finite orbits have unique solutions when
no power of `T` has a fixed vector. -/
theorem existsUnique_frobenius_orbit_solution {S : Type*} (F : S ≃ S)
    (hF : ∀ s, ∃ m, 0 < m ∧ F^[m] s = s) {L V : Type*} [Field L] [AddCommGroup V] [Module L V]
    [FiniteDimensional L V] (T : V →ₗ[L] V)
    (hT : ∀ m : ℕ, 0 < m → ∀ v, (T ^ m) v = v → v = 0) (e : S → V) :
    ∃! c : S → V, ∀ s, c (F s) = T (c s) + e s := by
  sorry

/-- L1.14: the constant term of the `l`-free part of a logarithmic Laurent germ. It is linear
but not multiplicative on Laurent germs; tangential normalisations use the regular part. -/
def constantTerm {K : Type*} [Field K] (F : Polynomial (LaurentSeries K)) : K :=
  (F.coeff 0).coeff 0

/-- Negative powers prevent `constantTerm` from being multiplicative: `CT(t⁻¹) CT(t) = 0` but
`CT(t⁻¹ t) = 1`. -/
example {K : Type*} [Field K] :
    constantTerm (Polynomial.C (HahnSeries.single (-1 : ℤ) (1 : K))) = 0 ∧
    constantTerm (Polynomial.C (HahnSeries.single (1 : ℤ) (1 : K))) = 0 ∧
    constantTerm (Polynomial.C
      ((HahnSeries.single (-1 : ℤ) (1 : K) : LaurentSeries K) *
        HahnSeries.single (1 : ℤ) (1 : K))) = 1 := by
  sorry

/-- The regular logarithmic germ has constant term its scalar coefficient. -/
example {K : Type*} [Field K] (c : K) :
    constantTerm (Polynomial.C (HahnSeries.single (0 : ℤ) c)) = c := by
  sorry

/-- L1.17a: a geometric series with parameter transcendental over `K` has no finite
expression with coefficients in `L` and power series over `K`. Its coefficients are the
linearly independent powers of the parameter, whereas a finite expression has coefficients
in one finite-dimensional `K`-subspace of `L`. -/
theorem geometricSeries_not_finite_coefficient_sum {K L : Type*} [Field K] [Field L]
    [Algebra K L] (α : L) (hα : Transcendental K α) :
    ¬ ∃ (m : ℕ) (c : Fin m → L) (f : Fin m → PowerSeries K),
      (1 - PowerSeries.C α * PowerSeries.X)⁻¹ =
        ∑ i, c i • PowerSeries.map (algebraMap K L) (f i) := by
  sorry

/-! ## Layer L2: Coleman polylogarithms and functional equations -/

section PolylogSeries

variable (p : ℕ) [Fact p.Prime]

/-- `polylogSer p k z = ∑_{n ≥ 1} zⁿ/nᵏ`, Coleman's `Li_k` on `‖z‖ < 1`. -/
def polylogSer (k : ℤ) (z : ℂ_[p]) : ℂ_[p] :=
  ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ k)

/-- L2.1: the series has radius one. -/
theorem polylogSer_hasFPowerSeriesOnBall (k : ℤ) :
    HasFPowerSeriesOnBall (polylogSer p k)
      (FormalMultilinearSeries.ofScalars ℂ_[p]
        (fun n => if n = 0 then 0 else ((n : ℂ_[p]) ^ k)⁻¹)) 0 1 := by
  sorry

example (k : ℤ) : polylogSer p k 0 = 0 := by sorry

/-- Non-example: the series diverges at `1 + p`, a point of the residue disc of `1`. -/
example (k : ℕ) :
    ¬ Summable (fun n : ℕ => (1 + (p : ℂ_[p])) ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ (k : ℤ))) := by
  sorry

example : polylogSer p 0 (p : ℂ_[p]) = (p : ℂ_[p]) / (1 - p) := by sorry

/-- For `p ≥ 5` the quadratic term uniquely dominates the tail at `z = p`. -/
example (hp : 5 ≤ p) : ‖polylogSer p 2 (p : ℂ_[p]) - p‖ = (p : ℝ) ^ (-2 : ℤ) := by sorry

example {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    polylogSer p 1 z = -NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (-z) := by sorry

end PolylogSeries

/-! ### L2.Fa: complex polylogarithms on the closed unit disc -/

section ComplexPolylog

/-- For `k ≥ 2`, `Li_k^ℂ(z) = ∑_{n ≥ 1} zⁿ/nᵏ` on the closed unit disc. At weight one use
`-log (1-z)`: its boundary series converges in the natural order, whereas Mathlib's `tsum`
requires unconditional convergence and would give zero at `z = -1`. -/
def complexPolylog (k : ℕ) (z : ℂ) : ℂ :=
  if k = 1 then -Complex.log (1 - z)
  else ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k

/-- L2.Fa: for `k ≥ 2` the series converges absolutely on the closed disc and its sum is
continuous there. -/
theorem complexPolylog_continuousOn {k : ℕ} (hk : 2 ≤ k) :
    ContinuousOn (complexPolylog k) (Metric.closedBall 0 1) := by
  sorry

/-- L2.Fa: on the unit circle the values are Mathlib's exponential zeta function. -/
theorem complexPolylog_eq_expZeta {k : ℕ} (hk : 2 ≤ k) (x : ℝ) :
    complexPolylog k (Complex.exp (2 * Real.pi * Complex.I * x)) = HurwitzZeta.expZeta x k := by
  sorry

/-- L2.Fa and L2.30: complex inversion on the unit circle has a Bernoulli term for every
positive weight, including the principal-logarithm identity at weight one. -/
theorem complexPolylog_inversion_rootOfUnity {k : ℕ} (hk : 1 ≤ k) {x : ℝ} (hx0 : 0 < x)
    (hx1 : x < 1) :
    complexPolylog k (Complex.exp (2 * Real.pi * Complex.I * x)) +
        (-1) ^ k * complexPolylog k (Complex.exp (-(2 * Real.pi * Complex.I * x))) =
      -(2 * Real.pi * Complex.I) ^ k / (k.factorial) *
        ((Polynomial.bernoulli k).map (algebraMap ℚ ℂ)).eval (x : ℂ) := by
  sorry

example : complexPolylog 2 1 = (Real.pi : ℂ) ^ 2 / 6 := by sorry

example : complexPolylog 2 (-1) = -(Real.pi : ℂ) ^ 2 / 12 := by sorry

example : complexPolylog 1 (-1) = -Complex.log 2 := by sorry

example (k : ℕ) : complexPolylog k 0 = 0 := by sorry

/-- At a primitive cube root, weight-one inversion gives the principal-logarithm value. -/
example : complexPolylog 1 (Complex.exp (2 * Real.pi * Complex.I / 3)) -
    complexPolylog 1 (Complex.exp (-(2 * Real.pi * Complex.I / 3))) =
      (Real.pi : ℂ) * Complex.I / 3 := by sorry

/-- The complex weight-one inversion law has a nonzero Bernoulli term. -/
example : complexPolylog 1 Complex.I - complexPolylog 1 (-Complex.I) =
    (Real.pi : ℂ) * Complex.I / 2 := by sorry

example : complexPolylog 2 1 = 2 * (complexPolylog 2 1 + complexPolylog 2 (-1)) := by sorry

end ComplexPolylog

namespace ProjectiveAlgebra

variable (K : Type*) [Field K]

/-- The projective line, with homogeneous coordinates `[x : y]`. -/
abbrev Point := Projectivization K (Fin 2 → K)

/-- The affine chart `x ↦ [x : 1]`. -/
def finitePoint (x : K) : Point K :=
  Projectivization.mk K ![x, 1] (by
    intro h
    have := congrFun h 1
    simp at this)

/-- The point `[1 : 0]`. -/
def infinity : Point K :=
  Projectivization.mk K ![1, 0] (by
    intro h
    have := congrFun h 0
    simp at this)

/-- The determinant of two coordinate vectors. -/
def detPair (v w : Fin 2 → K) : K := v 0 * w 1 - v 1 * w 0

/-- The cross-ratio `Δ(a,b)Δ(c,d)/(Δ(a,d)Δ(c,b))`, independent of representatives; the quotient
is total and every analytic use carries pairwise distinctness. -/
def crossRatio (a b c d : Point K) : K :=
  detPair K a.rep b.rep * detPair K c.rep d.rep /
    (detPair K a.rep d.rep * detPair K c.rep b.rep)

/-- The normalised five-tuple `(∞, 0, 1, x, y)`. -/
def normalizedFive (x y : K) : Fin 5 → Point K :=
  ![infinity K, finitePoint K 0, finitePoint K 1, finitePoint K x, finitePoint K y]

/-- Normalized coordinates are distinct when the two affine parameters are admissible. -/
example {x y : K} (hx0 : x ≠ 0) (hx1 : x ≠ 1) (hy0 : y ≠ 0) (hy1 : y ≠ 1)
    (hxy : x ≠ y) : Function.Injective (normalizedFive K x y) := by
  sorry

/-- The point at infinity is outside the finite chart. -/
example (x : K) : infinity K ≠ finitePoint K x := by
  sorry

/-- L2.Fb: the affine formula for the homogeneous cross-ratio. -/
theorem crossRatio_finite (a b c d : K) :
    crossRatio K (finitePoint K a) (finitePoint K b) (finitePoint K c) (finitePoint K d) =
      (a - b) * (c - d) / ((a - d) * (c - b)) := by sorry

example : crossRatio ℚ (infinity ℚ) (finitePoint ℚ 0) (finitePoint ℚ 1) (finitePoint ℚ 3) = -2 := by
  sorry

example : detPair ℚ ![2, 4] ![3, 6] = 0 := by sorry

example : detPair ℚ ![1, 0] ![0, 1] = 1 := by sorry

example (x y : K) : finitePoint K x = finitePoint K y ↔ x = y := by sorry

example : finitePoint ℚ 0 = Projectivization.mk ℚ ![0, 1] (by sorry) ∧
    finitePoint ℚ 1 ≠ finitePoint ℚ 0 := by sorry

example : infinity ℚ = Projectivization.mk ℚ ![7, 0] (by sorry) := by sorry

example : detPair ℚ ![0, 1] ![1, 0] = -1 ∧ detPair ℚ ![2, 0] ![0, 3] = 6 := by sorry

/-- Rescaling both vectors multiplies the determinant by both scalars. -/
example (v w : Fin 2 → K) (a b : K) :
    detPair K (a • v) (b • w) = a * b * detPair K v w := by sorry

example : crossRatio ℚ (finitePoint ℚ 0) (finitePoint ℚ 1)
    (finitePoint ℚ 2) (finitePoint ℚ 3) = -1 / 3 := by sorry

example : crossRatio ℚ (finitePoint ℚ 0) (infinity ℚ)
    (finitePoint ℚ 1) (finitePoint ℚ 3) = 2 / 3 := by sorry

example : crossRatio ℚ (finitePoint ℚ 0) (finitePoint ℚ 1)
    (infinity ℚ) (finitePoint ℚ 3) = 1 / 3 := by sorry

example : crossRatio ℚ (finitePoint ℚ 0) (finitePoint ℚ 1)
    (finitePoint ℚ 3) (infinity ℚ) = -1 / 2 := by sorry

example : crossRatio ℚ (finitePoint ℚ 0) (finitePoint ℚ 1)
    (finitePoint ℚ 2) (finitePoint ℚ 0) = 0 := by sorry

/-- Four independently rescaled representatives give the same cross-ratio. -/
example : crossRatio ℚ
    (Projectivization.mk ℚ ![2, 0] (by sorry))
    (Projectivization.mk ℚ ![0, 3] (by sorry))
    (Projectivization.mk ℚ ![5, 5] (by sorry))
    (Projectivization.mk ℚ ![21, 7] (by sorry)) = -2 := by sorry

example : (fun i : Fin 5 => crossRatio ℚ
    (normalizedFive ℚ 2 3 i) (normalizedFive ℚ 2 3 (i + 1))
    (normalizedFive ℚ 2 3 (i + 2)) (normalizedFive ℚ 2 3 (i + 3))) =
      ![-1, -1 / 3, -1, -1 / 2, -1 / 2] := by sorry

example : Function.Injective (normalizedFive ℚ 2 3) ∧
    ¬ Function.Injective (normalizedFive ℚ 2 2) := by sorry

/-- A scalar five-term identity for a function with the two-term laws transfers to every
injective five-tuple of points; no relation in the integral pre-Bloch group is asserted. -/
theorem cyclic_relation_of_scalar {A : Type*} [AddCommGroup A] (f : K → A)
    (hc : ∀ z : K, z ≠ 0 → z ≠ 1 → f (1 - z) = -f z)
    (hi : ∀ z : K, z ≠ 0 → z ≠ 1 → f z⁻¹ = -f z)
    (hf : ∀ x y : K, x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
      f x - f y + f (y / x) - f ((1 - x⁻¹) / (1 - y⁻¹)) + f ((1 - x) / (1 - y)) = 0)
    (s : Fin 5 → Point K) (hs : Function.Injective s) :
    ∑ i : Fin 5, f (crossRatio K (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by sorry

end ProjectiveAlgebra

/-! ## Layer L3: positive integer L-values and regulators -/

section PositiveIntegerValues

open scoped AbstractMeasure

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
  [CharZero K] [Algebra ℤ_[p] K] [ContinuousSMul ℤ_[p] K]

/-- The operator `∂ = (1 + T) d/dT` on Amice transforms. -/
def dop (f : PowerSeries K) : PowerSeries K :=
  (1 + PowerSeries.X) * PowerSeries.derivative f

open scoped Classical in
/-- The test function `x ↦ 1_{ℤ_p^×}(x) · x^{-k}`. -/
def unitsZPow (k : ℤ) : C(ℤ_[p], K) :=
  ⟨fun x => if IsUnit x then (algebraMap ℤ_[p] K x) ^ (-k) else 0, by sorry⟩

/-- L3.3: the Amice transform `w(1+T)/(1 - w(1+T)) = Li₀(w(1+T))` of the geometric measure. -/
def geometricTransform (w : K) : PowerSeries K :=
  PowerSeries.C w * (1 + PowerSeries.X) * (1 - PowerSeries.C w * (1 + PowerSeries.X))⁻¹

/-- For `w = 0` the transform is `0`. -/
example : geometricTransform (0 : K) = 0 := by sorry

/-- Non-example: at `w = 1` (inside the residue disc of `1`) the constant coefficient of
`1 - w(1+T)` vanishes, Mathlib's formal inverse is `0`, and the transform collapses to `0`; the
geometric measure exists only for `‖w - 1‖ = 1`. -/
example : geometricTransform (1 : K) = 0 := by sorry

/-- At a nonsingular formal parameter the constant coefficient need not vanish. -/
example : PowerSeries.constantCoeff (geometricTransform (-1 : K)) = -1 / 2 := by sorry

/-- Constant series converge on the open disc; the geometric series reaches its boundary. -/
example (c : K) : RestrictedPowerSeries.OnOpenDisc 1 (PowerSeries.C c) := by sorry

example : RestrictedPowerSeries.OnOpenDisc 1 ((1 - (PowerSeries.X : PowerSeries K))⁻¹) ∧
    ¬ ((1 - (PowerSeries.X : PowerSeries K))⁻¹).IsRestricted 1 := by sorry

/-- Evaluation retains the constant coefficient at the centre. -/
example (f : PowerSeries K) :
    RestrictedPowerSeries.eval₂ (RingHom.id K) f 0 = PowerSeries.constantCoeff f := by sorry

example (c t : K) : RestrictedPowerSeries.eval₂ (RingHom.id K) (PowerSeries.C c) t = c := by sorry

/-- The Amice derivative has the factor `1 + T`, including at weight zero. -/
example : dop (PowerSeries.X : PowerSeries K) = 1 + PowerSeries.X := by sorry

example : dop (1 : PowerSeries K) = 0 := by sorry

/-- The negative-moment test vanishes at zero and has value one at the unit one. -/
example (k : ℤ) : unitsZPow (p := p) (K := K) k 0 = 0 ∧
    unitsZPow (p := p) (K := K) k 1 = 1 := by sorry

example : dop ((PowerSeries.X : PowerSeries K) ^ 2) =
    2 * PowerSeries.X + 2 * PowerSeries.X ^ 2 := by sorry

example (c : K) : (dop (K := K))^[0] (PowerSeries.C c) = PowerSeries.C c := by sorry

example (c : K) (n : ℕ) : (dop (K := K))^[n + 1] (PowerSeries.C c) = 0 := by sorry

example (k : ℤ) : unitsZPow (p := p) (K := K) k (p : ℤ_[p]) = 0 := by sorry

example : unitsZPow (p := p) (K := K) 1 (-1) = -1 ∧
    unitsZPow (p := p) (K := K) 2 (-1) = 1 := by sorry

/-- L3.6: if `∂^k F = A_μ` with `F ∈ R⁺`, then
`∫_{ℤ_p^×} x^{-k} dμ = F(0) - p⁻¹ ∑_{ξ ∈ μ_p} F(ξ - 1)`. -/
theorem negMoment_eq_of_primitive (μ : D(ℤ_[p], K)) (k : ℕ) (F : PowerSeries K)
    (hF : RestrictedPowerSeries.OnOpenDisc 1 F) (hder : dop^[k] F = μ.amiceTransform)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) :
    μ (unitsZPow (k : ℤ)) =
      RestrictedPowerSeries.eval₂ (RingHom.id K) F 0 - (p : K)⁻¹ *
        ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K),
          RestrictedPowerSeries.eval₂ (RingHom.id K) F (ξ - 1) := by
  sorry

/-- L3.18: `R_b(w(1+T)) · Q_b(w(1+T))⁻¹` with `Q_b(Z) = ∑_{i<b} Zⁱ` and
`R_b(Z) = ∑_{i<b-1} (b-1-i) Zⁱ`; only `Q_b(w(1+T))` is inverted, so the definition also works at
`w = 1`, where it is the smoothing transform `1/T - b/((1+T)^b - 1)`. -/
def rotatedSmoothedTransform (b : ℕ) (w : K) : PowerSeries K :=
  (∑ i ∈ Finset.range (b - 1),
    PowerSeries.C ((b - 1 - i : ℕ) : K) * (PowerSeries.C w * (1 + PowerSeries.X)) ^ i) *
  (∑ i ∈ Finset.range b, (PowerSeries.C w * (1 + PowerSeries.X)) ^ i)⁻¹

/-- L3.18: the value at the removable centre is `(b - 1)/2`. -/
theorem constantCoeff_rotatedSmoothedTransform_one (b : ℕ) (hb : 1 ≤ b) :
    PowerSeries.constantCoeff (rotatedSmoothedTransform b (1 : K)) = ((b : K) - 1) / 2 := by
  sorry

/-- For `b = 1` both finite sums are trivial and the transform is `0`. -/
example (w : K) : rotatedSmoothedTransform 1 w = 0 := by sorry

/-- Smoothing at the formerly singular centre has a nonzero finite value. -/
example : PowerSeries.constantCoeff (rotatedSmoothedTransform 2 (1 : K)) = 1 / 2 := by sorry

example : PowerSeries.coeff 1 (rotatedSmoothedTransform 2 (1 : ℚ_[3])) = -1 / 4 := by sorry

example : PowerSeries.constantCoeff (rotatedSmoothedTransform 3 (1 : ℚ_[2])) = 1 := by sorry

example : PowerSeries.constantCoeff (rotatedSmoothedTransform 2 (4 : ℚ_[3])) = 1 / 5 := by sorry

/-- Separate inverses at the centre vanish and do not give the regularized transform. -/
example :
    let W : PowerSeries ℚ_[3] := 1 + PowerSeries.X
    (W - 1)⁻¹ - 2 * (W ^ 2 - 1)⁻¹ = 0 ∧
      rotatedSmoothedTransform 2 (1 : ℚ_[3]) ≠ (W - 1)⁻¹ - 2 * (W ^ 2 - 1)⁻¹ := by sorry

/-- A nonunit smoothing parameter gives a coefficient of norm greater than one. -/
example : PowerSeries.coeff 1 (rotatedSmoothedTransform 3 (1 : ℚ_[3])) = -2 / 3 ∧
    ‖PowerSeries.coeff 1 (rotatedSmoothedTransform 3 (1 : ℚ_[3]))‖ = 3 := by sorry

example :
    let W : PowerSeries ℚ_[3] := PowerSeries.C 4 * (1 + PowerSeries.X)
    rotatedSmoothedTransform 2 (4 : ℚ_[3]) = (W - 1)⁻¹ - 2 * (W ^ 2 - 1)⁻¹ := by sorry

/-! ### L3.13: the complex formula -/

/-- L3.13: `L(θ, k) = G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(e^{2πic/N})` for a primitive character of
conductor `N ≥ 2` and `k ≥ 2`, with the complex polylogarithm of L2.Fa (RJW Theorem 6.7(i)). -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (k : ℕ) (hk : 2 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog k (ZMod.stdAddChar c) := by
  sorry

end PositiveIntegerValues

/-- L3.Fc.3 and L3.15: a primitive cube root at `p = 3` is a unit but not a special
unit, so its syntomic regulator uses distribution and finite base change. -/
example {ζ : ℂ_[3]} (hζ : IsPrimitiveRoot ζ 3) :
    ‖ζ‖ = 1 ∧ ‖1 - ζ‖ = (3 : ℝ) ^ (-(1 / 2 : ℝ)) ∧ ‖1 - ζ‖ < 1 := by
  sorry

/-- L3.Fa.4: a functional taking value `1` on a vector detects its nonzero diagonal tensor,
whereas alternating projection kills it. For `O = ℤ_(2)`, the actual symbolic and de Jeu
complexes are zero. Taking `[3]` in `Oˣ ⊗ ℚ` and `v₃` detects the nonzero `H²` that
would be introduced by appending an unwarranted tensor term. -/
example {V : Type*} [AddCommGroup V] [Module ℚ V] (v : V) (f : V →ₗ[ℚ] ℚ)
    (hv : f v = 1) :
    TensorProduct.tmul ℚ v v ≠ 0 ∧
      exteriorPower.ιMulti ℚ 2 (fun _ : Fin 2 => v) = 0 := by
  sorry

/-!
## Targets specified in the README

* L0: annulus residues and logarithmic primitives (L0.11–L0.12, L0.20–L0.25); the
  Iwasawa decomposition, normalized logarithm, restriction and equivariance imported from
  DirichletPadicLFunctions §0.6, and their general-branch valuation adapters (L0.14–L0.18).
  The zero branch is the supplied `iwasawaLog p`, including its value at zero.
  The branch existence and change milestones are stated above.
* L1: good-reduction pairs, wide opens, dagger algebras, logarithmic ends and Frobenius lifts
  (L1.1–L1.6), with whole-disc Frobenius maps on ordinary residue discs and cofinal annular
  pullbacks at removed ends; coordinate maps, change of basis and iteration of Frobenius data (L1.7);
  their geometric existence and the differential/dualizing-sheaf comparison (L1.9); the
  shuffle word algebra, its differential, depth and Frobenius action (L1.12–L1.16);
  algebraic coefficient extension, meromorphic-primitive descent and injective restrictions
  (L1.17a: `colemanCoefficients_exact`, `colemanCoefficients_meromorphicPrimitive`,
  `colemanCoefficients_restrict_injective`); Coleman functions and integration, uniqueness, Taylor
  transport with finite-chart convergence and gluing, lift and branch independence and
  pullback (L1.17–L1.24, L1.43); the punctured and four-punctured lines and their explicit data (L1.25–L1.42, L1.44).
* L2: the log-Laurent class and the global polylogarithm family and its uniqueness
  (L2.3–L2.6, L2.16), tangential normalization, differential, inversion, distribution and
  branch-change identities, value at one, Frobenius-modified polylogarithms, Galois
  compatibility and root-of-unity values (L2.2–L2.29); Coleman's dilogarithm, the scalar
  five-term defect, boundary analysis and five-term theorem (L2.18–L2.69); the integral
  pre-Bloch group, antisymmetric tensor quotient, boundary, Bloch group, functorial maps
  and dilogarithm evaluation (L2.Fb); the projective dilogarithm theorem and twisted sums
  (L2.70–L2.71). The complex series and the scalar-to-projective algebraic reduction
  have representative signatures above.
* L3: geometric and smoothed measures, Taylor primitives and polylogarithmic moments,
  character transforms and the p-adic L-function forms of Coleman's formula
  (L3.1–L3.12, L3.17–L3.35); the modified regulator polylogarithm (L3.14), rational
  K-theory scheme adapters and symbols, modified syntomic cohomology, Chern characters, regulator
  pairings and Artin L-functions with coefficients (L3.Fa.1–L3.Fd.2); cyclotomic
  regulators and the p-adic Beilinson conjecture, including the dyadic formulas
  (L3.15–L3.16, L3.36–L3.37).

In L3.Fb.1, `modSyntomicComplex` is indexed by `(φ,q)`. The chain map
`modSyntomicComplex.iterate` to `(φ^m,q^m)` sends `(ω,ε)` to
`(ω,(1 + T + ⋯ + T^(m-1))ε)` for `T = φ*/q^n` and `m ≥ 1`.
`modSyntomicComplex.directLimit` supplies the general theory, with common finite descent
refinements and comparisons of rigid realizations. The explicit pair description is at a
fixed stage; the normalized rigid identification in the stated comparison range commutes
with transitions. Cup products and finite base change use common stages, including in
relative cubes. In L3.Fb.2, `syntomicRegulator_weightOne` requires `ϕ* f̄ = f̄^q`
at its representing stage: its second component is the dagger function
`log(f^q/φ*f)/q`. Every finite collection of units admits a common compatible iterate.
For `R = W(F₄), a³ = 1 ≠ a, f = t-a` on the complement of the roots of `t²+t+1`,
`φ(t) = t²` at `q = 2` fails this condition and the required differential has end
residues `+1,-1`; at `φ²(t) = t⁴, q = 4` the unit formula applies.

In L3.Fd.2(a), `rayClassPartialZeta` and `rayClassPartialZeta_rational` supply
ray-class partial-zeta continuation and rationality at all nonpositive integers, with
arithmetic Frobenius and the removed p-Euler factors. In (b),
`partialZeta_smoothed_congruences` bounds polynomial moment tests for the moments
`N(𝔞)^(-n)(b^(-n-1)-1)ζ_c(-n)`. The target `partialZetaMeasure` extends this bounded
functional to the native `AbstractMeasure` carrier on `1 + qℤ_p`, using clopen restriction
and Mahler density from PadicMeasuresIwasawaAlgebras. In (c), `partialZetaPadic`,
`partialZetaPadic_common_residue` and `padicArtinL_one_dim_analytic` give the analytic
numerators, smoothing independence, the common residue after the Teichmüller factors,
and pole cancellation for nontrivial characters on the stated ball. Here `q = 4`
for `p = 2`. These arithmetic targets hold over arbitrary totally real number fields;
DirichletPadicLFunctions supplies the comparison over `ℚ`.

In L3.Fa.4 the unreduced complex is the actual alternating symbolic quotient by the
cup-product subcomplex, and the reduced complex is its quotient by the inversion subcomplex.
For residue field `F₂`, all removed-section index sets are empty, and both complexes are
zero in every degree for `n ≥ 2`. When the residue field has more than two elements,
the unreduced last term is `V ⊗ Λ^(n-1)V`, where `V = Oˣ ⊗ ℚ`, and the reduced last term
is its quotient by `d(N₂ ⊗ Λ^(n-2)V)`, identified with `ΛⁿV`.
The unreduced comparison requires Beilinson–Soulé vanishing for the fraction and residue
fields. The general reduced comparison and reduced localization injection require it for
every characteristic-zero field and for the residue field. Number fields give unconditional
comparisons; the zero-source comparisons for residue field `F₂` need no vanishing hypothesis.
The cup-product denominator in symbol weight `k` uses `Symb_(k-1)`. In L3.Fb.5 the square
includes localization from the unlocalized relative cube, and reads
`ℛ ∘ loc = ε_n · (reg ∘ relativityIso)`.

In L3.Fa.2, `cubeRelK.injective_to_generic` uses `NoLowWeightKTheory κ_O` for the
residue field of a discrete valuation ring `O` with fraction field `F`, and keeps the same
finite removed-section set `U ⊆ O^♭` over `O` and `F`. The separate
`cubeRelK.furtherLocalization_injective` over `F` uses `NoLowWeightKTheory F` and an
inclusion `U ⊆ V ⊆ F ∖ {0, 1}` of finite localization sets. Both maps act on
`K_n^(n)` of the `(n-1)`-cube for `n ≥ 1`. Their composition requires both vanishing
hypotheses. L3.Fa.1 supplies them for number fields; at `n = 2` and `O` of characteristic
zero, BDJ Remark 3.26 gives both injections without Beilinson–Soulé assumptions.

In L3.Fa.5 construction and distribution use L3.Fa.4; spanning and the basis theorem use
only the complex calculation of L3.Fc.3 with L3.Fc.1. The complex components of
`cyclotomicDiscriminantDet` and `cyclotomicRegulatorDet` use those constructed classes
and L3.13. The p-adic components of `cyclotomicRegulatorDet` consume L3.15, whose
cyclotomic regulator formula uses only construction and distribution, not the basis theorem.
L3.Fb.5 applies directly to special units; L3.15 supplies the formula at pure p-power roots
by distribution and finite base change (BDJ proof of Theorem 1.12, p. 910).

In L3.Fd.2, `padicArtinL_brauer_indep` compares Brauer decompositions inside a finite
totally real quotient `Gal(L/k)` through which the Artin character factors. Each inducing
character is one-dimensional on a subgroup `H`, its base field is `L^H`, and its kernel
field is a subfield of `L`, hence totally real. Nonzero interpolation values prove that the
factors are nonzero meromorphic functions before negative powers are taken. Equality is
in the field of meromorphic functions on `B` and is independent of the chosen finite
totally real quotient (BBdJR Theorem 2.9 and (2.10)–(2.11), pp. 6–7). The cancellation
`1 = 1 + χ_(−4) - χ_(−4)` over `ℚ` is excluded: that inducing character has kernel
field `ℚ(i)` and identically zero p-adic L-function. At `p = 3, s = -1` totalized
inversion would give zero instead of `L₃(-1, 1, ℚ) = 1/6`.

The following README APIs specify further targets in these subsections; they do not add
Lean declarations to the representative signatures above:

* L1.7: `FrobeniusDatum.coords_frobenius`.
* L0.2: `PowerSeries.coeff_succ_primitive`, `PowerSeries.coeff_zero_primitive`, `PowerSeries.map_primitive`,
  `PowerSeries.primitive_X_pow`, `PowerSeries.primitive_derivative`, `PowerSeries.primitive_eq_log`.
* L2.Fa: `complexPolylog_coeff`, `complexPolylog_distribution`, `complexPolylog_hasSum`, `complexPolylog_one`,
  `complexPolylog_rootOfUnity_one`.
* L2.Fb: `crossRatio_admissible`, `crossRatio_complement`, `crossRatio_fieldMap`, `crossRatio_infinity_first`,
  `crossRatio_infinity_fourth`, `crossRatio_infinity_second`, `crossRatio_infinity_third`,
  `crossRatio_inverse`, `crossRatio_linearEquiv`, `crossRatio_mk`, `crossRatio_pair_swap`,
  `detPair_eq_zero_iff`, `detPair_smul`, `detPair_swap`, `finitePoint_injective`, `finitePoint_ne_infinity`,
  `normalizedFive_crossRatios`, `normalizedFive_injective_iff`.
* L0.7: `discAnalytic.deriv_mem`, `discAnalytic.eq_zero_of_eqOn`.
* L3.6: `dop_C`, `dop_X`, `dop_add`, `dop_iterate`, `dop_smul`, `unitsZPow_mul`, `unitsZPow_of_isUnit`,
  `unitsZPow_of_not_isUnit`, `unitsZPow_one`, `unitsZPow_zero`.
* L0.15: `isLogBranch_padicLogBranch`.
* L0.A1: `laurentGaussNorm_add_le`, `laurentGaussNorm_eq_zero_iff`.
* L0.A1: `laurentGaussNorm_logConvex`.
* L0.A2: `laurentSeriesEval_add`, `laurentSeriesEval_laurentMul`, `laurentSeriesEval_one`.
* L2.1: `polylogSer_eq_eval_polylogSeries`, `polylogSer_hasDerivAt`, `polylogSer_map`,
  `polylogSer_mem_of_mem`, `polylogSer_one_eq_neg_logOneAdd`, `polylogSer_zero`, `polylogSer_zero_index`.
* L0.F: `rationalPolylogSeries_one_eq_neg_log`, `rationalPolylogSeries_zero_weight`.
* L3.18: `rotatedSmoothedTransform_coeff_bound`, `rotatedSmoothedTransform_eq_rational`,
  `rotatedSmoothedTransform_eval`, `rotatedSmoothedTransform_map`, `rotatedSmoothedTransform_mem_openDisc`,
  `rotatedSmoothedTransform_mul_denominator`, `rotatedSmoothedTransform_one`,
  `rotatedSmoothedTransform_parameter_one`, `rotatedSmoothedTransform_unique`.

L3.Fa.1 specializes GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3's `quillenQ`,
`exactKGroup`, `exactKGroup_zero_iso`, `exactKGroup_map`, `nerveRealization_homotopy`,
`quillenTheoremA` and `quillenTheoremB`. Its `QuillenQ`, `higherKGroup` and `higherKGroup.map`
are scheme adapters. The proof of `noLowWeightKTheory_of_algebraic_over_Fp` uses that supplier's
§6.10 `finiteFieldKGroups` and the finite-subfield filtered-colimit comparison constructed here.

The README uses the pinned power-series operations `PowerSeries.coeff_derivative`, `PowerSeries.coeff_inv`,
`PowerSeries.coeff_map`, `PowerSeries.coeff_mul`, `PowerSeries.constantCoeff_inv`,
`PowerSeries.derivative_log_mul_one_add_X`, `PowerSeries.inv_eq_zero`, `PowerSeries.isRestricted_iff`,
`PowerSeries.isUnit_iff_constantCoeff`, `PowerSeries.mul_inv_cancel`.

Geometric suppliers are AdicSpacesPartII R1.9 (`rigid-identity-principle`, from
RigidAnalyticGeometry §7.3), AdicSpacesPartIII R2.3 (`raynaud-generic-fibre`),
R2.9 (`residue-disc`) and R3.7 (`proper-gaga`), and AdicSpacesPartIV F1.6
(`dagger-tate-acyclicity`), F1.7 (`dagger-coherent-module`), F1.8
(`dagger-identity-principle`), F1.9 (`dagger-differentials`, `dagger-smooth-space`)
and F1.11 (`dagger-de-rham-finite-field-extension`).
-/

end TauCetiRoadmap.ColemanIntegration
