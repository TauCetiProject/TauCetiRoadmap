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
(`FixedPoints.subalgebra`), Mathlib's valuation subrings with their decomposition and inertia
subgroups (`ValuationSubring.decompositionSubgroup`, `ValuationSubring.inertiaSubgroup`), and Tau
Ceti's lower filtration of a group acting on a local ring
(`TauCeti.IsLocalRing.ramificationGroup`). Stated here: Hilbert's different formula over a
separable residue extension (§3a.1); the Herbrand function, its inverse and the upper numbering
on the local-ring filtration, with Herbrand's quotient theorem and tower transitivity for
separable residue extension (§3a.2); Hasse–Arf without residue finiteness in Serre's
lower-numbering form (§3a.3); the absolute upper filtration of `Field.absoluteGaloisGroup K`
relative to a valuation subring `O` of `AlgebraicClosure K`, computed at every finite Galois level
`M` on the valuation subring `O ∩ M` of `M` with its decomposition group, with its term at `0` as
Mathlib's inertia for every valuation subring, and, when `O ∩ K` is a complete discrete valuation
ring with perfect residue field, its finite projections and its term at `0+` as the inverse limit
of the finite groups `G_1` (§4a.1); and the finite-level subgroup identity of §4a.2, which needs
neither a discrete valuation nor a normal subgroup. The finite-local-field Hasse–Arf is Tau Ceti's
`TauCeti.LocalFieldsRamification.hasseArf`, owned by the completed roadmap LocalFieldsRamification
and consumed, not restated; §3a.3 owns its generalization.

The residue-enlargement, proalgebraic-unit and graded-norm targets of §3a.3 are prerequisites of
Hasse–Arf, not headlines; the quasialgebraic and proalgebraic statements among them lack perfect
quasialgebraic groups and their pro-category at the pins.

Not statable at the pins, and therefore README targets only:
- the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` of §4a.2, with `ψ_(L/K)` a function
  of `L` alone: `G_L` is the open subgroup `AlgebraicClosure K ≃ₐ[L] AlgebraicClosure K` of `G_K`
  fixing `L`, whereas the absolute filtration over `L` is built on Mathlib's
  `Field.absoluteGaloisGroup L`, which acts on `AlgebraicClosure L` and is related to that
  subgroup only through a noncanonical isomorphism of algebraic closures; and `ψ_(L/K)` of a
  non-Galois `L` is defined through a Galois closure, its independence of that choice being a
  theorem of §4a.2. At a single finite level `M` it is `φ_(M/L) ∘ ψ_(M/K)`, and its subgroup
  identity is stated below;
- the completed maximal unramified base change (§4a.3): the maximal unramified extension exists at
  the pins only for nonarchimedean local fields (`TauCeti.maximalUnramifiedExtension`), and its
  completion for the extended valuation is a construction of §4a.3.
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
printed p. 127, for totally ramified extensions). -/
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
algébriquement clos*, n° 3.1, formula (8), printed p. 128, for totally ramified extensions). -/
noncomputable def upperRamificationGroup (G : Type*) [Group G] (S : Type*) [CommRing S]
    [IsLocalRing S] [MulSemiringAction G S] (v : ℝ) : Subgroup G :=
  TauCeti.IsLocalRing.ramificationGroupReal G S (inverseHerbrandFun G S v)

/-- **§3a.2, Herbrand's theorem.** Let a finite group `G` act faithfully on a discrete valuation
ring `B` by `A`-algebra automorphisms with invariants the discrete valuation ring `A`, with
separable residue extension, and let `H` be a normal subgroup. Mathlib makes `G ⧸ H` act on the
fixed ring `B^H = FixedPoints.subalgebra A B H` with invariants `A`. The ring `B^H` is the
integral closure of `A` in `(Frac B)^H`, a discrete valuation ring; its local-ring structure is
carried as a hypothesis because the pinned libraries do not infer it. Then
`(G ⧸ H)^v = G^v H / H` for every `v ≥ -1` (Serre, *Local Fields*, IV §3, Propositions 14 and 15;
Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, Proposition 3,
printed p. 128, for totally ramified extensions). Completeness of `A` is not required;
separability of the residue extension cannot be dropped. -/
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
`L = M^H`; the inverse functions compose in the opposite order (Serre, *Local Fields*, IV §3,
Proposition 15; Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1,
Proposition 4, printed p. 128, for totally ramified extensions). Completeness of `A` is not
required; separability of the residue extension cannot be dropped. -/
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

/-! ## Layer 4a: the absolute upper filtration over a perfect residue field -/

/-- **§4a.1, the absolute upper filtration** `G_K^u` of `G_K = Field.absoluteGaloisGroup K`
relative to a valuation subring `O` of `AlgebraicClosure K`: the elements `σ` whose restriction to
every finite Galois `M/K` inside `AlgebraicClosure K` lies in the image in `Gal(M/K)` of the
`u`-th upper group of the decomposition group of the valuation subring `O ∩ M` of `M`, acting on
`O ∩ M`. When `A = O ∩ K` is a complete discrete valuation ring, `O` is the integral closure of
`A` in `AlgebraicClosure K` and the only valuation subring over `A`, each decomposition group of
`O ∩ M` is all of `Gal(M/K)`, and `O ∩ M` is the integral closure of `A` in `M`; so `G_K^u` is
the set of `σ` whose restriction to every `M` lies in `Gal(M/K)^u` (Serre, *Sur les corps locaux
à corps résiduel algébriquement clos*, n° 3.1, the paragraph after Proposition 3, printed
p. 128, for totally ramified extensions). -/
noncomputable def absoluteUpperRamificationGroup (K : Type*) [Field K]
    (O : ValuationSubring (AlgebraicClosure K)) (u : ℝ) :
    Subgroup (Field.absoluteGaloisGroup K) :=
  ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
    ((upperRamificationGroup
          ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K)
          (O.comap (algebraMap M (AlgebraicClosure K))) u).map
        ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K).subtype).comap
      (AlgEquiv.restrictNormalHom (F := K) (K₁ := AlgebraicClosure K) M.toIntermediateField)

/-- **§4a.1, inertia as the term at `0`.** For every field `K` and every valuation subring `O` of
`AlgebraicClosure K`, `G_K^0` is the image in `G_K` of Mathlib's inertia subgroup of `O`, the
elements of the decomposition group of `O` that act trivially on the residue field of `O`. At each
finite level the upper group at `0` is the lower group `G_0`, because `ψ(0) = 0`, and Tau Ceti's
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup` identifies `G_0` with the inertia
of `O ∩ M`; every element of `O` has a power `x^q`, with `q` a power of the characteristic
exponent of `K`, that is separable over `K` and so lies in a finite Galois level, and a valuation
subring and its maximal ideal contain an element of `AlgebraicClosure K` once they contain its
`q`-th power, which carries the comparison to all of `O`. Neither completeness, nor
discreteness, nor a perfect residue field is needed; when `O ∩ K` is complete, the decomposition
group of `O` is all of `G_K`. -/
theorem absoluteUpperRamificationGroup_zero (K : Type*) [Field K]
    (O : ValuationSubring (AlgebraicClosure K)) :
    absoluteUpperRamificationGroup K O 0 =
      (ValuationSubring.inertiaSubgroup K O).map (O.decompositionSubgroup K).subtype :=
  sorry

/-- **§4a.1, the finite projections.** Let `O` be a valuation subring of `AlgebraicClosure K`
whose trace `A = O ∩ K` is a complete discrete valuation ring with perfect residue field. Then for
every finite Galois `M/K` inside `AlgebraicClosure K` and every `u ≥ -1`, restriction maps
`G_K^u` onto `Gal(M/K)^u`, the upper group of the decomposition group of `O ∩ M`, which here is all
of `Gal(M/K)`, acting on the integer ring `O ∩ M` of `M`. The route is Herbrand's theorem (§3a.2;
Serre, *Local Fields*, IV §3, Proposition 14) between finite levels, which needs the separable
residue extensions that a perfect residue field provides, and compactness of `G_K`, which Tau
Ceti's restriction isomorphism `TauCeti.absoluteGaloisGroupRestrictEquiv` identifies with the
Galois group of the separable closure, the inverse limit of the `Gal(M/K)`. Over an imperfect
residue field the image can be a proper subgroup: for `K = F_2(s)((t))` and `M = K(y, w)` with
`y² − y = s·t^(−2)` and `w² − w = t^(−1)`, the image of `G_K^(1/2)` has order at most `2` while
`Gal(M/K)^(1/2)` has order `4`. -/
theorem map_restrictNormalHom_absoluteUpperRamificationGroup (K : Type*) [Field K]
    (O : ValuationSubring (AlgebraicClosure K))
    [IsDiscreteValuationRing (O.comap (algebraMap K (AlgebraicClosure K)))]
    [IsAdicComplete (IsLocalRing.maximalIdeal (O.comap (algebraMap K (AlgebraicClosure K))))
      (O.comap (algebraMap K (AlgebraicClosure K)))]
    [PerfectField (IsLocalRing.ResidueField (O.comap (algebraMap K (AlgebraicClosure K))))]
    (M : FiniteGaloisIntermediateField K (AlgebraicClosure K)) (u : ℝ) (hu : -1 ≤ u) :
    (absoluteUpperRamificationGroup K O u).map
        (AlgEquiv.restrictNormalHom (F := K) (K₁ := AlgebraicClosure K) M.toIntermediateField) =
      (upperRamificationGroup
          ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K)
          (O.comap (algebraMap M (AlgebraicClosure K))) u).map
        ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K).subtype :=
  sorry

/-- **§4a.1, wild inertia as the term at `0+`.** Let `O` be a valuation subring of
`AlgebraicClosure K` whose trace `A = O ∩ K` is a complete discrete valuation ring with perfect
residue field. Then `G_K^(0+)`, the closure in the Krull topology of the union of the `G_K^w` for
`w > 0`, is wild inertia `P_K`, the inverse limit of the finite groups `G_1`: the set of `σ` whose
restriction to every finite Galois `M/K` lies in the first lower ramification group of the
decomposition group of `O ∩ M`, here all of `Gal(M/K)`, acting on the integer ring `O ∩ M`. At
each finite level `Gal(M/K)^w = G_(ψ(w)) ⊆ G_1` for `w > 0`, with equality for small `w`, and the
right side is closed, so the inclusion `⊆` holds for every valuation subring; the reverse
inclusion lifts an element of `G_1 = Gal(M/K)^w` through the finite projections. -/
theorem topologicalClosure_iSup_absoluteUpperRamificationGroup (K : Type*) [Field K]
    (O : ValuationSubring (AlgebraicClosure K))
    [IsDiscreteValuationRing (O.comap (algebraMap K (AlgebraicClosure K)))]
    [IsAdicComplete (IsLocalRing.maximalIdeal (O.comap (algebraMap K (AlgebraicClosure K))))
      (O.comap (algebraMap K (AlgebraicClosure K)))]
    [PerfectField (IsLocalRing.ResidueField (O.comap (algebraMap K (AlgebraicClosure K))))] :
    (⨆ w : Set.Ioi (0 : ℝ), absoluteUpperRamificationGroup K O (w : ℝ)).topologicalClosure =
      ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
        ((TauCeti.IsLocalRing.ramificationGroup
              ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K)
              (O.comap (algebraMap M (AlgebraicClosure K))) 1).map
            ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K).subtype).comap
          (AlgEquiv.restrictNormalHom (F := K) (K₁ := AlgebraicClosure K) M.toIntermediateField) :=
  sorry


/-- **§4a.2, the finite-level subgroup identity.** Let a finite group `G` act on a local ring `S`
and let `H` be any subgroup, acting by restriction. With the finite-level transition function
`ψ = φ_H ∘ ψ_G`, the trace on `H` of the upper group `G^u` is `H^(ψ(u))`. For `G = Gal(M/K)` and
`H = Gal(M/L)` acting on the integer ring of a finite Galois `M ⊇ L ⊇ K`, this is
`Gal(M/L) ∩ Gal(M/K)^u = Gal(M/L)^(ψ_(L/K)(u))` (Serre, *Local Fields*, IV §1, Proposition 2,
for the lower numbering). It follows from the trace formula `H_t = H ∩ G_t`
(`TauCeti.IsLocalRing.subgroupOf_ramificationGroupReal`) and `ψ_H ∘ φ_H = id`, so `H` need not be
normal, `L/K` need not be Galois, `S` need not be a discrete valuation ring and no hypothesis on
the residue extension is needed; it holds for every real `u`, in particular on `[-1, ∞)`. -/
theorem subgroupOf_upperRamificationGroup (G : Type*) [Group G] [Finite G] (S : Type*)
    [CommRing S] [IsLocalRing S] [MulSemiringAction G S] (H : Subgroup G) (u : ℝ) :
    (upperRamificationGroup G S u).subgroupOf H =
      upperRamificationGroup H S (herbrandFun H S (inverseHerbrandFun G S u)) :=
  sorry

end TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

end
