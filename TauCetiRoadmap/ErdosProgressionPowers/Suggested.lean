module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor
import TauCeti.AlgebraicGeometry.EllipticCurve.FreyCurve.Basic

/-!
# ErdosProgressionPowers: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: half-interval
prime divisibility, the comparison-curve theorem, the simultaneous quadratic
character family, the effective prime-exponent bound, signed hyperbolic and
positive fixed-exponent finiteness, fixed-length all-exponent finiteness, and
the Erdos-Selfridge consecutive-product theorem.

The comparison-curve theorem (README section 1.12) and the character family
(section 2.7) are stated on the progression Frey curve, whose conductor is
rendered by the norm of Tau Ceti's `WeierstrassCurve.algorithmicConductor`
(the conductor by Ogg's formula) and whose deletion level is computed from
that norm and the norm of `WeierstrassCurve.minimalDiscriminantIdeal`; the
residual comparison is a Galois-equivariant isomorphism of the geometric
`ell`-torsion subgroups, Mathlib's `AddSubgroup.torsionBy` of the points over an
algebraic closure, with the Galois action given by Mathlib's
`WeierstrassCurve.Affine.Point.map`. The progression Frey curve is Tau Ceti's
`TauCeti.freyCurve` at the normalized coefficients. The pinned libraries carry no Artin
conductor of the torsion representation, so the identification of the deletion
level with that residual conductor (section 1.10) is a README target only.

The four explicit finite-range prime estimates that AnalyticNumberTheoryPartI
states as hypotheses (its sections 0.3, 0.5, 0.16 and 0.25) are restated here
with the same statements, because a roadmap's Lean file imports only the pinned
libraries. The headline theorems whose README routes apply one of these
estimates carry it as a hypothesis, each only those its route uses; the two
fixed-exponent finiteness theorems carry none. ExplicitPrimeCounting, with
ExplicitZetaBounds for the zero-line clause of the mod-eight input, proves the
estimates from recorded numerical verifications.

The existential prime-exponent statement records the numerical bound; its
README theorem additionally requires an effectively computable threshold.
The Erdos eventual-nonexistence conjecture and the announced smooth-multiplier
extension in Layer 7 are not asserted as theorems.
-/

open scoped BigOperators
open WeierstrassCurve
open scoped WeierstrassCurve Classical

namespace TauCetiRoadmap.ErdosProgressionPowers

/-! ## Layer 0: Primitive solutions and signed factors -/

/-- The zero-based integer progression term n + i*d. -/
def term (n d : ℤ) (i : ℕ) : ℤ := n + (i : ℤ) * d

/-- A positive-length primitive progression solution with prime exponent and nonzero y*d. -/
def primitive_solution (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧
    (∏ i ∈ Finset.range k, term n d i) = y ^ ell ∧ y * d ≠ 0

/-- A primitive solution of length at least 10^8 with exponent above exp(10^k). -/
def H (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  primitive_solution n d k y ell ∧ 10 ^ 8 ≤ k ∧ (ell : ℝ) > Real.exp (10 ^ k : ℝ)

/-- The small-prime part of an integer: the product of the prime powers of `|t|` at the primes
below `k`. For a nonzero term of a signed factorization this is its coefficient `A_i`, which
retains every power of every prime below `k`; it is `1` at `t = 0` and when no prime lies
below `k`. -/
def smallPart (k : ℕ) (t : ℤ) : ℕ :=
  ∏ p ∈ t.natAbs.primeFactors.filter (· < k), p ^ padicValNat p t.natAbs

/-- Schoenfeld's finite range, the input of AnalyticNumberTheoryPartI §0.3 with the same
statement: `θ(x) < 1.000081 x` for every real `0 < x < exp 10000`, for Mathlib's
`Chebyshev.theta`. ExplicitPrimeCounting §3.2 proves it from recorded numerical
verifications. -/
def SchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 0 < x → x < Real.exp 10000 → Chebyshev.theta x < 1.000081 * x

/-- Rosser–Schoenfeld's finite range, the input of AnalyticNumberTheoryPartI §0.5 with the same
statement: `(x / log x)(1 + 1/(2 log x)) < π(x) < (x / log x)(1 + 3/(2 log x))` for every real
`59 ≤ x < exp 10000`. ExplicitPrimeCounting §3.5 proves it from recorded numerical
verifications. -/
def RosserSchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 59 ≤ x → x < Real.exp 10000 →
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < (Nat.primeCounting ⌊x⌋₊ : ℝ) ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x))

/-- The mod-eight input of AnalyticNumberTheoryPartI §0.16 with the same statement: the
Ramaré–Rumely bound `|θ(x; 8, a) − x/4| ≤ 0.002811 x/4` for `a = 3, 5` and every real
`10¹⁰ ≤ x < exp 10000`, where `θ(x; 8, a)` sums `log p` over the primes `p ≤ x` with
`p ≡ a mod 8`; and every zero `s` with `0 < Re s < 1` and `|Im s| ≤ 10000` of the L-function of a
Dirichlet character modulo 8 has `Re s = 1/2`. ExplicitPrimeCounting §6.1 proves the first clause
and ExplicitZetaBounds §§0.2–0.4 supply the second, from recorded numerical verifications. -/
def ModEightFiniteInput : Prop :=
  (∀ a : ZMod 8, (a = 3 ∨ a = 5) → ∀ x : ℝ, (10 : ℝ) ^ 10 ≤ x → x < Real.exp 10000 →
      |(∑ p ∈ (Nat.primesLE ⌊x⌋₊).filter (fun p : ℕ => (p : ZMod 8) = a), Real.log p) - x / 4| ≤
        0.002811 * x / 4) ∧
    ∀ χ : DirichletCharacter ℂ 8, ∀ s : ℂ, 0 < s.re → s.re < 1 → |s.im| ≤ 10000 →
      DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The reciprocal-prime range, the input of AnalyticNumberTheoryPartI §0.25 with the same
statement: `∑_{p ≤ x} 1/p ≤ log log x + 0.27 + 5 / log x` for every real `10⁸ ≤ x < exp 10000`.
ExplicitPrimeCounting §4.3 proves it from recorded numerical verifications. -/
def PrimeProductFiniteInput : Prop :=
  ∀ x : ℝ, (10 : ℝ) ^ 8 ≤ x → x < Real.exp 10000 →
    ∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p ≤ Real.log (Real.log x) + 0.27 + 5 / Real.log x

/-! ## Layer 1: Frey families and residual comparisons -/

/-- The first progression Frey curve `Y² = X(X − a)(X + c)` of a triple `(i, j, h)`: with
`g = gcd(t_i, gcd(2 t_j, t_h))`, `a = t_i / g` and `c = t_h / g` (exact integer divisions, since
`g` divides `t_i` and `t_h`), the pinned Frey–Hellegouarch curve `TauCeti.freyCurve a c`, whose
coefficients are `(0, c − a, 0, −a c, 0)`. -/
noncomputable def progressionFreyCurve (n d : ℤ) (i j h : ℕ) : WeierstrassCurve ℚ :=
  let g : ℤ := Int.gcd (term n d i) (Int.gcd (2 * term n d j) (term n d h))
  let a : ℚ := ((term n d i / g : ℤ) : ℚ)
  let c : ℚ := ((term n d h / g : ℤ) : ℚ)
  TauCeti.freyCurve a c

/-- The deletion level `M₀` of an elliptic curve over `ℚ` at a prime `ell`: its conductor `M`,
the norm of the algorithmic conductor (the conductor by Ogg's formula), divided by the product
of the primes `q ∥ M` such that `ell` divides `v_q(Δ_min)`, the valuation of the norm of the
minimal discriminant ideal. The prime `q = ell` is not excluded from the deletion. -/
noncomputable def deletionLevel (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : ℕ :=
  let M := Ideal.absNorm (algorithmicConductor ℤ E)
  let D := Ideal.absNorm (minimalDiscriminantIdeal ℤ E)
  M / ∏ q ∈ M.primeFactors.filter (fun q => padicValNat q M = 1 ∧ ell ∣ padicValNat q D), q

/-- Full rational two-torsion: the rational points killed by `2`, Mathlib's
`AddSubgroup.torsionBy` of the rational points at `2`, number exactly four. This is the
full-two-torsion predicate of EllipticCurveModularityPartII, restated here only because this
file cannot import another roadmap's module. -/
def HasFullRationalTwoTorsion (E : WeierstrassCurve ℚ) : Prop :=
  Nat.card (AddSubgroup.torsionBy E.toAffine.Point 2) = 4

local notation "Ω" => AlgebraicClosure ℚ

/-- Under `SchoenfeldFiniteRangeInput`, which enters through the Chebyshev bounds of the reduced
levels (README sections 1.7–1.8), every prime in the upper half of the length divides the common
difference under H. (BS20, Lemma 4.1, p. 364.) -/
theorem half_primes_divide_d (hS : SchoenfeldFiniteRangeInput) {n d : ℤ} {k : ℕ} {y : ℤ}
    {ell p : ℕ} (hH : H n d k y ell) (hp : p.Prime) (hl : k < 2*p) (hu : p ≤ k) :
    (p : ℤ) ∣ d := by sorry

/-- The comparison-curve theorem (README section 1.12): assume `SchoenfeldFiniteRangeInput` and
`PrimeProductFiniteInput`, which enter through the level bound and the Kraus threshold (README
sections 1.7 and 1.11). Under `H`, for every triple `(i, j, h)`
of `A(k)` (that is `h < k`, `i < j` and `i + h = 2 j`) there is an elliptic curve `F/ℚ` with
full rational two-torsion, conductor exactly the deletion level of the progression Frey curve
`E` at `ell`, and an isomorphism `E[ell] ≃ F[ell]` of geometric `ell`-torsion groups (Mathlib's
`AddSubgroup.torsionBy` of the points over an algebraic closure `Ω`) commuting with the action of
every automorphism of `Ω` over `ℚ`. The ellipticity of `E` follows
from `H` and membership in `A(k)` (section 1.3); it is carried as an instance so that the
deletion level is defined. (BS20, Lemma 5.1, p. 365.) -/
theorem comparison_curve (hS : SchoenfeldFiniteRangeInput) (hP : PrimeProductFiniteInput)
    {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : H n d k y ell)
    {i j h : ℕ} (hk : h < k) (hij : i < j) (hsum : i + h = 2 * j)
    [(progressionFreyCurve n d i j h).IsElliptic] :
    ∃ F : WeierstrassCurve ℚ, ∃ _ : F.IsElliptic, HasFullRationalTwoTorsion F ∧
      Ideal.absNorm (algorithmicConductor ℤ F) = deletionLevel (progressionFreyCurve n d i j h) ell ∧
      ∃ e : AddSubgroup.torsionBy (((progressionFreyCurve n d i j h)⁄Ω).toAffine.Point) ell ≃+
              AddSubgroup.torsionBy ((F⁄Ω).toAffine.Point) ell,
        ∀ (σ : Ω ≃ₐ[ℚ] Ω)
          (P Q : AddSubgroup.torsionBy (((progressionFreyCurve n d i j h)⁄Ω).toAffine.Point) ell),
          (Q : ((progressionFreyCurve n d i j h)⁄Ω).toAffine.Point) =
              Affine.Point.map σ.toAlgHom P →
            (e Q : (F⁄Ω).toAffine.Point) = Affine.Point.map σ.toAlgHom (e P) := by sorry

/-! ## Layer 2: Legendre cases and the simultaneous character family -/

/-- The odd part `N / 2^(v₂ N)` of a natural number. -/
def oddPart (N : ℕ) : ℕ := N / 2 ^ padicValNat 2 N

/-- The simultaneous character-family theorem (README section 2.7): assume
`SchoenfeldFiniteRangeInput` and `PrimeProductFiniteInput`, which enter through the comparison
curve, and `ModEightFiniteInput`, which enters through the mod-eight projections (README sections
2.3 and 2.6). Under `H⁺`, that is `H` with `k ≥ 2·10¹⁰`, every triple `(i, j, h)` of `A(k)` has a
primitive quadratic Dirichlet
character `χ` of conductor `N > 1` whose half-interval von Mangoldt sum over `k/2 < m ≤ k`
exceeds `0.1239 k` in absolute value, whose odd part `N^odd` is squarefree, different from `1`,
divides the deletion level of the progression Frey curve at `ell` and divides the product of the
small-prime parts of the three terms, and with `N ≤ 8 N^odd`. (BS20, Proposition 6.1,
p. 367.) -/
theorem character_family (hS : SchoenfeldFiniteRangeInput) (hP : PrimeProductFiniteInput)
    (hM : ModEightFiniteInput) {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : H n d k y ell)
    (hk : 2 * 10 ^ 10 ≤ k) {i j h : ℕ} (hk' : h < k) (hij : i < j) (hsum : i + h = 2 * j)
    [(progressionFreyCurve n d i j h).IsElliptic] :
    ∃ N : ℕ, ∃ _ : NeZero N, ∃ χ : DirichletCharacter ℂ N, χ.IsPrimitive ∧ χ.IsQuadratic ∧
      ‖∑ m ∈ Finset.Ioc (k / 2) k, χ m * (ArithmeticFunction.vonMangoldt m : ℂ)‖ > 0.1239 * k ∧
      Squarefree (oddPart N) ∧ oddPart N ≠ 1 ∧
      oddPart N ∣ deletionLevel (progressionFreyCurve n d i j h) ell ∧
      oddPart N ∣ smallPart k (term n d i) * smallPart k (term n d j) * smallPart k (term n d h) ∧
      N ≤ 8 * oddPart N := by sorry

/-! ## Layer 6: Effective exponent bound and fixed-length finiteness -/

/-- Under the four finite-range inputs (`RosserSchoenfeldFiniteRangeInput` enters through the
prime count of README section 5.7, the other three through the character family), above an
absolute threshold a nontrivial primitive progression has prime exponent at most exp(10^k).
(BS20, Theorem 2, p. 357.) -/
theorem effective_prime_bound (hS : SchoenfeldFiniteRangeInput)
    (hR : RosserSchoenfeldFiniteRangeInput) (hM : ModEightFiniteInput)
    (hP : PrimeProductFiniteInput) : ∃ k0 : ℕ, 5 ≤ k0 ∧
    ∀ (k : ℕ) (n d y : ℤ) (ell : ℕ), k0 ≤ k → Int.gcd n d = 1 → ell.Prime →
      (∏ i ∈ Finset.range k, term n d i) = y^ell →
      y*d=0 ∨ (ell : ℝ) ≤ Real.exp (10^k : ℝ) := by sorry

/-- Fixed-exponent signed progression finiteness throughout the hyperbolic diagonal-curve range. -/
theorem fixed_exponent_finiteness (k ell : ℕ) (hk : 3 ≤ k) (he : 2 ≤ ell)
    (hh : 2*ell+k < k*ell) :
    {t : ℤ × ℤ × ℤ | Int.gcd t.1 t.2.1 = 1 ∧ t.2.2*t.2.1 ≠ 0 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2^ell}.Finite := by sorry

/-- Positive fixed-exponent finiteness includes the two elliptic arithmetic boundary cases. -/
theorem positive_fixed_exponent_finiteness (k ell : ℕ) (hk : 3 ≤ k) (he : 2 ≤ ell)
    (hh : 6 ≤ k+ell) :
    {t : ℤ × ℤ × ℤ | 0 < t.1 ∧ 0 < t.2.1 ∧ 0 < t.2.2 ∧
      Int.gcd t.1 t.2.1 = 1 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2^ell}.Finite := by sorry

/-- Under the four finite-range inputs, which enter through the prime-exponent bound, for each
sufficiently large fixed length there are finitely many primitive nontrivial signed solutions
(n, d, y, ell) with y*d ≠ 0 and arbitrary exponent ell ≥ 2; the positive tuples are a subset. -/
theorem fixed_length_finiteness (hS : SchoenfeldFiniteRangeInput)
    (hR : RosserSchoenfeldFiniteRangeInput) (hM : ModEightFiniteInput)
    (hP : PrimeProductFiniteInput) : ∃ k0 : ℕ, 5 ≤ k0 ∧ ∀ k ≥ k0,
    {t : ℤ × ℤ × ℤ × ℕ | t.2.2.1*t.2.1 ≠ 0 ∧ 2 ≤ t.2.2.2 ∧ Int.gcd t.1 t.2.1 = 1 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2.1^t.2.2.2}.Finite := by sorry

/-! ## Layer 7: Conjectural and announced predicates -/

/-- Under `SchoenfeldFiniteRangeInput` and `RosserSchoenfeldFiniteRangeInput`, which enter through
the theta bound of the square-exponent branch and the prime count of the large-length range
(README section 7.1), a product of at least two consecutive positive integers is not a nontrivial
perfect power (the base y = 0 is excluded by positivity of the product, so no hypothesis on y is
needed). (ErdosSelfridge1975, Theorem 1, p. 292.) -/
theorem consecutiveProduct_not_perfectPower (hS : SchoenfeldFiniteRangeInput)
    (hR : RosserSchoenfeldFiniteRangeInput) (n k y ell : ℕ)
    (hn : 0 < n) (hk : 2 ≤ k) (he : 2 ≤ ell) :
    (∏ i ∈ Finset.range k, (n + i)) ≠ y^ell := by sorry

end TauCetiRoadmap.ErdosProgressionPowers
