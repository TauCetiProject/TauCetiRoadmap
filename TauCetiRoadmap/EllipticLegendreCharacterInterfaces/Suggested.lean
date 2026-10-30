import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic

/-!
# Elliptic curves, Part II — Legendre models, descent and character interfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs. The odd-character-conductor divisibility theorem is not
statable at these pins: the actual elliptic conductor of a rational elliptic curve, with its
comparison to reduction, has no native carrier. The statable headlines are split-two-torsion
normalization, good-prime parameter units, split-cubic halving, the two-by-four subgroup, the
exact two-part of the minus-one count, symmetric-cubic trace zero, and the normal-form
quadratic-twist trace identity. Split descent coordinates, character support and explicit
order-four witnesses are supporting targets in README.md.
-/

namespace TauCetiRoadmap.EllipticLegendreCharacterInterfaces

/-! ## Layer 0: Legendre equations and root orderings -/

/-- The five-coefficient Legendre model `y² = x(x − 1)(x − lam)` over a commutative ring: the
Frey equation `y² = x(x − A)(x + B)`, with coefficients `(0, B − A, 0, −AB, 0)`, at
`(A, B) = (1, −lam)`. -/
def legendre {R : Type*} [CommRing R] (lam : R) : WeierstrassCurve R :=
  ⟨0, -(1 + lam), 0, lam, 0⟩

/-- The split cubic with ordered roots `0`, `d`, and `d * lam`: the Frey equation
`y² = x(x − A)(x + B)` at `(A, B) = (d, −d * lam)`. -/
def scaledLegendre {R : Type*} [CommRing R] (d lam : R) : WeierstrassCurve R :=
  ⟨0, -d * (1 + lam), 0, d ^ 2 * lam, 0⟩

/-- Full rational two-torsion gives an admissible scaled Legendre equation. -/
theorem exists_scaledLegendre_of_full_two_torsion
    {K : Type*} [Field K] [DecidableEq K] (h2 : (2 : K) ≠ 0)
    (E : WeierstrassCurve K) [E.IsElliptic]
    (hfull : Nat.card (nsmulAddMonoidHom (α := E.toAffine.Point) 2).ker = 4) :
    ∃ (C : WeierstrassCurve.VariableChange K) (d lam : K),
      d ≠ 0 ∧ lam ≠ 0 ∧ lam ≠ 1 ∧ C • E = scaledLegendre d lam := by
  sorry

/-! ## Layer 1: Good reduction and character conductors -/

/-- Good reduction of a rational curve at an odd prime forces its associated parameter units. -/
theorem legendre_units_of_good_reduction
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange ℚ) (d lam : ℚ)
    (hmodel : C • E = scaledLegendre d lam)
    (hgood : WeierstrassCurve.HasGoodReduction (PadicInt p)
      ((E.map (algebraMap ℚ (Padic p))).minimal (PadicInt p))) :
    padicValRat p lam = 0 ∧ padicValRat p (1 - lam) = 0 := by
  sorry

/-! ## Layer 2: Split-cubic readings of the native descent map -/

/-- An affine point can be halved exactly when its three root differences are field squares. -/
theorem scaledLegendre_halving_iff_squares
    {K : Type*} [Field K] [DecidableEq K] (h2 : (2 : K) ≠ 0)
    (d lam : K) (hd : d ≠ 0) (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1)
    (x y : K) (hP : (scaledLegendre d lam).toAffine.Nonsingular x y) :
    (∃ Q : (scaledLegendre d lam).toAffine.Point,
      2 • Q = WeierstrassCurve.Affine.Point.some x y hP) ↔
      IsSquare x ∧ IsSquare (x - d) ∧ IsSquare (x - d * lam) := by
  sorry

/-! ## Layer 3: Two-primary torsion over finite fields -/

/-- Every admissible square parameter over an odd finite field supplies a two-by-four subgroup. -/
theorem legendre_two_by_four_subgroup
    {F : Type*} [Field F] [Finite F] [DecidableEq F] (h2 : (2 : F) ≠ 0)
    (η : F) (hη : η ≠ 0) (hη₁ : η ^ 2 ≠ 1) :
    ∃ f : (ZMod 2 × ZMod 4) →+ (legendre (η ^ 2)).toAffine.Point,
      Function.Injective f := by
  sorry

/-- Over a finite field of cardinality congruent to five modulo eight, the full projective
minus-one point count has exact two-adic valuation three. -/
theorem legendre_minus_one_point_count_v_two
    {F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 8 = 5) :
    padicValNat 2 (legendre (-1 : F)).pointCount = 3 := by
  sorry

/-! ## Layer 5: Trace and downstream interfaces -/

/-- Over a finite field of cardinality q congruent to three modulo four, every symmetric cubic
y² = x³ + a·x, the singular a = 0 included, has projective point count q+1 and trace zero.
The Legendre equations L(u,−1) are the cases a = −u². -/
theorem symmetric_cubic_trace_zero
    {F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 4 = 3) (a : F) :
    (⟨0, 0, 0, a, 0⟩ : WeierstrassCurve F).pointCount = Fintype.card F + 1 ∧
      (⟨0, 0, 0, a, 0⟩ : WeierstrassCurve F).frobeniusTrace = 0 := by
  sorry

/-- For a normal-form equation over an odd finite field, twisting scales the trace by the
quadratic character, including singular equations and the zero twisting scalar. -/
theorem quadraticTwistOf_frobeniusTrace
    {F : Type*} [Field F] [Fintype F] [DecidableEq F] (h2 : (2 : F) ≠ 0)
    (W : WeierstrassCurve F) [W.IsCharNeTwoNF] (d : F) :
    (W.quadraticTwistOf 0 (-d / 4)).frobeniusTrace =
      quadraticChar F d * W.frobeniusTrace := by
  sorry

end TauCetiRoadmap.EllipticLegendreCharacterInterfaces
