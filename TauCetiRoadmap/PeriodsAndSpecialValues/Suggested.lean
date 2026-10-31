import Mathlib

/-!
# Periods and special values: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline theorems
that can be expressed against the pinned Mathlib and Tau Ceti, with simple definitions
on native carriers and admitted proofs.

The statable headlines are the Legendre integral transformation and error bound (PS.7.1),
the quartic hypergeometric identity and mirror integrality (PS.8.7, PS.8.11), convergence
of the two weighted Dwork sums for every prime (PS.8.15), convergence, all-two evaluation,
shuffle and stuffle identities and Zagier's evaluation for numerical
multiple zeta values, numerical spanning and the dimension bound (PS.9).

The following headlines are not statable at the pins: the comparison determinant and
Deligne periods, Dirichlet and modular motivic algebraicity (PS.0–PS.1: no motive with
marked realizations); comparison of the imported formal-period point with the inverse
comparison (PS.2: no Nori period algebra or realization torsor); the fundamental-line,
number-field regulator, ETNC, Bloch–Kato measure and elliptic/Rankin–Selberg transport
theorems (PS.3–PS.6: no higher algebraic K-groups with arithmetic regulators, motivic
cohomology, virtual determinant category, Selmer complexes or motivic triples); the period-conjecture applications (PS.7: no formal-period algebra);
the geometric quartic Picard–Fuchs and monodromy comparison, the equivariant reciprocal
Dwork semistable model and the quintic geometric boundary Frobenius
(PS.8: no reciprocal Dwork family or equivariant semistable-model carrier,
resolved families, marked Gauss–Manin modules or
log-crystalline cohomology); and the motivic Hoffman basis and mixed Tate period
spanning (PS.9: no mixed Tate category, motivic path torsor or Brown period algebra).
Scalar matrix identities and README Checks do not replace those geometric headlines.

Multiple zeta indices are descending and positive, with the empty value equal to one.
The total sum is used analytically only under the stated summability hypotheses.
The parameter integral `legendreK` is a signature adapter for EllipticIntegrals' canonical
modulus integral at `Real.sqrt lam`, on `0 ≤ lam < 1` (PS.7.1). The two-letter `shuffles`
recursion presents ColemanIntegration L1.12's word product (PS.9.2). Those supplier
functions and word-algebra carriers are not present at the pins, so their comparison
maps are README targets; neither local presentation establishes a second generic API.
-/

noncomputable section

namespace TauCetiRoadmap.PeriodsAndSpecialValues

open scoped BigOperators
open MeasureTheory

/-! ## Layer PS.7: period integrals and normalization -/

/-- The radicand `(1 + u²)² - 4λu²` after the substitution `t = 2u/(1 + u²)`. -/
def legendreRadicand (lam u : ℝ) : ℝ := (1 + u ^ 2) ^ 2 - 4 * lam * u ^ 2

/-- The nonsingular integrand `2/√D_λ(u)`, on the positive branch. -/
def legendreIntegrand (lam u : ℝ) : ℝ := 2 / Real.sqrt (legendreRadicand lam u)

/-- Signature adapter for the canonical modulus integral at `√λ` on `0 ≤ λ < 1`:
`K_λ = ∫₀¹ dt/√((1 - t²)(1 - λt²))` (PS.7.1). -/
def legendreK (lam : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..1, 1 / Real.sqrt ((1 - t ^ 2) * (1 - lam * t ^ 2))

/-- The equal-panel midpoint sum with `N` panels. -/
def legendreMidpoint (lam : ℝ) (N : ℕ) : ℝ :=
  (N : ℝ)⁻¹ * ∑ j ∈ Finset.range N, legendreIntegrand lam (((j : ℝ) + 1 / 2) / (N : ℝ))

/-- The substitution t = 2u/(1+u²) expresses the Legendre period as an integral with positive radicand on the closed interval. -/
theorem legendre_substitution (lam : ℝ) (hlam : 0 < lam ∧ lam < 1) :
    legendreK lam = ∫ u in (0 : ℝ)..1, legendreIntegrand lam u := by
  sorry

/-- For real 0 < λ < 1 and a positive panel count, the midpoint sum differs from the Legendre period by at most 2/(N(1−λ)^(3/2)) (PS.7.1). -/
theorem legendre_midpoint_error (lam : ℝ) (hlam : 0 < lam ∧ lam < 1) (N : ℕ) (hN : 0 < N) :
    |legendreK lam - legendreMidpoint lam N| ≤
      2 / ((N : ℝ) * (1 - lam) * Real.sqrt (1 - lam)) := by
  sorry

/-! ## Layer PS.8: arithmetic mirror symmetry and period differential equations -/

/-- `A_n = (4n)!/(n!)⁴`. -/
def quarticA (n : ℕ) : ℚ := ((4 * n).factorial : ℚ) / ((n.factorial : ℚ) ^ 4)

/-- `g_n = 4 A_n (H_{4n} - H_n)`, with Mathlib's harmonic numbers `H_n = Σ_{j=1}^{n} 1/j`. -/
def quarticG (n : ℕ) : ℚ := 4 * quarticA n * (harmonic (4 * n) - harmonic n)

/-- The holomorphic period `w₀(z) = Σ A_n zⁿ`. -/
def quarticW0 (z : ℂ) : ℂ := ∑' n : ℕ, (quarticA n : ℂ) * z ^ n

/-- The hypergeometric symmetric square (PS.8.7). -/
theorem quartic_symmetric_square (z : ℂ) (hz : ‖256 * z‖ < 1) :
    quarticW0 z = (ordinaryHypergeometric (𝕂 := ℂ) (𝔸 := ℂ) (1 / 8 : ℂ) (3 / 8) 1 (256 * z)) ^ 2 := by
  sorry

/-- The mirror coordinate `q = z exp(g/w₀)` in `ℚ⟦z⟧` (PS.8.9). -/
def quarticMirrorCoordinate : PowerSeries ℚ :=
  PowerSeries.X * (PowerSeries.exp ℚ).subst
    (PowerSeries.mk quarticG * (PowerSeries.mk quarticA)⁻¹)

/-- Integrality of the mirror coordinate and of its compositional inverse (PS.8.11). -/
theorem quarticMirror_integral :
    (∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n quarticMirrorCoordinate = a) ∧
      ∃ g : PowerSeries ℚ, quarticMirrorCoordinate.subst g = PowerSeries.X ∧
        g.subst quarticMirrorCoordinate = PowerSeries.X ∧
        ∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n g = a := by
  sorry

/-- `exp(z + z^p/p)` in `ℚ⟦z⟧` (PS.8.15). -/
def dworkSeries (p : ℕ) : PowerSeries ℚ :=
  (PowerSeries.exp ℚ).subst (PowerSeries.X + ((p : ℚ)⁻¹ • PowerSeries.X ^ p : PowerSeries ℚ))

/-- `B_n`, the coefficients of `exp(z + z^p/p)`. -/
def dworkCoeff (p n : ℕ) : ℚ := PowerSeries.coeff n (dworkSeries p)

/-- The harmonic weight `Σ_{1 ≤ j < i ≤ n - 1} 1/(ij)` of `σ₂`. -/
def dworkPairWeight (n : ℕ) : ℚ :=
  ∑ i ∈ Finset.Ico 1 n, ∑ j ∈ Finset.Ico 1 i, 1 / ((i : ℚ) * j)

/-- Convergence of `σ₀ = Σ_{n ≥ 1} B_n (n-1)!` in `ℚ_p` for every prime `p` (PS.8.15). -/
theorem dworkSigma0_summable (p : ℕ) [Fact p.Prime] :
    Summable (fun n : ℕ => ((dworkCoeff p (n + 1) * (n.factorial : ℚ) : ℚ) : ℚ_[p])) := by
  sorry

/-- Convergence of `σ₂` in `ℚ_p` for every prime `p`. -/
theorem dworkSigma2_summable (p : ℕ) [Fact p.Prime] :
    Summable (fun n : ℕ =>
      ((dworkCoeff p (n + 1) * (n.factorial : ℚ) * dworkPairWeight (n + 1) : ℚ) : ℚ_[p])) := by
  sorry

/-! ## Layer PS.9: multiple zeta values and mixed Tate periods -/

/-- An index of positive integers. -/
def PositiveIndex (k : List ℕ) : Prop := ∀ n ∈ k, 0 < n

/-- Admissible: positive, and empty or with first (largest-variable) entry at least `2`. -/
def Admissible (k : List ℕ) : Prop := PositiveIndex k ∧ ∀ n ∈ k.head?, 2 ≤ n

/-- Strictly decreasing positive summation tuples for the index `k`. -/
def DescendingTuple (k : List ℕ) :=
  {n : Fin k.length → ℕ // (∀ i, 0 < n i) ∧ ∀ i j, i < j → n j < n i}

/-- The term `∏ n_i^{-k_i}`. -/
def mzvTerm (k : List ℕ) (n : DescendingTuple k) : ℝ :=
  ∏ i : Fin k.length, 1 / (n.val i : ℝ) ^ k.get i

/-- The multiple zeta value as a total sum; its analytic meaning needs admissibility. -/
def multipleZeta (k : List ℕ) : ℝ := ∑' n : DescendingTuple k, mzvTerm k n

/-- A positive descending index has a summable multiple-zeta series exactly when it is admissible (PS.9.1). -/
theorem mzv_summable_iff (k : List ℕ) (hk : PositiveIndex k) :
    Summable (mzvTerm k) ↔ Admissible k := by
  sorry

/-- Euler's evaluation of every all-two multiple zeta value, including the empty index (PS.9.15; Brown (3.7)). -/
theorem mzv_allTwo (m : ℕ) :
    multipleZeta (List.replicate m 2) =
      Real.pi ^ (2 * m) / ((2 * m + 1).factorial : ℝ) := by
  sorry

/-- The encoding `k ↦ 0^{k₁-1} 1 ⋯ 0^{k_r-1} 1`, with `false = 0` and `true = 1`. -/
def mzvEncode : List ℕ → List Bool
  | [] => []
  | k :: ks => List.replicate (k - 1) false ++ true :: mzvEncode ks

/-- Count `c` pending zeros while decoding a word; trailing zeros are discarded. -/
def mzvDecodeAux : ℕ → List Bool → List ℕ
  | _, [] => []
  | c, false :: w => mzvDecodeAux (c + 1) w
  | c, true :: w => (c + 1) :: mzvDecodeAux 0 w

/-- Decode from zero pending zeros. On valid words this inverts the positive-index encoding. -/
def mzvDecode (w : List Bool) : List ℕ := mzvDecodeAux 0 w

/-- Two-letter list presentation of the supplied Coleman shuffle product, retaining
multiplicity; the word-basis comparison is PS.9.2. -/
def shuffles : List Bool → List Bool → List (List Bool)
  | [], l => [l]
  | a :: u, [] => [a :: u]
  | a :: u, b :: v =>
      (shuffles u (b :: v)).map (a :: ·) ++ (shuffles (a :: u) v).map (b :: ·)

/-- The stuffle (quasi-shuffle) of two indices, with the merge term `(a + b) :: (u * v)`. -/
def stuffles : List ℕ → List ℕ → List (List ℕ)
  | [], l => [l]
  | a :: u, [] => [a :: u]
  | a :: u, b :: v =>
      (stuffles u (b :: v)).map (a :: ·) ++ (stuffles (a :: u) v).map (b :: ·) ++
        (stuffles u v).map ((a + b) :: ·)

/-- Stuffle multiplicativity of convergent multiple zeta values (PS.9.4). -/
theorem mzv_stuffle (k l : List ℕ) (hk : Admissible k) (hl : Admissible l) :
    multipleZeta k * multipleZeta l = ((stuffles k l).map multipleZeta).sum := by
  sorry

/-- Shuffle multiplicativity, through the 0/1 encoding (PS.9.4). -/
theorem mzv_shuffle (k l : List ℕ) (hk : Admissible k) (hl : Admissible l) :
    multipleZeta k * multipleZeta l =
      ((shuffles (mzvEncode k) (mzvEncode l)).map (fun w => multipleZeta (mzvDecode w))).sum := by
  sorry

/-- Zagier's coefficients in descending notation (PS.9.16). -/
def zagierCoeff (a b r : ℕ) : ℚ :=
  2 * (-1 : ℚ) ^ r * ((Nat.choose (2 * r) (2 * b + 2) : ℚ) -
    (1 - 1 / (2 : ℚ) ^ (2 * r)) * (Nat.choose (2 * r) (2 * a + 1) : ℚ))

/-- The index `{2}^a, 3, {2}^b`. -/
def oneThree (a b : ℕ) : List ℕ := List.replicate a 2 ++ [3] ++ List.replicate b 2

/-- Zagier's evaluation (PS.9.17). -/
theorem zagier_evaluation (a b : ℕ) :
    multipleZeta (oneThree a b) =
      ∑ r ∈ Finset.range (a + b + 1), (zagierCoeff a b (r + 1) : ℝ) *
        multipleZeta [2 * (r + 1) + 1] * multipleZeta (List.replicate (a + b - r) 2) := by
  sorry

/-- A Hoffman word: every entry is `2` or `3`. -/
def IsHoffman (k : List ℕ) : Prop := ∀ n ∈ k, n = 2 ∨ n = 3

/-- `d_N`, with generating function `1/(1 - t² - t³)` (PS.9.13). -/
def hoffmanDim : ℕ → ℕ
  | 0 => 1
  | 1 => 0
  | 2 => 1
  | n + 3 => hoffmanDim (n + 1) + hoffmanDim n

/-- Numerical spanning by Hoffman values (PS.9.23); no independence is asserted. -/
theorem numerical_spanning (k : List ℕ) (hk : Admissible k) :
    multipleZeta k ∈ Submodule.span ℚ
      {x : ℝ | ∃ w : List ℕ, IsHoffman w ∧ w.sum = k.sum ∧ x = multipleZeta w} := by
  sorry

/-- Finite dimensionality and the numerical dimension bound in each weight. The finiteness
assertion is essential: `finrank` alone also takes value zero in infinite dimension. -/
theorem mzv_span_finrank_le (N : ℕ) :
    Module.Finite ℚ (Submodule.span ℚ
      {x : ℝ | ∃ k : List ℕ, Admissible k ∧ k.sum = N ∧ x = multipleZeta k}) ∧
    Module.finrank ℚ (Submodule.span ℚ
      {x : ℝ | ∃ k : List ℕ, Admissible k ∧ k.sum = N ∧ x = multipleZeta k}) ≤ hoffmanDim N := by
  sorry

end TauCetiRoadmap.PeriodsAndSpecialValues
