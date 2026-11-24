import Mathlib

/-!
# Quaternionic modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. No headline theorem is statable at the pins,
so this file declares nothing. Each headline and the carrier it lacks:

* Compactness of the controlling operator `U_π` on overconvergent forms of a totally definite
  quaternion algebra (§3.3), and the partial theta–Hecke relations (§5.2). Missing: the analytic
  weight action `f ↦ j_κ(γ) · f((a z + b)/(c z + d))` of the local monoid `Σ₀(t)` on the Tate
  algebra as a right action, and the Banach spaces of forms with the operators `U_v` on them. Tau
  Ceti has the Tate algebras `PowerSeries.IsRestricted.subring 1` and
  `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` as complete normed rings and, over a complete
  ultrametric normed commutative ring, the bounded operator `f ↦ g · f(h)` for restricted series
  `h_i` of Gauss norm at most the radius (`TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`); the
  slash operator of one `γ` is its case `g = j_κ(γ)`, `h = (a z + b)/(c z + d)`. The right-action
  law is the cocycle relation of the automorphy factors (§§1.1–1.2), and the norm on the forms and
  the boundedness of `U_v` are theorems of §§2.1 and 3.1: targets of the roadmap, which a
  definition here would have to prove or leave as `sorry`.
* The Fredholm series `det(1 − T U_π)`, its finite-slope summands and slope bounds (§§4.1–4.2),
  the integral annular Fredholm series with its comparison (§4.4), and the partial determinant
  identity `H_κ(T) = H_{W_τ}(T) · H_{κ'_τ}(τ(π_v)^(r_τ) T)` with its case
  `H_κ(T) = det(1 − T U_p | M_cl) · H_κ'(p^(k+1) T)` over `ℚ` (§5.3). Missing: the Hecke
  operators `U_π` and `U_p` on the analytic form spaces, which need the weight action of the first
  item, and the annular ring `H` of PadicFunctionalAnalysis §5.6. Tau Ceti has the Fredholm series
  `det(1 − T u)` of an endomorphism `u` of a module with property (Pr)
  (`ContinuousLinearMap.charPowerSeries`, `TauCeti.HasPr`); the operators it would be applied to
  are what is missing.
* Small-slope classicality (§5.3): for a totally definite quaternion algebra over a totally real
  field, a simultaneous generalised eigenvector of the `U_v` with nonzero eigenvalues of valuation
  below `min_τ r_τ / e_v` is classical; over `ℚ` the cutoff is `k + 1`. Missing: the analytic
  weight action and the `U_v` on forms, as in the first item.
* The definite automorphic realisation (§2.5), the finite dimensionality and decomposition of
  automorphic forms on `Dˣ` of given type, level and central character (§2.4), and the Bianchi
  comparisons with Williams's forms and with cuspidal cohomology (§2.6). Missing: automorphic
  forms and cusp forms on adelic groups, `(𝔤, K_∞)`-modules of real reductive groups, local
  systems on locally symmetric spaces and cuspidal cohomology.
-/

namespace TauCetiRoadmap.QuaternionicModularForms

end TauCetiRoadmap.QuaternionicModularForms
