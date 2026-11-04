module

public import Mathlib
public import TauCeti.RingTheory.LocalRing.RamificationGroup

/-!
# Ramification of complete discretely valued fields: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The roadmap continues LocalFieldsRamification past nonarchimedean local fields. Its headlines
are stated on the carriers the pinned libraries already have and that assume no finite residue
field: Mathlib's discrete valuation rings with a finite group acting with invariants
(`Algebra.IsInvariant`) and Tau Ceti's lower filtration of a group acting on a local ring
(`TauCeti.IsLocalRing.ramificationGroup`). Stated here: Hilbert's different formula over a
separable residue extension (§3a.1) and Hasse–Arf without residue finiteness in Serre's
lower-numbering form (§3a.3). The finite-local-field Hasse–Arf is the completed roadmap's
`hasseArf` (Layer 3 of the completed roadmap LocalFieldsRamification), consumed and not restated.

Not statable at the pins, and therefore README targets only: the Herbrand function, its inverse
and the upper numbering on the local-ring filtration with their quotient and tower theorems (for
separable residue extension) and their agreement theorem (§3a.2), which lack a Herbrand function
on `TauCeti.IsLocalRing.ramificationGroup` (Tau Ceti's
`TauCeti.LocalFieldsRamification.herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `psiNat` and
`upperRamificationGroup` assume `IsNonarchimedeanLocalField` on both fields); the
residue-enlargement, proalgebraic-unit and graded-norm targets of §3a.3, which lack perfect
quasialgebraic groups and their pro-category; and, over a perfect residue field, the absolute
upper filtration of `Field.absoluteGaloisGroup K` with inertia and wild inertia (§4a.1), the
transition function `ψ_(L/K)` of a finite separable extension with the open-subgroup identity
(§4a.2) and the completed maximal unramified base change (§4a.3), which lack the upper numbering
of §3a.2 on which they are defined.
-/

public section

namespace TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

/-! ## Layer 3a: ramification over a complete discretely valued field -/

/-- **§3a.1, Hilbert's different formula.** Let a finite group `G` act faithfully on a discrete
valuation ring `B` by `A`-algebra automorphisms with invariants the discrete valuation ring `A`,
with separable residue extension. Then the different ideal is the power of the maximal ideal with
exponent `∑ (|G_i| - 1)` (Serre, *Local Fields*, IV §1, Proposition 4). The invariant hypothesis
makes `B` the integral closure of `A` in `Frac B`, finite over `A`; it also implies
`FaithfulSMul A B` and `IsLocalHom (algebraMap A B)`, which are carried because they provide the
different ideal and the residue-field algebra of the statement. The sum is finite because the
lower groups are eventually trivial. Neither completeness of `A`, nor residue finiteness, nor
commutativity of `G` is required. -/
theorem differentIdeal_eq_pow_maximalIdeal_of_separable_residue
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [FaithfulSMul A B] [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] :
    differentIdeal A B = IsLocalRing.maximalIdeal B ^
      (∑ᶠ i : ℕ, (Nat.card (TauCeti.IsLocalRing.ramificationGroup G B (i : ℤ)) - 1)) :=
  sorry

/-- **§3a.3, Hasse–Arf without residue finiteness**, in Serre's lower-numbering form
(Serre, *Local Fields*, V §7, Theorem 1). `A` and `B` are discrete valuation rings, a finite
abelian group `G` acts faithfully on `B` by `A`-algebra automorphisms with invariants `A`, so that
`Frac B / Frac A` is Galois with group `G`, and the residue extension is separable;
`IsLocalHom (algebraMap A B)` follows from the invariant hypothesis and provides the residue-field
algebra. `A` need not be complete: completing `A` and `B` changes neither `G` nor its lower
groups. If `G_j ≠ G_(j+1)` for a natural number `j`, then `φ(j) = (#G_1 + ⋯ + #G_j) / #G_0` is an
integer, that is, every upper jump is integral. The upper numbering itself on this carrier is a
`README.md` target. -/
theorem hasseArf_dvd_sum_card_ramificationGroup
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] [IsMulCommutative G] (j : ℕ)
    (hj : TauCeti.IsLocalRing.ramificationGroup G B (j : ℤ) ≠
      TauCeti.IsLocalRing.ramificationGroup G B ((j : ℤ) + 1)) :
    Nat.card (TauCeti.IsLocalRing.ramificationGroup G B 0) ∣
      ∑ i ∈ Finset.Icc 1 j, Nat.card (TauCeti.IsLocalRing.ramificationGroup G B (i : ℤ)) :=
  sorry

end TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

end
