import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic

/-!
# GrossZagierAndArithmeticHeights: target signatures

The roadmap is README.md; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline result that is statable against the pinned Mathlib and Tau Ceti APIs: the
unique rational extension of the elliptic canonical height.

The Poincaré and Faltings–Hriljac height comparisons lack arithmetic models, metrized line
bundles and their intersection pairing. The classical and quaternionic Gross–Zagier formulas
lack CM moduli points, their modular parametrizations and the associated Rankin L-functions.
The strict GL₂ realization lacks the Shimura-tower Jacobians, rational Hom⁰ spaces and
their cohomological realizations. The shared marked-point comparison lacks those Jacobians,
the marked CM divisors and their quotient/isogeny maps.
The projected kernel identity lacks arithmetic theta kernels. The anticyclotomic special-value
formulas lack the CM moment measures, normalized arithmetic p-adic L-functions and Abel–Jacobi
maps. The p-adic analytic subgroup theorem (§9.2) lacks the algebraic-group logarithm,
its domain and its Lie-algebra comparison. Eigenlogarithm nonvanishing for algebraic points
of GL(2)-type abelian varieties (§9.13) lacks the endomorphism-eigendifferential and p-adic
logarithm interfaces. These headlines are stated as README targets.

The completion product rule, unit-index conversion, finite representation averages,
terminating polynomials and finite Euler-factor multiplication are README interfaces and Checks.
-/

open scoped TensorProduct

namespace TauCetiRoadmap.GrossZagierAndArithmeticHeights

/-! ## Layer 0: normalization and character conventions -/

/-- The elliptic canonical x-height has a unique rational quadratic extension. The scalar-first
carrier uses the native rational module on the tensor product; tensor commutation gives the
point-first convention of README §0.2. Equivalently, the restriction of the extension along
`P ↦ 1 ⊗ P` is Tau Ceti's `canonicalHeightQuadratic`; ellipticity ensures the pinned canonical
height is quadratic. -/
theorem canonicalHeightRat_exists_unique
    (K : Type*) [Field K] [Height.AdmissibleAbsValues K] [DecidableEq K]
    (W : WeierstrassCurve.Affine K) [W.toAffine.IsElliptic] :
    ∃! q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ,
      ∀ P : W.Point, q ((1 : ℚ) ⊗ₜ[ℤ] P) = P.canonicalHeight := by
  sorry

end TauCetiRoadmap.GrossZagierAndArithmeticHeights
