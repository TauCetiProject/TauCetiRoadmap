import TauCeti.RepresentationTheory.Invariants
import TauCeti.RepresentationTheory.CharacterTable.FixedPointCount
import TauCeti.RepresentationTheory.Induction.Transitivity
import TauCeti.RepresentationTheory.Induction.Projection
import TauCeti.RepresentationTheory.Induction.Conjugate
import TauCeti.RepresentationTheory.Induction.Character
import TauCeti.RepresentationTheory.Induction.FrobeniusReciprocity
import TauCeti.RepresentationTheory.Induction.Mackey.Decomposition
import TauCeti.RepresentationTheory.Induction.Inertia
import TauCeti.RepresentationTheory.Induction.Clifford.Obstruction
import TauCeti.RepresentationTheory.Induction.Artin.Basic
import TauCeti.RepresentationTheory.Induction.Artin.Corollary
import TauCeti.RepresentationTheory.Induction.Brauer.Characterization
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Basic
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
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

Tau Ceti supplies transitivity, projection, conjugation, finite induction, character and
reciprocity formulas, the native Mackey direct sum and substantial Clifford/projective APIs.
This prototype instantiates native objects before stating the remaining selected-model,
general-field and example comparisons. The README pins their exact scopes.

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
    Rep.ind T.subtype (Rep.ind (Subgroup.inclusion h) A) ≅ Rep.ind S.subtype A := by
  simpa using (TauCeti.Rep.indFunctorCompIso (Subgroup.inclusion h) T.subtype).app A

/-- **Transitivity of coinduction**, the dual of `indTrans`, from `Rep.resCoindAdjunction` and
uniqueness of adjoints. -/
noncomputable def coindTrans {S T : Subgroup G} (h : S ≤ T) (A : Rep k S) :
    Rep.coind T.subtype (Rep.coind (Subgroup.inclusion h) A) ≅ Rep.coind S.subtype A := by
  simpa using (TauCeti.Rep.coindFunctorCompIso (Subgroup.inclusion h) T.subtype).app A

/-- **The projection formula (tensor identity)**: `Ind_S^G(A ⊗ Res_S B) ≅ (Ind_S^G A) ⊗ B` in
`Rep k G`. Mathlib's `Rep.coinvariantsTensorIndNatIso` is its image under coinvariants; this is the
representation-level statement, and it should be shown to recover that one. -/
noncomputable def indProjection {S : Subgroup G} (A : Rep k S) (B : Rep k G) :
    Rep.ind S.subtype (A ⊗ Rep.res S.subtype B) ≅ Rep.ind S.subtype A ⊗ B := TauCeti.indProjection S.subtype A B

/-! ## Layer 1: the conjugate representation (functorial part) -/

/-- **The conjugation convention, fixed once.** `MulAut.conj s • H` is `sHs⁻¹`: its membership unfolds via
`Subgroup.mem_pointwise_smul_iff_inv_smul_mem` to `s⁻¹ * x * s ∈ H`. Every conjugate action and character
below is read off this lemma, so the layer cannot be silently orientation-reversed. -/
theorem mem_conj_smul (s : G) (H : Subgroup G) (x : G) :
    x ∈ (MulAut.conj s • H : Subgroup G) ↔ s⁻¹ * x * s ∈ H := TauCeti.mem_conj_smul s H x

/-- **The conjugate representation** `{}^s A`. For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the
representation of the conjugated subgroup `s H s⁻¹` on `A.V` with `x : sHs⁻¹` acting by
`A.ρ ⟨s⁻¹ x s, _⟩` (the membership proof from `mem_conj_smul`). The object every Mackey and Clifford
summand is built from. -/
noncomputable def conjRep (s : G) {H : Subgroup G} (A : Rep k H) :
    Rep k (MulAut.conj s • H : Subgroup G) := TauCeti.conjRep s A

end Functorial

/-! ## Layer 1 (character part) and Layer 2: induced characters and Frobenius reciprocity

The finite-index character formula is over every field; normalized reciprocity takes hG. Connects to the
[character-theory roadmap](../CharacterTheory/README.md). -/

section Characters

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **The conjugate representation on `FDRep`**, so characters apply; an equivalence of categories
`FDRep k H ≌ FDRep k (sHs⁻¹)` preserving simplicity and dimension. -/
noncomputable def conjFDRep (s : G) {H : Subgroup G} (A : FDRep k H) :
    FDRep k (MulAut.conj s • H : Subgroup G) := TauCeti.conjFDRep s A

/-- **The conjugate character** `({}^s χ)(x) = χ(s⁻¹ x s)`. -/
theorem conjFDRep_character (s : G) {H : Subgroup G} (A : FDRep k H)
    (x : (MulAut.conj s • H : Subgroup G)) :
    (conjFDRep s A).character x
      = A.character ⟨s⁻¹ * (x : G) * s, (mem_conj_smul s H x).mp x.2⟩ := TauCeti.char_conjFDRep_mk s A x

/-- **Induction of a finite-dimensional representation** of a finite-index subgroup, as an
`FDRep k G`. Its existence is the statement that `Rep.ind S.subtype` preserves finite-dimensionality;
compatible with `Rep.ind` under the forgetful functor. -/
noncomputable def indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) : FDRep k G := TauCeti.indFDRep A

/-- **The degree of an induced representation** is the index times the degree. -/
theorem finrank_indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) :
    Module.finrank k (indFDRep A) = S.index * Module.finrank k A := TauCeti.finrank_indFDRep A

/-- **The induced-character formula (coset-representative form).** Over any field, the induced character at
`g` is the sum over coset representatives `t : G ⧸ S` of `χ(t⁻¹ g t)` for those `t` whose `t⁻¹ g t` lands
in `S`, with no division by `|S|`. Well-defined because `A.character` is a class function on `S`. The
primary character-theoretic workhorse; the averaged form below is a corollary. -/
theorem character_indFDRep_sum_quotient {S : Subgroup G} [S.FiniteIndex] [Fintype (G ⧸ S)]
    (A : FDRep k S) (g : G) :
    (indFDRep A).character g
      = ∑ t : G ⧸ S,
          if h : (Quotient.out t)⁻¹ * g * Quotient.out t ∈ S then
            A.character ⟨(Quotient.out t)⁻¹ * g * Quotient.out t, h⟩ else 0 := by
  classical
  change (TauCeti.indFDRep A).character g = _
  refine (TauCeti.character_indFDRep_sum_quotient A g).trans ?_
  apply Finset.sum_congr
  · ext t
    simp
  · intro t ht
    rfl

/-- **The induced-character formula (averaged group-sum form).** For `[Fintype G]` and
`IsUnit (Nat.card S : k)` (equivalently `char k ∤ |S|`), the coset-representative sum equals the averaged
sum over all of `G`, normalized by `|S|`. Without the invertibility hypothesis the factor `(Nat.card S)⁻¹`
is meaningless and one uses `character_indFDRep_sum_quotient` instead. Orientation caveat (a real
proof obligation, not a convention choice): Mathlib's `Rep.ind` is built as coinvariants of
`k[H] ⊗ A`, so the left/right-coset side and the `t⁻¹gt` vs `tgt⁻¹` orientation of both character
formulas must be derived against that concrete model, not assumed. -/
theorem character_ind {S : Subgroup G} [S.FiniteIndex] [Fintype G]
    (hS : IsUnit (Nat.card S : k)) (A : FDRep k S) (g : G) :
    (indFDRep A).character g
      = (Nat.card S : k)⁻¹ * ∑ x : G,
          if h : x⁻¹ * g * x ∈ S then A.character ⟨x⁻¹ * g * x, h⟩ else 0 := TauCeti.character_ind hS A g

/-- **The permutation representation.** Inducing the trivial representation along `H.subtype` gives the
left-coset permutation representation `k[G ⧸ H]` on Mathlib's quotient `G ⧸ H`, with `G` acting by left
translation; its character at `g` counts the cosets fixed by `g`. -/
noncomputable def indTrivialIso {H : Subgroup G} :
    Rep.ind H.subtype (Rep.trivial k _ k : Rep k H) ≅ Rep.ofMulAction k G (G ⧸ H) :=
  TauCeti.indTrivialIso k H

/-- **Frobenius reciprocity as a character identity**: the inner product of `Ind χ` with `ψ` over `G`
equals that of `χ` with `Res ψ` over `S`. A shadow of `Rep.indResAdjunction`. Regime 3: the `IsUnit`
hypothesis makes the averaging factors meaningful. Stated with explicit sums so it does not hard-depend on
the `characterPairing` name of the character-theory roadmap. -/
theorem frobenius_reciprocity {S : Subgroup G} [S.FiniteIndex] [Fintype G]
    (hG : IsUnit (Nat.card G : k)) (A : FDRep k S) (B : FDRep k G) :
    (Nat.card G : k)⁻¹ * ∑ g : G, (indFDRep A).character g * B.character g⁻¹
      = (Nat.card S : k)⁻¹ * ∑ s : S, A.character s * B.character ((s : G)⁻¹) := TauCeti.frobenius_reciprocity hG A B

end Characters

/-! ## Layer 3: the Mackey decomposition formula

Over a commutative ring for the isomorphism; `H K : Subgroup G`. -/

section Mackey

variable {k : Type u} [CommRing k] {G : Type u} [Group G]

/-- **The Mackey subgroup** `K ⊓ sHs⁻¹` where the double-coset summand lives; it carries the two
inclusions `mackeySubgroup s H K ≤ K` (induce up) and `mackeySubgroup s H K ≤ MulAut.conj s • H`
(restrict the conjugate down). There is no second intersection with `K`. -/
def mackeySubgroup (s : G) (H K : Subgroup G) : Subgroup G :=
  TauCeti.mackeySubgroup s H K

/-- **The Mackey summand** attached to a double coset `KsH ∈ K \ G / H`: restrict the conjugate `{}^s A`
(living on `sHs⁻¹`) along `mackeySubgroup s H K ≤ MulAut.conj s • H`, then induce along
`mackeySubgroup s H K ≤ K`. Built from a fixed representative `s = Quotient.out t`; no canonical
representative-independence is asserted. -/
noncomputable def mackeySummand {H K : Subgroup G} (A : Rep k H)
    (t : DoubleCoset.Quotient (K : Set G) (H : Set G)) : Rep k K := _root_.Rep.mackeySummand H K (Quotient.out t) A

/-- Selected categorical-biproduct comparison for the native linear direct-sum representation.
The arbitrary-group native Mackey theorem is already implemented; only this chosen finite
categorical display is the new adapter. -/
noncomputable def mackeyDirectSumIsoBiproduct {H K : Subgroup G}
    [Fintype G] [Fintype (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    [DecidableEq (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    (A : Rep k H) [HasFiniteBiproducts (Rep k K)] :
    _root_.Rep.mackeyDirectSum H K A ≅
      ⨁ fun t : DoubleCoset.Quotient (K : Set G) (H : Set G) => mackeySummand A t := by
  sorry

/-- **The Mackey decomposition formula** (isomorphism form): restricting an induced representation to
`K` decomposes as a direct sum, over the double cosets `K \ G / H`, of induced conjugates. The central
structural theorem of the roadmap. -/
noncomputable def mackeyDecomp {H K : Subgroup G} [Fintype G]
    [Fintype (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    [DecidableEq (DoubleCoset.Quotient (K : Set G) (H : Set G))] (A : Rep k H)
    [HasFiniteBiproducts (Rep k K)] :
    Rep.res K.subtype (Rep.ind H.subtype A)
      ≅ ⨁ fun t : DoubleCoset.Quotient (K : Set G) (H : Set G) => mackeySummand A t := _root_.Rep.mackeyDecomposition A ≪≫ mackeyDirectSumIsoBiproduct A

end Mackey

/-! ## Layer 4: the Mackey irreducibility criterion

All-field Hom and disjointness interfaces remain general. Semisimple irreducibility
criteria carry `IsUnit (Nat.card G : k)`. The iff forms additionally take the
scalar-Schur output of a splitting field explicitly, with no new field class and no
characteristic-zero restriction. The README owns its split-algebra comparison and
positive-characteristic k-linear Hom-decomposition proof route. -/

section Irreducibility

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **Mackey disjointness at `s`** is vanishing of the actual Hom space between
`Res_{H ⊓ sHs⁻¹} V` and `Res_{H ⊓ sHs⁻¹} ({}^s V)`. Under Maschke this is
equivalent to absence of a common simple constituent. The definition itself is
available over every field and pins transport across the conjugated subgroups. -/
def MackeyDisjoint {H : Subgroup G} (V : FDRep k H) (s : G) : Prop :=
  ∀ φ : (Action.res (FGModuleCat k)
          (Subgroup.inclusion (inf_le_left : mackeySubgroup s H H ≤ H))).obj V ⟶
        (Action.res (FGModuleCat k)
          (Subgroup.inclusion
            (inf_le_right : mackeySubgroup s H H ≤ MulAut.conj s • H))).obj (conjFDRep s V),
    φ = 0

/-- Algebraic closure supplies the native scalar-Schur output; no finiteness of G
or characteristic-zero assumption is needed for this implication. -/
theorem scalarSchur_of_isAlgClosed [IsAlgClosed k] :
    ∀ (W : FDRep k G), Simple W → Module.finrank k (W ⟶ W) = 1 := by
  intro W _
  exact CategoryTheory.finrank_endomorphism_simple_eq_one k W

/-- **The Mackey iff criterion over double cosets.** Maschke and scalar-Schur
hypotheses are separate. The README proves scalar-Schur equivalent to split k[G]
under hG, and obtains the ℕ Hom-dimension formula from a k-linear direct sum. -/
theorem simple_indFDRep_iff_doubleCoset {H : Subgroup G} [H.FiniteIndex] [Fintype G]
    [Fintype (DoubleCoset.Quotient (H : Set G) (H : Set G))]
    (hG : IsUnit (Nat.card G : k))
    (hSplitG : ∀ (W : FDRep k G), Simple W → Module.finrank k (W ⟶ W) = 1)
    (V : FDRep k H) :
    Simple (indFDRep V) ↔ Simple V ∧
      ∀ t : DoubleCoset.Quotient (H : Set G) (H : Set G),
        Quotient.out t ∉ H → MackeyDisjoint V (Quotient.out t) := sorry

/-- The same hG/hSplitG criterion quantified over all s outside H, obtained by
transporting actual Mackey Hom spaces along a change of representative. -/
theorem simple_indFDRep_iff {H : Subgroup G} [H.FiniteIndex] [Fintype G]
    (hG : IsUnit (Nat.card G : k))
    (hSplitG : ∀ (W : FDRep k G), Simple W → Module.finrank k (W ⟶ W) = 1)
    (V : FDRep k H) :
    Simple (indFDRep V) ↔ Simple V ∧ ∀ s : G, s ∉ H → MackeyDisjoint V s := sorry

/-- **General-field sufficient criterion.** The induced endomorphism algebra is
identified with End_H(V) when the off-identity Mackey spaces vanish. Arbitrary-field
Schur and Maschke then prove simplicity, without hSplitG or algebraic closure. -/
theorem simple_indFDRep_of_mackeyDisjoint {H : Subgroup G} [H.FiniteIndex] [Fintype G]
    (hG : IsUnit (Nat.card G : k)) (V : FDRep k H) (hV : Simple V)
    (hdisj : ∀ s : G, s ∉ H → MackeyDisjoint V s) :
    Simple (indFDRep V) := sorry

/-- **General-field division criterion.** Nontriviality excludes the zero object;
Maschke is essential for the converse. Use the native categorical End ring rather
than asserting that a nonsplitting-field irreducible has scalar endomorphisms. -/
theorem simple_indFDRep_iff_end_isUnit {H : Subgroup G} [H.FiniteIndex] [Fintype G]
    (hG : IsUnit (Nat.card G : k)) (V : FDRep k H) :
    Simple (indFDRep V) ↔
      Nontrivial (CategoryTheory.End (indFDRep V)) ∧
        ∀ f : CategoryTheory.End (indFDRep V), f ≠ 0 → IsUnit f := sorry

end Irreducibility

/-! ## Layer 5: Clifford theory over a normal subgroup

The conjugation and inertia interfaces below work over every field and arbitrary `G`.
The local character consequence assumes finite `G` and a simple `W`, still over every field.
The README owns the structural constituent/isotypic data and splitting-field/model comparisons.
Native `TauCeti.clifford_restrict_character` supplies the algebraically closed Maschke
specialization; native `FDRep.cliffordCorrespondence` supplies its algebraically closed
characteristic-zero specialization. -/

section Clifford

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **Conjugation on `FDRep k N` for a normal subgroup.** Since `sNs⁻¹ = N` (`Normal.conj_smul_eq_self`),
`{}^s V` is again a representation of `N`; this is the `G`-action on `FDRep k N` used below. -/
noncomputable def conjNormal {N : Subgroup G} [N.Normal] (g : G) (V : FDRep k N) : FDRep k N := TauCeti.conjNormalFDRep g V

/-- **The inertia (stabilizer) group** of an irreducible `N`-representation, `{g : G | {}^g V ≅ V}`. -/
noncomputable def inertia {N : Subgroup G} [N.Normal] (V : FDRep k N) : Subgroup G := TauCeti.inertia V

theorem mem_inertia_iff {N : Subgroup G} [N.Normal] (V : FDRep k N) (g : G) :
    g ∈ inertia V ↔ Nonempty (conjNormal g V ≅ V) := TauCeti.mem_inertia_iff

/-- `N` always fixes `V`, so `N ≤ inertia V`. -/
theorem le_inertia {N : Subgroup G} [N.Normal] (V : FDRep k N) : N ≤ inertia V := TauCeti.le_inertia V

/-- **Clifford's theorem, character consequence.** Over every field, structural Clifford
restriction for a simple finite-dimensional `W` supplies a simple `V`, a nonzero natural
multiplicity `e`, and a genuine left transversal `reps` of `inertia V`; taking traces gives
this identity. In positive characteristic the identity sees only `(e : k)` and does not
recover the natural multiplicity. The README owns the structural constituent/isotypic data
and actual uniform multiplicity. Native `TauCeti.clifford_restrict_character` supplies its
algebraically closed Maschke specialization; this broader local target uses the
arbitrary-field structural restriction route. -/
theorem clifford_restrict_character {N : Subgroup G} [N.Normal] [Fintype G]
    (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (e : ℕ) (reps : Finset G),
      e ≠ 0 ∧
      (∀ g : G, ∃! r, r ∈ reps ∧ g⁻¹ * r ∈ inertia V) ∧
      ∀ n : N, W.character (n : G)
        = (e : k) * ∑ g ∈ reps, (conjNormal g V).character n := sorry

-- The README specifies structural Clifford correspondence and the remaining general
-- splitting-field/model comparisons on actual "lies over V" and inertia-induction carriers.
-- Consume native `FDRep.cliffordCorrespondence` in its algebraically closed characteristic-zero
-- scope. This representative prototype does not restate that carrier-level equivalence.

end Clifford

/-! ## Layer 6: the virtual-character ring, Artin and Brauer induction

Over `ℂ` (or an algebraically closed field of characteristic `0`, or one containing the `e`-th roots of
unity); finite `G`. Consumes Layer 2's induced-character formula and connects to the
[character-theory roadmap](../CharacterTheory/README.md). -/

section ArtinBrauer

variable {k : Type u} [Field k] {G : Type u} [Group G]

/-- **The induced class function** `Ind_H^G f : G → k` of `f : H → k`, the linearization of the
induced-character formula (`character_ind` computes it on genuine characters); the map turning `R(H) → R(G)`
into a module homomorphism over `R(G)` by the projection formula (Layer 0). -/
noncomputable def indClassFun {H : Subgroup G} [Fintype G] (f : H → k) : G → k := Subgroup.indClassFun H f

/-- **The virtual-character lattice** in the class functions: the additive subgroup of `G → k` spanned by
the characters of `FDRep k G` (closed under the tensor-product product `char_tensor`). The primary object
is the Grothendieck ring `R(G)` of `FDRep k G` under direct sum and tensor product; over a
characteristic-`0` splitting field the character map embeds `R(G)` into `G → k` with this lattice as image.
An `AddSubgroup` (not a raw `Subring (G → k)`), which over positive characteristic would not record the
lattice structure. -/
noncomputable def virtualCharacters : AddSubgroup (G → k) := TauCeti.virtualCharacters k G

/-- **Elementary subgroups.** `IsElementary H` holds when `H` is `p`-elementary for some prime `p`, i.e. a
direct product `C × P` of a cyclic group of order prime to `p` and a `p`-group. Use the native underlying-group `TauCeti.IsElementary` predicate; the local call shape takes a subgroup. -/
def IsElementary (H : Subgroup G) : Prop := TauCeti.IsElementary H

/-- The native underlying-group predicate has exactly the selected internal subgroup meaning. -/
theorem isElementary_iff_internal (H : Subgroup G) :
    IsElementary H ↔ ∃ p : ℕ, p.Prime ∧ ∃ C P : Subgroup H,
      IsCyclic C ∧ IsPGroup p P ∧ ¬ p ∣ Nat.card C ∧
        (∀ c ∈ C, ∀ q ∈ P, Commute c q) ∧ C.IsComplement' P := by
  change TauCeti.IsElementary H ↔ _
  rw [TauCeti.isElementary_def]
  constructor
  · rintro ⟨p, hp, hE⟩
    rcases TauCeti.isPElementary_def.mp hE with
      ⟨C, P, hC, hCp, hP, hcomm, hcompl⟩
    exact ⟨p, hp, C, P, hC, hP, hCp, hcomm, hcompl⟩
  · rintro ⟨p, hp, C, P, hC, hP, hCp, hcomm, hcompl⟩
    exact ⟨p, hp, TauCeti.isPElementary_def.mpr
      ⟨C, P, hC, hCp, hP, hcomm, hcompl⟩⟩

/-- Inclusion of the native irreducible-matrix-character lattice into the selected raw FDRep
character span. This is only a basis/bundling comparison, not an Artin or Brauer theorem. -/
theorem nativeIndCharacterSpan_le_raw [Fintype G] (P : Subgroup G → Prop) :
    TauCeti.ClassFunction.indCharacterSpanInt k G P ≤
      AddSubgroup.closure { f : G → k | ∃ C : Subgroup G, P C ∧
        ∃ ψ : FDRep k C, f = indClassFun ψ.character } := by
  sorry

/-- **Artin's induction theorem.** Over an algebraically closed characteristic-`0` field (the README's
declared regime for this layer; Artin is more field-robust than Brauer, but the regime is kept uniform),
`|G| · χ` is a `ℤ`-combination of
characters induced from cyclic subgroups; equivalently every character is a `ℚ`-combination of such. Any
statement about the index of the integral image is a separate lattice-determinant target, not this theorem. -/
theorem artin_induction [Fintype G] [CharZero k] [IsAlgClosed k] (V : FDRep k G) :
    Nat.card G • V.character ∈ AddSubgroup.closure
      { f : G → k | ∃ C : Subgroup G, IsCyclic C ∧ ∃ ψ : FDRep k C, f = indClassFun ψ.character } := by
  letI : Invertible (Nat.card G : k) :=
    invertibleOfNonzero (Nat.cast_ne_zero.mpr Nat.card_pos.ne')
  exact nativeIndCharacterSpan_le_raw (fun C ↦ IsCyclic C)
    (TauCeti.ClassFunction.natCard_nsmul_mem_indCharacterSpanInt_isCyclic
      (TauCeti.character_mem_virtualCharacters V))

/-- **Brauer's induction theorem.** Over an algebraically closed characteristic-`0` field (essential,
not decorative: over a non-splitting field such as `ℚ` the `FDRep` characters are not the absolutely
irreducible ones and the `ℤ`-span statement is a different, false claim — Brauer's theorem lives over
a splitting field), every character is a `ℤ`-combination of
characters induced from **elementary** subgroups: the induced map `⊕_{E elementary} R(E) → R(G)` is
surjective. -/
theorem brauer_induction [Fintype G] [CharZero k] [IsAlgClosed k] (V : FDRep k G) :
    V.character ∈ AddSubgroup.closure
      { f : G → k | ∃ E : Subgroup G, IsElementary E ∧ ∃ ψ : FDRep k E, f = indClassFun ψ.character } := by
  exact nativeIndCharacterSpan_le_raw IsElementary
    (TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary V)

/-- **Brauer's characterization of characters.** Over an algebraically closed characteristic-`0`
field, a **class function** is a virtual character iff its restriction to every elementary subgroup
is a virtual character. The conjugacy-invariance hypothesis is essential even over `ℂ` (a
non-class-function on `S₃` can have every elementary restriction a virtual character), and is stated
inline so this file does not hard-depend on the character-theory roadmap's `ClassFunction`. -/
theorem brauer_characterization [Fintype G] [CharZero k] [IsAlgClosed k] (f : G → k)
    (hf : ∀ g h : G, f (h * g * h⁻¹) = f g) :
    f ∈ virtualCharacters ↔
      ∀ E : Subgroup G, IsElementary E → (fun x : E => f (x : G)) ∈ virtualCharacters := by
  simpa [virtualCharacters, IsElementary] using
    (TauCeti.mem_virtualCharacters_iff_forall_comp_subtype_isElementary hf)

/-- **Artin's corollary.** A rational representation is determined by its **fixed-point dimensions**
on cyclic subgroups — one scalar per cyclic `C`, a strictly coarser invariant than the restricted
character (hypothesizing full character equality on every `⟨g⟩` would be equivalent to global
character equality and trivialize the statement). The averaged sum `∑_{c ∈ C} χ(c) = |C| · dim V^C`
is that scalar. -/
theorem rat_rep_iso_of_res_cyclic [Fintype G] (V W : FDRep ℚ G)
    (h : ∀ C : Subgroup G, IsCyclic C →
      ∑ c : C, V.character (c : G) = ∑ c : C, W.character (c : G)) :
    Nonempty (V ≅ W) := by
  apply FDRep.nonempty_iso_of_subgroupCharacterSum_eq_cyclic V W
  intro C hC
  simpa only [FDRep.subgroupCharacterSum_eq_sum] using h C hC

end ArtinBrauer

/-! ## Layer 7: projective representations, factor sets, and the Schur multiplier

Over an algebraically closed field `k`; finite `G`. The natural companion to Layer 5's Clifford theory:
consumes Mathlib's degree-`2` group cohomology (`groupCohomology.H2`, `cocycles₂`, `IsMulCocycle₂`). -/

section Projective

/- Universe note (checked): `k`, `G`, `V` are pinned to `Type` (universe `0`) in this section, unlike
the `Type u` polymorphism elsewhere in the file, because `groupCohomology.cocycles₂`/`H2` over the
coefficient ring `ℤ : Type 0` force the group and module into universe `0`; the section does not
elaborate polymorphically. -/
variable {k : Type} [Field k] {G : Type} [Group G]

attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- **Raw projective representation data** with specified factor set `α`: normalized invertible
operators `ρ : G → (V ≃ₗ[k] V)` satisfying the action equation, together with the normalized cocycle
laws for `α`. This permits the zero module, where the unique invertible operator family does not
determine `α`. Forgetting scalar lifts gives a PGL action; the intrinsic factor-class/lift
correspondence additionally requires faithful scalar-unit action (over a field, nonzero V suffices)
and quotienting lifts by normalized scalar cochains. The fixed-factor predicate itself imposes no
nonzero premise, and the zero object remains valid in every fixed-factor twisted-module category. -/
def IsProjectiveRep {V : Type} [AddCommGroup V] [Module k V]
    (ρ : G → (V ≃ₗ[k] V)) (α : G × G → kˣ) : Prop :=
  TauCeti.IsProjectiveRep ρ (Function.curry α)

/-- The native predicate retains the complete old uncurried source convention, including zero V. -/
theorem isProjectiveRep_iff_source {V : Type} [AddCommGroup V] [Module k V]
    (ρ : G → (V ≃ₗ[k] V)) (α : G × G → kˣ) :
    IsProjectiveRep ρ α ↔
      ρ 1 = LinearEquiv.refl k V ∧
      (∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1) ∧
      (∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j)) ∧
      ∀ (g h : G) (x : V), ρ g (ρ h x) = (α (g, h) : k) • ρ (g * h) x := by
  constructor
  · intro h
    exact ⟨h.map_one, fun g ↦ ⟨h.isFactorSet.one_left g, h.isFactorSet.one_right g⟩,
      h.isFactorSet.cocycle, h.mul_apply⟩
  · rintro ⟨h1, hn, hc, hm⟩
    exact
      { isFactorSet :=
          { cocycle := hc
            one_left := fun g ↦ (hn g).1
            one_right := fun g ↦ (hn g).2 }
        map_one := h1
        mul_apply := hm }

/-- **A factor set is a `2`-cocycle.** For the trivial `G`-action on `kˣ`, a factor set `α` satisfying the
multiplicative `2`-cocycle identity lands in `groupCohomology.cocycles₂` of the trivial module `kˣ`; this is
`groupCohomology.cocyclesOfIsMulCocycle₂` transported through `Additive`. -/
theorem factorSet_mem_cocycles₂ (α : G × G → kˣ)
    (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j)) :
    (fun p : G × G => Additive.ofMul (α p)) ∈
      groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ)) := sorry

/-- **The second cohomology** `H²(G, k^×)`, classifying **factor sets up to cohomology** (cohomologous
factor sets correspond under rescaling the lift). This is not the same as classifying projective
representations themselves: a fixed cohomology class carries many non-isomorphic projective
representations. The classical Schur multiplier `H₂(G, ℤ)` is a separate finite abelian group, the
character dual of `H²(G, ℂˣ)`; pin it separately if wanted. -/
noncomputable def schurMultiplier : ModuleCat ℤ :=
  groupCohomology.H2 (Rep.trivial ℤ G (Additive kˣ))

/-- **The twisted group algebra** `k_α[G]`: the product on `G →₀ k` twisting `MonoidAlgebra k G` by the
factor set, `e_g * e_h = α(g, h) • e_{g h}`. Associativity is exactly the multiplicative `2`-cocycle
identity and the unit needs `α(1, g) = α(g, 1) = 1`, so the algebra is assembled from a **normalized**
cocycle (associativity and unit proved first); projective representations with factor set `α` are exactly
its modules for the matching action convention, and cohomologous `α` give isomorphic twisted algebras. -/
noncomputable def twistedMul (α : G × G → kˣ) : (G →₀ k) → (G →₀ k) → (G →₀ k) := fun f g ↦
  f.sum fun x a ↦ g.sum fun y b ↦ Finsupp.single (x * y) (a * b * (α (x, y) : k))

/-- The selected raw operation has the prescribed basis multiplication, without a cocycle premise. -/
theorem twistedMul_single (α : G × G → kˣ) (x y : G) (a b : k) :
    twistedMul α (Finsupp.single x a) (Finsupp.single y b) =
      Finsupp.single (x * y) (a * b * (α (x, y) : k)) := by
  classical
  simp [twistedMul]

/-- Actual native twisted-algebra coordinates under the normalized factor-set hypothesis. -/
noncomputable def twistedCoordinateEquiv (α : G × G → kˣ)
    [TauCeti.IsFactorSet (Function.curry α)] :
    (G →₀ k) ≃ₗ[k] TauCeti.twistedMonoidAlgebra k G (Function.curry α) :=
  (TauCeti.TwistedMonoidAlgebra.basis k G (Function.curry α)).repr.symm

/-- The sole remaining raw-coordinate multiplication adapter; native algebra laws are consumed. -/
theorem twistedCoordinateEquiv_mul (α : G × G → kˣ)
    [TauCeti.IsFactorSet (Function.curry α)] (f g : G →₀ k) :
    twistedCoordinateEquiv α (twistedMul α f g) =
      twistedCoordinateEquiv α f * twistedCoordinateEquiv α g := by
  sorry

/-- **The central extension** `1 → k^× → E_α → G → 1` built from a **normalized factor set**: the
underlying set `kˣ × G` with twisted multiplication `(a, g)(b, h) = (a * b * α(g, h), g * h)`. The cocycle
identity `hα` and the normalization `hα₁` are data, not decoration: without them the multiplication is
neither associative nor unital. `H²(G, k^×)` classifies these central extensions up to equivalence. -/
def centralExtensionOfFactorSet (α : G × G → kˣ)
    (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j))
    (hα₁ : ∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1) : Type := kˣ × G

/-- Native division commutant. Its multiplication is categorical End multiplication, hence
composition in the order (ab)(v)=a(b(v)); it need not equal k. -/
abbrev cliffordCommutant {N : Subgroup G} (V : FDRep k N) := CategoryTheory.End V

/-- General-field Schur supplies the native division structure, without scalar Schur. -/
noncomputable def cliffordCommutantDivisionRing {N : Subgroup G}
    (V : FDRep k N) [Simple V] : DivisionRing (cliffordCommutant V) := inferInstance

/-- Algebraic closure supplies the explicit scalar-Schur statement needed below. -/
theorem end_scalar_of_isAlgClosed [IsAlgClosed k] {N : Subgroup G}
    (V : FDRep k N) [Simple V] : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V := by
  intro f
  obtain ⟨c, hc⟩ := CategoryTheory.endomorphism_simple_eq_smul_id k f
  exact ⟨c, hc.symm⟩

/-- The arbitrary-field scalar-Schur extension theorem on the actual native compatible-extension
carrier. The argument is an explicit scalar condition, not a new predicate or desired conclusion. -/
theorem exists_scalarProjectiveInertiaExtension {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    ∃ ρ β, TauCeti.IsProjectiveInertiaExtension V ρ β := by
  sorry

/-- Independence of scalar compatible choices over an arbitrary field. -/
theorem scalarProjectiveInertiaExtension_class_eq {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ ρ' : TauCeti.inertia V → V ≃ₗ[k] V}
    {β β' : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β)
    (h' : TauCeti.IsProjectiveInertiaExtension V ρ' β') :
    h.factorSet.cohomologyClass = h'.factorSet.cohomologyClass := by
  sorry

/-- Scalar Clifford obstruction, on a simple nonzero representation with actual scalar Schur.
No canonical scalar class for arbitrary/zero V or non-scalar division commutants is asserted. -/
noncomputable def cliffordObstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    TauCeti.schurMultiplier k (TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V)) :=
  (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec.factorSet.cohomologyClass

/-- Every actual compatible scalar choice represents the specified obstruction. -/
theorem scalarProjectiveInertiaExtension_class_eq_obstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ : TauCeti.inertia V → V ≃ₗ[k] V}
    {β : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β) :
    h.factorSet.cohomologyClass = cliffordObstruction V hScalar := by
  unfold cliffordObstruction
  exact scalarProjectiveInertiaExtension_class_eq V hScalar h
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

/-- The arbitrary-field scalar obstruction vanishes precisely for an ordinary extension of the
specified N-action on the same underlying V. -/
theorem cliffordObstruction_eq_zero_iff {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = 0 ↔
      ∃ σ : Representation k (TauCeti.inertia V) V,
        σ.comp (Subgroup.inclusion (TauCeti.le_inertia V)) = V.ρ := by
  sorry

/-- Exact implemented algebraically-closed specialization; no finite-G or CharZero premise. -/
noncomputable def cliffordObstructionAlgClosed [IsAlgClosed k] {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V] :
    TauCeti.schurMultiplier k (TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V)) :=
  TauCeti.cliffordObstruction V

/-- The general scalar construction agrees with the actual native closed-field obstruction. -/
theorem cliffordObstruction_eq_native [IsAlgClosed k] {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = TauCeti.cliffordObstruction V := by
  unfold cliffordObstruction
  exact TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

end Projective

end TauCetiRoadmap.RepresentationTheory.InductionRestriction



/-! Almost-conjugacy interfaces for Induction–Restriction Layer 2.1.
The fixed-coset counting identity is a proof target; its equivalence criterion is derived below.
The characteristic-zero classification is consumed from Tau Ceti. -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

variable {G : Type*} [Group G]

/-- Equal intersection sizes with every Mathlib conjugacy class. -/
def AlmostConjugate (H K : Subgroup G) : Prop :=
  ∀ C : ConjClasses G,
    Nat.card {g : G // g ∈ C.carrier ∧ g ∈ H} =
      Nat.card {g : G // g ∈ C.carrier ∧ g ∈ K}

@[refl] theorem AlmostConjugate.refl (H : Subgroup G) : AlmostConjugate H H :=
  fun _ ↦ rfl

@[symm] theorem AlmostConjugate.symm {H K : Subgroup G}
    (h : AlmostConjugate H K) : AlmostConjugate K H :=
  fun C ↦ (h C).symm

@[trans] theorem AlmostConjugate.trans {H K L : Subgroup G}
    (h : AlmostConjugate H K) (h' : AlmostConjugate K L) : AlmostConjugate H L :=
  fun C ↦ (h C).trans (h' C)

variable [Finite G]

/-- Division-free fixed-coset count. The stabilizer is the centralizer of g
for the conjugation action, with no private centralizer notation. -/
theorem card_fixedBy_mul_card_subgroup (H : Subgroup G) (g : G) :
    Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H =
      Nat.card (MulAction.stabilizer (ConjAct G) g) *
        Nat.card {x : G // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H} := by
  sorry


end TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

/-! Conjugacy-class partitions, subgroup orders and indices. -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

variable {G : Type*} [Group G]

/-- A subgroup is partitioned by the ambient conjugacy classes it meets. -/
noncomputable def subgroupConjugacyPartitionEquiv (H : Subgroup G) :
    H ≃ Σ C : ConjClasses G, {g : G // g ∈ C.carrier ∧ g ∈ H} :=
  (Equiv.sigmaFiberEquiv (fun x : H ↦ ConjClasses.mk (x : G))).symm.trans
    (Equiv.sigmaCongrRight fun C ↦
      { toFun := fun x ↦ ⟨x.1, (ConjClasses.mem_carrier_iff_mk_eq).mpr x.2, x.1.property⟩
        invFun := fun x ↦ ⟨⟨x.1, x.2.2⟩, (ConjClasses.mem_carrier_iff_mk_eq).mp x.2.1⟩
        left_inv := by intro x; rfl
        right_inv := by intro x; rfl })

variable [Finite G]

/-- Almost-conjugate finite subgroups have equal cardinality. -/
theorem AlmostConjugate.card_eq {H K : Subgroup G} (h : AlmostConjugate H K) :
    Nat.card H = Nat.card K := by
  classical
  let : Fintype (ConjClasses G) := Fintype.ofFinite _
  rw [Nat.card_congr (subgroupConjugacyPartitionEquiv H),
    Nat.card_congr (subgroupConjugacyPartitionEquiv K), Nat.card_sigma, Nat.card_sigma]
  exact Finset.sum_congr rfl fun C _ ↦ h C

/-- Almost-conjugate finite subgroups have equal indices. -/
theorem AlmostConjugate.index_eq {H K : Subgroup G} (h : AlmostConjugate H K) :
    H.index = K.index := by
  rw [Subgroup.index_eq_card_div, Subgroup.index_eq_card_div, h.card_eq]

/-- Counting bridge derived from the fixed-coset identity and subgroup cardinalities. -/
theorem almostConjugate_iff_fixedBy (H K : Subgroup G) :
    AlmostConjugate H K ↔
      ∀ g : G, Nat.card (MulAction.fixedBy (G ⧸ H) g) =
        Nat.card (MulAction.fixedBy (G ⧸ K) g) := by
  classical
  let : Fintype G := Fintype.ofFinite G
  constructor
  · intro h g
    apply Nat.eq_of_mul_eq_mul_right (Nat.card_pos (α := H))
    rw [card_fixedBy_mul_card_subgroup H g, h.card_eq,
      card_fixedBy_mul_card_subgroup K g, h (ConjClasses.mk g)]
  · intro h
    have hi : H.index = K.index := by
      simpa [Subgroup.index_eq_card, MulAction.fixedBy_one_eq_univ] using h 1
    have hc : Nat.card H = Nat.card K := by
      apply Nat.eq_of_mul_eq_mul_left (Nat.card_pos (α := G ⧸ H))
      simpa only [← Subgroup.index_eq_card, ← hi, Subgroup.index_mul_card] using
        H.index_mul_card.trans K.index_mul_card.symm
    intro C
    obtain ⟨g, rfl⟩ := ConjClasses.mk_surjective C
    apply Nat.eq_of_mul_eq_mul_left
      (Nat.card_pos (α := MulAction.stabilizer (ConjAct G) g))
    rw [← card_fixedBy_mul_card_subgroup H g,
      ← card_fixedBy_mul_card_subgroup K g, h g, hc]

/-- Once the class-count bridge is proved, apply the implemented
characteristic-zero permutation classification directly. -/
theorem almostConjugate_iff_permutation_equiv
    (k : Type*) [Field k] [CharZero k] (H K : Subgroup G) :
    AlmostConjugate H K ↔
      Nonempty ((Representation.ofMulAction k G (G ⧸ H)).Equiv
        (Representation.ofMulAction k G (G ⧸ K))) :=
  (almostConjugate_iff_fixedBy H K).trans
    (TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq
      (G := G) (X := G ⧸ H) (Y := G ⧸ K) k).symm


end TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

/-! Restriction and normal-subgroup invariants. -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

variable {k G D V W : Type*} [CommRing k] [Group G] [Group D]
  [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W]
  {ρ : Representation k G V} {σ : Representation k G W}

/-- Restriction of an equivalence along a group homomorphism. -/
def restrictEquiv (e : ρ.Equiv σ) (f : D →* G) :
    Representation.Equiv (ρ.comp f) (σ.comp f) :=
  Representation.Equiv.mk e.toLinearEquiv (fun d ↦ e.isIntertwining' (f d))

/-- A representation equivalence induces an equivalence of the quotient-group
representations on the invariants of a normal subgroup. -/
noncomputable def normalInvariantEquiv (e : ρ.Equiv σ) (I : Subgroup G) [I.Normal] :
    (ρ.quotientToInvariants I).Equiv (σ.quotientToInvariants I) :=
  Representation.Equiv.mk (restrictEquiv e I.subtype).invariantsLinearEquiv (by
    intro q
    refine QuotientGroup.induction_on q ?_
    intro g
    apply LinearMap.ext
    intro x
    apply Subtype.ext
    exact congrArg (fun t : V →ₗ[k] W ↦ t (x : V)) (e.isIntertwining' g))

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

/-! Subgroup transport under a group equivalence. -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

variable {G Γ : Type*} [Group G] [Group Γ]

/-- Pullback of subgroups along a group equivalence preserves nonconjugacy. -/
theorem not_conj_comap (e : G ≃* Γ) (H K : Subgroup Γ)
    (hn : ¬ ∃ τ : Γ, H.map (MulAut.conj τ) = K) :
    ¬ ∃ σ : G, (H.comap e.toMonoidHom).map (MulAut.conj σ) = K.comap e.toMonoidHom := by
  rintro ⟨σ, hσ⟩
  apply hn
  refine ⟨e σ, ?_⟩
  apply Subgroup.comap_injective (f := e.toMonoidHom) e.surjective
  calc
    (H.map (MulAut.conj (e σ))).comap e.toMonoidHom = (H.comap e.toMonoidHom).map (MulAut.conj σ) := by
      ext x
      simp only [Subgroup.mem_comap, Subgroup.mem_map]
      constructor
      · rintro ⟨y, hy, h⟩
        refine ⟨e.symm y, by simpa using hy, ?_⟩
        apply e.injective
        simpa [MulAut.conj_apply] using h
      · rintro ⟨y, hy, h⟩
        refine ⟨e y, hy, ?_⟩
        simpa [MulAut.conj_apply] using congrArg e h
    _ = K.comap e.toMonoidHom := hσ

/-- A group equivalence identifies the class-intersection subtypes. -/
def classIntersectionComapEquiv (e : G ≃* Γ) (H : Subgroup Γ) (g : G) :
    {x : G // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H.comap e.toMonoidHom} ≃
      {y : Γ // y ∈ (ConjClasses.mk (e g)).carrier ∧ y ∈ H} :=
  e.toEquiv.subtypeEquiv (by
    intro x
    simp only [ConjClasses.mem_carrier_iff_mk_eq, ConjClasses.mk_eq_mk_iff_isConj,
      Subgroup.mem_comap, MulEquiv.coe_toMonoidHom]
    refine and_congr ?_ Iff.rfl
    constructor
    · exact e.toMonoidHom.map_isConj
    · intro hx
      simpa using e.symm.toMonoidHom.map_isConj hx)

/-- Pullback along a group equivalence preserves almost-conjugacy. -/
theorem almostConjugate_comap (e : G ≃* Γ) (H K : Subgroup Γ) (h : AlmostConjugate H K) :
    AlmostConjugate (H.comap e.toMonoidHom) (K.comap e.toMonoidHom) := by
  intro C
  obtain ⟨g, rfl⟩ := C.exists_rep
  rw [Nat.card_congr (classIntersectionComapEquiv e H g),
    Nat.card_congr (classIntersectionComapEquiv e K g)]
  exact h (ConjClasses.mk (e g))

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

/-- The finite pair built from the regular actions of C4 x C4 and Q8 x C2.
The README specifies these constructions and their cycle-type calculation. -/
theorem exists_S16_gassmann_pair :
    ∃ H K : Subgroup (Equiv.Perm (Fin 16)),
      Nat.card H = 16 ∧ Nat.card K = 16 ∧ AlmostConjugate H K ∧
        (¬ ∃ σ : Equiv.Perm (Fin 16), H.map (MulAut.conj σ) = K) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann

/-! ## Abstract universal central extensions

This section concerns arbitrary abstract groups, independently of the finite-group
projective-representation section. All constructed carriers have the universe of G.
The universal target quantifies over extension groups in an independent universe v.
-/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

universe u v

variable (G : Type u) [Group G]

/-- A central extension is an onto native homomorphism with its actual kernel central. -/
def IsCentralExtension {E : Type v} [Group E] (p : E →* G) : Prop :=
  Function.Surjective p ∧ p.ker ≤ Subgroup.center E

/-- The canonical free presentation sends the generator indexed by g to g. -/
abbrev presentation : FreeGroup G →* G := FreeGroup.prod

/-- Actual relation subgroup R in the canonical free presentation. -/
abbrev relations : Subgroup (FreeGroup G) := (presentation G).ker

/-- The native commutator subgroup D=[F,F]. -/
abbrev derived : Subgroup (FreeGroup G) := commutator (FreeGroup G)

/-- The native normal commutator subgroup [F,R]. -/
abbrev relationCommutators : Subgroup (FreeGroup G) :=
  ⁅(⊤ : Subgroup (FreeGroup G)), relations G⁆

/-- [F,R] is contained in [F,F]. -/
theorem relationCommutators_le_derived : relationCommutators G ≤ derived G :=
  Subgroup.commutator_mono le_rfl le_top

/-- [F,R] is contained in R, since R is normal. -/
theorem relationCommutators_le_relations : relationCommutators G ≤ relations G :=
  Subgroup.commutator_le_right ⊤ (relations G)

/-- [F,R], regarded as a native normal subgroup of D. -/
abbrev relationsInsideDerived : Subgroup (derived G) :=
  (relationCommutators G).subgroupOf (derived G)

/-- The explicit canonical carrier U=[F,F]/[F,R], not an opaque existence carrier. -/
abbrev Cover : Type u := derived G ⧸ relationsInsideDerived G

/-- The canonical homomorphism from the explicit quotient to G. -/
def projection : Cover G →* G :=
  QuotientGroup.lift (relationsInsideDerived G)
    ((presentation G).comp (derived G).subtype) (by
      intro x hx
      exact relationCommutators_le_relations G hx)

/-- On a derived-subgroup representative the projection is the free evaluation. -/
@[simp] theorem projection_mk (x : derived G) :
    projection G (QuotientGroup.mk' (relationsInsideDerived G) x) = presentation G x :=
  rfl

/-- Perfectness of G makes the concrete projection onto G. -/
theorem projection_surjective [Group.IsPerfect G] :
    Function.Surjective (projection G) := by
  sorry

/-- The actual kernel subgroup is central in the explicit quotient. -/
theorem ker_projection_le_center :
    (projection G).ker ≤ Subgroup.center (Cover G) := by
  sorry

/-- The kernel is the image of R intersect D under the quotient map. -/
theorem ker_projection_eq_map :
    (projection G).ker = ((relations G).subgroupOf (derived G)).map
      (QuotientGroup.mk' (relationsInsideDerived G)) := by
  sorry

/-- The full Hopf kernel formula, on native intersection and quotient carriers. -/
noncomputable def kernelEquiv :
    (↥(relations G ⊓ derived G) ⧸
      (relationCommutators G).subgroupOf (relations G ⊓ derived G)) ≃*
      (projection G).ker := by
  sorry

/-- The Hopf kernel comparison takes each actual quotient representative to its
same derived-subgroup class in the concrete cover. -/
@[simp] theorem kernelEquiv_mk (x : ↥(relations G ⊓ derived G)) :
    ((kernelEquiv G (QuotientGroup.mk'
      ((relationCommutators G).subgroupOf (relations G ⊓ derived G)) x) :
        (projection G).ker) : Cover G) =
      QuotientGroup.mk' (relationsInsideDerived G) ⟨x.1, x.2.2⟩ := by
  sorry

/-- The concrete perfect-group cover satisfies the shared central-extension definition. -/
theorem projection_isCentralExtension [Group.IsPerfect G] :
    IsCentralExtension G (projection G) :=
  ⟨projection_surjective G, ker_projection_le_center G⟩

/-- U itself is perfect when G is perfect; the free commutator subgroup need not be. -/
theorem cover_isPerfect [Group.IsPerfect G] : Group.IsPerfect (Cover G) := by
  sorry

/-- Initiality among all surjective central extensions over G, in any universe v.
Only the defining properties of the target central extension are assumed. -/
theorem universal [Group.IsPerfect G] {E : Type v} [Group E]
    (p : E →* G) (hp : Function.Surjective p)
    (hcentral : p.ker ≤ Subgroup.center E) :
    ∃! f : Cover G →* E, p.comp f = projection G := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

section FactorSetCentralExtension

variable {k G : Type} [Field k] [Group G]
variable (α : G × G → kˣ)
variable (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j))
variable (hα₁ : ∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1)

attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- The supplied normalized factor set, bundled with the native trivial coefficient action. -/
def normalizedFactorSet : TauCeti.FactorSet G kˣ where
  toFun := α
  isMulCocycle₂' g h j := by simpa using hα g h j
  map_one_one' := (hα₁ 1).1

/-- Native extension coordinates preserve the product carrier used by the selected source model. -/
def factorSetNativeEquiv : centralExtensionOfFactorSet α hα hα₁ ≃
    (normalizedFactorSet α hα hα₁).Extension :=
  (TauCeti.FactorSet.Extension.equivProd (normalizedFactorSet α hα hα₁)).symm

/-- Transport the implemented native group, rather than admit its group laws again. -/
instance factorSetExtensionGroup : Group (centralExtensionOfFactorSet α hα hα₁) :=
  (factorSetNativeEquiv α hα hα₁).group

/-- The coordinate comparison is multiplicative for the transported native group. -/
def factorSetNativeMulEquiv : centralExtensionOfFactorSet α hα hα₁ ≃*
    (normalizedFactorSet α hα hα₁).Extension where
  toEquiv := factorSetNativeEquiv α hα hα₁
  map_mul' _ _ := rfl

@[simp] theorem factorSetExtension_mul
    (x y : centralExtensionOfFactorSet α hα hα₁) :
    x * y = (x.1 * y.1 * α (x.2, y.2), x.2 * y.2) := rfl

/-- The actual projection to the original group. -/
def factorSetProjection : centralExtensionOfFactorSet α hα hα₁ →* G where
  toFun x := x.2
  map_one' := rfl
  map_mul' _ _ := rfl

/-- The actual scalar-kernel inclusion. -/
def factorSetScalarInclusion : kˣ →* centralExtensionOfFactorSet α hα hα₁ where
  toFun a := (a, 1)
  map_one' := rfl
  map_mul' a b := by
    change (a * b, (1 : G)) = (a * b * α (1, 1), (1 : G) * 1)
    simp [(hα₁ 1).1]

theorem factorSetProjection_surjective : Function.Surjective (factorSetProjection α hα hα₁) := by
  intro g
  exact ⟨(1, g), rfl⟩

/-- Exactness is about the specified scalar inclusion, not an arbitrary isomorphic kernel. -/
theorem factorSetScalarRange_eq_kernel :
    (factorSetScalarInclusion α hα hα₁).range = (factorSetProjection α hα hα₁).ker := by
  sorry

/-- The scalar kernel is central for the actual twisted operations. -/
theorem factorSetProjection_isCentralExtension :
    AbstractUCE.IsCentralExtension G (factorSetProjection α hα hα₁) := by
  refine ⟨factorSetProjection_surjective α hα hα₁, ?_⟩
  sorry

/-- The normalized factor set yields the native short exact sequence. -/
def factorSetGroupExtension :
    GroupExtension kˣ (centralExtensionOfFactorSet α hα hα₁) G where
  inl := factorSetScalarInclusion α hα hα₁
  rightHom := factorSetProjection α hα hα₁
  inl_injective := by
    intro a b h
    exact congrArg Prod.fst h
  range_inl_eq_ker_rightHom := factorSetScalarRange_eq_kernel α hα hα₁
  rightHom_surjective := factorSetProjection_surjective α hα hα₁

end FactorSetCentralExtension

end TauCetiRoadmap.RepresentationTheory.InductionRestriction
