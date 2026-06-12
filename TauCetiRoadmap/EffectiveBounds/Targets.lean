import Mathlib

/-!
# Effective arithmetic bounds and geometry of numbers: target signatures

The narrative roadmap (the layer-by-layer build plan, the worked examples, and the
references) is in `README.md`. Mathlib has Minkowski's convex-body theorem, the canonical
embedding, and the Minkowski bound, but not the explicit effective estimates; we build
those here in `TauCeti/`, with geometry of numbers as the engine.

This file holds the **Layer 1** targets — the explicit discriminant, class-number, and
unit-square-index bounds over an arbitrary number field. They elaborate against the pinned
Mathlib and are stated with `sorry` (allowed in this human-owned roadmap library). As
later layers make their types expressible in `TauCeti/`, add their milestones here: the
measure-free packing/doubling engine (Layer 0, after its `ZLattice` reconciliation), and
Minkowski's lower bound with Hermite–Minkowski finiteness (Layer 2, the summit).

The Layer-1 bounds are migrated from
[kim-em/erdos-unit-distance](https://github.com/kim-em/erdos-unit-distance); credit it in
the ported `TauCeti/` files.
-/

namespace TauCetiRoadmap.EffectiveBounds

/-- **Layer 1 — discriminant from an integral basis.** For any `ℚ`-basis `b` of a number
field consisting of algebraic integers, `|d_K| ≤ |disc b|` (the index of `b` in a maximal
order is a nonzero integer, and `disc b = index² · d_K`). -/
example {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι ℚ K) (hb : ∀ i, IsIntegral ℤ (b i)) :
    |(NumberField.discr K : ℚ)| ≤ |Algebra.discr ℚ (b : ι → K)| :=
  sorry

/-- **Layer 1 — class number bound.** `h_F ≤ |d_F| · 4^[F:ℚ]`. By Minkowski's bound every
ideal class contains an integral ideal of norm `≤ √|d_F|`, and the classes inject into the
ideals of norm `≤ √|d_F|`, counted (reconciling with `Ideal/Asymptotics`) as `≤ |d_F|·2ⁿ`. -/
example (F : Type*) [Field F] [NumberField F] :
    (NumberField.classNumber F : ℝ) ≤
      |(NumberField.discr F : ℝ)| * 4 ^ Module.finrank ℚ F :=
  sorry

/-- **Layer 1 — unit-square index.** `[O_F^× : (O_F^×)²] ≤ 2^[F:ℚ]`. By Dirichlet's unit
theorem `O_F^× ≅ μ_F × ℤ^rank` with `rank = r₁ + r₂ − 1 < [F:ℚ]` and `μ_F` cyclic of even
order, so the squaring map has index `2^(rank+1) ≤ 2^[F:ℚ]`. -/
example (F : Type*) [Field F] [NumberField F] :
    (MonoidHom.range
        (powMonoidHom 2 :
          (NumberField.RingOfIntegers F)ˣ →* (NumberField.RingOfIntegers F)ˣ)).index ≤
      2 ^ Module.finrank ℚ F :=
  sorry

end TauCetiRoadmap.EffectiveBounds
