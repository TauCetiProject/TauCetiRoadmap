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

Three further structural pillars are equally absent. The **center of the universal enveloping
algebra** `Z(U(𝔤))` and the **Harish-Chandra isomorphism** `Z(U(𝔤)) ≅ S(𝔥)^W` (the dot-action
`W`-invariants of the symmetric algebra of the Cartan), with its **central characters** `χ_λ`, the
theorem `χ_λ = χ_μ ⟺ μ ∈ W·λ`, and the **linkage principle**, are unbuilt (the Casimir of Layer 5 is
one central element, but the center as a whole is not described). **Freudenthal's multiplicity
recursion**, the practical complement to Kostant's formula, is absent. And on the concrete side the
**exceptional Lie algebras** are barely touched: here Mathlib is further along than elsewhere, since
`Mathlib/Algebra/Lie/SerreConstruction.lean` gives the Serre presentation `Matrix.ToLieAlgebra` of a
Lie algebra from a Cartan matrix and even names the five exceptional split algebras `LieAlgebra.e₆`,
`e₇`, `e₈`, `f₄`, `g₂` (as `Matrix.ToLieAlgebra K CartanMatrix.E₆` and friends), but it proves nothing
about them: not that they are finite-dimensional or Killing-semisimple, not their dimensions
`78, 133, 248, 52, 14`, and none of the **octonion / Jordan / magic-square** models that realize them.
The **octonions** are absent from Mathlib entirely.

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
- **The Serre presentation and the exceptional algebras, as defined objects:**
  `Mathlib/Algebra/Lie/SerreConstruction.lean`, `Matrix.ToLieAlgebra R CM` (the quotient of
  `FreeLieAlgebra R (CartanMatrix.Generators B)` by the Serre relations `CartanMatrix.Relations.toIdeal`,
  built from `CartanMatrix.Relations.HH/EF/HE/HF/adE/adF`, carrying `LieRing` and `LieAlgebra R`
  instances), and the named split algebras `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂`; the standard
  integer Cartan matrices `CartanMatrix.E₆`, `E₇`, `E₈`, `F₄`, `G₂`, `A n`, `B n`, `C n`, `D n`
  (`Mathlib/Data/Matrix/Cartan.lean`), and `RootPairing.Base.cartanMatrix` of the
  [../RootSystems/README.md](../RootSystems/README.md) roadmap. Mathlib defines these algebras but
  proves nothing about their structure.
- **The symmetric algebra and the center of an algebra:** `Mathlib/LinearAlgebra/SymmetricAlgebra/`
  (`SymmetricAlgebra R M`, `SymmetricAlgebra.equivMvPolynomial`, `Basis.symmetricAlgebra`), the target
  of the Harish-Chandra isomorphism; `Subalgebra.center R A` (`Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`),
  so `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`; and the Weyl group
  `(rootSystem H).weylGroup` that acts on `S(H)` by the dot action.
- **Non-associative algebras, derivations, and exterior powers (for the exceptional models):**
  `Mathlib/Algebra/Jordan/Basic.lean` (`IsJordan`, `IsCommJordan`, the Jordan-identity classes);
  `Mathlib/Algebra/Lie/Derivation/Basic.lean` (`LieDerivation`, and `LieDerivation.instLieAlgebra`,
  the derivations of a Lie algebra as a Lie algebra) and `Mathlib/RingTheory/Derivation/Basic.lean`
  (`Derivation R A M`, for the commutative case); `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`
  (`exteriorPower`, `⋀[R]^n M`, `exteriorPower.map`, `exteriorPower.ιMulti`) for the magic-square
  summands; and `LieAlgebra.SpecialLinear.sl n R` (`Algebra/Lie/Classical.lean`). Mathlib has **no
  octonion / Cayley algebra** and **no exceptional Jordan (Albert) algebra**.

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

Beyond these, this roadmap builds the **center of `U(L)` and the Harish-Chandra isomorphism**
`Z(U(L)) ≅ S(H)^W` (dot action), the **central characters** `χ_λ` and the **linkage principle**
`χ_λ = χ_μ ⟺ μ ∈ W·λ`, and **Freudenthal's multiplicity recursion**; the **Serre presentation
theorem** identifying Mathlib's already-defined `Matrix.ToLieAlgebra K b.cartanMatrix` with the
Killing Lie algebra `L` of its root system (the Lie-algebra companion to the root-datum existence of
[../RootSystems/README.md](../RootSystems/README.md)); and the **exceptional Lie algebras
explicitly**, from the **octonions** `𝕆` (built here, since Mathlib has none) through `G₂ = Der(𝕆)`,
the **Albert algebra** `H₃(𝕆)` with `F₄ = Der(H₃(𝕆))`, and the **Freudenthal-Tits magic square** for
`E₆, E₇, E₈`, with their smallest representations and the identification of each with Mathlib's
`LieAlgebra.g₂`, `f₄`, `e₆`, `e₇`, `e₈`. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`Sl2Irrep`/the `V(n)` classification,
`IsHighestWeightVector`, `vermaModule`, `irreducibleQuotient` `L(λ)`, `IsDominantIntegral`,
`casimirElement`, `formalCharacter`, `weylCharacter`, the Weyl dimension and Kostant statements, the
`centralCharacter` and `harishChandraIso`, `freudenthal_multiplicity_formula`, the Serre-presentation
equivalence, the `Octonion`/`AlbertAlgebra` carriers, and the exceptional `g₂`/`f₄`/`e₈`
identifications) and the named milestones below as `sorry`-targets, so each is claimable and the summit
statements are machine-checked to be expressible against the pinned Mathlib.

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

### Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The structural layer behind the character formula: the center that the Casimir of Layer 5 sits inside,
the recursion that computes multiplicities in practice, and the presentation that recovers `L` from
its root system.

- **The center `Z(U(L))` and central characters.** `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`,
  the commutative algebra in which the Casimir element of Layer 5 lives. Each `L(λ)` is a
  `Z(U(L))`-eigenspace: `z` acts on `L(λ)` by a scalar `χ_λ(z)`, giving the **central character**
  `χ_λ : Z(U(L)) →ₐ[K] K` (`centralCharacter λ`). Prove `z` acts on every highest weight module of
  weight `λ` by `χ_λ(z)` (the highest weight vector is a `Z`-eigenvector and generates), so
  `χ_λ` is well-defined and the Casimir eigenvalue `⟨λ+ρ,λ+ρ⟩ - ⟨ρ,ρ⟩` of Layer 5 is `χ_λ(casimirElement)`.
- **The Harish-Chandra isomorphism.** The **dot action** of the Weyl group on weights,
  `w · λ = w(λ+ρ) - ρ`, and the induced action on the symmetric algebra `S(H) = SymmetricAlgebra K H`
  (consume `SymmetricAlgebra`, `Basis.symmetricAlgebra`); the **Harish-Chandra homomorphism**
  `Z(U(L)) → S(H)` (projection of the triangular decomposition of Layer 3 onto the `U(H) = S(H)`
  factor, `ρ`-shifted) and the theorem that it is an **algebra isomorphism onto the dot-invariants**
  `harishChandraIso b : Z(U(L)) ≃ₐ[K] S(H)^{W·}`. This is the structure behind Verma-module
  homomorphisms and the character formula.
- **The linkage principle.** `χ_λ = χ_μ ⟺ μ ∈ W·λ` (dot action): two central characters coincide iff
  the weights are `W`-linked (`harishChandra_linkage`). Prove it from `harishChandraIso` (a central
  character is a `W·`-orbit of points of `S(H)`). This is the constraint that a nonzero
  `Hom(M(μ), M(λ))` forces `μ ∈ W·λ` and that a composition factor `L(μ)` of `M(λ)` has `μ ∈ W·λ`, the
  block decomposition of category `O`.
- **Freudenthal's multiplicity formula.** The recursion, for `μ` a weight of `L(λ)`,
  `(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} · ⟨μ+jα, α⟩`
  (`freudenthal_multiplicity_formula`), the practical way to compute weight multiplicities downward
  from `λ`, complementing the closed form of Kostant. Prove it from the Casimir eigenvalue and the
  `sl₂`-string action of each `⟨eₐ, hₐ, fₐ⟩` on the weight spaces of `L(λ)` (Layer 2). It is a check on
  Kostant's formula and the fast route for the worked examples below.
- **Serre's relations and the presentation of `L`.** Mathlib already builds
  `Matrix.ToLieAlgebra K CM` (`SerreConstruction.lean`), the quotient of `FreeLieAlgebra K (CartanMatrix.Generators B)`
  by the Serre relations from `CM`, with Chevalley generators `E_i, F_i, H_i`. The target is the
  **presentation theorem**: for a Killing-semisimple `L` with base `b`, the standard generators
  attached to the simple roots (the `sl₂` triples of Layer 1) satisfy the Serre relations of
  `b.cartanMatrix`, and the induced map is a Lie-algebra isomorphism
  `Matrix.ToLieAlgebra K b.cartanMatrix ≃ₗ⁅K⁆ L`. This gives `L` from its root system and identifies
  Mathlib's `Matrix.ToLieAlgebra` with the concrete Killing algebra; it is the Lie-algebra companion to
  the root-datum existence (`GeckConstruction`) recorded in
  [../RootSystems/README.md](../RootSystems/README.md), and the input to Layer 8's identification of the
  exceptional models.

### Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as Serre-construction quotients but proves
nothing about them, and has no octonions. This layer constructs the concrete algebras that realize the
exceptional Dynkin diagrams classified in [../RootSystems/README.md](../RootSystems/README.md), and
their smallest representations, and identifies them with the Serre-construction objects via Layer 7.

- **The octonions `𝕆`.** The Cayley algebra, built by the **Cayley-Dickson doubling** of the
  quaternions (themselves the doubling of `K ⊕ K`): an `8`-dimensional non-associative,
  non-commutative, **alternative** composition algebra with a multiplicative norm form. Mathlib has
  none of this, so it is built here (`Octonion K`), with its conjugation, norm, and the alternative and
  Moufang identities. This is a target in its own right.
- **`G₂ = Der(𝕆)`.** The derivation algebra of `𝕆` is a `14`-dimensional simple Lie algebra of type
  `G₂`, with its `7`-dimensional **fundamental representation** the trace-zero imaginary octonions
  `Im 𝕆` (the smallest faithful representation). Build `derivationLieAlgebra (Octonion K)` (the
  derivations of the non-associative algebra `𝕆`, a Lie algebra under commutator, modelled on
  `LieDerivation` but for a non-associative algebra), prove `finrank = 14`, that it is Killing-simple of
  type `G₂`, and that `Im 𝕆` is its `7`-dimensional irreducible; identify it with `LieAlgebra.g₂ K`
  via the Serre presentation of Layer 7.
- **The Albert algebra `H₃(𝕆)` and `F₄ = Der(H₃(𝕆))`.** The **exceptional (Albert) Jordan algebra**
  `J = H₃(𝕆)` of `3×3` Hermitian octonionic matrices under the symmetrized product
  `x ∘ y = ½(xy + yx)`, a `27`-dimensional formally real exceptional Jordan algebra (consume `IsJordan`
  / `IsCommJordan`). Its derivation algebra `F₄ = Der(J)` is a `52`-dimensional simple Lie algebra of
  type `F₄`, with its `26`-dimensional **fundamental representation** the trace-zero elements `J₀ ⊂ J`.
  Build `AlbertAlgebra K`, prove the Jordan identity, build `derivationLieAlgebra (AlbertAlgebra K)`,
  prove `finrank = 52` and Killing-simplicity of type `F₄`, and identify it with `LieAlgebra.f₄ K`.
- **The Freudenthal-Tits magic square: `E₆, E₇, E₈`.** The construction of the remaining exceptional
  algebras as `ℤ`-graded sums built from `𝕆` and `J`; concretely, the `ℤ/3`-grading
  `𝔢₈ = 𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*` of dimension `248 = 80 + 84 + 84` (consume
  `LieAlgebra.SpecialLinear.sl (Fin 9) K` and `exteriorPower`, `⋀[K]^3 (Fin 9 → K)`), with the Lie
  bracket the graded bracket pairing the exterior summands into `𝔰𝔩₉`; and `E₆` (dimension `78`, with
  its `27`-dimensional representation `J`) and `E₇` (dimension `133`, with its `56`-dimensional
  representation from the Freudenthal triple system on `J`) as the corresponding rows of the magic
  square. Build each, prove its dimension and Killing-simplicity of the stated type, and identify it
  with `LieAlgebra.e₆`, `e₇`, `e₈ K` via Layer 7. The **fundamental representations** `27` for `E₆`,
  `56` for `E₇`, and the adjoint `248` for `E₈` are the smallest ones and the acceptance targets.

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
- **The center and linkage for `sl₂`.** For `L = sl (Fin 2) K`, `Z(U(L))` is the polynomial algebra
  `K[c]` on the Casimir `c` (the Harish-Chandra image is `S(H)^W = K[h²]`, `W = ℤ/2` acting by
  `h ↦ -h` on the shifted coordinate), `χ_n(c) = n(n+2)/2·(normalization)`, and linkage `χ_λ = χ_μ ⟺
  μ = λ` or `μ = -λ-2` (dot action of the nontrivial reflection). Freudenthal on `V(n)` returns
  multiplicity `1` for each of the weights `n, n-2, …, -n`, matching Layer 0.
- **`sl₃` multiplicities by Freudenthal.** For type `A₂`, recompute the `0`-weight multiplicity `2` of
  the adjoint `V(ω₁+ω₂)` by Freudenthal's recursion (a check on the Kostant computation of the earlier
  worked example) and the multiplicities of `V(2ω₁+2ω₂)`.
- **`G₂ = Der(𝕆)` and its `7`.** Build `𝕆 = Octonion K`, verify the alternative identities and the
  multiplicative norm, build `Der(𝕆)`, and check `finrank K (Der 𝕆) = 14`, that it is Killing-simple of
  type `G₂` (Cartan matrix reindexes to `CartanMatrix.G₂`), that `Im 𝕆` is its `7`-dimensional
  irreducible `V(ω₁)`, and `Der(𝕆) ≃ₗ⁅K⁆ LieAlgebra.g₂ K`. The Weyl dimension formula on `G₂` returns
  `7` and `14` for the two fundamental weights.
- **`F₄ = Der(H₃(𝕆))` and `E₈`.** Build the Albert algebra `H₃(𝕆)`, check `finrank = 27` and the Jordan
  identity, build `Der(H₃(𝕆))` and check `finrank = 52`, type `F₄`, the `26`-dimensional representation
  `J₀`, and `≃ₗ⁅K⁆ LieAlgebra.f₄ K`. For `E₈`, check `finrank (𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*) = 248 =
  80 + 84 + 84`, Killing-simplicity of type `E₈`, and `≃ₗ⁅K⁆ LieAlgebra.e₈ K`; the Weyl dimension
  formula at the adjoint highest weight returns `248`.

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
the classification), then Layers 5-6 (complete reducibility and the formulas). Layer 7 (the center,
Harish-Chandra, Freudenthal, Serre) needs Layer 3's triangular decomposition and `L(λ)` (for the
Harish-Chandra projection and central characters) and Layer 5's Casimir (which it generalizes);
Freudenthal needs Layer 2's `sl₂` strings, and the Serre presentation needs Layer 1's simple `sl₂`
triples and consumes `equivOfCartanMatrixEq` of [../RootSystems/README.md](../RootSystems/README.md).
Layer 8 (the exceptional algebras) is the most independent lane: the **octonions** and the **Albert
algebra** can be built from scratch at any time (they need no earlier layer), and their derivation
algebras and magic-square constructions need only the linear-algebra machinery; the identification of
each with `LieAlgebra.g₂`/`f₄`/`e₆`/`e₇`/`e₈` uses Layer 7's Serre presentation, and the dimensions
and weights of their fundamental representations are checked against Layer 6's Weyl dimension formula.
A contributor can build `𝕆`, `G₂ = Der(𝕆)`, and its `7` as a self-contained capstone unit.

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
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapter 8*, the center of the enveloping algebra, the
  Harish-Chandra homomorphism and central characters, the linkage principle, and the Chevalley-Serre
  presentation of a split semisimple Lie algebra; the source for Layer 7.
- N. Jacobson, *Exceptional Lie Algebras*, Marcel Dekker (1971), and R. D. Schafer, *An Introduction
  to Nonassociative Algebras*, Academic Press (1966), the octonions, the Albert algebra `H₃(𝕆)`, and
  the derivation algebras `G₂ = Der(𝕆)` and `F₄ = Der(H₃(𝕆))`; the source for Layer 8.
- J. C. Baez, *The Octonions*, Bull. AMS 39 (2002), and J. M. Landsberg, L. Manivel, the
  Freudenthal-Tits magic square and the exceptional series with their smallest representations; the
  concrete magic-square constructions of `E₆, E₇, E₈` used in Layer 8.
