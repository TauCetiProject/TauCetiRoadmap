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

What Mathlib does **not** have is almost everything that turns this adjunction machinery into the classical
theory a representation theorist would recognize: **transitivity of induction** (`Ind` along a composite is
`Ind` then `Ind`); the **projection formula** `Ind(A ⊗ Res B) ≅ Ind A ⊗ B` as an isomorphism of
representations (not only its coinvariants shadow); the **conjugate representation** `{}^s V` that Mackey
theory is phrased in; that induction of a finite-dimensional representation of a finite-index subgroup is
finite-dimensional, with `dim = [G : S] · dim`; the **induced-character formula** giving `(Ind χ)(g)` as a
sum of `χ` over the conjugates landing in the subgroup; **Frobenius reciprocity as an identity of character
inner products**; the **Mackey decomposition formula** for `Res ∘ Ind` over double cosets; the **Mackey
irreducibility criterion**; **Clifford theory** over a normal subgroup; the **virtual-character ring**
`R(G)` with the **Artin and Brauer induction theorems** and Brauer's characterization of characters; and
**projective representations**, their **factor sets**, and the **Schur multiplier** `H²(G, k^×)`. None of
this is upstream.

This roadmap builds that theory. It is deliberately built on Mathlib's categorical spine `Rep k G` wherever
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

- **The coefficient ring, and where it sharpens.** State each result at the generality it needs, matching
  Mathlib. The **functorial layer** (induction, restriction, coinduction, transitivity, the projection
  formula, the Mackey decomposition as an isomorphism of representations) is stated over a commutative ring
  `k` (`[CommRing k]`), exactly as `Representation.ind` and `Rep.indResAdjunction` are. The **character and
  irreducibility layer** (the induced-character formula, Frobenius reciprocity as a pairing, the Mackey
  irreducibility criterion, Clifford theory) is stated over a field `k` that is **algebraically closed with
  `char k ∤ |G|`**, the setting of Mathlib's `FDRep.char_orthonormal` and of the
  [character-theory roadmap](../CharacterTheory/README.md); the concrete worked tables are over `ℂ`. Do not
  bundle "algebraically closed and `char ∤ |G|`" into a class; spell the hypotheses each result uses.

- **The primary spine is the categorical `Rep k G`; the character side is the mirror.** Mathlib's induction,
  coinduction, restriction, and both adjunctions live on the category `Rep k G` (objects a `k`-module with a
  `Representation k G` action). Develop the functorial theory there, reusing `Rep.ind`, `Rep.res`,
  `Rep.coind`, `Rep.indResAdjunction`, and `Rep.resCoindAdjunction` directly. The character theory is the
  mirror: characters are traces on `FDRep k G` (`FDRep.character`), so results about `Ind χ` are stated for
  `FDRep`, and the finiteness needed to take a trace (induction of a finite-dimensional representation of a
  finite-index subgroup is finite-dimensional) is itself a target of Layer 2. Use Mathlib's vocabulary
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
- **Degree-`2` group cohomology (for the Schur multiplier, Layer 7):**
  `RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` -- `groupCohomology.H2 A`
  (`= groupCohomology A 2`), the `2`-cocycles and `2`-coboundaries `groupCohomology.cocycles₂ A`,
  `coboundaries₂ A`, the projection `H2π A`, and the multiplicative interface
  `IsMulCocycle₂` / `IsMulCoboundary₂` with `cocyclesOfIsMulCocycle₂`, applied to the trivial module
  `Rep.trivial ℤ G (Additive kˣ)` (also reachable via `Rep.ofMulDistribMulAction`).
- **The projective linear group (for projective representations, Layer 7):**
  `LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` -- `Matrix.ProjGenLinGroup` with notation
  `PGL(n, R)`, `PGL.mk : GL n R →* PGL(n, R)` and `PGL.lift`, the codomain of a projective representation.

## What is missing (build here)

**Transitivity** of induction, coinduction, and restriction along composites; the **projection formula**
`Ind(A ⊗ Res B) ≅ Ind A ⊗ B` and its dual, as isomorphisms of representations; the **conjugate
representation** `conjRep`, its functoriality, character, and cocycle coherence; that **induction preserves
finite-dimensionality** for a finite-index subgroup, with `finrank (Ind A) = [G : S] · finrank A`, packaged
as an induction functor `FDRep k S ⥤ FDRep k G`; the **induced-character formula**; **Frobenius reciprocity
as an identity of character inner products** in both directions; the **Mackey decomposition formula** for
`Res_K ∘ Ind_H^G` over `K \ G / H`, both as an isomorphism of representations and as a character identity;
the **intertwining-number formula** and the **Mackey irreducibility criterion**; and **Clifford theory**
over a normal subgroup -- the inertia (stabilizer) group, that restriction to a normal subgroup is isotypic
with the isotypic components permuted transitively, and the induction bijection from the inertia group onto
the irreducibles lying over a given constituent. As specializations that genuinely unlock: the **permutation
character** `Ind_H^G(trivial) ≅ k[G/H]` and its fixed-point count, and **induced characters of `Sₙ` from
Young subgroups**. Beyond Mackey and Clifford, the **virtual-character ring** `R(G) = ch(kG)` with the
**Artin** and **Brauer** induction theorems, **Brauer's characterization of characters**, the
**elementary/hyperelementary subgroup** predicates, and the cyclotomic **splitting-field corollary**
`ℚ(ζ_e)` that the [character-theory roadmap](../CharacterTheory/README.md) cites; and **projective
representations**, their **factor-set** `2`-cocycles, the **twisted group algebra** `k_α[G]`, the **Schur
multiplier** `H²(G, k^×)` classifying projective representations and central extensions, the
**representation group** (Schur cover), and the identification of the Clifford-theory extension obstruction
with a Schur-multiplier class. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`conjRep`, `indFDRep`, `character_ind`, `mackeyDecomp`,
`irreducible_ind_iff`, the Clifford targets, the `artin_induction` / `brauer_induction` induction theorems,
`schurMultiplier`, and `twistedMul`) and the named milestones below as `sorry`-targets, so each is
claimable and its statement is machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

### Layer 0: the functorial core -- transitivity and the projection formula

Everything here is over `[CommRing k]`, on Mathlib's `Rep k G`, consuming the two adjunctions.

- **Restriction is functorial in the map.** `Res_ψ ∘ Res_φ = Res_{ψ ∘ φ}` (definitional from
  `res_obj_ρ` and `MonoidHom.comp_assoc`); state it as an equality/natural isomorphism of functors so the
  later layers can rewrite along nested subgroups `S ≤ T ≤ G` (`Subgroup.inclusion`).
- **Transitivity of induction.** For `S ≤ T ≤ G`, `Ind_T^G (Ind_S^T A) ≅ Ind_S^G A`, natural in `A`; more
  generally `indFunctor k (ψ.comp φ) ≅ indFunctor k φ ⋙ indFunctor k ψ`. Prove it as a natural isomorphism,
  and check its compatibility with `indResAdjunction` (the induced adjunction on the composite agrees with
  the composite of adjunctions). Dually, **transitivity of coinduction**, `Coind_T^G ∘ Coind_S^T ≅
  Coind_S^G`, from `resCoindAdjunction` and uniqueness of adjoints.
- **The projection formula (tensor identity).** For `φ : G →* H`, `A : Rep k G`, `B : Rep k H`, a natural
  isomorphism `Ind_φ(A ⊗ Res_φ B) ≅ (Ind_φ A) ⊗ B` in `Rep k H`, sending `⟦h ⊗ₜ (a ⊗ Res b)⟧` to
  `⟦h ⊗ₜ a⟧ ⊗ ρ(h) b`. This is the representation-level statement; Mathlib's
  `coinvariantsTensorIndNatIso` is its image under coinvariants, and this target should be shown to recover
  it. State also the dual projection formula for coinduction. The projection formula is what makes induced
  representations a module over the representation ring and is used pervasively downstream.

### Layer 1: the conjugate representation

Over `[CommRing k]`; the character statement over a field.

- **`conjRep s A`.** For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the representation of
  `MulAut.conj s • H` on `A.V` with `x` acting by `A.ρ ⟨s⁻¹ * x * s, _⟩` (the membership proof from
  `x ∈ sHs⁻¹`). A genuine `def`. Its functoriality `conjRepMap` in `A`, and that conjugating by `1` is the
  identity and `conjRep (s*t) ≅ conjRep s ∘ conjRep t` up to the canonical identification of the doubly
  conjugated subgroup (the cocycle coherence Mackey and Clifford both need).
- **The conjugate character.** For `A : FDRep k H`, `({}^s A).character x = A.character ⟨s⁻¹ x s, _⟩` for
  `x ∈ sHs⁻¹`; in particular `finrank k ({}^s A) = finrank k A`, and `{}^s A` is irreducible iff `A` is
  (conjugation is an equivalence of categories `FDRep k H ≌ FDRep k (sHs⁻¹)`).
- **Restriction–conjugation interchange.** For a normal subgroup `N`, `MulAut.conj s • N = N`
  (`Normal.conj_smul_eq_self`), so `conjRep s` is an autoequivalence of `Rep k N`; this is the action of `G`
  on `Rep k N` that Clifford theory (Layer 5) uses.

### Layer 2: induced characters and Frobenius reciprocity

Over an algebraically closed field with `char k ∤ |G|`; finite `G`. This layer connects to the
[character-theory roadmap](../CharacterTheory/README.md).

- **Induction preserves finite-dimensionality.** For `[S.FiniteIndex]` and `A : Rep k S` finite-dimensional,
  `Ind_S^G A` is finite-dimensional with `finrank k (Ind_S^G A) = S.index · finrank k A` (a free basis
  indexed by coset representatives times a basis of `A`). Package this as an induction functor on finite
  objects, `indFDRep : FDRep k S ⥤ FDRep k G`, together with an isomorphism to `Rep.ind S.subtype` under
  the forgetful functor, so `FDRep.character` applies.
- **The induced-character formula.** For `A : FDRep k S`, `[Fintype G]`, and `g : G`,
  `(indFDRep A).character g = (Nat.card S)⁻¹ · ∑ x : G, [x⁻¹ g x ∈ S] · A.character ⟨x⁻¹ g x, _⟩`,
  equivalently the sum over coset representatives `t` with `t⁻¹ g t ∈ S`. Prove it from the trace on the
  free module `k[G/S] ⊗ A` by computing which basis vectors are fixed. This is the character-theoretic
  workhorse and the object CharacterTheory consumes for permutation and Young-subgroup characters.
- **The permutation character.** `Ind_H^G (trivial) ≅ Rep.ofMulAction k (G ⧸ H)` (the permutation
  representation on cosets), whose character at `g` is `#{xH : g x H = x H}`, the number of fixed cosets;
  and Burnside-flavored consequences (`⟨Ind_H^G 1, 1⟩_G = #(H \ G / H)`) via Frobenius reciprocity.
- **Frobenius reciprocity as a character identity.** With the pairing `characterPairing` of the
  [character-theory roadmap](../CharacterTheory/README.md): for `A : FDRep k S` and `B : FDRep k G`,
  `⟨(indFDRep A).character, B.character⟩_G = ⟨A.character, (res S.subtype B).character⟩_S`, proved from
  `indResAdjunction` together with `scalar_product_char_eq_finrank_equivariant` (each side counts
  `dim Hom`), and the dual identity from `resIndAdjunction`. State it self-containedly with the explicit
  `(Nat.card ·)⁻¹ ∑` sums as well, so it does not hard-depend on the pairing's final name.

### Layer 3: the Mackey decomposition formula

Over `[CommRing k]` for the isomorphism, over a field for the character identity; `H, K : Subgroup G`.

- **The Mackey summand.** For `s : G`, the subgroup `K ⊓ (MulAut.conj s • H)` of `G`, viewed inside `K` via
  `Subgroup.subgroupOf`, and the representation `Ind_{(K ⊓ sHs⁻¹) ∩ K}^K (Res ({}^s A))` built from
  Layers 0–1. Pin the indexing by `DoubleCoset.Quotient (K : Set G) H` with representatives `Quotient.out`,
  and prove the summand is independent of the representative up to isomorphism.
- **The Mackey decomposition (isomorphism form).** For `A : Rep k H` and `[Fintype G]`,
  `Res_K (Ind_H^G A) ≅ ⨁_{KsH ∈ K\G/H} Ind_{K ∩ sHs⁻¹}^K (Res_{K ∩ sHs⁻¹} ({}^s A))`, a natural
  isomorphism in `Rep k K`, proved by splitting the free module `k[G/H] ⊗ A` along the double-coset cover
  `DoubleCoset.iUnion_quotToDoubleCoset` and matching each `K`-orbit block with an induced summand. This is
  the central structural theorem of the roadmap.
- **The Mackey decomposition (character form).** The corresponding identity for
  `(Res_K (indFDRep A)).character` as a sum over `K\G/H` of induced characters of the conjugates, a direct
  consequence via Layer 2's induced-character formula, and the form the examples check.

### Layer 4: intertwining numbers and the Mackey irreducibility criterion

Over an algebraically closed field with `char k ∤ |G|`; finite `G`.

- **The intertwining-number formula.** Combining Frobenius reciprocity (Layer 2), the Mackey decomposition
  (Layer 3), and Schur, for `V : FDRep k H`:
  `finrank k (Ind_H^G V ⟶ Ind_H^G V) = ∑_{s ∈ H\G/H} finrank k (Res_{H ⊓ sHs⁻¹} V ⟶ Res_{H ⊓ sHs⁻¹} ({}^s V))`.
  State it as an equality of intertwining-space dimensions (`FDRep` homs), the quantitative core of the
  criterion.
- **The Mackey irreducibility criterion.** `Ind_H^G V` is irreducible if and only if `V` is irreducible and
  for every `s : G` with `s ∉ H`, the restrictions `Res_{H ⊓ sHs⁻¹} V` and `Res_{H ⊓ sHs⁻¹} ({}^s V)` are
  **disjoint** (no common irreducible constituent, i.e. their intertwining space is `0`). Proved by reading
  the intertwining-number formula: the `s = 1` (identity double coset) term contributes `dim End V = 1`
  exactly when `V` is irreducible, and the criterion is that every other term vanishes. Include the
  normal-subgroup corollary: if `H ◁ G` then `Ind_H^G V` is irreducible iff `V` is irreducible and
  `{}^s V ≇ V` for all `s ∉ H` (the disjointness collapses to non-isomorphism since the restrictions are to
  `H` itself).

### Layer 5: Clifford theory over a normal subgroup

Over an algebraically closed field with `char k ∤ |G|`; finite `G`; `N : Subgroup G` with `[N.Normal]`.

- **The `G`-action on `Irr(N)`.** `G` acts on isomorphism classes of irreducible `N`-representations by
  `conjRep` (Layer 1, using `MulAut.conj s • N = N`); the **inertia (stabilizer) group** `inertia V ≤ G` of
  an irreducible `V : FDRep k N` is `{g : G | {}^g V ≅ V}`, a subgroup containing `N`.
- **Clifford's theorem.** For an irreducible `W : FDRep k G`, `Res_N W` is semisimple (Maschke) and
  **isotypic under the `G`-action**: its irreducible `N`-constituents form a single `G`-orbit, all with the
  same multiplicity `e`, so `Res_N W ≅ e · ⨁_{i} {}^{gᵢ} V` where `g₁, …, g_t` are coset representatives of
  `inertia V` in `G` and `V` is any constituent. In particular `t = [G : inertia V]` divides
  `finrank W / (e · finrank V)`.
- **The Clifford correspondence.** Induction `Ind_{inertia V}^G` is a bijection from the isomorphism classes
  of irreducible `(inertia V)`-representations lying over `V` onto the isomorphism classes of irreducible
  `G`-representations lying over `V`, with inverse a distinguished constituent of restriction. Proved via
  the Mackey irreducibility criterion (Layer 4) applied to the inertia subgroup: `Ind` of an irreducible of
  the inertia group over `V` is irreducible because conjugates by `s ∉ inertia V` move `V` off itself. This
  reduces the classification of `Irr(G)` lying over `V` to the (generally easier) inertia group.

### Layer 6: the virtual-character ring, Artin and Brauer induction

Over `ℂ` (more generally an algebraically closed field of characteristic `0`, or any field containing the
`e`-th roots of unity for `e = Monoid.exponent G`); finite `G`. This is the classical **induction-theorem**
heart of ordinary character theory, absent from the whole representation-theory family; it connects to the
[character-theory roadmap](../CharacterTheory/README.md), whose `VirtualCharacter G` is the additive group
underlying the ring built here.

- **The virtual-character ring** `R(G) = ch(kG)`. The `ℤ`-span of the irreducible characters inside the
  class functions, a commutative ring under the pointwise (tensor-product) product `char_tensor`, with unit
  the trivial character; this is the Grothendieck ring of `FDRep k G`. Restriction `Res_H^G : R(G) → R(H)`
  is a ring homomorphism and, by the projection formula (Layer 0), induction `Ind_H^G : R(H) → R(G)` is a
  homomorphism of `R(G)`-modules -- **Frobenius reciprocity as a module identity**. Package the induced
  class function `indClassFun`, computing `Ind` on characters via Layer 2's `character_ind`.
- **Artin's induction theorem.** Every character is a `ℚ`-linear combination of characters induced from
  **cyclic** subgroups; equivalently `|G| · χ` is a `ℤ`-linear combination of `Ind_C^G ψ` over cyclic
  `C ≤ G` (`IsCyclic`) and characters `ψ` of `C`. State the `ℤ`-membership of `|G| • χ` in the subgroup
  generated by cyclic-induced characters, and derive that `⊕_{C cyclic} R(C) → R(G)` is rationally
  surjective (its image has finite index dividing a power of `|G|`).
- **Artin's corollary (rational representations).** Two `ℚ[G]`-representations are isomorphic iff their
  fixed-point dimensions `dim V^C` agree for every cyclic `C ≤ G`; the fixed dimensions on cyclic subgroups
  are a complete invariant of a rational representation.
- **Elementary and hyperelementary subgroups.** For a prime `p`, a **`p`-elementary** subgroup is a direct
  product `C × P` with `C` cyclic of order prime to `p` and `P` a `p`-group (`IsPGroup p P`); **elementary**
  means `p`-elementary for some `p`, and **hyperelementary** relaxes `C × P` to a normal `P` with cyclic
  quotient. Mathlib has `IsCyclic` and `IsPGroup` but **no** elementary-subgroup predicate; define
  `IsElementary` (and `IsHyperelementary`) with their basic closure properties.
- **Brauer's induction theorem.** Every character is a `ℤ`-linear combination of characters induced from
  **elementary** subgroups: the map `⊕_{E elementary} R(E) → R(G)` is **surjective**. This is the sharp
  integral form that Artin achieves only rationally.
- **Brauer's characterization of characters.** A class function `f` is a virtual character (lies in `R(G)`)
  **iff** its restriction `Res_E f` to every elementary subgroup `E ≤ G` is a virtual character of `E`. This
  is the theorem from which Brauer surjectivity follows, and the standard tool for certifying that a given
  class function is a genuine virtual character.
- **The cyclotomic splitting-field corollary.** `ℚ(ζ_e)`, `e = Monoid.exponent G`, is a **splitting field**
  for `G`: every irreducible `ℂ`-representation is realizable over `ℚ(ζ_e)`. Each elementary subgroup has all
  its irreducibles realizable over the cyclotomic field, and Brauer induction propagates this to all of `G`.
  The [character-theory roadmap](../CharacterTheory/README.md) **cites this exact statement** as an
  application off its Layer 4 critical path; this layer **supplies its proof**.

### Layer 7: projective representations, factor sets, and the Schur multiplier

Over an algebraically closed field `k` (so every projective representation admits a genuine factor set
valued in `kˣ`); finite `G`. This is the natural companion to Layer 5's Clifford theory: the obstruction to
extending an irreducible of a normal subgroup to its inertia group is exactly a Schur-multiplier class.

- **Projective representations and factor sets.** A **projective representation** on `V` is a homomorphism
  `G → PGL(V)` (Mathlib's `Matrix.ProjGenLinGroup`, `PGL(n, k)`), equivalently a lift `ρ : G → GL(V)` with
  `ρ(g) ρ(h) = α(g, h) · ρ(gh)` for a **factor set** `α : G × G → kˣ`. The factor set satisfies the
  multiplicative `2`-cocycle identity -- it is a `groupCohomology.IsMulCocycle₂` for the **trivial** action
  of `G` on `kˣ`, equivalently `Additive.ofMul ∘ α ∈ groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ))`
  via `cocyclesOfIsMulCocycle₂`. Pin `IsProjectiveRep` and this cocycle statement.
- **Equivalence and the Schur multiplier.** Two projective representations are **projectively equivalent**
  iff their factor sets differ by a coboundary (`groupCohomology.IsMulCoboundary₂`), i.e. by rescaling each
  `ρ(g)`. The equivalence classes of factor sets are therefore the **second cohomology** `H²(G, kˣ)`, the
  **Schur multiplier** `M(G)`: define `schurMultiplier := groupCohomology.H2 (Rep.trivial ℤ G (Additive kˣ))`
  and prove it classifies projective representations up to equivalence.
- **The twisted group algebra.** `k_α[G]`, the `k`-algebra on `G →₀ k` with product
  `e_g · e_h = α(g, h) · e_{gh}` twisting `MonoidAlgebra k G`; a genuine `def` (`twistedMul`). Projective
  representations with factor set `α` are exactly `k_α[G]`-modules, and cohomologous `α` give isomorphic
  twisted algebras, so `k_α[G]` up to isomorphism depends only on the class in `M(G)`. This is the
  module-theoretic home of projective representation theory, mirroring the ordinary `k[G]` spine.
- **Central extensions and representation groups.** A factor set `α` builds a **central extension**
  `1 → kˣ → E_α → G → 1` (the set `kˣ × G` with twisted multiplication, `centralExtensionOfFactorSet`), and
  `H²(G, kˣ)` classifies central extensions of `G` by `kˣ` up to equivalence. A **representation group**
  (Schur cover) is a central extension `1 → M(G) → Ĝ → G → 1` with `M(G)` inside the commutator subgroup,
  through which **every** projective representation of `G` lifts to an ordinary linear representation of `Ĝ`.
  Mathlib has central extensions only for Lie algebras (`Algebra/Lie/Extension.lean`), not for groups, so
  the group central extension and the representation group are built here.
- **The Clifford-theory obstruction.** For `N ◁ G` and an irreducible `V : FDRep k N` with inertia group
  `T = inertia V` (Layer 5), the obstruction to extending `V` to an ordinary representation of `T` is a class
  `cliffordObstruction V` in the Schur multiplier `H²(T/N, kˣ)`; `V` extends iff that class is trivial, and
  in general the irreducibles of `T` lying over `V` are the **projective** representations of `T/N` carrying
  that factor set. This identifies the extension obstruction of Layer 5's Clifford correspondence with a
  Schur-multiplier class, closing the loop between the two layers.

---

## Worked examples (acceptance criteria)

- **Permutation characters and fixed points.** For `G = S₄` and `H` a point stabilizer `S₃`,
  `Ind_H^G(trivial)` is the natural permutation representation on `4` points; its character at `g` is the
  number of fixed points of `g`, and `⟨Ind_H^G 1, Ind_H^G 1⟩ = #(H \ G / H) = 2` (two orbits of `S₄` on
  ordered/unordered pairs), so it splits as `trivial ⊕ (standard 3-dimensional)`. This exercises Layer 2 and
  the double-coset count. It is a direct feed into the [character-theory roadmap](../CharacterTheory/README.md).
- **Induced characters from Young subgroups.** For `Sₙ` and a Young subgroup
  `S_λ = S_{λ₁} × ⋯ × S_{λᵣ}`, the induced character `Ind_{S_λ}^{Sₙ}(trivial)` is the permutation character
  on tabloids, and the induced-character formula computes its values as products of fixed-point counts. Do
  `n = 3, 4` explicitly; the resulting characters, paired via Frobenius reciprocity against the irreducibles,
  are the multiplicities that CharacterTheory's tables record.
- **Mackey on a small group.** For `G = S₃`, `H = ⟨(1 2)⟩` of order `2`: compute `H \ G / H` (two double
  cosets), apply the Mackey decomposition to `Res_H Ind_H^G(sign_H)`, and check the character identity of
  Layer 3 term by term. Then apply the Mackey irreducibility criterion to see that `Ind_H^G(sign_H)` is the
  reducible `2`-dimensional-plus, and that inducing a nontrivial character of a well-chosen subgroup does
  give the `2`-dimensional irreducible.
- **The `D₄` / `Q₈` dihedral induction.** `Ind` from the cyclic subgroup of order `4` to
  `D₄ = DihedralGroup 4` produces the `2`-dimensional irreducible; the Mackey criterion certifies its
  irreducibility. This dovetails with the same pair in the character-theory roadmap.
- **Clifford on `A₄ ◁ S₄`.** With `N = A₄` normal in `G = S₄`, the two nontrivial linear characters of
  `A₄` (cube-root-of-unity valued) form a single `S₄`-orbit; Clifford's theorem predicts and the inertia
  computation confirms how the irreducibles of `S₄` restrict to `A₄`, and the Clifford correspondence
  recovers `Irr(S₄)` lying over each `N`-constituent.

## Ordering

Layer 0 (transitivity, projection formula) is pure category theory over `Rep k G`, needs only the consumed
adjunctions, and comes first. Layer 1 (the conjugate representation) is independent of Layer 0 and can
proceed in parallel; both are prerequisites for everything downstream. Layer 2 (induced characters,
Frobenius reciprocity) needs Layer 1's conjugate character only for the reciprocity corollaries, and needs
the finite-dimensionality result as its own first target; it is where the connection to the
[character-theory roadmap](../CharacterTheory/README.md) is made. Layer 3 (Mackey decomposition) needs
Layers 0–2: transitivity and the projection formula to build the summands, the conjugate representation to
name them, and the induced-character formula for its character form. Layer 4 (the irreducibility criterion)
needs Layer 2's Frobenius reciprocity and Layer 3's decomposition, plus Schur. Layer 5 (Clifford theory)
needs Layer 4's criterion for the correspondence, Layer 1's conjugation action for the inertia group, and
Maschke (consumed) for semisimplicity of the restriction. Layer 6 (the virtual-character ring, Artin and
Brauer induction) needs Layer 2's induced-character formula to define induction on `R(G)` and Layer 0's
projection formula for the `R(G)`-module structure; it is otherwise self-contained, and its cyclotomic
splitting-field corollary discharges the fact the [character-theory roadmap](../CharacterTheory/README.md)
cites at its Layer 4. Layer 7 (projective representations, factor sets, the Schur multiplier) consumes
Mathlib's degree-`2` group cohomology directly and is independent of Layers 3–4; only its Clifford-theory
obstruction needs Layer 5's inertia group, so it is placed last, tying the Schur multiplier back to the
Clifford correspondence. The examples are built alongside the layer that first makes each expressible.

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
