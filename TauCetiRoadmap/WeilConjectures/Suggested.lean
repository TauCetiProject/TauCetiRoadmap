import Mathlib

/-!
# Weil conjectures: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs.

WC.7's Weil conjectures are stated directly for actual smooth proper geometrically
integral schemes over a finite field: normalized integral factors, the endpoint
factors, their alternating product, every complex zero's modulus and equality of
complementary degrees. This formulation uses the point-count zeta series without
a cohomology carrier.

WC.1's arithmetic Euler product converges absolutely on a right half-plane
for actual finite-type schemes over `Spec ℤ`. Its normalized integral rational
presentation is stated for actual separated finite-type schemes over any finite field. Two definitions give the cardinality
of morphisms over the base field and the exponential point-count series.
WC.6's signed functional equation is stated for actual smooth proper schemes of
pure dimension, with the integer Euler exponent read from the rational function.
The identification of that exponent with the cohomological Euler characteristic,
and of its multiplier with the alternating Frobenius determinant, belongs to
the geometric comparisons in WC.2 and WC.6.

WC.5's independent numerical headlines are the weighted moment bound and graded
polynomial approximation theorem on finite spectra over native normed fields.
Rational-series descent, local Fatou normalization and degree-factor extraction
are consumed from the supplier roadmaps named in README.md.

The identification of the integral factors with cohomological determinants,
coefficient-prime comparisons and the all-power cohomological trace formula are
not statable at the pins: they provide integral pro-étale cohomology as additive groups, but
not the finite-dimensional rational realization with compact supports and
geometric Frobenius. WC.4 also needs rational fibre transport
and Artin comparison. The stack and Tate-representation applications need the
rational stack coefficient and arithmetic comparison constructions. The cycle
and surface applications need rational cycle maps, the numerical Picard local
system and the Enriques and genus-one surface carriers; the toric application
needs the integral fan scheme, native Chow presentation and finite-field
cohomology comparison. These missing carriers also prevent stating the general
integral toric construction and smooth complete fan cycle comparison.
-/

noncomputable section

open scoped BigOperators
open CategoryTheory AlgebraicGeometry Polynomial

namespace TauCetiRoadmap.WeilConjectures

/-! ## Layer WC.0: Rational points and Frobenius conventions -/

/-- The number of degree-`r` extension points, on the actual Hom type over `Spec k`. -/
def extensionPointCount {k : Type} [Field k] [Finite k] (p : ℕ)
    [Fact p.Prime] [CharP k p] (X : Over (Spec (.of k))) (r : ℕ) [NeZero r] : ℕ :=
  Nat.card (Over.mk (Spec.map (CommRingCat.ofHom
    (algebraMap k (FiniteField.Extension k p r)))) ⟶ X)

/-! ## Layer WC.1: Integral zeta arithmetic, masses and configurations -/

/-- The formal exponential `exp(∑_{r ≥ 1} #X(k_r) T^r/r)` over `ℚ`. -/
def zetaSeries {k : Type} [Field k] [Finite k] (p : ℕ)
    [Fact p.Prime] [CharP k p] (X : Over (Spec (.of k))) : PowerSeries ℚ :=
  PowerSeries.subst (PowerSeries.mk (fun n => match n with
    | 0 => 0
    | r + 1 => (extensionPointCount p X (r + 1) : ℚ) / (r + 1))) (PowerSeries.exp ℚ)

/-- WC.1: the arithmetic Euler product of a finite-type scheme over `Spec ℤ`
converges absolutely on a right half-plane. -/
theorem arithmeticZeta_absoluteConvergence (X : Over (Spec (.of ℤ)))
    [LocallyOfFiniteType X.hom] [QuasiCompact X.hom] :
    ∃ c : ℝ, ∀ s : ℂ, c < s.re →
      let factor : {x : X.left // IsClosed ({x} : Set X.left)} → ℂ := fun x =>
        (1 - (Nat.card (X.left.residueField x.val) : ℂ) ^ (-s))⁻¹
      Summable (fun x => ‖factor x - 1‖) ∧ Multipliable factor := by
  sorry

/-- WC.1: the zeta series of a separated finite-type scheme has a reduced,
normalized integral rational presentation, for arbitrary finite base fields. -/
theorem normalized_integral_zeta_presentation {k : Type} [Field k] [Finite k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (X : Over (Spec (.of k)))
    [LocallyOfFiniteType X.hom] [QuasiCompact X.hom] [IsSeparated X.hom] :
    ∃ U V : Polynomial ℤ, U.coeff 0 = 1 ∧ V.coeff 0 = 1 ∧
      IsCoprime (U.map (Int.castRingHom ℚ)) (V.map (Int.castRingHom ℚ)) ∧
      (V.map (Int.castRingHom ℚ) : PowerSeries ℚ) * zetaSeries p X =
        (U.map (Int.castRingHom ℚ) : PowerSeries ℚ) := by
  sorry

/-! ## Layer WC.5: Counts, finite spectra and polynomial consequences -/

open Classical in
/-- WC.5: an eventual weighted moment bound bounds every root with nonzero
total fibre weight, including repeated roots over arbitrary normed fields. -/
theorem norm_le_of_grouped_moment_bound {K : Type*} [NormedField K]
    {d : ℕ} (α w : Fin d → K)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, w i * α i ^ n‖ ≤ C * R ^ n)
    (j : Fin d)
    (hw : (∑ i ∈ Finset.univ.filter (fun i : Fin d => α i = α j), w i) ≠ 0) :
    ‖α j‖ ≤ R := by
  sorry

/-- WC.5: a polynomial approximation to pure graded moments forces odd
vanishing and exact even roots at every degree above the specified cutoff. -/
theorem graded_polynomial_approximation (p : ℝ) (hp : 1 < p) (r s : ℕ)
    (b : Fin (r + 1) → ℕ) (α : (i : Fin (r + 1)) → Fin (b i) → ℂ)
    (P : Polynomial ℚ)
    (hweight : ∀ i j, ‖α i j‖ = p ^ ((i.val : ℝ) / 2))
    (hlimit : Filter.Tendsto (fun n : ℕ =>
      ‖(∑ i : Fin (r + 1), (-1 : ℂ) ^ i.val * ∑ j : Fin (b i), α i j ^ n) -
        P.eval₂ (algebraMap ℚ ℂ) ((p ^ n : ℝ) : ℂ)‖ / p ^ ((s : ℝ) * n / 2)) Filter.atTop (nhds 0)) :
    (∀ i : Fin (r + 1), s ≤ i.val → Odd i.val → b i = 0) ∧
    (∀ i : Fin (r + 1), s ≤ i.val → ∀ j : ℕ, i.val = 2 * j →
      P.coeff j = (b i : ℚ) ∧ ∀ k : Fin (b i), α i k = (p ^ j : ℝ)) ∧
    (∀ j : ℕ, s ≤ 2 * j → r < 2 * j → P.coeff j = 0) := by
  sorry

/-! ## Layer WC.6: Smooth proper and mixed extensions -/

/-- WC.6: the signed functional equation for a smooth proper pure-dimensional
scheme, in the rational-function field and with integer Euler exponents. -/
theorem functional_equation_of_smooth_proper
    {k : Type} [Field k] [Finite k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (X : Over (Spec (.of k))) (d : ℕ)
    [SmoothOfRelativeDimension d X.hom] [IsProper X.hom]
    (U V : Polynomial ℤ) (hU : U.coeff 0 = 1) (hV : V.coeff 0 = 1)
    (hcop : IsCoprime (U.map (Int.castRingHom ℚ)) (V.map (Int.castRingHom ℚ)))
    (hZ : (V.map (Int.castRingHom ℚ) : PowerSeries ℚ) * zetaSeries p X =
      (U.map (Int.castRingHom ℚ) : PowerSeries ℚ)) :
    let χ : ℤ := (V.natDegree : ℤ) - (U.natDegree : ℤ)
    let t : RatFunc ℚ := RatFunc.X
    let a : ℚ →+* RatFunc ℚ := algebraMap ℚ (RatFunc ℚ)
    let Z : RatFunc ℚ := (U.map (Int.castRingHom ℚ)).eval₂ a t /
      (V.map (Int.castRingHom ℚ)).eval₂ a t
    ∃! Δ : ℚ, Δ ≠ 0 ∧ Δ ^ 2 = (Nat.card k : ℚ) ^ ((d : ℤ) * χ) ∧
      (U.map (Int.castRingHom ℚ)).eval₂ a ((a ((Nat.card k : ℚ) ^ d) * t)⁻¹) /
        (V.map (Int.castRingHom ℚ)).eval₂ a ((a ((Nat.card k : ℚ) ^ d) * t)⁻¹) =
          (-1 : RatFunc ℚ) ^ χ * a Δ * t ^ χ * Z := by
  sorry

/-! ## Layer WC.7: Geometric calculations and the assembled theorem -/

/-- WC.7: the Weil conjectures in terms of the point-count zeta series, including
the endpoint factors, root moduli and equality of complementary degrees. -/
theorem weilConjectures_smooth_proper
    {k : Type} [Field k] [Finite k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (X : Over (Spec (.of k))) (d : ℕ)
    [SmoothOfRelativeDimension d X.hom] [IsProper X.hom]
    [GeometricallyIntegral X.hom] :
    ∃ P : Fin (2 * d + 1) → Polynomial ℤ,
      (∀ i, (P i).coeff 0 = 1) ∧
      P 0 = 1 - Polynomial.X ∧
      P (Fin.last (2 * d)) = 1 - C ((Nat.card k : ℤ) ^ d) * Polynomial.X ∧
      zetaSeries p X =
        (∏ i ∈ Finset.univ.filter (fun i : Fin (2 * d + 1) => Odd i.val),
          ((P i).map (Int.castRingHom ℚ) : PowerSeries ℚ)) *
        (∏ i ∈ Finset.univ.filter (fun i : Fin (2 * d + 1) => Even i.val),
          ((P i).map (Int.castRingHom ℚ) : PowerSeries ℚ))⁻¹ ∧
      (∀ i (α : ℂ), (P i).eval₂ (Int.castRingHom ℂ) α = 0 →
        ‖α‖ = (Nat.card k : ℝ) ^ (-(i.val : ℝ) / 2)) ∧
      (∀ i, (P i).natDegree = (P i.rev).natDegree) := by
  sorry

end TauCetiRoadmap.WeilConjectures
