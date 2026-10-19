import Mathlib

/-!
# Arithmetic statistics, Part VIII: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file records light definitions and selected milestones that
can be stated against the pinned Mathlib; it is not exhaustive. Hurwitz schemes,
monodromy representations and the arithmetic counts remain README
targets.

Design choices made explicit here: the Kolmogorov distance lives on Mathlib's
`ProbabilityMeasure ℝ` and its CDFs; the trace estimate is stated for real `q > 1`,
its geometric use specializing `q` to a prime power; similitude cosets use Mathlib's
`Matrix.J` and the convention `h * J * hᵀ = m • J` of `Matrix.symplecticGroup`; the
allowed prime powers form a filter that is `⊥` for the modulus `0`; and degree
densities are taken along odd degrees `2 * m + 1`.
-/

noncomputable section
open scoped BigOperators Topology Polynomial
open Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVIII

/-! ## Layer 5: Function-field distributions and geometric statistics -/

/-! ### Milestone statements on existing carriers -/

/-- The weighted square concentration target of §5.13 separates every collection of blocks
without a multiplicity-one block of size at least `0.99g`. -/
theorem Concentration.weighted_square_concentration (C : ℝ) (hC : 0 ≤ C) :
    ∃ g₀ : ℕ, ∀ g ≥ g₀, ∀ (r : ℕ) (k n : Fin r → ℕ),
      (∀ j, 0 < k j) → (∀ j, 0 < n j) → (∑ j, k j * n j) = g →
      (∀ j, ¬ (k j = 1 ∧ (99 / 100 : ℝ) * g ≤ n j)) →
      (1 / 2 : ℝ) * (∑ j, (k j : ℝ) * (n j : ℝ) ^ 2 * Real.log (n j)) + C * g ^ 2 <
        (99 / 200 : ℝ) * g ^ 2 * Real.log g := by sorry

/-- The integral lift target of §5.17 gives the full closed symplectic image, with the
additional level-nine kernel condition in rank two at the prime three. -/
theorem Similitude.integral_lift (ℓ g : ℕ) [Fact ℓ.Prime] (hℓ : 2 < ℓ) (hg : 1 ≤ g)
    (H : Subgroup (Matrix.symplecticGroup (Fin g) (PadicInt ℓ)))
    (hclosed : IsClosed (H : Set (Matrix.symplecticGroup (Fin g) (PadicInt ℓ))))
    (hred : ∀ M ∈ Matrix.symplecticGroup (Fin g) (ZMod ℓ),
      ∃ h : Matrix.symplecticGroup (Fin g) (PadicInt ℓ), h ∈ H ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          PadicInt.toZMod = M)
    (hsmall : g = 1 ∧ ℓ = 3 →
      ∃ h : Matrix.symplecticGroup (Fin g) (PadicInt ℓ), h ∈ H ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          PadicInt.toZMod = 1 ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          (PadicInt.toZModPow 2) ≠ 1) : H = ⊤ := by sorry

/-- The sections target of §5.22 counts sections of a coprime abelian semidirect product
by the index of the fixed subgroup, expressed as a ratio of finite cardinalities. -/
theorem coprime_semidirect_section_count (Γ H : Type*) [Group Γ] [CommGroup H]
    [Finite Γ] [Finite H] (φ : Γ →* MulAut H)
    (hcoprime : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    Nat.card {s : Γ →* H ⋊[φ] Γ //
      SemidirectProduct.rightHom.comp s = MonoidHom.id Γ} =
        Nat.card H / Nat.card {h : H // ∀ γ, φ γ h = h} := by sorry

/-! ### 5.13 Concentration of polarized isogeny types -/

namespace Concentration

/-- The convex concentration target of §5.13: coordinates in `[0, εg]` summing to `g`
have square sum at most `(ε² + (1 - ε)²) g²` (Lipnowski–Tsimerman, Lemma 5.9). -/
theorem sum_sq_le_of_le_mul {k : ℕ} (g ε : ℝ) (hε₁ : 1 / 2 < ε) (hε₂ : ε < 1)
    (x : Fin k → ℝ) (hx₀ : ∀ i, 0 ≤ x i) (hxε : ∀ i, x i ≤ ε * g)
    (hsum : ∑ i, x i = g) :
    ∑ i, x i ^ 2 ≤ (ε ^ 2 + (1 - ε) ^ 2) * g ^ 2 := by sorry

end Concentration

/-! ### 5.14 Spacing measures and Frobenius model obstructions -/

namespace GeometricStatistics
open MeasureTheory ProbabilityTheory

/-- Sorted cyclic gaps, including the wrap-around gap; the empty multiset gives no gaps. -/
def cyclicGaps (θ : Multiset ℝ) : List ℝ :=
  let xs := θ.sort (· ≤ ·)
  (List.range θ.card).map fun i =>
    if i + 1 < θ.card then xs.getD (i + 1) 0 - xs.getD i 0
    else xs.getD 0 0 + 2 * Real.pi - xs.getD i 0

/-- Each angle contributes one cyclic gap. -/
theorem length_cyclicGaps (θ : Multiset ℝ) : (cyclicGaps θ).length = θ.card := by
  simp [cyclicGaps]

/-- Angles in one half-open period have nonnegative cyclic gaps. -/
theorem cyclicGaps_nonneg (θ : Multiset ℝ)
    (hθ : ∀ t ∈ θ, 0 ≤ t ∧ t < 2 * Real.pi) :
    ∀ Δ ∈ cyclicGaps θ, 0 ≤ Δ := by sorry

/-- A nonempty cycle has total gap one full period. -/
theorem sum_cyclicGaps (θ : Multiset ℝ) (hN : 0 < θ.card) :
    (cyclicGaps θ).sum = 2 * Real.pi := by sorry

/-- The empirical probability law of gaps scaled to have mean one. -/
def spacingMeasure (θ : Multiset ℝ) (hN : 0 < θ.card) : ProbabilityMeasure ℝ :=
  ⟨ENNReal.ofReal ((θ.card : ℝ)⁻¹) •
    ((cyclicGaps θ).map fun Δ =>
      Measure.dirac ((θ.card : ℝ) * Δ / (2 * Real.pi))).sum, by sorry⟩

/-- The spacing law has total mass one. -/
theorem spacingMeasure_univ (θ : Multiset ℝ) (hN : 0 < θ.card) :
    (spacingMeasure θ hN : Measure ℝ) Set.univ = 1 := by sorry

/-- A spacing law from angles in one period is supported on nonnegative gaps. -/
theorem spacingMeasure_Iio_zero (θ : Multiset ℝ) (hN : 0 < θ.card)
    (hθ : ∀ t ∈ θ, 0 ≤ t ∧ t < 2 * Real.pi) :
    (spacingMeasure θ hN : Measure ℝ) (Set.Iio 0) = 0 := by sorry

/-- Arguments of all complex polynomial roots in `[0, 2π)`, with multiplicity. -/
def eigenangles (P : ℂ[X]) : Multiset ℝ :=
  P.roots.map fun z => toIcoMod (by positivity : 0 < 2 * Real.pi) 0 (Complex.arg z)

/-- A complex polynomial of degree `2g` has `2g` eigenangles counted with multiplicity. -/
theorem card_eigenangles (P : ℂ[X]) (g : ℕ) (hP : P.natDegree = 2 * g) :
    (eigenangles P).card = 2 * g := by sorry

/-- Eigenangles lie in the chosen half-open period. -/
theorem eigenangles_mem_Ico (P : ℂ[X]) :
    ∀ t ∈ eigenangles P, t ∈ Set.Ico 0 (2 * Real.pi) := by sorry

/-- Two distinct angles each repeated at least `h` times force `2(h-1)` zero gaps. -/
theorem sub_one_div_le_spacingMeasure_zero (θ : Multiset ℝ) (hN : 0 < θ.card)
    (hθ : ∀ u ∈ θ, 0 ≤ u ∧ u < 2 * Real.pi) (s t : ℝ) (hst : s ≠ t)
    (h : ℕ) (hs : h ≤ θ.count s) (ht : h ≤ θ.count t) :
    2 * ((h : ℝ) - 1) / (θ.card : ℝ) ≤ (spacingMeasure θ hN : Measure ℝ).real {0} := by
  sorry

/-- The multiplicity Check of normalized eigenangle spacing in §5.14 distinguishes repeated
angles from the same two angles without repetitions. -/
theorem repeated_antipodal_spacing_zero_mass :
    (spacingMeasure (↑([0, 0, Real.pi, Real.pi] : List ℝ)) (by norm_num) : Measure ℝ).real {0} =
      1 / 2 ∧
    (spacingMeasure (↑([0, Real.pi] : List ℝ)) (by norm_num) : Measure ℝ).real {0} = 0 := by
  sorry

/-- An empty multiset has no cyclic gaps. -/
example : cyclicGaps 0 = [] := by simp [cyclicGaps]

/-- Supremum CDF distance on the existing probability-measure carrier. -/
def kolmogorovDist (μ ν : ProbabilityMeasure ℝ) : ℝ :=
  ⨆ x : ℝ, |cdf (μ : Measure ℝ) x - cdf (ν : Measure ℝ) x|

/-- CDF distance detects equality of probability laws. -/
theorem kolmogorovDist_eq_zero_iff (μ ν : ProbabilityMeasure ℝ) :
    kolmogorovDist μ ν = 0 ↔ μ = ν := by sorry

/-- Kolmogorov distance is nonnegative, as required by the distance target in §5.14. -/
theorem kolmogorovDist_nonneg (μ ν : ProbabilityMeasure ℝ) : 0 ≤ kolmogorovDist μ ν := by
  sorry

/-- Kolmogorov distance is symmetric. -/
theorem kolmogorovDist_comm (μ ν : ProbabilityMeasure ℝ) :
    kolmogorovDist μ ν = kolmogorovDist ν μ := by sorry

/-- Probability CDFs give Kolmogorov distance at most one. -/
theorem kolmogorovDist_le_one (μ ν : ProbabilityMeasure ℝ) : kolmogorovDist μ ν ≤ 1 := by
  sorry

/-- Kolmogorov distance bounds the discrepancy at each cutoff. -/
theorem abs_cdf_sub_le_kolmogorovDist (μ ν : ProbabilityMeasure ℝ) (x : ℝ) :
    |cdf (μ : Measure ℝ) x - cdf (ν : Measure ℝ) x| ≤ kolmogorovDist μ ν := by sorry

/-- The triangle inequality for Kolmogorov distance. -/
theorem kolmogorovDist_triangle (μ ν ρ : ProbabilityMeasure ℝ) :
    kolmogorovDist μ ρ ≤ kolmogorovDist μ ν + kolmogorovDist ν ρ := by sorry

/-- An atom at zero gives the comparison used by normalized spacing statistics. -/
theorem atom_zero_le_kolmogorovDist (μ ν : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) (Set.Iio 0) = 0)
    (hν : (ν : Measure ℝ) (Set.Iic 0) = 0) :
    (μ : Measure ℝ).real {0} ≤ kolmogorovDist μ ν := by sorry

end GeometricStatistics

/-! ### 5.15 Class-group moments as Hurwitz counts -/

namespace DegreeDensities

/-- Upper density along odd degrees: `limsup_{m → ∞} u (2m + 1)`. -/
def upperOddDensity (u : ℕ → ℝ) : ℝ := limsup (fun m => u (2 * m + 1)) atTop

/-- Lower density along odd degrees: `liminf_{m → ∞} u (2m + 1)`. -/
def lowerOddDensity (u : ℕ → ℝ) : ℝ := liminf (fun m => u (2 * m + 1)) atTop

/-- For bounded sequences the lower odd density is at most the upper one. -/
theorem lowerOddDensity_le_upperOddDensity (u : ℕ → ℝ) (hu : ∃ B, ∀ n, |u n| ≤ B) :
    lowerOddDensity u ≤ upperOddDensity u := by sorry

/-- Values at even degrees are ignored. -/
example (u v : ℕ → ℝ) (h : ∀ m, u (2 * m + 1) = v (2 * m + 1)) :
    upperOddDensity u = upperOddDensity v := by
  simp only [upperOddDensity, h]

/-- The convergence comparison in lower and upper degree densities (§5.15): a convergent
odd-degree sequence has both densities equal to its limit. -/
theorem oddDensities_eq_of_tendsto (u : ℕ → ℝ) (c : ℝ)
    (hu : Tendsto (fun m => u (2 * m + 1)) atTop (𝓝 c)) :
    lowerOddDensity u = c ∧ upperOddDensity u = c := by sorry

end DegreeDensities

/-! ### 5.16 Top-degree traces and the uniform trace estimate -/

namespace GeometricStatistics

/-- The numerical core of uniform trace error estimate (§5.16), with the same
degree-dependent Betti bound. -/
theorem trace_error_bound (n : ℕ) (q C : ℝ) (hq : 1 < q) (hC : 1 ≤ C)
    (hlarge : C < Real.sqrt q) (t : Fin (2 * n) → ℝ)
    (ht : ∀ j, |t j| ≤ q ^ ((j.val : ℝ) / 2) * C ^ (2 * n - j.val + 1)) :
    |q⁻¹ ^ n * ∑ j, (-1 : ℝ) ^ j.val * t j| ≤ C ^ 2 / (Real.sqrt q - C) := by sorry

end GeometricStatistics

/-! ### 5.18 Similitude orbits and rational components -/

namespace Similitude

variable (l R : Type*) [Fintype l] [DecidableEq l] [CommRing R]

/-- Matrices satisfying `h * J * hᵀ = m • J` for an arbitrary scalar multiplier, in the
convention of `Matrix.symplecticGroup`. -/
def similitudeCoset (m : R) : Set (Matrix (l ⊕ l) (l ⊕ l) R) :=
  {h | h * Matrix.J l R * h.transpose = m • Matrix.J l R}

/-- The union of unit-multiplier matrix subsets, identified in positive rank with the
matrix projection of ArithmeticGaloisRepresentations' supplied `GSp`. -/
def similitudeSet : Set (Matrix (l ⊕ l) (l ⊕ l) R) :=
  ⋃ m : Rˣ, similitudeCoset l R (m : R)

/-- Multiplier one is Mathlib's symplectic group. -/
theorem similitudeCoset_one :
    similitudeCoset l R 1 = (Matrix.symplecticGroup l R : Set (Matrix (l ⊕ l) (l ⊕ l) R)) := by
  sorry

/-- Multipliers multiply. -/
theorem similitudeCoset_mul_mem {m m' : R} {h h' : Matrix (l ⊕ l) (l ⊕ l) R}
    (hh : h ∈ similitudeCoset l R m) (hh' : h' ∈ similitudeCoset l R m') :
    h * h' ∈ similitudeCoset l R (m * m') := by sorry

/-- For `g ≥ 1` the multiplier of a similitude is unique. -/
theorem multiplier_unique [Nonempty l] {m m' : R}
    {h : Matrix (l ⊕ l) (l ⊕ l) R}
    (hm : h ∈ similitudeCoset l R m) (hm' : h ∈ similitudeCoset l R m') : m = m' := by sorry

/-- The nonunit Check of the symplectic similitude matrix subsets in §5.18:
`diag(1, 3)` scales the form but has no unit multiplier. -/
theorem nonunit_diagonal_not_mem_similitudeSet :
    Matrix.fromBlocks (1 : Matrix Unit Unit ℤ) 0 0 3 ∈ similitudeCoset Unit ℤ 3 ∧
    Matrix.fromBlocks (1 : Matrix Unit Unit ℤ) 0 0 3 ∉ similitudeSet Unit ℤ := by sorry

/-- Membership in a scalar subset is exactly its defining form equation. -/
theorem mem_similitudeCoset_iff (m : R) (h : Matrix (l ⊕ l) (l ⊕ l) R) :
    h ∈ similitudeCoset l R m ↔ h * Matrix.J l R * h.transpose = m • Matrix.J l R := Iff.rfl

/-- Scalar extension preserves the multiplier equation, as required in §5.18. -/
theorem similitudeCoset_map {S : Type*} [CommRing S] (φ : R →+* S) (m : R)
    (h : Matrix (l ⊕ l) (l ⊕ l) R) (hh : h ∈ similitudeCoset l R m) :
    h.map φ ∈ similitudeCoset l S (φ m) := by sorry

/-- The rank-zero Check of the similitude subsets: the matrix equation cannot detect
any scalar multiplier on an empty space. -/
example (m : R) : (1 : Matrix (Fin 0 ⊕ Fin 0) (Fin 0 ⊕ Fin 0) R) ∈
    similitudeCoset (Fin 0) R m := by
  change _ = _
  exact Subsingleton.elim _ _

end Similitude

namespace Similitude

variable (ℓ g : ℕ) [Fact ℓ.Prime]
variable (A : Type*) [AddCommGroup A] [Module (PadicInt ℓ) A]

/-- The set `O` of unique similitude stable symplectic orbit (§5.18): surjections fixed
by some matrix of the prescribed multiplier. -/
def similitudeFixedSurjections (q : (PadicInt ℓ)ˣ) :
    Set (((Fin g ⊕ Fin g) → PadicInt ℓ) →ₗ[PadicInt ℓ] A) :=
  {f | Function.Surjective f ∧ ∃ h ∈ similitudeCoset (Fin g) (PadicInt ℓ) (q : PadicInt ℓ),
    f.comp h.mulVecLin = f}

/-- The nonemptiness assertion of unique similitude stable symplectic orbit (§5.18).
The generator bound is expressed by a surjection from a free module of rank `g`. -/
theorem similitudeFixedSurjections_nonempty [Finite A] (hℓ : 2 < ℓ) (q : (PadicInt ℓ)ˣ)
    (hq : IsUnit ((q : PadicInt ℓ) - 1))
    (hgen : ∃ f : (Fin g → PadicInt ℓ) →ₗ[PadicInt ℓ] A, Function.Surjective f) :
    (similitudeFixedSurjections ℓ g A q).Nonempty := by sorry

/-- The transitivity assertion of unique similitude stable symplectic orbit (§5.18)
for the standard perfect alternating form. -/
theorem similitudeFixedSurjections_transitive [Finite A] (hℓ : 2 < ℓ) (q : (PadicInt ℓ)ˣ)
    (hq : IsUnit ((q : PadicInt ℓ) - 1))
    (hgen : ∃ f : (Fin g → PadicInt ℓ) →ₗ[PadicInt ℓ] A, Function.Surjective f)
    (f f' : ((Fin g ⊕ Fin g) → PadicInt ℓ) →ₗ[PadicInt ℓ] A)
    (hf : f ∈ similitudeFixedSurjections ℓ g A q)
    (hf' : f' ∈ similitudeFixedSurjections ℓ g A q) :
    ∃ h ∈ Matrix.symplecticGroup (Fin g) (PadicInt ℓ), f.comp h.mulVecLin = f' := by sorry

/-- Linear group transitive on lattice surjections (§5.18), with the finite target
regarded as its canonical finite `ℤ_ℓ`-module. -/
theorem lattice_surjections_transitive [Finite A]
    (f f' : (Fin g → PadicInt ℓ) →ₗ[PadicInt ℓ] A)
    (hf : Function.Surjective f) (hf' : Function.Surjective f') :
    ∃ e : (Fin g → PadicInt ℓ) ≃ₗ[PadicInt ℓ] (Fin g → PadicInt ℓ),
      f.comp e.toLinearMap = f' := by sorry

end Similitude

/-! ### 5.20 Good nonabelian function-field moments -/

namespace LargeQ

/-- The prime powers coprime to `m`, tending to infinity. -/
def allowedPrimePowers (m : ℕ) : Filter ℕ :=
  atTop ⊓ 𝓟 {q | IsPrimePow q ∧ Nat.Coprime q m}

/-- Eventual-degree large-`q` limit: for every large fixed degree `n`, `E q n → c n` as `q`
runs through the allowed prime powers. -/
def EventualDegreeLargeQLimit (m : ℕ) (E : ℕ → ℕ → ℝ) (c : ℕ → ℝ) : Prop :=
  ∃ n₀, ∀ n ≥ n₀, Tendsto (fun q => E q n) (allowedPrimePowers m) (𝓝 (c n))

/-- The allowed-prime-power filter of §5.20 is proper at every nonzero modulus. -/
theorem allowedPrimePowers_neBot (m : ℕ) (hm : m ≠ 0) : (allowedPrimePowers m).NeBot := by
  sorry

/-- No prime power is coprime to `0`, so the modulus `0` gives the bottom filter. -/
theorem allowedPrimePowers_zero : allowedPrimePowers 0 = ⊥ := by sorry

/-- Eventual degree large q limits (§5.20) are unique in sufficiently large degrees. -/
theorem EventualDegreeLargeQLimit.unique {m : ℕ} (hm : m ≠ 0) {E : ℕ → ℕ → ℝ}
    {c c' : ℕ → ℝ} (h : EventualDegreeLargeQLimit m E c)
    (h' : EventualDegreeLargeQLimit m E c') : ∀ᶠ n in atTop, c n = c' n := by sorry

/-- The order-of-limits Check of eventual degree large q limit in §5.20:
`n / (n + q)` tends to zero in `q` and to one in `n`. -/
theorem iterated_limits_differ : EventualDegreeLargeQLimit 1 (fun q n => (n : ℝ) / (n + q)) (fun _ => 0) ∧
    ∀ q : ℕ, Tendsto (fun n : ℕ => (n : ℝ) / (n + q)) atTop (𝓝 1) := by sorry

/-- Divisibility of moduli restricts the prime powers and preserves the limit (§5.20). -/
theorem EventualDegreeLargeQLimit.mono {m m' : ℕ} (hdiv : m ∣ m')
    {E : ℕ → ℕ → ℝ} {c : ℕ → ℝ} (h : EventualDegreeLargeQLimit m E c) :
    EventualDegreeLargeQLimit m' E c := by sorry

end LargeQ

/-! ### 5.21 Bad types and whole component profiles -/

namespace ComponentProfiles

/-- The least integer `≥ N₀` with the parity of `e`. -/
def leastWithParity (N₀ e : ℕ) : ℕ := if N₀ % 2 = e % 2 then N₀ else N₀ + 1

/-- The number of multidegrees `m : Fin N → ℕ` of total degree `d` with every `m i ≥ N₀` and
`m i ≡ ε i (mod 2)`. -/
def parityMultidegreeCount (N N₀ d : ℕ) (ε : Fin N → ℕ) : ℕ :=
  ((Finset.Nat.antidiagonalTuple N d).filter
    (fun m => ∀ i, N₀ ≤ m i ∧ m i % 2 = ε i % 2)).card

/-- Stable parity multidegree count (§5.21): stars and bars on the parity class. -/
theorem parityMultidegreeCount_eq (N N₀ d : ℕ) (hN : 1 ≤ N) (ε : Fin N → ℕ) :
    parityMultidegreeCount N N₀ d ε =
      if ∑ i, leastWithParity N₀ (ε i) ≤ d ∧ (d - ∑ i, leastWithParity N₀ (ε i)) % 2 = 0 then
        Nat.choose ((d - ∑ i, leastWithParity N₀ (ε i)) / 2 + N - 1) (N - 1)
      else 0 := by sorry

/-- The stable parity sum of complete stable range component sum (§5.21). -/
def stableRangeComponentSum (N N₀ d : ℕ) (S : Finset (Fin N → Fin 2)) : ℕ :=
  ∑ ε ∈ S, parityMultidegreeCount N N₀ d (fun i => (ε i).val)

/-- An empty surviving parity set has no stable contribution. -/
theorem stableRangeComponentSum_empty (N N₀ d : ℕ) :
    stableRangeComponentSum N N₀ d ∅ = 0 := by
  simp [stableRangeComponentSum]

/-- Disjoint surviving parity sets contribute additively. -/
theorem stableRangeComponentSum_union (N N₀ d : ℕ) (S T : Finset (Fin N → Fin 2))
    (h : Disjoint S T) :
    stableRangeComponentSum N N₀ d (S ∪ T) =
      stableRangeComponentSum N N₀ d S + stableRangeComponentSum N N₀ d T := by
  exact Finset.sum_union h

/-- Weight polynomial formula for the stable orthant (§5.21), as an identity of formal
power series with integer coefficients and arbitrary surviving parity set. -/
theorem stableRangeComponentSum_powerSeries (N N₀ : ℕ) (hN : 1 ≤ N)
    (S : Finset (Fin N → Fin 2)) :
    (1 - (PowerSeries.X : PowerSeries ℤ) ^ 2) ^ N *
        PowerSeries.mk (fun d => (stableRangeComponentSum N N₀ d S : ℤ)) =
      PowerSeries.X ^ (N * N₀) *
        ∑ ε ∈ S, PowerSeries.X ^
          ((Finset.univ.filter fun i => (ε i).val ≠ N₀ % 2).card) := by sorry

/-- Many large parity vectors (§5.21): the polynomial lower bound is uniform over
all requested parity vectors. -/
theorem many_large_parity_vectors (N N₀ : ℕ) (hN : 2 ≤ N) :
    ∃ v : ℝ, 0 < v ∧ ∃ d₀ : ℕ, ∀ (ε : Fin N → ℕ) (d : ℕ), d₀ ≤ d →
      d % 2 = (∑ i, ε i) % 2 →
        v * (d : ℝ) ^ (N - 1) ≤ parityMultidegreeCount N N₀ d ε := by sorry

/-- Ordinary limit iff eventual profile constancy (§5.21), for a finite rational profile
and an error tending to zero along the allowed prime powers. -/
theorem ordinary_limit_iff_eventual_profile_constancy (m : ℕ) (hm : m ≠ 0)
    (E : ℕ → ℝ) (P : ℕ → ℚ) (hP : (Set.range P).Finite)
    (herr : Tendsto (fun q => E q - (P q : ℝ)) (LargeQ.allowedPrimePowers m) (𝓝 0))
    (L : ℝ) :
    Tendsto E (LargeQ.allowedPrimePowers m) (𝓝 L) ↔
      ∃ r : ℚ, (r : ℝ) = L ∧ ∀ᶠ q in LargeQ.allowedPrimePowers m, P q = r := by sorry

/-- Liminf limsup from recurrent profile values (§5.21): the recurrent finite set is
nonempty and its extreme values give the lower and upper limits of the moment. -/
theorem recurrent_profile_extrema (m : ℕ) (hm : m ≠ 0)
    (E : ℕ → ℝ) (P : ℕ → ℚ) (hP : (Set.range P).Finite)
    (herr : Tendsto (fun q => E q - (P q : ℝ)) (LargeQ.allowedPrimePowers m) (𝓝 0))
    (R : Finset ℚ) (hR : ∀ r, r ∈ R ↔ ∃ᶠ q in LargeQ.allowedPrimePowers m, P q = r) :
    ∃ hne : R.Nonempty,
      liminf E (LargeQ.allowedPrimePowers m) = (R.min' hne : ℝ) ∧
      limsup E (LargeQ.allowedPrimePowers m) = (R.max' hne : ℝ) := by sorry

end ComponentProfiles

end TauCetiRoadmap.ArithmeticStatisticsPartVIII
