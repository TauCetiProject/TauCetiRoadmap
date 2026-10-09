import Mathlib
import TauCeti.AlgebraicTopology.FundamentalGroup.BasepointChange
import TauCeti.AlgebraicTopology.FundamentalGroup.VanKampen
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.BranchPointAction
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.Classification
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.Deck
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.FundamentalGroup
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.Regular
import TauCeti.AlgebraicTopology.UniversalCover.Classification.ActionCover
import TauCeti.AlgebraicTopology.UniversalCover.Classification.Bijection
import TauCeti.AlgebraicTopology.UniversalCover.Classification.DeckGroup
import TauCeti.AlgebraicTopology.UniversalCover.Classification.NumberedFiber
import TauCeti.AlgebraicTopology.UniversalCover.Deck.FundamentalGroup.UniversalCover
import TauCeti.AlgebraicTopology.UniversalCover.Deck.Regular.Monodromy
import TauCeti.Combinatorics.PermutationTriple.BranchPoints
import TauCeti.Combinatorics.PermutationTriple.ComputedInvariants
import TauCeti.Combinatorics.PermutationTriple.Decidable
import TauCeti.Combinatorics.PermutationTriple.Enumeration
import TauCeti.Combinatorics.PermutationTriple.EulerCharacteristic
import TauCeti.Combinatorics.PermutationTriple.Examples
import TauCeti.Combinatorics.PermutationTriple.GeometryType
import TauCeti.Combinatorics.PermutationTriple.IsoClass
import TauCeti.Combinatorics.PermutationTriple.Passport.Class
import TauCeti.Combinatorics.PermutationTriple.Passport.Cyclic
import TauCeti.Combinatorics.PermutationTriple.Passport.Enumeration
import TauCeti.Combinatorics.PermutationTriple.Passport.Examples
import TauCeti.Combinatorics.PermutationTriple.Passport.Label
import TauCeti.Combinatorics.PermutationTriple.Passport.OfTriple
import TauCeti.Combinatorics.PermutationTriple.Primitivity.Basic
import TauCeti.Combinatorics.PermutationTriple.Primitivity.Examples
import TauCeti.Combinatorics.PermutationTriple.SmallDegrees
import TauCeti.Combinatorics.RibbonGraph.Basic
import TauCeti.Combinatorics.RibbonGraph.EulerCharacteristic
import TauCeti.Combinatorics.RibbonGraph.OfPermutationTriple
import TauCeti.Combinatorics.RibbonGraph.ToPermutationTriple
import TauCeti.GroupTheory.Perm.ComputedCycleType
import TauCeti.GroupTheory.Perm.SwapFactors
import TauCeti.GroupTheory.TriangleGroup.Basic
import TauCeti.GroupTheory.TriangleGroup.PermutationRepresentation
import TauCeti.Topology.Homotopy.Monodromy.Basic
import TauCeti.Topology.Homotopy.Monodromy.BasepointChange

/-!
# Belyi maps, dessins d'enfants, and three-point covers: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`, which numbers the milestones as Layer `n.m`. The statements here suggest Lean
forms for particular milestones, so that contributors and reviewers agree on names and
signatures. Discharging all of them finishes neither a layer nor the roadmap.

Tau Ceti implements the combinatorial and topological core of this roadmap, so every carrier
below is Tau Ceti's and no local copy is defined: permutation triples with relabeling,
connectedness, automorphisms, cycle data, Euler characteristic, genus, orders and geometry
type, the six branch-point operations and the example suite (`TauCeti.PermutationTriple`);
connected triples and their isomorphism and marked classes (`TauCeti.ConnectedTriple`,
`TauCeti.ConnectedIsoClass`, `TauCeti.MarkedIsoClass`); passports (`TauCeti.PassportSpec`);
dessins (`TauCeti.BipartiteRibbonGraph`); triangle groups (`TauCeti.TriangleGroup`); the
thrice-punctured sphere with its peripheral loops, anharmonic maps and free fundamental group
(`TauCeti.ThricePuncturedSphere`); and the three cover carriers with their classifications
(`TauCeti.ConnectedFiberNumberedCover`, `TauCeti.ConnectedPointedCover`,
`TauCeti.ConnectedCover`). A statement whose milestone Tau Ceti has proved is kept in the form
the roadmap asks for and closed by the Tau Ceti declaration named in its docstring, so that a
change of spelling or carrier upstream fails here. A statement still closed by `sorry` is a
remaining target, unless its docstring names the Tau Ceti theorem that proves it in a version
newer than the pinned dependency.

Conventions of the Tau Ceti carriers that the statements below follow:

* The cover carriers live over a base `X : TopCat` and bundle a
  `TauCeti.ConnectedCoveringSpace X`, so the base here is
  `TopCat.of TauCeti.ThricePuncturedSphere`. An isomorphism of covers is an isomorphism in that
  category, which is a homeomorphism over the base; the bare relation is
  `CategoryTheory.IsIsomorphic` on the underlying covers rather than a named
  `ConnectedCoverIso`. The classifications are stated on Tau Ceti's quotients, which carry the
  same three relations. A `TauCeti.ConnectedCoveringSpace` has a connected total space; over a
  locally path-connected base such as `U` that is the same as a path-connected one, which is how
  `README.md` states the carriers.
* Pulling a cover back along a homeomorphism `h` moves its basepoint from `x` to `h⁻¹ x`
  (`TauCeti.ConnectedCoverClass.pullback`). For `z ↦ 1 − z`, which fixes `1/2`, the basepoint
  does not move. For `z ↦ z/(z − 1)`, which sends `1/2` to `−1`, the pulled-back cover lives
  at `−1`, and the agreement theorem for that generator moves its basepoint back to `1/2` with
  `TauCeti.ConnectedCoverClass.basepointChange`.
* Connectedness is decided by a `Decidable` instance computing the monodromy orbits
  (`TauCeti.PermutationTriple.monodromyOrbitFinset`), not by a separate Boolean.
* Cycle counts are `TauCeti.orbitCount`, the number of orbits including fixed points, and cycle
  partitions are Tau Ceti's `Equiv.Perm.fullCycleType`, computed by
  `Equiv.Perm.computedCycleType`.
* The two incidence laws of a ribbon graph, `blackEnd (rotB e) = blackEnd e` and its white
  counterpart, are theorems of the `IsCycleOn` fields in Tau Ceti rather than fields.
* The isomorphism of Layer 5.6 is `TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup`,
  which runs from `π₁` to `FreeGroup (Fin 2)`; the roadmap's direction is its inverse.

Conventions, recorded in `README.md` (§Pinned conventions):

* Multiplication is Mathlib's: `(σ * τ) x = σ (τ x)` in `Equiv.Perm`, and `γ * δ` in
  `FundamentalGroup` is "`δ` first, then `γ`" (`End.mul_def`). The product relation is
  `σinf * σ1 * σ0 = 1`, and the monodromy homomorphism of Layer 5.3 is a genuine
  `MonoidHom` with no `ᵐᵒᵖ`. The `z ↦ z²` example below pins the interpretation.
* Relabeling is the left conjugation `MulAction`; isomorphism is `MulAction.orbitRel`.
* Connectedness of a triple includes `n ≠ 0`; `MulAction.IsPretransitive` alone is
  vacuously true on `Fin 0`.
* Peripheral elements: `P`, `T` are the images of the free generators, `C := (T * P)⁻¹`,
  so `C * T * P = 1`, the same display order as the triple relation. A source writing
  `P·T·C = 1` names a conjugate of this `C`; see README §Pinned conventions.
* Compact-Riemann-surface declarations, Layers 9–11, and the profinite layers have no Lean
  prototypes here. They become successor targets only after their owning roadmaps publish
  compiled carriers.
* The two-open Seifert–van Kampen theorem is general algebraic topology, owned by
  AlgebraicTopology (its Stage 1) and implemented in Tau Ceti as `TauCeti.vanKampenEquiv`; this
  file checks the contract of Layer 5.5 against it and exports no copy.
* The universal cover, the associated cover of a `π₁`-set, deck groups and the subgroup half of
  the covering classification are Tau Ceti declarations from the completed UniversalCovers
  roadmap, and semilocal simple connectivity is Tau Ceti's
  `TauCeti.SemilocallySimplyConnectedSpace`.
* The profinite integers as a ring, profinite exponentiation, and continuous outer
  automorphisms are generic group theory owned by `ProfiniteArithmetic`, not by Belyi maps.
  Free profinite and free pro-`p` groups and the maximal pro-`p` quotient are Tau Ceti's
  implementations of `ProfiniteProPGroups`.
-/

open scoped Manifold ContDiff Topology Pointwise

/- ⚠ Auto-implicits are off. This file is a set of exact signatures, and with them on a
Mathlib name that has been renamed at the pin is silently bound as a fresh variable rather
than reported. -/
set_option autoImplicit false

open TauCeti

namespace TauCetiRoadmap.BelyiMaps

universe u v

/-! ## Layer 0: permutation triples

The carrier is `TauCeti.PermutationTriple`, with the pinned relation as its field
`product_eq_one`, the constructor `TauCeti.PermutationTriple.ofTwo`, extensionality on the first
two components `TauCeti.PermutationTriple.ext_of_two`, and the bijection with pairs
`TauCeti.PermutationTriple.equivPair` carrying the computable `Fintype` and `DecidableEq`
instances. -/

section Layer0

variable {n : ℕ}

/-- **Layer 0.1.** The pinned relation, `σinf * σ1 * σ0 = 1` in Mathlib's multiplication. -/
example (t : PermutationTriple n) : t.σinf * t.σ1 * t.σ0 = 1 := t.product_eq_one

/-- **Layer 0.1.** `σinf` is determined by the other two components:
`TauCeti.PermutationTriple.σinf_eq_inv`. -/
theorem PermutationTriple.σinf_eq (t : PermutationTriple n) : t.σinf = (t.σ1 * t.σ0)⁻¹ :=
  t.σinf_eq_inv

/-- **Layer 0.1, the opposite-convention translation.** Componentwise inversion is the
bijection with triples for the rival relation `σ0 * σ1 * σinf = 1`:
`TauCeti.PermutationTriple.equivOppositeConvention`. -/
theorem PermutationTriple.inv_components_reverse (t : PermutationTriple n) :
    t.σ0⁻¹ * t.σ1⁻¹ * t.σinf⁻¹ = 1 :=
  (PermutationTriple.equivOppositeConvention n t).2

/-- **Layer 0.1, the convention-pinning example.** The monodromy triple of `z ↦ z²`:
`σ0 = σinf = (0 1)`, `σ1 = 1`. -/
example : (PermutationTriple.ofTwo (Equiv.swap 0 1) 1 : PermutationTriple 2).σinf =
    Equiv.swap 0 1 := by
  simp

/-! ### The LMFDB translation, machine-checked

The frozen LMFDB record `3T2-3_2.1_2.1-a` (retained in the private provenance ledger) stores the
triple `(1,2,3)`, `(2,3)`, `(1,2)`, which `0`-indexed is `finRotate 3`, `swap 1 2`, `swap 0 1`.
Because the database composes permutations left to right, that stored triple satisfies the
**opposite** relation in Mathlib's multiplication, and its componentwise inverse, the
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

/-- The frozen record as a `TauCeti.PermutationTriple` in this roadmap's convention. -/
def lmfdb3T2 : PermutationTriple 3 :=
  ⟨(finRotate 3)⁻¹, Equiv.swap 1 2, Equiv.swap 0 1, by decide⟩

/-! ### Layer 0.2: relabeling

Simultaneous conjugation is Tau Ceti's `MulAction (Equiv.Perm (Fin n)) (PermutationTriple n)`,
isomorphism is `TauCeti.PermutationTriple.Equivalent`, and the classes are
`TauCeti.PermutationTriple.IsoClass`. -/

/-- **Layer 0.2.** Relabeling conjugates each component. -/
example (τ : Equiv.Perm (Fin n)) (t : PermutationTriple n) :
    (τ • t).σ0 = τ * t.σ0 * τ⁻¹ := t.smul_σ0 τ

/-- **Layer 0.2.** Isomorphism of triples is simultaneous conjugacy:
`TauCeti.PermutationTriple.equivalent_iff_exists_smul_eq`. -/
example (t t' : PermutationTriple n) :
    t.Equivalent t' ↔ ∃ τ : Equiv.Perm (Fin n), τ • t = t' :=
  PermutationTriple.equivalent_iff_exists_smul_eq

/-! ### Layers 0.3, 0.4: monodromy, connectedness, automorphisms -/

/-- **Layer 0.3.** The monodromy group is generated by the first two components. -/
example (t : PermutationTriple n) : t.monodromyGroup = Subgroup.closure {t.σ0, t.σ1} := rfl

/-- **Layer 0.4.** Connectedness, with the `n ≠ 0` clause in the definition. -/
example (t : PermutationTriple n) :
    t.IsConnected ↔ n ≠ 0 ∧ MulAction.IsPretransitive t.monodromyGroup (Fin n) :=
  PermutationTriple.isConnected_iff

/-- **Layer 0.2, 0.4.** Connectedness is invariant under relabeling:
`TauCeti.PermutationTriple.isConnected_smul_iff`. -/
theorem PermutationTriple.isConnected_smul (τ : Equiv.Perm (Fin n)) {t : PermutationTriple n}
    (ht : t.IsConnected) : (τ • t).IsConnected :=
  (TauCeti.PermutationTriple.isConnected_smul_iff τ t).2 ht

/-- **Layer 3.1.** Connectedness, computably: every monodromy orbit, computed by closing a
singleton under the generators, is everything. This is the iff behind Tau Ceti's `Decidable`
instance, `TauCeti.PermutationTriple.isConnected_iff_forall_monodromyOrbitFinset_eq_univ`. -/
theorem PermutationTriple.isConnected_iff_forall_monodromyOrbitFinset (t : PermutationTriple n) :
    t.IsConnected ↔ n ≠ 0 ∧ ∀ i, t.monodromyOrbitFinset i = Finset.univ :=
  t.isConnected_iff_forall_monodromyOrbitFinset_eq_univ

/-- **Layer 0.4.** The automorphism group is the stabilizer under relabeling. -/
example (t : PermutationTriple n) :
    t.automorphismGroup = MulAction.stabilizer (Equiv.Perm (Fin n)) t := rfl

/-- **Layer 0.4.** The automorphism group is the centralizer of the monodromy group:
`TauCeti.PermutationTriple.automorphismGroup_eq_centralizer_monodromyGroup`. -/
theorem PermutationTriple.automorphismGroup_eq_centralizer (t : PermutationTriple n) :
    t.automorphismGroup = Subgroup.centralizer (t.monodromyGroup : Set (Equiv.Perm (Fin n))) :=
  t.automorphismGroup_eq_centralizer_monodromyGroup

/-- **Layer 0.4.** For connected triples the automorphism group's order divides `n`:
`TauCeti.PermutationTriple.card_automorphismGroup_dvd`. -/
theorem PermutationTriple.card_automorphismGroup_dvd (t : PermutationTriple n)
    (ht : t.IsConnected) : Nat.card t.automorphismGroup ∣ n :=
  t.card_automorphismGroup_dvd ht.isPretransitive

/-- **Layer 0.4, 0.2.** Relabeling conjugates the automorphism group:
`TauCeti.PermutationTriple.automorphismGroup_smul`. -/
theorem PermutationTriple.automorphismGroup_smul (τ : Equiv.Perm (Fin n))
    (t : PermutationTriple n) :
    (τ • t).automorphismGroup = t.automorphismGroup.map (MulAut.conj τ).toMonoidHom :=
  TauCeti.PermutationTriple.automorphismGroup_smul τ t

/-! ### Layer 0.5: cycle data

Cycle counts are `TauCeti.orbitCount`, fixed points included, and the partitions are
`Equiv.Perm.fullCycleType`. -/

/-- **Layer 0.5.** The cycle count, fixed points included, is the number of parts of the full
cycle type: `Equiv.Perm.orbitCount_eq_card_parts_partition`. -/
theorem orbitCount_eq_card_fullCycleType {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) : orbitCount σ = Multiset.card σ.fullCycleType :=
  Equiv.Perm.orbitCount_eq_card_parts_partition σ

/-- **Layer 0.5.** The full cycle type is a partition of the degree:
`Equiv.Perm.sum_fullCycleType`. -/
theorem fullCycleType_sum {α : Type u} [Fintype α] [DecidableEq α] (σ : Equiv.Perm α) :
    σ.fullCycleType.sum = Fintype.card α :=
  Equiv.Perm.sum_fullCycleType σ

/-- **Layer 0.5, the transposition step lemma.** Multiplying by a transposition splits a
cycle or merges two: `TauCeti.orbitCount_swap_mul_of_sameCycle` and
`TauCeti.orbitCount_swap_mul_add_one_of_not_sameCycle`. -/
theorem orbitCount_swap_mul {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) {i j : α} (hij : i ≠ j) :
    orbitCount (Equiv.swap i j * σ) =
      if σ.SameCycle i j then orbitCount σ + 1 else orbitCount σ - 1 := by
  split_ifs with h
  · exact orbitCount_swap_mul_of_sameCycle hij h
  · have := orbitCount_swap_mul_add_one_of_not_sameCycle (σ := σ) h
    omega

/-- **Layer 0.5, the sign identity**: `Equiv.Perm.sign_eq_neg_one_pow_card_sub_orbitCount`. -/
theorem sign_eq_pow_sub_orbitCount {α : Type u} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) :
    Equiv.Perm.sign σ = (-1 : ℤˣ) ^ (Fintype.card α - orbitCount σ) :=
  Equiv.Perm.sign_eq_neg_one_pow_card_sub_orbitCount σ

/-- **Layer 3.1, the comparison theorem.** The executable decomposition agrees with the
abstract one: `Equiv.Perm.computedCycleType_eq_fullCycleType`. -/
theorem computedCycleType_eq_fullCycleType (σ : Equiv.Perm (Fin n)) :
    σ.computedCycleType = σ.fullCycleType :=
  Equiv.Perm.computedCycleType_eq_fullCycleType σ

/-! ### Layer 0.6: Euler characteristic and genus -/

/-- **Layer 0.6.** The Euler characteristic, in `ℤ`. -/
example (t : PermutationTriple n) :
    t.eulerChar = orbitCount t.σ0 + orbitCount t.σ1 + orbitCount t.σinf - n := rfl

/-- **Layer 0.6 (parity).** For every product-one triple, `2 - χ` is even:
`TauCeti.PermutationTriple.two_dvd_two_sub_eulerChar`. -/
theorem PermutationTriple.even_two_sub_eulerChar (t : PermutationTriple n) :
    Even (2 - t.eulerChar) :=
  even_iff_two_dvd.2 t.two_dvd_two_sub_eulerChar

/-- **Layer 0.6 (the connected bound).** `χ ≤ 2` for connected triples:
`TauCeti.PermutationTriple.IsConnected.eulerChar_le_two`. -/
theorem PermutationTriple.eulerChar_le_two (t : PermutationTriple n) (ht : t.IsConnected) :
    t.eulerChar ≤ 2 :=
  ht.eulerChar_le_two

/-- **Layer 0.6.** The genus, junk-free by `two_sub_two_mul_genus`. -/
example (t : PermutationTriple n) : t.genus = ((2 - t.eulerChar) / 2).toNat := rfl

/-- **Layer 0.6.** `2 - 2g = χ` for connected triples:
`TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus`. -/
theorem PermutationTriple.two_sub_two_mul_genus (t : PermutationTriple n)
    (ht : t.IsConnected) : 2 - 2 * (t.genus : ℤ) = t.eulerChar :=
  ht.two_sub_two_mul_genus

/-! ### Layer 0.7: orders and geometry type -/

/-- **Layer 0.7.** The order triple, the LMFDB's `abc` datum. -/
example (t : PermutationTriple n) :
    t.orderTriple = (orderOf t.σ0, orderOf t.σ1, orderOf t.σinf) := rfl

/-- **Layer 0.7.** Spherical exactly when `1/a + 1/b + 1/c > 1`, compared in `ℚ`:
`TauCeti.PermutationTriple.geometryType_eq_spherical_iff`. -/
theorem PermutationTriple.geometryType_eq_spherical_iff (t : PermutationTriple n) :
    t.geometryType = .spherical ↔
      1 < ((orderOf t.σ0 : ℚ)⁻¹ + (orderOf t.σ1 : ℚ)⁻¹ + (orderOf t.σinf : ℚ)⁻¹) :=
  TauCeti.PermutationTriple.geometryType_eq_spherical_iff t

/-- **Layer 0.7.** Euclidean exactly when `1/a + 1/b + 1/c = 1`:
`TauCeti.PermutationTriple.geometryType_eq_euclidean_iff`. -/
theorem PermutationTriple.geometryType_eq_euclidean_iff (t : PermutationTriple n) :
    t.geometryType = .euclidean ↔
      (orderOf t.σ0 : ℚ)⁻¹ + (orderOf t.σ1 : ℚ)⁻¹ + (orderOf t.σinf : ℚ)⁻¹ = 1 :=
  TauCeti.PermutationTriple.geometryType_eq_euclidean_iff t

/-! ### Layer 0.8: the example suite

`TauCeti.PermutationTriple.cyclicTriple`, `chebyshevTriple`, `torusTriple` and `s3Triple`, each
with its invariants proved in `TauCeti/Combinatorics/PermutationTriple/Examples.lean`. -/

/-- **Layer 0.8.** The cyclic triple is connected in every positive degree:
`TauCeti.PermutationTriple.isConnected_cyclicTriple_iff`. -/
theorem PermutationTriple.cyclicTriple_isConnected (n : ℕ) (hn : n ≠ 0) :
    (PermutationTriple.cyclicTriple n).IsConnected :=
  PermutationTriple.isConnected_cyclicTriple_iff.2 hn

example : PermutationTriple.torusTriple.σinf = (finRotate 4 ^ 2)⁻¹ := rfl

end Layer0

/-! ### Layer 2.6: the branch-point action

All six reindexings of `(0, 1, ∞)` are Tau Ceti's: `TauCeti.PermutationTriple.swap01`,
`swap1Inf`, `swap0Inf`, `rot` and `rotInv`, with `reindexBranchPoints` attaching one to each
permutation of `Fin 3`. Tau Ceti defines `swap0Inf`, `rot` and `rotInv` as the composites, so
the composite identities hold by definition and the content is in the component formulas.

The operation named after a permutation `ρ` of `{0, 1, ∞}` is the one whose `σ_i` is the old
`σ_{ρ i}` up to conjugacy; reindexing is contravariant, so the six operations form a **right**
`S₃`-action (README, Layer 2.6), which Tau Ceti packages as the action of `(Perm (Fin 3))ᵐᵒᵖ` on
`TauCeti.PermutationTriple.IsoClass n`. -/

section BranchPoints

open TauCeti.PermutationTriple (swap01 swap1Inf swap0Inf rot rotInv s3Triple)

variable {n : ℕ}

/-- **Layer 2.6.** `swap01 (a, b, c) = (b, a, b⁻¹ · c · b)`. -/
example (t : PermutationTriple n) :
    (swap01 t).σ0 = t.σ1 ∧ (swap01 t).σ1 = t.σ0 ∧ (swap01 t).σinf = t.σ1⁻¹ * t.σinf * t.σ1 :=
  ⟨rfl, rfl, rfl⟩

/-- **Layer 2.6.** `swap1Inf (a, b, c) = (a, b⁻¹ · c · b, b)`. -/
example (t : PermutationTriple n) :
    (swap1Inf t).σ0 = t.σ0 ∧ (swap1Inf t).σ1 = t.σ1⁻¹ * t.σinf * t.σ1 ∧ (swap1Inf t).σinf = t.σ1 :=
  ⟨rfl, rfl, rfl⟩

/-- **Layer 2.6.** `swap0Inf` is `swap01 ∘ swap1Inf ∘ swap01`, and it is `(c, b, b · a · b⁻¹)`:
`TauCeti.PermutationTriple.swap0Inf_σ0` and `swap0Inf_σinf`. -/
theorem swap0Inf_eq (t : PermutationTriple n) :
    swap0Inf t = swap01 (swap1Inf (swap01 t)) ∧ (swap0Inf t).σ0 = t.σinf ∧
      (swap0Inf t).σ1 = t.σ1 ∧ (swap0Inf t).σinf = t.σ1 * t.σ0 * t.σ1⁻¹ :=
  ⟨rfl, t.swap0Inf_σ0, t.swap0Inf_σ1, t.swap0Inf_σinf⟩

/-- **Layer 2.6.** `rot` is `swap1Inf ∘ swap01`, and it is the rotation `(a, b, c) ↦ (b, c, a)`
with no conjugator: `TauCeti.PermutationTriple.rot_σ0`, `rot_σ1`, `rot_σinf`. -/
theorem rot_eq (t : PermutationTriple n) :
    rot t = swap1Inf (swap01 t) ∧ (rot t).σ0 = t.σ1 ∧ (rot t).σ1 = t.σinf ∧ (rot t).σinf = t.σ0 :=
  ⟨rfl, t.rot_σ0, t.rot_σ1, t.rot_σinf⟩

/-- **Layer 2.6.** `rotInv` is `swap01 ∘ swap1Inf`, and it is
`(b⁻¹ · c · b, a, a · b · a⁻¹)`: `TauCeti.PermutationTriple.rotInv_σ0`, `rotInv_σ1`,
`rotInv_σinf`. -/
theorem rotInv_eq (t : PermutationTriple n) :
    rotInv t = swap01 (swap1Inf t) ∧ (rotInv t).σ0 = t.σ1⁻¹ * t.σinf * t.σ1 ∧
      (rotInv t).σ1 = t.σ0 ∧ (rotInv t).σinf = t.σ0 * t.σ1 * t.σ0⁻¹ :=
  ⟨rfl, t.rotInv_σ0, t.rotInv_σ1, t.rotInv_σinf⟩

/-- **Layer 2.6, the Coxeter relation `(st)³ = 1`, on the nose:**
`TauCeti.PermutationTriple.rot_rot_rot`. -/
theorem rot_rot_rot (t : PermutationTriple n) : rot (rot (rot t)) = t :=
  t.rot_rot_rot

/-- **Layer 2.6.** `rotInv ∘ rot` is simultaneous conjugation by **`σ1`**, not the identity:
`TauCeti.PermutationTriple.rotInv_rot`. -/
theorem rotInv_rot (t : PermutationTriple n) : rotInv (rot t) = t.σ1 • t :=
  t.rotInv_rot

/-- **Layer 2.6, the order witness.** `rot` is `swap1Inf ∘ swap01`, not `swap01 ∘ swap1Inf`. -/
example : rot s3Triple ≠ swap01 (swap1Inf s3Triple) := by decide

/-- **Layer 2.6, the witness for `rotInv_rot`.** -/
example : rotInv (rot s3Triple) ≠ s3Triple := by decide

/-- **Layer 2.6, the counterexample.** The naive color swap `(a,b,c) ↦ (b,a,a⁻¹ca)` does
**not** preserve the relation: on `s3Triple` the would-be product is not `1`. -/
example :
    ¬ ((s3Triple.σ0⁻¹ * s3Triple.σinf * s3Triple.σ0) * s3Triple.σ0 * s3Triple.σ1 = 1) := by
  decide

/-- **Layer 2.6.** `swap01` is an involution on triples, on the nose:
`TauCeti.PermutationTriple.swap01_swap01`. -/
theorem swap01_involutive (t : PermutationTriple n) : swap01 (swap01 t) = t :=
  t.swap01_swap01

/-- **Layer 2.6.** `swap1Inf` squared is simultaneous conjugation by **`σ0`**, not the
identity: `TauCeti.PermutationTriple.swap1Inf_swap1Inf`.

The computation is forced by the pinned relation. Writing `t = (a, b, c)` with `c * b * a = 1`,
one application gives `(a, b⁻¹ * c * b, b)` and a second gives
`(a, b⁻¹ * c⁻¹ * b * c * b, b⁻¹ * c * b)`; since `a = (c * b)⁻¹ = b⁻¹ * c⁻¹`, those last two
entries are exactly `a * b * a⁻¹` and `a * c * a⁻¹`. -/
theorem swap1Inf_sq (t : PermutationTriple n) : swap1Inf (swap1Inf t) = t.σ0 • t :=
  t.swap1Inf_swap1Inf

/-- **Layer 2.6, the witness that fixes the conjugator.** `σ0` is not interchangeable with
the two conjugators one might guess instead. -/
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
    (σ : Equiv.Perm α) {k : ℕ} (hk : Nat.Coprime k (orderOf σ)) :
    (σ ^ k).fullCycleType = σ.fullCycleType := by
  sorry
-/

/-- ...and it does not change the generated subgroup, which is why the monodromy group is a
Galois invariant. -/
theorem closure_pow_eq (t : PermutationTriple n) {k : ℕ}
    (hk : Nat.Coprime k (Monoid.exponent t.monodromyGroup)) :
    Subgroup.closure {t.σ0 ^ k, t.σ1 ^ k} = t.monodromyGroup := by
  sorry

/-- **Layer 2.6.** The Coxeter braid relation, on isomorphism classes:
`(swap01 ∘ swap1Inf)³` is `rotInv³`, the identity by
`TauCeti.PermutationTriple.rotInv_rotInv_rotInv`. -/
theorem braid_on_isoClass (t : PermutationTriple n) :
    (swap01 (swap1Inf (swap01 (swap1Inf (swap01 (swap1Inf t)))))).Equivalent t := by
  rw [show swap01 (swap1Inf (swap01 (swap1Inf (swap01 (swap1Inf t))))) =
    rotInv (rotInv (rotInv t)) from rfl, t.rotInv_rotInv_rotInv]
  exact PermutationTriple.equivalent_iff_exists_smul_eq.2 ⟨1, one_smul _ t⟩

/-- **Layer 2.6.** The branch-point operations preserve connectedness:
`TauCeti.PermutationTriple.isConnected_swap01_iff` and `isConnected_swap1Inf_iff`. -/
theorem isConnected_swap01 {t : PermutationTriple n} (ht : t.IsConnected) :
    (swap01 t).IsConnected :=
  (t.isConnected_swap01_iff).2 ht

theorem isConnected_swap1Inf {t : PermutationTriple n} (ht : t.IsConnected) :
    (swap1Inf t).IsConnected :=
  (t.isConnected_swap1Inf_iff).2 ht

/-- **Layer 2.6.** On connected triples the operations are
`TauCeti.ConnectedTriple.reindexBranchPoints`; the transposition `(0 1)` gives `swap01`
(`TauCeti.PermutationTriple.reindexBranchPoints_swap_zero_one`). -/
example (t : ConnectedTriple n) :
    ((t.reindexBranchPoints (Equiv.swap 0 1) : ConnectedTriple n) : PermutationTriple n) =
      swap01 (t : PermutationTriple n) :=
  (t : PermutationTriple n).reindexBranchPoints_swap_zero_one

/-- ...and the transposition `(1 ∞)` gives `swap1Inf`
(`TauCeti.PermutationTriple.reindexBranchPoints_swap_one_two`). -/
example (t : ConnectedTriple n) :
    ((t.reindexBranchPoints (Equiv.swap 1 2) : ConnectedTriple n) : PermutationTriple n) =
      swap1Inf (t : PermutationTriple n) :=
  (t : PermutationTriple n).reindexBranchPoints_swap_one_two

end BranchPoints

/-! ## Layer 1: passports

⚠ Passports are attached to **connected** triples only (README, Layer 1.1). The carrier is
`TauCeti.ConnectedTriple`, and passports are `TauCeti.PassportSpec`, with membership
`TauCeti.PassportSpec.HasPassport`, classes `TauCeti.PassportSpec.classSet` and size
`TauCeti.PassportSpec.passportSize`. -/

section Passports

variable {n : ℕ}

/-- **Layer 1.1.** The connected-triple carrier. -/
example : ConnectedTriple n = {t : PermutationTriple n // t.IsConnected} := rfl

/-- **Layer 1.1.** Admissibility: nonzero degree, transitive reference, three partitions of `n`
into positive parts. -/
example (P : PassportSpec n) :
    P.IsAdmissible ↔ n ≠ 0 ∧ MulAction.IsPretransitive P.G (Fin n) ∧
      (P.lam0.sum = n ∧ ∀ i ∈ P.lam0, 0 < i) ∧ (P.lam1.sum = n ∧ ∀ i ∈ P.lam1, 0 < i) ∧
        (P.laminf.sum = n ∧ ∀ i ∈ P.laminf, 0 < i) :=
  Iff.rfl

/-- **Layer 1.1.** Passport membership: conjugate monodromy and equal cycle data. Tau Ceti's cycle
data is the computed cycle type, equal to `fullCycleType` by
`Equiv.Perm.computedCycleType_eq_fullCycleType`. -/
example (t : ConnectedTriple n) (P : PassportSpec n) :
    P.HasPassport t ↔
      (∃ τ : Equiv.Perm (Fin n),
          (t.1.monodromyGroup).map (MulAut.conj τ).toMonoidHom = P.G) ∧
        t.1.cycleData.1 = P.lam0 ∧ t.1.cycleData.2.1 = P.lam1 ∧ t.1.cycleData.2.2 = P.laminf :=
  Iff.rfl

/-- **Layer 1.5.** `passportOf` lands in admissible specifications:
`TauCeti.ConnectedTriple.isAdmissible_passportOf`. -/
theorem isAdmissible_passportOf (t : ConnectedTriple n) : t.passportOf.IsAdmissible :=
  t.isAdmissible_passportOf

/-- **Layer 1.5.** A connected triple has its own passport:
`TauCeti.ConnectedTriple.hasPassport_passportOf`. -/
theorem hasPassport_passportOf (t : ConnectedTriple n) : PassportSpec.HasPassport t t.passportOf :=
  t.hasPassport_passportOf

/-- **Layer 1.4.** Primitivity of the monodromy action, Mathlib's notion. -/
example (t : PermutationTriple n) :
    t.IsPrimitive ↔ MulAction.IsPreprimitive t.monodromyGroup (Fin n) :=
  PermutationTriple.isPrimitive_iff t

/-- **Layer 1.6.** The stable part of a passport label, its degree, `nTj` group and three
partitions, is `TauCeti.PassportLabel`, and its semantics is `TauCeti.PassportSpec.HasLabel`
through PolynomialGaloisGroups' `TauCeti.TransitiveGroupLabel`. Tau Ceti's reference data stops
at degree five (`TauCeti.numTransitiveGroups`); degrees six to eleven remain. -/
example (P : PassportSpec n) (L : PassportLabel n) :
    P.HasLabel L ↔
      TransitiveGroupLabel L.group P.G ∧ P.lam0 = L.lam0 ∧ P.lam1 = L.lam1 ∧
        P.laminf = L.laminf :=
  Iff.rfl

end Passports

/-! ### Layer 3.1: the executable enumeration -/

section Enumeration

variable {n : ℕ}

/-- **Layer 3.1.** The invariants computably, each agreeing with its Layer 0 definition:
`TauCeti.PermutationTriple.computedEulerChar_eq`, `computedGenus_eq`, `computedOrderTriple_eq`,
`computedGeometryType_eq`. -/
theorem computedInvariants_eq (t : PermutationTriple n) :
    t.computedEulerChar = t.eulerChar ∧ t.computedGenus = t.genus ∧
      t.computedOrderTriple = t.orderTriple ∧ t.computedGeometryType = t.geometryType :=
  ⟨t.computedEulerChar_eq, t.computedGenus_eq, t.computedOrderTriple_eq,
    t.computedGeometryType_eq⟩

/-- **Layer 3.1.** The monodromy group as a `Finset`:
`TauCeti.PermutationTriple.mem_monodromyFinset`. -/
theorem mem_monodromyFinset (t : PermutationTriple n) (g : Equiv.Perm (Fin n)) :
    g ∈ t.monodromyFinset ↔ g ∈ t.monodromyGroup :=
  t.mem_monodromyFinset

/-- **Layer 3.1.** Blockhood, computably, quantifying over the whole monodromy group:
`TauCeti.PermutationTriple.isBlockBool_eq_true_iff`. -/
theorem isBlockBool_eq_true_iff (t : PermutationTriple n) (B : Finset (Fin n)) :
    t.isBlockBool B = true ↔ MulAction.IsBlock t.monodromyGroup (B : Set (Fin n)) :=
  t.isBlockBool_eq_true_iff B

/-- **Layer 3.1.** Primitivity, computably:
`TauCeti.PermutationTriple.isPrimitiveBool_eq_true_iff`. -/
theorem isPrimitiveBool_eq_true_iff (t : PermutationTriple n) :
    t.isPrimitiveBool = true ↔ t.IsPrimitive :=
  t.isPrimitiveBool_eq_true_iff

/-- **Layer 3.1, the acceptance checks for primitivity.** `torusTriple` is imprimitive,
`s3Triple` primitive, and the degree-one triple primitive:
`TauCeti.PermutationTriple.isPrimitiveBool_torusTriple` and its companions. The obvious wrong
implementation, closing `{i, j}` under the two generators, is `true` on every connected triple,
and `torusTriple` separates it from this one. -/
example : PermutationTriple.torusTriple.isBlockBool {0, 2} = true := by decide

example : PermutationTriple.torusTriple.isPrimitiveBool = false ∧
    PermutationTriple.s3Triple.isPrimitiveBool = true ∧
    (PermutationTriple.cyclicTriple 1).isPrimitiveBool = true :=
  ⟨PermutationTriple.isPrimitiveBool_torusTriple, PermutationTriple.isPrimitiveBool_s3Triple,
    PermutationTriple.isPrimitiveBool_cyclicTriple_one⟩

/-- **Layer 3.1.** The `Finset` of connected triples of degree `n`:
`TauCeti.mem_connectedTriples`. -/
theorem mem_connectedTriples (t : PermutationTriple n) :
    t ∈ connectedTriples n ↔ t.IsConnected :=
  TauCeti.mem_connectedTriples

/-- **Layer 3.1, soundness.** The isomorphism classes of connected triples as the `Finset` of
relabeling orbits; each connected triple lies in exactly one: `TauCeti.existsUnique_mem_isoClasses`.
⚠ Orbits, not chosen representatives. -/
theorem isoClasses_spec (t : ConnectedTriple n) : ∃! c, c ∈ isoClasses n ∧ t ∈ c :=
  existsUnique_mem_isoClasses t

/-- **Layer 3.1.** The enumerated classes are exactly the isomorphism classes:
`TauCeti.card_isoClasses`. -/
theorem card_isoClasses_eq : (isoClasses n).card = Fintype.card (ConnectedIsoClass n) :=
  card_isoClasses

/-- **Layer 3.1, the passport fiber.** The classes with prescribed cycle data and monodromy group
conjugate to a `Finset` presentation `G` of the reference subgroup, counted:
`TauCeti.card_passportClasses`. ⚠ The group is compared **up to conjugacy in `S_n`**. -/
theorem card_passportClasses_eq (P : PassportSpec n) (G : Finset (Equiv.Perm (Fin n)))
    (hG : ∃ ρ, (G : Set (Equiv.Perm (Fin n))) = (P.conjugate ρ).G) :
    (passportClasses G P.lam0 P.lam1 P.laminf).card = P.passportSize :=
  card_passportClasses P G hG

/-! **Layer 3.1, the executable acceptance checks**, proved by kernel computation in Tau Ceti:
`1, 3, 7` classes in degrees one to three (`TauCeti.ConnectedIsoClass.card_three` and its
companions). -/

example : Fintype.card (ConnectedIsoClass 1) = 1 ∧ Fintype.card (ConnectedIsoClass 2) = 3 ∧
    Fintype.card (ConnectedIsoClass 3) = 7 :=
  ⟨ConnectedIsoClass.card_one, ConnectedIsoClass.card_two, ConnectedIsoClass.card_three⟩

/-! ### Layer 3.5: the small complete tables -/

/-- **Layer 3.1.** The end-to-end run from the enumeration to one passport fiber, by kernel
computation: the `S₃` passport in degree three has one class,
`TauCeti.card_passportClasses_symmetric_three`. -/
example : (passportClasses Finset.univ {3} {2, 1} {2, 1} : Finset (Finset (ConnectedTriple 3))).card =
    1 :=
  card_passportClasses_symmetric_three

/-- **Layer 3.5.** There are `26` connected classes in degree four. Tau Ceti proves this as
`TauCeti.ConnectedIsoClass.card_four`, in a version newer than the pinned dependency. -/
theorem card_connectedIsoClass_four : Fintype.card (ConnectedIsoClass 4) = 26 := by
  sorry

/-- **Layer 3.5.** Every ordered passport that occurs in degree at most four has exactly one class.
Tau Ceti proves this as `TauCeti.PassportSpec.passportSize_eq_one_iff_of_degree_le_four`, in a
version newer than the pinned dependency. -/
theorem passportSize_eq_one_of_degree_le_four (hn : n ≤ 4) (P : PassportSpec n)
    (hP : 0 < P.passportSize) : P.passportSize = 1 := by
  sorry

/-- **Layer 3.5.** The first passport with several classes: in degree five, monodromy `C₅` and
cycle partitions `([5], [5], [5])`, of size three:
`TauCeti.PassportSpec.passportSize_cyclicTotallyRamified_five`. -/
theorem passportSize_cyclic_five : (PassportSpec.cyclicTotallyRamified 5).passportSize = 3 :=
  PassportSpec.passportSize_cyclicTotallyRamified_five

end Enumeration

/-! ## Layer 2: dessins as bipartite ribbon graphs

The carrier is `TauCeti.BipartiteRibbonGraph`: abstract edges, two vertex types, incidences, and
rotations that are typed cyclic orders, `Equiv.Perm.IsCycleOn` each incidence fiber. -/

section Dessins

/-- **Layer 2.1.** The face permutation, in the pinned display order. -/
example (Γ : BipartiteRibbonGraph.{u}) : Γ.facePerm * Γ.rotW * Γ.rotB = 1 :=
  Γ.facePerm_mul_rotW_mul_rotB

/-- **Layer 2.1.** Connectedness: jointly transitive rotations on a nonempty edge set. -/
example (Γ : BipartiteRibbonGraph.{u}) :
    Γ.IsConnected ↔ Nonempty Γ.E ∧ MulAction.IsPretransitive Γ.rotationGroup Γ.E :=
  Γ.isConnected_def

/-- **Layer 2.1.** The Euler characteristic: vertices minus edges plus faces. -/
example (Γ : BipartiteRibbonGraph.{u}) :
    Γ.eulerChar = Fintype.card Γ.B + Fintype.card Γ.W + Γ.faceCount - Fintype.card Γ.E :=
  Γ.eulerChar_def

/-- **Layer 2.3.** The triple of a dessin, along a numbering of the edges. -/
example (Γ : BipartiteRibbonGraph.{u}) {n : ℕ} (ν : Γ.E ≃ Fin n) :
    Γ.toPermutationTriple ν =
      PermutationTriple.ofTwo (ν.permCongr Γ.rotB) (ν.permCongr Γ.rotW) :=
  rfl

/-- **Layer 2.2.** The dessin of a triple, `TauCeti.PermutationTriple.ribbonGraph`: edges `Fin n`,
vertices the cycles of `σ0` and `σ1`. It is connected exactly when the triple is
(`TauCeti.PermutationTriple.isConnected_ribbonGraph`), and its Euler characteristic is the
triple's (`TauCeti.PermutationTriple.eulerChar_ribbonGraph`). -/
theorem ribbonGraph_spec {n : ℕ} (t : PermutationTriple n) :
    t.ribbonGraph.rotB = t.σ0 ∧ t.ribbonGraph.rotW = t.σ1 ∧
      (t.ribbonGraph.IsConnected ↔ t.IsConnected) ∧ t.ribbonGraph.eulerChar = t.eulerChar :=
  ⟨rfl, rfl, t.isConnected_ribbonGraph, t.eulerChar_ribbonGraph⟩

end Dessins

/-! ## Layer 3: enumeration and counting -/

/-- **Layer 3.2 (the inverse-class involution).** Tau Ceti's `InvolutiveInv (ConjClasses G)`, with
`ConjClasses.inv_mk`. -/
theorem conjClasses_inv_mk {G : Type u} [Group G] (g : G) :
    (ConjClasses.mk g)⁻¹ = ConjClasses.mk g⁻¹ :=
  ConjClasses.inv_mk g

/-! ## Layer 4: triangle groups

`TauCeti.TriangleGroup a b c` is the presented group on `x, y, z` with relators `x ^ a`,
`y ^ b`, `z ^ c` and `z * y * x`, the product relator in the pinned display order. -/

section TriangleGroups

/-- **Layer 4.1.** The relators, in the pinned display order. -/
example (a b c : ℕ) :
    triangleRelators a b c =
      {FreeGroup.of 0 ^ a, FreeGroup.of 1 ^ b, FreeGroup.of 2 ^ c,
        FreeGroup.of 2 * FreeGroup.of 1 * FreeGroup.of 0} :=
  rfl

/-- **Layer 4.1.** The product relation: `TauCeti.TriangleGroup.z_mul_y_mul_x`. -/
theorem TriangleGroup.z_mul_y_mul_x (a b c : ℕ) :
    TauCeti.TriangleGroup.z a b c * TauCeti.TriangleGroup.y a b c *
      TauCeti.TriangleGroup.x a b c = 1 :=
  TauCeti.TriangleGroup.z_mul_y_mul_x a b c

/-- **Layer 4.1.** `TauCeti.TriangleGroup.x_pow`. -/
theorem TriangleGroup.x_pow (a b c : ℕ) : TauCeti.TriangleGroup.x a b c ^ a = 1 :=
  TauCeti.TriangleGroup.x_pow a b c

/-- **Layer 4.2.** A triple with component orders dividing `(a, b, c)` is a permutation
representation of the triangle group, `TauCeti.TriangleGroup.toPerm`, with range the monodromy
group (`TauCeti.TriangleGroup.range_toPerm`). -/
theorem TriangleGroup.range_toPerm {a b c n : ℕ} (t : PermutationTriple n)
    (ha : t.σ0 ^ a = 1) (hb : t.σ1 ^ b = 1) (hc : t.σinf ^ c = 1) :
    (TauCeti.TriangleGroup.toPerm t ha hb hc).range = t.monodromyGroup :=
  TauCeti.TriangleGroup.range_toPerm t ha hb hc

end TriangleGroups

/-! ## Layer 5: the thrice-punctured sphere

The base is `TauCeti.ThricePuncturedSphere`, the subtype `{z : ℂ // z ≠ 0 ∧ z ≠ 1}`, with
basepoint `TauCeti.ThricePuncturedSphere.basePt = 1/2`. -/

namespace ThricePuncturedSphere

open TauCeti.ThricePuncturedSphere

/-- **Layer 5.1.** The affine model of `ℙ¹(ℂ) ∖ {0, 1, ∞}`. -/
example : TauCeti.ThricePuncturedSphere = {z : ℂ // z ≠ 0 ∧ z ≠ 1} := rfl

/-- **Layer 5.1.** The pinned basepoint `1/2`. -/
example : (basePt : ℂ) = 1 / 2 := rfl

/-- **Layer 5.2.** The peripheral loop around `0` is the counterclockwise circle
`t ↦ (1/2)·exp(2πit)`: `TauCeti.ThricePuncturedSphere.coe_γ0_eq_exp`. -/
theorem γ0_apply (t : unitInterval) :
    (γ0 t : ℂ) = 1 / 2 * Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)) :=
  coe_γ0_eq_exp t

/-- **Layer 5.2.** The peripheral loop around `1` is `t ↦ 1 − (1/2)·exp(2πit)`:
`TauCeti.ThricePuncturedSphere.coe_γ1_eq_exp`. -/
theorem γ1_apply (t : unitInterval) :
    (γ1 t : ℂ) = 1 - 1 / 2 * Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)) :=
  coe_γ1_eq_exp t

/-- **Layer 5.2.** The peripheral elements, with `periphInf` defined so that the pinned relation
holds. -/
example : periph0 = FundamentalGroup.fromPath ⟦γ0⟧ ∧ periph1 = FundamentalGroup.fromPath ⟦γ1⟧ ∧
    periphInf = (periph1 * periph0)⁻¹ :=
  ⟨rfl, rfl, rfl⟩

/-- The pinned relation, in the same display order as the triple relation. -/
theorem periphInf_mul_periph1_mul_periph0 : periphInf * periph1 * periph0 = 1 :=
  TauCeti.ThricePuncturedSphere.periphInf_mul_periph1_mul_periph0

/-- **Layer 5.5, the AlgebraicTopology contract.** The two-open Seifert–van Kampen theorem with a
simply connected intersection is Tau Ceti's `TauCeti.vanKampenEquiv`, whose underlying
homomorphism is the canonical map `TauCeti.vanKampenLift` from the free product
(`TauCeti.vanKampenEquiv_toMonoidHom`). Its cover hypothesis is the weaker
`interior A ∪ interior B = univ`, which open sets covering the space satisfy. This roadmap
exports no copy. -/
example {X : Type u} [TopologicalSpace X] {A B : Set X} {x : X} (hAo : IsOpen A)
    (hBo : IsOpen B) (hAB : A ∪ B = Set.univ) (hA : IsPathConnected A) (hB : IsPathConnected B)
    (hI : IsSimplyConnected (A ∩ B)) (hxA : x ∈ A) (hxB : x ∈ B) :
    ((TauCeti.vanKampenEquiv (by rw [hAo.interior_eq, hBo.interior_eq, hAB]) hA hB hI hxA hxB :
        Monoid.Coprod (FundamentalGroup A ⟨x, hxA⟩) (FundamentalGroup B ⟨x, hxB⟩) ≃*
          FundamentalGroup X x) :
        Monoid.Coprod (FundamentalGroup A ⟨x, hxA⟩) (FundamentalGroup B ⟨x, hxB⟩) →*
          FundamentalGroup X x) =
      TauCeti.vanKampenLift A B x hxA hxB :=
  TauCeti.vanKampenEquiv_toMonoidHom _ _ _ _ _ _

/-- **Layer 5.6.** The fundamental group is free on the two peripheral generators, by van Kampen
applied to the two half-planes: the inverse of
`TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup`. -/
noncomputable def freeGroupEquiv :
    FreeGroup (Fin 2) ≃* FundamentalGroup TauCeti.ThricePuncturedSphere basePt :=
  fundamentalGroupMulEquivFreeGroup.symm

/-- `TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup_symm_of_zero`. -/
theorem freeGroupEquiv_of0 : freeGroupEquiv (FreeGroup.of 0) = periph0 :=
  fundamentalGroupMulEquivFreeGroup_symm_of_zero

/-- `TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup_symm_of_one`. -/
theorem freeGroupEquiv_of1 : freeGroupEquiv (FreeGroup.of 1) = periph1 :=
  fundamentalGroupMulEquivFreeGroup_symm_of_one

/-- **Layer 5.1.** `U` is path-connected: Tau Ceti's instance. -/
example : PathConnectedSpace TauCeti.ThricePuncturedSphere := inferInstance

/-! ### Layer 5.1, 2.6: the anharmonic self-homeomorphisms

The six Möbius transformations permuting `{0, 1, ∞}` are Tau Ceti's: `mob01`, `mob1Inf`,
`mob0Inf`, `mobRot` and `mobRotInv` in `TauCeti.ThricePuncturedSphere`. ⚠ **Only `mob01` fixes
the basepoint** `b = 1/2`: the orbit of `b` under the anharmonic group is `{1/2, 2, −1}`, which
is why the induced `S₃`-action lives on isomorphism classes of covers. -/

/-- **Layer 5.1.** `mob01 : z ↦ 1 − z`. -/
example (z : TauCeti.ThricePuncturedSphere) : (mob01 z : ℂ) = 1 - z := rfl

/-- **Layer 5.1.** `mob1Inf : z ↦ z/(z − 1)`: `TauCeti.ThricePuncturedSphere.coe_mob1Inf`. -/
example (z : TauCeti.ThricePuncturedSphere) : (mob1Inf z : ℂ) = z / (z - 1) := coe_mob1Inf z

/-- **Layer 5.1.** `mob01` fixes the basepoint: `TauCeti.ThricePuncturedSphere.mob01_basePt`. -/
theorem mob01_basePt : mob01 basePt = basePt :=
  TauCeti.ThricePuncturedSphere.mob01_basePt

/-- **Layer 5.2, 2.6, the value pin.** `mob01` carries the peripheral loop at `0` to the
peripheral loop at `1` **on the nose**: `TauCeti.ThricePuncturedSphere.mob01_γ0`. -/
theorem mob01_γ0 (s : unitInterval) : mob01 (γ0 s) = γ1 s :=
  TauCeti.ThricePuncturedSphere.mob01_γ0 s

/-- ...and back: `TauCeti.ThricePuncturedSphere.mob01_γ1`. -/
theorem mob01_γ1 (s : unitInterval) : mob01 (γ1 s) = γ0 s :=
  TauCeti.ThricePuncturedSphere.mob01_γ1 s

end ThricePuncturedSphere

/-! ## Layers 5.4, 6: monodromy -/

/-- **Layer 5.3.** The fiber monodromy, packaged as a `MonoidHom`: Mathlib's
`IsCoveringMap.monodromyPerm`, the permutation representation of
`IsCoveringMap.fundamentalGroupMulAction`. -/
noncomputable def monodromyHom {E : Type u} {X : Type v} [TopologicalSpace E]
    [TopologicalSpace X]
    {p : E → X} (hp : IsCoveringMap p) (x : X) :
    FundamentalGroup X x →* Equiv.Perm (p ⁻¹' {x}) :=
  hp.monodromyPerm x

theorem monodromyHom_apply {E : Type u} {X : Type v} [TopologicalSpace E]
    [TopologicalSpace X]
    {p : E → X} (hp : IsCoveringMap p) (x : X)
    (γ : FundamentalGroup X x) (e : p ⁻¹' {x}) :
    monodromyHom hp x γ e = hp.monodromy (FundamentalGroup.toPath γ) e :=
  rfl
/-! ### Layers 5.7, 6.2–6.5: the UniversalCovers supply

The general associated cover of a discrete `π₁`-set, the deck group of the universal cover, and
the covering-space classification this roadmap composes with are Tau Ceti declarations from the
completed UniversalCovers roadmap. Each statement below is the form in which a Belyi layer
consumes one of them, closed by the supplier declaration, so that a change of spelling or carrier
upstream fails here. The finite corollary of Layer 6.2 is this roadmap's own milestone; Tau Ceti
proves its existence half as `TauCeti.ConnectedFiberNumberedCover.exists_permCongrHom_comp_monodromyPerm_eq`,
which gives the surjectivity in Layer 6.3(1) below. -/

section UniversalCoversSupply

variable {X : Type u} [TopologicalSpace X] [PathConnectedSpace X] [LocallyPathConnectedSpace X]
  [TauCeti.SemilocallySimplyConnectedSpace X] (x : X)

/-- **Layer 5.7.** Changing the basepoint of a subgroup of `π₁` along a path. -/
noncomputable example {y : X} (γ : Path x y) (H : Subgroup (FundamentalGroup X x)) :
    Subgroup (FundamentalGroup X y) :=
  FundamentalGroup.basepointChangeSubgroup γ H

omit [PathConnectedSpace X] [LocallyPathConnectedSpace X]
  [TauCeti.SemilocallySimplyConnectedSpace X] in
/-- **Layer 5.7.** Moving the chosen lift by monodromy along a path changes the recovered subgroup
by `basepointChangeSubgroup` along that path. -/
theorem recoveredSubgroup_monodromy_path {E : Type u} [TopologicalSpace E] {p : E → X}
    (hp : IsCoveringMap p) {y : X} (γ : Path x y) (e₀ : p ⁻¹' {x}) :
    (FundamentalGroup.mapOfEq ⟨p, hp.continuous⟩ (hp.monodromy ⟦γ⟧ e₀).2).range =
      FundamentalGroup.basepointChangeSubgroup γ
        (FundamentalGroup.mapOfEq ⟨p, hp.continuous⟩ e₀.2).range :=
  hp.range_mapOfEq_monodromy_path γ e₀

/-- **Layer 6.2(1).** The class map `Ũ × S → assocCover S` is a quotient covering map for the
diagonal action; this gives `assocCover S` its topology and the universal property for maps out
of it. -/
theorem assocCover_isQuotientCoveringMap_mk (S : Type u) [MulAction (FundamentalGroup X x) S]
    [TopologicalSpace S] [DiscreteTopology S] :
    IsQuotientCoveringMap
      (Quotient.mk (MulAction.orbitRel (FundamentalGroup X x) (TauCeti.UniversalCover x × S)) :
        TauCeti.UniversalCover x × S → TauCeti.UniversalCover.ActionCover x S)
      (FundamentalGroup X x) :=
  have : ContinuousConstSMul (FundamentalGroup X x) S :=
    ⟨fun _ => continuous_of_discreteTopology⟩
  TauCeti.BalancedProduct.isQuotientCoveringMap_mk S TauCeti.UniversalCover.isQuotientCoveringMap

/-- **Layer 6.2(2).** The projection `assocCover S → X` is a covering map. This is the supplier's
equivariant sheet computation, not a consequence of 6.2(1). -/
theorem assocCover_isCoveringMap (S : Type u) [MulAction (FundamentalGroup X x) S]
    [TopologicalSpace S] [DiscreteTopology S] :
    IsCoveringMap (TauCeti.UniversalCover.actionCoverProj x S) :=
  TauCeti.UniversalCover.isCoveringMap_actionCoverProj x S

/-- **Layer 6.2(3).** The numbering `ν_S` of the fiber over `x`, in the direction `permCongr`
needs: the inverse of the supplier's `s ↦ ⟦ũ₀, s⟧`. -/
noncomputable def assocCoverNumbering (S : Type u) [MulAction (FundamentalGroup X x) S] :
    ↥(TauCeti.UniversalCover.actionCoverProj x S ⁻¹' {x}) ≃ S :=
  (TauCeti.UniversalCover.actionCoverFiberEquiv x S).symm

/-- **Layer 6.2(4).** Monodromy read through `ν_S` is the given action of `π₁` on `S`, with no
inverse and no `ᵐᵒᵖ`. -/
theorem assocCoverNumbering_permCongr_monodromyHom (S : Type u)
    [MulAction (FundamentalGroup X x) S] [TopologicalSpace S] [DiscreteTopology S]
    (γ : FundamentalGroup X x) :
    (assocCoverNumbering x S).permCongr (monodromyHom (assocCover_isCoveringMap x S) x γ) =
      MulAction.toPerm γ := by
  ext s
  simp only [Equiv.permCongr_apply, MulAction.toPerm_apply, assocCoverNumbering,
    Equiv.symm_symm]
  exact (congrArg (TauCeti.UniversalCover.actionCoverFiberEquiv x S).symm
    (TauCeti.UniversalCover.monodromy_actionCoverFiberEquiv x S γ s)).trans
    (Equiv.symm_apply_apply _ _)

omit [LocallyPathConnectedSpace X] [TauCeti.SemilocallySimplyConnectedSpace X] in
/-- **Layer 6.2, the finite corollary's connectedness input.** Over a path-connected base, a
cover is path-connected exactly when a fiber is nonempty and monodromy is transitive on it. -/
theorem pathConnectedSpace_iff_monodromy_transitive {E : Type u} [TopologicalSpace E]
    {p : E → X} (hp : IsCoveringMap p) :
    PathConnectedSpace E ↔ Nonempty (p ⁻¹' {x}) ∧
      (letI := hp.fundamentalGroupMulAction x
       MulAction.IsPretransitive (FundamentalGroup X x) (p ⁻¹' {x})) :=
  hp.pathConnectedSpace_iff x

omit [PathConnectedSpace X] in
/-- **Layer 6.3, the pointed subgroup half.** A pointed path-connected cover is isomorphic, over
`X` and matching base points, to the quotient of the universal cover by exactly one subgroup. -/
theorem existsUnique_subgroup_of_pointed {E : Type u} [TopologicalSpace E] [PathConnectedSpace E]
    {p : E → X} (hp : IsCoveringMap p) {e₀ : E} (hpe : p e₀ = x) :
    ∃! H : Subgroup (FundamentalGroup X x),
      ∃ h : E ≃ₜ TauCeti.UniversalCover.SubgroupQuotient x H,
        h e₀ = TauCeti.UniversalCover.SubgroupQuotient.basepoint x H ∧
          TauCeti.UniversalCover.subgroupQuotientProj x H ∘ h = p :=
  TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient x hp hpe

omit [PathConnectedSpace X] [LocallyPathConnectedSpace X]
  [TauCeti.SemilocallySimplyConnectedSpace X] in
/-- **Layer 6.3.** The recovered subgroup of a pointed cover is the stabilizer of the chosen point
under monodromy. -/
theorem stabilizer_eq_recoveredSubgroup {E : Type u} [TopologicalSpace E] {p : E → X}
    (hp : IsCoveringMap p) (e : p ⁻¹' {x}) :
    letI := hp.fundamentalGroupMulAction x
    MulAction.stabilizer (FundamentalGroup X x) e =
      (FundamentalGroup.mapOfEq ⟨p, hp.continuous⟩ e.2).range :=
  hp.stabilizer_eq_range e

omit [PathConnectedSpace X] [LocallyPathConnectedSpace X]
  [TauCeti.SemilocallySimplyConnectedSpace X] in
/-- **Layer 6.3.** The index of the recovered subgroup of a path-connected cover is its degree. -/
theorem card_fiber_eq_index_recoveredSubgroup {E : Type u} [TopologicalSpace E]
    [PathConnectedSpace E] {p : E → X} (hp : IsCoveringMap p) (e : p ⁻¹' {x}) :
    Nat.card (p ⁻¹' {x}) = (FundamentalGroup.mapOfEq ⟨p, hp.continuous⟩ e.2).range.index :=
  hp.card_fiber_eq_index e

/-- **Layer 6.4.** The deck group of the universal cover is the **opposite** of `π₁`; Layer
6.4 absorbs this `ᵐᵒᵖ` once. -/
noncomputable def universalCoverDeckEquiv :
    ↥(deck (TauCeti.UniversalCover.proj (x₀ := x))) ≃* (FundamentalGroup X x)ᵐᵒᵖ :=
  TauCeti.UniversalCover.deckFundamentalGroupEquiv x

/-- **Layer 6.5.** The cover attached to `H` is regular exactly when `H` is normal. -/
theorem isRegular_subgroupQuotient_iff_normal (H : Subgroup (FundamentalGroup X x)) :
    TauCeti.Deck.IsRegular (TauCeti.UniversalCover.subgroupQuotientProj x H) ↔ H.Normal :=
  TauCeti.UniversalCover.isRegular_subgroupQuotientProj_iff_normal x H

/-- **Layer 6.5.** For normal `H` the deck group of the cover attached to `H` is `π₁ ⧸ H`. -/
noncomputable def deckSubgroupQuotientEquivOfNormal (H : Subgroup (FundamentalGroup X x))
    [H.Normal] :
    FundamentalGroup X x ⧸ H ≃* ↥(deck (TauCeti.UniversalCover.subgroupQuotientProj x H)) :=
  TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal x H

end UniversalCoversSupply

/-! ### Layer 6.1: the three cover carriers

Each rigidification of a cover is a Tau Ceti carrier over a base `X : TopCat`, bundling a
`TauCeti.ConnectedCoveringSpace X`, so connectedness is part of the type:

* `TauCeti.ConnectedFiberNumberedCover x n`, with a numbering `ν` of the fiber over `x`; this is
  the carrier a literal `PermutationTriple n` classifies;
* `TauCeti.ConnectedPointedCover x n`, with one chosen point `e` of the fiber and the degree
  carried as `Nonempty (fiber ≃ Fin n)`;
* `TauCeti.ConnectedCover x n`, with only the degree.

Their isomorphism relations are `TauCeti.ConnectedFiberNumberedCoverIso` (every label preserved),
`TauCeti.ConnectedPointedCoverIso` (the chosen point preserved) and isomorphism of the underlying
covers, and the quotients are `TauCeti.ConnectedFiberNumberedCoverClass`,
`TauCeti.ConnectedPointedCoverClass` and `TauCeti.ConnectedCoverClass`. The forgetful maps
`forgetNumbering`, `markLabel` and `forgetPoint` descend to the quotients. -/

section Covers

variable {X : TopCat.{u}} {x : X} {n : ℕ}

/-- **Layer 6.1.** A numbered isomorphism is an isomorphism of covers preserving every label. -/
example (c c' : ConnectedFiberNumberedCover x n) :
    ConnectedFiberNumberedCoverIso c c' ↔
      ∃ f : c.cover ≅ c'.cover, ∀ i, f.hom.hom.left (c.ν.symm i).1 = (c'.ν.symm i).1 :=
  Iff.rfl

/-- **Layer 6.3.** The forgetful triangle commutes:
`TauCeti.ConnectedFiberNumberedCoverClass.forgetPoint_markLabel`. -/
theorem ConnectedFiberNumberedCoverClass.forgetPoint_markLabel (i : Fin n)
    (C : ConnectedFiberNumberedCoverClass x n) :
    (C.markLabel i).forgetPoint = C.forgetNumbering :=
  TauCeti.ConnectedFiberNumberedCoverClass.forgetPoint_markLabel C i

/-- **Layer 6.1.** The degree of a connected cover does not depend on the point of a connected
base: `TauCeti.ConnectedCover.nonempty_equiv_fin_of_mem_connectedComponent`. -/
theorem ConnectedCover.nonempty_ν_of [PathConnectedSpace X] (c : ConnectedCover x n) (y : X) :
    Nonempty (↥(c.cover.proj ⁻¹' {y}) ≃ Fin n) :=
  c.nonempty_equiv_fin_of_mem_connectedComponent
    (by rw [PreconnectedSpace.connectedComponent_eq_univ]; trivial)

end Covers

/-! ### Layer 6.3: the classification at three levels

On `U = TopCat.of TauCeti.ThricePuncturedSphere` at `1/2`, Tau Ceti attaches to each carrier its
combinatorial invariant and proves the three bijections. -/

section Classification

open TauCeti.ThricePuncturedSphere

variable {n : ℕ}

/-- **Layer 6.1.** The monodromy triple of a numbered cover is connected, being a
`TauCeti.ConnectedTriple`, and is `IsCoveringMap.monodromyTriple` read through the numbering. -/
example (c : ConnectedFiberNumberedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    (c.connectedTriple : PermutationTriple n) = c.cover.isCoveringMap_proj.monodromyTriple c.ν :=
  c.coe_connectedTriple

/-- **Layer 6.1.** The convention, pinned: the components of the triple are the fiber monodromy of
the peripheral elements read through the numbering, with no inverse
(`IsCoveringMap.monodromyTriple_σ0`, `IsCoveringMap.monodromyTriple_σ1`). -/
theorem ConnectedFiberNumberedCover.connectedTriple_σ0_σ1
    (c : ConnectedFiberNumberedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    (c.connectedTriple : PermutationTriple n).σ0 =
        c.ν.permCongr (monodromyHom c.cover.isCoveringMap_proj basePt periph0) ∧
      (c.connectedTriple : PermutationTriple n).σ1 =
        c.ν.permCongr (monodromyHom c.cover.isCoveringMap_proj basePt periph1) :=
  ⟨c.cover.isCoveringMap_proj.monodromyTriple_σ0 c.ν,
    c.cover.isCoveringMap_proj.monodromyTriple_σ1 c.ν⟩

/-- **Layer 6.1.** The triple is unchanged by an isomorphism of fiber-numbered covers, and in fact
determines the cover up to such an isomorphism:
`TauCeti.ConnectedFiberNumberedCover.connectedTriple_eq_connectedTriple_iff`. -/
theorem ConnectedFiberNumberedCover.connectedTriple_congr
    {c c' : ConnectedFiberNumberedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n}
    (h : ConnectedFiberNumberedCoverIso c c') : c.connectedTriple = c'.connectedTriple :=
  TauCeti.ConnectedFiberNumberedCover.connectedTriple_eq_connectedTriple_iff.2 h

/-- **Layer 6.3(1), the milestone.** Isomorphism classes of connected fiber-numbered covers
correspond to connected triples **on the nose**:
`TauCeti.ConnectedFiberNumberedCoverClass.triple_bijective`. The equivalence is
`TauCeti.ConnectedFiberNumberedCoverClass.tripleEquiv`. -/
theorem ConnectedFiberNumberedCoverClass.triple_bijective :
    Function.Bijective (TauCeti.ConnectedFiberNumberedCoverClass.triple
      (n := n) : ConnectedFiberNumberedCoverClass (X := TopCat.of TauCeti.ThricePuncturedSphere)
        basePt n → ConnectedTriple n) :=
  TauCeti.ConnectedFiberNumberedCoverClass.triple_bijective

/-- **Layer 6.3(2), the milestone.** Connected covers up to isomorphism over `U` correspond
to simultaneous-conjugacy classes of connected triples:
`TauCeti.ConnectedCoverClass.isoClass_bijective`. The equivalence is
`TauCeti.ConnectedCoverClass.isoClassEquiv`. -/
theorem ConnectedCoverClass.isoClass_bijective :
    Function.Bijective (TauCeti.ConnectedCoverClass.isoClass
      (n := n) : ConnectedCoverClass (X := TopCat.of TauCeti.ThricePuncturedSphere)
        basePt n → ConnectedIsoClass n) :=
  TauCeti.ConnectedCoverClass.isoClass_bijective

/-- **Layer 6.3(3), the milestone.** Connected pointed covers of `(U, b)` up to pointed
isomorphism correspond to connected triples with a marked label, modulo the diagonal relabeling
action: `TauCeti.ConnectedPointedCoverClass.markedClass_bijective`. The equivalence is
`TauCeti.ConnectedPointedCoverClass.markedClassEquiv`. ⚠ The composite with UniversalCovers
milestone 8's pointed correspondence, `existsUnique_subgroup_of_pointed` above, identifies this
carrier with the index-`n` subgroups of `π₁(U, b)`; Hall's numbers `1, 3, 13, 71, 461` are the
acceptance check on the count. -/
theorem ConnectedPointedCoverClass.markedClass_bijective :
    Function.Bijective (TauCeti.ConnectedPointedCoverClass.markedClass
      (n := n) : ConnectedPointedCoverClass (X := TopCat.of TauCeti.ThricePuncturedSphere)
        basePt n → MarkedIsoClass n) :=
  TauCeti.ConnectedPointedCoverClass.markedClass_bijective

/-- **Layer 6.3.** The forgetful maps commute with the classifications: forgetting the
numbering of a cover is passing to the relabeling orbit of its triple,
`TauCeti.ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering`. -/
theorem ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering
    (C : ConnectedFiberNumberedCoverClass (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    C.forgetNumbering.isoClass = ConnectedIsoClass.mk C.triple :=
  TauCeti.ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering C

/-- **Layer 6.3.** ...and forgetting the chosen point is forgetting the marked label,
`TauCeti.ConnectedPointedCoverClass.isoClass_forgetPoint`. -/
theorem ConnectedPointedCoverClass.isoClass_forgetPoint
    (C : ConnectedPointedCoverClass (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    C.forgetPoint.isoClass = C.markedClass.forget :=
  TauCeti.ConnectedPointedCoverClass.isoClass_forgetPoint C

end Classification
/-- **Layer 6.3.** The conjugation action of a group on its subgroups, and the orbit relation
it induces: the target of the composite of `TauCeti.ConnectedCoverClass.isoClassEquiv` with the unpointed half of
UniversalCovers milestone 8. ⚠ **Not** `ConjClasses (Subgroup G)`: `ConjClasses` is a monoid's
quotient by conjugation **on itself**, and `Subgroup G` is not `G`. -/
noncomputable def subgroupConjSetoid {G : Type u} [Group G] : Setoid (Subgroup G) :=
  MulAction.orbitRel (ConjAct G) (Subgroup G)

/-- **Layer 6.3.** `subgroupConjSetoid` is the relation in which the supplier states conjugacy,
`∃ γ, K = H.map (MulAut.conj γ).toMonoidHom`. -/
theorem subgroupConjSetoid_iff {G : Type u} [Group G] (H K : Subgroup G) :
    subgroupConjSetoid H K ↔ ∃ γ : G, K = H.map (MulAut.conj γ).toMonoidHom := by
  change MulAction.orbitRel (ConjAct G) (Subgroup G) H K ↔ _
  rw [MulAction.orbitRel_apply, MulAction.mem_orbit_iff]
  constructor
  · rintro ⟨c, hc⟩
    refine ⟨(ConjAct.ofConjAct c)⁻¹, ?_⟩
    subst hc
    ext g
    simp only [Subgroup.mem_map, Subgroup.mem_pointwise_smul_iff_inv_smul_mem, ConjAct.smul_def]
    simp only [MulEquiv.coe_toMonoidHom, MulAut.conj_apply, inv_inv, ConjAct.ofConjAct_inv]
    constructor
    · intro h
      refine ⟨ConjAct.ofConjAct c * g * (ConjAct.ofConjAct c)⁻¹, ?_, ?_⟩ <;> group
      · simpa using h
    · rintro ⟨y, hy, rfl⟩
      simpa [mul_assoc] using hy
  · rintro ⟨γ, rfl⟩
    refine ⟨ConjAct.toConjAct γ⁻¹, ?_⟩
    ext g
    simp [Subgroup.mem_pointwise_smul_iff_inv_smul_mem, ConjAct.smul_def]

/-- **Layer 6.3, the unpointed subgroup half.** Two subgroup quotients of the universal cover are
isomorphic over `X` exactly when the subgroups are related by `subgroupConjSetoid`. -/
theorem subgroupQuotient_iso_iff {X : Type u} [TopologicalSpace X] [PathConnectedSpace X]
    [LocallyPathConnectedSpace X] [TauCeti.SemilocallySimplyConnectedSpace X] (x : X)
    (H K : Subgroup (FundamentalGroup X x)) :
    (∃ h : TauCeti.UniversalCover.SubgroupQuotient x H ≃ₜ TauCeti.UniversalCover.SubgroupQuotient x K,
        TauCeti.UniversalCover.subgroupQuotientProj x K ∘ h =
          TauCeti.UniversalCover.subgroupQuotientProj x H) ↔
      subgroupConjSetoid H K := by
  rw [TauCeti.UniversalCover.exists_homeomorph_subgroupQuotient_comp_eq_iff_exists_eq_map_conj,
    subgroupConjSetoid_iff]


/-! ### Layers 2.6, 6.3: the topological branch-point action

Pulling a cover back along an anharmonic self-homeomorphism of `U` is the topological
`S₃`-action, Tau Ceti's `TauCeti.ConnectedCoverClass.pullback`. Pulling back along `h` moves the
basepoint from `x` to `h⁻¹ x`. The two theorems below say that, for the two generators, it is the
combinatorial action of Layer 2.6. -/

section BranchPointAction

open TauCeti.ThricePuncturedSphere

variable {n : ℕ}

/-- **Layer 2.6, 6.3, the agreement theorem, generator one.** Pulling back along `z ↦ 1 − z`
replaces the triple of a cover by `swap01` of it. Because `mob01` fixes the basepoint, this holds
with no choice of connecting path: `TauCeti.ConnectedCoverClass.isoClass_pullback_mob01`, and on
numbered covers, on the nose,
`TauCeti.ConnectedFiberNumberedCover.connectedTriple_pullback_mob01`. -/
theorem ConnectedCover.isoClass_pullback_mob01
    (c : ConnectedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    ((ConnectedCoverClass.mk c).pullback mob01 mob01_basePt).isoClass =
      ConnectedIsoClass.mk (c.numbering.connectedTriple.reindexBranchPoints (Equiv.swap 0 1)) := by
  rw [TauCeti.ConnectedCoverClass.isoClass_pullback_mob01, ← c.forgetNumbering_numbering,
    ← TauCeti.ConnectedFiberNumberedCoverClass.forgetNumbering_mk,
    TauCeti.ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering,
    TauCeti.ConnectedFiberNumberedCoverClass.triple_mk, ConnectedIsoClass.op_smul_mk]
  rfl

/-- **Layer 2.6, 6.3, the agreement theorem, generator two.** Pulling back along
`z ↦ z/(z − 1)` and moving the basepoint back from `−1` to `1/2` replaces the triple by
`swap1Inf` of it: `TauCeti.ConnectedCoverClass.isoClass_basepointChange_pullback_mob1Inf`.
⚠ Here the statement is genuinely one about **classes**: `mob1Inf b = −1 ≠ b`, and on
numbered covers the triple depends on the path chosen to move the basepoint back
(`TauCeti.ConnectedFiberNumberedCover.connectedTriple_basepointChange_pullback_mob1Inf` uses the
path `αMob1Inf` through the upper half-plane). -/
theorem ConnectedCover.isoClass_pullback_mob1Inf
    (c : ConnectedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    (((ConnectedCoverClass.mk c).pullback mob1Inf (mob1Inf_mob1Inf basePt)).basepointChange
        (by rw [PreconnectedSpace.connectedComponent_eq_univ]; trivial)).isoClass =
      ConnectedIsoClass.mk (c.numbering.connectedTriple.reindexBranchPoints (Equiv.swap 1 2)) := by
  rw [TauCeti.ConnectedCoverClass.isoClass_basepointChange_pullback_mob1Inf,
    ← c.forgetNumbering_numbering, ← TauCeti.ConnectedFiberNumberedCoverClass.forgetNumbering_mk,
    TauCeti.ConnectedFiberNumberedCoverClass.isoClass_forgetNumbering,
    TauCeti.ConnectedFiberNumberedCoverClass.triple_mk, ConnectedIsoClass.op_smul_mk]
  rfl

end BranchPointAction

/-! ### Layers 6.4, 6.5: deck transformations and regular covers -/

section Deck

open TauCeti.ThricePuncturedSphere

variable {n : ℕ}

/-- **Layer 6.4.** The deck group of a numbered cover is the automorphism group of its triple,
a deck transformation going to the permutation it induces on the labels:
`TauCeti.ConnectedFiberNumberedCover.deckMulEquiv`. -/
noncomputable example
    (c : ConnectedFiberNumberedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    deck c.cover.proj ≃* (c.connectedTriple : PermutationTriple n).automorphismGroup :=
  c.deckMulEquiv

/-- **Layer 6.5.** A numbered cover is regular exactly when its triple is, exactly when its
deck group has order the degree: `TauCeti.ConnectedFiberNumberedCover.isRegular_proj_iff` and
`TauCeti.ConnectedFiberNumberedCover.isRegular_iff_card_deck`. -/
theorem ConnectedFiberNumberedCover.isRegular_iff
    (c : ConnectedFiberNumberedCover (X := TopCat.of TauCeti.ThricePuncturedSphere) basePt n) :
    (Deck.IsRegular c.cover.proj ↔ (c.connectedTriple : PermutationTriple n).IsRegular) ∧
      ((c.connectedTriple : PermutationTriple n).IsRegular ↔ Nat.card (deck c.cover.proj) = n) :=
  ⟨c.isRegular_proj_iff, c.isRegular_iff_card_deck⟩

end Deck
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

The ring structure on Tau Ceti's profinite integers `TauCeti.zHat`, the exponentiation calculus
through `TauCeti.zHat.lift`, and the continuous outer-automorphism carrier belong to
`ProfiniteArithmetic`, the generic successor to `ProfiniteProPGroups` (#244); free profinite and
free pro-`p` groups are Tau Ceti's implementations of #244 (`TauCeti.freeProfiniteGroup`,
`TauCeti.freeProP`). The Belyi-specific peripheral
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

/-- **§Pinned conventions, the conjugation-transfer lemma.** The conjugator for a conjugate
element is **computed**, not guessed: `d := q * c * (φ q)⁻¹`. ⚠ It involves `φ q`, and is not
obtained by multiplying `c` by `q` on one side. Stated on an abstract group with an abstract
power operation, since that is all the proof uses; each application supplies
`pow (q * x * q⁻¹) = q * pow x * q⁻¹` from the naturality of its power under conjugation
(Layer 12.2 here). Like `opposite_third_peripheral`, it depends on nothing in Layers 12 and 13
and nothing in `PeripheralActions`, which consumes both; Layer 13.3 cites it for the change of
convention. -/
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

end TauCetiRoadmap.BelyiMaps
