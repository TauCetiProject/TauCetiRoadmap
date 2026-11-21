module

public import Mathlib
public import TauCeti.ModelTheory.Algebra.Group.Basic

/-!
# The Ax–Kochen–Ershov principle: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins the one-sorted language `valLang` of valued fields (rings with a binary divisibility
relation, van den Dries's `L_val`), the `valLang`-structure of a field with a valuation subring,
the residue field and the value group as the structures that AKE compares, pseudo-Cauchy sequences
and their pseudolimits, and the headline AKE theorems and their consequences for `ℚ_p` and for
power series rings.

The ordered-group language `orderedGroup` is a local copy of SaturationAndQuantifierElimination
Layer 3.1, which is not on main; when it lands, the copy is replaced by that roadmap's declaration.

Henselization of a valued field (LocalFieldsRamificationPartII §1.3), immediate and maximal
extensions, cross-sections, good maps and the finitely ramified case are stated in `README.md`
only.

Suggested homes: `TauCeti/ModelTheory/Algebra/ValuedField/` and
`TauCeti/RingTheory/Valuation/PseudoCauchy.lean`.
-/

@[expose] public section

namespace TauCetiRoadmap.AxKochenErshov

open FirstOrder FirstOrder.Language

/-! ## Layer 0: the language of valued fields -/

section Layer0

/-- The divisibility relation symbol of `valLang`. -/
inductive DvdRel : ℕ → Type
  | dvd : DvdRel 2

/-- **0.1** The language `L_val` of valued fields: the language of rings with one binary relation
symbol `∣`, read `x ∣ y :↔ ∃ a ∈ V, a * x = y`. -/
abbrev valLang : Language := Language.ring.sum ⟨fun _ => Empty, DvdRel⟩

/-- **0.1** The divisibility of a valuation subring: `x ∣ y` when `y = a * x` for some `a ∈ V`. -/
def ValuationSubring.Dvd {K : Type*} [Field K] (V : ValuationSubring K) (x y : K) : Prop :=
  ∃ a ∈ V, a * x = y

/-- **0.1** The `valLang`-structure of a field with a valuation subring. -/
@[instance_reducible] noncomputable def valStructure (K : Type*) [Field K]
    (V : ValuationSubring K) : valLang.Structure K :=
  @Language.sumStructure _ _ K (FirstOrder.Ring.compatibleRingOfRing K).toStructure
    { funMap := fun {_} f => Empty.elim f
      RelMap := fun {n} r x => match n, r with | _, .dvd => ValuationSubring.Dvd V (x 0) (x 1) }

/-- **0.1** The divisibility of `V` determines `V`: `V = {x | 1 ∣ x}`. -/
theorem mem_iff_dvd_one {K : Type*} [Field K] (V : ValuationSubring K) (x : K) :
    x ∈ V ↔ ValuationSubring.Dvd V 1 x :=
  sorry

/-- **0.2** The language of ordered groups, written multiplicatively. Local copy of
SaturationAndQuantifierElimination's `orderedGroup`. -/
abbrev orderedGroup : Language := Language.group.sum Language.order

/-- **0.2** The `orderedGroup`-structure of an ordered group. Local copy of
SaturationAndQuantifierElimination's `orderedGroupStructure`. -/
@[instance_reducible] def orderedGroupStructure (Γ : Type*) [Group Γ] [LE Γ] :
    orderedGroup.Structure Γ :=
  @Language.sumStructure _ _ Γ (TauCeti.Group.structureOfGroup Γ) (orderStructure Γ)

end Layer0

attribute [local instance] orderedGroupStructure FirstOrder.Ring.compatibleRingOfRing

section Interpretations

/-- **0.3** The value group `Γ_V`, the units of Mathlib's `ValuationSubring.ValueGroup`. -/
abbrev valueGroup {K : Type*} [Field K] (V : ValuationSubring K) : Type _ := V.ValueGroupˣ

/-- **0.3** Interpretation of the residue field: for every ring sentence `φ` there is a
`valLang`-sentence `φᵏ` such that every valued field satisfies `φᵏ` exactly when its residue field
satisfies `φ`. -/
theorem exists_residueSentence (φ : Language.ring.Sentence) :
    ∃ ψ : valLang.Sentence, ∀ (K : Type) [Field K] (V : ValuationSubring K),
      letI := valStructure K V
      (K ⊨ ψ ↔ IsLocalRing.ResidueField V ⊨ φ) :=
  sorry

/-- **0.3** Interpretation of the value group: for every `orderedGroup`-sentence `φ` there is a
`valLang`-sentence `φᵛ` such that every valued field satisfies `φᵛ` exactly when its value group
satisfies `φ`. -/
theorem exists_valueGroupSentence (φ : orderedGroup.Sentence) :
    ∃ ψ : valLang.Sentence, ∀ (K : Type) [Field K] (V : ValuationSubring K),
      letI := valStructure K V
      (K ⊨ ψ ↔ valueGroup V ⊨ φ) :=
  sorry

end Interpretations

/-! ## Layer 2: pseudo-Cauchy sequences -/

section Layer2

variable {K : Type*} [Field K] (V : ValuationSubring K)

/-- **2.1** A pseudo-Cauchy sequence, indexed by a well-ordered set without largest element:
eventually `|a_k - a_j| < |a_j - a_i|` for `i < j < k`. -/
def IsPseudoCauchy {ι : Type*} [LinearOrder ι] (a : ι → K) : Prop :=
  ∃ i₀, ∀ i j k, i₀ ≤ i → i < j → j < k → V.valuation (a k - a j) < V.valuation (a j - a i)

/-- **2.1** `x` is a pseudolimit of `a`: `|x - a_i|` is eventually strictly decreasing. -/
def IsPseudoLimit {ι : Type*} [LinearOrder ι] (a : ι → K) (x : K) : Prop :=
  ∃ i₀, ∀ i j, i₀ ≤ i → i < j → V.valuation (x - a j) < V.valuation (x - a i)

/-- **2.1** Pseudolimits of a pseudo-Cauchy sequence form a ball: if `x` is a pseudolimit, then
`y` is one exactly when `|x - y|` is eventually below `|x - a_i|`. -/
theorem IsPseudoLimit.isPseudoLimit_iff {ι : Type*} [LinearOrder ι] [NoMaxOrder ι] {a : ι → K}
    (ha : IsPseudoCauchy V a) {x : K} (hx : IsPseudoLimit V a x) (y : K) :
    IsPseudoLimit V a y ↔ ∃ i₀, ∀ i, i₀ ≤ i → V.valuation (x - y) < V.valuation (x - a i) :=
  sorry

end Layer2

/-! ## Layer 5: the AKE theorems -/

section Layer5

/-- **5.3** The Ax–Kochen–Ershov theorem in residue characteristic `0` (van den Dries Thm. 5.1). -/
theorem elementarilyEquivalent_iff_of_charZero {K K' : Type} [Field K] [Field K']
    (V : ValuationSubring K) (V' : ValuationSubring K') [HenselianLocalRing V]
    [HenselianLocalRing V'] [CharZero (IsLocalRing.ResidueField V)]
    [CharZero (IsLocalRing.ResidueField V')] :
    letI := valStructure K V
    letI := valStructure K' V'
    (K ≅[valLang] K' ↔
      (IsLocalRing.ResidueField V ≅[Language.ring] IsLocalRing.ResidueField V') ∧
        (valueGroup V ≅[orderedGroup] valueGroup V')) :=
  sorry

/-- **5.7** AKE for unramified henselian fields of mixed characteristic `(0, p)` with perfect
residue field (van den Dries Thm. 7.1): `v(p)` is the least value greater than `1`. -/
theorem elementarilyEquivalent_iff_of_unramified {K K' : Type} [Field K] [Field K'] [CharZero K]
    [CharZero K'] (p : ℕ) [Fact p.Prime] (V : ValuationSubring K) (V' : ValuationSubring K')
    [HenselianLocalRing V] [HenselianLocalRing V']
    [CharP (IsLocalRing.ResidueField V) p] [CharP (IsLocalRing.ResidueField V') p]
    [PerfectRing (IsLocalRing.ResidueField V) p] [PerfectRing (IsLocalRing.ResidueField V') p]
    (hV : ∀ x : K, V.valuation x < 1 → V.valuation x ≤ V.valuation (p : K))
    (hV' : ∀ x : K', V'.valuation x < 1 → V'.valuation x ≤ V'.valuation (p : K')) :
    letI := valStructure K V
    letI := valStructure K' V'
    (K ≅[valLang] K' ↔
      (IsLocalRing.ResidueField V ≅[Language.ring] IsLocalRing.ResidueField V') ∧
        (valueGroup V ≅[orderedGroup] valueGroup V')) :=
  sorry

end Layer5

/-! ## Layer 6: consequences -/

section Layer6

/-- The `p`-adic valuation subring of `ℚ_[p]`. -/
noncomputable abbrev padicValuationSubring (p : ℕ) [Fact p.Prime] : ValuationSubring ℚ_[p] :=
  (Padic.mulValuation (p := p)).valuationSubring

/-- **6.1** Ax–Kochen II, Ershov: a valued field is elementarily equivalent to `ℚ_p` exactly when it
is henselian of characteristic `0` with residue field `𝔽_p`, `v(p)` the least value `> 1`, and
value group elementarily equivalent to `ℤ`. -/
theorem elementarilyEquivalent_padic_iff (p : ℕ) [Fact p.Prime] {K : Type} [Field K]
    (V : ValuationSubring K) :
    letI := valStructure K V
    letI := valStructure ℚ_[p] (padicValuationSubring p)
    (K ≅[valLang] ℚ_[p] ↔
      CharZero K ∧ HenselianLocalRing V ∧
        Nonempty (IsLocalRing.ResidueField V ≃+* ZMod p) ∧
        (∀ x : K, V.valuation x < 1 → V.valuation x ≤ V.valuation (p : K)) ∧
        (valueGroup V ≅[orderedGroup] Multiplicative ℤ)) :=
  sorry

/-- **6.3** Ax–Kochen, Ershov (van den Dries 1.1): for fields of characteristic `0`, the power
series rings are elementarily equivalent as rings exactly when the coefficient fields are. -/
theorem elementarilyEquivalent_powerSeries_iff (k k' : Type) [Field k] [Field k'] [CharZero k]
    [CharZero k'] :
    PowerSeries k ≅[Language.ring] PowerSeries k' ↔ k ≅[Language.ring] k' :=
  sorry

end Layer6

end TauCetiRoadmap.AxKochenErshov
