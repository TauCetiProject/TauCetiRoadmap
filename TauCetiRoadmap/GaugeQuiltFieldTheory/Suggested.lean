import Mathlib.GroupTheory.Commutator.Basic

/-!
This file is not the roadmap and is not exhaustive. The README is definitive.
These samples use the native group commutator and conjugation automorphism to
state the genus-one central holonomy relation. They do not construct connections,
quotient moduli, Lagrangians, quilts or a field theory.
-/

namespace TauCetiRoadmap.GaugeQuiltFieldTheory

open scoped commutatorElement

variable {G : Type*} [Group G]

/-- Raw genus-one holonomy values with the specified puncture monodromy. -/
structure GenusOneHolonomy (z : G) where
  meridian : G
  longitude : G
  relation : ⁅meridian, longitude⁆ = z

@[ext] theorem GenusOneHolonomy.ext {z : G} (ρ σ : GenusOneHolonomy z)
    (hm : ρ.meridian = σ.meridian) (hl : ρ.longitude = σ.longitude) : ρ = σ := by
  cases ρ
  cases σ
  simp_all

/-- Simultaneous conjugation preserves a central puncture monodromy. -/
def conjugateHolonomy {z : G} (ρ : GenusOneHolonomy z) (u : G)
    (hz : ∀ v : G, MulAut.conj v z = z) : GenusOneHolonomy z where
  meridian := MulAut.conj u ρ.meridian
  longitude := MulAut.conj u ρ.longitude
  relation := by
    rw [← map_commutatorElement (MulAut.conj u), ρ.relation]
    exact hz u

@[simp] theorem conjugateHolonomy_meridian {z : G} (ρ : GenusOneHolonomy z) (u : G)
    (hz : ∀ v : G, MulAut.conj v z = z) :
    (conjugateHolonomy ρ u hz).meridian = MulAut.conj u ρ.meridian := rfl

@[simp] theorem conjugateHolonomy_longitude {z : G} (ρ : GenusOneHolonomy z) (u : G)
    (hz : ∀ v : G, MulAut.conj v z = z) :
    (conjugateHolonomy ρ u hz).longitude = MulAut.conj u ρ.longitude := rfl

@[simp] theorem conjugateHolonomy_one {z : G} (ρ : GenusOneHolonomy z)
    (hz : ∀ v : G, MulAut.conj v z = z) : conjugateHolonomy ρ 1 hz = ρ := by
  apply GenusOneHolonomy.ext <;> simp [conjugateHolonomy]

/-- Conjugations compose in the same order as the group product. -/
theorem conjugateHolonomy_mul {z : G} (ρ : GenusOneHolonomy z) (u v : G)
    (hz : ∀ w : G, MulAut.conj w z = z) :
    conjugateHolonomy ρ (u * v) hz =
      conjugateHolonomy (conjugateHolonomy ρ v hz) u hz := by
  apply GenusOneHolonomy.ext <;> simp [conjugateHolonomy, mul_assoc]

end TauCetiRoadmap.GaugeQuiltFieldTheory
