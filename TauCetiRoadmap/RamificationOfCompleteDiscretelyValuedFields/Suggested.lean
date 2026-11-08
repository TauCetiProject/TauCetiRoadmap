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
(`Algebra.IsInvariant`), Mathlib's action of a quotient group on a fixed subring
(`FixedPoints.subalgebra`), and Tau Ceti's lower filtration of a group acting on a local ring
(`TauCeti.IsLocalRing.ramificationGroup`). Stated here: Hilbert's different formula over a
separable residue extension (§3a.1); the Herbrand function, its inverse and the upper numbering
on the local-ring filtration, with Herbrand's quotient theorem and tower transitivity for
separable residue extension (§3a.2); and Hasse–Arf without residue finiteness in Serre's
lower-numbering form (§3a.3). The finite-local-field Hasse–Arf is Tau Ceti's
`TauCeti.LocalFieldsRamification.hasseArf`, owned by the completed roadmap LocalFieldsRamification
and consumed, not restated; §3a.3 owns its generalization.

The residue-enlargement, proalgebraic-unit and graded-norm targets of §3a.3 are prerequisites of
Hasse–Arf, not headlines; the quasialgebraic and proalgebraic statements among them lack perfect
quasialgebraic groups and their pro-category at the pins.

Not statable at the pins, and therefore README targets only: over a perfect residue field, the
absolute upper filtration of `Field.absoluteGaloisGroup K` with inertia and wild inertia as its
terms at `0` and `0+` (§4a.1), the transition function `ψ_(L/K)` of a finite separable extension
with the open-subgroup identity (§4a.2) and the completed maximal unramified base change (§4a.3).
The absolute filtration is defined through the upper numbering at every finite level `M` of
`AlgebraicClosure K`, on the integer ring `integralClosure A M`, and neither pinned library makes
that ring a local ring for a complete discrete valuation ring `A` (Mathlib supplies its Galois
action, not its local-ring structure); its identification with inertia and wild inertia also
needs those subgroups over a general complete discretely valued field, and Tau Ceti's
`TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup` assume `IsNonarchimedeanLocalField K`.
The transition function `ψ_(L/K)` of a non-Galois `L` is defined through a Galois closure, on the
same integer rings, and the open-subgroup identity is stated on the absolute filtration. The base
change of §4a.3 is to the completion `K′` of the maximal unramified extension: that extension
exists at the pins only for nonarchimedean local fields (`TauCeti.maximalUnramifiedExtension`),
and its completion for the extended valuation is a construction of §4a.3.
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

/-- **§3a.2, the Herbrand function** `φ(u) = ∫_0^u #G_t / #G_0 dt` of a group `G` acting on a
local ring `S`, where `G_t = G_⌈t⌉` is Tau Ceti's real-indexed lower filtration
`TauCeti.IsLocalRing.ramificationGroupReal`. For finite `G` the integrand is an antitone step
function, equal to `1` on `(-1, 0]` and at least `1 / #G_0` everywhere, so `φ` is a continuous
strictly increasing bijection of `ℝ`, the identity on `[-1, 0]`, with
`φ(m) = (#G_1 + ⋯ + #G_m) / #G_0` at every natural number `m`; only its values on `[-1, ∞)` carry
meaning (Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, formula (5),
printed p. 127). -/
noncomputable def herbrandFun (G : Type*) [Group G] (S : Type*) [CommRing S] [IsLocalRing S]
    [MulSemiringAction G S] (u : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..u,
    (Nat.card (TauCeti.IsLocalRing.ramificationGroupReal G S t) : ℝ) /
      Nat.card (TauCeti.IsLocalRing.ramificationGroup G S 0)

/-- **§3a.2, the inverse Herbrand function** `ψ(v)`, the least `u` with `v ≤ φ(u)`. For finite
`G`, `φ` is a continuous strictly increasing bijection of `ℝ`, so the set of such `u` is the
closed half-line starting at `φ⁻¹(v)` and `ψ` is the inverse of `φ`; `ψ(-1) = -1`. -/
noncomputable def inverseHerbrandFun (G : Type*) [Group G] (S : Type*) [CommRing S]
    [IsLocalRing S] [MulSemiringAction G S] (v : ℝ) : ℝ :=
  sInf {u : ℝ | v ≤ herbrandFun G S u}

/-- **§3a.2, the upper numbering** `G^v = G_(ψ(v))` of a group `G` acting on a local ring `S`,
the numbering under which `G^(φ(u)) = G_u` (Serre, *Sur les corps locaux à corps résiduel
algébriquement clos*, n° 3.1, formula (8), printed p. 128). -/
noncomputable def upperRamificationGroup (G : Type*) [Group G] (S : Type*) [CommRing S]
    [IsLocalRing S] [MulSemiringAction G S] (v : ℝ) : Subgroup G :=
  TauCeti.IsLocalRing.ramificationGroupReal G S (inverseHerbrandFun G S v)

/-- **§3a.2, Herbrand's theorem.** Let a finite group `G` act faithfully on a discrete valuation
ring `B` by `A`-algebra automorphisms with invariants the discrete valuation ring `A`, with
separable residue extension, and let `H` be a normal subgroup. Mathlib makes `G ⧸ H` act on the
fixed ring `B^H = FixedPoints.subalgebra A B H` with invariants `A`. The ring `B^H` is the
integral closure of `A` in `(Frac B)^H`, a discrete valuation ring; its local-ring structure is
carried as a hypothesis because the pinned libraries do not infer it. Then
`(G ⧸ H)^v = G^v H / H` for every `v ≥ -1` (Serre, *Local Fields*, IV §3, Proposition 14; Serre,
*Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, Proposition 3, printed
p. 128, for totally ramified extensions). Completeness of `A` is not required; separability of the
residue extension cannot be dropped. -/
theorem upperRamificationGroup_quotient_eq_map
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] (H : Subgroup G) [H.Normal]
    [IsLocalRing (FixedPoints.subalgebra A B H)] (v : ℝ) (hv : -1 ≤ v) :
    upperRamificationGroup (G ⧸ H) (FixedPoints.subalgebra A B H) v =
      (upperRamificationGroup G B v).map (QuotientGroup.mk' H) :=
  sorry

/-- **§3a.2, tower transitivity.** In the setting of Herbrand's theorem, with `H` normal in `G`
acting on `B` by restriction and `G ⧸ H` acting on the fixed ring `B^H`, the Herbrand functions
satisfy `φ_G = φ_(G ⧸ H) ∘ φ_H` on `[-1, ∞)`, that is `φ_(M/K) = φ_(L/K) ∘ φ_(M/L)` for
`L = M^H`; the inverse functions compose in the opposite order (Serre, *Sur les corps locaux à
corps résiduel algébriquement clos*, n° 3.1, Proposition 4, printed p. 128, for totally ramified
extensions). Completeness of `A` is not required; separability of the residue extension cannot
be dropped. -/
theorem herbrandFun_tower
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] (H : Subgroup G) [H.Normal]
    [IsLocalRing (FixedPoints.subalgebra A B H)] (u : ℝ) (hu : -1 ≤ u) :
    herbrandFun G B u =
      herbrandFun (G ⧸ H) (FixedPoints.subalgebra A B H) (herbrandFun H B u) :=
  sorry

/-- **§3a.3, Hasse–Arf without residue finiteness**, in Serre's lower-numbering form
(Serre, *Local Fields*, V §7, Theorem 1). `A` and `B` are discrete valuation rings, a finite
abelian group `G` acts faithfully on `B` by `A`-algebra automorphisms with invariants `A`, so that
`Frac B / Frac A` is Galois with group `G`, and the residue extension is separable;
`IsLocalHom (algebraMap A B)` follows from the invariant hypothesis and provides the residue-field
algebra. `A` need not be complete: completing `A` and `B` changes neither `G` nor its lower
groups. If `G_j ≠ G_(j+1)` for a natural number `j`, then `φ(j) = (#G_1 + ⋯ + #G_j) / #G_0` is an
integer. Every jump of `upperRamificationGroup G B` other than `-1` is `φ(j)` for such a `j`, so
this is the statement that every upper jump is an integer. -/
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
