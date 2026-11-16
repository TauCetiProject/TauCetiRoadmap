# Roadmap: Flatness and homological dimensions of noncommutative rings

**Summary.** Mathlib develops flat modules, `Tor`, and the character-module test for flatness only
over commutative rings. Tau Ceti provides the balanced tensor product `M ⊗_A N` of a right and a
left module over an arbitrary ring (`TauCeti.BalancedTensorProduct`), the global dimension of left
modules, projective covers, and semiperfect rings. This roadmap establishes flat modules over
noncommutative rings and flat functors over preadditive categories. Every layer is category-primary
and follows a single module convention: a module over a preadditive category `C` is a contravariant
additive functor, forming the category `Mod C`. A ring `A` enters as the one-object category
`SingleObj Aᵐᵒᵖ`, whose modules are left `A`-modules; covariant additive functors are the objects of
`Mod Cᵒᵖ`, which for rings are right `A`-modules.

Layer 0 builds the categorical and ring-level foundations. It defines finitely generated and
finitely presented functors (`mod C`) using finite sums of representables, establishes the abelian
and Grothendieck structure of `Mod C`, and identifies left `A`-modules with `Mod (SingleObj Aᵐᵒᵖ)`.
It then constructs the tensor product `G ⊗_C F` of a covariant functor `G` and a module `F` as a
coend of abelian groups (with its `R`-module structure when `C` is `R`-linear, adjunctions, right
exactness, behavior on projectives, and symmetry isomorphism), alongside one-sided ideals of `C`,
radical products `I · M`, superfluous subobjects, duals `Hom_R(-, E)`, the native ring API for
`M ⊗_A N`, and the category `proj C` of finitely generated projectives with its duality `Hom(-, C)`
and finite-presentation comparisons. Layer 1 defines `Tor` over `C` as the left derived functor in
the `Mod C` variable, proves its long exact sequences, balance, Auslander–Bridger transpose formula,
and `Tor`–`Ext` duality, and compares categories on finitely many objects with their category
algebras. Layer 2 defines flatness by the equational criterion and develops the ideal, `Tor`, and
Lambek tests (via Baer's criterion for `Mod C`), projectivity of finitely presented flat modules,
Lazard's characterizations (factorization, filtered colimits of finite sums of representables, and
purity), the equivalences with left exactness on abelian categories and cohomological functors on
triangulated categories, Crawley-Boevey's representation of finitely accessible additive categories,
Bass's flat module of a sequence, and closure properties. Layer 3 treats flat dimension, the global
dimension of an abelian category, weak global dimension and its left-right symmetry, and Auslander's
theorem equating global and weak global dimension for Noetherian categories (every `Hom(-, X)` a
Noetherian object; for rings, left Noetherian).

Layer 4 develops T-nilpotent left ideals of `C` and Nakayama's lemma for arbitrary modules,
semilocal, semiperfect, and perfect categories and rings, projective covers, the vanishing of pure
superfluous subobjects of projectives, and the global dimension of perfect categories. For small
preadditive categories, the summit is **Simson's Theorem 5.4** ([Simson, Thm. 5.4, p. 108], stated
for covariant modules and applied here to `Cᵒᵖ`), which proves the equivalence of four conditions:
every flat module in `Mod C` is projective; every module in `Mod C` has a projective cover; `J(C)`
is T-nilpotent on sequences `c₀ → c₁ → ⋯` and `C ⧸ J(C)` is semisimple; and every sequence
`c₀ → c₁ → ⋯` in `C` is factorizable. These are the categories whose module category is perfect in
the sense of [Harada]; [JL, p. 387] calls such a category `C` right perfect (their left perfectness
is formulated for covariant functors and therefore corresponds to `Cᵒᵖ` here). Specializing to a
single object yields **Bass's Theorem P** for a ring `A` with Jacobson radical `J`: `A ⧸ J` is
semisimple and `J` is left T-nilpotent if and only if every left `A`-module has a projective cover,
if and only if principal *right* ideals satisfy the descending chain condition, if and only if every
left module has equal flat and projective dimension, if and only if filtered colimits of projective
left modules are projective ([Bass, Theorem P]), and if and only if every flat left module is
projective ([AF, 28.4]; [Lam-FC, (24.25)]).

## Scope and ownership

This roadmap owns:

- **Layer 0 (modules and tensor products):** finitely generated and finitely presented functors as
  quotients and cokernels of maps between finite sums of representables (0.1); `Mod C` as the full
  subcategory of contravariant additive functors, together with its abelian and Grothendieck
  structure, representable projectives, enough projectives and injectives, subobject lattices,
  derived `R`-linear structure, and inclusion of `mod C`; and the equivalence between left
  `A`-modules and `Mod (SingleObj Aᵐᵒᵖ)`. It also owns the coend tensor product `G ⊗_C F` (with
  `Module R` instances over an `R`-linear `C`, adjunctions, right exactness, Yoneda isomorphisms,
  tensoring with projectives, and the swap `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`), the native ring API for
  `M ⊗_A N` and its comparisons with `⊗_C` and with Mathlib's commutative tensor product, duals with
  respect to an `R`-module `E`, left and right ideals of `C` and at a single object (with ring
  bridges), `I · M` as a subobject for a left ideal `I`, superfluous elements of a lattice
  (refactoring `TauCeti.IsSuperfluous`), quotients `C ⧸ I` and restriction of modules along
  `C ⥤ C ⧸ I` for two-sided ideals `I`, and the finitely generated projective modules `proj C` with
  `proj C ≃ Karoubi (Mat_ C)`, the duality `Hom(-, C)` between `proj C` and `proj Cᵒᵖ`, and the
  comparisons of finite presentation with `proj C`, `IsFinitelyPresentable`, and
  `Module.FinitePresentation`.
- **Layer 1 (`Tor` and category algebras):** `Tor` over a preadditive category and over an arbitrary
  ring as a left derived functor, its long exact sequences, balance, the transpose formula
  `stable Hom(X, N) ≅ Tor_1(Tr X, N)` and the resulting `Tor` criterion for projectivity, duality
  with `Ext`, comparison with Mathlib's `CategoryTheory.Tor` over commutative rings, change of base
  for rings, `Tor₁` of two cyclic modules, and the Morita comparison between a category with
  finitely many objects and its category algebra.
- **Layer 2 (flat modules and functors):** flat modules and flat functors over preadditive
  categories and arbitrary rings defined by the equational criterion, the ideal, `Tor`, and Lambek
  tests, Baer's criterion for `Mod C`, commutation of `Tor` with filtered colimits, projectivity of
  finitely presented flat modules, Lazard's characterizations and purity (with the bridge to
  Mathlib's `IsCardinalPure`), the characterizations of flat functors as left exact on abelian
  categories and cohomological on triangulated categories, Crawley-Boevey's representation theorem,
  Bass's flat module of a chain, closure properties, and bridges to Mathlib's ind-objects and
  type-valued flat functors.
- **Layer 3 (homological dimensions):** flat dimension; the global dimension of an abelian category,
  Auslander's lemma on cyclic modules, and universe independence; weak global dimension, its
  left-right symmetry, and comparison bounds with global dimension; the `FP_∞` dimension-shifting
  lemma and Auslander's theorem for Noetherian categories and left Noetherian rings; and flat
  dimensions of kernels of flat modules and of countably presented flat modules.
- **Layer 4 (perfect categories, projective covers, and Theorem P):** T-nilpotent left ideals of a
  preadditive category and Nakayama's lemma for arbitrary modules; semilocal rings and categories,
  semiperfect and perfect categories, `IsLeftPerfectRing`, commutative semiperfect and perfect
  rings, and semiprimary endomorphism rings of finite-length modules; projective covers over
  semiperfect and perfect categories and rings, the projective-cover characterizations of
  semiperfect categories and rings, the radical of a projective module, and finite minimal
  projective presentations over semiperfect rings; vanishing of pure superfluous subobjects of
  projectives and projectivity of flat modules admitting projective covers; Bass's Theorem P for
  categories and rings; and the global dimension of perfect categories and rings together with the
  Bass–Eilenberg criterion.

Scope boundaries with Mathlib, Tau Ceti, and neighboring roadmaps:

- **Linearity and enrichment.** An `R`-linear category is Mathlib's `Linear R C`, and modules are
  ordinary functors carrying additivity as a property. **Future work, not pursued here:** `R`-linear
  categories enriched over `ModuleCat R`, and a bridge from `Mod C` to degree-zero DG modules. Tau
  Ceti's DG categories use `EnrichedCategory` over `CochainComplex (ModuleCat R) ℤ` with a
  custom-built functor category (`TauCeti/CategoryTheory/DG/Functor/Category.lean`), as Mathlib has
  no general category of enriched functors.
- **Finitely presented functors.** On `Cᵒᵖ ⥤ AddCommGrpCat.{v}`, `mod C` is defined using finite
  sums of representables (0.1, the first target). This replaces Tau Ceti's single-representable
  definition, which agrees only when `C` has finite biproducts (over `ℤ`, for instance, `ℤ²` is not
  a quotient of `ℤ`); Section 0.1 details which existing results carry over. The
  [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md) roadmap works over additive
  categories `C`, where the two definitions coincide.
- **Commutative flatness.** Over a commutative ring, flatness remains Mathlib's `Module.Flat`;
  Section 2.1 proves its equivalence with `TauCeti.Module.BalancedFlat`. Tau Ceti's
  `TauCeti.flatModuleFilteredFree` (one direction of Lazard's theorem over commutative rings)
  becomes a corollary of 2.3.
- **Intrinsic flatness.** `Flat` here always means flatness in `Mod C`; intrinsic flatness inside
  the full subcategory of flat modules ([CI]) is not developed.
- **Computations over `ℤ`.** [Operator K-theory](../OperatorKTheory/README.md), §8.2, owns `Ext`
  and `Tor` computations specific to `ℤ` (free presentations, cyclic groups, universal
  coefficients). Section 1.6 compares `BalancedTor` with Mathlib's `Tor` over every commutative
  ring, and no further `ℤ`-specific computations belong here.
- **Derived tensor products.** [Derived and module algebra](../DerivedModuleAlgebra/README.md) owns
  the derived tensor product and `Tor` amplitude over commutative rings. This roadmap touches
  derived categories only through Mathlib's `Abelian.Ext` (1.5).
- **Global dimension comparisons.** [Krull-Schmidt categories and Auslander-Reiten theory of Artin
  algebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2, owns left-right global dimension
  comparisons whose statements do not mention weak dimension, whereas statements involving weak
  global dimension live here. Tau Ceti's character-module proofs of those comparisons are replaced
  by the weak-dimension proof from 3.4 while keeping their statements intact (refactor consumer,
  3.4). In addition, Layer 4 proves `gldim A = wgldim A = gldim Aᵐᵒᵖ` for rings that are perfect on
  both sides (4.6), giving a second proof of §7.2's semiprimary case.
- **Abelian global dimension.** Tau Ceti's ring-level `TauCeti.globalDimension` is refactored, with
  no compatibility shims, as the `ModuleCat A` specialization of the global dimension of an abelian
  category (3.2).
- **Semiperfect rings, covers, and ideals.** Semiperfect rings use `TauCeti.IsSemiperfectRing`
  (semisimple radical quotient and idempotent lifting), refactored to extend `IsSemilocalRing` (4.2,
  Downstream consumers); this roadmap owns projective covers over them and their characterization by
  projective covers (4.2). Krull–Schmidt categories and Krause's criterion belong to ArtinAlgebras
  §0.2 (`IsKrullSchmidt`, restated in `Suggested.lean`), and Section 4.2 restates Krause's criterion
  using `IsSemiperfectCategory`. The radical `TauCeti.jacobsonRadicalIdeal` and essential
  epimorphisms remain Tau Ceti's. Two-sided ideals use `TauCeti.MorphismIdeal`, while one-sided
  ideals of a category are introduced in 0.3 with coercions from two-sided ideals. Minimal
  projective presentations use `TauCeti.IsMinimalProjectivePresentation`; this roadmap owns their
  existence over semiperfect rings (4.2).
- **Out of scope:** tensor products of additive categories and multilinear functors ([Mitchell,
  §2]); Morita theory for functor categories beyond the finite-object case of 1.7; Bass's conditions
  on direct limits of modules of bounded projective dimension and on orthogonal idempotents and
  socles ([Bass, Theorem P (4), (7)]), as well as Simson's Mittag-Leffler, product, coperfectness,
  and endomorphism-ring conditions ([Simson, Thm. 5.4 (2)–(4), (6)]), which remain pointers in 4.5;
  a typeclass for semiprimary categories (4.3); Chase's theorem, coherent rings, and products of
  flat modules (pointers in 2.6; kernels are in 3.5); flat covers (pointers in 2.4); purity beyond
  the purity test of 2.3 (pure-injective modules, pure global dimension); flat Mittag-Leffler
  modules; faithful flatness over noncommutative rings; characterizations via maximal submodules and
  socles ([AF, 28.4 (c), (f)]), finitely generated submodules (Björk), or ascending chains of
  principal left ideals (Jonah); finitistic dimensions ([Bass, Part II]); `Tor` of bimodules and its
  base-ring module structure; and Hoshino's flat-dominant dimension.

Suggested homes in Tau Ceti: `TauCeti/CategoryTheory/Preadditive/ModCat/` (0.1, 0.3–0.5, 0.7),
`TauCeti/CategoryTheory/Preadditive/MorphismIdeal/OneSided.lean` (one-sided ideals, 0.3),
`TauCeti/Order/Superfluous.lean` (superfluous elements of a lattice, 0.3, replacing
`TauCeti/Algebra/Module/Submodule/Superfluous.lean`),
`TauCeti/CategoryTheory/Preadditive/ModCat/Proj.lean` (0.8),
`TauCeti/CategoryTheory/Preadditive/SingleObj.lean` (0.2),
`TauCeti/LinearAlgebra/TensorProduct/Balanced/` (0.6),
`TauCeti/CategoryTheory/Preadditive/ModCat/Tor/` (1.1–1.6), `TauCeti/Algebra/Homology/BalancedTor/`
(ring `Tor`), `TauCeti/CategoryTheory/Preadditive/CategoryAlgebra.lean` (1.7),
`TauCeti/CategoryTheory/Preadditive/ModCat/Flat/` (2.1–2.6),
`TauCeti/CategoryTheory/Preadditive/ModCat/Baer.lean` (2.2), `TauCeti/RingTheory/Flat/Balanced/`
(ring items of Layer 2), `TauCeti/CategoryTheory/Abelian/GlobalDimension.lean` (3.2),
`TauCeti/CategoryTheory/Preadditive/ModCat/Dimension/` (3.1, 3.3–3.5),
`TauCeti/RingTheory/GlobalDimension/Weak.lean` (ring items of Layer 3),
`TauCeti/CategoryTheory/Preadditive/MorphismIdeal/TNilpotent.lean` (4.1),
`TauCeti/CategoryTheory/Preadditive/Semiperfect.lean` (semilocal and semiperfect categories, 4.2),
`TauCeti/CategoryTheory/Preadditive/ModCat/Perfect/` (4.2–4.6 for categories),
`TauCeti/RingTheory/Jacobson/TNilpotent.lean`, `TauCeti/RingTheory/Jacobson/Semilocal.lean`,
`TauCeti/Algebra/Module/ProjectiveCover/Semiperfect.lean`, and
`TauCeti/RingTheory/Jacobson/LeftPerfect.lean` (ring items of Layer 4). Nothing goes under
`TauCeti/RingTheory/Perfect/`, which is reserved for the characteristic-`p` notion.

## Conventions

1. **Single module convention.** Let `C : Type u` with `[Category.{v} C] [Preadditive C]`. A
   `C`-module is a contravariant additive functor `Cᵒᵖ ⥤ AddCommGrpCat.{w}`, and `Mod C`
   (`TauCeti.ModCat C`) is the full subcategory of additive functors inside the ordinary functor
   category (Mathlib's `Cᵒᵖ ⥤+ AddCommGrpCat.{w}`). When `w = v`, the finitely presented functors
   `mod C` of 0.1 form a full subcategory of `Mod C`, matching
   [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md). This convention aligns with
   Mathlib's left modules and contravariant Yoneda embedding
   (`preadditiveYoneda : C ⥤ Cᵒᵖ ⥤ AddCommGrpCat`), giving covariant embeddings
   `C ⊆ proj C ⊆ Mod C` (0.1, 0.8).

   No separate category of covariant modules is defined: a covariant additive functor is a module on
   the opposite side, namely an object of `Mod Cᵒᵖ` (`TauCeti.ModCat Cᵒᵖ`). Every theorem is stated
   for `Mod C` and specialized to `Cᵒᵖ` for the opposite side. The covariant representable
   `Hom(X, -)` is `(ModCat.yoneda Cᵒᵖ).obj (op X)`. Mathlib's `preadditiveCoyoneda` is not used
   because its values have type `C ⥤ AddCommGrpCat` rather than `Cᵒᵖᵒᵖ ⥤ AddCommGrpCat` (`Mod Cᵒᵖ`),
   and no enriched functor categories are introduced.
2. **Linearity.** Let `R` be a commutative ring; `C` may carry an `R`-linear structure (`Linear R C`
   on top of `Preadditive C`), with `ℤ`-linearity always available via `preadditiveIntLinear`. A
   module carries only its additive structure, and its `R`-action is induced on each value `F(c)` by
   `F(r • 𝟙 c)` (0.1), just as `ModuleCat A` stores only the `A`-action and recovers an `R`-algebra
   action via `algebraMap R A`.

   Following Mathlib's category-theory conventions, `R` enters a definition as a parameter only when
   the underlying object depends on it. Thus `G ⊗_C F` and `Tor` take values in `AddCommGrpCat` and
   acquire `Module R` instances when `C` is `R`-linear (with `r` acting via `r • 𝟙` in either
   argument, modeled on `Abelian.Ext` and `Abelian.Ext.smul_eq_comp_mk₀` in
   `Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`). By contrast, `Hom_R(G(-), X)` and
   the duals of 0.7 depend on `R` and take it explicitly, and the ring-level tensor product is
   `TauCeti.BalancedTensorProduct R A M N`.
3. **Universes.** For `C : Type u` with `Category.{v} C` and module values in `AddCommGrpCat.{w}`,
   definitions that quantify only over objects, morphisms, and module elements require no smallness
   hypotheses: finite presentation (0.1, in the representable universe `v`), flatness (2.1, in any
   universe), T-nilpotence (4.1), and the results of 2.4. Coend tensor products and `Tor` are
   constructed under `EssentiallySmall.{w} C` for modules in `ModCat.{w} C`; theorems that combine
   them with representables—such as the Yoneda isomorphisms, Lazard's theorem, flat dimension, and
   Theorem P—set `w = v`, the morphism universe in which the representables live. Each declaration
   carries only the hypotheses required by its own signature; for example, Bass's module of a
   sequence (2.5) needs only countable colimits and no smallness.

   Rings and small categories satisfy `w = v` directly, while the category `mod A` of finitely
   presented modules uses `SmallModel`. A category satisfying `EssentiallySmall.{w}` for another
   universe `w` is first replaced along `SmallModel` (since `ULift` can raise the representable
   universe when `w ≥ v` but cannot lower it when `w < v`, where Hom groups are shrunk via
   `ShrinkHoms`). Universe independence of global dimension across module universes is proved in
   3.2.
4. **Rings and opposite sides.** Here `A` is an arbitrary ring (`[Ring A]`), equipped with
   `[Algebra R A]` when an `R`-linear base is needed. Ring modules are left modules; a right
   `A`-module is a left `Aᵐᵒᵖ`-module (`[Module Aᵐᵒᵖ M]`), matching `TauCeti.BalancedTensorProduct`,
   and right-handed theorems are obtained by applying left-handed ones to `Aᵐᵒᵖ` (with left
   `A`-modules viewed as right `Aᵐᵒᵖ`-modules via `RingEquiv.opOp A`). A right ideal of `A` is a
   `Submodule Aᵐᵒᵖ A` (as in `Mathlib/Topology/Algebra/LinearTopology.lean`), so `A ⧸ I` is a right
   module and `I ∩ K` is defined directly for `K : Ideal A`.

   A ring enters the categorical theory as `SingleObj Aᵐᵒᵖ`, following Mathlib's
   `CategoryTheory.Mat.equivalenceSingleObj : Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)`
   (`Mathlib/CategoryTheory/Preadditive/Mat.lean`). Because `SingleObj M` composes morphisms as
   `f ≫ g = g * f` (`SingleObj.comp_as_mul`), composition in `SingleObj Aᵐᵒᵖ` is
   `f ≫ g = op (unop f * unop g)`, so a contravariant functor `F` satisfies
   `F(a b) = F(a) ∘ F(b)` and corresponds to a left `A`-module. Under this dictionary, left and
   right ideals of `A` correspond to left and right ideals of `SingleObj Aᵐᵒᵖ` (0.3),
   `Mod (SingleObj Aᵐᵒᵖ)` is equivalent to `ModuleCat A`, `Mod (SingleObj Aᵐᵒᵖ)ᵒᵖ` to
   `ModuleCat Aᵐᵒᵖ`, `Hom(-, ∗)` to the regular left module `A`, and `proj (SingleObj Aᵐᵒᵖ)` to
   `TauCeti.finiteProjectiveModules A` (0.2, 0.8).
5. **Native ring-level definitions.** For an `R`-algebra `A`, a right module `M`, and a left module
   `N` with compatible `R`-actions (`IsScalarTower R Aᵐᵒᵖ M`, `IsScalarTower R A N`), `M ⊗_A N` is
   `TauCeti.BalancedTensorProduct R A M N` with its native element API; `f ⊗ N` and `M ⊗ g` are
   `R`-linear, and the bifunctor takes values in `ModuleCat R` (0.6). Ring-level definitions are
   never transported across equivalences with functor categories, though their proofs may proceed
   either directly or through the comparison of 0.6, whichever is simpler. Each layer concludes its
   sections with native ring statements on `ModuleCat A` so that downstream ring consumers never
   depend on functor categories.
6. **Argument order in tensor products and `Tor`.** Following
   `TauCeti.BalancedTensorProduct R A M N`, `M ⊗_A N` places the right module `M` first and the
   left module `N` second. Accordingly, `G ⊗_C F` takes the covariant functor `G : Mod Cᵒᵖ` first
   and `F : Mod C` second, `Tor^C_n(G, F)` is the left derived functor of `G ⊗_C -` in the `Mod C`
   variable `F`, and ring-level `Tor_n^A(M, N)` is derived in the left-module variable `N`
   (compared directly with Mathlib's `CategoryTheory.Tor` when `A` is commutative, 1.6). Flatness
   (2.1) requires no tensor product, and the homological dimensions of Layer 3 use
   `AddCommGrpCat`-valued `Tor`. Ring modules live in `ModuleCat.{v} A` and `ModuleCat.{v} Aᵐᵒᵖ`
   under `[Small.{v} A]`, matching `TauCeti.globalDimension`, with the instance `Small.{v} Aᵐᵒᵖ`
   supplied in 0.2.
7. **Dimension values.** Homological dimensions take values in `WithBot ℕ∞`, taking the value `⊥`
   precisely on zero objects, in agreement with `CategoryTheory.projectiveDimension` and
   `TauCeti.globalDimension`. The global dimension of an abelian category is
   `TauCeti.Abelian.globalDimension` (3.2), specialized to `ModCat C` and `ModCat Cᵒᵖ` for the two
   sides of `C`, and to `ModCat (SingleObj Aᵐᵒᵖ)` (`TauCeti.globalDimension A`, left global
   dimension) and `TauCeti.globalDimension Aᵐᵒᵖ` (right global dimension) for a ring `A`.
8. **Ideals, radicals, and T-nilpotence.** We write `J = Ring.jacobson A` for a ring and
   `J(C) = TauCeti.jacobsonRadicalIdeal C` for a category, where
   `J(C)(X, X) = Ring.jacobson (End X)`.
   A **left ideal** of `C` (`TauCeti.LeftMorphismIdeal`, 0.3) is closed under precomposition and a
   **right ideal** (`TauCeti.RightMorphismIdeal`) under postcomposition; a two-sided ideal
   `TauCeti.MorphismIdeal` such as `J(C)` coerces to both. A left ideal `I` is **T-nilpotent**
   (`TauCeti.LeftMorphismIdeal.IsTNilpotent`) if every composable sequence `c₀ → c₁ → ⋯` of
   morphisms `fᵢ` in `I` has a vanishing finite composite `f₀ ≫ ⋯ ≫ fₙ₋₁ : c₀ → cₙ` (4.1), matching
   the precomposition action in `I · M` used by Nakayama's lemma on `Mod C`.

   Because `IsTNilpotent` is defined on `LeftMorphismIdeal C`, no handedness modifier appears in its
   name: the opposite condition for a right ideal `I` of `C` is T-nilpotence of the left ideal
   `I.op` of `Cᵒᵖ` (`TauCeti.RightMorphismIdeal.op`, or `TauCeti.MorphismIdeal.op` in the two-sided
   case), i.e., vanishing along chains `c₀ ← c₁ ← ⋯` (called "left T-nilpotence" in [Simson,
   p. 108] for covariant modules). For a ring `A`, a subset `S ⊆ A` is **left T-nilpotent** if every
   sequence `a₀, a₁, …` in `S` satisfies `a₀ a₁ ⋯ aₙ₋₁ = 0` for some `n` ([Bass, p. 466], [Lam-FC,
   (23.13)], [AF, p. 314]). In `SingleObj Aᵐᵒᵖ`, `op a₀ ≫ ⋯ ≫ op aₙ₋₁ = op (a₀ a₁ ⋯ aₙ₋₁)`, so
   T-nilpotence of the left morphism ideal attached to a left ideal `J` of `A` coincides with left
   T-nilpotence of `J`; right T-nilpotence (`aₙ₋₁ ⋯ a₀ = 0`) is left T-nilpotence in `Aᵐᵒᵖ`.
9. **Perfect categories and rings.** A preadditive category `C` is **perfect**
   (`IsPerfectCategory`) if every `End X` is semilocal and `J(C)` is T-nilpotent, or equivalently if
   `C ⧸ J(C)` is semisimple in Simson's sense and `J(C)` is T-nilpotent (4.2, 4.3); by Theorem P
   (4.5), this holds if and only if every module in `Mod C` has a projective cover, while the
   opposite condition is `IsPerfectCategory Cᵒᵖ`. A ring `A` is **left perfect**
   (`IsLeftPerfectRing`) if `A ⧸ J` is semisimple and `J` is left T-nilpotent, equivalently
   `IsPerfectCategory (SingleObj Aᵐᵒᵖ)`. By Theorem P this matches Bass's definition that every left
   `A`-module has a projective cover ([Bass, p. 467]) and is equivalent to the descending chain
   condition on principal *right* ideals. Note that [Lam-FC] works with right modules, so its "right
   perfect" rings are `IsLeftPerfectRing Aᵐᵒᵖ`.
10. **Naming disambiguation.** Mathlib's `PerfectRing R p` and `TauCeti/RingTheory/Perfect/` concern
    surjectivity of Frobenius in characteristic `p`; the homological classes here are always named
    `IsLeftPerfectRing` and `IsPerfectCategory`.
11. **Duals.** Given an `R`-module `E`, the dual of `F : Mod C` is the covariant functor
    `F^E = Hom_R(F(-), E)` (0.7), and the dual of a left `A`-module `M` is the right `A`-module
    `TauCeti.MatlisDual R E M = Hom_R(M, E)` (0.6, a type synonym of `M →ₗ[R] E`). Injectivity or
    cogenerator hypotheses on `E` are placed on theorems rather than on the dual construction. For
    `R = ℤ` and `E = ℚ ⧸ ℤ`, `M⁺` denotes the right module `MatlisDual ℤ (AddCircle (1 : ℚ)) M`,
    whose underlying additive group is Mathlib's `CharacterModule M = M →+ ℚ ⧸ ℤ`.
12. **Projective covers.** In a category, a projective cover is an essential epimorphism
    (`TauCeti.IsEssentialEpi`) from a projective object, and existence of a cover of `M` is written
    `TauCeti.HasProjectiveCover M` (4.2); in an abelian category, an epimorphism is essential if and
    only if its kernel satisfies the lattice predicate `TauCeti.IsSuperfluous` (0.3). Over a ring, a
    projective cover is `TauCeti.IsProjectiveCover` (a surjection from a projective module with
    superfluous kernel in `Submodule R M`), linked to the categorical notion by
    `TauCeti.isProjectiveCover_iff_forall_surjective`. Ring-level TFAE statements in 4.2 and 4.5
    express existence of a cover of `M` in the ring's universe `u` as
    `∃ (P : Type u) (_ : AddCommGroup P) (_ : Module A P) (p : P →ₗ[A] M), IsProjectiveCover p`,
    whereas covers of arbitrary modules over a left perfect ring in any universe follow the shape of
    `TauCeti.exists_isProjectiveCover` (4.4).
13. **Declaration names.** Proposed Lean names appear in parentheses; declarations present in
    `Suggested.lean` are written with the `TauCeti.` prefix in this README and placed inside
    `TauCetiRoadmap.NoncommutativeFlatness` in `Suggested.lean`. The connecting homomorphisms
    `ShortComplex.ShortExact.torδ`, `torδ'`, `balancedTorδ`, and `balancedTorδ'` (1.2, 1.3) are
    placed in `CategoryTheory.ShortComplex.ShortExact` to support dot notation.
14. **Handedness of cited sources.** Contravariant sources—[OR], [St], [CB], [Fisher] (except
    Cor. 2.9), [Krause-Smashing, Lemma 2.7, p. 115], and the flat-functor section [Mitchell,
    §10]—match `Mod C` directly. Note, however, that [OR]'s tensor product `S ⊗_X F` places the
    contravariant functor `S` first, so its `Tor_1(S, X(z, -) ⧸ I)` is our `Tor_1(X(z, -) ⧸ I, S)`
    (Convention 6), while [OR, Thm. 4.1 (5)] (products of flat functors in `[X, Mod K]`) is
    covariant.

    Covariant categorical sources are specialized to `Cᵒᵖ` and noted at the point of citation:
    [Fisher, Cor. 2.9]; [Simson] (except Thm. 2.1 (b), which is already stated for `Cᵒᵖ`-modules);
    [Harada, Part I, Thm. 5] (whereas Part I, Thms. 3–4, and Part II work with contravariant
    functors `(C⁰, Ab)`, as here); [Mitchell]'s general module sections (§3, §7 including Thm. 7.1,
    §9 p. 45 (6), and §11, with the contravariant remark to Thm. 7.1 on p. 37); [ML, IX.6] (which
    models left `A`-modules as covariant functors on `SingleObj A`—denoted `R` there—and places
    the contravariant factor first in `⊗`); and Mathlib's `RepresentablyFlat` and `Action`.
    Likewise, right-module ring sources are applied to `Aᵐᵒᵖ`: [Lam-LMR] throughout, and [Lam-FC]
    in §§23–24 (whereas [Lam-FC, (4.14)] is stated for left modules).

**Sources and locators.** Citations use the keys in [Sources and locators](#sources-and-locators);
all page numbers are printed pages.

## Exact supplier contracts

### From Mathlib

- Functor categories and modules over a category: `CategoryTheory.additiveFunctor`,
  `CategoryTheory.AdditiveFunctor` (`C ⥤+ D`), `ObjectProperty.FullSubcategory`,
  `ObjectProperty.lift`, `ObjectProperty.ιOfLE`; the closure classes `ObjectProperty.ContainsZero`,
  `ObjectProperty.IsClosedUnderKernels`, `ObjectProperty.IsClosedUnderCokernels`,
  `ObjectProperty.IsClosedUnderFiniteProducts`, `ObjectProperty.IsClosedUnderColimitsOfShape` with
  `hasColimitsOfShape_of_closedUnderColimits`, and the abelian instance for full subcategories
  (`Mathlib/CategoryTheory/Abelian/Subcategory.lean`);
  `CategoryTheory.Abelian.functorCategoryAbelian`; `CategoryTheory.preadditiveYoneda` (Mathlib's
  `preadditiveCoyoneda` is not used, Convention 1); `CategoryTheory.EnoughProjectives`,
  `CategoryTheory.Projective`, `CategoryTheory.IsCoseparator`.
- Grothendieck categories (0.1): `CategoryTheory.IsGrothendieckAbelian`,
  `IsGrothendieckAbelian.enoughInjectives`, `IsGrothendieckAbelian.hasExt`,
  `IsGrothendieckAbelian.generatingMonomorphisms_rlp`, `CategoryTheory.HasSeparator`,
  `CategoryTheory.IsSeparator` (`Mathlib/CategoryTheory/Generator/Presheaf.lean` as the pattern),
  `CategoryTheory.EnoughInjectives`, `CategoryTheory.Injective`, and the instance
  `IsGrothendieckAbelian.wellPowered`.
- Subobject lattices (0.1, 4.2): `CategoryTheory.Subobject` with its order and lattice instances,
  `IsCoatom`, `zorn_le_nonempty₀`, `CategoryTheory.WellPowered`, `IsModularLattice`,
  `IsCompactlyGenerated`, `IsAtomistic`,
  `exists_sSupIndep_of_sSup_atoms`, `CategoryTheory.subobject_simple_iff_isAtom`,
  `CategoryTheory.Simple`, `ComplementedLattice`.
- Linearity: `CategoryTheory.Linear` with `Linear.preadditiveIntLinear`,
  `Linear.oppositeCategory`, `Linear.smul_comp`, `Linear.comp_smul`;
  `CategoryTheory.linearYoneda` (the pattern of `ModCat.linearHomBifunctor`); the `Module R`
  instance on `Abelian.Ext` and `Abelian.Ext.smul_eq_comp_mk₀`
  (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`), the pattern of the `R`-structure on
  `⊗_C` and `Tor`.
- Coends: `CategoryTheory.Limits.HasCoend`, `CategoryTheory.Limits.coend` with `coend.ι`,
  `coend.condition`, `coend.desc`, `coend.hom_ext`, `coend.map`
  (`Mathlib/CategoryTheory/Limits/Shapes/End.lean`); `Adjunction.leftAdjoint_preservesColimits`;
  `TensorProduct` over `ℤ` with `AddMonoidHom.toIntLinearMap`, `LinearMap.lTensor` and
  `LinearMap.rTensor`. The monoidal structure of `ModuleCat R` is not used.
- One-sided ideals (0.3): `AddSubgroup`, `AddSubgroup.comap`, `OrderIso`, `Ideal.mul_mem_left`,
  `Submodule.smul_mem`, `CategoryTheory.unopHom`. Mathlib's `CategoryTheory.Sieve` has the closure
  of a left ideal but is not additive, and is not used.
- One object: `CategoryTheory.SingleObj`, `SingleObj.star`, `SingleObj.comp_as_mul`, the
  `Preadditive (SingleObj A)` instance (`Mathlib/CategoryTheory/Preadditive/SingleObj.lean`);
  `Action.functorCategoryEquivalence` as the pattern for 0.2; `CategoryTheory.unopUnop`;
  `MulOpposite.instAlgebra`; `CategoryTheory.Mat.equivalenceSingleObj`
  (`Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)`, the precedent for entering a ring as `SingleObj Aᵐᵒᵖ`).
- Size: `CategoryTheory.EssentiallySmall` (with its instance for `Cᵒᵖ`),
  `CategoryTheory.SmallModel`, `CategoryTheory.equivSmallModel`, `CategoryTheory.LocallySmall`,
  `CategoryTheory.ShrinkHoms`.
- Derived functors: `CategoryTheory.Functor.leftDerived`, `CategoryTheory.NatTrans.leftDerived`,
  `CategoryTheory.ProjectiveResolution` with `ProjectiveResolution.isoLeftDerivedObj`,
  `CategoryTheory.Functor.leftDerivedZeroIsoSelf`,
  `CategoryTheory.Functor.isZero_leftDerived_obj_projective_succ`,
  `CategoryTheory.HasProjectiveResolutions`, `ModuleCat.enoughProjectives`,
  `CategoryTheory.Functor.mapHomologicalComplex`, `HomologicalComplex.homologyFunctor`,
  `CategoryTheory.Functor.whiskeringLeft`. Named only for comparison (1.1):
  `CategoryTheory.Functor.HasLeftDerivedFunctor`, `CategoryTheory.Functor.totalLeftDerived`,
  `CategoryTheory.LocalizerMorphism.IsLeftDerivabilityStructure`.
- `Ext`: `CategoryTheory.Abelian.Ext`, `CategoryTheory.HasExt`,
  `CategoryTheory.hasExt_of_enoughProjectives`, the instance `Module R (Ext X Y n)` for an
  `R`-linear category (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`),
  `CategoryTheory.ProjectiveResolution.extEquivCohomologyClass`
  (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`), and the scoped instance
  `ModuleCat.Algebra.instLinear`.
- Homology: `CategoryTheory.ShortComplex.ShortExact.δ` with `homology_exact₁`, `homology_exact₂`
  and `homology_exact₃`; `HomologicalComplex₂` and `HomologicalComplex₂.total`.
- Flat functors (Layer 2): `Subobject`, `imageSubobject`, `Limits.Sigma.desc`, `cokernel`,
  `CategoryTheory.Injective`, `PreservesFilteredColimitsOfSize`, the `AB5` instances
  (`Mathlib/Algebra/Category/Grp/AB.lean`); `IsFinitelyPresentable` with
  `IsFinitelyPresentable.exists_hom_of_isColimit` and
  `IsFinitelyPresentable.exists_eq_of_isColimit`, `ObjectProperty.isFinitelyPresentable`
  (`Mathlib/CategoryTheory/Presentable/Finite.lean`), `IsLocallyFinitelyPresentable` and
  `IsFinitelyAccessibleCategory` (`Mathlib/CategoryTheory/Presentable/LocallyPresentable.lean`);
  `IsCardinalPure` with `exists_colimitsOfShape_splitMonomorphisms_of_isCardinalPure`
  (`Mathlib/CategoryTheory/Presentable/CardinalPure.lean`) and `Cardinal.fact_isRegular_aleph0`;
  `ObjectProperty.IsCardinalFilteredGenerator` with
  `ObjectProperty.IsStrongGenerator.isDense_colimitsCardinalClosure_ι`,
  `IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable`,
  `ObjectProperty.colimitsCardinalClosure`,
  `IsCardinalLocallyPresentable.iff_exists_isStrongGenerator` and
  `ObjectProperty.isStrongGenerator_iff_exists_extremalEpi`
  (`Mathlib/CategoryTheory/Presentable/`, `Mathlib/CategoryTheory/Generator/StrongGenerator.lean`);
  `ObjectProperty.IsStableUnderRetracts`,
  `ObjectProperty.IsClosedUnderFiniteCoproducts`, `ObjectProperty.inverseImage`,
  `AdditiveFunctor.forget`; `ShortComplex.exact_iff_mono_cokernel_desc`;
  `IsFiltered`, `IsCofiltered`, `CostructuredArrow`, `Functor.Elements`,
  `Functor.isCofiltered_elements`, `Cocone`, `IsColimit`, `colimit`, `Functor.DenseAt`, `Retract`,
  `Functor.ofSequence`; `IsIndObject` with `isIndObject_iff` and
  `isIndObject_iff_preservesFiniteLimits`; `PreservesFiniteLimits`, `HasCokernels`,
  `HasFiniteBiproducts`; the weak-limit API `IsWeakLimit`, `Limits.HasWeakKernel`,
  `Limits.HasWeakKernels` and `KernelFork.ofι` (`Mathlib/CategoryTheory/Limits/WeakLimits/`), with
  `Pretriangulated.isWeakLimitKernelForkOfDistTriangle`
  (`Mathlib/CategoryTheory/Triangulated/WeakKernels.lean`); `Functor.IsHomological` with the scoped
  instances of `Pretriangulated.Opposite`; `RepresentablyFlat` (covariant; named only to mark the
  difference, 2.3).
- Morita equivalence: `IsMoritaEquivalent` and `MoritaEquivalence`
  (`Mathlib/RingTheory/Morita/Basic.lean`), for rings only.
- Dimensions: `CategoryTheory.projectiveDimension`, `CategoryTheory.HasProjectiveDimensionLT`,
  `CategoryTheory.HasProjectiveDimensionLE`, `projectiveDimension_le_iff`,
  `projectiveDimension_eq_bot_iff`, `CategoryTheory.injectiveDimension`,
  `CategoryTheory.HasInjectiveDimensionLE`; `HomologicalComplex.opcycles`, `QuasiIso`,
  `ChainComplex.single₀`; `CategoryTheory.IsNoetherianObject`
  (`Mathlib/CategoryTheory/Subobject/NoetherianObject.lean`); `IsCardinalPresentable` with
  `Cardinal.isRegular_aleph_one` (a local instance `Fact (Cardinal.aleph 1).IsRegular` in
  `Suggested.lean`). Mathlib has no global dimension, flat dimension or weak global dimension.
- Checks of Layers 3 and 4: `DualNumber`, `Matrix.blockTriangularSubalgebra`, and
  `CategoryTheory.Free` with `CategoryTheory.Free.embedding` (the `R`-linear category on a
  category, `Mathlib/Algebra/Category/ModuleCat/Adjunctions.lean`); `PowerSeries`, `LaurentSeries`
  with its `Algebra R⟦X⟧ R⸨X⸩` instance, `MvPolynomial`.
- Finitely generated projectives and perfect categories (0.8, Layer 4): `Mat_`,
  `CategoryTheory.Idempotents.Karoubi`, `IsIdempotentComplete`, `ObjectProperty.lift`,
  `ObjectProperty.homMk`, `HasFiniteBiproducts.of_hasFiniteProducts`, `Subobject` with its lattice
  and `ComplementedLattice`, `CategoryTheory.Simple`, `Functor.ofSequence`, `homOfLE`,
  `IsIdempotentElem.Corner`, `IsFiltered`. Mathlib has no semilocal, semiperfect or perfect rings,
  no T-nilpotence, no projective covers, no duality for `Karoubi` or `Mat_`, and no instance
  `HasFiniteBiproducts Cᵒᵖ`.
- Commutative counterparts: `TensorProduct` with `LinearMap.rTensor` and `LinearMap.lTensor`;
  `CategoryTheory.Tor` and `CategoryTheory.Tor'` on `ModuleCat R`; `Module.Flat` with
  `Module.Flat.iff_characterModule_injective`, `Module.Flat.iff_forall_isTrivialRelation`,
  `Module.Flat.exists_factorization_of_finitePresentation`,
  `Module.Flat.exists_factorization_of_comp_eq_zero_of_free` and
  `Module.Flat.projective_of_finitePresentation`;
  `CharacterModule` with `CharacterModule.homEquiv`, and `AddCircle`.
- Modules and rings: `Module.Projective`, `Module.Injective`, `Module.Baer` with
  `Module.Baer.injective`, `Module.FinitePresentation`, `Module.finitePresentation_of_finite`,
  `Module.Finite`, `Submodule.IsPrincipal`, `WellFoundedLT`, `Ring.jacobson`, `Module.jacobson`,
  `IsSemisimpleRing`, `IsSemiprimaryRing` with the instance `IsArtinianRing → IsSemiprimaryRing`
  (`Mathlib/RingTheory/Artinian/Module.lean`) and `IsSemiprimaryRing.isNoetherian_iff_isArtinian`,
  `IsNoetherianRing`, `IsArtinianRing`, `IsNoetherian`, `IsArtinian`, `IsLocalRing` with
  `IsLocalRing.maximalIdeal`, `IsNilpotent`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`,
  `MulOpposite`, `RingEquiv.opOp`, `RingEquiv.toOpposite`, `Module.compHom`,
  `IsScalarTower.of_algebraMap_smul`,
  `ModuleCat.restrictScalars`, `ModuleCat.restrictScalarsEquivalenceOfRingEquiv`, `AddCommGrpCat`,
  `isSimpleModule_iff_isCoatom`, `IsCompactElement`, `Submodule.fg_iff_compact`,
  `CompleteOrthogonalIdempotents`, `DFinsupp`.

### From Tau Ceti

- The balanced tensor product: `TauCeti.BalancedTensorProduct` with `tmul`, `balance`, `lift`,
  `hom_ext`, `induction_on`, `map` and `congr`
  (`TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic`); `lid` and `rid`
  (`...Balanced.Unit`); `finsuppScalarRight` (`...Balanced.Finsupp`); `assoc`
  (`...Balanced.Associator`).
- Character modules: `TauCeti.CharacterModule.eval_injective`
  (`TauCeti.Algebra.Module.CharacterModule`).
- Global dimension: `TauCeti.globalDimension` with `TauCeti.globalDimension_def`,
  `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE`, `TauCeti.globalDimension_le_tfae`,
  `TauCeti.globalDimension_eq_bot_iff` and `TauCeti.globalDimension_eq_zero_of_isSemisimpleRing`
  (`TauCeti.RingTheory.GlobalDimension`).
- Left derived functors: `CategoryTheory.NatTrans.leftDerived_add`,
  `CategoryTheory.Functor.isZero_leftDerived_succ` and
  `CategoryTheory.ShortComplex.ShortExact.leftDerivedOneIsoKernel`
  (`TauCeti.CategoryTheory.Abelian.LeftDerived`); the acyclic assembly lemma
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`TauCeti.Algebra.Homology.TotalComplex`) and the instance
  `HomologicalComplex₂.totalComplexShapeSymmetryDownNat`
  (`TauCeti.Algebra.Homology.ComplexShape.Signs`).
- `Tor` over commutative rings: the results on Mathlib's `Tor` and `Tor'` in
  `TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor` and `TauCeti.CategoryTheory.Monoidal.Tor`
  (1.6).
- Flat modules over commutative rings (2.3): `TauCeti.FiniteFreeModuleCat`,
  `TauCeti.finiteFreeModuleInclusion`, `TauCeti.FiniteFreeOver` and `TauCeti.flatModuleFilteredFree`
  (`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`), the last one a refactor consumer.
- Quivers and Morita theory (1.7): `TauCeti.quiverRepEquivalence`
  (`TauCeti.RepresentationTheory.Quiver.Representation.AsModule`), as the pattern;
  `TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`
  (`TauCeti.RepresentationTheory.Quiver.Kronecker.UpperTriangular`);
  `IsIdempotentElem.isMoritaEquivalent_corner` (`TauCeti.RingTheory.Morita.Corner`).
- The Jacobson radical: `TauCeti.isSemiprimaryRing_mulOpposite_iff`, the instance
  `TauCeti.IsSemiprimaryRing.mulOpposite`, `TauCeti.Ring.mem_jacobson_mulOpposite_iff` (4.1) and
  `TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`
  (`TauCeti.RingTheory.Jacobson.MulOpposite`); `TauCeti.isSemisimpleModule_quotient_smul_top`
  (`TauCeti.RingTheory.Jacobson.Semiprimary`).
- Ideals and the radical of a category (0.3, Layer 4): `TauCeti.MorphismIdeal` with its fields
  `comp_mem_left` and `comp_mem_right` (for the coercions to one-sided ideals),
  `TauCeti.MorphismIdeal.Quotient` and `quotientFunctor`
  (`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Basic`), its monoid structure
  (`...MorphismIdeal.Mul`) and `TauCeti.MorphismIdeal.op` (`...MorphismIdeal.Opposite`);
  `TauCeti.jacobsonRadicalIdeal` and `TauCeti.jacobsonRadical_self_eq_jacobson`
  (`TauCeti.CategoryTheory.Preadditive.Radical.Basic`);
  `TauCeti.exists_jacobsonRadicalIdeal_pow_eq_bot` (`...Radical.Nilpotent`).
- Essential epimorphisms and covers (Layer 4): `TauCeti.IsEssentialEpi` and its rigidity
  `TauCeti.IsEssentialEpi.isIso_of_comp_eq` (`TauCeti.CategoryTheory.Projective.Cover`);
  `TauCeti.isProjectiveCover_iff_forall_surjective`
  (`TauCeti.Algebra.Module.ProjectiveCover.Basic`).
- Finitely generated projective modules (0.8): `TauCeti.finiteProjectiveModules`
  (`TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`).
- Semiperfect rings: `TauCeti.IsSemiperfectRing` with the instance
  `TauCeti.IsSemiperfectRing.of_isSemiprimaryRing` (`TauCeti.RingTheory.Jacobson.Semiperfect`), a
  refactor consumer (4.2); `CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`
  (`TauCeti.RingTheory.Idempotents.Primitive.Decomposition`);
  `IsIdempotentElem.projective_span_singleton` (`TauCeti.RingTheory.Idempotents.Projective`).
- Projective covers: `TauCeti.IsSuperfluous` (refactored to lattices in 0.3),
  `TauCeti.IsSuperfluous.map` and `TauCeti.isSuperfluous_map_equiv_iff`
  (`TauCeti.Algebra.Module.Submodule.Superfluous`);
  `TauCeti.IsProjectiveCover`, `TauCeti.isProjectiveCover_id`,
  `TauCeti.IsProjectiveCover.exists_surjective`, `TauCeti.IsProjectiveCover.bijective_of_comp_eq`,
  `TauCeti.IsProjectiveCover.ker_le_jacobson` and `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`
  (`TauCeti.Algebra.Module.ProjectiveCover.Basic`); `TauCeti.exists_isProjectiveCover`
  (`...ProjectiveCover.Existence`);
  `TauCeti.isProjectiveCover_of_isSimpleModule_quotient_jacobson_smul_top`
  (`...ProjectiveCover.Simple`).
- The transpose and stable `Hom` (1.4): `TauCeti.AuslanderReitenTranspose`
  (`TauCeti.Algebra.Module.AuslanderReiten.Transpose`),
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel` with
  `auslanderReitenTransposeTensorEquivCokernel_map`
  (`TauCeti.Algebra.Module.AuslanderReiten.TensorCokernel`),
  `TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.projectiveStableFunctor` and
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom`
  (`TauCeti.Algebra.Category.ModuleCat.Projective.TensorHom`).
- Projective presentations: `TauCeti.FiniteProjectivePresentation` with `ofFinitePresentation`
  (`TauCeti.Algebra.Module.Projective.FinitePresentation`);
  `TauCeti.IsMinimalProjectivePresentation` and
  `TauCeti.IsProjectiveCover.isMinimalProjectivePresentation`
  (`TauCeti.Algebra.Module.MinimalProjectivePresentation.Basic`);
  `TauCeti.FiniteProjectivePresentation.exists_isMinimal`, for semiprimary Noetherian rings
  (`...MinimalProjectivePresentation.Finite`).

### From other roadmaps

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §0.2: Krull–Schmidt categories
  (`IsKrullSchmidt`, restated in `Suggested.lean` with the same statement) and Krause's criterion
  (an additive category is Krull–Schmidt exactly when idempotents split and endomorphism rings are
  semiperfect), which 4.2 restates with `IsSemiperfectCategory`; §0.3: uniqueness of
  decompositions into objects with local endomorphism rings, for the check of 0.8.

## How to read the build

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [0](#layer-0-modules-over-a-preadditive-category-and-their-tensor-product) | Modules over a preadditive category | Finite presentation by finite sums of representables, `Mod C` (abelian, Grothendieck), rings as `SingleObj Aᵐᵒᵖ`, tensor product over `C`, one-sided ideals, `I · M`, superfluous subobjects and `C ⧸ I`, projective factors, swap, ring API, duals, `proj C`, the duality `Hom(-, C)` and the comparison of the notions of finite presentation |
| [1](#layer-1-tor) | `Tor` | Left derived functor, long exact sequences, balance, `Tor` of the transpose, `Tor`–`Ext` duality, comparisons, `Tor₁` of cyclic modules, category algebras |
| [2](#layer-2-flat-modules-and-flat-functors) | Flat modules and flat functors | Ideal test, `Tor` and Lambek tests, Baer criterion, Lazard block, purity, flat = left exact, triangulated case, representation theorem, Bass's module, closure |
| [3](#layer-3-flat-dimension-global-and-weak-global-dimension) | Dimensions | Flat dimension, global dimension of an abelian category, Auslander's lemma, weak global dimension, symmetry, `FP_∞` lemma, Auslander's theorem, kernels and countably presented flat modules |
| [4](#layer-4-semiperfect-and-perfect-categories-and-basss-theorem-p) | Semiperfect and perfect categories | T-nilpotence of left ideals and Nakayama's lemma for all modules, semilocal and semiperfect categories and rings, the radical of a projective module, covers over semiperfect categories, perfect categories and left perfect rings, commutative and finite-length examples, covers over them, pure superfluous subobjects of projectives, Theorem P, global dimension and the Bass–Eilenberg criterion |

Each layer needs the previous ones; the ring items of 4.2 need only Mathlib and Tau Ceti. A name in
parentheses is the proposed Lean name of a headline declaration; auxiliary names are for the
implementer to choose.

## Layer 0: modules over a preadditive category and their tensor product

Throughout, `C : Type u` is preadditive with `Category.{v} C`, modules take values in
`AddCommGrpCat.{w}`, and `R` is a commutative ring.

### 0.1 `Mod C`

We define `TauCeti.ModCat C := Cᵒᵖ ⥤+ AddCommGrpCat.{w}`; covariant additive functors are the
objects of `TauCeti.ModCat Cᵒᵖ`.

- **Finite presentation by finite sums of representables**, the first target (`TauCeti.matrixMap`,
  `TauCeti.exists_eq_matrixMap`, `TauCeti.IsFinitelyGeneratedFunctor`,
  `TauCeti.IsFinitelyPresentedFunctor`, `TauCeti.isFinitelyPresentedFunctor`,
  `TauCeti.IsFinitelyPresentedFunctor.additive`). A functor `F : Cᵒᵖ ⥤ AddCommGrpCat.{v}` is
  finitely generated if it is a quotient of a finite sum of representables
  `Hom(-, Y₁) ⊕ ⋯ ⊕ Hom(-, Yₙ)`, and finitely presented if it is the cokernel of a map between two
  such finite sums, expressed as an exact sequence. By the Yoneda lemma, every morphism between
  finite sums of representables arises from a matrix of morphisms in `C`; `matrixMap` constructs
  this map. When `C` has finite biproducts, a single representable suffices at each stage
  (`TauCeti.isFinitelyGeneratedFunctor_iff_exists_epi`,
  `TauCeti.isFinitelyPresentedFunctor_iff_exists_hom`), whereas in general it does not (over `ℤ`,
  `ℤ²` is not a quotient of `ℤ`).

  For the basic closure API, the zero functor is finitely presented as the cokernel of empty sums
  without requiring `C` to be nonempty (`ObjectProperty.ContainsZero`). Finitely presented functors
  are closed under cokernels and finite coproducts without assuming biproducts in `C`
  (`ObjectProperty.IsClosedUnderCokernels` and `ObjectProperty.IsClosedUnderFiniteCoproducts`: maps
  lift to the presenting sums, and finite coproducts of presentations are indexed by disjoint unions
  via block matrices), as well as under retracts (`ObjectProperty.IsStableUnderRetracts`, writing
  the retract associated to an idempotent `e` as `coker(𝟙 - e)`). Statements on finite presentation
  take values in `ModCat.{v} C`, where the representables live (Convention 3); Section 0.8 compares
  this notion with `proj C`, Mathlib's `IsFinitelyPresentable`, and `Module.FinitePresentation`.

  This definition replaces Tau Ceti's single-representable predicates without compatibility shims.
  Closure under cokernels and finite sums carries over without biproducts, the single-representable
  quotient characterization holds under finite biproducts, and zero is finitely presented without a
  nonempty category. Existing Tau Ceti consumers assume finite biproducts, abelianness, or
  Krull–Schmidt structure, so their statements keep the same mathematical meaning while their proofs
  are migrated to finite sums. Completing this refactor and rebuilding its consumers is the first
  milestone, ahead of 0.8 and Layer 2.
- **Abelian structure.** Inside `D ⥤ AddCommGrpCat`, the additive functors (`additiveFunctor`)
  contain zero and are closed under kernels, cokernels, and finite products, all computed objectwise
  (`ObjectProperty.ContainsZero`, `ObjectProperty.IsClosedUnderKernels`,
  `ObjectProperty.IsClosedUnderCokernels`, `ObjectProperty.IsClosedUnderFiniteProducts`). Mathlib's
  full-subcategory instance therefore equips `Mod C`—and hence `Mod Cᵒᵖ`—with an abelian structure
  for every `C`. Additive functors are likewise closed under colimits
  (`ObjectProperty.IsClosedUnderColimitsOfShape`, since colimits commute with finite biproducts), so
  `Mod C` inherits the colimits of `AddCommGrpCat` (used in Layer 2).
- **Representables** (`TauCeti.ModCat.yoneda : C ⥤ ModCat.{v} C`, induced by `preadditiveYoneda`).
  Each representable `Hom(-, X)` is projective because `Hom(Hom(-, X), F) ≅ F(X)` by the Yoneda
  lemma, allowing maps out of `Hom(-, X)` to lift across epimorphisms. When `C` satisfies
  `EssentiallySmall.{w}`, every module is a quotient of a coproduct of representables indexed over a
  small model of `C` (Convention 3), giving enough projectives in `Mod C` ([Mitchell, §3,
  pp. 15–18], stated covariantly and applied to `Cᵒᵖ`). Over `Cᵒᵖ`, `(ModCat.yoneda Cᵒᵖ).obj (op X)`
  is the covariant representable `Hom(X, -)` (avoiding `preadditiveCoyoneda`, Convention 1).
- **Grothendieck structure** (an instance `IsGrothendieckAbelian.{w} (ModCat.{w} C)` under
  `EssentiallySmall.{w} C`). Local smallness, filtered colimits, and AB5 hold objectwise from
  colimit closure and Mathlib's functor-category instances, while the coproduct of representables
  provides a separator (modeled on `Mathlib/CategoryTheory/Generator/Presheaf.lean`). Mathlib then
  supplies enough injectives (`IsGrothendieckAbelian.enoughInjectives`, used in 3.2), the `HasExt`
  instance `IsGrothendieckAbelian.hasExt`, and `IsGrothendieckAbelian.generatingMonomorphisms_rlp`
  (right lifting against subobjects of a separator implies lifting against all monomorphisms, giving
  a single-separator Baer criterion alongside the representable Baer criterion of 2.2).
- **Subobject lattices**, under `EssentiallySmall.{w} C` (`WellPowered.{w} (ModCat.{w} C)` via
  `IsGrothendieckAbelian.wellPowered`, together with instances `IsModularLattice (Subobject M)` and
  `IsCompactlyGenerated (Subobject M)`). Well-poweredness gives `Subobject M` a complete lattice
  structure; modularity holds objectwise, and the lattice is compactly generated with finitely
  generated subobjects as compact elements. Neither Mathlib nor Tau Ceti currently provides these
  functor-category instances, which Section 4.2 uses.
- **Maximal subobjects** (`TauCeti.ModCat.exists_isCoatom_of_isFinitelyGeneratedFunctor`), for any
  `C` without smallness hypotheses. Every nonzero finitely generated module `M` admits a maximal
  proper subobject, i.e., a coatom of `Subobject M` (which is a partial order with `⊤` in any
  category). To prove this without well-poweredness, apply Zorn's lemma (`zorn_le_nonempty₀`) to the
  poset of proper additive subfunctors of `M` (objectwise subgroups closed under the maps `M(f)`),
  ordered by inclusion above `0`. The objectwise union of a nonempty chain of proper additive
  subfunctors is again an additive subfunctor, and it remains proper because if it equaled `M` the
  finitely many generators of `M` would already lie in a single member of the chain. Any maximal
  proper subfunctor yields the desired coatom, which Section 4.1 uses for Nakayama's lemma on
  finitely generated modules.
- **`R`-linear structure** (`TauCeti.Functor.objModule`, `TauCeti.Functor.toModuleCat`, and an
  instance `Linear R (ModCat C)`). When `C` satisfies `Linear R C`, each `r ∈ R` acts on `F(c)` via
  `F(r • 𝟙 c)`. Every map `F(f)` is then `R`-linear, promoting `F` to a functor into `ModuleCat R`,
  every natural transformation is `R`-linear, and `Mod C` becomes `R`-linear via
  `(r • α)_c = r • α_c` (and likewise `Mod Cᵒᵖ` via `Linear.oppositeCategory`). As noted in
  [Mitchell, §11, p. 51] (covariant, applied to `Cᵒᵖ`), over an `R`-linear category `C` the
  `R`-linear functors to `R`-modules coincide with the additive functors to abelian groups.
- **Inclusion `mod C ⊆ Mod C`** (`TauCeti.isFinitelyPresentedFunctor_le_additiveFunctor`, with
  inclusion functor `TauCeti.ModCat.ιFinitelyPresented` at `w = v`). Since finitely presented
  functors define an `ObjectProperty` on `Cᵒᵖ ⥤ AddCommGrpCat.{v}` and every finitely presented
  functor is additive, the inclusion reduces to an inequality of object properties.

**Checks.**

- For the `k`-linear category of the quiver `1 → 2` (with `Hom(1, 2) = k` as the only non-identity
  morphism space), a module in `Mod C` is a linear map `V₂ → V₁`, and the representables `Hom(-, 1)`
  and `Hom(-, 2)` are the indecomposable projectives `0 → k` and `k → k`; covariant functors
  (`Mod Cᵒᵖ`) are representations `V₁ → V₂`.
- For `C = SingleObj Aᵐᵒᵖ`, `Mod C` is equivalent to `ModuleCat A` (0.2) and finite presentation in
  the finite-sum sense matches `Module.FinitePresentation` (0.8); over `ℤ`, `ℤ²` is finitely
  presented in this sense, though not via single representables.

*Needs:* Mathlib `additiveFunctor`, the closure classes (with `ObjectProperty.ContainsZero`,
`ObjectProperty.IsClosedUnderFiniteCoproducts`, and `ObjectProperty.IsStableUnderRetracts`) and the
full-subcategory abelian instance, `preadditiveYoneda`, `Linear`, `Linear.oppositeCategory`,
`EssentiallySmall`, `IsGrothendieckAbelian`, `IsGrothendieckAbelian.wellPowered`, `WellPowered`,
`IsModularLattice`, `IsCompactlyGenerated`, `IsCoatom`, `zorn_le_nonempty₀`.

### 0.2 Rings as one-object categories

For a ring `A`, Mathlib's `SingleObj A` is preadditive with composition `f ≫ g = g * f`. Under
Convention 4, `A` enters as `SingleObj Aᵐᵒᵖ`, where `f ≫ g = op (unop f * unop g)`.

- **Equivalences with module categories**
  (`TauCeti.moduleCatEquivModCat A : ModuleCat.{v} A ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)` and
  `TauCeti.moduleCatMulOppositeEquivModCatOp A :
  ModuleCat.{v} Aᵐᵒᵖ ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)ᵒᵖ`).
  New to both Mathlib and Tau Ceti, these equivalences hold in every module universe `v` on the
  pattern of `Action.functorCategoryEquivalence`. A left `A`-module `M` corresponds to the functor
  taking value `M` at `∗` with `op a` acting as left multiplication by `a` (`F(a b) = F(a) ∘ F(b)`,
  Convention 4), and the regular modules correspond to `Hom(-, ∗)` and `Hom(∗, -)`
  (`TauCeti.moduleCatEquivModCatRegularIso`, `TauCeti.moduleCatMulOppositeEquivModCatOpRegularIso`).
  This matches [ML, IX.6, p. 226], while `CategoryTheory.Mat.equivalenceSingleObj :
  Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)` provides Mathlib's precedent for passing to `Rᵐᵒᵖ`.
- **Opposite equivalence**
  (`TauCeti.singleObjMulOppositeEquiv A : SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ`). This is an additive
  equivalence (not yet in Mathlib); applied to `Aᵐᵒᵖ`, it identifies `SingleObj Aᵐᵒᵖᵐᵒᵖ` with
  `(SingleObj Aᵐᵒᵖ)ᵒᵖ` for the ring-level swap in 1.3.
- **`R`-linearity** (an instance `Linear R (SingleObj A)` for an `R`-algebra `A`, not yet in
  Mathlib), with scalar multiplication `r • a` given by the algebra action. Via
  `MulOpposite.instAlgebra` this applies to `SingleObj Aᵐᵒᵖ`, and at `∗` the derived `R`-module
  structure of 0.1 agrees with scalar restriction along `algebraMap R A`
  (`TauCeti.moduleCatEquivModCatToModuleCatIso`).
- **Smallness instances.** `SingleObj A` is `EssentiallySmall.{v}` whenever `[Small.{v} A]`, and
  `Small.{v} A` implies `Small.{v} Aᵐᵒᵖ` (`TauCeti.small_mulOpposite`), rendering explicit
  `[Small.{v} Aᵐᵒᵖ]` binders in Tau Ceti redundant (Downstream consumers).
- **Transfer lemmas.** Added as later layers require them, these lemmas show that the equivalences
  preserve and reflect projectivity, exactness, finite generation, and finite presentation, and
  transport `Tor`, flatness, and homological dimensions once defined in Layers 1–3.

**Checks.**

- For `A = k[x]`, a module over `SingleObj Aᵐᵒᵖ` is a `k`-vector space with an endomorphism.
- `SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ` acts as the identity on the unique object and as `op a ↦ op a`
  on morphisms.
- Over a noncommutative ring `A`, a contravariant functor on `SingleObj A` itself satisfies
  `F(a b) = F(b) ∘ F(a)` and is therefore a right module; hence `A` enters as `SingleObj Aᵐᵒᵖ`.

*Needs:* 0.1; Mathlib `SingleObj`, `SingleObj.comp_as_mul`, `Action.functorCategoryEquivalence`,
`MulOpposite.instAlgebra`, `CategoryTheory.Mat.equivalenceSingleObj` (precedent).

### 0.3 The tensor product over `C`

For a covariant functor `G : Mod Cᵒᵖ` and a module `F : Mod C`, the tensor product `G ⊗_C F`
(`TauCeti.ModCat.tensorObj G F`) is defined as the coend in `AddCommGrpCat` of `G(c') ⊗_ℤ F(c)`
(Convention 2), using Mathlib's `CategoryTheory.Limits.coend` when `[EssentiallySmall.{w} C]` (which
Mathlib passes automatically to `Cᵒᵖ`) rather than a hand-built quotient. Following `M ⊗_A N`, the
covariant factor `G` comes first (Convention 6); in `Suggested.lean`, the underlying bifunctor
`(x, y) ↦ G(x) ⊗_ℤ F(y)` (`TauCeti.tensorBifunctor`) is written on `Dᵒᵖ × D` and specialized at
`D = Cᵒᵖ`, so the coend runs over `Cᵒᵖ`. Concretely, `G ⊗_C F` is the quotient of `⊕_c G(c) ⊗ F(c)`
by the relations `x ⊗ F(f) y - G(f) x ⊗ y` for `f : c → c'` ([Mitchell, §6, pp. 26–27, and §11,
p. 52]; [ML, IX.6, pp. 226–227], written there for rings with covariant left modules and the
contravariant factor first, Convention 14).

- **Pure tensors and universal property:** pure tensors `x ⊗ y` at `c` (`TauCeti.ModCat.tmul`), the
  balancing relation `x ⊗ F(f) y = G(f) x ⊗ y` (`TauCeti.ModCat.tmul_balance`), induction
  (`TauCeti.ModCat.tensorObj_induction_on`), extensionality (`TauCeti.ModCat.tensorObj_hom_ext`),
  and lifting of balanced families of biadditive maps (`TauCeti.ModCat.tensorLift`,
  `tensorLift_tmul`).
- **Bifunctor** (`TauCeti.ModCat.tensor : ModCat Cᵒᵖ ⥤ ModCat C ⥤ AddCommGrpCat`): additive in each
  argument, with `simp` lemmas `tensor_map_app_tmul` and `tensor_obj_map_tmul` on pure tensors.
- **`R`-module structure**, for `R`-linear `C` (`Module R (G ⊗_C F)`,
  `TauCeti.ModCat.smul_eq_tensor_obj_map`, `TauCeti.ModCat.smul_eq_tensor_map_app`,
  `TauCeti.ModCat.smul_tmul`, `TauCeti.ModCat.tmul_smul`): `r ∈ R` acts as `G ⊗_C (r • 𝟙 F)` (which
  equals `(r • 𝟙 G) ⊗_C F`), satisfying `r • (x ⊗ y) = (r x) ⊗ y = x ⊗ (r y)` for the derived
  actions of 0.1, modeled on `Abelian.Ext.smul_eq_comp_mk₀` ([Mitchell, §11, p. 52] notes that over
  a `K`-category the `K`-linear tensor product has the same underlying abelian group). The induced
  maps `G ⊗_C f` and `g ⊗_C F` are `R`-linear.
- **Adjunctions** (`TauCeti.ModCat.tensorAdjunction`, `TauCeti.ModCat.tensorAdjunction'`): natural
  isomorphisms `Hom(G ⊗_C F, X) ≅ Hom_{Mod C}(F, Hom_ℤ(G(-), X))` and
  `Hom(G ⊗_C F, X) ≅ Hom_{Mod Cᵒᵖ}(G, Hom_ℤ(F(-), X))`, whose right adjoints arise from
  `TauCeti.ModCat.homBifunctor` and `TauCeti.ModCat.homOpBifunctor` (partially applied as
  `homFunctor` and `homOpFunctor`). See [Mitchell, §6, p. 26, (2)] and [St, Thm. 1, pp. 355–356]
  (extending a theorem of Watts); the functor tensor product goes back to N. Yoneda, *On Ext and
  exact sequences*, J. Fac. Sci. Univ. Tokyo Sect. I 8 (1960), 507–576, §4.1, p. 548 (contravariant
  factor first, defined via the "integration" or coend of §4.0, pp. 545–546, with adjunctions
  (4.1.3)–(4.1.4) and explicit quotient presentation on pp. 548–549). For an `R`-linear `C` and an
  `R`-module `X` (`TauCeti.ModCat.tensorLinearHomEquiv`, `TauCeti.ModCat.tensorLinearHomEquiv'`),
  this upgrades to `Hom_R(G ⊗_C F, X) ≃ₗ[R] Hom(F, Hom_R(G(-), X))` and its mirror via
  `TauCeti.ModCat.linearHomBifunctor` and `TauCeti.ModCat.linearHomOpBifunctor` (modeled on
  `linearYoneda`; cf. [OR, (1.1), p. 93] over a commutative base ring).
- **Right exactness** (`TauCeti.ModCat.preservesColimits_tensor_obj`,
  `TauCeti.ModCat.preservesColimits_tensor_flip_obj`): by the adjunctions, each partial tensor
  functor preserves all colimits, and in particular is right exact and preserves coproducts.
- **Yoneda isomorphisms** (`TauCeti.ModCat.tensorObjYonedaIso`, `TauCeti.ModCat.yonedaTensorObjIso`,
  with `simp` lemmas `TauCeti.ModCat.tensorObjYonedaIso_hom_tmul` and
  `TauCeti.ModCat.yonedaTensorObjIso_hom_tmul`): `G ⊗_C Hom(-, X) ≅ G(X)` via `x ⊗ f ↦ G(f)(x)` and
  `Hom(X, -) ⊗_C F ≅ F(X)` via `f ⊗ y ↦ F(f)(y)` ([Mitchell, §6, p. 26, (1)]), both `R`-linear when
  `C` is `R`-linear.
- **One-sided ideals** (`TauCeti.LeftMorphismIdeal C`, `TauCeti.RightMorphismIdeal C`, with partial
  orders, `le_def`, `TauCeti.LeftMorphismIdeal.orderIsoSubobject`, and
  `TauCeti.RightMorphismIdeal.orderIsoSubobject`). A **left ideal** of `C` is a family of additive
  subgroups `I(X, Y) ⊆ (X ⟶ Y)` closed under precomposition (`h ≫ f ∈ I` whenever `f ∈ I`),
  equivalently a choice of subfunctor `I(-, Y) ⊆ Hom(-, Y)` in `Mod C` for each `Y`. A **right
  ideal** is closed under postcomposition (`f ≫ h ∈ I`), equivalently a subfunctor
  `I(X, -) ⊆ Hom(X, -)` for each `X`, and corresponds to a left ideal of `Cᵒᵖ`
  (`TauCeti.RightMorphismIdeal.op`). Neither notion is in Mathlib or Tau Ceti (Mathlib's `Sieve` is
  non-additive); Tau Ceti's two-sided `TauCeti.MorphismIdeal` coerces to both via
  `TauCeti.MorphismIdeal.toLeftMorphismIdeal` and `TauCeti.MorphismIdeal.toRightMorphismIdeal`
  (retaining Tau Ceti's field names `comp_mem_left` and `comp_mem_right`).

  In [Mitchell, §3, p. 18] and [OR, pp. 93–96], right or left ideals are defined at a single object
  as subfunctors of `Hom(X, -)` or `Hom(-, Y)`. Here those appear as **ideals supported at one
  object** (`TauCeti.LeftMorphismIdeal.ofSubobject`, `TauCeti.RightMorphismIdeal.ofSubobject`, with
  `orderIsoSubobject_ofSubobject`): a subfunctor `S` of `Hom(-, Y)` (respectively `Hom(X, -)`)
  extends by `0` at all other objects to a left (respectively right) ideal, and every one-sided
  ideal decomposes into these objectwise components so that single-representable statements can use
  `Subobject` directly. In particular, the principal right ideal generated by `g : X → Y` is
  `g C = {g ≫ h}` (`TauCeti.RightMorphismIdeal.principal`), supported at `X` as the image of
  `Hom(Y, -) → Hom(X, -)`.

  **Rings**
  (`TauCeti.idealOrderIsoLeftMorphismIdeal A : Ideal A ≃o LeftMorphismIdeal (SingleObj Aᵐᵒᵖ)` and
  `TauCeti.submoduleOrderIsoRightMorphismIdeal A :
  Submodule Aᵐᵒᵖ A ≃o RightMorphismIdeal (SingleObj Aᵐᵒᵖ)`): both send `J` to `{f | unop f ∈ J}`.
  By `SingleObj.comp_as_mul`, `h ≫ f = f * h = op (unop h * unop f)` in `Aᵐᵒᵖ`, so precomposition
  closure is left-ideal closure and postcomposition closure is right-ideal closure (proved directly
  in `Suggested.lean`), and the principal right ideal of `op a` corresponds to `aA`.
- **Superfluous elements** (`TauCeti.IsSuperfluous`, `IsSuperfluous.mono`, `IsSuperfluous.sup`,
  `IsSuperfluous.eq_bot_of_isCompl`, `TauCeti.isEssentialEpi_iff_isSuperfluous_kernelSubobject`).
  This refactors Tau Ceti's `TauCeti.IsSuperfluous` from `Submodule R M` to any lattice with `⊤`
  (`a ⊔ b = ⊤ → b = ⊤`, absent from Mathlib), recovering submodules as a special case. Finite
  suprema of superfluous elements are superfluous, any complemented superfluous element equals `⊥`,
  and an epimorphism `p` in an abelian category satisfies `TauCeti.IsEssentialEpi p` if and only if
  `kernelSubobject p` is superfluous.
- **Action of ideals on modules** (`TauCeti.LeftMorphismIdeal.smul`,
  `TauCeti.LeftMorphismIdeal.range_smul_arrow_app`, `TauCeti.LeftMorphismIdeal.smul_mono`,
  `TauCeti.LeftMorphismIdeal.smul_sigma`, `TauCeti.LeftMorphismIdeal.quotientSmul`). For a left
  ideal `I` of `C` and `M : Mod C`, `I · M` is the subobject of `M` whose value at `c` is the
  subgroup generated by all `M(f)(x)` with `f ∈ I(c, d)` and `x ∈ M(d)`; precomposition closure
  gives `M(h)(M(f)(x)) = M(h ≫ f)(x)` with `h ≫ f ∈ I`, so `I · M` is an additive subfunctor. Under
  `SingleObj Aᵐᵒᵖ`, a left ideal `J` of `A` acts as `J • ⊤`. Because `M(f)` acts componentwise on
  coproducts, `I · (⊕ Pᵢ) = ⊕ I · Pᵢ` (used in 4.4), and `M ⧸ I · M` is defined as the cokernel of
  `I · M ⟶ M`.
- **Restriction along `C ⥤ C ⧸ I` and reduction modulo `I`**, for a two-sided ideal `I`
  (`TauCeti.MorphismIdeal.restrictModCat : ModCat (C ⧸ I) ⥤ ModCat C`,
  `TauCeti.MorphismIdeal.restrictModCat_essImage_iff`,
  `TauCeti.MorphismIdeal.quotientSmulFunctor : ModCat C ⥤ ModCat (C ⧸ I)`,
  `TauCeti.MorphismIdeal.quotientSmulAdjunction`,
  `TauCeti.MorphismIdeal.restrictModCatQuotientSmulFunctorIso`,
  `TauCeti.MorphismIdeal.quotientSmulAdjunction_unit_app_comp`). Restriction along
  `TauCeti.MorphismIdeal.quotientFunctor` embeds `ModCat (C ⧸ I)` fully and faithfully into
  `ModCat C` with essential image `{M | I · M = 0}`. Its left adjoint `M ↦ M ⧸ I · M` has unit
  equal to the quotient map `M ⟶ M ⧸ I · M` (a `simp` lemma) and invertible counit, so reduction
  modulo `I` preserves all colimits (in particular coproducts and epimorphisms). Specializing to
  `I = J(C)` produces modules over the semisimple quotient `C ⧸ J(C)` in 4.4 and 4.5.
- **Quotients and tensor products** (`TauCeti.MorphismIdeal.quotientYoneda`,
  `TauCeti.ModCat.tensorObjCokernelIso`, `TauCeti.ModCat.tensorObjQuotientYonedaIso`). For a
  subfunctor `S ⊆ Hom(X, -)` (a right ideal at `X`), right exactness and Yoneda give
  `(Hom(X, -) ⧸ S) ⊗_C M ≅ M(X) ⧸ (S · M)(X)`, where `(S · M)(X)` is generated by `M(f)(x)` for
  `f ∈ S` ([OR, Lemma 1.2, p. 94], stated covariantly and applied to `Cᵒᵖ`); Section 2.3 uses this
  when `S` is finitely generated. For a two-sided ideal `I`, pulling back representables of `C ⧸ I`
  defines `(C ⧸ I)(-, X)` in `Mod C` and `(C ⧸ I)(X, -)` in `Mod Cᵒᵖ` (using
  `TauCeti.MorphismIdeal.op I`), yielding `(C ⧸ I)(X, -) ⊗_C M ≅ (M ⧸ I · M)(X)` for 4.6, while 4.1
  uses `I · M` for Nakayama's lemma.

**Checks.**

- For `C = SingleObj Aᵐᵒᵖ`, Section 0.6 identifies `G ⊗_C F` with `M ⊗_A N` in the same factor
  order.
- In the quiver example of 0.1, `Hom(1, -) ⊗_C F ≅ F(1)` by Yoneda.
- For a noncommutative ring `A` and `a ∈ A`, the left ideal `Aa` corresponds in `SingleObj Aᵐᵒᵖ` to
  `{op (b a)}`, which is closed under precomposition (`op c ≫ op (b a) = op (c b a)`) but not in
  general under postcomposition.
- For the `ℤ`-module `ℚ` and the ideal `2ℤ`, `2ℤ · ℚ = ℚ` is not superfluous in `ℚ`; Nakayama's
  lemma for arbitrary modules fails because `2ℤ` is not T-nilpotent (4.1).

*Needs:* 0.1, 0.2; Mathlib `coend`, `HasCoend`, `TensorProduct`, `AddMonoidHom.toIntLinearMap`,
`Adjunction.leftAdjoint_preservesColimits`, `SingleObj.comp_as_mul`, `CategoryTheory.unopHom`,
`Subobject`, `kernelSubobject`, `imageSubobject`, `Limits.Sigma.map`, `Adjunction`,
`linearYoneda` (pattern); Tau Ceti `TauCeti.MorphismIdeal`, its quotient and
`TauCeti.MorphismIdeal.op`, `TauCeti.IsEssentialEpi`, `TauCeti.IsSuperfluous` (refactored).

### 0.4 Projective factors

If `F` is projective in `Mod C`, then `- ⊗_C F` preserves monomorphisms, and symmetrically for a
projective covariant functor (`TauCeti.ModCat.mono_tensor_map_app_of_projective`,
`TauCeti.ModCat.mono_tensor_obj_map_of_projective`; [Mitchell, Prop. 10.1 and Cor. 10.2, p. 47],
for contravariant functors as here). For the proof, Yoneda (0.3) identifies `g ⊗_C Hom(-, X)` with
`g` evaluated at `X`, preservation of coproducts (0.3) extends this to coproducts of representables,
and every projective object is a retract of such a coproduct (0.1). Layer 2 refers to this result as
the flatness of projective modules.

*Needs:* 0.1, 0.3.

### 0.5 The swap

An object `G` of `Mod Cᵒᵖ` is already a module over `Cᵒᵖ`, while `F : Mod C` corresponds to an
object of `Mod Cᵒᵖᵒᵖ` under the equivalence `ModCat.opOpEquiv : Mod C ≌ Mod Cᵒᵖᵒᵖ`
(`TauCeti.ModCat.opOpEquiv`) induced by Mathlib's `opOpEquivalence`. Because `opOpEquiv` is an
equivalence, it preserves and reflects exactness, projectivity, and homological dimensions, and
identifies suprema over `Mod Cᵒᵖᵒᵖ` with suprema over `Mod C` (3.3, 4.6). On coends, `x ⊗ y ↦ y ⊗ x`
induces a natural isomorphism `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G` (`TauCeti.ModCat.tensorObjSwapIso`, `R`-linear
when `C` is `R`-linear; cf. [Mitchell, §6, p. 26], where `G ⊗ F` is defined as `F ⊗ G`), compatible
with `tmul`, `tensorLift`, and the adjunctions. Consequently, results in the covariant variable
follow from the corresponding `Mod C` results applied to `Cᵒᵖ` (using `Linear.oppositeCategory` and
preservation of `EssentiallySmall` under `Cᵒᵖ`). Combining this with
`TauCeti.singleObjMulOppositeEquiv` (0.2) and the comparison of 0.6 also yields the ring swap in
0.6.

*Needs:* 0.3; Mathlib `opOpEquivalence`, `Linear.oppositeCategory`.

### 0.6 Rings: the balanced tensor product

For an `R`-algebra `A`, ring-level tensor products use Tau Ceti's native types (Convention 5).

- **Action on morphisms** (`TauCeti.BalancedTensorProduct.rTensor R N f`,
  `TauCeti.BalancedTensorProduct.lTensor R M g`). Named after Mathlib's `LinearMap.rTensor` and
  `LinearMap.lTensor`, these specialize `BalancedTensorProduct.map` with one identity map so that an
  `Aᵐᵒᵖ`-linear map `f : M → M'` induces an `R`-linear map `f ⊗ N`, and symmetrically for `M ⊗ g`.
  The API provides `simp` lemmas on pure tensors (`rTensor_tmul`, `lTensor_tmul`), functoriality
  (`rTensor_id`, `rTensor_comp`, `lTensor_id`, `lTensor_comp`), and interchange
  (`rTensor_comp_lTensor`).
- **Bifunctor** (`TauCeti.BalancedTensorProduct.functor R A :
  ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`). This bifunctor is additive in each
  argument, using scalar actions induced via `algebraMap` on bundled modules (a local instance in
  `Suggested.lean`); at the regular modules `A`, `lid` and `rid` identify it with restriction of
  scalars along `algebraMap R A`.
- **Adjunction and right exactness** (`TauCeti.BalancedTensorProduct.adjunction R A N`). The functor
  `- ⊗_A N` is left adjoint to `Hom_R(N, -)` (`TauCeti.BalancedTensorProduct.homRight`, taking `X`
  to the right module `MatlisDual R X N`), and symmetrically in the other variable. Right exactness
  and preservation of coproducts and colimits follow immediately (`rTensor_exact`,
  `rTensor_surjective`, `lTensor_exact`, `lTensor_surjective`; cf. [Lam-FC, (24.20), p. 365], stated
  without proof).
- **Projective factors** (`TauCeti.BalancedTensorProduct.lTensor_injective_of_projective`,
  `TauCeti.BalancedTensorProduct.rTensor_injective_of_projective`). Tensoring with a projective left
  or right module preserves injective maps, proved either via 0.4 and the categorical comparison
  below or directly from free modules (`finsuppScalarRight` and its mirror) by passing to retracts.
- **Swap** (`TauCeti.BalancedTensorProduct.comm`). Viewing a left `A`-module `N` as a right
  `Aᵐᵒᵖ`-module via `RingEquiv.opOp A`, `m ⊗ n ↦ n ⊗ m` gives a natural `R`-linear equivalence
  `M ⊗_A N ≃ₗ[R] N ⊗_{Aᵐᵒᵖ} M`, allowing paired left- and right-module results to be proved once and
  transported.
- **Independence of `R` and change of base** (`TauCeti.BalancedTensorProduct.intAddEquiv`,
  `TauCeti.BalancedTensorProduct.changeBaseAddEquiv`). Because `BalancedTensorProduct` takes the
  base ring `R` as a parameter, we record explicitly that `M ⊗_A N` has the same underlying additive
  group over `ℤ` and over `R`, and that along `R → R' → A` the `R`- and `R'`-balanced tensor
  products of `R'`-modules are `R`-linearly isomorphic via `m ⊗ n ↦ m ⊗ n`.
- **Categorical comparison** (`TauCeti.BalancedTensorProduct.tensorObjSingleObjIso`). Under
  `[Small.{v} A]`, the tensor product over `SingleObj Aᵐᵒᵖ` (0.3) of the corresponding functors from
  0.2 is naturally isomorphic to `M ⊗_A N` over `ℤ` in the same factor order, sending `x ⊗ y` at
  `∗` to `m ⊗ n`. When `A` is an `R`-algebra, this isomorphism is `R`-linear for the `Module R`
  instance of 0.3 via `intAddEquiv` and the `R`-action comparison of 0.2.
- **Commutative rings** (`TauCeti.BalancedTensorProduct.equivTensorProduct`). Over a commutative
  ring `R`, equipping `M` with `op r • m = r • m` (`[IsCentralScalar R M]`) yields
  `M ⊗_R N ≃ₗ[R] M ⊗[R] N` via `m ⊗ n ↦ m ⊗ₜ n` (`equivTensorProduct_tmul`), leaving existing users
  of `BalancedTensorProduct` untouched.
- **Duals** (`TauCeti.MatlisDual`, `TauCeti.BalancedTensorProduct.homEquiv`). As the ring
  counterpart of 0.7, `MatlisDual R E N = Hom_R(N, E)` is defined as a type synonym of `N →ₗ[R] E`
  so that the precomposition right `A`-action `(φ a)(n) = φ(a n)` on a left `A`-module `N` stays
  separate from any action on `E` (registered at low instance priority so that the value action is
  preferred when `A = R`). For every `R`-module `E`,
  `Hom_R(M ⊗_A N, E) ≃ₗ[R] Hom_{Aᵐᵒᵖ}(M, MatlisDual R E N)`.
  At `R = ℤ` and `E = ℚ ⧸ ℤ`
  (`TauCeti.BalancedTensorProduct.rTensor_injective_iff_surjective_comp`), a map `i : M → M'` of
  right `A`-modules satisfies `Function.Injective (i ⊗ N)` if and only if precomposition
  `(M' →ₗ[Aᵐᵒᵖ] N⁺) → (M →ₗ[Aᵐᵒᵖ] N⁺)` is surjective, because characters separate nonzero elements
  (`TauCeti.CharacterModule.eval_injective`; [Lambek, Prop. 1, p. 241]).

**Checks.**

- For a right ideal `I : Submodule Aᵐᵒᵖ A`, right exactness on `0 → I → A → A ⧸ I → 0` and `lid`
  identify `(A ⧸ I) ⊗_A N` with the quotient of `N` by the subgroup generated by `{a • n | a ∈ I}`;
  over `ℤ`, this recovers `ℤ ⧸ m ⊗_ℤ ℤ ⧸ n ≃+ ℤ ⧸ gcd(m, n)`.
- `ℤ ⧸ 2 ⊗_ℤ (2ℤ → ℤ)` is zero whereas `ℤ ⧸ 2 ⊗_ℤ 2ℤ ≅ ℤ ⧸ 2`, witnessing failure of left
  exactness.
- `eA ⊗_A Af ≅ eAf` for idempotents `e, f ∈ A` (Tau Ceti's corner identification).
- At `A = M = N = ℤ` and `E = ℚ ⧸ ℤ`, both sides of `homEquiv` evaluate to `ℚ ⧸ ℤ`.

*Needs:* 0.2–0.5; Tau Ceti `TauCeti.BalancedTensorProduct` with `map`, `lift`, `lid`, `rid`, and
`finsuppScalarRight`, `TauCeti.CharacterModule.eval_injective`; Mathlib `TensorProduct`,
`RingEquiv.opOp`, `Module.compHom`, `IsScalarTower.of_algebraMap_smul`, `AddCircle`.

### 0.7 Duals with respect to an `R`-module `E`

For an `R`-linear category `C` and `E : ModuleCat.{w} R`, evaluating the `R`-linear Hom bifunctors
of 0.3 at `E` defines the dual `F^E = Hom_R(F(-), E)` in `Mod Cᵒᵖ` of `F : Mod C`
(`TauCeti.ModCat.dual R E : (ModCat C)ᵒᵖ ⥤ ModCat Cᵒᵖ`) and the dual `G^E = Hom_R(G(-), E)` in
`Mod C` of `G : Mod Cᵒᵖ` (`TauCeti.ModCat.dualOp R E`), matching `MatlisDual R E` for rings (0.6).
Specializing the `R`-linear adjunction of 0.3 to `X = E` gives
`Hom_R(G ⊗_C F, E) ≃ Hom_{Mod Cᵒᵖ}(G, F^E)`. Hypotheses on `E` are imposed only where used:

- **Exactness** (`TauCeti.ModCat.dual_shortExact`): if `E` is injective, `(-)^E` sends short exact
  sequences to short exact sequences.
- **Faithfulness on objects** (`TauCeti.ModCat.isZero_of_isZero_dual`): if `E` is a cogenerator
  (`IsCoseparator`), `F^E = 0` implies `F = 0`.
- **Monomorphism detection** (`TauCeti.ModCat.mono_tensor_map_app_iff`): if `E` is an injective
  cogenerator—as used in Lambek's flatness criterion (Layer 2)—then `i ⊗_C F` is a monomorphism if
  and only if every morphism `G → F^E` extends along `i : G → G'`, i.e., precomposition
  `Hom(G', F^E) → Hom(G, F^E)` is surjective. Via the adjunction, that surjectivity is equivalent to
  surjectivity of `Hom_R(i ⊗_C F, E)`: injectivity of `E` gives the forward implication and the
  cogenerator hypothesis gives the converse, so the two directions can be proved under their
  separate hypotheses. A cogenerator that is not injective does not suffice: over `ℤ`, take
  `E = ℚ ⧸ ℤ ⊕ ℤ`, `F = ℤ`, and `i : ℤ → ℤ` given by multiplication by `2`; then `i ⊗ ℤ` is
  injective, whereas precomposition on `Hom(ℤ, E) ≅ E` is multiplication by `2` and misses `(0, 1)`.

Key instances include `R = ℤ` with `E = ℚ ⧸ ℤ` (`CharacterModule`, producing a cogenerating family
of injectives in `Mod C`, [Mitchell, §6, p. 27]) and `MatlisDual R E` in Auslander–Reiten theory.
Lambek's criterion for a general injective cogenerator `E` appears in 2.2 (7) via the adjunction,
following [OR, (1.1), p. 93], [Lambek, Prop. 1, p. 241], and [CE, VI, Prop. 5.1, p. 120].

*Needs:* 0.3, 0.6 (the Matlis dual); Mathlib `IsCoseparator`, `ShortComplex.ShortExact`.

### 0.8 Finitely generated projective modules, duality and finite presentation

Let `proj C` (`TauCeti.ModCat.proj C`) be the full subcategory of finitely generated (0.1)
projective objects in `Mod C`, so Yoneda embeds `C ⊆ proj C` covariantly and `proj Cᵒᵖ` consists of
the finitely generated projective covariant functors. At `C = SingleObj Aᵐᵒᵖ`, `proj C` corresponds
to `TauCeti.finiteProjectiveModules A` (finitely generated projective left `A`-modules).

- **Closure** (instances): `proj C` has finite biproducts and is idempotent complete.
- **Characterization by retracts** (`TauCeti.ModCat.proj_iff_exists_retract`): an object of `Mod C`
  lies in `proj C` if and only if it is a retract of a finite coproduct of representables.
- **Restricted Yoneda** (`TauCeti.ModCat.projYoneda : C ⥤ proj C`, `X ↦ Hom(-, X)`): fully faithful,
  identifying `End Hom(-, X)` with `End X`, and giving `X ↦ Hom(X, -)` in `proj Cᵒᵖ` over `Cᵒᵖ`.
- **Karoubi envelope** (`TauCeti.ModCat.projEquivKaroubiMat : proj C ≌ Karoubi (Mat_ C)`): a target
  equivalence, since Yoneda is fully faithful on finite coproducts and every object of `proj C` is a
  summand of a finite coproduct of representables. For one-object categories this recovers
  projectivization (`add M` versus finitely generated projective `End M`-modules), and two-sided
  ideals such as `J(C)` extend along `C → Mat_ C → Karoubi (Mat_ C)` entrywise without new ideal
  definitions.
- **Additive idempotent-complete `C`** (an instance `(ModCat.projYoneda C).IsEquivalence` under
  `[HasFiniteBiproducts C] [IsIdempotentComplete C]`): `C ≃ proj C`, so every projective object of
  `mod C` is isomorphic to a representable.
- **Projective duality** (`TauCeti.ModCat.projDual : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`,
  `TauCeti.ModCat.projDualYonedaIso`): `(-)^∨ = Hom(-, C)` sending `Hom(-, X)` to `Hom(X, -)`,
  constructed from the Karoubi equivalences on both sides together with matrix transposition
  `(Mat_ C)ᵒᵖ ≌ Mat_ Cᵒᵖ` (neither `Karoubi` nor `Mat_` has this duality in Mathlib). Its defining
  universal property (`TauCeti.ModCat.homAddEquivTensorObjProjDual`) is the natural isomorphism
  `Hom(P, F) ≅ P^∨ ⊗_C F` for `P ∈ proj C` and `F ∈ Mod C`, reducing at `P = Hom(-, X)` to Yoneda
  on both sides (0.3); Section 1.4 defines the transpose via `projDual` and uses this isomorphism.
- **Finite presentation: equivalence of definitions**
  (`TauCeti.ModCat.isFinitelyPresentedFunctor_tfae`). For `[EssentiallySmall.{v} C]` and
  `F : ModCat.{v} C`, the following are equivalent:
  1. `F` is the cokernel of a morphism in `proj C`;
  2. `F` is finitely presented in the sense of 0.1 (the cokernel of a morphism between finite
     coproducts of representables);
  3. `F` satisfies Mathlib's `IsFinitelyPresentable` (`Hom(F, -)` preserves filtered colimits).

  Over a ring (`C = SingleObj Aᵐᵒᵖ`), these also agree with (4) `Module.FinitePresentation`
  (`TauCeti.isFinitelyPresentedFunctor_iff_finitePresentation` via 0.2, and
  `TauCeti.ModuleCat.isFinitelyPresentable_iff_finitePresentation` in `ModuleCat A`), while for
  additive `C` condition (2) reduces to a map between single representables (0.1). For the proof,
  (1) ⇔ (2) follows from the retract characterization of `proj C` by adding complementary summands
  to both terms of a presentation. For (2) ⇔ (3), representables are finitely presentable by Yoneda
  (`Hom(Hom(-, X), colim D) ≅ (colim D)(X)` since colimits are objectwise) and form a strong
  generator of `Mod C`; hence `IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable`
  identifies `IsFinitelyPresentable` with the `ℵ₀`-colimit closure
  (`ObjectProperty.colimitsCardinalClosure`), which coincides with (2) because finitely presented
  functors contain the representables and are closed under finite coproducts and cokernels (0.1).
- **Finite generation** (`TauCeti.ModCat.isFinitelyGeneratedFunctor_iff_exists_epi_proj`): a module
  is a quotient of a finite coproduct of representables if and only if it is a quotient of an object
  of `proj C`, matching `Module.Finite` for rings (`TauCeti.isFinitelyGeneratedFunctor_iff_finite`).
- **Filtered generation by finitely presented modules**
  (`TauCeti.ModCat.isCardinalFilteredGenerator_isFinitelyPresentedFunctor`, under
  `EssentiallySmall.{v} C`): finitely presented modules form an `ℵ₀`-filtered generator of `Mod C`
  (`ObjectProperty.IsCardinalFilteredGenerator` at `ℵ₀`; [CB, §1.2, Theorem, p. 1645] for
  skeletally small additive `C`), with ring counterpart
  `TauCeti.ModuleCat.isCardinalFilteredGenerator_finitePresentation` in `ModuleCat A`. Because every
  epimorphism in `Mod C` is extremal (`ObjectProperty.isStrongGenerator_iff_exists_extremalEpi`),
  the representables form a strong generator of finitely presentable objects; by
  `ObjectProperty.IsStrongGenerator.isDense_colimitsCardinalClosure_ι`, every module is therefore a
  filtered colimit of finite colimits of representables, which are finitely presented by 0.1. Note
  that representables alone do not generate under filtered colimits, since filtered colimits of
  representables are flat (2.6) whereas `ℤ ⧸ 2` is not flat over `ℤ`.
- **Local finite presentability** (an instance `IsLocallyFinitelyPresentable.{v} (ModCat.{v} C)`
  under `EssentiallySmall.{v} C`): follows immediately from the filtered-generator statement via
  `IsCardinalLocallyPresentable.iff_exists_isStrongGenerator`, since `Mod C` is cocomplete and
  locally small.
- **Countable presentations** (`TauCeti.ModCat.isCardinalPresentable_aleph_one_iff`): `F` satisfies
  `IsCardinalPresentable` at `ℵ₁` if and only if it is the cokernel of a map between countable
  coproducts of representables. Bass's sequence modules (2.5) have this form, as used in Theorem P
  (3′) and Jensen's theorem (3.5).
- **Rings** (`TauCeti.finiteProjectiveModulesEquivProj A`, `TauCeti.finiteProjectiveModulesDual A`):
  restricting 0.2 gives `TauCeti.finiteProjectiveModules A ≌ proj (SingleObj Aᵐᵒᵖ)`, and `projDual`
  specializes via `Hom_A(-, A)` to
  `(finiteProjectiveModules A)ᵒᵖ ≌ finiteProjectiveModules Aᵐᵒᵖ`, alongside the instance
  `HasFiniteBiproducts (finiteProjectiveModules A).FullSubcategory` (4.2). (While `Module.Dual A P`
  is defined over any semiring in Mathlib, its existing API assumes commutativity; Tau Ceti's
  `TauCeti.AuslanderReitenTranspose` already uses it as a right module.)

**Checks.** At `C = SingleObj Aᵐᵒᵖ`, `proj C` recovers finitely generated projective left
`A`-modules and `projDual` is `Hom_A(-, A)`. For the quiver category `1 → 2` of 0.1, each
representable has local endomorphism ring `k`, so `proj C` is Krull–Schmidt (4.2) and every object
of `proj C` is a finite coproduct of representables by uniqueness of Krull–Schmidt decompositions
(ArtinAlgebras §0.3). Over `ℤ`, `ℤ²` satisfies all four conditions of the finite-presentation
bridge.

*Needs:* 0.1–0.3, 0.5; Mathlib `Mat_`, `CategoryTheory.Idempotents.Karoubi`,
`IsIdempotentComplete`, `ObjectProperty.lift`, `Retract`, `IsFinitelyPresentable`,
`IsLocallyFinitelyPresentable`, `IsCardinalPresentable`, `Module.FinitePresentation`,
`ObjectProperty.IsCardinalFilteredGenerator`,
`IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable`,
`ObjectProperty.colimitsCardinalClosure`,
`ObjectProperty.IsStrongGenerator.isDense_colimitsCardinalClosure_ι`,
`ObjectProperty.isStrongGenerator_iff_exists_extremalEpi`; Tau Ceti
`TauCeti.finiteProjectiveModules`; ArtinAlgebras §0.3 (check).

### Examples

Representative examples include rings via `SingleObj Aᵐᵒᵖ` (0.2, 0.6); `k`-linear quiver
categories, whose modules are representations of the opposite quiver; `mod C` inside `Mod C`; `ℤ²`
over `ℤ`, finitely presented via finite sums though not via single representables; and finitely
generated projective modules over rings and quiver categories (0.8). Through the commutative
comparison of 0.6, every Mathlib tensor-product computation specializes `M ⊗_A N`.

### Dependencies

Mathlib and Tau Ceti; the check of 0.8 uses ArtinAlgebras §0.3.

## Layer 1: `Tor`

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{w} C`, modules
take values in `AddCommGrpCat.{w}`, and `Tor` takes values in `AddCommGrpCat.{w}`, acquiring
`Module R` instances when `C` is `R`-linear. A single functor `Tor^C_n(G, F)` is defined, placing
the covariant functor `G` first and deriving in the `Mod C` variable `F` (Convention 6); resolving
`G` instead amounts to `Tor` over `Cᵒᵖ` via the swap of 0.5. Sections 1.1–1.6 conclude with their
ring-level counterparts.

### 1.1 Definition

The bifunctor `TauCeti.ModCat.tor n : ModCat Cᵒᵖ ⥤ ModCat C ⥤ AddCommGrpCat` evaluates at `G` to
`(ModCat.tensor.obj G).leftDerived n`—Mathlib's classical `Functor.leftDerived` applied to
`F ↦ G ⊗_C F`—and acts on morphisms in `G` via `NatTrans.leftDerived`, matching the shape of
Mathlib's `CategoryTheory.Tor`. Projective resolutions in `Mod C` exist by enough projectives (0.1)
and Mathlib's `HasProjectiveResolutions` instance.

- **Degree zero** (`TauCeti.ModCat.torZeroIso : tor 0 ≅ tensor`): given by
  `Functor.leftDerivedZeroIsoSelf`, since `G ⊗_C -` preserves colimits (0.3).
- **Vanishing on projectives** (`TauCeti.ModCat.isZero_tor_succ_of_projective`):
  `Tor_{n+1}(G, F) = 0` whenever `F` is projective
  (`Functor.isZero_leftDerived_obj_projective_succ`).
- **Resolution formula** (`TauCeti.ModCat.torObjIsoHomology`): for any projective resolution `P` of
  `F`, `Tor_n(G, F) ≅ H_n(G ⊗_C P)` via `ProjectiveResolution.isoLeftDerivedObj`.
- **Additivity:** additive in each argument, using `NatTrans.leftDerived` and Tau Ceti's
  `NatTrans.leftDerived_add` in `G`.
- **`R`-module structure**, for `R`-linear `C` (`Module R (Tor_n(G, F))`,
  `TauCeti.ModCat.smul_eq_tor_obj_map`, `TauCeti.ModCat.smul_eq_tor_map_app`): `r ∈ R` acts as
  `Tor_n(G, r • 𝟙 F)`, which coincides with `Tor_n(r • 𝟙 G, F)` (either by balance in 1.3 or by
  computing on a projective resolution), on the pattern of `Abelian.Ext.smul_eq_comp_mk₀`. Because
  the underlying group is independent of `R`, no base-ring comparison is needed over categories.

**Rings** (`TauCeti.BalancedTor R A n : ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`),
for an `R`-algebra `A` with `[Small.{v} A]`. Following Convention 5, `BalancedTor R A n` is defined
natively at `M` as `((BalancedTensorProduct.functor R A).obj M).leftDerived n`, deriving the
bifunctor of 0.6 in the left-module variable. It carries the same basic API
(`TauCeti.balancedTorZeroIso`, `TauCeti.isZero_balancedTor_succ_of_projective`) together with a
categorical comparison (`TauCeti.balancedTorIsoTorSingleObj`) identifying `BalancedTor ℤ A n` with
`Tor` over `SingleObj Aᵐᵒᵖ` in the same factor order, since the equivalences of 0.2 preserve
projective resolutions and intertwine the tensor products (0.6); for an `R`-algebra, this upgrades
to an `R`-linear isomorphism via `TauCeti.balancedTorIntIso` (1.6).

**Choice of derived-functor API.** We define `tor` from Mathlib's classical homotopy-category
`Functor.leftDerived` rather than its derived-category API (`Functor.HasLeftDerivedFunctor`,
`Functor.totalLeftDerived`, `LocalizerMorphism.IsLeftDerivabilityStructure`), and nothing downstream
depends on the internal construction beyond the interface above.

*Needs:* 0.1, 0.2, 0.3, 0.6; Mathlib `Functor.leftDerived`, `NatTrans.leftDerived`,
`Functor.leftDerivedZeroIsoSelf`, `Functor.isZero_leftDerived_obj_projective_succ`,
`ProjectiveResolution.isoLeftDerivedObj`, `HasProjectiveResolutions`; Tau Ceti
`NatTrans.leftDerived_add`.

### 1.2 Long exact sequences in the underived variable

Given a short exact sequence `0 → G₁ → G₂ → G₃ → 0` in `Mod Cᵒᵖ` and a projective resolution `Q` of
`F : Mod C`, the complexes `Gᵢ ⊗_C Q` form a short exact sequence of chain complexes: in each degree
`q`, `- ⊗_C Q_q` is right exact (0.3) and preserves monomorphisms because `Q_q` is projective (0.4).
Applying Mathlib's homology long exact sequence (`ShortComplex.ShortExact.homology_exact₁`,
`homology_exact₂`, `homology_exact₃`, with connecting morphism `ShortComplex.ShortExact.δ`) and the
resolution isomorphism of 1.1 yields natural connecting maps `δ : Tor_{n+1}(G₃, F) → Tor_n(G₁, F)`
(`ShortComplex.ShortExact.torδ`) and exactness at all three positions (`TauCeti.ModCat.tor_exact₁`,
`tor_exact₂`, `tor_exact₃`).

Because the long exact sequence in the derived variable `F` will follow by balance in 1.3, this is
the only long exact sequence proved directly; neither a horseshoe lemma nor a general long exact
sequence for `Functor.leftDerived` (both absent from Mathlib) is required.

**Rings** (`ShortComplex.ShortExact.balancedTorδ`, `TauCeti.balancedTor_exact₁`,
`balancedTor_exact₂`, `balancedTor_exact₃`): every short exact sequence of right `A`-modules induces
a long exact `Tor` sequence, proved either by the same argument using the projective-factor lemmas
of 0.6 or via the categorical comparison of 1.1.

*Needs:* 0.3, 0.4, 1.1; Mathlib `ShortComplex.ShortExact.δ`, `homology_exact₁`–`homology_exact₃`.

### 1.3 Balance

There is a natural isomorphism `Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)`, `R`-linear when `C` is
`R`-linear (`TauCeti.ModCat.torBalanceIso : tor n ≅ ((ModCat.opOpEquiv C).functor ⋙ tor n).flip`),
where `F` is viewed in `Mod Cᵒᵖᵒᵖ` via `opOpEquiv` (0.5). Following Weibel's acyclic assembly proof
([Weibel, Thm. 2.7.2 and 2.7.3, pp. 58–59]), choose projective resolutions `P` of `G` and `Q` of `F`
and form the first-quadrant bicomplex `P_p ⊗_C Q_q`. Because tensoring with a projective object is
exact on both sides (0.3, 0.4), the augmented rows `P_p ⊗ Q → P_p ⊗ F` and columns
`P ⊗ Q_q → G ⊗ Q_q` are exact. Applying `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows` to
the bicomplex and its transpose (via `HomologicalComplex₂.totalComplexShapeSymmetryDownNat`)
identifies both `H_n(G ⊗_C Q)` and `H_n(P ⊗_C F)` with the homology of the total complex; applying
the swap of 0.5 termwise identifies `P ⊗_C F` with `F ⊗_{Cᵒᵖ} P`, whose homology is
`Tor^{Cᵒᵖ}_n(F, G)` by 1.1 over `Cᵒᵖ`.

Two immediate consequences follow:

- **Vanishing on the left** (`TauCeti.ModCat.isZero_tor_succ_of_projective_left`):
  `Tor_{n+1}(G, F) = 0` whenever the covariant functor `G` is projective.
- **Long exact sequence in the derived variable** (`ShortComplex.ShortExact.torδ'`,
  `TauCeti.ModCat.tor_exact₁'`, `tor_exact₂'`, `tor_exact₃'`): obtained by transporting 1.2 over
  `Cᵒᵖ` across `torBalanceIso`.

**Rings.** Combining categorical balance at `SingleObj Aᵐᵒᵖ` with 1.1's comparison and
`TauCeti.singleObjMulOppositeEquiv Aᵐᵒᵖ` (0.2, identifying `SingleObj Aᵐᵒᵖᵐᵒᵖ` with
`(SingleObj Aᵐᵒᵖ)ᵒᵖ`) yields the natural swap `Tor_n^A(M, N) ≅ Tor_n^{Aᵐᵒᵖ}(N, M)`
(`TauCeti.balancedTorSwapIso`, viewing `N` in `ModuleCat Aᵐᵒᵖᵐᵒᵖ` via
`ModuleCat.restrictScalars (RingEquiv.opOp A).symm`). Vanishing at a projective right module
(`TauCeti.isZero_balancedTor_succ_of_projective_left`) and the long exact sequence in the
left-module variable (`ShortComplex.ShortExact.balancedTorδ'`, `TauCeti.balancedTor_exact₁'`,
`balancedTor_exact₂'`, `balancedTor_exact₃'`) follow immediately.

*Needs:* 0.3–0.5, 1.1, 1.2; Mathlib `HomologicalComplex₂`, `HomologicalComplex₂.total`; Tau Ceti
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`,
`HomologicalComplex₂.totalComplexShapeSymmetryDownNat`.

### 1.4 `Tor` of the transpose

For a finitely presented module `X` with Auslander–Bridger transpose `Tr X` and any module `N`,

    stable Hom(X, N) ≅ Tor_1(Tr X, N),

where `stable Hom(X, N)` is the quotient of `Hom(X, N)` by morphisms factoring through a projective
([Auslander78, I, Prop. 3.2]; for two-sided Noetherian rings, [AB, (2.8) (b), p. 54], the `k = 0`
case of the four-term exact sequence ending in `Hom(M, -) → Tor_1(D M, -) → 0` for the transpose
`D M` of [AB, (2.5), p. 51]). Following Krause's snake-lemma proof without dualizing
([Krause-Defect, pp. 268–269]), choose a short exact sequence `0 → ΩN → P → N → 0` with `P`
projective and a finite projective presentation `P₁ → P₀ → X → 0`, and set
`H(M) = coker(Hom(P₀, M) → Hom(P₁, M))`. By the snake lemma,
`δ^*(X) = coker(Hom(X, P) → Hom(X, N))` is isomorphic to `ker(H(ΩN) → H(P))`. Every map out of `X`
that factors through a projective factors through `P → N`, so `δ^*(X)` is `stable Hom(X, N)`.
Meanwhile, `Hom(Pᵢ, M) ≅ Pᵢ^∨ ⊗_C M` (0.8) gives `H(M) ≅ Tr X ⊗_C M` naturally in `M`, identifying
`ker(H(ΩN) → H(P))` with `ker(Tr X ⊗_C ΩN → Tr X ⊗_C P) ≅ Tor_1(Tr X, N)` by the long exact
sequence in the second variable (1.3) and `Tor_1(Tr X, P) = 0` (1.1).

- **Categorical statement** (`TauCeti.ModCat.transpose`,
  `TauCeti.ModCat.stableHomEquivTorTranspose`), a target. Given a finitely presented module
  `X = coker(f : P₁ → P₀)` with `P₀, P₁ ∈ proj C` (0.8), its transpose is the covariant functor
  `Tr X = coker(P₀^∨ → P₁^∨)` formed with `(-)^∨ = Hom(-, C)` (0.8). Using Tau Ceti's projective
  stable category (`TauCeti.ExactStructure.projectiveStableFunctor` on
  `TauCeti.ExactStructure.abelian`) and the long exact sequence of 1.3, we obtain
  `stable Hom(X, N) ≃ Tor_1(Tr X, N)` for every `N : Mod C`, matching the ring factor order. As a
  companion **matrix description** (`TauCeti.ModCat.matrixMap`, `TauCeti.ModCat.projSigma`,
  `TauCeti.ModCat.matrixTranspose`, `TauCeti.ModCat.transposeMatrixIso`), when
  `f : ⊕_j Hom(-, Y_j) → ⊕_i Hom(-, Z_i)` comes from a matrix `α_ji : Y_j → Z_i`, `Hom(-, Y)^∨ ≅
  Hom(Y, -)` identifies `Tr X` with the cokernel of the transposed matrix
  `⊕_i Hom(Z_i, -) → ⊕_j Hom(Y_j, -)`.
- **A `Tor` criterion for projectivity** (`TauCeti.ModCat.projective_of_isZero_tor_transpose`). If
  `X = coker f` is finitely presented and `Tor_1(Tr X, X) = 0`, then `stable End(X) = 0`, so `𝟙 X`
  factors through a projective and `X` is projective. Combined with 2.2, this proves in 2.2 that
  finitely presented flat modules are projective without invoking Lazard's theorem, following [CB,
  §1.3, proof of (1) ⇒ (2), p. 1646] (where `Tor_1(Tr X, Y) = 0` implies that every morphism from a
  finitely presented `X` to a flat `Y` factors through a projective, specialized to `Y = X`);
  Lazard's direct factorization through a finite sum of representables ([Lazard, Cor. 1.4, p. 85];
  [Mitchell, p. 49]) is noted in 2.3.
- **Rings** (`TauCeti.stableHomEquivBalancedTorTranspose`). Given a finite projective presentation
  `f : P₁ → P₀`, `P₀ → X → 0` of left `A`-modules,
  `stable Hom_A(X, N) ≃ₗ[R] Tor_1^A(Tr X, N)` for Tau Ceti's `TauCeti.AuslanderReitenTranspose f`
  (`Hom_A(P₁, A)` modulo the image of `Hom_A(P₀, A)`, matching `Tr X` over `SingleObj Aᵐᵒᵖ`). This
  follows either from the categorical isomorphism via 0.2, 0.8, and 1.1, or directly by the same
  snake-lemma argument using `LinearMap.auslanderReitenTransposeTensorEquivCokernel` (natural by
  `auslanderReitenTransposeTensorEquivCokernel_map`) and
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom`.

Auslander's defect formula `D δ^*(X) ≅ δ_*(D Tr X)` belongs to
[ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §4.2, and is not repeated here.

*Needs:* 0.8, 1.1–1.3; Tau Ceti `TauCeti.AuslanderReitenTranspose`,
`LinearMap.auslanderReitenTransposeTensorEquivCokernel`,
`TauCeti.ExactStructure.projectiveStableFunctor`, `TauCeti.ExactStructure.abelian`,
`ModuleCat.tensorHomCokernelEquivProjectiveStableHom`.

### 1.5 `Tor`–`Ext` duality

For an `R`-linear category `C` and an injective `R`-module `E`, there is a natural `R`-linear
equivalence (`TauCeti.ModCat.torExtDualityEquiv`)

    Hom_R(Tor_n^C(G, F), E) ≃ₗ[R] Ext^n(G, F^E),

where `Tor` carries the `Module R` structure of 1.1, `F^E : Mod Cᵒᵖ` is the dual of 0.7, and `Ext`
is Mathlib's derived-category `Abelian.Ext` on `Mod Cᵒᵖ` (equipped with its `Module R` instance from
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`, and `HasExt.{w}` supplied on both
`Mod C` and `Mod Cᵒᵖ` by `IsGrothendieckAbelian.hasExt` from 0.1).

To prove the equivalence ([CE, VI, Prop. 5.1, p. 120]; [Lambek, p. 241] for `R = ℤ` and
`E = ℚ ⧸ ℤ`), compute `Tor_n^C(G, F)` from a projective resolution `P` of `G` via balance (1.3).
Exactness of `Hom_R(-, E)` gives `Hom_R(H_n(P ⊗_C F), E) ≅ H^n(Hom_R(P ⊗_C F, E))`, the `R`-linear
adjunction of 0.3 identifies `Hom_R(P ⊗_C F, E)` termwise with `Hom(P, F^E)`, and
`ProjectiveResolution.extEquivCohomologyClass`
(`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`) identifies the degree-`n` cohomology of
`Hom(P, F^E)` with `Ext^n(G, F^E)` directly, without introducing a classical `Ext` functor.

**Rings** (`TauCeti.balancedTorExtDualityEquiv`):
`Hom_R(Tor_n^A(M, N), E) ≃ₗ[R] Ext^n_{Aᵐᵒᵖ}(M, Hom_R(N, E))`, where `Hom_R(N, E)` is
`MatlisDual R E N` (0.6) and `ModuleCat Aᵐᵒᵖ` carries Mathlib's scoped
`ModuleCat.Algebra.instLinear`.

Downstream consumers include Lambek's flatness criterion in Layer 2 (`n = 1`, `E` an injective
cogenerator), the character-module formula for flat dimension in Layer 3, and Auslander–Reiten
duality formulas using Matlis duals (`E` an injective hull of a residue field, as in ArtinAlgebras).

*Needs:* 0.7, 1.1, 1.3; Mathlib `Abelian.Ext`, `HasExt`, `hasExt_of_enoughProjectives`,
`ProjectiveResolution.extEquivCohomologyClass`, the `Module R (Ext X Y n)` instance; 0.6's Matlis
dual.

### 1.6 Comparisons and first computations

- **Commutative rings** (`TauCeti.balancedTorIsoTor`). When `[CommRing R]`, `equivTensorProduct`
  (0.6) induces a natural isomorphism between `BalancedTor R R n` and Mathlib's
  `CategoryTheory.Tor (ModuleCat R) n` (after scalar restriction along
  `(RingEquiv.toOpposite R).symm`). Combining this with balance (1.3) yields
  `CategoryTheory.Tor (ModuleCat R) n ≅ CategoryTheory.Tor' (ModuleCat R) n`
  (`TauCeti.torIsoTor'`), supplying the symmetry isomorphism left open in
  `Mathlib/CategoryTheory/Monoidal/Tor.lean` and allowing Tau Ceti's commutative `Tor`/`Tor'`
  lemmas (`TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor`, `TauCeti.CategoryTheory.Monoidal.Tor`)
  to transfer to `BalancedTor R R`.
- **Change of base and independence of `R` for rings** (`TauCeti.balancedTorRestrictScalarsIso`,
  `TauCeti.balancedTorIntIso`). Along `R → R' → A`, restricting scalars from `R'` to `R` identifies
  `BalancedTor R' A n` with `BalancedTor R A n`; at `ℤ → R`, this shows that the underlying abelian
  group of `BalancedTor R A n` is independent of `R`. Both follow by computing `Tor` from a single
  projective resolution (1.1) and applying the base-change isomorphism of 0.6 termwise. (No
  categorical analogue is needed because `Tor` over `C` already takes values in `AddCommGrpCat`,
  1.1.)
- **Cyclic modules** (`TauCeti.balancedTorOneQuotientEquiv`). For a right ideal
  `I : Submodule Aᵐᵒᵖ A` and a left ideal `K : Ideal A` (over `R = ℤ`),
  `Tor_1^A(A ⧸ I, A ⧸ K) ≃+ (I ∩ K) ⧸ IK`, where `IK` is the additive subgroup generated by
  products `i k` ([Weibel, Exer. 3.1.3, p. 68]; in particular, `Tor_1^A(A ⧸ I, A ⧸ I) ≅ I ⧸ I²` for
  a two-sided ideal `I`). This follows from the long exact sequence (1.2) of
  `0 → I → A → A ⧸ I → 0`, vanishing of `Tor_1(A, -)`, and the first check of 0.6 identifying
  `I ⊗_A (A ⧸ K) → A ⊗_A (A ⧸ K)` with `I ⧸ IK → A ⧸ K`, on the pattern of
  `ShortComplex.ShortExact.leftDerivedOneIsoKernel` (`TauCeti.CategoryTheory.Abelian.LeftDerived`).

*Needs:* 0.3, 0.6, 1.1–1.3; Mathlib `CategoryTheory.Tor`, `CategoryTheory.Tor'`,
`ModuleCat.restrictScalars`.

### 1.7 Categories with finitely many objects

For a preadditive category `C` on finitely many objects (`[Finite C]`, avoiding any decidability
assumption in multiplication), the **category algebra** (`TauCeti.CategoryAlgebra C`) has underlying
group `⊕_{x,y} Hom(x, y)` of finitely supported families `a (x, y) : x ⟶ y` (`DFinsupp`), product
`(a * b)(x, z) = ∑_y a (x, y) ≫ b (y, z)`, and identity `∑_x 𝟙 x` ([Mitchell, §7, p. 33], denoted
`[C]` there). Over an arbitrary preadditive `C`, the same carrier forms a non-unital ring with
enough idempotents (`NonUnitalRing`; [Harada, Remark 1, pp. 339–340]), acquiring the unit `∑_x 𝟙 x`
when `C` is finite; when `C` is `R`-linear, `CategoryAlgebra C` is an `R`-algebra. Because
multiplication follows diagrammatic composition order, `f ≫ g = op (unop f * unop g)` in
`SingleObj Aᵐᵒᵖ` gives `CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≅ A`.

- **Morita equivalence** (`TauCeti.modCatEquivCategoryAlgebra :
  ModCat C ≌ ModuleCat (CategoryAlgebra C)` and `TauCeti.modCatOpEquivCategoryAlgebra :
  ModCat Cᵒᵖ ≌ ModuleCat (CategoryAlgebra C)ᵐᵒᵖ`). Modeled on `TauCeti.quiverRepEquivalence :
  QuiverRep k Q ≌ ModuleCat (pathAlgebra k Q)` (with carrier `⊕ᵥ Mᵥ`), `F ↦ ⊕_x F(x)` with action
  `F(a (x, y)) : F(y) → F(x)` defines `R`-linear equivalences when `C` has finitely many objects
  ([Mitchell, Thm. 7.1, pp. 33–36], proved for covariant functors and right `[C]`-modules, with the
  contravariant case noted on p. 37). Consequently, finite-object categories with `R`-linearly
  equivalent module categories have Morita-equivalent category algebras (`IsMoritaEquivalent`). For
  a full subcategory `C' ⊆ C` on a subset of objects, `CategoryAlgebra C'` is the corner `e Λ e` of
  `Λ = CategoryAlgebra C` at `e = ∑_{x ∈ C'} 𝟙 x`, so `IsIdempotentElem.isMoritaEquivalent_corner`
  applies whenever `e` is full.
- **Comparison of tensor products and `Tor`** (`TauCeti.tensorObjCategoryAlgebraIso`,
  `TauCeti.torCategoryAlgebraIso`). These equivalences intertwine `G ⊗_C F` with the balanced tensor
  product over `CategoryAlgebra C` (over `ℤ`, and `R`-linearly when `C` is `R`-linear) and
  `Tor^C_n` with `BalancedTor ℤ (CategoryAlgebra C) n` ([Mitchell, §7, p. 37, (1)]): both tensor
  products represent the same functor by the adjunctions of 0.3 and 0.6, and equivalences preserve
  projective resolutions.

These equivalences generalize the single-object comparisons of 0.2, 0.6, and 1.1; although the
tensor isomorphism uses only Layer 0, the section is placed here so that `Tor` is compared at the
same time.

**Check.** For the `k`-linear category `C` of `1 → 2` (0.1), `Hom(1, 2) = k` lies in entry `(1, 2)`
and `(a * b) x z = ∑_y a x y ≫ b y z` is ordinary matrix multiplication ([Mitchell, §7, Example 1,
p. 33] for posets), identifying `CategoryAlgebra C` directly with the upper triangular matrix
algebra `T₂(k)`. Thus `Mod C` is equivalent to left `T₂(k)`-modules and `Tor^C` agrees with
`Tor^{T₂(k)}`, allowing the `T₂(k)` checks below to be computed via representables of `C`. Note that
`TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv` identifies `T₂(k)` with the path algebra of `A₂`
by indexing paths at `(target, source)`; in the numbering here, that corresponds to the opposite
quiver `2 → 1`, whose left path-algebra modules are representations `V₂ → V₁` (matching 0.1). More
generally, under Tau Ceti's path-algebra convention, the category algebra of a quiver category is
the path algebra of the opposite quiver.

*Needs:* 0.1–0.3, 0.6, 1.1; Mathlib `Finite`; Tau Ceti `TauCeti.quiverRepEquivalence` (pattern),
`TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`, `IsIdempotentElem.isMoritaEquivalent_corner`.

**Checks.**

- Representables: `Tor_0(G, Hom(-, X)) ≅ G(X)` (1.1 and Yoneda in 0.3) and
  `Tor_{n+1}(G, Hom(-, X)) = 0` (1.1, since `Hom(-, X)` is projective); symmetrically,
  `Tor_0(Hom(X, -), F) ≅ F(X)` and `Tor_{n+1}(Hom(X, -), F) = 0` (1.3).
- `Tor_1^ℤ(ℤ ⧸ m, ℤ ⧸ n) ≅ ℤ ⧸ gcd(m, n)` via the cyclic formula `(mℤ ∩ nℤ) ⧸ mnℤ`.
- Over `B = k[ε]/(ε²)`, `Tor_n^B(k, k) ≅ k` for all `n ≥ 0`, computed from the periodic resolution
  `⋯ → B → B → k` given by multiplication by `ε`, whose differentials vanish after tensoring with
  `k`.
- Over `T = T₂(k)` with radical `J = k e₁₂`, the cyclic formula gives one-dimensional
  `Tor_1^T(T ⧸ J, T ⧸ J) ≅ J ⧸ J² = J`, while `Tor_n^T(T ⧸ J, -) = 0` for `n ≥ 2` because
  `J = e₁₂T ≅ e₂₂T` is projective (`T ⧸ J` being the semisimple sum of the two simple modules); by
  1.7, the same groups arise over `1 → 2` from representable resolutions.

### Examples

Examples include rings (`ℤ`, `k[ε]/(ε²)`, and `T₂(k)`, as in the checks), representable functors,
and finite quiver categories via their category algebras (path algebras of the opposite quivers,
1.7). By balance (1.3), `Tor` may be computed by resolving either variable.

### Dependencies

Layer 0.

## Layer 2: flat modules and flat functors

Throughout, `C : Type u` is preadditive with `Category.{v} C`. Flatness itself requires no smallness
and is defined for modules in any universe; by contrast, the tensorial tests of 2.2, Lazard's
characterizations, and closure properties involving `⊗_C` or `Tor` assume `EssentiallySmall.{v} C`
and modules in the morphism universe `v`, where the representables live (Convention 3). Flatness is
formulated for contravariant functors (`Mod C`), and a covariant functor is flat when it is flat in
`Mod Cᵒᵖ`. This matches [OR], [St], [CB], [Fisher] (except Cor. 2.9), [Krause-Smashing], and
[Mitchell, §10]; [Simson] works with covariant functors (except in Thm. 2.1 (b)) and is applied to
`Cᵒᵖ` (Convention 14). Sections 2.1–2.6 conclude with their ring-level counterparts.

### 2.1 Definition

A relation `∑_j F(β_j)(y_j) = 0` in `F(X)`, for finitely many morphisms `β_j : X → Y_j` and elements
`y_j ∈ F(Y_j)`, is **trivial** (`TauCeti.ModCat.IsTrivialRelation`) if there exist finitely many
elements `z_i ∈ F(Z_i)` and morphisms `α_ij : Y_j → Z_i` such that `y_j = ∑_i F(α_ij)(z_i)` for all
`j` and `∑_j β_j ≫ α_ij = 0` for all `i`. A module `F` in `Mod C` is **flat**
(`TauCeti.ModCat.Flat F`) if every relation in `F` is trivial.

This **equational criterion** appears for contravariant functors on a preadditive category in [OR,
Thm. 3.2 (4), pp. 96–97, proved through p. 99], and for right modules over rings (applied here to
`Aᵐᵒᵖ`) in [Lam-LMR, (4.24), p. 130] (crediting Chase) and [CE, VI, Exer. 6, p. 123]; see also the
equivalent factorization form in [Lazard, Lemme 1.1, p. 84] (2.3) and Mathlib's commutative
`Module.Flat.iff_forall_isTrivialRelation`. Earlier ring-level formulations for right modules over
arbitrary rings appear in P. M. Cohn, *On the free product of associative rings*, Math. Z. 71
(1959), 380–398, §2, Lemma 2.3, p. 383 (vanishing sums `∑ u_i ⊗ v_i` over a finitely presented `V`
arise from defining relations) and Thm. 2.4, p. 384 (relational criterion for pure submodules), and
in N. Bourbaki, *Algèbre commutative*, Ch. I, §2 (Masson 1985 / Springer 2006 pagination): n° 3,
Prop. 1, p. 26, and Remarque 1, p. 27 (ideal test for all or finitely generated left ideals), and
n° 11, Lemme 10, p. 41, Prop. 13, and Cor. 1, pp. 42–43 (equational criterion).

**Why this definition.** Tensorial definitions of flatness—monomorphism preservation by `- ⊗_C F`,
the ideal test, or `Tor_1(-, F) = 0`—all require the coend `G ⊗_C F` over `C` (constructed under
`EssentiallySmall.{w} C` in 0.3) and compare it with representables in the morphism universe `v`
(Convention 3). Because the equational criterion quantifies only over objects, finite families of
morphisms, and elements of `F` (never over ambient modules), it is well-defined for every
preadditive category `C` and in every value universe without smallness. That generality is essential
both in 2.4—which applies to large abelian and triangulated categories such as `ModuleCat A` or
derived categories—and for rings, where the bridge to `Mod (SingleObj Aᵐᵒᵖ)` holds in arbitrary
universes. When `EssentiallySmall.{v} C` holds, Section 2.2 immediately recovers the familiar
characterizations via the ideal test, exactness of `- ⊗_C F`, vanishing of `Tor_1`, and Lambek's
dual test. (Over a ring, where the tensor product exists unconditionally, Mathlib's commutative
`Module.Flat` can use a tensorial definition directly.)

A covariant functor `G` is flat when `ModCat.Flat G` holds in `ModCat Cᵒᵖ`. For the ideal test, the
finitely generated right ideals of `C` at `X` are the subfunctors `coyonedaSpan β ⊆ Hom(X, -)`
generated by finitely many morphisms `β_j : X → Y_j` (`TauCeti.ModCat.coyonedaSpan`, the image of
`⊕_j Hom(Y_j, -) → Hom(X, -)`, i.e., `TauCeti.ModCat.yonedaSpan` over `Cᵒᵖ`), which for
`C = SingleObj Aᵐᵒᵖ` are the finitely generated right ideals of `A`.

- **Ambient versus intrinsic flatness.** `Flat` always denotes flatness as an object of `Mod C`. An
  object of the full subcategory `Flat(C)` may also be called intrinsically flat inside `Flat(C)`
  when every epimorphism onto it in `Flat(C)` is pure ([CI]); that distinct notion is noted in the
  docstring of `Flat` and is not developed here.

**Rings** (`TauCeti.Module.BalancedFlat A M`). Following Convention 5, left-module flatness is a
native class requiring `I ⊗_A M → A ⊗_A M` (over `R = ℤ`) to be injective for every finitely
generated right ideal `I`; flatness of a right module `M` is `BalancedFlat Aᵐᵒᵖ M`. Bridges identify
`BalancedFlat A M` in every module universe with categorical flatness over `SingleObj Aᵐᵒᵖ`
(`TauCeti.Module.balancedFlat_iff_flat_singleObj` via 0.2 and 0.6, since both sides reduce to the
equational criterion, [Lam-LMR, (4.24)]) and, over commutative rings, with Mathlib's `Module.Flat`
(`TauCeti.Module.balancedFlat_iff_flat` via 0.6).

*Needs:* 0.1–0.3, 0.5, 0.6; Mathlib `Subobject`, `imageSubobject`, `Limits.Sigma.desc`.

### 2.2 Tests

Under `EssentiallySmall.{v} C`, the following conditions on `F : ModCat.{v} C` are equivalent
(`TauCeti.ModCat.flat_tfae`):

1. `F` is flat (the equational criterion, 2.1);
2. **the ideal test**: `I ⊗_C F → Hom(X, -) ⊗_C F ≅ F(X)` is injective for every `X : C` and every
   finitely generated right ideal `I = coyonedaSpan β ⊆ Hom(X, -)` at `X` (for rings, [Lam-LMR,
   (4.12), p. 125], right-handed, applied to `Aᵐᵒᵖ`);
3. `I ⊗_C F → Hom(X, -) ⊗_C F` is injective for every right ideal `I ⊆ Hom(X, -)` at every `X`;
4. `- ⊗_C F` preserves monomorphisms, and is therefore exact on `Mod Cᵒᵖ`
   ([OR, Thm. 3.2 (1), p. 96]; [Mitchell, §10, p. 48]);
5. `Tor_1(-, F) = 0`, which by dimension shifting (1.2, 1.3) implies `Tor_n(-, F) = 0` for all
   `n ≥ 1` (`TauCeti.ModCat.Flat.isZero_tor_succ`);
6. `Tor_1(Hom(X, -) ⧸ I, F) = 0` for every finitely generated `I ⊆ Hom(X, -)` ([OR, Thm. 3.2 (3)],
   stated for arbitrary ideals `I` in OR's factor order, Convention 14);
7. **Lambek's criterion**: the dual `F^E = Hom_R(F(-), E)` (0.7) is injective in `Mod Cᵒᵖ` for an
   injective cogenerator `E` of `R`-modules (`TauCeti.ModCat.flat_iff_injective_dual`; [Lambek,
   Theorem, p. 239] for rings at `E = ℚ ⧸ ℤ`; [St, Thm. 3 (d), p. 357] for functors; the general `E`
   case follows from the adjunction of 0.3, [OR, (1.1), p. 93], and the monomorphism criterion of
   0.7).

**Relations as a kernel** (`TauCeti.ModCat.isTrivialRelation_tfae`). Given finitely many morphisms
`β_j : X → Y_j`, let `b : ⊕_j Hom(Y_j, -) → Hom(X, -)` have kernel `K` and image
`I = coyonedaSpan β`. Then the following are equivalent: every relation `∑_j F(β_j)(y_j) = 0` is
trivial; `K ⊗_C F → (⊕_j Hom(Y_j, -)) ⊗_C F → Hom(X, -) ⊗_C F` is exact; and
`I ⊗_C F → Hom(X, -) ⊗_C F ≅ F(X)` is a monomorphism. Indeed, right exactness and Yoneda (0.3) yield
an exact sequence `K ⊗_C F → ⊕_j F(Y_j) → I ⊗_C F → 0`, and `K(Z)` consists of families
`(α_j : Y_j → Z)` with `∑_j β_j ≫ α_j = 0`, so the image of `K ⊗_C F` is precisely the subgroup of
trivial relations (requiring no finite generation of `K`: `I` is finitely generated without needing
to be finitely presented). Equivalence of the second and third conditions is Mathlib's
`ShortComplex.exact_iff_mono_cokernel_desc`, since `I ⊗_C F` is the cokernel of the first map.

Proof route for `flat_tfae` (with covariant counterparts obtained over `Cᵒᵖ`, such as
`TauCeti.ModCat.Flat.mono_tensor_obj_map` for (4)):

- **(1) ⇒ (3) ⇒ (2) ⇒ (1):** an element of `I ⊗_C F` is a finite sum `∑_j β'_j ⊗ y_j` with
  `β'_j ∈ I(Y_j)`; if its image in `F(X)` vanishes, (1) supplies `α_ij` and `z_i`, and balancing
  rewrites the sum using first factors `∑_j β'_j ≫ α_ij = 0` in `I` ([OR, proof of Thm. 3.2,
  (4) ⇒ (3), p. 98]; for right modules over rings, [CE, VI, Exer. 5–6, pp. 122–123]). The step
  (3) ⇒ (2) is immediate, and (2) ⇒ (1) is `isTrivialRelation_tfae`.
- **(3) ⇒ (7) ⇒ (4) ⇔ (5) ⇒ (6) ⇒ (2):** organized via Lambek and Baer as in [Lam-LMR, (4.12)]
  (applied to `Aᵐᵒᵖ`). By 0.7, (3) says that maps into `F^E` from subfunctors of covariant
  representables extend to the representables, giving (7) by Baer's criterion below over `Cᵒᵖ`;
  (7) ⇒ (4) follows again from 0.7; and (4) ⇔ (5) and (5) ⇒ (6) ⇒ (2) follow from the long exact
  sequences of 1.2 and vanishing of `Tor` at projective covariant functors (1.3), applied to
  `0 → K → P → G → 0` and `0 → I → Hom(X, -) → Hom(X, -) ⧸ I → 0`.

**Finitely presented flat modules are projective**
(`TauCeti.ModCat.Flat.projective_of_isFinitelyPresentedFunctor`). If `F` is finitely presented and
flat, then `Tor_1(Tr F, F) = 0` by (5), so `F` is projective by the `Tor` criterion of 1.4
(`stable End(F) ≅ Tor_1(Tr F, F)`), following [CB, §1.3, proof of (1) ⇒ (2), p. 1646]. See also
[St, Lemma 7 (ii), p. 354, with Thm. 3 (a) ⇔ (c), p. 357], [Lazard, Cor. 1.4, p. 85], [Chase 1960,
Corollary, p. 459] (for rings), and [Mitchell, p. 49]; this route avoids Lazard's theorem, whereas
Lazard's proof by factoring `𝟙 F` through a finite sum of representables is noted as a remark in
2.3.

Two companion targets belong to this section:

- **Baer's criterion for `Mod C`** (`TauCeti.ModCat.Baer`, `TauCeti.ModCat.baer_iff_injective`, new
  beyond Mathlib's ring-level `Module.Baer`). A module `E` in `Mod C` is injective if and only if
  every morphism to `E` from a subfunctor of a representable `Hom(-, X)` extends to `Hom(-, X)`. The
  proof applies Zorn's lemma to partial extensions on the pattern of `Module.Baer.injective`, using
  Yoneda (`F(X) ≅ Hom(Hom(-, X), F)`) to see that representables generate; unlike
  `IsGrothendieckAbelian.generatingMonomorphisms_rlp` (0.1), which tests subobjects of a single
  coproduct separator, this form tests each representable individually and is applied over `Cᵒᵖ` in
  (3) ⇒ (7) above.
- **Commutation of `Tor` with filtered colimits** in the `Mod C` variable
  (`TauCeti.ModCat.preservesFilteredColimits_tor_obj`; [OR, Lemma 3.1, p. 96], used in 2.3 and 2.6).
  Resolving the covariant variable by projectives `P_p` via balance (1.3), each `P_p ⊗_C -`
  preserves colimits (0.3) and filtered colimits are exact in `AddCommGrpCat` (`AB5`).

**Rings** (`TauCeti.Module.balancedFlat_tfae`). Under `[Small.{v} A]` and `M : Type v`, the
following are equivalent ([Lambek, Theorem, p. 239]; [Lam-LMR, (4.9), p. 125], applied to `Aᵐᵒᵖ`):
`BalancedFlat A M`; `I ⊗_A M → M` is injective for every right ideal `I`; `i ⊗ M` is injective for
every injection `i` of right `A`-modules in universe `v`; `Tor_1^A(N, M) = 0` for every right module
`N`; `Tor_1^A(A ⧸ I, M) = 0` for every finitely generated right ideal `I`; and
`Module.Injective Aᵐᵒᵖ M⁺`. This follows either by the same proof using `Module.Baer.injective` over
`Aᵐᵒᵖ` and the duals of 0.6, or via `balancedFlat_iff_flat_singleObj`. In addition, flat modules
have vanishing higher `Tor` (`TauCeti.isZero_balancedTor_succ_of_balancedFlat`), ring `Tor`
preserves filtered colimits (`TauCeti.preservesFilteredColimits_balancedTor_obj`), and finitely
presented flat modules are projective
(`TauCeti.Module.BalancedFlat.projective_of_finitePresentation` via 1.4).

*Needs:* 0.3, 0.4, 0.7, 0.8, 1.1–1.4; Mathlib `ShortComplex.exact_iff_mono_cokernel_desc`,
`Subobject`, `Injective`, `IsCoseparator`, `PreservesFilteredColimitsOfSize`, `AB5`,
`Module.Baer.injective`.

### 2.3 The Lazard block

Lazard's characterizations express flatness through finite presentations ([OR, Thm. 3.2 (4)–(6)];
[Lazard, Ch. I]; [St]; [CB, §1.3]). Over a general preadditive category `C`, they must use finite
coproducts of representables `Hom(-, Z_1) ⊕ ⋯ ⊕ Hom(-, Z_m)` (`TauCeti.ModCat.isFiniteFree`) rather
than single representables: over `ℤ`, the basis elements `e_1, e_2` of the flat module `ℤ²` cannot
be written as multiples `a z, b z` of a single element `z`. When `C` has finite biproducts, the
single-representable statements follow immediately as corollaries without passing to `Mat_ C`.
Throughout, finite presentation means the finite-sum notion of 0.1 (compared with Mathlib's in 0.8).

**Trivializing finitely many relations**
(`TauCeti.ModCat.Flat.exists_factorization_of_comp_eq_zero`). For any `C` and any flat `F` (with no
smallness assumption), given finite sums of representables `U` and `V` and morphisms `d : U → V`,
`f : V → F` satisfying `f ∘ d = 0`, there exist a finite sum of representables `W` and morphisms
`a : V → W`, `g : W → F` with `f = g ∘ a` and `a ∘ d = 0`. When `U`
is a single representable, Yoneda reduces this directly to the equational definition of flatness;
for a finite sum, one inducts over the summands of `U`, composing the current map into `F` with a
further factorization at each step so that previously trivialized relations remain zero ([Stacks,
Tag 058D] for commutative rings; cf. [Lazard, Lemme 1.1, p. 84], and Mathlib's commutative
`Module.Flat.exists_factorization_of_comp_eq_zero_of_free`). Neither tensor products, `Tor`, nor the
transpose enter this lemma.

Under `EssentiallySmall.{v} C`, each of the following conditions on `F : ModCat.{v} C` is equivalent
to flatness:

- **Factorization** (`TauCeti.ModCat.flat_iff_forall_exists_factorization`): every morphism from a
  finitely presented module to `F` factors through a finite sum of representables ([Lazard,
  Lemme 1.1 and Thm. 1.2, p. 84]; [St, Lemma 8 (c), p. 354], factoring through a projective; [CB,
  §1.3 (2), p. 1646]).
- **Filtered category of elements** (`TauCeti.ModCat.FiniteFreeOver F`,
  `TauCeti.ModCat.flat_iff_isFiltered_finiteFreeOver`): the `CostructuredArrow` category of maps to
  `F` from finite sums of representables (modeled on `TauCeti.FiniteFreeOver`) is filtered ([OR,
  Thm. 3.2 (6), p. 97]; [CB, §1.3 (3)]).
- **Lazard–Govorov theorem** (`TauCeti.ModCat.flat_iff_exists_isColimit`): `F` is a small filtered
  colimit of finite sums of representables ([OR, Thm. 3.2 (5), p. 97]; [Mitchell, Thm. 10.1b,
  p. 48]; [CB, §1.3 (4)]; [Lazard, Thm. 1.2]; [Govorov] for free modules over rings; [St, Thm. 3
  (b)] for projectives). Smallness of the indexing diagram is a separate target
  (`TauCeti.ModCat.essentiallySmall_finiteFreeOver`): objects of `FiniteFreeOver F` are classified
  up to isomorphism by finite tuples of objects in a small model of `C` together with elements of
  `F` (on the pattern of `TauCeti.FiniteFreeModuleCat`), allowing the colimit to be indexed over a
  `SmallModel` of `FiniteFreeOver F`.
- **Purity** (`TauCeti.ModCat.IsPureEpi`, `TauCeti.ModCat.flat_iff_forall_isPureEpi`): every
  epimorphism onto `F` is pure, meaning that morphisms from finitely presented modules lift across
  it ([St, §2 and Thm. 3, pp. 353–357, with (c) ⇒ (a) on p. 358]; [Lazard, Cor. 1.3, p. 85]). As a
  **bridge to Mathlib's purity** (`TauCeti.ModCat.isPureEpi_iff_isCardinalPure`), in any short exact
  sequence `0 → K → L → M → 0`, `L → M` is a pure epimorphism if and only if `K → L` satisfies
  `IsCardinalPure` at `ℵ₀` (`Mathlib/CategoryTheory/Presentable/CardinalPure.lean`, lifting against
  `ℵ₀`-presentable squares), proved by a pushout-and-cokernel chase with 0.8; this unlocks Mathlib's
  stability properties and `exists_colimitsOfShape_splitMonomorphisms_of_isCardinalPure` (realizing
  pure monomorphisms as filtered colimits of split monomorphisms; cf. [St, Thm. 3]).

Proof route for the Lazard equivalences:

- **Flatness ⇔ factorization:** a morphism out of `X = coker(d : U → V)` corresponds to `f : V → F`
  with `f ∘ d = 0`, so `exists_factorization_of_comp_eq_zero` produces `a : V → W` descending to
  `X → W`. Conversely, a relation `∑_j F(β_j)(y_j) = 0` defines a morphism to `F` from the cokernel
  of `(β_j) : Hom(-, X) → ⊕_{j=1}^n Hom(-, Y_j)`; factoring that morphism through a finite sum `W`
  of representables annihilates `(β_j)` in `Hom(-, Y_1) ⊕ ⋯ ⊕ Hom(-, Y_n) → W`, and the Yoneda lemma
  converts that composite into witnesses that the relation is trivial.
- **Factorization ⇒ filtered colimit ⇒ flatness, and purity:** `FiniteFreeOver F` is nonempty via
  `0`, binary upper bounds are given by coproducts, and parallel arrows are coequalized by applying
  `exists_factorization_of_comp_eq_zero` to their difference; `F` is the colimit over
  `FiniteFreeOver F` (on the pattern of `flatModuleFilteredFree`), every filtered colimit of finite
  sums of representables is flat (2.6), and purity restates factorization as lifting along an
  epimorphism from a coproduct of representables.

For comparison with the literature, [OR] proves the cycle
`(1) ⇒ (4) ⇒ (3) ⇒ (1) ⇒ (6) ⇒ (5) ⇒ (5′) ⇒ (2) ⇒ (1)` starting from Lemma 1.2 on a free
presentation; [Lazard, Lemme 1.1, Thm. 1.2] and [Lam-LMR, (4.32), p. 133] (applied to `Aᵐᵒᵖ`) derive
factorization by dualizing a finite presentation; and [CB, §1.3, proof of (1) ⇒ (2), p. 1646] uses
`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` ([Auslander78, I, Prop. 3.2]), the transpose argument already
used in 1.4 and 2.2.

Consequences:

- **Alternative proof for finitely presented flat modules:** factoring `𝟙 F` through a finite sum of
  representables immediately exhibits a finitely presented flat module `F` as a retract of a
  projective ([Lazard, Cor. 1.4, p. 85]; [Chase 1960, Prop. 2.2 and Corollary, pp. 458–459] for
  right modules; [OR, Cor. 3.3, p. 99]), though the roadmap target remains 2.2's proof via 1.4.
- **Pure-projective flat modules** (`TauCeti.ModCat.IsPureProjective`,
  `TauCeti.ModCat.Flat.projective_of_isPureProjective`): if `F` is both flat and pure-projective,
  any epimorphism onto `F` from a projective object is pure and therefore splits.
- **Independence of flatness and pure-projectivity:** over `ℤ`, `ℚ` is flat without being projective
  (see checks) and is therefore not pure-projective, whereas `ℤ ⧸ 2` is finitely presented (hence
  pure-projective) without being flat.
- **Additive categories** (`TauCeti.ModCat.flat_iff_isFiltered_costructuredArrow_yoneda`): when `C`
  has finite biproducts, single representables suffice in each characterization ([CB, §1.3], whose
  additive categories have finite biproducts; [OR, Cor. 3.3, p. 99]).

**Rings** (`TauCeti.Module.balancedFlat_iff_isFiltered_finiteFreeOver`,
`TauCeti.Module.BalancedFlat.denseAt`,
`TauCeti.Module.BalancedFlat.exists_factorization_of_finitePresentation`). A left `A`-module `M` is
flat if and only if `FiniteFreeOver A M` is filtered, in which case `M` is the filtered colimit of
finite free modules over it, and every linear map to `M` from a finitely presented module factors
through a finite free module ([Lazard, Thm. 1.2, Cor. 1.4]; [Lam-LMR, (4.30), (4.32)–(4.34),
pp. 133–134], applied to `Aᵐᵒᵖ`; cf. Mathlib's commutative
`Module.Flat.exists_factorization_of_finitePresentation` and
`Module.Flat.projective_of_finitePresentation`). Over a left Noetherian ring, every finitely
generated flat left module is projective by 2.2 and `Module.finitePresentation_of_finite`.

**Refactor consumer.** Tau Ceti's `TauCeti.flatModuleFilteredFree`
(`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`), giving one direction of Lazard's theorem
over commutative rings, is reproved directly from `BalancedFlat.denseAt` and `balancedFlat_iff_flat`
without compatibility shims.

**Bridges to Mathlib's set-valued flatness** (`TauCeti.ModCat.flat_iff_isIndObject`,
`TauCeti.ModCat.flat_iff_isCofiltered_elements`). When `C` is additive, `F : Mod C` is flat if and
only if its underlying set-valued presheaf satisfies `IsIndObject` (via `isIndObject_iff`;
[Krause-Smashing, §2.3, p. 115], `Flat C = Ind C`), and if and only if the category of elements of
`F ⋙ forget` on `Cᵒᵖ` is cofiltered (`Functor.isCofiltered_elements`, which Mathlib states for
covariant functors and we apply to `Cᵒᵖ`). Under this bridge,
`isIndObject_iff_preservesFiniteLimits` is the set-valued counterpart of 2.4. Note that Mathlib's
`RepresentablyFlat u` is covariant: for an additive functor `u : C ⥤ D` between additive
categories, it corresponds to flatness of the covariant functors `D(d, u(-))` in `Mod Cᵒᵖ`
(`StructuredArrow d u`), whereas the contravariant modules `D(u(-), d)` in `Mod C` correspond to
`RepresentablyCoflat`, so the comparison passes through `Cᵒᵖ`.

*Needs:* 0.8, 2.1, 2.2; Mathlib `Module.Flat.exists_factorization_of_comp_eq_zero_of_free`
(pattern), `IsFinitelyPresentable`, `IsCardinalPure`, `CostructuredArrow`, `IsFiltered`,
`IsCofiltered`, `Functor.Elements`, `Cocone`, `IsColimit`, `IsIndObject`, `Functor.DenseAt`,
`Retract`, `SmallModel`; Tau Ceti `TauCeti.FiniteFreeOver`, `TauCeti.FiniteFreeModuleCat` (pattern),
`TauCeti.finiteFreeModuleInclusion`, `TauCeti.flatModuleFilteredFree`.

### 2.4 Left exact functors, triangulated categories and the representation theorem

Throughout 2.4, no smallness is assumed on `C` and modules may take values in any universe; all
proofs work directly with the equational criterion of 2.1.

- **Weak cokernels** (`TauCeti.IsWeakCokernel`, `TauCeti.isWeakCokernel_iff`,
  `TauCeti.ModCat.flat_iff_exact_of_isWeakCokernel`). A morphism `g` is a weak cokernel of `f` when
  `g.op` is a weak kernel of `f.op` in Mathlib's weak-limit API (`IsWeakLimit` of
  `KernelFork.ofι g.op` in `Mathlib/CategoryTheory/Limits/WeakLimits/WeakKernels.lean`, which notes
  weak cokernels as future work), i.e., `f ≫ g = 0` and every `h` with `f ≫ h = 0` factors through
  `g`, not necessarily uniquely ([CB]'s pseudo-cokernels). When an additive category `C` has weak
  cokernels, `F : Mod C` is flat if and only if `F(Z) → F(Y) → F(X)` is exact for every weak
  cokernel `Y → Z` of `X → Y` ([CB, §1.2, Lemma 2, and §1.3, pp. 1644–1646]): under finite
  biproducts, every relation reduces to a single `y ∈ F(Y)` with `F(β)(y) = 0` for `β : X → Y`, and
  morphisms `α` satisfying `β ≫ α = 0` are precisely those factoring through a weak cokernel of `β`.
- **Flatness and left exactness** (`TauCeti.ModCat.flat_iff_preservesFiniteLimits`). Over an
  additive category `C` with cokernels, `F : Mod C` is flat if and only if `F` sends cokernels in
  `C` to kernels—that is, `F : Cᵒᵖ ⥤ Ab` preserves finite limits, so `Flat(Cᵒᵖ, Ab) = Lex(Cᵒᵖ, Ab)`
  ([Fisher, Prop. 1.3 and Thm. 1.4, pp. 279–280, with Thm. 2.4, p. 284] for left exactness implying
  tensor exactness on abelian `C`, and [Fisher, Cor. 2.9, p. 285], covariant, applied to `Cᵒᵖ`, for
  the equivalence; [OR, Cor. 3.4, p. 99]; [CB, §2.2, p. 1649]; [Simson, Thm. 2.1 (b), p. 95],
  stated for contravariant `Cᵒᵖ`-modules as here). Indeed, every cokernel is a weak cokernel, and
  any weak cokernel factors back and forth through the cokernel; dually, over an additive category
  with kernels, flat covariant functors coincide with left exact functors.
- **Triangulated categories** (`TauCeti.ModCat.flat_iff_isHomological`). Over a pretriangulated
  category `C`, a module in `Mod C` is flat if and only if it is cohomological, i.e., homological on
  `Cᵒᵖ` (`Functor.IsHomological` with the scoped instances of `Pretriangulated.Opposite`;
  [Krause-Smashing, Lemma 2.7, p. 115] for skeletally small triangulated `C`, and independently
  [Beligiannis, Lemma 8.10, Prop. 8.11, and Rem. 8.12, pp. 180–181]). Neither smallness nor the
  octahedral axiom is needed here: distinguished triangles furnish weak cokernels via
  `Pretriangulated.isWeakLimitKernelForkOfDistTriangle` on `Cᵒᵖ`, reducing immediately to the
  weak-cokernel characterization above (whereas Krause extends `F` to finitely presented functors
  and computes `Ext` from triangles; both sources also prove equivalence with fp-injectivity, left
  in prose here).

  For historical background on set-valued and additive precursors, see P. Gabriel and F. Ulmer,
  *Lokal präsentierbare Kategorien*, Lecture Notes in Math. 221, Springer (1971), §5, pp. 55–62
  (with 5.5, p. 58 noting flat modules via Lazard) and §7, pp. 71–84; P. Freyd, *Representations in
  abelian categories*, in *Proc. Conf. Categorical Algebra* (La Jolla, 1965), Springer (1966),
  95–120 (weak kernels on p. 99, Thm. 1.4 on pp. 99–102, and Cor. 1.5 on p. 102); and M. Auslander,
  *Coherent functors*, ibid., 189–231 (p. 189).
- **Crawley-Boevey's representation theorem** (`TauCeti.FinitelyPresented`,
  `TauCeti.restrictedYonedaEquivFlat`). Every finitely accessible additive category `𝒜` is
  equivalent via restricted Yoneda `X ↦ Hom(-, X)` on `fp(𝒜)` to the full subcategory of flat
  modules in `Mod fp(𝒜)` ([CB, §1.4, Theorem, p. 1647]). Here finite accessibility is Mathlib's
  `IsFinitelyAccessibleCategory`—existence of filtered colimits and a small filtered-generating set
  of finitely presented objects without assuming all colimits—matching [CB]'s "locally finitely
  presented" (whereas Mathlib's `IsLocallyFinitelyPresentable` adds cocompleteness and would be too
  restrictive; see [CPT, pp. 1214 and 1218]). Because the accessibility universe `w` in which
  `Mod fp(𝒜)` takes values is independent of the object and morphism universes of `𝒜` (moving Hom
  groups to `w` by local smallness), the theorem applies directly to `Flat(C)`. Conversely (writing
  `TauCeti.ModCat.flat` for the object property of flat modules in any universe, with the instance
  `IsFinitelyAccessibleCategory (ModCat.flat C).FullSubcategory` and
  `TauCeti.ModCat.isFinitelyPresentable_flat_iff`), for small additive `C` the flat modules form a
  finitely accessible category whose finitely presented objects are the retracts of representables
  (`Retract`; [CB, §1.4 (1)]), recovering `C` itself in prose when `C` is idempotent complete
  (though `Flat(Cᵒᵖ, Ab)` need not be abelian or Grothendieck).

Pointers (out of scope): combining the representation theorem with Theorem P (Layer 4) on `fp(𝒜)`
characterizes pure-semisimple categories `𝒜` ([CB, §3.2, p. 1655]; [JL, Thm. B.12]), and flat
covers are treated in [BEE, Thm. 3] (rings), [CPT, Cor. 3.3, p. 1218] (`Mod C`), [Rump], and
[Krause-FlatCovers].

*Needs:* 2.1, 2.3; Mathlib `PreservesFiniteLimits`, `HasCokernels`, `HasFiniteBiproducts`,
`IsWeakLimit`, `KernelFork.ofι`, `Pretriangulated.isWeakLimitKernelForkOfDistTriangle`,
`Functor.IsHomological`, `Pretriangulated.Opposite`, `IsFinitelyAccessibleCategory`,
`ObjectProperty.isFinitelyPresentable`, `Retract`.

### 2.5 Bass's flat module

Given a sequence `c_0 → c_1 → c_2 → ⋯` in `C` with morphisms `f_i : c_i → c_{i+1}`, write
`q_n = f_0 ≫ ⋯ ≫ f_{n-1} : c_0 → c_n`.

- **Definition** (`TauCeti.ModCat.bassDiagram`, `TauCeti.ModCat.bassModule`):
  `B = colim(Hom(-, c_0) → Hom(-, c_1) → ⋯)` along the transition maps `Hom(-, f_i)`
  (`Functor.ofSequence` and `colimit`).
- **Flatness and countable presentability:** `B` is flat as a filtered colimit of representables
  (an instance via 2.6) and `ℵ₁`-presentable (`IsCardinalPresentable B ℵ₁` via 0.8 and the telescope
  presentation below).
- **Telescope presentation** (`TauCeti.ModCat.bassTelescope`, `TauCeti.ModCat.bassπ`,
  `TauCeti.ModCat.bassTelescope_shortExact`): there is a short exact sequence
  `0 → ⊕_i Hom(-, c_i) → ⊕_i Hom(-, c_i) → B → 0` sending the `i`-th summand by
  `ι_i - Hom(-, f_i) ≫ ι_{i+1}`; in particular, `B` has projective dimension at most `1`.
- **Vanishing criterion** (`TauCeti.ModCat.isZero_bassModule_iff`): `B = 0` if and only if every
  tail of the sequence has a vanishing composite—for each `i`, some composite `c_i → c_j` (`j ≥ i`)
  is `0`, equivalently the class of `𝟙 c_i` vanishes at a finite later stage (used in 4.1 for
  T-nilpotence).
- **Projectivity implies factorizability** (`TauCeti.IsFactorizable`,
  `TauCeti.ModCat.isFactorizable_of_projective_bassModule`). If `B` is projective, then
  `Functor.ofSequence f` is factorizable: for every `i` there exists `j ≥ i` such that for all
  `k ≥ j`, the composite `c_i → c_j` factors through `c_i → c_k` as `(c_i → c_k) ≫ t` (matching
  Simson's factorizable inverse systems in `Cᵒᵖ`, [Simson, Def. 3.1, p. 99], and in particular
  factoring some `q_n` as `q_m ≫ t` for every `m ≥ n`). Note the quantifier order: factoring `q_m`
  through `q_n` for `m ≥ n` is automatic, and a single step `q_n = q_{n+1} ≫ t` does not yield
  uniform stabilization. For the proof, a splitting of the telescope depends on finitely many
  coordinates at `c_0`, giving the claim at `i = 0`, and replacing the sequence by its tails
  preserves `B` and gives every `i`.

This construction expresses Bass's telescope ([Bass, Lemmas 1.1–1.3, pp. 468–470], with the
splitting calculation in Lemma 1.3) in representable functors, following [Harada, Remark 1,
pp. 339–340] on the non-unital category ring with enough idempotents ([Simson, Thm. 5.4 (5)] reaches
factorizable systems instead via Mittag-Leffler objects).

**Rings** (`TauCeti.bassRelations`, `TauCeti.balancedFlat_bassRelations`,
`TauCeti.exists_span_prod_eq_of_projective_bassRelations`). For `a : ℕ → A`, Bass's left module
`(ℕ →₀ A) ⧸ ⟨eᵢ - aᵢ • eᵢ₊₁⟩` is `B` over `SingleObj Aᵐᵒᵖ` at `f_i = op a_i` (where `Hom(-, f_i)`
acts on `A` as right multiplication by `a_i` and `q_n = op (a_0 ⋯ a_{n-1})`). It is flat, and
whenever it is projective the descending chain `a₀A ⊇ a₀a₁A ⊇ ⋯` of principal right ideals
stabilizes ([Bass, Lemmas 1.1–1.3]; [Lam-FC, (24.24), pp. 367–368], right-handed), supplying the key
implication in Theorem P (4.5).

*Needs:* 2.3; Mathlib `Functor.ofSequence`, `colimit`, `Limits.Sigma.desc`,
`ShortComplex.ShortExact`.

### 2.6 Closure properties

Basic closure properties of `ModCat.Flat` (`TauCeti.ModCat.Flat.of_projective` as an instance,
`TauCeti.ModCat.Flat.of_retract`, `TauCeti.ModCat.flat_sigma_iff`,
`TauCeti.ModCat.flat_iff_of_shortExact`, `TauCeti.ModCat.Flat.of_isColimit`,
`TauCeti.ModCat.flat_iff_mono_tensor_of_shortExact`) separate those proved directly from the
equational criterion without smallness (retracts, coproducts, filtered colimits) from those using
`⊗_C` and `Tor`:

- **Projectives:** every projective module is flat (0.4).
- **Retracts and coproducts:** retracts of flat modules are flat (`Retract`), and a coproduct is
  flat if and only if every summand is flat.
- **Extensions and kernels:** in a short exact sequence `0 → F_1 → F_2 → F_3 → 0` with `F_3` flat,
  `F_2` is flat if and only if `F_1` is flat ([Mitchell, Cor. 10.4b, p. 49], via the long exact
  sequence of 1.3).
- **Filtered colimits:** filtered colimits of flat modules are flat (by 2.2, since `Tor` commutes
  with filtered colimits, or directly from 2.1; [Mitchell, p. 48]; [CB, §1.3]).
- **Flat quotients:** in `0 → K → P → F → 0` with `P` flat, `F` is flat if and only if
  `N ⊗_C K → N ⊗_C P` is a monomorphism for every covariant `N` ([Lam-FC, (24.23), p. 367],
  right-handed for rings).

**Rings** (`TauCeti.Module.BalancedFlat.of_projective`,
`TauCeti.Module.BalancedFlat.of_linearEquiv`, `TauCeti.Module.balancedFlat_directSum_iff`,
`TauCeti.Module.balancedFlat_iff_of_exact`,
`TauCeti.Submodule.inf_smul_eq_smul_of_balancedFlat`): the same closure results hold for
`BalancedFlat` (cf. [Lam-LMR, (4.13), p. 126] for extensions, with the kernel direction from the
`Tor` sequence), together with the ideal-intersection test `K ⊓ I • F = I • K` for any two-sided
ideal `I` when `F` and `F ⧸ K` are flat ([Lam-LMR, (4.14), p. 126], specializing `N = A ⧸ I`, noted
in the alternative `R ⧸ J` route of 4.5).

Pointers (out of scope): over an additive category `C`, products of flat modules in `Mod C` are flat
if and only if `C` has weak cokernels ([CB, Thm. 2.1, p. 1648] for skeletally small additive `C`;
[OR, Thm. 4.1 (5), p. 101], covariant in `[X, Mod K]` and applied to `Cᵒᵖ`; Chase's theorem for
rings, [Lam-LMR, (4.47), p. 139]). Additivity of `C` is essential here: for the one-object category
of the Artinian ring `k[x, y] ⧸ (x, y)²`, products of flat modules are flat even though `x` has no
weak cokernel. Closure of flat modules under kernels holds if and only if weak global dimension is
at most `2` ([CB, Thm. 2.3, p. 1651], proved in 3.5), while coherence and product closure are not
developed here.

*Needs:* 0.4, 2.1–2.3; Mathlib `Retract`, `IsFiltered`.

**Checks.**

- Over `ℤ`, `ℚ` is flat (2.1 and `Module.Flat`) and not projective
  (`TauCeti.balancedFlat_rat_and_not_projective`, since a split embedding into a free abelian group
  would yield a nonzero homomorphism `ℚ → ℤ`, whereas `Hom_ℤ(ℚ, ℤ) = 0`), hence not pure-projective
  (2.3).
- `ℤ ⧸ n` is not flat for `n ≥ 2` (`TauCeti.not_balancedFlat_zmod`, as `Tor_1^ℤ(ℤ ⧸ n, ℤ ⧸ n) ≠ 0`,
  Layer 1 checks).
- Over `B = k[ε]/(ε²)`, `k` is not flat since `Tor_1^B(k, k) ≅ k` (Layer 1 checks).
- Over `T₂(k)`, the projective simple left module is flat while the non-projective simple left
  module is finitely presented and hence not flat (2.2), so `T₂(k) ⧸ J` is semisimple without being
  flat; by 1.7, the same holds over the quiver `1 → 2`.
- Bass's `ℤ`-module for the constant sequence `p` is `ℤ[1/p]`, which is flat and non-projective,
  matching the non-stabilizing chain `pℤ ⊋ p²ℤ ⊋ ⋯`.
- Representables `Hom(-, X)` and `Hom(X, -)` are projective and therefore flat (2.6).
- In the `k`-linear category of `0 → 1 → 2 → ⋯`, the sequence `f_i : i → i + 1` has nonzero
  composites `q_n : 0 → n` and `Hom(m, n) = 0` for `m > n`, so no `q_n` factors through a later
  `q_m`; thus the sequence is not factorizable and its Bass module `B` is flat but not projective
  (2.5).

### Examples

Examples cover rings (`ℚ`, `ℤ[1/p]`, and `ℤ ⧸ n` over `ℤ`, and simple modules over `T₂(k)` and
`k[ε]/(ε²)`) and categories (representables, Bass modules of quiver sequences, left exact functors
on abelian categories, and cohomological functors on triangulated categories).

### Dependencies

Layers 0 and 1.

## Layer 3: flat dimension, global and weak global dimension

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{v} C`, and
modules live in the morphism universe `v`, as in Layer 2. Because `Tor` takes values in
`AddCommGrpCat` (1.1), no base ring enters the homological dimensions. Sections 3.1–3.4 conclude
with their ring-level statements; unless a categorical reference is cited explicitly, the
categorical theorems adapt the ring theorems cited alongside them.

### 3.1 Flat dimension

A module `F` in `Mod C` has **flat dimension `< n`** (`TauCeti.ModCat.HasFlatDimensionLT F n`) if
`Tor_i(Hom(X, -) ⧸ I, F) = 0` for every `i ≥ n`, every `X : C`, and every finitely generated
subfunctor `I = coyonedaSpan β ⊆ Hom(X, -)` (2.1). We set `HasFlatDimensionLE F n`
(`TauCeti.ModCat.HasFlatDimensionLE`) to be `HasFlatDimensionLT F (n + 1)` and define
`flatDimension F : WithBot ℕ∞` (`TauCeti.ModCat.flatDimension`) as the infimum of those `d` such
that `HasFlatDimensionLT F i` holds for all `i > d`, matching Mathlib's `projectiveDimension` (which
is defined by `Ext` vanishing rather than resolution length). Because the predicate quantifies only
over objects and finite families of morphisms in `C`, it introduces no extra universe parameter. At
`n = 0`, `HasFlatDimensionLE F 0` reduces to 2.2 (6) and therefore agrees with flatness; at `i = 0`,
`Tor_0(Hom(X, -), F) ≅ F(X)` shows that `flatDimension F = ⊥` if and only if `F = 0`. Covariant
functors take their flat dimension as objects of `Mod Cᵒᵖ`, with no duplicate declarations.

**Equivalence with resolutions and syzygies** (`TauCeti.ModCat.hasFlatDimensionLE_tfae`). For
`n : ℕ`, the following are equivalent:

1. `HasFlatDimensionLE F n`;
2. `Tor_i(G, F) = 0` for every covariant `G` and every `i > n` (stated in Lean for `G` in universe
   `v`, though valid in every universe);
3. `Tor_{n+1}(G, F) = 0` for every covariant `G`;
4. `F` admits a flat resolution `0 → K_n → ⋯ → K_0 → F → 0` of length at most `n` (the classical
   resolution definition);
5. the `n`-th syzygy `P.complex.opcycles n = coker(P_{n+1} → P_n)` (`F` at `n = 0`) of every
   projective resolution `P` of `F` is flat;
6. the `n`-th syzygy of some projective resolution of `F` is flat.

Proof route, using dimension shifting in both variables (1.2, 1.3) and vanishing of higher `Tor` on
projectives:

- **(3) ⇒ (2) ⇒ (1):** dimension shifting in `G` upgrades (3) to (2), and (2) ⇒ (1) is immediate.
- **(1) ⇒ (5) ⇒ (6) ⇒ (4) ⇒ (3):** for the `n`-th syzygy `K` of `P`, `Tor_1(-, K) ≅
  Tor_{n+1}(-, F)`, so 2.2 (6) gives (1) ⇒ (5); truncating `P` at `K` gives (5) ⇒ (6) ⇒ (4); and
  (4) ⇒ (3) computes `Tor` from the flat resolution `K → F` below.

Companion API:

- **Order and base cases:** `flatDimension F ≤ n ↔ HasFlatDimensionLE F n`
  (`TauCeti.ModCat.flatDimension_le_iff`), `flatDimension F = ⊥ ↔ F = 0`
  (`TauCeti.ModCat.flatDimension_eq_bot_iff`), and `HasFlatDimensionLE F 0 ↔ Flat F`
  (`TauCeti.ModCat.hasFlatDimensionLE_zero_iff`).
- **Comparison with projective dimension:** `flatDimension F ≤ projectiveDimension F`
  (`TauCeti.ModCat.flatDimension_le_projectiveDimension`, since projectives are flat, 2.6).
- **Dimension shifting** (`TauCeti.ModCat.hasFlatDimensionLE_succ_iff`): in `0 → K → P → M → 0`
  with `P` flat, `HasFlatDimensionLE M (n + 1) ↔ HasFlatDimensionLE K n`.
- **Computing `Tor` from flat resolutions** (`TauCeti.ModCat.torObjIsoHomologyOfFlat`): for any flat
  resolution `K → F`, `Tor_n(G, F) ≅ H_n(G ⊗_C K)`, proved by resolving `G` by projectives via
  balance (1.3) and using exactness of `- ⊗_C K_q` (2.2).
- **Duality** (`TauCeti.ModCat.flatDimension_eq_injectiveDimension_dual`): for any injective
  cogenerator `E` of `R`-modules, `flatDimension F = injectiveDimension (F^E)` in `Mod Cᵒᵖ`,
  combining `Tor`–`Ext` duality in every degree (1.5) with zero-detection by `E` (0.7); this
  generalizes [Lam-LMR, (5.57), p. 184] (rings, `E = ℚ ⧸ ℤ`, applied to `Aᵐᵒᵖ`).

**Rings** (`TauCeti.HasFlatDimensionLT`, `TauCeti.HasFlatDimensionLE`, `TauCeti.flatDimension`).
Flat dimension over rings is defined natively for `M : ModuleCat.{v} A` under `[Small.{v} A]` by
vanishing of `Tor_i^A(A ⧸ I, M)` for `i ≥ n` and finitely generated right ideals `I`, with matching
API (`TauCeti.flatDimension_eq_bot_iff`, `TauCeti.hasFlatDimensionLE_zero_iff`,
`TauCeti.hasFlatDimensionLE_tfae`, `TauCeti.flatDimension_le_projectiveDimension`,
`TauCeti.hasFlatDimensionLE_succ_iff`), the character-module formula
`flatDimension M = injectiveDimension M⁺` in `ModuleCat Aᵐᵒᵖ`
(`TauCeti.flatDimension_eq_injectiveDimension_characterModule`; [Lam-LMR, (5.57)], applied to
`Aᵐᵒᵖ`, specializing `R = ℤ` and `E = ℚ ⧸ ℤ`), and the categorical bridge
`TauCeti.hasFlatDimensionLT_iff_singleObj` via 0.2.

*Needs:* 1.1–1.3, 1.5, 2.1, 2.2, 2.6; Mathlib `HomologicalComplex.opcycles`, `QuasiIso`,
`ChainComplex.single₀`, `ProjectiveResolution`, `injectiveDimension`.

### 3.2 Global dimension of an abelian category

For any abelian category `𝒜`, we define `TauCeti.Abelian.globalDimension 𝒜 :=
⨆ X : 𝒜, projectiveDimension X` as the supremum of Mathlib's `projectiveDimension` ([Mitchell, §9,
p. 42], defining the right and left global dimensions of a small additive category `C` via its two
module categories). Requiring no tensor product, this applies to every abelian category and
specializes to `Abelian.globalDimension (ModCat C)`, `Abelian.globalDimension (ModCat Cᵒᵖ)`, and
`Abelian.globalDimension (ModuleCat A)`.

- **Basic bounds** (proved in `Suggested.lean`): `projectiveDimension X ≤ globalDimension 𝒜`
  (`TauCeti.Abelian.projectiveDimension_le_globalDimension`), `globalDimension 𝒜 ≤ n` if and only if
  every object has projective dimension at most `n` (`TauCeti.Abelian.globalDimension_le_iff`), and
  `globalDimension 𝒜 = ⊥` if and only if every object is zero
  (`TauCeti.Abelian.globalDimension_eq_bot_iff`).
- **Injective and opposite characterizations:** `globalDimension 𝒜` equals the supremum of
  `injectiveDimension` (`TauCeti.Abelian.globalDimension_eq_iSup_injectiveDimension`, since both
  express `Ext^i` vanishing above `n`), giving `globalDimension 𝒜ᵒᵖ = globalDimension 𝒜`
  (`TauCeti.Abelian.globalDimension_opposite`; [Mitchell, §9, p. 42]).
- **Equivalence invariance** (`TauCeti.Abelian.globalDimension_eq_of_equivalence`): any equivalence
  of abelian categories is exact, preserves `Ext` groups, and therefore preserves
  `projectiveDimension` (a companion lemma via `hasProjectiveDimensionLT_iff`).

**Auslander's lemma for `Mod C`** (`TauCeti.ModCat.globalDimension_le_iff_cyclic`). We have
`Abelian.globalDimension (ModCat C) ≤ n` if and only if every cyclic module `Hom(-, X) ⧸ I` (for any
subfunctor `I ⊆ Hom(-, X)`) has projective dimension at most `n` ([Au, Thm. 1, p. 68] for rings). To
see this, `globalDimension ≤ n` means every module `E` has injective dimension at most `n`. Because
`Mod C` is Grothendieck and has enough injectives (0.1), `E` admits an injective coresolution up to
its `n`-th cosyzygy `E'`; by Baer's criterion (2.2), `E'` is injective if and only if
`Ext^1(Hom(-, X) ⧸ I, E') = 0` for all `X` and `I`, which dimension-shifts to
`Ext^{n+1}(Hom(-, X) ⧸ I, E) = 0`. Applying this to `Cᵒᵖ` gives the covariant cyclic test on
`Hom(X, -) ⧸ I`, and specializing to `C = SingleObj Aᵐᵒᵖ` recovers `TauCeti.globalDimension_le_tfae`
along with its finite and cyclic refinements.

- **Universe independence** (`TauCeti.ModCat.globalDimension_eq_globalDimension`): if `C` is
  essentially small in two universes, Auslander's lemma computes both global dimensions on the
  cyclic modules over a common small model; in particular, the global dimension of a ring is
  independent of the module universe.

**Rings (refactor of Tau Ceti).** Tau Ceti's `TauCeti.globalDimension A`
(`⨆ M : ModuleCat.{v} A, projectiveDimension M`) becomes the specialization
`Abelian.globalDimension (ModuleCat.{v} A)` (`TauCeti.globalDimension_eq_abelianGlobalDimension`,
proved in `Suggested.lean` from `TauCeti.globalDimension_def`), with its existing API derived as
corollaries without compatibility shims, `TauCeti.globalDimension_le_tfae` reproved via Auslander's
lemma, and the categorical bridge `TauCeti.globalDimension_eq_globalDimension_singleObj` obtained
from 0.2.

*Needs:* 0.1 (enough injectives), 0.2, 2.2 (Baer); Mathlib `projectiveDimension`,
`projectiveDimension_le_iff`, `projectiveDimension_eq_bot_iff`, `injectiveDimension`, `Subobject`,
`hasProjectiveDimensionLT_iff`; Tau Ceti `TauCeti.globalDimension`, `TauCeti.globalDimension_def`.

### 3.3 Weak global dimension

For an essentially small preadditive category `C`, we define
`TauCeti.ModCat.weakGlobalDimension C := ⨆ F : ModCat C, flatDimension F` (requiring the tensor
product over `C`, and therefore defined for categories and rings rather than arbitrary abelian
categories). In [OR, p. 103], weak global dimension is defined by `Tor` vanishing, shown independent
of the base ring, and shown equal for `X` and `X°`.

- **Characterization by `Tor`** (`TauCeti.ModCat.weakGlobalDimension_le_iff`):
  `weakGlobalDimension C ≤ n` if and only if `Tor_{n+1}` vanishes on all pairs.
- **Left-right symmetry** (`TauCeti.ModCat.weakGlobalDimension_op`):
  `weakGlobalDimension Cᵒᵖ = weakGlobalDimension C`, so weak global dimension also equals the
  supremum of flat dimensions over covariant functors; this follows from balance (1.3),
  `ModCat.opOpEquiv` (0.5) to compare suprema, and `weakGlobalDimension_le_iff` ([Au, p. 70];
  [Lam-LMR, (5.63), p. 185]; [OR, p. 103]).
- **Universe-free cyclic and finitely presented tests**
  (`TauCeti.ModCat.weakGlobalDimension_le_tfae`): for `n : ℕ`, `weakGlobalDimension C ≤ n` if and
  only if every cyclic covariant functor `Hom(X, -) ⧸ I` with `I` finitely generated has flat
  dimension at most `n`, and if and only if every finitely presented covariant functor has flat
  dimension at most `n` ([Lam-LMR, (5.69), p. 187] for cyclic right modules over rings). Unfolding
  `flatDimension`, the second condition tests `Tor` exclusively on finitely presented cyclic modules
  in both variables: the first condition implies the third by symmetry, the third implies the
  second, and by 3.1 the second means `Tor_{n+1}(Hom(X, -) ⧸ I, F) = 0` for every `F : Mod C`, i.e.,
  `HasFlatDimensionLE F n`.
- **Global-dimension bounds** (`TauCeti.ModCat.weakGlobalDimension_le_globalDimension`,
  `TauCeti.ModCat.weakGlobalDimension_le_globalDimension_op`): `weakGlobalDimension C` is bounded
  above by the global dimensions of both `Mod C` and `Mod Cᵒᵖ` (by 3.1 and symmetry; [Lam-LMR,
  (5.58), p. 184]).
- **Bound from finitely presented projective dimension**
  (`TauCeti.ModCat.weakGlobalDimension_le_of_forall_isFinitelyPresentedFunctor`): if every finitely
  presented covariant functor has projective dimension at most `n`, then `weakGlobalDimension C ≤ n`
  (by `weakGlobalDimension_le_tfae` and 3.1), supplying the weak-dimension step for ArtinAlgebras
  §7.5 (Downstream consumers).
- **Low-dimension cases** (`TauCeti.ModCat.weakGlobalDimension_eq_bot_iff`,
  `TauCeti.ModCat.weakGlobalDimension_le_zero_iff`): `weakGlobalDimension C = ⊥` if and only if
  every object of `C` is zero (so every module is zero), and `weakGlobalDimension C ≤ 0` if and only
  if every module is flat—equivalently, `C` is von Neumann regular, every morphism `α` admitting `φ`
  with `α = α φ α` ([St, Thm. 4, (a) ⇔ (f′), p. 359], applied to the representable generator). In
  particular, a semisimple category (global dimension `0`, [Mitchell, §9, p. 42]) with a nonzero
  object has weak global dimension `0`.

**Rings** (`TauCeti.weakGlobalDimension A := ⨆ M : ModuleCat.{v} A, flatDimension M`). Weak global
dimension over rings is defined natively, with matching lemmas `TauCeti.weakGlobalDimension_le_iff`,
`TauCeti.weakGlobalDimension_mulOpposite`, `TauCeti.weakGlobalDimension_le_globalDimension`,
`TauCeti.weakGlobalDimension_le_globalDimension_mulOpposite`, `TauCeti.weakGlobalDimension_le_tfae`
(via finitely presented and cyclic right modules),
`TauCeti.weakGlobalDimension_le_of_forall_finitePresentation`,
`TauCeti.weakGlobalDimension_eq_bot_iff` (characterizing the zero ring),
`TauCeti.weakGlobalDimension_eq_zero_of_isSemisimpleRing`, and the categorical comparison
`TauCeti.weakGlobalDimension_eq_weakGlobalDimension_singleObj` via 0.2.

*Needs:* 1.3, 2.2, 3.1, 3.2; Mathlib `IsFinitelyPresentable`.

### 3.4 Auslander's theorem

Say that `C` is **Noetherian on the `Mod C` side** when every representable `Hom(-, X)` is a
Noetherian object of `Mod C` (`IsNoetherianObject`, ascending chain condition on subobjects). At
`C = SingleObj Aᵐᵒᵖ`, `Hom(-, ∗)` is the regular left module `A`, so this condition specializes to
`IsNoetherianRing A`.

- **The `FP_∞` lemma**
  (`TauCeti.ModCat.flatDimension_eq_projectiveDimension_of_projectiveResolution`), a standalone
  public target requiring no Noetherian hypothesis. Any module admitting a resolution by finitely
  generated projectives (`proj C`, 0.8) has equal flat and projective dimensions: if its flat
  dimension is `n`, its `n`-th syzygy `coker(P_{n+1} → P_n)` is both flat (3.1) and finitely
  presented, hence projective by 2.2 and 1.4, bounding projective dimension by `n` ([CE, VI, remark
  after Prop. 5.3, pp. 120–121] for resolutions by finitely generated projectives; [CE, VI, Exer. 3,
  p. 122] for finitely generated modules over left Noetherian rings). For rings
  (`TauCeti.flatDimension_eq_projectiveDimension_of_projectiveResolution`), every finitely generated
  module over a left Noetherian ring has such a resolution (`Module.finitePresentation_of_finite`;
  `TauCeti.flatDimension_eq_projectiveDimension_of_finite`).
- **Auslander's theorem** (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension`). If every
  `Hom(-, X)` is Noetherian, then `Abelian.globalDimension (ModCat C) = weakGlobalDimension C` ([Au,
  Thm. 4, p. 70]; [Lam-LMR, (5.59), p. 184], stated for right Noetherian rings and applied to
  `Aᵐᵒᵖ`). By Auslander's lemma (3.2), `globalDimension (ModCat C)` is the supremum of projective
  dimensions over cyclic modules `Hom(-, X) ⧸ I`. Because finite coproducts of Noetherian objects
  are Noetherian, every subobject of a finite coproduct of representables is finitely generated, so
  each `Hom(-, X) ⧸ I` has a resolution in `proj C`; the `FP_∞` lemma then gives
  `projectiveDimension (Hom(-, X) ⧸ I) = flatDimension (Hom(-, X) ⧸ I) ≤ weakGlobalDimension C`, and
  3.3 supplies the reverse inequality. Applying the theorem to `Cᵒᵖ` together with symmetry (3.3)
  gives the opposite-side statement when every `Hom(X, -)` is Noetherian.

In the categorical literature, [OR, Thm. 4.3, pp. 103–104] proves that when `[X°, Mod K]` is locally
coherent, the global dimension of coherent functors equals the weak global dimension of `X` (using
projectivity of finitely presented flat functors); our statement for all of `Mod C` under Noetherian
representables adapts [Au, Thm. 4] by the same mechanism (see also [Mitchell, §9, pp. 42–45] on
global dimensions of small additive categories and matrix rings).

**Corollaries.**

- **One-sided Noetherian bound**
  (`TauCeti.ModCat.globalDimension_le_of_forall_isFinitelyPresentedFunctor`): if every `Hom(-, X)`
  is Noetherian and every finitely presented covariant functor has projective dimension at most `n`,
  then `Abelian.globalDimension (ModCat C) ≤ n` (combining 3.3 with Auslander's theorem, with no
  Noetherian assumption on `Cᵒᵖ`); its ring specialization
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` feeds directly into
  ArtinAlgebras §7.5 (Downstream consumers).
- **Two-sided symmetry** (`TauCeti.ModCat.globalDimension_op_eq_of_isNoetherianObject`): if every
  `Hom(-, X)` and every `Hom(X, -)` is Noetherian, `Mod C` and `Mod Cᵒᵖ` have equal global dimension
  ([Au, Cor. 5, p. 70]), recovering left-right symmetry of global dimension for two-sided Noetherian
  rings (ArtinAlgebras §7.2).

**Rings** (`TauCeti.globalDimension_eq_weakGlobalDimension`): under `[IsNoetherianRing A]` and
`[Small.{v} A]`, `globalDimension.{v} A = weakGlobalDimension.{v} A`.

**Refactor consumer: left-right global dimension comparisons.** Tau Ceti currently proves the
two-sided Noetherian global-dimension comparisons of ArtinAlgebras §7.2 (and their underlying
one-sided inequality) via injective dimensions of character modules. Their statements are retained
(as ArtinAlgebras §7.5 uses them) while their proofs are replaced by Auslander's theorem combined
with the bounds and symmetry of 3.3. The character-module injective-dimension criterion is likewise
retained and reproved from the `R = ℤ`, `E = ℚ ⧸ ℤ` duality of 3.1 and the `FP_∞` lemma, keeping the
right-module structure on character modules (also used in 2.2's Lambek test).

*Needs:* 2.2, 2.3, 3.1–3.3; Mathlib `IsNoetherianObject`, `Module.finitePresentation_of_finite`.

### 3.5 Kernels of flat modules and countably presented flat modules

- **Closure under kernels** (`TauCeti.ModCat.forall_flat_kernel_iff`). Flat modules in `Mod C` are
  closed under kernels of morphisms if and only if `weakGlobalDimension C ≤ 2` ([CB, Thm. 2.3,
  p. 1651] for small additive `C`, which also adds an equivalent morphism-factorization property),
  proved by dimension shifting along `0 → ker f → F → F' → coker f → 0` and conversely along a
  projective presentation `0 → K → P_1 → P_0 → M → 0`.
- **Sequential colimits of projectives** (`TauCeti.ModCat.hasProjectiveDimensionLE_one_colimit`).
  The colimit of any sequence `D_0 → D_1 → ⋯` of projective objects in `Mod C` has projective
  dimension at most `1`, via the telescope short exact sequence `0 → ⊕ D_i → ⊕ D_i → colim D → 0`
  (2.5).
- **Countably presented flat modules** (`TauCeti.ModCat.Flat.hasProjectiveDimensionLE_one`). Any
  flat module `F` that is countably presented (`IsCardinalPresentable` at `ℵ₁`, 0.8; regularity of
  `ℵ₁` is supplied locally in `Suggested.lean` via `Cardinal.isRegular_aleph_one` so no `Fact`
  binder appears) has projective dimension at most `1` ([Jensen, Lemma 2, pp. 98–100];
  [Osofsky-Nagoya, Lemma 1.2, p. 316]; [Mitchell, p. 49]), with Bass's sequence module (2.5) as the
  prototypical example.

  To prove this by retracts without claiming an isomorphism between `F` and a sequential colimit,
  express `F` as a filtered colimit of finite sums of representables `D_k` (2.3) and choose a
  countable presentation `⊕_j Hom(-, Y_j) → ⊕_i Hom(-, X_i) → F → 0` (0.8). Construct a sequence
  `k_0 → k_1 → ⋯` in the index category recursively: at step `n`, use finite presentability of
  representables and filteredness to lift the `n`-th generator and any not-yet-lifted generators
  appearing in the `n`-th relation to a common stage receiving all earlier lifts (fixing each
  generator's lift once chosen and pushing it forward along transition maps thereafter), and then
  advance to a further stage where the `n`-th relation vanishes on those lifts. The chosen lifts
  assemble to a section `s : F → colim_n D_{k_n}` of the canonical map `p : colim_n D_{k_n} → F`
  (`s ≫ p = 𝟙` on generators), exhibiting `F` as a retract of a sequential colimit of projectives
  and hence giving `projectiveDimension F ≤ 1`. ([Mitchell, p. 50] remarks that Lazard's original
  countable-case argument in [Lazard, Thm. 3.2, p. 89] contained a slight gap later repaired by
  Lazard; passing through a retract avoids having to extract a countable cofinal subsystem with
  colimit `F`.)
- **Pointer (out of scope):** more generally, an `ℵ_n`-presented flat module has projective
  dimension at most `n + 1` ([Simson, Thm. 2.12 (c), p. 98] for functor categories; [Osofsky-Nagoya,
  Thm. 1.3, pp. 316–317] for `ℵ_k`-generated submodules `B` of free modules `F` with `F ⧸ B` flat;
  [Mitchell, pp. 49–50], noting optimality via the directed functors of [Mitchell, §36, Thm. 36.8,
  p. 149]).

Ring specializations of 3.5 follow immediately through 0.2 without separate target declarations;
equality of flat and projective dimensions over perfect categories belongs to Theorem P (4.5).

*Needs:* 0.8, 2.3, 2.5, 3.1, 3.3; Mathlib `IsCardinalPresentable`, `Cardinal.isRegular_aleph_one`,
`colimit`, `kernel`, `Retract`.

**Checks.** In Lean (final section of `Suggested.lean`):

- A field has weak global dimension `0` (`TauCeti.weakGlobalDimension_field`), and the zero ring has
  weak global dimension `⊥` (`TauCeti.weakGlobalDimension_punit`).
- `ℤ` has weak and global dimension `1` (`TauCeti.weakGlobalDimension_int`), since
  `Tor_1^ℤ(ℤ ⧸ 2, ℤ ⧸ 2) ≠ 0` while every ideal `I ⊆ ℤ` is free, giving `pd(ℤ ⧸ I) ≤ 1` and
  `globalDimension ℤ ≤ 1` via `TauCeti.globalDimension_le_tfae`.
- `B = k[ε]/(ε²)` (`DualNumber k`) has weak and global dimension `⊤`
  (`TauCeti.weakGlobalDimension_dualNumber`; Layer 1 checks).
- `T₂(k)` (`Matrix.blockTriangularSubalgebra k k id` on `Fin 2`) has weak and global dimension `1`
  (`TauCeti.weakGlobalDimension_upperTriangular`): `T ⧸ J` is not flat because one of its two simple
  summands is finitely presented and non-projective (2.6 checks), while `J` is projective (Layer 1
  checks).
- The `k`-linear category of `0 → 1` (`CategoryTheory.Free k (Fin 2)`) has global dimension `1` on
  `Mod C` (`TauCeti.globalDimension_free_fin_two`) via its category algebra `T₂(k)` (1.7; [Mitchell,
  §9, p. 45, (6)], covariant, applied to `Cᵒᵖ`).

In prose, illustrating sharpness of the hypotheses:

- **Small's triangular ring** `R = [[ℤ, ℚ], [0, ℚ]]` is right Noetherian and right hereditary but
  not left hereditary, satisfying `globalDimension Rᵐᵒᵖ = weakGlobalDimension R = 1 <
  globalDimension R` ([Lam-LMR, (5.62b), p. 185], with structure proved in [Lam-LMR, (2.33),
  pp. 46–47] and credited to L. Small in [Lam-LMR, §2F, p. 45]). In L. W. Small, *An example in
  Noetherian rings*, Proc. Nat. Acad. Sci. U.S.A. 54 (1965), 1035–1036, for any commutative
  Noetherian domain `R` of global dimension `n > 0` with fraction field `Q`, `[[R, Q], [0, Q]]` is
  right but not left Noetherian (p. 1035, before the Theorem), with right global dimension `n` and
  strictly larger left global dimension (`R = ℤ` on p. 1036); thus Auslander's theorem holds on
  `Rᵐᵒᵖ` and fails on the non-left-Noetherian side `R`.
- **Pierce's free Boolean ring**, as analyzed by Osofsky: for `|J| = ℵ₂`, the free Boolean ring
  `B = 𝔽₂[x_j : j ∈ J] ⧸ (x_j² - x_j)` is von Neumann regular (every finitely presented module is
  projective, giving `weakGlobalDimension B = 0` by 3.3), yet has global dimension `3`, showing that
  Auslander's theorem requires the Noetherian hypothesis. Specifically, for the ideal `I` generated
  by the `x_j`, [Osofsky-Card, Thm. A, p. 644] (using nice families from p. 641) gives `pd I = 2`
  and hence `pd(B ⧸ I) = 3`, while [Osofsky-Nagoya, Cor. 1.4, p. 318] (`gldim R ≤ wgldim R + n + 1`
  when right ideals need at most `ℵ_n` generators; p. 319 credits Pierce) gives `gldim B ≤ 3` (cf.
  [Pierce, Cor. 2.2, p. 92, and Cor. 5.2, p. 97], proving `gldim = n + 1` on `ℵ_n` generators).
- **Jategaonkar's domains:** for every `1 ≤ n ≤ ∞`, there exists a principal left ideal domain `D`
  of right global dimension `n` ([Jategaonkar, Thm. 4.10, pp. 438–439]); `D` is left Noetherian with
  `globalDimension D = weakGlobalDimension D = 1`, showing that two-sided symmetry requires
  Noetherianness on both sides when `n ≥ 2`.
- **Linear `A_∞` quiver:** the `k`-linear category of `0 → 1 → 2 → ⋯` is hereditary on both sides
  (global and weak global dimensions `1`), and its Bass module from 2.5 is flat and non-projective
  of projective dimension `1`.

### Examples

Examples include fields, `ℤ`, `k[ε]/(ε²)`, `T₂(k)`, and the quiver category `0 → 1`; Small's ring,
Pierce's free Boolean ring, and Jategaonkar's domains testing the Noetherian hypotheses; and
hereditary quiver categories.

### Dependencies

Layers 1 and 2.

## Layer 4: semiperfect and perfect categories, and Bass's Theorem P

Throughout, `C : Type u` is preadditive with `Category.{v} C`. Here `J(C)` denotes Tau Ceti's
radical `TauCeti.jacobsonRadicalIdeal C`, satisfying `J(C)(X, X) = Ring.jacobson (End X)`
(`TauCeti.jacobsonRadical_self_eq_jacobson`), and `C ⧸ J(C)` denotes Tau Ceti's quotient category
`(TauCeti.jacobsonRadicalIdeal C).Quotient`. Modules live in `Mod C` (contravariant functors);
covariant sources such as [Simson] and [Harada, Part I, Thm. 5] are applied to `Cᵒᵖ` (Convention
14), and projective covers are essential epimorphisms from projective objects (Convention 12).

Each declaration carries only the smallness hypotheses needed for its signature (Convention 3):
T-nilpotence and the forward direction of Nakayama's lemma need none, and Bass's module of a single
sequence requires only countable colimits, whereas theorems using object-indexed sums of
representables or `⊗_C` assume `EssentiallySmall.{v} C` with modules in the morphism universe `v`
(where representables and Bass modules live, 2.5). Sections 4.1–4.6 end with their ring-level
statements, derived from the categorical theorems via `SingleObj Aᵐᵒᵖ` (0.2). Unless a categorical
source is cited explicitly, categorical statements adapt the accompanying ring theorems, culminating
in [Simson, Thm. 5.4, p. 108].

**Direction of T-nilpotence.** In `SingleObj Aᵐᵒᵖ`, `f ≫ g = g * f` in `Aᵐᵒᵖ` equals
`op (unop f * unop g)`, so for `fᵢ = op aᵢ` the composite `f₀ ≫ ⋯ ≫ fₙ₋₁` is `op (a₀ a₁ ⋯ aₙ₋₁)`.
Nakayama's lemma on `Mod C` tracks composable sequences `c₀ → c₁ → ⋯` with composites `c₀ → cₙ`
(4.1), which at `SingleObj Aᵐᵒᵖ` specialize to Bass's left products `a₀ a₁ ⋯ aₙ₋₁`—left
T-nilpotence, matching left `A`-modules ([Bass, p. 466]; [Lam-FC, (23.16)], right-handed). Only
precomposition closure (`h ≫ f ∈ I` for `f ∈ I`) enters `I · M` and Bass's module, corresponding at
`SingleObj Aᵐᵒᵖ` (`h ≫ f = op (unop h * unop f)`) to left ideals of `A` (0.3). Similarly, in
`End X` with multiplication `f * g = g ≫ f`, the composite `f₀ ≫ ⋯ ≫ fₙ₋₁` equals the product
`fₙ₋₁ ⋯ f₀`, which at `End ∗ = Aᵐᵒᵖ` is again `op (a₀ ⋯ aₙ₋₁)`.

### 4.1 T-nilpotence and Nakayama's lemma for all modules

A left ideal `I` of `C` (0.3) is **T-nilpotent** (`TauCeti.LeftMorphismIdeal.IsTNilpotent I`) if
every sequence `c₀ → c₁ → ⋯` of morphisms `fᵢ : cᵢ → cᵢ₊₁` in `I` has a vanishing finite composite
`q_n = f₀ ≫ ⋯ ≫ f_{n-1} : c₀ → c_n` (Convention 8), specializing at `C = SingleObj Aᵐᵒᵖ` to Bass's
left T-nilpotence `q_n = op (a₀ a₁ ⋯ a_{n-1}) = 0`. Two-sided ideals such as `J(C)` enter via the
coercion of 0.3, while the opposite condition for a right ideal `I` of `C` is T-nilpotence of the
left ideal `I.op` of `Cᵒᵖ` (`TauCeti.RightMorphismIdeal.op`, or `TauCeti.MorphismIdeal.op I` for a
two-sided ideal), i.e., vanishing along chains `c₀ ← c₁ ← ⋯` (called "left T-nilpotence" for
covariant modules in [Simson, p. 108]). Basic API includes monotonicity in `I` and T-nilpotence of
any nilpotent two-sided ideal (`I ^ n = ⊥` in Tau Ceti's ideal monoid) and of its opposite
(`TauCeti.MorphismIdeal.isTNilpotent_of_pow_eq_bot`,
`TauCeti.MorphismIdeal.isTNilpotent_op_of_pow_eq_bot`).

Recall from 0.3 that `I · M` (`TauCeti.LeftMorphismIdeal.smul I M`) is a subobject of `M` (closed
under the `C`-action by precomposition closure of `I`, and specializing to `J • ⊤` for a left ideal
`J` of `A`), and that `I · M` is **superfluous** in `M` when it satisfies `TauCeti.IsSuperfluous` in
`Subobject M` (`I · M ⊔ N = ⊤ → N = ⊤`).

**Nakayama's lemma for all modules** (`TauCeti.LeftMorphismIdeal.isTNilpotent_tfae`). For a left
ideal `I` of `C`, the following are equivalent:

1. `I` is T-nilpotent;
2. for every module `M` in `Mod C`, `I · M = M` implies `M = 0`;
3. for every module `M` in `Mod C`, `I · M` is superfluous in `M`.

Proof route (using only precomposition closure: `M(h)(M(f)(x)) = M(h ≫ f)(x)` in (1) ⇒ (2) and
`g ≫ fᵢ ∈ I` in (2) ⇒ (1)):

- **(1) ⇒ (2), by dependent choice:** if `I · M = M` and `x₀ ∈ M(c₀)` is nonzero, construct
  `f_n : c_n → c_{n+1}` in `I` and `x_{n+1} ∈ M(c_{n+1})` with `M(q_n)(x_n) ≠ 0` inductively: write
  `x_n` as a finite sum of terms `M(f)(y)` with `f ∈ I(c_n, d)`; since `M(q_n)(x_n) ≠ 0`, some
  summand satisfies `M(q_n ≫ f)(y) ≠ 0`, giving `f_n = f` and `x_{n+1} = y`, so no `q_n` vanishes.
  ([Simson, Lemma 5.3, p. 108] states (1) ⇒ (2) for `J(C)` on `Cᵒᵖ`, remarking that Bass's arguments
  generalize; [Bass, pp. 473–474] uses König's graph theorem rather than dependent choice on an
  arbitrary left ideal.)
- **(2) ⇔ (3):** pass to the cokernel of `N ⟶ M` as usual.
- **(2) ⇒ (1), via Bass's sequence module (2.5):** for any `I`-sequence whose composites `q_n` never
  vanish, its Bass module `B` is nonzero because the class of `𝟙 c₀` equals that of `q_n` at stage
  `n`, yet `B = I · B` because the class `[g]` in `B(d)` of `g : d → cᵢ` equals
  `[g ≫ fᵢ] = B(g ≫ fᵢ)([𝟙 cᵢ₊₁])` with `g ≫ fᵢ ∈ I`. Combining this with the vanishing criterion
  of 2.5 also shows that `I` is T-nilpotent if and only if the Bass modules of all `I`-sequences
  vanish (`TauCeti.LeftMorphismIdeal.isTNilpotent_iff_forall_isZero_bassModule`).

Implications (1) ⇒ (2) and (1) ⇒ (3) hold in every module universe without smallness
(`TauCeti.LeftMorphismIdeal.IsTNilpotent.isZero_of_smul_eq_top`,
`TauCeti.LeftMorphismIdeal.IsTNilpotent.isSuperfluous_smul`), while the full TFAE is stated in
universe `v` (where Bass modules live, still with no smallness on `C`); Sections 4.3–4.6 apply it to
`J(C)`.

**Nakayama's lemma for finitely generated modules**
(`TauCeti.ModCat.isSuperfluous_jacobson_smul_of_isFinitelyGeneratedFunctor`). For any `C` and with
no T-nilpotence assumption, `J(C) · M` is superfluous in every finitely generated module `M` (0.1).
Indeed, if `J(C) · M ⊔ N = M` with `N ≠ M`, the nonzero finitely generated quotient `M ⧸ N` has a
maximal proper subobject (`TauCeti.ModCat.exists_isCoatom_of_isFinitelyGeneratedFunctor`, 0.1) and
hence a simple quotient `S`. We have `J(C) · S = 0`: if `S(f)(x) ≠ 0` for `f ∈ J(C)(c, d)` and
`x ∈ S(d)`, simplicity of `S` generates `S` from `S(f)(x)`, giving `x = S(g ≫ f)(x)` for some
`g : d → c` and hence `x = 0` because `𝟙 - g ≫ f` is invertible. Thus `J(C) · M` lies in the
maximal subobject over `N`, a contradiction. As an immediate consequence used in 4.2 (**rigidity on
finite sums of representables**), any endomorphism `u` of a finite sum `Q` of representables equal
to the identity modulo `J(C) · Q` is an isomorphism: the quotient map `q : Q → Q ⧸ J(C) · Q` has
superfluous kernel and is therefore an essential epimorphism (0.3) satisfying `u ≫ q = q`, so
projectivity of `Q` and `TauCeti.IsEssentialEpi.isIso_of_comp_eq` apply.

**Rings** (`TauCeti.IsLeftTNilpotent (S : Set A)`): every sequence `a : ℕ → A` in `S` satisfies
`(List.ofFn fun i : Fin n ↦ a i).prod = 0` for some `n`, with monotonicity
(`IsLeftTNilpotent.mono`), left T-nilpotence of nilpotent ideals
(`TauCeti.isLeftTNilpotent_of_isNilpotent`), elementwise nilpotence
(`IsLeftTNilpotent.isNilpotent`), and preservation under ring homomorphisms
(`IsLeftTNilpotent.image`). For any left ideal `J : Ideal A`, left T-nilpotence of `J` agrees with
T-nilpotence of `idealOrderIsoLeftMorphismIdeal A J` in `SingleObj Aᵐᵒᵖ`
(`TauCeti.isLeftTNilpotent_iff_isTNilpotent_singleObj`), and `J(SingleObj Aᵐᵒᵖ)` as a left ideal
corresponds to `Ring.jacobson A` (`TauCeti.toLeftMorphismIdeal_jacobsonRadicalIdeal_singleObj`, via
`End ∗ = Aᵐᵒᵖ` and `TauCeti.Ring.mem_jacobson_mulOpposite_iff`). Specializing the categorical TFAE
along 0.2 (where `I · M` becomes `J • ⊤`) yields the ring Nakayama TFAE
(`TauCeti.isLeftTNilpotent_tfae`; [AF, 28.3, pp. 314–315] for any left ideal; [Lam-FC, (23.16),
p. 352], right-handed): `J` is left T-nilpotent if and only if `J • ⊤ = ⊤` implies `M = 0` for every
`A`-module `M` in the universe of `A`, if and only if `J • ⊤` is superfluous in every such `M`, and
if and only if `J • ⊤` is superfluous in the countable free module `ℕ →₀ A` presenting Bass's
module, while the forward implication holds in every module universe
(`IsLeftTNilpotent.isSuperfluous_smul_top`).

**Checks.** In `PowerSeries k`, `(X)` is not left T-nilpotent
(`TauCeti.not_isLeftTNilpotent_span_X`): inside `F = ℕ →₀ PowerSeries k`, the submodule `G` spanned
by `eᵢ - X • eᵢ₊₁` (whose quotient `F ⧸ G` is the Laurent series field) satisfies `G + X • F = F`
with `G ≠ F`, so `X • F` is not superfluous. The categorical counterpart is the linear `A_∞`
category in the Layer 4 checks.

*Needs:* 0.1 (finite generation, maximal subobjects), 0.3 (one-sided ideals, `I · M`, superfluous
subobjects), 2.5; Tau Ceti `TauCeti.jacobsonRadicalIdeal`,
`TauCeti.IsEssentialEpi.isIso_of_comp_eq`, `TauCeti.MorphismIdeal`, `TauCeti.MorphismIdeal.op`, the
monoid of ideals (`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul`),
`TauCeti.Ring.mem_jacobson_mulOpposite_iff`; Mathlib `Functor.ofSequence`.

### 4.2 Semilocal and semiperfect rings and categories

**Semilocal rings** (`TauCeti.IsSemilocalRing R`), a new class (absent from Mathlib) with single
field and instance `isSemisimpleRing : IsSemisimpleRing (R ⧸ Ring.jacobson R)`. Its API provides the
`Rᵐᵒᵖ` instance (proved in `Suggested.lean` from
`TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`), closure under surjective ring
homomorphisms (`TauCeti.IsSemilocalRing.of_surjective`), and the commutative characterization by
finitely many maximal ideals (`TauCeti.isSemilocalRing_iff_finite_isMaximal`, which would also
reconcile with any future commutative `IsSemilocalRing` in Mathlib). These classes form the
hierarchy `IsSemiprimaryRing` ⇒ `IsLeftPerfectRing` (4.3) ⇒ `TauCeti.IsSemiperfectRing` ⇒
`IsSemilocalRing`, where the final step becomes an `extends` projection once
`TauCeti.IsSemiperfectRing` is refactored to extend `IsSemilocalRing` (Downstream consumers).

**Semilocal categories** (`TauCeti.IsSemilocalCategory C`, requiring every `End X` to be semilocal;
closed under `Cᵒᵖ` via `End (op X) = (End X)ᵐᵒᵖ`). The main characterization
(`TauCeti.isSemilocalCategory_iff_isSemisimpleCategory`) states that `C` is semilocal if and only if
`C ⧸ J(C)` is semisimple in Simson's sense (`TauCeti.IsSemisimpleCategory`: every representable
`Hom(-, X)` has complemented subobjects, `TauCeti.ModCat.IsSemisimple`; [Simson, p. 93], covariant
and applied to `Cᵒᵖ`, with left-right symmetry in [Simson, Cor. 1.3 (a), p. 94]). By [Simson,
Prop. 1.2, p. 93], a small preadditive category is semisimple if and only if it is von Neumann
regular and every `End X` is semisimple. To establish this for `D = C ⧸ J(C)`, two radical lemmas
(new to Tau Ceti) show that `J(C ⧸ J(C)) = ⊥`
(`TauCeti.jacobsonRadicalIdeal_quotient_jacobsonRadicalIdeal`, lifting invertibility of `1 - g ≫ f`
along the full quotient functor) and `End_{C ⧸ J}(X) ≅ End X ⧸ Ring.jacobson (End X)`
(`TauCeti.endQuotientJacobsonRadicalIdealRingEquiv` via `TauCeti.jacobsonRadical_self_eq_jacobson`).
Von Neumann regularity of `D` (`TauCeti.IsSemilocalCategory.exists_comp_comp_eq_self`) then follows:
for `f : X → Y` in `D`, the left ideal `{g ∘ f}` of the semisimple ring `End_D(X)` is generated by
an idempotent `e = g₀ ∘ f`, so `u = f ∘ (1 - e)` satisfies `g ∘ u = (g ∘ f)(1 - e) = 0` for all
`g : Y → X`, placing `u` in `J(D) = 0` and giving `f = f ∘ e = f ∘ g₀ ∘ f`.

**Semisimple modules** (`TauCeti.ModCat.isSemisimple_iff_exists_iso_sigma`,
`TauCeti.isSemisimpleCategory_iff_forall_isSemisimple`). A module has complemented subobjects if and
only if it is isomorphic to a coproduct of simple modules, and `C` is semisimple if and only if
every module in `Mod C` is semisimple (used for `C ⧸ J(C)` in 4.4 and 4.5). Indeed, `Subobject M` is
a modular, compactly generated complete lattice (0.1), so `IsAtomistic` and
`exists_sSupIndep_of_sSup_atoms` supply an independent family of atoms with supremum `⊤`; atoms are
simple subobjects (`subobject_simple_iff_isAtom`), and their coproduct map is a monomorphism by AB4.

**Semiperfect categories** (`TauCeti.IsSemiperfectCategory C`, extending `IsSemilocalCategory C` by
requiring every `End X` to be semiperfect; cf. [Simson, Thm. 5.6 (b), (c), p. 110]). Instances link
`IsSemiperfectCategory` to perfect categories (4.3), Krull–Schmidt categories
(`TauCeti.IsKrullSchmidt.isSemiperfectCategory`), and `Cᵒᵖ` (via `End (op X) = (End X)ᵐᵒᵖ` and
`TauCeti.IsSemiperfectRing.mulOpposite`). **Krause's criterion**
(`TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory`) states that a category
with finite biproducts is Krull–Schmidt if and only if it is idempotent complete and semiperfect
([Krause, Cor. 4.4, p. 546]), restating the semiperfect-endomorphism criterion of ArtinAlgebras
§0.2 using `IsSemiperfectCategory` and ArtinAlgebras' `IsKrullSchmidt` (restated identically in
`Suggested.lean`). Companion targets provide `TauCeti.IsSemiperfectRing.mulOpposite`,
`IsKrullSchmidt Cᵒᵖ` (together with `HasFiniteBiproducts Cᵒᵖ`, proved in `Suggested.lean` from
`HasFiniteBiproducts.of_hasFiniteProducts`), and semiperfectness of corners `eRe`
(`TauCeti.IsSemiperfectRing.corner` on `IsIdempotentElem.Corner`).

**Semiperfect categories via projective covers** (`TauCeti.isSemiperfectCategory_tfae`, with
`TauCeti.HasProjectiveCover M` denoting an essential epimorphism onto `M` from a projective object).
The following are equivalent ([Simson, Thm. 5.6, p. 110], covariant and applied to `Cᵒᵖ`, for
(1) ⇔ (3); conditions (2), (4), and (5) adapt [Krause, Prop. 4.1], stated for right modules over a
ring):

1. `C` is semiperfect;
2. every representable `Hom(-, X)` is a finite coproduct of projective modules with local
   endomorphism rings;
3. every finitely generated (0.1) module in `Mod C` has a projective cover;
4. every simple module in `Mod C` has a projective cover;
5. `proj C` (0.8) is Krull–Schmidt.

The equivalences between (1)–(4) follow the same argument as for rings below using
`End Hom(-, X) = End X` (0.8). For (1) ⇔ (5), `proj C` has finite biproducts and split idempotents
(0.8), so Krause's criterion applies: any finite coproduct of representables has semiperfect
endomorphism ring because `1` is a sum of orthogonal idempotents with local corners ([Lam-FC,
(23.6), p. 347]), and every object of `proj C` is a summand of such a coproduct and hence has a
corner endomorphism ring. (Theorem P requires only (1) and (4).)

**Covers of simple modules** (`TauCeti.ModCat.hasProjectiveCover_of_simple`), constructed directly
from summands of representables without passing through `Karoubi`. A simple module `S` satisfies
`S(X) ≠ 0` for some `X`; decompose `1 = e₁ + ⋯ + eₙ` in `End X` into orthogonal idempotents with
local corners, choose `i` and `x ∈ S(X)` with `S(eᵢ)(x) ≠ 0`, and map the projective summand
`{g ≫ eᵢ} ⊆ Hom(-, X)` (corresponding to `A eᵢ` for rings, with local endomorphism ring
`eᵢ (End X) eᵢ`) onto `S`. Just as for rings, any epimorphism onto a nonzero module from a
projective with local endomorphism ring is a projective cover.

**Covers by right minimality** (`TauCeti.isEssentialEpi_iff_forall_isIso`). For a projective object
`P` in an arbitrary category, an epimorphism `p : P → F` is essential if and only if it is right
minimal, meaning that every endomorphism `φ` of `P` satisfying `φ ≫ p = p` is invertible. The
forward implication is Tau Ceti's cover rigidity `TauCeti.IsEssentialEpi.isIso_of_comp_eq`;
conversely, if `g ≫ p` is epic, projectivity of `P` lifts `p` to `t` with `t ≫ g ≫ p = p`, so
`t ≫ g` is invertible and hence `g` is epic. At `P = Hom(-, X)` in `Mod C`, this identifies Tau
Ceti's right-minimal representable projective covers in Krull–Schmidt categories with essential
epimorphisms from representables; their existence is the Krull–Schmidt specialization of (3) above,
and covers of simple quotients `Hom(-, X) ⧸ J(-, X)` for local `End X` match those below.

**Radical of a projective module** (`TauCeti.ModCat.jacobson_smul_ne_top_of_projective`,
`TauCeti.ModCat.le_jacobson_smul_of_isSuperfluous`). Under `EssentiallySmall.{v} C` and with no
assumption on `J(C)`, every nonzero projective `P` in `Mod C` satisfies `J(C) · P ≠ P`, and every
superfluous subobject of a projective `P`—in particular the kernel of any projective cover—lies in
`J(C) · P`, generalizing the ring results below ([Lam-FC, (24.7), p. 360]; [Bass, Prop. 2.7,
p. 474]; [Sandomierski, Prop. 1 (d), p. 205]) without requiring T-nilpotence from 4.1:

- **Finite-support proof of `J(C) · P ≠ P` via cover rigidity** (used in Theorem P, 2′ ⇒ 1; compare
  [Bass, Prop. 2.7, p. 474] and [Lam-FC, (24.7), p. 360] for rings): choose `s : P → F` and
  `r : F → P` with `r ∘ s = 1` for a coproduct `F` of representables, and suppose `J(C) · P = P`.
  Any morphism `f : Hom(-, c) → P` (an element of `P(c)`) factors `s ∘ f = j ∘ g` through a finite
  sub-coproduct `j : Q → F` with projection `π : F → Q`. Because morphisms carry `J(C) · -` into
  `J(C) · -`, the endomorphism `a = π ∘ s ∘ r ∘ j` of `Q` satisfies
  `a(Q) ⊆ π s(P) = π s(J(C) · P) ⊆ J(C) · Q`, so `1 - a` is the identity modulo `J(C) · Q` and
  hence invertible by 4.1's rigidity on finite sums of representables. Since
  `a ∘ g = π ∘ s ∘ r ∘ s ∘ f = g`, we have `(1 - a) ∘ g = 0`; as `1 - a` is invertible, `g = 0`,
  hence `f = 0` and `P = 0`.
- **Proof of `K ≤ J(C) · P`** (used in 4.4 and 4.6): `J(C)(-, X)` is the intersection of maximal
  subobjects of `Hom(-, X)`, which passes to coproducts and summands to identify `J(C) · P` with the
  intersection of maximal subobjects of `P`, and every superfluous subobject lies in every maximal
  subobject.

**Rings.** Let `R` be a ring with `J = Ring.jacobson R`. All ring statements remain native; the
categorical TFAE above is proved first and specialized via `SingleObj Rᵐᵒᵖ` (0.2), identifying
`TauCeti.finiteProjectiveModules R` with `proj (SingleObj Rᵐᵒᵖ)`
(`TauCeti.finiteProjectiveModulesEquivProj`, 0.8).

- **Covers of projective modules** (`TauCeti.IsProjectiveCover.bijective_of_projective`): any
  projective cover of a projective module is bijective, by comparison with the identity cover via
  `TauCeti.IsProjectiveCover.bijective_of_comp_eq`.
- **Projectives with local endomorphism rings** (`TauCeti.isProjectiveCover_of_isLocalRing_end`):
  any surjection onto a nonzero module from a projective `P` with local `Module.End R P` is a
  projective cover, since the sum of two proper submodules of `P` remains proper (if `K ⊔ L = ⊤`,
  splitting `K × L → P` produces a component invertible in the local ring `Module.End R P`).
- **Locality of covers of simple modules** (`TauCeti.IsProjectiveCover.isLocalRing_end`): if
  `p : P → S` is a projective cover of a simple module, every proper submodule of `P` lies in
  `ker p`, and `Module.End R P` is local because any surjective endomorphism of `P` has superfluous
  kernel, is therefore a projective cover of `P`, and is bijective ([Krause, Lemma 3.6]; [Wisbauer,
  19.7, p. 161]).
- **Transporting covers across universes**
  (`TauCeti.IsProjectiveCover.exists_isProjectiveCover_comp_subtype`): if `M` admits a projective
  cover `f`, any surjection `g : Q → M` from a projective restricts to a projective cover on a
  submodule of `Q` by lifting `f` across `g`, splitting the lift, and transporting superfluousness
  of the kernel via `TauCeti.isSuperfluous_map_equiv_iff`.
- **Radical of a projective module** (`TauCeti.jacobson_eq_jacobson_smul_top_of_projective`,
  `TauCeti.jacobson_ne_top_of_projective`): for a projective left module `P`,
  `Module.jacobson R P = J • ⊤`, which is proper whenever `P` is nonzero ([Lam-FC, (24.7), p. 360];
  [Sandomierski, Prop. 1 (d), p. 205]).
- **Building covers from simple quotients**
  (`TauCeti.exists_isProjectiveCover_pi_of_forall_isCoatom_exists_isProjectiveCover`). If `M` is
  finitely generated and every simple quotient `M ⧸ N` has a projective cover with source in
  universe `w`, then `M` admits a projective cover `f : P₁ × ⋯ × Pₙ → M` lifting covers
  `pᵢ : Pᵢ → M ⧸ Nᵢ` of simple quotients. Indeed, lifts of covers of simple quotients generate `M`
  (since every proper submodule lies in a maximal submodule; [Wisbauer, 18.5 (1), p. 152]),
  compactness of `⊤` (`IsCompactElement`, `Submodule.fg_iff_compact`) selects a finite generating
  subfamily, and an irredundant subchoice has superfluous kernel ([Azumaya, Lemma 1, pp. 118–119],
  using local endomorphism rings; cf. [Nicholson, Cor. 2, p. 79] characterizing semiperfect finitely
  generated projectives by covers of simple quotients), using closure of superfluous submodules
  under finite suprema and finite products (proved as part of this item).
- **Covers over semiperfect rings** (`TauCeti.exists_isProjectiveCover_of_isSemiperfectRing`). Over
  a semiperfect ring `R`, every finitely generated left module has a projective cover in `R`'s
  universe ([Lam-FC, (24.12), p. 362]; [Bass, Thm. 2.1, p. 471]): write `1` as a sum of orthogonal
  idempotents `eᵢ` with local corners ([Lam-FC, (23.6), p. 347], included in this item), realize
  each simple module as a quotient of some local projective `Reᵢ`
  (`CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`) to obtain its cover, and
  apply the preceding item.
- **Semiperfectness from local summands** (`TauCeti.IsSemiperfectRing.of_linearEquiv_pi`): if
  `R ≃ₗ[R] P₁ × ⋯ × Pₙ` with each `Module.End R Pᵢ` local, the coordinate projections yield
  orthogonal idempotents summing to `1` with local corners, so `R` is semiperfect ([Lam-FC, (23.6),
  p. 347]).
- **Semiperfect rings via projective covers** (`TauCeti.isSemiperfectRing_tfae`). The following
  conditions on `R` are equivalent:
  1. `R` is semiperfect;
  2. as a left `R`-module, `R` is a finite product of projective modules with local endomorphism
     rings;
  3. every finitely generated left module `M : Type u` has a projective cover;
  4. every simple left module `S : Type u` has a projective cover;
  5. `TauCeti.finiteProjectiveModules R` (i.e., `proj (SingleObj Rᵐᵒᵖ)`) is Krull–Schmidt.

  See [Sandomierski, Thm. 4, p. 206] (stated for simple right modules, generalizing Koh's
  commutative case cited on p. 205), [Krause, Prop. 4.1] (right modules), [Lam-FC, (24.16), p. 364]
  (whose condition (3) uses cyclic right modules), and [Müller, §3, p. 465] (giving a short proof of
  the simple-cover criterion). For the proof: (1) ⇒ (3) is
  `exists_isProjectiveCover_of_isSemiperfectRing`, (3) ⇒ (4) is immediate, (4) ⇒ (2) applies the
  simple-quotient cover construction to `M = R` (bijective by projectivity of `R`, with local
  factors from simple covers), (2) ⇒ (1) is `of_linearEquiv_pi`, and (1) ⇔ (5) is Krause's
  criterion.
- **Minimal projective presentations** (`TauCeti.FiniteProjectivePresentation.exists_isMinimal`,
  under weakened hypotheses). Every finitely presented module `M : ModuleCat.{v} R` over a
  semiperfect ring with `[Small.{v} R]` has a finite minimal projective presentation
  (`TauCeti.IsMinimalProjectivePresentation`), proved by restricting a finite free presentation in
  universe `v` to a cover of `M`, taking a cover of its finitely generated kernel, and applying
  `TauCeti.IsProjectiveCover.isMinimalProjectivePresentation`. This replaces Tau Ceti's current
  hypothesis of a finitely generated module over a semiprimary Noetherian ring (recovered via
  semiperfectness and `Module.finitePresentation_of_finite`).
- **Commutative semiperfect rings** (`TauCeti.isSemiperfectRing_iff_exists_ringEquiv_pi`): a
  commutative ring is semiperfect if and only if it is isomorphic to a finite product of local rings
  ([Lam-FC, (23.11), p. 350]), since orthogonal idempotents with local corners ([Lam-FC, (23.6),
  p. 347]) are central when `R` is commutative.

**Checks.**

- `ℤ` is not semiperfect (`TauCeti.not_isSemiperfectRing_int`), since the kernel of any projective
  cover `P → ℤ ⧸ 2` would lie in `Module.jacobson ℤ P = J • P = 0`, making `ℤ ⧸ 2` projective
  ([Sandomierski, Lemma 2, p. 205]).
- `PowerSeries k` is local and hence semiperfect, with `PowerSeries k → k` as the projective cover
  of `k`.
- Over `T₂(k)`, `T₂(k) = T e₁₁ × T e₂₂` realizes decomposition (2), and `T e₁₁`, `T e₂₂` are the
  projective covers of the two simple modules.

*Needs:* 0.1, 0.3, 0.8, 4.1; ArtinAlgebras §0.2 (`IsKrullSchmidt` and Krause's criterion); Tau Ceti
`TauCeti.IsSemiperfectRing`, the idempotent results listed in "From Tau Ceti",
`TauCeti.IsEssentialEpi` with `TauCeti.IsEssentialEpi.isIso_of_comp_eq`, `TauCeti.IsProjectiveCover`
and its API, `TauCeti.FiniteProjectivePresentation`, `TauCeti.IsMinimalProjectivePresentation`,
`TauCeti.MorphismIdeal.Quotient`, `TauCeti.jacobsonRadical_self_eq_jacobson`,
`TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`; Mathlib `IsCompactElement`,
`Submodule.fg_iff_compact`, `isSimpleModule_iff_isCoatom`, `Module.jacobson`, `Subobject`,
`ComplementedLattice`, `IsAtomistic`, `exists_sSupIndep_of_sSup_atoms`,
`subobject_simple_iff_isAtom`, `Simple`, `IsIdempotentElem.Corner`,
`HasFiniteBiproducts.of_hasFiniteProducts`.

### 4.3 Perfect categories and left perfect rings

A preadditive category `C` is **perfect** (`TauCeti.IsPerfectCategory C`, extending
`IsSemilocalCategory C` with field
`isTNilpotent : (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).IsTNilpotent`) when every
`End X` is semilocal and `J(C)` is T-nilpotent (carrying no handedness modifier by Convention 8,
with opposite-side condition `IsPerfectCategory Cᵒᵖ`). By 4.2, this matches Simson's condition on
`Cᵒᵖ` that `J(C)` is T-nilpotent and `C ⧸ J(C)` is semisimple ([Simson, Thm. 5.4 (7)]); by Theorem P
(4.5), it holds if and only if every module in `Mod C` has a projective cover.

- **Semiperfectness instance** (`IsPerfectCategory C → IsSemiperfectCategory C`): each
  `Ring.jacobson (End X) = J(C)(X, X)` is T-nilpotent and therefore nil, so idempotents lift modulo
  the radical (`exists_isIdempotentElem_eq_of_ker_isNilpotent`; [Lam-FC, (23.19), p. 353]).
- **Nilpotent radical** (`TauCeti.IsPerfectCategory.of_pow_eq_bot`,
  `TauCeti.IsPerfectCategory.op_of_pow_eq_bot`): by 4.1, any semilocal category with nilpotent
  radical is perfect on both sides (serving in place of a separate semiprimary-category class).

**Rings** (`TauCeti.IsLeftPerfectRing A`, extending `IsSemilocalRing A` with field
`isLeftTNilpotent : IsLeftTNilpotent (Ring.jacobson A : Set A)`; right perfectness is
`IsLeftPerfectRing Aᵐᵒᵖ`):

- **Categorical bridge** (`TauCeti.isLeftPerfectRing_iff_singleObj`): `IsLeftPerfectRing A ↔
  IsPerfectCategory (SingleObj Aᵐᵒᵖ)` via `q_n = op (a₀ ⋯ a_{n-1})` (4.1).
- **Semiprimary and Artinian instances:** `IsSemiprimaryRing A → IsLeftPerfectRing A`
  (`TauCeti.IsLeftPerfectRing.of_isSemiprimaryRing`; [Lam-FC, (23.19), p. 353]) and
  `IsLeftPerfectRing A → TauCeti.IsSemiperfectRing A`
  (`TauCeti.IsLeftPerfectRing.isSemiperfectRing`, lifting idempotents across the nil radical via
  `exists_isIdempotentElem_eq_of_ker_isNilpotent`; [Lam-FC, (23.19)]). Combined with
  `TauCeti.IsSemiprimaryRing.mulOpposite` and Mathlib's `IsArtinianRing → IsSemiprimaryRing`, every
  semiprimary ring and every left Artinian ring is perfect on both sides; similarly, for right
  Artinian rings (`TauCeti.IsLeftPerfectRing.of_isArtinianRing_mulOpposite`), `IsArtinianRing Aᵐᵒᵖ`
  implies that `Aᵐᵒᵖ`—and hence `A` via `TauCeti.isSemiprimaryRing_mulOpposite_iff`—is semiprimary
  and therefore left perfect.
- **Endomorphism rings of finite-length modules** (an instance
  `TauCeti.Module.End.isSemiprimaryRing` under `[IsNoetherian R M] [IsArtinian R M]`, new to Mathlib
  and Tau Ceti and usable by ArtinAlgebras' Krull–Schmidt theory): `S = Module.End R M` is
  semiprimary ([AF, Cor. 29.3, p. 324]), hence perfect on both sides. Note that `S` uses Mathlib's
  multiplication `f * g = f ∘ g`, whereas [AF] writes endomorphisms on the right and multiplies in
  reverse order, so right T-nilpotence in [AF] corresponds to left T-nilpotence here. All four steps
  are roadmap targets:
  1. *Nil implies T-nilpotent* (`TauCeti.Module.End.isLeftTNilpotent_of_isArtinian`,
     `TauCeti.Module.End.isLeftTNilpotent_op_of_isNoetherian`): any multiplicatively closed subset
     `I ⊆ S` (`∀ a ∈ I, ∀ b ∈ I, a * b ∈ I`) consisting of nilpotent endomorphisms is left
     T-nilpotent when `M` is Artinian (every sequence `a₀, a₁, …` in `I` has some
     `a₀ ∘ ⋯ ∘ aₙ₋₁ = 0`) and right T-nilpotent—i.e., left T-nilpotent in `Sᵐᵒᵖ`—when `M` is
     Noetherian (some `aₙ₋₁ ∘ ⋯ ∘ a₀ = 0`). Although [Fisher-Nil] states this for nil subrings and
     [AF] for nil one-sided ideals, both proofs use only multiplicative closure. In the Artinian
     case (Fisher's theorem, [Fisher-Nil, Thm. 1.5, pp. 76–77], following [AF, Thm. 29.2, proof,
     pp. 323–324]), assuming a sequence with no vanishing product, one selects terms inductively
     with minimal image and compares kernels and images of partial products. In the Noetherian case
     (due to L. Small, [Fisher-Nil, Thm. 2.1, p. 77], proved by dualizing Theorem 1.5 and left as
     dual in [AF]), one chooses `s₁, s₂, …` inductively with maximal kernels so that for
     `pₙ = sₙ ∘ ⋯ ∘ s₁`, `Im pₙ ∩ Ker sₙ₊₁ = 0` and `sₘ ∘ pₙ = 0` for `n ≥ m`, contradicting the
     ascending chain condition on sums of images.
  2. *T-nilpotent implies nilpotent* (`TauCeti.Module.End.exists_prod_eq_zero_of_isLeftTNilpotent`,
     `TauCeti.Module.End.exists_prod_eq_zero_of_isLeftTNilpotent_op`): when `M` is Artinian, the
     submodules `Iʳ M` generated by images of `r`-fold products stabilize at `N` satisfying
     `I N = N`, forcing `N = 0` by left T-nilpotence as in 4.1 (1) ⇒ (2); when `M` is Noetherian,
     the annihilators `ann_M(Iʳ)` stabilize at `L`, and if `L ≠ M` then every `x ∉ L` admits `a ∈ I`
     with `a x ∉ L`, producing a sequence with no vanishing `aₙ₋₁ ∘ ⋯ ∘ a₀` (cf. [AF, Prop. 29.1,
     p. 323] via right annihilators, and [Fisher-Nil, Lemmas 1.1–1.2, pp. 75–76] for Artinian
     subrings via left annihilators in `S`).
  3. *Small–Fisher theorem* (`TauCeti.Module.End.exists_prod_eq_zero_of_isNilpotent`, with wrappers
     `TauCeti.Module.End.exists_prod_eq_zero_of_ideal` and
     `TauCeti.Module.End.exists_prod_eq_zero_of_rightIdeal`; [Fisher-Nil, Thms. 1.5 and 2.1,
     pp. 76–77]; [AF, Thm. 29.2, p. 323]): when `M` is Artinian or Noetherian, every
     multiplicatively closed set of nilpotent elements of `S`—and in particular every nil one-sided
     ideal of `S`—is nilpotent, combining steps 1 and 2.
  4. *Finite-length corollary* ([AF, Cor. 29.3, p. 324]): `M` decomposes into finitely many
     indecomposables with local endomorphism rings, making `S` semiperfect ([Lam-FC, (23.8),
     p. 348]); by Fitting's lemma, `Ring.jacobson S` is nil (for `a ∈ Ring.jacobson S` and large
     `n`, `M = Im aⁿ ⊕ Ker aⁿ` with `a` an automorphism on `Im aⁿ`, so `(1 - s a)(Im aⁿ) = 0` for
     some `s` and hence `Im aⁿ = 0`), therefore nilpotent by step 3, with `S ⧸ J` semisimple.
- **Surjective ring homomorphisms** (`TauCeti.IsLeftPerfectRing.of_surjective`; [Lam-FC, (24.19),
  p. 365]; [AF, 28.7, p. 318]): left perfectness passes to surjective images, including quotients by
  two-sided ideals and isomorphic rings.
- **Commutative perfect rings** (`TauCeti.isLeftPerfectRing_iff_exists_ringEquiv_pi`,
  `TauCeti.isLeftPerfectRing_iff_isArtinianRing`): a commutative ring is perfect if and only if it
  is isomorphic to a finite product of local rings with T-nilpotent maximal ideals ([Lam-FC,
  (23.24), p. 357]), and a commutative Noetherian ring is perfect if and only if it is Artinian
  (since any finitely generated nil ideal is nilpotent, making the ring semiprimary so that
  `IsSemiprimaryRing.isNoetherian_iff_isArtinian` applies).

*Needs:* 4.1, 4.2; Mathlib `IsSemiprimaryRing`, `IsArtinian`, `IsNoetherian`, `IsArtinianRing`,
`IsLocalRing`, `IsSemiprimaryRing.isNoetherian_iff_isArtinian`,
`exists_isIdempotentElem_eq_of_ker_isNilpotent`; Tau Ceti `TauCeti.IsSemiprimaryRing.mulOpposite`,
`TauCeti.isSemiprimaryRing_mulOpposite_iff`.

### 4.4 Projective covers over perfect categories

Over a perfect category `C`, every module `M` in `Mod C` has a projective cover
(`TauCeti.IsPerfectCategory.hasProjectiveCover`; [Simson, Thm. 5.4, (7) ⇒ (8), p. 109], on `Cᵒᵖ`;
[Bass, Lemma 2.6, p. 473] for rings). Specifically, `C` is semiperfect (4.3), and the reduction
`M ⧸ J · M` is a module over the semisimple quotient `C ⧸ J(C)` (0.3, 4.2) and therefore decomposes
as a coproduct of simple modules `Sᵢ` (4.2), each admitting a projective cover `qᵢ : Pᵢ → Sᵢ` by a
summand `{g ≫ e}` of a representable (4.2). Lifting `q = ⊕ qᵢ : P = ⊕ Pᵢ → M ⧸ J · M` to `f : P → M`
produces an epimorphism because `J · M` is superfluous in `M` (4.1), while
`ker f ⊆ ker q = ⊕ ker qᵢ ⊆ ⊕ J · Pᵢ = J · P` (by 4.2 on each superfluous `ker qᵢ` and 0.3 on
coproducts), which is superfluous in `P` by 4.1.

**Rings** (`TauCeti.IsLeftPerfectRing.exists_isProjectiveCover`). Over a left perfect ring, every
left module in every universe admits a projective cover in the form of
`TauCeti.exists_isProjectiveCover`, generalizing Tau Ceti's semiprimary theorem ([Lam-FC, (24.12)];
[AF, 28.4, (b) ⇒ (a), p. 315]) by the same argument via
`TauCeti.isSemisimpleModule_quotient_smul_top` on `M ⧸ J • M` and
`TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

*Needs:* 4.1–4.3; Tau Ceti `TauCeti.exists_isProjectiveCover`,
`TauCeti.isSemisimpleModule_quotient_smul_top`, `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

### 4.5 Bass's Theorem P

**Pure superfluous subobjects of projectives**
(`TauCeti.ModCat.eq_bot_of_isSuperfluous_of_isPureEpi`), a standalone target under
`EssentiallySmall.{v} C` with no radical hypothesis: if `K` is a superfluous subobject of a
projective `P` such that `P → P ⧸ K` is a pure epimorphism (2.3), then `K = 0` ([Wisbauer, 36.3,
p. 306], stated for projectives in `σ[M]` generated by finitely presented modules).

Following Wisbauer's proof, for any `x ∈ K(c)`, choose a split embedding `s : P → F` into a
coproduct of representables with retraction `r : F → P`, so `s(x)` lies as `x_L` in a finite
sub-coproduct `j : L → F` with projection `π_L : F → L` (`π_L ∘ j = 1`). Because `r ∘ j : L → P →
P ⧸ K` factors through the finitely presented quotient `H = L ⧸ (x_L)`, purity lifts `H → P ⧸ K` to
`H → P`; writing `g : L → P` for the composite `L → H → P`, `δ = j - s ∘ g : L → F` sends `x_L` to
`s(x)` while `r ∘ δ` vanishes in `P ⧸ K`, so `θ = r ∘ δ ∘ π_L ∘ s : P → P` has image in `K` and
satisfies `θ(x) = x` (Villamayor's step; cf. [Lam-LMR, (4.23), p. 129] for rings). Since `K` is
superfluous and contains the image of `θ`, the endomorphism `1 - θ` is an epimorphism, which splits
because `P` is projective; its kernel is a direct summand of `P` contained in `K` and therefore
equals `0` ([Mares, Thm. 2.4, proof step (i), p. 349]), so `(1 - θ)(x) = 0` implies `x = 0`.

**Flat modules with a projective cover** (`TauCeti.ModCat.Flat.projective_of_isEssentialEpi`). Under
`EssentiallySmall.{v} C` and with no radical hypothesis, any flat module admitting a projective
cover is projective ([Wisbauer, 36.4 (1), p. 306]): every epimorphism onto a flat module is pure
(2.3), so the kernel of its cover is both pure and superfluous and hence vanishes. See [Wisbauer]
for rings, [Simson, Thm. 5.4, (9′) ⇒ (1′), pp. 109–110] (on `Cᵒᵖ`) for categories, [Mares, Thm. 2.4,
proof step (i), p. 349] for the endomorphism step, and [Chase 1960, Prop. 2.2, p. 458] (publishing
Villamayor's previously unpublished lemma); an alternative ring proof under perfection uses
`K ≤ J · P` ([Lam-FC, (24.25)]).

**Theorem P** (`TauCeti.isPerfectCategory_tfae`), for `EssentiallySmall.{w} C` (stated at universe
`v` in `Suggested.lean`, with regularity of `ℵ₁` in 3′ supplied as a local instance via
`Cardinal.isRegular_aleph_one` as in 3.5, avoiding a `Fact` binder). The following are equivalent:

1. `C` is perfect: `J(C)` is T-nilpotent and `C ⧸ J(C)` is semisimple (4.3);
2. every module in `Mod C` has a projective cover;
2′. every semisimple module in `Mod C` has a projective cover;
3. every flat module in `Mod C` is projective;
3′. every countably presented flat module (`IsCardinalPresentable` at `ℵ₁`) is projective;
4. for every object `c`, the principal right ideals `g C = {g ≫ h}` of `C` with source `c`
   (`TauCeti.RightMorphismIdeal.principal`, 0.3)—i.e., cyclic subfunctors of `Hom(c, -)` given as
   images of `Hom(d, -) → Hom(c, -)` for `g : c → d`, specializing at `SingleObj Aᵐᵒᵖ` via
   `TauCeti.submoduleOrderIsoRightMorphismIdeal` to Bass's principal right ideals `aA`—satisfy the
   descending chain condition;
4′. every sequence `c₀ → c₁ → ⋯` stabilizes at `c₀`: some `q_n = f₀ ≫ ⋯ ≫ f_{n-1}` factors as
   `q_m ≫ t` through every later `q_m` ([Simson, Def. 3.1, p. 99], on `Cᵒᵖ`, evaluated at the
   initial term as in 2.5);
5. `flatDimension M = projectiveDimension M` for every `M : Mod C`;
6. filtered colimits of projective modules in `Mod C` are projective.

Primary sources are [Simson, Thm. 5.4, p. 108] (covariant, applied to `Cᵒᵖ`, whose conditions (7),
(8), (1), and (5) match 1, 2, 3, and 4′ at every term, with 3′ the countable specialization of (1)
and (9) restricting 2 to flat modules); [Harada, Thm. 5, p. 339] (covariant on finitely induced
categories of completely indecomposable objects in a Grothendieck category, noting the dual case
`(C_f⁰, Ab)`); [Bass, Theorem P, pp. 467–468] for rings; [Sandomierski, Thm. 5, p. 206] for 2′ over
rings (stated for right modules and applied to `Aᵐᵒᵖ`); and [AF, 28.4] and [Lam-FC, (24.25)] for
item 3 over rings (absent from Bass's original list).

Proof route: establish the main cycle 1 ⇒ 2 ⇒ 3 ⇒ 3′ ⇒ 4′ ⇒ 1 together with 4 ⇔ 4′, 3 ⇔ 5, 3 ⇔ 6,
and 2 ⇒ 2′ ⇒ 1:

- **1 ⇒ 2:** Section 4.4.
- **2 ⇒ 3 ⇒ 3′:** `projective_of_isEssentialEpi` gives 2 ⇒ 3, and 3 ⇒ 3′ is immediate.
- **3′ ⇒ 4′:** Bass's module of the sequence is flat and `ℵ₁`-presentable (2.5, 0.8), hence
  projective by 3′, so the sequence is factorizable (2.5; [Bass, Lemma 1.3]).
- **4′ ⇒ 1:** For T-nilpotence, given a sequence in `J(C)`, 4′ produces `t` with
  `q_n = q_{n+1} ≫ t = q_n ≫ f_n ≫ t`, so `q_n ≫ (1 - f_n ≫ t) = 0`; since `f_n ≫ t ∈ J(C)`,
  `1 - f_n ≫ t` is invertible and `q_n = 0`. For semilocality, constant-object sequences at `X`
  yield the descending chain condition on principal left ideals `End(X) · q = {q ≫ h}` of `End X`
  (under `f * g = g ≫ f`) and hence of the radical-free quotient `End X ⧸ Ring.jacobson (End X)`.
  Any ring with zero Jacobson radical satisfying the descending chain condition on principal left
  ideals is semisimple (`TauCeti.isSemisimpleRing_of_wellFoundedLT_isPrincipal`; [Lam-FC, (4.14),
  (3) ⇒ (1), pp. 57–58], left-handed as needed here: a minimal left ideal `B` avoids some maximal
  left ideal `m`, giving `R = B ⊕ m` until the chain condition terminates the splitting without
  invoking Brauer's lemma). Because `IsSemilocalCategory` is defined objectwise via `End X` (4.2),
  [Simson, Prop. 1.2] is not needed in this step.
- **4 ⇔ 4′:** any sequence yields the descending chain of principal right ideals generated by `q_i`
  (`q_{i+1} = q_i ≫ f_i`), and conversely any descending chain `g₀ C ⊇ g₁ C ⊇ ⋯` satisfies
  `g_{i+1} = g_i ≫ f_i` for suitable `f_i`.
- **3 ⇔ 5:** by 3.1, `flatDimension ≤ projectiveDimension`; under 3, the syzygy at the flat
  dimension is flat and hence projective ([Lam-LMR, (5.70), p. 187]), while 5 evaluated on a flat
  module gives `projectiveDimension ≤ 0`.
- **3 ⇔ 6:** filtered colimits of flat modules are flat (2.6), and every flat module is a filtered
  colimit of finite sums of representables (2.3).
- **2 ⇒ 2′ ⇒ 1:** 2 ⇒ 2′ is immediate. For 2′ ⇒ 1 (adapting [Sandomierski, Thm. 5, proof,
  pp. 206–207] together with [Sandomierski, Prop. 1 (d), p. 205]), simple modules have covers, so
  `C` is semiperfect (4.2). Given a coproduct `F` of representables, `F ⧸ J · F` is semisimple over
  `C ⧸ J(C)` (0.3, 4.2) and thus has a cover `p : P → F ⧸ J · F`. Lifting `F → F ⧸ J · F` across `p`
  gives an epimorphism `q : F → P` (as `ker p` is superfluous), which splits by projectivity of `P`;
  its kernel `K` is a summand of `F` contained in `J · F`, so projecting `J · F` onto `K` gives
  `K = J · K`, and therefore `K = 0` by `jacobson_smul_ne_top_of_projective` (4.2, requiring no
  T-nilpotence). Hence `q` is an isomorphism identifying `J · F` with `ker p`, so `J · F` is
  superfluous. For any sequence in `J(C)`, its Bass module `B` satisfies `B = J · B` and is a
  quotient of the telescope coproduct `F`, whence `B = 0` and `J(C)` is T-nilpotent (4.1).

Alternative proof routes noted in prose only include Rentschler's non-homological ring proof of
1 ⇒ 4 answering Bass's question ([Rowen, Thm. 2.7.33, pp. 222–223]; R. Rentschler, *Eine Bemerkung
zu Ringen mit Minimalbedingung für Hauptideale*, Arch. Math. 17 (1966), 298–301, Satz 1,
pp. 298–300); 1 ⇒ 3 over rings via `R ⧸ J`, where `K ≤ J · P` and flatness yields `K = J · K`
([Lam-FC, (24.25), pp. 369–370]); Simson's Mittag-Leffler route ([Simson, Thms. 3.16 and 5.4]); the
exchange-property proof of 3 ⇒ 2 ([AHS, Thm. 1.1]); the pp-formula proof of the Bass obstruction
([PR, §3], building on Puninski and Rothmaler's proof of the Bass–Björk theorem using an idea
credited to I. Sakhayev); and Bass's ring proof of 2 ⇒ 1 via `J • P ≠ P` ([Bass, Prop. 2.7, p. 474])
and 4.1. Out-of-scope conditions left as pointers include Bass's items (4) (direct limits of bounded
projective dimension) and (7) (orthogonal idempotents and socles); Simson's items (2), (3), (4), and
(6) (Mittag-Leffler objects, product maps, coperfectness, and endomorphism rings in `proj C`); and
Harada's minimal-subobject condition ([Harada, Thm. 5, 5)]).

**Rings** (`TauCeti.isLeftPerfectRing_tfae (A : Type u)`). Specializing `isPerfectCategory_tfae` at
`SingleObj Aᵐᵒᵖ` via 0.2 (without duplicating ring proofs) yields the equivalent conditions on `A`,
expressing 2 and 2′ with `TauCeti.IsProjectiveCover` (Convention 12; arbitrary universes follow from
4.4), 3 and 3′ with `Module.BalancedFlat` (Layer 2), 4 as
`WellFoundedLT {I : Submodule Aᵐᵒᵖ A // I.IsPrincipal}` via
`TauCeti.submoduleOrderIsoRightMorphismIdeal` (0.3), 4′ via chains `a₀A ⊇ a₀a₁A ⊇ ⋯`
(`q_n = op (a₀ ⋯ a_{n-1})`), and 5 and 6 in `ModuleCat.{u} A` (via Layer 3, 3.2's equivalence
invariance, and `TauCeti.isProjectiveCover_iff_forall_surjective`). Also included are the ring
lemma `TauCeti.Module.BalancedFlat.projective_of_isProjectiveCover` ([Wisbauer, 36.4 (1)])
and the helper `TauCeti.isSemisimpleRing_of_wellFoundedLT_isPrincipal` on principal left ideals
(`Ideal A`; [Lam-FC, (4.14)]). Ring references: [Bass, Theorem P] (whose (1), (2), (6), (3), (5)
match 1, 2, 4, 5, 6), [AF, 28.4, pp. 315–317] (left-handed), and [Lam-FC, (24.18), p. 365, and
(24.25), p. 369] (right-handed).

*Needs:* Layers 2 and 3, 4.1–4.4; Mathlib `IsCardinalPresentable`, `Cardinal.isRegular_aleph_one`,
`imageSubobject`, `IsFiltered`, `WellFoundedLT`, `Submodule.IsPrincipal`; Tau Ceti
`TauCeti.IsEssentialEpi`, `TauCeti.isProjectiveCover_iff_forall_surjective`.

### 4.6 Global dimension of perfect categories

- **Equality with weak global dimension**
  (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension_of_isPerfectCategory`): over a perfect
  category `C`, taking suprema in Theorem P (5) gives
  `Abelian.globalDimension (ModCat C) = ModCat.weakGlobalDimension C`.
- **Two-sided symmetry** (`TauCeti.ModCat.globalDimension_op_eq_of_isPerfectCategory`): when both
  `C` and `Cᵒᵖ` are perfect—in particular for any semilocal `C` with nilpotent radical `J(C)ⁿ = 0`
  (4.3)—symmetry of weak global dimension (3.3) equates the global dimensions of `Mod C` and
  `Mod Cᵒᵖ`.
- **Bass–Eilenberg criterion** (`TauCeti.ModCat.hasProjectiveDimensionLE_iff_isZero_tor`; [Bass,
  p. 475], reproducing Eilenberg's argument from [Eilenberg 1956, Prop. 10 and Thm. 11, p. 333]).
  Over a perfect `C`, `pd M = sup {n : Tor_n(C ⧸ J, M) ≠ 0}`: specifically, `pd M ≤ n` if and only
  if `Tor_{n+1}((C ⧸ J)(X, -), M) = 0` for every `X`, using the covariant quotients `(C ⧸ J)(X, -)`
  of 0.3. Indeed, a minimal projective resolution `P_•` built by iterating projective covers (4.4)
  has differentials landing in `J · P_n` (4.2), so `(C ⧸ J) ⊗_C P_•` has zero differentials and
  `Tor_n((C ⧸ J)(X, -), M) ≅ (P_n ⧸ J · P_n)(X)` (0.3), which vanishes if and only if `P_n = 0` by
  Nakayama's lemma (4.1).
- **Global dimension via `C ⧸ J`**
  (`TauCeti.ModCat.globalDimension_eq_iSup_flatDimension_quotientYoneda`): over a perfect `C`,
  `Abelian.globalDimension (ModCat C)` equals `⨆ X, flatDimension ((C ⧸ J)(X, -))`, since by the
  Bass–Eilenberg criterion and 3.1 every module has projective dimension at most `n` if and only if
  every `(C ⧸ J)(X, -)` has flat dimension at most `n`.

**Rings.** Statements mentioning weak global dimension belong here, whereas pure left-right global
dimension comparisons stay in ArtinAlgebras §7.2 (Scope):

- `TauCeti.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing`: under
  `[IsLeftPerfectRing A]` and `[Small.{v} A]`, `globalDimension A = weakGlobalDimension A` ([Bass,
  p. 475]; [Lam-LMR, (5.70), p. 187]), requiring perfection on one side only (as illustrated by
  Lam's ring in the checks).
- `TauCeti.globalDimension_mulOpposite_of_isLeftPerfectRing`: if `A` is both left and right perfect,
  `globalDimension A = weakGlobalDimension A = globalDimension Aᵐᵒᵖ` (combining both sides with
  3.3). Via 4.3, this covers all semiprimary rings (including left Artinian rings) without any
  Noetherian assumption ([Au, Cor. 9, p. 73]; [Lam-LMR, (5.71), p. 188], exemplified by the
  non-Noetherian semiprimary ring `k[x₀, x₁, …] ⧸ (xᵢxⱼ)` below), giving a second proof of
  ArtinAlgebras §7.2's semiprimary symmetry.

The ring specialization of the Bass–Eilenberg `Tor` criterion follows via 0.2 without a separate
declaration; Tau Ceti's theorem equating `globalDimension A` with `pd(A ⧸ J)` over semiprimary rings
remains unchanged, and no claim is made about `pd(A ⧸ J)` when `A` is perfect on one side only.

*Needs:* 0.3, 3.1, 3.3, 4.1–4.5; Tau Ceti `TauCeti.globalDimension`.

### Layer 4 checks

In Lean (final section of `Suggested.lean`):

- **`PowerSeries k`:** `(X)` is not left T-nilpotent (`TauCeti.not_isLeftTNilpotent_span_X`), so the
  ring is local (hence semiperfect) without being left perfect
  (`TauCeti.isSemiperfectRing_powerSeries_and_not_isLeftPerfectRing`), and Bass's module for the
  constant sequence `X` is the flat, non-projective Laurent series field
  (`TauCeti.bassRelations_X_linearEquiv_laurentSeries`, 2.5).
- **`ℤ`:** neither semiperfect (`TauCeti.not_isSemiperfectRing_int`, 4.2) nor perfect, with `ℚ` flat
  and non-projective (`TauCeti.balancedFlat_rat_and_not_projective`, 2.6).
- **`T₂(k)`:** semiprimary and hence left and right perfect
  (`TauCeti.isLeftPerfectRing_upperTriangular`), with simple-module covers and decomposition checked
  in 4.2.
- **`k[ε]/(ε²)`** (`DualNumber k`): perfect, so flat and projective dimensions coincide on all
  modules (`TauCeti.isLeftPerfectRing_dualNumber`), while its global and weak global dimensions are
  `⊤` (Layer 3 checks).
- **`k[x₀, x₁, …] ⧸ (xᵢxⱼ)`** (`TauCeti.squareZeroPolynomialRing k` on `MvPolynomial ℕ k`):
  semiprimary (`J² = 0`, `A ⧸ J = k`), hence two-sided perfect, yet non-Noetherian
  (`TauCeti.isSemiprimaryRing_squareZeroPolynomialRing`), illustrating 4.6.
- **`k[x₀, x₁, …] ⧸ (xᵢ^{i+2}, xᵢxⱼ for i ≠ j)`** (`TauCeti.bassPolynomialRing k`): perfect without
  being semiprimary (`TauCeti.isLeftPerfectRing_bassPolynomialRing`, specializing [Bass, §3,
  Example (2), p. 475], where `R ⧸ N` has the minimum condition and `N` is a direct sum of two-sided
  nilpotent ideals). Here `J` is not nilpotent because `xᵢ^{i+1} ≠ 0`, yet `J` is T-nilpotent
  because each element of `J` involves finitely many variables so `a₀ ⋯ a_{n-1} = 0` once `n`
  exceeds a bound determined by `a₀`; by Theorem P, its principal ideals satisfy the descending
  chain condition even though the ring is non-Noetherian.
- **Linear `A_∞` category** `0 → 1 → 2 → ⋯` (`CategoryTheory.Free k ℕ` with arrows
  `TauCeti.aInftyArrow k i : i → i + 1`): semilocal (`End X = k` at every object), not perfect
  (arrows out of `0` compose to nonzero paths `0 → n`), while `Cᵒᵖ` is perfect because radical paths
  in `Cᵒᵖ` strictly decrease the index (`TauCeti.isSemilocalCategory_free_nat`). Bass's module for
  the arrow sequence out of `0` is nonzero and satisfies `B = J · B`
  (`TauCeti.bassModule_free_nat`), confirming 4.1.
- **`A₂` category** `CategoryTheory.Free k (Fin 2)`: satisfies `J(C)² = 0`, is perfect on both
  sides, has Krull–Schmidt `proj C` (`TauCeti.isPerfectCategory_free_fin_two`), and has category
  algebra `T₂(k)` (1.7).

In prose:

- **Lam's ring:** inside `Module.End k (ℕ →₀ k)`, let `J` consist of endomorphisms whose finite
  matrices are supported strictly above the diagonal, and set `R = k · 1 + J`. Then `R` is local,
  `IsLeftPerfectRing Rᵐᵒᵖ` holds, and `IsLeftPerfectRing R` fails since `E₀₁E₁₂ ⋯ Eₙ₋₁,ₙ = E₀ₙ ≠ 0`
  ([Lam-FC, (23.22), p. 356]); correspondingly, `E₀₁R ⊋ E₀₂R ⊋ ⋯` fails to stabilize and Bass's
  module for `E₀₁, E₁₂, …` is a flat, non-projective left `R`-module. The linear `A_∞` category
  above is its many-object counterpart, matching `Eᵢ,ᵢ₊₁` with `i → i + 1`.
- **One-object `PowerSeries k`:** `SingleObj (PowerSeries k)ᵐᵒᵖ` is a semiperfect category that is
  not perfect.

### Examples

For rings, semiprimary rings (including Artin algebras, left Artinian rings, and endomorphism rings
of finite-length modules) are perfect on both sides; `bassPolynomialRing k` is perfect without being
semiprimary; Lam's ring is perfect on one side only; `PowerSeries k` is semiperfect without being
perfect; `ℤ` is not semiperfect; and commutative Noetherian rings are perfect if and only if they
are Artinian. For categories, Krull–Schmidt categories are semiperfect; `k`-linear path categories
of finite acyclic quivers are perfect on both sides (whereas a loop produces `End = k[t]` with
descending chain `(t) ⊋ (t²) ⊋ ⋯`, violating Theorem P (4)); and the linear `A_∞` category is
perfect on one side only.

### Dependencies

4.1 needs 0.1, 0.3, and 2.5; 4.2 needs 0.1, 0.3, 0.8, 4.1, and ArtinAlgebras §0.2 (its ring items
need only Mathlib and Tau Ceti); 4.3 needs 4.1 and 4.2; 4.4 needs 4.1–4.3; 4.5 needs Layers 2 and 3
together with 4.1–4.4; and 4.6 needs 0.3, 3.1, 3.3, and 4.1–4.5.

## Downstream consumers

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2: Auslander's theorem (3.4)
  proves left-right symmetry of global dimension for two-sided Noetherian rings via weak global
  dimension, while 4.6 proves it without any Noetherian hypothesis for two-sided perfect rings
  (including semiprimary rings). Tau Ceti's character-module proofs of those left-right comparisons
  become refactor consumers, retaining their statements while replacing their proofs via 3.4.
- Tau Ceti's `TauCeti.globalDimension` (`TauCeti/RingTheory/GlobalDimension.lean`) is refactored as
  the `ModuleCat A` specialization of `TauCeti.Abelian.globalDimension` (3.2), with its cyclic and
  finitely generated characterizations derived as corollaries of Auslander's lemma.
- ArtinAlgebras, §7.5 (forward direction): for an additive generator `M` of `mod A`, every finitely
  presented right `End_A(M)`-module has projective dimension at most `2`, and
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` (3.4) yields
  `globalDimension (Module.End A M) ≤ 2` using only that `End_A(M)` is left Noetherian
  (strengthening what §7.5 requires alongside the left-right comparisons replaced in 3.4).
- ArtinAlgebras, §§4.1–4.2, via `LinearMap.auslanderReitenTransposeTensorEquivCokernel`
  (`Tr M ⊗_A N` as the cokernel of `Hom_A(P₀, N) → Hom_A(P₁, N)`) and
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom` (stable Hom as the cokernel of
  `Hom_A(M, A) ⊗_A N → Hom_A(M, N)`): Section 1.4 identifies `Tor_1^A(Tr M, N)` with stable
  `Hom_A(M, N)` for finitely presented `M` ([Auslander78, I, Prop. 3.2]).
- ArtinAlgebras, Layer 4: the Auslander–Reiten translate uses finite minimal projective
  presentations (`TauCeti.FiniteProjectivePresentation.exists_isMinimal`), which 4.2 supplies for
  finitely presented modules over any semiperfect ring; ArtinAlgebras' Krull–Schmidt development can
  likewise use the fact that `Module.End R M` is semiprimary for finite-length modules (4.3).
- Hoshino's flat-dominant dimension ([Ho, Theorem, p. 275]; [Xi, §1, p. 34], where symmetry over
  Noetherian rings is cited from [Ho]) requires the initial terms of a minimal injective
  coresolution to be flat, which ArtinAlgebras deferred pending noncommutative flatness (supplied
  here by Layer 2).
- `TauCeti.IsSemiperfectRing` (`TauCeti/RingTheory/Jacobson/Semiperfect.lean`) is refactored without
  compatibility shims to extend `IsSemilocalRing` (4.2), so that its `isSemisimpleRing` field
  becomes the `IsSemilocalRing` parent projection.
- Explicit `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]` hypotheses in Tau Ceti (on projective covers
  of simple modules, corners, and Matlis duality) simplify to `[IsSemilocalRing R]` (4.2), which
  over commutative rings means finitely many maximal ideals.
- With the instance `TauCeti.small_mulOpposite` (0.2), explicit `[Small.{v} Aᵐᵒᵖ]` binders in Tau
  Ceti become redundant and can be removed.
- Krause's criterion and semiperfectness of endomorphism rings in a Krull–Schmidt category
  (ArtinAlgebras §0.2) are restated directly with `IsSemiperfectCategory` (4.2), without aliases.
- From 0.1's refactor, Tau Ceti's single-representable finitely generated and finitely presented
  functor predicates and their consumers (all under finite biproducts, abelianness, or Krull–Schmidt
  hypotheses) migrate to finite sums of representables via `matrixMap`; Tau Ceti's right-minimal
  representable projective covers coincide with essential epimorphisms from representables (4.2).
- From 0.3's refactor, `TauCeti.IsSuperfluous` and its API
  (`TauCeti/Algebra/Module/Submodule/Superfluous.lean`) generalize to lattices with `⊤`, keeping the
  submodule lemmas as specializations.

## Sources and locators

- [AB] M. Auslander, M. Bridger, *Stable module theory*, Mem. Amer. Math. Soc. 94 (1969). Two-sided
  Noetherian rings throughout (p. 48); (2.5), p. 51 (the transpose `D(M)`); (2.6) (a), p. 52; (2.8)
  (b), p. 54 (the exact sequence ending in `Ext^k(M, -) → Tor_1(D Ω^k M, -) → 0`); (2.9) (b),
  pp. 55–56. The proof of (2.8), pp. 54–55, credits M. Auslander, *Coherent functors*, Proc. Conf.
  Categorical Algebra (La Jolla, 1965), Springer (1966), 189–231, Prop. 5.8c, Lemma 7.4 and
  Thm. 7.5: Prop. 5.8 (c), p. 220 (statement from p. 219); Lemma 7.4, p. 229, and Thm. 7.5,
  p. 230, for a Noetherian ring (assumed from p. 229 on).
- [AF] F. W. Anderson, K. R. Fuller, *Rings and Categories of Modules*, 2nd ed., Graduate Texts in
  Mathematics 13, Springer (1992). §28: left and right T-nilpotence, p. 314; Lemma 28.3,
  pp. 314–315; Theorem 28.4 (Bass), pp. 315–317 ((b) ⇒ (a) on pp. 315–316); Corollary 28.7, p. 318.
  §29: Proposition 29.1, p. 323 (under the maximum condition on right annihilators, a right
  T-nilpotent one-sided ideal is nilpotent); Theorem 29.2, p. 323, with proof to p. 324 (Small and
  Fisher: for an Artinian or Noetherian module, every nil one-sided ideal of its endomorphism ring
  is nilpotent; the Noetherian case is omitted as dual); Corollary 29.3, p. 324 (the endomorphism
  ring of a module of finite length is semiprimary). Endomorphisms act on the right, so products
  are in the reverse of Mathlib's order.
- [AHS] L. Angeleri Hügel, M. Saorín, *Modules with perfect decompositions*, Math. Scand. 98
  (2006), 19–43. Thm. 1.1, p. 21 (decompositions and the exchange property, through its implication
  (1) ⇒ (5)); for the exchange route of 4.5, an alternative only.
- [Auslander78] M. Auslander, *Functors and morphisms determined by objects*, in *Representation
  Theory of Algebras* (Philadelphia, 1976), Lecture Notes in Pure and Applied Mathematics 37,
  Dekker (1978), 1–244. I, Prop. 3.2 (`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` for finitely presented
  `X`), pp. 12–14 of a retyped version, not the printed pagination.
- [Au] M. Auslander, *On the dimension of modules and algebras III. Global dimension*, Nagoya Math.
  J. 9 (1955), 67–77. Thm. 1, p. 68; weak dimensions, Thm. 4 and Cor. 5, p. 70; Cor. 8, p. 72;
  Cor. 9, p. 73.
- [Azumaya] G. Azumaya, *Corrections and supplementaries to my paper concerning
  Krull-Remak-Schmidt's theorem*, Nagoya Math. J. 1 (1950), 117–124. Lemma 1, pp. 118–119 (the
  replacement argument with local endomorphism rings).
- [Bass] H. Bass, *Finitistic dimension and a homological generalization of semi-primary rings*,
  Trans. Amer. Math. Soc. 95 (1960), 466–488. T-nilpotence (for an ideal), p. 466; Theorem P,
  pp. 467–468; Lemmas 1.1–1.3, pp. 468–470 (the telescope module and its splitting; the splitting
  argument is Lemma 1.3); Theorem 2.1, p. 471; Lemma 2.6, p. 473 (covers from `B = NB ⇒ B = 0`), and
  the paragraph after it, pp. 473–474 (semisimple modulo a T-nilpotent radical gives perfect), with
  the König graph argument; Prop. 2.7, p. 474 (`P ≠ NP` for a nonzero projective `P`); Eilenberg's
  argument for `Pd = Wd` over left perfect rings, reproduced on p. 475 (`Tor_n(R ⧸ N, A) ≅
  P_n ⧸ NP_n` for a minimal resolution); §3, Examples, p. 475.
- [BEE] L. Bican, R. El Bashir, E. Enochs, *All modules have flat covers*, Bull. London Math. Soc.
  33 (2001), 385–390. Theorem 3. Pointer only.
- [Beligiannis] A. Beligiannis, *On the Freyd categories of an additive category*, Homology Homotopy
  Appl. 2 (2000), 147–185. §8.2: Lemma 8.10, Prop. 8.11 and Rem. 8.12, pp. 180–181 (flat and
  fp-injective modules over weak abelian categories).
- [CB] W. Crawley-Boevey, *Locally finitely presented additive categories*, Comm. Algebra 22 (1994),
  1641–1674. §1.2, Lemmas 1–2, pp. 1644–1645 (the category of elements; pseudo-cokernels), and
  Theorem, p. 1645 (`(𝒞ᵒᵖ, Ab)` is locally finitely presented: its finitely presented objects are
  the cokernels of maps between representables, and every functor is the direct limit of these);
  §1.3, Theorem, pp. 1645–1646 (flat functors; the proof of (1) ⇒ (2) uses
  `stable Hom(X, Y) ≅ Tor_1(Tr X, Y)`, with the stable `Hom` underlined on p. 1646); §1.4, Theorem
  and Corollary, pp. 1646–1648 (representation theorem); §2.1, Theorem,
  p. 1648; §2.2, pp. 1649–1651 (flat = left exact); §2.3, Theorem, p. 1651; §3.1, pp. 1653–1654;
  §3.2, Theorem, p. 1655. His `𝒞` is skeletally small and additive, with finite biproducts (p.
  1642), and his "locally finitely presented" means finitely accessible additive. His functors are
  contravariant, `(𝒞ᵒᵖ, Ab)`, as here.
- [CE] H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton University Press (1956). Ch. VI,
  §5, Prop. 5.1, p. 120 (`Ext_Λ(A, Hom_Γ(B, C)) ≅ Hom_Γ(Tor^Λ(A, B), C)` for `Γ`-injective `C`);
  Prop. 5.3, p. 120 (the dual formula, for a left Noetherian ring and a finitely generated `A`), and
  the remark after it, pp. 120–121 (a resolution by finitely generated projectives suffices);
  Exer. 3, p. 122 (`w.dim A ≤ dim A`, with equality for a finitely generated module over a left
  Noetherian ring); Exer. 5, p. 122 (one left ideal `I`: the relations condition, `A ⊗ I → A`
  monic, and `Tor_1(A, Λ ⧸ I) = 0`); Exer. 6, p. 123 (flatness, `Tor_1(A, Λ ⧸ I) = 0` for all left
  ideals, and the equational criterion).
- [Chase 1960] S. U. Chase, *Direct products of modules*, Trans. Amer. Math. Soc. 97 (1960),
  457–473. Prop. 2.2, p. 458, with proof to p. 459 (Villamayor's characterization of flat modules,
  credited to him as not yet in the literature), and its Corollary, p. 459 (a finitely related flat
  module is projective); Prop. 2.3, p. 459 (the equational criterion). Right modules.
- [CI] M. Cortés-Izurdiaga, *Flatness in finitely accessible additive categories*,
  arXiv:2505.07742v1, §5, Definition 5.2 and Proposition 5.3, p. 21 (flat modules versus flat
  objects inside the category of flat modules).
- [CPT] S. Crivei, M. Prest, B. Torrecillas, *Covers in finitely accessible categories*, Proc. Amer.
  Math. Soc. 138 (2010), 1213–1221. pp. 1214 and 1218 (finitely accessible versus locally finitely
  presented); Cor. 3.3, p. 1218 (flat covers in `Mod C`).
- [Eilenberg 1956] S. Eilenberg, *Homological dimension and syzygies*, Ann. of Math. (2) 64 (1956),
  328–336. Perfect categories (introduction, p. 328, and the axioms on p. 330); minimal
  epimorphisms and resolutions, Props. 3 and 7, Thm. 8, pp. 330–333; Prop. 10 and Thm. 11, p. 333
  (`Tor_n(K, A) ≅ X_n ⧸ N X_n` and the dimension criterion), as reproduced in [Bass, p. 475]. Left
  modules; a perfect category is a subcategory of graded modules over a graded ring with
  semisimple `Λ ⧸ N`; the errata page (Ann. of Math., 1957, p. 593) corrects misprints only.
  Eilenberg credits minimal epimorphisms over semiprimary rings to S. Eilenberg, T. Nakayama, *On
  the dimension of modules and algebras V. Dimension of residue rings*, Nagoya Math. J. 11 (1957),
  9–12 (p. 9: the minimal epimorphism `P → A`, `P` projective with kernel in `NP`, for left modules
  over a semiprimary ring).
- [Fisher] J. L. Fisher, *The tensor product of functors, satellites, and derived functors*,
  J. Algebra 8 (1968), 277–294. Prop. 1.3, p. 279, with proof to p. 280, and Thm. 1.4, p. 280 (a
  left exact functor on a small abelian category is a filtered colimit of representables); Thm. 2.4,
  p. 284 (for a left exact `G : 𝒞° → Ab`, `⊗ G` is exact); Cor. 2.9, p. 285 (a covariant
  `F : 𝒞 → 𝒟` is left exact exactly when `F ⊗` is exact; our statement of it is over `Cᵒᵖ`). Fisher
  does not use the word "flat"; [OR, Cor. 3.4] cites 2.4 and 2.9 for "flat = left exact".
- [Fisher-Nil] J. W. Fisher, *Nil subrings of endomorphism rings of modules*, Proc. Amer. Math. Soc.
  34 (1972), 75–78. Lemma 1.1, p. 75, with proof to p. 76 (for an Artinian `M`, `End_R(M)` has the
  ascending chain condition on left annihilators); Lemma 1.2, p. 76 (under the ascending chain
  condition on left (right) annihilators, a subring is nilpotent exactly when it is left (right)
  T-nilpotent); Theorem 1.5, p. 76, with proof on p. 77 (for an Artinian `M`, every nil subring of
  `End_R(M)` is nilpotent; Fisher's theorem); Theorem 2.1, p. 77 (the same for a Noetherian `M`,
  "due to Lance Small" and appearing in Goldie–Small, with the proof "Dualize the proof of Theorem
  1.5"). `M` is a right module and endomorphisms act on the left, so products are in Mathlib's
  order. A different author from [Fisher].
- [Govorov] V. E. Govorov, *On flat modules*, Sibirsk. Mat. Zh. 6 (1965), 300–304 (Russian): a flat
  module is a direct limit of free modules.
- [Harada] M. Harada, *Perfect categories I*, Osaka J. Math. 10 (1973), 329–341. Introduction,
  pp. 329–330: perfect Grothendieck categories, and Theorem P for the functor category `(C, Ab)` of
  an amenable additive small category `C`; Lemma 6, p. 337, and Theorems 3–4, pp. 337–338; Theorem
  5 and Remark 1, pp. 339–340 (for the finitely induced category `C_f` of a set of completely
  indecomposable objects; Bass's module over the ring with enough idempotents of a category).
  Part I, Theorems 3–4, and Part II use the contravariant `(C⁰, Ab)`, as here; Theorem 5 is
  covariant,
  with the remark that the same holds for `(C_f⁰, Ab)`. A functor category, not the small
  category, is called perfect. *Perfect categories II*, ibid., 343–355: Theorem 2′, p. 346,
  stated without proof. Parts III–IV have no flatness.
- [Jategaonkar] A. V. Jategaonkar, *A counter-example in ring theory and homological algebra*,
  J. Algebra 12 (1969), 418–440. Thm. 4.10, pp. 438–439 (principal left ideal domains of any right
  global dimension).
- [Jensen] C. U. Jensen, *On homological dimensions of rings with countably generated ideals*,
  Math. Scand. 18 (1966), 97–105. Lemma 2, pp. 98–100 (a countably generated flat left module over
  a ring whose left ideals are countably generated has projective dimension `≤ 1`; [Osofsky-Nagoya,
  Lemma 1.2, p. 316] restates it for any countably related flat module); Theorem 1, p. 100
  (`l.gl.dim R ≤ w.gl.dim R + 1` when all left ideals are countably generated).
- [JL] C. U. Jensen, H. Lenzing, *Model Theoretic Algebra*, Gordon and Breach (1989). Appendix B,
  Theorems B.12, p. 387 (Bass's theorem for covariant functors `A → Ab` on a small additive `A`;
  such an `A` is called left perfect, and `A` is right perfect when `Aᵒᵖ` is left perfect), and
  B.14, p. 388.
- [Krause] H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015),
  535–549; arXiv:1410.2822. Lemma 3.6, p. 542, and Proposition 4.1, p. 544, with proof to p. 545
  (right modules, p. 538); Corollary 4.4, p. 546 (an additive category is Krull–Schmidt exactly
  when idempotents split and endomorphism rings are semiperfect); the arXiv TeX source has the same
  numbering.
- [Krause-Defect] H. Krause, *A short proof for Auslander's defect formula*, Linear Algebra Appl.
  365 (2003), 267–270. Theorem and proof, pp. 268–269: the snake-lemma step (the diagram on p. 268;
  `D δ^*(X) = D Coker Hom_R(X, ψ) ≅ D Ker(φ ⊗_R Tr X)` on p. 269, with the contravariant defect
  `δ^*`), for an algebra over a commutative ring, right modules and finitely presented `X`.
- [Krause-FlatCovers] H. Krause, *Morphisms determined by objects and flat covers*, Forum Math. 28
  (2016), 425–435. Theorems 1.1 and 2.2, in the numbering of arXiv:1403.6039v2. Pointer only.
- [Krause-Smashing] H. Krause, *Smashing subcategories and the telescope conjecture — an algebraic
  approach*, Invent. Math. 139 (2000), 99–133. §2.3, p. 115: `Flat C = Ind C`, and Lemma 2.7 (for
  a skeletally small triangulated `C`: flat, cohomological and fp-injective agree, for additive
  `M : Cᵒᵖ → Ab`, as here), with Lemma 1.6.
- [Lam-FC] T. Y. Lam, *A First Course in Noncommutative Rings*, Graduate Texts in Mathematics 131,
  Springer (1991), first edition, to which all pages refer. (4.14),
  pp. 57–58 (a ring is semisimple exactly when it is J-semisimple and left Artinian, exactly when it
  is J-semisimple with the descending chain condition on principal left ideals; the proof splits off
  minimal left ideals through a maximal left ideal missing them and uses no Brauer lemma); (23.6),
  p. 347 (a ring is semiperfect exactly when `1` is a sum of
  orthogonal local idempotents); (23.8), p. 348, with proof to p. 349 (a module is a finite direct
  sum of modules with local endomorphism rings exactly when its endomorphism ring is semiperfect);
  (23.11), p. 350 (commutative semiperfect rings); (23.13)–(23.16), pp. 351–352; (23.19), p. 353;
  (23.20), p. 354; (23.22), p. 356; (23.24), p. 357 (commutative perfect rings); (24.7), p. 360;
  (24.12), p. 362; (24.16), p. 364; (24.18)–(24.20), p. 365; (24.22), p. 366; (24.23)–(24.24), pp.
  367–368; (24.25), pp. 369–370. Lam defines T-nilpotence for a subset. §§23–24 right-handed; (4.14)
  left-handed. A right-handed statement is applied to `Aᵐᵒᵖ`.
- [Lam-LMR] T. Y. Lam, *Lectures on Modules and Rings*, Graduate Texts in Mathematics 189, Springer
  (1999). §2F, p. 45 (the example "constructed by L. Small"); (2.33), pp. 46–47 (Small's ring);
  (4.9) and (4.12), p. 125; (4.13) ("if `A`, `C` are flat, then so is `B`") and (4.14), p. 126;
  (4.23) (the theorem of O. Villamayor) and (4.24), pp. 129–130; (4.30), p. 133; (4.32)–(4.34), pp.
  133–134; (4.47), p. 139; (5.53)–(5.57), pp. 183–184; (5.58)–(5.59), p. 184; (5.62b) and (5.63), p.
  185; (5.69)–(5.70), p. 187; (5.71), p. 188. Lam states these results for right modules (`P_R`;
  (5.59) for a right Noetherian ring, which is our left Noetherian after the switch); each is
  applied to `Aᵐᵒᵖ`, and the citations of (4.9), (4.12), (4.24), (4.32), (5.57) and (5.59) say so.
- [Lambek] J. Lambek, *A module is flat if and only if its character module is injective*, Canad.
  Math. Bull. 7 (1964), 237–243. Theorem, p. 239; Proposition 1 and `Ext(N, M*) ≅ Tor(N, M)*`,
  p. 241.
- [Lazard] D. Lazard, *Autour de la platitude*, Bull. Soc. Math. France 97 (1969), 81–128. Ch. I
  (noncommutative rings, p. 83): Lemme 1.1 and Thm. 1.2, p. 84; Cor. 1.3–1.4, p. 85; Thm. 3.2,
  p. 89.
- [Mares] E. A. Mares, *Semi-perfect modules*, Math. Z. 82 (1963), 347–360 (volume 82; Simson's
  bibliography has 83). Theorem 2.4, proof step (i), p. 349 (an endomorphism of a projective with
  small image has invertible `1 - s`); added-in-proof note, p. 360. For Layer 4.
- [ML] S. Mac Lane, *Categories for the Working Mathematician*, 2nd ed., Graduate Texts in
  Mathematics 5, Springer (1998). IX.6, pp. 226–227: coends; the tensor product over a ring as a
  coend, with left modules as covariant additive functors on the one-object category `R` and the
  contravariant functor first; the explicit quotient for rings.
- [Mitchell] B. Mitchell, *Rings with several objects*, Adv. Math. 8 (1972), 1–161. §3,
  pp. 15–18: functor categories, representables, free and finitely presented functors, and one-sided
  ideals (p. 18: "A right ideal in an additive category `C` is a subfunctor of `C^p` for some `p`
  … a left ideal is a subfunctor of `C_p`. A two sided ideal is a subfunctor of the two variable
  functor"); §6, pp. 26–27: the tensor product `F ⊗_C G`, its value on representables (1), the
  adjunction (2), preservation of colimits in both variables, the swap as a definition, the
  explicit quotient, and cogenerating injectives from `ℚ ⧸ ℤ`; §6, p. 32: `Tor` and `Ext` of
  functors, computed from a projective resolution of one variable; §7, pp. 33–38: the ring `[C]` of
  an additive category (p. 33), triangular matrix rings for a finite totally ordered set (Example 1,
  p. 33), Thm. 7.1 (pp. 33–36: covariant functors and right `[C]`-modules, an equivalence when `C`
  has finitely many objects; the contravariant case in the remark on p. 37, `[C*] = [C]*`), and the
  compatibility with `⊗` and `Tor` (p. 37, (1)); §9, pp. 42–45: homological and global dimension of
  an abelian category, the right and left global dimension of a small additive category,
  `gl dim 𝒜ᵒᵖ = gl dim 𝒜` (p. 42), and the comparison with the ring `[C]` (p. 45, (6)); §10, Prop.
  10.1 and Cor. 10.2, p. 47: projectives are retracts of free functors, and tensoring with a
  projective is exact; §10, pp. 48–50: flat functors, Thm. 10.1b and Cor. 10.2b, p. 48
  (Lazard–Govorov), Cor. 10.4b, p. 49, the remark on p. 49 that finitely presented flat functors
  are projective ("well known", citing Lazard's Cor. 1.4), and the dimension of flat functors,
  pp. 49–50 (Jensen's countable case, Osofsky's `ℵ_n` case, and "a slightly erroneous, but simpler
  proof" by Lazard, corrected in a communication to Mitchell); §11, pp. 50–52: `K`-categories,
  `K`-linear functors to `K`-modules as additive functors to abelian groups (p. 51), the tensor
  product over `K` and its independence of `K` (p. 52). Pages 57–161, on flatness, weak dimension
  and Auslander's theorems: the weak dimension of a functor is defined on p. 59 and
  then set aside (p. 60); Thm. 16.1 (Osofsky), p. 69, bounds the projective dimension of a directed
  colimit over a directed set of cardinality `ℵ_n` by `n + 1` plus the supremum; §36, Thm. 36.8,
  p. 149, gives directed functors of projective dimension exactly `n + 1` (the examples of p. 50);
  p. 152 recalls Auslander's theorem that the right global dimension is the supremum over cyclic
  functors; they contain no categorical form of Auslander's Noetherian comparison of weak and
  global dimension. Mitchell writes morphisms on the right; his modules in general are covariant
  functors and are applied to `Cᵒᵖ`, while the projective and flat functors of §10 are contravariant
  (`G ∈ Ab^{𝒞*}`), as here.
- [Müller] B. J. Müller, *On semi-perfect rings*, Illinois J. Math. 14 (1970), 464–467. §3,
  p. 465 (a short proof of the simple-cover criterion); a pointer.
- [Nicholson] W. K. Nicholson, *On semiperfect modules*, Canad. Math. Bull. 18 (1975), 77–80. Cor.
  2, p. 79 (a finitely generated projective module is semiperfect exactly when each simple quotient
  has a projective cover).
- [OR] U. Oberst, H. Röhrl, *Flat and coherent functors*, J. Algebra 14 (1970), 91–105. (1.1),
  p. 93 (the adjunction over a commutative base ring); pp. 93–96, ideals of `X(z, -)` and
  `X(-, x)`; Lemma 1.2, p. 94; Lemma 2.4, p. 95; Lemma 3.1, p. 96, and Thm. 3.2 (1)–(6), stated on
  p. 96 with the proof to p. 99 (item (3): `Tor_1(S, X(z, -) ⧸ I) = 0` for every ideal `I` of
  `X(z, -)`); Cor. 3.3–3.5 and Remark, p. 99 (the Remark: Thm. 3.2 is "essentially a generalization
  of [Cartan–Eilenberg], Ch. VI, Ex. 6, to functor categories"); Thm. 4.1, stated on p. 101 (item
  (5): "the product of flat functors in `[X, Mod K]` is flat", covariant), with a remark on p. 102
  and the proof to p. 103; the weak global dimension of a small preadditive category, p. 103 (it
  does not depend on `K`, and `X` and `X°` have the same one); Thm. 4.3, p. 103, with proof on
  p. 104 (under local coherence, the global dimension of the coherent functors is the weak global
  dimension). Its flat functors `S ∈ [X°, Mod K]` are contravariant, as here, and its tensor
  product `S ⊗_X F` puts the contravariant functor first, the reverse of the order here (Convention
  14); Lemma 1.2 is stated for a covariant `F` and is applied to `Cᵒᵖ`.
- [Osofsky-Card] B. L. Osofsky, *Homological dimension and cardinality*, Trans. Amer. Math. Soc.
  151 (1970), 641–649. Nice families, p. 641; Thm. A, p. 644.
- [Osofsky-Nagoya] B. L. Osofsky, *Upper bounds on homological dimensions*, Nagoya Math. J. 32
  (1968), 315–322. Cor. 1.4, p. 318 (`gl.d(R) ≤ w.gl.dim(R) + n + 1` when every right ideal is
  generated by at most `ℵ_n` elements); p. 319 (Pierce's free Boolean rings: R. S. Pierce, *The
  global dimension of Boolean rings*, J. Algebra 7 (1967), 91–99, cited here as [Pierce]).
- [PR] A. Pillay, P. Rothmaler, *Bass modules and embeddings into free modules*, J. Algebra 670
  (2025), 1–12; §3, Definition 4 and Lemma 5, p. 4, in the numbering of arXiv:2501.04174v1 (PDF and
  TeX); the pp-formula view of the Bass obstruction, credited there to G. Puninski, P. Rothmaler,
  *Pure-projective modules*, J. London Math. Soc. (2) 71 (2005), 304–320: §4, Thm. 4.2
  (Bass–Björk), with Lemma 3.6 (numbering and pages of the author preprint); the preprint, §4,
  p. 11, says that its proof of Thm. 4.2 uses an idea of I. Sakhayev (I. Sakhayev, *Bass's perfect
  rings and their generalizations*, Abelian Groups and Modules (Tomsk) 10 (1991), 106–124, as
  listed there). An alternative only.
- [Pierce] R. S. Pierce, *The global dimension of Boolean rings*, J. Algebra 7 (1967), 91–99.
  Cor. 2.2, p. 92 (a regular ring of cardinality at most `ℵ_n` has global dimension `≤ n + 1`);
  Thm. 5.1, p. 96, and Cor. 5.2, p. 97 (the free Boolean ring on `ℵ_n` generators has global
  dimension `n + 1`). Left modules.
- [Rowen] L. H. Rowen, *Ring Theory*, vol. I, Academic Press (1988). Thm. 2.7.7 (ii), pp. 213–214,
  and Thm. 2.7.33, pp. 222–223 (Rentschler's direct proof that a perfect ring has the descending
  chain condition on principal ideals, in Rowen's conventions). [Lam-FC, p. 370] names R.
  Rentschler and points to "Rowen [88], Vol. II, p. 222"; the locators here are in volume I. The
  paper's title and place are in 4.5.
- [Rump] W. Rump, *Flat covers in abelian and in non-abelian categories*, Adv. Math. 225 (2010),
  1589–1615. §5, Theorem 2 and its Corollary 2, pp. 1603–1604. Pointer only.
- [Sandomierski] F. L. Sandomierski, *On semiperfect and perfect rings*, Proc. Amer. Math. Soc. 21
  (1969), 205–207. Credit to Koh's commutative case (K. Koh, *On a semi-primary ring*, Proc. Amer.
  Math. Soc. 19 (1968), 205–208, Thm. 2, p. 205: a commutative ring has projective covers of all
  simple modules iff it is "semiprimary" and idempotents lift modulo the radical, where Koh's
  "semiprimary" means only that `R ⧸ J` is Artinian after Jacobson, i.e., semiperfectness; Thm. 1
  is the noncommutative statement under a weaker lifting condition), p. 205; Proposition 1 (d) and
  Lemma 2, p. 205; Theorems 4 and 5, p. 206, with the proof of Theorem 5 to p. 207 (stated for
  right modules; Theorem 5: "A ring R is right perfect if and only if every semisimple right
  R-module has a projective cover").
- [Simson] D. Simson, *On pure global dimension of locally finitely presented Grothendieck
  categories*, Fund. Math. 96 (1977), 91–116. §1, pp. 92–93: "additive" means preadditive (finite
  sums are added only in Cor. 1.3 (b), p. 94), the radical `J(C)`, and semisimple categories;
  Prop. 1.2, p. 93 (semisimple iff von Neumann regular with semisimple endomorphism rings); Cor.
  1.3 (a), p. 94 (`C` semisimple iff `Cᵒᵖ` semisimple); Thm. 2.1, p. 95 (its (b): "If `C` has finite
  coproducts and cokernels, then `Cᵒᵖ`-module `F` is flat iff `F` is a left exact functor"); Thm.
  2.12 (c), p. 98 (`ℵ_n`-presented flat functors); Def. 3.1, p. 99 (factorizable inverse systems);
  left T-nilpotence of `J(C)` and Lemma 5.3 (Bass's Nakayama lemma, for `J(C)`, "the arguments of
  Bass generalize"), p. 108; Thm. 5.4, p. 108, with the proofs of (3′) ⇒ (4), (7) ⇒ (8) and
  (9′) ⇒ (1′), pp. 108–110; Thm. 5.6, p. 110 (three items). Simson's modules are covariant
  functors; his statements are applied here to `Cᵒᵖ`, except Thm. 2.1 (b).
- [Stacks] The Stacks Project authors, *The Stacks Project*, Tag 058D (characterizing flatness: for
  a flat module over a commutative ring, a map from a finite free module factors through a finite
  free module trivializing a given finitely generated submodule of its kernel, by induction on the
  number of generators).
- [St] B. Stenström, *Purity in functor categories*, J. Algebra 8 (1968), 352–361. §2 and
  Lemmas 7–8, pp. 353–354 (Lemma 7 (ii): finitely presented flat objects are projective; Lemma 8
  (c): a map from a finitely presented object to a flat one factors through a projective object);
  Thm. 1, pp. 355–356 (the tensor–Hom adjunction, "an extension of a theorem of Watts"); Thm. 3,
  p. 357, with the proof of (c) ⇒ (a) on p. 358; Thm. 4, p. 359 (all objects flat exactly when the
  finitely presented generators are projective and every `α` between them has `α = α φ α`).
  Contravariant functors, as here.
- [Weibel] C. A. Weibel, *An Introduction to Homological Algebra*, Cambridge Studies in Advanced
  Mathematics 38, Cambridge University Press (1994). Thm. 2.7.2, pp. 58–59 (balance of `Tor`
  through the bicomplex `P ⊗ Q`); Acyclic Assembly Lemma 2.7.3, pp. 59–61; Exer. 3.1.3, p. 68
  (`Tor_1^R(R ⧸ I, R ⧸ J) ≅ (I ∩ J) ⧸ IJ` for a right ideal `I` and a left ideal `J`).
- [Wisbauer] R. Wisbauer, *Foundations of Module and Ring Theory*, Gordon and Breach (1991).
  18.5 (1), p. 152 (a projective module that maps onto every simple module is a generator; the
  argument of the generation step), stated in `σ[M]`; 19.7, p. 161 (projective covers of simple
  modules have local endomorphism rings); 36.3, p. 306 (a pure and superfluous submodule of a
  projective module in `σ[M]` generated by finitely presented modules is zero) and 36.4 (1),
  p. 306 (a flat module with a projective cover is projective), in `σ[M]`.
- [Ho] M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280.
  Theorem, p. 275: for a left and right Noetherian ring, the first `n` terms of the minimal
  injective resolutions of `R_R` and `_R R` are flat together (Hoshino calls this dominant
  dimension).
  [Xi] C. Xi, *Frobenius bimodules and flat-dominant dimensions*, Sci. China Math. 64 (2021), 33–44
  (also arXiv:1903.07921v1): §1, p. 34, the left
  flat-dominant dimension, following [Ho], and its left-right symmetry for Noetherian rings,
  credited to [Ho]. Cited for the consumer only, as in ArtinAlgebras.

