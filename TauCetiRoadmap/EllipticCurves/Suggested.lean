import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.BirchSwinnertonDyer.Quotient
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass

/-!
# Elliptic curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

This file states the roadmap's headline theorems that the pinned Tau Ceti does not prove, against
the pinned Mathlib and Tau Ceti APIs: the classical Nagell–Lutz bound of Layer 6, and the two
isogeny invariances of Layer 7, of the `L`-function over a number field and (Cassels) of the
Birch–Swinnerton-Dyer quotient over `ℚ`. Every carrier they
mention exists at the pins, those beyond Mathlib's Weierstrass curves and points being Tau Ceti's
(`WeierstrassCurve.shortCurve`, `TauCeti.Isogeny`, `WeierstrassCurve.sha`,
`WeierstrassCurve.bsdQuotient`), so nothing is defined here. The other
headline theorems of `README.md` (the Hasse bound, the Mordell–Weil theorem, the structure of
`E[N]`, the Weil pairing, the finiteness of Selmer groups, the global-minimal-model criterion,
the quadratic-twist and Tate-curve theorems, the Néron–Ogg–Shafarevich criteria) are proved in the
pinned Tau Ceti; `README.md` §Scope and ownership cites each by name and file, and they are not
restated here. Every headline of the roadmap is statable at the pins.
-/

namespace TauCetiRoadmap.EllipticCurves

/-! ## Layer 6: the Mordell–Weil theorem (AEC VIII) -/

/-- **The Nagell–Lutz theorem, classical form** (AEC VIII.7). Let `A B : ℤ` and let `(x, y)` be
a nonzero rational point of finite order on `y² = x³ + Ax + B`. Then `x` and `y` are integers, and
either `y = 0` or `y² ∣ 4A³ + 27B²`.

Tau Ceti's `WeierstrassCurve.lutz_nagell` proves the same integrality with the divisibility
`y² ∣ Δ`, where `Δ = −16(4A³ + 27B²)` on this model, so that form is weaker by the factor `16`.
The sharper divisibility comes from the same integrality: when `y ≠ 0` the point `2P` is a
nonzero torsion point, so `x(2P) = (x⁴ − 2Ax² − 8Bx + A²)/(4y²)` is an integer and `y²` divides
`x⁴ − 2Ax² − 8Bx + A²`; the identity
`(3x² + 4A)(x⁴ − 2Ax² − 8Bx + A²) − (3x³ − 5Ax − 27B)(x³ + Ax + B) = 4A³ + 27B²`, with
`y² = x³ + Ax + B`, then gives `y² ∣ 4A³ + 27B²`. No hypothesis `Δ ≠ 0` is needed: on a singular
model `4A³ + 27B² = 0` and the divisibility is automatic. -/
theorem sq_dvd_four_mul_cube_add_of_isOfFinAddOrder (A B : ℤ) {x y : ℚ}
    (hns : ((WeierstrassCurve.shortCurve A B).baseChange ℚ).toAffine.Nonsingular x y)
    (htor : IsOfFinAddOrder (WeierstrassCurve.Affine.Point.some _ _ hns)) :
    ∃ x₀ y₀ : ℤ, (x₀ : ℚ) = x ∧ (y₀ : ℚ) = y ∧
      (y₀ = 0 ∨ y₀ ^ 2 ∣ 4 * A ^ 3 + 27 * B ^ 2) :=
  sorry

/-! ## Layer 7: Selmer groups and Sha (AEC X.4) -/

/-- **Isogenous curves have the same `L`-function.** For elliptic curves over a number field `K`
related by an isogeny defined over `K`, Mathlib's `WeierstrassCurve.LFunction`, the formal Euler
product of the local factors of the minimal models at all finite primes, is the same. At each prime
the local factor is read off the reduction type and, at good reduction, the trace of Frobenius, and
an isogeny preserves both: good, split multiplicative, nonsplit multiplicative and additive
reduction correspond, and at good reduction the reductions are isogenous over the residue field.
Tau Ceti's `TauCeti.Isogeny.localPolynomial_eq_of_hasPotentialGoodReduction` covers the primes of
potential good reduction. -/
theorem LFunction_eq_of_isogeny {K : Type*} [Field K] [NumberField K] (E₁ E₂ : WeierstrassCurve K)
    [E₁.IsElliptic] [E₂.IsElliptic] (φ : TauCeti.Isogeny E₁.toAffine E₂.toAffine) :
    E₁.LFunction = E₂.LFunction :=
  sorry

/-- **Cassels' theorem over `ℚ`** (Cassels 1965; for abelian varieties over a global field, the
proof of Milne, *Arithmetic Duality Theorems*, I.7.3): the Birch–Swinnerton-Dyer quotient
`Ω(E) · Reg(E/ℚ) · #Ш(E/ℚ) · ∏_p c_p / #E(ℚ)_tors²` is unchanged by an isogeny defined over `ℚ`.
The period is that of a global minimal equation (`WeierstrassCurve.minimalRealPeriod`), which is
what makes the quotient an invariant of the curve; the period-free part alone is not isogeny
invariant. Finiteness of `Ш` is assumed on both sides because `bsdQuotient` is only defined under
it; Tau Ceti's `TauCeti.Isogeny.Hom.finite_sha_iff` shows that either assumption implies the
other. -/
theorem bsdQuotient_eq_of_isogeny (E₁ E₂ : WeierstrassCurve ℚ) [E₁.IsElliptic] [E₂.IsElliptic]
    [Finite E₁.sha] [Finite E₂.sha] (φ : TauCeti.Isogeny E₁.toAffine E₂.toAffine) :
    E₁.bsdQuotient = E₂.bsdQuotient :=
  sorry

end TauCetiRoadmap.EllipticCurves
