# Roadmap: differential geometry — forms, de Rham cohomology, flows, and degree

Mathlib has a mature smooth-manifold core: `IsManifold` over any `ModelWithCorners`, tangent and general
`ContMDiffVectorBundle`s, `mfderiv`/`mvfderiv`, Lie brackets, integral curves, smooth partitions of unity,
a boundary/interior calculus, and a complete *flat* exterior calculus on normed spaces (`extDeriv`,
d² = 0, naturality under pullback). It has almost none of the geometry one actually builds on such a
core. There are no differential forms on manifolds — indeed no wedge product even on normed spaces — no
manifold exterior derivative, no orientability, no integration of forms, no Stokes' theorem, no de Rham or
singular cohomology, no flows (the integral-curve theory stops just short of the maximal flow), no
Frobenius theorem, no Riemannian Laplacian, and no mapping degree.

This roadmap asks for that theory, following Lee's *Introduction to Smooth Manifolds*. The big theorems
are the de Rham theorem (`H^p_dR(M) ≅ H^p(M; ℝ)`, by integration over smooth simplices), Stokes' theorem
(`∫_M dω = ∫_{∂M} ω`), the fundamental theorem of flows, the Frobenius theorem, and the theory of the
mapping degree, with its orientation-theoretic and cohomological definitions proved equal; the hairy ball
theorem comes along as an application, and the Laplace–Beltrami operator is where the Riemannian side
ends. Everything below the big theorems is meant as reusable library — the geometric-topology, Heegaard
Floer and Lie-groups roadmaps each list parts of this material among their missing prerequisites, and the
flat conventions of the PDE roadmap constrain the Laplacian built here.

The reference is John M. Lee, *Introduction to Smooth Manifolds*, 2nd edition, Springer GTM 218, cited as
[Lee] with that edition's numbering; where a layer departs from the book's route, it says so. Suggested
homes, following Mathlib's layout (code organization and roadmap scope do not coincide; place
files by Mathlib convention, and attribute pull requests to this roadmap by name):
`TauCeti/Geometry/Manifold/{DifferentialForm,Orientation,Flow,Distribution,Integration,DeRham,Riemannian}/`,
`TauCeti/AlgebraicTopology/SingularCohomology/`, and flat prerequisites under `TauCeti/Analysis/`.

## Standing hypotheses and conventions

State each of these explicitly where it is used; never bake them in.

- **Scalars and regularity.** Everything is over `ℝ`, in Mathlib's setting: `I : ModelWithCorners ℝ E H`
  and `M` with `[ChartedSpace H M] [IsManifold I n M]`. Pointwise theorems are stated at the lowest
  finite regularity the flat layer asks for (C² for the `extDeriv` facts, C³ for the Lie-bracket API).
  The global theory — the de Rham complex and everything cohomological — is simply fixed at C^∞, so that
  d carries smooth sections to smooth sections and nobody has to manage a decreasing ladder of
  regularities. Analytic (`ω`) refinements are not targeted.
- **Finite dimension is a hypothesis, not a default.** Write `[FiniteDimensional ℝ E]` exactly where it
  is needed — orientations, integration, Sard, degree, partitions of unity, 3.3's homogeneity — while
  layers 0–1 and 3 otherwise stay
  Banach-general, matching Mathlib's `extDeriv` and `IsMIntegralCurve`. Smooth partitions of unity and
  smooth approximation also need `[T2Space M] [SigmaCompactSpace M]`, so every statement that uses them
  carries those hypotheses visibly. Where measurable structure wants second countability, it already
  follows from these two together with charts.
- **Boundary policy, per layer.** Layers 0–1 work over any `ModelWithCorners`, boundary included.
  Orientation (layer 2) is stated for a general `I`; be careful here, because ⚠ "orientable = admits a
  positive-Jacobian atlas" is *false* as a definition once boundaries are allowed (see *Statements that
  must not enter*) — chart signs are exactly what make `Set.Icc x y` orientable. In layer 3, the local
  `IsMIntegralCurve` statements are used at interior points just as Mathlib states them, while the
  maximal-flow theory of 3.2–3.5 is for boundaryless `M`. Stokes' theorem (layer 5) is stated for
  manifolds with boundary; corners beyond `M × Icc` belong to 5.5.
- **The boundary model.** Mathlib's `EuclideanHalfSpace n` constrains the *first* coordinate; [Lee]'s `Hⁿ`
  constrains the *last*. So all boundary-orientation signs (the `(−1)ⁿ` of [Lee, Example 15.26]) have to
  be recomputed for Mathlib's model and recorded as lemmas — do not transcribe them from the book. The
  one convention that does transfer between the two models is "outward-pointing vector first".
- **Orientation.** Fibers reuse `Orientation ℝ (TangentSpace I x) ι`, with explicit
  `Fintype.card ι = Module.finrank ℝ E` hypotheses as in `LinearAlgebra/Orientation.lean` (and the
  `Fact (finrank ℝ E = n)` device of `Analysis/InnerProductSpace/Orientation.lean` where instances are
  wanted). A manifold orientation is chart-sign data, quotiented as in layer 2: orientation transport is
  the definition, and the determinant criteria are derived from it.
- **Wedge normalization.** The determinant convention: `ω ∧ η = ((k+l)!/(k!·l!)) • Alt (ω ⊗ η)`. Under
  it, `ε^I ∧ ε^J = ε^{I++J}`, a top-degree wedge of covectors is the determinant `det (ωʲ(vᵢ))`, and the
  Leibniz rule for `extDeriv` (built on the normalization-free `alternatizeUncurryFin`) holds with unit
  constants. Record the conversion to [Lee]'s Alt convention at the point where the wedge is defined, and
  keep the two identities above as named lemmas — they are what catches a mis-normalized wedge.
- **Laplacian sign.** `Δ = div ∘ grad`, agreeing with the flat `Δ` of
  `Analysis/InnerProductSpace/Laplacian.lean` (`InnerProductSpace.instLaplacian`, `laplacianWithin`,
  `laplacian_eq_iteratedFDeriv_orthonormalBasis`) and with the PDE roadmap's pinned convention. [Lee,
  Problem 16-13ff] uses the geometer's sign, which is the negation, so every identity imported from the
  book flips sign. The flat compatibility lemma is one of 12.5's acceptance gates.
- **Total functions, junk values.** Operators follow the `mfderiv` convention: total, junk-valued where
  nothing sensible can be said, with the real hypotheses on the theorems. Integration works the same way.
  Of course, totality makes vacuous statements easy to write by accident, which is why every bundled
  object ships element-level `_apply`/`coe_` lemmas and why the acceptance gates pin concrete nonzero
  values.
- **Universes and vocabulary.** Spaces live in `Type` wherever the singular comparison is involved
  (Mathlib's singular functors are polymorphic, but a single universe avoids `ULift` bookkeeping). Vector
  fields are unbundled — `V : (x : M) → TangentSpace I x`, with smoothness a `ContMDiff` statement about
  the section — and rough forms are likewise unbundled sections of the alternating bundle with a
  `ContMDiff` predicate; bundled types come last, and only at C^∞ (this is the design direction of the
  threads in the Acknowledgements). The d of a function *is* `mvfderiv`; never open-code
  `fderiv`-through-`extChartAt`.

## What Mathlib already has (consume)

Claims here are checked against the pin in this repository's `lake-manifest.json`. Still, re-grep before
citing anything in code, and treat every claim below that the pin lacks something as itself checkable.
The layers cite the further paths they consume.

- **Flat exterior calculus, with naturality:** `Analysis/Calculus/DifferentialForm/{Basic,VectorField}.lean`
  (`extDeriv`, `extDerivWithin`, d² = 0, the invariant Lie-bracket formula, and `extDeriv_pullback` /
  `extDerivWithin_pullback`, whose `UniqueDiffOn` and `x ∈ closure (interior s)` hypotheses are engineered
  to apply on `Set.range I`), over `alternatizeUncurryFin`
  (`Analysis/Normed/Module/Alternating/Uncurry/Fin.lean`) and `Analysis/Calculus/FDeriv/Symmetric.lean`.
  Note that `Basic.lean`'s docstring defers bundled and manifold forms to a design discussion; layer 0
  follows that discussion rather than ignoring it.
- **Alternating maps and their topological bundle:** `Topology/VectorBundle/ContinuousAlternatingMap.lean`,
  over `ContinuousAlternatingMap` and `compContinuousLinearMap` (the pointwise pullback) in
  `Topology/Algebra/Module/Alternating/` and `Analysis/Normed/Module/Alternating/`.
- **Smooth bundles and manifold calculus:** `Geometry/Manifold/VectorBundle/` (`ContMDiffVectorBundle`;
  `Hom.lean`, the file 0.2 mirrors; `Tangent`, `ContMDiffSection`, `Pullback`, `LocalFrame`, `Tensoriality`
  = [Lee, Lemma 12.24]); `…/MFDeriv/` (`mfderiv`, `UniqueMDiffOn`, `mvfderiv` = d on 0-forms);
  `…/VectorField/` (`VectorField.mlieBracket`, `VectorField.mpullback`, bracket naturality); and the
  local-structure files `…/{Immersion,LocalDiffeomorph,Diffeomorph,SmoothEmbedding}.lean` (`IsImmersionAt`
  and `IsLocalDiffeomorphAt`, whose converse — the manifold inverse function theorem — is a TODO of that
  file, discharged in Tau Ceti's `LocalDiffeomorph.lean` — on current Tau Ceti main, ahead of this
  repository's Tau Ceti pin — and consumed with a small extension in
  layer 10).
- **Integral curves:** `Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`
  (`IsMIntegralCurve`/`On`/`At`, local existence at interior points, uniqueness on `[T2Space M]`,
  uniform-time globalization = [Lee, Lemma 9.15]) over `Analysis/ODE/`. `Dynamics/Flow.lean` has `Flow`,
  not yet connected to vector fields; layer 3 makes the connection.
- **Boundary, instances, partitions of unity:** `Geometry/Manifold/IsManifold/InteriorBoundary.lean`
  (`I.interior`, `I.boundary`, and the TODOs "the boundary is a submanifold" / "has measure zero" — the
  first discharged by Tau Ceti's `Boundary/Charts.lean` and consumed in 5.1, the second a layer-5
  target); `…/Instances/{Real,Sphere}.lean` (`EuclideanHalfSpace`, `boundary_Icc`,
  `boundary_product`; `contMDiff_neg_sphere`, and `range_mfderiv_coe_sphere`, which carries its own
  warning that the tangent-space identification is non-canonical);
  `…/{PartitionOfUnity,BumpFunction,SmoothApprox,WhitneyEmbedding}.lean`
  (`Continuous.exists_contMDiff_approx` has normed-space targets).
- **Flat integration and fiberwise orientation:** `MeasureTheory/Integral/DivergenceTheorem.lean` over
  `Analysis/BoxIntegral/`; `MeasureTheory/Function/Jacobian.lean` (change of variables,
  `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`); `…/CurveIntegral/`; FTC in `…/IntervalIntegral/`;
  and `LinearAlgebra/{Orientation,Ray}.lean` with `Analysis/InnerProductSpace/Orientation.lean`
  (`Orientation.volumeForm`). None of this is manifold-level: manifold orientations are layer 2, and
  integration of forms is layer 5.
- **Covering spaces:** `Topology/Covering/{Basic,Quotient}.lean` (`IsCoveringMap`,
  `FiberBundle.isCoveringMap`, `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`),
  `Topology/Homotopy/Lifting.lean`, `…/Covering/AddCircle.lean`, and
  `Geometry/Manifold/Instances/Quotient.lean` (`MulAction.instChartedSpaceQuotient` — charts on the
  quotient *below* an action). The last is the pin's only bridge between covering spaces and manifolds;
  2.3 builds the bridge in the other direction.
- **Homological algebra, complete:** `Algebra/Homology/` (`CochainComplex (ModuleCat ℝ) ℕ`, `ShortComplex`
  homology, `ShortComplex.ShortExact.homology_exact₁/₂/₃`),
  `CategoryTheory/Abelian/DiagramLemmas/Four.lean`, and sheaf-level Mayer–Vietoris
  (`CategoryTheory/Sites/MayerVietorisSquare.lean`, `Topology/Sheaves/MayerVietoris.lean`). Happily, all
  the homological algebra layers 6–9 need already exists: none of it is rebuilt here, and the only
  Mayer–Vietoris input this roadmap proves is the *form*-level short exact sequence.
- **Singular homology (not cohomology):** `AlgebraicTopology/SingularHomology/`
  (`singularChainComplexFunctor`, `singularHomologyFunctor`, H₀, homotopy invariance) over `TopCat.toSSet`
  and `alternatingCofaceMapComplex` (the dualization device of layer 8). What the pin does *not* have:
  singular cohomology, relative homology, excision, chain-level subdivision, Mayer–Vietoris for the
  singular theories, or the cup product.
- **Riemannian substrate:** `Topology/VectorBundle/Riemannian.lean` and
  `Geometry/Manifold/VectorBundle/Riemannian.lean` (`RiemannianBundle`, `ContMDiffRiemannianMetric`);
  `…/Riemannian/{Basic,PathELength}.lean`; `…/VectorBundle/CovariantDerivative/{Basic,Torsion,Metric}.lean`
  (`CovariantDerivative.torsion`, `torsion_eq_zero_iff`, `derivMetricTensor`, `IsMetricCompatible` — the
  predicates 12.3 consumes rather than rebuilds);
  `Analysis/InnerProductSpace/{Laplacian,Dual}.lean`; `Analysis/Distribution/DerivNotation.lean` (the `Δ`
  notation class); `Analysis/Calculus/Gradient/`.

## What Tau Ceti already has (consume)

- **Covering-space theory, complete** (universal-covers roadmap):
  `TauCeti/AlgebraicTopology/UniversalCover/` — universal cover and lifting property, π₁-action, deck
  groups, monodromy, regular covers, the cover attached to `H ≤ π₁`, both Galois correspondences;
  `TauCeti.RealProjectiveSpace`, `π₁(S¹) ≅ ℤ`, `πₙ(S¹) = 0` for `n ≥ 2`, πₙ functoriality and the covering
  isomorphism. Layer 2.4 consumes the two-sheeted classification and the deck vocabulary; none of it is
  rebuilt.
- **Smooth 2-forms:** `TauCeti/Geometry/Manifold/TwoForm.lean` (Heegaard Floer's symplectic lane;
  closedness deliberately undefined there). Layer 0.4 supersedes it with a bridge rather than a fork, and
  closedness is exported through layer 1, so that lane gets to define "closed" exactly once.
- **Flows on Lie groups and ODE parameter dependence:** `TauCeti/Geometry/Manifold/IntegralCurve.lean`,
  `TauCeti/Geometry/Lie/`, `TauCeti/Analysis/ODE/SmoothParameter.lean`. Layer 3 subsumes these, with named
  reconciliation lemmas; coordinate with the Lie-groups roadmap, which owns that tree.
- **Sard, flat:** `TauCeti/Analysis/Calculus/Sard/` (equidimensional and low-dimension cases); 10.2
  transfers the equidimensional case through charts, and Morse–Sard stays there. **Embeddings and slice
  charts:** `TauCeti/Geometry/Manifold/{SmoothEmbedding,LocallyFlat}/` (`IsSliceChart`, the shape layer 4's
  flat charts follow), `TauCeti/Geometry/Diffeomorphism/`, and `…/Manifold/Boundary/{Model,Charts}.lean` —
  the latter proving `TauCeti.isManifold_boundary` (the boundary of a `C^k` manifold over `𝓡∂ (n+1)` is a
  `C^k` manifold over `EuclideanSpace ℝ (Fin n)`) with the inclusion a closed `C^k` smooth embedding
  (`isSmoothEmbedding_subtypeVal_boundary`), corners deliberately out of scope there; 5.1 consumes this
  rather than rebuilding it.

## What is missing (build here)

Everything the layers below specify — a grep of the pin finds none of it. The layer order is also the
order of dependence. Two items are substantially harder than everything around them and gate what follows,
so they are worth starting early: the flat smooth-dependence theorem (3.1) and the singular subdivision layer
(8.2). (The smooth structure on the boundary, once the third hard gate here, is already in Tau Ceti;
5.1 consumes it and keeps only the interface built on top.)

## Prior work and coordination

Each source below is cited for design and migration, never as the definition of a target. Coordinate with
the named authors before porting anything, and confirm licences before copying.

- **Mathlib's own direction.** The flat exterior calculus and its bundle substrate are Yury Kudryashov's
  and Sam Lindauer's design (with Heather Macbeth's alternating-bundle work); bundled and manifold forms
  are theirs to steer, and layer 0 follows the threads in the Acknowledgements, coordinating there before
  diverging. Kudryashov's `github.com/urkud/DeRhamCohomology` develops wedge products and manifold forms
  in this style — its `wedge_product` already takes the continuous bilinear pairing as an argument,
  exactly the `wedgeWith` shape of 0.1 — and is the closest existing development of layers 0–1 and 6,
  migration material for the paired wedge rather than a design to diverge from; coordinate there first. For
  orientability, mathlib4#35376 (Michael Lee's, with Sébastien Gouëzel's quotient design) fixes the
  accepted shape; for flows, mathlib4#26394 and #26395. In both cases
  the repository policy applies: don't wait. Build the material here now, with the names and shapes those
  PRs use, and simply delete ours when the pin catches up. (For Levi-Civita the pin *has* caught up on the
  predicates — mathlib4#36299's metric connections landed — while the connection itself, mathlib4#36845,
  merged upstream only after the pin, with its `C^∞` regularity still to come; the fundamental theorem is
  the Hopf–Rinow roadmap's deliverable, and 12.3 consumes both.)
- **The `differential-geometry` library** (`github.com/qinz1yang/differential-geometry`; Ziyang Qin, Jack
  McCarthy, Yuan Liao, with code adapted from Kudryashov and Macbeth): smooth-section module structure,
  the bundle-homomorphism characterization ([Lee, Lemma 10.29]), tensor-bundle equivalences, a wedge with
  associativity and graded commutativity, and flat forms with d² = 0 — blueprint-grade for layers 0–1.
  Coordinate with all three authors and confirm the licence before porting.
- **Brendan Seamas Murphy's Lean 3 Brouwer fixed-point theorem** (singular homology, Eilenberg–Steenrod):
  prior art for layer 8's singular half and layer 10's corollaries; port it in small pieces, following its
  author's advice on how to split it. The Meta ATLAS corpus (arXiv:2605.29955) has machine-generated
  Mayer–Vietoris and Hodge material over axiomatized substrates; use it as a reference only, never code.
  **The sphere-eversion project** (Massot–van Doorn–Nash) is the template for manifold infrastructure of
  this kind and the source of several partition-of-unity idioms this roadmap consumes.

---

## The build, in layers

Each layer names what it consumes, what it adds and its acceptance gates; the DAG is in *Ordering*.

### Layer 0: alternating bundles, differential forms, and the wedge

*[Lee, Ch. 12 and 14]. Consumes the flat alternating/bundle files and the Hom template.*

- **0.1 The wedge on `ContinuousAlternatingMap`.** Define the wedge in the determinant convention,
  layered by algebraic strength. The generic object is the paired wedge
  `wedgeWith (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)`, combining values through an explicit continuous bilinear map —
  the shape of `wedge_product` in Kudryashov's `DeRhamCohomology` — and at that generality the theorems
  are bilinearity, the norm bound with its explicit constant, compatibility with
  `compContinuousLinearMap`, the characterization through alternatization, and naturality in `μ`.
  Associativity and graded commutativity are ⚠ *not* theorems at that generality — degree zero already
  reduces them to associativity and commutativity of `μ`, refuted by the Lie bracket and matrix
  multiplication respectively — so each is a theorem under an explicit hypothesis: associativity given the
  compatibility relation between the two composite pairings, graded commutativity given a commutative
  pairing. Then the specializations, each with its own package: the ℝ-valued wedge through
  multiplication, a graded commutative algebra with the two normalization identities from the
  conventions section; the wedge over a commutative normed algebra likewise; the wedge over a
  noncommutative algebra keeps associativity only; and the bracket wedge for Lie-algebra-valued forms
  (blocking nothing below) trades both for graded skew-symmetry and graded Jacobi.
  This is also the place for the **interior product** `ι_v`,
  with `ι_v ∘ ι_v = 0` and the degree-(−1) antiderivation rule [Lee, Lemma 14.13]. Note that there is no
  linear equivalence between alternating and multilinear map spaces to transfer any of this along, so
  the proofs have to be done directly.
- **0.2 The smooth alternating bundle.** The `ContMDiffVectorBundle` instance for
  `fun x ↦ E₁ x [⋀^ι]→L[ℝ] E₂ x`, mirroring `VectorBundle/Hom.lean`. Do the general two-bundle case
  first and then specialize to `E₁ = TangentSpace I` and `E₂ = Bundle.Trivial M F`, so that the
  cotangent, 2-form and top-degree bundles all come out of one construction.
- **0.3 Rough and smooth forms, unbundled first.**
  `RoughForm I M F k := (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] F`, with a `ContMDiff` section
  predicate. The **pullback** is
  `mpullback f ω x := (ω (f x)).compContinuousLinearMap (mfderiv I I' f x)`, total and junk-valued in
  the style of `VectorField.mpullback`, and it needs the expected API: `mpullback_id`, `mpullback_comp`,
  linearity, preservation of smoothness, and the wedge-homomorphism property. Identify 0-forms with
  functions, and d of a 0-form with `mvfderiv`. Add support API (`tsupport`, restriction to `Opens M`)
  and the pointwise wedge with its graded-algebra identities. One discipline to hold throughout: state
  every theorem in a `Within` form first, with `univ` specializations, mirroring the flat file — the
  manifold-with-boundary cases later on need the `Within` versions.
- **0.4 Bundled C^∞ forms.** `Ω^k⟮I, M; F⟯` as `ContMDiffSection`, with `AddCommGroup`, `Module ℝ`,
  `CoeFun`, `ext` and `_apply`; the equivalence with `TauCeti.SmoothTwoForm` at `k = 2`; and the graded
  algebra `Ω^•`. *Acceptance:* over `𝓘(ℝ, E)`, bundled forms agree with their flat counterparts, and
  `mpullback` with the flat pullback — as lemmas, not by defeq.

### Layer 1: the exterior derivative and its naturality

*[Lee, Ch. 14]. Consumes layer 0, the flat `extDeriv` suite, `extChartAt` calculus.*

- **1.1 Definition and well-definedness.** `mextDerivWithin I ω s x` and `mextDeriv`: conjugate through
  `extChartAt I x`, apply `extDerivWithin` on `(extChartAt I x).symm ⁻¹' s ∩ Set.range I`, and pull back
  through `mfderivWithin`. Chart-independence comes down to `extDerivWithin_pullback` applied to
  transition maps over `Set.range I` — its `UniqueDiffOn` and closure hypotheses hold there for any model
  with corners. Package the `writtenInExtChartAt` rewriting as a reusable lemma — the whole layer runs
  on it. After that come locality, ℝ-linearity, `mextDeriv = extDeriv` over `𝓘(ℝ, E)`,
  and `mextDeriv` of a 0-form = `mvfderiv`.
- **1.2 Naturality.** For `ContMDiffAt I I' n f x` with `2 ≤ n`,
  `mpullback f (mextDeriv ω) = mextDeriv (mpullback f ω)`, in `At`, `On` and global forms, with the
  `Diffeomorph` corollary.
- **1.3 d² = 0 and preservation of smoothness.** `mextDeriv_mextDeriv` for C² forms. There is also a new
  flat lemma to prove: `extDerivWithin` of a `ContDiffOn n` form is `ContDiffOn (n−1)` on the same set,
  stated so that it applies on `Set.range I`, together with its manifold transfer — this is what lets d
  map `Ω^k` to `Ω^(k+1)` at C^∞. The lemma is missing from the pin and the de Rham complex depends on
  it, so it is a target here, not an assumption.
- **1.4 Cartan calculus.** Prove the Leibniz rule with unit constants, the invariant formulas for
  `mextDeriv` on 1-forms and in all degrees through `VectorField.mlieBracket` [Lee, Prop. 14.29, 14.32],
  and the interior product with vector fields. Then define the **Lie derivative of forms** without
  flows, by the bracket formula [Lee, Cor. 12.33] — the flow characterization is proved in 3.4 — and
  prove **Cartan's magic formula** [Lee, Thm. 14.35]. *Acceptance:* on `ℝ²`, `d(x dy) = dx ∧ dy` and `d(dx) = 0`.

### Layer 2: orientations and the orientation double cover

*[Lee, Ch. 15]. Consumes `LinearAlgebra/Orientation`, the groupoid API, Tau Ceti covering theory.
Independent of layers 0–1 except where stated.*

- **2.1 Orientability and orientations,** in the chart-sign design of mathlib4#35376, named and shaped
  identically so that this layer can simply be deleted once the pin includes it. An `OrientationLift I M ι`
  is a model orientation `Orientation ℝ E ι` together with chart signs `M → M → ℤˣ`, supported and
  continuous on `(chartAt H x).source` and compatible under tangent-space transport along coordinate
  changes; `Manifold.Orientation I M ι` is the quotient by the diagonal `ℤˣ`-flip. On top of that come
  the Prop-class `Orientable`, the data-class `OrientedManifold`, `orientationAt`, `InvolutiveNeg`,
  `eq_or_eq_neg` on preconnected `M`, the `LocallyConstant`-twisting equivalence, and the bridges to the
  determinant criteria.
- **2.2 Orientation-preserving maps and volume forms.** Define orientation-preserving and -reversing
  local diffeomorphisms via `orientationAt` and `Orientation.map`, then the pullback orientation [Lee,
  Prop. 15.15] and product orientations. Using layer 0: a nonvanishing section of the top alternating bundle determines an
  orientation, and conversely, on a finite-dimensional `M` (boundary allowed), an orientation determines
  a positively-oriented nonvanishing top form ([Lee, Prop. 15.5]; the partition-of-unity direction
  carries `[T2Space M] [SigmaCompactSpace M]` visibly). The familiar characterization by consistently
  oriented atlases is a theorem for boundaryless `M` with `1 ≤ dim` [Lee, Prop. 15.6].
- **2.3 Smooth structures on covers.** A covering space of a C^n manifold carries a canonical
  `ChartedSpace H` and `IsManifold I n` structure making the projection a local diffeomorphism, and lifts
  of C^m maps are C^m. This is independent infrastructure — the simply connected covers of the Lie-groups
  roadmap need it too — and it is the covering–manifold bridge in the direction the pin lacks.
- **2.4 The orientation double cover** [Lee, Ch. 15, "Orientations and Covering Maps"].
  `OrientationCover I M`, with its two-sheeted projection. The topology comes from chart-induced
  trivializations, or from a `ℤˣ`-quotient through
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` — ⚠ not, however, from the sigma
  topology, which fails (see *Statements that must not enter*). The smooth structure comes from 2.3, and
  the total space carries a canonical orientation and the deck involution. For connected `M` the
  characterizations line up as: orientable ↔ the cover is disconnected ↔ the cover is trivial
  (`≃ M × Bool`) ↔ the cover admits a section; and a nonorientable connected `M` has a connected oriented
  double cover, unique up to orientation-preserving isomorphism over `M` [Lee, Thm. 15.41, 15.42]. Then
  prove the deck-group and index-2-subgroup characterization, and — still for connected `M` — that if
  `π₁(M, x)` has no index-2 subgroup then `M` is orientable, so in particular simply connected manifolds
  are orientable [Lee, Thm. 15.43]. All the covering-space inputs come from Tau Ceti; nothing is rebuilt.
  *Acceptance:* `Set.Icc x y` and the spheres are orientable, with orientation covers `≃ M × Bool`; the
  open Möbius band (the total space of the nontrivial line bundle over `Circle`, shaped like
  mathlib4#40652 — the compact band is the associated interval bundle) is connected
  and nonorientable, with connected orientation cover.

### Layer 3: flows

*[Lee, Ch. 9 and 12]. Consumes the `IsMIntegralCurve` suite, `Analysis/ODE/`, `Dynamics/Flow`, Tau Ceti's
integral-curve regularity. Independent of layers 0–2 except the differential-form half of 3.4, which
consumes 0.3 and 1.4.*

- **3.1 Smooth dependence on initial conditions, flat.** The local flow of a `ContDiff ℝ n` vector field
  on a Banach space is `C^n` jointly in `(t, x₀)`. Either extend the Picard/`FunSpace` machinery, or take
  the implicit-function route of `TauCeti/Analysis/ODE/SmoothParameter.lean` with the initial condition
  as the parameter. State it flat, in the language of `Analysis/ODE`. This is the one genuinely hard
  piece of new analysis in the layer, so make it a milestone of its own rather than burying it inside the
  manifold theorem.
- **3.2 The maximal flow.** For a C^n (`1 ≤ n`) field `v` on a boundaryless `[T2Space M]`: the domain
  `flowDomain v : Set (ℝ × M)` (open, containing `{0} × M`, with interval slices) and the flow
  `flowOf v : ℝ → M → M` (total, junk-valued, chosen from uniqueness). The **fundamental theorem of
  flows** [Lee, Thm. 9.12] then says: each `flowOf v · x` is the unique maximal integral curve from `x`;
  the domain is open and the flow jointly C^n on it (this is where 3.1 comes in); and the group law
  `flowOf v t (flowOf v s x) = flowOf v (s+t) x` holds whenever `(s, x)` and `(t, flowOf v s x)` lie in
  the domain — which, conveniently, forces `(s+t, x)` into it. It follows that each `flowOf v t` is a
  diffeomorphism between open sets, with inverse `flowOf v (−t)`. Finally the **escape lemma** [Lee,
  Lemma 9.19, strengthened to a one-sided form]: a maximal integral curve whose domain is bounded above
  eventually leaves every compact set, and symmetrically below.
- **3.3 Completeness and homogeneity.** Complete fields; the uniform-time criterion; compactly supported
  fields are complete; every field on a compact manifold is complete [Lee, Thm. 9.16, Cor. 9.17]. A
  complete field's flow assembles into a `Flow ℝ M`, together with the `ContMDiff` statement that `Flow`
  itself cannot record. **Homogeneity** — and here, unlike the rest of the layer, finite dimension is
  genuinely needed: ⚠ on an infinite-dimensional model every continuous compactly supported vector field
  is *zero* (a compact support with nonempty interior would make the model locally compact), so the
  statement below is false Banach-generally. For connected boundaryless `M` with
  `[FiniteDimensional ℝ E] [T2Space M]`: given any two points, there is a
  compactly supported field whose time-1 flow carries one to the other — a diffeomorphism smoothly
  isotopic to the identity. (10.4 uses this to move regular values around, in exactly this
  finite-dimensional setting.) And a reconciliation: the
  flow of an invariant field on a Lie group, as in `TauCeti/Geometry/Lie/`, *is* `flowOf` of that field.
- **3.4 Naturality, straightening, commuting flows.** `F`-related fields have `F`-conjugate flows [Lee,
  Prop. 9.6, 9.13]. The **straightening theorem** [Lee, Thm. 9.22] is layer 4's base case. The Lie
  derivative via the flow equals `VectorField.mlieBracket` [Lee, Thm. 9.38]; the derivative-of-pullback
  formula [Lee, Prop. 9.41]; `[v, w] = 0` iff the flows locally commute [Lee, Thm. 9.44]; the canonical
  form for `k` commuting independent fields [Lee, Thm. 9.46]. Lie derivatives of forms via the flow,
  agreeing with the flow-free definition of 1.4, and flow-invariance iff vanishing Lie derivative [Lee,
  Thm. 12.37]. The last two are stated for the two carriers this roadmap actually builds — vector fields
  and forms; the pin has no general tensor fields, and none are targeted here. *Acceptance:* the flow of
  a constant field on `ℝⁿ` is translation, and the flow of the rotation field on `ℝ²` is the rotation
  action.
- **3.5 Time-dependent flows** [Lee, Thm. 9.48]: time-dependent fields and their flows on open
  time-slabs, by the autonomous trick over `ℝ × M`.

### Layer 4: the Frobenius theorem

*[Lee, Ch. 19]. Consumes layer 3 (straightening, commuting flows), `VectorField.mlieBracket`,
`IsImmersionAt`, `TauCeti.IsSliceChart`.*

- **4.1 Distributions.** Rank-`k` C^n distributions as `D : (x : M) → Submodule ℝ (TangentSpace I x)`
  with a Prop-valued smoothness predicate: locally spanned by `k` pointwise-independent C^n fields.
  Prove the frame criterion [Lee, Lemma 10.32] rather than first building a general subbundle theory.
  Then sections, `mem`-API, and the annihilator ideal of forms vanishing on `D` (which uses layer 0).
- **4.2 Involutivity and integral manifolds.** `IsInvolutive I D`, with its local-frame reformulation.
  Integral manifolds are *immersed* manifolds: an `IsImmersion`-style inclusion whose `mfderiv` has image
  *equal to* `D` — not merely contained in it — and never assumed embedded. Then the easy direction,
  integrable ⇒ involutive [Lee, Prop. 19.3], with the noninvolutive pair `∂x + y ∂z, ∂y` on `ℝ³` kept as
  a named nonexample; and the 1-form criterion: `D` is involutive iff `dη` annihilates `D` whenever the
  1-form `η` does [Lee, Thm. 19.7].
- **4.3 The local Frobenius theorem.** Every involutive C^∞ rank-`k` distribution is completely
  integrable [Lee, Thm. 19.12]: through every point there is a **flat chart** carrying `D` to a constant
  subspace, and hence a local integral manifold. The proof is by induction on the rank through 3.4's
  canonical form, with straightening as the base case. Local uniqueness: a connected integral manifold
  lies in a single slice of a flat chart [Lee, Prop. 19.16]; integral manifolds are weakly embedded [Lee,
  Thm. 19.17]; and the flat chart adapted to a transverse submanifold [Lee, Cor. 19.13].
- **4.4 Foliations and the global theorem.** Foliations by immersed leaves with flat charts, and the
  **global Frobenius theorem** [Lee, Thm. 19.21]: the maximal connected integral manifolds partition `M`
  into leaves, each an immersed submanifold carrying its own topology. To be clear, a leaf is a type with
  a finer charted-space structure, not a `Set` — the first consumer, the subalgebra ↔ subgroup
  correspondence of the Lie-groups roadmap, needs honest immersed leaves. *Acceptance:* the leaves of a
  constant distribution on `ℝⁿ` are the parallel affine slices; `ker (dz − y dx)` on `ℝ³` is not
  integrable.

### Layer 5: integration on manifolds and Stokes' theorem

*[Lee, Ch. 16]. Consumes layers 0–2, the flat divergence theorem, Jacobian change of variables, partitions
of unity, `InteriorBoundary`.*

- **5.1 The boundary interface.** The smooth structure on `I.boundary M` itself — the TODO of
  `InteriorBoundary.lean` — is already done at the pin for the model this layer works over:
  `TauCeti/Geometry/Manifold/Boundary/Charts.lean` proves `TauCeti.isManifold_boundary` for the
  half-space model `𝓡∂ (n+1)`, with the inclusion a closed `C^k` smooth embedding; consume it, do not
  rebuild it. The restriction to the half-space model is essential, not an accident of that file: ⚠ for a
  genuine model with corners the statement is *false* — the boundary of the quadrant `[0,∞)²` admits no
  smooth structure making its inclusion an immersion at the corner, and `I.boundary M` forgets the face
  multiplicity a corners Stokes formula needs (the corners route goes through an abstract, face-indexed
  boundary, and belongs to 5.5). What this item builds on top of the existing structure: outward- and
  inward-pointing vectors, the existence of outward-pointing fields along `∂M`, the induced **boundary
  orientation** (outward-first) [Lee, Prop. 15.24], the restriction `ι* : Ω^k(M) → Ω^k(∂M)`, the
  half-space sign recomputed for Mathlib's model, and "`∂M` has measure zero" in the form 5.2 needs.
- **5.2 Integration of top-degree forms.** Measurable structure on `M` comes from the standing
  `[T2Space M] [SigmaCompactSpace M]` and finite-dimension hypotheses (which stay in force throughout
  layers 5–9) together with charts. For oriented `M` and a compactly supported top-degree form `ω`,
  define `∫_M ω` chart by chart — fixing once a basis of the model `E`, *positively oriented* for the
  `OrientationLift`'s model orientation, and integrating the coefficient in that basis against its
  `Basis.addHaar` measure. The first lemma is independence of that choice: the coefficient rescales by
  the transition determinant and the measure by the inverse of its *absolute value*, so the chartwise
  integral is unchanged under equally-oriented basis changes and flips sign under orientation reversal —
  a sign the fixed positive orientation, not luck, keeps out of the definition. Then weight by that chart's
  sign in the `OrientationLift` data of 2.1, and glue with a `SmoothPartitionOfUnity`. Well-definedness
  is Jacobian change of variables at interior points — where "orientation-preserving ⇒ positive
  determinant" from 2.2 lets `|det|` shed its absolute value — and the boundary is handled by the
  measure-zero lemma of 5.1. Note that it really must be chart signs rather than positively-oriented
  atlases; manifolds with boundary leave no choice. After that come independence of the partition and atlas,
  linearity, `∫_{−M} ω = −∫_M ω`, positivity — for compactly supported forms that are nonnegative and
  somewhere positive against the orientation; ⚠ not for orientation forms as such, which on a noncompact
  `M` are never compactly supported, so the junk-value convention would make the unqualified claim false
  — diffeomorphism invariance in both signed forms, `∫` preserved under orientation-preserving
  diffeomorphisms and negated under orientation-reversing ones
  [Lee, Prop. 16.6], and the extension-by-zero/bump API (`SmoothPartitionOfUnity.smul` with
  `tsupport` control), factored out as a reusable family since 5.3, 7 and 9 all use it.
- **5.3 Stokes' theorem.** For an oriented C^∞ manifold `M` with boundary and a compactly supported C¹
  (n−1)-form `ω`: `∫_M dω = ∫_{∂M} ι*ω`. The proof is by partition of unity, reduction to a single chart,
  and the half-space computation, which comes from the flat divergence theorem on exhausting boxes.
  Corollaries: `∫_M dω = 0` on boundaryless `M` [Lee, Cor. 16.13]; `∫_{∂M} ι*ω = 0` for closed `ω`; the
  1-dimensional case reconciled with `intervalIntegral`; Green's theorem on planar domains with smooth
  boundary; and agreement of `∫_γ ω` with Mathlib's `curveIntegral` over paths.
- **5.4 The homotopy operator, and Stokes for `M × Icc`.** Two targets, deliberately decoupled. First
  the **cochain-homotopy identity** `ι₁^*ω − ι₀^*ω = d(hω) + h(dω)` for forms `ω` on `M × Icc`, with
  the explicit operator
  `h ω = ∫_0^1 ι_t^* (ι_{∂_t} ω) dt`, proved *directly* — differentiation under the parameter integral
  and the FTC, in the `Within` calculus — and not as an application of Stokes; applied to `H^*η` it
  gives `H₁^*η − H₀^*η` exact for closed `η`, so it holds for `M`
  *with* boundary and 6.3's homotopy invariance carries no hidden corners debt
  [Lee, Ch. 17, "Homotopy Invariance"]. Second, Stokes' theorem on the product `M × Set.Icc (0:ℝ) 1` for
  boundaryless `M` (via `boundary_product`), which the degree arguments of 10.5 use. General
  corners are deliberately avoided here — the direct proof of the homotopy identity is exactly what
  keeps corners Stokes out of layers 6–9.
- **5.5 Two scoped generalizations, last.** Stokes on manifolds with corners, and densities with
  integration of functions on nonorientable manifolds [Lee, Ch. 16, "Densities"]. Both live here and
  nowhere else; corners Stokes blocks nothing in 6–12, and densities block nothing outside 12.4's
  nonorientable measure. *Acceptance:* `∫_{Icc 0 1} df = f 1 − f 0`; the
  **angular form** `circleAngularForm` — `x dy − y dx` pulled back along `S¹ ↪ ℝ²` as in 0.3, written
  `dθ` below — is a named target, with `∫_{S¹} dθ = 2π`; and Green's theorem on the unit square, from the flat
  box divergence theorem (the square has corners, which is exactly why this gate belongs here and to the
  flat layer rather than to 5.3).

### Layer 6: the de Rham complex and cohomology

*[Lee, Ch. 17]. Consumes layers 0–1 and `Algebra/Homology/`.*

- **6.1 The complex.** `mextDerivₗ : Ω^k⟮I, M⟯ →ₗ[ℝ] Ω^(k+1)⟮I, M⟯` and
  `deRhamComplex I M : CochainComplex (ModuleCat ℝ) ℕ` via `CochainComplex.of`, with `d_comp_d` from 1.3.
  Both presentations are targets. The concrete one is `deRhamCohomology I M k` as a
  `Submodule.Quotient`, with `IsClosed`/`IsExact` predicates and element-level API; this is what analytic
  arguments compute with, and what the Heegaard Floer notion of "closed 2-form" consumes. The
  categorical one is `(deRhamComplex I M).homology k`, with the comparison isomorphism between the two.
  Functoriality means
  `mpullback` as a cochain map (by 1.2), the induced map on cohomology, `pullback_id` and
  `pullback_comp` — unbundled lemmas, with no manifold category.
- **6.2 Degree zero and the Poincaré lemma.** Identify `H⁰` with the locally constant functions, and
  compute `H^k(pt)`. The
  **Poincaré lemma in all degrees**, and *relatively*: the principal statement is `Within`, on a
  star-convex `s` with `UniqueDiffOn ℝ s` and `s ⊆ closure (interior s)` — hypotheses in the style of
  `extDerivWithin_pullback` — ⚠ because the sets this lemma is actually applied to are boundary-chart
  images, relatively open in `Set.range I` but *not* open in the ambient space (a ball intersected with
  a half-space is the typical case); an ambient-open statement does not reach the boundary points. A
  closed C¹ k-form (`k ≥ 1`) with values in a complete space is exact there, by the explicit radial
  homotopy operator (a Bochner integral, hence the completeness hypothesis); the ambient-open star-shaped
  case is the specialization, stated next to Mathlib's 1-form convex case. The manifold corollary is that
  closed forms are locally exact — manifolds with boundary included, which is the point of the relative
  form [Lee, Thm. 17.14, Cor. 17.15].
- **6.3 Homotopy invariance.** Smoothly homotopic maps induce equal maps on `H^•` (via 5.4's
  cochain-homotopy identity, hence with no boundaryless restriction on `M`);
  homotopy-equivalent manifolds have isomorphic cohomology; `H^•(ℝⁿ)`. The `H¹`–π₁ bridge, for connected
  `M`: the injection `H¹_dR(M) → Hom(π₁(M, x), ℝ)` given by integrating over loops [Lee, Thm. 17.17], and
  hence `H¹_dR = 0` for simply connected `M`. Two prerequisites live here as named targets, so that
  nothing in this layer has to wait for layer 8: the integral of a 1-form along a piecewise-C¹ path in
  `M` (pullback to the interval plus `intervalIntegral`, reconciled with `curveIntegral`), with homotopy
  invariance for closed forms; and the smooth-representative lemma, that every continuous loop and
  homotopy of loops deforms chart-by-chart to a piecewise-smooth one.
- **6.4 Compact supports.** The subcomplex `Ω_c^•` via `HasCompactSupport`, and `H^•_c`. Its two
  functorialities are separately named constructions with *opposite variances*, never one generic map:
  extension by zero `j_! : Ω_c^•(U) → Ω_c^•(M)` along an open inclusion, covariant — the arrow of 7.3's
  sequence — and pullback `f^* : Ω_c^•(N) → Ω_c^•(M)` along a *proper* smooth map, contravariant; each
  with its own identity, composition and naturality lemmas, ⚠ and nothing at all for a general smooth
  map (see *Statements that must not enter*). `H^n_c(ℝⁿ)` via the compactly supported Poincaré lemma
  [Lee, Lemma 17.27], together with `H^j_c(ℝⁿ) = 0` for `j < n` [Lee, Thm. 17.28] — 9.3's base case
  needs both, since compact supports are not homotopy invariant.
  *Acceptance:* `H^k_dR(ℝⁿ)`; `[dθ] ≠ 0` in `H¹_dR(S¹)`.

### Layer 7: Mayer–Vietoris for de Rham cohomology

*[Lee, Ch. 17]. Consumes layer 6, `HomologySequence`, partitions of unity.*

- **7.1 The short exact sequence.** For `U V : Opens M` with `U ⊔ V = ⊤`, the sequence
  `0 → Ω^•(U ⊔ V) → Ω^•(U) ⊕ Ω^•(V) → Ω^•(U ⊓ V) → 0` as a
  `ShortComplex (CochainComplex (ModuleCat ℝ) ℕ)` with its `ShortExact` witness, under the standing
  `[T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` hypotheses — surjectivity is a
  partition-of-unity statement, and it fails without them. Restrictions come from 0.3; the sign
  convention is `(res, −res)`, matching Mathlib's sheaf-level Mayer–Vietoris, so the two sequences are
  comparable arrow-for-arrow; surjectivity is by the extension trick of 5.2.
- **7.2 The long exact sequence** follows immediately from
  `ShortComplex.ShortExact.homology_exact₁/₂/₃`, with no new homological algebra. Name the connecting
  map, prove its explicit partition-of-unity description [Lee, Cor. 17.42], and prove naturality in
  `(M, U, V)`.
- **7.3 The compactly supported variant**
  `0 → Ω_c^•(U ⊓ V) → Ω_c^•(U) ⊕ Ω_c^•(V) → Ω_c^•(U ⊔ V) → 0` (arrows reversed, maps by extension by
  zero) and its long exact sequence, owned here because layer 9 consumes it. *Acceptance:* `H^k_dR(Sⁿ)`,
  by induction from the two-cap cover [Lee, Thm. 17.21], with the top class spanned by any orientation
  form (from 2.2), nonzero because it integrates positively by 5.2 while exact forms integrate to zero
  by 5.3. This computation is what layer 10 runs on.

### Layer 8: singular cohomology and the de Rham theorem

*[Lee, Ch. 18]. Consumes Mathlib singular homology and layers 5–7. The route is [Lee]'s: integration over
smooth simplices and a Mayer–Vietoris induction (de Rham–Weil). Do not take the sheaf route through
`Sheaf.H`: the pin has neither fine-sheaf acyclicity nor the Čech/derived comparison, so it is the longer
detour.*

- **8.1 Singular cohomology.** The singular cochain complex with coefficients in a module over a
  commutative ring `R`, specialized to `ℝ` where the comparison needs it: either dualize
  `singularChainComplexFunctor` degreewise, or apply `alternatingCofaceMapComplex` to the cosimplicial
  module of cochains. Contravariant functoriality; homotopy invariance, transferred from the chain level;
  `H⁰`; and the universal-coefficient identification over ℝ, `H^p(X; ℝ) ≅ Hom(H_p(X; ℝ), ℝ)`, which
  recovers [Lee]'s dual-of-homology definition as a theorem.
- **8.2 Subdivision and Mayer–Vietoris, singular.** Barycentric subdivision as a chain map
  chain-homotopic to the identity; the small-simplices theorem; Mayer–Vietoris for singular homology and
  cohomology of an open pair [Lee, Thm. 18.4, 18.6]; `H_•(Sⁿ; R)`, with the fundamental class of `S¹`
  given by the standard smooth loop simplex (8.5's acceptance gate evaluates against it). Fair warning:
  this is the largest single piece of work in the second half of the roadmap. The pin has no chain-level
  subdivision at all — its only subdivision is the simplicial-set functor `SSet.sd`, which comes with no
  comparison to the identity. (Excision, on the other hand, is not a target; Mayer–Vietoris is all the
  comparison needs.)
- **8.3 Smooth chains.** Smooth singular simplices and chains, and the smoothing operator: the inclusion
  of smooth chains into continuous chains is a chain-homotopy equivalence [Lee, Thm. 18.7]. The
  smoothing must produce a *chain map together with a chain homotopy* — data, not pointwise
  approximation — so it is built by induction over the faces, each simplex smoothed relative to its
  already-smoothed boundary; the chain map, its homotopy inverse and both chain homotopies are named
  targets, not proof details. Two named
  prerequisites: Whitney approximation *into a manifold*, in relative form, via a Whitney embedding of a
  neighbourhood of a compact subset — a singular simplex has compact image, so the compact-subset version
  happily serves every manifold, not only compact ones — and the ε-neighbourhood retraction of the
  embedded image. The intrinsic tubular-neighbourhood theory stays with the geometric-topology roadmap.
- **8.4 Simplices, Stokes for chains, and the de Rham homomorphism.** The simplex interface is pinned
  here, because none of it is in the pin and all of it is load-bearing. The integration domain is the
  full-dimensional simplex `Δᵖ = {x : ℝᵖ | 0 ≤ xᵢ, Σ xᵢ ≤ 1}`, with the affine equivalence to Mathlib's
  barycentric `stdSimplex ℝ (Fin (p+1))` recorded as the bridge (⚠ the barycentric simplex lies in a
  hyperplane with empty ambient interior — it is the wrong domain to integrate over directly). A
  **smooth simplex** in `M` is a map smooth in [Lee]'s sense — a smooth extension near each point, hence
  to a neighbourhood of `Δᵖ`. The face maps `δᵢ` come with their orientations and the sign `(−1)ⁱ`, and
  `∫_c ω` is the pullback integral over `Δᵖ`, extended linearly to smooth `p`-chains. **Stokes for the
  simplex** is its own named flat target — `∫_{Δᵖ} dω = Σᵢ (−1)ⁱ ∫_{Δ^{p−1}} δᵢ^*ω`, an
  iterated-integral/FTC computation that neither uses nor waits for the corners Stokes of 5.5 — and
  Stokes for
  chains, `∫_{∂c} ω = ∫_c dω` [Lee, Thm. 18.12], follows by linearity from the face computation on the
  simplex; then the de Rham homomorphism `I : H^p_dR(M) → H^p(M; ℝ)`, well defined by 8.3 and Stokes for
  chains, natural in `M`, and compatible with both connecting maps [Lee, Prop. 18.13].
- **8.5 The de Rham theorem.** `I` is an isomorphism in every degree, for every T2 σ-compact
  finite-dimensional smooth manifold [Lee, Thm. 18.14]; the standing hypotheses cannot be weakened (see
  *Statements that must not enter*). The de Rham–Weil induction is packaged as a reusable
  **Mayer–Vietoris induction principle**, stated once and consumed twice (here and in 9.3): a natural
  transformation between two functors on opens that is an isomorphism on a basis stable under finite
  intersection, compatible with countable *disjoint* unions on both sides, and closed under two-set
  unions through the five lemma, is an isomorphism on every open. ⚠ The countable-exhaustion step lives
  *inside* the principle (the shell decomposition of an exhaustion into two disjoint families of finite
  unions), because cohomology does not commute with increasing unions by itself — "exhaustion" is not an
  argument until this principle makes it one. The induction runs in two stages. First, every open
  subset of `ℝⁿ`, over the basis of convex opens — stable under intersection, which chart domains are
  not, and that is the whole reason this stage is separate. Second, the manifold case: charts, a named
  diffeomorphism-invariance lemma for the de Rham property, and the principle again, with the Poincaré
  lemma as the base case. Do not route through geodesic convexity; the
  argument must not depend on Riemannian geometry. Corollary (with 8.1):
  `H^p_dR(M) ≅ Hom(H_p(M; ℝ), ℝ)`, the milestone "de Rham ≅ singular". *Acceptance:* the composite
  recovers 7.3's sphere computation from Mathlib-side singular data, and `I` sends `[dθ]` to the cochain
  whose value on the fundamental class of `S¹` (8.2's target) is `2π` — reusing the number from 5.5 to
  catch orientation drift.

### Layer 9: Poincaré duality

*[Lee, Problems 18-6, 18-7, 18-8; proof shape Bott–Tu Ch. I §5]. Consumes layers 5–7 (compact supports), 2
(orientation) and 8.5's induction pattern.*

- **9.1 The pairing.** For oriented boundaryless n-manifolds, `(ω, η) ↦ ∫_M ω ∧ η` descends to
  `H^k_dR(M) × H^{n−k}_c(M) → ℝ`, since Stokes kills the boundary terms; this gives
  `PD : H^k_dR(M) → (H^{n−k}_c(M))*`.
- **9.2 Top cohomology.** Integration `H^n_c(M) → ℝ` is an isomorphism for connected oriented `M` [Lee,
  Thm. 17.30-style]. For connected *non*orientable `M`, `H^n_c(M) = 0`, and for compact connected
  nonorientable `M` also `H^n_dR(M) = 0`, by averaging over the layer-2 orientation cover [Lee, Thm.
  17.34, via Lemma 17.33] — this is where the orientation double cover finally does real work. (For
  connected noncompact `M`, `H^n_dR(M) = 0` simply falls out of 9.3: `H^n ≅ (H^0_c)* = 0`.) In the
  compact connected oriented case, `H^n_dR(M) ≅ ℝ` via `∫_M`.
- **9.3 The duality theorem.** `PD` is an isomorphism for every T2 σ-compact oriented boundaryless
  n-manifold — with no compactness hypothesis, since the dual lands on the compactly supported side. The
  proof is 8.5's Mayer–Vietoris induction principle with the five lemma, base case 6.2/6.4 — both
  degrees of 6.4's `H^•_c(ℝⁿ)` computation, since compact supports are not homotopy invariant.
  Corollaries: for compact oriented `M`, `H^k ≅ (H^{n−k})*`; **finite-dimensionality** of the `H^k_dR`
  of a compact manifold, by a named linear-algebra route — duality in complementary degrees gives
  `H^k ≅ (H^{n−k})*` and `H^{n−k} ≅ (H^k)*`, so `H^k` is isomorphic to its own double dual, which forces
  finite dimension; the nonorientable case transfers through the layer-2 orientation cover with 9.2's
  averaging — and, on compact oriented `M`, the nondegeneracy of the pairing
  `H^k × H^{n−k} → ℝ`, stated as its own named lemma. The Hodge-theoretic
  proof is deliberately not used here: elliptic theory belongs to the PDE roadmap, and duality must not
  depend on it. *Acceptance:* duality on `Sⁿ` and `ℝⁿ` recovers 7.3 and 6.4;
  `⟨[dθ], [1]⟩ = ∫_{S¹} dθ = 2π ≠ 0`, pairing against the class of `1` in `H⁰_c(S¹)`.

### Layer 10: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"]. Consumes layers 2, 5, 7, 9.2 and Tau Ceti's Sard.*

- **10.1 The manifold inverse function theorem — consume, and extend by one hypothesis.**
  `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, in `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean` (a
  Hopf–Rinow roadmap deliverable, on current Tau Ceti main — ahead of this repository's Tau Ceti pin, so
  code consumes it at the next pin bump), already discharges the TODO of Mathlib's
  `LocalDiffeomorph.lean` for
  boundaryless *model spaces*. What this layer needs on top is only the mild generalization from
  `[I.Boundaryless]` to `[BoundarylessManifold I M]` over an arbitrary model — an extension to
  coordinate with Hopf–Rinow in that same file, never a second independently owned theorem — together
  with regular points and regular values for equidimensional C^∞ maps, stated in chart normal form.
- **10.2 Manifold Sard, equidimensional.** Measure-zero subsets of a manifold (defined through charts;
  second countability makes this well defined), and the transfer of Tau Ceti's equal-dimension Sard
  theorem: critical values form a measure-zero set, so regular values are dense [Lee, Thm. 6.10-style].
- **10.3 The stack of records and the orientation-theoretic degree.** For a C^∞ map `f : M → N` with `M`
  compact, `N` connected, both oriented boundaryless n-manifolds: at a regular value `y` the fiber is
  finite, and `f` is a local diffeomorphism near each preimage, evenly covering a neighbourhood. Define
  `degreeAtRegularValue f y hy := Σ_{x ∈ f⁻¹ y} sign (mfderiv f x)`, the sign taken through the
  `orientationAt` of 2.1 — at a *specified* regular value, since independence of `y` is exactly 10.4's
  theorem; the unqualified `deg f` is defined only after it.
- **10.4 The two definitions agree.** The main theorem [Lee, Thm. 17.35]: for every compactly supported
  top form `ω` on `N`, `∫_M f*ω = degreeAtRegularValue f y hy · ∫_N ω`, at every regular value. In
  particular the sum of signs does not depend on the
  regular value, and `deg f` is the scalar by which `f*` acts on `H^n ≅ ℝ` (9.2) — the milestone that the
  orientation definition equals the de Rham definition. Proved via 10.3, Stokes, and the homogeneity
  lemma of 3.3.
- **10.5 Degree calculus.** `deg (g ∘ f) = deg g · deg f` (with `N` compact and `P` connected, so that
  both factors are defined); diffeomorphisms have degree `±1`; smooth-homotopy invariance (Stokes on
  `M × Icc`); and `deg f ≠ 0` implies `f` surjective. The extension to continuous maps with sphere
  target goes by `SmoothApprox` into the ambient space, radial normalization, and the straight-line
  homotopy, with well-definedness on homotopy classes; that is enough for every corollary here. The
  extension to continuous maps with a general target is part of this item too: it goes through 8.3's
  Whitney approximation, and comes after the sphere case.
  `deg (antipodal : Sⁿ → Sⁿ) = (−1)^{n+1}`. Corollaries: there is no retraction `Sⁿ ↛ B^{n+1}`, and the
  Brouwer fixed-point theorem in all dimensions. Reconcile rather than duplicate: on `S¹`, `deg`
  agrees with the winding integer of `TauCeti.Circle.fundamentalGroupMulEquiv` under the
  π₁-abelianization pairing, and the conformal-mapping roadmap's holomorphic local degree is cited, not
  re-proved. *Acceptance* (all in dimension `n ≥ 1`, where the gates are true — ⚠ on a point the constant self-map
  *is* the identity, of degree `1`, and `S⁰` is disconnected, outside 10.3's setup):
  `deg id = 1`, `deg const = 0`, `deg (z ↦ zⁿ) = n` on `S¹`, and
  `deg antipodal = (−1)^{n+1}` — four gates that catch a vacuous or sign-flipped degree.

### Layer 11: the hairy ball theorem

*[Lee, Problem 16-6, by the degree route]. Consumes layer 10 and the sphere instances.*

- **11.1 The theorem.** The elementary form first: for `E` with `[Fact (finrank ℝ E = n + 1)]` and `n`
  even, every continuous `w : sphere (0:E) 1 → E` with `⟪w x, x⟫ = 0` vanishes somewhere. Reduce the
  continuous case to the smooth one (`SmoothApprox`, tangential projection, compactness), normalize, use
  the great-circle homotopy from `id` to the antipodal map that a nonvanishing field provides, and
  contradict `deg antipodal = (−1)^{n+1} ≠ 1 = deg id` for `n ≥ 2`. The case `n = 0` is direct: in a
  1-dimensional ambient space, tangency forces `w = 0`.
- **11.2 The manifold form and the dichotomy.** Every C⁰ or C^∞ section of `TangentBundle` over an
  even-dimensional sphere vanishes somewhere, through an explicit `mfderiv`-composition bridge to 11.1 —
  ⚠ the identification in `range_mfderiv_coe_sphere` is non-canonical, so bridge by composition, not by
  defeq. The odd case: the explicit nonvanishing rotation field on `S^{2m+1}` (definition, `contMDiff`,
  `ne_zero`). Together: **`Sⁿ` admits a nowhere-vanishing tangent field iff `n` is odd**, with the
  corollaries that an even sphere has no continuous unit tangent field and that `S^{2m}` is not
  parallelizable. Do not route through Euler characteristics: the degree argument stands on its own, and
  Poincaré–Hopf is not a target of any current roadmap.

### Layer 12: Riemannian metrics and the Laplace–Beltrami operator

*[Lee, Ch. 13 and 16]. Consumes the Riemannian substrate, `CovariantDerivative` and layers 0, 2, 5 where
stated.*

- **12.1 Existence and examples of metrics.** Every second-countable T2 finite-dimensional C^∞ manifold
  admits a `ContMDiffRiemannianMetric`, by a partition of unity and convexity of the positive-definite
  cone [Lee, Prop. 13.3]. Then pullback metrics along immersions, product metrics, the induced metric on
  `Opens` and on 5.1's boundary manifold, and the round metric on spheres — the pullback of the ambient
  inner-product metric along the inclusion, which the volume gate of 12.5 uses. Built here now, shaped
  like mathlib4#33714, and deleted when the pin includes it.
- **12.2 Musical isomorphisms and the gradient.** `flat` and `sharp` as C^∞ bundle isomorphisms
  `TM ≅ T*M` (fiberwise Fréchet–Riesz); `mgradient f x := sharp (mfderiv f x)`, with the junk-value
  conventions, linearity, the chain rule, and compatibility with `Analysis/Calculus/Gradient` on the flat
  model.
- **12.3 Divergence, Hessian, Laplace–Beltrami — over the Hopf–Rinow connection.** Metric-compatibility
  and torsion are the pin's (`CovariantDerivative.IsMetricCompatible`, `CovariantDerivative.torsion`),
  and the fundamental theorem of Riemannian geometry — existence, uniqueness and smoothness of the
  Levi-Civita connection — is the **Hopf–Rinow roadmap's**, together with geodesics and the exponential
  map; this layer consumes all of that and builds none of it. Built here: divergence as the pointwise
  trace of
  a covariant derivative; the Hessian with its basic API — symmetry from torsion-freeness, the flat-model
  computation, and the value at critical points; and `laplaceBeltrami f := div (mgradient f)`, equal
  to the trace of the Hessian, registered in the `Δ` notation class.
- **12.4 The volume form and the measure.** On oriented Riemannian n-manifolds: the Riemannian volume
  form, the unique positively-oriented top form of unit length (`Orientation.volumeForm` fiberwise;
  consumes layers 0 and 2) [Lee, Prop. 15.29]. The measure is a first-class object,
  `riemannianMeasure g : Measure M`, locally finite and of full support, agreeing with 5.2's
  `∫_M f dV_g` for compactly supported `f` on oriented `M`; strict positivity is stated
  measure-theoretically — through `lintegral`, for nonnegative continuous integrands positive somewhere
  — ⚠ never through the junk-valued Bochner integral, which is `0` on any nonintegrable function, so
  the naive positivity claim would already be false for `f ≡ 1` on `ℝ`. Then `div` re-characterized by
  `d(ι_X dV_g) = (div X) dV_g`, the bridge between 12.3's trace definition and [Lee]'s form-level one,
  with orientation-independence of `div` recorded — automatic once the measure, not the form, is
  primary. The nonorientable measure is 5.5's densities specialized to `g`, consumed here, not rebuilt.
- **12.5 The divergence theorem and Green's identities.**
  `∫_M div X dV_g = ∫_{∂M} ⟪X, N⟫ dV_{g̃}` for compactly supported `X`, with outward unit normal `N` and
  the induced metric and orientation from 5.1 and 12.1 [Lee, Thm. 16.32]; Green's first and second
  identities; `Δ` symmetric on functions with `tsupport` inside `I.interior M`, hence on all compactly
  supported functions when `M` is boundaryless. The layer stops here: eigenvalues, elliptic regularity,
  maximum principles and heat kernels belong to the PDE roadmap. *Acceptance:* on the flat model,
  `laplaceBeltrami` agrees with the `Δ` of `InnerProductSpace.instLaplacian` (the sign gate);
  `Δ‖x‖² = 2n` on `ℝⁿ`; and the volume of `S¹` with the round metric is `2π`, reusing the integral from
  5.5.

## Statements that must not enter the library

Each of these is a tempting mistake, recorded with a concrete refutation. Reject any target or proof that
smuggles one in.

- **"Orientable = admits a positive-Jacobian atlas", as a definition.** False in the presence of
  boundary: `Set.Icc 0 1` is orientable, but its two standard interval charts cannot be made
  positively-transitioning. Chart-sign data (2.1) is the definition; the atlas criterion is a theorem for
  boundaryless manifolds.
- **"The sigma topology on pointwise orientations is the orientation cover."** That topology is discrete
  on the total space, and a projection from a discrete space onto a non-discrete `M` is not a local
  homeomorphism, hence not a covering map.
- **"`H^•_c` is functorial for all smooth maps."** Extension by zero needs open inclusions; general
  functoriality holds only for proper maps. The constant map `ℝ → pt` already fails on `H^0_c`.
- **"Integral manifolds are embedded" / "leaves carry the subspace topology."** The irrational line on
  the torus is a leaf, dense in the subspace topology; only *immersed, weakly embedded* is true (4.3).
  Relatedly, **"`T_pS ⊆ D_p` suffices"**: containment defines the larger class of tangent submanifolds,
  for which Frobenius is false (any curve in a 2-distribution).
- **"[Lee]'s boundary-orientation signs transfer verbatim."** Mathlib's half-space constrains the first
  coordinate, [Lee]'s the last; the induced sign on `∂Hⁿ` differs and must be recomputed.
- **"Δ = −div ∘ grad", with [Lee]'s sign.** This repository pins `Δ = div ∘ grad`; the geometer-sign
  statement contradicts 12.5's flat compatibility gate.
- **"Degree is defined for noncompact domains, or at critical values without care."** The fiber-sign sum
  can be infinite or undefined: the inclusion of `(0, ∞)` into `ℝ` has no degree, its sum being `1` over
  regular values `y > 0` and `0` over `y < 0`.
- **"The de Rham comparison holds for every `IsManifold`."** `IsManifold` does not include Hausdorffness,
  and the line with two origins is an orientable boundaryless counterexample: `H¹_dR = 0` (a closed
  1-form's chart representatives glue to a primitive) while singular Mayer–Vietoris gives
  `H¹(–; ℝ) ≅ ℝ`. The standing `[T2Space M] [SigmaCompactSpace M]` hypotheses are genuinely needed by
  every one of the cohomological main theorems.
- **"`Prop`-typed placeholder targets are acceptable in `Suggested.lean`."** This restates repository
  policy, because the roadmap has unusually many targets whose types cannot yet be expressed: a condition
  that cannot be stated yet is prose in the README, never `def _ : Prop := sorry`.

## Relation to sibling roadmaps

- **Universal covers** owns π₁, the covering-space classification, deck groups and πₙ. Items 2.4 and 6.3
  consume them, and nothing in that roadmap depends on anything here.
- **Geometric topology** consumes the orientation interface (its connected-sum and surgery layers
  quantify over `[Oriented M]`-style hypotheses) and the singular cohomology machinery; its Euler-class
  layer additionally needs ℤ coefficients and surface fundamental classes, which it builds itself. Three
  seams are shared. The boundary-as-manifold structure, which its gluing track
  named as its first prerequisite, is now in Tau Ceti (`Boundary/Charts.lean`); 5.1 builds the
  orientation and restriction interface on top, serving both roadmaps. The general
  distribution and foliation objects are layer 4's, with its codimension-one layer specializing them, so
  a single foliation definition enters the library. The volume seam is open coordination rather than
  settled fact: the Riemannian volume form, measure and densities are 12.4's and 5.5's targets here,
  with its curvature and hyperbolic-volume layers as intended consumers — but its Layer 7 currently
  builds a volume measure of its own over the Hopf–Rinow connection, so converging on one home needs a
  companion edit there, offered alongside this PR. Intrinsic tubular and collar
  neighbourhoods, gluing, and everything 3-manifold-specific stay with it.
- **Hopf–Rinow** owns the Levi-Civita connection (existence, uniqueness, smoothness), geodesics and
  their flow, the exponential map, and Hopf–Rinow itself; 12.3 consumes the connection and builds only
  divergence, the Hessian and the Laplacian on top. The manifold inverse function theorem lives in its
  `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean`, where 10.1's boundaryless-manifold generalization
  is an extension coordinated with that roadmap. Its geodesic-flow analysis names smooth dependence on
  initial conditions among its needs — 3.1 and 3.2 are built to serve it, and the two roadmaps should
  converge on one flow API rather than two.
- **PDE** owns everything analytic about `Δ` beyond 12.5 and pins the flat conventions that 12.5's gate
  must match: the operator is defined here and analyzed there.
- **Heegaard Floer (analytic)** lists manifold orientations and degree theory among its missing
  prerequisites; layers 2 and 10 supply them. The bridge in 0.4 and the closedness definition in 6.1 let
  its symplectic lane refactor onto the general forms library without a fork, and flat Sard is consumed
  from it rather than rebuilt (10.2).
- **Representation theory / Lie groups** names the Frobenius theorem as the analytic prerequisite of its
  subalgebra ↔ subgroup correspondence. Layer 4 is the theorem's home, built to that consumer's
  specification; the citation stays there. Its Layer-0 Lie-group flows are subsumed by layer 3 with named
  reconciliation lemmas, and its simply connected covers consume 2.3.
- **Contour integration** owns contour integrals of complex functions; 5.3 reconciles with
  `curveIntegral` and goes no further. **Modular forms** may refactor its region-Stokes workaround onto
  layer 5; that is its choice, not an obligation created here. **One-parameter semigroups** owns the
  operator-semigroup analogue of flows.

## Ordering

Layers 0 and 1 start first, and most of the roadmap refers to them; they follow the bundled-forms design
direction of the threads below. Layers 2, 3 (except the form-half of 3.4) and 12.1–12.3 are independent of
them and can run in parallel from day one. Layer 4 needs layer 3, and 1.4 for its 1-form criterion;
12.4–12.5 need 0, 2 and 5. The integration track is strictly 5 → {6, 7} → 8 → 9, though 6 and most of 7 are
available as soon as 0–1 land — inside them, 6.3 needs only 5.4's Stokes-free homotopy identity, while
7.1's surjectivity trick and 7.3's acceptance gate draw on 5.2–5.3. Degree (10) needs 2, 5, 7 and 9.2; the
hairy ball theorem (11) needs 10 and nothing else. The two hardest items — the flat smooth-dependence
theorem (3.1) and the singular subdivision layer (8.2) — gate
everything after them, so start each early within its layer. Claim work at the granularity of single
numbered items or smaller; the headline theorems (5.3, 8.5, 9.3, 10.4, 11.1) are staged claims whose
intermediate lemmas must land as reusable pull requests.

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
