# Roadmap: root systems, Weyl groups, and the Cartan-Killing classification

Mathlib has a large, actively developed theory of **abstract root systems**
(`Mathlib/LinearAlgebra/RootSystem/*`) and a substantial theory of **Coxeter groups**
(`Mathlib/GroupTheory/Coxeter/*`), but the two are not yet connected, and the payload that
makes the subject a *classification* is absent. On the root-system side there is the
unifying `RootPairing` structure, the `IsRootSystem`/`IsReduced`/`IsCrystallographic`/`IsIrreducible`
predicates, bases and simple roots (`RootPairing.Base`), the Cartan matrix
(`RootPairing.Base.cartanMatrix`) with its nondegeneracy and the striking fact that a root system is
**determined up to isomorphism by its Cartan matrix** (`equivOfCartanMatrixEq`), root strings
(`chainTopCoeff`), the canonical positive-definite form (`posRootForm`,
`posRootForm_rootFormIn_posDef`), and the Weyl group as a group of automorphisms
(`RootPairing.weylGroup`). On the Coxeter side there is `CoxeterMatrix`, the presented
`CoxeterMatrix.Group`, `CoxeterSystem`, the length function `CoxeterSystem.length`, reduced words,
descents, reflections and inversion sequences, and the explicit finite-type Coxeter matrices
`CoxeterMatrix.A`, `.B`, `.D`, `.I`, `.E₆`, `.E₇`, `.E₈`, `.F₄`, `.G₂`, `.H₃`, `.H₄`.

What is missing is exactly the spine that turns this into the Cartan-Killing story. **Nothing
identifies `RootPairing.weylGroup` as a `CoxeterSystem`** on the simple reflections: the order of a
product of two simple reflections, the fact that the simple reflections generate, and the Coxeter
presentation (Tits' theorem, that there are no relations beyond the braid relations) are all
unbuilt. On the pure Coxeter side, **Matsumoto's theorem and the strong exchange condition are
explicit TODOs** (`Coxeter/Basic.lean`: "State and prove Matsumoto's theorem"). There is **no theory
of positive roots as a set, no Weyl chambers, no dominant (fundamental) chamber and no proof that it
is a fundamental domain**, no longest element. And there is **no Dynkin diagram and no
classification**: Mathlib's `CartanMatrix.lean` names the Dynkin diagram in its docstrings and proves
the connectedness characterization (`induction_on_cartanMatrix`), and `Coxeter/Matrix.lean` lists the
finite irreducible Coxeter matrices while stating "we do not prove" that these are all of them, but the
theorem that an irreducible reduced crystallographic root system is one of
`Aₙ, Bₙ, Cₙ, Dₙ, E₆, E₇, E₈, F₄, G₂` is nowhere in the library.

This roadmap builds that spine, ending at the **Cartan-Killing classification**: a finite list of
Dynkin types, a proof that every irreducible reduced crystallographic finite root system realizes
exactly one valid type (existence + uniqueness), with the final isomorphism-from-Cartan-matrix step
supplied by `equivOfCartanMatrixEq`, and the identification of the Weyl group of each as a concrete
Coxeter/reflection group. The two load-bearing
theorems along the way are the **Coxeter presentation of the Weyl group** (`weylCoxeterSystem`) and
the **classification of finite-type Cartan matrices** (`DynkinType`). It is the shared foundation for
[the highest-weight representation theory roadmap](../LieHighestWeight/README.md) (which needs bases,
dominant chambers, the Weyl group action, and the classification to state and prove the
theorem of the highest weight and Weyl character formula) and for
[the classical groups roadmap](../ClassicalGroups/README.md) (which needs the `Aₙ`/`Bₙ`/`Cₙ`/`Dₙ`
root systems and their Weyl groups `Sₙ`, `Sₙ ⋉ (ℤ/2)ⁿ`, and so on).

**Scope boundary.** This roadmap stops at the root system, its Weyl group, chambers, and the
classification. The weight and root lattices, the coweight and coroot lattices, the fundamental
weights, dominant integral weights, and `ρ` - the lattice apparatus that the Weyl character and
dimension formulas run on - are **not** built here; they belong to
[the highest-weight roadmap](../LieHighestWeight/README.md), which layers them on top of the chambers
and the Weyl-group action supplied here.

Suggested home: `TauCeti/LinearAlgebra/RootSystem/` (the geometry, chambers, Coxeter presentation, and
classification) and `TauCeti/GroupTheory/Coxeter/` (the strong exchange condition and Matsumoto's
theorem, which are group-theory statements independent of root systems and are upstreamable to
Mathlib on their own).

## Standing conventions

- **`RootPairing` is primary; `IsRootSystem` is the mixin.** Mathlib has refactored so that
  `RootPairing ι R M N` is the *structure* (two perfectly paired modules `M`, `N` over a commutative
  ring `R`, an `ι`-indexed family of roots `root : ι ↪ M`, coroots `coroot : ι ↪ N`, and reflection
  permutations), and `RootPairing.IsRootSystem` is a *class* asserting the roots and coroots span
  (`RootPairing.IsRootSystem` deprecated-aliases the old `RootSystem`). Use this vocabulary
  throughout, never a private `RootSystem` structure. `RootDatum X₁ X₂ = RootPairing ι ℤ X₁ X₂` is the
  integral form. State every result at the generality it needs, adding mixins
  (`[P.IsRootSystem]`, `[P.IsReduced]`, `[P.IsCrystallographic]`, `[P.IsIrreducible]`, `[Finite ι]`)
  rather than bundling them into one class. Do not reintroduce a monolithic "root system" datum.
- **The default arena for the classification is finite, reduced, crystallographic.** The
  Cartan-Killing classification is a theorem about `RootPairing ι R M N` with `[Finite ι]`,
  `[P.IsRootSystem]`, `[P.IsReduced]`, `[P.IsCrystallographic]` (`= P.IsValuedIn ℤ`), and, for the
  irreducible pieces, `[P.IsIrreducible]`. Work over a field `R` of characteristic zero
  (`[CharZero R] [IsDomain R]` is what Mathlib's Cartan-matrix lemmas take); the Cartan entries then
  live in `ℤ` via `pairingIn ℤ`. Keep `IsCrystallographic` explicit: the classification is false
  without it (there are non-crystallographic finite reflection groups `H₃`, `H₄`, `I₂(m)`, which is
  why the Coxeter classification is strictly longer than the Cartan one).
- **The geometry (chambers, dominant weights) is stated over an ordered field, by default `ℝ`.** Weyl
  chambers and the fundamental-domain statement need an order on the coefficients, so pin
  `P : RootPairing ι ℝ M N` (or base-change a rational root system to `ℝ`) for the chamber layer, and
  consume the canonical positive-definite form `posRootForm ℝ` /
  `posRootForm_rootFormIn_posDef`. Do **not** state the chamber geometry over an unordered ring.
- **The Weyl group is `RootPairing.weylGroup`, a `Subgroup (Aut P)`; the target vocabulary is
  `CoxeterSystem`.** Mathlib defines `P.weylGroup := Subgroup.closure (range (Equiv.reflection P))`
  inside `Aut P = RootPairing.Equiv P P`, with `weylGroup.ofIdx P i` the `i`-th simple reflection as a
  group element and `weylGroupToPerm : P.weylGroup →* Equiv.Perm ι` its action on indices. Reuse these
  rather than a fresh group. The central construction of this roadmap, `weylCoxeterSystem`, produces a
  `CoxeterSystem (coxeterMatrixOfBase b) P.weylGroup`: the *same* group, now equipped with the
  isomorphism to the presented Coxeter group. Downstream length/reduced-word/descent statements are
  then Mathlib's `CoxeterSystem.length`, `CoxeterSystem.IsReduced`, `CoxeterSystem.IsLeftDescent`,
  applied to `P.weylGroup`.
- **Simple roots come from a `RootPairing.Base`.** A base is `b : P.Base` with
  `b.support : Finset ι` the indices of the simple roots, `b.linearIndepOn_root`, and the
  closure conditions. Existence for finite crystallographic root systems is
  `RootPairing.Base.nonempty_base`. Positive roots are `{i | b.IsPos i}` where
  `b.IsPos i ↔ 0 < b.height i` (`RootPairing.Base.height`, `RootPairing.Base.IsPos`); the Cartan
  matrix is `b.cartanMatrix : Matrix b.support b.support ℤ`. Everything indexed by simple roots is
  indexed by `b.support`, never by an ad hoc `Fin n`, until the classification step pins a concrete
  reindexing to `Fin (rank)`.
- **Dynkin types are a finite enumeration with a validity predicate, and the classification is
  existence + uniqueness over the valid types.** `DynkinType` enumerates `A n`, `B n`, `C n`, `D n`,
  `E₆`, `E₇`, `E₈`, `F₄`, `G₂` with a `rank` and a standard integer Cartan matrix
  `DynkinType.cartanMatrix t : Matrix (Fin t.rank) (Fin t.rank) ℤ`. The enumeration is deliberately
  plain (bare `ℕ` constructors); the rank ranges `A n (n ≥ 1)`, `B n (n ≥ 2)`, `C n (n ≥ 3)`,
  `D n (n ≥ 4)` are carried by a `DynkinType.Valid` predicate, not baked into the constructors. These
  bounds eliminate the low-rank coincidences (`B₁ = C₁ = A₁`, `C₂ = B₂`, `D₂ = A₁×A₁`, `D₃ = A₃`) and
  the degenerate `A 0`, `B 0`/`B 1`, `C 0`–`C 2`, `D 0`–`D 3`; without them realization and uniqueness
  are literally false. "Classification" then means: (existence/realization) each **valid** `t` is the
  Cartan matrix of some irreducible reduced crystallographic finite root system, and (uniqueness) the
  Cartan matrix of such a root system reindexes to `DynkinType.cartanMatrix t` for a **unique valid**
  `t`. The final isomorphism step (from equal standard Cartan matrices to an isomorphism of root
  systems) is Mathlib's `equivOfCartanMatrixEq`. The `DynkinType.cartanMatrix` reindexing is oriented
  (a single simultaneous row/column relabelling), so `Bₙ` and `Cₙ`, whose standard Cartan matrices are
  transposes, stay distinct types.

## What Mathlib already has (consume)

- **The `RootPairing` structure and predicates** - `Mathlib/LinearAlgebra/RootSystem/Defs.lean`:
  `RootPairing`, `RootPairing.IsRootSystem`, `RootDatum`, `RootPairing.reflection` (as `M ≃ₗ[R] M`),
  `RootPairing.coreflection`, `RootPairing.reflectionPerm`, `RootPairing.pairing`,
  `RootPairing.coxeterWeight`, `RootPairing.IsOrthogonal`, `RootPairing.flip`.
- **Value subrings and crystallographic condition** - `.../RootSystem/IsValuedIn.lean`:
  `RootPairing.IsValuedIn`, `RootPairing.IsCrystallographic` (`= IsValuedIn ℤ`),
  `RootPairing.pairingIn`, `RootPairing.coxeterWeightIn`, `algebraMap_pairingIn`.
- **Reduced and irreducible** - `.../RootSystem/Reduced.lean` (`RootPairing.IsReduced`, with
  `isReduced_iff'`, `IsReduced.linearIndependent`, the four-Coxeter-weight dichotomy
  `linearIndependent_iff_coxeterWeight_ne_four`, and `pairingIn_two_two_iff` etc.),
  `.../RootSystem/Irreducible.lean` (`RootPairing.IsIrreducible`, `isIrreducible_iff_invtRootSubmodule`,
  `isSimpleModule_weylGroupRootRep`).
- **Bases and simple roots** - `.../RootSystem/Base.lean`: `RootPairing.Base` (`support`,
  `linearIndepOn_root/coroot`, `root_mem_or_neg_mem`), `Base.height`, `Base.IsPos`, `Base.IsPos.or_neg`,
  `Base.toWeightBasis`, `exists_root_eq_sum_nat_or_neg`, `exists_root_eq_sum_int`; existence
  `.../RootSystem/BaseExists.lean`: `RootPairing.Base.nonempty_base`, `Base.mk'`.
- **Cartan matrices** - `.../RootSystem/CartanMatrix.lean`: `RootPairing.Base.cartanMatrixIn`,
  `RootPairing.Base.cartanMatrix : Matrix b.support b.support ℤ`, `cartanMatrix_apply_same` (`= 2`),
  `cartanMatrix_le_zero_of_ne`, `cartanMatrix_mem_of_ne`, `cartanMatrix_nondegenerate`,
  `cartanMatrix_eq_neg_chainTopCoeff`, the connectedness characterization
  `induction_on_cartanMatrix`, and **`equivOfCartanMatrixEq`** - a root system is determined up to
  isomorphism by its Cartan matrix. This is the *final isomorphism step* of the classification: once
  the finite-type Cartan matrices are classified and a base is matched to a standard Cartan matrix, it
  produces the isomorphism. It is not itself the uniqueness argument: it does not classify finite-type
  matrices, prove independence of the base, or eliminate the low-rank coincidences, all of which are
  built here.
- **Root strings** - `.../RootSystem/Chain.lean`: `chainTopCoeff`, `chainBotCoeff`, `chainTopIdx`,
  `root_add_nsmul_mem_range_iff_le_chainTopCoeff`, `chainBotCoeff_add_chainTopCoeff_le_three`.
- **The canonical form and root lengths** - `.../RootSystem/RootPositive.lean`
  (`RootPairing.InvariantForm`, `RootPositiveForm`, `RootPairing.posForm`, `RootPairing.rootLength`,
  `rootLength_pos`, `zero_lt_pairingIn_iff`, `coxeterWeight_nonneg`),
  `.../RootSystem/Finite/CanonicalBilinear.lean` (`RootPairing.RootForm`, `Polarization`,
  `rootForm_self_sum_of_squares`), `.../RootSystem/Finite/Nondegenerate.lean`
  (`rootForm_nondegenerate`, `posRootForm`, `posRootForm_rootFormIn_posDef` - positive-definiteness of
  the canonical form on the root span).
- **The Weyl group** - `.../RootSystem/WeylGroup.lean`: `RootPairing.weylGroup` (`Subgroup (Aut P)`),
  `reflection_mem_weylGroup`, `weylGroup.ofIdx`, `weylGroup.induction`, `weylGroupToPerm`,
  `range_weylGroupToPerm`, `weylGroupRootRep`; `.../RootSystem/Hom.lean` for `Aut P`,
  `Equiv.reflection P i : Aut P`, `RootPairing.indexHom`.
- **The G₂ special case** - `.../RootSystem/Finite/G2.lean`: `RootPairing.IsG2` (extends
  crystallographic, reduced, irreducible), `IsNotG2`, `EmbeddedG2`, `IsG2.pairingIn_mem_zero_one_three`.
- **The Chevalley/Geck link to Lie algebras** - `.../RootSystem/GeckConstruction/*`:
  `GeckConstruction.lieAlgebra`, `GeckConstruction.cartanSubalgebra`, `equivRootSystem`. This is the
  hook the [highest-weight roadmap](../LieHighestWeight/README.md) consumes; it is not extended here.
- **Coxeter groups** - `Mathlib/GroupTheory/Coxeter/`: `CoxeterMatrix`, `CoxeterMatrix.Group`,
  `CoxeterSystem`, `IsCoxeterGroup`, `CoxeterSystem.simple`, `CoxeterSystem.wordProd`,
  `CoxeterSystem.lift`, `CoxeterSystem.alternatingWord` (`Coxeter/Basic.lean`);
  `CoxeterSystem.length`, `CoxeterSystem.IsReduced`, `exists_isReduced`, `length_mul_le`,
  `length_simple`, `IsLeftDescent`/`IsRightDescent`, `exists_leftDescent_of_ne_one`,
  `not_isReduced_alternatingWord` (`Coxeter/Length.lean`); `CoxeterSystem.IsReflection`,
  `IsLeftInversion`/`IsRightInversion`, `leftInvSeq`/`rightInvSeq` (`Coxeter/Inversion.lean`); the
  standard finite-type matrices `CoxeterMatrix.A/B/D/I/E₆/E₇/E₈/F₄/G₂/H₃/H₄` (`Coxeter/Matrix.lean`).

## What is missing (build here)

The **set of positive roots** and its inversion combinatorics - inversion sets of Weyl-group elements,
simple-root lowering, the fact that a simple reflection permutes the positive roots other than its own
(consuming Mathlib's `Base.IsPos.reflectionPerm`), and the **root-level exchange step** (appending a
simple reflection changes the inversion count by exactly one); the **order of a product of simple
reflections** and the **Coxeter matrix of a base** (`coxeterMatrixOfBase`); the theorem that the
**simple reflections generate the Weyl group**; the **Coxeter presentation**
`weylCoxeterSystem : CoxeterSystem (coxeterMatrixOfBase b) P.weylGroup` (Tits' theorem: the braid
relations are a *complete* set of relations, with completeness proved through the root-level exchange
condition - a nonempty reduced word has a nonempty inversion set, so acts nontrivially - **not** through
the faithfulness of the existing Weyl-group action, which is orthogonal to the kernel question); the
**strong exchange condition** and **Matsumoto's theorem** on the Coxeter side (both flagged as TODO in
Mathlib); the **length-equals-inversions** identity linking `CoxeterSystem.length` on `P.weylGroup` to
the number of positive roots made negative; **Weyl chambers** as sign-pattern cones, the **dominant
chamber**, and the theorem that the dominant chamber is a **fundamental domain** for the Weyl-group
action with the Weyl group acting **simply transitively on chambers**; the **longest element** `w₀` of
a finite Weyl group with `ℓ(w₀) = |Φ⁺|` and `w₀ Φ⁺ = Φ⁻`; **finiteness** of the Weyl group of a finite
root system (via the faithful action on the finite root index set);
the **`DynkinType` enumeration** with its standard Cartan matrices; the **finite-type Cartan-matrix
condition** (positive-definite symmetrizable) and its classification into the `DynkinType` list; the
**realization** of each `DynkinType` by an explicit root system; and the assembled **Cartan-Killing
classification** of irreducible reduced crystallographic finite root systems, together with the
identification of the classical Weyl groups (`Aₙ ↦ Sₙ₊₁`, `G₂ ↦ DihedralGroup 6`). None of this is
upstream.

`Suggested.lean` pins the load-bearing objects (`posRoots`, `inversions`,
`inversions_ncard_mul_ofIdx`, `coxeterMatrixOfBase`, `weylCoxeterSystem`, `dominantChamber`,
`longestElement`, `DynkinType`, `DynkinType.Valid`, `DynkinType.cartanMatrix`, `IsFiniteType`,
`existsUnique_dynkinType`, `exists_rootPairing_of_dynkinType`) and the milestones below as
`sorry`-targets, so each is claimable and the summit statements are machine-checked to be expressible
against the pinned Mathlib.

---

## The build, in layers

The ordering below is the dependency order. The root combinatorics of Layer 1 come first, because the
Coxeter presentation of Layer 2 is *built from* the positive-root sign changes and the exchange step,
not the other way round. The abstract Coxeter combinatorics of Layer 3 and the chamber geometry of
Layer 4 are then largely independent lanes.

### Layer 1: root combinatorics (positive roots, lowering, inversions, exchange)

Stated for `P` finite, reduced, crystallographic over a characteristic-zero field, with a base `b`,
indexed by root indices `ι` throughout. This layer is the combinatorial engine underneath the Coxeter
presentation, so it precedes it.

- **Positive and negative roots.** `posRoots b = {i | b.IsPos i}`, `negRoots b = {i | ¬ b.IsPos i}`;
  the partition into positive and negative (`Base.IsPos.or_neg`), the swap by root negation, and every
  `i ∈ posRoots b` a nonnegative integer combination of simple roots (`exists_root_eq_sum_nat_or_neg`).
  `posRoots b` is finite (`[Finite ι]`).
- **Simple-root lowering.** A positive root that is not a simple root is lowered in height by some
  simple reflection (`exists_mem_support_height_reflectionPerm_lt`), the base case of the positive-root
  induction (consume `Base.height`, `Base.IsPos.induction_on_reflect`). A simple reflection `sᵢ`
  permutes the positive roots other than `αᵢ` (consume `Base.IsPos.reflectionPerm`).
- **Inversion sets and the exchange step.** `inversions b w = {i | b.IsPos i ∧ ¬ b.IsPos (P.weylGroupToPerm w i)}`
  is the set of positive roots sent to negative roots by `w`. The **root-level exchange step**
  (`inversions_ncard_mul_ofIdx`) is that appending a simple reflection changes `(inversions b w).ncard`
  by exactly one; iterated, this is the exchange/deletion condition for the geometric action and the
  combinatorial core that Layer 2's generation and presentation consume. A companion pair of lemmas
  identifies these index-level inversions with the vector-root inversions `{α ∈ Φ⁺ | wα ∈ Φ⁻}`, so
  cardinalities are counting roots, not indices.
- **Finiteness of the Weyl group.** The permutation action `weylGroupToPerm` is faithful for a root
  system (the roots span, so an automorphism fixing every root index is the identity;
  `weylGroupToPerm_injective`), whence `Finite P.weylGroup` for finite `ι` (`finite_weylGroup`).
  Finiteness needs the spanning hypothesis `[P.IsRootSystem]`, not merely `[Finite ι]`: a subgroup
  generated by finitely many linear automorphisms need not be finite without it.

### Layer 2: the Weyl group as a Coxeter system

Built on Layer 1's inversion combinatorics.

- **The Coxeter matrix of a base.** `coxeterMatrixOfBase b : CoxeterMatrix b.support`, whose off-
  diagonal entry `m i j` is the order of `sᵢ sⱼ`, read off the Cartan product
  `b.cartanMatrix i j * b.cartanMatrix j i ∈ {0, 1, 2, 3}` (equivalently `coxeterWeightIn ℤ`): value
  `0 ↦ 2`, `1 ↦ 3`, `2 ↦ 4`, `3 ↦ 6`. That the product lands in `{0,1,2,3}`, so the entry is a genuine
  Coxeter order, needs the full reduced crystallographic finite-type context; the pinned signature
  carries `[Finite ι] [CharZero R] [IsDomain R] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]`,
  not `[P.IsCrystallographic]` alone (consume `chainBotCoeff_add_chainTopCoeff_le_three`,
  `coxeterWeight_nonneg`). Prove it is a genuine `CoxeterMatrix` (symmetric, diagonal `1`).
- **Simple reflections generate.** `⊤ = Subgroup.closure (range fun i : b.support => weylGroup.ofIdx P i)`
  as subgroups of `P.weylGroup`: every reflection is a product of simple reflections. Prove via the
  positive-root induction of Layer 1 (a positive non-simple root is lowered by some simple reflection).
- **The presentation (Tits' theorem).** `weylCoxeterSystem b : CoxeterSystem (coxeterMatrixOfBase b) P.weylGroup`.
  The braid relations `(sᵢ sⱼ)^{m i j} = 1` hold in `W` (from `coxeterMatrixOfBase`); the induced map
  from the presented group `(coxeterMatrixOfBase b).Group → P.weylGroup` (via `CoxeterSystem.lift`) is
  surjective (generation) and injective (**no further relations**). Injectivity is proved through the
  **root-level exchange condition** of Layer 1: a nonempty reduced word in the presented group maps to
  an element with a nonempty inversion set, so it moves some positive root to a negative root and is
  not the identity; hence the map has trivial kernel. This is a non-circular route - it does **not**
  appeal to faithfulness of the existing Weyl-group action, which says only that distinct elements of
  `P.weylGroup` act distinctly and is silent about the kernel of the map from the abstract presented
  group. This is the summit of the layer and the single hardest theorem in the roadmap.
- **Length equals inversions.** With `cs := weylCoxeterSystem b`, for `w : P.weylGroup`
  `cs.length w = (inversions b w).ncard`. In particular `cs.length (weylGroup.ofIdx P i) = 1` for
  simple `i`, and `cs.IsReduced` words correspond to reduced reflection expressions.

### Layer 3: the missing Coxeter combinatorics (upstreamable)

Stated for a general `cs : CoxeterSystem M W`, independent of root systems; these fill Mathlib's
declared TODOs and belong in `TauCeti/GroupTheory/Coxeter/`.

- **The strong exchange condition.** If `t` is a reflection (`cs.IsReflection t`) and
  `ℓ(t · π ω) < ℓ(π ω)` for a reduced word `ω`, then `t · π ω` is obtained by deleting exactly one
  letter of `ω`; the deleted letter is located by `leftInvSeq`. Derive the **deletion condition** (a
  non-reduced word can be shortened by deleting two letters) and the **exchange condition** as corollaries.
- **Matsumoto's theorem.** State it in two matching forms. The **relational form**: any two reduced
  words for the same `w : W` are connected by braid moves (`alternatingWord` swaps). The **lift form**
  that downstream users consume (`matsumoto`): a function `f : B → G` into a monoid that is constant on
  braid relations has `wordProd`-image depending only on `π ω` for reduced `ω`, so there is a
  well-defined "value of `w` along any reduced word". The braid-relation hypothesis is stated for all
  pairs `i i'`, so the finite and infinite `cM i i'` entries are handled uniformly. Consume
  `not_isReduced_alternatingWord`, the strong exchange condition, and `CoxeterSystem.lift`.
- **Consequences.** The Bruhat order's basic well-definedness, and the identity
  `∑_{w ∈ W} qℓ(w)` (the length generating function) is a well-defined element of `ℤ[q]` for finite
  `W` - the Poincaré polynomial. This is a companion result, not on the critical path: the order of
  the Weyl group is `Nat.card P.weylGroup` directly (Layer 4), and the type-specific product formulas
  would additionally need the exponents/degrees, which are out of scope here.

### Layer 4: chambers, the fundamental domain, and the longest element

Stated for `P : RootPairing ι ℝ M N` finite, reduced, crystallographic, with a base `b`. Over `ℝ` the
canonical form is positive-definite and the chambers are sign-pattern cones, so this layer needs no
topology.

- **Weyl chambers as cones.** The **dominant chamber** `dominantChamber b = {x : M | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`
  and its interior `{x | ∀ i ∈ b.support, 0 < P.coroot' i x}`, defined directly as the sign-pattern
  cones of the simple coroot functionals; the general chambers are the `W`-translates of the dominant
  chamber. Defining chambers as cones (rather than as connected components of a hyperplane complement)
  keeps the layer inside `[Module ℝ M]` without importing topology or finite-dimensionality; the
  identification with topological components is deferred and not needed downstream.
- **The fundamental domain.** Every point of `M` is `W`-conjugate into `dominantChamber b`
  (`exists_mem_dominantChamber`). A point of the *open* dominant chamber has trivial stabilizer, stated
  as two theorems: if `x` is interior and `w • x` is again dominant then `w • x = x`
  (`eq_of_mem_dominantChamber_interior`), and an element fixing an interior point is the identity
  (`eq_one_of_smul_eq_self_of_interior`). Together with the existence statement, this is the closed
  dominant chamber being a **strict fundamental domain** and `W` acting **simply transitively on the
  open chambers**: a dominant representative exists and is unique. This is the geometric heart used by
  highest-weight theory.
- **The longest element.** For finite `ι` the Weyl group is finite (`finite_weylGroup`, Layer 1) and
  has a unique `longestElement b : P.weylGroup` with `w₀ • posRoots b = negRoots b`,
  `(weylCoxeterSystem b).length w₀ = (posRoots b).ncard`, and `w₀ ^ 2 = 1`; every `w` satisfies
  `ℓ(w) ≤ ℓ(w₀)`. The order of the Weyl group is `Nat.card P.weylGroup`.

### Layer 5: Dynkin diagrams and the Cartan-Killing classification

- **The Dynkin type enumeration.** `DynkinType` : `A n | B n | C n | D n | E₆ | E₇ | E₈ | F₄ | G₂`, with
  `DynkinType.rank : DynkinType → ℕ`, the validity predicate `DynkinType.Valid` (the rank ranges), and
  the standard integer Cartan matrix `DynkinType.cartanMatrix t : Matrix (Fin t.rank) (Fin t.rank) ℤ`
  (diagonal `2`, the off-diagonal entries encoding the edges and their multiplicities, with the single
  double edge of `Bₙ`/`Cₙ`/`F₄` and the triple edge of `G₂`). The Cartan matrix is **oriented**: it
  is not merely an unoriented labeled graph, since an unoriented multiply-laced diagram cannot separate
  `Bₙ` from `Cₙ`. Concretely `DynkinType.cartanMatrix (.B n)` is the transpose of
  `DynkinType.cartanMatrix (.C n)`; the two are distinct root systems, identified only after `flip`
  (duality). Connectedness of the diagram is irreducibility (consume `induction_on_cartanMatrix`).
- **The finite-type condition.** `IsFiniteType (A : Matrix B B ℤ) : Prop`: `A` is a *Cartan matrix*
  (diagonal `2`, off-diagonal `≤ 0`, `A i j = 0 ↔ A j i = 0`) that is **symmetrizable with
  positive-definite symmetrization**. Prove that `b.cartanMatrix` of a finite crystallographic root
  system is of finite type (consume `posRootForm_rootFormIn_posDef`, `cartanMatrix_nondegenerate`).
- **The classification of finite-type Cartan matrices.** An indecomposable finite-type Cartan matrix
  reindexes, up to a single simultaneous row/column relabelling, to `DynkinType.cartanMatrix t` for a
  **unique valid** `t`. This is the combinatorial core: the positive-definiteness bound on subdiagrams
  (no vertex of degree `> 3`, at most one multiple edge, the chain/fork length constraints) eliminates
  everything outside the list, and validity removes the low-rank coincidences. Stated for a root system
  as `existsUnique_dynkinType`.
- **Realization.** `exists_rootPairing_of_dynkinType t ht`: each **valid** `DynkinType t` is the Cartan
  matrix of some irreducible reduced crystallographic finite root system. Build each from an **explicit
  coordinate model**, not from an abstract "root system from a positive-definite Cartan matrix"
  construction (which would re-run the finite-type machinery and risk circularity): `Aₙ` inside the
  sum-zero hyperplane of `ℚ^{n+1}`, `Bₙ`/`Cₙ`/`Dₙ` as the classical short/long-root systems,
  `E₈` from its even unimodular lattice with `E₇`, `E₆` as sub-systems, `F₄` and `G₂` from their
  standard low-dimensional coordinates. This is the existence half, and it is independent of the
  uniqueness half, so the two lanes proceed in parallel.
- **The Cartan-Killing classification (summit).** Combining realization, `existsUnique_dynkinType`, and
  the final isomorphism step `nonempty_equiv_of_hasCartanType` (consuming Mathlib's
  `equivOfCartanMatrixEq`): every irreducible reduced crystallographic finite root system is isomorphic
  (as a `RootPairing`) to the root system of a **unique valid** `DynkinType t` - a bijection between
  isomorphism classes of such root systems and the valid Dynkin types.

## Worked examples (acceptance criteria)

- **`Aₙ` and the symmetric group.** Fix the indexing convention once: type `A n` (for `n ≥ 1`) has
  rank `n`, roots `eᵢ - eⱼ` (`i ≠ j`, `i, j : Fin (n+1)`) in the sum-zero hyperplane of `ℚ^{n+1}`,
  simple roots `eᵢ - eᵢ₊₁`, and Weyl group `Equiv.Perm (Fin (n+1))` - so the classical `GLₖ` sits at
  type `A (k-1)` after quotienting the central direction. Acceptance: `b.cartanMatrix` reindexes to
  `DynkinType.cartanMatrix (.A n)`; `P.weylGroup ≃* Equiv.Perm (Fin (n+1))`, with simple reflections
  the adjacent transpositions; `Nat.card P.weylGroup = (n+1)!`; and `(posRoots b).ncard = (n+1).choose 2`.
  Via Layers 1-2 this exhibits `Sₙ₊₁` as the Coxeter system of type `Aₙ`, recovering
  `CoxeterMatrix.A n` (`Coxeter/Matrix.lean`) as `coxeterMatrixOfBase b`.
- **The classification list is exactly A-D-E-B-C-F-G.** The classification is a bijection between
  isomorphism classes of irreducible reduced crystallographic finite root systems and the **valid**
  Dynkin types: no such root system falls outside `Aₙ (n≥1), Bₙ (n≥2), Cₙ (n≥3), Dₙ (n≥4), E₆, E₇, E₈,
  F₄, G₂`, and each of these occurs. The simply-laced types `A`, `D`, `E` are exactly those with all
  off-diagonal Cartan products `≤ 1` (single edges); `B`, `C`, `F₄` carry one double edge and `G₂` the
  triple edge, and `B` and `C` are distinguished by the orientation of that double edge.
- **`G₂` explicitly.** The `G₂` root system (12 roots, 6 long and 6 short) with Cartan matrix
  `!![2, -1; -3, 2]`. Acceptance: it satisfies Mathlib's `RootPairing.IsG2`, its Cartan matrix
  reindexes to `DynkinType.cartanMatrix .G₂`, its Weyl group is the dihedral group of order 12,
  `P.weylGroup ≃* DihedralGroup 6`, `coxeterMatrixOfBase b` reindexes to `CoxeterMatrix.G₂`, the
  long/short root lengths differ by a factor of `3` (`RootPairing.rootLength`), and
  `(posRoots b).ncard = 6`, `(weylCoxeterSystem b).length (longestElement b) = 6`.

## Ordering

Layer 1 (root combinatorics: positive roots, simple-root lowering, inversion sets, the exchange step,
finiteness of the Weyl group) is the foundation and comes first, because the Coxeter presentation is
built on it rather than the reverse. Layer 2 (the Coxeter presentation of the Weyl group) consumes it;
its hardest target, `weylCoxeterSystem`, proves completeness of the braid relations through the
root-level exchange condition of Layer 1 - a nonempty reduced word acts nontrivially because its
inversion set is nonempty - so there is no circularity with the Coxeter machinery it is establishing.
Layer 3 (the strong exchange condition and Matsumoto for abstract Coxeter systems) is a parallel,
root-system-independent lane that only needs Mathlib's Coxeter API and is upstreamable on its own.
Layer 4 (chambers, the fundamental domain, the longest element) needs Layers 1-2 for the Weyl-group
action and the length-equals-inversions identity. Layer 5 (the classification) needs Layer 4 for the
positive-definite geometry that bounds the Cartan matrices; its uniqueness half (`existsUnique_dynkinType`)
and its realization half (`exists_rootPairing_of_dynkinType`, explicit coordinate models) are
independent and proceed in parallel, and the final isomorphism step consumes `equivOfCartanMatrixEq`.
The worked examples are built alongside the layer that first makes them expressible: `Aₙ` after Layer
2, `G₂` after Layer 5.

## References

- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4-6*, Springer (2002) - the definitive source:
  Coxeter systems, the exchange condition and reduced words (Ch. 4), root systems, bases, the Weyl
  group, Weyl chambers and the fundamental domain (Ch. 5-6), and the classification via Cartan matrices
  and Dynkin diagrams (Ch. 6, §4).
- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, CUP (1990) - Layers 1-4: the root
  combinatorics, the Coxeter presentation of a reflection group, the strong exchange condition,
  Matsumoto's word property, the length function and Poincaré polynomial, and the geometry of chambers.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972),
  Ch. III - root systems, bases, the Weyl group, Cartan matrices and Dynkin diagrams, and the
  classification (the cleanest route to the A-D-E-B-C-F-G list).
- V. G. Kac, *Infinite Dimensional Lie Algebras*, 3rd ed., CUP (1990), Ch. 4 - generalized Cartan
  matrices, the finite/affine/indefinite trichotomy, and symmetrizability, the general framework in
  which the finite-type classification is the positive-definite case.
- A. Björner, F. Brenti, *Combinatorics of Coxeter Groups*, Springer GTM 231 (2005) - the combinatorial
  side of Layer 3: length, reduced words, the exchange and deletion conditions, and the Bruhat order.
</content>
</invoke>
