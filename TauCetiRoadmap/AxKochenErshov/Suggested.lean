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
and their pseudolimits, the headline AKE theorems (residue characteristic `0`, unramified,
finitely ramified), the completeness of algebraically closed valued fields of fixed
characteristics, and the consequences for `ℚ_p` and for power series rings.

The ordered-group language `orderedGroup` is a copy of SaturationAndQuantifierElimination 3.1,
which owns it.

The valued-field structure is always passed explicitly (`valStructure K V`), so each statement
shows which valuation it is about. The theorems take `K : Type`; the README puts no universe
restriction on them.

Henselization of a valued field (LocalFieldsRamificationPartII §1.3), immediate and maximal
extensions, cross-sections and good maps are stated in `README.md` only. So are the two
elementary-extension theorems `K ≼ K'` (README 5.4 and the second bullet of 5.7): they need the
induced maps of residue fields and value groups as `Language.ring`- and `orderedGroup`-embeddings,
which this file does not set up.

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

/-- **0.1** Sanity check, by unfolding the definition: the divisibility of `V` determines `V`,
`V = {x | 1 ∣ x}`. -/
theorem mem_iff_dvd_one {K : Type*} [Field K] (V : ValuationSubring K) (x : K) :
    x ∈ V ↔ ValuationSubring.Dvd V 1 x :=
  sorry

/-- **0.2** The language of ordered groups, written multiplicatively. A copy of
SaturationAndQuantifierElimination's `orderedGroup` (its 3.1), which owns it. -/
abbrev orderedGroup : Language := Language.group.sum Language.order

/-- **0.2** The `orderedGroup`-structure of an ordered group. A copy of
SaturationAndQuantifierElimination's `orderedGroupStructure` (its 3.1), which owns it. -/
@[instance_reducible] def orderedGroupStructure (Γ : Type*) [Group Γ] [LE Γ] :
    orderedGroup.Structure Γ :=
  @Language.sumStructure _ _ Γ (TauCeti.Group.structureOfGroup Γ) (orderStructure Γ)

end Layer0

attribute [local instance] orderedGroupStructure FirstOrder.Ring.compatibleRingOfRing

section Interpretations

/-- **0.2** The value group `Γ_V`, the units of Mathlib's `ValuationSubring.ValueGroup`. -/
abbrev valueGroup {K : Type*} [Field K] (V : ValuationSubring K) : Type _ := V.ValueGroupˣ

/-- **0.2** Interpretation of the residue field: for every ring sentence `φ` there is a
`valLang`-sentence `φᵏ` such that every valued field satisfies `φᵏ` exactly when its residue field
satisfies `φ`. -/
theorem exists_residueSentence (φ : Language.ring.Sentence) :
    ∃ ψ : valLang.Sentence, ∀ (K : Type) [Field K] (V : ValuationSubring K),
      (@Sentence.Realize valLang K (valStructure K V) ψ ↔ IsLocalRing.ResidueField V ⊨ φ) :=
  sorry

/-- **0.2** Interpretation of the value group: for every `orderedGroup`-sentence `φ` there is a
`valLang`-sentence `φᵛ` such that every valued field satisfies `φᵛ` exactly when its value group
satisfies `φ`. -/
theorem exists_valueGroupSentence (φ : orderedGroup.Sentence) :
    ∃ ψ : valLang.Sentence, ∀ (K : Type) [Field K] (V : ValuationSubring K),
      (@Sentence.Realize valLang K (valStructure K V) ψ ↔ valueGroup V ⊨ φ) :=
  sorry

end Interpretations

/-! ## Layer 1: algebraically closed valued fields -/

section Layer1

/-- **Layer 1** Completions of ACVF (van den Dries Cor. 3.34): algebraically closed nontrivially valued
fields with the same characteristic and residue characteristic are elementarily equivalent. -/
theorem elementarilyEquivalent_of_isAlgClosed {K K' : Type} [Field K] [Field K'] [IsAlgClosed K]
    [IsAlgClosed K'] (V : ValuationSubring K) (V' : ValuationSubring K') (hV : V ≠ ⊤)
    (hV' : V' ≠ ⊤) (a b : ℕ) [CharP K a] [CharP K' a] [CharP (IsLocalRing.ResidueField V) b]
    [CharP (IsLocalRing.ResidueField V') b] :
    @ElementarilyEquivalent valLang K K' (valStructure K V) (valStructure K' V') :=
  sorry

end Layer1

/-! ## Layer 2: pseudo-Cauchy sequences -/

section Layer2

variable {K : Type*} [Field K] (V : ValuationSubring K)

/-- **2.1** A pseudo-Cauchy sequence: eventually `|a_k - a_j| < |a_j - a_i|` for `i < j < k`.
Defined for every linearly ordered index type; the theorems assume no largest element. -/
def IsPseudoCauchy {ι : Type*} [LinearOrder ι] (a : ι → K) : Prop :=
  ∃ i₀, ∀ i j k, i₀ ≤ i → i < j → j < k → V.valuation (a k - a j) < V.valuation (a j - a i)

/-- **2.1** `x` is a pseudolimit of `a`: `|x - a_i|` is eventually strictly decreasing. -/
def IsPseudoLimit {ι : Type*} [LinearOrder ι] (a : ι → K) (x : K) : Prop :=
  ∃ i₀, ∀ i j, i₀ ≤ i → i < j → V.valuation (x - a j) < V.valuation (x - a i)

/-- **2.1** If `x` is a pseudolimit of `a`, then `y` is one exactly when `|x - y|` is eventually
below `|x - a_i|`. `NoMaxOrder` is needed: on a one-point index every element is a pseudolimit. -/
theorem IsPseudoLimit.isPseudoLimit_iff {ι : Type*} [LinearOrder ι] [NoMaxOrder ι] {a : ι → K}
    {x : K} (hx : IsPseudoLimit V a x) (y : K) :
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
    (@ElementarilyEquivalent valLang K K' (valStructure K V) (valStructure K' V') ↔
      (IsLocalRing.ResidueField V ≅[Language.ring] IsLocalRing.ResidueField V') ∧
        (valueGroup V ≅[orderedGroup] valueGroup V')) :=
  sorry

/-- **5.7** AKE for unramified henselian fields of mixed characteristic `(0, p)` with perfect
residue field (van den Dries Thm. 7.1): `|p|` is the greatest value below `1`. -/
theorem elementarilyEquivalent_iff_of_unramified {K K' : Type} [Field K] [Field K'] [CharZero K]
    [CharZero K'] (p : ℕ) [Fact p.Prime] (V : ValuationSubring K) (V' : ValuationSubring K')
    [HenselianLocalRing V] [HenselianLocalRing V']
    [CharP (IsLocalRing.ResidueField V) p] [CharP (IsLocalRing.ResidueField V') p]
    [PerfectRing (IsLocalRing.ResidueField V) p] [PerfectRing (IsLocalRing.ResidueField V') p]
    (hV : ∀ x : K, V.valuation x < 1 → V.valuation x ≤ V.valuation (p : K))
    (hV' : ∀ x : K', V'.valuation x < 1 → V'.valuation x ≤ V'.valuation (p : K')) :
    (@ElementarilyEquivalent valLang K K' (valStructure K V) (valStructure K' V') ↔
      (IsLocalRing.ResidueField V ≅[Language.ring] IsLocalRing.ResidueField V') ∧
        (valueGroup V ≅[orderedGroup] valueGroup V')) :=
  sorry

/-- **5.8** AKE for finitely ramified henselian fields of mixed characteristic `(0, p)`, with any
residue fields (Basarab Cor. 3.2): finitely many values lie in `[|p|, 1)`, and the invariants are
the residue rings `O/𝔪ⁿ` and the value group. -/
theorem elementarilyEquivalent_iff_of_finitelyRamified {K K' : Type} [Field K] [Field K']
    [CharZero K] [CharZero K'] (p : ℕ) [Fact p.Prime] (V : ValuationSubring K)
    (V' : ValuationSubring K') [HenselianLocalRing V] [HenselianLocalRing V']
    [CharP (IsLocalRing.ResidueField V) p] [CharP (IsLocalRing.ResidueField V') p]
    (hV : {γ : V.ValueGroup | V.valuation (p : K) ≤ γ ∧ γ < 1}.Finite)
    (hV' : {γ : V'.ValueGroup | V'.valuation (p : K') ≤ γ ∧ γ < 1}.Finite) :
    (@ElementarilyEquivalent valLang K K' (valStructure K V) (valStructure K' V') ↔
      (∀ n : ℕ, (V ⧸ IsLocalRing.maximalIdeal V ^ n) ≅[Language.ring]
          (V' ⧸ IsLocalRing.maximalIdeal V' ^ n)) ∧
        (valueGroup V ≅[orderedGroup] valueGroup V')) :=
  sorry

end Layer5

/-! ## Layer 6: consequences -/

section Layer6

/-- The `p`-adic valuation subring of `ℚ_[p]`. -/
noncomputable abbrev padicValuationSubring (p : ℕ) [Fact p.Prime] : ValuationSubring ℚ_[p] :=
  (Padic.mulValuation (p := p)).valuationSubring

/-- **6.1** Ax–Kochen II, Ershov: a valued field is elementarily equivalent to `ℚ_p` exactly when it
is henselian of characteristic `0` with residue field `𝔽_p`, `|p|` the greatest value below `1`,
and value group elementarily equivalent to `ℤ`. -/
theorem elementarilyEquivalent_padic_iff (p : ℕ) [Fact p.Prime] {K : Type} [Field K]
    (V : ValuationSubring K) :
    (@ElementarilyEquivalent valLang K ℚ_[p] (valStructure K V)
        (valStructure ℚ_[p] (padicValuationSubring p)) ↔
      CharZero K ∧ HenselianLocalRing V ∧
        Nonempty (IsLocalRing.ResidueField V ≃+* ZMod p) ∧
        (∀ x : K, V.valuation x < 1 → V.valuation x ≤ V.valuation (p : K)) ∧
        (valueGroup V ≅[orderedGroup] Multiplicative ℤ)) :=
  sorry

/-- **6.1** The theory of `ℚ_p` is model complete (Ax–Kochen II, Thm. 4; Ershov 1965, Thm. 1):
every `valLang`-embedding between valued fields elementarily equivalent to `ℚ_p` is elementary. -/
theorem realize_embedding_of_elementarilyEquivalent_padic (p : ℕ) [Fact p.Prime] {K K' : Type}
    [Field K] [Field K'] (V : ValuationSubring K) (V' : ValuationSubring K')
    (hK : @ElementarilyEquivalent valLang K ℚ_[p] (valStructure K V)
      (valStructure ℚ_[p] (padicValuationSubring p)))
    (hK' : @ElementarilyEquivalent valLang K' ℚ_[p] (valStructure K' V')
      (valStructure ℚ_[p] (padicValuationSubring p)))
    (f : @Embedding valLang K K' (valStructure K V) (valStructure K' V')) {α : Type}
    (φ : valLang.Formula α) (x : α → K) :
    @Formula.Realize valLang K' (valStructure K' V') α φ (f ∘ x) ↔
      @Formula.Realize valLang K (valStructure K V) α φ x :=
  sorry

/-- **6.2** Ax–Kochen, Ershov (van den Dries 1.1): for fields of characteristic `0`, the power
series rings are elementarily equivalent as rings exactly when the coefficient fields are. -/
theorem elementarilyEquivalent_powerSeries_iff (k k' : Type) [Field k] [Field k'] [CharZero k]
    [CharZero k'] :
    PowerSeries k ≅[Language.ring] PowerSeries k' ↔ k ≅[Language.ring] k' :=
  sorry

end Layer6

end TauCetiRoadmap.AxKochenErshov
