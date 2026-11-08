# Roadmap: quiver representations, path algebras, and Gabriel's theorem

**Summary.** This roadmap develops representations of finite quivers as left modules over
path algebras, their finite-dimensional algebra structure, and their homological and root-theoretic
invariants. Its end theorems are the Ext-quiver form of Gabriel's admissible presentation,
heredity of path algebras with the comparison of the Hom differential to native Ext (from which
the Euler–Hom–Ext identity follows with the pinned Hom-minus-cokernel identity), and the marked
root-system form of Gabriel's ADE correspondence; on top of these it reads the pinned
injective stable Hom, Auslander–Reiten duality, almost-split sequences and Auslander–Reiten
quiver on quiver examples. It builds on the path, representation, decomposition, reflection and
Auslander–Reiten theory in Tau Ceti, with semisimple algebra and root-system inputs specified
below.

## Scope and ownership

This is the base quiver-representation roadmap. It owns the finite-dimensional-algebra frame,
the quiver-specific homological comparisons, the bridge from dimension vectors to root systems,
and the quiver-level reading of the pinned Auslander–Reiten theory. Its layers retain their roles:
0 path algebras, 1 representations, 2 decomposition, 3 finite-dimensional algebras, 4 homological
forms and reflections, 5 Gabriel, and 6 Auslander–Reiten theory.

The following mathematics is already in the pinned libraries and is consumed, not replanned:

- Mathlib supplies quivers, paths, module categories, finite length, Jordan–Hölder, Ext, Morita
  equivalence, and rational root pairings.
- Tau Ceti supplies the path algebra and its basis and generators, representation/module
  equivalence, vertex simples and projectives, coinduced injectives, finite-dimensionality
  adapters, and finite-length Krull–Schmidt theory (Layers 0–2).
- Tau Ceti supplies primitive orthogonal decompositions, semiperfectness, projective covers,
  finite-dimensional injective envelopes and minimal injective copresentations with their
  uniqueness, the Morita equivalence with the corner ring of a full idempotent, Morita reduction
  of every semiperfect algebra to a basic corner, basicness and admissible ideals, the radical,
  radical layer and basicness of every bound quiver algebra, the surjection from a path algebra
  with admissible kernel onto a basic algebra over an algebraically closed field, and the generic
  composition-multiplicity Cartan matrix.
- Tau Ceti supplies dimension vectors, Euler/Tits forms, Hom differentials with the
  Hom-minus-cokernel dimension identity, the standard bimodule resolution of a path algebra and
  the Hom-cocycle computation of Ext¹ of a cokernel, projective dimension at most one for
  finite-length modules over a finite acyclic path algebra, the Ext-Euler characteristic of finitely generated
  modules over a finite-dimensional path algebra as the Euler form of dimension vectors, the
  inverse-Cartan form of the Ext-Euler matrix, kernel/cokernel reflections, admissible composites
  and their survival theorem, and finite-dimensional Gabriel classification over arbitrary
  fields. The remaining Layer 5 bridge marks a rational root pairing by the actual vertex
  vectors; it does not reprove that classification.
- Tau Ceti supplies minimal projective presentations, presentation-level transpose and dual
  transpose, the module-level translate
  `ModuleCat.arTranslate` and the representation-level translate `TauCeti.arTranslate`,
  the injective stable category with its Hom spaces as Hom cokernels of injective inflations,
  categorical radicals and irreducible spaces, almost-split predicates, uniqueness extending any
  specified isomorphism of the right endpoints under local-endomorphism hypotheses, and, over a
  finite-dimensional algebra and an arbitrary field, Auslander–Reiten duality natural in both
  variables, existence of almost-split sequences with the translate as left end, the quiver of
  irreducible morphisms with its partial translation, and its mesh relation counted in
  k-dimensions.

[SemisimpleAlgebras](../SemisimpleAlgebras/README.md), Layers 1.5–2, owns the simple-module
indexing and Wedderburn structure of the semisimple quotient.
[RootSystems](../RootSystems/README.md), §3.1, owns the classification of finite reduced
crystallographic root systems independent of a base and, over ℚ, up to isomorphism; positive
roots relative to a base are native (`TauCeti.posRoots`). The bridge of §5.2 builds its root
system directly from the Tits form and uses neither that classification nor a numbered model, so
RootSystems is not a supplier here. Neither roadmap supplies a sink-restricted height-decrease
argument; §5.1 uses the pinned admissible-reflection termination.
[QuiverRepresentationsPartII](../../QuiverRepresentationsPartII/README.md), §§1.1–1.6
and Layers 2–4, extends the type-A theory to graded operators and multisegment duality; those
extensions are outside this base roadmap. Generic exact-category and Grothendieck-group
constructions belong to [GrothendieckEulerForms](../../GrothendieckEulerForms/README.md),
Layers 1–5; its Cartan comparison consumes this roadmap, so it is not a supplier here.
[ArtinAlgebras](../ArtinAlgebras/README.md), §2.3, owns the duality between finitely generated
left and right modules over an Artin algebra, its exchange of projectives and injectives, and
injective hulls as duals of projective covers with the minimal injective coresolutions they give;
its §4.2 and §§5.1–5.3 own the stable equivalence τ : E/[P] ≌ E/[I] between the projective and
injective stable categories, both Auslander–Reiten formulas and the valued Auslander–Reiten
quiver with its mesh, for Artin algebras. In each case the field case is its case R = k, with
E_k = k, and is not planned here. Its stable equivalence composes the pinned Auslander–Bridger
transpose equivalence with duality. So §3.1 here consumes the pinned injective envelopes and
minimal injective copresentations, and Layer 6 consumes the pinned translate, duality,
almost-split sequences, quiver of irreducible morphisms and injective stable Hom and adds only
the quiver examples. ArtinAlgebras lists this roadmap among its own suppliers, so it is not a
supplier here.

## Conventions

The coefficient k is a field. Quivers have finite vertex and arrow sets, but may be empty,
disconnected, have multiple arrows or loops. Acyclicity means every closed path is trivial;
it is imposed wherever used. The module and representation constructions themselves retain
arbitrary vertex spaces. All dimension-vector classification, decomposition and reflection
formulas below use pointwise finite-dimensional representations. Over a finite vertex set
this is equivalent to finiteness over k of the total module after restricting scalars along
k → kQ. It is not finiteness over kQ: the one-loop regular module is cyclic over k[X] but
infinite-dimensional over k. When kQ is finite-dimensional, finite generation over kQ and
finite-dimensionality over k agree.

Multiplication is later-factor-first: p·q traverses q and then p, and is zero if they are
not composable. Thus eⱼa = a = aeᵢ for a : i → j. Representations are left modules and
Pᵢ = kQeᵢ has paths starting at i. For 1 → 2, the matrix model preserving vertex labels is
lower triangular, with e₁ = E₁₁, e₂ = E₂₂ and a = E₂₁. Swapping vertex labels gives an
upper-triangular model. The coinduced Iᵢ has at j the full k-linear dual of the path space
from j to i. A dual path basis is asserted only when that path set is finite.

Write d(M)ᵢ = dimₖ Mᵢ. The Euler form is E(d,e) = ∑ᵢ dᵢeᵢ − ∑ₐ:ᵢ→ⱼ dᵢeⱼ, q(d) = E(d,d),
and B(d,e) = E(d,e) + E(e,d). Arithmetic involving reflections and Euler differences is in ℤ,
not truncated natural subtraction. At a loopless vertex i, sᵢ(d) = d − B(eᵢ,d)eᵢ; its fixed
hyperplane is B(eᵢ,d) = 0. The algebra Cartan matrix has rows indexed by projectives:
Cᵢⱼ = [Pᵢ:Sⱼ]. It differs from the symmetric root Cartan matrix B.

For a sink ordering i₁,…,iₙ, the first applied reflection is i₁ and the composite acts by
sᵢₙ⋯sᵢ₁ when every intermediate input has no summand isomorphic to the simple at that sink.
An indecomposable either survives with this dimension formula or is killed at a simple.
The locus q = 0 is the isotropic locus. It is not the imaginary-root set: for three parallel
arrows q(1,1) = −1, and the zero vector, although isotropic, is never a root.

Gabriel's ADE statements and the general module-theoretic AR duality, existence and
k-dimensional mesh statements are over arbitrary fields. Algebraic closedness is required for the
ordinary bound-quiver presentation of every basic algebra. Over a general field the arrow counts
of the AR quiver are k-dimensions of irreducible spaces.
ASS assumes an algebraically closed field throughout (ASS pp.1–2) and is cited for the statements
and for the algebraically closed case. The arbitrary-field forms are theorems about Artin
algebras; ARS is cited for them by locator: the reduced form (ARS II.2.6), injective envelopes
(ARS II.4.1), the Auslander–Reiten formula as an equality of lengths (ARS IV.4.1, p.129, and
IV.4.6, p.131) and almost-split existence with its D Tr endpoint (ARS V.1.14–1.15).
Where Tau Ceti already proves an arbitrary-field statement, the pinned declaration is the
authority.
All module universes can be chosen together with k and A; the acceptance signatures use
one universe u, and the rational root bridge uses small finite vertex and root types.

## Exact supplier contracts

### From Mathlib

- `Quiver`, `Quiver.Path`, `Quiver.Path.comp` and `CategoryTheory.Paths`, in
  `Mathlib/Combinatorics/Quiver/Basic.lean`, `Path.lean`, and
  `Mathlib/CategoryTheory/PathCategory/Basic.lean`, supply arbitrary arrow types and the free
  category. They impose no finiteness, nonemptiness or acyclicity.
- `Module.equiv_directSum_of_isTorsion`, in `Mathlib/Algebra/Module/PID.lean`, supplies
  primary cyclic decomposition of finitely generated torsion modules over a PID. Applied to
  k[X], it gives the arbitrary-field loop classification. Zero cyclic factors are discarded.
- `ModuleCat`, `FGModuleCat`, `Module.Finite`, `Module.finrank`, `IsFiniteLength` and
  `CompositionSeries.jordan_holder` supply modules, scalar finiteness and composition factors.
  `Module.finrank_of_not_finite`, in `Mathlib/LinearAlgebra/Dimension/Free.lean`, makes
  infinite-dimensional vector spaces have finrank zero. `FGModuleCat A` is the finite-dimensional
  module category when A is finite-dimensional over k. Its finite coproducts and
  `CategoryTheory.Limits.HasBinaryBiproducts.of_hasBinaryCoproducts` give its biproducts.
- `CategoryTheory.Abelian.Ext` and its k-linear structure come from
  `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` and `Linear.lean`;
  `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean` provides module-category Ext.
  `CategoryTheory.ShortComplex` and `CategoryTheory.ShortComplex.ShortExact` retain both maps
  and their exactness. `ModuleCat.restrictScalars` fixes all changes of coefficient ring.
- `Ring.jacobson`, `IsArtinianRing.isNilpotent_jacobson_bot` and
  `IsArtinianRing.isSemisimpleRing_iff_jacobson` supply the Artinian radical results;
  `MoritaEquivalence` is a k-linear equivalence of module categories.
- `RootPairing`, `RootPairing.Base`, `RootPairing.reflection` and
  `RootPairing.Base.cartanMatrix`, with the predicates `RootPairing.IsRootSystem`,
  `RootPairing.IsCrystallographic`, `RootPairing.IsReduced` and `RootPairing.IsIrreducible`,
  supply the root-system carrier and marked base. `RootPairing.mk'`, in
  `Mathlib/LinearAlgebra/RootSystem/Basic.lean`, builds a root pairing over a characteristic-zero
  domain from a perfect pairing and finitely many roots and coroots, injectively indexed, with
  root–coroot pairing 2 and both families stable under the corresponding reflections.

### From Tau Ceti

Paths below are relative to `TauCeti/`.

- `TauCeti.pathAlgebra`, `TauCeti.pathAlgebraBasis` and
  `TauCeti.PathAlgebra.adjoin_vertexIdempotents_union_arrows` in
  `RepresentationTheory/Quiver/PathAlgebra/Basic.lean` fix multiplication, the path basis and
  generation by vertices **and** arrows. `TauCeti.Quiver.IsAcyclic` and
  `TauCeti.finite_paths_of_isAcyclic`, in `Quiver/Acyclic/Basic.lean` and `FinitePaths.lean`
  under `RepresentationTheory/`, give finite paths for finite acyclic quivers.
- `TauCeti.QuiverRep`, `TauCeti.quiverRepEquivalence`, `TauCeti.quiverRepFunctor`,
  `TauCeti.IsFinDim`, and `TauCeti.dimVector` come from
  `RepresentationTheory/Quiver/Representation/{Basic,AsModule,FiniteDimensional,DimensionVector}.lean`.
  The equivalence is representation-to-module; its inverse is the module-to-representation functor.
  `TauCeti.module_finite_quiverRepEquivalenceFunctorObj_of_isFinDim` and
  `TauCeti.isFinDim_quiverRepFunctor_obj` compare finiteness over **k** in both directions.
- `TauCeti.simpleRep`, `TauCeti.vertexSimpleModule`, `TauCeti.indecProjRep` and
  `TauCeti.indecInjRep` come from `RepresentationTheory/Quiver/Representation/`:
  `Simple.lean`, `VertexSimpleModule.lean`, `Projective/Basic.lean` and `Injective/Basic.lean`.
  `TauCeti.isEssentialEpi_indecProjRepToSimpleRep` in `Projective/Cover.lean` applies when
  all closed paths at the chosen vertex are trivial. It gives the cover in the finite acyclic case.
- `TauCeti.isLocalRing_end_of_isIndecomposable`,
  `TauCeti.exists_indecomposable_decomposition`, and
  `TauCeti.exists_equiv_linearEquiv_of_finset`, in
  `RingTheory/KrullSchmidt/{Indecomposable,Existence,Uniqueness}.lean`, apply to finite-length
  modules. Quiver biproduct forms are in `RepresentationTheory/Quiver/Representation/KrullSchmidt.lean`.
- `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` in
  `RingTheory/Idempotents/Primitive/Decomposition.lean` and `TauCeti.IsSemiperfectRing` in
  `RingTheory/Jacobson/Semiperfect.lean` provide the Artinian idempotent frame.
  `TauCeti.exists_projectiveCover` in `Algebra/Module/ProjectiveCover/ModuleCat.lean`
  supplies covers; `TauCeti.IsBasic` and `TauCeti.isBasic_iff_isReduced` in
  `RingTheory/Semisimple/BasicAlgebra.lean` supply basicness. For a finite-dimensional algebra
  basicness is reducedness of its semisimple radical quotient.
- `TauCeti.exists_isInjectiveEnvelope_of_finite`, in
  `Algebra/Module/Injective/Envelope/FiniteDimensional.lean`, gives every finitely generated
  module over a finite-dimensional algebra a finite-dimensional injective envelope in the sense of
  `TauCeti.IsInjectiveEnvelope` (`Envelope/Basic.lean`: injective target, injective map,
  essential range). `TauCeti.isInjectiveEnvelope_iff_forall_injective` is the form that tests
  maps out of the envelope, and `TauCeti.IsInjectiveEnvelope.exists_linearEquiv` is uniqueness
  over the module. `TauCeti.IsMinimalInjectiveCopresentation`, under `Algebra/Module/Injective/`,
  is the minimal injective presentation 0 → M → I⁰ → I¹, with
  `TauCeti.IsMinimalInjectiveCopresentation.isInjectiveEnvelope_cokernelMap` for the induced
  cokernel embedding and `TauCeti.IsMinimalInjectiveCopresentation.exists_linearEquiv` for
  uniqueness with commuting squares. No pinned statement exchanges covers and envelopes under
  k-duality; that exchange has the owner named under Scope and ownership and is not used here.
- `IsIdempotentElem.cornerEquivalence` and `IsIdempotentElem.moritaEquivalenceCorner`, in
  `RingTheory/Morita/Corner.lean`, give for a full idempotent e (one generating the whole algebra
  as a two-sided ideal) the k-linear equivalence between left A-modules and left eAe-modules, as a
  Mathlib `MoritaEquivalence`. `TauCeti.IsSemiperfectRing.exists_isIdempotentElem_full_isBasic_corner`
  and `TauCeti.IsSemiperfectRing.exists_isBasic_isMoritaEquivalent`, in
  `RingTheory/Morita/BasicAlgebra.lean`, give every semiperfect ring a full idempotent with basic
  corner and hence a Morita equivalent basic algebra (Mathlib's `IsMoritaEquivalent`, the
  nonemptiness of `MoritaEquivalence`); `TauCeti.isSemiperfectRing_of_finiteDimensional` makes
  every finite-dimensional algebra semiperfect.
- `TauCeti.IsAdmissibleIdeal.jacobson_eq_map_arrowIdeal` and `TauCeti.IsAdmissibleIdeal.isBasic`,
  in `RepresentationTheory/Quiver/AdmissibleIdeal/Radical/Basic.lean`, identify the radical of a
  bound quiver algebra over a finite vertex set with the image of the arrow ideal and prove every
  bound quiver algebra basic, without acyclicity. `TauCeti.IsAdmissibleIdeal.finrank_radicalLayer`,
  in `Radical/Layer.lean` there, gives rad/rad² of a bound quiver algebra total dimension the
  number of arrows. This is the direction from a presentation to the algebra in §3.2.
- `TauCeti.IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker` and
  `TauCeti.exists_quiver_admissibleIdeal_morita`, in
  `RepresentationTheory/Quiver/AdmissibleIdeal/Presentation.lean`, give a finite-dimensional basic
  algebra over an algebraically closed field a surjection from the path algebra of a finite quiver
  with admissible kernel, and every finite-dimensional algebra a Morita equivalent bound quiver
  algebra. They assert only that some finite quiver works: neither the simple modules nor the
  arrow counts are identified.
- `TauCeti.cartanMatrix` and `TauCeti.cartanMatrix_apply`, in
  `RepresentationTheory/GrothendieckGroup/CartanMatrix.lean`, give the composition-multiplicity
  matrix with columns indexed by projectives; the row convention is its transpose.
- `TauCeti.IsAdmissibleIdeal` in `RepresentationTheory/Quiver/AdmissibleIdeal/Basic.lean`
  is a predicate on an `Ideal` with `Ideal.IsTwoSided`, requiring Jᴺ ⊆ I ⊆ J² for the arrow
  ideal J. Its unrestricted exponent can be replaced by max(N,2). Kernels of algebra maps
  carry the required two-sidedness.
- `TauCeti.eulerForm`, `TauCeti.titsForm` and `TauCeti.titsPolarForm` are in
  `RepresentationTheory/Quiver/EulerForm.lean`. `TauCeti.QuiverRep.homDifferential`, its kernel
  comparison with Hom, and its Hom-minus-cokernel dimension identity are in
  `RepresentationTheory/Quiver/Representation/HomDifferential.lean`; the identity is
  `TauCeti.QuiverRep.eulerForm_eq_finrank_hom_sub_finrank_coker`, for any finite quiver and
  finite-dimensional vertex spaces. It is an input to, not a replacement for, the comparison with
  native Ext.
- `TauCeti.extEuler_eq_eulerForm_dimVector` and `TauCeti.isEulerAdmissibleOn_isFG_pathAlgebra`,
  in `RepresentationTheory/GrothendieckGroup/Quiver/ExtEuler.lean`, give for a finite quiver with
  finite-dimensional path algebra and finitely generated modules the alternating sum of the Ext
  dimensions as the Euler form of the dimension vectors;
  `TauCeti.extEulerPairing_add_flip_eq_titsPolarForm` there is the symmetrization B = E + Eᵀ on
  the Grothendieck group. `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose`, in
  `RepresentationTheory/GrothendieckGroup/ExtEulerMatrix.lean`, is E = (C⁻¹)ᵀ for the column
  Cartan matrix of projective covers of absolutely simple modules over a finite-dimensional
  algebra whose finitely generated modules have finite resolutions by finitely generated
  projectives; `TauCeti.isExhaustiveSimpleFamily_vertexSimpleModuleFG` in
  `RepresentationTheory/GrothendieckGroup/Quiver/SimpleBasis.lean` supplies the exhaustive simple
  family, and `TauCeti.PathAlgebra.finiteModules_le_admitsFiniteResolution`, in
  `RepresentationTheory/GrothendieckGroup/Quiver/CartanMap/Basic.lean`, the finite resolutions by
  finitely generated projectives over a finite-dimensional path algebra.
  `TauCeti.finiteDimensional_pathAlgebra_of_isAcyclic`, in
  `RepresentationTheory/Quiver/Acyclic/PathAlgebra.lean`, supplies finite-dimensionality from
  acyclicity.
- `TauCeti.hasProjectiveDimensionLT_two_pathAlgebra`, in
  `RepresentationTheory/Quiver/Representation/Projective/Dimension.lean`, gives every finite-length
  module over the path algebra of a finite acyclic quiver projective dimension at most one. It is
  the finite-length acyclic case of the heredity proved in §4.1.
- `TauCeti.PathAlgebra.vertexTensorBimodule`, `TauCeti.PathAlgebra.arrowTensorBimodule`,
  `TauCeti.PathAlgebra.vertexTensorMul` and `TauCeti.PathAlgebra.arrowTensorDifferential`, in
  `RepresentationTheory/Quiver/PathAlgebra/BimoduleResolution.lean`, form the standard bimodule
  resolution 0 → ⊕ₐ:ᵢ→ⱼ Aeⱼ ⊗ₖ eᵢA → ⊕ᵥ Aeᵥ ⊗ₖ eᵥA → A → 0 of a path algebra A = kQ over any
  commutative ring k and finite vertex set; `TauCeti.PathAlgebra.arrowTensorDifferential_injective`,
  `TauCeti.PathAlgebra.exact_arrowTensorDifferential_vertexTensorMul` and
  `TauCeti.PathAlgebra.vertexTensorMul_surjective` make it short exact, and both left terms carry
  `Module.Projective` instances over the enveloping algebra. Neither acyclicity nor a field is
  assumed. `LinearMap.HomCocycleQuotient` and `LinearMap.homCocycleQuotientEquivExt`, in
  `Algebra/Module/HomCocycle/Basic.lean` and `Algebra/Category/ModuleCat/HomCocycle.lean`, give for
  a linear map f : P₁ → P₀ with P₀ projective and any module N the maps P₁ → N vanishing on ker f,
  modulo maps extending across f, and their k-linear identification with Ext¹(P₀/im f, N);
  `LinearMap.homCocycleQuotientEquivExt_mk` reads a class as the extension class of
  0 → im f → P₀ → P₀/im f → 0 composed with the map on im f, and
  `LinearMap.homCocycleQuotientEquivExt_naturality` and
  `LinearMap.homCocycleQuotientEquivExt_precomp` give naturality in N and in the presentation.
  Neither injectivity of f nor projectivity of P₁ is assumed. These are the inputs to §4.1.
- `TauCeti.vertexPreReflection` and its loopless automorphism `TauCeti.vertexReflection`
  are in `RepresentationTheory/Quiver/Reflection/DimensionVector.lean`.
  `TauCeti.reflectionFunctor` and `TauCeti.dimVector_reflectRep`, in `Reflection/Representation.lean`,
  use the kernel of the incoming sum; the dimension theorem requires finite-dimensional
  incoming spaces and surjectivity. `TauCeti.dimVector_reflectRep_of_indecomposable` in
  `Reflection/Indecomposable.lean` supplies this for finite-dimensional indecomposables other
  than the sink simple. `TauCeti.reflectionFunctorList`, `TauCeti.coxeterFunctor` and
  `TauCeti.indecomposable_and_dimVector_coxeterFunctor_or_isZero` in `Reflection/Composite.lean`
  retain the killed alternative and the ordering.
- `TauCeti.Quiver.IsAcyclic.exists_isSinkAdmissible`, in
  `RepresentationTheory/Quiver/Reflection/Admissible.lean`, gives a repetition-free complete sink
  ordering. `TauCeti.Quiver.reflectList_eq_self`, in `Reflection/Iterate.lean`, restores the quiver
  after one complete pass, so that ordering can be repeated.
- `TauCeti.exists_vertexPreReflectionList_take_apply_eq_single_and_nonneg`, in
  `RepresentationTheory/Quiver/Reflection/PositiveRoot.lean`, reaches a simple root through
  nonnegative prefixes of repetitions of a complete vertex ordering for positive-definite q. Admissibility is a separate input from the preceding contract.
  `TauCeti.isFiniteRepType_iff_titsForm_posDef` and
  `TauCeti.gabrielIndecomposableEquivPositiveRoot`, in
  `RepresentationTheory/Quiver/FiniteRepType/{Gabriel,Correspondence}.lean`, give the
  arbitrary-field finite-dimensional classification. `TauCeti.IsFiniteRepType` includes
  pointwise finite-dimensionality in its indecomposable skeleton. The positive roots there are
  the nonnegative integral vectors of Tits value one, and
  `TauCeti.finite_setOf_nonneg_titsForm_eq_one`, in `RepresentationTheory/Quiver/EulerForm.lean`,
  makes them finitely many when q is positive definite.
- `TauCeti.posRoots`, in `LinearAlgebra/RootSystem/Positive.lean`, is the set of roots of a root
  pairing that are positive relative to a base (`RootPairing.Base.IsPos`: positive height).
- `TauCeti.IsMinimalProjectivePresentation`, its existence and finite-generation results,
  `TauCeti.AuslanderReitenTranspose`, `TauCeti.AuslanderReitenTranslate`, and
  `TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranslate`
  come from `Algebra/Module/MinimalProjectivePresentation/` and `Algebra/Module/AuslanderReiten/`.
  The translate is attached to a presenting map; its identification with τM uses the
  minimal-presentation hypothesis.
  `TauCeti.arTranslate`, `TauCeti.nonempty_iso_arTranslate` and `TauCeti.isZero_arTranslate_iff`,
  in `RepresentationTheory/Quiver/Representation/Translate.lean`, give the object-level translate
  D Tr of a pointwise finite-dimensional representation of a quiver with finitely many paths, its
  independence of the chosen minimal presentation, and its vanishing exactly on projectives.
- `TauCeti.irreducibleMorphismSpace` in `CategoryTheory/Preadditive/Radical/Quotient.lean`
  is the k-vector space rad/rad².
  `CategoryTheory.ShortComplex.IsAlmostSplit`, in `CategoryTheory/AlmostSplit/Sequence.lean`,
  combines short exactness with left and right almost-split conditions in the chosen category.
  `CategoryTheory.ShortComplex.IsAlmostSplit.exists_iso_τ₃_eq`, in `Uniqueness.lean`, extends
  a specified endpoint isomorphism to an isomorphism of complexes when both left-end
  endomorphism rings are local, and `CategoryTheory.ShortComplex.IsAlmostSplit.nonempty_iso_X₁`
  there compares the left ends. Finite-length locality discharges that condition here.
- `ModuleCat.arTranslate`, in `Algebra/Category/ModuleCat/AuslanderReiten/Translate.lean`, is D Tr
  of a chosen finite minimal projective presentation of a finitely generated module over a
  finite-dimensional algebra, over any field. `ModuleCat.nonempty_iso_arTranslate` compares it with
  every finite minimal presentation; `ModuleCat.isZero_arTranslate_iff` and
  `ModuleCat.injective_arTranslate_iff` make it zero, and injective, exactly for projective
  modules, `ModuleCat.indecomposable_arTranslate_iff` makes the translate of an indecomposable
  indecomposable exactly when the module is nonprojective, and
  `ModuleCat.nonempty_iso_arTranslate_iff` and `ModuleCat.exists_nonempty_iso_arTranslate` make it
  injective and surjective from nonprojective onto noninjective indecomposable classes.
- `LinearMap.auslanderReitenExtEquiv`, in `Algebra/Category/ModuleCat/AuslanderReiten/Basic.lean`,
  is Auslander–Reiten duality: for a map f between finitely generated projectives over any algebra
  over a field and any module N, a k-linear equivalence between maps N → D Tr f in the injective
  stable category (`TauCeti.ExactStructure.InjectiveStableCategory`) and the k-dual of
  Ext¹(coker f, N). `LinearMap.auslanderReitenExtEquiv_naturality` and, in `Naturality.lean`,
  `LinearMap.auslanderReitenExtEquiv_presentation_naturality` make it natural in N and in the
  presentation. Neither minimality nor finite-dimensionality is assumed.
- `TauCeti.ExactStructure.isZero_injectiveStableFunctor_obj_iff`,
  `TauCeti.ExactStructure.injectiveStableFunctor_map_eq_zero_iff_mem_range` and
  `TauCeti.ExactStructure.homCokernelEquivInjectiveStableHom`, in
  `CategoryTheory/Exact/Stable/Injective.lean`, describe the injective stable category of an exact
  structure: an object vanishes there exactly when it is relatively injective, and for any
  inflation i : X → I into a relative injective a map out of X vanishes exactly when it extends
  across i, so that `TauCeti.HomCokernel` of i (`CategoryTheory/Linear/HomCokernel/Basic.lean`: maps
  out of X modulo those extending across i) is k-linearly the stable Hom out of X.
  `TauCeti.ExactStructure.factorsThrough_injective_iff_exists_extension`, in
  `CategoryTheory/Exact/Injective.lean`, says a map factors through some relative injective exactly
  when it extends across such an i. For the abelian exact structure
  `TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.abelian_isInflation_iff` (both in
  `CategoryTheory/Exact/Abelian.lean`) makes the inflations the monomorphisms and
  `TauCeti.ExactStructure.abelian_isInjective_iff` (in `Exact/Injective.lean`) makes the relative
  injectives the injective objects, which Mathlib's `Module.injective_iff_injective_object`
  identifies with injective modules.
- `ModuleCat.exists_isAlmostSplit_arTranslate`, `ModuleCat.exists_isAlmostSplit_of_not_injective`,
  `ModuleCat.exists_isAlmostSplit_X₃_eq_iff` and `ModuleCat.exists_isAlmostSplit_X₁_eq_iff`, in
  `Algebra/Category/ModuleCat/AuslanderReiten/Sequence.lean`, are the existence theorems over a
  finite-dimensional algebra and any field: a finitely generated module ends an almost-split
  sequence exactly when it is indecomposable and nonprojective, and then one with left end
  `ModuleCat.arTranslate` and finitely generated middle term exists; dually on the left. The
  lifting properties hold among all A-modules.
- `TauCeti.IrreducibleMorphismQuiver`, in
  `CategoryTheory/Preadditive/Radical/IrreducibleMorphismQuiver/Basic.lean`, is the quiver on
  isomorphism classes of indecomposables whose arrows index a k-basis of rad/rad² between chosen
  representatives; `TauCeti.IrreducibleMorphismQuiver.card_arrows` reads each arrow count as the
  k-dimension of the irreducible space. `ModuleCat.arTranslation` and
  `TauCeti.IsRepresentationFinite.finite_irreducibleMorphismQuiver_arrows`, in
  `Algebra/Category/ModuleCat/AuslanderReiten/Quiver.lean`, specialize it to finitely generated
  modules, with the partial translation (`TauCeti.ARTranslation.existsUnique_translate_eq_some_iff`
  makes it a bijection from nonprojective onto noninjective vertices) and finitely many arrows in
  the representation-finite case. `ModuleCat.card_arrows_eq_card_arrows_of_translate_eq_some`, in
  `Mesh.lean` there, is the mesh relation: when the translation sends m to t, every vertex x has as
  many arrows x → m as t → x. No algebraic closedness is assumed.

### From TauCetiRoadmap.SemisimpleAlgebras

Consume Layers 1.5–2: simple modules as minimal left ideals, the Wedderburn presentation of the
semisimple quotient, and the canonical division-ring and multiplicity invariants. Over a splitting
algebraically closed field the division factors are k. No minimal faithful projective criterion
for basicness is assumed.

## How to read the build

Layers 0–2 fix the reusable algebra, representation and decomposition interfaces and their
examples. Layer 3 supplies the finite-dimensional algebra frame and presentations; Layer 4
compares homological invariants with the combinatorial forms. Layer 5 connects the dimension-root
classification with marked rational root systems. Layer 6 consumes the pinned translate,
injective stable Hom in its finite-dimensional form, Auslander–Reiten duality, almost-split
existence and quiver of irreducible morphisms, and fixes the quiver examples of all of them. It
does not require ADE: the dual numbers are an essential bound-quiver example.

## Layer 0: quivers and path algebras

### 0.1 Multiplication and generators

Use the later-factor-first convention and the native path basis. The generating family consists
of all vertex idempotents together with all arrows (ASS II.1.2–1.4, pp.43–45; II.1.8, p.48).
Finite vertices give the unit ∑ᵢ eᵢ; finitely many paths give finite-dimensionality. Finite vertices
and arrows plus acyclicity give the latter condition.

**Checks.**

- Two isolated vertices have path algebra k×k. The arrows generate only the diagonal scalar
  algebra; adjoining (1,0) and (0,1) gives dimension 2.
- For 1 → 2, e₂a = a = ae₁, whereas e₁a = ae₂ = a² = 0. Pointwise multiplication on the
  path coefficients would give e₂a = 0 and is excluded.
- The empty, A₁ and A₂ quivers have respectively 0, 1 and 3 paths; their algebra dimensions
  are 0, 1 and 3. The empty algebra has 1 = 0. A loop has paths of every length.

*Needs:* Mathlib paths and the Tau Ceti path-algebra and acyclicity contracts.

### Examples

For a chain 1 → 2 → 3 → 4, (cb)a = c(ba) is the same length-three path. Scalar λ multiplies
both expressions by λ, and incompatible endpoints give zero on either side.

### Dependencies

Mathlib quivers and paths; Tau Ceti path-algebra, basis, generators and finite-path results.

## Layer 1: representations and the module equivalence

### 1.1 Vertex spaces and elementary representations

Use the native equivalence with left modules. The total space is the finite direct sum of
vertex spaces; the inverse takes the idempotent components eᵢM. Kernels, cokernels and biproducts
are vertexwise. The vertex simple has k at i, zero elsewhere, and all arrows zero. The vertex
projective has at j the free path space from i to j; the coinduced injective has the full dual
of the path space from j to i (ASS III.1.6, pp.72–75; III.2.4, p.79, and III.2.6, p.81).
For finite acyclic Q, the simple is the top of its vertex projective and the projective is its cover. Coinduced injectives have a finite dual path basis in that same case.

**Checks.**

- For A₂, P₁ has vector (1,1), P₂ has (0,1), and the regular module has (1,2), of total
  k-dimension 3. Both sides of the equivalence give that total.
- For A₁, P₁ → S₁ is k → k by the identity, a projective cover. For the one-loop quiver,
  evaluation k[X] → k at zero is not a cover: (X−1) is proper and still maps onto k.
- Over 𝔽₂ the dual of the one-loop path space has cardinality 2^ℵ₀, whereas its finite-support
  path span is countable. Replacing the full dual by another path span loses the coinduced object.
- The loop regular module is generated by 1 over k[X] but fails both pointwise k-finiteness
  and total k-finiteness. The zero representation satisfies both, with dimension vector zero.

*Needs:* Layer 0; the native representation, finiteness, vertex-simple and projective/injective contracts.

### Examples

For A₂ the identity-arrow representation has kernel zero and cokernel zero on that arrow.
The zero-arrow representation of vector (1,1) is S₁⊕S₂, not that indecomposable. A loop may act
by either 0 or 1 on k; these are nonisomorphic simples, so vertex simples do not exhaust simples
for arbitrary cyclic quivers.

### Dependencies

Layer 0 and the representation/module equivalence; Mathlib abelian module categories.

## Layer 2: finite-length decomposition

### 2.1 Decomposition interface

Use finite-length Fitting and Krull–Schmidt: an indecomposable finite-length module has local
endomorphism ring, a finite-length module decomposes into finitely many indecomposable summands,
and two such decompositions match under a permutation and summand isomorphisms
(ASS I.4.8 and I.4.10, pp.22–23). The uniqueness is of the multiset of isomorphism classes,
not of embedded submodules.

**Checks.**

- Over a field, 0, k and k² have respectively 0, 1 and 2 indecomposable summands, counted
  with multiplicity; the zero object is not indecomposable.
- Two different bases of k² give different embedded lines but the same multiset {k,k}.
- For k[ε]/(ε²) the regular module is indecomposable and its endomorphism ring has the
  nonzero nilpotent ε. Locality does not mean every nonzero endomorphism is invertible.

*Needs:* Mathlib finite length and Jordan–Hölder; Tau Ceti Krull–Schmidt and its quiver transport.

### Examples

For A₂ the three indecomposables are S₁, S₂ and P₁; the regular module is P₁⊕S₂.

### Dependencies

Finite-length module theory; Layer 1 only for representation applications.

## Layer 3: the finite-dimensional algebra frame

### 3.1 Covers, envelopes and basic Morita reduction

For a finite-dimensional k-algebra A, use primitive orthogonal idempotents, its nilpotent
Jacobson radical, the semisimple quotient and projective covers. Injective envelopes are
consumed, not constructed: every finite-dimensional left A-module M has a finite-dimensional
injective envelope M → I, unique over M, and essentiality is equivalently tested on maps
I → X whose restriction to M is monic (`TauCeti.exists_isInjectiveEnvelope_of_finite`,
`TauCeti.IsInjectiveEnvelope.exists_linearEquiv`,
`TauCeti.isInjectiveEnvelope_iff_forall_injective`; ASS I.5.12–5.14, pp.30–31; ARS II.4.1, over
any field). The exchange of projective covers and injective envelopes under the k-dual
D = Homₖ(−, k) is the case R = k of ArtinAlgebras §2.3 and is not planned here (Scope and
ownership); nothing in this roadmap uses it.

**Checks.**

- For A=k, k → k by identity is its envelope in the pinned sense; k → k² as a summand is not
  essential.
- For A=k[ε]/(ε²), which is self-injective, the simple embeds by 1 ↦ ε in A; the ideals are 0,
  kε and A, so the image kε meets every nonzero one and this is the envelope. The rescaled
  embedding 1 ↦ aε, a≠0, is another envelope, and the uniqueness equivalence over the simple,
  multiplication by the unit a on A, absorbs it.
- The envelope of zero is zero; the map 0 → k fails essentiality because its intersection with k is zero.

A minimal injective presentation 0→M→I⁰→I¹, whose maps M→I⁰ and coker(M→I⁰)→I¹ are
injective envelopes, is the pinned `TauCeti.IsMinimalInjectiveCopresentation`; its construction
by successive envelopes and its uniqueness over M with commuting squares are consumed
(ASS I.5.15–5.16, pp.31–32).

**Checks.**

- For A=k the presentation is 0→k→k→0, with identity embedding and zero cokernel.
- For the dual-number simple it is 0→k→A→A, with maps 1↦ε and multiplication by ε;
  image and kernel are kε and the induced cokernel embedding has image kε.
- For M=0 both injectives are zero. Adding an extra injective summand to I¹ destroys
  essentiality: that summand has zero intersection with the cokernel image.

Morita reduction to a basic algebra is consumed, not constructed. Every finite-dimensional
k-algebra A is semiperfect, `TauCeti.IsSemiperfectRing.exists_isIdempotentElem_full_isBasic_corner`
gives a full idempotent e whose corner eAe is basic, and `IsIdempotentElem.moritaEquivalenceCorner`
makes A and eAe k-linearly Morita equivalent (`TauCeti.IsSemiperfectRing.exists_isBasic_isMoritaEquivalent`
packages the two). The corner is a k-subspace of A, so it is finite-dimensional. In module terms
Ae is the direct sum P of one projective cover per simple class and eAe ≅ Endₐ(P)ᵐᵒᵖ. P is a
progenerator; faithful projectivity alone is insufficient (ASS I.6.3, p.33, and I.6.10, p.37;
ARS II.2.6, over any field). For the right-module source, pass to opposites to obtain this
left-module formula. The Checks below test the pinned reduction.

**Checks.**

- For A₂, P₁ alone is faithful and minimal faithful projective, but dim End(P₁)=1 while dim A=3.
  The progenerator P₁⊕P₂=A instead gives Endₐ(A)ᵐᵒᵖ ≅ A.
- M₂(k) reduces to k; its semisimple quotient is not reduced, since E₁₂²=0 with E₁₂≠0.
- k×k is basic with two simple classes, and the zero algebra has the empty projective family.

*Needs:* SemisimpleAlgebras Layers 1.5–2; native idempotent decomposition, covers, injective
envelopes and copresentations, basicness, the corner Morita equivalence and basic Morita
reduction, finite-length decomposition and Mathlib Morita equivalence.

### 3.2 Admissible presentation and the Ext-quiver

Prove `exists_admissible_presentation`. For an algebraically closed field k and basic
finite-dimensional A, there are finite vertex and arrow sets Q and a surjection kQ → A
whose two-sided kernel I satisfies Jᴺ ⊆ I ⊆ J², with J the arrow ideal. The vertex simples
exhaust the simple A-modules without repetition, restrict along the surjection to the native
vertex simple modules, and the number of arrows i → j is dimₖ Ext¹ₐ(Sᵢ,Sⱼ)
(ASS II.2.1, p.53; II.3.7, pp.64–65; III.2.12, p.84). The surjection with admissible kernel by
itself is the pinned `TauCeti.IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker`, and
its Morita form for a general finite-dimensional A is `TauCeti.exists_quiver_admissibleIdeal_morita`.
Those statements assert only that some finite quiver works. What is new here is the
identification of the simple modules and of the arrow counts: take as arrows i → j a basis of the
(j,i)-corner of rad/rad², as the pinned proof does, and compare that corner with Ext¹ₐ(Sᵢ,Sⱼ).

The zero algebra uses the empty quiver. The converse direction is consumed: a bound quiver algebra kQ/I
with I admissible is basic and its radical is the image of the arrow ideal
(`TauCeti.IsAdmissibleIdeal.isBasic`, `TauCeti.IsAdmissibleIdeal.jacobson_eq_map_arrowIdeal`).
Arrow lifts belong to eⱼ(rad A)eᵢ under our left convention.
The radical block eⱼ(rad A/rad² A)eᵢ and Ext¹ₐ(Sᵢ,Sⱼ) have the same dimension; comparison
maps depend on the chosen primitive idempotents and simple identifications. Neither J nor its
powers are replaced by Jac(kQ).

**Checks.**

- The dual numbers have one vertex, one loop, J=(X), I=(X²), N=2. Both inclusions are equalities,
  but Jac(k[X])=0. The loop count and dim Ext¹(k,k) are both 1.
- For A₂, I=0 and J²=0. There is one arrow 1 → 2 and dim Ext¹(S₁,S₂)=1, while Ext¹(S₂,S₁)=0.
- k×k uses two isolated vertices, J=I=0 and two simple classes. Requiring connected Q here
  would lose this algebra; for the zero algebra both simple and vertex sets are empty.

*Needs:* §3.1; native path algebra, arrow ideal, admissibility, the pinned bound-quiver
surjection, and bound-quiver radical, radical layer and basicness; primitive idempotent lifts;
Mathlib native Ext; the radical-layer/simple-extension comparison proved in this subsection.

### 3.3 Cartan and Euler matrices

Index projective covers by simple classes. The row matrix Cᵢⱼ=[Pᵢ:Sⱼ] is the transpose of
the column convention for the generic composition-multiplicity Cartan matrix. For a split basic
algebra, Cᵢⱼ=dimₖ Hom(Pⱼ,Pᵢ); over a general field divide that dimension by dimₖ End(Sⱼ).
For an unbound finite acyclic path algebra Cᵢⱼ counts paths i → j. With relations the corresponding
space is the quotient path space, whose dimension is not a count of equivalence classes of paths.
For the unbound finite acyclic path algebra, E=C⁻¹ and B=E+Eᵀ are consumed. The pinned
`TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose` gives the Ext-Euler matrix of the vertex
simples as the transposed inverse of the column Cartan matrix; transposing both conventions gives
E=C⁻¹ for the row matrix here, and `TauCeti.extEuler_eq_eulerForm_dimVector` identifies that
Ext-Euler matrix with the matrix of E in the vertex basis. Its hypotheses are discharged here from
pinned results: the vertex simples are absolutely simple, exhaust the simples and have the vertex
projectives as covers, and every finitely generated module has a finite resolution by finitely
generated projectives (`TauCeti.PathAlgebra.finiteModules_le_admitsFiniteResolution`).
B=E+Eᵀ is `TauCeti.extEulerPairing_add_flip_eq_titsPolarForm`
(ASS III.3.8–3.13, pp.89–91, adapted to rows indexed by projectives).

**Checks.**

- A₁ has C=[1], E=[1], B=[2]; the algebra and root matrices already differ here.
- A₂ has C=[[1,1],[0,1]], E=[[1,−1],[0,1]], CE=EC=I and B=[[2,−1],[−1,2]].
- For k×k, C=E=I₂ and B=2I₂. For the dual numbers, C=[2]; E=C⁻¹ is not asserted because
  the algebra is not an unbound acyclic path algebra.

*Needs:* §3.1's projective covers and composition multiplicities; the pinned Ext-Euler
identities and finite resolutions over a finite-dimensional path algebra. The matrix identity is
not an input to Layer 4.

### Examples

A₂ fixes every left/right and row/column convention. The dual numbers fix the distinction between
an admissible arrow-ideal relation and a relation in the radical of the unquotiented path algebra.

### Dependencies

Layer 2; SemisimpleAlgebras Layers 1.5–2; native covers, primitive idempotents and admissibility.
Layer 3 does not use Layer 4, and Layer 4 does not use the matrix identity of §3.3.

## Layer 4: Euler forms, Ext and reflections

### 4.1 Projective resolutions and native Ext

For finite Q over any field, with or without oriented cycles, the two-term projective resolution
of an arbitrary representation M, with degree-zero term ⊕ᵢ Pᵢ⊗ₖMᵢ and degree-one term
⊕ₐ:ᵢ→ⱼ Pⱼ⊗ₖMᵢ, is the pinned standard bimodule resolution of kQ
(`TauCeti.PathAlgebra.exact_arrowTensorDifferential_vertexTensorMul`, with the injectivity,
surjectivity and projectivity statements beside it) tensored over kQ with M. Prove that
identification: the bimodule sequence is split exact as a sequence of right kQ-modules, since its
three terms are projective right modules, so tensoring with M keeps it exact; its terms are
projective left modules; the construction is natural in maps of representations; and its
differential on the arrow summand is the difference between path concatenation and the action of
the arrow on M. `pathAlgebra_higher_ext_vanish` states Extⁿ(M,N)=0 for n≥2 on the native module
category of every finite quiver (ASS VII.1.4 and VII.1.7(a), pp.245–248, state heredity for finite acyclic Q;
the path-space resolution needs neither acyclicity nor a particular field, and the one-loop Check
below shows that acyclicity is not a hypothesis). The pinned
`TauCeti.hasProjectiveDimensionLT_two_pathAlgebra` is the case of finite-length modules over a
finite acyclic quiver; the target removes both restrictions. Acyclicity, equivalently finite-dimensionality
of kQ (`TauCeti.finiteDimensional_pathAlgebra_of_isAcyclic`), is used in this layer only to
compare with the pinned Ext-Euler characteristic.

Applying Hom gives the vertex-to-arrow differential with component N(a)fᵢ−fⱼM(a). Prove that
the Hom cocycle quotient `LinearMap.HomCocycleQuotient` of the resolution's differential is the
cokernel of the Hom differential: the differential is injective, so every map out of the arrow
term is a cocycle, and the coboundaries are exactly its image. Then
`nonempty_homDifferential_coker_linearEquiv_ext` identifies that cokernel k-linearly with native
Ext¹: the map is the pinned `LinearMap.homCocycleQuotientEquivExt`, transported along the
isomorphism from the cokernel of the resolution's differential to M, and compatibility with the
class of a short exact extension is `LinearMap.homCocycleQuotientEquivExt_mk`. The target
permits arbitrary vertex spaces; finite-dimensionality is needed for the numerical identity, not
this comparison.
For pointwise finite-dimensional M, N the identity E(dM,dN) = dim Hom(M,N) − dim Ext¹(M,N), both
dimensions cast to ℤ before subtraction, is a corollary and not a separate target: the pinned
`TauCeti.QuiverRep.eulerForm_eq_finrank_hom_sub_finrank_coker` gives E(dM,dN) as dim Hom minus
the dimension of the cokernel of the Hom differential, for every finite quiver, and
`nonempty_homDifferential_coker_linearEquiv_ext` identifies that cokernel with Ext¹. For finite
acyclic Q it agrees with the pinned `TauCeti.extEuler_eq_eulerForm_dimVector` (the modules are finitely
generated by `TauCeti.module_finite_quiverRepEquivalenceFunctorObj_of_isFinDim`) once
`pathAlgebra_higher_ext_vanish` removes every term of degree at least two (ASS III.3.13, p.91).

API for the resolution and comparison:

- Augmentation evaluates paths on M; the two consecutive maps compose to zero, and the sequence
  is the pinned bimodule resolution tensored with M.
- The resolution is exact at every vertex and natural in maps of representations.
- Cokernel classes classify extensions with fixed endpoints, and addition agrees with Baer sum.
- The comparison is natural contravariantly in M and covariantly in N, from the pinned naturality
  of the Hom-cocycle equivalence; all higher Ext vanish.

**Checks.**

- For A₂, M=S₁,N=S₂ gives Hom dimension 0, Ext¹ dimension 1, and Euler value −1=0−1;
  reversing M,N gives 0=0−0. Natural subtraction would give the wrong first value.
- For M=N=P₁, Hom has dimension 1, Ext¹ is zero, and q(1,1)=1. For M=0 both sides are zero.
- At A₁ the arrow term is zero and Hom dimension is mn for dimensions m,n, so Ext¹=0 and E=mn.
  For the dual-number simple, Ext²(k,k) has dimension 1: relations cannot be ignored in heredity.
- The A₂ nonsplit extension has middle arrow 1 and class 1 in a one-dimensional cokernel;
  the split extension has middle arrow 0 and class 0. A zero comparison map would identify them.
- The one-loop quiver is finite and not acyclic; its path algebra k[X] is a principal ideal
  domain, so submodules of projectives are projective and Extⁿ(M,N)=0 for n≥2 and all M, N.
  Heredity stated with an acyclicity hypothesis would exclude this true case. The Euler identity
  holds there too: for k with endomorphisms λ and μ, Hom and Ext¹ both have dimension 1 if λ=μ
  and 0 otherwise (the cokernel of x ↦ μx−xλ), and E(1,1)=1−1=0; the pinned Ext-Euler
  characteristic is unavailable since k[X] is infinite-dimensional.

*Needs:* Layer 1, native vertex projectives, the pinned standard bimodule resolution of the path
algebra, the Hom differential and its Hom-minus-cokernel identity, the pinned Hom-cocycle
equivalence with Ext¹ and its naturality, Mathlib projective resolutions, native Ext and short
exact sequences. Exactness and comparison, not the Euler matrix inverse, are the proof inputs.

### 4.2 Reflection and Coxeter interfaces

Use the kernel reflection at a sink and the cokernel reflection at a source. The kernel-to-incoming
sum inclusion determines each reversed arrow. For finite-dimensional M with no sink-simple
summand, the incoming sum is surjective and d(F⁺ᵢM)=sᵢd(M). For indecomposable M the alternatives
are M≅Sᵢ and F⁺ᵢM=0, or indecomposable survival with the dimension formula and inverse source
reflection (BGP Theorem 1.1, pp.21–22; Etingof v5 Definitions 5.26–5.27, pp.90–91).
Compose along a sink-admissible ordering in the order fixed in Conventions. For a general
finite-dimensional M require the no-simple-summand condition at **each** step for the Coxeter
dimension formula; for indecomposables use the surviving/killed dichotomy.

**Checks.**

- At the sink 2 of A₂, S₁ maps to the identity-arrow representation of 1 ← 2, P₁ maps to
  (k ← 0), and S₂ maps to zero. The surviving vectors are (1,0)↦(1,1) and (1,1)↦(1,0).
- The projection k²→k gives reflected vector (2,1)=(2,2−1). The surjective shift on the
  countable direct sum of k has one-dimensional kernel: input finranks (0,0), reflected
  finranks (0,1). It has no sink-simple summand but is outside the finite-dimensional formula.
- s₂ fixes (2,1) since 2·1−2=0; it sends (1,0) to (1,1), so the coordinate hyperplane is not
  fixed. It sends (0,1) to (0,−1).
- A₁'s simple is killed, while its Coxeter reflection sends 1 to −1. On A₂, sink order [2,1]
  gives C⁺S₁=S₂ and s₁s₂(1,0)=(0,1).
- Two-arrow and three-arrow Kronecker vectors (1,1) have q=0 and q=−1 respectively; the
  three-arrow representation (1,0,0) has endomorphism ring k and is indecomposable. The zero
  vector has q=0 but is not a root.

*Needs:* Layer 1; native reflection dimension, inverse-reflection and admissible-composite results.

### Examples

For a brick M, q(dM)=1 implies Ext¹(M,M)=0. Indecomposability alone gives only
q(dM)=dim End(M)−dim Ext¹(M,M); it does not justify replacing dim End(M) by 1.

### Dependencies

Layer 1 and native reflection theory. Finite-length decomposition identifies sink-simple summands.
The reading of the simple reflections as reflections of a marked root system is §5.2's and is not
an input here.

## Layer 5: Gabriel and the marked rational root system

### 5.1 Dimension-root correspondence

For nonempty connected finite Q, finite representation type is equivalent to positive definiteness of q,
hence to an ADE underlying graph. Over any field, the finite-dimensional indecomposable
isomorphism classes then correspond bijectively to nonnegative integral vectors of q-value 1;
their endomorphism rings are k and their self-Ext¹ vanishes (BGP Theorem 3.1 and Note 1,
pp.28–30; Etingof v5 Theorem 5.23, p.89). On an equioriented Aₙ these are exactly the interval
representations with identity maps within the interval.

Choose a complete sink-admissible ordering and repeat it, using restoration of the quiver
after each full pass. The admissible-reflection route uses termination: for a complete vertex ordering and a
positive-definite q, some Coxeter iterate of any nonzero vector leaves the nonnegative cone
(BGP Lemma 2.3, p.28). For a positive root, the first failed prefix is a simple root reflected
to its negative. Transport indecomposables through the preceding surviving prefixes. This
allows intermediate height increases and supplies existence, uniqueness and the brick property.

**Checks.**

- A₂ has vectors (1,0),(0,1),(1,1), each of q-value 1; there are three indecomposable classes.
- For D₄ oriented toward the centre, (1;1,1,1) reflects to (2;1,1,1). Height rises 4→5,
  while q remains 4−3=7−6=1; strict decrease at every sink would be false.
- Aₙ has n(n+1)/2 intervals, including 0 for n=0 and 1 for n=1. D₄ has 12 positive roots:
  three leaf simples, eight vectors with centre 1 and any subset of leaves 1, and (2;1,1,1).

*Needs:* Native finite-dimensional Gabriel correspondence and admissible termination; Layer 4
for the self-Ext interpretation. The positive roots here are the nonnegative integral vectors of
Tits value one of `TauCeti.gabrielIndecomposableEquivPositiveRoot`; no root pairing is used.

### 5.2 The marked root-pairing bridge

Prove `exists_rootPairing_titsForm`: for nonempty connected Q with positive-definite q there
is a reduced crystallographic irreducible rational root system on the vertex space, a base
and a vertex-to-base bijection sending i to the actual standard vector eᵢ. Its base Cartan
matrix is 2I−(adjacency+adjacencyᵀ), and its roots are exactly the nonzero integral vectors
of q-value 1 (BGP §2, pp.26–28; Etingof v5 Definition 5.20 and Remark 5.21, p.89).

One route builds the pairing with `RootPairing.mk'` on the dot pairing of ℚ^Q. Positive
definiteness gives q(eᵢ)=1, so Q has no loops and every eᵢ is a root. The roots are the integral
vectors α with q(α)=1. The coroot of α is the vector representing B(α,−), so the root–coroot
pairing is B(α,α)=2q(α)=2; the reflection v ↦ v−B(v,α)α preserves q and the lattice ℤ^Q, so it
permutes the roots, and dually the coroots. Every root has all coordinates of one sign: write
α=α⁺−α⁻ with disjoint supports; B(α⁺,α⁻) only pairs distinct vertices, where B is minus the
number of arrows between them, so q(α)=q(α⁺)+q(α⁻)−B(α⁺,α⁻)≥2 when both parts are nonzero
(Etingof v5 Lemma 5.16, pp.87–88, for Dynkin graphs; BGP Lemma 2.2(3), pp.27–28, for the Weyl
orbits of the simple roots). Hence each root is ± a nonnegative one, the roots are finitely many
by `TauCeti.finite_setOf_nonneg_titsForm_eq_one` (Etingof v5 Remark 5.14, p.87), and the vertex
vectors form a base. Reducedness follows from q(cα)=c²q(α), and irreducibility from
connectedness, since B(eᵢ,eⱼ)<0 for adjacent vertices.

Combine this marked bridge with §5.1 to interpret the dimension vectors as the positive roots
`TauCeti.posRoots` of the marked base, not merely of an unmarked isomorphic root system: by the
sign property a root is positive exactly when its vector is nonnegative.

**Checks.**

- A₁ has roots ±1 and base vector 1, with Cartan entry 2 and q(1)=1.
- A₂ has six roots, positive half (1,0),(0,1),(1,1); q(1,−1)=3 excludes the wrong sign.
  Its Cartan matrix is [[2,−1],[−1,2]]. Taking 2α as the coroot of α under the dot pairing would
  give 2I, the matrix of A₁×A₁, and pair (1,1) with its coroot to 4; the Cartan clause excludes it.
- On D₄, the vector α with centre 1 and leaves 1, −1, 0 has q(α)=3: squares 3, centre–leaf
  products −1 and +1. Its parts α⁺ (centre and first leaf) and α⁻ (second leaf) have q-value 1
  each and B(α⁺,α⁻)=−1, so q(α)=1+1+1. A mixed-sign vector is not a root, so the vertex vectors
  can be a base.
- The two-arrow Kronecker vector (1,1) is nonzero with q=0, so positive definiteness fails.
  The empty quiver is excluded from the irreducible root-system bridge, although its
  representation category has zero indecomposable classes.

*Needs:* the pinned Tits and polar forms and `TauCeti.finite_setOf_nonneg_titsForm_eq_one`;
Mathlib `RootPairing.mk'`, root-pairing bases and their Cartan matrices; `TauCeti.posRoots` for the
comparison with §5.1. The vertex marking and q-value identification are proved here. Unrestricted
root lowering is not used as sink-admissible lowering.

### Examples

The loop quiver is the category of vector spaces with an endomorphism. Over any field its
finite-dimensional indecomposables are k[X]/(fⁿ), for monic irreducible f and n≥1, by the
primary cyclic decomposition over the PID k[X] (`Module.equiv_directSum_of_isTorsion`). Over an algebraically closed field this becomes
k[X]/((X−λ)ⁿ) (Etingof v5 Example 1.19(2), p.9, for the split case).
Over ℝ, f=X²+1 gives a two-dimensional simple; over ℂ the factors are linear. For n=0 the
quotient is zero and is not indecomposable. The modules k[X]/(Xⁿ), n≥1, already give infinitely
many distinct dimensions over every field. Two-arrow Kronecker also has infinitely many
indecomposables: dimensions (n,n+1) and (n+1,n) have q=1, for unbounded n; its (1,1) family
has |ℙ¹(𝔽₂)|=3 over 𝔽₂, so that finite family alone does not establish infinite type there.

### Dependencies

Layer 4 and native Gabriel; Mathlib root pairings and the pinned positive roots for the marked
bridge.

## Layer 6: Auslander–Reiten theory

Other roadmaps cite this layer by sublayer labels; each maps to a section as follows.

- 6A, the radical and irreducible morphisms → §6.4; the irreducible space is the pinned
  `TauCeti.irreducibleMorphismSpace`.
- 6B, minimal projective and injective presentations → the pinned
  `TauCeti.IsMinimalProjectivePresentation` and `TauCeti.IsMinimalInjectiveCopresentation`,
  consumed in §3.1; their exchange under k-duality has the owner named under Scope and ownership.
- 6C, the transpose and the stable equivalence → §6.1 for the transpose, which is the pinned
  `TauCeti.AuslanderReitenTranspose`; the stable equivalence has the owner named under Scope and
  ownership.
- 6D, the translate D Tr and Auslander–Reiten duality → §§6.1–6.2.
- 6E, existence and uniqueness of almost-split sequences → §6.3.
- 6F, the Auslander–Reiten quiver → §6.4.
- `arQuiver k A` → the pinned `TauCeti.IrreducibleMorphismQuiver` with `ModuleCat.arTranslation`.

### 6.1 The translate and the injective stable category

Work in finite-dimensional left A-modules for a finite-dimensional algebra A over k; the category
is `FGModuleCat A`. For a finite minimal projective presentation P₁→P₀→M, the native transpose
`TauCeti.AuslanderReitenTranspose` and its k-dual D Tr M give the pinned translate
`ModuleCat.arTranslate`: independent of the presentation up to isomorphism, zero and injective
exactly on projectives, and a bijection from nonprojective onto noninjective indecomposable
classes (ASS IV.2.10–2.11, p.116); on representations this object is `TauCeti.arTranslate`.

The pinned duality of §6.2 is stated in the injective stable category of all A-modules,
`TauCeti.ExactStructure.InjectiveStableCategory` for the abelian exact structure
`TauCeti.ExactStructure.abelian`, whose Hom is the quotient by maps factoring through an arbitrary
injective A-module. Its finite-dimensional form is consumed, not proved. For finite-dimensional M,
take a finite-dimensional injective envelope i : M → I
(`TauCeti.exists_isInjectiveEnvelope_of_finite`); i is a monomorphism into an injective, hence an
inflation into a relative injective of the abelian exact structure. Then, for every A-module N,
`TauCeti.ExactStructure.homCokernelEquivInjectiveStableHom` identifies k-linearly the quotient
`TauCeti.HomCokernel` of Homₐ(M,N) by the maps extending across i with the stable Hom from M to N.
By `TauCeti.ExactStructure.factorsThrough_injective_iff_exists_extension` those maps are exactly
the maps through some injective, hence exactly the maps through finite-dimensional injectives, and
by `TauCeti.ExactStructure.isZero_injectiveStableFunctor_obj_iff` a module becomes zero there
exactly when it is injective (ASS IV.2, construction preceding Proposition 2.2, pp.109–110).

**Checks.**

- For A=k both the subspace of maps extending across the envelope and Hom(k,k) have dimension
  1; the stable Hom has dimension 0.
- For the dual-number simple the subspace of maps extending across the envelope has dimension
  0, Hom has dimension 1, and its identity survives in the one-dimensional stable Hom: the envelope is A, and every map
  k→A→k is zero because the first image is kε and the second kills ε.
- For A₂, S₁ is injective and its identity dies, while S₂ is not injective and its identity
  survives, since Hom(P₁,S₂)=0 for its envelope P₁≅I₂. Quotienting by maps through projectives
  instead reverses these two tests.
- For A₂, τS₁=S₂, while τP₁=τS₂=0: the translate kills exactly the projectives P₁ and P₂=S₂.
- For the dual numbers, the presentation A→A→k uses multiplication by ε, and its transpose
  cokernel and dual both have dimension 1: τk≅k.
- For A=k every module is projective and injective; the presentation 0→M→M gives transpose
  zero and dual transpose zero.

*Needs:* Layer 2; the pinned injective envelopes (§3.1); native minimal presentations, transpose,
dual transpose, the module-level translate, and the pinned injective stable category with its
Hom-cokernel description. No acyclicity or algebraic closedness is used.

### 6.2 AR duality

Auslander–Reiten duality is consumed. For finite-dimensional M,N and a finite minimal projective
presentation f : P₁ → P₀ of M, the pinned `LinearMap.auslanderReitenExtEquiv` identifies maps
N → D Tr f in the injective stable category k-linearly with D Ext¹ₐ(coker f, N), and coker f ≅ M.
It is natural in N (`LinearMap.auslanderReitenExtEquiv_naturality`) and in the presentation
(`LinearMap.auslanderReitenExtEquiv_presentation_naturality`), over any field and without
minimality. ASS Theorem IV.2.13, pp.117–119, states the natural isomorphism over an algebraically
closed field; ARS IV.4.6, p.131 (from IV.4.1, p.129), gives over any Artin algebra only the
equality of lengths; over an arbitrary field the natural isomorphism is the pinned declaration.
By §6.1 its stable Hom is the quotient of Homₐ(N, D Tr M) by maps through finite-dimensional
injectives.

**Checks.**

- For A₂, M=S₁,N=S₂ gives Ext¹ dimension 1 and costable Hom(S₂,τS₁) dimension 1.
- For the same M and N=S₁, Ext¹ is zero and Hom(S₁,S₂) is zero. For projective M both sides vanish.
- For dual numbers with M=N=k, both sides have dimension 1; no map k→A→k represents the
  surviving identity, since each such composite is zero. The zero module gives dimension 0 on both sides.

*Needs:* the pinned Hom-cokernel description of stable Hom read in §6.1; the pinned duality and
its naturality; finite-dimensional k-duality. These are independent of almost-split existence.

### 6.3 Almost-split existence and endpoint uniqueness

Almost-split existence is consumed. Over a finite-dimensional algebra and any field, a finitely
generated module ends an almost-split sequence exactly when it is indecomposable and
nonprojective, and then one exists with left end the translate `ModuleCat.arTranslate` and
finitely generated middle term (`ModuleCat.exists_isAlmostSplit_arTranslate`,
`ModuleCat.exists_isAlmostSplit_X₃_eq_iff`). Dually, a finitely generated module begins one exactly
when it is indecomposable and noninjective (`ModuleCat.exists_isAlmostSplit_of_not_injective`,
`ModuleCat.exists_isAlmostSplit_X₁_eq_iff`) (ASS Theorem IV.3.1, pp.120–121; ARS V.1.14–1.15).
Any almost-split sequence ending at M whose left end has local endomorphism ring, for instance a
finitely generated one, has left end isomorphic to D Tr of each finite minimal projective
presentation of M: compare it with the pinned sequence by
`CategoryTheory.ShortComplex.IsAlmostSplit.nonempty_iso_X₁` and use `ModuleCat.nonempty_iso_arTranslate`.

Use short exactness plus left and right factorization properties. A split sequence is excluded;
no separate empty predicate specifies non-splitting. Given almost-split S,T and any endpoint
isomorphism e:S.X₃≅T.X₃, uniqueness produces an isomorphism F:S≅T with F.hom.τ₃=e.hom.
It asserts existence of such a comparison, not uniqueness of F. The commuting squares are part
of the statement (ASS IV.1.11–1.13, pp.104–106, and native endpoint uniqueness).

**Checks.**

- A₂ has 0→S₂→P₁→S₁→0, with τS₁=S₂; projective S₂ ends no almost-split sequence.
- The dual numbers have 0→k→A→k→0 with first map 1↦ε and second map reduction modulo ε.
  The maps compose to zero, their image/kernel is kε, and the dimensions are 1,2,1.
- Rescale an inclusion f by a≠0. The comparison to the rescaled sequence with components
  (a⁻¹,1,1) fixes the right endpoint and satisfies (af)a⁻¹=f and g·1=1·g.
- The split sequence with the same end dimensions fails the almost-split condition: the
  projection is a split epimorphism. The zero module is not an indecomposable endpoint.

*Needs:* the pinned existence and translate theorems, finite-length locality and native
almost-split uniqueness.

### 6.4 Irreducible arrows and the AR quiver

The AR quiver is consumed. It is `TauCeti.IrreducibleMorphismQuiver` for finitely generated
A-modules: its vertices are the isomorphism classes of finitely generated indecomposables, and
its arrows M → N index a k-basis of Irr(M,N)=rad(M,N)/rad²(M,N) between chosen representatives,
so the arrow count is dimₖ Irr(M,N) (`TauCeti.IrreducibleMorphismQuiver.card_arrows`). Its partial
translation `ModuleCat.arTranslation` is τ on nonprojective vertices, a bijection onto the
noninjective ones; for a representation-finite algebra its total arrow set is finite; and the
mesh relation `ModuleCat.card_arrows_eq_card_arrows_of_translate_eq_some` equates the numbers of
arrows X → M and τM → X over any field (ASS IV.4.1–4.4, pp.125–128).

**Checks.**

- A₁ has one vertex and no arrows: its endomorphism radical is zero.
- A₂ has exactly S₂→P₁→S₁, τS₁=S₂. The two mesh arrow spaces have dimension 1, whereas
  Irr(S₂,S₁)=0. An empty-arrow quiver cannot meet the specification.
- The dual numbers have vertices k,A and arrows k→A→k. Multiplication by ε on A factors
  through k and is in rad², so it does not create an extra irreducible loop at A.

*Needs:* §6.3, Layer 2, the pinned quiver of irreducible morphisms with its translation and mesh
relation, the native radical-square quotient and finite-dimensional Hom spaces.

### Examples

The A₂ and dual-number meshes distinguish an unbound hereditary algebra from a bound
nonhereditary one. Both belong to the same finite-dimensional-algebra AR theorem.

### Dependencies

Layer 3 and finite-length decomposition; §6.1 reads the pinned stable Hom through the envelopes
consumed in §3.1, and §6.2 uses that reading; §6.4 reads its arrows from the sequences of §6.3.
The layer consumes pinned declarations and fixes their quiver examples. Layer 5 is needed only
when ADE classification is used to enumerate a particular AR quiver.

## Downstream consumers

QuiverRepresentationsPartII §§1.1–1.6 uses Layers 1, 2 and 5 for the finite-window type-A
adapter and interval classification. GrothendieckEulerForms, Conventions and Layers 3–5,
uses the projective/simple and Euler comparisons: its columns index projectives, so its
Cartan matrix is Cᵀ in our notation, and its corresponding Euler matrix is the inverse transpose.
This is a consumer comparison, not a dependency in the reverse direction. McKaySkewGroup,
“Exact supplier contracts”, uses primitive idempotents and Morita equivalence from Layer 3.
ArtinAlgebras, Scope and ownership, reads Layer 6 as the field case R = k of its Auslander–Reiten
theory for Artin algebras, whose general constructions replace the field ones; it is a consumer
and not a supplier here.

## References

- **ASS:** I. Assem, D. Simson, A. Skowroński, *Elements of the Representation Theory of
  Associative Algebras, Volume 1*, Cambridge, 2006. Exact locators are attached to each target;
  right-module formulas are adapted explicitly to left modules.
  [Institutional teaching copy](https://homepage.mi-ras.ru/~avfonarev/2023/fda/Assem%2C%20Simson%2C%20Skowronski%20-%20Elements%20of%20the%20representation%20theory%20of%20associative%20algebras.pdf).
- **ARS:** M. Auslander, I. Reiten, S. O. Smalø, *Representation Theory of Artin Algebras*,
  Cambridge Studies in Advanced Mathematics 36, Cambridge, 1995. Cited for the arbitrary-field
  (Artin algebra) forms II.2.6, II.4.1 and V.1.14–1.15, and for the Auslander–Reiten formula as an
  equality of lengths, IV.4.1 and IV.4.6.
  [Institutional teaching copy](https://homepage.mi-ras.ru/~avfonarev/2023/fda/Auslander,%20Reiten,%20Smalo%20-%20Representation%20Theory%20of%20Artin%20Algebras.pdf).
- **BGP:** I. N. Bernstein, I. M. Gelfand, V. A. Ponomarev, *Coxeter functors and Gabriel's
  theorem*, Russian Mathematical Surveys 28:2 (1973), 17–32. Theorem 1.1, Lemma 2.3 and
  Theorem 3.1. [Author-hosted English translation](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/BGG-CoxeterF-Usp.pdf).
- **Etingof v5:** P. Etingof et al., *Introduction to Representation Theory*,
  [arXiv:0901.0827v5](https://arxiv.org/abs/0901.0827v5), 2011, Example 1.19 and §§5.4–5.6.
  Numbers refer to this preprint version, not to a different published edition.
