# Roadmap: Flatness and homological dimensions of noncommutative rings

**Summary.** Mathlib has flat modules, `Tor` and the character-module test for flatness only over
commutative rings. Tau Ceti has the tensor product `M ⊗_A N` of a right and a left module over an
arbitrary ring (`TauCeti.BalancedTensorProduct`), finitely presented functors on a preadditive
category (`mod C`), the global dimension of left modules, projective covers and semiperfect rings.
This roadmap is the home of flat modules over noncommutative rings and of flat functors over
preadditive categories. It develops the homological algebra of flatness over a preadditive category
`C` with one module convention: a `C`-module is a contravariant additive functor, and `Mod C` is the
category of these. A ring `A` is the one-object case `SingleObj Aᵐᵒᵖ`, whose modules are the left
`A`-modules; covariant functors are the modules of the other side, `Mod Cᵒᵖ`, and for rings they are
the right modules. Layer 0 lays the foundations: finitely generated and finitely presented functors
as quotients and cokernels of finite sums of representables (a refactor of Tau Ceti's `mod C`); the
abelian, Grothendieck category `Mod C`; the identification of `A`-modules with modules over
`SingleObj Aᵐᵒᵖ`; the tensor product `G ⊗_C F` of a covariant functor `G` and a module `F` as a
coend of abelian groups, with its `R`-module structure for an `R`-linear `C`, its adjunctions, right
exactness, projective factors and swap; one-sided ideals of `C`, `I · M` and superfluous subobjects;
duals `Hom_R(-, E)`; the native ring API of `M ⊗_A N`; and the finitely generated projective modules
`proj C`, the duality `Hom(-, C)` between `proj C` and `proj Cᵒᵖ`, and the agreement of the notions
of finite presentation. On these the roadmap builds `Tor` over `C` as a left derived functor in the
`Mod C` variable, with its long exact sequences, its balance, `Tor` of the Auslander–Bridger
transpose and its duality with `Ext`, and compares a category with finitely many objects with its
category algebra. Layer 2 treats flat modules and flat functors: flatness is defined by the
equational criterion; then come the ideal, `Tor` and Lambek tests with a Baer criterion for `Mod C`,
the projectivity of finitely presented flat modules, the Lazard characterizations (factorization,
filtered colimits of finite sums of representables, purity), flat = left exact, flat =
cohomological on triangulated categories, Crawley-Boevey's representation of finitely accessible
additive categories, Bass's flat module of a sequence, and closure properties. Layer 3 treats flat
dimension, the global dimension of an abelian category, the weak global dimension with its
left-right symmetry, and Auslander's theorem that a Noetherian category (every `Hom(-, X)` a
Noetherian object; for rings, left Noetherian) has equal global and weak global dimension. Layer 4
treats T-nilpotent left ideals of `C` and Nakayama's lemma for all modules, semilocal, semiperfect
and perfect categories and rings, projective covers over them, the lemma that a pure superfluous
subobject of a projective is zero, and the global dimension of perfect categories. The summit is
**Bass's Theorem P**: for a ring `A` with Jacobson radical `J`, the following are equivalent:
`A ⧸ J` is semisimple and `J` is left T-nilpotent; every left module has a projective cover; the
principal *right* ideals satisfy the descending chain condition; every left module has equal flat
and projective dimension; filtered colimits of projective left modules are projective ([Bass,
Theorem P]); and every flat left module is projective ([AF, 28.4]; [Lam-FC, (24.25)]). For small
preadditive categories the summit is **Simson's Theorem 5.4** ([Simson, Thm. 5.4, p. 108], stated
for covariant modules and applied here to `Cᵒᵖ`): every flat module of `Mod C` is projective exactly
when every module has a projective cover, exactly when `J(C)` is T-nilpotent on sequences
`c₀ → c₁ → ⋯` and `C ⧸ J(C)` is semisimple, exactly when every sequence `c₀ → c₁ → ⋯` in `C` is
factorizable. These are the categories `C` whose module category is perfect in the sense of
[Harada]; [JL, p. 387] calls such a `C` perfect. Here the categorical theorem is proved first and
Bass's theorem is its one-object case. All layers are category-primary.

## Scope and ownership

This roadmap owns:

- modules over a preadditive category: finitely generated and finitely presented functors as
  quotients and cokernels of maps between finite sums of representables, a refactor of Tau Ceti's
  `mod C` (0.1); `Mod C` as a full subcategory of contravariant additive functors, its abelian and
  Grothendieck structure, representable projectives, enough projectives and injectives, its
  subobject lattices and its derived `R`-linear structure, and the inclusion of `mod C`; the
  comparison of `A`-modules with modules over `SingleObj Aᵐᵒᵖ`; the tensor product `G ⊗_C F` of a
  covariant functor and a module, as a coend of abelian groups with `Module R` instances over an
  `R`-linear category, with its API, adjunctions, right exactness and Yoneda isomorphisms; tensoring
  with projectives; the swap `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`; the ring API of `M ⊗_A N` and its comparison
  with the categorical tensor product and with Mathlib's tensor product over a commutative ring;
  duals with respect to an `R`-module `E`; left and right ideals of `C`, ideals at one object and
  their comparison with the one-sided ideals of a ring, `I · M` as a subobject for a left ideal `I`,
  superfluous elements of a lattice (a refactor of Tau Ceti's `TauCeti.IsSuperfluous`), and
  `C ⧸ I` with the restriction of modules along `C ⥤ C ⧸ I` for a two-sided ideal `I`; and the
  finitely generated projective modules `proj C`, `proj C ≃ Karoubi (Mat_ C)`, the duality
  `Hom(-, C)` between `proj C` and `proj Cᵒᵖ`, and the comparison of finite presentation with
  `proj C`, with Mathlib's `IsFinitelyPresentable` and with `Module.FinitePresentation` (Layer 0);
- `Tor` over a preadditive category and over an arbitrary ring as a left derived functor, its long
  exact sequences, its balance, the formula `stable Hom(X, N) ≅ Tor_1(Tr X, N)` with its `Tor`
  criterion for projectivity, its duality with `Ext`, the comparison with Mathlib's
  `CategoryTheory.Tor` over a commutative ring, change of base for rings, `Tor₁` of two cyclic
  modules, and the comparison of a category with finitely many objects with its category algebra
  (Layer 1);
- flat modules and flat functors over a preadditive category and over an arbitrary ring, defined by
  the equational criterion: the ideal test, the `Tor` and Lambek tests, a Baer criterion for
  `Mod C`, `Tor` and filtered colimits, projectivity of finitely presented flat modules, the Lazard
  characterizations and purity with the bridge to Mathlib's `IsCardinalPure`, flat = left exact,
  the triangulated case, Crawley-Boevey's representation theorem, Bass's flat module of a chain,
  closure properties, and the bridges to Mathlib's ind-objects and type-valued flat functors
  (Layer 2);
- flat dimension; the global dimension of an abelian category, Auslander's lemma on cyclic modules
  and universe independence; the weak global dimension, its left-right symmetry and its bounds by
  the global dimensions; the `FP_∞` lemma and Auslander's theorem for Noetherian categories and left
  Noetherian rings; kernels of flat modules and countably presented flat modules (Layer 3);
- T-nilpotent left ideals of a preadditive category and Nakayama's lemma for all modules; semilocal
  rings and categories, semiperfect and perfect categories, the ring class `IsLeftPerfectRing`, the
  commutative semiperfect and perfect rings, and the semiprimary endomorphism rings of modules of
  finite length; projective covers over semiperfect and perfect categories and rings, the
  characterization of semiperfect categories and rings by projective covers, the radical of a
  projective module, and finite minimal projective presentations over semiperfect rings; pure
  superfluous subobjects of projectives and flat modules with a projective cover; Bass's Theorem P
  for categories and rings; and the global dimension of perfect categories and rings with the
  Bass–Eilenberg criterion (Layer 4).

The boundaries are as follows.

- An `R`-linear category is Mathlib's `Linear R C`, and modules are ordinary functors with
  additivity as a property. **Future work, not followed here:** `R`-linear categories as categories
  enriched over `ModuleCat R`, and a bridge from `Mod C` to degree-zero DG modules. Tau Ceti's DG
  categories use Mathlib's `EnrichedCategory` over `CochainComplex (ModuleCat R) ℤ`, with a
  hand-built functor category (`TauCeti/CategoryTheory/DG/Functor/Category.lean`); Mathlib has no
  general category of enriched functors.
- Finitely presented functors `mod C` are Tau Ceti's (`TauCeti.isFinitelyPresentedFunctor`, in
  `TauCeti/CategoryTheory/FinitelyPresentedFunctor/`), on the same ambient category
  `Cᵒᵖ ⥤ AddCommGrpCat.{v}`. Main defines them with one representable in each place, which is the
  right notion only for categories with finite biproducts (for the ring `ℤ`, `ℤ²` is not a quotient
  of `ℤ`). This roadmap refactors main's `TauCeti.IsFinitelyGeneratedFunctor` and
  `TauCeti.IsFinitelyPresentedFunctor` to finite sums of representables (0.1, the first target); all
  existing theorems on main assume finite biproducts and keep their meaning, and the
  [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md) roadmap, which works with
  additive `C`, is unaffected.
- Flatness over a commutative ring is Mathlib's `Module.Flat`. Here only its agreement with
  `TauCeti.Module.BalancedFlat` is proved (2.1). Mathlib's `Mathlib/RingTheory/Flat/Basic.lean`
  lists the generalization of `Module.Flat` to noncommutative rings as a TODO; if Mathlib makes
  it, `BalancedFlat` is replaced by `Module.Flat`. Tau Ceti's `TauCeti.flatModuleFilteredFree`
  (Lazard's theorem in one direction, for commutative rings) becomes a corollary of 2.3.
- Flatness here is flatness as a module. Intrinsic flatness inside the category of flat modules
  ([CI]) is not developed.
- [Operator K-theory](../OperatorKTheory/README.md), §8.2, owns the computations of `Ext` and
  `Tor` over `ℤ` (free presentations, cyclic groups, universal coefficients). The comparison of
  1.6 covers every commutative ring; no other `ℤ`-specific computation is done here.
- [Derived and module algebra](../DerivedModuleAlgebra/README.md) owns the derived tensor
  product and `Tor` amplitude over commutative rings. This roadmap uses derived categories only
  through Mathlib's `Abelian.Ext` (1.5).
- [Krull-Schmidt categories and Auslander-Reiten theory of Artin
  algebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2, owns the statements that compare
  left and right global dimension with no weak dimension in them; statements involving the weak
  global dimension live here. Their proofs on main
  (`TauCeti/RingTheory/GlobalDimension/MulOpposite.lean`, through character modules) are replaced
  by the weak-dimension route of 3.4 once Layers 0–3 exist; the statements are kept (refactor
  consumer, 3.4). Layer 4 gives `gldim A = wgldim A = gldim Aᵐᵒᵖ` for rings that are perfect on both
  sides (4.6), which recovers §7.2's semiprimary statement by a second route.
- Tau Ceti's ring `TauCeti.globalDimension` becomes the case `ModuleCat A` of the global dimension
  of an abelian category (3.2): a refactor of main, with no compatibility shims.
- Semiperfect rings are Tau Ceti's `TauCeti.IsSemiperfectRing`, with its idempotent
  characterization; it is refactored to `extends IsSemilocalRing` (4.2, Downstream consumers).
  This roadmap owns their projective covers and their characterization by projective covers (4.2).
  Krull–Schmidt categories, the radical `TauCeti.jacobsonRadicalIdeal` and essential epimorphisms
  are Tau Ceti's; Krause's criterion is restated with `IsSemiperfectCategory` (4.2). Tau Ceti's
  ideals `TauCeti.MorphismIdeal` are two-sided; the one-sided ideals of a category are new here
  (0.3), and the two-sided ones map to both kinds by coercions. Minimal projective presentations are
  Tau Ceti's `TauCeti.IsMinimalProjectivePresentation`; this roadmap owns only their existence over
  a semiperfect ring (4.2).
- Outside this roadmap: the tensor product of additive categories and functors of several variables
  ([Mitchell, §2]); Morita theory for functor categories, beyond the finite-object comparison of
  1.7; Bass's conditions on direct limits of modules of bounded projective dimension and on
  orthogonal idempotents and socles ([Bass, Theorem P (4), (7)]), and Simson's Mittag-Leffler,
  product, coperfectness and endomorphism-ring conditions ([Simson, Thm. 5.4 (2)–(4), (6)]), which
  stay pointers (4.5); semiprimary categories as a class (4.3); Chase's theorem,
  coherent rings and products of flat modules (pointers in 2.6; kernels are in 3.5); flat covers
  (pointers in 2.4); purity beyond the purity test of 2.3 (pure-injective modules, pure global
  dimension); flat Mittag-Leffler modules; faithful flatness over noncommutative rings; the
  conditions on maximal submodules and socles ([AF, 28.4 (c), (f)]), on finitely generated
  submodules (Björk) and on principal left ideals with the ascending chain condition (Jonah);
  finitistic dimensions ([Bass, Part II]); `Tor` of bimodules and its module structure over a base
  ring; and Hoshino's flat-dominant dimension.

Suggested homes in Tau Ceti: `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean` (the
refactor of 0.1), `TauCeti/CategoryTheory/Preadditive/ModCat/` (0.1, 0.3–0.5, 0.7),
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
`TauCeti/Algebra/Module/ProjectiveCover/Semiperfect.lean` and
`TauCeti/RingTheory/Jacobson/LeftPerfect.lean` (ring items of Layer 4). Nothing goes under
`TauCeti/RingTheory/Perfect/`, which is the characteristic-`p` notion.

## Conventions

1. **One module convention.** `C : Type u` is a preadditive category, `[Category.{v} C]
   [Preadditive C]`. A `C`-module is a contravariant additive functor `Cᵒᵖ ⥤ AddCommGrpCat.{w}`.
   `Mod C` (`TauCeti.ModCat C`) is the full subcategory of additive functors in the ordinary
   functor category, Mathlib's `Cᵒᵖ ⥤+ AddCommGrpCat.{w}`. Tau Ceti's `mod C` (refactored in 0.1)
   is a full subcategory of `Mod C` for `w = v`, as in
   [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md). This matches Mathlib, whose
   ring modules are left modules and whose Yoneda embedding is contravariant
   (`preadditiveYoneda : C ⥤ Cᵒᵖ ⥤ AddCommGrpCat`), so that `C ⊆ proj C ⊆ Mod C` covariantly (0.1,
   0.8). There is no separate category of covariant modules: a covariant additive functor is a
   module over the other side, an object of `Mod Cᵒᵖ` (`TauCeti.ModCat Cᵒᵖ`). Every statement is
   made for `Mod C`; the other side is the same statement over `Cᵒᵖ`. The covariant representable
   `Hom(X, -)` is the representable of `Cᵒᵖ` at `op X`, `(ModCat.yoneda Cᵒᵖ).obj (op X)`. Mathlib's
   `preadditiveCoyoneda` is not used: its values `C ⥤ AddCommGrpCat` are not objects of `Mod Cᵒᵖ`,
   whose objects are functors `Cᵒᵖᵒᵖ ⥤ AddCommGrpCat`. No enriched functor categories are used.
2. **Linearity.** `R` is a commutative ring and `C` may be `R`-linear (Mathlib's `Linear R C`, extra
   structure on `Preadditive C`). Every preadditive category is `ℤ`-linear (Mathlib's
   `preadditiveIntLinear`). A module carries only its additive structure; its `R`-structure is
   derived: `r` acts on `F(c)` by `F(r • 𝟙 c)` (0.1). This is the analogue of `ModuleCat A`,
   which carries only the `A`-action, with the `R`-action of an `R`-algebra recovered by Tau
   Ceti's `ModuleCat.moduleOfAlgebra`. Following Mathlib's category theory, `R` enters a
   definition only when it changes the result: `G ⊗_C F` and `Tor` take values in abelian groups
   (`AddCommGrpCat`), and for an `R`-linear `C` they carry `Module R` instances, `r` acting
   through `r • 𝟙` in either variable. This is the pattern of Mathlib's `Abelian.Ext`, an abelian
   group with the instance `Module R (Ext X Y n)` and the lemma `Abelian.Ext.smul_eq_comp_mk₀`
   (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`). `Hom_R(G(-), X)` and the duals of
   0.7 do depend on `R`, and take it as a parameter. The ring-level `M ⊗_A N` is Tau Ceti's
   `TauCeti.BalancedTensorProduct R A M N`, defined over `R`.
3. **Universes.** `C : Type u`, `Category.{v} C`, values in `AddCommGrpCat.{w}`. Definitions that
   quantify only over objects, morphisms and elements are universe-free and need no smallness:
   finite presentation (0.1), flatness (2.1), T-nilpotence (4.1), and the items of 2.4. Statements
   that use the tensor product, `Tor`, the Lazard block, Bass's modules or flat dimension are made
   for `EssentiallySmall.{v} C` with modules in `ModCat.{v} C`, the universe of the morphisms, where
   the representables live; this common universe is the scope of those milestones. Rings and small
   categories satisfy it with `w = v`; the category `mod A` of finitely presented modules uses
   Mathlib's `SmallModel`. A category that is `EssentiallySmall.{w}` for another `w` is first
   replaced by Mathlib's `SmallModel` (an equivalence): `ULift` can raise the universe of the
   representables when `w ≥ v`, but it cannot lower it, and for `w < v` the Hom groups are shrunk
   along the smallness (Mathlib's `ShrinkHoms`). The comparison of the global dimensions in two
   universes is 3.2's universe independence.
4. **Rings.** `A` is a ring, `[Ring A]`, not assumed commutative, and an `R`-algebra
   `[Algebra R A]` where an `R`-structure is needed. Modules over a ring are left modules. A right
   `A`-module is a left `Aᵐᵒᵖ`-module, `[Module Aᵐᵒᵖ M]`, as in `TauCeti.BalancedTensorProduct`.
   A right-handed statement is the left-handed one for `Aᵐᵒᵖ`; no separate "right" predicate is
   introduced. A left `A`-module is a right `Aᵐᵒᵖ`-module through `RingEquiv.opOp A`. A right ideal
   of `A` is a `Submodule Aᵐᵒᵖ A` (Mathlib's spelling, e.g. in
   `Mathlib/Topology/Algebra/LinearTopology.lean`), so that `A ⧸ I` is a right module and `I ∩ K`
   makes sense for a left ideal `K : Ideal A`. The left and right ideals of `A` are the left and
   right ideals of the category `SingleObj Aᵐᵒᵖ` (0.3). A ring enters the categorical theory as
   `SingleObj Aᵐᵒᵖ`, as in Mathlib's `CategoryTheory.Mat.equivalenceSingleObj :
   Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)` (`Mathlib/CategoryTheory/Preadditive/Mat.lean`). Mathlib's
   `SingleObj M` composes as `f ≫ g = g * f` (`SingleObj.comp_as_mul`); in `SingleObj Aᵐᵒᵖ` this
   is `f ≫ g = op (unop f * unop g)`, so a contravariant `F` satisfies `F(a b) = F(a) ∘ F(b)`: a
   left `A`-module. So `Mod (SingleObj Aᵐᵒᵖ)` is `ModuleCat A`, `Mod (SingleObj Aᵐᵒᵖ)ᵒᵖ` is
   `ModuleCat Aᵐᵒᵖ`, the representable `Hom(-, ∗)` is the regular left module, and
   `proj (SingleObj Aᵐᵒᵖ)` is Tau Ceti's `TauCeti.finiteProjectiveModules A` (0.2, 0.8).
5. **Ring-level objects are native.** For an `R`-algebra `A`, a right module `M` and a left module
   `N` that are `R`-modules compatibly (`IsScalarTower R Aᵐᵒᵖ M`, `IsScalarTower R A N`),
   `M ⊗_A N` is `TauCeti.BalancedTensorProduct R A M N`, with its element API; the maps `f ⊗ N` and
   `M ⊗ g` are `R`-linear and the bifunctor lands in `ModuleCat R` (0.6). Ring-level objects are
   not transported from functor categories. Each ring theorem is proved directly or through the
   comparison of 0.6, whichever is simpler; the rule constrains definitions only. Every later layer
   is to end with a "rings" item restating its theorems for `ModuleCat A`, so that downstream code
   never sees functor categories.
6. **Order of the tensor product and `Tor`.** The ring order is kept: `M ⊗_A N` has the right
   module `M` first, as in `TauCeti.BalancedTensorProduct R A M N`. So the categorical tensor
   product `G ⊗_C F` takes the covariant functor `G` (an object of `Mod Cᵒᵖ`, the right-module
   side) first and the module `F` of `Mod C` second, and `Tor^C_n(G, F)` is the left derived
   functor of `G ⊗_C -`, derived in the `Mod C` variable `F`; ring `Tor_n^A(M, N)` is derived in the
   left-module variable `N`. Over a commutative ring, ring `Tor` is compared directly with Mathlib's
   `CategoryTheory.Tor` (1.6). Flatness (2.1) is defined without the tensor product, and the
   dimensions of Layer 3 use `Tor` with values in abelian groups. Modules live in
   `ModuleCat.{v} A` and `ModuleCat.{v} Aᵐᵒᵖ` with `[Small.{v} A]`, as for
   `TauCeti.globalDimension`; the instance `Small.{v} Aᵐᵒᵖ` is part of 0.2.
7. Dimensions take values in `WithBot ℕ∞`, with `⊥` exactly for the zero module, as Mathlib's
   `CategoryTheory.projectiveDimension` and Tau Ceti's `TauCeti.globalDimension`. The global
   dimension of an abelian category is `TauCeti.Abelian.globalDimension` (3.2); for `C` it is that
   of `ModCat C`, and that of the other side is the global dimension of `ModCat Cᵒᵖ`.
   `TauCeti.globalDimension A` is the left global dimension, that of `ModCat (SingleObj Aᵐᵒᵖ)`; the
   right one is `TauCeti.globalDimension Aᵐᵒᵖ`.
8. `J = Ring.jacobson A` for a ring, and `J(C) = TauCeti.jacobsonRadicalIdeal C` for a category,
   with `J(C)(X, X) = Ring.jacobson (End X)`. A **left ideal** of `C` (`TauCeti.LeftMorphismIdeal`,
   0.3) is closed under precomposition, a **right ideal** (`TauCeti.RightMorphismIdeal`) under
   postcomposition; Tau Ceti's two-sided `TauCeti.MorphismIdeal`, such as `J(C)`, is both. A left
   ideal `I` is **T-nilpotent** (`TauCeti.LeftMorphismIdeal.IsTNilpotent`) if every sequence
   `c₀ → c₁ → ⋯` of morphisms `fᵢ` in `I` has a vanishing composite `f₀ ≫ ⋯ ≫ fₙ₋₁ : c₀ → cₙ`
   (4.1). This is the direction of Nakayama's lemma for `Mod C`, whose `I · M` needs only
   precomposition. The predicate carries no "left" or "right" of its own: the other side is
   T-nilpotence of the left ideal `I.op` of `Cᵒᵖ` for a right ideal `I` of `C`
   (`TauCeti.RightMorphismIdeal.op`; for a two-sided ideal, Tau Ceti's opposite ideal `I.op`), that
   is, of the chains `c₀ ← c₁ ← ⋯`, which is the "left T-nilpotence" of [Simson, p. 108] for his
   covariant modules. A subset `S` of a ring `A` is **left T-nilpotent** if for every sequence
   `a₀, a₁, …` in `S` some product `a₀ a₁ ⋯ aₙ₋₁` is `0` ([Bass, p. 466], [Lam-FC, (23.13)], [AF,
   p. 314]). In `SingleObj Aᵐᵒᵖ` the composite of `op a₀, …, op aₙ₋₁` is `op (a₀ a₁ ⋯ aₙ₋₁)`, so
   for a left ideal `J` of `A`, T-nilpotence of the corresponding left ideal of `SingleObj Aᵐᵒᵖ` is
   left T-nilpotence of `J`. Right T-nilpotence asks `aₙ₋₁ ⋯ a₀ = 0`; it is left T-nilpotence of
   the image of `S` in `Aᵐᵒᵖ`.
9. `C` is **perfect** (`IsPerfectCategory`) if every `End X` is semilocal and `J(C)` is
   T-nilpotent, equivalently `C ⧸ J(C)` is semisimple in Simson's sense and `J(C)` is T-nilpotent
   (4.2, 4.3). By Theorem P (4.5) this holds exactly when every module of `Mod C` has a projective
   cover. The other side is `IsPerfectCategory Cᵒᵖ`. A ring `A` is **left perfect**
   (`IsLeftPerfectRing`) if `A ⧸ J` is a semisimple ring and `J` is left T-nilpotent; this is
   `IsPerfectCategory (SingleObj Aᵐᵒᵖ)`. By Theorem P it holds exactly when every left module has a
   projective cover, which is Bass's definition ([Bass, p. 467]), and exactly when the *right*
   principal ideals satisfy the descending chain condition. [Lam-FC] works with right modules: its
   "right perfect" is `IsLeftPerfectRing Aᵐᵒᵖ` here.
10. Mathlib's `PerfectRing R p` and Tau Ceti's `TauCeti/RingTheory/Perfect/` concern the Frobenius
   map in characteristic `p`. The notions here are always called `IsLeftPerfectRing` and
   `IsPerfectCategory`.
11. **Duals.** For an `R`-module `E`, the dual of a module is `F^E = Hom_R(F(-), E)`, a covariant
   functor (0.7); for rings it is Tau Ceti's `TauCeti.MatlisDual R E M`. Hypotheses on `E`
   (injective, cogenerator) sit on the theorems, not on the definition.
   `CharacterModule M = M →+ ℚ ⧸ ℤ` is Mathlib's, the case `R = ℤ`, `E = ℚ ⧸ ℤ`. For a left module
   `M` it is a right module through Tau Ceti's scoped instance
   `CharacterModule.instModuleMulOpposite`; write `M⁺`.
12. Over a category, a projective cover is an essential epimorphism (Tau Ceti's
   `TauCeti.IsEssentialEpi`) from a projective object; "`M` has a projective cover" is
   `TauCeti.HasProjectiveCover M` (4.2). For an epimorphism of an abelian category, essential means
   that the kernel is superfluous (0.3), with the lattice predicate `TauCeti.IsSuperfluous`. Over a
   ring, projective covers are Tau Ceti's `TauCeti.IsProjectiveCover`: a surjection from a
   projective module whose kernel is superfluous (`TauCeti.IsSuperfluous`, the case of the lattice
   `Submodule R M`); the two agree by `TauCeti.isProjectiveCover_iff_forall_surjective`.
   For rings, "`M` has a projective cover" is
   `∃ (P : Type u) (_ : AddCommGroup P) (_ : Module A P) (p : P →ₗ[A] M), IsProjectiveCover p`,
   with `P` in the universe of `A` (4.2, 4.5). For all modules over a left perfect ring, in every
   universe, it takes the form of Tau Ceti's `TauCeti.exists_isProjectiveCover` (4.4).
13. Proposed names are given in parentheses. Names that `Suggested.lean` states carry the prefix
   `TauCeti.` in the README and live in `TauCetiRoadmap.NoncommutativeFlatness` there.
14. **Sources on the other side.** [OR], [St], [CB], [Fisher] (except Cor. 2.9),
   [Krause-Smashing, Lemma 2.7, p. 115] and the flat functors of [Mitchell, §10] are contravariant,
   as here, and are cited directly. [OR]'s tensor product `S ⊗_X F` puts the contravariant functor
   `S` first, so its `Tor_1(S, X(z, -) ⧸ I)` is our `Tor_1(X(z, -) ⧸ I, S)` (Convention 6); [OR,
   Thm. 4.1 (5)] (products of flat functors in `[X, Mod K]`) is covariant. [Fisher, Cor. 2.9] is
   covariant, and our statement of it is over `Cᵒᵖ`. [Simson] is covariant, except Thm. 2.1 (b),
   which is already stated for `Cᵒᵖ`-modules, that is, contravariant functors. [Harada] uses both
   sides: Part I, Theorems 3–4, and Part II are for the contravariant `(C⁰, Ab)`, as here, and
   Part I, Theorem 5 is covariant. [Mitchell]'s general modules (§3, §7 with Thm. 7.1, §9 p. 45 (6),
   §11) are covariant, with the contravariant case of Thm. 7.1 on p. 37. [ML, IX.6] takes left
   modules as covariant functors on the one-object category `R` (Mathlib's `SingleObj A`) and puts
   the contravariant functor first in the tensor product. Mathlib's `RepresentablyFlat` and `Action`
   are covariant. Covariant statements are applied to `Cᵒᵖ`, and the citations say so. Ring sources
   keep their sides: a right-handed ring statement is applied to `Aᵐᵒᵖ`. [Lam-LMR] states its
   results for right modules, and [Lam-FC] §§23–24 is right-handed; [Lam-FC, (4.14)] is left-handed.

**Sources and locators.** Citations use the keys of the section "Sources and locators". Pages are
printed pages. A locator that has not been read in a local copy of the source says "(not checked
here)".

## Exact supplier contracts

`Suggested.lean` is checked against this repository's pinned Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5` (Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`).
Names were also checked at Tau Ceti main `71ce0a33087999414b8424bf26c3a1d9fbbce54e` (Mathlib
`e8ba86fa9744dd8d90f48c1752bc735f61a4ca81`). Tau Ceti suppliers that are on main but not at the pin
are marked "(main, since `<commit>`)"; the few that `Suggested.lean` uses appear there as marked
`sorry` stand-ins in its first section, to be replaced by imports at the next pin bump.

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
  `CategoryTheory.EnoughInjectives`, `CategoryTheory.Injective`.
- Subobject lattices (0.1, 4.2): `CategoryTheory.Subobject` with its lattice instances,
  `CategoryTheory.WellPowered`, `IsModularLattice`, `IsCompactlyGenerated`, `IsAtomistic`,
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
  `CategoryTheory.Functor.whiskeringLeft`. Named only as a future refactor path (1.1):
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
  `Module.Flat.exists_factorization_of_finitePresentation` and
  `Module.Flat.projective_of_finitePresentation`;
  `CharacterModule` with `CharacterModule.homEquiv`.
- Modules and rings: `Module.Projective`, `Module.Injective`, `Module.Baer` with
  `Module.Baer.injective`, `Module.FinitePresentation`, `Module.finitePresentation_of_finite`,
  `Module.Finite`, `Submodule.IsPrincipal`, `WellFoundedLT`, `Ring.jacobson`, `Module.jacobson`,
  `IsSemisimpleRing`, `IsSemiprimaryRing` with the instance `IsArtinianRing → IsSemiprimaryRing`
  (`Mathlib/RingTheory/Artinian/Module.lean`) and `IsSemiprimaryRing.isNoetherian_iff_isArtinian`,
  `IsNoetherianRing`, `IsArtinianRing`, `IsNoetherian`, `IsArtinian`, `IsLocalRing` with
  `IsLocalRing.maximalIdeal`, `IsNilpotent`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`,
  `MulOpposite`, `RingEquiv.opOp`, `RingEquiv.toOpposite`, `Module.compHom`,
  `ModuleCat.restrictScalars`, `ModuleCat.restrictScalarsEquivalenceOfRingEquiv`, `AddCommGrpCat`,
  `isSimpleModule_iff_isCoatom`, `IsCompactElement`, `Submodule.fg_iff_compact`,
  `CompleteOrthogonalIdempotents`, `DFinsupp`.

### From Tau Ceti

- Finitely presented functors, refactored in 0.1 (main, since `08b8cef15a`):
  `TauCeti.IsFinitelyGeneratedFunctor`, `TauCeti.IsFinitelyPresentedFunctor`,
  `TauCeti.isFinitelyPresentedFunctor` and `TauCeti.IsFinitelyPresentedFunctor.additive`
  (`TauCeti.CategoryTheory.FinitelyPresentedFunctor.Basic`); the lifting lemmas
  `CategoryTheory.exists_comp_eq_preadditiveYoneda_obj_of_epi` (a map out of `Hom(-, Y)` lifts
  along an epimorphism, the projectivity of representables in 0.1),
  `CategoryTheory.exists_preadditiveYoneda_map_comp_eq`, `epi_preadditiveYonedaMap` and
  `preadditiveYoneda_map_comp_preadditiveYonedaMap_eq_zero_iff` (the quotient map
  `Hom(-, X) → Hom(-, X) ⧸ I(-, X)`, as in `MorphismIdeal.quotientYoneda`, 0.3)
  (`TauCeti.CategoryTheory.Preadditive.Yoneda`, main, since `08b8cef15a`, `91c8f2b78e` and
  `7ca783d4c8`);
  `TauCeti.modYoneda`, `TauCeti.projective_modYoneda_obj` and
  `TauCeti.projective_iff_mem_essImage_modYoneda`
  (`...FinitelyPresentedFunctor.ProjectiveDimension`, main, since `1f9244800a`; compare 0.8);
  `TauCeti.finitePresentationEquivalenceMod`
  (`TauCeti.Algebra.Category.ModuleCat.FinitePresentation`, main, since `328eb4e8ed`), the case
  `C = proj R` of the comparisons of 0.8.
- Representable covers (4.2, main, since `7ca783d4c8`): `TauCeti.IsRepresentableProjectiveCover`
  (an epimorphism `Hom(-, P) → F` that is right minimal),
  `TauCeti.isRepresentableProjectiveCover_iff`,
  `TauCeti.isRepresentableProjectiveCover_preadditiveYonedaMap_jacobsonRadicalIdeal`,
  `TauCeti.simple_comp_preadditiveYoneda_obj_quotientFunctor_jacobsonRadicalIdeal`,
  `TauCeti.exists_isRepresentableProjectiveCover_of_epi_biproduct` and
  `TauCeti.IsKrullSchmidt.exists_isRepresentableProjectiveCover`
  (`TauCeti.CategoryTheory.FinitelyPresentedFunctor.ProjectiveCover`).
- Modules over an algebra: `ModuleCat.moduleOfAlgebra` and
  `ModuleCat.isScalarTower_moduleOfAlgebra` (`TauCeti.Algebra.Category.ModuleCat.Algebra`, main,
  since `5bb219b75a`); `TauCeti.MatlisDual` with its right- and left-module instances
  (`TauCeti.RingTheory.MatlisDuality.Basic`, main, since `5bb219b75a`); `ModuleCat.matlisDual` and
  `ModuleCat.matlisDualOp` (`TauCeti.Algebra.Category.ModuleCat.MatlisDual`, main, since
  `5bb219b75a`).
- The balanced tensor product: `TauCeti.BalancedTensorProduct` with `tmul`, `balance`, `lift`,
  `hom_ext`, `induction_on`, `map` and `congr`
  (`TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic`); `lid` and `rid`
  (`...Balanced.Unit`); `finsuppScalarRight` (`...Balanced.Finsupp`); `assoc`
  (`...Balanced.Associator`).
- Character modules: `TauCeti.CharacterModule.eval_injective`
  (`TauCeti.Algebra.Module.CharacterModule`); `CharacterModule.instModuleMulOpposite`,
  `CharacterModule.opDual`, `CharacterModule.exact_opDual`,
  `CharacterModule.injective_of_projective` and `CharacterModule.projective_of_injective`
  (`TauCeti.Algebra.Module.CharacterModule.MulOpposite`, main, since `bae88f9832`).
- Global dimension: `TauCeti.globalDimension` with `TauCeti.globalDimension_def`,
  `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE`, `TauCeti.globalDimension_le_tfae`,
  `TauCeti.globalDimension_eq_bot_iff` and `TauCeti.globalDimension_eq_zero_of_isSemisimpleRing`
  (`TauCeti.RingTheory.GlobalDimension`); `TauCeti.globalDimension_eq_iSup_cyclic`,
  `TauCeti.globalDimension_eq_iSup_finite` and
  `TauCeti.globalDimension_eq_one_of_isPrincipalIdealRing` (same module, main, since `e4e0b0bd6a`),
  `TauCeti.globalDimension_eq_globalDimension` (main, since `3f672dfd08`); the refactor consumers
  `TauCeti.globalDimension_le_globalDimension_mulOpposite`, `TauCeti.globalDimension_mulOpposite`,
  `TauCeti.globalDimension_mulOpposite_of_moduleFinite` and
  `TauCeti.hasInjectiveDimensionLE_characterModule_iff`
  (`TauCeti.RingTheory.GlobalDimension.MulOpposite`, main, since `bae88f9832`);
  `CategoryTheory.Equivalence.projectiveDimension_functor_obj`
  (`TauCeti.Algebra.Homology.Ext.Equivalence`, main, since `3f672dfd08`).
- Left derived functors: `CategoryTheory.NatTrans.leftDerived_add`,
  `CategoryTheory.Functor.isZero_leftDerived_succ` and
  `CategoryTheory.ShortComplex.ShortExact.leftDerivedOneIsoKernel`
  (`TauCeti.CategoryTheory.Abelian.LeftDerived`); the acyclic assembly lemma
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`TauCeti.Algebra.Homology.TotalComplex.Basic`) and the instance
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
  `TauCeti.MorphismIdeal.mat` and `TauCeti.MorphismIdeal.karoubi` (`...MorphismIdeal.Mat`,
  `...MorphismIdeal.Karoubi`, main, since `0c630122a0`; no new ideals in `Mat_ C` and `Karoubi C`,
  for moving `J(C)` to `proj C ≌ Karoubi (Mat_ C)` in 0.8 and 4.2);
  `TauCeti.jacobsonRadicalIdeal` and `TauCeti.jacobsonRadical_self_eq_jacobson`
  (`TauCeti.CategoryTheory.Preadditive.Radical.Basic`);
  `TauCeti.exists_jacobsonRadicalIdeal_pow_eq_bot` (`...Radical.Nilpotent`).
- Krull–Schmidt categories and covers (Layer 4): `TauCeti.IsKrullSchmidt`
  (`TauCeti.CategoryTheory.Preadditive.KrullSchmidt.Basic`, main, since `501cc722a3`);
  `TauCeti.exists_equiv_iso_of_biproduct_iso_of_isLocalRing`
  (`TauCeti.CategoryTheory.Preadditive.KrullSchmidt.Uniqueness`, main, since `26a769fcdd`; the check
  of 0.8); `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end`,
  `TauCeti.isKrullSchmidt_of_isSemiperfectRing_end` and
  `TauCeti.IsKrullSchmidt.isSemiperfectRing_end` (`...KrullSchmidt.Semiperfect`, main, since
  `f176b67483`), the refactor consumers of 4.2; `TauCeti.IsEssentialEpi`
  (`TauCeti.CategoryTheory.Projective.Cover`);
  `TauCeti.isProjectiveCover_iff_forall_surjective`
  (`TauCeti.Algebra.Module.ProjectiveCover.Basic`).
- Finitely generated projective modules (0.8): `TauCeti.finiteProjectiveModules`
  (`TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`); `TauCeti.projectivizationFunctor`
  (`TauCeti.CategoryTheory.Preadditive.Projectivization`, main, since `c58d9d22db`), as the
  one-object pattern.
- Semiperfect rings: `TauCeti.IsSemiperfectRing` with the instance
  `TauCeti.IsSemiperfectRing.of_isSemiprimaryRing` (`TauCeti.RingTheory.Jacobson.Semiperfect`), a
  refactor consumer (4.2);
  `TauCeti.IsSemiperfectRing.exists_completeOrthogonalIdempotents_isLocalRing_corner` and
  `TauCeti.IsSemiperfectRing.of_isLocalRing_corner` (`TauCeti.RingTheory.Idempotents.Semiperfect`,
  main, since `bc551e5d40` and `f176b67483`);
  `CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`
  (`TauCeti.RingTheory.Idempotents.Primitive.Decomposition`);
  `IsIdempotentElem.isLocalRing_end_of_isLocalRing_corner`
  (`TauCeti.RingTheory.Idempotents.Corner.Local`, main, since `f176b67483`);
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
  (`...ProjectiveCover.Simple`); `Module.Projective.sup_ne_top_of_isLocalRing_end`
  (`TauCeti.Algebra.Module.Projective.Local`, main, since `f176b67483`).
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

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §4.2: Auslander's defect
  formula `D δ^*(X) ≅ δ_*(D Tr X)` with Krause's proof, whose snake-lemma step identifies
  `δ^*(X) = coker(Hom(X, B) → Hom(X, C))` with the kernel of `Tr X ⊗ A → Tr X ⊗ B`
  ([Krause-Defect, pp. 268–269]). The ring form of 1.4 uses that step; the categorical form of 1.4
  proves the same step in `Mod C`. The defect formula itself is not a target here.

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

(`TauCeti.ModCat C := Cᵒᵖ ⥤+ AddCommGrpCat.{w}`; covariant functors are `TauCeti.ModCat Cᵒᵖ`.)

- **Finite presentation by finite sums of representables**, the first target, a downstream refactor
  of Tau Ceti main (`TauCeti.matrixMap`, `TauCeti.exists_eq_matrixMap`,
  `TauCeti.IsFinitelyGeneratedFunctor`, `TauCeti.IsFinitelyPresentedFunctor`,
  `TauCeti.isFinitelyPresentedFunctor`, `TauCeti.IsFinitelyPresentedFunctor.additive`). A functor
  `F : Cᵒᵖ ⥤ AddCommGrpCat.{v}` is finitely generated if it is a quotient of a finite sum of
  representables `Hom(-, Y₁) ⊕ ⋯ ⊕ Hom(-, Yₙ)`, and finitely presented if it is the cokernel of a
  map between two such sums, written as an exact sequence as on main. A map between finite sums of
  representables is, by Yoneda, given by a matrix of morphisms of `C`; `matrixMap` is this
  construction. Main's definitions use one representable in each place: they agree under finite
  biproducts (`TauCeti.isFinitelyGeneratedFunctor_iff_exists_epi`,
  `TauCeti.isFinitelyPresentedFunctor_iff_exists_hom`), and every theorem on main about them
  assumes finite biproducts (closure properties, extensions, projective dimension, weak kernels,
  covers and almost split sequences with Krull–Schmidt hypotheses, the abelian category of
  `RestrictedYoneda`), so those keep their meaning; the only use outside is `C = proj R`, which is
  additive. Without biproducts the single-representable notion is wrong: for the ring `ℤ`, the
  module `ℤ²` is not a quotient of `ℤ`. The refactor replaces main's definitions, with no
  compatibility shims; `mod C` is their full subcategory. Finite presentation statements live in
  `ModCat.{v} C`, where the representables live (Convention 3); 0.8 compares the notion with
  `proj C`, with Mathlib's `IsFinitelyPresentable` and with `Module.FinitePresentation`.
- **Abelian.** In `D ⥤ AddCommGrpCat`, the additive functors (Mathlib's `additiveFunctor`)
  contain the zero functor and are closed under kernels, cokernels and finite products, all
  computed objectwise (instances of `ObjectProperty.ContainsZero`,
  `ObjectProperty.IsClosedUnderKernels`, `ObjectProperty.IsClosedUnderCokernels` and
  `ObjectProperty.IsClosedUnderFiniteProducts`). Mathlib's instance for full subcategories then
  makes `Mod C` abelian, for every `C`, so also `Mod Cᵒᵖ`. The additive functors are also closed
  under colimits (`ObjectProperty.IsClosedUnderColimitsOfShape`; colimits commute with finite
  biproducts), so `Mod C` has the colimits of `AddCommGrpCat` (Layer 2 uses them).
- **Representables** (`TauCeti.ModCat.yoneda : C ⥤ ModCat.{v} C`, from Mathlib's
  `preadditiveYoneda`). `Hom(-, X)` is projective, since `Hom(Hom(-, X), F) ≅ F(X)` by Yoneda (Tau
  Ceti main's `CategoryTheory.exists_comp_eq_preadditiveYoneda_obj_of_epi` is the lifting
  statement). When `C` is `EssentiallySmall.{w}`, every module is a quotient of a coproduct of
  representables (formed in a small model of `C`, Convention 3), so `Mod C` has enough projectives
  ([Mitchell, §3, pp. 15–18]). Over `Cᵒᵖ`, `(ModCat.yoneda Cᵒᵖ).obj (op X)` is the covariant
  representable `Hom(X, -)`; the covariant representables enter this way and not through Mathlib's
  `preadditiveCoyoneda` (Convention 1).
- **Grothendieck structure** (an instance `IsGrothendieckAbelian.{w} (ModCat.{w} C)` for
  `EssentiallySmall.{w} C`). Its fields are local smallness, filtered colimits and AB5 (objectwise,
  from the closure under colimits and Mathlib's functor-category instances) and a separator, the
  sum of the representables (compare `Mathlib/CategoryTheory/Generator/Presheaf.lean`). Mathlib then
  gives enough injectives (`IsGrothendieckAbelian.enoughInjectives`), which 3.2 uses, the instance
  `IsGrothendieckAbelian.hasExt`, and `IsGrothendieckAbelian.generatingMonomorphisms_rlp`: lifting
  against the subobjects of a separator is lifting against all monomorphisms, a one-separator Baer
  criterion beside the representable Baer criterion of 2.2.
- **Subobject lattices** (instances `WellPowered.{w} (ModCat.{w} C)`,
  `IsModularLattice (Subobject M)` and `IsCompactlyGenerated (Subobject M)`). With well-poweredness,
  Mathlib makes `Subobject M` a complete lattice; it is modular because it is computed objectwise,
  and compactly generated, the compact elements being the finitely generated subobjects. 4.2 uses
  these for semisimple modules. Neither Mathlib nor Tau Ceti has them for functor categories.
- **`R`-linear structure** (`TauCeti.Functor.objModule`, `TauCeti.Functor.toModuleCat`, and an
  instance `Linear R (ModCat C)`). For `Linear R C`, `r` acts on `F(c)` by `F(r • 𝟙 c)`; every
  `F(f)` is then `R`-linear, so `F` becomes a functor to `ModuleCat R`, and every natural
  transformation is `R`-linear. `Mod C` is `R`-linear with `(r • α)_c = r • α_c`; through Mathlib's
  `Linear.oppositeCategory` the same holds for `Mod Cᵒᵖ`. [Mitchell, §11, p. 51]: for an
  `R`-linear `C`, the `R`-linear functors to `R`-modules are the additive functors to abelian
  groups.
- **`mod C ⊆ Mod C`** (`TauCeti.isFinitelyPresentedFunctor_le_additiveFunctor`, with the inclusion
  `TauCeti.ModCat.ιFinitelyPresented`; `w = v`). Finitely presented functors are an `ObjectProperty`
  on the same ambient category `Cᵒᵖ ⥤ AddCommGrpCat.{v}`, and they are additive. So the inclusion is
  an inequality of properties.

**Checks.**

- For the `k`-linear category of the quiver `1 → 2` (one nonzero morphism space `Hom(1, 2) = k`
  besides the identities), a module is a pair of vector spaces with a linear map `V₂ → V₁`; the
  representables `Hom(-, 1)` and `Hom(-, 2)` are `0 → k` and `k → k`, the indecomposable
  projective modules. The covariant functors, the modules over `Cᵒᵖ`, are the representations
  `V₁ → V₂`.
- For `C = SingleObj Aᵐᵒᵖ`, `Mod C` is `ModuleCat A` (0.2), and finite presentation in the sense
  above is `Module.FinitePresentation` (0.8); `ℤ²` over `ℤ` is finitely presented in this sense and
  not in main's present sense.

*Needs:* Mathlib `additiveFunctor`, the closure classes and the full-subcategory abelian instance,
`preadditiveYoneda`, `Linear`, `Linear.oppositeCategory`, `EssentiallySmall`,
`IsGrothendieckAbelian`, `WellPowered`, `IsModularLattice`, `IsCompactlyGenerated`; Tau Ceti main's
`TauCeti.IsFinitelyPresentedFunctor` (refactored here).

### 0.2 Rings as one-object categories

For a ring `A`, Mathlib's `SingleObj A` is preadditive, with `f ≫ g = g * f`. A ring enters as
`SingleObj Aᵐᵒᵖ` (Convention 4), where `f ≫ g = op (unop f * unop g)`.

- (`TauCeti.moduleCatEquivModCat A : ModuleCat.{v} A ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)` and
  `TauCeti.moduleCatMulOppositeEquivModCatOp A :
  ModuleCat.{v} Aᵐᵒᵖ ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)ᵒᵖ`), for any module universe `v`, on the
  pattern of Mathlib's `Action.functorCategoryEquivalence`. A left module `M` goes to the functor
  with value `M` at `∗` on which `op a` acts by `a`; `F(a b) = F(a) ∘ F(b)` is the computation of
  Convention 4. The regular modules go to the representables `Hom(-, ∗)` and `Hom(∗, -)`
  (`TauCeti.moduleCatEquivModCatRegularIso`, `TauCeti.moduleCatMulOppositeEquivModCatOpRegularIso`).
  [ML, IX.6, p. 226] describes left and right modules as additive functors on the one-object
  category in this way. Mathlib's `CategoryTheory.Mat.equivalenceSingleObj :
  Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)` is the precedent for entering a ring as `Rᵐᵒᵖ`. Neither
  equivalence is in Mathlib or Tau Ceti.
- (`TauCeti.singleObjMulOppositeEquiv A : SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ`), additive. At `Aᵐᵒᵖ`
  it identifies `SingleObj Aᵐᵒᵖᵐᵒᵖ` with `(SingleObj Aᵐᵒᵖ)ᵒᵖ`, which the ring swap uses (1.3). Not
  in Mathlib.
- (an instance `Linear R (SingleObj A)` for an `R`-algebra `A`), with `r • a` the algebra action.
  It applies to `SingleObj Aᵐᵒᵖ` through Mathlib's `R`-algebra `Aᵐᵒᵖ` (`MulOpposite.instAlgebra`),
  and the derived `R`-structure of 0.1 at `∗` is the `R`-structure through `algebraMap R A`
  (`TauCeti.moduleCatEquivModCatToModuleCatIso`). Not in Mathlib.
- `SingleObj A` is `EssentiallySmall.{v}` when `A` is `Small.{v}` (an instance), and
  `Small.{v} Aᵐᵒᵖ` follows from `Small.{v} A` (`TauCeti.small_mulOpposite`, an instance). With it,
  Tau Ceti main's explicit `[Small.{v} Aᵐᵒᵖ]` binders become redundant (Downstream consumers).
- Transfer lemmas, stated as later layers need them: the equivalences preserve and reflect
  projectivity, exactness, finite generation and finite presentation; `Tor`, flatness and the
  dimensions transfer once they are defined (Layers 1–3).

**Checks.**

- For `A = k[x]`, a module over `SingleObj Aᵐᵒᵖ` is a vector space with an endomorphism.
- `SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ` is the identity on objects and `op a ↦ op a` on morphisms.
- For a noncommutative `A`, a contravariant functor on `SingleObj A` itself would satisfy
  `F(a b) = F(b) ∘ F(a)`, a right module; this is why the ring enters as `Aᵐᵒᵖ`.

*Needs:* 0.1; Mathlib `SingleObj`, `SingleObj.comp_as_mul`, `Action.functorCategoryEquivalence`,
`MulOpposite.instAlgebra`, `CategoryTheory.Mat.equivalenceSingleObj` (precedent).

### 0.3 The tensor product over `C`

For a covariant functor `G` (an object of `Mod Cᵒᵖ`) and a module `F` of `Mod C`, the tensor
product `G ⊗_C F` (`TauCeti.ModCat.tensorObj G F`) is the coend in `AddCommGrpCat` of
`G(c') ⊗_ℤ F(c)` (Convention 2). The covariant functor comes first, as the right module `M` in
`M ⊗_A N` (Convention 6). In `Suggested.lean` the bifunctor `(x, y) ↦ G(x) ⊗_ℤ F(y)`
(`TauCeti.tensorBifunctor`) is stated on `Dᵒᵖ × D` and used at `D = Cᵒᵖ`, so the coend runs over
`Cᵒᵖ`. Concretely `G ⊗_C F` is the quotient of `⊕_c G(c) ⊗ F(c)` by the elements
`x ⊗ F(f) y - G(f) x ⊗ y` for `f : c → c'` ([Mitchell, §6, pp. 26–27, and §11, p. 52]; [ML, IX.6,
pp. 226–227], where the quotient is written for rings, with left modules as covariant functors and
the contravariant functor first, Convention 14). Mathlib's `CategoryTheory.coend` is the
definition, not a hand-built quotient; it exists when `C` is `EssentiallySmall.{w}` (Mathlib passes
this to `Cᵒᵖ`). API:

- the pure tensor `x ⊗ y` at `c` (`TauCeti.ModCat.tmul`), balancing `x ⊗ F(f) y = G(f) x ⊗ y`
  (`TauCeti.ModCat.tmul_balance`), induction (`TauCeti.ModCat.tensorObj_induction_on`),
  extensionality (`TauCeti.ModCat.tensorObj_hom_ext`), and the lift of a balanced family of
  biadditive maps (`TauCeti.ModCat.tensorLift`, `tensorLift_tmul`);
- the bifunctor (`TauCeti.ModCat.tensor : ModCat Cᵒᵖ ⥤ ModCat C ⥤ AddCommGrpCat`), additive in
  each variable, with its values on pure tensors (`tensor_map_app_tmul`, `tensor_obj_map_tmul`);
- **the `R`-module structure**, for an `R`-linear `C` (an instance `Module R (G ⊗_C F)`;
  `TauCeti.ModCat.smul_eq_tensor_obj_map`, `TauCeti.ModCat.smul_eq_tensor_map_app`,
  `TauCeti.ModCat.smul_tmul`, `TauCeti.ModCat.tmul_smul`): `r` acts as `G ⊗_C (r • 𝟙 F)`, which is
  also `(r • 𝟙 G) ⊗_C F`, and `r • (x ⊗ y) = (r x) ⊗ y = x ⊗ (r y)` with the derived actions of 0.1,
  in the style of Mathlib's `Abelian.Ext.smul_eq_comp_mk₀` ([Mitchell, §11, p. 52]: over a
  `K`-category the tensor product over `K` has the same underlying group). The maps
  `G ⊗_C f` and `g ⊗_C F` are then `R`-linear;
- **adjunctions** (`TauCeti.ModCat.tensorAdjunction`, `TauCeti.ModCat.tensorAdjunction'`):
  `Hom(G ⊗_C F, X) ≅ Hom_{Mod C}(F, Hom_ℤ(G(-), X))`, and the mirror
  `Hom(G ⊗_C F, X) ≅ Hom_{Mod Cᵒᵖ}(G, Hom_ℤ(F(-), X))`, natural in all variables; the right
  adjoints come from the bifunctors `TauCeti.ModCat.homBifunctor` and
  `TauCeti.ModCat.homOpBifunctor`, with partial applications `homFunctor` and `homOpFunctor`
  ([Mitchell, §6, p. 26, (2)]; [St, Thm. 1, pp. 355–356], which extends a theorem of Watts; the
  tensor product of functors goes back to N. Yoneda, *On Ext and exact sequences*, J. Fac. Sci.
  Univ. Tokyo Sect. I 8 (1960), 507–576: §4.1, p. 548, the tensor product of a contravariant and a
  covariant functor, contravariant first, as the "integration" (coend) of §4.0, pp. 545–546, with
  the adjunctions (4.1.3)–(4.1.4) and the explicit quotient on pp. 548–549). Over `R`
  (`TauCeti.ModCat.tensorLinearHomEquiv`, `TauCeti.ModCat.tensorLinearHomEquiv'`):
  `Hom_R(G ⊗_C F, X) ≃ₗ[R] Hom(F, Hom_R(G(-), X))` and its mirror, for an `R`-module `X`, with the
  `R`-dependent bifunctors `TauCeti.ModCat.linearHomBifunctor` and
  `TauCeti.ModCat.linearHomOpBifunctor` (Mathlib's `linearYoneda` is the pattern; [OR, (1.1), p.
  93], over a commutative base ring);
- **right exactness**: each partial functor preserves colimits, from the adjunctions
  (`TauCeti.ModCat.preservesColimits_tensor_obj`,
  `TauCeti.ModCat.preservesColimits_tensor_flip_obj`); in particular it is right exact and
  preserves direct sums;
- **Yoneda** (`TauCeti.ModCat.tensorObjYonedaIso`, `TauCeti.ModCat.yonedaTensorObjIso`):
  `G ⊗_C Hom(-, X) ≅ G(X)` and `Hom(X, -) ⊗_C F ≅ F(X)` ([Mitchell, §6, p. 26, (1)]), `R`-linear for
  an `R`-linear `C`;
- **one-sided ideals** (`TauCeti.LeftMorphismIdeal C`, `TauCeti.RightMorphismIdeal C`, with
  partial orders, `le_def`, `TauCeti.LeftMorphismIdeal.orderIsoSubobject` and
  `TauCeti.RightMorphismIdeal.orderIsoSubobject`): a **left ideal** of `C` is a family of additive
  subgroups `I(X, Y) ⊆ (X ⟶ Y)` closed under precomposition, `h ≫ f ∈ I` for `f ∈ I`; equivalently,
  for every `Y` a subfunctor `I(-, Y)` of the representable `Hom(-, Y)` in `Mod C`. A **right
  ideal** is closed under postcomposition, `f ≫ h ∈ I`; equivalently, for every `X` a subfunctor
  `I(X, -)` of the covariant representable `Hom(X, -)`. A right ideal of `C` is a left ideal of
  `Cᵒᵖ` (`TauCeti.RightMorphismIdeal.op`). [Mitchell, §3, p. 18] defines a right (left) ideal of an
  additive category as a subfunctor of one representable `C^p` (`C_p`), and a two-sided ideal as a
  subfunctor of the bifunctor; [OR, pp. 93–96] calls the subfunctors of `X(z, -)` and `X(-, x)`
  ideals. These are the **ideals at one object** (`TauCeti.LeftMorphismIdeal.ofSubobject`,
  `TauCeti.RightMorphismIdeal.ofSubobject`, with `orderIsoSubobject_ofSubobject`): a subfunctor of
  `Hom(-, Y)` (of `Hom(X, -)`) is the left (right) ideal that is it at `Y` (at `X`) and `0`
  elsewhere, and a one-sided ideal is the family of its parts, so statements about one
  representable work with `Subobject` of that representable. The principal right ideal of
  `g : X → Y` is `g C = {g ≫ h}` (`TauCeti.RightMorphismIdeal.principal`), the ideal at `X` given by
  the image of `Hom(Y, -) → Hom(X, -)`. Tau Ceti's two-sided `TauCeti.MorphismIdeal` is both
  (`TauCeti.MorphismIdeal.toLeftMorphismIdeal` and `TauCeti.MorphismIdeal.toRightMorphismIdeal`,
  coercions); the field names `comp_mem_left` and `comp_mem_right` are Tau Ceti's. Neither notion
  is in Mathlib or Tau Ceti; Mathlib's `Sieve` has the closure of a left ideal but is not additive.
  M. and G. Weidenfeld's work on ideals of a preadditive category (see "Sources and locators") was
  not obtained. **Rings**
  (`TauCeti.idealOrderIsoLeftMorphismIdeal A : Ideal A ≃o LeftMorphismIdeal (SingleObj Aᵐᵒᵖ)`,
  `TauCeti.submoduleOrderIsoRightMorphismIdeal A :
  Submodule Aᵐᵒᵖ A ≃o RightMorphismIdeal (SingleObj Aᵐᵒᵖ)`), both by `J ↦ {f | unop f ∈ J}`. By
  Mathlib's `SingleObj.comp_as_mul`, `h ≫ f = f * h` in `Aᵐᵒᵖ`, that is, `op (unop h * unop f)`;
  so closure under precomposition is closure under left multiplication, and closure under
  postcomposition is closure under right multiplication. `Suggested.lean` proves the two closure
  fields this way. The principal right ideal of `op a` is `aA`.
- **superfluous elements** (`TauCeti.IsSuperfluous`, `IsSuperfluous.mono`, `IsSuperfluous.sup`,
  `IsSuperfluous.eq_bot_of_isCompl`, `TauCeti.isEssentialEpi_iff_isSuperfluous_kernelSubobject`), a
  downstream refactor of Tau Ceti main: main's `TauCeti.IsSuperfluous` is stated for
  `Submodule R M` ("`N ⊔ K = ⊤` implies `K = ⊤`"); it is generalized to any lattice with `⊤`, and
  the submodule results become the special case. Mathlib has no such predicate. For an epimorphism
  `p` of an abelian category, `p` is essential (Tau Ceti's `TauCeti.IsEssentialEpi`) exactly when
  `kernelSubobject p` is superfluous; finite suprema of superfluous elements are superfluous; a
  complemented superfluous element is `⊥`.
- **ideals and modules** (`TauCeti.LeftMorphismIdeal.smul`,
  `TauCeti.LeftMorphismIdeal.range_smul_arrow_app`, `TauCeti.LeftMorphismIdeal.smul_mono`,
  `TauCeti.LeftMorphismIdeal.quotientSmul`): for a left ideal `I` of `C` and a module `M` of
  `Mod C`, `I · M` is a subobject of `M`; at `c` it is the subgroup of `M(c)` generated by the
  `M(f)(x)` with `f ∈ I(c, d)` and `x ∈ M(d)`. It is a submodule since `M(h)(M(f)(x)) = M(h ≫ f)(x)`
  with `h ≫ f ∈ I`: only precomposition is used. For the left ideal of `SingleObj Aᵐᵒᵖ` given by a
  left ideal `J` of `A` it is `J • ⊤`. `M ⧸ I · M` is the cokernel of `I · M ⟶ M`.
- **restriction along `C ⥤ C ⧸ I`**, for a two-sided ideal `I`
  (`TauCeti.MorphismIdeal.restrictModCat : ModCat (C ⧸ I) ⥤ ModCat C`, fully faithful;
  `TauCeti.MorphismIdeal.restrictModCat_essImage_iff`; `TauCeti.MorphismIdeal.quotientSmulModCat`,
  `TauCeti.MorphismIdeal.restrictModCatQuotientSmulModCatIso`): a module over Tau Ceti's quotient
  category `C ⧸ I` is a `C`-module through `TauCeti.MorphismIdeal.quotientFunctor`, the essential
  image consists of the modules with `I · M = 0`, and `M ⧸ I · M` is a module over `C ⧸ I`. For
  `I = J(C)` this is the module over the semisimple `C ⧸ J(C)` of 4.4 and 4.5.
- **quotients and tensor products** (`TauCeti.MorphismIdeal.quotientYoneda`,
  `TauCeti.ModCat.tensorObjCokernelIso`, `TauCeti.ModCat.tensorObjQuotientYonedaIso`): for a
  subfunctor `S ⊆ Hom(X, -)`, a right ideal at `X`,
  `(Hom(X, -) ⧸ S) ⊗_C M ≅ M(X) ⧸ (S · M)(X)`, where `(S · M)(X)` is generated by the `M(f)(x)` with
  `f ∈ S`, by right exactness and Yoneda ([OR, Lemma 1.2, p. 94], stated for a covariant module and
  an ideal of `Hom(-, X)`, applied to `Cᵒᵖ`). The Lazard block (2.3) uses it for the right ideal
  generated by finitely many morphisms. For a two-sided ideal `I`, the module
  `(C ⧸ I)(-, X) = Hom_{C ⧸ I}(-, X)` of `Mod C` comes through the quotient functor, the covariant
  `(C ⧸ I)(X, -)` is the same construction over `Cᵒᵖ` for Tau Ceti's opposite ideal
  `TauCeti.MorphismIdeal.op I`, and `(C ⧸ I)(X, -) ⊗_C M ≅ (M ⧸ I · M)(X)`; 4.6 uses it. Layer 4
  uses `I · M` for Nakayama's lemma (4.1).

**Checks.**

- For `C = SingleObj Aᵐᵒᵖ`, 0.6 identifies `G ⊗_C F` with `M ⊗_A N`, in the same order.
- In the quiver example of 0.1, `Hom(1, -) ⊗_C F ≅ F(1)` by Yoneda.
- For a noncommutative `A` and `a ∈ A`, the left ideal `Aa` gives the left ideal of
  `SingleObj Aᵐᵒᵖ` with members the `op (b a)`; it is closed under precomposition
  (`op c ≫ op (b a) = op (c b a)`) and in general not under postcomposition.
- For the `ℤ`-module `ℚ` and the ideal `2ℤ`, `2ℤ · ℚ = ℚ`, so `2ℤ · ℚ` is not superfluous in `ℚ`;
  Nakayama's lemma for all modules fails for `2ℤ`, which is not T-nilpotent (4.1).

*Needs:* 0.1, 0.2; Mathlib `coend`, `HasCoend`, `TensorProduct`, `AddMonoidHom.toIntLinearMap`,
`Adjunction.leftAdjoint_preservesColimits`, `SingleObj.comp_as_mul`, `CategoryTheory.unopHom`,
`Subobject`, `kernelSubobject`, `linearYoneda` (pattern); Tau Ceti `TauCeti.MorphismIdeal`, its
quotient and `TauCeti.MorphismIdeal.op`, `TauCeti.IsEssentialEpi`, `TauCeti.IsSuperfluous`
(refactored).

### 0.4 Projective factors

(`TauCeti.ModCat.mono_tensor_map_app_of_projective`,
`TauCeti.ModCat.mono_tensor_obj_map_of_projective`.) If `F` is projective in `Mod C`, then
`- ⊗_C F` preserves monomorphisms; symmetrically for a projective covariant functor. Route: for a
representable `F = Hom(-, X)`, Yoneda (0.3) identifies `g ⊗_C F` with `g` at `X`; the tensor
product preserves direct sums (0.3), so the claim holds for coproducts of representables; a
projective is a retract of such a coproduct (0.1) ([Mitchell, Prop. 10.1 and Cor. 10.2, p. 47],
for contravariant `G`, as here). Layer 2 cites this as "projective modules are flat".

*Needs:* 0.1, 0.3.

### 0.5 The swap

(`TauCeti.ModCat.opOpEquiv`, `TauCeti.ModCat.tensorObjSwapIso`.) A covariant `G`, an object of
`Mod Cᵒᵖ`, is as it stands a module over `Cᵒᵖ`, and a module `F` of `Mod C` is a covariant functor
on `Cᵒᵖ`, an object of `Mod Cᵒᵖᵒᵖ` through the equivalence `ModCat.opOpEquiv : Mod C ≌ Mod Cᵒᵖᵒᵖ`
induced by Mathlib's `opOpEquivalence`. It is an equivalence, so it preserves and reflects
exactness, projectivity and the dimensions, and a supremum over `Mod Cᵒᵖᵒᵖ` is a supremum over
`Mod C` (3.3, 4.6). Then `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`, natural and `R`-linear for an `R`-linear `C`, by
`x ⊗ y ↦ y ⊗ x` on the coends ([Mitchell, §6, p. 26], where `G ⊗ F` is defined as `F ⊗ G`). It is
compatible with `tmul`, `tensorLift` and the adjunctions, so each statement in the covariant
variable follows from the one in the `Mod C` variable over `Cᵒᵖ`. Mathlib's
`Linear.oppositeCategory` makes `Cᵒᵖ` `R`-linear, and `EssentiallySmall` passes to `Cᵒᵖ`. The ring
swap of 0.6 follows from this, `TauCeti.singleObjMulOppositeEquiv` (0.2) and the comparison of 0.6.

*Needs:* 0.3; Mathlib `opOpEquivalence`, `Linear.oppositeCategory`.

### 0.6 Rings: the balanced tensor product

For an `R`-algebra `A`, the ring-level objects are native (Convention 5).

- **Maps** (`TauCeti.BalancedTensorProduct.rTensor R N f`, `TauCeti.BalancedTensorProduct.lTensor
  R M g`). For an `Aᵐᵒᵖ`-linear map `f : M → M'` of right modules, `f ⊗ N` is `R`-linear;
  symmetrically `M ⊗ g`. The names follow Mathlib's `LinearMap.rTensor` and `LinearMap.lTensor`.
  Both are `BalancedTensorProduct.map` with one identity. API: values on `m ⊗ n`
  (`rTensor_tmul`, `lTensor_tmul`), identities and composites (`rTensor_id`, `rTensor_comp`,
  `lTensor_id`, `lTensor_comp`) and the interchange `rTensor_comp_lTensor`.
- **Bifunctor** (`TauCeti.BalancedTensorProduct.functor R A :
  ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`), additive in each variable; the
  `R`-actions on bundled modules come from Tau Ceti's `ModuleCat.moduleOfAlgebra`. At the regular
  modules it is the restriction of scalars along `algebraMap R A` (`lid`, `rid`).
- **Adjunction** (`TauCeti.BalancedTensorProduct.adjunction R A N`): `- ⊗_A N` is left adjoint to
  `Hom_R(N, -)` (`TauCeti.BalancedTensorProduct.homRight`, sending `X` to Tau Ceti's
  `MatlisDual R X N` as a right module), and symmetrically. Right exactness and preservation of
  direct sums and colimits follow: `rTensor_exact`, `rTensor_surjective`, `lTensor_exact`,
  `lTensor_surjective` ([Lam-FC, (24.20), p. 365], stated there without proof).
- **Projective factors** (`TauCeti.BalancedTensorProduct.lTensor_injective_of_projective`,
  `TauCeti.BalancedTensorProduct.rTensor_injective_of_projective`): 0.4 through the comparison, or
  directly, for free modules through `finsuppScalarRight` and its mirror, then retracts.
- **Swap** (`TauCeti.BalancedTensorProduct.comm`): `M ⊗_A N ≃ₗ[R] N ⊗_{Aᵐᵒᵖ} M`,
  `m ⊗ n ↦ n ⊗ m`, with `N` a right `Aᵐᵒᵖ`-module through `RingEquiv.opOp A`; natural in both
  factors. It is the left-right symmetry principle: each pair of left and right statements is
  proved once and transferred.
- **Independence of `R` and change of base** (`TauCeti.BalancedTensorProduct.intAddEquiv`,
  `TauCeti.BalancedTensorProduct.changeBaseAddEquiv`): `M ⊗_A N` over `ℤ` and over `R` have the
  same underlying group, and for `R → R' → A` the `R`- and `R'`-balanced tensor products of
  `R'`-modules agree, `R`-linearly, by `m ⊗ n ↦ m ⊗ n`. Tau Ceti's ring-level tensor product is
  defined over `R`, so these are genuine ring statements.
- **Comparison** (`TauCeti.BalancedTensorProduct.tensorObjSingleObjIso`): for `[Small.{v} A]`,
  the tensor product over `SingleObj Aᵐᵒᵖ` (0.3) of the modules of 0.2 is `M ⊗_A N` over `ℤ`, in the
  same order and naturally, with `x ⊗ y` at `∗` going to `m ⊗ n`. For an `R`-algebra `A` it is
  `R`-linear for the `Module R` instance of 0.3, through `intAddEquiv` and the agreement of the
  derived `R`-structures (0.2).
- **Commutative rings** (`TauCeti.BalancedTensorProduct.equivTensorProduct`). For a commutative
  ring `R` and `R`-modules `M`, `N`, with `M` an `Rᵐᵒᵖ`-module by `op r • m = r • m`
  (`[IsCentralScalar R M]`), `M ⊗_R N ≃ₗ[R] M ⊗[R] N`, `m ⊗ n ↦ m ⊗ₜ n`
  (`equivTensorProduct_tmul`). Existing users of `BalancedTensorProduct` are unchanged.
- **Duals** (0.7 for rings; `TauCeti.BalancedTensorProduct.homEquiv`): for any `R`-module `E`,
  `Hom_R(M ⊗_A N, E) ≃ₗ[R] Hom_{Aᵐᵒᵖ}(M, MatlisDual R E N)`. For `R = ℤ` and `E = ℚ ⧸ ℤ`
  (`TauCeti.BalancedTensorProduct.rTensor_injective_iff_surjective_comp`): for a map
  `i : M → M'` of right modules, `i ⊗ N` is injective exactly when composition with `i`,
  `(M' →ₗ[Aᵐᵒᵖ] N⁺) → (M →ₗ[Aᵐᵒᵖ] N⁺)`, is surjective, since characters detect elements
  (`TauCeti.CharacterModule.eval_injective`) ([Lambek, Prop. 1, p. 241]).

**Checks.**

- For a right ideal `I : Submodule Aᵐᵒᵖ A`, right exactness applied to `0 → I → A → A ⧸ I → 0`
  and `lid` identify `(A ⧸ I) ⊗_A N` with `N` modulo the additive subgroup generated by the
  `a • n`, `a ∈ I`. Over `ℤ` this gives `ℤ ⧸ m ⊗_ℤ ℤ ⧸ n ≃+ ℤ ⧸ gcd(m, n)`.
- `ℤ ⧸ 2 ⊗_ℤ (2ℤ → ℤ)` is the zero map, while `ℤ ⧸ 2 ⊗_ℤ 2ℤ ≅ ℤ ⧸ 2`: tensoring is not left
  exact.
- `eA ⊗_A Af ≅ eAf` for idempotents `e`, `f` (Tau Ceti's corner identification).
- For `A = M = N = ℤ` and `E = ℚ ⧸ ℤ`, both sides of `homEquiv` are `ℚ ⧸ ℤ`.

*Needs:* 0.2–0.5; Tau Ceti `TauCeti.BalancedTensorProduct` with `map`, `lift`, `lid`, `rid` and
`finsuppScalarRight`, `ModuleCat.moduleOfAlgebra`, `TauCeti.MatlisDual`,
`TauCeti.CharacterModule.eval_injective`; Mathlib `TensorProduct`, `RingEquiv.opOp`.

### 0.7 Duals with respect to an `R`-module `E`

For an `R`-linear `C` and an `R`-module `E : ModuleCat.{w} R`, the dual of a module `F` of `Mod C`
is the covariant functor `F^E = Hom_R(F(-), E)` (`TauCeti.ModCat.dual R E : (ModCat C)ᵒᵖ ⥤ ModCat
Cᵒᵖ`), and the dual of a covariant `G` is the module `G^E = Hom_R(G(-), E)` of `Mod C`
(`TauCeti.ModCat.dualOp R E`): the `R`-dependent bifunctors of 0.3 evaluated at `E`, as Tau Ceti's
`MatlisDual R E` for rings. The adjunction of 0.3 over `R` at `X = E` is
`Hom_R(G ⊗_C F, E) ≃ Hom_{Mod Cᵒᵖ}(G, F^E)`. The hypotheses on `E` sit on the theorems:

- `E` injective: the dual is exact (`TauCeti.ModCat.dual_shortExact`);
- `E` a cogenerator (Mathlib's `IsCoseparator`): the dual detects zero objects
  (`TauCeti.ModCat.isZero_of_isZero_dual`);
- `E` an injective cogenerator: `i ⊗_C F` is a monomorphism exactly when every map `G → F^E`
  extends along `i`, that is, composition with `i`, `Hom(G', F^E) → Hom(G, F^E)`, is onto
  (`TauCeti.ModCat.mono_tensor_map_app_iff`). Through the adjunction the right side says that
  `Hom_R(i ⊗_C F, E)` is onto: injectivity of `E` gives the forward implication and the cogenerator
  property the converse. A cogenerator alone does not suffice: over `ℤ`, take `E = ℚ ⧸ ℤ ⊕ ℤ`,
  `F = ℤ` and `i` multiplication by `2` on `ℤ`; then `i ⊗ ℤ` is injective, while composition with
  `i` on `Hom(ℤ, E) ≅ E` is multiplication by `2`, which misses `(0, 1)`. An implementation can
  prove the two implications separately, with their own hypotheses;
- Lambek's flatness criterion (Layer 2) uses both.

Special cases: `R = ℤ` and `E = ℚ ⧸ ℤ`, Mathlib's `CharacterModule` (for `Mod C` this gives a
cogenerating family of injectives, [Mitchell, §6, p. 27]); Matlis duals `MatlisDual R E` for
Auslander-Reiten theory. Lambek's criterion with a general injective cogenerator `E` is 2.2 (7); it
follows from the adjunction, already over a commutative base ring in [OR, (1.1), p. 93] ([Lambek,
Prop. 1, p. 241]; [CE, VI, Prop. 5.1, p. 120]).

*Needs:* 0.3; Mathlib `IsCoseparator`, `ShortComplex.ShortExact`; Tau Ceti `TauCeti.MatlisDual`.

### 0.8 Finitely generated projective modules, duality and finite presentation

`proj C` (`TauCeti.ModCat.proj C`) is the full subcategory of finitely generated (0.1) projective
modules of `Mod C`, so that `C ⊆ proj C` covariantly by Yoneda; the finitely generated projective
covariant functors are `proj Cᵒᵖ`. For `C = SingleObj Aᵐᵒᵖ`, `proj C` is Tau Ceti's
`TauCeti.finiteProjectiveModules A`, the finitely generated projective left modules.

- **Closure** (instances): `proj C` has finite biproducts and split idempotents.
- **Retracts** (`TauCeti.ModCat.proj_iff_exists_retract`): a module is in `proj C` exactly when it
  is a retract of a finite sum of representables.
- **Yoneda** (`TauCeti.ModCat.projYoneda : C ⥤ proj C`, `X ↦ Hom(-, X)`): fully faithful, so
  `End Hom(-, X) = End X`. Over `Cᵒᵖ` it gives `X ↦ Hom(X, -)` in `proj Cᵒᵖ`.
- **Karoubi** (`TauCeti.ModCat.projEquivKaroubiMat : proj C ≌ Karoubi (Mat_ C)`), a target: every
  object of `proj C` is a summand of a finite sum of representables, and Yoneda is fully faithful
  on finite sums. Tau Ceti's `TauCeti.projectivizationFunctor` (`add M` against the finitely
  generated projective `End M`-modules) is the one-object pattern; Tau Ceti's
  `TauCeti.MorphismIdeal.mat` and `TauCeti.MorphismIdeal.karoubi` move ideals such as `J(C)` along
  `C → Mat_ C → Karoubi (Mat_ C)`, with no new ideals.
- **Additive idempotent-complete `C`** (an instance `(ModCat.projYoneda C).IsEquivalence` for
  `[HasFiniteBiproducts C] [IsIdempotentComplete C]`): `C ≃ proj C`; compare Tau Ceti main's
  `TauCeti.modYoneda` and `TauCeti.projective_iff_mem_essImage_modYoneda`.
- **Duality** (`TauCeti.ModCat.projDual : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`,
  `TauCeti.ModCat.projDualYonedaIso`): `(-)^∨ = Hom(-, C)`, with `Hom(-, X) ↦ Hom(X, -)`. It is
  built from the two Karoubi equivalences and `(Mat_ C)ᵒᵖ ≌ Mat_ Cᵒᵖ` (transposed matrices); Mathlib
  has no such duality for `Karoubi` or `Mat_`. The property that pins it down
  (`TauCeti.ModCat.homAddEquivTensorObjProjDual`): `Hom(P, F) ≅ P^∨ ⊗_C F`, natural in `P ∈ proj C`
  and in `F`, which at `P = Hom(-, X)` is Yoneda on both sides (0.3). The transpose of 1.4 is
  defined through `projDual`, and its route uses this isomorphism.
- **Finite presentation: the bridge** (`TauCeti.ModCat.isFinitelyPresentedFunctor_tfae`). For `F`
  in `Mod C`, with `C` essentially `v`-small and values in the universe `v`, the following are
  equivalent: (1) `F` is the cokernel of a map in `proj C`; (2) `F` is finitely presented in the
  sense of 0.1, the cokernel of a map between finite sums of representables; (3) `F` is finitely
  presentable in Mathlib's sense, `IsFinitelyPresentable` (`Hom(F, -)` commutes with filtered
  colimits). For rings, (4) `Module.FinitePresentation`
  (`TauCeti.isFinitelyPresentedFunctor_iff_finitePresentation`, through 0.2, and Mathlib's form
  `TauCeti.ModuleCat.isFinitelyPresentable_iff_finitePresentation` in `ModuleCat A`). For additive
  `C`, (2) is main's single-representable form (0.1). Route: (1) ⇔ (2) by the retracts above (add
  the complementary summands to both terms); (2) ⇒ (3) since representables are finitely
  presentable (Yoneda: `Hom(Hom(-, X), colim D) ≅ (colim D)(X)`, colimits computed objectwise) and
  finitely presentable objects are closed under finite colimits; (3) ⇒ (2) by writing `F` as a
  filtered colimit of cokernels of maps between finite sums and splitting the identity through one
  of them, which gives (1). Tau Ceti main's `TauCeti.finitePresentationEquivalenceMod` is the case
  `C = proj R` of these comparisons.
- **Finite generation** (`TauCeti.ModCat.isFinitelyGeneratedFunctor_iff_exists_epi_proj`): a
  quotient of a finite sum of representables is a quotient of an object of `proj C`, and
  conversely; for rings this is `Module.Finite` (`TauCeti.isFinitelyGeneratedFunctor_iff_finite`).
- **Local finite presentability** (an instance `IsLocallyFinitelyPresentable.{v} (ModCat.{v} C)`
  for `EssentiallySmall.{v} C`): the representables are finitely presentable and generate under
  filtered colimits.
- **Countable presentations** (`TauCeti.ModCat.isCardinalPresentable_aleph_one_iff`): `F` is
  `ℵ₁`-presentable (Mathlib's `IsCardinalPresentable` at `ℵ₁`) exactly when it is the cokernel of a
  map between countable sums of representables. Bass's modules (2.5) are of this form; Theorem P
  (3′) and Jensen's theorem (3.5) use it.
- **Rings** (`TauCeti.finiteProjectiveModulesEquivProj A`, `TauCeti.finiteProjectiveModulesDual A`):
  `TauCeti.finiteProjectiveModules A ≌ proj (SingleObj Aᵐᵒᵖ)`, the restriction of the equivalence
  of 0.2, and `Hom_A(-, A)` from `TauCeti.finiteProjectiveModules A` to
  `TauCeti.finiteProjectiveModules Aᵐᵒᵖ`, an equivalence
  `(finiteProjectiveModules A)ᵒᵖ ≌ finiteProjectiveModules Aᵐᵒᵖ`, the ring case of `projDual`; with
  the instance `HasFiniteBiproducts (finiteProjectiveModules A).FullSubcategory` (4.2). Mathlib's
  `Module.Dual A P` is defined over any semiring, but its API is commutative; Tau Ceti's
  `TauCeti.AuslanderReitenTranspose` already uses it as a right module.

**Checks.** For `C = SingleObj Aᵐᵒᵖ`, `proj C` is the category of finitely generated projective left
`A`-modules, and `projDual` is `Hom_A(-, A)`. For the quiver category of 0.1, every finitely
generated projective module is a finite sum of the two representables: each representable has
endomorphism ring `k`, which is local, so `proj C` is Krull–Schmidt (4.2), and a summand of a finite
sum of representables is a sub-sum by the uniqueness of decompositions into objects with local
endomorphism rings (Tau Ceti's `TauCeti.exists_equiv_iso_of_biproduct_iso_of_isLocalRing`, in
`TauCeti/CategoryTheory/Preadditive/KrullSchmidt/Uniqueness.lean`). Over `ℤ`, `ℤ²` satisfies all
four items of the bridge.

*Needs:* 0.1–0.3, 0.5; Mathlib `Mat_`, `CategoryTheory.Idempotents.Karoubi`,
`IsIdempotentComplete`, `ObjectProperty.lift`, `Retract`, `IsFinitelyPresentable`,
`IsLocallyFinitelyPresentable`, `IsCardinalPresentable`, `Module.FinitePresentation`; Tau Ceti
`TauCeti.finiteProjectiveModules`, `TauCeti.projectivizationFunctor` (pattern),
`TauCeti.exists_equiv_iso_of_biproduct_iso_of_isLocalRing` (check).

### Examples

Rings (0.2, 0.6); `k`-linear categories of quivers, whose modules are the representations of the
opposite quiver; Tau Ceti's `mod C` inside `Mod C`; `ℤ²` over `ℤ`, finitely presented by sums and
not by one representable. The commutative comparison of 0.6 makes every Mathlib tensor computation
an example of `M ⊗_A N`. Finitely generated projective modules over a ring or a quiver category
(0.8).

### Dependencies

Mathlib and Tau Ceti only.

## Layer 1: `Tor`

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{w} C`, modules
take values in `AddCommGrpCat.{w}`, and `Tor` takes values in `AddCommGrpCat.{w}`, with `Module R`
instances when `C` is `R`-linear. There is one `Tor`, `Tor^C_n(G, F)` with the covariant functor `G`
first, derived in the `Mod C` variable `F` (Convention 6). The version that resolves `G` is `Tor`
over `Cᵒᵖ`, read through the swap of 0.5. Items 1.1–1.6 end with their ring statements.

### 1.1 Definition

(`TauCeti.ModCat.tor n : ModCat Cᵒᵖ ⥤ ModCat C ⥤ AddCommGrpCat`.) The object at `G` is
`(ModCat.tensor.obj G).leftDerived n`, Mathlib's classical `Functor.leftDerived` of
`F ↦ G ⊗_C F`, and maps act by `NatTrans.leftDerived`. This is the shape of Mathlib's
`CategoryTheory.Tor`. It needs projective resolutions in `Mod C`: enough projectives (0.1) and
Mathlib's instance `HasProjectiveResolutions` for abelian categories with enough projectives. API:

- degree zero (`TauCeti.ModCat.torZeroIso : tor 0 ≅ tensor`): `Functor.leftDerivedZeroIsoSelf`,
  since `G ⊗_C -` preserves colimits (0.3);
- vanishing (`TauCeti.ModCat.isZero_tor_succ_of_projective`): `Tor_{n+1}(G, F) = 0` for a
  projective `F` (`Functor.isZero_leftDerived_obj_projective_succ`);
- computation from any projective resolution `P` of `F` (`TauCeti.ModCat.torObjIsoHomology`):
  `Tor_n(G, F) ≅ H_n(G ⊗_C P)`, Mathlib's `ProjectiveResolution.isoLeftDerivedObj`;
- additivity in each variable; in `G` through `NatTrans.leftDerived` and Tau Ceti's
  `NatTrans.leftDerived_add`;
- **the `R`-module structure**, for an `R`-linear `C` (an instance `Module R (Tor_n(G, F))`;
  `TauCeti.ModCat.smul_eq_tor_obj_map`, `TauCeti.ModCat.smul_eq_tor_map_app`): `r` acts as
  `Tor_n(G, r • 𝟙 F)`, which is also `Tor_n(r • 𝟙 G, F)` (by the balance of 1.3, or by computing
  with a resolution), as Mathlib's `Abelian.Ext.smul_eq_comp_mk₀`. So `Tor` over `C` does not
  depend on a base ring, and no comparison of base rings is needed.

**Rings** (`TauCeti.BalancedTor R A n : ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`),
for an `R`-algebra `A` with `[Small.{v} A]`. Native, as Convention 5 asks: the object at `M` is
`((BalancedTensorProduct.functor R A).obj M).leftDerived n`, the left derived functor of the ring
bifunctor of 0.6 in the left-module variable. API as above (`TauCeti.balancedTorZeroIso`,
`TauCeti.isZero_balancedTor_succ_of_projective`), and the comparison
(`TauCeti.balancedTorIsoTorSingleObj`) of `BalancedTor ℤ A n` with `Tor` over `SingleObj Aᵐᵒᵖ`
through the equivalences of 0.2, in the same order, from 0.6's comparison of tensor products: the
equivalences preserve projective resolutions. For an `R`-algebra it is `R`-linear, with
`TauCeti.balancedTorIntIso` (1.6).

**Future refactor.** Mathlib's `Functor.leftDerived` is the classical construction through the
homotopy category. Mathlib's TODO in `Mathlib/CategoryTheory/Abelian/LeftDerived.lean` is to
redefine it through derived categories and projective derivability structures, in the framework of
`Functor.HasLeftDerivedFunctor`, `Functor.totalLeftDerived` and
`LocalizerMorphism.IsLeftDerivabilityStructure`. When that lands, `tor` follows it; nothing here
depends on the construction beyond the API above.

*Needs:* 0.1, 0.2, 0.3, 0.6; Mathlib `Functor.leftDerived`, `NatTrans.leftDerived`,
`Functor.leftDerivedZeroIsoSelf`, `Functor.isZero_leftDerived_obj_projective_succ`,
`ProjectiveResolution.isoLeftDerivedObj`, `HasProjectiveResolutions`; Tau Ceti
`NatTrans.leftDerived_add`.

### 1.2 Long exact sequences in the underived variable

For a short exact sequence `0 → G₁ → G₂ → G₃ → 0` of covariant functors and a projective resolution
`Q` of a module `F` of `Mod C`, the complexes `Gᵢ ⊗_C Q` form a short exact sequence of complexes:
termwise, right exactness (0.3) and the projective factors of 0.4 (`Q_q` projective, so
`- ⊗_C Q_q` preserves monomorphisms). Mathlib's homology sequence of a short exact sequence of
complexes (`ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂`, `homology_exact₃`, with the
connecting map `ShortComplex.ShortExact.δ`) and 1.1's computation from `Q` then give
`δ : Tor_{n+1}(G₃, F) → Tor_n(G₁, F)` (`ShortComplex.ShortExact.torδ`) and exactness at the three
places (`TauCeti.ModCat.tor_exact₁`, `tor_exact₂`, `tor_exact₃`), natural in `F` and in the
sequence.

This is the only long exact sequence proved directly. The one in the derived variable comes from
the balance (1.3). So neither a horseshoe lemma nor a general long exact sequence for
`Functor.leftDerived` is needed; Mathlib has neither.

**Rings** (`ShortComplex.ShortExact.balancedTorδ`, `TauCeti.balancedTor_exact₁`,
`balancedTor_exact₂`, `balancedTor_exact₃`): the same for a short exact sequence of right
`A`-modules, by the same proof with 0.6's projective factors, or through 1.1's comparison.

*Needs:* 0.3, 0.4, 1.1; Mathlib `ShortComplex.ShortExact.δ`, `homology_exact₁`–`homology_exact₃`.

### 1.3 Balance

(`TauCeti.ModCat.torBalanceIso : tor n ≅ ((ModCat.opOpEquiv C).functor ⋙ tor n).flip`.)
`Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)`, natural in both variables and `R`-linear for an `R`-linear `C`,
where `F` is a covariant functor on `Cᵒᵖ` and `G` a module over `Cᵒᵖ`, as in 0.5. Route ([Weibel,
Thm. 2.7.2, pp. 58–59]): for projective resolutions `P` of `G` and `Q` of `F`, form the
first-quadrant bicomplex `P_p ⊗_C Q_q`. Its augmented rows `P_p ⊗ Q → P_p ⊗ F` and columns
`P ⊗ Q_q → G ⊗ Q_q` are exact, since tensoring with a projective is exact on both sides (0.3, 0.4).
Tau Ceti's `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`, applied to the bicomplex and to
its flip (with Tau Ceti's `HomologicalComplex₂.totalComplexShapeSymmetryDownNat`), identifies both
`H_n(G ⊗_C Q)` and `H_n(P ⊗_C F)` with the homology of the total complex; this is Weibel's acyclic
assembly argument ([Weibel, 2.7.3, p. 59]). The swap of 0.5 turns `P ⊗_C F` into `F ⊗_{Cᵒᵖ} P`,
whose homology is `Tor^{Cᵒᵖ}_n(F, G)` by 1.1 over `Cᵒᵖ`.

Consequences:

- higher `Tor` vanishes at a projective covariant functor
  (`TauCeti.ModCat.isZero_tor_succ_of_projective_left`);
- the long exact sequence in the derived variable (`ShortComplex.ShortExact.torδ'`,
  `TauCeti.ModCat.tor_exact₁'`, `tor_exact₂'`, `tor_exact₃'`): 1.2 over `Cᵒᵖ`, transported by the
  balance.

**Rings.** The swap (`TauCeti.balancedTorSwapIso`): `Tor_n^A(M, N) ≅ Tor_n^{Aᵐᵒᵖ}(N, M)`,
naturally, with `N` a right `Aᵐᵒᵖ`-module through
`ModuleCat.restrictScalars (RingEquiv.opOp A).symm`; from the balance at `SingleObj Aᵐᵒᵖ`, 1.1's
comparison and `TauCeti.singleObjMulOppositeEquiv Aᵐᵒᵖ` (0.2), which identifies the category
`SingleObj Aᵐᵒᵖᵐᵒᵖ` of the ring `Aᵐᵒᵖ` with `(SingleObj Aᵐᵒᵖ)ᵒᵖ`. Vanishing at a projective right
module (`TauCeti.isZero_balancedTor_succ_of_projective_left`) and the long exact sequence in the
left-module variable (`ShortComplex.ShortExact.balancedTorδ'`, `TauCeti.balancedTor_exact₁'`,
`balancedTor_exact₂'`, `balancedTor_exact₃'`) follow.

*Needs:* 0.3–0.5, 1.1, 1.2; Mathlib `HomologicalComplex₂`, `HomologicalComplex₂.total`; Tau Ceti
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`,
`HomologicalComplex₂.totalComplexShapeSymmetryDownNat`.

### 1.4 `Tor` of the transpose

For a finitely presented module `X` with transpose `Tr X` and any module `N`,

    stable Hom(X, N) ≅ Tor_1(Tr X, N),

where the stable `Hom` is `Hom` modulo the maps that factor through a projective ([Auslander78, I,
Prop. 3.2]; for two-sided Noetherian rings [AB, (2.8) (b), p. 54], the case `k = 0` of a four-term
exact sequence ending in `Hom(M, -) → Tor_1(D M, -) → 0`, with the transpose `D M` of [AB, (2.5),
p. 51]). Route: Krause's snake-lemma step ([Krause-Defect, pp. 268–269]), without
dualizing. Take `0 → ΩN → P → N → 0` with `P` projective, and a presentation `P₁ → P₀ → X → 0` by
finite projectives. Put `H(M) = coker(Hom(P₀, M) → Hom(P₁, M))`. The snake lemma identifies `δ^*(X)
= coker(Hom(X, P) → Hom(X, N))` with `ker(H(ΩN) → H(P))`. Here `δ^*(X)` is the stable `Hom(X, N)`,
since a map from `X` that factors through a projective factors through `P → N`; and `H(M) ≅ Tr X ⊗
M` naturally in `M` (by `Hom(P, M) ≅ P^∨ ⊗_C M`, 0.8). So the kernel is `ker(Tr X ⊗ ΩN → Tr X ⊗ P)`,
which is `Tor_1(Tr X, N)` by the long exact sequence of 1.3 and `Tor_1(Tr X, P) = 0` (1.1).

- **Category** (`TauCeti.ModCat.transpose`, `TauCeti.ModCat.stableHomEquivTorTranspose`), a target.
  A finitely presented module of `Mod C` is the cokernel `X` of a map `f : P₁ → P₀` in `proj C`
  (0.8); its Auslander–Bridger transpose is `Tr X = coker(P₀^∨ → P₁^∨)`, a covariant functor, with
  the duality `(-)^∨ = Hom(-, C)` of 0.8. Then `stable Hom(X, N) ≃ Tor_1(Tr X, N)` for every
  module `N` of `Mod C`, in the order of the ring form, with Tau Ceti's projective stable category
  (`TauCeti.ExactStructure.projectiveStableFunctor` of `TauCeti.ExactStructure.abelian`). Here the
  needed long exact sequence is the one of 1.3, in the derived variable. **Matrix description**, a
  lemma (`TauCeti.ModCat.matrixMap`, `TauCeti.ModCat.projSigma`, `TauCeti.ModCat.matrixTranspose`,
  `TauCeti.ModCat.transposeMatrixIso`): for `f` the map `⊕_j Hom(-, Y_j) → ⊕_i Hom(-, Z_i)` of a
  matrix `α_ji : Y_j → Z_i`, `Tr X` is the cokernel of the transposed matrix
  `⊕_i Hom(Z_i, -) → ⊕_j Hom(Y_j, -)`, since the dual of `Hom(-, Y)` is `Hom(Y, -)`.
- **A `Tor` criterion for projectivity** (`TauCeti.ModCat.projective_of_isZero_tor_transpose`): if
  `X = coker f` is finitely presented and `Tor_1(Tr X, X) = 0`, then the stable `End(X)` is `0`, so
  `𝟙 X` factors through a projective and `X` is projective. With 2.2 this is the short route to
  "a finitely presented flat module is projective": it does not go through Lazard's
  characterization of flatness, and it seems to be less known than Lazard's argument by a
  factorization of the identity ([Lazard, Cor. 1.4, p. 85]; [Mitchell, p. 49], a remark citing
  Lazard), which 2.3 keeps as a remark.
- **Rings** (`TauCeti.stableHomEquivBalancedTorTranspose`): for a presentation `f : P₁ → P₀`,
  `P₀ → X → 0` by finite projective left modules, `stable Hom_A(X, N) ≃ₗ[R] Tor_1^A(Tr X, N)`, with
  Tau Ceti's `TauCeti.AuslanderReitenTranspose f` (`Hom_A(P₁, A)` modulo the image of
  `Hom_A(P₀, A)`, the ring case of the definition above at `SingleObj Aᵐᵒᵖ`). Route: the snake-lemma
  step of the defect formula, a target of ArtinAlgebras §4.2 (From other roadmaps), and Tau Ceti's
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel` (`H(M) ≅ Tr X ⊗ M`, natural by
  `auslanderReitenTransposeTensorEquivCokernel_map`). The stable `Hom` matches Tau Ceti's
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom`.

Auslander's defect formula `D δ^*(X) ≅ δ_*(D Tr X)` itself stays with
[ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §4.2; it is not a target here.
Layer 2 uses this item for "finitely presented flat modules are projective" (2.2).

*Needs:* 0.8, 1.1–1.3; Tau Ceti `TauCeti.AuslanderReitenTranspose`,
`LinearMap.auslanderReitenTransposeTensorEquivCokernel`,
`TauCeti.ExactStructure.projectiveStableFunctor`, `TauCeti.ExactStructure.abelian`,
`ModuleCat.tensorHomCokernelEquivProjectiveStableHom`; ArtinAlgebras §4.2 (the snake-lemma step,
for the ring form).

### 1.5 `Tor`–`Ext` duality

(`TauCeti.ModCat.torExtDualityEquiv`.) For an `R`-linear `C` and an injective `R`-module `E`,

    Hom_R(Tor_n^C(G, F), E) ≃ₗ[R] Ext^n(G, F^E),

natural in `G` and `F`, where `Tor` carries the `R`-structure of 1.1, `F^E` is the dual of 0.7, a
covariant functor, and `Ext` is Mathlib's derived-category `Abelian.Ext` in `Mod Cᵒᵖ` (the `Ext`
that Tau Ceti uses throughout), an `R`-module for an `R`-linear abelian category
(`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`). Route: compute `Tor` from a
projective resolution `P` of `G` (by the balance); then `Hom_R(H_n(P ⊗_C F), E) ≅
H^n(Hom_R(P ⊗_C F, E))`, since `Hom_R(-, E)` is exact; the adjunction over `R` of 0.3 termwise
gives `Hom_R(P ⊗_C F, E) ≅ Hom(P, F^E)`; and Mathlib's
`ProjectiveResolution.extEquivCohomologyClass`
(`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`) identifies `Ext^n(G, F^E)` with the
degree-`n` cohomology classes from `P`. No classical `Ext` and no comparison of `Ext`s is needed
([CE, VI, Prop. 5.1, p. 120]; [Lambek, p. 241] for `R = ℤ`, `E = ℚ ⧸ ℤ`). This item includes the
instance `HasExt.{w} (Mod C)` (Mathlib's `hasExt_of_enoughProjectives`, as for `ModuleCat`; also
`IsGrothendieckAbelian.hasExt`, 0.1), which applies to `Mod Cᵒᵖ` as well.

**Rings** (`TauCeti.balancedTorExtDualityEquiv`):
`Hom_R(Tor_n^A(M, N), E) ≃ₗ[R] Ext^n_{Aᵐᵒᵖ}(M, Hom_R(N, E))`, with `Hom_R(N, E)` Tau Ceti's
`MatlisDual R E N` (0.6) and the `R`-linear structure of `ModuleCat Aᵐᵒᵖ` from Mathlib's scoped
`ModuleCat.Algebra.instLinear`.

Consumers: Lambek's criterion in Layer 2 (`n = 1`, `E` an injective cogenerator), the
character-module formula for flat dimension in Layer 3, and Auslander-Reiten formulas with Matlis
duals (`E` an injective hull of the residue field of a commutative base, as in ArtinAlgebras).

*Needs:* 0.7, 1.1, 1.3; Mathlib `Abelian.Ext`, `HasExt`, `hasExt_of_enoughProjectives`,
`ProjectiveResolution.extEquivCohomologyClass`, the `Module R (Ext X Y n)` instance; Tau Ceti
`TauCeti.MatlisDual`.

### 1.6 Comparisons and first computations

- **Commutative rings** (`TauCeti.balancedTorIsoTor`). For `[CommRing R]`, `BalancedTor R R n` is
  naturally isomorphic to Mathlib's `CategoryTheory.Tor (ModuleCat R) n`, after restricting
  `ModuleCat R` to `ModuleCat Rᵐᵒᵖ` along `(RingEquiv.toOpposite R).symm`, by 0.6's
  `equivTensorProduct`. With the balance this gives (`TauCeti.torIsoTor'`)
  `CategoryTheory.Tor (ModuleCat R) n ≅ CategoryTheory.Tor' (ModuleCat R) n`, the comparison that
  Mathlib's `Mathlib/CategoryTheory/Monoidal/Tor.lean` leaves open.
  Tau Ceti's results on Mathlib's `Tor` and `Tor'` over commutative rings
  (`TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor`, `TauCeti.CategoryTheory.Monoidal.Tor`) then
  apply to `BalancedTor R R`.
- **Change of base and independence of `R` for rings** (`TauCeti.balancedTorRestrictScalarsIso`,
  `TauCeti.balancedTorIntIso`): restricting ring `Tor` over `R'` to `R` gives `Tor` over `R`, for
  `R → R' → A`; the case `ℤ → R` says the underlying groups do not depend on `R`. Route: 1.1's
  computation from one resolution, and 0.6 termwise. Over a category no such statement is needed:
  `Tor` over `C` is defined with values in abelian groups (1.1).
- **Cyclic modules** (`TauCeti.balancedTorOneQuotientEquiv`). For a right ideal
  `I : Submodule Aᵐᵒᵖ A` and a left ideal `K : Ideal A`, with `R = ℤ`,
  `Tor_1^A(A ⧸ I, A ⧸ K) ≃+ (I ∩ K) ⧸ IK`, where `IK` is the additive subgroup generated by the
  products ([Weibel, Exer. 3.1.3, p. 68]; for a two-sided ideal, `Tor_1^A(A ⧸ I, A ⧸ I) ≅ I ⧸ I²`).
  Route: 1.2 for `0 → I → A → A ⧸ I → 0`, the vanishing of `Tor_1(A, -)`, and the first check of
  0.6, which identifies `I ⊗_A (A ⧸ K) → A ⊗_A (A ⧸ K)` with `I ⧸ IK → A ⧸ K`; Tau Ceti's
  `ShortComplex.ShortExact.leftDerivedOneIsoKernel` (`TauCeti.CategoryTheory.Abelian.LeftDerived`)
  is the pattern for `Tor_1` as a kernel.

*Needs:* 0.3, 0.6, 1.1–1.3; Mathlib `CategoryTheory.Tor`, `CategoryTheory.Tor'`,
`ModuleCat.restrictScalars`.

### 1.7 Categories with finitely many objects

For a preadditive `C` with finitely many objects (`[Fintype C] [DecidableEq C]`), the **category
algebra** (`TauCeti.CategoryAlgebra C`) is `⊕_{x,y} Hom(x, y)`, the finitely supported families
`a (x, y) : x ⟶ y` (Mathlib's `DFinsupp`), with `(a * b)(x, z) = ∑_y a (x, y) ≫ b (y, z)` and the
identities on the diagonal as unit ([Mitchell, §7, p. 33], where it is `[C]`). For any preadditive
`C` the same carrier is a ring without unit with enough idempotents (a `NonUnitalRing` instance;
[Harada, Remark 1, pp. 339–340]); finitely many objects give the unit `∑_x 𝟙 x`. The product is
composition in diagrammatic order, so `CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≅ A`, since
`f ≫ g = op (unop f * unop g)` there. For an `R`-linear `C` it is an `R`-algebra.

- **Morita equivalence** (`TauCeti.modCatEquivCategoryAlgebra :
  ModCat C ≌ ModuleCat (CategoryAlgebra C)` and `TauCeti.modCatOpEquivCategoryAlgebra :
  ModCat Cᵒᵖ ≌ ModuleCat (CategoryAlgebra C)ᵐᵒᵖ`), `R`-linear: `F ↦ ⊕_x F(x)`, with `a` acting by
  the `F(a (x, y)) : F(y) → F(x)` ([Mitchell, Thm. 7.1, pp. 33–36], stated for covariant functors
  and right `[C]`-modules, with the contravariant case in the remark on p. 37; an equivalence for
  finitely many objects). The construction is the one of
  Tau Ceti's `TauCeti.quiverRepEquivalence : QuiverRep k Q ≌ ModuleCat (pathAlgebra k Q)` (carrier
  `⊕ᵥ Mᵥ`). Mathlib's `IsMoritaEquivalent` compares two rings; through these equivalences, two
  finite-object categories with `R`-linearly equivalent module categories have Morita equivalent
  category algebras. For a full subcategory `C' ⊆ C` on some of the objects, the category algebra
  of `C'` is the corner `e Λ e` of `Λ = CategoryAlgebra C` at `e = ∑_{x ∈ C'} 𝟙 x`, so Tau Ceti's
  `IsIdempotentElem.isMoritaEquivalent_corner` applies when `e` is full.
- **Tensor and `Tor`** (`TauCeti.tensorObjCategoryAlgebraIso`,
  `TauCeti.torCategoryAlgebraIso`): the equivalences carry `G ⊗_C F` to the balanced tensor product
  over the category algebra (over `ℤ`, `R`-linearly for an `R`-linear `C`) and `Tor^C_n` to
  `BalancedTor ℤ (CategoryAlgebra C) n` ([Mitchell, §7, p. 37, (1)]). Route: by the adjunctions
  (0.3, 0.6) both tensor products represent the same functor; the equivalences preserve projective
  resolutions.

This generalizes the one-object comparisons of 0.2, 0.6 and 1.1. It sits in Layer 1 because its
point is the comparison of `Tor`; its tensor part uses only Layer 0.

**Check.** For the `k`-linear category `C` of the quiver `1 → 2` (0.1), the category algebra is
the upper triangular algebra `T₂(k)` directly: `Hom(1, 2) = k` sits at entry `(1, 2)`, and the
product `(a * b) x z = ∑_y a x y ≫ b y z` is the matrix product ([Mitchell, §7, Example 1, p. 33]
for posets). So `Mod C` is the category of left `T₂(k)`-modules, `Tor^C` is `Tor^{T₂(k)}`, and the
checks below for `T₂(k)` can be computed with the representables of `C`. Tau Ceti's
`TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv` identifies `T₂(k)` with the path algebra of the
`A₂` quiver, with a path at (target, source); in the labels here that is the opposite quiver
`2 → 1`, whose left path-algebra modules are its representations `V₂ → V₁`, the modules of 0.1. In
general the category algebra of a quiver category is the path algebra of the opposite quiver, in
Tau Ceti's convention.

*Needs:* 0.1–0.3, 0.6, 1.1; Mathlib `Fintype`; Tau Ceti `TauCeti.quiverRepEquivalence` (pattern),
`TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`, `IsIdempotentElem.isMoritaEquivalent_corner`.

**Checks.**

- Representables: `Tor_0(G, Hom(-, X)) ≅ G(X)` (1.1 and 0.3's Yoneda), and
  `Tor_{n+1}(G, Hom(-, X)) = 0` (1.1, since `Hom(-, X)` is projective); symmetrically
  `Tor_0(Hom(X, -), F) ≅ F(X)` and `Tor_{n+1}(Hom(X, -), F) = 0` (1.3).
- `Tor_1^ℤ(ℤ ⧸ m, ℤ ⧸ n) ≅ ℤ ⧸ gcd(m, n)` (cyclic formula: `(mℤ ∩ nℤ) ⧸ mnℤ`).
- For `B = k[ε]/(ε²)`, `Tor_n^B(k, k) ≅ k` for every `n`: `k` has the periodic resolution
  `⋯ → B → B → k` by multiplication by `ε`, which becomes zero after tensoring with `k`.
- For `T = T₂(k)` with radical `J = k e₁₂`, `Tor_1^T(T ⧸ J, T ⧸ J) ≅ J ⧸ J² = J` is
  one-dimensional (cyclic formula), and `Tor_n^T(T ⧸ J, -) = 0` for `n ≥ 2`, since
  `J = e₁₂T ≅ e₂₂T` is projective. Here `T ⧸ J` is semisimple, the sum of the two simple modules.
  By 1.7 the same groups are computed over the quiver category of `1 → 2`, with the representables
  as projectives.

### Examples

Rings: `ℤ`, `B = k[ε]/(ε²)` and `T₂(k)` as in the checks. Categories: representables, and finite
quiver categories through their category algebras, the path algebras of the opposite quivers
(1.7). The balance makes `Tor` computable from a
resolution of either variable.

### Dependencies

Layer 0.

## Layer 2: flat modules and flat functors

Throughout, `C : Type u` is preadditive with `Category.{v} C`. Flatness itself needs no smallness
and is defined for modules in any universe; the tests of 2.2, the Lazard block and the closure
properties that use `⊗_C` or `Tor` assume `EssentiallySmall.{v} C` and modules in the universe `v`
of the morphisms, where the representables live (Convention 3). The definition is for modules of
`Mod C`, contravariant functors; a covariant functor is flat when it is flat as a module over
`Cᵒᵖ`. [OR], [St], [CB], [Fisher] (except Cor. 2.9), [Krause-Smashing] and [Mitchell, §10] state
flatness for contravariant functors, as here; [Simson] states it for covariant functors, except
Thm. 2.1 (b), and is applied to `Cᵒᵖ` (Convention 14). Items 2.1–2.6 end with their ring
statements.

### 2.1 Definition

(`TauCeti.ModCat.IsTrivialRelation`, `TauCeti.ModCat.Flat F`.) A relation `∑_j F(β_j)(y_j) = 0` in
`F(X)`, for finitely many `β_j : X → Y_j` and `y_j ∈ F(Y_j)`, is **trivial** if there are finitely
many `z_i ∈ F(Z_i)` and maps `α_ij : Y_j → Z_i` with `y_j = ∑_i F(α_ij)(z_i)` and
`∑_j β_j ≫ α_ij = 0` for all `i`. A module `F` of `Mod C` is **flat** if every relation is trivial:
the **equational criterion** ([OR, Thm. 3.2 (4), pp. 96–97, with the proof to p. 99], for
contravariant functors on a preadditive category; Lazard; for rings [Lam-LMR, (4.24), p. 130], which
credits Chase, stated for right modules in Lam; applied to `Aᵐᵒᵖ`; [CE, VI, Exer. 6, p. 123];
Mathlib's commutative `Module.Flat.iff_forall_isTrivialRelation`). For rings, earlier forms: P. M.
Cohn, *On the free product of associative rings*, Math. Z. 71 (1959), 380–398, §2, Lemma 2.3, p. 383
(a vanishing sum `∑ u_i ⊗ v_i` over a finitely presented `V` comes from its relations) and Thm. 2.4,
p. 384 (the relational criterion for pure submodules), right modules; and N. Bourbaki, *Algèbre
commutative*, Ch. I, §2 (pages of the Masson 1985 edition, Springer reprint 2006): n° 3, Prop. 1,
p. 26, and Remarque 1, p. 27 (the ideal test, all or finitely generated left ideals), and n° 11,
Lemme 10, p. 41, Prop. 13 and Cor. 1, pp. 42–43 (the equational criterion), for right modules over
any ring.

**Why this definition.** The familiar definitions of flatness are tensorial: `- ⊗_C F` preserves
monomorphisms, the ideal test, or `Tor_1(-, F) = 0`. Over a category each of them needs the
tensor product `G ⊗_C F`, a coend over the objects of `C`, so it exists only when `C` is
essentially small, and only for modules in the universe of the morphisms (0.3, Convention 3).
The equational criterion quantifies only over objects, finitely many morphisms and elements, so it
makes sense for every preadditive `C` and in every universe, with no smallness. This matters for
2.4, which applies to large abelian and triangulated categories (for example `ModuleCat A` itself,
or a derived category), and for rings, where the bridge to `Mod (SingleObj Aᵐᵒᵖ)` holds for modules
in any universe. The definition is technical, and it is not the one a reader expects; the familiar
forms are the theorem that comes right after it (2.2): under `EssentiallySmall.{v} C`, flatness is
the ideal test, the exactness of `- ⊗_C F`, the vanishing of `Tor_1`, and Lambek's test. Over a
ring the tensor product always exists, which is why Mathlib's commutative `Module.Flat` can use a
tensor test.

The definition quantifies over objects and finite families of morphisms of `C` and over elements of
`F`, not over modules. A covariant functor `G` is flat when it is flat as a module over `Cᵒᵖ`
(`ModCat.Flat G` for `G : ModCat Cᵒᵖ`). The finitely generated right ideals of `C` at `X`, used by
the ideal test, are the subfunctors `coyonedaSpan β ⊆ Hom(X, -)` generated by finitely many
`β_j : X → Y_j` (`TauCeti.ModCat.coyonedaSpan`, the image of `⊕_j Hom(Y_j, -) → Hom(X, -)`, the
case over `Cᵒᵖ` of `TauCeti.ModCat.yonedaSpan`); for `C = SingleObj Aᵐᵒᵖ` they are the finitely
generated right ideals of `A`.

- **Ambient and intrinsic flatness.** `Flat` is flatness as a module. An object of the full
  subcategory `Flat(C)` of flat modules may also be called flat *inside* that category, when every
  epimorphism onto it there is pure; this is a different notion ([CI]). The docstring of `Flat`
  says so. The intrinsic notion is not developed here.

**Rings** (`TauCeti.Module.BalancedFlat A M`), a native class for a left module `M` (Convention 5):
`I ⊗_A M → A ⊗_A M` is injective for every finitely generated right ideal `I`, over `R = ℤ`. A
right module `M` is flat when `BalancedFlat Aᵐᵒᵖ M`. Mathlib lists the generalization of
`Module.Flat` to noncommutative rings as a TODO (`Mathlib/RingTheory/Flat/Basic.lean`); if it is
made, `BalancedFlat` is replaced by `Module.Flat`. Bridges: flatness over `SingleObj Aᵐᵒᵖ`
(`TauCeti.Module.balancedFlat_iff_flat_singleObj`, through 0.2 and 0.6, for `M` in any universe:
both sides are the equational criterion, [Lam-LMR, (4.24)]), and for a commutative ring Mathlib's
`Module.Flat` (`TauCeti.Module.balancedFlat_iff_flat`, through 0.6).

*Needs:* 0.1–0.3, 0.5, 0.6; Mathlib `Subobject`, `imageSubobject`, `Limits.Sigma.desc`.

### 2.2 Tests

(`TauCeti.ModCat.flat_tfae`.) For `EssentiallySmall.{v} C` and a module `F` of `Mod C` in the
universe `v`, the following are equivalent:

1. `F` is flat (the equational criterion, 2.1);
2. **the ideal test**: `I ⊗_C F → Hom(X, -) ⊗_C F ≅ F(X)` is injective for every object `X` and
   every finitely generated right ideal `I = coyonedaSpan β ⊆ Hom(X, -)` of `C` at `X` (for rings
   [Lam-LMR, (4.12), p. 125], stated for right modules in Lam; applied to `Aᵐᵒᵖ`);
3. the same for every right ideal of `C` at `X`, that is, every subfunctor `I ⊆ Hom(X, -)`;
4. `- ⊗_C F` preserves monomorphisms, so it is exact on `Mod Cᵒᵖ` ([OR, Thm. 3.2 (1), p. 96];
   [Mitchell, §10, p. 48]);
5. `Tor_1(-, F) = 0`; then `Tor_n(-, F) = 0` for all `n ≥ 1`
   (`TauCeti.ModCat.Flat.isZero_tor_succ`; dimension shifting by 1.2 and 1.3);
6. `Tor_1(Hom(X, -) ⧸ I, F) = 0` for every finitely generated `I ⊆ Hom(X, -)` ([OR, Thm. 3.2 (3)],
   stated for every ideal `I`, in OR's order of the factors, Convention 14);
7. **Lambek**: the dual `F^E = Hom_R(F(-), E)` of 0.7 is injective in `Mod Cᵒᵖ`, for an injective
   cogenerator `E` of `R`-modules (`TauCeti.ModCat.flat_iff_injective_dual`; [Lambek, Theorem,
   p. 239] for rings and `E = ℚ ⧸ ℤ`; [St, Thm. 3 (d), p. 357] for functors). For a general `E` it
   follows from the adjunction of 0.3 ([OR, (1.1), p. 93]) and 0.7's one-map criterion.

Route. (1) ⇔ (2): the relations `∑_j F(β_j)(y_j) = 0` are the kernel of
`coyonedaSpan β ⊗_C F → F(X)` described through `(Hom(X, -) ⧸ I) ⊗_C F ≅ F(X) ⧸ (I · F)(X)` (0.3,
[OR, Lemma 1.2, p. 94], on `Cᵒᵖ`), as in [OR, proof of Thm. 3.2, pp. 96–99] and [CE, VI,
Exer. 5–6, pp. 122–123] for rings (Exer. 5 for one left ideal, Exer. 6 for all). The rest is the
textbook route, Lambek and Baer, organized as in [Lam-LMR, (4.12)] (stated for right modules in Lam;
applied to `Aᵐᵒᵖ`): (3) ⇒ (2) is immediate; (2) ⇒ (3): an element of `I ⊗_C F` comes from `I' ⊗_C F`
for a finitely generated `I' ⊆ I`; (3) ⇒ (7): by 0.7, (3) says that every map from a subfunctor of a
covariant representable to `F^E` extends to the representable; then the Baer criterion below, over
`Cᵒᵖ`; (7) ⇒ (4) by
0.7; (4) ⇔ (5) and (5) ⇒ (6) ⇒ (2) by the long exact sequences of 1.2 and the vanishing of `Tor` at
projective covariant functors (1.3), applied to `0 → K → P → G → 0` and to
`0 → I → Hom(X, -) → Hom(X, -) ⧸ I → 0`. Each test holds for covariant functors over `Cᵒᵖ`
(`TauCeti.ModCat.Flat.mono_tensor_obj_map` for (4)).

**Finitely presented flat modules are projective**
(`TauCeti.ModCat.Flat.projective_of_isFinitelyPresentedFunctor`; [St, Lemma 7 (ii), p. 354];
[Lazard, Cor. 1.4, p. 85]; [Mitchell, p. 49], a remark). Route: by (5), `Tor_1(Tr F, F) = 0`, and
1.4's `Tor` criterion (`stable End(F) ≅ Tor_1(Tr F, F)`) makes `F` projective. This is the short
route: it uses only 1.4 and the `Tor` test, not Lazard's characterization of flatness; Lazard's own
proof factors the identity of `F` through a finite sum of representables (2.3) and is kept as a
remark.

Two targets of this item:

- **Baer's criterion for `Mod C`** (`TauCeti.ModCat.Baer`, `TauCeti.ModCat.baer_iff_injective`): a
  module `E` is injective exactly when every map from a subfunctor of a representable `Hom(-, X)`
  to `E` extends to `Hom(-, X)`. Route: Zorn's lemma on partial extensions, as Mathlib's
  `Module.Baer.injective`; the representables generate, since an element of `F(X)` is a map
  `Hom(-, X) → F`. Not in Mathlib (only `Module.Baer`) or Tau Ceti. Mathlib's
  `IsGrothendieckAbelian.generatingMonomorphisms_rlp` (0.1) is the form for one separator; the
  form here tests each representable separately. The test above uses it over `Cᵒᵖ`.
- **`Tor` commutes with filtered colimits** in the `Mod C` variable
  (`TauCeti.ModCat.preservesFilteredColimits_tor_obj`). Route: compute `Tor` from a projective
  resolution `P` of the covariant variable (1.3); each `P_p ⊗_C -` preserves colimits (0.3), and
  filtered colimits are exact in `AddCommGrpCat` (Mathlib's `AB5` instances). [OR, Lemma 3.1,
  p. 96] uses this; 2.3 and 2.6 need it.

**Rings** (`TauCeti.Module.balancedFlat_tfae`). For `[Small.{v} A]` and `M : Type v`, the following
are equivalent: `BalancedFlat A M`; `I ⊗_A M → M` is injective for every right ideal `I`; `i ⊗ M` is
injective for every injective map `i` of right modules in the universe `v`; `Tor_1^A(N, M) = 0` for
every right module `N`; `Tor_1^A(A ⧸ I, M) = 0` for every finitely generated right ideal `I`;
`Module.Injective Aᵐᵒᵖ M⁺` ([Lambek, Theorem, p. 239]; [Lam-LMR, (4.9), p. 125], stated for right
modules in Lam; applied to `Aᵐᵒᵖ`). Route: the same,
with Mathlib's `Module.Baer.injective` over `Aᵐᵒᵖ` and the duals of 0.6, or through
`balancedFlat_iff_flat_singleObj`. Also: flat modules have no higher `Tor`
(`TauCeti.isZero_balancedTor_succ_of_balancedFlat`), ring `Tor` commutes with filtered colimits
(`TauCeti.preservesFilteredColimits_balancedTor_obj`), and a finitely presented flat module is
projective (`TauCeti.Module.BalancedFlat.projective_of_finitePresentation`, by 1.4 as above).

*Needs:* 0.3, 0.4, 0.7, 0.8, 1.1–1.4; Mathlib `Subobject`, `Injective`, `IsCoseparator`,
`PreservesFilteredColimitsOfSize`, `AB5`, `Module.Baer.injective`.

### 2.3 The Lazard block

These characterizations use finite data ([OR, Thm. 3.2 (4)–(6)]; [Lazard, Ch. I]; [St]; [CB, §1.3]).
Over a preadditive `C` they use finite sums of representables `Hom(-, Z_1) ⊕ ⋯ ⊕ Hom(-, Z_m)`
(`TauCeti.ModCat.isFiniteFree`), not single representables: for the ring `ℤ` the elements
`e_1, e_2` of the flat module `ℤ²` have no common source `e_1 = a z`, `e_2 = b z`. Under finite
biproducts the single-representable forms are corollaries; no passage to `Mat_ C` is needed.
"Finitely presented" is the notion of 0.1 (0.8 compares it with Mathlib's). For a module `F` of
`Mod C`, with `EssentiallySmall.{v} C`, each of the following is equivalent to flatness:

- **factorization** (`TauCeti.ModCat.flat_iff_forall_exists_factorization`): every map from a
  finitely presented module to `F` factors through a finite sum of representables ([Lazard,
  Lemme 1.1 and Thm. 1.2, p. 84]; [St, Lemma 8 (c), p. 354], which factors through a projective
  object; [CB, §1.3 (2), p. 1646]);
- **filtered category of elements** (`TauCeti.ModCat.FiniteFreeOver F`,
  `TauCeti.ModCat.flat_iff_isFiltered_finiteFreeOver`): the maps to `F` from finite sums of
  representables, a `CostructuredArrow` category with the shape of Tau Ceti's
  `TauCeti.FiniteFreeOver`, form a filtered category ([OR, Thm. 3.2 (6), p. 97]; [CB, §1.3 (3)]);
- **Lazard–Govorov** (`TauCeti.ModCat.flat_iff_exists_isColimit`): `F` is a filtered colimit of
  finite sums of representables ([OR, Thm. 3.2 (5), p. 97]; [Mitchell, Thm. 10.1b, p. 48]; [CB,
  §1.3 (4)]; [Lazard, Thm. 1.2]; for rings [Govorov], a direct limit of free modules; [St, Thm. 3
  (b)]: a direct limit of projectives). The colimit is indexed by a small category: `FiniteFreeOver
  F` is essentially `v`-small (`TauCeti.ModCat.essentiallySmall_finiteFreeOver`, a target), since
  its objects are determined up to isomorphism by finite families of objects of a small model of
  `C` and elements of `F`, the pattern of Tau Ceti's `TauCeti.FiniteFreeModuleCat`; the colimit runs
  over a `SmallModel` of it. Filteredness alone does not give this;
- **purity** (`TauCeti.ModCat.IsPureEpi`, `TauCeti.ModCat.flat_iff_forall_isPureEpi`): every
  epimorphism onto `F` is pure, that is, maps from finitely presented modules lift along it ([St,
  §2 and Thm. 3, pp. 353–357, with the proof of (c) ⇒ (a) on p. 358]; [Lazard, Cor. 1.3, p. 85]).
  **Bridge to Mathlib's purity** (`TauCeti.ModCat.isPureEpi_iff_isCardinalPure`): for a short exact
  sequence `0 → K → L → M → 0`, `L → M` is a pure epimorphism exactly when `K → L` is
  `IsCardinalPure` at `ℵ₀` in Mathlib's sense
  (`Mathlib/CategoryTheory/Presentable/CardinalPure.lean`: lifting against `ℵ₀`-presentable
  squares), by a pushout and cokernel diagram chase with 0.8. This brings Mathlib's stability of
  pure morphisms and `exists_colimitsOfShape_splitMonomorphisms_of_isCardinalPure` (a pure
  monomorphism is a filtered colimit of split monomorphisms; compare [St, Thm. 3]).

Route: the ideal test (2.2) gives the factorization, by dualizing a finite presentation ([Lazard,
Lemme 1.1]; [Lam-LMR, (4.32), p. 133], stated for right modules in Lam; applied to `Aᵐᵒᵖ`). The
factorization makes the category of elements filtered, and `F` is the colimit over it (the pattern
of Tau Ceti's `flatModuleFilteredFree`). A filtered colimit of finite sums of representables is
flat (2.6). Purity is the factorization read as lifting. The chain mixes [OR]'s, which goes
(1) ⇒ (4) ⇒ (3) ⇒ (1) ⇒ (6) ⇒ (5) ⇒ (5′) ⇒ (2) ⇒ (1) and starts from flatness with Lemma 1.2
applied to a free presentation, with [Lazard, Lemme 1.1, Thm. 1.2], which derives the factorization
from flatness; it follows [OR, proof of (1) ⇒ (4) and (4) ⇒ (6)] and [Lazard, Lemme 1.1, Thm. 1.2].
[CB]'s proof of the factorization instead uses the transpose and the stable Hom,
`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` ([Auslander78, I, Prop. 3.2]); it is not followed here.

Consequences:

- **remark on finitely presented flat modules**: the factorization of the identity of a finitely
  presented flat `F` through a finite sum of representables also shows that `F` is projective
  ([Lazard, Cor. 1.4, p. 85]; for rings [Chase 1960, Prop. 2.2 and Corollary, pp. 458–459], right
  modules; [OR, Cor. 3.3, p. 99]). The target is 2.2's, by the shorter route of 1.4;
- **flat and pure-projective modules are projective** (`TauCeti.ModCat.IsPureProjective`,
  `TauCeti.ModCat.Flat.projective_of_isPureProjective`): an epimorphism from a projective onto
  `F` is pure, so it splits;
- **flat does not imply pure-projective**: `ℚ` is a flat, not projective, `ℤ`-module (checks), so it
  is not pure-projective. Conversely `ℤ ⧸ 2` is finitely presented, hence pure-projective, and not
  flat;
- **additive categories** (`TauCeti.ModCat.flat_iff_isFiltered_costructuredArrow_yoneda`): with
  finite biproducts, single representables suffice in each item ([CB, §1.3], whose "additive"
  includes finite biproducts; [OR, Cor. 3.3, p. 99]).

**Rings** (`TauCeti.Module.balancedFlat_iff_isFiltered_finiteFreeOver`,
`TauCeti.Module.BalancedFlat.denseAt`,
`TauCeti.Module.BalancedFlat.exists_factorization_of_finitePresentation`). `M` is flat exactly when
Tau Ceti's `FiniteFreeOver A M` is filtered; then `M` is the filtered colimit of the finite free
modules over it; every map from a finitely presented module to `M` factors through a finite free
module ([Lazard, Thm. 1.2, Cor. 1.4]; [Lam-LMR, (4.30), (4.32)–(4.34), pp. 133–134], stated for
right modules in Lam; applied to `Aᵐᵒᵖ`; Mathlib's commutative
`Module.Flat.exists_factorization_of_finitePresentation` and
`Module.Flat.projective_of_finitePresentation`). Over a left Noetherian ring every finite flat
module is projective (2.2 and `Module.finitePresentation_of_finite`).

**Refactor consumer.** Tau Ceti's `TauCeti.flatModuleFilteredFree`
(`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`), one direction of Lazard's theorem for
commutative rings, becomes a corollary of `BalancedFlat.denseAt` and `balancedFlat_iff_flat`. It is
reproved this way, with no compatibility shims.

**Bridges to Mathlib's set-valued notions** (`TauCeti.ModCat.flat_iff_isIndObject`,
`TauCeti.ModCat.flat_iff_isCofiltered_elements`). Over an additive `C`, a module is flat exactly
when its underlying presheaf of sets is an ind-object (Mathlib's `IsIndObject`, with the
recognition theorem `isIndObject_iff`; [Krause-Smashing, §2.3, p. 115]: `Flat C = Ind C`), and
exactly when the category of elements of `F ⋙ forget`, a functor on `Cᵒᵖ`, is cofiltered: Mathlib's
type-valued flatness (`Functor.isCofiltered_elements`) is stated for covariant functors and is
applied on `Cᵒᵖ`. Mathlib's `isIndObject_iff_preservesFiniteLimits` is then the set-valued form of
2.4. Mathlib's `RepresentablyFlat u` is a different notion, and it is covariant: for an additive
`u : C ⥤ D` between additive categories it corresponds to flatness of the covariant functors
`D(d, u(-))` (the objects of `StructuredArrow d u` are maps `d → u(c)`), that is, of modules over
`Cᵒᵖ`; the modules `D(u(-), d)` of `Mod C` belong to `RepresentablyCoflat`. The comparison goes
through `Cᵒᵖ`.

*Needs:* 0.8, 2.1, 2.2; Mathlib `IsFinitelyPresentable`, `IsCardinalPure`, `CostructuredArrow`,
`IsFiltered`, `IsCofiltered`, `Functor.Elements`, `Cocone`, `IsColimit`, `IsIndObject`,
`Functor.DenseAt`, `Retract`, `SmallModel`; Tau Ceti `TauCeti.FiniteFreeOver`,
`TauCeti.FiniteFreeModuleCat` (pattern), `TauCeti.finiteFreeModuleInclusion`,
`TauCeti.flatModuleFilteredFree`.

### 2.4 Left exact functors, triangulated categories and the representation theorem

No smallness is assumed in this item: flatness is the equational criterion (2.1), and the proofs
go through it. The modules take values in any universe.

- **Weak cokernels** (`TauCeti.IsWeakCokernel`, `TauCeti.isWeakCokernel_iff`,
  `TauCeti.ModCat.flat_iff_exact_of_isWeakCokernel`). `g` is a weak cokernel of `f` when `g.op` is a
  weak kernel of `f.op`, through Mathlib's weak-limit API (`IsWeakLimit` of `KernelFork.ofι g.op`,
  `Mathlib/CategoryTheory/Limits/WeakLimits/WeakKernels.lean`, which has weak kernels and lists weak
  cokernels as future work); elementwise, `f ≫ g = 0` and every `h` with `f ≫ h = 0` factors
  through `g`, not necessarily uniquely ([CB]'s pseudo-cokernels). If the additive `C` has weak
  cokernels, a module `F` is flat exactly when `F(Z) → F(Y) → F(X)` is exact whenever `Y → Z` is a
  weak cokernel of `X → Y` ([CB, §1.2, Lemma 2, and §1.3, pp. 1644–1646]). Route: with finite
  biproducts a relation is one `y ∈ F(Y)` with `F(β)(y) = 0` for `β : X → Y`, and the maps `α` with
  `β ≫ α = 0` are those factoring through a weak cokernel of `β`; so this is the equational
  criterion.
- **Flat = left exact** (`TauCeti.ModCat.flat_iff_preservesFiniteLimits`). For an additive `C`
  with cokernels, a module `F` of `Mod C` is flat exactly when it is left exact: it turns cokernels
  in `C` into kernels, that is, `F : Cᵒᵖ ⥤ Ab` preserves finite limits. So
  `Flat(Cᵒᵖ, Ab) = Lex(Cᵒᵖ, Ab)` ([Fisher, Prop. 1.3 and Thm. 1.4, pp. 279–280, with Thm. 2.4,
  p. 284], for "left exact ⇒ `⊗ G` exact" over abelian `C`, where Fisher does not use the word
  flat; [Fisher, Cor. 2.9, p. 285], covariant, applied to `Cᵒᵖ`, for the equivalence; [OR, Cor. 3.4,
  p. 99]; [CB, §2.2, p. 1649]; [Simson, Thm. 2.1 (b), p. 95], stated for `Cᵒᵖ`-modules, that is,
  contravariant functors, as here). Route: a cokernel is a weak cokernel, and a weak cokernel and
  the cokernel factor through each other. On the other side: over `C` with kernels, a flat
  covariant functor is left exact.
- **Triangulated categories** (`TauCeti.ModCat.flat_iff_isHomological`). For a triangulated `C`, a
  module of `Mod C` is flat exactly when it is cohomological, that is, homological on `Cᵒᵖ`
  (Mathlib's `Functor.IsHomological`, with the scoped pretriangulated structure of
  `Pretriangulated.Opposite`) ([Krause-Smashing, Lemma 2.7, p. 115], for skeletally small `C` and
  additive `M : Cᵒᵖ → Ab`; independently [Beligiannis, Lemma 8.10, Prop. 8.11 and Rem. 8.12,
  pp. 180–181]). The printed results assume a skeletally small triangulated `C`; the statement here
  needs neither smallness nor more than `Pretriangulated`: distinguished triangles give weak
  cokernels (Mathlib's `Pretriangulated.isWeakLimitKernelForkOfDistTriangle`, applied on `Cᵒᵖ`),
  and the first item applies. Krause's proof instead extends `F` to the abelian category of
  finitely presented functors and computes `Ext` from triangles. Both sources show that this is
  also equivalent to fp-injectivity; that part stays in prose. Background: P. Gabriel, F. Ulmer,
  *Lokal präsentierbare Kategorien*, Lecture Notes in Math. 221, Springer (1971), §5, pp. 55–62,
  and §7, pp. 71–84, for set-valued functors (not additive; the remark in 5.5, p. 58, names the flat
  modules over a ring, citing Lazard); and, for the additive case, in *Proc. Conf. Categorical
  Algebra* (La Jolla, 1965), Springer (1966), P. Freyd, *Representations in abelian categories*,
  95–120 (weak kernels, p. 99; Thm. 1.4, p. 99, with proof to p. 102, and Cor. 1.5, p. 102: an
  additive category with weak kernels and weak products is a resolving set of projectives in an
  abelian category) and M. Auslander, *Coherent functors*, 189–231 (finitely presented covariant
  functors on an abelian category, p. 189).
- **Crawley-Boevey's representation theorem** (`TauCeti.FinitelyPresented`,
  `TauCeti.restrictedYonedaEquivFlat`). A finitely accessible additive category `𝒜` is equivalent,
  by the restricted Yoneda functor `X ↦ Hom(-, X)` on `fp(𝒜)`, to the flat modules of
  `Mod fp(𝒜)` ([CB, §1.4, Theorem, p. 1647]). "Finitely accessible" is Mathlib's
  `IsFinitelyAccessibleCategory`: filtered colimits and a small set of finitely presented objects
  that generate by filtered colimits, with no cocompleteness. [CB]'s "locally finitely presented"
  means this. Mathlib's `IsLocallyFinitelyPresentable` adds all colimits and would narrow the
  theorem ([CPT, pp. 1214 and 1218] distinguish the two). Conversely (`TauCeti.ModCat.flat`, an
  instance `IsFinitelyAccessibleCategory (ModCat.flat C).FullSubcategory`,
  `TauCeti.ModCat.isFinitelyPresentable_flat_iff`): for a small additive `C`, the flat modules form
  a finitely accessible category, whose finitely presented objects are the retracts of
  representables (Mathlib's `Retract`) ([CB, §1.4 (1)]). When idempotents split in `C`, `C` is
  recovered as these finitely presented objects (prose only). The representation does not make
  `Flat(Cᵒᵖ, Ab)` abelian or Grothendieck.

Pointers, not targets: the representation theorem turns Theorem P (Layer 4) for `fp(𝒜)` into a
criterion for pure-semisimplicity of `𝒜` ([CB, §3.2, p. 1655]; [JL, Thm. B.12]). Flat covers are
outside this roadmap ([BEE, Thm. 3] for rings; [CPT, Cor. 3.3, p. 1218] for `Mod C`; [Rump];
[Krause-FlatCovers]).

*Needs:* 2.1, 2.3; Mathlib `PreservesFiniteLimits`, `HasCokernels`, `HasFiniteBiproducts`,
`IsWeakLimit`, `KernelFork.ofι`, `Pretriangulated.isWeakLimitKernelForkOfDistTriangle`,
`Functor.IsHomological`, `Pretriangulated.Opposite`, `IsFinitelyAccessibleCategory`,
`ObjectProperty.isFinitelyPresentable`, `Retract`.

### 2.5 Bass's flat module

For a sequence `c_0 → c_1 → c_2 → ⋯` in `C`, with `f_i : c_i → c_{i+1}`, write
`q_n = f_0 ≫ ⋯ ≫ f_{n-1} : c_0 → c_n`:

- **Definition** (`TauCeti.ModCat.bassDiagram`, `TauCeti.ModCat.bassModule`):
  `B = colim(Hom(-, c_0) → Hom(-, c_1) → ⋯)`, with maps `Hom(-, f_i)` (Mathlib's
  `Functor.ofSequence` and `colimit`).
- **Flat** (an instance): a filtered colimit of representables (2.6). **Countably presented** (an
  instance `IsCardinalPresentable B ℵ₁`): by the telescope below and 0.8.
- **Telescope presentation** (`TauCeti.ModCat.bassTelescope`, `TauCeti.ModCat.bassπ`,
  `TauCeti.ModCat.bassTelescope_shortExact`): `0 → ⊕_i Hom(-, c_i) → ⊕_i Hom(-, c_i) → B → 0`,
  where the `i`-th summand maps by `ι_i - Hom(-, f_i) ≫ ι_{i+1}`. So `B` has projective dimension
  at most one.
- **Zero Bass modules** (`TauCeti.ModCat.isZero_bassModule_iff`): `B = 0` exactly when every tail
  of the sequence has a zero composite, that is, for every `i` some `c_i → c_j`, `j ≥ i`,
  vanishes; the class of `𝟙 c_i` is zero at a later stage exactly then. Layer 4 uses it for
  T-nilpotence (4.1).
- **Projective implies factorizable** (`TauCeti.IsFactorizable`,
  `TauCeti.ModCat.isFactorizable_of_projective_bassModule`). If `B` is projective, the sequence
  `Functor.ofSequence f` is factorizable: for every `i` there is `j ≥ i` such that the map
  `c_i → c_j` factors through every later map `c_i → c_k`, `k ≥ j`, as `(c_i → c_k) ≫ t`. This is
  Simson's factorizable inverse system ([Simson, Def. 3.1, p. 99], for his covariant modules) in
  `Cᵒᵖ`. In particular some `q_n` factors as `q_m ≫ t` through every later `q_m`. The quantifiers
  matter: the reverse factorization is automatic, and one equation `q_n = q_{n+1} ≫ t` does not
  express stabilization. Route: a splitting of the telescope, read on finitely many coordinates;
  the tails of the sequence have the same `B`, which gives every `i`.

Credits: this is the representable-module form of Bass's telescope ([Bass, Lemmas 1.1–1.3,
pp. 468–470]; the splitting argument is Lemma 1.3), and [Harada, Remark 1, pp. 339–340] adapts
Bass's construction to the ring with enough idempotents of a category. The categorical statement is
an adaptation of these, not a new result. [Simson] reaches factorizable systems from "flat implies
projective" through Mittag-Leffler objects instead (Thm. 5.4 (5)).

**Rings** (`TauCeti.bassRelations`, `TauCeti.balancedFlat_bassRelations`,
`TauCeti.exists_span_prod_eq_of_projective_bassRelations`). For `a : ℕ → A`, Bass's module
`(ℕ →₀ A) ⧸ ⟨eᵢ - aᵢ • eᵢ₊₁⟩` is `B` at `SingleObj Aᵐᵒᵖ` with every `f_i = op a_i`: `Hom(-, f_i)` is
right multiplication by `a_i` on `A`, and `q_n = op (a_0 ⋯ a_{n-1})`. It is flat, and if it is
projective, the chain `a₀A ⊇ a₀a₁A ⊇ ⋯` of principal right ideals is eventually constant ([Bass,
Lemmas 1.1–1.3]; [Lam-FC, (24.24), pp. 367–368], right-handed). Layer 4 uses it for Theorem P
(4.5).

*Needs:* 2.3; Mathlib `Functor.ofSequence`, `colimit`, `Limits.Sigma.desc`,
`ShortComplex.ShortExact`.

### 2.6 Closure properties

(`TauCeti.ModCat.Flat.of_projective`, an instance; `TauCeti.ModCat.Flat.of_retract`,
`TauCeti.ModCat.flat_sigma_iff`, `TauCeti.ModCat.flat_iff_of_shortExact`,
`TauCeti.ModCat.Flat.of_isColimit`, `TauCeti.ModCat.flat_iff_mono_tensor_of_shortExact`.) Retracts,
sums and filtered colimits need no smallness (equational criterion); the rest uses `⊗_C` and `Tor`.

- projective modules are flat (0.4);
- retracts of flat modules are flat (Mathlib's `Retract`);
- a direct sum is flat exactly when every summand is;
- in a short exact sequence `0 → F_1 → F_2 → F_3 → 0` with `F_3` flat, `F_2` is flat exactly when
  `F_1` is ([Mitchell, Cor. 10.4b, p. 49]; the long exact sequence of 1.3);
- filtered colimits of flat modules are flat (2.2: `Tor` commutes with filtered colimits;
  [Mitchell, p. 48]; [CB, §1.3]);
- **flat quotients**: for `0 → K → P → F → 0` with `P` flat, `F` is flat exactly when
  `N ⊗_C K → N ⊗_C P` is a monomorphism for every covariant `N` ([Lam-FC, (24.23), p. 367], for
  rings, right-handed).

**Rings** (`TauCeti.Module.BalancedFlat.of_projective`,
`TauCeti.Module.BalancedFlat.of_linearEquiv`, `TauCeti.Module.balancedFlat_directSum_iff`,
`TauCeti.Module.balancedFlat_iff_of_exact` ([Lam-LMR, (4.13), p. 126], which states that the middle
term is flat when the outer terms are; the converse direction is the `Tor` sequence),
`TauCeti.Submodule.inf_smul_eq_smul_of_balancedFlat`): the same, and the quotient test: if `F` and
`F ⧸ K` are flat, then `K ⊓ I • F = I • K` for every two-sided ideal `I` ([Lam-LMR, (4.14), p. 126];
the case `N = A ⧸ I`). The alternative ring route of 4.5 through `R ⧸ J` uses it.

Pointers, not targets: products of flat modules of `Mod C`, for additive `C`, are flat exactly when
`C` has weak cokernels ([CB, Thm. 2.1, p. 1648], for skeletally small additive `C`; [OR, Thm. 4.1,
p. 101], item (5) for covariant functors in `[X, Mod K]`, applied to `Cᵒᵖ`; Chase for rings,
[Lam-LMR, (4.47), p. 139]). The additivity matters: for the one-object category of
`k[x, y] ⧸ (x, y)²`, products of flat modules are flat (the ring is Artinian), but `x` has no weak
cokernel. The flat modules are closed under kernels exactly when the weak global dimension is at
most two ([CB, Thm. 2.3, p. 1651]; a target of 3.5). Coherence and products are not developed.

*Needs:* 0.4, 2.1–2.3; Mathlib `Retract`, `IsFiltered`.

**Checks.**

- `ℚ` is a flat `ℤ`-module (2.1 and Mathlib's `Module.Flat`) and is not projective
  (`TauCeti.balancedFlat_rat_and_not_projective`): a split embedding into a free abelian group
  would give a nonzero map `ℚ → ℤ`. So `ℚ` is not pure-projective (2.3).
- `ℤ ⧸ n` is not flat for `n ≥ 2` (`TauCeti.not_balancedFlat_zmod`; `Tor_1^ℤ(ℤ ⧸ n, ℤ ⧸ n) ≠ 0`,
  Layer 1 checks).
- Over `B = k[ε]/(ε²)`, `k` is not flat, since `Tor_1^B(k, k) ≅ k` (Layer 1 checks).
- Over `T₂(k)`, of the two simple left modules the projective one is flat and the other is not
  (2.2: it is finitely presented and not projective); `T₂(k) ⧸ J` is semisimple, their sum, and not
  flat. Through 1.7 the same holds for the quiver category of `1 → 2`, whose category algebra is
  `T₂(k)`.
- Bass's module over `ℤ` for the constant sequence `p` is `ℤ[1/p]`: flat, not projective, and
  `pℤ ⊋ p²ℤ ⊋ ⋯`.
- Representables `Hom(-, X)` and `Hom(X, -)` are flat (projective, 2.6).
- A categorical Bass module: in the `k`-linear category of the linear quiver `0 → 1 → 2 → ⋯`, take
  `c_i = i` with `f_i` the arrow `i → i + 1`. Then `q_n : 0 → n` is the nonzero path, and
  `Hom(m, n) = 0` for `m > n`, so `q_n` does not factor through `q_m` for `m > n`. The sequence is
  not factorizable, and `B` is flat and not projective (2.5).

### Examples

Rings: `ℚ`, `ℤ[1/p]` and `ℤ ⧸ n` over `ℤ`; the simple modules of `T₂(k)` and of `k[ε]/(ε²)`.
Categories: representables; Bass modules of sequences in quiver categories; left exact functors on
abelian categories; cohomological functors on triangulated categories.

### Dependencies

Layers 0 and 1.

## Layer 3: flat dimension, global and weak global dimension

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{v} C`, and
modules live in the universe `v`, as in Layer 2. `Tor` takes values in abelian groups (1.1), so no
base ring enters the dimensions. Items 3.1–3.4 end with their ring statements. The categorical
statements are adaptations of the ring theorems cited with them, unless a categorical source is
named.

### 3.1 Flat dimension

(`TauCeti.ModCat.HasFlatDimensionLT F n`, `TauCeti.ModCat.HasFlatDimensionLE`,
`TauCeti.ModCat.flatDimension`.) A module `F` of `Mod C` has **flat dimension `< n`** if
`Tor_i(Hom(X, -) ⧸ I, F) = 0` for every `i ≥ n`, every object `X` and every finitely generated
subfunctor `I = coyonedaSpan β ⊆ Hom(X, -)` (2.1). `HasFlatDimensionLE F n` is
`HasFlatDimensionLT F (n + 1)`, and `flatDimension F : WithBot ℕ∞` is the infimum of the `d` with
`HasFlatDimensionLT F i` for all `i > d`. This is the shape of Mathlib's `projectiveDimension`,
which is also defined by vanishing (of `Ext`) and not by resolutions. The definition is
universe-free: it quantifies over objects and finite families of morphisms of `C`. At `n = 0`,
`HasFlatDimensionLE F 0` is 2.2 (6), so flat dimension `≤ 0` is Layer 2's flatness; at `i = 0`,
`Tor_0(Hom(X, -), F) = F(X)`, so `flatDimension F = ⊥` exactly when `F = 0`. A covariant functor
has its flat dimension as a module over `Cᵒᵖ`; there are no separate declarations for it.

**The classical definition** (`TauCeti.ModCat.hasFlatDimensionLE_tfae`). For `n : ℕ` the
following are equivalent:

1. `HasFlatDimensionLE F n`;
2. `Tor_i(G, F) = 0` for every covariant `G` and every `i > n`;
3. `Tor_{n+1}(G, F) = 0` for every covariant `G`;
4. `F` has a flat resolution `0 → K_n → ⋯ → K_0 → F → 0` of length `≤ n`;
5. the `n`-th syzygy of every projective resolution `P` of `F` is flat;
6. the `n`-th syzygy of some projective resolution of `F` is flat.

The `n`-th syzygy is `P.complex.opcycles n = coker(P_{n+1} → P_n)`, which is `F` for `n = 0`.
Item 4 is the textbook definition. Route: dimension shifting in either variable (1.2, 1.3), with
the vanishing of higher `Tor` at projective modules. (3) ⇒ (2) shifts in `G`; (2) ⇒ (1) is
immediate; (1) ⇒ (5) is 2.2 (6) applied to the `n`-th syzygy `K`, since
`Tor_1(-, K) ≅ Tor_{n+1}(-, F)`; (5) ⇒ (6) ⇒ (4) truncate a projective resolution at its syzygy;
(4) ⇒ (3) computes `Tor` from the flat resolution (below). Item 2 holds for covariant `G` in every
universe; Lean states it in the universe `v`.

API:

- `flatDimension F ≤ n ↔ HasFlatDimensionLE F n` (`TauCeti.ModCat.flatDimension_le_iff`);
  `flatDimension F = ⊥ ↔ F = 0` (`TauCeti.ModCat.flatDimension_eq_bot_iff`); flat dimension
  `≤ 0` is flatness (`TauCeti.ModCat.hasFlatDimensionLE_zero_iff`);
- `flatDimension F ≤ projectiveDimension F`
  (`TauCeti.ModCat.flatDimension_le_projectiveDimension`; projective modules are flat, 2.6);
- dimension shifting (`TauCeti.ModCat.hasFlatDimensionLE_succ_iff`): for `0 → K → P → M → 0`
  with `P` flat, `HasFlatDimensionLE M (n + 1) ↔ HasFlatDimensionLE K n`;
- `Tor` from flat resolutions (`TauCeti.ModCat.torObjIsoHomologyOfFlat`): for a flat resolution
  `K → F`, `Tor_n(G, F) ≅ H_n(G ⊗_C K)`. Route: both sides from a projective resolution of `G`
  (1.3), with `- ⊗_C K_q` exact (2.2);
- **duality** (`TauCeti.ModCat.flatDimension_eq_injectiveDimension_dual`): for an injective
  cogenerator `E` of `R`-modules, `flatDimension F = injectiveDimension (F^E)` in `Mod Cᵒᵖ`. Route:
  the `Tor`–`Ext` duality of 1.5 in every degree, and `E` detects zero (0.7). This is the
  general-`E` form of [Lam-LMR, (5.57), p. 184] (`E = ℚ ⧸ ℤ`, rings; stated for right modules in
  Lam; applied to `Aᵐᵒᵖ`).

**Rings** (`TauCeti.HasFlatDimensionLT`, `TauCeti.HasFlatDimensionLE`, `TauCeti.flatDimension`),
native for `M : ModuleCat.{v} A` with `[Small.{v} A]`: `Tor_i^A(A ⧸ I, M) = 0` for every `i ≥ n` and
every finitely generated right ideal `I`. API as above: `TauCeti.flatDimension_eq_bot_iff`,
`TauCeti.hasFlatDimensionLE_zero_iff`, `TauCeti.hasFlatDimensionLE_tfae`,
`TauCeti.flatDimension_le_projectiveDimension`, `TauCeti.hasFlatDimensionLE_succ_iff`, and
`TauCeti.flatDimension_eq_injectiveDimension_characterModule`: `flatDimension M` is the injective
dimension of the character module `M⁺` in `ModuleCat Aᵐᵒᵖ` ([Lam-LMR, (5.57)], stated for right
modules in Lam; applied to `Aᵐᵒᵖ`), the case `R = ℤ`,
`E = ℚ ⧸ ℤ` of the duality. Bridge (`TauCeti.hasFlatDimensionLT_iff_singleObj`): through 0.2, ring
flat dimension is flat dimension over `SingleObj Aᵐᵒᵖ`.

*Needs:* 1.1–1.3, 1.5, 2.1, 2.2, 2.6; Mathlib `HomologicalComplex.opcycles`, `QuasiIso`,
`ChainComplex.single₀`, `ProjectiveResolution`, `injectiveDimension`.

### 3.2 Global dimension of an abelian category

(`TauCeti.Abelian.globalDimension 𝒜 := ⨆ X : 𝒜, projectiveDimension X`.) For an abelian category
`𝒜`, the global dimension is the supremum of Mathlib's `projectiveDimension` over the objects
([Mitchell, §9, p. 42], where the right and left global dimensions of a small additive `C` are those
of its two module categories). It needs no tensor product, so it is defined for every abelian
category. `Mod C` gives the global dimension `Abelian.globalDimension (ModCat C)`, the other side
`Abelian.globalDimension (ModCat Cᵒᵖ)`, and `ModuleCat A` the ring case. API:

- `projectiveDimension X ≤ globalDimension 𝒜`
  (`TauCeti.Abelian.projectiveDimension_le_globalDimension`), `globalDimension 𝒜 ≤ n` exactly when
  every object has projective dimension `≤ n` (`TauCeti.Abelian.globalDimension_le_iff`), and
  `globalDimension 𝒜 = ⊥` exactly when every object is zero
  (`TauCeti.Abelian.globalDimension_eq_bot_iff`); all three have proofs in `Suggested.lean`;
- injective dimension (`TauCeti.Abelian.globalDimension_eq_iSup_injectiveDimension`): the same
  supremum over `injectiveDimension`, since both say that `Ext^i` vanishes above the bound; and
  `globalDimension 𝒜ᵒᵖ = globalDimension 𝒜` (`TauCeti.Abelian.globalDimension_opposite`; [Mitchell,
  §9, p. 42]);
- invariance under equivalence (`TauCeti.Abelian.globalDimension_eq_of_equivalence`), from Tau
  Ceti's `CategoryTheory.Equivalence.projectiveDimension_functor_obj`.

**Auslander's lemma for `Mod C`** (`TauCeti.ModCat.globalDimension_le_iff_cyclic`).
`Abelian.globalDimension (ModCat C) ≤ n` exactly when every cyclic module `Hom(-, X) ⧸ I`, for any
subfunctor `I ⊆ Hom(-, X)`, has projective dimension `≤ n` ([Au, Thm. 1, p. 68] for rings). Route:
global dimension `≤ n` means injective dimension `≤ n` for every module; for a module `E` take an
injective coresolution, which exists because `Mod C` is a Grothendieck category with enough
injectives (0.1), to the `n`-th cosyzygy `E'`; `E'` is injective exactly when it passes the Baer
test of 2.2, that is, `Ext^1(Hom(-, X) ⧸ I, E') = 0`, which is `Ext^{n+1}(Hom(-, X) ⧸ I, E) = 0`.
For `Mod Cᵒᵖ` this is the same statement over `Cᵒᵖ`, with the cyclic covariant functors
`Hom(X, -) ⧸ I`. The refinements over finite and over cyclic modules of Tau Ceti's
`TauCeti.globalDimension_le_tfae`, `globalDimension_eq_iSup_cyclic` and
`globalDimension_eq_iSup_finite` become corollaries for `C = SingleObj Aᵐᵒᵖ`.

- **Universe independence** (`TauCeti.ModCat.globalDimension_eq_globalDimension`): for `C`
  essentially small in two universes, both global dimensions are computed on the cyclic modules
  of a small model, which live in one universe; this is the categorical form of Tau Ceti's
  `TauCeti.globalDimension_eq_globalDimension`.

**Rings, refactor of main.** Tau Ceti's `TauCeti.globalDimension A`
(`⨆ M : ModuleCat.{v} A, projectiveDimension M`) is `Abelian.globalDimension (ModuleCat.{v} A)`
(`TauCeti.globalDimension_eq_abelianGlobalDimension`, proved in `Suggested.lean` through
`TauCeti.globalDimension_def`). When 3.2 lands, the ring definition becomes this special case, and
its API is restated as corollaries, with no compatibility shims; `TauCeti.globalDimension_le_tfae`
is re-proved through Auslander's lemma. Bridge
(`TauCeti.globalDimension_eq_globalDimension_singleObj`): `TauCeti.globalDimension A` is the global
dimension of `Mod (SingleObj Aᵐᵒᵖ)` (0.2).

*Needs:* 0.1 (enough injectives), 0.2, 2.2 (Baer); Mathlib `projectiveDimension`,
`projectiveDimension_le_iff`, `projectiveDimension_eq_bot_iff`, `injectiveDimension`, `Subobject`;
Tau Ceti `TauCeti.globalDimension`, `TauCeti.globalDimension_def`,
`CategoryTheory.Equivalence.projectiveDimension_functor_obj`.

### 3.3 Weak global dimension

(`TauCeti.ModCat.weakGlobalDimension C := ⨆ F : ModCat C, flatDimension F`.) It is defined for
small preadditive `C` and for rings; it needs the tensor product, so it is not defined for an
arbitrary abelian category. [OR, p. 103] defines the weak global dimension of a small preadditive
category by the vanishing of `Tor`, and notes that it does not depend on the base ring and that `X`
and `X°` have the same one. API:

- `weakGlobalDimension C ≤ n` exactly when `Tor_{n+1}` vanishes on all pairs
  (`TauCeti.ModCat.weakGlobalDimension_le_iff`);
- **symmetry** (`TauCeti.ModCat.weakGlobalDimension_op`):
  `weakGlobalDimension Cᵒᵖ = weakGlobalDimension C`, so it is also the supremum of the flat
  dimensions of the covariant functors. Route: the balance (1.3), with `ModCat.opOpEquiv` (0.5) to
  compare suprema, and the previous item ([Au, p. 70]; [Lam-LMR, (5.63), p. 185]; [OR, p. 103]);
- **universe-free tests** (`TauCeti.ModCat.weakGlobalDimension_le_tfae`): for `n : ℕ` the
  following are equivalent: `weakGlobalDimension C ≤ n`; every cyclic covariant functor
  `Hom(X, -) ⧸ I` with `I` finitely generated has flat dimension `≤ n`; every finitely presented
  covariant functor has flat dimension `≤ n` ([Lam-LMR, (5.69), p. 187], for cyclic right modules
  over a ring). By the definition of flat dimension, the second item tests `Tor` only between
  finitely presented cyclic modules on both sides. Route: the first item gives the third by
  symmetry, and the third gives the second; by 3.1 the second says
  `Tor_{n+1}(Hom(X, -) ⧸ I, F) = 0` for every module `F` of `Mod C`, which is
  `HasFlatDimensionLE F n`;
- **bounds** (`TauCeti.ModCat.weakGlobalDimension_le_globalDimension`,
  `TauCeti.ModCat.weakGlobalDimension_le_globalDimension_op`): the weak global dimension is at most
  both global dimensions (3.1 and symmetry; [Lam-LMR, (5.58), p. 184]);
- **from projective dimension**
  (`TauCeti.ModCat.weakGlobalDimension_le_of_forall_isFinitelyPresentedFunctor`): if every finitely
  presented covariant functor has projective dimension `≤ n`, then `weakGlobalDimension C ≤ n`
  (the tests and 3.1). Consumer: ArtinAlgebras §7.5 (Downstream consumers), whose hypothesis is on
  finitely presented right modules;
- **degenerate cases** (`TauCeti.ModCat.weakGlobalDimension_eq_bot_iff`,
  `TauCeti.ModCat.weakGlobalDimension_le_zero_iff`): `⊥` exactly when every object of `C` is
  zero (so every module is zero); `≤ 0` exactly when every module is flat, which holds exactly when
  `C` is von Neumann regular, every `α` having a `φ` with `α = α φ α` ([St, Thm. 4, p. 359], (a) ⇔
  (f′), for the representables as generators). A
  semisimple `C`, one of global dimension `0` ([Mitchell, §9, p. 42]), has weak global dimension
  `0` when it has a nonzero object.

**Rings** (`TauCeti.weakGlobalDimension A := ⨆ M : ModuleCat.{v} A, flatDimension M`), native:
`TauCeti.weakGlobalDimension_le_iff`, `TauCeti.weakGlobalDimension_mulOpposite`,
`TauCeti.weakGlobalDimension_le_globalDimension`,
`TauCeti.weakGlobalDimension_le_globalDimension_mulOpposite`, `TauCeti.weakGlobalDimension_le_tfae`
(finitely presented and cyclic right modules),
`TauCeti.weakGlobalDimension_le_of_forall_finitePresentation`,
`TauCeti.weakGlobalDimension_eq_bot_iff` (the zero ring) and
`TauCeti.weakGlobalDimension_eq_zero_of_isSemisimpleRing`. Equality with the categorical one
(`TauCeti.weakGlobalDimension_eq_weakGlobalDimension_singleObj`), through 0.2.

*Needs:* 1.3, 2.2, 3.1, 3.2; Mathlib `IsFinitelyPresentable`.

### 3.4 Auslander's theorem

Hypothesis: `C` is **Noetherian on the `Mod C` side**, that is, every representable `Hom(-, X)` is a
Noetherian object of `Mod C` (Mathlib's `IsNoetherianObject`: ascending chain condition on
subobjects). For `C = SingleObj Aᵐᵒᵖ`, `Hom(-, ∗)` is the regular left module, so this is
`IsNoetherianRing A`.

- **The `FP_∞` lemma**
  (`TauCeti.ModCat.flatDimension_eq_projectiveDimension_of_projectiveResolution`), a separate
  public target, with no Noetherian hypothesis. A module with a projective resolution by finitely
  generated projectives (objects of `proj C`, 0.8) has equal flat and projective dimension. Route:
  if the flat dimension is `n`, the `n`-th syzygy `coker(P_{n+1} → P_n)` is flat (3.1) and finitely
  presented, hence projective (2.2, through 1.4); so the projective dimension is at most `n`
  ([CE, VI, remark after Prop. 5.3, pp. 120–121], which allows a resolution by finitely generated
  projectives; [CE, VI, Exer. 3, p. 122] for finitely generated modules over a left Noetherian
  ring). Ring form (`TauCeti.flatDimension_eq_projectiveDimension_of_projectiveResolution`): a
  resolution by finite projectives. Over a left Noetherian ring every finite module has one
  (`TauCeti.flatDimension_eq_projectiveDimension_of_finite`, with
  `Module.finitePresentation_of_finite`).
- **Auslander's theorem** (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension`). If every
  `Hom(-, X)` is Noetherian, then `Abelian.globalDimension (ModCat C) = weakGlobalDimension C`
  ([Au, Thm. 4, p. 70]; [Lam-LMR, (5.59), p. 184], for rings, stated for right modules over a
  right Noetherian ring in Lam; applied to `Aᵐᵒᵖ`). Route: by 3.2 the global dimension
  is the supremum over the cyclic modules `Hom(-, X) ⧸ I`. When the representables are Noetherian,
  finite sums of representables are Noetherian objects, so their subobjects are finitely generated
  and the cyclic modules have resolutions by finitely presented projectives. The `FP_∞` lemma then
  gives projective dimension = flat dimension `≤ weakGlobalDimension C`; the other inequality is
  3.3. The other side (every `Hom(X, -)` Noetherian, global dimension of `Mod Cᵒᵖ`) is the theorem
  over `Cᵒᵖ` with 3.3's symmetry.

The categorical form has a source: [OR, Thm. 4.3, p. 103] (proof on p. 104) states that, when
`[X°, Mod K]` is locally coherent, the global dimension of the category of coherent functors
equals the weak global dimension of `X`, with "flat and finitely presented ⇒ projective" in the
proof; the statement here, for all modules of `Mod C` under Noetherian representables, is the
adaptation of [Au, Thm. 4] along the same lines. [Mitchell, §9, pp. 42–45] defines the global
dimensions of a small additive category and compares them with its matrix ring.

**Corollaries.**

- **The bound** (`TauCeti.ModCat.globalDimension_le_of_forall_isFinitelyPresentedFunctor`): if every
  `Hom(-, X)` is Noetherian and every finitely presented covariant functor has projective dimension
  `≤ n`, then `Abelian.globalDimension (ModCat C) ≤ n` (3.3 and the theorem). No Noetherian
  hypothesis on the other side. Ring form
  (`TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite`): ArtinAlgebras §7.5 uses
  it (Downstream consumers).
- **Symmetry** (`TauCeti.ModCat.globalDimension_op_eq_of_isNoetherianObject`): if every
  `Hom(-, X)` and every `Hom(X, -)` is a Noetherian object, the global dimensions of `Mod C` and
  `Mod Cᵒᵖ` agree ([Au, Cor. 5, p. 70]). For rings this is Tau Ceti's
  `TauCeti.globalDimension_mulOpposite`.

**Rings** (`TauCeti.globalDimension_eq_weakGlobalDimension`): for `[IsNoetherianRing A]` and
`[Small.{v} A]`, `globalDimension.{v} A = weakGlobalDimension.{v} A`.

**Downstream refactor of main's `TauCeti/RingTheory/GlobalDimension/MulOpposite.lean`.**
`TauCeti.globalDimension_le_globalDimension_mulOpposite`, `TauCeti.globalDimension_mulOpposite` and
`TauCeti.globalDimension_mulOpposite_of_moduleFinite` keep their statements (no users on main;
ArtinAlgebras §7.5 uses them). Their proofs are replaced by the weak-dimension route: Auslander's
theorem with the bounds and the symmetry of 3.3.
`TauCeti.hasInjectiveDimensionLE_characterModule_iff` is kept and re-proved as the case `R = ℤ`,
`E = ℚ ⧸ ℤ` of the duality of 3.1 with the `FP_∞` lemma.
`TauCeti/Algebra/Module/CharacterModule/MulOpposite.lean` stays (the Lambek test of 2.2 for
`ℚ ⧸ ℤ`).

*Needs:* 2.2, 2.3, 3.1–3.3; Mathlib `IsNoetherianObject`, `Module.finitePresentation_of_finite`; Tau
Ceti `TauCeti.globalDimension_mulOpposite` and the other declarations of
`TauCeti.RingTheory.GlobalDimension.MulOpposite` (refactor consumers).

### 3.5 Kernels of flat modules and countably presented flat modules

- **Kernels** (`TauCeti.ModCat.forall_flat_kernel_iff`). The flat modules of `Mod C` are closed
  under kernels exactly when `weakGlobalDimension C ≤ 2` ([CB, Thm. 2.3, p. 1651], for small
  additive `C` and contravariant functors, where both are also equivalent to a factorization
  property of `C`). Route: dimension shifting along `0 → ker f → F → F' → coker f → 0` and,
  conversely, along a projective presentation `0 → K → P_1 → P_0 → M → 0`.
- **Sequential colimits of projectives** (`TauCeti.ModCat.hasProjectiveDimensionLE_one_colimit`):
  the colimit of a sequence `D_0 → D_1 → ⋯` of projective modules has projective dimension `≤ 1`,
  by the telescope `0 → ⊕ D_i → ⊕ D_i → colim D → 0` of 2.5.
- **Countably presented flat modules** (`TauCeti.ModCat.Flat.hasProjectiveDimensionLE_one`): a
  flat module that is countably presented (Mathlib's `IsCardinalPresentable` at `ℵ₁`, 0.8) has
  projective dimension `≤ 1` ([Jensen, Lemma 2, pp. 98–100]; [Osofsky-Nagoya, Lemma 1.2, p. 316];
  [Mitchell, p. 49]).
  The regularity of `ℵ₁` that `IsCardinalPresentable` needs is Mathlib's
  `Cardinal.isRegular_aleph_one`, provided in `Suggested.lean` as a local instance, so the
  statement has no `Fact` binder. Route, by retracts: write `F` as a filtered colimit of finite
  sums of representables (2.3) and take a countable presentation `⊕_j Hom(-, Y_j) → ⊕_i Hom(-, X_i)
  → F → 0` (0.8). Build a sequence `k_0 → k_1 → ⋯` in the indexing category by recursion: at step
  `n` the `n`-th generator lifts to the stage (finite presentability of representables) and the
  `n`-th relation dies at the next stage. The lifted generators define `s : F → colim_n D_{k_n}`,
  and with the canonical `p : colim_n D_{k_n} → F` one has `s ≫ p = 𝟙`, checked on the generators.
  So `F` is a retract of the colimit of a sequence of projectives, which has projective dimension
  `≤ 1` by the previous item. No isomorphism between `F` and the sequential colimit is needed.
  [Mitchell, p. 50] says that Lazard gave "a slightly erroneous, but simpler proof" of the
  countable case ([Lazard, Thm. 3.2, p. 89]) and that Lazard communicated a correction; that the
  error lies in the extraction of a countable subsystem whose colimit is the whole module is this
  roadmap's reading, which the retract route avoids. Bass's module (2.5) is the example.
- **Pointer, not a target**: an `ℵ_n`-presented flat module has projective dimension `≤ n + 1`
  ([Simson, Thm. 2.12 (c), p. 98], for functor categories; for rings [Osofsky-Nagoya, Thm. 1.3,
  pp. 316–317], an `ℵ_k`-generated submodule `B` of a free `F` with `F ⧸ B` flat has projective
  dimension `≤ k`; [Mitchell, pp. 49–50], where the bound is called best possible in view of the
  directed functors of [Mitchell, §36, Thm. 36.8, p. 149]).

Ring forms of 3.5 come through 0.2 and are not stated separately. Equality of flat and projective
dimension over a perfect `C` is a condition of Theorem P and stays in Layer 4 (4.5).

*Needs:* 0.8, 2.3, 2.5, 3.1, 3.3; Mathlib `IsCardinalPresentable`, `Cardinal.isRegular_aleph_one`,
`colimit`, `kernel`, `Retract`.

**Checks.** In Lean (last section of `Suggested.lean`):

- a field has weak global dimension `0` (`TauCeti.weakGlobalDimension_field`) and the zero ring
  `⊥` (`TauCeti.weakGlobalDimension_punit`);
- `ℤ` has weak and global dimension `1` (`TauCeti.weakGlobalDimension_int`):
  `Tor_1^ℤ(ℤ ⧸ 2, ℤ ⧸ 2) ≠ 0`, and Tau Ceti's
  `TauCeti.globalDimension_eq_one_of_isPrincipalIdealRing`;
- `B = k[ε]/(ε²)` (Mathlib's `DualNumber k`) has weak and global dimension `⊤`
  (`TauCeti.weakGlobalDimension_dualNumber`; Layer 1 checks);
- `T₂(k)` (Mathlib's `Matrix.blockTriangularSubalgebra k k id` on `Fin 2`) has weak and global
  dimension `1` (`TauCeti.weakGlobalDimension_upperTriangular`): the semisimple quotient `T ⧸ J`,
  the sum of the two simple modules, is not flat, since one of its simple summands is finitely
  presented and not projective (2.6 checks), and `J` is projective (Layer 1 checks);
- the `k`-linear category of the quiver `0 → 1` (Mathlib's `CategoryTheory.Free k (Fin 2)`) has
  global dimension `1` (`TauCeti.globalDimension_free_fin_two`, for `Mod C`), through its category
  algebra `T₂(k)` (1.7; [Mitchell, §9, p. 45, (6)]: equality for finitely many objects).

In prose, with locators:

- Small's ring `R = [[ℤ, ℚ], [0, ℚ]]` is right Noetherian and right hereditary, not left
  hereditary: `globalDimension Rᵐᵒᵖ = weakGlobalDimension R = 1 < globalDimension R`
  ([Lam-LMR, (5.62b), p. 185]; the facts on `R` are [Lam-LMR, (2.33), pp. 46–47], "constructed by
  L. Small"; L. W. Small, *An example in Noetherian rings*, Proc. Nat. Acad. Sci. U.S.A. 54 (1965),
  1035–1036: Theorem, p. 1035, for `[[R, Q], [0, Q]]` with `R` a commutative Noetherian domain and
  `Q` its quotient field, right but not left Noetherian; the case `R = ℤ`, right hereditary and not
  left hereditary, p. 1036). Auslander's theorem applies to `Rᵐᵒᵖ`; for `R` it fails, so `R` is
  not left Noetherian.
- The free Boolean ring of Pierce, as cited by Osofsky: for a set `J` of cardinality `ℵ₂`, the free
  Boolean ring `B = 𝔽₂[x_j : j ∈ J] ⧸ (x_j² - x_j)` has weak global dimension `0` (it is von
  Neumann regular: every finitely presented module is projective, so 3.3 applies with `n = 0`) and
  global dimension `3`. For the ideal `I` generated by the `x_j`, [Osofsky-Card, Thm. A, p. 644]
  (with the definition of a nice family on p. 641) gives `pd I = 2`, so `pd(B ⧸ I) = 3`; the upper
  bound is [Osofsky-Nagoya, Cor. 1.4, p. 318]: `gldim R ≤ wgldim R + n + 1` when every right ideal
  is generated by at most `ℵ_n` elements, so `gldim B ≤ 3` ([Osofsky-Nagoya, p. 319], which credits
  Pierce for the free Boolean rings; [Pierce, Cor. 2.2, p. 92, and Cor. 5.2, p. 97]: the free
  Boolean ring on `ℵ_n` generators has global dimension `n + 1`). So Auslander's theorem needs
  the Noetherian hypothesis.
- Jategaonkar's rings: for each `1 ≤ n ≤ ∞` there is a principal left ideal domain `D` with right
  global dimension `n` ([Jategaonkar, Thm. 4.10, pp. 438–439]). `D` is left Noetherian with left
  global dimension `1`, so `weakGlobalDimension D = 1`; for `n ≥ 2` the right global dimension
  differs. The symmetry corollary needs both Noetherian hypotheses.
- The `k`-linear category of the linear quiver `0 → 1 → 2 → ⋯` is hereditary on both sides, so
  its global and weak global dimensions are `1`; the Bass module of 2.5 is flat, not projective,
  with projective dimension `1` (telescope).

### Examples

Fields, `ℤ`, `k[ε]/(ε²)`, `T₂(k)` and the quiver category of `0 → 1`; Small's ring, the free Boolean
ring of Pierce and Jategaonkar's rings as limits of the hypotheses; quiver categories, which are
hereditary.

### Dependencies

Layers 1 and 2.

## Layer 4: semiperfect and perfect categories, and Bass's Theorem P

Throughout, `C : Type u` is preadditive with `Category.{v} C`. `J(C)` is Tau Ceti's radical
`TauCeti.jacobsonRadicalIdeal C`, whose value at `(X, X)` is `Ring.jacobson (End X)`
(`TauCeti.jacobsonRadical_self_eq_jacobson`), and `C ⧸ J(C)` is Tau Ceti's quotient category
`(TauCeti.jacobsonRadicalIdeal C).Quotient`. Modules are the modules of `Mod C`, contravariant
functors. [Simson] and [Harada, Part I, Thm. 5] work with covariant modules; their statements are
applied to `Cᵒᵖ` (Convention 14). Where a statement needs colimits of modules indexed by the objects
of `C`, the hypothesis is `EssentiallySmall.{w} C` with modules in the universe `w`;
`Suggested.lean` states the theorems in the universe `v`, where the representables and Bass's
modules (2.5) live. Projective covers are essential epimorphisms from projective objects (Convention
12). Items 4.1–4.6 end with their ring statements, which are derived from the categorical ones
through `SingleObj Aᵐᵒᵖ` (0.2). The categorical statements are adaptations of the ring theorems
cited with them, unless a categorical source is named; the summit is [Simson, Thm. 5.4, p. 108].

**The direction of T-nilpotence.** In `SingleObj Aᵐᵒᵖ`, Mathlib's `f ≫ g = g * f` (in `Aᵐᵒᵖ`) is `op
(unop f * unop g)`, so for `fᵢ = op aᵢ` the composite `f₀ ≫ ⋯ ≫ fₙ₋₁` is `op (a₀ a₁ ⋯ aₙ₋₁)`.
Nakayama's lemma for `Mod C` needs sequences `c₀ → c₁ → ⋯` with composites `c₀ → cₙ` (4.1), and at
`SingleObj Aᵐᵒᵖ` these composites are Bass's products `a₀ a₁ ⋯ aₙ₋₁`: left T-nilpotence, which goes
with left modules ([Bass, p. 466]; [Lam-FC, (23.16)], right-handed). The ideal there is a left
ideal: `I · M` and Bass's module need only `h ≫ f ∈ I` for `f ∈ I`, and at `SingleObj Aᵐᵒᵖ`, `h ≫ f
= op (unop h * unop f)`, so these are the left ideals of `A` (0.3). In `End X`, with Mathlib's
multiplication `f * g = g ≫ f`, the composite is the product `fₙ₋₁ ⋯ f₀`; for `SingleObj Aᵐᵒᵖ`, `End
∗ = Aᵐᵒᵖ`, and this product is again `op (a₀ ⋯ aₙ₋₁)`.

### 4.1 T-nilpotence and Nakayama's lemma for all modules

(`TauCeti.LeftMorphismIdeal.IsTNilpotent I`.) A left ideal `I` of `C` (0.3) is **T-nilpotent** if
every sequence `c₀ → c₁ → ⋯` with all `fᵢ : cᵢ → cᵢ₊₁` in `I` has a vanishing composite
`q_n = f₀ ≫ ⋯ ≫ f_{n-1} : c₀ → c_n` (Convention 8). For `C = SingleObj Aᵐᵒᵖ`,
`q_n = op (a₀ a₁ ⋯ a_{n-1})`, Bass's left T-nilpotence. A two-sided ideal, such as `J(C)`, enters
through the coercion of 0.3. The other side is T-nilpotence of the left ideal `I.op` of `Cᵒᵖ` for a
right ideal `I` of `C` (`TauCeti.RightMorphismIdeal.op`; for a two-sided ideal, Tau Ceti's
`TauCeti.MorphismIdeal.op I`), that is, of the chains `c₀ ← c₁ ← ⋯`; this is the left T-nilpotence
of [Simson, p. 108], stated for covariant modules. The predicate is named after neither side. API:
monotone in `I`; a nilpotent two-sided ideal (`I ^ n = ⊥`, with Tau Ceti's monoid of ideals) is
T-nilpotent, and so is its opposite (`TauCeti.MorphismIdeal.isTNilpotent_of_pow_eq_bot`,
`TauCeti.MorphismIdeal.isTNilpotent_op_of_pow_eq_bot`).

`I · M` is the subobject of 0.3 (`TauCeti.LeftMorphismIdeal.smul I M`), a submodule because `I` is
closed under precomposition; for the left ideal of `SingleObj Aᵐᵒᵖ` given by a left ideal `J` of
`A` it is `J • ⊤`. It is **superfluous** in `M` when it is a superfluous element of the lattice
`Subobject M` (`TauCeti.IsSuperfluous`, 0.3): `I · M ⊔ N = ⊤` forces `N = ⊤`.

**Nakayama's lemma for all modules** (`TauCeti.LeftMorphismIdeal.isTNilpotent_tfae`). For a left
ideal `I` of `C`, the following are equivalent:

1. `I` is T-nilpotent;
2. for every module `M` of `Mod C`, `I · M = M` implies `M = 0`;
3. for every module `M` of `Mod C`, `I · M` is superfluous in `M`.

Route. (1) ⇒ (2) by dependent choice: if `I · M = M` and `x₀ ∈ M(c₀)` is nonzero, choose
`x_n ∈ M(c_n)` with `M(q_n)(x_n) ≠ 0` inductively: write `x_n` as a sum of elements `M(f)(y)` with
`f ∈ I(c_n, d)`; since `M(q_n)(x_n) ≠ 0`, some summand keeps `M(q_n ≫ f)(y) ≠ 0`, which gives
`f_n = f` and `x_{n+1} = y`; so no `q_n` vanishes. [Simson, Lemma 5.3, p. 108] states the direction
(1) ⇒ (2) for `J(C)`, on `Cᵒᵖ`, with the remark that Bass's arguments generalize; Bass uses König's
graph theorem ([Bass, pp. 473–474]). The dependent-choice proof, the general left ideal and the
converse are this roadmap's adaptation. (2) ⇔ (3) as usual, through the cokernel of `N ⟶ M`.
(2) ⇒ (1) through Bass's module `B` of an `I`-sequence (2.5): `B ≠ 0` while no `q_n` vanishes,
since the class of `𝟙 c₀` is `q_n` at stage `n`; and `B = I · B`, since the class of `g : d → cᵢ`
is that of `g ≫ fᵢ`, the image of the class of `𝟙 cᵢ₊₁` under `B(g ≫ fᵢ)` with `g ≫ fᵢ ∈ I`. The
proofs use only closure under precomposition: `M(h)(M(f)(x)) = M(h ≫ f)(x)` in (1) ⇒ (2), and
`g ≫ fᵢ ∈ I` in (2) ⇒ (1). With the lemma of 2.5 (a Bass module is zero exactly when every tail of
its sequence has a zero composite), `I` is T-nilpotent exactly when the Bass modules of all
`I`-sequences vanish (`TauCeti.LeftMorphismIdeal.isTNilpotent_iff_forall_isZero_bassModule`).

(1) ⇒ (2) and (1) ⇒ (3) hold in every universe, with no smallness
(`TauCeti.LeftMorphismIdeal.IsTNilpotent.isZero_of_smul_eq_top`,
`TauCeti.LeftMorphismIdeal.IsTNilpotent.isSuperfluous_smul`). (2) ⇒ (1) in the universe `w` uses
`EssentiallySmall.{w} C` for Bass's module; `Suggested.lean` states the equivalence in the universe
`v`, where no hypothesis is needed. The two-sided radical `J(C)` is the case used in 4.3–4.6.

**Rings** (`TauCeti.IsLeftTNilpotent (S : Set A)`): for every `a : ℕ → A` with values in `S` there
is `n` with `(List.ofFn fun i : Fin n ↦ a i).prod = 0`. API: monotone in `S`
(`IsLeftTNilpotent.mono`); a nilpotent ideal is left T-nilpotent
(`TauCeti.isLeftTNilpotent_of_isNilpotent`); every element of a left T-nilpotent set is nilpotent
(`IsLeftTNilpotent.isNilpotent`); images under ring homomorphisms (`IsLeftTNilpotent.image`).
Bridges: for any left ideal `J : Ideal A`, left T-nilpotence of `J` is T-nilpotence of the left
ideal `idealOrderIsoLeftMorphismIdeal A J` of `SingleObj Aᵐᵒᵖ`
(`TauCeti.isLeftTNilpotent_iff_isTNilpotent_singleObj`), since the composite of
`op a₀, …, op a_{n-1}` is `op (a₀ ⋯ a_{n-1})`; and the radical `J(SingleObj Aᵐᵒᵖ)`, as a left
ideal, is that of `Ring.jacobson A`
(`TauCeti.toLeftMorphismIdeal_jacobsonRadicalIdeal_singleObj`; `End ∗ = Aᵐᵒᵖ` and Tau Ceti's
`TauCeti.Ring.mem_jacobson_mulOpposite_iff`). The ring form of Nakayama's lemma
(`TauCeti.isLeftTNilpotent_tfae`; [AF, 28.3, pp. 314–315], any left ideal; [Lam-FC, (23.16),
p. 352], right-handed) is the case of the categorical TFAE for the left ideal
`idealOrderIsoLeftMorphismIdeal A J` of `SingleObj Aᵐᵒᵖ`, through 0.2, where `I · M` is `J • ⊤`:
for a left ideal `J`, `J` is left T-nilpotent; `J • ⊤ = ⊤` implies `M = 0` for every module `M` in
the universe of `A`; `J • ⊤` is superfluous in every such `M`; `J • ⊤` is superfluous in
`ℕ →₀ A`. The last item is the free module through which Bass's module is a quotient. The forward
direction holds in every universe (`IsLeftTNilpotent.isSuperfluous_smul_top`).

**Checks.** The ideal `(X)` of `PowerSeries k` is not left T-nilpotent
(`TauCeti.not_isLeftTNilpotent_span_X`). In `F = ℕ →₀ PowerSeries k`, the submodule `G` spanned by
the `eᵢ - X • eᵢ₊₁` satisfies `G + X • F = F` and `G ≠ F` (`F ⧸ G` is Bass's module, the Laurent
series field), so `X • F` is not superfluous, as the last item predicts. The categorical check is
the linear `A_∞` category of the Layer 4 checks.

*Needs:* 0.3 (one-sided ideals, `I · M`), 2.5; Tau Ceti `TauCeti.MorphismIdeal`,
`TauCeti.MorphismIdeal.op`, the monoid of ideals
(`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul`),
`TauCeti.Ring.mem_jacobson_mulOpposite_iff`; Mathlib `Functor.ofSequence`.

### 4.2 Semilocal and semiperfect rings and categories

**Semilocal rings** (`TauCeti.IsSemilocalRing R`), a class with field
`isSemisimpleRing : IsSemisimpleRing (R ⧸ Ring.jacobson R)`, also an instance. Mathlib has no
semilocal rings. API: the instance for `Rᵐᵒᵖ` (proved in `Suggested.lean` from Tau Ceti's
`TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`); surjective images
(`TauCeti.IsSemilocalRing.of_surjective`); a commutative ring is semilocal exactly when it has
finitely many maximal ideals (`TauCeti.isSemilocalRing_iff_finite_isMaximal`). The ladder is
Mathlib's `IsSemiprimaryRing` ⇒ `IsLeftPerfectRing` (4.3) ⇒ `TauCeti.IsSemiperfectRing` ⇒
`IsSemilocalRing`. The last step is an instance here; it becomes the `extends` projection when
Tau Ceti's `TauCeti.IsSemiperfectRing` is refactored to `extends IsSemilocalRing` (Downstream
consumers). Risk: a future commutative Mathlib `IsSemilocalRing` (finitely many maximal ideals)
would be reconciled through the commutative characterization.

**Semilocal categories** (`TauCeti.IsSemilocalCategory C`): every `End X` is semilocal. Target
(`TauCeti.isSemilocalCategory_iff_isSemisimpleCategory`): `C` is semilocal exactly when `C ⧸ J(C)`
is semisimple in Simson's sense (`TauCeti.IsSemisimpleCategory`: every representable `Hom(-, X)` is
a semisimple module, that is, its subobjects are complemented, `TauCeti.ModCat.IsSemisimple`;
[Simson, p. 93], stated for covariant modules and applied to `Cᵒᵖ`; by [Simson, Cor. 1.3 (a),
p. 94], `C` is semisimple exactly when `Cᵒᵖ` is). Route: [Simson, Prop. 1.2, p. 93]: a small
preadditive category is semisimple exactly when it is von Neumann regular (every `f` has a `g` with
`f = f g f`) and every `End X` is semisimple; the two radical lemmas below; and regularity. The
**radical of `C ⧸ J(C)`** is zero
(`TauCeti.jacobsonRadicalIdeal_quotient_jacobsonRadicalIdeal`: for `f` in the radical of the
quotient, `1 - g ≫ f` is invertible for every `g`, and invertibility lifts along the full quotient
functor), and **`End_{C ⧸ J}(X) ≅ End X ⧸ Ring.jacobson (End X)`**
(`TauCeti.endQuotientJacobsonRadicalIdealRingEquiv`, from Tau Ceti's
`TauCeti.jacobsonRadical_self_eq_jacobson`); neither is in Tau Ceti. Regularity of `D = C ⧸ J(C)`
(`TauCeti.IsSemilocalCategory.exists_comp_comp_eq_self`; **agent-proved**, not from a source): for
`f : X → Y` in `D`, the left ideal `{g ∘ f}` of the semisimple ring `End_D(X)` is `End_D(X) e` with
`e = g₀ ∘ f` idempotent; then `u = f ∘ (1 - e)` satisfies `g ∘ u = (g ∘ f)(1 - e) = 0` for every
`g : Y → X`, so `u` is radical in `D`; the radical of `D` is zero; so `f = f ∘ e = f ∘ g₀ ∘ f`.
`Cᵒᵖ` is semilocal with `C` (an instance; `End (op X) = (End X)ᵐᵒᵖ`).

**Semisimple modules** (`TauCeti.ModCat.isSemisimple_iff_exists_iso_sigma`,
`TauCeti.isSemisimpleCategory_iff_forall_isSemisimple`): a module with complemented subobjects is a
direct sum of simple modules, and `C` is semisimple exactly when every module of `Mod C` is. Route:
`Subobject M` is a modular, compactly generated complete lattice (0.1), so Mathlib's `IsAtomistic`
and `exists_sSupIndep_of_sSup_atoms` give independent atoms with supremum `⊤`; atoms are simple
subobjects (Mathlib's `subobject_simple_iff_isAtom`), and the sum map of an independent family is a
monomorphism (AB4). 4.4 and 4.5 use these for `C ⧸ J(C)`.

**Semiperfect categories** (`TauCeti.IsSemiperfectCategory C`, `extends IsSemilocalCategory C`, with
field: every `End X` is semiperfect; compare [Simson, Thm. 5.6 (b), (c), p. 110]). Instances: from
perfect categories (4.3), from Krull–Schmidt categories
(`TauCeti.IsKrullSchmidt.isSemiperfectCategory`, from Tau Ceti's
`TauCeti.IsKrullSchmidt.isSemiperfectRing_end`), and `IsSemiperfectCategory Cᵒᵖ` from
`IsSemiperfectCategory C` (`End (op X) = (End X)ᵐᵒᵖ` and `TauCeti.IsSemiperfectRing.mulOpposite`),
next to the semilocal one. **Krause's criterion with the class**
(`TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory`): a category with
finite biproducts is Krull–Schmidt exactly when idempotents split and it is semiperfect. This
restates main's `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end` with the
class; a downstream refactor, with no alias. It is proved in `Suggested.lean` from main's statement.

Small targets: finitely generated modules (0.8); `TauCeti.IsSemiperfectRing.mulOpposite` (an
instance: semiperfectness is left-right symmetric; used for `Cᵒᵖ`, since `End (op X) = (End X)ᵐᵒᵖ`);
`TauCeti.IsKrullSchmidt Cᵒᵖ` (an instance, by Krause's criterion on both sides; with the instance
`HasFiniteBiproducts Cᵒᵖ`, which Mathlib does not register, proved in `Suggested.lean` from
`HasFiniteBiproducts.of_hasFiniteProducts`); corners (`TauCeti.IsSemiperfectRing.corner`: `eRe` is
semiperfect for an idempotent `e` of a semiperfect `R`, on Mathlib's `IsIdempotentElem.Corner`).

**Semiperfect categories by projective covers** (`TauCeti.isSemiperfectCategory_tfae`;
`TauCeti.HasProjectiveCover M`: an essential epimorphism onto `M` from a projective object). The
following are equivalent ([Simson, Thm. 5.6, p. 110], for 1 ⇔ 3, covariant, applied to `Cᵒᵖ`;
items 2, 4 and 5 adapt [Krause, Prop. 4.1], stated for rings and right modules):

1. `C` is semiperfect;
2. every `Hom(-, X)` is a finite sum of projective modules with local endomorphism rings;
3. every finitely generated (0.1) module of `Mod C` has a projective cover;
4. every simple module of `Mod C` has a projective cover;
5. `proj C` (0.8) is Krull–Schmidt.

Route: as for rings below, with `End Hom(-, X) = End X` (Yoneda, 0.8). (1) ⇔ (5): `proj C` has
finite biproducts and split idempotents (0.8), so Krause's criterion applies; a finite sum of
representables has a semiperfect endomorphism ring, since `1` is a sum of orthogonal local
idempotents (`TauCeti.IsSemiperfectRing.of_isLocalRing_corner`), and every object of `proj C` is a
summand of one, whose endomorphism ring is a corner. Theorem P uses only (1) and (4).

**Covers of simple modules** (`TauCeti.ModCat.hasProjectiveCover_of_simple`), directly through a
summand of a representable, not through `Karoubi`: a simple `S` has `S(X) ≠ 0` for some `X`; write
`1 = e₁ + ⋯ + eₙ` in `End X` with local corners; some `S(eᵢ)` does not kill a nonzero `x ∈ S(X)`,
and the summand `{g ≫ eᵢ}` of `Hom(-, X)` (for rings, `A eᵢ`), projective with local endomorphism
ring `eᵢ (End X) eᵢ`, maps onto `S`; a surjection from a projective with local endomorphism ring
onto a nonzero module is a cover (as for rings).

**Representable covers.** Tau Ceti main's `TauCeti.IsRepresentableProjectiveCover` (an epimorphism
`Hom(-, P) → F` that is right minimal) is related to the covers here by a target: for
`p : Hom(-, P) → F` in `Mod C`, `IsRepresentableProjectiveCover p ↔ TauCeti.IsEssentialEpi p`. Then
main's existence theorem `TauCeti.IsKrullSchmidt.exists_isRepresentableProjectiveCover` is the
Krull–Schmidt case of (3) above, a refactor consumer, and main's tops
(`TauCeti.isRepresentableProjectiveCover_preadditiveYonedaMap_jacobsonRadicalIdeal`,
`TauCeti.simple_comp_preadditiveYoneda_obj_quotientFunctor_jacobsonRadicalIdeal`) are the covers of
the simple modules `Hom(-, X) ⧸ J(-, X)` for local `End X`.

**The radical of a projective module** (`TauCeti.ModCat.jacobson_smul_ne_top_of_projective`,
`TauCeti.ModCat.le_jacobson_smul_of_isSuperfluous`), for any `C` and with no condition on the
radical: a nonzero projective `P` of `Mod C` has `J(C) · P ≠ P`, and every superfluous subobject of
a projective `P`, in particular the kernel of a projective cover, lies in `J(C) · P`. Route: `P` is
a retract of a sum of representables (0.1); `J(C)(-, X)` is the intersection of the maximal
subobjects of `Hom(-, X)`, this passes to sums and summands, and a superfluous subobject lies in
every maximal subobject. These are the categorical forms of the ring items below ([Lam-FC, (24.7)];
[Bass, Prop. 2.7, p. 474]; [Sandomierski, Prop. 1 (d), p. 205]); Theorem P (2′ ⇒ 1) and 4.6 use
them, and they hold without the T-nilpotence that 4.1 would need.

**Rings.** Here `R` is a ring and `J = Ring.jacobson R`. The ring items stay native. The categorical
TFAE above is proved first, and the ring TFAE is derived from it through `SingleObj Rᵐᵒᵖ` (0.2),
with Tau Ceti's `TauCeti.finiteProjectiveModules R` identified with `proj (SingleObj Rᵐᵒᵖ)`
(`TauCeti.finiteProjectiveModulesEquivProj`, 0.8).

- **Covers of projective modules** (`TauCeti.IsProjectiveCover.bijective_of_projective`). A
  projective cover of a projective module is bijective: compare it with the identity cover by
  `TauCeti.IsProjectiveCover.bijective_of_comp_eq`.
- **Local projectives** (`TauCeti.isProjectiveCover_of_isLocalRing_end`). A surjection from a
  projective module with local endomorphism ring onto a nonzero module is a projective cover
  (`Module.Projective.sup_ne_top_of_isLocalRing_end`).
- **Covers of simple modules are local** (`TauCeti.IsProjectiveCover.isLocalRing_end`). If
  `p : P → S` is a projective cover of a simple module, then every proper submodule of `P` lies in
  `ker p`, and `Module.End R P` is local: an onto endomorphism has superfluous kernel, so it is a
  cover of `P` and hence bijective ([Krause, Lemma 3.6]; [Wisbauer, 19.7, p. 161]).
- **Moving covers between universes**
  (`TauCeti.IsProjectiveCover.exists_isProjectiveCover_comp_subtype`). If `M` has a projective
  cover `f`, every surjection `g : Q → M` from a projective module restricts to a projective cover
  on a submodule of `Q`: lift `f` through `g`, split the lift, and transport the kernel along the
  splitting (`TauCeti.isSuperfluous_map_equiv_iff`).
- **Radical of a projective module** (`TauCeti.jacobson_eq_jacobson_smul_top_of_projective`,
  `TauCeti.jacobson_ne_top_of_projective`). For a projective left module `P`,
  `Module.jacobson R P = J • ⊤`, and `Module.jacobson R P ≠ ⊤` when `P` is nonzero ([Lam-FC, (24.7),
  p. 360]; [Sandomierski, Prop. 1 (d), p. 205]).
- **Covers from covers of simple quotients**
  (`TauCeti.exists_isProjectiveCover_pi_of_forall_isCoatom_exists_isProjectiveCover`). Let `M` be
  finitely generated, and suppose every simple quotient `M ⧸ N` has a projective cover with source
  in a universe `w`. Then `M` has a projective cover `f : P₁ × ⋯ × Pₙ → M` whose components lift
  covers `pᵢ : Pᵢ → M ⧸ Nᵢ` of simple quotients. Route: the images of lifts of covers of simple
  quotients generate `M` (a proper submodule lies in a maximal one); `⊤` is compact, so finitely
  many of them suffice, and an irredundant finite choice gives a superfluous kernel ([Wisbauer,
  18.5 (1), p. 152], for the generation step; [Azumaya, Lemma 1, pp. 118–119], for the replacement
  argument with local endomorphism rings; [Nicholson, Cor. 2, p. 79]: a finitely generated
  projective module is semiperfect exactly when each simple quotient has a cover). The finite family
  is extracted with `IsCompactElement` and `Submodule.fg_iff_compact`; finite suprema and finite
  products of superfluous submodules are superfluous, and these two closure facts are part of this
  item.
- **Covers over a semiperfect ring** (`TauCeti.exists_isProjectiveCover_of_isSemiperfectRing`).
  Over a semiperfect ring every finitely generated left module has a projective cover with source
  in the universe of `R` ([Lam-FC, (24.12), p. 362]; [Bass, Thm. 2.1, p. 471]). Route: by
  `TauCeti.IsSemiperfectRing.exists_completeOrthogonalIdempotents_isLocalRing_corner`, `1` is a sum
  of orthogonal idempotents `eᵢ` with local corners; a simple module is a quotient of some `Reᵢ`
  (`CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`), which is projective with
  local endomorphism ring, so the quotient map is a cover; then the previous item.
- **Decomposition** (`TauCeti.IsSemiperfectRing.of_linearEquiv_pi`). If `R ≃ₗ[R] P₁ × ⋯ × Pₙ`
  with every `Module.End R Pᵢ` local, then `R` is semiperfect: the images of the coordinate
  idempotents are orthogonal idempotents with local corners, and
  `TauCeti.IsSemiperfectRing.of_isLocalRing_corner` applies.
- **Semiperfect rings by projective covers** (`TauCeti.isSemiperfectRing_tfae`). The following are
  equivalent ([Sandomierski, Thm. 4, p. 206], which generalizes Koh's commutative case, cited on
  p. 205: "every simple right module has a projective cover"; [Krause, Prop. 4.1]; [Lam-FC, (24.16),
  p. 364], whose item (3) is "every cyclic right module has a projective cover"; [Müller, §3,
  pp. 464–467], a short proof of the simple-cover criterion):
  1. `R` is semiperfect;
  2. `R`, as a left module over itself, is a finite product of projective modules with local
     endomorphism rings;
  3. every finitely generated left module `M : Type u` has a projective cover;
  4. every simple left module `S : Type u` has a projective cover;
  5. the finitely generated projective modules (Tau Ceti's `TauCeti.finiteProjectiveModules R`,
     that is, `proj (SingleObj Rᵐᵒᵖ)`) form a Krull–Schmidt category.

  Route: (1) ⇒ (3) is the previous item, (3) ⇒ (4) is immediate, (4) ⇒ (2) applies the cover
  from simple quotients to `M = R`, which is bijective because `R` is projective, with local
  factors because each is the cover of a simple module; (2) ⇒ (1) is the decomposition item;
  (1) ⇔ (5) is Krause's criterion, as in the categorical item.
- **Minimal presentations** (`TauCeti.FiniteProjectivePresentation.exists_isMinimal`, with weaker
  hypotheses). A finitely presented module `M : ModuleCat.{v} R` over a semiperfect ring with
  `[Small.{v} R]` has a finite minimal projective presentation
  (`TauCeti.IsMinimalProjectivePresentation`). Route: cut a cover of `M` out of a finite free
  presentation in the universe `v` (moving covers between universes); its kernel is finitely
  generated because `M` is finitely presented, so it also has a cover; then
  `TauCeti.IsProjectiveCover.isMinimalProjectivePresentation`. The statement replaces the present
  one, whose hypotheses are a semiprimary Noetherian ring and a finitely generated module; that
  case follows, since such a ring is semiperfect and such a module is finitely presented
  (`Module.finitePresentation_of_finite`).
- **Commutative rings** (`TauCeti.isSemiperfectRing_iff_exists_ringEquiv_pi`): a commutative ring
  is semiperfect exactly when it is a finite product of local rings ([Lam-FC, (23.11), p. 350]).
  Route: the orthogonal idempotents with local corners of Tau Ceti's
  `TauCeti.IsSemiperfectRing.exists_completeOrthogonalIdempotents_isLocalRing_corner` are central,
  and each corner is a local ring.

**Checks.**

- `ℤ` is not semiperfect (`TauCeti.not_isSemiperfectRing_int`): the kernel of a projective cover
  `P → ℤ ⧸ 2` would lie in `Module.jacobson ℤ P = J • P = 0`, so `ℤ ⧸ 2` would be projective
  ([Sandomierski, Lemma 2, p. 205]).
- `PowerSeries k` is local, so semiperfect, and the cover of `k` is `PowerSeries k → k`.
- For the upper triangular algebra `T₂(k)`, `T₂(k) = T e₁₁ × T e₂₂` is the decomposition of
  item (2), and the two simple modules have covers `T e₁₁` and `T e₂₂`.

*Needs:* 0.1, 0.3, 0.8, 4.1; Tau Ceti `TauCeti.IsSemiperfectRing`, the idempotent results listed
in "From Tau Ceti", `TauCeti.IsKrullSchmidt` with Krause's criterion, `TauCeti.IsEssentialEpi`,
`TauCeti.IsProjectiveCover` and its API, `TauCeti.FiniteProjectivePresentation`,
`TauCeti.IsMinimalProjectivePresentation`, `TauCeti.MorphismIdeal.Quotient`,
`TauCeti.jacobsonRadical_self_eq_jacobson`,
`TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`; Mathlib `IsCompactElement`,
`Submodule.fg_iff_compact`, `isSimpleModule_iff_isCoatom`, `Module.jacobson`, `Subobject`,
`ComplementedLattice`, `IsAtomistic`, `exists_sSupIndep_of_sSup_atoms`,
`subobject_simple_iff_isAtom`, `Simple`, `IsIdempotentElem.Corner`,
`HasFiniteBiproducts.of_hasFiniteProducts`.

### 4.3 Perfect categories and left perfect rings

(`TauCeti.IsPerfectCategory C`, `extends IsSemilocalCategory C`, with field
`isTNilpotent : (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).IsTNilpotent`.) By 4.2 this
is
Simson's condition for `Cᵒᵖ`: `J(C)` is T-nilpotent and `C ⧸ J(C)` is semisimple ([Simson, Thm. 5.4
(7)]). By Theorem P (4.5), `IsPerfectCategory C` says that `Mod C` is perfect: every module has a
projective cover. The other side is `IsPerfectCategory Cᵒᵖ`. The name carries no "left" or
"right", for the reason of Convention 8. API:

- an instance `IsPerfectCategory C → IsSemiperfectCategory C`: `Ring.jacobson (End X) = J(C)(X, X)`
  is T-nilpotent, hence nil, so idempotents lift (`exists_isIdempotentElem_eq_of_ker_isNilpotent`;
  [Lam-FC, (23.19), p. 353]);
- a semilocal category with nilpotent radical is perfect on both sides
  (`TauCeti.IsPerfectCategory.of_pow_eq_bot`, `TauCeti.IsPerfectCategory.op_of_pow_eq_bot`; 4.1).
  There is no class of semiprimary categories; this is the pointer.

**Rings** (`TauCeti.IsLeftPerfectRing A`, `extends IsSemilocalRing A`, with field
`isLeftTNilpotent : IsLeftTNilpotent (Ring.jacobson A : Set A)`). Right perfect is
`IsLeftPerfectRing Aᵐᵒᵖ`. API:

- bridge (`TauCeti.isLeftPerfectRing_iff_singleObj`): `IsLeftPerfectRing A ↔ IsPerfectCategory
  (SingleObj Aᵐᵒᵖ)`, with `q_n = op (a₀ ⋯ a_{n-1})` (4.1);
- instances `IsSemiprimaryRing A → IsLeftPerfectRing A`
  (`TauCeti.IsLeftPerfectRing.of_isSemiprimaryRing`; [Lam-FC, (23.19), p. 353]) and
  `IsLeftPerfectRing A → TauCeti.IsSemiperfectRing A`
  (`TauCeti.IsLeftPerfectRing.isSemiperfectRing`; the radical is nil, so idempotents lift by
  `exists_isIdempotentElem_eq_of_ker_isNilpotent`; [Lam-FC, (23.19)]). With Tau Ceti's instance
  `TauCeti.IsSemiprimaryRing.mulOpposite`, a semiprimary ring is perfect on both sides, and with
  Mathlib's instance `IsArtinianRing → IsSemiprimaryRing` so is a left Artinian ring;
- right Artinian rings (`TauCeti.IsLeftPerfectRing.of_isArtinianRing_mulOpposite`): `IsArtinianRing
  Aᵐᵒᵖ` makes `Aᵐᵒᵖ` semiprimary, hence `A` semiprimary by Tau Ceti's
  `TauCeti.isSemiprimaryRing_mulOpposite_iff`, hence left perfect;
- **endomorphism rings of modules of finite length** (an instance
  `TauCeti.Module.End.isSemiprimaryRing` for `[IsNoetherian R M] [IsArtinian R M]`):
  `Module.End R M` is semiprimary, by Fitting's lemma (the radical is nilpotent) and the
  Krull–Schmidt decomposition of `M` (the quotient by the radical is semisimple); so it is perfect
  on both sides. Not in Mathlib or Tau Ceti; ArtinAlgebras' Krull–Schmidt material can use it;
- surjective images, in particular quotients by two-sided ideals and ring isomorphisms
  (`TauCeti.IsLeftPerfectRing.of_surjective`; [Lam-FC, (24.19), p. 365]; [AF, 28.7, p. 318]);
- **commutative rings** (`TauCeti.isLeftPerfectRing_iff_exists_ringEquiv_pi`,
  `TauCeti.isLeftPerfectRing_iff_isArtinianRing`): a commutative ring is perfect exactly when it is
  a finite product of local rings with T-nilpotent maximal ideals ([Lam-FC, (23.24), p. 357]), and a
  commutative Noetherian ring is perfect exactly when it is Artinian (a finitely generated nil ideal
  is nilpotent, so the ring is semiprimary, and Mathlib's
  `IsSemiprimaryRing.isNoetherian_iff_isArtinian` applies).

*Needs:* 4.1, 4.2; Mathlib `IsSemiprimaryRing`, `IsArtinianRing`, `IsLocalRing`,
`IsSemiprimaryRing.isNoetherian_iff_isArtinian`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`;
Tau Ceti `TauCeti.IsSemiprimaryRing.mulOpposite`, `TauCeti.isSemiprimaryRing_mulOpposite_iff`.

### 4.4 Projective covers over perfect categories

(`TauCeti.IsPerfectCategory.hasProjectiveCover`.) Over a perfect `C` every module of `Mod C` has a
projective cover ([Simson, Thm. 5.4, (7) ⇒ (8), p. 109], on `Cᵒᵖ`; [Bass, Lemma 2.6, p. 473], for
rings). Route: `C` is semiperfect (4.3). `M ⧸ J · M` is a module over `C ⧸ J(C)` (the restriction
functor of 0.3), which is semisimple (4.2), so it is a direct sum of simple modules (4.2); each has
a cover by a summand `{g ≫ e}` of a representable (4.2). Lift the sum `P` of these covers to
`P → M`. The lift is onto because `J · M` is superfluous in `M` (4.1), and its kernel lies in
`J · P` (4.2, the radical of a projective module), which is superfluous in `P` (4.1).

**Rings** (`TauCeti.IsLeftPerfectRing.exists_isProjectiveCover`). Over a left perfect ring every
left module, in every universe, has a projective cover, in the form of Tau Ceti's
`TauCeti.exists_isProjectiveCover`, which it generalizes from semiprimary rings ([Lam-FC, (24.12)];
[AF, 28.4, (b) ⇒ (a), p. 315]). The same route, with `M ⧸ J • M` semisimple
(`TauCeti.isSemisimpleModule_quotient_smul_top`) and
`TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

*Needs:* 4.1–4.3; Tau Ceti `TauCeti.exists_isProjectiveCover`,
`TauCeti.isSemisimpleModule_quotient_smul_top`, `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

### 4.5 Bass's Theorem P

**Pure superfluous subobjects of projectives**
(`TauCeti.ModCat.eq_bot_of_isSuperfluous_of_isPureEpi`), a standalone target, for any `C`: a
subobject `K` of a projective `P` that is superfluous and pure (the quotient map `P → P ⧸ K` is a
pure epimorphism, 2.3) is zero ([Wisbauer, 36.3, p. 306], for a projective in `σ[M]` generated by
finitely presented modules). Route, as Wisbauer's: for `x ∈ K(c)`, purity gives `θ : P → K` with
`θ(x) = x`. In detail, choose a split inclusion `s : P → F` into a sum of representables with
retraction `r`; `s(x)` lies in a finite subsum `j : L → F`, as `x_L`; the map `L → P ⧸ K` factors
through `H = L ⧸ (x_L)`, which is finitely presented, so by purity it lifts to `H → P`; the
difference `δ` of `j` and the composite through `H` maps to zero in `P ⧸ K` and sends `x_L` to
`s(x)`, and `r δ π s : P → P` factors through `K` as the wanted `θ` (the Villamayor step; [Lam-LMR,
(4.23), p. 129], the theorem of O. Villamayor, for rings). Then `s' = K.arrow ∘ θ` has image in the
superfluous `K`, so `1 - s'` is onto; it splits, since `P` is projective, and its kernel is a
summand of `P` inside `K`, hence zero ([Mares, Thm. 2.4, proof step (i), p. 349]); but
`(1 - s')(x) = 0`, so `x = 0`.

**Flat modules with a projective cover** (`TauCeti.ModCat.Flat.projective_of_isEssentialEpi`): a
flat module with a projective cover is projective, for any `C` and with no hypothesis on the
radical ([Wisbauer, 36.4 (1), p. 306]). Route: an epimorphism onto a flat module is pure (2.3), so
the kernel of the cover is pure and superfluous, hence zero. Credits: Wisbauer for rings, statement
and proof; [Simson, Thm. 5.4, (9′) ⇒ (1′), pp. 109–110], on `Cᵒᵖ`, for categories; [Mares, Thm. 2.4,
proof step (i), p. 349], for the endomorphism argument; [Chase 1960, Prop. 2.2, p. 458], where
Chase publishes Villamayor's lemma with proof, noting that it had not yet appeared. The earlier
ring proof of "perfect ⇒ flat modules are projective" through `K ≤ J · P` ([Lam-FC, (24.25)]) is
an alternative.

**Theorem P** (`TauCeti.isPerfectCategory_tfae`), for `EssentiallySmall.{w} C` (the universe `v`
in `Suggested.lean`). The following are equivalent:

1. `C` is perfect: `J(C)` is T-nilpotent and `C ⧸ J(C)` is semisimple (4.3);
2. every module of `Mod C` has a projective cover;
2′. every semisimple module has a projective cover;
3. every flat module is projective;
3′. every countably presented flat module is projective (Mathlib's `IsCardinalPresentable` at
   `ℵ₁`; Bass's modules are countably presented, which makes this item free);
4. for every object `c`, the principal right ideals `g C = {g ≫ h}` of `C` with source `c`
   (`TauCeti.RightMorphismIdeal.principal`, 0.3) satisfy the descending chain condition; at `c`
   they are the cyclic subfunctors of `Hom(c, -)`, the images of `Hom(d, -) → Hom(c, -)` for
   `g : c → d`. For `SingleObj Aᵐᵒᵖ` they are the principal right ideals `aA` (since `g ≫ h` is
   `op (a b)`; `TauCeti.submoduleOrderIsoRightMorphismIdeal`), Bass's condition;
4′. every sequence `c₀ → c₁ → ⋯` stabilizes: some `q_n = f₀ ≫ ⋯ ≫ f_{n-1}` factors as `q_m ≫ t`
   through every later `q_m` ([Simson, Def. 3.1, p. 99], on `Cᵒᵖ`, at the first term, in the
   direction of 2.5);
5. `flatDimension M = projectiveDimension M` for every module `M` of `Mod C`;
6. filtered colimits of projective modules are projective.

`Suggested.lean` states 3′ with no `Fact` binder: the regularity of `ℵ₁` is Mathlib's
`Cardinal.isRegular_aleph_one`, provided as a local instance (3.5).

Sources: [Simson, Thm. 5.4, p. 108], for covariant modules and applied to `Cᵒᵖ`, whose conditions
(7), (8), (1) and (5) are 1, 2, 3 and 4′ (at every term), with 3′ the countable form of (1) and (9)
the case of flat modules in 2; [Harada, Thm. 5, p. 339], for the finitely induced category of a set
of completely indecomposable objects of a Grothendieck category, covariant, with the remark that
the same holds for `(C_f⁰, Ab)`; [Bass, Theorem P, pp. 467–468] for rings; 2′ is [Sandomierski,
Thm. 5, p. 206] for rings, right-handed ("A ring R is right perfect if and only if every semisimple
right R-module has a projective cover"), applied to `Aᵐᵒᵖ`; 3 is not one of Bass's items for rings
([AF, 28.4]; [Lam-FC, (24.25)]).

Route: the cycle 1 ⇒ 2 ⇒ 3 ⇒ 3′ ⇒ 4′ ⇒ 1, with 4 ⇔ 4′, 3 ⇔ 5, 3 ⇔ 6 and 2 ⇒ 2′ ⇒ 1.

- 1 ⇒ 2 is 4.4.
- 2 ⇒ 3 is the lemma on flat modules with a projective cover; 3 ⇒ 3′ is immediate.
- 3′ ⇒ 4′: Bass's module of the sequence (2.5) is flat and countably presented (2.5, 0.8), so it is
  projective, and the sequence is factorizable (2.5; [Bass, Lemma 1.3]).
- 4′ ⇒ 1. T-nilpotence: for a sequence in `J(C)`, 4′ gives `t` with
  `q_n = q_{n+1} ≫ t = q_n ≫ f_n ≫ t`, so `q_n ≫ (1 - f_n ≫ t) = 0`; `f_n ≫ t` is radical, so
  `1 - f_n ≫ t` is invertible and `q_n = 0`. Semilocality, object by object: sequences with one
  object `X` give the descending chain condition on the principal left ideals of `End X`, for
  Mathlib's multiplication `f * g = g ≫ f` (the ideals `End(X) · q = {q ≫ h}`), and hence of
  `End X ⧸ Ring.jacobson (End X)`, which has zero radical. A ring with zero radical and the
  descending chain condition on principal left ideals is semisimple
  (`TauCeti.isSemisimpleRing_of_wellFoundedLT_isPrincipal`; [Lam-FC, (4.14), (3) ⇒ (1),
  pp. 57–58]: a minimal left ideal `B` is not in the radical `0`, so some maximal left ideal `m`
  misses it and `R = B ⊕ m`; the chain condition stops the splitting; no Brauer lemma is used).
  Lam's statement is left-handed, as needed here. Thanks to the objectwise definition (4.2),
  [Simson, Prop. 1.2] is not needed here.
- 4 ⇔ 4′: a sequence gives the principal right ideals generated by the `q_i`, with
  `q_{i+1} = q_i ≫ f_i`; conversely a descending chain `g₀ C ⊇ g₁ C ⊇ ⋯` has
  `g_{i+1} = g_i ≫ f_i` for some `f_i`.
- 3 ⇔ 5 through 3.1: flat dimension is at most projective dimension; given 3, the syzygy at the flat
  dimension is flat, hence projective ([Lam-LMR, (5.70), p. 187]); 5 at a flat module gives
  projective dimension `≤ 0`.
- 3 ⇔ 6: filtered colimits of flat modules are flat (2.6), and every flat module is a filtered
  colimit of finite sums of representables (2.3).
- 2 ⇒ 2′ is immediate. 2′ ⇒ 1, after [Sandomierski, Thm. 5, proof, pp. 206–207]: simple modules
  have covers, so `C` is semiperfect (4.2). For a free `F` (a sum of representables), the semisimple
  `F ⧸ J · F` (a module over `C ⧸ J(C)`, 0.3 and 4.2) has a cover `p : P → F ⧸ J · F`. A lift
  `q : F → P` of the quotient map is an epimorphism, since `ker p` is superfluous, and it splits,
  since `P` is projective. Its kernel `K` is a summand of `F` and lies in `J · F`; projecting
  `J · F` onto this summand gives `K = J · K`, and a nonzero projective has `J · K ≠ K` (4.2, the
  radical of a projective module, with no T-nilpotence), so `K = 0`. So `q` is an isomorphism that
  identifies `J · F` with `ker p`, and `J · F` is superfluous. Bass's module `B` of a sequence in
  `J(C)` has `B = J · B` and is a quotient of the free telescope `F`, so `B = 0` (`J · F`
  superfluous and `F → B` onto), and `J(C)` is T-nilpotent (4.1). The categorical adaptation of
  Sandomierski's ring argument, which uses [Sandomierski, Prop. 1 (d), p. 205], is this roadmap's.

Alternatives, in prose only: Rentschler's direct ring proof of 1 ⇒ 4 ([Rowen, Thm. 2.7.33, pp.
222–223]; R. Rentschler, *Eine Bemerkung zu Ringen mit Minimalbedingung für Hauptideale*, Arch.
Math. 17 (1966), 298–301, Satz 1, p. 298, with proof to p. 300: a ring whose radical is left
T-nilpotent, with semisimple quotient, has the minimum condition on principal right ideals, by a
non-homological proof answering Bass's question); [Lam-FC, (24.25), pp. 369–370] for 1 ⇒ 3 through
`R ⧸ J` (`K ≤ J · P`, and flatness gives `K = J · K`); Simson's route through Mittag-Leffler objects
([Simson, Thms. 3.16 and 5.4]); the exchange route 3 ⇒ 2 ([AHS, Thm. 1.1], with an agent assembly
that was not audited); the pp-formula proof of the Bass obstruction ([PR, §3]); and the earlier ring
proof of 2 ⇒ 1 (simple modules have covers, so `A` is semiperfect; a nonzero module with a cover has
`J • M ≠ M`, since `J • P ≠ P` for a nonzero projective `P`, [Bass, Prop. 2.7, p. 474]; then 4.1).
Pointers only, not targets: Bass's conditions (4), direct limits of modules of projective dimension
`≤ n`, and (7), orthogonal idempotents and socles; Simson's conditions (2), (3), (4) and (6)
(Mittag-Leffler objects, the product map, coperfectness, endomorphism rings of finitely generated
projectives); Harada's minimal-subobject condition ([Harada, Thm. 5, 5)]).

**Rings** (`TauCeti.isLeftPerfectRing_tfae (A : Type u)`): the same items, with 2 and 2′ in Tau
Ceti's `TauCeti.IsProjectiveCover` form (Convention 12), 3 and 3′ with `Module.BalancedFlat`, 4 the
descending chain condition `WellFoundedLT {I : Submodule Aᵐᵒᵖ A // I.IsPrincipal}` on principal
right ideals, 4′ Bass's chain `a₀A ⊇ a₀a₁A ⊇ ⋯`, 5 for `M : ModuleCat.{u} A`, and 6 in
`ModuleCat.{u} A`. All are derived from the categorical theorem at `SingleObj Aᵐᵒᵖ` through 0.2:
covers through `TauCeti.isProjectiveCover_iff_forall_surjective`, flatness through Layer 2,
dimensions through Layer 3 and Tau Ceti's
`CategoryTheory.Equivalence.projectiveDimension_functor_obj`; the principal right ideals of
`SingleObj Aᵐᵒᵖ` are the `aA` (`TauCeti.submoduleOrderIsoRightMorphismIdeal`, 0.3), and
`q_n = op (a₀ ⋯ a_{n-1})`. There are no independent ring proofs. Covers in other
universes come from 4.4. Also: the ring form of the lemma on flat modules with a projective cover
(`TauCeti.Module.BalancedFlat.projective_of_isProjectiveCover`; [Wisbauer, 36.4 (1)]) and the
auxiliary `TauCeti.isSemisimpleRing_of_wellFoundedLT_isPrincipal` (principal left ideals,
`Ideal A`, as in [Lam-FC, (4.14)]). Ring sources: [Bass, Theorem P], whose items (1), (2), (6), (3)
and (5) are 1, 2, 4, 5 and 6 here; [AF, 28.4, pp. 315–317], left-handed as here; [Lam-FC, (24.18),
p. 365, and (24.25), p. 369], right-handed.

*Needs:* Layers 2 and 3, 4.1–4.4; Mathlib `IsCardinalPresentable`, `Cardinal.isRegular_aleph_one`,
`imageSubobject`, `IsFiltered`, `WellFoundedLT`, `Submodule.IsPrincipal`; Tau Ceti
`TauCeti.IsEssentialEpi`, `TauCeti.isProjectiveCover_iff_forall_surjective`,
`CategoryTheory.Equivalence.projectiveDimension_functor_obj`.

### 4.6 Global dimension of perfect categories

- **Equality with the weak global dimension**
  (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension_of_isPerfectCategory`). For a perfect
  `C`, `Abelian.globalDimension (ModCat C) = ModCat.weakGlobalDimension C`, the supremum of
  Theorem P (5).
- **Sides** (`TauCeti.ModCat.globalDimension_op_eq_of_isPerfectCategory`). If `C` and `Cᵒᵖ` are
  perfect, the global dimensions of `Mod C` and `Mod Cᵒᵖ` agree (3.3's symmetry). By 4.3 this
  covers every semilocal `C` with `J(C)ⁿ = 0`.
- **The Bass–Eilenberg criterion** (`TauCeti.ModCat.hasProjectiveDimensionLE_iff_isZero_tor`;
  [Bass, p. 475], where Bass reproduces Eilenberg's argument; [Eilenberg 1956, Prop. 10 and Thm. 11,
  p. 333]). Over a perfect `C`, `pd M = sup {n : Tor_n(C ⧸ J, M) ≠ 0}`: `pd M ≤ n`
  exactly when `Tor_{n+1}((C ⧸ J)(X, -), M) = 0` for every `X`, with the covariant `(C ⧸ J)(X, -)`
  of 0.3. Route: a minimal projective resolution by covers (4.4) has differentials into `J · P_n`,
  since the kernel of a cover lies in `J · P` (4.2); so `(C ⧸ J) ⊗_C P` has zero differentials and
  `Tor_n((C ⧸ J)(X, -), M) ≅ (P_n ⧸ J · P_n)(X)` by the lemma of 0.3; and `J · P ≠ P` for `P ≠ 0`
  (4.2).
- **Corollary** (`TauCeti.ModCat.globalDimension_eq_iSup_flatDimension_quotientYoneda`; an agent
  derivation): the global dimension of `Mod C` for a perfect `C` is the flat dimension of the
  covariant module `C ⧸ J`, the supremum over `X` of the flat dimensions of `(C ⧸ J)(X, -)`, by the
  criterion and 3.1.

**Rings.** Statements with the weak global dimension live here; the comparison of left and right
global dimension alone is ArtinAlgebras §7.2's (Scope).

- `TauCeti.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing`: for `[IsLeftPerfectRing A]`
  and `[Small.{v} A]`, `globalDimension A = weakGlobalDimension A` ([Bass, p. 475], Eilenberg's
  argument; [Lam-LMR, (5.70), p. 187]); one side only, for example for Lam's ring (checks).
- `TauCeti.globalDimension_mulOpposite_of_isLeftPerfectRing`: for a ring that is left and right
  perfect, `globalDimension A = weakGlobalDimension A = globalDimension Aᵐᵒᵖ` (both sides of the
  previous item and 3.3's symmetry). Semiprimary rings are the main example, through the instances
  of 4.3 (left Artinian rings among them); for them this is [Au, Cor. 9, p. 73] and [Lam-LMR,
  (5.71), p. 188], with no Noetherian hypothesis, and it recovers ArtinAlgebras §7.2's semiprimary
  statement by a second route. The check `k[x₀, x₁, …] ⧸ (xᵢxⱼ)` is semiprimary and not Noetherian.

The Tor criterion for rings comes through 0.2 and is not stated separately. Main's
`TauCeti.globalDimension_eq_projectiveDimension_quotient_jacobson`
(`TauCeti/RingTheory/GlobalDimension/Semiprimary.lean`: for a semiprimary ring, the projective
dimension of the left module `A ⧸ J`) is unchanged and is not a consumer. The projective dimension
of `A ⧸ J` over a ring that is perfect on one side only is not claimed.

*Needs:* 0.3, 3.1, 3.3, 4.2–4.5; Tau Ceti `TauCeti.globalDimension`.

### Layer 4 checks

In Lean (last section of `Suggested.lean`):

- `PowerSeries k`: the ideal `(X)` is not left T-nilpotent (`TauCeti.not_isLeftTNilpotent_span_X`);
  the ring is local, so semiperfect, and not left perfect
  (`TauCeti.isSemiperfectRing_powerSeries_and_not_isLeftPerfectRing`); Bass's module for the
  constant sequence `X` is the Laurent series field, flat (2.5) and not projective
  (`TauCeti.bassRelations_X_linearEquiv_laurentSeries`).
- `ℤ` is not semiperfect (`TauCeti.not_isSemiperfectRing_int`, 4.2), so not perfect; `ℚ` is flat and
  not projective (`TauCeti.balancedFlat_rat_and_not_projective`, 2.6).
- `T₂(k)` is semiprimary, hence left and right perfect
  (`TauCeti.isLeftPerfectRing_upperTriangular`); its decomposition and the covers of its simple
  modules are the checks of 4.2.
- `k[ε]/(ε²)` (Mathlib's `DualNumber k`) is perfect, so its modules have equal flat and projective
  dimension (`TauCeti.isLeftPerfectRing_dualNumber`); its global and weak global dimensions are `⊤`
  (Layer 3 checks).
- `k[x₀, x₁, …] ⧸ (xᵢxⱼ)` (on `MvPolynomial ℕ k`, `TauCeti.squareZeroPolynomialRing k`) is
  semiprimary (`J² = 0`, `A ⧸ J = k`), hence perfect on both sides, and not Noetherian
  (`TauCeti.isSemiprimaryRing_squareZeroPolynomialRing`): the main example of 4.6 for rings.
- `k[x₀, x₁, …] ⧸ (xᵢ^{i+2}, xᵢxⱼ for i ≠ j)` (`TauCeti.bassPolynomialRing k`) is perfect and not
  semiprimary: `J` is not nilpotent because `xᵢ^{i+1} ≠ 0`, and it is T-nilpotent because an
  element of `J` involves only finitely many variables, so a product `a₀ ⋯ a_{n-1}` of elements of
  `J` vanishes once `n` exceeds a bound given by `a₀`. By Theorem P its principal ideals satisfy the
  descending chain condition, although it is not Noetherian
  (`TauCeti.isLeftPerfectRing_bassPolynomialRing`; an instance of [Bass, §3, Example (2), p. 475],
  which states the general condition: `R ⧸ N` has the minimum condition and `N` is a direct sum of
  two-sided nilpotent ideals).
- The linear `A_∞` category `0 → 1 → 2 → ⋯`, the `k`-linearization `CategoryTheory.Free k ℕ` of
  `(ℕ, ≤)` (as Layer 3 encodes `A₂` by `CategoryTheory.Free k (Fin 2)`), with the arrows
  `TauCeti.aInftyArrow k i : i → i + 1`: semilocal (every `End X` is `k`), not perfect (the
  arrows out of `0` compose to the nonzero paths `0 → n`), and `Cᵒᵖ` is perfect (a radical path of
  `Cᵒᵖ` strictly lowers the index) (`TauCeti.isSemilocalCategory_free_nat`). Bass's module of the
  sequence of arrows out of `0` is nonzero and equals `J · B` (`TauCeti.bassModule_free_nat`), as
  4.1 predicts.
- The `A₂` category `CategoryTheory.Free k (Fin 2)`: `J(C)² = 0`, it is perfect on both sides, and
  `proj C` is Krull–Schmidt (`TauCeti.isPerfectCategory_free_fin_two`); its category algebra is
  `T₂(k)` (1.7).

In prose:

- Lam's ring: in `Module.End k (ℕ →₀ k)`, let `J` be the endomorphisms with finite matrix supported
  strictly above the diagonal, and `R = k · 1 + J`. Then `R` is local, `IsLeftPerfectRing Rᵐᵒᵖ`
  holds and `IsLeftPerfectRing R` fails: the products `E₀₁E₁₂ ⋯ Eₙ₋₁,ₙ = E₀ₙ` never vanish
  ([Lam-FC, (23.22), p. 356]). Also `E₀₁R ⊋ E₀₂R ⊋ ⋯`, and Bass's module for `E₀₁, E₁₂, E₂₃, …` is a
  flat left `R`-module that is not projective. The linear `A_∞` category above is its many-object
  version: at `SingleObj Rᵐᵒᵖ` the arrows `i → i + 1` correspond to the `Eᵢ,ᵢ₊₁`.
- `PowerSeries k`, as the one-object category `SingleObj (PowerSeries k)ᵐᵒᵖ`, is a semiperfect
  category that is not perfect.

### Examples

Semiprimary rings (Artin algebras and left Artinian rings among them, and the endomorphism rings of
modules of finite length) are perfect on both sides; `bassPolynomialRing k` is perfect and not
semiprimary; Lam's ring is perfect on one side only; `PowerSeries k` is semiperfect and not perfect;
`ℤ` is not semiperfect; a commutative Noetherian ring is perfect exactly when it is Artinian.
Categories: Krull–Schmidt categories are semiperfect; the `k`-linear path categories of finite
acyclic quivers are perfect on both sides (a loop gives `End = k[t]`, whose chain
`(t) ⊋ (t²) ⊋ ⋯` contradicts Theorem P (4)); the linear `A_∞` category is perfect on one side
only.

### Dependencies

4.1 needs 0.3 and 2.5; 4.2 needs 0.1, 0.3, 0.8 and 4.1 (its ring items need only Mathlib and Tau
Ceti); 4.3 needs 4.1 and 4.2; 4.4 needs 4.1–4.3; 4.5 needs Layers 2 and 3 and 4.1–4.4; 4.6 needs
0.3, 3.1, 3.3 and 4.2–4.5.

## Downstream consumers

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2: Auslander's theorem
  (3.4) gives the left-right symmetry of global dimension for Noetherian rings through weak
  dimension, and 4.6 gives it for rings that are perfect on both sides, semiprimary rings among
  them, without a Noetherian hypothesis. Main's
  `TauCeti/RingTheory/GlobalDimension/MulOpposite.lean` is a refactor consumer: statements kept,
  proofs replaced by the weak-dimension route (3.4).
- Tau Ceti's `TauCeti.globalDimension` (`TauCeti/RingTheory/GlobalDimension.lean`) becomes the
  case `ModuleCat A` of `TauCeti.Abelian.globalDimension` (3.2); its cyclic and finite
  characterizations become corollaries of Auslander's lemma.
- ArtinAlgebras, §7.5, the forward direction: for an additive generator `M` of `mod A`, every
  finitely presented right `End_A(M)`-module has projective dimension at most two, and
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` (3.4) turns this into
  `globalDimension (Module.End A M) ≤ 2` using only that `End_A(M)` is left Noetherian. It also
  uses the statements of `TauCeti.RingTheory.GlobalDimension.MulOpposite`, whose proofs 3.4
  replaces; the bound of 3.4 strengthens what it needs.
- ArtinAlgebras, §§4.1–4.2, through Tau Ceti's
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel`
  (`Tr M ⊗_A N` as the cokernel of `Hom_A(P₀, N) → Hom_A(P₁, N)`) and
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom` (the stable Hom as the cokernel of
  `Hom_A(M, A) ⊗_A N → Hom_A(M, N)`): 1.4 identifies `Tor_1^A(Tr M, N)` with the stable
  `Hom_A(M, N)` for finitely presented `M` ([Auslander78, I, Prop. 3.2]).
- ArtinAlgebras, Layer 4: the Auslander-Reiten translate is built from finite minimal projective
  presentations (`TauCeti.FiniteProjectivePresentation.exists_isMinimal`); 4.2 provides them for
  finitely presented modules over any semiperfect ring. ArtinAlgebras' Krull–Schmidt material can
  use the semiprimary endomorphism rings of modules of finite length (4.3).
- Hoshino's flat-dominant dimension ([Ho, Theorem, p. 275]; [Xi, §1, p. 34]) asks the
  terms of a minimal injective coresolution to be flat; ArtinAlgebras leaves it out because
  flatness over noncommutative rings is missing. Layer 2 supplies that flatness. Xi uses
  Hoshino's symmetry for Noetherian rings; it is a consumer, not an independent proof.
- Tau Ceti's `TauCeti.IsSemiperfectRing` (`TauCeti/RingTheory/Jacobson/Semiperfect.lean`) is
  refactored to `extends IsSemilocalRing` (4.2), so that its field `isSemisimpleRing` becomes the
  `IsSemilocalRing` parent; no compatibility shims.
- The explicit hypotheses `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]` on Tau Ceti main (nine binders
  in six files at main `71ce0a3`) become `[IsSemilocalRing R]` (4.2):
  `TauCeti/Algebra/Module/ProjectiveCover/Simple.lean` (two theorems),
  `TauCeti/RingTheory/Idempotents/Corner/Local.lean` (one theorem),
  `TauCeti/RingTheory/Semisimple/BasicAlgebra.lean` (two theorems),
  `TauCeti/RingTheory/MatlisDuality/Basic.lean` (one `variable`),
  `TauCeti/RingTheory/MatlisDuality/Semilocal.lean` (two `variable`s) and
  `TauCeti/Algebra/Category/ModuleCat/MatlisDual.lean` (one `variable`). The last three are over a
  commutative ring, where `IsSemilocalRing` means finitely many maximal ideals (4.2).
- With the instance `TauCeti.small_mulOpposite` (0.2), the explicit `[Small.{v} Aᵐᵒᵖ]` binders on
  Tau Ceti main become redundant and are removed:
  `TauCeti/Algebra/Module/AuslanderReiten/Inverse.lean`,
  `TauCeti/Algebra/Module/Dual/ProjectiveInjective.lean`, and the local `have` in
  `TauCeti/Algebra/Module/CharacterModule/MulOpposite.lean`.
- Krause's criterion (`TauCeti/CategoryTheory/Preadditive/KrullSchmidt/Semiperfect.lean`):
  `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end`,
  `TauCeti.isKrullSchmidt_of_isSemiperfectRing_end` and the instance
  `TauCeti.IsKrullSchmidt.isSemiperfectRing_end` are restated with `IsSemiperfectCategory` (4.2),
  with no alias.
- The refactor of 0.1: Tau Ceti main's `TauCeti.IsFinitelyGeneratedFunctor`,
  `TauCeti.IsFinitelyPresentedFunctor` and their users in
  `TauCeti/CategoryTheory/FinitelyPresentedFunctor/` (all under finite biproducts) move to finite
  sums of representables, with `matrixMap` as the construction; main's
  `TauCeti.IsRepresentableProjectiveCover` is compared with essential epimorphisms (4.2).
- The refactor of 0.3: Tau Ceti main's `TauCeti.IsSuperfluous` and its API
  (`TauCeti/Algebra/Module/Submodule/Superfluous.lean`) move to lattices, with the submodule
  results as the special case.

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
- [AHS] L. Angeleri Hügel, M. Saorín, *Modules with perfect decompositions*, Math. Scand. 98
  (2006), 19–43. Thm. 1.1, p. 21 (decompositions and the exchange property, through its implication
  (1) ⇒ (5), as read in the route notes); for the exchange route of 4.5, an alternative only.
- [Auslander78] M. Auslander, *Functors and morphisms determined by objects*, in *Representation
  Theory of Algebras* (Philadelphia, 1976), Lecture Notes in Pure and Applied Mathematics 37,
  Dekker (1978), 1–244. I, Prop. 3.2 (`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` for finitely presented
  `X`), read in a retyped version (its pp. 12–14), not in the printed pages.
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
  1641–1674. §1.2, Lemmas 1–2, pp. 1644–1645 (the category of elements; pseudo-cokernels); §1.3,
  Theorem, pp. 1645–1646 (flat functors; the proof of (1) ⇒ (2) uses
  `stable Hom(X, Y) ≅ Tor_1(Tr X, Y)`, with the stable `Hom` underlined on p. 1646 and lost in text
  extraction); §1.4, Theorem and Corollary, pp. 1646–1648 (representation theorem); §2.1, Theorem,
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
  arXiv:2505.07742v1: the definitions before Proposition `p:CharacterizationFlats` (flat modules
  versus flat objects inside the category of flat modules). No published numbering.
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
- [Govorov] V. E. Govorov, *On flat modules*, Sibirsk. Mat. Zh. 6 (1965), 300–304 (Russian): a flat
  module is a direct limit of free modules. Read in the original.
- [Harada] M. Harada, *Perfect categories I*, Osaka J. Math. 10 (1973), 329–341. Introduction,
  pp. 329–330: perfect Grothendieck categories, and Theorem P for the functor category `(C, Ab)` of
  an amenable additive small category `C`; Lemma 6, p. 337, and Theorems 3–4, pp. 337–338; Theorem
  5 and Remark 1, pp. 339–340 (for the finitely induced category `C_f` of a set of completely
  indecomposable objects; Bass's module over the ring with enough idempotents of a category;
  p. 339 checked on the page image, the rest through a reading of the text extraction). Part I,
  Theorems 3–4, and Part II use the contravariant `(C⁰, Ab)`, as here; Theorem 5 is covariant,
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
  Theorems B.12, p. 387 (where the small category is called perfect), and B.14, p. 388.
- [Krause] H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015),
  535–549; arXiv:1410.2822. Lemma 3.6, p. 542, and Proposition 4.1, p. 544, with proof to p. 545
  (right modules, p. 538); the arXiv TeX source has the same numbering.
- [Krause-Defect] H. Krause, *A short proof for Auslander's defect formula*, Linear Algebra Appl.
  365 (2003), 267–270. Theorem and proof, pp. 268–269: the snake-lemma step (the diagram on p. 268;
  `D δ_*(X) = D Coker Hom_R(X, ψ) ≅ D Ker(φ ⊗_R Tr X)` on p. 269), for an algebra over a
  commutative ring, right modules and finitely presented `X`.
- [Krause-FlatCovers] H. Krause, *Morphisms determined by objects and flat covers*, Forum Math. 28
  (2016), 425–435. Theorems 1.1 and 2.2, read in arXiv:1403.6039v2 (numbering of v2). Pointer
  only.
- [Krause-Smashing] H. Krause, *Smashing subcategories and the telescope conjecture — an algebraic
  approach*, Invent. Math. 139 (2000), 99–133. §2.3, p. 115: `Flat C = Ind C`, and Lemma 2.7 (for
  a skeletally small triangulated `C`: flat, cohomological and fp-injective agree, for additive
  `M : Cᵒᵖ → Ab`, as here), with Lemma 1.6.
- [Lam-FC] T. Y. Lam, *A First Course in Noncommutative Rings*, Graduate Texts in Mathematics 131,
  Springer (1991), first edition, the edition of the local copy, to which all pages refer.
  (4.14), pp. 57–58 (a ring is semisimple exactly when it is J-semisimple and left Artinian,
  exactly when it is J-semisimple with the descending chain condition on principal left ideals; the
  proof splits off minimal left ideals through a maximal left ideal missing them and uses no Brauer
  lemma), read in the derivative of §4; (23.11), p. 350 (commutative semiperfect rings);
  (23.13)–(23.16), pp. 351–352; (23.19), p. 353; (23.20), p. 354; (23.22), p. 356; (23.24), p. 357
  (commutative perfect rings); (24.7), p. 360; (24.12), p. 362; (24.16), p. 364; (24.18)–(24.20),
  p. 365; (24.22), p. 366; (24.23)–(24.24), pp. 367–368; (24.25), pp. 369–370. Lam defines
  T-nilpotence for a subset. §§23–24 right-handed; (4.14) left-handed. A right-handed statement is
  applied to `Aᵐᵒᵖ`.
- [Lam-LMR] T. Y. Lam, *Lectures on Modules and Rings*, Graduate Texts in Mathematics 189,
  Springer (1999). (2.33), pp. 46–47 (Small's ring, "constructed by L. Small"); (4.9) and (4.12),
  p. 125; (4.13) ("if `A`, `C` are flat, then so is `B`") and (4.14), p. 126; (4.23) (the theorem of
  O. Villamayor) and (4.24), pp. 129–130; (4.30), p. 133; (4.32)–(4.34), pp. 133–134; (4.47), p.
  139; (5.53)–(5.57), pp. 183–184; (5.58)–(5.59), p. 184; (5.62b) and (5.63), p. 185; (5.69)–(5.70),
  p. 187; (5.71), p. 188. Lam states these results for right modules (`P_R`; (5.59) for a right
  Noetherian ring, which is our left Noetherian after the switch); each is applied to `Aᵐᵒᵖ`, and
  the citations of (4.9), (4.12), (4.24), (4.32), (5.57) and (5.59) say so.
- [Lambek] J. Lambek, *A module is flat if and only if its character module is injective*, Canad.
  Math. Bull. 7 (1964), 237–243. Theorem, p. 239; Proposition 1 and `Ext(N, M*) ≅ Tor(N, M)*`,
  p. 241.
- [Lazard] D. Lazard, *Autour de la platitude*, Bull. Soc. Math. France 97 (1969), 81–128. Ch. I
  (noncommutative rings, p. 83): Lemme 1.1 and Thm. 1.2, p. 84; Cor. 1.3–1.4, p. 85; Thm. 3.2,
  p. 89. The 1964 announcement (C. R. Acad. Sci. Paris 258, 6313–6316) was not obtained.
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
  product over `K` and its independence of `K` (p. 52). Pages 57–161 were searched for flatness,
  weak dimension and Auslander's theorems: the weak dimension of a functor is defined on p. 59 and
  then set aside (p. 60); Thm. 16.1 (Osofsky), p. 69, bounds the projective dimension of a directed
  colimit over a directed set of cardinality `ℵ_n` by `n + 1` plus the supremum; §36, Thm. 36.8,
  p. 149, gives directed functors of projective dimension exactly `n + 1` (the examples of p. 50);
  p. 152 recalls Auslander's theorem that the right global dimension is the supremum over cyclic
  functors. No categorical form of Auslander's Noetherian comparison of weak and global dimension
  was found there. Mitchell writes morphisms on the right; his modules in general are covariant
  functors and are applied to `Cᵒᵖ`, while the projective and flat functors of §10 are contravariant
  (`G ∈ Ab^{𝒞*}`), as here.
- [Müller] B. J. Müller, *On semi-perfect rings*, Illinois J. Math. 14 (1970), 464–467. §3 (a short
  proof of the simple-cover criterion); a pointer.
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
  (2025), 1–12 (publisher record, not checked here); read in arXiv:2501.04174v1, §3, Definition 4
  and Lemma 5 (numbering of the HTML version of v1, not compared with the published version); the
  pp-formula view of the Bass obstruction, credited there to G. Puninski, P. Rothmaler,
  *Pure-projective modules*, J. London Math. Soc. (2) 71 (2005), 304–320: §4, Thm. 4.2
  (Bass–Björk), with Lemma 3.6, read in an author preprint (numbering of the preprint, not
  compared with the published version). An alternative only.
- [Pierce] R. S. Pierce, *The global dimension of Boolean rings*, J. Algebra 7 (1967), 91–99.
  Cor. 2.2, p. 92 (a regular ring of cardinality at most `ℵ_n` has global dimension `≤ n + 1`);
  Thm. 5.1, p. 96, and Cor. 5.2, p. 97 (the free Boolean ring on `ℵ_n` generators has global
  dimension `n + 1`). Left modules.
- [Rowen] L. H. Rowen, *Ring Theory*, vol. I, Academic Press (1988). Thm. 2.7.7 (ii), pp. 213–214,
  and Thm. 2.7.33, pp. 222–223 (Rentschler's direct proof that a perfect ring has the descending
  chain condition on principal ideals, in Rowen's conventions); read for the route comparison, not
  re-read here. [Lam-FC, p. 370] names R. Rentschler and points to Rowen; the paper's title and
  place are in 4.5.
- [Rump] W. Rump, *Flat covers in abelian and in non-abelian categories*, Adv. Math. 225 (2010),
  1589–1615. Theorem 2 and Corollary 2, pp. 1603–1604, read in a transcription. Pointer only.
- [Sandomierski] F. L. Sandomierski, *On semiperfect and perfect rings*, Proc. Amer. Math. Soc. 21
  (1969), 205–207. Credit to Koh's commutative case (K. Koh, *On a semi-primary ring*, Proc. Amer.
  Math. Soc. 19 (1968), 205–208, Thm. 2, p. 205: a commutative ring has projective covers of all
  simple modules iff it is "semiprimary" and idempotents lift modulo the radical; Koh's "semiprimary"
  means only that `R ⧸ J` is Artinian, after Jacobson, so this is semiperfectness; his Thm. 1 is the
  noncommutative statement with a weaker lifting condition), p. 205; Proposition 1 (d) and Lemma 2, p. 205;
  Theorems 4 and 5, p. 206, with the proof of Theorem 5 to p. 207 (stated for right modules;
  Theorem 5: "A ring R is right perfect if and only if every semisimple right R-module has a
  projective cover").
- [Simson] D. Simson, *On pure global dimension of locally finitely presented Grothendieck
  categories*, Fund. Math. 96 (1977), 91–116. §1, pp. 92–93: "additive" means preadditive (finite
  sums are added only in Cor. 1.3 (b), p. 94), the radical `J(C)`, and semisimple categories;
  Prop. 1.2, p. 93 (semisimple iff von Neumann regular with semisimple endomorphism rings); Cor.
  1.3 (a), p. 94 (`C` semisimple iff `Cᵒᵖ` semisimple); Thm. 2.1, p. 95 (its (b): "If `C` has finite
  coproducts and cokernels, then `Cᵒᵖ`-module `F` is flat iff `F` is a left exact functor"); Thm.
  2.12 (c), p. 98 (`ℵ_n`-presented flat functors); Def. 3.1, p. 99 (factorizable inverse systems);
  left T-nilpotence of `J(C)` and Lemma 5.3 (Bass's Nakayama lemma, for `J(C)`, "the arguments of
  Bass generalize"), p. 108; Thm. 5.4, p. 108 (statement checked on the page image), with the
  proofs of (3′) ⇒ (4), (7) ⇒ (8) and (9′) ⇒ (1′), pp. 108–110; Thm. 5.6, p. 110 (three items). The
  pages come from a scan of two-page spreads. The steps through Thm. 3.16 and (5) ⇒ (4) were not
  fully read. Simson's modules are covariant functors; his statements are applied here to `Cᵒᵖ`,
  except Thm. 2.1 (b). The earlier paper *Functor categories in which every flat object is
  projective*, Bull. Acad. Polon. Sci. 22 (1974), 375–380, was not obtained.
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
- M. and G. Weidenfeld, *Idéaux d'une catégorie préadditive, application aux catégories
  semi-parfaites*, C. R. Acad. Sci. Paris Sér. A 270 (1970), 1569–1571, as listed in [Simson],
  ref. [39]. A search found only the thesis M. Weidenfeld, *Idéaux d'une catégorie préadditive*,
  Esquisses Math. 3, Paris (1970). Neither was obtained or read.
- [Ho] M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280.
  Theorem, p. 275: for a left and right Noetherian ring, the first `n` terms of the minimal
  injective resolutions of `R_R` and `_R R` are flat together (Hoshino calls this dominant
  dimension).
  [Xi] C. Xi, *Frobenius bimodules and flat-dominant dimensions*, Sci. China Math. 64 (2021), 33–44,
  read in the published version (author's PDF) and in arXiv:1903.07921v1: §1, p. 34, the left
  flat-dominant dimension, following [Ho], and its left-right symmetry for Noetherian rings,
  credited to [Ho]. Cited for the consumer only, as in ArtinAlgebras.

