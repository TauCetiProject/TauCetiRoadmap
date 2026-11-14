# Roadmap: Ocneanu rigidity

## Summary

A fusion category of nonzero global dimension over an algebraically closed field cannot be
deformed. Its Davydov–Yetter cohomology vanishes in positive degrees, with coefficients in the
centre of any tensor functor out of it ([ENO] Theorem 2.27; [GHS] Corollary 3.18). Consequently:

- its F-symbols, its R-symbols and the associators of its module categories have no deformations
  over Artinian local rings or `k⟦t⟧`;
- there are finitely many such fusion categories with given fusion rules ([ENO] Theorem 2.28);
- each has finitely many braidings ([ENO] Remark 2.33);
- each has finitely many module categories of each rank, and finitely many indecomposable ones
  ([ENO] Corollary 2.35);
- each is defined over the algebraic closure of the prime field.

In characteristic zero the global dimension is never zero ([PivotalSpherical](../PivotalSpherical/README.md)
target 6.9), so these statements hold for every fusion category there. This roadmap builds:

- the centre of a tensor functor, its induction and coinduction, and the averaging identity
  (Layer 1);
- comonad cohomology, from the augmented comonad resolution (Layer 2);
- Davydov–Yetter cohomology with coefficients and its comparison with comonad cohomology
  (Layer 3), and the vanishing theorem (Layer 4);
- formal rigidity of F-symbols and R-symbols (Layer 5), and presentations and formal rigidity of
  module categories (Layer 6);
- representability of the symbol functors and an orbit-counting lemma (Layer 7);
- the finiteness theorems and fields of definition (Layer 8), and their characteristic-zero forms
  (Layer 9).

Suggested home: `TauCeti/CategoryTheory/Monoidal/DavydovYetter/` for Layers 0 to 4,
`TauCeti/CategoryTheory/Monoidal/Ocneanu/` for Layers 5, 6, 8 and 9,
`TauCeti/AlgebraicGeometry/GroupAction/FiniteOrbits.lean` for Layer 7.

## Scope and ownership

- **Generality.** Fusion categories (simple unit), braided fusion categories, and semisimple
  module categories with split simples over fusion categories, over an algebraically closed field
  `k` of any characteristic. The core hypothesis is that the global dimension is nonzero; Layer 9
  removes it in characteristic zero. Rings enter only in the deformation layers, as the Artinian
  coefficient category `C_k` and `k⟦t⟧`.
- **Owned here.** Everything in the Summary. In particular: the centre `RelCenter F` of a
  non-unitary tensor functor and its induction functors; comonad cohomology; Davydov–Yetter
  cohomology; presentations of module categories by symbols; the orbit-counting lemma.
- **Not owned here.**
  - [PivotalSpherical](../PivotalSpherical/README.md) owns the fusion infrastructure: finite
    semisimple categories, simple classes, fusion coefficients, Perron–Frobenius, the squared norm
    and the global dimension without a pivotal structure (6.1, 6.2), the Radford isomorphism and
    the pivotalization (6.4 to 6.8), nonvanishing of the global dimension in characteristic zero
    (6.9), and the induction functor of the absolute centre with its averaging identity (11.1,
    11.2).
  - [PresentationsOfMonoidalCategories](../PresentationsOfMonoidalCategories/README.md) owns
    `FSymbols`, `RSymbols`, `Model P`, gauge, extraction and classification.
  - [CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md) CA6 owns the unitary
    relative centre. Target 1.3 here compares the two.
  - [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §4.2 owns the Artinian
    coefficient category and small extensions.
- **Excluded.** Multifusion categories; non-semisimple finite tensor categories, where
  Davydov–Yetter cohomology can be nonzero ([GHS] §5); counting tensor functors between two fixed
  fusion categories ([ENO] Theorem 2.31); bimodule categories and Morita theory; weak Hopf
  algebras; unitary structures.

## Conventions

- **Fusion hypotheses.** "`C` is fusion over `k`" means the instance list of PivotalSpherical
  Layer 4: `[Field k] [IsAlgClosed k] [Abelian C] [Linear k C] [MonoidalCategory C]
  [MonoidalPreadditive C] [MonoidalLinear k C] [RigidCategory C] [IsFiniteSemisimpleCategory C]
  [Fintype (SimpleClasses C)] [Simple (𝟙_ C)] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]`, as
  instance arguments, not bundled. Scalars `𝟙_ C ⟶ 𝟙_ C` are read in `k` through
  `TauCeti.endAlgEquivOfSimple k (𝟙_ C)`.
- **Separable.** `C` is separable when `normGlobalDim C a ≠ 0`, with `normGlobalDim` the
  squared-norm global dimension of PivotalSpherical 6.2. It takes a family
  `a : ∀ S : SimpleClasses C, S.repr ≅ (S.reprᘁ)ᘁ`, and its value does not depend on `a`
  (PivotalSpherical 6.1). Below, `normGlobalDim C` abbreviates `normGlobalDim C a` for any such
  family. This is a hypothesis on theorems, not a class.
- **Duals.** Right duals are primary: `η_ X Xᘁ : 𝟙_ C ⟶ X ⊗ Xᘁ`, `ε_ X Xᘁ : Xᘁ ⊗ X ⟶ 𝟙_ C`,
  `fᘁ` the right adjoint mate. The image of an exact pairing under a monoidal functor is
  `CategoryTheory.Functor.mapExactPairing`.
- **Centre of a functor.** For a monoidal functor `F : C ⥤ D`, a half-braiding relative to `F` on
  `X : D` is a natural family `β Y : X ⊗ F.obj Y ≅ F.obj Y ⊗ X`, in the direction of Mathlib's
  `HalfBraiding`, compatible with `F`'s tensorator `μ` and unit as in [GHS] (3.7) and (3.9).
- **Tensor powers.** `tensorFun F n : (Fin n → C) ⥤ D` sends `(X₀, …, X_{n−1})` to
  `F X₀ ⊗ (F X₁ ⊗ (⋯ ⊗ F X_{n−1}))`, right-nested, with `tensorFun F 0 = 𝟙_ D`.
- **Davydov–Yetter cochains** ([GHS] Definition 3.3, (3.10)–(3.12)). For `X Y : RelCenter F` the
  `n`-cochains are the natural transformations
  `tensorFun F n ⋙ tensorLeft X.1 ⟶ tensorFun F n ⋙ tensorRight Y.1`. The differential of `f`
  at `(X₀, …, Xₙ)` is
  `(F X₀ ◁ f_{X₁…Xₙ}) ∘ (β^X_{X₀} ▷ …) + ∑_{i=1}^{n} (−1)^i f_{X₀,…,X_{i−1}⊗X_i,…,Xₙ}
  + (−1)^{n+1} (… ◁ β^Y_{Xₙ}) ∘ (f_{X₀…X_{n−1}} ▷ F Xₙ)`. The middle terms identify
  `F X_{i−1} ⊗ F X_i` with `F (X_{i−1} ⊗ X_i)` through `μ` and rebracket by `D`'s associators. In
  degree `0` the cochains are `X.1 ⟶ Y.1` and the differential is
  `f ↦ (F X₀ ◁ f) ∘ β^X_{X₀} − β^Y_{X₀} ∘ (f ▷ F X₀)`. Trivial coefficients mean
  `X = Y = 𝟙_ (RelCenter F)`.
- **Comonad cochains.** For a comonad `G` on a `k`-linear category and objects `X`, `Y`, the
  complex has `Hom (G^{n+1} X, Y)` in degree `n`: `Hom (-, Y)` applied to the augmented resolution
  of target 2.1, then Mathlib's `alternatingCofaceMapComplex`.
- **Artinian algebras.** An Artinian `k`-algebra means an object `A` of the Artinian coefficient
  category `C_k` of SchemeAndStackFoundations §4.2 (with `Λ = k`), with residue map
  `π : A →ₐ[k] k`. A lift of `P : FSymbols k N` to `A` is `Q : FSymbols A N` with `Q.map π = P`;
  the constant lift is `P.map (algebraMap k A)`.
- **Skeletal conventions** (fusion bases, `F`, `R`, gauges, duality scalars `s_a`, the pentagon)
  are those of PresentationsOfMonoidalCategories, unchanged; Layer 6 extends them to module
  categories.

**Checks.**

- For `F = 𝟭 Vec` and scalar cochains, `δ⁰ = 0`, `δ¹ = id` and `δ² = 0` on the one-dimensional
  cochain spaces, so `δ ≫ δ = 0`.
- Over `Vec(C₂)` with coefficients the unit object with the trivial and the sign half-braiding,
  `δ⁰(1)` at the generator is `1 − (−1) = 2`: the degree-0 differential detects that `1` is not an
  intertwiner.
- For the identity comonad on `Vec`, `X = Y = k`: every cochain space is `k`, and the
  differentials alternate `0, id, 0, …`.

## Exact supplier contracts

### From Mathlib

- Monoidal: `MonoidalCategory`, `MonoidalPreadditive`, `MonoidalLinear`, `RigidCategory`,
  `ExactPairing`, `Functor.Monoidal`, `NatTrans.IsMonoidal`, `BraidedCategory`,
  `MonoidalOpposite` (`Cᴹᵒᵖ`), `Center`, `HalfBraiding`, `Center.forget`, `Center.ofBraided`,
  `MonoidalLeftAction`, `curriedActionMop`, `Functor.LeftLinear`, `Functor.pi`.
- Homological: `Comonad`, `Adjunction.toComonad`, `SimplicialObject.Augmented.ExtraDegeneracy`
  and `ExtraDegeneracy.homotopyEquiv` (`Mathlib/AlgebraicTopology/ExtraDegeneracy.lean`),
  `alternatingCofaceMapComplex`, `HomologicalComplex.homology`.
- Commutative algebra: `Ideal.iInf_pow_eq_bot_of_isLocalRing` (Krull intersection),
  `PrimeSpectrum.isConstructible_comap_image` (Chevalley),
  `NoetherianSpace.finite_irreducibleComponents`, `isJacobsonRing_of_finiteType`,
  `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` (Nullstellensatz), `PowerSeries`.

### From Tau Ceti

Each item is implemented at the pin.

- Fusion: `TauCeti.IsFiniteSemisimpleCategory`, `TauCeti.natTrans_ext_of_simple`
  (`CategoryTheory/Semisimple/Basic.lean`), `TauCeti.SimpleClasses`, `TauCeti.fusionCoeff`,
  `TauCeti.endAlgEquivOfSimple` (`CategoryTheory/Preadditive/Schur.lean`),
  `TauCeti.nonempty_iso_rightDual_rightDual` (`CategoryTheory/Semisimple/Rigid.lean`),
  `TauCeti.doubleRightDualFunctor`, `TauCeti.globalDim`, `TauCeti.globalDim_ne_zero`.
- Duals along functors: `CategoryTheory.Functor.mapExactPairing`
  (`CategoryTheory/Monoidal/Rigid/Functor.lean`).
- The centre: `CategoryTheory.Center.instAbelian`, `Center.rigidCategory`, `Center.pivotalCategory`.
- Module objects: `Monoidal/Mod/InternalHom.lean`, `Monoidal/Mod/Closed.lean`.
- Group schemes and orbits: `GeneralLinear.coordinateHopfAlgebra`, `GeneralLinear.groupScheme`;
  `TauCeti.isConstructible_orbit` and `TauCeti.isLocallyClosed_orbit`
  (`AlgebraicGeometry/GroupAction/LocallyClosed.lean`), for a group object `G` in `Over S` acting
  by `ModObj G X`; `TauCeti.IsConstructible.dense_interior` (`Topology/Constructible/Basic.lean`).

### From other roadmaps, as targets

- PivotalSpherical: 6.1 `squaredNorm`, 6.2 `normGlobalDim` and `normGlobalDim_eq_globalDim`, 6.9
  `normGlobalDim_ne_zero` in characteristic zero, 11.1 the induction functor `I` of the absolute
  centre, 11.2 its averaging identity.
- PresentationsOfMonoidalCategories: Layers 0 to 5 (`FSymbols`, `RSymbols`, `map`, `reindex`,
  `Model`, `IsSplitSimpleBasis`, extraction and reconstruction, the gauge group and the
  classification, the rigidity criterion), and Layer 6 (`(simple a)ᘁᘁ = simple a`).
- SchemeAndStackFoundations §4.2: the Artinian coefficient category `C_Λ`, dual numbers, small
  extensions.
- CategoricalOperatorAlgebras CA6: the unitary relative centre.

## How to read the build

Each layer lists numbered targets. A target's *Needs:* clause names what it uses beyond the
supplier contracts; targets of the same layer are listed in dependency order. Every layer ends
with Checks, to be formalised as `example`s.

## Layer 0: preliminaries

**0.1 Tensor powers of a functor.** For `F : C ⥤ D` monoidal, `tensorFun F n` as in the
conventions, with the isomorphisms `tensorFun F (n+1) ≅ F ⊗ tensorFun F n` and the merge
isomorphisms identifying the component at `(…, X_{i−1} ⊗ X_i, …)` with a restriction of
`tensorFun F (n+1)` through `μ`. It is `k`-linear in each variable when `F` is. *Needs:* Mathlib
`Functor.pi`.

**0.2 Natural transformations on semisimple products.** Let `C₀, …, C_{n−1}` be abelian, finite
semisimple and `k`-linear with split simples, and `Φ Ψ : (∀ i, C_i) ⥤ D` be `k`-linear in each
variable. Restriction to tuples of `SimpleClasses` representatives is a `k`-linear equivalence
`(Φ ⟶ Ψ) ≃ₗ[k] ∏ s, (Φ.obj (repr ∘ s) ⟶ Ψ.obj (repr ∘ s))`. Linearity, not just additivity, is
needed. Corollary: Davydov–Yetter cochain spaces are finite-dimensional when `D` is Hom-finite.
*Needs:* Tau Ceti `natTrans_ext_of_simple`.

**0.3 Linear endofunctors.** For a `k`-linear category `M` with finite biproducts, `LinearEnd k M`
is the full subcategory of `M ⥤ M` on additive `k`-linear functors, with `Φ ⊗ Ψ := Ψ ⋙ Φ` (the
reverse of Mathlib's `endofunctorMonoidalCategory`, so that a left action is monoidal into it).
Instances: `MonoidalCategory`, `Preadditive`, `Linear k`, `MonoidalPreadditive`,
`MonoidalLinear k`, `HasFiniteBiproducts`.

**0.4 The action functor.** A `MonoidalLeftAction C M`, `k`-linear in each variable, gives a
`k`-linear monoidal functor `actionFunctor : C ⥤ LinearEnd k M`, `X ↦ (X ⊙ -)`, corresponding to
Mathlib's `curriedActionMop`. *Needs:* 0.3.

**Checks.**

- 0.1: in `Vec` with `F = 𝟭`, objects of dimensions `2, 3`: `tensorFun` in arities `0, 1, 2` has
  dimensions `1, 2, 6`; merging is `(2·3)·4 = 2·(3·4)`; linearity in a slot is
  `(2 + 3)·4 = 2·4 + 3·4`.
- 0.2: for `Φ = Ψ = tensorFun (𝟭 Vec) 2` the natural endomorphisms form `k`, one simple tuple.
  For the real rotation representation `V` of `C₃` over `ℝ`, `dim End V = 2`: the split hypothesis
  excludes it. A Frobenius-twisted functor shows that additivity alone is not enough.
- 0.3: in `Vec × Vec`, with `Φ` the swap and `Ψ (V, W) = (V, 0)`, `Φ ⊗ Ψ` sends `(k, 0)` to
  `(0, k)` while `Ψ ⊗ Φ` sends it to `(0, 0)`, so the tensor order is detected. `(id ⊕ id) k = k²`.
- 0.4: `Vec(C₂)` acting on itself: `g` acts by the swap and `g²` by the identity, and
  `actionFunctor` sends `μ` to the canonical isomorphism.

## Layer 1: the centre of a tensor functor

Fix `C` fusion over `k`, and `D` a `k`-linear monoidal category: `[Preadditive D] [Linear k D]
[MonoidalCategory D] [MonoidalPreadditive D] [MonoidalLinear k D] [HasFiniteBiproducts D]`. Fix
`F : C ⥤ D` monoidal, additive and `k`-linear. `D` need not be rigid or abelian. This generality
extends [GHS], whose targets are tensor categories; the argument uses only the duals of the
objects `F X`.

**1.1 The relative centre** ([GHS] Definitions 3.1, 3.2, arXiv:1910.06094v2 p. 13).
`RelHalfBraiding F X` as in the conventions, and `RelCenter F := Σ X : D, RelHalfBraiding F X`,
with morphisms commuting with the half-braidings. Its monoidal structure, the faithful monoidal
functor `RelCenter.forget F`, and `Preadditive`, `Linear k`, `HasFiniteBiproducts`.

**1.2 Functoriality.** `RelCenter.idEquiv : RelCenter (𝟭 C) ≌ Center C`, monoidal, identifying
half-braidings. `RelCenter.map F : Center C ⥤ RelCenter F`, sending `(X, β)` to `(F X, F β)`
transported along `μ`, monoidal. *Needs:* 1.1.

**1.3 Comparison with the unitary relative centre.** For a dagger tensor functor `F` between
C*-tensor categories, CategoricalOperatorAlgebras CA6's unitary relative centre is equivalent, as
a monoidal category, to the full subcategory of `RelCenter F` on unitary half-braidings. *Needs:*
1.1; CategoricalOperatorAlgebras CA6.

**1.4 Induction.** `RelCenter.induction F : D ⥤ RelCenter F`, with underlying object
`⨁ S : SimpleClasses C, F S.repr ⊗ V ⊗ F (S.reprᘁ)` and half-braiding as in PivotalSpherical 11.1
with `F` inserted, using `Functor.mapExactPairing`. It is the right adjoint of `forget F`:
`forgetInductionAdjunction F`, whose counit is the projection onto the `𝟙`-summand. At `F = 𝟭 C`,
through `idEquiv`, it is PivotalSpherical 11.1's `I`. `F ⋙ induction F ≅ I ⋙ RelCenter.map F`.
*Needs:* 1.2; PivotalSpherical 11.1.

**1.5 Coinduction** ([GHS] (3.14), p. 15). `RelCenter.coinduction F : D ⥤ RelCenter F`, with
underlying object `⨁ S, F S.repr ⊗ V ⊗ F (ᘁS.repr)`, the finite-biproduct form of the coend
`∫^X F(X) ⊗ V ⊗ F(ᘁX)`, with half-braiding from the left pairings `(ᘁS, S)`. It is the left
adjoint of `forget F`: `coinductionForgetAdjunction F`, with unit the inclusion of the
`𝟙`-summand and counit assembled from the half-braiding and the evaluations of the left pairings.
Neither adjunction involves a choice. *Needs:* 1.2.

**1.6 Comparing the two.** For each simple `T` choose `a_T : T ≅ Tᘁᘁ`; its mate gives
`ᘁT ≅ Tᘁ`. `θ : coinduction F ≅ induction F` is `(doubleDualTrace a_T)⁻¹ •` the image of that mate on
the `T`-summand, with `doubleDualTrace` from PivotalSpherical 6.1. It is a morphism in `RelCenter F`
and does not depend on the choices. *Needs:* 1.4, 1.5; PivotalSpherical 6.1.

**1.7 The averaging identity.** For every `Z : RelCenter F`,
`(forgetInductionAdjunction F).unit.app Z ≫ θ.inv.app (forget F Z) ≫
(coinductionForgetAdjunction F).counit.app Z = normGlobalDim C • 𝟙 Z`. The `S`-summand
contributes `squaredNorm S`, with no pivotal structure. This is not stated in the sources; the
computation is that of [EGNO] Lemma 9.3.1 and the proof of Theorem 9.3.2 (p. 279), and at
`F = 𝟭 C` the statement is PivotalSpherical 11.2. *Needs:* 1.6; PivotalSpherical 6.2.

**1.8 The central comonad and relative projectivity** ([GHS] Definition 2.4, p. 7).
`RelCenter.comonad F := (coinductionForgetAdjunction F).toComonad`, with underlying functor
`forget F ⋙ coinduction F`. An object `X` is `G`-projective when the counit `G X ⟶ X` has a
section. If `C` is separable, every `Z : RelCenter F` is `RelCenter.comonad F`-projective, with
section `(normGlobalDim C)⁻¹ • ((forgetInductionAdjunction F).unit.app Z ≫ θ.inv.app (forget F Z))`.
*Needs:* 1.7.

**Checks.**

- 1.1: over `Vec(C₂)` with `F` the forgetful functor to `Vec`, the unit object with the trivial
  and the sign characters are two objects of `RelCenter F`; their tensor product has character
  `(−1)(−1) = +1`; and `Hom` between the two is `0`, since an intertwiner satisfies `f = −f`.
- 1.2: `Center (Vec(C₂))` over `ℂ` has four simple classes, as does `RelCenter (𝟭 Vec(C₂))`;
  `RelCenter.map` along the forgetful functor keeps the characters `±1`.
- 1.4 and 1.5: for `C = Vec(C₂)`, `F` forgetful and `V = k`, both underlying objects have
  dimension `2`, one summand per group element. `dim F (I k) = dim induction F (F k) = 2`.
- 1.6: for a pointed simple with `a = 3 • 𝟙`, the mate factor `3` and the trace factor `1/3`
  give `θ = 1`, as for `a = 𝟙`.
- 1.7: `FDRep ℂ S₃`, `F = 𝟭`, `Z = 𝟙`: the summands contribute `1, 1, 4` and the composite is
  `6 • 𝟙`. `C = Vec`: the composite is `1`.
- 1.8: `Vec(Q₈)` in characteristic `3`: the composite is `8 = 2` and the section factor is `2`,
  with `2 · 2 = 1`. `Vec(C₂)` in characteristic `2`: the composite is `0`, and the counit of the
  comonad at `𝟙` has no section.

## Layer 2: comonad cohomology

For a comonad `G` on a `k`-linear category `𝒵` and objects `X Y : 𝒵`. Independent of Layers 0
and 1.

**2.1 The augmented resolution** ([BB] §1). `Comonad.resolution G X : SimplicialObject.Augmented
𝒵` with `G^{n+1} X` in degree `n` and augmentation `ε : G X ⟶ X`. The face `d_i` applies the
counit at position `i`; the degeneracy `s_i` applies the comultiplication at position `i`. Prove
the simplicial identities and functoriality in `X`. *Needs:* Mathlib `Comonad`,
`SimplicialObject.Augmented`.

**2.2 Free objects.** For `X = G W`, the comultiplication at `W` gives an `ExtraDegeneracy` of
`Comonad.resolution G (G W)`. *Needs:* 2.1.

**2.3 Extra codegeneracies.** The cosimplicial dual of Mathlib's `ExtraDegeneracy`: an extra
codegeneracy on an augmented cosimplicial object in a preadditive category gives a homotopy
equivalence between its alternating coface complex and the augmentation in degree `0`.
*Needs:* Mathlib `ExtraDegeneracy.homotopyEquiv`.

**2.4 The cochain complex.** `Comonad.cochainComplex G X Y : CochainComplex (ModuleCat k) ℕ`, as
in the conventions, with its augmentation from `Hom (X, Y)`. It is contravariant in `X` and
covariant in `Y`. *Needs:* 2.1.

**2.5 Vanishing** ([GHS] Proposition 2.12, p. 10; [BB] §4). If `X` is `G`-projective, the
augmented cochain complex is exact: `H^0 ≅ Hom (X, Y)` and `H^n = 0` for `n ≥ 1`. The proof makes
`X` a retract of `G X` and uses 2.2, 2.3 and functoriality. *Needs:* 2.2, 2.3, 2.4.

**Checks.**

- 2.1: for `G = 𝟭` every face and degeneracy is the identity and the augmentation is `𝟙`.
- 2.2: for `G = 𝟭`, `X = k`, the extra degeneracy is the identity and gives `dh + hd = 1` on the
  augmented complex `k → k → k → ⋯` with differentials `1, 0, 1, …`.
- 2.4: for `G = 𝟭`, `X = Y = k`, precomposition with `2 • 𝟙` multiplies every cochain by `2` and
  commutes with the differential.
- 2.5: for `G = 𝟭`, `H^0 = k` and `H^n = 0` for `n ≥ 1`. For the Sweedler algebra `H₄` with the
  comonad of its centre, `dim H²_DY = 1` ([GHS] §5): the trivial coefficient is not projective
  there.

## Layer 3: Davydov–Yetter cohomology

Keep the hypotheses of Layer 1, and let `X Y : RelCenter F`.

**3.1 The complex** ([GHS] Definition 3.3, p. 14). `DYComplex F X Y : CochainComplex (ModuleCat
k) ℕ` with the cochains and differential of the conventions, and
`DYCohomology F X Y n := (DYComplex F X Y).homology n`. `δ ≫ δ = 0` for any monoidal functor
between monoidal categories. Write `DYComplex F` for trivial coefficients and `DYComplex C` for
`F = 𝟭 C`. *Needs:* 0.1, 1.1.

**3.2 Functoriality.** Morphisms of `RelCenter F` act on coefficients; a monoidal natural
isomorphism `F ≅ F'` and a monoidal equivalence `C ≌ C'` induce isomorphisms of complexes.
*Needs:* 3.1.

**3.3 Low degrees** ([GHS] Remark 3.7, p. 15). For trivial coefficients and `End (𝟙_ D) = k` (for
example `F = 𝟭 C`), the degree-0 differential vanishes, and `DYCohomology F 1` is the space of
derivations: natural `θ : F ⟶ F` with `θ_{X⊗Y} ∘ μ = μ ∘ (θ_X ▷ F Y + F X ◁ θ_Y)`. In general it is
derivations modulo inner derivations. *Needs:* 3.1.

**3.4 Comparison** ([GHS] Theorem 3.11, pp. 18–19, and §3.4). For `C` fusion,
`DYComplex F X Y ≅ Comonad.cochainComplex (RelCenter.comonad F) X Y`. In degree `n` it composes
the adjunction isomorphisms of `coinductionForgetAdjunction F` with 0.2.
`(forget F ⋙ coinduction F)^n` has underlying object
`⨁_{S₁…Sₙ} F Sₙ ⊗ ⋯ ⊗ F S₁ ⊗ X ⊗ F (ᘁS₁) ⊗ ⋯ ⊗ F (ᘁSₙ)`, and the left pairings identify maps out
of it with cochains, with no choices. Verifying that the differentials agree is the content.
*Needs:* 0.2, 1.8, 2.4, 3.1.

**Checks.**

- 3.1: for the trivial group and scalar cochains, `δ¹ ∘ δ⁰ = 0` and `δ² ∘ δ¹ = 0`.
- 3.3: `Vec(C₃)` in characteristic `3` with `θ(g) = 1`: `δθ(g,g) = 1 − 2 + 1 = 0`, a nonzero
  derivation. For `actionFunctor` of `Vec(C₂)` on `Vec × Vec`, `End (𝟙_ D) = k²` and `f = (1, 0)`
  has `δ⁰ f ≠ 0`.
- 3.4: `Vec(C₂)` over `ℂ`, trivial coefficients: both complexes have dimensions `1, 2, 4` in
  degrees `0, 1, 2`.

## Layer 4: the vanishing theorem

**4.1 Ocneanu rigidity, cohomological form** ([ENO] Theorem 2.27, arXiv:math/0203060v11 p. 9;
[GHS] Corollary 3.18, p. 25). Let `C` be fusion over `k` and separable, and `D`, `F` as in Layer
1. Then `DYCohomology F X Y n = 0` for all `X Y : RelCenter F` and `n ≥ 1`. *Needs:* 1.8, 2.5,
3.4.

**4.2 Specializations**, each a named theorem: `DYCohomology C n = 0` for `n ≥ 1`;
`DYCohomology F n = 0` for every `k`-linear monoidal `F : C ⥤ D`; the cohomology of `actionFunctor`
for a `k`-linear left module category `M` with finite biproducts vanishes in positive degrees;
`DYCohomology (𝟭 C) X X 1 = 0` for `X = idEquiv.inverse (Center.ofBraided Y)` when `C` is braided.
*Needs:* 0.4, 1.2, 4.1.

**4.3 Sharpness in positive characteristic** ([EGNO] Example 7.22.5, p. 184). For `Vec(ℤ/p)`
over `k` of characteristic `p`, `DYCohomology C 1 ≅ Hom (ℤ/p, k) ≠ 0` and `normGlobalDim = 0`.
*Needs:* 3.3.

**Checks.**

- 4.1: `Vec(S₃)` over `ℂ`: `DYCohomology` is `H^n(S₃, ℂ) = 0` in degrees `1, 2`.
- 4.2: `Vec(C₂)` over `ℂ` with coefficients a simple of the centre: `H¹ = H¹(C₂, ℂ) = 0`.
- 4.3: `Vec(C₂)` over `ℂ` and over the algebraic closure of `𝔽₂`: `H^n = 0` and `H^n = k` for
  `n > 0`, matching `normGlobalDim = 2` and `0`.

## Layer 5: formal rigidity of F-symbols and R-symbols

Fix `P : FSymbols k N` satisfying the rigidity criterion of PresentationsOfMonoidalCategories
Layer 5, so that `Model P` is fusion over `k`, and separable.

**5.1 The skeletal global dimension.** `squaredNorm (Model.simple a) = (s_a s_ā)⁻¹` and
`normGlobalDim (Model P) = ∑ a, (s_a s_ā)⁻¹`. In `Model P`, `(simple a)ᘁᘁ = simple a`
(PresentationsOfMonoidalCategories Layer 6), so take `a = 𝟙`: the two bidual traces are `s_a⁻¹`
and `s_ā⁻¹`. No pivotal structure is used. *Needs:* PivotalSpherical 6.1, 6.2.

**5.2 The F-dictionary.** Let `A ↠ A'` be a surjection in `C_k` whose kernel `I` satisfies
`𝔪_A · I = 0`. For lifts `Q₁ Q₂ : FSymbols A N` of `P` with equal images in `A'`, write
`Q₂.F = (1 + θ) · Q₁.F`; since `𝔪_A · I = 0`, `θ = (Q₂.F − Q₁.F) · P.Finv` with entries in `I`.
Through 0.2 and the left basis of `Hom((a ⊗ b) ⊗ c, d)`, `θ` is a 3-cocycle of `DYComplex
(Model P)` tensored with `I`. For `γ` a 2-cochain tensored with `I`, `θ = −δγ` if and only if
`Q₂ = g • Q₁` with `g^{ab}_c = 1 + γ^{ab}_c`, acting by the gauge formula of
PresentationsOfMonoidalCategories with unconstrained unit components. *Needs:* 0.2, 3.1, 5.1;
SchemeAndStackFoundations §4.2.

**5.3 Normalizing.** A family of units acting by that formula preserves the triangle if and only
if its unit components `g^{ua}_a`, `g^{au}_a` are one constant `c`; dividing by `c` gives a
normalized gauge with the same action, and preserves `g.map π = 1`. *Needs:* 5.2.

**5.4 The R-dictionary.** For `R₁ R₂ : RSymbols (P.map (algebraMap k A))` with equal images in
`A'`, write `R₂ = (1 + β) R₁`. For each `a`, `β` at `a` is a 1-cocycle of `DYComplex (Model P)`
with coefficients `idEquiv.inverse (Center.ofBraided (Model.simple a))` (for the reduction of
`R₁`), tensored with `I`; `hexagon_forward` is exactly `δ¹ = 0`. Coboundaries `δ f`,
`f ∈ End (Model.simple a) ⊗ I = I`, vanish by naturality of the braiding. *Needs:* 3.1, 4.2.

**5.5 Formal rigidity of fusion categories** ([ENO] Theorem 2.28, p. 9; [EGNO] Theorem 9.1.4,
p. 276). For every `A` in `C_k` and every lift `Q` of `P` to `A`, there is a normalized gauge `g`
over `A` with `g.map π = 1` and `Q = g • P.map (algebraMap k A)`. Induction along the
`𝔪_A`-adic filtration, using 5.2, 5.3 and `DYCohomology (Model P) 3 = 0`; units lift.
*Needs:* 4.2, 5.2, 5.3.

**5.6 Formal rigidity of braidings** ([ENO] Remark 2.33, p. 10). For `R : RSymbols P` and every
lift `R'` of `R` to `RSymbols (P.map (algebraMap k A))`, `R' = R.map (algebraMap k A)`. With 5.5:
a lift of `(P, R)` is gauge equivalent to the constant lift. *Needs:* 5.4, 5.5.

**5.7 Power series.** Over `k⟦t⟧`: lifts of `P` are `g • P.map (algebraMap k k⟦t⟧)` with
`g ≡ 1 mod t`, and lifts of `R` are constant, by compatible gauges over `k[t]/(t^n)`. *Needs:*
5.5, 5.6.

**Checks.**

- 5.1: Fibonacci, `s_τ = φ⁻¹`: `squaredNorm τ = φ²` and `normGlobalDim = (5 + √5)/2`. Yang–Lee,
  `s_τ = −φ`: `φ⁻²` and `(5 − √5)/2`. `C₂` with `F^{111}_1 = −1` over `ℂ`: both traces are `−1`
  and the norm is `1`.
- 5.2: over `ℂ[ε]/(ε²)`, take `C₃` with `F = 1` and the normalized `γ` with `γ(1,2) = 1`, zero
  elsewhere. At `(1,1,1)`, `δγ = 1` while `F′/F = 1 − ε`, so `θ = −δγ`; this holds on all `27`
  triples, and `δθ = 0` on all `81` quadruples.
- 5.3: the gauge with every entry `2` has `G_L / G_R = 4/4 = 1`; dividing by `2` gives the trivial
  normalized gauge.
- 5.5: `ι = ℤ/2`, `N_{ab}^c = [a + b = c]`, over `k[ε]/(ε²)`: lifts of `F^{111}_1 = 1` are `1 + cε`
  with `2c = 0` (the pentagon at `(1,1,1,1)`), and normalized gauges fix `F^{111}_1`. For
  `char k ≠ 2` only the constant lift exists; for `char k = 2` the lifts for different `c` are
  pairwise inequivalent, matching `normGlobalDim = 0`.
- 5.6: for `char k ≠ 2`, `R^{11}_0 = ±1 + bε` with `(R^{11}_0)² = 1` forces `b = 0`.
- 5.7: over `ℂ⟦t⟧`, `R ≡ 1` with `R² = 1` gives `(R − 1)(R + 1) = 0` with `R + 1` a unit, so
  `R = 1`.

## Layer 6: module categories

Fix fusion rules `N` on `ι` with unit `u`, `P : FSymbols R N`, and a `Fintype` index `κ`.

**6.1 Data.** `TauCeti.ModuleRules N κ` is `Nm : ι → κ → κ → ℕ` with
`Nm_{u m}^n = if m = n then 1 else 0`. `TauCeti.ModuleSymbols P Nm` holds `M`, `Minv`, both
inverse laws, the module pentagon and the module triangle.
- `M^{a b m}_n : Matrix (Σ c, Fin N_{ab}^c × Fin Nm_{cm}^n) (Σ p, Fin Nm_{bm}^p × Fin Nm_{ap}^n) R`
  is defined by the left and right bases of `Hom((a ⊗ b) ⊙ m, n)` and `Hom(a ⊙ (b ⊙ m), n)`,
  exactly as `F` is.
- The **module pentagon** is the pentagon of PresentationsOfMonoidalCategories with
  `A, B, C ∈ ι` and `D, E, r, s ∈ κ`. In it, `F^{XYZ}_W` becomes `M^{XYZ}_W` whenever `Z ∈ κ`, and
  `N_{XY}^Z` becomes `Nm_{XY}^Z` whenever `Y ∈ κ` (the index sets of `i₃`, `k`, `m`, `n`, `z`). It
  is Mathlib's pentagon for `MonoidalLeftAction`.
- The **module triangle** is `M^{a u m}_n[(a,0,j),(m,0,l)] = if j = l then 1 else 0`.
- `ext` on `M`, `reindex` along `τ : κ ≃ κ'`, `map` along ring maps.

**6.2 The model.** `ModuleSymbols.Model Q` has objects `κ → FintypeCat` and grade-wise `Mat R`
morphisms, `Preadditive`, `Linear R`, finite biproducts, essentially small;
`(X ⊙ Y)_n = Σ a m, X_a × Y_m × Fin Nm_{am}^n`, with `(αₗ_ X Y Z).inv` built from `M` as
`(α_ X Y Z).inv` is built from `F`. **Main theorem:** `MonoidalLeftAction (Model P) (Model Q)`,
`R`-linear in each variable. *Needs:* 6.1; PresentationsOfMonoidalCategories Layer 1.

**6.3 Extraction and reconstruction.** Take `C` as in PresentationsOfMonoidalCategories Layer 2
with a normalized fusion basis, `M` `R`-linear with finite biproducts and a `MonoidalLeftAction
C M` `R`-linear in each variable, `IsSplitSimpleBasis R T` for `T : κ → M`, and a normalized action
basis `φ^{am→n}_i` with `φ^{um→m}_0` the left unitor. Extraction gives `Nm` and a `ModuleSymbols`
over the extracted `P`; reconstruction is an `R`-linear equivalence `Model Q ≌ M` which is a module
functor along `Model P ≌ C`; extracting from `Model Q` returns `Q`. *Needs:* 6.2.

**6.4 Gauge and classification.** A module gauge is a family of units `h^{am}_n` of
`Matrix (Fin Nm_{am}^n) (Fin Nm_{am}^n) R` with `h^{um}_m = 1`, acting by
`M' = H_L · M · H_R⁻¹`, `H_L[(c,i,j),(c,i,j')] = h^{cm}_n[j,j']`,
`H_R[(p,k,l),(p,k',l')] = h^{bm}_p[k,k'] h^{ap}_n[l,l']`, both zero off the diagonal. At
`(a, u, m, n)` the module triangle gives `M' = (h^{um}_m)⁻¹ · 1`, so a gauge preserving the
triangle has `h^{um}_m = 1`, with no rescaling. Classification: `Model Q` and `Model Q'` are
equivalent as `R`-linear module categories over `Model P`, by a module functor over the identity,
if and only if `Q' = h • Q.reindex τ`. *Needs:* 6.3.

**6.5 Rigidity of the action.** Over a field, `Nm_{ā m}^n = Nm_{a n}^m`, from the adjunction
`(Xᘁ ⊙ -) ⊣ (X ⊙ -)` given by `η_ X Xᘁ` and `ε_ X Xᘁ`. *Needs:* 6.2.

**6.6 Dictionary and formal rigidity** ([ENO] Corollary 2.35, p. 10; [EGNO] Corollary 9.1.6,
p. 277). As in 5.2, with `θ` a 2-cocycle for `actionFunctor : Model P ⥤ LinearEnd k (Model Q)`,
and `θ = −δγ` for a 1-cochain `γ` if and only if `Q₂ = (1 + γ) • Q₁`. For separable `Model P`,
every lift of `Q` to `A` in `C_k`, with `P` replaced by its constant lift, is
`h • Q.map (algebraMap k A)` with `h.map π = 1`; likewise over `k⟦t⟧`. *Needs:* 0.4, 4.2, 6.4.

**6.7 Bounds on module fusion rules.** Over a field, let `(M_a)_{mn} = Nm_{am}^n` and
`K := max_c ∑_{a,b} N_{ab}^c`. Then `M_b M_a = ∑_c N_{ab}^c M_c` and `M_ā = M_aᵀ`, so
`M_Σ := ∑_a M_a` is symmetric with `M_Σ² ≤ K · M_Σ` entrywise. Hence every `Nm_{am}^n ≤ K`, each
row of `M_Σ` has at most `K²` nonzero entries, and for each `κ` there are finitely many
`ModuleRules N κ` with these identities. *Needs:* 6.5.

**6.8 Indecomposable module categories.** A module category is indecomposable when it is nonzero
and not equivalent to a direct sum of two nonzero module subcategories. For models: `κ` is
nonempty and the graph on `κ` with an edge `m – n` whenever some `Nm_{am}^n ≠ 0` is connected. In
an indecomposable one every simple is a summand of some `a ⊙ m`, for fixed `m`, so
`Fintype.card κ ≤ K²`. *Needs:* 6.7.

**Checks.**

- 6.1: the regular module of `C₂` has `Nm = N` and every associator block `1`, satisfying the
  inverse laws, pentagon and triangle; relabeling `κ` by the identity and mapping `ℤ → 𝔽₃` keep it.
- 6.2: for the regular module of `C₂`, `δ_g ⊙ δ_m = δ_{g+m}` and `g ⊙ (h ⊙ m) = (g + h) ⊙ m`.
- 6.4: `Vec` acting on `Vec` with `h^{u m}_m = c`: `M' = c · 1 · c⁻² = c⁻¹`, so the triangle forces
  `c = 1`. `Vec` acting on `Vec²` has one class at rank `2`.
- 6.5: the regular module of `C₃`: `M_{g⁻¹} = M_gᵀ`. For `S₃` with `a = (12)`, `b = (23)`, `M_b M_a`
  and `M_{ab}` have the same nonzero entries.
- 6.7: the regular module of `C₂`: `K = 2`, `M_Σ = [[1,1],[1,1]]`, `M_Σ² = 2 M_Σ`. `Vec(C₂)`
  acting on `Vec`: `M_Σ = [2]`, `M_Σ² = [4] = K M_Σ`.
- 6.8: over `Vec(C₂)` the indecomposable module categories are `Vec(C₂)` (rank `2`) and `Vec`
  (rank `1`), within the bound `4`. The zero module category (`κ = ∅`) is not indecomposable,
  although it does not split. Over `Vec_G` with `char k ∤ |G|`, the indecomposables correspond to
  subgroups `H` up to conjugacy with a class in `H²(H, kˣ)`, and `(H, 1)` has `κ = G/H`
  ([EGNO] Example 7.4.10).

## Layer 7: representability and finite orbits

**7.1 Coordinate rings.** `FSymbols.coordRing N := MvPolynomial V ℤ ⧸ J`, with `V` the entries of
`F` and `Finv` and `J` generated by the inverse laws, the pentagon and the triangle, with a
bijection `FSymbols R N ≃ (FSymbols.coordRing N →+* R)` natural in `R`. For `P` over a field `K`:
finitely generated `K`-algebras `RSymbols.coordRing P` and `ModuleSymbols.coordRing P Nm` with the
same property. *Needs:* PresentationsOfMonoidalCategories Layer 0; 6.1.

**7.2 Gauge group schemes.** The normalized gauge group is represented by the tensor product of
`GeneralLinear.coordinateHopfAlgebra ℤ (N_{ab}^c)` over triples with `a, b ≠ u`, with a coaction
on `FSymbols.coordRing N` representing the gauge action; likewise the module gauge group on
`ModuleSymbols.coordRing P Nm`. The fusion and separable locus is the principal open where
`∏_a s_a` and `∑_a (s_a s_ā)⁻¹` are units; it is gauge invariant. *Needs:* 7.1, 5.1; Tau Ceti
`GeneralLinear.coordinateHopfAlgebra`.

**7.3 Finite orbits.** Let `K` be algebraically closed, `X = Spec 𝒪` with `𝒪` a finitely generated
`K`-algebra, and `G` a group scheme over `K` whose coordinate Hopf algebra `H` is finitely
generated and a domain, acting on `X` as in `TauCeti.isConstructible_orbit`. Suppose that for
every `x : 𝒪 →ₐ[K] K`, every `A` in `C_K` and every `y : 𝒪 →ₐ[K] A` with `π ∘ y = x`, there is
`g : H →ₐ[K] A` with `y = g · x`. Then `X(K)` has finitely many `G(K)`-orbits, each an irreducible
component of `X(K)` ([EGNO] proof of Theorem 9.1.4, p. 276, which argues via tangent spaces).
Proof route, each step a target:
- with `A = 𝒪_{X,x}/𝔪^n` and Krull's intersection theorem, the kernel of the orbit comorphism
  `𝒪 → H` maps to `0` in `𝒪_{X,x}`;
- so the orbit closure of `x`, which is irreducible because `H` is a domain, contains every
  component through `x`; so `x` lies on exactly one component `Z_x`, the orbit closure;
- by `isConstructible_orbit` and `IsConstructible.dense_interior` the orbit contains a dense open
  subset of `Z_x`; two points of `Z_x` therefore have meeting orbits (using that finite-type
  `K`-algebras are Jacobson), so `Z_x` is one orbit;
- finiteness follows from `NoetherianSpace.finite_irreducibleComponents`.

*Needs:* SchemeAndStackFoundations §4.2; Tau Ceti `isConstructible_orbit`,
`IsConstructible.dense_interior`.

**7.4 Isolated points.** With `H = K`: if every `A`-point lifting a `K`-point is constant, `X(K)`
is finite. *Needs:* 7.3.

**7.5 Points over a subfield.** For an algebraically closed subfield `F ⊆ K` and
`𝒪 = K ⊗_F 𝒪_F` with `𝒪_F` finitely generated, every nonempty Zariski-open subset of `X(K)`
contains a point coming from `𝒪_F →ₐ[F] F`: expand a function in an `F`-basis of `K` and apply the
Nullstellensatz over `F`. If `G` and the action are defined over `F`, every orbit in 7.3 contains
such a point. *Needs:* 7.3.

**Checks.**

- 7.1: for `C₂` the normalized F-symbol ring is `ℤ[x, x⁻¹]/(x² − 1)`; for `C₂` with `F = 1` the
  braiding ring is `K[r, r⁻¹]/(r² − 1)`; for `Vec` acting on `Vec` the module ring is `K`.
- 7.2: in characteristic `2`, `C₂` has `s_1 = 1` a unit and `∑ (s_a s_ā)⁻¹ = 0`: the fusion locus
  is nonempty and the separable locus is empty.
- 7.3: `𝔾_a` translating `𝔸¹_K`: one orbit, one component, and the comorphism `x ↦ t` has kernel
  `0`. The trivial group on `Spec K[ε]/(ε²)` fails the hypothesis, through the nonconstant lift
  `ε ↦ ε`.
- 7.4: `𝒪 = K × K` with the trivial group: two points.
- 7.5: `F = ℚ̄ ⊆ ℂ`, `X = 𝔸¹`: the open set `x ≠ π` contains the `F`-point `0`.

## Layer 8: finiteness theorems

Let `K` be algebraically closed.

**8.1 Fusion categories** ([ENO] Theorem 2.28, p. 9; [EGNO] Theorem 9.1.4, p. 276). Let `N` be
fusion rules with a duality involution. There are finitely many `P₁, …, Pₘ : FSymbols K N` such
that every separable fusion category `C` over `K` with a bijection `e : SimpleClasses C ≃ ι`
sending `𝟙` to `u` and `fusionCoeff` to `N` is `K`-linearly monoidally equivalent to some
`Model Pᵢ`. *Needs:* 5.5, 7.2, 7.3; PresentationsOfMonoidalCategories Layers 2, 3.

**8.2 Braidings** ([ENO] Remark 2.33, p. 10). For `P` separable, `RSymbols P` is finite. For `C`
separable and fusion over `K`, `Finite (BraidedCategory C)`, since a braiding is determined by
its R-symbols in a fixed fusion basis. *Needs:* 5.6, 7.4.

**8.3 Braided fusion categories.** With `N` as in 8.1, there are finitely many separable braided
fusion categories with fusion rules `N` up to `K`-linear braided monoidal equivalence.
*Needs:* 8.1, 8.2.

**8.4 Module categories of fixed rank** ([ENO] Corollary 2.35, p. 10; [EGNO] Corollary 9.1.6(i),
p. 277). For `C` separable and fusion over `K` and each `r`, there are finitely many
`K`-linear semisimple left module categories with split simples, of rank `r`, up to equivalence
of module categories. *Needs:* 6.3, 6.4, 6.6, 6.7, 7.3.

**8.5 Indecomposable module categories** ([EGNO] Corollary 9.1.6(ii), p. 277). There are finitely
many indecomposable ones in total. *Needs:* 6.8, 8.4.

**8.6 Fields of definition** ([EGNO] Corollary 9.1.8, p. 277). Let `F` be the algebraic closure
of the prime field in `K`. Every separable fusion category over `K` is equivalent to
`Model (P.map (algebraMap F K))` for some `P : FSymbols F N`; for such `P`, every braiding is
`R.map (algebraMap F K)` for some `R : RSymbols P`, and every module category is equivalent to
`ModuleSymbols.Model (Q.map (algebraMap F K))` for some `Q` over `P`. *Needs:* 7.5, 8.1, 8.2, 8.4.

**Checks.**

- 8.1: fusion rules `ℤ/2` over `K` with `char K ≠ 2`: exactly two classes, `F^{111}_1 = ±1`. With
  `char K = 2`: one class, and it is not separable, so the list of separable ones is empty.
  Fibonacci rules over `ℂ`: two classes, Fibonacci and Yang–Lee.
- 8.2: with `char K ≠ 2`, `F^{111}_1 = 1` has braidings `R^{11}_0 = ±1` and `F^{111}_1 = −1` has
  `±i`; with `char K = 2` there is one braiding.
- 8.3: `ℤ/2` over `ℂ`: four braided classes `(F, R) = (1, ±1), (−1, ±i)`.
- 8.4: over `Vec`, one module category of each rank.
- 8.6: the semion has `F = −1`, `R = i`, both algebraic over `ℚ`.

## Layer 9: characteristic zero

**9.1 Ocneanu rigidity in characteristic zero.** For `K` algebraically closed of characteristic
zero every fusion category is separable (PivotalSpherical 6.9), so 4.1, 5.5, 5.6, 6.6 and 8.1 to
8.6 hold without the separability hypothesis. *Needs:* 4.1, 5.5, 5.6, 6.6, 8.1–8.6;
PivotalSpherical 6.9.

**Checks.**

- 9.1: `ℤ/2` over `ℂ`: `H^n = 0` for `n > 0`, two fusion classes and two braidings on each;
  separability from `normGlobalDim = 2`.

## Downstream consumers

- PresentationsOfMonoidalCategories-based computations of F-symbols modulo primes, lifted to
  characteristic zero: Layers 5 and 8.
- CategoricalOperatorAlgebras CA6: the comparison 1.3.

## References

- [ENO] P. Etingof, D. Nikshych, V. Ostrik, *On fusion categories*, Ann. of Math. 162 (2005),
  arXiv:math/0203060v11: Proposition 2.1 (p. 4), Theorems 2.27, 2.28, 2.31 (p. 9), Remark 2.33,
  Corollary 2.35 (p. 10), §7.3 (pp. 28–29), §9.1 (p. 43).
- [GHS] A. M. Gainutdinov, J. Haferkamp, C. Schweigert, *Davydov–Yetter cohomology, comonads and
  Ocneanu rigidity*, Adv. Math. 414 (2023), 108853, arXiv:1910.06094v2: Definition 2.4 (p. 7),
  Proposition 2.12 (p. 10), Definitions 3.1–3.3 (pp. 13–14), Remark 3.7 and (3.14) (p. 15),
  Theorem 3.11 (pp. 18–19), Lemma 3.17 and Corollary 3.18 (pp. 24–25), §5.
- [EGNO] P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS Mathematical
  Surveys and Monographs 205 (2015): Example 7.4.10, Example 7.22.5 (p. 184), Theorem 9.1.4
  (p. 276), Corollaries 9.1.6 and 9.1.8 (p. 277), Lemma 9.3.1 and Theorem 9.3.2 (p. 279).
- [BB] M. Barr, J. Beck, *Homology and standard constructions*, in Seminar on Triples and
  Categorical Homology Theory, Lecture Notes in Math. 80 (1969), §§1, 4.
- A. Davydov, *Twisting of monoidal structures*, arXiv:q-alg/9703001.
- D. Yetter, *Braided deformations of monoidal categories and Vassiliev invariants*, Contemp.
  Math. 230 (1998).
- V. Ostrik, *Module categories, weak Hopf algebras and modular invariants*, Transform. Groups 8
  (2003).
