# Roadmap: de Rham cohomology, the de Rham theorem, Poincaré duality and degree

## Summary

The [DifferentialGeometry](../DifferentialGeometry/README.md) roadmap builds differential forms on
manifolds, the exterior derivative, orientations, integration of top forms and Stokes' theorem.
This roadmap builds the global theory on top of them: the de Rham complex and its cohomology ring,
the Poincaré lemma, homotopy invariance, compactly supported cohomology, the Mayer–Vietoris
sequences, smooth singular chains and the de Rham theorem, the Poincaré pairing and Poincaré
duality with its comparison to singular fundamental classes, Sard's theorem on manifolds with
finite-parameter relative transversality, the Brouwer mapping degree, and the hairy ball theorem.
Mathlib has none of it; it has the flat exterior derivative, homological algebra and singular
homology, and Tau Ceti has singular cochains, relative cohomology, subdivision and small chains.

The headline theorems are the de Rham theorem (DR.3.9), Poincaré duality (DR.4.3) with the
fundamental-class integration comparison (DR.4.4), the integral formula for the degree (DR.5.4)
and the hairy ball theorem (DR.6.1). The main reference is [Lee] = John M. Lee, *Introduction to
Smooth Manifolds*, 2nd ed., GTM 218, cited with that edition's numbering; departures from its
route are marked. Suggested homes: `TauCeti/Geometry/Manifold/DeRham/` for layers 1–4,
`TauCeti/Geometry/Manifold/Degree/` for layers 5–6, and flat prerequisites under
`TauCeti/Analysis/`.

## Scope and ownership

This roadmap owns:

- the de Rham complex of smooth real forms, its cohomology `H^•_dR(M)`, the induced maps, the
  wedge product on cohomology, closed and exact forms, the relative flat Poincaré lemma and its
  manifold form, homotopy invariance, path integration of `1`-forms (on manifolds, and for
  continuous planar forms with local potentials), compactly supported forms and `H^•_c(M)`;
- the Mayer–Vietoris short exact sequences of de Rham complexes, ordinary and compactly
  supported;
- smooth singular simplices and chains, the smoothing comparison with continuous singular chains
  on every finite-dimensional real model with corners, the strictly inward vector fields and
  inward domination this comparison needs, relative approximation for vector targets, integration
  over smooth chains, Stokes for simplices and chains, the absolute and relative de Rham
  homomorphisms and isomorphisms, and the Mayer–Vietoris induction principle;
- the Poincaré pairing, top-degree cohomology, Poincaré duality for de Rham cohomology, and the
  integration comparison with AlgebraicTopology's singular fundamental classes;
- regular points and values, Sard's theorem on manifolds with its sharp finite-regularity form,
  finite-parameter relative transversality, the Brouwer degree and its calculus;
- the hairy ball theorem.

It does not own forms, the exterior derivative, orientations, the orientation double cover,
integration of top forms, densities, Stokes' theorem or the homotopy operator: those are
DifferentialGeometry's (its layers 0–2 and 5). It does not own singular chains, cochains,
relative cohomology, subdivision, small chains, universal coefficients, the cup product,
homological orientation systems or singular fundamental classes: those are
[AlgebraicTopology](../AlgebraicTopology/README.md)'s. Section *Boundaries with sibling roadmaps*
states each shared boundary.

## Conventions

DifferentialGeometry's conventions (its section *Conventions*) are in force: everything is over
`ℝ`; `I : ModelWithCorners ℝ E H` and `M` with `[ChartedSpace H M] [IsManifold I ∞ M]`; total
functions with junk values in the `mfderiv` style, real hypotheses on the theorems; orientation
is DifferentialGeometry 2.1's chart-sign data; the wedge is normalized as in DifferentialGeometry
0.1; no measurable structure is installed on a manifold. In addition:

- **Regularity.** The cohomological theory is fixed at `C^∞`: the de Rham complex has the smooth
  real forms of DifferentialGeometry 0.4 in each degree. Pointwise flat statements (DR.1.2) are
  stated at every regularity `n ≥ 1`.
- **Hypotheses carried visibly.** `[FiniteDimensional ℝ E]`, `[T2Space M]` and
  `[SigmaCompactSpace M]` are written exactly where used; they are load-bearing in layers 2–4
  (see *Statements that must not enter the library*). `[CompleteSpace F]` is written wherever a
  vector-valued form is integrated or given a primitive (DR.1.2, DR.3.7).
- **Universes.** Spaces live in `Type` wherever singular cohomology appears (layers 3–5). The
  induced map on de Rham cohomology is a `HomologicalComplex.homologyMap` between de Rham
  complexes in one category of modules, so source and target take their model space and carrier
  from the same two universes.
- **Complexes.** The de Rham complex is a `CochainComplex (ModuleCat ℝ) ℕ`, built with
  `CochainComplex.of`; cohomology is its `HomologicalComplex.homology`, with the concrete
  presentation as closed forms modulo exact forms as theorems. Relative complexes are indexed by
  `ℤ`, after extending along `ComplexShape.embeddingUpNat`.
- **Signs.** The Mayer–Vietoris map is `(res, −res)`. The relative de Rham complex of an open
  `W ⊆ X` has degree-`q` term `Ω^q(X) ⊕ Ω^(q−1)(W)` with differential
  `(α, β) ↦ (dα, α|_W − dβ)`, and connecting map `δ[b] = −[(0, b)]` (DR.3.8). The boundary of a
  smooth simplex is `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`. Boundary orientations are DifferentialGeometry 5.1's
  outward-first orientation, recomputed for Mathlib's half-space, which constrains the *first*
  coordinate where [Lee]'s constrains the last.
- **Degree.** Degree is defined for compact boundaryless sources and connected boundaryless
  targets of the same positive dimension; in dimension zero the constant map is the identity and
  is excluded from the calculus checks.

## Boundary and corners

- **Layer 1 holds over any model with corners.** Homotopy invariance uses DifferentialGeometry
  5.4's directly proved cochain-homotopy identity on `M × [0, 1]`, not Stokes on a manifold with
  corners, so `M` may have boundary.
- **The de Rham theorem holds over every finite-dimensional real model with corners.** Standard
  simplex Stokes (DR.3.7) is proved directly and does not use DifferentialGeometry 5.5's corner
  Stokes. The strict face-fixing smoothing lemma (DR.3.3) is for boundaryless targets only; the
  general case passes through the intrinsic interior by inward domination (DR.3.4–DR.3.5).
- **Poincaré duality and degree are for boundaryless manifolds.** The pairing is not defined on
  classes when there is boundary (on `[0, 1]`, `[dx] = 0` while `∫₀¹ dx = 1`). DR.4.4 separately
  compares integration with relative fundamental classes on manifolds with boundary over the
  half-space model.

## What Mathlib already has (consume)

- **Flat exterior calculus**: `extDeriv`, `extDerivWithin`, `d² = 0` and
  `extDerivWithin_pullback` in `Analysis/Calculus/DifferentialForm/`.
- **Homological algebra**: `CochainComplex`, `HomologicalComplex.homology`, `Homotopy`,
  short exact sequences of complexes and their long exact sequences
  (`CategoryTheory.ShortComplex.ShortExact`), `CochainComplex.mappingCone`,
  `CochainComplex.mappingCocone`, `HomologicalComplex.extend`, the five lemma, and the dual of a
  complex through `ChainComplex.linearYonedaObj`.
- **Singular homology**: `AlgebraicTopology/SingularHomology/`, `TopCat.toSSet` and the chain
  complex of a simplicial set.
- **Approximation, cutoffs and partitions of unity**:
  `Continuous.exists_contMDiff_approx_and_eqOn` and `Continuous.exists_contDiff_approx_and_eqOn`
  (`Geometry/Manifold/SmoothApprox.lean`), `IsOpen.exists_contDiff_support_eq`,
  `exists_contMDiffMap_one_nhds_of_subset_interior` and
  `exists_contMDiffSection_forall_mem_convex_of_local` (`Geometry/Manifold/PartitionOfUnity.lean`).
- **Interior and boundary**: `ModelWithCorners.interior`, `ModelWithCorners.boundary`,
  `ModelWithCorners.isInteriorPoint_iff_of_mem_atlas`, `BoundarylessManifold`, the half-space
  model `𝓡∂ n` and `modelWithCornersEuclideanQuadrant`.
- **Simplices, paths, spheres**: `stdSimplex`, `Path`, `SimplyConnectedSpace` and
  `SimplyConnectedSpace.paths_homotopic`, `curveIntegral`, the sphere `Metric.sphere` with its
  manifold structure.

## What Tau Ceti already has (consume)

None of it is rebuilt here.

- **Singular cochains and cohomology** (AlgebraicTopology, Stages 2, 3 and 6):
  `AlgebraicTopology/Cohomology/{Basic,HomotopyInvariance,Relative}.lean` — singular cochains,
  singular cohomology and its induced maps, homotopy invariance, the short exact cochain sequence
  of a pair and its long exact sequence.
- **Subdivision and small chains**: `AlgebraicTopology/Singular/Subdivision/` — barycentric
  subdivision with its homotopy to the identity and the small-chain homotopy equivalence for an
  open cover; Mayer–Vietoris in singular homology.
- **Flat Sard**: `Analysis/Calculus/Sard/` — the Morse–Sard theorem with regularity threshold
  `(dim source)² + 1`, and its equal-dimension form.
- **Parametric transversality and level sets**: `Analysis/Fredholm/LevelSet/` and
  `Geometry/Manifold/VectorBundle/Section/Parametric.lean` — `TauCeti.IsRegularParameter`, the
  residual theorem for regular parameters of a Fredholm equation, its local nowhere-dense form,
  regular section parameters of a bundle equation, complemented-kernel level-set charts, and the
  Fredholm property of every operator between finite-dimensional spaces.
- **Inverse function theorem** on manifolds at interior points, with its global form
  (`Geometry/Manifold/LocalDiffeomorph.lean`).
- **The boundary manifold and collars**: `Geometry/Manifold/Boundary/` — the boundary of a
  manifold over `𝓡∂ (n+1)` is a manifold with closed smooth embedding, and Brown's collar theorem
  for compact boundaries.
- **The circle**: `π₁(S¹) ≅ ℤ` (`AlgebraicTopology/UniversalCover/Circle/`) and the degree of a
  loop in the circle (`Topology/Circle/Degree.lean`).

## Suppliers

| Supplier | What is consumed | Where |
| --- | --- | --- |
| DifferentialGeometry 0.1, 0.3–0.4 | the wedge, rough and smooth forms, pullback and its chain rule | throughout |
| DifferentialGeometry 1.1–1.4 | the manifold exterior derivative, naturality, `d² = 0`, smoothness of `dω`, the Leibniz rule | layers 1–4 |
| DifferentialGeometry 2.1–2.2, 2.4 | orientations, orientation-preserving maps, the orientation double cover and its descent API | DR.4.2, layers 4–5 |
| DifferentialGeometry 3.3 | homogeneity of connected boundaryless manifolds | DR.5.4 |
| DifferentialGeometry 5.1 | the boundary interface, outward-first boundary orientation, null sets through charts | DR.4.4–DR.4.5, DR.5.2 |
| DifferentialGeometry 5.2–5.3 | integration of top forms and its additivity, Stokes' theorem | layers 3–5 |
| DifferentialGeometry 5.4 | the homotopy operator on `M × [0, 1]`; Stokes on `M × [0, 1]` for boundaryless `M` | DR.1.3, DR.5.5 |
| AlgebraicTopology Stages 2–3 | singular chains, relative chains, subdivision, small chains, excision, the no-retraction and Brouwer fixed-point theorems (Stage 2, item 7) | layer 3, DR.5.5 |
| AlgebraicTopology Stage 6 | singular cochains and cohomology, relative cochains, universal coefficients, the cup product, the cochain Mayer–Vietoris sequence, the evaluation pairing (6.1), the homological orientation system and fundamental classes (6.3) | layers 3–4 |
| UniversalCovers | `π₁(S¹) ≅ ℤ` | DR.5.5 |
| GeometricTopology | the boundary manifold, Brown's collar theorem, collar neighbourhoods | DR.4.5 |

## The build, in layers

Names in backticks are Mathlib or Tau Ceti declarations, or declarations of `Suggested.lean`,
which carries the exact hypotheses. Targets marked *Lean:* none need DifferentialGeometry's forms,
orientations or integration, which are not yet in Tau Ceti; they are specified here in prose.

### Layer 1: the de Rham complex and cohomology

*[Lee, Ch. 17].*

- **DR.1.1 The complex and the ring.** The exterior derivative as a linear map between the
  smooth real forms of consecutive degrees, with square zero; the de Rham complex, a
  `CochainComplex (ModuleCat ℝ) ℕ`; de Rham cohomology `H^k_dR(M)` as its homology. The concrete
  presentation: the submodules of closed forms (the kernel of `d`) and exact forms (zero in degree
  zero, the range of `d` otherwise), exact ⊆ closed, and the class map from closed forms, which is
  linear and surjective with kernel the exact forms. Closed and exact *rough* forms as predicates,
  for vector coefficients. Functoriality: pullback along a smooth map as a linear map on smooth
  forms, preserving closed forms, the induced map on cohomology with its value on classes, and the
  identity and composition laws, as unbundled lemmas (no category of manifolds). The wedge of
  closed forms is closed and descends to cohomology, making `H^•_dR(M)` a graded-commutative
  `ℝ`-algebra and `H^•_c(M)` a module over it. *Lean:* none.
- **DR.1.2 Degree zero and the Poincaré lemma.** `H⁰_dR(M) ≅ LocallyConstant M ℝ`. The *relative*
  flat Poincaré lemma on star-convex sets with unique differentiability, for `extDerivWithin`, at
  every regularity `n ≥ 1` (⚠ boundary-chart images are not ambient-open). Its manifold form
  [Lee, Thm. 17.14]: every point `x` has an open neighbourhood `U` and a smooth form `ψ` on the
  open submanifold `U` with `dψ = φ|_U`. The primitive lives on `U`, not on `M`: no Hausdorff
  hypothesis is in scope, and on a non-Hausdorff manifold a local primitive need not extend. Both
  for a complete coefficient space. *Lean:* `exists_extDerivWithin_eq_of_starConvex` (the flat
  lemma); the manifold form none.
- **DR.1.3 Homotopy invariance and path integration.** Smoothly homotopic maps
  `M × [0, 1] → M'` (with `M × [0, 1]` over `I.prod (𝓡∂ 1)`) induce equal maps on cohomology, from
  DifferentialGeometry 5.4, with no boundaryless restriction; `H^(k+1)_dR(E) = 0` for a normed
  space `E`. The integral of a `1`-form along a smooth path by pullback to the interval, and the
  exactness criterion [Lee, Thm. 17.17]: on connected `M`, a closed smooth `1`-form whose integral
  over every smooth loop at a base point vanishes is exact; hence `H¹_dR(M) = 0` for simply
  connected, locally path-connected `M`. *Lean:* none.

  *Continuous planar forms.* On an open `Ω ⊆ ℂ`, let `F` be a complete normed real space (complex
  spaces by restriction of scalars) and represent a continuous `1`-form by its covector field
  `ω : C(Ω, ℂ →L[ℝ] F)`, identified with DifferentialGeometry's degree-one flat forms and with the
  field consumed by `curveIntegral`; no further form carrier is introduced. *Local potentials*
  means: for every `z ∈ Ω` there are `r > 0` with `ball(z, r) ⊆ Ω` and an ambient `g : ℂ → F`,
  `C¹` on the ball, with derivative `ω(w)` at every `w` in it. A closed `C¹` form has local
  potentials by the disc Poincaré lemma. For a continuous `γ : Path a b` in `Ω`, define `∫_γ ω`
  by a subdivision into subpaths lying in potential discs, as the sum of endpoint differences of
  the potentials; prove independence of the discs, potentials and subdivision; additivity under
  concatenation and sign reversal under reversal; invariance under homotopy rel endpoints, by
  subdividing the homotopy square into cells inside potential discs and cancelling edge
  increments (no derivative of the path and no Stokes); agreement with `curveIntegral` for `C¹`
  paths; naturality under `C¹` maps of plane domains, by composing potentials. On path-connected
  `Ω`, if every loop integral vanishes then integrating from a base point gives a global `C¹`
  potential, and conversely. On simply connected `Ω` the hypothesis follows from homotopy
  invariance and `SimplyConnectedSpace.paths_homotopic`; on arbitrary open `Ω` apply this on each
  component (the empty domain takes the zero potential). *Lean:* `HasLocalPotentials`,
  `exists_hasFDerivAt_of_simplyConnected`.
- **DR.1.4 Compact supports.** Compactly supported smooth forms (compact topological support),
  the compactly supported de Rham complex and `H^•_c(M)`; the two functorialities of opposite
  variance: extension by zero along an open inclusion (⚠ on Hausdorff `M`) and pullback along
  proper smooth maps (⚠ nothing for a general smooth map); `H^•_c(ℝⁿ)` in all degrees
  [Lee, Lemma 17.27, Thm. 17.28]. *Checks:* `H^k_dR(ℝⁿ)`; `[dθ] ≠ 0` in `H¹_dR(S¹)`.
  *Lean:* none.

### Layer 2: Mayer–Vietoris

*[Lee, Ch. 17].*

- **DR.2.1 The Mayer–Vietoris sequence.** For opens `U, V` with `U ∪ V = M`, on Hausdorff
  σ-compact finite-dimensional `M` (partitions of unity), the short exact sequence of de Rham
  complexes `0 → Ω(M) → Ω(U) ⊕ Ω(V) → Ω(U ∩ V) → 0` with maps `ω ↦ (ω|_U, ω|_V)` and
  `(α, β) ↦ α|_{U∩V} − β|_{U∩V}`; the long exact sequence is Mathlib's, with the connecting map's
  partition-of-unity description [Lee, Cor. 17.42] and naturality. *Lean:* none.
- **DR.2.2 Compact supports.** The compactly supported sequence
  `0 → Ω_c(U ∩ V) → Ω_c(U) ⊕ Ω_c(V) → Ω_c(M) → 0`, arrows given by extension by zero, on
  Hausdorff `M`, with its long exact sequence and naturality. *Checks:* `H^k_dR(Sⁿ)` from the
  two-cap cover [Lee, Thm. 17.21]: `ℝ` in degrees `0` and `n`, zero otherwise. *Lean:* none.

### Layer 3: the de Rham theorem

*[Lee, Ch. 18]. [Lee]'s route — smooth chains and a Mayer–Vietoris induction — not the sheaf
route. Singular (co)homology is AlgebraicTopology's; this layer builds smooth chains, integration
over them and the comparison with de Rham cohomology on those carriers, and never a second
singular theory.*

- **DR.3.1 Singular cohomology, consumed.** Tau Ceti's singular cochain complex and singular
  cohomology with real coefficients, their induced maps, homotopy invariance, and the short exact
  cochain sequence of a pair with its long exact sequence. Universal coefficients (the evaluation
  `H^k(X; ℝ) → Hom(H_k(X; ℝ), ℝ)` and its bijectivity over a field), the cup product, and the
  cochain Mayer–Vietoris sequence of a binary open cover are AlgebraicTopology Stage 6 targets,
  consumed here.
- **DR.3.2 Subdivision and small chains, consumed.** Tau Ceti's barycentric subdivision and its
  homotopy to the identity, the small-chain quasi-isomorphism for an open cover
  [Lee, Thm. 18.4, 18.6], and Mayer–Vietoris in singular homology. Nothing is built here.
- **DR.3.3 Smooth simplices and boundaryless smoothing.** The full-dimensional standard simplex
  `Δᵖ = {x ∈ ℝᵖ | xᵢ ≥ 0, Σ xᵢ ≤ 1}` (⚠ Mathlib's barycentric `stdSimplex` lies in a hyperplane
  and is the wrong integration domain; the two are related by an explicit affine
  identification), its face maps `δᵢ`, and smoothness on a subset in [Lee]'s local sense: near
  every point, the map agrees with a smooth map on an ambient neighbourhood (⚠ local
  extendability is the definition; a single extension to a neighbourhood of the whole simplex is
  not assumed and fails for manifold targets). Smooth singular simplices are closed under the face
  and degeneracy operators and form a sub-simplicial set of `TopCat.toSSet.obj M`; the smooth
  chain complex is its native chain complex with alternating face signs, defined on any charted
  space, with the inclusion into real singular chains. Pushforward of smooth simplices and chains
  along smooth maps, with identity, composition, face and boundary laws; the inclusion sends a
  smooth simplex to the singular simplex obtained by composing with the affine identification of
  `Δᵖ` with `stdSimplex`, naturally in smooth maps; smooth simplices of an open submanifold are
  the ambient smooth simplices with image in it, compatibly with all these maps.

  For a finite-dimensional Hausdorff σ-compact smooth boundaryless target: compatible local smooth
  extensions of face data in charts, by inclusion–exclusion over vertex-adapted coordinate
  projections mapping the simplex to its faces, with agreement on overlaps; relative Whitney
  approximation then gives the *relative smoothing lemma* — a continuous simplex whose faces are
  smooth is homotopic rel boundary to a smooth one; by induction on faces, the smoothing chain map
  and both chain homotopies [Lee, Thm. 18.7]. ⚠ The strict face-fixing lemma needs the
  boundaryless hypothesis (see *Statements that must not enter the library*). *Lean:* none.
- **DR.3.4 Inward fields and inward domination.** For every finite-dimensional Hausdorff
  σ-compact real smooth manifold with corners: with `C = range I` (convex, closed, with nonempty
  interior), the *strict inward cone* at `x ∈ C` consists of the `v` with `ε, δ > 0` such that
  `ball(x + tv, εt) ⊆ C` for `0 < t < δ`. Prove it convex, closed under positive scaling,
  containing `q − x` for interior `q`, open over `C` with uniform `ε, δ` near each point, and
  invariant under `C¹` chart changes. Glue local fields by
  `exists_contMDiffSection_forall_mem_convex_of_local` to a smooth strictly inward field `X`.
  Construct its forward semiflow: local existence, uniqueness and joint smoothness within `C`
  (Picard iteration on paths constrained to `closedBall(x + tX(x), εt/2)`, convex mean-value and
  Grönwall estimates, higher smoothness from the variational system on `C × L(E, E)`), positive
  time interior entry and its persistence, maximal forward times with the forward escape lemma,
  and global forward existence after rescaling by a proper exhaustion `f` so that `|Xf| ≤ 1/2`.
  The intrinsic interior `N = I.interior M` is open, a boundaryless manifold over the same model,
  second countable and σ-compact. With `j : N → M` the inclusion and `r = Φ(1, ·)`, the homotopy
  `H(t, x) = Φ((1 − t)², x)` on `ℝ × M` is smooth, `H 0 = j ∘ r`, `H 1 = id`, it preserves `N`
  and restricts to `r ∘ j ~ id_N`. This *inward domination* data is the target. ⚠ A semiflow is
  not a collar for a general convex model; collars remain GeometricTopology's. *Lean:* none.
- **DR.3.5 The smooth chain equivalence on every model with corners.**
  - *Smooth prisms and transfer.* Chain homotopies on smooth chains from jointly smooth
    homotopies `ℝ × M → M`. For smooth `j : N → M`, `r : M → N` with `N` boundaryless and a
    specified smooth homotopy `j ∘ r ~ id_M`, the composite of `r` on singular chains, the
    smoothing of `N`, and `j` on smooth chains is a homotopy inverse of the inclusion for `M`;
    prove both inverse identities from pushforward naturality, the smooth prism, and on
    continuous chains the native chain homotopy of a homotopy restricted to `[0, 1]`. No homotopy
    `r ∘ j ~ id_N` is needed.
  - *Every model.* Apply the transfer to DR.3.4's inward domination: the inclusion of smooth
    chains is a chain homotopy equivalence for every finite-dimensional Hausdorff σ-compact real
    smooth manifold over any real model with corners. The general lemma that two homotopy
    inverses of one map are homotopic (`s ~ s ≫ i ≫ t ~ t`) compares inward choices and gives
    naturality on homology and cohomology.
  - *Relative chains.* For an open submanifold `W` with the same hypotheses (σ-compactness of an
    open of a finite-dimensional σ-compact manifold is a lemma), the quotient
    `C^∞(X, W) = C^∞(X)/C^∞(W)` with its short exact sequence and boundary formula, its map to
    AlgebraicTopology's relative singular chains, a quasi-isomorphism by the five lemma from the
    two absolute comparisons; over `ℝ`, the relative comparison and its homotopy inverse from
    degreewise cycle and boundary splittings, compatibly with the dual map; the dual relative
    cochain quasi-isomorphism against Tau Ceti's cochain sequence of a pair; naturality in smooth
    maps of pairs, relative boundary maps and enlargement of `W`. An inward deformation need not
    preserve every open at once, which is why opens are handled through the absolute
    constructions.
  - *Checks.* On the half-line `𝓡∂ 1`, the quadrant `modelWithCornersEuclideanQuadrant 2` and the
    square `[0, 1]²` over `(𝓡∂ 1).prod (𝓡∂ 1)`: the comparison, and `H₀ ≅ ℝ` by total
    coefficient, with every point cycle mapping to `1`; in degree zero the de Rham isomorphism
    sends the class of the constant `1` to the singular class evaluating to `1` on every point.
    *Lean:* none.
- **DR.3.6 Relative approximation for vector targets.** Source a finite-dimensional Hausdorff
  σ-compact smooth manifold with corners, target a finite-dimensional real normed space `V`.
  Consume `Continuous.exists_contMDiff_approx_and_eqOn` with its fixed closed set and smooth
  neighbourhood. For the interval, closed disc and square, construct ambient smooth fillings: the
  continuous retractions `r(t) = max(0, min(1, t))`, `r(s, t) = (r(s), r(t))` and
  `r(v) = v / max(1, ‖v‖)` extend a continuous filling to the ambient space (continuity, range and
  identity on the domain; no smoothness claimed). Boundary data must admit a specified compatible
  smooth collar extension (sitting intervals at endpoints; compatible edge extensions, constant
  near vertices, on the square; the radial collar on the disc), glued by a smooth cutoff with its
  overlap equations. If the filling agrees with the extension only on the boundary, blend in a
  thin collar chosen by continuity and compactness, ambiently as well, so that the result is
  smooth near a smaller closed collar, changes arbitrarily little in `C⁰` and fixes the boundary;
  then apply `Continuous.exists_contDiff_approx_and_eqOn` with that collar fixed and a positive
  continuous error function. Export the smooth filling, the straight-line homotopy rel boundary,
  and its comparison with the original. A compact image reserve in an open `U ⊆ V` is preserved by
  a quantitative `C⁰` tolerance from finitely many balls. Restriction, collar refinement,
  coordinate change and finite-product laws. ⚠ A merely continuous boundary trace cannot be fixed
  by smooth approximation, and this vector-target result does not give strict smooth face
  extensions into a target with boundary. It uses no smooth-chain equivalence, Stokes or degree.
  *Lean:* none.
- **DR.3.7 Simplices, Stokes for chains, the de Rham homomorphism.** Integration of smooth forms
  (vector-valued in complete spaces) over smooth simplices and chains; Stokes for the standard
  simplex, proved directly and independently of DifferentialGeometry 5.5, and for chains
  [Lee, Thm. 18.12]; the zero-simplex evaluation (the integral of a `0`-form over a smooth
  `0`-simplex is its value at the point). Smooth cochains as the `ChainComplex.linearYonedaObj`
  dual of smooth chains; the restriction `res` from continuous to smooth cochains, natural in smooth maps and a
  quasi-isomorphism under DR.3.5's hypotheses; the integration cochain map `∫` from the de Rham
  complex, whose evaluation on a chain is the chain integral. The de Rham homomorphism `ℐ` into
  real singular cohomology is characterized by `H(res) ∘ ℐ = H(∫)`, which determines it since
  `H(res)` is invertible. Evaluation on a pushed-forward chain equals evaluation of the pulled-back
  form, giving the strict naturality square for `∫` (including open inclusions), with the
  de Rham complex map of a smooth map on top and the dual smooth chain map on the bottom; the
  induced map on cohomology agrees with DR.1.1's. `ℐ` is natural and compatible with connecting
  maps [Lee, Prop. 18.13], under these hypotheses on source and target. *Lean:* none.
- **DR.3.8 Relative de Rham theory.** For `X` as above and an open `W` with the same hypotheses:
  extend the de Rham complexes by zero along `ComplexShape.embeddingUpNat` and define the relative
  complex as `CochainComplex.mappingCocone` of the extended restriction, i.e. its mapping cone
  shifted by `−1`. Export the coordinate isomorphism with degree-`q` term
  `Ω^q(X) ⊕ Ω^(q−1)(W)` and differential `(α, β) ↦ (dα, α|_W − dβ)`: the coordinate map to the
  shifted cone is `(α, β) ↦ (α, −β)`, whose shifted differential in coordinates `(α, g)` is
  `(dα, −α|_W − dg)`; pin degree zero. The connecting map is `δ[b] = −[(0, b)]`; when `b` extends to
  `b̃` on `X` it equals `[(db̃, 0)]` (arbitrary forms on `W` need not extend). Build the algebraic
  comparison from the shifted cone of a degreewise surjective cochain map to its kernel (chain
  map, quasi-isomorphism, connecting-map sign; no closed-pair or cofibration hypothesis), and
  apply it to smooth and continuous singular cochains, which restrict surjectively (extend simplex
  coefficients by zero). ⚠ Restriction of forms to `W` need not be surjective; do not identify the
  form cone with a kernel. Relative integration as the induced cone map; the relative de Rham
  homomorphism `ℐ`, its evaluation formula, identity, composition and naturality for smooth maps of
  open pairs; a closed `α` vanishing on `W` gives the relative cocycle `(α, 0)`, sent to the
  cochain evaluating `α` on relative smooth chains, with absolute image `ℐ[α]`; compatibility with
  enlargement of `W` and with compactly supported relative classes; the relative de Rham
  isomorphism from DR.3.5's relative comparison and DR.3.9 on `X` and `W`, compatible with both
  long exact sequences including the sign of `δ`. *Lean:* none.
- **DR.3.9 The de Rham theorem.** `ℐ` is an isomorphism `H^k_dR(M) ≅ H^k(M; ℝ)` for every
  Hausdorff σ-compact smooth manifold over a finite-dimensional real model with corners
  [Lee, Thm. 18.14]. The boundaryless case by the reusable **Mayer–Vietoris induction
  principle**, run over convex opens of `ℝⁿ` and then over charts (never through geodesic
  convexity), consuming layer 2 and the cochain Mayer–Vietoris sequence of DR.3.1; ⚠ its
  hypotheses include countable disjoint unions, because cohomology does not commute with
  increasing unions. The general case by transfer along DR.3.4's inward maps, homotopy invariance
  DR.1.3 (adapting `H : ℝ × M → M` by `(x, t) ↦ H(t, x)` on `M × [0, 1]`) and DR.3.7's square,
  with agreement and naturality. Multiplicativity: `ℐ` carries the wedge to AlgebraicTopology
  Stage 6's cup product, so the isomorphism is one of graded algebras; no cup product is defined
  here. *Checks:* the loop `t ↦ exp(2πit)` is a smooth cycle with `∫ dθ = 2π` over it, and
  `ℐ[dθ] ≠ 0`. *Lean:* `mayerVietoris_induction` (the principle); the isomorphism none.

### Layer 4: Poincaré duality

*[Lee, Problems 18-6 to 18-8]; [Bott–Tu, §5].*

- **DR.4.1 The pairing.** `⟨[ω], [η]⟩ = ∫_M ω ∧ η` on `H^k_dR(M) × H^(n−k)_c(M)`, defined on
  Hausdorff σ-compact oriented boundaryless `M`: ⚠ Stokes on boundaryless `M` is what makes it
  well defined on classes. *Lean:* none.
- **DR.4.2 Top cohomology.** `H^n_c(M) ≅ ℝ` by integration for connected oriented `M`;
  `H^n_c(M) = 0` for connected nonorientable `M`, and `H^n_dR(M) = 0` if also compact, by descent
  along the orientation double cover (DifferentialGeometry 2.4) [Lee, Thm. 17.34]. *Lean:* none.
- **DR.4.3 Duality.** `H^k_dR(M) ≅ (H^(n−k)_c(M))*` through the pairing, for Hausdorff σ-compact
  oriented boundaryless `M`, compact or not, by the induction principle of DR.3.9 from the base
  cases DR.1.2 and DR.1.4; not through Hodge theory. Corollaries: finite-dimensionality of
  `H^k_dR(M)` for compact `M` (the nonorientable case through the orientation cover) and
  nondegeneracy of the pairing. *Checks:* `|⟨[dθ], [1]⟩| = 2π` on `S¹`. *Lean:* none.
- **DR.4.4 Integration against fundamental classes.** On finite-dimensional Hausdorff σ-compact
  smooth boundaryless manifolds `N` over every finite-dimensional real model with corners, with
  DR.3.5's hypotheses:
  - for compact oriented `N` and every smooth top form `η`, `∫_N η = ⟨ℐ[η], [N]_ℝ⟩`, where `[N]_ℝ`
    is the real image of AlgebraicTopology 6.3's integral fundamental class built from its local
    tangent-orientation generators;
  - for noncompact `N`, compactly supported top forms evaluated on AlgebraicTopology 6.3's
    compact-support classes in `H_n(N, N ∖ K; ℤ)`, with AlgebraicTopology 6.3's relative twisted
    class datum and compact-support class factory as carrier and factory, fed by the
    tangent-orientation local section. This roadmap adds no second homology class carrier,
    orientation local system or class factory; it owns the conversions between existing
    carriers: the constant-system and real-coefficient comparison maps, the restricted-scalar
    adapter through which coefficient images stored as `ℤ`-modules must pass, its local
    naturality, the integer-to-real local-map square, and smooth-relative-to-singular naturality.
  - *Local computation.* Place each compact piece `S` of a partition strictly inside the interior
    of an injective chart simplex whose boundary avoids `S`; derive the local formula from the
    relative de Rham evaluation at `β = 0` (the chain integral of the zero form vanishes) and the
    one-chart integral identity, and assemble by finite additivity of integration
    (DifferentialGeometry 5.2). The support-enlargement map `(M, M ∖ K) → (M, M ∖ S)` for `S ⊆ K`
    carries the global class to the local one; Kronecker naturality along `(M, W) → (M, M ∖ S)`
    and linearity in the form are lemmas of the construction.
  - *Dimension zero.* The class for compact `K` is `Σ_{x ∈ K} ε_o(x)[x]` with
    AlgebraicTopology 6.3's orientation sign, and `∫_M α = Σ_{x ∈ supp α} ε_o(x) α(x)` for a
    compactly supported `0`-form; Haar measure on `EuclideanSpace ℝ (Fin 0)` is the unit point
    mass; negative point orientations through the orientation-negation law, never through a
    negatively oriented empty basis.
  - *Embeddings.* `∫_N f^*ω = ∫_M ω` for an orientation-preserving smooth open embedding
    `f : N → M` between manifolds of the same dimension over arbitrary finite-dimensional real
    models, for `ω` with compact support in the range of `f`; in particular through the interior
    inclusion `I.interior M → M`, giving the interior compact-support class formula on `M` even
    when `M` has boundary. Naturality for general smooth maps only with explicit pair and support
    hypotheses; integral invariance for orientation-preserving diffeomorphisms. *Lean:* none.
- **DR.4.5 Smooth-boundary compatibility.** For compact oriented `M` over `𝓡∂ m`, `m > 0`, let
  `U` be the image of a topological collar `∂M × [0, 1) → M` (Brown's collar, from Tau Ceti), `α`
  a smooth top form on `M` and `β` a smooth `(m−1)`-form on `U` with `α|_U = dβ`. Then
  `⟨ℐ[α, β], [M, U]_ℝ⟩ = ∫_M α − ∫_{∂M} j^*β`, with DR.3.8's relative class, AlgebraicTopology
  6.3's oriented relative class transported along `(M, ∂M) → (M, U)`, the outward-first boundary
  orientation, and `j : ∂M → U` the smooth factorization of the boundary inclusion (no derivative
  of the topological collar is used). Proof: a smooth cutoff `ρ`
  (`exists_contMDiffMap_one_nhds_of_subset_interior`) equal to `1` near `∂M` and supported in a
  closed neighbourhood inside `U`; `γ = ρβ` extended by zero; `[α, β] = [α − dγ, β − γ|_U]`; the
  interior formula of DR.4.4 for `α − dγ` and Stokes for `γ`; independence of cutoff and collar.
  *Checks:* on the closed unit ball `D¹` with `α = 0` and `β` locally constant with values `c₊`,
  `c₋` near `±1`, the pairing is `−(c₊ − c₋)`. *Lean:* none.

### Layer 5: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"; Ch. 6].*

- **DR.5.1 Regular points and values.** A point is regular when `mfderiv` is surjective there; a
  value is regular when every point of its fibre is regular. Restriction and chart formulas use
  only differentiability. Where the derivative is a continuous linear equivalence, Tau Ceti's
  inverse function theorem applies, its interior-point premise discharged on a boundaryless
  source; ⚠ surjectivity in unequal dimensions is not a local diffeomorphism. *Lean:*
  `IsRegularPoint`, `IsRegularValue`.
- **DR.5.2 Sard.** Critical values of a smooth map from a boundaryless finite-dimensional source
  are null in DifferentialGeometry 5.1's sense, so regular values are dense: localize on countably
  many chart domains and apply Tau Ceti's flat theorem at its threshold `(dim source)² + 1`,
  without extending a coordinate map outside its open domain; null sets of a positive-dimensional
  target have empty interior, and in target dimension zero there are no critical values. The
  **sharp** finite-regularity theorem for boundaryless sources, first on open sets of Euclidean
  spaces and then through charts: for positive target dimension, `C^k` with
  `k > max(dim source − dim target, 0)` suffices [Hirsch, Ch. 3, Thm. 1.3]; [Federer, 3.4.3];
  Azagra–Ferrera–Gómez-Gil, *The Morse–Sard theorem revisited*,
  [arXiv:1511.05822](https://arxiv.org/abs/1511.05822), Thm. 1.1 and §§2–4; the lower-dimensional
  source cases by the elementary local measure argument. *Lean:* `dense_isRegularValue`,
  `addHaar_image_criticalPoints_eq_zero_of_contDiffOn`.
- **DR.5.3 Finite-parameter relative transversality.** Built from calculus, DR.3.6, level-set
  charts and Sard; no degree or de Rham input.
  - *Equation.* For finite-dimensional real normed spaces `P`, `V`, a Hausdorff second-countable
    boundaryless finite-dimensional manifold `M`, an open `U ⊆ M × P`, smooth `F : U → V`, and smooth
    `j : N → V` with `N` likewise: the incidence `{(x, p, y) | (x, p) ∈ U, F(x, p) = j(y)}`; the
    slice at `p` is transverse when `(u, v) ↦ d_xF(x, p)u − dj(y)v` is onto at every equality, and
    universal transversality is surjectivity in `(x, p, y)`. The equation `F − j`, its derivative,
    zero set and projection to `P`, with restriction and chart laws; submanifold incidence
    conditions through normal charts.
  - *Generic parameters.* Consume `TauCeti.IsRegularParameter`, the regular-section-parameter
    theorem and their residual forms; every finite-dimensional operator is Fredholm and `C^∞`
    meets the regularity bound. On a non-product open `U`, cover the actual incidence by countably
    many product neighbourhoods and use the local nowhere-dense bad-parameter theorem there; never
    extend the equation by a junk value. Countable lists of maps intersect residual sets, each map
    with its own dimension. The incidence carries a level-set atlas; at an incidence point the
    projection to `P` is regular exactly when the slice derivative is onto; hence, by Sard on
    countably many incidence charts, the bad parameters are Haar-null. Neither properness nor
    closedness of the image of `j` is assumed. Without a global Hausdorff hypothesis on `N`, apply
    the result on each Hausdorff chart domain of a countable atlas; parameter manifolds through
    their charts.
  - *Relative perturbations.* For a source with a closed collar region `C` on which `f` is
    already transverse to every `j`, inside a specified open buffer `B` of already-good data: a
    smooth cutoff `0 ≤ β ≤ 1` with `C ⊆ {β = 0} ⊆ B` (by `IsOpen.exists_contDiff_support_eq` in
    Euclidean sources, by a two-set partition of unity subordinate to `{B, M ∖ C}` in general) and
    the family `f(x) + β(x)p`, smooth, fixing `C`, with parameter derivative `β(x)·id` and source
    derivative `df(x) + dβ(x)(·)p`; universal transversality follows (`dβ = 0` at interior zeros
    by nonnegativity, `β` locally zero near the boundary). Simultaneous transverse perturbations
    arbitrarily close in every finite `C^k` norm on a compact source (bounds
    `sup_K ‖Dⁱ(F_p − f)‖ ≤ Bᵢ‖p‖` in a finite chart cover), with collar refinement, finite lists,
    reindexing, coordinate and affine transport, and the relative straight-line homotopy. Compact
    sources with corners of dimension `1` or `2` through their intrinsic interior and specified
    ambient boundary extensions; continuous fillings first through DR.3.6.
  - *Avoidance and configuration domains.* If `dim M + dim N < dim V`, a transverse slice misses
    `j(N)`, simultaneously for countable families. The same result on specified open
    configuration domains (two distinct points, equal-time submanifolds), the consumer supplying
    the jet-evaluation surjectivity. Constant maps, empty lists, `dim V = 0` and empty incidence are
    checks.
  *Lean:* `incidenceEquation`, `IsRegularIncidenceParameter`, `relativeTranslate`,
  `addHaar_setOf_not_isRegularIncidenceParameter`,
  `isRegularIncidenceParameter_avoids_of_finrank_lt`,
  `exists_isRegularIncidenceParameter_relativeTranslate` (the flat case: source and `j` defined on
  vector spaces, `U` the whole product).
- **DR.5.4 The degree.** Over a regular value of a map from a compact manifold to one of the same
  dimension the fibre is finite. The degree at a specified regular value: the sum over the fibre
  of `+1` at orientation-preserving and `−1` at orientation-reversing points (DifferentialGeometry
  2.2), junk `0` on an infinite fibre. For compact oriented boundaryless `M`, connected oriented
  boundaryless `N` of the same positive dimension and smooth `f`: [Lee, Thm. 17.35]
  `∫_M f^*ω = deg · ∫_N ω`, via Stokes and the homogeneity of DifferentialGeometry 3.3, hence
  independence of the regular value, the degree `deg f`, and its identification with the action of
  `f^*` on `H^n_dR ≅ ℝ`. *Lean:* `finite_preimage_of_isRegularValue`; the degree none.
- **DR.5.5 Degree calculus.** Smooth homotopy invariance (Stokes on `M × [0, 1]`,
  DifferentialGeometry 5.4), `deg id = 1`, `deg const = 0`, multiplicativity under composition,
  surjectivity of maps of nonzero degree, `deg antipodal = (−1)^(n+1)` on `Sⁿ`; the continuous
  extension of the degree for sphere targets and, through DR.3.5, general targets. A smooth sphere
  self-map with a continuous extension to the disc has degree zero; with `deg id = 1` this is
  identified with AlgebraicTopology's no-retraction theorem and Brouwer fixed-point theorem,
  which have that single topological owner. On `S¹`, a smooth self-map acts on `π₁(S¹) ≅ ℤ` as
  multiplication by its degree. *Checks* (dimension `≥ 1`): `deg id = 1`, `deg const = 0`,
  `deg (z ↦ zⁿ) = n`, `deg antipodal = (−1)^(n+1)`. *Lean:* none.

### Layer 6: the hairy ball theorem

*[Lee, Problem 16-6], by the degree route.*

- **DR.6.1** Every continuous tangent field on an even-dimensional sphere vanishes somewhere, by
  smooth approximation, the great-circle homotopy to the antipodal map and
  `(−1)^(n+1) ≠ 1`. *Lean:* `exists_eq_zero_of_inner_eq_zero`.
- **DR.6.2** The section form, bridged by `mfderiv`-composition (⚠ not through the non-canonical
  identification of the sphere's tangent spaces with orthogonal complements), the explicit
  nonvanishing field on odd spheres, and the dichotomy; not through Euler characteristics.
  *Lean:* `exists_eq_zero_of_continuous_section`, `exists_nonvanishing_tangent_field_iff`.

## Statements that must not enter the library

- **"The de Rham comparison holds for every manifold."** The line with two origins has
  `H¹_dR = 0` and singular `H¹ ≅ ℝ`; `[T2Space M] [SigmaCompactSpace M]` are load-bearing in
  layers 2–4.
- **"`H^•_c` is functorial for all smooth maps."** Only for proper maps and open inclusions;
  `ℝ → pt` already fails on `H⁰_c`.
- **"Extension by zero exists on every manifold."** On the line with two origins a bump near one
  origin extends discontinuously.
- **"A closed form with values in a normed space is locally exact."** A smooth `c₀₀`-valued
  `1`-form on `ℝ` has no local primitive; the coefficients must be complete.
- **"A local primitive of a closed form extends to the whole manifold."** Glue two copies of `ℝ`
  by translations along disjoint intervals of radius much smaller than their spacing, centred at
  `a_mn = 2^(−2^m (2n+1))` in the first copy and at `2^(−m) + 2^(−m−n−2)` in the second
  (`m, n ≥ 1`). The result is a second-countable boundaryless non-Hausdorff `1`-manifold with the
  closed form `dx = dy`; every continuous `f` has `f(0_B) = f(2^(−m)_B)` for all `m`, so
  `f'(0_B) = 0` where differentiable, while `dy ≠ 0` at `0_B`.
- **"The Poincaré pairing is defined on manifolds with boundary."** On `[0, 1]`, `[dx] = 0` in
  `H¹_dR`, yet `∫₀¹ dx = 1`.
- **"Smooth and continuous chains are homotopy equivalent on every charted space."** On `ℝ` with
  preferred charts `φ_a(y) = cuberoot(y − a)`, smooth paths are constant, so smooth `H₀`
  distinguishes every point while singular `H₀ = ℝ`. The equivalence needs smooth chart
  compatibility and DR.3.5's hypotheses.
- **"A smooth simplex extends smoothly to a neighbourhood of the whole simplex."** Local
  extensions into a manifold cannot be patched in the target; local extendability is the
  definition (DR.3.3).
- **"Separately smooth face data always extend to a smooth simplex into a target with
  boundary."** On a `3`-simplex into `[0, ∞)`, prescribe near the origin `(y−z)²`, `(x−z)²`,
  `(x−y)²` on the coordinate faces; with `Q = x² + y² + z² − 2xy − 2xz − 2yz` and a smooth bump `ψ`
  of `x + y + z`, zero near `0` and at least `1` near the opposite face, `max(Q + ψ, 0)` is a
  continuous filling with these smooth faces. A smooth filling would have zero value and gradient
  and Hessian with diagonal `2` and off-diagonal `−2` at `0`, so its value along `(t, t, t)` is
  `−3t² + o(t²) < 0`. Hence DR.3.3's strict lemma is boundaryless, and corners go through DR.3.4.
- **"Degree is defined for noncompact domains."** The inclusion `(0, ∞) ↪ ℝ` has sign sum `1`
  over `y > 0` and `0` over `y < 0`.
- **"Mathlib's `stdSimplex` is the integration domain."** It lies in a hyperplane of `ℝ^(p+1)`;
  integrate over the full-dimensional `Δᵖ ⊆ ℝᵖ`.

## Boundaries with sibling roadmaps

One owner per shared construction.

- **DifferentialGeometry** owns forms, the exterior derivative and its Cartan calculus,
  orientations and the orientation double cover, flows, integration of top forms and densities,
  Stokes' theorem (half-space and corners), the homotopy operator and null sets through charts.
  This roadmap consumes them (see *Suppliers*) and owns everything cohomological built on them,
  the smooth singular chain theory, inward fields and inward domination, Sard and transversality
  on manifolds, and degree.
- **AlgebraicTopology** owns singular chains and cochains, relative theory, subdivision, small
  chains, excision and Mayer–Vietoris (Stages 2–3), the no-retraction and Brouwer fixed-point
  theorems (Stage 2, item 7), universal coefficients, cup and cap products, singular Poincaré
  duality, the homological orientation system, its point generators, chosen local section,
  relative twisted classes and compact-support class factory (Stage 6, in particular 6.3). This
  roadmap builds smooth chains, integration over them and the de Rham comparison (layer 3), and
  owns the smooth/constant-system/real-coefficient conversions and the integration comparison
  DR.4.4–DR.4.5, consuming AlgebraicTopology 6.1's evaluation pairing and relative cochains and
  6.3's classes, not its singular duality (6.5) or its degree comparison. AlgebraicTopology 6.5
  compares its homological degree with DR.5's smooth degree; that comparison is downstream of both.
- **UniversalCovers** owns `π₁(S¹) ≅ ℤ`, consumed in DR.5.5.
- **GeometricTopology** owns the boundary manifold, collars and collar uniqueness, tubular
  neighbourhoods and gluing; DR.4.5 consumes Brown's collar. A semiflow from DR.3.4 is not a
  collar.
- **ComplexKahlerGeometry** consumes the relative de Rham maps of DR.3.8 and the compact and
  relative integration formulas of DR.4.4 (its K6), and owns the complex-coefficient comparisons
  and the normalized punctured-plane computation for continuous planar forms (its K5a).
- **HeegaardFloer** consumes orientations and degree, and consumes DR.5.2's sharp
  finite-dimensional Sard theorem; its Lane F0 owns the Fredholm Sard–Smale extension.
- **DG and `A∞`** owns the generic DGA packaging; the wedge product on de Rham cohomology is built
  here, the cup product by AlgebraicTopology.
- Applications of DR.5.3 to singular-image avoidance by paths and discs in Lie groups and to
  arrangement jet families and finite-event movies of root systems belong to those subjects'
  roadmaps, which supply their own compactness, codimension and jet-surjectivity inputs.

## Ordering

Layer 1 needs DifferentialGeometry 0–1 (DR.1.3 also 5.4); layer 2 needs layer 1 and partitions
of unity. In layer 3, DR.3.3 (boundaryless smoothing), DR.3.4 (inward fields) and DR.3.6 (vector
approximation) are independent of one another and of layers 1–2; DR.3.5 needs DR.3.3–DR.3.4;
DR.3.7 needs layer 1, DR.3.5 and DifferentialGeometry 5.2; the absolute DR.3.9 needs layer 2 and
DR.3.7; the relative isomorphism of DR.3.8 follows DR.3.9 on both opens, and the absolute proof
never consumes it. Layer 4 needs layer 3 and DifferentialGeometry 5.2–5.3; DR.4.4 additionally
consumes AlgebraicTopology 6.3, whose orientation construction follows DifferentialGeometry 2 and
5.1, and its boundaryless and interior formulas precede DR.4.5. DR.5.1–DR.5.3 need only calculus,
DR.3.6 and Sard and can start at once; DR.5.4–DR.5.5 need DifferentialGeometry 2 and 5, layer 2
and DR.4.2; layer 6 needs DR.5.5. Start DR.3.3, DR.3.4 and DR.5.2 early. Claim single numbered
items or smaller; the headline theorems DR.3.9, DR.4.3, DR.4.4, DR.5.4 and DR.6.1 are staged
claims whose intermediate results land separately.

## Prior work

Cited for design and migration, never as the definition of a target; coordinate with the authors
and confirm licences before porting. Yury Kudryashov's `github.com/urkud/DeRhamCohomology` for
layer 1; Brendan Seamas Murphy's Lean 3 Brouwer fixed-point theorem through singular homology,
for layer 3 and DR.5.5.

## References

- [Lee] John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics
  218, Springer, 2013: Ch. 6 (Sard), Ch. 17 (de Rham cohomology, degree), Ch. 18 (the de Rham
  theorem), Problems 16-6, 18-6 to 18-8.
- [Bott–Tu] Raoul Bott and Loring W. Tu, *Differential Forms in Algebraic Topology*, Graduate
  Texts in Mathematics 82, Springer, 1982: §§1–2 (de Rham and compactly supported cohomology,
  Mayer–Vietoris), §5 (Poincaré duality by the Mayer–Vietoris argument).
- [Hirsch] Morris W. Hirsch, *Differential Topology*, Graduate Texts in Mathematics 33, Springer,
  1976: Ch. 3, Thm. 1.3, p. 69.
- [Federer] Herbert Federer, *Geometric Measure Theory*, Springer, 1969: 3.4.3.
- D. Azagra, J. Ferrera and J. Gómez-Gil, *The Morse–Sard theorem revisited*,
  [arXiv:1511.05822](https://arxiv.org/abs/1511.05822).

## Acknowledgements

This material was first drafted inside the DifferentialGeometry roadmap by kim-em. Its design
draws on Lean community discussions: [Poincaré lemma][t8] (Sam Lindauer, Yury Kudryashov) and
[Completed proof of the Brouwer fixed point theorem][t13] (Brendan Seamas Murphy).

[t8]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Poincar.C3.A9.20lemma.html
[t13]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Completed.20proof.20of.20the.20Brouwer.20Fixed.20Point.20Theorem.html
