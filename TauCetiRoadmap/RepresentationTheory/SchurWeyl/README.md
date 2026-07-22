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
modules and Schur functors of `GLₔ`, Schur polynomials as their characters) and, through the Brauer algebra
of Layer 9 (whose planar pairing diagrams form the Temperley-Lieb subalgebra), to
[the Temperley-Lieb roadmap](../../TemperleyLieb/README.md).

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
  `isIrreducible_iff_isSimpleModule`, and state the classification in both languages. Permutation modules
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
  (`Representation.IsIrreducible`, `isIrreducible_iff_isSimpleModule`),
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
and the multiplicity-free decomposition `(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)`; and, breaking
`GLₔ` to its orthogonal and symplectic subgroups by fixing an invariant form, the **Brauer algebra**
`B_k(δ)` with its diagram basis and `δ`-power loop rule, its action on `V^{⊗k}` by contracting and expanding
against the form, and the **orthogonal/symplectic Schur-Weyl duality** in which the **images** of `ℂ[O(V)]`
(resp. `ℂ[Sp(V)]`) and of `B_k(n)` (resp. `B_k(-2l)`) in `End(V^{⊗k})` are each other's centralizers, with
the harmonic (traceless) tensors carrying the group-irreducible pieces. None of this is upstream (Mathlib has
no Brauer algebra, no diagram algebra of any kind, and no orthogonal/symplectic Schur-Weyl duality). Beyond
the named objects, a thin **representation-theory plumbing** layer is also needed and assumed available:
scalar extension of representations and characters under `ℂ ⊗_ℚ (-)`, idempotent-generated submodules and
left ideals as representations, and centralizer/bicommutant APIs for the image subalgebras of `End`.

`Suggested.lean` pins the load-bearing objects (`partitionEquivYoungDiagram`,
`partitionEquivConjClasses`, `Dominates`, `StandardYoungTableau`, `youngSubgroup`, `permutationModule`,
`youngSymmetrizer`, `spechtModule`, `hookLength`, `spechtCharacter`, `rsk`, `schurPoly`,
`schurWeylDecomposition`, `brauerAlgebra`, `brauerActionOrth`, `orthAction`, `harmonicTensors`) and the named
milestones as `sorry`-targets, so each is individually claimable.

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
  (StandardYoungTableau μ)` (this is `f^λ`), and the tableau transpose as basic API. Keep Layer 0 minimal:
  shape, entries, row/column monotonicity, transpose, and `Fintype`. Schützenberger evacuation is **not**
  needed for Specht modules, hook lengths, Murnaghan-Nakayama, or Schur-Weyl; defer it to an optional
  RSK/plactic appendix alongside Layer 7.
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
  `Kμμ = 1` and `Kλμ = 0` unless `μ` dominates... i.e. `Dominates λ μ` fails; and the base cases
  `M^{(n)} = S^{(n)}` (trivial) and `M^{(1ⁿ)} = ℚ[Sₙ]` (regular). At this stage only the combinatorial `Kλμ`
  and the dominance shape of the tabloid/homomorphism filtration are available: the **multiplicity of `S^λ`
  in `M^μ`** cannot be stated yet, since the Specht modules `S^λ` are constructed only in Layer 3 and their
  irreducibility only in Layer 4. **Young's rule proper** -- `M^μ = S^μ ⊕ ⊕_{λ ▷ μ} Kλμ S^λ` as the
  multiplicity statement -- is therefore deferred to after Layer 4 (see Layer 4).

### Layer 2: Young symmetrizers

- **Row, column, and Young symmetrizers.** For a `YoungTableau t`, the row symmetrizer `a_t = ∑_{p ∈
  rowSubgroup t} p`, the column antisymmetrizer `b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using
  `Equiv.Perm.sign`), and the **Young symmetrizer** `youngSymmetrizer t = c_t = a_t * b_t`, all in
  `MonoidAlgebra ℚ (Perm (Fin μ.card))`. Fix the convention `c_t = a_t * b_t` (row-symmetrize, then
  column-antisymmetrize) once and for all; the opposite ordering `b_t * a_t` produces the conjugate/dual
  Specht module, and Layer 3 pins its isomorphism for exactly this ordering.
- **Idempotent theory.** `c_t` is essentially idempotent: `c_t * c_t = (n! / f^λ) • c_t`, so
  `(f^λ / n!) • c_t` is an idempotent. Prove `a_t`, `b_t` are (up to scalar) idempotents, the absorption
  `p * a_t = a_t` for `p ∈ rowSubgroup t` and `b_t * q = sign(q) • b_t` for `q ∈ colSubgroup t`, and the
  **key vanishing lemma in its correct row/column-intersection form**: if some two **distinct entries lying
  in a common row of `t`** are carried by `σ` into a **common column of `t`**, then `a_t * σ * b_t = 0`.
  Contrapositively, `a_t * σ * b_t ≠ 0` forces `σ` to factor as `σ = p q` with `p ∈ rowSubgroup t` and
  `q ∈ colSubgroup t`. (The naive form "`a_t σ b_t = 0` unless `σ ∈ rowSubgroup t · colSubgroup t`" is not
  the right lemma to prove; the intersection criterion is what the argument actually establishes, and it is
  what yields the scalar relation on `c_t k[Sₙ] c_t`.) These are the facts that make `k[Sₙ] c_t` irreducible.

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
  integral standard-polytabloid structure of Layer 5 rather than from rational character values. Only then
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
- **Young's rule proper (deferred from Layer 1).** With the Specht modules and their irreducibility in hand,
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
  corollary, obtained only after the separate divisibility lemma `∏_c hookLength μ c ∣ n!`. State also
  `∑_{λ ⊢ n} (f^λ)² = n!` as a consequence of Layer 7's RSK (and cross-check that it equals
  `finrank ℚ[Sₙ] = n!`).

### Layer 6: characters and the Murnaghan-Nakayama rule

- **The Specht character.** The native character of `spechtModule μ` lands in the base field `ℚ`
  (`(spechtModule μ).character : Perm (Fin n) → ℚ`). The `ℤ`-valued `spechtChar μ : Perm (Fin n) → ℤ` is a
  **refinement**: its integrality (the classes of `Sₙ` are rational) is a theorem, recorded by the cast
  `spechtChar_cast`, not baked into the character's definition. It depends only on the cycle type, so it
  descends to `spechtCharValue μ : Nat.Partition n → ℤ` via `partitionEquivConjClasses`. Assemble the
  **character table of `Sₙ`** as `Matrix (Nat.Partition n) (Nat.Partition n) ℤ`, `X λ μ = χ^λ(cycle type μ)`,
  and prove it satisfies the `IsCharacterTableSpec` of [../CharacterTheory](../CharacterTheory/README.md).
- **Class sizes.** The orthogonality weights are the class sizes `n! / z_μ`, `z_μ = ∏_i i^{mᵢ} mᵢ!`, where
  `mᵢ` is the multiplicity of the part `i` in `μ`. This needs a small combinatorial helper, a named build
  item here: `partMultiplicity μ i`, `zPart μ = ∏_i i^{mᵢ} mᵢ!`, and
  `card {σ : Perm (Fin n) // σ.partition = μ} · zPart μ = n!`.
- **Rim hooks and Murnaghan-Nakayama.** A **rim hook** (border strip) of a diagram is a connected
  skew shape containing no `2×2` block; its **height** is one less than its number of rows. Deleting an
  `r`-cycle from `σ : Perm (Fin n)` changes the underlying set from `Fin n` to `Fin (n-r)`, which is awkward
  at the permutation level, so state the **Murnaghan-Nakayama rule primarily on cycle-type partitions**:
  writing `μ ∖ ρ` for the diagram obtained by removing a rim hook `ρ` of size `r` and `ν.removePart r` for
  the cycle type with one part `r` deleted,
  `χ^λ(ν) = ∑_{ρ of size r} (-1)^{height ρ} · χ^{λ ∖ ρ}(ν.removePart r)`, then prove compatibility with
  representatives `σ` separately. This recursion **computes** the whole character table from the empty
  diagram; derive the special cases: value at the identity is `f^λ` (Layer 5), value of `χ^{(1ⁿ)}` is
  `sign`, and the Frobenius formula below.

### Layer 7: symmetric functions, the Frobenius characteristic, and RSK

- **Schur polynomials (finitely many variables).** Summing `x^{content T}` over **all** semistandard
  tableaux with unbounded natural entries would give an infinite power series, not a polynomial, so define the
  Schur polynomial in a **finite** alphabet: `schurPoly (σ : Type) [Fintype σ] μ : MvPolynomial σ ℤ`,
  `∑_T x^{content T}` over the semistandard tableaux of shape `μ` with entries in `σ` (equivalently entries
  `< d` for `σ = Fin d`). The **Jacobi-Trudi** identity is a determinant of a **finite** matrix over
  `Fin r` with `r ≥ ℓ(λ)`, using the **integer-indexed** complete-homogeneous symmetric function
  `hZ : ℤ → MvPolynomial σ ℤ` with `hZ 0 = 1`, `hZ m = 0` for `m < 0`, and `hZ m = hsymm m` for `m > 0`
  (writing `hsymm (μᵢ - i + j)` over naturals silently truncates negative indices and gives the wrong
  formula): `schurPoly σ μ = det (fun i j => hZ (μᵢ - i + j))`. Prove the two definitions agree, that
  `schurPoly` is symmetric, and the dual (transpose) Jacobi-Trudi with `esymm`. The Schur functions are a
  `ℤ`-basis of the symmetric functions; `msymm`-to-`schurPoly` change of basis is the Kostka matrix `Kλμ`
  of Layer 1.
- **The Frobenius characteristic.** Start with a **finite-variable, degree-bounded** form: the map from
  class functions of `Sₙ` to symmetric homogeneous polynomials of degree `n` in `Fin d` variables (`d ≥ n`),
  sending `χ^λ ↦ schurPoly (Fin d) λ`, so `ch(χ^λ) = s_λ` and the power-sum expansion
  `p_μ = ∑_λ χ^λ(μ) s_λ` **is** the character table. The stable symmetric-function ring and the Hall inner
  product (in which `ch` is an isometry) are deferred to a later, separately stated step, since Mathlib has
  no ready-made graded symmetric-function ring. This ties Layer 6 to Schur functions and gives a second
  route to Murnaghan-Nakayama (Pieri/Newton).
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
- **The double centralizer (image-level).** State the theorem about the two **image** subalgebras of
  `End (tensorSpace d n)`: the image of `ℂ[Sₙ]` and the image of `ℂ[GLₔ]` are each other's centralizers
  (full mutual commutant), a case of the double-centralizer theorem for the semisimple algebra `ℂ[Sₙ]`. The
  distinction is not cosmetic: the `Sₙ`-image is **not faithful when `d < n - 1`** (only partitions with
  `ℓ(λ) ≤ d` survive, so the full group algebra maps on as a proper quotient), and the centralizer of `GLₔ`
  is the **image** of `ℂ[Sₙ]`, not `ℂ[Sₙ]` itself. Add the separate **faithfulness refinement** that the
  `Sₙ`-image is faithful once `d ≥ n`.
- **The decomposition and Schur functors.** As an `Sₙ × GLₔ`-representation,
  `tensorSpace d n ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)`, where the **Schur functor** `𝕊^λ(ℂᵈ)` is defined
  primarily as the **image (range) of the Young symmetrizer `c_t` acting on `V^{⊗n}`** -- this avoids the
  balanced-tensor right-module conventions that make the alternative `(V^{⊗n}) ⊗_{ℂ[Sₙ]} S^λ` convention-
  sensitive (with a later theorem identifying the two once right-module conventions are fixed). It is the
  irreducible polynomial `GLₔ`-representation of highest weight `λ`, with `dim 𝕊^λ(ℂᵈ) = schurPoly μ (1,…,1)`
  (`d` ones) and character `schurPoly`. The special cases `𝕊^{(n)} = Symⁿ` and `𝕊^{(1ⁿ)} = ⋀ⁿ` connect to
  Mathlib's `SymmetricPower` and exterior powers. This is the link to
  [../ClassicalGroups](../ClassicalGroups/README.md), where the `𝕊^λ` are the Weyl modules and
  `schurPoly` their characters.

### Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra)

Layer 8 is the `GLₔ × Sₙ` duality on `V^{⊗n}` for `V = ℂᵈ` with no extra structure. Fixing a nondegenerate
invariant form on `V` breaks `GLₔ` to its orthogonal or symplectic subgroup, and the centralizer of the
smaller group is correspondingly larger than the image of `ℂ[Sₖ]`: it is the image of the **Brauer algebra**
`B_k(δ)`, whose diagrams may now join two bottom points, or two top points, by a horizontal arc, contracting
the paired tensor slots against the form. The symmetric group sits inside as the through-strand ("no-arcs")
diagrams, so this layer **contains** Layer 8's `Sₖ`; and the planar pairing diagrams form the Temperley-Lieb
**subalgebra** `TL_k(δ) ⊆ B_k(δ)` of [the Temperley-Lieb roadmap](../../TemperleyLieb/README.md) (`B_k(δ)` is
the non-planar generalization of `TL_k`). The orthogonal and symplectic groups here are the extra-invariant
restrictions of `GLₔ` studied in [../ClassicalGroups](../ClassicalGroups/README.md).

A standing caution for this layer: over `ℂ`, Mathlib's `Matrix.orthogonalGroup (Fin n) ℂ` unfolds to
`Matrix.unitaryGroup (Fin n) ℂ`, i.e. the **unitary** group `U(n)` for the conjugate-linear form, **not** the
complex orthogonal group `O(n, ℂ)` of the symmetric bilinear form. Schur-Weyl duality here is about the
form-orthogonal group, so this layer uses an **honest form-orthogonal group** `complexOrthogonalGroup n`
(the isometries of the standard symmetric bilinear form, `{A | Aᵀ * A = 1}`), never `Matrix.orthogonalGroup`
over `ℂ`. The symplectic partner `Matrix.symplecticGroup (Fin l) ℂ` **is** the honest form-symplectic group,
but Mathlib packages it as a matrix `Submonoid` on `l ⊕ l`; the actions below consume it as that submonoid
(its coercion is a monoid, enough for a `MonoidHom` action) and do not assume group-of-units API.

- **Brauer diagrams and the Brauer algebra.** A **Brauer diagram** on `k` strands, `brauerDiagram k`, is a
  perfect matching of the `2k` boundary points `Fin k ⊕ Fin k` (`k` on the bottom, `k` on the top), i.e. a
  fixed-point-free involution of `Fin k ⊕ Fin k`. There are `(2k-1)!! = Nat.doubleFactorial (2k-1)` of them
  (`card_brauerDiagram`), of which the `k!` matchings with no horizontal arc (every bottom point joined to a
  top point) are the permutation diagrams. The **Brauer algebra** `brauerAlgebra δ k` is the free `ℂ`-module
  on `brauerDiagram k`, with multiplication by vertical stacking: place `D₁` above `D₂`, read off the induced
  matching of the outer boundary, and multiply by `δ^{c}`, where `c` is the number of closed loops formed in
  the middle (the **`δ`-power loop rule**). It is a unital associative `ℂ`-algebra with `brauerBasis` the
  diagram basis and `finrank = (2k-1)!!`; the loop rule and the resulting associativity are the load-bearing
  combinatorics, exactly as the gluing of [../../TemperleyLieb](../../TemperleyLieb/README.md) Layer 2 but
  without the planarity constraint (Brauer diagrams may cross). So that this combinatorics is a real target
  rather than hidden behind an opaque algebra, expose the diagram API explicitly as named build items: the
  edge-type predicates `isThrough`/`isCap`/`isCup` on a diagram's arcs, the permutation-diagram inclusion
  `permToBrauer` (the `k!` no-arcs matchings), the composition `composeDiagram D₁ D₂` on the underlying
  matchings, the middle-loop count `middleLoopCount D₁ D₂`, and the associativity of the loop-weighted
  composition (`compose_assoc` with matching loop-count bookkeeping) from which the algebra's associativity
  follows.
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
  stated `δ`; state those relations as the load-bearing lemmas. Restricted to the no-arcs (permutation)
  diagrams the action agrees with Layer 8's `permAction`, but this equality is convention-sensitive: pin it at
  the **generator level** (the diagram of an adjacent transposition acts as `permAction … (Equiv.swap i i+1)`
  under the chosen stacking and `PiTensorProduct.reindex` conventions), and if those conventions turn out to
  compose oppositely the correct statement carries a `σ⁻¹`.
- **Schur-Weyl duality (the double centralizer).** `O(V) = complexOrthogonalGroup n` (the honest
  form-orthogonal group, **not** `Matrix.orthogonalGroup` over `ℂ`) acts on `V^{⊗k}` diagonally (`orthAction`,
  the restriction of Layer 8's `glAction` along `O(V) ↪ GLₙ`), and this action **commutes** with
  `brauerActionOrth` (`brauerActionOrth_commute`). The **duality** is best split into two statements with
  different proofs, because the centralizer image statement does **not** rest on semisimplicity of the Brauer
  algebra (which can fail at the geometric parameter `δ = n`):
  - the **surjectivity onto the commutant** (first fundamental theorem of invariant theory for `O(V)`):
    `Subalgebra.centralizer ℂ (image of O(V)) = (brauerActionOrth n k).range`
    (`brauerActionOrth_surjective_to_commutant`), and its symplectic analogue
    `brauerActionSymp_surjective_to_commutant`. This is the invariant-theoretic heart and holds regardless
    of semisimplicity;
  - the **reverse centralizer** (`Subalgebra.centralizer ℂ (brauer image) = adjoin(image of O(V))`) as a
    finite-dimensional bicommutant statement for the two image subalgebras, with its hypotheses recorded
    explicitly.
  Everything is **image-level** and the partner of `O(V)` is the **image** algebra `(brauerActionOrth n k).range`,
  not the abstract `B_k(n)` (the Brauer action is not faithful in small dimension). The symplectic mirror uses
  `Sp(V) = Matrix.symplecticGroup (Fin l) ℂ` (Mathlib's honest form-symplectic submonoid) with `B_k(-2l)`. A
  separate clean-module-decomposition theorem then uses semisimplicity where it genuinely holds. This is the
  orthogonal/symplectic analogue of Layer 8's `GLₔ × Sₙ` double-centralizer theorem and the point of contact
  with [../ClassicalGroups](../ClassicalGroups/README.md).
- **Harmonic tensors and the trace maps.** The **contraction (trace) maps** `V^{⊗k} → V^{⊗(k-2)}` (cap one
  pair of slots against the form, in all `C(k,2)` positions) have a common kernel, the **harmonic**
  (traceless) tensors `harmonicTensors n k`. The harmonic tensors are **not** a single irreducible and do
  not by themselves "carry the irreducible `O(V)`-pieces": the irreducible `O(V)`-module `E_λ` is the
  **trace-free part of the shape-`λ` Schur/Weyl piece** -- apply the Young symmetrizer `c_t` to `V^{⊗k}` and
  then intersect with `harmonicTensors` -- with `λ` restricted by the orthogonal (resp. symplectic)
  truncation condition on its column lengths. The horizontal-arc diagrams build the non-harmonic part from
  cups on lower tensor powers, giving first a **trace filtration** of `V^{⊗k}` whose subquotients are the
  `harmonicTensors n (k-2j)` re-expanded by `j` cups. Only **under semisimplicity / large dimension** does
  this filtration split as a direct sum, giving `V^{⊗k} ≅ ⊕_λ E_λ ⊗ G_λ` as an `O(V) × B_k(n)`-representation
  (`G_λ` the corresponding irreducible Brauer module), the sum over the surviving partitions. This refines
  Layer 8's multiplicity-free `⊕_λ S^λ ⊗ 𝕊^λ` by the trace filtration: the cups and caps are exactly the
  extra generators beyond `Sₖ`.
- **Semisimplicity of `B_k(δ)`.** For **generic** `δ` the Brauer algebra is semisimple, with irreducibles
  indexed by partitions of `k, k-2, k-4, …`. The concrete bound `|δ| ≥ 2k - 2` is a **sufficient, not sharp**
  range (the exact criterion is Wenzl's; do not present the excluded set as the precise locus of failure), and
  it is stated in terms of `|δ|` so that it covers **both** geometric values: the orthogonal `δ = n` and the
  symplectic `δ = -2l`. Pin it accordingly as a single `|δ|`-hypothesis theorem
  `brauerAlgebra_isSemisimple_of_large_abs`, instantiated at `δ = n` and at `δ = -2l`. Outside the semisimple
  range the algebra can fail to be semisimple, and its cell theory (Brauer is a cellular algebra, exactly as
  [../../TemperleyLieb](../../TemperleyLieb/README.md) Layer 5 develops for `TL_k`) governs the modular
  behaviour. The semisimple range is what makes the `⊕_λ E_λ ⊗ G_λ` decomposition clean and forces the
  multiplicities.

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
`S₃`/`S₄` acceptance criteria) well before the Murnaghan-Nakayama rule or Schur-Weyl duality. Layer 9
(the Brauer algebra and orthogonal/symplectic Schur-Weyl) needs Layer 8's tensor-power actions and the
diagram combinatorics built there, and parallels [../../TemperleyLieb](../../TemperleyLieb/README.md) (whose
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
</content>
</invoke>
