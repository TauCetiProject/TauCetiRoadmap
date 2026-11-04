# Roadmap: induction, restriction, and Mackey theory for finite groups

Mathlib has, surprisingly recently and surprisingly completely, the **functorial heart** of induction
and restriction for representations. It defines the induced representation `Representation.ind φ ρ` and
its packaged functor `Rep.indFunctor k φ`, the coinduced representation `Representation.coind φ σ` and
`Rep.coindFunctor k φ`, the restriction functor `Rep.resFunctor φ`, and it proves the two adjunctions
that are the abstract form of **Frobenius reciprocity**: `Rep.indResAdjunction` (induction is *left*
adjoint to restriction) and `Rep.resCoindAdjunction` (restriction is left adjoint to coinduction). For a
finite-index subgroup it proves `Rep.indCoindIso`, that `Ind` and `Coind` agree, and derives the second
adjunction `Rep.resIndAdjunction` making `Ind` simultaneously left and right adjoint to `Res`. It even
has the coinvariants form of the projection identity, `Rep.coinvariantsTensorIndNatIso`, built to prove
Shapiro's lemma. The double-coset combinatorics that Mackey theory runs on, `DoubleCoset.Quotient H K`
with its disjoint cover `DoubleCoset.iUnion_quotToDoubleCoset`, are also present.

Tau Ceti supplies the classical induction core on this Mathlib spine: transitivity,
projection and coinduction projection formulas, conjugation, finite-dimensional
induction and its character formulas, character Frobenius reciprocity, and Mackey
splitting and ordinary-characteristic-zero irreducibility. It also supplies substantial
Clifford theory, virtual characters, Artin/Brauer induction and cyclotomic descent,
and normalized projective/factor-set interfaces. Consume the exact declarations,
hypotheses and conventions listed below. Remaining work consists of the specified
model comparisons, broader coefficient-field adapters, character/Grothendieck
comparisons and worked arithmetic/group examples; no blanket missing-core claim
replaces this source-level inventory.

This roadmap specifies that complete theory and consumes its existing implementations. It is deliberately built on Mathlib's categorical spine `Rep k G` wherever
Mathlib already works there, so that the adjunctions above are *consumed*, not reproved, and the character
theory is layered on top through `FDRep.character`. The character-side results (the induced-character
formula, Frobenius reciprocity as a pairing, permutation characters) feed directly into the
[character-theory roadmap](../CharacterTheory/README.md): induced characters from Young subgroups and
permutation characters are among the standard ways a character table is populated, and that roadmap's
`characterPairing` is the pairing this one's Frobenius reciprocity is stated against.

Suggested home: `TauCeti/RepresentationTheory/Induction/`, mirroring Mathlib's `RepresentationTheory/`.

## Standing conventions

- **The group and its subgroups.** `G` is a group throughout (`[Group G]`), finite (`[Fintype G]` or
  `[Finite G]`) exactly where a result needs it, and `[DecidableEq G]` where a sum over `G` must compute.
  Induction and restriction go between a subgroup and the whole group: for `S : Subgroup G` we induce **up**
  along `S.subtype : S →* G` and restrict **down** along the same map. Write `S.index` for `[G : S]` and
  carry `[S.FiniteIndex]` as an explicit hypothesis; over a finite `G` it is automatic but we never bury it.
  The general functorial statements are stated for an arbitrary group homomorphism `φ : G →* H`, matching
  Mathlib, and specialized to `S.subtype` where the subgroup structure is used.

- **The coefficient ring, in three regimes.** State each result at exactly the generality it needs,
  matching Mathlib, and keep the three regimes separate; do not bundle "algebraically closed and
  `char ∤ |G|`" into a class, and spell the hypotheses each result uses.
  1. **Representation-level** (induction, restriction, coinduction, transitivity, the projection formula,
     the Mackey decomposition as an isomorphism of representations) over a commutative ring `k`
     (`[CommRing k]`), exactly as `Representation.ind` and `Rep.indResAdjunction` are.
  2. **Trace and character formulas** (the induced character, the conjugate character, the Mackey character
     identity) over a field `k`, where `FDRep.character` is available. The induced-character identity is
     stated **first** as a sum over coset representatives with **no division by `|S|`**, valid over any
     field; the averaged group-sum form `(Nat.card S : k)⁻¹ · ∑` is a corollary carrying the explicit
     hypothesis `IsUnit (Nat.card S : k)` (equivalently `char k ∤ |S|`), since dividing by `|S|` is
     otherwise meaningless.
  3. **Normalized pairings and semisimple criteria.** The native Frobenius
     pairing identities hold over every field with `IsUnit (Nat.card G : k)`.
     Scalar orthogonality and splitting-field Clifford/iff statements additionally
     carry their stated scalar-Schur/splitting hypotheses. Algebraic closure
     with `char k ∤ |G|` supplies both for the concrete worked tables over ℂ
     and the [character-theory roadmap](../CharacterTheory/README.md).
     Layer4 also retains its arbitrary-field
     semisimple sufficient criterion and endomorphism-division characterization. Its iff
     criterion takes the explicit scalar-Schur output of a splitting field, separately from
     Maschke; neither condition is hidden in a new field class.

- **The primary spine is the categorical `Rep k G`; the character side is the mirror.** Mathlib's induction,
  coinduction, restriction, and both adjunctions live on the category `Rep k G` (objects a `k`-module with a
  `Representation k G` action). Develop the functorial theory there, reusing `Rep.ind`, `Rep.res`,
  `Rep.coind`, `Rep.indResAdjunction`, and `Rep.resCoindAdjunction` directly. The character theory is the
  mirror: characters are traces on `FDRep k G` (`FDRep.character`), so results about `Ind χ` are stated for
  `FDRep`, and the finiteness needed to take a trace (induction of a finite-dimensional representation of a
  finite-index subgroup is finite-dimensional) is consumed in Layer2 from
  `TauCeti.indFDRep` and `TauCeti.finrank_indFDRep`. Use Mathlib's vocabulary
  throughout: `Subgroup`, `Subgroup.subtype`, `Subgroup.subgroupOf`, `MulAut.conj`,
  `DoubleCoset.Quotient`, `Representation.IsIrreducible`, `CategoryTheory.Simple`, never a private synonym.

- **The primary adjunction is `Ind ⊣ Res`; the finite-index biadjunction is named separately.** The primary
  direction is Mathlib's `Rep.indResAdjunction`: induction is **left** adjoint to restriction, so
  `Hom_G(Ind_S^G A, B) ≃ Hom_S(A, Res_S B)`. This is *the* Frobenius reciprocity, and every reciprocity
  statement here is a shadow of it. For a **finite-index** subgroup, `Ind ≅ Coind` (`Rep.indCoindIso`), so
  restriction is *also* left adjoint to induction (`Rep.resIndAdjunction`), giving the second reciprocity
  `Hom_G(B, Ind_S^G A) ≃ Hom_S(Res_S B, A)`. Both are used; keep them named and distinct, and reserve
  "Frobenius reciprocity" for the character-inner-product form once the induced-character formula makes it
  expressible (Layer 2).

- **Conjugate representations are a named object, not an inline twist.** Mackey theory and Clifford theory
  are phrased in terms of the conjugate representation `{}^s V`: for `s : G` and a representation `A` of
  `H : Subgroup G`, `{}^s A` is the representation of the conjugated subgroup `MulAut.conj s • H` (that is,
  `s H s⁻¹`) on the same module, with `x : sHs⁻¹` acting by `A.ρ (s⁻¹ x s)`. Give it a name (`conjRep`),
  its functoriality, its character `({}^s χ)(x) = χ(s⁻¹ x s)`, and the coherence `{}^{st} ≅ {}^s {}^t`,
  before any Mackey statement uses it. This is the object every double-coset summand is built from.

- **Double cosets index the Mackey sum, and the indexing is `DoubleCoset.Quotient`.** The Mackey summands are
  indexed by the finite set `DoubleCoset.Quotient (K : Set G) H` of double cosets `K \ G / H`, with a chosen
  representative per class via `Quotient.out`. Use Mathlib's `DoubleCoset` API (`doubleCoset`,
  `iUnion_quotToDoubleCoset`, `disjoint_out`) for the disjoint cover, never a hand-rolled partition.

## What Mathlib already has (consume)

- **Restriction:** `RepresentationTheory/Rep/Res.lean` -- `Rep.resFunctor (φ : H →* G) : Rep k G ⥤ Rep k H`,
  `Rep.res φ M = (resFunctor φ).obj M` with `res_obj_ρ : (res f M).ρ = M.ρ.comp f`, its faithfulness, and
  `Rep.ofQuotient` for a representation trivial on a normal subgroup.
- **Induction:** `RepresentationTheory/Induced.lean` -- `Representation.ind φ ρ` (as `(k[H] ⊗[k] A)_G`),
  `Rep.ind φ A`, `Rep.indMap`, `Rep.indFunctor k φ`, the hom-equivalence `Rep.indResHomEquiv φ A B :
  (ind φ A ⟶ B) ≃ₗ[k] (A ⟶ res φ B)`, and the adjunction **`Rep.indResAdjunction k φ : indFunctor k φ ⊣
  resFunctor φ`**. Also the coinvariants projection identity `Rep.coinvariantsTensorIndIso` /
  `Rep.coinvariantsTensorIndNatIso`, `(Ind φ A ⊗ B)_H ≅ (A ⊗ Res φ B)_G`, built for Shapiro's lemma.
- **Coinduction:** `RepresentationTheory/Coinduced.lean` -- `Representation.coind φ σ` (as the
  `G`-equivariant functions `H → A`), `Representation.coind'` (as `Hom_{k[G]}(k[H], A)`) with
  `Rep.coindIso` identifying them, `Rep.coindFunctor k φ`, the hom-equivalence `Rep.resCoindHomEquiv`, and
  the adjunction **`Rep.resCoindAdjunction k φ : resFunctor φ ⊣ coindFunctor k φ`**.
- **Finite-index `Ind ≅ Coind`:** `RepresentationTheory/FiniteIndex.lean` -- `Rep.indCoindIso A :
  ind S.subtype A ≅ coind S.subtype A` and `Rep.indCoindNatIso k S` for `[S.FiniteIndex]`, whence the
  second adjunction **`Rep.resIndAdjunction : resFunctor S.subtype ⊣ indFunctor k S.subtype`** and
  **`Rep.coindResAdjunction : coindFunctor k S.subtype ⊣ resFunctor S.subtype`**.
- **Characters as traces:** `RepresentationTheory/Character.lean` -- `FDRep.character V g`, with `char_one`
  (`V.character 1 = finrank k V`), `char_conj`, `char_mul_comm`, `char_tensor`, `char_dual`, `char_iso`,
  and the finite-group orthogonality `char_orthonormal` with its supports
  `scalar_product_char_eq_finrank_equivariant`, `average_char_eq_finrank_invariants`.
- **Irreducibility:** `RepresentationTheory/Irreducible.lean` -- `Representation.IsIrreducible ρ` with
  `isSimpleModule_iff` / `isIrreducible_iff`, Schur's lemma (`IsIrreducible.bijective_or_eq_zero`,
  `Subsingleton (IntertwiningMap ρ σ)` for non-isomorphic irreducibles); `CategoryTheory.Simple` on
  `FDRep k G` with `FDRep.finrank_hom_simple_simple`.
- **Semisimplicity:** `RepresentationTheory/Semisimple.lean` supplies
  `IsSemisimpleRepresentation`, its `IsSemisimpleModule k[G]` comparison and Maschke.
  Consume those with Tau Ceti's normal-restriction, orbit, multiplicity and
  structural Clifford APIs below. Layer5 retains the precise selected/general-
  splitting-field isotypic dictionary, including finite irreducible sums, Hom
  multiplicities and constituent detection; it does not assert that the native
  Clifford infrastructure is absent.
- **Double cosets:** `GroupTheory/DoubleCoset.lean` -- `DoubleCoset.Quotient (H : Set G) K`,
  `DoubleCoset.doubleCoset a H K`, `mk`, `Quotient.out`, `iUnion_quotToDoubleCoset` (disjoint cover),
  `disjoint_out`, and the coset-decomposition lemmas `doubleCoset_union_leftCoset`.
- **Subgroup and conjugation API:** `Algebra/Group/Subgroup/*` -- `Subgroup.subtype`, `Subgroup.inclusion`,
  `Subgroup.subgroupOf H K : Subgroup K`, the pointwise action `MulAut.conj s • H : Subgroup G` (open scope
  `Pointwise`) with `Normal.conj_smul_eq_self`; `GroupTheory/Index.lean` -- `Subgroup.index`,
  `Subgroup.FiniteIndex`, `Subgroup.card_mul_index`.
- **Building blocks for the examples:** `Rep.trivial`, `Rep.leftRegular`, `Representation.ofMulAction` /
  `Rep.ofMulAction` (permutation representations), `Representation.linHom`, `Representation.dual`,
  `Equiv.Perm (Fin n)`, `GroupTheory/SpecificGroups/Dihedral.lean`.
- **Cyclic and `p`-groups (for elementary subgroups, Layer 6):** `IsCyclic` (`Algebra/Group/Defs.lean`),
  `IsPGroup p G` (`GroupTheory/PGroup.lean`), `Subgroup.zpowers`; there is **no** elementary- or
  hyperelementary-subgroup predicate upstream.
- **Group extensions:** `GroupTheory/GroupExtension/Defs.lean` -- native
  `GroupExtension N E G`, its inclusion/projection and injective/exact/surjective fields,
  `GroupExtension.Equiv`, `Section` and `Splitting`. Centrality of the kernel, the normalized
  factor-set construction and universal/representation-group existence and lifting remain Layer7
  targets; the carrier alone does not prove them.
- **Degree-`2` group cohomology (for the Schur multiplier, Layer 7):**
  `RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` -- `groupCohomology.H2 A`
  (`= groupCohomology A 2`), the `2`-cocycles and `2`-coboundaries `groupCohomology.cocycles₂ A`,
  `coboundaries₂ A`, the projection `H2π A`, and the multiplicative interface
  `IsMulCocycle₂` / `IsMulCoboundary₂` with `cocyclesOfIsMulCocycle₂`, applied to the trivial module
  `Rep.trivial ℤ G (Additive kˣ)` (also reachable via `Rep.ofMulDistribMulAction`).
- **The projective linear group (for projective representations, Layer 7):**
  `LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` -- `Matrix.ProjGenLinGroup` with notation
  `PGL(n, R)`, `PGL.mk : GL n R →* PGL(n, R)` and `PGL.lift`. This is the **matrix** group `PGL(n, k)`, not
  a basis-free projectivized automorphism group of an arbitrary `k`-module. Layer 7 works with normalized
  lifts `G → (V ≃ₗ[k] V)` (a basis-free `GL(V)`) and identifies a projective representation with a
  homomorphism to `PGL(n, k)` only after choosing a basis; the compatibility with `Matrix.ProjGenLinGroup`
  under a basis is itself a small build target.

## What Tau Ceti supplies (consume) and the remaining comparisons

Native declarations below live in Tau Ceti modules; their namespaces are stated
separately from module ownership. In particular Mackey's representation decomposition
is `_root_.Rep.mackeyDecomposition`, not `TauCeti.Rep.mackeyDecomposition`.
These source interfaces are consumed with their stated hypotheses; the selected
Suggested file's admitted signatures do not by themselves instantiate these maps.

| Scope | Native supplier | Work owned by this roadmap after consumption |
| --- | --- | --- |
| Layer0 transitivity | `TauCeti.Rep.resFunctorCompIso`, `indFunctorCompIso`, `indFunctorSubgroupOfIso`, `coindFunctorCompIso` in `Induction.Transitivity` | Nested-subgroup/model and generator comparisons, using the native adjunction compatibility and generator lemmas rather than a second transitivity construction. |
| Layer0 tensor and dual formulas | `TauCeti.indProjection`, `indProjectionNatIsoLeft/Right`, `coinvariantsTensorIndHom_map_indProjection_mk`; `TauCeti.coindProjection`, `coindProjectionNatIso` | Consume the native formulas and match the pinned coinvariant/internal-Hom displays. |
| Layer1 conjugation | `TauCeti.conjRep`, `conjFDRep`, their functors/equivalences, `char_conjFDRep`, and `conjNormalRep`/`conjNormalFDRep` in `Induction.Conjugate` | Instantiate the selected same-convention models; retain subgroup-transport, coherence and example adapters. |
| Layer2 finite induction | `TauCeti.Rep.indSubtypeEquivPi`, `finiteDimensional_ind`, `finrank_ind`; `TauCeti.indFDRep`, `indFDRepFunctor`, forgetful equivalence/isomorphisms and `finrank_indFDRep` | Named `indLeftCosetCoinvariantEquiv` free-left-coset adapter with action/generator comparison, independent of Layers0–1. |
| Layer2 characters/pairings | `TauCeti.character_indFDRep_sum_quotient`, `character_ind` in `Induction.Character`; `frobenius_reciprocity`, `frobenius_reciprocity_resFDRep`, `characterPairing_indFDRep/resFDRep` in `Induction.FrobeniusReciprocity` | Compare the fixed character/pairing and representative conventions; preserve division-free versus unit-order averaged hypotheses. |
| Layer3 splitting | Root `Rep.mackeyDecomposition`, `mackeyDecompositionNatIso` and both generator formulas in `Induction.Mackey.Decomposition`; `TauCeti.character_resFDRep_indFDRep_mackey` in `Mackey.Basic` | Match the selected conjugate/intersection model and finite-biproduct display to the native direct-sum model. The native CommRing representation theorem has no finite-G hypothesis. |
| Layer4 ordinary specialization | `TauCeti.MackeyDisjoint`, its representative/normal transport, `simple_indFDRep_iff_doubleCoset` and `simple_indFDRep_iff` in `Mackey.Irreducible`; `finrank_hom_indFDRep_mackey_erase` in `Mackey.Intertwining` | Consume algebraically closed characteristic0 criteria/counts in that scope. Build the stated all-field k-linear Hom/identity-algebra comparison, positive-characteristic ℕ count, hG sufficiency/division criterion and separate hG+hSplitG iff. |
| Layer5 Clifford theory | `TauCeti.inertia`, normal conjugation, structural/multiplicity APIs in `Induction.Clifford`; root `FDRep.clifford_restrict_iso` and `FDRep.cliffordCorrespondence`; `TauCeti.clifford_restrict_character` | Consume structural and character forms with their actual field hypotheses; retain the declared non-algebraically-closed splitting-field/model and scalar-Schur adapters rather than silently narrowing them to the native characteristic0 correspondence. |
| Layer6 Artin/Brauer | `TauCeti.virtualCharacters`, `ClassFunction.indVirtualCharacterAddHom`; `ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`, `indVirtualCharacterDirectSumBaseChangeRat_isCyclic_surjective`, `indVirtualCharacters_eq_virtualCharacters_isElementary`; `TauCeti.mem_virtualCharacters_iff_forall_comp_subtype_isElementary` | Compare the character lattice and representation-ring models; do not reprove these induction theorems as admitted aliases. |
| Layer6 auxiliary structures | `TauCeti.IsPElementary`, `IsPHyperelementary`, `IsElementary`, `IsHyperelementary` in `GroupTheory.Elementary`; root `FDRep.nonempty_iso_of_subgroupCharacterSum_eq_cyclic` and `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension` | Match subgroup-vs-underlying-group predicates and field-of-definition conventions, including the exact rational and cyclotomic examples. |
| Representation ring | `TauCeti.ExactK0`'s FDRep commutative ring, `fdRepK0RingEquiv`, `resK0RingHom`, `indK0` and `indK0_mul_resK0` in `GrothendieckGroup` | In the ordinary semisimple regime compare exact K₀, the stated direct-sum Grothendieck model and the virtual-character lattice. Do not identify split and exact K₀ in a nonsemisimple regime without a proof. |
| Layer7 projective interfaces | `TauCeti.IsProjectiveRep`, `FactorSet`, `schurMultiplier`, linearization/PGL interfaces in `ProjectiveRepresentation`, and native `TauCeti.twistedMonoidAlgebra` | Match curry/uncurry, bases, the pinned normalized operations and equivalence notions. Native common finite central lifting is not by itself the specified stem Schur cover. |
| Layer7 Clifford obstruction | `TauCeti.cliffordObstruction`, `cliffordObstruction_eq_zero_iff`, and `IsProjectiveInertiaExtension.tensorRep/homAction/tensorRepEquiv` | Consume the native Simple/algebraically-closed specialization. Layer7.ScalarObstruction owns the explicit scalar-Schur extension over arbitrary fields; Layer7.DivisionCrossedSystem owns the non-scalar commutant/outer-action theory. Retain inverse-factor multiplicities and the independent abstract perfect-group universal extension. |

The Gassmann fixed-coset counting and finite-set orbit/determinant API, the S₁₆
pair, induced Young-subgroup character tables, the specified general-field
Mackey/Clifford adapters, the exact Grothendieck/character comparison, the stem
representation group and abstract perfect-group cover, and all worked examples
retain their full scope. Existing native theorem specializations are suppliers to
these tasks, not replacements for the broader statements or their examples.

Representative interfaces in Layers 2.1–2.2 include `AlmostConjugate`, the fixed-coset identity
and criterion, `Gassmann.almostConjugate_iff_permutation_equiv`, `Gassmann.almostConjugate_comap`,
`Gassmann.not_conj_comap`, `Gassmann.restrictEquiv`, `Gassmann.normalInvariantEquiv`, and the
finite `S₁₆` pair. The file also reuses native `TauCeti.indTrivialIso` and
`TauCeti.char_ind_trivial`. The generic orbit-sum basis, quotient-orbit equivariance and full-cycle
determinant formula are named README targets below; `Suggested.lean` is representative, not
exhaustive. The displayed induction, conjugation, character, Mackey, Artin/Brauer,
Schur-multiplier and twisted-product interfaces are implemented by consuming the
named native suppliers where their types match. The remaining model/coefficient
adapters keep the complete theorem scope above; no opaque admitted definition is
silently treated as already equal to its intended native implementation.

---

## The build, in layers

### Layer 0: the functorial core -- transitivity and the projection formula

Everything here is over `[CommRing k]`, on Mathlib's `Rep k G`, consuming the two adjunctions.

- **Restriction and transitivity.** Consume `TauCeti.Rep.resFunctorCompIso`,
  `TauCeti.Rep.indFunctorCompIso` and `TauCeti.Rep.coindFunctorCompIso` for arbitrary
  composable maps (coinduction already works for monoids over CommRing).
  `indFunctorSubgroupOfIso` supplies nested subgroups. Consume their native
  adjunction compatibility and forward/inverse generator lemmas; transport the
  selected nested-subgroup displays through them instead of constructing another
  abstract adjoint comparison. Keep the native universe maxima explicit when
  the coefficient ring, groups and carriers have separate universes.
- **The projection formula (tensor identity).** Consume `TauCeti.indProjection`
  and its left/right natural isomorphisms. In native coinvariant coordinates the
  FORWARD generator formula is
  `⟦h⊗ₜ(a⊗b)⟧ ↦ ⟦h⊗ₜa⟧⊗ρ(h⁻¹)b`, by
  `TauCeti.indProjection_hom_hom_apply`; the inverse sends
  `⟦h⊗ₜa⟧⊗b ↦ ⟦h⊗ₜ(a⊗ρ(h)b)⟧`.
  Consume `coinvariantsTensorIndHom_map_indProjection_mk` for comparison with
  Mathlib's `coinvariantsTensorIndNatIso`. For the dual internal-Hom formula
  consume `TauCeti.coindProjection` and `coindProjectionNatIso`, including their
  evaluation/naturality rules. Own the selected coordinate/model comparisons;
  the native maps already prove descent, equivariance and their inverse laws.
  The categorical projection wrapper uses same-universe k,H and representation
  carriers in its native signature; the underlying linear/equivariant maps allow
  the separate universes stated there. Keep any universe-lift comparison explicit.
  The projection identity supplies the representation-ring module law downstream.

### Layer 1: the conjugate representation

Over `[CommRing k]`; the character statement over a field. Consume
`TauCeti.conjSubgroupEquiv`, `conjRepFunctor`, `conjRepEquiv`, `conjFDRepFunctor`,
`conjFDRepEquiv` and their one/product, action and character formulas. The native
semiring/ring generality is available where stated; these objects use the same
sHs⁻¹ and inverse-conjugation convention fixed here.

- **The conjugation convention, fixed once.** Every formula below reads off Mathlib's pointwise action,
  not prose: `Subgroup.mem_pointwise_smul_iff_inv_smul_mem` gives
  `x ∈ (MulAut.conj s • H) ↔ s⁻¹ * x * s ∈ H`, so `MulAut.conj s • H` is `sHs⁻¹` and the membership proof
  needed by `conjRep` is `s⁻¹ * x * s ∈ H`. Pin this as an explicit sanity lemma and derive the conjugate
  action and character from it, so the whole layer cannot be silently orientation-reversed.
- **`conjRep s A`.** For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the representation of
  `MulAut.conj s • H` on `A.V` with `x` acting by `A.ρ ⟨s⁻¹ * x * s, _⟩` (the membership proof as above).
  Instantiate the selected `conjRep` model by the native object and consume its
  functoriality in `A`; compare its named morphisms with `conjRepFunctor.map`.
  Conjugating by `1` is the
  identity and `conjRep (s*t) ≅ conjRep s ∘ conjRep t` up to the canonical identification of the doubly
  conjugated subgroup (the cocycle coherence Mackey and Clifford both need).
- **The conjugate character.** For `A : FDRep k H`, `({}^s A).character x = A.character ⟨s⁻¹ x s, _⟩` for
  `x ∈ sHs⁻¹`; in particular `finrank k ({}^s A) = finrank k A`, and `{}^s A` is irreducible iff `A` is
  (conjugation is an equivalence of categories `FDRep k H ≌ FDRep k (sHs⁻¹)`).
- **Restriction–conjugation interchange.** For a normal subgroup `N`, `MulAut.conj s • N = N`
  (`Normal.conj_smul_eq_self`), so `conjRep s` is an autoequivalence of `Rep k N`; this is the action of `G`
  on `Rep k N` that Clifford theory (Layer 5) uses.

### Layer 2: induced characters and Frobenius reciprocity

Finite `G`. Native finite induction and the division-free induced-character formula need only a field `k`
(regime 2). Normalized pairings and reciprocity additionally require `IsUnit (Nat.card G : k)`;
scalar orthogonality carries the stated splitting hypotheses (regime 3). This layer connects to the
[character-theory roadmap](../CharacterTheory/README.md).

- **Native finite-dimensional induction and the left-coset adapter.** Consume
  `TauCeti.Rep.indSubtypeEquivPi`, `TauCeti.Rep.finiteDimensional_ind`,
  `TauCeti.Rep.finrank_ind` and `TauCeti.indFDRepFunctor`, with
  `finrank k (Ind_S^G A) = S.index · finrank k A` for `[S.FiniteIndex]`
  and finite-dimensional A. `TauCeti.indFDRepForgetEquiv` allows separate
  universes for k and G; BOTH `TauCeti.indFDRepForgetIso` and
  `TauCeti.indFDRepForgetNatIso` are same-universe categorical wrappers.
  The object, functor and finrank theorem allow the separate universes
  stated in their native declarations.
  Instantiate the Suggested induction object by native `TauCeti.indFDRep`
  in the same universe and its finrank statement by `TauCeti.finrank_indFDRep`;
  do not construct a second finite-dimensional induction functor.
  The native coset model uses right cosets
  `Quotient (QuotientGroup.rightRel S)`. This layer owns transport through
  native `QuotientGroup.quotientRightRelEquivQuotientLeftRel S`, sending Sg
  to g⁻¹S, to the displayed FREE left-coset model of the coinvariant construction
  `Ind_S^G A ≃ₗ[k] (G ⧸ S →₀ A)`. Export the named
  `indLeftCosetCoinvariantEquiv` using the finite-index finsupp/function
  equivalence, `TauCeti.Rep.indSubtypeEquivPi` and its action/generator rules.
  Prove the transported action/generator comparison. The carriers are not
  definitionally equal. This adapter needs neither Layer0 nor Layer1 and is
  owned here, used by the character-formula model and the Layer4 Hom route
  even when no character or character-pairing identity is used.
- **The induced-character formula (primary form: coset-representative sum, no division).** For a field `k`,
  `A : FDRep k S`, `[S.FiniteIndex]`, and `g : G`, the induced character is the sum over coset
  representatives `t : G ⧸ S` of `χ(t⁻¹ g t)` for those `t` with `t⁻¹ g t ∈ S` (and `0` otherwise). The
  value is well-defined because `A.character` is a class function on `S`.
  Consume `TauCeti.character_indFDRep_sum_quotient`, whose source already
  proves this over any field and finite-index S, without invertibility of |S|.
  Match the selected free-left-coset display by the named adapter, reading
  off the fixed trace blocks; this is a model comparison, not a second proof
  of the native character theorem.
  This is the character-theoretic workhorse CharacterTheory consumes for permutation and Young-subgroup
  characters.
- **The averaged group-sum form (corollary).** For `[Fintype G]` and the explicit hypothesis
  `IsUnit (Nat.card S : k)`,
  `(indFDRep A).character g = (Nat.card S : k)⁻¹ · ∑ x : G, [x⁻¹ g x ∈ S] · A.character ⟨x⁻¹ g x, _⟩`,
  consumed from `TauCeti.character_ind` under exactly these hypotheses,
  with its native comparison to the coset form by summing over |S|-element cosets. The invertibility
  hypothesis is what makes the `(Nat.card S)⁻¹` factor meaningful; without it the coset form is the one to
  use.
- **Native permutation character and double-coset inner product.** Consume
  `TauCeti.indTrivialIso` for the induced-trivial / left-coset permutation isomorphism on
  Mathlib's `G ⧸ H`, and `TauCeti.char_ind_trivial` for its character as the number of fixed
  left cosets. Induction is along `H.subtype`, and `G` acts by left translation. Over every
  field with `IsUnit (Nat.card G : k)`, prove
  `⟨Ind_H^G 1, Ind_H^G 1⟩_G = (#(H \ G / H) : k)` using Frobenius reciprocity and Mackey,
  with the natural double-coset count explicitly cast into k.
  The pairing `⟨Ind_H^G 1, 1⟩_G` is1 by reciprocity against the trivial representation.
- **Frobenius reciprocity as a character identity.** Over every field with `IsUnit (Nat.card G : k)`,
  without a splitting hypothesis,
  for `A : FDRep k S` and `B : FDRep k G`,
  `⟨(indFDRep A).character, B.character⟩_G = ⟨A.character, (res S.subtype B).character⟩_S`.
  Consume `TauCeti.frobenius_reciprocity`, `frobenius_reciprocity_resFDRep`
  and `characterPairing_indFDRep/resFDRep`: their explicit-sum identities
  already hold over every field under hG. Match the declared pairing using
  their Hom-dimension/adjunction comparisons (each side is the cast into k of its natural-number
  Hom dimension), and the dual identity from `resIndAdjunction`. State it self-containedly with the explicit
  `(Nat.card ·)⁻¹ ∑` sums as well, so it does not hard-depend on the pairing's final name. Because these
  identities are consumed from the native explicit-sum and Hom-dimension APIs, record a compatibility
  layer relating those pairings and the split-field orthogonality API to the
  [character-theory roadmap](../CharacterTheory/README.md)'s `characterPairing`: that the
  pairing of two characters equals the CAST into k of the natural-number `finrank k` of their
  `Hom` space, and that it is `1` on a split irreducible with itself. In the stated split semisimple
  regime, the natural-number Hom dimension is nonzero exactly when the representations share an
  irreducible constituent. Retain that structural detection in positive characteristic. Only in
  characteristic0 does nonvanishing of the k-valued pairing give the same detection: in characteristic
  p its cast can vanish for a positive Hom dimension divisible by p. Likewise, character-based
  constituent detection is asserted only in characteristic0; do not infer it from the scalar pairing
  in positive characteristic.

#### Layer 2.1: almost-conjugacy and permutation representations

For a finite group `G` and subgroups `H,K`, define almost-conjugacy by equality of their
intersection cardinalities with every Mathlib conjugacy class. Reuse `ConjClasses`; introduce no
second conjugacy-class carrier. The proposition may be written with `Nat.card` and no finiteness
binder in the definition, but all counting theorems state `[Finite G]`. Give a computable
`Decidable` instance with explicit `[Fintype G] [DecidableEq G]` and decidable subgroup-membership
instances, using `Fintype.card` on the finite class-intersection subtypes; do not present `Nat.card`
as computational data.

Prove reflexivity, symmetry, transitivity, simultaneous-conjugation invariance, and that conjugate
subgroups are almost conjugate. Fix the left-coset action on `G ⧸ H`. Establish the division-free
identity, for each `g : G`,

```text
Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H
  = Nat.card (MulAction.stabilizer (ConjAct G) g)
      * Nat.card {x : G // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H}.
```

The counting map sends an element `x` to its fixed coset and conjugate; each class element has
exactly the centralizer cardinality many preimages. Summing over classes gives `|H| = |K|` from
equal class intersections. Conversely, fixed-coset equality at `g = 1` gives equal indices and
subgroup orders; the identity then recovers each class-intersection count. Thus prove equivalence of
almost-conjugacy and equality of fixed-coset counts for every `g`.

Consume the existing characteristic-zero theorem
`TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq` over `ℂ` to obtain equivalence
of the permutation representations, and consume the native induced-trivial equivalence `TauCeti.indTrivialIso` and its fixed-point
characterization `TauCeti.nonempty_equiv_ind_trivial_iff_forall_natCard_fixedBy_eq`, rather than
reproving these native results as IR `sorry` targets. The equivalence between `AlmostConjugate` and
permutation-representation equivalence for finite groups over `ℂ` is IR's own derived declaration
`Gassmann.almostConjugate_iff_permutation_equiv`; its proof uses the fixed-coset criterion and the
native `TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq` as a substrate. Also prove transport of `AlmostConjugate` and subgroup nonconjugacy
along a `MulEquiv`. Export the positive transport as
`Gassmann.almostConjugate_comap` and the nonconjugacy transport as
`Gassmann.not_conj_comap`. For `e : G ≃* G'`, the first declaration takes
`AlmostConjugate H K` for `H,K ≤ G'` to
`AlmostConjugate (H.comap e.toMonoidHom) (K.comap e.toMonoidHom)` without a finiteness
hypothesis.
The second transports `¬ ∃ τ : G', H.map (MulAut.conj τ) = K` to
`¬ ∃ σ : G, (H.comap e.toMonoidHom).map (MulAut.conj σ) = K.comap e.toMonoidHom`. The action convention
`MulAut.conj τ • H` from Layer 1 is the same subgroup as `H.map (MulAut.conj τ)`; state this
equality explicitly so the Gassmann consumer can use NFA's hypothesis without changing convention.

This layer owns the generic finite-set determinant adapters used by NFA 8.4. It is upstream of
NFA 8.4; NFA does not own or duplicate these representation-theoretic targets. The generic restriction adapter is
`Gassmann.restrictEquiv (e : Representation.Equiv ρ σ) (f : D →* G) :
Representation.Equiv (ρ.comp f) (σ.comp f)`; it restricts a representation equivalence along a
group homomorphism before applying the same-group invariant API. For a normal subgroup `I ◁ D`, the
quotient-invariant representation is
`ρ.quotientToInvariants I : Representation k (D ⧸ I) (Representation.invariants (ρ.comp I.subtype))`,
using Mathlib's native `Representation.quotientToInvariants` construction. The noncomputable adapter
`Gassmann.normalInvariantEquiv` transports these quotient representations across an equivalence
when the subgroup is normal. For a finite group
`I` acting on a finite set `X`, prove the invariant subspace of `k[X]` has a basis indexed by
`orbitRel.Quotient I X`, represented by orbit sums. For a field `k` and a finite set `S`, let `ρπ : (S →₀ k) →ₗ[k] (S →₀ k)` be the linear
endomorphism induced by `π : Equiv.Perm S`, sending the basis vector at `s` to the basis vector at
`π s`. Prove the polynomial identity
`(LinearMap.charpoly ρπ).reverse = (π.fullCycleType.map fun d ↦ 1 - Z ^ d).prod`, as an equality in
`k[Z]`; the product counts the multiset multiplicities and `Z` is the polynomial indeterminate.
Here `π.fullCycleType` is the multiset of natural-number cycle lengths, including fixed points,
from Tau Ceti's native `Equiv.Perm.fullCycleType`; `cycleType` omits fixed points. The product is
over the multiset, so repeated lengths contribute with multiplicity.

For a group `D` acting on `X` and a normal subgroup `I ◁ D`, construct the induced `D/I`
action on the set of `I`-orbits. Prove that the orbit-sum basis intertwines this permutation
action with the quotient representation on `I`-invariants: each `d ∈ D` sends the sum over an
`I`-orbit to the sum over its image orbit. Include the version for any element normalizing `I`.
Export these generic contracts as `Gassmann.invariantOrbitSumBasis` and
`Gassmann.orbitSumEquivariant`. Export the full-cycle determinant identity as
`Gassmann.charpoly_reverse_eq_prod_fullCycleType`; its carrier is the finite-dimensional
permutation representation on `k[X]`, and the product counts all cycle lengths, including fixed
points. The identity is invariant under equivariant linear equivalence by native
`LinearEquiv.charpoly_conj`. NFA instantiates these generic results with its decomposition subgroup `D`, its inertia
subgroup `I`, the coset action on `G ⧸ H`, and the arithmetic-prime interpretation; IR owns the
generic induced `D/I` action on the quotient of `I`-orbits and its representation-theoretic
comparison with `I`-invariants.

Finally, for finite `α`, prove the subgroup criterion in `Equiv.Perm α`: almost-conjugacy is
equivalent to equality of the multiplicities of each conjugacy class, equivalently of the
multiset of `cycleType` values over subgroup elements. Consume native
`Equiv.Perm.isConj_iff_cycleType_eq`, `Equiv.Perm.cycleType_permCongr`, and
`Equiv.Perm.fullCycleType_permCongr`; distinguish `cycleType`, which omits fixed points, from
Tau Ceti's `fullCycleType`, which restores them. This is
the connection to the regular-action example below.

#### Layer 2.2: a nonconjugate almost-conjugate pair in `S₁₆`

Use `A = Multiplicative (ZMod 4) × Multiplicative (ZMod 4)` and
`B = QuaternionGroup 2 × Multiplicative (ZMod 2)`, respectively `C₄ × C₄` and `Q₈ × C₂`.
Both have order 16 and element-order distribution 1, 3, 12 at orders 1, 2, 4. Their faithful
left-regular actions have identical **full** cycle-type distributions `1^16`, `2^8`, `4^4` with
multiplicities 1, 3, 12. The native raw `cycleType` drops fixed points: for the identity it is the
empty multiset, and the raw types for orders 2 and 4 are `2^8` and `4^4`. Record this distinction;
do not call the raw identity type `1^16`.

Prove the regular-action formula for every element of a finite group of order `m`: the full cycle
type of left multiplication by an element of order `d` is
`Multiset.replicate (m / d) d`. Use the native `fullCycleType_permCongr` when identifying the
carriers with `Fin 16`. The cycle-type conjugacy criterion from Layer 2.1 then proves the two
images are almost conjugate. They are not conjugate because `A` is abelian and `B` is not. Export the result with an exact
nonconjugacy conclusion of the form `¬ ∃ σ, H.map (MulAut.conj σ) = K`, alongside the
`AlmostConjugate` result; these declarations are the named inputs used by PGG Layer 9.
Build the permutation images using `MulAction.toPermHom` and its injectivity.
`Fintype.equivFinOfCardEq` is noncomputable in the abstract carrier argument: this proof is not a
`decide` example unless a concrete equivalence is explicitly constructed.

Export the finite group pair as `Gassmann.exists_S16_gassmann_pair`, with the explicit regular
actions of `C₄ × C₄` and `Q₈ × C₂` as the construction. Layer 2.2 supplies this pair to
PolynomialGaloisGroups Layer 9. PGG Layer 9 then
consumes Number Field Arithmetic Layers 3.8 and 8.4 for the fixed-field number-field example. This
layer does not construct a Galois extension or a number field. No minimum-degree claim is made.

### Layer 3: the Mackey decomposition formula

`H, K : Subgroup G`. The isomorphism form (3a) is representation-level and needs only Layers 0-1 over
`[CommRing k]`; the character form (3b) needs Layer 2 over a field.

#### Layer 3a: the decomposition as an isomorphism of representations (over `[CommRing k]`)

- **The Mackey summand, with its two homomorphisms pinned.** Consume
  `TauCeti.mackeySubgroup`, `mackeyToK` and `mackeyToConjH` from
  `Induction.Mackey.Subgroup`; instantiate the selected identical-convention
  signatures by these maps. For `s : G`, the subgroup is
  `mackeySubgroup s H K := K ⊓ (MulAut.conj s • H)` of `G`. It carries two inclusions that concentrate all
  the Lean bookkeeping, and both must be pinned explicitly: `mackeyToK : mackeySubgroup s H K →* K`
  (from `mackeySubgroup s H K ≤ K`) along which we induce **up** into `K`, and
  `mackeyToConjH : mackeySubgroup s H K →* (MulAut.conj s • H)` (from
  `mackeySubgroup s H K ≤ MulAut.conj s • H`) along which we restrict the conjugate `{}^s A` (which lives
  on `sHs⁻¹`) **down**. The summand is then `Ind (Res_{mackeyToConjH} ({}^s A))` along `mackeyToK`; there
  is no second intersection with `K`. Index the summands by `DoubleCoset.Quotient (K : Set G) H`, choosing
  one representative per class with `Quotient.out`. The summand is built from this **fixed** choice of
  representative; we do not assert a canonical representative-independent summand (transporting along a
  change of representative `s ↦ k s h` requires coherent conjugation equivalences that are a separate
  representative-change comparison target), and the decomposition below is stated
  for the `Quotient.out` choice.
- **The Mackey decomposition (isomorphism form).** For `A : Rep k H` and `[Fintype G]`,
  `Res_K (Ind_H^G A) ≅ ⨁_{KsH ∈ K\G/H} Ind_{mackeySubgroup s H K}^K (Res ({}^s A))`, a natural
  isomorphism in `Rep k K`. Consume ROOT `Rep.mackeyDecomposition` and
  `Rep.mackeyDecompositionNatIso` from the Tau Ceti module
  `Induction.Mackey.Decomposition`; its native theorem is over CommRing k,
  same-universe k,G/carriers, for arbitrary G,H,K, with no finiteness needed.
  Its forward generator sends `⟦h s⁻¹u⊗a⟧` to `⟦u⊗h⁻¹a⟧` in the
  s-summand, and its inverse sends `⟦u⊗a⟧` to `⟦s⁻¹u⊗a⟧`.
  Consume both named generator lemmas and `Rep.mackeySummand_eq_ind_res_conjRep`.
  Own the comparison with the selected subgroup/conjugation and finite-biproduct
  display, including transport to/from its direct-sum carrier; do not construct
  a second Mackey isomorphism or compare an opaque admitted constant without
  first instantiating its selected models.

#### Layer 3b: the character form (over a field, needs Layer 2)

- **The Mackey decomposition (character form).** The corresponding identity for
  `(Res_K (indFDRep A)).character` as a sum over `K\G/H` of induced characters of the conjugates, a direct
  consequence via Layer 2's induced-character formula, and the form the examples check.

### Layer 4: intertwining numbers and the Mackey irreducibility criterion

Finite `G`. The Hom-space decomposition below is over any field. Statements that use
semisimplicity carry `hG : IsUnit (Nat.card G : k)` explicitly. The iff criterion
also takes the scalar-Schur output of a splitting field:

```text
hSplitG : ∀ W : FDRep k G, Simple W → finrank k (W ⟶ W) = 1.
```

This uses native categorical endomorphisms, not a new field or representation carrier.
Under hG, prove it equivalent to a finite k-algebra decomposition
`k[G] ≃ₐ[k] ∏ i, Matrix (Fin (n i)) (Fin (n i)) k` with every n i positive.
Consume Mathlib's algebra-form Wedderburn theorem and
[SemisimpleAlgebras Layers1–2](../SemisimpleAlgebras/README.md#layer-1-simple-modules-schur-and-isotypic-components)'s
simple-module/block dictionary; own the finite-group adapter here. Every simple k[G]-module
is cyclic and hence finite-dimensional, so hSplitG covers every simple block. Its scalar
map k→End(S) is bijective when End(S) has dimension1; retain the native opposite-
endomorphism convention for block division algebras. Conversely every simple module
of a product of full matrix algebras has endomorphisms k. Algebraic closure supplies
hSplitG by native `CategoryTheory.finrank_endomorphism_simple_eq_one`;
`scalarSchur_of_isAlgClosed` packages that output. Preserve non-algebraically-closed
splitting fields and positive characteristic not dividing |G|. hSplitG alone does
not imply Maschke.

- **Finite-dimensional Hom and finite-biproduct infrastructure.** Consume the
  native `FDRep` Hom-space `FiniteDimensional` instance,
  `FDRep.forget₂HomLinearEquiv` and `LinearEquiv.finrank_eq`. For finite
  families construct the k-linear equivalence from Hom(U,⨁_i V_i) to
  ∏_i Hom(U,V_i) by composition with the biproduct projections; its inverse
  is `biproduct.lift`, equivalently Σ_i f_i≫biproduct.ι. Use native
  `biproduct.lift_π`, `biproduct.total` and composition linearity for the
  inverse and linearity laws, then `Module.finrank_pi_fintype` for the dimension
  sum. This finite adapter has no algebraic-closure or characteristic-zero
  hypothesis. When applying the decomposition in `Rep`, carry finite-dimensionality
  of each Hom factor across `FDRep.forget₂HomLinearEquiv` and the
  induction/restriction comparisons before invoking `Module.finrank_pi_fintype`.
  Reuse the native finite biproducts, not new Hom carriers.
- **The actual Hom-space decomposition.** Put J_s=H∩sHs⁻¹ and
  W_s=Res_(J_s)({}^s V). For every field construct a k-linear equivalence
  `End_G(Ind_H^G V) ≃ₗ[k] ⨁_(D∈H\G/H) Hom_(J_s)(Res_(J_s)V,W_s)`, s=D.out.
  Consume native `Rep.mackeyDecomposition`, `Rep.indResHomEquiv` for Ind⊣Res,
  and the finite-index Res⊣Ind comparison through `Rep.resCoindHomEquiv` and
  `Rep.indCoindIso`. The second reciprocity has the reverse adjoint direction.
  Restrict to finite-dimensional objects through the actual induction/forgetful
  comparisons. Use the instantiated `indFDRep` (= `TauCeti.indFDRep`);
  compare only the selected `conjRep`/`conjFDRep` models with the native
  Mackey summands on generators. Prove additivity, scalar-linearity, naturality
  and representative transport. Identify the identity-double-coset component with
  End_H(V), including the induced endomorphism functor's map; dimension alone does
  not specify that algebra homomorphism.
- **The intertwining-number formula.** Take dimensions of this finite direct sum
  to get the equality in ℕ, also with the identity summand split off. This works
  in positive characteristic. The current native
  `TauCeti.finrank_hom_indFDRep_mackey_erase` derives its ℕ identity from a
  character calculation only in characteristic0; its cast identity in k cannot
  be cancelled in characteristic p. Consume it in that scope and own the preceding
  k-linear adapter for the broader assertion.
- **Arbitrary-field semisimple sufficiency.** Under hG, simplicity of V and zero
  nonidentity Mackey Hom spaces imply simplicity of Ind V. With those spaces zero,
  prove the induced unital map `End_H(V)→End_G(Ind V)` is an algebra isomorphism
  using the identity component above. Arbitrary-field Schur makes End_H(V) a
  division algebra. Maschke supplies invariant complements for Ind V; a nontrivial
  proper complement would yield a nonzero nonunit projection. No splitting
  hypothesis enters this sufficient criterion.
- **Endomorphism-division characterization.** For every field under hG, prove
  `Simple (Ind V) ↔ Nontrivial (End (Ind V)) ∧
  ∀ f : End (Ind V), f≠0 → IsUnit f`, using native `CategoryTheory.End`.
  Forward is Schur, and converse uses Maschke and the projection argument.
  Nontrivial End excludes the zero representation, where the nonzero-unit
  condition alone is vacuous. Do not replace this by dim End=1 over a nonsplitting
  field or assert its converse without semisimplicity.
- **The Mackey iff criterion.** Under hG and hSplitG, Ind V is simple iff V is
  simple and every nonidentity double-coset Hom space is zero. Sufficiency is the
  arbitrary-field result above. For necessity, apply hSplitG to the simple induced
  object and use the ℕ direct-sum formula: End_H(V) is nonzero since induction of
  zero is zero, so its dimension is1 and every other dimension is0. Maschke and
  the rank-one endomorphism argument make V simple. No splitting hypothesis on H
  is needed here; do not silently strengthen hSplitG to all subgroups.
- **Representative and normal-subgroup forms.** Prove disjointness invariant under
  s↦h₁sh₂, h₁,h₂∈H, by actual intertwining-space isomorphisms, then derive the
  `∀ s∉H` form. For normal H and simple V, disjointness is equivalent to
  `{}^s V ≇ V` by arbitrary-field Schur, giving the same hG/hSplitG iff in that form.

Native `TauCeti.simple_indFDRep_iff_doubleCoset` and
`TauCeti.simple_indFDRep_iff` already prove the algebraically closed,
characteristic0 specialization. Consume them with those hypotheses; the positive-
characteristic linear-Hom adapter and general-field results above remain explicit
proof targets. Layer4 uses Layers0–1, Layer2's finite-induction/forgetful
comparison, Layer3a, the finite-Hom/biproduct adapter, Maschke and Schur,
without Layer5's isotypic decomposition. Its character mirror additionally
uses Layer2's induced-character and pairing/reciprocity targets.

**Nonsplitting acceptance counterexample.** Over ℝ let G=Q₈, H=⟨i⟩ and V=ℂ
as a real plane with i acting by multiplication by i. Ind V is the simple real
left-quaternion module ℍ. In native coinvariant coordinates
`[h g⊗h v]=[g⊗v]`, `x·[g⊗v]=[g x⁻¹⊗v]`, the intertwiner is
`[g⊗v]↦g⁻¹v`, so `[1⊗v]+[j⁻¹⊗w]↦v+jw`. Do not silently use the
standard left-tensor formula without this inverse. Left i,j preserve only0 and ℍ,
while complex conjugation gives a nonzero H-intertwiner V→{}^j V.
End_H(V)≃ℂ and End_G(Ind V)≃ℍᵐᵒᵖ: the identity and j terms each have real
dimension2. The division criterion accepts the induced simple object, but
hSplitG fails and the nonidentity term need not vanish.

### Layer 5: Clifford theory over a normal subgroup

Over a splitting field with `IsUnit (Nat.card G : k)` (regime 3; the worked table over `ℂ`); finite `G`;
`N : Subgroup G` with `[N.Normal]`. Every invocation of Layer4's iff at
ambient G supplies its separate `hG` and `hSplitG` hypotheses. Use Layer4's
SemisimpleAlgebras/native-Wedderburn dictionary when deriving `hSplitG` from
an actual split k[G] presentation; the iff itself does not depend on that
comparison theorem. Where Layer5 uses scalar Hom dimensions over N or an
inertia subgroup, supply the corresponding splitting hypothesis there as
well; do not infer that k splits every subgroup merely from `hSplitG`.
Algebraic closure supplies all these scalar-Schur outputs, while the stated
finite/non-algebraically-closed splitting-field regime remains available.

Consume `TauCeti.inertia` and the normal conjugation/subrepresentation, orbit,
multiplicity and decomposition APIs in `Induction.Clifford`. In particular root
`FDRep.clifford_restrict_iso` is already structural over an algebraically closed
field, while `TauCeti.clifford_restrict_character` has explicit hG and finite G.
Root `FDRep.cliffordCorrespondence` in `Clifford.Classes` supplies the
algebraically closed characteristic0 correspondence on actual simple-class-over
carriers. Consume it in that scope; the declared non-algebraically-closed
splitting-field extensions and selected model/isotypic comparisons remain targets.

- **Prerequisite: the isotypic-decomposition API.** Clifford theory needs more than the semisimplicity
  *predicate* Mathlib supplies (see the consume list). Consume the native normal-restriction
  semisimplicity, Clifford orbit/multiplicity and structural decomposition results;
  complete the remaining selected/general-splitting-field decomposition
  infrastructure over the same coefficient regime: every finite-dimensional representation decomposes as a
  finite direct sum of irreducibles; its **isotypic components** and their **multiplicities**, with
  multiplicity equal to `finrank` of the relevant `Hom` space; restriction along a subgroup preserves
  semisimplicity. In every stated split semisimple field, a simple V occurs in W exactly when its
  isotypic component is nonzero, equivalently when `finrank k (V ⟶ W)` is nonzero as a natural number.
  This is the constituent-detection input consumed by Clifford's theorem, including positive
  characteristic. Character-based detection is an additional characteristic0 corollary; the scalar
  pairing equals a CAST natural-number dimension and can lose information modulo the characteristic.
  These are genuine build targets. Layer4's Hom-space count uses Layer3a and the two finite-index
  adjunctions instead.
- **The `G`-action on `Irr(N)`.** `G` acts on isomorphism classes of irreducible `N`-representations by
  `conjRep` (Layer 1, using `MulAut.conj s • N = N`); the **inertia (stabilizer) group** `inertia V ≤ G` of
  an irreducible `V : FDRep k N` is `{g : G | {}^g V ≅ V}`, a subgroup containing `N`.
- **Clifford's theorem.** For an irreducible `W : FDRep k G`, `Res_N W` is semisimple (Maschke) and
  **isotypic under the `G`-action**: its irreducible `N`-constituents form a single `G`-orbit, all with the
  same multiplicity `e`, so `Res_N W ≅ e · ⨁_{i} {}^{gᵢ} V` where `g₁, …, g_t` are coset representatives of
  `inertia V` in `G` and `V` is any constituent. In particular `t = [G : inertia V]` divides
  `finrank W / (e · finrank V)`.
- **The Clifford correspondence.** Induction `Ind_{inertia V}^G` is a bijection from the isomorphism classes
  of irreducible `(inertia V)`-representations **lying over `V`** (those whose restriction to `N` contains
  `V`) onto the isomorphism classes of irreducible `G`-representations lying over `V`, with inverse a
  distinguished constituent of restriction. Written `Irr(inertia V ∣ V) ≃ Irr(G ∣ V)`, this is where the
  correspondence stops: it reduces the classification of `Irr(G)` lying over `V` to the classification of
  `Irr(inertia V)` lying over `V`. Proved via the Mackey irreducibility criterion (Layer 4) applied to the
  inertia subgroup: `Ind` of an irreducible of the inertia group over `V` is irreducible because conjugates
  by `s ∉ inertia V` move `V` off itself. The further reduction to ordinary irreducibles of the quotient
  `inertia V / N` by ordinary k-linear quotient representations requires BOTH an ordinary extension of V and scalar endomorphisms End_N(V)=k. Under scalar Schur, Layer7.ScalarObstruction gives the quotient factor set and its inverse-factor multiplicity theory. Over a general field the commutant is a division algebra D; Layer7.DivisionCrossedSystem gives the corresponding semilinear crossed-product module theory, including the nontrivial outer action. Even when V extends, a non-scalar D must remain in that theory. These refinements do not enter the proof of the preceding Clifford correspondence.

### Layer 6: the virtual-character ring, Artin and Brauer induction

Over `ℂ`, or an algebraically closed field of characteristic `0`; finite `G`. This is the classical
**induction-theorem** heart of ordinary character theory. Consume the native
Artin/Brauer and virtual-character suppliers in the table above; it connects to the [character-theory roadmap](../CharacterTheory/README.md), whose
`VirtualCharacter G` is the additive group underlying the ring built here.

- **The representation ring and its character map.** The primary object is the **Grothendieck ring**
  `R(G)` of `FDRep k G` under direct sum and tensor product: a genuine commutative ring (the tensor product
  gives the multiplication, the trivial representation the unit). Consume the native
  exact FDRep Grothendieck commutative ring, `TauCeti.fdRepK0RingEquiv`,
  `resK0RingHom`, `indK0` and `indK0_mul_resK0`; own its comparison with the
  displayed direct-sum model in this semisimple ordinary regime.
  The **character map** sends `R(G)` into
  the class functions `G → k`; over a splitting field of characteristic `0` this map is injective, and its
  image is the `ℤ`-span of the irreducible characters, the **virtual-character lattice** inside the class
  functions. State the virtual-character lattice as an additive subgroup of `G → k` (closed under the
  pointwise/tensor product `char_tensor`) rather than a raw `Subring (G → k)`, since over a field of
  positive characteristic the naive subring does not record the lattice structure. Restriction
  `Res_H^G : R(G) → R(H)` is a ring homomorphism and, by the projection formula (Layer 0), induction
  `Ind_H^G : R(H) → R(G)` is a homomorphism of `R(G)`-modules -- **Frobenius reciprocity as a module
  identity**. Package the induced class function `indClassFun`, computing `Ind` on characters via Layer 2.
- **Artin's induction theorem.** Over a characteristic-`0` splitting field, every character is a
  `ℚ`-linear combination of characters induced from **cyclic** subgroups; equivalently `|G| · χ` is a
  `ℤ`-linear combination of `Ind_C^G ψ` over cyclic `C ≤ G` (`IsCyclic`) and characters `ψ` of `C`. State
  the `ℤ`-membership of `|G| • χ` in the subgroup generated by cyclic-induced characters, and separately
  the rational surjectivity of `⊕_{C cyclic} R(C) → R(G)`. Any explicit statement about the index of the
  integral image (that it is finite, or divides a particular power of `|G|`) is a distinct lattice-determinant
  target, proved on its own or omitted; it is not part of the induction theorem itself.
- **Artin's corollary (rational representations).** Two `ℚ[G]`-representations are isomorphic iff their
  fixed-point dimensions `dim V^C` agree for every cyclic `C ≤ G`; the fixed dimensions on cyclic subgroups
  are a complete invariant of a rational representation.
- **Elementary and hyperelementary subgroups.** For a prime `p`, a **`p`-elementary** subgroup is a direct
  product `C × P` with `C` cyclic of order prime to `p` and `P` a `p`-group (`IsPGroup p P`). A
  **`p`-hyperelementary** subgroup is an extension of a `p`-group by a cyclic group of order prime to `p`:
  it has a **cyclic normal subgroup `C` of order prime to `p` with `p`-group quotient** (`p`-elementary is
  the special case where the extension splits as a direct product). **Elementary** means `p`-elementary for
  some `p`, and likewise **hyperelementary**. Mathlib has `IsCyclic` and `IsPGroup` but **no**
  elementary-subgroup predicate; consume `TauCeti.IsElementary` and
  `TauCeti.IsHyperelementary` on the underlying subgroup type, together with
  their prime-indexed versions and closure properties, and match the displayed orientations.
- **Brauer's induction theorem.** Every character is a `ℤ`-linear combination of characters induced from
  **elementary** subgroups: the map `⊕_{E elementary} R(E) → R(G)` is **surjective**. This is the sharp
  integral form that Artin achieves only rationally.
- **Brauer's characterization of characters.** A class function `f` is a virtual character (lies in the
  virtual-character lattice) **iff** its restriction `Res_E f` to every elementary subgroup `E ≤ G` is a
  virtual character of `E`. This is the theorem from which Brauer surjectivity follows, and the standard
  tool for certifying that a given class function is a genuine virtual character.
- **The cyclotomic splitting-field corollary (separate sublayer).** `ℚ(ζ_e)`, `e = Monoid.exponent G`, is a
  **splitting field** for `G`: every irreducible `ℂ`-representation is realizable over `ℚ(ζ_e)`. This does
  **not** follow merely from writing characters as virtual sums of induced elementary characters: passing
  from a character identity to realizability of a representation needs the character-field/Schur-index and
  descent infrastructure (each elementary subgroup has its irreducibles realizable over the cyclotomic
  field, and Brauer's theorem in the sharper field-of-definition form propagates this to `G`). Treat it as
  a distinct sublayer built on cyclotomic fields and Schur indices, not as a one-line consequence of the
  preceding statements. Consume root `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension`
  and its concrete complex-adjoin specialization from `Induction.Cyclotomic.SplittingField`,
  then supply the field-of-definition comparison in the
  [character-theory roadmap](../CharacterTheory/README.md)'s exact Layer4 consumer convention.

### Layer 7: projective representations, factor sets, and the Schur multiplier

The finite projective-representation subsection works over an algebraically closed field `k`;
G is finite. A normalized set-theoretic choice of invertible representatives of a projective
action gives its `kˣ`-valued factor set over any field; algebraic closure is not needed for that
construction. Keep the stated field hypotheses for the subsequent representation-theoretic
theorems. For a simple representation with End_N(V)=k, the extension obstruction is the scalar Schur-multiplier class owned by Layer7.ScalarObstruction. For arbitrary fields, Layer7.DivisionCrossedSystem retains the division commutant and its outer action instead of asserting a scalar H² class.

Consume `TauCeti.IsProjectiveRep`, its normalized factor-set, rescaling,
PGL and linearization interfaces, native `TauCeti.twistedMonoidAlgebra`, and
`TauCeti.schurMultiplier`. The native `IsProjectiveInertiaExtension` quotient
factor set and `TauCeti.cliffordObstruction_eq_zero_iff` supply the algebraically
closed obstruction theorem. Its tensor factor uses the INVERSE quotient factor
set; consume `tensorRep`, `homAction` and `tensorRepEquiv` with that convention.
The native common finite central lifting extension does not assert that its
kernel is the classical multiplier or is contained in the commutator subgroup;
retain the specified stem representation-group target and the separate arbitrary
abstract perfect-group cover below. Match curry/uncurry, basis and selected
normalized-operation/equivalence conventions rather than duplicating the generic APIs.

#### Abstract universal central extensions

For any abstract group G define a central extension to be a surjective homomorphism
E→G with kernel in Z(E), and universality to be initiality among these objects over G.
Prove a perfect G has such an extension. Choose a free presentation F→G with kernel R;
the explicit object is U=[F,F]/[F,R]→G, where [F,R] is the normal subgroup generated
by commutators of elements of F and R. Prove surjectivity, kernel
(R∩[F,F])/[F,R], centrality and perfection of U. For any central E→G lift free
generators into E; restriction to [F,F] kills [F,R] and is independent of those
choices, because the changes lie in the central kernel. Perfection of U proves
uniqueness of the descended map. Prove independence of the free presentation by
the universal property. This is an abstract-group theorem and asserts no topology
or identification with a Lie group's universal covering group. It owns Borcherds
p109's perfect-group assertion; the finite-G factor-set subsection below keeps its
own field and finiteness hypotheses.

#### Finite projective representations and factor sets

- **Projective representations and factor sets.** For the intrinsic factor-class and linearization
  comparisons for a homomorphism `G → PGL(V)`, require faithful scalar-unit action
  `[FaithfulSMul kˣ V]`; over a field, a nonzero V supplies this. Choose a normalized lift
  `ρ : G → (V ≃ₗ[k] V)` with `ρ(1)=1`. Faithfulness makes the scalar in
  `ρ(g) ∘ ρ(h)=α(g,h)·ρ(gh)` unique, and associativity then gives its normalized cocycle laws.
  A projective representation lands in `PGL(n,k)` only after a basis is chosen.

  Separately retain raw native `IsProjectiveRep ρ α` as data on EVERY module, including V=0:
  supply invertible operators, normalization and a normalized factor set with its cocycle laws,
  rather than deducing an intrinsic α from operators without faithful scalar action. The factor set
  is a `groupCohomology.IsMulCocycle₂` for the trivial G-action on kˣ, equivalently
  `Additive.ofMul ∘ α ∈ groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ))` via
  `cocyclesOfIsMulCocycle₂`. Invertibility alone does not exclude the zero module: GL(0) has one
  invertible map and distinct supplied factor sets can act identically there. Zero twisted modules
  and their supplied factor-set data remain valid; no intrinsic class of their PGL action is asserted.
- **Factor-set classes and the second cohomology.** For a fixed projective action on a fixed linear carrier
  with `[FaithfulSMul kˣ V]` (in particular nonzero V over a field), two normalized
  lifts differ by a normalized scalar cochain, so their factor sets differ by a coboundary
  (`groupCohomology.IsMulCoboundary₂`). Projective equivalence of two actions additionally
  requires an intertwining linear isomorphism of their PGL actions; cohomologous factor sets
  alone do not suffice. For C₂ on ℂ², the trivial action and the genuine action generated by
  diag(1,−1) both have factor set1, but their projective actions are inequivalent. Independently, factor sets modulo coboundaries form the **second
  cohomology** `H²(G, kˣ)`: define `schurMultiplier := groupCohomology.H2 (Rep.trivial ℤ G (Additive kˣ))`
  and prove that it classifies **factor sets up to cohomology**. Note the scope precisely: `H²(G, kˣ)`
  classifies factor-set classes, **not** projective representations themselves (a fixed class carries many
  non-isomorphic projective representations). The classical **Schur multiplier** `M(G) = H₂(G, ℤ)` is a
  separate finite abelian group, canonically the character dual of `H²(G, ℂˣ)`; if that object is wanted,
  pin it separately and prove the duality under suitable hypotheses rather than conflating the two.
  Consume native `IsProjectiveRep.cohomologyClass_eq_of_eq_smul` and
  `cohomologyClass_eq_zero_iff` with their actual `[FaithfulSMul kˣ V]` premise. The forward
  `exists_monoidHom_of_cohomologyClass_eq_zero` needs no faithfulness; its converse for an arbitrary
  supplied factor set does. A raw pair (ρ,α) always has the class of its supplied α, including on
  the zero module; it is the identification with an intrinsic PGL-action class and the two-way
  linearization criterion that require faithful scalar action. Likewise keep the zero object in
  every fixed-α twisted-module category.
- **The twisted group algebra.** For a **normalized `2`-cocycle** `α` (the cocycle identity and
  `α(1, g) = α(g, 1) = 1`), `k_α[G]` is the `k`-algebra on `G →₀ k` with product
  `e_g · e_h = α(g, h) · e_{gh}` twisting `MonoidAlgebra k G`.
  Consume native `TauCeti.twistedMonoidAlgebra` with the normalized curried factor set
  and its `IsFactorSet` data, matching the displayed group convention rather
  than building a second carrier. Its operator-span carrier is compared with
  `G →₀ k` by `TauCeti.TwistedMonoidAlgebra.basis`; use `of_mul_of` for
  the multiplication table. Associativity and unit laws require that
  data; they fail for an arbitrary raw `α : G × G → kˣ`. Projective representations with
  factor set `α` are then exactly `k_α[G]`-modules for the matching left-action convention, and cohomologous
  `α` give isomorphic twisted algebras, so `k_α[G]` up to isomorphism depends only on the cohomology class.
  This is the module-theoretic home of projective representation theory, mirroring the ordinary `k[G]` spine.
- **Central extensions and representation groups.** A **normalized factor set** `α` builds a **central
  extension** `1 → kˣ → E_α → G → 1` (the set `kˣ × G` with twisted multiplication
  `(a, g)(b, h) = (a · b · α(g, h), g · h)`, `centralExtensionOfFactorSet`); the construction takes the
  cocycle and normalization proofs as data, since without them the multiplication is neither associative nor
  unital. Consume native `TauCeti.FactorSet.Extension`, its scalar inclusion/projection
  and projective linearization; compare the selected actual normalized operations
  with that native extension. `H²(G, kˣ)` classifies these central extensions up to equivalence. Pin the actual carrier
  `kˣ × G`, twisted multiplication, inverse, scalar inclusion and projection;
  construct native `GroupExtension kˣ E_α G` and prove its kernel central.
  This connects the normalized factor-set construction to the same onto/central
  definition used by AbstractUCE, while keeping the finite representation and
  arbitrary abstract-group quantifiers separate. A **representation group**
  (Schur cover) is a central extension `1 → M(G) → Ĝ → G → 1` with `M(G)` inside the commutator subgroup,
  through which **every** projective representation of `G` lifts to an ordinary linear representation of `Ĝ`.
  Mathlib supplies the native `GroupExtension` carrier. This layer owns its central-kernel
  condition, the normalized factor-set construction and the representation-group existence
  and lifting theorems, as well as the separate abstract perfect-group universal extension.
- **Layer7.ScalarObstruction.** Let k be any field, N normal in G and V a simple finite-dimensional N-representation. Supply scalar Schur explicitly as `∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V`; simplicity makes V nonzero and the scalar c unique. Put T=inertia V and Q=T/N, on the actual subgroup/quotient carriers. Construct compatible projective extensions of V to T with normalized quotient factor β:Q×Q→kˣ. Prove any two such choices differ by a quotient scalar cochain and hence define the same class `cliffordObstruction V hScalar ∈ H²(Q,kˣ)` for the trivial coefficient action. Prove independence under changes of representative V and quotient models, and prove that this class vanishes exactly when an ordinary T-action on the SAME V restricts to its given N-action. No finiteness of G or characteristic-zero hypothesis is needed for this scalar construction. Algebraic closure supplies hScalar through native categorical Schur; consume `TauCeti.exists_isProjectiveInertiaExtension`, `cliffordObstruction` and `cliffordObstruction_eq_zero_iff` for their actual Simple/algebraically-closed specialization and compare the general scalar class with that native class. Do not define an intrinsic scalar class for arbitrary or zero V by a default value.

  For the scalar isotypic category, the multiplicity projective representation of Q carries β⁻¹, so its tensor with the compatible β-extension is genuine. Consume native `IsProjectiveInertiaExtension.tensorRep`, `homAction` and `tensorRepEquiv` in their scope, and construct the arbitrary-field scalar-Schur comparison with the fixed tensor order and quotient maps. Keep general D-valued multiplicities in the following owner.

#### Layer7.DivisionCrossedSystem: arbitrary-field commutants

This owner treats every field k and simple finite-dimensional V of N normal in G; it includes all finite-group and non-splitting-field cases above. Let D=End_N(V) be the ACTUAL native `CategoryTheory.End V`, with multiplication composition `(ab)(v)=a(b(v))` (`a*b=b≫a` in categorical notation). Consume native categorical Schur for its division-ring structure, retain its central k-algebra map and finite k-dimension, and identify its units with invertible N-intertwiners. Do not identify D with k without the explicit scalar-Schur hypothesis. The construction below also works for arbitrary G with finite-dimensional V; a finite-group application retains its separately stated semisimplicity hypotheses only where needed.

Put T=inertia V and Q=T/N. Write r(n) for the given action as a k-linear automorphism. Choose a normalized section s:Q→T and normalized invertible operators U_q with `U_q r(n) U_q⁻¹=r(s(q)n s(q)⁻¹)`; construct these from the actual inertia isomorphisms. Define `k(q,r)=s(q)s(r)s(qr)⁻¹∈N`. Define σ_q:D≃ₐ[k]D by U_q-conjugation and define a(q,r)∈Dˣ by

`U_q U_r = a(q,r) r(k(q,r)) U_(qr)`.

Prove this difference lies in Dˣ; prove σ_1=id, a(1,q)=a(q,1)=1 and the exact crossed-system laws

`σ_q σ_r = Ad_(a(q,r)) σ_(qr)`,

`a(q,r)a(qr,t)=σ_q(a(r,t))a(q,rt)`.

Thus only q↦[σ_q] is initially an action into Out_k(D)=Aut_k(D)/Inn(Dˣ). Build that actual normal inner subgroup and quotient, the outer-action homomorphism, the central k-linearity and naturality under N-representation isomorphisms. For U'_q=b_q U_q, b_1=1, prove

`σ'_q=Ad_(b_q)σ_q`,

`a'(q,r)=b_q σ_q(b_r) a(q,r) b_(qr)⁻¹`.

For a change of section s'_q=n_q s_q, use U'_q=r(n_q)U_q first, prove its section-defect identities and its identification with the same crossed system; subsequent choices are the displayed gauge change. Define equivalence of crossed systems by these actual normalized gauges and algebra transports, prove composition/inverses and section/choice independence. Do not replace a noncommutative gauge orbit with ordinary abelian H²(Q,kˣ), nor assume the chosen σ itself is an action.

Construct the canonical Clifford extension explicitly: take the subgroup of `T × GL_k(V)` of pairs (t,U) implementing t-conjugation on N, and quotient by the NORMAL subgroup `{(n,r(n)):n∈N}`. Construct the actual native `GroupExtension Dˣ C Q`, identify its kernel and its outer action, and prove the chosen section presents multiplication `(d,q)(e,r)=(d σ_q(e)a(q,r),qr)`. The native GroupExtension carrier allows arbitrary kernel groups; the native commutative-coefficient FactorSet is not itself this noncommutative construction. Its kernel need not be central. An ordinary extension of V to T exists iff this extension splits, equivalently iff a normalized gauge b makes every a'(q,r)=1. A neutral gauge then makes σ' an actual action. Prove the correspondence on extensions of the specified N-action, with isomorphisms given by Dˣ-conjugation, rather than choosing a zero scalar class for non-scalar D. After a splitting is chosen, classify all splittings by the corresponding nonabelian 1-cocycles modulo Dˣ-conjugacy; do not assert a canonical H¹ torsor without choosing that reference.

Construct the finite-support crossed-product k-algebra for (D,σ,a), with `(d[q])(e[r])=d σ_q(e)a(q,r)[qr]`, its unit, associativity, basis, inclusions, universal property and gauge/section algebra isomorphisms. Pin the multiplicity side separately: M=Hom_N(V,W) is a RIGHT D-module by f·d=f∘d, and `A_q(f)=W(s(q)) f U_q⁻¹` obeys

`A_q(f d)=A_q(f)σ_q(d)`,

`A_q A_r(f)=A_(qr)(f) a(q,r)⁻¹`.

Consequently its ordinary LEFT algebra-module carrier is the crossed product on Dᵐᵒᵖ with action σ_qᵐᵒᵖ and factor `op(a(q,r)⁻¹)`. Prove this opposite/inverse convention, not an unqualified identification with left modules over the first crossed product. Construct the equivalence between finite-dimensional T-representations whose N-restriction is a direct sum of copies of V and these finite-dimensional semilinear/crossed-product modules. Use the actual evaluation `M⊗_D V→W`, its inverse and naturality; prove simple-object and endomorphism correspondences and independence under gauge/section choices.

Pin restriction/induction comparisons as follows. For the actual subgroup inclusion N≤T′≤T (using N's canonical inclusion in T), put Q′=T′/N and identify Q′ with its actual subgroup of Q. Restrict the chosen section and crossed system to Q′; the section takes values in T′ because T′ is the full preimage of Q′. For the multiplicity algebra A(Q) on Dᵐᵒᵖ with the displayed inverse factor, construct the actual crossed-subalgebra inclusion A(Q′)→A(Q). Under the evaluation equivalences, restriction T→T′ agrees with restriction of scalars along this inclusion. If [T:T′] is finite, induction T′→T stays in FDRep and agrees with extension of scalars `A(Q)⊗_{A(Q′)} M`; construct the natural comparison with the actual induced representation and evaluation, retaining the same σ/opposite/inverse conventions. No finite-dimensional induction claim is made without this finite-index premise. For arbitrary index, own the analogous comparison in the larger native Rep categories whose N-restrictions are algebraic direct sums of V, with arbitrary-dimensional right-D multiplicity modules and finite-support algebraic induction. Prove evaluation and its naturality there too, with explicit universe bounds; do not silently regard that output as an FDRep.

This isotypic-category equivalence does not require Maschke; claims that other restrictions are isotypic/semisimple consume their own Clifford hypotheses. For D=k recover σ=id, the scalar β=a and the β⁻¹ twisted multiplicity algebra and tensor theorem above. For a genuine extension with non-scalar D, retain its possibly nontrivial action on D. Preserve the existing real Q8/C4 division-endomorphism example and all general-field Mackey criteria.

---

## Worked examples (acceptance criteria)

- **Permutation characters and fixed points.** For `G = S₄` and `H` a point stabilizer `S₃`,
  `Ind_H^G(trivial)` is the natural permutation representation on `4` points; its character at `g` is the
  number of fixed points of `g`, and `⟨Ind_H^G 1, Ind_H^G 1⟩ = #(H \ G / H) = 2`, the two double cosets
  being the diagonal and off-diagonal `H`-orbits on the four points (equivalently the two orbits of `S₄` on
  ordered pairs of points), so it splits as `trivial ⊕ (standard 3-dimensional)`. This exercises Layer 2
  and the double-coset count. It is a direct feed into the
  [character-theory roadmap](../CharacterTheory/README.md).
- **Induced characters from Young subgroups.** For `Sₙ` and a Young subgroup
  `S_λ = S_{λ₁} × ⋯ × S_{λᵣ}`, the induced character `Ind_{S_λ}^{Sₙ}(trivial)` is the permutation character
  on tabloids, and the induced-character formula computes its values as products of fixed-point counts. Do
  `n = 3, 4` explicitly; the resulting characters, paired via Frobenius reciprocity against the irreducibles,
  are the multiplicities that CharacterTheory's tables record.
- **Mackey on a small group.** For `G = S₃`, `H = ⟨(1 2)⟩ ≅ C₂` of order `2`: compute `H \ G / H` (two
  double cosets), apply the Mackey decomposition to `Res_H Ind_H^G(sign_H)`, and check the character
  identity of Layer 3 term by term. Inducing the nontrivial (sign) character of `H` gives the
  `3`-dimensional representation `Ind_{C₂}^{S₃}(sign) ≅ sgn ⊕ standard`, which the Mackey criterion
  correctly reports as **reducible**. To obtain the `2`-dimensional irreducible instead, induce a
  nontrivial linear character of `A₃ = ⟨(1 2 3)⟩`; the Mackey criterion then certifies irreducibility.
- **The `D₄` dihedral induction.** `Ind` from the cyclic subgroup `⟨r⟩` of order `4` in
  `D₄ = DihedralGroup 4`, applied to a faithful linear character of `⟨r⟩` (one sending `r` to a primitive
  fourth root of unity), produces the `2`-dimensional irreducible of `D₄`; the Mackey criterion certifies
  its irreducibility. This dovetails with the same group in the character-theory roadmap.
- **Clifford on `A₄ ◁ S₄`.** With `N = A₄` normal in `G = S₄`, the linear characters of `A₄` come from
  `A₄ / V₄ ≅ C₃`: the trivial character and two nontrivial (cube-root-of-unity valued) ones. The two
  nontrivial linear characters form a single `S₄`-orbit under conjugation, while the trivial character and
  the `3`-dimensional irreducible of `A₄` are each `S₄`-fixed. Clifford's theorem predicts and the inertia
  computation confirms how the irreducibles of `S₄` restrict to `A₄`, and the Clifford correspondence
  recovers `Irr(S₄)` lying over each `N`-constituent.

## Ordering

Layer 0 (transitivity and the projection formula) is pure category theory over `Rep k G` and needs only the consumed
adjunctions. Layer 1 (the conjugate representation) is independent of Layer 0 and can proceed in
parallel. Layers 0 and 1 are prerequisites for the existing layers whose constructions consume them.
Within the Layer 2 material, the Gassmann sublayers are ordered: 2.1 builds almost-conjugacy,
fixed-coset counting, `MulEquiv` transport, and the generic invariant-orbit/cycle-determinant API;
2.2 depends on 2.1 and builds the concrete `S₁₆` pair. These targets are independent of the
induced-character and Frobenius-reciprocity targets in the existing Layer 2. Layer 2.1 needs neither
Layer 0 nor Layer 1; those layers remain prerequisites for their own downstream consumers. NFA Layer
8.4 consumes 2.1, and PGG Layer 9 consumes the named 2.2 pair and 2.1's transport results together
with NFA Layers 3.8 and 8.4. Native finite-dimensional induction, its finrank
and forgetful comparison, and the named free-left-coset adapter need neither
Layer0 nor Layer1. The adapter is owned in IR2FD and used by BOTH the
character-formula model and Layer4. The native character/reciprocity theorems
are consumed; their selected conjugate-character/reciprocity comparisons take
Layer1 as a direct input, recorded by IR0-1→IR2CharacterReciprocity in the
selected graph. No new finite-dimensionality theorem is a first target.
This is the connection to the [character-theory roadmap](../CharacterTheory/README.md).
Layer 3 splits: the representation-level
Mackey decomposition (3a) needs only Layers 0-1 (transitivity and the projection formula to build the
summands, the conjugate representation to name them), while the character form (3b) additionally needs
Layer 2's induced-character formula. Layer4's k-linear Hom decomposition and criteria
need Layers0–1, Layer2's finite-induction/forgetful comparison, Layer3a,
the finite-Hom/biproduct adapter, the finite-index adjunctions, Maschke and
Schur. Its character mirror additionally consumes Layer2's character and
reciprocity targets. The scalar-Schur/split-algebra dictionary is a separate
comparison target consuming SemisimpleAlgebras Layers1–2 and native Wedderburn,
with no Layer5 input; the criteria take `hSplitG` directly and do not consume
that comparison as a prerequisite. Layer 5
(Clifford theory) needs Layer 4's criterion for the correspondence, Layer 1's conjugation action for the
inertia group, Maschke (consumed) for semisimplicity of the restriction, and the **isotypic-decomposition
API** that Layer 5's prerequisite builds on top of the bare semisimplicity predicate. Layer 6 (the
virtual-character ring, Artin and Brauer induction) needs Layer 2's induced-character formula to define
induction on `R(G)` and Layer 0's projection formula for the `R(G)`-module structure; it is otherwise
self-contained. Its cyclotomic splitting-field corollary is a distinct sublayer (character fields and Schur
indices), and it is that sublayer, not Brauer induction alone, that discharges the fact the
[character-theory roadmap](../CharacterTheory/README.md) cites at its Layer 4. Layer 7 (projective
representations, factor sets, the Schur multiplier) consumes Mathlib's degree-`2` group cohomology directly
and is independent of Layers 3–4. Its scalar and division-commutant Clifford refinements consume Layer1/5's actual inertia/intertwiner carriers and native Schur. The isotypic-module equivalence additionally uses the explicitly constructed isotypic evaluation API; it is not a prerequisite of Layer5's Mackey proof of Clifford correspondence. The scalar construction can be built directly from native intertwiners and hScalar. The division branch constructs crossed systems and neutralization before its scalar-recovery and multiplicity comparisons. The abstract perfect-group UCE remains independent of these finite-dimensional representation constructions. The examples are built
alongside the layer that first makes each expressible.

## References

- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977) -- Part I, §7 (induced
  representations, the induced character), §7.3–7.4 (Frobenius reciprocity), and the Mackey irreducibility
  criterion (§7.4, Prop. 23–25).
- I. M. Isaacs, *Character Theory of Finite Groups*, AMS Chelsea (1976) -- Ch. 5 (induced characters, the
  induced-character formula, Frobenius reciprocity), Ch. 6 (Clifford theory, the inertia group, the Clifford
  correspondence).
- C. W. Curtis, I. Reiner, *Methods of Representation Theory, Vol. I*, Wiley (1981) -- §10–11 (induction and
  restriction of modules, the Mackey decomposition theorem and subgroup theorem, transitivity, the
  projection formula) and §11 (Clifford theory) in module-theoretic generality.
- G. James, M. Liebeck, *Representations and Characters of Groups*, 2nd ed., CUP (2001) -- Ch. 21
  (induced modules and characters), with the `Sₙ` and permutation-character examples worked concretely.
- J. L. Alperin, R. B. Bell, *Groups and Representations*, Springer GTM 162 (1995) -- Ch. 8 (induced
  representations, Mackey's theorem, Clifford theory) as a clean modern account.
- G. W. Mackey, *On induced representations of groups*, Amer. J. Math. 73 (1951) 576–592 -- the original
  decomposition and irreducibility theorems.
- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977) -- Part II, §9–10
  (the Grothendieck ring, Artin's and Brauer's induction theorems, Brauer's characterization of characters,
  and the cyclotomic splitting-field corollary) for Layer 6.
- G. Karpilovsky, *Projective Representations of Finite Groups*, Marcel Dekker (1985) -- factor sets, the
  twisted group algebra, the Schur multiplier `H²(G, k^×)`, and representation groups (Schur covers), for
  Layer 7.
- I. M. Isaacs, *Character Theory of Finite Groups*, AMS Chelsea (1976) -- Ch. 8 (the Schur multiplier,
  projective representations, and the extension obstruction to Clifford theory) and Ch. 11 for Layer 7.

The object-level `Representation.comp` and invariant-space interfaces follow the
[Category Rep and restriction of scalars discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Category.20Rep.20and.20restriction.20of.20scalars/with/607304102):
construct the representation maps first and derive categorical wrappers from them.
