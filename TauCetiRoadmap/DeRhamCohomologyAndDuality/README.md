# Roadmap: differential geometry, Part II — relative de Rham theory, fundamental classes and relative transversality

**Summary.** [DifferentialGeometry](../DifferentialGeometry/README.md) builds the absolute theory:
forms, the exterior derivative, orientations, integration and Stokes (its layers 0–5), the de Rham
complex and cohomology with the Poincaré lemma, homotopy invariance, smooth path integrals and
compact supports (layer 6), the Mayer–Vietoris sequences (layer 7), smooth singular chains and the
de Rham theorem (layer 8), the Poincaré pairing and Poincaré duality (layer 9), Sard on manifolds
and the Brouwer degree (layer 10) and the hairy ball theorem (layer 11). It stops at the absolute
theory of a single manifold with smooth paths and smooth forms. This Part II continues from there
with five additions that DifferentialGeometry does not plan: integration of *continuous* planar
`1`-forms along *continuous* paths through local potentials; smooth chains over manifolds with
boundary and corners through strictly inward vector fields and inward domination, with the relative
smooth chain comparison and relative approximation into vector spaces; the relative de Rham complex
of an open pair, its integration map and the relative de Rham isomorphism; the comparison of
integration of top forms with AlgebraicTopology's singular fundamental classes, including manifolds
with boundary; and finite-parameter relative transversality of families against maps, with
Haar-null exceptional parameters. The end theorems are exactness of continuous planar forms with
local potentials on simply connected domains (1.3), inward domination (2.2), the relative de Rham
isomorphism (3.3), the fundamental-class integration formula (4.1) with its boundary form (4.2),
and generic relative transversality (5.3).

## Scope and ownership

This roadmap owns:

- local potentials of continuous planar `1`-forms, their continuous path integral, its homotopy
  invariance and the exactness theorem on simply connected domains (Layer 1);
- the strict inward cone of a model with corners, strictly inward vector fields, their forward
  semiflow, smooth proper exhaustion functions, inward domination, the transfer of smooth-chain
  equivalences along inward domination, the relative smooth chain comparison, and relative
  approximation into finite-dimensional vector spaces with collar data (Layer 2);
- the relative de Rham complex of an open pair, the algebraic comparison of a cone with a kernel,
  relative integration, the relative de Rham homomorphism and isomorphism (Layer 3);
- the integration comparison with singular fundamental classes and the smooth-boundary
  compatibility formula, with the coefficient and carrier conversions they need (Layer 4);
- finite-parameter relative transversality: the incidence equation, regular incidence parameters,
  the Haar-null theorem, relative translation families, avoidance, and perturbation on compact
  sources (Layer 5).

It does not own, and imports by section:

- from DifferentialGeometry: forms, the exterior derivative, orientations and the orientation
  double cover (layers 0–2), flows (layer 3), integration of top forms and Stokes (layer 5), the
  absolute de Rham complex, `H^•_dR`, `H^•_c`, the flat and manifold Poincaré lemmas and smooth path
  integration (layer 6), the Mayer–Vietoris sequences (layer 7), smooth singular chains, the
  absolute smoothing equivalence, chain integration and the absolute de Rham isomorphism
  `deRhamEquiv` (layer 8), the Poincaré pairing and Poincaré duality (layer 9), regular values,
  Sard on manifolds and the degree (layer 10) and the hairy ball theorem (layer 11);
- from AlgebraicTopology: singular chains and cochains, relative chains and cochains, subdivision,
  small chains, excision and Mayer–Vietoris (Stages 2–3), universal coefficients, the evaluation
  pairing, the cup product, the homological orientation system, `RelativeTwistedClassDatum`, the
  compact-support class factory and the singular fundamental classes (Stage 6, in particular 6.1
  and 6.3); its Stage 6.5 compares its homological degree with DifferentialGeometry 10's smooth
  degree, and nothing here touches that comparison;
- from HeegaardFloer: the sharp finite-order Sard theorem (its §2.1, F0.S), which no target here
  needs, since every map in Layer 5 is `C^∞`;
- from GeometricTopology: collars, collar uniqueness, tubular neighbourhoods and gluing; Brown's
  collar theorem is already in Tau Ceti.

Adjacent roadmaps with a different object: TangentialBordism §2.1 proves parametric transversality
to a closed embedded submanifold with a dense set of good parameters, and relative Whitney
approximation into a manifold; Layer 5 here is transversality of a family to an arbitrary smooth
map `j : N → V` into a vector space, with a Haar-null exceptional set, and §2.5 here prescribes
boundary collar data for fillings into a vector space. ComplexKahlerGeometry consumes Layers 3–4.

DifferentialGeometry 8.3 states the absolute smoothing equivalence over every model with corners,
by a face-fixing relative smoothing lemma. That lemma fails for targets with boundary (*Statements
that must not enter the library*, the `3`-simplex in `[0, ∞)`). §2.3 proves, independently, that
the equivalence for the boundaryless manifold `I.interior M` transfers to `M` along inward
domination; DifferentialGeometry 8.3 remains the owner of the absolute statement.

## Conventions

DifferentialGeometry's *Conventions* are in force: everything is over `ℝ`;
`I : ModelWithCorners ℝ E H` and `M` with `[ChartedSpace H M] [IsManifold I ∞ M]`; total functions
with junk values in the `mfderiv` style and the real hypotheses on the theorems; orientations are
DifferentialGeometry 2.1's chart-sign data; no measurable structure is installed on a manifold. In
addition:

- **Hypotheses carried visibly.** `[FiniteDimensional ℝ E]`, `[T2Space M]` and
  `[SigmaCompactSpace M]` are written exactly where used; they are load-bearing in Layers 2–4.
  `[CompleteSpace F]` is written where a vector-valued form is integrated by a Bochner integral
  (the comparison with `curveIntegral` in §1.2); the potential-difference integral of §1.2 needs no
  completeness.
- **Universes.** Spaces live in `Type` wherever singular (co)homology appears (Layers 2–4).
- **Relative complexes** are indexed by `ℤ`, after extending the `ℕ`-indexed de Rham complexes of
  DifferentialGeometry 6.1 by zero along `ComplexShape.embeddingUpNat`; negative degrees are zero.
- **Signs.** The relative de Rham complex of an open `W ⊆ X` has degree-`q` term
  `Ω^q(X) ⊕ Ω^(q−1)(W)` and differential `(α, β) ↦ (dα, α|_W − dβ)`. Relative integration of a
  relative cocycle `(α, β)` on a smooth `q`-chain `c` with `∂c` in `W` is `∫_c α − ∫_{∂c} β`. The
  connecting map is `δ[b] = −[(0, b)]`, which agrees with the singular connecting map
  `(δb)(c) = b(∂c)` (witness in §3.1). The boundary of a smooth simplex is
  `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`. Boundary orientations are DifferentialGeometry 5.1's outward-first
  orientation for Mathlib's half-space, which constrains the *first* coordinate.
- **Transversality.** For `F : E × P → V` and `j : W → V`, the source coordinates come before the
  parameter, as in `TauCeti.IsRegularParameter`; a parameter `p` is regular when
  `(u, v) ↦ D_xF(x, p)u − Dj(y)v` is onto at every `(x, y)` with `F(x, p) = j(y)`, vacuously when
  there is no such point.

## Exact supplier contracts

### From Mathlib

- `extDeriv`, `extDerivWithin`, `curveIntegral`, `SimplyConnectedSpace` and
  `SimplyConnectedSpace.paths_homotopic`, `Path`, `ContinuousMap.HomotopyRel`.
- `CochainComplex.mappingCone`, `CochainComplex.mappingCocone` (the cone shifted by `−1`, with its
  signed projections and inclusions), `HomologicalComplex.extend`, `ComplexShape.embeddingUpNat`,
  `HomologicalComplex.homology`, `CategoryTheory.ShortComplex.ShortExact` and its long exact
  sequence, `ChainComplex.linearYonedaObj`, `Homotopy`, the five lemma.
- `Continuous.exists_contMDiff_approx_and_eqOn` and `Continuous.exists_contDiff_approx_and_eqOn`
  (`Geometry/Manifold/SmoothApprox.lean`): finite-dimensional source, Hausdorff σ-compact manifold,
  a closed set near which the map is already smooth, and a positive continuous tolerance.
- `exists_contMDiffMap_one_nhds_of_subset_interior` and
  `exists_contMDiffSection_forall_mem_convex_of_local` (`Geometry/Manifold/PartitionOfUnity.lean`);
  the latter needs genuinely local smooth sections with values in fibrewise convex sets.
- `IsOpen.exists_contDiff_support_eq` (support equal to a given open set, not compact support).
- `ModelWithCorners.interior`, `ModelWithCorners.isOpen_interior`, `ModelWithCorners.boundary`,
  `ModelWithCorners.isClosed_range`, `BoundarylessManifold`, `𝓡∂ n`,
  `modelWithCornersEuclideanQuadrant`.

### From Tau Ceti

- `TopCat.singularCochainComplex`, `TopCat.singularCohomology` and induced maps
  (`AlgebraicTopology/Cohomology/Basic.lean`); `TopPair.singularCochainComplex` and the cochain
  sequence of a pair (`AlgebraicTopology/Cohomology/Relative.lean`).
- `TauCeti.IsRegularParameter`, `TauCeti.isMeagre_setOf_not_isRegularParameter` and the level-set
  charts `levelSetChart` (`Analysis/Fredholm/LevelSet/`); every operator between
  finite-dimensional spaces is Fredholm.
- `TauCeti.addHaar_image_criticalPoints_eq_zero` (flat Morse–Sard on a set, threshold
  `(dim source)² + 1`, `Analysis/Calculus/Sard/OutermostStratum.lean`).
- Brown's collar theorem `TauCeti.IsLocallyCollared.isCollared` (`Geometry/Manifold/Boundary/Collar/Brown.lean`)
  and the boundary manifold of a manifold over `𝓡∂ (n+1)` (`Geometry/Manifold/Boundary/`).

### From TauCetiRoadmap.DifferentialGeometry

- 0.1, 0.3–0.4: the wedge, rough and smooth forms, pullback and its chain rule.
- 1.1–1.4: the manifold exterior derivative, naturality, `d² = 0`.
- 2.1–2.2: orientations and orientation-preserving maps.
- 5.1–5.3: the boundary interface and outward-first orientation, `integralTopForm` and its
  additivity, Stokes' theorem for the half-space model.
- 6.1, 6.4: `deRhamComplex`, `deRhamCohomology`, `closedForms`, `exactForms`, functoriality,
  the compactly supported complex with `extensionByZero` and `properPullback`.
- 6.3: homotopy invariance on `M × [0, 1]` with no boundaryless restriction.
- 8.3: `SmoothSimplex`, `smoothSingularChainComplex`, `smoothToSingular`, and the absolute
  smoothing equivalence for boundaryless Hausdorff σ-compact finite-dimensional manifolds.
- 8.4: `fullSimplex`, `simplexFace`, `SmoothSimplex.integral`, `chainIntegral`, Stokes for
  simplices and chains, `deRhamHom` and its naturality.
- 8.5: `deRhamEquiv`, for every open of a Hausdorff σ-compact finite-dimensional `M`.

### From TauCetiRoadmap.AlgebraicTopology

- Stages 2–3: relative singular chains, excision, the five-lemma comparisons.
- Stage 6.1: the evaluation pairing and relative cochains.
- Stage 6.3: the homological orientation system, chart-normalized point generators, the chosen
  local section, `RelativeTwistedClassDatum`, the compact-support class factory, the integral
  fundamental class of a compact oriented manifold and the oriented relative class of a compact
  manifold with boundary.

## How to read the build

Layer 1 is planar analysis and depends on nothing else here. Layer 2 is differential topology of
models with corners: the inward cone and inward domination (§§2.1–2.2) are independent of chains,
and the transfer and relative chain comparisons (§§2.3–2.4) consume DifferentialGeometry 8.3;
relative approximation (§2.5) is independent of the rest. Layer 3 builds the relative de Rham
theory on DifferentialGeometry 6 and 8 and Layer 2's relative chains. Layer 4 consumes Layer 3 and
AlgebraicTopology 6.3. Layer 5 needs only calculus, Tau Ceti's level-set and Sard APIs and §2.5,
and can start at once.

## Layer 1: continuous planar forms with local potentials

DifferentialGeometry 6.3 integrates smooth `1`-forms along smooth paths. Here forms and paths are
only continuous, and the integral is built from potential differences, never from a derivative of
the path.

### 1.1 Local potentials

On an open `Ω ⊆ ℂ`, let `F` be a real normed space (complex spaces by restriction of scalars) and
represent a continuous `1`-form by its covector field `φ : C(Ω, ℂ →L[ℝ] F)`, the field consumed by
`curveIntegral` and DifferentialGeometry's degree-one flat forms. Define `HasLocalPotentials Ω φ`:
every `z ∈ Ω` has `r > 0` with `ball(z, r) ⊆ Ω` and an ambient `g : ℂ → F`, `C¹` on the ball, with
derivative `φ(w)` at every `w` in it.

- A `C¹` form whose exterior derivative vanishes on `Ω` has local potentials when `F` is complete,
  by DifferentialGeometry 6.2's flat Poincaré lemma on discs.
- Local potentials are unique up to an additive constant on each connected disc.
- The predicate is local: it holds on `Ω` iff it holds on every open cover of `Ω`, and it is
  preserved by restriction to open subsets and by pullback along `C¹` maps of plane domains.

**Checks.**

- `φ = dx` (the constant covector `Re`) has local potentials, with `g = Re`; the zero predicate and
  any predicate demanding `φ = 0` fail here.
- `φ = x dy` has none: a potential would be `C²` with mixed partials `0` and `1`; an always-true
  predicate fails here.
- The angular form `(x dy − y dx)/(x² + y²)` on `ℂ ∖ {0}` has local potentials (branches of `arg`)
  but no global one, since its loop integral around `0` is `2π`; a predicate requiring a global
  potential fails here.
- `φ = d(|x|^(3/2))` has local potentials although `φ` is not `C¹`: a predicate requiring a `C¹`
  closed form is strictly stronger.

### 1.2 The continuous path integral

For a continuous `γ : Path a b` in `Ω` and `φ` with local potentials, define `∫_γ φ` by a
subdivision of `[0, 1]` into subintervals mapped into potential discs, as the sum of the endpoint
differences of the potentials. Prove that it is independent of the discs, potentials and
subdivision; additive under concatenation and negated under reversal; invariant under homotopy rel
endpoints, by subdividing the homotopy square into cells mapped into potential discs and cancelling
edge increments (no Stokes, no derivative of the path); equal to `curveIntegral φ γ` for `C¹` paths
when `F` is complete; and natural under `C¹` maps of plane domains, by composing potentials. On
path-connected `Ω`, if every loop integral vanishes then integration from a base point is a global
`C¹` potential, and conversely. *Needs:* §1.1; Mathlib `Path`, `curveIntegral`,
`ContinuousMap.HomotopyRel`, Lebesgue number lemma.

**Checks.**

- The angular form over the unit circle loop has integral `2π`; over the loop traversed twice,
  `4π`; over its reversal, `−2π`.
- `φ = dx` over any path from `a` to `b` gives `Re b − Re a`, including the nowhere-differentiable
  path `t ↦ t + i·W(t)` for a continuous nowhere-differentiable `W` with `W(0) = W(1) = 0`, where
  no derivative-based definition applies.
- A constant path has integral `0`.

### 1.3 Exactness on simply connected domains

Prove `exists_hasFDerivAt_of_simplyConnected`: on an open `Ω ⊆ ℂ` with `SimplyConnectedSpace Ω`,
every continuous `φ` with local potentials has a global `g : ℂ → F`, `C¹` on `Ω`, with derivative
`φ(w)` at every `w ∈ Ω`. Loop integrals vanish by §1.2's homotopy invariance and
`SimplyConnectedSpace.paths_homotopic`. On an arbitrary open `Ω` apply this on each simply
connected component; the empty domain takes the zero potential. *Needs:* §§1.1–1.2; Mathlib
`SimplyConnectedSpace.paths_homotopic`.

**Checks.**

- On the slit plane `ℂ ∖ (−∞, 0]` the angular form has the global potential `arg`.
- On `ℂ ∖ {0}`, which is not simply connected, the conclusion fails for the angular form; the
  hypothesis is necessary.
- On `Ω = ℂ`, `φ = dx` gives `g = Re + c` and no other potential.

### Examples

The punctured-plane angular form, with loop integral `2π`, separates local from global potentials;
ComplexKahlerGeometry K5a normalizes it for complex coefficients.

### Dependencies

DifferentialGeometry 6.2 (flat Poincaré lemma, for the `C¹` closed case only); Mathlib paths,
homotopies and `curveIntegral`.

## Layer 2: smooth chains over manifolds with boundary and corners

### 2.1 The strict inward cone and strictly inward fields

For `C = range I` (convex, closed by `ModelWithCorners.isClosed_range`, with nonempty interior),
the *strict inward cone* at `x ∈ C` is the set of `v ∈ E` for which there are `ε, δ > 0` with
`ball(x + tv, εt) ⊆ C` for `0 < t < δ`.

- It is convex and closed under positive scaling, and contains `q − x` for every interior `q` of
  `C`.
- It is open, with `ε, δ` uniform on a neighbourhood of `(x, v)` in `C × E`.
- It is invariant under the derivatives of `C¹` chart changes, so it defines an open cone in each
  tangent space of `M`.
- A smooth vector field on `M` is *strictly inward* when its value lies in this cone at every
  point. On a Hausdorff σ-compact finite-dimensional `M` a smooth strictly inward field exists,
  glued from constant local fields by `exists_contMDiffSection_forall_mem_convex_of_local`.

**Checks.**

- Half-line `C = [0, ∞)` at `0`: the cone is `(0, ∞)`; `v = 0` and `v = −1` are excluded (the ball
  around `tv` leaves `C`), so a definition using the closed tangent cone is wrong here.
- Quadrant `[0, ∞)²` at the origin: the cone is the open quadrant; `(1, 0)` is excluded.
- At an interior point the cone is all of `E`; on a boundaryless model every field is strictly
  inward.

### 2.2 Inward semiflow and inward domination

On a Hausdorff σ-compact finite-dimensional `M`, construct a smooth proper function
`f : M → [0, ∞)` from a smooth partition of unity subordinate to a cover by relatively compact
opens, as for [Lee, Prop. 2.28]. For a strictly inward field `X`, construct its forward semiflow in
`C`: local existence, uniqueness and joint smoothness (Picard iteration on paths constrained to
`closedBall(x + tX(x), εt/2)`, convex mean-value and Grönwall estimates, higher smoothness from the
variational equation on `C × L(E, E)`); entry into the interior at positive time and persistence
there; maximal forward times and the forward escape lemma; global forward existence after
rescaling `X` so that `|Xf| ≤ 1/2`. The intrinsic interior `N = I.interior M` is open
(`ModelWithCorners.isOpen_interior`), boundaryless, second countable and σ-compact. With
the semiflow `ψ`, `r = ψ(1, ·)` and `Φ(t, x) = ψ((1 − t)², x)`, prove
`exists_smooth_inward_deformation`: there are smooth `r : M → M` with values in `I.interior M` and
smooth `Φ : ℝ × M → M` (over `𝓘(ℝ, ℝ).prod I`) with `Φ(0, ·) = r`, `Φ(1, ·) = id` and every
`Φ(t, ·)` preserving `I.interior M`. This *inward domination* is the target. For
the half-space model, inward-pointing fields and their flows are [Lee, Ch. 9, collar
neighbourhoods]; for a general convex model the construction is this roadmap's. *Needs:* §2.1;
Mathlib smooth partitions of unity; DifferentialGeometry 3 for the flow API on the boundaryless
interior.

**Checks.**

- On `[0, ∞)`, `r(x) = x + 1` and `Φ(t, x) = x + (1 − t)²` satisfy every clause: `Φ(0, x) = x + 1`,
  `Φ(1, x) = x`, and `x > 0` gives `Φ(t, x) > 0`.
- On `[0, 1]` with the inward field `1/2 − x`, `ψ(s, x) = 1/2 + (x − 1/2)e^(−s)`, so
  `r(x) = 1/2 + (x − 1/2)/e ∈ (0, 1)`; a field vanishing at an endpoint (`x(1 − x)`) has `r(0) = 0`
  and fails the interior clause.
- On a boundaryless `M`, `r = id` and `Φ(t, x) = x` work; the theorem has content only at the
  boundary.
- A semiflow is not a collar: on the quadrant the flow of `(1, 1)` is not a product structure near
  the corner; collars remain GeometricTopology's.

### 2.3 Transfer of smooth-chain equivalences

For smooth `j : N → M` and `r : M → N` with a specified smooth homotopy `j ∘ r ~ id_M`, if the
inclusion of smooth chains is a chain homotopy equivalence for `N`, then the composite of `r` on
singular chains, the homotopy inverse for `N` and `j` on smooth chains is a homotopy inverse of the
inclusion for `M`. Prove both inverse identities from pushforward naturality, the smooth prism
operator of a jointly smooth homotopy `ℝ × M → M`, and on continuous chains the chain homotopy of
the restricted homotopy on `[0, 1]`; no homotopy `r ∘ j ~ id_N` is used. Applied to §2.2 with
`N = I.interior M`, this gives the smooth chain equivalence for every Hausdorff σ-compact
finite-dimensional `M` over any real model with corners from the boundaryless case of
DifferentialGeometry 8.3. Two homotopy inverses of one map are homotopic (`s ~ s ≫ i ≫ t ~ t`),
which removes the dependence on inward choices and gives naturality on homology. *Needs:* §2.2;
DifferentialGeometry 8.3 (boundaryless case), AlgebraicTopology Stage 2 (chain homotopy of a
homotopy).

**Checks.**

- On `[0, ∞)`, `H₀` of smooth chains is `ℝ`, every point cycle maps to the class of `0`, and the
  path `t ↦ t` is a smooth `1`-simplex with boundary `[1] − [0]`.
- On the quadrant `modelWithCornersEuclideanQuadrant 2` and on `[0, 1]²` over
  `(𝓡∂ 1).prod (𝓡∂ 1)`, `H₀ ≅ ℝ` by total coefficient and `H_k = 0` for `k ≥ 1`.
- On `ℝ` with the cube-root charts `φ_a(y) = cuberoot(y − a)` smooth paths are constant and smooth
  `H₀` is not `ℝ`: the transfer needs smooth chart compatibility, not just a charted space.

### 2.4 Relative smooth chains

For an open submanifold `W ⊆ X` with `X` as above (an open subset of a σ-compact
finite-dimensional manifold is σ-compact), define `C^∞(X, W) = C^∞(X)/C^∞(W)` with its short exact
sequence and boundary formula, its map to AlgebraicTopology's relative singular chains, and prove
it a quasi-isomorphism by the five lemma from the two absolute comparisons of §2.3. Over `ℝ`, give
the relative comparison and its homotopy inverse from degreewise splittings of cycles and
boundaries, compatibly with the dual map; the dual relative cochain quasi-isomorphism against
Tau Ceti's `TopPair.singularCochainComplex`; naturality in smooth maps of pairs, relative boundary
maps and enlargement of `W`. An inward deformation need not preserve every open at once, which is
why opens go through the absolute constructions. *Needs:* §2.3; AlgebraicTopology Stages 2 and 6.1;
Tau Ceti relative cochains.

**Checks.**

- `W = ∅` gives the absolute comparison; `W = X` gives the zero complex on both sides.
- For `X = ℝ`, `W = ℝ ∖ {0}`: relative `H₁ ≅ ℝ`, generated by the class of the smooth path
  `t ↦ 2t − 1` on `[0, 1]`, whose boundary lies in `W`.
- Relative `H₀(ℝ, ℝ ∖ {0}) = 0`: every point is homologous to a point of `W`.

### 2.5 Relative approximation into vector spaces

Source a Hausdorff σ-compact finite-dimensional manifold with corners, target a finite-dimensional
real normed space `V`. For the interval, the closed disc and the square, construct ambient
fillings: the continuous retractions `r(t) = max(0, min(1, t))`, `r(s, t) = (r(s), r(t))` and
`r(v) = v / max(1, ‖v‖)` extend a continuous filling to the ambient space. Boundary data come with a
specified compatible smooth collar extension (sitting intervals at endpoints; edge extensions
constant near vertices on the square; the radial collar on the disc), glued by a smooth cutoff. If
a filling agrees with the extension only on the boundary, blend in a thin collar chosen by
continuity and compactness, so that the result is smooth near a smaller closed collar, moves
arbitrarily little in `C⁰` and fixes the boundary; then apply
`Continuous.exists_contDiff_approx_and_eqOn` with that collar fixed. Export the smooth filling, the
straight-line homotopy rel boundary and its `C⁰` bound; a compact image reserve in an open
`U ⊆ V` is preserved by a tolerance from finitely many balls; restriction, collar refinement,
coordinate change and finite products. *Needs:* Mathlib `Continuous.exists_contDiff_approx_and_eqOn`,
`exists_contMDiffMap_one_nhds_of_subset_interior`.

**Checks.**

- `r(2) = 1`, `r(−1) = 0`, `r(0.3) = 0.3`; on the disc `r((3, 4)) = (0.6, 0.8)` and `r` fixes the
  unit disc pointwise.
- A boundary trace that is only continuous (`θ ↦ (|sin θ|, 0)` on the disc boundary) cannot be
  fixed by any smooth filling: the collar hypothesis is necessary.
- Into a target with boundary the result fails: the face data `(y−z)²`, `(x−z)²`, `(x−y)²` of
  *Statements that must not enter the library* have a continuous filling into `[0, ∞)` and no
  smooth one.

### Examples

The half-line and the quadrant, where inward domination is explicit; the pair `(ℝ, ℝ ∖ {0})`, the
smallest relative chain computation.

### Dependencies

DifferentialGeometry 3 and 8.3; AlgebraicTopology Stages 2, 3 and 6.1; Tau Ceti relative cochains;
Mathlib partitions of unity and smooth approximation.

## Layer 3: relative de Rham theory

### 3.1 The relative complex

For `X` as in Layer 2 and an open `W ⊆ X`, extend DifferentialGeometry 6.1's de Rham complexes by
zero along `ComplexShape.embeddingUpNat` and define the relative complex as
`CochainComplex.mappingCocone` of the extended restriction. Export the coordinate isomorphism with
degree-`q` term `Ω^q(X) ⊕ Ω^(q−1)(W)` and differential `(α, β) ↦ (dα, α|_W − dβ)`: the coordinate
map to the shifted cone is `(α, β) ↦ (α, −β)`, whose shifted differential in coordinates `(α, g)` is
`(dα, −α|_W − dg)`. The connecting map is `δ[b] = −[(0, b)]`; when `b` extends to `b̃` on `X` it
equals `[(db̃, 0)]`. This is [Bott–Tu, Ch. I, §6, relative de Rham theory] for an open inclusion;
the identification with Mathlib's cocone and its signs is this roadmap's. *Needs:*
DifferentialGeometry 6.1; Mathlib `CochainComplex.mappingCocone`, `HomologicalComplex.extend`.

**Checks.**

- Degree `0`: `H⁰(X, W)` is the locally constant functions on `X` vanishing on `W`; for
  `(ℝ, ℝ ∖ {0})` it is `0`.
- `W = ∅` gives the absolute complex; `W = X` gives an acyclic complex.
- Sign witness: on `(ℝ, ℝ ∖ {0})` let `b` be `1` on `(0, ∞)` and `0` on `(−∞, 0)`. Relative
  integration of `(0, b)` over `c = [−1, 1]` is `0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0, b)]`
  evaluates to `1`, which is the singular `(δb)(c) = b(∂c) = 1`; the opposite convention
  `δ[b] = [(0, b)]` gives `−1`.

### 3.2 The cone of a surjection and relative integration

For a degreewise surjective cochain map, build the comparison from its shifted cone to its kernel:
a chain map, a quasi-isomorphism, compatible with the connecting maps including the sign (no
closed-pair or cofibration hypothesis). Apply it to smooth and continuous singular cochains, whose
restriction to `W` is surjective (extend simplex coefficients by zero). Restriction of forms to `W`
need not be surjective, so the form cone is never identified with a kernel. Relative integration is
the induced cone map; prove its evaluation formula `∫_c α − ∫_{∂c} β`, identity, composition and
naturality for smooth maps of open pairs. A closed `α` vanishing on `W` gives the relative cocycle
`(α, 0)`, sent to the cochain evaluating `α` on relative smooth chains, with absolute image
`deRhamHom [α]`. *Needs:* §3.1, §2.4; DifferentialGeometry 8.4.

**Checks.**

- On `(ℝ, ℝ ∖ {0})`, `α = ψ dx` with `ψ` supported in `(−1, 1)` and `∫ψ = 1`, `β` a primitive of
  `ψ` on `W` equal to `0` left of the support and `1` right of it: relative integration over
  `[−1, 1]` is `1 − 1 = 0`, and indeed `(α, β) = d(Ψ, 0)` for the global primitive `Ψ`.
- The cone of `id` on a complex is acyclic and its kernel is `0`.
- Restriction `Ω⁰(ℝ) → Ω⁰(ℝ ∖ {0})` is not surjective (`1/x` does not extend), so the kernel model
  is wrong for forms.

### 3.3 The relative de Rham isomorphism

Prove that relative integration induces an isomorphism `H^q(X, W) ≅ H^q(X, W; ℝ)` onto
Tau Ceti's relative singular cohomology, from DifferentialGeometry 8.5 on `X` and on `W`, §2.4's
relative comparison and the five lemma, compatible with both long exact sequences including the
sign of `δ`; compatible with enlargement of `W` and with compactly supported relative classes.
*Needs:* §§3.1–3.2; DifferentialGeometry 8.5; Tau Ceti's long exact sequence of a pair.

**Checks.**

- `H¹(ℝ, ℝ ∖ {0}) ≅ ℝ` on both sides, generated by `δ[b]` of §3.1, which evaluates to `1` on
  `[−1, 1]`.
- `H^q(X, ∅)` recovers `deRhamEquiv`.
- For `X = ℝ²`, `W = ℝ² ∖ {0}`: `H²(X, W) ≅ ℝ`, generated by `δ` of the angular form class, which
  evaluates to `2π` against the relative class of a disc around `0`; `H¹(X, W) = 0`.

### Examples

The pairs `(ℝ, ℝ ∖ {0})` and `(ℝ², ℝ² ∖ {0})`.

### Dependencies

DifferentialGeometry 6.1, 8.4 and 8.5; §2.4; Tau Ceti relative cochains.

## Layer 4: integration against fundamental classes

### 4.1 The integration comparison

On Hausdorff σ-compact finite-dimensional boundaryless manifolds `N` over any real model:

- for compact oriented `N` and every smooth top form `η`, `∫_N η = ⟨deRhamHom [η], [N]_ℝ⟩`, where
  `[N]_ℝ` is the real image of AlgebraicTopology 6.3's integral fundamental class built from its
  local tangent-orientation generators;
- for noncompact `N`, compactly supported top forms evaluated on AlgebraicTopology 6.3's
  compact-support classes in `H_n(N, N ∖ K; ℤ)`, with its `RelativeTwistedClassDatum` and
  compact-support class factory, fed by the tangent-orientation local section.

No second class carrier, orientation local system or class factory is built; this roadmap owns the
conversions between existing carriers: the constant-system and real-coefficient comparison maps,
the restricted-scalar adapter for coefficient images stored as `ℤ`-modules, the integer-to-real
local-map square, and smooth-relative-to-singular naturality. Local computation: place each compact
piece `S` of a partition inside an injective chart simplex whose boundary avoids `S`; derive the
local formula from the relative evaluation of §3.2 at `β = 0` and the one-chart integral identity;
assemble by DifferentialGeometry 5.2's finite additivity. Dimension zero: the class of a compact `K`
is `Σ_{x ∈ K} ε_o(x)[x]` and `∫ α = Σ_{x ∈ K} ε_o(x) α(x)`. Embeddings: `∫_N f^*ω = ∫_M ω` for an
orientation-preserving smooth open embedding `f` of manifolds of equal dimension over arbitrary
models, for `ω` with compact support in the range of `f`; in particular through `I.interior M → M`,
which gives the interior compact-support formula on manifolds with boundary. The statement is a
de Rham form of the fact that the fundamental class is dual to integration ([Bott–Tu, §5] for the
compact boundaryless case through Poincaré duality); the chain-level comparison with
AlgebraicTopology's classes is this roadmap's. *Needs:* Layer 3; DifferentialGeometry 2.1–2.2,
5.2, 8.4; AlgebraicTopology 6.1, 6.3.

**Checks.**

- `S¹` with the counterclockwise orientation: `∫ dθ = 2π = ⟨deRhamHom [dθ], [S¹]_ℝ⟩`; reversing the
  orientation negates both sides.
- Two points with orientations `+` and `−`: `∫ f = f(a) − f(b)`; a convention ignoring point
  orientations gives `f(a) + f(b)`.
- `ℝ` with `ψ dx`, `ψ` supported in `K = [−1, 1]`, `∫ψ = 1`: the pairing with the compact-support
  class of `K` is `1`, and enlarging `K` does not change it.

### 4.2 Smooth-boundary compatibility

For compact oriented `M` over `𝓡∂ m`, `m > 0`, let `U` be the image of a topological collar
`∂M × [0, 1) → M` (Tau Ceti's Brown collar), `α` a smooth top form on `M` and `β` a smooth
`(m−1)`-form on `U` with `α|_U = dβ`. Then `⟨ℐ[α, β], [M, U]_ℝ⟩ = ∫_M α − ∫_{∂M} j^*β`, with
§3.3's relative class `ℐ[α, β]`, AlgebraicTopology 6.3's oriented relative class transported along
`(M, ∂M) → (M, U)`, the outward-first boundary orientation and `j : ∂M → U` the smooth
factorization of the boundary inclusion (no derivative of the topological collar is used). Route:
a smooth cutoff `ρ` from `exists_contMDiffMap_one_nhds_of_subset_interior`, equal to `1` near `∂M`
and supported in a closed neighbourhood inside `U`; `γ = ρβ` extended by zero;
`[α, β] = [α − dγ, β − γ|_U]`; §4.1's interior formula for `α − dγ` and Stokes for `γ`; independence
of cutoff and collar. *Needs:* §4.1, §3.3; DifferentialGeometry 5.1, 5.3; AlgebraicTopology 6.3;
Tau Ceti `TauCeti.IsLocallyCollared.isCollared`.

**Checks.**

- On `D¹ = [−1, 1]` with `α = 0` and `β` locally constant with values `c₊`, `c₋` near `±1`, the
  pairing is `−(c₊ − c₋)`: the outward-first orientation gives `∫_{∂D¹} β = c₊ − c₋`.
- `β = 0` near `∂M` reduces to §4.1's interior formula.
- On `[0, 1]`, `α = dx`, `β = x` near both ends: `∫ α − (1 − 0) = 0`, consistent with
  `(dx, x) = d(x, 0)` being exact.

### Examples

`S¹`, the two-point manifold and `D¹`, which pin the orientation and boundary signs.

### Dependencies

Layer 3; DifferentialGeometry 2, 5 and 8.4; AlgebraicTopology 6.1 and 6.3; Tau Ceti collars.

## Layer 5: finite-parameter relative transversality

### 5.1 The incidence equation and regular parameters

For real normed spaces `E, W, V, P`, smooth `F : E × P → V` and `j : W → V`, define
`incidenceEquation F j : (E × W) × P → V`, `((x, y), p) ↦ F(x, p) − j(y)`, and
`IsRegularIncidenceParameter F j p` as `TauCeti.IsRegularParameter (incidenceEquation F j) 0 p`:
the slice at `p` is transverse to `j`. *Universal transversality* is surjectivity of the full
derivative of `incidenceEquation F j` at every zero.

- The fixed-parameter derivative of `incidenceEquation F j` at `((x, y), p)` is
  `(u, v) ↦ D_xF(x, p)u − Dj(y)v` when `F` and `j` are differentiable there.
- If `dim E + dim W < dim V`, a regular parameter's slice misses `j(W)` entirely (avoidance), and
  this holds simultaneously for countable families.
- Restriction to open subsets, affine changes of coordinates and reindexing preserve regularity;
  on a non-product open `U ⊆ M × P` and on manifolds the incidence is covered by countably many
  product chart neighbourhoods, never extended by junk values; parameter manifolds go through
  their charts; without a global Hausdorff hypothesis on the source of `j` the result is applied on
  each Hausdorff chart domain of a countable atlas.

**Checks.**

- `incidenceEquation` at `((1, 2), 3)` for `F(x, p) = x + p`, `j = id` on `ℝ` is `1 + 3 − 2 = 2`.
- `F(x, p) = x² + p` on `ℝ`, `W` a point, `j = 0`: `p = −1` is regular (zeros `±1`, derivatives
  `±2`), `p = 0` is not (derivative `0`), `p = 1` is regular (empty fibre); an always-true
  predicate fails at `0`.
- Same `F`, `W = ℝ`, `j = id`: every `p` is regular, since `(u, v) ↦ 2xu − v` is onto; a definition
  that forgets `Dj` would wrongly reject `p = 0`.

### 5.2 Generic parameters

Prove `addHaar_setOf_not_isRegularIncidenceParameter`: for finite-dimensional `E, W, V, P` and
smooth `F`, `j` with universal transversality, the parameters whose slice is not transverse form a
Haar-null set. The incidence is a smooth manifold by Tau Ceti's level-set charts; at an incidence
point the projection to `P` is regular exactly when the slice derivative is onto; apply
`TauCeti.addHaar_image_criticalPoints_eq_zero` in countably many incidence charts. Neither
properness nor closedness of `j(W)` is assumed. This refines Tau Ceti's meagre statement
`TauCeti.isMeagre_setOf_not_isRegularParameter` to a null one; the parametric transversality
theorem for embedded submanifolds is [Lee, Thm. 6.35]. *Needs:* §5.1; Tau Ceti level-set charts and
flat Sard.

**Checks.**

- `F(x, p) = x² + p`, `j = 0`: the bad set is `{0}`, Haar-null.
- `F(x, p) = x²` (no parameter dependence), `j = 0`: universal transversality fails at `(0, p)` and
  every `p` is bad, a set of full measure; the hypothesis is necessary.
- `V = 0`: every parameter is regular and the bad set is empty.

### 5.3 Relative perturbations

Define `relativeTranslate f β p = f + β • p`. For a smooth cutoff `β ≥ 0` with zero set `C` and `f`
already transverse to `j` on `C`, the family `(x, p) ↦ f(x) + β(x)p` is universally transverse: where
`β(x) > 0` the parameter derivative `β(x)·id` is onto; where `β(x) = 0`, `Dβ(x) = 0` because `x`
minimizes `β`, so the source derivative is `Df(x)` and the hypothesis applies. Prove
`exists_isRegularIncidenceParameter_relativeTranslate`: there are arbitrarily small `p` whose
translate is transverse to `j` and equals `f` on `C`. Cutoffs come from
`IsOpen.exists_contDiff_support_eq` on Euclidean sources and from a two-set partition of unity
subordinate to `{B, M ∖ C}` in general. On compact sources: simultaneous transverse perturbations
arbitrarily close in every finite `C^k` norm (bounds `sup_K ‖Dⁱ(F_p − f)‖ ≤ Bᵢ‖p‖` in a finite chart
cover), finite lists of maps, and the straight-line homotopy; compact sources with corners of
dimension `1` or `2` through their intrinsic interior and specified boundary extensions, continuous
fillings first through §2.5. The cutoff argument extends [Lee, Thm. 6.36] from embedded
submanifolds to maps. *Needs:* §§5.1–5.2, §2.5; Mathlib `IsOpen.exists_contDiff_support_eq`.

**Checks.**

- `f = 0`, `β(x) = x²`, `p = 1`: `relativeTranslate f β 1 2 = 4`, and the translate fixes `C = {0}`.
- `β = 0`, `C = E`: the hypothesis is transversality of `f` itself and `p = 0` works.
- The transversality hypothesis on `C` is necessary: for `f(x) = x²`, `β(x) = x²`, `j = 0` on `ℝ`,
  `f` is not transverse at `0 ∈ C`, and every translate `x²(1 + p)` has the zero `0` with
  derivative `0`, so no parameter is regular.

### Examples

Two curves in `ℝ³` (`dim E + dim W = 2 < 3`) are made disjoint by a generic translation; the
parabola family `x² + p` has the single bad parameter `0`.

### Dependencies

§2.5; Tau Ceti level-set charts and flat Sard; Mathlib bump functions and partitions of unity.

## Statements that must not enter the library

- **"Separately smooth face data extend to a smooth simplex into a target with boundary."** On a
  `3`-simplex into `[0, ∞)`, prescribe near the origin `(y−z)²`, `(x−z)²`, `(x−y)²` on the
  coordinate faces; with `Q = x² + y² + z² − 2xy − 2xz − 2yz` and a smooth bump `ψ` of `x + y + z`,
  zero near `0` and at least `1` near the opposite face, `max(Q + ψ, 0)` is a continuous filling
  with these faces. A smooth filling would have zero value and gradient and Hessian with diagonal
  `2` and off-diagonal `−2` at `0`, so its value along `(t, t, t)` is `−3t² + o(t²) < 0`. Hence
  face-fixing smoothing is boundaryless, and corners go through §§2.2–2.3.
- **"A semiflow of a strictly inward field is a collar."** Not for a general convex model; collars
  are GeometricTopology's.
- **"The form cone is the kernel of restriction."** Restriction of forms to an open need not be
  surjective; only the cochain cones are identified with kernels.
- **"A closed continuous form has a continuous path integral."** Continuity alone gives no
  potentials; local potentials are the hypothesis of Layer 1.
- **"Transverse parameters are dense, hence the bad set is null."** Density is Tau Ceti's meagre
  statement; nullness needs Sard on the incidence manifold (§5.2).

## Downstream consumers

- ComplexKahlerGeometry consumes §3.2's relative integration of open pairs and §4.1's compact and
  relative integration formulas (its K6), and owns the complex-coefficient comparisons and the
  normalized punctured-plane computation for continuous planar forms (its K5a).
- Roadmaps on singular-image avoidance by paths and discs in Lie groups and on arrangement jet
  families consume Layer 5 and supply their own compactness, codimension and jet-surjectivity
  inputs.

## Prior work

Yury Kudryashov's `github.com/urkud/DeRhamCohomology` for the de Rham carriers consumed from
DifferentialGeometry; cited for design, never as the definition of a target.

## References

- [Lee] John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics
  218, Springer, 2013: Prop. 2.28 (exhaustion functions), Ch. 9 (flows, collar neighbourhoods),
  Thms. 6.35–6.36 (parametric transversality).
- [Bott–Tu] Raoul Bott and Loring W. Tu, *Differential Forms in Algebraic Topology*, Graduate
  Texts in Mathematics 82, Springer, 1982: Ch. I, §5 (Poincaré duality) and §6 (relative de Rham
  theory).

## Acknowledgements

This material was first drafted inside the DifferentialGeometry roadmap by kim-em.
