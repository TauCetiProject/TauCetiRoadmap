# Roadmap: character theory of finite groups, and computing character tables

Mathlib has the analytic heart of finite-group character theory but nothing that assembles it into a
usable theory of the **character table**, and no way to **compute** one. It defines the character of a
representation as a trace (`RepresentationTheory/Character.lean`: `Representation.character` and
`FDRep.character`, with `char_one`, `char_conj`, `char_tensor`, `char_dual`, `char_linHom`), proves
Maschke's theorem (`RepresentationTheory/Maschke.lean`: `IsSemisimpleRing k[G]`), has Schur's lemma
and the general Artin-Wedderburn structure theorem (`RingTheory/SimpleModule/WedderburnArtin.lean`,
`RingTheory/SimpleModule/IsAlgClosed.lean`), and proves the **first (row) orthogonality relation**
`char_orthonormal`. It also has the arithmetic foundations the subject needs downstream: algebraic
integers as a ring with `isIntegral_iff` (a rational algebraic integer is an integer), roots of unity
are integral (`IsPrimitiveRoot.isIntegral`), and cyclotomic fields with their Galois group
`≃ (ZMod n)ˣ` (`NumberTheory/Cyclotomic/*`).

What Mathlib does **not** have is everything that turns those pieces into character theory proper: the
space of **class functions** and its pairing; the **center of the group algebra**, its **class-sum
basis** and the **structure constants**; the count **#irreducibles = #conjugacy classes**;
**completeness** of the irreducible characters and the **second (column) orthogonality relation**; the
arithmetic of character values (their lifts into **cyclotomic integers** in `ℤ[ζ_e]`, the **central
characters** `ωᵪ`, the **primitive central idempotents**, that a degree **divides `|G|`**, the **Galois
action** on the values); the **character table** as an object at all; and, above all, any means of
**computing** a character table. Mathlib's eigenvalue and characteristic-polynomial machinery is
`noncomputable`, its joint-diagonalization result is a classical existence statement over `ℝ`/`ℂ`, and
there is no Dixon-Schneider algorithm, no class-multiplication matrix, and no `#eval` of a character
anywhere.

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

## What is missing (build here)

The **space of class functions** and its bilinear pairing; the **center of `k[G]`**, the **class-sum
basis**, the computable **structure constants `aᵢⱼₖ`**, and the **integral class center** over `ℤ`; the
composition of Maschke with Artin-Wedderburn into **`k[G] ≅ ⊕ Matₙᵢ(k)` with `∑ nᵢ² = |G|`**, the
**irreducible-indexing infrastructure** and the center-splitting `Z(k[G]) ≃ (Irreps → k)`, and the count
**#irreducibles = #conjugacy classes**; **completeness**, the **second (column) orthogonality relation**,
the **primitive central idempotents**, the **virtual-character lattice**, and the **character table** as
a matrix with its labeled uniqueness; the arithmetic - **cyclotomic-integer value lifts and `ℤ[ζ_e]` membership**, the
**central characters** and their integrality via the integral class center, **`nᵢ ∣ |G|`**, the **Galois
action**, and (application, off the critical path) **Brauer splitting** and **Burnside `pᵃqᵇ`**; the
**Dixon-Schneider characterization** (the explicit class-algebra eigenvector identity, the ordinary/
central conversion, the degree-positivity normalization) and the **uniqueness/checker**; and the
**executable algorithm** - an **exact cyclotomic-integer type**, computable finite-field linear algebra
(`kernelBasis`, `eigenvalueSearch`), certified **`DixonPrimeData`** and the good-prime structure theorem
`Z(𝔽_p[G]) ≅ 𝔽_p^r`, the eigenvector search, the structured **cyclotomic lift**, and the assembled solver
with its correctness proof. None of this is upstream.

Deliverable D adds three classical applications, none of them upstream either: the **Frobenius-Schur
trichotomy** and the real/quaternionic/complex classification of an irreducible `χ` over `ℂ` by
`ν₂(χ) ∈ {+1, 0, -1}`, with the invariant **symmetric/alternating** bilinear forms, the involution count
`#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`, and the equality of the number of **real-valued** irreducibles and the
number of **real conjugacy classes** (`g ∼ g⁻¹`); **Frobenius groups**, the **Frobenius kernel**, and
**Frobenius's theorem** `G = N ⋊ H` (via **trivial-intersection sets** and the exceptional-character
induction argument, the signature use of induced characters, with no known character-free proof); and the
full **character table of `GL₂(𝔽_q)`** by parabolic induction of characters of the Borel (the principal
series, dimension `q+1`), its one-dimensional and **Steinberg** boundary constituents (dimensions `1` and
`q`), and the **cuspidal** representations from the non-split torus `𝔽_{q²}^×` (dimension `q-1`).

`Suggested.lean` pins the load-bearing objects (`ClassFunction`, `classSum`, `structureConstant`,
`integralClassCenter`, `centralCharacter`, `primitiveCentralIdempotent`, `centralCharacterTable`,
`characterTable`, `IsCharacterTableSpec`, `Cyclotomic e`, `DixonPrimeData`, `characterTableDixon`) and
the named milestones below as `sorry`-targets, so each is claimable and the summit statement
`characterTable_eq` is machine-checked to be expressible against the pinned Mathlib. For Deliverable D it
adds `IsInvariantForm`, `frobeniusSchurIndicatorRep` and its trichotomy, `IsRealForm` and the `ν₂ = +1`
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

- **The class sum** `classSum k C : k[G]`, `∑_{g ∈ C} g` for `C : ConjClasses G`; a genuine `def` on
  `[Fintype G] [DecidableEq G]` data, hence computable.
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
  set of isomorphism classes of simple `k[G]`-modules; and `∑ᵢ nᵢ² = |G|` by comparing `k`-dimensions
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

### Layer 6: the executable Burnside-Dixon-Schneider algorithm (the summit)

Everything here is a genuine `def` on `[DecidableEq G] [Fintype G]` data, `#eval`-able, proved against
Layer 5. The layer is explicitly conditional on the exact-arithmetic and good-prime infrastructure it
names as its first targets.

- **Exact cyclotomic arithmetic.** `Cyclotomic e`: the computable ring `ℤ[X]/Φ_e` as coefficient vectors
  on the power basis, with `+`, `*`, `DecidableEq` as `def`s, a pinned embedding `Cyclotomic e ↪ ℂ`, and
  the reduction `Cyclotomic e → ZMod p` at a prime dividing `p`. The output type is `ExactCharTable G`
  (entries in `Cyclotomic e`), never `Matrix _ _ ℂ`; `ℂ` appears only under the embedding, in the
  correctness statement.
- **Executable class data.** `ClassData G` - `reps : List G`, the classes as `List (Finset G)`, with
  completeness/disjointness/conjugacy proofs and an equivalence to `ConjClasses G`. Use `ClassData` for
  deterministic indexing in computation and `ConjClasses G` for theorems. `structureConstant` becomes an
  executable `ℕ`-valued function over `ClassData`. `#eval`-test on `DihedralGroup 4`.
- **Computable finite-field linear algebra.** Two separate `def`s: `kernelBasis` over
  `[Field F] [DecidableEq F]` (verified Gaussian elimination giving a kernel basis) and `eigenvalueSearch`
  over `[Field F] [Fintype F] [DecidableEq F]` (the eigenvalues of a matrix, found by search over `F`).
  Eigenspaces are `kernelBasis (Mᵢ - λ)`. This is the one linear-algebra gap on the critical path, and it
  is a self-contained target.
- **Certified Dixon prime data.** `DixonPrimeData G` - a prime `p`, a proof `p.Prime`, `e ∣ p - 1` (so
  `ZMod p` splits `X^e - 1`), the size bound `2⌊√|G|⌋ < p` (making the lift unique), and a
  **`IsGoodDixonPrime G p`** certificate: `p ∤ |G|`, `X^e - 1` splits, and the reduced central-character
  tuples are injective (no bad-prime merging of distinct central characters). For the worked examples
  these data are **certified explicitly**; that a good Dixon prime *exists* (from the primes dividing
  `Φ_e`, avoiding the finitely many bad ones) is a **separate, later** theorem, not a step in any `#eval`.
- **The good-prime structure theorem.** For `IsGoodDixonPrime G p`: `Z(𝔽_p[G]) ≃ₐ 𝔽_p^r`, the reduced
  class-multiplication matrices are simultaneously diagonalizable with exactly `r` distinct algebra
  homomorphisms `𝔽_p^r`. The eigenvector-search correctness theorem is conditional on this; it is what
  guarantees the refinement terminates in one-dimensional common eigenspaces.
- **The eigenvector search.** Over `ZMod p`, refine a partition of `Fin r` into common eigenspaces by
  splitting each block along `eigenvalueSearch (Mᵢ)` (each eigenspace `kernelBasis (Mᵢ - λ)`) until every
  block is one-dimensional; correct under the structure theorem. Output the reduced central-character
  table `Ω mod p`.
- **The structured cyclotomic lift.** Not a bare `ZMod p → ℤ[ζ_e]` (a residue underdetermines an algebraic
  integer, and with `p ≡ 1 (mod e)` the Frobenius on `ζ_e` is *trivial* mod `p`, so the useful data is the
  images at all embeddings, not a Frobenius orbit). Instead `liftCyclotomic`, taking a chosen primitive
  `e`-th root `α ∈ ZMod p`, the residue tuple over `(ZMod e)ˣ`, and a bounded-coefficient certificate
  (Dixon's bound), returning the unique element of `Cyclotomic e` with those data, with a uniqueness proof.
  Stage it: a **rational-integer** lift first (rational tables), then a **quadratic/cubic cyclotomic** lift
  (for `A₄`, `A₅`), before the general `ℤ[ζ_e]`.
- **The assembled solver.** `characterTableDixon G : ExactCharTable G`, the composition of modular
  reduction, the eigenvector search, the degree recovery, and the lift, returning `Ω` exactly and
  converting to `X`. It returns its output **together with a certificate that it satisfies the checker**
  (an `Option`/subtype whose success is `IsGoodDixonPrime`-certified; search the next prime on failure).
  The **summit theorem** `characterTable_eq`: the embedding `Cyclotomic e ↪ ℂ` of `characterTableDixon G`
  satisfies `IsCharacterTableSpec G`, hence (Layer 5 uniqueness) **is** the character table of `G` up to
  row permutation. Acceptance: `#eval characterTableDixon (DihedralGroup 4)` returns the correct exact
  table, likewise for the staged examples below.

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
  `ρ : Representation ℂ G V`, agreeing with the `FDRep`-level `frobeniusSchurIndicator` (also a build target here: Mathlib has no
  Frobenius-Schur indicator) under
  `Rep.equivalenceModuleMonoidAlgebra`. This is the computation-friendly form; state both and their equality.
- **The symmetric and exterior squares (a build target, not consumed).** Mathlib has no character-level
  `Sym²`/`Λ²` of a representation, so this layer **builds** the symmetric- and exterior-square
  representations and their character formulas `χ_{Sym²}(g) = ½(χ(g)² + χ(g²))` and
  `χ_{Λ²}(g) = ½(χ(g)² - χ(g²))`. From them, the invariant forms follow.
- **Invariant bilinear forms.** `IsInvariantForm ρ B` for `B : LinearMap.BilinForm ℂ V`:
  `B (ρ g x) (ρ g y) = B x y`. The invariant forms are the `G`-invariants of `V* ⊗ V*`
  (`Representation.dual`, `Representation.invariants`, both consumed from Mathlib), splitting as symmetric
  (`LinearMap.BilinForm.IsSymm`, orthogonal type) plus alternating (`LinearMap.BilinForm.IsAlt`, symplectic
  type); their dimensions are the multiplicities `⟨χ_{Sym²}, 1⟩` and `⟨χ_{Λ²}, 1⟩` built above, and for
  irreducible `ρ` the total `⟨χ·χ̄, 1⟩` is `0` or `1`.
- **The trichotomy.** For irreducible `ρ` over `ℂ`, `ν₂(χ) ∈ {+1, 0, -1}`: it is `+1` iff `ρ` carries a
  nonzero invariant symmetric nondegenerate form (**orthogonal**), `-1` iff a nonzero invariant alternating
  nondegenerate form (**quaternionic/symplectic**), and `0` iff `χ ≠ χ̄` (**complex**, no nonzero invariant
  form). Prove each equivalence (`frobeniusSchurIndicatorRep_eq_one_iff`,
  `frobeniusSchurIndicatorRep_eq_neg_one_iff`).
- **Realizability over `ℝ` (a separate, stronger target).** The symmetric invariant complex form of the
  `+1` case is *not itself* a real representation: realizing `ρ` over `ℝ` means constructing a
  `Representation ℝ G W` whose scalar extension to `ℂ` recovers `ρ` (typically via a compatible Hermitian
  form / anti-linear equivariant involution). Mathlib has no complexification of representations, so pin the
  predicate `IsRealForm` and the theorem `frobeniusSchurIndicatorRep_eq_one_realizable` as their own target,
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

- **The conjugacy classes (a build target).** Mathlib has `Matrix.charpoly` but not the rational-canonical-
  form classification, centralizer sizes, or class counts for `GL₂`; build them. Four families, separated by
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
- **Character-value formulas (build targets).** The table is not fixed by the dimension counts: pin the
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

## Ordering

Layer 0 (class functions) and Layer 1 (center, structure constants, integral class center) are
independent and come first. Layer 2 (Wedderburn, indexing, center-splitting, the count) needs Layer 1's
center dimension; its Layer 2.5 indexing infrastructure and the center-splitting `Z(k[G]) ≃ (Irreps → k)`
are prerequisites for Layer 5, so they are built to that standard, not as boilerplate. Layer 3 (table,
idempotents, completeness, second orthogonality, virtual characters) needs Layers 0-2. Layer 4 (the
arithmetic) needs Layer 3's table and Layer 1's integral class center; Brauer and Burnside are its
applications and may come last. Layer 5 (the specification) needs the coordinate identity, the primitive
central idempotents and center-splitting (Layers 2-3), and Layer 4's central-character integrality and
degree recovery. Layer 6 (the executable algorithm) needs Layer 5 as its specification and, as its own
first targets, the exact-arithmetic type, the executable class data, and the finite-field linear algebra;
then the certified Dixon-prime data and the good-prime structure theorem, then the eigenvector search,
then the staged lift, then the assembled solver. Deliverables A, B, C are increasingly deep and C is
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
