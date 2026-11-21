import Mathlib

/-!
# Arithmetic volumes and integral forms on unitary Shimura varieties: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. One of the four
headlines, the class-mean form of the Chowla–Selberg formula (8.5 (a)), is statable and is stated
below; the other three are not statable at the pins.

Those three are statements about unitary Shimura varieties of PEL type over number fields: the
moduli schemes of principally polarised abelian schemes with an action of the ring of integers of
a CM field and a level structure, their normal projective models over rings of integers, their
automorphic vector bundles and flag bundles with Hodge metrics, and the lattices of integral cusp
forms on them with their Petersson metrics, read as Hermitian vector bundles over the ring of
integers of a number field (the setting of 8.11–8.19 in the README, from ShimuraCompactifications,
PELModuli and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties). Neither Mathlib nor Tau Ceti has
these carriers at the pins. Mathlib and Tau Ceti have modular forms for congruence subgroups of
`SL(2, ℤ)` with their Petersson products, and Mathlib has `ZLattice` with its covolume; neither
gives abelian schemes, moduli schemes of PEL type, their integral models, metrised line bundles on
arithmetic varieties with their arithmetic degrees, or slopes of Hermitian vector bundles.

* The flat line (8.11): on a geometrically connected component of the unitary Shimura variety of
  signature `(p, q)` at a level that is good at every prime, the line
  `det Lie_τ ⊗ (det Lie_{cτ})^{−1}` with the Hodge metric and the integral structure of the
  eigen-submodules has a section without zeros or poles, of constant norm and constant valuations,
  and its arithmetic degree is `((p − q)/2)·log Ω`. It lacks the moduli scheme and its integral
  model, the Lie algebra of the universal semi-abelian scheme with its eigen-decomposition, the
  Hodge metric and the arithmetic degree of a metrised line bundle.
* The average arithmetic volume theorem (8.17): under a transitive symmetry of the CM type,
  `p, q ≥ 1`, `N ≥ 3` and `3·min(p, q) + 1 ≤ N`, the mean over the components of the volume slopes of
  the forms of a dominant weight `u` with strictly decreasing entries and gap `g` in the smaller
  block is at least `−C·[(log B(u, g) + log rd_E + |(L′/L)(1, χ_K)|)·|u|₁ + q·spread(u)]`. It lacks,
  besides these, the flag bundles of the automorphic vector bundles, log-log singular metrics,
  mixed integral structures and arithmetic volumes.
* The slope of the step lattices (8.19 (b)): for the unitary groups of a chain of theta lifts,
  under the size conditions of the chain, the lattice of integral cusp forms of the weight of the
  model lift of step `j`, cut out by its type, has slope at least
  `−(p_j − q_j)·Σ_τ w_j(τ)·log Ω − C·B₀·log log x`. It lacks, besides these, the lattices of
  integral cusp forms with their Petersson metrics, Hermitian vector bundles over rings of integers
  with their slopes, and the data of the chain (ThetaChainsOnDefiniteUnitaryGroups).

The elementary statements of the layer (the antisymmetric polynomials of 8.14c, the lengths of a
quotient through functionals of 8.19a‴) are statable in Mathlib; they are steps of the routes,
not headlines, and they are not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties

open NumberField
open scoped nonZeroDivisors

/-- The logarithmic period of the lattice `ℤ + ℤτ`, `τ` in the upper half-plane:
`log(4π·Im τ·|η(τ)|⁴)`, which equals `log(area(ℂ/Λ)/π) + (1/6)·log|Δ(Λ)|` for `Λ = ℤ + ℤτ` and
depends only on the homothety class of the lattice (README 8.5). -/
noncomputable def logPeriod (τ : UpperHalfPlane) : ℝ :=
  Real.log (4 * Real.pi * τ.im * ‖ModularForm.eta (τ : ℂ)‖ ^ 4)

/-- **Chowla–Selberg, class-mean form** (README 8.5 (a)). Let `K` be an imaginary quadratic field
of discriminant `−D`, `σ` a complex embedding of `K`, and `χ` the quadratic character of `K`, a
Dirichlet character modulo `D` characterised by `ζ_K(s) = ζ(s)·L(s, χ)` for `Re s > 1`. For every
choice of points `τ_C` of the upper half-plane such that the image under `σ` of some fractional
ideal of the class `C` is homothetic to `ℤ + ℤτ_C`, the mean over the ideal classes of the
logarithmic periods is `γ + log(2π/√D) − (L′/L)(1, χ)`. -/
theorem chowlaSelberg_classMean (K : Type*) [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2) (σ : K →+* ℂ)
    (D : ℕ) [NeZero D] (hD : discr K = -(D : ℤ)) (χ : DirichletCharacter ℂ D)
    (hχ : ∀ s : ℂ, 1 < s.re → dedekindZeta K s = riemannZeta s * χ.LFunction s)
    (τ : ClassGroup (𝓞 K) → UpperHalfPlane)
    (hτ : ∀ C, ∃ I : (FractionalIdeal (𝓞 K)⁰ K)ˣ, ClassGroup.mk K I = C ∧
      ∃ c : ℂ, c ≠ 0 ∧ σ '' ((I : FractionalIdeal (𝓞 K)⁰ K) : Set K) =
        (c * ·) '' (Submodule.span ℤ {(1 : ℂ), (τ C : ℂ)} : Set ℂ)) :
    (((∑ C, logPeriod (τ C)) / classNumber K : ℝ) : ℂ) =
      ((Real.eulerMascheroniConstant + Real.log (2 * Real.pi / Real.sqrt D) : ℝ) : ℂ) -
        deriv χ.LFunction 1 / χ.LFunction 1 := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties
