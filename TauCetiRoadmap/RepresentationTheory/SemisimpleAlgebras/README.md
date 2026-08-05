# Roadmap: semisimple algebras, Artin-Wedderburn, and the structure of their modules

Mathlib already has the general structure theory of semisimple rings in remarkable depth. It defines
`IsSimpleModule`, `IsSemisimpleModule`, and `IsSemisimpleRing := IsSemisimpleModule R R`
(`RingTheory/SimpleModule/Basic.lean`); it proves **Schur's lemma** as the instance
`Module.End.instDivisionRing` (the endomorphism ring of a simple module is a division ring) together
with the `bijective_or_eq_zero`/`linearEquiv_of_ne_zero` family; it has the **isotypic decomposition**
(`RingTheory/SimpleModule/Isotypic.lean`: `IsIsotypic`, `isotypicComponent`, `isotypicComponents` with
its finiteness); and it proves the **Artin-Wedderburn theorem** in full generality, existence direction,
in `RingTheory/SimpleModule/WedderburnArtin.lean` (`IsSimpleRing.exists_ringEquiv_matrix_divisionRing`,
`IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`, the algebra and finite variants, and the
packaged `isSemisimpleRing_iff_pi_matrix_divisionRing`), with the algebraically closed specialization
`IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` in `RingTheory/SimpleModule/IsAlgClosed.lean`.
It has the **Jacobson radical** (`RingTheory/Jacobson/Radical.lean`: `Ring.jacobson`, `Module.jacobson`)
and the criterion `IsArtinianRing.isSemisimpleRing_iff_jacobson` (`RingTheory/Artinian/Module.lean`), the
**module density theorem** (`jacobson_density` and `Module.Finite.toModuleEnd_moduleEnd_surjective` in
`RingTheory/SimpleModule/Basic.lean`), **little Wedderburn** (`littleWedderburn`: a finite division ring
is a field), and **Maschke** (`IsSemisimpleRing (MonoidAlgebra k G)`). On the central-simple side it has
the predicates `Algebra.IsCentral` and `Algebra.IsCentralSimple` (`Algebra/Central/Defs.lean`), the
`CSA` structure and the Brauer *setoid* `IsBrauerEquivalent`/`BrauerGroup` (`Algebra/BrauerGroup/Defs.lean`),
`Subalgebra.centralizer` with the tensor-centralizer lemmas, and the Azumaya map
`AlgHom.mulLeftRight : A ⊗[R] Aᵐᵒᵖ →ₐ[R] Module.End R A` with its bijectivity for `IsAzumaya`.

So the general structure theory is largely present. The honest value of this roadmap is therefore not to
reprove Artin-Wedderburn, but to build the **API and assembly** that the existence theorems leave open,
and the classical theory that is genuinely missing: the **uniqueness/invariance** of the Wedderburn
decomposition and the explicit **simple-module ⇆ block** dictionary; the finite-dimensional
**double-centralizer theorem** in the form `A = End_D(V)` for a simple faithful module, sharpening the
module density Mathlib already has; the theory of **central simple algebras** (`A ≅ Mₙ(D)` for a central
division `D`, so `finrank K A` is a perfect square and the **degree** `deg A` is its square root; tensor
product of central simple algebras is central simple; `A ⊗ Aᵒᵖ ≅ M_{finrank K A}(K)`); **Skolem-Noether**
and the **centralizer theorem** for finite-dimensional central simple subalgebras; and the **Brauer group
as a group** together with **maximal subfields**, **splitting fields**, and the **index**. Mathlib's standing TODOs here
(`proof_wanted IsSemiprimaryRing.mulOpposite` and the left-right symmetry of the Jacobson radical in
`WedderburnArtin.lean`, and the "`D` in `Type u`" TODO) are folded into the layers below.

This roadmap is the algebra foundation beneath [character theory of finite groups](../CharacterTheory/README.md),
which consumes the algebraically closed Wedderburn decomposition `k[G] ≅ ∏ Matₙᵢ(k)`, the
number-of-blocks count, and the central idempotents; and beneath the representation theory used by
[reductive algebraic groups](../../ReductiveGroups/README.md). Suggested home:
`TauCeti/RingTheory/Semisimple/` (Layers 0-3) and `TauCeti/Algebra/CentralSimple/` and
`TauCeti/Algebra/BrauerGroup/` (Layers 4-6), mirroring Mathlib's `RingTheory/` and `Algebra/`.

## Standing conventions

- **Rings and their generality.** State each result at the generality it needs, matching Mathlib. The
  semisimple/Jacobson/Wedderburn theory lives over a general ring `R` (`[Ring R]`), the endomorphism
  division rings `Dᵢ` in `Type u`; the central-simple theory lives over a **field** `K` (`[Field K]`,
  `[Ring A] [Algebra K A]`); the split refinements add `[IsAlgClosed k]`. Do **not** bundle "central and
  simple and finite-dimensional" into one working hypothesis except through Mathlib's own `CSA` bundling;
  in theorems, carry `Algebra.IsCentral K A`, `IsSimpleRing A`, and `FiniteDimensional K A` separately, as
  Mathlib's `Algebra.Central.Defs` docstring recommends (the class `Algebra.IsCentralSimple` exists but
  cannot infer `K`).
- **Sides: left modules throughout.** Mathlib's `IsSemisimpleRing R` is `IsSemisimpleModule R R` for
  **left** modules, and Wedderburn produces `R ≃+* ∏ Matₙᵢ(Dᵢ)` acting on the left. Fix left modules as
  the default; when a right-module statement is needed, phrase it over `Rᵐᵒᵖ` (as Mathlib does with
  `isSemisimpleRing_mulOpposite_iff`), never with a private "right" predicate.
- **The division ring convention is the opposite endomorphism ring.** In Mathlib's decomposition the block
  division ring attached to a simple module `S` is `(Module.End R S)ᵐᵒᵖ` (see
  `exists_ringEquiv_matrix_end_mulOpposite`); over an algebraically closed field it collapses to the field
  itself. Keep this `ᵐᵒᵖ` convention rather than silently transposing, so the matrix side stays honest.
- **Simplicity vocabulary.** Use `IsSimpleRing` (two-sided ideals form a simple order, from
  `RingTheory/SimpleRing/Defs.lean`), `IsSimpleModule`, `IsSemisimpleRing`, `Ring.jacobson`,
  `Subalgebra.center`, `Subalgebra.centralizer`, `Algebra.IsCentral`, `CSA`, `IsBrauerEquivalent`, never a
  synonym. A **division algebra** is a `DivisionRing` with an `Algebra K` instance; a **central division
  algebra** adds `Algebra.IsCentral K`.
- **Finiteness.** `Module.Finite` / `FiniteDimensional` for the finite-dimensional hypotheses; `Finite`
  and `Fintype` only where an index set is genuinely enumerated. The Artinian hypothesis is stated as
  `IsArtinianRing`, and the standing equivalence `simple + Artinian ⇔ simple + semisimple`
  (`IsSimpleRing.tfae`) is used, not reproved.
- **Uniqueness is a Jordan-Hölder statement.** The invariance of the Wedderburn data `(nᵢ, Dᵢ)` is proved
  once, as an isomorphism-invariance of the multiset of isotypic components (Mathlib's
  `isotypicComponents` and its finiteness), and every later "number of blocks", "degrees", "division
  rings" statement is read off it, never re-derived by hand.

## What Mathlib already has (consume)

- **Simple and semisimple modules/rings:** `RingTheory/SimpleModule/Basic.lean` - `IsSimpleModule`,
  `IsSemisimpleModule`, `IsSemisimpleRing`, `RingEquiv.isSemisimpleRing(_iff)`, the Schur family
  `bijective_or_eq_zero`, `injective_of_ne_zero`, `linearEquiv_of_ne_zero`, and the division-ring instance
  `Module.End.instDivisionRing`. `RingTheory/SimpleRing/Defs.lean` - `IsSimpleRing`;
  `RingTheory/SimpleRing/Basic.lean`, `.../Matrix.lean` (`IsSimpleRing (Matrix ι ι A)`),
  `.../Field.lean` (`IsSimpleRing.isField_center`, `isSimpleRing_iff_isField`).
- **Schur over an algebraically closed field:** `finrank_endomorphism_simple_eq_one`,
  `finrank_hom_simple_simple` (`CategoryTheory/Preadditive/Schur.lean`, `RepresentationTheory/FDRep.lean`).
- **Isotypic decomposition:** `RingTheory/SimpleModule/Isotypic.lean` - `IsIsotypic`, `IsIsotypicOfType`,
  `isotypicComponent`, `isotypicComponents` (with `Finite`), `sSupIndep_isotypicComponents`,
  `Submodule.IsFullyInvariant`, `isFullyInvariant_iff_isTwoSided`; `RingTheory/SimpleModule/Rank.lean`
  (`isSimpleModule_iff_finrank_eq_one`).
- **Artin-Wedderburn (existence):** `RingTheory/SimpleModule/WedderburnArtin.lean` - `IsSimpleRing.tfae`,
  `isSimpleRing_isArtinianRing_iff`, `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite`,
  `exists_ringEquiv_matrix_divisionRing`, the algebra forms `exists_algEquiv_matrix_divisionRing(_finite)`,
  the product forms `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`,
  `exists_algEquiv_pi_matrix_divisionRing(_finite)`, and `isSemisimpleRing_iff_pi_matrix_divisionRing`;
  the instances `IsSemisimpleRing (Matrix n n R)` and `IsSemisimpleRing Rᵐᵒᵖ`.
  `RingTheory/SimpleModule/IsAlgClosed.lean` - `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`,
  `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`.
- **Jacobson radical:** `RingTheory/Jacobson/Radical.lean` (`Module.jacobson`, `Ring.jacobson`,
  `jacobson_quotient_jacobson`), `RingTheory/Jacobson/Semiprimary.lean`
  (`IsSemisimpleRing.jacobson_eq_bot`, `IsSemisimpleModule.jacobson_le_annihilator`),
  `RingTheory/Artinian/Module.lean` (`IsArtinianRing.isSemisimpleRing_iff_jacobson`, the
  `IsSemiprimaryRing` instance), `RingTheory/Artinian/Ring.lean`
  (`IsArtinianRing.isNilpotent_jacobson_bot`).
- **The module density theorem:** `RingTheory/SimpleModule/Basic.lean` - `jacobson_density` and
  `Module.Finite.toModuleEnd_moduleEnd_surjective` (a module finite over its endomorphism ring is dense).
- **Little Wedderburn:** `RingTheory/LittleWedderburn.lean` - `littleWedderburn` (`Field D` from
  `DivisionRing D` + `Finite D`), `Finite.isDomain_to_isField`.
- **Central and central-simple predicates:** `Algebra/Central/Defs.lean` (`Algebra.IsCentral`,
  `Algebra.IsCentralSimple`), `Algebra/Central/Basic.lean` (`IsCentral.center_eq_bot`, `mem_center_iff`,
  `of_algEquiv`, `IsCentral K Kᵐᵒᵖ`), `Algebra/Central/Matrix.lean` (`Algebra.IsCentral.matrix`),
  `Algebra/Central/TensorProduct.lean` (`left_of_tensor_of_field`, `right_of_tensor_of_field`).
- **Centralizers:** `Algebra/Algebra/Subalgebra/Centralizer.lean` and `.../Lattice.lean` -
  `Subalgebra.centralizer`, `le_centralizer_iff`, `adjoin_le_centralizer_centralizer`, and the
  tensor-product centralizer identities.
- **Brauer scaffolding and Azumaya:** `Algebra/BrauerGroup/Defs.lean` - `CSA`, `IsBrauerEquivalent`
  (reflexive/symmetric/transitive), `Brauer.CSA_Setoid`, `BrauerGroup` (a `Quotient`, **not yet a group**);
  `Algebra/Azumaya/Defs.lean`, `.../Basic.lean` - `IsAzumaya`, `AlgHom.mulLeftRight`,
  `AlgHom.mulLeftRight_bij`, `tensorEquivEnd`, `Algebra.IsCentral.instIsAzumaya`.
- **Maschke (the finite-group specialization):** `RepresentationTheory/Maschke.lean` -
  `IsSemisimpleRing (MonoidAlgebra k G)` and `IsSemisimpleModule k[G] V` under `[Field k] [Finite G]`
  `[NeZero (Nat.card G : k)]`.

## What is missing (build here)

The **invariance of the Wedderburn data**: that the block count, the degrees `nᵢ`, and the division rings
`Dᵢ` are isomorphism invariants. This is more than counting: the spine is the theorem that **every simple
`R`-module is isomorphic to a minimal left ideal of `R`** (a simple submodule of the regular module), from
which the simple-module isomorphism classes are put in bijection with the isotypic components of `R` and
hence with the Wedderburn blocks; the explicit **simple-module ⇆ block ⇆ primitive-idempotent**
dictionary. The canonical invariants are defined intrinsically (`blockDivisionRing S := (Module.End R S)ᵐᵒᵖ`,
the multiplicity of `S` in `R`), and any chosen Wedderburn *presentation* is proved equivalent to them, so
"the degree `nᵢ`" is a genuine invariant and not an artefact of a choice. The finite-dimensional
**double-centralizer theorem** `A = End_D(V)` for a simple faithful module (sharpening
`Module.Finite.toModuleEnd_moduleEnd_surjective` from surjectivity to a bijection with the right dimension
count), and the **Jacobson-Chevalley density** corollaries. The theory of **central simple algebras**: the
Wedderburn refinement `A ≅ Mₙ(D)` with `D` a **central division** `K`-algebra and
`finrank K A = n² · finrank K D`; that `finrank K A` is a **perfect square** (proved by base change to the
algebraic closure, where `A` splits, so this needs no maximal-subfield theory), from which the **degree**
`deg A` is defined as its square root; that a tensor product of central simple algebras is central simple
(Mathlib has only centrality, via `Algebra.Central.TensorProduct`); the **opposite-algebra isomorphism**
`A ⊗_K Aᵒᵖ ≅ M_{finrank K A}(K)` (the matrix size is `finrank K A`, not `deg A`; packaging Azumaya).
**Skolem-Noether** (two `K`-algebra homomorphisms from a **finite-dimensional central simple** `K`-algebra
`B` into a central simple `K`-algebra `A` are conjugate) and the **centralizer/double-centralizer theorem**
for a **finite-dimensional central simple** subalgebra `B ⊆ A` (`dim_K B · dim_K C_A(B) = dim_K A`,
`C_A(C_A(B)) = B`, `C_A(B)` central simple). The **Brauer group as a group** (well-defined multiplication
from tensor product on Brauer classes, identity `[K]`, inverse `[Aᵒᵖ]`), functoriality under base change,
and **splitting fields** (a field `L` splits `A` iff `A ⊗_K L ≅ Mₙ(L)`; every central simple algebra is
split by a finite extension, refined to a finite separable one, and by a maximal subfield of the underlying
division algebra), from which the **index** `ind A = deg D` is read off. None of these is upstream as
stated; each object here also gets its basic API, not only the headline theorem.

`Suggested.lean` pins the load-bearing objects (`card_blocks_eq` with its essential block-positivity
hypotheses, `simpleModule_linearEquiv_simple_submodule` and `blocks_equiv_simpleModules` — the
machine-checked block ⇆ simple-module dictionary that `../CharacterTheory` consumes,
`toModuleEnd_bijective`, `tensorProduct_isSimpleRing`, `finrank_isSquare`, `tensorOp_algEquiv_matrix`,
`skolemNoether`, `centralizer_isSimpleRing`, `finrank_mul_finrank_centralizer`, `brauerCommGroup`,
`IsSplittingField`, `isSplittingField_of_isAlgClosed`) and the named milestones below as
`sorry`-targets; further objects named in the layers (a chosen `WedderburnPresentation`, `brauerMul`
as a standalone operation, `splits_of_finrank`) are described here and pinned as their types become
expressible.

---

## The build, in layers

The ordering is the dependency order. Layers 0-3 are the general semisimple theory over a ring; Layers 4-6
are the central-simple and Brauer theory over a field, resting on Layers 0-3.

### Layer 0: the Jacobson radical and the semisimplicity criterion (supporting API, optional)

This layer is supporting cleanup, not on the critical path: character theory and the central-simple/Brauer
development need finite-dimensional semisimple structure, not the full left-right symmetry of semiprimary
rings. Discharge it as upstream cleanup, or skip to Layer 1 and pull in only the radical facts a later
theorem explicitly names.

- **The radical as an intersection and its quotient.** Consume `Ring.jacobson`, `jacobson_quotient_jacobson`,
  `IsSemisimpleRing.jacobson_eq_bot`, and `IsArtinianRing.isSemisimpleRing_iff_jacobson`. Build the
  convenience API for finite-dimensional algebras: `Ring.jacobson A` is a nilpotent two-sided ideal
  (from `IsArtinianRing.isNilpotent_jacobson_bot` via `FiniteDimensional → IsArtinianRing`), the quotient
  `A ⧸ Ring.jacobson A` is semisimple, and `A` is semisimple iff its radical is `⊥`.
- **Left-right symmetry.** Discharge Mathlib's standing `proof_wanted IsSemiprimaryRing.mulOpposite` and
  `isSemiprimaryRing_mulOpposite_iff`, giving `Ring.jacobson Aᵐᵒᵖ` the expected description and completing
  the "left Artinian ⇔ right Artinian for these rings" `example` noted in `WedderburnArtin.lean`.

### Layer 1: simple modules, Schur, and isotypic components

- **Schur, assembled.** Consume `Module.End.instDivisionRing` and the `bijective_or_eq_zero` family;
  package `Hom(S, S') = 0` for non-isomorphic simple `S, S'` and `Hom(S, S') ≃ D` in the isomorphic case,
  and over `[IsAlgClosed k]`, **for a finite-dimensional simple module `S`** (`[FiniteDimensional k S]`,
  needed by `finrank_endomorphism_simple_eq_one`; an infinite-dimensional simple module can have a larger
  division endomorphism ring), the collapse `End_k S ≃ₐ[k] k`.
- **The isotypic decomposition as counted data.** Consume `isotypicComponents` and its finiteness; build
  the equivalence between `isotypicComponents R M` and **isomorphism classes of simple submodules of `M`**.
  For `M = R` (the regular module of a semisimple ring) this is the counting spine reused everywhere
  downstream (and by [CharacterTheory](../CharacterTheory/README.md) for
  `#irreducibles = #conjugacy classes`), but tying it to **all** isomorphism classes of simple modules is
  not mere bookkeeping: see the minimal-left-ideal milestone in Layer 1.5.

### Layer 1.5: every simple module is a minimal left ideal

The passage from "simple submodules of `R`" to "isomorphism classes of simple `R`-modules" is a theorem, not
a rename, and must be built before the Wedderburn invariants of Layer 2 can be called canonical:

- **Occurrence in the regular module.** For a semisimple ring `R`, every simple `R`-module is isomorphic to
  a **minimal left ideal** of `R` (a simple submodule of the regular module). Equivalently, simple modules
  are represented by primitive idempotents.
- **The isomorphism-class bijection.** Assemble this into a bijection between isomorphism classes of simple
  `R`-modules and the isotypic components of `R` (Layer 1). Only after this is the "number of blocks" a
  count of simple-module isomorphism classes rather than a count of chosen matrix factors.

### Layer 2: Artin-Wedderburn, assembled with uniqueness

- **The presentation, named (choice-laden).** From `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`
  (and the algebra/finite/alg-closed forms), pin a `WedderburnPresentation R`: a **chosen** finite index of
  blocks, degrees `n : ι → ℕ`, division rings `D : ι → Type u`, and the equivalence `R ≃+* ∏ᵢ Matₙᵢ(Dᵢ)`.
  Provide the algebra form over a base and the `ᵐᵒᵖ`-endomorphism form together. Because Mathlib's theorem
  is existential, this object carries arbitrary choices and is **not** the source of the invariants.
- **The canonical invariants (intrinsic).** Define the invariants directly on isomorphism classes of simple
  `R`-modules (Layer 1.5): `blockDivisionRing S := (Module.End R S)ᵐᵒᵖ` and `blockMultiplicity S` (the
  multiplicity of `S` in the regular module). These are manifestly isomorphism-invariant.
- **Uniqueness / invariance.** Prove any `WedderburnPresentation R` is equivalent to the canonical data: the
  chosen index is in bijection with isomorphism classes of simple `R`-modules (via Layer 1.5), the chosen
  degree `nᵢ` equals `blockMultiplicity Sᵢ`, and the chosen `Dᵢ ≃ blockDivisionRing Sᵢ`. In particular two
  presentations of the same `R` have the same block multiset. This is what makes "the degrees" and "the
  division rings" well-defined objects rather than artefacts of a presentation.
- **The dimension count.** State this for the **algebra** Wedderburn presentation, where each `Dᵢ` carries a
  compatible `K`-algebra structure (and is finite-dimensional over `K`, forced by `FiniteDimensional K A`),
  not the pure ring form: `finrank K A = ∑ᵢ (nᵢ)² · finrank K Dᵢ`, and over `[IsAlgClosed k]` (where each
  `Dᵢ = k` by Schur), `finrank k A = ∑ᵢ (nᵢ)²`. This is the identity
  [CharacterTheory](../CharacterTheory/README.md) uses as `∑ nᵢ² = |G|`.

### Layer 3: the double-centralizer (density) theorem

- **From surjective to bijective.** Consume `Module.Finite.toModuleEnd_moduleEnd_surjective`. State the
  theorem in **module-internal** form: for a simple module `M` over a ring `R`, with `D = Module.End R M`
  and `M` **finite over `D`** (`[Module.Finite (Module.End R M) M]`, the honest hypothesis density needs,
  not "`M` finite over some unrelated base field `K`"), the natural map `R → End_D M` is surjective, and
  when `M` is **faithful** it is a **ring isomorphism** `R ≃ End_D M ≃ Mₙ(D)`. A faithful simple module
  makes `R` **primitive**, not necessarily simple; but when `R` **is** simple, any nonzero simple `R`-module
  is automatically faithful (its annihilator is a two-sided ideal, hence `⊥`), recovering Wedderburn for a
  simple ring intrinsically. Add a corollary specializing to a finite-dimensional `K`-algebra, deriving
  `[Module.Finite (Module.End R M) M]` from `FiniteDimensional K M`.
- **Jacobson-Chevalley corollaries.** The density statement in the form: for finitely many `D`-independent
  `m₁, …, mₖ ∈ M` and any targets, some `r ∈ R` realizes them simultaneously; and the consequence that a
  simple module over a finite-dimensional simple `K`-algebra is a faithful `Mₙ(D)`-module of the expected
  dimension.

### Layer 4: central simple algebras and their tensor products

- **Central simple, packaged.** For `[Field K] [Ring A] [Algebra K A]`, work with `Algebra.IsCentral K A`,
  `IsSimpleRing A`, `FiniteDimensional K A` (and Mathlib's `CSA` bundle where convenient). Consume
  `Algebra.IsCentral.matrix` (`Mₙ(D)` central over `K` when `D` is) and the tensor-centrality lemmas.
- **`Mₙ(K)` and division algebras are the building blocks.** A central simple `K`-algebra is
  `Mₙ(D)` for a **central division** `K`-algebra `D`, unique up to isomorphism (Layer 2 uniqueness +
  centrality of the center), with `finrank K A = n² · finrank K D`. This `A ≅ Mₙ(D)` step comes **first**;
  the degree and index are defined only afterwards, to avoid the circularity of quoting `deg`/`ind` before
  the objects that pin them exist.
- **Square dimension and the degree.** `finrank K A` is a **perfect square**. Prove this by base change to
  the algebraic closure `K̄`: `A ⊗_K K̄` is central simple over the algebraically closed `K̄`, hence
  `Mₘ(K̄)` (Layer 2 alg-closed Wedderburn), so `finrank K A = finrank K̄ (A ⊗_K K̄) = m²`. This uses **no**
  maximal-subfield theory. **Define** `deg A` as the square root of `finrank K A`. Applied to a central
  division algebra `D` this already gives `finrank K D` a perfect square; the **index** `ind A = deg D` is
  deferred to Layer 6, after maximal subfields, where it acquires its arithmetic meaning.
- **Tensor product of central simple is central simple.** Mathlib proves centrality of `A ⊗_K B`; build the
  missing **simplicity** of `A ⊗_K B` for `A, B` central simple over a field (so central simple algebras
  are closed under `⊗_K`), with `finrank K (A ⊗ B) = finrank K A · finrank K B`.
- **The opposite isomorphism.** Package `AlgHom.mulLeftRight`/`IsAzumaya` into
  `A ⊗_K Aᵒᵖ ≃ₐ[K] End_K A ≃ₐ[K] M_{finrank K A}(K)`, the fact that makes `[Aᵒᵖ]` the Brauer inverse of
  `[A]`. Note the matrix size is `finrank K A` (the dimension of the endomorphism algebra), **not** `deg A`:
  for a CSA of degree `d`, `finrank K A = d²`, so this is `M_{d²}(K)`. The `End_K A ≃ M_{finrank K A}(K)`
  step (a chosen `K`-basis of `A`) is itself a named prerequisite reused in Layer 6.

### Layer 5: Skolem-Noether and the centralizer theorem

- **Skolem-Noether.** Carry the hypotheses in full: `[Field K] [Ring A] [Algebra K A] [FiniteDimensional K A]
  [Algebra.IsCentral K A] [IsSimpleRing A]` for the target `A`, and `[Ring B] [Algebra K B]
  [FiniteDimensional K B] [Algebra.IsCentral K B] [IsSimpleRing B]` for the source `B`. **Finite-dimensionality
  of `B` is essential** and must not be dropped. Then two `K`-algebra homomorphisms `f, g : B →ₐ[K] A` are
  **conjugate**: there is a unit `u ∈ Aˣ` with `g x = u · f x · u⁻¹` for all `x`. In particular every
  `K`-algebra automorphism of a central simple algebra is **inner**. Proved via the module density of Layer 3
  applied to the two `B ⊗ Aᵒᵖ`-module structures on `A`. (The classical theorem holds for merely simple `B`;
  we pin the central-simple form, which is what the centralizer theorem and the downstream applications use,
  and defer the center-sensitive noncentral generalization.)
- **The centralizer theorem.** For a **central simple** `K`-subalgebra `B ⊆ A` (`[IsSimpleRing B]`,
  `[Algebra.IsCentral K B]`, `[FiniteDimensional K B]`) of a central simple `K`-algebra `A`, the centralizer
  `C = Subalgebra.centralizer K (B : Set A)` is **central simple** over `K`,
  `finrank K B · finrank K C = finrank K A`, and `C_A(C) = B` (double centralizer). Build on the
  tensor-centralizer identities Mathlib already has for the ambient `A ⊗_K Aᵒᵖ`. The general form for a
  merely simple subalgebra `B` (center `Z(B) ⊋ K`) needs a center-sensitive correction to the dimension
  formula and is a **later** target, not this one.

### Layer 6: the Brauer group and splitting fields

- **Brauer-triviality prerequisites (named, not free).** Before the group structure, build the API that the
  identity and inverse rest on: finite-dimensional `Module.End K V` is Brauer-equivalent to `K`;
  `Matrix n n K` is Brauer-trivial; and the matrix-absorption `Mₘ(A) ⊗ Mₙ(B) ≃ Mₘₙ(A ⊗ B)`. Together with
  the Layer 4 `End_K A ≃ M_{finrank K A}(K)` and opposite isomorphism, these give `A ⊗_K Aᵒᵖ` Brauer-trivial.
- **The Brauer group as a group.** Consume `IsBrauerEquivalent`, `Brauer.CSA_Setoid`, `BrauerGroup`. Build
  the **`CommGroup` structure** on `BrauerGroup K`: multiplication induced by `⊗_K` (well-defined on Brauer
  classes by Layer 4 simplicity and matrix absorption), identity `[K]`, inverse `[Aᵒᵖ]` (the prerequisites
  above), commutativity from `A ⊗ B ≃ B ⊗ A`. Each Brauer class has a **unique division-algebra
  representative** (Layer 2 uniqueness).
- **Base change preserves central simplicity, then is a homomorphism.** First prove the theorem it rests on:
  if `A` is central simple over `K` and `L / K` is a field extension, then `L ⊗_K A` is **central simple
  over `L`** (simplicity after scalar extension is a real theorem, not a typeclass triviality), compatibly
  with `⊗` and `ᵒᵖ`. Only then does `A ↦ A ⊗_K L` induce a group homomorphism
  `BrauerGroup K → BrauerGroup L`; its kernel is the classes **split by `L`**.
- **Splitting fields, maximal subfields, and the index.** `L` **splits** `A` when `A ⊗_K L ≃ₐ[L] Mₙ(L)`;
  equivalently `[A]` is in the kernel of base change. Build, in stages: over `[IsAlgClosed k]` every central
  simple algebra is split (Layer 2 alg-closed Wedderburn); a **maximal subfield** `L` of a central division
  algebra `D` (with `finrank K L = deg D`) splits `D`; every central simple `K`-algebra is split by **some
  finite** extension, and, isolating the separability theory (existence of a separable maximal subfield),
  refined to a **finite separable** extension. With maximal subfields in hand, `ind A = deg D` acquires its
  meaning as the common degree of the splitting maximal subfields.
- **Finite base fields.** `BrauerGroup` of a **finite field** is trivial (little Wedderburn: no
  noncommutative finite division algebras).
- **Real base field (long-term summit).** `BrauerGroup ℝ ≃ ℤ/2`, generated by the class of the **Hamilton
  quaternions** `ℍ[ℝ]`. This is well beyond Skolem-Noether and the Brauer definitions: it needs the
  classification of finite-dimensional real division algebras with center `ℝ` (only `ℝ` and `ℍ[ℝ]` occur), a
  Frobenius/real-closed-field result. Prerequisites: the `ℍ[ℝ]` API, the proof that `ℍ[ℝ]` is division and
  central over `ℝ`, and that classification.

---

## Worked examples (acceptance criteria)

- **Matrix algebras.** `Mₙ(K)` is central simple over `K`, split, Brauer-trivial; its only simple module is
  `Kⁿ`, and `End_{Mₙ(K)} Kⁿ ≃ K` (Layer 3 double centralizer on the smallest case).
- **The Hamilton quaternions (the summit).** `ℍ[ℝ]` is a central division algebra over `ℝ` with
  `finrank ℝ ℍ[ℝ] = 4` (`deg = 2`); `ℍ[ℝ] ⊗_ℝ ℍ[ℝ] ≃ M₄(ℝ)` (so `[ℍ]` has order 2), `ℂ` is a maximal
  subfield splitting it (`ℍ ⊗_ℝ ℂ ≃ M₂(ℂ)`), and `[ℍ]` generates `BrauerGroup ℝ ≃ ℤ/2`. The first three
  parts exercise Layers 4-5; the last (`BrauerGroup ℝ ≃ ℤ/2`) is the long-term summit, requiring the
  real-division-algebra classification noted in Layer 6, not just these isomorphisms.
- **Complex numbers over the reals.** `ℂ` is central simple over `ℝ`? No: `ℂ` is **simple** and
  finite-dimensional as an `ℝ`-algebra (`IsSimpleRing ℂ`), but **not central** (`Algebra.IsCentral ℝ ℂ` is
  false: `center ℂ = ℂ` strictly contains the image of `ℝ`); it is the maximal subfield that splits `ℍ`.
  Formalize both `IsSimpleRing ℂ` and `¬ Algebra.IsCentral ℝ ℂ` as the running check that "central" is not
  dropped and that the center comparison is the obstruction.
- **Group algebras (link to character theory).** For `[Field k] [Group G] [Finite G] [NeZero (Nat.card G : k)]`,
  `k[G]` is semisimple (Maschke, whose hypothesis is `[NeZero (Nat.card G : k)]`, consumed), so Layer 2 gives
  `k[G] ≃ ∏ᵢ Matₙᵢ(Dᵢ)` and, adding `[IsAlgClosed k]`, `∏ᵢ Matₙᵢ(k)` with `∑ nᵢ² = |G|` and block count
  `= #`isomorphism classes of simple modules. This uses the consumed
  `finrank k (MonoidAlgebra k G) = Nat.card G`. This is exactly what
  [CharacterTheory](../CharacterTheory/README.md) Layer 2 consumes.
- **Finite fields.** Every finite-dimensional **central** division algebra over a finite field `𝔽_q` is
  `𝔽_q` itself: it is finite, hence a field by little Wedderburn (consumed), and **centrality** forces its
  center (all of it) to be the base `𝔽_q`. So every central simple `𝔽_q`-algebra is `Mₙ(𝔽_q)` and
  `BrauerGroup 𝔽_q` is trivial. (Dropping centrality only gives a field extension `𝔽_{q^m}`, not `𝔽_q`.)
- **Skolem-Noether in the small.** Every `ℝ`-algebra automorphism of `ℍ[ℝ]` is inner (conjugation by a unit
  quaternion), and complex conjugation on `ℂ ⊆ ℍ` is realized by conjugation by `j`.

## Ordering

Layer 0 (Jacobson radical convenience API and left-right symmetry) is optional supporting cleanup, off the
critical path. Layer 1 (Schur assembly, isotypic counting) comes first and is mostly packaging. Layer 1.5
(every simple module is a minimal left ideal) is a genuine theorem, not bookkeeping, and precedes the
Wedderburn invariants. Layer 2 (Wedderburn presentation, canonical invariants, uniqueness, dimension count)
needs Layers 1 and 1.5. Layer 3 (double centralizer / density, stated with finiteness **over `D`**) needs
Layer 1's Schur and Layer 2's simple-ring case. Layer 4 (`A ≅ Mₙ(D)` first, then square dimension and the
degree by base change to the algebraic closure, tensor products, the opposite isomorphism) needs Layers 2-3
and moves to a field base. Layer 5 (Skolem-Noether and the centralizer theorem, both for **finite-dimensional
central simple** `B`) needs Layer 3's density and Layer 4's tensor theory. Layer 6 (Brauer group, base
change as central-simplicity-preserving, splitting fields, maximal subfields, and only then the index) needs
Layers 4-5. The group-algebra and character-theory link is available from Layer 2 onward.

The three tiers differ greatly in size and are best treated as staged deliverables: (1) the
semisimple/Wedderburn API needed for character theory (Layers 1-3); (2) the central simple algebra core:
CSA, tensor product, opposite, centralizer (Layers 4-5); (3) the Brauer group, splitting fields, and the
arithmetic examples (Layer 6), which pull in substantial field theory (separable maximal subfields) and, for
`BrauerGroup ℝ`, the real-division-algebra classification. Tiers 2-3 are much larger than tier 1.

## References

- T. Y. Lam, *A First Course in Noncommutative Rings*, 2nd ed., Springer GTM 131 (2001) - semisimple rings,
  the Jacobson radical, the density theorem, Wedderburn-Artin, and an introduction to Brauer groups.
- R. S. Pierce, *Associative Algebras*, Springer GTM 88 (1982) - central simple algebras, the centralizer
  and double-centralizer theorems, Skolem-Noether, and the Brauer group in full.
- C. W. Curtis, I. Reiner, *Representation Theory of Finite Groups and Associative Algebras*, Wiley (1962) -
  semisimple algebras, the Wedderburn structure theory, and the module theory beneath character theory.
- N. Jacobson, *Basic Algebra II*, 2nd ed., Freeman (1989) - the density theorem, central simple algebras,
  and the Brauer group.
- P. Gille, T. Szamuely, *Central Simple Algebras and Galois Cohomology*, CUP (2006) - central simple
  algebras, splitting fields, the Brauer group, and its cohomological description.
- I. N. Herstein, *Noncommutative Rings*, Carus Mathematical Monographs 15, MAA (1968) - the Jacobson
  density theorem and the structure of primitive rings.
- B. Farb, R. K. Dennis, *Noncommutative Algebra*, Springer GTM 144 (1993) - a compact modern treatment of
  semisimple algebras, Skolem-Noether, and the Brauer group.
