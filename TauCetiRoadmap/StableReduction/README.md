# Roadmap: stable reduction of curves and stable maps

The eventual application is the **properness of the moduli space of stable maps**. This
roadmap builds two prerequisites: the stable-reduction theory of curves over a discrete
valuation ring and the scheme-level theory of stable maps. Its summit includes existence
and uniqueness of a stable curve model after finite base extension, first for smooth curves
of genus at least two and then for stable pointed curves in the full stable range. It also
defines families of stable maps to a target scheme and develops their basic geometric API,
using projective polarized targets for degree, positivity, openness, and stabilization. It does
**not** construct a moduli functor, stack, or coarse moduli space, and it does
not yet claim that such an object is proper.

The proof route is the scheme-theoretic Artin–Winters/Deligne–Mumford route organized in
the [Stacks Project, *Semistable Reduction*](https://stacks.math.columbia.edu/tag/0C2P)
and [*Moduli of Curves*, §109.24](https://stacks.math.columbia.edu/tag/0E8C): build regular
models and their numerical types, use sufficiently much prime-to-residue-characteristic
Picard torsion to force a reduced nodal special fibre, and contract unstable components.
This is preferable here to proving the theorem through GIT and a pre-existing proper moduli
stack: Mathlib and Tau Ceti have neither the required GIT nor moduli-stack infrastructure,
while the chosen route splits into reusable scheme, curve, surface, divisor, and Picard
theory.

Suggested home: `TauCeti/AlgebraicGeometry/Curves/`, with the model and reduction theory
under `TauCeti/AlgebraicGeometry/Curves/StableReduction/` and the map-specific definitions
under `TauCeti/AlgebraicGeometry/Curves/StableMaps/`. General-purpose blowups, intersection
theory, relative `Proj`, coherent cohomology, and duality belong in the corresponding shared
`TauCeti/AlgebraicGeometry/` directories rather than under either specialized namespace.

## The end goals

Let `R` be a discrete valuation ring with fraction field `K`, with no completeness,
Henselian, algebraic-closure, or perfect-residue-field hypothesis.

1. **Classical stable reduction.** If `C/K` is a smooth, projective, geometrically connected
   curve of genus `g ≥ 2`, there are a finite separable extension `K'/K`, a maximal ideal
   `m'` of the integral closure `R̃` of `R` in `K'` above the maximal ideal of `R`, and a
   stable family `X → Spec(R̃_{m'})` of genus `g`, together with an isomorphism from its
   generic fibre to `C_{K'}`.
2. **Uniqueness.** Over a fixed DVR, two stable models with an identified generic fibre are
   related by a unique isomorphism extending that identification. This is uniqueness in a
   groupoid, not literal equality of schemes or of chosen pullbacks.
3. **Pointed stable reduction.** For an ordered family `p : Fin n → C(K)` of pairwise
   distinct `K`-rational points on a smooth projective geometrically connected curve, with
   `2g - 2 + n > 0`, the same conclusion holds after a finite separable extension, with a
   stable `n`-pointed family and extensions of all markings. The corresponding theorem for
   an already-stable pointed nodal generic fibre also uses a finite separable extension.
4. **Stable maps as geometric objects.** For an arbitrary target `V → S`, define a family
   of `n`-pointed genus-`g` stable maps as a pointed prestable curve `C → S`, a morphism
   `F : C → V` over `S`, and the fibrewise stability condition. Prove the component
   criterion for components contracted by `F`. For separated locally finitely presented
   targets, characterize stability by finiteness of the abstract automorphism group of each
   geometric fibre. Under componentwise generic separability, also prove vanishing of
   infinitesimal automorphisms. Require a projective target with a chosen relatively ample
   invertible sheaf for degree, positivity, openness of stability, and the family-level
   stabilization construction. Keep that polarization separate from the underlying
   stable-map data.
5. **A usable stable-map API.** Develop base change, isomorphisms, automorphisms, evaluation
   maps, polarization degree, decorated dual graphs, constant maps, reindexing and forgetting
   markings, gluing, and map-aware stabilization. These are constructions on individual
   objects and families, not the construction of their moduli space.
6. **A valuative interface.** Package existence after finite DVR extension and uniqueness
   over a fixed DVR in a form that a future moduli-stack development can consume. Do not
   call this `IsProper`: Mathlib's `AlgebraicGeometry.ValuativeCriterion` concerns morphisms
   of schemes, whereas the moduli object here is eventually a stack.

The mathematical shape of the two summits is:

```lean
-- Suggested shape once the prerequisite vocabulary exists; this is not present-day Lean.
-- theorem exists_stableReduction
--     (R K : Type*) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
--     [Field K] [Algebra R K] [IsFractionRing R K]
--     (g : ℕ)
--     (C : Scheme) (toK : C ⟶ Spec K)
--     [SmoothOfRelativeDimension 1 toK] [IsProjective toK]
--     [GeometricallyConnected toK]
--     (hg : arithmeticGenus toK = g) (hg2 : 2 ≤ g) :
--   ∃ (K' R' : Type*) ..., StableFamily ... ∧ genericFiber ... ≅ baseChange C K'

-- Suggested stable-map data once pointed prestable curves exist; this is not present-day Lean.
-- structure PrestableMap (target : V ⟶ S) (n : ℕ) where
--   curve : PointedPrestableFamily S n
--   map : curve.total ⟶ V
--   map_over : map ≫ target = curve.toBase
-- def IsStableMap (F : PrestableMap target n) : Prop := ...
```

Do not freeze this spelling before the curve-family, projective-morphism, and DVR-extension
APIs exist. The definitive targets are the mathematical statements above, not this comment.

## Base convention

Definitions that make sense for arbitrary schemes should remain base-general. The coherent
pushforward, semicontinuity, cohomology-and-base-change, relative duality, and representability
results in this roadmap are developed over a locally Noetherian base, with all morphism
finiteness assumptions stated explicitly. Extending these results to arbitrary bases through
pseudo-coherent or perfect complexes and Noetherian approximation is outside this roadmap.
Unless a theorem proves more, its base-change statement quantifies over morphisms between
locally Noetherian bases. Every theorem outside this convention must state its exact base
hypotheses.

## Standing conventions

- **Schemes first.** Work with morphisms of Mathlib's `Scheme`. Algebraic spaces and stacks
  are downstream consumers, not foundations for the proof. Definitions should nevertheless
  be morphism properties, stable under base change and invariant under isomorphism, so they
  can later be transported to spaces.
- **No bundled mega-object.** `FamilyOfCurves f`, `AtWorstNodalOfRelativeDimensionOne f`,
  `PrestableFamily f`, `SemistableFamily f`, `StableFamily f`, and exact genus are separate
  predicates. A marked family packages the sections and their equations with `f`, but does
  not silently bundle projectivity, a DVR base, or a chosen polarization.
- **Geometric fibres govern stability.** Connectedness, nodes, irreducible components, and
  the componentwise stability inequalities are tested after residue-field extension to an
  algebraic closure. Prove descent and invariance; do not define stability using only the
  visible components over a non-algebraically-closed residue field.
- **Terminology follows the Stacks Project.** A scheme-level family of curves is proper,
  flat, finitely presented, and of relative dimension at most one. A **prestable** family
  is an at-worst-nodal relative curve of pure relative dimension one with geometrically
  connected fibres. A `SemistableFamily` has geometric fibres of arithmetic genus at least
  one and no rational tails. A `StableFamily` has geometric fibres of arithmetic genus at
  least two and no rational tails or rational bridges. Exact genus remains a separate
  predicate. Record the corresponding global-generation and ampleness characterizations.
  The Chapter 55 reduction predicate instead says that some proper model is at worst nodal;
  call it `HasNodalReduction`, especially in genus zero, and never use `semistable` as an
  unpinned synonym for `nodal`.
- **Geometric dual graphs and stability use normalization data.** In these contexts, the
  genus of a component `E` means the genus of its normalization `Ẽ`. Its special flags
  are the markings on `Ẽ` together with the points of `Ẽ` above nodes of the whole curve.
  A self-node contributes two flags. In a dual graph, valence is the number of incident
  half-edges, so a loop
  contributes two. Numerical types instead use component arithmetic genera over constant
  fields, as specified in Layer 6.
- **Marked stability is logarithmic.** Markings are pairwise disjoint sections through the
  smooth locus. An `n`-pointed prestable curve is stable when
  `ω_{X/S}(s₁ + ⋯ + sₙ)` is relatively ample; equivalently, its restriction to every
  geometric irreducible component has positive degree, calculated using the special flags
  above. This is the convention needed in genus zero and one.
- **Stable-map stability is map-dependent.** A stable map has a pointed prestable source,
  not necessarily a stable pointed source. On every geometric fibre, only components on
  which the map is constant must have positive log-canonical degree. For separated locally
  finitely presented targets, prove equivalence with finiteness of each geometric fibre's
  abstract automorphism group.
  Representability of relative Isom and Aut is outside this roadmap. In
  positive characteristic, generic separability of `F|_E` onto its image for every
  noncontracted geometric component implies vanishing of infinitesimal automorphisms;
  without it, claim only finiteness. A downstream representing automorphism scheme is then
  unramified under the generic-separability hypothesis.
- **Polarizations are structure for degree, not hidden data.** The core stable-map structure
  records a target morphism and a map over the base. A chosen relatively ample invertible
  sheaf `L` on a projective target supplies component degrees, a numerical total degree, and
  the positivity criterion using
  `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)`. Prove that the stability predicate is independent of the
  chosen ample polarization.
- **Genus means arithmetic genus.** For a proper geometrically connected curve over a field,
  `g = dim H¹(X, 𝒪_X)`. In a family, genus `g` means that `R¹f_*𝒪_X` is locally free of
  rank `g`, with the fibrewise and Euler-characteristic formulations proved equivalent.
  Never use the sum of the genera of the normalizations: the first Betti number of the dual
  graph also contributes.
- **A model carries its generic-fibre identification.** A model of `C/K` over `R` includes
  a flat finitely presented morphism `X → Spec R` and an explicit isomorphism in
  `Over (Spec K)` from the base change `X ×_{Spec R} Spec K` to `C`. Properness is a
  separate predicate on models. Morphisms form a category and must commute with the
  generic-fibre isomorphisms; model isomorphisms are categorical isomorphisms. This prevents
  uniqueness statements from forgetting which birational map is being extended.
- **DVR extensions are local data.** For finite `K'/K`, the integral closure of `R` can have
  several maximal ideals. Choose one above the closed point and localize. Do not pretend the
  integral closure itself is always a DVR, and do not choose an extension of the valuation
  without recording it. A `FiniteDVRExtension R K` packages the field extension, integral
  closure, chosen maximal ideal and localization, fraction-field identification, and
  domination data. Its algebra structures, localization equivalence, and embeddings into the
  extension field must form the stated scalar towers and commuting squares; common refinement
  includes compatible embeddings into a third package.
- **Universal constructions commute canonically.** Base change of chosen pullbacks,
  relative `Proj`, stabilization, and forgetting markings commute up to specified canonical
  isomorphisms, not literal equality. State universal properties that make these
  isomorphisms unique and prove the coherence needed for iterated base change or repeated
  forgetting.
- **All characteristics.** Prime-to-residue-characteristic torsion is chosen inside the
  proof. Characteristic zero, perfect residue fields, and semistable reduction of the
  Jacobian may yield later corollaries, but are not hypotheses of the main theorem.

## Inventory: what Mathlib and Tau Ceti already give us

This inventory was checked on 2026-08-26 against Tau Ceti commit
`e8af08d0aeda4012832880bd56edfc88af061691` and the Mathlib commit pinned by that Tau Ceti
checkout and this roadmap repository, `05ae0103f49b1ad1248f6039bbbad43d8aeb52a9`.

### Consume from Mathlib

- **Schemes, pullbacks, and fibres:** `Mathlib/AlgebraicGeometry/{Scheme,Pullbacks,Fiber}.lean`;
  in particular `Scheme.Hom.fiber`, the morphism to `Spec κ(s)`, and compatibility of
  fibres with pullback.
- **Scheme modules and smooth loci:** `AlgebraicGeometry/Modules/{Presheaf,Sheaf,Tilde}.lean`
  supplies the scheme-module sheaf framework and affine presentation/tilde API;
  `SheafOfModules.IsQuasicoherent` and `SheafOfModules.IsFinitePresentation` are defined in
  `Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean`. Also,
  `Scheme.Hom.smoothLocus` in `Morphisms/Smooth.lean` supplies the open smooth locus used
  for markings. Extend these APIs with the operations needed below rather than defining new
  quasi-coherence or finite-presentation predicates.
- **Morphism properties:** `Proper`, `Flat`, `LocallyOfFinitePresentation`, `Smooth`,
  `SmoothOfRelativeDimension`, `Separated`, `Finite`, `Etale`, `ClosedImmersion`, and their
  base-change/descent API under `Mathlib/AlgebraicGeometry/Morphisms/`.
- **Geometric predicates:** geometrically connected, reduced, irreducible, and integral
  morphisms under `Mathlib/AlgebraicGeometry/Geometrically/`.
- **Valuative criterion:** `AlgebraicGeometry.ValuativeCommSq`,
  `ValuativeCriterion.Existence`, `ValuativeCriterion.Uniqueness`, and
  `IsProper.eq_valuativeCriterion` in `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean`.
  The file explicitly leaves reduction from arbitrary valuation rings to DVRs over a
  Noetherian base as future work; build that connection rather than assuming it.
- **Valuation and DVR algebra:** `ValuationRing`, `IsDiscreteValuationRing`, fraction rings,
  localization, integral closure in a finite extension, and the fact that the integral
  closure of a Dedekind domain in a finite separable extension is Dedekind, under
  `Mathlib/RingTheory/{Valuation,DedekindDomain,Localization}/`.
- **Normalization and properness ingredients:** relative normalization and Zariski's main
  theorem; ideal sheaves and closed subschemes; `Proj` of a graded ring and its properness.
  These are ingredients, not a blowup, relative `Proj`, ample-line-bundle, or general
  projective-morphism API.
- **Abstract cohomology:** sheaf cohomology on a site and Čech/Mayer–Vietoris machinery.
  This is not yet coherent cohomology of schemes, cohomology and base change, or duality.

### Consume and coordinate with Tau Ceti

- The [Jacobian challenge](../JacobianChallenge/README.md) owns the shared foundations of
  invertible sheaves, divisors, the Picard group, coherent cohomology, Riemann–Roch, Serre
  duality, relative coherent cohomology, and base change. Current Tau Ceti already contains
  the beginning of this lane: scheme-level invertible sheaves, rational points and residue
  degrees, and a substantial Weil-divisor/degree/Abel–Jacobi API. Stable reduction consumes
  and extends those shared foundations; it must not create a second Picard or divisor theory.
- The supplier contracts below fix the shared mathematical interfaces. Each row is a
  milestone, not a claim that the indicated files or theorems already exist. File paths are
  relative to `TauCeti/AlgebraicGeometry/`; existing Mathlib APIs take precedence over the
  suggested filenames. Implement missing contracts in these shared Tau Ceti files, under
  the supplying roadmap, rather than duplicating them inside `StableReduction/`.

| Contract and supplier | Required output | Shared file ownership |
| --- | --- | --- |
| J-A1: Jacobian Layer A, invertible sheaves and Picard group | Extend `TauCeti.AlgebraicGeometry.InvertibleSheaf X`: tensor, dual, integer powers, pullback with composition/base-change coherence; `Pic X` is its group of isomorphism classes, and pullback is a group homomorphism. | `LineBundle/Basic.lean` (existing), `LineBundle/{Tensor,Pullback,Picard}.lean` (Jacobian). |
| J-A2: Jacobian Layer A, degree and divisor comparison | For a proper pure one-dimensional scheme over a field, `deg L = χ(L) - χ(𝒪)` in `ℤ`, additive under tensor product and invariant under field extension. On a regular proper curve, `deg 𝒪(D) = Σ nₓ[κ(x):k]`, agreeing with `SchemeWeilDivisor.relativeDegree`. On nodal curves, degree is the sum of degrees on normalized geometric components. | `LineBundle/Degree.lean`, `WeilDivisor/Scheme/LineBundle.lean` (Jacobian); the nodal normalization comparison is supplied by this roadmap's Layer 2 in `Curves/NormalizationDegree.lean`. |
| J-B: Jacobian Layer B, coherent curve cohomology and Riemann–Roch | Extend `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, not a second cohomology theory: field-module structure, finite-dimensionality for coherent sheaves on proper curves, vanishing in degrees above one, Euler characteristic, and `χ(L) = deg L + 1 - g` for smooth projective geometrically connected curves. Define `g = dim H¹(𝒪)` once and export the normalization exact-sequence maps. | `Cohomology/{Basic,Proper,Curves}.lean` (Jacobian); `Curves/Normalization.lean` (this roadmap, using that cohomology API). |
| J-C: Jacobian Layer C, relative cohomology and base change | For proper finitely presented `f : X → S`, locally Noetherian `S`, and coherent `S`-flat `M`, construct coherent `Rⁱf_*M`, the base-change maps, their surjectivity/local-freeness criteria, and semicontinuity. In relative dimension one, fibrewise `H¹(M_s) = 0` implies locally free `f_*M` with arbitrary base change. Export projection formula and Leray comparison maps used by contractions. | `Cohomology/{Pushforward,BaseChange,Semicontinuity,ProjectionFormula}.lean` (Jacobian). |
| J-B / SR-2: Jacobian Layer B duality and this roadmap's Layer 2 relative duality | One dualizing-sheaf interface: for proper flat finitely presented Gorenstein curves over a locally Noetherian base, an invertible `ω`, trace/duality, and coherent arbitrary-base-change isomorphisms. Jacobian's smooth-curve Serre duality is its restriction, with `deg ω = 2g - 2`; this roadmap proves the nodal component-degree formula. | `Duality/RelativeCurves.lean` (this roadmap), `Duality/Curves.lean` (Jacobian, importing the shared relative construction); no independent smooth `ω`. |
| J-D: Jacobian Layer D, Picard functor and `Pic⁰` | For smooth projective geometrically connected `C/k`, the fppf sheafification of `T ↦ Pic(C_T)/Pic(T)` and its fibrewise degree-zero subfunctor; representation by `Pic⁰_{C/k}`, compatible with field extension. With `p ∈ C(k)`, identify its `k`-points with degree-zero line bundles via rigidification at `p`. | `Picard/{Functor,Representability,IdentityComponent,Rigidification}.lean` (Jacobian). |
| J-E: Jacobian Layer E, abelian varieties and multiplication isogenies | `Pic⁰_{C/k}` is an abelian variety of dimension `g`. For prime `ℓ ≠ char(k)`, `[ℓ]` is finite étale of degree `ℓ^(2g)` and its geometric kernel is `(ℤ/ℓℤ)^(2g)`. Export the finite étale kernel and its Galois action; this is not supplied by representability in Layer D alone. | `AbelianVariety/{Basic,Multiplication,Torsion}.lean` and `Picard/AbelianVariety.lean` (Jacobian). |

The curve-specific finite-separable splitting extension, rational-point choice, degree
bound, and comparison with line bundles on DVR models are Layer 6 outputs in
`Curves/StableReduction/PicardTorsion.lean`. They consume J-D and J-E; they do not require
the Abel–Jacobi universal property of Jacobian Layer F. The import direction is shared
sheaf/cohomology/duality files → Picard and abelian-variety files → stable reduction;
none of the shared files imports `Curves/StableReduction/` or `Curves/StableMaps/`.

### Work already in motion

The audit found no Tau Ceti issue, pull request, or public Lean project intention for general
stable reduction, stable curves, nodal families, or stable maps. Two dormant open Mathlib
pull requests develop coordinate-level singular Weierstrass cubics
([#25071](https://github.com/leanprover-community/mathlib4/pull/25071), last updated
2025-07-05) and rational points on nodal cubics
([#25069](https://github.com/leanprover-community/mathlib4/pull/25069), last updated
2025-09-14). If they resume and land, use them for elliptic examples; they are not a general
scheme-theoretic node or family-of-nodal-curves API.

Active Mathlib work is much closer to Layer 2's foundations: pullback of quasi-coherent
sheaves [#39989](https://github.com/leanprover-community/mathlib4/pull/39989), locally free
sheaves on affines [#40831](https://github.com/leanprover-community/mathlib4/pull/40831),
locally free sheaves on `Spec R`
[#40194](https://github.com/leanprover-community/mathlib4/pull/40194), and affine-scheme
vanishing [#36345](https://github.com/leanprover-community/mathlib4/pull/36345). The first three
remain open, and the fourth remains a draft; coordinate with them and refactor onto any results
that land rather than duplicate them. The [elliptic-curves roadmap](../EllipticCurves/README.md)
deliberately leaves the geometric interpretation of its `ReductionSymbol` to this roadmap;
Layer 5 supplies the missing comparison with minimal regular models and Kodaira fibre geometry.
Recheck open Mathlib work and Lean Zulip before each major foundation below, especially blowups,
coherent cohomology, and duality.

## Inventory: what is missing

There is presently no scheme-level API for families of curves, relative dimension at most
one, the operations on quasi-coherent finitely presented modules needed for Fitting ideals,
the sheaf `Ω_{X/S}`, syntomic morphisms, nodal singularities or the relative singular locus,
arithmetic genus in families, relative dualizing sheaves, ampleness/projective morphisms,
prestable/semistable/stable curves, marked curves, stable maps, blowups or contractions,
intersection theory on arithmetic surfaces, regular/minimal models, numerical types, or
semistable/stable reduction.
The summit cannot be reached by filling one isolated `sorry`; every item below is part of
its dependency graph.

---

## The build, in layers

The layers give dependency order. Within a layer, put general-purpose material in Mathlib-
compatible namespaces and prove the expected base-change, localization, and isomorphism API
before the named milestone.

### Layer 0: relative curves and extensions of DVRs

- Use the existing `SheafOfModules.IsQuasicoherent` and
  `SheafOfModules.IsFinitePresentation` predicates and affine presentation/tilde API. Add only
  the missing operations needed to construct sheaves of differentials, Fitting ideals,
  conductors, and normalization exact sequences, coordinating pullback compatibility with
  Mathlib [#39989](https://github.com/leanprover-community/mathlib4/pull/39989). The full
  proper-cohomology theory remains in Layer 2, but these prerequisites precede the nodal layer.
- For a locally finite type morphism, define relative dimension `≤ d` and pure relative
  dimension `d` fibrewise via Krull dimension. Prove invariance under isomorphism, locality,
  arbitrary-base-change stability, and the composition bound `≤ d + e` for composable
  locally finite type morphisms of relative dimensions `≤ d` and `≤ e`.
- Define the scheme-level `FamilyOfCurves f` predicate: `f` is proper, flat, finitely
  presented, and of relative dimension `≤ 1`. Prove its base-change and isomorphism API.
  Keep geometric connectedness and exact genus separate.
- Develop generic and special fibres over a DVR, including the open immersion of the generic
  fibre, the closed immersion of the special fibre, and compatibility with scalar extension.
  Use base change along `Spec K → Spec R` as the canonical generic fibre of a model. Prove
  its explicit comparison with `Scheme.Hom.fiber` at the generic point using
  `κ(η) ≅ K` from `IsFractionRing R K`; do not leave downstream statements to transport
  across an unstated isomorphism.
- Define the `FiniteDVRExtension R K` package described above. Develop finite and separable
  towers and common-refinement lemmas in which two packages embed compatibly into a third.
- Define flat finitely presented models, their morphisms, the category instance, categorical
  model isomorphisms, base-change functors, and the separate properness predicate.

### Layer 1: nodes, normalization, and dual graphs

- Develop Kähler differentials and Fitting ideals far enough to form the relative singular
  closed subscheme `Sing(f)`. Build syntomic morphisms (flat, locally finitely presented
  local complete intersections) and their relative-dimension API. Define
  `AtWorstNodalOfRelativeDimensionOne f` by the scheme-theoretic criterion: syntomic of
  relative dimension one and `Sing(f) → S` unramified. Prove the equivalent fibrewise
  condition: flat and locally finitely presented, with pure one-dimensional fibres having
  at worst nodes.
- Prove the local normal form. At a node of a fibre the completed local ring is
  `κ̄[[x,y]]/(xy)`. More precisely, for a point `x` of the special fibre over a DVR `R`,
  construct an étale extension of DVRs `R ⊂ R'`, an étale neighborhood `U → X` containing
  a point above `x`, and an étale morphism
  `U → Spec(R'[u,v]/(uv))` or `U → Spec(R'[u,v]/(uv - πⁿ))`, where `π` is a uniformizer
  of `R'`, such that both triangles to `Spec R' → Spec R` commute. This `R'/R` is étale
  local-chart data, not the later finite, possibly ramified stable-reduction extension. Prove
  that smooth relative curves are nodal, and that nodality is stable under base change and
  local for the étale topology.
- Prove that the singular locus of a proper nodal curve over a field is finite étale and that
  its branch scheme is finite étale of degree two over it. After one finite separable field
  extension, split and label every node, branch, and geometric component, recording the
  pairing involution. Develop normalization, the conductor, and the normalization exact
  sequence for `𝒪_X`.
- Build the finite, nonempty, connected **dual graph** of a proper geometric nodal curve:
  vertices are irreducible components of the normalization and edges are nodes, with loops
  allowed. Record component genera and special flags, define valence by incident half-edges
  so loops count twice, and prove graph connectedness and the formula
  `pₐ(X) = Σ_v g_v + b₁(Γ_X)`.
- Define rational tails and rational bridges geometrically and prove their invariance under
  field extension. A rational component is unstable in the current pointed curve exactly
  when its log-canonical degree is nonpositive. After a contraction, recompute flags and
  degrees: stabilization is iterative, not a test of initial component degrees.

### Layer 2: coherent curve theory, duality, and positivity

Use contracts J-A1, J-A2, J-B, J-C, and J-B / SR-2 above. The nodal/Gorenstein relative
dualizing sheaf and its componentwise degree formula belong to this roadmap in the shared
files specified there; Jacobian's smooth duality imports that same construction.

- Over locally Noetherian bases, build coherent sheaves of modules, coherent pushforward
  under proper morphisms, `Rⁱf_*`, finite-dimensionality over a proper curve, vanishing
  above degree one, the full cohomology-and-base-change theorem, Grauert's theorem, and
  upper semicontinuity. Derive the specialized `R¹f_*𝒪_X` results for proper flat nodal
  families of relative dimension one.
- Define arithmetic genus and prove the normalization/dual-graph formula, invariance in a
  proper flat family, and the locally-free-rank description of genus `g`. Arithmetic genus
  is locally constant on the base; `HasGenus f g` requires `R¹f_*𝒪_X` to be locally free of
  constant rank `g`, with base change identifying its fibres with `H¹(X_s̄, 𝒪)`.
- Build the relative dualizing complex/sheaf for proper flat finitely presented relative
  Cohen–Macaulay curves. For Gorenstein fibres, prove that `ω_{X/S}` is invertible and that
  its formation commutes with arbitrary base change up to canonical isomorphism. Construct
  the nodal case cheaply as the relative dualizing sheaf of a syntomic morphism through a
  smooth embedding, as in Stacks tag 0E6N. Nodal curves are Gorenstein, and on smooth fibres
  this construction agrees with the Jacobian roadmap's `ω_{X/k}`.
- Prove the componentwise degree formula on a geometric nodal fibre:
  `deg(ω_X|_E) = 2g(Ẽ) - 2 + #(branches on Ẽ above nodes of X lying on E)`, where `Ẽ`
  is the normalization of `E`; the count includes all such branches, so a self-node of `E`
  contributes two. With markings, add the number of markings on `E`.
- Extend Tau Ceti's invertible-sheaf API with tensor powers, Cartier divisors, pullback,
  degree on components, global generation, and relative ampleness. Build projective
  morphisms and relative `Proj` of a finitely generated graded quasi-coherent algebra;
  connect affine-base cases to Mathlib's `Proj`. Given a chosen closed immersion
  `C ↪ ℙ^N_K`, construct a proper model by scheme-theoretic closure in `ℙ^N_R`.
- Prove that a section through the relative smooth locus is an effective Cartier divisor,
  that a sum of pairwise-disjoint such sections is an effective Cartier divisor, and that
  both constructions commute with arbitrary base change up to canonical isomorphism.
- Prove the ampleness criterion for an invertible sheaf on a proper curve by positive degree
  on every geometric irreducible component. Do not assert a degree-only global-generation
  criterion for arbitrary invertible sheaves; instead prove the explicit degree bounds and
  the global-generation theorems for `ω^{⊗m}` and `ω(Σsᵢ)^{⊗m}` used below.
- Prove that the locus where an invertible sheaf on a proper finitely presented family is
  fibrewise ample is open, and identify it with the locus of relative ampleness. This is
  the openness input for pointed stability and polarized stable maps; it requires no Isom
  or Aut representability.
- Build effective étale descent for schemes equipped with a compatible relatively ample
  invertible sheaf: descend the graded quasi-coherent section algebra and recover the scheme
  by relative `Proj`. Include descent of morphisms, sections, multiplication, and the
  polarization, with cocycle and base-change coherence. Do not use effectiveness of arbitrary
  scheme descent without a polarization or invoke a moduli stack.
- Prove contraction descent: if `c : X → Y` is a proper surjective `S`-morphism with
  `𝒪_Y ≅ c_*𝒪_X` universally, then every `S`-morphism `X → V` to a separated `S`-scheme
  that is constant on every geometric fibre of `c` factors uniquely through `Y`. Prove this
  using the quotient topology and the structure-sheaf isomorphism, compatibly with base
  change. Apply it to contractions with geometrically connected genus-zero fibres below.

### Layer 3: prestable, semistable, stable, and pointed curves

- Define prestable families as proper, at-worst-nodal relative curves of pure dimension one
  with geometrically connected fibres. Prove equivalence with universal
  `f_*𝒪_X = 𝒪_S`, and develop restriction, pullback, and fibre APIs.
- Define `SemistableFamily` and `StableFamily` with the genus bounds in the conventions
  above. Prove that semistability is equivalent to the absence of rational tails and to
  fibrewise global generation of `ω^{⊗m}` for `m ≥ 2`, and that stability is equivalent to
  the absence of rational tails and bridges and to relative ampleness of `ω`.
- Define an `n`-pointed prestable family using sections `s : Fin n → (S ⟶ X)` with
  `s i ≫ f = 𝟙 S`, pairwise-disjoint images, and images in the smooth locus. Define
  stability by relative ampleness of `ω(Σsᵢ)` and prove the equivalent positive-degree
  criterion on every geometric component using normalization genus and special flags, plus
  the numerical non-emptiness condition `2g - 2 + n > 0`.
- Prove stability is invariant under isomorphism, stable under arbitrary base change, and
  open on the base in a prestable family.
- Develop isomorphisms and automorphisms of (pointed) families as ordinary groups. Prove a
  stable geometric fibre has a finite abstract automorphism group and no infinitesimal
  automorphisms. Representable relative Isom and Aut objects are outside this roadmap.
- Develop the shared scheme pushout for identifying smooth sections, and expose two
  clutching constructors. For **external clutching**, take two pointed prestable families
  over the same base `S`, of genera `g₁`, `g₂`, with marking sets `I ⊔ {a}` and `J ⊔ {b}`;
  identify `a` and `b` in
  their disjoint union. The result is connected, has genus `g₁ + g₂`, and has markings
  `I ⊔ J`. Its dual graph is the disjoint union of the input graphs with one new edge
  joining the selected vertices; `b₁` is the sum of the two input Betti numbers.
- For **self-clutching**, take one connected family of genus `g` with marking set
  `I ⊔ {a,b}`, where `a ≠ b` and the sections are disjoint. Identifying them gives genus
  `g + 1` and markings `I`. The graph acquires one edge, possibly a loop, so `b₁` increases
  by one. For both constructors, prove properness, flatness, finite presentation, nodality,
  stability when the inputs are stable, and the normalization and pushout universal
  properties. Supply explicit equivalences from the remaining finite marking sets to
  `Fin n`, naturality under reindexing, and canonical compatibility with arbitrary base
  change. These are the two clutching operations of Knudsen II.

#### Single-marking contraction primitive

For a stable `(n + 1)`-pointed genus-`g` family and `2g - 2 + n > 0`, construct
`forgetLastContraction` over a locally Noetherian base before constructing stabilization of
arbitrary prestable families. Follow the scheme construction of Knudsen II, §1.

- Set `B = ω_{C/S}(s₁ + ⋯ + sₙ)`. Prove that it is fibrewise nef: removing one marking
  from a stable curve leaves no negative-degree component. On each geometric fibre there
  is at most one zero-degree component, a smooth rational component containing the removed
  marking and two remaining special flags. It is either a tail with one retained marking
  or a bridge with no retained markings. The numerical range excludes contracting the
  whole curve. Construct these two fibre contractions by deleting the tail or identifying
  the two attachment points, and prove `B` is the pullback of the ample log-dualizing sheaf
  of the resulting stable pointed curve.
- Prove, locally uniformly on the base, global generation, `H¹`-vanishing, and normal
  generation of sufficiently high powers of `B`. Use cohomology and base change to obtain
  locally free pushforwards and surjective evaluation and multiplication maps. Form a
  sufficiently divisible Veronese section algebra whose positive graded pieces commute
  with arbitrary base change; prove that passing to it does not change relative `Proj`.
- Construct the everywhere-defined proper surjection `c : C → C'` to that relative `Proj`.
  Prove `C' → S` flat and finitely presented from the graded algebra, identify its geometric
  fibres with the explicit contractions, and prove nodality, connectedness, and genus.
  Retained sections descend to pairwise-disjoint smooth sections. Prove universally
  `c_*𝒪_C = 𝒪_{C'}` and `R¹c_*𝒪_C = 0`. Establish the contraction universal property,
  uniqueness, and coherent base change using Layer 2. The degree-zero assertion here is
  about this single step, not an arbitrary prestable input.

### Layer 4: blowups and intersection theory on arithmetic surfaces

- Construct the Rees algebra and the blowup of a quasi-coherent finite-type ideal as a
  relative `Proj`. Prove the universal property, properness/projectivity, compatibility
  with flat base change, behaviour away from the centre, exceptional divisor, strict
  transform, and affine chart descriptions.
- Work out the essential test case `R[x,y]/(xy - πⁿ)`: blowing up its closed singular
  point preserves the nodal-family property and replaces `n` by `n - 2` on the remaining
  singular chart. Deduce termination in a regular total space.
- Develop Cartier/Weil intersection multiplicities on a regular two-dimensional scheme,
  especially vertical divisors on a proper regular model over a DVR: bilinearity,
  projection formula, self-intersection, and the negative-semidefinite intersection matrix
  of components of the special fibre.
- Formalize the resolution theorem in the exact scope required here: a normal proper model
  of a smooth curve over a DVR admits a regular proper model after a finite sequence of
  normalized blowups in closed points (blowup followed by normalization, per Lipman's
  theorem in the scope needed here), and two regular proper models admit a common
  resolution. Over a general, possibly non-excellent DVR, prove that the relevant
  normalizations are finite; this is available here because the generic fibre is smooth.
  Do not cite unrestricted resolution of singularities as a black box.
- Define exceptional curves of the first kind and prove the curve-on-surface contraction
  theorem, including preservation of properness and control of the generic fibre.

### Layer 5: regular and minimal models

- Construct a regular proper model of a smooth projective curve from Layer 4. Define
  relative minimality by absence of exceptional curves of the first kind in the special
  fibre.
- Show every regular proper model contracts to a minimal one. For positive-genus generic
  fibre, prove the minimal regular model is unique up to unique isomorphism and has the
  expected terminal mapping property among regular models.
- Develop components and multiplicities of the special fibre. Prove the divisor equality
  `div_X(π) = Σ mᵢ[Cᵢ]` and separately identify its associated effective Cartier subscheme
  with `X_s`; then prove the intersection relations, adjunction, and genus formula. Prove
  that a geometrically reduced and connected special fibre with geometrically smooth
  components and only ordinary nodes after algebraic closure is a prestable model. Give the
  equivalent formulation using finite separable residue extensions at singular points.
- Keep the genus-zero exception explicit: minimal regular models need not be unique. The
  pointed stabilization in Layer 9, not an invented unpointed uniqueness theorem, handles
  genus zero.

### Layer 6: numerical types and Picard torsion

- Define an abstract numerical type exactly as in
  [Stacks tag 0C6Z](https://stacks.math.columbia.edu/tag/0C6Z): a nonempty finite component
  set, positive integers `mᵢ` and `wᵢ`, nonnegative integers `gᵢ`, and a symmetric integer
  matrix `A = (aᵢⱼ)` with nonnegative off-diagonal entries. Require the graph with edges
  `aᵢⱼ > 0` for `i ≠ j` to be connected, `Σⱼ aᵢⱼmⱼ = 0`, and `wᵢ ∣ aᵢⱼ` for all
  `i,j`. Prove equivalence of graph connectedness with the source's no-disconnected-cut
  condition, and develop reindexing and equivalence of types.
- For a regular model with special-fibre components `Cᵢ`, set
  `κᵢ = H⁰(Cᵢ, 𝒪_{Cᵢ})`, `wᵢ = [κᵢ:k]`, and `gᵢ = dim_{κᵢ} H¹(Cᵢ, 𝒪_{Cᵢ})`;
  these are component arithmetic genera over their constant fields, not the normalization
  genera of the geometric dual graph. Prove that the intersection data yield a numerical
  type. Its signed genus is `g(T) = 1 + Σᵢ mᵢ(wᵢ(gᵢ - 1) - aᵢᵢ/2)`. Prove
  `Σᵢ mᵢaᵢᵢ` even, so this rational expression is an integer, and identify it with the
  model's generic-fibre genus. Do not divide each diagonal term in `ℤ` separately or
  truncate the result to `ℕ`: abstract numerical types can have negative genus.
- Define `Pic(T)` as the cokernel of
  `eᵢ ↦ Σⱼ (aᵢⱼ/wⱼ)eⱼ`, with exact integer division justified by symmetry and
  divisibility, as in [Stacks tag 0C7H](https://stacks.math.columbia.edu/tag/0C7H).
  The unweighted cokernel `Coker(A)` is a different group: prove the source's injection
  `Pic(T) → Coker(A)` induced by `eⱼ ↦ wⱼeⱼ`, not an equality. Develop the weighted
  group's rank-one finite-generation theorem, reindexing invariance, and prime torsion.
  Prove the combinatorial bounds relating `Pic(T)[ℓ]`, the first Betti number of the graph, the
  geometric genera of components, and the arithmetic genus. Include the classification and
  boundedness results for minimal numerical types used by the Artin–Winters argument.
- Compare line bundles on the regular model, generic fibre, special fibre, reduced special
  fibre, and numerical type. Prove the specialization maps and exact sequences required to
  inject enough generic `ℓ`-torsion into the Picard group of the reduced special fibre.
- Consume contracts J-D and J-E for `Pic⁰`, including the multiplication-isogeny and
  finite étale torsion results, from the Jacobian roadmap. For
  a smooth projective genus-`g` curve and a prime `ℓ` distinct from the field characteristic,
  prove that there is a finite separable extension `K'/K` such that `C_{K'}` has a
  `K'`-rational point and `Pic(C_{K'})[ℓ] ≅ (ℤ/ℓℤ)^{2g}`. The rational point is the descent
  input for the torsion line bundles. Supply the explicit degree bound used by the source
  proof; do not assume an algebraically closed field.
- Prove the numerical conclusion: for `g ≥ 2` and sufficiently large
  `ℓ ≠ char(k)` (the Stacks proof takes `ℓ > 768g`), a minimal regular model carrying
  full `ℓ`-torsion has multiplicity-one, geometrically smooth components and at-worst-
  nodal special fibre.

### Layer 7: semistable reduction

- Define `HasNodalReduction C R` for a curve over the fraction field of a fixed DVR to mean
  that it has a proper at-worst-nodal model over that DVR. This is the Chapter 55 reduction
  predicate, not `SemistableFamily` from Layer 3; the theorems below produce an extension
  `R'/R` for which `HasNodalReduction C_{K'} R'` holds.
- Prove `HasNodalReduction` in genus zero after a separable extension of degree at most two.
  State the source conclusion explicitly: after that extension, `C_{K'} ≅ ℙ¹_{K'}`.
- Prove genus-one nodal reduction after finite separable extension. The minimal regular model
  has special fibre either a smooth genus-one curve or a cycle of rational curves.
- Prove genus-`g ≥ 2` nodal reduction by Layers 5–6. Retain the exact uniform bound from
  [Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDM): if `ℓ' < ℓ` are the
  first two primes greater than `768g`, there is a finite separable extension of degree at
  most `B_g = (2g - 2)(ℓ^(2g))!`.
- State both useful forms: a chosen DVR `R'` above `R`, and simultaneous at-worst-nodal models
  over every localization at a maximal ideal of the integral closure in one finite
  extension. Derive the simultaneous form from the criterion that full `ℓ`-torsion is
  `K'`-rational, which depends only on `K'` and hence holds at every place above `R`, rather
  than claiming it follows directly from the theorem statement. Prove compatibility with
  further finite base extension.
- Separate the theorem from its stronger Jacobian criterion. The equivalence between
  semistable reduction of a curve and its Jacobian under additional residue-field
  hypotheses is a later theorem in this layer, not a premise smuggled into the main proof.

### Layer 8: canonical contraction and unpointed stable reduction

- Over a field, contract rational tails repeatedly until none remain, proving termination
  by the strictly decreasing number of geometric components. Recompute the graph after
  every contraction. On the resulting tail-free curve of genus at least two, prove global
  generation of `ω²` and `ω³` and the required cohomology vanishing; then contract rational
  bridges and identify the stable result with the `Proj` of this tail-free curve's canonical
  ring. Follow [Stacks §§53.23–53.25](https://stacks.math.columbia.edu/tag/0E7N).
  Prove the fibrewise contraction is characterized by its stable target, preservation of
  genus, and `c_*𝒪 = 𝒪`, `R¹c_*𝒪 = 0`.
- For a prestable family of genus `g ≥ 2` over a locally Noetherian scheme, construct
  stabilization by the following scheme-level route. Étale locally on the base, add
  finitely many disjoint auxiliary smooth sections making the source pointed-stable.
  Prove their existence by choosing separable smooth points on every geometric component,
  lifting them to étale-local sections, and using openness of pointed stability. Forget
  those auxiliary sections one at a time with Layer 3's single-marking contraction.
  Each step starts from a stable pointed family, so its log-dualizing bundle is nef and
  its sufficiently high powers define an actual morphism. The process terminates because
  the finite number of auxiliary markings decreases; the geometric fibre is the iterative
  tail-and-bridge contraction above.
- Prove uniqueness among contractions with those geometric fibres, using universal
  `c_*𝒪 = 𝒪` and contraction descent, so the result is independent of auxiliary sections
  and their order. On overlaps, the unique isomorphisms preserve the final dualizing sheaf
  and satisfy the cocycle condition. Apply Layer 2's effective descent of polarized schemes
  and morphisms to obtain `C → Cᵗˢ → S` as schemes. Prove the resulting family is proper,
  flat, finitely presented, and stable, and that the universal `c_*𝒪` and `R¹c_*𝒪`
  statements survive descent. This replaces the stack-descent step in
  [Stacks tag 0E8A](https://stacks.math.columbia.edu/tag/0E8A); no moduli stack is an input.
- Prove stabilization is unchanged on an already stable fibre and commutes coherently with
  arbitrary base change. For an already tail-free family, identify it directly with the
  relative `Proj` of the pluricanonical algebra after proving relative generation and
  base change. An arbitrary prestable family can have negative-degree rational tails, so
  its original pluricanonical evaluation map is not the construction.
- Prove the classical stable-reduction existence theorem by semistable reduction followed by
  stabilization.
- Prove uniqueness of stable models over a DVR: extend the generic isomorphism through a
  common regular model, show both maps are the canonical stabilization, and obtain a unique
  isomorphism of models.
- Package existence, uniqueness, and compatibility after a common finite extension as the
  stable-reduction interface promised in the end goals.

### Layer 9: marked stabilization and stable pointed reduction

- Extend generic markings to sections by properness, then use finite base change and blowups
  to make their closures pairwise disjoint and contained in the smooth locus. Track the
  generic-fibre identifications throughout.
- For a pointed prestable family with `2g - 2 + n > 0`, use the auxiliary-section
  construction of Layer 8, retaining all original markings and forgetting only auxiliary
  ones. Descend using the final ample log-dualizing sheaf. Describe the geometric fibres
  by iteratively contracting rational components with at most two current special flags:
  delete an unmarked tail, transfer the marking on a one-marked tail to its attachment, or
  replace an unmarked bridge by a node. Prove termination, order independence, and that the
  remaining markings are disjoint and smooth. A component with initially positive
  log-canonical degree can become unstable after neighboring tails are removed.
- Construct the graded log-canonical algebra and its multiplication and base-change maps
  for each nef single-marking step, and identify its `Proj` with that step's contraction
  using Layer 3. Do not assert semiampleness on the original arbitrary prestable curve.
  Prove that the composite preserves an already-stable marked generic fibre, is unique
  with the stated fibrewise contraction property, and commutes coherently with base change.
- Prove stable pointed reduction for smooth generic curves whenever
  `2g - 2 + n > 0`, including `(g,n) = (0,n)` for `n ≥ 3` and `(1,n)` for `n ≥ 1`, and prove
  uniqueness over the fixed DVR.
- Extend the theorem from a smooth generic fibre to an already stable pointed nodal generic
  fibre: use Layer 1 to split and label its nodes, branches, and components after one finite
  separable extension; normalize; treat the paired branches as additional markings; apply
  the pointed theorem componentwise after one common finite extension; and use the shared
  clutching construction to glue the paired sections. Prove the glued family is nodal and
  stable and is independent of all choices.
- Develop forgetting a marking followed by pointed stabilization. Prove compatibility with
  base change and the coherence of repeated forgetting.
- Express the result as essential existence after finite DVR extension and unique extension
  over a fixed DVR. This is the precise input a future properness proof for
  `Mbar_{g,n}` and for stable-map moduli should consume.

### Layer 10: stable maps and their stability condition

This layer depends on the pointed-prestable-curve core of Layer 3 and may begin while the
stable-reduction layers are still in progress.

- For a target `q : V → S`, define a `PrestableMap q n` to consist of a pointed prestable
  family `π : C → S`, its `n` ordered markings, a morphism `F : C → V`, and the equation
  `F ≫ q = π`. Supply coercions or projections to the source family without duplicating its
  properties. Define pullback along `S' → S` using chosen pullbacks and prove independence
  from those choices up to canonical isomorphism.
- Define isomorphisms of prestable maps over a fixed target: isomorphisms of pointed source
  curves that commute with `F`. Develop identity, inverse, composition, extensionality, and
  transport along isomorphisms of the base and target. For a separated locally finitely
  presented target, define the abstract automorphism group of each geometric fibre and its
  infinitesimal automorphisms. Over an algebraically closed field `k`, an infinitesimal
  automorphism is an automorphism after base change to `k[ε]/(ε²)` that reduces to the identity
  modulo `ε`, fixes every marking, and commutes with the target map. Identify its tangent space
  with the kernel of the map from global `k`-derivations of `𝒪_C` that vanish along the markings
  to derivations from `F⁻¹𝒪_V` to `𝒪_C`, induced by precomposition with `F^#`.
  Representability of relative Isom and Aut is outside this roadmap.
- On a geometric fibre, define when an irreducible component is **contracted** by `F`.
  Relate constancy of the restricted morphism and set-theoretic image dimension zero. When
  the target has an ample invertible sheaf, also relate these to degree zero of its pullback.
  Prove that this notion is invariant under field extension and target isomorphism.
- Define `IsStableMap F` fibrewise by positivity of the log-canonical degree on every
  contracted geometric component, using normalization genus and special flags. Prove
  invariance under isomorphism and stability under arbitrary base change for every target.
  The openness theorem is restricted to a projective target with a relatively ample
  invertible sheaf over a locally Noetherian base: identify stability with fibrewise
  ampleness of `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)` and apply Layer 2's openness-of-ampleness
  theorem. Openness for general separated locally finitely presented targets is outside
  this roadmap; it is not inferred from the finite-abstract-automorphism criterion.
- Prove the two standard characterizations for a separated locally finitely presented
  target. First, `F` is stable exactly when each geometric fibre has finite abstract
  automorphism group. Under componentwise generic separability of every noncontracted
  `F|_E` onto its image, prove in addition that infinitesimal automorphisms vanish; when a
  representing automorphism scheme is built downstream, this is its unramifiedness.
  Without generic separability, claim only finiteness. Second, for a relatively
  ample invertible sheaf `L` on a projective target, stability is equivalent to relative
  ampleness of
  `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)`. Prove independence from `L` and the analogous statement for
  every exponent at least three.
- Show that a constant prestable map is stable exactly when its pointed source is stable.
  A nonconstant map may be stable even when its pointed source is not; formalize this as an
  API theorem rather than making source stability a field of `PrestableMap`.

### Layer 11: basic stable-map API and map-aware stabilization

- Define the evaluation morphism at the `i`th marking as `sᵢ ≫ F : S → V`. Prove its
  compatibility with base change, reindexing of markings, isomorphisms of stable maps, and
  postcomposition on the target.
- Given a relatively ample `L`, define the degree of a map and its degree on each geometric
  irreducible component by the degree of `F^*L`. Prove nonnegativity, additivity over the
  components of a nodal curve, invariance under algebraically closed field extension, and
  local constancy of total degree in a connected family. Until a general cycle theory is
  available, this polarization degree is the numerical invariant of record; connect it to
  the pushforward curve class once Chow groups of one-cycles exist.
- Decorate the dual graph from Layer 1 with marking legs and component degrees. Prove the
  genus and total-degree formulas. A degree-zero vertex is stable exactly when
  `2g_v - 2 + val(v) + markings(v) > 0`; a positive-degree vertex is automatically stable.
  Equivalently, for a chosen polarization, require
  `2g_v - 2 + val(v) + markings(v) + 3d_v > 0` at every vertex. Here valence counts incident
  half-edges, so a loop counts twice. Develop restriction to a component, normalization at a
  node, and reconstruction of the numerical data.
- Specialize Layer 2's contraction-descent theorem to proper surjective contractions of
  prestable curves with universally connected genus-zero fibres and `c_*𝒪_C = 𝒪_{C'}`.
  For separated `V → S`, prove that a map constant on each contracted subcurve factors
  uniquely through the contraction, compatibly with base change.
- Reindex markings by equivalences. For a projective target with relatively ample `L` and
  a stable map with `n > 0` markings, genus `g`, and `L`-degree `d`, put `n' = n - 1`.
  Construct the single-marking contraction when `2g - 2 + n' + 3d > 0`, following
  [Behrend–Manin, Proposition 3.10 and Lemmas 3.11–3.12](https://arxiv.org/pdf/alg-geom/9506023#page=22).
  Set `A = ω_{C/S}(Σ retained sᵢ) ⊗ F^*(L^⊗3)`. Prove it is nef on each fibre and
  its zero-degree components are precisely the `F`-constant rational components with two
  remaining flags that contain the forgotten marking. Starting from a stable map, there
  is at most one such component per fibre. Construct its fibre contraction, prove descent
  of `F` and pullback of the resulting ample `A'`, then prove locally uniform generation,
  vanishing, and normal generation of high powers of `A`. Use the resulting base-change-
  compatible Veronese algebra to construct the relative `Proj` morphism, and prove
  flatness, nodality, the universal structure-sheaf identities, and smooth disjoint retained
  sections as in Layer 3. Positive map-degree components are never contracted.
  The numerical existence criterion depends only on whether `d = 0`, hence is independent
  of `L`; the excluded resulting types are
  `d = 0` with `g = 0, n' ≤ 2`, and `d = 0` with `g = 1, n' = 0`. Use the preceding descent
  theorem to prove that `F` descends uniquely, that the result is stable, and that base change
  and repeated forgetting satisfy the canonical-isomorphism coherence above.
- Define **external gluing** of stable maps of types `(g₁, I ⊔ {a}, d₁)` and
  `(g₂, J ⊔ {b}, d₂)` to the same target, assuming `ev_a = ev_b` as morphisms `S → V`.
  Layer 3's external pushout gives type `(g₁ + g₂, I ⊔ J, d₁ + d₂)`. Define
  **self-gluing** separately for type `(g, I ⊔ {a,b}, d)`, with `a ≠ b` and
  `ev_a = ev_b`, yielding `(g + 1, I, d)`. In both cases descend the target map by the
  pushout universal property; prove stability, the corresponding decorated-graph formula,
  reindexing by the specified marking-set equivalences, and coherent base change.
- For a projective target with relatively ample `L`, map degree `d`, and
  `2g - 2 + n + 3d > 0`, construct stabilization of an arbitrary prestable map by adding
  auxiliary smooth markings étale locally until it is stable, then forgetting only those
  markings with the single-marking construction above. The geometric fibre algorithm
  iteratively contracts `F`-constant rational components with at most two current flags,
  recomputing flags after each step. Prove termination by component count, independence
  of contraction order, and agreement with the family construction. In families the
  auxiliary-marking procedure terminates by marking count. Descend the final target map
  and polarized source using the final ample log-dualizing/map bundle and Layer 2's
  polarized scheme descent. Do not apply relative `Proj` directly to the initial bundle,
  which can have negative degree on constant rational tails.
  Prove the universal property for morphisms contracting the specified subcurves,
  uniqueness, independence from auxiliary markings and `L`, coherent base change, and
  identity on an already stable map. Prove separately that the excluded degree-zero
  genus-zero and genus-one numerical types admit no stable map.
- Record functoriality under target isomorphisms and closed immersions. For a general
  postcomposition `V → W`, prove a sharp criterion for preservation of stability rather
  than asserting it unconditionally: the new target map may contract additional source
  components.

## Acceptance criteria and worked examples

Build these alongside the layers; they detect definitions that are fibrewise, geometric,
or logarithmic in the wrong way.

- **Local node smoothing:** for a DVR uniformizer `π`, verify
  `Spec(R[x,y]/(xy-πⁿ)) → Spec R` is at-worst-nodal; it has regular total space exactly
  for `n ≤ 1`. For `n ≥ 2`, the point `(π,x,y)` needs three generators in its
  two-dimensional local ring and is not regular. Successive blowups reduce the thickness
  and terminate.
- **Genus from a dual graph:** two smooth components meeting transversely in one node have
  genus equal to the sum of their genera; a cycle of `r` rational curves has arithmetic
  genus one. Both follow from the normalization exact sequence and agree with the graph
  formula. Both graph and numerical-type carriers must be nonempty: the empty graph must
  not be admitted as a spurious genus-one curve.
- **Weighted numerical Picard group:** for `m = (1,1)`, `w = (2,2)`, `gᵢ = (1,1)`, and
  `A = [[-2,2],[2,-2]]`, verify all numerical-type axioms and `g(T) = 3`. The relations
  are `(-1,1)` and `(1,-1)`, so `Pic(T) ≅ ℤ`; the raw cokernel is `ℤ ⊕ ℤ/2ℤ`.
  Verify that no spurious two-torsion enters `Pic(T)`. Also test `w = (1,2)` with the same
  `m`, genera, and `A`: the first weighted relation is `(-2,1)`, fixing division by the
  destination weight. Test signed genus and the half-diagonal sum on a type with odd
  diagonal entries, rather than relying only on examples where every `aᵢᵢ` is even.
- **Unpointed stability:** a smooth genus-two curve is stable; a rational tail and a rational
  bridge have nonpositive canonical degree and are contracted; a cycle of rational curves is
  semistable of genus one but is not an unpointed stable curve.
- **Iterated rational-tail contraction:** attach a rational component `E` to a smooth
  genus-two curve and attach two unmarked rational leaves `T₁,T₂` to `E`. Initially
  `deg ω|_E = 1` and `deg ω|_{Tᵢ} = -1`; after deleting both leaves, `E` is a rational
  tail and contracts too. Check the same example with retained markings on the genus-two
  component and for a map constant on the whole attached tree. Verify the final family
  construction and its base changes contract the entire tree, despite the initial positive
  degree on `E`.
- **Pointed stability:** `(ℙ¹; 0,1,∞)` is stable. In the stable limit of four marked
  points on `ℙ¹` when two collide, the special fibre is two projective lines meeting in
  one node, with two markings on each component; both components have three special points.
- **Nonuniqueness in genus zero:** formalize the two contractions of the model
  `T₁T₂ - πT₀² = 0` in `ℙ²_R`, showing why unpointed minimal-model uniqueness
  cannot be asserted in genus zero.
- **Good reduction:** if `C` already extends to a smooth proper family of genus at least two,
  its stable reduction is that family itself, and uniqueness identifies any other stable
  model with it.
- **Stable maps versus stable sources:** the identity `ℙ¹ → ℙ¹` with no markings is a stable
  map although its source is not a stable pointed curve. The constant map from the same
  source is not stable, while a constant map from `(ℙ¹; 0,1,∞)` is stable.
- **Contracted and noncontracted components:** attach an unmarked rational tail to a stable
  source. A map that is constant on the tail is unstable; a map of positive degree on the
  tail can be stable. Verify both the component criterion and positivity of
  `ω(Σpᵢ) ⊗ F^*L^3`.
- **Evaluation and gluing:** glue two stable maps at markings with equal evaluations and
  check the resulting map, arithmetic genus, total degree, and decorated dual graph. Also
  check self-gluing separately: external gluing adds the input genera and degrees;
  self-gluing adds one to genus and leaves degree unchanged. Verify that unequal
  evaluations correctly prevent either construction.
- **Forgetting a marking:** take the constant map from the two-line nodal curve with two
  markings on each component from the pointed-stability example. Forget a marking on one
  component; that contracted rational component now has only two special points and
  map-aware stabilization must contract it. Contrast this with a positive-degree component,
  which remains after its last marking is forgotten because the map is nonconstant.

## Ordering and work lanes

Begin with Layer 0 and the nodal-family core of Layer 1. Four lanes can then advance without
duplicating ownership:

1. **Curve/duality lane:** Layers 1–3, shared with the Jacobian roadmap.
2. **Surface/model lane:** Layers 4–5, beginning with blowups and the local
   `xy = πⁿ` calculation.
3. **Combinatorial/Picard lane:** Layer 6, whose abstract numerical-type theory can start
   before all scheme comparisons exist.
4. **Stable-map lane:** Layer 10 begins after the pointed-curve and positivity cores of
   Layers 2–3. Its definitions, isomorphisms, evaluation maps, and decorated graphs can
   proceed independently of arithmetic-surface reduction. Layer 11's contraction results
   then join it to Layers 8–9.

Layer 7 joins the model and Picard lanes; Layer 8 also needs Layer 3's single-marking
contraction and Layer 2's polarized descent, not Layer 9. Layer 9 completes pointed
reduction, while Layers 10–11 complete the stable-map foundation. Layer 6 consumes the
exact J-D/J-E Picard and isogeny contracts above; it does not import Jacobian Layer F.
Every implementation issue should name the exact layer and target it claims. A headline
stable-reduction or stable-map statement with unresolved definitions, hidden resolution
assumptions, or a placeholder notion of node does not advance the summit.

## Boundary: moduli spaces and properness

This roadmap defines stable maps and develops their object-level and family-level API, but
it does not define a functor, algebraic stack, or coarse space parametrizing them. It also
does not prove boundedness, finite type, separatedness, or properness of such a moduli
object.

A stable map can have a rational or elliptic component that is unstable as a pointed curve
but is protected from contraction because the map is nonconstant there. Consequently, the
future valuative proof cannot forget the map and apply pointed stable reduction verbatim.
It must extend a generic map to the target, using graph closure, elimination of
indeterminacy, or a sufficiently positive polarization, then apply the map-aware
stabilization developed here. Packaging that theorem as properness additionally requires
the moduli object and the passage from finite DVR extensions to its valuative criterion.
Those are the next roadmap; the present one stops with stable maps themselves and the API
needed to state that work without placeholders.

## References

- The Stacks Project, [Chapter 55, *Semistable Reduction*](https://stacks.math.columbia.edu/tag/0C2P),
  [numerical types](https://stacks.math.columbia.edu/tag/0C6Y) and
  [their weighted Picard groups](https://stacks.math.columbia.edu/tag/0C7G),
  especially [the local nodal models and regularization](https://stacks.math.columbia.edu/tag/0CDB),
  [genus at least two](https://stacks.math.columbia.edu/tag/0CEI), and
  [the final semistable-reduction theorem](https://stacks.math.columbia.edu/tag/0CDM).
- The Stacks Project, [families of nodal curves](https://stacks.math.columbia.edu/tag/0C58),
  [the relative dualizing sheaf](https://stacks.math.columbia.edu/tag/0E6N),
  [prestable curves](https://stacks.math.columbia.edu/tag/0E6S),
  [semistable curves](https://stacks.math.columbia.edu/tag/0E6X),
  [stable curves](https://stacks.math.columbia.edu/tag/0E73),
  [contraction morphisms](https://stacks.math.columbia.edu/tag/0E7B), and
  [stable reduction](https://stacks.math.columbia.edu/tag/0E98).
- P. Deligne and D. Mumford,
  [*The irreducibility of the space of curves of given genus*](https://pmihes.centre-mersenne.org/articles/10.1007/BF02684599/),
  Publ. Math. IHÉS 36 (1969), especially Corollary 2.7.
- M. Artin and G. Winters,
  [*Degenerate fibres and stable reduction of curves*](https://doi.org/10.1016/0040-9383(71)90028-0),
  Topology 10 (1971), 373–383.
- F. F. Knudsen,
  [*The projectivity of the moduli space of stable curves, II: The stacks M_{g,n}*](https://doi.org/10.7146/math.scand.a-12001),
  Math. Scand. 52 (1983), 161–199, especially §1 for the single-marking contraction, and
  for the pointed stabilization and clutching constructions.
- K. Behrend and Yu. Manin,
  [*Stacks of stable maps and Gromov–Witten invariants*](https://arxiv.org/abs/alg-geom/9506023),
  Duke Math. J. 85 (1996), 1–60, for stable maps and decorated graphs; §3, Cases I and V,
  Proposition 3.10, and Lemmas 3.11–3.12 give the auxiliary-marking and single-marking
  constructions underlying the scheme-level family route here.
- W. Fulton and R. Pandharipande,
  [*Notes on stable maps and quantum cohomology*](https://arxiv.org/abs/alg-geom/9608011),
  Proc. Sympos. Pure Math. 62 (1997), Part 2, 45–96, especially the basic definition,
  stability criterion, and polarization used in the projective construction.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*, for models, intersection theory,
  reduction of curves, and arithmetic surfaces.
- D. Mumford, J. Fogarty, and F. Kirwan, *Geometric Invariant Theory*, and D. Gieseker,
  *Lectures on Moduli of Curves*, for the alternative GIT route that this roadmap does not
  use as its dependency spine.

## Acknowledgements

This roadmap follows the Artin–Winters and Deligne–Mumford arguments through the modern
organization of the Stacks Project, and follows Behrend–Manin and Fulton–Pandharipande for
the stable-map layer. Its shared Picard, divisor, and cohomology foundations are coordinated
with the existing Tau Ceti Jacobian challenge rather than independently redesigned here.
