import TauCeti.Analysis.Complex.Conformal.Hurwitz

/-!
# Limits of univalent maps

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These consumers use the native Hurwitz theorem; all conclusions concern the domain.
-/

namespace TauCetiRoadmap.ConformalMapping

open Filter Set

/-- Locally uniform limits may collapse to a constant, even for injective maps. -/
theorem univalent_limit_dichotomy {ι : Type*} {l : Filter ι} [l.NeBot]
    {Ω : Set ℂ} {F : ι → ℂ → ℂ} {g : ℂ → ℂ}
    (hΩ : IsOpen Ω) (hconn : IsPreconnected Ω)
    (hF : ∀ᶠ i in l, DifferentiableOn ℂ (F i) Ω)
    (hconv : TendstoLocallyUniformlyOn F g l Ω)
    (hinj : ∀ᶠ i in l, InjOn (F i) Ω) :
    InjOn g Ω ∨ ∃ v : ℂ, ∀ z ∈ Ω, g z = v :=
  TauCeti.hurwitz_injOn hΩ hconn hF hconv hinj

/-- Two distinct limit values rule out the constant branch. -/
theorem univalent_limit_of_two_values {ι : Type*} {l : Filter ι} [l.NeBot]
    {Ω : Set ℂ} {F : ι → ℂ → ℂ} {g : ℂ → ℂ}
    (hΩ : IsOpen Ω) (hconn : IsPreconnected Ω)
    (hF : ∀ᶠ i in l, DifferentiableOn ℂ (F i) Ω)
    (hconv : TendstoLocallyUniformlyOn F g l Ω)
    (hinj : ∀ᶠ i in l, InjOn (F i) Ω)
    {a b : ℂ} (ha : a ∈ Ω) (hb : b ∈ Ω) (hne : g a ≠ g b) :
    InjOn g Ω := by
  rcases univalent_limit_dichotomy hΩ hconn hF hconv hinj with hi | ⟨v, hv⟩
  · exact hi
  · exact (hne ((hv a ha).trans (hv b hb).symm)).elim

end TauCetiRoadmap.ConformalMapping
