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
as a group** together with **maximal subfields**, **splitting fields**, and the **index**. The left-right
symmetry of the Jacobson radical and of semiprimarity (`IsSemiprimaryRing.mulOpposite`,
`isSemiprimaryRing_mulOpposite_iff`, in Tau Ceti's `TauCeti/RingTheory/Jacobson/MulOpposite.lean`) and
the "`D` in `Type u`" TODO are folded into the layers below.

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

### Layer 0: the Jacobson radical and the semisimplicity criterion (supporting API, off the critical path)

This layer is a required part of the roadmap, built in full, but it is off the critical path: no
theorem of Layers 1-6 consumes it, since character theory and the central-simple/Brauer development
need finite-dimensional semisimple structure, not the left-right symmetry of semiprimary rings. Its
targets are the three finite-dimensional radical statements below; the left-right symmetry is consumed.

- **The radical as an intersection and its quotient.** Consume `Ring.jacobson`, `jacobson_quotient_jacobson`,
  `IsSemisimpleRing.jacobson_eq_bot`, and `IsArtinianRing.isSemisimpleRing_iff_jacobson`. Build the
  convenience API for finite-dimensional algebras: `Ring.jacobson A` is a nilpotent two-sided ideal
  (from `IsArtinianRing.isNilpotent_jacobson_bot` via `FiniteDimensional → IsArtinianRing`), the quotient
  `A ⧸ Ring.jacobson A` is semisimple, and `A` is semisimple iff its radical is `⊥`.
- **Left-right symmetry.** Consume Tau Ceti's `TauCeti/RingTheory/Jacobson/MulOpposite.lean`:
  `TauCeti.Ring.coe_jacobson_mulOpposite` (the radical of `Aᵐᵒᵖ` is the `op`-image of the radical of `A`),
  `TauCeti.isSemiprimaryRing_mulOpposite_iff` and the instance `TauCeti.IsSemiprimaryRing.mulOpposite`,
  which discharge the two statements Mathlib's `WedderburnArtin.lean` once recorded as `proof_wanted`,
  and `TauCeti.IsArtinianRing.isNoetherianRing_iff_isArtinianRing_mulOpposite` (for a left Artinian ring,
  right Noetherian iff right Artinian), the `example` that file leaves open.

### Layer 1: simple modules, Schur, and isotypic components

- **Schur, assembled.** Consume `Module.End.instDivisionRing` and the `bijective_or_eq_zero` family;
  package `Hom(S, S') = 0` for non-isomorphic simple `S, S'` and `Hom(S, S') ≃ D` in the isomorphic case,
  and over an algebraically closed field `k`, for a ring `A` equipped with `[Algebra k A]` and an
  `A`-module `S` that is also a `k`-module with compatible actions (`[AddCommGroup S]`,
  `[Module k S]`, `[Module A S]`, `[IsScalarTower k A S]`), if `S` is simple as an `A`-module and
  finite-dimensional over `k`, the
  collapse of the **`A`-linear** endomorphism algebra `Module.End A S ≃ₐ[k] k`. The scalar map
  `algebraMap k (Module.End A S)` is bijective by Mathlib's
  `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`; TauCeti's
  `endAlgEquivSelfOfIsSimpleModule` packages the inverse of the `k`-algebra structure map as this
  algebra equivalence. The `[IsScalarTower k A S]` hypothesis is what makes the `k`-scalars act
  compatibly with the `A`-action, so this is a statement about endomorphisms commuting with the
  `A`-action, not the full ring `Module.End k S` of all `k`-linear endomorphisms. Finite dimensionality
  over `k` is essential: an infinite-dimensional simple `A`-module can have a larger division
  endomorphism ring.
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
  when `M` is **faithful** it is a **ring isomorphism** `R ≃ End_D M ≃ Mₙ(Dᵐᵒᵖ)`, with `n` the dimension
  of `M` over `D`. The opposite is forced: `M ≃ Dⁿ` as a left `D`-module, and the `D`-linear endomorphisms
  of `Dⁿ` are right multiplications by `n × n` matrices over `D`, which compose as matrices over `Dᵐᵒᵖ`.
  In the convention of Layer 2 this reads `R ≃ Mₙ((Module.End R M)ᵐᵒᵖ)`, the orientation of Mathlib's
  `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite`. Witness: for `R = Mₙ(Δ)` and its column module
  `M = Δⁿ`, `D ≃ Δᵐᵒᵖ` (Tau Ceti's `TauCeti.Matrix.mulOppositeRingEquivEnd`: the endomorphisms are right
  multiplications by scalars) and `Mₙ(Dᵐᵒᵖ) ≃ Mₙ(Δ) = R`; for `n = 1` and a division ring `Δ` not
  isomorphic to its opposite (a cyclic division algebra of degree 3 over `ℚ`, whose Brauer class has
  order 3, so `[Δᵐᵒᵖ] = [Δ]⁻¹ ≠ [Δ]`), the unopposed form `R ≃ M₁(D) = Δᵐᵒᵖ` is false. A faithful simple module
  makes `R` **primitive**, not necessarily simple; but when `R` **is** simple, any nonzero simple `R`-module
  is automatically faithful (its annihilator is a two-sided ideal, hence `⊥`), recovering Wedderburn for a
  simple ring intrinsically. Add a corollary specializing to a finite-dimensional `K`-algebra, deriving
  `[Module.Finite (Module.End R M) M]` from `FiniteDimensional K M`.
- **Jacobson-Chevalley corollaries.** The density statement in the form: for finitely many `D`-independent
  `m₁, …, mₖ ∈ M` and any targets, some `r ∈ R` realizes them simultaneously; and the consequence that a
  simple module `M` over a finite-dimensional simple `K`-algebra `R`, with `D = Module.End R M`, is through
  `R ≃ Mₙ(Dᵐᵒᵖ)` the column module of that matrix algebra, so that `finrank K R = n · finrank K M`
  (for `R = Mₙ(Δ)`, `M = Δⁿ`: `n² · finrank K Δ = n · (n · finrank K Δ)`).

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
  defined in Layer 6, after maximal subfields, where it acquires its arithmetic meaning.
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
  [FiniteDimensional K B] [Algebra.IsCentral K B] [IsSimpleRing B]` for the source `B`. (Finite-dimensionality
  of `B` is implied by the rest: `f` is injective because `B` is simple and `A` is nonzero, so `B` embeds in
  the finite-dimensional `A`.) Then two `K`-algebra homomorphisms `f, g : B →ₐ[K] A` are
  **conjugate**: there is a unit `u ∈ Aˣ` with `g x = u · f x · u⁻¹` for all `x`. In particular every
  `K`-algebra automorphism of a central simple algebra is **inner**.
  The route is the classification of modules over a simple Artinian algebra, not density. Each of `f`, `g`
  makes `A` a module over `R = B ⊗[K] Aᵐᵒᵖ` (`B` acting on the left through `f`, resp. `g`, and `A` on the
  right by multiplication): Tau Ceti's `TauCeti.Bimodule f` (`TauCeti/Algebra/CentralSimple/Bimodule.lean`).
  These modules need not be simple: for `B = K` and `A = M₂(K)`, `R ≃ Aᵐᵒᵖ` and `A` is its regular module,
  of length 2. So the Layer 3 density theorem does not apply to them, and density alone produces no
  invertible intertwiner. The steps are: (i) `R` is a simple ring (Layer 4 tensor simplicity, from `B`
  central simple and `Aᵐᵒᵖ` simple) and finite-dimensional over `K`, hence Artinian; (ii) two `R`-modules
  finite-dimensional over `K` with equal `K`-dimension are `R`-isomorphic, because every module over a
  simple Artinian ring is a direct sum of copies of its unique simple module: Tau Ceti's
  `TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq` (`TauCeti/RingTheory/Semisimple/SimpleArtinian.lean`,
  hypotheses `[IsSimpleRing R] [Algebra K R] [FiniteDimensional K R]` and `M`, `N` finite-dimensional over
  `K` with `[IsScalarTower K R M]`, `[IsScalarTower K R N]`), applied to `Bimodule f` and `Bimodule g`,
  both of dimension `finrank K A`; (iii) an `R`-linear isomorphism `φ` is linear for the right action of
  `A`, hence is left multiplication by `u = φ(1)`, and its linearity for the left action of `B` is
  `u · f x = g x · u` (`TauCeti.Bimodule.symm_apply_one_mul_eq_mul_symm_apply_one`); surjectivity of `φ`
  gives `u` a right inverse (`TauCeti.Bimodule.exists_symm_apply_one_mul_eq_one`), which is two-sided
  because the Artinian ring `A` is Dedekind-finite. The pinned Tau Ceti assembles these as
  `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean`), under weaker hypotheses
  than the target (`A` simple and finite-dimensional, not necessarily central; `B` central simple, with no
  finiteness assumed), and the target is its specialization. Centrality of the source is not dropped: as an
  `ℝ`-algebra map `ℂ → ℂ` with `A = ℂ` not central over `ℝ`, complex conjugation is not conjugation by a
  unit. The form for a merely simple source `B` inside a central simple `A` is not a target of this roadmap.
- **The centralizer theorem.** For a **central simple** `K`-subalgebra `B ⊆ A` (`[IsSimpleRing B]`,
  `[Algebra.IsCentral K B]`, `[FiniteDimensional K B]`) of a central simple `K`-algebra `A`, the centralizer
  `C = Subalgebra.centralizer K (B : Set A)` is **central simple** over `K`,
  `finrank K B · finrank K C = finrank K A`, and `C_A(C) = B` (double centralizer). Build on the
  tensor-centralizer identities Mathlib already has for the ambient `A ⊗_K Aᵒᵖ`. The general form for a
  merely simple subalgebra `B` (center `Z(B) ⊋ K`) needs a center-sensitive correction to the dimension
  formula and is not a target of this roadmap.

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

Layer 0 (Jacobson radical convenience API and left-right symmetry) is required supporting API, off the
critical path: no later layer consumes it. Layer 1 (Schur assembly, isotypic counting) comes first and is mostly packaging. Layer 1.5
(every simple module is a minimal left ideal) is a genuine theorem, not bookkeeping, and precedes the
Wedderburn invariants. Layer 2 (Wedderburn presentation, canonical invariants, uniqueness, dimension count)
needs Layers 1 and 1.5. Layer 3 (double centralizer / density, stated with finiteness **over `D`**) needs
Layer 1's Schur and Layer 2's simple-ring case. Layer 4 (`A ≅ Mₙ(D)` first, then square dimension and the
degree by base change to the algebraic closure, tensor products, the opposite isomorphism) needs Layers 2-3
and moves to a field base. Layer 5 (Skolem-Noether and the centralizer theorem, both for **finite-dimensional
central simple** `B`) needs Layer 4's tensor simplicity and, for Skolem-Noether, the classification of
finite-dimensional modules over a simple Artinian algebra (`TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq`),
not Layer 3's density. Layer 6 (Brauer group, base
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
