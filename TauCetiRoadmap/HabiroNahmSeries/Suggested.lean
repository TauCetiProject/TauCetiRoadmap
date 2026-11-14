import Mathlib

/-!
# Nahm series, asymptotics and Habiro integrality: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
headline theorems and deep intermediate results statable against the pinned APIs:
existence and uniqueness of the positive Nahm solution, algebraicity of a
nondegenerate polynomial solution,
convergence and holomorphy of the analytic Nahm sum, the formal Nahm
difference equation, its general symmetrised q-binomial product formula, and
the rational quadratic Gauss norm evaluation.

The radial asymptotic theorem (including order one for real data) and the
arithmetic descent theorems are not statable at the pins: their normalized radial
coefficient family and cyclic Chern comparison carriers are missing. The
Andrews–Gordon cyclotomic torsion identity lacks the integral projective Bloch
carrier and its cyclic descent map; generic good-order Chern injectivity is a
different interface. Modularity implying Bloch torsion lacks the integral CGZ
Bloch quotient and comparison carriers. Formal admissibility and the Gaussian
comparison lack the augmentation-complete plethystic and weighted Gaussian
carriers. The canonical figure-eight collection and its knot-normalisation
transport need those same Gaussian carriers. Habiro membership, integral descent
at every root (including p-divisible orders), and cohomological exports
lack the number-field K₃-indexed Habiro module and relative Habiro–Hodge carriers.
The explicit quartic Bloch-order and descendant-rank endpoints need the same
integral Bloch and descendant-module constructions. Their full targets and
supplier contracts remain in README.md; no substitute predicates are introduced.
-/

namespace TauCetiRoadmap.HabiroNahmSeries

open scoped BigOperators

noncomputable section

/-! ## Layer 1: Nahm equations, fields and Bloch classes -/

/-- The exponent of an analytic Nahm summand, including its constant term. -/
def quadraticExponent {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ)
    (B : Fin N → ℝ) (C : ℝ) (n : Fin N → ℤ) : ℝ :=
  (∑ i, ∑ j, A i j * (n i : ℝ) * (n j : ℝ)) / 2 +
    (∑ i, B i * (n i : ℝ)) + C

/-- Analytic input has real symmetric positive definite A and real B and C.
Rational entries are required separately for the arithmetic applications. -/
structure NahmDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℝ
  B : Fin N → ℝ
  C : ℝ
  symmetric : A.IsSymm
  positive : A.PosDef

/-- The unsigned equations use positive real powers and require the open cube. -/
def NahmEq {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ) (x : Fin N → ℝ) : Prop :=
  (∀ i, 0 < x i ∧ x i < 1) ∧
    ∀ i, 1 - x i = ∏ j, Real.rpow (x j) (A i j)

/-- The distinguished solution exists uniquely for every real positive definite matrix.
Vlasenko–Zwegers, Lemma 2.1; real entries suffice for analytic Nahm data. -/
theorem existsUnique_nahmEq {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ)
    (hA : A.PosDef) : ∃! x : Fin N → ℝ, NahmEq A x := by
  sorry

/-- An invertible Jacobian at a zero of a rational polynomial system makes every
coordinate algebraic. The system is square; isolation is derived, not assumed as a label. -/
theorem nondegenerate_zero_isAlgebraic {N : ℕ}
    (P : Fin N → MvPolynomial (Fin N) ℚ) (x : Fin N → ℂ)
    (hzero : ∀ i, MvPolynomial.aeval x (P i) = 0)
    (hjac : Matrix.det (fun i j =>
      MvPolynomial.aeval x (MvPolynomial.pderiv j (P i))) ≠ 0) :
    ∀ i, IsAlgebraic ℚ (x i) := by
  sorry

/-! ## Layer 2: convergent sums and radial expansions -/

/-- The actual analytic summand, with finite Euler factors and the exponential branch in τ. -/
def nahmSummand {N : ℕ} (D : NahmDatum N) (τ : ℂ) (n : Fin N → ℕ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * τ *
    (quadraticExponent D.A D.B D.C (fun i => (n i : ℤ)) : ℂ)) /
    ∏ i, ∏ r ∈ Finset.range (n i),
      (1 - Complex.exp (2 * Real.pi * Complex.I * τ) ^ (r + 1))

/-- The analytic sum is a totalised sum; summability on the upper half-plane is a theorem. -/
def analyticNahmSum {N : ℕ} (D : NahmDatum N) (τ : ℂ) : ℂ :=
  ∑' n : Fin N → ℕ, nahmSummand D τ n

/-- Real positive definite A and real B and C give absolute convergence. -/
theorem nahmSummand_summable {N : ℕ} (D : NahmDatum N) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (nahmSummand D τ) := by
  sorry

/-- The τ-branch is holomorphic throughout the upper half-plane. -/
theorem analyticNahmSum_holomorphic {N : ℕ} (D : NahmDatum N) :
    DifferentiableOn ℂ (analyticNahmSum D) {τ : ℂ | 0 < τ.im} := by
  sorry

/-! ## Layer 5: formal admissibility and Gaussian comparison -/

/-- The integer exponent in F_A. Symmetry makes the numerator even. -/
def formalExponent {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ) (n : Fin N → ℕ) : ℤ :=
  ((∑ i, ∑ j, A i j * (n i : ℤ) * (n j : ℤ)) +
    ∑ i, A i i * (n i : ℤ)) / 2

/-- The formal Nahm series on the existing multivariate power-series carrier over Q(q). -/
def formalNahmSeries {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries (Fin N) (RatFunc ℚ) :=
  fun n => (-1 : RatFunc ℚ) ^ (∑ i, A i i * (n i : ℤ)) *
    RatFunc.X ^ formalExponent A n /
    (∏ i, ∏ r ∈ Finset.range (n i), (1 - RatFunc.X ^ (r + 1)))

/-- The exact column shift, including all off-diagonal entries, determines F_A. -/
theorem formalNahmSeries_qDifference {N : ℕ}
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    formalNahmSeries A -
      MvPowerSeries.rescale (fun i => if i = j then RatFunc.X else 1) (formalNahmSeries A) =
    MvPowerSeries.C ((-RatFunc.X) ^ A j j) * MvPowerSeries.X j *
      MvPowerSeries.rescale (fun i => RatFunc.X ^ A i j) (formalNahmSeries A) := by
  sorry

/-! ## Layer 7: explicit collections and exports -/

/-- The generalized Gaussian binomial with integer upper index and nonnegative
lower index, as a rational function of q. Negative upper indices are retained. -/
def generalizedQBinomial (r : ℤ) (k : ℕ) : RatFunc ℚ :=
  (∏ i ∈ Finset.range k, (1 - RatFunc.X ^ (r - (i : ℤ)))) /
    (∏ i ∈ Finset.range k, (1 - RatFunc.X ^ (i + 1)))

/-- The symmetrised Nahm series has the integral generalized q-binomial
coefficient formula for every symmetric integral matrix. Here F_(I-A)(t,q)
equals F_A(t,q⁻¹), by inversion of the finite Euler factors.
Garoufalidis–Wheeler, Proposition 1.14, equation (47). -/
theorem formalNahmSeries_symmetrisation_qBinomial {N : ℕ}
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (k : Fin N →₀ ℕ) :
    MvPowerSeries.coeff k (formalNahmSeries A * formalNahmSeries (1 - A)) =
      (-1 : RatFunc ℚ) ^ (∑ i, (A i i - 1) * (k i : ℤ)) *
        RatFunc.X ^ (-formalExponent (A - 1) (fun i => k i)) *
        ∏ i, generalizedQBinomial
          ((∑ j, A i j * (k j : ℤ)) + A i i - 1) (k i) := by
  sorry

/-- The scalar value of the constant Taylor family of the rational quadratic Gauss norm. -/
def rationalGaussTaylor (m : ℕ) : ℚ :=
  if 4 ∣ m then 2 else if 2 ∣ m then 0 else 1

/-- The rational Gauss family is the normalised squared modulus of the quadratic Gauss sum
`∑_{k mod m} e(k²/m)`; the three cases are Gauss's evaluation. -/
theorem rationalGaussTaylor_eq_gaussSum (m : ℕ) (hm : 0 < m) :
    ((rationalGaussTaylor m : ℚ) : ℂ) =
      (∑ k ∈ Finset.range m, Complex.exp (2 * Real.pi * Complex.I * (k : ℂ) ^ 2 / m)) *
        (∑ k ∈ Finset.range m, Complex.exp (-(2 * Real.pi * Complex.I * (k : ℂ) ^ 2 / m))) /
          m := by
  sorry

end

end TauCetiRoadmap.HabiroNahmSeries
