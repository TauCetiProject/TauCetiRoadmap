import Mathlib

/-!
# Induction, restriction, and Mackey theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib already has the **functorial heart**: `Representation.ind`/`Rep.indFunctor`,
`Representation.coind`/`Rep.coindFunctor`, `Rep.resFunctor`, and the two adjunctions that are the
abstract Frobenius reciprocity, `Rep.indResAdjunction` (`Ind ⊣ Res`) and `Rep.resCoindAdjunction`
(`Res ⊣ Coind`), plus the finite-index `Rep.indCoindIso` and `Rep.resIndAdjunction`, the
coinvariants projection identity `Rep.coinvariantsTensorIndNatIso`, characters as traces
(`FDRep.character`), and the double-coset combinatorics (`DoubleCoset.Quotient`). See `README.md`
for the file-by-file map.

It does **not** have transitivity of induction, the projection formula as an isomorphism of
representations, the conjugate representation, finite-dimensionality of induction, the
induced-character formula, Frobenius reciprocity as a character pairing, the Mackey decomposition
formula, the Mackey irreducibility criterion, or Clifford theory. This file pins those.

The character side (`character_ind`, `frobenius_reciprocity`, `indTrivialIso`) feeds the
[character-theory roadmap](../CharacterTheory/README.md): induced and permutation characters populate
character tables, and its `characterPairing` is the pairing Frobenius reciprocity is stated against.
`README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

open CategoryTheory Limits MonoidalCategory
open scoped Pointwise Classical

universe u

/-! ## Layer 0: the functorial core -- transitivity and the projection formula

Over a commutative ring, on Mathlib's `Rep k G`, consuming `Rep.indResAdjunction` and
`Rep.resCoindAdjunction`. -/

section Functorial

variable {k : Type u} [CommRing k] {G : Type u} [Group G]

/-- **Transitivity of induction.** For nested subgroups `S ≤ T ≤ G`, inducing in one step agrees
with inducing through `T`; natural in `A`. Here `S.subtype = T.subtype.comp (Subgroup.inclusion h)`. -/
noncomputable def indTrans {S T : Subgroup G} (h : S ≤ T) (A : Rep k S) :
    Rep.ind T.subtype (Rep.ind (Subgroup.inclusion h) A) ≅ Rep.ind S.subtype A := sorry

/-- **Transitivity of coinduction**, the dual of `indTrans`, from `Rep.resCoindAdjunction` and
uniqueness of adjoints. -/
noncomputable def coindTrans {S T : Subgroup G} (h : S ≤ T) (A : Rep k S) :
    Rep.coind T.subtype (Rep.coind (Subgroup.inclusion h) A) ≅ Rep.coind S.subtype A := sorry

/-- **The projection formula (tensor identity)**: `Ind_S^G(A ⊗ Res_S B) ≅ (Ind_S^G A) ⊗ B` in
`Rep k G`. Mathlib's `Rep.coinvariantsTensorIndNatIso` is its image under coinvariants; this is the
representation-level statement, and it should be shown to recover that one. -/
noncomputable def indProjection {S : Subgroup G} (A : Rep k S) (B : Rep k G) :
    Rep.ind S.subtype (A ⊗ Rep.res S.subtype B) ≅ Rep.ind S.subtype A ⊗ B := sorry

/-! ## Layer 1: the conjugate representation (functorial part) -/

/-- **The conjugate representation** `{}^s A`. For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the
representation of the conjugated subgroup `s H s⁻¹` on `A.V` with `x : sHs⁻¹` acting by
`A.ρ ⟨s⁻¹ x s, _⟩`. The object every Mackey and Clifford summand is built from. -/
noncomputable def conjRep (s : G) {H : Subgroup G} (A : Rep k H) :
    Rep k (MulAut.conj s • H : Subgroup G) := sorry

end Functorial

/-! ## Layer 1 (character part) and Layer 2: induced characters and Frobenius reciprocity

Over an algebraically closed field with `char k ∤ |G|`; finite `G`. Connects to the
[character-theory roadmap](../CharacterTheory/README.md). -/

section Characters

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **The conjugate representation on `FDRep`**, so characters apply; an equivalence of categories
`FDRep k H ≌ FDRep k (sHs⁻¹)` preserving simplicity and dimension. -/
noncomputable def conjFDRep (s : G) {H : Subgroup G} (A : FDRep k H) :
    FDRep k (MulAut.conj s • H : Subgroup G) := sorry

/-- **The conjugate character** `({}^s χ)(x) = χ(s⁻¹ x s)`. -/
theorem conjFDRep_character (s : G) {H : Subgroup G} (A : FDRep k H)
    (x : (MulAut.conj s • H : Subgroup G)) (hx : s⁻¹ * (x : G) * s ∈ H) :
    (conjFDRep s A).character x = A.character ⟨s⁻¹ * (x : G) * s, hx⟩ := sorry

/-- **Induction of a finite-dimensional representation** of a finite-index subgroup, as an
`FDRep k G`. Its existence is the statement that `Rep.ind S.subtype` preserves finite-dimensionality;
compatible with `Rep.ind` under the forgetful functor. -/
noncomputable def indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) : FDRep k G := sorry

/-- **The degree of an induced representation** is the index times the degree. -/
theorem finrank_indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) :
    Module.finrank k (indFDRep A) = S.index * Module.finrank k A := sorry

/-- **The induced-character formula.** The value of the induced character at `g` sums `χ` over the
conjugates `x⁻¹ g x` that land in `S`, normalized by `|S|`. The character-theoretic workhorse. -/
theorem character_ind {S : Subgroup G} [S.FiniteIndex] [Fintype G] (A : FDRep k S) (g : G) :
    (indFDRep A).character g
      = (Nat.card S : k)⁻¹ * ∑ x : G,
          if h : x⁻¹ * g * x ∈ S then A.character ⟨x⁻¹ * g * x, h⟩ else 0 := sorry

/-- **The permutation representation.** Inducing the trivial representation gives the permutation
representation on cosets `k[G/H]`; its character at `g` counts the cosets fixed by `g`. -/
noncomputable def indTrivialIso {H : Subgroup G} :
    Rep.ind H.subtype (Rep.trivial k _ k : Rep k H) ≅ Rep.ofMulAction k G (G ⧸ H) := sorry

/-- **Frobenius reciprocity as a character identity**: the inner product of `Ind χ` with `ψ` over `G`
equals that of `χ` with `Res ψ` over `S`. A shadow of `Rep.indResAdjunction`. Stated with explicit
sums so it does not hard-depend on the `characterPairing` name of the character-theory roadmap. -/
theorem frobenius_reciprocity {S : Subgroup G} [S.FiniteIndex] [Fintype G] [Fintype S]
    (A : FDRep k S) (B : FDRep k G) :
    (Nat.card G : k)⁻¹ * ∑ g : G, (indFDRep A).character g * B.character g⁻¹
      = (Nat.card S : k)⁻¹ * ∑ s : S, A.character s * B.character ((s : G)⁻¹) := sorry

end Characters

/-! ## Layer 3: the Mackey decomposition formula

Over a commutative ring for the isomorphism; `H K : Subgroup G`. -/

section Mackey

variable {k : Type u} [CommRing k] {G : Type u} [Group G]

/-- **The Mackey summand** attached to a double coset `KsH ∈ K \ G / H`: the representation
`Ind_{K ∩ sHs⁻¹}^K (Res ({}^s A))` of `K`, built from `conjRep`, restriction, and induction, with a
chosen representative `Quotient.out`. -/
noncomputable def mackeySummand {H K : Subgroup G} (A : Rep k H)
    (t : DoubleCoset.Quotient (K : Set G) (H : Set G)) : Rep k K := sorry

/-- **The Mackey decomposition formula** (isomorphism form): restricting an induced representation to
`K` decomposes as a direct sum, over the double cosets `K \ G / H`, of induced conjugates. The central
structural theorem of the roadmap. -/
noncomputable def mackeyDecomp {H K : Subgroup G} [Fintype G]
    [Fintype (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    [DecidableEq (DoubleCoset.Quotient (K : Set G) (H : Set G))] (A : Rep k H)
    [HasFiniteBiproducts (Rep k K)] :
    Rep.res K.subtype (Rep.ind H.subtype A)
      ≅ ⨁ fun t : DoubleCoset.Quotient (K : Set G) (H : Set G) => mackeySummand A t := sorry

end Mackey

/-! ## Layer 4: the Mackey irreducibility criterion

Over an algebraically closed field with `char k ∤ |G|`; finite `G`. -/

section Irreducibility

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **Mackey disjointness at `s`**: the restrictions `Res_{H ⊓ sHs⁻¹} V` and `Res_{H ⊓ sHs⁻¹} ({}^s V)`
share no irreducible constituent (their intertwining space is `0`). Its definition pins the comparison
of the two restrictions across the conjugated subgroups; the work is in stating it correctly. -/
def MackeyDisjoint {H : Subgroup G} (V : FDRep k H) (s : G) : Prop := sorry

/-- **The Mackey irreducibility criterion.** `Ind_H^G V` is irreducible iff `V` is irreducible and for
every `s ∉ H` the restrictions of `V` and of `{}^s V` to `H ⊓ sHs⁻¹` are disjoint. Read off the
intertwining-number formula: the identity double coset contributes `dim End V`, every other term must
vanish. -/
theorem simple_indFDRep_iff {H : Subgroup G} [H.FiniteIndex] [Fintype G] (V : FDRep k H) :
    Simple (indFDRep V) ↔ Simple V ∧ ∀ s : G, s ∉ H → MackeyDisjoint V s := sorry

end Irreducibility

/-! ## Layer 5: Clifford theory over a normal subgroup

Over an algebraically closed field with `char k ∤ |G|`; finite `G`; `N : Subgroup G` normal. -/

section Clifford

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **Conjugation on `FDRep k N` for a normal subgroup.** Since `sNs⁻¹ = N` (`Normal.conj_smul_eq_self`),
`{}^s V` is again a representation of `N`; this is the `G`-action on `FDRep k N` used below. -/
noncomputable def conjNormal {N : Subgroup G} [N.Normal] (g : G) (V : FDRep k N) : FDRep k N := sorry

/-- **The inertia (stabilizer) group** of an irreducible `N`-representation, `{g : G | {}^g V ≅ V}`. -/
def inertia {N : Subgroup G} [N.Normal] (V : FDRep k N) : Subgroup G := sorry

theorem mem_inertia_iff {N : Subgroup G} [N.Normal] (V : FDRep k N) (g : G) :
    g ∈ inertia V ↔ Nonempty (conjNormal g V ≅ V) := sorry

/-- `N` always fixes `V`, so `N ≤ inertia V`. -/
theorem le_inertia {N : Subgroup G} [N.Normal] (V : FDRep k N) : N ≤ inertia V := sorry

/-- **Clifford's theorem** (character form): the restriction to a normal subgroup of an irreducible
`G`-representation is isotypic under the `G`-action, its constituents a single orbit with uniform
multiplicity `e`, indexed by a transversal `reps` of `inertia V` in `G`. -/
theorem clifford_restrict_character {N : Subgroup G} [N.Normal] [Fintype G]
    (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (e : ℕ) (reps : Finset G),
      ∀ n : N, W.character (n : G)
        = (e : k) * ∑ g ∈ reps, (conjNormal g V).character n := sorry

-- The **Clifford correspondence** (induction from `inertia V` is a bijection onto the irreducibles of
-- `G` lying over `V`) is the summit of this layer; see `README.md`. Stating the bijection precisely
-- needs the "lies over `V`" predicate and the inertia-group induction, built on the targets above.

end Clifford

end TauCetiRoadmap.RepresentationTheory.InductionRestriction
