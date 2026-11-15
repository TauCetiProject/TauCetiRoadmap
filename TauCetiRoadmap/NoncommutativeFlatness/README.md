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
the right modules. Layer 0 lays the foundations: the abelian category `Mod C`; the identification of
`A`-modules with modules over `SingleObj Aᵐᵒᵖ`; the tensor product `G ⊗_C F` of a covariant functor
`G` and a module `F` as a coend, linear over a commutative ring `R`, with its adjunctions, right
exactness, projective factors and swap; duals `Hom_R(-, E)`; the native ring API of `M ⊗_A N`; and
the finitely generated projective modules `proj C` with the duality `Hom(-, C)` between `proj C` and
`proj Cᵒᵖ`. On these the roadmap builds `Tor` over `C` as a left derived functor in the `Mod C`
variable, with its long exact sequences, its balance, `Tor` of the Auslander–Bridger transpose and
its duality with `Ext`, and compares a category with finitely many objects with its category
algebra. Layer 2 treats flat modules and flat functors: the ideal test, the `Tor` and Lambek tests
with a Baer criterion for `Mod C`, the Lazard characterizations (equational criterion,
factorization, filtered colimits of finite sums of representables, purity) and the projectivity of
finitely presented flat modules, flat = left exact, flat = cohomological on triangulated categories,
Crawley-Boevey's representation of finitely accessible additive categories, Bass's flat module of a
sequence, and closure properties. Layer 3 treats flat dimension, the global dimension of an abelian
category, the weak global dimension with its left-right symmetry, and Auslander's theorem that a
Noetherian category (every `Hom(-, X)` a Noetherian object; for rings, left Noetherian) has equal
global and weak global dimension. Layer 4 treats T-nilpotent ideals of `C` and Nakayama's lemma for
all modules, semilocal, semiperfect and perfect categories and rings, projective covers over them,
and the global dimension of perfect categories. The summit is **Bass's Theorem P**: for a ring `A`
with Jacobson radical `J`, the following are equivalent: `A ⧸ J` is semisimple and `J` is left
T-nilpotent; every left module has a projective cover; every flat left module is projective; the
principal *right* ideals satisfy the descending chain condition; every left module has equal flat
and projective dimension; filtered colimits of projective left modules are projective. For small
preadditive categories the summit is **Simson's Theorem 5.4** ([Simson, Thm. 5.4, p. 108], stated
for covariant modules and applied here to `Cᵒᵖ`): every flat module of `Mod C` is projective exactly
when every module has a projective cover, exactly when `J(C)` is T-nilpotent on sequences
`c₀ → c₁ → ⋯` and `C ⧸ J(C)` is semisimple, exactly when every sequence `c₀ → c₁ → ⋯` in `C` is
factorizable; these are the perfect categories ([Harada]). Here the categorical theorem is proved
first and Bass's theorem is its one-object case. All layers are category-primary.

## Scope and ownership

This roadmap owns:

- modules over a preadditive category: `Mod C` as a full subcategory of contravariant additive
  functors, its abelian structure, representable projectives, enough projectives and derived
  `R`-linear structure, and the inclusion of `mod C`; the comparison of `A`-modules with modules
  over `SingleObj Aᵐᵒᵖ`; the tensor product `G ⊗_C F` of a covariant functor and a module over an
  `R`-linear category, with its API, adjunctions, right exactness, Yoneda isomorphisms,
  independence of `R` and change of base; tensoring with projectives; the swap
  `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`; the ring API of `M ⊗_A N` and its comparison with the categorical tensor
  product and with Mathlib's tensor product over a commutative ring; duals with respect to an
  `R`-module `E`; `I · M` and `C ⧸ I` for an ideal `I` of `C`; and the finitely generated projective
  modules `proj C`, `proj C ≃ Karoubi (Mat_ C)` and the duality `Hom(-, C)` between `proj C` and
  `proj Cᵒᵖ` (Layer 0);
- `Tor` over a preadditive category and over an arbitrary ring as a left derived functor, its long
  exact sequences, its balance, the formula `stable Hom(X, N) ≅ Tor_1(Tr X, N)`, its duality with
  `Ext`, the comparison with Mathlib's
  `CategoryTheory.Tor` over a commutative ring, change of base, `Tor₁` of two cyclic modules, and
  the comparison of a category with finitely many objects with its category algebra (Layer 1);
- flat modules and flat functors over a preadditive category and over an arbitrary ring: the ideal
  test, the `Tor` and Lambek tests, a Baer criterion for `Mod C`, `Tor` and filtered colimits, the
  Lazard characterizations and purity, projectivity of finitely presented flat modules, flat = left
  exact, the triangulated case, Crawley-Boevey's representation theorem, Bass's flat module of a
  chain, closure properties, and the bridge to Mathlib's ind-objects (Layer 2);
- flat dimension; the global dimension of an abelian category, Auslander's lemma on cyclic modules
  and universe independence; the weak global dimension, its left-right symmetry and its bounds by
  the global dimensions; the `FP_∞` lemma and Auslander's theorem for Noetherian categories and left
  Noetherian rings; kernels of flat modules and countably presented flat modules (Layer 3);
- T-nilpotent ideals of a preadditive category and Nakayama's lemma for all modules; semilocal rings
  and categories, semiperfect and perfect categories, and the ring class `IsLeftPerfectRing`;
  projective covers over semiperfect and perfect categories and rings, the characterization of
  semiperfect categories and rings by projective covers, and finite minimal projective presentations
  over semiperfect rings; the Mares–Simson lemma, Bass's Theorem P for categories and rings, and the
  global dimension of perfect categories with the Bass–Eilenberg criterion (Layer 4).

The boundaries are as follows.

- An `R`-linear category is Mathlib's `Linear R C`, and modules are ordinary functors with
  additivity as a property. **Future work, not followed here:** `R`-linear categories as categories
  enriched over `ModuleCat R`, and a bridge from `Mod C` to degree-zero DG modules. Tau Ceti's DG
  categories use Mathlib's `EnrichedCategory` over `CochainComplex (ModuleCat R) ℤ`, with a
  hand-built functor category (`TauCeti/CategoryTheory/DG/Functor/Category.lean`); Mathlib has no
  general category of enriched functors.
- Finitely presented functors `mod C` are Tau Ceti's (`TauCeti.isFinitelyPresentedFunctor`, in
  `TauCeti/CategoryTheory/FinitelyPresentedFunctor/`). They live in the same ambient category
  `Cᵒᵖ ⥤ AddCommGrpCat.{v}` and are additive, so they need no migration; this roadmap states only
  the inclusion `mod C ⊆ Mod C` (0.1).
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
  algebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2, owns the statements comparing
  left and right global dimension and the formula for semiprimary rings. Their proofs on main
  (`TauCeti/RingTheory/GlobalDimension/MulOpposite.lean`, through character modules) are replaced
  by the weak-dimension route of 3.4 once Layers 0–3 exist; the statements are kept (refactor
  consumer, 3.4). Layer 4 gives the route through perfect rings and does not restate them.
- Tau Ceti's ring `TauCeti.globalDimension` becomes the case `ModuleCat A` of the global dimension
  of an abelian category (3.2): a refactor of main, with no compatibility shims.
- Semiperfect rings are Tau Ceti's `TauCeti.IsSemiperfectRing`, with its idempotent
  characterization; it is refactored to `extends IsSemilocalRing` (4.2, Downstream consumers).
  This roadmap owns their projective covers and their characterization by projective covers (4.2);
  the placement of the ring items follows the scope contest on TauCetiProject/TauCeti#38013 (4.2).
  Krull–Schmidt categories, the radical `TauCeti.jacobsonRadicalIdeal` and essential epimorphisms
  are Tau Ceti's; Krause's criterion is restated with `IsSemiperfectCategory` (4.2). Minimal
  projective presentations are Tau Ceti's `TauCeti.IsMinimalProjectivePresentation`; this roadmap
  owns only their existence over a semiperfect ring (4.2).
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

Suggested homes in Tau Ceti: `TauCeti/CategoryTheory/Preadditive/ModCat/` (0.1, 0.3–0.5, 0.7),
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
   functor category, Mathlib's `Cᵒᵖ ⥤+ AddCommGrpCat.{w}`. This is the `mod C` of Tau Ceti and of
   [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), and it matches Mathlib, whose
   ring modules are left modules and whose Yoneda embedding is contravariant
   (`preadditiveYoneda : C ⥤ Cᵒᵖ ⥤ AddCommGrpCat`), so that `C ⊆ proj C ⊆ Mod C` covariantly (0.1,
   0.8). There is no separate category of covariant modules: a covariant additive functor is a
   module over the other side, an object of `Mod Cᵒᵖ` (`TauCeti.ModCat Cᵒᵖ`). Every statement is
   made for `Mod C`; the other side is the same statement over `Cᵒᵖ`. The covariant representable
   `Hom(X, -)` is the representable of `Cᵒᵖ` at `op X`, `(ModCat.yoneda Cᵒᵖ).obj (op X)`. Mathlib's
   `preadditiveCoyoneda` is not used: its values `C ⥤ AddCommGrpCat` are not objects of `Mod Cᵒᵖ`,
   whose objects are functors `Cᵒᵖᵒᵖ ⥤ AddCommGrpCat`. No enriched functor categories are used.
2. **Linearity.** `R` is a commutative ring and `C` is `R`-linear (Mathlib's `Linear R C`). Every
   preadditive category is `ℤ`-linear (Mathlib's `preadditiveIntLinear`), so `R = ℤ` is the
   general preadditive case. A module carries only its additive structure; its `R`-structure is
   derived: `r` acts on `F(c)` by `F(r • 𝟙 c)` (0.1). This is the analogue of `ModuleCat A`,
   which carries only the `A`-action, with the `R`-action of an `R`-algebra recovered by Tau
   Ceti's `ModuleCat.moduleOfAlgebra`. Tensor products, `Hom_R` and `Tor` take values in
   `ModuleCat R`, and the maps between them are `R`-linear.
3. **Universes.** Statements are universe polymorphic: `C : Type u`, `Category.{v} C`, values in
   `AddCommGrpCat.{w}`. Where colimits indexed by the objects of `C` are needed (coends, enough
   projectives), the hypothesis is `EssentiallySmall.{w} C`. Rings and small categories use
   `w = v`; the category `mod A` of finitely presented modules uses Mathlib's `SmallModel`; a large
   `C` (a large triangulated category, all of `Mod A`) uses `w = max u v`, with representables
   lifted by `ULift`. Finitely presented functors need no smallness.
4. **Rings.** `A` is a ring, `[Ring A]`, not assumed commutative, and an `R`-algebra
   `[Algebra R A]` where an `R`-structure is needed. Modules over a ring are left modules. A right
   `A`-module is a left `Aᵐᵒᵖ`-module, `[Module Aᵐᵒᵖ M]`, as in `TauCeti.BalancedTensorProduct`.
   A right-handed statement is the left-handed one for `Aᵐᵒᵖ`; no separate "right" predicate is
   introduced. A left `A`-module is a right `Aᵐᵒᵖ`-module through `RingEquiv.opOp A`. A right ideal
   of `A` is a `Submodule Aᵐᵒᵖ A` (Mathlib's spelling, e.g. in
   `Mathlib/Topology/Algebra/LinearTopology.lean`), so that `A ⧸ I` is a right module and `I ∩ K`
   makes sense for a left ideal `K : Ideal A`. A ring enters the categorical theory as
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
   left-module variable `N`. Both take values in `ModuleCat R` (1.1). Over a commutative ring, ring
   `Tor` is compared directly with Mathlib's `CategoryTheory.Tor` (1.6). Flatness (2.1) is defined
   with `R = ℤ` and does not depend on `R`; Layer 3 uses `R = ℤ` as well. By the independence of
   `R` (0.3, 0.6) this does not change the underlying groups. Modules live in `ModuleCat.{v} A` and
   `ModuleCat.{v} Aᵐᵒᵖ` with `[Small.{v} A]`, as for `TauCeti.globalDimension`; the instance
   `Small.{v} Aᵐᵒᵖ` is part of 0.2.
7. Dimensions take values in `WithBot ℕ∞`, with `⊥` exactly for the zero module, as Mathlib's
   `CategoryTheory.projectiveDimension` and Tau Ceti's `TauCeti.globalDimension`. The global
   dimension of an abelian category is `TauCeti.Abelian.globalDimension` (3.2); for `C` it is that
   of `ModCat C`, and that of the other side is the global dimension of `ModCat Cᵒᵖ`.
   `TauCeti.globalDimension A` is the left global dimension, that of `ModCat (SingleObj Aᵐᵒᵖ)`; the
   right one is `TauCeti.globalDimension Aᵐᵒᵖ`.
8. `J = Ring.jacobson A` for a ring, and `J(C) = TauCeti.jacobsonRadicalIdeal C` for a category,
   with `J(C)(X, X) = Ring.jacobson (End X)`. An ideal `I` of `C` (Tau Ceti's
   `TauCeti.MorphismIdeal`) is **T-nilpotent** (`TauCeti.MorphismIdeal.IsTNilpotent`) if every
   sequence `c₀ → c₁ → ⋯` of morphisms `fᵢ` in `I` has a vanishing composite
   `f₀ ≫ ⋯ ≫ fₙ₋₁ : c₀ → cₙ` (4.1). This is the direction of Nakayama's lemma for `Mod C`. The
   name carries no "left" or "right": the other side is T-nilpotence of Tau Ceti's opposite ideal
   `I.op` on `Cᵒᵖ`, that is, of the chains `c₀ ← c₁ ← ⋯`, which is the "left T-nilpotence" of
   [Simson, p. 108] for his covariant modules. A subset `S` of a ring `A` is **left T-nilpotent** if
   for every sequence `a₀, a₁, …` in `S` some product `a₀ a₁ ⋯ aₙ₋₁` is `0` ([Bass, p. 466],
   [Lam-FC, (23.13)], [AF, p. 314]). In `SingleObj Aᵐᵒᵖ` the composite of `op a₀, …, op aₙ₋₁` is
   `op (a₀ a₁ ⋯ aₙ₋₁)`, so T-nilpotence of `J(SingleObj Aᵐᵒᵖ)` is left T-nilpotence of `J`. Right
   T-nilpotence asks `aₙ₋₁ ⋯ a₀ = 0`; it is left T-nilpotence of the image of `S` in `Aᵐᵒᵖ`.
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
   `TauCeti.HasProjectiveCover M` (4.2). Over a ring, projective covers are Tau Ceti's
   `TauCeti.IsProjectiveCover`: a surjection from a projective module whose kernel is superfluous
   (`TauCeti.IsSuperfluous`); the two agree by `TauCeti.isProjectiveCover_iff_forall_surjective`.
   For rings, "`M` has a projective cover" is
   `∃ (P : Type u) (_ : AddCommGroup P) (_ : Module A P) (p : P →ₗ[A] M), IsProjectiveCover p`,
   with `P` in the universe of `A` (4.2, 4.5). For all modules over a left perfect ring, in every
   universe, it takes the form of Tau Ceti's `TauCeti.exists_isProjectiveCover` (4.4).
13. Proposed names are given in parentheses. Names that `Suggested.lean` states carry the prefix
   `TauCeti.` in the README and live in `TauCetiRoadmap.NoncommutativeFlatness` there.
14. **Sources on the other side.** [OR], [St], [CB], [Fisher], [Krause-Smashing] and the flat
   functors of [Mitchell, §10] are contravariant, as here, and are cited directly. [Simson],
   [Harada] and Mitchell's general modules are covariant, and so are Mathlib's `RepresentablyFlat`
   and `Action`; their statements are applied to `Cᵒᵖ`, and the citations say so. Ring sources keep
   their sides: a right-handed ring statement is applied to `Aᵐᵒᵖ`.

**Sources and locators.** Citations use the keys of the section "Sources and locators". Pages are
printed pages. A locator that has not been read in the source says so.

## Exact supplier contracts

The baseline is Mathlib `e8ba86fa9744dd8d90f48c1752bc735f61a4ca81` and Tau Ceti
`71ce0a33087999414b8424bf26c3a1d9fbbce54e`. `Suggested.lean` imports
`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`,
`TauCeti.Algebra.Category.ModuleCat.Projective.TensorHom`,
`TauCeti.Algebra.Module.AuslanderReiten.TensorCokernel`,
`TauCeti.Algebra.Module.CharacterModule.MulOpposite`,
`TauCeti.CategoryTheory.FinitelyPresentedFunctor.Basic`, `TauCeti.RingTheory.MatlisDuality.Basic`,
`TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`,
`TauCeti.CategoryTheory.Preadditive.KrullSchmidt.Semiperfect`,
`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul`,
`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Opposite`,
`TauCeti.CategoryTheory.Preadditive.Radical.Nilpotent`, `TauCeti.CategoryTheory.Projective.Cover`
and `TauCeti.RingTheory.Jacobson.MulOpposite`, which need Tau Ceti at that commit or later.

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
- Linearity: `CategoryTheory.Linear` with `Linear.preadditiveIntLinear`,
  `Linear.oppositeCategory`, `Linear.smul_comp`, `Linear.comp_smul`;
  `CategoryTheory.linearYoneda`.
- Coends: `CategoryTheory.Limits.HasCoend`, `CategoryTheory.Limits.coend` with `coend.ι`,
  `coend.condition`, `coend.desc`, `coend.hom_ext`, `coend.map`
  (`Mathlib/CategoryTheory/Limits/Shapes/End.lean`); `Adjunction.leftAdjoint_preservesColimits`.
  The monoidal structure of `ModuleCat R` is not used in the definition of `G ⊗_C F`: it needs `R`
  and the modules in one universe.
- One object: `CategoryTheory.SingleObj`, `SingleObj.star`, `SingleObj.comp_as_mul`, the
  `Preadditive (SingleObj A)` instance (`Mathlib/CategoryTheory/Preadditive/SingleObj.lean`);
  `Action.functorCategoryEquivalence` as the pattern for 0.2; `CategoryTheory.unopUnop`;
  `MulOpposite.instAlgebra`; `CategoryTheory.Mat.equivalenceSingleObj`
  (`Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)`, the precedent for entering a ring as `SingleObj Aᵐᵒᵖ`).
- Size: `CategoryTheory.EssentiallySmall` (with its instance for `Cᵒᵖ`),
  `CategoryTheory.SmallModel`, `CategoryTheory.equivSmallModel`, `CategoryTheory.LocallySmall`.
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
  (`Mathlib/Algebra/Category/Grp/AB.lean`); `IsFinitelyPresentable` and
  `ObjectProperty.isFinitelyPresentable` (`Mathlib/CategoryTheory/Presentable/Finite.lean`),
  `IsFinitelyAccessibleCategory` (`Mathlib/CategoryTheory/Presentable/LocallyPresentable.lean`; not
  `IsLocallyFinitelyPresentable`); `IsFiltered`, `IsCofiltered`, `CostructuredArrow`,
  `Functor.Elements`, `Functor.isCofiltered_elements`, `Cocone`, `IsColimit`, `colimit`,
  `Functor.DenseAt`, `Retract`, `Functor.ofSequence`; `IsIndObject` with `isIndObject_iff` and
  `isIndObject_iff_preservesFiniteLimits`; `PreservesFiniteLimits`, `HasCokernels`,
  `HasFiniteBiproducts`; `Functor.IsHomological` with the scoped instances of
  `Pretriangulated.Opposite`; `RepresentablyFlat` (covariant; named only to mark the difference,
  2.3).
- Morita equivalence: `IsMoritaEquivalent` and `MoritaEquivalence`
  (`Mathlib/RingTheory/Morita/Basic.lean`), for rings only.
- Dimensions: `CategoryTheory.projectiveDimension`, `CategoryTheory.HasProjectiveDimensionLT`,
  `CategoryTheory.HasProjectiveDimensionLE`, `projectiveDimension_le_iff`,
  `projectiveDimension_eq_bot_iff`, `CategoryTheory.injectiveDimension`,
  `CategoryTheory.HasInjectiveDimensionLE`; `HomologicalComplex.opcycles`, `QuasiIso`,
  `ChainComplex.single₀`; `CategoryTheory.IsNoetherianObject`
  (`Mathlib/CategoryTheory/Subobject/NoetherianObject.lean`); `IsCardinalPresentable` with
  `Cardinal.isRegular_aleph_one` (a local instance `Fact (Cardinal.aleph 1).IsRegular` in
  `Suggested.lean`). Mathlib has no global dimension, flat dimension or weak global
  dimension, and no finitely generated objects of a category.
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
  `IsSemisimpleRing`, `IsSemiprimaryRing`, `IsNoetherianRing`, `IsNilpotent`,
  `exists_isIdempotentElem_eq_of_ker_isNilpotent`, `MulOpposite`, `RingEquiv.opOp`,
  `RingEquiv.toOpposite`, `Module.compHom`, `ModuleCat.restrictScalars`,
  `ModuleCat.restrictScalarsEquivalenceOfRingEquiv`, `AddCommGrpCat`, `isSimpleModule_iff_isCoatom`,
  `IsCompactElement`, `Submodule.fg_iff_compact`, `CompleteOrthogonalIdempotents`.

### From Tau Ceti

- Finitely presented functors: `TauCeti.isFinitelyPresentedFunctor` and
  `TauCeti.IsFinitelyPresentedFunctor.additive`
  (`TauCeti.CategoryTheory.FinitelyPresentedFunctor.Basic`).
- Modules over an algebra: `ModuleCat.moduleOfAlgebra` and
  `ModuleCat.isScalarTower_moduleOfAlgebra` (`TauCeti.Algebra.Category.ModuleCat.Algebra`);
  `TauCeti.MatlisDual` with its right- and left-module instances
  (`TauCeti.RingTheory.MatlisDuality.Basic`); `ModuleCat.matlisDual` and `ModuleCat.matlisDualOp`
  (`TauCeti.Algebra.Category.ModuleCat.MatlisDual`).
- The balanced tensor product: `TauCeti.BalancedTensorProduct` with `tmul`, `balance`, `lift`,
  `hom_ext`, `induction_on`, `map` and `congr`
  (`TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic`); `lid` and `rid`
  (`...Balanced.Unit`); `finsuppScalarRight` (`...Balanced.Finsupp`); `assoc`
  (`...Balanced.Associator`).
- Character modules: `TauCeti.CharacterModule.eval_injective`
  (`TauCeti.Algebra.Module.CharacterModule`); `CharacterModule.instModuleMulOpposite`,
  `CharacterModule.opDual`, `CharacterModule.exact_opDual`,
  `CharacterModule.injective_of_projective` and `CharacterModule.projective_of_injective`
  (`TauCeti.Algebra.Module.CharacterModule.MulOpposite`).
- Global dimension: `TauCeti.globalDimension` with `TauCeti.globalDimension_def`,
  `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE`, `TauCeti.globalDimension_le_tfae`,
  `TauCeti.globalDimension_eq_iSup_cyclic`, `TauCeti.globalDimension_eq_iSup_finite`,
  `TauCeti.globalDimension_eq_globalDimension`, `TauCeti.globalDimension_eq_bot_iff`,
  `TauCeti.globalDimension_eq_zero_of_isSemisimpleRing` and
  `TauCeti.globalDimension_eq_one_of_isPrincipalIdealRing` (`TauCeti.RingTheory.GlobalDimension`);
  the refactor consumers `TauCeti.globalDimension_le_globalDimension_mulOpposite`,
  `TauCeti.globalDimension_mulOpposite`, `TauCeti.globalDimension_mulOpposite_of_moduleFinite` and
  `TauCeti.hasInjectiveDimensionLE_characterModule_iff`
  (`TauCeti.RingTheory.GlobalDimension.MulOpposite`);
  `CategoryTheory.Equivalence.projectiveDimension_functor_obj`
  (`TauCeti.Algebra.Homology.Ext.Equivalence`).
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
- The Jacobson radical: the instance `TauCeti.IsSemiprimaryRing.mulOpposite` and
  `TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`
  (`TauCeti.RingTheory.Jacobson.MulOpposite`); `TauCeti.isSemisimpleModule_quotient_smul_top`
  (`TauCeti.RingTheory.Jacobson.Semiprimary`).
- Ideals and the radical of a category (Layer 4): `TauCeti.MorphismIdeal` with
  `TauCeti.MorphismIdeal.le_def`, `TauCeti.MorphismIdeal.Quotient` and `quotientFunctor`
  (`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Basic`), its monoid structure
  (`...MorphismIdeal.Mul`) and `TauCeti.MorphismIdeal.op` (`...MorphismIdeal.Opposite`);
  `TauCeti.jacobsonRadicalIdeal` and `TauCeti.jacobsonRadical_self_eq_jacobson`
  (`TauCeti.CategoryTheory.Preadditive.Radical.Basic`);
  `TauCeti.exists_jacobsonRadicalIdeal_pow_eq_bot` (`...Radical.Nilpotent`).
- Krull–Schmidt categories and covers (Layer 4): `TauCeti.IsKrullSchmidt`
  (`TauCeti.CategoryTheory.Preadditive.KrullSchmidt.Basic`);
  `TauCeti.exists_equiv_iso_of_biproduct_iso_of_isLocalRing`
  (`TauCeti.CategoryTheory.Preadditive.KrullSchmidt.Uniqueness`; the check of 0.8);
  `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end`,
  `TauCeti.isKrullSchmidt_of_isSemiperfectRing_end` and
  `TauCeti.IsKrullSchmidt.isSemiperfectRing_end` (`...KrullSchmidt.Semiperfect`), the refactor
  consumers of 4.2; `TauCeti.IsEssentialEpi` (`TauCeti.CategoryTheory.Projective.Cover`);
  `TauCeti.isProjectiveCover_iff_forall_surjective`
  (`TauCeti.Algebra.Module.ProjectiveCover.Basic`).
- Finitely generated projective modules (0.8): `TauCeti.finiteProjectiveModules`
  (`TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`); `TauCeti.projectivizationFunctor`
  (`TauCeti.CategoryTheory.Preadditive.Projectivization`), as the one-object pattern.
- Semiperfect rings: `TauCeti.IsSemiperfectRing` with the instance
  `TauCeti.IsSemiperfectRing.of_isSemiprimaryRing` (`TauCeti.RingTheory.Jacobson.Semiperfect`), a
  refactor consumer (4.2);
  `TauCeti.IsSemiperfectRing.exists_completeOrthogonalIdempotents_isLocalRing_corner` and
  `TauCeti.IsSemiperfectRing.of_isLocalRing_corner` (`TauCeti.RingTheory.Idempotents.Semiperfect`);
  `CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`
  (`TauCeti.RingTheory.Idempotents.Primitive.Decomposition`);
  `IsIdempotentElem.isLocalRing_end_of_isLocalRing_corner`
  (`TauCeti.RingTheory.Idempotents.Corner.Local`); `IsIdempotentElem.projective_span_singleton`
  (`TauCeti.RingTheory.Idempotents.Projective`).
- Projective covers: `TauCeti.IsSuperfluous`, `TauCeti.IsSuperfluous.map` and
  `TauCeti.isSuperfluous_map_equiv_iff` (`TauCeti.Algebra.Module.Submodule.Superfluous`);
  `TauCeti.IsProjectiveCover`, `TauCeti.isProjectiveCover_id`,
  `TauCeti.IsProjectiveCover.exists_surjective`, `TauCeti.IsProjectiveCover.bijective_of_comp_eq`,
  `TauCeti.IsProjectiveCover.ker_le_jacobson` and `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`
  (`TauCeti.Algebra.Module.ProjectiveCover.Basic`); `TauCeti.exists_isProjectiveCover`
  (`...ProjectiveCover.Existence`);
  `TauCeti.isProjectiveCover_of_isSimpleModule_quotient_jacobson_smul_top`
  (`...ProjectiveCover.Simple`); `Module.Projective.sup_ne_top_of_isLocalRing_end`
  (`TauCeti.Algebra.Module.Projective.Local`).
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

None.

### From open pull requests

TauCetiProject/TauCeti#37151 (Auslander's defect formula, open):
`Function.Exact.contravariantDefectEquivKer` and `LinearMap.homCokernelMap`, for the ring form of
1.4. The roadmap does not depend on it; the ring form waits for the merge or goes through the
categorical form. The defect formula itself
(`Function.Exact.dualContravariantDefectEquivCovariantDefect`) is not a target here.

TauCetiProject/TauCeti#38013 (ArtinAlgebras §4.1, open): its Part 3 contains the ring items of 4.2,
including `isSemiperfectRing_tfae`. Its scope is contested; the placement of the ring items of 4.2
follows the outcome (4.2).

TauCetiProject/TauCeti#40807 (ArtinAlgebras §7.5, open): a consumer, not a supplier. It uses the
statements of `TauCeti.RingTheory.GlobalDimension.MulOpposite`, whose proofs 3.4 replaces; the bound
of 3.4 strengthens what it needs.

## How to read the build

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [0](#layer-0-modules-over-a-preadditive-category-and-their-tensor-product) | Modules over a preadditive category | `Mod C`, rings as `SingleObj Aᵐᵒᵖ`, tensor product over `C`, `I · M` and `C ⧸ I`, projective factors, swap, ring API, duals, `proj C` and the duality `Hom(-, C)` |
| [1](#layer-1-tor) | `Tor` | Left derived functor, long exact sequences, balance, `Tor` of the transpose, `Tor`–`Ext` duality, comparisons, `Tor₁` of cyclic modules, category algebras |
| [2](#layer-2-flat-modules-and-flat-functors) | Flat modules and flat functors | Ideal test, `Tor` and Lambek tests, Baer criterion, Lazard block, purity, flat = left exact, triangulated case, representation theorem, Bass's module, closure |
| [3](#layer-3-flat-dimension-global-and-weak-global-dimension) | Dimensions | Flat dimension, global dimension of an abelian category, Auslander's lemma, weak global dimension, symmetry, `FP_∞` lemma, Auslander's theorem, kernels and countably presented flat modules |
| [4](#layer-4-semiperfect-and-perfect-categories-and-basss-theorem-p) | Semiperfect and perfect categories | T-nilpotence and Nakayama's lemma for all modules, semilocal and semiperfect categories and rings, covers over semiperfect categories, perfect categories and left perfect rings, covers over them, the Mares–Simson lemma, Theorem P, global dimension and the Bass–Eilenberg criterion |

Each layer needs the previous ones; the ring items of 4.2 need only Mathlib and Tau Ceti. A name in
parentheses is the proposed Lean name of a headline declaration; auxiliary names are for the
implementer to choose.

## Layer 0: modules over a preadditive category and their tensor product

Throughout, `C : Type u` is preadditive with `Category.{v} C`, modules take values in
`AddCommGrpCat.{w}`, and `R` is a commutative ring.

### 0.1 `Mod C`

(`TauCeti.ModCat C := Cᵒᵖ ⥤+ AddCommGrpCat.{w}`; covariant functors are `TauCeti.ModCat Cᵒᵖ`.)

- **Abelian.** In `D ⥤ AddCommGrpCat`, the additive functors (Mathlib's `additiveFunctor`)
  contain the zero functor and are closed under kernels, cokernels and finite products, all
  computed objectwise (instances of `ObjectProperty.ContainsZero`,
  `ObjectProperty.IsClosedUnderKernels`, `ObjectProperty.IsClosedUnderCokernels` and
  `ObjectProperty.IsClosedUnderFiniteProducts`). Mathlib's instance for full subcategories then
  makes `Mod C` abelian, for every `C`, so also `Mod Cᵒᵖ`. The additive functors are also closed
  under colimits (`ObjectProperty.IsClosedUnderColimitsOfShape`; colimits commute with finite
  biproducts), so `Mod C` has the colimits of `AddCommGrpCat` (Layer 2 uses them).
- **Representables** (`TauCeti.ModCat.yoneda : C ⥤ ModCat.{v} C`, from Mathlib's
  `preadditiveYoneda`). `Hom(-, X)` is projective, since `Hom(Hom(-, X), F) ≅ F(X)` by Yoneda. When
  `C` is `EssentiallySmall.{w}`, every module is a quotient of a coproduct of representables
  (lifted by `ULift` when `w ≠ v`), so `Mod C` has enough projectives ([Mitchell, §3, pp. 15–18]).
  Over `Cᵒᵖ`, `(ModCat.yoneda Cᵒᵖ).obj (op X)` is the covariant representable `Hom(X, -)`; the
  covariant representables enter this way and not through Mathlib's `preadditiveCoyoneda`
  (Convention 1).
- **`R`-linear structure** (`TauCeti.Functor.objModule`, `TauCeti.Functor.toModuleCat`, and an
  instance `Linear R (ModCat C)`). For `Linear R C`, `r` acts on `F(c)` by `F(r • 𝟙 c)`; every
  `F(f)` is then `R`-linear, so `F` becomes a functor to `ModuleCat R`, and every natural
  transformation is `R`-linear. `Mod C` is `R`-linear with `(r • α)_c = r • α_c`; through Mathlib's
  `Linear.oppositeCategory` the same holds for `Mod Cᵒᵖ`. [Mitchell, §11, p. 51]: for an
  `R`-linear `C`, the `R`-linear functors to `R`-modules are the additive functors to abelian
  groups.
- **`mod C ⊆ Mod C`** (`TauCeti.isFinitelyPresentedFunctor_le_additiveFunctor`, with the inclusion
  `TauCeti.ModCat.ιFinitelyPresented`; `w = v`). Tau Ceti's finitely presented functors are an
  `ObjectProperty` on the same ambient category `Cᵒᵖ ⥤ AddCommGrpCat.{v}`, and they are additive
  (`TauCeti.IsFinitelyPresentedFunctor.additive`). So the inclusion is an inequality of
  properties, and `mod C` needs no migration.

**Checks.**

- For the `k`-linear category of the quiver `1 → 2` (one nonzero morphism space `Hom(1, 2) = k`
  besides the identities), a module is a pair of vector spaces with a linear map `V₂ → V₁`; the
  representables `Hom(-, 1)` and `Hom(-, 2)` are `0 → k` and `k → k`, the indecomposable
  projective modules. The covariant functors, the modules over `Cᵒᵖ`, are the representations
  `V₁ → V₂`.
- For `C = SingleObj Aᵐᵒᵖ`, `Mod C` is `ModuleCat A` (0.2).

*Needs:* Mathlib `additiveFunctor`, the closure classes and the full-subcategory abelian instance,
`preadditiveYoneda`, `Linear`, `Linear.oppositeCategory`, `EssentiallySmall`; Tau Ceti
`TauCeti.isFinitelyPresentedFunctor`.

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
  `Small.{v} Aᵐᵒᵖ` follows from `Small.{v} A` (`TauCeti.small_mulOpposite`, an instance).
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

For an `R`-linear `C`, a covariant functor `G` (an object of `Mod Cᵒᵖ`) and a module `F` of
`Mod C`, the tensor product `G ⊗_C F` (`TauCeti.ModCat.tensorObj R G F`) is the coend in
`ModuleCat R` of `G(c') ⊗_R F(c)`, with the derived `R`-structures of 0.1. The covariant functor
comes first, as the right module `M` in `M ⊗_A N` (Convention 6). In `Suggested.lean` the bifunctor
`(x, y) ↦ G(x) ⊗_R F(y)` (`TauCeti.tensorBifunctor`) is stated on `Dᵒᵖ × D` and used at `D = Cᵒᵖ`,
so the coend runs over `Cᵒᵖ`. Concretely `G ⊗_C F` is the quotient of `⊕_c G(c) ⊗_R F(c)` by the
elements `x ⊗ F(f) y - G(f) x ⊗ y` for `f : c → c'` ([Mitchell, §6, pp. 26–27, and §11, p. 52];
[ML, IX.6, p. 226]). Mathlib's `CategoryTheory.coend` is the definition, not a hand-built
quotient; it exists when `C` is `EssentiallySmall.{w}` (Mathlib passes this to `Cᵒᵖ`). The
summands are `ModuleCat.of R (G(c') ⊗[R] F(c))`. API:

- the pure tensor `x ⊗ y` at `c` (`TauCeti.ModCat.tmul`), balancing `x ⊗ F(f) y = G(f) x ⊗ y`
  (`TauCeti.ModCat.tmul_balance`), induction (`TauCeti.ModCat.tensorObj_induction_on`),
  extensionality (`TauCeti.ModCat.tensorObj_hom_ext`), and the lift of a balanced family of
  `R`-bilinear maps (`TauCeti.ModCat.tensorLift`, `tensorLift_tmul`);
- the bifunctor (`TauCeti.ModCat.tensor R : ModCat Cᵒᵖ ⥤ ModCat C ⥤ ModuleCat R`), additive in
  each variable, with its values on pure tensors (`tensor_map_app_tmul`, `tensor_obj_map_tmul`);
- **adjunctions** (`TauCeti.ModCat.tensorAdjunction`, `TauCeti.ModCat.tensorAdjunction'`):
  `Hom_R(G ⊗_C F, X) ≅ Hom_{Mod C}(F, Hom_R(G(-), X))`, and the mirror
  `Hom_R(G ⊗_C F, X) ≅ Hom_{Mod Cᵒᵖ}(G, Hom_R(F(-), X))`, natural in all variables; the right
  adjoints come from the bifunctors `TauCeti.ModCat.homBifunctor` and
  `TauCeti.ModCat.homOpBifunctor`, with partial applications `homFunctor` and `homOpFunctor`
  ([Mitchell, §6, p. 26, (2)]);
- **right exactness**: each partial functor preserves colimits, from the adjunctions
  (`TauCeti.ModCat.preservesColimits_tensor_obj`,
  `TauCeti.ModCat.preservesColimits_tensor_flip_obj`); in particular it is right exact and
  preserves direct sums;
- **Yoneda** (`TauCeti.ModCat.tensorObjYonedaIso`, `TauCeti.ModCat.yonedaTensorObjIso`):
  `G ⊗_C Hom(-, X) ≅ G(X)` and `Hom(X, -) ⊗_C F ≅ F(X)` ([Mitchell, §6, p. 26, (1)]);
- **change of base** (`TauCeti.ModCat.tensorObjRestrictScalarsIso`): for `R → R'` such that the
  `R`-structure of `C` comes from its `R'`-structure, the `R'`-tensor product restricted to `R` is
  the `R`-tensor product;
- **independence of `R`** (`TauCeti.ModCat.tensorObjIntIso`), the case `ℤ → R`: the `ℤ`-coend
  already forces `r x ⊗ y = x ⊗ r y`, because `r` acts through the morphism `r • 𝟙` of `C`
  ([Mitchell, §11, p. 52]);
- **ideals** (`TauCeti.MorphismIdeal.smul`, `TauCeti.MorphismIdeal.quotientYoneda`,
  `TauCeti.ModCat.tensorObjQuotientYonedaIso`): for a two-sided ideal `I` of `C` (Tau Ceti's
  `TauCeti.MorphismIdeal`) and a module `M` of `Mod C`, `I · M` is the family of subgroups
  `(I · M)(c)` generated by the `M(f)(x)` with `f ∈ I(c, d)` and `x ∈ M(d)`; for
  `C = SingleObj Aᵐᵒᵖ` it is `J • ⊤`. The module `(C ⧸ I)(-, X) = Hom_{C ⧸ I}(-, X)` of `Mod C`
  comes through Tau Ceti's quotient functor `TauCeti.MorphismIdeal.quotientFunctor`, and the
  covariant `(C ⧸ I)(X, -)` is the same construction over `Cᵒᵖ` for Tau Ceti's opposite ideal
  `TauCeti.MorphismIdeal.op I`. Then `(C ⧸ I)(X, -) ⊗_C M ≅ M(X) ⧸ (I · M)(X)`, by right exactness
  and Yoneda ([OR, Lemma 1.2, p. 94], stated for a covariant module and an ideal of `Hom(-, X)`,
  applied to `Cᵒᵖ`). Layer 4 uses `I · M` for Nakayama's lemma (4.1) and the isomorphism for the
  Bass–Eilenberg criterion (4.6).

**Checks.**

- For `C = SingleObj Aᵐᵒᵖ`, 0.6 identifies `G ⊗_C F` with `M ⊗_A N`, in the same order.
- In the quiver example of 0.1, `Hom(1, -) ⊗_C F ≅ F(1)` by Yoneda.

*Needs:* 0.1; Mathlib `coend`, `HasCoend`, `TensorProduct`, `ModuleCat.restrictScalars`,
`Adjunction.leftAdjoint_preservesColimits`; Tau Ceti `TauCeti.MorphismIdeal`, its quotient and
`TauCeti.MorphismIdeal.op`.

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

(`TauCeti.ModCat.toModCatOpOp`, `TauCeti.ModCat.tensorObjSwapIso`.) A covariant `G`, an object of
`Mod Cᵒᵖ`, is as it stands a module over `Cᵒᵖ`, and a module `F` of `Mod C` is a covariant functor
on `Cᵒᵖ`, an object of `Mod Cᵒᵖᵒᵖ` through `(unopUnop C).op` (`ModCat.toModCatOpOp`). Then
`G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`, `R`-linear and natural, by `x ⊗ y ↦ y ⊗ x` on the coends ([Mitchell, §6,
p. 26], where `G ⊗ F` is defined as `F ⊗ G`). It is compatible with `tmul`, `tensorLift` and the
adjunctions, so each statement in the covariant variable follows from the one in the `Mod C`
variable over `Cᵒᵖ`. Mathlib's `Linear.oppositeCategory` makes `Cᵒᵖ` `R`-linear, and
`EssentiallySmall` passes to `Cᵒᵖ`. The ring swap of 0.6 follows from this,
`TauCeti.singleObjMulOppositeEquiv` (0.2) and the comparison of 0.6.

*Needs:* 0.3; Mathlib `unopUnop`, `Linear.oppositeCategory`.

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
  `R'`-modules agree, `R`-linearly, by `m ⊗ n ↦ m ⊗ n`. These, not dropping linearity, handle the
  two `ℤ`-module structures on `M ⊗_A N` for `R = ℤ`.
- **Comparison** (`TauCeti.BalancedTensorProduct.tensorObjSingleObjIso`): for `[Small.{v} A]`,
  the tensor product over `SingleObj Aᵐᵒᵖ` (0.3) of the modules of 0.2 is `M ⊗_A N`, in the same
  order, `R`-linearly and naturally, with `x ⊗ y` at `∗` going to `m ⊗ n`. It uses
  `Linear R (SingleObj Aᵐᵒᵖ)`, the agreement of the derived `R`-structures (0.2) and the
  independence of `R` (0.3).
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

For an `R`-module `E : ModuleCat.{w} R`, the dual of a module `F` of `Mod C` is the covariant
functor `F^E = Hom_R(F(-), E)` (`TauCeti.ModCat.dual R E : (ModCat C)ᵒᵖ ⥤ ModCat Cᵒᵖ`), and the dual
of a covariant `G` is the module `G^E = Hom_R(G(-), E)` of `Mod C` (`TauCeti.ModCat.dualOp R E`):
the right adjoints of 0.3 evaluated at `E`, as Tau Ceti's `MatlisDual R E` for rings. The adjunction
of 0.3 at `X = E` is `Hom_R(G ⊗_C F, E) ≅ Hom_{Mod Cᵒᵖ}(G, F^E)`. The hypotheses on `E` sit on the
theorems:

- `E` injective: the dual is exact (`TauCeti.ModCat.dual_shortExact`);
- `E` a cogenerator (Mathlib's `IsCoseparator`): the dual detects zero objects
  (`TauCeti.ModCat.isZero_of_isZero_dual`), and with the adjunction, `i ⊗_C F` is a monomorphism
  exactly when composition with `i`, `Hom(G', F^E) → Hom(G, F^E)`, is onto
  (`TauCeti.ModCat.mono_tensor_map_app_iff`);
- Lambek's flatness criterion (Layer 2) uses both.

Special cases: `R = ℤ` and `E = ℚ ⧸ ℤ`, Mathlib's `CharacterModule` (for `Mod C` this gives a
cogenerating family of injectives, [Mitchell, §6, p. 27]); Matlis duals `MatlisDual R E` for
Auslander-Reiten theory. Lambek's criterion with a general injective cogenerator `E` is 2.2 (6); it
follows from the adjunction, already over a commutative base ring in [OR, (1.1), p. 93].

*Needs:* 0.3; Mathlib `IsCoseparator`, `ShortComplex.ShortExact`; Tau Ceti `TauCeti.MatlisDual`.

### 0.8 Finitely generated projective modules and duality

A module is **finitely generated** (`TauCeti.ModCat.IsFinitelyGenerated`) if it is a quotient of a
finite sum of representables `Hom(-, Z₁) ⊕ ⋯ ⊕ Hom(-, Zₘ)`. `proj C` (`TauCeti.ModCat.proj C`) is
the full subcategory of finitely generated projective modules of `Mod C`, so that `C ⊆ proj C`
covariantly by Yoneda; the finitely generated projective covariant functors are `proj Cᵒᵖ`. For
`C = SingleObj Aᵐᵒᵖ`, `proj C` is Tau Ceti's `TauCeti.finiteProjectiveModules A`, the finitely
generated projective left modules.

- **Closure** (instances): `proj C` has finite biproducts and split idempotents.
- **Yoneda** (`TauCeti.ModCat.projYoneda : C ⥤ proj C`, `X ↦ Hom(-, X)`): fully faithful, so
  `End Hom(-, X) = End X`. Over `Cᵒᵖ` it gives `X ↦ Hom(X, -)` in `proj Cᵒᵖ`.
- **Karoubi** (`TauCeti.ModCat.projEquivKaroubiMat : proj C ≌ Karoubi (Mat_ C)`), a target: every
  object of `proj C` is a summand of a finite sum of representables, and Yoneda is fully faithful
  on finite sums. Tau Ceti's `TauCeti.projectivizationFunctor` (`add M` against the finitely
  generated projective `End M`-modules) is the one-object pattern.
- **Additive idempotent-complete `C`** (an instance `(ModCat.projYoneda C).IsEquivalence` for
  `[HasFiniteBiproducts C] [IsIdempotentComplete C]`): `C ≃ proj C`.
- **Duality** (`TauCeti.ModCat.projDual : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`,
  `TauCeti.ModCat.projDualYonedaIso`): `(-)^∨ = Hom(-, C)`, with `Hom(-, X) ↦ Hom(X, -)`. It is
  built from the two Karoubi equivalences and `(Mat_ C)ᵒᵖ ≌ Mat_ Cᵒᵖ` (transposed matrices); Mathlib
  has no such duality for `Karoubi` or `Mat_`. The transpose of 1.4 is defined through it.
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
`TauCeti/CategoryTheory/Preadditive/KrullSchmidt/Uniqueness.lean`).

*Needs:* 0.1, 0.2, 0.5; Mathlib `Mat_`, `CategoryTheory.Idempotents.Karoubi`,
`IsIdempotentComplete`, `ObjectProperty.lift`; Tau Ceti `TauCeti.finiteProjectiveModules`,
`TauCeti.projectivizationFunctor` (pattern),
`TauCeti.exists_equiv_iso_of_biproduct_iso_of_isLocalRing` (check).

### Examples

Rings (0.2, 0.6); `k`-linear categories of quivers, whose modules are the representations of the
opposite quiver; Tau Ceti's `mod C` inside `Mod C`. The commutative comparison of 0.6 makes every
Mathlib tensor computation an example of `M ⊗_A N`. Finitely generated projective modules over a
ring or a quiver category (0.8).

### Dependencies

Mathlib and Tau Ceti only.

## Layer 1: `Tor`

Throughout, `C : Type u` is an `R`-linear category with `Category.{v} C` and
`EssentiallySmall.{w} C`, modules take values in `AddCommGrpCat.{w}`, and `Tor` takes values in
`ModuleCat.{w} R`. There is one `Tor`, `Tor^C_n(G, F)` with the covariant functor `G` first, derived
in the `Mod C` variable `F` (Convention 6). The version that resolves `G` is `Tor` over `Cᵒᵖ`, read
through the swap of 0.5. Items 1.1–1.6 end with their ring statements.

### 1.1 Definition

(`TauCeti.ModCat.tor R n : ModCat Cᵒᵖ ⥤ ModCat C ⥤ ModuleCat R`.) The object at `G` is
`((ModCat.tensor R).obj G).leftDerived n`, Mathlib's classical `Functor.leftDerived` of
`F ↦ G ⊗_C F`, and maps act by `NatTrans.leftDerived`. This is the shape of Mathlib's
`CategoryTheory.Tor`. It needs projective resolutions in `Mod C`: enough projectives (0.1) and
Mathlib's instance `HasProjectiveResolutions` for abelian categories with enough projectives. API:

- degree zero (`TauCeti.ModCat.torZeroIso : tor R 0 ≅ tensor R`): `Functor.leftDerivedZeroIsoSelf`,
  since `G ⊗_C -` preserves colimits (0.3);
- vanishing (`TauCeti.ModCat.isZero_tor_succ_of_projective`): `Tor_{n+1}(G, F) = 0` for a
  projective `F` (`Functor.isZero_leftDerived_obj_projective_succ`);
- computation from any projective resolution `P` of `F` (`TauCeti.ModCat.torObjIsoHomology`):
  `Tor_n(G, F) ≅ H_n(G ⊗_C P)`, Mathlib's `ProjectiveResolution.isoLeftDerivedObj`;
- linearity: additive and `R`-linear in each variable; in `G` through `NatTrans.leftDerived`
  and Tau Ceti's `NatTrans.leftDerived_add`.

**Rings** (`TauCeti.BalancedTor R A n : ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`),
for an `R`-algebra `A` with `[Small.{v} A]`. Native, as Convention 5 asks: the object at `M` is
`((BalancedTensorProduct.functor R A).obj M).leftDerived n`, the left derived functor of the ring
bifunctor of 0.6 in the left-module variable. API as above (`TauCeti.balancedTorZeroIso`,
`TauCeti.isZero_balancedTor_succ_of_projective`), and the comparison
(`TauCeti.balancedTorIsoTorSingleObj`) with `Tor` over `SingleObj Aᵐᵒᵖ` through the equivalences of
0.2, in the same order, from 0.6's comparison of tensor products: the equivalences preserve
projective resolutions.

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

(`TauCeti.ModCat.torBalanceIso : tor R n ≅ (ModCat.toModCatOpOp C ⋙ tor R n).flip`.)
`Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)`, `R`-linear and natural in both variables, where `F` is a
covariant functor on `Cᵒᵖ` and `G` a module over `Cᵒᵖ`, as in 0.5. Route ([Weibel, Thm. 2.7.2,
pp. 58–59]): for projective resolutions `P` of `G` and `Q` of `F`, form the first-quadrant
bicomplex `P_p ⊗_C Q_q`. Its augmented rows `P_p ⊗ Q → P_p ⊗ F` and columns `P ⊗ Q_q → G ⊗ Q_q`
are exact, since tensoring with a projective is exact on both sides (0.3, 0.4). Tau Ceti's
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`, applied to the bicomplex and to its flip
(with Tau Ceti's `HomologicalComplex₂.totalComplexShapeSymmetryDownNat`), identifies both
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
Prop. 3.2]). Route (the owner's): Krause's snake-lemma step ([Krause-Defect]), without dualizing.
Take `0 → ΩN → P → N → 0` with `P` projective, and a presentation `P₁ → P₀ → X → 0` by finite
projectives. Put `H(M) = coker(Hom(P₀, M) → Hom(P₁, M))`. The snake lemma identifies `δ^*(X) =
coker(Hom(X, P) → Hom(X, N))` with `ker(H(ΩN) → H(P))`. Here `δ^*(X)` is the stable `Hom(X, N)`,
since a map from `X` that factors through a projective factors through `P → N`; and `H(M) ≅ Tr X ⊗
M` naturally in `M`. So the kernel is `ker(Tr X ⊗ ΩN → Tr X ⊗ P)`, which is `Tor_1(Tr X, N)` by the
long exact sequence of 1.3 and `Tor_1(Tr X, P) = 0` (1.1).

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
- **Rings** (`TauCeti.stableHomEquivBalancedTorTranspose`): for a presentation `f : P₁ → P₀`,
  `P₀ → X → 0` by finite projective left modules, `stable Hom_A(X, N) ≃ₗ[R] Tor_1^A(Tr X, N)`, with
  Tau Ceti's `TauCeti.AuslanderReitenTranspose f` (`Hom_A(P₁, A)` modulo the image of
  `Hom_A(P₀, A)`, the ring case of the definition above at `SingleObj Aᵐᵒᵖ`). Route:
  `Function.Exact.contravariantDefectEquivKer` (the snake lemma step) from the open
  TauCetiProject/TauCeti#37151, and Tau Ceti's
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel` (`H(M) ≅ Tr X ⊗ M`, natural by
  `auslanderReitenTransposeTensorEquivCokernel_map`), once #37151 merges; the roadmap does not
  depend on that PR. The stable `Hom` matches Tau Ceti's
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom`.

Auslander's defect formula `D δ^*(X) ≅ δ_*(D Tr X)` itself stays with
[ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §4.2, and #37151; it is a
supplier, not a target here. Layer 2 uses this item for "finitely presented flat modules are
projective" (2.3).

*Needs:* 0.8, 1.1–1.3; Tau Ceti `TauCeti.AuslanderReitenTranspose`,
`LinearMap.auslanderReitenTransposeTensorEquivCokernel`,
`TauCeti.ExactStructure.projectiveStableFunctor`, `TauCeti.ExactStructure.abelian`,
`ModuleCat.tensorHomCokernelEquivProjectiveStableHom`; from
#37151 (open) `Function.Exact.contravariantDefectEquivKer`.

### 1.5 `Tor`–`Ext` duality

(`TauCeti.ModCat.torExtDualityEquiv`.) For an injective `R`-module `E`,

    Hom_R(Tor_n^C(G, F), E) ≃ₗ[R] Ext^n(G, F^E),

natural in `G` and `F`, where `F^E` is the dual of 0.7, a covariant functor, and `Ext` is Mathlib's
derived-category `Abelian.Ext` in `Mod Cᵒᵖ` (the `Ext` that Tau Ceti uses throughout). Mathlib's
`Abelian.Ext` is an `R`-module for an `R`-linear abelian category
(`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`), so the statement is `R`-linear.
Route: compute `Tor` from a projective resolution `P` of `G` (by the balance); then
`Hom_R(H_n(P ⊗_C F), E) ≅ H^n(Hom_R(P ⊗_C F, E))`, since `Hom_R(-, E)` is exact; the adjunction of
0.7 termwise gives `Hom_R(P ⊗_C F, E) ≅ Hom(P, F^E)`; and Mathlib's
`ProjectiveResolution.extEquivCohomologyClass`
(`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`) identifies `Ext^n(G, F^E)` with the
degree-`n` cohomology classes from `P`. No classical `Ext` and no comparison of `Ext`s is needed
([CE, VI, Prop. 5.1, p. 120]; [Lambek, p. 241] for `R = ℤ`, `E = ℚ ⧸ ℤ`). This item includes the
instance `HasExt.{w} (Mod C)` (Mathlib's `hasExt_of_enoughProjectives`, as for `ModuleCat`), which
applies to `Mod Cᵒᵖ` as well.

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
  Mathlib's `Mathlib/CategoryTheory/Monoidal/Tor.lean` leaves open; a candidate for upstreaming.
  Tau Ceti's results on Mathlib's `Tor` and `Tor'` over commutative rings
  (`TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor`, `TauCeti.CategoryTheory.Monoidal.Tor`) then
  apply to `BalancedTor R R`.
- **Change of base and independence of `R`** (`TauCeti.ModCat.torRestrictScalarsIso`,
  `TauCeti.ModCat.torIntIso`; rings `TauCeti.balancedTorRestrictScalarsIso`,
  `TauCeti.balancedTorIntIso`): restricting `Tor` over `R'` to `R` gives `Tor` over `R`, when the
  `R`-structure comes from the `R'`-structure; the case `ℤ → R` says the underlying groups do not
  depend on `R`. Route: 1.1's computation from one resolution, and 0.3 or 0.6 termwise.
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
algebra** (`TauCeti.CategoryAlgebra C`) is `⊕_{x,y} Hom(x, y)`, the families `a x y : x ⟶ y` with
`(a * b) x z = ∑_y a x y ≫ b y z` and the identities on the diagonal as unit ([Mitchell, §7,
p. 33], where it is `[C]`). The product is composition in diagrammatic order, so
`CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≅ A`, since `f ≫ g = op (unop f * unop g)` there. For an
`R`-linear `C` it is an `R`-algebra.

- **Morita equivalence** (`TauCeti.modCatEquivCategoryAlgebra :
  ModCat C ≌ ModuleCat (CategoryAlgebra C)` and `TauCeti.modCatOpEquivCategoryAlgebra :
  ModCat Cᵒᵖ ≌ ModuleCat (CategoryAlgebra C)ᵐᵒᵖ`), `R`-linear: `F ↦ ⊕_x F(x)`, with `a` acting by
  the `F(a x y) : F(y) → F(x)` ([Mitchell, Thm. 7.1, pp. 33–35]). The construction is the one of
  Tau Ceti's `TauCeti.quiverRepEquivalence : QuiverRep k Q ≌ ModuleCat (pathAlgebra k Q)` (carrier
  `⊕ᵥ Mᵥ`). Mathlib's `IsMoritaEquivalent` compares two rings; through these equivalences, two
  finite-object categories with `R`-linearly equivalent module categories have Morita equivalent
  category algebras. For a full subcategory `C' ⊆ C` on some of the objects, the category algebra
  of `C'` is the corner `e Λ e` of `Λ = CategoryAlgebra C` at `e = ∑_{x ∈ C'} 𝟙 x`, so Tau Ceti's
  `IsIdempotentElem.isMoritaEquivalent_corner` applies when `e` is full.
- **Tensor and `Tor`** (`TauCeti.tensorObjCategoryAlgebraIso`,
  `TauCeti.torCategoryAlgebraIso`): the equivalences carry `G ⊗_C F` to the balanced tensor product
  over the category algebra and `Tor^C_n` to `BalancedTor R (CategoryAlgebra C) n` ([Mitchell, §7,
  p. 37, (1)]). Route: by the adjunctions (0.3, 0.6) both tensor products represent the same
  functor; the equivalences preserve projective resolutions.

This generalizes the one-object comparisons of 0.2, 0.6 and 1.1. It sits in Layer 1 because its
point is the comparison of `Tor`; its tensor part uses only Layer 0.

**Check.** For the `k`-linear category `C` of the quiver `1 → 2` (0.1), the category algebra is a
path algebra of `A₂`, which Tau Ceti identifies with the upper triangular matrices `T₂(k)`
(`TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`; [Mitchell, §7, Example 1, p. 33] for posets).
So `Tor^C` is `Tor^{T₂(k)}`, and the checks below for `T₂(k)` can be computed with the
representables of `C`.

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
  `J = e₁₂T ≅ e₂₂T` is projective. By 1.7 the same groups are computed over the quiver category
  of `1 → 2`, with the representables as projectives.

### Examples

Rings: `ℤ`, `B = k[ε]/(ε²)` and `T₂(k)` as in the checks. Categories: representables, and finite
quiver categories through their path algebras (1.7). The balance makes `Tor` computable from a
resolution of either variable.

### Dependencies

Layer 0.

## Layer 2: flat modules and flat functors

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{v} C`. Flatness
is stated for modules in the universe `v` of the morphisms, where the representables live (0.1). A
category that is only `EssentiallySmall.{w}` passes to Mathlib's `SmallModel`, and flatness is
invariant under the equivalence. The definition is for modules of `Mod C`, contravariant functors;
a covariant functor is flat when it is flat as a module over `Cᵒᵖ`. [OR], [St], [CB], [Fisher],
[Krause-Smashing] and [Mitchell, §10] state flatness for contravariant functors, as here; [Simson]
states it for covariant functors and is applied to `Cᵒᵖ` (Convention 14). Items 2.1–2.6 end with
their ring statements.

### 2.1 Definition

(`TauCeti.ModCat.yonedaSpan β`, `TauCeti.ModCat.coyonedaSpan β`, `TauCeti.ModCat.Flat F`.) For
finitely many morphisms `β_j : Y_j → X`, `yonedaSpan β ⊆ Hom(-, X)` is the image of
`⊕_j Hom(-, Y_j) → Hom(-, X)`; these are the finitely generated subfunctors of `Hom(-, X)`. Over
`Cᵒᵖ` this gives, for `β_j : X → Y_j`, the subfunctor `coyonedaSpan β ⊆ Hom(X, -)`, the image of
`⊕_j Hom(Y_j, -) → Hom(X, -)`; these are the finitely generated subfunctors of the covariant
representable `Hom(X, -)`, and for `C = SingleObj Aᵐᵒᵖ` the finitely generated right ideals of `A`.
A module `F` of `Mod C` is **flat** if for every object `X` and every finitely generated subfunctor
`I ⊆ Hom(X, -)` the map `I ⊗_C F → Hom(X, -) ⊗_C F ≅ F(X)` is injective (a monomorphism in
`ModuleCat ℤ`; Yoneda, 0.3). This is the ideal test of [OR, Thm. 3.2 (3), p. 96], whose modules are
contravariant and whose ideals lie in `X(z, -)`, as here; for rings it is the test on finitely
generated right ideals ([Lam-LMR, (4.12), p. 125]). The definition is universe-free: it quantifies
over objects and finite families of morphisms of `C`, not over modules. A covariant functor `G` is
flat when it is flat as a module over `Cᵒᵖ` (`ModCat.Flat G` for `G : ModCat Cᵒᵖ`); by the swap,
this says that `G ⊗_C -` passes the ideal test.

- **Independence of `R`** (`TauCeti.ModCat.flat_iff_mono_tensor`): for an `R`-linear `C`, the
  ideal test with the tensor product over `R` is equivalent, by the independence of `R` (0.3).
- **Ambient and intrinsic flatness.** `Flat` is flatness as a module. An object of the full
  subcategory `Flat(C)` of flat modules may also be called flat *inside* that category, when every
  epimorphism onto it there is pure; this is a different notion ([CI]). The docstring of `Flat`
  says so. The intrinsic notion is not developed here.

**Rings** (`TauCeti.Module.BalancedFlat A M`), a native class for a left module `M` (Convention 5):
`I ⊗_A M → A ⊗_A M` is injective for every finitely generated right ideal `I`, over `R = ℤ`. A
right module `M` is flat when `BalancedFlat Aᵐᵒᵖ M`. Mathlib lists the generalization of
`Module.Flat` to noncommutative rings as a TODO (`Mathlib/RingTheory/Flat/Basic.lean`); if it is
made, `BalancedFlat` is replaced by `Module.Flat`. Bridges: flatness over `SingleObj Aᵐᵒᵖ`
(`TauCeti.Module.balancedFlat_iff_flat_singleObj`, through 0.2 and 0.6), and for a commutative ring
Mathlib's `Module.Flat` (`TauCeti.Module.balancedFlat_iff_flat`, through 0.6).

*Needs:* 0.1–0.3, 0.5, 0.6; Mathlib `Subobject`, `imageSubobject`, `Limits.Sigma.desc`.

### 2.2 Tests

(`TauCeti.ModCat.flat_tfae`.) For a module `F` of `Mod C`, the following are equivalent:

1. `F` is flat (the ideal test);
2. `I ⊗_C F → F(X)` is injective for every subfunctor `I ⊆ Hom(X, -)` ([OR, Thm. 3.2 (3)]);
3. `- ⊗_C F` preserves monomorphisms, so it is exact on `Mod Cᵒᵖ` ([OR, Thm. 3.2 (1), p. 96];
   [Mitchell, §10, p. 48]). This holds for covariant functors in every universe; in Lean it is
   stated in the universe `v`, since `⊗_C` takes both modules in one universe (0.3);
4. `Tor_1(-, F) = 0`; then `Tor_n(-, F) = 0` for all `n ≥ 1`
   (`TauCeti.ModCat.Flat.isZero_tor_succ`; dimension shifting by 1.2 and 1.3);
5. `Tor_1(Hom(X, -) ⧸ I, F) = 0` for every finitely generated `I ⊆ Hom(X, -)`;
6. **Lambek**: the dual `F^E = Hom_R(F(-), E)` of 0.7 is injective in `Mod Cᵒᵖ`, for an injective
   cogenerator `E` of `R`-modules (`TauCeti.ModCat.flat_iff_injective_dual`; [Lambek, Theorem,
   p. 239] for rings and `E = ℚ ⧸ ℤ`; [St, Thm. 3 (d), p. 357] for functors). For a general `E` it
   follows from the adjunction of 0.7 ([OR, (1.1), p. 93]) and 0.7's one-map criterion.

Route: the textbook one, Lambek and Baer, organized as in [Lam-LMR, (4.12)]. (2) ⇒ (1) and
(3) ⇒ (2) are immediate. (1) ⇒ (2): an element of `I ⊗_C F` comes from `I' ⊗_C F` for a finitely
generated `I' ⊆ I`. (2) ⇒ (6): by 0.7, (2) says that every map from a subfunctor of a covariant
representable to `F^E` extends to the representable; then the Baer criterion below, over `Cᵒᵖ`.
(6) ⇒ (3) by 0.7. (3) ⇔ (4) and (4) ⇒ (5) ⇒ (1) by the long exact sequences of 1.2 and the
vanishing of `Tor` at projective covariant functors (1.3), applied to `0 → K → P → G → 0` and to
`0 → I → Hom(X, -) → Hom(X, -) ⧸ I → 0`. The [OR] route through the equational criterion and
filtered colimits is not followed for this item. Each test holds for covariant functors over `Cᵒᵖ`
(`TauCeti.ModCat.Flat.mono_tensor_obj_map` for (3)).

Two targets of this item:

- **Baer's criterion for `Mod C`** (`TauCeti.ModCat.Baer`, `TauCeti.ModCat.baer_iff_injective`): a
  module `E` is injective exactly when every map from a subfunctor of a representable `Hom(-, X)`
  to `E` extends to `Hom(-, X)`. Route: Zorn's lemma on partial extensions, as Mathlib's
  `Module.Baer.injective`; the representables generate, since an element of `F(X)` is a map
  `Hom(-, X) → F`. Not in Mathlib (only `Module.Baer`) or Tau Ceti. The test above uses it over
  `Cᵒᵖ`.
- **`Tor` commutes with filtered colimits** in the `Mod C` variable
  (`TauCeti.ModCat.preservesFilteredColimits_tor_obj`). Route: compute `Tor` from a projective
  resolution `P` of the covariant variable (1.3); each `P_p ⊗_C -` preserves colimits (0.3), and
  filtered colimits are exact in `ModuleCat R` (Mathlib's `AB5` instances). [OR, Lemma 3.1, p. 96]
  uses this; 2.3 and 2.6 need it.

**Rings** (`TauCeti.Module.balancedFlat_tfae`). For `[Small.{v} A]` and `M : Type v`, the following
are equivalent: `BalancedFlat A M`; `I ⊗_A M → M` is injective for every right ideal `I`; `i ⊗ M` is
injective for every injective map `i` of right modules in the universe `v`; `Tor_1^A(N, M) = 0` for
every right module `N`; `Tor_1^A(A ⧸ I, M) = 0` for every finitely generated right ideal `I`;
`Module.Injective Aᵐᵒᵖ M⁺` ([Lambek, Theorem, p. 239]; [Lam-LMR, (4.9), p. 125]). Route: the same,
with Mathlib's `Module.Baer.injective` over `Aᵐᵒᵖ` and the duals of 0.6, or through
`balancedFlat_iff_flat_singleObj`. Also: flat modules have no higher `Tor`
(`TauCeti.isZero_balancedTor_succ_of_balancedFlat`), and ring `Tor` commutes with filtered colimits
(`TauCeti.preservesFilteredColimits_balancedTor_obj`).

*Needs:* 0.3, 0.4, 0.7, 1.1–1.3; Mathlib `Subobject`, `Injective`, `IsCoseparator`,
`PreservesFilteredColimitsOfSize`, `AB5`, `Module.Baer.injective`.

### 2.3 The Lazard block

These characterizations use finite data ([OR, Thm. 3.2 (4)–(6)]; [Lazard, Ch. I]; [St]; [CB, §1.3]).
Over a preadditive `C` they use finite sums of representables `Hom(-, Z_1) ⊕ ⋯ ⊕ Hom(-, Z_m)`
(`TauCeti.ModCat.isFiniteFree`), not single representables: for the ring `ℤ` the elements
`e_1, e_2` of the flat module `ℤ²` have no common source `e_1 = a z`, `e_2 = b z`. Under finite
biproducts the single-representable forms are corollaries; no passage to `Mat_ C` is needed. For a
module `F` of `Mod C`, each of the following is equivalent to flatness:

- **equational criterion** (`TauCeti.ModCat.IsTrivialRelation`,
  `TauCeti.ModCat.flat_iff_forall_isTrivialRelation`): every relation `∑_j F(β_j)(y_j) = 0` in
  `F(X)`, for `β_j : X → Y_j` and `y_j ∈ F(Y_j)`, is trivial, that is, there are finitely many
  `z_i ∈ F(Z_i)` and maps `α_ij : Y_j → Z_i` with `y_j = ∑_i F(α_ij)(z_i)` and
  `∑_j β_j ≫ α_ij = 0` for all `i` ([OR, Thm. 3.2 (4), pp. 96–97]; for rings [Lam-LMR, (4.24),
  p. 130], which credits Chase; Mathlib's commutative `Module.Flat.iff_forall_isTrivialRelation`);
- **factorization** (`TauCeti.ModCat.flat_iff_forall_exists_factorization`): every map from a
  finitely presented module (Mathlib's `IsFinitelyPresentable`) to `F` factors through a finite sum
  of representables ([Lazard, Lemme 1.1 and Thm. 1.2, p. 84]; [St, Lemma 8 (c), p. 354]; [CB, §1.3
  (2), p. 1646]);
- **filtered category of elements** (`TauCeti.ModCat.FiniteFreeOver F`,
  `TauCeti.ModCat.flat_iff_isFiltered_finiteFreeOver`): the maps to `F` from finite sums of
  representables, a `CostructuredArrow` category with the shape of Tau Ceti's
  `TauCeti.FiniteFreeOver`, form a filtered category ([OR, Thm. 3.2 (6), p. 97]; [CB, §1.3 (3)]);
- **Lazard–Govorov** (`TauCeti.ModCat.flat_iff_exists_isColimit`): `F` is a filtered colimit of
  finite sums of representables ([OR, Thm. 3.2 (5), p. 97]; [Mitchell, Thm. 10.1b, p. 48]; [CB,
  §1.3 (4)]; [Lazard, Thm. 1.2]; for rings [Govorov], a direct limit of free modules; [St, Thm. 3
  (b)]: a direct limit of projectives);
- **purity** (`TauCeti.ModCat.IsPureEpi`, `TauCeti.ModCat.flat_iff_forall_isPureEpi`): every
  epimorphism onto `F` is pure, that is, maps from finitely presented modules lift along it ([St,
  §2 and Thm. 3, pp. 353–357]; [Lazard, Cor. 1.3, p. 85]).

Route: the chain of [OR, Thm. 3.2]. The ideal test gives the equational criterion, through the
ideal generated by the `β_j` and `(Hom(X, -) ⧸ I) ⊗_C F ≅ F(X) ⧸ IF` ([OR, Lemma 1.2, p. 94], on
`Cᵒᵖ`; 0.3). The equational criterion gives the factorization, by dualizing a finite presentation
([Lazard, Lemme 1.1]; [Lam-LMR, (4.32), p. 133]). The factorization makes the category of elements
filtered, and `F` is the colimit over it (the pattern of Tau Ceti's `flatModuleFilteredFree`). A
filtered colimit of finite sums of representables is flat, since `Tor_1` commutes with filtered
colimits and vanishes on projectives (2.2). Purity is the factorization read as lifting. [CB]'s
proof of the factorization instead uses the transpose and the stable Hom,
`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` ([Auslander78, I, Prop. 3.2]); it is not followed here.

Consequences:

- **finitely presented flat modules are projective**
  (`TauCeti.ModCat.Flat.projective_of_isFinitelyPresentable`; [St, Lemma 7 (ii), p. 354];
  [Lazard, Cor. 1.4, p. 85]; [Mitchell, p. 49]). Route: by 1.4, `stable End(F) ≅ Tor_1(Tr F, F)`,
  which is `0` since `F` is flat (2.2); so the identity of `F` factors through a projective.
  Remark: the factorization above also gives it, since the identity factors through a finite sum
  of representables. This replaces the ring-only route through character modules;
- **flat and pure-projective modules are projective** (`TauCeti.ModCat.IsPureProjective`,
  `TauCeti.ModCat.Flat.projective_of_isPureProjective`): an epimorphism from a projective onto
  `F` is pure, so it splits;
- **flat does not imply pure-projective**: `ℚ` is a flat, not projective, `ℤ`-module (checks), so it
  is not pure-projective. Conversely `ℤ ⧸ 2` is finitely presented, hence pure-projective, and not
  flat;
- **additive categories** (`TauCeti.ModCat.flat_iff_isFiltered_costructuredArrow_yoneda`): with
  finite biproducts, single representables suffice in each item ([CB, §1.3]; [OR, Cor. 3.3,
  p. 99]).

**Rings** (`TauCeti.Module.balancedFlat_iff_isFiltered_finiteFreeOver`,
`TauCeti.Module.BalancedFlat.denseAt`,
`TauCeti.Module.BalancedFlat.exists_factorization_of_finitePresentation`,
`TauCeti.Module.BalancedFlat.projective_of_finitePresentation`). `M` is flat exactly when Tau Ceti's
`FiniteFreeOver A M` is filtered; then `M` is the filtered colimit of the finite free modules over
it; every map from a finitely presented module to `M` factors through a finite free module; and a
finitely presented flat module is projective, by 1.4 as above ([Lazard, Thm. 1.2, Cor. 1.4];
[Lam-LMR, (4.30), (4.32)–(4.34), pp. 133–134]; Mathlib's commutative
`Module.Flat.exists_factorization_of_finitePresentation` and
`Module.Flat.projective_of_finitePresentation`). Over a left Noetherian ring every finite flat
module is projective (`Module.finitePresentation_of_finite`).

**Refactor consumer.** Tau Ceti's `TauCeti.flatModuleFilteredFree`
(`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`), one direction of Lazard's theorem for
commutative rings, becomes a corollary of `BalancedFlat.denseAt` and `balancedFlat_iff_flat`. It is
reproved this way, with no compatibility shims.

**Bridge to Mathlib's set-valued notions** (optional; `TauCeti.ModCat.flat_iff_isIndObject`,
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

*Needs:* 1.4, 2.1, 2.2; Mathlib `IsFinitelyPresentable`, `CostructuredArrow`, `IsFiltered`,
`IsCofiltered`, `Functor.Elements`, `Cocone`, `IsColimit`, `IsIndObject`, `Functor.DenseAt`,
`Retract`; Tau Ceti `TauCeti.FiniteFreeOver`, `TauCeti.finiteFreeModuleInclusion`,
`TauCeti.flatModuleFilteredFree`.

### 2.4 Left exact functors, triangulated categories and the representation theorem

- **Flat = left exact** (`TauCeti.ModCat.flat_iff_preservesFiniteLimits`). For an additive `C`
  with cokernels, a module `F` of `Mod C` is flat exactly when it is left exact: it turns cokernels
  in `C` into kernels, that is, `F : Cᵒᵖ ⥤ Ab` preserves finite limits. So
  `Flat(Cᵒᵖ, Ab) = Lex(Cᵒᵖ, Ab)` ([Fisher, Thms. 1.3–1.4, pp. 279–280], for abelian `C`; [OR,
  Cor. 3.4, p. 99]; [CB, §2.2, p. 1649]; [Simson, Thm. 2.1 (b), pp. 94–95], for covariant functors,
  applied to `Cᵒᵖ`). On the other side: over `C` with kernels, a flat covariant functor is left
  exact.
- **Weak cokernels** (`TauCeti.IsWeakCokernel`,
  `TauCeti.ModCat.flat_iff_exact_of_isWeakCokernel`). If the additive `C` has weak cokernels, a
  module `F` is flat exactly when `F(Z) → F(Y) → F(X)` is exact whenever `Y → Z` is a weak cokernel
  of `X → Y` ([CB, §1.2, Lemma 2, and §1.3, pp. 1644–1646], where weak cokernels are called
  pseudo-cokernels). Route: the filtered category of elements (2.3). The previous item follows: a
  cokernel is a weak cokernel, and a weak cokernel and the cokernel factor through each other.
- **Triangulated categories** (`TauCeti.ModCat.flat_iff_isHomological`). For a skeletally small
  triangulated `C`, a module of `Mod C` is flat exactly when it is cohomological, that is,
  homological on `Cᵒᵖ` (Mathlib's `Functor.IsHomological`, with the scoped pretriangulated
  structure of `Pretriangulated.Opposite`) ([Krause-Smashing, Lemma 2.7, p. 115], for additive
  `M : Cᵒᵖ → Ab`; independently [Beligiannis, Lemma 8.10, Prop. 8.11 and Rem. 8.12, pp. 180–181]).
  Krause's proof extends `F` to the abelian category of finitely presented functors and computes
  `Ext` from triangles. Both sources show that this is also equivalent to fp-injectivity; that part
  stays in prose.
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

*Needs:* 2.3; Mathlib `PreservesFiniteLimits`, `HasCokernels`, `HasFiniteBiproducts`,
`Functor.IsHomological`, `Pretriangulated.Opposite`, `IsFinitelyAccessibleCategory`,
`ObjectProperty.isFinitelyPresentable`, `Retract`.

### 2.5 Bass's flat module

For a sequence `c_0 → c_1 → c_2 → ⋯` in `C`, with `f_i : c_i → c_{i+1}`, write
`q_n = f_0 ≫ ⋯ ≫ f_{n-1} : c_0 → c_n`:

- **Definition** (`TauCeti.ModCat.bassDiagram`, `TauCeti.ModCat.bassModule`):
  `B = colim(Hom(-, c_0) → Hom(-, c_1) → ⋯)`, with maps `Hom(-, f_i)` (Mathlib's
  `Functor.ofSequence` and `colimit`).
- **Flat** (an instance): a filtered colimit of representables (2.3).
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
`TauCeti.ModCat.Flat.of_isColimit`, `TauCeti.ModCat.flat_iff_mono_tensor_of_shortExact`.)

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
`TauCeti.Module.balancedFlat_iff_of_exact` ([Lam-LMR, (4.13), p. 126]),
`TauCeti.Submodule.inf_smul_eq_smul_of_balancedFlat`): the same, and the quotient test: if `F` and
`F ⧸ K` are flat, then `K ⊓ I • F = I • K` for every two-sided ideal `I` ([Lam-LMR, (4.14), p. 126];
the case `N = A ⧸ I`). The alternative ring route of 4.5 through `R ⧸ J` uses it.

Pointers, not targets: products of flat modules of `Mod C` are flat exactly when `C` has weak
cokernels ([CB, Thm. 2.1, p. 1648]; [OR, Thm. 4.1, p. 101]; Chase for rings, [Lam-LMR, (4.47),
p. 139]); the flat modules are closed under kernels exactly when the weak global dimension is at
most two ([CB, Thm. 2.3, p. 1651]; a target of 3.5). Coherence and products are not developed.

*Needs:* 0.4, 2.2, 2.3; Mathlib `Retract`, `IsFiltered`.

**Checks.**

- `ℚ` is a flat `ℤ`-module (2.1 and Mathlib's `Module.Flat`) and is not projective
  (`TauCeti.balancedFlat_rat_and_not_projective`): a split embedding into a free abelian group
  would give a nonzero map `ℚ → ℤ`. So `ℚ` is not pure-projective (2.3).
- `ℤ ⧸ n` is not flat for `n ≥ 2` (`TauCeti.not_balancedFlat_zmod`; `Tor_1^ℤ(ℤ ⧸ n, ℤ ⧸ n) ≠ 0`,
  Layer 1 checks).
- Over `B = k[ε]/(ε²)`, `k` is not flat, since `Tor_1^B(k, k) ≅ k` (Layer 1 checks).
- Over `T₂(k)`, of the two simple left modules the projective one is flat and the other is not
  (2.3: it is finitely presented and not projective). Through 1.7 the same holds for the quiver
  category of `1 → 2`, whose category algebra is `T₂(k)`.
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
modules live in the universe `v`, as in Layer 2. `Tor` is taken with `R = ℤ`; by 1.6 the dimensions
do not depend on `R`. Items 3.1–3.4 end with their ring statements. The categorical statements are
adaptations of the ring theorems cited with them, unless a categorical source is named.

### 3.1 Flat dimension

(`TauCeti.ModCat.HasFlatDimensionLT F n`, `TauCeti.ModCat.HasFlatDimensionLE`,
`TauCeti.ModCat.flatDimension`.) A module `F` of `Mod C` has **flat dimension `< n`** if
`Tor_i(Hom(X, -) ⧸ I, F) = 0` for every `i ≥ n`, every object `X` and every finitely generated
subfunctor `I = coyonedaSpan β ⊆ Hom(X, -)` (2.1). `HasFlatDimensionLE F n` is
`HasFlatDimensionLT F (n + 1)`, and `flatDimension F : WithBot ℕ∞` is the infimum of the `d` with
`HasFlatDimensionLT F i` for all `i > d`. This is the shape of Mathlib's `projectiveDimension`,
which is also defined by vanishing (of `Ext`) and not by resolutions. The definition is
universe-free: it quantifies over objects and finite families of morphisms of `C`. At `n = 0`,
`HasFlatDimensionLE F 0` is 2.2 (5), so flat dimension `≤ 0` is Layer 2's flatness; at `i = 0`,
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
immediate; (1) ⇒ (5) is 2.2 (5) applied to the `n`-th syzygy `K`, since
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
  general-`E` form of [Lam-LMR, (5.57), p. 184] (`E = ℚ ⧸ ℤ`, rings).

**Rings** (`TauCeti.HasFlatDimensionLT`, `TauCeti.HasFlatDimensionLE`, `TauCeti.flatDimension`),
native for `M : ModuleCat.{v} A` with `[Small.{v} A]`: `Tor_i^A(A ⧸ I, M) = 0` for every `i ≥ n` and
every finitely generated right ideal `I`. API as above: `TauCeti.flatDimension_eq_bot_iff`,
`TauCeti.hasFlatDimensionLE_zero_iff`, `TauCeti.hasFlatDimensionLE_tfae`,
`TauCeti.flatDimension_le_projectiveDimension`, `TauCeti.hasFlatDimensionLE_succ_iff`, and
`TauCeti.flatDimension_eq_injectiveDimension_characterModule`: `flatDimension M` is the injective
dimension of the character module `M⁺` in `ModuleCat Aᵐᵒᵖ` ([Lam-LMR, (5.57)]), the case `R = ℤ`,
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
injective coresolution to the `n`-th cosyzygy `E'`; `E'` is injective exactly when it passes the
Baer test of 2.2, that is, `Ext^1(Hom(-, X) ⧸ I, E') = 0`, which is
`Ext^{n+1}(Hom(-, X) ⧸ I, E) = 0`. For `Mod Cᵒᵖ` this is the same statement over `Cᵒᵖ`, with the
cyclic covariant functors `Hom(X, -) ⧸ I`. The refinements over finite and over cyclic modules of
Tau Ceti's `TauCeti.globalDimension_le_tfae`, `globalDimension_eq_iSup_cyclic` and
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

*Needs:* 0.1, 0.2, 2.2 (Baer); Mathlib `projectiveDimension`, `projectiveDimension_le_iff`,
`projectiveDimension_eq_bot_iff`, `injectiveDimension`, `Subobject`; Tau Ceti
`TauCeti.globalDimension`, `TauCeti.globalDimension_def`,
`CategoryTheory.Equivalence.projectiveDimension_functor_obj`.

### 3.3 Weak global dimension

(`TauCeti.ModCat.weakGlobalDimension C := ⨆ F : ModCat C, flatDimension F`.) It is defined for
small preadditive `C` and for rings; it needs the tensor product, so it is not defined for an
arbitrary abelian category. API:

- `weakGlobalDimension C ≤ n` exactly when `Tor_{n+1}` vanishes on all pairs
  (`TauCeti.ModCat.weakGlobalDimension_le_iff`);
- **symmetry** (`TauCeti.ModCat.weakGlobalDimension_op`):
  `weakGlobalDimension Cᵒᵖ = weakGlobalDimension C`, so it is also the supremum of the flat
  dimensions of the covariant functors. Route: the balance (1.3) and the previous item ([Au, p. 70];
  [Lam-LMR, (5.63), p. 185]);
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
  (`TauCeti.ModCat.weakGlobalDimension_le_of_forall_isFinitelyPresentable`): if every finitely
  presented covariant functor has projective dimension `≤ n`, then `weakGlobalDimension C ≤ n`
  (the tests and 3.1). Consumer: ArtinAlgebras §7.5, through TauCetiProject/TauCeti#40807, whose
  hypothesis is on finitely presented right modules;
- **degenerate cases** (`TauCeti.ModCat.weakGlobalDimension_eq_bot_iff`,
  `TauCeti.ModCat.weakGlobalDimension_le_zero_iff`): `⊥` exactly when every object of `C` is
  zero (so every module is zero); `≤ 0` exactly when every module is flat. A semisimple `C`, one of
  global dimension `0` ([Mitchell, §9, p. 42]), has weak global dimension `0` when it has a nonzero
  object.

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
  presented projectives has equal flat and projective dimension. Route: if the flat dimension is
  `n`, the `n`-th syzygy `coker(P_{n+1} → P_n)` is flat (3.1) and finitely presented, hence
  projective by "finitely presented flat modules are projective" (2.3, through 1.4); so the
  projective dimension is at most `n`. Ring form
  (`TauCeti.flatDimension_eq_projectiveDimension_of_projectiveResolution`): a resolution by finite
  projectives. Over a left Noetherian ring every finite module has one
  (`TauCeti.flatDimension_eq_projectiveDimension_of_finite`, with
  `Module.finitePresentation_of_finite`).
- **Auslander's theorem** (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension`). If every
  `Hom(-, X)` is Noetherian, then `Abelian.globalDimension (ModCat C) = weakGlobalDimension C`
  ([Au, Thm. 4, p. 70]; [Lam-LMR, (5.59), p. 184], for rings). Route: by 3.2 the global dimension
  is the supremum over the cyclic modules `Hom(-, X) ⧸ I`. When the representables are Noetherian,
  finite sums of representables are Noetherian objects, so their subobjects are finitely generated
  and the cyclic modules have resolutions by finitely presented projectives. The `FP_∞` lemma then
  gives projective dimension = flat dimension `≤ weakGlobalDimension C`; the other inequality is
  3.3. The other side (every `Hom(X, -)` Noetherian, global dimension of `Mod Cᵒᵖ`) is the theorem
  over `Cᵒᵖ` with 3.3's symmetry.

The categorical form is an adaptation of Auslander's ring theorem. [Mitchell, §9, pp. 42–45] defines
the global dimensions of a small additive category and compares them with its matrix ring, but its
pages 41–56 contain no weak dimension and no Noetherian comparison; the later pages were not read,
and no categorical source was found.

**Corollaries.**

- **The bound** (`TauCeti.ModCat.globalDimension_le_of_forall_isFinitelyPresentable`): if every
  `Hom(-, X)` is Noetherian and every finitely presented covariant functor has projective dimension
  `≤ n`, then `Abelian.globalDimension (ModCat C) ≤ n` (3.3 and the theorem). No Noetherian
  hypothesis on the other side. Ring form
  (`TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite`): this strengthens the
  statement of the open TauCetiProject/TauCeti#40807 (ArtinAlgebras §7.5), which can use it once
  Layers 0–3 exist.
- **Symmetry** (`TauCeti.ModCat.globalDimension_op_eq_of_isNoetherianObject`): if every
  `Hom(-, X)` and every `Hom(X, -)` is a Noetherian object, the global dimensions of `Mod C` and
  `Mod Cᵒᵖ` agree ([Au, Cor. 5, p. 70]). For rings this is Tau Ceti's
  `TauCeti.globalDimension_mulOpposite`.

**Rings** (`TauCeti.globalDimension_eq_weakGlobalDimension`): for `[IsNoetherianRing A]` and
`[Small.{v} A]`, `globalDimension.{v} A = weakGlobalDimension.{v} A`.

**Downstream refactor of main's `TauCeti/RingTheory/GlobalDimension/MulOpposite.lean`.**
`TauCeti.globalDimension_le_globalDimension_mulOpposite`, `TauCeti.globalDimension_mulOpposite` and
`TauCeti.globalDimension_mulOpposite_of_moduleFinite` keep their statements (no users on main; the
open #40807 uses them). Their proofs are replaced by the weak-dimension route: Auslander's theorem
with the bounds and the symmetry of 3.3. `TauCeti.hasInjectiveDimensionLE_characterModule_iff` is
kept and re-proved as the case `R = ℤ`, `E = ℚ ⧸ ℤ` of the duality of 3.1 with the `FP_∞` lemma.
`TauCeti/Algebra/Module/CharacterModule/MulOpposite.lean` stays (the Lambek test of 2.2 for
`ℚ ⧸ ℤ`). Main's proofs stay until Layers 0–3 exist.

*Needs:* 2.3, 3.1–3.3; Mathlib `IsNoetherianObject`, `IsFinitelyPresentable`,
`Module.finitePresentation_of_finite`; Tau Ceti `TauCeti.globalDimension_mulOpposite` and the
other declarations of `TauCeti.RingTheory.GlobalDimension.MulOpposite` (refactor consumers).

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
  flat module that is countably presented (Mathlib's `IsCardinalPresentable` at `ℵ₁`) has
  projective dimension `≤ 1` (Jensen, as cited in [Mitchell, p. 49] and [Lazard, Thm. 3.2,
  p. 89]). The regularity of `ℵ₁` that `IsCardinalPresentable` needs is Mathlib's
  `Cardinal.isRegular_aleph_one`, provided in `Suggested.lean` as a local instance, so the
  statement has no `Fact` binder. Route: the Lazard block (2.3) writes the module as a filtered
  colimit of finite sums of representables; a countable presentation gives a cofinal sequence, then
  the previous item; Bass's module (2.5) is the example. [Mitchell, pp. 49–50] warns that Lazard's
  displayed extraction of a countable subsystem is slightly wrong (a correction was communicated to
  Mitchell): the formalization builds the sequence with care and checks that its colimit is the
  whole module.
- **Pointer, not a target**: an `ℵ_n`-presented flat module has projective dimension `≤ n + 1`
  ([Simson, Thm. 2.12 (c), p. 98], for functor categories; Osofsky for rings, as cited in
  [Mitchell, pp. 49–50], with examples showing the bound is sharp).

Ring forms of 3.5 come through 0.2 and are not stated separately. Equality of flat and projective
dimension over a perfect `C` is a condition of Theorem P and stays in Layer 4 (4.5).

*Needs:* 2.3, 2.5, 3.1, 3.3; Mathlib `IsCardinalPresentable`, `Cardinal.isRegular_aleph_one`,
`colimit`, `kernel`.

**Checks.** In Lean (last section of `Suggested.lean`):

- a field has weak global dimension `0` (`TauCeti.weakGlobalDimension_field`) and the zero ring
  `⊥` (`TauCeti.weakGlobalDimension_punit`);
- `ℤ` has weak and global dimension `1` (`TauCeti.weakGlobalDimension_int`):
  `Tor_1^ℤ(ℤ ⧸ 2, ℤ ⧸ 2) ≠ 0`, and Tau Ceti's
  `TauCeti.globalDimension_eq_one_of_isPrincipalIdealRing`;
- `B = k[ε]/(ε²)` (Mathlib's `DualNumber k`) has weak and global dimension `⊤`
  (`TauCeti.weakGlobalDimension_dualNumber`; Layer 1 checks);
- `T₂(k)` (Mathlib's `Matrix.blockTriangularSubalgebra k k id` on `Fin 2`) has weak and global
  dimension `1` (`TauCeti.weakGlobalDimension_upperTriangular`): the simple module `T ⧸ J` is not
  flat (2.6 checks) and `J` is projective (Layer 1 checks);
- the `k`-linear category of the quiver `0 → 1` (Mathlib's `CategoryTheory.Free k (Fin 2)`) has
  global dimension `1` (`TauCeti.globalDimension_free_fin_two`, for `Mod C`), through its category
  algebra `T₂(k)` (1.7; [Mitchell, §9, p. 45, (6)]: equality for finitely many objects).

In prose, with locators:

- Small's ring `R = [[ℤ, ℚ], [0, ℚ]]` is right Noetherian and right hereditary, not left
  hereditary: `globalDimension Rᵐᵒᵖ = weakGlobalDimension R = 1 < globalDimension R`
  ([Lam-LMR, (5.62b), p. 185]; the facts on `R` are cited there to (2.33), not read). Auslander's
  theorem applies to `Rᵐᵒᵖ`; for `R` it fails, so `R` is not left Noetherian.
- Osofsky's Boolean ring: for a set `J` of cardinality `ℵ₂`, the free Boolean ring
  `B = 𝔽₂[x_j : j ∈ J] ⧸ (x_j² - x_j)` has weak global dimension `0` (it is von Neumann regular:
  every finitely presented module is projective, so 3.3 applies with `n = 0`) and global dimension
  `3`: for the ideal `I` generated by the `x_j`, [Osofsky-Card, Thm. A, p. 644] (with the
  definition of a nice family on p. 641) gives `pd I = 2`, so `pd(B ⧸ I) = 3`. The bound `≤ 3` is
  the classical bound for rings whose ideals are generated by `ℵ₂` elements; it was not checked
  here. So Auslander's theorem needs the Noetherian hypothesis.
- Jategaonkar's rings: for each `1 ≤ n ≤ ∞` there is a principal left ideal domain `D` with right
  global dimension `n` ([Jategaonkar, Thm. 4.10, pp. 438–439]). `D` is left Noetherian with left
  global dimension `1`, so `weakGlobalDimension D = 1`; for `n ≥ 2` the right global dimension
  differs. The symmetry corollary needs both Noetherian hypotheses.
- The `k`-linear category of the linear quiver `0 → 1 → 2 → ⋯` is hereditary on both sides, so
  its global and weak global dimensions are `1`; the Bass module of 2.5 is flat, not projective,
  with projective dimension `1` (telescope).

### Examples

Fields, `ℤ`, `k[ε]/(ε²)`, `T₂(k)` and the quiver category of `0 → 1`; Small's ring, Osofsky's
Boolean ring and Jategaonkar's rings as limits of the hypotheses; quiver categories, which are
hereditary.

### Dependencies

Layers 1 and 2.

## Layer 4: semiperfect and perfect categories, and Bass's Theorem P

Throughout, `C : Type u` is preadditive with `Category.{v} C`. `J(C)` is Tau Ceti's radical
`TauCeti.jacobsonRadicalIdeal C`, whose value at `(X, X)` is `Ring.jacobson (End X)`
(`TauCeti.jacobsonRadical_self_eq_jacobson`), and `C ⧸ J(C)` is Tau Ceti's quotient category
`(TauCeti.jacobsonRadicalIdeal C).Quotient`. Modules are the modules of `Mod C`, contravariant
functors. [Simson] and [Harada] work with covariant modules; their statements are applied to `Cᵒᵖ`
(Convention 14). Where a statement needs colimits of modules indexed by the objects of `C`, the
hypothesis is `EssentiallySmall.{w} C` with modules in the universe `w`; `Suggested.lean` states
the theorems in the universe `v`, where the representables and Bass's modules (2.5) live. Projective
covers are essential epimorphisms from projective objects (Convention 12). Items 4.1–4.6 end with
their ring statements, which are derived from the categorical ones through `SingleObj Aᵐᵒᵖ` (0.2).
The categorical statements are adaptations of the ring theorems cited with them, unless a
categorical source is named; the summit is [Simson, Thm. 5.4, p. 108].

**The direction of T-nilpotence.** In `SingleObj Aᵐᵒᵖ`, Mathlib's `f ≫ g = g * f` (in `Aᵐᵒᵖ`) is
`op (unop f * unop g)`, so for `fᵢ = op aᵢ` the composite `f₀ ≫ ⋯ ≫ fₙ₋₁` is `op (a₀ a₁ ⋯ aₙ₋₁)`.
Nakayama's lemma for `Mod C` needs sequences `c₀ → c₁ → ⋯` with composites `c₀ → cₙ` (4.1), and at
`SingleObj Aᵐᵒᵖ` these composites are Bass's products `a₀ a₁ ⋯ aₙ₋₁`: left T-nilpotence, which
goes with left modules ([Bass, p. 466]; [Lam-FC, (23.16)], right-handed). In `End X`, with Mathlib's
multiplication `f * g = g ≫ f`, the composite is the product `fₙ₋₁ ⋯ f₀`; for `SingleObj Aᵐᵒᵖ`,
`End ∗ = Aᵐᵒᵖ`, and this product is again `op (a₀ ⋯ aₙ₋₁)`.

### 4.1 T-nilpotence and Nakayama's lemma for all modules

(`TauCeti.MorphismIdeal.IsTNilpotent I`.) A two-sided ideal `I` of `C` (Tau Ceti's
`TauCeti.MorphismIdeal`) is **T-nilpotent** if every sequence `c₀ → c₁ → ⋯` with all
`fᵢ : cᵢ → cᵢ₊₁` in `I` has a vanishing composite `q_n = f₀ ≫ ⋯ ≫ f_{n-1} : c₀ → c_n` (Convention
8). For `C = SingleObj Aᵐᵒᵖ`, `q_n = op (a₀ a₁ ⋯ a_{n-1})`, Bass's left T-nilpotence. The other
side is T-nilpotence of Tau Ceti's opposite ideal `TauCeti.MorphismIdeal.op I` on `Cᵒᵖ`, that is,
of the chains `c₀ ← c₁ ← ⋯`; this is the left T-nilpotence of [Simson, p. 108], stated for covariant
modules. The predicate is named after neither side. API: monotone in `I`; a nilpotent ideal
(`I ^ n = ⊥`, with Tau Ceti's monoid of ideals) is T-nilpotent, and so is its opposite
(`TauCeti.MorphismIdeal.isTNilpotent_of_pow_eq_bot`,
`TauCeti.MorphismIdeal.isTNilpotent_op_of_pow_eq_bot`).

`I · M` is the family of subgroups of 0.3 (`TauCeti.MorphismIdeal.smul I M`); for
`SingleObj Aᵐᵒᵖ` it is `J • ⊤`. It is **superfluous** in `M`
(`TauCeti.MorphismIdeal.IsSuperfluousSmul I M`) if every map `g : N → M` whose image generates `M`
together with `I · M` is an epimorphism.

**Nakayama's lemma for all modules** (`TauCeti.MorphismIdeal.isTNilpotent_tfae`). The following
are equivalent:

1. `I` is T-nilpotent;
2. for every module `M` of `Mod C`, `I · M = M` implies `M = 0`;
3. for every module `M` of `Mod C`, `I · M` is superfluous in `M`.

Route. (1) ⇒ (2) by dependent choice: if `I · M = M` and `x₀ ∈ M(c₀)` is nonzero, choose
`x_n ∈ M(c_n)` with `M(q_n)(x_n) ≠ 0` inductively: write `x_n` as a sum of elements `M(f)(y)` with
`f ∈ I(c_n, d)`; since `M(q_n)(x_n) ≠ 0`, some summand keeps `M(q_n ≫ f)(y) ≠ 0`, which gives
`f_n = f` and `x_{n+1} = y`; so no `q_n` vanishes ([Simson, Lemma 5.3, p. 108], on `Cᵒᵖ`; Bass uses
König's graph theorem, [Bass, pp. 473–474]). (2) ⇔ (3) as usual, through the cokernel of `g`.
(2) ⇒ (1) through Bass's module `B` of an `I`-sequence (2.5): `B ≠ 0` while no `q_n` vanishes,
since the class of `𝟙 c₀` is `q_n` at stage `n`; and `B = I · B`, since the class of `g : d → cᵢ`
is that of `g ≫ fᵢ`, the image of the class of `𝟙 cᵢ₊₁` under `B(g ≫ fᵢ)` with `g ≫ fᵢ ∈ I`. With
the lemma of 2.5 (a Bass module is zero exactly when every tail of its sequence has a zero
composite), `I` is T-nilpotent exactly when the Bass modules of all `I`-sequences vanish
(`TauCeti.MorphismIdeal.isTNilpotent_iff_forall_isZero_bassModule`).

(1) ⇒ (2) and (1) ⇒ (3) hold in every universe, with no smallness
(`TauCeti.MorphismIdeal.IsTNilpotent.isZero_of_smul_eq_top`,
`TauCeti.MorphismIdeal.IsTNilpotent.isSuperfluousSmul`). (2) ⇒ (1) in the universe `w` uses
`EssentiallySmall.{w} C` for Bass's module; `Suggested.lean` states the equivalence in the universe
`v`, where no hypothesis is needed.

**Rings** (`TauCeti.IsLeftTNilpotent (S : Set A)`): for every `a : ℕ → A` with values in `S` there
is `n` with `(List.ofFn fun i : Fin n ↦ a i).prod = 0`. API: monotone in `S`
(`IsLeftTNilpotent.mono`); a nilpotent ideal is left T-nilpotent
(`TauCeti.isLeftTNilpotent_of_isNilpotent`); every element of a left T-nilpotent set is nilpotent
(`IsLeftTNilpotent.isNilpotent`); images under ring homomorphisms (`IsLeftTNilpotent.image`).
Bridge (`TauCeti.isLeftTNilpotent_jacobson_iff_singleObj`): for the Jacobson radical, left
T-nilpotence is T-nilpotence at `SingleObj Aᵐᵒᵖ`. The ring form of Nakayama's lemma
(`TauCeti.isLeftTNilpotent_tfae`; [AF, 28.3, pp. 314–315]; [Lam-FC, (23.16), p. 352],
right-handed) is a corollary through `SingleObj Aᵐᵒᵖ`: for a left ideal `J`, `J` is left
T-nilpotent; `J • ⊤ = ⊤` implies `M = 0` for every module `M` in the universe of `A`; `J • ⊤` is
superfluous in every such `M`; `J • ⊤` is superfluous in `ℕ →₀ A`. The forward direction holds in
every universe (`IsLeftTNilpotent.isSuperfluous_smul_top`).

**Checks.** The ideal `(X)` of `PowerSeries k` is not left T-nilpotent
(`TauCeti.not_isLeftTNilpotent_span_X`). In `F = ℕ →₀ PowerSeries k`, the submodule `G` spanned by
the `eᵢ - X • eᵢ₊₁` satisfies `G + X • F = F` and `G ≠ F` (`F ⧸ G` is Bass's module, the Laurent
series field), so `X • F` is not superfluous, as the last item predicts. The categorical check is
the linear `A_∞` category of the Layer 4 checks.

*Needs:* 0.3 (`I · M`), 2.5; Tau Ceti `TauCeti.MorphismIdeal`, `TauCeti.MorphismIdeal.le_def`,
`TauCeti.MorphismIdeal.op`, the monoid of ideals
(`TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul`); Mathlib `Functor.ofSequence`.

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
[Simson, p. 93], stated for covariant modules and applied to `Cᵒᵖ`; by [Simson, Prop. 1.2] the
notion is self-dual). Route: [Simson, Prop. 1.2, p. 93]: a small preadditive category is semisimple
exactly when it is von Neumann regular (every `f` has a `g` with `f = f g f`) and every `End X` is
semisimple; and `End_{C ⧸ J}(X) = End X ⧸ Ring.jacobson (End X)`. Regularity of `D = C ⧸ J(C)`
(`TauCeti.IsSemilocalCategory.exists_comp_comp_eq_self`; **agent-proved**, not from a source): for
`f : X → Y` in `D`, the left ideal `{g ∘ f}` of the semisimple ring `End_D(X)` is `End_D(X) e` with
`e = g₀ ∘ f` idempotent; then `u = f ∘ (1 - e)` satisfies `g ∘ u = (g ∘ f)(1 - e) = 0` for every
`g : Y → X`, so `u` is radical in `D`; the radical of `D` is zero, because units lift modulo the
Jacobson radical; so `f = f ∘ e = f ∘ g₀ ∘ f`. `Cᵒᵖ` is semilocal with `C` (an instance;
`End (op X) = (End X)ᵐᵒᵖ`).

**Semiperfect categories** (`TauCeti.IsSemiperfectCategory C`, `extends IsSemilocalCategory C`, with
field: every `End X` is semiperfect; compare [Simson, Thm. 5.6 (b), (c), p. 110]). Instances: from
perfect categories (4.3), from Krull–Schmidt categories
(`TauCeti.IsKrullSchmidt.isSemiperfectCategory`, from Tau Ceti's
`TauCeti.IsKrullSchmidt.isSemiperfectRing_end`), and `IsSemiperfectCategory Cᵒᵖ` from
`IsSemiperfectCategory C` (`End (op X) = (End X)ᵐᵒᵖ` and `TauCeti.IsSemiperfectRing.mulOpposite`),
next to the semilocal one. **Krause's criterion with the class**
(`TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory`): a category with
finite biproducts is Krull–Schmidt exactly when idempotents split and it is semiperfect. This
restates main's `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end` (the
owner's TauCetiProject/TauCeti#33561) with the class; a downstream refactor, with no alias. It is
proved in `Suggested.lean` from main's statement.

Small targets: finitely generated modules (0.8); `TauCeti.IsSemiperfectRing.mulOpposite` (an
instance: semiperfectness is left-right symmetric; used for `Cᵒᵖ`, since `End (op X) = (End X)ᵐᵒᵖ`);
`TauCeti.IsKrullSchmidt Cᵒᵖ` (an instance, by Krause's criterion on both sides; with the instance
`HasFiniteBiproducts Cᵒᵖ`, which Mathlib does not register, proved in `Suggested.lean` from
`HasFiniteBiproducts.of_hasFiniteProducts`); corners (`TauCeti.IsSemiperfectRing.corner`: `eRe` is
semiperfect for an idempotent `e` of a semiperfect `R`, on Mathlib's `IsIdempotentElem.Corner`).

**Semiperfect categories by projective covers** (`TauCeti.isSemiperfectCategory_tfae`;
`TauCeti.HasProjectiveCover M`: an essential epimorphism onto `M` from a projective object). The
following are equivalent ([Simson, Thm. 5.6, p. 110], for covariant modules, applied to `Cᵒᵖ`;
[Krause, Prop. 4.1]):

1. `C` is semiperfect;
2. every `Hom(-, X)` is a finite sum of projective modules with local endomorphism rings;
3. every finitely generated module of `Mod C` has a projective cover;
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

**Rings** (TauCetiProject/TauCeti#38013, Part 3). Here `R` is a ring and `J = Ring.jacobson R`. The
ring items stay native. Their placement follows the scope contest on #38013: if Part 3 moves to
this roadmap, the categorical TFAE above is proved first and the ring TFAE is derived from it
through `SingleObj Rᵐᵒᵖ` (0.2), with Tau Ceti's `TauCeti.finiteProjectiveModules R` identified with
`proj (SingleObj Rᵐᵒᵖ)` (`TauCeti.finiteProjectiveModulesEquivProj`, 0.8); if Part 3 stays in
#38013, the ring TFAE is a supplier and the categorical one follows the same route.

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
  18.5 (1), p. 152], for the generation step). The finite family is extracted with
  `IsCompactElement` and `Submodule.fg_iff_compact`; finite suprema and finite products of
  superfluous submodules are superfluous, and these two closure facts are part of this item.
- **Covers over a semiperfect ring** (`TauCeti.exists_isProjectiveCover_of_isSemiperfectRing`).
  Over a semiperfect ring every finitely generated left module has a projective cover with source
  in the universe of `R` ([Lam-FC, (24.12), p. 361]; [Bass, Thm. 2.1, p. 471]). Route: by
  `TauCeti.IsSemiperfectRing.exists_completeOrthogonalIdempotents_isLocalRing_corner`, `1` is a sum
  of orthogonal idempotents `eᵢ` with local corners; a simple module is a quotient of some `Reᵢ`
  (`CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`), which is projective with
  local endomorphism ring, so the quotient map is a cover; then the previous item.
- **Decomposition** (`TauCeti.IsSemiperfectRing.of_linearEquiv_pi`). If `R ≃ₗ[R] P₁ × ⋯ × Pₙ`
  with every `Module.End R Pᵢ` local, then `R` is semiperfect: the images of the coordinate
  idempotents are orthogonal idempotents with local corners, and
  `TauCeti.IsSemiperfectRing.of_isLocalRing_corner` applies.
- **Semiperfect rings by projective covers** (`TauCeti.isSemiperfectRing_tfae`). The following are
  equivalent ([Sandomierski, Thm. 4, p. 206]; [Krause, Prop. 4.1]; [Lam-FC, (24.16), p. 364]):
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

**Checks.**

- `ℤ` is not semiperfect (`TauCeti.not_isSemiperfectRing_int`): the kernel of a projective cover
  `P → ℤ ⧸ 2` would lie in `Module.jacobson ℤ P = J • P = 0`, so `ℤ ⧸ 2` would be projective
  ([Sandomierski, Lemma 2, p. 205]).
- `PowerSeries k` is local, so semiperfect, and the cover of `k` is `PowerSeries k → k`.
- For the upper triangular algebra `T₂(k)`, `T₂(k) = T e₁₁ × T e₂₂` is the decomposition of
  item (2), and the two simple modules have covers `T e₁₁` and `T e₂₂`.

*Needs:* 0.8, 4.1; Tau Ceti `TauCeti.IsSemiperfectRing`, the idempotent results listed in "From Tau
Ceti", `TauCeti.IsKrullSchmidt` with Krause's criterion, `TauCeti.IsEssentialEpi`,
`TauCeti.IsProjectiveCover` and its API, `TauCeti.FiniteProjectivePresentation`,
`TauCeti.IsMinimalProjectivePresentation`, `TauCeti.MorphismIdeal.Quotient`,
`TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`; Mathlib `IsCompactElement`,
`Submodule.fg_iff_compact`, `isSimpleModule_iff_isCoatom`, `Module.jacobson`, `Subobject`,
`ComplementedLattice`, `Simple`, `IsIdempotentElem.Corner`,
`HasFiniteBiproducts.of_hasFiniteProducts`.

### 4.3 Perfect categories and left perfect rings

(`TauCeti.IsPerfectCategory C`, `extends IsSemilocalCategory C`, with field
`isTNilpotent : MorphismIdeal.IsTNilpotent (TauCeti.jacobsonRadicalIdeal C)`.) By 4.2 this is
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
  (`TauCeti.IsLeftPerfectRing.of_isSemiprimaryRing`; [Lam-FC, (23.19), p. 353]; with
  `TauCeti.IsSemiprimaryRing.mulOpposite` also for `Aᵐᵒᵖ`) and
  `IsLeftPerfectRing A → TauCeti.IsSemiperfectRing A`
  (`TauCeti.IsLeftPerfectRing.isSemiperfectRing`; the radical is nil, so idempotents lift by
  `exists_isIdempotentElem_eq_of_ker_isNilpotent`; [Lam-FC, (23.19)]);
- surjective images, in particular quotients by two-sided ideals and ring isomorphisms
  (`TauCeti.IsLeftPerfectRing.of_surjective`; [Lam-FC, (24.19), p. 365]; [AF, 28.7, p. 318]).

*Needs:* 4.1, 4.2; Mathlib `IsSemiprimaryRing`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`;
Tau Ceti `TauCeti.IsSemiprimaryRing.mulOpposite`.

### 4.4 Projective covers over perfect categories

(`TauCeti.IsPerfectCategory.hasProjectiveCover`.) Over a perfect `C` every module of `Mod C` has a
projective cover ([Simson, Thm. 5.4, (7) ⇒ (8), p. 109], on `Cᵒᵖ`; [Bass, Lemma 2.6, p. 473], for
rings). Route: `C` is semiperfect (4.3). `M ⧸ J · M` is a module over `C ⧸ J(C)`, which is
semisimple (4.2), so it is a direct sum of simple modules; each has a cover by a summand
`{g ≫ e}` of a representable (4.2). Lift the sum `P` of these covers to `P → M`. The lift is onto
because `J · M` is superfluous in `M` (4.1), and its kernel lies in `J · P`, which is superfluous in
`P` (4.1).

**Rings** (`TauCeti.IsLeftPerfectRing.exists_isProjectiveCover`). Over a left perfect ring every
left module, in every universe, has a projective cover, in the form of Tau Ceti's
`TauCeti.exists_isProjectiveCover`, which it generalizes from semiprimary rings ([Lam-FC, (24.12)];
[AF, 28.4, (b) ⇒ (a), p. 315]). The same route, with `M ⧸ J • M` semisimple
(`TauCeti.isSemisimpleModule_quotient_smul_top`) and
`TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

*Needs:* 4.1–4.3; Tau Ceti `TauCeti.exists_isProjectiveCover`,
`TauCeti.isSemisimpleModule_quotient_smul_top`, `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`.

### 4.5 Bass's Theorem P

**The Mares–Simson lemma** (`TauCeti.ModCat.Flat.projective_of_isEssentialEpi`), a standalone
target: a flat module with a projective cover is projective, for any `C` and with no hypothesis on
the radical ([Simson, Thm. 5.4, (9′) ⇒ (1′), pp. 109–110], on `Cᵒᵖ`, using the argument of [Mares,
Thm. 2.4, proof part (i), p. 349]). Route, for a cover `0 → K → P → M → 0` with `M` flat:

- **Villamayor step** (`TauCeti.ModCat.exists_hom_app_apply_eq_of_flat`; [Lam-LMR, (4.23),
  p. 129], Villamayor's theorem for rings): every `x ∈ K(c)` is fixed by some `θ : P → K`. `P` is a
  summand of a free module `F` (a sum of representables); `x` lies in a finite subsum `L`; the
  factorization of 2.3 applied to `L ⧸ (x) → M` gives a finitely generated free `G` with maps
  `α`, `β`, and `θ = (ι - βα) ∘ π_L`.
- **Mares**: `s = i ∘ θ` has image in the superfluous `K`, so `1 - s` is onto; it splits, since `P`
  is projective, and its kernel is a summand of `P` inside `K`, hence zero. But `(1 - s)(x) = 0`, so
  `x = 0`.

This is an agent assembly of [Mares], [Simson] and Villamayor; it replaces the earlier ring proof of
"perfect ⇒ flat modules are projective" through `K ≤ J · P` ([Lam-FC, (24.25)]), which is kept as an
alternative.

**Theorem P** (`TauCeti.isPerfectCategory_tfae`), for `EssentiallySmall.{w} C` (the universe `v`
in `Suggested.lean`). The following are equivalent:

1. `C` is perfect: `J(C)` is T-nilpotent and `C ⧸ J(C)` is semisimple (4.3);
2. every module of `Mod C` has a projective cover;
2′. every semisimple module has a projective cover;
3. every flat module is projective;
3′. every countably presented flat module is projective (Mathlib's `IsCardinalPresentable` at
   `ℵ₁`; Bass's modules are countably presented, which makes this item free);
4. for every object `c`, the cyclic subfunctors `{g ≫ h}` of `Hom(c, -)`, the images of
   `Hom(d, -) → Hom(c, -)` for `g : c → d`, satisfy the descending chain condition; for
   `SingleObj Aᵐᵒᵖ` these are the principal right ideals `aA` (since `g ≫ h` is `op (a b)`), Bass's
   condition;
4′. every sequence `c₀ → c₁ → ⋯` stabilizes: some `q_n = f₀ ≫ ⋯ ≫ f_{n-1}` factors as `q_m ≫ t`
   through every later `q_m` ([Simson, Def. 3.1, p. 99], on `Cᵒᵖ`, at the first term, in the
   direction of 2.5);
5. `flatDimension M = projectiveDimension M` for every module `M` of `Mod C`;
6. filtered colimits of projective modules are projective.

`Suggested.lean` states 3′ with no `Fact` binder: the regularity of `ℵ₁` is Mathlib's
`Cardinal.isRegular_aleph_one`, provided as a local instance (3.5).

Sources: [Simson, Thm. 5.4, p. 108], for covariant modules and applied to `Cᵒᵖ`, whose conditions
(7), (8), (1) and (5) are 1, 2, 3 and 4′ (at every term), with 3′ the countable form of (1) and (9)
the case of flat modules in 2; [Harada, Thm. 5, p. 339], for finitely induced categories, also
covariant; [Bass, Theorem P, pp. 467–468] for rings; 2′ is [Sandomierski, Thm. 5, p. 206] for rings,
right-handed ("R right perfect iff every semisimple right R-module has a projective cover"), applied
to `Aᵐᵒᵖ`.

Route: the cycle 1 ⇒ 2 ⇒ 3 ⇒ 3′ ⇒ 4′ ⇒ 1, with 4 ⇔ 4′, 3 ⇔ 5, 3 ⇔ 6 and 2 ⇒ 2′ ⇒ 1.

- 1 ⇒ 2 is 4.4.
- 2 ⇒ 3 is the Mares–Simson lemma; 3 ⇒ 3′ is immediate.
- 3′ ⇒ 4′: Bass's module of the sequence (2.5) is flat and countably presented (the telescope), so
  it is projective, and the sequence is factorizable (2.5; [Bass, Lemma 1.3]).
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
- 4 ⇔ 4′: a sequence gives the cyclic subfunctors generated by the `q_i`, with
  `q_{i+1} = q_i ≫ f_i`; conversely a descending chain `{g₀ ≫ h} ⊇ {g₁ ≫ h} ⊇ ⋯` has
  `g_{i+1} = g_i ≫ f_i` for some `f_i`.
- 3 ⇔ 5 through 3.1: flat dimension is at most projective dimension; given 3, the syzygy at the flat
  dimension is flat, hence projective ([Lam-LMR, (5.70), p. 187]); 5 at a flat module gives
  projective dimension `≤ 0`.
- 3 ⇔ 6: filtered colimits of flat modules are flat (2.6), and every flat module is a filtered
  colimit of finite sums of representables (2.3).
- 2 ⇒ 2′ is immediate. 2′ ⇒ 1 (after [Sandomierski]): simple modules have covers, so `C` is
  semiperfect (4.2); for a free `F`, the cover of the semisimple `F ⧸ J · F` lifts to a split
  epimorphism from `F`, so `J · F` is superfluous; Bass's module `B` of a sequence in `J(C)` has
  `B = J · B` and is a quotient of the free telescope, so `B = 0`, and `J(C)` is T-nilpotent (4.1).

Alternatives, in prose only: Rentschler's direct ring proof of 1 ⇒ 4 ([Rowen, Thm. 2.7.33,
pp. 222–223]; Rentschler's paper not read); [Lam-FC, (24.25), pp. 369–370] for 1 ⇒ 3 through
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
`CategoryTheory.Equivalence.projectiveDimension_functor_obj`; the cyclic subfunctors of `Hom(∗, -)`
are the `aA`, and `q_n = op (a₀ ⋯ a_{n-1})`. There are no independent ring proofs. Covers in other
universes come from 4.4. Also: the ring Mares–Simson lemma
(`TauCeti.Module.BalancedFlat.projective_of_isProjectiveCover`) and the auxiliary
`TauCeti.isSemisimpleRing_of_wellFoundedLT_isPrincipal` (principal left ideals, `Ideal A`, as in
[Lam-FC, (4.14)]). Ring sources: [Bass, Theorem P], whose items (1), (2), (6), (3) and (5) are 1, 2,
4, 5 and 6 here; [AF, 28.4, pp. 315–317], left-handed as here; [Lam-FC, (24.18), p. 365, and
(24.25), p. 369], right-handed.

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
  [Bass, p. 475], where Bass reproduces Eilenberg's argument). Over a perfect `C`,
  `pd M = sup {n : Tor_n(C ⧸ J, M) ≠ 0}`: `pd M ≤ n` exactly when
  `Tor_{n+1}((C ⧸ J)(X, -), M) = 0` for every `X`, with the covariant `(C ⧸ J)(X, -)` of 0.3.
  Route: a minimal projective resolution by covers (4.4) has differentials into `J · P_n`, since
  the kernel of a cover lies in `J · P`; so `(C ⧸ J) ⊗_C P` has zero differentials and
  `Tor_n((C ⧸ J)(X, -), M) ≅ P_n(X) ⧸ (J · P_n)(X)` by the lemma of 0.3; and `J · P ≠ P` for
  `P ≠ 0` (4.1).
- **Corollary** (`TauCeti.ModCat.globalDimension_eq_iSup_flatDimension_quotientYoneda`; an agent
  derivation): the global dimension of `Mod C` for a perfect `C` is the flat dimension of the
  covariant module `C ⧸ J`, the supremum over `X` of the flat dimensions of `(C ⧸ J)(X, -)`, by the
  criterion and 3.1.

**Rings.** `TauCeti.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing` (for
`[IsLeftPerfectRing A]` and `[Small.{v} A]`, `globalDimension A = weakGlobalDimension A`;
[Lam-LMR, (5.70), p. 187]); `TauCeti.globalDimension_mulOpposite_of_isLeftPerfectRing` (left and
right perfect: equal left and right global dimension); and
`TauCeti.globalDimension_mulOpposite_of_isSemiprimaryRing`: for every semiprimary ring the left,
right and weak global dimensions agree, with no Noetherian hypothesis ([Au, Cor. 9, p. 73];
[Lam-LMR, (5.71), p. 188]). The Tor criterion for rings comes through 0.2 and is not stated
separately. Main's `TauCeti.globalDimension_eq_projectiveDimension_quotient_jacobson`
(`TauCeti/RingTheory/GlobalDimension/Semiprimary.lean`: for a semiprimary ring, the projective
dimension of the left module `A ⧸ J`) is unchanged and is not a consumer. The projective dimension
of `A ⧸ J` over a ring that is perfect on one side only is not claimed.

*Needs:* 0.3, 3.1, 3.3, 4.4, 4.5; Tau Ceti `TauCeti.globalDimension`.

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
  semiprimary (`J² = 0`, `A ⧸ J = k`), hence perfect, and not Noetherian
  (`TauCeti.isSemiprimaryRing_squareZeroPolynomialRing`).
- `k[x₀, x₁, …] ⧸ (xᵢ^{i+2}, xᵢxⱼ for i ≠ j)` (`TauCeti.bassPolynomialRing k`) is perfect and not
  semiprimary: `J` is not nilpotent because `xᵢ^{i+1} ≠ 0`, and it is T-nilpotent because an
  element of `J` involves only finitely many variables, so a product `a₀ ⋯ a_{n-1}` of elements of
  `J` vanishes once `n` exceeds a bound given by `a₀`. By Theorem P its principal ideals satisfy the
  descending chain condition, although it is not Noetherian
  (`TauCeti.isLeftPerfectRing_bassPolynomialRing`; [Bass, §3, Example (2), p. 475], with the
  variables shifted by one).
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

Semiprimary rings (Artin algebras among them) are perfect; `bassPolynomialRing k` is perfect and not
semiprimary; Lam's ring is perfect on one side only; `PowerSeries k` is semiperfect and not perfect;
`ℤ` is not semiperfect. Categories: Krull–Schmidt categories are semiperfect; finite quiver
categories are perfect on both sides; the linear `A_∞` category is perfect on one side only.

### Dependencies

4.1 needs 0.3 and 2.5; 4.2 needs 0.8 and 4.1 (its ring items need only Mathlib and Tau Ceti); 4.3
needs 4.1 and 4.2; 4.4 needs 4.1–4.3; 4.5 needs Layers 2 and 3 and 4.1–4.4; 4.6 needs 0.3, 3.1,
3.3 and 4.4–4.5.

## Downstream consumers

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2: Auslander's theorem
  (3.4) gives the left-right symmetry of global dimension for Noetherian rings through weak
  dimension, and 4.6 gives it for semiprimary rings without a Noetherian hypothesis. Main's
  `TauCeti/RingTheory/GlobalDimension/MulOpposite.lean` is a refactor consumer: statements kept,
  proofs replaced by the weak-dimension route (3.4).
- Tau Ceti's `TauCeti.globalDimension` (`TauCeti/RingTheory/GlobalDimension.lean`) becomes the
  case `ModuleCat A` of `TauCeti.Abelian.globalDimension` (3.2); its cyclic and finite
  characterizations become corollaries of Auslander's lemma.
- ArtinAlgebras, §7.5, the forward direction: for an additive generator `M` of `mod A`, every
  finitely presented right `End_A(M)`-module has projective dimension at most two, and
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` (3.4) turns this into
  `globalDimension (Module.End A M) ≤ 2` using only that `End_A(M)` is left Noetherian.
- ArtinAlgebras, §§4.1–4.2, through Tau Ceti's
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel`
  (`Tr M ⊗_A N` as the cokernel of `Hom_A(P₀, N) → Hom_A(P₁, N)`) and
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom` (the stable Hom as the cokernel of
  `Hom_A(M, A) ⊗_A N → Hom_A(M, N)`): 1.4 identifies `Tor_1^A(Tr M, N)` with the stable
  `Hom_A(M, N)` for finitely presented `M` ([Auslander78, I, Prop. 3.2]).
- ArtinAlgebras, Layer 4: the Auslander-Reiten translate is built from finite minimal projective
  presentations (`TauCeti.FiniteProjectivePresentation.exists_isMinimal`); 4.2 provides them for
  finitely presented modules over any semiperfect ring.
- Hoshino's flat-dominant dimension ([Ho], [Xi, §1], as cited in ArtinAlgebras §7.3) asks the
  terms of a minimal injective coresolution to be flat; ArtinAlgebras leaves it out because
  flatness over noncommutative rings is missing. Layer 2 supplies that flatness.
- Tau Ceti's `TauCeti.IsSemiperfectRing` (`TauCeti/RingTheory/Jacobson/Semiperfect.lean`) is
  refactored to `extends IsSemilocalRing` (4.2), so that its field `isSemisimpleRing` becomes the
  `IsSemilocalRing` parent; no compatibility shims.
- The explicit hypotheses `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]` on Tau Ceti main (nine binders
  in six files at the baseline) become `[IsSemilocalRing R]` (4.2):
  `TauCeti/Algebra/Module/ProjectiveCover/Simple.lean` (two theorems),
  `TauCeti/RingTheory/Idempotents/Corner/Local.lean` (one theorem),
  `TauCeti/RingTheory/Semisimple/BasicAlgebra.lean` (two theorems),
  `TauCeti/RingTheory/MatlisDuality/Basic.lean` (one `variable`),
  `TauCeti/RingTheory/MatlisDuality/Semilocal.lean` (two `variable`s) and
  `TauCeti/Algebra/Category/ModuleCat/MatlisDual.lean` (one `variable`). The last three are over a
  commutative ring, where `IsSemilocalRing` means finitely many maximal ideals (4.2).
- Krause's criterion (the owner's TauCetiProject/TauCeti#33561,
  `TauCeti/CategoryTheory/Preadditive/KrullSchmidt/Semiperfect.lean`):
  `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectRing_end`,
  `TauCeti.isKrullSchmidt_of_isSemiperfectRing_end` and the instance
  `TauCeti.IsKrullSchmidt.isSemiperfectRing_end` are restated with `IsSemiperfectCategory` (4.2),
  with no alias.

## Sources and locators

- [AF] F. W. Anderson, K. R. Fuller, *Rings and Categories of Modules*, 2nd ed., Graduate Texts in
  Mathematics 13, Springer (1992). §28: left and right T-nilpotence, p. 314; Lemma 28.3,
  pp. 314–315; Theorem 28.4 (Bass), pp. 315–317; Corollary 28.7, p. 318.
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
- [Bass] H. Bass, *Finitistic dimension and a homological generalization of semi-primary rings*,
  Trans. Amer. Math. Soc. 95 (1960), 466–488. T-nilpotence, p. 466; Theorem P, pp. 467–468;
  Lemmas 1.1–1.3, pp. 468–470 (the telescope module and its splitting; the splitting argument is
  Lemma 1.3); Theorem 2.1, p. 471; Lemma 2.6, p. 473 (covers from `B = NB ⇒ B = 0`), with the
  König graph argument for T-nilpotent radicals, pp. 473–474; Prop. 2.7, p. 474 (`P ≠ NP` for a
  nonzero projective `P`); Eilenberg's argument for `Pd = Wd` over left perfect rings, reproduced
  on p. 475 (`Tor_n(R ⧸ N, A) ≅ P_n ⧸ NP_n` for a minimal resolution); §3, Examples, p. 475.
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
  §3.2, Theorem, p. 1655. His "locally finitely presented" means finitely accessible additive.
  His functors are contravariant, `(𝒞ᵒᵖ, Ab)`, as here.
- [CE] H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton University Press (1956). Ch. VI,
  §5, Prop. 5.1, p. 120 (`Ext_Λ(A, Hom_Γ(B, C)) ≅ Hom_Γ(Tor^Λ(A, B), C)` for `Γ`-injective `C`);
  Prop. 5.3, p. 120 (the dual formula, for a left Noetherian ring and a finitely generated `A`).
  Ch. VI, Exer. 3 (flat and projective dimension of finite modules over a Noetherian ring), cited
  through [Au, p. 70]; not read.
- [CI] M. Cortés-Izurdiaga, *Flatness in finitely accessible additive categories*,
  arXiv:2505.07742v1: the definitions before Proposition `p:CharacterizationFlats` (flat modules
  versus flat objects inside the category of flat modules). No published numbering.
- [CPT] S. Crivei, M. Prest, B. Torrecillas, *Covers in finitely accessible categories*, Proc. Amer.
  Math. Soc. 138 (2010), 1213–1221. pp. 1214 and 1218 (finitely accessible versus locally finitely
  presented); Cor. 3.3, p. 1218 (flat covers in `Mod C`).
- [Fisher] J. L. Fisher, *The tensor product of functors, satellites, and derived functors*,
  J. Algebra 8 (1968), 277–294. Thms. 1.3–1.4, pp. 279–280 (left exact functors on a small abelian
  category as filtered colimits of representables); Thm. 2.4 and Cor. 2.9, pp. 284–285.
  Contravariant left exact functors, as here.
- [Govorov] V. E. Govorov, *On flat modules*, Sibirsk. Mat. Zh. 6 (1965), 300–304 (Russian): a flat
  module is a direct limit of free modules. Read in the original.
- [Harada] M. Harada, *Perfect categories I*, Osaka J. Math. 10 (1973), 329–341. Introduction,
  pp. 329–330: perfect Grothendieck categories, and Theorem P for the functor category `(C, Ab)`
  of a small additive category `C`; Lemma 6 and Theorems 3–4, p. 337; Theorem 5 and Remark 1,
  pp. 339–340 (Bass's module over the ring with enough idempotents of a category; p. 339 checked on
  the page image, the rest through a reading of the text extraction). Its functor categories
  `(C, Ab)` are covariant; applied here to `Cᵒᵖ`. *Perfect categories II*,
  ibid., 343–355: Theorem 2′, p. 346, stated without proof. Parts III–IV have no flatness.
- [Jategaonkar] A. V. Jategaonkar, *A counter-example in ring theory and homological algebra*,
  J. Algebra 12 (1969), 418–440. Thm. 4.10, pp. 438–439 (principal left ideal domains of any right
  global dimension).
- [JL] C. U. Jensen, H. Lenzing, *Model Theoretic Algebra*, Gordon and Breach (1989). Appendix B,
  Theorems B.12 and B.14, read in an electronic text whose page numbers were not checked.
- [Krause] H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015),
  535–549; arXiv:1410.2822. Lemma 3.6 and Proposition 4.1, read in the arXiv TeX source; the
  journal page range and numbering were not checked.
- [Krause-Defect] H. Krause, *A short proof for Auslander's defect formula*, Linear Algebra Appl.
  365 (2003), 267–270. The snake-lemma step, as cited and formalized in
  TauCetiProject/TauCeti#37151; not read here.
- [Krause-FlatCovers] H. Krause, *Morphisms determined by objects and flat covers*, Forum Math. 28
  (2016), 425–435. Theorems 1.1 and 2.2, read in arXiv:1403.6039v2 (numbering of v2). Pointer
  only.
- [Krause-Smashing] H. Krause, *Smashing subcategories and the telescope conjecture — an algebraic
  approach*, Invent. Math. 139 (2000), 99–133. §2.3, p. 115: `Flat C = Ind C`, and Lemma 2.7 (for
  a skeletally small triangulated `C`: flat, cohomological and fp-injective agree, for additive
  `M : Cᵒᵖ → Ab`, as here), with Lemma 1.6.
- [Lam-FC] T. Y. Lam, *A First Course in Noncommutative Rings*, 2nd ed., Graduate Texts in
  Mathematics 131, Springer (2001). (23.13)–(23.16), pp. 351–352; (23.19), p. 353; (23.20), p. 354;
  (23.22), p. 356; (24.7), p. 360; (24.12), p. 361; (24.16), p. 364; (24.18)–(24.20), p. 365;
  (24.22), p. 366; (24.23)–(24.24), pp. 367–368; (24.25), pp. 369–370; (4.14), pp. 57–58 (a ring is
  semisimple exactly when it is J-semisimple and left Artinian, exactly when it is J-semisimple with
  the descending chain condition on principal left ideals; the proof splits off minimal left ideals
  through a maximal left ideal missing them and uses no Brauer lemma), read in the derivative of §4.
  Left-handed; applied to the opposite ring where needed.
- [Lam-LMR] T. Y. Lam, *Lectures on Modules and Rings*, Graduate Texts in Mathematics 189,
  Springer (1999). (4.9) and (4.12), p. 125; (4.13)–(4.14), p. 126; (4.23)–(4.24), pp. 129–130;
  (4.30), p. 133; (4.32)–(4.34), pp. 133–134; (4.47), p. 139; (5.53)–(5.57),
  pp. 183–184; (5.58)–(5.59), p. 184; (5.62b) and (5.63), p. 185; (5.69)–(5.70), p. 187; (5.71),
  p. 188. (2.33), cited in (5.62b), was not read.
- [Lambek] J. Lambek, *A module is flat if and only if its character module is injective*, Canad.
  Math. Bull. 7 (1964), 237–243. Theorem, p. 239; Proposition 1 and `Ext(N, M*) ≅ Tor(N, M)*`,
  p. 241.
- [Lazard] D. Lazard, *Autour de la platitude*, Bull. Soc. Math. France 97 (1969), 81–128. Ch. I
  (noncommutative rings, p. 83): Lemme 1.1 and Thm. 1.2, p. 84; Cor. 1.3–1.4, p. 85; Thm. 3.2,
  p. 89. The 1964 announcement (C. R. Acad. Sci. Paris 258, 6313–6316) was not obtained.
- [Mares] E. A. Mares, *Semi-perfect modules*, Math. Z. 82 (1963), 347–360 (volume 82; Simson's
  bibliography has 83). Theorem 2.4, proof part (i), p. 349 (an endomorphism of a projective with
  small image has invertible `1 - s`); added-in-proof note, p. 360. For Layer 4.
- [ML] S. Mac Lane, *Categories for the Working Mathematician*, 2nd ed., Graduate Texts in
  Mathematics 5, Springer (1998). IX.6, p. 226: coends; the tensor product over a ring as a coend,
  with modules as additive functors on the one-object category; the tensor product of functors.
- [Mitchell] B. Mitchell, *Rings with several objects*, Adv. Math. 8 (1972), 1–161. §3,
  pp. 15–18: functor categories, representables, free and finitely presented functors; §6,
  pp. 26–27: the tensor product `F ⊗_C G`, its value on representables (1), the adjunction (2),
  preservation of colimits in both variables, the swap as a definition, the explicit quotient, and
  cogenerating injectives from `ℚ ⧸ ℤ`; §6, p. 32: `Tor` and `Ext` of functors, computed from a
  projective resolution of one variable; §7, pp. 33–38: the ring `[C]` of an additive category
  (p. 33), triangular matrix rings for a finite totally ordered set (Example 1, p. 33), Thm. 7.1
  (pp. 33–35: modules over `C` and over `[C]`, an equivalence when `C` has finitely many objects),
  and the compatibility with `⊗` and `Tor` (p. 37, (1)); §9, pp. 42–45: homological and global
  dimension of an abelian category, the right and left global dimension of a small additive
  category, `gl dim 𝒜ᵒᵖ = gl dim 𝒜` (p. 42), and the comparison with the ring `[C]` (p. 45, (6));
  §10, Prop. 10.1 and Cor. 10.2, p. 47: projectives are retracts of free functors, and tensoring
  with a projective is exact; §10, pp. 48–50: flat functors, Thm. 10.1b and Cor. 10.2b, p. 48
  (Lazard–Govorov), Cor. 10.4b, p. 49, finitely presented flat functors are projective, p. 49, and
  the dimension of flat functors, pp. 49–50 (Jensen's countable case, Osofsky's `ℵ_n` case,
  Lazard's slightly erroneous countable argument and its correction); §11, pp. 50–52:
  `K`-categories, `K`-linear functors to `K`-modules as additive functors to abelian groups
  (p. 51), the tensor product over `K` and its independence of `K` (p. 52). Pages 57–161 were not
  read. Mitchell writes morphisms on the right; his modules in general are covariant functors and
  are applied to `Cᵒᵖ`, while the projective and flat functors of §10 are contravariant
  (`G ∈ Ab^{𝒞*}`), as here.
- [OR] U. Oberst, H. Röhrl, *Flat and coherent functors*, J. Algebra 14 (1970), 91–105. (1.1),
  p. 93 (the adjunction over a commutative base ring); Lemma 1.2, p. 94; Lemma 2.4, p. 95;
  Lemma 3.1 and Thm. 3.2 (1)–(6), pp. 96–98, with proof; Cor. 3.3–3.5 and Remark, p. 99;
  Thm. 4.1, p. 101. Its flat functors `S ∈ [X°, Mod K]` are contravariant, as here; Lemma 1.2 is
  stated for a covariant `F` and is applied to `Cᵒᵖ`.
- [Osofsky-Card] B. L. Osofsky, *Homological dimension and cardinality*, Trans. Amer. Math. Soc.
  151 (1970), 641–649. Nice families, p. 641; Thm. A, p. 644.
- [PR] A. Pillay, P. Rothmaler, *Bass modules and embeddings into free modules*, arXiv:2501.04174v1,
  §3, Definition 4 and Lemma 5 (numbering of the HTML version of v1); the pp-formula view of the
  Bass obstruction, credited there to Puninski–Rothmaler (not read). An alternative only.
- [Rowen] L. H. Rowen, *Ring Theory*, vol. I, Academic Press (1988). Thm. 2.7.7 (ii), pp. 213–214,
  and Thm. 2.7.33, pp. 222–223 (Rentschler's direct proof that a perfect ring has the descending
  chain condition on principal ideals, in Rowen's conventions); read for the route comparison, not
  re-read here. R. Rentschler's paper, Arch. Math. 17 (1966), 298–301, was not read; the attribution
  is Lam's, after [Lam-FC, (24.25)].
- [Rump] W. Rump, *Flat covers in abelian and in non-abelian categories*, Adv. Math. 225 (2010),
  1589–1615. Theorem 2 and Corollary 2, pp. 1603–1604, read in a transcription. Pointer only.
- [Sandomierski] F. L. Sandomierski, *On semiperfect and perfect rings*, Proc. Amer. Math. Soc. 21
  (1969), 205–207. Proposition 1 (d) and Lemma 2, p. 205; Theorems 4 and 5, p. 206 (stated for
  right modules; Theorem 5: a ring is right perfect iff every semisimple right module has a
  projective cover).
- [Simson] D. Simson, *On pure global dimension of locally finitely presented Grothendieck
  categories*, Fund. Math. 96 (1977), 91–116. §1, pp. 92–93: "additive" means preadditive (finite
  sums are added only in Cor. 1.3 (b), p. 94), the radical `J(C)`, and semisimple categories;
  Prop. 1.2, p. 93 (semisimple iff von Neumann regular with semisimple endomorphism rings); Thm.
  2.1, pp. 94–95; Thm. 2.12 (c), p. 98 (`ℵ_n`-presented flat functors); Def. 3.1, pp. 98–99
  (factorizable inverse systems); left T-nilpotence of `J(C)` and Lemma 5.3 (Bass's Nakayama
  lemma), p. 108; Thm. 5.4, p. 108 (statement checked on the page image), with the
  proofs of (3′) ⇒ (4), (7) ⇒ (8) and (9′) ⇒ (1′), pp. 108–110; Thm. 5.6, p. 110. The steps through
  Thm. 3.16 and (5) ⇒ (4) were not fully read. Simson's modules are covariant functors; his
  statements are applied here to `Cᵒᵖ`. The earlier paper *Functor categories in which every
  flat object is projective*, Bull. Acad. Polon. Sci. 22 (1974), 375–380, was not obtained.
- [St] B. Stenström, *Purity in functor categories*, J. Algebra 8 (1968), 352–361. §2 and
  Lemmas 7–8, pp. 353–354; Thm. 3, pp. 357–359. Contravariant functors, as here.
- [Weibel] C. A. Weibel, *An Introduction to Homological Algebra*, Cambridge Studies in Advanced
  Mathematics 38, Cambridge University Press (1994). Thm. 2.7.2, pp. 58–59 (balance of `Tor`
  through the bicomplex `P ⊗ Q`); Acyclic Assembly Lemma 2.7.3, p. 59; Exer. 3.1.3, p. 68
  (`Tor_1^R(R ⧸ I, R ⧸ J) ≅ (I ∩ J) ⧸ IJ` for a right ideal `I` and a left ideal `J`).
- [Wisbauer] R. Wisbauer, *Foundations of Module and Ring Theory*, Gordon and Breach (1991).
  18.5 (1), p. 152 (a projective module that maps onto every simple module is a generator; the
  argument of the generation step), stated in `σ[M]`; 19.7, p. 161 (projective covers of simple
  modules have local endomorphism rings).
- M. Auslander, M. Bridger, *Stable module theory*, Mem. Amer. Math. Soc. 94 (1969). `Tor₁` of the
  transpose; not read.
- [Ho] M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280;
  [Xi] C. Xi, *Frobenius bimodules and flat-dominant dimensions*, arXiv:1903.07921v1. Cited for
  the consumer only, as in ArtinAlgebras.

