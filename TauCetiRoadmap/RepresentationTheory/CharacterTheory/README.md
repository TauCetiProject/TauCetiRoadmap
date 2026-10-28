# Roadmap: character theory of finite groups, and computing character tables

Consume Mathlib's trace characters, Maschke, Schur, Artin–Wedderburn, roots of unity,
cyclotomic number fields and algebraic-integer APIs. Consume the pinned TauCeti
`RepresentationTheory/CharacterTable` implementation: `ClassFunction` and its
bundled bilinear `characterPairing`; class sums, their basis, integral structure
constants and multiplication matrices; completeness, the table and column
orthogonality; primitive central idempotents and central characters; degree
divisibility, Galois character formulas and Burnside solvability; the actual
`ClassData` and exact cyclotomic `Option` solver with its checker and soundness.
The named targets below specify the full subject and its comparisons: use these
existing objects and theorems directly, and construct only the missing adapters.
In particular keep the cross-universe module/multiplicity comparisons, the new
faithful tensor-generation theorem, and Layer6's exact-integral/bounded-completeness
bridge explicit. Existing conditional solver soundness is not a proof of complete
reconstruction at the old square-root coefficient threshold.

This roadmap builds that theory and ends at an **executable, proven-correct** character-table
algorithm: a Lean function that `#eval`s to the character table of a concrete finite group, together with
a theorem that its output is *the* character table. The vehicle is the **Burnside-Dixon-Schneider
algorithm**: the irreducible characters are read off the common left eigenrows of the commuting
class-multiplication matrices, a computation Dixon reduces to linear algebra over a finite field
`ZMod p` and then lifts to the cyclotomic integers. Reaching a proven-correct solver forces the whole
classical theory first, because correctness is proved by showing the computed table satisfies a
specification (orthogonality, integrality, the structure-constant eigenvalue characterization) that
**determines the character table uniquely**.

The work divides into three deliverables of increasing depth, with a fourth strand of classical structure
theorems and worked families layered on the character theory of A; the layers below are grouped by them:

- **A. Ordinary character theory and the character table** (Layers 0-4): the classical development,
  worth building in full for its own sake.
- **B. The class algebra and the Dixon-Schneider specification** (Layer 5): the theorem that the
  structure constants plus integrality *determine* the table, and the checker it yields.
- **C. The executable certified algorithm with exact cyclotomic output** (Layer 6): the finite-field
  computation and the cyclotomic lift, conditional on an explicit exact-arithmetic infrastructure that
  is itself a named target here.
- **D. Structural theorems and worked families** (Layers 7-9): the Frobenius-Schur trichotomy and the
  real/quaternionic/complex classification of irreducibles, Frobenius's theorem `G = N ⋊ H`, and the full
  character table of `GL₂(𝔽_q)`. These are classical applications of A, off the Dixon-Schneider critical
  path, and each is a self-contained target.

Suggested home: `TauCeti/RepresentationTheory/CharacterTable/` (deliverable C under
`.../CharacterTable/Dixon/`), mirroring Mathlib's `RepresentationTheory/`.

## Standing conventions

- **The group.** `G` is a finite group throughout (`[Group G] [Finite G]`, and `[Fintype G]`
  `[DecidableEq G]` for anything computed). Write `Nat.card G` for its order and `Monoid.exponent G`
  for its exponent `e`.
- **The coefficient field, and the two of them.** State each result at the generality it needs, matching
  Mathlib. The **theory** (orthogonality, completeness, the count, the structure theory) is stated over a
  field `k` that is **algebraically closed with `char k ∤ |G|`** - Mathlib's `char_orthonormal` and
  `k[G] ≅ ⊕ Matₙᵢ(k)` live there. The **character table as a concrete object** is over **`ℂ`**, whose
  entries are honest complex numbers. Do not bundle "algebraically closed and `char ∤ |G|`" into a class;
  spell the hypotheses each result uses. Keep the three arenas - a general `k`, the field `ℂ`, and the
  cyclotomic field `ℚ(ζ_e)` - separate: prove eigenvalue statements over `k`, complex-analytic
  statements over `ℂ`, and arithmetic statements over `ℚ(ζ_e)`, and state each transfer explicitly rather
  than sliding between them.
- **Exact arithmetic is the computational artifact; `ℂ` is only the specification.** `Complex` is not a
  computable algebraic-number type, so nothing is `#eval`ed in `ℂ`. Deliverable C computes in an
  **exact, computable cyclotomic-integer type** - coefficient vectors on the power basis of
  `ℤ[ζ_e] = ℤ[X]/Φ_e` (`e = Monoid.exponent G`), for which `+`, `*`, and `DecidableEq` are genuine
  `def`s. Pin a definite embedding `ℤ[ζ_e] ↪ ℂ`. The complex table is the image of the exact table under
  this embedding; the correctness theorem says the *embedded* exact output satisfies the `ℂ`-valued
  specification. Ordinary character values lie in `ℚ(ζ_e)`, and the Galois group acts on them by the
  power maps `σ_k : ζ ↦ ζ^k` (Mathlib's `autEquivPow`); these two facts are **mandatory** before the
  lift-correctness theorem, whereas full Brauer splitting (below) is not.
- **The primary spine is the group algebra; `FDRep` is the categorical mirror.** Develop the theory on
  the **module/algebra core** - `k[G] = MonoidAlgebra k G`, its modules, `Representation.character`, and
  `Representation.IsIrreducible` - because it is Mathlib-native, carries the semisimple structure theory,
  and is the computation-friendly presentation. Where the categorical statement is cleaner (Schur, the
  orthogonality already in Mathlib), transport along `Rep.equivalenceModuleMonoidAlgebra` and keep the
  `FDRep`/`CategoryTheory.Simple` mirror in step. Layer 2.5 makes the equivalence among simple
  `k[G]`-modules, irreducible representations, `FDRep` simples, and Wedderburn block indices an explicit
  piece of API, not an implicit assumption. Use Mathlib's vocabulary: `ConjClasses G`, `MonoidAlgebra`,
  `IsIntegral`, `IsPrimitiveRoot`, `CyclotomicField`, `Monoid.exponent`, never a private synonym.
- **The character pairing is bilinear; the Hermitian inner product is a `ℂ`-only refinement.** The pairing
  `⟨f₁, f₂⟩ = (Nat.card G)⁻¹ • ∑ g, f₁ g * f₂ g⁻¹` on class functions is **bilinear and symmetric** over a
  general field; it is *not* Hermitian there. Name it `characterPairing`. Over `ℂ`, and only for virtual
  characters, `f₂ g⁻¹ = conj (f₂ g)`, so the pairing agrees with the usual conjugate-linear inner
  product; state that as a separate `ℂ`-lemma, and reserve the word "Hermitian" for it.
- **Central characters versus character values, kept distinct.** The algorithm's primary computed object
  is the **central-character table** `Ω`, `Ωᵪ,ⱼ = ωᵪ(Kⱼ)` (values of the central character on class
  sums), not the ordinary character table `X`, `Xᵢ,ⱼ = χᵢ(gⱼ)`. They are related by
  `ωᵪ(Kⱼ) = |Cⱼ| · χ(gⱼ) / χ(1)`; name both, prove the conversion both ways, and treat the ordinary
  table as a final conversion step from `Ω`.
- **Computable means `#eval`-able.** For deliverable C, "compute" means a definition that reduces by the
  kernel evaluator, tested by `#eval`, on `[DecidableEq G] [Fintype G]` data. Every ingredient on the
  critical path (class enumeration via an executable `ClassData`, structure constants, finite-field
  linear algebra, the lift) must be a genuine `def`, never a `noncomputable` existence statement.
  Mathlib's `noncomputable` character API is the *specification* the algorithm is proved against, not a
  step in it.

## What Mathlib already has (consume)

- **Characters as traces:** `RepresentationTheory/Character.lean` - `Representation.character ρ g`,
  `FDRep.character V g`, with `char_one`, `char_conj`, `char_mul_comm`, `char_tensor`, `char_dual`,
  `char_linHom`, `char_iso`.
- **First orthogonality:** `char_orthonormal` (both forms), over
  `[Group G] [IsAlgClosed k] [Fintype G] [Invertible (Nat.card G : k)]`, with its supports
  `scalar_product_char_eq_finrank_equivariant`, `card_inv_mul_sum_char_mul_char_eq_finrank`,
  `average_char_eq_finrank_invariants`, `FinGroupCharZero.simple_iff_char_is_norm_one`.
- **Maschke and semisimplicity:** `RepresentationTheory/Maschke.lean` (`IsSemisimpleRing k[G]`,
  `IsSemisimpleModule k[G] V`), `RepresentationTheory/Semisimple.lean`, and the injective/projective
  instances in `RepresentationTheory/FinGroupCharZero.lean`.
- **Schur's lemma:** `finrank_endomorphism_simple_eq_one`, `finrank_hom_simple_simple`;
  `FDRep.simple_iff_end_is_rank_one`.
- **Artin-Wedderburn:** `RingTheory/SimpleModule/WedderburnArtin.lean`
  (`isSemisimpleRing_iff_pi_matrix_divisionRing`, `exists_ringEquiv_pi_matrix_divisionRing`) and its
  algebraically-closed specialization
  `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` - giving a **noncomputable** algebra
  equivalence `k[G] ≃ ∏ Matₙᵢ(k)` once composed with Maschke.
- **Conjugacy classes, computably:** `Algebra/Group/Conj.lean` (`ConjClasses G`),
  `Algebra/Group/ConjFinite.lean` (`Fintype (ConjClasses α)`,
  `DecidableRel (IsConj : α → α → Prop)` for `[DecidableEq α] [Fintype α]`, `Fintype (carrier x)`),
  `GroupTheory/GroupAction/CardCommute.lean` (`card_comm_eq_card_conjClasses_mul_card`).
- **Concrete computable groups:** `Equiv.Perm (Fin n)`, `GroupTheory/SpecificGroups/Dihedral.lean`
  (`DihedralGroup n`, `deriving DecidableEq`, computable `Group`/`Fintype`), `Quaternion.lean`, `Cyclic.lean`.
- **Group algebra, computably:** `Algebra/MonoidAlgebra/*` (`MonoidAlgebra k G = G →₀ k`, computable
  multiplication for computable `k` and `[DecidableEq G]`).
- **Character-value integrality:** `Representation.isIntegral_character` and `FDRep.isIntegral_character` in
  `RepresentationTheory/Character.lean` for finite groups and finite-dimensional representations;
  cyclotomic value lifts and their embedding compatibility are Layer 4 targets.
- **Algebraic integers:** `RingTheory/IntegralClosure/*` - `IsIntegral`, `integralClosure`,
  `IsIntegral.add/mul/...`; `IsIntegrallyClosed` with `isIntegral_iff`, `IsIntegrallyClosed ℤ` via
  `GCDMonoid.toIsIntegrallyClosed`; `NumberField.RingOfIntegers` (`𝓞 K`).
- **Roots of unity and cyclotomics:** `RingTheory/RootsOfUnity/*` (`rootsOfUnity`, `IsPrimitiveRoot`,
  `IsPrimitiveRoot.isIntegral`), `NumberTheory/Cyclotomic/*` (`IsCyclotomicExtension`, `CyclotomicField`,
  `CyclotomicRing`, `IsPrimitiveRoot.autToPow`/`autEquivPow : Gal ≃* (ZMod n)ˣ`), `Monoid.exponent`.
- **Finite fields, computably:** `Data/ZMod/Basic.lean` (`ZMod.inv` a genuine `def`),
  `Algebra/Field/ZMod.lean` (`Field (ZMod p)`), `FieldTheory/Finite/*`; and, for the Dixon prime, the
  primes dividing `Φ_e` are (bar finitely many) `≡ 1 (mod e)` - an elementary source of `≡ 1` primes
  that avoids full Dirichlet.
- **Semisimple endomorphisms:** `Module.End.isSemisimple_of_squarefree_aeval_eq_zero`
  (`LinearAlgebra/Semisimple.lean`), the raw material for "`ρ g` is diagonalizable".
- **Central elements as intertwiners:** `RepresentationTheory/Intertwining.lean`
  (`isIntertwiningMap_of_mem_center`, `centralMul`, `equivAlgEnd`), the raw material for the central
  character.

## Native integration and comparison targets

The native `TauCeti/RepresentationTheory/CharacterTable` modules are the foundational
objects for Layers0–6, not an alternate implementation to copy. In particular use
`ClassFunction.equivConjClasses`, `ClassFunction.characterPairing`, its
nondegeneracy and pairing-to-Hom lemmas, `ClassFunction.le_span_irreducibleCharacters`,
`Table.characterTable` (the declaration is `TauCeti.characterTable`),
`Representation.centralCharacter`, `ClassSum/Eigenrow`, `Specification` and
`Solvable`. Its table rows are `Fin (Nat.card (ConjClasses G))`; use the existing
finite indexing maps. Native `Cyclotomic`, `DixonPrimeData`,
`ClassData.centralCharacterSearch` and `ClassData.dixonCyclotomicCharacterTable?`
supply the executable exact ring, modular search and all-embedding solver.
Native `FrobeniusSchur`, `FrobeniusGroup`, `RepresentationRing` and `GL2` modules
supply the corresponding existing application APIs. The milestone descriptions
retain the complete mathematical programme; they are not assertions that these
native results must be reimplemented.

The remaining comparison work includes arbitrary-universe finite-model regrouping,
character recognition, specified application intertwiners and real forms, and the
new complete central-coordinate reconstruction in Layer6. For GL₂, the native
principal-series definition is universe-polymorphic but its Mackey-based
irreducibility theorem specializes the field to `Type`; retain the finite-field
small-model transport target at arbitrary universes and consume the existing
small-model theorem. The quadratic-extension torus and cuspidal objects use the
actual native `Algebra.IsQuadraticExtension` instance derived from `finrank=2`.
No private class-function carrier, unbundled replacement pairing, extra
irreducible quotient, assumed Gaussian elimination or postulated exact ring is
used by the prototype.

`Suggested.lean` consumes native definitions for the load-bearing objects (`ClassFunction`, `classSum`, `structureConstant`,
`integralClassCenter`, `centralCharacter`, `primitiveCentralIdempotent`, `centralCharacterTable`,
`characterTable`, `IsCharacterTableSpec`, `Cyclotomic e`, `DixonPrimeData`, `characterTableDixon`) and
states new comparison milestones as honest theorem targets. The summit statement
`characterTable_eq` is stated against the actual native solver and complex checker;
new comparisons are separately named prototype targets. For Deliverable D it
consumes native `IsInvariantForm`, `frobeniusSchurIndicatorRep` and its trichotomy, `IsRealForm` and the `ν₂ = +1`
realizability target, the involution count `card_sq_eq_sum_frobeniusSchur`, `IsRealClass`,
`IsFrobeniusComplement`, `IsTISet`, `frobeniusKernel` and the bundled `frobeniusKernelSubgroup` with its
normality and `frobeniusKernel_isComplement'`, and `GL2Borel`, `GL2PrincipalSeries`, `GL2Steinberg`,
`GL2NonSplitTorus`, and `GL2Cuspidal`.

---

## A. Ordinary character theory and the character table

### Layer 0: class functions and their pairing

- **`ClassFunction k G`** - the submodule of `G → k` of functions constant on conjugacy classes. Every
  `Representation.character ρ` and `FDRep.character V` is a member (from `char_conj`).
- **Indexing by conjugacy classes.** `ClassFunction k G ≃ₗ[k] (ConjClasses G → k)`, whence
  `finrank k (ClassFunction k G) = Nat.card (ConjClasses G)` for finite `G`. This makes the character
  table a **square** matrix indexed by classes.
- **The character pairing** `characterPairing f₁ f₂ = (Nat.card G)⁻¹ • ∑ g, f₁ g * f₂ g⁻¹` on
  `ClassFunction k G` (`char ∤ |G|`): bilinear, symmetric, **nondegenerate**, with the relation to the
  `∑ g` sums in Character.lean. Over `ℂ`, the separate lemma `f g⁻¹ = conj (f g)` for a virtual character,
  identifying it with the Hermitian inner product. `char_orthonormal` becomes
  `characterPairing χᵢ χⱼ = δᵢⱼ` on irreducibles.

### Layer 1: the group algebra, its center, and structure constants

- **The class sum** `classSum k C : k[G]`, `∑_{g ∈ C} g` for `C : ConjClasses G`; consume the native
  mathematical class sum for proofs. Compute its coefficient function from the actual
  numbered `ClassData` on `[Fintype G] [DecidableEq G]` data and prove agreement with
  that mathematical class sum. The native group-algebra additive instance is
  noncomputable; executable class constants and matrices use the numbered finite data.
- **The class sums are a basis of the center.** `classSum k C ∈ Subalgebra.center k k[G]`, they are
  linearly independent, and they **span** the center: `Z(k[G])` is free with basis
  `{classSum k C}_{C}`, so `finrank k (Z(k[G])) = Nat.card (ConjClasses G)`, and the center is
  **commutative**.
- **Structure constants.** `structureConstant : ConjClasses G → ConjClasses G → ConjClasses G → ℕ`,
  `aᵢⱼₖ = #{(x,y) : x ∈ Cᵢ, y ∈ Cⱼ, x*y = gₖ}` for a fixed `gₖ ∈ Cₖ` (representative-independent), a
  computable `def`, with the defining identity `classSum Cᵢ * classSum Cⱼ = ∑ₖ aᵢⱼₖ • classSum Cₖ` and
  coercion lemmas `ℕ → ℤ → k → ZMod p`. These integers are the entire input to Dixon-Schneider.
- **The integral class center.** `integralClassCenter G`, the `ℤ`-subalgebra of `Z(ℤ[G])` with the
  class-sum basis and structure constants `aᵢⱼₖ ∈ ℤ`; a finite `ℤ`-algebra, so each class sum is
  **integral over `ℤ`** inside it. This is the object the central-character integrality argument
  base-changes from, not the field-level center.

### Layer 2: Wedderburn, irreducible indexing, and the count

- **`k[G] ≅ ∏ᵢ Matₙᵢ(k)`.** Compose Maschke with `exists_algEquiv_pi_matrix_of_isAlgClosed`
  (`k` algebraically closed, `char ∤ |G|`), a **noncomputable** algebra equivalence over a finite index
  set of matrix blocks, with every block size `nᵢ > 0`; Layer 2.5 identifies this index with
  isomorphism classes of simple `k[G]`-modules.
  Retain this positivity when deriving the center/product and block-count comparisons from a supplied
  matrix-product equivalence. Prove `∑ᵢ nᵢ² = |G|` by comparing `k`-dimensions
  (`finrank k k[G] = |G|`). Dependency clarification: this layer consumes **Mathlib's**
  Artin-Wedderburn directly; the `../SemisimpleAlgebras` roadmap is not a prerequisite for it. What
  that roadmap supplies to this one is the machine-checked block ⇆ simple-module dictionary
  (`blocks_equiv_simpleModules` there), which the Layer 2.5 indexing may consume instead of
  reproving.
- **Layer 2.5: canonical irreducible indexing and finite models.** Keep a single type `Irreps k G`
  for the isomorphism classes of simple `k[G]`-modules; give it `character`, `degree`, and the
  equivalence with the Wedderburn block index. For each `i : Irreps k G`, choose a representative
  `Zᵢ : Representation k G (Fin (degree i) → k)` whose associated `k[G]`-module is simple. Thus the
  representative carrier lies in the coefficient field's universe, so it can be used as an object of
  `FDRep k G`. Build the representative by transporting a basis of a finite-dimensional simple module
  to this finite model.

  Layer 2.5 owns the class lookup from a simple `k[G]`-module `S` in any universe to its unique
  `i : Irreps k G`. Under the semisimple group-algebra hypotheses, native
  `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` identifies `S` with a simple left
  ideal of `k[G]`; the regular-module/isotypic class bijection assigns that ideal its class. Since
  `k[G]` is finite-dimensional over `k`, a finite basis then transports the class representative to
  `Zᵢ`. State and prove uniqueness as `Nonempty (S ≃ₗ[k[G]] Zᵢ.asModule)` for exactly one `i`. This
  universe-independent class lookup lets the finite simple-submodule decomposition be regrouped
  without placing its submodules in `FDRep`. `char_orthonormal` is consumed on the finite models via
  `FDRep.of Zᵢ`; it does not define the class lookup.
- **The center splits.** `Z(k[G]) ≃ₐ[k] (Irreps k G → k)`, evaluation by central characters (the center
  of `∏ Matₙᵢ(k)` is `∏ k`). This is the sharp form Layer 5 needs: central characters **separate points**
  of the center.
- **#irreducibles = #conjugacy classes.** Combining the split with Layer 1's center dimension:
  `Nat.card (Irreps k G) = Nat.card (ConjClasses G)`.

### Layer 3: the character table, idempotents, completeness, second orthogonality

The character additivity, multiplicity, decomposition and recognition targets below concern
finite-dimensional representations, at arbitrary carrier universes.

- **Completeness.** The irreducible characters `{χᵢ}` **span** `ClassFunction k G`; with
  `char_orthonormal` and the count, they are an orthonormal (for `characterPairing`) **basis**
  `Basis (Irreps k G) k (ClassFunction k G)`.
- **Finite direct-sum additivity of characters.** Prove that `Representation.prod` has character
  equal to the sum of the two characters, and that `Representation.directSum` over a finite index has
  character equal to the finite sum. Prove the corresponding finite-biproduct identity in `FDRep`.
  These are trace-additivity statements for block-diagonal actions; use `char_iso` to transport them
  across equivalent presentations. They are prerequisites for the semisimple character expansion.
- **The pairing-to-Hom identity.** For finite-dimensional representations `ρ : Representation k G V`
  and `σ : Representation k G W`, state the identity already proved by Mathlib
  `Representation.card_inv_mul_sum_char_mul_char_eq_finrank`:
  `characterPairing σ.character ρ.character = (finrank k (Representation.IntertwiningMap ρ σ) : k)`.
  This has only the finite-group and invertible-order hypotheses; it does not require algebraic
  closure. In `FDRep`, consume `FDRep.scalar_product_char_eq_finrank_equivariant` for the matching
  categorical identity. For `V : FDRep k G`, also own the comparison
  `finrank k (FDRep.of Zᵢ ⟶ V) = finrank k (Representation.IntertwiningMap Zᵢ V.ρ)`, using
  `invariantsEquivFDRepHom` and `invariantsEquivIntertwiningMap`. Do not reprove either native
  pairing-to-Hom theorem.
- **Intrinsic multiplicities and character coefficients.** Under finite `G`, algebraically closed `k`,
  and invertible `Nat.card G`, for each `i : Irreps k G` define
  `m_ρ(i) := finrank k (Representation.IntertwiningMap Zᵢ ρ)` for
  finite-dimensional `ρ : Representation k G V`. The index and finite representative are those fixed by Layer 2.5;
  this Hom-rank is the intrinsic multiplicity. The general pairing identity above gives
  `characterPairing ρ.character Zᵢ.character = (m_ρ(i) : k)`.
- **Cross-universe Schur and regrouping.** For finite-dimensional `ρ`, Maschke gives semisimplicity of `k[G]` because invertible
  order supplies the nonzero-order hypothesis; finite-dimensionality of `V` gives finite generation
  of `ρ.asModule`. Apply `IsSemisimpleModule.exists_linearEquiv_fin_dfinsupp` to decompose it into
  finitely many simple submodules `Sⱼ`, which may live in a universe different from `k`. Assign each
  `Sⱼ` its unique class using Layer 2.5's arbitrary-universe class lookup. To count its maps from
  `Zᵢ`, use `IntertwiningMap.equivLinearMapAsModule` to identify intertwiners with `k[G]`-linear
  maps. `LinearMap.bijective_or_eq_zero` makes this Hom space zero when the classes differ: any
  nonzero map between simple modules is bijective and hence would identify their classes. When the
  classes agree, a chosen module equivalence identifies the Hom space with
  `Module.End k[G] Zᵢ.asModule`. This endomorphism ring is a finite-dimensional division
  `k`-algebra. Consume [SemisimpleAlgebras Layer 1](../SemisimpleAlgebras/README.md#layer-1-simple-modules-schur-and-isotypic-components)
  for the Schur collapse `D ≃ₐ[k] k`, with `D := Module.End k[G] Zᵢ.asModule`, and hence
  `finrank k D = 1`. Build the CharacterTheory adapter that packages these two cases as the
  cross-universe Hom-dimension formula.

  The regrouping target `regroup_finite_simple_summands_by_Irreps` identifies the number of summands
  in class `i` with `m_ρ(i)`, by additivity of equivariant Hom over the finite sum and the preceding
  Schur formula. It yields the primary decomposition of `ρ.asModule` as a finite direct sum with
  exactly `m_ρ(i)` copies of `Zᵢ.asModule` for each `i`.
- **Module-to-representation adapters for the primary spine.** Build these conversions:

  1. A `k[G]`-linear equivalence `ρ.asModule ≃ₗ[k[G]] σ.asModule` induces
     `Representation.Equiv ρ σ`, using `Representation.asModuleEquiv` and
     `IntertwiningMap.equivLinearMapAsModule`.
  2. A `k[G]`-linear equivalence identifies
     `(Representation.directSum Z).asModule` with the finite `Π₀ i, Zᵢ.asModule` sum used by
     `exists_linearEquiv_fin_dfinsupp`.
  3. A simple submodule of `ρ.asModule` is turned into a representation on that carrier using
     `Subrepresentation.subrepresentationSubmoduleOrderIso`.

  These adapters transport the primary module decomposition into a statement about
  `Representation.Equiv` at arbitrary native universes. Use `Rep.equivalenceModuleMonoidAlgebra`
  for the categorical mirror. To lift the finite decomposition to `FDRep`, first put its
  finite-dimensional summands into `FDRep`; then use the native `Full`/`Faithful` forgetful functor
  and derive its additivity from `PreservesFiniteColimits` before lifting the finite-sum isomorphism.
- **Multiplicity API and character expansion.** The intrinsic multiplicities obey
  `m_{ρ.prod σ}(i) = m_ρ(i) + m_σ(i)`, `m_{Zⱼ}(i) = 1` when `i = j` and `0` otherwise, and
  `finrank k V = ∑ᵢ m_ρ(i) * degree(i)`. Finite character additivity and the regrouped decomposition
  give `ρ.character = ∑ᵢ (m_ρ(i) : k) • χᵢ`. For `[CharP k p]` with `0 < p`, `p ∤ |G|`, and
  algebraically closed `k`, the character basis gives the sharp criterion
  `ρ.character = σ.character ↔ ∀ i, Nat.ModEq p (m_ρ(i)) (m_σ(i))`. Thus ordinary characters need
  not recover natural multiplicities: for the trivial group, one trivial copy and `p + 1` trivial
  copies have the same `k`-valued character and different dimensions.
- **Characteristic-zero character recognition.** If `k` is algebraically closed of characteristic
  zero, then `Nat.card G` is invertible in `k` and casts of natural multiplicities are injective. The
  multiplicity formula therefore gives
  `Nonempty (Representation.Equiv ρ σ) ↔ ρ.character = σ.character` for finite-dimensional
  representations at arbitrary carrier universes. For `V W : FDRep k G`, obtain the categorical
  recognition statement from the representation result by constructing the action isomorphism with
  `Action.mkIso`. The
  class-function basis and irreducible/class count above require algebraically closed, nonmodular `k`.
- **Primitive central idempotents.** `primitiveCentralIdempotent χ = (χ(1)/|G|) • ∑_g χ(g⁻¹) • g ∈ Z(k[G])`,
  their class-sum expansion, orthogonality `eᵢ eⱼ = δᵢⱼ eᵢ`, `∑ᵢ eᵢ = 1`, and that `eχ` is the
  Wedderburn projector onto the `χ`-block. These are the clean connective tissue between Wedderburn,
  central characters, and the table, and Layer 5 uses them directly.
- **The virtual-character lattice.** `VirtualCharacter G`, the `ℤ`-span of the irreducible characters
  inside `ClassFunction ℂ G`, with the **integer-valued** pairing on it. This is the arena for
  integrality, the Galois action, and table recognition.
- **The character table.** `characterTable G : Matrix (Irreps ℂ G) (ConjClasses G) ℂ`, entry `χᵢ(g_C)`
  for a representative (well-defined by `char_conj`); **square** (Layer 2), first column the degrees `nᵢ`,
  `∑ nᵢ² = |G|`.
- **Second (column) orthogonality**, proved directly from completeness of the class-function basis (not
  from an informal "rescaling is unitary"), carrying the class-size weights:
  `∑ᵢ χᵢ(g_C) χᵢ(g_{C'}⁻¹) = if C = C' then |G|/|C| else 0`.
- **Labeled uniqueness.** With columns indexed by the actual classes of `G` and rows by `Irreps ℂ G`, the
  table is determined **up to a permutation of rows only**. (Column permutation is meaningful only for an
  unlabeled printed table, and would have to transport all class data with it; Layers 5-6 use the labeled
  table.) Make the finite indexing adapters explicit: each row index selects its irreducible character,
  exactly one row is the trivial character, and a class-column entry is the value at any representative
  by `Representation.char_conj`. For Burnside's obstruction, specialize column orthogonality to the
  identity class and the class of `g`.

#### External tensor products and irreducibles of finite product groups

For finite groups G,H and an algebraically closed characteristic-zero field k,
construct the external tensor product on the actual carrier `V⊗[k]W`:
`(g,h)·(v⊗w)=(ρ(g)v)⊗(σ(h)w)`. Reuse native `Representation.tprod` after
pulling ρ and σ back along the two product projections. Export the pure-tensor
equation, group laws, transport of intertwiners and equivalences, and the
associativity, factor-swap, unit, dual and finite-direct-sum comparisons. Keep
this distinct from `Representation.prod`, whose carrier is a direct sum, and
from the internal tensor product of two representations of the SAME group.

Prove the trace formula `χ_(ρ⊠σ)(g,h)=χ_ρ(g)χ_σ(h)` and the factorization of
Layer0's character pairing. For irreducible ρ and σ this gives norm1 and hence
irreducibility by the existing semisimple irreducibility criterion; also prove
that two such external products are equivalent exactly when their respective
factors are equivalent. Construct the conjugacy-class equivalence
`ConjClasses (G×H) ≃ ConjClasses G × ConjClasses H` and its representative and
class-size equations. Layer2's count, together with the pairwise distinct
external irreducibles, now proves completeness. Construct the resulting
bijection `Irreps k (G×H) ≃ Irreps k G × Irreps k H`, its inverse and its
representative-equivalence equations. Every finite-dimensional irreducible of
the product, at arbitrary carrier universes, must be assigned its unique pair
by Layer2.5's class lookup; a construction of some external irreducibles alone
is not the classification.

For k=ℂ, under these actual row and class-column equivalences, prove that
Layer3's character table is the Kronecker product of the two tables. Degrees multiply, the
trivial pair gives the trivial character, and regular multiplicities are the
products of the factor degrees. Include a trivial factor and C2×C2, whose
four external one-dimensional representations give its regular decomposition.

Also construct the source's external Hom on `V→ₗ[k]W`, with
`(g,h)·f=σ(h)∘f∘ρ(g⁻¹)`. Its tensor comparison is `V*⊠W`, with the displayed
factor order, and its character is `χ_ρ(g⁻¹)χ_σ(h)`. Reuse native dual,
`linHom` and `Representation.Equiv.dualTensorHom` after the product pullbacks;
compare with `ContRepresentation.biLinHom` on finite discrete groups through
its explicit factor-order conversion. Thus this Hom is irreducible when its
two constituents are, and its apparent dual on the first factor is retained.

For G=H prove the following compatibility of Layer2's Wedderburn map; over
ℂ also compare it with the finite Peter–Weyl bimodule from
[CompactGroups6](../CompactGroups/README.md). On `k[G]`, `(a,b)` sends
`e_g` to `e_(a g b⁻¹)`; on each End(V_i) it sends T to
`ρ_i(a)Tρ_i(b⁻¹)`. The Fourier map sends `e_g` to `(ρ_i(g))_i`.
Prove its algebra-equivalence and bimodule-equivariance equations and recover
that the left regular multiplicity of V_i is dim(V_i). The target is the
finite product of endomorphism algebras with composition. If identifying
`k[G]` with functions on G by coefficients, its multiplication is the
unnormalized convolution `(f*g)(x)=Σ_y f(y)g(y⁻¹x)`, not pointwise
multiplication. For probability-Haar convolution the comparison multiplies
coefficient functions by |G|; prove that scaling and the Fourier inverse/trace
conventions. The separate left/right actions need not be algebra automorphisms.
This comparison consumes the existing Wedderburn and
compact bimodule owners, without duplicating their generic constructions.

#### Faithful tensor generation over ℂ

For every finite group `G` and actual `U : FDRep ℂ G`, define the finite set
`S_U = {χ_U(g) | g ∈ G}` and `r_U = |S_U|`. Give its membership and image API,
its description as the image of the existing character on `ConjClasses G`,
and prove `0 < r_U ≤ Nat.card (ConjClasses G)`. Prove invariance under
representation isomorphism and group isomorphism with transport of the action;
no choice of class representatives or irreducible enumeration changes this set.
Use the existing native class-function carrier and class quotient map, rather
than another quotient of representations or another character engine.

Use Mathlib's `Lagrange.basis` to define the actual polynomial

`P_U(T) = ∏_(z ∈ S_U, z ≠ χ_U(1)) (T-z)/(χ_U(1)-z)`.

Prove its degree is `r_U-1`, that it takes value one at `χ_U(1)` and zero at
all the other nodes, and the resulting pointwise identity
`P_U(χ_U(g)) = if χ_U(g)=χ_U(1) then 1 else 0`. Distinct nodes make the
denominators nonzero; a zero node causes no exception. Give the coefficient
expansion with powers `0,…,r_U-1`, including the constant term. These are
finite-polynomial statements, consumed from the native interpolation and
Vandermonde APIs with the finite-set/reindexing adapters owned here.

If the actual representation homomorphism `U.ρ` is injective, prove
`χ_U(g) = (finrank ℂ U.V : ℂ) ↔ g=1`. Consume
`TauCeti/RepresentationTheory/CharacterTable/Kernel.lean`:
`Representation.char_eq_finrank_iff` already proves the finite-order trace
criterion, and `FDRep.ker_eq_bot_iff` is its faithful-kernel form. A finite group
supplies finite order for every element. The native proof diagonalizes the
finite-order operator and uses its unit-modulus eigenvalues; do not replace
it by the false assertion that arbitrary matrices of trace `dim U` are the
identity. Thus `P_U ∘ χ_U` is the indicator of the identity element. For any
actual simple `X : FDRep ℂ G`, bilinearity in Layer 0's convention gives

`⟨P_U ∘ χ_U, χ_X⟩ = χ_X(1)/|G| = dim(X)/|G| ≠ 0`.

Own the finite coefficient/pairing interchange and its conversion to
`∑_(n<r_U) coeff(P_U,n) ⟨χ_U^n,χ_X⟩`. Consume native
`Representation.tensorPower`, its zero-fold action and `char_tensorPower`,
and the already implemented pairing-to-Hom identity, with orientation

`⟨χ_(U^⊗n),χ_X⟩ = (finrank ℂ (X ⟶ U^⊗n) : ℂ)`.

Over ℂ the order is nonzero and invertible, and a simple object has positive
dimension. If all these natural Hom-dimensions vanished, the displayed
nonzero pairing would vanish. Construct, consequently, an exponent
`n < r_U` with `0 < finrank ℂ (X ⟶ U^⊗n)`, and its weaker bound
`n < Nat.card (ConjClasses G)`. Here occurrence is in the actual tensor power,
not merely in a virtual-character expression. Use Layer 3's simple-module
lookup, Schur and regrouping API to identify this number with the actual
multiplicity. Give the nonzero-intertwiner, injective-intertwiner and direct
summand forms, and transport these results between native finite-dimensional
representations at arbitrary carrier universes and `FDRep` using the existing
finite-model/shrink and module equivalences. No irreducibility or self-duality
of `U`, and no two-dimensional or unitary-embedding input, is required.

Also give the equivalent grouped Vandermonde argument: enumerate the distinct
nodes as `z_a`, set `b_a = ∑_(g:χ_U(g)=z_a) χ_X(g⁻¹)`, and use
`∑_a b_a z_a^n=0` for `0≤n<r_U`. The native Vandermonde determinant or its
transposed finite-moment injectivity lemma forces all `b_a=0`, contradicting
the identity fibre `b_(χ_U(1))=dim X`. This is the same bilinear pairing
convention; over ℂ `χ_X(g⁻¹)=conj(χ_X(g))`, with no conjugation of `z_a`.

Keep the boundaries explicit. The zero-fold tensor power is the trivial
one-dimensional module, including `0^0=1` in its character formula. For a
trivial group `r_U=1` for every `U`, and exponent zero supplies its only simple
class. A faithful zero-dimensional `U` forces `G` trivial, has `S_U={0}` and
still satisfies the theorem at `n=0`; do not exclude it by assuming `dim U>0`.
For a nonfaithful representation the same interpolation isolates the kernel,
not the identity, and need not generate every simple: the trivial module of
`C₂` never contains its sign module in any tensor power. This subsection is
the general finite-complex supplier; McKay matrices, walks, affine root graphs
and finite `SU(2)` geometry are consumers with their own additional data.

<a id="tensor-multiplicity-generating-series"></a>
**Tensor-multiplicity generating series and positive powers.** For arbitrary
`U,X : FDRep ℂ G`, put `m_n=finrank ℂ (X ⟶ U^⊗n)` and construct the native
formal power series `F_X(z)=Σ_(n≥0)m_n z^n`. Prove, using the existing
pairing-to-Hom and tensor-character identities,

`F_X(z)=|G|⁻¹ Σ_(g∈G) χ_X(g⁻¹)/(1−χ_U(g)z)`.

Every denominator has constant coefficient1, so its inverse is a native
formal power series; no analytic convergence hypothesis enters this identity.
Group the sum by S_U, with `b_a=Σ_(g:χ_U(g)=a)χ_X(g⁻¹)`. In ℂ[z] construct
`Q(z)=∏_(a∈S_U)(1−az)` and
`N_X(z)=|G|⁻¹ Σ_(a∈S_U)b_a ∏_(b∈S_U\{a})(1−bz)`.
Prove `Q(0)=1` and the actual identity `Q F_X=N_X` after the native
polynomial-to-power-series map. Supply coefficient, constant-term, reindexing,
representation-isomorphism and group-isomorphism comparisons. For
`R(T)=∏_(a∈S_U)(T−a)=Σ_(j=0)^(r_U)c_jT^j`, prove the recurrence
`Σ_(j=0)^(r_U)c_j m_(n+j)=0` for every n≥0. A zero character value remains a
node of R and contributes the factor1 to Q; include the zero-dimensional U.

When U is faithful and d=dim U>0, the earlier kernel criterion gives
`b_d=dim X` and `χ_U(g)≠d` for g≠1. For nonzero X prove

`N_X(1/d)=(dim X/|G|) ∏_(a∈S_U\{d})(1−a/d) ≠ 0`, while `Q(1/d)=0`.

Consequently F_X cannot be a polynomial: a polynomial equality `Q F_X=N_X`
would contradict evaluation at1/d. This is the finite-denominator content of
the noncancelling identity pole. For simple X deduce that for every B there
exists n≥B with m_n>0. In particular a positive tensor power contains X.
Also prove the sharp positive-power bound `1≤n≤r_U` by replacing the earlier
identity-fibre polynomial P_U(T) with `(T/d)P_U(T)`, which has zero constant
term and degree r_U. Construct the nonzero/injective intertwiner and summand
forms as above. If all positive coefficients vanished, the constant series
would have value `m_0=dim Hom_G(X,1)`, equal to0 for a nontrivial simple X
and1 for the trivial simple. The assumption d>0 is essential: the zero
representation of the trivial group is faithful, but all its positive tensor
powers are zero.

As a worked comparison take `G=Multiplicative (ZMod 4)` with generator g,
`χ_j(g^a)=i^(ja)` for j=0,1,2,3, and `U=χ_1⊕χ_3`. Construct its diagonal
action and prove faithfulness. Its character on `1,g,g²,g³` is `(2,0,−2,0)`,
so S_U has3 elements although G has4 conjugacy classes. Construct
`U^⊗0≃χ_0`, `U≃χ_1⊕χ_3` and `U^⊗2≃χ_0^⊕2⊕χ_2^⊕2` with actual
intertwiners. Thus every irreducible occurs despite the repeated character
value. Prove that the span of the characters of all tensor powers is exactly
the three-dimensional subspace of class functions taking equal values at g
and g³. Distinguish this spanning assertion from occurrence of individual
irreducible summands. Check the exact series
`F_0=(1−2z²)/(1−4z²)`, `F_2=2z²/(1−4z²)` and
`F_1=F_3=z/(1−4z²)`, their nonnegative integral coefficients and recurrence
`m_(n+3)=4m_(n+1)`. Here m_n is the multiplicity of the indicated χ_j.
[TensorMultiplicitySeriesTargets.lean](TensorMultiplicitySeriesTargets.lean)
gives suggested statements on actual tensor powers, Hom spaces and power series.
For the finite-character-value bound, see
[Steinberg, *On the Burnside–Brauer–Steinberg theorem*](https://arxiv.org/abs/1409.7632).

### Layer 4: the arithmetic of character values

- **Diagonalizability, per arena.** *Over general `k`* (`char ∤ |G|`): `ρ g` annihilates the squarefree
  `X^d - 1` (`d = orderOf g ∣ e`), so it is semisimple with eigenvalues among the `d`-th roots of unity
  *in `k`* (`isSemisimple_of_squarefree_aeval_eq_zero`). *Over `ℂ`*: those eigenvalues are complex `e`-th
  roots of unity, so `χ(g) = ∑ (eigenvalues)` is a sum of `e`-th roots of unity.
- **Values are cyclotomic integers.** Over `ℂ`, exhibit the finite-order eigenvalues as `e`-th roots
  and lift their sum into `K = CyclotomicField e ℚ`; fix an embedding `ι : K →+* ℂ` and require it to recover `χ(g)`.
  Mathlib already proves `Representation.isIntegral_character` for the complex character value. The
  additional targets are the cyclotomic lift, its integrality/membership in the cyclotomic integer ring,
  and the embedding-transfer adapter used in the Burnside argument. Do **not** state a
  cyclotomic-integrality theorem over an arbitrary `k`.
- **Central characters, integrally.** `centralCharacter χ : Z(k[G]) → k`, the scalar by which the center
  acts on the simple module (Schur; `Intertwining.centralMul`/`equivAlgEnd`), an algebra homomorphism,
  with `ωᵪ(Kⱼ) = |Cⱼ| · χ(gⱼ) / χ(1)`. Its value on a class sum is an **algebraic integer**: `classSum C`
  is integral over `ℤ` in `integralClassCenter G` (Layer 1), and an algebra homomorphism carries integral
  elements to integral elements, so `ωᵪ(Kⱼ) ∈ 𝓞`.
- **Degree divides the order.** From row orthogonality `|G| = ∑ⱼ |Cⱼ| χ(gⱼ) χ(gⱼ⁻¹)` and
  `ωᵪ(Kⱼ) = |Cⱼ|χ(gⱼ)/χ(1)`, the sum `|G|/χ(1) = ∑ⱼ ωᵪ(Kⱼ) χ(gⱼ⁻¹)` (with `Kⱼ` the class sum and `gⱼ` a
  representative) is an algebraic integer; it is Galois-invariant, hence rational, hence (`isIntegral_iff`
  over `ℤ`) an integer, so **`χ(1) ∣ |G|`**.
- **The Galois action.** `Gal(ℚ(ζ_e)/ℚ) ≃ (ZMod e)ˣ` (`autEquivPow`) acts on `VirtualCharacter G` by
  `(σ_k · χ)(g) = χ(g^k)`, permuting the irreducibles; the fixed field of `χ`'s stabilizer is its field
  of values. That ordinary character values lie in `ℚ(ζ_e)` and Galois acts by these power maps is
  **mandatory** for Layer 6's lift; it is proved here.
- **Application, off the critical path — Brauer and Burnside.** `ℚ(ζ_e)` is a **splitting field**
  (Brauer): every irreducible `ℂ`-representation is realizable over `ℚ(ζ_e)`. **Burnside's `pᵃqᵇ`
  theorem** says every finite group of order `pᵃqᵇ`, for primes `p,q` and `a,b ≥ 0`, is solvable. This
  application is not a prerequisite for the algorithm and does not alter the Layer 5–6 dependency chain.

  Its character-theoretic proof has the following explicit route.

  1. **Coprime class-size alternative.** For an ordinary irreducible complex character `χ` of a finite
     group and `C = gᴳ` with `gcd(|C|, χ(1)) = 1`, prove that either `χ(g) = 0` or the irreducible
     representation acts by a scalar on `g` (equivalently, `|χ(g)| = χ(1)`). This alternative includes
     trivial and linear characters, which have scalar action. The central-character value
     `|C|χ(g)/χ(1)` is integral by the class-sum integrality target above; `χ(g)` is already integral by
     Mathlib's `Representation.isIntegral_character`. Bézout for `|C|` and `χ(1)` makes `χ(g)/χ(1)`
     integral in `ℂ`.

     State the field bridge explicitly. Put `e = Monoid.exponent G`, `K = CyclotomicField e ℚ`,
     and fix any `ι : K →+* ℂ`, available from the native nonempty embedding instance for
     number fields. No canonical embedding of this abstract splitting field is assumed.
     Build the root-lifting adapter: choose a primitive e-th root in K, map it through the
     injective ι, and use `IsPrimitiveRoot.map_of_injective` and `eq_pow_of_pow_eq_one` to
     show every complex e-th root lies in the image. The character-value lift target gives
     a multiset μ of exactly `χ(1)` elements of K, each with `ξ^e=1`, such that
     `χ_K(g)=μ.sum` and `ι (χ_K(g))=χ(g)`. This single decomposition lives in K before any
     other embedding is applied.

     Let `α_K := χ_K(g)/(χ(1):K)`. Its image is the already integral complex quotient.
     Transfer that integrality to K with `isIntegral_algHom_iff` for the injective
     `ι.toIntAlgHom`; no second Bézout argument or separate central-character lift is needed.
     For every field embedding `φ : K →+* ℂ`, apply φ to the same root multiset μ.
     Each image has norm one, so `‖φ (χ_K(g))‖ ≤ χ(1)` and `‖φ α_K‖ ≤ 1`.
     Apply `NumberField.Embeddings.pow_eq_one_of_norm_le_one` when `α_K≠0`.
     It is a root of unity, so `|χ(g)|=χ(1)`. Own the finite-sum equality adapter:
     equality in the triangle inequality for unit complex numbers forces all eigenvalues
     equal. With `d=orderOf g`, the endomorphism `ρ g` annihilates the separable `X^d−1`;
     consume `Module.End.isSemisimple_of_squarefree_aeval_eq_zero` and build the adapter that
     a semisimple endomorphism over ℂ with one eigenvalue is scalar.
     `Monoid.neZero_exponent_of_finite` supplies `NeZero e` for the primitive-root and norm
     arguments; `CyclotomicField` has its native number-field instance independently of that
     nonzero-exponent hypothesis. The separate Galois power-map target remains required for
     the algorithm's character-lattice action. Layer 6 also owns compatibility of a chosen
     primitive-root embedding with its fixed exact cyclotomic-integer embedding.

  2. **Prime-power class obstruction for nonabelian simple groups.** For a finite nonabelian simple group
     `S`, prove that no `g ≠ 1` has a conjugacy class of size `pʳ` with `p` prime and `r > 0`. The
     Layer 3 row/class adapters identify table entries with `χ(g)` for the chosen representative. Use
     column orthogonality with the class of `g` first and the identity class second to obtain
     `∑_{χ ∈ Irr(S)} χ(g) * χ(1) = 0`. The inverse of the identity is the identity, so this
     specialization needs no conjugation of character values. If every nontrivial irreducible
     character with nonzero value at `g` had degree divisible by `p`, isolate the unique trivial
     row to get `1 + p * β = 0`, where `β` is a finite sum of integer multiples of character
     values and is therefore integral over `ℤ` in `ℂ`. Hence `β = -1/p`. Apply
     `IsIntegral.ratCast_iff` and `IsIntegrallyClosed.algebraMap_eq_of_integral` with `ℤ` and
     `ℚ` (or consume `IsIntegral.exists_int_iff_exists_rat`); this would make `-1/p` an integer,
     a contradiction since p is prime. Thus some
     nontrivial `χ` has `χ(g) ≠ 0` and `p ∤ χ(1)`. Here nontrivial means its row index differs
     from the unique trivial row. Use `Nat.Prime.coprime_iff_not_dvd` and `Nat.Coprime.pow_left`
     to get `Coprime (p^r) χ(1)`; the coprime alternative forces scalar action of `g`.
     For faithfulness, its kernel is normal; simplicity makes that kernel bottom or top, and the top
     case is excluded by the owned adapter that an irreducible trivial-action representation
     has dimension one and is the trivial row. Scalarity and injectivity of the representation
     then put `g` in the center. The
     center is normal, so `IsSimpleGroup.eq_bot_or_eq_top_of_normal` makes it bottom or top;
     `Subgroup.center_eq_top_iff` identifies the latter with commutativity, excluded here. Make the
     uses of column orthogonality and algebraic-integer divisibility explicit as targets alongside
     these kernel and center arguments; faithfulness and trivial center then give `g = 1`,
     contradicting the chosen `g ≠ 1`.

  3. **Solvability by induction on group order.** Use strong induction on `Nat.card G`,
     generalizing over the finite group (at an arbitrary universe) and both exponents a,b.
     The trivial group is the base case; the remaining branches assume nontriviality.
     First handle the prime-power case by consuming Mathlib's `IsPGroup.isNilpotent` for finite
     `p`-groups and the instance `IsNilpotent.to_isSolvable`; do not duplicate the center-induction
     proof. For a simple group, the abelian case is solvable by
     `Group.isSolvable_of_comm`. In the remaining simple nonabelian case, `p ≠ q` and both exponents
     are positive: otherwise the order is a prime power and the group is solvable.
     Choose a Sylow `p`-subgroup `P` of `S`; it is
     nontrivial, and its center is nontrivial by `IsPGroup.center_nontrivial`. Choose `1 ≠ x ∈ Z(P)`.
     Since `P ≤ C_S(x)`, the index `[S : C_S(x)]` divides `[S : P] = q^b`. Identify this centralizer
     index with the cardinality of the actual conjugacy-class carrier: Mathlib's
     `Subgroup.index_centralizer_eq_ncard` states the cardinality of `conjugatesOf x`, so target the
     equivalence with `ConjClasses.carrier`. The class size is greater than one since `Z(S) = ⊥` for a
     nonabelian simple group. This contradicts the prime-power class obstruction. Make the arithmetic
     explicit: `Sylow.card_eq_multiplicity` gives Sylow orders and indices; for distinct primes `p,q`,
     a divisor of `p^a*q^b` has form `p^i*q^j` with `i ≤ a` and `j ≤ b`. The exponent-zero and
     one-prime cases are handled by
     the prime-power result. For a general `pᵃqᵇ`-group, induct on its order: if it is not simple,
     choose a nontrivial proper normal subgroup
     `N`; both `N` and `G/N` have smaller order and no new prime divisors. Combine their solvability
     using `Group.isSolvable_iff_subgroup_quotient`. Include the finite-order subgroup/quotient
     divisibility adapters and the application of native prime-power solvability in this development.

## B. The class algebra and the Dixon-Schneider specification

### Layer 5: the Dixon-Schneider characterization (the specification)

This layer proves that the structure constants **plus** Layer 4's arithmetic **determine** the table, and
packages the checker. It is stated over `ℂ`; deliverable C computes it.

- **The coordinate identity.** From multiplicativity of `ωᵪ : Z(k[G]) → k` and
  `KᵢKⱼ = ∑ₖ aᵢⱼᵏ Kₖ`: `ωᵪ(Kᵢ) ωᵪ(Kⱼ) = ∑ₖ aᵢⱼᵏ ωᵪ(Kₖ)`. Prove this first; it is the algebraic fact the
  eigenvector theorem rests on.
- **Class-multiplication matrices, with a pinned convention.** `classMultMatrix i`, `(Mᵢ)ⱼₖ = aᵢₖⱼ`
  (transpose convention fixed as API, not prose), acting on **row vectors from the left** (`ᵥ*`,
  `Matrix.vecMul`). The `{Mᵢ}` commute (center commutative). Then, from the coordinate identity and
  commutativity of the class algebra, the row vector `vᵪ = (ωᵪ(K₁), …, ωᵪ(Kᵣ))` satisfies
  `vᵪ ᵥ* Mᵢ = ωᵪ(Kᵢ) vᵪ` — the **rows** of `Ω` are common **left** eigenvectors — proved as a theorem
  *after* the coordinate identity, with indices explicit — and the `{vᵪ}` are a basis of common left
  eigenvectors. Conversely the common left eigenvectors of `{Mᵢ}` are exactly the `{vᵪ}` up to scale
  (`normalized_eigenrow_iff_algHom`). Do not mix in the column/`*ᵥ` convention: that would require
  the transposed matrix `(Mᵢ)ⱼₖ = aᵢⱼₖ` instead; either pairing of (matrix, action side) is valid,
  but exactly one is pinned here.
- **Normalization and degree recovery.** Normalize each eigenrow by `ωᵪ(K₁) = 1` (the identity class).
  Then `dᵪ² = |G| / ∑ⱼ |Cⱼ|⁻¹ ωᵪ(Kⱼ) ωᵪ(Kⱼ⁻¹)` recovers only the *square* of the degree; the checker
  additionally **requires** `dᵪ ∈ ℕ`, `dᵪ > 0`, `dᵪ ∣ |G|`, and `∑ᵪ dᵪ² = |G|`, which pin the degree
  and hence, via `χ(gⱼ) = dᵪ · ωᵪ(Kⱼ) / |Cⱼ|`, the ordinary character table `X` from the central table
  `Ω`. Provide both `Ω` and `X` and the conversion lemmas.
- **The specification and the checker.** `IsCharacterTableSpec G X : Prop` over `ℂ`: rows are orthonormal
  class functions (`characterPairing`) of the right count, with the central-character/eigenvector
  relation to the `{Mᵢ}` and the degree positivity/integrality above. **`characterTable G` satisfies it**,
  and **labeled uniqueness**: any `X'` satisfying it equals `characterTable G` up to a permutation of
  rows. This is what makes "the algorithm produced *a* table" mean "the algorithm produced *the* table".

## C. The executable certified algorithm with exact cyclotomic output

### Layer 6: the executable Burnside–Dixon–Schneider algorithm

Consume the existing `TauCeti.Cyclotomic`, `TauCeti.ClassData`,
`TauCeti.DixonPrimeData` and
`TauCeti.ClassData.dixonCyclotomicCharacterTable?` objects. The native solver
returns an `Option` of exact central table `omega`, ordinary table `table`
and positive natural degrees. Its existing exact checker and soundness theorem
apply to every successful result. This layer supplies the remaining complete
reconstruction theorem with an explicit sufficient prime threshold; it does
not replace these objects or weaken a successful output's certificate.

1. **Exact ring, fixed generator and coordinates.** Use native
   `TauCeti.Cyclotomic e`, its computable ring operations, decidable equality,
   `zeta e`, `coeff`, `ofCoeffList`, `equivAdjoinRoot` and `complexEmbedding`.
   Its stored list is descending; `coeff x k` reads the ascending power
   coordinate. For `e>0`, the distinguished complex image of `zeta e` is
   `complexRoot e`, a primitive root, and the embedding is injective.
   Keep the comparison with Mathlib `CyclotomicRing e ℤ ℚ` as an explicit
   generator-compatible map, rather than a second unconstrained exact carrier.
   Native `evalRingHom` evaluates at any actual root of the mapped cyclotomic
   polynomial. Its specialization `reduceRingHom` at a primitive root supplies
   the solver's reductions. No unital evaluation map at an arbitrary nonroot
   is asserted. The primitive-root-to-polynomial-root and generator evaluation
   lemmas are existing native consumers.

2. **Executable input and the left-row convention.** Consume `ClassData G`'s
   actual finite class enumeration, representatives, class sizes, structure
   constants and `equivConjClasses`. Keep the conductor `e` as an explicit
   natural with `he : e = Monoid.exponent G` on the executable path: the
   abstract `Monoid.exponent` is not computed. Native `kernelBasis` returns
   the right kernel. With Layer5's convention
   `(M_i)_(j,k)=a_(i,k,j)`, a left eigenspace is the right kernel of
   `M_iᵀ−λI`, never of `M_i−λI`. Use the existing
   `ClassData.centralCharacterSearch`, which transposes the family before its
   joint eigenvalue search, and its normalized-eigenrow/algebra-homomorphism
   equivalence. Use the native finite-field and split-center results for
   native good Dixon primes; do not assume no-merging as an extra oracle.

3. **A computable canonical bound.** For each `e>0`, define
   `A_e=max(1,max_(j<e,k<φ(e)) |coeff(zeta(e)^j,k)|)` using the native finite
   coordinate computations. Define `B_G=|G| A_e`. Own finite-maximum and
   coordinate-additivity adapters. For any finite-dimensional complex
   representation and `g∈G`, exhibit the actual multiplicities `m_j≥0` of
   the eigenvalues `complexRoot(e)^j`, with `Σm_j=d`, and define
   `x_g=Σm_j zeta(e)^j` in the native ring. Prove its complex image is `χ(g)`
   and `|coeff(x_g,k)|≤d A_e`. This includes `d=0` without introducing a
   central character for the zero representation.

4. **Construct exact central values before bounding them.** For a simple
   representation, `d>0`. Consume native
   `Representation.centralCharacter_classSumCenter_mul_character_one` and
   `isIntegral_centralCharacter_classSumCenter`. Pin
   `K=CyclotomicField e ℚ` and an embedding `ι:K→+*ℂ` carrying its chosen
   primitive root to the same `complexRoot e`. Prove all complex e-th roots
   lift through this `ι`, and hence `χ(g)` and `Ω_C=|C|χ(g)/d` lie in its
   image. Transfer complex integrality of `Ω_C` back to K along the injective
   embedding. Consume Mathlib
   `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton`,
   `cyclotomicRing_isIntegralClosure` and
   `IsPrimitiveRoot.adjoinEquivRingOfIntegers`/`integralPowerBasis`, with
   `integralPowerBasis_gen` and `integralPowerBasis_dim`. Build the explicit
   native quotient-to-adjoin-to-ring-of-integers comparison on the same
   generator. Prove its ordered integral powers agree with the native
   coordinates of length `φ(e)`, not an arbitrary integral basis. This
   constructs an actual `w_C : TauCeti.Cyclotomic e` with image `Ω_C`.
   These comparisons belong to the correctness proof, outside the executable
   prime/row/lift computation.

   Injectivity of the complex embedding now gives the division-free equality
   `d*w_C=|C|*x_g` in the native exact ring. Apply the canonical coordinates,
   using native `coeffs_intCast_mul`, to obtain `d*b_k=|C|*a_k` in ℤ.
   Taking absolute values and cancelling the positive integer d proves
   `|b_k|≤|C|A_e≤|G|A_e=B_G`. No claim `d∣|C|`, integral-ring division or
   bound inferred just from complex absolute values is used.

5. **Stronger primes, with the native predicate unchanged.** Retain native
   `IsGoodDixonPrime` and `DixonPrimeData`, including its actual primitive
   modular root. Their older inequality `2⌊√|G|⌋<p` does not bound every
   canonical central coefficient. For complete reconstruction by this route
   additionally require `p>2B_G`. The S₄ trivial row has a central value8 at
   its size8 class and excludes the old p13 window; distinct modular rows
   alone do not repair that problem. Own `exists_strongDixonPrime` using
   native `Nat.exists_prime_gt_modEq_one` above
   `max(|G|,2B_G)` and the nonzero finite-group exponent. This also gives
   `p∤|G|`, splitting and the weaker native threshold. Native
   `TauCeti.exists_isGoodDixonPrime` is the existing ordinary-prime existence
   theorem; no new Dirichlet theory is needed. Use the native finite
   candidate enumeration and primitive-root search to reach such a prime
   with a finite budget. `e=1` gives `A_1=1`, `B_G=1` for the trivial group,
   and `p>2` suffices. There is no e0 finite-group case.

6. **Exact certificate, all conjugates and row alignment.** Construct the
   exact ordinary and central tables from the actual irreducible rows and
   the exact values above. Use native ClassData numbering, not a new
   irreducible quotient. Injectivity of the embedding transfers central
   normalization, multiplicativity, orthogonality, degree positivity and
   divisibility, the sum of degree squares and `d_i omega_ij=|C_j| table_ij`
   to `ClassData.IsCyclotomicCharacterTableSpec`. Its native conjugation
   comparison must carry complex conjugation correctly. State the exact
   coordinate bound for every central entry of this certificate.

   The native solver enumerates permutations at every primitive conjugate
   root, fixing its first numbering, and every positive degree vector
   satisfying the degree constraints. Its existing certificate reduction
   theorem proves injectivity of the reduced rows at every conjugate root;
   its completeness theorem constructs the compatible permutations. Consume
   `ClassData.isSome_dixonCyclotomicCharacterTable_of_spec`, including that
   proof, rather than assuming either a Galois row alignment or no-merging.
   The entire tuple is indexed by `Fin φ(e)` through native
   `primitiveExponent`/`conjugateRoot` and `conjugateResidues`.
   One reduction does not determine an entry; Frobenius is trivial when
   `p≡1 mod e` and supplies no missing conjugates. The derived inequality
   `2|coeff(w_C,k)|<p` supplies exactly the hypothesis of native
   `Cyclotomic.lift_eq_of_conjugateResidues_eq`.

   **Executable refinement before the named evaluations.** Retain the native
   solver as the exhaustive reference: its row-list adapter enumerates the
   ambient `p^r` functions, its
   alignment list enumerates `r^(r φ(e))` functions before filtering, and its
   degree search forms whole vectors. Own `dixonPowerAligned?` and its
   prime-budget wrapper in this roadmap, using the SAME `ClassData`, native
   transposed `centralCharacterSearch`, `Cyclotomic.lift`, exact output data
   and `cyclotomicCharacterTableChecker`. The refined path supplies the
   executable computation for the named examples.

   - **Enumerate only the actual search output.** Compute
     `S=d.centralCharacterSearch (F:=ZMod p)` once. Encode a row v by
     `code(v)=Σ_(k<r) (v_k).val p^k`, map this code over S, sort that finite
     set of NATURAL codes increasingly and decode its base-p digits. Prove
     decoding after encoding is identity (`0≤v_k.val<p`), injectivity of
     the code, no duplicates, exact membership S and length r at a native
     good prime. The encoding/sorting traverses S itself; it must not
     construct `FinEnum (Fin r→ZMod p)` or scan all possible codes. This
     fixes deterministic row order without a second eigenspace or Gaussian
     engine. Reuse the native joint-eigenvalue search and its actual finite
     output; reordering only supplies a new finite-index adapter.

   - **Class powers give every conjugate slice.** Define
     `P_b(k)=d.index((d.rep k)^b)` by the actual numbered class lookup.
     For `gcd(b,e)=1`, construct its inverse power permutation, prove it is
     representative-independent, fixes the identity class and preserves
     class sizes. Powering is a conjugation-equivariant bijection on G,
     with inverse exponent modulo e, so it restricts to bijections of the
     corresponding class carriers. For an actual irreducible χ, Layer4's
     Galois formula and the unchanged positive degree give
     `Ω_χ(P_b(k))=σ_b(Ω_χ(k))`: this follows from
     `Ω_χ(C)=|C|χ(C)/χ(1)`, since both |C| and χ(1) are fixed.
     Transfer this identity to the SAME exact native cyclotomic elements
     through the injective generator-compatible embedding; prove the
     corresponding reduction identity, not merely its complex formula.
     For a native exact certificate derive the same identity using its
     complex-table comparison and labeled uniqueness, rather than adding
     an unproved covariance field to the executable input.

     Pin `a_j=Cyclotomic.primitiveExponent e j` and first index0. Prove
     from the actual increasing `primitiveExponents` list that `a_0=1`
     when e>1. In general compute the unique residue b_j with
     `a_0 b_j≡a_j (mod e)` by a finite modular-inverse calculation (or the
     specified length-e scalar scan); prove success and b_j's coprimality.
     Do NOT silently assume an arbitrary chosen first exponent is1.
     For e=1 the list is `[0]`, φ(e)=1 and the primitive root is1; use
     b_0=0 and the trivial-group/class branch explicitly. There is no
     finite-group e=0 case. If v is one searched row viewed as reduction
     at `α^a_0`, set `R_v(k,j)=v(P_(b_j)(k))`. Prove
     `R_v(k,j)=reduce(p,α^a_j,Ω_χ(k))` for the corresponding χ.
     Thus lift each entry once using `Cyclotomic.lift e α R_v(k)`.
     This is an r-by-r-by-φ(e) residue array, not a materialized tuple of
     row permutations; even true-permutation enumeration is not the
     executable replacement. Frobenius is still trivial and is not used
     to manufacture missing conjugates.

   - **Recover degrees separately, exactly.** For one lifted row ω, put
     `inv(k)=d.index((d.rep k)⁻¹)`, `n=|G|`, `s_k=|C_k|`, and compute
     `T(ω)=Σ_k (n/s_k) ω_k ω_(inv(k))` in the native exact ring.
     Own the class-size divisibility proof, so `n/s_k` is exact natural
     division; no rational or cyclotomic inverse is hidden here. Layer5's
     degree-square identity gives `T(Ω_χ)=n²/χ(1)²=(n/χ(1))²`.
     Search ONLY positive divisors m of n with `m≤⌊√n⌋`, testing the
     exact ring equation `m² T(ω)=n²`. For a true row its degree belongs
     to this list by the degree sum and divisibility theorems. It is the
     UNIQUE positive solution: T is nonzero by that equation and the
     characteristic-zero embedding, so cancellation gives equality of
     positive integer squares. No floating approximation, chosen square
     root oracle, global degree tuple, or product of per-row degree lists
     is permitted. A missing solution rejects this prime. Once degrees
     are recovered, compute ordinary entries by coefficientwise exact
     division of `degree(i)*ω_ik` by s_k, using the native solver's quotient
     convention; its helper is private, so own the small exposed adapter
     and equality proof. The final checker verifies the division-free
     identities, positivity/divisibility, degree sum and all table equations.

   - **Assemble, compare and prove bounded completeness.** Process the
     sorted r rows once, collect the r independent `Option` degree results
     with short-circuit failure, build ONE complete candidate, and return
     it only if the actual native checker returns true. Soundness at every
     returned result is exactly its native certificate and complex soundness.
     At any strong prime, native certificate reduction/no-merging gives a
     bijection between S and the actual irreducible rows at the first root.
     The power-map identity supplies all conjugates in that SAME numbering,
     the bound `p>2B_G` makes every lift exact, and per-row degree uniqueness
     and exact division give the full certificate. Prove this more generally
     for any bounded exact certificate: the refined output equals it up to
     one row permutation, simultaneously for omega, ordinary table and degrees.
     Retain native exhaustive completeness as a reference theorem and compare
     any certified outputs using labeled uniqueness and injectivity of the
     exact embedding. No equality of the two algorithms' first `Option`
     answers or arbitrary row orders at weak primes is claimed.

     Reuse native prime candidates in increasing order, filter out
     primes not exceeding the DERIVED `2B_G`, and call only the refined
     solver. Prove unconditional successful-output soundness, strong-prime
     completeness, finite-budget success and prefix stability of the answer.
     For given S the extra work uses sorting r codes, at most eφ(e) scalar
     ratio tests, r²φ(e) distinct residue coordinates, r² native lifts and at most
     r⌊√n⌋ scalar degree tests; these are construction counts, not a
     polynomial-runtime claim about the underlying native eigenvalue search
     or a benchmark. Cache the class powers, class sizes, inverse-class map
     and ratios once. Any further native arithmetic optimization preserves
     the same proof/checker interfaces.

7. **Totality, conversion and acceptance.** From the actual bounded exact
   certificate prove the native solver is `isSome` at every strong prime.
   Native exact division computes the ordinary table from `degree*omega`;
   the division-free certificate proves every coordinate division exact.
   Consume native `ClassData.complexTableOfCyclotomic`, its
   `complexTableOfCyclotomic_apply_classOf` reindexing equation and
   `IsCyclotomicCharacterTableSpec.isCharacterTableSpec`. Apply native
   `characterTable_unique_rows` for equality to the actual ordinary table up
   to rows only. Finally prove that some finite prime-search budget makes
   native `ClassData.characterTableDixon?` succeed, using its candidate
   membership/success lemmas and the stronger-prime existence above. This
   is a complete termination target, not merely success-conditional
   soundness or a bounded-coefficient assumption supplied by a caller.
   Keep the staged rational, quadratic/cubic and general exact examples
   below. For DihedralGroup4 (e=4), C₃ (e=3), A₄ (e=6), S₄ (e=12) and A₅
   (e=30), construct executable native ClassData with its actual exponent
   equality and a concrete successful prime budget, and `#eval` the refined
   `characterTablePowerSearch?` to its complete solver-computed exact output.
   Retain all five evaluations as acceptance targets, including the irrational
   A₅ rows. Record full degrees/omega/ordinary entries in the fixed class order,
   then prove the actual checker result and compare with the labeled table up
   to rows. Supplying a known table to the checker, an abstract `isSome` proof,
   or running only the exhaustive reference does not discharge this computation.
   C₂, S₃ and Q₈ and all structural/spring examples below remain in scope.
   All new theorem and refinement targets are distinct from the already
   defined native arithmetic, search, checker and conditional soundness.

## D. Structural theorems and worked families

The three layers here are classical high points that the ordinary character theory of Deliverable A
unlocks. They are applications, not steps on the Dixon-Schneider critical path, and each is a self-contained
target: the Frobenius-Schur trichotomy sharpens the indicator that already distinguishes the `D₄`/`Q₈`
pair; Frobenius's theorem is the companion to Burnside's `pᵃqᵇ` capstone and the signature use of induced
characters; and the character table of `GL₂(𝔽_q)` is the canonical worked family combining induction (the
[induction-restriction roadmap](../InductionRestriction/README.md)) with character theory. Layer 7 is
stated over `ℂ` (or an algebraically closed field of characteristic `0`); Layers 8 and 9 need finite `G`.

### Layer 7: the Frobenius-Schur indicator and real/quaternionic type

Layer 4 pins the indicator `ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` as a `def` and uses it to separate `D₄` from `Q₈`.
This layer proves what it measures.

- **The indicator on the module spine.** `frobeniusSchurIndicatorRep ρ = |G|⁻¹ ∑_g ρ.character (g²)` for
  `ρ : Representation ℂ G V`, agreeing with the `FDRep`-level native `FDRep.frobeniusSchurIndicator` under
  `Rep.equivalenceModuleMonoidAlgebra`. This is the computation-friendly form; state both and their equality.
- **The symmetric and exterior squares.** Consume the native symmetric/exterior-square
  representation and Frobenius–Schur modules and their character formulas `χ_{Sym²}(g) = ½(χ(g)² + χ(g²))` and
  `χ_{Λ²}(g) = ½(χ(g)² - χ(g²))`. From them, the invariant forms follow.
- **Invariant bilinear forms.** `IsInvariantForm ρ B` for `B : LinearMap.BilinForm ℂ V`:
  `B (ρ g x) (ρ g y) = B x y`. The invariant forms are the `G`-invariants of `V* ⊗ V*`
  (`Representation.dual`, `Representation.invariants`, both consumed from Mathlib), splitting as symmetric
  (`LinearMap.BilinForm.IsSymm`, orthogonal type) plus alternating (`LinearMap.BilinForm.IsAlt`, symplectic
  type); their dimensions are the multiplicities `⟨χ_{Sym²}, 1⟩` and `⟨χ_{Λ²}, 1⟩` built above, and for
  irreducible `ρ` the total `⟨χ², 1⟩` is `0` or `1`.
- **The trichotomy.** For irreducible `ρ` over `ℂ`, `ν₂(χ) ∈ {+1, 0, -1}`: it is `+1` iff `ρ` carries a
  nonzero invariant symmetric nondegenerate form (**orthogonal**), `-1` iff a nonzero invariant alternating
  nondegenerate form (**quaternionic/symplectic**), and `0` iff `χ ≠ χ̄` (**complex**, no nonzero invariant
  form). Prove each equivalence (`frobeniusSchurIndicatorRep_eq_one_iff`,
  `frobeniusSchurIndicatorRep_eq_neg_one_iff`).
- **Realizability over `ℝ` (a separate, stronger target).** The symmetric invariant complex form of the
  `+1` case is *not itself* a real representation: realizing `ρ` over `ℝ` means constructing a
  `Representation ℝ G W` whose scalar extension to `ℂ` recovers `ρ` (typically via a compatible Hermitian
  form / anti-linear equivariant involution). Consume the native `Representation.IsRealForm` and pinned finite-carrier
  `IsRealizableOverReal` predicates, and the theorem `frobeniusSchurIndicatorRep_eq_one_realizable` as their own target,
  not a corollary of the form equivalence.
- **The involution-counting formula.** `#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`, the **degree-weighted** signed sum
  over the irreducible characters (`card_sq_eq_sum_frobeniusSchur`); at `x = 1`,
  `#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)`, weighted by the degrees `χ(1)`. This is distinct from the **unweighted**
  count `∑_χ ν₂(χ) = #{orthogonal} − #{quaternionic}`; do not conflate the two.
- **Real characters and real classes.** `IsRealClass C`, a class with `g ∼ g⁻¹` (via `IsConj g g⁻¹`); the
  number of **real-valued** irreducible characters (rows of `characterTable` fixed by `starRingEnd ℂ`)
  equals the number of real conjugacy classes. Once the indicator is available, the real-valued characters
  split into orthogonal (`ν₂ = +1`) and quaternionic (`ν₂ = -1`), and the unweighted difference
  `∑_χ ν₂(χ)` counts orthogonal minus quaternionic irreducibles.
- **The categorical mirror.** This is the finite-group form of the indicator whose pivotal/spherical
  categorical version lives in the [pivotal/spherical roadmap](../../PivotalSpherical/README.md); the two
  agree on `FDRep G` with its standard pivotal structure, and this layer is the arithmetic side of that
  correspondence.

### Layer 8: Frobenius groups and Frobenius's theorem

The character-theoretic companion to Burnside's `pᵃqᵇ` capstone (Layer 4) and the signature application of
induced characters. This roadmap proves the standard character-theoretic route, via T.I. sets and
exceptional characters.

- **The Frobenius complement.** `IsFrobeniusComplement H` for `H : Subgroup G`: `H` proper and nontrivial,
  and a **trivial-intersection (T.I.) subgroup**, meeting each distinct conjugate trivially,
  `H ⊓ (g H g⁻¹) = ⊥` for `g ∉ H` (equivalently `H` malnormal). Then `G` is a **Frobenius group** with
  complement `H`.
- **The Frobenius kernel.** `frobeniusKernel H = {1} ∪ (G ∖ ⋃_g (g H g⁻¹))`, the identity together with the
  elements lying in no conjugate of `H`; a set of size `|G : H|`. That it is a **subgroup** is not
  elementary and is the content of the theorem.
- **Frobenius's theorem.** The kernel is bundled as `frobeniusKernelSubgroup H hH : Subgroup G` (with
  `coe_frobeniusKernelSubgroup` its carrier), it is **normal** (`frobeniusKernelSubgroup_normal`), and it is
  a **complement** to `H` (`frobeniusKernel_isComplement'`), so `G = N ⋊ H` (`Subgroup.IsComplement'`,
  `SemidirectProduct`). Working with the bundled subgroup rather than an existential-plus-carrier-equality
  keeps the downstream API clean.
- **The T.I.-set machinery, stated precisely.** Take `S = H# := (H : Set G) \ {1}`, the nonidentity part of
  `H` (a union of nonidentity `H`-classes); `IsTISet S H` records that the distinct `G`-conjugates of `S`
  are disjoint and `S` is `H`-normalized. The load-bearing lemma (`isometry_ind_of_isTISet`) is that a class
  function on `H` **supported on `S`** (vanishing outside `H#`), extended by zero and induced to `G` via
  `Representation.ind` and the induced-character formula of the
  [induction-restriction roadmap](../InductionRestriction/README.md), **preserves the norm**, not the
  tautology "a function vanishing off `H` induces isometrically".
- **Degree correction and the norm-two step.** A raw difference `χ_i−χ_j`
  vanishes at the identity only if the two degrees agree. Apply the T.I.
  supported-function isometry to such raw differences only under this actual
  equality. For arbitrary degrees consume native `ClassFunction.indExtend H φ`,
  defined by `Ind_H^G(φ−φ(1)1_H)+φ(1)1_G`, its restriction/degree identities and
  `characterPairing_indExtend_indExtend`. The degree-corrected extension preserves
  the pairing; it does not make an arbitrary virtual character have norm2.
  Compute the norm2 of a difference of distinct irreducible characters separately
  by row orthogonality, and only then transport it through that isometry. Keep
  the coherent-sign/exceptional correspondence and subgroup support construction
  below as separate milestones.
- **The exceptional-character correspondence (its own milestones).** Assembling `N` is not immediate from
  norm-`2` inductions. Split it into: (i) the T.I. induction isometry above; (ii) the **exceptional-character
  bijection** matching a subset of `Irr H` with a subset of `Irr G`, with **coherent sign choices**;
  (iii) from the coherent family, the construction of the class function / idempotent cutting out `N`; and
  (iv) that its support is a normal subgroup. Only (iv) is the final "kernel is a subgroup" statement.
- **Consequences and instances.** `|H| ∣ |N| - 1`, and `N` is nilpotent (Thompson; a downstream target,
  not proved here). The kernel-and-complement structure is the abstract form of the affine groups
  `𝔽_q ⋊ 𝔽_q^×` and the odd dihedral groups `D_n = C_n ⋊ C₂`.

### Layer 9: the representation theory of GL₂(𝔽_q)

Over `𝔽_q` construct every irreducible complex representation of `GL₂(𝔽_q) = GL (Fin 2) F` and assemble its
character table. The cuspidal series needs a genuine degree-`2` extension `E/F` (Frobenius `x ↦ x^q`, the
norm, the non-split torus), which is *not* recoverable from `[Field F] [Fintype F]` and `Fintype.card F`
alone; so state the family either over `F = GaloisField p n` with its canonical quadratic extension, or over
`[Field F] [Fintype F]` **together with a supplied degree-`2` extension** `[Field E] [Fintype E]
[Algebra F E]`. This is the canonical worked family, and it consumes `Representation.ind` and the
induced-character formula of the [induction-restriction roadmap](../InductionRestriction/README.md).

- **The conjugacy classes.** Consume the native `GeneralLinearGroup/ConjugacyClasses`
  classification and class counts, together with the native GL₂ character modules; retain
  the representative, centralizer-size and indexing comparisons. Four families, separated by
  minimal/characteristic polynomial: the `q-1` **central** scalars `diag(a,a)`; the `½(q-1)(q-2)` **split
  semisimple** `diag(a,b)` with `a ≠ b`; the `q-1` **non-semisimple/unipotent** `[[a,1],[0,a]]`; and the
  `½q(q-1)` **elliptic/non-split** classes, whose eigenvalues are a conjugate pair `ξ, ξ^q` in
  `E ∖ F`. Deliverables: class representatives, centralizer orders, class sizes, and the count
  `q²-1 = Nat.card (ConjClasses (GL (Fin 2) F))` (`card_conjClasses_GL2`), matching `#irreducibles`; the
  group order is `(q²-1)(q²-q)` (`Matrix.card_GL_field`).
- **The Borel and the principal series.** `GL2Borel`, the upper-triangular subgroup `B = T U` (split torus
  `T = diag`, unipotent radical `U`); a pair of characters `α, β : 𝔽_q^× → ℂ^×` inflates to a character of
  `B` through `T`, and `GL2PrincipalSeries α β = Ind_B^{GL₂}(α ⊗ β)` has dimension `q+1`
  (`character_one_GL2PrincipalSeries`, parabolic induction). It is **irreducible** iff `α ≠ β`
  (`simple_GL2PrincipalSeries_iff`), and `Ind_B(α β) ≅ Ind_B(β α)`, giving `½(q-1)(q-2)` irreducibles of
  dimension `q+1`.
- **The boundary: linear and Steinberg constituents.** When `α = β`, `Ind_B(α α)` is reducible of length
  two: the one-dimensional `α ∘ det` (a **degree-`1`** character, `q-1` of them) and the **Steinberg**
  constituent `GL2Steinberg` twisted by `α`, of dimension `q` (`q-1` of them). So `q-1` characters of
  dimension `1` and `q-1` of dimension `q`.
- **The cuspidal (discrete series) representations.** `GL2NonSplitTorus F E` is the non-split torus
  `Eˣ ↪ GL₂(𝔽_q)` from the supplied quadratic extension; a character `θ : Eˣ → ℂ^×` with `θ^q ≠ θ` (not
  factoring through the norm) gives `GL2Cuspidal F E θ`, of dimension `q-1` (`character_one_GL2Cuspidal`),
  with `θ` and `θ^q` yielding the same one, for `½q(q-1)` irreducibles of dimension `q-1` (parametrized by
  the `θ ∼ θ^q` orbits). These are exactly the irreducibles absent from every principal series.
- **Character-value formulas and comparisons.** Consume the existing native GL₂ formulas; The table is not fixed by the dimension counts: pin the
  explicit character values of the linear, Steinberg, principal-series, and cuspidal rows on each of the four
  class families (central, split, unipotent, elliptic); this is the bulk of the layer.
- **The count and the table (acceptance criterion).** The tally
  `(q-1)·1² + (q-1)·q² + ½(q-1)(q-2)·(q+1)² + ½q(q-1)·(q-1)² = (q²-1)(q²-q) = |GL₂(𝔽_q)|`, and
  `#irreducibles = q²-1 = #classes`. The acceptance criterion is the full `(q²-1) × (q²-1)` character table
  with the four dimension families `1, q, q+1, q-1`, its rows orthonormal for `characterPairing`, for `q ≥ 3`
  where all four families are nonempty. Worked instances: `GL₂(𝔽_3)` of order `48` as the uniform case, and
  `GL₂(𝔽_2) ≅ S₃` as a **separately-checked degenerate case** (`q = 2` gives no split-semisimple classes and
  no genuine principal series, so the uniform family theorems must assume the lower bounds they need).

---

## Worked examples (acceptance criteria), staged

Staged from rational to genuinely cyclotomic, so early milestones do not wait on the general lift:

- **Rational tables (first executable milestone).** Cyclic `C₂`; `S₃ ≅ DihedralGroup 3` (degrees
  `1,1,2`); `D₄ = DihedralGroup 4` and `Q₈ = QuaternionGroup 2` - the classic pair with the **same
  character table** (four degree-`1`, one degree-`2`) yet non-isomorphic, distinguished by the
  **Frobenius-Schur indicator** `ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` (`+1` for `D₄`, `-1` for `Q₈`), the same
  invariant [the pivotal/spherical roadmap](../../PivotalSpherical/README.md) defines categorically on
  `FDRep G`. All values in `ℤ`; only the rational lift is exercised.
- **Small cyclotomic (second milestone).** Cyclic `C₃` (table the `3rd`-root-of-unity matrix); `A₄`
  (degrees `1,1,1,3`, the linear characters taking cube-root-of-unity values) - exercises the
  quadratic/cubic lift and a nontrivial Galois orbit on rows.
- **Genuinely hard (final milestone).** `S₄` (degrees `1,1,2,3,3`, repeated nonlinear degrees, so row
  identification is nontrivial); `A₅` - irrational quadratic values `(1±√5)/2`, a nontrivial Galois
  conjugate row pair, testing `√5`-type cyclotomic lifting, and a real bad-prime avoidance check.
- **The checker is sound on each.** For every group the `#eval` table satisfies `IsCharacterTableSpec`,
  and labeled uniqueness pins it (Layer 5).
- **Burnside on a small solvable group.** `|G| = 12 = 2²·3` is solvable via the Layer-4 argument (the
  off-critical-path application).
- **Frobenius-Schur type (Layer 7).** On the shared `2`-dimensional row of `D₄` and `Q₈`, `D₄` is orthogonal
  (`ν₂ = +1`, real, invariant symmetric form) and `Q₈` is quaternionic (`ν₂ = -1`, invariant alternating
  form, not realizable over `ℝ`), which is what the equal character tables cannot see; `S₃`, `S₄`, and `A₅`
  are totally orthogonal (every `ν₂ = +1`). The involution count `#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)` and the
  match of real-valued characters with real classes are checked on each.
- **A Frobenius group (Layer 8).** `S₃ ≅ C₃ ⋊ C₂` with complement `H = ⟨(1 2)⟩` of order `2` and kernel
  `N = A₃` of order `3`; and the order-`20` group `𝔽₅ ⋊ 𝔽₅^×`, complement `C₄`, kernel `C₅`. Frobenius's
  theorem recovers `G = N ⋊ H`, and the exceptional-character construction of `N` is checked against the
  direct semidirect-product description.
- **`GL₂(𝔽_q)` character tables (Layer 9).** `GL₂(𝔽_2) ≅ S₃` (degrees `1,1,2`) as a **separately-checked
  degenerate case** where the split-semisimple and principal-series families are empty, and `GL₂(𝔽_3)` of
  order `48` (degrees
  `1,1,2,2,2,3,3,4`: two of degree `1`, two of degree `q=3`, one of degree `q+1=4`, and three of degree
  `q-1=2` from the cuspidal series), with the four families `1, q, q+1, q-1` and the `q²-1=8` classes
  verified.

### Small finite-group exercise representations

Construct the following applications of Layers0–3 over ℂ on the native
permutation, augmentation, symmetric-power and restricted-representation
carriers. Use `TauCeti.standardRepresentation` for the sum-zero standard
modules and their existing finite-function/Finsupp coordinate comparison.
Identify each character with the certified native table by explicit row and
class maps; equality of degrees alone does not label an irreducible.

**Symmetric powers of the S₃ standard module.** Let S₃ act on
`V₃={(z₀,z₁,z₂)∈ℂ³:z₀+z₁+z₂=0}` by
`(g·z)_i=z_(g⁻¹(i))`. Put σ=(01), τ=(012) and
`ω=exp(2πi/3)`, and fix the basis
`α=(1,ω,ω²)`, `β=(ω,1,ω²)`.
Prove `τα=ω²α`, `τβ=ωβ`, `σα=β`, `σβ=α`, and that these
vectors form a basis. On native Sym²V₃ and Sym³V₃ construct the monomial
bases and the actual equivariant direct-sum isomorphisms

`Sym²V₃ ≃ 1 ⊕ V₃`,
`Sym³V₃ ≃ 1 ⊕ sgn ⊕ V₃`.

For Sym² send the trivial generator to αβ and the standard basis vectors
α,β to β²,α² respectively. For Sym³ send the trivial and sign generators
to α³+β³ and α³−β³, and α,β to α²β,αβ². Prove these maps are
intertwiners on σ,τ, give their inverse coordinates and prove their images
are complementary. In the ordered square basis (α²,β²,αβ), the τ
eigenvalues are ω,ω²,1, by multiplication of the degree-one eigenvalues.
In S₃ class order identity, transposition,3-cycle, verify the characters
`χ_V₃=(2,0,-1)`, `χ_Sym²=(3,1,0)` and `χ_Sym³=(4,0,1)`.
Compare with `TauCeti.dihedralGroupThreeCharacterTable` through the
isomorphism sending a dihedral rotation to τ and a reflection to σ,
including the class-order permutation and the trivial/sign/standard rows.
These are the explicit symmetric-power decompositions of Knutson's
first-semester p138.

**Cube permutation modules and the S₄ labels.** Let the cube vertices be
`X={-1,1}³` and its unoriented edges be the unordered pairs of vertices
that differ in exactly one coordinate. Construct the finite rotation group
of determinant-one signed permutation matrices on ℝ³ and its action on X
and the twelve edges Y. Label the four body-diagonal lines by the vectors
`(1,1,1)`, `(1,-1,-1)`, `(-1,1,-1)`, `(-1,-1,1)` in that order.
Prove that the induced permutation of these lines is an isomorphism with
S₄=Equiv.Perm(Fin4), and transport the vertex and edge actions through
its inverse. Use `ℂ[X]` and `ℂ[Y]` with their actual permutation actions;
scalar permutation of four tetrahedron vertices is a different action.

Pin the S₄ class order to that of
`TauCeti.symmetricGroupFourCharacterTable`:
`1,(01),(01)(23),(012),(0123)`, with sizes `1,6,3,8,6`.
Its row order is `1,sgn,E,V₄,sgn⊗V₄`, where V₄ is the sum-zero
four-point module. Realize E as follows. On the three perfect matchings
of {0,1,2,3}, ordered
`M₀=01|23`, `M₁=03|12`, `M₂=02|13`, construct the permutation map
`q:S₄→S₃`. Prove q is surjective with kernel
`{1,(01)(23),(02)(13),(03)(12)}`, construct S₄/ker(q)≃S₃,
and take E=q*V₃. Prove irreducibility and identify its native table row;
its kernel follows from this actual action and faithfulness of V₃.
In particular no inference from eigenvalues having absolute value1 is
used to identify a kernel.

Compute the fixed vertices/edges for each rotation class, including the
half-turn about opposite-edge midpoints for a transposition, the half-turn
about opposite-face centers for a double transposition, the body-diagonal
third-turn and the face-axis quarter-turn. Obtain

| module | 1 | (01) | (01)(23) | (012) | (0123) |
| --- | ---: | ---: | ---: | ---: | ---: |
| ℂ[X] | 8 | 0 | 0 | 2 | 0 |
| ℂ[Y] | 12 | 2 | 0 | 0 | 0 |

Use class-size weighted pairings to prove
`ℂ[X] ≃ 1 ⊕ sgn ⊕ V₄ ⊕ (sgn⊗V₄)` and
`ℂ[Y] ≃ 1 ⊕ E ⊕ V₄^⊕2 ⊕ (sgn⊗V₄)`.
Construct their actual intertwiners and inverses using Layer3's character
idempotents and evaluation on the intertwining-map multiplicity spaces.
For the two-dimensional V₄ multiplicity space in ℂ[Y], choose a basis
and prove evaluation `V₄⊗Hom_S₄(V₄,ℂ[Y])→ℂ[Y]` identifies its image
with the V₄ isotypic component. Character pairings determine multiplicities;
they do not choose its two summands. Verify the dimensions8 and12 and
the actual direct-sum maps. These are the cube actions of first-semester
pp144–145; no source-specific overwritten irrep labels are needed.

**Restriction from S₄ to A₄.** Use the actual inclusion of
`alternatingGroup(Fin4)` and the preceding q. Prove q(A₄)=A₃ and
construct `κ:A₄→ℤ/3ℤ` with κ((012))=1 and kernel ker(q).
For j=0,1,2 define the actual one-dimensional action L_j by the
character `g↦ω^(j κ(g))`, interpreted through a representative-independent
exponent modulo3. Put T=Res_A₄(V₄). In native
`TauCeti.alternatingGroupFourClassData` order
`1,(01)(23),(012),(021)`, of sizes1,3,4,4, prove the table

| module | 1 | (01)(23) | (012) | (021) |
| --- | ---: | ---: | ---: | ---: |
| L₀ | 1 | 1 | 1 | 1 |
| L₁ | 1 | 1 | ω | ω² |
| L₂ | 1 | 1 | ω² | ω |
| T | 3 | -1 | 0 | 0 |

Compare with `TauCeti.alternatingGroupFourExactCharacterTable` under
its distinguished complex embedding, proving that the image of
`TauCeti.alternatingGroupFourOmega` is the chosen ω. Prove irreducibility,
pairwise inequivalence and completeness using the existing table and
pairing contracts, and construct equivariant isomorphisms
`Res(1)≃Res(sgn)≃L₀`, `Res(V₄)≃Res(sgn⊗V₄)≃T`,
`Res(E)≃L₁⊕L₂`.
For the last isomorphism use the two explicit vectors
`v_j=Σ_(r=0)² ω^(-jr) δ_(q((012))^r M₀)`, j=1,2,
in the sum-zero matching module E. Prove q((012)) cycles the matchings
in the displayed order, that v_j has eigenvalue ω^j, and that the two
vectors form a basis. Give inverse coordinates; for the sign-twisted
restrictions use that sign is identically1 on A₄. Conclude with actual
inclusion intertwiners that every A₄ irreducible occurs in a restriction
of an S₄ irreducible, as in first-semester pp145–146.


### Symmetry and normal modes of finite spring systems

Construct the following finite-dimensional applications of Layers 0–3 over `ℝ`,
and compare their complexifications with the complex character table. Use the
standard inner product on the displacement coordinates. Consume Layer 3’s
primitive central idempotents and finite representation decomposition,
SemisimpleAlgebras Layer 1’s Schur and isotypic theory, and the native matrix
action, trace and linear-map APIs. Build the character-idempotent action
adapter and its orthogonal-projector formula for these unitary representations.
For a chosen isotypic identification `V_i ⊗ Hom_G(V_i,W)`, prove that an
equivariant operator acts as `id ⊗ H_i`; derive this from Schur’s lemma and
Layer 3’s finite decomposition. Build the action, equivariance and
specified eigenspaces; a character calculation alone does not discharge these
examples. For these groups use the real-valued complex characters and show
that their character-projector matrices have real entries; justify each
real irreducibility statement by the irreducible complexification, rather
than invoking the complex form of Schur’s lemma on an arbitrary real module.
The force operators below are explicit linearizations. No assertion about
nonlinear stability follows from their zero eigenvalues.

For two particles at `(0,0),(1,0)`, name their displacements
`u₁=(x₁,y₁)` and `u₂=(x₂,y₂)`, use displacement order `(x₁,y₁,x₂,y₂)`
and force matrix
`H=[[-1,0,1,0],[0,0,0,0],[1,0,-1,0],[0,0,0,0]]`.
The source names its particle vectors `x=(x₁,x₂)` and `y=(y₁,y₂)`.
The scalar dictionary is source `x₁` ↦ target `x₁`, source `x₂` ↦ target `y₁`,
source `y₁` ↦ target `x₂`, and source `y₂` ↦ target `y₂`. Thus the source
stack `(x₁,x₂,y₁,y₂)` becomes the target stack `(x₁,y₁,x₂,y₂)` with exactly
the displayed matrix and the same particle displacements.
Construct the commuting involutions
`r=diag(1,-1,1,-1)` and
`s=[[0,0,-1,0],[0,0,0,1],[-1,0,0,0],[0,1,0,0]]`.
Identify this representation of `C₂×C₂` with its regular representation.
The eigenvectors `(1,0,-1,0)`, `(0,1,0,1)`, `(1,0,1,0)` and
`(0,1,0,-1)` have `(r,s)` signs `(+,+),(-,+),(+,-),(-,-)` and
`H` eigenvalues `-2,0,0,0`, respectively. Construct their orthogonal
character projectors. For an ordinary spring with stiffness `κ>0`, mass `m>0`
and nonzero rest vector `v`, derive the linearization of the pair force from
`F_i=κ (‖r‖-‖v‖)r/‖r‖`, where `r=v+u_j-u_i` and `F_j=-F_i`:
the acceleration on particle `i` is `(κ/m) P_v(u_j-u_i)`, with
`P_v(w)=⟪v,w⟫v/‖v‖²`. Pin the equal-mass and equal-stiffness convention.

<a id="transverse-spring-zero-mode"></a>

Make the two-particle transverse zero mode's nonlinear comparison explicit.
Keep rest length1 and stiffness κ>0. For displacements
`u₁=(0,ε)`, `u₂=(0,−ε)`, the relative vector is `r=(1,−2ε)` and
its length is `ℓ(ε)=√(1+4ε²)`. Derive the exact potential and force on
particle1 from the same pair-force convention:

`E(ε)=(κ/2)(ℓ(ε)−1)²=8κε⁴/(ℓ(ε)+1)²`,

`F₁(ε)=κ(1−1/ℓ(ε))(1,−2ε)`, with `F₂=−F₁`.

Prove E(0)=E′(0)=E″(0)=0, E(ε)>0 for ε≠0, and
`lim_(ε→0, ε≠0) E(ε)/ε⁴=2κ`. The first force coordinate is strictly
positive when ε≠0. Although H kills `(0,1,0,−1)`, the affine paths
`u₁(t)=(0,at)`, `u₂(t)=(0,−at)` for a≠0 therefore fail the exact Newton
equation at every t≠0: their acceleration is zero and the exact force is
not. Prove this pointwise comparison for every positive mass m, without
needing a nonlinear existence or long-time stability theorem.

Compare that straight displacement line with the genuinely rotated rest
configurations
`p₁(ε)=(1/2−cos(2ε)/2,sin(2ε)/2)` and
`p₂(ε)=(1/2+cos(2ε)/2,−sin(2ε)/2)`.
They have distance1, zero potential and the same tangent displacement
`(0,1,0,−1)` at ε=0. These are configuration curves, not a claim that
constant-speed rotation solves the unconstrained spring equation. This
calculation explains the limitation of the linear approximation in
[Knutson's tetrahedron handout, pp1–3](https://pi.math.cornell.edu/~allenk/courses/12spring/6500/notes1/tetrahedron.pdf).
Use native real square-root, differentiation and filter-limit APIs;
suggested scalar statements are in
[`TransverseSpringTargets.lean`](TransverseSpringTargets.lean).

For three particles on a line, construct
`H=[[-1,1,0],[1,-2,1],[0,1,-1]]` and
`r(x₁,x₂,x₃)=(-x₃,-x₂,-x₁)`.
Prove that the representation has one trivial and two sign constituents.
Its vectors `(1,0,-1)`, `(1,1,1)` and `(1,-2,1)` have eigenvalues
`-1,0,-3`, respectively. Identify the trivial line and the sign isotypic
plane, and prove explicitly that `H` is not scalar on that plane. An
equivariant operator preserves isotypic components and acts on their
multiplicity spaces; it need not preserve arbitrary chosen irreducible copies.

For the tetrahedron with vertices
`p₁=(0,0,0), p₂=(1,1,0), p₃=(1,0,1), p₄=(0,1,1)`, put
`c=(1/2,1/2,1/2)` and `q_i=p_i-c`.
Construct the orthogonal ambient action `R_σ` determined by
`R_σ q_i=q_{σ(i)}` for `σ∈S₄`, and the displacement representation
`(σ·u)_i=R_σ u_{σ⁻¹(i)}` on `(ℝ³)^4`. Identify the ambient module with
the sum-zero submodule of the four-point permutation representation, with
its inner-product normalization. For every edge `i<j`, let `z_ij∈ℝ¹²`
have block `p_i-p_j` at `i`, its negative at `j`, and zero elsewhere.
Define `H=-Σ_(i<j) z_ij z_ijᵀ`. Prove that it is symmetric, negative
semidefinite and `S₄`-equivariant. This normalization has the pair-spring
matrix with entries `±1` on the `(1,2)` edge; since every edge has squared
length `2`, physical unit-direction springs give acceleration operator
`(κ/(2m))H`.

In class order `(1⁴),(2,1²),(3,1),(4),(2,2)`, compute the displacement
character `(12,2,0,0,0)` and its decomposition
`1 ⊕ E ⊕ 2V ⊕ (sgn⊗V)`, where `V` is the standard three-dimensional
module and `E` is the two-dimensional irreducible. Construct the following
orthogonal decomposition and actual intertwiners:

- translations `u_i=t` and infinitesimal rotations `u_i=Aq_i`, `Aᵀ=-A`,
  give the kernel, of dimension `6`, with types `V` and `sgn⊗V`;
- diagonal trace-zero symmetric `A` in `u_i=Aq_i` give the `E` eigenspace,
  of dimension `2`, with eigenvalue `-2`;
- symmetric matrices `A` with zero diagonal give the other `V` eigenspace,
  of dimension `3`, with eigenvalue `-4`;
- the breathing line `u_i=a q_i` has eigenvalue `-8`.

Show that every displacement is uniquely a translation plus `u_i=Aq_i`.
Identify rotations with `Λ²V` using the Euclidean metric and its equivariant
skew-map construction. Thus the two copies of `V` are distinguished by
translation and vibration, not by applying Schur's lemma to their sum.
Prove the characteristic polynomial
`X⁶ (X+2)² (X+4)³ (X+8)` and the stated kernel and eigenspace dimensions.
For `m,κ>0`, the six positive vibrational frequencies are
`√(κ/m)` twice, `√(2κ/m)` three times, and `2√(κ/m)` once.
Construct the solutions of `u''=(κ/(2m))H u` on these modes and the affine
solutions on the zero modes.

Also compute restriction to the vertex stabilizer `S₃` and the square
subgroup `D₄=⟨(1234),(13)⟩` of `S₄`.
The displacement invariant spaces have dimensions `3` and `2`, respectively.
For `S₃`, construct a fixed vector on the breathing line and one in each
standard copy. Prove that the full `S₄`-orbit of the chosen nonzero seed in the
vibrational standard module consists of exactly four vectors, that their sum
is zero, and that they span that three-dimensional module. A concrete choice
is `u_j=A_i q_j`, with `A_i=q_i q_iᵀ−(1/4)I` for the vertex fixed by the
subgroup; the four `A_i` are distinct, sum to zero and span the off-diagonal
symmetric matrices. The translation seeds `u_j=q_i` give the same four-point
standard comparison. Its `S₃`-orbit itself is a singleton.
For `D₄`, construct the fixed line in `E`, separate it from breathing by
orthogonal projection, and prove that the full `S₄`-orbit of a nonzero seed
has exactly three vectors spanning `E`. With the specified vertices and
`D₄=⟨(1234),(13)⟩`, take `A=diag(-1,2,-1)` in `u_j=Aq_j`; its orbit is the
three diagonal matrices having one entry2 and the other entries−1. Their
sum is zero and this is their sole linear relation, so they span the
trace-zero diagonal plane. Its `D₄`-orbit itself is a singleton. Give the corresponding restriction
characters and fixed-space projectors; these constructions supply the
symmetric spanning sets without claiming a canonical basis in an irreducible.

## Ordering

Layer 0 (class functions) and Layer 1 (center, structure constants, integral class center) are
independent and come first. Layer 2 (Wedderburn, indexing, center-splitting, the count) needs Layer 1's
center dimension; its Layer 2.5 indexing infrastructure and the center-splitting `Z(k[G]) ≃ (Irreps → k)`
are prerequisites for Layer 5, so they are built to that standard, not as boilerplate. Layer 3 (table,
idempotents, completeness, second orthogonality, virtual characters) needs Layers 0-2. Its faithful
tensor-generation subsection consumes the native finite-order trace/kernel criterion, tensor-power
characters and pairing-to-Hom theorem, together with finite Lagrange/Vandermonde interpolation; it
uses the existing Layer3 multiplicity/regrouping API for its direct-summand form. It does not depend
on Layer4 arithmetic, degree divisibility, a McKay graph or a finite-subgroup classification. Layer 4 (the
arithmetic) needs Layer 3's table and Layer 1's integral class center; Brauer and Burnside are its
applications and may come last. Layer 5 (the specification) needs the coordinate identity, the primitive
central idempotents and center-splitting (Layers 2-3), and Layer 4's central-character integrality and
degree recovery. Layer6 consumes the native exact ring, ClassData, transposed modular search, certified
primes, all-conjugate lift, exact checker and assembled Option solver. Its new proof order
is generator/field/integral-power-basis comparison, eigenvalue multiplicities and exact
ordinary values, exact central preimages and the division-free identity, the derived B_G
coordinate bound, exact table certificate and native reference row-alignment completeness;
then direct finite-row ordering, class-power/Galois residue alignment, positive per-row
degree recovery and the checked executable refinement; then strong-prime cofinality,
finite-budget totality and the named actual evaluations. Build these finite adapters
here from the native search output and exact arithmetic; no coefficient oracle or
replacement Gaussian engine is a premise. Deliverables A, B, C are increasingly deep and C is
conditional on its named infrastructure; a contributor can complete A and B, and the rational-table
milestone of C, well before the general cyclotomic lift.

Deliverable D's three layers are independent applications built on Deliverable A. Layer 7 (Frobenius-Schur)
needs Layer 3's completeness and `characterTable` and Layer 0's `characterPairing`, plus the invariant-form
and dual-representation API; it is otherwise self-contained and can be built right after Layer 3. Layer 8
(Frobenius groups) needs the induced-character formula and the induction isometry from the
[induction-restriction roadmap](../InductionRestriction/README.md), and is the character-theoretic
companion to Layer 4's Burnside theorem. Layer 9 (`GL₂(𝔽_q)`) needs parabolic induction (again the
induction-restriction roadmap) and, for its cuspidal series, the non-split torus `𝔽_{q²}^×`; its acceptance
is a concrete character table, so it also exercises Layers 0-3 on a nonabelian family of unbounded order.
None of the three is on the Dixon-Schneider critical path, and any of them may be taken up once Deliverable
A is in place.

## References

- I. M. Isaacs, *Character Theory of Finite Groups*, AMS Chelsea (1976) - Layers 0-4: class functions and
  orthogonality (Ch. 2), central characters, primitive central idempotents, integrality of character
  values, `χ(1) ∣ |G|` (Ch. 3), Burnside's `pᵃqᵇ` theorem (Ch. 3); the Frobenius-Schur indicator
  and the real/complex/quaternionic classification (Ch. 4, Layer 7) and Frobenius groups via trivial-
  intersection sets and exceptional characters (Ch. 7, Thm 7.2, Layer 8).
- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977) - Part I: characters,
  orthogonality, the number of irreducibles equals the number of classes, the canonical decomposition;
  §13.2, the Frobenius-Schur indicator and the real/complex/quaternionic trichotomy (Layer 7).
- G. James, M. Liebeck, *Representations and Characters of Groups*, 2nd ed., CUP (2001) - the character
  table as a computational object, column orthogonality, and many worked small-group tables.
- C. W. Curtis, I. Reiner, *Methods of Representation Theory, Vol. I*, Wiley (1981) - the group algebra,
  its center, class sums, structure constants, the integral group ring, and the Wedderburn structure
  theory (Ch. 1-3).
- J. D. Dixon, *High speed computation of group characters*, Numer. Math. 10 (1967) 446-450 - the
  algorithm: class-multiplication matrices, the reduction to eigenvector computation over `ZMod p` with
  `p ≡ 1 (mod e)`, and the size bound making the cyclotomic lift unique.
- G. J. A. Schneider, *Dixon's character table algorithm revisited*, J. Symbolic Comput. 9 (1990)
  601-606 - the refinement (splitting eigenspaces along successive class-multiplication matrices) that
  the eigenvector search follows.
- W. Burnside, *Theory of Groups of Finite Order*, 2nd ed. (1911) - the `pᵃqᵇ` theorem and the
  central-character method.
- A. Hulpke, *Computational representation theory* (lecture notes; the GAP implementation of
  Dixon-Schneider) - the practical form of the algorithm and the reference point for what "compute a
  character table" means in Layer 6.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991) -
  the character table of `GL₂(𝔽_q)`, its conjugacy classes, principal series, and cuspidal representations,
  worked explicitly (Layer 9).
- C. Bonnafé, *Representations of `SL₂(𝔽_q)`*, Springer Algebra and Applications 13 (2011) - the conjugacy
  classes, the Borel and parabolic induction, and the cuspidal (discrete series) representations from the
  non-split torus, the model account for Layer 9.
- P. Deligne, G. Lusztig, *Representations of reductive groups over finite fields*, Ann. of Math. 103 (1976)
  103-161 - the general Deligne-Lusztig theory that the cuspidal series of Layer 9 specializes to `GL₂`.

Supplementary public proof reference: [Math 6320 lecture notes, §17.2](https://vkuperberg.math.ethz.ch/math6320notes.pdf),
Lemma 17.2.3 (coprime zero-or-scalar alternative), Theorem 17.2.4 (prime-power class obstruction),
and Theorem 17.2.2 (Burnside). These supplement the character-theory texts above.
