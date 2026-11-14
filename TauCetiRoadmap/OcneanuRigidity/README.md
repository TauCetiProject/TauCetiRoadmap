# Roadmap: Ocneanu rigidity

A fusion category cannot be deformed. Over an algebraically closed field, a fusion category of
nonzero global dimension has vanishing Davydov–Yetter cohomology in positive degrees, with any
coefficients and relative to any tensor functor out of it. Consequently:

- its F-symbols, its R-symbols and the associators of its module categories have no
  deformations over Artinian local rings;
- there are finitely many such fusion categories with given fusion rules;
- each has finitely many braidings and finitely many module categories of each rank;
- each is defined over the algebraic closure of the prime field.

In characteristic zero the global dimension is never zero, so these statements hold for every
fusion category.

Tau Ceti has finite semisimple and pivotal categories, the Drinfeld centre with its induction
functor, simplicial resolutions of comonads, Artin local algebras, and orbits of group-scheme
actions. The [presentations of monoidal categories roadmap](../PresentationsOfMonoidalCategories/README.md)
supplies F- and R-symbols over commutative rings. Nothing in Mathlib or Tau Ceti treats
Davydov–Yetter cohomology, deformations of tensor categories, or the Radford isomorphism. This
roadmap builds:

- squared norms and the global dimension of a fusion category, without a pivotal structure;
- the centre of a tensor functor, its induction functor and the averaging identity;
- comonad cohomology and Davydov–Yetter cohomology with coefficients, their comparison, and the
  vanishing theorem;
- formal rigidity of F-symbols and R-symbols, and presentations and formal rigidity of module
  categories;
- an orbit-counting lemma for group-scheme actions, and the finiteness theorems;
- the Deligne product, the canonical algebra of a fusion category and the Radford isomorphism
  `𝟭 ≅ (-)ᘁᘁᘁᘁ`;
- the pivotalization, and positivity of squared norms in characteristic zero.

Suggested home: `TauCeti/CategoryTheory/Monoidal/DavydovYetter/` for Layers 0 to 5,
`TauCeti/CategoryTheory/Monoidal/Ocneanu/` for Layers 6, 7 and 9,
`TauCeti/AlgebraicGeometry/GroupAction/FiniteOrbits.lean` for Layer 8,
`TauCeti/CategoryTheory/Monoidal/Deligne/` and `.../Radford/` for Layers 10 and 11.
Topic: `math.QA`.

## Scope

- **Semisimple, simple unit.** Fusion categories, braided fusion categories, and semisimple
  module categories over fusion categories. Multifusion categories, non-semisimple finite tensor
  categories, and bimodule categories and Morita theory are excluded. Davydov–Yetter cohomology
  of a non-semisimple category can be nonzero, which is why the semisimple hypothesis is
  structural here (Gainutdinov–Haferkamp–Schweigert, §5).
- **Base field.** An algebraically closed field `k` of any characteristic. The core hypothesis
  is that the global dimension is nonzero. Layer 11 removes it in characteristic zero. Over
  rings, only the deformation layers use rings, and there they are Artin local `k`-algebras and
  `k⟦t⟧`.
- **Counting.** Finiteness is proved for fusion categories with given fusion rules, for
  braidings on a fixed fusion category, for braided fusion categories with given fusion rules,
  and for module categories over a fixed fusion category (of fixed rank, and indecomposable).
  Counting tensor functors between two fixed fusion categories is excluded. Tensor functors enter
  only through the vanishing of their Davydov–Yetter cohomology (Layer 5).
- **Boundaries with other roadmaps.**
  - [PivotalSpherical](../PivotalSpherical/README.md) owns fusion-category infrastructure:
    finite semisimple categories, simple classes, fusion coefficients, the Grothendieck ring,
    Perron–Frobenius, pivotal structures and their global dimension `globalDim`,
    `globalDim_ne_zero`, and the induction functor of the absolute centre with its pivotal
    averaging identity (Layer 11).
  - Here, those constructions are made pivot-free and relative to a tensor functor, and
    PivotalSpherical's pivotal statements become corollaries (Layer 2). No second `globalDim`
    is defined. Semisimplicity of `Center C` stays in PivotalSpherical; this roadmap does not
    need it.
  - [PresentationsOfMonoidalCategories](../PresentationsOfMonoidalCategories/README.md) owns
    `FSymbols`, `RSymbols`, `Model P`, gauge and classification.
  - [ReductiveGroups](../ReductiveGroups/README.md) Layer 3A owns orbit maps and the
    local closedness of orbits.
  - [CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md) owns unitary
    structures. Its unitary relative centre (CA6) is built on the carrier `RelCenter` of Layer 2.

## Conventions (pinned)

- **Fusion hypotheses.** "`C` is fusion over `k`" means the instance list of PivotalSpherical
  Layer 4, spelled as instance arguments and not bundled:
  `[Field k] [IsAlgClosed k] [Abelian C] [Linear k C] [MonoidalCategory C]
  [MonoidalPreadditive C] [MonoidalLinear k C] [RigidCategory C] [IsFiniteSemisimpleCategory C]
  [Fintype (SimpleClasses C)] [Simple (𝟙_ C)] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]`.
  Scalars `𝟙_ C ⟶ 𝟙_ C` are read in `k` through PivotalSpherical's `endUnitAlgEquiv`.
- **Separable.** `C` is separable when `normGlobalDim C ≠ 0` (Layer 1). This is a hypothesis
  on theorems, not a class.
- **Duals.** Right duals are primary, as in PivotalSpherical.
  - `η_ X Xᘁ : 𝟙_ C ⟶ X ⊗ Xᘁ` and `ε_ X Xᘁ : Xᘁ ⊗ X ⟶ 𝟙_ C` are Mathlib's coevaluation and
    evaluation.
  - `fᘁ` is the right adjoint mate.
  - `(-)ᘁᘁ` is PivotalSpherical's `doubleRightDualFunctor`.
- **Bidual trace and squared norm.**
  - For `a : X ⟶ Xᘁᘁ`, `bidualTrace a := η_ X Xᘁ ≫ (a ▷ Xᘁ) ≫ ε_ Xᘁ Xᘁᘁ`.
  - For simple `X` and an isomorphism `a : X ≅ Xᘁᘁ`,
    `squaredNorm X := bidualTrace a.hom ≫ bidualTrace (a.inv)ᘁ`, where
    `(a.inv)ᘁ : Xᘁ ⟶ Xᘁᘁᘁ`.
  - `normGlobalDim C := ∑ S : SimpleClasses C, squaredNorm S.repr`.
- **Centre of a functor.** For a monoidal functor `F : C ⥤ D`, a half-braiding relative to `F`
  on `X : D` is a natural family `β Y : X ⊗ F.obj Y ≅ F.obj Y ⊗ X`, in the direction of Mathlib's
  `HalfBraiding`. It is compatible with `F`'s tensorator `μ` and unit `ε` as in
  Gainutdinov–Haferkamp–Schweigert, (3.7) and (3.9).
- **Tensor powers.** `tensorFun F n : (Fin n → C) ⥤ D` sends `(X₀, …, X_{n-1})` to
  `F X₀ ⊗ (F X₁ ⊗ (⋯ ⊗ F X_{n-1}))`, right-nested, with `tensorFun F 0 = 𝟙_ D` and
  `tensorFun F 1 = F`.
- **Davydov–Yetter cochains.** For `X Y : RelCenter F`, the `n`-cochains are the natural
  transformations `tensorFun F n ⋙ tensorLeft X.1 ⟶ tensorFun F n ⋙ tensorRight Y.1`. The
  differential is GHS (3.11). For `f` of degree `n`, its component at `(X₀, …, Xₙ)` is
  `(F X₀ ◁ f_{X₁…Xₙ}) ∘ (β^X_{X₀} ▷ …) + ∑_{i=1}^{n} (−1)^i f_{X₀,…,X_{i−1}⊗X_i,…,Xₙ}
  + (−1)^{n+1} (… ◁ β^Y_{Xₙ}) ∘ (f_{X₀…X_{n−1}} ▷ F Xₙ)`.
  - The middle terms identify `F X_{i−1} ⊗ F X_i` with `F (X_{i−1} ⊗ X_i)` through `μ` and
    rebracket by `D`'s associators.
  - In degree `0` the cochains are `X.1 ⟶ Y.1`, and the differential is
    `f ↦ (F X₀ ◁ f) ∘ β^X_{X₀} − β^Y_{X₀} ∘ (f ▷ F X₀)`.
  - Trivial coefficients mean `X = Y = 𝟙_ (RelCenter F)`.
- **Comonad cochains.** For a comonad `G` on a `k`-linear category and objects `X`, `Y`, the
  complex has `Hom (G^{n+1} X, Y)` in degree `n`. It is `Hom (-, Y)` applied to Tau Ceti's
  augmented simplicial resolution of `X`, followed by Mathlib's `alternatingCofaceMapComplex`.
- **Artin local algebras.** "`A` is an Artin local `k`-algebra" means an object of Tau Ceti's
  `ArtinLocalAlg k k`, with residue map `π : A →ₐ[k] k`. A lift of `P : FSymbols k N` to `A` is
  a `Q : FSymbols A N` with `Q.map π = P`. The constant lift is `P.map (algebraMap k A)`. Gauges
  over `A` are normalized gauges in the sense of PresentationsOfMonoidalCategories Layer 3.
- **Skeletal conventions** (fusion bases, `F`, `R`, gauges, duality scalars `s_a`) are those of
  PresentationsOfMonoidalCategories, unchanged. Layer 7 extends them to module categories.

## Exact supplier contracts

- **Mathlib, monoidal:**
  - `MonoidalCategory`, `MonoidalPreadditive`, `MonoidalLinear`, `RigidCategory`, `ExactPairing`,
    `Functor.Monoidal`, `NatTrans.IsMonoidal`, `BraidedCategory`, `MonoidalOpposite` (`Cᴹᵒᵖ`);
  - `Center`, `HalfBraiding`, `Center.forget`, `Center.ofBraided`;
  - `MonoidalLeftAction`, `Functor.LeftLinear`, `MonObj`, `Mod`;
  - `Mat_`, `Functor.pi`, `NatTrans.pi`.
- **Mathlib, homological:** `Comonad`, `Adjunction.toComonad`,
  `SimplicialObject.Augmented.ExtraDegeneracy` and its `homotopyEquiv`,
  `alternatingCofaceMapComplex`, `Homotopy`, `HomotopyEquiv`, `HomologicalComplex.homology`.
- **Mathlib, commutative algebra:**
  - `Ideal.iInf_pow_eq_bot_of_isLocalRing`, `PrimeSpectrum.isConstructible_comap_image`;
  - `NoetherianSpace.finite_irreducibleComponents`, `isJacobsonRing_of_finiteType`;
  - `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`, `PowerSeries`, `IsAlgClosed.lift`.
- **Tau Ceti, fusion** (from [PivotalSpherical](../PivotalSpherical/README.md)):
  - `IsFiniteSemisimpleCategory`, `SimpleClasses`, `fusionCoeff`, `SplitK0`, `Basis.homDual`;
  - `PivotalCategory`, `leftDim`, `rightDim`, `globalDim`, `globalDim_pivotalCategory_eq`;
  - `Rigid/Simple.lean`'s `simple_rightDual`, `doubleRightDualFunctor`;
  - the Perron–Frobenius theorems in `LinearAlgebra/Matrix/PerronFrobenius/`.
- **Tau Ceti, centre:**
  - `Center.instAbelian`, `Center.rigidCategory`;
  - `Center.induction k C` with `inductionObj X = ⨁ S, S.repr ⊗ X ⊗ S.reprᘁ`;
  - `forgetInductionAdjunction : forget C ⊣ induction k C`.
- **Tau Ceti, comonads:** `Comonad.simplicialResolution`, `Comonad.augmentedSimplicialResolution`,
  `Adjunction.resolutionExtraDegeneracy`.
- **Tau Ceti, deformations and groups:**
  - `ArtinLocalAlg`, `IsSmallExtension`, `dualNumbers`;
  - `GeneralLinear.CoordinateRing`, `coordinateHopfAlgebra`, `groupScheme`;
  - `orbitMap`, `isConstructible_orbit`, `isLocallyClosed_orbit`,
    `IsConstructible.dense_interior`.
- **From PresentationsOfMonoidalCategories:**
  - `FusionRules`, `FSymbols`, `RSymbols`, `reindex`, `map`, `Model`;
  - `IsSplitSimpleBasis`, extraction and reconstruction;
  - the gauge group and the classification of models;
  - the rigidity criterion and the pivotal layer.

## How to read the build

Each layer lists its targets in dependency order. A layer's *Needs:* clause names what it uses
beyond earlier layers of this roadmap. **Checks** are acceptance criteria: computations an
implementation must reproduce.

## The build, in layers

### Layer 0: preliminaries

*Needs:* Mathlib `Functor.pi`, `ExactPairing`, `curriedAction`; Tau Ceti `natTrans_ext_of_simple`.


- **Tensor powers of a functor.** Define `tensorFun F n` as in the conventions, for a monoidal
  functor `F : C ⥤ D`. Provide:
  - the isomorphisms `tensorFun F (n+1) ≅ F ⊗ tensorFun F n` (in the first variable), and the
    merge isomorphisms that identify the component at `(…, X_{i−1} ⊗ X_i, …)` with a
    restriction of `tensorFun F (n+1)` through `μ`;
  - additivity and `k`-linearity of `tensorFun F n` in each variable, when `F` is `k`-linear.
- **Duals along monoidal functors.** For `F` monoidal and `ExactPairing X Y` in `C`, the
  exact pairing `ExactPairing (F.obj X) (F.obj Y)`, with coevaluation `ε_F ≫ F.map (η_ X Y) ≫ μ⁻¹`
  and evaluation `μ ≫ F.map (ε_ X Y) ≫ ε_F⁻¹`.
- **Cochains on semisimple categories.** For `C` fusion and functors `Φ Ψ : (Fin n → C) ⥤ D`
  additive in each variable, restriction to tuples of `SimpleClasses` representatives is a
  `k`-linear equivalence `(Φ ⟶ Ψ) ≃ₗ[k] ∏ (s : Fin n → SimpleClasses C), (Φ.obj (repr ∘ s) ⟶
  Ψ.obj (repr ∘ s))`. This extends Tau Ceti's `natTrans_ext_of_simple` from uniqueness to
  existence. Corollary: Davydov–Yetter cochain spaces are finite-dimensional when `D` is
  Hom-finite.
- **Linear endofunctors.** For a `k`-linear category `M` with finite biproducts,
  `LinearEnd k M` is the full subcategory of `M ⥤ M` on additive `k`-linear functors, with
  composition as tensor product. Provide `MonoidalCategory`, `Preadditive`, `Linear k`,
  `MonoidalPreadditive`, `MonoidalLinear k` and `HasFiniteBiproducts`.
  - A `MonoidalLeftAction C M` which is `k`-linear in each variable gives a `k`-linear monoidal
    functor `actionFunctor : C ⥤ LinearEnd k M`, through Mathlib's `curriedAction`.

### Layer 1: squared norms and the global dimension

*Needs:* Layer 0; PivotalSpherical `simple_rightDual`, `leftDim`, `rightDim`, `globalDim`, `endUnitAlgEquiv`;
PresentationsOfMonoidalCategories Layers 5 and 6 for the skeletal formula.


- **Simple objects are self-bidual.** For `C` fusion and `S` simple, `Nonempty (S ≅ Sᘁᘁ)`
  (ENO, Proposition 2.1).
- **Bidual traces.** `bidualTrace` is `k`-linear. For `S` simple and `a : S ≅ Sᘁᘁ`,
  `bidualTrace a.hom ≠ 0`: a zero trace would make the multiplicity of `𝟙` in `S ⊗ Sᘁ` at
  least two.
- **Squared norms.**
  - `squaredNorm S` is independent of the choice of `a`: rescaling `a` by `t` rescales the two
    traces by `t` and `t⁻¹`.
  - It is nonzero, invariant under isomorphism, and satisfies `squaredNorm 𝟙_ C = 1` and
    `squaredNorm Sᘁ = squaredNorm S`.
  - It is preserved by `k`-linear monoidal equivalences.
- **Global dimension.** `normGlobalDim C`. It is invariant under `k`-linear monoidal
  equivalence. For `C = Vec_G^ω` it equals `|G|`.
- **Comparison with pivotal dimensions.** For `[PivotalCategory C]`:
  - `squaredNorm X = leftDim X ≫ rightDim X`;
  - `normGlobalDim C = globalDim C`.

  Consequently, a pivotal fusion category in characteristic zero is separable, by
  PivotalSpherical's `globalDim_ne_zero`.
- **Skeletal formula.** For `P : FSymbols k N` satisfying the rigidity criterion of
  PresentationsOfMonoidalCategories Layer 5:
  - `squaredNorm (Model.simple a) = (s_a s_ā)⁻¹`;
  - `normGlobalDim (Model P) = ∑ a, (s_a s_ā)⁻¹`.

  The proof combines the comparison above with that roadmap's Layer 6, where `leftDim` and
  `rightDim` are `(t_a s_ā)⁻¹` and `t_a / s_a`. Since `squaredNorm` does not depend on a pivotal
  structure, the formula holds for every `P` satisfying the criterion.

**Checks.**

- Fibonacci (`s_τ = φ⁻¹`): `squaredNorm τ = φ²` and `normGlobalDim = (5 + √5)/2`. Its Galois
  conjugate Yang–Lee (`s_τ = −φ`): `squaredNorm τ = φ⁻²` and `normGlobalDim = (5 − √5)/2`. Both
  are positive real, as Layer 11 requires, although Yang–Lee has no positive pivotal dimensions.
- `Vec_G^ω`: every `squaredNorm` is `1`, whatever `ω`.
- `FDRep k G` with `char k ∤ |G|`: `squaredNorm V = (dim V)²` and `normGlobalDim = |G|`.

### Layer 2: the centre of a tensor functor, induction and averaging

*Needs:* Layers 0 and 1; Mathlib `Center`, `Adjunction.toComonad`; Tau Ceti `Center.induction`,
`forgetInductionAdjunction`, `Basis.homDual`.


Fix `C` fusion over `k`, and `D` a `k`-linear monoidal category: `[Preadditive D] [Linear k D]
[MonoidalCategory D] [MonoidalPreadditive D] [MonoidalLinear k D] [HasFiniteBiproducts D]`.
Fix `F : C ⥤ D` monoidal, additive and `k`-linear.

- **The centre of `F`.**
  - `RelHalfBraiding F X` as in the conventions, and `RelCenter F := Σ X : D, RelHalfBraiding F X`,
    with morphisms commuting with the half-braidings (GHS, Definitions 3.1 and 3.2).
  - Provide its monoidal structure, the faithful monoidal functor `RelCenter.forget F`, and
    `Preadditive`, `Linear k` and `HasFiniteBiproducts`.
  - `RelCenter.idEquiv : RelCenter (𝟭 C) ≌ Center C`, monoidal, identifying half-braidings.
  - `RelCenter.map F : Center C ⥤ RelCenter F`, sending `(X, β)` to `(F X, F β)` transported
    along `μ`, monoidal.
- **Induction.** `RelCenter.induction F : D ⥤ RelCenter F`, with underlying object
  `⨁ S : SimpleClasses C, F S.repr ⊗ V ⊗ F (S.reprᘁ)`. Its half-braiding is Tau Ceti's
  `Center.induction` half-braiding, with `F` inserted and its tensorator used. The pairing between
  `F S.repr` and `F (S.reprᘁ)` comes from Layer 0.
  - At `F = 𝟭 C`, through `idEquiv`, it agrees with `Center.induction k C`.
  - It commutes with `RelCenter.map`: `RelCenter.map F ⋙ induction F ≅ Center.induction k C ⋙
    RelCenter.map F`, up to the canonical identification of summands.
- **Both adjunctions.** `forgetInductionAdjunction F : forget F ⊣ induction F`, generalizing
  Tau Ceti's, and `inductionForgetAdjunction F : induction F ⊣ forget F`.
  - The normalization is PivotalSpherical Layer 11's. The counit of `forget F ⊣ induction F` is
    the projection of `⨁ S, F S ⊗ V ⊗ F Sᘁ` onto its `𝟙`-summand. The unit of
    `induction F ⊣ forget F` is the inclusion of that summand.
  - Each adjunction is determined by that datum.
- **The averaging identity.** For every `Z : RelCenter F`,
  `(forgetInductionAdjunction F).unit.app Z ≫ (inductionForgetAdjunction F).counit.app Z =
  normGlobalDim C • 𝟙 Z`.
  - The summand `S` contributes `squaredNorm S`, with no pivotal structure involved (EGNO,
    Lemma 9.3.1 and the proof of Theorem 9.3.2).
  - At `F = 𝟭 C` this is the pivot-free form of PivotalSpherical Layer 11's averaging identity.
    Prove Layer 11's statement from it, using `normGlobalDim_eq_globalDim`, rather than
    separately.
- **The central comonad.** `RelCenter.comonad F := (inductionForgetAdjunction F).toComonad`, with
  underlying functor `forget F ⋙ induction F`.
- **Relative projectivity.** For a comonad `G`, `X` is `G`-projective when the counit `G X ⟶ X`
  has a section (GHS, Definition 2.4). If `C` is separable, every `Z : RelCenter F` is
  `RelCenter.comonad F`-projective, with section
  `(normGlobalDim C)⁻¹ • (forgetInductionAdjunction F).unit.app Z`.

### Layer 3: comonad cohomology

*Needs:* Mathlib `ExtraDegeneracy`, `alternatingCofaceMapComplex`; Tau Ceti
`Comonad.augmentedSimplicialResolution`. Independent of Layers 0 to 2.


For a comonad `G` on a `k`-linear category `𝒵` and objects `X Y : 𝒵`:

- **The complex.** `Comonad.cochainComplex G X Y : CochainComplex (ModuleCat k) ℕ`, as in the
  conventions, together with its augmentation from `Hom (X, Y)` in degree `-1`. It is
  functorial in `X`, contravariantly, and in `Y`.
- **Extra codegeneracies.** The cosimplicial dual of Mathlib's `ExtraDegeneracy`: an extra
  codegeneracy on an augmented cosimplicial object in a preadditive category gives a homotopy
  equivalence between its alternating coface complex and the augmentation in degree `0`.
- **Free objects.** For `X = G W`, the augmented simplicial object `G^{•+1}(G W) → G W` has an
  extra degeneracy given by the comultiplication of `G`, applied at `W`. Hence the augmented
  cochain complex of `G W` is contractible for every `Y`.
- **Vanishing (Barr–Beck; GHS, Proposition 2.12).** If `X` is `G`-projective, the augmented
  cochain complex is exact. Thus `H^0 ≅ Hom (X, Y)` and `H^n = 0` for `n ≥ 1`. The proof
  realises `X` as a retract of `G X` and uses functoriality in `X`.

### Layer 4: Davydov–Yetter cohomology

*Needs:* Layers 0, 2 and 3.


Keep the hypotheses of Layer 2, and let `X Y : RelCenter F`.

- **The complex.** Build `DYComplex F X Y : CochainComplex (ModuleCat k) ℕ` with the cochains
  and differential of the conventions, and `DYCohomology F X Y n := (DYComplex F X Y).homology n`.
  - `δ ≫ δ = 0` is proved for an arbitrary monoidal functor `F` between monoidal categories,
    with no semisimplicity.
  - Write `DYComplex F` for trivial coefficients and `DYComplex C` for `F = 𝟭 C`.
- **Functoriality.** Morphisms in `RelCenter F` act on the coefficients. A monoidal natural
  isomorphism `F ≅ F'` and a monoidal equivalence `C ≌ C'` induce isomorphisms of complexes.
- **Low degrees.** For trivial coefficients, the degree-`0` differential vanishes, so
  `DYCohomology F 1` is the space of derivations of `F`. These are natural `θ : F ⟶ F` with
  `θ_{X⊗Y} ∘ μ = μ ∘ (θ_X ▷ F Y + F X ◁ θ_Y)`.
- **Comparison (GHS, Theorem 3.11).** For `C` fusion there is an isomorphism of cochain
  complexes `DYComplex F X Y ≅ Comonad.cochainComplex (RelCenter.comonad F) X Y`.
  - In degree `n` it is the composite of the adjunction isomorphisms of
    `inductionForgetAdjunction F` with the Layer 0 description of cochains on simples. The
    reason is that `(forget F ⋙ induction F)^n` has underlying object
    `⨁_{S₁…Sₙ} F Sₙ ⊗ ⋯ ⊗ F S₁ ⊗ X ⊗ F S₁ᘁ ⊗ ⋯ ⊗ F Sₙᘁ`.
  - Verifying that the differentials agree is the content (GHS, §3.4).

### Layer 5: the vanishing theorem

*Needs:* Layers 2, 3 and 4.


- **Ocneanu rigidity, cohomological form.** Let `C` be fusion over `k` and separable, and let
  `D` and `F` be as in Layer 2. Then for all `X Y : RelCenter F` and `n ≥ 1`,
  `DYCohomology F X Y n = 0`. The proof combines Layers 2, 3 and 4.
- **Specializations**, each a named theorem:
  - `DYCohomology C n = 0` for `n ≥ 1` (`F = 𝟭 C`, trivial coefficients);
  - for any `k`-linear monoidal `F : C ⥤ D`, `DYCohomology F n = 0` for `n ≥ 1`;
  - for a `k`-linear left module category `M` over `C` with finite biproducts, the cohomology of
    `actionFunctor : C ⥤ LinearEnd k M` (Layer 0) vanishes in positive degrees;
  - for `X : Center C`, `DYCohomology (𝟭 C) (idEquiv.inverse X) (idEquiv.inverse X) 1 = 0`. In
    particular this holds for `X = Center.ofBraided Y` when `C` is braided.
- **The hypothesis is sharp in positive characteristic.** For `C = Vec_{ℤ/p}` over `k` of
  characteristic `p`, `DYCohomology C 1 ≅ Hom (ℤ/p, k) ≠ 0` and `normGlobalDim C = p = 0`
  (EGNO, Example 7.22.5).

**Checks.**

- `Vec_G` over `k`: `DYCohomology (Vec_G) n ≅ H^n(G, k)`, group cohomology with trivial
  coefficients (EGNO, Example 7.22.5). This vanishes for `n ≥ 1` exactly when `char k ∤ |G|`,
  which is when `normGlobalDim = |G|` is nonzero.
- For `F = 𝟭 C` with `C` separable and fusion, `DYCohomology C 0 ≅ k`.

### Layer 6: formal rigidity of F-symbols and R-symbols

*Needs:* Layers 1 and 5; PresentationsOfMonoidalCategories Layers 0 to 5; Tau Ceti `ArtinLocalAlg`.


Fix `P : FSymbols k N` satisfying the rigidity criterion of PresentationsOfMonoidalCategories
Layer 5, so that `Model P` is fusion over `k`. Assume `Model P` is separable, i.e.
`∑ a, (s_a s_ā)⁻¹ ≠ 0` by Layer 1.

- **Deformation dictionary.** Let `A ↠ A'` be a surjection of Artin local `k`-algebras whose
  kernel `I` satisfies `𝔪_A · I = 0`.
  - *F-symbols.* For lifts `Q₁ Q₂ : FSymbols A N` of `P` with equal images in `A'`, write
    `Q₂.F = (1 + θ) · Q₁.F` with `θ` having entries in `I`. Then `θ` depends only on `P`, and
    defines an element of `DYComplex (Model P)` in degree `3`, tensored with `I`. This uses
    Layer 0 and the left basis `L_{(e,i,j)}` of `Hom((a ⊗ b) ⊗ c, d)`. That element is a
    cocycle.
  - Conversely, `θ` is the coboundary of `γ`, an element of degree `2` tensored with `I`, if and
    only if `Q₂ = g • Q₁`. Here `g^{ab}_c = 1 + γ^{ab}_c`, acting by the gauge formula of
    PresentationsOfMonoidalCategories with the unit components unconstrained.
  - **Normalizing.** A family of units acting by that formula preserves the triangle if and only
    if its unit components `g^{ua}_a` and `g^{au}_a` are all one constant `c`. Dividing by `c`
    gives a normalized gauge with the same action. So `g` can be taken normalized, and
    `g.map π = 1` is preserved.
  - *R-symbols.* For `R₁ R₂ : RSymbols (P.map (algebraMap k A))` with equal images in `A'`,
    write `R₂ = (1 + β) R₁`. For each `a`, `β` restricted to `a` is a cocycle of degree `1` in
    `DYComplex (Model P)` with coefficients `X = Y = Center.ofBraided (Model.simple a)`, for
    the braiding of `R₁` reduced to `k`, tensored with `I`. Coboundaries `δ f` with
    `f ∈ End (Model.simple a) ⊗ I = I` vanish by naturality of the braiding.
- **Formal rigidity of fusion categories.** For every Artin local `k`-algebra `A` and every lift
  `Q` of `P` to `A`, there is a normalized gauge `g` over `A` with `g.map π = 1` and
  `Q = g • P.map (algebraMap k A)`. The proof is induction along the `𝔪_A`-adic filtration,
  using the dictionary and `DYCohomology (Model P) 3 = 0`. The gauge over `A/𝔪^j` lifts to `A`,
  because units lift.
- **Formal rigidity of braidings.** For `R : RSymbols P` and every lift `R'` of `R` to
  `RSymbols (P.map (algebraMap k A))`, `R' = R.map (algebraMap k A)`. The proof uses the
  dictionary and the `Center.ofBraided` case of Layer 5. Combined with the previous item: a lift
  of `(P, R)` to `A` is gauge equivalent to the constant lift.
- **Power series.** The same conclusions hold over `k⟦t⟧`. Lifts of `P` to `k⟦t⟧` are of the
  form `g • P.map (algebraMap k k⟦t⟧)` with `g ≡ 1 mod t`, and lifts of `R` are constant. The
  proof builds compatible gauges over `k[t]/(t^n)`; the inductive step lifts the given gauge.

**Checks.**

- `ι = ℤ/2`, `N_{ab}^c = [a + b = c]`, over `k[ε]/(ε²)`. The lifts of `F^{111}_1 = 1` are
  `1 + cε`, and the pentagon at `(1,1,1,1)` reads `2c = 0`. Normalized gauges fix `F^{111}_1`.
  So for `char k ≠ 2` only the constant lift exists. For `char k = 2` every `c` gives a lift, and
  these are pairwise inequivalent, matching `normGlobalDim = 2 = 0`.
- With `char k ≠ 2`, the R-symbols `R^{11}_0 = ±1` of `F^{111}_1 = 1` have no nonconstant lifts
  to `k[ε]/(ε²)`, since the hexagon gives `(R^{11}_0)² = F^{111}_1`.

### Layer 7: module categories

*Needs:* Layers 0, 5 and 6; PresentationsOfMonoidalCategories Layers 0 to 3; Mathlib
`MonoidalLeftAction`, `Functor.LeftLinear`.


Fix fusion rules `N` on `ι` with unit `u`, `P : FSymbols R N`, and a `Fintype` index `κ` for
the simple objects of the module category.

- **Data.**
  - `TauCeti.ModuleRules N κ` is `Nm : ι → κ → κ → ℕ` with `Nm_{u m}^n = if m = n then 1 else 0`.
  - `TauCeti.ModuleSymbols P Nm` holds `M`, `Minv`, both inverse laws, the module pentagon and
    the module triangle. Here `M^{a b m}_n : Matrix (Σ c, Fin N_{ab}^c × Fin Nm_{cm}^n)
    (Σ p, Fin Nm_{bm}^p × Fin Nm_{ap}^n) R` is defined by the left and right bases of
    `Hom((a ⊗ b) ⊙ m, n)` and `Hom(a ⊙ (b ⊙ m), n)`, exactly as `F` is.
  - The **module pentagon** is the pentagon of PresentationsOfMonoidalCategories with
    `A, B, C ∈ ι` and `D, E, r, s ∈ κ`, and with `F^{XYZ}_W` replaced by `M^{XYZ}_W` whenever
    `Z ∈ κ`. It expresses Mathlib's pentagon for `MonoidalLeftAction`.
  - The **module triangle** is `M^{a u m}_n[(a,0,j),(m,0,l)] = if j = l then 1 else 0`.
  - Provide `ext` on `M`, `reindex` along `τ : κ ≃ κ'`, and `map` along ring maps.
- **Model.**
  - `ModuleSymbols.Model Q` has objects `κ → FintypeCat` and grade-wise `Mat R` morphisms, as
    for `FSymbols.Model`. It is `Preadditive`, `Linear R`, has finite biproducts and is
    essentially small.
  - `(X ⊙ Y)_n = Σ a m, X_a × Y_m × Fin Nm_{am}^n`, with `(αₗ_ X Y Z).inv` built from `M` as
    `(α_ X Y Z).inv` is built from `F`.
  - **Main theorem:** `MonoidalLeftAction (Model P) (Model Q)`, `R`-linear in each variable.
- **Extraction and reconstruction.** Take `C` as in PresentationsOfMonoidalCategories Layer 2,
  with its normalized fusion basis. Let `M` be `R`-linear with finite biproducts and a
  `MonoidalLeftAction C M`, `R`-linear in each variable. Take `IsSplitSimpleBasis R T` for
  `T : κ → M` and a normalized action basis `φ^{am→n}_i` with `φ^{um→m}_0` the left unitor.
  - Extraction gives `Nm` and a `ModuleSymbols` over the extracted `P`.
  - Reconstruction is an `R`-linear equivalence `Model Q ≌ M`, which is a module functor along
    the reconstruction equivalence `Model P ≌ C`.
  - Round trip: extracting from `Model Q` returns `Q`.
- **Gauge and classification.**
  - A module gauge is a family of units `h^{am}_n` of `Matrix (Fin Nm_{am}^n) (Fin Nm_{am}^n) R`
    with `h^{um}_m = 1`. It acts by `M' = H_L · M · H_R⁻¹`, where
    `H_L[(c,i,j),(c,i,j')] = h^{cm}_n[j,j']` and
    `H_R[(p,k,l),(p,k',l')] = h^{bm}_p[k,k'] h^{ap}_n[l,l']`, both zero off the diagonal.
  - Classification: `Model Q` and `Model Q'` are equivalent as `R`-linear module categories over
    `Model P`, through a module functor over the identity of `Model P`, if and only if
    `Q' = h • Q.reindex τ`.
- **Rigidity of the action.** `Nm_{ā m}^n = Nm_{a n}^m`, from the adjunction
  `(Xᘁ ⊙ -) ⊣ (X ⊙ -)` given by `η_ X Xᘁ` and `ε_ X Xᘁ`, over a field.
- **Dictionary and formal rigidity.** As in Layer 6, with `θ` a cocycle of degree `2` for
  `actionFunctor : Model P ⥤ LinearEnd k (Model Q)` and `γ` of degree `1` giving the module
  gauge `1 + γ`. Conclusion: for separable `Model P` over `k`, every lift of `Q` to an Artin
  local `k`-algebra `A` (with `P` replaced by its constant lift) has the form
  `h • Q.map (algebraMap k A)` with `h.map π = 1`. The same holds over `k⟦t⟧`.
- **Bounds on module fusion rules.** Over a field, let `M_a` be the matrix
  `(M_a)_{mn} = Nm_{am}^n`, and put `K := max_c ∑_{a,b} N_{ab}^c`.
  - `M_b M_a = ∑_c N_{ab}^c M_c` and `M_ā = M_aᵀ`, so `M_Σ := ∑_a M_a` is symmetric with
    `M_Σ² ≤ K · M_Σ` entrywise.
  - Hence every `Nm_{am}^n ≤ K`, and each row of `M_Σ` has at most `K²` nonzero entries.
  - There are finitely many `ModuleRules N κ` satisfying these identities for each `κ`.
- **Indecomposable module categories.**
  - `M` is indecomposable when it is not equivalent to a direct sum of two nonzero module
    subcategories. For models: the graph on `κ` with an edge `m – n` whenever some
    `Nm_{am}^n ≠ 0` is connected.
  - In an indecomposable module category every simple is a summand of some `a ⊙ m`, for fixed
    `m`. Hence `Fintype.card κ ≤ K²`.

**Checks.**

- Over `Vec_{ℤ/2}`, the indecomposable module categories are `Vec_{ℤ/2}` (rank `2`) and `Vec`
  (rank `1`). `K = 2`, so the bound gives rank at most `4`.
- Over `Vec_G`, the indecomposable module categories correspond to pairs of a subgroup `H ≤ G`
  up to conjugacy and a class in `H²(H, kˣ)` (Ostrik). The model of the pair `(H, 1)` has
  `κ = G/H`.

### Layer 8: representability and finite orbits

*Needs:* Tau Ceti `GeneralLinear.coordinateHopfAlgebra`, `orbitMap`, `isConstructible_orbit`,
`IsConstructible.dense_interior`, `ArtinLocalAlg`; Mathlib Krull intersection, Nullstellensatz,
`NoetherianSpace.finite_irreducibleComponents`. Independent of the categorical layers, except
that representability names the data of Layers 6 and 7.


- **Representability.**
  - `FSymbols.coordRing N := MvPolynomial V ℤ ⧸ J`, with `V` the entries of `F` and `Finv` and
    `J` generated by the inverse laws, the pentagon and the triangle. Prove a bijection
    `FSymbols R N ≃ (FSymbols.coordRing N →+* R)`, natural in `R`.
  - The normalized gauge group is the group scheme of the tensor product of Tau Ceti's
    `GeneralLinear.coordinateHopfAlgebra ℤ (N_{ab}^c)` over triples with `a, b ≠ u`. The gauge
    action is a coaction of rings representing the action of PresentationsOfMonoidalCategories
    Layer 3.
  - Likewise, for `P` over a field `K`:
    - `RSymbols.coordRing P` is a finitely generated `K`-algebra;
    - `ModuleSymbols.coordRing P Nm` is a finitely generated `K`-algebra with the module gauge
      group acting.
  - The fusion and separable locus is the principal open set where `∏_a s_a` and
    `∑_a (s_a s_ā)⁻¹` are units.
- **Finite orbits.** Let `K` be algebraically closed and `𝒪` a finitely generated commutative
  `K`-algebra. Let `H` be a finitely generated commutative Hopf `K`-algebra that is a domain,
  coacting on `𝒪`, so that the group `G` acts on `X = Spec 𝒪` as in ReductiveGroups Layer 3A.
  Suppose that for every `x : 𝒪 →ₐ[K] K`, every Artin local `K`-algebra `A` and every
  `y : 𝒪 →ₐ[K] A` with `π ∘ y = x`, there is `g : H →ₐ[K] A` with `y = g · x`. Then `X(K)` has
  finitely many `G(K)`-orbits, and each orbit is an irreducible component of `X(K)`.

  Proof route, each step a target:
  - Applying the hypothesis to `A = 𝒪_{X,x}/𝔪^n` and using Krull's intersection theorem, the
    kernel of the orbit comorphism `𝒪 → H` maps to `0` in `𝒪_{X,x}`.
  - So the orbit closure of `x` contains every irreducible component through `x`. Since `H` is a
    domain, the orbit closure is irreducible. So `x` lies on exactly one component `Z_x`, and
    `Z_x` is the orbit closure.
  - By Chevalley's theorem (`isConstructible_orbit`) and `IsConstructible.dense_interior`, the
    orbit contains a dense open subset of `Z_x`. Two points of `Z_x` therefore have meeting
    orbits, so `Z_x` is one orbit.
  - Finiteness then follows from `NoetherianSpace.finite_irreducibleComponents`.
- **Isolated points.** With `H = K`: if every `A`-point lifting a `K`-point is constant, then
  `X(K)` is finite.
- **Points over a subfield.** Let `F ⊆ K` be an algebraically closed subfield and
  `𝒪 = K ⊗_F 𝒪_F` with `𝒪_F` finitely generated. Then every nonempty Zariski-open subset of
  `X(K)` contains a point coming from `𝒪_F →ₐ[F] F`. The proof expands a function in an
  `F`-basis of `K` and applies the Nullstellensatz over `F`. If `G` and the action are also
  defined over `F`, every orbit in the finite-orbits statement contains such a point.

### Layer 9: finiteness theorems

*Needs:* Layers 6, 7 and 8; PresentationsOfMonoidalCategories Layers 2 and 3.


Let `K` be algebraically closed. Throughout, "separable" is the hypothesis of the conventions.

- **Fusion categories.** Let `N` be fusion rules with a duality involution. There are finitely
  many `P₁, …, Pₘ : FSymbols K N` with the following property. Let `C` be separable and fusion
  over `K`, with a bijection `e : SimpleClasses C ≃ ι` sending `𝟙` to `u` and `fusionCoeff` to
  `N`. Then `C` is `K`-linearly monoidally equivalent to some `Model Pᵢ`. The proof combines
  extraction and classification (PresentationsOfMonoidalCategories Layers 2 and 3), Layer 6,
  and Layer 8 on the separable locus.
- **Braidings.**
  - For `P` separable, `RSymbols P` is finite.
  - For `C` separable and fusion over `K`, `Finite (BraidedCategory C)`. A braiding is
    determined by its R-symbols in a fixed fusion basis.
- **Braided fusion categories.** With `N` as above, there are finitely many separable braided
  fusion categories over `K` with fusion rules `N`, up to `K`-linear braided monoidal
  equivalence.
- **Module categories.** Let `C` be separable and fusion over `K`.
  - For each `r`, there are finitely many `K`-linear left module categories over `C` up to
    equivalence of module categories. Here a module category is semisimple with a split simple
    basis of size `r`, with the action `K`-linear in each variable.
  - There are finitely many indecomposable module categories in total, since their ranks are at
    most `K_N²` by Layer 7.
- **Fields of definition.** Let `F` be the algebraic closure of the prime field in `K`.
  - Every separable fusion category over `K` is `K`-linearly monoidally equivalent to
    `Model (P.map (algebraMap F K))` for some `P : FSymbols F N`.
  - With `P` so chosen, every braiding on `Model (P.map (algebraMap F K))` is
    `R.map (algebraMap F K)` for some `R : RSymbols P`.
  - Every module category over it is equivalent to
    `ModuleSymbols.Model (Q.map (algebraMap F K))` for some `Q` over `P`.
  - The proof is the points-over-a-subfield statement of Layer 8.

**Checks.**

- Fusion rules `ℤ/2`: exactly two gauge classes, `F^{111}_1 = ±1`.
- `F^{111}_1 = 1` carries the two braidings `R^{11}_0 = ±1`; `F^{111}_1 = −1` carries the two
  braidings `R^{11}_0 = ±i`.
- Fibonacci rules: exactly two gauge classes over `ℂ`, Fibonacci and Yang–Lee.

### Layer 10: the Deligne product and the Radford isomorphism

*Needs:* Layer 1; Mathlib `Mat_`, `MonoidalOpposite`, `MonObj`, `Mod`; Tau Ceti internal Hom
for module objects (`Monoidal/Mod/*`).


Fix `C` fusion over `k`.

- **Deligne product.** For finite semisimple `k`-linear categories `C`, `D` with split simples,
  define `C ⊠ D := Mat_ (C ⊗ₖ D)`. Here `C ⊗ₖ D` has pairs as objects and
  `Hom((X, Y), (X', Y')) = (X ⟶ X') ⊗[k] (Y ⟶ Y')`.
  - It is abelian and finite semisimple, with `SimpleClasses (C ⊠ D) ≃ SimpleClasses C ×
    SimpleClasses D` given by `S ⊠ T`.
  - **Universal property:** functors out of `C ⊠ D` that are `k`-linear correspond to functors
    out of `C × D` that are `k`-linear in each variable, with values in additive `k`-linear
    idempotent-complete categories.
  - For monoidal `C` and `D`, `(X ⊠ Y) ⊗ (X' ⊠ Y') = (X ⊗ X') ⊠ (Y ⊗ Y')`, making `C ⊠ D` fusion.
- **`C` as a module category.** `MonoidalLeftAction (C ⊠ Cᴹᵒᵖ) C` with
  `(X ⊠ Y) ⊙ Z = X ⊗ Z ⊗ Y`, extended along biproducts. Here `Cᴹᵒᵖ` is EGNO's `C^op`.
- **The canonical algebra.** `A := ⨁ S : SimpleClasses C, S.repr ⊠ ᘁS.repr`.
  - It represents `X ⊠ Y ↦ Hom (X ⊗ Y, 𝟙_ C)`, so it is the internal endomorphism object of
    `𝟙_ C` for this action.
  - It is a `MonObj` with the internal-endomorphism multiplication (EGNO, Definition 7.9.12 and
    Example 7.9.14).
- **Hopf bimodules.**
  - `V ↦ (V ⊠ 𝟙) ⊗ A` is an equivalence from `C` to right `A`-modules in `C ⊠ Cᴹᵒᵖ`, i.e. to
    Mathlib's `Mod` for `A` in `(C ⊠ Cᴹᵒᵖ)ᴹᵒᵖ` (EGNO, Proposition 7.18.5).
  - The natural isomorphism `ρ_V : (V ⊠ 𝟙) ⊗ A ≅ (𝟙 ⊠ V) ⊗ A` of right `A`-modules is monoidal
    in `V` (EGNO, (7.55) and (7.57)).
- **Unimodularity.** There is an isomorphism of right `A`-modules `A ≅ Aᘁ`, unique up to
  `Aut (𝟙_ C)` (EGNO, (7.66) and Remark 6.5.9: the distinguished invertible object of a fusion
  category is `𝟙`).
- **Radford isomorphism.** A monoidal natural isomorphism
  `radfordIso C : 𝟭 C ≅ (doubleRightDualFunctor C) ⋙ (doubleRightDualFunctor C)`
  (EGNO, Theorem 7.19.1 and Corollary 7.19.3).
  - It is a theorem about fusion categories, not a structure on rigid categories: compare
    PivotalSpherical's warning that no such isomorphism exists in general.
  - **Characterization on simples.** For simple `L` and any isomorphism `a : L ≅ Lᘁᘁ`,
    `bidualTrace a.hom • (radfordIso C).hom.app L
    = bidualTrace (a.inv)ᘁ • (a.hom ≫ (a.hom)ᘁᘁ)`.
    In particular `(radfordIso C).hom.app L = a.hom ≫ (a.hom)ᘁᘁ` whenever the two traces agree
    (EGNO, Theorem 7.21.7; ENO 2004, Theorem 7.3).
  - Corollary: for any `[PivotalCategory C]` with pivotal isomorphism `j`, the composite of
    `j ≫ jᘁᘁ` with `(radfordIso C).inv` lies in `Aut (LaxMonoidalFunctor.of (𝟭 C))`
    (EGNO, Remark 7.19.4).

### Layer 11: the pivotalization and characteristic zero

*Needs:* Layers 1, 9 and 10; PivotalSpherical Layer 11 (the steps proving `globalDim_ne_zero`).


- **Pivotalization.** `Pivotalization C` has:
  - objects `(X, f)` with `f : X ≅ Xᘁᘁ` and `f.hom ≫ (f.hom)ᘁᘁ = (radfordIso C).hom.app X`;
  - morphisms the morphisms of `C` commuting with the `f`;
  - tensor product `(X, f) ⊗ (Y, f')` formed with the tensorator of `doubleRightDualFunctor`;
  - right duals `(Xᘁ, (f.inv)ᘁ)`;
  - the tautological pivotal structure.

  The forgetful functor `Pivotalization C ⥤ C` is monoidal and preserves `squaredNorm`. Every
  simple `S` of `C` has exactly two lifts, `(S, ±f_S)`, when `char k ≠ 2`.
- **Fusion and spherical.** When `char k ≠ 2`:
  - `Pivotalization C` is fusion over `k`, with the pivotal structure above;
  - it is spherical (EGNO, Corollary 7.21.10), by the characterization of `radfordIso`.
- **Positivity (ENO, Theorem 2.3).** Let `k` have characteristic zero and `C` be fusion. Then:
  - for every simple `S` and every ring homomorphism `σ` from the algebraic closure of `ℚ` in
    `k` to `ℂ`, `σ (squaredNorm S)` is a nonnegative real number, and `σ (squaredNorm 𝟙) = 1`;
  - `σ (normGlobalDim C) ≥ 1`, so `C` is separable.

  The proof applies the steps of PivotalSpherical Layer 11's proof of `globalDim_ne_zero`, the
  common-eigenvector statement `ψ [Sᘁ] = conj (ψ [S])`, to `Pivotalization C`. It then
  transports the result along the forgetful functor and the comparison of Layer 1.
- **Ocneanu rigidity in characteristic zero.** Restate the theorems of Layers 5, 6, 7 and 9 for
  `k` algebraically closed of characteristic zero, without the separability hypothesis:
  - `DYCohomology F X Y n = 0` for `n ≥ 1`;
  - formal rigidity of F-symbols, R-symbols and module symbols;
  - finitely many fusion categories with given fusion rules;
  - finitely many braidings on each, and finitely many braided ones with given fusion rules;
  - finitely many module categories of each rank, and finitely many indecomposable ones;
  - definability over the algebraic numbers.

**Checks.**

- For a spherical fusion category with pivotal isomorphism `j`, `(radfordIso C).hom = j ≫ jᘁᘁ`
  componentwise, since then `bidualTrace j_L = bidualTrace (j_L⁻¹)ᘁ`.
- `Pivotalization (Vec_{ℤ/2})` has four simple objects and `normGlobalDim = 4`, twice that of
  `Vec_{ℤ/2}`.

## References

- P. Etingof, D. Nikshych, V. Ostrik, *On fusion categories*, Ann. of Math. 162 (2005), §§2, 3 and
  7.
- P. Etingof, D. Nikshych, V. Ostrik, *An analogue of Radford's S⁴ formula for finite tensor
  categories*, Int. Math. Res. Not. 2004, no. 54, §§2, 3 and 7.
- P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS Mathematical Surveys and
  Monographs 205 (2015), §§7.9, 7.18 to 7.22, 9.1 to 9.3.
- A. M. Gainutdinov, J. Haferkamp, C. Schweigert, *Davydov–Yetter cohomology, comonads and
  Ocneanu rigidity*, Adv. Math. 414 (2023), 108853.
- M. Barr, J. Beck, *Homology and standard constructions*, in Seminar on Triples and Categorical
  Homology Theory, Lecture Notes in Math. 80 (1969).
- A. Davydov, *Twisting of monoidal structures*, preprint MPI 95-123 (1995), arXiv:q-alg/9703001.
- D. Yetter, *Braided deformations of monoidal categories and Vassiliev invariants*, Contemp.
  Math. 230 (1998).
- M. Müger, *From subfactors to categories and topology I, II*, J. Pure Appl. Algebra 180 (2003).
- V. Ostrik, *Module categories, weak Hopf algebras and modular invariants*, Transform. Groups 8
  (2003).
