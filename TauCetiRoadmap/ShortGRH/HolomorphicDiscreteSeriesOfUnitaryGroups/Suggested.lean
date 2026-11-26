import Mathlib

/-!
# Holomorphic discrete series of unitary groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the overview of the
README singles out, where that can be done on the libraries' own carriers, and says for the others
why it cannot.

* The vanishing of constant terms for a minimal idempotent kernel (6.2 (a)), the input from which
  the cuspidality of forms of type `e_λ` is drawn in AdelicUnitaryGroupsAndAlgebraicModularForms
  §§5.2–5.4. It needs only a second countable locally compact group with a Haar measure, bounded
  continuous functions and a subgroup of `G × ℂˣ`, all in Mathlib; the idempotent kernel of
  README 2.8 is written out as hypotheses. It is stated below:
  `integral_mul_translate_eq_zero_of_idempotent_kernel`.
* The idempotence of `e_λ` and the rigidity of the coefficient (6.1 (a), (e)).
* The properties of Flensted-Jensen's function `c_λ`, its decay and Schur orthogonality, and the
  model of the module it generates in `L²` (5.3, 5.4 (a), (d), (e), 5.5).
* The formal degree and the stable sum of elliptic orbital integrals (7.4 (a), (b)).
* The local theta correspondence for oscillator pairs (8.6).
* The measures that the second moment of Poincaré series uses: the compact-dual Haar measure
  (1.2), the polar formula for the Gram map (1.3), the big cell (2.4) and the fibre measure on
  frames (2.7).

None of the headlines after the first is statable at the pins without definitions that this file
does not make. Mathlib has, at the pin, the unitary group `Matrix.unitaryGroup` of the standard
form and Haar measures on locally compact groups. Neither pinned library has the unitary group
`U(J)` of an indefinite hermitian involution (Tau Ceti's `Matrix.unitaryGroupOf` is on its main
branch, later than the pin), nor the compact-dual measure `μ^c_J` of README 1.1 (c), a measure
defined through the Cayley chart with an explicit density; 1.2, 1.3, 2.7, 5.x, 6.1 and 7.4 are
statements about these. 5.x, 6.1 and 7.4 need moreover the function `c_λ` of README 4.1 (d), an
integral over `U(p) × U(q)` of quotients of products of principal minors, with `deg_λ` and `e_λ`;
6.1 and 8.6 need unitary representations of polynomial growth with their derivatives as
`𝔤𝔩_n`-modules (README 4.2). 8.6 needs in addition the bosonic Fock model of
WeilRepresentationsOnBanachSpacesOfData §§1.1, 2.1 and the oscillator pairs of README 8.1 (e):
the pinned Tau Ceti has a fermionic Fock space of `gl n` (a Clifford algebra), not the Fock model
of the oscillator representation of `U(p, q)`. 2.4 is a statement about matrices over a ring with
involution, but it needs the split form `J_T`, the unipotent group `𝖴`, the floor group `H_ϱ` and
the Weyl elements of README 2.1, which take more than a few lines to write out as hypotheses.
-/

namespace TauCetiRoadmap.ShortGRH.HolomorphicDiscreteSeriesOfUnitaryGroups

open MeasureTheory

/-- **Minimal idempotent kernels kill bounded radical-invariant functions** (README 6.2 (a)).
The hypotheses are those of README 6.2 (a), on a second countable locally compact group with a
left Haar measure `μ`. The idempotent kernel of README 2.8 is written out as `he_cont`, `he_int`,
`he_inv`, `he_one` and `he_idem`. The height `H` and the bound `ℓ` for its variation under right
translation are constrained by `hH`, `hHℓ` and `hℓ`; `hD_shift` and `hD_near` are the two
conditions on the subgroup `D` of `G × ℂˣ`. In the conclusion, `f` is bounded, continuous and
unchanged by left translation by each `r` with `(r, 1) ∈ D`, and the integral of `e` against each
left translate of `f` vanishes. -/
theorem integral_mul_translate_eq_zero_of_idempotent_kernel
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [SecondCountableTopology G] [LocallyCompactSpace G] [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [μ.IsHaarMeasure]
    (e : G → ℂ) (he_cont : Continuous e) (he_int : Integrable e μ)
    (he_inv : ∀ g : G, e g⁻¹ = starRingEnd ℂ (e g)) (he_one : e 1 ≠ 0)
    (he_idem : ∀ x y : G, ∫ z, e z * e ((z * x)⁻¹ * y) ∂μ = e x⁻¹ / e 1 * e y)
    (H ℓ : G → ℝ) (hH : Continuous H) (hHℓ : ∀ x g : G, |H (x * g) - H x| ≤ ℓ g)
    (hℓ : Integrable (fun g ↦ ‖e g‖ * ℓ g) μ)
    (D : Subgroup (G × ℂˣ))
    (hD_shift : ∀ p ∈ D, ∀ g : G, H (p.1 * g) = H g - Real.log ‖(p.2 : ℂ)‖)
    (hD_near : ∀ W ∈ nhds (1 : G), ∃ c : ℂˣ,
      Real.log ‖(c : ℂ)‖ ≠ 0 ∧ ∀ x : G, ∃ b ∈ W, (x * b * x⁻¹, c) ∈ D)
    (f : BoundedContinuousFunction G ℂ)
    (hf : ∀ r : G, (r, (1 : ℂˣ)) ∈ D → ∀ g : G, f (r * g) = f g) (x : G) :
    ∫ g, e g * f (x * g) ∂μ = 0 := by
  sorry

end TauCetiRoadmap.ShortGRH.HolomorphicDiscreteSeriesOfUnitaryGroups
