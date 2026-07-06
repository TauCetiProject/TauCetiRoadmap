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
exactly one of them (existence + uniqueness, the latter consuming `equivOfCartanMatrixEq`), and the
identification of the Weyl group of each as a concrete Coxeter/reflection group. The two load-bearing
theorems along the way are the **Coxeter presentation of the Weyl group** (`weylCoxeterSystem`) and
the **classification of finite-type Cartan matrices** (`DynkinType`). It is the shared foundation for
[the highest-weight representation theory roadmap](../LieHighestWeight/README.md) (which needs bases,
dominant chambers, the Weyl group action, and the classification to state and prove the
theorem of the highest weight and Weyl character formula) and for
[the classical groups roadmap](../ClassicalGroups/README.md) (which needs the `Aₙ`/`Bₙ`/`Cₙ`/`Dₙ`
root systems and their Weyl groups `Sₙ`, `Sₙ ⋉ (ℤ/2)ⁿ`, and so on).

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
- **Dynkin types are a finite enumeration, and the classification is existence + uniqueness.**
  `DynkinType` enumerates `A n`, `B n`, `C n`, `D n`, `E₆`, `E₇`, `E₈`, `F₄`, `G₂` with a `rank` and a
  standard integer Cartan matrix `DynkinType.cartanMatrix t : Matrix (Fin t.rank) (Fin t.rank) ℤ`.
  "Classification" means: (existence/realization) each `t` is the Cartan matrix of some irreducible
  reduced crystallographic finite root system, and (uniqueness) the Cartan matrix of such a root
  system reindexes to `DynkinType.cartanMatrix t` for a **unique** `t`, whence by `equivOfCartanMatrixEq`
  the root system is determined up to isomorphism by `t`. Keep the ranges (`A n` for `n ≥ 1`, `B n` for
  `n ≥ 2`, `C n` for `n ≥ 3`, `D n` for `n ≥ 4`) as hypotheses that eliminate the low-rank
  coincidences (`B₁ = C₁ = A₁`, `C₂ = B₂`, `D₂ = A₁×A₁`, `D₃ = A₃`), stated once and proved, not
  hidden.

## What Mathlib already has (consume)

- **The `RootPairing` structure and predicates** — `Mathlib/LinearAlgebra/RootSystem/Defs.lean`:
  `RootPairing`, `RootPairing.IsRootSystem`, `RootDatum`, `RootPairing.reflection` (as `M ≃ₗ[R] M`),
  `RootPairing.coreflection`, `RootPairing.reflectionPerm`, `RootPairing.pairing`,
  `RootPairing.coxeterWeight`, `RootPairing.IsOrthogonal`, `RootPairing.flip`.
- **Value subrings and crystallographic condition** — `.../RootSystem/IsValuedIn.lean`:
  `RootPairing.IsValuedIn`, `RootPairing.IsCrystallographic` (`= IsValuedIn ℤ`),
  `RootPairing.pairingIn`, `RootPairing.coxeterWeightIn`, `algebraMap_pairingIn`.
- **Reduced and irreducible** — `.../RootSystem/Reduced.lean` (`RootPairing.IsReduced`, with
  `isReduced_iff'`, `IsReduced.linearIndependent`, the four-Coxeter-weight dichotomy
  `linearIndependent_iff_coxeterWeight_ne_four`, and `pairingIn_two_two_iff` etc.),
  `.../RootSystem/Irreducible.lean` (`RootPairing.IsIrreducible`, `isIrreducible_iff_invtRootSubmodule`,
  `isSimpleModule_weylGroupRootRep`).
- **Bases and simple roots** — `.../RootSystem/Base.lean`: `RootPairing.Base` (`support`,
  `linearIndepOn_root/coroot`, `root_mem_or_neg_mem`), `Base.height`, `Base.IsPos`, `Base.IsPos.or_neg`,
  `Base.toWeightBasis`, `exists_root_eq_sum_nat_or_neg`, `exists_root_eq_sum_int`; existence
  `.../RootSystem/BaseExists.lean`: `RootPairing.Base.nonempty_base`, `Base.mk'`.
- **Cartan matrices** — `.../RootSystem/CartanMatrix.lean`: `RootPairing.Base.cartanMatrixIn`,
  `RootPairing.Base.cartanMatrix : Matrix b.support b.support ℤ`, `cartanMatrix_apply_same` (`= 2`),
  `cartanMatrix_le_zero_of_ne`, `cartanMatrix_mem_of_ne`, `cartanMatrix_nondegenerate`,
  `cartanMatrix_eq_neg_chainTopCoeff`, the connectedness characterization
  `induction_on_cartanMatrix`, and **`equivOfCartanMatrixEq`** — a root system is determined up to
  isomorphism by its Cartan matrix. This is the uniqueness half of the classification, already proved.
- **Root strings** — `.../RootSystem/Chain.lean`: `chainTopCoeff`, `chainBotCoeff`, `chainTopIdx`,
  `root_add_nsmul_mem_range_iff_le_chainTopCoeff`, `chainBotCoeff_add_chainTopCoeff_le_three`.
- **The canonical form and root lengths** — `.../RootSystem/RootPositive.lean`
  (`RootPairing.InvariantForm`, `RootPositiveForm`, `RootPairing.posForm`, `RootPairing.rootLength`,
  `rootLength_pos`, `zero_lt_pairingIn_iff`, `coxeterWeight_nonneg`),
  `.../RootSystem/Finite/CanonicalBilinear.lean` (`RootPairing.RootForm`, `Polarization`,
  `rootForm_self_sum_of_squares`), `.../RootSystem/Finite/Nondegenerate.lean`
  (`rootForm_nondegenerate`, `posRootForm`, `posRootForm_rootFormIn_posDef` — positive-definiteness of
  the canonical form on the root span).
- **The Weyl group** — `.../RootSystem/WeylGroup.lean`: `RootPairing.weylGroup` (`Subgroup (Aut P)`),
  `reflection_mem_weylGroup`, `weylGroup.ofIdx`, `weylGroup.induction`, `weylGroupToPerm`,
  `range_weylGroupToPerm`, `weylGroupRootRep`; `.../RootSystem/Hom.lean` for `Aut P`,
  `Equiv.reflection P i : Aut P`, `RootPairing.indexHom`.
- **The G₂ special case** — `.../RootSystem/Finite/G2.lean`: `RootPairing.IsG2` (extends
  crystallographic, reduced, irreducible), `IsNotG2`, `EmbeddedG2`, `IsG2.pairingIn_mem_zero_one_three`.
- **The Chevalley/Geck bridge to Lie algebras** — `.../RootSystem/GeckConstruction/*`:
  `GeckConstruction.lieAlgebra`, `GeckConstruction.cartanSubalgebra`, `equivRootSystem`. This is the
  hook the [highest-weight roadmap](../LieHighestWeight/README.md) consumes; it is not extended here.
- **Coxeter groups** — `Mathlib/GroupTheory/Coxeter/`: `CoxeterMatrix`, `CoxeterMatrix.Group`,
  `CoxeterSystem`, `IsCoxeterGroup`, `CoxeterSystem.simple`, `CoxeterSystem.wordProd`,
  `CoxeterSystem.lift`, `CoxeterSystem.alternatingWord` (`Coxeter/Basic.lean`);
  `CoxeterSystem.length`, `CoxeterSystem.IsReduced`, `exists_isReduced`, `length_mul_le`,
  `length_simple`, `IsLeftDescent`/`IsRightDescent`, `exists_leftDescent_of_ne_one`,
  `not_isReduced_alternatingWord` (`Coxeter/Length.lean`); `CoxeterSystem.IsReflection`,
  `IsLeftInversion`/`IsRightInversion`, `leftInvSeq`/`rightInvSeq` (`Coxeter/Inversion.lean`); the
  standard finite-type matrices `CoxeterMatrix.A/B/D/I/E₆/E₇/E₈/F₄/G₂/H₃/H₄` (`Coxeter/Matrix.lean`).

## What is missing (build here)

The **order of a product of simple reflections** and the **Coxeter matrix of a base**
(`coxeterMatrixOfBase`); the theorem that the **simple reflections generate the Weyl group**; the
**Coxeter presentation** `weylCoxeterSystem : CoxeterSystem (coxeterMatrixOfBase b) P.weylGroup` (Tits'
theorem: the braid relations are a *complete* set of relations, via the faithfulness of the geometric
representation); the **strong exchange condition** and **Matsumoto's theorem** on the Coxeter side
(both flagged as TODO in Mathlib); the **length-equals-inversions** identity linking
`CoxeterSystem.length` on `P.weylGroup` to the number of positive roots made negative; the **set of
positive roots** and its basic theory; **Weyl chambers**, the **dominant chamber**, and the theorem
that the dominant chamber is a **fundamental domain** for the Weyl-group action with the Weyl group
acting **simply transitively on chambers**; the **longest element** `w₀` of a finite Weyl group with
`ℓ(w₀) = |Φ⁺|` and `w₀ Φ⁺ = Φ⁻`; **finiteness and order** of the Weyl group of a finite root system;
the **`DynkinType` enumeration** with its standard Cartan matrices; the **finite-type Cartan-matrix
condition** (positive-definite symmetrizable) and its classification into the `DynkinType` list; the
**realization** of each `DynkinType` by an explicit root system; and the assembled **Cartan-Killing
classification** of irreducible reduced crystallographic finite root systems, together with the
identification of the classical Weyl groups (`Aₙ ↦ Sₙ₊₁`, `G₂ ↦ DihedralGroup 6`). None of this is
upstream.

`Suggested.lean` pins the load-bearing objects (`coxeterMatrixOfBase`, `weylCoxeterSystem`,
`posRoots`, `inversions`, `dominantChamber`, `longestElement`, `DynkinType`, `DynkinType.cartanMatrix`,
`IsFiniteType`, `classification`, `exists_rootPairing_of_dynkinType`) and the milestones below as
`sorry`-targets, so each is claimable and the summit statements are machine-checked to be expressible
against the pinned Mathlib.

---

## The build, in layers

The ordering below is the dependency order; independent lanes (the Coxeter combinatorics of Layer 1b
and the positive-root geometry of Layer 2) can proceed in parallel once Layer 1a is in place.

### Layer 1a: the Weyl group as a Coxeter system

- **The Coxeter matrix of a base.** `coxeterMatrixOfBase b : CoxeterMatrix b.support`, whose off-
  diagonal entry `m i j` is the order of `sᵢ sⱼ`, read off the Cartan product
  `b.cartanMatrix i j * b.cartanMatrix j i ∈ {0, 1, 2, 3}` (equivalently `coxeterWeightIn ℤ`): value
  `0 ↦ 2`, `1 ↦ 3`, `2 ↦ 4`, `3 ↦ 6`. Prove it is a genuine `CoxeterMatrix` (symmetric, diagonal `1`)
  and that these are the only possible products for a reduced crystallographic pairing (consume
  `chainBotCoeff_add_chainTopCoeff_le_three`, `coxeterWeight_nonneg`).
- **Simple reflections generate.** `⊤ = Subgroup.closure (range fun i : b.support => weylGroup.ofIdx P i)`
  as subgroups of `P.weylGroup`: every reflection is a product of simple reflections. Prove via the
  positive-root induction (`Base.height`, `weylGroup.induction`), the standard argument that a positive
  non-simple root is lowered by some simple reflection.
- **The presentation (Tits' theorem).** `weylCoxeterSystem b : CoxeterSystem (coxeterMatrixOfBase b) P.weylGroup`.
  The braid relations `(sᵢ sⱼ)^{m i j} = 1` hold in `W` (from `coxeterMatrixOfBase`); the induced map
  from the presented group `(coxeterMatrixOfBase b).Group → P.weylGroup` (via `CoxeterSystem.lift`) is
  surjective (generation) and injective (**no further relations**), the injectivity proved through the
  faithfulness of the reflection representation `weylGroupRootRep` on `M` — the geometric-representation
  argument. This is the summit of the layer and the single hardest theorem in the roadmap.
- **Length equals inversions.** With `cs := weylCoxeterSystem b`, for `w : P.weylGroup`
  `cs.length w = (inversions b w).ncard`, where `inversions b w = {i | b.IsPos i ∧ ¬ b.IsPos (P.weylGroupToPerm w i)}`
  is the set of positive roots sent to negative roots by `w`. In particular
  `cs.length (weylGroup.ofIdx P i) = 1` for simple `i`, and `cs.IsReduced` words correspond to reduced
  reflection expressions.

### Layer 1b: the missing Coxeter combinatorics (upstreamable)

Stated for a general `cs : CoxeterSystem M W`, independent of root systems; these fill Mathlib's
declared TODOs and belong in `TauCeti/GroupTheory/Coxeter/`.

- **The strong exchange condition.** If `t` is a reflection (`cs.IsReflection t`) and
  `ℓ(t · π ω) < ℓ(π ω)` for a reduced word `ω`, then `t · π ω` is obtained by deleting exactly one
  letter of `ω`; the deleted letter is located by `leftInvSeq`. Derive the **deletion condition** (a
  non-reduced word can be shortened by deleting two letters) and the **exchange condition** as corollaries.
- **Matsumoto's theorem (the word property).** Any two reduced words for the same `w : W` are connected
  by braid moves (`alternatingWord` swaps). State it in the lift form that downstream users need: a
  function `f : B → G` into a monoid, constant on braid relations, has `wordProd`-image depending only
  on `π ω` for reduced `ω`; hence a well-defined "value of `w` along any reduced word". Consume
  `not_isReduced_alternatingWord`, the strong exchange condition, and `CoxeterSystem.lift`.
- **Consequences.** The Bruhat order's basic well-definedness, and the identity
  `∑_{w ∈ W} qℓ(w)` (the length generating function) is a well-defined element of `ℤ[q]` for finite
  `W` — the Poincaré polynomial, used in Layer 3 for the order of the Weyl group.

### Layer 2: positive roots, chambers, and the fundamental domain

Stated for `P : RootPairing ι ℝ M N` finite, reduced, crystallographic, with a base `b`.

- **Positive and negative roots.** `posRoots b = {i | b.IsPos i}`, `negRoots b = {i | ¬ b.IsPos i}`;
  the partition `Set.univ = posRoots b ⊔ negRoots b` (`Base.IsPos.or_neg`), the involution
  `i ↦ reflectionPerm` swapping them, and every `i ∈ posRoots b` a nonnegative integer combination of
  simple roots (`exists_root_eq_sum_nat_or_neg`). `posRoots b` is finite (`[Finite ι]`).
- **Weyl chambers.** The **dominant chamber** `dominantChamber b = {x : M | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`,
  its interior `{x | ∀ i ∈ b.support, 0 < P.coroot' i x}`, and the chambers as the connected components
  of the complement of the reflection hyperplanes — the `W`-translates of the dominant chamber.
- **The fundamental domain.** Every point of `M` is `W`-conjugate into `dominantChamber b`
  (`∀ x, ∃ w ∈ P.weylGroup, w • x ∈ dominantChamber b`), and a point of the open dominant chamber has
  trivial stabilizer; hence the dominant chamber is a **strict fundamental domain** and `W` acts
  **simply transitively on chambers**. This is the geometric heart used by highest-weight theory: a
  dominant representative exists and is unique.
- **The longest element.** For finite `ι`, the Weyl group is finite (`Finite P.weylGroup`) and has a
  unique `longestElement b : P.weylGroup` with `w₀ • posRoots b = negRoots b`,
  `(weylCoxeterSystem b).length w₀ = (posRoots b).ncard`, and `w₀ ^ 2 = 1`; every `w` satisfies
  `ℓ(w) ≤ ℓ(w₀)`. The order `Nat.card P.weylGroup` is the value at `q = 1` of the Poincaré polynomial
  of Layer 1b.

### Layer 3: Dynkin diagrams and the Cartan-Killing classification

- **The Dynkin type enumeration.** `DynkinType` : `A n | B n | C n | D n | E₆ | E₇ | E₈ | F₄ | G₂`, with
  `DynkinType.rank : DynkinType → ℕ` and the standard integer Cartan matrix
  `DynkinType.cartanMatrix t : Matrix (Fin t.rank) (Fin t.rank) ℤ` (diagonal `2`, the off-diagonal
  edges and their multiplicities encoding the diagram, with the single double edge of `Bₙ`/`Cₙ`/`F₄`
  and the triple edge of `G₂`). The **Dynkin diagram** is the associated labeled graph; connectedness
  of the diagram is irreducibility (consume `induction_on_cartanMatrix`).
- **The finite-type condition.** `IsFiniteType (A : Matrix (Fin n) (Fin n) ℤ) : Prop`: `A` is a
  *Cartan matrix* (diagonal `2`, off-diagonal `≤ 0`, `A i j = 0 ↔ A j i = 0`) that is **symmetrizable
  with positive-definite symmetrization**. Prove that `b.cartanMatrix` of a finite crystallographic
  root system is of finite type (consume `posRootForm_rootFormIn_posDef`, `cartanMatrix_nondegenerate`).
- **The classification of finite-type Cartan matrices.** An indecomposable finite-type Cartan matrix
  reindexes to `DynkinType.cartanMatrix t` for a **unique** `t` (with the rank ranges pinning away the
  coincidences). This is the combinatorial core: the positive-definiteness bound on subdiagrams
  (no vertex of degree `> 3`, at most one multiple edge, the chain/fork length constraints) eliminates
  everything outside the list. State it as `classificationCartanMatrix`.
- **Realization.** `exists_rootPairing_of_dynkinType t`: each `DynkinType t` is the Cartan matrix of
  some irreducible reduced crystallographic finite root system (built explicitly, e.g. `Aₙ` inside the
  sum-zero hyperplane of `ℝ^{n+1}`, `Bₙ`/`Cₙ`/`Dₙ` as the classical short/long-root systems, the
  exceptional ones from their Cartan matrices via a construction over `ℚ`). Existence half of the
  classification.
- **The Cartan-Killing classification (summit).** Combining realization, the Cartan-matrix
  classification, and Mathlib's `equivOfCartanMatrixEq` (uniqueness up to isomorphism from the Cartan
  matrix): every irreducible reduced crystallographic finite root system is isomorphic (as a
  `RootPairing`) to the root system of a **unique** `DynkinType t`. State as `classification`: an
  equivalence between isomorphism classes of such root systems and `DynkinType`.

## Worked examples (acceptance criteria)

- **`Aₙ` and the symmetric group.** Build the `Aₙ` root system (roots `eᵢ - eⱼ`, `i ≠ j`, in the
  sum-zero hyperplane of `ℝ^{n+1}`), with base the simple roots `eᵢ - eᵢ₊₁`. Acceptance:
  `b.cartanMatrix` reindexes to `DynkinType.cartanMatrix (.A n)`; the Weyl group is the symmetric
  group, `P.weylGroup ≃* Equiv.Perm (Fin (n+1))`, with simple reflections the adjacent transpositions;
  `Nat.card P.weylGroup = (n+1)!`; and `(posRoots b).ncard = (n+1).choose 2`. Via Layer 1a this
  exhibits `Sₙ₊₁` as the Coxeter system of type `Aₙ`, recovering
  `CoxeterMatrix.A n` (`Coxeter/Matrix.lean`) as `coxeterMatrixOfBase b`.
- **The classification list is exactly A-D-E-B-C-F-G.** The image of `DynkinType` under
  `DynkinType.cartanMatrix` is the classified list, and `classification` is a bijection: no irreducible
  reduced crystallographic finite root system falls outside `Aₙ (n≥1), Bₙ (n≥2), Cₙ (n≥3), Dₙ (n≥4),
  E₆, E₇, E₈, F₄, G₂`, and each of these occurs. The simply-laced types `A`, `D`, `E` are exactly those
  with all off-diagonal Cartan products `≤ 1` (single edges); `B`, `C`, `F₄` carry one double edge and
  `G₂` the triple edge.
- **`G₂` explicitly.** The `G₂` root system (12 roots, 6 long and 6 short) with Cartan matrix
  `!![2, -1; -3, 2]`. Acceptance: it satisfies Mathlib's `RootPairing.IsG2`, its Cartan matrix
  reindexes to `DynkinType.cartanMatrix .G₂`, its Weyl group is the dihedral group of order 12,
  `P.weylGroup ≃* DihedralGroup 6`, `coxeterMatrixOfBase b` reindexes to `CoxeterMatrix.G₂`, the
  long/short root lengths differ by a factor of `3` (`RootPairing.rootLength`), and
  `(posRoots b).ncard = 6`, `(weylCoxeterSystem b).length (longestElement b) = 6`.

## Ordering

Layer 1a (the Coxeter presentation of the Weyl group) is the foundation and comes first; its hardest
target, `weylCoxeterSystem`, rests on the faithfulness of Mathlib's `weylGroupRootRep`. Layer 1b (the
strong exchange condition and Matsumoto) is a parallel, root-system-independent lane that only needs
Mathlib's Coxeter API and is upstreamable on its own; the length-equals-inversions identity of Layer 1a
consumes it. Layer 2 (positive roots, chambers, the fundamental domain, the longest element) needs
Layer 1a for the Weyl-group action and Layer 1b's Poincaré polynomial for the order. Layer 3 (the
classification) needs Layer 2 for the positive-definite geometry that bounds the Cartan matrices, and
consumes `equivOfCartanMatrixEq` for uniqueness; its realization half is independent and can be built
in parallel with the combinatorial classification. The worked examples are built alongside the layer
that first makes them expressible: `Aₙ` after Layer 1a, `G₂` after Layer 3.

## References

- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4-6*, Springer (2002) — the definitive source:
  Coxeter systems, the exchange condition and reduced words (Ch. 4), root systems, bases, the Weyl
  group, Weyl chambers and the fundamental domain (Ch. 5-6), and the classification via Cartan matrices
  and Dynkin diagrams (Ch. 6, §4).
- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, CUP (1990) — Layer 1: the Coxeter
  presentation of a reflection group, the strong exchange condition, Matsumoto's word property, the
  length function and Poincaré polynomial, and the geometry of chambers.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972),
  Ch. III — root systems, bases, the Weyl group, Cartan matrices and Dynkin diagrams, and the
  classification (the cleanest route to the A-D-E-B-C-F-G list).
- V. G. Kac, *Infinite Dimensional Lie Algebras*, 3rd ed., CUP (1990), Ch. 4 — generalized Cartan
  matrices, the finite/affine/indefinite trichotomy, and symmetrizability, the general framework in
  which the finite-type classification is the positive-definite case.
- A. Björner, F. Brenti, *Combinatorics of Coxeter Groups*, Springer GTM 231 (2005) — the combinatorial
  side of Layer 1b: length, reduced words, the exchange and deletion conditions, and the Bruhat order.
</content>
</invoke>
