# Roadmap: Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras

An **Artin algebra** is an algebra `A` over a commutative Artinian ring `R` that is finitely
generated as an `R`-module. Finite-dimensional algebras over a field are the case `R = k`, but the
class is wider: `ℤ/p²ℤ`, orders reduced modulo a power of `p`, and finite rings are Artin algebras
over rings that are not fields. Auslander-Reiten theory works for this whole class, and the reason
is categorical: the module category of an Artin algebra is a Hom-finite Krull-Schmidt exact
category with an Auslander-Reiten duality, and almost-split sequences exist in every such category.

Mathlib has none of this. It has `CategoryTheory.Indecomposable`, Mathlib's `ShortComplex` and
`Ext`, Artinian rings with their structure theory (`IsArtinianRing`,
`IsArtinianRing.quotNilradicalPowEquivPi`), finite-length modules, projective dimension
(`CategoryTheory.projectiveDimension`) and the notion of Morita equivalence
(`IsMoritaEquivalent`). Tau Ceti already has a substantial layer of the theory over a field, built
for the [quiver representations](../QuiverRepresentations/README.md) roadmap (its Layer 6), and the
general categorical pieces that theory rests on:

- almost-split maps and sequences in an arbitrary category (`TauCeti.IsLeftAlmostSplit`,
  `TauCeti.IsRightAlmostSplit`, `ShortComplex.IsAlmostSplit`), with their uniqueness, minimality and
  completion results (`TauCeti/CategoryTheory/AlmostSplit/`), irreducible morphisms
  (`TauCeti.IsIrreducibleMorphism`), the radical of a preadditive category as a morphism ideal with
  its powers (`TauCeti.jacobsonRadical`, `TauCeti.jacobsonRadicalIdeal`), the identification of
  irreducible morphisms with `rad / rad²`, and the unvalued irreducible-morphism quiver with its
  translation (`TauCeti.IrreducibleMorphismQuiver`, `TauCeti.ARTranslation`);
- the existence half of the Krull-Schmidt theorem for idempotent-complete linear categories over a
  commutative Artinian ring (`TauCeti.exists_isLocalRing_end_sum_comp_eq_id`), Fitting's lemma in
  that setting (`TauCeti.isLocalRing_end_of_indecomposable`), and the full Krull-Schmidt theorem for
  finite-length modules (`TauCeti.exists_indecomposable_iso_biproduct`,
  `TauCeti.exists_equiv_iso_of_iso_biproduct`) and for quiver representations;
- Quillen exact structures (`TauCeti.ExactStructure`), from the
  [Grothendieck groups and Euler forms](../../GrothendieckEulerForms/README.md) roadmap, and relative
  projectives and injectives with the projective and injective stable categories
  (`TauCeti.ExactStructure.ProjectiveStableCategory`,
  `TauCeti.ExactStructure.InjectiveStableCategory`), the material of the
  [stable, periodic and curved categories](../../StablePeriodicCurved/README.md) roadmap;
- the transpose `Tr` over an arbitrary ring and its stable equivalence
  (`TauCeti.AuslanderReitenTranspose`, `stableTransposeEquivalence`), and over a field the translate
  `τ = Hom_k(Tr -, k)` (`TauCeti.AuslanderReitenTranslate`, `ModuleCat.arTranslate`), the
  Auslander-Reiten formula (`auslanderReitenExtEquiv`) and existence of almost-split sequences;
- nilpotence of the radical and the description of all maps by irreducible ones, for
  representation-finite Artin algebras and for Hom-finite linear categories with finitely many
  indecomposable objects;
- Morita theory: a ring is Morita equivalent to the corner `eAe` of a full idempotent
  (`IsIdempotentElem.isMoritaEquivalent_corner`), a semiperfect ring is Morita equivalent to a basic
  one (`TauCeti.IsSemiperfectRing.exists_isBasic_isMoritaEquivalent`), and an equivalence of module
  categories restricts to finitely generated and to finitely generated projective modules
  (`finiteModulesEquivalence`, `finiteProjectiveModulesEquivalence`); Mathlib has the matrix case
  (`IsMoritaEquivalent.matrix`).

What is missing is the theory at its natural generality. There is no notion of a Krull-Schmidt
category and no uniqueness of decompositions beyond modules and quiver representations; no `Ext¹` of
an exact category and no almost-split conflations; no Matlis duality over a commutative Artinian ring
that is not a field; no translate, Auslander-Reiten formula or almost-split sequences for Artin
algebras; no valued Auslander-Reiten quiver; none of the classical finiteness theorems: the
Harada-Sai lemma, Auslander's theorem on components of bounded length, the first Brauer-Thrall
conjecture, and `rad^∞ = 0` for representation-finite algebras; no global or dominant dimension;
no Morita equivalence with the endomorphism ring of a progenerator, and no Morita invariance of
injectives, indecomposables, global or dominant dimension; so no Morita-Tachikawa or Auslander
correspondence.

This roadmap builds them. Its three summits are **existence of almost-split sequences for Artin
algebras**, as the case `mod A` of existence of almost-split conflations in a Hom-finite
Krull-Schmidt exact category with an Auslander-Reiten duality; **Auslander's theorem**: a
connected Artin algebra with a component of the Auslander-Reiten quiver of bounded length is
representation-finite, and that component is the whole quiver; and the **Auslander
correspondence**: representation-finite Artin algebras correspond, up to Morita equivalence, to
Artin algebras of global dimension at most two and dominant dimension at least two, as the case of
an additive generator in the **Morita-Tachikawa correspondence** between generator-cogenerators and
algebras of dominant dimension at least two. Suggested homes in Tau Ceti are
`TauCeti/CategoryTheory/KrullSchmidt/`, `TauCeti/CategoryTheory/Exact/` (for `Ext¹` and almost-split
conflations), `TauCeti/RingTheory/Matlis/`, and `TauCeti/RepresentationTheory/ArtinAlgebra/`.

## Scope boundary

- **[Quiver representations](../QuiverRepresentations/README.md), Layer 6.** That layer develops
  Auslander-Reiten theory for a finite-dimensional algebra over a field, and Tau Ceti main already
  carries much of it: the translate over a field (`TauCeti.AuslanderReitenTranslate`,
  `ModuleCat.arTranslate`), the Auslander-Reiten formula over a field (`auslanderReitenExtEquiv`),
  and existence of almost-split sequences for quiver representations. Layers 2 to 5 here state the
  same theory for Artin algebras, and the general constructions **replace** the field ones: the
  field declarations are redefined as the case `R = k`, with `E_k = k`, and where a definitional
  identification is unavailable they are derived from the general ones through a comparison
  isomorphism. No parallel construction is kept. The arrow counts of Layer 6's `arQuiver k A` are
  recovered from the valued quiver of Layer 4, and the radical bimodule that the quiver roadmap's
  `Suggested.lean` names as the companion target of `arQuiver` is the first item of Layer 4.
- **[Derived and module algebra](../../DerivedModuleAlgebra/README.md), §1.M.2.** That section owns
  Matlis duality over a Noetherian local ring, including existence of the injective hull `E(κ)` of
  the residue field. Layer 1 here consumes it for the local factors of a commutative Artinian ring and
  owns only the passage to Artinian rings that are not local and to Artin algebras.
- **[Grothendieck groups and Euler forms](../../GrothendieckEulerForms/README.md)** owns exact
  structures, conflation-exact functors and the exact Grothendieck group, and
  [stable, periodic and curved categories](../../StablePeriodicCurved/README.md) owns relative
  projectives and injectives, Frobenius exact categories and the stable categories. This roadmap
  consumes both and adds `Ext¹`, almost-split conflations and Auslander-Reiten duality.
- **[Enhanced derived sheaves](../../EnhancedDerivedSheaves/README.md)** bounds projective
  dimensions over regular commutative rings. Layer 6 here owns the global dimension of an arbitrary
  ring and Auslander's theorems about it.
- Outside this roadmap: Auslander-Reiten triangles, Serre functors, derived categories and
  extriangulated categories; tilting and τ-tilting theory; covering theory; modules that are not
  finitely generated, except in the definitions of global dimension and of Morita equivalence; and
  dominant dimension of rings other than Artin algebras, where the terms of the minimal injective
  coresolution are asked to be flat rather than projective (Hoshino). For Artin algebras the two
  conditions agree; for other rings the flat version needs flatness over noncommutative rings,
  which Mathlib does not have (`Module.Flat` is stated over commutative rings).

## Standing conventions

- `R` is a commutative Artinian ring. An **Artin `R`-algebra** is `[Ring A] [Algebra R A]
  [Module.Finite R A]`. Modules are left modules, and `mod A` is `FGModuleCat A`. No statement
  assumes `[IsAlgClosed k]`.
- A category `C` is **Hom-finite over `R`** when it is `R`-linear (`Linear R C`) and every
  `X ⟶ Y` is a finitely generated `R`-module. Where only endomorphisms are used, the hypothesis is
  stated for `X ⟶ X` alone.
- A **Krull-Schmidt category** is a preadditive category with finite biproducts in which every
  object is isomorphic to a finite biproduct of objects with local endomorphism rings. An **additive
  generator** is an object of which every indecomposable object is a direct summand.
- An **exact category** is a Tau Ceti `ExactStructure E` on an additive category; conflations,
  inflations and deflations are Tau Ceti's. The **projective stable category** `E/[P]` is
  `TauCeti.ExactStructure.ProjectiveStableCategory` and the **injective stable category** `E/[I]` is
  `TauCeti.ExactStructure.InjectiveStableCategory`.
- `J(R)` is the Jacobson radical of `R`, `E_R` is an injective hull of `R ⧸ J(R)`, and
  `D_R = Hom_R(-, E_R)` is the **Matlis dual**. For a field, `E_k = k` and `D_k = Hom_k(-, k)`.
- `Ext¹_E(Z, X)` is the group of classes of conflations `X ↪ Y ↠ Z` under the Baer sum. For the
  abelian exact structure on an abelian category it is Mathlib's `CategoryTheory.Abelian.Ext Z X 1`.
- For `Γ = Module.End A M`, multiplication is composition, so `Hom_A(X, M)` is a left `Γ`-module by
  composition after, and `Hom_A(M, X)` is a right `Γ`-module by composition before.
- "Up to Morita equivalence" uses Mathlib's `IsMoritaEquivalent R A B`. Statements about
  isomorphism classes of indecomposable objects use Mathlib's `Skeleton`, as Tau Ceti's
  `IsRepresentationFinite` does.

## The build, in layers

### Layer 0: Krull-Schmidt categories

- **The class.** `IsKrullSchmidt C` for a preadditive category with finite biproducts: every object
  is isomorphic to a finite biproduct of objects with local endomorphism rings. Transport along
  equivalences of categories.
- **Indecomposables.** In a Krull-Schmidt category an object is indecomposable exactly when its
  endomorphism ring is local; the reverse implication holds in every preadditive category with
  binary biproducts and is on main (`TauCeti.indecomposable_of_isLocalRing_end`).
- **Idempotents split.** A Krull-Schmidt category is idempotent complete
  (`CategoryTheory.IsIdempotentComplete`) (Krause).
- **Uniqueness.** If `⨁ i, X i ≅ ⨁ j, Y j` with all `End (X i)` and `End (Y j)` local, there is a
  bijection `σ` of the index types with `X i ≅ Y (σ i)`. The proof is the exchange argument in the
  category, generalizing the module statement `TauCeti.exists_equiv_iso_of_iso_biproduct`.
- **Recognition.** An idempotent-complete category with finite biproducts that is Hom-finite over a
  commutative Artinian ring is Krull-Schmidt. The summand form of the decomposition is on main
  (`TauCeti.exists_isLocalRing_end_sum_comp_eq_id`); idempotent completeness turns it into a
  biproduct decomposition.
- **Closure.** A full subcategory of a Krull-Schmidt category that is closed under isomorphisms,
  finite biproducts and direct summands is Krull-Schmidt.
- **Additive generators.** A Krull-Schmidt category has an additive generator exactly when it has
  finitely many isomorphism classes of indecomposable objects; the sum of one indecomposable from
  each class is one.
- **Instances.** `mod A` for an Artin algebra `A`, finite-length modules over an arbitrary ring, and
  pointwise finite-dimensional representations of a finite quiver are Krull-Schmidt.
- **The radical in a Krull-Schmidt category.** For decompositions `X ≅ ⨁ i, X i` and
  `Y ≅ ⨁ j, Y j` into objects with local endomorphism rings, `f ∈ rad(X, Y)` exactly when no
  component `X i ⟶ Y j` of `f` is an isomorphism (from `TauCeti.mem_jacobsonRadical_iff_not_isIso`
  and the biproduct description of the radical on main).

### Layer 1: Matlis duality over a commutative Artinian ring

- **Local factors.** A commutative Artinian ring is the finite product of the local Artinian rings
  `R ⧸ 𝔪 ^ n` over its maximal ideals `𝔪`, for `n` with `nilradical R ^ n = ⊥`
  (`IsArtinianRing.quotNilradicalPowEquivPi`). Modules over `R` split accordingly.
- **The injective cogenerator.** `E_R`: an injective hull of `R ⧸ J(R)`, assembled from the hulls
  `E(R ⧸ 𝔪)` of the local factors supplied by DerivedModuleAlgebra §1.M.2, with uniqueness from
  `TauCeti.IsInjectiveEnvelope.exists_linearEquiv`. `E_R` has finite length, and every simple
  `R`-module embeds in it.
- **The duality.** `D_R M = M →ₗ[R] E_R` is an exact contravariant `R`-linear functor that preserves
  finite length and composition length, and the evaluation `M → D_R (D_R M)` is an isomorphism for
  every `R`-module of finite length. So `D_R` is an anti-equivalence of the category of finite-length
  `R`-modules with itself.
- **Artin algebras.** For an Artin `R`-algebra `A`, `D_R` exchanges finitely generated left
  `A`-modules and finitely generated right `A`-modules, an anti-equivalence between `mod A` and
  `mod Aᵐᵒᵖ`; it exchanges projectives and injectives, and `D_R A` is an injective cogenerator of
  `mod A`. The **Nakayama functor** `ν = D_R ∘ Hom_A(-, A)` is an equivalence from finitely generated
  projective to finitely generated injective `A`-modules, sending the projective cover of a simple
  module to its injective hull. Every finitely generated `A`-module `M` has a finitely generated
  injective hull, `D_R` of a projective cover of the right module `D_R M`
  (`TauCeti.IsInjectiveEnvelope`), and hence a minimal injective coresolution by finitely generated
  injective modules.

### Layer 2: `Ext¹` and almost-split conflations in exact categories

- **`Ext¹` of an exact category.** `ExactStructure.Ext1 E Z X`: classes of conflations
  `X ↪ Y ↠ Z` up to isomorphism of conflations fixing `X` and `Z`, an abelian group under the Baer
  sum, contravariant in `Z` and covariant in `X` by pullback and pushout, and an `R`-module when the
  category is `R`-linear (Yoneda). The zero class is the class of the split conflation. For the
  abelian exact structure on an abelian category it agrees with Mathlib's
  `CategoryTheory.Abelian.Ext Z X 1`.
- **The long exact sequences.** For a conflation `X ↪ Y ↠ Z` and an object `W`, the sequences
  `0 → Hom(W, X) → Hom(W, Y) → Hom(W, Z) → Ext¹(W, X) → Ext¹(W, Y) → Ext¹(W, Z)` and
  `0 → Hom(Z, W) → Hom(Y, W) → Hom(X, W) → Ext¹(Z, W) → Ext¹(Y, W) → Ext¹(X, W)` are exact.
- **Almost-split conflations.** An almost-split conflation of `E` is a conflation `S` with
  `ShortComplex.IsAlmostSplit S`. In a Krull-Schmidt exact category its end terms are indecomposable,
  and an almost-split conflation ending at a given `Z` is unique up to isomorphism of conflations;
  so is one starting at a given `X`. The **extension-class criterion**: a conflation with
  indecomposable end terms is almost split exactly when its class is nonzero and is killed by
  pushout along every morphism out of its first term that is not a split monomorphism, generalizing
  `CategoryTheory.ShortComplex.ShortExact.isLeftAlmostSplit_f_iff_extClass` from abelian
  categories.
- **Auslander-Reiten duality.** For an exact category that is Hom-finite over `R`, Krull-Schmidt and
  with every `Ext¹` of finite length over `R`, an **Auslander-Reiten duality** is an equivalence
  `τ : E/[P] ≌ E/[I]` together with isomorphisms `Ext¹_E(Z, X) ≅ D_R (E/[I])(X, τ Z)` natural in
  `X` and `Z`.
- **Existence.** For such a category the following are equivalent: (a) there is an almost-split
  conflation ending at every indecomposable object that is not projective, and one starting at every
  indecomposable object that is not injective; (b) there is an Auslander-Reiten duality. In that case
  the almost-split conflation ending at `Z` is `τ Z ↪ Y ↠ Z`, where `τ Z` is the representative with
  no nonzero injective summand, and `τ` is a bijection from the isomorphism classes of
  indecomposable non-projective objects to those of indecomposable non-injective objects. For
  abelian categories this is Lenzing-Zuazua; for exact categories it is Enomoto, *Classifications
  of exact structures and Cohen-Macaulay-finite algebras*, Appendix A, and the exact-category case
  of Iyama-Nakaoka-Palu.

### Layer 3: Auslander-Reiten theory of Artin algebras

- **The translate.** For a finitely generated module `M` over an Artin `R`-algebra, take a minimal
  projective presentation (projective covers exist over Artinian rings,
  `TauCeti.exists_projectiveCover`), its transpose `Tr M`
  (`TauCeti.AuslanderReitenTranspose`), and set `τ M = D_R (Tr M)` and `τ⁻ M = Tr (D_R M)`. Both are
  finitely generated and independent of the presentation up to isomorphism; `τ M = 0` exactly when
  `M` is projective; for indecomposable non-projective `M`, `τ M` is indecomposable and not
  injective, and `τ⁻ (τ M) ≅ M`. Over a field, `TauCeti.AuslanderReitenTranslate` and
  `ModuleCat.arTranslate` are redefined as this construction with `R = k`.
- **The stable equivalence.** `D_R` induces an anti-equivalence between the projective stable
  category of `mod Aᵐᵒᵖ` and the injective stable category of `mod A`. Composed with the transpose
  (`stableTransposeEquivalence`, on main) it gives the equivalence `τ : E/[P] ≌ E/[I]` for the
  abelian exact structure `E` on `mod A`, whose two stable categories are Tau Ceti's
  `ProjectiveStableCategory` and `InjectiveStableCategory`.
- **The Auslander-Reiten formulas.** For finitely generated `M` and `N`, natural isomorphisms
  `Ext¹_A(M, N) ≅ D_R (Hom_A(N, τ M) modulo maps factoring through injectives)` and
  `Ext¹_A(M, N) ≅ D_R (Hom_A(τ⁻ N, M) modulo maps factoring through projectives)`. With the stable
  equivalence above, the first makes `τ` an Auslander-Reiten duality for `mod A`. Over a field this
  is `auslanderReitenExtEquiv`, which becomes the case `R = k`.
- **Almost-split sequences.** For every indecomposable non-projective finitely generated module
  `M` there is an almost-split sequence `0 → τ M → Y → M → 0` in `mod A`, unique up to isomorphism,
  and dually for every indecomposable non-injective module; this is Layer 2's existence theorem
  applied to `mod A`. Over a field the existence theorem of quiver representations Layer 6 becomes
  its case `R = k`.
- **Source and sink maps.** Every indecomposable finitely generated module `M` has a minimal right
  almost-split map `Y → M` (for `M` projective, the inclusion of its radical) and a minimal left
  almost-split map `M → Y'` (for `M` injective, the quotient by its socle). A map `h : X → M` with
  `X ≠ 0` is irreducible exactly when there is `h' : X' → M` such that `(h, h') : X ⊕ X' → M` is
  minimal right almost split.

### Layer 4: the valued Auslander-Reiten quiver

- **Irreducible maps between two indecomposables.** For objects `M` and `N` with local endomorphism
  rings in a preadditive category, `Irr(M, N) = rad(M, N) / rad²(M, N)` is a bimodule over the
  division rings `F_N = End N / rad (End N)` (acting by composition after) and
  `F_M = End M / rad (End M)` (acting by composition before). For indecomposable finitely generated
  modules over an Artin algebra it is finite-dimensional over each, and its two dimensions form the
  **valuation** `(a_{MN}, b_{MN})`, with `a_{MN}` the dimension over `F_N` and `b_{MN}` over `F_M`.
- **Valued translation quivers.** A valued translation quiver: a quiver whose arrows carry pairs of
  positive integers, with a partial injection `τ` on vertices such that for every vertex `z` in the
  domain of `τ` and every vertex `w`, there is an arrow `τ z → w` exactly when there is an arrow
  `w → z`, and the valuation of `τ z → w` is that of `w → z` with the two entries exchanged.
  Forgetting valuations recovers Tau Ceti's `TauCeti.IrreducibleMorphismQuiver` with its
  `TauCeti.ARTranslation`.
- **The valued quiver.** `valuedARQuiver A`: vertices the isomorphism classes of indecomposable
  finitely generated `A`-modules, an arrow `[M] → [N]` exactly when `Irr(M, N) ≠ 0`, labelled by
  its valuation, with `τ` defined exactly on the non-projective vertices.
- **Multiplicities.** In the almost-split sequence `0 → τ Z → Y → Z → 0`, the number of copies of an
  indecomposable `W` among the summands of `Y` equals `b_{WZ}`, and also equals `a_{τZ,W}`.
- **The mesh.** `valuedARQuiver A` is a valued translation quiver.
- **Over a field.** For `A` over a field `k`, `dim_k Irr(M, N) = b_{MN} · dim_k F_M`; this
  recovers the arrow counts of quiver representations Layer 6's `arQuiver k A`. When
  `F_M = F_N = k`, the valuation is `(n, n)` with `n = dim_k Irr(M, N)`.

### Layer 5: finiteness theorems

- **The Harada-Sai lemma.** Let `M₀, …, Mₙ` be indecomposable modules of length at most `b`, and
  `fᵢ : Mᵢ₋₁ ⟶ Mᵢ` non-isomorphisms. If `n ≥ 2 ^ b - 1`, then `fₙ ∘ ⋯ ∘ f₁ = 0`. Consequently, if `A`
  is representation-finite and every indecomposable has length at most `b`, then
  `jacobsonRadicalIdeal (FGModuleCat A) ^ (2 ^ b - 1) = ⊥`, an explicit form of the nilpotence on
  main.
- **Auslander's theorem.** Let `A` be connected (`0` and `1` are its only central idempotents) and
  let `𝒞` be a weakly connected component of `valuedARQuiver A` (Mathlib's
  `Quiver.WeaklyConnectedComponent`). If the lengths of the modules in `𝒞` are bounded, then `𝒞` is
  the whole quiver, and `A` is representation-finite.
- **The first Brauer-Thrall conjecture** (Roiter's theorem). If the lengths of the indecomposable
  finitely generated `A`-modules are bounded, then `A` is representation-finite.
- **The infinite radical.** `rad^∞ = ⨅ n, jacobsonRadicalIdeal (FGModuleCat A) ^ n`. The Artin
  algebra `A` is representation-finite exactly when `rad^∞ = ⊥`.
- **Connectedness.** For a connected representation-finite `A`, `valuedARQuiver A` is weakly
  connected.

### Layer 6: the Morita-Tachikawa and Auslander correspondences

- **Projectivization.** For a finitely generated `A`-module `M` with `Γ = Module.End A M`,
  `Hom_A(M, -)` is an equivalence from `add M` (the direct summands of finite sums of copies of `M`)
  to the finitely generated projective right `Γ`-modules, and `Hom_A(-, M)` is an anti-equivalence
  from `add M` to the finitely generated projective left `Γ`-modules; both send `M` to `Γ`. `Γ` is an
  Artin `R`-algebra, since `M ⟶ M` is finitely generated over `R`.
- **The double centralizer.** If `M` is a generator of `mod A`, the action map
  `A → Module.End Γ M` is a ring isomorphism.
- **Morita theory for Artin algebras.** For a finitely generated projective generator `P` of
  `mod A`, `IsMoritaEquivalent R A (Module.End A P)ᵐᵒᵖ`: `P` is a full corner of a matrix ring over
  `A`, so this follows from Mathlib's `IsMoritaEquivalent.matrix` and Tau Ceti's
  `IsIdempotentElem.isMoritaEquivalent_corner`. A Morita equivalence between Artin `R`-algebras
  restricts to finitely generated and projective modules (`finiteModulesEquivalence`, on main), and
  it also preserves injectives, indecomposables, generator-cogenerators and additive generators; so
  it preserves representation-finiteness, global dimension and dominant dimension.
- **Global dimension of a ring.** For an arbitrary ring `A`, the **left global dimension** is the
  supremum of the projective dimensions (Mathlib's `CategoryTheory.projectiveDimension` in
  `ModuleCat A`) of all left `A`-modules, and the **right global dimension** is the left global
  dimension of `Aᵐᵒᵖ`. Auslander's theorems: the left global dimension is the supremum over the
  cyclic modules `A ⧸ I`; for a left Noetherian ring it is the supremum over the finitely generated
  modules; for a ring that is left and right Noetherian the left and right global dimensions agree;
  and for a semiprimary ring, in particular an Artin algebra, both equal the projective dimension of
  `A ⧸ J(A)`, the supremum over the simple modules. For Artin algebras the global dimension is
  written `gl.dim`.
- **Dominant dimension.** For an Artin algebra `Γ` with minimal injective coresolution
  `0 → Γ → I⁰ → I¹ → ⋯` of the left regular module (Layer 1), `dom.dim Γ ≥ n` when
  `I⁰, …, Iⁿ⁻¹` are projective. For `n = 1`, this says that `Γ` embeds in a projective-injective
  module.
- **The Morita-Tachikawa correspondence.** If `M` is a generator-cogenerator of `mod A` (every
  indecomposable projective and every indecomposable injective is a summand of `M`), then
  `dom.dim (Module.End A M) ≥ 2`, for the left and for the right regular module. Conversely, for an
  Artin algebra `Γ` with `dom.dim Γ ≥ 2`, let `Q` be the sum of the indecomposable
  projective-injective left `Γ`-modules, one of each isomorphism class, and `B = Module.End Γ Q`;
  then `Q` is a generator-cogenerator of `mod B`, and the action map `Γ → Module.End B Q` is a ring
  isomorphism. These constructions are inverse bijections between pairs `(A, M)` with `M` a
  generator-cogenerator of `mod A`, where `(A, M)` and `(A', M')` are identified when an
  equivalence `ModuleCat A ≌ ModuleCat A'` (as in `IsMoritaEquivalent R A A'`) carries `add M` onto
  `add M'`, and Artin algebras of dominant dimension at least two up to `IsMoritaEquivalent`.
- **The Auslander correspondence.** If `M` is an additive generator of `mod A` (Layer 0; it exists
  exactly when `A` is representation-finite), then `Γ = Module.End A M` has global dimension at most
  two, besides `dom.dim Γ ≥ 2`. Conversely, if `gl.dim Γ ≤ 2 ≤ dom.dim Γ`, the generator-cogenerator
  `Q` of the previous item is an additive generator of `mod B`. So the Morita-Tachikawa bijection
  restricts to a bijection between Morita classes of representation-finite Artin algebras and Morita
  classes of **Auslander algebras**, the Artin algebras with `gl.dim Γ ≤ 2 ≤ dom.dim Γ`.

## Worked examples (acceptance criteria)

- **A field.** For `R = A = k`, `E_k = k` and `D_k = Hom_k(-, k)`; `τ` is
  `TauCeti.AuslanderReitenTranslate`, redefined as the case `R = k`.
- **`ℤ/p²ℤ`.** For `A = R = ℤ/p²ℤ`: `E_R = R`; `mod A` is Krull-Schmidt with indecomposables
  `ℤ/pℤ` and `ℤ/p²ℤ`; the sequence `0 → ℤ/pℤ → ℤ/p²ℤ → ℤ/pℤ → 0` is almost split, so
  `τ (ℤ/pℤ) ≅ ℤ/pℤ`; and `valuedARQuiver A` has the two arrows `[ℤ/pℤ] → [ℤ/p²ℤ]` and
  `[ℤ/p²ℤ] → [ℤ/pℤ]`, both of valuation `(1, 1)`.
- **A valuation that is not symmetric.** For the `ℝ`-algebra of upper triangular `2 × 2` matrices
  with diagonal entries in `ℝ` and `ℂ` and corner entry in `ℂ`, `valuedARQuiver A` has an arrow
  whose valuation is not of the form `(n, n)`.
- **The Kronecker algebra.** Over a field, the indecomposables of the Kronecker algebra have
  unbounded length; consistently with Layer 5, it is not representation-finite and `rad^∞ ≠ ⊥`.
- **Auslander algebras.** For `A = k[x]/(x²)` and `M = A ⊕ k`, `Module.End A M` is
  five-dimensional over `k`, with global dimension two and dominant dimension at least two. For
  `A = ℤ/p²ℤ` and `M = ℤ/p²ℤ ⊕ ℤ/pℤ`, `Module.End A M` likewise has global dimension two and dominant
  dimension at least two. For a semisimple `A`, every additive generator has a semisimple
  endomorphism ring, of global dimension zero.

## Ordering

Layer 0 and Layer 1 are independent. Layer 2 needs Layer 0 for Krull-Schmidt and Layer 1 for
`D_R`. Layer 3 needs Layers 1 and 2. Layer 4 needs Layers 0 and 3. Layer 5 needs Layers 3 and 4; its
Harada-Sai lemma needs only Layer 0. Layer 6 needs Layer 0 for additive generators and Layer 1 for
injective hulls and projective-injectives.

## References

- I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of Associative
  Algebras*, Vol. 1, London Mathematical Society Student Texts 65, Cambridge University Press
  (2006): Chapter IV, with the Auslander-Reiten formulas over a field in Theorem IV.2.13.
- M. Auslander, *On the dimension of modules and algebras III. Global dimension*, Nagoya Math. J.
  9 (1955), 67–77: global dimension from cyclic modules, left and right global dimension of
  Noetherian and semiprimary rings.
- M. Auslander, *Representation dimension of Artin algebras*, Queen Mary College Mathematics
  Notes, London (1971): the Auslander correspondence.
- M. Auslander, *Representation theory of Artin algebras II*, Comm. Algebra 1 (1974), 269–310:
  `rad^∞` and representation-finiteness, components of bounded length.
- M. Auslander, I. Reiten, S. O. Smalø, *Representation Theory of Artin Algebras*, Cambridge
  Studies in Advanced Mathematics 36, Cambridge University Press (1995): Chapter II (Artin algebras,
  projectivization and duality), Chapter IV (the transpose and the dual, with the defect formula in
  Section IV.4), Chapter V (almost-split sequences and irreducible morphisms), Chapter VI (the
  Harada-Sai lemma, Auslander's theorem, and Auslander algebras in Section VI.5), Chapter VII (the
  Auslander-Reiten quiver and translation quivers).
- H. Enomoto, *Classifications of exact structures and Cohen-Macaulay-finite algebras*, Adv. Math.
  335 (2018), 838–877, arXiv:1705.02163: Appendix A, Auslander-Reiten theory of exact categories.
- M. Harada, Y. Sai, *On categories of indecomposable modules I*, Osaka J. Math. 7 (1970),
  323–344.
- M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280:
  dominant dimension of arbitrary rings through flat injective modules, and its left-right symmetry
  for Noetherian rings.
- O. Iyama, H. Nakaoka, Y. Palu, *Auslander-Reiten theory in extriangulated categories*,
  arXiv:1805.03776: existence of almost-split conflations from an Auslander-Reiten duality, here in
  its exact-category case.
- H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015), 535–549.
- H. Lenzing, R. Zuazua, *Auslander-Reiten duality for abelian categories*, Bol. Soc. Mat. Mexicana
  (3) 10 (2004), 169–177.
- E. Matlis, *Injective modules over Noetherian rings*, Pacific J. Math. 8 (1958), 511–528.
- B. J. Müller, *The classification of algebras by dominant dimension*, Canad. J. Math. 20 (1968),
  398–409: dominant dimension and the Morita-Tachikawa correspondence.
- A. V. Roiter, *Unboundedness of the dimensions of the indecomposable representations of an algebra
  which has infinitely many indecomposable representations*, Izv. Akad. Nauk SSSR Ser. Mat. 32
  (1968), 1275–1282.
- H. Tachikawa, *Quasi-Frobenius Rings and Generalizations*, Lecture Notes in Mathematics 351,
  Springer (1973): dominant dimension and the Morita-Tachikawa correspondence.
- N. Yoneda, *On Ext and exact sequences*, J. Fac. Sci. Univ. Tokyo Sect. I 8 (1960), 507–576:
  `Ext¹` by classes of extensions in an exact category.
