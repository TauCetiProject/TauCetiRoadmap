module

public import Mathlib

/-!
# p-adically closed fields: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins p-valuations of p-rank `d` (through `Nat.card (V ⧸ (p)) = p ^ d`), p-valuations of
type `(e, f)`, p-adically closed fields, the Kochen operator, the language `pcLang d` of the
quantifier elimination theorem, and the headline theorems of Layers 1, 3, 4, 5 and 7.

`valLang`, `valStructure`, `valueGroup` and `padicValuationSubring` are copies of AxKochenErshov
0.1–0.2 and 6.1, and `IsPresburgerGroup` a copy of SaturationAndQuantifierElimination 3.3, which
own them.

The valued-field structure is passed explicitly, so each statement shows which valuation it is
about. The theorems take `K : Type`; the README puts no universe restriction on them.

Some layers are stated in `README.md` only, for want of a carrier at the pins:
- 0.2–0.3, the coarse valuation and the invariants of extensions, need the coarsening of
  LocalFieldsRamificationPartII §5.1;
- 2, the general embedding theorem, needs saturation, which is SaturationAndQuantifierElimination's
  Layer 0;
- 3.4, decidability, needs a coding of theories (SaturationAndQuantifierElimination §4.3);
- 6, the Nullstellensatz and Hilbert's seventeenth problem, needs the `π`-adic Kochen operator
  over a base, the Kochen ring and rational places of function fields.

Suggested homes: `TauCeti/RingTheory/Valuation/PValuation.lean`,
`TauCeti/ModelTheory/Algebra/ValuedField/PadicallyClosed.lean`.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicallyClosedFields

open FirstOrder FirstOrder.Language

/-! ## Copies of the suppliers' carriers -/

section Copies

/-- The divisibility relation symbol of `valLang` (AxKochenErshov 0.1). -/
inductive DvdRel : ℕ → Type
  | dvd : DvdRel 2

/-- AxKochenErshov's `valLang`: rings with a binary divisibility relation. -/
abbrev valLang : Language := Language.ring.sum ⟨fun _ => Empty, DvdRel⟩

/-- AxKochenErshov's divisibility of a valuation subring. -/
def ValuationSubring.Dvd {K : Type*} [Field K] (V : ValuationSubring K) (x y : K) : Prop :=
  ∃ a ∈ V, a * x = y

/-- AxKochenErshov's `valLang`-structure of a field with a valuation subring. -/
@[instance_reducible] noncomputable def valStructure (K : Type*) [Field K]
    (V : ValuationSubring K) : valLang.Structure K :=
  @Language.sumStructure _ _ K (FirstOrder.Ring.compatibleRingOfRing K).toStructure
    { funMap := fun {_} f => Empty.elim f
      RelMap := fun {n} r x => match n, r with | _, .dvd => ValuationSubring.Dvd V (x 0) (x 1) }

/-- AxKochenErshov's value group. -/
abbrev valueGroup {K : Type*} [Field K] (V : ValuationSubring K) : Type _ := V.ValueGroupˣ

/-- AxKochenErshov's `p`-adic valuation subring of `ℚ_[p]`. -/
noncomputable abbrev padicValuationSubring (p : ℕ) [Fact p.Prime] : ValuationSubring ℚ_[p] :=
  (Padic.mulValuation (p := p)).valuationSubring

/-- SaturationAndQuantifierElimination's `ℤ`-groups (its 3.3). -/
def IsPresburgerGroup (Γ : Type*) [CommGroup Γ] [LinearOrder Γ] : Prop :=
  ∃ ϖ : Γ, 1 < ϖ ∧ (∀ γ : Γ, 1 < γ → ϖ ≤ γ) ∧
    ∀ n : ℕ, 0 < n → ∀ γ : Γ, ∃ k < n, ∃ δ : Γ, γ = ϖ ^ k * δ ^ n

end Copies

/-! ## Layer 0: p-valuations -/

section Layer0

variable (p : ℕ) [Fact p.Prime] {K : Type*} [Field K]

/-- **0.1** A p-valuation of p-rank `d` (Prestel–Roquette p.13): `K` has characteristic `0`, and
`V / pV` has `p ^ d` elements with `d ≥ 1`, so that the residue characteristic is `p` and
`dim_{𝔽_p} V / pV = d`. -/
structure IsPValuation (d : ℕ) (V : ValuationSubring K) : Prop where
  charZero : CharZero K
  pos : 0 < d
  card_quotient : Nat.card (V ⧸ Ideal.span {(p : V)}) = p ^ d

/-- **0.1** A p-valuation of type `(e, f)` (p.93): `|p| < 1`, at most `e` values in `[|p|, 1)`,
and residue degree dividing `f`. Prestel–Roquette take `e, f ≥ 1`; the theorems below carry this as
hypotheses. -/
structure IsPValuationOfType (e f : ℕ) (V : ValuationSubring K) : Prop where
  charZero : CharZero K
  valuation_p_lt_one : V.valuation (p : K) < 1
  ramification_le : {γ : V.ValueGroup | V.valuation (p : K) ≤ γ ∧ γ < 1}.encard ≤ e
  residue_pow : ∀ x : IsLocalRing.ResidueField V, x ^ (p ^ f) = x

end Layer0

/-! ## Layer 1: p-adically closed fields -/

section Layer1

variable (p : ℕ) [Fact p.Prime]

/-- **1.1** A p-adically closed field of p-rank `d` (p.33): no proper algebraic extension carries a
p-valuation of p-rank `d` extending `V`. -/
def IsPadicallyClosed (d : ℕ) {K : Type} [Field K] (V : ValuationSubring K) : Prop :=
  IsPValuation p d V ∧
    ∀ (L : Type) [Field L] [Algebra K L] [Algebra.IsAlgebraic K L] (W : ValuationSubring L),
      W.comap (algebraMap K L) = V → IsPValuation p d W → Function.Surjective (algebraMap K L)

/-- **1.1** Characterization (Prestel–Roquette Thm. 3.1): a p-valued field is p-adically closed
exactly when it is henselian with a `ℤ`-group as value group. -/
theorem isPadicallyClosed_iff {d : ℕ} {K : Type} [Field K] {V : ValuationSubring K}
    (hV : IsPValuation p d V) :
    IsPadicallyClosed p d V ↔ HenselianLocalRing V ∧ IsPresburgerGroup (valueGroup V) :=
  sorry

/-- **1.2** Existence of p-adic closures (p.33). -/
theorem exists_padicClosure {d : ℕ} {K : Type} [Field K] {V : ValuationSubring K}
    (hV : IsPValuation p d V) :
    ∃ (L : Type) (_ : Field L) (_ : Algebra K L) (W : ValuationSubring L),
      Algebra.IsAlgebraic K L ∧ W.comap (algebraMap K L) = V ∧ IsPadicallyClosed p d W :=
  sorry

/-- **1.2** Uniqueness of p-adic closures (Thm. 3.2): the p-adic closures of `K` are unique up to
`K`-isomorphism of valued fields exactly when the value group of `K` is a `ℤ`-group. -/
theorem isPresburgerGroup_iff_padicClosure_unique {d : ℕ} {K : Type} [Field K]
    {V : ValuationSubring K} (hV : IsPValuation p d V) :
    IsPresburgerGroup (valueGroup V) ↔
      ∀ (L L' : Type) [Field L] [Field L'] [Algebra K L] [Algebra K L'] [Algebra.IsAlgebraic K L]
        [Algebra.IsAlgebraic K L'] (W : ValuationSubring L) (W' : ValuationSubring L'),
        W.comap (algebraMap K L) = V → W'.comap (algebraMap K L') = V →
        IsPadicallyClosed p d W → IsPadicallyClosed p d W' →
        ∃ σ : L ≃ₐ[K] L', W'.comap (σ : L →+* L') = W :=
  sorry

/-- **1.3** A subfield algebraically closed in a p-adically closed field is p-adically closed of
the same p-rank (Thm. 3.4). -/
theorem isPadicallyClosed_comap_of_forall_isAlgebraic {d : ℕ} {L : Type} [Field L]
    {W : ValuationSubring L} (hW : IsPadicallyClosed p d W) (S : Subfield L)
    (hS : ∀ x : L, IsAlgebraic S x → x ∈ S) :
    IsPadicallyClosed p d (W.comap S.subtype) :=
  sorry

/-- **1.5** Isomorphism Theorem (Cor. 3.11): henselian algebraic extensions of the p-rank of `K`
are `K`-isomorphic as valued fields exactly when the same elements of `K` become `n`-th powers. -/
theorem nonempty_algEquiv_iff {d : ℕ} {K L L' : Type} [Field K] [Field L] [Field L']
    [Algebra K L] [Algebra K L'] [Algebra.IsAlgebraic K L] [Algebra.IsAlgebraic K L']
    {V : ValuationSubring K} {W : ValuationSubring L} {W' : ValuationSubring L'}
    (hV : IsPValuation p d V) (hW : IsPValuation p d W) (hW' : IsPValuation p d W')
    [HenselianLocalRing W] [HenselianLocalRing W']
    (hWV : W.comap (algebraMap K L) = V) (hW'V : W'.comap (algebraMap K L') = V) :
    (∃ σ : L ≃ₐ[K] L', W'.comap (σ : L →+* L') = W) ↔
      ∀ (n : ℕ) (a : K), (∃ x : L, x ^ n = algebraMap K L a) ↔ (∃ x : L', x ^ n = algebraMap K L' a) :=
  sorry

/-- **1.1** A finite extension of `ℚ_p` of degree `d`, with the prolongation of `ℤ_p`, is
p-adically closed of p-rank `d`. -/
theorem isPadicallyClosed_of_finiteDimensional {F : Type} [Field F] [Algebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] (W : ValuationSubring F)
    (hW : W.comap (algebraMap ℚ_[p] F) = padicValuationSubring p) :
    IsPadicallyClosed p (Module.finrank ℚ_[p] F) W :=
  sorry

end Layer1

/-! ## Layer 3: model theory -/

section Layer3

variable (p : ℕ) [Fact p.Prime]

/-- **3.2** Model completeness (Thm. 5.1): every `valLang`-embedding between p-adically closed
fields of p-rank `d` is elementary. -/
theorem realize_embedding_of_isPadicallyClosed {d : ℕ} {K L : Type} [Field K] [Field L]
    {V : ValuationSubring K} {W : ValuationSubring L} (hV : IsPadicallyClosed p d V)
    (hW : IsPadicallyClosed p d W)
    (f : @Embedding valLang K L (valStructure K V) (valStructure L W)) {α : Type}
    (φ : valLang.Formula α) (x : α → K) :
    @Formula.Realize valLang L (valStructure L W) α φ (f ∘ x) ↔
      @Formula.Realize valLang K (valStructure K V) α φ x :=
  sorry

/-- **3.3** Every p-adically closed field of p-rank `d` is elementarily equivalent to a finite
extension of `ℚ_p` of degree `d`. -/
theorem exists_elementarilyEquivalent_finiteDimensional {d : ℕ} {K : Type} [Field K]
    {V : ValuationSubring K} (hV : IsPadicallyClosed p d V) :
    ∃ (F : Type) (_ : Field F) (_ : Algebra ℚ_[p] F) (_ : FiniteDimensional ℚ_[p] F)
      (W : ValuationSubring F), Module.finrank ℚ_[p] F = d ∧
        W.comap (algebraMap ℚ_[p] F) = padicValuationSubring p ∧
        @ElementarilyEquivalent valLang K F (valStructure K V) (valStructure F W) :=
  sorry

/-- **3.3** Completions: p-adically closed fields of p-rank `d` are elementarily equivalent
exactly when their relative algebraic closures of `ℚ` are isomorphic as valued fields. -/
theorem elementarilyEquivalent_iff_algebraicPart {d : ℕ} {K K' : Type} [Field K] [Field K']
    [CharZero K] [CharZero K'] {V : ValuationSubring K} {V' : ValuationSubring K'} (hV : IsPadicallyClosed p d V)
    (hV' : IsPadicallyClosed p d V') :
    @ElementarilyEquivalent valLang K K' (valStructure K V) (valStructure K' V') ↔
      ∃ σ : (algebraicClosure ℚ K) ≃+* (algebraicClosure ℚ K'),
        (V'.comap (algebraicClosure ℚ K').toSubfield.subtype).comap (σ : _ →+* _) =
          V.comap (algebraicClosure ℚ K).toSubfield.subtype :=
  sorry

end Layer3

/-! ## Layer 4: quantifier elimination -/

section Layer4

/-- The constant symbols `u₁, …, u_d` of `pcLang d`. -/
inductive BasisConst (d : ℕ) : ℕ → Type
  | u (i : Fin d) : BasisConst d 0

/-- The power predicates `Pₙ` of `pcLang d`. -/
inductive PowRel : ℕ → Type
  | pow (n : ℕ) : PowRel 1

/-- **4** The language of the quantifier elimination theorem: `valLang` with constants for an
`𝔽_p`-basis of `O/pO` and predicates `Pₙ(x) :↔ ∃ y, yⁿ = x`. -/
abbrev pcLang (d : ℕ) : Language := valLang.sum ⟨BasisConst d, PowRel⟩

/-- **4** The `pcLang d`-structure of a valued field with chosen elements `u : Fin d → K`. -/
@[instance_reducible] noncomputable def pcStructure (d : ℕ) (K : Type*) [Field K]
    (V : ValuationSubring K) (u : Fin d → K) : (pcLang d).Structure K :=
  @Language.sumStructure _ _ K (valStructure K V)
    { funMap := fun {n} f _ => match n, f with | _, .u i => u i
      RelMap := fun {n} r x => match n, r with | _, .pow k => ∃ y : K, y ^ k = x 0 }

/-- **4** `u` is an `𝔽_p`-basis of `V / pV`: the `𝔽_p`-combinations of the `u i` meet every class
exactly once. -/
def IsResidueBasis (p d : ℕ) {K : Type*} [Field K] (V : ValuationSubring K) (u : Fin d → V) :
    Prop :=
  Function.Bijective fun c : Fin d → Fin p =>
    Ideal.Quotient.mk (Ideal.span {(p : V)}) (∑ i, ((c i : ℕ) : V) * u i)

/-- **4** Quantifier elimination (Prestel–Roquette Thm. 5.6; Macintyre Thm. 1 for `d = 1`): every
`pcLang d`-formula is equivalent, in all p-adically closed fields of p-rank `d` with a residue
basis, to a quantifier-free one. -/
theorem exists_isQF_iff (p : ℕ) [Fact p.Prime] (d : ℕ) {α : Type} (φ : (pcLang d).Formula α) :
    ∃ ψ : (pcLang d).Formula α, ψ.IsQF ∧
      ∀ (K : Type) [Field K] (V : ValuationSubring K) (u : Fin d → V),
        IsPadicallyClosed p d V → IsResidueBasis p d V u → ∀ x : α → K,
          (@Formula.Realize _ K (pcStructure d K V (fun i => (u i : K))) α φ x ↔
            @Formula.Realize _ K (pcStructure d K V (fun i => (u i : K))) α ψ x) :=
  sorry

end Layer4

/-! ## Layer 5: the Kochen operator -/

section Layer5

variable (p : ℕ) [Fact p.Prime] {K : Type*} [Field K]

/-- **5** The p-adic Kochen operator of type `(e, f)` (p.92):
`γ(x) = p⁻¹ · [(x^q − x) − (x^q − x)⁻¹]^(−e)`, `q = p^f`, for `e, f ≥ 1`. Where `(x^q − x)² = 1`
the operator has a pole and this function takes the value `0`. -/
noncomputable def kochen (e f : ℕ) (x : K) : K :=
  (p : K)⁻¹ * ((x ^ p ^ f - x) - (x ^ p ^ f - x)⁻¹)⁻¹ ^ e

/-- **5** Lem. 6.1: a valuation is a p-valuation of type `(e, f)` exactly when `|p| < 1` and the
Kochen operator has no pole and is integral on `K`. -/
theorem isPValuationOfType_iff [CharZero K] (e f : ℕ) (he : 0 < e) (hf : 0 < f)
    (V : ValuationSubring K) :
    IsPValuationOfType p e f V ↔
      V.valuation (p : K) < 1 ∧
        ∀ x : K, ((x ^ p ^ f - x) ^ 2 ≠ 1 ∧ kochen p e f x ∈ V) :=
  sorry

/-- **5** Thm. 6.15 for `e = 1`: the valuation ring of a henselian p-valuation of type `(1, f)` is
the image of the Kochen operator, so it is existentially `∅`-definable in the ring language. -/
theorem range_kochen_eq [CharZero K] (f : ℕ) (hf : 0 < f) (V : ValuationSubring K)
    [HenselianLocalRing V]
    (hV : IsPValuationOfType p 1 f V) :
    Set.range (kochen p 1 f) = (V : Set K) :=
  sorry

end Layer5

/-! ## Layer 7: absolute Galois groups -/

section Layer7

/-- **7** The absolute Galois group of a p-adically closed field of p-rank `d` is that of a finite
extension of `ℚ_p` of degree `d` (Efrat Rem. 4.4). -/
theorem exists_absoluteGaloisGroup_equiv (p : ℕ) [Fact p.Prime] {d : ℕ} {K : Type} [Field K]
    {V : ValuationSubring K} (hV : IsPadicallyClosed p d V) :
    ∃ (F : Type) (_ : Field F) (_ : Algebra ℚ_[p] F) (_ : FiniteDimensional ℚ_[p] F),
      Module.finrank ℚ_[p] F = d ∧
        Nonempty (Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup F) :=
  sorry

end Layer7

end TauCetiRoadmap.PadicallyClosedFields
