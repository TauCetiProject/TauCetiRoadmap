# Roadmap: differential geometry — forms, de Rham cohomology, flows, and degree

Mathlib has a mature smooth-manifold core — `IsManifold` over any `ModelWithCorners`, tangent and general
`ContMDiffVectorBundle`s, `mfderiv`/`mvfderiv`, Lie brackets, integral curves, smooth partitions of unity, a
boundary/interior calculus — and a complete *flat* exterior calculus on normed spaces (`extDeriv`, d² = 0,
naturality under pullback). What it lacks is the geometry built from these: **no differential forms on
manifolds, no wedge product even on normed spaces, no manifold exterior derivative, no orientability, no
integration of forms, no Stokes, no de Rham or singular cohomology, no flows-as-flows, no Frobenius theorem,
no Riemannian Laplacian, no mapping degree.** **Build the classical theory of Lee's *Introduction to Smooth
Manifolds* on that core**, up to the two summits — the **de Rham theorem** (`H^p_dR(M) ≅ H^p(M; ℝ)` by
integration over smooth simplices) and **Stokes' theorem** (`∫_M dω = ∫_{∂M} ω`) — with the **mapping
degree** (its orientation-theoretic and cohomological definitions proved equal) and the **hairy ball
theorem** as applications, and the **fundamental theorem of flows**, the **Frobenius theorem** and the
**Laplace–Beltrami operator** as the dynamical and Riemannian pillars. Everything below them is reusable
library: this area is the substrate the geometric-topology, Heegaard Floer and Lie-groups roadmaps name
among their missing prerequisites, and that the PDE roadmap's flat conventions constrain.

Reference spine: John M. Lee, *Introduction to Smooth Manifolds*, 2nd edition, Springer GTM 218 — cited as
[Lee] with that edition's numbering; where a route differs from [Lee], the layer says so. Suggested homes,
by Mathlib's layout (code organization and roadmap scope do not coincide; place by Mathlib convention,
attribute pull requests to this roadmap by name):
`TauCeti/Geometry/Manifold/{DifferentialForm,Orientation,Flow,Distribution,Integration,DeRham,Riemannian}/`,
`TauCeti/AlgebraicTopology/SingularCohomology/`, flat prerequisites under `TauCeti/Analysis/`.

## Standing hypotheses and conventions (spell them out; never bake in)

- **Scalars and regularity.** Over `ℝ`, in Mathlib's context: `I : ModelWithCorners ℝ E H`, `M` with
  `[ChartedSpace H M] [IsManifold I n M]`. Pointwise theorems are stated at the minimal finite regularity
  the flat layer demands (`extDeriv` facts C², the Lie-bracket API C³); the global theory — the de Rham
  complex and everything cohomological — is fixed at C^∞, so d maps smooth sections to smooth sections
  without a decreasing-regularity ladder. Analytic (`ω`) refinements are not targeted.
- **Finite dimension is a hypothesis, not a default.** Write `[FiniteDimensional ℝ E]` where it is used
  (orientations, integration, Sard, degree, partitions of unity); layers 0–1 and 3 stay Banach-general,
  matching Mathlib's `extDeriv` and `IsMIntegralCurve`. ⚠ Smooth partitions of unity and smooth
  approximation need finite dimensions plus `[T2Space M] [SigmaCompactSpace M]`; every statement using them
  carries them visibly. Second countability, where measurable structure needs it, follows from those two and
  charts.
- **Boundary policy, per layer.** Layers 0–1 work over any `ModelWithCorners`, boundary included.
  Orientation (2) is stated for general `I` ⚠ orientability via "positive-Jacobian atlas" is *false* as a
  definition with boundary (see *Statements that must not enter*); chart signs are what make `Set.Icc x y`
  orientable. Flows (3): local `IsMIntegralCurve` statements are consumed at interior points as Mathlib
  states them, the maximal-flow theory of 3.2–3.5 stated for boundaryless `M`. Stokes (5) is stated with
  boundary; corners beyond `M × Icc` are 5.5's.
- **The boundary model.** Mathlib's `EuclideanHalfSpace n` constrains the *first* coordinate, [Lee]'s `Hⁿ`
  the *last*. All boundary-orientation signs (the `(−1)ⁿ` of [Lee, Example 15.26]) are *recomputed* for
  Mathlib's model and recorded as lemmas, never transcribed. What travels between models is
  "outward-pointing vector first".
- **Orientation.** Fibers reuse `Orientation ℝ (TangentSpace I x) ι` with explicit
  `Fintype.card ι = Module.finrank ℝ E` hypotheses as `LinearAlgebra/Orientation.lean` states them (and the
  `Fact (finrank ℝ E = n)` idiom of `Analysis/InnerProductSpace/Orientation.lean` where instances are
  wanted). A manifold orientation is chart-sign data quotiented as in layer 2 — orientation-transport first,
  determinant criteria derived.
- **Wedge normalization.** The **determinant convention** `ω ∧ η = ((k+l)!/(k!·l!)) • Alt (ω ⊗ η)`, so
  `ε^I ∧ ε^J = ε^{I++J}` and a top-degree wedge of covectors is `det (ωʲ(vᵢ))`; under it the Leibniz rule
  for `extDeriv` (built on the normalization-free `alternatizeUncurryFin`) holds with unit constants. Record
  the conversion to [Lee]'s Alt convention where the wedge is defined, and keep those two identities as
  named lemmas — they catch a mis-normalized wedge.
- **Laplacian sign.** `Δ = div ∘ grad`, agreeing with the flat `Δ` of
  `Analysis/InnerProductSpace/Laplacian.lean` (`InnerProductSpace.instLaplacian`, `laplacianWithin`,
  `laplacian_eq_iteratedFDeriv_orthonormalBasis`) and with the PDE roadmap's pinned convention. ⚠ [Lee,
  Problem 16-13ff] uses the *geometer's* sign, the negation; every identity imported from [Lee] flips. The
  flat compatibility lemma is a 12.5 acceptance gate.
- **Total functions, junk values.** Operators follow the `mfderiv` convention: total, junk-valued off the
  domain of good behaviour, hypotheses on theorems; integration likewise. ⚠ Totality enables vacuous
  satisfaction, so every bundled object ships element-level `_apply`/`coe_` lemmas and the acceptance gates
  pin concrete nonzero values.
- **Universes and vocabulary.** Spaces live in `Type` where the singular comparison is involved (Mathlib's
  singular functors are polymorphic, but one universe avoids `ULift` bookkeeping). Vector fields are
  unbundled `V : (x : M) → TangentSpace I x` with `ContMDiff` section smoothness; rough forms are unbundled
  sections of the alternating bundle with a `ContMDiff` predicate, bundled types coming last and only at C^∞
  (the design direction of the threads in the Acknowledgements). d of a function *is* `mvfderiv`; never
  open-code `fderiv`-through-`extChartAt`.

## What Mathlib already has (consume)

Claims are against the pin in this repository's `lake-manifest.json`; re-grep before citing in code, and
treat every "the pin lacks X" as a checkable claim. Layers cite the further paths they consume.

- **Flat exterior calculus, with naturality:** `Analysis/Calculus/DifferentialForm/{Basic,VectorField}.lean`
  (`extDeriv`, `extDerivWithin`, d² = 0, the invariant Lie-bracket formula, and `extDeriv_pullback` /
  `extDerivWithin_pullback`, whose `UniqueDiffOn` and `x ∈ closure (interior s)` hypotheses are engineered
  to apply on `Set.range I`), over `alternatizeUncurryFin`
  (`Analysis/Normed/Module/Alternating/Uncurry/Fin.lean`) and `Analysis/Calculus/FDeriv/Symmetric.lean`. ⚠
  `Basic.lean`'s docstring leaves bundled and manifold forms to a design discussion; layer 0 follows it
  rather than ignoring it.
- **Alternating maps and their topological bundle:** `Topology/VectorBundle/ContinuousAlternatingMap.lean`,
  over `ContinuousAlternatingMap` and `compContinuousLinearMap` (the pointwise pullback) in
  `Topology/Algebra/Module/Alternating/` and `Analysis/Normed/Module/Alternating/`.
- **Smooth bundles and manifold calculus:** `Geometry/Manifold/VectorBundle/` (`ContMDiffVectorBundle`;
  `Hom.lean`, the file 0.2 mirrors; `Tangent`, `ContMDiffSection`, `Pullback`, `LocalFrame`, `Tensoriality`
  = [Lee, Lemma 12.24]); `…/MFDeriv/` (`mfderiv`, `UniqueMDiffOn`, `mvfderiv` = d on 0-forms);
  `…/VectorField/` (`VectorField.mlieBracket`, `VectorField.mpullback`, bracket naturality); and the
  local-structure files `…/{Immersion,LocalDiffeomorph,Diffeomorph,SmoothEmbedding}.lean` (`IsImmersionAt`,
  `IsLocalDiffeomorphAt` ⚠ whose converse, the manifold inverse function theorem, is that file's TODO and a
  layer-10 target).
- **Integral curves:** `Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`
  (`IsMIntegralCurve`/`On`/`At`, local existence at interior points, uniqueness on `[T2Space M]`,
  uniform-time globalization = [Lee, Lemma 9.15]) over `Analysis/ODE/`, with `Dynamics/Flow.lean`'s `Flow`
  not yet connected to vector fields (layer 3 connects it).
- **Boundary, instances, partitions of unity:** `Geometry/Manifold/IsManifold/InteriorBoundary.lean`
  (`I.interior`, `I.boundary`, and the TODOs "the boundary is a submanifold" / "has measure zero" — layer-5
  targets); `…/Instances/{Real,Sphere}.lean` (`EuclideanHalfSpace`, `boundary_Icc`, `boundary_product`;
  `contMDiff_neg_sphere`, `range_mfderiv_coe_sphere` ⚠ carrying its own warning about the non-canonical
  tangent-space identification); `…/{PartitionOfUnity,BumpFunction,SmoothApprox,WhitneyEmbedding}.lean`
  (`Continuous.exists_contMDiff_approx` has normed-space targets).
- **Flat integration and fiberwise orientation:** `MeasureTheory/Integral/DivergenceTheorem.lean` over
  `Analysis/BoxIntegral/`; `MeasureTheory/Function/Jacobian.lean` (change of variables,
  `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`); `…/CurveIntegral/`; FTC in `…/IntervalIntegral/`;
  and `LinearAlgebra/{Orientation,Ray}.lean` with `Analysis/InnerProductSpace/Orientation.lean`
  (`Orientation.volumeForm`) — nothing manifold-level, which is layer 2.
- **Covering spaces:** `Topology/Covering/{Basic,Quotient}.lean` (`IsCoveringMap`,
  `FiberBundle.isCoveringMap`, `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`),
  `Topology/Homotopy/Lifting.lean`, `…/Covering/AddCircle.lean`, and
  `Geometry/Manifold/Instances/Quotient.lean` (`MulAction.instChartedSpaceQuotient` — charts on the quotient
  *below* an action, the pin's only covering–manifold bridge; 2.3 builds the other).
- **Homological algebra, complete:** `Algebra/Homology/` (`CochainComplex (ModuleCat ℝ) ℕ`, `ShortComplex`
  homology, `ShortComplex.ShortExact.homology_exact₁/₂/₃`),
  `CategoryTheory/Abelian/DiagramLemmas/Four.lean`, and sheaf-level Mayer–Vietoris
  (`CategoryTheory/Sites/MayerVietorisSquare.lean`, `Topology/Sheaves/MayerVietoris.lean`). The engine of
  layers 6–9 exists entire; this roadmap rebuilds none of it, proving MV at the *form* level only.
- **Singular homology (not cohomology):** `AlgebraicTopology/SingularHomology/`
  (`singularChainComplexFunctor`, `singularHomologyFunctor`, H₀, homotopy invariance) over `TopCat.toSSet`
  and `alternatingCofaceMapComplex` (layer 8's dualization device). ⚠ The pin has **no** singular
  cohomology, relative homology, excision, chain-level subdivision, Mayer–Vietoris for singular theories, or
  cup product.
- **Riemannian substrate:** `Topology/VectorBundle/Riemannian.lean` and
  `Geometry/Manifold/VectorBundle/Riemannian.lean` (`RiemannianBundle`, `ContMDiffRiemannianMetric`);
  `…/Riemannian/{Basic,PathELength}.lean`; `…/VectorBundle/CovariantDerivative/Basic.lean`;
  `Analysis/InnerProductSpace/{Laplacian,Dual}.lean`; `Analysis/Distribution/DerivNotation.lean` (the `Δ`
  notation class); `Analysis/Calculus/Gradient/`.

## What Tau Ceti already has (consume)

- **Covering-space theory, complete** (universal-covers roadmap):
  `TauCeti/AlgebraicTopology/UniversalCover/` — universal cover and lifting property, π₁-action, deck
  groups, monodromy, regular covers, the cover attached to `H ≤ π₁`, both Galois correspondences;
  `TauCeti.RealProjectiveSpace`, `π₁(S¹) ≅ ℤ`, `πₙ(S¹) = 0` for `n ≥ 2`, πₙ functoriality and the covering
  isomorphism. Layer 2.4 consumes the two-sheeted classification and deck vocabulary; never rebuilt.
- **Smooth 2-forms:** `TauCeti/Geometry/Manifold/TwoForm.lean` (Heegaard Floer's symplectic lane; closedness
  deliberately undefined). Layer 0.4 supersedes it with a bridge, not a fork, and closedness is exported
  through layer 1 so that lane defines "closed" exactly once.
- **Flows on Lie groups and ODE parameter dependence:** `TauCeti/Geometry/Manifold/IntegralCurve.lean`,
  `TauCeti/Geometry/Lie/`, `TauCeti/Analysis/ODE/SmoothParameter.lean` — layer 3 *subsumes* these with named
  reconciliation lemmas (coordinate with the Lie-groups roadmap, which owns that tree).
- **Sard, flat:** `TauCeti/Analysis/Calculus/Sard/` (equidimensional and low-dimension cases); 10.2
  transfers the equidimensional one through charts, Morse–Sard staying there. **Embeddings and slice
  charts:** `TauCeti/Geometry/Manifold/{SmoothEmbedding,LocallyFlat}/` (`IsSliceChart`, the shape layer 4's
  flat charts follow), `TauCeti/Geometry/Diffeomorphism/`, `…/Manifold/Boundary/Model.lean`.

## What is missing (build here)

Everything the layers below specify: a grep of the pin finds none of it. The ranking by load-bearing weight
is the layer order itself, with three places where the work concentrates — the flat smooth-dependence
theorem (3.1), the singular subdivision layer (8.2) and the boundary-manifold structure (5.1).

## Prior work and coordination

Each source is cited for design and migration, never as the definition of a target. Coordinate with the
named authors before porting, and confirm licences before copying.

- **Mathlib's own direction.** The flat exterior calculus and its bundle substrate are Yury Kudryashov's and
  Sam Lindauer's design (with Heather Macbeth's alternating-bundle work); bundled and manifold forms are
  theirs to steer, and layer 0 follows the threads in the Acknowledgements, coordinating there before
  diverging. Kudryashov's `github.com/urkud/DeRhamCohomology` develops wedge products and manifold forms in
  this style, the closest existing development of layers 0–1 and 6: coordinate there first. For
  orientability, mathlib4#35376 (Michael Lee's, with Sébastien Gouëzel's quotient design) fixes the accepted
  shape; for flows, mathlib4#26394 and #26395; for Levi-Civita, mathlib4#36845. In every case the repository
  policy applies: never wait — build it here now, named and shaped that way, and delete ours when the pin
  advances past it.
- **Jack McCarthy's Lee formalization** (`github.com/pitmonticone/GeometricAnalysis`, with Pietro Monticone;
  Apache-2.0): statement-complete skeletons for [Lee] chapters 10–16 with human-reviewed statements — a
  migration source for statements and proof plans, not the spec.
  `github.com/Deicyde/lean-boundary-smooth-manifold` (sorry-free, axiom-checked): the boundary of a C^k
  manifold is a C^k manifold — the migration source for 5.1.
- **The `differential-geometry` library** (`github.com/qinz1yang/differential-geometry`; Ziyang Qin, Jack
  McCarthy, Yuan Liao, with code adapted from Kudryashov and Macbeth): smooth-section module structure, the
  bundle-homomorphism characterization ([Lee, Lemma 10.29]), tensor-bundle equivalences, a wedge with
  associativity and graded commutativity, flat forms with d² = 0 — blueprint-grade for layers 0–1;
  coordinate with all three authors and confirm the licence before porting.
- **Brendan Seamas Murphy's Lean 3 Brouwer fixed-point theorem** (singular homology, Eilenberg–Steenrod):
  prior art for layer 8's singular half and layer 10's corollaries; port in small pieces, following its
  author's advice on how to split it. The Meta ATLAS corpus (arXiv:2605.29955) has machine-generated MV and
  Hodge material over axiomatized substrates: reference only, no code. **The sphere-eversion project**
  (Massot–van Doorn–Nash) is the template for manifold infrastructure of this kind and the source of several
  partition-of-unity idioms this roadmap consumes.

---

## The build, in layers

Each layer names what it consumes, what it adds and its acceptance gates; the DAG is in *Ordering*.

### Layer 0: alternating bundles, differential forms, and the wedge

*[Lee, Ch. 12 and 14]. Consumes the flat alternating/bundle files and the Hom template.*

- **0.1 The wedge on `ContinuousAlternatingMap`**, in the determinant convention, at the algebra-valued
  generality (through a continuous bilinear map, so ℝ- and vector-valued wedges are one definition):
  bilinearity, associativity, graded commutativity, the norm bound with its explicit constant, compatibility
  with `compContinuousLinearMap`, the alternatization characterization, and the two normalization identities
  of the conventions. **Interior product** `ι_v`, with `ι_v ∘ ι_v = 0` and the degree-(−1) antiderivation
  rule [Lee, Lemma 14.13]. ⚠ No linear equivalence between alternating and multilinear map spaces exists to
  transfer along.
- **0.2 The smooth alternating bundle:** the `ContMDiffVectorBundle` instance for
  `fun x ↦ E₁ x [⋀^ι]→L[ℝ] E₂ x`, mirroring `VectorBundle/Hom.lean`; general bundles first, then
  `E₁ = TangentSpace I`, `E₂ = Bundle.Trivial M F`, so cotangent, 2-form and top-degree bundles are
  instances of one construction.
- **0.3 Rough and smooth forms, unbundled first:**
  `RoughForm I M F k := (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] F` with a `ContMDiff` section predicate;
  **pullback** `mpullback f ω x := (ω (f x)).compContinuousLinearMap (mfderiv I I' f x)`, total and
  junk-valued after `VectorField.mpullback`, with `mpullback_id`, `mpullback_comp`, linearity,
  smoothness-preservation and the wedge-homomorphism property; `k = 0` ↔ functions and d-of-`k = 0` ↔
  `mvfderiv`; support API (`tsupport`, restriction to `Opens M`); pointwise wedge with the graded-algebra
  identities. ⚠ Every theorem `Within`-first with `univ` specializations, mirroring the flat file, or the
  manifold-with-boundary cases die later.
- **0.4 Bundled C^∞ forms:** `Ω^k⟮I, M; F⟯` as `ContMDiffSection` with `AddCommGroup`, `Module ℝ`, `CoeFun`,
  `ext`, `_apply`; the `k = 2` equivalence with `TauCeti.SmoothTwoForm`; the graded algebra `Ω^•`.
  *Acceptance:* over `𝓘(ℝ, E)` bundled forms coincide with the flat carrier and `mpullback` with the flat
  pullback, as lemmas not defeq.

### Layer 1: the exterior derivative and its naturality

*[Lee, Ch. 14]. Consumes layer 0, the flat `extDeriv` suite, `extChartAt` calculus.*

- **1.1 Definition and well-definedness.** `mextDerivWithin I ω s x` and `mextDeriv`: conjugate through
  `extChartAt I x`, apply `extDerivWithin` on `(extChartAt I x).symm ⁻¹' s ∩ Set.range I`, pull back through
  `mfderivWithin`. Chart-independence is `extDerivWithin_pullback` on transition maps over `Set.range I`,
  whose hypotheses hold there for any model with corners; the `writtenInExtChartAt` rewriting is packaged as
  the reusable lemma the layer runs on. Plus locality, ℝ-linearity, `mextDeriv = extDeriv` over `𝓘(ℝ, E)`,
  and `mextDeriv` of a 0-form = `mvfderiv`.
- **1.2 Naturality.** For `ContMDiffAt I I' n f x` with `2 ≤ n`,
  `mpullback f (mextDeriv ω) = mextDeriv (mpullback f ω)` — `At`, `On` and global forms, plus the
  `Diffeomorph` corollary.
- **1.3 d² = 0 and smoothness-preservation.** `mextDeriv_mextDeriv` for C² forms; the new flat lemma that
  `extDerivWithin` of a `ContDiffOn n` form is `ContDiffOn (n−1)` on the same set (stated to apply on
  `Set.range I`), and its manifold transfer, so at ∞ d maps `Ω^k` to `Ω^(k+1)`. ⚠ Absent from the pin and
  load-bearing for layer 6: a target, not an assumption.
- **1.4 Cartan calculus.** The Leibniz rule with unit constants; the invariant formulas for `mextDeriv` on
  1-forms and in all degrees through `VectorField.mlieBracket` [Lee, Prop. 14.29, 14.32]; interior product
  with vector fields; the **Lie derivative of forms**, defined flow-free by the bracket formula [Lee, Cor.
  12.33] with its flow characterization as 3.4's target; **Cartan's magic formula** [Lee, Thm. 14.35].
  *Acceptance:* on `ℝ²`, `d(x dy) = dx ∧ dy` and `d(dx) = 0`.

### Layer 2: orientations and the orientation double cover

*[Lee, Ch. 15]. Consumes `LinearAlgebra/Orientation`, the groupoid API, Tau Ceti covering theory.
Independent of layers 0–1 except where stated.*

- **2.1 Orientability and orientations,** in the chart-sign design of mathlib4#35376, named and shaped
  identically so this layer is deleted when the pin advances past it: `OrientationLift I M ι` (a model
  `Orientation ℝ E ι` plus chart signs `M → M → ℤˣ` supported and continuous on `(chartAt H x).source`,
  compatible under tangent-space transport along coordinate changes), `Manifold.Orientation I M ι` as the
  quotient by the diagonal `ℤˣ`-flip, the Prop-class `Orientable`, the data-class `OrientedManifold`,
  `orientationAt`, `InvolutiveNeg`, `eq_or_eq_neg` on preconnected `M`, the `LocallyConstant`-twisting
  equivalence, and the determinant-criterion bridges. ⚠ Orientation-transport is the definition; determinant
  criteria are derived.
- **2.2 Orientation-preserving maps and volume forms.** Orientation preserving/reversing for local
  diffeomorphisms via `orientationAt` and `Orientation.map`; the pullback orientation [Lee, Prop. 15.15];
  products. Consuming layer 0: a nonvanishing section of the top alternating bundle determines an
  orientation, and conversely on finite-dimensional `M` (boundary allowed) an orientation determines a
  positively-oriented nonvanishing top form ([Lee, Prop. 15.5]; the partition-of-unity direction carries
  `[T2Space M] [SigmaCompactSpace M]` visibly). The consistently-oriented-atlas characterization is a
  theorem for boundaryless `M` with `1 ≤ dim` [Lee, Prop. 15.6], never the definition.
- **2.3 Smooth structures on covers.** A covering space of a C^n manifold carries a canonical
  `ChartedSpace H` and `IsManifold I n` making the projection a local diffeomorphism, and lifts of C^m maps
  are C^m — independent infrastructure the Lie-groups roadmap's simply connected covers need, the pin's only
  covering–manifold bridge running the other way.
- **2.4 The orientation double cover** [Lee, Ch. 15, "Orientations and Covering Maps"]:
  `OrientationCover I M` with its two-sheeted projection (topology via chart-induced trivializations — ⚠
  *not* the sigma topology — or as a `ℤˣ`-quotient cover through
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`), its smooth structure from 2.3, the
  canonical orientation of the total space, the deck involution, and the characterizations: for connected
  `M`, orientable ↔ the cover is disconnected ↔ trivial (`≃ M × Bool`) ↔ it admits a section; nonorientable
  connected `M` has a connected oriented double cover, unique up to orientation-preserving isomorphism over
  `M` [Lee, Thm. 15.41, 15.42]; the deck-group and index-2-subgroup characterization, and still for
  connected `M`, "no index-2 subgroup of π₁(M, x) ⇒ orientable, in particular simply connected ⇒ orientable"
  [Lee, Thm. 15.43] — the covering-space half consumed from Tau Ceti, not rebuilt. *Acceptance:*
  `Set.Icc x y` and spheres are orientable with orientation covers `≃ M × Bool`; the Möbius band (the
  line-bundle-over-`Circle` total space, shaped like mathlib4#40652) is connected and nonorientable with
  connected orientation cover.

### Layer 3: flows

*[Lee, Ch. 9 and 12]. Consumes the `IsMIntegralCurve` suite, `Analysis/ODE/`, `Dynamics/Flow`, Tau Ceti's
integral-curve regularity. Independent of layers 0–2 except the differential-form half of 3.4, which
consumes 0.3 and 1.4.*

- **3.1 Smooth dependence on initial conditions, flat.** The local flow of a `ContDiff ℝ n` field on a
  Banach space is `C^n` jointly in `(t, x₀)` — extend the Picard/`FunSpace` machinery, or take the
  implicit-function route of `TauCeti/Analysis/ODE/SmoothParameter.lean` with the initial condition as
  parameter. Stated flat, in `Analysis/ODE` idiom. ⚠ The one hard new piece of analysis and its own
  milestone, not to be hidden inside the manifold theorem.
- **3.2 The maximal flow.** For a C^n (`1 ≤ n`) field `v` on boundaryless `[T2Space M]`: the domain
  `flowDomain v : Set (ℝ × M)` (open, containing `{0} × M`, interval slices), the flow
  `flowOf v : ℝ → M → M` (total, junk-valued, chosen from uniqueness), and the **fundamental theorem of
  flows** [Lee, Thm. 9.12]: each `flowOf v · x` is the unique maximal integral curve from `x`, the domain is
  open with jointly C^n flow (3.1), and `flowOf v t (flowOf v s x) = flowOf v (s+t) x` holds whenever
  `(s, x)` and `(t, flowOf v s x)` lie in the domain — which forces `(s+t, x)` into it — making each
  `flowOf v t` a diffeomorphism between open sets with inverse `flowOf v (−t)`. **The escape lemma** [Lee,
  Lemma 9.19, strengthened one-sidedly]: a maximal curve whose domain is bounded above eventually leaves
  every compact set, and symmetrically below.
- **3.3 Completeness and homogeneity.** Complete fields; the uniform-time criterion; compactly supported
  fields are complete; every field on a compact manifold is complete [Lee, Thm. 9.16, Cor. 9.17]; a complete
  field's flow as a `Flow ℝ M`, with the `ContMDiff` statement `Flow` cannot record. **Homogeneity**: on
  connected boundaryless `M` the time-1 flow of a compactly supported field carries any point to any other,
  giving a diffeomorphism smoothly isotopic to the identity — the lemma 10.4 uses to move regular values.
  Reconciliation: the Lie-group invariant-field flow of `TauCeti/Geometry/Lie/` *is* `flowOf` of that field.
- **3.4 Naturality, straightening, commuting flows.** `F`-related fields have `F`-conjugate flows [Lee,
  Prop. 9.6, 9.13]; **the straightening theorem** [Lee, Thm. 9.22], layer 4's base case; Lie derivative via
  the flow = `VectorField.mlieBracket` [Lee, Thm. 9.38]; the derivative-of-pullback formula [Lee, Prop.
  9.41]; `[v, w] = 0` ↔ locally commuting flows [Lee, Thm. 9.44]; the canonical form for `k` commuting
  independent fields [Lee, Thm. 9.46]; Lie derivatives of forms via the flow, agreeing with 1.4's flow-free
  definition, and flow-invariance ↔ vanishing Lie derivative ([Lee, Thm. 12.37], for the two carriers this
  roadmap builds — vector fields and forms; general tensor fields have no carrier in the pin and are
  targeted nowhere here). *Acceptance:* the flow of a constant field on `ℝⁿ` is translation; of the rotation
  field on `ℝ²`, the rotation action.
- **3.5 Time-dependent flows** [Lee, Thm. 9.48]: time-dependent fields and their flows on open time-slabs,
  by the autonomous trick over `ℝ × M`.

### Layer 4: the Frobenius theorem

*[Lee, Ch. 19]. Consumes layer 3 (straightening, commuting flows), `VectorField.mlieBracket`,
`IsImmersionAt`, `TauCeti.IsSliceChart`.*

- **4.1 Distributions.** Rank-`k` C^n distributions as `D : (x : M) → Submodule ℝ (TangentSpace I x)` with a
  Prop-valued smoothness predicate — locally spanned by `k` pointwise-independent C^n fields, proving the
  frame criterion [Lee, Lemma 10.32] rather than building a general subbundle theory first — with sections,
  `mem`-API, and the annihilator ideal of forms vanishing on `D` (consumes layer 0).
- **4.2 Involutivity and integral manifolds.** `IsInvolutive I D` with its local-frame reformulation;
  integral manifolds as *immersed* manifolds, an `IsImmersion`-style inclusion whose `mfderiv` has image
  exactly `D` ⚠ *equal to*, not contained in, and ⚠ *immersed*, never assumed embedded; the easy converse
  integrable ⇒ involutive [Lee, Prop. 19.3], with the noninvolutive `∂x + y ∂z, ∂y` on `ℝ³` as a named
  nonexample; the 1-form criterion, `D` involutive ↔ `dη` annihilates `D` whenever the 1-form `η` does [Lee,
  Thm. 19.7].
- **4.3 The local Frobenius theorem.** Every involutive C^∞ rank-`k` distribution is completely integrable
  [Lee, Thm. 19.12] — through every point a **flat chart** carrying `D` to a constant subspace, hence a
  local integral manifold — by induction on rank through 3.4's canonical form, with straightening as base
  case. Local uniqueness: connected integral manifolds lie in single slices of a flat chart [Lee, Prop.
  19.16]; integral manifolds are weakly embedded [Lee, Thm. 19.17]; the flat chart adapted to a transverse
  submanifold [Lee, Cor. 19.13].
- **4.4 Foliations and the global theorem.** Foliations by immersed leaves with flat charts, and **the
  global Frobenius theorem** [Lee, Thm. 19.21]: maximal connected integral manifolds partition `M` into
  leaves, each an immersed submanifold *carrying its own topology* — a type with a finer charted-space
  structure, not a `Set`, since the Lie-groups roadmap's subalgebra ↔ subgroup correspondence needs honest
  immersed leaves and is the first consumer. *Acceptance:* leaves of a constant distribution on `ℝⁿ` are the
  parallel affine slices; `ker (dz − y dx)` on `ℝ³` is not integrable.

### Layer 5: integration on manifolds and Stokes' theorem

*[Lee, Ch. 16]. Consumes layers 0–2, the flat divergence theorem, Jacobian change of variables, partitions
of unity, `InteriorBoundary`.*

- **5.1 The boundary as a smooth manifold.** The smooth structure on `I.boundary M` as an (n−1)-manifold
  with smooth inclusion `∂M ↪ M` — the `InteriorBoundary.lean` TODO, with
  `github.com/Deicyde/lean-boundary-smooth-manifold` as migration source — plus outward/inward-pointing
  vectors, existence of outward-pointing fields along `∂M`, the induced **boundary orientation**
  (outward-first) [Lee, Prop. 15.24], the restriction `ι* : Ω^k(M) → Ω^k(∂M)`, the half-space sign
  recomputed for Mathlib's model, and "`∂M` has measure zero" as 5.2 needs it.
- **5.2 Integration of top-degree forms.** Measurable structure on `M` from the standing
  `[T2Space M] [SigmaCompactSpace M]` and finite-dimension package (which governs the whole 5–9 track) plus
  charts; for oriented `M` and compactly supported top `ω`, `∫_M ω`: chart-locally the Lebesgue integral of
  the coefficient weighted by that chart's sign in the 2.1 `OrientationLift` data, glued by a
  `SmoothPartitionOfUnity`; well-definedness by Jacobian change of variables at interior points — where
  2.2's "orientation-preserving ⇒ positive determinant" applies, so `|det|` sheds its bars — with 5.1's
  measure-zero lemma discharging the boundary. ⚠ Chart signs, not positively-oriented atlases: boundary
  manifolds force this. Plus independence of partition and atlas, linearity, `∫_{−M} ω = −∫_M ω`, positivity
  on positively-oriented orientation forms, diffeomorphism invariance [Lee, Prop. 16.6], and the
  extension-by-zero/bump API (`SmoothPartitionOfUnity.smul` with `tsupport` control) factored out as the
  reusable family 5.3, 7 and 9 all consume.
- **5.3 Stokes' theorem.** For oriented C^∞ `M` with boundary and compactly supported C¹ (n−1)-form `ω`:
  `∫_M dω = ∫_{∂M} ι*ω`, by partition of unity, single-chart reduction and the half-space computation from
  the flat divergence theorem on exhausting boxes. Corollaries: `∫_M dω = 0` on boundaryless `M` [Lee, Cor.
  16.13]; `∫_{∂M} ι*ω = 0` for closed `ω`; the 1-dimensional case reconciled with `intervalIntegral`;
  Green's theorem on planar domains with smooth boundary; and `∫_γ ω` agreeing with Mathlib's
  `curveIntegral` over paths.
- **5.4 Stokes for `M × Icc` and homotopy invariance.** The product `M × Set.Icc (0:ℝ) 1` for boundaryless
  `M` (via `boundary_product`), Stokes there, and the homotopy-invariance kernel: pullbacks of a closed form
  along smoothly homotopic maps differ by an exact form, through the explicit operator
  `h ω = ∫_0^1 ι_t^* (ι_{∂_t} ω) dt` [Lee, Ch. 17, "Homotopy Invariance"]. ⚠ Deliberately avoids general
  corners: `M × Icc` suffices for layers 6–11.
- **5.5 Two scoped generalizations, last:** Stokes on manifolds with corners, and densities/integration of
  functions on nonorientable manifolds [Lee, Ch. 16, "Densities"] — in scope here and nowhere else; neither
  blocks layers 6–12. *Acceptance:* `∫_{Icc 0 1} df = f 1 − f 0`; the **angular form** — a named target,
  `circleAngularForm`, the 0.3 pullback of `x dy − y dx` along `S¹ ↪ ℝ²`, written `dθ` below — has
  `∫_{S¹} dθ = 2π`; Green on the unit square, from the flat box divergence theorem (the square has corners,
  so that gate belongs here and to the flat layer, not to 5.3).

### Layer 6: the de Rham complex and cohomology

*[Lee, Ch. 17]. Consumes layers 0–1 and `Algebra/Homology/`.*

- **6.1 The complex.** `mextDerivₗ : Ω^k⟮I, M⟯ →ₗ[ℝ] Ω^(k+1)⟮I, M⟯` and
  `deRhamComplex I M : CochainComplex (ModuleCat ℝ) ℕ` via `CochainComplex.of`, with `d_comp_d` from 1.3.
  Both presentations: the concrete `deRhamCohomology I M k` as a `Submodule.Quotient` with
  `IsClosed`/`IsExact` predicates and element-level API — what analytic arguments compute with, and what
  Heegaard Floer's "closed 2-form" consumes — and the categorical `(deRhamComplex I M).homology k`, with the
  comparison isomorphism. Functoriality: `mpullback` as a cochain map (1.2), the induced map on cohomology,
  `pullback_id`, `pullback_comp` — unbundled lemmas, no manifold category.
- **6.2 Degree zero and the Poincaré lemma.** `H⁰ ≅` locally constant functions; `H^k(pt)`; the **Poincaré
  lemma in all degrees** — on star-shaped open sets of a normed space, closed C¹ k-forms (`k ≥ 1`) with
  values in a complete space are exact, stated flat in the `extDerivWithin` idiom beside Mathlib's 1-form
  convex case, with the explicit radial homotopy operator (a Bochner integral, whence completeness);
  manifold corollary: closed forms are locally exact [Lee, Thm. 17.14, Cor. 17.15].
- **6.3 Homotopy invariance.** Smoothly homotopic maps induce equal maps on `H^•` (5.4's operator);
  homotopy-equivalent manifolds have isomorphic cohomology; `H^•(ℝⁿ)`. The `H¹`–π₁ bridge, for connected
  `M`: the injection `H¹_dR(M) → Hom(π₁(M, x), ℝ)` by integrating over loops [Lee, Thm. 17.17], hence
  `H¹_dR = 0` for simply connected `M`. Two named prerequisites live here: the integral of a 1-form along a
  piecewise-C¹ path in `M` (pullback to the interval plus `intervalIntegral`, reconciled with
  `curveIntegral`) with homotopy invariance for closed forms; and the smooth-representative lemma — every
  continuous loop and homotopy of loops deforms chart-by-chart to a piecewise-smooth one — so nothing here
  waits on layer 8.
- **6.4 Compact supports.** The subcomplex `Ω_c^•` via `HasCompactSupport`, `H^•_c`, covariant functoriality
  along open inclusions ⚠ and *only* proper maps in general; `H^n_c(ℝⁿ)` via the compactly supported
  Poincaré lemma [Lee, Lemma 17.27]. *Acceptance:* `H^k_dR(ℝⁿ)`; `[dθ] ≠ 0` in `H¹_dR(S¹)`.

### Layer 7: Mayer–Vietoris for de Rham cohomology

*[Lee, Ch. 17]. Consumes layer 6, `HomologySequence`, partitions of unity.*

- **7.1 The short exact sequence.** For `U V : Opens M` with `U ⊔ V = ⊤`, under the standing
  `[T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` package — surjectivity is a partition-of-unity
  statement and is false without it — `0 → Ω^•(U ⊔ V) → Ω^•(U) ⊕ Ω^•(V) → Ω^•(U ⊓ V) → 0` as a
  `ShortComplex (CochainComplex (ModuleCat ℝ) ℕ)` with its `ShortExact` witness; restrictions from 0.3, sign
  convention `(res, −res)` matching Mathlib's sheaf-MV so the two are comparable arrow-for-arrow;
  surjectivity by the extension trick of 5.2.
- **7.2 The long exact sequence,** immediately from `ShortComplex.ShortExact.homology_exact₁/₂/₃` — zero new
  homological algebra — with the connecting map named, its explicit partition-of-unity description [Lee,
  Cor. 17.42], and naturality in `(M, U, V)`.
- **7.3 The compactly supported variant** `0 → Ω_c^•(U ⊓ V) → Ω_c^•(U) ⊕ Ω_c^•(V) → Ω_c^•(U ⊔ V) → 0`
  (arrows reversed, extension by zero) and its LES — owned here because layer 9 consumes it. *Acceptance:*
  `H^k_dR(Sⁿ)` by induction from the two-cap cover [Lee, Thm. 17.21], the top class spanned by any
  orientation form (2.2's, detected by 5.2's positivity and 5.3's `∫ dη = 0`) — the flagship computation and
  layer 10's substrate.

### Layer 8: singular cohomology and the de Rham theorem

*[Lee, Ch. 18]. Consumes Mathlib singular homology and layers 5–7. Route of record: [Lee]'s — integration
over smooth simplices and a Mayer–Vietoris induction (de Rham–Weil). The sheaf route through `Sheaf.H` is
the recorded alternative, not the route: the pin lacks both fine-sheaf acyclicity and the Čech/derived
comparison, a larger detour than the chain-level argument.*

- **8.1 Singular cohomology.** The singular cochain complex with coefficients in a module over a commutative
  ring `R` (specialized to `ℝ` where the comparison needs it): dualize `singularChainComplexFunctor`
  degreewise, or apply `alternatingCofaceMapComplex` to the cosimplicial module of cochains; contravariant
  functoriality; homotopy invariance transferred from the chain level; `H⁰`; and the universal-coefficient
  identification over ℝ, `H^p(X; ℝ) ≅ Hom(H_p(X; ℝ), ℝ)`, recovering [Lee]'s dual-of-homology definition as
  a theorem.
- **8.2 Subdivision and Mayer–Vietoris, singular.** Barycentric subdivision as a chain map chain-homotopic
  to the identity; the small-simplices theorem; MV for singular homology and cohomology of an open pair
  [Lee, Thm. 18.4, 18.6]; `H_•(Sⁿ; R)`, with the fundamental class of `S¹` as the class of the standard
  smooth loop simplex (8.5's gate evaluates against it). ⚠ The layer's hidden mountain, deliberately named:
  at the chain level the pin subdivides nothing — its only subdivision is the simplicial-set functor
  `SSet.sd`, with no comparison to the identity. (Excision is *not* a target; MV is all the comparison
  needs.)
- **8.3 Smooth chains.** Smooth singular simplices and chains, and the smoothing operator: the inclusion of
  smooth into continuous chains is a chain-homotopy equivalence [Lee, Thm. 18.7]. Named prerequisites:
  Whitney approximation *into a manifold* (relative version), via a Whitney embedding of a neighbourhood of
  a compact subset — singular simplices have compact image, so the compact-subset version serves every
  manifold, not only compact ones — and the ε-neighbourhood retraction of the embedded image, the intrinsic
  theory staying with the geometric-topology roadmap.
- **8.4 Stokes for chains and the de Rham homomorphism.** `∫_c ω` for smooth `p`-chains; Stokes for chains
  `∫_{∂c} ω = ∫_c dω` [Lee, Thm. 18.12] by the explicit face computation on the standard simplex; the de
  Rham homomorphism `I : H^p_dR(M) → H^p(M; ℝ)`, well defined by 8.3 and Stokes-for-chains, natural in `M`,
  compatible with both connecting maps [Lee, Prop. 18.13].
- **8.5 The de Rham theorem.** `I` is an isomorphism in every degree for every T2 σ-compact
  finite-dimensional smooth manifold [Lee, Thm. 18.14] — the standing hypotheses are load-bearing (see
  *Statements that must not enter*). The de Rham–Weil induction runs in two named stages: first "every open
  subset of `ℝⁿ` is de Rham" (exhaustion by finite unions of convex sets, where the MV induction closes
  since convex sets are intersection-stable; ⚠ chart domains are *not*, which is why this stage is
  separate), then the manifold case via charts, diffeomorphism-invariance of the de-Rham property (a named
  lemma), MV on both sides, countable disjoint unions and the Poincaré-lemma base case. ⚠ No geodesic
  convexity — do not route through Riemannian geometry. Corollary (with 8.1):
  `H^p_dR(M) ≅ Hom(H_p(M; ℝ), ℝ)`, the milestone "de Rham ≅ singular". *Acceptance:* the composite recovers
  7.3's sphere computation from Mathlib-side singular data; `I` sends `[dθ]` to the cochain whose value on
  the fundamental class of `S¹` (8.2's target) is `2π`, reusing 5.5's number to catch orientation drift.

### Layer 9: Poincaré duality

*[Lee, Problems 18-6, 18-7, 18-8; proof shape Bott–Tu Ch. I §5]. Consumes layers 5–7 (compact supports), 2
(orientation) and 8.5's induction pattern.*

- **9.1 The pairing.** For oriented boundaryless n-manifolds, `(ω, η) ↦ ∫_M ω ∧ η` descends to
  `H^k_dR(M) × H^{n−k}_c(M) → ℝ` (Stokes kills the boundary terms), giving
  `PD : H^k_dR(M) → (H^{n−k}_c(M))*`.
- **9.2 Top cohomology.** Integration `H^n_c(M) → ℝ` is an isomorphism for connected oriented `M` [Lee, Thm.
  17.30-style]; for connected *non*orientable `M`, `H^n_c(M) = 0`, and for compact connected nonorientable
  `M` also `H^n_dR(M) = 0`, by averaging over the layer-2 orientation cover [Lee, Thm. 17.34, via Lemma
  17.33] — the theorem that makes the double cover load-bearing rather than decorative. (`H^n_dR(M) = 0` for
  connected *non*compact `M` is a 9.3 corollary: `H^n ≅ (H^0_c)* = 0`.) Compact connected oriented case:
  `H^n_dR(M) ≅ ℝ` via `∫_M`.
- **9.3 The duality theorem.** `PD` is an isomorphism for every T2 σ-compact oriented boundaryless
  n-manifold — no compactness hypothesis, the dual landing on the compactly supported side — by MV-induction
  with the five lemma, base case 6.2/6.4, following 8.5's template. Corollaries: for compact oriented `M`,
  `H^k ≅ (H^{n−k})*`; finite-dimensionality of all `H^k_dR` of compact manifolds; the top-cohomology pairing
  vocabulary. ⚠ The Hodge-theoretic proof is deliberately rejected: elliptic theory is the PDE roadmap's,
  and duality must not depend on it. *Acceptance:* duality on `Sⁿ` and `ℝⁿ` recovers 7.3 and 6.4;
  `⟨[dθ], [1]⟩ = ∫_{S¹} dθ = 2π ≠ 0`, pairing against the class of `1` in `H⁰_c(S¹)`.

### Layer 10: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"]. Consumes layers 2, 5, 7, 9.2 and Tau Ceti's Sard.*

- **10.1 The manifold inverse function theorem.** `mfderiv` invertible at `x` ⇒ `IsLocalDiffeomorphAt` — the
  `LocalDiffeomorph.lean` TODO, built from the flat IFT through `extChartAt` — plus regular points and
  values for equidimensional C^∞ maps in the chart-normal-form idiom. The layer's first target, of
  independent value.
- **10.2 Manifold Sard, equidimensional.** Measure-zero subsets of a manifold (chart-defined; second
  countability makes it well defined) and the transfer of Tau Ceti's equal-dimension Sard: critical values
  form a measure-zero set, so regular values are dense [Lee, Thm. 6.10-style].
- **10.3 The stack of records and the orientation-theoretic degree.** For C^∞ `f : M → N` with `M` compact,
  `N` connected, both oriented boundaryless n-manifolds: at a regular value `y` the fiber is finite, `f` is
  a local diffeomorphism near each preimage and evenly covers a neighbourhood;
  `deg f := Σ_{x ∈ f⁻¹ y} sign (mfderiv f x)`, the sign from 2.1's `orientationAt`.
- **10.4 The two definitions agree.** The headline [Lee, Thm. 17.35]: for every compactly supported top form
  `ω` on `N`, `∫_M f*ω = deg f · ∫_N ω` — so the sum of signs is independent of the regular value, and `deg`
  is the scalar by which `f*` acts on `H^n ≅ ℝ` (9.2). The milestone "orientation definition ≡ de Rham
  definition"; proved via 10.3, Stokes and 3.3's homogeneity.
- **10.5 Degree calculus.** `deg (g ∘ f) = deg g · deg f` (with `N` compact and `P` connected, so both
  factors are defined); diffeomorphisms have degree `±1`; smooth-homotopy invariance (Stokes on `M × Icc`);
  `deg f ≠ 0` ⇒ `f` surjective; extension to continuous maps with sphere target (`SmoothApprox` into the
  ambient space, radial normalization, the straight-line homotopy) with homotopy-class well-definedness —
  enough for every corollary here, the general-target extension going through 8.3's Whitney approximation as
  a separate later item; `deg (antipodal : Sⁿ → Sⁿ) = (−1)^{n+1}`. Corollaries: no retraction
  `Sⁿ ↛ B^{n+1}`, and the Brouwer fixed-point theorem in all dimensions. Reconciliation, not duplication: on
  `S¹`, `deg` agrees with the winding integer of `TauCeti.Circle.fundamentalGroupMulEquiv` under the
  π₁-abelianization pairing; the conformal-mapping roadmap's holomorphic local degree is cited, not
  re-proved. *Acceptance:* `deg id = 1`, `deg const = 0`, `deg (z ↦ zⁿ) = n` on `S¹`,
  `deg antipodal = (−1)^{n+1}` — four gates catching a vacuous or sign-flipped degree.

### Layer 11: the hairy ball theorem

*[Lee, Problem 16-6, by the degree route]. Consumes layer 10 and the sphere instances.*

- **11.1 The theorem.** Elementary form first: for `E` with `[Fact (finrank ℝ E = n + 1)]` and `n` even,
  every continuous `w : sphere (0:E) 1 → E` with `⟪w x, x⟫ = 0` vanishes somewhere. Reduce continuous to
  smooth (`SmoothApprox`, tangential projection, compactness), normalize, build the great-circle homotopy
  from `id` to the antipodal map that a nonvanishing field provides, and contradict
  `deg antipodal = (−1)^{n+1} ≠ 1 = deg id` (for `n ≥ 2`; `n = 0` is direct — in a 1-dimensional ambient
  space tangency forces `w = 0`).
- **11.2 The manifold form and the dichotomy.** Every C⁰/C^∞ section of `TangentBundle` over an
  even-dimensional sphere vanishes, through an explicit `mfderiv`-composition bridge with 11.1 (⚠
  `range_mfderiv_coe_sphere`'s identification is non-canonical: bridge by composition, not defeq). The odd
  case: the explicit nonvanishing rotation field on `S^{2m+1}` (definition, `contMDiff`, `ne_zero`), giving
  **"Sⁿ admits a nowhere-vanishing tangent field iff n is odd"**; corollaries, no continuous unit tangent
  field on even spheres and `S^{2m}` not parallelizable. ⚠ Not via Euler characteristics — the degree route
  stands alone, and Poincaré–Hopf is a target of no current roadmap.

### Layer 12: Riemannian metrics and the Laplace–Beltrami operator

*[Lee, Ch. 13 and 16]. Consumes the Riemannian substrate, `CovariantDerivative` and layers 0, 2, 5 where
stated.*

- **12.1 Existence and examples of metrics.** Every second-countable T2 finite-dimensional C^∞ manifold
  admits a `ContMDiffRiemannianMetric` (partition of unity, convexity of the positive-definite cone) [Lee,
  Prop. 13.3]; pullback metrics along immersions, product metrics, the induced metric on `Opens` and on
  5.1's boundary manifold, and the round metric on spheres — the pullback of the ambient inner-product
  metric along the inclusion, 12.5's volume gate. Built here now, shaped like mathlib4#33714, deleted when
  the pin passes it.
- **12.2 Musical isomorphisms and the gradient.** `flat`/`sharp` as C^∞ bundle isomorphisms `TM ≅ T*M`
  (fiberwise Fréchet–Riesz); `mgradient f x := sharp (mfderiv f x)` with junk-value conventions, linearity,
  the chain rule and flat-model compatibility with `Analysis/Calculus/Gradient`.
- **12.3 The Levi-Civita connection.** Metric-compatibility and torsion for a `CovariantDerivative` on
  `TangentSpace I` (shaped like mathlib4#36845), and the fundamental theorem of Riemannian geometry:
  existence and uniqueness of the metric-compatible torsion-free connection, by the Koszul formula,
  tensoriality and the musical isomorphisms, avoiding local frames. Divergence as the pointwise trace of a
  covariant derivative; the Hessian with its basic API (symmetry from torsion-freeness, the flat-model
  computation, the value at critical points); `laplaceBeltrami f := div (mgradient f)` = trace of the
  Hessian, registered in the `Δ` class.
- **12.4 The volume form and the measure.** On oriented Riemannian n-manifolds: the Riemannian volume form
  (the unique positively-oriented unit-length top form, `Orientation.volumeForm` fiberwise; consumes layers
  0 and 2) [Lee, Prop. 15.29]; the Riemannian measure `∫_M f dV_g` via 5.2, strictly positive on nonnegative
  nonzero continuous integrands; `div` re-characterized by `d(ι_X dV_g) = (div X) dV_g` — the bridge between
  12.3's trace definition and [Lee]'s form-level one, with orientation-independence of `div` recorded.
- **12.5 The divergence theorem and Green's identities.** `∫_M div X dV_g = ∫_{∂M} ⟪X, N⟫ dV_{g̃}` for
  compactly supported `X` (outward unit normal `N`, induced metric and orientation from 5.1/12.1) [Lee, Thm.
  16.32]; Green's first and second identities; `Δ` symmetric on functions with `tsupport` inside
  `I.interior M`, hence on all compactly supported functions when `M` is boundaryless. **Stop here**:
  eigenvalues, elliptic regularity, maximum principles and heat kernels are the PDE roadmap's. *Acceptance:*
  on the flat model `laplaceBeltrami` agrees with the `Δ` of `InnerProductSpace.instLaplacian` (the sign
  gate); `Δ‖x‖² = 2n` on `ℝⁿ`; the volume of `S¹` with the round metric is `2π`, reusing 5.5's integral.

## Statements that must not enter the library

Each is a tempting formalization error with a concrete refutation; reject any target or proof that smuggles
one in.

- **"Orientable = admits a positive-Jacobian atlas", as a definition.** False with boundary: `Set.Icc 0 1`
  is orientable, but its two standard interval charts cannot be made positively-transitioning. Chart-sign
  data (2.1) is the definition; the atlas criterion is a boundaryless theorem.
- **"The sigma topology on pointwise orientations is the orientation cover."** That topology is discrete on
  the total space, and a projection from a discrete space onto a non-discrete `M` is not a local
  homeomorphism, hence no covering map.
- **"`H^•_c` is functorial for all smooth maps."** Extension by zero needs open inclusions; general
  functoriality holds only for proper maps — the constant map `ℝ → pt` on `H^0_c` is the two-line
  counterexample.
- **"Integral manifolds are embedded" / "leaves carry the subspace topology."** The irrational line on the
  torus is a leaf, dense in the subspace topology; only *immersed, weakly embedded* is true (4.3).
  Relatedly, **"`T_pS ⊆ D_p` suffices"**: containment defines the larger class of tangent submanifolds, for
  which Frobenius is false (any curve in a 2-distribution).
- **"[Lee]'s boundary-orientation signs transfer verbatim."** Mathlib's half-space constrains the first
  coordinate, [Lee]'s the last; the induced sign on `∂Hⁿ` differs and must be recomputed.
- **"Δ = −div ∘ grad", with [Lee]'s sign.** This repository pins `Δ = div ∘ grad`; the geometer-sign
  statement contradicts 12.5's flat compatibility gate.
- **"Degree is defined for noncompact domains, or at critical values without care."** The fiber-sign sum can
  be infinite or undefined: the inclusion of `(0, ∞)` into `ℝ` has no degree, its sum being `1` over regular
  values `y > 0` and `0` over `y < 0`.
- **"The de Rham comparison holds for every `IsManifold`."** `IsManifold` does not include Hausdorffness,
  and the line with two origins is an orientable boundaryless counterexample: `H¹_dR = 0` (a closed 1-form's
  chart representatives glue to a primitive) while singular MV gives `H¹(–; ℝ) ≅ ℝ`. The standing
  `[T2Space M] [SigmaCompactSpace M]` hypotheses are load-bearing on every cohomological summit.
- **"`Prop`-typed placeholder targets are acceptable in `Suggested.lean`."** Repository law, restated
  because this roadmap has many not-yet-expressible layers: a condition that cannot be stated yet is prose
  in the README, never `def _ : Prop := sorry`.

## Relation to sibling roadmaps

- **Universal covers** owns π₁, covering-space classification, deck groups and πₙ; 2.4 and 6.3 consume them,
  and its own targets are purely topological and consume nothing from here.
- **Geometric topology** consumes the orientation interface (its connected-sum and surgery layers quantify
  over `[Oriented M]`-style hypotheses) and the singular cohomology machinery — its Euler-class layer
  additionally needs ℤ coefficients and surface fundamental classes, which it builds itself. Three shared
  seams, resolved: the boundary-as-manifold structure its gluing track names as its first prerequisite is
  5.1's target, one file serving both; the general distribution/foliation objects are layer 4's, its
  codimension-one layer specializing them, so a single foliation definition enters the library; the
  Riemannian volume form, measure and densities are 12.4/5.5's, consumed by its hyperbolic-volume targets.
  It keeps intrinsic tubular/collar neighbourhoods, gluing and everything 3-manifold-specific.
- **PDE** owns everything analytic about `Δ` past 12.5 and pins the flat conventions 12.5's gate must match:
  this roadmap defines, PDE analyzes.
- **Heegaard Floer (analytic)** lists manifold orientations and degree theory among its missing
  prerequisites; layers 2 and 10 supply them, 0.4's bridge and 6.1's closedness let its symplectic lane
  refactor onto the general forms library without a fork, and flat Sard is consumed from it, not rebuilt
  (10.2).
- **Representation theory / Lie groups** states Frobenius "as the named analytic prerequisite" of its
  subalgebra ↔ subgroup correspondence: layer 4 is that target's home, built to its consumer's specification
  — the theorem lives here, the citation there. Its Layer-0 Lie-group flows are subsumed by layer 3 with
  named reconciliation lemmas; its simply connected covers consume 2.3.
- **Contour integration** owns contour integrals of complex functions; 5.3 reconciles with `curveIntegral`
  and goes no further. **Modular forms** may refactor its region-Stokes workaround onto layer 5 — its
  decision, not an obligation created here. **One-parameter semigroups** owns the operator-semigroup
  analogue of flows.

## Ordering

Layers 0 → 1 are the spine and start first, following the bundled-forms design direction of the threads
below. Layers 2, 3 (its 3.4 form-half excepted) and 12.1–12.3 are independent on-ramps that can run in
parallel with the spine from day one; layer 4 needs 3 (and 1.4 for its 1-form criterion); 12.4–12.5 need 0,
2 and 5. The integration track is strictly 5 → {6, 7} → 8 → 9, with 6 and 7 available as soon as 0–1 land
(only 5.4 inside them needs Stokes). Degree (10) needs 2, 5, 7 and 9.2; the hairy ball (11) needs 10 and
nothing else. The subtle work concentrates in three places — the flat smooth-dependence theorem (3.1), the
singular subdivision layer (8.2) and the boundary-manifold structure (5.1) — so start each early inside its
layer, as they gate everything after them. Claim at the granularity of single numbered items or smaller; the
headline theorems (5.3, 8.5, 9.3, 10.4, 11.1) are staged claims whose intermediate lemmas must land as
reusable pull requests.

## Acknowledgements

This roadmap follows designs settled in the Lean community over several years, and would not exist without
those discussions: [Definition for differential forms][t1] (Yury Kudryashov's
bundle-of-continuous-alternating-maps design; Dylan Ede, Kevin Buzzard, Patrick Massot) and [Help wanted:
notation for differential forms][t2] (Sébastien Gouëzel's unbundled-first staging); [Stokes' theorem][t3]
and [Current Status of the Stokes' theorem][t4] (Kudryashov's box-integral divergence chain; Michael
Rothgang's boundary program); [Orientable Surface][t5] (Rida Hamadani, Rothgang, Gouëzel, Heather Macbeth —
where the positive-Jacobian definition was refuted for boundaries and the chart-sign design emerged) and
[Orientation double cover of a manifold with boundary][t6]; [Properties of wedge product of differential
forms][t7] and [Poincaré lemma][t8] (Sam Lindauer, Kudryashov); [(Pseudo) Riemannian metric][t9] and
[riemannian geometry][t10] (Gouëzel's `RiemannianBundle` design; Macbeth's Hom-bundle metrics; Massot's
partition-of-unity existence) and [Laplacian][t11] (Stefan Kebekus); [integral curves on manifold][t12]
(Winston Yin's programme, whose stated next step this roadmap's layer 3 is) and [Completed proof of the
Brouwer Fixed Point Theorem][t13] (Brendan Seamas Murphy). Thanks to the authors of the formalizations and
designs named in *Prior work and coordination* — Kudryashov, Lindauer, Michael Lee, Yin, Rothgang, Macbeth,
Gouëzel, Massot, Floris van Doorn, Oliver Nash, Pietro Monticone, Ziyang Qin, Yuan Liao and Murphy — and to
everyone in the threads above.

[t1]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Definition.20for.20differential.20forms.html
[t2]: https://leanprover-community.github.io/archive/stream/287929-mathlib4/topic/Help.20wanted.3A.20notation.20for.20differential.20forms.html
[t3]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Stokes'.20theorem.html
[t4]: https://leanprover-community.github.io/archive/stream/287929-mathlib4/topic/Current.20Status.20of.20the.20Stokes'.20theorem.html
[t5]: https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Orientable.20Surface.html
[t6]: https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Orientation.20double.20cover.20of.20a.20manifold.20with.20boundary.html
[t7]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Properties.20of.20wedge.20product.20of.20differential.20forms.html
[t8]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Poincar.C3.A9.20lemma.html
[t9]: https://leanprover-community.github.io/archive/stream/113488-general/topic/(Pseudo).20Riemannian.20metric.html
[t10]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/riemannian.20geometry.html
[t11]: https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Laplacian.html
[t12]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/integral.20curves.20on.20manifold.html
[t13]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Completed.20proof.20of.20the.20Brouwer.20Fixed.20Point.20Theorem.html
