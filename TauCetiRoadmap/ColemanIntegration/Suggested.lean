import Mathlib
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

/-- The interface used by Layers L2 and L3: `L` is multiplicative on `ℂ_p^×`, is the logarithm
series on `1 + 𝔪`, and sends `p` to `a`. -/
structure IsLogBranch (p : ℕ) [Fact p.Prime] (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

/-- For `k ≥ 2`, `Li_k^ℂ(z) = ∑_{n ≥ 1} zⁿ/nᵏ` on the closed unit disc. At weight one use
`-log (1-z)`: its boundary series converges in the natural order, whereas Mathlib's `tsum`
requires unconditional convergence and would give zero at `z = -1`. -/
def complexPolylog (k : ℕ) (z : ℂ) : ℂ :=
  if k = 1 then -Complex.log (1 - z)
  else ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k

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

/-- L0.F: weight zero is the formal geometric series with zero constant term. -/
theorem rationalPolylogSeries_zero_weight :
    rationalPolylogSeries 0 = PowerSeries.X * (1 - PowerSeries.X)⁻¹ := by
  sorry

/-- L0.F: weight one is the negative logarithm after substitution of `-X`. -/
theorem rationalPolylogSeries_one_eq_neg_log :
    rationalPolylogSeries 1 = -PowerSeries.subst (-PowerSeries.X) (PowerSeries.log ℚ) := by
  sorry

/-! ### L0.2–L0.5: the normalised formal primitive -/

namespace PowerSeries

open _root_.PowerSeries

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- The normalised formal primitive `∑ aₙ Xⁿ ↦ ∑ aₙ Xⁿ⁺¹/(n+1)` over a `ℚ`-algebra. -/
def primitive : A⟦X⟧ →ₗ[A] A⟦X⟧ where
  toFun f := mk fun n => if n = 0 then 0 else algebraMap ℚ A (1 / (n : ℚ)) * coeff (n - 1) f
  map_add' := by sorry
  map_smul' := by sorry

/-- L0.3: differentiating the normalized formal primitive recovers the series. -/
theorem derivative_primitive (f : A⟦X⟧) : derivative (primitive f) = f := by
  sorry

/-- L0.4: the primitive with a given constant term is unique. -/
theorem eq_C_add_primitive_iff (f g : A⟦X⟧) (c : A) :
    (derivative g = f ∧ constantCoeff g = c) ↔ g = C c + primitive f := by
  sorry

/-- L0.3: integration after differentiation removes precisely the constant term. -/
theorem primitive_derivative (f : A⟦X⟧) :
    primitive (derivative f) = f - C (constantCoeff f) := by
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
radius no larger than the original radius. Containment of the sets of field-valued points
alone does not provide this radius bound. -/
theorem discAnalytic.restrict {a b : K} {r r' : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r)
    (hb : b ∈ Metric.eball a r) (hr' : 0 < r') (hle : r' ≤ r) :
    ∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall f Q b r' := by
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

/-- L0.7: a whole-disc analytic function vanishing on a nonempty open subset vanishes
throughout the disc. -/
theorem discAnalytic.eq_zero_of_eqOn {a : K} {r : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r)
    {U : Set K} (hU : IsOpen U) (hne : U.Nonempty) (hUr : U ⊆ Metric.eball a r)
    (h0 : ∀ z ∈ U, f z = 0) : ∀ z ∈ Metric.eball a r, f z = 0 := by
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

/-- L0.10: the logarithm series represents its sum on the whole open unit disc. -/
theorem hasFPowerSeriesOnBall_logOneAdd_of_ultrametric [CompleteSpace K] :
    HasFPowerSeriesOnBall (NormedSpace.logOneAdd K K)
      (NormedSpace.logOneAddSeries K K) 0 1 := by
  sorry

/-- L0.10: the derivative of the series logarithm is the reciprocal of the principal unit. -/
theorem hasDerivAt_logOneAdd_of_ultrametric [CompleteSpace K] {u : K} (hu : ‖u‖ < 1) :
    HasDerivAt (NormedSpace.logOneAdd K K) (1 + u)⁻¹ u := by
  sorry

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

/-- L0.12: on an open annulus a differential has a Laurent primitive exactly when its
residue vanishes; the coefficient equation is `dg = a dT`. -/
theorem exists_laurent_primitive_iff [CharZero K] {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty) {a : ℤ → K} (ha : IsLaurentOn I a) :
    (∃ g : ℤ → K, IsLaurentOn I g ∧
      ∀ n : ℤ, ((n + 1 : ℤ) : K) * g (n + 1) = a n) ↔ a (-1) = 0 := by
  sorry

/-- L0.22: adjoining a formal logarithm makes every Laurent differential integrable.
The two summands encode differentiation of its coefficient and of the logarithm power. -/
theorem exists_logLaurent_primitive [CharZero K] {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty) (F : Polynomial (ℤ → K))
    (hF : ∀ k, IsLaurentOn I (F.coeff k)) :
    ∃ G : Polynomial (ℤ → K), (∀ k, IsLaurentOn I (G.coeff k)) ∧
      ∀ (k : ℕ) (n : ℤ), ((n + 1 : ℤ) : K) * G.coeff k (n + 1) +
        ((k + 1 : ℕ) : K) * G.coeff (k + 1) (n + 1) = F.coeff k n := by
  sorry

/-- L0.22: the kernel of differentiation in the logarithmic Laurent ring consists
precisely of scalar constants. -/
theorem logLaurent_derivative_eq_zero_iff [CharZero K] {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty) (F : Polynomial (ℤ → K))
    (hF : ∀ k, IsLaurentOn I (F.coeff k)) :
    (∀ (k : ℕ) (n : ℤ), ((n + 1 : ℤ) : K) * F.coeff k (n + 1) +
      ((k + 1 : ℕ) : K) * F.coeff (k + 1) (n + 1) = 0) ↔
        ∃ c : K, F = Polynomial.C (Pi.single 0 c) := by
  sorry

end LaurentCarrier

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

/-- L0.19: a logarithm branch is locally analytic away from zero, with derivative `1/x`. -/
theorem IsLogBranch.hasDerivAt {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) {x : ℂ_[p]} (hx : x ≠ 0) : HasDerivAt L x⁻¹ x := by
  sorry

/-- L0.17: continuous field automorphisms transport a logarithm branch along its parameter. -/
theorem IsLogBranch.map_ringEquiv {a : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ)
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p (σ a) L')
    {x : ℂ_[p]} (hx : x ≠ 0) : L' (σ x) = σ (L x) := by
  sorry

/-- L0.17: a branch whose parameter belongs to a finite extension preserves that extension. -/
theorem IsLogBranch.mem_intermediateField {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (F : IntermediateField ℚ_[p] ℂ_[p]) [FiniteDimensional ℚ_[p] F]
    (ha : a ∈ F) {x : ℂ_[p]} (hx : x ∈ F) (hne : x ≠ 0) : L x ∈ F := by
  sorry

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

/-- L2.63: a logarithmic Laurent expansion is determined by its values on an outer annulus
`r < ‖z - c‖ < 1`. -/
theorem IsLogLaurentNear.eqOn_punctured {a : ℂ_[p]} {L f g : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) {c : ℂ_[p]} (hf : IsLogLaurentNear p L f c)
    (hg : IsLogLaurentNear p L g c) {r : ℝ} (hr0 : 0 ≤ r) (hr : r < 1)
    (hfg : ∀ z, r < ‖z - c‖ → ‖z - c‖ < 1 → f z = g z) :
    ∀ z, 0 < ‖z - c‖ → ‖z - c‖ < 1 → f z = g z := by
  sorry

/-- L0.21: a polynomial relation in a logarithm branch with convergent Laurent
coefficients on an open annulus has all coefficients zero. -/
theorem logBranch_laurent_transcendental {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty)
    (N : ℕ) (g : Fin (N + 1) → ℤ → ℂ_[p])
    (hg : ∀ k, IsLaurentOn I (g k))
    (h0 : ∀ z : ℂ_[p], ‖z‖ ∈ I →
      ∑ k : Fin (N + 1), laurentSeriesEval (g k) z * L z ^ (k : ℕ) = 0) :
    ∀ k, g k = 0 := by
  sorry

end LogLaurent

/-! ## Layer L1: Frobenius continuation and Coleman functions -/

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

/-- L1.7: Frobenius sends de Rham coordinates `c` to `Mᵀc`; exact corrections do not
affect these coordinates. -/
theorem coords_frobenius (h1 : 𝔇.H1) (η : Ω) (c c' : Fin r → K) (h h' : A)
    (hη : η = 𝔇.d h + ∑ i, c i • 𝔇.ω i)
    (hφη : 𝔇.φΩ η = 𝔇.d h' + ∑ j, c' j • 𝔇.ω j) :
    ∀ j, c' j = ∑ i, c i * 𝔇.M i j := by
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
  simp [constantTerm]

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

/-- L2.1: the rational polylogarithm coefficients have radius exactly one over `ℂ_p`. -/
theorem radius_polylogSeries (k : ℤ) :
    (FormalMultilinearSeries.ofScalars ℂ_[p]
      (fun n => if n = 0 then 0 else ((n : ℂ_[p]) ^ k)⁻¹)).radius = 1 := by
  sorry

open Classical in
/-- L2.1: termwise differentiation gives the polylogarithm differential recursion, with
its removable value at the origin. -/
theorem polylogSer_hasDerivAt (k : ℤ) {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    HasDerivAt (polylogSer p (k + 1)) (if z = 0 then 1 else polylogSer p k z / z) z := by
  sorry

/-- L2.1: weight zero sums to the rational function on the open unit disc. -/
theorem polylogSer_zero_index {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    polylogSer p 0 z = z / (1 - z) := by
  sorry

/-- L2.1: weight one agrees with the principal-unit logarithm series. -/
theorem polylogSer_one_eq_neg_logOneAdd {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    polylogSer p 1 z = -NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (-z) := by
  sorry

/-- L2.1: the series polylogarithm commutes with continuous field automorphisms. -/
theorem polylogSer_map (k : ℤ) (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ)
    {z : ℂ_[p]} (hz : ‖z‖ < 1) : σ (polylogSer p k z) = polylogSer p k (σ z) := by
  sorry

/-- L2.1: values of the polylogarithm series remain in every closed coefficient subfield. -/
theorem polylogSer_mem_of_mem (k : ℤ) (F : Subfield ℂ_[p]) (hF : IsClosed (F : Set ℂ_[p]))
    {z : ℂ_[p]} (hz : z ∈ F) (hz1 : ‖z‖ < 1) : polylogSer p k z ∈ F := by
  sorry

open Classical in
/-- L2.2: the distance of a primitive root of unity from one is determined by whether
its exact order is a power of the residue characteristic. -/
theorem rootOfUnity_norm_one_sub {N : ℕ} (hN : 2 ≤ N) {ζ : ℂ_[p]}
    (hζ : IsPrimitiveRoot ζ N) :
    ‖1 - ζ‖ ^ Nat.totient N =
      if ∃ r : ℕ, N = p ^ (r + 1) then (p : ℝ)⁻¹ else 1 := by
  sorry

end PolylogSeries

/-! ### L2.Fa: complex polylogarithms on the closed unit disc -/

section ComplexPolylog

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

/-- L2.Fa: the defining series sums unconditionally on the closed disc in weights at
least two, and on the open disc in weight one. -/
theorem complexPolylog_hasSum {k : ℕ} {z : ℂ}
    (h : (2 ≤ k ∧ ‖z‖ ≤ 1) ∨ (k = 1 ∧ ‖z‖ < 1)) :
    HasSum (fun n : ℕ => z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k) (complexPolylog k z) := by
  sorry

/-- L2.Fa: weight-one boundary values at nontrivial roots of unity are ordered limits
of partial sums, including the conditionally convergent case. -/
theorem complexPolylog_rootOfUnity_one {N : ℕ} (hN : 0 < N) {ζ : ℂ}
    (hζ : ζ ^ N = 1) (hne : ζ ≠ 1) :
    Tendsto (fun M : ℕ => ∑ n ∈ Finset.range M, ζ ^ (n + 1) / (n + 1 : ℂ))
      atTop (𝓝 (complexPolylog 1 ζ)) := by
  sorry

/-- L2.Fa: averaging over all `m`-th roots of unity gives the distribution relation
throughout the closed unit disc. -/
theorem complexPolylog_distribution {k m : ℕ} (hk : 2 ≤ k) (hm : 0 < m)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    complexPolylog k (z ^ m) = (m : ℂ) ^ (k - 1) *
      ∑ ζ ∈ Polynomial.nthRootsFinset m (1 : ℂ), complexPolylog k (ζ * z) := by
  sorry

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

/-- L2.Fb: the affine formula for the homogeneous cross-ratio. -/
theorem crossRatio_finite (a b c d : K) :
    crossRatio K (finitePoint K a) (finitePoint K b) (finitePoint K c) (finitePoint K d) =
      (a - b) * (c - d) / ((a - d) * (c - b)) := by sorry

/-- L2.Fb: the cross-ratio of four distinct points avoids zero and one. -/
theorem crossRatio_admissible (s : Fin 4 → Point K) (hs : Function.Injective s) :
    crossRatio K (s 0) (s 1) (s 2) (s 3) ≠ 0 ∧
      crossRatio K (s 0) (s 1) (s 2) (s 3) ≠ 1 := by
  sorry

/-- L2.Fb: an invertible linear change of homogeneous coordinates preserves the cross-ratio. -/
theorem crossRatio_linearEquiv (g : (Fin 2 → K) ≃ₗ[K] (Fin 2 → K)) (a b c d : Point K) :
    crossRatio K (Projectivization.map g.toLinearMap g.injective a)
      (Projectivization.map g.toLinearMap g.injective b)
      (Projectivization.map g.toLinearMap g.injective c)
      (Projectivization.map g.toLinearMap g.injective d) = crossRatio K a b c d := by
  sorry

/-- L2.Fb: every distinct projective five-tuple admits the normal form `(∞,0,1,x,y)`. -/
theorem normalize_five (s : Fin 5 → Point K) (hs : Function.Injective s) :
    ∃ (g : (Fin 2 → K) ≃ₗ[K] (Fin 2 → K)) (x y : K),
      x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y ∧
        ∀ i, Projectivization.map g.toLinearMap g.injective (s i) = normalizedFive K x y i := by
  sorry

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

/-- Non-example: at `w = 1` (inside the residue disc of `1`) the constant coefficient of
`1 - w(1+T)` vanishes, Mathlib's formal inverse is `0`, and the transform collapses to `0`; the
geometric measure exists only for `‖w - 1‖ = 1`. -/
example : geometricTransform (1 : K) = 0 := by
  unfold geometricTransform
  have h : (1 - PowerSeries.C (1 : K) * (1 + PowerSeries.X))⁻¹ = 0 :=
    PowerSeries.inv_eq_zero.mpr (by simp)
  rw [h, mul_zero]

/-- L3.3: the geometric transform determines a unique bounded measure with integral
norm bound over a finite extension of `ℚ_p`, outside the residue disc of one. -/
theorem existsUnique_geometricMeasure [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [IsScalarTower ℤ_[p] ℚ_[p] K] (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) :
    ∃! μ : D(ℤ_[p], K), μ.amiceTransform = geometricTransform w ∧
      ∀ f : C(ℤ_[p], K), ‖μ f‖ ≤ ‖f‖ := by
  sorry

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

/-- L3.18: the pole-cancelled quotient satisfies its finite denominator equation. -/
theorem rotatedSmoothedTransform_mul_denominator (b : ℕ) (w : K)
    (hQ : (∑ i ∈ Finset.range b, w ^ i) ≠ 0) :
    (∑ i ∈ Finset.range b, (PowerSeries.C w * (1 + PowerSeries.X)) ^ i) *
        rotatedSmoothedTransform b w =
      ∑ i ∈ Finset.range (b - 1),
        PowerSeries.C ((b - 1 - i : ℕ) : K) * (PowerSeries.C w * (1 + PowerSeries.X)) ^ i := by
  sorry

/-- L3.18: the cleared finite denominator equation characterizes the smoothing transform. -/
theorem rotatedSmoothedTransform_unique (b : ℕ) (w : K)
    (hQ : (∑ i ∈ Finset.range b, w ^ i) ≠ 0) (F : PowerSeries K)
    (hF : (∑ i ∈ Finset.range b, (PowerSeries.C w * (1 + PowerSeries.X)) ^ i) * F =
      ∑ i ∈ Finset.range (b - 1),
        PowerSeries.C ((b - 1 - i : ℕ) : K) * (PowerSeries.C w * (1 + PowerSeries.X)) ^ i) :
    F = rotatedSmoothedTransform b w := by
  sorry

/-- L3.19: a unit smoothing parameter and a rotation near one give integral coefficients. -/
theorem rotatedSmoothedTransform_coeff_bound (b : ℕ) (hb : ‖(b : K)‖ = 1)
    (w : K) (hw : ‖w - 1‖ < 1) (n : ℕ) :
    ‖PowerSeries.coeff n (rotatedSmoothedTransform b w)‖ ≤ 1 := by
  sorry

/-- L3.20: the rotated transform converges on the whole open unit disc. -/
theorem rotatedSmoothedTransform_mem_openDisc (b : ℕ) (hb : ‖(b : K)‖ = 1)
    (w : K) (hw : ‖w - 1‖ < 1) :
    RestrictedPowerSeries.OnOpenDisc 1 (rotatedSmoothedTransform b w) := by
  sorry

/-- L3.21: evaluating the pole-cancelled series gives the finite quotient, including
its removable point. -/
theorem rotatedSmoothedTransform_eval (b : ℕ) (hb : ‖(b : K)‖ = 1)
    (w : K) (hw : ‖w - 1‖ < 1) {t : K} (ht : ‖t‖ < 1) :
    RestrictedPowerSeries.eval₂ (RingHom.id K) (rotatedSmoothedTransform b w) t =
      (∑ i ∈ Finset.range (b - 1), ((b - 1 - i : ℕ) : K) * (w * (1 + t)) ^ i) /
        (∑ i ∈ Finset.range b, (w * (1 + t)) ^ i) := by
  sorry

/-- L3.22: away from the singular constants, the cancelled quotient agrees with the
two separate formal reciprocals. -/
theorem rotatedSmoothedTransform_eq_rational (b : ℕ) (hb : 1 ≤ b) (w : K)
    (hw : w ≠ 1) (hwb : w ^ b ≠ 1) :
    rotatedSmoothedTransform b w =
      (PowerSeries.C w * (1 + PowerSeries.X) - 1)⁻¹ -
        PowerSeries.C (b : K) * (PowerSeries.C (w ^ b) * (1 + PowerSeries.X) ^ b - 1)⁻¹ := by
  sorry

/-! ### L3.13: the complex formula -/

/-- L3.13: `L(θ, k) = G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(e^{2πic/N})` for a primitive character of
conductor `N ≥ 2` and `k ≥ 2`, with the complex polylogarithm of L2.Fa (RJW Theorem 6.7(i)). -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (k : ℕ) (hk : 2 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog k (ZMod.stdAddChar c) := by
  sorry

/-- L3.31: at weight one the complex comparison uses the ordered boundary values
of the polylogarithm for a nontrivial primitive character. -/
theorem LFunction_one_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hne : θ ≠ 1) (hN : 2 ≤ N) :
    DirichletCharacter.LFunction θ 1 =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog 1 (ZMod.stdAddChar c) := by
  sorry

end PositiveIntegerValues

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
For `m ≥ 1`, writing `f₀ = f^q/φ*f`, the identity
`f^(q^m)/((φ^m)*f) = ∏_(j=0)^(m-1) ((φ^j)*f₀)^(q^(m-1-j))` gives
`log(f^(q^m)/((φ^m)*f))/q^m = Σ_(j=0)^(m-1) (φ^j)*log(f₀)/q^(j+1)`.
Thus the logarithmic component transforms by `S_m(φ*/q)`.
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

* L0.2: `PowerSeries.coeff_succ_primitive`, `PowerSeries.coeff_zero_primitive`, `PowerSeries.map_primitive`,
  `PowerSeries.primitive_X_pow`, `PowerSeries.primitive_eq_log`.
* L2.Fa: `complexPolylog_coeff`, `complexPolylog_one`.
* L2.Fb: `crossRatio_complement`, `crossRatio_fieldMap`, `crossRatio_infinity_first`,
  `crossRatio_infinity_fourth`, `crossRatio_infinity_second`, `crossRatio_infinity_third`,
  `crossRatio_inverse`, `crossRatio_mk`, `crossRatio_pair_swap`,
  `detPair_eq_zero_iff`, `detPair_smul`, `detPair_swap`, `finitePoint_injective`, `finitePoint_ne_infinity`,
  `normalizedFive_crossRatios`, `normalizedFive_injective_iff`.
* L0.7: `discAnalytic.deriv_mem`.
* L3.6: `dop_C`, `dop_X`, `dop_add`, `dop_iterate`, `dop_smul`, `unitsZPow_mul`, `unitsZPow_of_isUnit`,
  `unitsZPow_of_not_isUnit`, `unitsZPow_one`, `unitsZPow_zero`.
* L0.15: `isLogBranch_padicLogBranch`.
* L0.A1: `laurentGaussNorm_add_le`, `laurentGaussNorm_eq_zero_iff`.
* L0.A1: `laurentGaussNorm_logConvex`.
* L0.A2: `laurentSeriesEval_add`, `laurentSeriesEval_laurentMul`, `laurentSeriesEval_one`.
* L2.1: `polylogSer_eq_eval_polylogSeries`, `polylogSer_zero`.
* L3.18: `rotatedSmoothedTransform_map`, `rotatedSmoothedTransform_one`,
  `rotatedSmoothedTransform_parameter_one`.

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
