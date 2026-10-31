module

public import Mathlib
public import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Ring
public import TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass
public import TauCeti.FieldTheory.SquareClassGroup.Basic

/-!
# CM rank-zero converses and twist nonvanishing: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems that can be expressed against the pinned APIs.

The signatures below state the three congruent-number density theorems,
CM twist nonvanishing and non-descending nonvanishing. Entire continuation is
specified by agreement with the native elliptic L-series on Re(s) > 3/2;
uniqueness makes its value the arithmetic L-value. The remaining end theorems
are not statable at the pins:
* The conditional rational Kato converse (§3.2) and the all-prime CM newform
  converse (§3.3) need modular Galois realizations, the Bloch–Kato Selmer
  carrier, and the actual zeta morphism with its Iwasawa complex; §3.3 also
  needs the CM-newform predicate. The arithmetic newform L-function and its
  finite analytic order are available at the pins.
* The CM elliptic converses over the CM field (§4.2) and over ℚ (§4.5) need
  the classical p-infinity Kummer Selmer carrier and its finite-cotype corank.
  Non-scalar native endomorphisms express CM for the analytic headlines below.

No abstract scalar functions or freely chosen Selmer predicates replace these
objects. Elementary sign and discriminant identities remain checks in README.md.
-/

@[expose] public section

namespace TauCetiRoadmap.CMRankZeroConverse

open Filter NumberField
open scoped Topology

/-! ## Layer 0: Central conventions and shared propositions -/

/-- Nonvanishing at one of the entire continuation of the actual Hasse–Weil
L-series. Agreement on a half-plane determines the entire function uniquely. -/
def ellipticLNonvanishingAtOne {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) : Prop :=
  ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
    (∀ s : ℂ, 3 / 2 < s.re → F s = W.LSeries s) ∧ F 1 ≠ 0

/-! ## Layer 5: Congruent-number twists and even Goldfeld -/

/-- The signed quadratic twists of the congruent-number curve in short form,
y² = x³ − n²x. The singular value n = 0 is excluded by each counting family. -/
def congruentTwist (n : ℤ) : WeierstrassCurve ℚ :=
  WeierstrassCurve.shortCurve (-(n : ℚ) ^ 2) 0

open scoped Classical in
/-- Nonvanishing has relative density one among positive squarefree parameters
in residues 1, 2, 3 modulo eight (BT Theorem 1.2). -/
theorem congruentNumber_densityOne :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        n % 8 ∈ ({1, 2, 3} : Finset ℕ) ∧
        ellipticLNonvanishingAtOne (congruentTwist (n : ℤ)))).card : ℝ) /
      ((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        n % 8 ∈ ({1, 2, 3} : Finset ℕ))).card) atTop (𝓝 1) := by
  sorry

open scoped Classical in
/-- Exactly half of the positive squarefree congruent-number twists have
nonzero central L-value, in the parameter ordering. -/
theorem congruentNumber_half_positive :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        ellipticLNonvanishingAtOne (congruentTwist (n : ℤ)))).card : ℝ) /
      ((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n)).card)
      atTop (𝓝 (1 / 2)) := by
  sorry

open scoped Classical in
/-- The even Goldfeld limit for the congruent-number curve, over both signs
of fundamental discriminants ordered by absolute value (including d = 1). -/
theorem congruentNumber_half_discriminants :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc (-(X : ℤ)) (X : ℤ)).filter (fun d : ℤ => d ≠ 0 ∧
        ((d % 4 = 1 ∧ Squarefree d) ∨
          ∃ m : ℤ, d = 4 * m ∧ (m % 4 = 2 ∨ m % 4 = 3) ∧ Squarefree m) ∧
        ellipticLNonvanishingAtOne (congruentTwist d))).card : ℝ) /
      ((Finset.Icc (-(X : ℤ)) (X : ℤ)).filter (fun d : ℤ => d ≠ 0 ∧
        ((d % 4 = 1 ∧ Squarefree d) ∨
          ∃ m : ℤ, d = 4 * m ∧ (m % 4 = 2 ∨ m % 4 = 3) ∧ Squarefree m))).card)
      atTop (𝓝 (1 / 2)) := by
  sorry

/-! ## Layer 6: CM twists, cube sums and non-descent -/

/-- The odd-valuation support height on the native squareclass quotient over any
number field, restating ArithmeticStatisticsPartI §0.5 for the headline signatures.
The finite product uses the principal fractional ideal of a nonzero
representative; changing it by a square preserves every valuation parity. -/
noncomputable def squareclassHeight {K : Type*} [Field K] [NumberField K]
    (c : TauCeti.SquareClassGroup K) : ℕ :=
  ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K),
    if Odd (FractionalIdeal.count K v
      (FractionalIdeal.spanSingleton (nonZeroDivisors (NumberField.RingOfIntegers K))
        ((Additive.toMul c.out : Kˣ) : K))) then Ideal.absNorm v.asIdeal else 1

/-- Over an imaginary quadratic field where three is not inert, at least half
of the quadratic twists of any CM elliptic curve have nonzero central L-value,
in the odd-support height ordering (BT Proposition 1.3). -/
theorem cmTwists_nonvanishing_lowerHalf
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2)
    (h3 : ¬ (Ideal.span {(3 : NumberField.RingOfIntegers K)}).IsPrime)
    (A : WeierstrassCurve K) [A.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom A.toAffine A.toAffine)))
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ X : ℝ in atTop,
      (1 / 2 - ε) * ({c : TauCeti.SquareClassGroup K |
        (squareclassHeight c : ℝ) < X}.ncard : ℝ) ≤
      ({c : TauCeti.SquareClassGroup K | (squareclassHeight c : ℝ) < X ∧
        ellipticLNonvanishingAtOne
          (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) := by
  sorry

/-- A Weierstrass curve over a characteristic-zero field descends to ℚ as a
pointed elliptic curve when it is an admissible change of variables of the base
change of an elliptic Weierstrass curve over ℚ. -/
def descendsToRat {K : Type*} [Field K] [Algebra ℚ K]
    (W : WeierstrassCurve K) : Prop :=
  ∃ E : WeierstrassCurve ℚ, E.IsElliptic ∧
    ∃ C : WeierstrassCurve.VariableChange K,
      C • E.map (algebraMap ℚ K) = W

/-- Under the CM twist hypotheses, non-descending twists with nonzero central
L-value have lower proportion at least one half among all squareclasses. -/
theorem cmTwists_nondescending_nonvanishing_lowerHalf
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2)
    (h3 : ¬ (Ideal.span {(3 : NumberField.RingOfIntegers K)}).IsPrime)
    (A : WeierstrassCurve K) [A.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom A.toAffine A.toAffine)))
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ X : ℝ in atTop,
      (1 / 2 - ε) * ({c : TauCeti.SquareClassGroup K |
        (squareclassHeight c : ℝ) < X}.ncard : ℝ) ≤
      ({c : TauCeti.SquareClassGroup K | (squareclassHeight c : ℝ) < X ∧
        ¬ descendsToRat (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K))) ∧
        ellipticLNonvanishingAtOne
          (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) := by
  sorry

end TauCetiRoadmap.CMRankZeroConverse

end
