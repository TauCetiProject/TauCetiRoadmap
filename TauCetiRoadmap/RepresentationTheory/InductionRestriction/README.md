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
  3. **Inner products, orthogonality, irreducibility criteria, and Clifford theory** over a **splitting
     field** `k` with `IsUnit (Nat.card G : k)` (the Maschke hypothesis), the setting of Mathlib's
     `FDRep.char_orthonormal`; taking `k` algebraically closed with `char k ∤ |G|` (the concrete worked
     tables over `ℂ`) supplies both at once and is what the [character-theory
     roadmap](../CharacterTheory/README.md) uses.

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
- **Semisimplicity (predicate only):** `RepresentationTheory/Semisimple.lean` --
  `IsSemisimpleRepresentation` and its identification with `IsSemisimpleModule k[G]`, together with the
  Maschke theorem. This is the *predicate* that a representation is semisimple; Mathlib does **not** yet
  provide the isotypic-decomposition API on top of it (decomposition into a finite direct sum of
  irreducibles, isotypic components, multiplicity as `finrank` of a `Hom` space, restriction preserving
  semisimplicity, and character detection of a constituent). That bookkeeping is a build target here
  (Layer 5 prerequisite), consumed by Clifford theory.
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
  `PGL(n, R)`, `PGL.mk : GL n R →* PGL(n, R)` and `PGL.lift`. This is the **matrix** group `PGL(n, k)`, not
  a basis-free projectivized automorphism group of an arbitrary `k`-module. Layer 7 works with normalized
  lifts `G → (V ≃ₗ[k] V)` (a basis-free `GL(V)`) and identifies a projective representation with a
  homomorphism to `PGL(n, k)` only after choosing a basis; the compatibility with `Matrix.ProjGenLinGroup`
  under a basis is itself a small build target.

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
  the composite of adjunctions). The categorical isomorphism exists by uniqueness of left adjoints; because
  the later character and Mackey computations need to know how it acts on representatives, also record the
  **explicit representative-level formula** for the isomorphism (on `k[T] ⊗ k[S] ⊗ A`) and the `simp`
  lemmas that fire on it, rather than leaving it an abstract adjoint comparison. Dually, **transitivity of
  coinduction**, `Coind_T^G ∘ Coind_S^T ≅ Coind_S^G`, from `resCoindAdjunction` and uniqueness of adjoints.
- **The projection formula (tensor identity).** For `φ : G →* H`, `A : Rep k G`, `B : Rep k H`, a natural
  isomorphism `Ind_φ(A ⊗ Res_φ B) ≅ (Ind_φ A) ⊗ B` in `Rep k H`, sending `⟦h ⊗ₜ (a ⊗ Res b)⟧` to
  `⟦h ⊗ₜ a⟧ ⊗ ρ(h) b`. This is not a quick categorical consequence: `Representation.ind` is built as the
  coinvariants of `k[H] ⊗ A`, so the isomorphism is assembled by hand from the monoidal structure of
  `Rep k H` (associators and the braiding, `MonoidalCategory`) and the coinvariants quotient. Build it in
  stages: (1) the explicit `k`-linear map on representatives; (2) the proof it descends to coinvariants;
  (3) equivariance; (4) naturality in `A` and `B`; (5) the comparison showing Mathlib's
  `coinvariantsTensorIndNatIso` is exactly its image under coinvariants. Before starting, audit which
  associator/coherence lemmas `Rep k H` already carries so the construction reuses them. State also the
  dual projection formula for coinduction. The projection formula is what makes induced representations a
  module over the representation ring and is used pervasively downstream.

### Layer 1: the conjugate representation

Over `[CommRing k]`; the character statement over a field.

- **The conjugation convention, fixed once.** Every formula below reads off Mathlib's pointwise action,
  not prose: `Subgroup.mem_pointwise_smul_iff_inv_smul_mem` gives
  `x ∈ (MulAut.conj s • H) ↔ s⁻¹ * x * s ∈ H`, so `MulAut.conj s • H` is `sHs⁻¹` and the membership proof
  needed by `conjRep` is `s⁻¹ * x * s ∈ H`. Pin this as an explicit sanity lemma and derive the conjugate
  action and character from it, so the whole layer cannot be silently orientation-reversed.
- **`conjRep s A`.** For `s : G`, `H : Subgroup G`, and `A : Rep k H`, the representation of
  `MulAut.conj s • H` on `A.V` with `x` acting by `A.ρ ⟨s⁻¹ * x * s, _⟩` (the membership proof as above).
  A genuine `def`. Its functoriality `conjRepMap` in `A`, and that conjugating by `1` is the
  identity and `conjRep (s*t) ≅ conjRep s ∘ conjRep t` up to the canonical identification of the doubly
  conjugated subgroup (the cocycle coherence Mackey and Clifford both need).
- **The conjugate character.** For `A : FDRep k H`, `({}^s A).character x = A.character ⟨s⁻¹ x s, _⟩` for
  `x ∈ sHs⁻¹`; in particular `finrank k ({}^s A) = finrank k A`, and `{}^s A` is irreducible iff `A` is
  (conjugation is an equivalence of categories `FDRep k H ≌ FDRep k (sHs⁻¹)`).
- **Restriction–conjugation interchange.** For a normal subgroup `N`, `MulAut.conj s • N = N`
  (`Normal.conj_smul_eq_self`), so `conjRep s` is an autoequivalence of `Rep k N`; this is the action of `G`
  on `Rep k N` that Clifford theory (Layer 5) uses.

### Layer 2: induced characters and Frobenius reciprocity

Finite `G`. The finite-dimensionality result and the induced-character formula need only a field `k`
(regime 2); the inner-product and reciprocity results need a splitting field with `IsUnit (Nat.card G : k)`
(regime 3). This layer connects to the [character-theory roadmap](../CharacterTheory/README.md).

- **Induction preserves finite-dimensionality, via an explicit coset model.** Because `Representation.ind`
  is built through coinvariants, the free basis is not immediately available; first construct the named
  `k`-linear equivalence `Ind_S^G A ≃ₗ[k] (G ⧸ S →₀ A)` (equivalently a finite direct sum over cosets)
  and derive from it that, for `[S.FiniteIndex]` and finite-dimensional `A`, `Ind_S^G A` is
  finite-dimensional with `finrank k (Ind_S^G A) = S.index · finrank k A`. Package induction on finite
  objects as `indFDRep : FDRep k S ⥤ FDRep k G`, with an isomorphism to `Rep.ind S.subtype` under the
  forgetful functor so `FDRep.character` applies. This coset equivalence also powers the character formula
  and the Mackey splitting, so it is a named, reusable theorem.
- **The induced-character formula (primary form: coset-representative sum, no division).** For a field `k`,
  `A : FDRep k S`, `[S.FiniteIndex]`, and `g : G`, the induced character is the sum over coset
  representatives `t : G ⧸ S` of `χ(t⁻¹ g t)` for those `t` with `t⁻¹ g t ∈ S` (and `0` otherwise). The
  value is well-defined because `A.character` is a class function on `S`. Prove it from the trace on the
  coset model `G ⧸ S →₀ A` by reading off which basis blocks are fixed; no invertibility of `|S|` is used.
  This is the character-theoretic workhorse CharacterTheory consumes for permutation and Young-subgroup
  characters.
- **The averaged group-sum form (corollary).** For `[Fintype G]` and the explicit hypothesis
  `IsUnit (Nat.card S : k)`,
  `(indFDRep A).character g = (Nat.card S : k)⁻¹ · ∑ x : G, [x⁻¹ g x ∈ S] · A.character ⟨x⁻¹ g x, _⟩`,
  obtained from the coset form by summing over the `|S|` elements of each coset. The invertibility
  hypothesis is what makes the `(Nat.card S)⁻¹` factor meaningful; without it the coset form is the one to
  use.
- **The permutation character.** Fix the coset convention: induction is along `S.subtype`, and inducing
  the trivial representation gives the **left**-coset permutation representation
  `Ind_H^G (trivial) ≅ Rep.ofMulAction k G (G ⧸ H)` on Mathlib's quotient `G ⧸ H`, with `G` acting by left
  translation. Its character at `g` is `#{xH : g • xH = xH}`, the number of fixed cosets; and, over a
  splitting field with `IsUnit (Nat.card G : k)`, `⟨Ind_H^G 1, Ind_H^G 1⟩_G = #(H \ G / H)` via
  Frobenius reciprocity and Mackey (`⟨Ind 1, 1⟩_G` itself is just `1`, by reciprocity against the
  trivial representation).
- **Frobenius reciprocity as a character identity.** Over a splitting field with `IsUnit (Nat.card G : k)`,
  for `A : FDRep k S` and `B : FDRep k G`,
  `⟨(indFDRep A).character, B.character⟩_G = ⟨A.character, (res S.subtype B).character⟩_S`, proved from
  `indResAdjunction` together with `scalar_product_char_eq_finrank_equivariant` (each side counts
  `dim Hom`), and the dual identity from `resIndAdjunction`. State it self-containedly with the explicit
  `(Nat.card ·)⁻¹ ∑` sums as well, so it does not hard-depend on the pairing's final name. Because these
  results lean on `FDRep.char_orthonormal`, record a small compatibility layer relating Mathlib's scalar
  product to the [character-theory roadmap](../CharacterTheory/README.md)'s `characterPairing`: that the
  pairing of two characters equals `finrank` of their `Hom` space, that it is `1` on an irreducible with
  itself, and that it is nonzero exactly when two representations share an irreducible constituent.

### Layer 3: the Mackey decomposition formula

`H, K : Subgroup G`. The isomorphism form (3a) is representation-level and needs only Layers 0-1 over
`[CommRing k]`; the character form (3b) needs Layer 2 over a field.

#### Layer 3a: the decomposition as an isomorphism of representations (over `[CommRing k]`)

- **The Mackey summand, with its two homomorphisms pinned.** For `s : G`, name the subgroup
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
  optional milestone), and the decomposition below is stated for the `Quotient.out` choice.
- **The Mackey decomposition (isomorphism form).** For `A : Rep k H` and `[Fintype G]`,
  `Res_K (Ind_H^G A) ≅ ⨁_{KsH ∈ K\G/H} Ind_{mackeySubgroup s H K}^K (Res ({}^s A))`, a natural
  isomorphism in `Rep k K`, proved by splitting the free module `k[G/H] ⊗ A` along the double-coset cover
  `DoubleCoset.iUnion_quotToDoubleCoset` and matching each `K`-orbit block with an induced summand. This is
  the central structural theorem of the roadmap.

#### Layer 3b: the character form (over a field, needs Layer 2)

- **The Mackey decomposition (character form).** The corresponding identity for
  `(Res_K (indFDRep A)).character` as a sum over `K\G/H` of induced characters of the conjugates, a direct
  consequence via Layer 2's induced-character formula, and the form the examples check.

### Layer 4: intertwining numbers and the Mackey irreducibility criterion

Over a splitting field with `IsUnit (Nat.card G : k)` (regime 3; the worked tables over `ℂ`); finite `G`.

- **Intertwining spaces are finite-dimensional `k`-modules.** The formula below sums `finrank` of `Hom`
  spaces, so first record the infrastructure the roadmap otherwise treats as automatic: the categorical
  `Hom` space of two `FDRep k G` objects is a finite-dimensional `k`-module agreeing with the space of
  intertwining maps, `finrank` is invariant under isomorphism of `Hom` spaces, and a finite biproduct
  decomposes the `Hom` space as a product with `finrank` the sum.
- **The intertwining-number formula.** Combining Frobenius reciprocity (Layer 2), the Mackey decomposition
  (Layer 3), and Schur, for `V : FDRep k H`:
  `finrank k (Ind_H^G V ⟶ Ind_H^G V) = ∑_{s ∈ H\G/H} finrank k (Res_{H ⊓ sHs⁻¹} V ⟶ Res_{H ⊓ sHs⁻¹} ({}^s V))`,
  the sum running over representatives of the double cosets `H \ G / H`. State it as an equality of
  intertwining-space dimensions (`FDRep` homs), the quantitative core of the criterion.
- **The Mackey irreducibility criterion (primary form, over double cosets).** `Ind_H^G V` is irreducible if
  and only if `V` is irreducible and for every **non-identity** double coset `HsH ∈ H \ G / H` (i.e. a
  representative `s ∉ H`) the restrictions `Res_{H ⊓ sHs⁻¹} V` and `Res_{H ⊓ sHs⁻¹} ({}^s V)` are
  **disjoint** (no common irreducible constituent, i.e. their intertwining space is `0`). Proved by reading
  the intertwining-number formula: the identity double coset contributes `dim End V = 1` exactly when `V`
  is irreducible, and the criterion is that every other term vanishes. Quantifying over double-coset
  representatives is the natural statement; the disjointness condition is what the formula's terms are
  indexed by.
- **The `∀ s ∉ H` corollary.** The criterion re-expressed as "for every `s : G` with `s ∉ H`, the
  restrictions are disjoint" follows once the disjointness condition is shown invariant under replacing `s`
  by `h₁ s h₂` for `h₁, h₂ ∈ H` (the intersection subgroup and the conjugate representation change only by
  isomorphism). State this invariance as its own lemma and derive the elementwise form from the double-coset
  form.
- **The normal-subgroup corollary.** If `H ◁ G` then `Ind_H^G V` is irreducible iff `V` is irreducible and
  `{}^s V ≇ V` for all `s ∉ H` (the disjointness collapses to non-isomorphism since the restrictions are to
  `H` itself).

### Layer 5: Clifford theory over a normal subgroup

Over a splitting field with `IsUnit (Nat.card G : k)` (regime 3; the worked table over `ℂ`); finite `G`;
`N : Subgroup G` with `[N.Normal]`.

- **Prerequisite: the isotypic-decomposition API.** Clifford theory needs more than the semisimplicity
  *predicate* Mathlib supplies (see the consume list). Before the theorems below, build the decomposition
  infrastructure over the same coefficient regime: every finite-dimensional representation decomposes as a
  finite direct sum of irreducibles; its **isotypic components** and their **multiplicities**, with
  multiplicity equal to `finrank` of the relevant `Hom` space; restriction along a subgroup preserves
  semisimplicity; and a character detects its constituents. These are genuine build targets, consumed by
  Clifford's theorem and by the Layer 4 intertwining count.
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
  `inertia V / N` holds **only when `V` extends to a genuine representation of `inertia V`**; in general the
  irreducibles over `V` are governed by a **projective** representation of `inertia V / N`, and the
  obstruction to extension is a Schur-multiplier class. That refinement is Layer 7, not part of this
  correspondence.

### Layer 6: the virtual-character ring, Artin and Brauer induction

Over `ℂ`, or an algebraically closed field of characteristic `0`; finite `G`. This is the classical
**induction-theorem** heart of ordinary character theory, absent from the whole representation-theory
family; it connects to the [character-theory roadmap](../CharacterTheory/README.md), whose
`VirtualCharacter G` is the additive group underlying the ring built here.

- **The representation ring and its character map.** The primary object is the **Grothendieck ring**
  `R(G)` of `FDRep k G` under direct sum and tensor product: a genuine commutative ring (the tensor product
  gives the multiplication, the trivial representation the unit). The **character map** sends `R(G)` into
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
  elementary-subgroup predicate; define `IsElementary` and `IsHyperelementary` from these orientations,
  with their basic closure properties.
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
  preceding statements. The [character-theory roadmap](../CharacterTheory/README.md) **cites this exact
  statement** as an application off its Layer 4 critical path; this sublayer **supplies its proof**.

### Layer 7: projective representations, factor sets, and the Schur multiplier

Over an algebraically closed field `k` (so every projective representation admits a genuine factor set
valued in `kˣ`); finite `G`. This is the natural companion to Layer 5's Clifford theory: the obstruction to
extending an irreducible of a normal subgroup to its inertia group is exactly a Schur-multiplier class.

- **Projective representations and factor sets.** A **projective representation** on `V` is a homomorphism
  `G → PGL(V)`, equivalently a **normalized lift** `ρ : G → (V ≃ₗ[k] V)` (each `ρ(g)` an invertible linear
  map, not an arbitrary endomorphism) with `ρ(1) = 1` and `ρ(g) ∘ ρ(h) = α(g, h) · ρ(gh)` for a **factor
  set** `α : G × G → kˣ`. The invertibility and normalization are load-bearing: without them the zero map
  would vacuously satisfy the relation and the theory below collapses. The factor set satisfies the
  multiplicative `2`-cocycle identity -- it is a `groupCohomology.IsMulCocycle₂` for the **trivial** action
  of `G` on `kˣ`, equivalently `Additive.ofMul ∘ α ∈ groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ))`
  via `cocyclesOfIsMulCocycle₂`. Pin `IsProjectiveRep` (as a lift into `V ≃ₗ[k] V`) and this cocycle
  statement; a projective representation lands in the matrix group `PGL(n, k)` only after a basis is chosen.
- **Factor-set classes and the second cohomology.** Two projective representations are **projectively
  equivalent** iff their factor sets differ by a coboundary (`groupCohomology.IsMulCoboundary₂`), i.e. by
  rescaling each `ρ(g)`. The equivalence classes of factor sets are therefore exactly the **second
  cohomology** `H²(G, kˣ)`: define `schurMultiplier := groupCohomology.H2 (Rep.trivial ℤ G (Additive kˣ))`
  and prove that it classifies **factor sets up to cohomology**. Note the scope precisely: `H²(G, kˣ)`
  classifies factor-set classes, **not** projective representations themselves (a fixed class carries many
  non-isomorphic projective representations). The classical **Schur multiplier** `M(G) = H₂(G, ℤ)` is a
  separate finite abelian group, canonically the character dual of `H²(G, ℂˣ)`; if that object is wanted,
  pin it separately and prove the duality under suitable hypotheses rather than conflating the two.
- **The twisted group algebra.** For a **normalized `2`-cocycle** `α` (the cocycle identity and
  `α(1, g) = α(g, 1) = 1`), `k_α[G]` is the `k`-algebra on `G →₀ k` with product
  `e_g · e_h = α(g, h) · e_{gh}` twisting `MonoidAlgebra k G`; bundle it as `TwistedGroupAlgebra k G α`
  parameterized by the normalized cocycle, and prove associativity and the unit **first** (both fail for a
  raw `α : G × G → kˣ`; associativity is exactly the cocycle identity). Projective representations with
  factor set `α` are then exactly `k_α[G]`-modules for the matching left-action convention, and cohomologous
  `α` give isomorphic twisted algebras, so `k_α[G]` up to isomorphism depends only on the cohomology class.
  This is the module-theoretic home of projective representation theory, mirroring the ordinary `k[G]` spine.
- **Central extensions and representation groups.** A **normalized factor set** `α` builds a **central
  extension** `1 → kˣ → E_α → G → 1` (the set `kˣ × G` with twisted multiplication
  `(a, g)(b, h) = (a · b · α(g, h), g · h)`, `centralExtensionOfFactorSet`); the construction takes the
  cocycle and normalization proofs as data, since without them the multiplication is neither associative nor
  unital. `H²(G, kˣ)` classifies these central extensions up to equivalence. A **representation group**
  (Schur cover) is a central extension `1 → M(G) → Ĝ → G → 1` with `M(G)` inside the commutator subgroup,
  through which **every** projective representation of `G` lifts to an ordinary linear representation of `Ĝ`.
  Mathlib has central extensions only for Lie algebras (`Algebra/Lie/Extension.lean`), not for groups, so
  the group central extension and the representation group are built here.
- **The Clifford-theory obstruction.** For `N ◁ G` and an irreducible `V : FDRep k N` with inertia group
  `T = inertia V` (Layer 5), the projective action lives on the **quotient** `T/N`: the obstruction to
  extending `V` to an ordinary representation of `T` is a class `cliffordObstruction V` in `H²(T/N, kˣ)`
  (group cohomology of `T/N`, using `N ≤ T` normal in `T`). `V` extends iff that class is trivial, and in
  general the irreducibles of `T` lying over `V` are the **projective** representations of `T/N` carrying
  that factor set. This identifies the extension obstruction of Layer 5's Clifford correspondence with a
  cohomology class over `T/N`, closing the loop between the two layers.

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

Layer 0 (transitivity, projection formula) is pure category theory over `Rep k G`, needs only the consumed
adjunctions, and comes first. Layer 1 (the conjugate representation) is independent of Layer 0 and can
proceed in parallel; both are prerequisites for everything downstream. Layer 2 (induced characters,
Frobenius reciprocity) needs Layer 1's conjugate character only for the reciprocity corollaries, and needs
the finite-dimensionality result as its own first target; it is where the connection to the
[character-theory roadmap](../CharacterTheory/README.md) is made. Layer 3 splits: the representation-level
Mackey decomposition (3a) needs only Layers 0-1 (transitivity and the projection formula to build the
summands, the conjugate representation to name them), while the character form (3b) additionally needs
Layer 2's induced-character formula. Layer 4 (the irreducibility criterion) needs Layer 2's Frobenius
reciprocity and Layer 3's decomposition, plus Schur and the Hom-space finiteness infrastructure. Layer 5
(Clifford theory) needs Layer 4's criterion for the correspondence, Layer 1's conjugation action for the
inertia group, Maschke (consumed) for semisimplicity of the restriction, and the **isotypic-decomposition
API** that Layer 5's prerequisite builds on top of the bare semisimplicity predicate. Layer 6 (the
virtual-character ring, Artin and Brauer induction) needs Layer 2's induced-character formula to define
induction on `R(G)` and Layer 0's projection formula for the `R(G)`-module structure; it is otherwise
self-contained. Its cyclotomic splitting-field corollary is a distinct sublayer (character fields and Schur
indices), and it is that sublayer, not Brauer induction alone, that discharges the fact the
[character-theory roadmap](../CharacterTheory/README.md) cites at its Layer 4. Layer 7 (projective
representations, factor sets, the Schur multiplier) consumes Mathlib's degree-`2` group cohomology directly
and is independent of Layers 3–4; only its Clifford-theory obstruction needs Layer 5's inertia group, so it
is placed last, tying the cohomology class back to the Clifford correspondence. The examples are built
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
