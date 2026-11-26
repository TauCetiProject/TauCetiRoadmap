import Mathlib

/-!
# Theta functions and units of CM lattices: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti where the pinned
libraries have the objects they are about. One part of one headline is stated below; the rest
cannot be stated at the pins, for the reasons given.

Mathlib has, at the pin, period pairs with their lattices, the Weierstrass function `℘` and the
invariants `g₂`, `g₃` (`PeriodPair`, `PeriodPair.lattice`, `PeriodPair.weierstrassP`,
`PeriodPair.g₂`, `PeriodPair.g₃`), the field `ℂ_[p]`, power series with substitution, Dirichlet
L-functions and the finite adeles of a number field. Neither Mathlib nor Tau Ceti has, at the pin,
the sigma function of a lattice (in either normalisation), the spaces of theta functions of a
lattice for a hermitian form and a multiplier, or their twisted translations. So the functions
`σ` and `θ` of a CM lattice (README 1.2, 1.3), its sections, the monomials and the torsion values
(1.5, 3.1) are not available.

* Units (2.2, 3.1), headline (1). The part on the discriminant, 2.2 (d), needs only `℘`, `g₂` and
  a ring homomorphism `ℂ → ℂ_[p]`: it is stated below as `norm_discriminant_eq_one_of_cm`, with
  the conditions of a CM lattice (1.3) written out as hypotheses. The part on the torsion values
  `σ[u]`, `θ[u]`, 3.1 (c), needs `σ` and `θ`.
* The integrality principle (3.3), headline (2): it is about the sections of a CM lattice, the
  monomials `θ^a σ^(2b) G^c` and their torsion values.
* The formal parameter (4.3), headline (3): the Taylor series of the coordinate `y` could be built
  from `℘`, but the statement also needs the numbers `π_p`, `q_p`, `ρ_p` of 4.1, the part of a
  series in the degrees `≡ 1 (mod q_p − 1)` and congruences of series modulo `π_p`, none of which
  the pinned libraries define; this file defines nothing, so the statement stays in the README.
* Complex multiplication and Chowla–Selberg (5.3, 5.5), headline (4): 5.3 is about the Taylor
  series of the translates of `θ`. 5.5 does not mention `θ`, but it needs the conjugate CM lattice
  `C^σ` of 5.2 (c), that is the conditions of a CM lattice once more for a second lattice, and the
  quadratic character `χ_K` as a Dirichlet character with the value `(L′/L)(1, χ_K)`; that is not
  a signature of a few lines on the pinned carriers, and it stays in the README.
-/

namespace TauCetiRoadmap.ShortGRH.ThetaFunctionsAndUnitsOfCMLattices

open Complex

/-- README 2.2 (d), the part of headline (1) on the discriminant. Let `d` be a prime with
`d ≡ 7 (mod 8)` and `ω = (1 + i√d)/2`. Let `L` be a period pair whose lattice is stable under
multiplication by `ω`, let `t` be a point of order two with `ωt` and `ω̄t` outside the lattice,
scaled so that `g₂ = 12℘(t)² − 4` (that is, `℘″(t) = 2`), and let `a₁² = 12℘(t)`. Then for every
prime `p` and every ring homomorphism `ι : ℂ → ℂ_p`, the discriminant `a₁⁴ − 64` is a unit and
`a₁` is integral at `ι`. -/
theorem norm_discriminant_eq_one_of_cm {d : ℕ} (hd : d.Prime) (hd8 : d % 8 = 7) (L : PeriodPair)
    (t a₁ : ℂ) (hmul : ∀ l ∈ L.lattice, (1 + I * (Real.sqrt d : ℂ)) / 2 * l ∈ L.lattice)
    (ht : t ∉ L.lattice) (h2t : 2 * t ∈ L.lattice)
    (hωt : (1 + I * (Real.sqrt d : ℂ)) / 2 * t ∉ L.lattice)
    (hω't : (1 - I * (Real.sqrt d : ℂ)) / 2 * t ∉ L.lattice)
    (hg₂ : L.g₂ = 12 * L.weierstrassP t ^ 2 - 4) (ha₁ : a₁ ^ 2 = 12 * L.weierstrassP t)
    (p : ℕ) [Fact p.Prime] (ι : ℂ →+* ℂ_[p]) :
    ‖ι (a₁ ^ 4 - 64)‖ = 1 ∧ ‖ι a₁‖ ≤ 1 := by
  sorry

end TauCetiRoadmap.ShortGRH.ThetaFunctionsAndUnitsOfCMLattices
