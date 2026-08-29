import Mathlib

/-!
# Belyi maps, dessins d'enfants, and three-point covers: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`, which numbers the milestones as Layer `n.m`. The statements here suggest Lean
forms for particular milestones, so that contributors and reviewers agree on names and
signatures. Discharging all of them finishes neither a layer nor the roadmap.

What is prototyped here, in preference to end theorems, are the objects whose choice of
carrier, index type, or map determines everything below them: the permutation-triple carrier
with its pinned product relation, the relabeling action, dessins as bipartite ribbon graphs,
triangle groups, the thrice-punctured sphere with its concrete peripheral loops, the
monodromy homomorphism, the analytic Belyi-pair carrier, and the profinite peripheral
objects with the pro-`ℓ` peripheral-power theorem. Every declaration elaborates against the
pinned Mathlib. Proofs are `sorry` where the milestone is the proof; data is real wherever
the formula is the convention being pinned.

Conventions, recorded in `README.md` (§Pinned conventions):

* Multiplication is Mathlib's: `(σ * τ) x = σ (τ x)` in `Equiv.Perm`, and `γ * δ` in
  `FundamentalGroup` is "`δ` first, then `γ`" (`End.mul_def`). The product relation is
  `σinf * σ1 * σ0 = 1`, and the monodromy homomorphism of Layer 5.3 is a genuine
  `MonoidHom` with no `ᵐᵒᵖ`. The `z ↦ z²` example below pins the interpretation.
* Relabeling is the left conjugation `MulAction`; isomorphism is `MulAction.orbitRel`.
* Cycle data always includes fixed points: every occurrence uses the imported
  `PolynomialGaloisGroups.fullCycleType`. Mathlib's bare `Equiv.Perm.cycleType` is never
  compared with a partition of `n`.
* Connectedness of a triple includes `n ≠ 0`; `MulAction.IsPretransitive` alone is
  vacuously true on `Fin 0`.
* The genus is defined only after the Euler-characteristic bounds; the `Int.toNat` in
  `genus` is made junk-free by `two_sub_two_mul_genus`.
* Peripheral elements: `P`, `T` are the images of the free generators, `C := (T * P)⁻¹`,
  so `C * T * P = 1` — the same display order as the triple relation. A source writing
  `P·T·C = 1` names a conjugate of this `C`; see README §Pinned conventions.
* The former local `OnePoint ℂ` chart/manifold instances are disabled with the rest of the
  compact-Riemann-surface stand-ins. Their owner must publish the sphere carrier before the
  analytic Belyi successor states consumers.
* Supplier-dependent passport declarations, compact-Riemann-surface declarations, Layers 9–11,
  and the profinite layers have no Lean prototypes here. They become successor targets only after
  their owning roadmaps publish compiled carriers. In particular this file neither imports an
  unmerged roadmap branch nor recreates its API locally.
* A literal `PermutationTriple n` is the invariant of a **connected, fiber-numbered** cover
  (`ConnectedFiberNumberedCover` below), not of a pointed one: a chosen point of the fiber
  leaves `(n−1)!` relabelings. Connectedness is a field of all three carriers, because a
  transitive triple classifies a connected cover and nothing weaker. "Covers up to
  isomorphism" is a quotient type here, never a `Prop`: README Layer 6.3 classifies the
  three rigidifications separately and the three quotient carriers are
  `ConnectedFiberNumberedCoverClass`, `ConnectedPointedCoverClass`, `ConnectedCoverClass`.
* The two-open Seifert–van Kampen theorem is general algebraic topology and is owned by
  UniversalCovers, not here; this file instantiates it (Layer 5.6) and exports no copy.
* The associated-cover construction and the subgroup half of the covering classification are
  intentionally absent here. Their semilocal-simple-connectivity and universal-cover carriers
  are unresolved supplier contracts: UniversalCovers has not yet published compiled target
  signatures. No local class stands in for that future public interface.
* The profinite integers as a ring, profinite exponentiation, and continuous outer
  automorphisms are generic group theory owned by `ProfiniteArithmetic`, the generic successor
  to `ProfiniteProPGroups` (#244), not by Belyi maps. Free profinite and free pro-`p` groups and
  the maximal pro-`p` quotient come from `ProfiniteProPGroups` itself.
-/

open scoped Manifold ContDiff Topology Pointwise

/- ⚠ Auto-implicits are off. This file is a set of exact signatures, and with them on a
Mathlib name that has been renamed at the pin is silently bound as a fresh variable rather
than reported: `PartialHomeomorph` (`OpenPartialHomeomorph` at this pin) was caught only
because it happened to be applied to arguments. -/
set_option autoImplicit false

namespace TauCetiRoadmap.BelyiMaps

universe u v

/-! ## Layer 0: permutation triples -/

/-- **Layer 0.1.** A degree-`n` permutation triple, with the pinned relation
`σinf * σ1 * σ0 = 1` in Mathlib's multiplication: the concatenated loop
"`γ0`, then `γ1`, then `γ∞`" is nullhomotopic, and monodromy is covariant. -/
@[ext]
structure PermutationTriple (n : ℕ) where
  σ0 : Equiv.Perm (Fin n)
  σ1 : Equiv.Perm (Fin n)
  σinf : Equiv.Perm (Fin n)
  product_eq_one : σinf * σ1 * σ0 = 1

namespace PermutationTriple

variable {n : ℕ}

/-- **Layer 0.1.** The constructor from the first two components. -/
def ofTwo (σ0 σ1 : Equiv.Perm (Fin n)) : PermutationTriple n where
  σ0 := σ0
  σ1 := σ1
  σinf := (σ1 * σ0)⁻¹
  product_eq_one := by group

@[simp] theorem ofTwo_σ0 (σ0 σ1 : Equiv.Perm (Fin n)) : (ofTwo σ0 σ1).σ0 = σ0 := rfl
@[simp] theorem ofTwo_σ1 (σ0 σ1 : Equiv.Perm (Fin n)) : (ofTwo σ0 σ1).σ1 = σ1 := rfl
@[simp] theorem ofTwo_σinf (σ0 σ1 : Equiv.Perm (Fin n)) :
    (ofTwo σ0 σ1).σinf = (σ1 * σ0)⁻¹ := rfl

/-- **Layer 0.1.** `σinf` is determined by the other two components. -/
theorem σinf_eq (t : PermutationTriple n) : t.σinf = (t.σ1 * t.σ0)⁻¹ := by
  have h := t.product_eq_one
  rw [mul_assoc] at h
  exact eq_inv_of_mul_eq_one_left h

/-- **Layer 0.1.** Extensionality on the first two components. -/
theorem ext_of_two {t t' : PermutationTriple n} (h0 : t.σ0 = t'.σ0) (h1 : t.σ1 = t'.σ1) :
    t = t' := by
  ext1
  · exact h0
  · exact h1
  · rw [t.σinf_eq, t'.σinf_eq, h0, h1]

/-- **Layer 0.1.** A triple is exactly a pair of permutations: the third component is
determined. This is the `Equiv` that carries the `Fintype` and `DecidableEq` instances, and
the one Layer 3.1's enumeration runs on. -/
def equivPair (n : ℕ) : PermutationTriple n ≃ Equiv.Perm (Fin n) × Equiv.Perm (Fin n) where
  toFun t := (t.σ0, t.σ1)
  invFun p := ofTwo p.1 p.2
  left_inv _ := ext_of_two rfl rfl
  right_inv _ := rfl

/-- **Layer 0.1.** Finiteness, computably, through `equivPair`. -/
instance : Fintype (PermutationTriple n) :=
  Fintype.ofEquiv _ (equivPair n).symm

/-- **Layer 0.1.** Decidable equality, computably, through `ext_of_two`. -/
instance : DecidableEq (PermutationTriple n) := fun t t' =>
  decidable_of_iff (t.σ0 = t'.σ0 ∧ t.σ1 = t'.σ1)
    ⟨fun h => ext_of_two h.1 h.2, fun h => h ▸ ⟨rfl, rfl⟩⟩

/-- **Layer 0.1, the opposite-convention translation.** Componentwise inversion is the
bijection with triples for the rival relation `σ0 * σ1 * σinf = 1`; it preserves cycle
types, monodromy, connectedness, and automorphisms (README, Layer 0.1). -/
theorem inv_components_reverse (t : PermutationTriple n) :
    t.σ0⁻¹ * t.σ1⁻¹ * t.σinf⁻¹ = 1 := by
  have h := t.product_eq_one
  have : (t.σinf * t.σ1 * t.σ0)⁻¹ = 1 := by rw [h]; simp
  simpa [mul_inv_rev, mul_assoc] using this

/-- **Layer 0.1, the convention-pinning example.** The monodromy triple of `z ↦ z²`:
`σ0 = σinf = (0 1)`, `σ1 = 1`. -/
example : (ofTwo (Equiv.swap 0 1) 1 : PermutationTriple 2).σinf = Equiv.swap 0 1 := by
  simp

/-! ### The LMFDB translation, machine-checked

The frozen LMFDB record `3T2-3_2.1_2.1-a` (retained in the private provenance ledger) stores the triple
`(1,2,3)`, `(2,3)`, `(1,2)`, which `0`-indexed is `finRotate 3`, `swap 1 2`, `swap 0 1`.
Because the database composes permutations left to right, that stored triple satisfies the
**opposite** relation in Mathlib's multiplication — and its componentwise inverse, the
Layer 0.1 involution, is a triple in this roadmap's convention. The two `decide`s below are
the machine-checked form of Layer 14.2's translation lemma on one record; a record whose
data is symmetric under the swap (`σ1 = σ0`, `σinf = 1`) would check both relations and
verify nothing. -/

/-- The stored LMFDB triple satisfies `σ0 * σ1 * σinf = 1`, not this roadmap's relation. -/
example : finRotate 3 * Equiv.swap 1 2 * Equiv.swap 0 1 = 1 := by decide

/-- It does **not** satisfy this roadmap's relation: the two conventions really differ. -/
example : Equiv.swap 0 1 * Equiv.swap 1 2 * finRotate 3 ≠ 1 := by decide

/-- The componentwise inverse does satisfy this roadmap's relation. -/
example : Equiv.swap 0 1 * Equiv.swap 1 2 * (finRotate 3)⁻¹ = 1 := by decide

/-- The frozen record as a `PermutationTriple` in this roadmap's convention. -/
def lmfdb3T2 : PermutationTriple 3 :=
  ⟨(finRotate 3)⁻¹, Equiv.swap 1 2, Equiv.swap 0 1, by decide⟩

/-! ### Layer 0.2: relabeling -/

/-- **Layer 0.2.** Simultaneous conjugation, as a left action. -/
instance : SMul (Equiv.Perm (Fin n)) (PermutationTriple n) where
  smul τ t :=
    { σ0 := MulAut.conj τ t.σ0
      σ1 := MulAut.conj τ t.σ1
      σinf := MulAut.conj τ t.σinf
      product_eq_one := by
        rw [← map_mul, ← map_mul, t.product_eq_one, map_one] }

@[simp] theorem smul_σ0 (τ : Equiv.Perm (Fin n)) (t : PermutationTriple n) :
    (τ • t).σ0 = τ * t.σ0 * τ⁻¹ := rfl
@[simp] theorem smul_σ1 (τ : Equiv.Perm (Fin n)) (t : PermutationTriple n) :
    (τ • t).σ1 = τ * t.σ1 * τ⁻¹ := rfl
@[simp] theorem smul_σinf (τ : Equiv.Perm (Fin n)) (t : PermutationTriple n) :
    (τ • t).σinf = τ * t.σinf * τ⁻¹ := rfl

instance : MulAction (Equiv.Perm (Fin n)) (PermutationTriple n) where
  one_smul t := by ext1 <;> simp
  mul_smul τ υ t := by ext1 <;> simp [mul_assoc]

/-- **Layer 0.2.** Isomorphism of triples is simultaneous conjugacy. -/
def Equivalent (t t' : PermutationTriple n) : Prop :=
  ∃ τ : Equiv.Perm (Fin n), τ • t = t'

/-- **Layer 0.2.** The type of isomorphism classes. -/
def IsoClass (n : ℕ) : Type :=
  MulAction.orbitRel.Quotient (Equiv.Perm (Fin n)) (PermutationTriple n)

/-! ### Layers 0.3, 0.4: monodromy, connectedness, automorphisms -/

/-- **Layer 0.3.** The monodromy group, generated by the first two components. -/
def monodromyGroup (t : PermutationTriple n) : Subgroup (Equiv.Perm (Fin n)) :=
  Subgroup.closure {t.σ0, t.σ1}

theorem σinf_mem_monodromyGroup (t : PermutationTriple n) :
    t.σinf ∈ monodromyGroup t := by
  rw [t.σinf_eq]
  exact inv_mem (mul_mem (Subgroup.subset_closure (by simp))
    (Subgroup.subset_closure (by simp)))

/-- **Layer 0.4.** Connectedness. ⚠ The `n ≠ 0` clause is part of the definition:
pretransitivity is vacuous on `Fin 0`, and the genus formula fails there. -/
def IsConnected (t : PermutationTriple n) : Prop :=
  n ≠ 0 ∧ MulAction.IsPretransitive (monodromyGroup t) (Fin n)

/-- **Layer 0.2, 0.4.** Connectedness is invariant under relabeling — the lemma that makes
`ConnectedTriple` an `Equiv.Perm (Fin n)`-set. -/
theorem isConnected_smul (τ : Equiv.Perm (Fin n)) {t : PermutationTriple n}
    (ht : t.IsConnected) : (τ • t).IsConnected := by
  sorry

/-- **Layer 3.1.** The closure of a set of labels under the two generators, one round. -/
def orbitStep (t : PermutationTriple n) (s : Finset (Fin n)) : Finset (Fin n) :=
  s ∪ s.image (fun i => t.σ0 i) ∪ s.image (fun i => t.σ1 i)

/-- **Layer 3.1.** Connectedness, computably: `n` rounds of closure from each label
saturate iff the monodromy group is transitive. `n` rounds suffice because a round that
adds nothing is stationary and each earlier round adds at least one label. -/
def isConnectedB (t : PermutationTriple n) : Bool :=
  decide (n ≠ 0) && decide (∀ i : Fin n, (orbitStep t)^[n] {i} = Finset.univ)

/-- **Layer 3.1.** Soundness of the computable connectedness test. -/
theorem isConnectedB_eq_true_iff (t : PermutationTriple n) :
    isConnectedB t = true ↔ t.IsConnected := by
  sorry

/-- **Layer 0.4.** The automorphism group is the stabilizer under relabeling —
definitionally the simultaneous centralizer. -/
def automorphismGroup (t : PermutationTriple n) : Subgroup (Equiv.Perm (Fin n)) :=
  MulAction.stabilizer (Equiv.Perm (Fin n)) t

/-- **Layer 0.4.** The automorphism group is the centralizer of the monodromy group. -/
theorem automorphismGroup_eq_centralizer (t : PermutationTriple n) :
    automorphismGroup t = Subgroup.centralizer (monodromyGroup t) := by
  sorry

/-- **Layer 0.4.** For connected triples the automorphism action on `Fin n` is free, so
the automorphism group's order divides `n`. -/
theorem card_automorphismGroup_dvd (t : PermutationTriple n) (ht : t.IsConnected) :
    Nat.card (automorphismGroup t) ∣ n := by
  sorry

/-! ### Deferred supplier crossing: cycle data and genus

The full-cycle carrier and transitive-group labels are owned by `PolynomialGaloisGroups` (#243).
Until that roadmap lands, this file deliberately exports neither a substitute carrier nor the
passport/genus declarations that consume it. The exact downstream contracts remain in the README. -/

/-

/-- **Layer 0.5.** The number of cycles, fixed points included. -/
noncomputable def cycleCount {α : Type u} [Fintype α] (σ : Equiv.Perm α) : ℕ :=
  (@PolynomialGaloisGroups.fullCycleType α _ (Classical.decEq α) σ).card

theorem fullCycleType_sum {α : Type u} [Fintype α] (σ : Equiv.Perm α) :
    (@PolynomialGaloisGroups.fullCycleType α _ (Classical.decEq α) σ).sum
      = Fintype.card α := by
  sorry

/-! **Layer 3.1: the computable cycle decomposition.** The imported `fullCycleType` is built
from Mathlib's `Equiv.Perm.cycleType`, which goes through `cycleFactorsFinset` and is not an
executable decomposition; every `#eval` and `decide` in Layers 3 and 14 runs on the definitions
below instead, and `computedCycleType_eq_fullCycleType` is what licenses that. -/

/-- **Layer 3.1.** The length of the cycle of `σ` through `i`: the least `k ≥ 1` with
`σ ^ k i = i`, found by a bounded scan. -/
def cycleLenOf (σ : Equiv.Perm (Fin n)) (i : Fin n) : ℕ :=
  ((List.range n).find? fun k => decide ((σ ^ (k + 1)) i = i)).elim n (· + 1)

/-- **Layer 3.1.** Whether `i` is the least label in its `σ`-orbit — the orbit
representative the decomposition below selects. The quantifier is bounded, hence
decidable. -/
def isOrbitMin (σ : Equiv.Perm (Fin n)) (i : Fin n) : Bool :=
  decide (∀ k < n, i ≤ (σ ^ k) i)

/-- **Layer 3.1.** The full cycle type, computably: one part per orbit, fixed points
included. -/
def computedCycleType (σ : Equiv.Perm (Fin n)) : Multiset ℕ :=
  (Finset.univ.filter fun i => isOrbitMin σ i = true).val.map (cycleLenOf σ)

/-- **Layer 3.1, the comparison theorem.** The executable decomposition agrees with the
abstract one. Without this, none of Layer 3's `#eval`s is evidence about `fullCycleType`. -/
theorem computedCycleType_eq_fullCycleType (σ : Equiv.Perm (Fin n)) :
    computedCycleType σ = PolynomialGaloisGroups.fullCycleType σ := by
  sorry

/-- **Layer 0.5, the transposition step lemma.** Multiplying by a transposition merges two
cycles or splits one. -/
theorem cycleCount_swap_mul {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) {i j : α} (hij : i ≠ j) :
    cycleCount (Equiv.swap i j * σ) =
      if σ.SameCycle i j then cycleCount σ + 1 else cycleCount σ - 1 := by
  sorry

/-- **Layer 0.5, the sign identity.** -/
theorem sign_eq_pow_sub_cycleCount {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) :
    Equiv.Perm.sign σ = (-1 : ℤˣ) ^ (Fintype.card α - cycleCount σ) := by
  sorry

/-! ### Layer 0.6: Euler characteristic and genus -/

/-- **Layer 0.6.** The Euler characteristic, in `ℤ`, before any genus is defined. -/
noncomputable def eulerChar (t : PermutationTriple n) : ℤ :=
  cycleCount t.σ0 + cycleCount t.σ1 + cycleCount t.σinf - n

/-- **Layer 0.6 (parity).** For every product-one triple, `2 - χ` is even — the sign
identity applied to the relation. No connectedness is needed. -/
theorem even_two_sub_eulerChar (t : PermutationTriple n) : Even (2 - t.eulerChar) := by
  sorry

/-- **Layer 0.6 (the connected bound).** `χ ≤ 2` for connected triples. Proof route:
induction along a minimal transposition factorization of `σ1` with
`cycleCount_swap_mul`; source Lando–Zvonkin (see the private provenance ledger). -/
theorem eulerChar_le_two (t : PermutationTriple n) (ht : t.IsConnected) :
    t.eulerChar ≤ 2 := by
  sorry

/-- **Layer 0.6.** The genus. Junk-free by `two_sub_two_mul_genus`; never used before the
bounds above. -/
noncomputable def genus (t : PermutationTriple n) : ℕ :=
  ((2 - t.eulerChar) / 2).toNat

/-- **Layer 0.6.** `2 - 2g = χ` for connected triples: the `toNat` loses nothing. -/
theorem two_sub_two_mul_genus (t : PermutationTriple n) (ht : t.IsConnected) :
    2 - 2 * (t.genus : ℤ) = t.eulerChar := by
  sorry
-/

/-! ### Layer 0.7: orders and geometry type -/

/-- **Layer 0.7.** The order triple — the LMFDB's `abc` datum. -/
noncomputable def orderTriple (t : PermutationTriple n) : ℕ × ℕ × ℕ :=
  (orderOf t.σ0, orderOf t.σ1, orderOf t.σinf)

/-- **Layer 0.7.** Spherical, Euclidean, or hyperbolic. -/
inductive GeometryType : Type
  | spherical
  | euclidean
  | hyperbolic
  deriving DecidableEq, Repr

/-- **Layer 0.7.** The geometry type, by exact comparison in `ℚ`. -/
noncomputable def geometryType (t : PermutationTriple n) : GeometryType :=
  let s : ℚ := (orderOf t.σ0 : ℚ)⁻¹ + (orderOf t.σ1 : ℚ)⁻¹ + (orderOf t.σinf : ℚ)⁻¹
  if 1 < s then .spherical else if s = 1 then .euclidean else .hyperbolic

/-! ### Layer 0.8: the example suite -/

/-- **Layer 0.8.** The monodromy triple of `z ↦ zⁿ`. -/
def cyclicTriple (n : ℕ) : PermutationTriple n := ofTwo (finRotate n) 1

/-- **Layer 0.8.** The monodromy triple of `z ↦ 4z(1−z)`: unramified over `0`. -/
def chebyshevTriple : PermutationTriple 2 := ofTwo 1 (Equiv.swap 0 1)

/-- **Layer 0.8.** The Euclidean genus-one triple: degree `4`, cycle data
`[4], [4], [2,2]`, regular with deck group `ℤ/4`, imprimitive. -/
def torusTriple : PermutationTriple 4 := ofTwo (finRotate 4) (finRotate 4)

/-- **Layer 0.8.** A triple with monodromy all of `S₃` and trivial automorphisms. -/
def s3Triple : PermutationTriple 3 := ofTwo (finRotate 3) (Equiv.swap 0 1)

example : torusTriple.σinf = (finRotate 4 ^ 2)⁻¹ := by simp [torusTriple, sq]

theorem cyclicTriple_isConnected (n : ℕ) (hn : n ≠ 0) : (cyclicTriple n).IsConnected := by
  sorry

/-! ### Layer 2.6: the branch-point action

All six reindexings of `(0, 1, ∞)`, written out rather than schematized, with the
conjugators that make them preserve the pinned relation, and a `decide`-checked witness that
the naive color swap does not.

The operation named after a permutation `ρ` of `{0, 1, ∞}` is the one whose `σ_i` is the old
`σ_{ρ i}` up to conjugacy; reindexing is contravariant, so `Op ρ ∘ Op ρ' = Op (ρ' * ρ)` and
the six operations form a **right** `S₃`-action (README, Layer 2.6). -/

/-- **Layer 2.6.** Swap the roles of `0` and `1`. An involution on the nose. -/
def swap01 (t : PermutationTriple n) : PermutationTriple n where
  σ0 := t.σ1
  σ1 := t.σ0
  σinf := t.σ1⁻¹ * t.σinf * t.σ1
  product_eq_one := by rw [t.σinf_eq]; group

/-- **Layer 2.6.** Swap the roles of `1` and `∞`. ⚠ Its square is simultaneous conjugation
by `σ0`, not the identity, which is why the `S₃`-action lives on isomorphism classes. -/
def swap1Inf (t : PermutationTriple n) : PermutationTriple n where
  σ0 := t.σ0
  σ1 := t.σ1⁻¹ * t.σinf * t.σ1
  σinf := t.σ1
  product_eq_one := by rw [t.σinf_eq]; group

/-- **Layer 2.6.** Swap the roles of `0` and `∞`. That it is the composite
`swap01 ∘ swap1Inf ∘ swap01` is `swap0Inf_eq`; the simplification of the third component
consumes the pinned relation and is proved, not asserted. -/
def swap0Inf (t : PermutationTriple n) : PermutationTriple n where
  σ0 := t.σinf
  σ1 := t.σ1
  σinf := t.σ1 * t.σ0 * t.σ1⁻¹
  product_eq_one := by rw [t.σinf_eq]; group

/-- **Layer 2.6.** The rotation `0 ↦ 1 ↦ ∞ ↦ 0` of the branch points: it replaces `σ0` by
`σ1`, `σ1` by `σinf` and `σinf` by `σ0`, with **no conjugator at all**. That it is the
composite `swap1Inf ∘ swap01` is `rot_eq`. -/
def rot (t : PermutationTriple n) : PermutationTriple n where
  σ0 := t.σ1
  σ1 := t.σinf
  σinf := t.σ0
  product_eq_one := by rw [t.σinf_eq]; group

/-- **Layer 2.6.** The rotation `0 ↦ ∞ ↦ 1 ↦ 0`, the composite `swap01 ∘ swap1Inf`
(`rotInv_eq`). ⚠ It is **not** the inverse of `rot` on triples: `rotInv_rot` says the two
composites differ by simultaneous conjugation by `σ1`, and they agree only on `IsoClass n`. -/
def rotInv (t : PermutationTriple n) : PermutationTriple n where
  σ0 := t.σ1⁻¹ * t.σinf * t.σ1
  σ1 := t.σ0
  σinf := t.σ0 * t.σ1 * t.σ0⁻¹
  product_eq_one := by rw [t.σinf_eq]; group

/-- **Layer 2.6.** `rot` is the composite `swap1Inf ∘ swap01`. -/
theorem rot_eq (t : PermutationTriple n) : rot t = swap1Inf (swap01 t) := by
  refine ext_of_two rfl ?_
  show t.σinf = t.σ0⁻¹ * (t.σ1⁻¹ * t.σinf * t.σ1) * t.σ0
  rw [t.σinf_eq]; group

/-- **Layer 2.6.** `rotInv` is the composite `swap01 ∘ swap1Inf`. -/
theorem rotInv_eq (t : PermutationTriple n) : rotInv t = swap01 (swap1Inf t) :=
  ext_of_two rfl rfl

/-- **Layer 2.6.** `swap0Inf` is the composite `swap01 ∘ swap1Inf ∘ swap01`. -/
theorem swap0Inf_eq (t : PermutationTriple n) :
    swap0Inf t = swap01 (swap1Inf (swap01 t)) := by
  refine ext_of_two ?_ rfl
  show t.σinf = t.σ0⁻¹ * (t.σ1⁻¹ * t.σinf * t.σ1) * t.σ0
  rw [t.σinf_eq]; group

/-- **Layer 2.6, the Coxeter relation `(st)³ = 1`, on the nose.** Unlike `swap1Inf`, the
rotation has its expected order without any relabeling; this is the statement that makes the
`S₃`-action visible. -/
theorem rot_rot_rot (t : PermutationTriple n) : rot (rot (rot t)) = t :=
  ext_of_two rfl rfl

/-- **Layer 2.6.** `rotInv ∘ rot` is simultaneous conjugation by **`σ1`**, not the identity —
the counterpart for the rotations of `swap1Inf_sq`, and the second reason the `S₃`-action is
stated on `IsoClass n`. -/
theorem rotInv_rot (t : PermutationTriple n) : rotInv (rot t) = t.σ1 • t := by
  refine ext_of_two ?_ ?_
  · show t.σinf⁻¹ * t.σ0 * t.σinf = t.σ1 * t.σ0 * t.σ1⁻¹
    rw [t.σinf_eq]; group
  · show t.σ1 = t.σ1 * t.σ1 * t.σ1⁻¹
    group

/-- **Layer 2.6, the order witness.** `rot` is `swap1Inf ∘ swap01`, not `swap01 ∘ swap1Inf`:
the two composites are genuinely different operations on triples, so the order in `rot_eq` is
not a presentational choice. -/
example : rot s3Triple ≠ swap01 (swap1Inf s3Triple) := by decide

/-- **Layer 2.6, the witness for `rotInv_rot`.** The relabeling in `rotInv_rot` is not
removable: on `s3Triple` the composite really does move the triple. -/
example : rotInv (rot s3Triple) ≠ s3Triple := by decide

/-- **Layer 2.6, the counterexample.** The naive color swap `(a,b,c) ↦ (b,a,a⁻¹ca)` does
**not** preserve the relation: on `s3Triple` the would-be product is not `1`. -/
example :
    ¬ ((s3Triple.σ0⁻¹ * s3Triple.σinf * s3Triple.σ0) * s3Triple.σ0 * s3Triple.σ1 = 1) := by
  decide

/-- The corrected `swap01` does preserve it, on the same triple. -/
example : (swap01 s3Triple).σinf * (swap01 s3Triple).σ1 * (swap01 s3Triple).σ0 = 1 :=
  (swap01 s3Triple).product_eq_one

/-- **Layer 2.6.** `swap01` is an involution on triples, on the nose. -/
theorem swap01_involutive (t : PermutationTriple n) : swap01 (swap01 t) = t := by
  sorry

/-- **Layer 2.6.** `swap1Inf` squared is simultaneous conjugation by **`σ0`**, not the
identity — the statement that forces the `S₃`-action onto `IsoClass n`.

The computation is forced by the pinned relation. Writing `t = (a, b, c)` with `c * b * a = 1`,
one application gives `(a, b⁻¹ * c * b, b)` and a second gives
`(a, b⁻¹ * c⁻¹ * b * c * b, b⁻¹ * c * b)`; since `a = (c * b)⁻¹ = b⁻¹ * c⁻¹`, those last two
entries are exactly `a * b * a⁻¹` and `a * c * a⁻¹`. -/
theorem swap1Inf_sq (t : PermutationTriple n) : swap1Inf (swap1Inf t) = t.σ0 • t := by
  sorry

/-- **Layer 2.6, the witness that fixes the conjugator.** `σ0` is not interchangeable with
the two conjugators one might guess instead: on `s3Triple` both `σ1⁻¹ • t` and `σ1 • t`
differ from `swap1Inf²`, so the theorem above is not merely one presentation among several.
(Exhaustively, `σ0` is correct on all 576 triples in `S₄` while `σ1⁻¹` fails on 456.) -/
example : swap1Inf (swap1Inf s3Triple) = s3Triple.σ0 • s3Triple := by decide

example : swap1Inf (swap1Inf s3Triple) ≠ s3Triple.σ1⁻¹ • s3Triple := by decide

example : swap1Inf (swap1Inf s3Triple) ≠ s3Triple.σ1 • s3Triple := by decide

-- **Layer 12.12, the counterexample.** Componentwise powers of a triple are **not** a
-- triple: raising the three entries of `s3Triple` to the fifth power destroys the product
-- relation. This is why the finite branch-cycle statement is class-by-class and never a
-- statement about the tuple of powers.
set_option maxRecDepth 8000 in
example : s3Triple.σinf ^ 5 * s3Triple.σ1 ^ 5 * s3Triple.σ0 ^ 5 ≠ 1 := by decide

/-
/-- **Layer 12.12, the class-by-class ingredients.** What survives the counterexample above
is a statement about **conjugacy classes**, one slot at a time, and passport invariance
follows from these two finite facts alone. Powering by a unit modulo the order preserves the
full cycle type... -/
theorem fullCycleType_pow_of_coprime {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) {u : ℕ} (hu : Nat.Coprime u (orderOf σ)) :
    PolynomialGaloisGroups.fullCycleType (σ ^ u) =
      PolynomialGaloisGroups.fullCycleType σ := by
  sorry
-/

/-- ...and it does not change the generated subgroup, which is why the monodromy group is a
Galois invariant. -/
theorem closure_pow_eq {α : Type u} [Fintype α] [DecidableEq α]
    (t : PermutationTriple n) {u : ℕ}
    (hu : Nat.Coprime u (Monoid.exponent (monodromyGroup t))) :
    Subgroup.closure {t.σ0 ^ u, t.σ1 ^ u} = monodromyGroup t := by
  sorry

/-- **Layer 2.6.** The Coxeter braid relation, on isomorphism classes. -/
theorem braid_on_isoClass (t : PermutationTriple n) :
    Equivalent (swap01 (swap1Inf (swap01 (swap1Inf (swap01 (swap1Inf t)))))) t := by
  sorry

/-- **Layer 2.6.** The branch-point operations preserve connectedness: each new pair of
generators generates the same subgroup (`⟨b, a⟩ = ⟨a, b⟩` for `swap01`, and
`⟨a, b⁻¹ · c · b⟩ = ⟨a, b⁻¹ · a⁻¹⟩ = ⟨a, b⟩` for `swap1Inf`), so `monodromyGroup` is
unchanged, pretransitivity transfers, and `n` is untouched. -/
theorem isConnected_swap01 {t : PermutationTriple n} (ht : t.IsConnected) :
    (swap01 t).IsConnected := by
  sorry

theorem isConnected_swap1Inf {t : PermutationTriple n} (ht : t.IsConnected) :
    (swap1Inf t).IsConnected := by
  sorry

/-- **Layer 0.4, 0.2.** Relabeling conjugates the automorphism group — the statement that
makes the automorphism group a well-defined invariant of an `IsoClass n`, as a subgroup up
to conjugacy rather than on the nose. -/
theorem automorphismGroup_smul (τ : Equiv.Perm (Fin n)) (t : PermutationTriple n) :
    automorphismGroup (τ • t) = Subgroup.map (MulAut.conj τ).toMonoidHom
      (automorphismGroup t) := by
  sorry

end PermutationTriple

/-! ## Layer 1: passports

⚠ Passports are attached to **connected** triples only (README, Layer 1.1). The carrier
below is what every predicate and every function of this layer is stated on; none is stated
on a bare triple and then hedged with a hypothesis. -/

/-- **Layer 1.1.** The connected-triple carrier. -/
def ConnectedTriple (n : ℕ) : Type :=
  {t : PermutationTriple n // t.IsConnected}

namespace ConnectedTriple

variable {n : ℕ}

instance : SMul (Equiv.Perm (Fin n)) (ConnectedTriple n) where
  smul τ t := ⟨τ • t.1, PermutationTriple.isConnected_smul τ t.2⟩

instance : MulAction (Equiv.Perm (Fin n)) (ConnectedTriple n) where
  one_smul _ := Subtype.ext (one_smul _ _)
  mul_smul _ _ _ := Subtype.ext (mul_smul _ _ _)

/-- **Layer 2.6.** The two generating branch-point operations restricted to connected
triples, where Layer 6.3 needs them. The remaining four are their composites, by
`PermutationTriple.rot_eq`, `rotInv_eq` and `swap0Inf_eq`. -/
def swap01 (t : ConnectedTriple n) : ConnectedTriple n :=
  ⟨PermutationTriple.swap01 t.1, PermutationTriple.isConnected_swap01 t.2⟩

/-- **Layer 2.6.** Swap the roles of `1` and `∞`, on connected triples. -/
def swap1Inf (t : ConnectedTriple n) : ConnectedTriple n :=
  ⟨PermutationTriple.swap1Inf t.1, PermutationTriple.isConnected_swap1Inf t.2⟩

end ConnectedTriple

/-
open PermutationTriple in
/-- **Layer 1.1.** A passport specification: a reference transitive subgroup (up to the
conjugacy stated in `HasPassport`) and the three full cycle partitions. -/
structure PassportSpec (n : ℕ) where
  G : Subgroup (Equiv.Perm (Fin n))
  lam0 : Multiset ℕ
  lam1 : Multiset ℕ
  laminf : Multiset ℕ

namespace PassportSpec

variable {n : ℕ}

/-- **Layer 1.1.** Well-formedness: nonzero degree, transitive reference, three partitions
of `n` into positive parts. ⚠ `n ≠ 0` is part of admissibility for the same reason it is
part of connectedness: `IsPretransitive` is vacuous on `Fin 0` and the empty multiset is a
partition of `0`, so without it the degenerate specification is admissible and inhabited by
nothing. -/
def IsAdmissible (P : PassportSpec n) : Prop :=
  n ≠ 0 ∧
    MulAction.IsPretransitive P.G (Fin n) ∧
    (P.lam0.sum = n ∧ ∀ i ∈ P.lam0, 0 < i) ∧
    (P.lam1.sum = n ∧ ∀ i ∈ P.lam1, 0 < i) ∧
    (P.laminf.sum = n ∧ ∀ i ∈ P.laminf, 0 < i)

/-- **Layer 1.6.** The reference group has the supplier's transitive-group label. This is a
thin use of the canonical predicate, not a local label carrier or a duplicate conjugacy
condition. -/
def HasTransitiveGroupLabel (P : PassportSpec n)
    (j : PolynomialGaloisGroups.TransitiveGroupIndex n) : Prop :=
  PolynomialGaloisGroups.TransitiveGroupLabel j P.G

/-- **Layer 1.1.** Passport membership, on a **connected** triple: conjugate monodromy (the
exact PolynomialGaloisGroups spelling) and equal cycle data. -/
def HasPassport (t : ConnectedTriple n) (P : PassportSpec n) : Prop :=
  (∃ τ : Equiv.Perm (Fin n),
      (PermutationTriple.monodromyGroup t.1).map (MulAut.conj τ).toMonoidHom = P.G) ∧
    PolynomialGaloisGroups.fullCycleType t.1.σ0 = P.lam0 ∧
    PolynomialGaloisGroups.fullCycleType t.1.σ1 = P.lam1 ∧
    PolynomialGaloisGroups.fullCycleType t.1.σinf = P.laminf

end PassportSpec

namespace ConnectedTriple

variable {n : ℕ}

/-- **Layer 1.5.** The passport of a connected triple. ⚠ The domain is `ConnectedTriple n`:
on a disconnected triple this would produce an inadmissible specification. -/
noncomputable def passportOf (t : ConnectedTriple n) : PassportSpec n :=
  ⟨PermutationTriple.monodromyGroup t.1,
    PolynomialGaloisGroups.fullCycleType t.1.σ0,
    PolynomialGaloisGroups.fullCycleType t.1.σ1,
    PolynomialGaloisGroups.fullCycleType t.1.σinf⟩

/-- **Layer 1.5.** `passportOf` lands in admissible specifications. -/
theorem isAdmissible_passportOf (t : ConnectedTriple n) : (passportOf t).IsAdmissible := by
  sorry

/-- **Layer 1.5.** A connected triple has its own passport. -/
theorem hasPassport_passportOf (t : ConnectedTriple n) :
    PassportSpec.HasPassport t (passportOf t) := by
  sorry

end ConnectedTriple
-/

namespace PermutationTriple

variable {n : ℕ}

/-- **Layer 1.4.** Primitivity of the monodromy action, Mathlib's notion. -/
def IsPrimitive (t : PermutationTriple n) : Prop :=
  MulAction.IsPreprimitive (monodromyGroup t) (Fin n)

/-! **Layer 3.1 is deferred with the full-cycle supplier contract.**

The executable passport enumeration is restored after #243 lands and its exact cycle and
transitive-group carriers can be imported. -/

/-

/-! **Layer 3.1, continued: the executable enumeration.**

The computable cycle decomposition earlier is only half of Layer 3.1. Everything the small
tables of Layer 3.5 and the record certificates of Layer 14 are checked against must be a
`Finset` or a `Bool` carrying a soundness theorem that ties it to the abstract definition;
the targets below are those, one per abstract notion. -/

/-- **Layer 3.1.** The Euler characteristic, computably — the cycle counts taken from the
executable decomposition rather than from `cycleFactorsFinset`. -/
def computedEulerChar (t : PermutationTriple n) : ℤ :=
  (Multiset.card (computedCycleType t.σ0) + Multiset.card (computedCycleType t.σ1)
    + Multiset.card (computedCycleType t.σinf) : ℤ) - n

theorem computedEulerChar_eq (t : PermutationTriple n) :
    computedEulerChar t = eulerChar t := by
  sorry

/-- **Layer 3.1.** The genus, computably. -/
def computedGenus (t : PermutationTriple n) : ℕ := ((2 - computedEulerChar t) / 2).toNat

theorem computedGenus_eq (t : PermutationTriple n) : computedGenus t = genus t := by
  sorry

/-- **Layer 3.1.** The order triple, computably: the order of a permutation is the `lcm` of
its cycle lengths, which the executable decomposition already supplies. -/
def computedOrderTriple (t : PermutationTriple n) : ℕ × ℕ × ℕ :=
  ((computedCycleType t.σ0).lcm, (computedCycleType t.σ1).lcm,
    (computedCycleType t.σinf).lcm)

theorem computedOrderTriple_eq (t : PermutationTriple n) :
    computedOrderTriple t = orderTriple t := by
  sorry

/-- **Layer 3.1.** The geometry type, computably, by exact comparison in `ℚ`. -/
def computedGeometryType (t : PermutationTriple n) : GeometryType :=
  let o := computedOrderTriple t
  let s : ℚ := (o.1 : ℚ)⁻¹ + (o.2.1 : ℚ)⁻¹ + (o.2.2 : ℚ)⁻¹
  if 1 < s then .spherical else if s = 1 then .euclidean else .hyperbolic

theorem computedGeometryType_eq (t : PermutationTriple n) :
    computedGeometryType t = geometryType t := by
  sorry

/-- **Layer 3.1.** The monodromy group as a `Finset`: close `{1}` under right multiplication
by the two generators. `n !` rounds suffice, since each round that changes anything adds at
least one element and the group embeds in `Equiv.Perm (Fin n)`. -/
def monodromyElems (t : PermutationTriple n) : Finset (Equiv.Perm (Fin n)) :=
  (fun S => S ∪ S.image (· * t.σ0) ∪ S.image (· * t.σ1))^[Nat.factorial n] {1}

theorem mem_monodromyElems (t : PermutationTriple n) (g : Equiv.Perm (Fin n)) :
    g ∈ monodromyElems t ↔ g ∈ monodromyGroup t := by
  sorry

/-- **Layer 3.1.** Blockhood, computably, as Mathlib's `IsBlock` in the equivalent
one-argument form for a group action: every group element either preserves `B` or moves it
off itself. ⚠ **The quantifier runs over the whole group, not over the two generators.**
Preserving-or-disjoint is not closed under multiplication, so a generator-only test is not
this predicate. -/
def isBlockB (t : PermutationTriple n) (B : Finset (Fin n)) : Bool :=
  decide (∀ g ∈ monodromyElems t, B.image g = B ∨ Disjoint (B.image g) B)

theorem isBlockB_eq_true_iff (t : PermutationTriple n) (B : Finset (Fin n)) :
    isBlockB t B = true ↔ MulAction.IsBlock (monodromyGroup t) (B : Set (Fin n)) := by
  sorry

/-- **Layer 3.1.** Primitivity, computably: pretransitive, and every block is trivial. This
is Mathlib's `IsPreprimitive` transcribed, with no degree guard — `IsPreprimitive` holds
vacuously at `n ≤ 1`, and adding a `1 < n` guard would make the Boolean disagree with the
predicate it is supposed to decide. -/
def isPrimitiveB (t : PermutationTriple n) : Bool :=
  decide (∀ i j : Fin n, ∃ g ∈ monodromyElems t, g i = j) &&
    decide (∀ B : Finset (Fin n), isBlockB t B = true → B.card ≤ 1 ∨ B = Finset.univ)

theorem isPrimitiveB_eq_true_iff (t : PermutationTriple n) :
    isPrimitiveB t = true ↔ IsPrimitive t := by
  sorry

/-! **Layer 3.1, the acceptance checks for primitivity.** ⚠ These are not decoration. The
obvious wrong implementation — closing `{i, j}` under the two generators and asking whether
the closure is everything — is *always* `true` on a connected triple, because that closure is
the orbit of a nonempty set and the action is transitive. `torusTriple` is the witness that
separates the two: it is connected and imprimitive, with blocks `{0, 2}` and `{1, 3}`, while
every pair generates all of `Fin 4` under the orbit closure. -/

section AcceptanceChecks

set_option maxRecDepth 100000

/-- `torusTriple` is imprimitive: `{0, 2}` is a nontrivial block. -/
example : isBlockB torusTriple {0, 2} = true := by decide

example : isPrimitiveB torusTriple = false := by decide

/-- `s3Triple` is primitive: full symmetric monodromy in degree `3`. -/
example : isPrimitiveB s3Triple = true := by decide

/-- The degree-one edge case is primitive, matching `IsPreprimitive`. -/
example : isPrimitiveB (cyclicTriple 1) = true := by decide

end AcceptanceChecks

/-- **Layer 3.1.** The `Finset` of connected triples of degree `n`. -/
def connectedTriples (n : ℕ) : Finset (PermutationTriple n) :=
  Finset.univ.filter fun t => isConnectedB t = true

theorem mem_connectedTriples {n : ℕ} (t : PermutationTriple n) :
    t ∈ connectedTriples n ↔ t.IsConnected := by
  sorry

/-- **Layer 3.1.** The relabeling orbit of a triple, as a `Finset`. -/
def relabelOrbit (t : PermutationTriple n) : Finset (PermutationTriple n) :=
  Finset.univ.image fun τ : Equiv.Perm (Fin n) => τ • t

theorem mem_relabelOrbit {n : ℕ} (t t' : PermutationTriple n) :
    t' ∈ relabelOrbit t ↔ Equivalent t t' := by
  sorry

/-- **Layer 3.1.** The isomorphism classes of connected triples, as the `Finset` of
relabeling orbits. ⚠ Orbits, not chosen representatives: `PermutationTriple n` carries no
order, so there is no least element to pick, and a classification stated through an
arbitrary choice function proves nothing about the classes. -/
def isoClasses (n : ℕ) : Finset (Finset (PermutationTriple n)) :=
  (connectedTriples n).image relabelOrbit

/-- **Layer 3.1, soundness.** Each connected triple lies in exactly one enumerated class,
and the classes are exactly the orbits — stated so that a computed class list *is* the
classification and not a lower bound for it. -/
theorem isoClasses_spec {n : ℕ} (t : PermutationTriple n) (ht : t.IsConnected) :
    ∃! c ∈ isoClasses n, t ∈ c := by
  sorry

theorem card_isoClasses_eq {n : ℕ} :
    (isoClasses n).card = Nat.card {c : IsoClass n // ∃ t : ConnectedTriple n,
      Quotient.mk _ t.1 = c} := by
  sorry

/-- **Layer 3.1.** The passport datum in the form the enumeration can actually decide: three
partitions and the monodromy group **as a `Finset` of permutations**, which is how the LMFDB
presents it and what a `#eval` can compare. -/
structure PassportData (n : ℕ) where
  lam0 : Multiset ℕ
  lam1 : Multiset ℕ
  laminf : Multiset ℕ
  Gelems : Finset (Equiv.Perm (Fin n))
  deriving DecidableEq

/-- **Layer 3.1.** The passport fiber, computably: the classes whose cycle data and monodromy
group match. The condition is relabeling-invariant, so testing one member of a class tests
all of them — which is itself a target below.

⚠ The group is compared **up to conjugacy in `S_n`**, since that is all a simultaneous
conjugacy class determines. Comparing the literal subgroup instead over-splits: at degree `5`
it is exactly the difference between `74` and a larger, wrong, passport count. -/
def passportFiber (n : ℕ) (P : PassportData n) :
    Finset (Finset (PermutationTriple n)) :=
  (isoClasses n).filter fun c => decide (∃ t ∈ c,
    computedCycleType t.σ0 = P.lam0 ∧ computedCycleType t.σ1 = P.lam1 ∧
      computedCycleType t.σinf = P.laminf ∧
      ∃ τ : Equiv.Perm (Fin n),
        (monodromyElems t).image (fun g => τ * g * τ⁻¹) = P.Gelems)

/-- **Layer 3.1.** The bridge from the decidable datum to `PassportSpec`: the `Finset` of
group elements presents the subgroup, so the computable fiber is the abstract one. -/
theorem passportFiber_eq_of_spec {n : ℕ} (P : PassportData n) (Q : PassportSpec n)
    (hG : ∀ g, g ∈ P.Gelems ↔ g ∈ Q.G)
    (h0 : P.lam0 = Q.lam0) (h1 : P.lam1 = Q.lam1) (hinf : P.laminf = Q.laminf)
    (c : Finset (PermutationTriple n)) (hc : c ∈ isoClasses n) :
    c ∈ passportFiber n P ↔
      ∃ t : PermutationTriple n, ∃ ht : t.IsConnected,
        t ∈ c ∧ PassportSpec.HasPassport ⟨t, ht⟩ Q := by
  sorry

open scoped Classical in
/-- **Layer 3.1.** Having a passport is constant on a class — what makes `passportFiber`
well defined despite testing an existential over the class. -/
theorem hasPassport_relabel_invariant {n : ℕ} (P : PassportSpec n)
    (t t' : PermutationTriple n) (h : Equivalent t t')
    (ht : t.IsConnected) (ht' : t'.IsConnected) :
    PassportSpec.HasPassport ⟨t, ht⟩ P ↔ PassportSpec.HasPassport ⟨t', ht'⟩ P := by
  sorry

/-- **Layer 3.1.** `passportSize` as a cardinality of computed data — what Layer 3.4's
normalizer formula is checked against and what Layer 14's `pass_size` certificate consumes.
Computable, so it is `#eval`-able at the degrees Layer 3.5 tabulates. -/
def computedPassportSize (n : ℕ) (P : PassportData n) : ℕ :=
  (passportFiber n P).card

open scoped Classical in
theorem computedPassportSize_eq_card {n : ℕ} (P : PassportData n) (Q : PassportSpec n)
    (hG : ∀ g, g ∈ P.Gelems ↔ g ∈ Q.G)
    (h0 : P.lam0 = Q.lam0) (h1 : P.lam1 = Q.lam1) (hinf : P.laminf = Q.laminf) :
    computedPassportSize n P =
      Nat.card {c : IsoClass n // ∃ t : ConnectedTriple n,
        Quotient.mk _ t.1 = c ∧ PassportSpec.HasPassport t Q} := by
  sorry

/-- **Layer 3.1.** The passport of a triple, computably — the datum `passportFiber` is
queried with. -/
def computedPassportOf (t : PermutationTriple n) : PassportData n :=
  ⟨computedCycleType t.σ0, computedCycleType t.σ1, computedCycleType t.σinf,
    monodromyElems t⟩

/-! **Layer 3.1, the executable acceptance checks.** These run the enumeration end to end —
connected triples, relabeling orbits, passport datum, fiber, cardinality — and are proved by
kernel reduction, so they are evidence and not annotation. The counts agree with the
independent enumeration recorded in the private provenance ledger.

⚠ `native_decide` is deliberately not used anywhere in this file. It would discharge the
degree-`4` case too, but at the cost of adding `Lean.ofReduceBool` — a trusted-compiler axiom
— to a repository that currently has none, and the degree-`4` run exercises no code path that
degree `3` does not. Kernel `decide` does not complete at degree `4` within ten minutes;
`#eval` gives `26` classes and passport size `1` there, matching the private provenance ledger, and that is
recorded as a computation rather than promoted to a theorem. -/

section AcceptanceCounts

set_option maxRecDepth 1000000
set_option maxHeartbeats 2000000

example : (isoClasses 1).card = 1 := by decide
example : (isoClasses 2).card = 3 := by decide
example : (isoClasses 3).card = 7 := by decide

/-- The end-to-end run: from a triple to the cardinality of its passport fiber. Every ordered
passport in degree `≤ 4` has size `1` (Layer 3.5), and this is that statement at degree `3`,
computed rather than assumed. -/
example : computedPassportSize 3 (computedPassportOf s3Triple) = 1 := by decide

end AcceptanceCounts
-/

end PermutationTriple

/-! ## Layer 2: dessins as bipartite ribbon graphs -/

/-- **Layer 2.1.** A finite bipartite ribbon graph: abstract edges, two vertex types,
incidences, and rotations that are typed cyclic orders — `Equiv.Perm.IsCycleOn` each
incidence fiber. Surjectivity of the incidences excludes isolated vertices, which is no
loss for dessins (vertices are cycles). ⚠ Cyclic orders are never lists with coverage side
conditions. -/
structure BipartiteRibbonGraph : Type (u + 1) where
  E : Type u
  B : Type u
  W : Type u
  [fintypeE : Fintype E]
  [fintypeB : Fintype B]
  [fintypeW : Fintype W]
  [decidableEqE : DecidableEq E]
  [decidableEqB : DecidableEq B]
  [decidableEqW : DecidableEq W]
  blackEnd : E → B
  whiteEnd : E → W
  rotB : Equiv.Perm E
  rotW : Equiv.Perm E
  blackEnd_surjective : Function.Surjective blackEnd
  whiteEnd_surjective : Function.Surjective whiteEnd
  blackEnd_rotB : ∀ e, blackEnd (rotB e) = blackEnd e
  whiteEnd_rotW : ∀ e, whiteEnd (rotW e) = whiteEnd e
  isCycleOn_rotB : ∀ b, rotB.IsCycleOn (blackEnd ⁻¹' {b})
  isCycleOn_rotW : ∀ w, rotW.IsCycleOn (whiteEnd ⁻¹' {w})

namespace BipartiteRibbonGraph

attribute [instance] fintypeE fintypeB fintypeW decidableEqE decidableEqB decidableEqW

variable (Γ : BipartiteRibbonGraph.{u})

/-- **Layer 2.1.** The face permutation, in the pinned display order:
`facePerm * rotW * rotB = 1`. -/
def facePerm : Equiv.Perm Γ.E := (Γ.rotW * Γ.rotB)⁻¹

theorem facePerm_mul : Γ.facePerm * Γ.rotW * Γ.rotB = 1 := by
  simp [facePerm, mul_assoc]

/-- **Layer 2.1.** Connectedness: jointly transitive rotations on a nonempty edge set. -/
def IsConnected : Prop :=
  Nonempty Γ.E ∧ MulAction.IsPretransitive (Subgroup.closure {Γ.rotB, Γ.rotW}) Γ.E

/-
/-- **Layer 2.1.** The Euler characteristic: vertices minus edges plus faces. -/
noncomputable def eulerChar : ℤ :=
  Nat.card Γ.B + Nat.card Γ.W + PermutationTriple.cycleCount Γ.facePerm - Nat.card Γ.E
-/

/-- **Layer 2.3.** The triple of a dessin, along a numbering of the edges. Changing the
numbering relabels the triple (README, Layer 2.3). -/
def toTriple {n : ℕ} (ν : Γ.E ≃ Fin n) : PermutationTriple n :=
  PermutationTriple.ofTwo (ν.permCongr Γ.rotB) (ν.permCongr Γ.rotW)

end BipartiteRibbonGraph

/-- **Layer 2.2.** The dessin of a connected triple: edges `Fin n`, vertices the cycles
(orbits) of `σ0` and `σ1`, rotations the permutations themselves. -/
noncomputable def PermutationTriple.toDessin {n : ℕ} (t : PermutationTriple n)
    (ht : t.IsConnected) : BipartiteRibbonGraph := by
  sorry

/-! ## Layer 3: enumeration and counting

The executable-enumeration milestones (Layer 3.1) are instance-level and appear as the
`Fintype`/`DecidableEq` obligations on `PermutationTriple`; the Frobenius product-one
formula (Layer 3.2) and its corrections (3.3, 3.4) are stated in `README.md` only, because
their statements consume the CharacterTheory carriers (`classSum`, `structureConstant`,
`characterTable`), which live in that roadmap. -/

/-- **Layer 3.2 (the inverse-class involution).** Owned here; on no other roadmap. -/
noncomputable def ConjClasses.inv {G : Type u} [Group G] (C : ConjClasses G) :
    ConjClasses G := by
  sorry

/-! ## Layer 4: triangle groups -/

/-- **Layer 4.1.** The relators of the `(a,b,c)` triangle group, in the pinned display
order: `z * y * x` is the product relator. -/
def triangleRelators (a b c : ℕ) : Set (FreeGroup (Fin 3)) :=
  {FreeGroup.of 0 ^ a, FreeGroup.of 1 ^ b, FreeGroup.of 2 ^ c,
    FreeGroup.of 2 * FreeGroup.of 1 * FreeGroup.of 0}

/-- **Layer 4.1.** The oriented triangle group `Δ(a,b,c)`. -/
abbrev TriangleGroup (a b c : ℕ) : Type := PresentedGroup (triangleRelators a b c)

namespace TriangleGroup

variable {a b c : ℕ}

/-- The generator `x`, mapping to `σ0`. -/
def x (a b c : ℕ) : TriangleGroup a b c := PresentedGroup.of 0

/-- The generator `y`, mapping to `σ1`. -/
def y (a b c : ℕ) : TriangleGroup a b c := PresentedGroup.of 1

/-- The generator `z`, mapping to `σinf`. -/
def z (a b c : ℕ) : TriangleGroup a b c := PresentedGroup.of 2

theorem z_mul_y_mul_x (a b c : ℕ) : z a b c * y a b c * x a b c = 1 := by
  sorry

theorem x_pow (a b c : ℕ) : x a b c ^ a = 1 := by
  sorry

/-- **Layer 4.2.** A triple with component orders dividing `(a, b, c)` is a permutation
representation of the triangle group, with range the monodromy group. -/
noncomputable def toPerm {n : ℕ} (t : TauCetiRoadmap.BelyiMaps.PermutationTriple n)
    (ha : t.σ0 ^ a = 1) (hb : t.σ1 ^ b = 1) (hc : t.σinf ^ c = 1) :
    TriangleGroup a b c →* Equiv.Perm (Fin n) := by
  sorry

end TriangleGroup

/-! ## Layer 5: the thrice-punctured sphere -/

/-- **Layer 5.1.** The affine model of `ℙ¹(ℂ) ∖ {0, 1, ∞}`. -/
def ThricePuncturedSphere : Type := {z : ℂ // z ≠ 0 ∧ z ≠ 1}

namespace ThricePuncturedSphere

instance : TopologicalSpace ThricePuncturedSphere :=
  inferInstanceAs (TopologicalSpace {z : ℂ // z ≠ 0 ∧ z ≠ 1})

/-- **Layer 5.1.** The pinned basepoint `1/2` — on the real segment, so that the embedded
graph of Layer 7.6 passes through it. -/
noncomputable def basePt : ThricePuncturedSphere :=
  ⟨1 / 2, by norm_num, by norm_num⟩

/-- **Layer 5.2.** The peripheral loop around `0`: the counterclockwise circle
`t ↦ (1/2)·exp(2πit)` of radius `1/2` about `0`, based at `1/2`. -/
noncomputable def γ0 : Path basePt basePt where
  toFun t :=
    ⟨(1 / 2 : ℂ) * Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)), by sorry⟩
  continuous_toFun := by sorry
  source' := by sorry
  target' := by sorry

/-- **Layer 5.2.** The peripheral loop around `1`: the counterclockwise circle
`t ↦ 1 − (1/2)·exp(2πit)` of radius `1/2` about `1`, based at `1/2`. -/
noncomputable def γ1 : Path basePt basePt where
  toFun t :=
    ⟨1 - (1 / 2 : ℂ) * Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)), by sorry⟩
  continuous_toFun := by sorry
  source' := by sorry
  target' := by sorry

/-- **Layer 5.2.** The class of `γ0` in the fundamental group. -/
noncomputable def periph0 : FundamentalGroup ThricePuncturedSphere basePt :=
  FundamentalGroup.fromPath ⟦γ0⟧

/-- **Layer 5.2.** The class of `γ1`. -/
noncomputable def periph1 : FundamentalGroup ThricePuncturedSphere basePt :=
  FundamentalGroup.fromPath ⟦γ1⟧

/-- **Layer 5.2.** The peripheral element at `∞`, *defined* so that the pinned relation
holds; the orientation statement identifying it with a clockwise large circle is the
Layer 5.2 milestone. -/
noncomputable def periphInf : FundamentalGroup ThricePuncturedSphere basePt :=
  (periph1 * periph0)⁻¹

/-- The pinned relation, in the same display order as the triple relation. -/
theorem periphInf_mul_periph1_mul_periph0 : periphInf * periph1 * periph0 = 1 := by
  rw [mul_assoc]
  exact inv_mul_cancel (periph1 * periph0)

/-! **Layer 5.5 is a UniversalCovers supplier crossing, not a declaration of this roadmap.**
Van Kampen for two open sets with simply connected intersection is general algebraic
topology, reusable far beyond three-point covers, and the pin has it in no form. Its exact
owner is the UniversalCovers roadmap, which must publish `vanKampenLift`,
`vanKampenLift_bijective`, `vanKampenEquiv` and `vanKampenEquiv_toMonoidHom` with the
signatures pinned in README §5.5. This roadmap exports no local copy, alias or stand-in; it
**instantiates** the supplier's theorem at the two-set cover of Layer 5.1 and reads off the
values on the canonical generators, which is Layer 5.6 below. -/

/-- **Layer 5.6.** The fundamental group is free on the two peripheral generators — the
instantiation this roadmap owns. Route: the two-set cover of 5.1, `π₁` of a punctured convex
domain (5.4), and UniversalCovers' two-open van Kampen theorem applied to them. -/
noncomputable def freeGroupEquiv :
    FreeGroup (Fin 2) ≃* FundamentalGroup ThricePuncturedSphere basePt := by
  sorry

theorem freeGroupEquiv_of0 : freeGroupEquiv (FreeGroup.of 0) = periph0 := by
  sorry

theorem freeGroupEquiv_of1 : freeGroupEquiv (FreeGroup.of 1) = periph1 := by
  sorry

/-- **Layer 5.1 (milestone, stated as an instance).** `U` is path-connected, being an open
connected subset of `ℂ`; Layer 6.1's degree statement and Layer 6.3's pullback action are
stated over a path-connected base. -/
instance : PathConnectedSpace ThricePuncturedSphere := by
  sorry

/-! ### Layer 5.1, 2.6: the anharmonic self-homeomorphisms

The six Möbius transformations permuting `{0, 1, ∞}` restrict to self-homeomorphisms of `U`.
The two generators are pinned here; the other four are their composites, with the formulas
listed in README §5.1. ⚠ **Only `mob01` fixes the basepoint** `b = 1/2`: the orbit of `b`
under the anharmonic group is `{1/2, 2, −1}`, which is why the induced `S₃`-action lives on
isomorphism classes of covers and not on literal triples. -/

/-- **Layer 5.1.** `z ↦ 1 − z`: the involution exchanging the punctures `0` and `1` and
fixing `∞`, the one anharmonic operation that fixes `b = 1/2`. -/
noncomputable def mob01 : ThricePuncturedSphere ≃ₜ ThricePuncturedSphere where
  toFun z := ⟨1 - z.1, by intro h; exact z.2.2 (by linear_combination -h),
    by intro h; exact z.2.1 (by linear_combination -h)⟩
  invFun z := ⟨1 - z.1, by intro h; exact z.2.2 (by linear_combination -h),
    by intro h; exact z.2.1 (by linear_combination -h)⟩
  left_inv := by sorry
  right_inv := by sorry
  continuous_toFun := by sorry
  continuous_invFun := by sorry

/-- **Layer 5.1.** `z ↦ z/(z − 1)`: the involution exchanging the punctures `1` and `∞` and
fixing `0`. It moves the basepoint: `mob1Inf b = −1`. -/
noncomputable def mob1Inf : ThricePuncturedSphere ≃ₜ ThricePuncturedSphere where
  toFun z := ⟨z.1 / (z.1 - 1), div_ne_zero z.2.1 (sub_ne_zero_of_ne z.2.2),
    by
      intro h
      exact one_ne_zero
        (sub_eq_self.mp ((div_eq_one_iff_eq (sub_ne_zero_of_ne z.2.2)).mp h).symm)⟩
  invFun z := ⟨z.1 / (z.1 - 1), div_ne_zero z.2.1 (sub_ne_zero_of_ne z.2.2),
    by
      intro h
      exact one_ne_zero
        (sub_eq_self.mp ((div_eq_one_iff_eq (sub_ne_zero_of_ne z.2.2)).mp h).symm)⟩
  left_inv := by sorry
  right_inv := by sorry
  continuous_toFun := by sorry
  continuous_invFun := by sorry

/-- **Layer 5.1.** `mob01` fixes the basepoint, which is what lets it act on `π₁(U, b)` with
no choice of connecting path. -/
theorem mob01_basePt : mob01 basePt = basePt := by
  sorry

/-- **Layer 5.2, 2.6, the value pin.** `mob01` carries the peripheral loop at `0` to the
peripheral loop at `1` **on the nose**, pointwise on the interval — the transport-free form
of `h_*(periph0) = periph1`. -/
theorem mob01_γ0 (s : unitInterval) : mob01 (γ0 s) = γ1 s := by
  sorry

/-- ...and back, so `mob01` exchanges the two chosen generators rather than merely
permuting their conjugacy classes. -/
theorem mob01_γ1 (s : unitInterval) : mob01 (γ1 s) = γ0 s := by
  sorry

end ThricePuncturedSphere

/-! ## Layers 5.4, 6: monodromy -/

/-- **Layer 5.3.** The fiber monodromy, packaged as a `MonoidHom` — a genuine
homomorphism, with no `ᵐᵒᵖ`, by `IsCoveringMap.monodromy_trans_apply` and the
`End`-multiplication convention. -/
noncomputable def monodromyHom {E : Type u} {X : Type v} [TopologicalSpace E]
    [TopologicalSpace X]
    {p : E → X} (hp : IsCoveringMap p) (x : X) :
    FundamentalGroup X x →* Equiv.Perm (p ⁻¹' {x}) := by
  sorry

theorem monodromyHom_apply {E : Type u} {X : Type v} [TopologicalSpace E]
    [TopologicalSpace X]
    {p : E → X} (hp : IsCoveringMap p) (x : X)
    (γ : FundamentalGroup X x) (e : p ⁻¹' {x}) :
    monodromyHom hp x γ e = hp.monodromy (FundamentalGroup.toPath γ) e := by
  sorry

/-! **Layer 6.2 remains a prose-only supplier crossing.** The README pins the associated-cover
construction and its monodromy equation. It becomes a public target here only after
UniversalCovers exports its semilocal-simple-connectivity class, universal-cover carrier, deck
action, and quotient-covering theorem. A closed `#check` against those supplier declarations is
required at that point. -/

/-! ### Layer 6.3: the three combinatorial carriers

Each of the three rigidifications of a cover is classified by an honest **type**, not by a
`Prop`-valued relation: literal connected triples, their simultaneous-conjugacy quotient, and
the quotient of marked triples by the diagonal relabeling action. -/

/-- **Layer 6.3.** Simultaneous-conjugacy classes of connected triples. -/
def ConnectedIsoClass (n : ℕ) : Type :=
  MulAction.orbitRel.Quotient (Equiv.Perm (Fin n)) (ConnectedTriple n)

/-- The class of a connected triple. -/
def ConnectedIsoClass.mk {n : ℕ} (t : ConnectedTriple n) : ConnectedIsoClass n :=
  Quotient.mk (MulAction.orbitRel (Equiv.Perm (Fin n)) (ConnectedTriple n)) t

/-- **Layer 6.3.** Connected triples carrying a **marked label**, modulo the **diagonal**
relabeling action `τ • (t, i) = (τ • t, τ i)` — the combinatorial carrier that classifies
connected *pointed* covers. ⚠ Quotienting pairs by the stabilizer of `i` instead is a
different and useless object: it never identifies pairs with different marked labels, and at
`n = 3` it has `39` elements against `26` triples (README, Layer 6.3). -/
def MarkedIsoClass (n : ℕ) : Type :=
  MulAction.orbitRel.Quotient (Equiv.Perm (Fin n)) (ConnectedTriple n × Fin n)

/-- The class of a marked connected triple. -/
def MarkedIsoClass.mk {n : ℕ} (t : ConnectedTriple n) (i : Fin n) : MarkedIsoClass n :=
  Quotient.mk (MulAction.orbitRel (Equiv.Perm (Fin n)) (ConnectedTriple n × Fin n)) (t, i)

/-- **Layer 6.3.** Forgetting the marked label — the combinatorial counterpart of forgetting
the basepoint of a pointed cover. -/
def MarkedIsoClass.forget {n : ℕ} : MarkedIsoClass n → ConnectedIsoClass n :=
  Quotient.lift (fun ti => ConnectedIsoClass.mk ti.1) (by
    rintro ⟨t, i⟩ ⟨t', i'⟩ ⟨g, hg⟩
    exact Quotient.sound ⟨g, congrArg Prod.fst hg⟩)

/-- **Layer 6.1.** A **connected** cover with a numbered fiber — the carrier that a literal
`PermutationTriple n` classifies.

⚠ **Connectedness is a field, not a convenience.** A literal transitive triple on `Fin n` is
the invariant of a *connected* numbered cover: without path-connectedness of `E` the monodromy
action on the fiber need not be transitive, and Layer 6.3's correspondence with connected
triples is false. The two consistent packages are *connected numbered covers ↔ connected
triples* and *arbitrary numbered covers ↔ arbitrary triples*; this roadmap pins the first, in
the type.

⚠ A *pointed* cover is a different carrier: one chosen point of the fiber leaves `(n−1)!`
relabelings, and Layer 6.3 classifies pointed covers by subgroups of `π₁`, never by literal
triples. -/
structure ConnectedFiberNumberedCover {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) where
  E : Type u
  [topE : TopologicalSpace E]
  [pathConnectedE : PathConnectedSpace E]
  p : E → X
  isCoveringMap : IsCoveringMap p
  ν : ↥(p ⁻¹' {x}) ≃ Fin n

attribute [instance] ConnectedFiberNumberedCover.topE
  ConnectedFiberNumberedCover.pathConnectedE

/-- **Layer 6.1.** A **connected** cover with one chosen point of the fiber, of degree `n`.
The carrier Layer 6.3 classifies by marked triples, equivalently — by UniversalCovers
milestone 8, which owns that half — by the index-`n` subgroups of `π₁`.

⚠ Connectedness is a field, not a convenience. A disconnected pointed cover recovers only the
subgroup of the component containing the chosen point, so adjoining any unrelated cover as a
second component leaves the subgroup unchanged and the classification below would not be
injective. -/
structure ConnectedPointedCover {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) where
  E : Type u
  [topE : TopologicalSpace E]
  [pathConnectedE : PathConnectedSpace E]
  p : E → X
  isCoveringMap : IsCoveringMap p
  e : ↥(p ⁻¹' {x})
  nonempty_ν : Nonempty (↥(p ⁻¹' {x}) ≃ Fin n)

attribute [instance] ConnectedPointedCover.topE ConnectedPointedCover.pathConnectedE

/-- **Layer 6.1.** A connected cover of degree `n` with no chosen point — the unpointed
carrier. The degree is carried as the existence of *some* numbering of the fiber, which is
also what makes the fiber finite; which numbering is chosen is exactly the data the other two
carriers add. -/
structure ConnectedCover {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) where
  E : Type u
  [topE : TopologicalSpace E]
  [pathConnectedE : PathConnectedSpace E]
  p : E → X
  isCoveringMap : IsCoveringMap p
  nonempty_ν : Nonempty (↥(p ⁻¹' {x}) ≃ Fin n)

attribute [instance] ConnectedCover.topE ConnectedCover.pathConnectedE

/-- **Layer 6.3.** Isomorphism of connected fiber-numbered covers: a homeomorphism over `X`
preserving the label of **every** point of the fiber. -/
def ConnectedFiberNumberedCoverIso {X : Type u} [TopologicalSpace X] {x : X} {n : ℕ}
    (c c' : ConnectedFiberNumberedCover x n) : Prop :=
  ∃ f : c.E ≃ₜ c'.E, (∀ y, c'.p (f y) = c.p y) ∧
    ∀ i : Fin n, f (c.ν.symm i).1 = (c'.ν.symm i).1

/-- **Layer 6.3.** Isomorphism of connected pointed covers: a homeomorphism over `X` carrying
the chosen point to the chosen point — one point only. -/
def ConnectedPointedCoverIso {X : Type u} [TopologicalSpace X] {x : X} {n : ℕ}
    (c c' : ConnectedPointedCover x n) : Prop :=
  ∃ f : c.E ≃ₜ c'.E, (∀ y, c'.p (f y) = c.p y) ∧ f c.e.1 = c'.e.1

/-- **Layer 6.3.** Isomorphism of connected covers: a homeomorphism over `X`. -/
def ConnectedCoverIso {X : Type u} [TopologicalSpace X] {x : X} {n : ℕ}
    (c c' : ConnectedCover x n) : Prop :=
  ∃ f : c.E ≃ₜ c'.E, ∀ y, c'.p (f y) = c.p y

/-! ### Layer 6.3: isomorphism classes as quotient carriers

⚠ "Covers up to isomorphism" is **not** a `Prop`. The three relations above are equivalence
relations, and the objects Layer 6.3 puts in bijection with triples, marked triples and their
conjugacy classes are the **quotients** below; the forgetful maps between the three
rigidifications descend through them. -/

instance connectedFiberNumberedCoverSetoid {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) :
    Setoid (ConnectedFiberNumberedCover x n) where
  r := ConnectedFiberNumberedCoverIso
  iseqv :=
    { refl := fun c => ⟨Homeomorph.refl c.E, fun _ => rfl, fun _ => rfl⟩
      symm := fun {c c'} h => by
        obtain ⟨f, hf, hν⟩ := h
        refine ⟨f.symm, fun y => ?_, fun i => ?_⟩
        · simpa using (hf (f.symm y)).symm
        · rw [← hν i]; simp
      trans := fun {c c' c''} h h' => by
        obtain ⟨f, hf, hν⟩ := h
        obtain ⟨g, hg, hν'⟩ := h'
        exact ⟨f.trans g, fun y => (hg (f y)).trans (hf y),
          fun i => by simpa [hν i] using hν' i⟩ }

instance connectedPointedCoverSetoid {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) :
    Setoid (ConnectedPointedCover x n) where
  r := ConnectedPointedCoverIso
  iseqv :=
    { refl := fun c => ⟨Homeomorph.refl c.E, fun _ => rfl, rfl⟩
      symm := fun {c c'} h => by
        obtain ⟨f, hf, he⟩ := h
        refine ⟨f.symm, fun y => ?_, ?_⟩
        · simpa using (hf (f.symm y)).symm
        · rw [← he]; simp
      trans := fun {c c' c''} h h' => by
        obtain ⟨f, hf, he⟩ := h
        obtain ⟨g, hg, he'⟩ := h'
        exact ⟨f.trans g, fun y => (hg (f y)).trans (hf y), by simpa [he] using he'⟩ }

instance connectedCoverSetoid {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) :
    Setoid (ConnectedCover x n) where
  r := ConnectedCoverIso
  iseqv :=
    { refl := fun c => ⟨Homeomorph.refl c.E, fun _ => rfl⟩
      symm := fun {c c'} h => by
        obtain ⟨f, hf⟩ := h
        exact ⟨f.symm, fun y => by simpa using (hf (f.symm y)).symm⟩
      trans := fun {c c' c''} h h' => by
        obtain ⟨f, hf⟩ := h
        obtain ⟨g, hg⟩ := h'
        exact ⟨f.trans g, fun y => (hg (f y)).trans (hf y)⟩ }

/-- **Layer 6.3.** Fiber-numbered covers up to isomorphism. -/
def ConnectedFiberNumberedCoverClass {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) :
    Type (u + 1) :=
  Quotient (connectedFiberNumberedCoverSetoid x n)

/-- **Layer 6.3.** Pointed covers up to pointed isomorphism. -/
def ConnectedPointedCoverClass {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) :
    Type (u + 1) :=
  Quotient (connectedPointedCoverSetoid x n)

/-- **Layer 6.3.** Covers up to isomorphism over `X`. -/
def ConnectedCoverClass {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ) : Type (u + 1) :=
  Quotient (connectedCoverSetoid x n)

section Forget

variable {X : Type u} [TopologicalSpace X] {x : X} {n : ℕ}

/-- **Layer 6.1.** Forgetting the numbering. -/
def ConnectedFiberNumberedCover.forgetNumbering (c : ConnectedFiberNumberedCover x n) :
    ConnectedCover x n where
  E := c.E
  p := c.p
  isCoveringMap := c.isCoveringMap
  nonempty_ν := ⟨c.ν⟩

/-- **Layer 6.1.** Keeping only the point with a chosen label: the numbered-to-pointed
forgetful map, one for each label. -/
def ConnectedFiberNumberedCover.markLabel (c : ConnectedFiberNumberedCover x n) (i : Fin n) :
    ConnectedPointedCover x n where
  E := c.E
  p := c.p
  isCoveringMap := c.isCoveringMap
  e := c.ν.symm i
  nonempty_ν := ⟨c.ν⟩

/-- **Layer 6.1.** Forgetting the chosen point. -/
def ConnectedPointedCover.forgetPoint (c : ConnectedPointedCover x n) : ConnectedCover x n where
  E := c.E
  p := c.p
  isCoveringMap := c.isCoveringMap
  nonempty_ν := c.nonempty_ν

/-- **Layer 6.3.** Forgetting the numbering, on isomorphism classes. -/
def ConnectedFiberNumberedCoverClass.forgetNumbering :
    ConnectedFiberNumberedCoverClass x n → ConnectedCoverClass x n :=
  Quotient.map ConnectedFiberNumberedCover.forgetNumbering
    (fun _ _ h => by obtain ⟨f, hf, _⟩ := h; exact ⟨f, hf⟩)

/-- **Layer 6.3.** Marking a label, on isomorphism classes: a numbered isomorphism preserves
every label, so in particular it preserves the marked point. -/
def ConnectedFiberNumberedCoverClass.markLabel (i : Fin n) :
    ConnectedFiberNumberedCoverClass x n → ConnectedPointedCoverClass x n :=
  Quotient.map (fun c => c.markLabel i)
    (fun _ _ h => by obtain ⟨f, hf, hν⟩ := h; exact ⟨f, hf, hν i⟩)

/-- **Layer 6.3.** Forgetting the point, on isomorphism classes. -/
def ConnectedPointedCoverClass.forgetPoint :
    ConnectedPointedCoverClass x n → ConnectedCoverClass x n :=
  Quotient.map ConnectedPointedCover.forgetPoint
    (fun _ _ h => by obtain ⟨f, hf, _⟩ := h; exact ⟨f, hf⟩)

/-- **Layer 6.3.** The forgetful triangle commutes: marking a label and then forgetting it is
forgetting the whole numbering. -/
theorem ConnectedFiberNumberedCoverClass.forgetPoint_markLabel (i : Fin n)
    (C : ConnectedFiberNumberedCoverClass x n) :
    (C.markLabel i).forgetPoint = C.forgetNumbering :=
  Quotient.inductionOn C fun _ => rfl

/-- **Layer 6.1.** A numbering of the fiber, chosen once. Which one is chosen is immaterial
to everything stated on the quotients below. -/
noncomputable def ConnectedCover.numbering (c : ConnectedCover x n) :
    ConnectedFiberNumberedCover x n where
  E := c.E
  p := c.p
  isCoveringMap := c.isCoveringMap
  ν := c.nonempty_ν.some

/-- **Layer 6.1.** The same, for a pointed cover; the marked label is `ν e`. -/
noncomputable def ConnectedPointedCover.numbering (c : ConnectedPointedCover x n) :
    ConnectedFiberNumberedCover x n where
  E := c.E
  p := c.p
  isCoveringMap := c.isCoveringMap
  ν := c.nonempty_ν.some

/-- **Layer 6.1.** The degree of a connected cover does not depend on the point: the fiber
cardinality is locally constant, hence constant on a path-connected base. -/
theorem ConnectedCover.nonempty_ν_of [PathConnectedSpace X] (c : ConnectedCover x n) (y : X) :
    Nonempty (↥(c.p ⁻¹' {y}) ≃ Fin n) := by
  sorry

end Forget

section Classification

open ThricePuncturedSphere

variable {n : ℕ}

/-- **Layer 6.1.** The monodromy triple of a connected fiber-numbered cover of the
thrice-punctured sphere. The third component automatically computes the monodromy of
`periphInf` (README, Layer 6.1). -/
noncomputable def ConnectedFiberNumberedCover.triple
    (c : ConnectedFiberNumberedCover basePt n) : PermutationTriple n :=
  PermutationTriple.ofTwo
    (c.ν.permCongr (monodromyHom c.isCoveringMap basePt periph0))
    (c.ν.permCongr (monodromyHom c.isCoveringMap basePt periph1))

/-- **Layer 6.1.** The triple of a **connected** numbered cover is connected: path lifting
identifies the monodromy orbits on the fiber with the path components of `E`, and `n ≠ 0`
matches `Nonempty E`. This is the theorem that the connectedness field of the carrier buys,
and without that field it is false. -/
theorem ConnectedFiberNumberedCover.triple_isConnected
    (c : ConnectedFiberNumberedCover basePt n) : c.triple.IsConnected := by
  sorry

/-- **Layer 6.1.** The triple, as a `ConnectedTriple n`. -/
noncomputable def ConnectedFiberNumberedCover.connectedTriple
    (c : ConnectedFiberNumberedCover basePt n) : ConnectedTriple n :=
  ⟨c.triple, c.triple_isConnected⟩

/-- **Layer 6.1.** The triple is unchanged by an isomorphism of fiber-numbered covers. -/
theorem ConnectedFiberNumberedCover.connectedTriple_congr
    {c c' : ConnectedFiberNumberedCover basePt n} (h : ConnectedFiberNumberedCoverIso c c') :
    c.connectedTriple = c'.connectedTriple := by
  sorry

/-- **Layer 6.3(1).** The classifying map at the numbered level, descended to isomorphism
classes. -/
noncomputable def ConnectedFiberNumberedCoverClass.triple :
    ConnectedFiberNumberedCoverClass basePt n → ConnectedTriple n :=
  Quotient.lift ConnectedFiberNumberedCover.connectedTriple
    fun _ _ h => ConnectedFiberNumberedCover.connectedTriple_congr h

/-- **Layer 6.3(1), the milestone.** Isomorphism classes of connected fiber-numbered covers
correspond to connected triples **on the nose**: 6.1 one way, 6.2's finite corollary the
other, with uniqueness from the pin's lifting criterion
`IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`. This is the only level at which
a literal triple is the classifying datum. -/
theorem ConnectedFiberNumberedCoverClass.triple_bijective :
    Function.Bijective (ConnectedFiberNumberedCoverClass.triple (n := n)) := by
  sorry

/-- **Layer 6.3(1).** The classification, as an equivalence of the two carriers. -/
noncomputable def numberedCoverClassEquivTriple :
    ConnectedFiberNumberedCoverClass basePt n ≃ ConnectedTriple n :=
  Equiv.ofBijective _ ConnectedFiberNumberedCoverClass.triple_bijective

/-- **Layer 6.3(2).** The isomorphism class of the triple of a connected cover: choose any
numbering and pass to the relabeling orbit. -/
noncomputable def ConnectedCover.isoClass (c : ConnectedCover basePt n) :
    ConnectedIsoClass n :=
  ConnectedIsoClass.mk c.numbering.connectedTriple

theorem ConnectedCover.isoClass_congr {c c' : ConnectedCover basePt n}
    (h : ConnectedCoverIso c c') : c.isoClass = c'.isoClass := by
  sorry

/-- **Layer 6.3(2).** The classifying map at the unnumbered level. -/
noncomputable def ConnectedCoverClass.isoClass :
    ConnectedCoverClass basePt n → ConnectedIsoClass n :=
  Quotient.lift ConnectedCover.isoClass fun _ _ h => ConnectedCover.isoClass_congr h

/-- **Layer 6.3(2), the milestone.** Connected covers up to isomorphism over `U` correspond
to simultaneous-conjugacy classes of connected triples: forgetting the numbering on one side
is exactly passing to the relabeling orbit on the other. -/
theorem ConnectedCoverClass.isoClass_bijective :
    Function.Bijective (ConnectedCoverClass.isoClass (n := n)) := by
  sorry

/-- **Layer 6.3(2).** The classification, as an equivalence of the two carriers. -/
noncomputable def coverClassEquivIsoClass :
    ConnectedCoverClass basePt n ≃ ConnectedIsoClass n :=
  Equiv.ofBijective _ ConnectedCoverClass.isoClass_bijective

/-- **Layer 6.3(3).** The marked class of a connected pointed cover: choose a numbering, and
mark the label of the chosen point. -/
noncomputable def ConnectedPointedCover.markedClass (c : ConnectedPointedCover basePt n) :
    MarkedIsoClass n :=
  MarkedIsoClass.mk c.numbering.connectedTriple (c.numbering.ν c.e)

theorem ConnectedPointedCover.markedClass_congr {c c' : ConnectedPointedCover basePt n}
    (h : ConnectedPointedCoverIso c c') : c.markedClass = c'.markedClass := by
  sorry

/-- **Layer 6.3(3).** The classifying map at the pointed level. -/
noncomputable def ConnectedPointedCoverClass.markedClass :
    ConnectedPointedCoverClass basePt n → MarkedIsoClass n :=
  Quotient.lift ConnectedPointedCover.markedClass
    fun _ _ h => ConnectedPointedCover.markedClass_congr h

/-- **Layer 6.3(3), the milestone.** Connected pointed covers of `(U, b)` up to pointed
isomorphism correspond to connected triples with a marked label, modulo the diagonal
relabeling action. ⚠ The composite with UniversalCovers milestone 8's pointed correspondence
identifies this carrier with the index-`n` subgroups of `π₁(U, b)`; that half is the
supplier's theorem and is not restated here. Hall's numbers `1, 3, 13, 71, 461` are the
acceptance check on the count. -/
theorem ConnectedPointedCoverClass.markedClass_bijective :
    Function.Bijective (ConnectedPointedCoverClass.markedClass (n := n)) := by
  sorry

/-- **Layer 6.3(3).** The classification, as an equivalence of the two carriers. -/
noncomputable def pointedCoverClassEquivMarkedIsoClass :
    ConnectedPointedCoverClass basePt n ≃ MarkedIsoClass n :=
  Equiv.ofBijective _ ConnectedPointedCoverClass.markedClass_bijective

/-- **Layer 6.3.** The forgetful maps commute with the classifications: forgetting the
numbering of a cover is passing to the relabeling orbit of its triple. -/
theorem ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering
    (C : ConnectedFiberNumberedCoverClass basePt n) :
    C.forgetNumbering.isoClass = ConnectedIsoClass.mk C.triple := by
  sorry

/-- **Layer 6.3.** ...and forgetting the chosen point is forgetting the marked label. -/
theorem ConnectedPointedCoverClass.isoClass_forgetPoint
    (C : ConnectedPointedCoverClass basePt n) :
    C.forgetPoint.isoClass = C.markedClass.forget := by
  sorry

/-- **Layer 6.3.** The conjugation action of a group on its subgroups, and the orbit relation
it induces — the shape in which UniversalCovers milestone 8 states the unpointed half, and the
target of the composite of `coverClassEquivIsoClass` with that milestone. ⚠ **Not**
`ConjClasses (Subgroup G)`: `ConjClasses` is a monoid's quotient by conjugation **on itself**,
and `Subgroup G` is not `G`. -/
noncomputable def subgroupConjSetoid {G : Type u} [Group G] : Setoid (Subgroup G) :=
  MulAction.orbitRel (ConjAct G) (Subgroup G)

/-! ### Layers 2.6, 6.3: the topological branch-point action

Pulling a cover back along an anharmonic self-homeomorphism of `U` is the topological
`S₃`-action; the two theorems below say it is the combinatorial one of Layer 2.6, on the
nose, for the two generators. That is what makes "the expected `S₃` action" unambiguous
about inversions and order. -/

/-- **Layer 6.3.** The pullback of a cover along a self-homeomorphism of the base. -/
noncomputable def ConnectedCover.pullback {X : Type u} [TopologicalSpace X]
    [PathConnectedSpace X] {x : X} (h : X ≃ₜ X) (c : ConnectedCover x n) :
    ConnectedCover x n where
  E := {q : X × c.E // h q.1 = c.p q.2}
  pathConnectedE := by sorry
  p := fun q => q.1.1
  isCoveringMap := by sorry
  nonempty_ν := by sorry

theorem ConnectedCover.pullback_congr {X : Type u} [TopologicalSpace X]
    [PathConnectedSpace X] {x : X} (h : X ≃ₜ X) {c c' : ConnectedCover x n}
    (hcc : ConnectedCoverIso c c') :
    ConnectedCoverIso (c.pullback h) (c'.pullback h) := by
  sorry

/-- **Layer 6.3.** The pullback action on isomorphism classes. -/
noncomputable def ConnectedCoverClass.pullback {X : Type u} [TopologicalSpace X]
    [PathConnectedSpace X] {x : X} (h : X ≃ₜ X) :
    ConnectedCoverClass x n → ConnectedCoverClass x n :=
  Quotient.map (ConnectedCover.pullback h) fun _ _ hcc => ConnectedCover.pullback_congr h hcc

/-- **Layer 2.6, 6.3, the agreement theorem, generator one.** Pulling back along
`z ↦ 1 − z` replaces the triple of a cover by `swap01` of it. Because `mob01` fixes the
basepoint, this holds with no choice of connecting path, and it is what pins the conjugator
`b⁻¹ · c · b` in `swap01` against the topology rather than against a convention. -/
theorem ConnectedCover.isoClass_pullback_mob01 (c : ConnectedCover basePt n) :
    (c.pullback mob01).isoClass
      = ConnectedIsoClass.mk (ConnectedTriple.swap01 c.numbering.connectedTriple) := by
  sorry

/-- **Layer 2.6, 6.3, the agreement theorem, generator two.** Pulling back along
`z ↦ z/(z − 1)` replaces the triple by `swap1Inf` of it. ⚠ Here the statement is genuinely
one about **classes**: `mob1Inf b = −1 ≠ b`, so the induced map on `π₁(U, b)` exists only
after a choice of connecting path, and the two choices differ by the inner automorphism that
`swap1Inf_sq` records. -/
theorem ConnectedCover.isoClass_pullback_mob1Inf (c : ConnectedCover basePt n) :
    (c.pullback mob1Inf).isoClass
      = ConnectedIsoClass.mk (ConnectedTriple.swap1Inf c.numbering.connectedTriple) := by
  sorry

end Classification

/-! ## Deferred compact-Riemann-surface crossing

The analytic carrier, ramification API, and Riemann–Roch/Riemann–Hurwitz interfaces are not
prototyped until the compact-Riemann-surface owner publishes a compiled carrier and theorem
names. The former local interfaces are intentionally disabled rather than presented as supplier
declarations. -/

/-

/-! ## Layer 8: analytic Belyi pairs

The two sorried instances are the Riemann-sphere milestones of Layer 8.1: the charts are
`z` and `1/z`. They are declared as instances so that the carriers below can be stated. -/

/-- **Layer 8.1 (milestone, stated as an instance).** The Riemann sphere's charted-space
structure on `OnePoint ℂ`, with the two standard charts. -/
noncomputable instance : ChartedSpace ℂ (OnePoint ℂ) := by
  sorry

/-- **Layer 8.1 (milestone, stated as an instance).** The complex-manifold structure: the
transition `z ↦ 1/z` on `ℂˣ` is analytic. -/
instance : IsManifold 𝓘(ℂ) ω (OnePoint ℂ) := by
  sorry

open OnePoint in
/-- **Layer 8.4.** An analytic Belyi pair: a compact connected Riemann surface — the
unbundled hypothesis stack pinned in README §Pinned conventions — with a nonconstant
holomorphic map to the sphere that is an even covering away from `{0, 1, ∞}`. The
equivalence with the branch-value formulation is the Layer 8.4 milestone. -/
structure AnalyticBelyiPair : Type (u + 1) where
  X : Type u
  [topX : TopologicalSpace X]
  [chartedX : ChartedSpace ℂ X]
  [manifoldX : IsManifold 𝓘(ℂ) ω X]
  [t2X : T2Space X]
  [compactX : CompactSpace X]
  [connectedX : ConnectedSpace X]
  β : X → OnePoint ℂ
  mdifferentiable : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) β
  exists_ne : ∃ x y, β x ≠ β y
  isCoveringMapOn :
    IsCoveringMapOn β
      ({((0 : ℂ) : OnePoint ℂ), ((1 : ℂ) : OnePoint ℂ), OnePoint.infty}ᶜ)

attribute [instance] AnalyticBelyiPair.topX AnalyticBelyiPair.chartedX
  AnalyticBelyiPair.manifoldX AnalyticBelyiPair.t2X AnalyticBelyiPair.compactX
  AnalyticBelyiPair.connectedX

/-! ### Layer 9.2, 9.4: the meromorphic field and the Riemann–Roch interface

`M X` is Layer 9.2's carrier; the divisor group, degree and genus are pinned here so that
the Riemann–Roch statement the ModularForms roadmap owes has somewhere type-correct to land.
⚠ The supplier pins **no** Lean names for any of this, so these are stand-ins, not citations.
-/

/-! ### Layers 9.2, 9.4: the meromorphic field and the Riemann–Roch interface

⚠ Hypotheses are carried as **typeclass binders**, one per declaration, not bundled into a
single `IsCompactRiemannSurface X` conjunction. A conjunction does not install its components
as instances, so downstream synthesis of `Field (MerField X)` would fail. The binders differ
between declarations on purpose: connectedness is what makes `MerField X` a field, and
compactness is what makes divisors finitely supported. -/

/-- **Layer 9.2.** The meromorphic functions: holomorphic maps to the sphere other than the
constant `∞`. -/
def MerField (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] :
    Type u :=
  {f : X → OnePoint ℂ // MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ f ≠ fun _ => OnePoint.infty}

/-- **Layer 9.2, the milestone.** The field structure, whose operations are the named targets
of README Layer 9.2 — each the unique holomorphic function agreeing with the chartwise
operation off the polar sets.

⚠ **`ConnectedSpace X` is required and `CompactSpace X` is not.** On a disjoint union of two
Riemann surfaces the meromorphic functions form a *product* of fields and have zero divisors,
so the instance would be false; on an empty `X` the carrier is empty and has no `1`. Existence
and uniqueness of the operations come from removability and the identity theorem, which need
the manifold structure and connectedness — not compactness. Compactness enters below, at
divisors. -/
noncomputable instance instFieldMerField (X : Type u) [TopologicalSpace X]
    [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] [T2Space X] [ConnectedSpace X] :
    Field (MerField X) := sorry

/-- **Layer 9.2.** The constants embed, so `L(D)` below is a `ℂ`-subspace. -/
noncomputable instance instAlgebraMerField (X : Type u) [TopologicalSpace X]
    [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] [T2Space X] [ConnectedSpace X] :
    Algebra ℂ (MerField X) := sorry

/-- **Layer 9.4.** Divisors. An `abbrev` so that `Finsupp`'s group structure — in particular
subtraction, which `riemannRochAn` needs — is found without transport. Finite support is
where compactness enters. -/
abbrev Divisor (X : Type u) : Type u := X →₀ ℤ

/-- **Layer 9.4.** The degree of a divisor, an **integer**. -/
def Divisor.deg {X : Type u} (D : Divisor X) : ℤ := D.sum fun _ m => m

/-- **Layer 8.1/9.4.** The genus. ⚠ Not imported from a classification of topological
surfaces — the roadmap has none and needs none; this is the genus appearing in
Riemann–Roch. -/
def genusAn (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X]
    [T2Space X] [CompactSpace X] [ConnectedSpace X] : ℕ := sorry

/-- **Layer 9.4.** The Riemann–Roch space `L(D)`. -/
def riemannRochSpaceAn (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) ω X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (D : Divisor X) : Submodule ℂ (MerField X) := sorry

/-- **Layer 9.4.** Its dimension, finite because `X` is compact. -/
def ellAn (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X]
    [T2Space X] [CompactSpace X] [ConnectedSpace X] (D : Divisor X) : ℕ := sorry

/-- **Layer 9.4.** A canonical divisor. -/
def canonicalDivisor (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) ω X] [T2Space X] [CompactSpace X] [ConnectedSpace X] :
    Divisor X := sorry

/-- **Layer 9.4, the interface ModularForms Layer 10B owes.** ⚠ An identity in `ℤ`: the left
side is a difference of dimensions and the right involves `deg D`, so `ℕ` subtraction would
silently truncate exactly when `ℓ(K − D) > ℓ(D)`. -/
theorem riemannRochAn (X : Type u) [TopologicalSpace X] [ChartedSpace ℂ X]
    [IsManifold 𝓘(ℂ) ω X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (D : Divisor X) :
    (ellAn X D : ℤ) - (ellAn X (canonicalDivisor X - D) : ℤ) =
      D.deg + 1 - (genusAn X : ℤ) :=
  sorry

/-! **Layers 8.2, 8.3: the invariants Riemann–Hurwitz is about.**

⚠ These exist so that Riemann–Hurwitz is a theorem about `f`. Quantifying the formula over a
free `deg : ℕ`, `ram : Finset X` and `e : X → ℕ` does not weaken it — it makes it **false**,
because the caller may supply any numbers at all.

⚠ **The nonconstancy and holomorphy of `f` are arguments, not context.** Layer 8.2 defines
`ramificationIndex` only for a nonconstant holomorphic map between connected Riemann
surfaces, and outside that class there is no local degree: a definition taking a bare
`f : X → Y` would have to return an undocumented junk value, and `ramificationIndexAn_pos`
below would then silently commit the roadmap to that junk being positive.

⚠ **Compactness is not a hypothesis of the local index.** Layer 8.2's `e` is local. Compactness
enters only to package the branch locus as a `Finset` and to state 8.3's degree and
Riemann–Hurwitz, and is carried on exactly those declarations. -/

section LocalIndex

variable {X Y : Type u} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X]
  [T2Space X] [ConnectedSpace X]
  [TopologicalSpace Y] [ChartedSpace ℂ Y] [IsManifold 𝓘(ℂ) ω Y]
  [T2Space Y] [ConnectedSpace Y]

/-- **Layer 8.2.** The ramification index of `f` at `x`: the `e` of the local normal form
`w ↦ w ^ e`. No compactness. -/
def ramificationIndexAn (f : X → Y) (_hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (_hne : ∃ x y, f x ≠ f y) (x : X) : ℕ :=
  sorry

/-- **Layer 8.2, the defining property.** This is what makes `ramificationIndexAn` *the*
ramification index rather than some positive number attached to each point: in suitable
charts at `x` and at `f x`, `f` is exactly `w ↦ w ^ e`. Uniqueness of `e` is Layer 8.2's
chart-independence statement. -/
theorem ramificationIndexAn_localNormalForm (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) (x : X) :
    ∃ (φ : OpenPartialHomeomorph X ℂ) (ψ : OpenPartialHomeomorph Y ℂ),
      x ∈ φ.source ∧ f x ∈ ψ.source ∧ φ x = 0 ∧ ψ (f x) = 0 ∧
      ∀ w ∈ φ.target, ψ (f (φ.symm w)) = w ^ ramificationIndexAn f hf hne x :=
  sorry

/-- The index is positive — junk-free, so the Riemann–Hurwitz sum cannot be gamed by an index
of `0`. -/
theorem ramificationIndexAn_pos (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) (x : X) : 0 < ramificationIndexAn f hf hne x :=
  sorry

/-- **Layer 8.2.** `e = 1` exactly at the points where `f` is a local biholomorphism. -/
theorem ramificationIndexAn_eq_one_iff (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) (x : X) :
    ramificationIndexAn f hf hne x = 1 ↔
      ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ Set.InjOn f U :=
  sorry

/-- **Layer 8.2.** The branch locus is closed and discrete — the statement that becomes
finiteness once `X` is compact. -/
theorem ramificationLocus_discrete (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) :
    DiscreteTopology {x : X // 1 < ramificationIndexAn f hf hne x} :=
  sorry

end LocalIndex

section CompactInvariants

variable {X Y : Type u} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X]
  [T2Space X] [CompactSpace X] [ConnectedSpace X]
  [TopologicalSpace Y] [ChartedSpace ℂ Y] [IsManifold 𝓘(ℂ) ω Y]
  [T2Space Y] [CompactSpace Y] [ConnectedSpace Y]

/-- **Layer 8.3.** The degree of a nonconstant holomorphic map of **compact** connected
Riemann surfaces: the common fiber cardinality counted with multiplicity. Compactness is
what makes it finite and constant. -/
def degreeAn (f : X → Y) (_hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f) (_hne : ∃ x y, f x ≠ f y) : ℕ :=
  sorry

/-- **Layer 8.2/8.3.** The ramified points as a `Finset` — a `Finset` because the branch
locus is discrete and `X` is compact. -/
def ramifiedPointsAn (f : X → Y) (_hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (_hne : ∃ x y, f x ≠ f y) : Finset X :=
  sorry

/-- The ramified points are exactly where the index exceeds `1`. This ties the summation set
to `f`. -/
theorem mem_ramifiedPointsAn_iff (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) (x : X) :
    x ∈ ramifiedPointsAn f hf hne ↔ 1 < ramificationIndexAn f hf hne x :=
  sorry

/-- **Layer 8.3.** The degree is the fiber sum of ramification indices, at **every** point of
the target — which is what makes `degreeAn` the degree rather than an arbitrary natural
number. ⚠ Layer 8.2's warning applies: the fiber *cardinality* is not the index; it is the
sum of the indices over the fiber. -/
theorem degreeAn_eq_fiber_sum (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) (y : Y) (fib : Finset X) (hfib : ∀ x, x ∈ fib ↔ f x = y) :
    degreeAn f hf hne = ∑ x ∈ fib, ramificationIndexAn f hf hne x :=
  sorry

/-- **Layer 9.4, the Riemann–Hurwitz interface.** Every quantity is derived from `f`. An
identity in `ℤ`, with the ramification sum over the finitely many ramified points. -/
theorem riemannHurwitzAn (f : X → Y) (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hne : ∃ x y, f x ≠ f y) :
    2 * (genusAn X : ℤ) - 2 =
      (degreeAn f hf hne : ℤ) * (2 * (genusAn Y : ℤ) - 2) +
        ∑ x ∈ ramifiedPointsAn f hf hne, ((ramificationIndexAn f hf hne x : ℤ) - 1) :=
  sorry

end CompactInvariants
-/

/-! ## Deferred profinite crossing

The generic profinite integers, exponentiation calculus, and continuous outer-automorphism
carrier belong to `ProfiniteArithmetic`, the generic successor to `ProfiniteProPGroups` (#244);
free profinite and free pro-`p` groups belong to #244 itself. The Belyi-specific peripheral
declarations are added in the successor roadmap `BelyiArithmeticActions`, after those suppliers
land; no generic construction is exported from this namespace. -/

/-

/-! Historical draft signatures below are disabled. Generic profinite carriers and operations
belong to `ProfiniteProPGroups` (#244) and to its generic successor `ProfiniteArithmetic`; their
eventual Belyi consumers are added in `BelyiArithmeticActions` after that API lands. -/

/-- **Layer 12.6 / §Pinned conventions.** The peripheral element `P`. -/
noncomputable def periphP : ProfiniteProPGroups.freeProfiniteGroup (Fin 2) :=
  ProfiniteProPGroups.freeProfiniteGroup.of 0

/-- The peripheral element `T`. -/
noncomputable def periphT : ProfiniteProPGroups.freeProfiniteGroup (Fin 2) :=
  ProfiniteProPGroups.freeProfiniteGroup.of 1

/-- The peripheral element `C := (T * P)⁻¹`, so that `C * T * P = 1` — the profinite image
of the Layer 5.2 relation, in the pinned display order. -/
noncomputable def periphC : ProfiniteProPGroups.freeProfiniteGroup (Fin 2) :=
  (periphT * periphP)⁻¹
-/

/-- **§Pinned conventions, P0.2.** The opposite-convention third peripheral element is the
conjugate `P · C · P⁻¹`, **not** `P⁻¹ · C · P`. Stated on an abstract group, since it is a
word identity. -/
theorem opposite_third_peripheral {G : Type u} [Group G] (P T : G) :
    (P * T)⁻¹ = P * ((T * P)⁻¹) * P⁻¹ := by group

/-
theorem periphC_mul_periphT_mul_periphP : periphC * periphT * periphP = 1 := by
  simp [periphC, mul_assoc]

/-- **Layer 12.1.** The profinite integers as a topological commutative **ring**, as the
subring of compatible systems inside `∀ n : ℕ+, ZMod n`.
⚠ ProfiniteProPGroups supplies the profinite completion of the infinite cyclic *group*; that is not
enough for `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)`, for `ẑˣ`, or for the `ℓ`-adic components, all of
which Layers 12.2, 12.3 and 12.10 use. This milestone owns the ring.
⚠ The index runs over `ℕ+`, not `ℕ`: `ZMod 0` is `ℤ`, every `n` divides `0`, and including
it would collapse the limit to `ℤ`. -/
def profiniteIntSubring : Subring (∀ n : ℕ+, ZMod (n : ℕ)) where
  carrier := {f | ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)),
    ZMod.castHom h (ZMod (n : ℕ)) (f m) = f n}
  zero_mem' := by intro m n h; simp
  one_mem' := by intro m n h; simpa using map_one (ZMod.castHom h (ZMod (n : ℕ)))
  add_mem' ha hb := by intro m n h; simp [map_add, ha m n h, hb m n h]
  mul_mem' ha hb := by intro m n h; simp [map_mul, ha m n h, hb m n h]
  neg_mem' ha := by intro m n h; simp [map_neg, ha m n h]

/-- **Layer 12.1.** The carrier. An `abbrev` so that the `Subring` instances and the
coercion to `∀ n : ℕ+, ZMod n` are found without transport. -/
abbrev ProfiniteInt : Type := profiniteIntSubring

/-- **Layer 12.1.** The remaining structure — a topological ring, compact and totally
disconnected — is the milestone; the pin has no profinite-integer development to consume.
The `CommRing` and `TopologicalSpace` instances are inherited from the ambient product. -/
instance : IsTopologicalRing ProfiniteInt := sorry
instance : CompactSpace ProfiniteInt := sorry
instance : TotallyDisconnectedSpace ProfiniteInt := sorry

/-- **Layer 12.1.** The projections to the finite rings, compatible under divisibility. -/
def ProfiniteInt.toZMod (n : ℕ+) : ProfiniteInt →+* ZMod (n : ℕ) where
  toFun a := (a : ∀ m : ℕ+, ZMod (m : ℕ)) n
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- **Layer 12.1.** Compatibility of the projections — the limit property in usable form. -/
theorem ProfiniteInt.castHom_toZMod (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (a : ProfiniteInt) :
    ZMod.castHom h (ZMod (n : ℕ)) (ProfiniteInt.toZMod m a) = ProfiniteInt.toZMod n a :=
  a.2 m n h

/-- **Layer 12.1.** The `ℓ`-adic component, a **ring** homomorphism — this is the map
Layer 12.3's comparison `x ^ᶻ a = x ^[ℓ] (component_ℓ a)` is stated with. -/
noncomputable def ProfiniteInt.component (ℓ : ℕ) [Fact ℓ.Prime] :
    ProfiniteInt →+* ℤ_[ℓ] := sorry

/-- **Layer 12.1.** Unit criterion: an element is a unit iff every finite-level image is.
This is what makes `ẑˣ` a usable target for the cyclotomic character of Layer 12.10. -/
theorem ProfiniteInt.isUnit_iff (a : ProfiniteInt) :
    IsUnit a ↔ ∀ n : ℕ+, IsUnit (ProfiniteInt.toZMod n a) := sorry

/-- **Layer 12.1, the comparison.** The ring's procyclic group is the supplier's `zHat`.
Stated as a theorem, so that no milestone silently switches between the two structures. -/
theorem profiniteInt_mulEquiv_zhat :
    Nonempty (Multiplicative ProfiniteInt ≃ₜ* ProfiniteProPGroups.zHat) := sorry

/-- **Layer 12.3, supplier contract.** The maximal pro-`ℓ` quotient of the imported
procyclic group is the multiplicative group of `ℤ_ℓ`. This closed check deliberately cites
the supplier theorem instead of introducing a BelyiMaps alias or local stand-in. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    Nonempty
      (ProfiniteProPGroups.maximalProPQuotient ℓ ProfiniteProPGroups.zHat ≃ₜ*
        Multiplicative ℤ_[ℓ]) :=
  ProfiniteProPGroups.maximalProPQuotient_zHat_equiv_padicInt ℓ

/-- **Layer 12.2.** The profinite power `x ^ᶻ a`: the image of `a` under the unique
continuous homomorphism `ẑ → G` with `1 ↦ x`. The laws — agreement with integer powers,
additivity, multiplicativity **through 12.1's ring product**, continuity, and naturality
under continuous homomorphisms (hence under conjugation) — are the Layer 12.2 milestones. -/
noncomputable def zhatPow {G : ProfiniteGrp} (x : G) (a : ProfiniteInt) : G := by
  sorry

/-- **Layer 12.2.** The law that forces the ring milestone to come first. -/
theorem zhatPow_zhatPow {G : ProfiniteGrp} (x : G) (a b : ProfiniteInt) :
    zhatPow (zhatPow x a) b = zhatPow x (a * b) := by
  sorry

/-- **Layer 13.1.** The maximal pro-`ℓ` quotient of the profinite free group on two
generators, using the supplier's canonical `freeProP`. ⚠ Every Layer 13 declaration carries
`[Fact ℓ.Prime]`: neither a maximal quotient at composite `ℓ` nor `ℤ_[ℓ]` is the intended
object. -/
noncomputable abbrev DeltaL (ℓ : ℕ) [Fact ℓ.Prime] : Type :=
  ProfiniteProPGroups.freeProP ℓ (Fin 2)

/-- **Layer 13.1.** The pro-`ℓ` peripheral element `P_ℓ`. -/
noncomputable def periphPL (ℓ : ℕ) [Fact ℓ.Prime] : DeltaL ℓ :=
  ProfiniteProPGroups.freeProP.of ℓ 0

/-- The pro-`ℓ` peripheral element `T_ℓ`. -/
noncomputable def periphTL (ℓ : ℕ) [Fact ℓ.Prime] : DeltaL ℓ :=
  ProfiniteProPGroups.freeProP.of ℓ 1

/-- The pro-`ℓ` peripheral element `C_ℓ`. -/
noncomputable def periphCL (ℓ : ℕ) [Fact ℓ.Prime] : DeltaL ℓ :=
  (periphTL ℓ * periphPL ℓ)⁻¹

theorem periphCL_mul_periphTL_mul_periphPL (ℓ : ℕ) [Fact ℓ.Prime] :
    periphCL ℓ * periphTL ℓ * periphPL ℓ = 1 := by
  sorry

/-- **Layer 12.3.** The `ℤ_ℓ`-power on the maximal pro-`ℓ` quotient: the canonical
operation through which `zhatPow` factors on pro-`ℓ` groups, with the same laws. Not an
arbitrary function argument — the comparison with `zhatPow` is the Layer 12.3 theorem. -/
noncomputable def padicPow {ℓ : ℕ} [Fact ℓ.Prime] (x : DeltaL ℓ) (u : ℤ_[ℓ]) :
    DeltaL ℓ := by
  sorry

/-- **Layer 13.2.** Surjectivity of the `ℓ`-adic cyclotomic character of `ℚ`, from the
finite cyclotomic levels and compactness. Ring automorphisms of `ℚ̄` are exactly
`Gal(ℚ̄/ℚ)`, since every ring automorphism fixes the prime field. -/
theorem cyclotomicCharacter_surjective (ℓ : ℕ) [Fact ℓ.Prime] :
    Function.Surjective (cyclotomicCharacter (AlgebraicClosure ℚ) ℓ) := by
  sorry

/-- **Layer 13.3, the peripheral-power theorem.** For every prime `ℓ` and every
`u ∈ ℤ_ℓˣ` there is a continuous automorphism of `Δ_ℓ` carrying each peripheral element to
a conjugate of its `u`-th power. The assignment `u ↦ φ_u` is not asserted to be a
homomorphism, continuous, or canonical (README, Layer 13.3). -/
theorem exists_peripheralPowerAutomorphism (ℓ : ℕ) [Fact ℓ.Prime] (u : ℤ_[ℓ]ˣ) :
    ∃ φ : DeltaL ℓ ≃ₜ* DeltaL ℓ, ∃ cP cT cC : DeltaL ℓ,
      φ (periphPL ℓ) = cP⁻¹ * padicPow (periphPL ℓ) u * cP ∧
      φ (periphTL ℓ) = cT⁻¹ * padicPow (periphTL ℓ) u * cT ∧
      φ (periphCL ℓ) = cC⁻¹ * padicPow (periphCL ℓ) u * cC := by
  sorry
-/

/-- **Layer 13.3, the conjugation-transfer lemma.** The conjugator for a conjugate element
is **computed**, not guessed: `d := q * c * (φ q)⁻¹`. ⚠ It involves `φ q`, and is not
obtained by multiplying `c` by `q` on one side. Stated on an abstract group with an abstract
power operation, since that is all the proof uses — naturality of the power under
conjugation (Layer 12.2) supplies `pow (q * x * q⁻¹) = q * pow x * q⁻¹`. -/
theorem conjugation_transfer {G : Type u} [Group G] (φ : G ≃* G) (pow : G → G)
    (hpow : ∀ q x : G, pow (q * x * q⁻¹) = q * pow x * q⁻¹)
    {x c : G} (hx : φ x = c⁻¹ * pow x * c) (q : G) :
    φ (q * x * q⁻¹) =
      (q * c * (φ q)⁻¹)⁻¹ * pow (q * x * q⁻¹) * (q * c * (φ q)⁻¹) := by
  have h : φ (q * x * q⁻¹) = φ q * (c⁻¹ * pow x * c) * (φ q)⁻¹ := by
    simp [map_mul, map_inv, hx]
  rw [h, hpow]
  group

/-- **§Pinned conventions.** The transfer applied at `q = P`, `x = C`: the rival
convention's third peripheral element `(P * T)⁻¹` is `P * C * P⁻¹`, so a consumer using it
needs no new mathematics, only the conjugator the lemma computes. -/
example {G : Type u} [Group G] (P T : G) : (P * T)⁻¹ = P * ((T * P)⁻¹) * P⁻¹ :=
  opposite_third_peripheral P T

end TauCetiRoadmap.BelyiMaps
