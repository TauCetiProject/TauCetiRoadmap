import Mathlib
import TauCeti.LinearAlgebra.RootSystem.Weyl.Chamber
import TauCeti.LinearAlgebra.RootSystem.DynkinType
import TauCeti.LinearAlgebra.RootSystem.NumberOfRoots
import TauCeti.LinearAlgebra.RootSystem.RootLength
import TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Assembly
import TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Rational

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
theorem inversions_ncard_mul_ofIdx [Finite ι]
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
3 ↦ 6`. That the product lands in `{0,1,2,3}`, so that the entry is a genuine Coxeter order, is
already packaged by Mathlib's `Finite/Lemmas.lean`: consume
`RootPairing.pairingIn_pairingIn_mem_set_of_isCrystal_of_isRed` (which pins the pair
`(pairingIn i j, pairingIn j i)` to an explicit finite list), with
`coxeterWeightIn_mem_set_of_isCrystallographic` / `coxeterWeightIn_le_four` /
`linearIndependent_iff_coxeterWeightIn_ne_four` as the surrounding API — this is a consume-and-read
step, not a new estimate. -/
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

/-! ## Layer 3: the missing Coxeter combinatorics (root-system-free) -/

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

/-- **Interior uniqueness**: a point of the open dominant chamber that is Weyl-conjugate into the
closed dominant chamber is fixed by the conjugating element. This is the interior case only; the
uniqueness of the dominant representative for every point of the closed chamber, walls included, is
the pinned `TauCeti.smul_eq_self_of_smul_mem_dominantChamber`. -/
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

/-- **The finite-type condition** on a Cartan matrix: a generalized Cartan matrix (diagonal `2`,
off-diagonal `≤ 0`, vanishing symmetric in the sense `A i j = 0 → A j i = 0`) that is symmetrizable
with positive-definite symmetrization. The symmetrizer is taken over `ℚ` (positive diagonal `d` with
`(d i * A i j)` positive-definite), which is equivalent to the usual formulations over `ℝ` for an
integer matrix. -/
def IsFiniteType {B : Type*} [Fintype B] (A : Matrix B B ℤ) : Prop :=
  (∀ i, A i i = 2) ∧ (∀ i j, i ≠ j → A i j ≤ 0) ∧ (∀ i j, A i j = 0 → A j i = 0) ∧
    ∃ d : B → ℚ, (∀ i, 0 < d i) ∧ (Matrix.of fun i j => d i * (A i j : ℚ)).PosDef

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
positive-definiteness of the canonical form (`posRootForm_rootFormIn_posDef`). Deliberately stated
without `[P.IsReduced]`, unlike the rest of this layer: positive-definiteness of the canonical form
does not need reducedness. -/
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

/-- The number of roots of each Dynkin type. This is the cardinality of the root index set, not
its rank (the number of simple roots). In particular `A 1` has rank one and two root indices. -/
def DynkinType.numRoots : DynkinType → ℕ
  | .A n => n * (n + 1)
  | .B n | .C n => 2 * n ^ 2
  | .D n => 2 * n * (n - 1)
  | .E6 => 72 | .E7 => 126 | .E8 => 240 | .F4 => 48 | .G2 => 12

/-- **The classification (existence/realization).** Each **valid** Dynkin type is realized by an
irreducible reduced crystallographic finite root system over `ℚ`, in an ambient space of dimension
equal to the rank, obtained by transport from the native pinned rational family through the
constructor dictionary below (so realization is independent of this roadmap's classification theorem).
The root-index carrier is
`Fin t.numRoots`; the ambient vector and covector carriers are `Fin t.rank → ℚ`. These differ already
for `A 1`. Pinning the ambient carrier to `Fin t.rank → ℚ` keeps the statement
instance-light, at the cost that the type-`A` model (the sum-zero hyperplane of `ℚ^{n+1}`, README
worked example) enters through an explicit basis of that hyperplane rather than in its natural ambient
space; an implementation may add an ambient-existential variant alongside, but this fixed-carrier
form is the pinned target. -/
theorem exists_rootPairing_of_dynkinType (t : DynkinType) (ht : t.Valid) :
    ∃ (P : RootPairing (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)) (b : P.Base)
      (_hrs : P.IsRootSystem) (hcrys : P.IsCrystallographic) (_hred : P.IsReduced)
      (_hirr : P.IsIrreducible),
      @HasCartanType (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ) _ _ _ _ _ P hcrys b t := sorry

/-! ## Layer 6: the Bourbaki numbering and integral root data

Layer 5 classifies root systems up to isomorphism. Downstream constructions need something stronger:
a *named* root datum over `ℤ` for each valid type, with its nodes numbered, rather than an existence
theorem they would have to `Classical.choose` from. The Chevalley--Demazure construction consumed by
the CFSG statement roadmap ([Add CFSG statement roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/156)) is the immediate consumer. -/

/-- **The Bourbaki node numbering**, pinned once. `DynkinType.cartanMatrix t` is indexed so that
Bourbaki node `i` sits at `Fin` index `i - 1`, and `cartanMatrix t i j = ⟨α_i, α_j^∨⟩`. Concretely:
the `A_n` chain runs `0, 1, …, n - 1` in order; `B_n` and `C_n` continue that chain with the double
edge between `n - 2` and `n - 1`, the short simple root being the last node of `B_n` and the long
one the last node of `C_n`; `D_n` forks at `n - 3`, with `n - 2` and `n - 1` the two fork nodes;
`E_n` follows Bourbaki with node `2` (index `1`) the branch node off the `1-3-4-5-6` chain; `F₄` has
`0, 1` long and `2, 3` short; and `G₂` has `0` short and `1` long, giving `!![2, -1; -3, 2]`.

Anything that permutes simple roots must be stated against this numbering, and zero-based `Fin`
indices are the trap: a diagram automorphism written as "`1 ↔ 6`" in Bourbaki labels is
`0 ↔ 5` here. -/
def DynkinType.IsLongSimpleRoot : (t : DynkinType) → Fin t.rank → Prop
  | .A _, _ => True
  | .D _, _ => True
  | .E6, _ | .E7, _ | .E8, _ => True
  | .B n, i => (i : ℕ) + 1 < n
  | .C n, i => (i : ℕ) + 1 = n
  | .F4, i => (i : ℕ) < 2
  | .G2, i => (i : ℕ) = 1

/-- **The pinned simply connected root datum** of a valid Dynkin type. Both lattices are
`Fin t.rank → ℤ`: the cocharacter lattice has the simple coroots as its standard basis, and the
character lattice has the fundamental weights as its standard basis, so `⟨ω_i, α_j^∨⟩ = δ_ij` and
the simple root `α_i` is the `i`-th row of `DynkinType.cartanMatrix t`. Roots are indexed by
`Fin t.numRoots`, with the first `t.rank` indices the simple roots in Bourbaki order.

This is a definition, not an existence statement, and that is the point: a consumer that needs a
carrier must be able to unfold to explicit data rather than choose one from
`exists_rootPairing_of_dynkinType`. -/
def DynkinType.simplyConnectedRootDatum (t : DynkinType) (_ht : t.Valid) :
    RootDatum (Fin t.numRoots) (Fin t.rank → ℤ) (Fin t.rank → ℤ) := sorry

/-- The base of the pinned datum, supported on the first `t.rank` root indices in Bourbaki order. -/
def DynkinType.simplyConnectedBase (t : DynkinType) (ht : t.Valid) :
    (t.simplyConnectedRootDatum ht).Base := sorry

/-- The pinned datum realizes its own type, against the pinned numbering. Together with
`DynkinType.simplyConnectedRootDatum` this replaces `exists_rootPairing_of_dynkinType` for consumers
that need a named carrier. -/
theorem DynkinType.hasCartanType_simplyConnectedRootDatum (t : DynkinType) (ht : t.Valid) :
    ∃ _hcrys : (t.simplyConnectedRootDatum ht).IsCrystallographic,
      HasCartanType (t.simplyConnectedRootDatum ht) (t.simplyConnectedBase ht) t := sorry

/-- The pinned datum is the **simply connected** form: its cocharacter lattice is spanned by the
coroots. The adjoint form is the dual choice, with the character lattice spanned by the roots; a
consumer that needs it takes `RootPairing.flip` of the corresponding datum rather than a second
pinned definition. -/
theorem DynkinType.span_coroot_simplyConnectedRootDatum (t : DynkinType) (ht : t.Valid) :
    Submodule.span ℤ (Set.range (t.simplyConnectedRootDatum ht).coroot) = ⊤ := sorry

/-! ### Compatibility with the existing Tau Ceti Dynkin/root-datum API

The roadmap enumeration below is intentionally local and remains the statement carrier for this
roadmap. Its constructor dictionary to the installed native enumeration is explicit; all transport
lemmas are independent of the classification theorem. -/

/-- Constructor-preserving dictionary to the installed Tau Ceti enumeration. -/
def toNativeDynkinType : DynkinType → _root_.TauCeti.DynkinType
  | .A n => _root_.TauCeti.DynkinType.A n
  | .B n => _root_.TauCeti.DynkinType.B n
  | .C n => _root_.TauCeti.DynkinType.C n
  | .D n => _root_.TauCeti.DynkinType.D n
  | .E6 => _root_.TauCeti.DynkinType.E6
  | .E7 => _root_.TauCeti.DynkinType.E7
  | .E8 => _root_.TauCeti.DynkinType.E8
  | .F4 => _root_.TauCeti.DynkinType.F4
  | .G2 => _root_.TauCeti.DynkinType.G2

/-- The dictionary preserves the classifier's rank, separately from its root count. -/
theorem toNative_rank (t : DynkinType) :
    t.rank = (toNativeDynkinType t).rank := sorry

/-- The dictionary preserves the exact root-index cardinality; this is not the rank equality. -/
theorem toNative_numRoots (t : DynkinType) :
    t.numRoots = (toNativeDynkinType t).numRoots := sorry

/-- Validity predicates agree under the constructor dictionary. -/
theorem toNative_valid (t : DynkinType) :
    t.Valid ↔ (toNativeDynkinType t).Valid := sorry

/-- The cast induced by the rank equality sends each local Bourbaki node to the same native node. -/
def toNativeNode (t : DynkinType) (i : Fin t.rank) :
    Fin (toNativeDynkinType t).rank := Fin.cast (toNative_rank t) i

/-- The cast induced by the root-count equality sends each local root label to the same native
root label. -/
def toNativeRootIndex (t : DynkinType) (i : Fin t.numRoots) :
    Fin (toNativeDynkinType t).numRoots := Fin.cast (toNative_numRoots t) i

/-- The dictionary preserves the oriented Cartan entries, not merely their unoriented diagram. -/
theorem toNative_cartanMatrix (t : DynkinType) (i j : Fin t.rank) :
    t.cartanMatrix i j =
      (toNativeDynkinType t).cartanMatrix (toNativeNode t i) (toNativeNode t j) := sorry

/-- For any crystallographic pairing/base, local and native `HasCartanType` agree after the
rank-index cast. This is the oriented statement; it does not quotient by transpose. -/
theorem hasCartanType_iff_native {ι R M N : Type*}
    [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) [P.IsCrystallographic]
    (b : P.Base) (t : DynkinType) :
    HasCartanType P b t ↔ _root_.TauCeti.HasCartanType P b (toNativeDynkinType t) := sorry

/-- Long/short labels agree at the same Bourbaki node. This includes the B/C orientation and G₂'s
short-first convention. -/
theorem toNative_isLongSimpleRoot (t : DynkinType) (i : Fin t.rank) :
    t.IsLongSimpleRoot i ↔
      (toNativeDynkinType t).IsLongSimpleRoot (toNativeNode t i) := sorry

/-- The native rational realization, exposed for local roadmap consumers through the dictionary. -/
noncomputable def nativeRationalRootSystem (t : DynkinType) (ht : t.Valid) :=
  (toNativeDynkinType t).rationalRootSystem ((toNative_valid t).mp ht)

/-- The local wrapper uses the native rational realization's proved crystallographic instance. -/
noncomputable instance instIsCrystallographicNativeRationalRootSystem
    (t : DynkinType) (ht : t.Valid) :
    (nativeRationalRootSystem t ht).IsCrystallographic := by
  change ((toNativeDynkinType t).rationalRootSystem ((toNative_valid t).mp ht)).IsCrystallographic
  infer_instance

/-- Its native Bourbaki-numbered base. -/
noncomputable def nativeRationalBase (t : DynkinType) (ht : t.Valid) :=
  (toNativeDynkinType t).rationalBase ((toNative_valid t).mp ht)

/-- Reindex the native supplied realization to the local oriented Cartan type. The proof uses the
native `hasCartanType_rationalRootSystem` theorem plus `toNative_cartanMatrix`, and does not invoke
`existsUnique_dynkinType`. -/
theorem nativeRationalRootSystem_has_local_type (t : DynkinType) (ht : t.Valid) :
    HasCartanType (nativeRationalRootSystem t ht) (nativeRationalBase t ht) t := sorry

/-- Transport the native simply connected datum to the local named datum. The equivalence must
commute with roots and coroots under `toNativeRootIndex`, preserve the integral pairing, carry the
native `simpleIndex` to the local first-`rank` simple-root indexing, and commute with base change to
`ℚ`. The character coordinates are the fundamental-weight basis and the cocharacter coordinates
are the simple-coroot basis; the transport proves their Kronecker pairing and Cartan-row equations.
This is the construction source for the local datum, not a second independent coordinate model. -/
theorem simplyConnectedRootDatum_native_equiv (t : DynkinType) (ht : t.Valid) :
    Nonempty (RootPairing.Equiv (t.simplyConnectedRootDatum ht)
      ((toNativeDynkinType t).simplyConnectedRootDatum ((toNative_valid t).mp ht))) := sorry

/-- The transported integral base has the local oriented Bourbaki type. This comparison must use
native `simpleSupportEquivSimplyConnectedBase` and `simpleIndex`, then `toNative_cartanMatrix`.
In the pinned fundamental-weight/simple-coroot coordinates, simple-root vectors are the rows of
the Cartan matrix and simple-coroot vectors are the standard basis vectors; their pairing is
`⟨ω_i, α_j^∨⟩ = δᵢⱼ`. A Cartan transpose belongs to the reversed pairing/dual-coordinate convention,
not to these root and coroot coordinate vectors. -/
theorem nativeSimplyConnectedDatum_has_local_type (t : DynkinType) (ht : t.Valid) :
    HasCartanType
      ((toNativeDynkinType t).simplyConnectedRootDatum ((toNative_valid t).mp ht))
      ((toNativeDynkinType t).simplyConnectedBase ((toNative_valid t).mp ht)) t := sorry


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


/-! ## Finite root automorphisms: native chamber complement and semidirect endpoint

Only the complement is a new root application; the generic equivalence is native.
The integral/full-datum target does not assume integral IsRootSystem. -/

namespace RootAutomorphisms

section Pairing
variable {ι R M N : Type*} [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- The actual subgroup preserving the chosen simple-root index set. -/
def basedAut (P : RootPairing ι R M N) (b : P.Base) : Subgroup P.Aut where
  carrier := {g | g.indexEquiv '' b.support = b.support}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem weyl_normal (P : RootPairing ι R M N) : P.weylGroup.Normal := by sorry

/-- Native conjugation action, with its actual normalizer inclusion. -/
noncomputable def basedConjugation (P : RootPairing ι R M N) (b : P.Base) :
    basedAut P b →* MulAut P.weylGroup := by
  letI := weyl_normal P
  exact P.weylGroup.normalizerMonoidHom.comp
    (Subgroup.inclusion (P.weylGroup.normalizer_eq_top ▸ le_top))

/-- This is exactly the native subgroup-complement equivalence. -/
noncomputable def semidirectEquiv (P : RootPairing ι R M N) (b : P.Base)
    (hc : P.weylGroup.IsComplement' (basedAut P b)) :
    (P.weylGroup ⋊[basedConjugation P b] basedAut P b) ≃* P.Aut := by
  letI := weyl_normal P
  exact SemidirectProduct.mulEquivSubgroup hc

theorem semidirectEquiv_apply (P : RootPairing ι R M N) (b : P.Base)
    (hc : P.weylGroup.IsComplement' (basedAut P b))
    (x : P.weylGroup ⋊[basedConjugation P b] basedAut P b) :
    semidirectEquiv P b hc x = (x.left : P.Aut) * (x.right : P.Aut) := by rfl

/-- Both factors are actual projections of the native inverse, not admitted values. -/
noncomputable def weylFactor (P : RootPairing ι R M N) (b : P.Base)
    (hc : P.weylGroup.IsComplement' (basedAut P b)) (g : P.Aut) : P.weylGroup :=
  ((semidirectEquiv P b hc).symm g).left

noncomputable def basedFactor (P : RootPairing ι R M N) (b : P.Base)
    (hc : P.weylGroup.IsComplement' (basedAut P b)) (g : P.Aut) : basedAut P b :=
  ((semidirectEquiv P b hc).symm g).right

theorem factorization (P : RootPairing ι R M N) (b : P.Base)
    (hc : P.weylGroup.IsComplement' (basedAut P b)) (g : P.Aut) :
    g = (weylFactor P b hc g : P.Aut) * (basedFactor P b hc g : P.Aut) := by sorry

/-- A specified lattice-preserving subgroup; the forward coweight map is inverse. -/
def latticePreserving (P : RootPairing ι R M N)
    (X₀ : AddSubgroup M) (Y₀ : AddSubgroup N) : Subgroup P.Aut where
  carrier := {g | g.weightEquiv '' (X₀ : Set M) = X₀ ∧
    g.coweightEquiv.symm '' (Y₀ : Set N) = Y₀}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
end Pairing

section Real
variable {ι M N : Type*} [AddCommGroup M] [Module ℝ M]
  [AddCommGroup N] [Module ℝ N] (P : RootPairing ι ℝ M N)
  [Finite ι] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]

theorem weyl_based_complement (b : P.Base) :
    P.weylGroup.IsComplement' (basedAut P b) := by sorry

theorem image_openDominantChamber (b : P.Base) (g : P.Aut) :
    g.weightEquiv '' TauCeti.openDominantChamber P b =
      TauCeti.openWeylChamber P b (weylFactor P b (weyl_based_complement P b) g) := by sorry
end Real

section FullIntegralDatum
variable {ι X Y : Type*} [Finite ι] [AddCommGroup X]
  [AddCommGroup Y] [Module.Finite ℤ X] [Module.Free ℤ X]
  [Module.Finite ℤ Y] [Module.Free ℤ Y]
  (D : RootDatum ι X Y) [D.IsCrystallographic] [D.IsReduced]

/-- Prove this through rational cylinder chambers, retaining central lattice gluing.
No IsRootSystem over ℤ or integral central splitting is assumed. -/
theorem full_datum_complement (b : D.Base) :
    D.weylGroup.IsComplement' (basedAut D b) := by sorry
end FullIntegralDatum

end RootAutomorphisms

end TauCetiRoadmap.RepresentationTheory.RootSystems
