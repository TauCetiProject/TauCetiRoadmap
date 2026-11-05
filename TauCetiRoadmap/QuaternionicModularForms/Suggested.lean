import Mathlib

/-!
# Quaternionic modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. No headline theorem is statable at the pins,
so this file declares nothing. Each headline and the carrier it lacks:

* Compactness of the controlling operator `U_π` on overconvergent forms of a totally definite
  quaternion algebra (§3.3), and the theta–Hecke relation (§5.2). Missing: the analytic weight
  action `f ↦ j_κ(γ) · f((a z + b)/(c z + d))` of the local monoid `Σ₀(t)` on the Tate algebra.
  Tau Ceti has the Tate algebras `PowerSeries.IsRestricted.subring 1` and
  `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` as complete normed rings, but the only
  substitution at the pins is Mathlib's formal `PowerSeries.subst` and `MvPowerSeries.subst`,
  defined under `PowerSeries.HasSubst` and `MvPowerSeries.HasSubst` (a nilpotent constant
  coefficient), so neither a Möbius transformation, whose value at `0` is `b/d`, nor any analytic
  substitution into the Tate algebra, in which the denominator `c z + d` must be inverted, is
  available. The local component map of `(D ⊗[F] 𝔸_{F,f})ˣ` at a split place is also missing.
* The Fredholm series `det(1 − T U_π)`, its finite-slope summands and slope bounds (§§4.1–4.2),
  the integral annular Fredholm series with its comparison (§4.4), and the factorisation
  `H_κ(T) = det(1 − T U_p | M_cl) · H_κ'(p^(k+1) T)` (§5.3). Missing: Fredholm determinants of
  compact operators on nonarchimedean Banach modules with property (Pr) (Mathlib has
  `IsCompactOperator`, and Tau Ceti's Fredholm files treat Fredholm operators and their index, not
  the characteristic series `det(1 − T u)`) and the annular ring `H` of
  PadicFunctionalAnalysis §5.6.
* Small-slope classicality over `ℚ` (§5.3): a generalised `U_p`-eigenvector with nonzero
  eigenvalue of valuation below `k + 1` is classical. Missing: the analytic weight action and
  `U_p` on forms, as in the first item.
* The definite automorphic realisation (§2.5), the finite dimensionality and decomposition of
  automorphic forms on `Dˣ` of given type, level and central character (§2.4), and the Bianchi
  comparisons with Williams's forms and with cuspidal cohomology (§2.6). Missing: automorphic
  forms and cusp forms on adelic groups, `(𝔤, K_∞)`-modules of real reductive groups, local
  systems on locally symmetric spaces and cuspidal cohomology.
-/

namespace TauCetiRoadmap.QuaternionicModularForms

end TauCetiRoadmap.QuaternionicModularForms
