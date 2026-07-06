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
module density Mathlib already has; the theory of **central simple algebras** (dimension is a perfect
square, tensor product of central simple algebras is central simple, `A ⊗ Aᵒᵖ ≅ Mₙ(K)`); **Skolem-Noether**
and the **centralizer theorem** for simple subalgebras; and the **Brauer group as a group** together with
**splitting fields**, index and degree, and maximal subfields. Mathlib's standing TODOs here
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

- **Simple and semisimple modules/rings:** `RingTheory/SimpleModule/Basic.lean` — `IsSimpleModule`,
  `IsSemisimpleModule`, `IsSemisimpleRing`, `RingEquiv.isSemisimpleRing(_iff)`, the Schur family
  `bijective_or_eq_zero`, `injective_of_ne_zero`, `linearEquiv_of_ne_zero`, and the division-ring instance
  `Module.End.instDivisionRing`. `RingTheory/SimpleRing/Defs.lean` — `IsSimpleRing`;
  `RingTheory/SimpleRing/Basic.lean`, `.../Matrix.lean` (`IsSimpleRing (Matrix ι ι A)`),
  `.../Field.lean` (`IsSimpleRing.isField_center`, `isSimpleRing_iff_isField`).
- **Schur over an algebraically closed field:** `finrank_endomorphism_simple_eq_one`,
  `finrank_hom_simple_simple` (`CategoryTheory/Preadditive/Schur.lean`, `RepresentationTheory/FDRep.lean`).
- **Isotypic decomposition:** `RingTheory/SimpleModule/Isotypic.lean` — `IsIsotypic`, `IsIsotypicOfType`,
  `isotypicComponent`, `isotypicComponents` (with `Finite`), `sSupIndep_isotypicComponents`,
  `Submodule.IsFullyInvariant`, `isFullyInvariant_iff_isTwoSided`; `RingTheory/SimpleModule/Rank.lean`
  (`isSimpleModule_iff_finrank_eq_one`).
- **Artin-Wedderburn (existence):** `RingTheory/SimpleModule/WedderburnArtin.lean` — `IsSimpleRing.tfae`,
  `isSimpleRing_isArtinianRing_iff`, `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite`,
  `exists_ringEquiv_matrix_divisionRing`, the algebra forms `exists_algEquiv_matrix_divisionRing(_finite)`,
  the product forms `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`,
  `exists_algEquiv_pi_matrix_divisionRing(_finite)`, and `isSemisimpleRing_iff_pi_matrix_divisionRing`;
  the instances `IsSemisimpleRing (Matrix n n R)` and `IsSemisimpleRing Rᵐᵒᵖ`.
  `RingTheory/SimpleModule/IsAlgClosed.lean` — `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`,
  `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`.
- **Jacobson radical:** `RingTheory/Jacobson/Radical.lean` (`Module.jacobson`, `Ring.jacobson`,
  `jacobson_quotient_jacobson`), `RingTheory/Jacobson/Semiprimary.lean`
  (`IsSemisimpleRing.jacobson_eq_bot`, `IsSemisimpleModule.jacobson_le_annihilator`),
  `RingTheory/Artinian/Module.lean` (`IsArtinianRing.isSemisimpleRing_iff_jacobson`, the
  `IsSemiprimaryRing` instance), `RingTheory/Artinian/Ring.lean`
  (`IsArtinianRing.isNilpotent_jacobson_bot`).
- **The module density theorem:** `RingTheory/SimpleModule/Basic.lean` — `jacobson_density` and
  `Module.Finite.toModuleEnd_moduleEnd_surjective` (a module finite over its endomorphism ring is dense).
- **Little Wedderburn:** `RingTheory/LittleWedderburn.lean` — `littleWedderburn` (`Field D` from
  `DivisionRing D` + `Finite D`), `Finite.isDomain_to_isField`.
- **Central and central-simple predicates:** `Algebra/Central/Defs.lean` (`Algebra.IsCentral`,
  `Algebra.IsCentralSimple`), `Algebra/Central/Basic.lean` (`IsCentral.center_eq_bot`, `mem_center_iff`,
  `of_algEquiv`, `IsCentral K Kᵐᵒᵖ`), `Algebra/Central/Matrix.lean` (`Algebra.IsCentral.matrix`),
  `Algebra/Central/TensorProduct.lean` (`left_of_tensor_of_field`, `right_of_tensor_of_field`).
- **Centralizers:** `Algebra/Algebra/Subalgebra/Centralizer.lean` and `.../Lattice.lean` —
  `Subalgebra.centralizer`, `le_centralizer_iff`, `adjoin_le_centralizer_centralizer`, and the
  tensor-product centralizer identities.
- **Brauer scaffolding and Azumaya:** `Algebra/BrauerGroup/Defs.lean` — `CSA`, `IsBrauerEquivalent`
  (reflexive/symmetric/transitive), `Brauer.CSA_Setoid`, `BrauerGroup` (a `Quotient`, **not yet a group**);
  `Algebra/Azumaya/Defs.lean`, `.../Basic.lean` — `IsAzumaya`, `AlgHom.mulLeftRight`,
  `AlgHom.mulLeftRight_bij`, `tensorEquivEnd`, `Algebra.IsCentral.instIsAzumaya`.
- **Maschke (the finite-group specialization):** `RepresentationTheory/Maschke.lean` —
  `IsSemisimpleRing (MonoidAlgebra k G)` and `IsSemisimpleModule k[G] V` under `[Field k] [Finite G]`
  `[NeZero (Nat.card G : k)]`.

## What is missing (build here)

The **invariance of the Wedderburn data**: that the block count, the degrees `nᵢ`, and the division rings
`Dᵢ` are isomorphism invariants, packaged as an equivalence with the isotypic components and hence with
isomorphism classes of simple modules; the explicit **simple-module ⇆ block ⇆ primitive-idempotent**
dictionary. The finite-dimensional **double-centralizer theorem** `A = End_D(V)` for a simple faithful
module (sharpening `Module.Finite.toModuleEnd_moduleEnd_surjective` from surjectivity to a bijection with
the right dimension count), and the **Jacobson-Chevalley density** corollaries. The theory of **central
simple algebras**: that `dim_K A` is a **perfect square**, that a tensor product of central simple
algebras is central simple (Mathlib has only centrality, via `Algebra.Central.TensorProduct`), the
**opposite-algebra isomorphism** `A ⊗_K Aᵒᵖ ≅ Mₙ(K)` (packaging Azumaya), and the reduced degree. **Skolem-
Noether** (two `K`-algebra homomorphisms from a simple algebra into a central simple algebra are conjugate)
and the **centralizer/double-centralizer theorem** for a simple subalgebra `B ⊆ A`
(`dim_K B · dim_K C_A(B) = dim_K A`, `C_A(C_A(B)) = B`, `C_A(B)` central simple). The **Brauer group as a
group** (well-defined multiplication from tensor product on Brauer classes, identity `[K]`, inverse
`[Aᵒᵖ]`), functoriality under base change, and **splitting fields** (a field `L` splits `A` iff
`A ⊗_K L ≅ Mₙ(L)`; every central simple algebra is split by a finite separable extension and by a maximal
subfield of the underlying division algebra), the **index** and **degree**. None of these is upstream as
stated; each object here also gets its basic API, not only the headline theorem.

`Suggested.lean` pins the load-bearing objects (`wedderburnComponents`, `simpleModuleEquivBlock`,
`endEquivMatrix`, `isCentral_of_isSimpleModule`, `finrank_isSquare`, `tensorOpEquivMatrix`,
`skolemNoether`, `centralizer_isSimple`, `brauerMul`, `IsSplittingField`, `splits_of_finrank`) and the
named milestones below as `sorry`-targets.

---

## The build, in layers

The ordering is the dependency order. Layers 0-3 are the general semisimple theory over a ring; Layers 4-6
are the central-simple and Brauer theory over a field, resting on Layers 0-3.

### Layer 0: the Jacobson radical and the semisimplicity criterion

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
  and over `[IsAlgClosed k]` the collapse `End_k S ≃ₐ[k] k` (from `finrank_endomorphism_simple_eq_one`).
- **The isotypic decomposition as counted data.** Consume `isotypicComponents` and its finiteness; build
  the equivalence between `isotypicComponents R M` and **isomorphism classes of simple submodules of `M`**,
  and, for `M = R`, between these and the Wedderburn blocks of Layer 2. This is the counting spine reused
  everywhere downstream (and by [CharacterTheory](../CharacterTheory/README.md) for
  `#irreducibles = #conjugacy classes`).

### Layer 2: Artin-Wedderburn, assembled with uniqueness

- **The decomposition, named.** From `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing` (and the
  algebra/finite/alg-closed forms), pin `wedderburnComponents R`: the finite index of blocks, the degrees
  `n : ι → ℕ`, the division rings `D : ι → Type u`, and the equivalence
  `R ≃+* ∏ᵢ Matₙᵢ(Dᵢ)`. Provide the algebra form over a base and the `ᵐᵒᵖ`-endomorphism form together.
- **Uniqueness / invariance.** The block index is equivalent to `isotypicComponents R R` and hence to
  isomorphism classes of simple `R`-modules (Layer 1); the degree `nᵢ` is the multiplicity of `Sᵢ` in `R`,
  and `Dᵢ ≃ (End R Sᵢ)ᵐᵒᵖ`. Two Wedderburn presentations of the same `R` have the same block multiset. This
  is the theorem that makes "the degrees" and "the division rings" well-defined objects.
- **The dimension count.** For a finite-dimensional semisimple `K`-algebra,
  `finrank K A = ∑ᵢ (nᵢ)² · finrank K Dᵢ`, and over `[IsAlgClosed k]`, `finrank k A = ∑ᵢ (nᵢ)²`. This is
  the identity [CharacterTheory](../CharacterTheory/README.md) uses as `∑ nᵢ² = |G|`.

### Layer 3: the double-centralizer (density) theorem

- **From surjective to bijective.** Consume `Module.Finite.toModuleEnd_moduleEnd_surjective`. For a simple
  module `M` over a ring `R` that is finite-dimensional over `K`, with `D = End R M`, sharpen this to the
  **double-centralizer theorem**: the natural map `R → End_D M` is surjective, and when `M` is **faithful**
  (equivalently `R` simple with `M` its simple module) it is a **ring isomorphism** `R ≃ End_D M ≃ Mₙ(D)`,
  recovering Wedderburn for a simple ring intrinsically.
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
  centrality of the center). The **dimension is a perfect square** when `K` is algebraically closed, and in
  general `finrank K A = (deg A)²` with `deg A` the **degree**; define `deg` and the **index** `ind A`
  (`= deg D`).
- **Tensor product of central simple is central simple.** Mathlib proves centrality of `A ⊗_K B`; build the
  missing **simplicity** of `A ⊗_K B` for `A, B` central simple over a field (so central simple algebras
  are closed under `⊗_K`), with `finrank K (A ⊗ B) = finrank K A · finrank K B`.
- **The opposite isomorphism.** Package `AlgHom.mulLeftRight`/`IsAzumaya` into
  `A ⊗_K Aᵒᵖ ≃ₐ[K] End_K A ≃ₐ[K] Mₙ(K)` (`n = finrank K A`), the fact that makes `[Aᵒᵖ]` the Brauer
  inverse of `[A]`.

### Layer 5: Skolem-Noether and the centralizer theorem

- **Skolem-Noether.** Two `K`-algebra homomorphisms `f, g : B →ₐ[K] A` from a simple `K`-algebra `B` into a
  central simple `K`-algebra `A` are **conjugate**: there is a unit `u ∈ Aˣ` with `g x = u · f x · u⁻¹` for
  all `x`. In particular every `K`-algebra automorphism of a central simple algebra is **inner**. Proved
  via the module density of Layer 3 applied to the two `B ⊗ Aᵒᵖ`-module structures on `A`.
- **The centralizer theorem.** For a simple `K`-subalgebra `B ⊆ A` with `A` central simple, the centralizer
  `C = Subalgebra.centralizer K (B : Set A)` is **simple**, `finrank K B · finrank K C = finrank K A`,
  `C_A(C) = B` (double centralizer), and `C` is central simple iff `B` is central over `K`. Build on the
  tensor-centralizer identities Mathlib already has for the ambient `A ⊗_K Aᵒᵖ`.

### Layer 6: the Brauer group and splitting fields

- **The Brauer group as a group.** Consume `IsBrauerEquivalent`, `Brauer.CSA_Setoid`, `BrauerGroup`. Build
  the **`CommGroup` structure** on `BrauerGroup K`: multiplication induced by `⊗_K` (well-defined on Brauer
  classes by Layer 4 simplicity and the matrix-absorption `Mₘ(A) ⊗ Mₙ(B) ≃ Mₘₙ(A ⊗ B)`), identity `[K]`,
  inverse `[Aᵒᵖ]` (Layer 4 opposite isomorphism), commutativity from `A ⊗ B ≃ B ⊗ A`. Each Brauer class has
  a **unique division-algebra representative** (Layer 2 uniqueness).
- **Base change is a homomorphism.** `A ↦ A ⊗_K L` induces a group homomorphism
  `BrauerGroup K → BrauerGroup L` for a field extension `L / K`; its kernel is the classes **split by `L`**.
- **Splitting fields.** `L` **splits** `A` when `A ⊗_K L ≃ₐ[L] Mₙ(L)`; equivalently `[A]` is in the kernel
  of base change. Build: over `[IsAlgClosed k]` every central simple algebra is split (Layer 2 alg-closed
  Wedderburn); a **maximal subfield** `L` of a central division algebra `D` (with `finrank K L = deg D`)
  splits `D`; and every central simple `K`-algebra is split by a **finite separable** extension.
- **Finite and real base fields.** `BrauerGroup` of a **finite field** is trivial (little Wedderburn: no
  noncommutative finite division algebras). `BrauerGroup ℝ ≃ ℤ/2`, generated by the class of the
  **Hamilton quaternions** `ℍ[ℝ]` (a worked summit of the whole development).

---

## Worked examples (acceptance criteria)

- **Matrix algebras.** `Mₙ(K)` is central simple over `K`, split, Brauer-trivial; its only simple module is
  `Kⁿ`, and `End_{Mₙ(K)} Kⁿ ≃ K` (Layer 3 double centralizer on the smallest case).
- **The Hamilton quaternions.** `ℍ[ℝ]` is a central division algebra over `ℝ` with `finrank ℝ ℍ[ℝ] = 4`
  (`deg = 2`); `ℍ[ℝ] ⊗_ℝ ℍ[ℝ] ≃ M₄(ℝ)` (so `[ℍ]` has order 2), `ℂ` is a maximal subfield splitting it
  (`ℍ ⊗_ℝ ℂ ≃ M₂(ℂ)`), and `[ℍ]` generates `BrauerGroup ℝ ≃ ℤ/2`. This exercises Layers 4-6 end to end.
- **Complex numbers over the reals.** `ℂ` is central simple over `ℝ`? No: `ℂ` is a **field extension**, not
  central (`Algebra.IsCentral ℝ ℂ` is false); it is the maximal subfield that splits `ℍ`. This is the
  running check that "central" is not dropped.
- **Group algebras (link to character theory).** For `[Field k] [Finite G] [NeZero (Nat.card G : k)]`,
  `k[G]` is semisimple (Maschke, consumed), so Layer 2 gives `k[G] ≃ ∏ᵢ Matₙᵢ(Dᵢ)` and, over
  `[IsAlgClosed k]`, `∏ᵢ Matₙᵢ(k)` with `∑ nᵢ² = |G|` and block count `= #`isomorphism classes of simple
  modules. This is exactly what [CharacterTheory](../CharacterTheory/README.md) Layer 2 consumes.
- **Finite fields.** Every finite-dimensional division algebra over a finite field `𝔽_q` is `𝔽_q` itself
  (little Wedderburn, consumed), so every central simple `𝔽_q`-algebra is `Mₙ(𝔽_q)` and `BrauerGroup 𝔽_q`
  is trivial.
- **Skolem-Noether in the small.** Every `ℝ`-algebra automorphism of `ℍ[ℝ]` is inner (conjugation by a unit
  quaternion), and complex conjugation on `ℂ ⊆ ℍ` is realized by conjugation by `j`.

## Ordering

Layer 0 (Jacobson radical convenience API and left-right symmetry) and Layer 1 (Schur assembly, isotypic
counting) are independent and come first; both are mostly packaging of existing Mathlib. Layer 2
(Wedderburn assembled with uniqueness and the dimension count) needs Layer 1's isotypic counting. Layer 3
(double centralizer / density) needs Layer 1's Schur and Layer 2's simple-ring case. Layer 4 (central simple
algebras, tensor products, the opposite isomorphism) needs Layers 2-3 and moves to a field base. Layer 5
(Skolem-Noether, centralizer theorem) needs Layer 3's density and Layer 4's tensor theory. Layer 6 (the
Brauer group, splitting fields) needs Layers 4-5 for well-definedness of the product and the inverse. The
group-algebra and character-theory link is available from Layer 2 onward; the quaternion summit needs all
of Layers 4-6.

## References

- T. Y. Lam, *A First Course in Noncommutative Rings*, 2nd ed., Springer GTM 131 (2001) — semisimple rings,
  the Jacobson radical, the density theorem, Wedderburn-Artin, and an introduction to Brauer groups.
- R. S. Pierce, *Associative Algebras*, Springer GTM 88 (1982) — central simple algebras, the centralizer
  and double-centralizer theorems, Skolem-Noether, and the Brauer group in full.
- C. W. Curtis, I. Reiner, *Representation Theory of Finite Groups and Associative Algebras*, Wiley (1962) —
  semisimple algebras, the Wedderburn structure theory, and the module theory beneath character theory.
- N. Jacobson, *Basic Algebra II*, 2nd ed., Freeman (1989) — the density theorem, central simple algebras,
  and the Brauer group.
- P. Gille, T. Szamuely, *Central Simple Algebras and Galois Cohomology*, CUP (2006) — central simple
  algebras, splitting fields, the Brauer group, and its cohomological description.
- I. N. Herstein, *Noncommutative Rings*, Carus Mathematical Monographs 15, MAA (1968) — the Jacobson
  density theorem and the structure of primitive rings.
- B. Farb, R. K. Dennis, *Noncommutative Algebra*, Springer GTM 144 (1993) — a compact modern treatment of
  semisimple algebras, Skolem-Noether, and the Brauer group.
