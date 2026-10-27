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
`Representation.irreducible_iff_isSimpleModule_asModule`), Maschke's theorem `IsSemisimpleRing k[G]`, Schur's lemma, and the
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
representation theory of finite groups. The native Tau Ceti suppliers below already
implement much of this foundation; this roadmap completes and connects the full theory.

This roadmap builds that theory, from the partition/tableau combinatorics up through the Specht module
classification, the hook-length dimension formula, the Murnaghan-Nakayama character rule, the RSK
correspondence, and Schur-Weyl duality between the commuting actions of `Sₙ` and `GLₔ` on `(ℂᵈ)^{⊗n}`.
It is the combinatorial engine for concrete character-table computations: the character tables of `S₃`
and `S₄` that [the character-theory roadmap](../CharacterTheory/README.md) computes by the
Dixon-Schneider algorithm are, for the symmetric groups, forced entirely by this combinatorics, and the
Murnaghan-Nakayama rule is a character-table method that roadmap names as a symmetric-group specialization.
Schur-Weyl duality connects it to [the classical-groups roadmap](../ClassicalGroups/README.md) (the Weyl
modules and Schur functors of `GLₔ`, Schur polynomials as their characters) and, through the Brauer algebra
of Layer 9 (whose planar pairing diagrams form the Temperley-Lieb subalgebra), to
[the Temperley-Lieb roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58).

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
  and out of scope here), and obtain the `ℂ`-statements by base change `ℂ ⊗_ℚ (-)`.
  **Absolute irreducibility is a genuine milestone, not a corollary of rational character values.** Being
  irreducible over `ℚ` does not by itself force absolute irreducibility, and rational character values do
  not force Schur index `1`; the content is the endomorphism-ring statement `End_{ℚ[Sₙ]} S^λ ≅ ℚ` (Layer 4),
  proved from the integral standard-polytabloid structure. Once `End_{ℚ[Sₙ]} S^λ ≅ ℚ` is in hand,
  `ℂ ⊗_ℚ S^λ` stays irreducible and non-isomorphic across `λ`, so the `ℚ`-classification is the
  `ℂ`-classification. Character values are then integers (a sum of roots of unity fixed by all of `Gal`,
  since the classes are rational), so `spechtCharacter` is `ℤ`-valued.
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
  `Representation.irreducible_iff_isSimpleModule_asModule`, and state the classification in both languages. Permutation modules
  `M^λ` are `Rep.ofMulAction k Sₙ (Sₙ ⧸ youngSubgroup λ)`, reusing Mathlib's `ofMulAction`.
- **Tableaux are bijective fillings; keep the three tableau notions distinct.** Index every tableau notion
  by a `YoungDiagram μ` and tie the size to `μ.card`, so no free `n` floats loose from the diagram. A
  **λ-tableau** (used to build symmetrizers) is a bijection `↥μ.cells ≃ Fin μ.card`, and the symmetric group
  acting on it is `Perm (Fin μ.card)`; a **standard** Young tableau adds the row- and column-increasing
  conditions and is the object built here (Mathlib has only `SemistandardYoungTableau`); a **semistandard**
  Young tableau is Mathlib's existing structure, used for Schur polynomials and the `GLₔ` side. Name them
  `YoungTableau`, `StandardYoungTableau`, `SemistandardYoungTableau` and never conflate them.
- **Schur-Weyl lives over `ℂ` on `PiTensorProduct`.** The `n`-th tensor power of `V = Fin d → ℂ` is
  `⨂[ℂ] (_ : Fin n), V`; the `Sₙ`-action is `PiTensorProduct.reindex` by a permutation, the
  `GLₔ`-action is `PiTensorProduct.map (fun _ => g)` (multiplicative via `PiTensorProduct.mapMonoidHom`),
  and the point is that these commute. Do not introduce a bespoke tensor-power type.

## What Mathlib already has (consume)

- **Young diagrams:** `Combinatorics/Young/YoungDiagram.lean` - `YoungDiagram` (a lower set of cells),
  `YoungDiagram.card`, `transpose` (with `transpose_transpose`, `transpose_le_iff`), `row`/`col`,
  `rowLen`/`colLen` (with `rowLen_transpose`, `colLen_transpose`, `rowLen_anti`), `rowLens`,
  `ofRowLens`, and `equivListRowLens : YoungDiagram ≃ {w : List ℕ // w.SortedGE ∧ ∀ x ∈ w, 0 < x}`.
- **Semistandard tableaux:** `Combinatorics/Young/SemistandardTableau.lean` -
  `SemistandardYoungTableau μ` (fields `entry`, `row_weak'`, `col_strict'`, `zeros'`), the coe to
  `ℕ → ℕ → ℕ`, and `SemistandardYoungTableau.highestWeight`.
- **Number partitions:** `Combinatorics/Enumerative/Partition/Basic.lean` - `Nat.Partition n` (a
  `Multiset ℕ` of positive parts summing to `n`), `Fintype (Nat.Partition n)`, `Nat.Partition.ofSym`,
  `ofSums`, and (`Partition/GenFun.lean`) the generating-function theory.
- **Cycle type and conjugacy:** `GroupTheory/Perm/Cycle/Type.lean` - `Equiv.Perm.cycleType`,
  `sum_cycleType`, `Equiv.Perm.partition σ : (Fintype.card α).Partition`, `parts_partition`,
  `isConj_iff_cycleType_eq`, and `partition_eq_of_isConj : IsConj σ τ ↔ σ.partition = τ.partition`.
- **The sign character:** `GroupTheory/Perm/Sign.lean` - `Equiv.Perm.sign : Perm α →* ℤˣ`, the source
  of the column antisymmetrizer and the sign representation `S^{(1ⁿ)}`.
- **Group algebra and permutation/induced representations:** `Algebra/MonoidAlgebra/*`
  (`MonoidAlgebra k G`), `RepresentationTheory/Basic.lean` (`Representation`,
  `Representation.ofMulAction`, `leftRegular`, `Representation.asModule`),
  `RepresentationTheory/Rep/Basic.lean` (`Rep`, `Rep.ofMulAction`, `Rep.trivial`),
  `RepresentationTheory/Induced.lean` (`Representation.ind`, `Rep.ind` along a `φ : G →* H`).
- **Irreducibility, characters, semisimplicity:** `RepresentationTheory/Irreducible.lean`
  (`Representation.IsIrreducible`, `Representation.irreducible_iff_isSimpleModule_asModule`),
  `RepresentationTheory/FDRep.lean` (`FDRep`, `FDRep.character`), `RepresentationTheory/Character.lean`
  (`char_conj`, `char_orthonormal`), `RepresentationTheory/Maschke.lean` (`IsSemisimpleRing k[G]`),
  and Schur's lemma (`finrank_hom_simple_simple`).
- **Symmetric functions:** `RingTheory/MvPolynomial/Symmetric/Defs.lean` - `MvPolynomial.esymm`,
  `hsymm`, `psum`, `msymm`, and the partition-indexed `esymmPart`, `hsymmPart`, `psumPart`;
  `Symmetric/FundamentalTheorem.lean` (`esymmAlgEquiv`, the fundamental theorem of symmetric
  polynomials); `Symmetric/NewtonIdentities.lean` (power sums in terms of `esymm`).
- **Tensor powers and general linear group:** `LinearAlgebra/PiTensorProduct.lean`
  (`⨂[R] i, s i`, `PiTensorProduct.tprod`, `reindex`, `congr`, `map`, `mapMonoidHom`),
  `LinearAlgebra/TensorPower/{Basic,Symmetric}.lean`, and
  `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` (`Matrix.GeneralLinearGroup n R`, notation `GL`).

## Native suppliers and remaining construction

Consume the pinned Tau Ceti partition/diagram/class dictionary, dominance and conjugation,
standard and bounded semistandard tableaux, Young subgroups and permutation modules,
Young symmetrizers, Specht modules with their standard basis and complex scalar extension,
hook-length formula, integral characters and sum-of-squares theorem. The native finite Schur
and insertion suppliers are listed in Layer 7. These existing carriers are the inputs to all
new interfaces; the layer descriptions specify the mathematical API regardless of which targets
already have implementations.

Build the shared skew-tableau and Littlewood–Richardson development, stable symmetric-function
ring and Hall pairing, the power-sum formula for the native Frobenius characteristic,
full RSK, Schur–Weyl decompositions, and Brauer diagram algebra and duality.
Consume native tensor-power actions, double centralizers and faithfulness in Layer 8.
The native Schur-functor image is owned by ClassicalGroups Layer 2.
The representation plumbing is itself a target: scalar extension and character comparison
under `ℂ ⊗_ℚ (-)` in Layers 3–4, idempotent-generated invariant ranges and left ideals in
Layers 2–3 and 8, and image-subalgebra centralizer/bicommutant APIs in Layers 8–9.

`Suggested.lean` consumes native carriers and pins suggested forms for the new interfaces;
it is not an exhaustive checklist. The markdown remains definitive.

---

## The build, in layers

The ordering is the dependency order, not a strict schedule; independent lanes (RSK, Schur functions,
Schur-Weyl) can proceed in parallel once the Specht modules exist.

### Layer 0: partitions, diagrams, tableaux, and orders

- **The partition/diagram/class dictionary.** `partitionEquivYoungDiagram n : Nat.Partition n ≃ {μ :
  YoungDiagram // μ.card = n}`, sending a partition to the diagram with those row lengths. The multiset-to-
  sorted-list step is a named sub-milestone in its own right, not hidden inside the equivalence:
  `Nat.Partition n ≃ {w : List ℕ // w.SortedGE ∧ (∀ x ∈ w, 0 < x) ∧ w.sum = n}` (sorting the multiset of
  parts, with the positivity and sum bookkeeping), then compose with `YoungDiagram.equivListRowLens`; the
  inverse reads `rowLens`. Then
  `partitionEquivConjClasses n : Nat.Partition n ≃ ConjClasses (Equiv.Perm (Fin n))`, factoring through
  `Equiv.Perm.partition` and `partition_eq_of_isConj`; this is the statement that conjugacy classes of
  `Sₙ` **are** partitions of `n`, and it fixes the common index set for characters, classes, and Specht
  modules. Prove `Fintype.card (ConjClasses (Perm (Fin n))) = Fintype.card (Nat.Partition n)`.
- **Orders on partitions.** The **dominance** partial order `Dominates μ ν`, read "`μ` dominates `ν`",
  meaning `∀ k, ∑_{i<k} μᵢ ≥ ∑_{i<k} νᵢ` (partial sums of `μ` are pointwise at least those of `ν`), and the
  lexicographic linear order refining it. Conjugation of partitions **reverses** dominance: with the partition
  transpose `μᵀ` (`conjugate μ`, read off the transposed diagram), `Dominates μ ν ↔ Dominates νᵀ μᵀ`. Example:
  `(3,1)` dominates `(2,2)`, and since `(2,2)ᵀ = (2,2)` and `(3,1)ᵀ = (2,1,1)`, `(2,2)` dominates `(2,1,1)`.
  This is the order in which the Specht modules appear in `M^λ` (the triangularity behind the classification).
- **Standard Young tableaux.** `StandardYoungTableau μ`: a `SemistandardYoungTableau`-style structure on
  a `YoungDiagram` whose entries are a bijection onto `Fin μ.card` that is strictly increasing along rows
  and down columns. Give the `Fintype` instance, the count `standardCount μ = Fintype.card
  (StandardYoungTableau μ)` (this is `f^λ`), and the tableau transpose as basic API. The basic API includes shape, entries, row/column monotonicity, transpose, and `Fintype`.
  Schützenberger evacuation and its involutivity are targets in Layer 7.
- **λ-tableaux and their row/column groups.** A `YoungTableau μ` is a bijection `↥μ.cells ≃ Fin μ.card`. Its
  **row group** `rowSubgroup t` and **column group** `colSubgroup t` are the subgroups of `Perm (Fin μ.card)`
  preserving, respectively, the rows and the columns of `t`; `rowSubgroup t ∩ colSubgroup t = ⊥`, and
  `rowSubgroup t ≅ ∏ᵢ Perm (row i)`.

### Layer 1: Young subgroups and the permutation modules `M^λ`

- **Young subgroups.** `youngSubgroup μ : Subgroup (Equiv.Perm (Fin n))`, the stabilizer of the ordered
  set partition of `Fin n` into consecutive blocks of sizes `μ₁, μ₂, …`; `youngSubgroup μ ≅ ∏ᵢ Perm (Fin
  μᵢ)`, with `Nat.card (youngSubgroup μ) = ∏ᵢ (μᵢ)!` and index `n! / ∏ᵢ (μᵢ)!`. Any row group `rowSubgroup
  t` is conjugate to `youngSubgroup μ`.
- **The permutation module.** `permutationModule μ = Rep.ofMulAction ℚ (Perm (Fin n)) (Perm (Fin n) ⧸
  youngSubgroup μ)`, the module `M^λ` on the **λ-tabloids** (the **left** cosets, on which `Sₙ` acts by left
  multiplication -- Mathlib's `_ ⧸ _` quotient and `Rep.ofMulAction` are both the left-coset/left-action
  convention, and the whole layer is fixed to that convention); `finrank ℚ (permutationModule μ) =
  n! / ∏ᵢ (μᵢ)!`, the multinomial coefficient. Its character is the permutation character; identify
  `M^λ ≅ Ind_{Sλ}^{Sₙ} 1` via `Rep.ind` along the inclusion `youngSubgroup μ ↪ Perm (Fin n)`, and prove the
  two descriptions agree.
- **Kostka numbers and the tabloid combinatorics (early form).** Define the **Kostka number** `Kλμ`
  combinatorially as the number of semistandard tableaux of shape `λ`-diagram and content `μ`, with
  `Kμμ = 1` and `Kλμ = 0` unless `Dominates λ μ`; and the base cases
  `M^{(n)} = S^{(n)}` (trivial) and `M^{(1ⁿ)} = ℚ[Sₙ]` (regular). At this stage only the combinatorial `Kλμ`
  and the dominance shape of the tabloid/homomorphism filtration are available: the **multiplicity of `S^λ`
  in `M^μ`** cannot be stated yet, since the Specht modules `S^λ` are constructed only in Layer 3 and their
  irreducibility only in Layer 4. **Young's rule proper** -- `M^μ = S^μ ⊕ ⊕_{λ ▷ μ} Kλμ S^λ` as the
  multiplicity statement -- is a target in Layer 4.

### Layer 2: Young symmetrizers

- **Row, column, and Young symmetrizers.** For a `YoungTableau t`, the row symmetrizer `a_t = ∑_{p ∈
  rowSubgroup t} p`, the column antisymmetrizer `b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using
  `Equiv.Perm.sign`), and the **Young symmetrizer** `youngSymmetrizer t = c_t = a_t * b_t`, all in
  `MonoidAlgebra ℚ (Perm (Fin μ.card))`. Fix the product convention `c_t = a_t * b_t`; on a left module it applies
  the column antisymmetrizer first, then the row symmetrizer. The opposite ordering
  `b_t * a_t` gives an isomorphic same-shape Specht module in characteristic zero;
  Layer 3 pins the ideal/polytabloid comparison for the chosen product.
- **Idempotent theory.** `c_t` is essentially idempotent: `c_t * c_t = (n! / f^λ) • c_t`, so
  `(f^λ / n!) • c_t` is an idempotent. Prove `a_t`, `b_t` are (up to scalar) idempotents, the absorption
  `p * a_t = a_t = a_t * p` for `p ∈ rowSubgroup t` and
  `q * b_t = b_t * q = sign(q) • b_t` for `q ∈ colSubgroup t`. The **key vanishing criterion** is that
  a row of `t` meets a column of the relabelled tableau `σt` in two distinct entries: equivalently,
  two distinct entries `x,y` in one row of `t` have `σ⁻¹x,σ⁻¹y` in one column of `t`. Then
  `a_t * σ * b_t = 0`. The transposition of `x,y` lies in the row group, while its conjugate by `σ⁻¹`
  lies in the column group and has sign `−1`, so the sandwich is its own negative.
  Separately, prove the complementary combinatorial factorization: if no such intersection has two
  entries, then `σ = p q` with `p ∈ rowSubgroup t` and `q ∈ colSubgroup t`. On this product the sandwich
  is `sign(q) • c_t ≠ 0`. Thus the vanishing condition is exactly `σ ∉ rowSubgroup t · colSubgroup t`;
  the intersection argument and the complementary factorization together prove this equivalence.
  Consume the existing `TauCeti.YoungTableau` APIs in
  `TauCeti/RepresentationTheory/Symmetric/Vanishing.lean` and `Factorization.lean`:
  `rowMeetsColumnTwice_relabel_iff`, the vanishing and sign-scalar sandwich lemmas, and
  `mem_mul_of_not_rowMeetsColumnTwice`. Their linear extension gives the scalar relation on
  `c_t k[Sₙ] c_t`. These are the facts that make `k[Sₙ] c_t` irreducible.

### Layer 3: the Specht modules `S^λ`

- **Polytabloids and the Specht module.** The two presentations of `S^λ` -- the concrete submodule of
  tabloids and the abstract left ideal -- agree only under a fixed set of conventions, stated here and used
  everywhere: permutation modules are **left** `k[Sₙ]`-modules; tabloids are acted on by **left** permutation
  of entries; the **polytabloid** is `e_t = b_t · {t} ∈ M^λ` (the column antisymmetrization of the tabloid
  `{t}`); and the matching group-algebra ideal is `k[Sₙ] c_t` with `c_t = a_t * b_t` (the Layer 2 ordering).
  The **Specht module** `spechtModule μ` is the submodule of `permutationModule μ` spanned by all
  polytabloids `{e_t : t a λ-tableau}`, a subrepresentation. Prove the isomorphism `spechtModule μ ≅ k[Sₙ] c_t`
  **for exactly this convention** (so both presentations are available without a silent flip to the dual),
  and that `spechtModule` is finite-dimensional; package it as an `FDRep ℚ (Perm (Fin n))`.
- **The submodule theorem (James).** For any submodule `U ≤ M^λ`, either `S^λ ≤ U` or `U ≤ (S^λ)^⊥`
  (the orthogonal under the tabloid bilinear form). This is the engine of irreducibility, and it is worth
  building for its own sake as the tabloid-form API.

### Layer 4: completeness and irreducibility (the classification)

- **Irreducibility.** Over `ℚ` (characteristic `0`), each `spechtModule μ` is irreducible:
  `(spechtModule μ).ρ.IsIrreducible`, equivalently `CategoryTheory.Simple (spechtModule μ)`, from the
  submodule theorem and `⟨e_t, e_t⟩ ≠ 0`.
- **Absolute irreducibility (a separate milestone).** Irreducibility over `ℚ` does not by itself give
  absolute irreducibility; the milestone is `End_{ℚ[Sₙ]} S^λ ≅ ℚ` (Schur index `1`), proved from the
  one-dimensional corner algebra `c_t ℚ[Sₙ] c_t = ℚ c_t` of Layer 2 and the
  ideal presentation of Layer 3, rather than from rational character values. Only then
  does `ℂ ⊗_ℚ S^λ` stay irreducible and stay non-isomorphic across `λ`.
- **Distinctness and completeness.** `spechtModule μ ≅ spechtModule ν ↔ μ = ν` (via the dominance
  triangularity below), and **every** simple representation of `Sₙ` is a Specht module. The clean count
  "#irreducibles = #conjugacy classes" is naturally a **splitting-field** statement, so prove completeness
  **over `ℂ` first** using ordinary character theory, indexing the irreducible complex characters by
  `Nat.Partition n` via `partitionEquivConjClasses` and #irreducibles = #classes (imported from
  [../CharacterTheory](../CharacterTheory/README.md), which supplies the equality over a splitting field);
  then **descend to `ℚ`** using the absolute irreducibility above, so that `μ ↦ spechtModule μ` is a
  **bijection** from `Nat.Partition n` to the isomorphism classes of irreducibles over `ℚ` and over `ℂ`
  alike. State the `ℂ`-corollary: the irreducible complex characters of `Sₙ` are exactly `{χ^λ}_{λ ⊢ n}`.
- **Young's rule proper.** With the Specht modules and their irreducibility in hand,
  the multiplicity statement `M^μ = S^μ ⊕ ⊕_{λ ▷ μ} Kλμ S^λ` (multiplicity of `S^λ` in `M^μ` equal to the
  Kostka number `Kλμ` of Layer 1, `Kμμ = 1`) is now well-posed and is proved here.
- **The named small irreducibles.** `S^{(n)}` is the trivial representation, `S^{(1ⁿ)}` is the sign
  representation `Perm.sign`, and `S^{(n-1,1)}` is the `(n-1)`-dimensional standard representation
  (`M^{(n-1,1)} = triv ⊕ standard`). Prove these identifications.

### Layer 5: the standard basis and the hook-length formula

- **The standard basis.** The polytabloids `{e_t : t ∈ StandardYoungTableau μ}` form a basis of
  `spechtModule μ`: `Basis (StandardYoungTableau μ) ℚ (spechtModule μ)`. Hence `finrank ℚ (spechtModule
  μ) = standardCount μ = f^λ`. The proof is the straightening algorithm (Garnir relations expressing an
  arbitrary polytabloid in the standard ones), which is itself a target.
- **Hook lengths and the formula.** `hookLength μ c` for a cell `c ∈ μ.cells` (arm + leg + 1). The primary
  theorem is the **multiplicative** hook-length formula `f^λ · ∏_{c ∈ μ.cells} hookLength μ c = n!`, which
  carries no division obligation; prove it (e.g. via the Frobenius determinant formula for `f^λ`, or the
  probabilistic hook-walk). The quotient form `finrank ℚ (spechtModule μ) = n! / ∏ hooks` is a **derived**
  corollary, obtained only after the separate divisibility lemma `∏_c hookLength μ c ∣ n!`. Consume native `TauCeti.sum_sq_standardCount`, proved from orthogonality,
  `∑_{λ ⊢ n} (f^λ)² = n!`; Layer 7's RSK supplies a separate combinatorial proof.

### Layer 6: characters and class sizes

- **The Specht character.** The native character of `spechtModule μ` lands in the base field `ℚ`
  (`(spechtModule μ).character : Perm (Fin n) → ℚ`). The `ℤ`-valued `spechtChar μ : Perm (Fin n) → ℤ` is a
  **refinement**: its integrality (the classes of `Sₙ` are rational) is a theorem, recorded by the cast
  `spechtChar_cast`, not baked into the character's definition. It depends only on the cycle type, so it
  descends to `spechtCharValue μ : Nat.Partition n → ℤ` via `partitionEquivConjClasses`. Assemble the
  **character table of `Sₙ`** as `Matrix (Nat.Partition n) (Nat.Partition n) ℤ`, `X λ μ = χ^λ(cycle type μ)`,
  and prove it satisfies the `IsCharacterTableSpec` of [../CharacterTheory](../CharacterTheory/README.md).
- **Class sizes.** The orthogonality weights are the class sizes `n! / z_μ`, `z_μ = ∏_i i^{mᵢ} mᵢ!`, where
  `mᵢ` is the multiplicity of the part `i` in `μ`. Consume the native combinatorial helpers in `Symmetric/ClassSize.lean`: `partMultiplicity μ i`, `zPart μ = ∏_i i^{mᵢ} mᵢ!`, and
  `card {σ : Perm (Fin n) // σ.partition = μ} · zPart μ = n!`.
### Layer 7: symmetric functions, the Frobenius characteristic, and RSK

- **Native finite-variable suppliers.** Consume Tau Ceti's
  [partition/diagram dictionary](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Combinatorics/Young/Partitions.lean) and
  `RingTheory/MvPolynomial/Symmetric/Schur/{Basic,Symmetric,Bialternant,JacobiTrudi,Pieri,Basis,Monomial,Branching,Complete,MurnaghanNakayama}.lean`:
  `diagramOf`, `diagramSchurPoly`, `schurPoly`, `schurPoly_eq_rename`,
  `schurPoly_isSymmetric`, `schurPoly_mul_alternant`, `hsymmInt`,
  `schurPoly_eq_det_hsymmInt`, `hsymm_mul_schurPoly`, `schurPolyBasis`,
  `schurPoly_eq_sum_kostkaNumber_smul_msymm`, `msymmBasis`,
  `symmetricHomogeneousSubmodule`, `partitionEquivSchurIndex`,
  `aeval_snoc_zero_diagramSchurPoly`, `aeval_snoc_zero_hsymmInt`,
  `schurPoly_ones`, `schurPoly_indiscrete`, and `psum_mul_schurPoly`.
  The tableau-sum polynomials are defined over any `CommSemiring R`; the
  determinant, basis and alternant identities use a `CommRing R`.
  Supply the Fin-alphabet comparison
  `schurPoly (Fin d) R μ = diagramSchurPoly d R (diagramOf μ)` using
  symmetry and `schurPoly_eq_rename`. Preserve the native integer-indexed
  `hsymmInt`, including its zero and negative-index values. Build dual
  Jacobi–Trudi with elementary functions by the complementary-minor identity
  for the mutually inverse Toeplitz matrices H and E, where
  `∑_(i=0)^r (-1)^i e_i h_(r-i) = δ_(r,0)`. This uses the native ordinary
  Jacobi–Trudi identity and coefficient identities, independently of ω. The bialternant is a polynomial
  identity after multiplication by the staircase alternant; its quotient
  interpretation uses the fraction field over ℤ. Horizontal Pieri consumes
  native `hsymm_mul_schurPoly` and `YoungDiagram.InterlacedBy`.

- **Native Frobenius map and its power-sum formula.** Consume
  `TauCeti.frobeniusCharacteristic n d h`, the complex linear equivalence
  from `TauCeti.ClassFunction ℂ (Perm (Fin n))` to
  `TauCeti.symmetricHomogeneousSubmodule (Fin d) ℂ n` for `h : n ≤ d`.
  It sends native complex Specht characters to native Schur polynomials.
  Prove `p_μ = ∑_λ χ^λ(μ)s_λ` over ℤ and after coefficient change to ℂ
  in every finite alphabet, retaining vanishing shapes. Its independent
  proof combines native `psumPart_eq_sum_character_smul_msymm`,
  `char_permutationModule_eq_sum_kostkaNumber_mul_spechtChar` and
  `schurPoly_eq_sum_kostkaNumber_smul_msymm`; it uses no character-side
  Murnaghan–Nakayama. Then use the polynomial `psum_mul_schurPoly` and
  Schur basis to prove the character recursion in the next item. The finite map's
  explicit class formula is `ch(f)=∑_(μ⊢n) f(μ)p_μ/z_μ`.

- **Rim hooks and Murnaghan-Nakayama.** A **rim hook** (border strip) of a diagram is a connected
  skew shape containing no `2×2` block; its **height** is one less than its number of rows. Deleting an
  `r`-cycle from `σ : Perm (Fin n)` changes the underlying set from `Fin n` to `Fin (n-r)`, which is awkward
  at the permutation level, so state the **Murnaghan-Nakayama rule primarily on cycle-type partitions**:
  writing `μ ∖ ρ` for the diagram obtained by removing a rim hook `ρ` of size `r` and `ν.removePart r` for
  the cycle type with one part `r` deleted,
  `χ^λ(ν) = ∑_{ρ of size r} (-1)^{height ρ} · χ^{λ ∖ ρ}(ν.removePart r)`, then prove compatibility with
  representatives `σ` separately. This recursion **computes** the whole character table from the empty
  diagram; derive the special cases: value at the identity is `f^λ` (Layer 5), and value of `χ^{(1ⁿ)}` is
  `sign`. Consume native `YoungDiagram.IsRimHook` and `YoungDiagram.rimHookHeight`.
  Prove the recursion from the preceding independent Frobenius power-sum formula,
  using native `psum_mul_schurPoly` and the Schur basis in at least n variables.

- **Shared skew tableaux and encoding conversions.** For diagrams `inner ≤ outer`,
  use `skewCells inner outer = outer.cells \ inner.cells` and build
  `SkewSemistandardYoungTableau inner outer` with weak rows and strict
  columns. Entries outside the skew cells are normalized to zero. Its
  content is `ℕ →₀ ℕ`, counting entries exactly as native
  `SemistandardYoungTableau.content` does. Build bounded skew tableaux in
  `{0,…,d−1}`, their finite instances, entry extensionality, restriction,
  content and weight APIs, and `skewSchurPoly d R inner outer` by their
  finite tableau sum over any `CommSemiring R`. Build standard skew tableaux
  with entries bijective onto `Fin (#skewCells)`; transpose shapes and
  standard tableaux. Supply inverse conversions between straight skew
  tableaux and native `BoundedSSYT`, and between standard straight skew
  tableaux and native `StandardYoungTableau`. Supply inverse conversions
  from straight bounded tableaux to native `List (List ℕ)` with
  `List.IsTableauRows`, preserving shape, entries, content and insertion.
  Skew rows retain each row's inner-shape offset; their entry/content
  conversions use these offsets. Prove straight skew Schur polynomials
  agree with `diagramSchurPoly` and prove zero-variable stability.

- **Insertion, Knuth equivalence, rectification and LR.** Consume native
  `TauCeti.rowInsert`, `reverseRowInsert` and `rowInsertEquiv`. The Knuth
  row word reads rows bottom to top, each left to right. Define the two
  Knuth relations `xzy ≡ zxy` for `x ≤ y < z` and `yxz ≡ yzx` for
  `x < y ≤ z`; prove Greene's theorem (maximum cardinalities of unions
  of k disjoint weakly increasing subsequences are the first k row sums)
  and the insertion-tableau characterization of Knuth equivalence.
  An inward slide moves the smaller of the right/below entries into the
  hole, choosing below when equal; a reverse slide moves the larger of
  the left/above entries, choosing above when equal. A sole neighbor is
  chosen in either direction. Prove preservation, inverse slide API,
  termination, standardization/destandardization, rectification independence,
  and dual equivalence with its exchange lemma. Prove the content-preserving
  rectification decomposition and identify its Yamanouchi fibres with
  ballot tableaux. The LR word reads top rows first, each right to left,
  with zero-indexed letters and prefix condition `#(k+1) ≤ #k`.
  Define `LRTableau inner outer ν` as the shared skew carrier restricted
  to content `ν.rowLen` and this ballot condition. Give a `Finite` instance
  and set `c^κ_(μ,ν) = Nat.card (LRTableau μ κ ν)`.
  The required bridge from skew expansion to multiplication is the
  tableau-product bijection: pairs of straight bounded tableaux of shapes
  μ and ν correspond to a straight bounded tableau of shape κ together
  with an LR tableau of κ/μ and content ν, summed over κ of size |μ|+|ν|.
  Prove the bijection and its weight-addition identity using insertion,
  rectification and dual equivalence; then sum weights to obtain
  `s_μ s_ν = ∑_κ c^κ_(μ,ν)s_κ` in every finite alphabet and over every
  commutative semiring, including vanishing shapes. Supply both partition-
  and diagram-indexed statements. Prove the product identities commute
  with zero-variable specialization. Show the strip specializations of LR
  give horizontal and vertical Pieri, including strip size zero. For ν=(1^r), the content contains r distinct letters;
  the ballot condition forces their LR word to be increasing, so the semistandard
  row condition permits at most one new box per row. This identifies the LR
  tableaux with vertical strips directly and proves vertical Pieri here.
  Build full RSK for permutations, words and nonnegative integer matrices,
  with inverse, shape/weight, transpose and symmetry identities; its
  permutation specialization uses native standard tableaux. Prove
  Schützenberger evacuation is an involution and its compatibility with RSK.

- **Stable ring and Hall pairing.** For every `CommRing R`, define the degree-n
  module as the compatible-family submodule of
  `∀ d, symmetricHomogeneousSubmodule (Fin d) R n`, with compatibility
  under `MvPolynomial.aeval (Fin.snoc MvPolynomial.X 0)`.
  Their `DirectSum ℕ` is Λ_R. Build the graded commutative R-algebra
  structure from componentwise finite-polynomial multiplication, with
  degree-(n+m) multiplication maps, unit and associativity, and algebra
  specialization maps to each finite alphabet. Projection in degree n is
  a linear equivalence for d≥n, proved from native Schur bases. Construct
  the degreewise partition-indexed Schur basis, stable elementary,
  complete and power-sum families and their specialization identities.
  Prove the stable fundamental theorem Λ_R ≃ₐ[R] R[e₁,e₂,…], with generator
  r : ℕ representing e_(r+1). Prove the analogous free generation by h's
  using their triangular change of generators; this constructs the ring
  involution ω exchanging e and h. Use the independently proved ordinary and dual Jacobi–Trudi identities
  to prove ω(s_λ)=s_(λᵀ), and prove ω²=id. Recover the two Pieri identities
  from one another under ω as a compatibility theorem.
  Define the degreewise Hall **bilinear** pairing by the dot product of
  Schur coordinates; pair different degrees by zero. Its power-sum
  normalization is `⟨p_μ,p_ν⟩=δ_(μ,ν)z_μ`, proved from the independent
  Frobenius expansion and native `symmetricCharacterTable_column_orthogonality`.

- **Rational power-sum presentation and Mathlib comparison.** Follow the
  [`SymmFun` design](https://github.com/leanprover-community/mathlib4/blob/7f7f603158a7dc023a3d387d35fd7d77a0485ba9/Mathlib/RingTheory/LambdaRing/SymmetricFunctions.lean)
  of [Mathlib PR42468](https://github.com/leanprover-community/mathlib4/pull/42468):
  for `[CommRing R] [Algebra ℚ R]`, `SymmFun R` is `MvPolynomial ℕ R`,
  with `X r` representing the positive power sum `p_(r+1)` and
  `SymmFun.realize d` evaluating it to `MvPolynomial.psum (Fin d) R (r+1)`.
  Supply these interfaces in Tau Ceti wherever no imported declaration supplies
  them, following Mathlib's names and carrier. The compatible-family construction,
  free elementary generators and Hall/LR/Frobenius targets retain their full
  arbitrary-`CommRing` scope.

  For each `n>0`, construct `P_n` in stable degree n with finite component
  `MvPolynomial.psum (Fin d) R n`. Prove zero-variable stability; the finite
  zeroth power sum is d and does not define a stable `P_0`. Over a rational
  algebra define `Φ : SymmFun R ≃ₐ[R] StableSymmetric R` by `X r ↦ P_(r+1)`.
  Construct its inverse using the already proved free-elementary-generator
  theorem and Newton recursion in the polynomial carrier:
  `E_0=1`,
  `E_n=(1/n) Σ_(i=1)^n (-1)^(i-1) E_(n-i) X_(i-1)` for n>0.
  The factor `1/n` is the image of the rational inverse, so no division is
  asserted over an arbitrary ring. Prove both composites are identities by
  Newton's triangular equations and generator extensionality. Prove
  `SymmFun.realize d = (stableSpecialize R d).comp Φ.toAlgHom`, naturality
  under coefficient change, and preservation of the weighted grading
  `deg(X r)=r+1`; ordinary polynomial total degree is a different grading.

  Construct the integral graded Hopf maps on the free elementary generators:
  `Δ(e_n)=Σ_(i=0)^n e_i⊗e_(n-i)`, `ε(e_n)=0` for n>0,
  `S(e_n)=(-1)^n h_n`, with `e_0=h_0=1`.
  Prove coassociativity, cocommutativity, the counit and antipode laws using
  generator extensionality and `H(-t)E(t)=1`. Compare Δ with splitting finite
  alphabets through `Fin d ⊕ Fin e ≃ Fin (d+e)`. For n>0 prove
  `Δ(P_n)=P_n⊗1+1⊗P_n`, `ε(P_n)=0`, and `S(P_n)=-P_n`.
  Under the rational hypothesis, Φ intertwines these maps with the
  primitive-power-sum Hopf structure of the same `SymmFun` interface.

- **Stable Frobenius and induction.** Over ℂ, construct
  `stableFrobenius n : ClassFunction ℂ S_n ≃ₗ[ℂ] StableDegree ℂ n`, with
  projection at every d≥n exactly the native `frobeniusCharacteristic`.
  Prove `ch(f)=∑_(μ⊢n) f(μ)p_μ/z_μ` and the Specht-to-Schur identity.
  Its Hall isometry uses native `ClassFunction.characterPairing`, namely
  `(1/|S_n|)∑_g f(g)h(g⁻¹)`; both pairings are complex bilinear.
  Identify native `virtualCharacters ℂ S_n` with the ℤ-lattice of Schur
  coordinates and restrict ch to an integral lattice isomorphism with
  `StableDegree ℤ n`, using the coefficient embedding Λ_ℤ→Λ_ℂ. Build
  coefficient-change maps and prove their specialization, basis and
  multiplication compatibility. The lattice of virtual characters is
  distinct from all integral-valued `ClassFunction ℤ S_n`.
  For induction use [../InductionRestriction](../InductionRestriction/README.md)
  and native `ClassFunction.ind` from `Induction/ClassFunction.lean`.
  Build the block embedding S_n×S_m↪S_(n+m) through `Equiv.Perm.sumCongr`
  and `Fin n ⊕ Fin m ≃ Fin (n+m)`, its image subgroup and inverse.
  Build the external-product class function `(σ,τ) ↦ f(σ)g(τ)`, transport
  it to that subgroup and prove `ch(Ind(f⊠g))=ch(f)ch(g)` in Λ_ℂ.

The LR route follows Stanley, *Enumerative Combinatorics*, vol. 2,
Appendix 1, §§A1.1–A1.3, and Fulton's *Young Tableaux*, §§5.1–5.3 for the
product bridge. [Haiman's course](https://math.berkeley.edu/~mhaiman/math249-spring15/)
also develops slides and dual equivalence. These are the polynomial suppliers
for [ClassicalGroups Layer 4](../ClassicalGroups/README.md); that roadmap owns
the group-character and tensor-multiplicity comparisons. LieHighestWeight
Layer 9 owns their comparison with the polynomial gl_n Lie modules.

### Layer 8: Schur-Weyl duality

For the raw permutation action, follow the `TensorPower` and
`PiTensorProduct.reindex` direction of
[Mathlib PR41781](https://github.com/leanprover-community/mathlib4/pull/41781/files/f4426a47c5f43e31053d6121573a3546d1bdd7d8).
Use the native `reindexRepresentation` to supply an actual symmetric-group
representation and its algebra action; a family of tensor endomorphisms alone
does not supply that representation interface.

Consume native `TauCeti.permTensorAction ℂ d n`, `permTensorActionAlgHom`,
`TauCeti.tensorPowerRep ℂ d n` and `commute_permTensorAction_tensorPowerRep`;
they act on the same `⨂[ℂ] (_ : Fin n), (Fin d → ℂ)` carrier. The native
`Symmetric/TensorAction/{GeneralLinear,SchurWeyl,Faithful}.lean` supply both
image-level centralizer equalities and `permTensorActionAlgHom_injective_iff`.
The group-algebra action is faithful exactly when n≤d; for d<n the missing
shape (1^n) already gives a kernel. The partner of GL_d is the image of
ℂ[S_n], which is a proper quotient in that range.

Consume the native Schur-functor image
`TauCeti.schurFunctor d (diagramOf μ)` from
`ClassicalGroups/WeylModule/Basic.lean`: its fixed tableau is the native
row-superstandard tableau. [ClassicalGroups Layer 2](../ClassicalGroups/README.md)
owns this image, its invariance, vanishing criterion and symmetric/exterior
extremes; Layers 3–4 there own the highest-weight, torus-character and
individual dimension comparisons. Consume the native sum-of-dimensions
identity `sum_finrank_spechtModule_mul_finrank_weylModuleOfShape`.

Build the simultaneous equivariant decomposition
`tensorSpace d n ≅ ⊕_(μ⊢n, ℓ(μ)≤d) S^μ ⊗ 𝕊^μ(ℂ^d)`.
The map intertwines both native actions with the summand-wise native
complex Specht and Schur-functor actions; a dimension identity alone does
not discharge it. Consume native `YoungTableau.intertwiningMapEquivWeylModule` from
`ClassicalGroups/WeylModule/Multiplicity.lean`, the GL-equivariant comparison
from the symmetric-group ideal-intertwiner space to the symmetrizer image.
Build the complex Specht/ideal comparison and the isotypic decomposition of
tensorSpace over the semisimple algebra ℂ[S_n], and transport it through this
comparison to obtain the simultaneous decomposition. The following balanced-tensor
comparison supplies a reusable universal-property presentation of the same multiplicity
space; prove that it agrees with the native intertwiner comparison. Construct the balanced tensor as the quotient of
`tensorSpace d n ⊗[ℂ] S^μ` by the span of `(v·a)⊗s − v⊗(a·s)` for
`a ∈ ℂ[S_n]`, with right action `v·σ=permTensorAction(σ⁻¹)v`, prove its
universal property and its equivalence with the image using Specht self-duality.

### Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra)

Layer 8 is the `GLₔ × Sₙ` duality on `V^{⊗n}` for `V = ℂᵈ` with no extra structure. Fixing a nondegenerate
invariant form on `V` breaks `GLₔ` to its orthogonal or symplectic subgroup, and the centralizer of the
smaller group is correspondingly larger than the image of `ℂ[Sₖ]`: it is the image of the **Brauer algebra**
`B_k(δ)`, whose diagrams may now join two bottom points, or two top points, by a horizontal arc, contracting
the paired tensor slots against the form. The symmetric group sits inside as the through-strand ("no-arcs")
diagrams, so this layer **contains** Layer 8's `Sₖ`; and the planar pairing diagrams form the Temperley-Lieb
**subalgebra** `TL_k(δ) ⊆ B_k(δ)` of [the Temperley-Lieb roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58) (`B_k(δ)` is
the non-planar generalization of `TL_k`). The orthogonal and symplectic groups here are the extra-invariant
restrictions of `GLₔ` studied in [../ClassicalGroups](../ClassicalGroups/README.md).

Consume native `Combinatorics/Brauer/{Diagram,Compose,LoopCount,Associativity,Generator,Relations}.lean`:
`TauCeti.BrauerDiagram`, `card_brauerDiagram`, the arc predicates `IsThrough`,
`IsCap`, `IsCup`, `permToBrauer`, `capCup`, `composeDiagram`, `middleLoopCount`
and `composeDiagram_assoc`. Native permutation composition is
`composeDiagram (permToBrauer σ) (permToBrauer τ) = permToBrauer (σ*τ)`.
Consume `ClassicalGroups/BrauerGenerators/Orthogonal/{Basic,TensorPower}.lean`
and `BrauerGenerators/Symplectic.lean` for caps, cups, cup-cap maps,
generator relations and invariant tensor-power actions. Build weighted diagram
algebra and its comparison with these native generators here.

Use Mathlib's `Matrix.orthogonalGroup (Fin n) ℂ`: its definition fixes the
trivial star through `starRingOfComm`, so it is the symmetric bilinear
orthogonal group over ℂ. Consume `(TauCeti.stdOrthogonalRep ℂ n).tensorPower k`
and `(TauCeti.stdSymplecticRep ℂ l).tensorPower k` as the diagonal actions.

- **Brauer diagrams and the Brauer algebra.** A **Brauer diagram** on `k` strands, `brauerDiagram k`, is a
  perfect matching of the `2k` boundary points `Fin k ⊕ Fin k` (`k` on the bottom, `k` on the top), i.e. a
  fixed-point-free involution of `Fin k ⊕ Fin k`. There are `(2k-1)!! = Nat.doubleFactorial (2k-1)` of them
  (`card_brauerDiagram`), of which the `k!` matchings with no horizontal arc (every bottom point joined to a
  top point) are the permutation diagrams. The **Brauer algebra** `brauerAlgebra δ k` is the free `ℂ`-module
  on `brauerDiagram k`, with multiplication by vertical stacking: place `D₁` above `D₂`, read off the induced
  matching of the outer boundary, and multiply by `δ^{c}`, where `c` is the number of closed loops formed in
  the middle (the **`δ`-power loop rule**). It is a unital associative `ℂ`-algebra with `brauerBasis` the
  diagram basis and `finrank = (2k-1)!!`; the loop rule and the resulting associativity are the load-bearing
  combinatorics, exactly as the gluing of [Temperley–Lieb](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58) Layer 2 but
  without the planarity constraint (Brauer diagrams may cross). The native combinatorics above is the shared foundation. Prove the remaining
  weighted associativity identity
  `loop(D₁,D₂)+loop(D₁∘D₂,D₃)=loop(D₂,D₃)+loop(D₁,D₂∘D₃)`.
  Pin `brauerBasis D₁ * brauerBasis D₂ = δ^loop(D₁,D₂) • brauerBasis(D₁∘D₂)`
  and the identity basis element. Build the algebra homomorphism
  `permutationDiagramAlgHom : ℂ[S_k] →ₐ[ℂ] B_k(δ)` sending each permutation
  to its native no-arcs basis diagram, with its injectivity.
- **The invariant form and the action on `V^{⊗k}`.** For `V = ℂⁿ` carrying a nondegenerate **symmetric**
  form (the orthogonal case) or nondegenerate **alternating** form (the symplectic case), the form
  `V ⊗ V → ℂ` is a **cap** and its inverse copairing `ℂ → V ⊗ V` a **cup**. A Brauer diagram acts on
  `V^{⊗k}` by permuting the tensor factors along its through-strands (as in Layer 8) while each horizontal
  arc on the bottom contracts a pair of input slots through the cap, and each arc on the top expands a pair
  of output slots through the cup. This is `brauerActionOrth n k : brauerAlgebra (n : ℂ) k →ₐ[ℂ] End(V^{⊗k})`
  with loop value `δ = n = dim V` (a closed loop evaluates to the trace of the symmetric form, `= n`).
  The **symplectic case is sign-sensitive** and needs its conventions fixed before the action is well-defined:
  fix the standard alternating form on `V = (Fin l ⊕ Fin l) → ℂ`, its inverse copairing, and a definite
  **ordering** of each cap/cup pair (the alternating form is antisymmetric, so the cap of an unordered pair is
  ambiguous up to sign). With those fixed, `brauerActionSymp l k` has loop value `δ = -2l = -dim V` (an
  ordered closed loop evaluates to the trace of the alternating pairing, `= -2l`). The check that these
  actions are algebra homomorphisms is exactly the check that they respect the Brauer generator relations
  `s_i² = 1`, `e_i² = δ e_i`, `s_i e_i = e_i`, the braid relations, and the mixed `s`/`e` relations, at the
  stated `δ`; state those relations as the load-bearing lemmas. Fix stacking so the
  permutation diagram of σ acts as `permAction σ` in the orthogonal case. In the
  symplectic case it acts as `sign(σ) • sympPermAction l k σ`, where
  `sympPermAction = PiTensorProduct.reindexRepresentation ℂ ((Fin l ⊕ Fin l) → ℂ) (Fin k)`: an adjacent crossing is
  minus the flip, so `s_i e_i = e_i` holds for the alternating cap/cup. Order each
  cap and cup by increasing slot index and use the inverse-form copairing in that
  order. Require the two-strand cap-cup diagram to act exactly as native
  `symplecticCupCap ℂ l`, and build its placements at arbitrary ordered pairs
  of tensor slots by tensoring with identities and reindexing. Prove compatibility
  of the arbitrary diagram action with these placements, the generator identities
  and the mixed relations with these signs.
- **Schur-Weyl duality (the double centralizer).** `O(V) = Matrix.orthogonalGroup (Fin n) ℂ` acts on `V^{⊗k}` diagonally (`orthAction`,
  the restriction of Layer 8's `glAction` along `O(V) ↪ GLₙ`), and this action **commutes** with
  `brauerActionOrth` (`brauerActionOrth_commute`). The **duality** is best split into two statements with
  different proofs, because the centralizer image statement does **not** rest on semisimplicity of the Brauer
  algebra (which can fail at the geometric parameter `δ = n`):
  - the **surjectivity onto the commutant** (first fundamental theorem of invariant theory for `O(V)`):
    `Subalgebra.centralizer ℂ (image of O(V)) = (brauerActionOrth n k).range`
    (`brauerActionOrth_surjective_to_commutant`), and its symplectic analogue
    `brauerActionSymp_surjective_to_commutant`. This is the invariant-theoretic heart and holds regardless
    of semisimplicity. It does not follow from the Brauer relations or from complete reducibility:
    it is proved through the invariant-tensor bridge in the next item;
  - the **reverse centralizer** (`Subalgebra.centralizer ℂ (brauer image) = adjoin(image of O(V))`) as a
    finite-dimensional bicommutant statement for the two image subalgebras, with its hypotheses recorded
    explicitly.
  Everything is **image-level** and the partner of `O(V)` is the **image** algebra `(brauerActionOrth n k).range`,
  not the abstract `B_k(n)` (the Brauer action is not faithful in small dimension). The symplectic mirror uses
  `Sp(V) = Matrix.symplecticGroup (Fin l) ℂ` (Mathlib's honest form-symplectic submonoid) with `B_k(-2l)`. A
  separate evaluation decomposition uses complete reducibility of the geometric group
  representation and semisimplicity of these image algebras, in every dimension. This is the
  orthogonal/symplectic analogue of Layer 8's `GLₔ × Sₙ` double-centralizer theorem and the point of contact
  with [../ClassicalGroups](../ClassicalGroups/README.md).
- **The invariant-tensor first fundamental theorem (the bridge to the commutant).**
  Write G for `Matrix.orthogonalGroup (Fin n) ℂ` or `Matrix.symplecticGroup (Fin l) ℂ`,
  V for its standard module, `ω(v,w) = vᵀ J w` for the native alternating form, and
  φ : V ≃ V* for the native equivariant self-duality, `TauCeti.stdOrthogonalRepToDual ℂ n`
  (`v ↦ v ⬝ᵥ ·`) or `TauCeti.stdSymplecticRepToDual ℂ l` (`v ↦ ω(v, ·)`). Let
  `T^(k,k) = ⨂[ℂ] (_ : Fin k ⊕ Fin k), V`; its `Sum.inl` slots are the inputs (bottom
  points) and its `Sum.inr` slots the outputs (top points), which is exactly the boundary
  of a native `TauCeti.BrauerDiagram k`. The two surjectivity statements are built in
  four steps.

  1. *Endomorphisms as tensors.* Construct `Ξ_k : End(T^k) ≃ T^(k,k)` as the composite of
     the inverse of Mathlib's `dualTensorHomEquiv` (for `Dual(T^k) ⊗ T^k`, a finite free
     module), the inverse of `PiTensorProduct.dualDistribEquiv` on the first factor,
     φ⁻¹ in every input slot, and `PiTensorProduct.tmulEquiv`. Prove
     `Ξ_k(ρ_G(g) ∘ f ∘ ρ_G(g)⁻¹) = g · Ξ_k(f)` for the diagonal action on all 2k slots,
     from native `stdOrthogonalRepToDual_equivariant` and
     `stdSymplecticRepToDual_equivariant`. Hence f commutes with the image of G exactly
     when `Ξ_k(f)` is G-invariant.
  2. *Matching tensors.* Order the 2k slots with every `Sum.inl` slot before every
     `Sum.inr` slot and each block by index. For a matching `D : TauCeti.BrauerDiagram k`,
     orient each arc from its smaller endpoint, and let `t_D ∈ T^(k,k)` be the tensor
     product of native cups (`TauCeti.orthogonalCup`, `TauCeti.symplecticCup`) placed in
     the oriented arcs. Prove that t_D is G-invariant, from native
     `piTensorProductMap_comp_orthogonalCup` and `piTensorProductMap_comp_symplecticCup`.
     Prove relabelling: reindexing t_D by a permutation π of the slots gives `t_(π·D)`
     in the orthogonal case, and `(−1)^r · t_(π·D)` in the symplectic case, where r is the
     number of arcs whose orientation π reverses. Prove `Ξ_k(ρ(D)) = ε(D) · t_D` for the
     Brauer action ρ of this layer, with ε(D) = 1 in the orthogonal case and an explicit
     sign ε(D) ∈ {±1} in the symplectic case.
  3. *The tensor theorem, in every dimension.* Prove that the G-invariants of `T^(k,k)` are
     the span of the t_D for every n, l and k, and that G-invariants in odd tensor degree
     are zero, because −1 ∈ G acts by −1. Only spanning is claimed. Linear independence
     of the t_D holds only in the stable range (n ≥ 2k, l ≥ k) and is not used here.
  4. *The commutant.* Combine steps 1–3: f lies in the centralizer of the image of G iff
     `Ξ_k(f)` is invariant, iff it lies in the span of the `t_D = ε(D) Ξ_k(ρ(D))`, iff f lies in
     the range of ρ. This proves `brauerActionOrth_surjective_to_commutant` and
     `brauerActionSymp_surjective_to_commutant` (Doty–Hu, Theorem 1.2(b), over every
     infinite field of odd characteristic; Dipper–Doty–Hu, Theorem 1.2(1) over ℂ and
     Theorem 1.4 over every infinite field). The kernel of ρ (the second fundamental
     theorem) is not needed.

  A route for step 3, not mandatory. Fix an invariant u. The polynomial map
  `μ(g) = g^{⊗2k} u` on square matrices of size dim V satisfies `μ(gh) = μ(g)` for h ∈ G. Put
  `c = g c₀ gᵀ`, where c₀ is the coefficient matrix of the native cup (1 for O, −J for Sp),
  so that G is the stabilizer of c₀. Over the dense open set where the leading principal
  minors of c (for O), or its leading Pfaffians (for Sp), are nonzero, factor
  `c = L c₀ Lᵀ`. For O this is Cholesky factorisation with L lower triangular. For Sp it
  is symplectic Gram–Schmidt, whose entries are rational in c with no square roots. Then
  L⁻¹g ∈ G, so μ(g) = μ(L). In the orthogonal case column j of L is `√(d_j/d_(j−1))`
  times a rational vector in c, where d_j is the j-th leading minor. Also
  `μ(L) = μ(L·diag(±1))`, so only even powers of the square roots occur. Hence
  `μ(g) = F(c)` with F rational, with poles at most along these minors. Those minors are
  irreducible polynomials. Every symmetric (alternating) complex matrix has the form
  `g c₀ gᵀ` with g possibly singular: by Mathlib's
  `LinearMap.BilinForm.exists_orthogonal_basis` for the symmetric case, and by the
  alternating normal form. μ stays bounded along `g + tA` as t → 0. Hence F is a
  polynomial. It is homogeneous of degree k, and `F(h c hᵀ) = h^{⊗2k} F(c)` for every
  matrix h. Polarise F through the symmetriser (O) or antisymmetriser (Sp) of each pair
  of slots, and through the symmetrisation of the k pairs. This gives a linear map `L_F`
  of `T^{2k}` that commutes with every `h^{⊗2k}` and satisfies `L_F(c^{⊗k}) = F(c)`. By
  native `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute` (Layer 8;
  `(2k)!` is invertible in ℂ), `L_F` is the action of an element of `ℂ[S_(2k)]`. So
  `u = F(c₀) = L_F(c₀^{⊗k})` is a combination of permuted copies of `c₀^{⊗k}`, and after
  reindexing along `finSumFinEquiv` these are ±t_D. Alternative routes may replace this
  one. One is Weyl's polynomial vector-invariant theorem, followed by polarisation, the
  multidegree-(1,…,1) component and the comparison of multilinear invariants with tensor
  invariants through φ. Another is De Concini–Procesi's characteristic-free route.

  **Checks.**
  - At k = 0, Ξ₀ is the identity of ℂ and the empty matching tensor is 1. For V = 0 and
    k > 0 both sides of step 3 are zero.
  - Orthogonal, k = 1: `Ξ₁(id_V) = Σ_i e_i ⊗ e_i`, the orthogonal cup, so ε = 1.
  - Sp₂, k = 1, with e and f the basis vectors at `Sum.inl 0` and `Sum.inr 0`. Here
    φ(e) = −f* and φ(f) = e*, so `Ξ₁(id_V) = f⊗e − e⊗f = −θ`, where θ = e⊗f − f⊗e is the
    native cup. A comparison that drops the sign of φ⁻¹ gives +θ. So ε(id) = −1 at k = 1.
  - Sp₂, k = 2. The native cap `x⊗y ↦ ω(x,y)` is sent to −θ in the input slots, so
    `Ξ₂(symplecticCupCap ℂ 1) = −θ_in ⊗ θ_out` and ε = −1. The crossing, minus the flip,
    also has ε = −1. The identity has ε = (−1)² = 1.
  - Sp₂ in tensor degree 4. The invariants have dimension 2, but there are three matching
    tensors, related by `θ₁₂θ₃₄ − θ₁₃θ₂₄ + θ₁₄θ₂₃ = 0`. The t_D span but are not
    independent; this is outside the stable range l ≥ k. In degree 2 the invariants are ℂθ.
  - O₁ = {±1} on V = ℂ. Every one of the (2k−1)!! matching tensors equals `e^{⊗2k}`, and
    the whole one-dimensional `T^{2k}` is invariant.
  - Negative control: O₂ versus SO₂ in degree 2. The O₂-invariants of V⊗V are ℂ·(cup).
    SO₂ ⊂ SL₂ also fixes e₁⊗e₂ − e₂⊗e₁, which a reflection negates. So the theorem is false
    for SO_n, and must be stated for the full disconnected O_n.
- **Harmonic tensors and ordinary Young shapes.** Write `T^q=V^{⊗q}` on the native
  `PiTensorProduct` carrier. For every ordered pair `a<b` of slots define
  `cap_ab : T^q → T^(q−2)` by the invariant form and the increasing order of the
  remaining slots. Define `H^q=⋂_(a<b) ker(cap_ab)`; for q=0,1 this empty
  intersection is all of `T^q`. In the symplectic case the cap is alternating,
  the cup is the native inverse-form cup, and all permutations mentioned in
  the **Young-shape** construction are the ordinary, unsigned permutation action.
  For a partition λ of q choose the native row-superstandard tableau and define
  `E_λ=range(c_t:T^q→T^q) ∩ H^q`, with `c_t=a_t b_t` as in Layer 2.
  Prove invariance, independence up to group-intertwining equivalence of the
  chosen tableau, and the harmonic classification. For the full orthogonal
  group its nonzero ordinary shapes are exactly `λ′₁+λ′₂≤n`; for `Sp_(2l)`
  they are exactly `length(λ)=λ′₁≤l`. These are different conditions. The
  orthogonal theorem is for the full disconnected `O_n`, with its determinant
  extensions, rather than a silent replacement by `SO_n`. Each `E_λ` is
  constructed at degree **q=|λ|**, independently of a later ambient degree k.
  For positive-dimensional V the admissible `E_λ` are pairwise inequivalent
  irreducibles, and
  `H^q ≅ ⊕_(λ⊢q, admissible) E_λ ⊗ S^λ` for the group and the ordinary
  symmetric-group action. Include the empty partition at q=0. If V=0 then
  `T^0=ℂ`, `T^q=0` for q>0; state this separately, so a formal empty-shape
  index does not assert a nonzero summand in a positive tensor degree.

- **The diagram ideals and the trace filtration.** Consume native
  `BrauerDiagram.propagatingNumber`, its parity and composition bounds from
  `Combinatorics/Brauer/PropagatingNumber.lean`. For each j≥0 let `I_j⊆B_k(δ)`
  be the linear span of diagrams with at least j bottom caps (equivalently
  at least j top cups), namely `propagatingNumber(D)+2j≤k`. Prove these spans
  are two-sided ideals, `I_0=B_k`, `I_(j+1)⊆I_j`, and `I_j=0` if 2j>k.
  For the actual geometric action ρ put
  `F_j=span{ρ(b)v : b∈I_j, v∈T^k}` and
  `gr_j=F_j/F_(j+1)`. These are group- and Brauer-stable subspaces and quotient
  modules, `F_0=T^k`, and `I_(j+1)` annihilates `gr_j`.
  On the coordinate tensor basis, use the positive Hermitian product:
  the Hermitian adjoint of each cap is its inserted cup, with a uniform
  minus sign in the symplectic convention. Thus common cap kernels are the
  orthogonal complement of the sum of cup images. Prove that this sum is
  F_1, obtaining `T^q=H^q ⊕ F_1(T^q)` as group modules and identifying the
  natural map `H^q→T^q/F_1(T^q)` with an isomorphism. The positivity is
  Hermitian coordinate linear algebra; it is not positivity of the complex
  bilinear invariant form and uses no averaging over an infinite group.
  For complete reducibility of the whole geometric action consume
  [ReductiveGroups Layer 6](../../ReductiveGroups/README.md)'s characteristic-zero
  reductive theorem for Sp and SO. For O in dimension n≥1, turn an SO-equivariant
  projection onto an O-submodule into an O-equivariant one by averaging its
  two conjugates over O/SO; the order-two scalar is invertible over ℂ.
  Prove this finite-component extension using the component quotient of
  ReductiveGroups Layer 3. O in dimension zero is the trivial boundary case.
  These dependencies do not assume abstract Brauer semisimplicity.

- **Cup expansion, its relations, and the graded action.** Let `P_(k,j)` be
  the finite set of j disjoint unordered pairs of slots, each pair written
  increasingly, and order the k−2j unpaired slots increasingly. Inserting
  j copies of the specified copairing and leaving these other slots in
  order defines actual group-intertwining maps
  `cup_P:T^(k−2j)→T^k`. Explicitly, on a lower pure tensor, sum over two
  basis indices a_p,b_p for each pair p, with coefficient
  `∏_p (B^(-1))_(a_p,b_p)`; put the basis vectors e_(a_p),e_(b_p)
  into the two ordered slots of p and put the lower tensor entries into
  the increasingly ordered free slots. Here B is the coordinate dot-product
  matrix or the fixed alternating matrix J, respectively; its copairing
  matrices are 1 and −J. This finite formula is multilinear in the lower
  inputs and so descends by `PiTensorProduct.lift`. Prove its independence
  of enumerating the set of pairs and its two-strand agreement with the
  native cups. Put q=k−2j and form the direct-sum map
  `C_j: ⊕_(P∈P_(k,j)) H^q → T^k`. Prove its image is contained in `F_j` and
  the composite `Ψ_j` to `gr_j` is surjective for `0≤j≤⌊k/2⌋`.
  The proof factors each diagram of I_j into its top partial matching,
  through-strand permutation and bottom contractions; replacing the resulting
  lower tensor by its H^q part changes the output by F_(j+1).
  Define the relation space explicitly as
  `R_j={x : C_j(x)∈F_(j+1)}=ker Ψ_j` and construct the canonical equivalence
  `(⊕_P H^q)/R_j ≅ gr_j`. Thus this quotient specifies the relations in every
  dimension, including small dimensions. It does not count placements as
  independent. Keep these raw cup maps, C_j, Ψ_j and R_j with precisely the
  preceding coefficients. To specify their Brauer action, first let w_P be
  the list of the increasingly oriented pair blocks followed by the increasing
  free slots. Order pair blocks by their first endpoints. This list contains
  every slot once. Put ε(P)=sign(w_P) for Sp and ε(P)=1 for O. Exchanging
  whole two-slot blocks is even, so the sign is independent of their enumeration.
  Let D_j on ⊕_P H^q multiply the P summand by ε(P); prove D_j²=1.

  Define ρ_std by ordinary partial-matching stacking: a stack that has fewer
  than q propagating strands is zero; otherwise it supplies an output placement
  Q, a loop count a and a permutation τ of the increasingly ordered free
  slots. Its coefficient is δ^a, and its action on H^q is the ordinary
  permutation for O and sign(τ) times the ordinary permutation for Sp.
  Use the native stacking product order to fix τ without an inverse ambiguity.
  The action on the **raw** cup domain is
  `ρ_raw(b)=D_j ρ_std(b) D_j`. Thus the coefficient from P to Q in the
  symplectic case is `ε(Q) ε(P) δ^a sign(τ)` multiplying the ordinary
  free-slot permutation; in the orthogonal case the two ε factors are 1.
  The normalized map `C_j D_j` uses normalized cups `ε(P) cup_P` and
  intertwines ρ_std; the unchanged C_j and Ψ_j intertwine ρ_raw.

  Construct these actions and prove their algebra laws and compatibility with
  the actual tensor action for both adjacent crossing generators and adjacent
  contraction generators, including closed loops and stacks that lose
  propagating strands. Prove the general diagram formula from these identities.
  In particular R_j is ρ_raw-stable, D_j R_j is the relation space for Ψ_j D_j,
  and D_j transports the resulting quotient actions. Shape-wise this constructs
  the multiplicity quotient below. All relabelling and cell comparisons use
  this same diagonal change of basis.
  As a separate sufficient stability theorem, prove Ψ_j injective when
  **n≥2k in the orthogonal case, or l≥k in the symplectic case**. In this
  range R_j=0 and `dim gr_j = |P_(k,j)| dim H^q`, where
  `|P_(k,j)|=k!/(2^j j! (k−2j)!)`. Prove this by the diagram-cell basis and
  its nonsingular Gram form in this range, or an independent leading-term
  argument. This stable independence is stronger than existence of a
  geometric decomposition. Require the cup maps and quotient actions to
  commute with relabelling, and identify F_j with the sum of the j-cup and
  higher-cup components in the valence decomposition.

- **Multiplicity modules and the two label conventions.** For every k set
  `J_k={(j,λ):0≤j≤⌊k/2⌋, λ⊢k−2j}` and impose the relevant admissibility
  condition above. Define
  `G_(k,λ)=Hom_G(E_λ,T^k)` as the actual linear space of group intertwiners,
  with Brauer action `b·f=ρ(b)∘f`. Prove evaluation gives the simultaneous
  group/Brauer equivalence
  `⊕_((j,λ)∈J_k, admissible) E_λ⊗G_(k,λ) ≅ T^k`.
  Zero multiplicity spaces contribute zero, in particular for V=0 and k>0.
  For positive-dimensional V prove the displayed admissible multiplicities
  nonzero, and identify which of them occur in each `gr_j`: precisely
  `|λ|=k−2j`. Construct the comparison with Ψ_j on every Young isotypic
  component; an abstract direct-sum dimension count does not identify the maps.

  Fix **standard Brauer labels** by constructing the diagram cell module
  `Δ_(k,μ)=ℂ[P_(k,j)]⊗S^μ` for μ⊢k−2j: diagram stacking acts on free slots
  by the ordinary Specht action, and the j=0 module is S^μ via
  `B_k/I_1≅ℂ[S_k]`. Prove the stacking rule, contravariant Gram pairing
  and its radical API, and denote its nonzero simple head by D_(k,μ).
  In the geometric range identify G with that head (with the same
  left-action convention; reflection of diagrams transports a right-module
  source convention to this one). Then
  `G^O_(k,λ)≅D_(k,λ)` and **`G^Sp_(k,λ)≅D_(k,λ′)`**.
  First apply D_j to pass from the raw cup domain to standard stacking.
  The second comparison then uses `S^λ⊗sign≅S^(λ′)` on the free slots, because
  the symplectic Brauer crossing is minus the ordinary flip. It does not
  transpose the group-module Young shape. The matching signs ε(P) and this
  free-slot sign twist are both required, including q=1 when the latter is
  trivial. Transport the contravariant Gram pairing by the same D_j: its
  raw-placement matrix is D_j times the standard matrix times D_j, with the
  corresponding transported radical. Construct these comparisons and
  their evaluation/cup compatibility, and prove simplicity over the actual
  image algebra. At zero dimension use the preceding boundary statements
  rather than asserting a nonzero cell head for the empty label at every k.

- **Three separate semisimplicity statements.** Over ℂ the finite-dimensional
  rational tensor representations of O and Sp are completely reducible;
  disconnected O is handled by its finite component group in characteristic
  zero. Hence their endomorphism commutants are products of full matrix
  algebras. After the FFT surjection, the **Brauer image** is semisimple in
  every dimension. This proves the image-level evaluation decomposition and
  equivariant splitting of the F_j filtration even if the abstract Brauer
  algebra is not semisimple. Cup-placement independence is the separate
  stability theorem above. Finally retain the abstract-algebra theorem:
  for generic δ, B_k(δ) is split semisimple with simples indexed by the
  partitions of k,k−2,…; for integer δ the bound `|δ|≥2k−2` is sufficient,
  not sharp, with k=0,1 proved directly. Prove the stated sufficient bound
  from [Rui's criterion, Theorem 1.2](https://math.ecnu.edu.cn/preprint/2004-012.pdf)
  as `brauerAlgebra_isSemisimple_of_large_abs`, at both n and −2l.
  This abstract criterion is used to obtain a nonsingular cell Gram form
  and stable diagram-module dimensions where those stronger conclusions
  are required; it is not a hypothesis of the geometric decomposition.
  Outside it the cell radical and the tensor-action kernel must be
  distinguished; full modular/nonsemisimple cellular theory remains the
  programme described by the retained Temperley–Lieb comparison, rather
  than a premise silently assumed here.

- **Low-rank acceptance examples and cup relations.** For Sp₂ at k=2,
  H²=Sym²(ℂ²) has dimension 3, ordinary shape (2), while the native
  crossing acts by −1 and its cap-cup generator by zero. Its Brauer
  multiplicity label is therefore (1,1), including in the semisimple
  equality case `|−2|=2k−2`. At k=3 let e and f be the coordinate
  basis vectors indexed by `Sum.inl 0` and `Sum.inr 0`. Native `Matrix.J`
  has J(e,f)=−1 and J(f,e)=1, so its inverse-form cup is
  θ=e⊗f−f⊗e. Define D₁₂,D₁₃,D₂₃ by inserting this native cup in
  those slots. Prove on e,f that `D₁₂−D₁₃+D₂₃=0`.
  In placement order (12,13,23), ε=(1,−1,1).
  On the raw domain V⊕V⊕V the four generator actions are
  `s₁(x,y,z)=(x,−z,−y)`, `s₂(x,y,z)=(−y,−x,z)`,
  `e₁(x,y,z)=(−2x−y+z,0,0)` and
  `e₂(x,y,z)=(0,0,x−y−2z)`.
  Prove C intertwines each with the actual minus-flip or cap-cup action
  in the corresponding adjacent tensor slots. Check that s₁ and s₂ fix
  r(v)=(v,−v,v), while e₁ and e₂ kill it. Under D=diag(1,−1,1),
  this becomes the relation (v,v,v) for the normalized cups
  (D₁₂,−D₁₃,D₂₃) and standard stacking. Each map has rank 2,
  their sum has rank **4**,
  H³=Sym³(ℂ²) has dimension **4**, and
  `(ℂ²)^{⊗3}≅Sym³(ℂ²)⊕(ℂ²⊗ℂ²_mult)` as Sp₂ modules (the second ℂ²
  is the two-dimensional multiplicity space with trivial Sp₂ action),
  equivalently Sym³V⊕V⊕V. Construct the cup-kernel comparison, not a
  fictitious sum of three independent V's. Prove B₃(−2) is not semisimple,
  for example from the singular j=1 cell Gram matrix (diagonal −2,
  off-diagonal 1 in the normalized placement basis, using exactly the
  same D=diag(1,−1,1) to transport the raw Gram matrix), while its
  geometric image is semisimple. These examples test all three distinctions.

---

## Worked examples (acceptance criteria)

- **`S₃` Specht modules recover the `S₃` table.** The three partitions of `3` give `S^{(3)}` (trivial,
  dim `1`), `S^{(2,1)}` (standard, dim `2`), `S^{(1,1,1)}` (sign, dim `1`); degrees `1, 1, 2` and the
  character table match [../CharacterTheory](../CharacterTheory/README.md)'s table for `Equiv.Perm (Fin 3)`,
  computed there by Dixon-Schneider. `∑ (dim)² = 1 + 1 + 4 = 6 = 3!`.
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
- **LR and Hall normalization.** Enumerate the two ballot tableaux giving
  `c^{(3,2,1)}_{(2,1),(2,1)} = 2`, and verify the corresponding finite-variable
  product coefficient for d≥3. Check `⟨p_(1,1),p_(1,1)⟩ = 2` and that degree-2
  Schur functions are orthonormal.
- **Schur-Weyl on `(ℂ²)^{⊗2}`.** With `d = 2, n = 2`, only `(2)` and `(1,1)` have `ℓ(λ) ≤ 2`, so
  `(ℂ²)^{⊗2} ≅ S^{(2)} ⊗ Sym²(ℂ²) ⊕ S^{(1,1)} ⊗ ⋀²(ℂ²)`; the `S₂`-action is symmetric/antisymmetric,
  `𝕊^{(2)}(ℂ²) = Sym²(ℂ²)` has dimension `3`, `𝕊^{(1,1)}(ℂ²) = ⋀²(ℂ²)` has dimension `1`, and `1·3 + 1·1 =
  4 = 2²`. Verify the two actions commute and the decomposition holds.
- **Brauer duality on `(ℂ³)^{⊗2}` for `O(3)`.** With `n = 3, k = 2`, `B_2(δ)` has the
  `(2·2−1)!! = 3` diagrams `1` (two through-strands), `s` (the crossing), and `e` (bottom cap with top cup),
  with `s² = 1`, `e² = δ·e`, `s·e = e`; dimension `3`. At `δ = 3` its image on `(ℂ³)^{⊗2}` is the full
  centralizer of `O(3)`, and `(ℂ³)^{⊗2} ≅ Sym²₀(ℂ³) ⊕ ⋀²(ℂ³) ⊕ ℂ` of dimensions `5 + 3 + 1 = 9 = 3²`: the
  traceless-symmetric, antisymmetric, and trace (invariant-form) pieces. The trace summand `ℂ` is the image
  of the cup-cap `e` and is exactly what is **absent** from the `GLₔ` decomposition `Sym² ⊕ ⋀²` of the
  previous example; it is the harmonic (traceless) filtration at work. The symplectic mirror is
  `Sp(2) = SL(2, ℂ)` with the alternating form and `δ = −2`.

## Ordering

Layer 0 (the dictionary, orders, standard tableaux, λ-tableaux) is the foundation everything rests on and
comes first; the `partitionEquivConjClasses` bijection is a prerequisite for every character statement.
Layer 1 (Young subgroups, `M^λ`, Kostka counts) and Layer 2 (Young symmetrizers) are independent lanes off
Layer 0. Layer 3 (Specht modules, submodule theorem) needs Layers 1-2; Layer 4 (irreducibility,
completeness) needs Layer 3 and imports #irreducibles = #classes from
[../CharacterTheory](../CharacterTheory/README.md). Layer 5 (standard basis, hook length) needs Layer 3's
Specht modules and Layer 0's standard tableaux. Layer 6 (characters) needs Layers 4-5
and connects back to the character table of [../CharacterTheory](../CharacterTheory/README.md). Layer 7
(Schur functions, Frobenius characteristic, RSK) needs the characters of Layer 6 for the Frobenius map;
its independent power-sum proof then supplies character-side Murnaghan–Nakayama,
but the RSK bijection and Schur polynomials can be built in parallel from Layer 0. Layer 8 (Schur-Weyl)
needs Layers 3-4 (Specht modules and their irreducibility), the native tensor-power
and symmetrizer-image APIs, and ClassicalGroups Layer 2 for its Schur-functor carrier.
Its equivariant decomposition does not use the torus-character theorem of
ClassicalGroups Layer 4; that theorem uses Layer 7's independent Frobenius formula. A
contributor can finish Layers 0-5 (the Specht classification and hook-length dimensions, enough for the
`S₃`/`S₄` acceptance criteria) well before the Murnaghan-Nakayama rule or Schur-Weyl duality. Layer 9
(the Brauer algebra and orthogonal/symplectic Schur-Weyl) needs Layer 8's tensor-power actions, the native GL commutant theorem (for the invariant-tensor bridge), and the
diagram combinatorics built there, and parallels [Temperley–Lieb](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58) (whose
`TL_k` is the planar pairing subalgebra of `B_k(δ)`) and [../ClassicalGroups](../ClassicalGroups/README.md) (whose
`O(V)`, `Sp(V)` are the groups being centralized); it is the last and most independent lane, and its Brauer
combinatorics can be developed in parallel with everything from Layer 0 onward.

## References

- G. D. James, *The Representation Theory of the Symmetric Groups*, Lecture Notes in Mathematics 682,
  Springer (1978) - Layers 1-5: tabloids, permutation modules `M^λ`, polytabloids, the submodule theorem,
  the Specht modules, the standard basis, and the classification over a field of any characteristic (we
  take characteristic `0`).
- W. Fulton, *Young Tableaux*, London Mathematical Society Student Texts 35, CUP (1997) - Layers 0, 7, 8:
  Young diagrams and tableaux, RSK, the Littlewood-Richardson rule, Schur polynomials, and the Schur
  functors / Schur-Weyl construction.
- B. E. Sagan, *The Symmetric Group: Representations, Combinatorial Algorithms, and Symmetric Functions*,
  2nd ed., Graduate Texts in Mathematics 203, Springer (2001) - Layers 2-7: Young symmetrizers, the Specht
  modules, the hook-length formula, the Murnaghan-Nakayama rule, RSK, and the Frobenius characteristic.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Graduate Texts in Mathematics 129,
  Springer (1991) - Lectures 4, 6: Young symmetrizers and the Specht construction over `ℂ`, and (Lecture
  6, Appendix) Schur-Weyl duality and the Schur functors of `GLₔ`.
- I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., Oxford (1995) - Layer 7: Schur
  functions, Jacobi-Trudi, the Hall inner product, the Frobenius characteristic, and the Cauchy identity.
- R. Brauer, *On algebras which are connected with the semisimple continuous groups*, Ann. of Math. 38
  (1937), 857-872. Layer 9: the original definition of the Brauer algebra `B_k(δ)` and its role as the
  centralizer of the orthogonal and symplectic groups on `V^{⊗k}`.
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009). Layer 9:
  Schur-Weyl duality for `O(V)` and `Sp(V)`, the Brauer algebra, the harmonic (traceless) tensors, and the
  first fundamental theorem of invariant theory behind the double centralizer.

- H. Rui, [*A criterion on the semisimple Brauer algebras*](https://math.ecnu.edu.cn/preprint/2004-012.pdf),
  J. Combin. Theory Ser. A 111 (2005), 78–88, Theorem 1.2 — the sufficient
  absolute-parameter semisimplicity range in Layer 9.
- R. Dipper, S. Doty and J. Hu, [*Brauer algebras, symplectic Schur algebras and
  Schur–Weyl duality*](https://arxiv.org/abs/math/0503545), Trans. Amer. Math. Soc. 360
  (2008), 189–213 — signed symplectic tensor action and its two centralizers;
  Theorem 1.2(1) and Theorem 1.4 in the numbering of arXiv v2 — the symplectic surjection onto the commutant.
- S. Doty and J. Hu, [*Schur–Weyl duality for orthogonal groups*](https://arxiv.org/abs/0712.0944),
  Proc. Lond. Math. Soc. (2009), Theorem 1.2(b) in the numbering of arXiv v3 — the orthogonal
  surjection onto the commutant, used as the endpoint of the invariant-tensor bridge in Layer 9.
