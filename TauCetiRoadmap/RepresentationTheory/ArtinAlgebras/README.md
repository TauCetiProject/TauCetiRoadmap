# Roadmap: Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras

An **Artin algebra** is an algebra `A` over a commutative Artinian ring `R` that is finitely
generated as an `R`-module. Finite-dimensional algebras over a field are the case `R = k`, but the
class is wider: `ℤ/p²ℤ`, orders reduced modulo a power of `p`, and finite rings are Artin algebras
over rings that are not fields. Auslander-Reiten theory works for this whole class, and the reason
is categorical: the module category of an Artin algebra is a Hom-finite Krull-Schmidt exact
category with an Auslander-Reiten duality, and almost-split sequences exist in every such category.

Mathlib has none of this. It has `CategoryTheory.Indecomposable`, Mathlib's `ShortComplex` and
`Ext`, Artinian rings with their structure theory (`IsArtinianRing`,
`IsArtinianRing.quotNilradicalPowEquivPi`), and finite-length modules. Tau Ceti already has a
substantial layer of the theory over a field, built for the
[quiver representations](../QuiverRepresentations/README.md) roadmap (its Layer 6), and the general
categorical pieces that theory rests on:

- almost-split maps and sequences in an arbitrary category (`TauCeti.IsLeftAlmostSplit`,
  `TauCeti.IsRightAlmostSplit`, `ShortComplex.IsAlmostSplit`), irreducible morphisms
  (`TauCeti.IsIrreducibleMorphism`), the radical of a preadditive category as a morphism ideal with
  its powers (`TauCeti.jacobsonRadical`, `TauCeti.jacobsonRadicalIdeal`), and the identification of
  irreducible morphisms with `rad / rad²`;
- the existence half of the Krull-Schmidt theorem for idempotent-complete linear categories over a
  commutative Artinian ring (`TauCeti.exists_isLocalRing_end_sum_comp_eq_id`), Fitting's lemma in
  that setting (`TauCeti.isLocalRing_end_of_indecomposable`), and the full Krull-Schmidt theorem for
  finite-length modules (`TauCeti.exists_indecomposable_iso_biproduct`,
  `TauCeti.exists_equiv_iso_of_iso_biproduct`);
- Quillen exact structures (`TauCeti.ExactStructure`) with relative projectives and injectives and
  the projective and injective stable categories, from the
  [Grothendieck groups and Euler forms](../../GrothendieckEulerForms/README.md) roadmap;
- the transpose `Tr` over an arbitrary ring and the translate `τ = Hom_k(Tr -, k)` over a field
  (`TauCeti.AuslanderReitenTranspose`, `TauCeti.AuslanderReitenTranslate`), with the Auslander-Reiten
  formula over a field;
- nilpotence of the radical and the description of all maps by irreducible ones, for
  representation-finite Artin algebras and for Hom-finite linear categories with finitely many
  indecomposable objects.

What is missing is the theory at its natural generality. There is no notion of a Krull-Schmidt
category and no uniqueness of decompositions outside modules; no `Ext¹` of an exact category and no
almost-split conflations; no Matlis duality over a commutative Artinian ring that is not a field; no
translate, Auslander-Reiten formula or almost-split sequences for Artin algebras; no valued
Auslander-Reiten quiver; and none of the classical finiteness theorems: the Harada-Sai lemma,
Auslander's theorem on components of bounded length, the first Brauer-Thrall conjecture, and
`rad^∞ = 0` for representation-finite algebras; and no global or dominant dimension, so no
Morita-Tachikawa or Auslander correspondence.

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
  Auslander-Reiten theory for a finite-dimensional algebra over a field. Layers 3 to 5 here state the
  same theory for Artin algebras. Where Layer 6 has a statement over a field, the statement here is
  its generalization, and the field statement is derived from it as the case `R = k`; no parallel
  construction is kept. In particular the translate over a field becomes the case `E_k = k` of the
  translate `D_R Tr` here, and the arrow counts of Layer 6's `arQuiver k A` are recovered from the
  valued quiver of Layer 4.
- **[Derived and module algebra](../../DerivedModuleAlgebra/README.md), §1.M.2.** That section owns
  Matlis duality over a Noetherian local ring, including existence of the injective hull `E(κ)` of
  the residue field. Layer 1 here consumes it for the local factors of a commutative Artinian ring and
  owns only the passage to Artinian rings that are not local and to Artin algebras.
- **[Grothendieck groups and Euler forms](../../GrothendieckEulerForms/README.md)** owns exact
  structures, conflation-exact functors and the exact Grothendieck group, and
  [stable, periodic and curved categories](../../StablePeriodicCurved/README.md) owns Frobenius exact
  categories and their stable categories. This roadmap consumes both and adds `Ext¹`, almost-split
  conflations and Auslander-Reiten duality.
- Outside this roadmap: Auslander-Reiten triangles, Serre functors, derived categories and
  extriangulated categories; tilting and τ-tilting theory; covering theory; modules that are not
  finitely generated, except in the definition of global dimension; and dominant dimension of
  rings other than Artin algebras, where the terms of the minimal injective coresolution are asked
  to be flat rather than projective (Hoshino); for Artin algebras the two conditions agree.

## Standing conventions

- `R` is a commutative Artinian ring. An **Artin `R`-algebra** is `[Ring A] [Algebra R A]
  [Module.Finite R A]`. Modules are left modules, and `mod A` is `FGModuleCat A`. Results whose
  proofs use `[IsAlgClosed k]` do not occur; nothing here assumes it.
- A category `C` is **Hom-finite over `R`** when it is `R`-linear (`Linear R C`) and every
  `X ⟶ Y` is a finitely generated `R`-module. Where only endomorphisms are used, the hypothesis is
  stated for `X ⟶ X` alone.
- A **Krull-Schmidt category** is a preadditive category with finite biproducts in which every
  object is isomorphic to a finite biproduct of objects with local endomorphism rings.
- An **exact category** is a Tau Ceti `ExactStructure E` on an additive category; conflations,
  inflations and deflations are Tau Ceti's. The **projective stable category** `E/[P]` is Tau Ceti's
  `ExactStructure.ProjectiveStableCategory`, and the **injective stable category** `E/[I]` is its dual.
- `J(R)` is the Jacobson radical of `R`, `E_R` is an injective hull of `R ⧸ J(R)`, and
  `D_R = Hom_R(-, E_R)` is the **Matlis dual**. For a field, `E_k = k` and `D_k = Hom_k(-, k)`.
- `Ext¹_E(Z, X)` is the group of classes of conflations `X ↪ Y ↠ Z` under the Baer sum. For the
  abelian exact structure on an abelian category it is Mathlib's `CategoryTheory.Abelian.Ext Z X 1`.
- Statements about isomorphism classes of indecomposable objects use Mathlib's `Skeleton`, as
  Tau Ceti's `IsRepresentationFinite` does.

## The build, in layers

### Layer 0: Krull-Schmidt categories

- **The class.** `IsKrullSchmidt C` for a preadditive category with finite biproducts: every object
  is isomorphic to a finite biproduct of objects with local endomorphism rings. Transport along
  equivalences of categories.
- **Indecomposables.** In a Krull-Schmidt category an object is indecomposable exactly when its
  endomorphism ring is local; the reverse implication holds in every preadditive category with
  binary biproducts and is on main (`TauCeti.indecomposable_of_isLocalRing_end`).
- **Idempotents split.** A Krull-Schmidt category is idempotent complete
  (`CategoryTheory.IsIdempotentComplete`).
- **Uniqueness.** If `⨁ i, X i ≅ ⨁ j, Y j` with all `End (X i)` and `End (Y j)` local, there is a
  bijection `σ` of the index types with `X i ≅ Y (σ i)`. The proof is the exchange argument in the
  category, generalizing the module statement `TauCeti.exists_equiv_iso_of_iso_biproduct`.
- **Recognition.** An idempotent-complete category with finite biproducts that is Hom-finite over a
  commutative Artinian ring is Krull-Schmidt. The summand form of the decomposition is on main
  (`TauCeti.exists_isLocalRing_end_sum_comp_eq_id`); idempotent completeness turns it into a
  biproduct decomposition.
- **Closure.** A full subcategory of a Krull-Schmidt category that is closed under isomorphisms,
  finite biproducts and direct summands is Krull-Schmidt.
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
  category is `R`-linear. The zero class is the class of the split conflation. For the abelian exact
  structure on an abelian category it agrees with Mathlib's `CategoryTheory.Abelian.Ext Z X 1`.
- **The long exact sequences.** For a conflation `X ↪ Y ↠ Z` and an object `W`, the sequences
  `0 → Hom(W, X) → Hom(W, Y) → Hom(W, Z) → Ext¹(W, X) → Ext¹(W, Y) → Ext¹(W, Z)` and
  `0 → Hom(Z, W) → Hom(Y, W) → Hom(X, W) → Ext¹(Z, W) → Ext¹(Y, W) → Ext¹(X, W)` are exact.
- **Almost-split conflations.** An almost-split conflation of `E` is a conflation `S` with
  `ShortComplex.IsAlmostSplit S`. In a Krull-Schmidt exact category its end terms are indecomposable,
  and an almost-split conflation ending at a given `Z` is unique up to isomorphism of conflations;
  so is one starting at a given `X`. The **extension-class criterion**: a conflation with
  indecomposable end terms is almost split exactly when its class is nonzero and is killed by
  pushout along every morphism out of its first term that is not a split monomorphism, generalizing
  `TauCeti.isLeftAlmostSplit_f_iff_extClass` from abelian categories.
- **Auslander-Reiten duality.** For an exact category that is Hom-finite over `R`, Krull-Schmidt and
  with every `Ext¹` of finite length over `R`, an **Auslander-Reiten duality** is an equivalence
  `τ : E/[P] ≌ E/[I]` together with isomorphisms `Ext¹_E(Z, X) ≅ D_R (E/[I])(X, τ Z)` natural in
  `X` and `Z`.
- **Existence.** For such a category the following are equivalent: (a) there is an almost-split
  conflation ending at every indecomposable object that is not projective, and one starting at every
  indecomposable object that is not injective; (b) there is an Auslander-Reiten duality. In that case
  the almost-split conflation ending at `Z` is `τ Z ↪ Y ↠ Z`, and `τ` is a bijection from the
  isomorphism classes of indecomposable non-projective objects to those of indecomposable
  non-injective objects. For exact categories this is Enomoto, *Classifications of exact
  structures and Cohen-Macaulay-finite algebras*, Appendix A, and the exact-category case of
  Iyama-Nakaoka-Palu.

### Layer 3: Auslander-Reiten theory of Artin algebras

- **The translate.** For a finitely generated module `M` over an Artin `R`-algebra, take a minimal
  projective presentation (projective covers exist over Artinian rings,
  `TauCeti.exists_projectiveCover`), its transpose `Tr M`
  (`TauCeti.AuslanderReitenTranspose`), and set `τ M = D_R (Tr M)` and `τ⁻ M = Tr (D_R M)`. Both are
  finitely generated and independent of the presentation up to isomorphism; `τ M = 0` exactly when
  `M` is projective; for indecomposable non-projective `M`, `τ M` is indecomposable and not
  injective, and `τ⁻ (τ M) ≅ M`. Over a field this is `TauCeti.AuslanderReitenTranslate`, which
  becomes the case `R = k`.
- **The Auslander-Reiten formulas.** For finitely generated `M` and `N`, natural isomorphisms
  `Ext¹_A(M, N) ≅ D_R (Hom_A(N, τ M) modulo maps factoring through injectives)` and
  `Ext¹_A(M, N) ≅ D_R (Hom_A(τ⁻ N, M) modulo maps factoring through projectives)`. The first one
  makes `τ` an Auslander-Reiten duality for the abelian exact structure on `mod A`.
- **Almost-split sequences.** For every indecomposable non-projective finitely generated module
  `M` there is an almost-split sequence `0 → τ M → Y → M → 0`, unique up to isomorphism, and dually
  for every indecomposable non-injective module; this is Layer 2's existence theorem applied to
  `mod A`. Over a field this is the existence theorem of quiver representations Layer 6, which
  becomes its case `R = k`.
- **Source and sink maps.** Every indecomposable finitely generated module `M` has a minimal right
  almost-split map `Y → M` (for `M` projective, the inclusion of its radical) and a minimal left
  almost-split map `M → Y'` (for `M` injective, the quotient by its socle), and the irreducible maps
  ending at `M` are exactly the components of `Y → M`.

### Layer 4: the valued Auslander-Reiten quiver

- **Irreducible maps between two indecomposables.** For indecomposable finitely generated `M` and
  `N`, `Irr(M, N) = rad(M, N) / rad²(M, N)` is a bimodule over the division rings
  `F_N = End N / rad (End N)` (acting by composition after) and `F_M = End M / rad (End M)` (acting by
  composition before), finite-dimensional over each. Its two dimensions form the **valuation**
  `(a_{MN}, b_{MN})`, with `a_{MN}` the dimension over `F_N` and `b_{MN}` over `F_M`.
- **The valued quiver.** `valuedARQuiver A`: vertices the isomorphism classes of indecomposable
  finitely generated `A`-modules, an arrow `[M] → [N]` exactly when `Irr(M, N) ≠ 0`, labelled by
  its valuation, with the partial bijection `τ` on vertices from Layer 3.
- **Multiplicities.** In the almost-split sequence `0 → τ Z → Y → Z → 0`, the number of copies of an
  indecomposable `W` among the summands of `Y` equals `b_{WZ}`, and also equals `a_{τZ,W}`.
- **The mesh.** For non-projective indecomposable `Z` and indecomposable `W`, the arrow
  `[τ Z] → [W]` exists exactly when `[W] → [Z]` does, and its valuation is that of `[W] → [Z]` with
  the two entries exchanged. So `valuedARQuiver A` is a valued translation quiver.
- **Over a field.** For `A` over a field `k`, `dim_k Irr(M, N) = b_{MN} · dim_k F_M`; this
  recovers the arrow counts of quiver representations Layer 6's `arQuiver k A`, and when `k` is
  algebraically closed every valuation is `(n, n)`.

### Layer 5: finiteness theorems

- **The Harada-Sai lemma.** Let `M₀, …, Mₙ` be indecomposable finitely generated modules of length
  at most `b`, and `fᵢ : Mᵢ₋₁ ⟶ Mᵢ` non-isomorphisms. If `n ≥ 2 ^ b - 1`, then
  `fₙ ∘ ⋯ ∘ f₁ = 0`. Consequently, if `A` is representation-finite and every indecomposable has
  length at most `b`, then `jacobsonRadicalIdeal (FGModuleCat A) ^ (2 ^ b - 1) = ⊥`, an explicit
  form of the nilpotence on main.
- **Auslander's theorem.** Let `A` be connected (`0` and `1` are its only central idempotents) and
  let `𝒞` be a connected component of the underlying graph of `valuedARQuiver A`. If the lengths of
  the modules in `𝒞` are bounded, then `𝒞` is the whole quiver, and `A` is representation-finite.
- **The first Brauer-Thrall conjecture** (Roiter's theorem). If the lengths of the indecomposable
  finitely generated `A`-modules are bounded, then `A` is representation-finite.
- **The infinite radical.** `rad^∞ = ⨅ n, jacobsonRadicalIdeal (FGModuleCat A) ^ n`. The Artin
  algebra `A` is representation-finite exactly when `rad^∞ = ⊥`.
- **Connectedness.** For a connected representation-finite `A`, the underlying graph of
  `valuedARQuiver A` is connected.

### Layer 6: the Morita-Tachikawa and Auslander correspondences

- **Projectivization.** For a finitely generated `A`-module `M` with `Γ = Module.End A M`,
  `Hom_A(M, -)` is an equivalence from `add M` (the direct summands of finite sums of copies of `M`)
  to the finitely generated projective right `Γ`-modules, sending `M` to `Γ`. `Γ` is an Artin
  `R`-algebra, since `M ⟶ M` is finitely generated over `R`.
- **The double centralizer.** If `M` is a generator of `mod A`, the action map
  `A → Module.End Γ M` is an isomorphism.
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
  `0 → Γ → I⁰ → I¹ → ⋯` of the regular module (Layer 1), `dom.dim Γ ≥ n` when `I⁰, …, Iⁿ⁻¹` are
  projective.
  For `n = 1`, this says that `Γ` embeds in a projective-injective module.
- **The Morita-Tachikawa correspondence.** If `M` is a generator-cogenerator of `mod A` (every
  indecomposable projective and every indecomposable injective is a summand of `M`), then
  `dom.dim (Module.End A M) ≥ 2`. Conversely, for an Artin algebra `Γ` with `dom.dim Γ ≥ 2`, let `Q`
  be the sum of the indecomposable projective-injective `Γ`-modules, one of each isomorphism class,
  and `B = Module.End Γ Q`; then `Q` is a generator-cogenerator of `mod B`, and `Γ` is Morita
  equivalent to `Module.End B Q`. These constructions are inverse bijections between pairs `(A, M)`,
  with `M` a generator-cogenerator up to `add M = add M'` and Morita equivalence of `A`, and Artin
  algebras of dominant dimension at least two up to Morita equivalence (Mathlib's
  `MoritaEquivalence`).
- **The Auslander correspondence.** If `M` is an additive generator of `mod A` (every
  indecomposable finitely generated module is a summand of `M`; such `M` exists exactly when `A` is
  representation-finite), then `Γ = Module.End A M` has global dimension at most two, besides
  `dom.dim Γ ≥ 2`. Conversely, if `gl.dim Γ ≤ 2 ≤ dom.dim Γ`, the generator-cogenerator `Q` of the
  previous item is an additive generator of `mod B`. So the Morita-Tachikawa bijection restricts
  to a bijection between Morita classes of representation-finite Artin algebras and Morita classes
  of **Auslander algebras**, the Artin algebras with `gl.dim Γ ≤ 2 ≤ dom.dim Γ`.

## Worked examples (acceptance criteria)

- **A field.** For `R = A = k`, `E_k = k`, `D_k = Hom_k(-, k)`, and `τ` agrees with
  `TauCeti.AuslanderReitenTranslate`.
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
Harada-Sai lemma needs only Layer 0. Layer 6 needs Layer 0, Layer 1 for injectives and
projective-injectives, and Layer 5 for the characterization of representation-finiteness by an
additive generator.

## References

- I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of Associative
  Algebras*, Vol. 1, London Mathematical Society Student Texts 65, Cambridge University Press
  (2006), Chapter IV.
- M. Auslander, *On the dimension of modules and algebras III. Global dimension*, Nagoya Math. J.
  9 (1955), 67–77: global dimension from cyclic modules, left and right global dimension of
  Noetherian and semiprimary rings.
- M. Auslander, *Representation dimension of Artin algebras*, Queen Mary College Mathematics
  Notes, London (1971): the Auslander correspondence.
- M. Auslander, *Representation theory of Artin algebras II*, Comm. Algebra 1 (1974), 269–310:
  `rad^∞` and representation-finiteness, components of bounded length.
- M. Auslander, I. Reiten, S. O. Smalø, *Representation Theory of Artin Algebras*, Cambridge
  Studies in Advanced Mathematics 36, Cambridge University Press (1995): Chapter II (Artin algebras
  and duality), Chapter IV (the transpose and the translate), Chapter V (almost-split sequences and
  the Auslander-Reiten formulas), Chapter VI (the Harada-Sai lemma, Auslander's theorem,
  and the Auslander correspondence in Section VI.5), Chapter VII (the valued Auslander-Reiten
  quiver).
- T. Bühler, *Exact categories*, Expo. Math. 28 (2010), 1–69: `Ext¹` and the long exact sequences.
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
- A. V. Roiter, *Unboundedness of the dimensions of the indecomposable representations of an algebra
  which has infinitely many indecomposable representations*, Izv. Akad. Nauk SSSR Ser. Mat. 32
  (1968), 1275–1282.
- H. Tachikawa, *Quasi-Frobenius Rings and Generalizations*, Lecture Notes in Mathematics 351,
  Springer (1973): dominant dimension and the Morita-Tachikawa correspondence.
