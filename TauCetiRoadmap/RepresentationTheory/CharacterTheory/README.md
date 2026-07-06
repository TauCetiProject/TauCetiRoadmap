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
arithmetic of character values (that they are **algebraic integers** in `ℤ[ζ_e]`, the **central
characters** `ωᵪ`, the **primitive central idempotents**, that a degree **divides `|G|`**, the **Galois
action** on the values); the **character table** as an object at all; and, above all, any means of
**computing** a character table. Mathlib's eigenvalue and characteristic-polynomial machinery is
`noncomputable`, its joint-diagonalization result is a classical existence statement over `ℝ`/`ℂ`, and
there is no Dixon-Schneider algorithm, no class-multiplication matrix, and no `#eval` of a character
anywhere.

This roadmap builds that theory and ends at an **executable, proven-correct** character-table
algorithm: a Lean function that `#eval`s to the character table of a concrete finite group, together with
a theorem that its output is *the* character table. The vehicle is the **Burnside-Dixon-Schneider
algorithm**: the irreducible characters are read off the common eigenvectors of the commuting
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
  field `k` that is **algebraically closed with `char k ∤ |G|`** — Mathlib's `char_orthonormal` and
  `k[G] ≅ ⊕ Matₙᵢ(k)` live there. The **character table as a concrete object** is over **`ℂ`**, whose
  entries are honest complex numbers. Do not bundle "algebraically closed and `char ∤ |G|`" into a class;
  spell the hypotheses each result uses. Keep the three arenas — a general `k`, the field `ℂ`, and the
  cyclotomic field `ℚ(ζ_e)` — separate: prove eigenvalue statements over `k`, complex-analytic
  statements over `ℂ`, and arithmetic statements over `ℚ(ζ_e)`, and state each transfer explicitly rather
  than sliding between them.
- **Exact arithmetic is the computational artifact; `ℂ` is only the specification.** `Complex` is not a
  computable algebraic-number type, so nothing is `#eval`ed in `ℂ`. Deliverable C computes in an
  **exact, computable cyclotomic-integer type** — coefficient vectors on the power basis of
  `ℤ[ζ_e] = ℤ[X]/Φ_e` (`e = Monoid.exponent G`), for which `+`, `*`, and `DecidableEq` are genuine
  `def`s. Pin a definite embedding `ℤ[ζ_e] ↪ ℂ`. The complex table is the image of the exact table under
  this embedding; the correctness theorem says the *embedded* exact output satisfies the `ℂ`-valued
  specification. Ordinary character values lie in `ℚ(ζ_e)`, and the Galois group acts on them by the
  power maps `σ_k : ζ ↦ ζ^k` (Mathlib's `autEquivPow`); these two facts are **mandatory** before the
  lift-correctness theorem, whereas full Brauer splitting (below) is not.
- **The primary spine is the group algebra; `FDRep` is the categorical mirror.** Develop the theory on
  the **module/algebra core** — `k[G] = MonoidAlgebra k G`, its modules, `Representation.character`, and
  `Representation.IsIrreducible` — because it is Mathlib-native, carries the semisimple structure theory,
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

- **Characters as traces:** `RepresentationTheory/Character.lean` — `Representation.character ρ g`,
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
  `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` — giving a **noncomputable** algebra
  equivalence `k[G] ≃ ∏ Matₙᵢ(k)` once composed with Maschke.
- **Conjugacy classes, computably:** `Algebra/Group/Conj.lean` (`ConjClasses G`),
  `Algebra/Group/ConjFinite.lean` (`Fintype (ConjClasses α)`,
  `DecidableRel (IsConj : α → α → Prop)` for `[DecidableEq α] [Fintype α]`, `Fintype (carrier x)`),
  `GroupTheory/GroupAction/CardCommute.lean` (`card_comm_eq_card_conjClasses_mul_card`).
- **Concrete computable groups:** `Equiv.Perm (Fin n)`, `GroupTheory/SpecificGroups/Dihedral.lean`
  (`DihedralGroup n`, `deriving DecidableEq`, computable `Group`/`Fintype`), `Quaternion.lean`, `Cyclic.lean`.
- **Group algebra, computably:** `Algebra/MonoidAlgebra/*` (`MonoidAlgebra k G = G →₀ k`, computable
  multiplication for computable `k` and `[DecidableEq G]`).
- **Algebraic integers:** `RingTheory/IntegralClosure/*` — `IsIntegral`, `integralClosure`,
  `IsIntegral.add/mul/...`; `IsIntegrallyClosed` with `isIntegral_iff`, `IsIntegrallyClosed ℤ` via
  `GCDMonoid.toIsIntegrallyClosed`; `NumberField.RingOfIntegers` (`𝓞 K`).
- **Roots of unity and cyclotomics:** `RingTheory/RootsOfUnity/*` (`rootsOfUnity`, `IsPrimitiveRoot`,
  `IsPrimitiveRoot.isIntegral`), `NumberTheory/Cyclotomic/*` (`IsCyclotomicExtension`, `CyclotomicField`,
  `CyclotomicRing`, `IsPrimitiveRoot.autToPow`/`autEquivPow : Gal ≃* (ZMod n)ˣ`), `Monoid.exponent`.
- **Finite fields, computably:** `Data/ZMod/Basic.lean` (`ZMod.inv` a genuine `def`),
  `Algebra/Field/ZMod.lean` (`Field (ZMod p)`), `FieldTheory/Finite/*`; and, for the Dixon prime, the
  primes dividing `Φ_e` are (bar finitely many) `≡ 1 (mod e)` — an elementary source of `≡ 1` primes
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
a matrix with its labeled uniqueness; the arithmetic — **values are algebraic integers in `ℤ[ζ_e]`**, the
**central characters** and their integrality via the integral class center, **`nᵢ ∣ |G|`**, the **Galois
action**, and (application, off the critical path) **Brauer splitting** and **Burnside `pᵃqᵇ`**; the
**Dixon-Schneider characterization** (the explicit class-algebra eigenvector identity, the ordinary/
central conversion, the degree-positivity normalization) and the **uniqueness/checker**; and the
**executable algorithm** — an **exact cyclotomic-integer type**, computable finite-field linear algebra
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
adds `IsInvariantForm`, `frobeniusSchurIndicatorRep` and its trichotomy, `IsRealClass`,
`IsFrobeniusComplement`, `frobeniusKernel` with `frobeniusKernel_isComplement'`, and `GL2Borel`,
`GL2PrincipalSeries`, `GL2Steinberg`.

---

## A. Ordinary character theory and the character table

### Layer 0: class functions and their pairing

- **`ClassFunction k G`** — the submodule of `G → k` of functions constant on conjugacy classes. Every
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
  (`finrank k k[G] = |G|`).
- **Layer 2.5: irreducible-indexing infrastructure.** A type `Irreps k G` of isomorphism classes of
  simple `k[G]`-modules with `character : Irreps k G → ClassFunction k G`, `degree : Irreps k G → ℕ`,
  and the equivalence with the Wedderburn block index; `char_orthonormal` imported through it. Everything
  downstream indexes by `Irreps k G`, so this equivalence is explicit API.
- **The center splits.** `Z(k[G]) ≃ₐ[k] (Irreps k G → k)`, evaluation by central characters (the center
  of `∏ Matₙᵢ(k)` is `∏ k`). This is the sharp form Layer 5 needs: central characters **separate points**
  of the center.
- **#irreducibles = #conjugacy classes.** Combining the split with Layer 1's center dimension:
  `Nat.card (Irreps k G) = Nat.card (ConjClasses G)`.

### Layer 3: the character table, idempotents, completeness, second orthogonality

- **Completeness.** The irreducible characters `{χᵢ}` **span** `ClassFunction k G`; with
  `char_orthonormal` and the count, they are an orthonormal (for `characterPairing`) **basis**
  `Basis (Irreps k G) k (ClassFunction k G)`.
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
  table.)

### Layer 4: the arithmetic of character values

- **Diagonalizability, per arena.** *Over general `k`* (`char ∤ |G|`): `ρ g` annihilates the squarefree
  `X^d - 1` (`d = orderOf g ∣ e`), so it is semisimple with eigenvalues among the `d`-th roots of unity
  *in `k`* (`isSemisimple_of_squarefree_aeval_eq_zero`). *Over `ℂ`*: those eigenvalues are complex `e`-th
  roots of unity, so `χ(g) = ∑ (eigenvalues)` is a sum of `e`-th roots of unity.
- **Values are cyclotomic integers.** Over `ℂ`, `χ(g)` lies in the image of `ℤ[ζ_e] → ℂ` and is integral
  over `ℤ` (`IsPrimitiveRoot.isIntegral`, closure under `+`). State `IsIntegral ℤ (χ g)` and membership
  in `ℤ[ζ_e]`. Do **not** state a cyclotomic-integrality theorem over an arbitrary `k`.
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
  (Brauer): every irreducible `ℂ`-representation is realizable over `ℚ(ζ_e)`. And **Burnside's `pᵃqᵇ`
  theorem**: a group of order `pᵃqᵇ` is solvable, via central-character integrality and the vanishing
  lemma `χ(g) = 0` when `gcd(|C|, χ(1)) = 1`, `g ≠ 1`. Both are genuine targets and classical high points,
  but neither is a prerequisite for the algorithm; they are marked as applications so they do not distort
  the Layer 5-6 dependency chain.

## B. The class algebra and the Dixon-Schneider specification

### Layer 5: the Dixon-Schneider characterization (the specification)

This layer proves that the structure constants **plus** Layer 4's arithmetic **determine** the table, and
packages the checker. It is stated over `ℂ`; deliverable C computes it.

- **The coordinate identity.** From multiplicativity of `ωᵪ : Z(k[G]) → k` and
  `KᵢKⱼ = ∑ₖ aᵢⱼᵏ Kₖ`: `ωᵪ(Kᵢ) ωᵪ(Kⱼ) = ∑ₖ aᵢⱼᵏ ωᵪ(Kₖ)`. Prove this first; it is the algebraic fact the
  eigenvector theorem rests on.
- **Class-multiplication matrices, with a pinned convention.** `classMultMatrix i`, `(Mᵢ)ⱼₖ = aᵢₖⱼ`
  (transpose convention fixed as API, not prose), acting on **column** vectors. The `{Mᵢ}` commute
  (center commutative). Then, from the coordinate identity, the column vector
  `vᵪ = (ωᵪ(K₁), …, ωᵪ(Kᵣ))ᵀ` satisfies `Mᵢ vᵪ = ωᵪ(Kᵢ) vᵪ` — proved as a theorem *after* the coordinate
  identity, with indices explicit — and the `{vᵪ}` are a basis of common eigenvectors. Conversely the
  common eigenvectors of `{Mᵢ}` are exactly the `{vᵪ}` up to scale.
- **Normalization and degree recovery.** Normalize each eigenvector by `ωᵪ(K₁) = 1` (the identity class).
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
- **Executable class data.** `ClassData G` — `reps : List G`, the classes as `List (Finset G)`, with
  completeness/disjointness/conjugacy proofs and an equivalence to `ConjClasses G`. Use `ClassData` for
  deterministic indexing in computation and `ConjClasses G` for theorems. `structureConstant` becomes an
  executable `ℕ`-valued function over `ClassData`. `#eval`-test on `DihedralGroup 4`.
- **Computable finite-field linear algebra.** Two separate `def`s: `kernelBasis` over
  `[Field F] [DecidableEq F]` (verified Gaussian elimination giving a kernel basis) and `eigenvalueSearch`
  over `[Field F] [Fintype F] [DecidableEq F]` (the eigenvalues of a matrix, found by search over `F`).
  Eigenspaces are `kernelBasis (Mᵢ - λ)`. This is the one linear-algebra gap on the critical path, and it
  is a self-contained target.
- **Certified Dixon prime data.** `DixonPrimeData G` — a prime `p`, a proof `p.Prime`, `e ∣ p - 1` (so
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
  `ρ : Representation ℂ G V`, agreeing with the existing `FDRep`-level `frobeniusSchurIndicator` under
  `Rep.equivalenceModuleMonoidAlgebra`. This is the computation-friendly form; state both and their equality.
- **Invariant bilinear forms.** `IsInvariantForm ρ B` for `B : LinearMap.BilinForm ℂ V`:
  `B (ρ g x) (ρ g y) = B x y`. The invariant forms are the `G`-invariants of `V* ⊗ V*`
  (`Representation.dual`, `Representation.invariants`), splitting as symmetric (`LinearMap.BilinForm.IsSymm`,
  orthogonal type) plus alternating (`LinearMap.BilinForm.IsAlt`, symplectic type); their dimensions are the
  multiplicities `⟨Sym²χ, 1⟩` and `⟨Λ²χ, 1⟩`, and for irreducible `ρ` the total `⟨χ·χ, 1⟩` is `0` or `1`.
- **The trichotomy.** For irreducible `ρ` over `ℂ`, `ν₂(χ) ∈ {+1, 0, -1}`: it is `+1` iff `ρ` carries a
  nonzero invariant symmetric nondegenerate form (**orthogonal**, `ρ` realizable over `ℝ`), `-1` iff a
  nonzero invariant alternating nondegenerate form (**quaternionic/symplectic**), and `0` iff `χ ≠ χ̄`
  (**complex**, no nonzero invariant form). Prove each equivalence. Realizability over `ℝ` is the direction
  that must build a `Representation ℝ G W` whose scalar extension to `ℂ` recovers `ρ` from the symmetric
  invariant form, since Mathlib has no complexification of representations; state that construction as its
  own target rather than assuming it.
- **The involution-counting formula.** `#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`, summing over the irreducible
  characters; at `x = 1`, `#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)`, so the number of solutions of `g² = 1` (one
  plus the number of involutions) reads off the indicators and the degrees `χ(1)`.
- **Real characters and real classes.** `IsRealClass C`, a class with `g ∼ g⁻¹` (via `IsConj g g⁻¹`); the
  number of **real-valued** irreducible characters (rows of `characterTable` fixed by `starRingEnd ℂ`)
  equals the number of real conjugacy classes. The strictly real (`ν₂ = +1`) count refines this once the
  indicator is available: reals minus quaternionics is the signed involution count above.
- **The categorical mirror.** This is the finite-group form of the indicator whose pivotal/spherical
  categorical version lives in the [pivotal/spherical roadmap](../../PivotalSpherical/README.md); the two
  agree on `FDRep G` with its standard pivotal structure, and this layer is the arithmetic side of that
  correspondence.

### Layer 8: Frobenius groups and Frobenius's theorem

The character-theoretic companion to Burnside's `pᵃqᵇ` capstone (Layer 4) and the signature application of
induced characters. No character-free proof of Frobenius's theorem is known.

- **The Frobenius complement.** `IsFrobeniusComplement H` for `H : Subgroup G`: `H` proper and nontrivial,
  and a **trivial-intersection (T.I.) subgroup**, meeting each distinct conjugate trivially,
  `H ⊓ (g H g⁻¹) = ⊥` for `g ∉ H` (equivalently `H` malnormal). Then `G` is a **Frobenius group** with
  complement `H`.
- **The Frobenius kernel.** `frobeniusKernel H = {1} ∪ (G ∖ ⋃_g (g H g⁻¹))`, the identity together with the
  elements lying in no conjugate of `H`; a set of size `|G : H|`. That it is a **subgroup** is not
  elementary and is the content of the theorem.
- **Frobenius's theorem.** `frobeniusKernel H` is a **normal subgroup** `N`, and `N.IsComplement' H`, so
  `G = N ⋊ H` (`SemidirectProduct`, `Subgroup.IsComplement'`). This is the theorem with no known
  character-free proof.
- **The T.I.-set and exceptional-character machinery.** The proof rests on **T.I. sets** (`IsTISet`): a
  class function on `H` that vanishes off `H` induces isometrically (`Representation.ind` and the
  induced-character formula of the [induction-restriction roadmap](../InductionRestriction/README.md)), so
  differences `χᵢ - χⱼ` of irreducible characters of `H` of equal degree induce to virtual characters of
  `G` of norm `2`, the **exceptional characters**; assembling them exhibits a normal complement to `H`,
  which is `N`. Pin `IsTISet` and the induction isometry as the machinery and the theorem as its payoff.
- **Consequences and instances.** `|H| ∣ |N| - 1`, and `N` is nilpotent (Thompson; a downstream target,
  not proved here). The kernel-and-complement structure is the abstract form of the affine groups
  `𝔽_q ⋊ 𝔽_q^×` and the odd dihedral groups `D_n = C_n ⋊ C₂`.

### Layer 9: the representation theory of GL₂(𝔽_q)

Over `𝔽_q` (a `GaloisField p n`, or any `[Field F] [Fintype F]` with `q = Fintype.card F`), construct every
irreducible complex representation of `GL₂(𝔽_q) = GL (Fin 2) F` and assemble its character table. This is
the canonical worked family, and it consumes `Representation.ind` and the induced-character formula of the
[induction-restriction roadmap](../InductionRestriction/README.md).

- **The conjugacy classes.** Four families, read off the rational canonical form (`Matrix.charpoly`): the
  `q-1` **central** scalars `diag(a,a)`; the `½(q-1)(q-2)` **split semisimple** `diag(a,b)` with `a ≠ b`;
  the `q-1` **non-semisimple/unipotent** `[[a,1],[0,a]]`; and the `½q(q-1)` **elliptic/non-split** classes,
  whose eigenvalues are a conjugate pair `ξ, ξ^q` in `𝔽_{q²} ∖ 𝔽_q`. The total is
  `q²-1 = Nat.card (ConjClasses (GL (Fin 2) F))`, matching `#irreducibles`; the group order is
  `(q²-1)(q²-q)` (`Matrix.card_GL_field`).
- **The Borel and the principal series.** `GL2Borel`, the upper-triangular subgroup `B = T U` (split torus
  `T = diag`, unipotent radical `U`); a pair of characters `α, β : 𝔽_q^× → ℂ^×` inflates to a character of
  `B` through `T`, and `GL2PrincipalSeries α β = Ind_B^{GL₂}(α ⊗ β)` has dimension `q+1` (parabolic
  induction). It is **irreducible** iff `α ≠ β`, and `Ind_B(α β) ≅ Ind_B(β α)`, giving `½(q-1)(q-2)`
  irreducibles of dimension `q+1`.
- **The boundary: linear and Steinberg constituents.** When `α = β`, `Ind_B(α α)` is reducible of length
  two: the one-dimensional `α ∘ det` (a **degree-`1`** character, `q-1` of them) and the **Steinberg**
  constituent `GL2Steinberg` twisted by `α`, of dimension `q` (`q-1` of them). So `q-1` characters of
  dimension `1` and `q-1` of dimension `q`.
- **The cuspidal (discrete series) representations.** The non-split torus `𝔽_{q²}^× ↪ GL₂(𝔽_q)` (a degree-`2`
  `FiniteField.Extension`); a character `θ : 𝔽_{q²}^× → ℂ^×` with `θ^q ≠ θ` (not factoring through the norm)
  yields a **cuspidal** representation of dimension `q-1`, with `θ` and `θ^q` giving the same one, for
  `½q(q-1)` irreducibles of dimension `q-1`. These are exactly the irreducibles absent from every principal
  series.
- **The count and the table (acceptance criterion).** The tally
  `(q-1)·1² + (q-1)·q² + ½(q-1)(q-2)·(q+1)² + ½q(q-1)·(q-1)² = (q²-1)(q²-q) = |GL₂(𝔽_q)|`, and
  `#irreducibles = q²-1 = #classes`. The acceptance criterion is the full `(q²-1) × (q²-1)` character table
  with the four dimension families `1, q, q+1, q-1`, its rows orthonormal for `characterPairing`. Worked
  instances: `GL₂(𝔽_2) ≅ S₃`, and `GL₂(𝔽_3)` of order `48`.

---

## Worked examples (acceptance criteria), staged

Staged from rational to genuinely cyclotomic, so early milestones do not wait on the general lift:

- **Rational tables (first executable milestone).** Cyclic `C₂`; `S₃ ≅ DihedralGroup 3` (degrees
  `1,1,2`); `D₄ = DihedralGroup 4` and `Q₈ = QuaternionGroup 2` — the classic pair with the **same
  character table** (four degree-`1`, one degree-`2`) yet non-isomorphic, distinguished by the
  **Frobenius-Schur indicator** `ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` (`+1` for `D₄`, `-1` for `Q₈`), the same
  invariant [the pivotal/spherical roadmap](../../PivotalSpherical/README.md) defines categorically on
  `FDRep G`. All values in `ℤ`; only the rational lift is exercised.
- **Small cyclotomic (second milestone).** Cyclic `C₃` (table the `3rd`-root-of-unity matrix); `A₄`
  (degrees `1,1,1,3`, the linear characters taking cube-root-of-unity values) — exercises the
  quadratic/cubic lift and a nontrivial Galois orbit on rows.
- **Genuinely hard (final milestone).** `S₄` (degrees `1,1,2,3,3`, repeated nonlinear degrees, so row
  identification is nontrivial); `A₅` — irrational quadratic values `(1±√5)/2`, a nontrivial Galois
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
- **`GL₂(𝔽_q)` character tables (Layer 9).** `GL₂(𝔽_2) ≅ S₃` (degrees `1,1,2`, the principal/Steinberg/
  cuspidal families degenerating onto the small table) and `GL₂(𝔽_3)` of order `48` (degrees
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

- I. M. Isaacs, *Character Theory of Finite Groups*, AMS Chelsea (1976) — Layers 0-4: class functions and
  orthogonality (Ch. 2), central characters, primitive central idempotents, integrality of character
  values, `χ(1) ∣ |G|` (Ch. 3), Burnside's `pᵃqᵇ` theorem (Ch. 3, Thm 3.8); the Frobenius-Schur indicator
  and the real/complex/quaternionic classification (Ch. 4, Layer 7) and Frobenius groups via trivial-
  intersection sets and exceptional characters (Ch. 7, Thm 7.2, Layer 8).
- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977) — Part I: characters,
  orthogonality, the number of irreducibles equals the number of classes, the canonical decomposition;
  §13.2, the Frobenius-Schur indicator and the real/complex/quaternionic trichotomy (Layer 7).
- G. James, M. Liebeck, *Representations and Characters of Groups*, 2nd ed., CUP (2001) — the character
  table as a computational object, column orthogonality, and many worked small-group tables.
- C. W. Curtis, I. Reiner, *Methods of Representation Theory, Vol. I*, Wiley (1981) — the group algebra,
  its center, class sums, structure constants, the integral group ring, and the Wedderburn structure
  theory (Ch. 1-3).
- J. D. Dixon, *High speed computation of group characters*, Numer. Math. 10 (1967) 446-450 — the
  algorithm: class-multiplication matrices, the reduction to eigenvector computation over `ZMod p` with
  `p ≡ 1 (mod e)`, and the size bound making the cyclotomic lift unique.
- G. J. A. Schneider, *Dixon's character table algorithm revisited*, J. Symbolic Comput. 9 (1990)
  601-606 — the refinement (splitting eigenspaces along successive class-multiplication matrices) that
  the eigenvector search follows.
- W. Burnside, *Theory of Groups of Finite Order*, 2nd ed. (1911) — the `pᵃqᵇ` theorem and the
  central-character method.
- A. Hulpke, *Computational representation theory* (lecture notes; the GAP implementation of
  Dixon-Schneider) — the practical form of the algorithm and the reference point for what "compute a
  character table" means in Layer 6.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991) —
  the character table of `GL₂(𝔽_q)`, its conjugacy classes, principal series, and cuspidal representations,
  worked explicitly (Layer 9).
- C. Bonnafé, *Representations of `SL₂(𝔽_q)`*, Springer Algebra and Applications 13 (2011) — the conjugacy
  classes, the Borel and parabolic induction, and the cuspidal (discrete series) representations from the
  non-split torus, the model account for Layer 9.
- P. Deligne, G. Lusztig, *Representations of reductive groups over finite fields*, Ann. of Math. 103 (1976)
  103-161 — the general Deligne-Lusztig theory that the cuspidal series of Layer 9 specializes to `GL₂`.
