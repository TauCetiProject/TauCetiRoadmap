import Mathlib
import TauCeti.Analysis.PDE.Vortex.Deformation
import TauCeti.Analysis.PDE.Vortex.FramedGauge

/-!
# Taubes–Gromov theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with
`sorry`, and the two definitions they need.

The statable headline is Taubes's classification of framed plane vortices (README §4.4): a
smooth framed degree-`m` vortex has a zero divisor of degree `m`, every effective divisor of
degree `m` on `ℂ` is the zero divisor of one, and two with the same divisor differ by a smooth
framed gauge transformation. It is stated on Tau Ceti's plane-vortex carriers: the field
`x = (b₁, b₂, p, q)` of `TauCeti.Vortex.equation`, representing the connection
`a = i (b₁ ds + b₂ dt)` and the section `α = 2 (p + i q)`, with the equations
`∂̄_a α = 0` and `*iF_a = (1 - |α|²) / 8`.

The other headline theorems are not statable at the pins:

* the Fredholm property of the gauge-fixed vortex operator `d₀* ⊕ d₁` at a degree-`m` vortex,
  with zero cokernel and index `2m` (README §4.3): Tau Ceti has this operator only as a
  pointwise differential expression on smooth fields, and as a bounded operator between Sobolev
  spaces only at the vacuum;
* the point-insertion equality `SW⁰_X(s_ω ⊗ E) = Gr_(J,ω)(PD c₁(E))` for `b₂⁺ > 1` (README §9.1),
  the bad-class vanishing (README §6.2) and the equality in the large-parameter chamber of a
  minimal symplectic product `S¹ × Y_φ` (README §9.4): the pins have neither the Seiberg–Witten
  invariant of a closed four-manifold (no `Spinᶜ` structure on a manifold, Dirac operator or
  monopole moduli space) nor Taubes's weighted count `Gr`, which needs the moduli spaces of
  embedded pseudoholomorphic curves;
* the coarse large-parameter bounds, the refined Hermitian curvature bound and the defect
  monotonicity for Seiberg–Witten solutions (README Layer 5): they are statements about
  solutions of the Seiberg–Witten equations on a manifold, which the pins cannot write;
* the coefficientwise identity of the point series of `S¹ × Y_φ` with the orbit zeta function
  (README §11.3): it needs `Gr`.
-/

open Filter MeasureTheory Topology
open scoped ContDiff

namespace TauCetiRoadmap.TaubesGromov

/-- A **framed degree-`m` plane vortex**: a smooth field `x = (b₁, b₂, p, q)` on `ℂ` solving the
plane vortex equations `∂̄_a α = 0` and `*iF_a = (1 - |α|²) / 8` everywhere, with finite energy
`∫ (|F_a|² + |d_a α|² + (1 - |α|²)²) < ∞`, whose section `α` times the inverse winding phase
`(z / |z|)^(-m)` tends to one at infinity (Taubes, *Gr ⇒ SW*; README §4.1). The finite-energy
clause follows from the others, since the section then has modulus tending to one
(`TauCeti.Vortex.integrable_energyDensity`); it is kept to match the definition of README §4.1. -/
def IsFramedVortex (m : ℕ) (x : ℂ → EuclideanSpace ℝ (Fin 4)) : Prop :=
  ContDiff ℝ ∞ x ∧ (∀ z, TauCeti.Vortex.equation x z = 0) ∧
    Integrable (TauCeti.Vortex.energyDensity x) ∧
    Tendsto (fun z ↦ TauCeti.Vortex.sectionValue x z * ((z / (‖z‖ : ℂ)) ^ m)⁻¹)
      (cocompact ℂ) (𝓝 1)

/-- The section `α` of the field `x` has **zero divisor** `D`: at every point `z` it vanishes to
order exactly `D.count z`, that is, near `z` it is `(w - z) ^ D.count z` times a function
continuous at `z` and nonzero there. The order is determined by `α`, so a field has at most one
zero divisor (README §4.4). -/
def HasZeroDivisor (x : ℂ → EuclideanSpace ℝ (Fin 4)) (D : Multiset ℂ) : Prop :=
  ∀ z, ∃ v : ℂ → ℂ, ContinuousAt v z ∧ v z ≠ 0 ∧
    ∀ᶠ w in 𝓝 z, TauCeti.Vortex.sectionValue x w = (w - z) ^ D.count z * v w

/-- **The zero divisor of a framed vortex has degree `m`.** The section of a framed degree-`m`
plane vortex has finitely many zeros, of total multiplicity `m` (Taubes, *SW ⇒ Gr*,
Proposition 4.1(3)(i)–(ii); README §4.2 and §4.4). -/
theorem exists_hasZeroDivisor_of_isFramedVortex {m : ℕ} {x : ℂ → EuclideanSpace ℝ (Fin 4)}
    (hx : IsFramedVortex m x) :
    ∃ D : Multiset ℂ, Multiset.card D = m ∧ HasZeroDivisor x D := by
  sorry

/-- **Existence of plane vortices with prescribed zeros.** Every effective divisor `D` of degree
`m` on `ℂ` is the zero divisor of a framed degree-`m` plane vortex, repeated points included
(Taubes, *Arbitrary N-vortex solutions to the first order Ginzburg–Landau equations*; Taubes,
*SW ⇒ Gr*, Proposition 4.1(3)(iii); README §4.4). -/
theorem exists_isFramedVortex_hasZeroDivisor (D : Multiset ℂ) :
    ∃ x : ℂ → EuclideanSpace ℝ (Fin 4),
      IsFramedVortex (Multiset.card D) x ∧ HasZeroDivisor x D := by
  sorry

/-- **Uniqueness of plane vortices with prescribed zeros.** Two framed degree-`m` plane vortices
with the same zero divisor differ by a smooth framed gauge transformation, a smooth circle-valued
map tending to one at infinity, acting by `(a, α) ↦ (a - u⁻¹ du, u α)` (Taubes, *Arbitrary
N-vortex solutions to the first order Ginzburg–Landau equations*; Taubes, *SW ⇒ Gr*, Proposition
4.1(3)(iii); README §4.4). -/
theorem exists_mem_framedGaugeGroup_eq_gaugeTransform {m : ℕ}
    {x y : ℂ → EuclideanSpace ℝ (Fin 4)} {D : Multiset ℂ}
    (hx : IsFramedVortex m x) (hy : IsFramedVortex m y)
    (hxD : HasZeroDivisor x D) (hyD : HasZeroDivisor y D) :
    ∃ u ∈ TauCeti.Vortex.framedGaugeGroup, y = TauCeti.Vortex.gaugeTransform u x := by
  sorry

end TauCetiRoadmap.TaubesGromov
