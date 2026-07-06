# Roadmap: representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas

Mathlib has climbed most of the way to the structure theory of semisimple Lie algebras but stops
just short of their **representation theory**. It has `sl₂` triples and the primitive-vector argument
(`Mathlib/Algebra/Lie/Sl2.lean`: `IsSl2Triple`, `IsSl2Triple.HasPrimitiveVectorWith`, and the
integrality lemma `HasPrimitiveVectorWith.exists_nat`), Cartan subalgebras and their existence
(`Mathlib/Algebra/Lie/CartanSubalgebra.lean`, `CartanExists.lean`), the generalized weight-space
machinery (`Mathlib/Algebra/Lie/Weights/*`: `LieModule.genWeightSpace`, `LieModule.Weight`,
`LieAlgebra.rootSpace`, `iSup_genWeightSpace_eq_top`), the semisimplicity theory
(`Mathlib/Algebra/Lie/Semisimple/*`, `Killing.lean`), and, as the capstone of that work, the **root
system of a Killing-semisimple Lie algebra as an honest `RootPairing`**
(`LieAlgebra.IsKilling.rootSystem`), with one-dimensional root spaces
(`finrank_rootSpace_eq_one`), coroots (`LieAlgebra.IsKilling.coroot`), and `sl₂` triples attached to
roots (`exists_isSl2Triple_of_weight_isNonZero`). The abstract root-system side
(`Mathlib/LinearAlgebra/RootSystem/*`) supplies bases, positive systems, Cartan matrices, and Weyl
groups.

What Mathlib does **not** have is the theory those pieces exist to support: the classification of the
finite-dimensional irreducible representations of `sl₂` by their highest weight; the weight-space
decomposition of a module over a semisimple Lie algebra and the integrality of its weights; the
universal enveloping algebra's PBW basis; **Verma modules** and their unique irreducible quotient
`L(λ)`; the classification of finite-dimensional irreducibles by **dominant integral highest
weights**; **Weyl's complete reducibility theorem** and the Casimir element that proves it; and the
**Weyl character formula**, the **Weyl dimension formula**, and **Kostant's multiplicity formula**.
None of this is upstream: a search for `Verma`, `HighestWeight`, `WeylCharacter`, `Casimir` in
Mathlib returns nothing in Lie theory.

This roadmap builds that representation theory, and it is organized around a single methodological
commitment that the subject itself forces: **`sl₂` is the engine, and it is a foundational node
precisely because the general theorems reduce to it**. This is not an easy-case-first pedagogy. The
integrality of a weight `χ` against a coroot `α^∨` is proved by restricting the module to the `sl₂`
triple `⟨eₐ, hₐ, fₐ⟩` attached to the root `α` and reading off `HasPrimitiveVectorWith.exists_nat`.
The finite-dimensionality criterion for `L(λ)` is the statement that `L(λ)` is `sl₂`-finite along
every simple direction. Weyl's complete reducibility, in the highest-weight-module route, turns on
the `sl₂`-representation-theoretic behaviour of the Casimir. So `sl₂` is built first and in full,
**as the thing the later proofs literally call**, and the "genuinely unlocks" test is what decides
that it is a node rather than an example.

Suggested home: `TauCeti/Algebra/Lie/HighestWeight/` (the representation theory) and
`TauCeti/Algebra/Lie/Sl2/` (the engine, extending Mathlib's `Sl2.lean`), mirroring Mathlib's
`Algebra/Lie/`.

This roadmap **shares vocabulary with, and depends on,** the root-systems roadmap
([../RootSystems/README.md](../RootSystems/README.md)), which is the home of abstract root systems,
bases and positive systems, Weyl groups, and the root/weight lattices; we consume its objects and
Mathlib's `RootPairing`/`RootSystem` API rather than reintroducing them. It **feeds** the classical
groups roadmap ([../ClassicalGroups/README.md](../ClassicalGroups/README.md)), whose representations
of `SLₙ`, `SOₙ`, `Sp₂ₙ` are governed by exactly the highest-weight classification built here, and it
shares its `FDRep`-flavoured vocabulary with the finite-group
[character theory roadmap](../CharacterTheory/README.md).

## Standing conventions

- **The base field.** Work over a field `K` that is **algebraically closed and of characteristic
  zero** for the representation theory proper (so every finite-dimensional module is triangularizable
  and weights take values in `K`), matching Mathlib's `[Field K] [CharZero K] [IsAlgClosed K]`. State
  each result at the generality it actually needs, in the Zulip house style: the `sl₂` weight-string
  arguments need only `CharGap`/`CharZero` and finite-dimensionality; the root-space decomposition
  needs `IsTriangularizable`; the classification needs algebraic closure. **Do not** bundle
  "algebraically closed, characteristic zero, semisimple, split" into one mega-class; spell the
  hypotheses each theorem uses.
- **The Lie algebra, and what "semisimple" means here.** `L` is a finite-dimensional Lie algebra over
  `K` (`[LieRing L] [LieAlgebra K L] [Module.Finite K L]`). The default semisimplicity hypothesis is
  **`LieAlgebra.IsKilling K L`** (non-degenerate Killing form), which over a characteristic-zero field
  is equivalent to `LieAlgebra.IsSemisimple K L` and, crucially, is the hypothesis under which Mathlib
  already produces `LieAlgebra.IsKilling.rootSystem`. Over an algebraically closed `K` every Cartan
  subalgebra is **split** (all weights land in `K`), so we do not carry a separate "split" hypothesis;
  where the general theory over a non-closed field needs a split semisimple Lie algebra, that is a
  named generalization stated as such, not the default. The abelian, nilpotent, and solvable notions
  are Mathlib's (`LieAlgebra.IsNilpotent`, `LieAlgebra.IsSolvable`, `HasTrivialRadical`).
- **Cartan subalgebras, roots, and weights are Mathlib's.** Fix a Cartan subalgebra `H` via
  `[H.IsCartanSubalgebra]` (`LieSubalgebra.IsCartanSubalgebra`); it exists by
  `LieAlgebra.exists_isCartanSubalgebra`. A **root** is a nonzero `LieModule.Weight K H L` (element of
  the `Finset` `LieSubalgebra.root H`); a **weight of a module** `M` is a `LieModule.Weight K H M`; the
  **root space** and **weight space** are `LieAlgebra.rootSpace H α = LieModule.genWeightSpace L α` and
  `LieModule.genWeightSpace M χ`. The **root system** is `LieAlgebra.IsKilling.rootSystem H`, a
  `RootPairing H.root K (Module.Dual K H) H`; its **coroots** are `LieAlgebra.IsKilling.coroot`, and
  `finrank_rootSpace_eq_one` says root spaces are lines. Never introduce a private `Root`, `Weight`, or
  `Coroot` synonym.
- **Positive systems and dominance, via a base.** Fix a base
  `b : (LieAlgebra.IsKilling.rootSystem H).Base` (`RootPairing.Base`, which exists by
  `RootPairing.nonempty_base`); its `IsPos` predicate and `b.support` of **simple roots** are the
  positive system and simple system. A weight `λ : Module.Dual K H` is **integral** when `λ (α^∨) ∈ ℤ`
  for every root `α`, and **dominant integral** when `λ (αᵢ^∨) ∈ ℕ` for every simple root `αᵢ`. The
  **weight lattice** and **root lattice** are those of `../RootSystems/README.md`; we reuse them and do
  not rebuild them. The half-sum of positive roots is **`ρ`**.
- **Modules are `LieModule`s; the categorical `FDRep` is a mirror.** Develop the theory on the
  Mathlib-native module core: `M` with `[LieRingModule L M] [LieModule K L M]`, irreducibility as
  `LieModule.IsIrreducible K L M` (`= IsSimpleOrder (LieSubmodule K L M)`), and the enveloping algebra
  `UniversalEnvelopingAlgebra K L` with its universal property `UniversalEnvelopingAlgebra.lift`.
  Finite-dimensional representations of `L` are the same data as finite-dimensional
  `UniversalEnvelopingAlgebra K L`-modules; keep that dictionary explicit where the associative-algebra
  presentation (PBW, Verma modules as cyclic `U(L)`-modules) is the natural home. Use Mathlib's
  vocabulary throughout: `LieSubmodule`, `LieModuleHom`, `LieModuleEquiv` (`M ≃ₗ⁅K,L⁆ N`),
  `Module.finrank`, `Module.Dual`.
- **Highest weight is defined against the base, not against a total order.** A **highest weight
  vector** of weight `λ` in `M` is a nonzero `v` with `⁅x, v⁆ = λ x • v` for `x ∈ H` and `⁅e, v⁆ = 0`
  for every `e` in a positive root space. `L(λ)` is the unique irreducible module generated by such a
  vector. The `sl₂` case is this definition with the single positive root, and
  `IsSl2Triple.HasPrimitiveVectorWith` is exactly a highest weight vector for that `sl₂`; keep the
  general definition and the `sl₂` structure literally the same notion so the reductions typecheck.
- **Characters live in the group algebra of the weight lattice.** The **formal character** of a
  finite-dimensional module is the multiplicity function `μ ↦ dim Mμ`, an element of the integral group
  algebra of the weight lattice (a `Module.Dual K H →₀ ℤ` supported on integral weights). The Weyl
  group `(rootSystem H).weylGroup` acts on it. The Weyl character formula is an identity in this group
  algebra; the dimension formula is its specialization at the trivial character, taken in `ℚ`, and
  Kostant's formula is its expansion against the Kostant partition function. Keep the three as one
  development, not three.

## What Mathlib already has (consume)

- **`sl₂` triples and the primitive-vector argument:** `Mathlib/Algebra/Lie/Sl2.lean`,
  `IsSl2Triple h e f` (with `lie_e_f`, `lie_h_e_nsmul`, `lie_h_f_nsmul`), `IsSl2Triple.toLieSubalgebra`,
  `IsSl2Triple.HasPrimitiveVectorWith t m μ` (fields `ne_zero`, `lie_h`, `lie_e`), the ladder lemmas
  `lie_f_pow_toEnd_f`, `lie_h_pow_toEnd_f`, `lie_e_pow_succ_toEnd_f`, and the integrality theorem
  `IsSl2Triple.HasPrimitiveVectorWith.exists_nat` (the highest weight of a primitive vector in a
  finite-dimensional module is a natural number), plus `exists_hasPrimitiveVectorWith`.
- **The `sl₂` Lie algebra concretely:** `Mathlib/Algebra/Lie/Classical.lean`,
  `LieAlgebra.SpecialLinear.sl n R` (trace-zero matrices), `SpecialLinear.single`,
  `SpecialLinear.singleSubSingle`, and `sl_non_abelian`; `sl (Fin 2) K` is our worked `sl₂`.
- **Cartan subalgebras:** `Mathlib/Algebra/Lie/CartanSubalgebra.lean`
  (`LieSubalgebra.IsCartanSubalgebra`, self-normalizing and nilpotent) and
  `Mathlib/Algebra/Lie/CartanExists.lean` (`LieAlgebra.exists_isCartanSubalgebra`,
  `exists_isCartanSubalgebra_engel`).
- **Weights and the weight-space decomposition:** `Mathlib/Algebra/Lie/Weights/Basic.lean`,
  `LieModule.genWeightSpace M χ`, `genWeightSpaceOf`, `LieModule.Weight R L M` (a bundled nonzero
  weight, `FunLike` to `L → R`), `LieModule.IsTriangularizable`, `iSupIndep_genWeightSpace`,
  `iSup_genWeightSpace_eq_top` (the decomposition when triangularizable); `Weights/Linear.lean`
  (`LinearWeights`, `Weight.toLinear`, so a weight is a genuine linear functional in characteristic
  zero); `Weights/Cartan.lean` (`LieAlgebra.rootSpace`, `rootSpaceWeightSpaceProduct` so root spaces
  move weight spaces by `⁅rootSpace H α, Mχ⁆ ⊆ M(α+χ)`); `Weights/Chain.lean`
  (`genWeightSpaceChain`, the root-string bounds).
- **The root system of a semisimple Lie algebra:** `Mathlib/Algebra/Lie/Weights/Killing.lean` and
  `Weights/RootSystem.lean`, `LieAlgebra.IsKilling` (non-degenerate Killing form),
  `IsKilling.instSemisimple`, `finrank_rootSpace_eq_one` (root spaces are one-dimensional),
  `IsKilling.coroot`, `cartanEquivDual`, `exists_isSl2Triple_of_weight_isNonZero` (the `sl₂` triple of
  a root), `sl2SubmoduleOfRoot`, and `LieAlgebra.IsKilling.rootSystem H : RootPairing H.root K
  (Module.Dual K H) H` with its instances `IsRootSystem`, `IsCrystallographic`, `IsReduced`, and
  `rootSystem_pairing_apply`, `rootSystem_coroot_apply`.
- **Abstract root systems, bases, Weyl groups:** `Mathlib/LinearAlgebra/RootSystem/*`,
  `RootPairing`, `RootSystem`, `RootPairing.Base` with `RootPairing.nonempty_base` and `Base.IsPos`,
  `Base.height`, `RootPairing.Base.cartanMatrix`, and `RootPairing.weylGroup`,
  `RootPairing.Equiv.reflection`. These, and the root/weight lattices, are the province of
  [../RootSystems/README.md](../RootSystems/README.md).
- **The universal enveloping algebra:** `Mathlib/Algebra/Lie/UniversalEnveloping.lean`,
  `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι` (the Lie map `L →ₗ⁅K⁆ U(L)`),
  `UniversalEnvelopingAlgebra.lift` (the universal property, an equiv `(L →ₗ⁅K⁆ A) ≃ (U(L) →ₐ[K] A)`),
  `ι_comp_lift`, `lift_unique`, `hom_ext`.
- **Semisimplicity and irreducibility infrastructure:** `Mathlib/Algebra/Lie/Semisimple/Defs.lean`
  (`LieModule.IsIrreducible R L M := IsSimpleOrder (LieSubmodule R L M)`, `HasTrivialRadical`,
  `LieAlgebra.IsSemisimple`, `LieAlgebra.IsSimple`), `Semisimple/Basic.lean` (a semisimple Lie algebra
  is irreducible as a module over itself), `Weights/IsSimple.lean` (the ideal/root-set dictionary).
- **Trace and invariant forms:** `Mathlib/Algebra/Lie/TraceForm.lean`, `InvariantForm.lean`,
  `Killing.lean` (`killingForm`, `traceForm`, `traceForm_cartan_nondegenerate`), the raw material for
  the Casimir element.

## What is missing (build here)

The **classification of finite-dimensional `sl₂`-irreducibles** `V(n)` by highest weight and the
`sl₂` complete-reducibility and Clebsch-Gordan facts; the **weight-space decomposition of a module**
over a semisimple `L` (triangularizability of finite-dimensional modules, so `iSup_genWeightSpace_eq_top`
applies) and the **integrality of weights** against coroots (the `sl₂`-string reduction); the **PBW
theorem** for `U(L)` and the triangular decomposition `U(L) ≅ U(n⁻) ⊗ U(H) ⊗ U(n⁺)`; **Verma modules**
`M(λ)`, their universal property, their unique maximal submodule and unique irreducible quotient
**`L(λ)`**, and the highest-weight-module theory; the **classification of finite-dimensional
irreducibles** by dominant integral highest weights (both directions: every finite-dimensional
irreducible is an `L(λ)` with `λ` dominant integral, and `L(λ)` is finite-dimensional exactly when `λ`
is dominant integral); the **Casimir element** and **Weyl's complete reducibility theorem**; and the
**Weyl character formula**, the **Weyl dimension formula**, and **Kostant's multiplicity formula**,
together with the formal-character group algebra they are stated in. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`Sl2Irrep`/the `V(n)` classification,
`IsHighestWeightVector`, `vermaModule`, `irreducibleQuotient` `L(λ)`, `IsDominantIntegral`,
`casimirElement`, `formalCharacter`, `weylCharacter`, the Weyl dimension and Kostant statements) and
the named milestones below as `sorry`-targets, so each is claimable and the summit statements are
machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The engine (`sl₂`) is Layer 0 and is built in full first, because Layers 2, 4, and 5 call it. Layer 1
assembles the Cartan/root-space picture from Mathlib. The general highest-weight theory is Layers 2-4,
complete reducibility Layer 5, and the character and dimension formulas Layer 6.

### Layer 0: `sl₂` representation theory (the engine)

Built first and completely, because it is what the later reductions invoke, not because it is easy.

- **The weight string.** For an `sl₂` triple `t : IsSl2Triple h e f` in `L` and a finite-dimensional
  module `M`, the action of `h` is diagonalizable with **integer** eigenvalues, and `e`, `f` are the
  raising and lowering (ladder) operators moving between consecutive `h`-eigenspaces. State the
  eigenvalue-integrality (`∃ n : ℤ, μ = n` for every `h`-eigenvalue `μ`), consuming and extending
  `HasPrimitiveVectorWith.exists_nat` and the ladder lemmas `lie_h_pow_toEnd_f`,
  `lie_e_pow_succ_toEnd_f` already in `Sl2.lean`.
- **The standard irreducible `V(n)`.** For each `n : ℕ`, the `(n+1)`-dimensional irreducible with a
  highest weight vector of weight `n`, with `h` acting with eigenvalues `n, n-2, …, -n` each with
  multiplicity one, and `e`, `f` the explicit ladder. Construct it (as a `U(sl₂)`-module on `Kⁿ⁺¹`,
  or as `Sym^n` of the standard `2`-dimensional module) and prove it irreducible.
- **The classification.** Every finite-dimensional irreducible `sl₂`-module is isomorphic to exactly
  one `V(n)`: it has a highest weight vector (a primitive vector, by finite-dimensionality and
  `exists_hasPrimitiveVectorWith`), its highest weight is a natural number `n`, and highest weight
  determines it up to `LieModuleEquiv`. So `{finite-dim irreducibles}/≅ ≃ ℕ` by highest weight, with
  dimension `n+1`.
- **Complete reducibility for `sl₂`.** Every finite-dimensional `sl₂`-module is a direct sum of
  `V(nᵢ)`; equivalently every `LieSubmodule` has a complement. Prove it by the weight-string /
  primitive-vector argument (the elementary route, independent of the general Casimir argument of
  Layer 5), so it is available to Layer 2's reductions without circularity.
- **Clebsch-Gordan.** `V(m) ⊗ V(n) ≅ ⨁_{k} V(m+n-2k)` for `0 ≤ k ≤ min m n`. The decomposition of
  tensor products, a check on the character theory of Layer 6 in the rank-one case.

### Layer 1: Cartan subalgebras and the root-space decomposition

Mostly an assembly of Mathlib, made into the working vocabulary for the module theory.

- **The Cartan subalgebra and the root-space decomposition.** Fix `[H.IsCartanSubalgebra]`; over
  algebraically closed `K` of characteristic zero, `L` is triangularizable over `H`, so
  `iSup_genWeightSpace_eq_top` gives `L = H ⊕ ⨁_{α ∈ roots} Lα` with `finrank_rootSpace_eq_one` making
  each `Lα` a line. Package this as the root-space decomposition of `L`, with the bracket relation
  `⁅Lα, Lβ⁆ ⊆ L(α+β)` (`rootSpaceWeightSpaceProduct`).
- **The root system and a choice of positive system.** Consume `LieAlgebra.IsKilling.rootSystem H` and
  fix a base `b : (rootSystem H).Base` (existence: `RootPairing.nonempty_base`); its simple roots
  `b.support`, positive roots (`Base.IsPos`), Weyl group `(rootSystem H).weylGroup`, and Cartan matrix
  `Base.cartanMatrix` are the combinatorial input. The **root/weight lattices** and the **Weyl group's
  action** are the province of [../RootSystems/README.md](../RootSystems/README.md); this layer only
  fixes the notation `ρ` for the half-sum of positive roots and states dominance and integrality of
  weights in `Module.Dual K H` against coroots.
- **The `sl₂` attached to a root.** For a root `α`, `exists_isSl2Triple_of_weight_isNonZero` gives the
  triple `⟨eₐ, hₐ, fₐ⟩` with `hₐ` a coroot; record `hₐ = α^∨` under `IsKilling.coroot` and that
  `sl2SubmoduleOfRoot` is a copy of `sl₂`. This is the object Layer 2 restricts modules to.

### Layer 2: weights of a module and their integrality

The first place the engine is called.

- **The weight-space decomposition of a module.** For a finite-dimensional `L`-module `M`, `M` is
  triangularizable over `H` (build the `IsTriangularizable K H M` instance from algebraic closure and
  finite-dimensionality), so `iSup_genWeightSpace_eq_top` gives `M = ⨁_χ Mχ` over the finite set of
  weights `LieModule.Weight K H M`, with `⁅Lα, Mχ⁆ ⊆ M(α+χ)`.
- **Integrality of weights (the `sl₂` reduction).** For every weight `χ` of `M` and every root `α`,
  the value `χ(α^∨) ∈ ℤ`. **Proof: restrict `M` to the `sl₂` triple of `α` (Layer 1), where `χ(α^∨)`
  is an `hₐ`-eigenvalue, and apply Layer 0's integer eigenvalue theorem** (ultimately
  `HasPrimitiveVectorWith.exists_nat`). This is the load-bearing use of the engine and the reason `sl₂`
  is a node: there is no route to integrality that does not pass through the rank-one subalgebra.
- **The weight lattice acts.** Weights of finite-dimensional modules are integral, so they lie in the
  weight lattice `X` of `../RootSystems/README.md`, and the set of weights of `M` is stable under the
  Weyl group with multiplicities constant on Weyl orbits (again by `sl₂`-string symmetry along each
  root). State Weyl-invariance of `μ ↦ dim Mμ`.

### Layer 3: enveloping algebra, Verma modules, and `L(λ)`

- **PBW and the triangular decomposition.** The Poincaré-Birkhoff-Witt theorem: the associated graded
  of `U(L)` is the symmetric algebra `Sym(L)`, giving a monomial basis; and, using the root-space
  decomposition, the triangular decomposition `U(L) ≅ U(n⁻) ⊗ U(H) ⊗ U(n⁺)` where `n⁺ = ⨁_{α>0} Lα`.
  Consume `UniversalEnvelopingAlgebra.lift` for the universal property; the PBW basis is the missing
  piece and a substantial target in its own right.
- **Highest weight vectors and modules.** `IsHighestWeightVector b λ v`: `v ≠ 0`, `H` acts by `λ`, and
  every positive root space kills `v`. A **highest weight module** of weight `λ` is one generated by
  such a `v`; its weights all lie in `λ - (ℕ-span of simple roots)`, and its `λ`-weight space is the
  line `K·v`.
- **Verma modules.** `vermaModule b λ := U(L) ⊗_{U(b)} K_λ`, the universal highest weight module of
  weight `λ` (`b = H ⊕ n⁺` the Borel). Give its universal property (`Hom(M(λ), N) ≃ {highest weight
  vectors of weight λ in N}`), its weight-space decomposition with multiplicities the Kostant partition
  function of Layer 6, that its `λ`-weight space is a line, and that it is a free `U(n⁻)`-module of rank
  one.
- **The irreducible quotient `L(λ)`.** `M(λ)` has a **unique maximal submodule** (the sum of all
  submodules meeting the `λ`-weight space trivially), hence a unique irreducible quotient
  `L(λ) := irreducibleQuotient b λ`. `L(λ)` is the unique irreducible highest weight module of weight
  `λ`, and `L(λ) ≅ L(μ)` iff `λ = μ`. This is the classification of **all** irreducible highest weight
  modules, finite-dimensional or not.

### Layer 4: the classification of finite-dimensional irreducibles

- **Every finite-dimensional irreducible is an `L(λ)`.** A finite-dimensional irreducible `L`-module
  has a highest weight vector (a nonzero vector in the top weight space for the height order, killed by
  `n⁺`), so it is a highest weight module, hence `≅ L(λ)` for a unique `λ`; and `λ` is **dominant
  integral** (`λ(αᵢ^∨) ∈ ℕ` for simple `αᵢ`), because restricting to each simple `sl₂` and applying
  Layer 0 forces the highest weight along `αᵢ` to be a natural number.
- **`L(λ)` is finite-dimensional iff `λ` is dominant integral.** The hard direction (dominant integral
  ⇒ finite-dimensional): for dominant integral `λ`, the vector `fᵢ^{λ(αᵢ^∨)+1} · v` is a highest
  weight vector of weight `λ - (λ(αᵢ^∨)+1)αᵢ` in `M(λ)`, hence zero in `L(λ)` (this is the `sl₂`-finite
  condition along `αᵢ`), so `L(λ)` is `sl₂`-finite along every simple root; a Weyl-group / stability
  argument then bounds the weights and gives finite-dimensionality.
- **The classification theorem.** `λ ↦ L(λ)` is a bijection from **dominant integral weights** to
  isomorphism classes of **finite-dimensional irreducible** `L`-modules, with inverse "highest weight".
  This is the summit of the classification and the interface consumed by
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md).

### Layer 5: complete reducibility (Weyl's theorem)

- **The Casimir element.** `casimirElement : U(L)` built from a basis of `L` and its dual basis under
  the non-degenerate Killing form (`Killing.lean`, `traceForm_cartan_nondegenerate`), central in
  `U(L)`, acting on `L(λ)` by the scalar `⟨λ+ρ, λ+ρ⟩ - ⟨ρ, ρ⟩` (via the invariant form on weights).
  Prove centrality and compute the eigenvalue.
- **Weyl's complete reducibility theorem.** Every finite-dimensional module over a semisimple `L`
  (char 0) is a direct sum of irreducibles; equivalently every `LieSubmodule N ≤ M` has a complement
  (`∃ N', IsCompl N N'`). Prove it via the Casimir (the eigenvalue separates the trivial module from
  nontrivial irreducibles, splitting off invariants and reducing an extension by the trivial module),
  the standard route; the `sl₂` case of Layer 0 is the rank-one instance and a consistency check.
- **Consequences.** The category of finite-dimensional `L`-modules is semisimple with simple objects
  the `L(λ)` (dominant integral `λ`), so every finite-dimensional module has a well-defined
  multiplicity decomposition `M ≅ ⨁_λ L(λ)^{⊕ mλ}`, the setting in which characters are additive.

### Layer 6: the Weyl character, dimension, and Kostant formulas

- **Formal characters.** `formalCharacter M : Module.Dual K H →₀ ℤ`, `μ ↦ dim Mμ`, supported on
  integral weights, additive on short exact sequences and multiplicative on tensor products (so it is a
  ring homomorphism from the representation ring to the group algebra `ℤ[X]` of the weight lattice).
  The Weyl group acts, and `formalCharacter` is Weyl-invariant (Layer 2).
- **The Weyl character formula.** In `ℤ[X]`, with `ρ` the half-sum of positive roots and the Weyl
  denominator `Δ = ∏_{α>0}(e^{α/2} - e^{-α/2}) = ∑_{w ∈ W} sgn(w) e^{w(ρ)}`,
  `formalCharacter (L(λ)) · Δ = ∑_{w ∈ W} sgn(w) e^{w(λ+ρ)}` for dominant integral `λ`. Prove it from
  the Casimir (the Harish-Chandra / Kostant route) or the Verma-module resolution
  `[M(λ)] = ∑_{μ ≤ λ} (…) [L(μ)]` inverted by Weyl symmetry; state the numerator/denominator identity
  as the headline, with the alternating sums indexed by `(rootSystem H).weylGroup`.
- **The Weyl dimension formula.** Specializing at the trivial character,
  `dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩`, an identity in `ℚ` (the product is a positive integer).
  Prove it as the limit/specialization of the character formula.
- **Kostant's multiplicity formula.** The **Kostant partition function** `P(ν)` (number of ways to
  write `ν` as a sum of positive roots with multiplicity) and the multiplicity of the weight `μ` in
  `L(λ)`: `mult_μ L(λ) = ∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))`. Prove it by expanding the character
  formula against the geometric-series expansion of `Δ⁻¹` (whose coefficients are `P`). This is the
  weight-by-weight refinement of the character formula and the finest of the three.

---

## Worked examples (acceptance criteria)

- **`sl₂` irreducibles `V(n)`.** For `L = sl (Fin 2) K` with its standard triple: construct `V(n)`,
  prove `dim V(n) = n+1`, that `h` acts with spectrum `{n, n-2, …, -n}`, and that `V(0), V(1), V(2)`
  are the trivial, standard, and adjoint modules. Verify Clebsch-Gordan `V(1) ⊗ V(1) ≅ V(2) ⊕ V(0)`.
  Weyl dimension formula: `dim V(n) = (n+1)`, matching directly.
- **The adjoint representation.** For any `L` (e.g. `sl (Fin 3) K`), the adjoint module `L` itself is
  finite-dimensional irreducible (for simple `L`), its weights are the roots together with `0` (with
  multiplicity `rank L`), its highest weight is the **highest root** `θ`, and it is `L(θ)`. Check
  `dim L` against the Weyl dimension formula at `λ = θ`.
- **`sl₃` weight diagrams.** For `L = sl (Fin 3) K` (type `A₂`), with fundamental weights `ω₁, ω₂`:
  the standard `V(ω₁)` (dimension `3`) and its dual `V(ω₂)` (dimension `3`), the adjoint `V(ω₁+ω₂)`
  (dimension `8`) with its hexagonal weight diagram and the `0` weight of multiplicity `2` (Kostant's
  formula gives the `2`), and `V(2ω₁)` (dimension `6`). Reproduce the weight diagrams as the supports
  of `formalCharacter`.
- **The Weyl dimension formula on a few reps.** For type `A₂`: `dim V(aω₁+bω₂) = (a+1)(b+1)(a+b+2)/2`,
  checked against `3, 3, 8, 6, 10` for `ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁`. For type `B₂`/`G₂`, at least the
  adjoint and one fundamental representation, as a check that the positive-root product is computed with
  the right multiplicities.
- **Complete reducibility in action.** A chosen reducible-but-indecomposable-looking extension (e.g. a
  non-split-looking submodule of `V(1) ⊗ V(1)`) is split by Layer 5, decomposing as predicted by
  Clebsch-Gordan and the character ring.

## Ordering

Layer 0 (`sl₂`) is built first and in full, because Layers 2, 4, and 5 call it. Layer 1 (Cartan,
root-space decomposition, positive system) is an assembly of Mathlib and can proceed in parallel with
Layer 0; it fixes the `sl₂` triple of each root, which Layer 2 needs. Layer 2 (weight-space
decomposition and the integrality of weights) needs Layers 0 and 1: integrality **is** the `sl₂`
reduction. Layer 3 (PBW, Verma modules, `L(λ)`) needs Layer 1's positive system and the enveloping
algebra; PBW is independent and can start early. Layer 4 (the classification) needs Layers 2 and 3:
dominance is the `sl₂`-finiteness condition read through Layer 0. Layer 5 (Weyl's theorem via the
Casimir) needs the Killing form (Mathlib) and Layer 3's `L(λ)` for the eigenvalue computation; the
`sl₂` complete reducibility of Layer 0 is its rank-one check. Layer 6 (the character, dimension, and
Kostant formulas) needs Layer 5's semisimplicity (so characters are additive) and Layer 3's Verma
theory (for the resolution route). A contributor can complete Layers 0-2 (the engine, the
decomposition, integrality) as a self-contained first unit, then Layers 3-4 (highest weight theory and
the classification), then Layers 5-6 (complete reducibility and the formulas).

## References

- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972),
  the primary reference: `sl₂` (Ch. II §7), root-space decomposition and root systems (Ch. III), the
  universal enveloping algebra and PBW (Ch. V §17), Verma modules, `L(λ)`, and the finite-dimensional
  classification (Ch. VI §20-21), Weyl's complete reducibility via the Casimir (Ch. II §6, Ch. VI),
  and the Weyl character and dimension formulas and Kostant's formula (Ch. VI §22-24).
- J.-P. Serre, *Complex Semisimple Lie Algebras*, Springer (1987), the concise development of `sl₂`,
  root systems, and the highest-weight classification.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991), `sl₂`,
  `sl₃` weight diagrams (Lectures 11-12), the classical-series representations, and the Weyl character
  and dimension formulas (Lecture 25) with many worked examples; the source for the `sl₃` acceptance
  criteria.
- J. E. Humphreys, *Representations of Semisimple Lie Algebras in the BGG Category O*, AMS GSM 94
  (2008), Verma modules, category `O`, the BGG resolution, and the character formula in modern form.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 7-8*, the structure theory, Cartan
  subalgebras, root systems, and the invariant-theoretic treatment of characters.
- J. C. Jantzen, *Lectures on Quantum Groups* / *Representations of Algebraic Groups*, the Kostant
  partition function, the Weyl and Kostant formulas, and the link to the algebraic-groups picture that
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) consumes.
