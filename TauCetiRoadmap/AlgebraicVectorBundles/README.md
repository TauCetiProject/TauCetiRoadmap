# Roadmap: algebraic vector bundles

**Summary.** This roadmap is the interface to the theory of algebraic vector bundles over an
arbitrary scheme `X` as Tau Ceti carries it at the pins, and it owns what that theory states only
for quasi-coherent or only for finite locally free sheaves, in its general form. At the pins the
library has the symmetric monoidal closed category `X.Modules`, quasi-coherent sheaves with strong
symmetric monoidal pullback, finite locally free sheaves with their bundled locally constant rank,
duals, rigidity, the dualizability criterion, quasi-coherence and base change of the internal Hom,
the symmetric and exterior powers with their rank formulas and pullback isomorphisms, the
determinant with its pullback, quasi-coherent commutative algebras, the relative-Spec
anti-equivalence with its functor of points and base change, graded quasi-coherent algebras, the
linear-scheme equivalence `QCoh(X)ᵒᵖ ≌ LinearSch(X)`, geometric vector bundles with the
equivalence `FinLocFree(X) ≌ GeomVB(X)`, the universal property `Hom_X(T, V(E)) ≃ Γ(T, f^* E)` and
the sheaf/geometric dictionary. All of this is consumed by name and never restated. The end
theorems of the roadmap are

```text
f^*(E ⊗ F) ≅ f^* E ⊗ f^* F,   f^* Symⁿ(E) ≅ Symⁿ(f^* E),   f^* ∧ⁿ(E) ≅ ∧ⁿ(f^* E)
    for every morphism f : Y → X and every 𝒪_X-module E, F;
det(E ⊕ F) ≅ det E ⊗ det F    for finite locally free E, F, natural, compatible with pullback,
    and intertwining the swap of summands with the symmetry up to the Koszul sign;
on Spec A the determinant sheaf is the associated sheaf of the ring-level determinant of
    PadicMeasuresIwasawaAlgebras §5.1, as graded lines.
```

## Scope and ownership

The roadmap owns:

- the strong symmetric monoidal structure on `Scheme.Modules.pullback` on all `𝒪_X`-modules,
  with its identity and composition coherences (Layer 1); the pinned library has it on
  quasi-coherent sheaves and for a tensor product one of whose factors is quasi-coherent;
- the pullback comparisons of symmetric and exterior powers on all `𝒪_X`-modules (Layer 2); the
  pinned library has the comparison maps, their coherences, and their invertibility for
  quasi-coherent sheaves and in degree one;
- the determinant of a direct sum of finite locally free sheaves with its Koszul sign, and the
  affine comparison of the determinant sheaf with the ring-level determinant of a finite
  projective module as graded lines (Layer 2).

Already at the pins, and consumed rather than restated (exact names and files in the supplier
contracts), listed by the labels under which other roadmaps cite this one:

- L0A, sheaves of modules: the monoidal, symmetric and closed structures on `X.Modules`; the
  oplax monoidal structure of `Scheme.Modules.pullback` with its unit isomorphism, symmetry and
  composition laws; the invertibility of the tensor comparison when one factor is quasi-coherent
  (`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`); the strong symmetric monoidal structure
  on pullback of quasi-coherent sheaves (`QuasicoherentSheaf.pullbackBraided`,
  `Scheme.Modules.pullbackToModulesMonoidal`) with monoidal identity and composition isomorphisms.
  Layer 1 extends the invertibility to all module sheaves.
- L0B, quasi-coherent and finite locally free sheaves: `QuasicoherentSheaf X` with its symmetric
  monoidal structure; `FiniteLocallyFreeSheaf X` with closure under isomorphism, finite
  biproducts and pullback with identity and composition isomorphisms; the bundled rank
  `FiniteLocallyFreeSheaf.rank`, its clopen rank loci and its formulas on free sheaves,
  pullbacks, biproducts and tensor products; the fixed-rank subcategories and the equivalence of
  rank one with `InvertibleSheaf X`; the dual `FiniteLocallyFreeSheaf.dual`, the rigid
  structure, the double-dual isomorphism and the pullback of duals; the affine comparison with
  finite projective modules; the dualizability criterion on every scheme, a quasi-coherent sheaf
  being finite locally free if and only if it has a left (equivalently right) dual in
  `QuasicoherentSheaf X` (`QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`);
  quasi-coherence of the internal Hom from a finitely presented source into a quasi-coherent
  target (`Scheme.Modules.isQuasicoherent_ihom_of_isFinitePresentation`); the base-change
  comparison `f^* Hom(E, F) → Hom(f^* E, f^* F)` for quasi-coherent `E`
  (`Scheme.Modules.pullbackIhomComparison`) with its coherences, invertible for flat `f` and
  finitely presented `E` into quasi-coherent `F` (`Scheme.Hom.isIso_pullbackIhomComparison_app`)
  and for finite locally free `E`, arbitrary `f` and arbitrary `F`
  (`FiniteLocallyFreeSheaf.pullbackIhomIso`); the isomorphism `Hom(E, F) ≅ E^∨ ⊗ F` for finite
  locally free `E` (`FiniteLocallyFreeSheaf.dualTensorInternalHomIso`); closure of quasi-coherent
  sheaves under kernels and under pushforward along quasi-compact quasi-separated morphisms.
- L0C, powers and determinant: the sheaf symmetric and exterior power functors on all
  `𝒪_X`-modules with their degree-zero and degree-one isomorphisms; the symmetric and exterior
  powers of finite locally free sheaves with the rank formulas `multichoose r n` and
  `choose r n` (`rank_symmetricPower_apply` and `rank_exteriorPower_apply` in the namespace
  `FiniteLocallyFreeSheaf`); the pullback comparison maps
  `Scheme.Modules.pullbackSymmetricPowerComparison` and
  `Scheme.Modules.pullbackExteriorPowerComparison` with their identity and composition laws,
  invertible for quasi-coherent sheaves and in degree one, and as natural isomorphisms on finite
  locally free sheaves (`FiniteLocallyFreeSheaf.pullbackSymmetricPowerIso`,
  `FiniteLocallyFreeSheaf.pullbackExteriorPowerIso`); the determinant
  `FiniteLocallyFreeSheaf.det` of a finite locally free sheaf of locally constant rank, the
  determinant functor `FiniteLocallyFreeSheaf.determinant X r` on the fixed-rank subcategory,
  their identification, functoriality of `det` on the core, the free, rank-one and rank-zero
  identifications, and the pullback isomorphisms of both. Layer 2 adds the all-module pullback
  comparisons, the direct-sum formula and the affine comparison.
- L1A, relative Spec: `QuasicoherentAlgebra X`, `AffineSchemeOver X`, `relativeSpec X`, its
  affine charts and its computation over an affine base; the algebra of regular functions
  `p_* 𝒪_V` of a scheme over `X` (`Scheme.Hom.pushforwardStructureAlgebra`), quasi-coherent for
  affine `p`, and the coordinate-algebra functor `affineFunctions X`; pullback of quasi-coherent
  algebras (`QuasicoherentAlgebra.pullback`) with identity and composition isomorphisms and its
  adjunction with regular functions; the functor of points, `X`-morphisms `T → Spec_X(A)`
  corresponding to algebra maps `A → q_* 𝒪_T`, equivalently `f^* A → 𝒪_T`, naturally in `T` and
  in `A` (`CommMon.relativeSpecHomEquiv`, `relativeSpecHomIso`, `relativeSpecPullbackHomEquiv`).
- L1B, the anti-equivalence and base change: `relativeSpecEquiv X` with quasi-inverse
  `affineFunctions X`, explicit unit and counit (`relativeSpec_isEquivalence`); the base-change
  isomorphism `Y ×_X Spec_X(A) ≅ Spec_Y(f^* A)` natural in `A` (`relativeSpecBaseChangeIso`,
  `relativeSpecPullbackIso`), with its identity and composition laws; fibre products of affine
  `X`-schemes as relative spectra of tensor products.
- L2A, graded algebras and linear schemes: nonnegatively graded quasi-coherent algebras
  `GradedQuasicoherentAlgebra X` with the degree functors, the underlying quasi-coherent algebra,
  the affine graded-ring interface (sections, localization, affine restriction, finite type and
  generation in degree one); the graded symmetric algebra `gradedSymmetricAlgebra X`, left adjoint
  to the degree-one functor, and the ungraded symmetric algebra left adjoint to the forgetful
  functor; the algebras free in degree one `FreeGradedQuasicoherentAlgebra X` with the
  equivalence `gradedSymmetricAlgebraEquiv X` and the criterion that `Sym(A_1) → A` is an
  isomorphism; pullback of graded algebras and of symmetric algebras; graded affine schemes and
  the graded relative Spec equivalence; linear schemes `QuasicoherentLinearScheme X`, the functor
  `linearSpec X` sending `F` to `V_lin(F) = Spec_X Sym(F)` with its module-scheme structure, the
  equivalence `linearSpecEquiv X : (QuasicoherentSheaf X)ᵒᵖ ≌ QuasicoherentLinearScheme X`, and
  the base change of linear schemes.
- L2B, geometric vector bundles: `GeometricVectorBundle X`, the full subcategory of linear
  schemes whose degree-one piece is finite locally free; the covariant total space
  `totalSpace X` sending `E` to `V(E) = Spec_X Sym(E^∨)`, the equivalence `totalSpaceEquiv X`;
  the universal property `Hom_X(T, V(E)) ≃ Γ(T, f^* E)` naturally in `T` and `E`
  (`totalSpaceHomEquiv`, `totalSpaceHomIso`); and the dictionary: base change
  (`totalSpaceSchemeBaseChangeIso`), sections (`totalSpaceSectionEquiv`), fibres as affine spaces
  of dimension the rank (`totalSpaceFiberIso`), direct sums as fibre products over `X`
  (`totalSpaceBiprodIso`), the zero section and fibrewise addition (`totalSpaceHomAddEquiv`), and
  the points of the total spaces of duals, tensor products, internal Homs, symmetric and exterior
  powers and determinants, the trivial and free bundles, and the affine case.

Consumers that cite this roadmap's labels for these objects use the Tau Ceti declarations: the
fixed-rank predicate is `FiniteLocallyFreeSheaf.isConstantRank`, the rank is
`FiniteLocallyFreeSheaf.rank`, the dual is `FiniteLocallyFreeSheaf.dual`, the power functors are
`SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower`, the determinant is
`FiniteLocallyFreeSheaf.det`, relative Spec is `TauCeti.AlgebraicGeometry.relativeSpec` on
`QuasicoherentAlgebra X` and `AffineSchemeOver X`, graded algebras are
`GradedQuasicoherentAlgebra X`, linear schemes are `QuasicoherentLinearScheme X` and total spaces
are `totalSpace X`.

Four names are declared under this roadmap's namespace for its consumers: `isFiniteLocallyFree`
and `FiniteLocallyFreeSheaf` are the Tau Ceti notions above under this roadmap's name,
`isFiniteLocallyFreeOfRank` is finite local freeness of constant rank `r`, and `determinantObj`
is Tau Ceti's determinant `FiniteLocallyFreeSheaf.det` as an object of `InvertibleSheaf X`;
SchemeAndStackFoundations builds its Grothendieck group of finite locally free sheaves and its
determinant on them.

The ring-level determinant of a finite projective module (invertible modules, the determinant by
the clopen rank decomposition, equal-rank determinant maps, graded lines, base change) is
PadicMeasuresIwasawaAlgebras §5.1; Layer 2 compares the sheaf determinant with it on affine opens.
The rank-one theory, Picard group and Jacobian are JacobianChallenge's. Curve-specific degree
theory is AlgebraicCurves'. Relative Proj is StableReduction's and SchemeAndStackFoundations',
consuming the graded algebras of L2A.

## Conventions

- `X` is an arbitrary scheme in universe `u`; no separatedness, Noetherian or finiteness
  hypothesis is standing. `X.Modules` carries Tau Ceti's canonical instances
  `Scheme.Modules.instMonoidalCategory`, `Scheme.Modules.instSymmetricCategory` and
  `Scheme.Modules.instMonoidalClosed`; no second monoidal structure is introduced, so
  commutative monoid objects of `X.Modules` here and in Tau Ceti are the same type.
- Finite locally free means Tau Ceti's `Scheme.Modules.isFiniteLocallyFree X`, that is
  `SheafOfModules.isFiniteLocallyFree X.ringCatSheaf`: locally free and of finite presentation.
- Rank is the bundled locally constant function `X → ℕ`; constant rank is assumed only where a
  statement says so. On the empty scheme every sheaf is zero and every rank statement is vacuous.
- The tensor comparison of pullback is the canonical oplax map
  `Functor.OplaxMonoidal.δ (Scheme.Modules.pullback f) E F : f^*(E ⊗ F) → f^* E ⊗ f^* F`; the
  strong monoidal tensor map is its inverse. The power comparisons are
  `f^* Symⁿ(E) → Symⁿ(f^* E)` and `f^* ∧ⁿ(E) → ∧ⁿ(f^* E)`, the mates of the pushforward
  comparisons; in degree one they are the identity of `f^* E` under the degree-one
  isomorphisms.
- The determinant of a finite locally free sheaf `E` is `∧^{rank E} E`, the exterior power in
  the locally constant degree `rank E`, of rank `choose r r = 1` on the locus of rank `r`. Its
  tensor product is `InvertibleSheaf.tensorProduct`, whose symmetry is the braiding of
  `X.Modules`; the Koszul sign `(−1)^{rs}` of Layer 2 is a statement about the swap of summands,
  not a modification of that symmetry.
- Relative Spec is contravariant: `relativeSpec X : (QuasicoherentAlgebra X)ᵒᵖ ⥤ AffineSchemeOver X`,
  where `AffineSchemeOver X` is `MorphismProperty.Over IsAffineHom ⊤ X`: affine structure
  morphism, arbitrary morphisms over `X`.
- Two total spaces with opposite variance. For quasi-coherent `F`, `V_lin(F) = Spec_X Sym(F)`
  (`linearSpec X`) is contravariant in `F` and represents linear functionals:
  `Hom_X(T, V_lin(F)) ≃ Hom_{𝒪_T}(f^* F, 𝒪_T)` (Stacks Project, Tag 01M1). For finite locally
  free `E`, `V(E) = V_lin(E^∨)` (`totalSpace X`) is covariant in `E` and represents sections:
  `Hom_X(T, V(E)) ≃ Γ(T, f^* E)`. Witness: for `E = 𝒪_X`, `V(𝒪_X) = 𝔸¹_X` and a point
  `T → 𝔸¹_X` is a function in `Γ(T, 𝒪_T)`; the map `E → E` given by multiplication by
  `a ∈ Γ(X, 𝒪_X)` acts on `T`-points by multiplication by `f^* a`, while on `V_lin` it would be
  pulled back the other way.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:
`Scheme.Modules`, `Scheme.Modules.pullback`, `Scheme.Modules.pushforward`,
`Scheme.Modules.pullbackPushforwardAdjunction`, `Scheme.Modules.pullbackId`,
`Scheme.Modules.pullbackComp`, and the instance `HasLimits X.Modules`
(Mathlib/AlgebraicGeometry/Modules/Sheaf.lean); `Scheme.Opens.ι`, the inclusion of an open
subscheme (Mathlib/AlgebraicGeometry/Restrict.lean); `TopologicalSpace.Clopens.toOpens`
(Mathlib/Topology/Sets/Closeds.lean); `SheafOfModules.IsQuasicoherent`,
`SheafOfModules.IsFinitePresentation`, `SheafOfModules.IsLocallyFree`
(Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean, LocallyFree.lean);
`SheafOfModules.pullbackObjUnitToUnit` (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean);
`AlgebraicGeometry.tilde`, its fully faithful functor `AlgebraicGeometry.tilde.fullyFaithfulFunctor`,
and the affine quasi-coherent equivalence `AlgebraicGeometry.tildeEquiv`
(Mathlib/AlgebraicGeometry/Modules/Tilde.lean); `IsAffineHom`
(Mathlib/AlgebraicGeometry/Morphisms/Affine.lean); `AffineSpace`, `AffineSpace.homOfVector`,
`AffineSpace.homOverEquiv` (Mathlib/AlgebraicGeometry/AffineSpace.lean); `CommMon`,
`Functor.mapCommMon` (Mathlib/CategoryTheory/Monoidal/CommMon_.lean); `GradedObject`;
`ObjectProperty.IsMonoidal`, `ObjectProperty.fullMonoidalSubcategory`
(Mathlib/CategoryTheory/Monoidal/Subcategory.lean); `HasLeftDual`, `ExactPairing`
(Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean); `Functor.OplaxMonoidal` and its tensor
comparison `Functor.OplaxMonoidal.δ` (Mathlib/CategoryTheory/Monoidal/Functor.lean);
`CategoryTheory.Limits.biprod`; `SymmetricAlgebra`, `exteriorPower`,
`Module.Basis.exteriorPower` (Mathlib/LinearAlgebra/ExteriorPower/Basis.lean), `Nat.multichoose`.
`IsLocallyFree` alone allows infinite and chart-dependent index types; finite presentation is
what makes it finite.

### From Tau Ceti

At Tau Ceti `2fd255d9`:

- monoidal structure: `Scheme.Modules.instMonoidalCategory`, `Scheme.Modules.instSymmetricCategory`,
  `Scheme.Modules.instMonoidalClosed`, `Scheme.Modules.isMonoidal_isQuasicoherent`
  (TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean); `TauCeti.SheafOfModules.monoidalClosed`,
  `SheafOfModules.dual` (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean);
  the stalk description of the tensor product, `tensorStalkEquiv`
  (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Stalk.lean);
- pullback: `Scheme.Modules.pullbackOplaxMonoidal`, the canonical comparison
  `Functor.OplaxMonoidal.δ`, its unit identification `Scheme.Modules.pullback_η`, symmetry law
  `Scheme.Modules.pullback_map_braiding_hom_comp_δ`, composition law
  `Scheme.Modules.pullback_comp_δ`, together with `Scheme.Modules.pullbackObjUnitIso` and
  `Scheme.Modules.pullbackObjUnitIso_comp`, the locality criterion
  `Scheme.Modules.isIso_iff_of_isOpenCover`, and `Scheme.Modules.isQuasicoherent_pullback`
  (TauCeti/AlgebraicGeometry/Modules/Pullback/Basic.lean);
  `Scheme.Modules.isIso_pullback_δ_of_isOpenImmersion`,
  `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and
  `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right`, invertibility of the tensor
  comparison when one factor is quasi-coherent
  (TauCeti/AlgebraicGeometry/Modules/Pullback/Quasicoherent.lean);
  `Scheme.Modules.pullbackTensorLeftIso`, `Scheme.Modules.pullbackToModulesMonoidal`,
  `QuasicoherentSheaf.pullbackBraided` (TauCeti/AlgebraicGeometry/Modules/Pullback/Monoidal/Basic.lean),
  `QuasicoherentSheaf.isMonoidal_pullbackComp_hom` (Monoidal/Composition.lean) and
  `QuasicoherentSheaf.isMonoidal_pullbackId_hom` (Monoidal/Identity.lean);
- quasi-coherent sheaves: `QuasicoherentSheaf X` with its monoidal structure
  (TauCeti/AlgebraicGeometry/Modules/Quasicoherent/Basic.lean);
  `TauCeti.AlgebraicGeometry.preservesFiniteLimits_tildeFunctor`
  (TauCeti/AlgebraicGeometry/Modules/Tilde/Basic.lean);
  `QuasicoherentSheaf.nonempty_hasLeftDual_iff_finite_projective`, dualizability over `Spec R`
  (TauCeti/AlgebraicGeometry/Modules/Tilde/Dual.lean); `Scheme.Modules.isQuasicoherent_kernel`
  (TauCeti/AlgebraicGeometry/Modules/Quasicoherent/Kernels.lean);
  `QuasicoherentSheaf.pushforwardSpecMap`, pushforward along a map of spectra
  (TauCeti/AlgebraicGeometry/Modules/Quasicoherent/Pushforward/Basic.lean), and
  `Scheme.Modules.isQuasicoherent_pushforward` for quasi-compact quasi-separated morphisms
  (Pushforward/QuasiSeparated.lean); `Scheme.Modules.isQuasicoherent_ihom_of_isFinitePresentation`
  (TauCeti/AlgebraicGeometry/Modules/InternalHom/Quasicoherent.lean);
  `Scheme.Modules.pullbackIhomComparison`, `isIso_pullbackIhomComparison_of_exactPairing`
  (TauCeti/AlgebraicGeometry/Modules/Pullback/InternalHom/Basic.lean), its identity and
  composition laws (InternalHom/Coherence.lean) and
  `Scheme.Hom.isIso_pullbackIhomComparison_app` for flat `f` (InternalHom/Flat.lean);
- finite locally free sheaves (TauCeti/AlgebraicGeometry/VectorBundle/):
  `Scheme.Modules.isFiniteLocallyFree`, `FiniteLocallyFreeSheaf`, `FiniteLocallyFreeSheaf.free`,
  `FiniteLocallyFreeSheaf.pullback`, `FiniteLocallyFreeSheaf.toFinitelyPresented`, finite
  biproducts (FiniteLocallyFree.lean); `FiniteLocallyFreeSheaf.pullbackId`,
  `FiniteLocallyFreeSheaf.pullbackComp` (Functoriality.lean);
  `FiniteLocallyFreeSheaf.toQuasicoherent` (Quasicoherent.lean);
  `Scheme.Modules.isFiniteLocallyFree_iff_exists_openCover` (OpenCover.lean);
  `FiniteLocallyFreeSheaf.rank`, `FiniteLocallyFreeSheaf.rankLocus`, the rank formulas
  `rank_pullback_apply`, `rank_pullback`, `rank_biprod_apply` and `rank_tensor_apply`, and the
  criterion `isInvertible_iff_forall_rank_eq_one`, all in the namespace `FiniteLocallyFreeSheaf`
  (Rank.lean); `FiniteLocallyFreeSheaf.isConstantRank`, `FiniteLocallyFreeSheaf.FixedRank`,
  `FiniteLocallyFreeSheaf.FixedRank.toFiniteLocallyFree`, `InvertibleSheaf.fixedRankOneEquiv`
  (FixedRank.lean); `FiniteLocallyFreeSheaf.dual`, `FiniteLocallyFreeSheaf.rigidCategory`,
  `QuasicoherentSheaf.nonempty_hasLeftDual_of_isFiniteLocallyFree` (Dual/Basic.lean);
  `FiniteLocallyFreeSheaf.dualFunctor`, `FiniteLocallyFreeSheaf.evalIso`,
  `FiniteLocallyFreeSheaf.dualEquiv` (Dual/Bidual.lean);
  `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree` and
  `QuasicoherentSheaf.nonempty_hasRightDual_iff_isFiniteLocallyFree`, for every scheme
  (Dual/Dualizable.lean); `FiniteLocallyFreeSheaf.pullbackDualIso`,
  `FiniteLocallyFreeSheaf.pullbackDualNatIso` (Dual/Pullback.lean);
  `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` and its monoidal and dual comparisons (Affine/);
  `FiniteLocallyFreeSheaf.internalHom`, `FiniteLocallyFreeSheaf.tensorInternalHomAdjunction`,
  `FiniteLocallyFreeSheaf.dualTensorInternalHomIso` (InternalHom/Basic.lean);
  the instance `isIso_pullbackIhomComparison` in the namespace `FiniteLocallyFreeSheaf` and
  `FiniteLocallyFreeSheaf.pullbackIhomIso` (InternalHom/Pullback.lean);
- line bundles: `SheafOfModules.isInvertible`, `InvertibleSheaf X`, `InvertibleSheaf.trivial`
  (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean); `InvertibleSheaf.tensorProduct`,
  `InvertibleSheaf.tensorProductComm`, `InvertibleSheaf.tensorProductAssoc`
  (LineBundle/TensorProduct.lean); `InvertibleSheaf.pullback` (LineBundle/Pullback.lean); and
  `FinitelyPresentedSheaf X` (TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean);
- powers: `SheafOfModules.symmetricPower`, `SheafOfModules.symmetricPowerZeroIso`,
  `SheafOfModules.symmetricPowerOneIso` (TauCeti/Algebra/Category/ModuleCat/Sheaf/SymmetricPower/Basic.lean),
  `SheafOfModules.exteriorPower`, `SheafOfModules.exteriorPowerZeroIso`,
  `SheafOfModules.exteriorPowerOneIso` (Sheaf/ExteriorPower/Basic.lean), the sheafifications of
  the sectionwise powers; the sheaf-level pullback comparisons and their degree-one
  invertibility (Sheaf/SymmetricPower/Pullback.lean, Sheaf/ExteriorPower/Pullback.lean);
  `FiniteLocallyFreeSheaf.symmetricPower` with its rank formula `rank_symmetricPower_apply` in
  that namespace (TauCeti/AlgebraicGeometry/VectorBundle/SymmetricPower/Basic.lean),
  `FiniteLocallyFreeSheaf.exteriorPower`, `FiniteLocallyFreeSheaf.exteriorPowerFreeIso` and the
  rank formula `rank_exteriorPower_apply` in that namespace (VectorBundle/ExteriorPower/Basic.lean);
  `Scheme.Modules.pullbackSymmetricPowerComparison`,
  `Scheme.Modules.isIso_pullbackSymmetricPowerComparison_one`
  (TauCeti/AlgebraicGeometry/Modules/SymmetricPower/Pullback/Basic.lean), its identity and
  composition laws (SymmetricPower/Pullback/Coherence.lean),
  `isIso_pullbackSymmetricPowerComparison_app` for quasi-coherent sheaves
  (SymmetricPower/Pullback/Quasicoherent.lean) and `isIso_pullbackSymmetricPowerComparison_of_spec`
  (SymmetricPower/Pullback/Affine.lean); `Scheme.Modules.pullbackExteriorPowerComparison`,
  `Scheme.Modules.isIso_pullbackExteriorPowerComparison_one`
  (TauCeti/AlgebraicGeometry/Modules/ExteriorPower/Pullback/Basic.lean), its identity and
  composition laws (ExteriorPower/Pullback/Coherence.lean),
  `isIso_pullbackExteriorPowerComparison_app` for quasi-coherent sheaves
  (ExteriorPower/Pullback/Quasicoherent.lean); `FiniteLocallyFreeSheaf.pullbackSymmetricPowerIso`
  (VectorBundle/SymmetricPower/Pullback.lean), `FiniteLocallyFreeSheaf.pullbackExteriorPowerIso`
  (VectorBundle/ExteriorPower/Pullback.lean);
- determinant: `locallyConstantExteriorPower`, the exterior power in a locally constant degree
  (TauCeti/AlgebraicGeometry/Modules/ExteriorPower/LocallyConstant.lean) and its finite local
  freeness and rank on finite locally free sheaves
  (TauCeti/AlgebraicGeometry/VectorBundle/ExteriorPower/LocallyConstantRank.lean);
  `FiniteLocallyFreeSheaf.determinant`, `FiniteLocallyFreeSheaf.determinantFreeIso`,
  `FiniteLocallyFreeSheaf.determinantOneIso`, `FiniteLocallyFreeSheaf.determinantZeroIso`
  (VectorBundle/Determinant/Basic.lean); `FiniteLocallyFreeSheaf.det` with its underlying-sheaf
  formula `det_obj` in that namespace, `FiniteLocallyFreeSheaf.determinantCore`,
  `FiniteLocallyFreeSheaf.detIsoDeterminant` (Determinant/LocallyConstantRank.lean);
  `FiniteLocallyFreeSheaf.pullbackDeterminantIso`, `FiniteLocallyFreeSheaf.pullbackDetIso`
  (Determinant/Pullback.lean);
- relative Spec (TauCeti/AlgebraicGeometry/RelativeSpec/): `QuasicoherentAlgebra`,
  `QuasicoherentAlgebra.forget`, `AffineSchemeOver`, `relativeSpec` (Functor.lean);
  `CommMon.relativeSpec` (SubalgebraPresheaf.lean), `CommMon.relativeSpecToBase`,
  `CommMon.isPullback_relativeSpecCover` (Basic.lean);
  `TauCeti.AlgebraicGeometry.relativeSpecAffineIso` (Affine.lean);
  `Scheme.Hom.pushforwardStructureAlgebra`
  (TauCeti/AlgebraicGeometry/Modules/Algebra/RegularFunctions.lean),
  `Scheme.Hom.pushforwardStructureAlgebraMap`, `overFunctions` (Modules/Algebra/Functoriality.lean);
  `Scheme.Hom.isQuasicoherent_pushforwardStructureAlgebra`, `affineFunctions`
  (AffineFunctions.lean); `QuasicoherentAlgebra.pullback`, `QuasicoherentAlgebra.pullbackId`,
  `QuasicoherentAlgebra.pullbackComp`, `QuasicoherentAlgebra.pullbackHomEquiv`
  (PullbackAlgebra.lean); `CommMon.relativeSpecLift`, `CommMon.relativeSpecHomEquiv`,
  `relativeSpecHomIso`, `relativeSpecPullbackHomEquiv` (UniversalProperty.lean);
  `CommMon.relativeSpecPushforwardIso`, `relativeSpecUnit` (Unit.lean), `relativeSpecCounit`
  (Counit.lean); `relativeSpecEquiv`, `relativeSpec_isEquivalence`,
  `affineFunctions_isEquivalence` (Equivalence.lean); `baseChangeAffineSchemeOver`,
  `relativeSpecPullbackFst`, `isPullback_relativeSpecPullbackFst`, `relativeSpecPullbackIso`,
  `relativeSpecBaseChangeIso`, `relativeSpecPullbackFst_comp`, `relativeSpecPullbackIso_comp`
  (BaseChange.lean); `CommMon.isPullback_relativeSpecMap_inl_inr` (Product.lean);
  `relativeSpecGlobalSectionsAlgEquiv` (GlobalFunctions.lean);
- graded algebras (TauCeti/AlgebraicGeometry/Modules/Quasicoherent/GradedAlgebra/):
  `GradedQuasicoherentAlgebra`, `GradedQuasicoherentAlgebra.degree`,
  `GradedQuasicoherentAlgebra.degreeOne` (Basic.lean);
  `GradedQuasicoherentAlgebra.toQuasicoherentAlgebra`, `GradedQuasicoherentAlgebra.ιTotal`
  (DirectSum.lean); `GradedQuasicoherentAlgebra.gradedSectionsEquiv` (Sections.lean);
  `gradedSymmetricAlgebra`, `gradedSymmetricAlgebraDegreeOneIso` (SymmetricAlgebra/Basic.lean);
  `gradedSymmetricAlgebraAdjunction` (SymmetricAlgebra/Adjunction.lean); `symmetricAlgebra`,
  `symmetricAlgebraAdjunction` (SymmetricAlgebra/DirectSum.lean);
  `FreeGradedQuasicoherentAlgebra`, `gradedSymmetricAlgebraEquiv`,
  `essImage_gradedSymmetricAlgebra_iff` (Free.lean); `GradedQuasicoherentAlgebra.pullback`,
  `pullbackDegreeIso` (Pullback.lean); `pullbackSymmetricAlgebraNatIso`
  (SymmetricAlgebra/Pullback.lean); the affine graded-ring interface
  `CommMon.gradedSectionsPresheaf` (TauCeti/AlgebraicGeometry/Modules/GradedAlgebra/Sections.lean),
  `CommMon.isLocalization_gradedSections_basicOpen`,
  `CommMon.isBaseChange_restrictGradedSections` (GradedAlgebra/Localization.lean),
  `CommMon.finiteType_gradedSections_of_le`,
  `CommMon.adjoin_gradedSectionsGrading_zero_union_one_eq_top_of_le`
  (GradedAlgebra/AffineRestriction.lean);
- linear schemes: `GradedAffineSchemeOver`, `gradedRelativeSpecEquiv`, `gradedRelativeSpec`
  (TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean); `relativeSpecSymmetricAlgebraHomIso`,
  `relativeSpecSymmetricAlgebraBaseChangeIso` (RelativeSpec/SymmetricAlgebra/Basic.lean),
  `addGrpObjRelativeSpecSymmetricAlgebra`, `relativeSpecSymmetricAlgebraAddGrp`
  (SymmetricAlgebra/Group.lean), `modObjRelativeSpecSymmetricAlgebra` (SymmetricAlgebra/Module.lean),
  `affineSpaceOver`, `relativeSpecSymmetricAlgebraFreeIso` (SymmetricAlgebra/AffineSpace.lean),
  `relativeSpecSymmetricAlgebraTildeIso` (SymmetricAlgebra/Tilde.lean),
  `isPullback_relativeSpecSymmetricAlgebra_biprod` (SymmetricAlgebra/Biprod.lean);
  `isQuasicoherentLinearScheme`, `QuasicoherentLinearScheme`, `freeGradedRelativeSpecEquiv`,
  `linearSpec`, `QuasicoherentLinearScheme.forget`, `QuasicoherentLinearScheme.degreeOne`,
  `linearSpecEquiv`, `linearSpec_isEquivalence`
  (TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean);
  `QuasicoherentLinearScheme.pullback`, `linearSpecPullbackIso`, `pullbackForgetIso`
  (VectorBundle/LinearScheme/BaseChange.lean);
- geometric vector bundles (TauCeti/AlgebraicGeometry/VectorBundle/): `isGeometricVectorBundle`,
  `GeometricVectorBundle`, `linearSpecFiniteLocallyFreeEquiv`, `totalSpace`, `totalSpaceEquiv`,
  `totalSpace_isEquivalence` (Geometric.lean); `totalSpaceScheme`, `totalSpaceHomEquiv`,
  `totalSpaceSchemeBaseChangeIso`, `totalSpacePullbackFst` (TotalSpace.lean);
  `pullbackSectionsPresheaf`, `totalSpaceHomIso` (TotalSpace/FunctorOfPoints.lean);
  `totalSpaceSectionEquiv` (Sections.lean); `totalSpaceBaseChangeSpecIso`,
  `totalSpaceFiberIso` (TotalSpace/Fiber.lean), `totalSpaceResidueFieldHomEquiv`
  (TotalSpace/Fibre.lean); `isPullback_totalSpaceScheme_biprod`, `totalSpaceBiprodIso`
  (Biprod.lean); `addGrpObjTotalSpaceScheme`, `totalSpaceHomAddEquiv`, `totalSpaceAddGrp`
  (TotalSpace/Group.lean); `totalSpaceIhomHomEquiv`, `totalSpaceIhomSectionEquiv`,
  `totalSpaceDualHomEquiv` (TotalSpace/InternalHom.lean); `totalSpaceTensorHomEquiv`
  (TotalSpace/Tensor.lean); `totalSpaceSymmetricPowerHomEquiv` (TotalSpace/SymmetricPower.lean);
  `totalSpaceExteriorPowerHomEquiv` (TotalSpace/ExteriorPower.lean);
  `totalSpaceDeterminantHomEquiv` (TotalSpace/Determinant.lean); `totalSpaceFreeIso`,
  `totalSpaceFreeHomEquiv` (TotalSpace/AffineSpace.lean); `totalSpaceTrivialIso`
  (TotalSpace/Trivial.lean); `totalSpaceFiniteProjectiveIso` (Affine/TotalSpace.lean).

Assumed: these carry the canonical instances above; in particular `QuasicoherentAlgebra X` is
built on `Scheme.Modules.instMonoidalCategory`, and `FiniteLocallyFreeSheaf.det` is the exterior
power of the underlying `𝒪_X`-module in the locally constant degree `rank E`.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§5.1: the determinant of a finite projective module by its clopen rank decomposition, its
compatibility with direct sums, the determinant maps between finite projectives of equal rank
function, graded lines with the Koszul symmetry, and base change. On `Spec A` the determinant
sheaf of Layer 2 is the associated sheaf of the ring-level determinant, as graded lines: the
comparison retains the rank function and its parity and is compatible with the equal-rank
determinant maps, with affine pullback and with the Koszul symmetry of graded lines, and only
then is the grading forgotten.

## How to read the build

Other roadmaps cite this roadmap by the labels L0A, L0B, L0C, L1A, L1B, L2A and L2B, and
L0A–L0C together as L0. L0A is Layer 1 and L0C is Layer 2; L0B, L1A, L1B, L2A and L2B name
material that is at the pins, listed under those labels in Scope and ownership, with no target
of this roadmap left in them.

Layer 1 finishes the monoidal theory of `X.Modules` by making pullback strong symmetric monoidal
on all module sheaves. Layer 2 extends the pullback comparisons of symmetric and exterior powers
to all module sheaves, proves the direct-sum formula for the determinant with its sign, and
compares the determinant sheaf on affine opens with the ring-level determinant.

## Layer 1: strong monoidal pullback

### 1.1 The tensor comparison on all module sheaves

Prove `pullback_tensor_isIso`: for every `f : Y ⟶ X` and `E F : X.Modules`, the canonical
oplax comparison `f^* (E ⊗ F) → f^* E ⊗ f^* F` is invertible (Stacks Project, Tag 01CD, stated
for arbitrary `𝒪_X`-modules on ringed spaces). The pinned library proves this when `E` or `F` is
quasi-coherent and when `f` is an open immersion. For arbitrary `E`, `F` argue on stalks: the
comparison at a point `y` of `Y` is the canonical isomorphism
`(E_x ⊗_{𝒪_{X,x}} F_x) ⊗_{𝒪_{X,x}} 𝒪_{Y,y} ≅ (E_x ⊗_{𝒪_{X,x}} 𝒪_{Y,y}) ⊗_{𝒪_{Y,y}} (F_x ⊗_{𝒪_{X,x}} 𝒪_{Y,y})`
with `x = f(y)`, the stalk of a tensor product being the tensor product of the stalks and the
stalk of a pullback the base change of the stalk, and a map of sheaves of modules that is an
isomorphism on every stalk is an isomorphism. Use its inverse as the strong monoidal tensor map
`f^* E ⊗ f^* F → f^* (E ⊗ F)`, together with the unit isomorphism `f^* 𝒪_X → 𝒪_Y`, to make
pullback strong symmetric monoidal on `X.Modules`, and identify the resulting identity and
composition coherences with `Scheme.Modules.pullbackId` and `Scheme.Modules.pullbackComp` using
the unit, symmetry and composition laws in the supplier contract; on quasi-coherent sheaves this
recovers `QuasicoherentSheaf.pullbackBraided`. *Needs:* Mathlib `Scheme.Modules.pullback`,
`Scheme.Modules.pullbackComp`; Tau Ceti `Scheme.Modules.pullbackOplaxMonoidal`,
`Scheme.Modules.pullback_η`, `Scheme.Modules.pullback_map_braiding_hom_comp_δ`,
`Scheme.Modules.pullback_comp_δ`, `Scheme.Modules.pullbackObjUnitIso_comp`,
`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`, `tensorStalkEquiv`.

- On free sheaves the tensor comparison is the identity of `𝒪_Y^(I × J)` under the free
  presentations.
- The identity morphism of `X` gives the identity comparisons up to `Scheme.Modules.pullbackId`.
- When one factor is quasi-coherent the inverse is the one the pinned library constructs, so the
  strong monoidal structure restricts to the pinned one on `QuasicoherentSheaf X`.

**Checks.**
- Pull back `𝒪_X ⊗ 𝒪_X` along an open immersion and compute both sides as `𝒪_U`; a lax structure
  whose comparison is not invertible would already fail on `𝒪_X`.
- For `X = Spec ℤ`, `Y = Spec 𝔽_p` and `E = F = ℤ/p²` (as quasi-coherent modules), both sides are
  `𝔽_p`: the comparison is an isomorphism even though `E` is not flat, which rules out a
  definition that only works for flat modules.
- For `X = 𝔸¹_k`, `U = D(t)` and `E = F = j_! 𝒪_U`, the extension by zero: `E` is not
  quasi-coherent, since its global sections vanish while it is nonzero on `U`, so the pinned
  instances do not apply. For `f` the inclusion of a point `x ∈ U` both sides are `κ(x)`, and
  for `x` the origin both sides are `0`; a proof route that reduces to modules of the form `M~`
  on affine charts would not cover this instance.
- The braiding on `f^*(E ⊗ E)` for `E = 𝒪_X²` swaps the basis vectors `e_i ⊗ e_j` and
  `e_j ⊗ e_i`; a structure compatible only with the associator would not pin this.

### Examples

- For `R → S` and modules over `Spec R`, the comparison is `(M ⊗_R N) ⊗_R S ≅ (M ⊗_R S) ⊗_S (N ⊗_R S)`.

### Dependencies

Mathlib `Scheme.Modules`; Tau Ceti monoidal structure on `X.Modules` and the quasi-coherent case
of the comparison.

## Layer 2: powers and the determinant

### 2.1 Pullback comparisons on all module sheaves

Prove `symmetricPower_pullback_isIso` and `exteriorPower_pullback_isIso`: for every `f : Y ⟶ X`
and `n : ℕ`, the natural transformations `Scheme.Modules.pullbackSymmetricPowerComparison f n`
and `Scheme.Modules.pullbackExteriorPowerComparison f n` are invertible, that is, their
components `f^* Symⁿ(E) → Symⁿ(f^* E)` and `f^* ∧ⁿ(E) → ∧ⁿ(f^* E)` are isomorphisms for every
`𝒪_X`-module `E` (Stacks Project, Tag 01CI, on homogeneous components, stated for arbitrary
`𝒪_X`-modules). The pinned library proves the components invertible for quasi-coherent `E`, in
degree one for every `E`, and gives the identity and composition laws of the comparisons.
For arbitrary `E` argue on stalks as in Layer 1: the sheaf powers are the sheafifications of the
sectionwise powers, so their stalks are the powers of the stalks, and the comparison at `y` is
the base change isomorphism `Symⁿ_{𝒪_{X,x}}(E_x) ⊗ 𝒪_{Y,y} ≅ Symⁿ_{𝒪_{Y,y}}(E_x ⊗ 𝒪_{Y,y})`,
likewise for `∧ⁿ`. Prove that the resulting isomorphisms are compatible with
`Scheme.Modules.pullbackComp`, with the degree-zero and degree-one isomorphisms of Tau Ceti, and
with Layer 1 through the quotient maps from the tensor powers. *Needs:* Layer 1; Tau Ceti
`Scheme.Modules.pullbackSymmetricPowerComparison`,
`Scheme.Modules.pullbackExteriorPowerComparison`, their identity and composition laws,
`isIso_pullbackSymmetricPowerComparison_app`, `isIso_pullbackExteriorPowerComparison_app`,
`Scheme.Modules.isIso_iff_of_isOpenCover`.

- On finite locally free sheaves the isomorphisms are `FiniteLocallyFreeSheaf.pullbackSymmetricPowerIso`
  and `FiniteLocallyFreeSheaf.pullbackExteriorPowerIso`, which are at the pins and not restated.

**Checks.**
- `n = 1`: the comparison is the identity under the degree-one isomorphisms, the pinned
  `Scheme.Modules.pullbackSymmetricPowerComparison_app_comp_symmetricPowerOneIso`.
- `n = 0`: both sides are `𝒪_Y` through `SheafOfModules.pullbackObjUnitToUnit`.
- `E = 𝒪_X²`, `n = 2`, `f` a point: both sides are the 1-dimensional `∧²` of the fibre; the
  comparison sends `e₁ ∧ e₂` to `e₁ ∧ e₂`, not to its negative.
- `E = j_! 𝒪_U` on `X = 𝔸¹_k` with `U = D(t)`, `n = 2`, `f` the inclusion of a point `x`: both
  sides are `κ(x)` for `x ∈ U` and `0` otherwise, with `E` not quasi-coherent, so the pinned
  quasi-coherent instance does not decide this case.

### 2.2 The determinant of a direct sum and the affine comparison

The determinant is Tau Ceti's `FiniteLocallyFreeSheaf.det`, the exterior power of `E` in the
locally constant degree `rank E`; `determinantObj E` is `det E` under this roadmap's name. Prove
`determinant_biprod`: for finite locally free `E` and `F`, `det(E ⊕ F) ≅ det E ⊗ det F` in
`InvertibleSheaf X`, where `⊕` is the biproduct of `FiniteLocallyFreeSheaf X` and `⊗` is
`InvertibleSheaf.tensorProduct`. On the clopen locus where `E` has rank `r` and `F` has rank `s`
this is `∧^{r+s}(E ⊕ F) ≅ ∧^r E ⊗ ∧^s F`, the top-degree piece of the decomposition of
`∧^n(E ⊕ F)` into `⊕_{i+j=n} ∧^i E ⊗ ∧^j F` (Hartshorne, *Algebraic Geometry*, II, Exercise
5.16(d)); on a chart where `E` and `F` are free with bases `e₁, …, e_r` and `f₁, …, f_s` it sends
`e₁ ∧ … ∧ e_r ∧ f₁ ∧ … ∧ f_s` to `(e₁ ∧ … ∧ e_r) ⊗ (f₁ ∧ … ∧ f_s)`. Prove that it is natural in
isomorphisms of `E` and of `F` through `FiniteLocallyFreeSheaf.determinantCore`, compatible with
pullback through `FiniteLocallyFreeSheaf.pullbackDetIso`, and that it intertwines the swap
`E ⊕ F ≅ F ⊕ E` with `InvertibleSheaf.tensorProductComm` up to multiplication by `(−1)^{rs}` on
the locus of ranks `(r, s)`, the sign of the permutation moving `s` vectors past `r` vectors.
On an affine open `Spec A`, with `E` the sheaf of the finite projective module `P`, prove that
`(det E).obj` is the associated sheaf of the ring-level determinant of
PadicMeasuresIwasawaAlgebras §5.1 as an isomorphism of graded lines: it carries the rank
function `x ↦ rank(P_x)` and its parity `x ↦ rank(P_x) mod 2`, is compatible with the ring-level
determinant map of every map between finite projectives of equal rank function and with affine
pullback, and matches the Koszul symmetry `(−1)^{εε′}` of graded lines; the direct-sum
isomorphism above is the sheaf of the ring-level direct-sum compatibility, and the object of
`InvertibleSheaf X` is this comparison with the grading forgotten. *Needs:* the pullback
comparisons of this layer; PadicMeasuresIwasawaAlgebras §5.1; Tau Ceti `FiniteLocallyFreeSheaf.det`,
`FiniteLocallyFreeSheaf.determinantCore`, `FiniteLocallyFreeSheaf.pullbackDetIso`,
`FiniteLocallyFreeSheaf.rankLocus`, the rank formula `rank_biprod_apply` of the namespace
`FiniteLocallyFreeSheaf`, `InvertibleSheaf.tensorProduct`, `InvertibleSheaf.tensorProductComm`,
`FiniteLocallyFreeSheaf.finiteProjectiveEquiv`; Mathlib `CategoryTheory.Limits.biprod`,
`AlgebraicGeometry.tildeEquiv`.

- `det(E ⊕ 0) ≅ det E ⊗ 𝒪_X ≅ det E` through `FiniteLocallyFreeSheaf.determinantZeroIso`.
- Associativity: the two isomorphisms `det(E ⊕ F ⊕ G) ≅ det E ⊗ det F ⊗ det G` agree up to
  `InvertibleSheaf.tensorProductAssoc`, with no sign.

**Checks.**
- `det(𝒪_X^r) ≅ 𝒪_X`, and the automorphism given by an invertible matrix `A` acts by `det A`;
  the dual convention would give `det A⁻¹`. This is the pinned
  `FiniteLocallyFreeSheaf.determinantFreeIso`, read through the direct-sum isomorphism for
  `𝒪_X^r = 𝒪_X ⊕ … ⊕ 𝒪_X`, which identifies `e₁ ∧ … ∧ e_r` with `e₁ ⊗ … ⊗ e_r`.
- On `X = Spec k ⊔ Spec k` with `E` of rank 1 on one component and rank 2 on the other and
  `F = 𝒪_X`, the ranks of `E ⊕ F` are `2` and `3`, and `det(E ⊕ F)` is `∧² ` on the first
  component and `∧³` on the second; a formula using a single global degree would be wrong on one
  of the two components.
- `r = s = 0`: `det(0 ⊕ 0) = 𝒪_X ≅ 𝒪_X ⊗ 𝒪_X`, and the swap acts by `(−1)^0 = +1`.
- `E = F = 𝒪_X`: the swap of the two summands of `𝒪_X²` acts on `det(𝒪_X²) = ∧² 𝒪_X²` by `−1`,
  the determinant of the swap matrix and the value PadicMeasuresIwasawaAlgebras §5.1 fixes; a
  comparison that intertwined the swap with `InvertibleSheaf.tensorProductComm` without the
  sign would give `+1` here.
- `E = 𝒪_X`, `F = 𝒪_X²`: the swap `𝒪_X ⊕ 𝒪_X² ≅ 𝒪_X² ⊕ 𝒪_X` is the cyclic permutation of three
  basis vectors, of determinant `(−1)^{1·2} = +1`; a sign `(−1)^{r+s}` or a sign `−1`
  regardless of ranks would give `−1` here.
- On `Spec A` with `P = A^r`, the ring-level determinant is `(∧^r A^r, r mod 2)`, so the parity
  of `det(𝒪^r)` is `r mod 2` and a comparison that assigned parity `0` to every determinant
  would disagree with the Koszul symmetry for `r` odd.

### Examples

- For a finite projective module `P` over a ring `R` of constant rank `r`, the determinant sheaf on
  `Spec R` is the associated sheaf of `∧^r P`, and for `P = P₁ ⊕ P₂` of ranks `r₁`, `r₂` the
  direct-sum isomorphism is the associated sheaf of `∧^{r₁+r₂}(P₁ ⊕ P₂) ≅ ∧^{r₁} P₁ ⊗ ∧^{r₂} P₂`.

### Dependencies

Layer 1; Tau Ceti power functors, their comparisons, rank and rank loci, the determinant and
line bundles; PadicMeasuresIwasawaAlgebras §5.1.

## Downstream consumers

SchemeAndStackFoundations (it builds its Grothendieck group of finite locally free sheaves on
`FiniteLocallyFreeSheaf` and `isFiniteLocallyFreeOfRank` and its determinant on
`determinantObj`; relative Proj and Chern classes are its own), StableReduction (L2A for
relative Proj), GroebnerGeometry (L0 and L2A), AdicSpacesPartIII (L0A and L0B), NilpotentOrbits
(L2B, total spaces), ReductiveGroups and SchubertGeometry.

## References

- The Stacks Project, Sheaves of Modules (Tags 01CD, 01CI, 01CK, 01CL), Constructions of Schemes
  (Tags 01LQ, 01M1, 062N), Morphisms of Schemes (Tag 01SA).
- R. Hartshorne, *Algebraic Geometry*, II.5, Exercise 5.16.
