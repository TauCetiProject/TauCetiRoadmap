# Roadmap: Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras

An **Artin algebra** is an algebra `A` over a commutative Artinian ring `R` that is finitely
generated as an `R`-module. Finite-dimensional algebras over a field are the case `R = k`, but the
class is wider: `ℤ/p²ℤ`, orders reduced modulo a power of `p`, and finite rings are Artin algebras
over rings that are not fields. Auslander-Reiten theory works for this whole class, and the reason
is categorical: the module category of an Artin algebra is a Hom-finite Krull-Schmidt exact
category with an Auslander-Reiten duality, and almost-split sequences exist in every such category.
Auslander's functorial viewpoint makes the same theory visible in the category of finitely
presented functors, where almost-split sequences are minimal projective resolutions of simple
functors.

Mathlib has none of this. It has `CategoryTheory.Indecomposable`, Mathlib's `ShortComplex` and
`Ext`, weak kernels (`CategoryTheory.Limits.HasWeakKernels`), the preadditive Yoneda embedding
(`CategoryTheory.preadditiveYoneda`), Artinian rings with their structure theory
(`IsArtinianRing`, `IsArtinianRing.quotNilradicalPowEquivPi`), finite-length modules, projective
dimension (`CategoryTheory.projectiveDimension`) and the notion of Morita equivalence
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
  (`TauCeti.AuslanderReitenTranspose`, `TauCeti.stableTransposeEquivalence`), and over a field the translate
  `τ = Hom_k(Tr -, k)` (`TauCeti.AuslanderReitenTranslate`, `ModuleCat.arTranslate`), the
  Auslander-Reiten formula (`LinearMap.auslanderReitenExtEquiv`) and existence of almost-split sequences;
- nilpotence of the radical and the description of all maps by irreducible ones, for
  representation-finite Artin algebras and for Hom-finite linear categories with finitely many
  indecomposable objects;
- Morita theory: a ring is Morita equivalent to the corner `eAe` of a full idempotent
  (`IsIdempotentElem.isMoritaEquivalent_corner`), a semiperfect ring is Morita equivalent to a basic
  one (`TauCeti.IsSemiperfectRing.exists_isBasic_isMoritaEquivalent`), and an equivalence of module
  categories restricts to finitely generated and to finitely generated projective modules
  (`CategoryTheory.Equivalence.finiteModulesEquivalence`, `CategoryTheory.Equivalence.finiteProjectiveModulesEquivalence`); Mathlib has the matrix case
  (`IsMoritaEquivalent.matrix`).

What is missing is the theory at its natural generality. There is no notion of a Krull-Schmidt
category and no uniqueness of decompositions beyond modules and quiver representations; no
category of finitely presented functors, so no Freyd-Auslander criterion and no functorial picture
of almost-split sequences; no `Ext¹` of an exact category and no almost-split conflations; no Matlis
duality over a commutative Artinian ring that is not a field; no translate, Auslander-Reiten
formula or almost-split sequences for Artin algebras; no valued Auslander-Reiten quiver; none of
the classical finiteness theorems: the Harada-Sai lemma, Auslander's theorem on components of
bounded length, the first Brauer-Thrall conjecture, and `rad^∞ = 0` for representation-finite
algebras; no global or dominant dimension; no Morita equivalence with the endomorphism ring of a
progenerator, and no Morita invariance of injectives, indecomposables, global or dominant
dimension; so no Morita-Tachikawa or Auslander correspondence.

This roadmap builds them. Its three summits are **existence of almost-split sequences for Artin
algebras**, as the case `mod A` of existence of almost-split conflations in a Hom-finite
Krull-Schmidt exact category with an Auslander-Reiten duality; **Auslander's theorem**: a
connected Artin algebra with a component of the Auslander-Reiten quiver of bounded length is
representation-finite, and that component is the whole quiver; and the **Auslander
correspondence**: representation-finite Artin algebras correspond, up to Morita equivalence, to
Artin algebras of global dimension at most two and dominant dimension at least two, as the case of
an additive generator in the **Morita-Tachikawa correspondence** between generator-cogenerators and
algebras of dominant dimension at least two. Suggested homes in Tau Ceti are
`TauCeti/CategoryTheory/KrullSchmidt/`, `TauCeti/CategoryTheory/FinitelyPresentedFunctor/`,
`TauCeti/CategoryTheory/Exact/` (for `Ext¹` and almost-split conflations),
`TauCeti/RingTheory/Matlis/`, and `TauCeti/RepresentationTheory/ArtinAlgebra/`.

## Scope boundary

- **[Quiver representations](../QuiverRepresentations/README.md), Layer 6.** That layer develops
  Auslander-Reiten theory for a finite-dimensional algebra over a field, and Tau Ceti main already
  carries much of it: the translate over a field (`TauCeti.AuslanderReitenTranslate`,
  `ModuleCat.arTranslate`), the Auslander-Reiten formula over a field (`LinearMap.auslanderReitenExtEquiv`),
  and existence of almost-split sequences for quiver representations. Layers 3 to 6 here state the
  same theory for Artin algebras, and the general constructions **replace** the field ones: the
  field declarations are redefined as the case `R = k`, with `E_k = k`, and where a definitional
  identification is unavailable they are derived from the general ones through a comparison
  isomorphism. No parallel construction is kept. The arrow counts of Layer 6's `arQuiver k A` are
  recovered from the valued quiver of Layer 5 here, and the radical bimodule that the quiver
  roadmap's `Suggested.lean` names as the companion target of `arQuiver` is the first item of that
  layer.
- **[Derived and module algebra](../../DerivedModuleAlgebra/README.md), §1.M.2.** That section owns
  Matlis duality over a Noetherian local ring, including existence of the injective hull `E(κ)` of
  the residue field. Layer 2 here consumes it for the local factors of a commutative Artinian ring and
  owns only the passage to Artinian rings that are not local and to Artin algebras.
- **[Grothendieck groups and Euler forms](../../GrothendieckEulerForms/README.md)** owns exact
  structures, conflation-exact functors and the exact Grothendieck group, and
  [stable, periodic and curved categories](../../StablePeriodicCurved/README.md) owns relative
  projectives and injectives, Frobenius exact categories and the stable categories. This roadmap
  consumes both and adds `Ext¹`, almost-split conflations and Auslander-Reiten duality, together
  with the Ext-trivial morphism ideals that Auslander-Reiten duality needs for exact categories
  without enough projectives or injectives (Layer 3), compared there with those stable categories.
- **[Enhanced derived sheaves](../../EnhancedDerivedSheaves/README.md)** bounds projective
  dimensions over regular commutative rings. Layer 7 here owns the global dimension of an arbitrary
  ring and Auslander's theorems about it.
- Outside this roadmap: Auslander-Reiten triangles, Serre functors, derived categories and
  extriangulated categories; tilting and τ-tilting theory; covering theory; modules that are not
  finitely generated, except in the definitions of global dimension and of Morita equivalence;
  a theory of functors that are not finitely presented (the category of all additive functors
  appears only as the ambient category of `mod C`, of the simple functors `S_Z` and of the radical
  functors `rad(-, Z)`), Grothendieck
  categories, purity, the defect formula
  and Auslander's formula, Krull-Gabriel dimension, and the description of whole components of the
  Auslander-Reiten quiver through functors; coherent rings as a ring-theoretic notion (they enter
  only through the Freyd-Auslander criterion of Layer 1); and dominant dimension of rings other than
  Artin algebras, where the terms of the minimal injective coresolution are asked to be flat rather
  than projective (Hoshino). For Artin algebras the two conditions agree; for other rings the flat
  version needs flatness over noncommutative rings, which Mathlib does not have (`Module.Flat` is
  stated over commutative rings).

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
- For an additive category `C`, a **finitely presented functor** is an additive functor
  `F : Cᵒᵖ ⥤ AddCommGrpCat` with an exact sequence `(-, X) → (-, Y) → F → 0` of representable
  functors (`preadditiveYoneda`); `mod C` is the full subcategory they form. For `X` with local
  endomorphism ring, `S_X = (-, X) / rad(-, X)` is the **simple functor** at `X`.
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
- **Morita equivalence** of Artin algebras means an `R`-linear equivalence `mod A ≌ mod B`; Layer 7
  identifies it with Mathlib's `IsMoritaEquivalent R A B`. Statements about isomorphism classes of
  indecomposable objects use Mathlib's `Skeleton`, as Tau Ceti's `IsRepresentationFinite` does.

## The build, in layers

### Layer 0: Krull-Schmidt categories

- **The class.** `IsKrullSchmidt C` for a preadditive category with finite biproducts: every object
  is isomorphic to a finite biproduct of objects with local endomorphism rings. Transport along
  equivalences of categories.
- **Indecomposables.** In a Krull-Schmidt category an object is indecomposable exactly when its
  endomorphism ring is local; the reverse implication holds in every preadditive category with
  binary biproducts and is in Tau Ceti (`TauCeti.indecomposable_of_isLocalRing_end`).
- **Idempotents split.** A Krull-Schmidt category is idempotent complete
  (`CategoryTheory.IsIdempotentComplete`) (Krause).
- **Uniqueness.** If `⨁ i, X i ≅ ⨁ j, Y j` with all `End (X i)` and `End (Y j)` local, there is a
  bijection `σ` of the index types with `X i ≅ Y (σ i)`. The proof is the exchange argument in the
  category, generalizing the module statement `TauCeti.exists_equiv_iso_of_iso_biproduct`.
- **Recognition.** An idempotent-complete category with finite biproducts that is Hom-finite over a
  commutative Artinian ring is Krull-Schmidt. The summand form of the decomposition is in Tau Ceti
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
  and the biproduct description of the radical in Tau Ceti).

### Layer 1: finitely presented functors

- **The category `mod C`.** For an additive category `C`, `mod C` is closed under cokernels and
  extensions in the category of additive functors `Cᵒᵖ ⥤ AddCommGrpCat`; the representable functors
  `(-, X)` are projective in it, and every object has a presentation by representables (Yoneda).
- **The Freyd-Auslander criterion.** `mod C` is abelian, with kernels computed in the functor
  category, exactly when `C` has weak kernels (`HasWeakKernels C`). Abelian categories have weak
  kernels, and so do pretriangulated ones (Mathlib).
- **Rings.** For a ring `A` and the category `proj A` of finitely generated projective `A`-modules,
  evaluation at `A` identifies `mod (proj A)` with the finitely presented `A`-modules. So the
  finitely presented `A`-modules form an abelian category exactly when `proj A` has weak kernels,
  which the classical literature calls left coherence of `A` (Chase); left Noetherian rings are the
  main example, and there the finitely presented modules are the finitely generated ones.
- **Abelian categories with enough projectives.** For an abelian category `C` with enough
  projectives, restriction to the projectives is an equivalence `C ≌ mod (proj C)`. When `C` has a
  **progenerator** `P` (a projective object of which every object is a quotient of a finite sum of
  copies), `proj C = add P`, and `Hom(P, -)` is an equivalence from `C` to the finitely presented
  right `End P`-modules. In particular every abelian category with a progenerator is the category of
  finitely presented modules over a ring.
- **Projective dimension at most two.** For an idempotent-complete additive category `C` with weak
  kernels, every object of `mod C` has projective dimension at most two exactly when `C` has
  kernels. If `g : Y → Z` has a kernel `X`, the presentation `(-, Y) → (-, Z) → F → 0`
  extends to an exact sequence `0 → (-, X) → (-, Y) → (-, Z) → F → 0`; conversely the kernel of
  `(-, Y) → (-, Z)` is then projective, hence representable because idempotents split, and
  represents a kernel of `g`. In particular this holds for every abelian category `C`.
- **Projective covers.** A **projective cover** of a finitely generated additive functor `F`,
  that is, a quotient of a representable functor, is an epimorphism `p : (-, P) → F` that is right
  minimal: every endomorphism `φ` of `P` with `(-, φ) ≫ p = p` is an isomorphism. The definition is
  stated in the category of additive functors, so it needs no abelian structure on `mod C` and
  applies to finitely generated functors that are not finitely presented. If `C` is
  Krull-Schmidt, every finitely presented functor has a projective cover, as for finitely generated
  modules over a ring whose finitely generated projective modules form a Krull-Schmidt category
  (Krause); for `X` with local endomorphism ring, `(-, X) → S_X` is a projective cover whenever
  `S_X` is finitely presented.

### Layer 2: Matlis duality over a commutative Artinian ring

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

### Layer 3: `Ext¹` and almost-split conflations in exact categories

- **`Ext¹` of an exact category.** `ExactStructure.Ext1 E Z X`: classes of conflations
  `X ↪ Y ↠ Z` up to isomorphism of conflations fixing `X` and `Z`, an abelian group under the Baer
  sum, contravariant in `Z` and covariant in `X` by pullback and pushout, and an `R`-module when the
  category is `R`-linear (Yoneda). The zero class is the class of the split conflation. For the
  abelian exact structure on an abelian category it agrees with Mathlib's
  `CategoryTheory.Abelian.Ext Z X 1`. The comparison of the Baer sum with addition of Mathlib's
  `extClass` in an abelian category with `HasExt` is the generic one specified in
  [geometric representation categories](../../GeometricRepresentationCategories/README.md), §R5.2;
  it is reused here, and only the exact-category `Ext¹` and its comparison with it are new.
- **The long exact sequences.** For a conflation `X ↪ Y ↠ Z` and an object `W`, the sequences
  `0 → Hom(W, X) → Hom(W, Y) → Hom(W, Z) → Ext¹(W, X) → Ext¹(W, Y) → Ext¹(W, Z)` and
  `0 → Hom(Z, W) → Hom(Y, W) → Hom(X, W) → Ext¹(Z, W) → Ext¹(Y, W) → Ext¹(X, W)` are exact.
- **Ext-trivial ideals.** The **projectively trivial** morphisms `𝒫_E(X, Y)` are the `f : X → Y`
  with `Ext¹_E(f, W) = 0 : Ext¹_E(Y, W) → Ext¹_E(X, W)` for every `W`, and the **injectively
  trivial** morphisms `ℐ_E(X, Y)` are the `f` with `Ext¹_E(W, f) = 0` for every `W`. Both are
  morphism ideals (`TauCeti.MorphismIdeal`), with quotients `E/𝒫` and `E/ℐ`. A morphism factoring
  through a relative projective object lies in `𝒫_E`, and `𝒫_E` is exactly the ideal of such
  morphisms when `E` has enough relative projectives, so that `E/𝒫` is then
  `TauCeti.ExactStructure.ProjectiveStableCategory`; dually, `ℐ_E` contains the morphisms factoring
  through relative injectives, with equality and `E/ℐ` the `InjectiveStableCategory` when `E` has
  enough relative injectives. Without these hypotheses the inclusions can be strict, and
  Auslander-Reiten duality must be stated with the Ext-trivial quotients (Iyama-Nakaoka-Palu,
  Definition 1.21 and Remark 1.22; Enomoto, Appendix A.2).
- **Almost-split conflations.** An almost-split conflation of `E` is a conflation `S` with
  `ShortComplex.IsAlmostSplit S`. In a Krull-Schmidt exact category its end terms are indecomposable,
  and an almost-split conflation ending at a given `Z` is unique up to isomorphism of conflations;
  so is one starting at a given `X`. The **extension-class criterion**: a conflation with
  indecomposable end terms is almost split exactly when its class is nonzero and is killed by
  pushout along every morphism out of its first term that is not a split monomorphism, generalizing
  `CategoryTheory.ShortComplex.ShortExact.isLeftAlmostSplit_f_iff_extClass` from abelian
  categories.
- **The functorial picture.** Let `E` be a Krull-Schmidt exact category and `Z` indecomposable. A
  morphism `g : Y → Z` is right almost split exactly when the image of `(-, g) : (-, Y) → (-, Z)` is
  `rad(-, Z)`, so that `(-, Y) → (-, Z) → S_Z → 0` is a projective presentation of the simple functor
  `S_Z`, and `g` is minimal right almost split exactly when the corestriction
  `(-, Y) ↠ rad(-, Z)` is a projective cover in the sense of Layer 1; `(-, Z) ↠ S_Z` is always one.
  The functor `rad(-, Z)` is finitely generated when `S_Z` is finitely presented, but it need not be
  finitely presented when `E` lacks weak kernels, which is why Layer 1 defines covers of finitely
  generated functors. So `Z` is the end of a right almost-split
  morphism exactly when `S_Z` is finitely presented, and a finitely presented functor is simple in
  the category of additive functors exactly when it is `S_Z` for an indecomposable `Z` with `S_Z`
  finitely presented. A conflation `X ↪ Y ↠ Z` with `Z`
  non-projective is almost split exactly when `0 → (-, X) → (-, Y) → (-, Z) → S_Z → 0` is a minimal
  projective resolution of `S_Z`, that is, `(-, Y) ↠ rad(-, Z)` is a projective cover; the sequence
  is exact because `Hom(W, -)` is left exact on conflations.
- **Auslander-Reiten duality.** For an exact category that is Hom-finite over `R`, Krull-Schmidt and
  with every `Ext¹` of finite length over `R`, an **Auslander-Reiten duality** is an equivalence
  `τ : E/𝒫 ≌ E/ℐ` of the Ext-trivial quotients together with isomorphisms
  `Ext¹_E(Z, X) ≅ D_R (E/ℐ)(X, τ Z)` natural in
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

### Layer 4: Auslander-Reiten theory of Artin algebras

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
  (`TauCeti.stableTransposeEquivalence`) it gives the equivalence `τ : E/[P] ≌ E/[I]` for the
  abelian exact structure `E` on `mod A`, whose two stable categories are Tau Ceti's
  `ProjectiveStableCategory` and `InjectiveStableCategory`.
- **The Auslander-Reiten formulas.** For finitely generated `M` and `N`, natural isomorphisms
  `Ext¹_A(M, N) ≅ D_R (Hom_A(N, τ M) modulo maps factoring through injectives)` and
  `Ext¹_A(M, N) ≅ D_R (Hom_A(τ⁻ N, M) modulo maps factoring through projectives)`. With the stable
  equivalence above, the first makes `τ` an Auslander-Reiten duality for `mod A`: since `mod A` has
  enough projectives and injectives, its Ext-trivial quotients `E/𝒫` and `E/ℐ` are these two stable
  categories (Layer 3). Over a field this
  is `LinearMap.auslanderReitenExtEquiv`, which becomes the case `R = k`.
- **Almost-split sequences.** For every indecomposable non-projective finitely generated module
  `M` there is an almost-split sequence `0 → τ M → Y → M → 0` in `mod A`, unique up to isomorphism,
  and dually for every indecomposable non-injective module; this is Layer 3's existence theorem
  applied to `mod A`. Equivalently, every simple contravariant functor on `mod A` is finitely
  presented, and dually every simple covariant functor is. Over a
  field the existence theorem of quiver representations Layer 6 becomes its case `R = k`.
- **Source and sink maps.** Every indecomposable finitely generated module `M` has a minimal right
  almost-split map `Y → M` (for `M` projective, the inclusion of its radical) and a minimal left
  almost-split map `M → Y'` (for `M` injective, the quotient by its socle). A map `h : X → M` with
  `X ≠ 0` is irreducible exactly when there is `h' : X' → M` such that `(h, h') : X ⊕ X' → M` is
  minimal right almost split.

### Layer 5: the valued Auslander-Reiten quiver

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
  Over a field, Tau Ceti's `TauCeti.IrreducibleMorphismQuiver`, whose arrows `[M] → [N]` are a
  `k`-basis of `Irr(M, N)`, has the same vertices and, with `TauCeti.ARTranslation`, the same
  translation; its arrow counts are `dim_k Irr(M, N)`, computed from the valuations below.
- **The valued quiver.** `valuedARQuiver A`: vertices the isomorphism classes of indecomposable
  finitely generated `A`-modules, an arrow `[M] → [N]` exactly when `Irr(M, N) ≠ 0`, labelled by
  its valuation, with `τ` defined exactly on the non-projective vertices.
- **Multiplicities.** In the almost-split sequence `0 → τ Z → Y → Z → 0`, the number of copies of an
  indecomposable `W` among the summands of `Y` equals `b_{WZ}`, and also equals `a_{τZ,W}`.
- **The mesh.** `valuedARQuiver A` is a valued translation quiver.
- **Over a field.** For `A` over a field `k`, `dim_k Irr(M, N) = b_{MN} · dim_k F_M`; this
  recovers the arrow counts of quiver representations Layer 6's `arQuiver k A`. When
  `F_M = F_N = k`, the valuation is `(n, n)` with `n = dim_k Irr(M, N)`.

### Layer 6: finiteness theorems

- **The Harada-Sai lemma.** Let `M₀, …, Mₙ` be indecomposable modules of length at most `b`, and
  `fᵢ : Mᵢ₋₁ ⟶ Mᵢ` non-isomorphisms. If `n ≥ 2 ^ b - 1`, then `fₙ ∘ ⋯ ∘ f₁ = 0`. Consequently, if `A`
  is representation-finite and every indecomposable has length at most `b`, then
  `jacobsonRadicalIdeal (FGModuleCat A) ^ (2 ^ b - 1) = ⊥`, an explicit form of the nilpotence
  already in Tau Ceti.
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

### Layer 7: Morita theory, global and dominant dimension, and the correspondences

- **Projectivization.** For a finitely generated `A`-module `M` with `Γ = Module.End A M`, the
  functor `Hom_A(M, -)` is an equivalence from `add M` (the direct summands of finite sums of copies
  of `M`) to the finitely generated projective right `Γ`-modules, and `Hom_A(-, M)` is an
  anti-equivalence from `add M` to the finitely generated projective left `Γ`-modules; both send `M`
  to `Γ`. With Layer 1, `mod (add M)` is the category of finitely presented right `Γ`-modules. `Γ` is
  an Artin `R`-algebra, since `M ⟶ M` is finitely generated over `R`; the `R`-algebra structure on
  `Γ` and the `R`-linear structure on `mod A` are Mathlib's scoped `ModuleCat.Algebra` instances.
- **The double centralizer.** If `M` is a generator of `mod A`, the action map
  `A → Module.End Γ M` is a ring isomorphism.
- **Morita theory for Artin algebras.** For a finitely generated projective generator `P` of
  `mod A`, Layer 1 gives `mod A ≌` the finitely presented right `Module.End A P`-modules. The same
  presentation argument with arbitrary direct sums gives
  `IsMoritaEquivalent R A (Module.End A P)ᵐᵒᵖ`; it also follows from Mathlib's
  `IsMoritaEquivalent.matrix` and Tau Ceti's `IsIdempotentElem.isMoritaEquivalent_corner`, since
  `(Module.End A P)ᵐᵒᵖ ≅ e Matₙ(A) e` for a full idempotent `e` of a matrix ring `Matₙ(A)`. Hence an
  `R`-linear equivalence `mod A ≌ mod B` exists exactly when `IsMoritaEquivalent R A B`: one
  direction restricts the equivalence of module categories
  (`CategoryTheory.Equivalence.finiteModulesEquivalence`, which is additive) and shows the
  restriction is `R`-linear. A Morita equivalence of Artin algebras preserves projectives,
  injectives, projective-injectives, indecomposables, minimal injective coresolutions,
  generator-cogenerators and additive generators; so it preserves representation-finiteness, global
  dimension and dominant dimension.
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
  `0 → Γ → I⁰ → I¹ → ⋯` of the left regular module (Layer 2), `dom.dim Γ ≥ n` when
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
  `R`-linear equivalence `mod A ≌ mod A'` carries `add M` onto `add M'`, and Artin algebras of
  dominant dimension at least two up to Morita equivalence.
- **The Auslander correspondence.** If `M` is an additive generator of `mod A` (Layer 0; it exists
  exactly when `A` is representation-finite), then `add M = mod A`, so the finitely presented right
  `Γ`-modules form `mod (mod A)` and have projective dimension at most two (Layer 1); so the right
  global dimension of `Γ = Module.End A M` is at most two, and so is its left global dimension, by
  the agreement of left and right global dimension for Noetherian rings. Besides,
  `dom.dim Γ ≥ 2`. Conversely, if
  `gl.dim Γ ≤ 2 ≤ dom.dim Γ`, the generator-cogenerator `Q` of the previous item is an additive
  generator of `mod B`. So the Morita-Tachikawa bijection restricts to a bijection between Morita
  classes of representation-finite Artin algebras and Morita classes of **Auslander algebras**, the
  Artin algebras with `gl.dim Γ ≤ 2 ≤ dom.dim Γ`.

## Worked examples (acceptance criteria)

- **A field.** For `R = A = k`, `E_k = k` and `D_k = Hom_k(-, k)`; `τ` is
  `TauCeti.AuslanderReitenTranslate`, redefined as the case `R = k`.
- **`ℤ/p²ℤ`.** For `A = R = ℤ/p²ℤ`: `E_R = R`; `mod A` is Krull-Schmidt with indecomposables
  `ℤ/pℤ` and `ℤ/p²ℤ`; the sequence `0 → ℤ/pℤ → ℤ/p²ℤ → ℤ/pℤ → 0` is almost split, so
  `τ (ℤ/pℤ) ≅ ℤ/pℤ`, and it is the minimal projective resolution of the simple functor at `ℤ/pℤ`;
  and `valuedARQuiver A` has the two arrows `[ℤ/pℤ] → [ℤ/p²ℤ]` and `[ℤ/p²ℤ] → [ℤ/pℤ]`, both of
  valuation `(1, 1)`.
- **A valuation that is not symmetric.** For the `ℝ`-algebra of upper triangular `2 × 2` matrices
  with diagonal entries in `ℝ` and `ℂ` and corner entry in `ℂ`, `valuedARQuiver A` has an arrow
  whose valuation is not of the form `(n, n)`.
- **The Kronecker algebra.** Over a field, the indecomposables of the Kronecker algebra have
  unbounded length; consistently with Layer 6, it is not representation-finite and `rad^∞ ≠ ⊥`.
- **Weak kernels.** The category of finitely generated free modules over a Noetherian ring has
  weak kernels, so its `mod` is abelian; for `C = mod A` with `A` an Artin algebra, `mod C` is abelian
  of global dimension at most two.
- **Auslander algebras.** For `A = k[x]/(x²)` and `M = A ⊕ k`, `Module.End A M` is
  five-dimensional over `k`, with global dimension two and dominant dimension at least two. For
  `A = ℤ/p²ℤ` and `M = ℤ/p²ℤ ⊕ ℤ/pℤ`, `Module.End A M` likewise has global dimension two and dominant
  dimension at least two. For a nonzero semisimple `A`, every additive generator has a semisimple
  endomorphism ring, of global dimension zero; the zero algebra has global dimension `⊥`, since
  Mathlib assigns projective dimension `⊥` to a zero object.

## Ordering

Layers 0, 1 and 2 are independent, except that the projective covers of Layer 1 use Layer 0.
Layer 3 needs Layer 0 for Krull-Schmidt, Layer 1 for the functorial picture and Layer 2 for `D_R`.
Layer 4 needs Layers 2 and 3. Layer 5 needs Layers 0 and 4. Layer 6 needs Layers 4 and 5; its
Harada-Sai lemma needs only Layer 0. Layer 7 needs Layer 0 for additive generators, Layer 1 for
projectivization, progenerators and the bound on projective dimension, and Layer 2 for injective
hulls and projective-injectives.

## References

- I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of Associative
  Algebras*, Vol. 1, London Mathematical Society Student Texts 65, Cambridge University Press
  (2006): Chapter IV, with the Auslander-Reiten formulas over a field in Theorem IV.2.13.
- M. Auslander, *Coherent functors*, Proceedings of the Conference on Categorical Algebra (La
  Jolla, 1965), Springer (1966), 189–231: finitely presented functors and the criterion for
  `mod C` to be abelian.
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
- S. U. Chase, *Direct products of modules*, Trans. Amer. Math. Soc. 97 (1960), 457–473: coherent
  rings.
- H. Enomoto, *Classifications of exact structures and Cohen-Macaulay-finite algebras*, Adv. Math.
  335 (2018), 838–877, arXiv:1705.02163: Appendix A, Auslander-Reiten theory of exact categories.
- P. Freyd, *Representations in abelian categories*, Proceedings of the Conference on Categorical
  Algebra (La Jolla, 1965), Springer (1966), 95–120: finitely presented functors and weak kernels.
- M. Harada, Y. Sai, *On categories of indecomposable modules I*, Osaka J. Math. 7 (1970),
  323–344.
- M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280:
  dominant dimension of arbitrary rings through flat injective modules, and its left-right symmetry
  for Noetherian rings.
- O. Iyama, H. Nakaoka, Y. Palu, *Auslander-Reiten theory in extriangulated categories*,
  arXiv:1805.03776: existence of almost-split conflations from an Auslander-Reiten duality, here in
  its exact-category case.
- H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015), 535–549,
  arXiv:1410.2822: Krull-Schmidt categories through projective covers, and the characterization by
  split idempotents and semiperfect endomorphism rings.
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
