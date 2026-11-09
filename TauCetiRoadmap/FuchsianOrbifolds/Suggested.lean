import Mathlib
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
import TauCeti.Analysis.Complex.Fuchsian.Covolume
import TauCeti.Analysis.Complex.Fuchsian.Elliptic.Finite
import TauCeti.Analysis.Complex.RiemannSurface.Degree
import TauCeti.Analysis.Complex.RiemannSurface.Ramification
import TauCeti.Analysis.Complex.UpperHalfPlane.PoincareMetric
import TauCeti.GroupTheory.GroupAction.Stabilizer.Basic

/-!
# Fuchsian groups and orbifold Riemann surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`. This file
states the roadmap's headline theorems that the pinned Tau Ceti does not already prove, each with
`sorry`, against the pinned Mathlib and Tau Ceti, together with the one definition they need,
`genus`, and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and
`RiemannSurface.riemannHurwitz`.

Headlines already proved at the Tau Ceti pin, and therefore not restated: the effective action of
`PSL(2, ℝ)` on `ℍ` (`UpperHalfPlane.instMulActionPSL2`) and proper discontinuity of discrete
subgroups; the Riemann-surface structure of the coarse quotient
(`Subgroup.instIsManifoldOrbitRelQuotient`); Poincaré's polygon theorem and its converse
(`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic`,
`Subgroup.IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`); hyperbolic triangle groups
(`TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`); compactness and the
analytic atlas of the cusp compactification (`Subgroup.IsCofinite.compactSpace_compactifiedQuotient`,
`Subgroup.CompactifiedQuotient.instIsManifold`); the branched-cover Euler-characteristic formula
(`TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`);
and the biholomorphism `X(1) ≃ P¹` given by `j` (`TauCeti.ModularGroup.jBiholomorph`).

Stated here: the comparison of the Riemannian distance of the Poincaré metric with Mathlib's
distance on `ℍ`, `χ = 2 − 2g` for compact connected Riemann surfaces, Riemann–Hurwitz in genus
form, the orbifold area formula of a cofinite group in terms of the genus of its compactified
quotient, and the minimal areas `π / 21` and `π / 3` with their equality cases. Second
countability of `PSL(2, ℝ)`, the isometric `GL(2, ℝ)` action and the half-space comparison of
the README's Layer 0 items 1–2 and Layer 2 item 1 are targets there, derived from the pinned APIs
and the distance comparison, not headlines. The Fuchsian Riemann–Hurwitz formula of Layer 5
item 6 is `riemannHurwitz` applied to Tau Ceti's
`TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`, and is not restated. Every headline
of the roadmap is statable at the pins; none is omitted for want of a carrier.
-/

universe u

namespace TauCetiRoadmap.FuchsianOrbifolds

open MeasureTheory MulAction TauCeti
open scoped MatrixGroups UpperHalfPlane Manifold Real

/-! ## Layer 2: hyperbolic polygons and cofinite groups -/

/-- **The distance comparison.** Mathlib's hyperbolic distance on `ℍ` is the Riemannian distance
of Tau Ceti's Poincaré metric `TauCeti.UpperHalfPlane.poincareRiemannianMetric`, the Euclidean
tensor divided by `(Im z)²`: for all `z w : ℍ`, `edist z w` is the infimum of the Poincaré lengths
of the `C¹` paths from `z` to `w`. The vertical segment realises it on a vertical pair, and the
`PSL(2, ℝ)` action, which preserves both distances, moves every pair to a vertical one (Katok,
§1.2). -/
theorem isRiemannianManifold_upperHalfPlane : IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ := by
  sorry

/-! ## Layer 5: genus, Riemann–Hurwitz and the orbifold area formula -/

/-- The **topological genus** of a space of finite CW type, read off its Euler characteristic
through `χ = 2 − 2g`, that is `g = (2 − χ) / 2` truncated at `0`. For a compact connected Riemann
surface `2 − χ` is a nonnegative even integer (`eulerChar_eq_two_sub_two_mul_genus`), so this is
its genus: the sphere has `χ = 2` and genus `0`, the torus `χ = 0` and genus `1`. On spaces that
are not closed orientable surfaces the value carries no meaning. -/
noncomputable def genus (X : Type*) [TopologicalSpace X] [FiniteCWType X] : ℕ :=
  ((2 - eulerChar X) / 2).toNat

/-- **`χ = 2 − 2g`.** The Euler characteristic of a compact connected Riemann surface is
`2 − 2g` for its genus `g`: the zeroth and second Betti numbers are `1` and the first is even
(Miranda, Chapter II §4). -/
theorem eulerChar_eq_two_sub_two_mul_genus (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) 1 X] [T2Space X] [CompactSpace X] [ConnectedSpace X] [FiniteCWType X] :
    eulerChar X = 2 - 2 * (genus X : ℤ) := by
  sorry

/-- **The Riemann–Hurwitz formula.** For a finite holomorphic map `f : X → Y` of compact connected
Riemann surfaces, `2g(X) − 2 = deg f · (2g(Y) − 2) + R(f)`, where `R(f) = Σₓ (eₓ − 1)` is the
ramification degree (Forster, §17; Miranda, Chapter II §4). `X` and `Y` lie in one universe, as in
Tau Ceti's branched-cover formula
`TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`. -/
theorem riemannHurwitz {X Y : Type u} [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) 1 X] [T2Space X] [CompactSpace X] [ConnectedSpace X] [FiniteCWType X]
    [TopologicalSpace Y] [ChartedSpace ℂ Y] [IsManifold 𝓘(ℂ) 1 Y] [T2Space Y] [CompactSpace Y]
    [ConnectedSpace Y] [FiniteCWType Y] (f : RiemannSurface.FiniteHolomorphicMap X Y) :
    2 * (genus X : ℤ) - 2 =
      (RiemannSurface.degree f : ℤ) * (2 * (genus Y : ℤ) - 2) +
        (RiemannSurface.ramificationDegree f : ℤ) := by
  sorry

/-- **The orbifold area formula.** A cofinite Fuchsian group `Γ` of signature `(g; m₁, …, m_r; c)`
has covolume `2π (2g − 2 + Σᵢ (1 − 1 / mᵢ) + c)`, where `g` is the genus of the compactified
quotient `X(Γ)`, the `mᵢ` are the stabilizer orders of the elliptic orbits and `c` is the number
of cusp orbits (Martin, *The geometry and arithmetic of Kleinian groups*, arXiv:1311.2636,
Theorem 2.2; Beardon, §10.4; Katok, §4.3). -/
theorem covolume_eq_two_pi_mul_signature (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [FiniteCWType Γ.CompactifiedQuotient] :
    covolume Γ ℍ = ENNReal.ofReal (2 * π * (2 * (genus Γ.CompactifiedQuotient : ℝ) - 2 +
      ∑ᶠ e ∈ Γ.ellipticOrbits, (1 - (cardStabilizerOnOrbit e : ℝ)⁻¹) +
        Nat.card Γ.CuspOrbit)) := by
  sorry

/-! ## Layer 4a: minimal areas of cofinite Fuchsian groups -/

/-- **Siegel's lower bound.** Every cofinite Fuchsian group has covolume at least `π / 21`
(Siegel, *Some remarks on discontinuous groups*, Ann. of Math. 46 (1945), pp. 708–718; Martin,
arXiv:1311.2636, Theorem 2.1). -/
theorem pi_div_twentyOne_le_covolume (Γ : Subgroup PSL(2, ℝ)) (hΓ : Γ.IsCofinite) :
    ENNReal.ofReal (π / 21) ≤ covolume Γ ℍ := by
  sorry

/-- **The equality case of Siegel's bound.** A cofinite Fuchsian group has covolume `π / 21`
exactly when its signature is `(0; 2, 3, 7)`: genus zero, no cusp, and one elliptic orbit of each
order `2`, `3` and `7` (Martin, arXiv:1311.2636, Theorem 2.1: the minimum is attained only by
the `(2, 3, 7)` triangle group). -/
theorem covolume_eq_pi_div_twentyOne_iff (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [FiniteCWType Γ.CompactifiedQuotient] :
    covolume Γ ℍ = ENNReal.ofReal (π / 21) ↔
      genus Γ.CompactifiedQuotient = 0 ∧ IsEmpty Γ.CuspOrbit ∧
        ∀ m : ℕ, Nat.card {e // e ∈ Γ.ellipticOrbits ∧ cardStabilizerOnOrbit e = m} =
          Multiset.count m {2, 3, 7} := by
  sorry

/-- **The minimal area with a cusp.** A cofinite Fuchsian group with at least one cusp has
covolume at least `π / 3`. This follows from the area formula (Martin, arXiv:1311.2636,
Theorem 2.2) by the case analysis over signatures with a cusp of the roadmap's Layer 4a item 2. -/
theorem minimum_area_finite_area_orbifold (Γ : Subgroup PSL(2, ℝ)) (hΓ : Γ.IsCofinite)
    [Nonempty Γ.CuspOrbit] :
    ENNReal.ofReal (π / 3) ≤ covolume Γ ℍ := by
  sorry

/-- **The equality case with a cusp.** A cofinite Fuchsian group with at least one cusp has
covolume `π / 3` exactly when its signature is `(0; 2, 3; 1)`, that of `PSL(2, ℤ)`: genus zero,
one cusp, and one elliptic orbit of each order `2` and `3`. The case analysis of the roadmap's
Layer 4a item 2, applied to the area formula, gives it. -/
theorem covolume_eq_pi_div_three_iff (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [Nonempty Γ.CuspOrbit] [FiniteCWType Γ.CompactifiedQuotient] :
    covolume Γ ℍ = ENNReal.ofReal (π / 3) ↔
      genus Γ.CompactifiedQuotient = 0 ∧ Nat.card Γ.CuspOrbit = 1 ∧
        ∀ m : ℕ, Nat.card {e // e ∈ Γ.ellipticOrbits ∧ cardStabilizerOnOrbit e = m} =
          Multiset.count m {2, 3} := by
  sorry

end TauCetiRoadmap.FuchsianOrbifolds

/-! The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`. -/
namespace RiemannSurface

export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)

end RiemannSurface
