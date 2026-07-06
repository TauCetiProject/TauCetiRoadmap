# Roadmap: quiver representations, path algebras, and Gabriel's theorem

Mathlib has the combinatorial substrate of quiver theory and nothing built on it. It defines a
**quiver** as a `class Quiver (V : Type u)` carrying `Hom : V → V → Type v`
(`Combinatorics/Quiver/Basic.lean`), the inductive type of **paths** `Quiver.Path a b` with
concatenation `Quiver.Path.comp` and `Quiver.Path.length` (`Combinatorics/Quiver/Path.lean`), and
**prefunctors** `V ⥤q W` between quivers (`Combinatorics/Quiver/Prefunctor.lean`). It has the **free
category on a quiver**, `CategoryTheory.Paths V`, whose morphisms are the paths and whose composition
is concatenation (`CategoryTheory/PathCategory/Basic.lean`, with `Paths.of : V ⥤q Paths V`). Every
`CategoryStruct` extends `Quiver`, so `ModuleCat k` is itself a quiver and prefunctors into it are
available for free. On the module side it has everything a representation theory rests on:
`ModuleCat k`, `MonoidAlgebra`, `FreeAlgebra` (`Algebra/FreeAlgebra.lean`), the semisimple structure
theory consumed by [semisimple algebras](../SemisimpleAlgebras/README.md), the Jacobson radical
`Ring.jacobson` (`RingTheory/Jacobson/Radical.lean`), finite-length modules `IsFiniteLength` and the
Jordan-Hölder theorem `CompositionSeries.jordan_holder` (`RingTheory/FiniteLength.lean`,
`Order/JordanHolder.lean`), `CategoryTheory.Simple` and `CategoryTheory.Indecomposable`, and the
abstract root-system and Dynkin machinery consumed by [root systems](../RootSystems/README.md).

What Mathlib does **not** have is the subject itself. There is **no path algebra**: nothing turns
`Quiver.Path` into a `k`-algebra `kQ`. There is **no theory of quiver representations** as modules over
`kQ`, no vertex simples/projectives/injectives, no dimension vectors. There is **no Krull-Schmidt
theorem**: `CategoryTheory.KrullSchmidt` does not exist, the string "Krull-Schmidt" appears once, in a
docstring warning in `CategoryTheory/Preadditive/Mat.lean`, and the unique decomposition of a
finite-dimensional module into indecomposables is unbuilt. There is **no Euler/Tits form**, **no
reflection functors**, **no Gabriel's theorem** in either form (finite representation type ⇔ ADE, and
every finite-dimensional algebra as `kQ/I`), and **no Auslander-Reiten theory** whatsoever, no
almost-split sequences, no AR translate `τ`, no AR quiver.

This roadmap builds that theory, from the path algebra to the two summits: **Gabriel's theorem**, that
a connected quiver has finite representation type iff its underlying graph is a simply-laced (ADE)
Dynkin diagram, with the indecomposable representations then in bijection with the positive roots of
the associated root system (dimension vector = positive root); and the **Auslander-Reiten theory** that
organizes the indecomposables and their maps into the AR quiver. The ADE half connects directly to
[root systems](../RootSystems/README.md), whose positive-root and Dynkin-classification API it
consumes; the general finite-dimensional-algebra frame (radical, projective covers, injective
envelopes, the Cartan matrix of an algebra, basic algebras, and Gabriel's presentation `kQ/I`) rests on
[semisimple algebras](../SemisimpleAlgebras/README.md). Suggested home:
`TauCeti/RepresentationTheory/Quiver/` (path algebra, representations, Gabriel, AR theory) and
`TauCeti/RingTheory/KrullSchmidt/` (the Krull-Schmidt theorem, which is a statement about
finite-length modules and is upstreamable to Mathlib on its own).

## Standing conventions

- **The base field.** `k` is a field throughout (`[Field k]`). The general structure theory (path
  algebra, representations, Krull-Schmidt) needs no more. **Gabriel's theorem, reflection functors, and
  Auslander-Reiten theory are stated over an algebraically closed `k`** (`[IsAlgClosed k]`): the
  bijection with positive roots and the `kQ/I` presentation are false over a field that is not
  algebraically closed (division-algebra endomorphism rings appear). Spell `[IsAlgClosed k]` in each
  result that needs it rather than bundling it into the ambient context.
- **Quivers are finite.** `Q` is a finite quiver: `[Quiver Q]` with `[Finite Q]` on the vertices and
  `[∀ a b, Finite (a ⟶ b)]` (finitely many arrows). Reuse Mathlib's `Quiver` class, `Quiver.Path`,
  `Quiver.Path.comp`, `Quiver.Path.length`, and `Prefunctor`; never a private quiver datum. "Connected"
  means connected as an underlying graph (`Quiver.symmetrify` is Mathlib's symmetrization);
  **acyclic** is stated as `Finite (Σ a b : Q, Quiver.Path a b)` (finitely many paths), the exact
  condition making `kQ` finite-dimensional, rather than a fresh predicate about loops.
- **The path algebra is `kQ`, built once.** `pathAlgebra k Q` is the free `k`-module on the set of
  paths `Σ a b : Q, Quiver.Path a b` with product given by concatenation (composable) or `0`
  (non-composable). It is a `Ring` and a `k`-`Algebra`, with unit `∑ᵥ eᵥ` the sum of the trivial paths
  (`Quiver.Path.nil`). Pin the paths as an explicit `Basis`. Reuse `Finsupp` (`→₀`) as the underlying
  module, so `AddCommGroup` and `Module k` come from Mathlib; only the multiplication is built.
- **Representations are functors out of the path category, and modules over `kQ`.** A representation is
  a functor `Paths Q ⥤ ModuleCat k`: a `k`-module at each vertex and a `k`-linear map along each arrow,
  functorial in path concatenation. This is Mathlib-native (it is `Paths Q ⥤ ModuleCat k` with no new
  category), and `QuiverRep k Q` abbreviates it. The load-bearing theorem
  `quiverRepEquivalence : (Paths Q ⥤ ModuleCat k) ≌ ModuleCat (pathAlgebra k Q)` identifies
  representations with `kQ`-modules; every module-theoretic notion (sub, quotient, direct sum via
  biproducts, simple, indecomposable) is then Mathlib's, transported along it, never redefined.
- **Finite-dimensional means `FiniteDimensional k` on each vertex space.** `IsFiniteDimensional` for a
  representation is `∀ v, FiniteDimensional k (M.obj v)`; over a finite quiver this is the same as
  `FiniteDimensional (pathAlgebra k Q)`-finiteness of the corresponding module. Krull-Schmidt, the
  dimension vector, and everything downstream live on finite-dimensional representations. Use
  `FiniteDimensional` / `Module.Finite` and `IsFiniteLength`, never a private finiteness predicate.
- **Dimension vectors are `Q → ℕ`; the Euler form is `ℤ`-bilinear on `Q → ℤ`.** The dimension vector
  `dimVector M v = Module.finrank k (M.obj v)` lands in `Q → ℕ`; the Euler (Ringel) form `eulerForm`
  and the Tits form `titsForm` are defined on `Q → ℤ` and restricted along `Nat.cast`. Roots and the
  Weyl-group action are imported from [root systems](../RootSystems/README.md): the reflection at a
  vertex `i` is the simple reflection `sᵢ`, and the Coxeter functor realizes the Coxeter element. Use
  `RootPairing`, `RootPairing.Base`, and `Base.cartanMatrix` from Mathlib; do not privately re-encode a
  root system.
- **`τ` is the Auslander-Reiten translate, `D Tr`.** The AR translate `arTranslate` is the composite of
  the transpose (`Tr`, from a minimal projective presentation) and the `k`-duality `D = Hom_k(-, k)`.
  Almost-split sequences are `CategoryTheory.ShortComplex`s that are `ShortComplex.ShortExact`; the AR
  quiver is a genuine `Quiver` on isomorphism classes of indecomposables, arrows the irreducible
  morphisms. Reuse `ShortComplex`, `ShortExact`, and `Quiver`.

## What Mathlib already has (consume)

- **Quivers, paths, prefunctors:** `Combinatorics/Quiver/Basic.lean` — `Quiver` (with `Hom`, `⟶`),
  `Quiver.IsThin`, `Quiver.symmetrify` (`.../Symmetric.lean`); `Combinatorics/Quiver/Path.lean` —
  `Quiver.Path`, `Quiver.Path.nil`, `Quiver.Path.cons`, `Quiver.Path.comp`, `Quiver.Path.length`,
  `Quiver.Path.toPath`; `Combinatorics/Quiver/Prefunctor.lean` — `Prefunctor` (`⥤q`), `Prefunctor.comp`
  (`⋙q`), `Prefunctor.id`; `Combinatorics/Quiver/ConnectedComponent.lean`,
  `Combinatorics/Quiver/Subquiver.lean`.
- **The free category on a quiver:** `CategoryTheory/PathCategory/Basic.lean` — `CategoryTheory.Paths`,
  its `Category` instance (`categoryPaths`, morphisms are paths, composition is concatenation),
  `Paths.of : V ⥤q Paths V`, `Paths.lift`, and the induction principles `induction_fixed_source`,
  `induction_fixed_target`. Every `CategoryStruct` extends `Quiver` (`CategoryTheory/Category/Basic.lean`),
  so `ModuleCat k` is a `Quiver`.
- **Modules and module categories:** `Algebra/Category/ModuleCat/Basic.lean` (`ModuleCat`), its abelian
  and finite-biproduct structure; `Algebra/FreeAlgebra.lean` (`FreeAlgebra`), `Algebra/MonoidAlgebra/*`,
  `Data/Finsupp/*` (`Finsupp`, `→₀`), `LinearAlgebra/Basis/Defs.lean` (`Basis`),
  `LinearAlgebra/Dimension/*` (`Module.finrank`, `FiniteDimensional`, `Module.Finite`).
- **Simple, indecomposable, biproducts:** `CategoryTheory/Simple.lean` (`CategoryTheory.Simple`),
  `CategoryTheory/Limits/Shapes/BinaryBiproducts.lean` (`CategoryTheory.Indecomposable`, `biprod`,
  `HasBinaryBiproducts`), and the Schur division-ring instance `Module.End.instDivisionRing`
  (`RingTheory/SimpleModule/Basic.lean`).
- **Finite length and Jordan-Hölder:** `RingTheory/FiniteLength.lean` (`IsFiniteLength`,
  `isFiniteLength_iff_isNoetherian_isArtinian`, `isFiniteLength_iff_exists_compositionSeries`),
  `Order/JordanHolder.lean` (`CompositionSeries`, `CompositionSeries.jordan_holder`, `JordanHolderLattice`),
  `RingTheory/Length.lean`. These are the raw material for the endomorphism-ring-is-local (Fitting)
  argument behind Krull-Schmidt.
- **Local rings:** `RingTheory/LocalRing/Defs.lean` (`IsLocalRing`), the target for the endomorphism ring
  of an indecomposable.
- **The Jacobson radical and semisimplicity:** `RingTheory/Jacobson/Radical.lean` (`Ring.jacobson`,
  `Module.jacobson`), `RingTheory/Artinian/Ring.lean` (`IsArtinianRing.isNilpotent_jacobson_bot`),
  `RingTheory/Artinian/Module.lean` (`IsArtinianRing.isSemisimpleRing_iff_jacobson`), and the whole
  Wedderburn development consumed via [semisimple algebras](../SemisimpleAlgebras/README.md).
- **Projectives and injectives, categorically:** `CategoryTheory/Preadditive/Projective/Basic.lean`
  (`CategoryTheory.Projective`, `EnoughProjectives`), `CategoryTheory/Preadditive/Injective/Basic.lean`
  (`CategoryTheory.Injective`), `Algebra/Category/ModuleCat/Projective.lean`. Note: Mathlib has
  projective/injective **objects** but **no projective covers or injective envelopes**; those are built
  here.
- **Short complexes and exactness:** `Algebra/Homology/ShortComplex/Basic.lean`
  (`CategoryTheory.ShortComplex`), `Algebra/Homology/ShortComplex/ShortExact.lean`
  (`ShortComplex.ShortExact`, `ShortExact.fIsKernel`, `ShortExact.gIsCokernel`) — the vehicle for
  almost-split sequences.
- **Morita equivalence:** `RingTheory/Morita/Basic.lean` (`MoritaEquivalence R A B`, `refl`, `symm`,
  `trans`), `RingTheory/Morita/Matrix.lean` — the statement type of Gabriel's `kQ/I` theorem.
- **Root systems and Dynkin diagrams (via the sibling roadmap):** `LinearAlgebra/RootSystem/Defs.lean`
  (`RootPairing`, `RootPairing.reflection`), `.../Base.lean` (`RootPairing.Base`, `Base.height`,
  `Base.IsPos`), `.../CartanMatrix.lean` (`Base.cartanMatrix`, `equivOfCartanMatrixEq`,
  `induction_on_cartanMatrix`), `.../IsValuedIn.lean` (`IsCrystallographic`), `.../Reduced.lean`
  (`IsReduced`), `.../Irreducible.lean` (`IsIrreducible`), and the simply-laced Coxeter matrices
  `CoxeterMatrix.A`, `.D`, `.E₆`, `.E₇`, `.E₈` (`GroupTheory/Coxeter/Matrix.lean`). The **positive
  roots as a set**, the **Weyl-group action on dimension vectors**, and the **ADE Dynkin enumeration**
  are consumed from [root systems](../RootSystems/README.md), where they are the named targets
  `posRoots`, `DynkinType`, and `classification`.

## What is missing (build here)

The **path algebra** `kQ`: its ring and `k`-algebra structure, the path `Basis`, the unit as a sum of
vertex idempotents `eᵥ`, and finite-dimensionality for finite acyclic `Q`. The **category of
representations** `Paths Q ⥤ ModuleCat k`, the equivalence with `kQ`-modules, the **vertex simples**
`Sᵢ`, **indecomposable projectives** `Pᵢ = kQ·eᵢ` and **injectives** `Iᵢ`, and sub/quotient/direct-sum
via the transported abelian structure. The **Krull-Schmidt theorem**: the endomorphism ring of a
finite-dimensional indecomposable is local (Fitting's lemma from `IsFiniteLength`), every
finite-dimensional module is a finite biproduct of indecomposables, and the decomposition is **unique**
up to a permutation matching isomorphism types. The **general finite-dimensional-algebra frame**: the
convenience API for `Ring.jacobson A` on a finite-dimensional `A` (nilpotent, semisimple quotient),
**projective covers** and **injective envelopes** (which Mathlib lacks), the **Cartan matrix of an
algebra** `Cᵢⱼ = [Pᵢ : Sⱼ]`, **basic algebras**, and **Gabriel's presentation theorem**: over
`[IsAlgClosed k]` every finite-dimensional algebra is Morita-equivalent to `kQ/I` for its Ext-quiver `Q`
and an admissible ideal `I`. The **Euler/Ringel form** `⟨d, e⟩ = ∑ᵥ dᵥeᵥ − ∑_{a : i→j} d_i e_j`, the
**Tits form** `q(d) = ⟨d, d⟩`, the **dimension vector**, and the homological identity
`⟨dim M, dim N⟩ = dim Hom(M, N) − dim Ext¹(M, N)`. The **reflection functors** (Bernstein-Gelfand-
Ponomarev) at a sink or source, their effect `dim ↦ sᵢ · dim` (simple reflection), and the **Coxeter
functor** `C⁺` with its Coxeter-element action. **Gabriel's theorem**: finite representation type ⇔
underlying graph is ADE, and, over `[IsAlgClosed k]`, the **bijection between isomorphism classes of
indecomposables and positive roots**, `M ↦ dim M`. And **Auslander-Reiten theory**: the AR translate
`τ = D Tr`, **almost-split (AR) sequences** and their existence, **irreducible morphisms**, and the
**AR quiver** as a `Quiver` on indecomposables. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`pathAlgebra`, `pathAlgebraBasis`, `QuiverRep`,
`quiverRepEquivalence`, `simpleRep`, `indecProjRep`, `KrullSchmidt`-style decomposition, `cartanMatrix`,
`IsBasic`, `eulerForm`, `titsForm`, `dimVector`, `reflectionFunctor`, `coxeterFunctor`, `IsFiniteRepType`,
`gabriel_finiteRepType_iff`, `gabriel_indecomposable_equiv_posRoot`, `arTranslate`, `IsAlmostSplit`,
`arQuiver`) and the milestones below as `sorry`-targets, so each is claimable and the summit statements
are machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering below is the dependency order. Layers 0-2 are the general theory over any field; Layer 3 is
the finite-dimensional-algebra frame; Layers 4-6 add the Euler form, Gabriel's theorem, and
Auslander-Reiten theory, and are stated over an algebraically closed field.

### Layer 0: quivers and the path algebra

- **The path algebra.** `pathAlgebra k Q`, the free `k`-module `(Σ a b : Q, Quiver.Path a b) →₀ k` with
  product concatenating composable paths (`Quiver.Path.comp`) and sending non-composable pairs to `0`;
  a `Ring` and a `k`-`Algebra`. Build its unit `1 = ∑ᵥ eᵥ` as the sum of trivial paths
  (`Quiver.Path.nil`), the **vertex idempotents** `eᵥ` (orthogonal, `eᵥ eᵥ' = 0` for `v ≠ v'`,
  `∑ᵥ eᵥ = 1`), and associativity from `Quiver.Path.comp_assoc`.
- **The path basis.** `pathAlgebraBasis : Basis (Σ a b : Q, Quiver.Path a b) k (pathAlgebra k Q)`, so
  arrows generate `kQ` as an algebra and paths are a `k`-basis. The subalgebra generated by the arrows
  is all of `kQ`.
- **Finite dimension.** For a finite quiver with finitely many paths
  (`Finite (Σ a b : Q, Quiver.Path a b)`, the acyclicity condition), `FiniteDimensional k (pathAlgebra k Q)`,
  with `Module.finrank k (pathAlgebra k Q)` the number of paths. The **loop quiver** (one vertex, one
  arrow) has `kQ ≅ k[X]` (`MonoidAlgebra k ℕ`), infinite-dimensional; record this as the boundary case.

### Layer 1: representations of a quiver as `kQ`-modules

- **The category of representations.** `QuiverRep k Q := Paths Q ⥤ ModuleCat k` (a `k`-module at each
  vertex, a linear map along each arrow), abelian with the pointwise structure; sub, quotient, and
  finite direct sums (biproducts) are the functor-category constructions.
- **Representations are modules.** `quiverRepEquivalence : (Paths Q ⥤ ModuleCat k) ≌ ModuleCat (pathAlgebra k Q)`,
  a `k`-linear equivalence transporting simple, indecomposable, projective, injective, finite length,
  and dimension between the two sides. Every downstream statement about representations is a statement
  about `kQ`-modules read through this equivalence.
- **Vertex simples, projectives, injectives.** `simpleRep i : QuiverRep k Q`, the representation `k` at
  `i` and `0` elsewhere, is **simple**; over an acyclic quiver these are all the simples. The
  **indecomposable projective** `indecProjRep i` corresponds to `kQ · eᵢ` (basis: paths **starting**
  at `i`) and the **indecomposable injective** `indecInjRep i` to paths **ending** at `i`; `Pᵢ ↠ Sᵢ`
  and `Sᵢ ↪ Iᵢ`. These index the columns and rows of the Cartan matrix (Layer 3).

### Layer 2: the Krull-Schmidt theorem

Mathlib has neither `KrullSchmidt` nor the local-endomorphism-ring lemma; both are built here, over a
finite-dimensional algebra `A`, and are upstreamable.

- **Fitting's lemma.** For a module of finite length (`IsFiniteLength`), an endomorphism splits the
  module as `im fⁿ ⊕ ker fⁿ` for large `n`; hence the module is **indecomposable iff its endomorphism
  ring is local** (`IsLocalRing (Module.End A M)`), every endomorphism being nilpotent or invertible.
  Consume `IsFiniteLength`, `isFiniteLength_iff_isNoetherian_isArtinian`, and `Module.End`.
- **Existence of a decomposition.** A finite-length (hence any finite-dimensional) module is a **finite
  direct sum of indecomposables**, by induction on length.
- **Uniqueness (Krull-Schmidt).** Two decompositions of a finite-dimensional module into
  indecomposables have the same number of summands and a **bijection matching the summands up to
  isomorphism**, proved by the exchange argument on local endomorphism rings. Package as
  `KrullSchmidt`-style statements at the module level and transport to `QuiverRep k Q`. This is the
  theorem that makes "the multiset of indecomposable summands" and "the indecomposable representations"
  well-defined objects, used by every later layer.

### Layer 3: the structure of a finite-dimensional algebra

The frame in which quiver representations sit. Stated for a finite-dimensional `k`-algebra `A`,
specializing to `A = pathAlgebra k Q` and `A = kQ/I`. Over `[IsAlgClosed k]` for the presentation
theorem.

- **The radical, packaged.** For finite-dimensional `A`, `Ring.jacobson A` is a **nilpotent** two-sided
  ideal (`IsArtinianRing.isNilpotent_jacobson_bot`), `A ⧸ Ring.jacobson A` is **semisimple**
  (`IsArtinianRing.isSemisimpleRing_iff_jacobson`), and its Wedderburn decomposition indexes the simple
  modules; over `[IsAlgClosed k]` the blocks are matrix algebras over `k`. Consume
  [semisimple algebras](../SemisimpleAlgebras/README.md) for the Wedderburn side.
- **Projective covers and injective envelopes.** Build `projectiveCover M`: a projective `P` with an
  essential epimorphism `P ↠ M` (superfluous kernel), **unique up to isomorphism**, existing because
  `A` is semiperfect (finite-dimensional); dually `injectiveEnvelope M`. These are absent from Mathlib.
  The indecomposable projectives are exactly `{Pᵢ}` (Layer 1), `Pᵢ = ` projective cover of `Sᵢ`.
- **The Cartan matrix of an algebra.** `cartanMatrix A : Matrix (Simples A) (Simples A) ℕ`,
  `Cᵢⱼ = [Pᵢ : Sⱼ]` the Jordan-Hölder multiplicity of `Sⱼ` in the projective cover `Pᵢ` (equivalently
  `dim_k Hom(Pⱼ, Pᵢ)` up to the division-ring dimensions), well-defined by Jordan-Hölder
  (`CompositionSeries.jordan_holder`). For a path algebra `Cᵢⱼ` counts paths `i → j` modulo the
  relations.
- **Basic algebras and Morita reduction.** `IsBasic A`: `A ⧸ Ring.jacobson A` is a product of division
  rings (no repeated matrix blocks), equivalently `A ≅ End of a minimal faithful projective`. Every
  finite-dimensional `A` is **Morita-equivalent to a basic algebra** `A^b` (the endomorphism algebra of
  `⊕ Pᵢ`, one per simple), via `MoritaEquivalence`.
- **Gabriel's presentation theorem.** Over `[IsAlgClosed k]`, a basic finite-dimensional algebra `A` is
  `kQ_A / I` for its **Ext-quiver** `Q_A` (vertices the simples, arrows a basis of
  `Ext¹(Sᵢ, Sⱼ) = (rad A / rad² A)` between blocks) and an **admissible ideal** `I`
  (`rad^N ⊆ I ⊆ rad²`); hence **every** finite-dimensional algebra is Morita-equivalent to some `kQ/I`.
  State as `exists_quiver_admissibleIdeal_morita`.

### Layer 4: the Euler form, dimension vectors, and reflection functors

Stated over `[IsAlgClosed k]`, `Q` a finite quiver, `Q` acyclic where the homological identity needs
it.

- **Dimension vectors.** `dimVector M v = Module.finrank k (M.obj v) : Q → ℕ`, additive on direct sums
  and short exact sequences. On the `kQ`-module side it records the `k`-dimension of `eᵥ · M`.
- **The Euler and Tits forms.** `eulerForm d e = ∑ᵥ dᵥ eᵥ − ∑_{a : i → j} d_i e_j` on `Q → ℤ` (a
  bilinear form, the arrows summed over `Σ i j, (i ⟶ j)`), and the **Tits form**
  `titsForm d = eulerForm d d`, a quadratic form. Its symmetrization is the form whose Gram matrix is
  `2·I − (adjacency + adjacencyᵀ)`, i.e. the Cartan matrix of the underlying graph; this is the exact
  link to [root systems](../RootSystems/README.md).
- **The homological interpretation.** For finite-dimensional representations `M, N` over an **acyclic**
  `Q` (global dimension `≤ 1`, so higher Ext vanish),
  `eulerForm (dimVector M) (dimVector N) = dim_k Hom(M, N) − dim_k Ext¹(M, N)`. In particular
  `titsForm (dim M) = dim End(M) − dim Ext¹(M, M)`, so an indecomposable with `titsForm (dim M) = 1`
  is **rigid** (`Ext¹(M, M) = 0`, `End(M) = k`): a **brick**.
- **Reflection functors (BGP).** For a vertex `i` that is a **sink** (all arrows into `i`), the
  reflection functor `reflectionFunctor⁺ i : QuiverRep k Q ⥤ QuiverRep k (Q.reflect i)` to the quiver
  with all arrows at `i` reversed; dually `reflectionFunctor⁻` at a **source**. On dimension vectors it
  acts by the **simple reflection** `sᵢ` of the Tits form: `dim (C⁺ᵢ M) = sᵢ · dim M` whenever `M` has
  no `Sᵢ` summand. Consume `RootPairing.reflection` for `sᵢ`.
- **The Coxeter functor.** `coxeterFunctor = ` the composite of the `reflectionFunctor⁺` over a sink-
  admissible ordering of the vertices; `dim (coxeterFunctor M) = c · dim M` for the **Coxeter element**
  `c = s₁ ⋯ sₙ` of the Weyl group. This is the engine that generates all positive roots from the
  simple ones and drives the Layer 5 bijection.

### Layer 5: Gabriel's theorem (the ADE classification)

The first summit. `Q` connected, `[IsAlgClosed k]`.

- **Finite representation type.** `IsFiniteRepType k Q`: only **finitely many** isomorphism classes of
  finite-dimensional indecomposable representations. Well-posed by Krull-Schmidt (Layer 2).
- **Gabriel's dichotomy.** `gabriel_finiteRepType_iff`: a connected quiver `Q` has finite
  representation type **iff** its underlying graph is a simply-laced (ADE) Dynkin diagram — equivalently
  its **Tits form is positive definite** (`titsForm` is `RootPairing`-realizable of type
  `A/D/E`). State the graph condition through the Cartan matrix and
  [root systems](../RootSystems/README.md)' Dynkin data (`CoxeterMatrix.A/D/E₆/E₇/E₈`), the
  positive-definite condition through `titsForm`. The `A₂` quiver `• → •` is finite type; the
  **Kronecker quiver** `• ⇉ •` (type `Ã₁`, Tits form positive *semi*definite) is the boundary and has
  infinite (tame) type.
- **Indecomposables are positive roots.** For `Q` of ADE type,
  `gabriel_indecomposable_equiv_posRoot`: `M ↦ dimVector M` is a **bijection** from isomorphism classes
  of finite-dimensional indecomposable representations to the **positive roots** of the associated root
  system, so each indecomposable is a **brick** (`End = k`, `Ext¹ = 0`) and is determined up to
  isomorphism by its dimension vector. Consume `posRoots` from
  [root systems](../RootSystems/README.md). The construction: apply the Coxeter functor / reflection
  functors of Layer 4 to reach every positive root from a simple root (`Sᵢ ↦ αᵢ`), the Weyl-orbit
  argument.
- **The count.** `Nat.card (indecomposables) = (posRoots).ncard`; for `Aₙ` this is `n(n+1)/2`, for
  `D₄` it is `12`.

### Layer 6: Auslander-Reiten theory

The organizing theory of the indecomposables and their maps. `A = kQ/I` finite-dimensional,
`[IsAlgClosed k]`.

- **Irreducible morphisms.** `IsIrreducibleMorphism f`: `f` is neither a split mono nor a split epi, and
  in every factorization `f = h ∘ g` either `g` is a split mono or `h` is a split epi. The **radical**
  of the module category (maps that are non-isomorphisms between indecomposables) and its square; the
  irreducible maps are `rad / rad²`.
- **The AR translate.** `arTranslate M = D (Tr M)`, the composite of the **transpose** `Tr` (cokernel of
  `Hom(-, A)` applied to a minimal projective presentation `P₁ → P₀ → M → 0`) and the `k`-**duality**
  `D = Hom_k(−, k)`. It is a bijection from non-projective indecomposables to non-injective
  indecomposables, with inverse `Tr D`.
- **Almost-split sequences.** `IsAlmostSplit S` for a `ShortComplex S`, `0 → τM → E → M → 0`, that is
  `ShortComplex.ShortExact`, non-split, with `M` indecomposable non-projective and every non-split-epi
  `X → M` factoring through `E → M` (right almost split), dually on the left at `τM`. **Existence and
  uniqueness** (`exists_almostSplitSequence`): for each indecomposable non-projective `M` there is a
  unique almost-split sequence ending at `M`, the Auslander-Reiten theorem.
- **The AR quiver.** `arQuiver k A`: a `Quiver` whose vertices are isomorphism classes of
  finite-dimensional indecomposables and whose arrows `[M] → [N]` are a basis of the irreducible
  morphisms `rad(M, N) / rad²(M, N)`, together with the translate `τ` as a partial map on vertices
  (the AR translate makes it a **stable translation quiver** away from projectives/injectives). For a
  representation-finite algebra it is a **finite** quiver and displays all indecomposables and the maps
  among them; for `Aₙ` it is the well-known triangular mesh.

---

## Worked examples (acceptance criteria)

- **The `A₂` quiver `• → •`.** `pathAlgebra k A₂` is the `3`-dimensional algebra of upper-triangular
  `2×2` matrices (paths: `e₁`, `e₂`, the single arrow). It has exactly **three** indecomposable
  representations, `S₁ = (k → 0)`, `S₂ = (0 → k)`, and `P₁ = (k →^{id} k)`, with dimension vectors
  `(1,0)`, `(0,1)`, `(1,1)` — the **three positive roots of `A₂`**, `α₁`, `α₂`, `α₁+α₂`. Acceptance:
  `gabriel_indecomposable_equiv_posRoot` restricts to this bijection; the reflection functor at the sink
  swaps `S₁ ↔ S₂` and sends `P₁ ↦ P₁`, realizing `s₁` on `{(1,0),(0,1),(1,1)}`; the AR quiver is the
  three-vertex mesh `S₂ → P₁ → S₁` with `τ S₁ = S₂`.
- **The Kronecker quiver `• ⇉ •` (type `Ã₁`).** Two vertices, two parallel arrows;
  `pathAlgebra k` is `4`-dimensional. This is the **boundary of Gabriel**: connected, not Dynkin, Tits
  form `titsForm (a,b) = a² + b² − 2ab = (a−b)²` positive **semi**definite (radical `(1,1)`), and
  **infinite (tame) representation type** — a `ℙ¹`-family of indecomposables of dimension vector
  `(1,1)` plus the preprojective/preinjective `(n, n+1)`, `(n+1, n)`. Acceptance: `¬ IsFiniteRepType`,
  and `gabriel_finiteRepType_iff` correctly excludes it; the `(n,n+1)` and `(n+1,n)` dimension vectors
  are the real Schur roots of `Ã₁`, the `(n,n)` the imaginary roots.
- **The loop quiver `•↺` (one vertex, one loop).** `pathAlgebra k ≅ k[X]` (`MonoidAlgebra k ℕ`),
  infinite-dimensional; representations are pairs `(V, φ : V → V)`, and the finite-dimensional
  indecomposables are the **Jordan blocks** `k[X]/(X − λ)ⁿ`, a genuinely infinite family. Acceptance:
  `pathAlgebra k (loop) ≃ₐ[k] MonoidAlgebra k ℕ`, the failure of finite-dimensionality of `kQ`, and
  `¬ IsFiniteRepType` — the smallest non-acyclic example, delimiting where the theory needs acyclicity.
- **The `D₄` quiver (three arrows into a central sink).** Central vertex `0`, three outer vertices
  `1,2,3`, arrows `i → 0`. Acceptance: it is ADE (type `D₄`), so finite type, and
  `gabriel_indecomposable_equiv_posRoot` gives exactly **12 indecomposables**, matching the **12
  positive roots of `D₄`** (six of dimension `1` at the outer/inner simples, and the roots with a `2` at
  the centre, culminating in the highest root `(1,1,1;2)`). This is the standard test that the
  positive-root count and the Coxeter-functor orbit are correct beyond type `A`.
- **The general Cartan-matrix check.** For each ADE quiver the algebra's `cartanMatrix` and the Tits
  form's Gram matrix `2I − (adjacency + adjacencyᵀ)` reproduce the ADE Cartan matrix of
  [root systems](../RootSystems/README.md); this is the running check that the `titsForm`-to-root-system
  translation is faithful.

## Ordering

Layer 0 (the path algebra) is the foundation and comes first. Layer 1 (representations as `kQ`-modules)
needs Layer 0's algebra and basis. Layer 2 (Krull-Schmidt) needs only finite-length modules and is a
parallel, upstreamable lane once `IsFiniteLength` is in hand; Layers 3-6 all consume its uniqueness.
Layer 3 (the finite-dimensional-algebra frame) needs Layer 2 for Jordan-Hölder-well-defined
multiplicities and consumes [semisimple algebras](../SemisimpleAlgebras/README.md) for Wedderburn; its
projective covers and Cartan matrix feed Layers 5-6. Layer 4 (Euler form, reflection functors) needs
Layer 1's dimension vectors and Layer 2's Krull-Schmidt, and imports the Weyl-group data from
[root systems](../RootSystems/README.md). Layer 5 (Gabriel's theorem) needs Layer 4's reflection/Coxeter
functors and Tits form and the positive-root API of [root systems](../RootSystems/README.md). Layer 6
(Auslander-Reiten theory) needs Layer 3's projective covers and duality and Layer 2's Krull-Schmidt; it
is independent of Layer 5 except that representation-finiteness makes the AR quiver finite, so the two
summits can be pursued in parallel once Layers 0-4 are in place. The worked examples are built alongside
the layer that first makes them expressible: `A₂` and the loop after Layer 1, the Kronecker boundary
after Layer 4, `D₄` after Layer 5.

## References

- P. Etingof, O. Golberg, S. Hensel, T. Liu, A. Schwendner, D. Vaintrob, E. Yudovina,
  *Introduction to Representation Theory*, AMS Student Math. Library 59 (2011), Ch. 2 (quivers and path
  algebras, representations, the reflection functors) and Ch. 6 (Gabriel's theorem and the ADE
  classification) — the cleanest route to the two summits.
- I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of Associative Algebras,
  Vol. 1: Techniques of Representation Theory*, LMS Student Texts 65, CUP (2006) — the definitive
  source: path algebras and `kQ/I` (Ch. II-III), projective covers and the Cartan matrix, Gabriel's
  presentation theorem, the Auslander-Reiten theory, the AR translate and AR quiver (Ch. IV-V).
- M. Auslander, I. Reiten, S. Smalø, *Representation Theory of Artin Algebras*, CUP (1995) — almost-split
  sequences, the AR translate `D Tr`, irreducible morphisms, and the AR quiver in full generality.
- H. Derksen, J. Weyman, *An Introduction to Quiver Representations*, AMS GSM 184 (2017) — the Euler and
  Tits forms, reflection functors, Gabriel's theorem via the Weyl group, and the connection to root
  systems.
- P. Gabriel, *Unzerlegbare Darstellungen I*, Manuscripta Math. 6 (1972) 71-103 — the original: finite
  representation type is exactly the ADE quivers, and the indecomposables correspond to the positive
  roots.
- I. N. Bernstein, I. M. Gelfand, V. A. Ponomarev, *Coxeter functors and Gabriel's theorem*, Uspekhi
  Mat. Nauk 28 (1973) — the reflection-functor proof of Gabriel's theorem via the Coxeter element.
- R. Schiffler, *Quiver Representations*, CMS Books in Mathematics, Springer (2014) — a modern
  self-contained treatment of Layers 0-6, with the worked ADE examples and the AR-quiver computations.
</content>
