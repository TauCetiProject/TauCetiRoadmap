# Roadmap: Nash blowups

**Summary.** For a reduced scheme `X` of finite type over a field `k`, pure of dimension `d` and
with dense smooth locus, the Nash blowup `ν : X* → X` replaces every point by the limits of the
tangent spaces at nearby smooth points. This roadmap constructs it intrinsically, as the reduced
closure of the smooth locus in the Grassmannian of locally free rank-`d` quotients of the sheaf of
differentials `Ω_{X/k}`, together with its universal rank-`d` quotient `ν*Ω_{X/k} → L` (the Nash
cotangent bundle), and builds the normalised Nash blowup `ν̄ : X̄* → X` and both iterations. It
proves the universal property, properness and the modification property, locality, compatibility
with field extensions, the description by the Gauss map of an embedded variety, and Nobile's theorem
that the Nash blowup is locally the blowup of an ideal (with the Jacobian ideal for a hypersurface).
The headline theorems are the intrinsic triviality criterion (`ν` is an isomorphism iff `Ω_{X/k}`
has a locally free quotient of rank `d`), Nobile's theorem in characteristic zero (`ν` is an
isomorphism iff `X` is smooth), the theorem of Duarte and Núñez-Betancourt for normal `X` over a
perfect field of characteristic `p`, the corresponding criteria for `ν̄`, and the principle by which
a singular `X` reappearing as an open subscheme of an iterate is never resolved — the form in which
the theorem of Castillo, Duarte, Leyton-Álvarez and Liendo (iterated Nash blowups fail to resolve
singularities in dimension at least four) is applied. The two smoothness criteria are proved through
their differential forms, which do not mention the Nash blowup: a reduced `X`, locally of finite type
and pure of dimension `d` over a field of characteristic zero, is smooth iff `Ω_{X/k}` admits a
locally free quotient of rank `d` (`HasLocallyFreeQuotientOfDifferentials`,
`smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero`, §4.4), and the same holds for a normal
`X` over a perfect field of characteristic `p`
(`smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme`, §5.4).

## Scope and ownership

**This roadmap owns** the Nash modification of a quasi-coherent sheaf of finite type along a dense
open on which it is locally free (§1.2; nashModificationNotes2024, Section 3), its
universal property and its Plücker form; the Nash blowup of a `k`-scheme, its Nash cotangent bundle,
its iterates and the predicate that the iteration resolves `X`; the normalised Nash blowup, its
iterates and the corresponding predicate; the Gauss-map description, the blowup description and the
hypersurface case; the predicate that `Ω_{X/k}` admits a locally free quotient of rank `d` (§0.7);
the smoothness criteria (Layers 4 and 5) together with the commutative algebra
they need and that no other roadmap plans in this generality: the Lie derivative on the Kähler
differentials of an arbitrary algebra over a field, in every characteristic, stability of
annihilators, the stability of the minimal primes over a derivation-stable ideal, coordinates from a free
quotient of the differentials, the `p`-monomial operators and the freeness of the Frobenius pushforward of a
normal local ring; and the interface statements of Layer 0 on Tau Ceti's sheaf of relative
differentials (the comparison map, base change, closed immersions, the rank on the smooth locus),
on Grassmannians along a surjection, on smoothness at closed points and on the normality of the base
change of a normal scheme along a separable extension of the ground field, with what it rests on: the normality of
the tensor product of a separable extension of the ground field with a normal algebra and of directed colimits of
normal rings, and the geometric normality of separable extensions that follows (§0.6, which no other roadmap states
and which §6.3 needs).

**Supplied elsewhere and cited.** The Grassmannian of locally free rank-`r` quotients of a
quasi-coherent sheaf of finite type on an arbitrary base scheme (over an affine base and for the sheaf of a
module, the pinned Tau Ceti has the scheme, listed below), its universal quotient, classifying maps, base
change, properness over an affine base and the Plücker closed immersion are
AlgebraicModuliForArithmeticGeometry §1.3 (`coherentGrassmannian`, `plucker`); that section builds `Gr_r(E)`
locally as a closed subscheme of the Grassmannian of a free sheaf mapping onto `E`, and §0.4 differs in stating
the closed immersion `Gr_r(E) → Gr_r(E')` for an arbitrary surjection `E' → E` of quasi-coherent sheaves of finite
type, globally. The normalisation of a reduced scheme (as the scheme case of the
normalisation of a locally Noetherian Deligne–Mumford stack), its universal property, its finiteness
over a Nagata base and the flat base change of scheme-theoretic images are
AlgebraicModuliForArithmeticGeometry §5.4. Descent of smoothness along field extensions is
SchemeAndStackFoundations §0.11, the chosen witness of a modification (`IsModification.Witness`) §4.11 and
`regularLocus_eq_smoothLocus` over a perfect field §4.13. Dimension theory of schemes locally of finite type
over a field, the depth criterion for bijectivity of a linear map, the criterion for universal
homeomorphisms, normal schemes and their codimension-one stalks, modifications, the normality of regular
schemes and Serre's normality criterion are in the pinned Tau Ceti (Exact supplier contracts, From Tau
Ceti); SchemeAndStackFoundations §§0.7, 0.17, 0.23, 0.30, 4.11 and 4.13 record them, and this roadmap cites
those sections for them. The converse of Kunz's theorem (`isRegular_of_frobenius_flat`) is
EnhancedDerivedSheaves §E1.6. The derivative ideal of a polynomial ideal is ResolutionOfSingularitiesCharacteristicZero
§2.15; the Jacobian ideal of a hypersurface in §3.3 is the image of the derivative ideal of `(f)` and is not defined
again. ResolutionOfSingularitiesCharacteristicZero §7.8 proves, over a field of characteristic zero, that a scheme of
finite type is generically reduced iff its smooth locus is dense; §1.1 differs in concerning reduced schemes over an
arbitrary field, where density of the smooth locus is geometric reducedness. The
theory of `p`-bases of fields (a family is a `p`-basis exactly when its differentials form a basis of `Ω¹`) is
DerivedDeRhamCohomology §0.23. The Lie derivative on the one-forms of a field over a subfield of
characteristic zero is DiophantineApproximationAndTranscendence §5.6 (`lieDerivativeOneForm`, the unique
operator of `exists_lieDerivativeOneForm`); §4.2 differs in constructing it for an arbitrary `k`-algebra in
every characteristic, through `J/J²`, because §4.4 applies it to local rings, and it agrees with that
operator on fields of characteristic zero. The comparison and base-change maps of §§0.1–0.2 concern
schemes; AdicSpacesPartIII §R3.6 states the analogous exact sequences and base change for the continuous
differentials of adic spaces, another object, and its `AlgebraicGeometry.RelativeDifferentialData` (the
differentials of a morphism of schemes over a base that need not be affine) comes with its affine identification
only, without comparison or base-change maps. The sheaf `Ω_{X/R}` of a scheme over a ring, its universal
derivation, the pushforward of a derivation, quasi-coherence, finite presentation, its form on an affine scheme,
restriction to open subschemes, its stalks as the Kähler
differentials of the local rings, finite local freeness and rank on smooth schemes, the finite locally free
sheaves of constant rank, pure dimension, the blowup of a scheme along an ideal sheaf with its universal
property, exterior powers of sheaves of modules, the reduced-source factorisation through a
vanishing ideal, the reducedness of the scheme-theoretic image of a quasi-compact morphism from a reduced
scheme, the geometric reducedness of smooth morphisms (used in §1.1), Fitting ideals of finite modules and
their value on the differentials of a hypersurface (used in §3.3), the recognition criterion for a relative
normalisation and the bijectivity of the conormal map `I/I² → S ⊗_P Ω_{P/R}` of a surjection `P → S` onto a
formally étale algebra (hence the identification of the cotangent space `m/m²` of a local `k`-algebra, Noetherian or not, whose residue
field `κ` is separable algebraic over `k` with `κ ⊗_R Ω_{R/k}`, used in §§4.1 and 4.4), the finiteness of the
`p`-th power map of an algebra of finite type over a perfect ring (used in §5.3), the integral closedness of
polynomial rings over integrally closed domains and the ascent of integrally closed local domains along étale maps
(used in §0.6), and the Grassmannian scheme of
rank-`r` quotients of a module over an affine base, with its points on affine schemes, separatedness and
properness for a finite module, are in the pinned Tau Ceti; the smooth locus, relative normalisation,
scheme-theoretic images, the module Grassmannian functor, pullback of sheaves of modules, étale algebras over a field,
Kähler differentials of algebras and separability of field extensions that need not be algebraic are in
the pinned Mathlib.

**Not in this roadmap.** The combinatorial description of Nash blowups of toric varieties by
logarithmic Jacobian ideals and the existence of the normal toric varieties of dimension `d ≥ 4` that
reappear in their own (second) normalised Nash blowup belong to a toric roadmap that consumes Layers 2,
3, 6 and 7; Nash blowups of higher order (the Grassmannian of quotients of the sheaves of principal
parts) and the surface theory of normalised Nash transformations (Hironaka, hironaka1983, Section 1;
Spivakovsky, spivakovsky1990, Introduction) are a Part II built on Layers 1, 2 and 6; the comparison of the
Nash blowup with the blowup of the Fitting ideal `Fitt_d(Ω_{X/k})` beyond the hypersurface case of §3.3 (where
`Fitt_d(Ω_{X/k}) = J_f`), which is an isomorphism only when the pulled-back differentials have projective
dimension at most one, belongs to that Part II. Nash blowups over a base other than a field lie outside
this roadmap.

## Conventions

- `k` is a field and `X` a `k`-scheme, `X → Spec k` locally of finite type, in one universe. The
  **standing hypotheses** (the *Setting*) are: `X` reduced, `X → Spec k` separated and of finite type,
  `X` pure of dimension `d` (Tau Ceti's `TauCeti.IsPureDimensional d`), and the smooth locus `X_sm`
  (Mathlib's `Scheme.Hom.smoothLocus` of `X → Spec k`) dense in `X`. Theorem §1.1 shows the last
  condition is geometric reducedness, and that over a perfect field it follows from reducedness.
- `Ω_{X/k}` is Tau Ceti's `AlgebraicGeometry.Scheme.relativeDifferentials` of `X` over `Spec k`.
- **Grassmannians parametrise quotients.** `Gr_r(F) → X` represents locally free rank-`r` quotients
  `h*F → Q` modulo isomorphism of the target, as in Mathlib's `Module.Grassmannian` and
  AlgebraicModuliForArithmeticGeometry §1.3 (the Grassmannian of locally free quotients of ega1, §9.7).
  A `d`-dimensional tangent space `T_x ⊆ kⁿ` of an embedded variety is the quotient
  `(kⁿ)* = ⊕ k·dx_i → Ω_{X/k} ⊗ κ(x)`, not the subspace `T_x` and not the conormal subspace.
  Witness: for the line `y = 2x` in `𝔸²`, the tangent line spanned by
  `(1, 2)` is the quotient with `dx ↦ 1`, `dy ↦ 2`, homogeneous coordinates `[1 : 2]` on `Gr_1(k²) = ℙ¹`;
  the conormal convention would give `[2 : −1]`.
- **Smooth locus of dimension `d`.** `X_sm^{(d)} ⊆ X_sm` is the open subscheme of smooth points at which
  `Ω_{X/k}` has rank `d` (§0.3); it equals `X_sm` when `X` is pure of dimension `d`. Using it makes the
  Nash blowup a total construction, so that the iterates are defined without carrying proofs.
- **Reduced closures** are Mathlib's scheme-theoretic image `Scheme.Hom.image` of a quasi-compact morphism
  from a reduced scheme; it is reduced (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`) with support
  the closure of the image (Mathlib's `Scheme.Hom.support_ker`).
- **Open subschemes isomorphic to `X`** means isomorphic over `k`.
- "Smooth" means smooth over `k`; "singular" means not smooth over `k`; "regular" refers to local rings.
- A field extension `k'/k` is **separable** when every finitely generated subextension has a separating
  transcendence basis (stacksAlgebra, Definition 10.42.1, tag 030O, line 4671; Mathlib's
  `Algebra.IsTranscendentalSeparable`). It need not be algebraic: `ℚ(u)/ℚ` is separable. For an algebraic
  extension it is Mathlib's `Algebra.IsSeparable`, and every extension of a perfect field is separable.
- **Ground fields of the sources.** The sources on Nash blowups work over an algebraically closed field or over
  `ℂ`: nobile1975 (line 29), gonzalezSprinberg1982 (line 78, with algebraically closed fields of
  characteristic zero in the footnote, line 82), nashModificationNotes2024 (lines 143, 153, 232, 445, 505),
  duarteNunezBetancourt2020 (line 103) and castilloDuarteLeytonLiendo2026 (lines 13–14 and 58). Their
  statements are cited at that generality. The targets here are over an arbitrary field `k`. A route that
  takes a step from one of those proofs uses no algebraic closedness; every property of `k` that a route
  uses (characteristic zero, perfectness, separability of a residue field or of an extension) is a
  hypothesis of the target.
- A **locally free quotient of rank `d`** of `Ω_{X/k}` is an epimorphism of `O_X`-modules `Ω_{X/k} → E`
  onto a finite locally free `E` of constant rank `d` (Tau Ceti's
  `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.FixedRank X d`), taken up to isomorphism of `E`
  (§0.7, `HasLocallyFreeQuotientOfDifferentials`).
- Names in italics are suggested declaration names for targets of this roadmap that `Suggested.lean`
  does not state; names in code are declarations of the pinned libraries, of other roadmaps, or of
  `Suggested.lean`.

## Exact supplier contracts

### From Mathlib

- `AlgebraicGeometry.Scheme.Hom.smoothLocus` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`), with
  `Scheme.Hom.isOpen_smoothLocus`, `Scheme.Hom.smoothLocus_eq_top_iff`,
  `Scheme.Hom.preimage_smoothLocus_eq` and `Scheme.Hom.dense_smoothLocus_of_perfectField` (a reduced
  scheme locally of finite presentation over a perfect field has dense smooth locus). The smooth locus
  is the set of points whose stalk map is formally smooth; it says nothing about relative dimension.
- `AlgebraicGeometry.GeometricallyReduced` (`Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean`):
  every base change to a field is reduced.
- `AlgebraicGeometry.Scheme.Hom.image`, `Scheme.Hom.imageι`, `Scheme.Hom.toImage`
  (`Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean`), `Scheme.Hom.ker` and `Scheme.Hom.support_ker`
  (the support of the kernel of a quasi-compact morphism is the closure of its image;
  `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`); `IsClosedImmersion.lift` and
  `isIso_of_isClosedImmersion_of_surjective` (a surjective closed immersion into a reduced scheme is an
  isomorphism; `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean`);
  `ext_of_isDominant_of_isSeparated` (morphisms from a reduced scheme into a separated one agreeing
  after a dominant map are equal) and `IsClosedImmersion.comp_iff` (for a closed immersion `g`, the
  composite `f ≫ g` is a closed immersion iff `f` is), both in
  `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean`.
- `AlgebraicGeometry.Scheme.Hom.normalization` and `Scheme.Hom.normalizationPullback` with its
  instance that the comparison is an isomorphism along a smooth base change, and
  `Scheme.Hom.normalizationDesc` (for a quasi-compact quasi-separated `f : X → Y` factored as `f = f₁ ≫ f₂`
  with `f₂ : T → Y` integral, the morphism `f.normalization → T` over `Y` from the normalisation of `Y` in `X`)
  (`Mathlib/AlgebraicGeometry/Normalization.lean`).
- `Algebra.IsTranscendentalSeparable` (`Mathlib/FieldTheory/TranscendentalSeparable.lean`): every
  finitely generated subextension has a separating transcendence basis (Stacks' separable extensions,
  not necessarily algebraic), with the instances from `Algebra.IsSeparable` and from `PerfectField`, and
  `Algebra.isSeparable_iff_isTranscendentalSeparable_and_isAlgebraic`; its defining condition is
  `Algebra.IsSeparablyGenerated` (same file: a transcendence basis over which the extension is separable algebraic)
  for every finitely generated subextension.
- For §0.6: `Algebra.Etale.iff_exists_algEquiv_prod` (an algebra over a field is étale iff it is a finite product of
  finite separable field extensions; `Mathlib/RingTheory/Etale/Field.lean`), the instance `Algebra.Etale.baseChange`
  (`Mathlib/RingTheory/Etale/Basic.lean`), `isIntegrallyClosed_of_isLocalization` (a localisation of an integrally
  closed domain at a submonoid of nonzero elements is integrally closed;
  `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean`) and `IsLocalization.isDomain_of_le_nonZeroDivisors`
  (such a localisation of a domain is a domain; `Mathlib/RingTheory/Localization/Defs.lean`).
- `AlgebraicGeometry.Scheme.Modules.pullback` and `Scheme.Modules.pullbackPushforwardAdjunction`
  (`Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): the pullback of sheaves of modules along a morphism of schemes,
  left adjoint to the pushforward. Used in §0.1.
- `LocallyOfFiniteType.jacobsonSpace` (`Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean`) and
  `nonempty_inter_closedPoints` (`Mathlib/Topology/JacobsonSpace.lean`): a nonempty locally closed
  subset of a Jacobson space contains a closed point.
- `AlgebraicGeometry.tfae_universallyInjective`
  (`Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean`): injective with purely inseparable
  residue field extensions is universally injective.
- `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`, quotient convention).
- `KaehlerDifferential.tensorKaehlerEquiv` (`Mathlib/RingTheory/Kaehler/TensorProduct.lean`),
  `KaehlerDifferential.mapBaseChange_surjective` and `KaehlerDifferential.kerCotangentToTensor` (the map
  `I/I² → B ⊗_A Ω[A⁄R]`, `a ↦ 1 ⊗ da`, for `I` the kernel of `A → B`; `Mathlib/RingTheory/Kaehler/Basic.lean`),
  `IsLocalRing.ker_residue` (the kernel of the residue map is the maximal ideal;
  `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean`), `Derivation`, `Algebra.FormallyEtale` with
  `Algebra.FormallyEtale.of_isSeparable` (a separable algebraic extension of fields is formally étale;
  `Mathlib/RingTheory/Etale/Field.lean`), `IsRegularLocalRing`, `IsRegularRing`
  (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`), `frobenius`, `IsIntegrallyClosed`,
  `IsDiscreteValuationRing`, `PerfectField`, `PerfectClosure`, `IsPurelyInseparable`.

### From Tau Ceti

- `AlgebraicGeometry.Scheme.relativeDifferentials` with `Scheme.relativeDifferentialsHomEquiv`
  (`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`): for `X` over `Spec R`, the
  sheafification of `U ↦ Ω[Γ(X, U)⁄R]` with its universal property among `R`-derivations.
  `TauCeti.AlgebraicGeometry.isQuasicoherent_relativeDifferentials` and
  `isFinitePresentation_relativeDifferentials` (`…/Differentials/Quasicoherent.lean`);
  `TauCeti.AlgebraicGeometry.relativeDifferentialsRestrictIso` (restriction along an open immersion over
  `Spec R`) and `TauCeti.AlgebraicGeometry.pushforwardDerivation` (for `f : X → Y` over `Spec R`, an `R`-derivation of
  `O_X` into `M` gives the `R`-derivation `h ↦ d(f*h)` of `O_Y` into `f_*M`), both in `…/Differentials/Restriction.lean`;
  `TauCeti.AlgebraicGeometry.relativeDifferentialsSpecIso` (`…/Differentials/Spec.lean`: for an `R`-algebra `A`,
  `Ω_{Spec A/R}` is the quasi-coherent sheaf of `Ω[A⁄R]`, with `da ↦ D a`);
  `TauCeti.AlgebraicGeometry.isFiniteLocallyFree_relativeDifferentials`
  (smooth over `Spec R`; `…/Differentials/LocallyFree.lean`);
  `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply` (rank `n` on a
  scheme smooth of relative dimension `n`; `…/Differentials/Rank.lean`). The base is the affine scheme
  `Spec R`; nothing is assumed about a general base.
- `AlgebraicGeometry.Scheme.relativeDifferentialsStalkEquiv` (`…/Differentials/Stalk.lean`): for `X` over
  `Spec R` and `x ∈ X`, the `O_{X,x}`-linear equivalence between the stalk of `Ω_{X/R}` at `x` and Mathlib's
  `Ω[O_{X,x}⁄R]`, sending the germ of `dh` to the differential of the germ of `h`; the `R`-algebra structure
  of the stalk is the instance `AlgebraicGeometry.Scheme.stalkBaseAlgebra`
  (`TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean`). No finiteness is assumed. Used in §§0.7, 4.4 and 5.4
  to pass from a quotient of the sheaf to a quotient of the Kähler differentials of a local ring.
- `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.FixedRank X r`
  (`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean`): the full subcategory of
  `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf X` (the `O_X`-modules that are locally free and of finite
  presentation, `Scheme.Modules.isFiniteLocallyFree`, `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean`)
  whose rank `FiniteLocallyFreeSheaf.rank` (`…/VectorBundle/Rank.lean`) is `r` at every point. On the empty
  scheme every finite locally free sheaf, the zero sheaf included, has constant rank `r` for every `r`. The
  carrier of the quotient in §0.7.
- `TauCeti.AlgebraicGeometry.smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`
  (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/RelativeDimension.lean`): over a field, smooth of relative
  dimension `n` iff smooth with `n`-dimensional local rings at closed points.
- The instance `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`
  (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean`): a smooth morphism of schemes is
  geometrically reduced in the sense of Mathlib's `GeometricallyReduced` (every base change to a field is reduced).
  Used in §1.1.
- The instance `AlgebraicGeometry.Scheme.Hom.isReduced_image`
  (`TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean`): the scheme-theoretic image of a quasi-compact
  morphism from a reduced scheme is reduced; Mathlib at the pin states no such instance. Used in the Conventions
  and §1.2.
- `TauCeti.fittingIdeal` (`TauCeti/RingTheory/FittingIdeal/Basic.lean`; for a finite `R`-module presented as a
  quotient of `Rⁿ`, the `j`-th Fitting ideal is generated by the `(n − j)`-minors of the relations, independently of
  the presentation) and `TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton`
  (`TauCeti/RingTheory/Kaehler/Hypersurface.lean`): for a `K`-algebra `P` with `Ω[P⁄K]` free on a finite nonempty
  basis indexed by `ι`, `f ∈ P` and `Ω[(P/(f))⁄K]` finite over `P/(f)`, the Fitting ideal of index `|ι| − 1` of
  `Ω[(P/(f))⁄K]` is the image in `P/(f)` of the ideal generated by the coordinates of `df`. Used in §3.3.
- `AlgebraicGeometry.Scheme.Hom.smooth_smoothLocus_ι_comp` and
  `Scheme.Hom.preimage_smoothLocus_le_smoothLocus_pullback_snd`
  (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/Locus.lean`): the smooth locus is smooth and its preimage
  under a base change lies in the smooth locus of the base change (an inclusion, not an equality).
- Local dimension over a field (recorded in SchemeAndStackFoundations §0.7), in
  `TauCeti/AlgebraicGeometry/Scheme/LocalDimension.lean`, for `X` locally of finite type over a field `k`:
  `TauCeti.AlgebraicGeometry.topologicalKrullDimAt_eq_ringKrullDim_stalk_add_toNat_trdeg_residueField`
  (`dim_x X = dim O_{X,x} + trdeg_k κ(x)`), `topologicalKrullDimAt_eq_iSup_toNat_trdeg_residueField` (`dim_x X` is
  the supremum of `trdeg_k κ(ξ)` over the generic points `ξ` of the irreducible components through `x`) and
  `topologicalKrullDim_closure_singleton_eq_toNat_trdeg_residueField` (the closure of `x` has dimension
  `trdeg_k κ(x)`).
- `LinearMap.bijective_of_depth` (`TauCeti/RingTheory/Depth/Bijectivity.lean`; recorded in
  SchemeAndStackFoundations §0.17): over a Noetherian ring `R`, an `R`-linear map `M → N` of arbitrary modules is
  bijective if at every prime `p` its localisation is bijective or `depth M_p ≥ 2` and `p` is not an associated
  prime of `N`; no finiteness of `M` is assumed.
- `TauCeti.AlgebraicGeometry.isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective`
  (`TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean`; recorded in SchemeAndStackFoundations
  §0.23): a morphism of schemes is a universal homeomorphism iff it is integral, universally injective and
  surjective.
- `TauCeti.AlgebraicGeometry.IsNormalScheme` (every stalk an integrally closed domain), with
  `isNormalScheme_iff_forall_affineOpens` and `isNormalScheme_iff_openCover` (normality is local),
  `isNormalScheme_Spec_iff_forall_localization` (`Spec R` is normal iff every localisation of `R` at a prime is an
  integrally closed domain, that is, iff `R` is a normal ring; used in §0.6) and
  `IsNormalScheme.isDiscreteValuationRing_stalk`
  (on a locally Noetherian normal scheme the stalk at a point of coheight one is a discrete valuation ring)
  (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean`; recorded in SchemeAndStackFoundations §0.30), and the instance
  `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (`TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean`: regular
  schemes are normal; recorded in SchemeAndStackFoundations §§0.30, 4.13).
- For §0.6: the instance `TauCeti.MvPolynomial.isIntegrallyClosed` (`TauCeti/RingTheory/MvPolynomial/IntegrallyClosed.lean`:
  a polynomial ring in any set of variables over an integrally closed domain is integrally closed), and
  `TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_localization_under` and
  `isIntegrallyClosed_localization_atPrime_of_localization_under` (`TauCeti/RingTheory/Etale/Normal.lean`: for an
  étale `A → S` and a prime `q` of `S` over `p`, if `A_p` is an integrally closed domain then so is `S_q`; no
  Noetherian hypothesis).
- `TauCeti.AlgebraicGeometry.IsModification` (`TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean`;
  recorded in SchemeAndStackFoundations §4.11): `f` is proper and there is a dense open `U` of the target with
  `f⁻¹(U)` dense and `f` an isomorphism over `U`; no integrality is assumed.
- `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two`
  (`TauCeti/RingTheory/SerreCondition/Normal.lean`; recorded in SchemeAndStackFoundations §4.13): a Noetherian ring
  has every localisation at a prime an integrally closed domain iff it satisfies `(R_1)` and `(S_2)`.
- `TauCeti.IsPureDimensional` (`TauCeti/Topology/PureDimension.lean`; every irreducible component has
  the given Krull dimension; the empty space is pure of every dimension) and
  `TauCeti.AlgebraicGeometry.isPureDimensional_pullback_Spec_map_iff_of_field`
  (`TauCeti/AlgebraicGeometry/Scheme/KrullDimension.lean`).
- `AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal_le_ker_of_range_subset`
  (`TauCeti/AlgebraicGeometry/IdealSheaf/VanishingIdeal.lean`): a morphism from a reduced scheme with
  image in a closed set kills its vanishing ideal.
- `AlgebraicGeometry.Scheme.IdealSheafData.blowup`, `blowupToBase`, `blowupLift`, `blowup_hom_ext`,
  `isIso_blowupToBase_iff` (the blowup map is an isomorphism iff the ideal is effective Cartier) and
  `isProper_blowupToBase` (`TauCeti/AlgebraicGeometry/Blowup/`).
- `SheafOfModules.exteriorPower` (`TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean`).
- `AlgebraicGeometry.Scheme.Hom.isIso_normalizationDesc_iff`
  (`TauCeti/AlgebraicGeometry/Normalization/IsIso.lean`): `normalizationDesc` is an isomorphism iff over every
  affine open `U ⊆ Y` the sections of `T` over the preimage of `U` map injectively into those of `X` with image
  containing every element integral over `Γ(Y, U)`.
- `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`
  (`TauCeti/RingTheory/Kaehler/Conormal.lean`): for a surjection `P → S` of `R`-algebras with `S` formally étale
  over `R`, Mathlib's `KaehlerDifferential.kerCotangentToTensor` is bijective; no finiteness or Noetherian
  hypothesis. For a local `k`-algebra `(R, m, κ)` with `κ` separable algebraic over `k` it applies to `R → κ`,
  whose kernel is `m` (`IsLocalRing.ker_residue`), with `κ` formally étale over `k` by
  `Algebra.FormallyEtale.of_isSeparable`: the map `m/m² → κ ⊗_R Ω_{R/k}`, `a ↦ 1 ⊗ da`, is bijective, and the
  `κ`-linear equivalence used in §§4.1 and 4.4 is this map bundled with its bijectivity.
- `TauCeti.powRingHom` and `TauCeti.powRingHom_finite` (`TauCeti/Algebra/CharP/Frobenius/PowRingHom.lean`,
  `TauCeti/Algebra/CharP/Frobenius/Finite.lean`): for a prime `p` and a commutative semiring `A` with `p = 0` in
  `A`, the `p`-th power map `a ↦ a^p` as a ring endomorphism of `A`, equal to Mathlib's `frobenius` when `A` has
  exponential characteristic `p` (`TauCeti.powRingHom_eq_frobenius`); for a ring map `R → A` of finite type of
  commutative rings with `R` perfect of characteristic `p`, this map is finite, so `A` is a finite module over its
  subring of `p`-th powers. Nothing is assumed for `A` of infinite type over a perfect ring or for an imperfect
  `R`: the `p`-th power map of the field `𝔽_p(t_1, t_2, …)` of rational functions in infinitely many variables is
  not finite. Used in §5.3 for `A` the ring of an affine open of a scheme of finite type over a perfect field `k`.
- `Module.Grassmannian.scheme R M r` with `Module.Grassmannian.toSpec`
  (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`), `Module.Grassmannian.schemeHomEquiv`
  (`…/Grassmannian/Points.lean`) and the instances `Module.Grassmannian.isSeparated_toSpec` and
  `Module.Grassmannian.isProper_toSpec` (`…/Grassmannian/Proper.lean`): for a commutative ring `R` and an
  `R`-module `M` in the universe of `R`, the scheme over `Spec R` glued from the standard charts, whose morphisms
  `Spec A → Gr` over `Spec R`, for an `R`-algebra `A`, are the points of Mathlib's `G(r, A ⊗_R M; A)` (submodules
  with locally free rank-`r` quotient, the quotient convention), naturally in `A`; it is separated over `Spec R`
  for every `M` and proper for finite `M`. No sheaf on a non-affine base is assumed. Over an affine open
  `Spec A ⊆ X` with `F|_{Spec A}` the sheaf of the `A`-module `M`, AlgebraicModuliForArithmeticGeometry §1.3's
  `Gr_r(F|_{Spec A})` and `Module.Grassmannian.scheme A M r` have the same points on affine `A`-schemes (the
  affine-points bullet of that section and `schemeHomEquiv`).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

- §1.3 `coherentGrassmannian`: for a quasi-coherent `E` of finite type on any `S` and `r ≥ 0`, the scheme
  `Gr_r(E) → S` with universal locally free rank-`r` quotient, unique classifying maps, the base change
  identification `Gr_r(f*E) ≅ Gr_r(E) ×_S T` with its quotient, `Gr_1(E) ≅ P(E)`, and properness over
  `Spec R` for `E` the sheaf of a finite `R`-module. Properness over a general `S` follows because
  properness is local on the target. `plucker`: the closed immersion `Gr_r(E) → P(∧^r E)` over `S`,
  natural in the quotient, pulling `O(1)` back to `det Q`.
- §5.4 `ArithmeticModuli.DMNormalization.stack` and `ArithmeticModuli.DMNormalization.finite`: for a
  scheme `X` with locally finitely many irreducible components, the normalisation `X^ν → X` agrees with
  Mathlib's `Scheme.Hom.normalization` of the inclusion of the generic points; it is normal, integral,
  an isomorphism when `X` is normal, compatible with smooth base change (in particular open immersions),
  lifts uniquely the morphisms from normal schemes that map generic points of irreducible components to
  generic points of irreducible components, and is finite for `X` of finite type over a Nagata scheme
  (for instance `Spec k`). §5.4 `ArithmeticModuli.DMSchematicClosure.stack`: for scheme morphisms it is
  `Scheme.Hom.image`, and the image of a quasi-compact morphism commutes with flat base change.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.11 `field_extension_descent`: smoothness of `X → Spec k` descends from `X_{k'}`.
- §4.11 `IsModification.Witness`: for a modification `φ` (Tau Ceti's `IsModification`), a chosen dense open of
  the target over which `φ` is an isomorphism.
- §4.13 `regularLocus_eq_smoothLocus`: for `X` locally of finite type over a perfect field, the points with
  regular local ring are exactly the smooth locus.
- §§0.7, 0.17, 0.23, 0.30, §4.11 for modifications and §4.13 for the normality of regular schemes and Serre's
  criterion: these sections record pinned Tau Ceti declarations (local dimension over a field,
  `LinearMap.bijective_of_depth`, the universal-homeomorphism criterion, `IsNormalScheme`, `IsModification`,
  `IsRegular.isNormal`, Serre's criterion), stated under From Tau Ceti; this roadmap's citations of these
  sections denote those declarations.

### From TauCetiRoadmap.EnhancedDerivedSheaves

- §E1.6 `isRegular_of_frobenius_flat`: a Noetherian `𝔽_p`-algebra with flat absolute Frobenius is regular.

### From TauCetiRoadmap.DerivedDeRhamCohomology

- §0.23: for a field `K` of characteristic `p`, a family is a `p`-basis (its `p`-monomials with exponents
  `< p` form a `K^p`-basis) exactly when its differentials form a `K`-basis of `Ω¹_{K/𝔽_p}`. The forward
  half, for a finite family, is `DerivedDeRham.pBasis_kaehler_basis` (with the predicate
  `DerivedDeRham.IsPBasis`); the converse half, from a basis of differentials to a `p`-basis, is stated in
  the prose of §0.23 and is the half §5.2 uses.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

- §2.15, derivative ideals: for an ideal `I` of a polynomial ring, `I` plus the ideal generated by the first partial
  derivatives of its elements. §3.3 uses it only to name the Jacobian ideal `J_f` of a hypersurface as the image in
  `O_X` of the derivative ideal of `(f)`; nothing about characteristic zero or orders is used.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

- §5.6, the algebraic Cartan and Lie-derivative adapter (`exists_lieDerivativeOneForm`,
  `lieDerivativeOneForm`): for fields `C ⊆ F` with `C` of characteristic zero and a `C`-derivation `D` of
  `F`, there is a unique `C`-linear `L_D : Ω[F⁄C] → Ω[F⁄C]` with `L_D(a·db) = D(a)·db + a·d(Db)`. Only the
  agreement bullet of §4.2 uses it.

Every input above is stated by the library or roadmap under which it is listed.

## How to read the build

Layer 0 adds the interface statements the construction needs on top of Tau Ceti's sheaf of differentials,
AlgebraicModuliForArithmeticGeometry's Grassmannian and the regularity results of SchemeAndStackFoundations,
together with the normality of base changes along separable extensions of the ground field that the base change of
the normalised Nash blowup (§6.3) uses, and the predicate that `Ω_{X/k}` has a locally free quotient of rank `d`
(§0.7), the hypothesis of the triviality criterion and of both differential smoothness criteria. Layer 1 proves the setting lemma and constructs, once and for all, the
Nash modification of a sheaf of finite type along a dense open where it is locally free, with its universal
property, Plücker form, locality and flat base change. Layer 2 specialises it to `Ω_{X/k}`: the Nash blowup, its
modification property, its universal property, the triviality criterion, locality, field base change and the
iteration. Layer 3 gives the embedded (Gauss map) and blowup descriptions. Layers 4 and 5 prove the smoothness
criteria, in characteristic zero and for normal schemes over perfect fields of characteristic `p`; both start
from §4.1, prove first the differential form (a free quotient of the differentials forces smoothness, §§4.4 and
5.4) and then, with the triviality criterion of §2.5, the form for the Nash blowup (§§4.5 and 5.4). Layer 6
builds the normalised Nash blowup and its isomorphism criteria, and Layer 7 the iterations and the never-resolves
principle. Layers 4 and 5 are independent of Layers 3, 6 and 7, and their differential forms (§4.4 and the first
statement of §5.4) need from Layers 0 and 1 only §§0.3, 0.5, 0.7 and the setting lemma §1.1, not the Nash blowup.

## Layer 0: interfaces with the pinned libraries

### 0.1 The comparison map of differentials

Define *relativeDifferentials.pullbackMap*: for a commutative ring `R`, schemes `X`, `Y` over `Spec R`
and a morphism `f : X → Y` over `Spec R`, the `O_X`-linear map `c_f : f*Ω_{Y/R} → Ω_{X/R}` adjoint to the
`R`-derivation `O_Y → f_*Ω_{X/R}`, `h ↦ d(f*h)` (stacksNormalization, Morphisms Lemma 29.33.8, tag 01UV,
line 2900). Construct it from `Scheme.relativeDifferentialsHomEquiv` applied to Tau Ceti's `pushforwardDerivation`
of the universal derivation of `X` (the `R`-derivation `O_Y → f_*Ω_{X/R}`, `h ↦ d(f*h)`) and Mathlib's
`Scheme.Modules.pullbackPushforwardAdjunction`.

- Characterisation: `c_f(f*(dh)) = d(f*h)` for every local section `h` of `O_Y`, and `c_f` is the unique
  `O_X`-linear map with this property.
- Functoriality: `c_{id} = id`, and for `g : Y → Z` over `Spec R`, `c_{g∘f} = c_f ∘ f*(c_g)` under the
  pullback composition isomorphism.
- For an open immersion `f`, `c_f` is an isomorphism and agrees with Tau Ceti's
  `relativeDifferentialsRestrictIso` under the identification of pullback with restriction.
- On affine schemes `Spec B → Spec A` over `Spec R` it is the sheaf of the Kähler map
  `B ⊗_A Ω[A⁄R] → Ω[B⁄R]`, under Tau Ceti's `relativeDifferentialsSpecIso` (`Ω_{Spec A/R}` is the sheaf of
  `Ω[A⁄R]`, with `da ↦ D a`) for `A` and for `B`.

**Checks.**

- For `f : 𝔸¹ → 𝔸²`, `t ↦ (t², t³)` over `k`, `c_f(dx) = 2t dt` and `c_f(dy) = 3t² dt`; in characteristic
  two `c_f(dx) = 0` and `c_f(dy) = t² dt`, so a definition ignoring the characteristic (formal derivative
  over `ℤ`) is excluded.
- For the identity of `𝔸¹`, `c_{id}(dx) = dx`; the zero map, which is also `O_X`-linear, is excluded by the
  characterising property `c_f(f*(dh)) = d(f*h)`.
- For the closed point `Spec k → 𝔸¹`, `c_f : k·dx → Ω_{k/k} = 0` is surjective and not injective: `c_f` is
  not an isomorphism in general.

*Needs:* Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentials`, `Scheme.relativeDifferentialsHomEquiv`,
`pushforwardDerivation`, `relativeDifferentialsRestrictIso`, `relativeDifferentialsSpecIso`; Mathlib
`AlgebraicGeometry.Scheme.Modules.pullback`, `Scheme.Modules.pullbackPushforwardAdjunction`.

### 0.2 Base change and closed immersions

Let `R → R'` be a ring map, `X` a scheme over `Spec R` and `X' = X ×_{Spec R} Spec R'` with projection
`g' : X' → X`. Regard `X'` as a scheme over `Spec R` through `Spec R' → Spec R`, so that `g'` is a morphism over
`Spec R` and §0.1 gives `c_{g'} : g'*Ω_{X/R} → Ω_{X'/R}`. Let `e : Ω_{X'/R} → Ω_{X'/R'}` be the map that
`Scheme.relativeDifferentialsHomEquiv` attaches to the universal `R'`-derivation of `X'`, which is also an
`R`-derivation; it sends `d_{X'/R}(h)` to `d_{X'/R'}(h)` and is surjective (stacksNormalization, Morphisms Lemma
29.33.9, tag 01UX, line 2918, for `X' → Spec R' → Spec R`). The **base-change map** is the composite
`b_{g'} = e ∘ c_{g'} : g'*Ω_{X/R} → Ω_{X'/R'}`: the `O_{X'}`-linear map adjoint to the `R`-derivation
`O_X → g'_*Ω_{X'/R'}`, `h ↦ d_{X'/R'}(g'*h)`, and the unique `O_{X'}`-linear map sending `g'*(d_{X/R}h)` to
`d_{X'/R'}(g'*h)` (stacksNormalization, Morphisms Lemma 29.33.8, tag 01UV, line 2900, where the comparison map is
stated for a commutative square over `Spec R' → Spec R`).

Prove *relativeDifferentials.baseChangeIso*: `b_{g'}` is an isomorphism (stacksNormalization, Morphisms Lemma
29.33.10, tag 01V0, line 2926). On an affine chart `X = Spec A`, `X' = Spec B` with `B = R' ⊗_R A`, it is Mathlib's
`KaehlerDifferential.tensorKaehlerEquiv`, `B ⊗_A Ω[A⁄R] ≅ Ω[B⁄R']`.

Prove *relativeDifferentials.pullbackMap_surjective_of_isClosedImmersion*: for a closed immersion
`i : Z → X` over `Spec R`, `c_i : i*Ω_{X/R} → Ω_{Z/R}` is surjective (stacksNormalization, Morphisms
Lemma 29.33.15, tag 01UZ, line 2953). On affine charts it is
`KaehlerDifferential.mapBaseChange_surjective`.

**Checks.**

- For `R = k`, `R' = k(s)` purely transcendental and `X = Spec k`, `X' = Spec k(s)`: §0.1's `c_{g'}` is
  `0 → Ω_{k(s)/k} = k(s)·ds`, not an isomorphism, while `e` kills `ds` and `b_{g'}` is `0 → Ω_{k(s)/k(s)} = 0`, an
  isomorphism. A base-change map with target the differentials over `R` is excluded.
- For `k = 𝔽_p(t)`, `k' = k(τ)` with `τ^p = t`, and `X = Spec K`, `K = k[y]/(y^p − t)`: `Ω_{K/k} = K·dy` (as
  `d(y^p − t) = 0`), and `X' = Spec k'[u]/(u^p)` with `u = y − τ` is not reduced. `Ω_{X'/k}` is free on `dτ, du`
  with `c_{g'}(dy) = dτ + du`, which does not generate it, whereas `Ω_{X'/k'} = (k'[u]/(u^p))·du` is free of rank
  one and `b_{g'}(dy) = du`, an isomorphism: no flatness, separability or reducedness enters the statement.
- For `R = ℤ`, `R' = 𝔽₂` and `X = 𝔸¹_ℤ = Spec ℤ[T]`, `X' = Spec 𝔽₂[T]` and `b_{g'}` is `𝔽₂[T]·dT → 𝔽₂[T]·dT`,
  `dT ↦ dT`, the identity, as `tensorKaehlerEquiv` gives for `B = 𝔽₂ ⊗_ℤ ℤ[T]`; here `Ω_{𝔽₂/ℤ} = 0` and `e` is
  already an isomorphism.

*Needs:* §0.1; Tau Ceti `Scheme.relativeDifferentialsHomEquiv`, `relativeDifferentialsSpecIso` (for the affine
charts); Mathlib `KaehlerDifferential.tensorKaehlerEquiv`, `KaehlerDifferential.mapBaseChange_surjective`.

### 0.3 The smooth locus of dimension d

Define *smoothLocusOfDim*: for `X` locally of finite type over a field `k` and `d ∈ ℕ`, the open
subscheme `X_sm^{(d)}` of points `x ∈ X_sm` with `dim_{κ(x)} Ω_{X/k} ⊗ κ(x) = d`. It is open because
`Ω_{X/k}` is finite locally free on the smooth locus (Tau Ceti `isFiniteLocallyFree_relativeDifferentials`
applied to `Scheme.Hom.smooth_smoothLocus_ι_comp` and `relativeDifferentialsRestrictIso`), so its rank
is locally constant there.

- `Ω_{X/k}` restricted to `X_sm^{(d)}` is finite locally free of rank `d`.
- `X_sm^{(d)} → Spec k` is smooth of relative dimension `d`, and `X_sm = ⨆_d X_sm^{(d)}` (disjoint).
- For `x ∈ X_sm`, the rank of `Ω_{X/k}` at `x` is `dim_x X` (stacksAlgebra, Lemma 10.140.3, tag 00TT,
  (1) ⇒ (3), line 17618); hence `X_sm^{(d)} = X_sm` when `X` is pure of dimension `d`. Route: on an open
  of `X_sm` smooth of relative dimension `n`, Tau Ceti's `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`
  gives `n`-dimensional local rings at closed points, SchemeAndStackFoundations §0.7 converts this to
  `dim_x X = n`, and `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply` gives rank `n`.
- Compatible with open immersions: `(V)_sm^{(d)} = V ∩ X_sm^{(d)}` for `V ⊆ X` open.

**Checks.**

- For `X = 𝔸²_k ⊔ 𝔸¹_k`, `X_sm^{(2)} = 𝔸²`, `X_sm^{(1)} = 𝔸¹`, `X_sm^{(0)} = ∅`, while `X_sm = X`: the
  dimension is not forgotten.
- For the cusp `y² = x³` over `ℚ`, `X_sm^{(1)}` is the complement of the origin and `X_sm^{(0)} = ∅`.
- For `Spec k[ε]/(ε²)`, `Ω = k[ε]dε/(2ε dε)` has rank `1` at the point but the smooth locus is empty, so
  `X_sm^{(1)} = ∅`: rank alone does not define the locus.

*Needs:* Mathlib `Scheme.Hom.smoothLocus`; Tau Ceti `isFiniteLocallyFree_relativeDifferentials`,
`FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply`, `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`,
`Scheme.Hom.smooth_smoothLocus_ι_comp`, `relativeDifferentialsRestrictIso`; SchemeAndStackFoundations §0.7.

### 0.4 Grassmannians along a surjection

Prove *coherentGrassmannian.mapOfSurjective*: for quasi-coherent sheaves of finite type `E'`, `E` on a
scheme `S`, a surjection `p : E' → E` with kernel `K`, and `r ≥ 0`, there is a closed immersion
`Gr_r(E) → Gr_r(E')` over `S` whose functor of points sends a quotient `h*E → Q` to `h*E' → h*E → Q`,
and whose image represents the quotients `h*E' → Q` killing the image of `h*K`; the universal quotient of
`Gr_r(E')` restricts to the universal quotient of `Gr_r(E)` composed with `p` (alperModuli, proof of
Theorem 1.4.5, lines 2985–3007, printed p. 62, applied to the Grassmannian as the Quot scheme over
`ℙ⁰`, Remark 1.1.4(1), line 2283). The proof there assumes `S` Noetherian and works with coherent sheaves on
`ℙⁿ_S`, and so does the exercise it cites for the vanishing locus (alperModuli, Exercise 0.3.21, line 1202);
the step used here, that the locus where a map from a quasi-coherent sheaf to a locally free sheaf of finite
rank vanishes is a closed subscheme, needs neither, and `S` is an arbitrary scheme. For `h : T → S` and a
quotient `h*E' → Q`, the closed subscheme of `T` is the zero locus of the composite `h*K → h*E' → Q`: on an
open of `T` where `Q ≅ O_T^r` it is cut out by the quasi-coherent ideal generated by the images of the `r`
coordinate maps `h*K → O_T`, and `T' → T` factors through it exactly when the pulled-back composite vanishes
(pullback is right exact, so the image of the pulled-back coordinate map generates the pulled-back ideal).
Right exactness also keeps `h*E' → h*E` surjective with kernel the image of `h*K`, so the quotients of
`h*E'` killing that image are exactly the quotients of `h*E`.

- The construction commutes with base change along `S' → S` and with composition of surjections.
- For `E' = O_S^n`, `Gr_r(O_S^n) ≅ S ×_ℤ Gr(r, n)` (AlgebraicModuliForArithmeticGeometry §1.3 base change),
  so a surjection `O_S^n → E` embeds `Gr_r(E)` in `S × Gr(r, n)`.

**Checks.**

- Over the non-Noetherian `S = Spec k[x_1, x_2, …]`, with `E' = O_S²`, `E = O_S`, `p(a, b) = a` and `r = 1`,
  `Gr_1(O_S) = S` embeds in `Gr_1(O_S²) = ℙ¹_S` as the section `[1 : 0]`, the quotient `(a, b) ↦ a` killing
  `K = 0 ⊕ O_S`; it is the zero locus of the second homogeneous coordinate, a closed subscheme although `S` is
  not Noetherian. Recording a quotient by its kernel (the conormal convention excluded in the Conventions)
  would put the image at `[0 : 1]`.
- For `p` the identity, `K = 0` and the closed immersion is the identity of `Gr_r(E)`.
- For the same `p` and `r = 2`, `Gr_2(O_S) = ∅` while `Gr_2(O_S²) = S` (the only rank-two quotient of
  `O_S²` is the identity, which does not kill `K`): the image is the empty closed subscheme.

*Needs:* AlgebraicModuliForArithmeticGeometry §1.3 (`coherentGrassmannian`); Mathlib `IsClosedImmersion`.

### 0.5 Smoothness at closed points over a perfect field

Prove *smooth_iff_isRegularLocalRing_closedPoints*: for `X` locally of finite type over a perfect field
`k`, `X → Spec k` is smooth iff `O_{X,x}` is a regular local ring for every closed point `x`
(stacksVarieties, Lemma 33.25.8, tag 0B8X, line 2130, for reduced `X`; a scheme regular at its closed
points is reduced there). Route: by SchemeAndStackFoundations §4.13 `regularLocus_eq_smoothLocus` the
regular locus is the open smooth locus; its complement is closed, and if nonempty it contains a closed
point (`LocallyOfFiniteType.jacobsonSpace`, `nonempty_inter_closedPoints`).

**Checks.**

- The cusp over a perfect field is not smooth: its local ring at the origin has embedding dimension
  `2 > 1`.
- `𝔸ⁿ_k` is smooth and all its local rings at closed points are regular.
- Over `k = 𝔽_p(t)`, `Spec k(t^{1/p})` is regular (a field) but not smooth: the perfectness hypothesis is
  needed.

*Needs:* SchemeAndStackFoundations §4.13 (`regularLocus_eq_smoothLocus`); Mathlib
`LocallyOfFiniteType.jacobsonSpace`, `nonempty_inter_closedPoints`, `IsRegularLocalRing`.

### 0.6 Normality under separable extension of the ground field

A ring `R` is **normal** when its localisation at every prime ideal is an integrally closed domain
(stacksAlgebra, Definition 10.37.11, tag 00GV, line 3976); the zero ring is normal, and `R` is normal exactly when
`Spec R` is a normal scheme (Tau Ceti's `isNormalScheme_Spec_iff_forall_localization`).

Prove *isNormal_directLimit*: the colimit `R` of a directed system of normal rings `R_i` is normal (stacksAlgebra,
Lemma 10.37.17, tag 037D, line 4015). Route: for a prime `P` of `R` with preimages `P_i ⊆ R_i`, the local ring `R_P`
is the directed colimit of the integrally closed domains `(R_i)_{P_i}`. A relation `ab = 0` in `R_P` holds at some
stage, where one factor vanishes, so `R_P` is a domain; and if a fraction `a/b`, `b ≠ 0`, satisfies a monic equation
over `R_P`, the cleared equation `aⁿ + c_1 aⁿ⁻¹ b + ⋯ + c_n bⁿ = 0` holds at some stage `j`, where `b` is nonzero, so
`a = cb` with `c` from `(R_j)_{P_j}`, and `a/b ∈ R_P`. No Noetherian hypothesis is made: `ℚ̄ ⊗_ℚ ℚ̄`, the colimit of the
finite products of fields `L ⊗_ℚ ℚ̄` over the finite subextensions `L/ℚ`, is normal and not Noetherian (below).

Define *Algebra.IsGeometricallyNormal*: for a field `k` and a `k`-algebra `A`, the ring `K ⊗_k A` is normal for
every field extension `K/k` (condition (1) of stacksAlgebra, Lemma 10.165.1, tag 037Z, line 21470, which is
Definition 10.165.2, tag 0380, line 21504).

- Normality: a geometrically normal `k`-algebra is a normal ring (take `K = k`, `k ⊗_k A ≅ A`).
- *isGeometricallyNormal_of_isTranscendentalSeparable*: a separable field extension `k'/k` in the sense of the
  Conventions (`Algebra.IsTranscendentalSeparable k k'`, not necessarily algebraic or finitely generated) is
  geometrically normal over `k` (stacksAlgebra, Lemma 10.165.4, tag 0C30, line 21510). Route: the tensor bullet below
  with `B = K`, a field, makes `K ⊗_k k' ≅ k' ⊗_k K` normal for every field extension `K/k`.
- *isNormal_tensorProduct_of_isTranscendentalSeparable*: for a separable field extension `k'/k` in the sense of the
  Conventions and a `k`-algebra `B` that is a normal ring, `k' ⊗_k B` is a normal ring; no finiteness or Noetherian
  hypothesis is made on `k'` or `B` (the case `A = k'` of stacksAlgebra, Lemma 10.165.5, tag 06DF, line 21516, where
  `A` is geometrically normal by 0C30). Route: `k'` is the directed union of its finitely generated subextensions
  `k_i`, and `k' ⊗_k B` is the directed colimit of the `k_i ⊗_k B`, so by *isNormal_directLimit* it suffices that each
  `k_i ⊗_k B` be normal. By the definition of `Algebra.IsTranscendentalSeparable`, `k_i` is separable algebraic over
  `k(t) = k(t_1, …, t_n)` for a transcendence basis `t_1, …, t_n` (`Algebra.IsSeparablyGenerated`), hence finite
  separable over it. First, `k(t) ⊗_k B` is the localisation of `B[t_1, …, t_n] = k[t] ⊗_k B` at the nonzero
  polynomials of `k[t]`, so its local rings are local rings of `B[t]`; the local ring of `B[t]` at a prime `Q` over the
  prime `q` of `B` is a localisation at a prime of `B_q[t_1, …, t_n]`, an integrally closed domain because `B_q` is one
  (Tau Ceti's `TauCeti.MvPolynomial.isIntegrallyClosed`), so it is an integrally closed domain
  (`IsLocalization.isDomain_of_le_nonZeroDivisors`, `isIntegrallyClosed_of_isLocalization`). Next,
  `k_i ⊗_k B ≅ k_i ⊗_{k(t)} (k(t) ⊗_k B)` is étale over `k(t) ⊗_k B`, as a base change (`Algebra.Etale.baseChange`)
  of the étale `k(t) → k_i` (`Algebra.Etale.iff_exists_algEquiv_prod`); so its local rings are integrally closed
  domains (Tau Ceti's `TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_localization_under` and
  `isIntegrallyClosed_localization_atPrime_of_localization_under`), and `k_i ⊗_k B` is normal.

**Checks.**

- For `k = ℚ` and `A = ℚ(i)`, `K ⊗_ℚ ℚ(i) ≅ K[x]/(x² + 1)` is the field `K(i)` when `i ∉ K` and `K × K` when `i ∈ K`;
  both are normal, so `ℚ(i)` is geometrically normal, as the separable bullet says. For `K = ℚ(i)` the ring is not a
  domain: a definition demanding that `K ⊗_k A` be an integrally closed domain would exclude this separable
  extension.
- For `k = 𝔽_p(t)` and the field `A = k(t^{1/p}) = k[y]/(y^p − t)`, `A` is normal, but for `K = A`,
  `K ⊗_k A ≅ K[y]/((y − t^{1/p})^p)` has the nonzero nilpotent `y − t^{1/p}`, so it is not reduced and not normal:
  `A` is not geometrically normal, the separability hypothesis of the separable bullet cannot be dropped, and in the
  tensor bullet (with `k' = B = A`, a normal ring) separability cannot be dropped either.
- For `k = 𝔽_p(t)`, `p > 2`, and `A = k[x, y]/(x^p + y² + t)`, the ring of the regular curve `C` of the Checks
  below, `A` is normal, and `K ⊗_k A` is a domain for every `K/k` (for `K ∋ t^{1/p}` it is `K[u, y]/(u^p + y²)`,
  `u = x + t^{1/p}`, with `u^p + y²` irreducible as `p` is odd), so `A` is geometrically reduced, even geometrically
  integral; but for `K = k(t^{1/p})` that domain is not normal (below), so `A` is not geometrically normal: the
  definition is not geometric reducedness.
- For the purely transcendental `k(s)/k`, `K ⊗_k k(s)` is the localisation of the principal ideal domain `K[s]` at
  the nonzero polynomials of `k[s]`, a normal domain, for every `K/k`: `k(s)` is geometrically normal though not
  algebraic over `k`. For `A = 0`, every `K ⊗_k A` is the zero ring, which is normal.

Prove *isNormalScheme_pullback_of_isTranscendentalSeparable*: for a field `k`, a normal `k`-scheme `W` (every
stalk an integrally closed domain, Tau Ceti's `IsNormalScheme`, SchemeAndStackFoundations §0.30) and a
separable field extension `k'/k` in the sense of the Conventions (`Algebra.IsTranscendentalSeparable k k'`), the base change
`W_{k'} = W ×_{Spec k} Spec k'` is normal (stacksVarieties, Lemma 33.10.6, tag 0C3M, line 1049). Neither `W` nor
`k'/k` is assumed finite, of finite type or Noetherian. Route: for every affine open `V` of `W` the ring `Γ(V, O_W)` is
normal (`isNormalScheme_iff_forall_affineOpens` and `isNormalScheme_Spec_iff_forall_localization`), so
`k' ⊗_k Γ(V, O_W)` is normal (*isNormal_tensorProduct_of_isTranscendentalSeparable*); the affine opens
`V_{k'} = Spec(k' ⊗_k Γ(V, O_W))` cover `W_{k'}`, and normality is local (`isNormalScheme_iff_openCover`).

**Checks.**

- For `W = Spec ℚ(i)` over `ℚ` and `k' = ℚ(i)`, `ℚ(i) ⊗_ℚ ℚ(i) ≅ ℚ(i)[x]/((x − i)(x + i)) ≅ ℚ(i) × ℚ(i)`, so
  `W_{k'}` is two reduced points: normal, but neither connected nor integral. The conclusion concerns the
  stalks; a version asserting that `W_{k'}` is integral is false.
- For `k = 𝔽_p(t)`, `p > 2`, the curve `C : x^p + y² + t = 0` is regular, hence normal (at the point `y = 0` the
  maximal ideal is `(y)`, as `x^p + t = −y²`); over the inseparable `k' = k(t^{1/p})`, with `u = x + t^{1/p}`,
  `C_{k'}` is the integral curve `u^p + y² = 0`, whose point `u = y = 0` has a two-dimensional cotangent space,
  so it is not normal (its normalisation is `𝔸¹ → C_{k'}`, `s ↦ (u, y) = (−s², s^p)`): separability is needed.
- For `k = 𝔽_p(t)` and `k' = k(s)` purely transcendental, `{s}` is a separating transcendence basis, so `k'/k` is
  separable, though not algebraic, so `Algebra.IsSeparable k k'` fails; for `W = Spec k[y]`,
  `W_{k'} = Spec k(s)[y]` is a principal ideal domain, normal. A carrier `Algebra.IsSeparable` would exclude
  this case, and with it the transcendental extensions of §6.3.
- For `W = Spec ℚ̄` and `k' = ℚ̄` over `ℚ`, the ring `ℚ̄ ⊗_ℚ ℚ̄` is not Noetherian (stacksVarieties, line 1064),
  but it is a filtered colimit of the finite products of fields `L ⊗_ℚ ℚ̄ ≅ ℚ̄^{[L:ℚ]}` over the finite
  subextensions `L`, hence absolutely flat, so every local ring is a field and `W_{k'}` is normal: no
  Noetherian hypothesis is needed.

*Needs:* for *isNormal_directLimit*, Mathlib `IsIntegrallyClosed` and localisation; for the definition and its
bullets, in addition Mathlib `Algebra.TensorProduct`, `Algebra.IsTranscendentalSeparable`,
`Algebra.IsSeparablyGenerated`, `Algebra.Etale.iff_exists_algEquiv_prod`, `Algebra.Etale.baseChange`,
`isIntegrallyClosed_of_isLocalization`, `IsLocalization.isDomain_of_le_nonZeroDivisors` and Tau Ceti
`isNormalScheme_Spec_iff_forall_localization`, `TauCeti.MvPolynomial.isIntegrallyClosed`,
`TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_localization_under`,
`isIntegrallyClosed_localization_atPrime_of_localization_under`; for the theorem, the tensor bullet and Tau Ceti
`IsNormalScheme`, `isNormalScheme_iff_forall_affineOpens`, `isNormalScheme_iff_openCover` (SchemeAndStackFoundations
§0.30).

### 0.7 Locally free quotients of the differentials

Define `HasLocallyFreeQuotientOfDifferentials k X d`, for a commutative ring `k`, a scheme `X` over `Spec k` and
`d ∈ ℕ`: there are a finite locally free `O_X`-module `E` of constant rank `d` (Tau Ceti's
`FiniteLocallyFreeSheaf.FixedRank X d`) and an epimorphism of `O_X`-modules `q : Ω_{X/k} → E`. An epimorphism of
sheaves of modules is surjective on every stalk, so `q` is a locally free quotient of rank `d` in the sense of the
Conventions. This is the condition of the triviality criterion §2.5 (nashModificationNotes2024, Section 2, lines
170–171, where it is drawn from an isomorphic Nash modification) and the hypothesis of the smoothness criteria
§§4.4 and 5.4 (nashModificationNotes2024, Proposition 2.3, lines 179–181, over an algebraically closed field of
characteristic zero). Under the hypotheses of the uniqueness bullet below it amounts, at each point `x`, to a
splitting `Ω_{O_{X,x}/k} ≅ O_{X,x}^d ⊕ T_x` with `T_x` the torsion submodule, the form in which
duarteNunezBetancourt2020, Lemma 2.4, lines 152–156, case `n = 1`, draws it from an isomorphic Nash blowup: a
surjection onto `O_{X,x}^d` splits, and its kernel vanishes at the minimal primes, so it is killed by a nonzerodivisor
of the reduced Noetherian `O_{X,x}`.

- Restriction: if the predicate holds for `X`, it holds for every open subscheme `V ⊆ X`, with the restriction of `q`
  composed with Tau Ceti's `relativeDifferentialsRestrictIso`.
- Smooth schemes: if `X → Spec k` is smooth of relative dimension `d`, the identity of `Ω_{X/k}`, finite locally free
  of rank `d` by Tau Ceti's `isFiniteLocallyFree_relativeDifferentials` and
  `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply`, witnesses the predicate.
- Uniqueness: for `k` a field and `X` reduced and locally of finite type over `k` with `X_sm^{(d)}` (§0.3) dense, any
  two locally free quotients `q₁ : Ω_{X/k} → E₁`, `q₂ : Ω_{X/k} → E₂` of rank `d` have the same kernel, so there is a
  unique isomorphism `E₁ ≅ E₂` carrying `q₁` to `q₂`, and over `X_sm^{(d)}` each `qᵢ` is an isomorphism. Over
  `X_sm^{(d)}` the `qᵢ` are surjections between finite locally free sheaves of the same rank, hence isomorphisms; the
  composite `ker q₁ → Ω_{X/k} → E₂` vanishes over the dense open `X_sm^{(d)}`, and a section of a locally free sheaf
  on a reduced scheme that vanishes on a dense open vanishes (the argument of §1.3).
- Glueing: under the hypotheses of the uniqueness bullet, the predicate holds for `X` as soon as it holds for every
  member of an open cover; the local quotients agree on overlaps by uniqueness, and their kernels glue.
- Stalk criterion: under the same hypotheses, the predicate holds iff for every `x ∈ X` there is a surjective
  `O_{X,x}`-linear map `Ω[O_{X,x}⁄k] → O_{X,x}^d`, the stalk of `Ω_{X/k}` being identified with `Ω[O_{X,x}⁄k]` by
  Tau Ceti's `Scheme.relativeDifferentialsStalkEquiv`. Forward: the stalk of an epimorphism is surjective and
  `E_x ≅ O_{X,x}^d`. Backward: on an affine open `Spec A ∋ x`, over which `Ω_{X/k}` is the sheaf of `Ω[A⁄k]` (Tau
  Ceti's `relativeDifferentialsRestrictIso` and `relativeDifferentialsSpecIso`), `Ω[A⁄k]` is finitely presented (`A`
  is of finite type over `k`), so `Hom_A(Ω[A⁄k], A^d)` commutes with localisation (stacksAlgebra, Lemma 10.10.2, tag 0583, line 905)
  and the surjection at `x` comes from a map over some `D(f) ∋ x`; its cokernel is a finite module with zero stalk at
  `x`, hence zero over a smaller basic open (stacksAlgebra, Lemma 10.40.5, tag 00L2, line 4466); then glue.

**Checks.**

- For `X = ∅` the predicate holds for every `d`, with `E = 0`, which has constant rank `d` vacuously. A definition
  demanding that `E` have rank `d` at some point, or that `E ≠ 0`, would fail here and make the criteria of §§4.4
  and 5.4 false for the empty scheme, which is smooth.
- For the cusp `X = V(y² − x³)` and `d = 1`: over `𝔽_2`, `Ω_{X/k} = (O dx ⊕ O dy)/(x² dx)` and `dx ↦ 0`, `dy ↦ 1`
  is a free quotient, so the predicate holds although `Ω_{X/k}` has the torsion section `dx` (killed by `x²`); over
  `ℚ` it fails (§2.5). The model "`Ω_{X/k}` is itself locally free of rank `d`" is excluded by the first case, and
  any model insensitive to the characteristic by the pair.
- For `X = 𝔸¹_k` the predicate holds for `d = 0` (the zero quotient) and `d = 1` (the identity of `O·dx`) and fails
  for `d = 2`, since the fibre `Ω_{X/k} ⊗ κ(x) = κ(x)·dx` at any point `x` has dimension `1 < 2`. For
  `X = Spec k[ε]/(ε²)` it holds for `d = 0`, and for `d = 1` it holds iff `k` has characteristic `2`: in
  characteristic `≠ 2`, `Ω_{X/k} = k[ε]dε/(2ε dε)` is killed by `ε` and has no surjection onto `k[ε]`, while in
  characteristic `2` it is free on `dε`. The predicate alone records neither the dimension nor reducedness; §§4.4 and
  5.4 carry both as hypotheses.
- For `X = 𝔸²_k` and `d = 1`, where `X_sm^{(1)} = ∅`, the quotients `dx ↦ 1, dy ↦ 0` and `dx ↦ 0, dy ↦ 1` of
  `Ω_{X/k} = O dx ⊕ O dy` onto `O` have the different kernels `O dy` and `O dx`: the density of `X_sm^{(d)}` in the
  uniqueness bullet cannot be dropped. For the cusp over `𝔽_2` (dense `X_sm^{(1)}`) every rank-one quotient sends
  `dx` to some `c` with `x²c = 0`, so `c = 0`, and `dy` to a unit: all have the kernel `O dx`, as uniqueness says.

*Needs:* Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentials`, `FiniteLocallyFreeSheaf.FixedRank`,
`relativeDifferentialsRestrictIso`, `Scheme.relativeDifferentialsStalkEquiv`,
`isFiniteLocallyFree_relativeDifferentials`, `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply`,
`isFinitePresentation_relativeDifferentials`, `relativeDifferentialsSpecIso` (stalk criterion); §0.3 for the
uniqueness, glueing and stalk bullets.

### Examples

For `𝔸¹ → 𝔸²`, `t ↦ (t², t³)`, the comparison map of §0.1 is `dx ↦ 2t dt`, `dy ↦ 3t² dt`. The
surjection `O² → Ω_{X/k}` for the cusp `X = V(y² − x³) ⊆ 𝔸²` embeds `Gr_1(Ω_{X/k})` in `X × ℙ¹` (§0.4),
with fibre `ℙ¹` over the origin and a single point elsewhere.

The cotangent-space identification that §§4.1 and 4.4 import from Tau Ceti (Exact supplier contracts,
`KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`) needs no Noetherian hypothesis, whereas
stacksAlgebra, Lemma 10.140.4, tag 00TU, line 17647, states injectivity for Noetherian `R`. For `R = k[x]_{(x)}`
it sends the class of `x` to `dx`, a basis on both sides; for `R = k` both sides are zero; for the non-Noetherian
`R = k[x_1, x_2, …]` localised at `(x_1, x_2, …)` it sends the classes of the `x_i`, a basis of `m/m²`, to the
`1 ⊗ dx_i`, a basis of `κ ⊗_R Ω_{R/k}`. For `k = 𝔽_p(t)` and `R = k[x]_{(x^p − t)}`, whose residue field
`k(t^{1/p})` is inseparable over `k` (so not formally étale), the class of `x^p − t`, which spans `m/m²`, maps to
`d(x^p − t) = 0`: the separability hypothesis cannot be dropped.

For the node `xy = 0`, in every characteristic, `HasLocallyFreeQuotientOfDifferentials` fails for `d = 1`
(§0.7): a quotient `dx ↦ a`, `dy ↦ b` must satisfy `ya + xb = 0`, which forces `a` to vanish on the branch `x = 0` and
`b` on the branch `y = 0`, so neither is a unit at the origin. By the stalk criterion it is a statement about the
local ring at the origin alone.

### Dependencies

Tau Ceti's sheaf of differentials (with its stalks and its affine form), smooth-locus files, finite locally free
sheaves of fixed rank, normal schemes, polynomial rings over integrally closed domains and normality along étale maps;
Mathlib's Kähler differentials, pullback of sheaves of modules, tensor products of algebras, étale algebras over a
field, `IsIntegrallyClosed` and `Algebra.IsTranscendentalSeparable`; AlgebraicModuliForArithmeticGeometry §1.3;
SchemeAndStackFoundations §§0.7, 0.30, 4.13. Within the layer, the normality theorem of §0.6 rests on the normality of
`k' ⊗_k B` for a separable `k'/k` and a normal `B`, which rests on the normality of directed colimits of normal rings,
both stated there.

## Layer 1: the setting and the Nash modification of a sheaf

### 1.1 The setting

Prove *setting*: let `X` be a reduced scheme locally of finite type over a field `k`.

1. `X_sm` is dense in `X` iff `X` is geometrically reduced over `k` (stacksVarieties, Lemma 33.25.7, tag
   056V, line 2112).
2. Over a perfect field every reduced `X` has dense smooth locus (Mathlib
   `Scheme.Hom.dense_smoothLocus_of_perfectField`).
3. If `X_sm` is dense, it contains every generic point of an irreducible component of `X`, and it meets
   every irreducible component in a dense open subset.
4. If moreover `X` is pure of dimension `d`, then `X_sm = X_sm^{(d)}` and `Ω_{X/k}` restricted to `X_sm` is
   finite locally free of rank `d` (§0.3).

Route for (1). Suppose `X_sm` is dense; let `k'/k` be a field extension and `Spec A ⊆ X` an affine open. The ring
`A` is reduced and Noetherian, and the ideal `I` of the closed complement of `X_sm ∩ Spec A` lies in no minimal
prime of `A` (a dense open contains every generic point); by prime avoidance `I` contains an element `g` outside
every minimal prime, a nonzerodivisor since in a reduced Noetherian ring the zerodivisors are the union of the
minimal primes, and `D(g) ⊆ X_sm`. Then `A → A_g` is injective, hence so is `A ⊗_k k' → A_g ⊗_k k'` (`k'` is flat
over `k`); and `A_g ⊗_k k'` is reduced, because `D(g)` is an open of `X_sm`, smooth over `k`
(`Scheme.Hom.smooth_smoothLocus_ι_comp`), and smooth morphisms are geometrically reduced (Tau Ceti's instance
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`). So `A ⊗_k k'` is reduced, and since the `Spec(A ⊗_k k')`
cover `X_{k'}`, `X_{k'}` is reduced: `X` is geometrically reduced (Mathlib's `GeometricallyReduced`). Conversely
let `k'` be the perfect closure of `k`. The projection `p : X_{k'} → X` is a universal homeomorphism
(SchemeAndStackFoundations §0.23, with universal injectivity from
`tfae_universallyInjective`, as `k'/k` is purely inseparable); `X_{k'}` is reduced, so its smooth locus
`W'` is dense (2), `W' = p⁻¹(W)` for the open `W = p(W')`, and `W` is smooth over `k` by
SchemeAndStackFoundations §0.11, so `W ⊆ X_sm` is dense.

**Checks.**

- Over `k = 𝔽_p(t)`, `X = Spec k[y]/(y^p − t)` is reduced (a field) and not geometrically reduced; its smooth
  locus is empty, so it is excluded by the Setting.
- `Spec k[ε]/(ε²)` is not reduced and is excluded; its reduction `Spec k` satisfies the Setting with `d = 0`.
- `X = 𝔸²_k ⊔ 𝔸¹_k` is reduced with dense smooth locus but not pure-dimensional; `X_sm ≠ X_sm^{(2)}`, so
  (4) needs pure dimension.

*Needs:* §0.3; Mathlib `Scheme.Hom.smoothLocus`, `Scheme.Hom.dense_smoothLocus_of_perfectField`,
`GeometricallyReduced`, `PerfectClosure`, `tfae_universallyInjective`; Tau Ceti
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`, `Scheme.Hom.smooth_smoothLocus_ι_comp`;
SchemeAndStackFoundations §§0.11, 0.23.

### 1.2 The Nash modification of a sheaf

Define *nashModification*: let `X` be a scheme, `F` a quasi-coherent `O_X`-module of finite type, `r ∈ ℕ`,
and `U ⊆ X` an open such that `F|_U` is finite locally free of rank `r`. Let `π : Gr_r(F) → X` be
AlgebraicModuliForArithmeticGeometry's `coherentGrassmannian` and `σ_U : U → Gr_r(F)` the classifying map of
the identity quotient of `F|_U`. Then `N(X, F, r, U)` is the scheme-theoretic image `σ_U.image`, with
`π_N : N → X` the restriction of `π` (nashModificationNotes2024, Section 3, lines 216–225;
gonzalezSprinberg1982, §1.1, lines 85–90). The construction needs only these data; the statements below
assume in addition that `X` is reduced and locally Noetherian and that `U` is dense.

- `N → Gr_r(F)` is a closed immersion, `N` is reduced, and its support is the closure of `σ_U(U)`
  (Mathlib's `Scheme.Hom.support_ker` and Tau Ceti's `Scheme.Hom.isReduced_image`, both for quasi-compact
  morphisms; `σ_U` is quasi-compact because `X` is locally Noetherian).
- `π_N` restricts to an isomorphism `π_N⁻¹(U) → U`, and `π_N⁻¹(U)` is dense in `N`.
- Independence of the open: for a dense open `U' ⊆ U`, `N(X, F, r, U') = N(X, F, r, U)` as closed
  subschemes of `Gr_r(F)`.
- The universal quotient restricts to a locally free rank-`r` quotient `π_N*F → L_F`, which over
  `π_N⁻¹(U) ≅ U` is the identity quotient of `F|_U`.
- `π_N` is proper (closed in the proper `Gr_r(F) → X`).

**Checks.**

- If `F` is finite locally free of rank `r` on all of `X`, then `σ_X` is a section with closed image and
  `N(X, F, r, U) ≅ X` for every dense `U`.
- On `X = Spec k[x]` with `F = O ⊕ O/(x)`, `r = 1`, `U = D(x)`: the fibre of `Gr_1(F)` over the origin is
  `ℙ¹`, but `N ≅ X` with `L_F = O` the quotient by the torsion summand; a definition taking the whole
  Grassmannian, or its fibre over the origin, is excluded.
- On `X = 𝔸²_k` with `F` the ideal sheaf of the origin, `r = 1`, `U = 𝔸² ∖ {0}`: `N` is the blowup of the
  origin, with exceptional fibre `ℙ¹`, so `N ≠ X` although `F` is torsion-free.

*Needs:* AlgebraicModuliForArithmeticGeometry §1.3 (`coherentGrassmannian`); Mathlib `Scheme.Hom.image`,
`Scheme.Hom.support_ker`, `Scheme.Hom.toImage`; Tau Ceti `Scheme.Hom.isReduced_image`.

### 1.3 Universal property

Prove *nashModification.lift*: in the situation of §1.2, let `h : Z → X` be a morphism from a reduced
scheme `Z` with `h⁻¹(U)` dense in `Z`, and `h*F → M` a locally free quotient of rank `r`. Then there is a
unique `q : Z → N(X, F, r, U)` with `π_N ∘ q = h` and `q*(π_N*F → L_F) = (h*F → M)` as quotients.
Moreover the quotient `M` is unique: any two locally free rank-`r` quotients of `h*F` coincide, because
both are the identity quotient over `h⁻¹(U)`, where `h*F` is locally free of rank `r`, and quotients of a
locally free sheaf onto a locally free sheaf of the same rank are isomorphisms (nashModificationNotes2024,
Section 3, lines 226–229, and Section 2, lines 153–162, where the density hypothesis is implicit;
gonzalezSprinberg1982, §1.2, lines 94–98, for proper birational `h`). Route: the classifying map
`Z → Gr_r(F)` agrees with `σ_U` on `h⁻¹(U)`, so its image lies in the closure of `σ_U(U)`; Tau Ceti's
`vanishingIdeal_le_ker_of_range_subset` and Mathlib's `IsClosedImmersion.lift` factor it through `N`;
uniqueness is `ext_of_isDominant_of_isSeparated`.

**Checks.**

- For the identity of `X` (with `U` dense and `F|_X` locally free), `q` is the inverse of `π_N`.
- In the second Check of §1.2, `Z = Spec k` mapping to the origin with the quotient
  `F ⊗ k = k² → k`, `(a, b) ↦ b`, does not factor through `N`: here `h⁻¹(U) = ∅` is not dense, so the
  density hypothesis cannot be dropped.
- For `X` smooth over `k` of relative dimension `r ≥ 2`, `F = Ω_{X/k}` and `h : Bl_p X → X` the blowup of a
  closed point `p` (a regular, hence reduced, scheme with exceptional fibre `ℙ^{r−1}_{κ(p)}` over `p`), the
  pulled-back identity quotient gives `q = h`, a morphism to `N = X` that is not an isomorphism: the universal
  property characterises `N` as a terminal object, not every `Z` with a quotient. For `r = 1` the maximal ideal
  of `O_{X,p}` is invertible, so `Bl_p X = X` and `q = h` is the identity (for `X = 𝔸¹` and `p` the origin the
  ideal `(x)` is already effective Cartier): the bound `r ≥ 2` is what makes `h` a non-isomorphism.

*Needs:* §1.2; Tau Ceti `vanishingIdeal_le_ker_of_range_subset`; Mathlib `IsClosedImmersion.lift`,
`ext_of_isDominant_of_isSeparated`; AlgebraicModuliForArithmeticGeometry §1.3.

### 1.4 The Plücker form

Prove *nashModification.pluckerIso*: in the situation of §1.2, `∧^r F|_U` is invertible and the Plücker
closed immersion of AlgebraicModuliForArithmeticGeometry §1.3 restricts to an isomorphism over `X`
`N(X, F, r, U) ≅ N(X, ∧^r F, 1, U)` carrying `∧^r L_F` to `L_{∧^r F}` (gonzalezSprinberg1982, §1.3,
lines 99–104; nashModificationNotes2024, Section 3, line 230). Route: `plucker ∘ σ_U` classifies
`∧^r` of the identity quotient, which is the identity quotient of `∧^r F|_U`; a closed immersion maps the
closure of `σ_U(U)` onto the closure of its image, and both sides are reduced.

*Needs:* §§1.2, 1.3; AlgebraicModuliForArithmeticGeometry §1.3 (`plucker`); Tau Ceti `SheafOfModules.exteriorPower`.

### 1.5 Locality and flat base change

Prove *nashModification.restrict*: in the situation of §1.2 (`X` reduced and locally Noetherian, `U` dense),
for an open `V ⊆ X`, `N(V, F|_V, r, U ∩ V) ≅ π_N⁻¹(V)` over `V`
(stacksNormalization, Morphisms Lemma 29.6.3(3), tag 01R8, line 421: the scheme-theoretic image of the
quasi-compact `σ_U` commutes with restriction to opens; AlgebraicModuliForArithmeticGeometry §1.3 for
`Gr_r(F|_V) = π⁻¹(V)`).

Prove *nashModification.baseChange*: in the situation of §1.2, for a flat morphism `g : X' → X` from a reduced
locally Noetherian scheme, `N(X', g*F, r, g⁻¹(U)) ≅ N(X, F, r, U) ×_X X'`
over `X'`, compatibly with the universal quotients (stacksNormalization, Morphisms Lemma 29.26.16, tag 081I, line
2198, for the scheme-theoretic image; AlgebraicModuliForArithmeticGeometry §1.3 for
`Gr_r(g*F) = Gr_r(F) ×_X X'`). In particular the right side is reduced. The open `g⁻¹(U)` is automatically dense in
`X'`, so the left side is in the situation of §1.2: generalisations lift along the flat `g` (stacksNormalization,
Morphisms Lemma 29.26.9, tag 03HV, line 2125), so `g` maps the generic point of every irreducible component of `X'` to
the generic point of an irreducible component of `X`, which lies in the dense open `U` as `X` is locally Noetherian;
and every point of `X'` is a specialisation of such a generic point.

**Checks.**

- For `V ⊆ U`, `π_N⁻¹(V) ≅ V`.
- For `g` the inclusion of `U`, both sides are `U`.
- For the closed immersion `g : {0} → 𝔸²` in the third Check of §1.2 (not flat; here `g⁻¹(U) = ∅` is not dense),
  the fibre product is the exceptional `ℙ¹` while `N({0}, k², 1, ∅)` is empty: flatness is needed.

*Needs:* §1.2; AlgebraicModuliForArithmeticGeometry §§1.3, 5.4 (`ArithmeticModuli.DMSchematicClosure.stack`).

### Examples

For the ideal sheaf `I` of the origin in `𝔸²`, `N(𝔸², I, 1, 𝔸² ∖ 0)` is the blowup of the origin; for
`O ⊕ O/(x)` on `𝔸¹` it is `𝔸¹` itself. For `X` smooth and `F = Ω_{X/k}` it is `X`.

### Dependencies

Layer 0; AlgebraicModuliForArithmeticGeometry §§1.3, 5.4; SchemeAndStackFoundations §§0.11, 0.23; Mathlib
scheme-theoretic images and smooth loci; Tau Ceti vanishing ideals.

## Layer 2: the Nash blowup

### 2.1 Definition

Define *nashBlowup*: for `X` locally of finite type over `k` and `d ∈ ℕ`, `X* = N(X, Ω_{X/k}, d, X_sm^{(d)})`
(§1.2, with `Ω_{X/k}` finite locally free of rank `d` on `X_sm^{(d)}` by §0.3), with *nashBlowupHom*
`ν = π_N : X* → X` and the **Nash cotangent
bundle** *nashCotangent* `ν*Ω_{X/k} → L` (gonzalezSprinberg1982, §1.1–1.2, lines 79–98;
duarteNunezBetancourt2020, Definition 2.1, line 127; castilloDuarteLeytonLiendo2026, Introduction, lines
13–21). The construction `σ.image` is defined for every `X`; the hypotheses enter only the theorems. `X*` is
a `k`-scheme through `ν`.

- `ν⁻¹(X_sm^{(d)}) → X_sm^{(d)}` is an isomorphism and `L` is the identity quotient there.
- `L` is locally free of rank `d`, and `ν*Ω_{X/k} → L` is surjective.
- For `X` in the Setting, `X_sm^{(d)} = X_sm` (§1.1).

**Checks.**

- For `X` smooth of relative dimension `d`, `ν` is an isomorphism and `L = Ω_{X/k}`.
- For the cusp `X = V(y² − x³) ⊆ 𝔸²` over a field of characteristic `0` or `≥ 5`, `X* ≅ 𝔸¹` with `ν(t) = (t², t³)`
  (the normalisation): the tangent quotients `[1 : 3t/2]` tend to `[1 : 0]`. Here
  `ν*Ω_{X/k} ≅ k[t]·dx ⊕ k[t]/(t³)` with `L = k[t]·dx` the quotient by the torsion summand of length three.
- For the node `xy = 0`, in every characteristic, the two branches have tangent quotients `[1 : 0]` and
  `[0 : 1]` (near a point of `y = 0` with `x ≠ 0`, `x` is a unit and the relation `y·dx + x·dy = 0` gives
  `dy = 0`; symmetrically `dx = 0` on `x = 0`), so `X* = 𝔸¹ ⊔ 𝔸¹` separates them; a construction using only
  the reduced fibre of `Ω` over the origin (a single `ℙ¹`) is excluded.
- For `d = 0` and `X = Spec k`, `X* = X`.

*Needs:* §§0.3, 1.1, 1.2; Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentials`,
`isFinitePresentation_relativeDifferentials`.

### 2.2 Properness and the modification property

Prove *nashBlowupHom_isProper* and *nashBlowupHom_isModification*: for `X` in the Setting, `ν` factors as a
closed immersion `X* → P(∧^d Ω_{X/k})` (§1.4) followed by the projection, so `ν` is proper; `ν` is an
isomorphism over `X_sm`, `ν⁻¹(X_sm)` is dense in `X*`, and `ν` is a modification with witness `X_sm` in the
sense of SchemeAndStackFoundations §4.11 (nashModificationNotes2024, Section 2, lines 152–155;
gonzalezSprinberg1982, §1.2, line 94). On every irreducible component `ν` is birational onto a component of
`X`.

**Checks.**

- For the cusp in characteristic `0`, `ν` is finite and birational but not an isomorphism.
- For the surface `y² = x²z` over a field of characteristic `≠ 2` (nobile1975, Example 4, lines 314–324),
  `X* ≅ Bl_0 𝔸²_{u,v}` with `ν` the blowup followed by the normalisation `(u, v) ↦ (u, uv, v²)`, and the
  reduced fibre `ν⁻¹(0)_red ≅ ℙ¹`: `ν` is proper but not finite. The scheme-theoretic fibre is not `ℙ¹`: it
  is cut out by `(u, v²)`, which in the chart `u = vw` is `(vw, v²)`, with the nonzero nilpotent `v` at
  `v = w = 0` (an embedded point), and in the chart `v = us` is the reduced line `(u)`.
- For `X` smooth of relative dimension `d` the witness is `X` itself and `ν` is an isomorphism (§2.5).

*Needs:* §§1.2, 1.4, 2.1; SchemeAndStackFoundations §4.11; AlgebraicModuliForArithmeticGeometry §1.3.

### 2.3 The setting is preserved

Prove *nashBlowup_setting*: for `X` in the Setting, `X*` is reduced, separated and of finite type over `k`,
pure of dimension `d`, and its smooth locus contains `ν⁻¹(X_sm)`, hence is dense (nashModificationNotes2024,
Section 1, lines 109–112, for an embedded variety over an algebraically closed field: the Nash modification is a
variety, proper and birational over `X` and an isomorphism over the regular locus). Route: reducedness and
separatedness from §1.2; finite type since `Gr_d(Ω_{X/k}) → X` is of finite type; the irreducible components
of `X*` are the closures of those of `ν⁻¹(X_sm) ≅ X_sm`, of dimension `d` by SchemeAndStackFoundations §0.7
(dimension equals the transcendence degree of the function field).

**Checks.**

- For the cusp in characteristic `0`, `X* ≅ 𝔸¹` satisfies the Setting with `d = 1`.
- For the cusp in characteristic `2`, `X* ≅ X` is again the cusp, with dense smooth locus.
- For `X = 𝔸²_k ⊔ 𝔸¹_k` with `d = 2` (not in the Setting), `X* = 𝔸²`: the component of the wrong
  dimension is discarded, so pure dimension is needed for `ν` to be surjective.

*Needs:* §§0.3, 1.2, 2.1, 2.2; SchemeAndStackFoundations §0.7; Tau Ceti `TauCeti.IsPureDimensional`.

### 2.4 Universal property

Prove *nashBlowup.lift*: for `X` in the Setting, a reduced scheme `Z`, a morphism `h : Z → X` with
`h⁻¹(X_sm)` dense in `Z`, and a locally free quotient `h*Ω_{X/k} → M` of rank `d`, there is a unique
`q : Z → X*` with `ν ∘ q = h` and `q*L = M` as quotients of `h*Ω_{X/k}`, and `M` is the only such quotient
(nashModificationNotes2024, Section 2, lines 153–162; §1.3). Consequently
`(X*, ν, L)` is unique up to unique isomorphism over `X` among the triples with this property.

Prove *nashBlowup.isIso_lift_iff*: for `X` in the Setting, a surjective `π : X₁ → X` with `X₁` reduced,
`π⁻¹(X_sm)` dense and a locally free rank-`d` quotient of `π*Ω_{X/k}`, the lift `X₁ → X*` is an isomorphism iff
the classifying map `X₁ → Gr_d(Ω_{X/k})` is a closed immersion. Surjectivity is needed: for `X = 𝔸¹ ⊔ 𝔸¹` and
`X₁` one of the two lines, the classifying map is a closed immersion and the lift is not an isomorphism. Route
(the statement is this roadmap's own): by the construction of the lift in §1.3 the classifying map is the lift
`q` followed by the closed immersion `X* → Gr_d(Ω_{X/k})` of §1.2, so it is a closed immersion iff `q` is
(Mathlib `IsClosedImmersion.comp_iff`). If `q` is a closed immersion, its closed image contains `ν⁻¹(X_sm)`:
for `z` there pick `y` with `π(y) = ν(z)`, which exists as `π` is surjective; then `ν(q(y)) = π(y) = ν(z)` lies
in `X_sm`, and `ν` is injective on `ν⁻¹(X_sm)` (§2.1), so `q(y) = z`. As `ν⁻¹(X_sm)` is dense (§2.2) and `X*`
is reduced (§1.2), `q` is a surjective closed immersion onto a reduced scheme, hence an isomorphism (Mathlib
`isIso_of_isClosedImmersion_of_surjective`).

**Checks.**

- For `X = 𝔸²` and `π : Bl_0 𝔸² → 𝔸²` with the pulled-back identity quotient, `π` is projective and birational
  with a quotient, yet `X* = 𝔸²` and the lift is `π`, not an isomorphism; its classifying map is not a closed
  immersion. A projective birational morphism with a quotient is not in general the Nash blowup.
- For the cusp in characteristic `0`, the normalisation `𝔸¹ → X` with `M = k[t]·dx` is the Nash blowup and its
  classifying map is the closed immersion `t ↦ (t², t³, [1 : 3t/2])`.
- `Z = Spec k` mapping to the cusp point with any quotient has `h⁻¹(X_sm) = ∅` and is excluded.

*Needs:* §§1.2, 1.3, 2.1, 2.2; Mathlib `IsClosedImmersion`, `IsClosedImmersion.comp_iff`,
`isIso_of_isClosedImmersion_of_surjective`.

### 2.5 When the Nash blowup is trivial

Prove *nashBlowupHom_isIso_iff*: for `X` in the Setting, `ν` is an isomorphism iff `Ω_{X/k}` admits a locally
free quotient of rank `d`, that is, iff `HasLocallyFreeQuotientOfDifferentials k X d` (§0.7). Route: if `ν` is an
isomorphism, transport `L`; conversely the quotient gives a
section `s : X → Gr_d(Ω_{X/k})` with closed image (`Gr_d` is separated over `X`) agreeing with `σ` on `X_sm`,
so `X* = s(X)` and `ν ∘ s = id` (nashModificationNotes2024, Section 2, lines 170–171;
duarteNunezBetancourt2020, Lemma 2.4, lines 152–182, for one direction).

Corollary *nashBlowupHom_isIso_of_smooth*: if `X → Spec k` is smooth of relative dimension `d` (in particular if
`X` is in the Setting and smooth, §0.3), then `ν` is an isomorphism. Here `X_sm^{(d)} = X`, and `σ_X` is a section of
the separated `Gr_d(Ω_{X/k}) → X`, hence a closed immersion; so `X*` is the closed subscheme `σ_X(X)` and `ν` is
inverse to `X → X*`.
For `X = 𝔸²_k ⊔ 𝔸¹_k`, which is smooth but not of relative dimension `2`, `X* = 𝔸² ≠ X` for `d = 2` (§2.3): the
relative dimension cannot be dropped.

**Checks.**

- Cusp in characteristic `2`: `Ω_{X/k} = (k[x,y]dx ⊕ k[x,y]dy)/(x² dx)` (as `2y = 0` and `3x² = x²`), and
  `dx ↦ 0`, `dy ↦ 1` is a locally free quotient, so `ν` is an isomorphism (nobile1975, Example 1, line 136).
- Cusp in characteristic `3`: the relation is `2y dy`, and `dx ↦ 1`, `dy ↦ 0` is a free quotient
  (nobile1975, Example 2, line 140, with `q = 3`).
- Cusp in characteristic `0`: a free quotient `dx ↦ a`, `dy ↦ b` with `−3x²a + 2yb = 0` would need, in
  `k[[t², t³]]`, `b = (3t/2)a` with `a` or `b` a unit, impossible as `t ∉ k[[t², t³]]`; so `ν` is not an
  isomorphism.

*Needs:* §§0.3, 0.7, 2.1, 2.2, 2.4; AlgebraicModuliForArithmeticGeometry §1.3.

### 2.6 Locality and field base change

Prove *nashBlowup.restrict*: for `X` in the Setting and an open `V ⊆ X`, `V* ≅ ν⁻¹(V)` over `V`, compatibly
with `L` (§1.5 and §0.1 for open immersions). Nash blowups glue and are computed on an affine cover
(nobile1975, Introduction, lines 42–44).

Prove *nashBlowup.baseChange*: for a field extension `k'/k` and `X` in the Setting, `X_{k'}` is in the
Setting (geometrically reduced by §1.1; pure of dimension `d` by
`isPureDimensional_pullback_Spec_map_iff_of_field`; separated and of finite type by base change), and
`(X*)_{k'} ≅ (X_{k'})*` over `X_{k'}`, compatibly with the Nash cotangent bundles. Route: `Ω` commutes with
base change (§0.2), `(X_sm)_{k'} ⊆ (X_{k'})_sm` (`preimage_smoothLocus_le_smoothLocus_pullback_snd`) with `Ω` of
rank `d` there, and it is dense because `X_{k'} → X` is flat, so the generic points of `X_{k'}` map to generic
points of `X`, which lie in `X_sm` (§1.1); then §1.5 with the independence of the open (§1.2) applies.

**Checks.**

- For `X` the cusp over `ℚ` and `k' = ℚ(i)`, both sides are `𝔸¹_{ℚ(i)}`.
- For `V = X_sm`, `V* = V`.
- For `k = 𝔽_p(t)` and `X = Spec k[y]/(y^p − t)` (not in the Setting), `X_{k'}` for `k' = k(t^{1/p})` is
  non-reduced: the Setting hypothesis is what makes base change stay inside the construction's domain.

*Needs:* §§0.1, 0.2, 1.1, 1.2, 1.5, 2.1; Tau Ceti `isPureDimensional_pullback_Spec_map_iff_of_field`,
`preimage_smoothLocus_le_smoothLocus_pullback_snd`.

### 2.7 The Nash iteration

Define *nashIterate*: `X^{(0)} = X` and `X^{(i+1)} = (X^{(i)})*` (with the same `d`), with the composite maps
`X^{(i)} → X` (nobile1975, proof of Theorem 2, lines 202–203; the construction and the question whether its
iteration resolves singularities go back to semple1954, pp. 24–49). Define *NashIterationResolves* `X d` as
`∃ i, X^{(i)} → Spec k is smooth`.

- Evaluation: `X^{(0)} = X` with the identity of `X`, and `X^{(i+1)}` is the Nash blowup of `X^{(i)}` (§2.1, with the
  same `d`), its map to `X` being `ν` for `X^{(i)}` followed by `X^{(i)} → X`. Consequently the `j`-th iterate of
  `X^{(i)}` is `X^{(i+j)}`, for all `i`, `j`.
- Preservation of the Setting: if `X` is in the Setting with this `d`, then every `X^{(i)}` is in the Setting with the
  same `d` (§2.3, by induction on `i`).
- Resolution predicate: *NashIterationResolves* holds for `X` and `d` iff `X^{(i)} → Spec k` is smooth for some `i`; for `X` in the
  Setting, such an `X^{(i)}`, being pure of dimension `d`, is smooth of relative dimension `d` (§0.3).

**Checks.**

- If `X` is smooth over `k` of relative dimension `d` then `X^{(i)} ≅ X` for all `i` (§2.1), and the iteration resolves
  `X` with `i = 0`.
- The cusp in characteristic `0` is resolved with `i = 1`.
- The cusp in characteristic `2` has `X^{(i)} ≅ X` for all `i` (§2.5), so the iteration does not resolve it:
  the predicate depends on the characteristic.
- For the cusp in characteristic `2` with `d = 2` instead of its dimension `1`, `Ω_{X/k}` has rank `1` on `X_sm`, so
  `X_sm^{(2)} = ∅` and `X^{(1)} = ∅`, which is smooth: the iteration with `d = 2` resolves `X` although the
  iteration with `d = 1` does not (previous Check). Likewise `𝔸²_k` with `d = 1` has `X^{(1)} = ∅ ≇ 𝔸²`. The
  predicate and the iterates carry meaning only for `X` in the Setting with its own `d`, which is how Layer 7 uses
  them.

*Needs:* §§0.3, 2.1, 2.3, 2.5.

### Examples

The cusp `y² = x³`: in characteristic `0` or `≥ 5`, `X* = 𝔸¹` with `ν*Ω = L ⊕ k[t]/(t³)`; in characteristics
`2` and `3`, `X* ≅ X`. The node, in every characteristic: `X* = 𝔸¹ ⊔ 𝔸¹`. The Whitney-type surface `y² = x²z`
in characteristic `≠ 2`: `X* ≅ Bl_0 𝔸²_{u,v}` and the reduced fibre `ν⁻¹(0)_red ≅ ℙ¹` (nobile1975, Example 4,
lines 319–324); the scheme-theoretic fibre, cut out by `(u, v²)`, has an embedded point.

### Dependencies

Layers 0 and 1; SchemeAndStackFoundations §§0.7, 4.11; AlgebraicModuliForArithmeticGeometry §1.3; Tau Ceti pure
dimension and smooth locus.

## Layer 3: embedded and blowup descriptions

### 3.1 The Gauss map

Prove *nashBlowup_eq_closure_graph_gaussMap*: let `X` be in the Setting and a closed subscheme of an open
`W ⊆ 𝔸ⁿ_k`. The surjection `O_X^n = Ω_{𝔸ⁿ/k}|_X → Ω_{X/k}` (§0.2) restricted to `X_sm` is classified by the
**Gauss map** `Φ : X_sm → Gr_d(kⁿ)`, `x ↦` the quotient `(kⁿ)* → Ω_{X/k} ⊗ κ(x)` whose dual is `T_x X`
(Conventions). Then `X*` is isomorphic over `X` to the scheme-theoretic image of `(id, Φ) : X_sm → X ×_k Gr_d(kⁿ)`,
and the isomorphism carries `L` to the pullback of the universal quotient of `Gr_d(kⁿ)` (nobile1975,
Introduction, lines 29–44; castilloDuarteLeytonLiendo2026, Introduction, lines 13–21; gonzalezSprinberg1982,
§1.4, lines 105–112). Route: §0.4 embeds `Gr_d(Ω_{X/k})` in `X × Gr_d(kⁿ)` compatibly with the classifying
maps, and a closed immersion preserves reduced closures. Independence of the embedding is automatic.

**Checks.**

- For the line `y = 2x` in `𝔸²`, `Φ` is constant with value `[1 : 2]` (the convention witness).
- For the cusp `y² = x³` over a field of characteristic `0` or `≥ 5`, `Φ(t) = [1 : 3t/2]` on `X_sm` and the closure of
  the graph is `{(t², t³, [1 : 3t/2])} ≅ 𝔸¹`: `3/2` is a unit, so the Grassmann coordinate `3t/2` (which is `4t` in
  characteristic `5`) recovers `t`.
- For the cusp in characteristic `3`, `df = 2y dy`, so `dy = 0` on `X_sm` (where `y` is a unit) and `Φ` is the
  constant `[1 : 0]`; in characteristic `2`, `df = x² dx`, so `dx = 0` on `X_sm` and `Φ` is the constant `[0 : 1]`. In
  both cases the closure of the graph is `X × {Φ} ≅ X`, the cusp, with coordinate ring `k[t², t³]` rather than `k[t]`,
  in agreement with `X* ≅ X` (§2.5): the formula `[1 : 3t/2]` and the conclusion `≅ 𝔸¹` need characteristic `0` or
  `≥ 5`.
- For `X = 𝔸ⁿ` itself, `Φ` is the constant map to the single point of `Gr_n(kⁿ)` and the closure is `X`.

*Needs:* §§0.2, 0.4, 1.2, 2.1; AlgebraicModuliForArithmeticGeometry §1.3.

### 3.2 The Nash blowup as a blowup

Prove *nashBlowup_iso_blowup*: let `X` be in the Setting, `I` an ideal sheaf on `X` and `φ : ∧^d Ω_{X/k} → I`
a surjection that is an isomorphism over `X_sm`. Then `X*` is isomorphic over `X` to the blowup `Bl_I X`
(Tau Ceti `IdealSheafData.blowup`), and `I·O_{X*} ≅ ∧^d L` (nobile1975, Theorem 1, line 105;
nashModificationNotes2024, Section 3, lines 243–247). Route: by §1.4, `X*` is `N(X, ∧^d Ω_{X/k}, 1, X_sm)`.
On `Bl_I X` (reduced, as the Rees algebra of a reduced ring is reduced, with `ν_I⁻¹(X_sm)` dense since the
exceptional divisor is effective Cartier) the composite `ν_I*∧^dΩ → ν_I*I → I·O` is an invertible quotient,
so §1.3 gives `Bl_I X → X*`. On `X*` the map `ν*∧^dΩ → I·O_{X*}` kills the kernel of `ν*∧^dΩ → ∧^d L`
(it vanishes on the dense open `ν⁻¹(X_sm)` and `O_{X*}` is reduced), giving an isomorphism `∧^d L ≅ I·O_{X*}`,
so `I·O_{X*}` is effective Cartier and `blowupLift` gives `X* → Bl_I X`. The composites are identities by the
uniqueness parts (`blowup_hom_ext`, §1.3).

Prove *exists_nashBlowup_blowupPresentation*: every point of `X` has an affine open neighbourhood `V = Spec A`
with an ideal `I ⊆ A` containing a nonzerodivisor and a surjection `∧^d Ω_{A/k} → I` that is an isomorphism
over `V_sm` (nobile1975, proof of Theorem 1, lines 107–116, where the ideal is built from minors of the Jacobian
matrix weighted by functions separating the irreducible components). Route: `∧^dΩ ⊗ Q(A)` is free of rank one
over the total ring of fractions `Q(A)`, a product of the function fields; choose a basis, clear the finitely many
denominators of the images of generators by a nonzerodivisor.

**Checks.**

- For `X = 𝔸¹` and `φ : O·dx → I = (x)`, `dx ↦ x`, the hypotheses hold (`O ≅ (x)`), `I` is invertible and
  `Bl_I X = X = X*`.
- For the cusp in characteristic `0`, `I = (y, x²)` (§3.3) and `Bl_I X = 𝔸¹`; in characteristic `2`, `I = (x²)`
  is principal, generated by a nonzerodivisor, and `Bl_I X = X` (`isIso_blowupToBase_iff`).
- For nonempty `X`, `I = 0` and `φ = 0`, `φ` is surjective onto `I` but not an isomorphism over `X_sm`, and
  `Bl_0 X = ∅ ≠ X*` (the Rees algebra of the zero ideal has no part of positive degree): the isomorphism hypothesis
  cannot be dropped.

*Needs:* §§1.3, 1.4, 2.1; Tau Ceti `IdealSheafData.blowup`, `blowupToBase`, `blowupLift`, `blowup_hom_ext`,
`isIso_blowupToBase_iff`, `SheafOfModules.exteriorPower`.

### 3.3 Hypersurfaces

Prove *nashBlowup_hypersurface*: let `n ≥ 1` and `f ∈ k[x_1, …, x_n]` with `X = V(f) ⊆ 𝔸ⁿ_k` reduced, pure of
dimension `n − 1`, with dense smooth locus, and let `J_f ⊆ O_X` be the image of the ideal `(∂f/∂x_1, …, ∂f/∂x_n)`, which
is also the image of the derivative ideal of `(f)` (ResolutionOfSingularitiesCharacteristicZero §2.15), equal to
`(f) + (∂f/∂x_1, …, ∂f/∂x_n)` since `∂(gf)/∂x_i = g·∂f/∂x_i + f·∂g/∂x_i`. As `Ω_{X/k}` is the quotient of
`O_X dx_1 ⊕ … ⊕ O_X dx_n` by the single relation `df`, `J_f` is the Fitting ideal `Fitt_{n−1}(Ω_{X/k})`, generated by
the `1 × 1` minors of that relation (Tau Ceti's `TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton`,
with `n ≥ 1` for its nonempty basis); so `J_f = Fitt_d(Ω_{X/k})`, `d = n − 1`, depends only on the `k`-scheme `X`,
not on the equation or the embedding. Then `X* ≅ Bl_{J_f} X` over `X` (nobile1975, Remark 2, lines 129–133;
Examples 1 and 2, lines 136–141). Route: the map `∧^{n−1} Ω_{X/k} → O_X`,
`ω ↦ (df ∧ ω)/(dx_1 ∧ … ∧ dx_n)`, sends
`dx_1 ∧ … ∧ dx_j^ ∧ … ∧ dx_n ↦ (−1)^{j−1} ∂f/∂x_j`, is well defined because `df ∧ df = 0`, has image `J_f`,
and is an isomorphism over `X_sm` (a surjection of invertible sheaves there); apply §3.2.

**Checks.**

- Cusp `y² − x³`: `J_f = (2y, 3x²)`, which is `(y, x²)` in characteristic `0` or `≥ 5` (not invertible at the
  origin, `ν` not an isomorphism), `(x²)` in characteristic `2` and `(y)` in characteristic `3` (principal,
  `ν` an isomorphism).
- Node `xy`: `J_f = (y, x)` is the maximal ideal of the origin and `Bl_{J_f} X = 𝔸¹ ⊔ 𝔸¹`.
- The curve `x^p − y^q` in characteristic `p`, with `q ≥ 2` and `gcd(p, q) = 1` (castilloDuarteLeytonLiendo2026,
  lines 33–35, for distinct primes `p` and `q`; nobile1975, Example 2, lines 140–141, for `q = 2 < p`): it is the
  integral curve `t ↦ (t^q, t^p)`, singular at the origin (`f ∈ m²`, so the embedding dimension there is `2 > 1`), and
  `J_f = (q y^{q−1})` is principal, generated by a nonzerodivisor since `q` is a unit, so `ν` is an isomorphism
  although the curve is singular. For `q = 1` the curve `y = x^p` is the smooth line `Spec k[x]`, with `J_f = (1)`;
  for `p | q` the polynomial is `(x − y^{q/p})^p` and `X` is not reduced.
- For `n = 0` and `f = 0`, `X = 𝔸⁰ = Spec k` is reduced and smooth, and pure of dimension `0`, which is the value of
  `n − 1` under natural subtraction; but the empty family of partial derivatives generates `J_f = 0`, so
  `Bl_{J_f} X = ∅` (§3.2) while `X* = Spec k` (§2.1): the hypothesis `n ≥ 1` cannot be dropped. For `n = 1` and
  `f = x_1`, `X = Spec k`, `J_f = (1)` and both sides are `Spec k`.

*Needs:* §§0.2, 3.2; Tau Ceti `IdealSheafData.blowup`, and for the identification of `J_f` with
`Fitt_{n−1}(Ω_{X/k})` only, `TauCeti.fittingIdeal` and `TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton`;
ResolutionOfSingularitiesCharacteristicZero §2.15 (the derivative ideal, for the name of `J_f` only).

### Examples

The cusp in all characteristics through the Jacobian ideal; the node; `x^p = y^q` in characteristic `p` with `q ≥ 2` prime to `p`.

### Dependencies

Layers 0–2; Tau Ceti blowups and Fitting ideals; AlgebraicModuliForArithmeticGeometry §1.3;
ResolutionOfSingularitiesCharacteristicZero §2.15.

## Layer 4: characteristic zero

### 4.1 Coordinates from a free quotient

Prove *exists_coordinates_of_kaehler_surjection*: let `k` be a field, `(R, m, κ)` a local `k`-algebra and
`q : Ω_{R/k} → R^d` a surjection. Then there are `x_1, …, x_d ∈ R` and `k`-derivations `∂_1, …, ∂_d : R → R`
with `∂_i(x_j) = δ_ij`, such that `Ω_{R/k} = (⊕_j R·dx_j) ⊕ ker q`; if `κ` is separable algebraic over `k`
(`Algebra.IsSeparable k κ`; for instance `κ` finite over `k` with `k` of characteristic zero or perfect), the `x_j`
can be chosen in `m` (nashModificationNotes2024, Section 2, lines 194–197, and Section 5, lines
484–501; duarteNunezBetancourt2020, proof of Theorem 3.10, lines 263–268). Route: the `q(dr)` generate `R^d`,
so by Nakayama some `q(dx_j)` reduce to a basis of `κ^d` and are a basis of `R^d`; let `∂_i` be the `i`-th
coordinate of `q ∘ d` in that basis. For `κ` separable algebraic, `κ` is formally étale over `k`
(`Algebra.FormallyEtale.of_isSeparable`), so Tau Ceti's `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`,
applied to the surjection `R → κ` with kernel `m` (`IsLocalRing.ker_residue`), makes `m/m² → κ ⊗_R Ω_{R/k}`,
`a ↦ 1 ⊗ da`, bijective, in particular onto; so the `x_j` may be taken in `m`.

**Checks.**

- For `R = k[x, y]_{(x,y)}` and `q` the identity of `Ω = R dx ⊕ R dy`, `x_1 = x`, `x_2 = y` and `∂_i = ∂/∂x_i`.
- For the cusp in characteristic `3` at the origin, `q(dx) = 1`, `q(dy) = 0`: `x_1 = x`, `∂_1 = ∂/∂x` (well
  defined since `∂(y² − x³) = 0`), and `ker q = R·dy/(y·dy)` is torsion.
- For `d = 0`, there are no coordinates and `ker q = Ω_{R/k}`.
- For `k = 𝔽_p(t)`, `R = k[x]_{(x^p − t)}` (residue field `k(t^{1/p})`, inseparable) and `q(dx) = 1`, coordinates
  exist (`x_1 = x`), but none lies in `m = (x^p − t)`: for `a ∈ R`, `d(a(x^p − t)) = (x^p − t)·da`, so `q(dm) ⊆ m`
  contains no unit. The separability hypothesis of the second clause cannot be dropped.

*Needs:* Mathlib `Derivation`, `KaehlerDifferential`; for the choice in `m`, Tau Ceti
`KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale` and Mathlib `Algebra.FormallyEtale.of_isSeparable`,
`IsLocalRing.ker_residue`.

### 4.2 The Lie derivative and stable annihilators

Define *Derivation.lieDerivative*: for a `k`-algebra `R` and a `k`-derivation `∂ : R → R`, the additive map
`L_∂ : Ω_{R/k} → Ω_{R/k}` with `L_∂(a·db) = ∂(a)·db + a·d(∂b)`. Construct it on `Ω_{R/k} ≅ J/J²`,
`J = ker(R ⊗_k R → R)` (stacksAlgebra, Lemma 10.131.13, tag 00RW, line 15590), as the map induced by the
derivation `∂ ⊗ 1 + 1 ⊗ ∂` of `R ⊗_k R`, which preserves `J` and `J²`.

- `L_∂(a·ω) = ∂(a)·ω + a·L_∂(ω)` and `L_∂ ∘ d = d ∘ ∂`.
- `L_{∂ + ∂'} = L_∂ + L_{∂'}` and `L_{c∂} = c·L_∂` for `c ∈ k`.
- **Stable annihilators.** If `N ⊆ Ω_{R/k}` is an `R`-submodule with `L_∂(N) ⊆ N`, then `Ann_R(Ω_{R/k}/N)` is
  `∂`-stable: for `a` in it and every `ω`, `∂(a)·ω = L_∂(aω) − a·L_∂(ω) ∈ N` (the computation pattern of
  hamann2003, proof of Lemma 0.1, lines 61–64).
- In the situation of §4.1, `L_{∂_i}(dx_j) = d(δ_ij) = 0`, so `N = ⊕_j R·dx_j` is `L_{∂_i}`-stable.
- Agreement on fields: if `R` is a field and `k` has characteristic zero, `L_∂` equals
  DiophantineApproximationAndTranscendence's `lieDerivativeOneForm ∂` (§5.6). Both are `k`-linear
  (`L_∂(c·ω) = ∂(c)·ω + c·L_∂(ω) = c·L_∂(ω)` for `c ∈ k`, as `∂` kills `k`) and satisfy the same rule on
  `a·db`, and `exists_lieDerivativeOneForm` asserts uniqueness of such an operator.

**Checks.**

- For `R = k[x]` and `∂ = d/dx`, `L_∂(x·dx) = dx`, and `L_∂(dx) = 0`.
- For `∂ = 0`, `L_∂ = 0`; for `∂ = x·d/dx` on `k[x]`, `L_∂(dx) = d(x) = dx ≠ 0`, which excludes the model
  `a·db ↦ ∂(a)·db` that differentiates coefficients only.
- On `R = k[x]/(x²)` in characteristic `≠ 2`, `Ω_{R/k} = R·dx/(x·dx)`; for the derivation with `∂(x) = x`,
  `L_∂(dx) = dx` and `L_∂(x·dx) = x·dx + x·dx = 0` in `Ω_{R/k}`, so `L_∂` respects the relation, as the
  construction through `J/J²` guarantees.

*Needs:* Mathlib `KaehlerDifferential`, `Derivation`, `Algebra.TensorProduct`; for the agreement bullet only,
DiophantineApproximationAndTranscendence §5.6 (`exists_lieDerivativeOneForm`).

### 4.3 Minimal primes over a derivation-stable ideal

Prove *Derivation.isStable_of_mem_minimalPrimes*: in a Noetherian ring `R` containing `ℚ`, every minimal
prime over an ideal stable under a derivation `∂` is `∂`-stable (hamann2003, Lemma 0.1, line 56, recorded there as
folklore, line 55). Route:
the radical `J` of a `∂`-stable ideal is `∂`-stable (from `a^n ∈ I` one derives `(∂a)^{2n−1} ∈ I` by repeated
differentiation, dividing by integers); a minimal prime `P` over `J` is `(J : x)` for some `x ∉ J`; for `y ∈ P`,
`x²∂(y) ∈ J`, so `x∂(y) ∈ J` and `∂(y) ∈ P` (hamann2003, lines 58–64).

**Checks.**

- In `ℚ[x]` with `∂ = d/dx`, `(x²)` is not `∂`-stable (`∂(x²) = 2x ∉ (x²)`), so its non-stable minimal prime
  `(x)` is no counterexample; the only `∂`-stable ideals are `0` and `ℚ[x]` (a nonzero stable ideal contains a
  polynomial of least degree `n`, whose `n`-th derivative is `n!` times its leading coefficient, a unit).
- In `ℚ[x, y]` with `∂ = ∂/∂x`, the stable ideal `(y²)` has stable minimal prime `(y)`.
- In `𝔽_p[x]` with `∂ = d/dx`, `(x^p)` is stable while its minimal prime `(x)` is not: the hypothesis
  `ℚ ⊆ R` is needed.

*Needs:* Mathlib `Ideal.minimalPrimes`, `Ideal.radical`, `Derivation`.

### 4.4 A free quotient of the differentials forces smoothness

Prove `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero`: let `k` be a field of characteristic zero and
`X` a reduced scheme over `Spec k`, locally of finite type and pure of dimension `d` (`TauCeti.IsPureDimensional d`).
Then `X → Spec k` is smooth iff `Ω_{X/k}` admits a locally free quotient of rank `d`
(`HasLocallyFreeQuotientOfDifferentials k X d`, §0.7). The substance is the backward implication
(nashModificationNotes2024, Proposition 2.3, lines 179–199, over an algebraically closed field with a proof
through completions; the route below avoids completions). The forward implication: a smooth `X` pure of
dimension `d` has `X_sm^{(d)} = X` (§0.3), so the identity of `Ω_{X/k}` is a quotient as required (§0.7, smooth
schemes). Route of the backward implication, at a closed point `x` with `R = O_{X,x}` and with `q` the stalk at `x`
of the given quotient, a surjection `Ω_{R/k} → R^d` (§0.7, stalk criterion, through Tau Ceti's
`Scheme.relativeDifferentialsStalkEquiv`):

1. §4.1 gives `x_j`, `∂_i` and `Ω_{R/k} = (⊕ R dx_j) ⊕ T`, `T = ker q`.
2. `T_P = 0` at every minimal prime `P`: `R_P` is the local ring at a generic point, which lies in `X_sm`
   (§1.1, `k` perfect), where `Ω` is free of rank `d` (§0.3), and `q_P` is a surjection between free modules of
   rank `d`.
3. `M = Ω_{R/k}/(⊕ R dx_j) ≅ T` and `Ann_R(M)` is `∂_i`-stable for every `i` (§4.2).
4. If `M ≠ 0`, a minimal prime `P` over `Ann_R(M)` is `∂_i`-stable (§4.3). Its contraction to `k[X_1, …, X_d]`
   (via `X_j ↦ x_j`) is stable under all `∂/∂X_i`, hence zero (a nonzero element of least degree would have a
   nonzero derivative of smaller degree in it, or be a nonzero constant). So `trdeg_k κ(P) ≥ d`, the closure of
   `P` has dimension `≥ d` (SchemeAndStackFoundations §0.7), and `P` is a minimal prime of `R` (pure dimension
   `d`), contradicting `M_P = T_P = 0` (2). Hence `T = 0` and `Ω_{R/k}` is free of rank `d`.
5. At a closed point, `κ` is finite over `k`, hence separable as `k` has characteristic zero, so
   `m/m² ≅ κ ⊗_R Ω_{R/k} ≅ κ^d` (Tau Ceti `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`, with
   `Algebra.FormallyEtale.of_isSeparable`) and `dim_κ m/m² = d = dim R` (SchemeAndStackFoundations §0.7); so `R` is
   regular, and §0.5 concludes.

**Checks.**

- For `X` smooth, the hypothesis holds with the identity quotient and the conclusion is trivial.
- For the cusp over `ℚ` (`d = 1`) both sides are false: the cusp is singular and `Ω_{X/k}` has no locally free
  rank-one quotient (§2.5). For the node over `ℚ` both sides are false as well (Layer 0, Examples).
- Over `𝔽_2` the cusp has a free rank-one quotient (§2.5) and is singular: the characteristic hypothesis is
  needed; the proof fails at step 4, where `(x^p)` is `∂`-stable with non-stable minimal prime (§4.3).
- For `X = Spec ℚ[ε]/(ε²)` and `d = 0`, the zero quotient witnesses the right side (§0.7) and `X` is pure of
  dimension `0`, but `X` is not smooth: the reducedness hypothesis is needed for the backward implication.
- For `X = 𝔸²_ℚ ⊔ 𝔸¹_ℚ` and `d = 2`, `X` is reduced and smooth but has no locally free quotient of rank `2` (the
  fibre of `Ω` on `𝔸¹` is one-dimensional, §0.7): pure dimension is needed for the forward implication.
- For `d = 0` and `X = Spec K` with `K/ℚ` finite, both sides hold: `K` is separable over `ℚ`, so `X` is étale, and
  the zero quotient witnesses the right side.

*Needs:* §§0.3, 0.5, 0.7, 1.1, 4.1, 4.2, 4.3; SchemeAndStackFoundations §0.7; Tau Ceti
`TauCeti.IsPureDimensional`, `Scheme.relativeDifferentialsStalkEquiv`,
`KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`; Mathlib `Algebra.FormallyEtale.of_isSeparable`,
`IsRegularLocalRing`.

### 4.5 Nobile's theorem

Prove *nashBlowupHom_isIso_iff_smooth_charZero*: for `k` of characteristic zero and `X` in the Setting, `ν` is
an isomorphism iff `X` is smooth over `k` (nobile1975, Theorem 2, line 143, over an algebraically closed field;
nashModificationNotes2024, Theorem 2.1, line 143; duarteNunezBetancourt2020, Theorem 2.3, line 136). Route:
§2.5 and §4.4. No algebraic closedness is assumed.

**Checks.**

- The cusp over `ℚ` is singular and `ν` is not an isomorphism (§2.5).
- The node in characteristic `0` is singular and `X* = 𝔸¹ ⊔ 𝔸¹ ≠ X`.
- In characteristic `2` the cusp is singular with `ν` an isomorphism: the statement is false without the
  characteristic hypothesis (nobile1975, line 60; duarteNunezBetancourt2020, lines 140–141).

*Needs:* §§2.5, 4.4.

### Examples

For the cusp over `ℚ` at the origin, `Ω = (R dx ⊕ R dy)/(2y dy − 3x² dx)` has torsion element `2dy − 3t dx`
(after pulling back to `k[t]`) killed by `t³`, and no free quotient of rank one.

### Dependencies

Layers 0–2 (the differential form §4.4 needs only §§0.3, 0.5, 0.7 and 1.1; §4.5 adds §2.5); SchemeAndStackFoundations
§0.7; Tau Ceti's pure dimension, the stalks of `Ω_{X/k}` and the conormal bijectivity
`KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale` (§§4.1, 4.4); DiophantineApproximationAndTranscendence
§5.6 (the agreement bullet of §4.2).

## Layer 5: normal varieties in positive characteristic

### 5.1 The p-monomial operators

Prove *exists_pMonomialOperators*: let `R` be a local `k`-algebra of characteristic `p`, `x_1, …, x_d ∈ m` and
`∂_1, …, ∂_d` `k`-derivations with `∂_i(x_j) = δ_ij`. For `α ∈ A = {0, …, p−1}^d` put
`∂^{(α)} = (α!)⁻¹ ∂_1^{α_1} ∘ ⋯ ∘ ∂_d^{α_d}` (`α!` is a unit since `α_i < p`). Then `∂^{(α)}(x^β) = binom(β, α)·x^{β−α}`
for `α ≤ β` and `0` otherwise, so the matrix `(∂^{(α)}(x^β))_{α,β ∈ A}` is unitriangular for the product order on `A`
(entries `1` on the diagonal and `0` unless `α ≤ β`), hence invertible over `R`, and, the `x_j` lying in `m`, it is
the identity modulo `m`; with its inverse `(c_{γα})` the operators `φ_γ = Σ_α c_{γα}∂^{(α)}` are `R^p`-linear and satisfy `φ_γ(x^β) = δ_{γβ}`
(duarteNunezBetancourt2020, proof of Theorem 3.10, lines 271–283; nashModificationNotes2024, lines 394–407).
`R^p`-linearity: every derivation satisfies `∂(r^p f) = r^p ∂f`.

**Checks.**

- For `d = 1`, `p = 2`, `R = k[x]_{(x)}`: `φ_0 = id − x·∂` and `φ_1 = ∂`, so `φ_0(1) = 1`, `φ_0(x) = 0`,
  `φ_1(1) = 0`, `φ_1(x) = 1`.
- For `d = 0`, `A = {∅}` and `φ_∅ = id`.
- For `d = 1`, `p = 3`: the matrix on `1, x, x²` has rows `(1, x, x²)`, `(0, 1, 2x)`, `(0, 0, 1)` (as
  `∂^{(2)}(x²) = 2⁻¹·2 = 1`), and its inverse gives `φ_2 = 2⁻¹∂²`, `φ_1 = ∂ − x∂²` and `φ_0 = id − x∂ + 2⁻¹x²∂²`,
  so `φ_0(x²) = x² − 2x² + x² = 0`. Without the factor `(α!)⁻¹` the operator `∂²` sends `x²` to `2`, and the matrix
  has the diagonal entry `2` at `α = (2)`: it is not unitriangular.
- For the cusp in characteristic `3` with `x_1 = x`, `∂ = ∂/∂x`: the operators exist, `φ` separates
  `1, x, x²`, but `y = t³` is not in the `R^3`-span of `1, x, x²`, so the operators alone do not give freeness
  (§5.3 needs normality).

*Needs:* §4.1; Mathlib `Derivation`, `Matrix`.

### 5.2 The generic Frobenius basis

Prove *frobeniusBasis_functionField*: let `k` be perfect of characteristic `p`, `K` a field finitely generated over
`k` with `dim_K Ω_{K/k} = d`, and `x_1, …, x_d ∈ K` with `dx_1, …, dx_d` a basis of `Ω_{K/k}`. Then the monomials
`x^α`, `α ∈ A`, form a `K^p`-basis of `K`, so `[K : K^p] = p^d` (the rank `p^d` of `R^{1/p}` for a local ring `R`
of a `d`-dimensional variety, with `K = Frac R`, is used in duarteNunezBetancourt2020, proof of Theorem 3.10,
lines 301–302, and nashModificationNotes2024, Section 5, lines 421–422). Route: `Ω_{K/𝔽_p} → Ω_{K/k}` is an
isomorphism because `dc = d((c^{1/p})^p) = 0` for `c ∈ k`; so `dx_1, …, dx_d` is a `K`-basis of `Ω¹_{K/𝔽_p}`, and
`x_1, …, x_d` is a `p`-basis by the converse half of DerivedDeRhamCohomology §0.23 (from a basis of
differentials to a `p`-basis).

**Checks.**

- `K = k(t)`: the basis is `1, t, …, t^{p−1}`.
- `d = 0`, `K` finite over `k`: `K = K^p` (a finite extension of a perfect field is perfect).
- `K = k(t)` with the element `t^p` (whose differential is `0`) is not a `p`-basis: the differentials must form
  a basis.

*Needs:* DerivedDeRhamCohomology §0.23; Mathlib `KaehlerDifferential`, `frobenius`.

### 5.3 Freeness of the Frobenius pushforward

Prove *frobeniusPushforward_free_of_kaehler_surjection*: let `k` be perfect of characteristic `p`, `X` normal and
locally of finite type over `k`, pure of dimension `d`, `x` a closed point, `R = O_{X,x}`, and `q : Ω_{R/k} → R^d` a
surjection. Write `F_*R` for `R` viewed as an `R`-module through the absolute Frobenius; as `R` is a domain,
`r ↦ r^{1/p}` identifies `F_*R` with the subring `R^{1/p}` of a perfect closure of `Frac R`, and the structure map
`R → F_*R` with the inclusion `R ⊆ R^{1/p}`. With `x_j ∈ m`, `∂_i` from §4.1, the `R`-linear map
`ψ : ⊕_{α ∈ A} R e_α → F_*R`, `e_α ↦ x^α` (that is, `Σ r_α e_α ↦ Σ r_α^p x^α`), is an isomorphism; hence the
Frobenius of `R` is flat and `R` is regular (duarteNunezBetancourt2020, proof of Theorem 3.10, lines 284–305;
nashModificationNotes2024, Section 5, lines 408–439). Route:

1. `ψ` is injective: `φ_γ` (§5.1) applied to `Σ r_α^p x^α` returns `r_γ^p`, and `R` is reduced.
2. At the zero prime, `ψ ⊗ K` is bijective by §5.2 applied to `K = Frac R`, where `dx_1, …, dx_d` is a basis of
   `Ω_{K/k}` (generic smoothness, §1.1 and §0.3).
3. At a height-one prime `Q`, `R_Q` is a discrete valuation ring (SchemeAndStackFoundations §0.30). `F_*R_Q` is
   finite: `R_Q` is the localisation `A_P` of the finitely generated `k`-algebra `A` of an affine open containing
   `x` at a prime `P`; the `p`-th power map of `A` is finite by Tau Ceti's `TauCeti.powRingHom_finite` (`k` is
   perfect), so `A = Σ_i A^p g_i` for finitely many `g_i`; and the same `g_i` generate `F_*A_P`, since
   `a/s = a·s^{p−1}/s^p = Σ_i (c_i/s)^p g_i` when `a·s^{p−1} = Σ_i c_i^p g_i` (nashModificationNotes2024, Section 5,
   lines 418–420, for the finiteness). `F_*R_Q` is also torsion-free, hence free of rank `p^d` (step 2), and
   `R_Q → F_*R_Q` splits (its
   cokernel `R_Q^{1/p}/R_Q` is torsion-free: if `s·f ∈ R_Q` with `s ≠ 0`, then `f ∈ Frac R` and `f^p ∈ R_Q`, so `f`
   is integral over the integrally closed `R_Q`). With a splitting `σ_Q`, the map
   `ρ_Q(f) = Σ_γ σ_Q(φ_γ(f)) e_γ` is a surjection of free modules of rank `p^d` with `ρ_Q ∘ ψ_Q = id`, so `ψ_Q` is
   bijective.
4. At primes of height `≥ 2`, `depth R_Q ≥ 2` (Serre's criterion, SchemeAndStackFoundations §4.13) and `0` is the
   only associated prime of the torsion-free `F_*R`; Tau Ceti's `LinearMap.bijective_of_depth` over the Noetherian
   ring `R` (SchemeAndStackFoundations §0.17) gives bijectivity of `ψ`.
5. `F_*R` free implies Frobenius flat, and EnhancedDerivedSheaves §E1.6 `isRegular_of_frobenius_flat` gives `R`
   regular.

**Checks.**

- For `R = k[x_1, …, x_d]_{m}`, `ψ` is the standard identification of `F_*R` with the free module on `x^α`; for
  `d = 1` the basis of `F_*k[t]_{(t)}` is `1, t, …, t^{p−1}`, already a basis of `F_*k[t]` over `k[t]` before
  localising.
- For the cusp in characteristic `3` (not normal), `ψ` is injective but not surjective (`t³ ∉` image), so
  normality is needed in step 3.
- For `d = 0`, `R = k` and `ψ : R → F_*R` is the identity under `k^p = k`: the Frobenius of the perfect field `k`
  is bijective, and `F_*k` is free of rank `1 = p^0`.
- Over the imperfect field `k = 𝔽_p(t)`, take `X = 𝔸¹_k = Spec k[s]`, `x = (s)`, `R = k[s]_{(s)}` and `q(ds) = 1`,
  so `x_1 = s` and `d = 1`. The function field `K = k(s)` has `dim_K Ω_{K/k} = 1` but `[K : K^p] = p²` (with
  `K^p`-basis `t^i s^j`, `0 ≤ i, j < p`), so `F_*R` has rank `p²` while `ψ` has rank `p`, and `t ∈ F_*R` is not of
  the form `Σ r_α^p s^α`: `ψ` is not surjective although `R` is regular. The perfectness of `k` enters through the
  rank count of steps 2 and 3, not through finiteness: `F_*R` is still a finite `R`-module, free on the
  `t^i s^j`, although `k` is not perfect.

*Needs:* §§0.3, 1.1, 4.1, 5.1, 5.2; Tau Ceti `TauCeti.powRingHom_finite`; SchemeAndStackFoundations §§0.17,
0.30, 4.13 (Tau Ceti `LinearMap.bijective_of_depth`, `IsNormalScheme.isDiscreteValuationRing_stalk` and Serre's
criterion); EnhancedDerivedSheaves §E1.6.

### 5.4 The theorem of Duarte and Núñez-Betancourt

Prove `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme`, the differential form: let `p` be a
prime, `k` a perfect field of characteristic `p` and `X` a normal scheme over `Spec k` (Tau Ceti's `IsNormalScheme`),
locally of finite type and pure of dimension `d`. Then `X → Spec k` is smooth iff `Ω_{X/k}` admits a locally free
quotient of rank `d` (`HasLocallyFreeQuotientOfDifferentials k X d`, §0.7) (duarteNunezBetancourt2020, proof of
Theorem 3.10, lines 256–305, which starts from such a quotient, over an algebraically closed field). Route: the
forward implication as in §4.4 (§0.3 and §0.7, smooth schemes); backward, at a closed point `x` the stalk of the
quotient is a surjection `Ω[O_{X,x}⁄k] → O_{X,x}^d` (§0.7, stalk criterion), so `O_{X,x}` is regular by §5.3, and
§0.5 gives smoothness.

Prove *nashBlowupHom_isIso_iff_smooth_of_normal*: for a perfect field `k` of characteristic `p > 0` and `X` normal
in the Setting, `ν` is an isomorphism iff `X` is smooth over `k` (duarteNunezBetancourt2020, Theorem 3.10, line 256,
over an algebraically closed field; nashModificationNotes2024, Theorem 5.1, line 362, where "singular" should read
"nonsingular"). Route: §2.5 identifies `ν` being an isomorphism with `HasLocallyFreeQuotientOfDifferentials k X d`,
and the differential form concludes.

**Checks.**

- The quadric cone `z² = xy` in characteristic `2` is normal (it is `Spec k[s², st, t²]`) and singular, and the
  differential form is consistent: `d(z²) = 0`, so `Ω = O dz ⊕ (O dx ⊕ O dy)/(y dx + x dy)`. A surjection onto `O²`
  near the origin is onto modulo the maximal ideal, where `Ω` has the basis `dx, dy, dz`; so `dx` or `dy` maps to a
  vector `a` or `b` with a unit coordinate, and `ya + xb = 0` forces `y ∈ (x)` or `x ∈ (y)` in the local ring, which
  fails since `O/(x) = k[y, z]/(z²)` has `y ≠ 0` (and symmetrically). The free summand `O dz` alone does not give a
  quotient of rank two.
- For `d = 0`, a normal `X` of dimension `0` over the perfect `k` is a disjoint union of spectra of finite, hence
  separable, extensions of `k`: both sides hold.
- For `X = Spec 𝔽_2[ε]/(ε²)`, which is not normal, and `d = 0`, `X` is pure of dimension `0`, the zero quotient
  witnesses the right side and `X` is not smooth: normality (here, reducedness) cannot be dropped.

- Over the imperfect field `k = 𝔽_p(t)`, `p > 2`, the curve `x^p + y² + t = 0` is regular, hence normal, at the point
  `(y, x^p + t)` and not smooth there (stacksAlgebra, Example 10.140.8, tag 00TY, lines 17720–17726), while
  `Ω = (R dx ⊕ R dy)/(2y dy)` has the free quotient `dx ↦ 1`, `dy ↦ 0`; so `ν` is an isomorphism: the theorem is
  false over imperfect fields.
- The cusp in characteristic `2` or `3` is singular with `ν` an isomorphism; it is not normal.
- The quadric cone `z² = xy` (normal) in characteristic `p ≠ 2` has Jacobian ideal `(x, y, z)`, not invertible, so
  `ν` is not an isomorphism, consistently.

*Needs:* for the differential form, §§0.3, 0.5, 0.7, 5.3 and Tau Ceti `IsNormalScheme`, `TauCeti.IsPureDimensional`,
`Scheme.relativeDifferentialsStalkEquiv`; for the Nash form, in addition §2.5.

### Examples

The imperfect-field curve `x^p + y² + t = 0` over `𝔽_p(t)`; the cusp in small characteristic; the quadric cone.

### Dependencies

Layers 0–2 and §4.1 (the differential form of §5.4 needs only §§0.3, 0.5, 0.7, 1.1 and 4.1; the Nash form adds
§2.5); SchemeAndStackFoundations §§0.17, 0.30, 4.13; EnhancedDerivedSheaves §E1.6; DerivedDeRhamCohomology §0.23;
Tau Ceti `TauCeti.powRingHom_finite`, normal schemes, pure dimension and the stalks of `Ω_{X/k}`.

## Layer 6: the normalised Nash blowup

### 6.1 Definition and basic properties

Define *normalizedNashBlowup*: `X̄* = (X*)^ν`, the normalisation of `X*` in the sense of
AlgebraicModuliForArithmeticGeometry §5.4, with `η : X̄* → X*` and `ν̄ = ν ∘ η` (castilloDuarteLeytonLiendo2026,
lines 20–21; gonzalezSprinberg1982, Introduction, lines 60–69; stacksNormalization, Definition 29.55.1, tag 035N,
line 6498, and Lemma 29.55.3, tag 035P, line 6521). For `X` in the Setting:

- `η` is finite (`ArithmeticModuli.DMNormalization.finite`, `X*` being of finite type over `Spec k`), surjective,
  birational on components, and an isomorphism over the normal locus of `X*`, in particular over `ν⁻¹(X_sm)`;
- `X̄*` is normal, separated and of finite type over `k`, pure of dimension `d`, with dense smooth locus, so it is in
  the Setting;
- `ν̄` is proper, an isomorphism over `X_sm`, and `ν̄⁻¹(X_sm)` is dense.

**Checks.**

- For the cusp in characteristic `0`, `X̄* = X* = 𝔸¹`.
- For the cusp in characteristic `2`, `X* ≅ X` and `X̄* = 𝔸¹`: the normalised Nash blowup resolves it in one step
  while the Nash iteration never does (§2.7).
- For the node `xy = 0`, in every characteristic, `X* = 𝔸¹ ⊔ 𝔸¹` is already normal and `η` is the identity; a
  definition normalising `X` instead of `X*` would give the same scheme here but differs for the surface
  `y² = x²z` in characteristic `≠ 2`, whose normalisation is finite over `X` while `X̄* = X*` has a `ℙ¹` over
  the origin (nobile1975, Example 4). In characteristic `2` the Jacobian ideal of that surface is the
  principal ideal `(x²)` on an integral surface, so `X* = X` (§3.3) and the two definitions agree there.

*Needs:* §§2.1–2.3; AlgebraicModuliForArithmeticGeometry §5.4; SchemeAndStackFoundations §0.30.

### 6.2 Universal property

Prove *normalizedNashBlowup.lift*: for `X` in the Setting, a locally Noetherian normal scheme `Z`, a morphism
`h : Z → X` sending
generic points of irreducible components of `Z` to generic points of irreducible components of `X`, and a locally
free rank-`d` quotient `h*Ω_{X/k} → M`, there is a unique `Z → X̄*` over `X` compatible with the quotients
(stacksNormalization, Lemma 29.55.5(4), tag 035Q, line 6570, which asks only that `Z` be normal; the locally
Noetherian hypothesis is that of the setting of AlgebraicModuliForArithmeticGeometry §5.4, whose lifting bullet
the route uses; §2.4). Route: §2.4 gives `q : Z → X*`, which maps generic points of `Z` into
`ν⁻¹(X_sm) ≅ X_sm` and hence to generic points of `X*`; the normalisation's universal property
(AlgebraicModuliForArithmeticGeometry §5.4) lifts `q`. The hypothesis on generic points makes `h⁻¹(X_sm)` dense:
it is open and contains the generic point of every irreducible component of `Z`, and every point of `Z` is a
specialisation of one of them.

**Checks.**

- For `Z = X̄*` itself the lift is the identity.
- For the cusp in characteristic `2` and `Z = 𝔸¹` (normalisation) with `M` the pullback of the free quotient
  `dx ↦ 0`, `dy ↦ 1`, the lift is the isomorphism `𝔸¹ ≅ X̄*`.
- For `d ≥ 1` and a closed point `x ∈ X_sm`, the morphism `Spec κ(x) → X_sm` does not map a generic point to a
  generic point (every irreducible component of `X` has dimension `d ≥ 1`, so its generic point is not closed); it
  still factors (through the isomorphism over `X_sm`) but is outside the hypotheses, which are those of the
  normalisation. For `d = 0` the bound is needed: for `X = Spec k` (§2.1) the closed point is the generic point,
  `Spec k → X` is the identity, the hypotheses hold and the lift is the identity of `X̄* = X`.

*Needs:* §§2.4, 6.1; AlgebraicModuliForArithmeticGeometry §5.4.

### 6.3 Locality and separable base change

Prove *normalizedNashBlowup.restrict*: for `V ⊆ X` open, `V̄* ≅ ν̄⁻¹(V)` over `V` (stacksNormalization, Lemma
29.54.6, tag 035K, line 6332, for the normalisation over an open, applied to the inclusion of the generic points of
`X*`; §2.6 and normalisation commuting with open immersions, AlgebraicModuliForArithmeticGeometry §5.4).

Prove *normalizedNashBlowup.baseChange*: for `X` in the Setting and a separable extension `k'/k` in the sense of
the Conventions (`Algebra.IsTranscendentalSeparable k k'`; neither finite nor algebraic is assumed),
`(X̄*)_{k'} ≅ (X_{k'})̄*` over `X_{k'}` (stacksVarieties, Lemma 33.27.5, tag 0C3N, line 2256, for the normalisation of a locally
algebraic `k`-scheme under a separable extension of `k`, applied to `X*`; §2.6 for `(X*)_{k'} ≅ (X_{k'})*`).
Route, after §2.6: let `U₀ = ν⁻¹(X_sm)`, a dense open of `X*` over which `η` is an isomorphism, with `η⁻¹(U₀)`
dense in `X̄*` (§6.1). The projections `(X*)_{k'} → X*` and `(X̄*)_{k'} → X̄*` are flat, so they send generic
points of irreducible components to generic points; hence `(U₀)_{k'}` and `(η⁻¹U₀)_{k'}` are dense opens
containing every generic point, and `η_{k'} : (X̄*)_{k'} → (X*)_{k'}` is finite and restricts to an isomorphism
`(η⁻¹U₀)_{k'} ≅ (U₀)_{k'}`. The inclusion of the generic points of `(X*)_{k'}` therefore factors through the
integral `η_{k'}`, and Mathlib's `Scheme.Hom.normalizationDesc` gives a morphism `((X*)_{k'})^ν → (X̄*)_{k'}` over
`(X*)_{k'}` (AlgebraicModuliForArithmeticGeometry §5.4 identifies `((X*)_{k'})^ν` with this relative
normalisation). By §0.6, `(X̄*)_{k'}` is normal, so over an affine open its ring of sections is a finite product
of normal domains, integrally closed in its total ring of fractions, which is the product of the residue fields at
its generic points; Tau Ceti's `Scheme.Hom.isIso_normalizationDesc_iff` then makes the morphism an isomorphism (in
the source's terms, stacksNormalization, Lemma 29.55.5(3), tag 035Q, line 6566: the normalisation of the target
factors through an integral morphism that is birational over quasi-compact opens, and is the normalisation of its
source, an isomorphism for a normal source by Lemma 29.55.9, tag 0H7D, line 6636). For finite separable `k'/k`
there is also a shorter route: `Spec k' → Spec k` is smooth, the base change of the inclusion of generic points of
`X*` is the inclusion of generic points of `(X*)_{k'}` because `κ(ξ) ⊗_k k'` is a finite product of fields, and
Mathlib's `normalizationPullback` is an isomorphism along smooth maps.

**Checks.**

- For `V = X_sm`, `V̄* = V`.
- For the cusp over `ℚ` and the finite separable `k' = ℚ(i)`, both sides are `𝔸¹_{ℚ(i)}`, and both routes apply.
- For the cusp over `ℚ` and the transcendental `k' = ℚ(u)`, both sides are `𝔸¹_{ℚ(u)}`: `X̄* = 𝔸¹_ℚ`, and the cusp
  over `ℚ(u)`, of characteristic `0`, has `(X_{k'})* = (X_{k'})̄* = 𝔸¹_{ℚ(u)}` (§2.1). Here `Spec ℚ(u) → Spec ℚ` is
  not of finite type, hence not smooth, and only the general route reaches the case; a statement for finite
  separable extensions alone would miss it.
- For `k = 𝔽_p(t)`, `p > 2`, the regular curve `C : x^p + y² + t = 0` has `C̄* = C* = C`, but over the inseparable
  `k' = k(t^{1/p})`, `C_{k'}` is the non-normal curve `(x + t^{1/p})^p + y² = 0` (§0.6) with `(C_{k'})* = C_{k'}`
  (the free quotient `dx ↦ 1`, `dy ↦ 0` persists) and `(C_{k'})̄* = 𝔸¹ ≠ C_{k'} = (C̄*)_{k'}`; the comparison
  `𝔸¹ → C_{k'}`, `s ↦ (−s² − t^{1/p}, s^p)`, is bijective and not an isomorphism: separability is needed.

*Needs:* §§0.6, 2.6, 6.1; AlgebraicModuliForArithmeticGeometry §5.4; Mathlib `Scheme.Hom.normalizationDesc`,
`Scheme.Hom.normalizationPullback`, `Algebra.IsTranscendentalSeparable`; Tau Ceti
`Scheme.Hom.isIso_normalizationDesc_iff`.

### 6.4 Isomorphism criteria

Prove *normalizedNashBlowupHom_isIso_iff*: for `X` in the Setting, `ν̄` is an isomorphism iff `X` is normal and `ν`
is an isomorphism (nashModificationNotes2024, Section 6, lines 515–517; stacksNormalization, Lemma 29.55.9, tag
0H7D, line 6636). Route: if `ν̄` is an isomorphism, `s = η ∘ ν̄⁻¹` is a section of `ν`, a closed immersion (`ν` is
separated) whose image contains the dense `ν⁻¹(X_sm)`, so `s` is a surjective closed immersion into the reduced `X*`
and `ν` is an isomorphism (`isIso_of_isClosedImmersion_of_surjective`); `X ≅ X̄*` is normal. Conversely, if `X` is
normal and `ν` is an isomorphism, `X*` is normal and `η` is an isomorphism (AlgebraicModuliForArithmeticGeometry §5.4).

Corollaries: in characteristic zero (§4.5), and over a perfect field of characteristic `p` (§5.4), `ν̄` is an
isomorphism iff `X` is smooth over `k`.

**Checks.**

- For the cusp in characteristic `2`, `ν` is an isomorphism, `X` is not normal, and `ν̄` is not an isomorphism.
- For `X` smooth of relative dimension `d`, both are isomorphisms (§2.5, and `X` is normal).
- Over `𝔽_p(t)`, `p > 2`, the regular curve `x^p + y² + t = 0` has `ν̄` an isomorphism without being smooth: the
  perfectness hypothesis of the corollary is needed.

*Needs:* §§2.5, 4.5, 5.4, 6.1; Mathlib `isIso_of_isClosedImmersion_of_surjective`; AlgebraicModuliForArithmeticGeometry §5.4.

### Examples

The cusp in characteristic `2`: `X* ≅ X`, `X̄* = 𝔸¹`. The regular non-smooth curve over `𝔽_p(t)`: `ν` and `ν̄` are
isomorphisms.

### Dependencies

Layers 2, 4, 5 and §0.6; AlgebraicModuliForArithmeticGeometry §5.4; SchemeAndStackFoundations §0.30 (Tau Ceti
`IsNormalScheme`); Mathlib relative normalisation, `isIso_of_isClosedImmersion_of_surjective` and
`Algebra.IsTranscendentalSeparable`; Tau Ceti `Scheme.Hom.isIso_normalizationDesc_iff`.

## Layer 7: iteration and the never-resolves principle

### 7.1 The normalised iteration

Define *normalizedNashIterate*: `Y_0 = X`, `Y_{i+1} = (Y_i)̄*` (with the same `d`), with the composite maps
`Y_i → X`, and *NormalizedNashIterationResolves* `X d` as `∃ i, Y_i → Spec k is smooth` (castilloDuarteLeytonLiendo2026,
Introduction, lines 28–32 and 52–55).

Prove *nashIterate_of_smooth* and *normalizedNashIterate_of_smooth*: if `X` is in the Setting with this `d` and smooth
over `k` (so smooth of relative dimension `d`, §0.3), then `X^{(i)} ≅ X ≅ Y_i` over `X` for all `i`, by induction on
`i` (§2.5 for `ν`; §6.4 for `ν̄`, a smooth `X` being normal).

- Evaluation: `Y_0 = X` with the identity of `X`, and `Y_{i+1}` is the normalised Nash blowup of `Y_i` (§6.1, with
  the same `d`), its map to `X` being `ν̄` for `Y_i` followed by `Y_i → X`. Consequently the `j`-th normalised
  iterate of `Y_i` is `Y_{i+j}`.
- Preservation of the Setting: if `X` is in the Setting with this `d`, then every `Y_i` is in the Setting with the same
  `d`, and `Y_i` is normal for every `i ≥ 1` (§6.1); `Y_0 = X` is normal only when `X` is.
- Resolution predicate: *NormalizedNashIterationResolves* holds for `X` and `d` iff `Y_i → Spec k` is smooth for some `i`.
- Smooth stabilisation: for `X` in the Setting, if `Y_i` is smooth over `k` then `Y_j ≅ Y_i` over `Y_i` for every
  `j ≥ i` (`Y_i` is pure of dimension `d`, hence smooth of relative dimension `d` by §0.3, and the theorem above
  applies to it); likewise, if `X^{(i)}` is smooth then `X^{(j)} ≅ X^{(i)}` for every `j ≥ i`.

**Checks.**

- The cusp in characteristic `0`: `Y_1 = 𝔸¹`, resolved at `i = 1`.
- The cusp in characteristic `2`: `Y_1 = 𝔸¹` is smooth, while every `X^{(i)} ≅ X`.
- For `i = 0`, `Y_0 = X` whether or not `X` is normal: for the cusp in characteristic `2`, `Y_0` is the non-normal
  cusp, `Y_1 = 𝔸¹` is normal and `X^{(1)}` is the cusp again, three different values: the normality bullet needs
  `i ≥ 1`, and for this cusp the two iterations already differ at index `1`.

*Needs:* §§0.3, 2.5, 2.7, 6.1, 6.4.

### 7.2 Open subschemes propagate

Prove *iterate_openSubscheme*: for `W` in the Setting, an open `U ⊆ W` and a `k`-isomorphism `U ≅ Z`, the `i`-th
Nash iterate of `W` contains an open subscheme `k`-isomorphic to the `i`-th Nash iterate of `Z` (both taken with the
`d` of the Setting), for every `i`; the same holds for the normalised iterates. Consequently, for `X` in the Setting
with normalised iterates `Y_i` (§7.1), if `Y_m` contains an open subscheme `k`-isomorphic to `X` for some `m ≥ 1`,
then `Y_{m+i}` contains an open subscheme `k`-isomorphic to `Y_i` for all `i`, and `Y_{jm}` contains one
`k`-isomorphic to `X` for all `j ≥ 1`; likewise for the Nash iterates `X^{(i)}` (§2.7) when `X^{(m)}` contains an
open subscheme `k`-isomorphic to `X` (castilloDuarteLeytonLiendo2026, Theorem, lines 58–67: the consequence drawn
there from items (i)–(iii) uses this propagation without stating it). Route: §2.6 and §6.3 (locality), and the
transport of Nash blowups along `k`-isomorphisms (§2.4 uniqueness); for the consequence, take `W = Y_m` (in the
Setting by §7.1) and `Z = X`, use that the `i`-th normalised iterate of `Y_m` is `Y_{m+i}` (§7.1), and induct on
`j`, an open subscheme of an open subscheme being open.

**Checks.**

- For `U = W` and `Z = W`, the statement is the identity.
- For the cusp in characteristic `2`, `X^{(1)} ≅ X`, and the conclusion `X^{(j)} ⊇ X` holds for all `j`.
- For `U = Z = W_sm`, the iterates of `U` are `U` itself (§7.1, `U` being smooth and in the Setting), consistent with
  `ν⁻¹(W_sm) ≅ W_sm`.

*Needs:* §§2.4, 2.6, 2.7, 6.3, 7.1.

### 7.3 The never-resolves principle

Prove *not_normalizedNashIterationResolves_of_openSubscheme*: let `X` be in the Setting and singular, and suppose
that for some `m ≥ 1` the iterate `Y_m` contains an open subscheme `k`-isomorphic to `X`. Then no `Y_i` is smooth over
`k`. The same holds for the Nash iteration with `X^{(m)}` (castilloDuarteLeytonLiendo2026, Theorem, lines 58–67,
"Consequently …"). Route: if `Y_i` were smooth, `Y_n ≅ Y_i` for `n ≥ i` (§7.1); choose `j` with `jm ≥ i`; `Y_{jm}`
contains an open subscheme isomorphic to the singular `X` (§7.2), and an open subscheme of a smooth scheme is smooth.

In the form in which the theorem of Castillo, Duarte, Leyton-Álvarez and Liendo is applied: a normal singular `X` in the
Setting whose first or second normalised Nash blowup contains an open subscheme `k`-isomorphic to `X` is not resolved by
the normalised Nash iteration; if its Nash blowup contains such an open subscheme, it is not resolved by the Nash
iteration. The existence of such toric `X` in every dimension `d ≥ 4` is the consumer's theorem.

**Checks.**

- With `m = 0` the hypothesis holds for every `X` (`Y_0 = X`) and the conclusion fails for the cusp in characteristic `0`
  (`Y_1` smooth): `m ≥ 1` is needed.
- For `X` smooth the hypothesis of singularity fails, and indeed `Y_0` is smooth.
- The cusp in characteristic `2` with `m = 1` for the Nash iteration (`X^{(1)} ≅ X`): no `X^{(i)}` is smooth, matching §2.7;
  its normalised iteration is resolved, matching §7.1, since `Y_1 = 𝔸¹` contains no open subscheme isomorphic to the cusp.

*Needs:* §§7.1, 7.2.

### Examples

The cusp in characteristic `2` is the smallest instance of §7.3 for the Nash iteration. The instances for the normalised
iteration in dimension `d ≥ 4` are the toric varieties of castilloDuarteLeytonLiendo2026 (statement only here).

### Dependencies

Layers 2 and 6.

## Downstream consumers

A toric roadmap computing Nash blowups of normal toric varieties through logarithmic Jacobian ideals
(castilloDuarteLeytonLiendo2026, Section 1; nashModificationNotes2024, Section 6) consumes §1.2, §§2.1–2.6, §3.2,
Layer 6 and §7.3, and proves the existence of the dimension-four examples. A Part II on higher-order Nash blowups and on
the normalised Nash transformation of surfaces consumes §§1.2–1.5, Layer 2 and Layer 6. Roadmaps on polar varieties and
Whitney conditions (teissier1982, pp. 314–491) consume the Nash cotangent bundle of §2.1 and the Gauss map of §3.1.

## References

- Augusto Nobile; [Some properties of the Nash blowing-up](https://msp.org/pjm/1975/60-1/pjm-v60-n1-p24-s.pdf); Pacific J.
  Math. 60 (1975), 297–305 (`nobile1975`).
- Augusto Nobile; [Notes on Nash modification](https://arxiv.org/abs/2404.09102v1); arXiv:2404.09102v1 (`nashModificationNotes2024`).
- Daniel Duarte, Luis Núñez-Betancourt; [Nash blowups in prime characteristic](https://arxiv.org/abs/2001.10491v2);
  arXiv:2001.10491v2, Rev. Mat. Iberoam. 38 (2022) (`duarteNunezBetancourt2020`).
- Federico Castillo, Daniel Duarte, Maximiliano Leyton-Álvarez, Alvaro Liendo; [Nash blowup fails to resolve singularities in
  dimensions four and higher](https://arxiv.org/abs/2409.19767v3); arXiv:2409.19767v3, Ann. of Math. 203 (2026)
  (`castilloDuarteLeytonLiendo2026`).
- Gerardo González-Sprinberg; [Résolution de Nash des points doubles rationnels](https://www.numdam.org/item/AIF_1982__32_2_111_0.pdf);
  Ann. Inst. Fourier 32 (1982), 111–178 (`gonzalezSprinberg1982`).
- Eloise Hamann; [A question about differential ideals](https://arxiv.org/abs/math/0311006v1); arXiv:math/0311006v1 (`hamann2003`).
- Jarod Alper; [Stacks and Moduli](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-8-19-24.pdf); version of
  19 August 2024 (`alperModuli`).
- The Stacks Project Authors; [Morphisms of Schemes](https://stacks.math.columbia.edu/tag/01QL) (`stacksNormalization`),
  [Varieties](https://stacks.math.columbia.edu/tag/056V) (`stacksVarieties`), [Commutative Algebra](https://stacks.math.columbia.edu/tag/00TT)
  (`stacksAlgebra`).
- Background, cited by locator: Heisuke Hironaka, *On Nash blowing-up*, Arithmetic and Geometry II, Progr. Math. 36
  (1983), 103–111, Section 1 (`hironaka1983`); Mark Spivakovsky, *Sandwiched singularities and desingularization of
  surfaces by normalized Nash transformations*, Ann. of Math. 131 (1990), 411–491, Introduction (`spivakovsky1990`);
  J. G. Semple, *Some investigations in the geometry of curve and surface elements*, Proc. London Math. Soc. (3) 4
  (1954), 24–49 (`semple1954`); Bernard Teissier, *Variétés polaires II*, LNM 961 (1982), 314–491 (`teissier1982`);
  Alexander Grothendieck, Jean Dieudonné, *Éléments de géométrie algébrique I* (1971), §9.7 (`ega1`).
