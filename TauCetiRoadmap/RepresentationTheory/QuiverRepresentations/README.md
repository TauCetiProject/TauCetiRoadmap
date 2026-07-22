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
  algebra, representations, Krull-Schmidt), the Euler and Tits forms, the dimension vector, and the BGP
  reflection and Coxeter functors all live over an arbitrary field and carry no closedness hypothesis.
  **Algebraic closedness (`[IsAlgClosed k]`) enters only where it is genuinely needed**: the `kQ/I`
  presentation (Layer 3) and the non-simply-laced species theory, where division-algebra endomorphism
  rings appear over a non-closed field. The simply-laced (ADE) Gabriel statements themselves —
  finite type ⇔ positive-definite Tits form, the indecomposable ↔ positive-root bijection — are
  **field-independent** (the BGP reflection-functor proof works over any field, and every ADE
  indecomposable is a brick with `End = k`), so those targets carry no closedness hypothesis. Spell
  `[IsAlgClosed k]` in each result that needs it rather than bundling it into the ambient context.
- **Quivers are finite.** `Q` is a finite quiver: `[Quiver Q]` with `[Finite Q]` on the vertices and
  `[∀ a b, Finite (a ⟶ b)]` (finitely many arrows). Reuse Mathlib's `Quiver` class, `Quiver.Path`,
  `Quiver.Path.comp`, `Quiver.Path.length`, and `Prefunctor`; never a private quiver datum. "Connected"
  means connected as an underlying graph (`Quiver.Symmetrify` is Mathlib's symmetrization).
  **Acyclicity** is the conceptual predicate `IsAcyclic Q`, "every closed path is trivial"
  (`∀ a, ∀ p : Quiver.Path a a, p = Quiver.Path.nil`), independent of any finiteness; the reflection
  functors and the homological identities are stated against it. Separately, `Finite (Σ a b : Q,
  Quiver.Path a b)` (finitely many paths) is the extensional condition making `kQ` finite-dimensional,
  and for a finite quiver the two coincide (`finite_paths_of_isAcyclic`). Use whichever is the direct
  input: `IsAcyclic` for the structural theorems, `Finite (paths)` only where finite dimensionality of
  `kQ` is what is consumed.
- **The path algebra is `kQ`, built once, over a finite vertex set.** `pathAlgebra k Q` is the free
  `k`-module on the set of paths `Σ a b : Q, Quiver.Path a b`, with product the concatenation of
  composable paths in the **"later factor first"** order, `p * q := Quiver.Path.comp q p` when
  `target q = source p` and `0` otherwise. It is a `Ring` and a `k`-`Algebra`; the unit `1 = ∑ᵥ eᵥ` is
  the finite sum of the trivial paths (`Quiver.Path.nil`), so **unitality requires `[Finite Q]`** on the
  vertices (an infinite vertex set yields only a ring with local units, not a unital algebra) - carry
  `[Finite Q]` on the ring and algebra instances, not merely on later lemmas. Pin the paths as an
  explicit `Basis`. Reuse `Finsupp` (`→₀`) as the underlying module; only the multiplication is built.
  The chosen product order makes an arrow `a : i ⟶ j` act, by left multiplication, as a map from `eᵢ`'s
  component to `eⱼ`'s, so that **representations are left `kQ`-modules** (below).
- **Representations are functors out of the path category, and left modules over `kQ`.** A representation
  is a functor `Paths Q ⥤ ModuleCat k`: a `k`-module at each vertex and a `k`-linear map along each
  arrow, functorial in path concatenation. This is Mathlib-native (it is `Paths Q ⥤ ModuleCat k` with no
  new category), and `QuiverRep k Q` abbreviates it. For a finite vertex set the load-bearing theorem
  `quiverRepEquivalence : (Paths Q ⥤ ModuleCat k) ≌ ModuleCat (pathAlgebra k Q)` identifies
  representations with **left** `kQ`-modules: it sends a module `M` to the representation
  `v ↦ eᵥ M` (an arrow acting by left multiplication) and inverts through the idempotent decomposition
  `M = ⨁ᵥ eᵥ M` guaranteed by `∑ᵥ eᵥ = 1`. Every module-theoretic notion (sub, quotient, direct sum via
  biproducts, simple, indecomposable) is then Mathlib's, transported along it, never redefined. All
  orientation-sensitive downstream objects (`Pᵢ`, `Iᵢ`, Cartan entries, the Ext-quiver arrows) follow
  this one convention.
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

- **Quivers, paths, prefunctors:** `Combinatorics/Quiver/Basic.lean` - `Quiver` (with `Hom`, `⟶`),
  `Quiver.IsThin`, `Quiver.Symmetrify` (`.../Symmetric.lean`); `Combinatorics/Quiver/Path.lean` -
  `Quiver.Path`, `Quiver.Path.nil`, `Quiver.Path.cons`, `Quiver.Path.comp`, `Quiver.Path.length`,
  `Quiver.Path.toPath`; `Combinatorics/Quiver/Prefunctor.lean` - `Prefunctor` (`⥤q`), `Prefunctor.comp`
  (`⋙q`), `Prefunctor.id`; `Combinatorics/Quiver/ConnectedComponent.lean`,
  `Combinatorics/Quiver/Subquiver.lean`.
- **The free category on a quiver:** `CategoryTheory/PathCategory/Basic.lean` - `CategoryTheory.Paths`,
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
  (`ShortComplex.ShortExact`, `ShortExact.fIsKernel`, `ShortExact.gIsCokernel`) - the vehicle for
  almost-split sequences.
- **Morita equivalence:** `RingTheory/Morita/Basic.lean` (`MoritaEquivalence R A B`, `refl`, `symm`,
  `trans`), `RingTheory/Morita/Matrix.lean` - the statement type of Gabriel's `kQ/I` theorem.
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
up to a permutation matching isomorphism types. The **finite-dimensional-algebra infrastructure** that
Mathlib does not package: **primitive idempotents** and the decomposition of `1`, **semiperfectness** of
a finite-dimensional algebra, the correspondence between primitive idempotents and simples, the
**radical powers** `rad^n` and the convenience API for `Ring.jacobson A` (nilpotent, semisimple
quotient), **admissible ideals**, and the quotient path-algebra `kQ/I`. On top of it: **projective
covers** and **injective envelopes** (which Mathlib lacks), the **Cartan matrix of an algebra** defined
by the Jordan-Hölder multiplicities `Cᵢⱼ = [Pᵢ : Sⱼ]` (with the `Hom`-dimension and path-count
identities as separate results, the latter under the pinned convention), **basic algebras**, and
**Gabriel's presentation theorem**: over `[IsAlgClosed k]` every finite-dimensional algebra is
Morita-equivalent to `kQ/I` for its **Ext-quiver** `Q` - vertices the simples `Sᵢ`, and the number of
arrows `i → j` the dimension of `eⱼ (rad A / rad² A) eᵢ ≅ Ext¹(Sᵢ, Sⱼ)` (block idempotents and
orientation as fixed by the left-module convention) - and an admissible ideal `I`. The **Euler/Ringel
form** `⟨d, e⟩ = ∑ᵥ dᵥeᵥ − ∑_{a : i→j} d_i e_j`, the **Tits form** `q(d) = ⟨d, d⟩`, the **dimension
vector**, an explicit **`Ext¹` of representations** (built from the hereditary length-one projective
resolution, since Mathlib's derived-functor `Ext` is not assumed to cover this), and the homological
identity `⟨dim M, dim N⟩ = dim Hom(M, N) − dim Ext¹(M, N)` over an acyclic quiver. The **reflection
functors** (Bernstein-Gelfand-Ponomarev) at a sink or source, their effect `dim ↦ sᵢ · dim` (simple
reflection), and the **Coxeter functor** `C⁺` with its Coxeter-element action. **Gabriel's theorem**:
finite representation type ⇔ underlying graph is ADE, and, over `[IsAlgClosed k]`, the **bijection
between isomorphism classes of indecomposables and positive roots**, `M ↦ dim M`. And **Auslander-Reiten
theory**: the AR translate `τ = D Tr`, **almost-split (AR) sequences** and their existence,
**irreducible morphisms**, and the **AR quiver** as a `Quiver` on indecomposables. None of this is
upstream.

`Suggested.lean` pins the load-bearing objects (`pathAlgebra`, `pathAlgebraBasis`, `QuiverRep`,
`quiverRepEquivalence`, `simpleRep`, `indecProjRep`, `KrullSchmidt`-style decomposition, `cartanMatrix`,
`IsBasic`, `eulerForm`, `titsForm`, `dimVector`, `reflectionFunctor`, `coxeterFunctor`, `IsFiniteRepType`,
`gabriel_finiteRepType_iff`, `gabriel_indecomposable_equiv_posRoot`, `arTranslate`, `IsAlmostSplit`,
`arQuiver`) and the milestones below as `sorry`-targets, so each is claimable and the summit statements
are machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering below is the dependency order. Layers 0-2 are the general theory over any field; Layer 3 is
the finite-dimensional-algebra frame (its presentation theorem over an algebraically closed field);
Layer 4 adds the Euler form and reflection functors, still over an arbitrary field; Layers 5-6, Gabriel's
theorem and Auslander-Reiten theory, are stated over an algebraically closed field.

### Layer 0: quivers and the path algebra

- **The path algebra.** `pathAlgebra k Q`, the free `k`-module `(Σ a b : Q, Quiver.Path a b) →₀ k` with
  product concatenating composable paths in the "later factor first" order,
  `p * q := Quiver.Path.comp q p` when `target q = source p` and `0` otherwise; a `Ring` and a
  `k`-`Algebra`. Build its unit `1 = ∑ᵥ eᵥ` as the **finite** sum of trivial paths
  (`Quiver.Path.nil`) - requiring `[Finite Q]` on the vertices, carried on the instances - the
  **vertex idempotents** `eᵥ` (orthogonal, `eᵥ eᵥ' = 0` for `v ≠ v'`, `∑ᵥ eᵥ = 1`), and associativity
  from `Quiver.Path.comp_assoc`. The product order is fixed so that representations become left
  `kQ`-modules (Layer 1).
- **Acyclicity, as a predicate.** `IsAcyclic Q` says every closed path is trivial; it is the conceptual
  "no oriented cycle" condition, stated with no finiteness attached. For a finite quiver it is equivalent
  to `Finite (Σ a b : Q, Quiver.Path a b)` (`finite_paths_of_isAcyclic`), the extensional condition
  consumed by finite dimensionality of `kQ`.
- **The path basis.** `pathAlgebraBasis : Module.Basis (Σ a b : Q, Quiver.Path a b) k (pathAlgebra k Q)`,
  so arrows generate `kQ` as an algebra and paths are a `k`-basis. The subalgebra generated by the arrows
  is all of `kQ`.
- **Finite dimension.** For a finite quiver with finitely many paths
  (`Finite (Σ a b : Q, Quiver.Path a b)`), `FiniteDimensional k (pathAlgebra k Q)`, with
  `Module.finrank k (pathAlgebra k Q)` the number of paths. The **loop quiver** (one vertex, one arrow)
  has `kQ ≅ k[X]` (`MonoidAlgebra k ℕ`), infinite-dimensional; record this as the boundary case where
  acyclicity fails.

### Layer 1: representations of a quiver as `kQ`-modules

- **The category of representations.** `QuiverRep k Q := Paths Q ⥤ ModuleCat k` (a `k`-module at each
  vertex, a linear map along each arrow), abelian with the pointwise structure; sub, quotient, and
  finite direct sums (biproducts) are the functor-category constructions.
- **Representations are modules.** For a finite vertex set,
  `quiverRepEquivalence : (Paths Q ⥤ ModuleCat k) ≌ ModuleCat (pathAlgebra k Q)`, the `k`-linear
  equivalence identifying a representation with a **left** `kQ`-module. It sends a module `M` to
  `v ↦ eᵥ M`, with an arrow acting by left multiplication, and inverts through the idempotent
  decomposition `M = ⨁ᵥ eᵥ M` (available because `∑ᵥ eᵥ = 1`, hence the finiteness of the vertex set is
  load-bearing here). It transports simple, indecomposable, projective, injective, finite length, and
  dimension between the two sides. Every downstream statement about representations is a statement about
  `kQ`-modules read through this equivalence.
- **Vertex simples, projectives, injectives.** `simpleRep i : QuiverRep k Q`, the representation `k` at
  `i` and `0` elsewhere, is **simple**; over an acyclic quiver these are all the simples. In the pinned
  left-module convention the **indecomposable projective** `indecProjRep i` is `Pᵢ = kQ · eᵢ` (the left
  ideal, with basis the paths **starting** at `i`, so `(Pᵢ)_j` is spanned by the paths `i → j`) and the
  **indecomposable injective** `indecInjRep i` is dual, with basis the paths **ending** at `i`;
  `Pᵢ ↠ Sᵢ` and `Sᵢ ↪ Iᵢ`. These index the columns and rows of the Cartan matrix (Layer 3).

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
  isomorphism**, proved by the exchange argument on local endomorphism rings. The Lean packaging is
  concrete: existence as an internal direct sum over a `Finset` of indecomposable submodules
  (`DirectSum.IsInternal`), uniqueness as an equivalence `s ≃ t` of the two index sets under which
  corresponding summands are linearly isomorphic. Prove it at the module level with submodules and linear
  equivalences, then transport to `QuiverRep k Q` and to categorical biproducts. This is the theorem that
  makes "the multiset of indecomposable summands" and "the indecomposable representations" well-defined
  objects, used by every later layer.

### Layer 3: the structure of a finite-dimensional algebra

The frame in which quiver representations sit. Stated for a finite-dimensional `k`-algebra `A`,
specializing to `A = pathAlgebra k Q` and `A = kQ/I`. Over `[IsAlgClosed k]` for the presentation
theorem. This is a large layer; it begins with the finite-dimensional-algebra infrastructure that
Mathlib does not package.

- **Finite-dimensional-algebra infrastructure (Layer 3A).** Before covers and the Cartan matrix: a
  decomposition of `1` into **primitive orthogonal idempotents**, the correspondence between primitive
  idempotents and simple modules, **semiperfectness** of a finite-dimensional algebra, the radical powers
  `rad^n`, and the notion of an **admissible ideal** (`rad^N ⊆ I ⊆ rad²`) with the quotient
  path-algebra `kQ/I` API. Mathlib supplies the radical and the Wedderburn theory but not this
  connective tissue; it is built here and feeds everything below.
- **The radical, packaged.** For finite-dimensional `A`, `Ring.jacobson A` is a **nilpotent** two-sided
  ideal (`IsArtinianRing.isNilpotent_jacobson_bot`), `A ⧸ Ring.jacobson A` is **semisimple**
  (`IsArtinianRing.isSemisimpleRing_iff_jacobson`), and its Wedderburn decomposition indexes the simple
  modules; over `[IsAlgClosed k]` the blocks are matrix algebras over `k`. Consume
  [semisimple algebras](../SemisimpleAlgebras/README.md) for the Wedderburn side.
- **Projective covers and injective envelopes.** Build `projectiveCover M`: a projective `P` with an
  essential epimorphism `P ↠ M` (superfluous kernel), **unique up to isomorphism**, existing because
  `A` is semiperfect (finite-dimensional); dually `injectiveEnvelope M`. These are absent from Mathlib.
  The indecomposable projectives are exactly `{Pᵢ}` (Layer 1), `Pᵢ = ` projective cover of `Sᵢ`.
- **The Cartan matrix of an algebra.** `cartanMatrix A : Matrix (Simples A) (Simples A) ℕ`, defined
  primarily by the **Jordan-Hölder multiplicities** `Cᵢⱼ = [Pᵢ : Sⱼ]` of `Sⱼ` in the projective cover
  `Pᵢ`, well-defined by Jordan-Hölder (`CompositionSeries.jordan_holder`). Its identification with a
  `Hom`-dimension is a **separate theorem** under `[IsAlgClosed k]` and a basic hypothesis, where
  `Cᵢⱼ = dim_k Hom(Pⱼ, Pᵢ)` (over a general field the division-ring dimensions intervene and the two are
  not interchangeable). For a path algebra `Cᵢⱼ` equals the count of paths `i → j` modulo the relations,
  proved once the pinned left-module convention is in place.
- **Basic algebras and Morita reduction.** `IsBasic A`: `A ⧸ Ring.jacobson A` is a product of division
  rings (no repeated matrix blocks), equivalently `A ≅ End of a minimal faithful projective`. Every
  finite-dimensional `A` is **Morita-equivalent to a basic algebra** `A^b` (the endomorphism algebra of
  `⊕ Pᵢ`, one per simple), via `MoritaEquivalence`.
- **Gabriel's presentation theorem.** Over `[IsAlgClosed k]`, a basic finite-dimensional algebra `A` is
  `kQ_A / I` for its **Ext-quiver** `Q_A` and an **admissible ideal** `I` (`rad^N ⊆ I ⊆ rad²`); hence
  **every** finite-dimensional algebra is Morita-equivalent to some `kQ/I`. The Ext-quiver has the simples
  as vertices, and the number of arrows `i → j` is the dimension of the `i,j` radical-layer block
  `eⱼ (rad A / rad² A) eᵢ ≅ Ext¹(Sᵢ, Sⱼ)`, with the primitive idempotents `eᵢ` and the orientation fixed
  by the left-module convention (the transpose choice reverses the arrows). State as
  `exists_quiver_admissibleIdeal_morita`.

### Layer 4: the Euler form, dimension vectors, and reflection functors

Over an **arbitrary field** `k` (no closedness hypothesis), `Q` a finite quiver, `Q` **acyclic** where
the homological identity needs it. Nothing in this layer uses `[IsAlgClosed k]`; the dimension vector,
the Euler and Tits forms, the `Ext¹` construction, and the reflection and Coxeter functors are all
field-agnostic. Algebraic closedness is deferred to the Layer 5 classification.

- **Dimension vectors.** `dimVector M v = Module.finrank k (M.obj v) : Q → ℕ`, additive on direct sums
  and short exact sequences. On the `kQ`-module side it records the `k`-dimension of `eᵥ · M`.
- **The Euler and Tits forms.** `eulerForm d e = ∑ᵥ dᵥ eᵥ − ∑_{a : i → j} d_i e_j` on `Q → ℤ` (a
  bilinear form, the arrows summed over `Σ i j, (i ⟶ j)`), and the **Tits form**
  `titsForm d = eulerForm d d`, a quadratic form. Its symmetrization is the form whose Gram matrix is
  `2·I − (adjacency + adjacencyᵀ)`, i.e. the Cartan matrix of the underlying graph; this is the exact
  link to [root systems](../RootSystems/README.md).
- **`Ext¹` of representations.** Over an **acyclic** `Q` the path algebra is hereditary (global dimension
  `≤ 1`), so every representation has a length-one projective resolution `0 → P₁ → P₀ → M → 0`. Define
  `Ext¹(M, N)` as the cokernel of `Hom(P₀, N) → Hom(P₁, N)` from this resolution, independently of any
  general derived-functor `Ext` machinery. Higher `Ext` vanish.
- **The homological interpretation.** For finite-dimensional representations `M, N` over an **acyclic**
  `Q`, `eulerForm (dimVector M) (dimVector N) = dim_k Hom(M, N) − dim_k Ext¹(M, N)`; in particular
  `titsForm (dim M) = dim End(M) − dim Ext¹(M, M)`. Read carefully: for an indecomposable `M` over
  `[IsAlgClosed k]` this gives `dim End(M) ≥ 1`, and `titsForm (dim M) = 1` forces
  `dim Ext¹(M, M) = dim End(M) − 1`, which is `0` **iff** `dim End(M) = 1`, i.e. iff `M` is a **brick**.
  Indecomposability alone does **not** give a brick. The correct implication is the converse: if `M` is a
  brick with `titsForm (dim M) = 1`, then `Ext¹(M, M) = 0` (`M` is rigid/exceptional). That every
  indecomposable over an ADE quiver is a brick is proved separately in Layer 5, via the reflection
  functors, and only then does `titsForm (dim M) = 1` read off rigidity.
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
  representation type **iff** its underlying graph is a simply-laced (ADE) Dynkin diagram - equivalently
  its **Tits form is positive definite** (`titsForm` is `RootPairing`-realizable of type
  `A/D/E`). State the graph condition through the Cartan matrix and
  [root systems](../RootSystems/README.md)' Dynkin data (`CoxeterMatrix.A/D/E₆/E₇/E₈`), the
  positive-definite condition through `titsForm`. The `A₂` quiver `• → •` is finite type; the
  **Kronecker quiver** `• ⇉ •` (type `Ã₁`, Tits form positive *semi*definite) is the boundary and has
  infinite (tame) type.
- **The reflection induction (the combinatorial core).** The bijection rests on a chain of milestones
  that the Weyl-orbit slogan hides; state each:
  1. **Admissible orderings.** Every orientation of an ADE graph admits a sequence of vertices that is
     sink-admissible (each vertex a sink after reflecting its predecessors), so the `reflectionFunctor⁺`
     can be composed into the Coxeter functor.
  2. **Reflection preserves indecomposability.** For an indecomposable `M ≇ Sᵢ`, the functor
     `reflectionFunctor⁺ i` sends `M` to an indecomposable of the reflected quiver, killing exactly the
     summand `Sᵢ`; on dimension vectors it realizes `sᵢ` (Layer 4).
  3. **Descent by height.** Every positive root reduces to a simple root under an admissible sequence of
     simple reflections, decreasing `Base.height`; correspondingly every indecomposable is carried to
     some `Sⱼ` by reflection functors, and `Sⱼ ↦ αⱼ`.
  4. **Uniqueness.** The reflection induction transports the dimension vector faithfully, so
     `dimVector` is injective on indecomposables (each is a **brick**).
- **Indecomposables are positive roots.** For `Q` of ADE type,
  `gabriel_indecomposable_equiv_posRoot`: `M ↦ dimVector M` is a **bijection** from isomorphism classes
  of finite-dimensional indecomposable representations to the **positive roots** of the associated root
  system, so each indecomposable is a **brick** (`End = k`, `Ext¹ = 0`) and is determined up to
  isomorphism by its dimension vector. Consume `posRoots` from
  [root systems](../RootSystems/README.md). The construction is the height-descending reflection
  induction above, starting from `Sᵢ ↦ αᵢ`.
- **The count.** `Nat.card (indecomposables) = (posRoots).ncard`; for `Aₙ` this is `n(n+1)/2`, for
  `D₄` it is `12`.

### Layer 6: Auslander-Reiten theory

The organizing theory of the indecomposables and their maps. `A = kQ/I` finite-dimensional,
`[IsAlgClosed k]`. This is by far the largest layer - a formalization project in its own right, not a
short capstone - and it splits into sublayers, each a target on its own: (6A) the radical of the module
category and irreducible morphisms; (6B) minimal projective/injective presentations; (6C) the transpose
`Tr` and stable equivalence; (6D) the AR translate `τ = D Tr` and AR duality; (6E) existence and
uniqueness of almost-split sequences; (6F) the AR quiver. The `τ = D Tr` composite is **not** a bare
definition: it is well-defined only up to projectives, through minimal presentations and duality on
finite-dimensional modules, so 6B-6D are prerequisites. The single acceptance target of this roadmap is
the **AR quiver of a representation-finite algebra** (finite, computable); the general almost-split
existence theorem is stated but flagged as the deep sublayer.

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
  `(1,0)`, `(0,1)`, `(1,1)` - the **three positive roots of `A₂`**, `α₁`, `α₂`, `α₁+α₂`. Acceptance:
  `gabriel_indecomposable_equiv_posRoot` restricts to this bijection; the reflection functor at the sink
  `2` is a functor from representations of `1 → 2` to representations of the **reflected quiver** `1 ← 2`,
  killing the sink simple `S₂` and, under the vertex-identification of the two quivers, carrying `P₁ ↦ P₁`
  and `S₁ ↦ S₂` - realizing `s₁` on `{(1,0),(0,1),(1,1)}` through the dimension-vector map. The AR quiver
  is the three-vertex mesh `S₂ → P₁ → S₁` with `τ S₁ = S₂`.
- **The Kronecker quiver `• ⇉ •` (type `Ã₁`).** Two vertices, two parallel arrows;
  `pathAlgebra k` is `4`-dimensional. This is the **boundary of Gabriel**: connected, not Dynkin, Tits
  form `titsForm (a,b) = a² + b² − 2ab = (a−b)²` positive **semi**definite (radical `(1,1)`), and
  **infinite (tame) representation type** - a `ℙ¹`-family of indecomposables of dimension vector
  `(1,1)` plus the preprojective/preinjective `(n, n+1)`, `(n+1, n)`. Acceptance: `¬ IsFiniteRepType`,
  and `gabriel_finiteRepType_iff` correctly excludes it; the `(n,n+1)` and `(n+1,n)` dimension vectors
  are the real Schur roots of `Ã₁`, the `(n,n)` the imaginary roots.
- **The loop quiver `•↺` (one vertex, one loop).** `pathAlgebra k ≅ k[X]` (`MonoidAlgebra k ℕ`),
  infinite-dimensional; representations are pairs `(V, φ : V → V)`, and the finite-dimensional
  indecomposables are the **Jordan blocks** `k[X]/(X − λ)ⁿ`, a genuinely infinite family. Acceptance:
  `pathAlgebra k (loop) ≃ₐ[k] MonoidAlgebra k ℕ`, the failure of finite-dimensionality of `kQ`, and
  `¬ IsFiniteRepType` - the smallest non-acyclic example, delimiting where the theory needs acyclicity.
- **The `D₄` quiver (three arrows into a central sink).** Central vertex `0`, three outer vertices
  `1,2,3`, arrows `i → 0`. Acceptance: it is ADE (type `D₄`), so finite type, and
  `gabriel_indecomposable_equiv_posRoot` gives exactly **12 indecomposables**, matching the **12
  positive roots of `D₄`**: the four simple roots (dimension vector a single `1`), and the further roots
  supported on the centre - those with a `1` at the centre and at some subset of the outer vertices, and
  the highest root `(1,1,1;2)` with coefficient `2` at the centre. This is the standard test that the
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
Layer 1's dimension vectors and Layer 2's Krull-Schmidt, imports the Weyl-group data from
[root systems](../RootSystems/README.md), and lives over an arbitrary field. Layer 5 (Gabriel's theorem)
adds `[IsAlgClosed k]` and needs Layer 4's reflection/Coxeter functors and Tits form and the positive-root
API of [root systems](../RootSystems/README.md). Layer 6 (Auslander-Reiten theory) needs Layer 3's
projective covers and duality and Layer 2's Krull-Schmidt; it is independent of Layer 5 except that
representation-finiteness makes the AR quiver finite, so the two summits can be pursued in parallel once
Layers 0-4 are in place. The worked examples are built alongside the layer that first makes them
expressible: `A₂` and the loop after Layer 1, the Kronecker boundary after Layer 4, `D₄` after Layer 5.

Layers 5 and 6 are each a substantial formalization project, and Layer 6 several. The **near-term
deliverables** - the stable foundation everything else stands on - are Layers 0-4 together with the `A₂`,
Kronecker, and loop examples: the path algebra and its finite-dimensional acyclic case, the representation
category and the module equivalence, vertex simples and projectives, Krull-Schmidt, the Cartan matrix,
and the Euler/Tits form and reflection functors. Gabriel's ADE bijection and the Auslander-Reiten theory
are the summits, pursued once those conventions are settled.

## References

- P. Etingof, O. Golberg, S. Hensel, T. Liu, A. Schwendner, D. Vaintrob, E. Yudovina,
  *Introduction to Representation Theory*, AMS Student Math. Library 59 (2011), Ch. 2 (quivers and path
  algebras, representations, the reflection functors) and Ch. 6 (Gabriel's theorem and the ADE
  classification) - the cleanest route to the two summits.
- I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of Associative Algebras,
  Vol. 1: Techniques of Representation Theory*, LMS Student Texts 65, CUP (2006) - the definitive
  source: path algebras and `kQ/I` (Ch. II-III), projective covers and the Cartan matrix, Gabriel's
  presentation theorem, the Auslander-Reiten theory, the AR translate and AR quiver (Ch. IV-V).
- M. Auslander, I. Reiten, S. Smalø, *Representation Theory of Artin Algebras*, CUP (1995) - almost-split
  sequences, the AR translate `D Tr`, irreducible morphisms, and the AR quiver in full generality.
- H. Derksen, J. Weyman, *An Introduction to Quiver Representations*, AMS GSM 184 (2017) - the Euler and
  Tits forms, reflection functors, Gabriel's theorem via the Weyl group, and the connection to root
  systems.
- P. Gabriel, *Unzerlegbare Darstellungen I*, Manuscripta Math. 6 (1972) 71-103 - the original: finite
  representation type is exactly the ADE quivers, and the indecomposables correspond to the positive
  roots.
- I. N. Bernstein, I. M. Gelfand, V. A. Ponomarev, *Coxeter functors and Gabriel's theorem*, Uspekhi
  Mat. Nauk 28 (1973) - the reflection-functor proof of Gabriel's theorem via the Coxeter element.
- R. Schiffler, *Quiver Representations*, CMS Books in Mathematics, Springer (2014) - a modern
  self-contained treatment of Layers 0-6, with the worked ADE examples and the AR-quiver computations.
</content>
