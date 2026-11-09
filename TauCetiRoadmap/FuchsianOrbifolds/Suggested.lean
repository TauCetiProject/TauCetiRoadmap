import Mathlib
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
import TauCeti.Analysis.Complex.Fuchsian.Compactification.Manifold
import TauCeti.Analysis.Complex.Fuchsian.Covolume
import TauCeti.Analysis.Complex.Fuchsian.Elliptic.Finite
import TauCeti.Analysis.Complex.RiemannSurface.Degree
import TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic
import TauCeti.Analysis.Complex.RiemannSurface.Ramification
import TauCeti.GroupTheory.GroupAction.Stabilizer.Basic

/-!
# Fuchsian groups and orbifold Riemann surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`. This file
states the roadmap's headline theorems that the pinned Tau Ceti does not already prove, each with
`sorry`, against the pinned Mathlib and Tau Ceti, together with the one definition they need.

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

Stated here: `χ = 2 − 2g` for compact connected Riemann surfaces, Riemann–Hurwitz in genus form,
the orbifold area formula of a cofinite group in terms of the genus of its compactified quotient,
and the minimal areas `π / 21` and `π / 3` with their equality cases. The Fuchsian Riemann–Hurwitz
formula of Layer 5 item 6 is `riemannHurwitz` applied to Tau Ceti's
`TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`, and is not restated. Every headline
of the roadmap is statable at the pins; none is omitted for want of a carrier.
-/

namespace TauCetiRoadmap.FuchsianOrbifolds

open MeasureTheory MulAction TauCeti
open scoped MatrixGroups UpperHalfPlane Manifold Real

/-! ## Layer 4: compactified quotient Riemann surfaces -/

/-- The compactified quotient `X(Γ) = (Γ \ ℍ) ⊔ {cusp orbits}`: the roadmap's name for Tau Ceti's
carrier `Subgroup.CompactifiedQuotient`, under which the modular-forms roadmap imports it. -/
abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient

/-- The complex atlas of `X(Γ)` for a discrete `Γ`, made of the coarse-quotient charts and the
`q`-coordinate charts at the cusps: Tau Ceti's `Subgroup.CompactifiedQuotient.instChartedSpace`,
under the name the modular-forms roadmap imports. -/
noncomputable abbrev compactifiedChartedSpace (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ] :
    ChartedSpace ℂ (CompactifiedQuotient Γ) :=
  inferInstance

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
ramification degree (Forster, §17; Miranda, Chapter II §4). -/
theorem riemannHurwitz {X Y : Type*} [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) 1 X] [T2Space X] [CompactSpace X] [ConnectedSpace X] [FiniteCWType X]
    [TopologicalSpace Y] [ChartedSpace ℂ Y] [IsManifold 𝓘(ℂ) 1 Y] [T2Space Y] [CompactSpace Y]
    [ConnectedSpace Y] [FiniteCWType Y] (f : RiemannSurface.FiniteHolomorphicMap X Y) :
    2 * (genus X : ℤ) - 2 =
      (RiemannSurface.degree f : ℤ) * (2 * (genus Y : ℤ) - 2) +
        (RiemannSurface.ramificationDegree f : ℤ) := by
  sorry

/-- **The orbifold area formula.** A cofinite Fuchsian group `Γ` of signature `(g; m₁, …, m_r; s)`
has covolume `2π (2g − 2 + Σᵢ (1 − 1 / mᵢ) + s)`, where `g` is the genus of the compactified
quotient `X(Γ)`, the `mᵢ` are the stabilizer orders of the elliptic orbits and `s` is the number
of cusp orbits (Beardon, §10.4; Katok, §4.3). -/
theorem covolume_eq_two_pi_mul_signature (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [FiniteCWType (CompactifiedQuotient Γ)] :
    covolume Γ ℍ = ENNReal.ofReal (2 * π * (2 * (genus (CompactifiedQuotient Γ) : ℝ) - 2 +
      ∑ᶠ e ∈ Γ.ellipticOrbits, (1 - (cardStabilizerOnOrbit e : ℝ)⁻¹) +
        Nat.card Γ.CuspOrbit)) := by
  sorry

/-! ## Layer 4a: minimal areas of cofinite Fuchsian groups -/

/-- **Siegel's lower bound.** Every cofinite Fuchsian group has covolume at least `π / 21`
(Siegel 1945). -/
theorem pi_div_twentyOne_le_covolume (Γ : Subgroup PSL(2, ℝ)) (hΓ : Γ.IsCofinite) :
    ENNReal.ofReal (π / 21) ≤ covolume Γ ℍ := by
  sorry

/-- **The equality case of Siegel's bound.** A cofinite Fuchsian group has covolume `π / 21`
exactly when its signature is `(0; 2, 3, 7)`: genus zero, no cusp, and one elliptic orbit of each
order `2`, `3` and `7`. -/
theorem covolume_eq_pi_div_twentyOne_iff (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [FiniteCWType (CompactifiedQuotient Γ)] :
    covolume Γ ℍ = ENNReal.ofReal (π / 21) ↔
      genus (CompactifiedQuotient Γ) = 0 ∧ IsEmpty Γ.CuspOrbit ∧
        ∀ m : ℕ, Nat.card {e // e ∈ Γ.ellipticOrbits ∧ cardStabilizerOnOrbit e = m} =
          Multiset.count m {2, 3, 7} := by
  sorry

/-- **The minimal area with a cusp.** A cofinite Fuchsian group with at least one cusp has
covolume at least `π / 3`. -/
theorem minimum_area_finite_area_orbifold (Γ : Subgroup PSL(2, ℝ)) (hΓ : Γ.IsCofinite)
    [Nonempty Γ.CuspOrbit] :
    ENNReal.ofReal (π / 3) ≤ covolume Γ ℍ := by
  sorry

/-- **The equality case with a cusp.** A cofinite Fuchsian group with at least one cusp has
covolume `π / 3` exactly when its signature is `(0; 2, 3; 1)`, that of `PSL(2, ℤ)`: genus zero,
one cusp, and one elliptic orbit of each order `2` and `3`. -/
theorem covolume_eq_pi_div_three_iff (Γ : Subgroup PSL(2, ℝ)) [DiscreteTopology Γ]
    (hΓ : Γ.IsCofinite) [Nonempty Γ.CuspOrbit] [FiniteCWType (CompactifiedQuotient Γ)] :
    covolume Γ ℍ = ENNReal.ofReal (π / 3) ↔
      genus (CompactifiedQuotient Γ) = 0 ∧ Nat.card Γ.CuspOrbit = 1 ∧
        ∀ m : ℕ, Nat.card {e // e ∈ Γ.ellipticOrbits ∧ cardStabilizerOnOrbit e = m} =
          Multiset.count m {2, 3} := by
  sorry

end TauCetiRoadmap.FuchsianOrbifolds

/-! The short names `RiemannSurface.*` under which the modular-forms roadmap imports the native
compact-Riemann-surface API and this roadmap's genus and Riemann–Hurwitz theorem. -/
namespace RiemannSurface

export TauCeti.RiemannSurface
  (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback
   biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)

export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)

end RiemannSurface
