# Roadmap: representations of the symmetric group, Specht modules, and Schur-Weyl duality

Mathlib has the raw combinatorics of Young diagrams and the analytic core of finite-group representation
theory, but nothing that joins them into the representation theory of the symmetric group. It defines
`YoungDiagram` with its `transpose`, `row`/`col`, `rowLen`/`colLen`, and `rowLens` API
(`Combinatorics/Young/YoungDiagram.lean`), the `SemistandardYoungTableau` structure
(`Combinatorics/Young/SemistandardTableau.lean`), the number-theoretic `Nat.Partition n` with
`Fintype (Nat.Partition n)` (`Combinatorics/Enumerative/Partition/Basic.lean`), and the cycle-type map
`Equiv.Perm.cycleType` with `Equiv.Perm.partition σ : (Fintype.card α).Partition` and the classification
of conjugacy `partition_eq_of_isConj : IsConj σ τ ↔ σ.partition = τ.partition`
(`GroupTheory/Perm/Cycle/Type.lean`). It has the elementary, complete-homogeneous, power-sum, and
monomial symmetric functions, including their partition-indexed products `esymmPart`, `hsymmPart`,
`psumPart`, `msymm`, and the fundamental theorem `esymmAlgEquiv` and Newton's identities
(`RingTheory/MvPolynomial/Symmetric/*`). On the representation side it has `Representation`, the
permutation representation `Representation.ofMulAction` and its `Rep.ofMulAction` packaging, induction
along a group homomorphism `Representation.ind` (`RepresentationTheory/Induced.lean`), `FDRep` with
`FDRep.character` and `char_conj`, irreducibility `Representation.IsIrreducible` (with
`isIrreducible_iff_isSimpleModule`), Maschke's theorem `IsSemisimpleRing k[G]`, Schur's lemma, and the
first orthogonality relation `char_orthonormal`. The tensor-power infrastructure is present:
`PiTensorProduct` with `reindex`, `congr`, and `map`/`mapMonoidHom`, plus `TensorPower` and
`SymmetricPower`.

What Mathlib does **not** have is any of the theory that makes the symmetric group's representations
concrete and computable from diagrams. There is **no** bijection between `Nat.Partition n` and Young
diagrams of size `n` (the two combinatorial vocabularies are unconnected), **no** standard Young tableaux
(only semistandard), **no** dominance order on partitions, **no** Young subgroups or permutation modules
`M^λ`, **no** Young symmetrizers, **no** Specht modules, **no** proof that the Specht modules are a
complete set of irreducibles of `Sₙ`, **no** standard-tableaux basis and **no** hook-length formula,
**no** Murnaghan-Nakayama rule, **no** RSK correspondence, **no** Schur polynomials or Frobenius
characteristic map, and **no** Schur-Weyl duality. This is the highly combinatorial half of the
representation theory of finite groups, and almost all of it is missing.

This roadmap builds that theory, from the partition/tableau combinatorics up through the Specht module
classification, the hook-length dimension formula, the Murnaghan-Nakayama character rule, the RSK
correspondence, and Schur-Weyl duality between the commuting actions of `Sₙ` and `GLₔ` on `(ℂᵈ)^{⊗n}`.
It is the combinatorial engine for concrete character-table computations: the character tables of `S₃`
and `S₄` that [the character-theory roadmap](../CharacterTheory/README.md) computes by the
Dixon-Schneider algorithm are, for the symmetric groups, forced entirely by this combinatorics, and the
Murnaghan-Nakayama rule is a character-table method that roadmap names as a symmetric-group specialization.
Schur-Weyl duality connects it to [the classical-groups roadmap](../ClassicalGroups/README.md) (the Weyl
modules and Schur functors of `GLₔ`, Schur polynomials as their characters) and, through the
sign-twisted diagram algebras, to [the Temperley-Lieb roadmap](../../TemperleyLieb/README.md).

Suggested home: `TauCeti/RepresentationTheory/Symmetric/`, mirroring Mathlib's `RepresentationTheory/`
and `Combinatorics/Young/`.

## Standing conventions

- **The group.** `Sₙ` is `Equiv.Perm (Fin n)` throughout, never a private synonym; its group algebra is
  `MonoidAlgebra k (Equiv.Perm (Fin n))`, written `k[Sₙ]`. It is finite with `DecidableEq`, so every
  object below that is meant to be computed is a genuine `def` on that data. Conjugacy classes are
  `ConjClasses (Equiv.Perm (Fin n))`, indexed by cycle type via `Equiv.Perm.partition`.
- **The base field is `ℚ`, with `ℂ` as a specialization.** The symmetric group is **split over `ℚ`**:
  every irreducible complex representation of `Sₙ` is realizable over `ℚ`, and the Specht modules are the
  irreducibles already over `ℚ`. State the representation theory over `ℚ` (or over any field of
  characteristic `0`, and note where characteristic `p` behaves differently, which is the modular theory
  and out of scope here), and obtain the `ℂ`-statements by base change `ℂ ⊗_ℚ (-)`. Because the modules
  are absolutely irreducible over `ℚ`, `ℂ ⊗_ℚ S^λ` stays irreducible and non-isomorphic across `λ`, so
  the `ℚ`-classification is the `ℂ`-classification. Character values are integers (a sum of roots of unity
  fixed by all of `Gal`, since the classes are rational), so `spechtCharacter` is `ℤ`-valued.
- **Reuse Mathlib's combinatorial vocabulary.** Partitions are `Nat.Partition n`; diagrams are
  `YoungDiagram`; semistandard fillings are `SemistandardYoungTableau`; cycle types are
  `Equiv.Perm.cycleType`/`Equiv.Perm.partition`; symmetric functions are `MvPolynomial.esymm`,
  `hsymm`, `psum`, `msymm` and their partition-indexed products. The first target of Layer 0 is precisely
  to **connect** these vocabularies (partitions to diagrams to conjugacy classes), not to reinvent them.
- **The primary spine is the group algebra; `FDRep` is the categorical mirror.** As in
  [../CharacterTheory](../CharacterTheory/README.md), develop the theory on the module/algebra core
  `k[Sₙ] = MonoidAlgebra k (Equiv.Perm (Fin n))`, its modules, `Representation.character`, and
  `Representation.IsIrreducible`, because the Young symmetrizers and Specht modules are literally left
  ideals of `k[Sₙ]`. Keep the `FDRep`/`CategoryTheory.Simple` mirror in step through
  `isIrreducible_iff_isSimpleModule`, and state the classification in both languages. Permutation modules
  `M^λ` are `Rep.ofMulAction k Sₙ (Sₙ ⧸ youngSubgroup λ)`, reusing Mathlib's `ofMulAction`.
- **Tableaux are bijective fillings; keep the three tableau notions distinct.** A **λ-tableau** (used to
  build symmetrizers) is a bijection `↥μ.cells ≃ Fin n`; a **standard** Young tableau adds the row- and
  column-increasing conditions and is the object built here (Mathlib has only `SemistandardYoungTableau`);
  a **semistandard** Young tableau is Mathlib's existing structure, used for Schur polynomials and the
  `GLₔ` side. Name them `youngTableau`, `StandardYoungTableau`, `SemistandardYoungTableau` and never
  conflate them.
- **Schur-Weyl lives over `ℂ` on `PiTensorProduct`.** The `n`-th tensor power of `V = Fin d → ℂ` is
  `⨂[ℂ] (_ : Fin n), V`; the `Sₙ`-action is `PiTensorProduct.reindex` by a permutation, the
  `GLₔ`-action is `PiTensorProduct.map (fun _ => g)` (multiplicative via `PiTensorProduct.mapMonoidHom`),
  and the point is that these commute. Do not introduce a bespoke tensor-power type.

## What Mathlib already has (consume)

- **Young diagrams:** `Combinatorics/Young/YoungDiagram.lean` — `YoungDiagram` (a lower set of cells),
  `YoungDiagram.card`, `transpose` (with `transpose_transpose`, `transpose_le_iff`), `row`/`col`,
  `rowLen`/`colLen` (with `rowLen_transpose`, `colLen_transpose`, `rowLen_anti`), `rowLens`,
  `ofRowLens`, and `equivListRowLens : YoungDiagram ≃ {w : List ℕ // w.SortedGE ∧ ∀ x ∈ w, 0 < x}`.
- **Semistandard tableaux:** `Combinatorics/Young/SemistandardTableau.lean` —
  `SemistandardYoungTableau μ` (fields `entry`, `row_weak'`, `col_strict'`, `zeros'`), the coe to
  `ℕ → ℕ → ℕ`, and `SemistandardYoungTableau.highestWeight`.
- **Number partitions:** `Combinatorics/Enumerative/Partition/Basic.lean` — `Nat.Partition n` (a
  `Multiset ℕ` of positive parts summing to `n`), `Fintype (Nat.Partition n)`, `Nat.Partition.ofSym`,
  `ofSums`, and (`Partition/GenFun.lean`) the generating-function theory.
- **Cycle type and conjugacy:** `GroupTheory/Perm/Cycle/Type.lean` — `Equiv.Perm.cycleType`,
  `sum_cycleType`, `Equiv.Perm.partition σ : (Fintype.card α).Partition`, `parts_partition`,
  `isConj_iff_cycleType_eq`, and `partition_eq_of_isConj : IsConj σ τ ↔ σ.partition = τ.partition`.
- **The sign character:** `GroupTheory/Perm/Sign.lean` — `Equiv.Perm.sign : Perm α →* ℤˣ`, the source
  of the column antisymmetrizer and the sign representation `S^{(1ⁿ)}`.
- **Group algebra and permutation/induced representations:** `Algebra/MonoidAlgebra/*`
  (`MonoidAlgebra k G`), `RepresentationTheory/Basic.lean` (`Representation`,
  `Representation.ofMulAction`, `leftRegular`, `Representation.asModule`),
  `RepresentationTheory/Rep/Basic.lean` (`Rep`, `Rep.ofMulAction`, `Rep.trivial`),
  `RepresentationTheory/Induced.lean` (`Representation.ind`, `Rep.ind` along a `φ : G →* H`).
- **Irreducibility, characters, semisimplicity:** `RepresentationTheory/Irreducible.lean`
  (`Representation.IsIrreducible`, `isIrreducible_iff_isSimpleModule`),
  `RepresentationTheory/FDRep.lean` (`FDRep`, `FDRep.character`), `RepresentationTheory/Character.lean`
  (`char_conj`, `char_orthonormal`), `RepresentationTheory/Maschke.lean` (`IsSemisimpleRing k[G]`),
  and Schur's lemma (`finrank_hom_simple_simple`).
- **Symmetric functions:** `RingTheory/MvPolynomial/Symmetric/Defs.lean` — `MvPolynomial.esymm`,
  `hsymm`, `psum`, `msymm`, and the partition-indexed `esymmPart`, `hsymmPart`, `psumPart`;
  `Symmetric/FundamentalTheorem.lean` (`esymmAlgEquiv`, the fundamental theorem of symmetric
  polynomials); `Symmetric/NewtonIdentities.lean` (power sums in terms of `esymm`).
- **Tensor powers and general linear group:** `LinearAlgebra/PiTensorProduct.lean`
  (`⨂[R] i, s i`, `PiTensorProduct.tprod`, `reindex`, `congr`, `map`, `mapMonoidHom`),
  `LinearAlgebra/TensorPower/{Basic,Symmetric}.lean`, and
  `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` (`Matrix.GeneralLinearGroup n R`, notation `GL`).

## What is missing (build here)

The dictionary between `Nat.Partition n`, Young diagrams of size `n`, and `ConjClasses (Perm (Fin n))`;
the **dominance** and lexicographic orders on partitions; **standard Young tableaux** and their count
`f^λ`; **Young subgroups** and the **permutation modules `M^λ`** with their tabloid basis and the Young's
rule / Kostka multiplicities; **Young symmetrizers** `a_t`, `b_t`, `c_t` in `k[Sₙ]` and their idempotent
theory; the **Specht modules `S^λ`** as submodules of `M^λ` (equivalently left ideals `k[Sₙ] c_t`);
their **irreducibility** and the **completeness** theorem that `{S^λ}_{λ ⊢ n}` is a complete irredundant
set of irreducibles of `Sₙ` over `ℚ`; the **standard polytabloid basis** of `S^λ` and hence
`dim S^λ = f^λ`; the **hook-length formula** `f^λ = n! / ∏ hooks`; the **Murnaghan-Nakayama rule** for the
irreducible characters, with rim hooks and their heights; the **Frobenius characteristic map** and
**Schur polynomials** (defined combinatorially by semistandard tableaux and via **Jacobi-Trudi** as a
determinant of complete-homogeneous symmetric functions), and the identification of the Schur function as
the Frobenius image of the character `χ^λ`; the **RSK correspondence** (permutations, and words/matrices,
to pairs of tableaux) with the corollary `∑_λ (f^λ)² = n!`; and **Schur-Weyl duality**: the commuting
`Sₙ`- and `GLₔ`-actions on `(ℂᵈ)^{⊗n}`, the double-centralizer theorem, the **Schur functors** `𝕊^λ`,
and the multiplicity-free decomposition `(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)`. None of this
is upstream.

`Suggested.lean` pins the load-bearing objects (`partitionEquivYoungDiagram`,
`partitionEquivConjClasses`, `Dominates`, `StandardYoungTableau`, `youngSubgroup`, `permutationModule`,
`youngSymmetrizer`, `spechtModule`, `hookLength`, `spechtCharacter`, `rsk`, `schurPoly`,
`schurWeylDecomposition`) and the named milestones as `sorry`-targets, so each is individually claimable.

---

## The build, in layers

The ordering is the dependency order, not a strict schedule; independent lanes (RSK, Schur functions,
Schur-Weyl) can proceed in parallel once the Specht modules exist.

### Layer 0: partitions, diagrams, tableaux, and orders

- **The partition/diagram/class dictionary.** `partitionEquivYoungDiagram n : Nat.Partition n ≃ {μ :
  YoungDiagram // μ.card = n}`, sending a partition to the diagram with those row lengths (via
  `YoungDiagram.ofRowLens` and `equivListRowLens`), and its inverse reading `rowLens`. Then
  `partitionEquivConjClasses n : Nat.Partition n ≃ ConjClasses (Equiv.Perm (Fin n))`, factoring through
  `Equiv.Perm.partition` and `partition_eq_of_isConj`; this is the statement that conjugacy classes of
  `Sₙ` **are** partitions of `n`, and it fixes the common index set for characters, classes, and Specht
  modules. Prove `Fintype.card (ConjClasses (Perm (Fin n))) = Fintype.card (Nat.Partition n)`.
- **Orders on partitions.** The **dominance** partial order `Dominates μ ν` (`∀ k, ∑_{i<k} μᵢ ≥ ∑_{i<k}
  νᵢ`) and the lexicographic linear order, with `Dominates μ ν ↔ Dominates ν.transpose μ.transpose`
  (conjugation reverses dominance) and dominance refined by lex. This is the order in which the Specht
  modules appear in `M^λ` (the triangularity behind the classification).
- **Standard Young tableaux.** `StandardYoungTableau μ`: a `SemistandardYoungTableau`-style structure on
  a `YoungDiagram` whose entries are a bijection onto `Fin μ.card` that is strictly increasing along rows
  and down columns. Give the `Fintype` instance, the count `standardCount μ = Fintype.card
  (StandardYoungTableau μ)` (this is `f^λ`), and the two involutions (transpose of a tableau,
  Schützenberger evacuation) as basic API.
- **λ-tableaux and their row/column groups.** A `youngTableau μ` is a bijection `↥μ.cells ≃ Fin n`. Its
  **row group** `rowSubgroup t` and **column group** `colSubgroup t` are the subgroups of `Sₙ`
  preserving, respectively, the rows and the columns of `t`; `rowSubgroup t ∩ colSubgroup t = ⊥`, and
  `rowSubgroup t ≅ ∏ᵢ Perm (row i)`.

### Layer 1: Young subgroups and the permutation modules `M^λ`

- **Young subgroups.** `youngSubgroup μ : Subgroup (Equiv.Perm (Fin n))`, the stabilizer of the ordered
  set partition of `Fin n` into consecutive blocks of sizes `μ₁, μ₂, …`; `youngSubgroup μ ≅ ∏ᵢ Perm (Fin
  μᵢ)`, with `Nat.card (youngSubgroup μ) = ∏ᵢ (μᵢ)!` and index `n! / ∏ᵢ (μᵢ)!`. Any row group `rowSubgroup
  t` is conjugate to `youngSubgroup μ`.
- **The permutation module.** `permutationModule μ = Rep.ofMulAction ℚ (Perm (Fin n)) (Perm (Fin n) ⧸
  youngSubgroup μ)`, the module `M^λ` on the **λ-tabloids** (cosets); `finrank ℚ (permutationModule μ) =
  n! / ∏ᵢ (μᵢ)!`, the multinomial coefficient. Its character is the permutation character; identify
  `M^λ ≅ Ind_{Sλ}^{Sₙ} 1` via `Rep.ind` and prove the two descriptions agree.
- **Young's rule (Kostka multiplicities).** The multiplicity of `S^λ` in `M^μ` is the **Kostka number**
  `Kλμ`, the number of semistandard tableaux of shape `λ` and content `μ`; in particular `M^μ = S^μ ⊕
  ⊕_{λ ▷ μ} Kλμ S^λ` with `Kμμ = 1`, the triangularity (with respect to dominance) that drives the
  classification. State `Kλμ` combinatorially with `SemistandardYoungTableau` and prove the base cases
  `M^{(n)} = S^{(n)}` (trivial) and `M^{(1ⁿ)} = ℚ[Sₙ]` (regular).

### Layer 2: Young symmetrizers

- **Row, column, and Young symmetrizers.** For a `youngTableau t`, the row symmetrizer `a_t = ∑_{p ∈
  rowSubgroup t} p`, the column antisymmetrizer `b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using
  `Equiv.Perm.sign`), and the **Young symmetrizer** `youngSymmetrizer t = c_t = a_t * b_t`, all in
  `MonoidAlgebra ℚ (Perm (Fin n))`.
- **Idempotent theory.** `c_t` is essentially idempotent: `c_t * c_t = (n! / f^λ) • c_t`, so
  `(f^λ / n!) • c_t` is an idempotent. Prove `a_t`, `b_t` are (up to scalar) idempotents, the absorption
  `p * a_t = a_t` for `p ∈ rowSubgroup t` and `b_t * q = sign(q) • b_t` for `q ∈ colSubgroup t`, and the
  key vanishing lemma: `a_t * σ * b_t = 0` unless `σ ∈ rowSubgroup t · colSubgroup t`. These are the
  facts that make `k[Sₙ] c_t` irreducible.

### Layer 3: the Specht modules `S^λ`

- **Polytabloids and the Specht module.** For a `youngTableau t`, the **polytabloid** `e_t = b_t · {t} ∈
  M^λ` (the column antisymmetrization of its tabloid). The **Specht module** `spechtModule μ` is the
  submodule of `permutationModule μ` spanned by all polytabloids `{e_t : t a λ-tableau}`, a
  subrepresentation. Prove the isomorphism with the left ideal `k[Sₙ] c_t` (so both presentations are
  available), and that `spechtModule` is finite-dimensional; package it as an `FDRep ℚ (Perm (Fin n))`.
- **The submodule theorem (James).** For any submodule `U ≤ M^λ`, either `S^λ ≤ U` or `U ≤ (S^λ)^⊥`
  (the orthogonal under the tabloid bilinear form). This is the engine of irreducibility, and it is worth
  building for its own sake as the tabloid-form API.

### Layer 4: completeness and irreducibility (the classification)

- **Irreducibility.** Over `ℚ` (characteristic `0`), each `spechtModule μ` is irreducible:
  `(spechtModule μ).ρ.IsIrreducible`, equivalently `CategoryTheory.Simple (spechtModule μ)`, from the
  submodule theorem and `⟨e_t, e_t⟩ ≠ 0`. They are absolutely irreducible (`End = ℚ`), so `ℂ ⊗ S^λ`
  stays irreducible.
- **Distinctness and completeness.** `spechtModule μ ≅ spechtModule ν ↔ μ = ν` (via the dominance
  triangularity of Young's rule), and **every** simple `FDRep ℚ (Perm (Fin n))` is isomorphic to some
  `spechtModule μ`. Combining with `partitionEquivConjClasses` and #irreducibles = #classes (imported
  from [../CharacterTheory](../CharacterTheory/README.md)), `μ ↦ spechtModule μ` is a **bijection**
  from `Nat.Partition n` to the isomorphism classes of irreducibles. State the `ℂ`-corollary: the
  irreducible complex characters of `Sₙ` are exactly `{χ^λ}_{λ ⊢ n}`.
- **The named small irreducibles.** `S^{(n)}` is the trivial representation, `S^{(1ⁿ)}` is the sign
  representation `Perm.sign`, and `S^{(n-1,1)}` is the `(n-1)`-dimensional standard representation
  (`M^{(n-1,1)} = triv ⊕ standard`). Prove these identifications.

### Layer 5: the standard basis and the hook-length formula

- **The standard basis.** The polytabloids `{e_t : t ∈ StandardYoungTableau μ}` form a basis of
  `spechtModule μ`: `Basis (StandardYoungTableau μ) ℚ (spechtModule μ)`. Hence `finrank ℚ (spechtModule
  μ) = standardCount μ = f^λ`. The proof is the straightening algorithm (Garnir relations expressing an
  arbitrary polytabloid in the standard ones), which is itself a target.
- **Hook lengths and the formula.** `hookLength μ c` for a cell `c ∈ μ.cells` (arm + leg + 1), and the
  **hook-length formula** `f^λ · ∏_{c ∈ μ.cells} hookLength μ c = n!`, i.e. `finrank ℚ (spechtModule μ)
  = n! / ∏ hooks`. Prove it (e.g. via the Frobenius determinant formula for `f^λ`, or the probabilistic
  hook-walk); state also `∑_{λ ⊢ n} (f^λ)² = n!` as a consequence of Layer 7's RSK (and cross-check that
  it equals `finrank ℚ[Sₙ] = n!`).

### Layer 6: characters and the Murnaghan-Nakayama rule

- **The Specht character.** `spechtCharacter μ : Equiv.Perm (Fin n) → ℤ`, the character of `spechtModule
  μ` (values are integers since `Sₙ`'s classes are rational); it depends only on the cycle type, so it
  descends to a function `Nat.Partition n → ℤ` via `partitionEquivConjClasses`. Assemble the **character
  table of `Sₙ`** as `Matrix (Nat.Partition n) (Nat.Partition n) ℤ`, `X λ μ = χ^λ(cycle type μ)`, and
  prove it satisfies the `IsCharacterTableSpec` of [../CharacterTheory](../CharacterTheory/README.md)
  (orthogonality with the class sizes `n! / z_μ`, where `z_μ = ∏ i^{mᵢ} mᵢ!`).
- **Rim hooks and Murnaghan-Nakayama.** A **rim hook** (border strip) of a diagram is a connected
  skew shape containing no `2×2` block; its **height** is one less than its number of rows. The
  **Murnaghan-Nakayama rule**: for `σ` with a cycle of length `r`, writing `μ ∖ ρ` for the diagrams
  obtained by removing a rim hook `ρ` of size `r`,
  `χ^λ(σ) = ∑_{ρ} (-1)^{height ρ} · χ^{λ ∖ ρ}(σ')`, where `σ'` is `σ` with that `r`-cycle deleted. This
  recursion **computes** the whole character table from the empty diagram; prove it, and derive the
  special cases: value at the identity is `f^λ` (Layer 5), value of `χ^{(1ⁿ)}` is `sign`, and the
  Frobenius formula below.

### Layer 7: symmetric functions, the Frobenius characteristic, and RSK

- **Schur polynomials.** `schurPoly μ : MvPolynomial σ ℤ`, defined combinatorially as `∑_{T} x^{content
  T}` over `SemistandardYoungTableau` of shape `μ`, and equally by **Jacobi-Trudi**
  `schurPoly μ = det (hsymm (μᵢ - i + j))ᵢⱼ` (a determinant of complete-homogeneous symmetric functions,
  reusing `MvPolynomial.hsymm`). Prove the two definitions agree, that `schurPoly` is symmetric, and the
  dual (transpose) Jacobi-Trudi with `esymm`. The Schur functions are a `ℤ`-basis of the symmetric
  functions; `msymm`-to-`schurPoly` change of basis is the Kostka matrix `Kλμ` of Layer 1.
- **The Frobenius characteristic.** The isometry `ch` from class functions of `Sₙ` (with the character
  inner product) to degree-`n` symmetric functions (with the Hall inner product) sending `χ^λ ↦ schurPoly
  λ`, so `ch(χ^λ) = s_λ` and the power-sum expansion `p_μ = ∑_λ χ^λ(μ) s_λ` **is** the character table.
  This ties Layer 6 to Schur functions and gives a second route to Murnaghan-Nakayama (Pieri/Newton).
- **RSK.** The **Robinson-Schensted-Knuth** correspondence `rsk n : Equiv.Perm (Fin n) ≃ Σ μ :
  Nat.Partition n, StandardYoungTableau (diagram μ) × StandardYoungTableau (diagram μ)`, a bijection
  between permutations and pairs of standard tableaux of the same shape, built by row insertion; and its
  generalization to words and to `ℕ`-matrices ↔ pairs of semistandard tableaux (the identity behind the
  Cauchy identity `∏ (1 - xᵢyⱼ)⁻¹ = ∑_λ s_λ(x) s_λ(y)`). Corollaries: `∑_{λ ⊢ n} (f^λ)² = n!` (Layer 5),
  the symmetry `rsk (σ⁻¹)` swaps the two tableaux, and the longest-increasing-subsequence interpretation
  of the first row.

### Layer 8: Schur-Weyl duality

- **The two commuting actions.** On `tensorSpace d n = ⨂[ℂ] (_ : Fin n), (Fin d → ℂ)`, the symmetric
  group acts by permuting tensor factors, `permAction d n : Perm (Fin n) →* (tensorSpace d n ≃ₗ[ℂ]
  tensorSpace d n)` via `PiTensorProduct.reindex`, and `GLₔ = GL (Fin d) ℂ` acts diagonally,
  `glAction d n g = PiTensorProduct.map (fun _ => g)`, multiplicative via `PiTensorProduct.mapMonoidHom`.
  **They commute:** `Commute (permAction … σ) (glAction … g)`, because `reindex` and a diagonal `map`
  commute.
- **The double centralizer.** The images of `ℂ[Sₙ]` and of `ℂ[GLₔ]` in `End (tensorSpace d n)` are each
  other's centralizers (full mutual commutant), a case of the double-centralizer theorem for the
  semisimple algebra `ℂ[Sₙ]`. This is the structural heart; state it as an algebra statement about the
  two subalgebras of `End`.
- **The decomposition and Schur functors.** As an `Sₙ × GLₔ`-representation,
  `tensorSpace d n ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)`, where the **Schur functor** `𝕊^λ V = (V^{⊗n})
  ⊗_{ℂ[Sₙ]} S^λ` (equivalently the image of `c_t` acting on `V^{⊗n}`) is the irreducible polynomial
  `GLₔ`-representation of highest weight `λ`, with `dim 𝕊^λ(ℂᵈ) = schurPoly μ (1,…,1)` (`d` ones) and
  character `schurPoly`. The special cases `𝕊^{(n)} = Symⁿ` and `𝕊^{(1ⁿ)} = ⋀ⁿ` connect to Mathlib's
  `SymmetricPower` and exterior powers. This is the link to
  [../ClassicalGroups](../ClassicalGroups/README.md), where the `𝕊^λ` are the Weyl modules and
  `schurPoly` their characters.

---

## Worked examples (acceptance criteria)

- **`S₃` Specht modules recover the `S₃` table.** The three partitions of `3` give `S^{(3)}` (trivial,
  dim `1`), `S^{(2,1)}` (standard, dim `2`), `S^{(1,1,1)}` (sign, dim `1`); degrees `1, 1, 2` and the
  character table match [../CharacterTheory](../CharacterTheory/README.md)'s table for `S₃ ≅ DihedralGroup
  3`, computed there by Dixon-Schneider. `∑ (dim)² = 1 + 1 + 4 = 6 = 3!`.
- **`S₄` Specht modules recover the `S₄` table.** The five partitions of `4` give degrees `f^{(4)} = 1`,
  `f^{(3,1)} = 3`, `f^{(2,2)} = 2`, `f^{(2,1,1)} = 3`, `f^{(1^4)} = 1`, i.e. `{1, 1, 2, 3, 3}`, matching
  the `S₄` character table in [../CharacterTheory](../CharacterTheory/README.md); the two degree-`3`
  modules `S^{(3,1)}` and `S^{(2,1,1)} = S^{(3,1)} ⊗ sign` are distinguished as there. `∑ (dim)² = 1 + 9
  + 4 + 9 + 1 = 24 = 4!`.
- **Hook-length dimensions for partitions of `4` and `5`.** `#eval`-check `finrank ℚ (spechtModule μ) =
  n! / ∏ hooks` against: `n = 4` gives `1, 3, 2, 3, 1` (sum of squares `24`); `n = 5` gives `f^{(5)}=1`,
  `f^{(4,1)}=4`, `f^{(3,2)}=5`, `f^{(3,1,1)}=6`, `f^{(2,2,1)}=5`, `f^{(2,1,1,1)}=4`, `f^{(1^5)}=1` (sum of
  squares `1+16+25+36+25+16+1 = 120 = 5!`). Each equals `standardCount μ` and the number of terms in the
  standard basis of `spechtModule μ`.
- **Schur-Weyl on `(ℂ²)^{⊗2}`.** With `d = 2, n = 2`, only `(2)` and `(1,1)` have `ℓ(λ) ≤ 2`, so
  `(ℂ²)^{⊗2} ≅ S^{(2)} ⊗ Sym²(ℂ²) ⊕ S^{(1,1)} ⊗ ⋀²(ℂ²)`; the `S₂`-action is symmetric/antisymmetric,
  `𝕊^{(2)}(ℂ²) = Sym²(ℂ²)` has dimension `3`, `𝕊^{(1,1)}(ℂ²) = ⋀²(ℂ²)` has dimension `1`, and `1·3 + 1·1 =
  4 = 2²`. Verify the two actions commute and the decomposition holds.

## Ordering

Layer 0 (the dictionary, orders, standard tableaux, λ-tableaux) is the foundation everything rests on and
comes first; the `partitionEquivConjClasses` bijection is a prerequisite for every character statement.
Layer 1 (Young subgroups, `M^λ`, Young's rule) and Layer 2 (Young symmetrizers) are independent lanes off
Layer 0. Layer 3 (Specht modules, submodule theorem) needs Layers 1-2; Layer 4 (irreducibility,
completeness) needs Layer 3 and imports #irreducibles = #classes from
[../CharacterTheory](../CharacterTheory/README.md). Layer 5 (standard basis, hook length) needs Layer 3's
Specht modules and Layer 0's standard tableaux. Layer 6 (characters, Murnaghan-Nakayama) needs Layers 4-5
and connects back to the character table of [../CharacterTheory](../CharacterTheory/README.md). Layer 7
(Schur functions, Frobenius characteristic, RSK) needs the characters of Layer 6 for the Frobenius map,
but the RSK bijection and Schur polynomials can be built in parallel from Layer 0. Layer 8 (Schur-Weyl)
needs Layers 3-4 (Specht modules and their irreducibility) and Layer 7 (Schur polynomials as `GLₔ`
characters), and is the point of contact with [../ClassicalGroups](../ClassicalGroups/README.md). A
contributor can finish Layers 0-5 (the Specht classification and hook-length dimensions, enough for the
`S₃`/`S₄` acceptance criteria) well before the Murnaghan-Nakayama rule or Schur-Weyl duality.

## References

- G. D. James, *The Representation Theory of the Symmetric Groups*, Lecture Notes in Mathematics 682,
  Springer (1978) — Layers 1-5: tabloids, permutation modules `M^λ`, polytabloids, the submodule theorem,
  the Specht modules, the standard basis, and the classification over a field of any characteristic (we
  take characteristic `0`).
- W. Fulton, *Young Tableaux*, London Mathematical Society Student Texts 35, CUP (1997) — Layers 0, 7, 8:
  Young diagrams and tableaux, RSK, the Littlewood-Richardson rule, Schur polynomials, and the Schur
  functors / Schur-Weyl construction.
- B. E. Sagan, *The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions*,
  2nd ed., Graduate Texts in Mathematics 203, Springer (2001) — Layers 2-7: Young symmetrizers, the Specht
  modules, the hook-length formula, the Murnaghan-Nakayama rule, RSK, and the Frobenius characteristic.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Graduate Texts in Mathematics 129,
  Springer (1991) — Lectures 4, 6: Young symmetrizers and the Specht construction over `ℂ`, and (Lecture
  6, Appendix) Schur-Weyl duality and the Schur functors of `GLₔ`.
- I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., Oxford (1995) — Layer 7: Schur
  functions, Jacobi-Trudi, the Hall inner product, the Frobenius characteristic, and the Cauchy identity.
</content>
</invoke>
