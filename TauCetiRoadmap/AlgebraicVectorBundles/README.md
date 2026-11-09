# Roadmap: algebraic vector bundles

**Summary.** This roadmap builds the pullback theory of module sheaves along morphisms of ringed
spaces, and the determinant of extensions of vector bundles on schemes, on top of Tau Ceti's oplax
monoidal module pullback, its power and internal-Hom comparisons and its determinant at locally
constant rank. It computes the stalks of a pulled-back module and of symmetric and exterior powers;
it makes pullback strong symmetric monoidal on all module sheaves, proves that flat pullback is
exact and that flat pullback commutes with internal Hom from a finitely presented source into an
arbitrary target, and proves that symmetric and exterior powers commute with pullback for every
module sheaf; it constructs the determinant of a short exact sequence of finite locally free
sheaves, with the direct sum and its Koszul sign as the split case; it compares the sheaf
determinant on affine opens with the graded-line determinant of PadicMeasuresIwasawaAlgebras §5.1;
and it recognises linear schemes among module schemes over `𝔸¹_X`. Its end theorems are

```text
f^*(E ⊗ F) ≅ f^* E ⊗ f^* F            every morphism of ringed spaces f : Y → X, all 𝒪_X-modules E, F,
f^* Hom(M, N) ≅ Hom(f^* M, f^* N)     f flat, M finitely presented, N arbitrary,
f^* Symⁿ M ≅ Symⁿ f^* M,  f^* ∧ⁿ M ≅ ∧ⁿ f^* M     every f and every module sheaf M,
det E′ ⊗ det E″ ≅ det E                every short exact sequence 0 → E′ → E → E″ → 0 of vector bundles,
det(E ⊕ F) ≅ det E ⊗ det F             the swap of summands acting by (−1)^(rank E · rank F),
```

together with the identification, on an affine open, of the determinant with the graded-line
determinant of PadicMeasuresIwasawaAlgebras §5.1, and the recognition of linear schemes as the
module schemes over `𝔸¹_X` whose coordinate algebra is free in degree one.

## Scope and ownership

The roadmap owns:

- the stalk `(f^* G)_y = 𝒪_{Y,y} ⊗ G_{f(y)}` of a pulled-back module and the strong symmetric
  monoidal structure on module pullback over all module sheaves, with its identity and composition
  coherences, for every morphism of ringed spaces (Layer 1);
- exactness of pullback along a flat morphism of ringed spaces on all module sheaves, the
  internal-Hom base-change comparison for every morphism of ringed spaces, and its invertibility
  along flat morphisms from a finitely presented source into an arbitrary target (Layer 2);
- the stalks of sheaf symmetric and exterior powers, and the invertibility of the pullback
  comparisons of these powers at every module sheaf, for every morphism of ringed spaces, with their
  degree-zero and multiplicative compatibilities (Layer 3);
- the determinant of a short exact sequence of finite locally free sheaves on a scheme, with its
  naturality, associativity and pullback compatibility, the direct sum with its Koszul sign as the
  split case, and the comparison on affine opens of the sheaf determinant with the ring-level
  determinant of PadicMeasuresIwasawaAlgebras §5.1 as graded lines (Layer 3);
- the weight grading of an affine scheme with an action of the multiplicative monoid `𝔸¹_X`, and
  the recognition of linear schemes among module schemes over `𝔸¹_X` (Layer 4).

Already at the pins, and consumed rather than restated (Tau Ceti at `2fd255d9`; paths relative
to `TauCeti/AlgebraicGeometry/`):

- for module sheaves on a topological space, in `TauCeti/Algebra/Category/ModuleCat/Sheaf/`: the
  oplax monoidal structure `TauCeti.SheafOfModules.pullbackOplaxMonoidal` of module pullback along
  any continuous functor of sites, with its unit, symmetry and composition laws
  (TensorProduct/Pushforward.lean); stalks of tensor products `TauCeti.SheafOfModules.tensorStalkEquiv`
  (TensorProduct/Stalk.lean); stalks of internal Hom from a finitely presented source
  `SheafOfModules.ihomStalkEquiv` (InternalHom/FinitePresentation.lean); and the pullback
  comparisons of powers for any adjunction with pushforward,
  `TauCeti.SheafOfModules.pullbackSymmetricPowerComparison` and
  `TauCeti.SheafOfModules.pullbackExteriorPowerComparison` (SymmetricPower/Pullback.lean,
  ExteriorPower/Pullback.lean);
- the monoidal, symmetric and closed structures on `X.Modules` (Modules/TensorProduct.lean); the
  oplax monoidal pullback with invertible tensor comparison when one factor is quasi-coherent,
  `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and
  `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right` (Modules/Pullback/Quasicoherent.lean),
  and the strong symmetric monoidal pullback of quasi-coherent sheaves
  `QuasicoherentSheaf.pullbackBraided` (Modules/Pullback/Monoidal/Basic.lean);
- the dualizability criterion on every scheme,
  `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree` and
  `QuasicoherentSheaf.nonempty_hasRightDual_iff_isFiniteLocallyFree`
  (VectorBundle/Dual/Dualizable.lean);
- quasi-coherence of internal Hom from a finitely presented source,
  `isQuasicoherent_ihom_of_isFinitePresentation` (Modules/InternalHom/Quasicoherent.lean); the
  base-change comparison `pullbackIhomComparison` for a quasi-coherent source
  (Modules/Pullback/InternalHom/Basic.lean); its invertibility for a finite locally free source
  and any target and morphism, `FiniteLocallyFreeSheaf.isIso_pullbackIhomComparison`
  (VectorBundle/InternalHom/Pullback.lean), and for a flat morphism, a finitely presented source
  and a quasi-coherent target, `Scheme.Hom.isIso_pullbackIhomComparison_app`
  (Modules/Pullback/InternalHom/Flat.lean); `Hom(E, 𝒪_X) ⊗ N ≅ Hom(E, N)` for locally free `E` of
  finite type, `Scheme.Modules.isIso_dualTensorIhom_of_isLocallyFree` (Modules/Dual.lean);
- the ranks of powers, `FiniteLocallyFreeSheaf.rank_symmetricPower_apply` and
  `FiniteLocallyFreeSheaf.rank_exteriorPower_apply` (VectorBundle/SymmetricPower/Basic.lean,
  VectorBundle/ExteriorPower/Basic.lean); the canonical comparisons
  `Scheme.Modules.pullbackSymmetricPowerComparison` and
  `Scheme.Modules.pullbackExteriorPowerComparison` on all modules
  (Modules/SymmetricPower/Pullback/Basic.lean, Modules/ExteriorPower/Pullback/Basic.lean), their
  identity and composition coherences `pullbackSymmetricPowerComparison_comp` and
  `pullbackExteriorPowerComparison_comp` (…/Pullback/Coherence.lean), and their invertibility at
  quasi-coherent modules, `isIso_pullbackSymmetricPowerComparison_app` and
  `isIso_pullbackExteriorPowerComparison_app` (…/Pullback/Quasicoherent.lean);
- the determinant `FiniteLocallyFreeSheaf.det` at locally constant rank, its functoriality on the
  core `FiniteLocallyFreeSheaf.determinantCore` and its agreement
  `FiniteLocallyFreeSheaf.detIsoDeterminant` with the fixed-rank functor
  (VectorBundle/Determinant/LocallyConstantRank.lean), the fixed-rank functor
  `FiniteLocallyFreeSheaf.determinant` (VectorBundle/Determinant/Basic.lean), the pullback
  comparison `FiniteLocallyFreeSheaf.pullbackDetIso` of `det` at locally constant rank and the
  fixed-rank comparison `FiniteLocallyFreeSheaf.pullbackDeterminantIso`
  (VectorBundle/Determinant/Pullback.lean); the Picard group `LineBundleClass` with
  `LineBundleClass.mk` (LineBundle/Class.lean); and, over a ring, the wedge product
  `TauCeti.exteriorPower.wedgeTensor : ⋀ᵖ M ⊗ ⋀^q N → ⋀ⁿ (M × N)` and, over a field, the
  isomorphism `TauCeti.exteriorPower.shortExactEquiv` of a short exact sequence
  (TauCeti/LinearAlgebra/ExteriorPower/Prod.lean, ShortExact.lean);
- relative Spec: the coordinate-algebra functor `affineFunctions` (RelativeSpec/AffineFunctions.lean),
  pullback of quasi-coherent algebras `QuasicoherentAlgebra.pullback` with its adjunction
  `QuasicoherentAlgebra.pullbackHomEquiv` (RelativeSpec/PullbackAlgebra.lean), the functor of
  points `relativeSpecHomIso` and `relativeSpecPullbackHomEquiv` (RelativeSpec/UniversalProperty.lean),
  the anti-equivalence `relativeSpecEquiv` (RelativeSpec/Equivalence.lean), and base change
  `relativeSpecBaseChangeIso` with its composition law `relativeSpecPullbackIso_comp`
  (RelativeSpec/BaseChange.lean);
- graded quasi-coherent algebras `GradedQuasicoherentAlgebra`
  (Modules/Quasicoherent/GradedAlgebra/Basic.lean), the graded symmetric algebra
  `gradedSymmetricAlgebra` and its adjunction `gradedSymmetricAlgebraAdjunction` with the degree-one
  functor (…/GradedAlgebra/SymmetricAlgebra/), the algebras free in degree one
  `FreeGradedQuasicoherentAlgebra` and `gradedSymmetricAlgebraEquiv` (…/GradedAlgebra/Free.lean),
  and the affine graded-ring charts `CommMon.isLocalization_gradedSections_basicOpen` and
  `CommMon.isBaseChange_restrictGradedSections` (Modules/GradedAlgebra/Localization.lean, with the
  affine-restriction case in Modules/GradedAlgebra/AffineRestriction.lean);
- graded relative Spec `gradedRelativeSpecEquiv` on `GradedAffineSchemeOver X`
  (RelativeSpec/Graded.lean); linear schemes `QuasicoherentLinearScheme`, `linearSpec` and the
  equivalence `linearSpecEquiv` (VectorBundle/LinearScheme.lean) with base change
  `QuasicoherentLinearScheme.pullback` (VectorBundle/LinearScheme/BaseChange.lean); the zero,
  addition and scalar multiplication of `Spec_X Sym F`, `addGrpObjRelativeSpecSymmetricAlgebra`
  and `modObjRelativeSpecSymmetricAlgebra` (RelativeSpec/SymmetricAlgebra/Group.lean,
  RelativeSpec/SymmetricAlgebra/Module.lean);
- geometric vector bundles `GeometricVectorBundle`, the total space `totalSpace` and the
  equivalence `totalSpaceEquiv` (VectorBundle/Geometric.lean); `totalSpaceScheme`, the
  section-valued universal property `totalSpaceHomEquiv` and base change
  `totalSpaceSchemeBaseChangeIso` (VectorBundle/TotalSpace.lean), naturality in the test scheme
  `totalSpaceHomIso` (VectorBundle/TotalSpace/FunctorOfPoints.lean), global sections
  `totalSpaceSectionEquiv` (VectorBundle/Sections.lean), and the dictionary in
  VectorBundle/TotalSpace/: direct sums `totalSpaceSchemeBiprodIso`, zero and addition
  `totalSpaceHomAddEquiv`, fibres `totalSpaceBaseChangeSpecIso` and `totalSpaceFiberIso`, tensor
  products `totalSpaceTensorHomEquiv`, internal Hom and duals `totalSpaceIhomHomEquiv` and
  `totalSpaceDualHomEquiv`, powers `totalSpaceSymmetricPowerHomEquiv` and
  `totalSpaceExteriorPowerHomEquiv`, the determinant `totalSpaceDeterminantHomEquiv`, and the
  trivial line bundle `totalSpaceTrivialIso`;
- closure of quasi-coherent sheaves under kernels, `Scheme.Modules.isQuasicoherent_kernel`
  (Modules/Quasicoherent/Kernels.lean), and under pushforward along quasi-compact quasi-separated
  morphisms, `Scheme.Modules.isQuasicoherent_pushforward`
  (Modules/Quasicoherent/Pushforward/QuasiSeparated.lean).

Four names are declared under this roadmap's namespace for its consumers: `isFiniteLocallyFree`
and `FiniteLocallyFreeSheaf` are the Tau Ceti notions under this roadmap's name,
`isFiniteLocallyFreeOfRank` is finite local freeness of constant rank `r`, and `determinantObj` is
Tau Ceti's `FiniteLocallyFreeSheaf.det`; SchemeAndStackFoundations builds its Grothendieck group
of finite locally free sheaves and its determinant on them.

The ring-level determinant of a finite projective module (invertible modules, the determinant by
the clopen rank decomposition, equal-rank determinant maps, base change, graded lines) is
PadicMeasuresIwasawaAlgebras §5.1; Layer 3 compares the sheaf determinant with it on affine
opens. The rank-one theory, Picard group and Jacobian are JacobianChallenge's. Curve-specific
degree theory is AlgebraicCurves'. Relative Proj is StableReduction's and
SchemeAndStackFoundations', consuming Tau Ceti's graded quasi-coherent algebras.

## Conventions

- In the statements about schemes, `X` is an arbitrary scheme in universe `u`; no separatedness,
  Noetherian or finiteness hypothesis is standing. `X.Modules` carries Tau Ceti's canonical instances
  `Scheme.Modules.instMonoidalCategory`, `Scheme.Modules.instSymmetricCategory` and
  `Scheme.Modules.instMonoidalClosed`; no second monoidal structure is introduced.
- A ringed space is a space `X : TopCat.{u}` with a sheaf of commutative rings
  `𝒪_X : Sheaf (Opens.grothendieckTopology X) CommRingCat.{u}`; its module sheaves are
  `SheafOfModules (TauCeti.SheafOfModules.ringCatSheaf 𝒪_X)`, with Tau Ceti's tensor product and
  internal Hom. A morphism of ringed spaces `f : Y → X` is a continuous map with a morphism of
  sheaves of rings `φ : 𝒪_X → f_* 𝒪_Y`, in Mathlib's form
  `φ : ringCatSheaf 𝒪_X ⟶ ((Opens.map f).sheafPushforwardContinuous RingCat _ _).obj (ringCatSheaf 𝒪_Y)`.
  Its module pullback `f^*` is Mathlib's `SheafOfModules.pullback φ`, the left adjoint of
  `SheafOfModules.pushforward φ`, with Tau Ceti's `TauCeti.SheafOfModules.pullbackOplaxMonoidal`. A
  morphism of schemes `f` is the instance `f.base`, `f.toRingCatSheafHom`, for which this pullback
  is `Scheme.Modules.pullback f`; formal schemes and adic spaces with their structure sheaves are
  further instances. The existence of the left adjoint,
  `(SheafOfModules.pushforward φ).IsRightAdjoint`, holds for every such `φ` by Mathlib's
  construction of `SheafOfModules.pullback`; statements carry it as an instance argument, because
  instance search does not find it for a general continuous map, and it is a proposition, so the
  pullback does not depend on its proof.
- The stalk `G_x` of an `𝒪_X`-module is a module over `𝒪_{X,x}` by Tau Ceti's
  `SheafOfModules.stalkModule`. A morphism of ringed spaces `f : X → Y` is flat when every stalk
  map `𝒪_{Y,f(x)} → 𝒪_{X,x}` induced by `φ` is flat (Stacks Project, Tag 02N3); for schemes this is
  Mathlib's `AlgebraicGeometry.Flat`.
- For a morphism of ringed spaces `f : X → Y`, the power comparisons are Tau Ceti's
  `TauCeti.SheafOfModules.pullbackSymmetricPowerComparison` and
  `TauCeti.SheafOfModules.pullbackExteriorPowerComparison` for the adjunction
  `SheafOfModules.pullbackPushforwardAdjunction φ`; for schemes they are
  `Scheme.Modules.pullbackSymmetricPowerComparison f n` and
  `Scheme.Modules.pullbackExteriorPowerComparison f n`. They run from `Symⁿ_Y ⋙ f^*` to
  `f^* ⋙ Symⁿ_X` and send `f^*(m₁ ⋯ mₙ)` to `f^* m₁ ⋯ f^* mₙ`; for exterior powers `f^*(m₁ ∧ m₂)`
  goes to `f^* m₁ ∧ f^* m₂`, never to its negative.
- Finite locally free means Tau Ceti's `Scheme.Modules.isFiniteLocallyFree X`: locally free and of
  finite presentation. Rank is the bundled locally constant function `X → ℕ`; constant rank is
  assumed only where a statement says so. On the empty scheme every sheaf is zero and every rank
  statement is vacuous.
- The determinant of a finite locally free `E` is Tau Ceti's `FiniteLocallyFreeSheaf.det E`, which
  is `∧ⁿ E` over the clopen locus of rank `n` and `𝒪_X` over the locus of rank `0`. An
  automorphism of `𝒪_X^r` with matrix `A` acts on it by `det A`, not by `det A⁻¹`. The
  isomorphism `det E′ ⊗ det E″ ≅ det E` of a short exact sequence `0 → E′ → E → E″ → 0` puts the
  subsheaf first: `e′₁ ∧ ⋯ ∧ e′_a ⊗ e″₁ ∧ ⋯ ∧ e″_b ↦ e′₁ ∧ ⋯ ∧ e′_a ∧ ẽ″₁ ∧ ⋯ ∧ ẽ″_b` for lifts
  `ẽ″_j` of `e″_j` (Stacks Project, Tag 0FJB).
- Graded lines follow PadicMeasuresIwasawaAlgebras §5.1: a graded line is an invertible module
  with a locally constant parity `ε` with values in `ℤ/2`, and the symmetry of `L ⊗ L′` is the
  swap multiplied by `(−1)^(ε ε′)`. The determinant of a finite projective `P` has parity
  `rank P mod 2`. Forgetting the parity gives the ordinary invertible module, whose symmetry is the
  plain swap.
- Gradings are by `ℕ`. A linear scheme is Tau Ceti's `QuasicoherentLinearScheme`: an affine scheme
  `p : V → X` with a grading of `p_* 𝒪_V` freely generated in degree one, with grading-preserving
  morphisms (the vector bundles of Stacks Project, Tag 062M, without finiteness). For
  quasi-coherent `F`, `linearSpec F = Spec_X Sym F` is contravariant in `F` and its `T`-points over
  `q : T → X` are the module maps `q^* F → 𝒪_T`; the total space `totalSpace E = Spec_X Sym(E^∨)`
  of a finite locally free `E` is covariant, with `T`-points the sections of `q^* E`.
- A module scheme over `𝔸¹_X` is an object `V` of `Over X` with a commutative group-object
  structure (Mathlib `AddGrpObj`) and an action of the multiplicative monoid object `𝔸¹_X`
  (Mathlib `ModObj`) that distributes over the addition of `𝔸¹_X` and over the addition of `V`;
  its morphisms are the morphisms over `X` preserving addition and action. The weight grading of
  an affine `V` with such an action puts a function `a` in degree `n` when the coaction sends it to
  `a tⁿ`. Witness: for `𝔸¹_X = Spec_X 𝒪_X[t]` with `λ · v = λ v`, the coordinate `t` has weight
  `1`; for the action `λ · v = λ² v` it has weight `2`.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:
`Scheme.Modules`, `Scheme.Modules.pullback`, `Scheme.Modules.pushforward`,
`Scheme.Modules.pullbackPushforwardAdjunction`, `Scheme.Modules.pullbackId` and
`Scheme.Modules.pullbackComp` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean);
`Scheme.Hom.toRingCatSheafHom` (Mathlib/AlgebraicGeometry/Modules/Presheaf.lean);
`SheafOfModules.pullback`, `SheafOfModules.pushforward`,
`SheafOfModules.pullbackPushforwardAdjunction`, `SheafOfModules.pullbackId` and
`SheafOfModules.pullbackComp` (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean);
`Functor.sheafPushforwardContinuous`, `TopologicalSpace.Opens.map`;
`TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso` (Mathlib/Topology/Sheaves/Stalks.lean),
invertibility of a morphism of sheaves on a space checked on stalks; `Module.FinitePresentation.isBaseChange_map`
(Mathlib/Algebra/Module/FinitePresentation.lean), flat base change of linear maps out of a finitely
presented module; `CategoryTheory.ShortComplex.ShortExact`; `SheafOfModules.IsQuasicoherent`,
`SheafOfModules.IsFinitePresentation`, `SheafOfModules.IsLocallyFree`,
`SheafOfModules.pullbackObjUnitToUnit`;
`AlgebraicGeometry.Flat`, flatness of a morphism of schemes as flatness of its stalk maps;
`AlgebraicGeometry.tilde` and `AlgebraicGeometry.tildeEquiv`; `IsAffineHom`, `AffineSpace`,
`AffineSpace.homOverEquiv`; `Functor.OplaxMonoidal.δ`, `CommMon`, `MonObj`, `ModObj`, `AddGrpObj`,
`GradedObject`, `HasLeftDual`, `ExactPairing`; `SymmetricAlgebra`, `Module.Basis.exteriorPower`,
`LinearMap.det`, `Nat.multichoose`. `SheafOfModules.IsLocallyFree` alone allows infinite and
chart-dependent index types; finite presentation is what makes it finite.

### From Tau Ceti

At Tau Ceti `2fd255d9`, besides the declarations listed under Scope and ownership:

- monoidal structure: `Scheme.Modules.instMonoidalCategory`,
  `Scheme.Modules.instSymmetricCategory`, `Scheme.Modules.instMonoidalClosed` and
  `Scheme.Modules.isMonoidal_isQuasicoherent` (TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean);
- pullback: `Scheme.Modules.pullbackOplaxMonoidal`, its comparison `Functor.OplaxMonoidal.δ`, the
  unit identification `Scheme.Modules.pullback_η` with `Scheme.Modules.pullbackObjUnitIso`, the
  symmetry law `Scheme.Modules.pullback_map_braiding_hom_comp_δ`, the composition law
  `Scheme.Modules.pullback_comp_δ` and `Scheme.Modules.pullbackObjUnitIso_comp`, and locality of
  invertibility `Scheme.Modules.isIso_iff_of_isOpenCover`
  (TauCeti/AlgebraicGeometry/Modules/Pullback/Basic.lean); exactness of flat pullback between
  quasi-coherent sheaves `Scheme.Hom.exact_map_pullback_of_flat` and
  `Scheme.Hom.preservesKernel_pullback_of_flat` (TauCeti/AlgebraicGeometry/Modules/Pullback/Flat.lean);
- module sheaves on a space: `TauCeti.SheafOfModules.ringCatSheaf`; the unit, tensor, symmetry and
  composition laws of the oplax monoidal pullback, `TauCeti.SheafOfModules.pullback_η`,
  `TauCeti.SheafOfModules.pullback_δ`, `TauCeti.SheafOfModules.pullback_map_braiding_hom_comp_δ`,
  `TauCeti.SheafOfModules.pullback_comp_η` and `TauCeti.SheafOfModules.pullback_comp_δ`
  (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Pushforward.lean); the stalk module
  `SheafOfModules.stalkModule` and the invariance of stalks under sheafification
  `PresheafOfModules.sheafificationStalkEquiv` (…/Sheaf/Stalk.lean); scalar extension of
  powers `IsBaseChange.symmetricPowerEquiv` and `IsBaseChange.exteriorPowerEquiv`
  (TauCeti/LinearAlgebra/SymmetricAlgebra/Localization.lean,
  TauCeti/LinearAlgebra/ExteriorPower/Localization.lean);
- internal Hom: `pullbackIhomComparison`, its description `pullbackIhomComparison_app_eq_curry` as
  the curry of the pulled-back evaluation after the inverse tensor comparison, its invertibility for
  a source with a quasi-coherent dual `isIso_pullbackIhomComparison_of_exactPairing`
  (TauCeti/AlgebraicGeometry/Modules/Pullback/InternalHom/Basic.lean),
  `Scheme.Hom.isIso_pullbackIhomComparison_app` (…/InternalHom/Flat.lean), its restriction to opens
  `Scheme.Opens.isIso_pullbackIhomComparison_app` (…/InternalHom/Restriction.lean) and its
  composition criterion `Scheme.Hom.isIso_pullbackIhomComparison_app_comp_iff`
  (…/InternalHom/Coherence.lean); finite presentation of a pullback
  `Scheme.Modules.isFinitePresentation_pullback` (Modules/Pullback/Basic.lean);
- powers: `SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower`, the sheafifications of
  the sectionwise powers, with `SheafOfModules.symmetricPowerZeroIso`,
  `SheafOfModules.symmetricPowerOneIso`, `SheafOfModules.exteriorPowerZeroIso`,
  `SheafOfModules.exteriorPowerOneIso` and the multiplication `SheafOfModules.symmetricPowerMul`
  (TauCeti/Algebra/Category/ModuleCat/Sheaf/SymmetricPower/, ExteriorPower/); the comparisons and
  their degree-one laws `Scheme.Modules.pullbackSymmetricPowerComparison_app_comp_symmetricPowerOneIso`
  and `Scheme.Modules.pullbackExteriorPowerComparison_app_comp_exteriorPowerOneIso`;
- finite locally free sheaves and determinants: `Scheme.Modules.isFiniteLocallyFree`,
  `FiniteLocallyFreeSheaf` with its finite biproducts, `FiniteLocallyFreeSheaf.free`,
  `FiniteLocallyFreeSheaf.pullback`, `FiniteLocallyFreeSheaf.rank`,
  `FiniteLocallyFreeSheaf.rankLocus`, `FiniteLocallyFreeSheaf.isConstantRank`,
  `FiniteLocallyFreeSheaf.FixedRank`, `FiniteLocallyFreeSheaf.isInvertible_iff_forall_rank_eq_one`
  (TauCeti/AlgebraicGeometry/VectorBundle/); `FiniteLocallyFreeSheaf.finiteProjectiveEquiv`, the
  affine comparison with finite projective modules (VectorBundle/Affine/Basic.lean);
  `SheafOfModules.isInvertible`, `InvertibleSheaf`, `InvertibleSheaf.tensorProduct`,
  `InvertibleSheaf.tensorProductComm`, `InvertibleSheaf.fixedRankOneEquiv` and
  `LineBundleClass.mk_eq_mk_iff` (TauCeti/AlgebraicGeometry/LineBundle/);
- linear schemes: `QuasicoherentLinearScheme`, `QuasicoherentLinearScheme.degreeOne`, `linearSpec`,
  `linearSpecEquiv`, `GradedAffineSchemeOver`, `gradedSymmetricAlgebraAdjunction`,
  `addGrpObjRelativeSpecSymmetricAlgebra` and `modObjRelativeSpecSymmetricAlgebra`, as listed under
  Scope and ownership.

Assumed: these carry the canonical instances above, so that the comparisons of Layers 1–3 are the
pinned ones and not re-derived; on schemes, Tau Ceti's oplax structure and power comparisons are
those of the ringed-space instance `f.base`, `f.toRingCatSheafHom`, definitionally.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§5.1: the determinant of a finite projective module by its clopen rank decomposition, the
determinant maps between finite projectives of equal rank function, their base change, and graded
lines with the Koszul symmetry. On `Spec A` the determinant sheaf is the associated sheaf of the
ring-level determinant, as graded lines: the comparison retains the rank function and its parity
and is compatible with the equal-rank determinant maps, with affine pullback and with the Koszul
symmetry of graded lines, and only then is the grading forgotten.

## How to read the build

Other roadmaps cite this roadmap by the labels L0A–L2B; each resolves as follows, one line per
label, with Tau Ceti paths relative to `TauCeti/AlgebraicGeometry/`:

- L0A (sheaves of modules) is Layer 1 for stalks of pullback and strong monoidal pullback; the
  symmetric monoidal closed structure on `X.Modules` is Tau Ceti's Modules/TensorProduct.lean.
- L0B (quasi-coherent and finite locally free sheaves) is Layer 2 for exactness of flat pullback
  and flat base change of internal Hom into an arbitrary target; the rest is Tau Ceti's
  VectorBundle/ and Modules/InternalHom/, Modules/Pullback/InternalHom/, as listed under Scope and
  ownership.
- L0C (polynomial operations) is Layer 3; ranks, the determinant and its functoriality and pullback
  are Tau Ceti's VectorBundle/SymmetricPower/, VectorBundle/ExteriorPower/ and
  VectorBundle/Determinant/.
- L1A (relative Spec) is Tau Ceti's RelativeSpec/AffineFunctions.lean, RelativeSpec/PullbackAlgebra.lean
  and RelativeSpec/UniversalProperty.lean; its `pullbackQuasicoherentAlgebra` is Tau Ceti's
  `QuasicoherentAlgebra.pullback`.
- L1B (the relative-Spec anti-equivalence) is Tau Ceti's RelativeSpec/Equivalence.lean and
  RelativeSpec/BaseChange.lean.
- L2A (structured linear schemes) is Layer 4 for the module-scheme recognition; graded algebras,
  graded relative Spec and `QCoh(X)ᵒᵖ ≌ LinearSch(X)` are Tau Ceti's
  Modules/Quasicoherent/GradedAlgebra/, Modules/GradedAlgebra/, RelativeSpec/Graded.lean and
  VectorBundle/LinearScheme.lean; its `linearSpecScheme X` is Tau Ceti's `linearSpec X` followed by
  `QuasicoherentLinearScheme.forget X`.
- L2B (geometric vector bundles) is Tau Ceti's VectorBundle/Geometric.lean,
  VectorBundle/TotalSpace.lean, VectorBundle/TotalSpace/ and VectorBundle/Sections.lean; its
  `totalSpaceBaseChangeIso` is Tau Ceti's `totalSpaceSchemeBaseChangeIso`, on affine schemes over
  the base.
- L0, the union of L0A–L0C, is Layers 1–3.

Layers 1–3 work along an arbitrary morphism of ringed spaces, with schemes as the instance the
pinned comparisons are stated for. Layer 1 computes the stalks of a pulled-back module and makes
pullback strong symmetric monoidal on all module sheaves. Layer 2 proves exactness of flat pullback
on all module sheaves, constructs the internal-Hom base-change comparison and proves flat base
change of internal Hom into an arbitrary target. Layer 3 computes the stalks of symmetric and exterior
powers, proves that these powers commute with pullback on all module sheaves, constructs on schemes
the determinant of a short exact sequence of vector bundles, with the direct sum and its sign as the
split case, and compares the sheaf determinant with the graded-line determinant on affine opens.
Layer 4 constructs the weight grading of an affine scheme with an action of `𝔸¹_X` and recognises
linear schemes among module schemes. The layers are independent of one another except where a
`*Needs:*` line says otherwise.

## Layer 1: pullback along morphisms of ringed spaces

### 1.1 Stalks of a pulled-back module

For a morphism of ringed spaces `(f, φ) : Y → X` (Conventions), an `𝒪_X`-module `G` and `y ∈ Y`,
construct the `𝒪_{Y,y}`-linear map `𝒪_{Y,y} ⊗_{𝒪_{X,f(y)}} G_{f(y)} → (f^* G)_y`,
`a ⊗ germ(m) ↦ a · germ(η_G(m))`, where `m` is a section of `G` on a neighbourhood `U` of `f(y)`
and `η_G(m)` is its image on `f⁻¹(U)` under the unit of `SheafOfModules.pullbackPushforwardAdjunction φ`,
and the tensor product is taken along the stalk map of `φ`. Prove that it is an isomorphism,
natural in `G` (Stacks Project, Tag 0098). Route: `f^* G` is the sheafification of a presheaf whose
stalk at `y` is the colimit, over neighbourhoods `U` of `f(y)` and `V ⊆ f⁻¹(U)` of `y`, of
`𝒪_Y(V) ⊗_{𝒪_X(U)} G(U)`, which is `𝒪_{Y,y} ⊗_{𝒪_{X,f(y)}} G_{f(y)}` because these colimits are
filtered; sheafification does not change stalks. *Needs:* Mathlib `SheafOfModules.pullback`,
`SheafOfModules.pullbackPushforwardAdjunction`; Tau Ceti `SheafOfModules.stalkModule`,
`PresheafOfModules.sheafificationStalkEquiv`.

**Checks.**
- `G = 𝒪_X`: both sides are `𝒪_{Y,y}`, and the map is `a ⊗ b ↦ a · φ_y(b)`, the stalk of the
  unit isomorphism `SheafOfModules.pullbackObjUnitToUnit`. For the inclusion of the origin in
  `𝔸¹_k` the stalk is `k ⊗_{k[t]_(t)} k[t]_(t) = k`; the topological inverse image `f⁻¹ G`, which
  omits the extension of scalars, would give `k[t]_(t)`.
- `G = 𝒪/(t)` on `𝔸¹_k`, pulled back to the origin: `k ⊗_{k[t]_(t)} k = k`.
- An open immersion `j : U → X`: `𝒪_{U,u} = 𝒪_{X,u}`, so `(j^* G)_u = G_u`.
- `G = j_! 𝒪_U` on `𝔸¹_k` for `U = D(t)` (extension by zero, not quasi-coherent), pulled back to a
  point `x`: the stalk is `κ(x) ⊗ 𝒪_{𝔸¹,x} = κ(x)` for `x ∈ U` and `0` at the origin, where
  `(j_! 𝒪_U)_0 = 0`.

### 1.2 Strong monoidal pullback

Prove `pullback_tensor_isIso`: for every morphism of ringed spaces `(f, φ) : Y → X` and all
`𝒪_X`-modules `E` and `F`, the oplax comparison `δ : f^* (E ⊗ F) → f^* E ⊗ f^* F` of
`TauCeti.SheafOfModules.pullbackOplaxMonoidal` is invertible (Stacks Project, Tag 01CD). For a
morphism of schemes this is the instance `f.base`, `f.toRingCatSheafHom`, where Tau Ceti proves it
when `E` or `F` is quasi-coherent; the statement here has no hypothesis on either. Route: by §1.1
and `TauCeti.SheafOfModules.tensorStalkEquiv`, the stalks at `y` of the two sides are
`𝒪_{Y,y} ⊗ (E_{f(y)} ⊗ F_{f(y)})` and `(𝒪_{Y,y} ⊗ E_{f(y)}) ⊗_{𝒪_{Y,y}} (𝒪_{Y,y} ⊗ F_{f(y)})`, and
the stalk of `δ` is the canonical isomorphism between them; a morphism of module sheaves on a space
that is bijective on every stalk is invertible (`TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso`,
applied to the underlying sheaves of abelian groups). Use the inverse of `δ` as the strong monoidal
tensor map `f^* E ⊗ f^* F → f^* (E ⊗ F)`, together with the unit isomorphism `f^* 𝒪_X → 𝒪_Y`, to
make pullback strong symmetric monoidal on module sheaves, extending Tau Ceti's
`QuasicoherentSheaf.pullbackBraided`. Identify the resulting identity and composition coherences
with Mathlib's `SheafOfModules.pullbackId` and `SheafOfModules.pullbackComp` (on schemes
`Scheme.Modules.pullbackId` and `Scheme.Modules.pullbackComp`), using the unit, symmetry and
composition laws `TauCeti.SheafOfModules.pullback_η`,
`TauCeti.SheafOfModules.pullback_map_braiding_hom_comp_δ`, `TauCeti.SheafOfModules.pullback_comp_η`
and `TauCeti.SheafOfModules.pullback_comp_δ`. *Needs:* §1.1; Mathlib `SheafOfModules.pullback`,
`SheafOfModules.pullbackId`, `SheafOfModules.pullbackComp`,
`TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso`; Tau Ceti
`TauCeti.SheafOfModules.pullbackOplaxMonoidal`, `TauCeti.SheafOfModules.tensorStalkEquiv` and the
four laws just named.

- On free sheaves the tensor comparison is the identity of `𝒪_Y^(I × J)` under the free
  presentations.
- The identity morphism of `X` gives the identity comparisons up to `SheafOfModules.pullbackId`.

**Checks.**
- Pull back `𝒪_X ⊗ 𝒪_X` along an open immersion and compute both sides as `𝒪_U`; a lax structure
  whose comparison is not invertible would already fail on `𝒪_X`.
- For `X = Spec ℤ`, `Y = Spec 𝔽_p` and `E = F = ℤ/p²` (as quasi-coherent modules), both sides are
  `𝔽_p`: the comparison is an isomorphism even though `E` is not flat, which rules out a
  statement that only holds for flat modules.
- The braiding on `f^*(E ⊗ E)` for `E = 𝒪_X²` swaps the basis vectors `e_i ⊗ e_j` and
  `e_j ⊗ e_i`; a structure compatible only with the associator would not pin this.
- For `X = 𝔸¹_k`, `U = D(t)` with open immersion `j`, and `E = F = j_! 𝒪_U` (global sections `0`,
  stalk `𝒪_{X,x}` at `x ∈ U`, so not quasi-coherent), pull back along a point `x`: by §1.1 both
  sides are `κ(x)` for `x ∈ U` and `0` at the origin. Tau Ceti's quasi-coherent case does not cover
  this instance.
- The theorem is about morphisms of ringed spaces, whose inverse images are filtered colimits, and
  fails for a general continuous functor of sites: for the functor from the discrete category on two
  objects `a`, `b` to the one-object category, both with the trivial topology and constant
  coefficients `k`, the left adjoint of pushforward sends `(N_a, N_b)` to `N_a ⊕ N_b`, so `δ` at
  `E = F = 𝒪` is a map `k² → k⁴`.

### Examples

- For `R → S` and modules over `Spec R`, the comparison is `(M ⊗_R N) ⊗_R S ≅ (M ⊗_R S) ⊗_S (N ⊗_R S)`.

### Dependencies

Mathlib module pullback along continuous functors of sites; Tau Ceti stalks of module sheaves,
stalks of tensor products, and the oplax monoidal pullback with its laws.

## Layer 2: flat pullback and base change of internal Hom

### 2.1 Exactness of flat pullback

Prove that for a flat morphism of ringed spaces `(f, φ) : X → Y` the functor
`SheafOfModules.pullback φ` is exact on all `𝒪_Y`-modules, not only between quasi-coherent sheaves
(Stacks Project, Tag 02N4); for schemes this extends Tau Ceti's
`Scheme.Hom.exact_map_pullback_of_flat`. Route: exactness of a sequence of module sheaves is
checked on stalks (Stacks Project, Tag 01AG), and by §1.1 the stalk of the pullback at `x` is
extension of scalars along the flat stalk map `𝒪_{Y,f(x)} → 𝒪_{X,x}`, applied to the stalk at
`f(x)`. *Needs:* §1.1; Mathlib `SheafOfModules.pullback`, `AlgebraicGeometry.Flat` for schemes.

**Checks.**
- `f : Spec k[t]_(t) → 𝔸¹_k` the flat localization at the origin and `j_! 𝒪_U ↪ 𝒪` for
  `U = D(t)`: the pulled-back map is `0 → k[t]_(t)` at the closed point and the identity of `k(t)`
  at the generic point, injective although `j_! 𝒪_U` is not quasi-coherent.
- `f` the inclusion of the origin in `𝔸¹_k` (not flat) and the injective `t : 𝒪 → 𝒪`: the
  pullback is `0 : k → k`, not injective, so flatness cannot be dropped.
- An open immersion is flat, and its pullback is restriction, which is exact.

### 2.2 Base change of internal Hom

For a morphism of ringed spaces `(f, φ) : X → Y` and `𝒪_Y`-modules `M` and `N`, construct the
comparison `c_{M,N} : f^* Hom(M, N) → Hom(f^* M, f^* N)` as the curry of
`f^*(ev) ∘ δ⁻¹ : f^* M ⊗ f^* Hom(M, N) → f^* N`, where `ev : M ⊗ Hom(M, N) → N` is evaluation and
`δ` is the tensor comparison of §1.2 at `(M, Hom(M, N))`; prove that it is natural in `M` and `N`
and compatible with `SheafOfModules.pullbackComp`. On a scheme with `M` quasi-coherent, `c_{M,N}`
is Tau Ceti's `(pullbackIhomComparison M f).app N` (`pullbackIhomComparison_app_eq_curry`). Prove
that `c_{M,N}` is an isomorphism when `f` is flat and `M` is finitely presented, for every `N`
(Stacks Project, Tag 0C6I). Route (the stalk proof of Tag 0C6I): `f^* M` is finitely presented
(Stacks Project, Tag 01BQ); at `x ∈ X`, §1.1 and `SheafOfModules.ihomStalkEquiv` (finitely
presented source, arbitrary target) identify the stalk of `c_{M,N}` with the map
`𝒪_{X,x} ⊗ Hom(M_{f(x)}, N_{f(x)}) → Hom(𝒪_{X,x} ⊗ M_{f(x)}, 𝒪_{X,x} ⊗ N_{f(x)})`, which is
bijective for the flat `𝒪_{Y,f(x)} → 𝒪_{X,x}` and the finitely presented `M_{f(x)}`
(`Module.FinitePresentation.isBaseChange_map`).

Prove `isIso_pullbackIhomComparison_app_of_flat`: for a flat morphism of schemes `f : X ⟶ Y`, a
finitely presented `M : Y.Modules` and an arbitrary `N : Y.Modules`, the pinned comparison
`(pullbackIhomComparison M f).app N` is an isomorphism. Tau Ceti's
`Scheme.Hom.isIso_pullbackIhomComparison_app` proves this for quasi-coherent `N`. The statement
carries `M`'s quasi-coherence, which finite presentation implies, because the pinned comparison is
built on it. It is the ringed-space theorem at `f.base`, `f.toRingCatSheafHom`, through
`pullbackIhomComparison_app_eq_curry`. A second route stays on schemes: invertibility is checked on
the preimages of an open cover of `Y` (`Scheme.Modules.isIso_iff_of_isOpenCover`), and the
comparison restricts to opens (`Scheme.Opens.isIso_pullbackIhomComparison_app`,
`Scheme.Hom.isIso_pullbackIhomComparison_app_comp_iff`); over an open on which `M` has a
presentation `𝒪^a → 𝒪^b → M → 0`, left exactness of `Hom(−, N)` gives
`Hom(M, N) = ker(N^b → N^a)`, flat pullback preserves this kernel by §2.1, `f^* M` has the
pulled-back presentation, and the comparisons for `𝒪^a` and `𝒪^b` are invertible by
`isIso_pullbackIhomComparison_of_exactPairing`. *Needs:* §1.1 and §1.2 (the comparison and the
stalk route), §2.1 (the scheme route only); Tau Ceti `SheafOfModules.ihomStalkEquiv`,
`pullbackIhomComparison`, `pullbackIhomComparison_app_eq_curry`,
`Scheme.Modules.isFinitePresentation_pullback`, `Scheme.Modules.isIso_iff_of_isOpenCover`,
`Scheme.Opens.isIso_pullbackIhomComparison_app`,
`Scheme.Hom.isIso_pullbackIhomComparison_app_comp_iff`,
`isIso_pullbackIhomComparison_of_exactPairing`; Mathlib `Module.FinitePresentation.isBaseChange_map`,
`AlgebraicGeometry.Flat`.

- On schemes, with `M` quasi-coherent, the naturality of the comparison in `M` and `N` and its
  compatibility with `Scheme.Modules.pullbackComp` are at the pin.
- For a non-flat `f` and finitely presented `M`, the comparison is only a map.

**Checks.**
- `M = 𝒪_Y/(t)` on `Y = 𝔸¹_k` and `f` the inclusion of the origin (not flat): `Hom(M, 𝒪_Y) = 0`,
  so `f^* Hom(M, 𝒪_Y) = 0`, but `Hom(f^* M, 𝒪_pt) = k`. The comparison is not surjective, so the
  flatness hypothesis cannot be dropped.
- For `M = 𝒪^(ℕ)` (free of countable rank, not finitely presented), `N = 𝒪` on `Spec ℤ`, and the
  flat `f : Spec ℚ → Spec ℤ`, internal Hom is the product sheaf. Its pullback is
  `colim_{m ≠ 0} ∏ᵢ ℤ[1/m]`, using restriction maps between basic neighbourhoods of the generic
  point, and maps into `∏ᵢ ℚ`. The sequence `(1/pᵢ)ᵢ` for distinct primes `pᵢ` has no preimage:
  each source vector uses only finitely many denominator primes. Thus the flat comparison
  need not be surjective without finite presentation.
- On `Y = 𝔸¹_k` with `U = D(t)` and `j : U → Y`, take `M = 𝒪_Y/(t)` and the non-quasi-coherent
  `N = j_! 𝒪_U ⊕ 𝒪_Y/(t)`, and let `f : Spec k[t]_(t) → Y` be the flat localization at the origin.
  `Hom(M, N)` is the `t`-torsion of `N`; the stalks of `j_! 𝒪_U` are `0` or domains, so it is the
  skyscraper `k` at the origin, and both sides of the comparison are `k` at the closed point. The
  pinned theorem does not apply, since `N` is not quasi-coherent.
- `M = 0` and `M = 𝒪_Y`: both sides are `0`, respectively `f^* N`, and the comparison is the
  identity under `Hom(𝒪, −) = id`.

### Examples

- On `Spec R`, for a flat `R → S`, a finitely presented `R`-module `M` and any `R`-module `N`, the
  map `Hom_R(M, N) ⊗_R S → Hom_S(M ⊗_R S, N ⊗_R S)` is an isomorphism.

### Dependencies

Layer 1; Tau Ceti stalks of internal Hom, the internal-Hom comparison on schemes and finite free
duality.

## Layer 3: symmetric and exterior powers, determinant

### 3.1 Stalks and pullback of powers

For a ringed space `(X, 𝒪_X)`, an `𝒪_X`-module `M`, `x ∈ X` and `n : ℕ`, prove that the stalks at
`x` of `SheafOfModules.symmetricPower 𝒪_X n` and `SheafOfModules.exteriorPower 𝒪_X n` applied to
`M` are `Symⁿ` and `∧ⁿ` of `M_x` over `𝒪_{X,x}`, through the maps induced by the sectionwise powers
(Stacks Project, Tag 01CH). Route: these sheaves are the sheafifications of the sectionwise powers,
sheafification does not change stalks (`PresheafOfModules.sheafificationStalkEquiv`), and `Symⁿ`
and `∧ⁿ` commute with filtered colimits and with extension of scalars
(`IsBaseChange.symmetricPowerEquiv`, `IsBaseChange.exteriorPowerEquiv`).

Prove `symmetricPower_pullback_isIso` and `exteriorPower_pullback_isIso`: for every morphism of
ringed spaces `(f, φ) : X → Y` and `n : ℕ`, Tau Ceti's comparisons
`TauCeti.SheafOfModules.pullbackSymmetricPowerComparison` and
`TauCeti.SheafOfModules.pullbackExteriorPowerComparison` for the adjunction
`SheafOfModules.pullbackPushforwardAdjunction φ`, natural maps `f^* Symⁿ(M) → Symⁿ(f^* M)` and
`f^* ∧ⁿ(M) → ∧ⁿ(f^* M)`, are isomorphisms at every `𝒪_Y`-module `M` (Stacks Project, Tag 01CI).
For a morphism of schemes they are `Scheme.Modules.pullbackSymmetricPowerComparison f n` and
`Scheme.Modules.pullbackExteriorPowerComparison f n`, the instance `f.base`, `f.toRingCatSheafHom`;
Tau Ceti proves them invertible at quasi-coherent `M` and in degree one. Route: by §1.1 and the
stalk formula above, at `x` both sides are `Symⁿ` (respectively `∧ⁿ`) over `𝒪_{X,x}` of
`𝒪_{X,x} ⊗ M_{f(x)}`, the stalk of the comparison is the scalar-extension isomorphism
`IsBaseChange.symmetricPowerEquiv` (respectively `IsBaseChange.exteriorPowerEquiv`), and stalks
detect isomorphisms (`TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso`). Prove further that in
degree zero the comparison is `SheafOfModules.pullbackObjUnitToUnit` under
`SheafOfModules.symmetricPowerZeroIso` and `SheafOfModules.exteriorPowerZeroIso`, and that the
symmetric comparison carries `f^*` of `SheafOfModules.symmetricPowerMul` to
`SheafOfModules.symmetricPowerMul` of `f^* M` through the strong monoidal structure of §1.2.
*Needs:* §1.1 (the stalk route), §1.2 (the multiplicative compatibility only); Tau Ceti
`TauCeti.SheafOfModules.pullbackSymmetricPowerComparison`,
`TauCeti.SheafOfModules.pullbackExteriorPowerComparison`,
`PresheafOfModules.sheafificationStalkEquiv`, `IsBaseChange.symmetricPowerEquiv`,
`IsBaseChange.exteriorPowerEquiv`, `SheafOfModules.symmetricPowerZeroIso`,
`SheafOfModules.exteriorPowerZeroIso`, `SheafOfModules.symmetricPowerMul`; Mathlib
`SheafOfModules.pullbackObjUnitToUnit`, `TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso`.

**Checks.**
- Stalks: for `M = 𝒪_X²` the stalk of `∧²` is `∧²(𝒪_{X,x}²) ≅ 𝒪_{X,x}`, that of `∧³` is `0` and
  that of `Sym²` is free of rank `3`; for `M = 𝒪/(t)` on `𝔸¹_k` at the origin, `Sym²` has stalk
  `k` and `∧²` has stalk `0`.
- `n = 1`: the comparison is the identity under the degree-one isomorphisms.
- `n = 0`: it is `SheafOfModules.pullbackObjUnitToUnit`, an isomorphism `f^* 𝒪_Y → 𝒪_X`.
- `M = 𝒪_Y²`, `n = 2`, `f` a point: both sides are the 1-dimensional `∧²` of the fibre; the
  comparison sends `e₁ ∧ e₂` to `e₁ ∧ e₂`, not to its negative; `∧³` is `0` on both sides.
- `Y = 𝔸¹_k`, `M = j_! 𝒪_U` for `U = D(t)` (not quasi-coherent), `f` the inclusion of a point `x`:
  `Sym²` gives `κ(x)` on both sides for `x ∈ U` and `0` at the origin, and `∧²` gives `0` on both
  sides; Tau Ceti's quasi-coherent case does not cover this instance.

### 3.2 The determinant of an extension

Construct the sheaf exterior multiplication `∧ᵃ M ⊗ ∧ᵇ M → ∧ᵃ⁺ᵇ M` on `X.Modules`, the
sheafification of the sectionwise wedge product, natural in `M`, associative and graded
commutative with the sign `(−1)^(ab)`.

For a short exact sequence `0 → E′ → E → E″ → 0` in `X.Modules` with `E′` and `E″` finite locally
free (then `E` is finite locally free of rank `rank E′ + rank E″`, being locally a direct sum),
construct the isomorphism `γ : InvertibleSheaf.tensorProduct (det E′) (det E″) ≅ det E` of
invertible sheaves which, on each open where `E′` and `E″` have constant ranks `a` and `b`, sends
`(e′₁ ∧ ⋯ ∧ e′_a) ⊗ (e″₁ ∧ ⋯ ∧ e″_b)` to `e′₁ ∧ ⋯ ∧ e′_a ∧ ẽ″₁ ∧ ⋯ ∧ ẽ″_b` for any local lifts
`ẽ″_j ∈ E` of the `e″_j` (Stacks Project, Tag 0FJB, for finite projective modules; Hartshorne,
*Algebraic Geometry*, II, Exercise 5.16(d), for constant ranks). Route: the value does not depend on
the lifts, because changing a lift by a section of `E′` adds a wedge of `a + 1` sections of the
rank-`a` sheaf `E′`; where `E′` and `E″` are free the map is an isomorphism by a basis computation;
the local maps agree on overlaps by the same formula and glue. Prove that `γ` is natural for
isomorphisms of short exact sequences (Stacks Project, Tag 0FJC), associative for a filtration
`E₁ ⊆ E₂ ⊆ E` with finite locally free subquotients (Stacks Project, Tag 0FJD), and compatible
with pullback along every morphism of schemes through `FiniteLocallyFreeSheaf.pullbackDetIso`
(pullback preserves these sequences, which are locally split).

For finite locally free `E` and `F`, the split sequence `0 → E → E ⊞ F → F → 0` gives the
isomorphism `det(E ⊞ F) ≅ InvertibleSheaf.tensorProduct (det E) (det F)` of invertible sheaves,
the inverse of its `γ`: on each clopen piece where `E` and `F` have constant ranks `a` and `b` it is
induced by `∧ᵃ E ⊗ ∧ᵇ F → ∧ᵃ⁺ᵇ (E ⊞ F)`, the wedge product of the images under the two inclusions
(sectionwise Tau Ceti's `TauCeti.exteriorPower.wedgeTensor`), and it is natural for isomorphisms in
`E` and `F`. Prove that it is compatible with the swap of summands up to the locally constant sign
`(−1)^(rank E · rank F)`, the determinant of `−1` on `E ⊗ F` (Stacks Project, Tag 0FJE): the
determinant of the swap `E ⊞ F ≅ F ⊞ E`, followed by the isomorphism for `(F, E)`, equals the
isomorphism for `(E, F)` followed by `InvertibleSheaf.tensorProductComm` and multiplication by that
sign. Prove compatibility with pullback through `FiniteLocallyFreeSheaf.pullbackDetIso` and with
the unit `det 0 ≅ 𝒪_X`.

Prove `mk_determinantObj_of_shortExact`: for a short exact sequence `0 → E′ → E → E″ → 0` of
`𝒪_X`-modules whose three terms are finite locally free, the class of `det E` in the Picard group
`LineBundleClass X` is the product of the classes of `det E′` and `det E″`. It is the class of `γ`
(`LineBundleClass.mk_eq_mk_iff`), and it makes the determinant additive on the Grothendieck group
of finite locally free sheaves. *Needs:* Tau Ceti `FiniteLocallyFreeSheaf.det`,
`FiniteLocallyFreeSheaf.rankLocus`, biproducts of finite locally free sheaves,
`InvertibleSheaf.tensorProduct`, `InvertibleSheaf.tensorProductComm`,
`FiniteLocallyFreeSheaf.pullbackDetIso`, `LineBundleClass.mk`, `LineBundleClass.mk_eq_mk_iff`,
`TauCeti.exteriorPower.wedgeTensor`; Mathlib `CategoryTheory.ShortComplex.ShortExact`.

**Checks.**
- The Euler sequence `0 → 𝒪(−1) → 𝒪² → 𝒪(1) → 0` on `ℙ¹_k` does not split, since
  `Hom(𝒪(1), 𝒪²) = H⁰(ℙ¹, 𝒪(−1))² = 0`; `γ` identifies `𝒪(−1) ⊗ 𝒪(1)` with `det 𝒪² = 𝒪`, and in
  `Pic(ℙ¹) = ℤ` the degrees satisfy `0 = −1 + 1`. The plausible wrong rule
  `det E ≅ det E′ ⊗ (det E″)^{−1}` would give `𝒪(−2)`, of degree `−2`.
- Orientation: for `0 → 𝒪 → 𝒪² → 𝒪 → 0` with inclusion `1 ↦ e₁` and the second projection,
  `γ(1 ⊗ 1) = e₁ ∧ e₂`; putting the quotient first would give `e₂ ∧ e₁ = −e₁ ∧ e₂`.
- For the split sequence of `E = F = 𝒪_X`, `γ` and the inverse of the direct-sum isomorphism both
  send `1 ⊗ 1` to `e₁ ∧ e₂`.
- On `X = Spec k ⊔ Spec k` with `E′` of rank `(1, 0)` and `E″` of rank `(0, 2)`, `det E` is `∧¹`
  on the first point and `∧²` on the second, and `γ` is defined piece by piece; no single rank
  describes it.
- Over a field `K`, on `X = Spec K`, `γ` is Tau Ceti's `TauCeti.exteriorPower.shortExactEquiv`,
  which also puts the subspace factor first.
- `E = F = 𝒪_X`: the swap of the two summands of `𝒪_X²` acts on `det(𝒪_X²) = ∧² 𝒪_X²` by `−1`,
  the determinant of the swap matrix and the value PadicMeasuresIwasawaAlgebras §5.1 fixes, while
  `InvertibleSheaf.tensorProductComm` on `𝒪_X ⊗ 𝒪_X` is `+1`; the sign `(−1)^(1·1) = −1` reconciles
  them. A comparison without the sign would give `+1` here.
- `E = 𝒪_X²`, `F = 𝒪_X`: the swap `(e₁, e₂, f) ↦ (f, e₁, e₂)` is a 3-cycle, of determinant `+1`,
  matching `(−1)^(2·1) = +1`; a sign `(−1)^(rank E + rank F)` would give `−1` here.
- `E = 0`: `det(0 ⊞ F) ≅ 𝒪_X ⊗ det F`, and the sign is `+1`.
- On `X = Spec k ⊔ Spec k` with `E` of rank `1` on the first component and `2` on the second and
  `F = 𝒪_X`, the sign is `−1` on the first component and `+1` on the second: it is a locally
  constant function, not a single number. Only `FiniteLocallyFreeSheaf.pullbackDetIso`, not the
  fixed-rank `FiniteLocallyFreeSheaf.pullbackDeterminantIso`, applies to its pullback.
- `det(𝒪_X^r) ≅ 𝒪_X`, and the automorphism given by an invertible matrix `A` acts by `det A`; the
  dual convention would give `det A⁻¹`, visible for `A = diag(2, 1)` over `ℚ`.

### 3.3 Affine comparison with graded lines

On an affine open `Spec A`, with `E` the sheaf of the finite projective `A`-module `P` through
`FiniteLocallyFreeSheaf.finiteProjectiveEquiv`, prove that `det E` is the associated sheaf of the
ring-level determinant of PadicMeasuresIwasawaAlgebras §5.1 (Stacks Project, Tag 01I8, for
`(∧ⁿ P)~ ≅ ∧ⁿ(P~)` in constant rank `n`; the clopen rank decomposition of
PadicMeasuresIwasawaAlgebras §5.1 in varying rank), as an isomorphism of graded lines: it
carries the rank function `x ↦ rank(P_x)` and its parity `x ↦ rank(P_x) mod 2`, is compatible with
the ring-level determinant map of every map between finite projectives of equal rank function and
with affine pullback, and matches the Koszul symmetry `(−1)^(ε ε′)` of graded lines; Tau Ceti's
`FiniteLocallyFreeSheaf.det` is this comparison followed by forgetting the grading. Prove that the
direct-sum isomorphism of §3.2 corresponds, on `Spec A`, to the ring-level direct-sum isomorphism
of graded lines, the sign of §3.2 being the Koszul sign. *Needs:* PadicMeasuresIwasawaAlgebras §5.1;
Tau Ceti `FiniteLocallyFreeSheaf.det`, `FiniteLocallyFreeSheaf.finiteProjectiveEquiv`; §3.2 for the
direct-sum statement only.

**Checks.**
- `P = A` of rank `1`: the graded line has parity `1`, so its symmetry on `L ⊗ L` is `−1` times the
  swap, while the ungraded symmetry of `InvertibleSheaf X` is the plain swap; comparing Koszul
  symmetry after forgetting the grading would lose this sign.
- `A = k × k` and `P` of rank `1` on the first factor and `2` on the second: the parity is `(1, 0)`
  and the determinant sheaf is `∧¹` on the first point and `∧²` on the second.
- For `φ : A² → A²` with matrix `B`, the ring-level determinant map is multiplication by `det B`,
  and so is `∧²` of the associated sheaf map; a comparison that inverted `φ` would give
  `det B⁻¹`, which is not even defined for `B = diag(t, 1)` over `k[t]`.
- `P = 0`: both sides are `A` with parity `0`.

### Examples

- For a finite projective module `P` over a ring `R` of constant rank `r`, the determinant sheaf on
  `Spec R` is the associated sheaf of `∧ʳ P`, of parity `r mod 2`.

### Dependencies

Layer 1 (§1.1 for the stalk route of §3.1, §1.2 for its multiplicative compatibility); Tau Ceti
power functors and comparisons, rank, rank loci, determinant and the Picard group;
PadicMeasuresIwasawaAlgebras §5.1.

## Layer 4: linear schemes as module schemes

### 4.1 The weight grading and the recognition theorem

For an affine scheme `p : V → X` with an action of the multiplicative monoid object `𝔸¹_X`,
construct its weight grading: the coaction `p_* 𝒪_V → p_* 𝒪_V ⊗ 𝒪_X[t]` sends each local section
`a` to a finite sum `Σₙ aₙ tⁿ`, and `p_* 𝒪_V` is the direct sum of the quasi-coherent pieces
`{a : a = aₙ}`, a grading by `ℕ` of the quasi-coherent algebra `p_* 𝒪_V` (the argument of Stacks
Project, Tag 0EKK, for `𝔾_m` and `ℤ`, with Laurent polynomials replaced by polynomials). Prove that
action-preserving morphisms over `X` correspond exactly to grading-preserving ones, and that for a
module scheme over `𝔸¹_X` the degree-zero piece is `𝒪_X`, since scalar multiplication by `0`
factors through the zero section. Prove that the weight grading of `linearSpec F`, with Tau Ceti's
`modObjRelativeSpecSymmetricAlgebra`, is the symmetric-power grading of `Sym F`. Prove the
recognition theorem: an affine module scheme over `𝔸¹_X` whose weight-graded algebra `A` has
invertible counit `Sym(A₁) → A` of `gradedSymmetricAlgebraAdjunction` is a linear scheme, and this
gives an equivalence between such module schemes, with module-scheme morphisms, and
`QuasicoherentLinearScheme X`, with grading-preserving morphisms; the addition of such a module
scheme is determined by its action, as the unique graded comultiplication restricting to
`a ↦ a ⊗ 1 + 1 ⊗ a` in degree one (Stacks Project, Tags 062M and 062N for linear schemes).
*Needs:* Mathlib `ModObj`, `AddGrpObj`, `AffineSpace`; Tau Ceti `QuasicoherentLinearScheme`,
`linearSpec`, `gradedSymmetricAlgebraAdjunction`, `addGrpObjRelativeSpecSymmetricAlgebra`,
`modObjRelativeSpecSymmetricAlgebra`, `affineFunctions`.

**Checks.**
- Over `𝔽_p`, `α_p = Spec 𝔽_p[t]/(t^p)` with `t` primitive and the scalar action `t ↦ λ t` is a
  module scheme over `𝔸¹`, with `t` of weight `1`; the counit `𝔽_p[t] → 𝔽_p[t]/(t^p)` is not
  injective, so `α_p` is not a linear scheme and the free-generation condition is needed.
- Over `𝔽₂`, `𝔾_a` with the action `λ · v = λ² v` is a module scheme over `𝔸¹`, since
  `(λ + μ)² = λ² + μ²` in characteristic `2`; its coordinate has weight `2`, so `A₁ = 0` and the
  counit `𝒪_X → 𝒪_X[t]` is not surjective. Over `ℚ` the same action is not distributive.
- `linearSpec(𝒪_X^r) = 𝔸^r_X`, with weight grading the polynomial degree and `T`-points the
  `r`-tuples of functions on `T`.
- The morphism `t ↦ t²` of `𝔸¹_X` is a morphism over `X` but sends weight `1` to weight `2`; it is
  neither action-preserving nor grading-preserving, consistently with the morphism
  correspondence.

### Examples

- `𝔸¹_X` itself, with addition and the multiplication action, is `linearSpec 𝒪_X`, and its weight
  grading puts `t` in degree `1`.

### Dependencies

Tau Ceti linear schemes, graded symmetric algebras and the module structure on `Spec_X Sym F`.

## Downstream consumers

SchemeAndStackFoundations builds its Grothendieck group of finite locally free sheaves on
`FiniteLocallyFreeSheaf` and `isFiniteLocallyFreeOfRank` and its determinant `K0.det` on
`determinantObj`; the additivity of `K0.det` on short exact sequences is
`mk_determinantObj_of_shortExact`, and relative Proj and Chern classes are its own.
AdicSpacesPartIII F0.8, *internal-hom-sheaf-of-modules*, parts (a) and (b), are §1.2 and §2.2 on
the ringed spaces of that layer (formal schemes and adic spaces with their structure sheaves), and
the flat pullback it takes from L0B is §2.1. FaltingsFinitenessAndIsogenyTheorems and
AbelianSchemesAndArithmeticModuli use the determinant through `determinantObj`, with its pullback
and direct-sum compatibilities. GroebnerGeometry, StableReduction, NilpotentOrbits, ReductiveGroups
and SchubertGeometry cite this roadmap for finite locally free sheaves, graded algebras, relative
Spec and total spaces, which are the Tau Ceti declarations listed under Scope and ownership; the
label lines of How to read the build say where each label resolves.

## References

- The Stacks Project, Sheaves on Spaces (Tag 0098), Sheaves of Modules (Tags 01AG, 01BQ, 01CD,
  01CH, 01CI, 02N3, 02N4, 0C6I), Schemes (Tag 01I8), More on Algebra (Tags 0FJB, 0FJC, 0FJD,
  0FJE), Constructions of Schemes (Tags 01M1, 062M, 062N), Groupoids (Tag 0EKK).
- R. Hartshorne, *Algebraic Geometry*, Graduate Texts in Mathematics 52, Springer, 1977, II,
  Exercise 5.16.
