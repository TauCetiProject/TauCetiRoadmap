# Roadmap: stating the classification of finite simple groups

The goal of **CFSGStatement** is deliberately narrower than a formalization of the
classification of finite simple groups. We want every group on the classification list to be an
honest Lean type with a `Group` instance, so that the classification becomes a named proposition:

```lean
universe u

def ClassificationStatement : Prop :=
  ∀ (G : Type u) [Group G] [Finite G] [IsSimpleGroup G],
    ∃ i : CFSGIndex, Nonempty (G ≃* i.Group)
```

The elaboration of this definition, with no placeholder carrier in any branch of `i.Group`, is the
endpoint. There is no `sorry` and no proof of `ClassificationStatement` in scope. In particular,
this roadmap does **not** ask contributors to prove that a candidate is finite or simple. It also
does not ask for order formulas, automorphism groups, recognition theorems, uniqueness of the list,
or the classification theorem itself. Those are separate developments that can consume the
concrete definitions built here by assuming `ClassificationStatement.{u}`.

`CFSGIndex.Group` lands in `Type`, so `ClassificationStatement.{0}` is the substantive instance and
every larger universe follows from it, `Finite G` supplying the transport. That implication is itself
a target, `classificationStatement_of_zero`, and not merely an observation: a downstream development
that assumes the universe it needs has to be able to derive it, rather than assume `.{0}` and find it
does not apply.

Nothing here is proved about the constructed groups, and a consumer needs to know where that theory
is meant to come from. Finiteness, simplicity, orders, and the identifications between the
constructions given here and any other realization of the same group are all downstream work, which
this roadmap enables by giving those groups names and does not itself begin. The one place that gap
is partly closed is the cross-check in S1 below, which is a review obligation rather than a Lean
target.

Suggested home in Tau Ceti: `TauCeti/GroupTheory/SpecificGroups/CFSG/`, with reusable algebraic-group
machinery placed under the homes chosen by the reductive-groups and root-systems roadmaps.

## What counts as defining a group

Each branch of `CFSGIndex.Group` must reduce to explicit mathematical data:

- the cyclic group of prime order `p` is `Multiplicative (ZMod p)`;
- the alternating group is Mathlib's `alternatingGroup (Fin n)`;
- a group of Lie type is built from the fixed points of an explicit Steinberg endomorphism of an
  explicit pinned algebraic group, then by taking the derived subgroup modulo its center;
- a sporadic group is Mathlib's `PresentedGroup` for an explicit finite list of relator words.

A definition that selects the desired group by `Classical.choose` from an existence or uniqueness
theorem does not meet this requirement. Nor does a predicate that characterizes a group by its
order, involution centralizers, or place in the classification. Foundational choice internal to a
standard construction is allowed: Mathlib's algebraic closures, quotient types, and similar
infrastructure are not disqualified merely because their implementation uses choice. The forbidden
step is choosing a carrier from a theorem whose conclusion already says that it is the named group.
The resulting types should remain useful to downstream work even though CFSGStatement proves no
structure theory about them.

These requirements are enforced by review, not mechanically: Mathlib uses choice pervasively, so
`#print axioms` cannot distinguish an honest construction from one that selects a carrier from the
target existence theorem. Reviewers of each work item must read the definitions and trace the
carrier back to the explicit data named below.

## The list and its conventions

`CFSGIndex` has four constructors.

1. `cyclic p hp`, where `hp : p.Prime`.
2. `alternating n hn`, where `hn : 5 ≤ n`.
3. `lie d`, where `d : ValidLieTypeIndex := {d : LieTypeIndex // d.Valid}`.
4. `sporadic s`, where `s : SporadicName` is one of the twenty-six named sporadic groups.

The proof fields restrict the list; they do not bundle or demand `Finite` or `IsSimpleGroup`
instances for the constructed groups. All group-valued Lie-type definitions take
`ValidLieTypeIndex`, never a raw `LieTypeIndex`: an implementation must not invent dummy ambient
groups or Steinberg maps for invalid ranks. Proof irrelevance means that the evidence carried by a
valid index does not create a second mathematical parameter.

### Lie-type families

`LieTypeIndex` records the six classical families

```text
A_n(q),  ²A_n(q),  B_n(q),  C_n(q),  D_n(q),  ²D_n(q),
```

the five untwisted exceptional families

```text
E₆(q), E₇(q), E₈(q), F₄(q), G₂(q),
```

the graph-twisted exceptional families `²E₆(q)` and `³D₄(q)`, and the three Suzuki--Ree
families

```text
²B₂(2^(2m+1)),  ²G₂(3^(2m+1)),  ²F₄(2^(2m+1)).
```

The Tits group `²F₄(2)'` has its own constructor; that split is conventional rather than
mathematical, since the uniform derived-subgroup-modulo-center construction below, applied to
`²F₄` at field order two, produces the same group. A `PrimePower` stores `p`, a positive exponent,
and proofs that `p` is prime and the exponent is positive, so the corresponding Mathlib
`GaloisField` can be constructed without refactoring the index later.

The parameter `q` in the twisted families follows the Gorenstein--Lyons--Solomon/ATLAS
convention: `²A_n(q)` denotes the fixed points of the `q`-power Frobenius composed with the graph
automorphism, so it is the unitary family `PSU_{n+1}(q)` whose matrix realization has entries in
`𝔽_{q²}`, and likewise for `²D_n(q)`, `²E₆(q)`, and `³D₄(q)` (entries in `𝔽_{q³}`). Carter's
books index the same groups by the larger field, writing `²A_n(q²)`; do not follow that
convention here, since the small-field indexing is what makes the exclusions in
`InStandardRange` correct.

`LieTypeIndex.InStandardRange` pins the usual rank and small-field restrictions. It starts `B` at
rank two and excludes `B₂(2)`; starts `C` at rank three and restricts it to odd characteristic,
leaving `B₂(q) = C₂(q)` and the characteristic-two overlap `B_n(q) = C_n(q)` to the `B` family;
starts `D` and `²D` at rank four; excludes `A₁(2)`, `A₁(3)`, `²A₂(2)`, and `G₂(2)`; and starts each
Suzuki--Ree parameter at `m = 1`. The separate Tits constructor supplies `²F₄(2)'`.

Those last exclusions are of two kinds, and the distinction is worth keeping straight because the
predicate is doing two jobs.

`A₁(2)`, `A₁(3)`, `²A₂(2)`, and `²B₂(2)` are excluded because the recipe below does not produce a
simple group. Two of them collapse to the trivial group: `A₁(2)` has `H = SL₂(2) ≅ S₃`, so
`[H, H] = C₃` is its own centre, and `²B₂(2)` is the Frobenius group of order twenty, where
`[H, H] = C₅` is likewise its own centre. The other two do not collapse. `A₁(3)` has `H = SL₂(3)` and
`[H, H] = Q₈`, so the recipe returns `Q₈ / Z(Q₈) ≅ C₂ × C₂`; and `²A₂(2)` has `H = SU₃(2)` of order
`216`, with `[H, H]` of order `54` and centre of order `3`, so the recipe returns a solvable group of
order `18`. These are computed in the simply connected form, `SL₂` and `SU₃`, which is what the
recipe takes fixed points of; the projective forms `PSL₂(3) ≅ A₄` and `PSU₃(2)` would give different
and wrong answers here.

`B₂(2)`, `G₂(2)`, and `²G₂(3)` are excluded for the other reason: the recipe does produce a simple
group, but one the list already carries under another name, namely `A₆`, `²A₂(3)`, and `A₁(8)`.

There is a third case, and it is the reason the Tits constructor exists rather than being an
oversight. The parameters at which `H` fails to be quasisimple are these seven together with
`²F₄(2)`, but `²F₄(2)` is neither dropped nor a duplicate: `[H, H]` is the Tits group, which is
simple, has trivial centre, and is a new isomorphism type. So it is kept, under its own name.

These are the ranges of the usual presentation of the list, and they are also the ranges carried by
`DynkinType.Valid` in the [root-systems roadmap](../RepresentationTheory/RootSystems/README.md)
(`A n (n ≥ 1)`, `B n (n ≥ 2)`, `C n (n ≥ 3)`, `D n (n ≥ 4)`). Every valid index here therefore names
a valid Dynkin type there. That correspondence is a target and not an exhortation:
`ValidLieTypeIndex.dynkinType` returns the upstream `DynkinType`, `dynkinType_valid` proves it valid,
and `ValidLieTypeIndex.rank` is *defined* as `d.dynkinType.rank`, so `Fin d.rank` is the upstream
index type and a reindexed second copy of a root datum is not expressible rather than merely
discouraged. The Suzuki construction names the same rank-two `B₂` type, `²B₂` being the printed
finite-group name for a group built from the `B 2` diagram.

### Small isomorphism coincidences

We do not need an `∃!` statement, but avoiding the few remaining duplicate names makes the index
pleasant to use. After the standard range restrictions, `LieTypeIndex.Valid` drops the following
representatives:

| Dropped representative | Retained representative |
| --- | --- |
| `A₁(4)` and `A₁(5)` | `A₅` |
| `A₁(9)` | `A₆` |
| `A₂(2)` | `A₁(7)` |
| `A₃(2)` | `A₈` |
| `B₂(3)` | `²A₃(2)` |

Thus `Valid` means “our preferred representative in the CFSG list,” not “proved finite and
simple.” Its definition is just `InStandardRange ∧ ¬ IsDuplicateRepresentative`, with the finite
case split visible in `Suggested.lean`. We still state the classification with `∃`, not `∃!`:
there is no need to make the acceptance criterion depend on a formal proof that this table is
complete or that different valid indices give nonisomorphic groups.

### Sporadic names

Use a twenty-six-constructor enumeration, in the conventional names

```text
M11 M12 M22 M23 M24   J1 J2 J3 J4
HS McL He Ru Suz O'Nan   Co1 Co2 Co3
Fi22 Fi23 Fi24'   HN Ly Th B M.
```

Use unambiguous Lean identifiers such as `Fi24Prime` and `ONan`, with docstrings recording the
printed mathematical names. A decidable check that the enumeration has cardinality 26 belongs in
the interface; this checks the name list, not finiteness of any group.

---

## Workstreams, dependencies, and review units

The index and assembly work, the Lie-type construction, and the sporadic presentations are separate
lanes. They may proceed in parallel. The labels below are dependency identifiers, not a demand that
each lane land as one enormous pull request; each item should be split further whenever a reviewer
cannot inspect its defining data in one sitting.

`L0` rests on two bodies of work owned by other roadmaps:

- **Layer 6 of the [root-systems roadmap](../RepresentationTheory/RootSystems/README.md)**, the
  pinned Bourbaki numbering and a named simply connected root datum over `ℤ` for each valid
  `DynkinType`. `DynkinType.simplyConnectedRootDatum`, `DynkinType.simplyConnectedBase`,
  `DynkinType.numRoots`, and `DynkinType.IsLongSimpleRoot` are the declarations this roadmap uses,
  and `Suggested.lean` here imports that file rather than restating any of them.
- **Layer 9 of the [reductive-groups roadmap](../ReductiveGroups/README.md)**, pinned
  Chevalley--Demazure group schemes over `ℤ` with pinnings, base change, points over an
  algebraically closed field, root subgroup maps `x_α`, the isomorphism theorem for pinned groups,
  and the special isogenies in characteristics two and three.

Claim those in the roadmap that owns them. `L0` consumes them and does not restate them, so it
proceeds once they exist in Tau Ceti. `I0`, the numbered conventions, and the whole sporadic lane
depend on neither.

| Item | Depends on | Concrete result | Completion evidence |
| --- | --- | --- | --- |
| I0: indices and numbered conventions | Mathlib, root systems Layer 6 | `PrimePower`, raw and valid Lie indices, the map to `DynkinType`, sporadic names, characteristic and field order, the pinned `Fin` permutations | range and duplicate examples reduce; `dynkinType_valid` is proved; 26-name check passes |
| L0: pinned ambient groups | I0, reductive groups Layer 9 | root datum, pinning, points, root subgroups | every valid family traces to explicit data |
| L1: ordinary and graph Steinberg maps | L0 | Frobenius and numbered diagram maps | the simple-root-subgroup equations and the order relations are proved |
| L2: Suzuki--Ree Steinberg maps | L0 | selection of the upstream special isogeny, and its odd powers | the exponent and length conventions are matched to the upstream isogeny; `steinberg` unfolds on every branch |
| L3: fixed groups | L1 and L2 | fixed points, derived subgroup, central quotient | every valid branch has a `Group` instance |
| L4: the Mathlib Suzuki identification | L3, Mathlib's `suzukiGroup` | `²B₂(2^(2m+1)) ≃* suzukiGroup m` for `m ≥ 1` | the isomorphism is proved, and the `suzuki` branch is unchanged by it |
| S0: presentation format and sources | Mathlib only | relator expression type compiling to signed words, the compilation lemmas, and a 26-row source manifest | `Relator.toWord_toFreeGroup` is proved; every source is a full presentation, is locatable, and is proved to define its group |
| S1: presentation data | S0 | complete relator words for all sporadics | relator counts match the manifest; independent transcription review; the cross-check below is recorded for every name it covers |
| A0: assembly | I0, L3, S1 | `CFSGIndex.Group`, `ClassificationStatement`, `classificationStatement_of_zero` | named proposition elaborates with no placeholder carriers |

### I0: indices and Mathlib glue

Build `PrimePower`, `LieTypeIndex`, `LieTypeIndex.InStandardRange`,
`LieTypeIndex.IsDuplicateRepresentative`, `LieTypeIndex.Valid`, `ValidLieTypeIndex`,
`LieTypeIndex.UsesHalfFrobenius`, `SuzukiReeIndex`, `GraphTwistedIndex`, `SporadicName`, and
`CFSGIndex`. Keep parameters as data rather than encoding the list as a large disjunction. Only
`ValidLieTypeIndex` may be passed to a Lie-type carrier or endomorphism, only `SuzukiReeIndex` to a
half-Frobenius, and only `GraphTwistedIndex` to a diagram permutation or graph automorphism, so that
no branch of any of the three is a value invented to fill a hole.

`UsesHalfFrobenius` is named for what it selects. It is not `IsExceptional`: the exceptional Dynkin
types are `E₆`, `E₇`, `E₈`, `F₄`, and `G₂`, and the predicate is false on all of them. Nor is it "has
an exceptional isogeny", which `B₂(q)` in characteristic two does whether or not its Steinberg map
uses one.

Build the numbered data read off an index. `ValidLieTypeIndex.dynkinType` names the underlying
untwisted diagram as the root-systems roadmap's `DynkinType`, `dynkinType_valid` proves it valid, and
`.rank` is then *defined* as `d.dynkinType.rank` rather than tabulated again, so every `Fin d.rank`
in this roadmap is an index into the upstream Bourbaki numbering. `.characteristic`,
`characteristic_prime`, and `.fieldOrder` complete the numeric data, and `.Closure` is
`AlgebraicClosure (ZMod d.characteristic)`, so its `Field`, `IsAlgClosed`, and `CharP` instances come
from Mathlib.

Then the pinned permutations `graphPermA`, `graphPermD`, `graphPermE6`, `trialityPermD4`,
`lengthPermRankTwo`, and `lengthPermF4`. There is deliberately no table of exceptional exponents:
which simple roots are long is `DynkinType.IsLongSimpleRoot` upstream, and L2's convention is stated
against it, so a second table here could only disagree with the diagram. These carry the conventions
of L1 and L2 and need nothing from Layer 9, so they land here rather than waiting on L0.

Consume Mathlib's existing `ZMod`, `Multiplicative`, `alternatingGroup`, `FreeGroup`,
`PresentedGroup`, `Subgroup.center`, `commutator`, quotient groups, `GaloisField`, finite-field
Frobenius, and algebraic closures. Provide the elementary coercions and group instances needed for
the final type to elaborate, but do not add `Finite` or `IsSimpleGroup` instances for a candidate.

Completion means that the small-field exclusions and duplicate table have executable examples, the
sporadic enumeration has cardinality 26, and the shape of `ClassificationStatement` elaborates in
`Suggested.lean` against the target signatures. The actual definition is accepted only at A0, after
the target carriers cease to be placeholders.

### L0: explicit pinned Chevalley--Demazure groups

For every underlying untwisted Dynkin type, construct the simply connected split reductive group
scheme over `ℤ` with a pinning, base-change it to the relevant characteristic, and take its points
over an algebraic closure of `𝔽_p`. This must be an explicit Chevalley--Demazure construction, not
the existence half of the classification of reductive groups.

Consume, rather than duplicate:

- [root systems, Weyl groups, and the Cartan--Killing classification](../RepresentationTheory/RootSystems/README.md),
  whose Layer 6 gives the pinned Bourbaki numbering and, for each valid `DynkinType`, a named simply
  connected root datum over `ℤ`;
- [reductive algebraic groups](../ReductiveGroups/README.md), whose Layer 9 gives pinned
  Chevalley--Demazure group schemes over `ℤ`, base change, points, and root subgroups.

It is those two layers specifically, and not the existence theorems beside them. The root-systems
realization target `exists_rootPairing_of_dynkinType` is an existence statement about a
`RootPairing` over `ℚ`, and Layer 8's "Chevalley existence" is likewise an existence theorem, so a
carrier could only be extracted from either by `Classical.choose`, which the rule above forbids.
`DynkinType.simplyConnectedRootDatum` and the Layer 9 constructions are what a consumer needing a
named carrier uses instead.

The declarations L0 consumes are:

- `DynkinType.simplyConnectedRootDatum` and `DynkinType.simplyConnectedBase`, reached through
  `ValidLieTypeIndex.dynkinType` and `dynkinType_valid`, together with the Bourbaki numbering their
  `Fin` indices carry (root systems Layer 6);
- the pinned Chevalley--Demazure group scheme over `ℤ` (reductive groups Layer 9);
- base change to the prime field and its algebraic closure (Layer 9);
- the group of algebraic-closure-valued points (Layer 9);
- root-subgroup maps `x_α` and the equations expressing their compatibility with the pinning
  (Layer 9).

The output is the actual body of `ValidLieTypeIndex.AmbientGroup`, its `Group` instance,
`ValidLieTypeIndex.Closure`, and `ValidLieTypeIndex.simpleRootSubgroup`. The ambient group is
generally infinite. A reviewer must be able to follow each carrier through these named
constructions; a theorem that merely asserts that a suitable pinned group exists is not a
substitute.

The uniform pinned route is the construction, for every family including the six classical ones,
even though matrices could define those earlier. Defining the classical branches as explicit `SL`,
`SU`, `Sp`, and orthogonal matrix groups is not a fallback held in reserve here: it would take them
out of the `AmbientGroup`, `steinberg`, `FixedPoints` route that L0 to L3 exist to build, and would
carry no obligation that the two agree. Deciding otherwise is a decision to make in this roadmap,
before the work starts, not a contingency to leave open inside L0.

### L1: ordinary and graph-twisted Steinberg maps

Let `Frob_q` be the endomorphism induced on points by `x ↦ x ^ d.fieldOrder` on the algebraic
closure. Use the following exact maps:

| Families | Steinberg map | Required relation |
| --- | --- | --- |
| `A`, `B`, `C`, `D`, `E₆`, `E₇`, `E₈`, `F₄`, `G₂` | `Frob_q` | definition of field Frobenius |
| `²A`, `²D`, `²E₆` | `γ₂ ∘ Frob_q` | `γ₂ ^ 2 = 1` and `γ₂` commutes with `Frob_q` |
| `³D₄` | `γ₃ ∘ Frob_q` | `γ₃ ^ 3 = 1` and `γ₃` commutes with `Frob_q` |

The `q` here is the small-field GLS/ATLAS parameter fixed above.

Number the simple roots by the Bourbaki labels of the underlying untwisted diagram, and place
Bourbaki node `i` at `Fin` index `i - 1`, so that a rank-`n` diagram is indexed by `Fin n` running
from `0` to `n - 1`. This zero-based offset is the one thing an implementor is most likely to get
wrong, so the permutations are pinned as `Fin` data rather than as prose:

| Family | Underlying diagram | Permutation of `Fin n` |
| --- | --- | --- |
| `²A_n` | `A_n` | `Fin.revPerm`, the reversal `j ↦ n - 1 - j` |
| `²D_n` | `D_n` | `Equiv.swap (n - 2) (n - 1)`, the two fork nodes |
| `²E₆` | `E₆` | `Equiv.swap 0 5 * Equiv.swap 2 4`, fixing Bourbaki `2` and `4` (Bourbaki `1 ↔ 6`, `3 ↔ 5`) |
| `³D₄` | `D₄` | the three-cycle `(0 2 3)` on the outer nodes, fixing the centre, `Fin` index `1` |
| the untwisted families | itself | `1`, so `γ` is the identity |

The table is exhaustive for `GraphTwistedIndex`, which is what `diagramPerm` and `graphAut` take.
The Suzuki--Ree and Tits branches do not appear because they are not in that subtype: their Steinberg
map is an odd power of the half-Frobenius and consumes no diagram permutation, so there is no value
to invent for them.

Each permutation must be proved to be an automorphism of the corresponding Cartan matrix. The
defining equations are

```text
γ (x_α(t)) = x_{γ α}(t)      for α simple,
Frob_q (x_α(t)) = x_α(t^q)   for every root α.
```

The restriction of the first equation to simple roots is not a weakening, and it must not be
strengthened. A pinning normalizes the root-subgroup parameters on the simple root subgroups, and
`γ` is then the unique automorphism with that action. That uniqueness is the isomorphism theorem for
pinned groups, which is a Layer 9 target upstream and is cited here rather than reproved. On a
general root the equation reads `γ (x_α(t)) = x_{γ α}(ε_α t)` with
`ε_α = ±1` forced by the Chevalley structure constants, and the signs cannot all be normalized to
`1` at once: the type-`A` graph automorphism `X ↦ -J Xᵀ J` of `sl_n` already shows this. Record the
general-root form as a consequence of the construction, never as a requirement on the pinning.

### L2: Suzuki--Ree Steinberg maps

The exceptional isogeny itself is **not** built here. For `X = B₂` in characteristic two, `G₂` in
characteristic three, and `F₄` in characteristic two, the special isogeny `τ_X` of pinned group
schemes, its action on the long and short root subgroups, and

```text
τ_X ^ 2 = Frob_p
```

are Layer 9 targets in the [reductive-groups roadmap](../ReductiveGroups/README.md), which says of
them that they are statements about group schemes and belong there rather than in any consumer. That
is right, and this lane consumes them.

What L2 owns is everything between that isogeny and a finite group: selecting `τ_X` for a given
`SuzukiReeIndex`, checking that the upstream isogeny is the one this roadmap's conventions describe,
and taking the odd power. For the constructor parameter `m`, define

```text
steinberg(m) = τ_X ^ (2m + 1),
steinberg(m) ^ 2 = Frob_(p ^ (2m + 1)).
```

Thus the fixed groups are `²B₂(2^(2m+1))`, `²G₂(3^(2m+1))`, and
`²F₄(2^(2m+1))`. The Tits constructor is the `F₄`, `m = 0` map `τ_F₄`; the other constructors have
`m ≥ 1`. Do not define these branches as `τ_X ∘ Frob_q`: the odd power of the half-Frobenius is the
pinned construction.

The square relation is inherited, not proved here, and it is not what identifies `τ_X`. What
identifies it is its action on the numbered simple root subgroups. Writing `ᾱ` for the image of the
simple root `α` under the length-exchanging map,

```text
τ_X (x_α(t)) = x_{ᾱ}(t)      for α long,
τ_X (x_α(t)) = x_{ᾱ}(t^p)    for α short.
```

The two exponents multiply to `p` along either composite, which is what makes `τ_X ^ 2 = Frob_p`
come out. Attaching `1` to the long roots and `p` to the short ones is a genuine convention: the
opposite assignment also squares to `Frob_p`, so leaving it to the implementor leaves the branch
undetermined. Take the assignment above.

Which simple roots are long is not restated here either. `DynkinType.IsLongSimpleRoot` in the
root-systems roadmap pins it, and the convention above is stated against that predicate, as
`SuzukiReeIndex.exponent_of_isLongSimpleRoot` and its negative counterpart. In the pinned Bourbaki
numbering that predicate makes `B₂` index `0` long, `G₂` index `1` long, and `F₄` indices `0` and `1`
long, so the convention reads:

| `X` | `p` | Length-exchanging map | Exponent by index |
| --- | --- | --- | --- |
| `B₂` | 2 | `Equiv.swap 0 1` | `α₁` long, so `0 ↦ 1` and `1 ↦ 2` |
| `G₂` | 3 | `Equiv.swap 0 1` | `α₂` long, so `0 ↦ 3` and `1 ↦ 1` |
| `F₄` | 2 | `Fin.revPerm`, the reversal | `α₁, α₂` long, so `0, 1 ↦ 1` and `2, 3 ↦ 2` |

Those three rows are worked consequences of the upstream predicate, not a second definition of it.
The length map must be proved to exchange long and short simple roots, which is
`SuzukiReeIndex.isLongSimpleRoot_lengthPerm`.

Mathlib has a separate Suzuki construction,
[feat(GroupTheory/SpecificGroups/Suzuki): define Suzuki groups](https://github.com/leanprover-community/mathlib4/pull/42043):
`suzukiGroup (n : ℕ) : Subgroup (GL (Fin 4) (GaloisField 2 (2 * n + 1)))`, the closure of explicit
four-by-four unipotent and Weyl matrices. It is a different object from this lane's, not the fixed
points of `τ_{B₂} ^ (2m + 1)` in a pinned ambient group, and its `n` is unrestricted, so
`suzukiGroup 0` is the solvable `Sz(2)`.

The pinned construction is the definition here, and the `suzuki` branch stays inside the uniform
`AmbientGroup`, `steinberg`, `FixedPoints`, derived-subgroup-modulo-centre route that L0 to L3
exist to build. Moving that one branch onto a matrix group would take it out of that route with no
stated obligation that the two agree, which is worse than a little duplication.

That leaves the two constructions unrelated, and relating them is real work, so it is the milestone
`L4` rather than a promise to add a target later. `L4` depends on material outside this project,
which is why it is last and separately claimable. The `m ≥ 1` restriction is this roadmap's
responsibility either way, since `suzukiGroup 0` is the solvable `Sz(2)`.

### L3: fixed points and the simple-group candidate

For an endomorphism `F : G →* G`, define the fixed subgroup as `F.eqLocus (MonoidHom.id G)`. For
every valid index `d`, set

```text
H_d = fixedSubgroup d.steinberg
d.Group = [H_d, H_d] / Z([H_d, H_d]).
```

Taking the derived subgroup is what handles the small cases where `H_d` is not perfect, and the Tits
group is the one such case that survives the range restrictions: `H` there is `²F₄(2)` and `[H, H]`
is the simple group `²F₄(2)'`. Quotienting by the centre then does nothing in that branch, since
`Z(²F₄(2)')` is trivial. The centre is nonetheless the centre of the derived subgroup and not of
`H_d`, which is the reading that makes the two steps compose in the stated order on every branch.

Completion requires every branch of `ValidLieTypeIndex.steinberg` to unfold to the L1 or L2 maps and
`ValidLieTypeIndex.Group` to carry a `Group` instance. No finiteness or simplicity proof is involved.

Mathlib's [`(B, N)`-pairs](https://github.com/leanprover-community/mathlib4/pull/40363) are related
structure theory and not a dependency: this roadmap does not prove Bruhat decomposition, simplicity,
or recognition.

### S0: auditable presentation data and source selection

There are two forms, and it matters which is which. The **stored** form of a relator is a `Relator`
expression, built from generator, inverse, product, power, and commutator constructors. The
**semantic** form is a left-to-right list of signed generator indices, produced from the stored form
by `Relator.toWord` and read into `FreeGroup (Fin n)`. The associated group is

```lean
PresentedGroup {r | r ∈ relators.map PresentationWord.toFreeGroup}.
```

The expression form is stored rather than the flat one because published relators are written with
powers and commutators, not as flat letter strings: `(ab)^11`, `[a,b]^5`, and the Monster's spider
relator `(a b₁ c₁ a b₂ c₂ a b₃ c₃)^10`. Expanding those by hand into signed letters makes the longest
and most error-prone relators the least reviewable, which is the opposite of what this lane is for.
Equally, do not store relators as opaque nested `FreeGroup` expressions: the point of both forms is
that they are readable in diffs, importable from source data, and countable.

A reviewer checks the stored expression against the published source, and the group is built from the
compiled word. So `Relator.toWord` sits between what was checked and what was defined, and
`Relator.toWord_toFreeGroup`, which says the compiled word denotes what the expression denotes, is
part of S0 rather than an afterthought. Without it the transcription review has a step in it that
nothing justifies.

Store generator names, an exact bibliographic or stable database locator, the generator convention,
transcription notes, and the expected generator and relator counts with the relators. The arity is
the length of the generator-name list and is not recorded twice; both counts are then decidably
checkable against the transcribed data.

Do not carry a checksum field. A checksum with no pinned normal form, no named algorithm, and no
function to recompute it against cannot be checked by a reviewer or by the kernel, so it reads like
a check without being one. The two counts are real checks, and everything beyond them rests on the
independent read-through below.

Before transcribing, create a 26-row source manifest. Each row records the name, exact source,
page/theorem or stable identifier, generator names, expected generator and relator counts,
transcription artifact, and review status. A database entry labelled a *semi-presentation* or a set
of relations for checking standard generators is not a presentation of the abstract group and must
be rejected. For comparison, the ATLAS
[Monster page](https://brauer.maths.qmul.ac.uk/Atlas/v3/spor/M/) labels its generator-checking
relations a semi-presentation, while the
[M₂₂ presentation page](https://brauer.maths.qmul.ac.uk/Atlas/v3/pres/M22G1-P1) explicitly gives a
group presentation. Record which kind of source each manifest row uses, and cite for each row a
source in which the presentation is *proved* to define the named group, not merely asserted to.

### S1: the twenty-six sporadic presentations

Fill every `SporadicName.presentation` branch with the complete signed relator words from the S0
manifest. Short presentations are preferred only when the generator convention is fully specified;
auditable data is more important than a uniform style.

The Monster must receive a genuine finite presentation, and one exists, so neither of the two
tempting substitutes is acceptable. Coxeter-style `Y₅₅₅` relations plus the spider relation present
the Bimonster `M ≀ 2`, not `M`; `M` sits inside it at index `2·|M|`, and no presentation of `M`
follows from that in any usable form. ATLAS-style semi-presentations merely recognize generators in
an already available group, and the ATLAS Monster page carries only one of those. Use instead the
`Y₄₄₃` presentation: the 12 nodes of that diagram, the Coxeter relations, the spider relation, and
`Z = 1` for the central involution `Z`, giving 12 generators and 80 relators. The theorem is
Norton's (1990), simplified by Ivanov (1999); the explicit word list is on J. N. Bray's
[Monster presentation page](https://webspace.maths.qmul.ac.uk/j.n.bray/web/Pres/Mnst.html), which
displays `M × 2` and becomes `M` on adding `Z = 1`. Farooq, Norton, and Wilson,
[*A presentation of the Monster and a set of matrices which satisfy it*](https://doi.org/10.1016/j.jalgebra.2013.01.015),
J. Algebra **379** (2013) 432-440, is an alternative.

Apply the same standard to the Baby Monster, whose `Y₄₃₃` presentation was conjectured in the ATLAS
and proved by Ivanov, and to every other branch. The Fischer groups come from smaller Y-diagrams
with the spider relation.

Do not assume a presentation is a link away for the rest. Bray's
[presentation pages](https://webspace.maths.qmul.ac.uk/j.n.bray/web/Pres/) carry the Monster
directly, but several entries are 1996 stubs that record only the order and a pointer to the ATLAS:
the Baby Monster page states `Length ??, 2-generator, ?-relator`, and `Co1`, `Co2`, `Co3` are the
same shape. The [ATLAS v3](https://brauer.maths.qmul.ac.uk/Atlas/v3/) they point to has a
presentations section for some sporadics (`M11`, `J1`) and none for others (`B`, `Co1`, `M24`,
`HS`), where it offers standard generators and a **semi-presentation** instead. A semi-presentation
is not a presentation: it pins the generators up to automorphism so that standard generators can be
checked, and it does not define the group. Transcribing one as a presentation is exactly the error
this lane's review discipline exists to catch.

So the first S0 task is to find, for each of the 26 names, a source that gives an actual
presentation, and to record in the manifest both that source and the names for which the first pass
turned one up. Do not assume that first pass reaches all twenty-six.

That remainder is an intermediate research artifact and not a permitted end state. S0 closes only
when all 26 rows carry a full admissible source, so a name that resists the obvious places is a
reason to widen the search, to the coset-enumeration literature and the machine-computed
presentations in the Havas--Sims tradition. A name that still resists is a roadmap issue to be
raised, and the roadmap is then wrong and needs a different construction for that name. It is not a
gap S0 may close over, because S1 must fill every branch and A0 depends on S1.

For each transcription, check the recorded relator count against the transcribed list, and require
an independent source-to-Lean read-through before marking the row reviewed. This lane does not prove
that the presented group has the expected order, is nontrivial, finite, simple, or isomorphic to
another construction.

Where an independent explicit construction of the same group exists, use it. The permutation-group
development cited below covers fourteen of the twenty-six names, with order and simplicity proved, so
for those names a reviewer can ask whether the transcribed relators hold of its generators, which is
a check on the relators that no amount of reading the source twice provides. Recording the outcome of
that comparison, for every name it covers, is part of closing an S1 row. It is a review artifact
rather than a Lean target, since making it one would mean importing that development, which the
provenance section conditions on coordination with its author.

Be precise about what the endpoint does and does not police, because it is less than it looks.
`ClassificationStatement` says that every finite simple group is isomorphic to `i.Group` for some
`i`, so it depends only on the set of isomorphism types in the image of `i ↦ i.Group`. It never
mentions which index carries which group. Three things follow.

It does not pin a single name. Interchanging the `M` and `B` presentations leaves the proposition
unchanged and still true, with both branches misnamed; so does any permutation of the twenty-six.
Nothing in the endpoint distinguishes `SporadicName.M` from any other sporadic name.

It does detect a group falling out of that image. If one branch presents a different isomorphism
type and everything else is right, the group it was named for is isomorphic to no branch, since the
sporadic groups are pairwise nonisomorphic and are neither alternating nor of Lie type, and the
proposition is false.

It is not monotone in the number of errors, so "errors can only make it false" is wrong as an
unqualified claim. Two errors can cancel, as the swap shows. A single edit can even turn a false
statement true, by supplying the one missing isomorphism type in a list where the old value was
redundant.

So transcription correctness is an obligation on review, not something the endpoint enforces, and
that is exactly why S1 asks for the count checks, the independent read-through, and the cross-check
above. The proposition will not do that work.

There is a sharper-sounding argument at the relator level, and it is false, so do not reach for it
either. It is tempting to say that dropping a relator gives a proper cover of the intended group and
that adding or corrupting one gives a proper quotient, hence the trivial group, since each group on
the list is simple. None of the three holds. Published presentations are often redundant, so a
dropped relator may change nothing; an added relator that already holds also changes nothing; and a
corrupted relator, `r` replaced by some `r'`, gives neither a cover nor a quotient, so the result can
be any group at all, including an infinite one. A transcription error is not constrained to produce
something recognizably broken.

### A0: assemble and state CFSG

Define `CFSGIndex.Group` by cases, supply its dependent `Group` instance, and define the named
`ClassificationStatement` displayed at the top. Do not replace the existential by a disjunction of
predicates or by `∃!`.

Prove `classificationStatement_of_zero`, that `ClassificationStatement.{0}` implies
`ClassificationStatement.{u}`. A finite `G : Type u` is equivalent to `Fin (Nat.card G)`, and its
group and simplicity structure transport along that equivalence. Without this the claim that `.{0}`
is the substantive instance is one a downstream development cannot act on.

Completion requires the universe-polymorphic statement to elaborate with no placeholder carrier, no
raw invalid Lie index reaching a carrier-valued definition, and no `Finite` or `IsSimpleGroup`
instance assumed for `i.Group`. Review the four branches by following their definitions to `ZMod`,
`alternatingGroup`, the pinned fixed-point construction, or the audited presentation data.

## Existing work and provenance

The design was discussed in the Lean Zulip topic
[“Formalized statement of CFSG?”](https://leanprover.zulipchat.com/#narrow/channel/583339-AI-authored-projects/topic/Formalized.20statement.20of.20CFSG.3F/with/614411324).
Thomas Browning identified fixed points of algebraic groups over finite fields as the proper
definition of the Lie-type families; Kevin Buzzard suggested finite presentations as a manageable
definition of the sporadics even before their finiteness is proved. Those are the two construction
choices pinned here.

[FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean) is a Lean 4 development
that builds a good part of this list by a different route: each group is the subgroup of
`Equiv.Perm (Fin n)` generated by named permutations, and its order and simplicity are *proved*, by
kernel-checked stabilizer chains with an axiom audit admitting only `propext`, `Classical.choice`,
and `Quot.sound`. It covers `M11 M12 M22 M23 M24 J1 J2 HS McL Co2 Co3 Suz
Fi22 He`, together with `L2(11) L3(4) U3(3) U4(2) U5(2) U6(2) G2(4)`.

That is stronger evidence per group than a transcribed presentation, which nothing here verifies,
and it should be used as a cross-check: a sporadic name it covers gives an independent handle on
whether our relator words present the group we think they do. It is not the construction this
roadmap adopts, because it does not reach the top of the list. The smallest faithful permutation
representations of `B` and `M` have degrees far beyond anything expressible as Lean source, which is
why the sporadics are defined here by presentations throughout. Anyone reusing that code must first
coordinate with its author: the repository carries no licence file, so the repository-level rule on
integrating existing work applies before anything is copied or adapted.

The old Lean 3 Formal Abstracts file
[`group_theory/classification.lean`](https://github.com/formalabstracts/formalabstracts/blob/b0173da1af45421239d44492eeecd54bf65ee0f6/src/group_theory/classification.lean)
is useful provenance for the four-way shape of the final statement. It is incomplete and mostly
organizes isomorphism predicates; it is not the API to port. In particular, this roadmap replaces
its predicates by actual group-valued definitions.

Mathematical references for the construction and naming conventions include:

- R. W. Carter, *Simple Groups of Lie Type*, for the fixed-point constructions;
- R. W. Carter, *Finite Groups of Lie Type: Conjugacy Classes and Complex Characters*, for
  Steinberg endomorphisms and twisted families;
- [*On the cohomology of the Ree groups and kernels of exceptional isogenies*](https://arxiv.org/abs/2108.06291),
  for the formulation `τ² = Frob_p` and the odd half-Frobenius powers;
- D. Gorenstein, R. Lyons, and R. Solomon, *The Classification of the Finite Simple Groups*,
  for the conventional list and low-rank identifications;
- J. H. Conway et al., *Atlas of Finite Groups*, and R. A. Wilson et al., the
  [ATLAS of Finite Group Representations](https://brauer.maths.qmul.ac.uk/Atlas/v3/), for sporadic
  naming and source data. Every transcribed presentation must also cite its own exact source.
