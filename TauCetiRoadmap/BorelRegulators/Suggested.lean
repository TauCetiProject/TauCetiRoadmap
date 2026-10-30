import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.CentralSimple.Index

/-!
# Archimedean regulators, primitive periods and arithmetic volumes: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The following headlines are not statable at the pins:
* Layer 2: the specified Chern-normalized Borel regulator, its real isomorphism,
  torsion kernel and restriction/transfer laws require actual higher Quillen
  K-groups, the continuous Borel class and the arithmetic comparison maps.
* Layer 3: the rational zeta-product volume of arithmetic norm-one quotients
  requires the algebraic norm-one group, adelic gauge and quotient carriers.
* Layer 4: the compact and arithmetic primitive-period determinants and common
  compact-fibre comparison require the compact dual, arithmetic cohomology
  algebras and invariant-form comparison maps.
* Layer 5: the primitive-period determinant in positive rank requires its actual
  cohomological comparison; the homotopy-to-Tate lattice conversion
  requires stable SU/SO, its integral homotopy lattice and the suspended
  character; the integral regulator lattice, zeta covolume and S-integer/order
  transport require actual higher K-groups and the specified regulator.
* Layer 6: calibration of the supplied universal Deligne Chern regulator, its
  conjugation/transfer and Coleman same-map interfaces, and the infinitesimal
  classifying comparison require the logarithmic Deligne and classifying-space
  carriers supplied by MotivicEtaleKTheory; the geometric point identification
  and Borel equals negative twice the shared Beilinson map require those constructions;
  the rational Adams-weight theorem requires higher K-groups and their Adams
  operations.

The analytic leading-term theorem is stated for every analytic continuation
agreeing with the native Dedekind series on Re(s)>1. The period-index equality
and existence of division algebras split at infinity are stated on native algebra
carriers. The rank-zero primitive-period theorem is
stated on Mathlib's Dedekind zeta function. No replacement regulator is introduced.
-/

namespace TauCetiRoadmap.BorelRegulators

universe u

/-! ## Layer 1: Tate coordinates, trace and leading coefficients -/

/-- Every continuation of the native Dedekind series analytic off `1` has
exact higher-weight zero order, a nonzero real leading coefficient, and the
functional-equation proportionality of README §1.3. The coefficient is the
punctured limit; no assertion depends on the representative's value at `1`.
See Borel 1977, §1.4 and §6.4. -/
theorem dedekindZeta_continuation_leadingTerm
    (F : Type u) [Field F] [NumberField F]
    (Z : ℂ → ℂ)
    (hZ : ∀ z : ℂ, z ≠ 1 → AnalyticAt ℂ Z z)
    (hseries : ∀ z : ℂ, 1 < z.re → Z z = NumberField.dedekindZeta F z)
    (n : ℕ) (hn : 2 ≤ n) :
    let d := if n % 2 = 0 then NumberField.InfinitePlace.nrComplexPlaces F
      else NumberField.InfinitePlace.nrRealPlaces F +
        NumberField.InfinitePlace.nrComplexPlaces F
    let z₀ : ℂ := 1 - (n : ℂ)
    let c : ℂ := iteratedDeriv d Z z₀ / (Nat.factorial d : ℂ)
    analyticOrderAt Z z₀ = (d : ℕ∞) ∧ c.im = 0 ∧ c ≠ 0 ∧
      Filter.Tendsto (fun z : ℂ => Z z / (z - z₀) ^ d)
        (nhdsWithin z₀ ({z₀}ᶜ)) (nhds c) ∧
      ∃ q : ℚ, q ≠ 0 ∧
        c = (q : ℂ) * (Real.sqrt |(NumberField.discr F : ℝ)| : ℂ) *
          (Real.pi : ℂ) ^
            ((d : ℤ) - (Module.finrank ℚ F : ℤ) * (n : ℤ)) *
          NumberField.dedekindZeta F (n : ℂ) := by
  sorry

/-! ## Layer 3: Division algebras, rational gauges and arithmetic volume -/

/-- Over every number field, the order of the Brauer class of a finite-dimensional
central simple algebra equals its index, including the split class of period one.
See Poonen, Theorem 1.5.36(iv). -/
theorem period_eq_index (F : Type u) [Field F] [NumberField F]
    (A : CSA.{u, u} F) :
    orderOf (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index F A := by
  sorry

/-- Every positive degree occurs for a central division algebra over a number
field that splits at every real embedding. Splitting means a full matrix
algebra after the scalar extension determined by that embedding. Splitting at
a complex embedding holds for every finite-dimensional central simple algebra
(`TauCeti.Algebra.isSplittingField_of_isSepClosed`), so it is not stated.
See Borel 1977, Lemma 2.2. -/
theorem exists_divisionAlgebra_split_at_infinity
    (F : Type u) [Field F] [NumberField F] (a : ℕ) (ha : 1 ≤ a) :
    ∃ (D : Type u) (_ : DivisionRing D) (_ : Algebra F D)
      (_ : Algebra.IsCentral F D) (_ : FiniteDimensional F D),
      Module.finrank F D = a ^ 2 ∧
      (∀ σ : F →+* ℝ, letI : Algebra F ℝ := σ.toAlgebra
        TauCeti.Algebra.IsSplittingField F D ℝ) := by
  sorry

/-! ## Layer 5: Primitive determinant and the integral regulator lattice -/

/-- Over a totally real number field and for even `n ≥ 2`, the positive number
`√|disc F| · ζ_F(n) / π^(n·[F:ℚ])` is rational. This is the rank-zero
primitive-period theorem: the comparison sends the empty generator to `1`.
See Borel 1977, Theorem 6.2 and Remark 6.3, p.632, with the 1980
erratum, p.373, for the intermediate rational forms. -/
theorem exists_pos_rat_dedekindZeta_of_isTotallyReal
    (F : Type u) [Field F] [NumberField F] [NumberField.IsTotallyReal F]
    (n : ℕ) (hn : 2 ≤ n) (hev : Even n) :
    ∃ q : ℚ, 0 < q ∧
      (Real.sqrt |(NumberField.discr F : ℝ)| : ℂ) * NumberField.dedekindZeta F n =
        (q : ℂ) * (Real.pi : ℂ) ^ (n * Module.finrank ℚ F) := by
  sorry

end TauCetiRoadmap.BorelRegulators
