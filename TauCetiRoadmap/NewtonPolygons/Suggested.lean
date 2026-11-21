import Mathlib
import TauCeti.Analysis.Convex.Sequence.Face
import TauCeti.NumberTheory.NewtonPolygon.Basic
import TauCeti.NumberTheory.NewtonPolygon.Slopes
import TauCeti.RingTheory.PowerSeries.GaussNorm
import TauCeti.RingTheory.PowerSeries.Entire.GoodZero

/-!
# Newton polygons of polynomials and power series: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries do not already prove,
each with `sorry`.

The headline theorems of the roadmap are:

* the finite slopes of the Newton polygon of a polynomial are the negatives of the valuations of
  its nonzero roots in a splitting extension;
* the Newton polygon of a product of two polynomials, or of two entire series, is the Minkowski
  sum of the Newton polygons of the factors;
* the radius of convergence of a power series with admissible coefficient heights and infinitely
  many nonzero coefficients is `b` raised to the supremum of the finite slopes of its Newton
  polygon (a polynomial has radius `∞`);
* the Newton-polygon irreducibility criteria over a discretely valued field, and the factorisation
  `π ^ μ · unit · distinguished polynomial` of a nonzero power series over a complete discrete
  valuation ring with exponent `μ` and degree `λ`;
* the Hodge–Newton inequality from convex lower bounds on the coefficients;
* the slope factorisation of a polynomial over a complete field (§4.2);
* the counts, with multiplicity, of the zeros of a restricted series in a closed disc and in the
  open disc (§4.3);
* the Weierstrass product of an entire series over a complete algebraically closed field (§5.3).

The first five are proved at the pinned Tau Ceti; the README names the declarations in its
supplier contracts, and they are not restated here. The last three are stated below, together
with the identification of the extreme active coefficients with the endpoints of a finite face
(§2.3), the constant-one disc factor (§4.1) and the root counts of a disc polynomial (§4.3), on
which they rest. Every headline theorem is statable at the pins.
-/

namespace TauCetiRoadmap.NewtonPolygons

open PowerSeries Polynomial TauCeti TauCeti.PowerSeries Filter Topology

/-! ## Layer 2: Coefficients, Gauss values and active indices -/

/-- §2.3. Let the norm of the field `K` be `‖x‖ = b ^ (-v x)` for a real additive valuation `v`
and a base `b > 1`, let `0 < r < s`, and let `f` be restricted at `s`. If `l` and `u` are the first
and the last index at which `‖a_n‖ r ^ n` attains the Gauss norm of `f` at `r`, then the Newton
polygon of `f` has a finite face of slope `log_b r` with endpoints `l` and `u` (Lazard §1). -/
theorem finiteFace_of_gaussExtrema {K : Type*} [NormedField K]
    (v : AddValuation K (WithTop ℝ)) {b : ℝ} (hb : 1 < b)
    (hv : ∀ x : K, x ≠ 0 → ‖x‖ = b ^ (-(v x).untop₀))
    {r s : ℝ} (hr : 0 < r) (hrs : r < s) {f : K⟦X⟧} (hf : f.IsRestricted s)
    {l u : ℕ} (hl : IsLowestDominant r l f) (hu : IsDistinguished r u f) :
    IsFiniteFace (f.newtonPolygon v) (Real.logb b r) l u := by
  sorry

/-! ## Layer 4: Disc factors, slope factors and analytic zeros -/

/-- §4.1. Over a complete ultrametric normed field, let `f` be restricted at `r > 0` with constant
coefficient one, and let `d` be the last index attaining its Gauss norm at `r`. Then `f = P * U`
for exactly one pair of a polynomial `P` of degree `d` with constant coefficient one and a series
`U` restricted at `r` with constant coefficient one and `‖U - 1‖_r < 1` (BGR §5.2; Lazard
Proposition 4, part 2, with upper end `+∞`). -/
theorem discFactor_unique {K : Type*} [NormedField K] [IsUltrametricDist K] [CompleteSpace K]
    {r : ℝ} (hr : 0 < r) {f : K⟦X⟧} (hf : f.IsRestricted r) (hf1 : constantCoeff f = 1)
    {d : ℕ} (hd : IsDistinguished r d f) :
    ∃! PU : K[X] × K⟦X⟧,
      PU.1.degree = d ∧ PU.1.coeff 0 = 1 ∧ constantCoeff PU.2 = 1 ∧ PU.2.IsRestricted r ∧
        (PU.2 - 1).gaussNorm norm r < 1 ∧ f = (PU.1 : K⟦X⟧) * PU.2 := by
  sorry

/-- §4.2. Let `K` be a complete normed field whose norm is `‖x‖ = b ^ (-v x)` for a real additive
valuation `v` and a base `b > 1`. A polynomial `f` over `K` with nonzero constant coefficient is
`f(0)` times a product of polynomials `P m`, one for each distinct finite slope `m` of its Newton
polygon, where `P m` has constant coefficient one, degree the multiplicity of `m` and every finite
slope equal to `m`; the family `P` is unique (Kedlaya Theorem 7; Lazard Proposition 2). -/
theorem existsUnique_slopeFactors {K : Type*} [NormedField K] [CompleteSpace K]
    (v : AddValuation K (WithTop ℝ)) {b : ℝ} (hb : 1 < b)
    (hv : ∀ x : K, x ≠ 0 → ‖x‖ = b ^ (-(v x).untop₀)) {f : K[X]} (hf : f.coeff 0 ≠ 0) :
    ∃! P : (f.newtonSlopes v).toFinset → K[X],
      (∀ m, (P m).coeff 0 = 1 ∧ (P m).natDegree = (f.newtonSlopes v).count (m : ℝ) ∧
        ∀ t ∈ (P m).newtonSlopes v, t = (m : ℝ)) ∧
      f = Polynomial.C (f.coeff 0) * ∏ m, P m := by
  sorry

/-- §4.3. Let `K` be an ultrametric normed field, `L` a normed field extension whose norm extends
that of `K`, `r > 0`, and `P` a monic polynomial over `K` whose degree is the last, and `l` the
first, index attaining its Gauss norm at `r`. If `P` splits over `L`, then `l` of its roots in `L`
have norm less than `r`, all of them have norm at most `r`, and `deg P - l` have norm `r`, counted
with multiplicity. -/
theorem discPolynomial_root_counts {K : Type*} [NormedField K] [IsUltrametricDist K]
    {L : Type*} [NormedField L] [IsUltrametricDist L] [Algebra K L]
    (hiso : ∀ a : K, ‖algebraMap K L a‖ = ‖a‖)
    {r : ℝ} (hr : 0 < r) (P : K[X]) (hP : P.Monic)
    {l : ℕ} (hl : IsLowestDominant r l (P : K⟦X⟧)) (hu : IsDistinguished r P.natDegree (P : K⟦X⟧))
    (hsplit : (P.map (algebraMap K L)).Splits) :
    ((P.map (algebraMap K L)).roots.filter fun x ↦ ‖x‖ < r).card = l ∧
      ((P.map (algebraMap K L)).roots.filter fun x ↦ ‖x‖ ≤ r).card = P.natDegree ∧
      ((P.map (algebraMap K L)).roots.filter fun x ↦ ‖x‖ = r).card = P.natDegree - l := by
  sorry

/-- §4.3. Let `K` be an ultrametric normed field, `L` a complete ultrametric normed field extension
whose norm extends that of `K`, and `r > 0`. Let `f = e * P`, where `e` is a unit of the ring of
series over `K` restricted at `r` and `P` is monic of degree `u`, and let `l` and `u` be the first
and the last index attaining the Gauss norm of `f` at `r`. If `P` splits over `L`, there is a
multiset `Z` of points of `L` of norm at most `r` such that `f` has a zero of multiplicity exactly
`Z.count x` (measured by Hasse derivatives) at every `x ∈ L` of norm at most `r`; `Z` has `u`
elements, `l` of them of norm less than `r` (Lazard Propositions 2 and 4 with (2.7′); BGR §5.2). -/
theorem exists_zeros_card_eq {K : Type*} [NormedField K] [IsUltrametricDist K]
    {L : Type*} [NormedField L] [IsUltrametricDist L] [CompleteSpace L] [Algebra K L]
    [DecidableEq L] (hiso : ∀ a : K, ‖algebraMap K L a‖ = ‖a‖)
    {r : ℝ} (hr : 0 < r) {f : K⟦X⟧} {l u : ℕ}
    (hl : IsLowestDominant r l f) (hu : IsDistinguished r u f)
    {e : PowerSeries.IsRestricted.subring (R := K) r} {P : K[X]} (he : IsUnit e)
    (hP : P.IsMonicOfDegree u) (hfac : (e : K⟦X⟧) * (P : K⟦X⟧) = f)
    (hsplit : (P.map (algebraMap K L)).Splits) :
    ∃ Z : Multiset L, (∀ x ∈ Z, ‖x‖ ≤ r) ∧
      (∀ x : L, ‖x‖ ≤ r → (PowerSeries.map (algebraMap K L) f).IsGoodZero x (Z.count x)) ∧
      Z.card = u ∧ (Z.filter fun x ↦ ‖x‖ < r).card = l := by
  sorry

/-! ## Layer 5: Convergence and entire products -/

/-- §5.3. Let `K` be a complete algebraically closed ultrametric normed field and `f` an entire
series over `K` with constant coefficient one. For every `ρ` the zeros of `f` of norm at most `ρ`,
counted with multiplicity, form a finite multiset `Z ρ`, and for every `s > 0` the Gauss norm at
`s` of `f - ∏_{α ∈ Z ρ} (1 - X / α)` tends to zero as `ρ → ∞`: `f` is the product of the factors
`1 - X / α` over its zeros (Lazard (4.13)). -/
theorem exists_zeros_tendsto_gaussNorm_sub_prod {K : Type*} [NormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [IsAlgClosed K] [DecidableEq K] {f : K⟦X⟧} (hf : f.IsEntire)
    (h0 : constantCoeff f = 1) :
    ∃ Z : ℝ → Multiset K, (∀ ρ, ∀ x ∈ Z ρ, ‖x‖ ≤ ρ) ∧
      (∀ ρ (x : K), ‖x‖ ≤ ρ → f.IsGoodZero x ((Z ρ).count x)) ∧
      ∀ s : ℝ, 0 < s →
        Tendsto (fun ρ ↦ (f - ((Z ρ).map fun α ↦
          (1 - PowerSeries.C α⁻¹ * PowerSeries.X : K⟦X⟧)).prod).gaussNorm norm s) atTop (𝓝 0) := by
  sorry

end TauCetiRoadmap.NewtonPolygons
