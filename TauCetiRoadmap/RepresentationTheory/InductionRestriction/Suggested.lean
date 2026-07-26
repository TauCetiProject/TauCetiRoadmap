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

/-- **The conjugation convention, fixed once.** `MulAut.conj s • H` is `sHs⁻¹`: its membership unfolds via
`Subgroup.mem_pointwise_smul_iff_inv_smul_mem` to `s⁻¹ * x * s ∈ H`. Every conjugate action and character
below is read off this lemma, so the layer cannot be silently orientation-reversed. -/
theorem mem_conj_smul (s : G) (H : Subgroup G) (x : G) :
    x ∈ (MulAut.conj s • H : Subgroup G) ↔ s⁻¹ * x * s ∈ H := sorry

/-- **The conjugate representation** `{}^s A`. For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the
representation of the conjugated subgroup `s H s⁻¹` on `A.V` with `x : sHs⁻¹` acting by
`A.ρ ⟨s⁻¹ x s, _⟩` (the membership proof from `mem_conj_smul`). The object every Mackey and Clifford
summand is built from. -/
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
    (x : (MulAut.conj s • H : Subgroup G)) :
    (conjFDRep s A).character x
      = A.character ⟨s⁻¹ * (x : G) * s, (mem_conj_smul s H x).mp x.2⟩ := sorry

/-- **Induction of a finite-dimensional representation** of a finite-index subgroup, as an
`FDRep k G`. Its existence is the statement that `Rep.ind S.subtype` preserves finite-dimensionality;
compatible with `Rep.ind` under the forgetful functor. -/
noncomputable def indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) : FDRep k G := sorry

/-- **The degree of an induced representation** is the index times the degree. -/
theorem finrank_indFDRep {S : Subgroup G} [S.FiniteIndex] (A : FDRep k S) :
    Module.finrank k (indFDRep A) = S.index * Module.finrank k A := sorry

/-- **The induced-character formula (coset-representative form).** Over any field, the induced character at
`g` is the sum over coset representatives `t : G ⧸ S` of `χ(t⁻¹ g t)` for those `t` whose `t⁻¹ g t` lands
in `S`, with no division by `|S|`. Well-defined because `A.character` is a class function on `S`. The
primary character-theoretic workhorse; the averaged form below is a corollary. -/
theorem character_indFDRep_sum_quotient {S : Subgroup G} [S.FiniteIndex] [Fintype (G ⧸ S)]
    (A : FDRep k S) (g : G) :
    (indFDRep A).character g
      = ∑ t : G ⧸ S,
          if h : (Quotient.out t)⁻¹ * g * Quotient.out t ∈ S then
            A.character ⟨(Quotient.out t)⁻¹ * g * Quotient.out t, h⟩ else 0 := sorry

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
          if h : x⁻¹ * g * x ∈ S then A.character ⟨x⁻¹ * g * x, h⟩ else 0 := sorry

/-- **The permutation representation.** Inducing the trivial representation along `H.subtype` gives the
left-coset permutation representation `k[G ⧸ H]` on Mathlib's quotient `G ⧸ H`, with `G` acting by left
translation; its character at `g` counts the cosets fixed by `g`. -/
noncomputable def indTrivialIso {H : Subgroup G} :
    Rep.ind H.subtype (Rep.trivial k _ k : Rep k H) ≅ Rep.ofMulAction k G (G ⧸ H) := sorry

/-- **Frobenius reciprocity as a character identity**: the inner product of `Ind χ` with `ψ` over `G`
equals that of `χ` with `Res ψ` over `S`. A shadow of `Rep.indResAdjunction`. Regime 3: the `IsUnit`
hypothesis makes the averaging factors meaningful. Stated with explicit sums so it does not hard-depend on
the `characterPairing` name of the character-theory roadmap. -/
theorem frobenius_reciprocity {S : Subgroup G} [S.FiniteIndex] [Fintype G]
    (hG : IsUnit (Nat.card G : k)) (A : FDRep k S) (B : FDRep k G) :
    (Nat.card G : k)⁻¹ * ∑ g : G, (indFDRep A).character g * B.character g⁻¹
      = (Nat.card S : k)⁻¹ * ∑ s : S, A.character s * B.character ((s : G)⁻¹) := sorry

end Characters

/-! ## Layer 3: the Mackey decomposition formula

Over a commutative ring for the isomorphism; `H K : Subgroup G`. -/

section Mackey

variable {k : Type u} [CommRing k] {G : Type u} [Group G]

/-- **The Mackey subgroup** `K ⊓ sHs⁻¹` where the double-coset summand lives; it carries the two
inclusions `mackeySubgroup s H K ≤ K` (induce up) and `mackeySubgroup s H K ≤ MulAut.conj s • H`
(restrict the conjugate down). There is no second intersection with `K`. -/
def mackeySubgroup (s : G) (H K : Subgroup G) : Subgroup G := K ⊓ (MulAut.conj s • H)

/-- **The Mackey summand** attached to a double coset `KsH ∈ K \ G / H`: restrict the conjugate `{}^s A`
(living on `sHs⁻¹`) along `mackeySubgroup s H K ≤ MulAut.conj s • H`, then induce along
`mackeySubgroup s H K ≤ K`. Built from a fixed representative `s = Quotient.out t`; no canonical
representative-independence is asserted. -/
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
def MackeyDisjoint {H : Subgroup G} (V : FDRep k H) (s : G) : Prop :=
  ∀ φ : (Action.res (FGModuleCat k)
          (Subgroup.inclusion (inf_le_left : mackeySubgroup s H H ≤ H))).obj V ⟶
        (Action.res (FGModuleCat k)
          (Subgroup.inclusion
            (inf_le_right : mackeySubgroup s H H ≤ MulAut.conj s • H))).obj (conjFDRep s V),
    φ = 0

/-- **The Mackey irreducibility criterion (primary form, over double cosets).** `Ind_H^G V` is irreducible
iff `V` is irreducible and every non-identity double coset `HsH` (representative `s = Quotient.out t ∉ H`)
contributes a disjoint pair. Read off the intertwining-number formula: the identity double coset
contributes `dim End V`, every other term must vanish. -/
theorem simple_indFDRep_iff_doubleCoset {H : Subgroup G} [H.FiniteIndex] [Fintype G]
    [Fintype (DoubleCoset.Quotient (H : Set G) (H : Set G))] (V : FDRep k H) :
    Simple (indFDRep V) ↔ Simple V ∧
      ∀ t : DoubleCoset.Quotient (H : Set G) (H : Set G),
        Quotient.out t ∉ H → MackeyDisjoint V (Quotient.out t) := sorry

/-- **The Mackey irreducibility criterion (`∀ s ∉ H` corollary).** The elementwise form, obtained from the
double-coset form once `MackeyDisjoint` is shown invariant under replacing `s` by `h₁ * s * h₂` for
`h₁, h₂ ∈ H`. -/
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
multiplicity `e`, indexed by a transversal `reps` of `inertia V` in `G`. The witnesses are pinned:
`e ≠ 0` and `reps` is required to be a genuine left transversal of `inertia V`, so the identity
carries Clifford's structural content rather than an underdetermined `(e, reps)` pair; the full
constituent-level correspondence remains deferred (see the comment below). -/
theorem clifford_restrict_character {N : Subgroup G} [N.Normal] [Fintype G]
    (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (e : ℕ) (reps : Finset G),
      e ≠ 0 ∧
      (∀ g : G, ∃! r, r ∈ reps ∧ g⁻¹ * r ∈ inertia V) ∧
      ∀ n : N, W.character (n : G)
        = (e : k) * ∑ g ∈ reps, (conjNormal g V).character n := sorry

-- The **Clifford correspondence** (induction from `inertia V` is a bijection onto the irreducibles of
-- `G` lying over `V`) is the summit of this layer; see `README.md`. Stating the bijection precisely
-- needs the "lies over `V`" predicate and the inertia-group induction, built on the targets above.

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
noncomputable def indClassFun {H : Subgroup G} [Fintype G] (f : H → k) : G → k := sorry

/-- **The virtual-character lattice** in the class functions: the additive subgroup of `G → k` spanned by
the characters of `FDRep k G` (closed under the tensor-product product `char_tensor`). The primary object
is the Grothendieck ring `R(G)` of `FDRep k G` under direct sum and tensor product; over a
characteristic-`0` splitting field the character map embeds `R(G)` into `G → k` with this lattice as image.
An `AddSubgroup` (not a raw `Subring (G → k)`), which over positive characteristic would not record the
lattice structure. -/
def virtualCharacters : AddSubgroup (G → k) := sorry

/-- **Elementary subgroups.** `IsElementary H` holds when `H` is `p`-elementary for some prime `p`, i.e. a
direct product `C × P` of a cyclic group of order prime to `p` and a `p`-group. Mathlib has `IsCyclic` and
`IsPGroup` but no elementary-subgroup predicate. -/
def IsElementary (H : Subgroup G) : Prop :=
  ∃ p : ℕ, p.Prime ∧ ∃ C P : Subgroup H, IsCyclic C ∧ IsPGroup p P ∧
    ¬ p ∣ Nat.card C ∧ (∀ c ∈ C, ∀ q ∈ P, Commute c q) ∧ C.IsComplement' P

/-- **Artin's induction theorem.** Over an algebraically closed characteristic-`0` field (the README's
declared regime for this layer; Artin is more field-robust than Brauer, but the regime is kept uniform),
`|G| · χ` is a `ℤ`-combination of
characters induced from cyclic subgroups; equivalently every character is a `ℚ`-combination of such. Any
statement about the index of the integral image is a separate lattice-determinant target, not this theorem. -/
theorem artin_induction [Fintype G] [CharZero k] [IsAlgClosed k] (V : FDRep k G) :
    Nat.card G • V.character ∈ AddSubgroup.closure
      { f : G → k | ∃ C : Subgroup G, IsCyclic C ∧ ∃ ψ : FDRep k C, f = indClassFun ψ.character } := sorry

/-- **Brauer's induction theorem.** Over an algebraically closed characteristic-`0` field (essential,
not decorative: over a non-splitting field such as `ℚ` the `FDRep` characters are not the absolutely
irreducible ones and the `ℤ`-span statement is a different, false claim — Brauer's theorem lives over
a splitting field), every character is a `ℤ`-combination of
characters induced from **elementary** subgroups: the induced map `⊕_{E elementary} R(E) → R(G)` is
surjective. -/
theorem brauer_induction [Fintype G] [CharZero k] [IsAlgClosed k] (V : FDRep k G) :
    V.character ∈ AddSubgroup.closure
      { f : G → k | ∃ E : Subgroup G, IsElementary E ∧ ∃ ψ : FDRep k E, f = indClassFun ψ.character } :=
  sorry

/-- **Brauer's characterization of characters.** Over an algebraically closed characteristic-`0`
field, a **class function** is a virtual character iff its restriction to every elementary subgroup
is a virtual character. The conjugacy-invariance hypothesis is essential even over `ℂ` (a
non-class-function on `S₃` can have every elementary restriction a virtual character), and is stated
inline so this file does not hard-depend on the character-theory roadmap's `ClassFunction`. -/
theorem brauer_characterization [Fintype G] [CharZero k] [IsAlgClosed k] (f : G → k)
    (hf : ∀ g h : G, f (h * g * h⁻¹) = f g) :
    f ∈ virtualCharacters ↔
      ∀ E : Subgroup G, IsElementary E → (fun x : E => f (x : G)) ∈ virtualCharacters := sorry

/-- **Artin's corollary.** A rational representation is determined by its **fixed-point dimensions**
on cyclic subgroups — one scalar per cyclic `C`, a strictly coarser invariant than the restricted
character (hypothesizing full character equality on every `⟨g⟩` would be equivalent to global
character equality and trivialize the statement). The averaged sum `∑_{c ∈ C} χ(c) = |C| · dim V^C`
is that scalar. -/
theorem rat_rep_iso_of_res_cyclic [Fintype G] (V W : FDRep ℚ G)
    (h : ∀ C : Subgroup G, IsCyclic C →
      ∑ c : C, V.character (c : G) = ∑ c : C, W.character (c : G)) :
    Nonempty (V ≅ W) := sorry

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

/-- **A projective representation** with factor set `α`: a normalized lift into the invertible maps,
`ρ : G → (V ≃ₗ[k] V)` with `ρ 1 = 1` and `ρ g * ρ h = α(g, h) · ρ (g * h)`, equivalently a homomorphism
`G → PGL(V)`. Invertibility (`V ≃ₗ[k] V`, not `V →ₗ[k] V`) and normalization are load-bearing: without
them the zero map satisfies the relation vacuously and the classification collapses. The cocycle
identity on `α` is included (on `V = 0` the action equation alone would constrain nothing). -/
def IsProjectiveRep {V : Type} [AddCommGroup V] [Module k V]
    (ρ : G → (V ≃ₗ[k] V)) (α : G × G → kˣ) : Prop :=
  ρ 1 = LinearEquiv.refl k V ∧
    (∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1) ∧
    (∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j)) ∧
    ∀ (g h : G) (x : V), ρ g (ρ h x) = (α (g, h) : k) • ρ (g * h) x

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
noncomputable def twistedMul (α : G × G → kˣ) : (G →₀ k) → (G →₀ k) → (G →₀ k) := sorry

/-- **The central extension** `1 → k^× → E_α → G → 1` built from a **normalized factor set**: the
underlying set `kˣ × G` with twisted multiplication `(a, g)(b, h) = (a * b * α(g, h), g * h)`. The cocycle
identity `hα` and the normalization `hα₁` are data, not decoration: without them the multiplication is
neither associative nor unital. `H²(G, k^×)` classifies these central extensions up to equivalence. -/
def centralExtensionOfFactorSet (α : G × G → kˣ)
    (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j))
    (hα₁ : ∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1) : Type := sorry

/-- **The Clifford-theory obstruction.** For `N ◁ G` and an irreducible `V : FDRep k N`, the projective
action lives on the **quotient** `inertia V / N` (using `N ≤ inertia V` normal in `inertia V`), so the
obstruction to extending `V` to an ordinary representation of `inertia V` (Layer 5) is a class in
`H²(inertia V / N, k^×)`, not in `H²(inertia V, k^×)`; `V` extends iff it is trivial, and in general the
irreducibles of the inertia group over `V` are the projective representations of `inertia V / N` carrying
that factor set. -/
noncomputable def cliffordObstruction {N : Subgroup G} [N.Normal] (V : FDRep k N)
    [(N.subgroupOf (inertia V)).Normal] :
    ↥(groupCohomology.H2
        (Rep.trivial ℤ (↥(inertia V) ⧸ N.subgroupOf (inertia V)) (Additive kˣ))) := sorry

end Projective

end TauCetiRoadmap.RepresentationTheory.InductionRestriction
