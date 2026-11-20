# Roadmap: Modules over preadditive categories, flatness, and perfect rings

**Summary.** Mathlib develops flat modules, `Tor`, and the character-module flatness test only over
commutative rings. Tau Ceti provides the balanced tensor product `M ⊗_A N` over an arbitrary ring
(`TauCeti.BalancedTensorProduct`), the global dimension of left modules, projective covers, and
semiperfect rings. This roadmap develops flat modules over noncommutative rings and flat functors
over preadditive categories. Every layer is category-primary under one convention: a module over a
preadditive category `C` is a contravariant additive functor, forming `Mod C`. A ring `A` enters as
`SingleObj Aᵐᵒᵖ`, whose modules are left `A`-modules; covariant additive functors are the objects of
`Mod Cᵒᵖ` (right `A`-modules for rings).

Layer 0 defines finitely generated and finitely presented functors (`mod C`) using finite sums of
representables, establishes the abelian and Grothendieck structure of `Mod C` (supplying Mathlib's
`Ext` and concrete submodules), and identifies left `A`-modules with `Mod (SingleObj Aᵐᵒᵖ)`. It
constructs the `R`-linear tensor product `C₁ ⊗_R C₂` (and `C₁ ⊗_ℤ C₂`) of categories, symmetric
`R`-central and preadditive bimodules `LinearBimod R D C = Mod (D ⊗_R Cᵒᵖ)` and `Bimod D C`,
one-sided ideals as one-sided `C`-submodules of the regular bimodule `_C C_C`, lattice
superfluousness, `I · M`, reduction over `C ⧸ I`, and von Neumann regular categories and rings,
followed by the coend and bimodule tensor products (with `R`-linearity, `Hom` into bimodules,
adjunctions, right exactness, projective factors, and symmetry), the ring API for `M ⊗_A N`
(extending Tau Ceti's outer bimodule actions and equipping `CharacterModule M` with its right
`A`-action), duals `Hom_R(-, E)`, `proj C` with bimodule projective duality `Hom(-, C)` and
finite-presentation bridges, and Morita equivalence of categories and rings. Layer 1 defines scalar
and bimodule `Tor`, proves long exact sequences and balance, constructs the stable category
`underline{mod C}` with Auslander–Bridger's transpose duality `(underline{mod C})ᵒᵖ ≌
underline{mod Cᵒᵖ}` and `stable Hom(X, N) ≅ Tor_1(Tr X, N)`, establishes `Tor`–`Ext` duality, and
compares finite-object categories with their category algebras. Layer 2 defines flatness
equationally and proves the ideal, `Tor`, and Lambek tests (via Baer's criterion), projectivity of
finitely presented flat modules, the Lazard–Govorov–purity `TFAE` characterization, equivalence with
left exactness and cohomological functors, Crawley-Boevey's representation theorem (both
directions), Bass's sequence module, and closure properties. Layer 3 develops flat, abelian global,
and weak global dimensions, homological characterizations of von Neumann regular categories and
rings (`weakGlobalDimension ≤ 0`), Auslander's theorem, kernel closure, and projective dimension of
countably presented flat modules.

Layer 4 treats T-nilpotent left ideals and Nakayama's lemma for all modules, semilocal, semiperfect,
and left perfect categories and rings, projective covers, pure superfluous subobjects of
projectives, and global dimension of left perfect categories. Its summit is **Simson's Theorem 5.4**
([Simson, Thm. 5.4, p. 108], applied to `Cᵒᵖ`), characterizing left perfectness of an essentially
small preadditive category `C` (`J(C)` T-nilpotent and `C ⧸ J(C)` semisimple) by projective covers,
maximal subobjects, projectivity of flat modules, factorizability of sequences (DCC on principal
right ideals), `flatDimension = projectiveDimension`, and filtered-colimit closure of `pd ≤ n` (cf.
[Harada]; [JL, p. 387]), together with this roadmap's categorical right-socle criterion (right
simple subobjects without infinite orthogonal idempotents) extending [Bass, Thm. P (7)].
Specializing to `SingleObj Aᵐᵒᵖ` yields **Bass's Theorem P** ([Bass, Theorem P]; [AF, 28.4];
[Lam-FC, (24.25)]), including the maximal-submodule, right-socle (`TauCeti.socle`), and
filtered-colimit clauses.

## How to read the build

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [0](#layer-0-modules-over-a-preadditive-category-and-their-tensor-product) | Modules, bimodules, and Morita theory | Finite presentation via finite sums, `Mod C` (abelian, Grothendieck, `Ext`, `ModCat.Submodule`), rings as `SingleObj Aᵐᵒᵖ`, `C₁ ⊗_R C₂` and `C₁ ⊗_ℤ C₂`, `LinearBimod R D C` and `Bimod D C`, ideals of `_C C_C`, superfluousness, `I · M` and `C ⧸ I`, coend and bimodule `⊗_C` and `Hom`, ring API, duals, `proj C`, `Hom(-, C)`, finite-presentation bridges, categorical and ring Morita equivalence |
| [1](#layer-1-tor) | `Tor` | Scalar and bimodule `Tor`, long exact sequences, balance, `underline{mod C}` and `(underline{mod C})ᵒᵖ ≌ underline{mod Cᵒᵖ}`, `Tor` of the transpose, `Tor`–`Ext` duality, comparisons, `Tor₁` of cyclic modules, category algebras |
| [2](#layer-2-flat-modules-and-flat-functors) | Flat modules and flat functors | Equational definition, ideal/`Tor`/Lambek tests, Baer criterion, Lazard–Govorov–purity `TFAE`, flat = left exact, triangulated case, representation theorem and converse, Bass's module, closure |
| [3](#layer-3-flat-dimension-global-and-weak-global-dimension) | Dimensions and von Neumann regularity | Flat dimension, abelian global dimension, Auslander's cyclic lemma, weak global dimension and symmetry, von Neumann regular categories and rings, `FP_∞` lemma, Auslander's theorem, kernels and countably presented flat modules |
| [4](#layer-4-semiperfect-and-left-perfect-categories-and-basss-theorem-p) | Semiperfect and left perfect categories | T-nilpotence and Nakayama for all modules, semilocal/semiperfect/left perfect categories and rings, radicals of projectives, projective covers, pure superfluous subobjects, Theorem P (with maximal-subobject, socle, and filtered-colimit `pd ≤ n` clauses), global dimension and Bass–Eilenberg |

Layers 1–3 each build on the preceding layers. Layer 4 has two branches: Sections 4.1–4.4 require
only Layer 0, the sequence-module definitions and vanishing criterion of 2.5 (which use only 0.1),
and ArtinAlgebras §0.2, so they can proceed in parallel with Layers 1–3; Sections 4.5 and 4.6 join
both branches. Outside the Krull–Schmidt clause of `isSemiperfectRing_tfae`, a direct proof of the
ring items of 4.2 needs only Mathlib and Tau Ceti. `Suggested.lean` states core definitions,
classes, and headline theorems; companion API and checks are specified here in prose.

## Conventions

1. **Modules and bimodules over categories.** Let `C : Type u` with `[Category.{v} C]
   [Preadditive C]`. A left `C`-module is an additive functor in `TauCeti.ModCat C :=
   Cᵒᵖ ⥤+ AddCommGrpCat.{w}`, with concrete submodules `TauCeti.ModCat.Submodule` and embeddings
   `C ⊆ proj C ⊆ Mod C` via `preadditiveYoneda`. Right `C`-modules are objects of `Mod Cᵒᵖ`
   (`Hom(X, -) = (ModCat.yoneda Cᵒᵖ).obj (op X)`; `preadditiveCoyoneda` is unused). A
   `(D, C)`-bimodule `_D M_C` is symmetrically an object of
   `TauCeti.ModCat.Bimod D C := ModCat (Preadditive.TensorProduct D Cᵒᵖ)` (and, when `[Linear R D]
   [Linear R C]`, an `R`-central bimodule in `TauCeti.ModCat.LinearBimod R D C :=
   ModCat (Linear.TensorProduct R D Cᵒᵖ)`, 0.3), with diagonal `_C C_C =
   TauCeti.ModCat.regularBimod C`.
2. **`R`-linearity.** Over a commutative ring `R`, `[Linear R C]` induces an `R`-action on each
   `F(c)` via `F(r • 𝟙 c)` (0.1), with `ℤ`-linearity always present. Following Mathlib
   (`Abelian.Ext`), `G ⊗_C F` and `Tor` take values in `AddCommGrpCat` and acquire `Module R`
   instances via `r • 𝟙`, packaged into `ModuleCat R`-valued bifunctors in 0.4 and 1.1; duals (0.8)
   and `BalancedTensorProduct R A M N` (0.7) depend on `R` and take it as an explicit parameter.
3. **Universes.** Definitions quantifying only over objects, morphisms, and module elements need no
   smallness: finite presentation (0.1, at `w = v`), projective and stable transpose duality (0.9,
   1.4), flatness (2.1), T-nilpotence (4.1), and the characterization theorems of 2.4 (finite
   accessibility of `Flat(C)` in 2.4 uses 2.3 under `EssentiallySmall.{v} C`). Coends, general
   bimodule `Hom` into `AddCommGrpCat.{w}` (0.4), and `Tor` assume `EssentiallySmall.{w}` on the
   summed or sliced category, setting `w = v` whenever representables also enter (Yoneda, Lazard,
   flat dimension, Theorem P); categories that are `EssentiallySmall.{w}` in another universe pass
   through `SmallModel` first.
4. **Rings and opposite sides.** Modules over a ring `A` are left modules; right `A`-modules are
   left `Aᵐᵒᵖ`-modules (`[Module Aᵐᵒᵖ M]`, with left modules viewed over `Aᵐᵒᵖᵐᵒᵖ` via
   `RingEquiv.opOp A`), and right ideals are `Submodule Aᵐᵒᵖ A`. A ring enters the categorical
   theory as `SingleObj Aᵐᵒᵖ` (following `CategoryTheory.Mat.equivalenceSingleObj`): because
   `f ≫ g = op (unop f * unop g)` there, contravariant functors satisfy `F(a b) = F(a) ∘ F(b)` and
   correspond to left `A`-modules (0.2).
5. **Native ring API.** Ring-level definitions (`BalancedTensorProduct`, `BalancedTor`,
   `BalancedFlat`, `flatDimension`, `weakGlobalDimension`, `IsLeftTNilpotent`, `IsSemilocalRing`,
   `IsLeftPerfectRing`) are defined natively on `ModuleCat A` or `A`-modules rather than transported
   across functor-category equivalences, though proofs may use the bridges of 0.2 and 0.7.
6. **Factor order.** Matching `BalancedTensorProduct R A M N`, `G ⊗_C F` places `G : Mod Cᵒᵖ` first
   and `F : Mod C` second, and `Tor^C_n(G, F)` and `BalancedTor R A n` derive in the second
   variable. Ring modules in homological statements live in `ModuleCat.{v} A` under `[Small.{v} A]`.
7. **Dimensions.** Homological dimensions take values in `WithBot ℕ∞`, equal to `⊥` solely on zero
   objects, matching `CategoryTheory.projectiveDimension` and `TauCeti.globalDimension`.
8. **Ideals and T-nilpotence.** Write `J = Ring.jacobson A` and
   `J(C) = TauCeti.jacobsonRadicalIdeal C`. Viewing `_C C_C` as a `(C, C)`-bimodule, two-sided
   ideals (`TauCeti.MorphismIdeal C`) are `(C, C)`-subbimodules, left ideals (`LeftMorphismIdeal C`)
   are left `C`-submodules forgetting the right `C`-action, and right ideals
   (`RightMorphismIdeal C`) are right `C`-submodules forgetting the left `C`-action (0.3), with
   coercions from `TauCeti.MorphismIdeal`. A left ideal `I` is **T-nilpotent** (`IsTNilpotent`) if
   every `I`-sequence `c₀ → c₁ → ⋯` has a zero composite `f₀ ≫ ⋯ ≫ fₙ₋₁` (4.1); for a right ideal
   `I`, the opposite condition is T-nilpotence of `I.op` on `Cᵒᵖ`. At `SingleObj Aᵐᵒᵖ`,
   `op a₀ ≫ ⋯ ≫ op aₙ₋₁ = op (a₀ ⋯ aₙ₋₁)`, matching left T-nilpotence `a₀ ⋯ aₙ₋₁ = 0` in `A`.
9. **Left perfectness.** `C` is **left perfect** (`IsLeftPerfectCategory C`) if every `End X` is
   semilocal and `J(C)` is T-nilpotent (as a left ideal; right perfectness is
   `IsLeftPerfectCategory Cᵒᵖ`); `A` is **left perfect** (`IsLeftPerfectRing A`) if `A ⧸ J` is
   semisimple and `J` is left T-nilpotent, equivalently `IsLeftPerfectCategory (SingleObj Aᵐᵒᵖ)`.
10. **Naming disambiguation.** Mathlib's `PerfectRing R p` and `TauCeti/RingTheory/Perfect/` concern
    bijectivity of Frobenius in characteristic `p`; Bass's and Simson's classes are always named
    `IsLeftPerfectRing` and `IsLeftPerfectCategory`.
11. **Duals.** For an `R`-module `E`, `F^E = Hom_R(F(-), E)` in `Mod Cᵒᵖ` (0.8), while ring modules
    use `Hom_R(M, E)` (`M →ₗ[R] E` with precomposition right `A`-action, packaged into
    `TauCeti.BalancedTensorProduct.homRight R A M` in 0.7); at `R = ℤ` and `E = ℚ ⧸ ℤ` (`AddCircle
    (1 : ℚ)`), `M⁺` is Mathlib's `CharacterModule M`, equipped with its noncommutative right
    `A`-module action `TauCeti.CharacterModule.rightModule` in 0.7.
12. **Projective covers.** Categorically, a projective cover is an essential epimorphism
    (`TauCeti.IsEssentialEpi`) from a projective object, with existence written
    `TauCeti.HasProjectiveCover M` (4.2). Over a ring, `TauCeti.IsProjectiveCover` is a surjection
    `P → M` from a projective module with superfluous kernel in `Submodule R P`
    (`TauCeti.isProjectiveCover_iff_forall_surjective`), and existence statements in 4.2, 4.4, and
    4.5 (aside from the explicit product cover of 4.2) use `TauCeti.exists_isProjectiveCover`'s
    submodule form:
    `∃ P : Submodule A (M →₀ A), IsProjectiveCover (Finsupp.linearCombination A id ∘ₗ P.subtype)`.
13. **Declaration names.** `Suggested.lean` prototypes core definitions, classes, and headline
    theorems under `TauCetiRoadmap.NoncommutativeFlatness`, whose proposed names appear in
    parentheses with the `TauCeti.` prefix here; companion API lemmas and checks are specified in
    prose below, with auxiliary names left to the implementer.
14. **Source variance.** [OR], [St], [CB], [Fisher] (except Cor. 2.9), [Krause-Smashing], and
    [Mitchell, §10] use contravariant functors matching `Mod C` (note [OR] writes `S ⊗_X F` with the
    contravariant factor first, reversing our `Tor` arguments). Covariant sources—[Simson] (except
    Thm. 2.1 (b)), [Fisher, Cor. 2.9], [Harada, Thm. 5], [Mitchell, §§3, 7, 9, 11], and [ML,
    IX.6]—are applied to `Cᵒᵖ`; right-module ring sources—[Chase 1960], [Lam-LMR], [Lam-FC,
    §§23–24], [Krause], and [Sandomierski]—are applied to `Aᵐᵒᵖ`. All page numbers in
    [References](#references) are printed pages unless noted.

## Layer 0: modules over a preadditive category and their tensor product

Throughout, `C : Type u` is preadditive with `Category.{v} C`, modules take values in
`AddCommGrpCat.{w}`, and `R` is a commutative ring.

### 0.1 `Mod C`

We set `TauCeti.ModCat C := Cᵒᵖ ⥤+ AddCommGrpCat.{w}`; covariant additive functors are objects of
`TauCeti.ModCat Cᵒᵖ`.

- **Finite presentation by finite sums of representables**, the first milestone
  (`TauCeti.IsFinitelyGeneratedFunctor`, `TauCeti.IsFinitelyPresentedFunctor`,
  `TauCeti.isFinitelyPresentedFunctor`, `TauCeti.IsFinitelyPresentedFunctor.cokernel`). A functor
  `F : Cᵒᵖ ⥤ AddCommGrpCat.{v}` is finitely generated if it is a quotient of a finite coproduct of
  representables `Hom(-, Y₁) ⊕ ⋯ ⊕ Hom(-, Yₙ)`, and finitely presented if it is the cokernel of a
  morphism between two such coproducts (hence additive); by Yoneda, morphisms between finite sums of
  representables come from morphism matrices. When `C` has finite biproducts, single representables
  suffice.

  Zero is finitely presented via empty sums without requiring `C` to be nonempty
  (`ObjectProperty.ContainsZero`). Without biproducts in `C`, if `F` is finitely generated and `G`
  is finitely presented then `coker(φ : F ⟶ G)` is finitely presented
  (`IsFinitelyPresentedFunctor.cokernel`: lifting `U₀ ↠ F ⟶ G` across `V₀ ↠ G` on each representable
  summand presents `coker φ` as `coker(V₁ ⊞ U₀ ⟶ V₀)`, adding the lifted generators of `F` to the
  relations of `G`—so quotients of finitely presented functors by finitely generated subfunctors are
  finitely presented, yielding `IsClosedUnderCokernels` on `mod C`), and finitely presented functors
  are closed under finite coproducts (`IsClosedUnderFiniteCoproducts`, combining presentations by
  block matrices) and retracts (`coker(𝟙 - e)`). This generalizes ArtinAlgebras §1.1's
  single-representable predicates without shims: under
  `[HasFiniteBiproducts C]` the two agree
  (`TauCeti.isFinitelyPresentedFunctor_iff_exists_single`), the basic single-representable API is
  restricted to that hypothesis, and downstream results in additive, abelian, or Krull–Schmidt
  categories retain their mathematical meaning with proofs migrated to the new interface.
- **Abelian and colimit structure.** Additive functors contain zero and are closed under objectwise
  kernels, cokernels, finite products, and colimits, equipping `Mod C` with an abelian structure and
  all colimits of `AddCommGrpCat`.
- **Representables, concrete submodules, and Grothendieck structure** (`TauCeti.ModCat.yoneda : C ⥤
  ModCat.{v} C`, `TauCeti.ModCat.Submodule`, `TauCeti.ModCat.Submodule.nonempty_orderIsoSubobject`).
  Each `Hom(-, X)` is projective by Yoneda. Concrete `C`-submodules `ModCat.Submodule F` (pointwise
  `AddSubgroup`s closed under `F.map`, forming a complete lattice order-isomorphic to `Subobject F`
  without universe bumps) support elementwise ideal and Zorn arguments across Layers 0–4. Under
  `EssentiallySmall.{w} C`, coproducts of representables over a small model give enough projectives
  ([Mitchell, §3, pp. 15–18]) and a separator, making `ModCat.{w} C` a Grothendieck abelian category
  (`IsGrothendieckAbelian`, automatically supplying Mathlib's `Abelian.Ext` and
  `Abelian.linearExtFunctor` for 1.5, 2.2, and 3.1, enough injectives for 3.2, and `WellPowered`).
  Subobject lattices `Subobject M` are complete, modular (`IsModularLattice`), and compactly
  generated (`IsCompactlyGenerated`) with finitely generated subobjects as compact elements (4.2).
- **Maximal subobjects** (`TauCeti.ModCat.exists_isCoatom_of_isFinitelyGeneratedFunctor`), with no
  smallness hypothesis: every nonzero finitely generated module `M` has a maximal proper subobject
  (coatom of `Subobject M`), proved via Zorn's lemma (`zorn_le_nonempty₀`) on proper additive
  subfunctors, since a chain union cannot contain all finitely many generators of `M` unless one
  member already does (used in 4.1).
- **`R`-linearity and `mod C ⊆ Mod C`** (`Linear R (ModCat C)`). When `[Linear R C]`, `r ∈ R` acts
  on `F(c)` by `F(r • 𝟙 c)`, lifting `F` to `ModuleCat R` and making `Mod C` an `R`-linear category
  ([Mitchell, §11, p. 51]), with full subcategory inclusion `mod C ⥤ Mod C`.

**Checks.** Over the `k`-linear quiver category `1 → 2`, `Mod C` consists of linear maps `V₂ → V₁`
with projectives `Hom(-, 1) = (0 → k)` and `Hom(-, 2) = (k → k)`, while `Mod Cᵒᵖ` consists of
`V₁ → V₂`. Over `SingleObj ℤᵐᵒᵖ`, `ℤ²` is finitely presented via finite sums but not single
representables.

### 0.2 Rings as one-object categories

- **Module and opposite equivalences** (`TauCeti.moduleCatEquivModCat A : ModuleCat.{v} A ≌
  ModCat.{v} (SingleObj Aᵐᵒᵖ)`, `TauCeti.moduleCatMulOppositeEquivModCatOp A`). In every module
  universe `v`, a left `A`-module `M` corresponds to the functor on `SingleObj Aᵐᵒᵖ` with value `M`
  and `op a` acting as left multiplication by `a` ([ML, IX.6, p. 226]), sending `A` to `Hom(-, ∗)`
  (and right `A`-modules to `Hom(∗, -)`), while `SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ` identifies
  `SingleObj Aᵐᵒᵖᵐᵒᵖ` with `(SingleObj Aᵐᵒᵖ)ᵒᵖ` (1.3).
- **Linearity, smallness, and transfer.** For `[Algebra R A]`, `SingleObj A` (and hence
  `SingleObj Aᵐᵒᵖ`) is `R`-linear, matching scalar restriction along `algebraMap R A` at `∗`. Under
  `[Small.{v} A]`, `SingleObj A` is `EssentiallySmall.{v}` and `Small.{v} Aᵐᵒᵖ` holds
  (`TauCeti.small_mulOpposite`). Transfer lemmas preserve projectivity, exactness, finite
  generation/presentation, `Tor`, flatness, and dimensions.

**Checks.** Over `A = k[x]`, `Mod (SingleObj Aᵐᵒᵖ)` is a `k`-vector space with an endomorphism; on
`SingleObj A` itself, contravariant functors satisfy `F(a b) = F(b) ∘ F(a)` (right modules).

*Needs:* 0.1.

### 0.3 Tensor product of categories, bimodules, and ideals of `C`

- **Tensor product of categories and bimodules** (`TauCeti.Linear.TensorProduct`,
  `TauCeti.Preadditive.TensorProduct`, `TauCeti.Linear.TensorProduct.tmul_comp_tmul`,
  `TauCeti.Linear.TensorProduct.inlObj`, `TauCeti.Linear.TensorProduct.inrObj`,
  `TauCeti.Linear.TensorProduct.singleObjEquiv`, `TauCeti.ModCat.LinearBimod`,
  `TauCeti.ModCat.Bimod`, `TauCeti.ModCat.LinearBimod.nonempty_singleObjEquiv`,
  `TauCeti.ModCat.Bimod.nonempty_curryLeftEquiv`, `TauCeti.ModCat.Bimod.nonempty_curryRightEquiv`,
  `TauCeti.ModCat.Bimod.sliceLeft`, `TauCeti.ModCat.Bimod.sliceRight`,
  `TauCeti.ModCat.regularBimod`). For `R`-linear `C₁`, `C₂`, `Linear.TensorProduct R C₁ C₂`
  (`C₁ ⊗_R C₂`, specializing at `R = ℤ` to `Preadditive.TensorProduct C₁ C₂`) has objects `C₁ × C₂`
  and morphisms `(X₁ ⟶ Y₁) ⊗[R] (X₂ ⟶ Y₂)` with `R`-bilinear composition ([Mitchell, §2,
  pp. 13–14]), `R`-linearity, symmetry, opposite compatibility, preservation of `EssentiallySmall`,
  and the `R`-linear bridge `SingleObj A ⊗_R SingleObj B ≌ SingleObj (A ⊗[R] B)` to Mathlib's
  tensor product of `R`-algebras. Setting `ModCat.LinearBimod R D C := ModCat (D ⊗_R Cᵒᵖ)` gives a
  symmetric category of `R`-central `(D, C)`-bimodules (agreeing at `R = ℤ` with arbitrary
  `(D, C)`-bimodules `ModCat.Bimod D C := ModCat (D ⊗_ℤ Cᵒᵖ)`) that inherits `Abelian`, colimits,
  `IsGrothendieckAbelian`, and two-sided subbimodules (`ModCat.Submodule M`) directly from 0.1
  without duplication, with currying equivalences `Bimod D C ≌ (C ⥤+ Mod D)` and `Dᵒᵖ ⥤+ Mod Cᵒᵖ`
  at `R = ℤ` (and onto `R`-linear functors for `LinearBimod R D C`), slices `M(-, c) : Mod D` and
  `M(d, -) : Mod Cᵒᵖ`, the regular bimodule `_C C_C` (`(X, Y) ↦ Hom_C(X, Y)`), and the
  one-object bridge `LinearBimod R (SingleObj Aᵐᵒᵖ) (SingleObj Bᵐᵒᵖ) ≌ ModuleCat (A ⊗[R] Bᵐᵒᵖ)`
  matching Mathlib's `TensorProduct.Algebra.module` (`Mathlib/Algebra/Module/Bimodule.lean`).
- **One-sided and two-sided ideals via `_C C_C`** (`TauCeti.ModCat.Bimod.LeftSubmodule`,
  `TauCeti.ModCat.Bimod.RightSubmodule`, `TauCeti.MorphismIdeal.orderIsoSubmoduleRegularBimod`,
  `TauCeti.LeftMorphismIdeal C`, `TauCeti.RightMorphismIdeal C`,
  `TauCeti.LeftMorphismIdeal.comp_mem`, `TauCeti.RightMorphismIdeal.comp_mem`,
  `TauCeti.RightMorphismIdeal.op`, `TauCeti.MorphismIdeal.op_toRightMorphismIdeal`). Extending the
  ring definition of left and two-sided ideals of `_A A_A`, two-sided ideals
  `TauCeti.MorphismIdeal C` are order-isomorphic to `(C, C)`-subbimodules
  `ModCat.Submodule (ModCat.regularBimod C)`, while left ideals of `C` are left `C`-submodules of
  `_C C_C` forgetting the right `C`-action (`∀ Y, ModCat.Submodule ((regularBimod C).sliceLeft
  Y)`, i.e., `I(-, Y) ≤ Hom(-, Y)` with precomposition lemma `comp_mem`), and right ideals are right
  `C`-submodules (`I(X, -) ≤ Hom(X, -)` with postcomposition lemma `comp_mem`), order-isomorphic to
  left ideals of `Cᵒᵖ` and receiving coercions from `TauCeti.MorphismIdeal`. Single-object ideals of
  [Mitchell, §3, p. 18] and [OR, pp. 93–96] embed via extension by `0`
  (`TauCeti.RightMorphismIdeal.ofSubmodule`, `TauCeti.RightMorphismIdeal.principal`), and over
  `SingleObj Aᵐᵒᵖ` order isomorphisms identify left and right ideals of `A` with those of
  `SingleObj Aᵐᵒᵖ`, sending `aA` to the principal right ideal of `op a`.
- **Superfluous elements** (`TauCeti.IsSuperfluous`). Refactors `TauCeti.IsSuperfluous` from
  `Submodule R M` to any lattice with `⊤` (`a ⊔ b = ⊤ → b = ⊤`): `⊥` and binary `⊔` are `simp`
  lemmas, finite suprema preserve superfluousness, superfluous elements lie below coatoms and vanish
  when complemented, and an epimorphism `p` in an abelian category is essential iff
  `kernelSubobject p` is superfluous.
- **Action of left ideals and reduction modulo `I`** (`TauCeti.LeftMorphismIdeal.smul`). For a left
  ideal `I` and `M : Mod C`, `(I · M)(c)` consists of finite sums `∑ M(fᵢ)(xᵢ)` with `fᵢ ∈ I(c, dᵢ)`
  (closed under `M(h)` by precomposition closure of `I`), commuting with small coproducts
  (`I · (⊕ Mᵢ) = ⊕ I · Mᵢ`, used in 4.4) and specializing at `SingleObj Aᵐᵒᵖ` to `J • ⊤`. For
  two-sided `I`, restriction `Mod (C ⧸ I) ⥤ Mod C` along `C ⥤ C ⧸ I` is fully faithful with
  essential image `{M | I · M = 0}` and left adjoint `M ↦ M ⧸ I · M` (unit equal to `M ⟶ M ⧸ I · M`,
  preserving all colimits); at `I = J(C)` this produces modules over `C ⧸ J(C)` (semisimple when `C`
  is semilocal, 4.2, as in 4.4 and 4.5).
- **Von Neumann regular categories and rings** (`TauCeti.IsVonNeumannRegularCategory`,
  `TauCeti.IsVonNeumannRegularRing`): `∀ f : X ⟶ Y, ∃ g : Y ⟶ X, f ≫ g ≫ f = f` on `C` and
  `∀ a, ∃ b, a * b * a = a` on `A` (symmetric under opposites, satisfied by Boolean and semisimple
  rings, and implying `J(C) = ⊥` and `Ring.jacobson A = ⊥`; used directly in 4.2 and characterized
  homologically by `weakGlobalDimension ≤ 0` in 3.3).

**Checks.** In `SingleObj Aᵐᵒᵖ`, `Aa` corresponds to `{op (b a)}` (precomposition-closed only); over
`ℤ`, `2ℤ · ℚ = ℚ` is not superfluous because `2ℤ` is not T-nilpotent (4.1).

*Needs:* 0.1, 0.2; Tau Ceti `MorphismIdeal`, `IsEssentialEpi`, `IsSuperfluous` (refactored).

### 0.4 The tensor product over `C`

Under `[EssentiallySmall.{w} C]`, the tensor product `G ⊗_C F` (`TauCeti.ModCat.tensorObj G F`) of
`G : Mod Cᵒᵖ` and `F : Mod C` is the `AddCommGrpCat`-coend of `G(c') ⊗_ℤ F(c)`
(`TauCeti.tensorBifunctor` specialized to `Cᵒᵖ`), i.e., the quotient of `⊕_c G(c) ⊗ F(c)` by
`x ⊗ F(f) y - G(f) x ⊗ y` ([Mitchell, §6, pp. 26–27]).

- **Universal property and bifunctors** (`TauCeti.ModCat.tensor`, `TauCeti.ModCat.linearTensor`):
  pure tensors, balancing, induction/extensionality, additive bifunctor `tensor`, and—when `[Linear
  R C]`—the `Module R` action `r • z = (G ⊗_C (r • 𝟙 F)) z = ((r • 𝟙 G) ⊗_C F) z` assembled into
  `linearTensor : ModCat Cᵒᵖ ⥤ ModCat C ⥤ ModuleCat R`.
- **Adjunctions, colimits, and Yoneda** (`TauCeti.ModCat.nonempty_tensorObjYonedaIso`,
  `TauCeti.ModCat.nonempty_yonedaTensorObjIso`): `Hom_R(G ⊗_C F, X) ≃ₗ[R] Hom(F, Hom_R(G(-), X))`
  and its mirror ([Mitchell, §6, p. 26]; [St, Thm. 1, p. 355]), whence both partial tensor functors
  preserve colimits and are right exact; `G ⊗_C Hom(-, X) ≅ G(X)` and `Hom(X, -) ⊗_C F ≅ F(X)`.
- **Bimodule tensor and `Hom` functors** (`TauCeti.ModCat.Bimod.tensor`,
  `TauCeti.ModCat.Bimod.homLeft`, `TauCeti.ModCat.Bimod.homRight`,
  `TauCeti.ModCat.Bimod.tensorLeft`, `TauCeti.ModCat.Bimod.homCovLeft`,
  `TauCeti.ModCat.Bimod.nonempty_tensorLeftHomAdjunction`). Symmetrically, for `_D M_C` and `_C N_E`
  under `[EssentiallySmall.{w} C]` (with no smallness on `D` or `E`), `(M ⊗_C N)(d, e) := M(d, -)
  ⊗_C N(-, e)` defines `Bimod.tensor : Bimod D C ⥤ Bimod C E ⥤ Bimod D E` (recovering `linearTensor`
  at `D = SingleObj Rᵐᵒᵖ`) and `tensorLeft M : Mod C ⥤ Mod D` (`F ↦ (d ↦ M(d, -) ⊗_C F)`). Under
  `[EssentiallySmall.{w} D]`, natural transformations in `ModCat.{w} D` fit in `AddCommGrpCat.{w}`,
  giving `homLeft M : (Mod D)ᵒᵖ ⥤ Mod Cᵒᵖ` (`P ↦ (c ↦ Hom_{Mod D}(P, M(-, c)))`) and `homCovLeft M :
  Mod D ⥤ Mod C` (`G ↦ (c ↦ Hom_{Mod D}(M(-, c), G))`), right adjoint to `tensorLeft M` when both
  `C` and `D` are `EssentiallySmall.{w}`; symmetrically, `[EssentiallySmall.{w} C]` gives `homRight
  M : (Mod Cᵒᵖ)ᵒᵖ ⥤ Mod D` (`X ↦ (d ↦ Hom_{Mod Cᵒᵖ}(X, M(d, -)))`; [Mitchell, §6, p. 26]).
- **Quotient representables** (`TauCeti.MorphismIdeal.quotientYoneda`): for a right ideal `S ⊆
  Hom(X, -)`, `(Hom(X, -) ⧸ S) ⊗_C M` is `M(X)` modulo the additive subgroup generated by `M(f)(m)`
  (`f ∈ S(Y)`, `m ∈ M(Y)`; [OR, Lemma 1.2, p. 94]), which for two-sided `I` equals `(I · M)(X)`,
  giving `(C ⧸ I)(X, -) ⊗_C M ≅ (M ⧸ I · M)(X)` (4.6).

**Checks.** Over `1 → 2`, `Hom(1, -) ⊗_C F ≅ F(1)`; over `SingleObj Aᵐᵒᵖ`, `G ⊗_C F` matches
`M ⊗_A N` (0.7).

*Needs:* 0.1, 0.3; Tau Ceti `MorphismIdeal.op`.

### 0.5 Projective factors

If `F : Mod C` (or `G : Mod Cᵒᵖ`) is projective, `- ⊗_C F` (respectively `G ⊗_C -`) preserves
monomorphisms ([Mitchell, Prop. 10.1, Cor. 10.2, p. 47]): Yoneda handles representables, colimit
preservation extends to coproducts, and projectives are retracts of coproducts of representables.

*Needs:* 0.1, 0.4.

### 0.6 The swap

Via `TauCeti.ModCat.opOpEquiv : Mod C ≌ Mod Cᵒᵖᵒᵖ`, `x ⊗ y ↦ y ⊗ x` induces a natural isomorphism `G
⊗_C F ≅ F ⊗_{Cᵒᵖ} G` (`TauCeti.ModCat.nonempty_tensorObjSwapIso`), allowing covariant statements to
be deduced from `Mod C` applied to `Cᵒᵖ` and preserving suprema in 3.3 and 4.6.

*Needs:* 0.4.

### 0.7 Rings: the balanced tensor product

For an `R`-algebra `A`, ring tensor products extend `TauCeti.BalancedTensorProduct R A M N`:

- **Functoriality, adjunction, and projective factors** (`TauCeti.BalancedTensorProduct.rTensor`,
  `TauCeti.BalancedTensorProduct.functor`, `TauCeti.BalancedTensorProduct.homRight`): `- ⊗_A N` is
  left adjoint to `Hom_R(N, -)` (`BalancedTensorProduct.homRight R A N`, equipping `N →ₗ[R] E` with
  precomposition right `A`-action), giving right exactness in both variables ([Lam-FC, (24.20),
  p. 365]); projective factors preserve injections; `m ⊗ n ↦ n ⊗ m` swaps `M ⊗_A N ≃ₗ[R]
  N ⊗_{Aᵐᵒᵖ} M` via `RingEquiv.opOp A`.
- **Change of base and comparisons** (`TauCeti.BalancedTensorProduct.exists_changeBaseLinearEquiv`,
  `TauCeti.BalancedTensorProduct.exists_changeBaseAddEquiv`,
  `TauCeti.BalancedTensorProduct.exists_intAddEquiv`,
  `TauCeti.BalancedTensorProduct.nonempty_tensorObjSingleObjIso`): along `R → R' → A` (in
  independent universes), `m ⊗ n ↦ m ⊗ n` gives an `R`-linear isomorphism onto `RestrictScalars R R'
  (M ⊗_A N)`, specializing at `ℤ → R` to an additive equivalence, both stated with their value on
  pure tensors; `nonempty_tensorObjSingleObjIso` compares `G ⊗_C F` on `SingleObj Aᵐᵒᵖ` with `M ⊗_A
  N` over `ℤ` (and `R`-linearly through the `ℤ → R` comparison); over commutative `R`,
  `BalancedTensorProduct R R M N` agrees `R`-linearly with `M ⊗[R] N`.
- **Outer bimodule actions** (`TauCeti.BalancedTensorProduct.bimodLeftFunctor`,
  `TauCeti.BalancedTensorProduct.bimodHomRight`,
  `TauCeti.BalancedTensorProduct.nonempty_bimodLeftHomAdjunction`): Tau Ceti supplies the symmetric
  `(A, C)`-bimodule structure on `M ⊗_B N` (`TauCeti.BalancedTensorProduct.leftModule`,
  `TauCeti.BalancedTensorProduct.rightModule`, `TauCeti.BalancedTensorProduct.outerSMulCommClass`,
  and associator `TauCeti.BalancedTensorProduct.assoc`); lifting `leftModule` packages `M ⊗_B - :
  ModuleCat B ⥤ ModuleCat A` left adjoint to `Hom_A(M, -) : ModuleCat A ⥤ ModuleCat B` (and
  symmetrically on the right).
- **Duals and character modules** (`TauCeti.CharacterModule.rightModule`): under the precomposition
  right `A`-action on `N →ₗ[R] E`, `Hom_R(M ⊗_A N, E) ≃ₗ[R] Hom_{Aᵐᵒᵖ}(M, Hom_R(N, E))`; equipping
  `CharacterModule N` (`N⁺`, i.e. `R = ℤ`, `E = ℚ ⧸ ℤ`) with its right `A`-module action
  `CharacterModule.rightModule` (`(op a • χ) n = χ (a • n)`), `i ⊗ N` is injective iff
  precomposition into `N⁺` is surjective (`TauCeti.CharacterModule.eval_injective`; [Lambek,
  Prop. 1, p. 241]).

**Checks.** `(A ⧸ I) ⊗_A N ≅ N ⧸ I N` recovers `ℤ ⧸ m ⊗_ℤ ℤ ⧸ n ≃+ ℤ ⧸ gcd(m, n)`; `ℤ ⧸ 2 ⊗_ℤ (2ℤ →
ℤ) = 0` while `ℤ ⧸ 2 ⊗_ℤ 2ℤ ≅ ℤ ⧸ 2`; `eA ⊗_A Af ≅ eAf`.

*Needs:* 0.2, 0.4–0.6; Tau Ceti `BalancedTensorProduct`, `CharacterModule.eval_injective`.

### 0.8 Duals with respect to an `R`-module `E`

Evaluating the `R`-linear Hom bifunctors of 0.4 at `E : ModuleCat.{w} R` defines
`TauCeti.ModCat.dual R E : (ModCat C)ᵒᵖ ⥤ ModCat Cᵒᵖ` (`F^E = Hom_R(F(-), E)`) and its covariant
mate. When `E` is injective, `(-)^E` is exact; when `E` is a cogenerator (`IsCoseparator`),
`F^E = 0 → F = 0`; when `E` is an injective cogenerator, `i ⊗_C F` is monic iff `Hom(G', F^E) →
Hom(G, F^E)` is surjective ([Lambek, p. 241]). Injectivity of `E` is needed: over `ℤ` with
`E = ℚ ⧸ ℤ ⊕ ℤ` and `i = 2 : ℤ → ℤ`, `i ⊗ ℤ` is injective but `2 : E → E` misses `(0, 1)`.

*Needs:* 0.4, 0.7.

### 0.9 Finitely generated projective modules, duality and finite presentation

Let `proj C` (`TauCeti.ModCat.proj C`) be the full subcategory of finitely generated (0.1)
projective modules in `Mod C`.

- **Structure and Karoubi envelope** (`proj C ≌ Karoubi (Mat_ C)`,
  `TauCeti.ModCat.nonempty_projEquivKaroubiMat`): `proj C` has finite biproducts, split idempotents,
  and consists of the retracts of finite coproducts of representables; `C ⥤ proj C` is fully
  faithful (an equivalence when `C` is additive and idempotent complete), and this equivalence
  recovers projectivization (`add M` versus finitely generated projective right `End M`-modules) in
  the one-object case.
- **Projective duality via the regular bimodule** (`TauCeti.ModCat.dualRegular`,
  `TauCeti.ModCat.projDual : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`,
  `TauCeti.ModCat.nonempty_homAddEquivTensorObjProjDual`): under `EssentiallySmall.{v} C`,
  specializing 0.4's `Bimod.homLeft` to `_C C_C` defines `(-)^∨ = Hom_{Mod C}(-, _C C_C) : (Mod C)ᵒᵖ
  ⥤ Mod Cᵒᵖ` (`P ↦ (Y ↦ Hom_{Mod C}(P, Hom_C(-, Y)))`) on all of `Mod C`. With no smallness on `C`,
  for any `P ∈ proj C` (a retract of a finite coproduct `⊕_{j < n} Hom_C(-, X_j)`), Yoneda realizes
  `Hom_{Mod C}(P, Hom_C(-, Y))` as the corresponding retract of `⊕_{j < n} Hom_C(X_j, Y)` in
  `AddCommGrpCat.{v}` without ad-hoc matrix transposition, yielding smallness-free `projDual : (proj
  C)ᵒᵖ ≌ proj Cᵒᵖ` (agreeing with the restriction of `dualRegular C` when `EssentiallySmall.{v} C`,
  and keeping 1.4's `Tr` smallness-free) with natural evaluation `Hom(P, F) ≅ P^∨ ⊗_C F` under
  `EssentiallySmall.{v} C`.
- **Finite-presentation and presentability bridges**
  (`TauCeti.ModCat.isFinitelyPresentedFunctor_tfae`,
  `TauCeti.ModCat.isCardinalPresentable_aleph_one_iff`, plus `IsLocallyFinitelyPresentable.{v}
  (ModCat.{v} C)`). Under `EssentiallySmall.{v} C`, being a cokernel in `proj C`, being finitely
  presented in the sense of 0.1, and `IsFinitelyPresentable` coincide (and match
  `Module.FinitePresentation` over rings, with 0.1 finite generation matching `Module.Finite`):
  representables are finitely presentable and form a strong generator of `Mod C`, so
  `IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable` identifies
  `IsFinitelyPresentable` with the finite-colimit closure of representables (0.1), while
  `isDense_colimitsCardinalClosure_ι` expresses every module as a filtered colimit of finitely
  presented modules ([CB, §1.2, p. 1645]; representables alone do not generate under filtered
  colimits, as `ℤ ⧸ 2` is not flat). Likewise, `IsCardinalPresentable` at `ℵ₁` coincides with
  cokernels of maps between countable coproducts of representables (2.5, 3.5, 4.5).
- **Rings:** `TauCeti.finiteProjectiveModules A ≌ proj (SingleObj Aᵐᵒᵖ)`, with duality `Hom_A(-, A)`
  onto `TauCeti.finiteProjectiveModules Aᵐᵒᵖ`.

**Checks.** Over `1 → 2`, `proj C` is Krull–Schmidt and every object is a finite sum of
representables (ArtinAlgebras §0.3); over `ℤ`, `ℤ²` satisfies all four finite-presentation
conditions.

*Needs:* 0.1–0.4, 0.6; Tau Ceti `finiteProjectiveModules`; ArtinAlgebras §0.3 (check).

### 0.10 Morita equivalence of categories and rings

- **Idempotent-additive completion and categorical Morita equivalence**
  (`TauCeti.ModCat.nonempty_modCatProjEquiv`, `TauCeti.ModCat.morita_tfae`; [Mitchell, §1, p. 12,
  Thm. 3.1, p. 16, Thm. 6.1, p. 24]; [Simson, Thm. 5.6, p. 110]): in every module universe with no
  smallness on `C`, restriction along `C ⥤ proj C` induces `Mod (proj C) ≌ Mod C` (extending
  additive functors uniquely across `Mat_ C` and `Karoubi`). For `EssentiallySmall.{v} C` and
  `EssentiallySmall.{v} D`, `morita_tfae` equates: (1) `ModCat.{v} C ≌ ModCat.{v} D`; (2) `proj C ≌
  proj D` (intrinsically the finitely presentable projectives in `Mod C`, 0.9); (3) `Karoubi (Mat_
  C) ≌ Karoubi (Mat_ D)`; and (4) invertible bimodules `P : Bimod D C`, `Q : Bimod C D` with `Q ⊗_D
  P ≅ _C C_C` and `P ⊗_C Q ≅ _D D_D` (by an Eilenberg–Watts comparison `E(-) ≅ P ⊗_C -` on `P(d, c)
  = E(Hom_C(-, c))(d)`, using Yoneda, 0.4's colimit preservation on cokernels of sums of
  representables, and bimodule tensor associativity `(Q ⊗_D P) ⊗_C - ≅ Q ⊗_D (P ⊗_C -)`). When
  `[Linear R C] [Linear R D]`, the `R`-linear enrichment requires `R`-linear equivalences in (1)–(3)
  and invertible `R`-central bimodules `P : LinearBimod R D C`, `Q : LinearBimod R C D` (0.3) with
  `R`-linear bimodule isomorphisms in (4).
- **Rings** (`TauCeti.isMoritaEquivalent_tfae`; [Lam-LMR, §18, pp. 475–490]): equates Morita
  equivalence `IsMoritaEquivalent R A B` of `R`-algebras `A, B : Type u` with `R`-linear
  equivalence of `finiteProjectiveModules A` and `finiteProjectiveModules B` (inverting Tau Ceti's
  `finiteProjectiveModulesEquivalence` via (1) ⇔ (2)), existence of a finitely generated projective
  separator `P : ModuleCat.{u} A` with `B ≃ₐ[R] (Module.End A P)ᵐᵒᵖ`, full-idempotent matrix
  corners (`IsMoritaEquivalent.matrix` and `IsIdempotentElem.isMoritaEquivalent_corner`), and
  invertible `R`-central `(B, A)`- and `(A, B)`-bimodules `P`, `Q` with bimodule isomorphisms `Q ⊗_B
  P ≅ A` and `P ⊗_A Q ≅ B` (using `BalancedTensorProduct.leftModule`, `rightModule`, and `assoc`).

**Checks.** `Mod C ≌ Mod (Mat_ C)` recovers `IsMoritaEquivalent.matrix` at `SingleObj Aᵐᵒᵖ`; full
idempotents give `IsIdempotentElem.isMoritaEquivalent_corner`. The matrix size in the corner
clause is positive: for `n = 0`, `e = 0` is full in the zero ring, which would make `ℤ` Morita
equivalent to the zero ring.

*Needs:* 0.1–0.4, 0.7, 0.9; Mathlib `IsMoritaEquivalent`, `IsMoritaEquivalent.matrix`; Tau Ceti
`isMoritaEquivalent_corner`, `finiteProjectiveModulesEquivalence`.

## Layer 1: `Tor`

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{w} C`, and
modules and `Tor` live in universe `w`.

### 1.1 Definition

`TauCeti.ModCat.tor n : ModCat Cᵒᵖ ⥤ ModCat C ⥤ AddCommGrpCat` is defined at `G` as
`(ModCat.tensor.obj G).leftDerived n` and on morphisms via `NatTrans.leftDerived`, identifying
`Tor_0` with `⊗_C`, vanishing in degree `n + 1` on projective `F`, and computing `Tor_n(G, F)` from
the homology of `G ⊗_C P` on any projective resolution `P` of `F`. When `[Linear R C]`, `r ∈ R` acts
via `Tor_n(G, r • 𝟙 F) = Tor_n(r • 𝟙 G, F)`, packaged into `TauCeti.ModCat.linearTor R n :
ModCat Cᵒᵖ ⥤ ModCat C ⥤ ModuleCat R`. Comparisons in `Suggested.lean` stated over `ℤ` upgrade to
`R`-linearity by naturality via these scalar-action lemmas.

- **Bimodule `Tor`** (`TauCeti.ModCat.Bimod.tor n : Bimod D C ⥤ Bimod C E ⥤ Bimod D E`): for
  `_D M_C` and `_C N_E` (with no smallness needed on `D` or `E`), `(Tor^C_n(M, N))(d, e) :=
  Tor^C_n(M(d, -), N(-, e))` is biadditive on `Dᵒᵖ × E` by bifunctoriality of `ModCat.tor`,
  recovering `linearTor` at `D = SingleObj Rᵐᵒᵖ`, `E = SingleObj ℤ`. On one-sided modules (`E =
  SingleObj ℤ`), it agrees canonically with `(Bimod.tensorLeft M).leftDerived n` because slice
  evaluation `Mod D → AddCommGrpCat` is exact; comparing with `(Bimod.tensor.obj M).leftDerived n`
  on `Bimod C E` additionally requires `HasProjectiveResolutions (Bimod C E)` together with
  evaluation `N ↦ N(-, e)` sending `Bimod C E`-projectives to `C`-flat modules (for example when
  `EssentiallySmall.{w} E` and every `Hom_E(e, e')` is `ℤ`-flat, failing at `D = C = SingleObj ℤ`,
  `E = SingleObj 𝔽_p`, `M = N = 𝔽_p`).
- **Rings** (`TauCeti.BalancedTor R A n : ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R`,
  `TauCeti.BalancedTor.leftModule`, `TauCeti.BalancedTor.rightModule`,
  `TauCeti.BalancedTor.outerSMulCommClass`): under `[Small.{v} A]`, derives
  `(BalancedTensorProduct.functor R A).obj M` in the left-module variable, with `Tor_0` matching
  `BalancedTensorProduct.functor`, scalar action via `r • 𝟙 N`, projective vanishing in degree
  `n + 1`, the one-object comparison `TauCeti.nonempty_balancedTorIsoTorSingleObj` (upgrading to
  `R`-linearity directly from 0.7's comparison with `intAddEquiv`), and symmetric outer
  `(S, T)`-bimodule actions on `Tor_n^B(M, N)` (commuting by bifunctor naturality, matching
  `TauCeti.BalancedTensorProduct.leftModule` and `rightModule`).

*Needs:* 0.1–0.4, 0.7; Tau Ceti `NatTrans.leftDerived_add`, `BalancedTensorProduct.leftModule`.

### 1.2 Long exact sequences in the underived variable

For a short exact sequence `0 → G₁ → G₂ → G₃ → 0` in `Mod Cᵒᵖ` and a projective resolution `Q` of
`F`, `0 → G₁ ⊗_C Q → G₂ ⊗_C Q → G₃ ⊗_C Q → 0` is short exact in each degree (0.4, 0.5), giving
connecting maps `Tor_{n+1}(G₃, F) → Tor_n(G₁, F)` and long exact sequences for both `ModCat.tor` and
`BalancedTor`.

*Needs:* 0.4, 0.5, 1.1.

### 1.3 Balance

Resolving both `G` and `F` by projectives `P`, `Q` and applying
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows` to `P_p ⊗_C Q_q` and its transpose
([Weibel, Thm. 2.7.2, pp. 58–59, with the Acyclic Assembly Lemma 2.7.3, p. 59]) together with the
swap of 0.6 yields `Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)` (`TauCeti.ModCat.nonempty_torBalanceIso`),
giving left projective vanishing and the long exact sequence in `F`. Combining with 0.2 and 1.1
gives the ring swap `Tor_n^A(M, N) ≅ Tor_n^{Aᵐᵒᵖ}(N, M)` (`TauCeti.nonempty_balancedTorSwapIso`),
left projective vanishing, and the long exact sequence in the left-module variable.

*Needs:* 0.4–0.6, 1.1, 1.2; Tau Ceti `quasiIso_totalAugmentation_of_rows`,
`totalComplexShapeSymmetryDownNat`.

### 1.4 Stable category of `mod C` and `Tor` of the transpose

- **Stable category `underline{mod C}` and transpose duality** (`TauCeti.ModCat.mod`,
  `TauCeti.ModCat.projInMod`, `TauCeti.ModCat.StableFP`, `TauCeti.ModCat.StableFP.ofPresentation`,
  `TauCeti.ModCat.stableFPToProjectiveStable`, `TauCeti.ModCat.exists_stableTransposeEquivalence`,
  `TauCeti.ModCat.transpose`; [AB, §2.1, pp. 48–52]): with no smallness or coherence hypothesis on
  `C`, `ModCat.StableFP C` (`underline{mod C}`) is the quotient of `mod C` by `(ModCat.projInMod
  C).factorIdeal` (morphisms factoring through `proj C`), which embeds fully and faithfully into the
  projective-stable category of the abelian category `Mod C`, written `underline{Mod C}`, because
  for any factorization `X ⟶ P ⟶ Y` in `Mod C` with `X, Y ∈ mod C` and `P` projective, choosing an
  epimorphism `Q ↠ Y` from a finite sum of representables `Q ∈ proj C` lifts `P ⟶ Y` to `P ⟶ Q`,
  factoring `X ⟶ Y` through `Q ∈ proj C`. Dualizing presentations `P₁ ⟶ P₀ ⟶ X ⟶ 0` in `proj C` via
  0.9's smallness-free dual `(-)^∨ = projDual C` (`Tr f = coker(P₀^∨ → P₁^∨)`, `ModCat.transpose f`)
  induces an anti-equivalence `(underline{mod C})ᵒᵖ ≌ underline{mod Cᵒᵖ}`, stated as one equivalence
  whose value on every `StableFP.ofPresentation f` is `[Tr f]`, generalizing
  `TauCeti.stableTransposeEquivalence` from rings to arbitrary preadditive categories.
- **Auslander–Bridger `Tor_1` formula** (`TauCeti.ModCat.exists_stableHomEquivTorTranspose`,
  [Auslander78, I, Prop. 3.2]; [AB, (2.8) (b),
  p. 54]): for `X = coker(f : P₁ → P₀)` in `mod C` and every `N : Mod C`, there is a natural
  isomorphism

      stable Hom(X, N) ≅ Tor_1(Tr X, N)

  stated across the `max u v` and `v` morphism universes as one family `η_{f, N}` (`≃+`) natural in
  `N ∈ Mod C`. In the first variable, `Tor_1(-, N)` vanishes on `proj Cᵒᵖ`
  (1.3), so any stable morphism `u : X' ⟶ X` in `underline{mod C}` induces a well-defined map
  `Tor_1(Tr u, N)` independent of the representative of `Tr u` (transported along
  the identification of `[Tr f]` above), and for `φ : X ⟶ N` in `underline{Mod C}` the contravariant
  naturality square `η_{f', N}(u ≫ φ) = Tor_1(Tr u, N)(η_{f, N}(φ))` commutes by lifting a
  representative of `u` to a morphism of presentations `(P₁' → P₀') → (P₁ → P₀)` in `proj C` and
  applying functoriality of the snake-lemma comparison below. Following [Krause-Defect,
  pp. 268–269], choose `0 → ΩN → P → N → 0` with `P` projective and set `H(M) = coker(Hom(P₀, M) →
  Hom(P₁, M))`. The snake lemma identifies `stable Hom(X, N) = coker(Hom(X, P) → Hom(X, N))` with
  `ker(H(ΩN) → H(P))`; by 0.9, `H(M) ≅ Tr X ⊗_C M` naturally, and 1.3 identifies `ker(Tr X ⊗_C ΩN →
  Tr X ⊗_C P)` with `Tor_1(Tr X, N)`.
- **Projectivity test** (`TauCeti.ModCat.projective_of_isZero_tor_transpose`): if `X` is finitely
  presented and `Tor_1(Tr X, X) = 0`, then `stable End(X) = 0`, so `𝟙 X` factors through a
  projective and `X` is projective ([CB, §1.3, p. 1646]).
- **Rings** (`TauCeti.nonempty_stableHomEquivBalancedTorTranspose`): `stable Hom_A(X, N) ≃ₗ[R]
  Tor_1^A(Tr X, N)` for `TauCeti.AuslanderReitenTranspose f`.

*Needs:* 0.9, 1.1–1.3; Tau Ceti `AuslanderReitenTranspose`, `stableTransposeEquivalence`,
`auslanderReitenTransposeTensorEquivCokernel`, `projectiveStableFunctor`, `factorIdeal`,
`tensorHomCokernelEquivProjectiveStableHom`.

### 1.5 `Tor`–`Ext` duality

For an `R`-linear `C` and an injective `R`-module `E`, resolving `G` via balance (1.3) and applying
0.4's `R`-linear adjunction termwise together with
`ProjectiveResolution.extLinearEquivCohomologyClass` (`extMk_comp_mk₀`, `mk₀_comp_extMk`) yields a
natural isomorphism of bifunctors `TauCeti.ModCat.nonempty_torExtDualityNatIso` ([CE, VI, Prop. 5.1,
p. 120]; [Lambek, p. 241]), giving `Hom_R(Tor_n^C(G, F), E) ≃ₗ[R] Ext^n(G, F^E)` and the ring
counterpart `Hom_R(Tor_n^A(M, N), E) ≃ₗ[R] Ext^n_{Aᵐᵒᵖ}(M, (BalancedTensorProduct.homRight R A
N).obj E)` (`TauCeti.nonempty_balancedTorExtDualityEquiv`).

*Needs:* 0.7, 0.8, 1.1, 1.3.

### 1.6 Comparisons and first computations

- **Commutative rings** (`TauCeti.nonempty_balancedTorIsoTor`, `TauCeti.nonempty_torIsoTor'`): 0.7's
  commutative comparison identifies `BalancedTor R R n` with Mathlib's `CategoryTheory.Tor
  (ModuleCat R) n`, and balance (1.3) then supplies `Tor (ModuleCat R) n ≅ Tor' (ModuleCat R) n`,
  the `ModuleCat R` case of
  [SpectralSequencesAndConvergencePartII](../SpectralSequencesAndConvergencePartII/README.md) §4.1
  (`nonempty_tor_iso_tor'`, for monoidal abelian categories in which tensoring with a projective is
  exact), whose general statement this roadmap does not restate.
- **Change of base for rings** (`TauCeti.nonempty_balancedTorRestrictScalarsIso`,
  `TauCeti.nonempty_balancedTorIntIso`): along `R → R' → A` (in independent universes), scalar
  restriction identifies `BalancedTor R' A n` with `BalancedTor R A n` (specializing at `ℤ → R` to
  `balancedTorIntIso`), proved on a projective resolution via `changeBaseLinearEquiv` (0.7) and
  exactness of `ModuleCat.restrictScalars`.
- **Cyclic modules** (`TauCeti.nonempty_balancedTorOneQuotientEquiv`): for `I : Submodule Aᵐᵒᵖ A`
  and `K : Ideal A`, `Tor_1^A(A ⧸ I, A ⧸ K) ≃+ (I ∩ K) ⧸ IK` ([Weibel, Exer. 3.1.3, p. 68]), via 1.2
  on `0 → I → A → A ⧸ I → 0` and `leftDerivedOneIsoKernel`.

*Needs:* 0.4, 0.7, 1.1–1.3; Tau Ceti `leftDerivedOneIsoKernel`.

### 1.7 Categories with finitely many objects

For any preadditive `C`, `TauCeti.CategoryAlgebra C` has underlying `DFinsupp` group
`⊕_{x,y} Hom(x, y)` and product `(a * b)(x, z) = ∑_y a (x, y) ≫ b (y, z)` (`NonUnitalRing`,
[Mitchell, §7, p. 33]; [Harada, Remark 1, pp. 339–340]). When `[Finite C]`, `1 = ∑_x 𝟙 x` upgrades
it to a `Ring` (extending `NonUnitalRing`) and—for `[Linear R C]`—an `R`-algebra (extending
`DFinsupp`'s `R`-module structure, agreeing definitionally with `Ring.toIntAlgebra` at `R = ℤ`),
with `Small.{w} (CategoryAlgebra C)` when `[LocallySmall.{w} C]`. Diagrammatic multiplication gives
`TauCeti.categoryAlgebraSingleObjRingEquiv : CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≃+* A`, sending `a`
to `unop (a (∗, ∗))` (`TauCeti.categoryAlgebraSingleObjRingEquiv_apply`).

- **Morita equivalence and `Tor` comparison** (`TauCeti.exists_torCategoryAlgebraIso`): for
  `[Finite C]`, `F ↦ ⊕_x F(x)` gives equivalences `ModCat C ≌ ModuleCat (CategoryAlgebra C)` and
  `ModCat Cᵒᵖ ≌ ModuleCat (CategoryAlgebra C)ᵐᵒᵖ`, chosen once, `R`-linear and
  intertwining `⊗_C` and `Tor^C_n` with the balanced tensor product and `BalancedTor` over
  `CategoryAlgebra C` ([Mitchell, Thm. 7.1 and p. 37]); full subcategories correspond to corners
  `e Λ e` (`IsIdempotentElem.isMoritaEquivalent_corner`).

**Checks.**
- For the `k`-linear quiver `1 → 2`, `CategoryAlgebra C ≅ T₂(k)` (under
  `TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`, the path algebra of the opposite quiver `2 →
  1`). Over `T = T₂(k)` with radical `J = k e₁₂`, `Tor_1^T(T ⧸ J, T ⧸ J) ≅ J ⧸ J² = J` and higher
  `Tor` vanishes since `J ≅ e₂₂T` is projective.
- `Tor_0(G, Hom(-, X)) ≅ G(X)` and `Tor_{n+1}(G, Hom(-, X)) = 0` (and symmetrically in `Hom(X, -)`).
- For nonzero `m, n`, `Tor_1^ℤ(ℤ ⧸ m, ℤ ⧸ n) ≅ ℤ ⧸ gcd(m, n)` (vanishing when `m = 0` or `n = 0`).
- Over `B = k[ε]/(ε²)`, `Tor_n^B(k, k) ≅ k` for all `n ≥ 0`.

*Needs:* 0.1, 0.2, 0.4, 0.7, 1.1–1.6; Tau Ceti `quiverRepEquivalence` (pattern),
`upperTriangularAlgEquiv`, `isMoritaEquivalent_corner`.

## Layer 2: flat modules and flat functors

Throughout, `C : Type u` is preadditive with `Category.{v} C`. Flatness itself assumes no smallness;
results using `⊗_C` or `Tor` assume `EssentiallySmall.{v} C` and modules in `ModCat.{v} C`.

### 2.1 Definition

A relation `∑_j F(β_j)(y_j) = 0` in `F(X)` (`β_j : X → Y_j`, `y_j ∈ F(Y_j)`) is **trivial**
(`TauCeti.ModCat.IsTrivialRelation`) if there exist `z_i ∈ F(Z_i)` and `α_ij : Y_j → Z_i` with
`y_j = ∑_i F(α_ij)(z_i)` for each `j` and `∑_j β_j ≫ α_ij = 0` for each `i`. A module `F : Mod C`
is **flat** (`TauCeti.ModCat.Flat F`) if every relation in `F` is trivial ([OR, Thm. 3.2 (4),
pp. 96–97]; [Chase 1960, Prop. 2.3, p. 459]; [Lam-LMR, (4.24), p. 130]).

Because this equational criterion quantifies only over objects, morphisms, and elements of `F`, it
needs no smallness on `C` and works in every value universe—essential for large categories in 2.4,
Bass's module in 2.5, and arbitrary-universe ring bridges. Every representable `Hom(-, X)` is flat
(`TauCeti.ModCat.flat_yoneda_obj`, witnessed by `𝟙 X`). For the ideal test, finitely generated right
ideals at `X` are the images `TauCeti.ModCat.coyonedaSpan β ⊆ Hom(X, -)` of finite families
`β_j : X → Y_j` (`TauCeti.ModCat.yonedaSpan` on `Cᵒᵖ`).

**Rings** (`TauCeti.Module.BalancedFlat A M`): `I ⊗_A M → A ⊗_A M` (over `ℤ`) is injective for every
finitely generated right ideal `I`, equivalent in every module universe to `ModCat.Flat` on
`SingleObj Aᵐᵒᵖ` (`TauCeti.Module.balancedFlat_iff_flat_singleObj`, via 0.2 and right exactness of
`- ⊗_A M` on finite free presentations `ker(Aⁿ → I) → Aⁿ → I → 0`) and, over commutative rings, to
`Module.Flat` (`TauCeti.Module.balancedFlat_iff_flat`).

*Needs:* 0.1–0.3, 0.6, 0.7.

### 2.2 Tests

Under `EssentiallySmall.{v} C`, the following conditions on `F : ModCat.{v} C` are equivalent
(`TauCeti.ModCat.flat_tfae`):

1. `F` is flat (2.1);
2. **ideal test:** `I ⊗_C F → Hom(X, -) ⊗_C F ≅ F(X)` is monic for every finitely generated
   `I = coyonedaSpan β ⊆ Hom(X, -)` ([Lam-LMR, (4.12), p. 125]);
3. `I ⊗_C F → Hom(X, -) ⊗_C F` is monic for every right ideal `I ⊆ Hom(X, -)`;
4. `- ⊗_C F` preserves monomorphisms ([OR, Thm. 3.2 (1), p. 96], with covariant counterpart for
   `G ⊗_C -`);
5. `Tor_1(-, F) = 0`, whence `Tor_n(-, F) = 0` for all `n ≥ 1`;
6. `Tor_1(Hom(X, -) ⧸ I, F) = 0` for every finitely generated `I ⊆ Hom(X, -)` ([OR, Thm. 3.2 (3)]);
7. **Lambek's criterion:** `F^E` (0.8) is injective in `Mod Cᵒᵖ` for every injective cogenerator `E`
   of `ℤ`-modules—and, for `[Linear R C]` and any fixed injective cogenerator `E` of `R`-modules,
   `F` is flat iff `F^E` is injective (`TauCeti.ModCat.flat_iff_injective_dual`; [Lambek, Theorem,
   p. 239]; [St, Thm. 3 (d), p. 357]).

**Proof route.** For fixed `β_j : X → Y_j`, let `b : ⊕_j Hom(Y_j, -) → Hom(X, -)` have kernel `K`
and image `I = coyonedaSpan β`. Right exactness and Yoneda give `K ⊗_C F → ⊕_j F(Y_j) → I ⊗_C F → 0`
whose image from `K ⊗_C F` is the subgroup of trivial relations, giving (2) ⇒ (1); (1) ⇒ (3)
balances elements of `I ⊗_C F` against witnesses from (1) ([OR, p. 98]), and (3) ⇒ (2) is immediate.
For (3) ⇒ (7) ⇒ (4) ⇔ (5) ⇒ (6) ⇒ (2), 0.8 and **Baer's criterion for `Mod C`**
(`TauCeti.ModCat.Baer`, `TauCeti.ModCat.baer_iff_injective`: injectivity tested on subfunctors of
individual representables via Zorn's lemma) give (3) ⇒ (7) ⇒ (4), while 1.2 and 1.3 give
(4) ⇔ (5) ⇒ (6) ⇒ (2).

- **Finitely presented flat modules are projective**
  (`TauCeti.ModCat.Flat.projective_of_isFinitelyPresentedFunctor`): `Tor_1(Tr F, F) = 0` by (5), so
  1.4 applies ([CB, §1.3, p. 1646]).
- **`Tor` and filtered colimits** (`TauCeti.ModCat.preservesFilteredColimits_tor_obj`; [OR,
  Lemma 3.1, p. 96]): resolve `G` via 1.3 and apply 0.4 and `AB5`.
- **Rings** (`TauCeti.Module.balancedFlat_tfae`): matching ring equivalences and corollaries
  (vanishing of higher `BalancedTor`, commutation with filtered colimits, and projectivity of
  finitely presented flat modules) under `[Small.{v} A]` ([Lambek, p. 239]; [Lam-LMR, (4.9),
  p. 125]).

*Needs:* 0.3–0.5, 0.8, 0.9, 1.1–1.4.

### 2.3 The Lazard block

Over general preadditive `C`, Lazard's theorem must use finite coproducts of representables
(`TauCeti.ModCat.isFiniteFree`) rather than single representables (`ℤ²` over `ℤ`). First, with no
smallness hypothesis, **finitely many relations can be trivialized simultaneously**: given finite
sums of representables `U, V` and `d : U → V`, `f : V → F` with `F` flat and `f ∘ d = 0`, `f`
factors through `a : V → W` (`W` a finite sum of representables) with `a ∘ d = 0`, proved by
induction over the summands of `U` ([Lazard, Lemme 1.1, p. 84]; [Stacks, Tag 058D]).

Under `EssentiallySmall.{v} C`, `TauCeti.ModCat.flat_lazard_tfae` (using
`TauCeti.ModCat.FiniteFreeOver F`, `TauCeti.ModCat.essentiallySmall_finiteFreeOver`,
`TauCeti.ModCat.IsPureEpi`, and `TauCeti.ModCat.isPureEpi_iff_isCardinalPure`) proves that the
following conditions on `F : ModCat.{v} C` are equivalent ([OR, Thm. 3.2 (5)–(6), p. 97];
[Lazard, Thm. 1.2, Cor. 1.3, pp. 84–85]; [Govorov]; [St, Thm. 3, p. 357]; [CB, §1.3, p. 1646]):

1. `F` is flat (`F.Flat`);
2. **finite-free factorization:** every morphism to `F` from a finitely presented module factors
   through a finite sum of representables (simultaneous relation trivialization forward; conversely,
   a relation `∑ F(β_j)(y_j) = 0` defines a map out of `coker(Hom(-, X) → ⊕ Hom(-, Y_j))` whose
   factorization yields triviality witnesses);
3. **filtered category of elements:** `FiniteFreeOver F` is filtered (and essentially `v`-small);
4. **Lazard–Govorov colimit:** `F` is a `v`-small filtered colimit of finite sums of representables
   (single representables when `C` has finite biproducts);
5. **purity:** every epimorphism onto `F` in `ModCat.{v} C` is pure (`IsPureEpi`, lifting maps from
   finitely presented modules—so pure-projective flat modules are projective; in any short exact
   `0 → K → L → M → 0`, `L → M` is pure epic iff `K → L` satisfies Mathlib's `IsCardinalPure` at
   `ℵ₀`).

**Rings and set-valued bridges** (`TauCeti.Module.balancedFlat_lazard_tfae`,
`TauCeti.Module.BalancedFlat.isDenseAt`, reproving `TauCeti.flatModuleFilteredFree` without shims
via filtered `TauCeti.FiniteFreeOver A M` and finite-free factorization;
`TauCeti.ModCat.flat_iff_isIndObject`). For a ring `A`, `balancedFlat_lazard_tfae` gives the
matching five-way equivalence on `M` (flatness, factorization of maps from finitely presented
modules through `Fin n →₀ A`, filtered `FiniteFreeOver A M`, filtered colimit of finite free
modules, and `ℵ₀`-purity of epimorphisms onto `M`). For essentially small additive `C`, `Flat F`
agrees with `IsIndObject` on `F ⋙ forget` ([Krause-Smashing, §2.3, p. 115]; whereas Mathlib's
covariant `RepresentablyFlat` corresponds to `Mod Cᵒᵖ`).

*Needs:* 0.9, 2.1, 2.2; Tau Ceti `FiniteFreeOver`, `FiniteFreeModuleCat` (pattern),
`finiteFreeModuleInclusion`, `flatModuleFilteredFree`.

### 2.4 Left exact functors, triangulated categories and the representation theorem

Outside the final accessibility item on `Flat(C)` (which uses 2.3 under `EssentiallySmall.{v} C`),
2.4 assumes no smallness on `C` and allows modules in any universe.

- **Weak cokernels and left exactness** (`TauCeti.IsWeakCokernel`,
  `TauCeti.ModCat.flat_iff_exact_of_isWeakCokernel`,
  `TauCeti.ModCat.flat_iff_preservesFiniteLimits`). Defining weak cokernels via `IsWeakLimit` on
  `Cᵒᵖ`, over an additive category `C` with weak cokernels `F : Mod C` is flat iff `F(Z) → F(Y) →
  F(X)` is exact for every weak cokernel `Y → Z` of `X → Y` ([CB, §§1.2–1.3, pp. 1644–1646]). When
  `C` has cokernels, `F` is flat iff `F : Cᵒᵖ ⥤ Ab` preserves finite limits ([Fisher, Cor. 2.9,
  p. 285]; [OR, Cor. 3.4, p. 99]; [Simson, Thm. 2.1 (b), p. 95], stated for `Cᵒᵖ`-modules, meaning
  contravariant functors on `C`, as here), since cokernels and weak cokernels factor through one
  another and `Z → 0 = coker q` gives injectivity of `F(q)` for `q = coker f`.
- **Triangulated categories** (`TauCeti.ModCat.flat_iff_isHomological`). Over a pretriangulated `C`
  (requiring neither smallness nor the octahedral axiom), `F : Mod C` is flat iff it is
  cohomological (`Functor.IsHomological` on `Cᵒᵖ`; [Krause-Smashing, Lemma 2.7, p. 115];
  [Beligiannis, Prop. 8.11, p. 180]), as distinguished triangles supply weak cokernels.
- **Crawley-Boevey's representation theorem and converse** (`TauCeti.FinitelyPresented`,
  `TauCeti.nonempty_restrictedYonedaEquivFlat`,
  `TauCeti.isFinitelyAccessibleCategory_iff_nonempty_equiv_flat`, `TauCeti.ModCat.flat`,
  `TauCeti.ModCat.isFinitelyPresentable_flat_iff`, plus `IsFinitelyAccessibleCategory` on
  `(ModCat.flat C).FullSubcategory`). Every finitely accessible additive category `𝒜`
  (`IsFinitelyAccessibleCategory`, without assuming cocompleteness; [CPT, pp. 1214, 1218]) is
  equivalent via restricted Yoneda to the flat modules in `Mod fp(𝒜)` ([CB, §1.4, p. 1647]);
  conversely, for essentially small additive `C`, `Flat(C)` is finitely accessible, giving the
  two-way characterization `isFinitelyAccessibleCategory_iff_nonempty_equiv_flat`. Here
  `isFinitelyPresentable_flat_iff` characterizes *intrinsic* finite presentability inside `Flat(C)`
  (preserving filtered colimits of flat modules, rather than of all modules in `Mod C` as in 2.2's
  `projective_of_isFinitelyPresentedFunctor`): writing `F ∈ fp(Flat(C))` as a filtered colimit of
  finite sums of representables inside `Flat(C)` by Lazard's theorem (2.3) factors `𝟙 F` through
  one term, so `fp(Flat(C)) = proj C` (retracts of single representables when `C` has finite
  biproducts). (Flat covers remain out-of-scope pointers:
  [BEE], [CPT, Cor. 3.3], [Rump], [Krause-FlatCovers].)

*Needs:* 2.1, 2.3.

### 2.5 Bass's flat module

For `f_i : c_i → c_{i+1}` in `C` with `q_n = f_0 ≫ ⋯ ≫ f_{n-1} : c_0 → c_n`, Bass's module is
`B = colim(Hom(-, c_0) → Hom(-, c_1) → ⋯)` (`TauCeti.ModCat.bassDiagram`,
`TauCeti.ModCat.bassModule`; [Bass, Lemmas 1.1–1.3, pp. 468–470]; [Harada, Remark 1, pp. 339–340]).

- **Telescope, flatness, and vanishing** (`TauCeti.ModCat.isZero_bassModule_iff`): `B` has short
  exact presentation `0 → ⊕_i Hom(-, c_i) → ⊕_i Hom(-, c_i) → B → 0` via `ι_i - Hom(-, f_i) ≫
  ι_{i+1}` (hence `ℵ₁`-presentable under `EssentiallySmall.{v} C`, 0.9), is flat without smallness
  (from 2.1 and 2.6), and satisfies `B = 0` iff for every `i` some composite `c_i → c_j` (`j ≥ i`)
  vanishes (4.1).
- **Factorizability** (`TauCeti.IsFactorizable`,
  `TauCeti.ModCat.isFactorizable_of_projective_bassModule`): if `B` is projective,
  `Functor.ofSequence f` is factorizable—for each `i` there exists `j ≥ i` such that for all
  `k ≥ j`, `(c_i → c_j) = (c_i → c_k) ≫ t` ([Simson, Def. 3.1, p. 99]), proved by finite support of
  a telescope splitting at `c_0` and passing to tails.
- **Rings:** `(ℕ →₀ A) ⧸ ⟨eᵢ - aᵢ • eᵢ₊₁⟩` is flat, and when it is projective the chain
  `a₀A ⊇ a₀a₁A ⊇ ⋯` stabilizes ([Lam-FC, (24.24), pp. 367–368]).

*Needs:* 0.1 (definition and vanishing criterion), 0.2, 0.9 (`ℵ₁`-presentability), 2.1, 2.6
(filtered colimits, for flatness).

### 2.6 Closure properties

`ModCat.Flat` contains projectives (0.5), is closed under retracts, `w`-small coproducts, and
filtered colimits (`TauCeti.ModCat.Flat.of_isColimit`, without smallness), satisfies `F_2` flat `↔
F_1` flat when `F_3` is flat in `0 → F_1 → F_2 → F_3 → 0` (`TauCeti.ModCat.flat_iff_of_shortExact`,
[Mitchell, Cor. 10.4b, p. 49]), and for flat `P` in `0 → K → P → F → 0` characterizes flatness of
`F` by monicity of `N ⊗_C K → N ⊗_C P` for all `N` ([Lam-FC, (24.23), p. 367]). Matching ring lemmas
for `Module.BalancedFlat` (projectives, linear equivalences, direct sums, short exact sequences, and
`K ⊓ I • F = I • K` for two-sided `I`, [Lam-LMR, (4.13)–(4.14), p. 126]) also hold. (Product
closure—equivalent over additive `C` to weak cokernels, [CB, Thm. 2.1], [OR, Thm. 4.1 (5)], though
holding over the non-additive one-object category of `k[x, y] ⧸ (x, y)²`—is out of scope.)

**Checks.** Over `ℤ`, `ℚ` is flat and non-projective, `ℤ[1/p]` is Bass's module for `p`, and
`ℤ ⧸ n` (`n ≥ 2`) is not flat; `k` is not flat over `k[ε]/(ε²)`; `T₂(k) ⧸ J` has one projective and
one non-flat simple summand; and over `0 → 1 → 2 → ⋯` Bass's module for `i → i + 1` is flat and
non-projective.

*Needs:* 0.5, 2.1–2.3.

## Layer 3: flat dimension, global and weak global dimension

Throughout, `C : Type u` is preadditive with `Category.{v} C` and `EssentiallySmall.{v} C`, and
modules live in `ModCat.{v} C`.

### 3.1 Flat dimension

`F : ModCat.{v} C` has **flat dimension `< n`** (`TauCeti.ModCat.HasFlatDimensionLT F n`) if
`Tor_i(Hom(X, -) ⧸ I, F) = 0` for all `i ≥ n`, `X : C`, and finitely generated
`I = coyonedaSpan β ⊆ Hom(X, -)`. Setting `TauCeti.ModCat.HasFlatDimensionLE F n` to
`HasFlatDimensionLT F (n + 1)`, `TauCeti.ModCat.flatDimension F : WithBot ℕ∞` is the infimum of `d`
such that `HasFlatDimensionLT F i` holds for all `i > d` (equal to `⊥` iff `IsZero F`, and `≤ 0`
iff `F.Flat`).

**Resolutions and syzygies** (`TauCeti.ModCat.hasFlatDimensionLE_tfae`). For `n : ℕ`, the following
are equivalent: (1) `HasFlatDimensionLE F n`; (2) `Tor_i(G, F) = 0` for all `G : ModCat.{v} Cᵒᵖ` and
`i > n`; (3) `Tor_{n+1}(G, F) = 0` for all `G`; (4) `F` has a flat resolution of length `≤ n`;
(5) the `n`-th syzygy `P.complex.opcycles n` of every projective resolution `P` of `F` is flat;
(6) the `n`-th syzygy of some projective resolution is flat—proved by dimension shifting (1.2, 1.3)
and computing `Tor` from flat resolutions (resolving `G` via 1.3). Companion API includes
`flatDimension F ≤ projectiveDimension F`, dimension shifting along flat short exact sequences, and
duality `TauCeti.ModCat.flatDimension_eq_injectiveDimension_dual` (`flatDimension F =
injectiveDimension (F^E)` for any injective cogenerator `E`, via 0.8 and 1.5).

**Rings** (`TauCeti.HasFlatDimensionLT`, `TauCeti.HasFlatDimensionLE`, `TauCeti.flatDimension`):
defined natively on `ModuleCat.{v} A` under `[Small.{v} A]` via `Tor_i^A(A ⧸ I, M) = 0`, with
matching `Tor`/syzygy equivalences, comparison with `SingleObj Aᵐᵒᵖ`, and the character-module
formula `TauCeti.flatDimension_eq_injectiveDimension_characterModule` ([Lam-LMR, (5.57), p. 184]).

*Needs:* 1.1–1.3, 1.5, 2.1, 2.2, 2.6.

### 3.2 Global dimension of an abelian category

For any abelian category `𝒜`, `TauCeti.Abelian.globalDimension 𝒜 := ⨆ X : 𝒜, projectiveDimension X`
([Mitchell, §9, p. 42]), with basic upper bounds, characterization of `= ⊥`, equality with
`⨆ X, injectiveDimension X`, opposite symmetry `gldim 𝒜ᵒᵖ = gldim 𝒜`, and equivalence invariance.

- **Auslander's lemma** (`TauCeti.ModCat.globalDimension_le_iff_cyclic`): `globalDimension (ModCat
  C) ≤ n` iff every cyclic module `Hom(-, X) ⧸ I` has projective dimension `≤ n` ([Au, Thm. 1,
  p. 68]), proved by taking an injective coresolution up to the `n`-th cosyzygy `E'` (0.1) and
  testing `E'` by Baer's criterion (2.2) and dimension shifting.
- **Universe independence** (`TauCeti.ModCat.globalDimension_eq_globalDimension`): if `C` is
  essentially small in two universes, Auslander's lemma reduces both global dimensions to cyclic
  modules over a common small model (whose projective dimensions and `IsZero` status for the `⊥`
  case are preserved by `ULift` on values); in particular, the global dimension of a ring `A`
  agrees across any two module universes `w` and `t` with `[Small.{w} A] [Small.{t} A]`.
- **Rings (refactor):** `TauCeti.globalDimension A` becomes `Abelian.globalDimension (ModuleCat.{v}
  A)` without shims, reproving `TauCeti.globalDimension_le_tfae` from Auslander's lemma and
  identifying `globalDimension A` with `Abelian.globalDimension (ModCat (SingleObj Aᵐᵒᵖ))`.

*Needs:* 0.1, 0.2, 2.2; Tau Ceti `globalDimension`.

### 3.3 Weak global dimension and von Neumann regularity

For essentially small `C`, `TauCeti.ModCat.weakGlobalDimension C := ⨆ F : ModCat C, flatDimension F`
([OR, p. 103]), characterized by `Tor_{n+1} = 0`, symmetric under `Cᵒᵖ` via 0.6 and 1.3
(`TauCeti.ModCat.weakGlobalDimension_op`; [Au, p. 70]; [Lam-LMR, (5.63), p. 185]), testable on
finitely presented or cyclic covariant functors (`TauCeti.ModCat.weakGlobalDimension_le_tfae`;
[Lam-LMR, (5.69), p. 187]), bounded above by the global dimensions of `Mod C` and `Mod Cᵒᵖ` (and by
any uniform projective-dimension bound on finitely presented covariant functors), and equal to `⊥`
iff every object of `C` is zero. Native ring counterparts (`TauCeti.weakGlobalDimension`,
`TauCeti.weakGlobalDimension_mulOpposite`, plus `Tor_{n+1}`/finitely-presented/cyclic tests, bounds
by left and right global dimension, vanishing on semisimple rings, and agreement with
`SingleObj Aᵐᵒᵖ`) follow.

- **Von Neumann regular categories and rings** (`TauCeti.isVonNeumannRegularCategory_tfae`,
  `TauCeti.isVonNeumannRegularRing_tfae`; [St, Thm. 4, p. 359]; [Lam-FC, (4.23)–(4.24), pp. 65–66];
  [Lam-LMR, (4.21)–(4.22), pp. 128–129]). For `IsVonNeumannRegularCategory C` and
  `IsVonNeumannRegularRing A` (0.3), the following are equivalent: (1) `C` (resp. `A`) is von
  Neumann regular; (2) `weakGlobalDimension ≤ 0`; (3) every module in `Mod C` (resp. left or right
  `A`-module) is flat; (4) every finitely presented module is projective (0.9, 2.2, 2.6); and (5)
  every principal—and hence every finitely generated—submodule of `Hom(-, Y)` (for rings: principal
  or finitely generated left or right ideal, generated by an idempotent `e = b * a`) is a direct
  summand.

*Needs:* 0.9, 1.3, 2.2, 2.6, 3.1, 3.2.

### 3.4 Auslander's theorem

- **The `FP_∞` lemma**
  (`TauCeti.ModCat.flatDimension_eq_projectiveDimension_of_projectiveResolution`): with no
  Noetherian hypothesis, any module admitting a resolution in `proj C` (0.9) has equal flat and
  projective dimensions, as its `n`-th syzygy at `n = flatDimension` is both flat (3.1) and
  finitely presented, hence projective (2.2; [CE, VI, pp. 120–122]). The ring counterpart likewise
  assumes a resolution by finitely generated projectives with no Noetherian hypothesis (applying in
  particular to every finitely generated module over a left Noetherian ring).
- **Auslander's theorem** (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension`): if every
  `Hom(-, X)` is a Noetherian object (`IsNoetherianObject`), every cyclic module `Hom(-, X) ⧸ I` has
  a resolution in `proj C`, so Auslander's lemma (3.2), the `FP_∞` lemma, and 3.3 give
  `Abelian.globalDimension (ModCat C) = weakGlobalDimension C` ([Au, Thm. 4, p. 70]; [Lam-LMR,
  (5.59), p. 184]; cf. [OR, Thm. 4.3, p. 103] for coherent functors). Corollaries give the one-sided
  bound `TauCeti.ModCat.globalDimension_le_of_forall_isFinitelyPresentedFunctor` (with ring form
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` for ArtinAlgebras §7.5),
  two-sided Noetherian symmetry ([Au, Cor. 5, p. 70]), and ring equality
  `TauCeti.globalDimension_eq_weakGlobalDimension` (replacing Tau Ceti's character-module proofs of
  ArtinAlgebras §7.2's left-right comparisons while keeping their statements).

*Needs:* 2.2, 2.3, 3.1–3.3.

### 3.5 Kernels of flat modules and countably presented flat modules

- **Closure under kernels** (`TauCeti.ModCat.forall_flat_kernel_iff`): flat modules in `Mod C` are
  closed under kernels iff `weakGlobalDimension C ≤ 2` ([CB, Thm. 2.3, p. 1651]), by dimension
  shifting.
- **Countably presented flat modules** (`TauCeti.ModCat.Flat.hasProjectiveDimensionLE_one`):
  sequential colimits of projectives have projective dimension `≤ 1` via the telescope (2.5), and
  every `ℵ₁`-presentable flat module `F` is a retract of such a sequential colimit, hence has
  projective dimension `≤ 1` ([Jensen, Lemma 2, pp. 98–100]; [Osofsky-Nagoya, Lemma 1.2, p. 316]):
  writing `F = colim D_k` over finite sums of representables (2.3) and choosing a countable
  presentation (0.9), recursively lift generators and trivialize relations along `k_0 → k_1 → ⋯` to
  construct a section `F → colim_n D_{k_n}` of the canonical map to `F`. (Higher cardinal bounds for
  `ℵ_n`-presented flat modules—[Simson, Thm. 2.12 (c)], [Osofsky-Nagoya, Thm. 1.3], [Mitchell,
  Thm. 36.8]—are out of scope.)

**Checks.**
- `weakGlobalDimension` is `0` for fields, `⊥` for `PUnit`, `1` for `ℤ`, `⊤` for `DualNumber k`, and
  `1` for `T₂(k)`; `CategoryTheory.Free k (Fin 2)` has global dimension `1` (via 1.7).
- **Small's triangular ring** `R = [[ℤ, ℚ], [0, ℚ]]` ([Lam-LMR, (2.33), (5.62b)]): in Small's
  construction, let `D` be a commutative Noetherian domain of global dimension `n > 0` with fraction
  field `Q`. The triangular ring `T(D) = [[D, Q], [0, Q]]` is right but not left Noetherian and has
  right global dimension `n`; its left global dimension is `n + 1` if `Q` contains a `D`-submodule
  of projective dimension `n`, and `n` otherwise ([Small, Thm., p. 1035]). For `D = ℤ`, `R` is right
  hereditary (`gldim Rᵐᵒᵖ = wgldim R = 1`) but not left hereditary (p. 1036), so Auslander's
  equality holds on the right and fails on the left.
- **Pierce's free Boolean ring** `B = 𝔽₂[x_j : j ∈ J] ⧸ (x_j² - x_j)` for `|J| = ℵ₂` is von
  Neumann regular (`wgldim B = 0`) with `gldim B = 3` ([Osofsky-Card, Thm. A, p. 644];
  [Osofsky-Nagoya, Cor. 1.4, p. 318]; [Pierce, Cor. 5.2, p. 97]).
- **Jategaonkar's domains** ([Jategaonkar, Thm. 4.10, pp. 438–439]) give principal left ideal
  domains `D` (`gldim D = wgldim D = 1`) of any right global dimension `1 ≤ n ≤ ∞`.
- **Linear `A_∞`** (`0 → 1 → 2 → ⋯`) is hereditary on both sides (`gldim = wgldim = 1`), with
  non-projective flat Bass module of projective dimension `1`.

*Needs:* 0.9, 2.3, 2.5, 3.1, 3.3.

## Layer 4: semiperfect and left perfect categories, and Bass's Theorem P

Throughout, `C : Type u` is preadditive with `Category.{v} C`, radical `J(C) =
TauCeti.jacobsonRadicalIdeal C`, and radical quotient `C ⧸ J(C)`. T-nilpotence and forward Nakayama
need no smallness; theorems using object-indexed sums of representables or `⊗_C` assume
`EssentiallySmall.{v} C` with modules in `ModCat.{v} C`. Ring statements are deduced via
`SingleObj Aᵐᵒᵖ` (0.2).

### 4.1 T-nilpotence and Nakayama's lemma for all modules

A left ideal `I` of `C` (0.3) is **T-nilpotent** (`TauCeti.LeftMorphismIdeal.IsTNilpotent I`) if
every `I`-sequence `c₀ → c₁ → ⋯` has a vanishing composite `q_n = f₀ ≫ ⋯ ≫ f_{n-1}` (Convention 8),
covering nilpotent two-sided ideals and their opposites.

- **Nakayama's lemma for all modules** (`TauCeti.LeftMorphismIdeal.isTNilpotent_tfae`; [Simson,
  Lemma 5.3, p. 108]; [Bass, pp. 473–474]): for a left ideal `I`, (1) `I` is T-nilpotent
  (equivalently Bass modules of `I`-sequences vanish) iff (2) for every `M : ModCat.{v} C`, `I · M =
  M → M = 0`, iff (3) `I · M` is superfluous in every `M` (with `(1) ⇒ (2), (3)` holding in every
  universe). Here (1) ⇒ (2) chooses `f_n ∈ I` and `x_{n+1}` by dependent choice keeping
  `M(q_{n+1})(x_{n+1}) ≠ 0`, (2) ⇔ (3) passes to `M ⧸ N`, and (2) ⇒ (1) applies (2) to Bass's
  module `B` of a non-vanishing `I`-sequence (2.5), where `[g] = B(g ≫ fᵢ)([𝟙 cᵢ₊₁])` gives `B =
  I · B` with `B ≠ 0`.
- **Nakayama for finitely generated modules and finite-sum rigidity**
  (`TauCeti.ModCat.isSuperfluous_jacobson_smul_of_isFinitelyGeneratedFunctor`): for any `C` without
  T-nilpotence, `J(C) · M` is superfluous in every finitely generated `M`. If `J(C) · M ⊔ N = M`
  with `N ≠ M`, 0.1 supplies a simple quotient `S` of `M ⧸ N`; any `S(f)(x) ≠ 0` with `f ∈ J(C)(c,
  d)` yields `x = S(g ≫ f)(x)` for some `g : d → c`, forcing `x = 0` since `𝟙 - g ≫ f` is
  invertible. Consequently, any endomorphism `u` of a finite sum `Q` of representables equal to `𝟙`
  modulo `J(C) · Q` satisfies `u ≫ q = q` on the essential epimorphism `q : Q → Q ⧸ J(C) · Q` and is
  invertible by `TauCeti.IsEssentialEpi.isIso_of_comp_eq` (4.2).
- **Rings** (`TauCeti.IsLeftTNilpotent`, `TauCeti.isLeftTNilpotent_tfae`, bridged to `SingleObj
  Aᵐᵒᵖ`; [AF, 28.3, pp. 314–315]; [Lam-FC, (23.16), p. 352]): `J : Ideal A` is left T-nilpotent iff
  `J • ⊤ = ⊤ → M = 0`, iff `J • ⊤` is superfluous in all `M` (or in `ℕ →₀ A`).

**Check.** In `PowerSeries k`, `(X)` is not left T-nilpotent, as `G = ⟨eᵢ - X • eᵢ₊₁⟩ ⊊ F = ℕ →₀
k⟦X⟧` satisfies `G + X • F = F`.

*Needs:* 0.1, 0.3, 2.5; Tau Ceti `jacobsonRadicalIdeal`, `IsEssentialEpi.isIso_of_comp_eq`,
`MorphismIdeal`, `Ring.mem_jacobson_mulOpposite_iff`.

### 4.2 Semilocal and semiperfect rings and categories

- **Semilocal rings and categories** (`TauCeti.IsSemilocalRing R`, `TauCeti.IsSemilocalCategory C`,
  `TauCeti.IsSemisimpleCategory`, `TauCeti.isSemisimpleCategory_iff_isVonNeumannRegularCategory`,
  `TauCeti.isSemilocalCategory_iff_isSemisimpleCategory`, `TauCeti.ModCat.IsSemisimple`).
  `IsSemilocalRing R` wraps `IsSemisimpleRing (R ⧸ Ring.jacobson R)` (closed under `Rᵐᵒᵖ` and
  surjections; finitely many maximal ideals in the commutative case). A category `D` is semisimple
  (every `Hom(-, X)` has complemented subobjects) iff `D` is von Neumann regular (0.3) and every
  `End_D(X)` is semisimple ([Simson, Prop. 1.2, pp. 93–94]); hence `C` is semilocal iff `D =
  C ⧸ J(C)` is semisimple (`J(D) = ⊥` and `End_D(X) ≅ End X ⧸ Ring.jacobson (End X)`).
- **Semisimple modules** (`TauCeti.ModCat.isSemisimple_iff_exists_iso_sigma`): `Subobject M` is
  complemented iff `M` is a coproduct of simple modules, and `C` is semisimple iff every module in
  `Mod C` is semisimple. Modularity and compact generation (0.1) produce an independent family of
  simple atoms with supremum `⊤`; for each finite subfamily, independence makes the sum map into `M`
  a monomorphism, and passing to the filtered colimit over finite subfamilies gives a monomorphism
  from the full coproduct because `Mod C` satisfies AB5 (0.1).
- **Semiperfect categories and covers** (`TauCeti.IsSemiperfectCategory C`,
  `TauCeti.IsKrullSchmidt`,
  `TauCeti.isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory`,
  `TauCeti.HasProjectiveCover`, `TauCeti.isSemiperfectCategory_tfae`). `IsSemiperfectCategory C`
  requires every `End X` to be semiperfect (symmetric and closed under corners on rings), restating
  Krause's criterion ([Krause, Cor. 4.4, p. 546], ArtinAlgebras §0.2). Equivalent conditions
  ([Simson, Thm. 5.6, p. 110]; [Krause, Prop. 4.1]): (1) `C` is semiperfect; (2) every `Hom(-, X)`
  is a finite coproduct of projectives with local endomorphism rings; (3) every finitely generated
  module has a projective cover; (4) every simple module has a projective cover (constructed
  directly from local idempotent summands `{g ≫ eᵢ} ⊆ Hom(-, X)`); (5) `proj C` is Krull–Schmidt.
  For any projective `P`, an epimorphism `P → F` is essential iff it is right minimal.
- **Radical of a projective module** (`TauCeti.ModCat.jacobson_smul_ne_top_of_projective`): under
  `EssentiallySmall.{v} C` with no assumption on `J(C)`, every superfluous subobject of a projective
  `P` lies in `J(C) · P` (intersection of maximal subobjects), and every nonzero projective `P`
  satisfies `J(C) · P ≠ P` ([Bass, Prop. 2.7, p. 474]; [Lam-FC, (24.7), p. 360]): embed `P` as a
  retract `r ∘ s = 1` of a coproduct `F` of representables; if `J(C) · P = P`, any `f : Hom(-, c) →
  P` factors `s ∘ f = j ∘ g` through a finite subsum `Q` (`π ∘ j = 1`), and `a = π ∘ s ∘ r ∘ j` maps
  `Q` into `J(C) · Q`, making `1 - a` invertible by 4.1's rigidity and forcing `(1 - a) ∘ g = 0`,
  `g = 0`, `P = 0`.
- **Rings** (`TauCeti.isSemiperfectRing_tfae`,
  `TauCeti.FiniteProjectivePresentation.exists_isMinimal`,
  `TauCeti.isSemiperfectRing_iff_exists_ringEquiv_pi`): cover transport across universes lifts `g :
  Q → M` across a cover `f : P → M` (surjective by superfluousness of `ker f`) and splits the lift;
  finitely generated covers are built from irredundant finite subfamilies of simple-quotient covers
  ([Wisbauer, 18.5 (1)]; [Azumaya, Lemma 1]; [Nicholson, Cor. 2]), giving `isSemiperfectRing_tfae`
  ([Sandomierski, Thm. 4, p. 206]; [Lam-FC, (24.16), p. 364]; [Müller, §3]), minimal projective
  presentations over semiperfect rings, and finite products of local rings in the commutative case
  ([Lam-FC, (23.11), p. 350]).

**Checks.** `ℤ` is not semiperfect; `PowerSeries k` is local hence semiperfect; `T₂(k) = T e₁₁ × T
e₂₂` decomposes into simple-module covers.

*Needs:* 0.1, 0.3, 0.9, 4.1; ArtinAlgebras §0.2; Tau Ceti `IsSemiperfectRing`, `IsEssentialEpi`,
`IsProjectiveCover`, `FiniteProjectivePresentation`, `IsMinimalProjectivePresentation`.

### 4.3 Left perfect categories and left perfect rings

`TauCeti.IsLeftPerfectCategory C` extends `IsSemilocalCategory C` with T-nilpotence of `J(C)` (as a
left ideal; right perfectness is `IsLeftPerfectCategory Cᵒᵖ`), giving `IsSemiperfectCategory C`
(lifting idempotents across nil `J(C)(X, X)`) and covering semilocal categories with nilpotent
radical on both sides.

**Rings** (`TauCeti.IsLeftPerfectRing A`, bridged to `SingleObj Aᵐᵒᵖ`):

- **Hierarchy and surjections** (`TauCeti.IsLeftPerfectRing.of_isSemiprimaryRing`,
  `TauCeti.IsLeftPerfectRing.isSemiperfectRing`; [Lam-FC, (23.19), (24.19)]; [AF, 28.7]):
  semiprimary and left or right Artinian rings are perfect on both sides, and left perfectness
  passes to surjective ring images.
- **Endomorphism rings of finite-length modules** (`TauCeti.Module.End.isSemiprimaryRing` under
  `[IsNoetherian R M] [IsArtinian R M]`; [AF, Cor. 29.3, p. 324]): `S = Module.End R M` (`f * g =
  f ∘ g`) is semiprimary via four targets:
  1. *Nil implies T-nilpotent for product-closed sets* (adapting [Fisher-Nil, Lemmas 1.1, 1.3,
     Thms. 1.5, 2.1, pp. 75–77], printed there for nil subrings; [AF, Thm. 29.2, pp. 323–324] is
     the parallel statement for nil one-sided ideals; the extension to product-closed sets and the
     written Noetherian argument are this roadmap's, not independently audited): let `I ⊆ S` be
     closed under composition with every member nilpotent. If `M` is Artinian, `S` has the
     ascending chain condition on left annihilators ([Fisher-Nil, Lemma 1.1]); if `I` is not left
     T-nilpotent, Fisher's selection ([Fisher-Nil, Lemma 1.3]), which maximizes left annihilators
     among blocks `xᵢ ⋯ xⱼ` and `(xᵢ ⋯ xₙ) xᵢ` and so uses only that these lie in `I` and are
     nilpotent, gives `xₙ ∈ I` with `x₁ ⋯ xₙ ≠ 0` and `(x₁ ⋯ xₙ) xᵢ = 0` for `n ≥ i`. For
     `sᵢ = x₁ ⋯ xᵢ` the images `sᵢM` stabilize from some `k`, so `M = ker sᵢ + xᵢ₊₁M` for `i ≥ k`
     while `xᵢ₊₁M ⊆ ker sⱼ` for `j > i`; hence the intersections `⋂_{i=k}^{j} ker sᵢ` strictly
     decrease, contradicting the descending chain condition. If `M` is Noetherian, `S` has the
     ascending chain condition on right annihilators (a right annihilator `A` consists exactly of
     the maps with image in `∑_{a ∈ A} aM`); if `I` is not right T-nilpotent, the opposite
     selection gives `pₙ = xₙ ⋯ x₁ ≠ 0` with `xᵢ pₙ = 0` for `n ≥ i`. Once `ker pᵢ` stabilizes,
     `xᵢ₊₁` is injective on `Uᵢ = pᵢM` and kills every later `Uⱼ`, so the `Uᵢ` form an infinite
     direct sum of nonzero submodules, contradicting the ascending chain condition.
  2. *A uniform exponent:* for finite `F ⊆ I`, the nonzero words over `F` form a finitely branching
     tree (extended on the right in the Artinian case, on the left in the Noetherian case), so
     König's lemma and step 1 make all sufficiently long words vanish. Hence the additive span of
     `I`, a possibly nonunital subring by product closure, is nil, and Fisher's printed theorems
     ([Fisher-Nil, Thms. 1.5, 2.1]; cf. [AF, Prop. 29.1, p. 323]) make it nilpotent, giving one
     exponent for all products of members of `I`.
  3. *Small–Fisher theorem* (`TauCeti.Module.End.exists_prod_eq_zero_of_isNilpotent`, covering nil
     left or right ideals): combines steps 1–2.
  4. *Finite-length corollary:* `M` is a finite sum of local-endomorphism summands (`S`
     semiperfect), and `Ring.jacobson S` is nil by Fitting's lemma, hence nilpotent by step 3.
- **Commutative perfect rings** ([Lam-FC, (23.24), p. 357]): finite products of local rings with
  T-nilpotent maximal ideals, and Artinian iff perfect when Noetherian.

*Needs:* 4.1, 4.2; Tau Ceti `IsSemiprimaryRing.mulOpposite`, `isSemiprimaryRing_mulOpposite_iff`.

### 4.4 Projective covers over left perfect categories

Over a left perfect `C`, every `M : Mod C` has a projective cover
(`TauCeti.IsLeftPerfectCategory.hasProjectiveCover`; [Simson, Thm. 5.4, (7) ⇒ (8), p. 109]; [Bass,
Lemma 2.6, p. 473]): `M ⧸ J · M` is semisimple over `C ⧸ J(C)` (0.3, 4.2), so lifting a coproduct of
simple-module covers `q = ⊕ qᵢ : P = ⊕ Pᵢ → M ⧸ J · M` to `f : P → M` is epic (`J · M` superfluous,
4.1) with `ker f ⊆ ⊕ ker qᵢ ⊆ ⊕ J · Pᵢ = J · P` (0.3, 4.2), superfluous in `P` (4.1). Specializing
yields `TauCeti.IsLeftPerfectRing.exists_isProjectiveCover` ([Lam-FC, (24.12), p. 362]).

*Needs:* 4.1–4.3; Tau Ceti `exists_isProjectiveCover`, `isSemisimpleModule_quotient_smul_top`,
`isProjectiveCover_mkQ_iff_le_jacobson`.

### 4.5 Bass's Theorem P

- **Pure superfluous subobjects of projectives**
  (`TauCeti.ModCat.eq_bot_of_isSuperfluous_of_isPureEpi`,
  `TauCeti.ModCat.Flat.projective_of_isEssentialEpi`; [Wisbauer, 36.3, 36.4 (1), p. 306]; [Chase
  1960, Prop. 2.2, p. 458]; [Mares, Thm. 2.4, p. 349]). Under `EssentiallySmall.{v} C` with no
  radical hypothesis, if `K` is superfluous in a projective `P` and `q : P → P ⧸ K` is pure epic
  (2.3), then `K = 0`—so every flat module with a projective cover is projective. Indeed, embed `P`
  as a retract `r ∘ s = 1` of a coproduct `F` of representables; for `x ∈ K(c)`, `s(x)` lies as
  `x_L` in a finite subsum `j : L → F` (`π_L ∘ j = 1`), purity lifts `L ⧸ (x_L) → P ⧸ K` to `P`
  giving `g : L → P` and `δ = j - s ∘ g`, and `θ = r ∘ δ ∘ π_L ∘ s : P → P` satisfies `θ(x) = x`
  and `q ∘ θ = 0`. Thus `q ∘ (1 - θ) = q`, so cover rigidity (`IsEssentialEpi.isIso_of_comp_eq`)
  makes `1 - θ` invertible and `x = 0`.
- **Theorem P** (`TauCeti.isLeftPerfectCategory_tfae`; [Simson, Thm. 5.4, p. 108]; [Harada, Thm. 5,
  p. 339]; [Bass, Theorem P, pp. 467–468]; [Sandomierski, Thm. 5, p. 206]; [AF, 28.4]; [Lam-FC,
  (24.25)]). For `EssentiallySmall.{v} C` and modules in `ModCat.{v} C`, the following are
  equivalent:
  1. `C` is left perfect (`J(C)` T-nilpotent and `C ⧸ J(C)` semisimple);
  2. every module in `Mod C` has a projective cover;
  2′. every semisimple module in `Mod C` has a projective cover;
  2″. `C` is semilocal and every nonzero module in `Mod C` has a maximal subobject ([AF, 28.4 (c)]);
  3. every flat module in `Mod C` is projective;
  3′. every `ℵ₁`-presentable flat module is projective;
  4. for every `c`, principal right ideals `g C = {g ≫ h}` at `c` satisfy the descending chain
     condition;
  4′. every sequence `c₀ → c₁ → ⋯` stabilizes at `c₀` (`q_n = q_m ≫ t` for all `m ≥ n`);
  4″. no `End X` has an infinite `OrthogonalIdempotents` family of nonzero idempotents, and every
      nonzero right module `N : Mod Cᵒᵖ` contains a simple subobject (this roadmap's categorical
      extension of [Bass, Thm. P (7)] and [AF, 28.4 (f)]);
  5. `flatDimension M = projectiveDimension M` for every `M : Mod C`;
  6. for every `n : ℕ`, filtered colimits in `Mod C` preserve `HasProjectiveDimensionLE _ n`
     ([Bass, Thm. P (4)]);
  6′. filtered colimits of projectives in `Mod C` are projective.

  *Proof route:* **1 ⇒ 2** is 4.4; **1 ⇔ 2″** uses 4.1 (`J · M ≠ M` gives a simple quotient of
  semisimple `M ⧸ J · M`, and maximal subobjects contain `J · M`); **2 ⇒ 3 ⇒ 3′** uses
  `projective_of_isEssentialEpi`; **3′ ⇒ 4′ ⇔ 4** applies 3′ to Bass's module (2.5); **4 ⇒ 4″**
  gets finite orthogonal idempotents from `(𝟙 X - e₀) C ⊋ (𝟙 X - e₀ - e₁) C ⊋ ⋯` and right simple
  subobjects by inductively choosing proper nonzero `L < im(φ_x ∘ (q_n)_*)` to build `q₀ C ⊋ q₁ C ⊋
  ⋯`. For **4″ ⇒ 1**, a `J(C)`-sequence missing a maximal counterexample `I < Hom(c₀, -)` hits a
  simple `K ⧸ I ≤ Hom(c₀, -) ⧸ I`, giving `q_n ≫ (𝟙 - f_n ≫ r) ∈ I` ([AF, pp. 316–317]) and hence
  T-nilpotence of `J(C)`. Passing to `D = C ⧸ J(C)` (`J(D) = ⊥`), fullness of `C ⥤ D` preserves
  right simple subobjects, and lifting orthogonal idempotents in complementary corners across nil
  `J(End_C X)` rules out infinite nonzero `OrthogonalIdempotents` in `End_D X`. For any nonzero
  idempotent `e ∈ End_D X`, a simple `S ≤ e D(X, -)` has `0 ≠ u ∈ S(Y)` hence `0 ≠ a = u ≫ v ∈
  S(X)` (`J(D) = 0`); some `b ∈ S(X)` acts nonzeroly on `S` via `s ↦ b ≫ s` (else `(a ≫ h)² = 0` for
  all `h ∈ End_D X`, forcing `a ∈ J(D)(X, X) = 0`), an isomorphism by Schur's lemma whose preimage
  `f ∈ S(X)` of `b` gives a nonzero corner idempotent `f' = f ≫ e ∈ e (End_D X) e` generating a
  simple left ideal `End_D X · f'`, and iterating on `𝟙 X - ∑_{i<n} f'_i` decomposes `End_D X` into
  finitely many simple left ideals. Finally, **3 ⇔ 5 ⇒ 6 ⇒ 6′ ⇒ 3** uses 3.1, 2.2, 2.3, and 2.6;
  and **2′ ⇒ 1** gets semiperfectness from simple covers (4.2) and lifts a cover of `F ⧸ J · F` on a
  coproduct `F` of representables (`jacobson_smul_ne_top_of_projective`, 4.2) to vanish Bass modules
  of `J(C)`-sequences (4.1).
- **Rings** (`TauCeti.isLeftPerfectRing_tfae`): specializes `isLeftPerfectCategory_tfae` at
  `SingleObj Aᵐᵒᵖ`, expressing 2 and 2′ with `TauCeti.IsProjectiveCover` (Convention 12 and
  `TauCeti.isProjectiveCover_iff_forall_surjective`), 2″ with `IsCoatom` in `Submodule A M`, 3 and
  3′ with `Module.BalancedFlat`, 4 and 4′ on `{I : Submodule Aᵐᵒᵖ A // I.IsPrincipal}`, 4″ with
  `OrthogonalIdempotents` on `A` and `TauCeti.socle Aᵐᵒᵖ N ≠ ⊥` on nontrivial right `A`-modules,
  and 5, 6, 6′ in `ModuleCat.{u} A`.

*Needs:* Layers 2 and 3, 4.1–4.4; Mathlib `OrthogonalIdempotents`; Tau Ceti `IsEssentialEpi`,
`isProjectiveCover_iff_forall_surjective`, `socle`.

### 4.6 Global dimension of left perfect categories

- **Equality, symmetry, and Bass–Eilenberg**
  (`TauCeti.ModCat.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectCategory`,
  `TauCeti.ModCat.hasProjectiveDimensionLE_iff_isZero_tor`; [Bass, p. 475]; [Eilenberg 1956, Prop.
  10, Thm. 11, p. 333]): over left perfect `C`, Theorem P (5) gives `globalDimension (ModCat C) =
  weakGlobalDimension C` (hence symmetry when both `C` and `Cᵒᵖ` are left perfect, 3.3). Iterating
  projective covers (4.4) builds a minimal projective resolution `P_•` of `M` whose differentials
  land in `J · P_n` (4.2), giving `Tor_n((C ⧸ J)(X, -), M) ≅ (P_n ⧸ J · P_n)(X)` (0.4); these groups
  vanish for every `X` if and only if `P_n ⧸ J · P_n = 0`, and hence if and only if `P_n = 0` by
  Nakayama's lemma (4.1), yielding `pd M ≤ n ↔ ∀ X, Tor_{n+1}((C ⧸ J)(X, -), M) = 0` and
  `globalDimension (ModCat C) = ⨆ X, flatDimension ((C ⧸ J)(X, -))`.
- **Rings** (`TauCeti.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing`,
  `TauCeti.globalDimension_mulOpposite_of_isLeftPerfectRing`; [Au, Cor. 9, p. 73]; [Lam-LMR,
  (5.70)–(5.71), pp. 187–188]): `globalDimension A = weakGlobalDimension A` for left perfect `A`,
  and equals `globalDimension Aᵐᵒᵖ` when `A` is two-sided perfect (covering all semiprimary rings
  without Noetherian hypotheses).

*Needs:* 0.3, 0.4, 3.1, 3.3, 4.1–4.5; Tau Ceti `globalDimension`.

### Layer 4 checks

- In `PowerSeries k`, the ideal `(X)` is not left T-nilpotent, so the local (hence semiperfect) ring
  `PowerSeries k` is not left perfect, with Bass module `LaurentSeries k`; `ℤ` is not semiperfect;
  `T₂(k)` and `DualNumber k` are two-sided perfect; `k[x₀, x₁, …] ⧸ (xᵢxⱼ : all i, j)` is
  non-Noetherian semiprimary; Bass's ring `k[x₀, x₁, …] ⧸ (xᵢ^{i+2}, xᵢxⱼ : i ≠ j)` ([Bass, p. 475])
  is perfect without being semiprimary (with DCC on principal ideals despite non-Noetherianness);
  linear `A_∞` (`CategoryTheory.Free k ℕ`) is semilocal, not left perfect (`IsLeftPerfectCategory`
  fails on `Mod C`, where Bass's module `B` for the arrows `i → i + 1` satisfies `B = J · B ≠ 0`),
  and right perfect (`IsLeftPerfectCategory Cᵒᵖ`); and `Free k (Fin 2)` is two-sided perfect with
  Krull–Schmidt `proj C`.
- **Lam's ring** `R = k · 1 + J ⊆ End_k(ℕ →₀ k)` of strictly upper-triangular finite matrices
  ([Lam-FC, (23.22), p. 356]) is local and right perfect (`IsLeftPerfectRing Rᵐᵒᵖ`), but not left
  perfect (`E₀₁ ⋯ Eₙ₋₁,ₙ = E₀ₙ ≠ 0`), mirroring linear `A_∞`.

## Downstream consumers

- **[ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md)** (alternative proofs available
  to it; ArtinAlgebras does not depend on this roadmap, so supply runs only from ArtinAlgebras
  §§0.2–0.3 to this roadmap): §7.2's two-sided Noetherian and semiprimary global-dimension
  symmetries gain weak-dimension proofs from 3.4 and 4.6 (replacing Tau Ceti's character-module
  proofs while retaining their statements); §7.5 uses
  `TauCeti.globalDimension_le_of_forall_finitePresentation_mulOpposite` (3.4) when `M` is an
  additive generator of `mod A` (supplying `pd ≤ 2` on finitely presented right `End_A(M)`-modules)
  to bound `globalDimension (Module.End A M) ≤ 2` assuming only left—rather than two-sided—
  Noetherianness of `End_A(M)`; §§4.1–4.2 use 1.4 (`stable Hom_A(M, N) ≅ Tor_1^A(Tr M, N)`); Layer 4
  uses minimal projective presentations over semiperfect rings (4.2) and semiprimary `Module.End R
  M` for finite-length `M` (4.3); and Layer 2 supplies the noncommutative flatness needed for
  Hoshino's flat-dominant dimension ([Ho, Theorem, p. 275]; [Xi, §1, p. 34]).
- **Tau Ceti refactors (no shims):**
  - From 0.1, generalize ArtinAlgebras §1.1's single-representable finite-generation and
    finite-presentation API (on Tau Ceti `main`, `TauCeti/CategoryTheory/FinitelyPresentedFunctor/`)
    to finite sums via morphism matrices, retaining single-representable versions under suitable
    biproduct hypotheses, and migrate downstream additive, abelian, and Krull–Schmidt consumers to
    that interface (with right-minimal representable covers identified with essential epimorphisms
    in 4.2).
  - From 0.2, `TauCeti.small_mulOpposite` removes redundant `[Small.{v} Aᵐᵒᵖ]` binders.
  - From 0.3, `TauCeti.IsSuperfluous` generalizes from `Submodule R M` to lattices with `⊤`.
  - From 2.3, `TauCeti.flatModuleFilteredFree` is reproved from `BalancedFlat.isDenseAt`.
  - From 3.2, `TauCeti.globalDimension` becomes `Abelian.globalDimension (ModuleCat A)`.
  - From 4.2, `TauCeti.IsSemiperfectRing` extends `IsSemilocalRing`, `[IsSemisimpleRing (R ⧸
    Ring.jacobson R)]` hypotheses simplify to `[IsSemilocalRing R]`, and ArtinAlgebras §0.2's
    Krause criterion is stated with `IsSemiperfectCategory`.

## Scope and ownership

This roadmap owns:

- **Layer 0 (modules, bimodules, ideals, tensor products, and Morita theory):** finitely generated
  and finitely presented functors via finite sums of representables (0.1); `Mod C` with its abelian
  and Grothendieck structure (supplying `Abelian.Ext`), representable projectives, concrete
  `ModCat.Submodule` and `Subobject` lattices, derived `R`-linearity, and `mod C ⊆ Mod C`;
  equivalences between ring modules and `Mod (SingleObj Aᵐᵒᵖ)` (0.2); `Linear.TensorProduct`
  (`C₁ ⊗_R C₂`) and `Preadditive.TensorProduct` (`C₁ ⊗_ℤ C₂`), symmetric `R`-central and preadditive
  bimodules `ModCat.LinearBimod R D C` and `ModCat.Bimod D C` (bridged to `A ⊗[R] Bᵐᵒᵖ`), one-sided
  ideals of `C` as one-sided `C`-submodules of `_C C_C`, lattice superfluousness (refactoring
  `TauCeti.IsSuperfluous`), `I · M`, reduction along `C ⥤ C ⧸ I`, and von Neumann regular category
  and ring predicates (0.3); the coend and bimodule tensor products, bimodule `Hom`, and swap
  (0.4–0.6); the ring API for `M ⊗_A N`, outer bimodule tensor functors, and the right `A`-module
  action on `CharacterModule M` (0.7); duals `F^E` (0.8); `proj C`, `proj C ≌ Karoubi (Mat_ C)`,
  projective duality `Hom(-, C)`, and finite-presentation bridges (0.9); and Morita equivalence of
  preadditive categories (`Mod C ≌ Mod D ↔ proj C ≌ proj D` and invertible bimodules) and of rings
  (`finiteProjectiveModules`, progenerators, matrix corners, and invertible bimodules, 0.10).
- **Layer 1 (`Tor` and category algebras):** scalar and bimodule `Tor` over categories and rings
  (with symmetric outer bimodule actions on `BalancedTor`), long exact sequences, balance,
  `underline{mod C}` with `(underline{mod C})ᵒᵖ ≌ underline{mod Cᵒᵖ}`, `stable Hom(X, N) ≅
  Tor_1(Tr X, N)` and its projectivity test, `Tor`–`Ext` duality, commutative and base-change
  comparisons, `Tor₁` of cyclic modules, and the Morita comparison with `CategoryAlgebra C` for
  `[Finite C]`.
- **Layer 2 (flatness):** equational flatness for `Mod C` and `BalancedFlat` for rings, the ideal,
  `Tor`, and Lambek tests, Baer's criterion for `Mod C`, commutation of `Tor` with filtered
  colimits, projectivity of finitely presented flat modules, the unified Lazard–Govorov–purity
  `TFAE` characterization (bridged to `IsCardinalPure`), left exact and cohomological
  characterizations, Crawley-Boevey's representation theorem and its converse (`𝒜` finitely
  accessible additive `↔ 𝒜 ≌ Flat(C)`), Bass's sequence module, closure properties, and bridges to
  `IsIndObject`.
- **Layer 3 (homological dimensions and von Neumann regularity):** flat dimension;
  `Abelian.globalDimension`, Auslander's cyclic lemma, and universe independence; weak global
  dimension, its symmetry, and homological/idempotent `TFAE` characterizations of von Neumann
  regular categories and rings (`weakGlobalDimension ≤ 0`); the `FP_∞` lemma and Auslander's theorem
  for Noetherian categories and left Noetherian rings; closure of flat modules under kernels
  (`weakGlobalDimension ≤ 2`); and projective dimension `≤ 1` for countably presented flat modules.
- **Layer 4 (left perfect categories, covers, and Theorem P):** T-nilpotent left ideals and
  Nakayama's lemma for all modules; semilocal, semiperfect, and left perfect categories and rings
  (including Simson's von Neumann regular characterization of semisimple categories), commutative
  classifications, and semiprimary endomorphism rings of finite-length modules; projective covers,
  radicals of projectives, and minimal projective presentations over semiperfect rings; vanishing of
  pure superfluous subobjects of projectives; Theorem P for categories and rings (including
  maximal-subobject, right-socle, and filtered-colimit `pd ≤ n` clauses); and global dimension of
  left perfect categories and rings with the Bass–Eilenberg criterion.

Boundaries with Mathlib, Tau Ceti, and neighboring roadmaps:

- **Linearity and enrichment.** An `R`-linear category is Mathlib's `Linear R C`, and modules are
  additive functors to `AddCommGrpCat`. Categories enriched in `ModuleCat R` and bridges to Tau
  Ceti's DG modules (`TauCeti/CategoryTheory/DG/Functor/Category.lean`) are out of scope.
- **Finitely presented functors.** `mod C` is owned by
  [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md) §1.1, whose single-representable
  predicate is `IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean` (implemented on
  current Tau Ceti `main` as `TauCeti.IsFinitelyPresentedFunctor` in
  `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean`, not yet at this roadmap's pin). 0.1
  extends it to categories without finite biproducts by finite sums of representables, keeping the
  name: the two agree when `C` has finite biproducts (a named target of 0.1), but not on one-object
  categories, where over `ℤ`, `ℤ²` is not a quotient of `ℤ`. Tau Ceti keeps one predicate; the
  single-representable form becomes the theorem under `[HasFiniteBiproducts C]`.
- **Commutative flatness and `Tor`.** Over commutative rings, flatness remains Mathlib's
  `Module.Flat` (compared with `BalancedFlat` in 2.1, making `TauCeti.flatModuleFilteredFree` a
  corollary of 2.3). [Operator K-theory](../OperatorKTheory/README.md), §8.2, owns `ℤ`-specific
  `Tor`/`Ext` computations; [Derived and module algebra](../DerivedModuleAlgebra/README.md) owns
  derived tensor products over commutative rings.
- **Global dimension.** `TauCeti.globalDimension` is refactored without shims as the `ModuleCat A`
  case of `TauCeti.Abelian.globalDimension` (3.2). Statements comparing left and right global
  dimensions without weak dimension stay in
  [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.2, with their
  character-module proofs replaced by 3.4 (and a second proof of the semiprimary case from 4.6).
- **Semiperfect rings, covers, and ideals.** `TauCeti.IsSemiperfectRing` is refactored to extend
  `IsSemilocalRing` (4.2). Krull–Schmidt categories and Krause's criterion belong to ArtinAlgebras
  §0.2 (`IsKrullSchmidt`, restated identically in `Suggested.lean` and linked to
  `IsSemiperfectCategory` in 4.2). Two-sided ideals and `J(C)` remain `TauCeti.MorphismIdeal` and
  `TauCeti.jacobsonRadicalIdeal`; minimal presentations use
  `TauCeti.IsMinimalProjectivePresentation`.
- **Morita theory.** Categorical Morita equivalence (`Mod C ≌ Mod D ↔ proj C ≌ proj D` and
  invertible bimodules) and the ring `TFAE` characterization (`finiteProjectiveModules`,
  progenerators, full-idempotent matrix corners via `IsIdempotentElem.isMoritaEquivalent_corner` and
  `IsMoritaEquivalent.matrix`, and invertible `R`-central bimodules) live in 0.10;
  [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §7.1, treats Artin-algebra
  invariants under Morita equivalence.
- **Out of scope:** intrinsic flatness inside `Flat(C)` ([CI]); `n`-fold multilinear functors for
  `n ≥ 3` ([Mitchell, §2]); non-unital category rings beyond `[Finite C]`; Mittag-Leffler,
  product-tensor, and coperfectness conditions ([Simson, Thm. 5.4 (2)–(4)]); Chase's theorem,
  coherent rings, and products of flat or projective modules (pointers in 2.6); flat covers
  (pointers in 2.4); pure-injectivity and pure global dimension; faithful flatness; Björk's and
  Jonah's chain conditions; finitistic dimensions; unit-regularity and `K₀` of von Neumann regular
  rings; Hochschild (co)homology over `C ⊗_R Cᵒᵖ`; and flat-dominant dimension.

Suggested homes in Tau Ceti: `TauCeti/CategoryTheory/Linear/TensorProduct.lean` (0.3),
`TauCeti/CategoryTheory/Preadditive/VonNeumannRegular.lean` (0.3, 3.3),
`TauCeti/CategoryTheory/Preadditive/ModCat/` (0.1, `Bimod.lean` for 0.3–0.4, ideal actions in 0.3,
0.4–0.6, 0.8, `Proj.lean` for 0.9, `Morita.lean` for 0.10, `Tor/` for 1.1–1.6, `Flat/` for 2.1–2.6,
`Baer.lean` for 2.2, `Dimension/` for 3.1 and 3.3–3.5, `LeftPerfect/` for 4.2–4.6),
`TauCeti/CategoryTheory/Preadditive/MorphismIdeal/` (`OneSided.lean` for 0.3, `TNilpotent.lean` for
4.1), `TauCeti/Order/Superfluous.lean` (0.3, replacing `Submodule/Superfluous.lean`),
`TauCeti/CategoryTheory/Preadditive/SingleObj.lean` (0.2),
`TauCeti/LinearAlgebra/TensorProduct/Balanced/` (0.7), `TauCeti/RingTheory/Morita/` (0.10 rings),
`TauCeti/Algebra/Homology/BalancedTor/` (ring `Tor`),
`TauCeti/CategoryTheory/Preadditive/CategoryAlgebra.lean` (1.7),
`TauCeti/RingTheory/Flat/Balanced/` (Layer 2 rings), `TauCeti/RingTheory/VonNeumannRegular.lean`
(0.3, 3.3), `TauCeti/CategoryTheory/Abelian/GlobalDimension.lean` (3.2),
`TauCeti/RingTheory/GlobalDimension/Weak.lean` (Layer 3 rings),
`TauCeti/CategoryTheory/Preadditive/Semiperfect.lean` (4.2),
`TauCeti/RingTheory/Jacobson/` (`TNilpotent.lean`, `Semilocal.lean`, `LeftPerfect.lean`), and
`TauCeti/Algebra/Module/ProjectiveCover/Semiperfect.lean` (4.2, 4.4). `TauCeti/RingTheory/Perfect/`
remains reserved for characteristic `p`.

## Exact supplier contracts

### From Mathlib

- **Subcategories, Grothendieck structure, and lattices:** `additiveFunctor` (`C ⥤+ D`),
  `ObjectProperty` closure classes and full-subcategory abelian/colimit instances
  (`Mathlib/CategoryTheory/Abelian/Subcategory.lean`), `IsGrothendieckAbelian` (giving
  `enoughInjectives`, `hasExt`, `wellPowered`, and `generatingMonomorphisms_rlp`), `Subobject` with
  `IsModularLattice`, `IsCompactlyGenerated`, `IsAtomistic`, and `exists_sSupIndep_of_sSup_atoms`.
- **Linearity, coends, Morita, and one-object categories:** `Linear` with `preadditiveIntLinear`,
  `linearYoneda`, `Abelian.Ext`, `Abelian.linearExtFunctor` and `Abelian.Ext.smul_eq_comp_mk₀`
  (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`), `Limits.coend`
  (`Mathlib/CategoryTheory/Limits/Shapes/End.lean`), `SingleObj` and `Mat.equivalenceSingleObj`,
  `TensorProduct.Algebra.module` (`Mathlib/Algebra/Module/Bimodule.lean`), `IsMoritaEquivalent`
  (`Mathlib/RingTheory/Morita/Basic.lean`), `IsMoritaEquivalent.matrix`
  (`Mathlib/RingTheory/Morita/Matrix.lean`), `OrthogonalIdempotents`
  (`Mathlib/RingTheory/Idempotents.lean`), `RestrictScalars` with `RestrictScalars.addEquiv`, and
  exactness of `ModuleCat.restrictScalars`
  (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRingsExact.lean`).
- **Derived functors, `Ext`, and dimensions:** classical `Functor.leftDerived` and
  `NatTrans.leftDerived` (used rather than derived-category `HasLeftDerivedFunctor`),
  `ProjectiveResolution.extLinearEquivCohomologyClass` with `extMk_comp_mk₀` and `mk₀_comp_extMk`
  (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`), `ShortComplex.ShortExact.δ` with
  `homology_exact₁`–`homology_exact₃`, `HomologicalComplex₂.total`, `projectiveDimension`, and
  `injectiveDimension`.
- **Presentability, purity, and weak limits:** `IsFinitelyPresentable`, `IsCardinalPresentable`
  (with `Cardinal.isRegular_aleph_one`), `IsLocallyFinitelyPresentable`,
  `IsFinitelyAccessibleCategory`, `IsCardinalPure`
  (`exists_colimitsOfShape_splitMonomorphisms_of_isCardinalPure`),
  `ObjectProperty.IsCardinalFilteredGenerator` and `IsStrongGenerator`
  (`colimitsCardinalClosure_eq_isCardinalPresentable`, `isDense_colimitsCardinalClosure_ι`),
  `IsIndObject`, covariant `RepresentablyFlat` (contrasted in 2.3), `IsWeakLimit` and `KernelFork`
  with `Pretriangulated.isWeakLimitKernelForkOfDistTriangle`, and `Functor.IsHomological`.

### From Tau Ceti

- **Balanced tensor product and character modules:** `TauCeti.BalancedTensorProduct` (`tmul`,
  `balance`, `lift`, `hom_ext`, `induction_on`, `map`, `congr`, `lid`, `rid`, `finsuppScalarRight`,
  `leftModule`, `rightModule`, `outerSMulCommClass`, `assoc`) and
  `TauCeti.CharacterModule.eval_injective`.
- **Derived functors, bicomplexes, and commutative flatness/`Tor`:** `NatTrans.leftDerived_add`,
  `Functor.isZero_leftDerived_succ`, `ShortComplex.ShortExact.leftDerivedOneIsoKernel`,
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows` and
  `totalComplexShapeSymmetryDownNat`; commutative `Tor`/`Tor'` lemmas in
  `TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor` and `TauCeti.CategoryTheory.Monoidal.Tor`;
  `TauCeti.FiniteFreeModuleCat`, `TauCeti.FiniteFreeOver`, and `TauCeti.flatModuleFilteredFree`
  (refactor consumer, 2.3).
- **Transpose, quivers, and Morita corners:** `TauCeti.AuslanderReitenTranspose`,
  `TauCeti.stableTransposeEquivalence`,
  `LinearMap.auslanderReitenTransposeTensorEquivCokernel`,
  `TauCeti.ExactStructure.projectiveStableFunctor`,
  `CategoryTheory.ObjectProperty.factorIdeal`,
  `ModuleCat.tensorHomCokernelEquivProjectiveStableHom`, `TauCeti.quiverRepEquivalence`,
  `TauCeti.Quiver.Kronecker.upperTriangularAlgEquiv`, `IsIdempotentElem.isMoritaEquivalent_corner`,
  `CategoryTheory.Equivalence.finiteProjectiveModulesEquivalence`, and
  `TauCeti.finiteProjectiveModules`.
- **Ideals, radicals, socles, covers, and global dimension:** `TauCeti.MorphismIdeal` (`Quotient`,
  `quotientFunctor`, monoid structure, `op`), `TauCeti.jacobsonRadicalIdeal`
  (`jacobsonRadical_self_eq_jacobson`, `exists_jacobsonRadicalIdeal_pow_eq_bot`),
  `TauCeti.socle`, `TauCeti.IsSemiprimaryRing.mulOpposite`,
  `TauCeti.Ring.mem_jacobson_mulOpposite_iff`,
  `TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff`,
  `TauCeti.isSemisimpleModule_quotient_smul_top`, `TauCeti.IsSemiperfectRing` (refactored in 4.2)
  with `CompleteOrthogonalIdempotents.exists_surjective_of_isSimpleModule`,
  `TauCeti.IsEssentialEpi` (`isIso_of_comp_eq`), `TauCeti.IsSuperfluous` (refactored in 0.3),
  `TauCeti.IsProjectiveCover` and `TauCeti.exists_isProjectiveCover`,
  `TauCeti.FiniteProjectivePresentation` and `TauCeti.IsMinimalProjectivePresentation`, and
  `TauCeti.globalDimension` (refactored in 3.2).

### From other roadmaps

- [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md), §0.2: `IsKrullSchmidt` and
  Krause's criterion (restated with `IsSemiperfectCategory` in 4.2); §0.3: uniqueness of
  Krull–Schmidt decompositions (used in a check of 0.9).
- [SpectralSequencesAndConvergencePartII](../SpectralSequencesAndConvergencePartII/README.md),
  §4.1: `nonempty_tor_iso_tor'`, whose `ModuleCat R` case is `nonempty_torIsoTor'` in 1.6.

## References

- [AB] M. Auslander, M. Bridger, *Stable module theory*, Mem. Amer. Math. Soc. 94 (1969). §2.1,
  pp. 48–52 (`D(M)` and stable transpose duality); (2.8) (b), pp. 54–55 (`Ext^k(M, -) → Tor_1(D Ω^k
  M, -) → 0`, crediting M. Auslander, *Coherent functors*, Proc. Conf. Categorical Algebra (La
  Jolla, 1965), Springer (1966), 189–231, Prop. 5.8 (c), p. 220, Lemma 7.4, p. 229, Thm. 7.5,
  p. 230).
- [AF] F. W. Anderson, K. R. Fuller, *Rings and Categories of Modules*, 2nd ed., GTM 13, Springer
  (1992). §28: p. 314, Lemma 28.3 (pp. 314–315), Thm. 28.4 (pp. 315–317), Cor. 28.7 (p. 318). §29:
  Prop. 29.1, Thm. 29.2, Cor. 29.3 (pp. 323–324; endomorphisms act on the right, reversing
  Mathlib's multiplication order).
- [Auslander78] M. Auslander, *Functors and morphisms determined by objects*, in *Representation
  Theory of Algebras* (Philadelphia, 1976), LNPAM 37, Dekker (1978), 1–244. I, Prop. 3.2 (`stable
  Hom(X, Y) ≅ Tor_1(Tr X, Y)`).
- [Au] M. Auslander, *On the dimension of modules and algebras III. Global dimension*, Nagoya Math.
  J. 9 (1955), 67–77. Thm. 1, p. 68; Thm. 4 and Cor. 5, p. 70; Cor. 9, p. 73.
- [Azumaya] G. Azumaya, *Corrections and supplementaries to my paper concerning
  Krull-Remak-Schmidt's theorem*, Nagoya Math. J. 1 (1950), 117–124. Lemma 1, pp. 118–119.
- [Bass] H. Bass, *Finitistic dimension and a homological generalization of semi-primary rings*,
  Trans. Amer. Math. Soc. 95 (1960), 466–488. p. 466; Theorem P, pp. 467–468; Lemmas 1.1–1.3,
  pp. 468–470; Thm. 2.1, p. 471; Lemma 2.6 and Nakayama argument, pp. 473–474; Prop. 2.7, p. 474;
  Eilenberg's `Pd = Wd` argument and §3 Examples, p. 475.
- [BEE] L. Bican, R. El Bashir, E. Enochs, *All modules have flat covers*, Bull. London Math. Soc.
  33 (2001), 385–390. Thm. 3 (pointer).
- [Beligiannis] A. Beligiannis, *On the Freyd categories of an additive category*, Homology Homotopy
  Appl. 2 (2000), 147–185. Lemma 8.10, Prop. 8.11, Rem. 8.12, pp. 180–181.
- [CB] W. Crawley-Boevey, *Locally finitely presented additive categories*, Comm. Algebra 22 (1994),
  1641–1674. Skeletally small additive `𝒞` with contravariant `(𝒞ᵒᵖ, Ab)`: §1.2, pp. 1644–1645;
  §1.3, pp. 1645–1646; §1.4, pp. 1646–1648; §2.1, p. 1648; §2.2, pp. 1649–1651; §2.3, p. 1651; §3.2,
  p. 1655.
- [CE] H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton Univ. Press (1956). Ch. VI, §5:
  Prop. 5.1, Prop. 5.3 and remark, pp. 120–121; Exer. 3, 5, 6, pp. 122–123.
- [Chase 1960] S. U. Chase, *Direct products of modules*, Trans. Amer. Math. Soc. 97 (1960),
  457–473. Prop. 2.2 (crediting Villamayor), Cor., and Prop. 2.3, pp. 458–459 (right modules).
- [CI] M. Cortés-Izurdiaga, *Flatness in finitely accessible additive categories*,
  arXiv:2505.07742v1. §5, Def. 5.2 and Prop. 5.3, p. 21.
- [CPT] S. Crivei, M. Prest, B. Torrecillas, *Covers in finitely accessible categories*, Proc. Amer.
  Math. Soc. 138 (2010), 1213–1221. pp. 1214, 1218; Cor. 3.3, p. 1218.
- [Eilenberg 1956] S. Eilenberg, *Homological dimension and syzygies*, Ann. of Math. (2) 64 (1956),
  328–336. pp. 328–333, especially Prop. 10 and Thm. 11, p. 333 (graded left modules; minimal
  epimorphisms over semiprimary rings credited to Eilenberg–Nakayama, Nagoya Math. J. 11 (1957),
  p. 9).
- [Fisher] J. L. Fisher, *The tensor product of functors, satellites, and derived functors*,
  J. Algebra 8 (1968), 277–294. Prop. 1.3, Thm. 1.4, pp. 279–280; Thm. 2.4, p. 284; Cor. 2.9, p. 285
  (covariant, applied to `Cᵒᵖ`).
- [Fisher-Nil] J. W. Fisher, *Nil subrings of endomorphism rings of modules*, Proc. Amer. Math. Soc.
  34 (1972), 75–78. Lemmas 1.1–1.3, pp. 75–76; Thm. 1.5, pp. 76–77; Thm. 2.1 (credited to L. Small),
  p. 77 (left-acting endomorphisms, matching Mathlib's product order).
- [Govorov] V. E. Govorov, *On flat modules*, Sibirsk. Mat. Zh. 6 (1965), 300–304.
- [Harada] M. Harada, *Perfect categories I*, Osaka J. Math. 10 (1973), 329–341. Thms. 3–4
  (contravariant), pp. 337–338; Thm. 5 (covariant, with dual remark) and Remark 1 (non-unital
  category ring), pp. 339–340.
- [Ho] M. Hoshino, *On dominant dimension of Noetherian rings*, Osaka J. Math. 26 (1989), 275–280.
  Theorem, p. 275.
- [Jategaonkar] A. V. Jategaonkar, *A counter-example in ring theory and homological algebra*,
  J. Algebra 12 (1969), 418–440. Thm. 4.10, pp. 438–439.
- [Jensen] C. U. Jensen, *On homological dimensions of rings with countably generated ideals*,
  Math. Scand. 18 (1966), 97–105. Lemma 2, pp. 98–100; Thm. 1, p. 100.
- [JL] C. U. Jensen, H. Lenzing, *Model Theoretic Algebra*, Gordon and Breach (1989). Thms. B.12 and
  B.14, pp. 387–388 (covariant functors).
- [Krause] H. Krause, *Krull-Schmidt categories and projective covers*, Expo. Math. 33 (2015),
  535–549 (arXiv:1410.2822). Lemma 3.6, p. 542; Prop. 4.1, pp. 544–545 (right modules); Cor. 4.4,
  p. 546.
- [Krause-Defect] H. Krause, *A short proof for Auslander's defect formula*, Linear Algebra Appl.
  365 (2003), 267–270. Theorem and proof, pp. 268–269.
- [Krause-FlatCovers] H. Krause, *Morphisms determined by objects and flat covers*, Forum Math. 28
  (2016), 425–435 (arXiv:1403.6039v2, Thms. 1.1, 2.2; pointer).
- [Krause-Smashing] H. Krause, *Smashing subcategories and the telescope conjecture — an algebraic
  approach*, Invent. Math. 139 (2000), 99–133. §2.3 and Lemma 2.7, p. 115.
- [Lam-FC] T. Y. Lam, *A First Course in Noncommutative Rings*, 1st ed., GTM 131, Springer (1991).
  (4.14), pp. 57–58, and (4.23)–(4.24), pp. 65–66 (left modules); §§23–24 (right modules, applied to
  `Aᵐᵒᵖ`): (23.6) p. 347, (23.8) p. 348, (23.11) p. 350, (23.13)–(23.16) pp. 351–352, (23.19)
  p. 353, (23.22) p. 356, (23.24) p. 357, (24.7) p. 360, (24.12) p. 362, (24.16) p. 364,
  (24.18)–(24.20) p. 365, (24.23)–(24.24) pp. 367–368, (24.25) pp. 369–370.
- [Lam-LMR] T. Y. Lam, *Lectures on Modules and Rings*, GTM 189, Springer (1999) (right modules,
  applied to `Aᵐᵒᵖ`). §2F and (2.33), pp. 45–47; (4.9), (4.12)–(4.14), pp. 125–126; (4.21)–(4.24),
  pp. 128–130; (4.30), (4.32)–(4.34), pp. 133–134; (5.57)–(5.59), (5.62b), (5.63), pp. 184–185;
  (5.69)–(5.71), pp. 187–188; §18, pp. 475–490 (Morita equivalence).
- [Lambek] J. Lambek, *A module is flat if and only if its character module is injective*, Canad.
  Math. Bull. 7 (1964), 237–243. Theorem, p. 239; Prop. 1 and `Tor`–`Ext` formula, p. 241.
- [Lazard] D. Lazard, *Autour de la platitude*, Bull. Soc. Math. France 97 (1969), 81–128. Ch. I:
  Lemme 1.1, Thm. 1.2, p. 84; Cor. 1.3–1.4, p. 85.
- [Mares] E. A. Mares, *Semi-perfect modules*, Math. Z. 82 (1963), 347–360. Thm. 2.4, proof step
  (i), p. 349.
- [ML] S. Mac Lane, *Categories for the Working Mathematician*, 2nd ed., GTM 5, Springer (1998).
  IX.6, pp. 226–227 (covariant left modules on `SingleObj R`, contravariant factor first).
- [Mitchell] B. Mitchell, *Rings with several objects*, Adv. Math. 8 (1972), 1–161 (covariant in
  §§3, 7, 9, 11, contravariant in §10). §1, p. 12; §2, pp. 13–14; §3, Thm. 3.1, pp. 15–18; §6,
  Thm. 6.1, pp. 24–27, 32; §7, pp. 33–38 (Thm. 7.1 and p. 37); §9, pp. 42–45; §10, Prop. 10.1,
  Cor. 10.2, Thm. 10.1b, Cor. 10.4b, pp. 47–50; §11, pp. 50–52; §36, Thm. 36.8, p. 149.
- [Müller] B. J. Müller, *On semi-perfect rings*, Illinois J. Math. 14 (1970), 464–467. §3, p. 465.
- [Nicholson] W. K. Nicholson, *On semiperfect modules*, Canad. Math. Bull. 18 (1975), 77–80.
  Cor. 2, p. 79.
- [OR] U. Oberst, H. Röhrl, *Flat and coherent functors*, J. Algebra 14 (1970), 91–105
  (contravariant flat functors, placed first in `S ⊗_X F`). (1.1), p. 93; Lemma 1.2, p. 94;
  pp. 93–96; Lemma 3.1 and Thm. 3.2, pp. 96–99; Cor. 3.3–3.4, p. 99; Thm. 4.1 (5), p. 101
  (covariant); weak global dimension and Thm. 4.3, pp. 103–104.
- [Osofsky-Card] B. L. Osofsky, *Homological dimension and cardinality*, Trans. Amer. Math. Soc.
  151 (1970), 641–649. p. 641; Thm. A, p. 644.
- [Osofsky-Nagoya] B. L. Osofsky, *Upper bounds on homological dimensions*, Nagoya Math. J. 32
  (1968), 315–322. Lemma 1.2, Thm. 1.3, pp. 316–317; Cor. 1.4, p. 318.
- [Pierce] R. S. Pierce, *The global dimension of Boolean rings*, J. Algebra 7 (1967), 91–99.
  Cor. 2.2, p. 92; Thm. 5.1, Cor. 5.2, pp. 96–97.
- [Rump] W. Rump, *Flat covers in abelian and in non-abelian categories*, Adv. Math. 225 (2010),
  1589–1615. §5, Thm. 2, Cor. 2, pp. 1603–1604 (pointer).
- [Sandomierski] F. L. Sandomierski, *On semiperfect and perfect rings*, Proc. Amer. Math. Soc. 21
  (1969), 205–207 (right modules). Prop. 1 (d), Lemma 2, p. 205 (citing K. Koh, Proc. Amer. Math.
  Soc. 19 (1968), Thm. 2, p. 205: Koh's "semiprimary" means only that `R ⧸ J` is Artinian, following
  Jacobson's terminology; together with the stated lifting of idempotents, this is semiperfectness
  in the terminology used here, while Koh's Thm. 1 is the noncommutative form under weaker lifting);
  Thms. 4–5, pp. 206–207.
- [Small] L. W. Small, *An example in Noetherian rings*, Proc. Nat. Acad. Sci. U.S.A. 54 (1965),
  1035–1036. Thm., p. 1035; p. 1036.
- [Simson] D. Simson, *On pure global dimension of locally finitely presented Grothendieck
  categories*, Fund. Math. 96 (1977), 91–116 (covariant functors, applied to `Cᵒᵖ`, except Thm. 2.1
  (b)). §1, Prop. 1.2, Cor. 1.3 (a), pp. 92–94; Thm. 2.1 (b), p. 95; Thm. 2.12 (c), p. 98; Def. 3.1,
  p. 99; Lemma 5.3, Thm. 5.4, pp. 108–110; Thm. 5.6, p. 110.
- [Stacks] The Stacks Project authors, *The Stacks Project*, Tag 058D.
- [St] B. Stenström, *Purity in functor categories*, J. Algebra 8 (1968), 352–361 (contravariant).
  §2, Lemmas 7–8, pp. 353–354; Thm. 1, pp. 355–356; Thm. 3, pp. 357–358; Thm. 4, p. 359.
- [Weibel] C. A. Weibel, *An Introduction to Homological Algebra*, CSAM 38, Cambridge Univ. Press
  (1994). Thm. 2.7.2 and Acyclic Assembly Lemma 2.7.3, pp. 58–61; Exer. 3.1.3, p. 68.
- [Wisbauer] R. Wisbauer, *Foundations of Module and Ring Theory*, Gordon and Breach (1991). 18.5
  (1), p. 152; 19.7, p. 161; 36.3 and 36.4 (1), p. 306.
- [Xi] C. Xi, *Frobenius bimodules and flat-dominant dimensions*, Sci. China Math. 64 (2021), 33–44
  (arXiv:1903.07921v1). §1, p. 34 (citing [Ho] for symmetry over Noetherian rings).
