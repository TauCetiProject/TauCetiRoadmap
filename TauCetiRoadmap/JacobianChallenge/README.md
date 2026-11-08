# Roadmap: the Jacobian challenge

**Summary.** For a smooth, proper, geometrically connected curve `X` over a field `k`, build the
**Jacobian** `Jac X = Pic⁰_{X/k}` as an abelian variety over `k` representing the degree-zero
Picard fppf sheaf on all test schemes, constructed without a rational point and compatible with
field base change; for every `k`-rational point `x₀`, build the Abel–Jacobi morphism
`x ↦ 𝒪(x − x₀)` and prove its universal (Albanese) property, that it is a closed immersion in
genus at least one and an isomorphism in genus one, and that `dim Jac X` is the genus. This is
Kevin Buzzard's Jacobian challenge in the algebraic-geometry formulation due to Christian Merten:
the challenge is designed with checks along the way, so that a construction passing them all has
the definitions right; the point is the definitions, not only the theorems. The prerequisite
tower is built from Mathlib's schemes and Tau Ceti's divisor classes, coherent cohomology,
Picard functors and abelian varieties: line bundles, divisors and degree (Layer A); coherent
cohomology over `k` with finiteness, Serre duality through a named trace and Riemann–Roch
(Layer B); relative coherent cohomology, base change and symmetric powers (Layer C); the relative
Picard functor, its representability and the Jacobian by Galois descent (Layer D); abelian
varieties, duals, polarizations and multiplication (Layer E); Abel–Jacobi, genus one, the closed
immersion and base change (Layer F).

## Scope and ownership

**Owned here.** The curve applications of the Weil/Cartier divisor, line-bundle and degree APIs
on the standing curve (Layer A); coherent sheaves and their cohomology on a proper scheme over
`k` with finite-dimensionality, the genus, Serre duality through the residue trace on smooth
curves, and Riemann–Roch for line bundles on the standing curve without a rational point
(Layer B); coherence of higher direct images under proper morphisms over locally Noetherian
bases without flatness, flat base change over a non-affine base, semicontinuity and cohomology
and base change in every degree, Grauert's theorem, and the Hilbert scheme of points (symmetric
powers) of a curve (Layer C); the Picard functor, sheaf and rigidified functor and their
comparison, the Picard–Brauer obstruction, the Picard scheme as a named representing object over
an arbitrary base, Hilbert quotients for Picard charts, representability of the Picard scheme of
a projective geometrically integral scheme over any field, the degree-zero piece and the Abel
maps of a curve, the neutral component with its smoothness, properness and projectivity, and
the Jacobian over any field by Galois descent (Layer D); the theorems of the cube
and square, projectivity of abelian varieties, the dual abelian variety with its Poincaré bundle
and duality API, polarizations and theta, the Picard pullback along the Abel map and
autoduality, and multiplication by `n` (Layer E); the Abel–Jacobi morphism, its Albanese
property, the genus-one and closed-immersion theorems and base change (Layer F).

**Left to other roadmaps.**

- The degree-`d` components `Pic^d_{X/k}` of a curve over a field and their torsor structure
  under `Pic⁰_{X/k}`, with the period and index of a genus-one curve, are
  SchemeAndStackFoundations §3.6 (`picardComponent`, `picardComponent_torsor`), which consumes
  Layer D's Picard scheme. The Picard scheme as a named representing object over an arbitrary
  base (`HasPicardScheme`, `picardScheme`, `picardSchemeIso`, its group law, uniqueness and base
  change) is D.2 here. JacobianChallengePartII §0.3 proves `HasPicardScheme` for smooth
  projective curve families over a noetherian base and consumes `picardScheme`; its §§0.1–0.2
  and 0.4 own, over a general base, the local constancy of the fibre degree, the degree
  components and their torsor structure, and its §§2.1 and 2.6 the section-free Abel and
  difference maps of a curve without a rational point (the map of the curve into its degree-one
  torsor and the Albanese torsor); it consumes Layers A–F. This roadmap states nothing about
  `Pic^d` for `d ≠ 0` beyond the translations by `𝒪(d·x₀)` that its own Abel maps use.
- Serre duality and Riemann–Roch on Cohen–Macaulay and Gorenstein curves, for coherent and
  locally free sheaves, are SchemeAndStackFoundations §2.20 (`cm_serre_duality`,
  `curve_dualizing_comparison`) and §3.3 (`vectorBundle_riemann_roch`, `curve_serre_duality`),
  with StableReduction Layer 2's invertible dualizing sheaf of a Gorenstein curve (its contract
  J-B / SR-2); they restrict to B.2 on smooth curves and consume Layer B.
- Picard stacks, universal sections and the Abel maps of a curve without a base point are
  SchemeAndStackFoundations §3.7, a consumer of Layer D.
- General relative Picard algebraic spaces are AlgebraicModuliForArithmeticGeometry §7.3;
  nothing here depends on them.
- The theorem on formal functions is SchemeAndStackFoundations §4.9 (consumed in Layer C);
  Hilbert and Quot schemes over a Noetherian base are its §4.14, which consumes Layer C and is
  consumed in Layer D. C.4's Hilbert scheme of points of a curve over a field is the case of
  constant Hilbert polynomial, built by gluing affine pieces with no projective embedding and no
  Quot scheme, so that Layer C does not depend on §4.14. Descent of quasi-coherent sheaves and of
  morphism properties are its §1.1 and §0.11; limits of schemes and finite-presentation
  approximation are its §0.9; Chow's lemma is its §4.12.
- Already proved in Tau Ceti and consumed, not restated (listed under the supplier contracts):
  the higher direct image functors `R^q f_*`; flat base change of cohomology over an affine base;
  top-degree semicontinuity and degree-zero cohomology and base change on schemes covered by two
  affines; the degree of a line bundle on a proper integral curve with `deg L = χ(L) − χ(𝒪_X)`,
  `Pic⁰ = ker deg` and Riemann–Roch for line bundles with a rational point or with exact
  constants; point separation of the Abel–Jacobi map in positive genus; the elliptic curve of a
  Weierstrass equation as an abelian variety with `E(k) ≅ Pic⁰`. Layers A–C and F state only what
  remains, each saying how it differs.
- Abelian schemes over a general base, their duals and polarizations are
  AbelianSchemesAndArithmeticModuli, a consumer of Layer E's field theory.
- Mathlib's group law on the points of an elliptic curve (built through the class group) is
  consumed in Layer F's genus-one comparison, not rebuilt.

Suggested library home: `TauCeti/AlgebraicGeometry/Jacobian/`, with supporting theories under
`TauCeti/AlgebraicGeometry/` (divisors, cohomology, Picard, curves, abelian varieties).

## Conventions

- **Standing curve.** `X` is smooth, proper and geometrically connected of relative dimension
  one over a field `k` (`SmoothOfRelativeDimension 1`, `IsProper`, `GeometricallyConnected` for
  the structure morphism). Such a curve is geometrically integral (smoothness gives geometric
  reducedness; regular and connected gives irreducible), and this is recorded as a theorem, never
  assumed. Over imperfect fields every hypothesis is a geometric adjective ("geometrically
  connected", "geometrically integral"), never bare connectedness.
- **The rational point.** A `k`-rational point `x₀`, a morphism `𝟙_(Over (Spec k)) ⟶ X`, is a
  hypothesis exactly of the statements that use it: the Abel–Jacobi morphism, its universal
  property and the rigidified comparisons. `Jac X` is constructed without one (Layer D).
- **One genus.** The genus is Tau Ceti's `Scheme.genus`, `dim_k H¹(X, 𝒪_X)`, guarded by
  finite-dimensionality; no other genus is defined, and the other classical genera are theorems
  about it (Layer B).
- **Degree and Euler characteristic.** `χ(F) = dim_k H⁰(X, F) − dim_k H¹(X, F)` is the Euler
  characteristic and is never called a degree. The degree of a line bundle is the degree of the
  divisor of a nonzero rational section, `Σ_x [κ(x) : k]·ord_x`; that it equals
  `χ(L) − χ(𝒪_X)` (Tau Ceti's `InvertibleSheaf.eulerDegree`) is Tau Ceti's
  `InvertibleSheaf.eulerDegree_eq_relativeDegree`, and `χ(L) = deg L + 1 − g` is Riemann–Roch
  (Layers A–B). Degrees are taken over the field the scheme is regarded over: for a field
  extension `K/k`, `deg_K L_K = deg_k L`, while a `K`-scheme regarded over `k` has
  `deg_k = [K : k]·deg_K`.
- **Three Picard objects.** The Picard *stack*, the Picard *sheaf* `Pic_{X/k}` (fppf
  sheafification of `T ↦ Pic(X_T)/Pic(T)`) and the *rigidified functor* (line bundles
  trivialized along `x₀`) are kept distinct; `Pic⁰` as an abstract group is `ker deg`, and the
  functorial `Pic⁰_{X/k}` is the degree-zero subsheaf (Layer D).
- **Representability is data with laws.** A representable functor has a named representing
  object (Mathlib's `Functor.reprX`) and a named representing isomorphism; no statement is an
  existential "some scheme represents". The relative Picard fppf sheaf takes values in
  `AddCommGrpCat.{u+1}` while morphisms of `Over S` lie in `Type u`; `Functor.RepresentableBy`
  allows this, and `uliftYoneda.{u+1}` is the one universe adapter. No statement shrinks the
  sheaf to `Type u`.
- **Trace and residues.** The Serre-duality trace `tr_{X/k} : H¹(X, Ω_{X/k}) → k` is normalized
  as the sum of residues at closed points, with the residue at a closed point `x` the `k`-linear
  residue of Tate, which is `Tr_{κ(x)/k}` of the classical residue when `κ(x)/k` is separable and
  is defined for every residue field (Layer B).
- **Signs.** The Abel–Jacobi morphism is `a(x) = 𝒪(x − x₀)`; the Mumford homomorphism is
  `φ_L(a) = t_a^* L ⊗ L⁻¹`; on an elliptic curve with origin `0`, `φ_{𝒪([0])}(b) = 𝒪([−b] − [0])`
  and the Abel map `b ↦ 𝒪([b] − [0])` differ by `[−1]` (Layer E).
- **Jacobian and Albanese.** `Pic⁰` is contravariant in the curve and the Albanese variety is
  covariant; for a pointed curve the two are canonically isomorphic and `isAlbanese_abelJacobi`
  states exactly that, so no separate Albanese variety is defined here.
- **Name clash.** Mathlib's `WeierstrassCurve.Jacobian` means Jacobian *coordinates*, a
  projective chart `[X : Y : Z]`, unrelated to the Jacobian *variety*. The variety is
  `JacobianVariety`.

## Exact supplier contracts

### From Mathlib

- Morphism properties in `Mathlib/AlgebraicGeometry/Morphisms/*`: `IsProper`, `Smooth`,
  `IsSeparated`, `Flat`, `LocallyOfFiniteType`, `LocallyOfFinitePresentation`,
  `IsClosedImmersion`, `Etale`, stable under base change and composition, with their instances
  on `pullback.snd`.
- `GeometricallyConnected` and `GeometricallyIntegral` in
  `Mathlib/AlgebraicGeometry/Geometrically/{Connected,Integral}.lean`.
- `AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral`
  (`Mathlib/AlgebraicGeometry/Group/Abelian.lean`): a proper geometrically integral group
  scheme over a field is commutative. Layer E consumes it for every abelian variety; the Picard
  group law is commutative directly by tensor product (Stacks
  [0BFD](https://stacks.math.columbia.edu/tag/0BFD)).
- `CommRing.Pic` and `ClassGroup.equivPic` (`Mathlib/RingTheory/PicardGroup.lean`): algebraic
  ingredients for affine charts, not a foundation for the global Picard scheme.
- Site cohomology (`Mathlib/CategoryTheory/Sites/SheafCohomology/*`,
  `Mathlib/AlgebraicGeometry/Sites/BigZariski.lean`); `SheafOfModules.IsQuasicoherent` and
  `SheafOfModules.IsFinitePresentation`; `Proj` and projective space; scheme gluing.
- Representability: `Functor.IsRepresentable`, `Functor.RepresentableBy`, `Functor.reprX`,
  `Functor.representableBy`, `Functor.RepresentableBy.isoReprX`, `Functor.uliftYonedaReprXIso`
  (`Mathlib/CategoryTheory/Yoneda.lean`); group objects by representability,
  `GrpObj.ofRepresentableBy`, `IsCommMonObj.ofRepresentableBy`, `CommGrpObj.ofRepresentableBy`
  (`Mathlib/CategoryTheory/Monoidal/Cartesian/{Grp,CommMon_,CommGrp_}.lean`);
  `AddCommGrpCat.toCommGrp`.
- The group law on the points of an elliptic curve
  (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`), built through the class group:
  a template and a reconciliation target for genus one, not a scheme-level `Jac E ≅ E`.

### From Tau Ceti

- Cartier divisors and classes: `Scheme.CartierDivisor`, `Scheme.CartierDivisor.ClassGroup`,
  `principalSubgroup_eq_ker`, `classGroupAddEquivLineBundleClass`, `nonempty_iso_sheaf_iff`
  (`TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean`); `LineBundleClass`;
  `SchemeWeilDivisor` with `SchemeWeilDivisor.relativeDegree` and the Weil/Cartier comparison;
  `InvertibleSheaf.eulerDegree`, `χ(L) − χ(𝒪_X)`.
- Degree and Riemann–Roch on a proper integral curve over `k` whose codimension-one local rings
  are discrete valuation rings, with `H¹(X, 𝒪_X)` finite-dimensional: principal divisors have
  degree zero, `SchemeWeilDivisor.relativeDegree_principalDivisor`, and the degree of a divisor of
  `L` is `χ(L) − χ(𝒪_X)`, `InvertibleSheaf.eulerDegree_eq_relativeDegree`
  (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean`), additive by
  `LineBundleClass.eulerDegree_mul`; `Pic⁰ = ker deg` is `LineBundleClass.picZero`
  (`WeilDivisor/Scheme/PicZero.lean`); for a `κ`-scheme regarded over `k`,
  `InvertibleSheaf.eulerDegree_eq_finrank_mul` gives `deg_k = [κ : k]·deg_κ`
  (`LineBundle/Degree.lean`). `H¹(X, 𝒪_X)` of a smooth proper connected curve is
  finite-dimensional, `finiteDimensional_cohomology_one_trivial_of_smooth`; with exact constants
  `H⁰(X, 𝒪_X) = k`, `SchemeWeilDivisor.finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`;
  Riemann–Roch `χ(L) = deg D + 1 − g` with a rational point is
  `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus`, and its Serre-duality form
  with exact constants and no rational point is
  `InvertibleSheaf.finrank_cohomology_zero_sub_finrank_cohomology_zero_tensor_dual`.
- Coherent sheaves and cohomology: `FinitelyPresentedSheaf`
  (`TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean`), `Scheme.Modules.Cohomology`
  with its `k`-module structure and `Scheme.Modules.cohomologyMapBaseLinear`, `Scheme.genus`,
  `Scheme.relativeDifferentials`, `relativeDifferentialsIsoDivisorSheaf`,
  `SchemeWeilDivisor.repartitionToCohomologyOne`,
  `SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`,
  `genus_eq_genus_functionField`, `finrank_cohomology_zero_relativeDifferentials`,
  `finrank_cohomology_zero_sub_finrank_cohomology_zero_differentials_tensor_dual`,
  `eulerDegree_relativeDifferentials`.
- Relative cohomology. `Scheme.Hom.higherDirectImage f q`, the right derived functors `R^q f_*`
  of pushforward on all sheaves of modules, for every morphism, with no properness, flatness or
  finiteness (`TauCeti/AlgebraicGeometry/Cohomology/HigherDirectImage/Basic.lean`); their
  vanishing in positive degree along closed immersions,
  `isZero_higherDirectImage_succ_of_isClosedImmersion` (`HigherDirectImage/ClosedImmersion.lean`),
  and finite presentation along finite morphisms to a locally Noetherian base,
  `isFinitePresentation_higherDirectImage_of_isFinite` (`HigherDirectImage/Affine.lean`). Flat
  base change over an affine base: for `X` quasi-compact with affine diagonal over a ring `R`,
  `R → R'` flat and `M` quasi-coherent, the canonical map `R' ⊗_R Hⁿ(X, M) → Hⁿ(X_{R'}, M_{R'})`
  is bijective, `bijective_cohomologyBaseChange`, with the linear equivalence
  `cohomologyBaseChangeLinearEquiv` and, over fields, `finrank_cohomology_pullback_eq_of_isPullback`
  (`Cohomology/FlatBaseChange.lean`); the genus of a smooth proper connected curve is invariant
  under field extension, `genus_eq_of_isPullback_of_smooth`
  (`Curves/Genus/BaseChange.lean`). On a scheme over `R` covered by two affine opens with affine
  intersection: `p ↦ dim H¹(X_p, M_p)` is upper semicontinuous when `H¹(X, M)` is finite,
  with no flatness, `upperSemicontinuous_finrank_cohomology_one_fiber`
  (`Cohomology/Semicontinuity.lean`), and `H⁰` commutes with every base change when `H¹ = 0` and
  the sections over the overlap are flat,
  `bijective_cohomologyBaseChange_zero_of_subsingleton_cohomology_one`
  (`Cohomology/CohomologyAndBaseChange.lean`). The cohomology of the twisting sheaves on
  projective space, `free_cohomology_zero_twistingSheaf` and
  `subsingleton_cohomology_twistingSheaf_of_lt_card` (`Cohomology/ProjectiveSpace/`).
- Abel–Jacobi point separation: for the standing curve of positive genus with a rational point
  `x₀`, two `K`-points with the same class `𝒪(x − x₀)` are equal, for every field extension
  `K/k`, `abelJacobiMap_app_injective_of_genus_pos`
  (`TauCeti/AlgebraicGeometry/PicardFunctor/Abel/PointSeparation.lean`).
- Elliptic curves: for an elliptic Weierstrass curve `W` over a field, its projective model is an
  abelian variety, `WeierstrassCurve.toAbelianVariety`
  (`EllipticCurve/Scheme/AbelianVariety.lean`); its rational sections form a group isomorphic to
  Mathlib's `W.toAffine.Point`, `WeierstrassCurve.projModelPointsMulEquiv`
  (`EllipticCurve/Scheme/GroupLaw.lean`); `W.toAffine.Point ≃+ Pic⁰ (projModel W)` sends an
  affine point `P` to `𝒪(x_P − x_O)`, `WeierstrassCurve.pointAddEquivPicZero`
  (`EllipticCurve/Scheme/PicZero.lean`); over a separably closed field in which `n` is invertible
  exactly `n²` points are killed by `[n]`, `WeierstrassCurve.natCard_comp_mulBy_eq_one`
  (`EllipticCurve/Scheme/FieldPoints.lean`).
- Function-field differentials: `weilDifferentialOfSeparating`,
  `kaehlerDifferentialEquivWeilDifferentialOfSeparating` (independent of the separating element),
  the local components `repartitionDualComponent` with `apply_eq_finsum_repartitionDualComponent`
  and the abstract residue theorem `finsum_repartitionDualComponent_eq_zero`, and
  `Place.traceResidue_coord_smul_eq_repartitionDualComponent` (local components are trace
  residues at places with separable residue field), in
  `TauCeti/FieldTheory/FunctionField/Differential/{Comparison,LocalComponent,Independence}.lean`.
- Picard functors: `rigidifiedPicardFunctor`, `rigidifiedPicardDegreeZeroFunctorIso`,
  `relativePicardFppfSheaf` (group-valued, `AddCommGrpCat.{u+1}`, no representability asserted),
  `relativePicardPresheafBaseChangeIso`, `relativePicardFiberDegree`,
  `relativePicardDegreeZeroFppfSheaf`, `relativePicardDegreeZeroFppfSheafι`,
  `relativePicardDegreeZeroFunctorBaseChangeIso`, `abelJacobiMapOfDegree`,
  `abelJacobiMapToPicZeroFppf` (`TauCeti/AlgebraicGeometry/PicardFunctor/*`).
- Relative effective Cartier divisors: `relativeEffectiveCartierDegreeSubfunctor` and
  `relativeEffectiveCartierDegreeOneSection`
  (`TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Degree/Basic.lean`).
- Descent: `DescentDatum` and `DescentDatum.exists_isAffine_baseChange_hom_isIso`.
- Abelian varieties: `AbelianVariety` (fields `toOver`, `grpObj`, `isProper`,
  `geometricallyIntegral`), its `Hom`, `dim`, `baseChange`, `mulBy`, `IsIsogeny`, and
  `AbelianVariety.IsAlbanese` with `isAlbanese_of_isIso`
  (`TauCeti/AlgebraicGeometry/AbelianVariety/*`).

### From `TauCetiRoadmap.SchemeAndStackFoundations`

§0.9 (limits of schemes and finite-presentation approximation), §0.11 (descent of morphism
properties along `Spec l ⟶ Spec k`), §1.1 (descent of quasi-coherent and invertible sheaves),
§2.2 (the Leray spectral sequence), §2.11 (`H¹_fppf(−, 𝔾_m)` is the Picard group), §4.9 (the
theorem on formal functions, `Scheme.Modules.Cohomology.formalFunctionsIso` in
`TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`), §4.12 (`chow_lemma`), §4.14
(Hilbert and Quot schemes). Its §4.9 consumes Layer C's finiteness of coherent cohomology and
coherence of higher direct images, and Layer D consumes its formal-functions isomorphism; its
§4.14 likewise consumes Layer C and is consumed in Layer D (D.3, D.4), never in Layer C; the
two roadmaps document this target-level direction.

## How to read the build

Layer A fixes the line-bundle, divisor and degree vocabulary on a curve over `k`. Layer B
builds coherent cohomology over `k`, finiteness, the genus, Serre duality through the residue
trace on smooth curves and Riemann–Roch for line bundles. Layer C is the relative theory that
the classical symmetric-power argument quietly relies on: coherence of higher direct images,
base change, semicontinuity, and the Hilbert scheme of points (symmetric powers) of the curve.
Layer D builds, in this order, the Picard functor, the Picard scheme as a named representing
object over any base, Hilbert quotients and representability for projective geometrically
integral schemes, the curve's degree-zero piece and Abel maps, its neutral component with
smoothness and properness, and the Jacobian over any field by Galois descent. Layer E supplies
the abelian-variety theory (cube, dual, polarizations, the Picard pullback along the Abel map,
multiplication). Layer F states the Abel–Jacobi morphism, its Albanese property, the genus-one
isomorphism, the closed immersion and base change. `Suggested.lean` states the headline theorems
of Layers B–F against the pinned libraries.

## Layer A: line bundles, divisors, Picard group, degree

### A.1 Invertible sheaves and the Picard group

Use Tau Ceti's `LineBundleClass X`, the group of isomorphism classes of invertible sheaves on a
scheme under tensor product, written additively through `Additive`, with pullback along
morphisms. Prove that pullback is a homomorphism and functorial, and that the class of the
structure sheaf is the identity. *Needs:* Tau Ceti `LineBundleClass`.

**Checks.**
- On `ℙ¹_k`, `𝒪(1) ⊗ 𝒪(−1)` is trivial, so the classes of `𝒪(1)` and `𝒪(−1)` are inverse.
- Pullback of `𝒪(1)` along the squaring map `ℙ¹ → ℙ¹` is `𝒪(2)`, not `𝒪(1)`.
- On `Spec` of a principal ideal domain every invertible sheaf is trivial, so the group is zero.

### A.2 Divisors on a curve

The Weil-divisor sum `⊕_x ℤ` runs over the closed points of the smooth integral curve,
equivalently its points of codimension one: `SchemeWeilDivisor X`, with its comparison with
Cartier divisors. On an integral scheme the dictionary is `Cartier divisors / principal divisors
≃ Pic X`, with `Pic X` the isomorphism classes of invertible sheaves; on a smooth curve this also
gives `Cl(X) ≅ Pic X`. Before quotienting, the corresponding object is an invertible sheaf with
a nonzero rational section, up to isomorphism preserving that section. Consume Tau Ceti's
`Scheme.CartierDivisor.ClassGroup`, `principalSubgroup_eq_ker`,
`classGroupAddEquivLineBundleClass` (the class group is the Picard group) and
`nonempty_iso_sheaf_iff` (two Cartier divisors have isomorphic sheaves exactly when their
difference is the divisor of a nonzero rational function) from
`CartierDivisor/ClassGroup.lean` (Hartshorne II.6.13–6.15). Prove the Weil/Cartier comparison
an isomorphism on the smooth curve. *Needs:* A.1; Tau Ceti `Scheme.CartierDivisor.ClassGroup`,
`SchemeWeilDivisor`.

**Checks.**
- On `ℙ¹_k`, `div(t) = [0] − [∞]` is nonzero but gives the same trivial line-bundle class as
  the zero divisor; its rational section distinguishes the unquotiented objects.
- The class of a rational point on `ℙ¹_k` gives `𝒪(1)`, not the trivial class.
- A degree-two closed point of `ℙ¹_ℝ` contributes `2` to divisor degree; the generic point
  contributes no generator to the Weil-divisor sum.

### A.3 Degree

The degree of a Weil divisor is Tau Ceti's `SchemeWeilDivisor.relativeDegree`,
`Σ_x [κ(x) : k]·n_x`, and the degree of a line bundle is Tau Ceti's
`InvertibleSheaf.eulerDegree`, `χ(L) − χ(𝒪_X)`. On a proper integral curve over `k` whose
codimension-one local rings are discrete valuation rings and whose `H¹(X, 𝒪_X)` is
finite-dimensional, Tau Ceti proves that principal divisors have degree zero
(`SchemeWeilDivisor.relativeDegree_principalDivisor`), that `χ(L) − χ(𝒪_X)` is the degree of the
divisor of any nonzero rational section of `L` (`InvertibleSheaf.eulerDegree_eq_relativeDegree`),
that it is additive under tensor product (`LineBundleClass.eulerDegree_mul`), and that
`Pic⁰ X = ker deg` as an abstract group (`LineBundleClass.picZero`; the functorial `Pic⁰` is
Layer D's). What remains here differs from those results by carrying no hypothesis beyond the
standing curve and by the change of base field. Prove that the standing curve satisfies their
hypotheses: it is integral (Conventions), its local rings at closed points are discrete
valuation rings by regularity, it has dimension one, and `H¹(X, 𝒪_X)` is finite-dimensional
(`finiteDimensional_cohomology_one_trivial_of_smooth`). Prove that the degree is invariant under
extension of the base field: `deg_K L_K = deg_k L` for every field extension `K/k`, because each
`dim Hⁱ` is (`finrank_cohomology_pullback_eq_of_isPullback`); this is distinct from the factor
`[K : k]` that appears when a `K`-scheme is regarded over `k`
(`InvertibleSheaf.eulerDegree_eq_finrank_mul`). *Needs:* A.2; Tau Ceti
`SchemeWeilDivisor.relativeDegree`, `InvertibleSheaf.eulerDegree`,
`SchemeWeilDivisor.relativeDegree_principalDivisor`, `InvertibleSheaf.eulerDegree_eq_relativeDegree`,
`LineBundleClass.picZero`, `finiteDimensional_cohomology_one_trivial_of_smooth`,
`finrank_cohomology_pullback_eq_of_isPullback`.

**Checks.**
- On `ℙ¹_k`, `𝒪(1)` has degree one and `χ(𝒪(1)) − χ(𝒪) = 2 − 1 = 1`; `𝒪(−3)` has degree `−3`
  and `χ(𝒪(−3)) − χ(𝒪) = (0 − 2) − 1 = −3`.
- On `ℙ¹_ℝ`, `𝒪(P)` for the closed point `P` with `x² + 1 = 0` has degree `2`, and `𝒪(P) ≅ 𝒪(2)`.
- `𝔸¹_k` is excluded: `div(t) = [0]` has degree one, so the hypothesis of properness is used.
- Change of base field on the pointless conic `x² + y² + z² = 0` over `ℝ`: a closed point `P`
  has `κ(P) = ℂ`, so `deg_ℝ 𝒪(P) = 2` (`h⁰ = 3`, `h¹ = 0`, `χ(𝒪) = 1`). Over `ℂ` the conic is
  `ℙ¹_ℂ`, `P` splits into two points and `deg_ℂ 𝒪(P)_ℂ = 2`; regarding `ℙ¹_ℂ` as an `ℝ`-scheme
  gives `dim_ℝ H⁰ − χ_ℝ(𝒪) = 6 − 2 = 4 = [ℂ : ℝ]·2`. A rule multiplying the degree by `[K : k]`
  under base change would give `4` for `deg_ℂ`.

### Examples

`ℙ¹_k` with `Pic = ℤ` generated by `𝒪(1)`; an elliptic curve with `Pic⁰ E = E(k)` as an abstract
group (A.2–A.3); the pointless real conic, whose line bundles all have even degree.

### Dependencies

Mathlib schemes and invertible sheaves; Tau Ceti `LineBundleClass`, `Scheme.CartierDivisor`,
`SchemeWeilDivisor`, `InvertibleSheaf.eulerDegree`. No other layer.

## Layer B: coherent cohomology over `k`: Serre duality, genus, Riemann–Roch

### B.1 Coherent sheaves and cohomology

Coherent sheaves on the Noetherian scheme `X` are Tau Ceti's `FinitelyPresentedSheaf`, the
finitely presented sheaves of modules; their cohomology `Hⁱ(X, F)` is `Scheme.Modules.Cohomology`
with its `k`-module structure. Tau Ceti proves that a quasi-coherent sheaf has no higher
cohomology on an affine open (`Scheme.Modules.subsingleton_cohomologyOn_succ_of_isAffineOpen`),
that Čech cohomology of a finite cover with affine intersections computes `Hⁱ(X, F)`
(`Scheme.Modules.homologyCechComplexIsoCohomology`), and, on a smooth proper connected curve over
`k`, that a quasi-coherent sheaf has no cohomology in degrees at least two and finite-dimensional
cohomology when it is of finite type (`Scheme.Modules.subsingleton_cohomology_of_two_le_of_smooth`,
`Scheme.Modules.finiteDimensional_cohomology_of_smooth`). Prove `finiteDimensional_cohomology`:
for `X` proper over `k` and every finitely presented `F`, each `Hⁱ(X, F)` is finite-dimensional
(Stacks [02O6](https://stacks.math.columbia.edu/tag/02O6); Hartshorne III.5.2). It differs from
the pinned curve case by allowing every proper scheme over `k`, of any dimension and possibly
singular; it is the case `A = k` of C.1 and is proved by the same route, the Čech computation on
projective space and Chow's lemma. *Needs:* Mathlib `SheafOfModules.IsFinitePresentation`;
SchemeAndStackFoundations §4.12; Tau Ceti `FinitelyPresentedSheaf`, `Scheme.Modules.Cohomology`,
`free_cohomology_zero_twistingSheaf`, `subsingleton_cohomology_twistingSheaf_of_lt_card`.

**Checks.**
- On `ℙ¹_k`, `H⁰(𝒪(n))` has dimension `max(n + 1, 0)` and `H¹(𝒪(n))` dimension
  `max(−n − 1, 0)`, so `H¹(𝒪(−2)) = k` and `H²(𝒪(n)) = 0`.
- Properness is used: `H⁰(𝔸¹_k, 𝒪) = k[t]` is infinite-dimensional.
- A skyscraper `κ(x)` at a closed point of degree `e` has `H⁰ = κ(x)` of dimension `e` and
  `H¹ = 0`.
- Beyond curves: on `ℙ²_k`, `H²(𝒪(−3))` is one-dimensional, so the pinned vanishing in degrees
  at least two is special to curves while finite-dimensionality persists.

### B.2 Serre duality through the trace

Let `X` be proper and smooth of relative dimension one over `k`, with `Ω_{X/k}` Tau Ceti's
`Scheme.relativeDifferentials`. Define the trace `tr_{X/k} : H¹(X, Ω_{X/k}) →ₗ[k] k` as a sum
of residues. Reduce to connected `X`: a smooth proper curve is a finite disjoint union of
integral curves `X_i`, each with field of constants `k_i = H⁰(X_i, 𝒪)` finite separable over
`k`, and `Ω_{X_i/k} = Ω_{X_i/k_i}` since `k_i/k` is étale; set
`tr_{X/k} = Σ_i Tr_{k_i/k} ∘ tr_{X_i/k_i}`. For an integral `X` with exact constants, through
the repartition description of `H¹` (Tau Ceti's `SchemeWeilDivisor.repartitionToCohomologyOne`,
transported to `Ω_{X/k}` by `relativeDifferentialsIsoDivisorSheaf`), a class is represented by a
repartition of rational differentials `(η_x)_x` over the closed points, and the trace sends it
to `Σ_x res_x(η_x)`, where `res_x : Ω_{k(X)/k} → k` is the residue at the closed point `x`:
the local component at `x` (Tau Ceti's `repartitionDualComponent`), evaluated at `1`, of the
Weil differential attached to `η` by `kaehlerDifferentialEquivWeilDifferentialOfSeparating`,
which does not depend on the separating element. This is Tate's `k`-linear residue of a
differential at a closed point of arbitrary residue field (Tate 1968, §3, Definition, p. 154),
and the trace is well defined because the local components of a Weil differential vanish on
regular repartitions and sum to zero on global differentials: `Σ_x res_x(η) = 0` for
`η ∈ Ω_{k(X)/k}` (Tate 1968, §3, Theorem 3 and its Corollary, p. 155; Tau Ceti's
`finsum_repartitionDualComponent_eq_zero`). At a closed point whose residue field is separable
over `k`, with a separating uniformizer `t` and `η = z dt`, the residue is
`Tr_{κ(x)/k}` of the coefficient of `t⁻¹` in the Laurent expansion of `z`
(Tau Ceti's `Place.traceResidue_coord_smul_eq_repartitionDualComponent`; Tate 1968, §3,
Theorem 2 at rational points, p. 155), so over a perfect field the trace is the classical
`Σ_x Tr_{κ(x)/k} Res_x(η_x)` (Serre, *Algebraic Groups and Class Fields*, Chapter II, over an
algebraically closed field). Over an imperfect field a closed point can have inseparable residue
field, where `Tr_{κ(x)/k}` vanishes and no coefficient field over `k` exists, so the trace is
defined through the local components and never through residues in `κ(x)`.

Prove `serreDuality_exists_trace` in the normalized form: for every quasi-coherent `F` on `X`
and every `k`-linear form `ℓ` on `H¹(X, F)` there is a unique `φ : F ⟶ Ω_{X/k}` with
`tr_{X/k} ∘ H¹(φ) = ℓ` (Stacks [0BS2](https://stacks.math.columbia.edu/tag/0BS2) (5)–(6);
Tate 1968, §4, Theorem 5 and its Corollary, pp. 158–159; Hartshorne III §7). For `F = L`
invertible, `Hom(L, Ω_{X/k}) = H⁰(X, Ω_{X/k} ⊗ L⁻¹)` and `φ ↦ tr_{X/k} ∘ H¹(φ)` is the cup
product followed by the trace, so the cup pairing
`H⁰(X, Ω_{X/k} ⊗ L⁻¹) × H¹(X, L) → H¹(X, Ω_{X/k}) → k` is perfect; applied to `Ω_{X/k} ⊗ L⁻¹`
it gives the perfect pairing of `H⁰(X, L)` with `H¹(X, Ω_{X/k} ⊗ L⁻¹)`. Prove naturality in
`F`. Tau Ceti's existence statements
`nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual` and
`InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual` become consequences
of these named maps; Serre duality is not stated as the existence of an isomorphism. *Needs:*
A.2, B.1; Tau Ceti `Scheme.Modules.Cohomology`, `Scheme.Modules.cohomologyMapBaseLinear`,
`SchemeWeilDivisor.repartitionToCohomologyOne`, `relativeDifferentialsIsoDivisorSheaf`,
`kaehlerDifferentialEquivWeilDifferentialOfSeparating`, `repartitionDualComponent`,
`finsum_repartitionDualComponent_eq_zero`; Mathlib `SheafOfModules.IsQuasicoherent`.

**Checks.**
- On `ℙ¹_k`, the class of the repartition equal to `dt/t` at `t = 0` and to `0` elsewhere has
  trace `1`; the repartition of the global differential `dt/t` has residues `1` at `0` and `−1`
  at `∞` and trace `0`, so the trace is nonzero and kills global differentials.
- Negative control over the imperfect field `k = 𝔽_p(t)`: on `ℙ¹_k` with coordinate `x`, let
  `P` be the closed point `x^p − t = 0`, with residue field `k(t^{1/p})` purely inseparable of
  degree `p`, and `η = x^{p−1} dx/(x^p − t)`, regular away from `P` and `∞`. With `u = 1/x`,
  `η = −du/(u(1 − t u^p))`, so `res_∞(η) = −1`. The repartition `(η at P, 0 elsewhere)` differs
  from `(−η at ∞, 0 elsewhere)` by the global differential `η` and a regular repartition, so both
  represent one class, whose trace is `res_∞(−η) = 1`; hence `res_P(η) = 1`, by the residue
  theorem. A definition through a residue in `κ(P)` followed by `Tr_{κ(P)/k}` would give `0` at
  `P`, since the trace of a purely inseparable extension vanishes, and would not be well defined.
- For `F = 𝒪_X` on a curve with `H⁰(X, 𝒪_X) = k`, `Hom(𝒪_X, Ω_{X/k}) = H⁰(X, Ω_{X/k})` has
  dimension `g = dim_k H¹(X, 𝒪_X)`; for `F` the skyscraper `κ(x)` at a closed point both
  `H¹(X, F)` and `Hom(F, Ω_{X/k})` vanish.
- Agreement with the library: let `ω` be the Weil differential of a separating element `t`
  (`weilDifferentialOfSeparating`) and `K` its divisor, the divisor in which
  `relativeDifferentialsIsoDivisorSheaf` reads `Ω_{X/k}`. Under that isomorphism the trace is `ω`
  read as a linear form on repartitions, so Tau Ceti's
  `SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`, whose pairing is `(f, a) ↦ ω(f · a)`
  (`SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero_symm_apply_repartitionToCohomologyOne`),
  is the cup pairing with `tr_{X/k}`.

### B.3 One genus

Every genus hypothesis in this roadmap and its consumers is stated with Tau Ceti's
`Scheme.genus` (`dim_k H¹(X, 𝒪_X)`, guarded by finite-dimensionality); no second genus is
defined. The other classical genera are theorems about it. Prove `dim_k H⁰(X, Ω_{X/k}) = g` for
every proper curve smooth of relative dimension one over `k`, as `serreDuality_exists_trace` for
`F = 𝒪_X`; Tau Ceti's `finrank_cohomology_zero_relativeDifferentials` is the case of an exact
constant field. The genus of the function field is `SchemeWeilDivisor.genus_eq_genus_functionField`. The degree formula
`deg Ω_{X/k} = 2g − 2` (Tau Ceti's `eulerDegree_relativeDifferentials`; Stacks
[0C1A](https://stacks.math.columbia.edu/tag/0C1A)) needs `H⁰(X, 𝒪_X) = k`: prove that every
smooth proper geometrically connected curve over `k` satisfies the hypotheses of
`eulerDegree_relativeDifferentials`. Here `H⁰(X, 𝒪_X) = k` by geometric integrality (Stacks
[0BUG](https://stacks.math.columbia.edu/tag/0BUG) (8)); `k` is integrally closed in `k(X)`
because an element of `k(X)` integral over `k` is regular at every point of the normal curve
`X`, hence lies in `H⁰(X, 𝒪_X) = k`; `Ω_{X/k}` is invertible by smoothness of relative
dimension one; and the local rings at closed points are discrete valuation rings by regularity.
*Needs:* B.1, B.2; Tau Ceti `Scheme.genus`, `eulerDegree_relativeDifferentials`,
`finrank_cohomology_zero_relativeDifferentials`.

**Checks.**
- `ℙ¹_k`: `H⁰(Ω_{X/k}) = 0` and `g = 0`; an elliptic curve: `H⁰(Ω_{X/k})` is spanned by the
  invariant differential and `g = 1`.
- The nodal cubic has `Scheme.genus` one while its function field `k(t)` has genus zero;
  `genus_eq_genus_functionField` carries the regularity hypothesis that this curve violates, so
  the arithmetic genus `h¹(𝒪_X)`, not the function-field genus, is the genus.
- `X = ℙ¹_L` viewed over `k`, with `L/k` separable of degree two, is smooth and proper but
  `H⁰(X, 𝒪_X) = L`: `dim_k H⁰(Ω_{X/k}) = 0 = g` still holds, while
  `deg Ω_{X/k} = χ(Ω_{X/k}) − χ(𝒪_X) = −2 − 2 = −4 ≠ 2g − 2`, so the hypothesis
  `H⁰(X, 𝒪_X) = k` belongs to the degree formula only.

### B.4 Riemann–Roch and Serre duality for line bundles

The genus is `g := dim_k H¹(X, 𝒪_X)` (Tau Ceti's `Scheme.genus`). Prove **Riemann–Roch**
`χ(L) = deg L + 1 − g` for every invertible `L` on the standing curve. Since
`deg L = χ(L) − χ(𝒪_X)` (A.3), this is `χ(𝒪_X) = 1 − g`, that is `dim_k H⁰(X, 𝒪_X) = 1`, which
B.3's exact constants give through Tau Ceti's
`SchemeWeilDivisor.finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`. The statement
differs from Tau Ceti's `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus` by
needing no rational point; its Serre-duality form on the standing curve is Tau Ceti's
`finrank_cohomology_zero_sub_finrank_cohomology_zero_differentials_tensor_dual` once B.3 has
checked its hypotheses. Prove **Serre duality** `Hⁱ(X, L) ≅ H^{1−i}(X, Ω_{X/k} ⊗ L⁻¹)^∨` as the
map induced by the trace and cup pairing of B.2, not as the existence of an isomorphism, with
`deg Ω_{X/k} = 2g − 2` (B.3). *Needs:* A.3, B.1, B.2, B.3; Tau Ceti `Scheme.genus`,
`SchemeWeilDivisor.finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`.

**Checks.**
- `ℙ¹_k`: `g = 0`, `χ(𝒪(n)) = n + 1`; an elliptic curve: `g = 1` and `χ(L) = deg L`.
- For `L = 𝒪(−P)` with `P` a point of degree `e` on a curve of genus `g`, `χ = −e + 1 − g`.
- Serre duality for `L = 𝒪_X` reads `dim H⁰(Ω_{X/k}) = g`, and for `L = Ω_{X/k}` reads
  `dim H¹(Ω_{X/k}) = dim H⁰(𝒪_X) = 1`.
- The pointless conic over `ℝ` has `g = 0` and no rational point, and `χ(𝒪(P)) = 3 = 2 + 1 − 0`
  for a closed point `P` of degree two; Riemann–Roch through a rational point would not apply.

### Examples

`ℙ¹_k` (genus zero, `Ω = 𝒪(−2)`, trace computed on `dt/t`); an elliptic curve (genus one, the
invariant differential); the nodal cubic (arithmetic genus one against function-field genus
zero, B.3); `ℙ¹` over `𝔽_p(t)` with an inseparable closed point (B.2's negative control).

### Dependencies

Layer A; SchemeAndStackFoundations §4.12; Mathlib `SheafOfModules.IsQuasicoherent`,
`SheafOfModules.IsFinitePresentation`; Tau Ceti `FinitelyPresentedSheaf`,
`Scheme.Modules.Cohomology`, its affine, Čech and curve cohomology files, `Scheme.genus`,
`Scheme.relativeDifferentials`, the `SchemeWeilDivisor` repartition, duality and Riemann–Roch
files, the function-field differential files.

## Layer C: relative coherent cohomology and base change

The part that the classical `Sym^g` argument quietly relies on, so it comes before Picard.

### C.1 Coherent higher direct images under proper morphisms

The higher direct images are Tau Ceti's `Scheme.Hom.higherDirectImage f q`, the right derived
functors of pushforward on all sheaves of modules; Tau Ceti proves that their formation is local
on the target (`Scheme.Hom.higherDirectImageRestrictIso`), that they vanish in positive degrees
along affine morphisms on quasi-coherent sheaves
(`Scheme.Hom.isZero_higherDirectImage_succ_of_isAffineHom`), and that they are finitely presented
along finite morphisms to a locally Noetherian base
(`Scheme.Hom.isFinitePresentation_higherDirectImage_of_isFinite`). For every proper morphism
`f : X → S` with `S` locally Noetherian and every coherent `F` on `X`, prove `R^q f_* F` coherent
for all `q ≥ 0`, with no flatness of `f` or of `F` over `S` (Stacks
[02O5](https://stacks.math.columbia.edu/tag/02O5)); this differs from the pinned finite case by
allowing every proper `f`. Over `S = Spec A`, prove `H^q(X, F)` a finite `A`-module
([02O6](https://stacks.math.columbia.edu/tag/02O6)), with the canonical `A`-linear identification
`H^q(X, F) ≅ Γ(S, R^q f_* F)` ([01XK](https://stacks.math.columbia.edu/tag/01XK)); B.1's
finite-dimensionality is the case `A = k`. The proof treats projective `f` first, from the Čech
computation of `H^q(ℙⁿ_A, 𝒪(m))` (Tau Ceti's `free_cohomology_zero_twistingSheaf` and
`subsingleton_cohomology_twistingSheaf_of_lt_card`), and reduces the proper case to it by Chow's
lemma (SchemeAndStackFoundations §4.12, `chow_lemma`) and Noetherian induction. A suggested home
is `TauCeti/AlgebraicGeometry/Cohomology/HigherDirectImage/Proper.lean`, beside the existing
finite and affine cases. *Needs:* B.1; SchemeAndStackFoundations §4.12; Tau Ceti
`Scheme.Modules.Cohomology`, `FinitelyPresentedSheaf`, `Scheme.Hom.higherDirectImage`,
`Scheme.Hom.higherDirectImageRestrictIso`.

**Checks.**
- `A = k⟦t⟧`, the finite morphism `i : Spec(A/(t)) → Spec A` and `F = 𝒪`: `i` is proper and
  not flat, `i_* 𝒪 = (A/(t))~` is coherent and killed by `t`, `R^q i_* 𝒪 = 0` for `q ≥ 1`, and
  `H⁰ = k` is a finite `A`-module that is not `A`-flat; the target must agree here with the
  pinned closed-immersion and finite cases. This lies inside the hypotheses of
  SchemeAndStackFoundations §4.9, whose isomorphism for `I = (t)` reads `k ≅ lim_n k`.
- `A = k⟦t⟧`, `f : ℙ¹_A → Spec A` (proper and flat) and `F = 𝒪/(t)`, the pushforward of
  `𝒪_{ℙ¹_k}` from the special fibre: `F` is not `A`-flat, `H⁰(ℙ¹_A, F) = k`, `H¹(ℙ¹_A, F) = 0`
  and `f_* F = (A/(t))~`.
- `A` Noetherian, `f : ℙ¹_A → Spec A` and `F = 𝒪(n)`: `H⁰` is free of rank `max(n + 1, 0)`
  and `H¹` free of rank `max(−n − 1, 0)` (Hartshorne III.5.1).
- Properness is used: for `𝔸¹_k → Spec k`, `H⁰(𝔸¹_k, 𝒪) = k[t]` is not finite over `k`.

### C.2 Flat base change, semicontinuity, cohomology and base change

Each statement carries its own hypotheses. **Flat base change**: for `f : X → S` quasi-compact
and quasi-separated, `F` quasi-coherent on `X` and `g : S' → S` flat, with `f' : X' → S'` and
`g' : X' → X` the base change, the map `g^* R^q f_* F → R^q f'_* (g'^* F)` of
`Scheme.Hom.higherDirectImage` is an isomorphism (Stacks
[02KH](https://stacks.math.columbia.edu/tag/02KH)). Over `S = Spec A`, `S' = Spec B` with `X`
quasi-compact with affine diagonal it reads `H^q(X, F) ⊗_A B ≅ H^q(X_B, F_B)`, which is Tau
Ceti's `bijective_cohomologyBaseChange` and `cohomologyBaseChangeLinearEquiv`; the target here
differs by allowing a non-affine `S` and stating the comparison for the sheaves `R^q f_* F`. The
rest is for `f : X → S` proper with `S`
locally Noetherian and `F` coherent and flat over `S`; Layer D's case is `f` proper, flat and
finitely presented with `F` locally free. Over affine `S = Spec A`, there is a bounded complex
`K` of finite projective `A`-modules with `H^q(X_B, F_B) ≅ H^q(K ⊗_A B)` functorially in
`A`-algebras `B` (Mumford, *Abelian Varieties*, §5; Stacks
[0B91](https://stacks.math.columbia.edu/tag/0B91)). **Semicontinuity**:
`s ↦ dim_{κ(s)} H^q(X_s, F_s)` is upper semicontinuous for every `q` (Stacks
[0BDN](https://stacks.math.columbia.edu/tag/0BDN)) and `s ↦ χ(X_s, F_s)` is locally constant
(Stacks [0B9T](https://stacks.math.columbia.edu/tag/0B9T)); this differs from Tau Ceti's
`upperSemicontinuous_finrank_cohomology_one_fiber`, which is the top degree on a scheme covered
by two affine opens with affine intersection.
**Cohomology and base change**: if `φ^q(s) : R^q f_* F ⊗ κ(s) → H^q(X_s, F_s)` is surjective it
is an isomorphism, and then `φ^{q−1}(s)` is surjective if and only if `R^q f_* F` is locally
free near `s`; **Grauert**: if `S` is reduced and `s ↦ dim_{κ(s)} H^q(X_s, F_s)` is locally
constant, then `R^q f_* F` is locally free and every `φ^q(s)` is an isomorphism (Hartshorne
III.12.8–12.11 for projective `f`; Mumford, *Abelian Varieties*, §5). In relative dimension one,
`H¹(X_s, F_s) = 0` for every `s ∈ S` makes `f_* F` locally free, with formation commuting with
every base change; Tau Ceti's `bijective_cohomologyBaseChange_zero_of_subsingleton_cohomology_one`
is the case of a scheme covered by two affine opens over an affine base with `H¹(X, F) = 0`, and
the target here differs by requiring the vanishing only fibrewise, for every proper `f`. The
existing `TauCeti/AlgebraicGeometry/Cohomology/{FlatBaseChange,Semicontinuity,CohomologyAndBaseChange}.lean`
hold the pinned special cases; the general statements are new. *Needs:* C.1; Mathlib flat
morphisms; Tau Ceti `Scheme.Modules.Cohomology`, `Scheme.Hom.higherDirectImage`,
`cohomologyBaseChangeLinearEquiv`.

**Checks.**
- For a field extension `K/k`, `X` proper over `k` and `F` coherent, the flat base change
  over `S = Spec k` must restrict to the pinned `H^q(X_K, F_K) ≅ H^q(X, F) ⊗_k K`, so the genus
  does not change under extension of `k` (F.3); along an open immersion `U ⊂ S`, a flat
  morphism, it must restrict to the pinned restriction isomorphism of `R^q f_*`.
- `A` Noetherian, `f : ℙ¹_A → Spec A` and `F = 𝒪(n)`: every `φ^q(s)` is an isomorphism, and
  `R⁰ f_* 𝒪(n)`, `R¹ f_* 𝒪(n)` are free of ranks `max(n + 1, 0)`, `max(−n − 1, 0)`.
- `S = 𝔸¹_k = Spec k[t]`, `f : ℙ²_S → S`, `Z ⊂ ℙ²_S` the union of the sections `[1:0:0]`,
  `[0:1:0]`, `[1:1:t]`, and `F = 𝓘_Z ⊗ 𝒪(1)` (flat over `S` because `𝒪_Z` is):
  `h⁰(ℙ²_{κ(s)}, F_s)` is `1` at `t = 0`, where the three points are collinear, and `0`
  elsewhere, while `χ(ℙ²_{κ(s)}, F_s) = 0` for every `s`; `f_* F = 0`, so `φ⁰` at `t = 0` is
  the non-surjective map `0 → k`.

### C.3 The theorem on formal functions, consumed

The theorem on formal functions, which Grothendieck's Picard-scheme proof uses, is consumed
here, not proved here: its general form is owned by SchemeAndStackFoundations §4.9, exported as
`Scheme.Modules.Cohomology.formalFunctionsIso` in
`TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`. The input §4.9 consumes is C.1, at
its stated generality: §4.9's coefficients `F/I^n F`, and `⊕_n I^n F` over the Rees algebra
`⊕_n I^n` (Stacks [0897](https://stacks.math.columbia.edu/tag/0897)), need not be flat over
their base. The Picard construction of D.4 is its consumer; this layer builds no second
completion or formal-functions API. *Needs:* C.1; SchemeAndStackFoundations §4.9.

**Checks.**
- For `A = k⟦t⟧`, `X = Spec A` and `F = 𝒪`, the isomorphism reads `A ≅ lim_n A/(tⁿ)`.
- For `f : ℙ¹_A → Spec A` and `F = 𝒪(−2)`, `H¹` of the completion is the completion of
  `H¹ = A`, and `H⁰ = 0` on both sides.
- The theorem fails without properness. For `A = k⟦t⟧` let `X = ℙ¹_A ∖ {∞₀}`, with `∞₀` the
  point at infinity of the special fibre, a closed point of codimension two of the regular
  two-dimensional scheme `ℙ¹_A`; `X → Spec A` is neither proper nor affine. Then
  `H⁰(X, 𝒪) = H⁰(ℙ¹_A, 𝒪) = A`, already `t`-adically complete, while each
  `X_n = X ×_A A/(tⁿ)` is `𝔸¹_{A/(tⁿ)}`, so `lim_n H⁰(X_n, 𝒪) = lim_n (A/(tⁿ))[x]`, the
  restricted power series `A⟨x⟩ ≠ A`. For an affine morphism no counterexample exists: the
  `t`-adic completion of `A[x]` is by definition `lim_n (A/(tⁿ))[x]`.

### C.4 The Hilbert scheme of points of a curve

Name the scheme of effective divisors that the representability and Abel-map arguments of
Layer D consume. For `X` proper and smooth of relative dimension one over `k` (no rational point
and no geometric connectedness assumed) and every `d : ℕ`, prove
`isRepresentable_relativeEffectiveCartierDegreeSubfunctor`: Tau Ceti's functor
`relativeEffectiveCartierDegreeSubfunctor f d`, sending a `k`-scheme `T` to the relative
effective Cartier divisors on `X_T/T` finite locally free of degree `d` over `T` (equivalently,
on a smooth curve, the closed subschemes of `X_T` finite locally free of degree `d`; Stacks
[0B9D](https://stacks.math.columbia.edu/tag/0B9D)), is representable on all test schemes. Its
representing object `Hilbᵈ_{X/k}` (Mathlib's `Functor.reprX`), the symmetric power `Symᵈ X`, is
smooth and proper of dimension `d`, with `k'`-points the effective Cartier divisors of degree `d`
on `X_{k'}` for every field extension `k'` (Stacks [0B9I](https://stacks.math.columbia.edu/tag/0B9I),
stated there for geometrically irreducible `X`). For a curve the construction needs no Quot
scheme: every finite set of points of the projective curve `X` (Stacks
[0A26](https://stacks.math.columbia.edu/tag/0A26)) lies in an affine open (Stacks
[01ZY](https://stacks.math.columbia.edu/tag/01ZY)), so the functor is glued from the subfunctors
of divisors contained in a fixed affine open (Stacks [0B9A](https://stacks.math.columbia.edu/tag/0B9A)).
Supply the universal divisor, pullback along morphisms of test schemes, and addition of divisors
`Hilb^{d₁} × Hilb^{d₂} → Hilb^{d₁+d₂}`, finite locally free of degree `(d₁ + d₂)!/(d₁! d₂!)`
(Stacks 0B9I (3), [0B9J](https://stacks.math.columbia.edu/tag/0B9J)). *Needs:* A.2, C.2; Tau
Ceti `relativeEffectiveCartierDegreeSubfunctor`; Mathlib `Functor.reprX`, scheme gluing.

**Checks.**
- `d = 0` gives `Spec k`, representing the empty divisor; `d = 1` gives `X`, through the graph of
  a point (Tau Ceti's `relativeEffectiveCartierDegreeOneSection` for a section).
- For `X = ℙ¹_k`, `Hilbᵈ` is `ℙᵈ_k` (binary forms of degree `d` up to scalars); in particular
  `Sym² ℙ¹_k = ℙ²_k`, including the locus of doubled points in characteristic two.
- Over `𝔽_q`, the rational points of `Hilbᵈ` are the effective divisors of degree `d` defined
  over `𝔽_q`, not `d`-tuples of rational points: for `ℙ¹_{𝔽_q}` and `d = 2` there are
  `q² + q + 1` of them, `(q + 1)(q + 2)/2` sums of two rational points and `(q² − q)/2` closed
  points of degree two.
- On an affine coordinate chart over `T = Spec k[ε]/(ε²)`, the equation `u² − ε` gives a
  relative divisor of rank two; the universal family records this infinitesimal motion, even
  though its geometric fibre is the doubled origin.

### Examples

`ℙ¹_A` over a discrete valuation ring (C.1–C.3); `ℙ¹_A` minus a closed point of its special
fibre (C.3); the three-point family in `ℙ²_{𝔸¹}` whose `h⁰` jumps (C.2); `Sym² ℙ¹ = ℙ²` and the
degree-two divisors of `ℙ¹_{𝔽_q}` (C.4).

### Dependencies

Layers A–B; SchemeAndStackFoundations §4.9, §4.12 (not §4.14, which consumes this layer); Mathlib
flat and proper morphisms, representability and scheme gluing; Tau Ceti
`Scheme.Modules.Cohomology`, `FinitelyPresentedSheaf`, `Scheme.Hom.higherDirectImage` and the
pinned base-change and semicontinuity files, `relativeEffectiveCartierDegreeSubfunctor`.

## Layer D: the relative Picard functor and the Jacobian scheme

### D.1 The Picard functor, sheaf and rigidified functor

For `f : X → Spec k` proper, flat, finitely presented with geometrically integral fibres (so
`f_*𝒪_X = 𝒪` universally), `Pic_{X/k}` is the fppf sheafification of `T ↦ Pic(X_T)/Pic(T)`,
Tau Ceti's `relativePicardFppfSheaf f`. Keep the three notions distinct (Picard *stack* versus
*functor/sheaf* versus *rigidified functor*), and record the obstruction (`Br`-flavoured)
between `Pic(X_T)/Pic(T)` and `Pic_{X/k}(T)`. The section `x₀` rigidifies it (line bundles
trivialized along `x₀,T`; the Poincaré bundle) and removes that obstruction. Identify the
rigidified classes naturally with the existing
`TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor f x₀ hx₀`, preserving pullback and tensor
product. Prove the obstruction sequence
`0 → Pic(T) → Pic(X_T) → Pic_{X/k}(T) → H²_fppf(T, 𝔾_m) → H²_fppf(X_T, 𝔾_m)`. Use
invertible-sheaf descent from SchemeAndStackFoundations §1.1, its §2.11's identification of
`H¹_fppf(−, 𝔾_m)` with the Picard group, and §2.2's Leray sequence (Stacks
[0B9N](https://stacks.math.columbia.edu/tag/0B9N); Kleiman, *The Picard scheme*, Theorem 2.5,
pp. 17–18). *Needs:* A.1, C.2; SchemeAndStackFoundations §1.1, §2.2, §2.11; Tau Ceti
`relativePicardFppfSheaf`, `rigidifiedPicardFunctor`.

**Checks.**
- For `ℙ¹_k` with a rational point, the rigidified functor is the sheaf of locally constant
  integer degrees, on arbitrary test schemes.
- Tensoring `L` with `f_T^* M` disappears after normalization by `x₀,T^* L`.
- A pointless real conic has a degree-one real Picard-sheaf point but no degree-one line
  bundle; the section hypothesis cannot be removed from the rigidified comparison.

### D.2 The Picard scheme as a named representing object

Representability is a property with a canonical representing object, never an existential
statement about some scheme. For every morphism `f : X ⟶ S`, define the Prop-valued class
`HasPicardScheme f` as Mathlib's `Functor.IsRepresentable` for the underlying presheaf of sets
of Tau Ceti's group-valued `relativePicardFppfSheaf f` (as Mathlib's `HasPullback` is
`HasLimit` of a cospan); the **Picard scheme** `picardScheme f : Over S` as its representing
object (Mathlib's `Functor.reprX`); and
`picardSchemeIso f : uliftYoneda.{u+1}.obj (picardScheme f) ≅ (relativePicardFppfSheaf f).obj ⋙ forget AddCommGrpCat`
(Mathlib's `Functor.uliftYonedaReprXIso`). The group law on `picardScheme f` is tensor product
of line-bundle classes transported by Yoneda (Mathlib's `GrpObj.ofRepresentableBy` applied to
the sheaf written multiplicatively, commutative by `IsCommMonObj.ofRepresentableBy`), so
`picardSchemeIso f` is an isomorphism of group-valued functors by construction and no separate
predicate asserts that a representing isomorphism is additive. Prove: uniqueness (any `P` with a
representation of the same presheaf is isomorphic to `picardScheme f` compatibly with the
representations, by `Functor.RepresentableBy.isoReprX`), so every construction of this layer
proves `HasPicardScheme` and transports along that isomorphism instead of defining a second
Picard scheme; base change (for `b : S' ⟶ S` with base change `f'`, `HasPicardScheme f` implies
`HasPicardScheme f'` and `picardScheme f' ≅ (Over.pullback b).obj (picardScheme f)` compatibly
with `picardSchemeIso`, from Tau Ceti's presheaf comparison `relativePicardPresheafBaseChangeIso`
after sheafification and the adjunction `Over.map b ⊣ Over.pullback b`); and that
`picardSchemeIso` sends the unit section to the trivial class and the group law to tensor
product. *Needs:* D.1; Tau Ceti `relativePicardFppfSheaf`,
`relativePicardPresheafBaseChangeIso`; Mathlib `Functor.IsRepresentable`, `Functor.reprX`,
`Functor.uliftYonedaReprXIso`, `Functor.RepresentableBy.isoReprX`, `GrpObj.ofRepresentableBy`,
`IsCommMonObj.ofRepresentableBy`.

**Checks.**
- For `f = 𝟙 S` the Picard sheaf is zero and `picardScheme f` is `S` itself, the unit of
  `Over S`.
- For the fold map `f : S ⊔ S → S`, `Pic(X_T)/Pic(T) = (Pic(T) × Pic(T))/Pic(T) ≅ Pic(T)` is not
  a Zariski sheaf (on `T = ℙ¹_k` it is `ℤ`, while it vanishes on an affine cover), but its fppf
  sheafification is zero, so `picardScheme f = S`; a definition that skipped the sheafification
  would have no representing object.
- For `ℙ¹_k`, whose Picard scheme exists by D.4, `picardScheme` is `∐_{d ∈ ℤ} Spec k` and the
  transported group law is addition of degrees.

### D.3 Hilbert quotients for Picard charts

Over any field `k`, let `Z` be a quasi-projective scheme and `R ⊂ Z ×_k Z` an equivalence
relation represented by a scheme, with either projection smooth and proper. Construct a
quasi-projective quotient scheme `Q`, a smooth surjection `Z → Q`, and the identification
`R = Z ×_Q Z`; `Q` represents the quotient étale sheaf and also its fppf sheafification.
Construct it from the Hilbert family of equivalence classes, with its universal property and
compatibility with field extension. This target supplies scheme representability, beyond the
algebraic-space output of a general quotient theorem (Kleiman, Lemma 4.9 and proof,
pp. 30–31). Consume SchemeAndStackFoundations §4.14's Hilbert schemes on a projective
compactification of `Z` and §1.1's descent; open gluing uses Mathlib's scheme gluing. *Needs:*
C.2; SchemeAndStackFoundations §1.1, §4.14; Mathlib scheme gluing.

**Checks.**
- The diagonal relation gives `Q = Z`.
- For `Z = ℙⁿ_k` and `R = Z ×_k Z`, the quotient is `Spec k`.
- A finite étale Galois extension `l/k` gives the quotient of `Spec l ×_k Spec l ⇉ Spec l`
  equal to `Spec k`, including when `k` is finite.

### D.4 Projective Picard representability

For a projective geometrically integral scheme `Y` over any field `k`, prove that the fppf
sheaf of relative line-bundle classes is representable, D.2's `HasPicardScheme`; the
representing `picardScheme` is a separated group scheme `Pic_{Y/k}` locally of finite type. The
structural morphism is flat and locally of finite presentation; no perfectness or rational point
is assumed. Use the fixed-Hilbert-polynomial and higher-cohomology-vanishing open subfunctors.
Fix a very ample `𝒪_Y(1)` and use sufficiently positive twists: for a representative `L` on
`Y_T`, with `p : Y_T → T`, require `L(m)` fibrewise globally generated with vanishing higher
cohomology and `E = p_* L(m)` finite locally free of positive rank, commuting with base change.
The divisor chart has class map `D ↦ 𝒪(D)(−m)`; its complete linear systems parametrize lines
in `E`, equivalently rank-one quotients of `E^∨`. Prove that these twisted opens cover, locally
on each test scheme, by Serre vanishing and generation. Their divisor atlases are open subsets
of Hilbert schemes, and their kernel pairs are smooth projective families of these nonempty
complete linear systems. Apply D.3 and glue these open quotients. Supply the natural
representing comparison on all test schemes, the tensor-product group law, the unit and
inverse, and coherent field base change. Each fixed-Hilbert-polynomial piece is an increasing
union of open quasi-projective schemes; these quasi-compact open charts are of finite
presentation over `k` (Kleiman, Theorems 2.5, 4.8 and Lemma 4.9, pp. 17–18, 27–31; Stacks
[01TP](https://stacks.math.columbia.edu/tag/01TP), [01TX](https://stacks.math.columbia.edu/tag/01TX)).
Extend the locally Noetherian test-scheme construction to arbitrary tests using
finite-presentation limits from SchemeAndStackFoundations §0.9 and invertible-sheaf descent;
Kleiman's standing convention and limit reduction are on p. 15. The cohomological and formal
inputs are Layer C and SchemeAndStackFoundations §4.9's
`Scheme.Modules.Cohomology.formalFunctionsIso`.

Specialize to the standing curve: proper curves are projective (Stacks
[0A26](https://stacks.math.columbia.edu/tag/0A26)), so `hasPicardScheme_of_curve` holds with no
rational point, and the structural morphism of the curve's `picardScheme` is flat and locally of
finite presentation. With `x₀`, the comparison of D.1 identifies `rigidifiedPicardFunctor` with
the Picard sheaf, so `picardScheme` represents it through `picardSchemeIso`; this is a theorem
about the named representing object, not a separate existence statement.
SchemeAndStackFoundations §§3.6–3.7 consume this represented object and supply no input to its
construction. *Needs:* C.1–C.3, D.1–D.3; SchemeAndStackFoundations §0.9, §1.1, §4.9, §4.14;
Tau Ceti `relativePicardFppfSheaf`.

**Checks.**
- For `ℙ¹_k`, the representing scheme is `∐_{d ∈ ℤ} Spec k`, flat and locally of finite
  presentation but not quasi-compact, hence not of finite presentation over `k`. Each degree
  component, including degree zero, is `Spec k` and is of finite presentation.
- For an elliptic curve over a finite field, the comparison holds on `Spec k[ε]/(ε²)` as well
  as on field-valued points.
- For a smooth geometrically integral curve over the imperfect field `𝔽_p(t)`, representation
  and field base change hold without replacing the field by its perfection.
- On `ℙ¹_k`, `L = 𝒪(−1)` has zero higher cohomology and `H⁰ = 0`, so its untwisted divisor
  space is empty. Twisting by `m = 1` gives `E = k` of rank one and the empty divisor maps to
  `𝒪(−1)` under `D ↦ 𝒪(D)(−1)` (Stacks [01XS](https://stacks.math.columbia.edu/tag/01XS),
  Lemma 30.8.1).

### D.5 The degree-zero piece and the Abel maps of the curve

For the standing curve `X` over `k` (with `hasPicardScheme_of_curve`, no rational point), the
fibre degree of a class on `X_T` (Tau Ceti's
`relativePicardFiberDegree`) is a locally constant function on every test scheme `T`, by local
constancy of the Euler characteristic in flat proper families (C.2; Stacks
[0B9T](https://stacks.math.columbia.edu/tag/0B9T)) on locally Noetherian `T`
and by the finite-presentation limits of SchemeAndStackFoundations §0.9 on arbitrary `T`. So
Tau Ceti's `relativePicardDegreeZeroFppfSheaf X.hom` is represented, through
`relativePicardDegreeZeroFppfSheafι`, by an open and closed subgroup scheme `Pic⁰_{X/k}` of
`picardScheme X.hom`; D.8 identifies it with the Jacobian scheme. The degree-`d` pieces
`Pic^d_{X/k}` and their torsor structure under `Pic⁰_{X/k}` are SchemeAndStackFoundations §3.6
(`picardComponent`, `picardComponent_torsor`), and over a general base they are
JacobianChallengePartII §§0.1–0.2 and 0.4; this roadmap uses `Pic^d` only through the
translations by `𝒪(d·x₀)` below.

The Abel maps of the standing curve are morphisms of schemes by Yoneda: the unnormalized Abel
map `D ↦ 𝒪(D)` from C.4's `Hilbᵈ_{X/k}` to `picardScheme X.hom`, which lands in the open and
closed locus of fibre degree `d`, and, with a section `x₀`, Tau Ceti's normalized
`abelJacobiMapOfDegree`, `D ↦ 𝒪(D − d·x₀)`, into `Pic⁰_{X/k}`. Write `AJ_d` for either. Prove
that `AJ_d` is surjective for `d ≥ g`, smooth for `d ≥ 2g − 1` and birational for `d = g`
(Stacks [0BA0](https://stacks.math.columbia.edu/tag/0BA0) (5)–(6), over a separably closed field;
the general case after extension to a separable closure). Surjectivity uses `h⁰(L) ≥ 1` for
`deg L ≥ g` and smoothness `H¹(X, L) = 0` for `deg L ≥ 2g − 1`, both from B.4. D.6, D.7, D.8
(over `l`), E.5, E.6 and F.1 use these maps. *Needs:* B.4, C.2, C.4, D.2, D.4;
SchemeAndStackFoundations §0.9; Tau Ceti `relativePicardFppfSheaf`,
`relativePicardPresheafBaseChangeIso`, `relativePicardFiberDegree`,
`relativePicardDegreeZeroFppfSheaf`, `relativePicardDegreeZeroFppfSheafι`,
`relativeEffectiveCartierDegreeSubfunctor`, `abelJacobiMapOfDegree`; Mathlib
`Functor.IsRepresentable`, `Functor.uliftYonedaReprXIso`.

**Checks.**
- For `ℙ¹_k`, `picardScheme` is `∐_{d ∈ ℤ} Spec k`, `Pic⁰_{X/k}` is the component `Spec k` of
  degree zero, `Hilbᵈ = ℙᵈ_k`, and `AJ_d` is the structure map onto the component of degree `d`.
- For a pointless real conic, `Pic⁰_{X/k}` is `Spec ℝ`, and the real point of degree one of the
  Picard sheaf is a section of the sheaf, not the class of a line bundle on `X`; after base
  change to `ℂ` it is the class of `𝒪(1)` on `ℙ¹_ℂ`.
- For an elliptic curve with origin `x₀`, `d = 1 = g = 2g − 1`, so `AJ_1 : X → Pic⁰`,
  `x ↦ 𝒪(x − x₀)`, is surjective, smooth and birational, hence an isomorphism, sending `x₀`
  to `0`.
- In genus two, `AJ_2 : Hilb² → Pic⁰` is birational but contracts the canonical pencil, the
  `ℙ¹` of divisors in `|Ω_{X/k}|`, to the class of `Ω_{X/k}(−2x₀)`; it is not finite, and
  `d = 2 < 2g − 1 = 3`.

### D.6 The curve's neutral component and smoothness

For the standing curve with a rational point `x₀`, prove that D.5's open and closed subgroup
scheme `Pic⁰_{X/k}` is the identity component of `picardScheme X.hom`, geometrically connected
and smooth of dimension `g`. Line-bundle lifting
through square-zero thickenings has obstruction in `H²(X, 𝒪_X)`, which vanishes (Tau Ceti's
`Scheme.Modules.subsingleton_cohomology_of_two_le_of_smooth`). Prove the tangent identification
`T₀ Pic⁰ ≅ H¹(X, 𝒪_X)` together with this smoothness result, as the deformation map sending a
class `c ∈ H¹(X, 𝒪_X)` to the line bundle on `X_{k[ε]}` with transition functions `1 + ε c`; on
the abelian-variety carrier the tangent space at the identity is Tau Ceti's
`AbelianVariety.TangentSpace`, of dimension `dim A` (`finrank_tangentSpace_eq_dim`), so this
identification gives `dim Jac X = g` in D.8. D.5's Abel maps and geometric irreducibility of
symmetric powers prove geometric connectedness (Stacks
[0BA0](https://stacks.math.columbia.edu/tag/0BA0); Kleiman, Theorem 5.11, Proposition 5.19,
pp. 40–42, 47). *Needs:* B.1, B.4, C.2, C.4, D.4, D.5; Tau Ceti
`Scheme.Modules.subsingleton_cohomology_of_two_le_of_smooth`, `AbelianVariety.TangentSpace`,
`finrank_tangentSpace_eq_dim`.

**Checks.**
- `ℙ¹_k` has `Pic⁰ = Spec k`, tangent space zero and genus zero.
- For an elliptic curve, `AJ_1` identifies the smooth one-dimensional neutral component with
  the curve, sending the chosen origin to zero.
- Field extension preserves the genus, the tangent comparison and the entire smooth
  component; in characteristic `p` smoothness follows from the lifting argument.

### D.7 Properness and projectivity of the curve's `Pic⁰`

Prove properness from the surjective Abel map in degree at least `g`, properness of `Symᵈ X`,
and separatedness of the represented Picard scheme. The degree-zero component lies in one
fixed-Hilbert-polynomial piece of D.4; its quasi-compactness places it inside one
quasi-projective open. Proper and quasi-projective over `k` implies projective. Supply the
field-base-change comparison for this full component; the translation of `Pic⁰` by `𝒪(d·x₀)`
shows that the degree-`d` piece the Abel map `AJ_d` lands in is proper and of finite
presentation over `k` (Stacks [0BA0](https://stacks.math.columbia.edu/tag/0BA0); Kleiman,
Theorem 4.8(2), pp. 27–31). *Needs:* C.4, D.4–D.6.

**Checks.**
- In genus zero `Pic⁰ = Spec k` is projective.
- In genus one the translated `AJ_1` identifies `Pic⁰` with the proper projective curve.
- In genus two `AJ_2` has positive-dimensional fibres over special classes; properness and
  projectivity do not require it to be a finite morphism.

### D.8 The Jacobian over any field, by Galois descent

Drop the rational point: let `X/k` be smooth, proper and geometrically connected of dimension
one, and write `picZeroSets X` for Tau Ceti's `relativePicardDegreeZeroFppfSheaf X.hom` as a
presheaf of sets on `Over (Spec k)`. Choose a finite Galois extension `l/k` with `X(l)`
nonempty (Stacks [056U](https://stacks.math.columbia.edu/tag/056U): closed points with finite
separable residue field are dense; take the Galois closure of one residue field). D.4–D.7 apply
to `X_l` with an `l`-point: `Pic⁰_{X_l/l}` is a smooth, projective, geometrically connected
group scheme of dimension `g`. Tau Ceti's `relativePicardDegreeZeroFunctorBaseChangeIso`, after
sheafification, identifies `Pic⁰` of `X_l` with `Pic⁰` of `X` restricted along `Over.map`, so
the two pullbacks of `Pic⁰_{X_l/l}` to `Spec (l ⊗_k l)` represent the same sheaf; uniqueness of
representing objects gives a descent datum for `Spec l ⟶ Spec k` in the sense of Tau Ceti's
`DescentDatum`, whose cocycle condition is automatic and which respects the group law; in Galois
form it is a semilinear action of `Gal(l/k)`, the dictionary that Stacks
[0CDR](https://stacks.math.columbia.edu/tag/0CDR) states for quasi-coherent modules. Descend it:
every `Gal(l/k)`-orbit of points of the projective `Pic⁰_{X_l/l}` lies in an affine open (Stacks
01ZY), and intersecting the Galois conjugates gives a cover by stable affine opens; each
descends by Tau Ceti's `DescentDatum.exists_isAffine_baseChange_hom_isIso` (descent data on
affine morphisms are effective, Stacks [0245](https://stacks.math.columbia.edu/tag/0245)), and the
pieces glue by Mathlib's scheme gluing (a descent datum that is effective on a stable open cover
is effective, Stacks [0AP4](https://stacks.math.columbia.edu/tag/0AP4)). The descended `k`-scheme represents `picZeroSets X` on all test
schemes, by the sheaf condition along the fppf covering `Spec l ⟶ Spec k`: this proves
`isRepresentable_picZeroSets`, the representability of the degree-zero Picard sheaf over any
field, which D.5 identifies with the open and closed subgroup scheme `Pic⁰_{X/k}` of
`picardScheme`. With it in scope (the instance `instIsRepresentablePicZeroSets`) the
**Jacobian scheme** is `jacobianScheme X := (picZeroSets X).reprX`, its representation is
`jacobianSchemeRepresentableBy X : (picZeroSets X).RepresentableBy (jacobianScheme X)`, and
its group law is tensor product of degree-zero classes transported along that representation
(the instance `jacobianSchemeCommGrpObj`, Mathlib's `CommGrpObj.ofRepresentableBy` applied to
the sheaf written multiplicatively through `AddCommGrpCat.toCommGrp`). Prove
`isProper_jacobianScheme` and `geometricallyIntegral_jacobianScheme`: properness, smoothness
and finite type descend along `Spec l ⟶ Spec k` (SchemeAndStackFoundations §0.11), and
geometric connectedness and dimension `g` are statements after extension to an algebraic
closure containing `l`; these are the instances `instIsProperJacobianScheme` and
`instGeometricallyIntegralJacobianScheme`. The **Jacobian** `JacobianVariety X` is the Jacobian
scheme with its group law on Tau Ceti's `AbelianVariety` carrier, and `dim_jacobianVariety`
states `dim (JacobianVariety X) = g` through D.6's tangent identification with Tau Ceti's
`AbelianVariety.TangentSpace` and `finrank_tangentSpace_eq_dim` (Kleiman, Theorem 5.11; Milne,
*Abelian Varieties*, III Proposition 2.1, p. 91). Its definition uses no
rational point and no choice of `l`: any two choices are dominated by a third, and representing
objects are unique up to unique isomorphism. The `x₀`-pointed statements are theorems about this
object for every `k`-point `x₀`: the comparison with Tau Ceti's
`rigidifiedPicardDegreeZeroFunctor` (`rigidifiedPicardDegreeZeroFunctorIso`), the translated
Abel maps, and Layer F's Albanese property. *Needs:* C.4, D.2–D.7; SchemeAndStackFoundations §0.11;
Tau Ceti `DescentDatum`, `DescentDatum.exists_isAffine_baseChange_hom_isIso`,
`relativePicardDegreeZeroFppfSheaf`, `relativePicardDegreeZeroFunctorBaseChangeIso`,
`AbelianVariety`, `AbelianVariety.TangentSpace`, `finrank_tangentSpace_eq_dim`; Mathlib `Functor.reprX`, `Functor.representableBy`,
`CommGrpObj.ofRepresentableBy`, `AddCommGrpCat.toCommGrp`, scheme gluing.

**Checks.**
- A pointless real conic: `JacobianVariety` is `Spec ℝ`, the zero abelian variety, with
  `l = ℂ`, although `X(ℝ)` is empty.
- Selmer's cubic `3x³ + 4y³ + 5z³ = 0` over `ℚ` has no rational point: `JacobianVariety` is an
  elliptic curve over `ℚ` with its origin, so it is not isomorphic to `X` over `ℚ`, while over
  any `l` with `X(l)` nonempty the translated `AJ_1` identifies `X_l` with the base change of
  `JacobianVariety X` to `l`.
- When `X` has a `k`-point, `l = k` is allowed, the descent datum is trivial and the
  construction is that of D.4–D.7.
- The representation is the one of the degree-zero sheaf, not of the whole Picard sheaf: for
  `ℙ¹_k`, `jacobianScheme` is `Spec k`, while `picardScheme` is `∐_{d ∈ ℤ} Spec k`.

### Examples

`ℙ¹_k` (`Pic = ∐_ℤ Spec k`, `Jac = Spec k`); an elliptic curve (`Pic⁰ ≅ E` through `AJ_1`);
the pointless real conic and Selmer's cubic (Jacobians of pointless curves); a curve over
`𝔽_p(t)` (no perfection of the field).

### Dependencies

Layers A–C; SchemeAndStackFoundations §0.9, §0.11, §1.1, §2.2, §2.11, §4.9, §4.14; Mathlib
representability and group objects by representability, scheme gluing; Tau Ceti Picard functors,
relative effective Cartier divisors and Abel maps, `DescentDatum`, `AbelianVariety` with its
tangent space.

## Layer E: abelian varieties

### E.1 Cube and square

Prove the theorem of the cube for invertible sheaves on an abelian variety's triple product,
with its unique trivialization extending compatible trivializations on the three
coordinate-zero faces. Deduce the theorem of the square and that `a ↦ t_a^* L ⊗ L⁻¹` is a
homomorphism into relative Picard classes on all test schemes, compatible with field extension
(Milne, *Abelian Varieties*, I §5, Theorem 5.1, Corollary 5.2 and Theorem 5.5, pp. 21–26).
*Needs:* A.1, C.2; Tau Ceti `AbelianVariety`, `relativePicardFppfSheaf`.

**Checks.**
- For the trivial bundle the normalized cube trivialization is the identity.
- For a symmetric bundle, `[n]^* L ≅ L^{⊗n²}`.
- For a translation-invariant bundle, `[n]^* L ≅ L^{⊗n}`; these formulas agree for the trivial
  bundle in dimension zero.

### E.2 Abelian varieties and projectivity

Use Tau Ceti's `AbelianVariety k`, whose proper geometrically integral group scheme is
equivalently smooth, proper and geometrically connected. Consume its dimension, Hom and
field-base-change APIs, and commutativity from rigidity, Mathlib's
`isCommMonObj_of_isProper_of_geometricallyIntegral`. Prove every such group scheme projective,
without using the dual construction. D.8's `JacobianVariety`, the curve's smooth proper neutral
component, lies on this carrier, and its tangent comparison gives `dim (Jac X) = g`
(Milne, *Abelian Varieties*, I §§1, 6, Theorem 6.4, pp. 9–10, 27–31). *Needs:* E.1; Mathlib
`isCommMonObj_of_isProper_of_geometricallyIntegral`; Tau Ceti `AbelianVariety`.

**Checks.**
- The zero abelian variety is `Spec k` of dimension zero.
- An elliptic curve has dimension one and a projective embedding.
- Products of two elliptic curves have dimension two; extending an imperfect ground field
  preserves their geometric integrality and group laws.
- Rigidity needs geometric integrality: the constant group scheme `S₃` is smooth and proper
  but noncommutative, and is not geometrically connected; the identity group `Spec k` is the
  dimension-zero case.

### E.3 The higher-dimensional Picard functor and dual

For every abelian variety `A/k`, define the subgroup of `rigidifiedPicardFunctor` at its
identity whose line bundles are algebraically equivalent to zero on every geometric fibre. On
abelian varieties this is equivalent to invariance under all geometric translations; prove the
comparison with the identity-component subfunctor of the represented `Pic_{A/k}`. Curve degree
is not used in this definition. Apply D.4's projective Picard representability to `A`, using
E.2's projectivity theorem, and prove its full neutral component smooth, proper and
geometrically connected of dimension `dim A`. This supplies `A^∨` as an abelian variety,
representing that subgroup on arbitrary test schemes, with a universal Poincaré bundle on
`A × A^∨` normalized on both zero sections. Smoothness here is the abelian-variety Picard
theorem, not the curve's `H² = 0` argument. Retain the full scheme structure in characteristic
`p` (Milne I §8, Proposition 8.4 and pp. 36–40; Kleiman, Remark 5.24, pp. 50–51, citing Mumford
§13). *Needs:* D.1, D.4, E.1, E.2; Tau Ceti `rigidifiedPicardFunctor`.

**Checks.**
- The zero abelian variety is its own dual and the Poincaré bundle is trivial.
- An elliptic curve's subgroup agrees with degree-zero line bundles.
- For `E₁ × E₂`, the dual is `E₁^∨ × E₂^∨`, with the tensor product of the two pulled-back
  Poincaré bundles; this uses a Picard construction on a surface.

### E.4 Duality API

For a homomorphism `f : A → B`, construct the pullback homomorphism `f^∨ : B^∨ → A^∨`,
characterized by the normalized-bundle isomorphism `(f × 1)^* P_B ≅ (1 × f^∨)^* P_A`. Prove
identity and composition laws, coherent field-base-change comparison `(A^∨)_K ≅ (A_K)^∨` for
all extensions, and biduality `A ≅ A^{∨∨}`, defined by the switched Poincaré bundle and natural
in `f`. Compare Poincaré bundles and both rigidifications under every map, including successive
field extensions (Milne I §8, Remark 8.7 and Theorem 8.9, §9, pp. 37–41). *Needs:* E.3; Tau
Ceti `AbelianVariety.baseChange`.

**Checks.**
- The dual of the identity is the identity, and biduality on `Spec k` is the identity.
- The dual of a product projection is the corresponding inclusion.
- In characteristic `p`, dualizing relative Frobenius on an elliptic curve gives Verschiebung;
  the finite kernels retain their nonreduced structure.

### E.5 Polarizations and theta

Fix `φ_L(a) = t_a^* L ⊗ L⁻¹`. Construct it as a homomorphism `A → A^∨` through the normalized
family of line bundles. An ample `L` gives a polarization; a homomorphism `λ : A → A^∨` is a
polarization exactly when over an algebraic closure it equals `φ_L` for an ample line bundle
there. A polarization is principal exactly when it is an isomorphism of abelian varieties. For
`g > 0`, construct the Cartier divisor `W_{g−1} ⊂ Pic^{g−1}` of effective classes; translating
by `−(g−1)x₀` gives theta on the already constructed `Jac X`. Prove its line bundle ample and
its Mumford homomorphism a principal polarization, compatible with field extension; the induced
homomorphism is independent of translating theta. In genus zero use the identity of the zero
abelian variety and its ample trivial bundle (Milne I §11, p. 53; III §6, Theorem 6.6 and
Summary 6.11, pp. 104–108). *Needs:* D.5, D.8, E.1, E.3, E.4.

**Checks.**
- On an elliptic curve `L = 𝒪([0])` gives `φ_L(a) = 𝒪([−a] − [0])`; the Abel divisor-class
  map `a ↦ 𝒪([a] − [0])` differs by `[−1]`.
- Tensoring an ample bundle with an algebraically trivial bundle leaves `φ_L` unchanged;
  `𝒪(d[0])` on an elliptic curve gives degree `d²` for `d > 0`.
- In genus zero the principal polarization has degree one and is the identity.
- In genus two theta is the translated image of `X` under `AJ_1`, an ample divisor on a
  two-dimensional Jacobian.

### E.6 Abel-map Picard pullback and autoduality

For the standing pointed curve, write `J = Pic⁰(X)` and `a(x) = 𝒪(x − x₀)`, the translated
degree-one Abel map of D.5. Let `Q` be the universal bundle on `X × J`, normalized along
`x₀ × J` and `X × 0`, and `P_J` the doubly normalized bundle on `J × J^∨`. Construct the
homomorphism `q = a^* : J^∨ → J` by pullback of relative line-bundle classes on every test
scheme, with the rigidification-preserving comparison `(a × 1)^* P_J ≅ (1 × q)^* Q`. Prove the
theta bundle comparison `(a × (−λ_Θ))^* P_J ≅ Q`, preserving both trivializations. Deduce
`q ∘ λ_Θ = [−1]_J`; hence `q` is an isomorphism and `q⁻¹ = −λ_Θ`. For every abelian variety
`A/k` and pointed morphism `f : (X,x₀) → (A,0)`, construct similarly `f^* : A^∨ → J`:
algebraically trivial bundles pull back to degree-zero bundles, tensor product gives the
homomorphism, and `(f × 1)^* P_A ≅ (1 × f^*)^* Q` preserves both rigidifications. Prove
composition compatibility with homomorphisms of abelian varieties and compatibility of these
maps, comparisons and the inverse of `q` with every field extension. This is Picard pullback
for a curve morphism, extending E.4's dual-map API (Milne III Lemmas 6.8–6.9 and Remark
6.10(c), pp. 106–107; I §8, Theorem 8.9, pp. 37–38). *Needs:* D.5, D.8, E.3–E.5.

**Checks.**
- For an elliptic curve with origin `x₀`, `q` sends the class `𝒪([b] − [0])` to `b`, while
  `λ_Θ(b)` is `𝒪([−b] − [0])`; their composite is `[−1]`.
- In genus zero, `J = J^∨ = Spec k`, both normalized bundles are trivial, and `q`, `λ_Θ` and
  `[−1]` are the identity; every `f^*` is zero.
- Over a field of characteristic two, the identity is an equality of homomorphisms and
  normalized families on all test schemes; `[−1]` need not equal the identity on an elliptic
  curve, even though the scalars `−1` and `1` in the field agree.

### E.7 Multiplication and characteristic `p`

For every `n : ℤ` with `n ≠ 0`, prove `[n]` finite locally free and surjective, of degree
`|n|^{2 dim A}`, hence an isogeny in Tau Ceti's sense (`multiplication_isogeny`). For
positive-dimensional `A`, `[n]` is étale exactly when `(n : k) ≠ 0` (`multiplication_etale_iff`).
Thus in characteristic `p > 0`, `A[p]` is non-étale when `dim A > 0`; its full finite group
scheme, including nilpotents, is retained. No perfect-field hypothesis is used (Stacks
[0BFG](https://stacks.math.columbia.edu/tag/0BFG), [0BFH](https://stacks.math.columbia.edu/tag/0BFH);
Milne I §7, Theorem 7.2, pp. 31–34). For `n ≠ 0` with `(n : k) ≠ 0`, prove that the kernel
`A[n]` of `[n]` is a finite étale group scheme of degree `|n|^{2 dim A}` over `k` and that its
group of `k^sep`-points is a free `ℤ/n`-module of rank `2 dim A`, with its action of
`Gal(k^sep/k)`: an étale scheme of degree `N` has `N` points over a separably closed field, the
same count for every divisor of `n` forces the free module, and the Galois action is the action
on `k^sep`-points of a `k`-scheme (Stacks [03RP](https://stacks.math.columbia.edu/tag/03RP)
(5)–(7); Milne I Remark 7.3, p. 34). This is the finite étale kernel with its Galois action that
StableReduction's contract J-E consumes for the Jacobian. *Needs:* E.1, E.2; Tau Ceti
`AbelianVariety.mulBy`, `AbelianVariety.IsIsogeny`; Mathlib `Etale`.

**Checks.**
- On an elliptic curve, `[n]` has degree `n²`; `[0]` on a positive-dimensional abelian variety
  is not an isogeny.
- In dimension zero every `[n]`, including `[0]`, is the identity and its kernel is trivial and
  étale; this includes the Jacobian of a genus-zero curve.
- For a supersingular elliptic curve over an algebraically closed field of characteristic `p`,
  `E[p]` has length `p²` and only one geometric point.
- For an elliptic curve over a separably closed field and `n` invertible in it, `E[n]` has
  `k^sep`-points `(ℤ/n)²`, of order `n²`, agreeing with Tau Ceti's count of the points of a
  Weierstrass curve killed by `[n]`; for `n = p` the characteristic, `E[p](k^sep)` has order `p`
  or `1` while `E[p]` has degree `p²`, so invertibility of `n` is used.

### Examples

Elliptic curves and their products (E.2–E.4); the Jacobian of a genus-two curve with its theta
divisor (E.5–E.6); supersingular `E[p]` (E.7).

### Dependencies

Layers A–D; Mathlib `isCommMonObj_of_isProper_of_geometricallyIntegral`, `Etale`; Tau Ceti
`AbelianVariety` with `dim`, `Hom`, `baseChange`, `mulBy`, `IsIsogeny`, `rigidifiedPicardFunctor`,
`relativePicardFppfSheaf`.

## Layer F: Abel–Jacobi and the universal property

### F.1 Abel–Jacobi and the Albanese property

Define `abelJacobi`, written `a : X ⟶ Jac X`, by `x ↦ 𝒪(x − x₀)` (D.5's translated `AJ_1`):
under `jacobianSchemeRepresentableBy` it is the morphism corresponding to the class that Tau
Ceti's `abelJacobiMapToPicZeroFppf` assigns to the identity of `X`, so its map on `T`-points is
that natural transformation, and `JacobianVariety` itself does not depend on `x₀`. Prove
`a(x₀) = 0`. For every abelian variety `A` and pointed morphism `f : (X, x₀) → (A, 0)`, prove
there is a unique homomorphism of abelian varieties `φ : Jac X → A` with `f = φ ∘ a` (the
Albanese property; for a curve `Jac = Alb`). Construct the proof `isAlbanese_abelJacobi` on the
existing `AbelianVariety.IsAlbanese` carrier using E.6's Picard-pullback comparison: set
`r = q⁻¹ ∘ f^* : A^∨ → J^∨` and `φ = b_A⁻¹ ∘ r^∨ ∘ b_J : J → A`, where `b_B : B → B^{∨∨}` is
biduality. The normalized universal bundles identify `φ ∘ a` with `f` by biduality's
representing property. Any factorization has `q ∘ φ^∨ = f^*`, so invertibility of `q` and
biduality give uniqueness. The same construction covers genus zero with the zero Jacobian. All
bundle comparisons preserve the two rigidifications and commute with field extension (Milne III
Proposition 6.1, p. 104, Lemmas 6.8–6.9 and Remark 6.10(c), pp. 106–107; I Theorem 8.9,
pp. 37–38). *Needs:* D.5, D.8, E.4, E.6; Tau Ceti `abelJacobiMapToPicZeroFppf`,
`AbelianVariety.IsAlbanese`.

**Checks.**
- For `X = ℙ¹_k`, the constructed factorization through `Spec k` proves every pointed morphism
  to an abelian variety is zero.
- For a pointed elliptic curve, `a` is an isomorphism and the construction gives `φ = f ∘ a⁻¹`,
  agreeing with `AbelianVariety.isAlbanese_of_isIso`.
- For `f = a`, `r` is the identity and biduality gives `φ = 1_J`; for `f = 0` it gives `φ = 0`,
  including on infinitesimal test schemes.
- Properness alone does not construct the factorization: the rational projection `ℙ² ⇢ ℙ¹`,
  `[x:y:z] ↦ [x:y]`, is undefined at `[0:0:1]` and has no extension there. The
  normalized-bundle construction supplies a global morphism.

### F.2 Genus one and the closed immersion

Prove `isClosedImmersion_abelJacobi`: for `g ≥ 1`, the Abel–Jacobi morphism is a closed
immersion. It suffices to check this after base change to an algebraic closure (closed
immersions are fpqc local on the base, Stacks [02L6](https://stacks.math.columbia.edu/tag/02L6)),
where a proper morphism injective on points and on tangent spaces is a closed immersion (Milne,
*Abelian Varieties*, III Lemma 2.4, p. 92). Injectivity on points is Tau Ceti's
`abelJacobiMap_app_injective_of_genus_pos` (two `K`-points with the same class `𝒪(x − x₀)` are
equal when `g ≥ 1`, for every field extension `K/k`), consumed here and transported to `a`
through `jacobianSchemeRepresentableBy`. Injectivity on tangent spaces is what remains: by D.6
and Serre duality (B.2), `T_0 J = H¹(X, 𝒪_X) ≅ H⁰(X, Ω_{X/k})^∨`, and the dual of
`T_x X → T_0 J` is the evaluation map `H⁰(X, Ω_{X/k}) → Ω_{X/k} ⊗ κ(x)`, surjective because
`h⁰(Ω_{X/k}(−x)) = g − 1 < g` for `g ≥ 1` by Riemann–Roch (B.4) (Milne III Proposition 2.3
and its proof, pp. 92–93). Prove `isIso_abelJacobi_of_genus_eq_one`: for `g = 1`, `a` is an
isomorphism `X ≅ Jac X`, since it is a closed immersion of a one-dimensional integral scheme
into the integral `Jac X`, of dimension `g = 1` (Milne III Propositions 2.1 and 2.3,
pp. 91–92). Reconcile with Mathlib and Tau Ceti: for an elliptic Weierstrass curve `W` over `k`
with origin `O`, `isIso_abelJacobi_of_genus_eq_one` for the projective model gives an
isomorphism of abelian varieties between `Jac (projModel W)` and `W.toAbelianVariety` (Tau
Ceti's `WeierstrassCurve.toAbelianVariety`; a pointed morphism of abelian varieties is a
homomorphism); on `k`-points, `WeierstrassCurve.projModelPointsMulEquiv` identifies the points of
`W.toAbelianVariety` with Mathlib's `W.toAffine.Point`, built through the class group, and
`WeierstrassCurve.pointAddEquivPicZero`, sending an affine point `P` to `𝒪(x_P − x_O)`,
identifies these with `Pic⁰ (projModel W)`, the `k`-points of the Jacobian of a curve with a
rational point. So Mathlib's addition law is the Jacobian's group law transported along `a`.
*Needs:* B.2, B.4, D.6, D.8, F.1; Tau Ceti `abelJacobiMap_app_injective_of_genus_pos`,
`WeierstrassCurve.toAbelianVariety`, `WeierstrassCurve.projModelPointsMulEquiv`,
`WeierstrassCurve.pointAddEquivPicZero`; Mathlib `IsClosedImmersion`, the elliptic-curve point
group.

**Checks.**
- For an elliptic curve, `a` identifies `E` with `Jac E` and sends `O` to `0`; the sum of two
  points in Mathlib's law corresponds to the tensor product of the classes `𝒪([P] − [O])`.
- For `ℙ¹_k`, `a` is the constant map to `Spec k` and is not a closed immersion; the hypothesis
  `g ≥ 1` is used.
- In genus two, `a` is a closed immersion but not an isomorphism: its image is the theta divisor
  translated, a curve in a surface.

### F.3 Base change

For every field extension `K/k`, prove that the base change `(Jac X)_K` (Tau Ceti's
`AbelianVariety.baseChange`) represents the degree-zero Picard fppf sheaf of the curve `X_K`,
with no rational point, through the representation induced by `jacobianSchemeRepresentableBy X`
and a base-change isomorphism for `relativePicardDegreeZeroFppfSheaf`: the sheaf of the base
change is the restriction along `Over.map` of the sheaf of `X`, obtained by sheafifying Tau
Ceti's presheaf comparison `relativePicardDegreeZeroFunctorBaseChangeIso`. Tau Ceti has the
comparison and the base change of a representing object only for the presheaf
`relativePicardDegreeZeroFunctor` (`relativePicardDegreeZeroFunctorBaseChangeRepresentableBy`);
the sheaf form and the representation of `picZeroSets` of `X_K` are targets here. The isomorphism
`(Jac X)_K ≅ Jac X_K` it gives is the unique one compatible with both representations and
respects the group laws. For a `k`-point `x₀`, define `abelJacobiBaseChange X K x₀`, the
pullback of `abelJacobi X x₀` to `X_K`, read as a morphism into the underlying scheme of
`(Jac X)_K` through Tau Ceti's `AbelianVariety.baseChange_toOver`, and prove
`isAlbanese_baseChange_abelJacobi`: `(Jac X)_K`, with `abelJacobiBaseChange X K x₀`, has the
Albanese property for `X_K` pointed at the base change of `x₀`. Prove that
`abelJacobiBaseChange X K x₀` sends the base change of `x₀` to the unit of `(Jac X)_K` and that
its map on `T`-points, for `T` over `K`, is that of `abelJacobi X x₀` on `T` regarded over
`k`. With `isAlbanese_abelJacobi` for `X_K` this determines the isomorphism
`(Jac X)_K ≅ Jac X_K` of abelian varieties, with its group law, as the unique one carrying
`a_{x₀}` to `a_{x₀,K}`. Route: the representation statement, the identification of
`a_{x₀,K}` with the base change of `a_{x₀}` on functors of points, then F.1 over `K`. The genus
does not change under base change (Tau Ceti's `genus_eq_of_isPullback_of_smooth`), so `dim` is
preserved. *Needs:* C.2, D.2, D.8, F.1; Tau Ceti `AbelianVariety.baseChange`,
`relativePicardDegreeZeroFunctorBaseChangeIso`, `genus_eq_of_isPullback_of_smooth`.

**Checks.**
- For a pointless real conic, `(Jac X)_ℂ = Spec ℂ = Jac (ℙ¹_ℂ)`, with no rational point over `ℝ`.
- For Selmer's cubic, `(Jac X)_l ≅ X_l` for every `l` with `X(l)` nonempty, through the
  translated `AJ_1` over `l`.
- The identity extension `K = k` gives the identity representation, and
  `isAlbanese_baseChange_abelJacobi` becomes `isAlbanese_abelJacobi` up to the canonical
  isomorphism of the pullback along the identity.
- For an elliptic curve with origin `O`, `abelJacobiBaseChange` is an isomorphism for every `K`,
  so the pointed statement agrees with `AbelianVariety.isAlbanese_of_isIso` over `K`.
- For `ℙ¹_k` with a rational point, `abelJacobiBaseChange` is the constant morphism from `ℙ¹_K`
  to the zero abelian variety `Spec K`. For an elliptic curve with two rational points `O` and
  `P`, the morphisms for `x₀ = O` and `x₀ = P` differ by translation by the class of
  `𝒪(O − P)` and send `O`, respectively `P`, to the unit; a definition ignoring `x₀` could not
  satisfy both.

### Examples

`ℙ¹_k` (zero Jacobian, constant Abel–Jacobi map); an elliptic curve (`a` an isomorphism,
Mathlib's group law recovered); a genus-two curve (closed immersion onto a translate of theta);
Selmer's cubic (base change to a field with a point).

### Dependencies

Layers B, D, E; Mathlib `IsClosedImmersion`, the elliptic-curve point group; Tau Ceti
`abelJacobiMapToPicZeroFppf`, `AbelianVariety.IsAlbanese`, `AbelianVariety.baseChange`,
`relativePicardDegreeZeroFunctorBaseChangeIso`, `abelJacobiMap_app_injective_of_genus_pos`,
`genus_eq_of_isPullback_of_smooth`, and the elliptic-curve abelian variety, point-group and `Pic⁰`
comparisons.

## Downstream consumers

- SchemeAndStackFoundations §3.6 (`picardComponent`, the Picard torsors of a curve) and §3.7
  (Picard stacks and section-free Abel maps) consume Layer D's Picard scheme and Jacobian; its
  §4.9 consumes Layer C's finiteness and coherence of higher direct images; its Layer 0 and §2.6
  cite Layer B's coherent sheaves and Serre duality.
- StableReduction consumes, through its contracts, Layer A (J-A1, J-A2: invertible sheaves,
  Picard group and degree), Layer B (J-B: coherent curve cohomology, genus and Riemann–Roch),
  Layer C (J-C: higher direct images, cohomology and base change and semicontinuity for proper
  morphisms over locally Noetherian bases), Layer D (J-D: the Picard sheaf and `Pic⁰`, with
  field base change) and Layer E (J-E: `Pic⁰` an abelian variety of dimension `g`, `[ℓ]` finite
  étale of degree `ℓ^{2g}`, and E.7's finite étale kernel with its Galois action).
- EnhancedDerivedSheaves E2.8 consumes Layer C's coherent higher direct images without flatness
  and finite affine cohomology; AdicSpacesPartIII consumes Layers B–C for affine acyclicity and
  Serre vanishing on blow-ups.
- AlgebraicCurves Layer 12 consumes Layers A–B for smooth proper geometrically connected models
  of separably generated function fields; ModularCurves imports this roadmap's module for its
  Picard and Jacobian contracts; EtaleCohomologyFoundations §0.11 consumes Layer D's pointed
  Jacobian for its algebraic smooth-curve trace.
- JacobianChallengePartII consumes Layers A–F for the relative Jacobian over a noetherian base,
  the degree components and torsors, and the section-free Abel maps; its §0.3 consumes D.2's
  `picardScheme` and proves `HasPicardScheme` for smooth projective curve families over a
  noetherian base.
- AbelianSchemesAndArithmeticModuli A0.2 and A2.2 consume Layer E's field duality, cube and
  square and polarizations; AlgebraicVectorBundles consumes Layer A's invertible sheaves as its
  rank-one objects.

## References

- R. Hartshorne, *Algebraic Geometry*: Ch. II (sheaves, divisors), III (cohomology, including
  III.12 cohomology and base change), IV (curves, Riemann–Roch).
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*: curves, models, Picard.
- J. S. Milne, *Abelian Varieties* (v2.0, 2008; the page numbers above are its printed pages)
  and *Jacobian Varieties* (in Cornell–Silverman, *Arithmetic Geometry*): the construction and
  universal property.
- D. Mumford, *Abelian Varieties*: theorem of the cube and square, dual variety, polarizations.
- Bosch–Lütkebohmert–Raynaud, *Néron Models*, Ch. 8–9: the Picard functor and its
  representability.
- J.-P. Serre, *Algebraic Groups and Class Fields*, Chapter II: residues, repartitions and
  duality over an algebraically closed field.
- J. Tate, *Residues of differentials on curves*, Ann. Sci. École Norm. Sup. (4) 1 (1968),
  149–159: the `k`-linear residue at a closed point of arbitrary residue field, the residue
  theorem (§3, Theorem 3 and Corollary) and duality on smooth curves (§4, Theorem 5 and
  Corollary).
- H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., Sections I.7 and 4.3: Weil
  differentials, local components and trace residues, the form Tau Ceti implements.
- The Stacks Project: *Picard schemes of curves* (tag 0B95), *Divisors* (tag 01WP), *Cohomology
  and base change* (tag 0B91) with semicontinuity and the Euler characteristic (tags 0BDN,
  0B9T), *Quot/Hilbert and Picard functors* (tag 0D04), *Duality for schemes* (tag 0BS2),
  *Descent* (tags 0CDR, 0245, 0AP4), *Abelian varieties* (tags 03RP, 0BFG, 0BFH).
- S. L. Kleiman, [*The Picard scheme*](https://arxiv.org/abs/math/0504020): Theorems 2.5, 4.8,
  Lemma 4.9, Theorem 5.11, Proposition 5.19 and Remark 5.24; locators above use the preprint
  numbering.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without them:

- [#Autoformalization > Jacobian challenge](https://leanprover.zulipchat.com/#narrow/channel/583336-Autoformalization/topic/Jacobian%20challenge),
  where Kevin Buzzard posed the original Jacobian challenge.
- Private project discussions with Christian Merten, Matthew Ballard, Adam Topaz,
  Fabian Glöckle, and Jack McCarthy; the algebraic-geometry reformulation this roadmap
  follows is due to Christian Merten.

Thanks to everyone who contributed to these discussions.
