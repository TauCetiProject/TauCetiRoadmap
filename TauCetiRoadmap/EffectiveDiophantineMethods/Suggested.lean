import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.FinitelyGenerated
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator

/-!
# Effective Diophantine methods: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; proving these statements alone does not finish a layer or the roadmap.
It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.

The statements below give the exact Matveev and Yu bounds of §§2.3 and 2.5,
Cremona's rational and Silverman's number-field height estimates of §3.12,
the full Mordell–Weil basis criterion of §3.22, the quantitative matching of
geometric roots with multiplicities of §6.16, and the four classical complete
solution lists of §§6.36–6.39: Tzanakis–de Weger's two quartic Thue equations,
the integral points of `y² = x³ − 4x + 1` with Mohanty's triangular-number
corollary, de Weger's count of the solutions of `x + y = z` in
`{2, 3, 5, 7, 11, 13}`-units, and Tzanakis–de Weger's Thue–Mahler equation
`x³ − 23x²y + 5xy² + 24y³ = ±2^a 3^b 5^c 7^d`. The root-matching theorem is stated
after the normalization G(T) = p⁻ᵏ F(pT), over any complete algebraically closed
normed extension of Q_p, with analytic orders as multiplicities. The scalar
constants, generated subgroup, series evaluation, S-unit solution set and
Thue–Mahler solution list have explicit definitions on native carriers.

The general exact-list implications of §§2.20, 2.28 and 2.33 are not stated:
their ThueData, ThueMahlerData and SUnitData require the complete arithmetic
covering, root/logarithm enclosure and reduction-validity constructions of
Layer 2, which the pins do not supply.

The Chabauty finiteness and good/bad-reduction bounds of §§4.12–4.14, the exact
Chabauty–Coleman lists of §4.18 and §§4.23–4.25, the number-field and symmetric
criteria of §§4.19–4.22, and the geometric sieve conclusions of §§5.22–5.29 need
the curve's actual Jacobian, Abel–Jacobi map, abelian logarithm, relative model
and reduction comparisons. The pins have abelian varieties but not these constructions.
The quadratic Chabauty completeness and Hodge/Frobenius/local-height theorems of
§§6.4, 6.8 and 6.11–6.14 additionally need the universal unipotent connection,
its filtered Frobenius quotient A_Z and the geometric height pairing.

The conditional arithmetic applications of §§3.24–3.29 and §§6.18–6.35 also
require their identified arithmetic/model inputs. In particular, the Cartan,
exceptional and prime-level modular curves, their Jacobians, modular j-maps and
CM comparisons used in §§6.29–6.35 are absent at the pins. No unlabelled
solution-set assertion replaces a conditional application.
-/

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.EffectiveDiophantineMethods

/-! ## Layer 2: Effective logarithms and Diophantine reduction -/

namespace ED2

/-- Rational upper constant dominating both real and complex Matveev constants (§2.2). -/
def matveevConstantUpper (n D : ℕ) (A : Fin n → ℚ) (s L : ℚ) : ℚ :=
  let e : ℚ := 27182818286 / 10 ^ 10
  max (min (e * n / 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s) (2 ^ (6 * n + 20)))
      (min ((e * n / 2) ^ 2 / 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s)
        (2 ^ (6 * n + 20))) * D ^ 2 * (1 + L) * ∏ i, A i

/-- The exact lower bound for a nonzero algebraic logarithmic form (§2.3). -/
theorem matveev_lower_bound {K : Type*} [Field K] [NumberField K]
    (σ : K →+* ℂ) (n D : ℕ) (hn : 0 < n) (hD : 0 < D)
    (hdegree : Module.finrank ℚ K ≤ D) (α : Fin n → Kˣ) (logs : Fin n → ℂ)
    (hlogs : ∀ i, logs i ≠ 0 ∧ Complex.exp (logs i) = σ (α i))
    (A : Fin n → ℚ) (s L c : ℚ) (hs : 0 ≤ s) (hsq : (n : ℚ) ≤ s ^ 2)
    (hL : Real.log D ≤ (L : ℝ)) (hA : ∀ i, (16 / 100 : ℚ) ≤ A i)
    (hheight : ∀ i, (D : ℝ) * NumberField.absLogHeight₁ (α i : K) ≤ (A i : ℝ))
    (hnorm : ∀ i, ‖logs i‖ ≤ (A i : ℝ))
    (hc : matveevConstantUpper n D A s L ≤ c)
    (b : Fin n → ℤ) (hne : ∑ i, b i • logs i ≠ 0) :
    -(c : ℝ) * (1 + Real.log ((Finset.univ.sup (fun i => (b i).natAbs) : ℕ) : ℝ)) <
      Real.log ‖∑ i, b i • logs i‖ := by
  sorry

/-- Rational upper constant for Yu's normalized valuation bound (§2.4). -/
def yuConstantUpper (n d p : ℕ) (h : Fin n → ℚ) (logLower logUpper : ℚ) : ℚ :=
  22000 * ((19 / 2 : ℚ) * (n + 1) * d) ^ (2 * (n + 1)) /
    logLower ^ (n + 1) * ((p : ℚ) ^ d - 1) * (∏ i, h i) * logUpper

/-- Yu's bound in an arbitrary finite p-adic extension, with ord_p(p) = 1 (§2.5). -/
theorem yu_valuation_upper_bound {K : Type*} [Field K] [NumberField K]
    {p : ℕ} [Fact p.Prime] {L : Type*} [NormedField L] [CompleteSpace L]
    [NormedAlgebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L]
    (σ : K →+* ℂ) (ι : K →+* L) (n d : ℕ) (hn : 2 ≤ n) (hd : 0 < d)
    (hdegree : Module.finrank ℚ K ≤ d) (α : Fin n → Kˣ)
    (h : Fin n → ℚ) (logLower logUpper Φ : ℚ)
    (hpos : 0 < logLower) (hlog : (logLower : ℝ) ≤ Real.log p)
    (hheight : ∀ i, NumberField.absLogHeight₁ (α i : K) ≤ (h i : ℝ))
    (hnorm : ∀ i, ‖Complex.log (σ (α i))‖ ≤ 10 * (h i : ℝ))
    (hp : ∀ i, Real.log p ≤ (h i : ℝ))
    (hupper : Real.log (10 * (n : ℝ) * d * ((insert 1 (Finset.univ.image h)).max' (Finset.insert_nonempty ..) : ℚ)) ≤
      (logUpper : ℝ))
    (hΦ : yuConstantUpper n d p h logLower logUpper ≤ Φ)
    (b : Fin n → ℤ) (hb : b ≠ 0) (hne : ∏ i, (α i) ^ b i ≠ 1) :
    -(Real.log ‖ι (↑(∏ i, (α i) ^ b i) : K) - 1‖) / Real.log p <
      (Φ : ℝ) * Real.log ((d : ℝ) * max 3
        ((Finset.univ.sup (fun i => (b i).natAbs) : ℕ) : ℝ)) := by
  sorry

end ED2

/-! ## Layer 3: Descent, heights and Mordell–Weil data -/

namespace ED3

/-- Cremona's explicit constant for the full logarithmic x-height (§3.12). -/
def cremonaMu (W : WeierstrassCurve ℚ) [W.IsElliptic] : ℝ :=
  (Real.log |(W.Δ : ℝ)| + Real.log (max 1 |(W.j : ℝ)|)) / 6 +
    Real.log (max 1 |((W.b₂ / 12 : ℚ) : ℝ)|) +
    Real.log (if W.b₂ = 0 then 1 else 2)

/-- Cremona's two-sided estimate on every integral standard rational model (§3.12). -/
theorem canonicalHeight_sub_naiveHeight_cremona (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a)
    (P : W.toAffine.Point) :
    -(Height.logHeight₁ W.j) / 12 - cremonaMu W - 961 / 500 ≤
      P.canonicalHeight - P.naiveHeight ∧
    P.canonicalHeight - P.naiveHeight ≤ cremonaMu W + 107 / 50 := by
  sorry

/-- The archimedean contribution to absolute logarithmic height, with local weights. -/
def archimedeanLogHeight {K : Type*} [Field K] [NumberField K] (x : K) : ℝ :=
  (∑ v : NumberField.InfinitePlace K, (v.mult : ℝ) * Real.log (max 1 (v x))) /
    Module.finrank ℚ K

/-- Silverman's number-field constant, in the native full x-height normalization. -/
def silvermanMu {K : Type*} [Field K] [NumberField K] [DecidableEq K]
    (W : WeierstrassCurve K) [W.IsElliptic] : ℝ :=
  NumberField.absLogHeight₁ W.Δ / 6 + archimedeanLogHeight W.j / 6 +
    archimedeanLogHeight (W.b₂ / 12) + Real.log (if W.b₂ = 0 then 1 else 2)

/-- Silverman's weighted number-field estimate, dividing both native heights by the degree. -/
theorem canonicalHeight_sub_naiveHeight_silverman {K : Type*} [Field K] [NumberField K]
    [DecidableEq K] (W : WeierstrassCurve K) [W.IsElliptic]
    (hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a)
    (P : W.toAffine.Point) :
    -(NumberField.absLogHeight₁ W.j) / 12 - silvermanMu W - 973 / 500 ≤
      P.canonicalHeight / Module.finrank ℚ K - P.naiveHeight / Module.finrank ℚ K ∧
    P.canonicalHeight / Module.finrank ℚ K - P.naiveHeight / Module.finrank ℚ K ≤
      silvermanMu W + 107 / 50 := by
  sorry

/-- The subgroup generated by the specified torsion list and rational points. -/
def mordellWeilSubgroup (W : WeierstrassCurve.Affine ℚ) {r : ℕ}
    (T : Finset W.Point) (P : Fin r → W.Point) : AddSubgroup W.Point :=
  AddSubgroup.closure ((T : Set W.Point) ∪ Set.range P)

/-- Rank, height, Hermite and prime-saturation data yield a full basis and regulator (§3.22).
The model is any elliptic Weierstrass model over `ℚ`: the argument uses only the Néron–Tate
pairing, the height lower bound `lam`, Hermite's inequality and saturation, none of which depends
on integrality of the coefficients. -/
theorem mordellWeil_basis_of_height_and_saturation
    (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic]
    {r : ℕ} (hr : 0 < r) (T : Finset W.Point) (P : Fin r → W.Point)
    (hT : ∀ Q : W.Point, Q ∈ T ↔ IsOfFinAddOrder Q)
    (hrank : Module.finrank ℤ W.Point ≤ r)
    (δ lam γ R : ℝ) (hδ : 0 < δ) (hlam : 0 < lam) (hγ : 0 < γ)
    (hdet : δ ≤ (Matrix.of fun i j =>
      WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det)
    (hR : (Matrix.of fun i j =>
      WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det ≤ R)
    (hlower : ∀ Q : W.Point, ¬ IsOfFinAddOrder Q → lam ≤ Q.canonicalHeight)
    (hhermite : ∀ M : Matrix (Fin r) (Fin r) ℝ, M.PosDef →
      ∃ x : Fin r → ℤ, x ≠ 0 ∧
        dotProduct (fun i => (x i : ℝ)) (M.mulVec (fun i => (x i : ℝ))) ≤
          γ * Real.rpow M.det (1 / (r : ℝ)))
    (N : ℕ) (hN : N = ⌊Real.sqrt R * Real.rpow (γ / lam) ((r : ℝ) / 2)⌋₊)
    (hsat : ∀ p : ℕ, p.Prime → p ≤ N → ∀ Q : W.Point,
      p • Q ∈ mordellWeilSubgroup W T P → Q ∈ mordellWeilSubgroup W T P) :
    letI : AddGroup.FG W.Point := WeierstrassCurve.Affine.fg_point_of_numberField
    mordellWeilSubgroup W T P = ⊤ ∧ Module.finrank ℤ W.Point = r ∧
      (∃ b : Module.Basis (Fin r) ℤ (WeierstrassCurve.Affine.PointModTorsion W),
        ∀ i, b i = Submodule.Quotient.mk (P i)) ∧
      WeierstrassCurve.Affine.regulator W = (Matrix.of fun i j =>
        WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det := by
  sorry

end ED3

/-! ## Layer 6: Quadratic Chabauty and complete solution lists -/

namespace ED6

/-- Series evaluation; the matching theorem uses it only on a disc of convergence. -/
def seriesValue {K : Type*} [NormedField K] (f : PowerSeries K) (x : K) : K :=
  ∑' i : ℕ, f.coeff i * x ^ i

/-- Quantitative matching after normalization, including every geometric multiplicity (§6.16). -/
theorem roots_determined_of_truncation {p : ℕ} [Fact p.Prime]
    {C : Type*} [NontriviallyNormedField C] [CompleteSpace C] [IsAlgClosed C]
    [IsUltrametricDist C] [NormedAlgebra ℚ_[p] C] [DecidableEq C]
    (G : PowerSeries ℚ_[p]) (hG : G.IsRestricted 1)
    (hcoeff : ∀ i, ‖G.coeff i‖ ≤ 1) (hunit : ∃ i, ‖G.coeff i‖ = 1)
    (H : Polynomial ℚ_[p]) (N d : ℕ) (hN : 0 < N) (hd : 0 < d)
    (herror : ∀ i, ‖G.coeff i - H.coeff i‖ ≤ (p : ℝ) ^ (-(N : ℤ)))
    (hmult : ∀ s : Finset C, (∀ z ∈ s, ‖z‖ ≤ 1) →
      ∑ z ∈ s, analyticOrderAt (seriesValue (G.map (algebraMap ℚ_[p] C))) z ≤
        (d : ℕ∞)) :
    ∃ roots : Multiset C,
      (∀ z : C, (roots.count z : ℕ∞) =
        if ‖z‖ ≤ 1 then
          analyticOrderAt (seriesValue (G.map (algebraMap ℚ_[p] C))) z else 0) ∧
      roots.card ≤ d ∧
      Multiset.Rel (fun x y : C => ‖x - y‖ ≤
        Real.rpow (p : ℝ) (-((N : ℝ) / d)))
        roots ((H.map (algebraMap ℚ_[p] C)).roots.filter (fun z => ‖z‖ ≤ 1)) := by
  sorry

/-- Tzanakis–de Weger Theorem B (i) (§6.36): the Thue equation
`X⁴ − 4X³Y − 12X²Y² + 4Y⁴ = 1` has exactly the integer solutions `±(1, 0)`. -/
theorem thue_quartic_i (X Y : ℤ) :
    X ^ 4 - 4 * X ^ 3 * Y - 12 * X ^ 2 * Y ^ 2 + 4 * Y ^ 4 = 1 ↔
      (X = 1 ∧ Y = 0) ∨ (X = -1 ∧ Y = 0) := by
  sorry

/-- Tzanakis–de Weger Theorem B (ii) (§6.36): the Thue equation
`X⁴ − 12X²Y² − 8XY³ + 4Y⁴ = 1` has exactly the eight integer solutions
`±(1, 0), ±(1, −1), ±(1, 3), ±(3, −1)`. -/
theorem thue_quartic_ii (X Y : ℤ) :
    X ^ 4 - 12 * X ^ 2 * Y ^ 2 - 8 * X * Y ^ 3 + 4 * Y ^ 4 = 1 ↔
      (X, Y) ∈ ({(1, 0), (-1, 0), (1, -1), (-1, 1), (1, 3), (-1, -3), (3, -1), (-3, 1)} :
        Finset (ℤ × ℤ)) := by
  sorry

/-- Tzanakis–de Weger Theorem A (§6.37): the integral points of `y² = x³ − 4x + 1` are the
22 points with `x ∈ {−2, −1, 0, 2, 3, 4, 10, 12, 20, 114, 1274}`. -/
theorem integralPoints_cubic_minus_four_x_plus_one (x y : ℤ) :
    y ^ 2 = x ^ 3 - 4 * x + 1 ↔
      (x, y) ∈ ({(-2, 1), (-2, -1), (-1, 2), (-1, -2), (0, 1), (0, -1), (2, 1), (2, -1),
        (3, 4), (3, -4), (4, 7), (4, -7), (10, 31), (10, -31), (12, 41), (12, -41),
        (20, 89), (20, -89), (114, 1217), (114, -1217), (1274, 45473), (1274, -45473)} :
        Finset (ℤ × ℤ)) := by
  sorry

/-- Mohanty's problem, the corollary of Theorem A (§6.37): the triangular numbers
`T_n = n(n + 1)/2` with `n ≥ 1` that are a product of three consecutive integers are exactly
`T_3, T_15, T_20, T_44, T_608, T_22736`. -/
theorem triangular_eq_three_consecutive (n : ℕ) (hn : 0 < n) :
    (∃ m : ℕ, n * (n + 1) / 2 = m * (m + 1) * (m + 2)) ↔
      n ∈ ({3, 15, 20, 44, 608, 22736} : Finset ℕ) := by
  sorry

/-- The solutions of de Weger's equation `x + y = z` (§6.38): pairs of positive integers
`x ≤ y` with `gcd(x, y) = 1` such that `x`, `y` and `z = x + y` have all their prime factors in
`{2, 3, 5, 7, 11, 13}`. -/
def sUnitSolutions2to13 : Set (ℕ × ℕ) :=
  {q | 0 < q.1 ∧ q.1 ≤ q.2 ∧ Nat.Coprime q.1 q.2 ∧
    q.1.primeFactors ⊆ {2, 3, 5, 7, 11, 13} ∧ q.2.primeFactors ⊆ {2, 3, 5, 7, 11, 13} ∧
    (q.1 + q.2).primeFactors ⊆ {2, 3, 5, 7, 11, 13}}

/-- de Weger Theorem 6.3 (§6.38): the equation `x + y = z` in `{2, 3, 5, 7, 11, 13}`-units with
`gcd(x, y) = 1` and `x ≤ y` has exactly 545 solutions, of which exactly 514 satisfy
`ord_2(xyz) ≤ 12, ord_3(xyz) ≤ 7, ord_5(xyz) ≤ 5, ord_7(xyz) ≤ 4, ord_11(xyz) ≤ 3` and
`ord_13(xyz) ≤ 3`. -/
theorem sUnit_two_to_thirteen :
    sUnitSolutions2to13.ncard = 545 ∧
      {q ∈ sUnitSolutions2to13 |
        padicValNat 2 (q.1 * q.2 * (q.1 + q.2)) ≤ 12 ∧
        padicValNat 3 (q.1 * q.2 * (q.1 + q.2)) ≤ 7 ∧
        padicValNat 5 (q.1 * q.2 * (q.1 + q.2)) ≤ 5 ∧
        padicValNat 7 (q.1 * q.2 * (q.1 + q.2)) ≤ 4 ∧
        padicValNat 11 (q.1 * q.2 * (q.1 + q.2)) ≤ 3 ∧
        padicValNat 13 (q.1 * q.2 * (q.1 + q.2)) ≤ 3}.ncard = 514 := by
  sorry

/-- The 72 solutions `(x, y, a, b, c, d)` of `x³ − 23x²y + 5xy² + 24y³ = ±2^a 3^b 5^c 7^d` with
`gcd(x, y) = 1`, one representative of each pair `±(x, y)`, normalised by `x > 0` or
`(x, y) = (0, −1)` (Tzanakis–de Weger 1992, the table of §18, in its order). -/
def thueMahlerSolutionList : Finset (ℤ × ℤ × ℕ × ℕ × ℕ × ℕ) :=
  {(48632, -3729, 18, 0, 13, 0), (264, -1003, 5, 5, 8, 1), (267, -209, 0, 8, 4, 2),
    (137, -199, 0, 0, 4, 6), (96, -107, 3, 5, 2, 1), (93, -103, 0, 2, 2, 1),
    (88, -101, 8, 0, 3, 2), (73, -81, 0, 0, 3, 3), (24, -53, 6, 2, 4, 1), (31, -32, 0, 0, 6, 1),
    (28, -31, 2, 0, 3, 0), (24, -29, 7, 3, 2, 0), (132, -29, 2, 4, 3, 3), (24, -23, 4, 2, 4, 0),
    (3, -16, 0, 6, 3, 0), (19, -13, 0, 0, 7, 0), (24, -13, 11, 1, 2, 0), (48, -13, 3, 9, 1, 0),
    (4, -9, 2, 0, 5, 0), (6, -7, 1, 1, 3, 0), (3, -4, 0, 2, 0, 2), (4, -3, 2, 0, 2, 1),
    (1, -2, 0, 0, 3, 0), (51, -2, 0, 4, 5, 0), (0, -1, 3, 1, 0, 0), (1, -1, 0, 0, 1, 0),
    (3, -1, 0, 2, 2, 0), (6, -1, 1, 1, 2, 1), (8, -1, 4, 0, 3, 0), (13, -1, 0, 0, 3, 2),
    (1, 0, 0, 0, 0, 0), (1, 1, 0, 0, 0, 1), (2, 1, 1, 0, 2, 0), (8, 1, 7, 0, 0, 1),
    (12, 1, 2, 1, 3, 0), (15, 1, 0, 5, 0, 1), (22, 1, 1, 0, 2, 1), (24, 1, 4, 2, 1, 0),
    (42, 1, 1, 3, 4, 0), (3, 2, 0, 3, 1, 0), (9, 2, 0, 1, 3, 1), (1, 3, 0, 0, 4, 0),
    (10, 3, 1, 0, 0, 4), (7, 6, 0, 0, 2, 0), (8, 7, 4, 0, 2, 0), (9, 7, 0, 1, 4, 0),
    (24, 7, 5, 4, 2, 0), (159, 7, 0, 3, 3, 0), (8, 9, 6, 0, 3, 0), (128, 9, 3, 0, 5, 2),
    (12, 11, 2, 2, 3, 0), (32, 11, 3, 0, 5, 1), (87, 11, 0, 1, 8, 0), (6, 13, 1, 3, 3, 1),
    (272, 13, 3, 0, 4, 3), (296, 13, 6, 0, 4, 0), (24, 17, 4, 1, 2, 2), (744, 37, 6, 3, 4, 2),
    (48, 41, 3, 4, 0, 1), (56, 43, 5, 0, 6, 0), (59, 52, 0, 0, 4, 3), (56, 55, 20, 0, 0, 0),
    (2184, 97, 14, 5, 2, 0), (24, 115, 10, 6, 0, 2), (152, 131, 10, 0, 3, 1),
    (216, 139, 12, 1, 4, 1), (3388, 149, 2, 0, 9, 0), (399, 302, 0, 13, 3, 0),
    (534, 457, 1, 1, 7, 1), (984, 827, 7, 8, 4, 0), (1112, 951, 5, 0, 3, 3),
    (1656, 1663, 11, 1, 6, 3)}

/-- Tzanakis–de Weger 1992 (§6.39): the coprime solutions of
`x³ − 23x²y + 5xy² + 24y³ = ±2^a 3^b 5^c 7^d` are exactly the 72 listed ones and their
negatives `−(x, y)` (which change the sign of the right-hand side and keep the exponents). -/
theorem thueMahler_cubic (x y : ℤ) (a b c d : ℕ) (hxy : Int.gcd x y = 1) :
    (x ^ 3 - 23 * x ^ 2 * y + 5 * x * y ^ 2 + 24 * y ^ 3 = 2 ^ a * 3 ^ b * 5 ^ c * 7 ^ d ∨
      x ^ 3 - 23 * x ^ 2 * y + 5 * x * y ^ 2 + 24 * y ^ 3 = -(2 ^ a * 3 ^ b * 5 ^ c * 7 ^ d)) ↔
      ((x, y, a, b, c, d) ∈ thueMahlerSolutionList ∨
        (-x, -y, a, b, c, d) ∈ thueMahlerSolutionList) := by
  sorry

end ED6

end TauCetiRoadmap.EffectiveDiophantineMethods
