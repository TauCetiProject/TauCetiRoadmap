module

public import Mathlib
public import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic
public import TauCeti.RingTheory.Affinoid.PowerBounded

/-!
# Rigid analytic geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the pinned carriers: the
affinoid predicate `TauCeti.IsAffinoidAlgebra`, the supremum seminorm `TauCeti.supSeminorm`, the
Tate algebra `MvPowerSeries.IsRestricted.subring` at unit polyradius with its Gauss unit ball
`Subring.unitClosedBall`, and the presentation ring `π(Tₙ°)`, the image of that unit ball under a
Tate presentation `π`. No definition is made here.

Stated below, because the pinned Tau Ceti does not prove them: the Banach function algebra
theorem of §2.2 (on a reduced affinoid algebra every complete algebra norm is bounded by a
multiple of the supremum seminorm; the reverse bound is the pinned
`TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`); Kiehl's almost noetherianity of presentation
rings of §2.3 and its noetherian corollary for discretely valued `K`.

Proved by the pinned Tau Ceti, so not restated: the algebraic theorems of Layer 1 and the
supremum theorems of Layers 1–2 that the README cites by their pinned names under
`TauCeti/RingTheory/Affinoid/` (noetherianity, the Jacobson property, Noether normalisation,
finite maximal residue fields, the height formula for affinoid domains, the strict-polyradius
criterion, the closed-embedding theorem for finite injective maps, boundedness and maximum
modulus of the supremum seminorm, its power multiplicativity and nilradical kernel, the uniform
value-group exponent, the power-bounded and topologically nilpotent characterisations, the
reduced-quotient criterion for a ring of definition and presentation-ring integrality), and the
numerical slope predicates, decomposition and projector of §7.2 under
`TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean`.

Not statable at the pins, so stated nowhere in this file: classical Tate acyclicity (Layer 5),
which needs the structure presheaf on the pinned affinoid site with its sheaf condition; the
quasi-Stein theorem (§7.3), Kiehl's proper mapping theorem with its base-change and
formal-functions statements (§§7.4–7.5) and proper GAGA (§8.4), which need rigid spaces, coherent
sheaves on them and rigid analytification; and the rigid–adic equivalence (§8.3), which needs the
rigid category and the functor to adic spaces. These are README targets with their intended
signatures.
-/

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

@[expose] public section

open Topology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## Layer 2: supremum seminorm, reduction and integral models -/

section BanachFunctionAlgebra

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]

/-- Banach function algebra theorem (BGR §6.2.4): on a reduced affinoid algebra, every complete
ultrametric algebra norm is bounded by a constant multiple of the supremum seminorm, so the two
are equivalent. The reverse inequality `|f|sup ≤ ‖f‖` holds for every affinoid algebra and is the
pinned `TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`. Reducedness is necessary: in
`K⟨T⟩/(T²)` with its quotient norm, `T` has norm one and supremum seminorm zero. -/
theorem banachFunctionAlgebra [IsReduced A] (hA : TauCeti.IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A, ‖f‖ ≤ C * TauCeti.supSeminorm K f := by
  sorry

end BanachFunctionAlgebra

section IntegralModels

variable {A : Type*} [CommRing A] [Algebra K A]

/-- Kiehl's almost noetherianity (Kiehl-E, Satz 5.1) for the presentation ring `A₀ = π(Tₙ°)`, the
image of the Gauss unit ball of the Tate algebra under a surjective presentation `π`: for a finite
`A₀`-module `M`, a submodule `N` and `0 < ε < 1`, one finitely generated `N' ⊆ N` contains `cN`
for every scalar `c ∈ K` with `|c| ≤ ε`. No finiteness of `A°` over `A₀` is asserted. -/
theorem exists_fg_smul_le_of_presentation {n : ℕ}
    (π : MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1) →ₐ[K] A)
    (hπ : Function.Surjective π)
    {M : Type*} [AddCommGroup M]
    [Module ((Subring.unitClosedBall
      (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom) M]
    [Module.Finite ((Subring.unitClosedBall
      (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom) M]
    (N : Submodule ((Subring.unitClosedBall
      (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom) M)
    (ε : ℝ) (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ N' : Submodule ((Subring.unitClosedBall
      (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom) M,
      N'.FG ∧ N' ≤ N ∧
      ∀ s : (Subring.unitClosedBall
        (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom,
        (∃ c : K, ‖c‖ ≤ ε ∧ (s : A) = algebraMap K A c) → ∀ x ∈ N, s • x ∈ N' := by
  sorry

/-- For discretely valued `K` (the norms below one are bounded away from one), the presentation
ring `A₀ = π(Tₙ°)` of a surjective Tate presentation `π` is noetherian (Kiehl-E, §5). The
hypothesis fails for `ℂ_p`, where the presentation ring `𝒪_{ℂ_p}` of the zero-variable Tate
algebra is not noetherian. -/
theorem isNoetherian_of_presentation_of_discrete
    (hK : ∃ ρ : ℝ, ρ < 1 ∧ ∀ c : K, ‖c‖ < 1 → ‖c‖ ≤ ρ) {n : ℕ}
    (π : MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1) →ₐ[K] A)
    (hπ : Function.Surjective π) :
    IsNoetherianRing ((Subring.unitClosedBall
      (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom) := by
  sorry

end IntegralModels

end

end

end TauCetiRoadmap.RigidAnalyticGeometry
