import Mathlib

/-!
# Root systems, Weyl groups, and the Cartan-Killing classification: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib already has the `RootPairing` structure with its `IsRootSystem`/`IsReduced`/
`IsCrystallographic`/`IsIrreducible` predicates, bases and simple roots (`RootPairing.Base`), the
Cartan matrix and the fact that a root system is determined up to isomorphism by it
(`RootPairing.Base.equivOfCartanMatrixEq`), the canonical positive-definite form (`posRootForm`), the
Weyl group as a group of automorphisms (`RootPairing.weylGroup`), the positivity predicate on roots
(`RootPairing.Base.IsPos`, `RootPairing.Base.height`) with simple-root reflection lemmas
(`RootPairing.Base.IsPos.reflectionPerm`, `RootPairing.Base.IsPos.induction_on_reflect`), and a
substantial theory of Coxeter groups (`CoxeterSystem`, `CoxeterSystem.length`, reduced words, the
standard finite-type Coxeter matrices). It does **not** develop the inversion combinatorics of the
Weyl group, identify the Weyl group as a Coxeter system, prove Matsumoto's theorem or the strong
exchange condition, develop positive roots as a set, Weyl chambers, the fundamental domain or the
longest element, or state any classification of Dynkin diagrams. See `README.md` for the
file-by-file map.

This is the shared foundation for `../LieHighestWeight/README.md` and `../ClassicalGroups/README.md`.
`README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.RootSystems

open Set Function RootPairing

/-! ## Layer 1: root combinatorics (positive roots, lowering, inversions)

The engine underneath the Coxeter presentation. Stated over a characteristic-zero field for a finite
reduced crystallographic root system, indexed by root indices `ι` throughout. Mathlib already supplies
the positivity predicate (`Base.IsPos`), heights (`Base.height`), the fact that a simple reflection
permutes the positive roots other than its own (`Base.IsPos.reflectionPerm`), and the positive-root
induction (`Base.IsPos.induction_on_reflect`); this layer builds the inversion sets and the
root-level exchange step that drive Layer 2. -/

section RootCombinatorics

variable {ι R M N : Type*}
  [CommRing R] [CharZero R] [IsDomain R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
  (P : RootPairing ι R M N)

/-- **The positive roots** relative to a base. -/
def posRoots (b : P.Base) : Set ι := {i | b.IsPos i}

/-- **The negative roots** relative to a base; the complement of `posRoots`. -/
def negRoots (b : P.Base) : Set ι := {i | ¬ b.IsPos i}

/-- The positive roots are finite. -/
theorem posRoots_finite [Finite ι] (b : P.Base) : (posRoots P b).Finite := sorry

/-- **Simple-root lowering.** A positive root that is not itself a simple root is lowered in height by
some simple reflection. This is the basic step of the positive-root induction and the root-level
exchange argument. -/
theorem exists_mem_support_height_reflectionPerm_lt [P.IsCrystallographic]
    (b : P.Base) {j : ι} (hj : b.IsPos j) (hj' : j ∉ b.support) :
    ∃ i ∈ b.support, b.height (P.reflectionPerm i j) < b.height j := sorry

/-- **The permutation action of the Weyl group on roots is faithful** for a root system (the roots
span, so an automorphism fixing every root index is the identity). This is what makes the Weyl group
of a finite root system finite. -/
theorem weylGroupToPerm_injective [P.IsRootSystem] :
    Function.Injective P.weylGroupToPerm := sorry

/-- **The Weyl group of a finite root system is finite**, via the faithful action on the finite root
index set. -/
theorem finite_weylGroup [Finite ι] [P.IsRootSystem] : Finite P.weylGroup := sorry

/-- **The inversion set** of a Weyl-group element: the positive roots it sends to negative roots. -/
def inversions (b : P.Base) (w : P.weylGroup) : Set ι :=
  {i | b.IsPos i ∧ ¬ b.IsPos (P.weylGroupToPerm w i)}

/-- **The root-level exchange step.** Right-multiplying by a simple reflection changes the number of
inversions by exactly one. Iterated, this is the exchange/deletion condition on the geometric action
and the combinatorial core of both generation and the Coxeter presentation. -/
theorem inversions_ncard_mul_ofIdx [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (w : P.weylGroup) {i : ι} (hi : i ∈ b.support) :
    (inversions P b (w * weylGroup.ofIdx P i)).ncard = (inversions P b w).ncard + 1 ∨
      (inversions P b (w * weylGroup.ofIdx P i)).ncard + 1 = (inversions P b w).ncard := sorry

end RootCombinatorics

/-! ## Layer 2: the Weyl group as a Coxeter system -/

section CoxeterPresentation

variable {ι R M N : Type*}
  [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
  (P : RootPairing ι R M N)

/-- **The Coxeter matrix of a base.** Its off-diagonal entry `m i j` is the order of `sᵢ sⱼ`, read off
the Cartan product `b.cartanMatrix i j * b.cartanMatrix j i ∈ {0,1,2,3}` as `0 ↦ 2, 1 ↦ 3, 2 ↦ 4,
3 ↦ 6`. That the product lands in `{0,1,2,3}`, so that the entry is a genuine Coxeter order, is the
reduced crystallographic finite-type input (`chainBotCoeff_add_chainTopCoeff_le_three`,
`coxeterWeight_nonneg`). -/
def coxeterMatrixOfBase [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    CoxeterMatrix b.support := sorry

/-- **The simple reflections generate the Weyl group.** Proved by the positive-root induction: every
reflection, hence every Weyl-group element, is a product of simple reflections. -/
theorem weylGroup_eq_closure_simple [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    (⊤ : Subgroup P.weylGroup) =
      Subgroup.closure (Set.range fun i : b.support => (weylGroup.ofIdx P (i : ι))) := sorry

/-- **The Coxeter presentation (Tits' theorem).** The Weyl group, equipped with the isomorphism to the
presented Coxeter group of `coxeterMatrixOfBase b`; the braid relations are a complete set of
relations. Surjectivity of the lift is generation (`weylGroup_eq_closure_simple`); injectivity is the
root-level exchange condition of Layer 1: a nonempty reduced word has a nonempty inversion set, so
moves some positive root to a negative one and acts nontrivially, hence the presented group has no
extra relations. This is the single hardest theorem of the roadmap. -/
noncomputable def weylCoxeterSystem [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    CoxeterSystem (coxeterMatrixOfBase P b) P.weylGroup := sorry

/-- **Length equals inversions.** The Coxeter length on `P.weylGroup` counts the positive roots made
negative; in particular a simple reflection has length `1`. -/
theorem length_weylCoxeterSystem_eq [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] (b : P.Base) (w : P.weylGroup) :
    (weylCoxeterSystem P b).length w = (inversions P b w).ncard := sorry

end CoxeterPresentation

/-! ## Layer 3: the missing Coxeter combinatorics (upstreamable, root-system-free) -/

section CoxeterCombinatorics

variable {B W : Type*} [Group W] {cM : CoxeterMatrix B} (cs : CoxeterSystem cM W)

/-- **The strong exchange condition.** If `t` is a reflection and left-multiplying a reduced word by
`t` shortens it, then `t · π ω` is obtained by deleting exactly one letter of `ω`. Mathlib flags this
as a TODO. -/
theorem strongExchange (ω : List B) (hω : cs.IsReduced ω) {t : W} (ht : cs.IsReflection t)
    (hlt : cs.length (t * cs.wordProd ω) < cs.length (cs.wordProd ω)) :
    ∃ j, j < ω.length ∧ t * cs.wordProd ω = cs.wordProd (ω.eraseIdx j) := sorry

/-- **Matsumoto's theorem (the lift/transport form).** Any two reduced words for the same element have
the same image under a map `f : B → G` that satisfies the braid relations; this is the well-definedness
of a value assigned to `w` along any reduced word, the form downstream users consume. Mathlib flags
this as a TODO. -/
theorem matsumoto {G : Type*} [Monoid G] (f : B → G)
    (hbraid : ∀ i i', ((CoxeterSystem.alternatingWord i i' (cM i i')).map f).prod
      = ((CoxeterSystem.alternatingWord i' i (cM i i')).map f).prod)
    {ω ω' : List B} (hω : cs.IsReduced ω) (hω' : cs.IsReduced ω')
    (h : cs.wordProd ω = cs.wordProd ω') :
    (ω.map f).prod = (ω'.map f).prod := sorry

end CoxeterCombinatorics

/-! ## Layer 4: chambers, the fundamental domain, and the longest element

Stated over `ℝ`, where the canonical form is positive-definite and the sign-pattern cones make sense
without extra topology. -/

section Geometry

variable {ι M N : Type*}
  [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
  (P : RootPairing ι ℝ M N)

/-- **The dominant (closed) chamber**, cut out by the signs of the simple coroot functionals. -/
def dominantChamber (b : P.Base) : Set M := {x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}

/-- **The dominant chamber meets every orbit**: every point is Weyl-conjugate into it. -/
theorem exists_mem_dominantChamber [Finite ι] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (x : M) : ∃ w : P.weylGroup, w • x ∈ dominantChamber P b := sorry

/-- **The closed dominant chamber is a fundamental domain**: a point of the open dominant chamber that
is Weyl-conjugate into the closed dominant chamber is fixed by the conjugating element. -/
theorem eq_of_mem_dominantChamber_interior [Finite ι] [P.IsRootSystem] [P.IsCrystallographic]
    [P.IsReduced] (b : P.Base) {x : M} (hx : ∀ i ∈ b.support, 0 < P.coroot' i x)
    (w : P.weylGroup) (hw : w • x ∈ dominantChamber P b) : w • x = x := sorry

/-- **The open dominant chamber has trivial stabilizer**: an element fixing an interior point is the
identity. With `exists_mem_dominantChamber` this is simple transitivity on the open chambers. -/
theorem eq_one_of_smul_eq_self_of_interior [Finite ι] [P.IsRootSystem] [P.IsCrystallographic]
    [P.IsReduced] (b : P.Base) {x : M} (hx : ∀ i ∈ b.support, 0 < P.coroot' i x)
    (w : P.weylGroup) (hw : w • x = x) : w = 1 := sorry

/-- **The longest element** of a finite Weyl group. -/
noncomputable def longestElement [Finite ι] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) : P.weylGroup := sorry

/-- The longest element sends every positive root to a negative root; its length is the number of
positive roots, and it is an involution. -/
theorem longestElement_spec [Finite ι] [P.IsRootSystem] [P.IsCrystallographic]
    [P.IsReduced] (b : P.Base) :
    (∀ i, b.IsPos i → ¬ b.IsPos (P.weylGroupToPerm (longestElement P b) i)) ∧
      (weylCoxeterSystem P b).length (longestElement P b) = (posRoots P b).ncard ∧
      (longestElement P b) ^ 2 = 1 := sorry

end Geometry

/-! ## Layer 5: Dynkin diagrams and the Cartan-Killing classification -/

/-- **The finite enumeration of Dynkin types.** The rank ranges that eliminate the low-rank
coincidences (`B₁ = C₁ = A₁`, `C₂ = B₂`, `D₂ = A₁×A₁`, `D₃ = A₃`) are carried by `DynkinType.Valid`
rather than the constructors, so `DynkinType` stays a plain enumeration. -/
inductive DynkinType where
  | A (n : ℕ) | B (n : ℕ) | C (n : ℕ) | D (n : ℕ)
  | E6 | E7 | E8 | F4 | G2

/-- The rank (number of simple roots) of each Dynkin type. -/
def DynkinType.rank : DynkinType → ℕ
  | .A n => n | .B n => n | .C n => n | .D n => n
  | .E6 => 6 | .E7 => 7 | .E8 => 8 | .F4 => 4 | .G2 => 2

/-- **Validity of a Dynkin type.** The rank bounds `A n (1 ≤ n)`, `B n (2 ≤ n)`, `C n (3 ≤ n)`,
`D n (4 ≤ n)` pin away the low-rank coincidences and the reducible/degenerate cases; only valid types
are realized by irreducible reduced crystallographic finite root systems, and the classification is a
bijection onto valid types. -/
def DynkinType.Valid : DynkinType → Prop
  | .A n => 1 ≤ n | .B n => 2 ≤ n | .C n => 3 ≤ n | .D n => 4 ≤ n
  | .E6 | .E7 | .E8 | .F4 | .G2 => True

/-- **The standard integer Cartan matrix** of each Dynkin type (diagonal `2`, the off-diagonal edges
and their multiplicities encoding the diagram). It is oriented: `DynkinType.cartanMatrix (.B n)` is the
transpose of `DynkinType.cartanMatrix (.C n)`, which is exactly what distinguishes `Bₙ` from `Cₙ`. -/
def DynkinType.cartanMatrix (t : DynkinType) : Matrix (Fin t.rank) (Fin t.rank) ℤ := sorry

/-- **The finite-type condition** on a Cartan matrix: a Cartan matrix (diagonal `2`, off-diagonal
`≤ 0`, `A i j = 0 ↔ A j i = 0`) that is symmetrizable with positive-definite symmetrization. -/
def IsFiniteType {B : Type*} [Fintype B] (A : Matrix B B ℤ) : Prop := sorry

section Classification

variable {ι R M N : Type*}
  [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
  (P : RootPairing ι R M N)

/-- **A base has a given Dynkin type** when its Cartan matrix reindexes to the standard one under a
single simultaneous row/column relabelling `e`. This is an oriented match, so `Bₙ` and `Cₙ` (transpose
Cartan matrices) are genuinely different types. -/
def HasCartanType [P.IsCrystallographic] (b : P.Base) (t : DynkinType) : Prop :=
  ∃ e : b.support ≃ Fin t.rank, ∀ i j, b.cartanMatrix i j = DynkinType.cartanMatrix t (e i) (e j)

/-- **The Cartan matrix of a finite crystallographic root system is of finite type.** Consumes the
positive-definiteness of the canonical form (`posRootForm_rootFormIn_posDef`). -/
theorem isFiniteType_cartanMatrix [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] (b : P.Base) :
    IsFiniteType b.cartanMatrix := sorry

/-- **The classification (uniqueness of type).** Every irreducible reduced crystallographic finite root
system has a unique **valid** Dynkin type. This is the combinatorial core: positive-definiteness bounds
the subdiagrams down to the `DynkinType` list, and validity removes the low-rank coincidences so the
type is unique. -/
theorem existsUnique_dynkinType [Finite ι] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] (b : P.Base) :
    ∃! t : DynkinType, t.Valid ∧ HasCartanType P b t := sorry

/-- **Same Dynkin type implies isomorphic.** The final isomorphism step, consuming Mathlib's
`equivOfCartanMatrixEq`: once two bases carry the same standard Cartan matrix, the root systems are
isomorphic. -/
theorem nonempty_equiv_of_hasCartanType {ι₂ M₂ N₂ : Type*}
    [AddCommGroup M₂] [Module R M₂] [AddCommGroup N₂] [Module R N₂]
    {P₂ : RootPairing ι₂ R M₂ N₂}
    [Finite ι] [Finite ι₂] [CharZero R] [IsDomain R]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]
    [P₂.IsRootSystem] [P₂.IsCrystallographic] [P₂.IsReduced]
    (b : P.Base) (b₂ : P₂.Base) (t : DynkinType)
    (h : HasCartanType P b t) (h₂ : HasCartanType P₂ b₂ t) :
    Nonempty (P.Equiv P₂) := sorry

end Classification

/-- **The classification (existence/realization).** Each **valid** Dynkin type is realized by an
irreducible reduced crystallographic finite root system over `ℚ`, in its ambient space of dimension
equal to the rank, built from an explicit coordinate model (so realization is independent of the
classification theorems it supports and introduces no circularity). -/
theorem exists_rootPairing_of_dynkinType (t : DynkinType) (ht : t.Valid) :
    ∃ (P : RootPairing (Fin t.rank) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)) (b : P.Base)
      (_hrs : P.IsRootSystem) (hcrys : P.IsCrystallographic) (_hred : P.IsReduced)
      (_hirr : P.IsIrreducible),
      @HasCartanType (Fin t.rank) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ) _ _ _ _ _ P hcrys b t := sorry

/-! ## Worked examples (acceptance criteria) -/

/-- **`Aₙ` and the symmetric group.** A root system whose Cartan matrix is of type `A n` (with
`1 ≤ n`, so rank `n` and roots indexed compatibly with `Fin (n + 1)`) has Weyl group the symmetric
group `Sₙ₊₁`. -/
theorem weylGroup_equiv_perm_of_typeA {ι M N : Type*}
    [AddCommGroup M] [Module ℚ M] [AddCommGroup N] [Module ℚ N] (P : RootPairing ι ℚ M N)
    [Finite ι] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible]
    (b : P.Base) {n : ℕ} (hn : 1 ≤ n) (h : HasCartanType P b (.A n)) :
    Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1))) := sorry

/-- **`G₂` explicitly.** Mathlib's `IsG2` root systems have Cartan matrix of type `G₂`, Weyl group the
dihedral group of order `12`, and `6` positive roots. -/
theorem weylGroup_equiv_dihedral_of_isG2 {ι M N : Type*}
    [AddCommGroup M] [Module ℚ M] [AddCommGroup N] [Module ℚ N] (P : RootPairing ι ℚ M N)
    [Finite ι] [P.IsRootSystem] [P.IsG2] (b : P.Base) :
    HasCartanType P b .G2 ∧ Nonempty (P.weylGroup ≃* DihedralGroup 6) := sorry

end TauCetiRoadmap.RepresentationTheory.RootSystems
