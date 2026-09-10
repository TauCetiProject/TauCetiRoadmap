import Mathlib
import TauCetiRoadmap.RepresentationTheory.RootSystems.Suggested

/-!
# A statement of the classification of finite simple groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations here suggest Lean forms for the indexing types and concrete group
constructions needed to state CFSG. Discharging all of them finishes neither a work item nor the
roadmap. `sorry` is allowed in this human-owned roadmap library: these are targets, not completed
definitions or proofs.

The scope ends at the final named proposition: this roadmap defines the groups on the CFSG list well
enough to state that every finite simple group is isomorphic to one of them. It does not ask for
proofs that the listed groups are finite or simple, or for a proof of the classification.

This file imports the root-systems roadmap's targets rather than restating them. `DynkinType` and
its pinned Bourbaki numbering are that roadmap's, and every Lie-type index here is required to name
one, so that nothing downstream has to reconcile two numberings of the same diagram.
-/

namespace TauCetiRoadmap.CFSGStatement

open TauCetiRoadmap.RepresentationTheory.RootSystems

/-! ## Parameters and the groups of Lie type -/

/-- A prime power `p ^ exponent`, carrying the data needed to construct its finite field. -/
structure PrimePower where
  p : ℕ
  exponent : ℕ
  prime_p : p.Prime
  exponent_pos : 0 < exponent

/-- The cardinality represented by a `PrimePower`. -/
def PrimePower.card (q : PrimePower) : ℕ := q.p ^ q.exponent

/-- The families of finite groups of Lie type. The rank parameters follow the Dynkin subscripts.

`q` follows the Gorenstein--Lyons--Solomon/ATLAS convention in the ordinary and graph-twisted
constructors: the latter compose the pinned graph automorphism with the `q.card`-power field
Frobenius. So `twistedA 2 q` with `q.card = 3` is `²A₂(3) = PSU₃(3)`, whose matrix realization has
entries in the field of `q.card ^ 2` elements. Carter indexes the twisted groups by the larger
field, as `²A_n(q²)`; do not follow that convention here, since the small-field indexing is what
makes the exclusions in `InStandardRange` correct.

The Suzuki and Ree constructors record `m`, with field sizes `2 ^ (2 * m + 1)`,
`3 ^ (2 * m + 1)`, and `2 ^ (2 * m + 1)` respectively. The Tits group is represented separately
from the simple Ree groups `²F₄(2 ^ (2 * m + 1))`, which have `m ≥ 1`. That split is conventional
rather than mathematical: the uniform derived-subgroup-modulo-center construction applied to `²F₄`
at field order two would produce the same group, but the Tits group is traditionally listed apart
from the groups of Lie type. -/
inductive LieTypeIndex where
  | A (rank : ℕ) (q : PrimePower)
  | twistedA (rank : ℕ) (q : PrimePower)
  | B (rank : ℕ) (q : PrimePower)
  | C (rank : ℕ) (q : PrimePower)
  | D (rank : ℕ) (q : PrimePower)
  | twistedD (rank : ℕ) (q : PrimePower)
  | E6 (q : PrimePower)
  | E7 (q : PrimePower)
  | E8 (q : PrimePower)
  | F4 (q : PrimePower)
  | G2 (q : PrimePower)
  | twistedE6 (q : PrimePower)
  | trialityD4 (q : PrimePower)
  | suzuki (m : ℕ)
  | reeG2 (m : ℕ)
  | reeF4 (m : ℕ)
  | tits

/-- Conventional rank and small-field restrictions. These remove the nonsimple members and the
systematic low-rank and characteristic-two overlaps before a preferred representative is chosen
for the remaining sporadic coincidences. This predicate is indexing data only: it does not assert
that the resulting group has been proved finite or simple in Lean.

The `B` and `C` ranges are the usual ones: `B` from rank two, `C` from rank three and odd
characteristic. `B₂(q)` is `C₂(q)` for every `q` and `B_n(q)` is `C_n(q)` for even `q`, so the `C`
restrictions remove exactly the resulting duplicates. These are also the ranges carried by
`DynkinType.Valid` in the root-systems roadmap, so every valid index here names a valid Dynkin
type there. -/
def LieTypeIndex.InStandardRange : LieTypeIndex → Prop
  | .A rank q => 1 ≤ rank ∧ (rank = 1 → 4 ≤ q.card)
  | .twistedA rank q => 2 ≤ rank ∧ (rank = 2 → 3 ≤ q.card)
  | .B rank q => 2 ≤ rank ∧ ¬(rank = 2 ∧ q.card = 2)
  | .C rank q => 3 ≤ rank ∧ q.p ≠ 2
  | .D rank _ => 4 ≤ rank
  | .twistedD rank _ => 4 ≤ rank
  | .G2 q => 3 ≤ q.card
  | .suzuki m | .reeG2 m | .reeF4 m => 1 ≤ m
  | .E6 _ | .E7 _ | .E8 _ | .F4 _ | .twistedE6 _ | .trialityD4 _ | .tits => True

/-- The representatives deliberately omitted in favor of the alternating or Lie-type names fixed
by the roadmap. After `InStandardRange`, these are the remaining small coincidences relevant to
the list. -/
def LieTypeIndex.IsDuplicateRepresentative : LieTypeIndex → Prop
  | .A 1 q => q.card = 4 ∨ q.card = 5 ∨ q.card = 9
  | .A 2 q => q.card = 2
  | .A 3 q => q.card = 2
  | .B 2 q => q.card = 3
  | _ => False

/-- A preferred representative in the CFSG list. This is not a finiteness or simplicity
predicate. -/
def LieTypeIndex.Valid (d : LieTypeIndex) : Prop :=
  d.InStandardRange ∧ ¬d.IsDuplicateRepresentative

private def q2 : PrimePower := ⟨2, 1, by decide, by decide⟩
private def q3 : PrimePower := ⟨3, 1, by decide, by decide⟩
private def q4 : PrimePower := ⟨2, 2, by decide, by decide⟩

/-! Executable checks for representative range and duplicate conventions. -/
example : ¬(LieTypeIndex.A 1 q2).InStandardRange := by
  norm_num [LieTypeIndex.InStandardRange, PrimePower.card, q2]
example : (LieTypeIndex.A 1 q4).InStandardRange := by
  norm_num [LieTypeIndex.InStandardRange, PrimePower.card, q4]
example : ¬(LieTypeIndex.A 1 q4).Valid := by
  norm_num [LieTypeIndex.Valid, LieTypeIndex.InStandardRange,
    LieTypeIndex.IsDuplicateRepresentative, PrimePower.card, q4]
example : (LieTypeIndex.twistedA 2 q3).Valid := by
  norm_num [LieTypeIndex.Valid, LieTypeIndex.InStandardRange,
    LieTypeIndex.IsDuplicateRepresentative, PrimePower.card, q3]
/-- `B₂(2) = Sp₄(2)` is not simple; its derived subgroup is `A₆`, kept as `alternating 6`. -/
example : ¬(LieTypeIndex.B 2 q2).InStandardRange := by
  norm_num [LieTypeIndex.InStandardRange, PrimePower.card, q2]
/-- `B₂(4)` is kept: the rank-two symplectic family is named `B`, not `C`, in every
characteristic. -/
example : (LieTypeIndex.B 2 q4).Valid := by
  norm_num [LieTypeIndex.Valid, LieTypeIndex.InStandardRange,
    LieTypeIndex.IsDuplicateRepresentative, PrimePower.card, q4]
/-- The `B₂(3)` branch is `PSp₄(3) ≅ PSU₄(2) = ²A₃(2)`, and we keep the unitary name. It is the
projective quotient that the recipe produces and that coincides with `PSU₄(2)`; the simply connected
`Sp₄(3)`, of order `51840`, is its double cover. -/
example : ¬(LieTypeIndex.B 2 q3).Valid := by
  norm_num [LieTypeIndex.Valid, LieTypeIndex.InStandardRange,
    LieTypeIndex.IsDuplicateRepresentative, PrimePower.card, q3]
/-- `C₃(2) ≅ B₃(2)`, and even characteristic is carried by the `B` family. -/
example : ¬(LieTypeIndex.C 3 q2).InStandardRange := by
  norm_num [LieTypeIndex.InStandardRange, q2]
/-- `C₃(3) = PSp₆(3)` is not `B₃(3) = Ω₇(3)`, so both survive in odd characteristic. -/
example : (LieTypeIndex.C 3 q3).Valid := by
  norm_num [LieTypeIndex.Valid, LieTypeIndex.InStandardRange,
    LieTypeIndex.IsDuplicateRepresentative, q3]
example : (LieTypeIndex.B 3 q3).Valid :=
  ⟨by norm_num [LieTypeIndex.InStandardRange, PrimePower.card, q3], id⟩

/-- A Lie-type index whose rank, field, and preferred-representative conditions hold. All
carrier-valued constructions below take this subtype, so no implementation branch is required for
an invalid Dynkin rank or excluded small group. -/
abbrev ValidLieTypeIndex := {d : LieTypeIndex // d.Valid}

/-- The indices whose Steinberg map is an odd power of a half-Frobenius rather than a Frobenius
composed with a graph automorphism.

Deliberately not called `IsExceptional`: in Lie theory the exceptional types are `E₆`, `E₇`, `E₈`,
`F₄` and `G₂`, and this predicate is `False` on all of them. Nor is it "has an exceptional isogeny",
which `B₂(q)` in characteristic two does whether or not its Steinberg map uses one. What the four
branches share is precisely that they use the half-Frobenius. -/
def LieTypeIndex.UsesHalfFrobenius : LieTypeIndex → Prop
  | .suzuki _ | .reeG2 _ | .reeF4 _ | .tits => True
  | _ => False

/-- A valid index whose Steinberg map is an odd power of a half-Frobenius: the three Suzuki--Ree
families together with Tits. The half-Frobenius below takes this subtype, so no implementation
branch is required for a family that does not use one. -/
abbrev SuzukiReeIndex := {d : ValidLieTypeIndex // d.1.UsesHalfFrobenius}

/-- A valid index whose Steinberg map is a Frobenius composed with a diagram automorphism, that
automorphism being the identity on an untwisted family. `diagramPerm` and `graphAut` take this
subtype, so the Suzuki--Ree and Tits branches, which consume neither, need no dummy value. -/
abbrev GraphTwistedIndex := {d : ValidLieTypeIndex // ¬ d.1.UsesHalfFrobenius}

/-! ### Numbered data attached to an index

`rank`, `characteristic`, and `fieldOrder` read off the underlying untwisted Dynkin diagram and its
field. Do not replace them by a summary of which construction lane a family uses: such a summary
does not determine the Steinberg map, since `suzuki` and `reeF4` share a characteristic and a
parameter, and knowing that a family is graph-twisted of order two does not say which order-two
diagram automorphism is meant. -/

/-- **The underlying untwisted Dynkin diagram**, as the root-systems roadmap's `DynkinType`, not as
a second copy of one. Every construction below is indexed against this type and its pinned Bourbaki
numbering, so `Fin d.rank` is `Fin d.dynkinType.rank` by definition and no reindexing is possible.

The twisted and Suzuki--Ree families name the diagram they are built from: `²A_n` names `A n`, `³D₄`
names `D 4`, `²B₂` names `B 2`, `²G₂` names `G2`, and `²F₄` and Tits name `F4`. -/
def ValidLieTypeIndex.dynkinType (d : ValidLieTypeIndex) : DynkinType :=
  match d.1 with
  | .A n _ | .twistedA n _ => .A n
  | .B n _ => .B n
  | .C n _ => .C n
  | .D n _ | .twistedD n _ => .D n
  | .trialityD4 _ => .D 4
  | .E6 _ | .twistedE6 _ => .E6
  | .E7 _ => .E7
  | .E8 _ => .E8
  | .F4 _ | .reeF4 _ | .tits => .F4
  | .G2 _ | .reeG2 _ => .G2
  | .suzuki _ => .B 2

/-- Every valid index names a **valid** Dynkin type, so `DynkinType.simplyConnectedRootDatum`
applies to it and L0 never needs a root datum of its own. This is the statement that makes the rank
ranges of `InStandardRange` and of `DynkinType.Valid` agree. -/
theorem ValidLieTypeIndex.dynkinType_valid (d : ValidLieTypeIndex) : d.dynkinType.Valid := by
  obtain ⟨d, ⟨hrange, -⟩⟩ := d
  cases d <;> simp only [ValidLieTypeIndex.dynkinType, DynkinType.Valid] <;>
    first
      | trivial
      | (simp only [LieTypeIndex.InStandardRange] at hrange; omega)

/-- The rank of the underlying untwisted Dynkin diagram. Derived, not tabulated: a second table
would be free to disagree with the diagram. -/
abbrev ValidLieTypeIndex.rank (d : ValidLieTypeIndex) : ℕ := d.dynkinType.rank

/-- The characteristic of the field the ambient group is taken over. -/
def ValidLieTypeIndex.characteristic (d : ValidLieTypeIndex) : ℕ :=
  match d.1 with
  | .A _ q | .twistedA _ q | .B _ q | .C _ q | .D _ q | .twistedD _ q
  | .E6 q | .E7 q | .E8 q | .F4 q | .G2 q | .twistedE6 q | .trialityD4 q => q.p
  | .reeG2 _ => 3
  | .suzuki _ | .reeF4 _ | .tits => 2

/-- The characteristic is prime. Needed to give `ZMod d.characteristic` its `Field` instance, and so
to pin `ValidLieTypeIndex.Closure` below to a concrete Mathlib algebraic closure. -/
theorem ValidLieTypeIndex.characteristic_prime (d : ValidLieTypeIndex) :
    d.characteristic.Prime := by
  obtain ⟨d, -⟩ := d
  cases d <;> simp only [ValidLieTypeIndex.characteristic] <;> first
    | exact ‹PrimePower›.prime_p
    | norm_num

instance (d : ValidLieTypeIndex) : Fact d.characteristic.Prime := ⟨d.characteristic_prime⟩

/-- The order `q` of the field of definition, in the small-field GLS/ATLAS convention: the parameter
of `Frob_q` for the ordinary and graph-twisted lanes, and `p ^ (2 * m + 1)` for the exceptional
ones. -/
def ValidLieTypeIndex.fieldOrder (d : ValidLieTypeIndex) : ℕ :=
  match d.1 with
  | .A _ q | .twistedA _ q | .B _ q | .C _ q | .D _ q | .twistedD _ q
  | .E6 q | .E7 q | .E8 q | .F4 q | .G2 q | .twistedE6 q | .trialityD4 q => q.card
  | .suzuki m | .reeF4 m => 2 ^ (2 * m + 1)
  | .reeG2 m => 3 ^ (2 * m + 1)
  | .tits => 2

/-! ### Numbered diagram permutations

Bourbaki node `i` sits at `Fin` index `i - 1`, so a rank-`n` diagram is indexed by `Fin n` running
from `0`. These are the permutations the L1 and L2 equations are stated against; pinning them as
data rather than as prose is the point. -/

/-- The `A_n` diagram automorphism: reverse the chain. Also the `F₄` length-exchanging map. -/
def graphPermA (n : ℕ) : Equiv.Perm (Fin n) := Fin.revPerm

/-- The `D_n` diagram automorphism: exchange the two fork nodes, fixing the chain. -/
def graphPermD (n : ℕ) (hn : 2 ≤ n) : Equiv.Perm (Fin n) :=
  Equiv.swap ⟨n - 2, by omega⟩ ⟨n - 1, by omega⟩

/-- The `E₆` diagram automorphism: Bourbaki `1 ↔ 6` and `3 ↔ 5`, fixing `2` and `4`. -/
def graphPermE6 : Equiv.Perm (Fin 6) := Equiv.swap 0 5 * Equiv.swap 2 4

/-- `D₄` triality: cycle the three outer nodes, fixing the trivalent centre, which is Bourbaki node
`2` and so `Fin` index `1`. -/
def trialityPermD4 : Equiv.Perm (Fin 4) := Equiv.swap 0 3 * Equiv.swap 0 2

/-- The `B₂` and `G₂` length-exchanging map. -/
def lengthPermRankTwo : Equiv.Perm (Fin 2) := Equiv.swap 0 1

/-- The `F₄` length-exchanging map: the diagram reversal. -/
def lengthPermF4 : Equiv.Perm (Fin 4) := graphPermA 4

/-- The diagram permutation realized by the graph automorphism of `d`. Every branch must unfold to
one of the permutations above, or to `1` for an untwisted family. Defined only where a graph
automorphism is used: the Suzuki--Ree and Tits branches take the half-Frobenius route instead and so
need no value here. -/
def GraphTwistedIndex.diagramPerm (d : GraphTwistedIndex) : Equiv.Perm (Fin d.1.rank) := sorry

/-- The length-exchanging permutation realized by the exceptional isogeny of `e`. Every branch must
unfold to `lengthPermRankTwo` or `lengthPermF4`. -/
def SuzukiReeIndex.lengthPerm (e : SuzukiReeIndex) : Equiv.Perm (Fin e.1.rank) := sorry

/-- The length permutation exchanges long and short simple roots, against the root lengths pinned by
the root-systems roadmap. This is the acceptance check for `lengthPerm`. -/
theorem SuzukiReeIndex.isLongSimpleRoot_lengthPerm (e : SuzukiReeIndex) (i : Fin e.1.rank) :
    e.1.dynkinType.IsLongSimpleRoot (e.lengthPerm i) ↔ ¬ e.1.dynkinType.IsLongSimpleRoot i := sorry

/-- The exponent the pinned exceptional isogeny attaches to each numbered simple root subgroup. -/
def SuzukiReeIndex.exponent (e : SuzukiReeIndex) : Fin e.1.rank → ℕ := sorry

/-- **The exponent convention**, stated once against `DynkinType.IsLongSimpleRoot` rather than as a
table per family: `1` on the long simple roots. Attaching `1` to long and `p` to short is a genuine
choice, since the opposite assignment also squares to `Frob_p`. -/
theorem SuzukiReeIndex.exponent_of_isLongSimpleRoot (e : SuzukiReeIndex) (i : Fin e.1.rank)
    (h : e.1.dynkinType.IsLongSimpleRoot i) : e.exponent i = 1 := sorry

/-- `p` on the short simple roots. See `SuzukiReeIndex.exponent_of_isLongSimpleRoot`. -/
theorem SuzukiReeIndex.exponent_of_not_isLongSimpleRoot (e : SuzukiReeIndex) (i : Fin e.1.rank)
    (h : ¬ e.1.dynkinType.IsLongSimpleRoot i) : e.exponent i = e.1.characteristic := sorry

/-! The concrete consequences, which is how the convention reads on each family. These are worked
values, not a second definition: `DynkinType.IsLongSimpleRoot` upstream is what pins them, and it
gives `B₂` index `0` long, `G₂` index `1` long, and `F₄` indices `0, 1` long. -/
example : ¬ (DynkinType.B 2).IsLongSimpleRoot ⟨1, by decide⟩ := by
  simp [DynkinType.IsLongSimpleRoot]
example : (DynkinType.G2).IsLongSimpleRoot ⟨1, by decide⟩ := by
  simp [DynkinType.IsLongSimpleRoot]
example : ∀ i : Fin (DynkinType.F4).rank, (DynkinType.F4).IsLongSimpleRoot i ↔ (i : ℕ) < 2 :=
  fun _ => Iff.rfl

/-- The fixed points `{g | F g = g}` of a group endomorphism: Mathlib's `MonoidHom.eqLocus`
against the identity. -/
def fixedSubgroup {G : Type*} [Group G] (F : G →* G) : Subgroup G :=
  F.eqLocus (MonoidHom.id G)

/-- The points over an algebraic closure of the explicitly pinned simply connected
Chevalley--Demazure group attached to the valid index `d`. The implementation must expose and use
the root datum, pinning, base change, points, and root-subgroup maps specified in `README.md`, not a
group chosen from an existence or classification theorem. -/
def ValidLieTypeIndex.AmbientGroup (_d : ValidLieTypeIndex) : Type := sorry

/-- The group structure on the algebraic group's points. -/
instance (d : ValidLieTypeIndex) : Group d.AmbientGroup := sorry

/-- The algebraic closure of the prime field the ambient group is taken over, pinned to Mathlib's
`AlgebraicClosure` of `ZMod p` rather than left as "an algebraic closure of `𝔽_p`". Its `Field`,
`IsAlgClosed` and `CharP` instances then come from Mathlib rather than from this roadmap, and the
`Fact` instance above is what makes `ZMod d.characteristic` a field in the first place. -/
noncomputable abbrev ValidLieTypeIndex.Closure (d : ValidLieTypeIndex) : Type :=
  AlgebraicClosure (ZMod d.characteristic)

noncomputable example (d : ValidLieTypeIndex) : Field d.Closure := inferInstance
example (d : ValidLieTypeIndex) : IsAlgClosed d.Closure := inferInstance
example (d : ValidLieTypeIndex) : CharP d.Closure d.characteristic := inferInstance

/-- The numbered simple root subgroup `x_{α_i}` of the pinning, as a map from the additive group of
the algebraic closure. The full root-subgroup family is part of L0's contract; this is the piece the
equations below are stated against, and the piece a pinning normalizes. -/
def ValidLieTypeIndex.simpleRootSubgroup (d : ValidLieTypeIndex) (i : Fin d.rank)
    (t : d.Closure) : d.AmbientGroup := sorry

/-- Each simple root subgroup is a homomorphism from the additive group of the closure. -/
theorem ValidLieTypeIndex.simpleRootSubgroup_add (d : ValidLieTypeIndex) (i : Fin d.rank)
    (s t : d.Closure) :
    d.simpleRootSubgroup i (s + t) = d.simpleRootSubgroup i s * d.simpleRootSubgroup i t := sorry

/-- The `q`-power Frobenius induced on points, for `q = d.fieldOrder`. -/
def ValidLieTypeIndex.frobenius (d : ValidLieTypeIndex) : d.AmbientGroup →* d.AmbientGroup := sorry

/-- `Frob_q (x_α(t)) = x_α(t ^ q)` on the numbered simple root subgroups. The corresponding
statement for the full root-subgroup family is part of L0's contract; this file displays the
simple-root case because it is what the maps below are pinned against. -/
theorem ValidLieTypeIndex.frobenius_simpleRootSubgroup (d : ValidLieTypeIndex) (i : Fin d.rank)
    (t : d.Closure) :
    d.frobenius (d.simpleRootSubgroup i t) = d.simpleRootSubgroup i (t ^ d.fieldOrder) := sorry

/-- The pinned graph automorphism realizing `d.diagramPerm`. It is the identity on an untwisted
family, so no branch needs a dummy construction. -/
def GraphTwistedIndex.graphAut (d : GraphTwistedIndex) :
    d.1.AmbientGroup →* d.1.AmbientGroup := sorry

/-- `γ (x_α(t)) = x_{γ α}(t)` for `α` simple. This is the pinning condition, and `γ` is then the
unique automorphism with that action, by the isomorphism theorem for pinned groups targeted in the
reductive-groups roadmap. It must not be strengthened to arbitrary roots: there the equation carries
signs `ε_α = ±1` forced by the structure constants, and the type-`A` graph automorphism
`X ↦ -J Xᵀ J` of `sl_n` already exhibits them. -/
theorem GraphTwistedIndex.graphAut_simpleRootSubgroup (d : GraphTwistedIndex) (i : Fin d.1.rank)
    (t : d.1.Closure) :
    d.graphAut (d.1.simpleRootSubgroup i t) = d.1.simpleRootSubgroup (d.diagramPerm i) t := sorry

/-- The `p`-power Frobenius, the square of the exceptional isogeny. -/
def ValidLieTypeIndex.primeFrobenius (d : ValidLieTypeIndex) :
    d.AmbientGroup →* d.AmbientGroup := sorry

/-- The exceptional isogeny `τ_X` on the points of `e`, obtained from the special isogeny of pinned
group schemes targeted by the reductive-groups roadmap rather than constructed here. What this
roadmap owns is selecting it for the index and taking the odd power below. -/
def SuzukiReeIndex.halfFrobenius (e : SuzukiReeIndex) :
    e.1.AmbientGroup →* e.1.AmbientGroup := sorry

/-- `τ_X (x_{α_i}(t)) = x_{ᾱ_i}(t ^ e_i)`, the equation identifying the upstream special isogeny
with the one this roadmap's exponent and length conventions describe. -/
theorem SuzukiReeIndex.halfFrobenius_simpleRootSubgroup (e : SuzukiReeIndex)
    (i : Fin e.1.rank) (t : e.1.Closure) :
    e.halfFrobenius (e.1.simpleRootSubgroup i t)
      = e.1.simpleRootSubgroup (e.lengthPerm i) (t ^ e.exponent i) := sorry

/-- `τ_X ^ 2 = Frob_p`, inherited from the upstream special isogeny rather than proved here. -/
theorem SuzukiReeIndex.halfFrobenius_sq (e : SuzukiReeIndex) :
    e.halfFrobenius.comp e.halfFrobenius = e.1.primeFrobenius := sorry

/-- The Steinberg endomorphism defining the finite group attached to `d`. The ordinary and graph
branches are `d.frobenius` and `d.graphAut.comp d.frobenius`. An exceptional branch is
`halfFrobenius ^ (2 * m + 1)`; it is not `τ ∘ Frob_q`. Completion means every branch unfolds to one
of those, against the equations above. -/
def ValidLieTypeIndex.steinberg (d : ValidLieTypeIndex) :
    d.AmbientGroup →* d.AmbientGroup := sorry

/-- Fixed points of the Steinberg endomorphism. -/
abbrev ValidLieTypeIndex.FixedPoints (d : ValidLieTypeIndex) : Type := fixedSubgroup d.steinberg

/-- The concrete simple-group candidate attached to a Lie-type index: the derived subgroup of the
fixed points, modulo its center. This also gives the Tits group from the `tits` index. -/
abbrev ValidLieTypeIndex.Group (d : ValidLieTypeIndex) : Type :=
  let derived := commutator d.FixedPoints
  derived ⧸ Subgroup.center derived

/-! ## The sporadic groups -/

/-- The twenty-six sporadic group names. `Fi24Prime` denotes `Fi₂₄'`. -/
inductive SporadicName where
  | M11 | M12 | M22 | M23 | M24
  | J1 | J2 | J3 | J4
  | HS | McL | He | Ru | Suz | ONan
  | Co1 | Co2 | Co3
  | Fi22 | Fi23 | Fi24Prime
  | HN | Ly | Th | B | M
  deriving DecidableEq

/-- The explicit finite enumeration avoids relying on the generated `Fintype` derivation across
Lean toolchain upgrades. -/
instance : Fintype SporadicName := Fintype.ofList
  [.M11, .M12, .M22, .M23, .M24,
   .J1, .J2, .J3, .J4,
   .HS, .McL, .He, .Ru, .Suz, .ONan,
   .Co1, .Co2, .Co3,
   .Fi22, .Fi23, .Fi24Prime,
   .HN, .Ly, .Th, .B, .M]
  (by intro x; cases x <;> simp)

/-- A generator or inverse generator in an auditable presentation word. -/
inductive GeneratorLetter (n : ℕ) where
  | of (i : Fin n)
  | inv (i : Fin n)
  deriving DecidableEq

/-- Convert a signed generator to the corresponding element of the free group. -/
def GeneratorLetter.toFreeGroup {n : ℕ} : GeneratorLetter n → FreeGroup (Fin n)
  | .of i => FreeGroup.of i
  | .inv i => (FreeGroup.of i)⁻¹

/-- A relator word stored as a diff-friendly, left-to-right list of signed generator indices. -/
abbrev PresentationWord (n : ℕ) := List (GeneratorLetter n)

/-- Evaluate an auditable presentation word in the free group. -/
def PresentationWord.toFreeGroup {n : ℕ} (w : PresentationWord n) : FreeGroup (Fin n) :=
  w.foldl (fun g x => g * x.toFreeGroup) 1

/-- The transcription form of a relator. Published relators are written with powers and commutators,
so this is the shape a reviewer compares against the source; `toWord` compiles it to the flat signed
word, which stays the semantics and the input to the count check. Expanding
`(a b₁ c₁ a b₂ c₂ a b₃ c₃) ^ 10` by hand is exactly the transcription this format exists to
avoid. -/
inductive Relator (n : ℕ) where
  | gen (i : Fin n)
  | inv (r : Relator n)
  | mul (r s : Relator n)
  | pow (r : Relator n) (k : ℕ)
  | comm (r s : Relator n)

/-- Reverse a word and flip every sign. -/
def PresentationWord.inv {n : ℕ} (w : PresentationWord n) : PresentationWord n :=
  (w.map fun | .of i => .inv i | .inv i => .of i).reverse

/-- Compile a relator expression to the flat signed word. `comm` follows Mathlib's bracket,
`⁅a, b⁆ = a * b * a⁻¹ * b⁻¹`; a source using the other convention is transcribed accordingly and
that fact goes in `generatorConvention`. -/
def Relator.toWord {n : ℕ} : Relator n → PresentationWord n
  | .gen i => [.of i]
  | .inv r => r.toWord.inv
  | .mul r s => r.toWord ++ s.toWord
  | .pow r k => (List.replicate k r.toWord).flatten
  | .comm r s => r.toWord ++ s.toWord ++ r.toWord.inv ++ s.toWord.inv

/-- The direct reading of a relator expression in the free group, by structural recursion into the
group operations. -/
def Relator.toFreeGroup {n : ℕ} : Relator n → FreeGroup (Fin n)
  | .gen i => FreeGroup.of i
  | .inv r => r.toFreeGroup⁻¹
  | .mul r s => r.toFreeGroup * s.toFreeGroup
  | .pow r k => r.toFreeGroup ^ k
  | .comm r s =>
    r.toFreeGroup * s.toFreeGroup * r.toFreeGroup⁻¹ * s.toFreeGroup⁻¹

/-! A reviewer checks a `Relator` against the published source, but the group is built from
`Relator.toWord`. So `toWord` sits between the thing that was checked and the thing that was
defined, and nothing so far says the two agree. `Relator.toWord_toFreeGroup` says it; the other two
lemmas are what its proof needs. -/

theorem PresentationWord.toFreeGroup_append {n : ℕ} (v w : PresentationWord n) :
    (v ++ w).toFreeGroup = v.toFreeGroup * w.toFreeGroup := sorry

theorem PresentationWord.toFreeGroup_inv {n : ℕ} (w : PresentationWord n) :
    w.inv.toFreeGroup = w.toFreeGroup⁻¹ := sorry

/-- **The compiled word means what the expression means.** Without this, `toWord` is an unaudited
step between the source a reviewer reads and the group the roadmap defines. -/
theorem Relator.toWord_toFreeGroup {n : ℕ} (r : Relator n) :
    r.toWord.toFreeGroup = r.toFreeGroup := sorry

/-- Finite presentation data with its auditable source and transcription metadata. The source must
be a full presentation of the abstract group, proved in that source to define it, not a
semi-presentation for recognizing generators in an already constructed group.

There is deliberately no checksum field. A checksum with no pinned normal form, no algorithm, and no
function to recompute it against cannot be checked by a reviewer or by the kernel, and an
unfalsifiable metadata string reads like a check without being one. The count check below is
decidable, and everything else rests on the independent read-through required by `README.md`.

The arity comes from `generatorNames` alone. An earlier form carried a separate `generatorCount`
field, which let a record's legal relator indices and its index-to-name mapping disagree until a
theorem reconciled them; there is no reason to admit that record at all. -/
structure GroupPresentation where
  generatorNames : List String
  source : String
  sourceLocator : String
  generatorConvention : String
  transcriptionNotes : String
  expectedGeneratorCount : ℕ
  expectedRelatorCount : ℕ
  transcribed : List (Relator generatorNames.length)

/-- The number of generators, which is the number of generator names. -/
abbrev GroupPresentation.generatorCount (P : GroupPresentation) : ℕ := P.generatorNames.length

/-- The compiled relator words. -/
def GroupPresentation.relators (P : GroupPresentation) : List (PresentationWord P.generatorCount) :=
  P.transcribed.map Relator.toWord

/-- The finite list of relator words, regarded as a set for `PresentedGroup`. -/
def GroupPresentation.relatorSet (P : GroupPresentation) :
    Set (FreeGroup (Fin P.generatorCount)) :=
  {r | r ∈ P.relators.map PresentationWord.toFreeGroup}

/-- The group concretely defined by a finite presentation. -/
abbrev GroupPresentation.Group (P : GroupPresentation) : Type :=
  PresentedGroup P.relatorSet

/-- An explicit, cited full finite presentation for each sporadic group. Every branch is to contain
the actual signed relator words and source metadata; no branch may use a semi-presentation or choose
a group from an existence or uniqueness theorem. -/
def SporadicName.presentation (_s : SporadicName) : GroupPresentation := sorry

/-- The recorded generator and relator counts agree with the transcribed data. This is transcription
metadata, not a claim about the presented group. -/
def GroupPresentation.matchesMetadata (P : GroupPresentation) : Prop :=
  P.generatorNames.length = P.expectedGeneratorCount ∧
    P.transcribed.length = P.expectedRelatorCount

/-- Count check for every transcribed presentation. Named, not anonymous: closing an S1 row means
discharging this. -/
theorem presentation_matchesMetadata (s : SporadicName) :
    s.presentation.matchesMetadata := sorry

/-- The sporadic group defined by its pinned presentation. -/
abbrev SporadicName.Group (s : SporadicName) : Type := s.presentation.Group

/-- The enumeration has exactly twenty-six constructors. -/
theorem card_sporadicName : Fintype.card SporadicName = 26 := by decide

/-! ## The classification list and final statement -/

/-- Indices for the preferred representatives on the CFSG list. The proof fields restrict
parameters without asserting that any candidate group is finite or simple. -/
inductive CFSGIndex where
  | cyclic (p : ℕ) (prime_p : p.Prime)
  | alternating (degree : ℕ) (degree_ge_five : 5 ≤ degree)
  | lie (index : ValidLieTypeIndex)
  | sporadic (name : SporadicName)

/-- The concrete group represented by a CFSG index. -/
abbrev CFSGIndex.Group : CFSGIndex → Type
  | .cyclic p _ => Multiplicative (ZMod p)
  | .alternating degree _ => alternatingGroup (Fin degree)
  | .lie index => index.Group
  | .sporadic name => name.Group

instance : (i : CFSGIndex) → Group i.Group
  | .cyclic .. => inferInstance
  | .alternating .. => inferInstance
  | .lie .. => inferInstance
  | .sporadic .. => inferInstance

universe u

/-- **Classification of finite simple groups, statement only.** Proving this proposition, or
proving finiteness or simplicity of any listed group, is outside this roadmap. The existential is
intentional: `Valid` picks conventional representatives, but the interface does not claim a
machine-checked uniqueness theorem for the index.

`CFSGIndex.Group` lands in `Type`, so `ClassificationStatement.{0}` is the substantive instance and
every larger universe follows from it, with `Finite G` supplying the transport. -/
def ClassificationStatement : Prop :=
  ∀ (G : Type u) [Group G] [Finite G] [IsSimpleGroup G],
    ∃ i : CFSGIndex, Nonempty (G ≃* i.Group)

/-- **The universe transport.** A finite `G : Type u` is equivalent to `Fin (Nat.card G)`, so its
group and simplicity structure transport down to `Type 0`. Without this as a target, the claim that
`.{0}` is the substantive instance is one a downstream development cannot use. -/
theorem classificationStatement_of_zero (h : ClassificationStatement.{0}) :
    ClassificationStatement.{u} := sorry

end TauCetiRoadmap.CFSGStatement
