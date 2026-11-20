# Roadmap: stable reduction of curves and stable maps

**Summary.** Let `R` be a discrete valuation ring with fraction field `K`, with no completeness,
henselian or residue-field hypothesis. A smooth projective curve over `K` need not extend to a
smooth curve over `R`, but after a finite separable extension of `K` it extends to a curve with only
ordinary double points. This roadmap proves this in the scheme-theoretic form of Artin–Winters and
Deligne–Mumford, and builds the scheme-level theory of stable maps. A *model* of a curve `C` over
`K` is a flat finitely presented `R`-scheme with a chosen isomorphism from its generic fibre to `C`.
A *stable curve* over `S` is a proper flat family whose geometric fibres are connected, at worst
nodal, of arithmetic genus at least two, and free of rational tails and bridges (smooth rational
components meeting the rest of the curve in one point, or in two).

The headline theorems are these.

- **Nodal reduction** (Artin–Winters). If `C` is a smooth projective curve over `K` with
  `H⁰(C, 𝒪_C) = K` and of genus `g ≥ 2`, there is a finite separable extension `K'/K` of degree at
  most `(2g − 2)(ℓ^{2g})!`, where `ℓ` is the second prime larger than `768g`, such that at every
  place of `K'` above `R` the curve `C_{K'}` has a proper model whose special fibre is at worst
  nodal. In every genus some finite separable extension suffices.
- **Stable reduction** (Deligne–Mumford). If `C` is a smooth, projective, geometrically connected
  curve over `K` of genus `g ≥ 2`, then after a finite separable extension `K'/K` and the choice of
  a place of `K'` above `R`, with local ring `R'`, the curve `C_{K'}` is the generic fibre of a
  stable curve over `R'`; and over a fixed discrete valuation ring two stable models of the same
  curve are related by a unique isomorphism extending the identification of their generic fibres.
- **Pointed stable reduction.** The same holds for a smooth, projective, geometrically connected
  curve of genus `g` with `n` distinct `K`-rational marked points whenever `2g − 2 + n > 0`, with a
  stable `n`-pointed model extending the markings.
- **Stable maps.** For a target `V → S`, a prestable map from an `n`-pointed prestable curve
  `C → S` to `V` is stable when every component of a geometric fibre on which it is constant has
  positive log-canonical degree. For a separated locally finitely presented target this holds
  exactly when every geometric fibre has a finite automorphism group, and for a projective target
  with a relatively ample `L` it holds exactly when `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)` is relatively ample,
  which makes stability an open condition on the base.

No moduli functor, stack or coarse space is constructed. Much of the foundation is in the Tau Ceti library: models over a discrete valuation ring, finite
extensions of discrete valuation rings, at-worst-nodal families and the local structure of nodes,
abstract dual graphs and their stabilization, blowups, the components and multiplicities of a
special fibre, and the combinatorics of numerical types with their Picard torsion bound.
[JacobianChallenge](../JacobianChallenge/README.md) supplies invertible sheaves, coherent
cohomology, cohomology and base change, and the `ℓ`-torsion of the Jacobian that forces nodal
special fibres. [NeronModelsAndSemistableAbelianVarieties](../NeronModelsAndSemistableAbelianVarieties/README.md)
consumes the models, regular and minimal models, numerical types and nodal reduction, and
[EllipticCurves](../EllipticCurves/README.md) compares its Tate symbols with the minimal regular
model of Layer 5.

Layers 0–3 build the curve theory (models, nodes and dual graphs, cohomology and duality in
families, stable and pointed curves); Layers 4–7 the arithmetic surfaces and the Artin–Winters
argument (blowups, regular and minimal models, numerical types, nodal reduction); Layers 8–9 stable
reduction by stabilization; Layers 10–11 stable maps.

## How to read the build

The layers give dependency order. Layer 0 and the nodal core of Layer 1 come first; four lanes can
then advance without duplicating ownership.

1. **Curve and duality lane:** Layers 1–3, sharing its foundations with JacobianChallenge.
2. **Surface and model lane:** Layers 4–5, beginning with blowups and the local `xy = πⁿ`
   calculation.
3. **Combinatorial and Picard lane:** Layer 6, whose comparisons with models need Layers 4–5 and
   whose torsion input is JacobianChallenge's.
4. **Stable-map lane:** Layer 10 begins after the pointed-curve and positivity cores of Layers 2–3;
   its automorphisms and contracted components proceed independently of arithmetic surfaces.
   Layer 11's contraction results then join it to Layers 8–9.

Layer 7 joins the model and Picard lanes. Layer 8 needs Layer 3's single-marking contraction and
Layer 2's polarized descent, not Layer 9. Layer 9 completes pointed reduction, and Layers 10–11
complete the stable-map foundation. Layer 6 consumes the Picard and isogeny contracts J-D and J-E
and not JacobianChallenge Layer F. Each layer ends with its examples and dependencies, and each
target's *Needs:* line lists what its statement and route use, item by item, so that a target proved
by another route is not blocked behind an unrelated layer. Every headline rests on actual
definitions: a stable-reduction or stable-map statement with an unresolved definition, a hidden
resolution assumption or a placeholder notion of node does not discharge its target.

## Conventions

1. **Base.** Let `R` be a discrete valuation ring with fraction field `K`, with no completeness,
   henselian, algebraic-closure or perfect-residue-field hypothesis; `π` is a uniformizer and `k`
   the residue field. Definitions that make sense over arbitrary schemes stay base-general. The
   coherent pushforward, semicontinuity, cohomology-and-base-change, relative duality and
   representability results are developed over a locally Noetherian base, with every finiteness
   hypothesis on a morphism stated explicitly; unless a theorem proves more, its base-change
   statement quantifies over morphisms between locally Noetherian bases, and a theorem outside
   this convention states its exact base hypotheses. Extending these results to arbitrary bases
   through pseudo-coherent or perfect complexes and Noetherian approximation is outside this
   roadmap.
2. **Schemes first.** Work with morphisms of Mathlib's `Scheme`. Algebraic spaces and stacks are
   downstream consumers, not foundations. Definitions are nevertheless morphism properties,
   stable under base change and invariant under isomorphism, so that they transport to spaces.
3. **No bundled mega-object.** Being a family of curves, being at worst nodal of relative
   dimension one, prestable, semistable and stable, and having exact genus `g` are separate
   predicates. A marked family packages its sections and their equations with `f`, but does not
   bundle projectivity, a DVR base or a chosen polarization.
4. **Geometric fibres govern stability.** Connectedness, nodes, irreducible components and the
   componentwise stability inequalities are tested after extending the residue field to an
   algebraic closure. Descent and invariance are proved; stability is never defined from the
   visible components over a residue field that is not algebraically closed.
5. **Terminology follows the Stacks Project.** A *family of curves* is proper, flat, finitely
   presented and of relative dimension at most one. A *prestable* family is an at-worst-nodal
   relative curve of pure relative dimension one with geometrically connected fibres. A
   *semistable* family is a prestable family whose geometric fibres have arithmetic genus at least
   one and no rational tails. A *stable* family is a prestable family whose geometric fibres have
   arithmetic genus at least two and neither rational tails nor rational bridges. Exact genus is a
   separate predicate. The global-generation and ampleness characterizations are recorded (§3.2).
   The reduction predicate of Stacks Chapter 55 says instead that some proper model is at worst
   nodal; it is Tau Ceti's `TauCeti.HasNodalReduction` (Layer 7), in genus zero as everywhere,
   and "semistable" is never an unpinned synonym for "nodal".
6. **Dual graphs and stability use normalization data.** In a geometric dual graph and in every
   stability condition, the genus of a component `E` is the genus of its normalization `Ẽ`. The
   special flags of `E` are the markings on `Ẽ` together with the points of `Ẽ` above nodes of the
   whole curve; a self-node contributes two flags. The valence of a vertex is its number of
   incident half-edges, so a loop contributes two. Numerical types use instead the arithmetic
   genera of components over their constant fields (§6.1).
7. **Marked stability is logarithmic.** Markings are pairwise disjoint sections through the smooth
   locus. An `n`-pointed prestable curve is stable when `ω_{X/S}(s₁ + ⋯ + sₙ)` is relatively ample;
   equivalently, its restriction to every geometric irreducible component has positive degree,
   computed with the special flags of Convention 6. This is the convention needed in genus zero
   and one.
8. **Stable-map stability depends on the map.** A stable map has a pointed prestable source, not
   necessarily a stable pointed source. On every geometric fibre, only the components on which the
   map is constant must have positive log-canonical degree. For a separated locally finitely
   presented target this is equivalent to finiteness of the abstract automorphism group of every
   geometric fibre (§10.4). Representability of relative Isom and Aut is outside this roadmap. In
   positive characteristic, generic separability of `F|_E` onto its image for every noncontracted
   geometric component `E` gives vanishing of infinitesimal automorphisms; without it only
   finiteness is claimed. A downstream automorphism scheme representing them is then unramified
   under the generic-separability hypothesis.
9. **Polarizations are structure for degree, not hidden data.** The stable-map structure records a
   target morphism and a map over the base. A chosen relatively ample invertible sheaf `L` on a
   projective target supplies component degrees, a numerical total degree and the positivity
   criterion through `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)`; the stability predicate is independent of the
   chosen ample polarization (§10.4).
10. **Genus means arithmetic genus.** For a proper geometrically connected curve over a field,
    `g = dim H¹(X, 𝒪_X)`. In a family, genus `g` means that `R¹f_*𝒪_X` is locally free of rank `g`,
    with the fibrewise and Euler-characteristic formulations proved equivalent (§2.2). The sum of
    the genera of the normalized components is never used for it: the first Betti number of the
    dual graph also contributes.
11. **A model carries its generic-fibre identification.** A model of `C/K` over `R` is a flat
    finitely presented morphism `X → Spec R` together with an explicit isomorphism in
    `Over (Spec K)` from the base change `X ×_{Spec R} Spec K` to `C`. Properness is a separate
    predicate on models. Morphisms of models commute with the generic-fibre isomorphisms and form a
    category; isomorphisms of models are its isomorphisms. Uniqueness statements therefore never
    forget which birational map is extended.
12. **DVR extensions are local data.** For a finite extension `K'/K`, the integral closure of `R`
    in `K'` can have several maximal ideals; one above the closed point is chosen and the integral
    closure is localized there. The integral closure is not assumed to be a DVR, and no extension
    of the valuation is chosen without being recorded. A finite DVR extension packages the field
    extension, the integral closure, the chosen maximal ideal and its localization, the
    fraction-field identification and the domination data; its algebra structures, the
    localization equivalence and the embeddings into the extension field form the stated scalar
    towers and commuting squares, and a common refinement of two packages carries compatible
    embeddings into a third.
13. **Universal constructions commute canonically.** Base change of chosen pullbacks, relative
    `Proj`, stabilization and forgetting markings commute up to specified canonical isomorphisms,
    never literal equality. Universal properties make these isomorphisms unique, and the coherence
    needed for iterated base change and repeated forgetting is proved.
14. **All characteristics.** The prime `ℓ` prime to the residue characteristic is chosen inside
    the proof. Characteristic zero, perfect residue fields and semistable reduction of the Jacobian
    are not hypotheses of the main theorems.
15. **Homes.** Curve material lives under `TauCeti/AlgebraicGeometry/Curves/`, the model and
    reduction theory under `TauCeti/AlgebraicGeometry/Curves/StableReduction/` and the
    map-specific material under `TauCeti/AlgebraicGeometry/Curves/StableMaps/`. Blowups,
    intersection theory, relative `Proj`, coherent cohomology and duality are general-purpose and
    live in the corresponding shared `TauCeti/AlgebraicGeometry/` directories. Within a layer,
    general-purpose material sits in Mathlib-compatible namespaces, and the expected base-change,
    localization and isomorphism API is proved before the named milestone.

## Layer 0: relative curves and extensions of DVRs

Relative dimension, families of curves, generic and special fibres, finite extensions of discrete
valuation rings and models with their generic-fibre identification are Tau Ceti's (supplier
contracts): `TauCeti.AlgebraicGeometry.RelativeDimensionLE`,
`TauCeti.AlgebraicGeometry.PureRelativeDimension`, `TauCeti.AlgebraicGeometry.FamilyOfCurves`,
`TauCeti.genericFiber` and `TauCeti.specialFiber` with `TauCeti.genericFiberIsoFiberGenericPoint`,
`TauCeti.FiniteDVRExtension` with its towers and common refinements, and `TauCeti.Model` with its
category, base change and properness predicate. The layers below consume them by these names and never
build a second copy. What remains is the sheaf-theoretic groundwork that the nodal layer needs.

### 0.1 Quasi-coherent groundwork for differentials, Fitting ideals and conductors

Use Mathlib's `SheafOfModules.IsQuasicoherent` and `SheafOfModules.IsFinitePresentation` with the
affine presentation and tilde API, and Tau Ceti's sheaf of relative differentials over an affine
base `Scheme.relativeDifferentials`, Fitting ideals `Scheme.Modules.fittingIdeal` (quasi-coherent
sheaves of finite type, with pullback compatibility `Scheme.Modules.fittingIdeal_pullback`) and the
conductor of a finite morphism `Scheme.Hom.conductor`. Add only the missing operations: the sheaf of
relative differentials `Ω_{X/S}` of a morphism `X → S` over a non-affine base, glued from the affine
case, with the canonical base-change isomorphism `g'^*Ω_{X/S} ≅ Ω_{X'/S'}` for a base change along
`g : S' → S`; pullback compatibility of the conductor of a finite morphism along flat base change;
and the normalization exact sequence `0 → 𝒪_X → ν_*𝒪_{X̃} → ν_*𝒪_{X̃}/𝒪_X → 0` for a finite
birational normalization `ν : X̃ → X`, as a short exact sequence of quasi-coherent sheaves. Keep
pullback compatibility with Mathlib's quasi-coherent sheaf API, and define no new quasi-coherence or
finite-presentation predicates. The full proper-cohomology theory is Layer 2; these prerequisites
come before the nodal layer.
*Needs:* Mathlib `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFinitePresentation`,
`AlgebraicGeometry.Scheme.Hom.normalization`; Tau Ceti `Scheme.relativeDifferentials`,
`TauCeti.AlgebraicGeometry.relativeDifferentialsRestrictIso`, `Scheme.Modules.fittingIdeal`,
`Scheme.Modules.fittingIdeal_pullback`, `Scheme.Hom.conductor`,
`Scheme.Hom.mono_unitToPushforwardObjUnit`.

**Checks.**
- For the split node `X = Spec k[x, y]/(xy)`, normalized by two lines, the cokernel
  `ν_*𝒪_{X̃}/𝒪_X` is `(k[x] × k[y])/(k[x, y]/(xy)) ≅ k`, the skyscraper of length one at the node
  (Tau Ceti's local `NodeAlgebra.branchSheafSequence_shortExact`), not `k²`: the two branch values
  are identified modulo the diagonal.

### Examples

- Over a discrete valuation ring and for `n ≥ 1`, `Spec R[x, y]/(xy − πⁿ) → Spec R` is flat, of
  finite presentation and of pure relative dimension one, but not proper, so not a family of curves;
  its generic fibre `xy = πⁿ` is smooth over `K` and its special fibre is two crossing lines over `k`.

### Dependencies

Mathlib quasi-coherent sheaves and normalization; Tau Ceti relative differentials over an affine
base, Fitting ideals, conductors, relative dimension, families of curves, fibres, finite extensions
of discrete valuation rings and models. Nothing of Layers 1–11 is used.

## Layer 1: nodes, normalization, and dual graphs

Syntomic morphisms (`TauCeti.AlgebraicGeometry.SyntomicOfRelativeDimension`), the singular locus
over an affine base (`Scheme.singularLocus`, the first Fitting ideal of the relative differentials),
the at-worst-nodal predicate `TauCeti.AlgebraicGeometry.AtWorstNodalOfRelativeDimensionOne`
(syntomic of relative dimension one with unramified singular locus, affine-locally on the base),
its base change, fpqc descent and fibrewise criterion, smooth curves being nodal, the finiteness
and étaleness of the singular locus of a proper nodal curve over a field, splitting of the nodes
after a finite separable extension, the node algebra `TauCeti.NodeAlgebra` of `xy = a`, and the
abstract dual graphs `TauCeti.DualGraph` with their genus, valence, rational tails and bridges are
Tau Ceti's (supplier contracts; Stacks, [families of nodal curves](https://stacks.math.columbia.edu/tag/0C58)).
This layer builds the geometry that connects them.

### 1.1 The singular locus over a general base and the pointwise criterion

Construct the relative singular closed subscheme `Sing(f)` of `f : X → S` flat, locally of finite
presentation and of pure relative dimension one over an arbitrary base `S`, as the first Fitting
ideal of `Ω_{X/S}` (§0.1), glued from Tau Ceti's `Scheme.singularLocus` over affine opens of `S`,
and prove that `AtWorstNodalOfRelativeDimensionOne f` holds exactly when `f` is syntomic of
relative dimension one and `Sing(f) → S` is unramified. Prove the equivalent pointwise fibrewise
condition: `f` is flat and locally of finite presentation, its fibres are of pure dimension one, and
every point of every geometric fibre `X_s̄` is either smooth or an ordinary double point, a point
whose completed local ring is `κ(s̄)[[u, v]]/(uv)`
([Stacks Lemma 53.20.1](https://stacks.math.columbia.edu/tag/0C59)).
*Needs:* §0.1; Tau Ceti `Scheme.singularLocus`, `TauCeti.AlgebraicGeometry.SyntomicOfRelativeDimension`,
`TauCeti.AlgebraicGeometry.AtWorstNodalOfRelativeDimensionOne`,
`TauCeti.AlgebraicGeometry.atWorstNodalOfRelativeDimensionOne_iff_flat_and_fiberToSpecResidueField`,
`TauCeti.exists_hypersurface_presentation_of_formallyUnramified`; Mathlib `AdicCompletion`.

**Checks.**
- The cusp `y² = x³` over a field `k` of characteristic not `2` or `3` is flat of pure dimension
  one, but at the origin `Ω` has fibre dimension two and the quotient by the first Fitting ideal,
  `k[x, y]/(y, x², y² − x³)`, is not reduced, hence not unramified over `k`: the cusp is not a node.
  A definition by "Sing is finite" would accept it.
- The tacnode `y² = x⁴` is likewise rejected: its singular locus `k[x, y]/(y, x³)` is not
  unramified over `k`.
- `xy = 0` passes at the origin with singular locus `Spec k`, and `xy = t` over `k[t]` passes, its
  singular locus being `Spec k[t]/(t)`, unramified over `k[t]`.

### 1.2 The étale local structure of a node

Prove the local normal form over a discrete valuation ring: for a point `x` of the special fibre of
`f : X → Spec R` at worst nodal of relative dimension one, construct an étale extension of discrete
valuation rings `R ⊂ R'`, an étale neighbourhood `U → X` containing a point above `x`, and an étale
morphism `U → Spec(R'[u, v]/(uv))` or `U → Spec(R'[u, v]/(uv − πⁿ))`, with `π` a uniformizer of
`R'`, such that both triangles to `Spec R' → Spec R` commute
([Stacks Lemma 55.14.2](https://stacks.math.columbia.edu/tag/0CDD)). This `R'/R` is étale local-chart
data, not the finite, possibly ramified stable-reduction extension. The ring-level chart is Tau
Ceti's `TauCeti.exists_etale_nodeAlgebra_hom`, and the singular locus is already in this form by
`Scheme.exists_singularLocus_iso_Spec_quotient_of_isPullback_etale`; the target puts a nodal
curve's local equation into the chart's shape. Prove that nodality is étale local on the source:
for an étale surjective `U → X`, `X → S` is at worst nodal exactly when `U → S` is.
*Needs:* §1.1; Tau Ceti `TauCeti.exists_etale_nodeAlgebra_hom`,
`Scheme.exists_singularLocus_iso_Spec_quotient_of_isPullback_etale`, `TauCeti.NodeAlgebra`,
`TauCeti.NodeAlgebra.atWorstNodalOfRelativeDimensionOne`.

**Checks.**
- `R[x, y]/(xy − πⁿ)` is its own chart with exponent `n`; over `R' = R[π^{1/2}]`, which is
  ramified and so not allowed here, the same curve would have exponent `2n`: the exponent is an
  invariant of the étale local chart, and a ramified `R'` would change it.
- `R[x, y]/(x² − y² − π)` over a discrete valuation ring with `2` invertible is étale locally
  `uv = π`, through `u = x − y`, `v = x + y`, with `R' = R`.

### 1.3 Branches, splitting and normalization of a nodal curve over a field

The singular locus of a proper nodal curve over a field `K` is finite étale over `K` (Tau Ceti's
`Scheme.isFinite_singularLocus_subschemeι_comp` and `Scheme.etale_singularLocus_subschemeι_comp`),
and after a finite separable extension it is a disjoint union of rational points
(`Scheme.exists_split_singularLocus`). Construct the branch scheme of the nodes, finite étale of
degree two over the singular locus (on the split chart this is Tau Ceti's
`NodeAlgebra.branchSchemeToSingularLocus`). After one finite separable extension of `K`, split and
label every node, every branch and every geometric irreducible component, recording the pairing
involution of the branches. Develop the normalization `ν : X̃ → X` of a reduced, possibly
reducible, proper nodal curve, the conductor, and the normalization exact sequence
`0 → 𝒪_X → ν_*𝒪_{X̃} → ⊕_{nodes} κ(node) → 0`, on whose split chart Tau Ceti has
`NodeAlgebra.branchSheafSequence_shortExact`.
*Needs:* §0.1, §1.1; Tau Ceti `Scheme.isFinite_singularLocus_subschemeι_comp`,
`Scheme.etale_singularLocus_subschemeι_comp`, `Scheme.exists_split_singularLocus`,
`NodeAlgebra.branchSchemeToSingularLocus`, `NodeAlgebra.branchSheafSequence_shortExact`,
`TauCeti.FiniteDVRExtension`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**
- Over `ℝ`, the curve `x² + y² = 0` is two complex-conjugate lines meeting at a real node: its
  singular locus is one `ℝ`-point, but its two branches and two components are defined only over
  `ℂ`, so splitting nodes alone is not enough and the extension must split branches and components
  too.
- The nodal cubic `y² = x²(x + 1)` over `ℚ` has one node whose two branches have slopes `±1`, both
  rational: no extension is needed, and the normalization is `ℙ¹` with two points over the node.

### 1.4 The dual graph of a nodal curve

Build the dual graph of a proper geometrically connected nodal curve `X` over an algebraically
closed field, as a Tau Ceti `TauCeti.DualGraph`: vertices are the irreducible components of the
normalization, edges are the nodes, loops are allowed, the genus of a vertex is the genus of the
normalized component, and the special flags are as in Convention 6. Prove that the graph is
nonempty and connected, and the genus formula `pₐ(X) = Σ_v g_v + b₁(Γ_X)`, with `pₐ` the genus of
Convention 10, from the normalization exact sequence of §1.3; Tau Ceti's
`TauCeti.DualGraph.arithmeticGenus` is the right-hand side. Valence counts incident half-edges, so
a loop counts twice (`TauCeti.DualGraph.valence`).
*Needs:* §1.3; §2.1 (cohomology of the normalization sequence); Tau Ceti `TauCeti.DualGraph`,
`TauCeti.DualGraph.arithmeticGenus`, `TauCeti.DualGraph.firstBetti`, `TauCeti.DualGraph.valence`,
`AlgebraicGeometry.Scheme.genus`.

**Checks.**
- Two smooth components of genera `g₁`, `g₂` meeting transversely in one node: one edge, two
  vertices, `b₁ = 0`, so `pₐ = g₁ + g₂`. A cycle of `r ≥ 1` rational curves (a nodal cubic for
  `r = 1`, one vertex with a loop): `b₁ = r − r + 1 = 1` and `pₐ = 1` (Tau Ceti's
  `DualGraph.arithmeticGenus_cycle`). The sum of the normalization genera alone gives `0` there.
- The empty graph would have `b₁ = 0 + 1 − 0 = 1` and "genus one"; the graph and its carrier are
  nonempty, as Tau Ceti's `DualGraph` requires.

### 1.5 Rational tails and bridges

Define rational tails and rational bridges of a nodal curve over a field geometrically: a rational
tail is an irreducible component of the geometric fibre whose normalization is `ℙ¹` and which
carries exactly one branch above the nodes of the curve, that is, it meets the rest of the curve in
one point and has no self-node; a rational bridge is such a component carrying exactly two branches
above nodes, neither from a self-node. Markings are not counted here.
On the dual graph of §1.4 these are Tau Ceti's `DualGraph.IsRationalTail` and
`DualGraph.IsRationalBridge`. Prove their invariance under extension of algebraically closed
fields. A rational component is unstable in the current pointed curve exactly when its log-canonical
degree is nonpositive (`DualGraph.logCanonicalDegree_nonpos_iff` on graphs). After a contraction,
flags and degrees are recomputed: stabilization is iterative, not a test of the initial component
degrees (§8.1).
*Needs:* §1.4; Tau Ceti `DualGraph.IsRationalTail`, `DualGraph.IsRationalBridge`,
`DualGraph.logCanonicalDegree_nonpos_iff`.

**Checks.**
- A smooth rational component attached to the rest of the curve at one point is a rational tail;
  its log-canonical degree is `−1` with no marking and `0` with one, so it is unstable in both cases,
  and `1` with two markings, when it is stable. A nodal rational curve on its own has one component
  carrying two branches of a self-node: it is neither a tail nor a bridge, and counting the self-node
  once would make it a tail.

### Examples

- Local node smoothing: for a uniformizer `π`, `Spec(R[x, y]/(xy − πⁿ)) → Spec R` is at worst nodal
  (Tau Ceti's `NodeAlgebra.atWorstNodalOfRelativeDimensionOne`), and its total space is regular
  exactly for `n ≤ 1` (`NodeAlgebra.isRegularRing_pow_iff`): for `n ≥ 2` the point `(π, x, y)` needs
  three generators in its two-dimensional local ring. Successive blowups reduce the thickness and
  terminate (§4.2).

### Dependencies

Layer 0 (§0.1); Layer 2 §2.1 for the genus formula of §1.4. Tau Ceti: syntomic morphisms, the
singular locus over an affine base, the nodal predicate and its fibrewise criterion, the node
algebra, the splitting of nodes, abstract dual graphs.

## Layer 2: coherent curve theory, duality, and positivity

The shared foundations come from [JacobianChallenge](../JacobianChallenge/README.md) through the
contracts J-A1, J-A2, J-B, J-C and J-B / SR-2 (supplier contracts). The nodal Gorenstein relative
dualizing sheaf and its componentwise degree formula are this layer's, in the shared files those
contracts name; JacobianChallenge's smooth duality restricts it. Tau Ceti supplies the closure
model, sections through the smooth locus as relative effective Cartier divisors with their sums and
base change (`Scheme.Hom.isRelativeEffectiveCartier_ker_of_comp_eq_id`,
`TauCeti.isRelativeEffectiveCartier_prod`,
`AlgebraicGeometry.Scheme.IdealSheafData.isRelativeEffectiveCartier_prod_ker_pullback_section`),
relative `Proj` of a graded quasi-coherent algebra, and contraction descent: a morphism constant on
the geometric fibres of a universally closed surjection `c` with `𝒪 ≅ c_*𝒪` factors uniquely
through `c`, compatibly with base change (`Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`,
`Scheme.Hom.existsUnique_comp_eq_over_of_subsingleton_range_geometricFiber`,
`Scheme.Hom.descOfIsQuotientMap_of_commSq`).

### 2.1 Coherent cohomology in families

Over locally Noetherian bases, build coherent sheaves of modules (quasi-coherent of finite type on
a locally Noetherian scheme), coherent pushforward under proper morphisms and the higher direct
images `Rⁱf_*` (Tau Ceti's `Scheme.Hom.higherDirectImage`) of coherent sheaves as coherent sheaves;
finite-dimensionality of the cohomology of a coherent sheaf on a proper curve over a field,
reducible and nodal curves included; vanishing above degree one on curves; the full
cohomology-and-base-change theorem; Grauert's theorem; and upper semicontinuity of
`s ↦ dim Hⁱ(X_s, M_s)` for `M` coherent and flat over the base. Derive the specialized
`R¹f_*𝒪_X` results for proper flat nodal families of relative dimension one. Over an affine base
and on two-affine covers Tau Ceti proves flat base change (`TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`)
and semicontinuity of `H¹` (`TauCeti.AlgebraicGeometry.upperSemicontinuous_finrank_cohomology_one_fiber`).
*Needs:* contracts J-B, J-C; Tau Ceti `Scheme.Hom.higherDirectImage`,
`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`,
`TauCeti.AlgebraicGeometry.upperSemicontinuous_finrank_cohomology_one_fiber`.

**Checks.**
- For the family `xy = t` compactified as a conic `xy = tz²` in `ℙ²_{k[t]}`, `h⁰(𝒪) = 1` and
  `h¹(𝒪) = 0` on every fibre, smooth or nodal: the jump that semicontinuity allows does not occur,
  and `R¹f_*𝒪 = 0` commutes with base change.

### 2.2 Arithmetic genus in families

The genus of a scheme over a field is Tau Ceti's `AlgebraicGeometry.Scheme.genus`, `dim H¹(X, 𝒪_X)`
(contract J-B), defined once. Prove that it is defined (`H¹` finite-dimensional) for every proper
curve over a field, and prove the normalization and dual-graph formula of §1.4 for it. For a
family of curves `f : X → S` with `H⁰(X_s, 𝒪_{X_s}) = κ(s)` for every `s ∈ S`, prove that
`R¹f_*𝒪_X` is finite locally free and that its formation commutes with arbitrary base change, so
that the arithmetic genus of the fibres is locally constant on the base
([Stacks Lemmas 109.9.3](https://stacks.math.columbia.edu/tag/0E1J) and
[109.9.4](https://stacks.math.columbia.edu/tag/0E6K)); without that hypothesis on the fibres the
genus can jump. The predicate *has genus `g`* of `f : X → S` asks that `R¹f_*𝒪_X` be locally free
of constant rank `g`, with base change identifying its fibres with `H¹(X_s̄, 𝒪)`. Prove the fibrewise
and Euler-characteristic formulations equivalent: for `f` proper, flat, with geometrically connected
and geometrically reduced fibres, `f` has genus `g` exactly when every geometric fibre has
`dim H¹ = g`, exactly when every geometric fibre has `χ(𝒪) = 1 − g`.
*Needs:* §2.1, §1.4; Tau Ceti `AlgebraicGeometry.Scheme.genus`,
`TauCeti.AlgebraicGeometry.eulerCharBelow_trivial_eq_one_sub_genus`.

**Checks.**
- A plane cubic `y²z = x³ + axz² + bz³` degenerating to the nodal cubic `y²z = x³ + x²z` has genus
  one on every fibre; the normalization of the nodal fibre has genus zero, so a definition through
  normalization genera would see a genus drop.
- Two disjoint lines over `k` have `H¹ = 0` and `H⁰ = k²`, so `χ = 2` and `1 − χ = −1 ≠ 0 = dim H¹`:
  the Euler-characteristic formulation needs geometrically connected fibres.
- The twisted cubics in `ℙ³` given on `𝔸³` by `t ↦ (t² − 1, t³ − t, at)`, `a ≠ 0`, closed up over
  the `a`-line, have at `a = 0` the fibre `X₀` with affine ideal `(z², xz, yz, y² − x²(x + 1))`: the
  plane nodal cubic `Y` with an embedded point `P` at the node. From `0 → κ(P) → 𝒪_{X₀} → 𝒪_Y → 0`,
  `h⁰(𝒪_{X₀}) = 2` and `h¹(𝒪_{X₀}) = 1`, against `1` and `0` on the fibres `ℙ¹`: `χ = 1` throughout,
  but `dim H¹` jumps at the one fibre where `H⁰(X_s, 𝒪) = κ(s)` fails.

### 2.3 The relative dualizing sheaf

Build the relative dualizing sheaf `ω_{X/S}` of a proper flat finitely presented relative
Cohen–Macaulay curve, as in [Stacks tag 0E6N](https://stacks.math.columbia.edu/tag/0E6N): Lemma
109.19.1 makes `ω_{X/S}` flat over `S` with formation commuting with arbitrary base change,
Definition 109.19.2 names it, and Lemma 109.19.3 makes it invertible for Gorenstein fibres. Prove
these base-change isomorphisms canonical. Construct the nodal case directly as the relative
dualizing sheaf of a local complete intersection morphism through a closed immersion into a smooth
proper `P → S`: over a Noetherian base, `ω_{X/S} = det(Ω_{P/S})|_X ⊗ det(𝒩_{X/P})`, with `𝒩_{X/P}`
the normal sheaf, the dual of `ℐ/ℐ²`, as computed in the proof of
[Stacks Lemma 48.29.2](https://stacks.math.columbia.edu/tag/0E9Z), with
[Lemma 48.17.11](https://stacks.math.columbia.edu/tag/0B6V) for invertibility of `f^!𝒪_S`. Nodal
curves are Gorenstein. On smooth fibres the construction agrees with Tau Ceti's
`TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle` and `Scheme.relativeDifferentials`, and
with JacobianChallenge's `ω_{X/k}` (contract J-B / SR-2).
*Needs:* §2.1, §0.1; Tau Ceti `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det`,
`AlgebraicGeometry.Scheme.IsCohenMacaulay`, `TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle`,
`Scheme.relativeDifferentials`; contract J-B / SR-2.

**Checks.**
- For a plane curve `X ⊂ ℙ²_k` of degree `d`, the construction gives `ω_X = 𝒪(−3) ⊗ 𝒪(d) = 𝒪(d − 3)`
  restricted to `X`, of degree `d(d − 3) = 2pₐ − 2` with `pₐ = (d − 1)(d − 2)/2`. For the nodal
  cubic `ω = 𝒪_X`, of degree `0`, while `Ω_X` is not invertible at the node: the dualizing sheaf is
  not the sheaf of differentials.

### 2.4 Degrees of the dualizing sheaf on components

Prove the componentwise degree formula on a geometric nodal fibre:
`deg(ω_X|_E) = 2g(Ẽ) − 2 + #(branches on Ẽ above nodes of X lying on E)`, where `Ẽ` is the
normalization of `E`; the count includes all such branches, so a self-node of `E` contributes two.
With markings, add the number of markings on `E` for `ω_X(Σsᵢ)`. Degrees of a line bundle on a
component are Tau Ceti's `LineBundleClass.intersectionNumber` along the inclusion of the reduced
component, and the right-hand side is Tau Ceti's `TauCeti.DualGraph.logCanonicalDegree` of the dual
graph of §1.4.
*Needs:* §§2.2–2.3, §1.4; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`,
`TauCeti.DualGraph.logCanonicalDegree`, `TauCeti.DualGraph.sum_logCanonicalDegree`.

**Checks.**
- For two lines meeting in one node, each line has `deg ω = −2 + 1 = −1` and the total is
  `−2 = 2pₐ − 2` with `pₐ = 0`; for the nodal cubic the single component has `−2 + 2 = 0`, the
  self-node counting twice. Counting a self-node once would give `−1` and contradict
  `deg ω = 2pₐ − 2 = 0`.

### 2.5 Line bundles, projective morphisms and relative Proj

Extend Tau Ceti's invertible sheaves (`TauCeti.AlgebraicGeometry.InvertibleSheaf`, with tensor
product, dual, pullback and the group `LineBundleClass`) with tensor powers `L^⊗n`, `n ∈ ℤ`, as
objects with their coherence isomorphisms, pullback compatibility in base-change squares, degree on
components of a curve with `deg L = Σ_E deg(L|_E)` over the irreducible components of a nodal
curve (contract J-A2, nodal comparison), global generation and relative ampleness of an invertible
sheaf on `X` over `S`. Build projective morphisms over a general base, and the relative `Proj` of a
finitely generated graded quasi-coherent algebra: Tau Ceti constructs
`CategoryTheory.CommMon.relativeProj A` for graded quasi-coherent algebras
(`TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra`), with its affine charts, properness and
twisting sheaves. For every graded quasi-coherent algebra `A`, finitely generated or not, prove
that the formation of `relativeProj A` commutes with arbitrary base change `S' → S`, compatibly
with the twisting sheaves ([Stacks Lemma 27.16.10](https://stacks.math.columbia.edu/tag/01O3)),
that over an affine `S` it is Mathlib's `Proj` of the graded ring `A(S)`, and that a Veronese
subalgebra `A^{(d)} = ⊕ₖ A_{dk}`, `d ≥ 1`, has the same relative `Proj`, its `𝒪(n)` corresponding
to `𝒪(dn)` on `relativeProj A` (on affine charts,
[Stacks Lemma 27.11.8](https://stacks.math.columbia.edu/tag/0B5J)). Prove its functoriality in
`A`, relative ampleness of `𝒪(1)` when `A` is generated in degree one, and its universal property.
Given a closed immersion `C ↪ ℙᴺ_K`, the proper model by
scheme-theoretic closure in `ℙᴺ_R` is Tau Ceti's `TauCeti.Model.projectiveClosure`
(`TauCeti.Model.isProper_projectiveClosure`).
*Needs:* contracts J-A1, J-A2; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`,
`TauCeti.AlgebraicGeometry.LineBundleClass`, `TauCeti.AlgebraicGeometry.InvertibleSheaf.IsGloballyGenerated`,
`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`, `CategoryTheory.CommMon.relativeProj`,
`TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra`, `CategoryTheory.CommMon.isProper_relativeProjToBase`,
`TauCeti.Model.projectiveClosure`; Mathlib `AlgebraicGeometry.Proj`.

**Checks.**
- `Proj` of `R[x, y]` with `x, y` in degree one is `ℙ¹_R` and `𝒪(1)` is relatively ample; for
  `R[x, y, z]` with `z` in degree two, `𝒪(1)` is not invertible at the point `x = y = 0`, where the
  chart is the quadric cone `Spec R[x²/z, xy/z, y²/z]`: generation in degree one is needed for
  `𝒪(1)` to be a line bundle.
- `deg L = Σ_E deg(L|_E)`: on two lines meeting in one node, a line bundle of degrees `(1, 0)` on
  the two lines has total degree `1`, computed as `χ(L) − χ(𝒪)`.

### 2.6 Ampleness and global generation on curves

Prove the ampleness criterion for an invertible sheaf on a proper curve over a field: it is ample
exactly when it has positive degree on every geometric irreducible component. No degree-only
global-generation criterion is asserted for arbitrary invertible sheaves; instead prove the explicit
degree bounds and the global-generation theorems for `ω^{⊗m}` and `ω(Σsᵢ)^{⊗m}` used in Layers 3 and 8:
`ω^{⊗m}` globally generated for `m ≥ 2` on a semistable curve (§3.2), `ω^{⊗2}` and `ω^{⊗3}`
globally generated on a curve of genus at least two without rational tails (§8.1), and global
generation, `H¹`-vanishing and normal generation of sufficiently high powers of the nef bundle
`ω(Σsᵢ)` of §3.8 (§3.9). The smooth case of global generation in degree at least `2g` is Tau Ceti's
`InvertibleSheaf.isGloballyGenerated_of_smooth_of_two_mul_genus_le_eulerDegree`.
*Needs:* §§2.4–2.5; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`,
`InvertibleSheaf.isGloballyGenerated_of_smooth_of_two_mul_genus_le_eulerDegree`,
`InvertibleSheaf.subsingleton_cohomology_one_of_smooth_of_two_mul_genus_sub_two_lt_eulerDegree`.

**Checks.**
- On two lines meeting in one node, the line bundle of degrees `(1, 0)` has total degree `1 > 0`
  but is not ample: it is trivial on the second line. A criterion by total degree would accept it.
- For a genus-two curve with a rational bridge, `ω` has degree `0` on the bridge and is not ample,
  as §3.2 requires of a curve that is semistable and not stable.

### 2.7 Openness of ampleness

Prove that the locus of the base over which an invertible sheaf on a proper finitely presented
family is ample on the fibre is open, and identify it with the locus over which the sheaf is
relatively ample. This is the openness input for pointed stability and polarized stable maps; it
requires no Isom or Aut representability.
*Needs:* §2.1, §2.5, §2.6.

**Checks.**
- On the family of conics `X = V(xy − tz²) ⊂ ℙ²_{k[t]}`, the section `s(t) = [1 : t : 1]` passes
  through the smooth locus, and `𝒪_X(s)` has degree `1` on the smooth fibres and degrees `(1, 0)` on
  the two lines `y = 0` and `x = 0` of the fibre over `t = 0`: it is fibrewise ample exactly over the
  open set `t ≠ 0`.

### 2.8 Effective étale descent of polarized schemes

Build effective étale descent for schemes equipped with a compatible relatively ample invertible
sheaf: descend the graded quasi-coherent section algebra and recover the scheme by relative `Proj`
(SGA 1, Exposé VIII, Proposition 7.8, along any faithfully flat quasi-compact morphism).
Include descent of morphisms, sections, multiplication and the polarization, with cocycle and
base-change coherence. Effectiveness of arbitrary scheme descent without a polarization is not used,
and no moduli stack is invoked. Tau Ceti supplies descent of morphisms along effective epimorphisms
(`TauCeti.homDescentEquiv`), effective descent for affine morphisms
(`TauCeti.DescentDatum.descended`) and the affine-base `Proj` of a descended graded algebra
(`TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal`).
*Needs:* §2.5; Tau Ceti `TauCeti.homDescentEquiv`, `TauCeti.DescentDatum.descended`,
`TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal`.

### Examples

- The closure of the conic `xy = πz²` of `ℙ²_K` in `ℙ²_R` (Tau Ceti's `Model.projectiveClosure`) is
  a proper model whose special fibre is two lines; `ω` has degree `−1` on each line and `−2` in total,
  and `𝒪(1)` has degree `1` on each line, so it is ample.

### Dependencies

Layers 0–1; contracts J-A1, J-A2, J-B, J-C, J-B / SR-2. Tau Ceti: cohomology of scheme modules and
its affine base-change and semicontinuity results, the genus, invertible sheaves and their classes,
global generation and ampleness of line-bundle classes, relative `Proj`, closure models, relative
effective Cartier divisors from sections, descent along effective epimorphisms and contraction
descent.

## Layer 3: prestable, semistable, stable, and pointed curves

Prestable families, pointed prestable families with their isomorphisms, and the combinatorics of
stability, clutching and forgetting on abstract dual graphs are Tau Ceti's (supplier contracts).
This layer adds stability of actual families, the scheme-level clutching constructions and the
single-marking contraction (Stacks, [prestable curves](https://stacks.math.columbia.edu/tag/0E6S),
[semistable curves](https://stacks.math.columbia.edu/tag/0E6X),
[stable curves](https://stacks.math.columbia.edu/tag/0E73); Knudsen II).

### 3.1 Prestable families and the structure sheaf

Prestable families are Tau Ceti's `TauCeti.AlgebraicGeometry.PrestableFamily f`: `f` is proper,
geometrically connected and at worst nodal of relative dimension one, hence a family of curves of
pure relative dimension one, with the base-change, restriction and fibre API of the supplier
contracts (Stacks, [prestable curves](https://stacks.math.columbia.edu/tag/0E6S)). Prove the
structure-sheaf characterization: over a locally Noetherian base `S` (Convention 1), for
`f : X ⟶ S` proper and at worst nodal of relative dimension one, `f` is prestable if and only if `𝒪_{S'} → f'_*𝒪_{X'}` is an isomorphism for the base change
`f' : X' ⟶ S'` of `f` along every morphism `S' ⟶ S` from a locally Noetherian scheme. Over a field this is Tau Ceti's
`Scheme.Hom.isIso_app_pullback_fst_of_geometricallyReduced_of_geometricallyConnected`; the family
version passes through the fibres, which are geometrically reduced, and flat base change.
*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.PrestableFamily`,
`TauCeti.AlgebraicGeometry.AtWorstNodalOfRelativeDimensionOne`,
`Scheme.Hom.isIso_app_pullback_fst_of_geometricallyReduced_of_geometricallyConnected`,
`TauCeti.AlgebraicGeometry.isIso_app_pullback_fst_of_flat`; Layer 2 §2.1 (cohomology and base
change for `f_*𝒪_X`).

**Checks.**
- `ℙ¹_{K'} → Spec K` for a separable quadratic extension `K'/K` is proper, smooth and connected but
  not geometrically connected, and `f_*𝒪 = K' ≠ K`: a definition asking only for connected fibres
  would accept it.
- The disjoint union of two copies of `ℙ¹_k` over `k` has `f_*𝒪 = k × k`, and is not prestable.

### 3.2 Semistable and stable families

Define the predicates *semistable family* and *stable family* on morphisms of schemes as in
Convention 5: a prestable `f` all of whose geometric fibres have arithmetic genus at least one and
no rational tails, respectively arithmetic genus at least two and neither rational tails nor
rational bridges, with rational tails and bridges as in §1.5 (Stacks,
[semistable curves](https://stacks.math.columbia.edu/tag/0E6X) and
[stable curves](https://stacks.math.columbia.edu/tag/0E73)). Exact genus `g` is the separate
predicate of §2.2. Prove that, for a prestable family whose geometric fibres have arithmetic genus
at least one, semistability is equivalent to the absence of rational tails in the geometric fibres
and to fibrewise global generation of `ω_{X/S}^{⊗m}` for every `m ≥ 2`; and that, for genus at
least two, stability is equivalent to the absence of rational tails and rational bridges and to
relative ampleness of `ω_{X/S}` ([Stacks Lemmas 109.21.1](https://stacks.math.columbia.edu/tag/0E6Y)
and [109.22.1](https://stacks.math.columbia.edu/tag/0E74)). On the dual graph of a geometric fibre
(§1.4) the first equivalences are Tau Ceti's
`DualGraph.isSemistable_iff_forall_not_isRationalTail` and
`DualGraph.isStable_iff_forall_not_isRationalTail_and_not_isRationalBridge`, through the
componentwise degree formula of §2.4. Each predicate is invariant under isomorphism and stable
under base change (§3.4).
*Needs:* §3.1; §§1.4–1.5; §§2.2–2.4, §2.6; Tau Ceti `TauCeti.DualGraph.IsStable`,
`TauCeti.DualGraph.IsSemistable`, `DualGraph.isSemistable_iff_forall_not_isRationalTail`,
`DualGraph.isStable_iff_forall_not_isRationalTail_and_not_isRationalBridge`.

**Checks.**
- A cycle of `r ≥ 1` rational curves (a nodal cubic for `r = 1`) has arithmetic genus one and
  degree zero of `ω` on every component: it is semistable and not stable (Tau Ceti's
  `DualGraph.cycle` with `DualGraph.isSemistable_cycle` and `DualGraph.not_isStable_cycle`). A
  definition of stability by "no rational tails" alone would accept it.
- Two smooth genus-one curves joined by a smooth rational bridge have arithmetic genus two; the
  bridge has `deg ω = −2 + 2 = 0` and the elliptic components degree `1`. The curve is semistable
  and not stable; contracting the bridge gives two elliptic curves meeting in one node, which is
  stable.
- A smooth genus-two curve with a rational tail attached has `deg ω = −1` on the tail: it is not
  semistable, although its genus is two.

### 3.3 Pointed prestable families and pointed stability

Pointed prestable families are Tau Ceti's `TauCeti.AlgebraicGeometry.PointedPrestableFamily S n`:
a prestable family with sections `s : Fin n → (S ⟶ X)`, `s i ≫ f = 𝟙 S`, with pairwise disjoint
images inside the smooth locus `Scheme.Hom.smoothLocus`; each marking, and the sum of the markings,
is a relative effective Cartier divisor
(`PointedPrestableFamily.isRelativeEffectiveCartier_prod_ker_marking`). Define *stability* of an
`n`-pointed prestable family by relative ampleness of `ω_{X/S}(s₁ + ⋯ + sₙ)` (Convention 7; Knudsen
II). Prove the equivalent positive-degree criterion: the family is stable exactly
when, on every irreducible component `E` of every geometric fibre, `2g(Ẽ) − 2 + #(special flags of
E) > 0`, with normalization genus and special flags as in Convention 6. On the dual graph of a
geometric fibre this is Tau Ceti's `TauCeti.DualGraph.IsStable`; deduce from
`DualGraph.IsStable.two_mul_arithmeticGenus_sub_two_add_card_pos` that a stable `n`-pointed family
of genus `g` has `2g − 2 + n > 0`.
*Needs:* §3.1; §1.4; §2.4 (with markings), §2.6; Tau Ceti
`TauCeti.AlgebraicGeometry.PointedPrestableFamily`,
`PointedPrestableFamily.isRelativeEffectiveCartier_prod_ker_marking`, `TauCeti.DualGraph.IsStable`,
`DualGraph.IsStable.two_mul_arithmeticGenus_sub_two_add_card_pos`.

**Checks.**
- `(ℙ¹; 0, 1, ∞)` is stable: `deg ω(Σsᵢ) = −2 + 3 = 1`. Without the markings in the line bundle
  (`ω` alone) the degree is `−2` and the definition would reject every pointed rational curve.
- `(ℙ¹; 0, ∞)` has degree `0` and is not stable; a smooth genus-one curve is not stable with no
  marking (degree `0`) and is stable with one (degree `1`): marked stability is what makes genus
  zero and one usable.

### 3.4 Invariance, base change and openness of stability

Prove that unpointed and pointed stability are invariant under isomorphism of families, stable
under arbitrary base change, and open on the base: for a prestable family, respectively an
`n`-pointed prestable family, over a locally Noetherian base, the set of points over which the
fibre is stable is open. Openness is §2.7 applied to `ω_{X/S}`, respectively `ω_{X/S}(Σsᵢ)`.
*Needs:* §§3.2–3.3; §2.3 (base change of `ω`), §2.7.

### 3.5 Isomorphisms and automorphisms

Isomorphisms and automorphisms of pointed prestable families are those of Tau Ceti's category
`PointedPrestableFamily.category`, with the faithful functor `PointedPrestableFamily.toOver` to
`Over S` and the identification `PointedPrestableFamily.mem_range_autToOver_iff` of automorphisms
with automorphisms over `S` fixing every marking; automorphism groups are the ordinary groups
`CategoryTheory.Aut`. Prove that an `n`-pointed stable curve over an algebraically closed field has
a finite automorphism group and no infinitesimal automorphisms: every automorphism of its base
change to `k[ε]/(ε²)` that reduces to the identity modulo `ε` and fixes the markings is the
identity (without markings, there are no nonzero vector fields by
[Stacks Lemma 53.26.3](https://stacks.math.columbia.edu/tag/0E69), from Lemmas 53.26.1–53.26.2;
markings enter as fixed points, as in Lemma 53.26.1(3)). Representable relative Isom and Aut
objects are outside this roadmap.
*Needs:* §3.3; §1.4, §2.3; Tau Ceti `PointedPrestableFamily.category`,
`PointedPrestableFamily.toOver`, `PointedPrestableFamily.autToOver`,
`PointedPrestableFamily.mem_range_autToOver_iff`.

**Checks.**
- `(ℙ¹; 0, 1, ∞)` over an algebraically closed field has trivial automorphism group, while
  `(ℙ¹; 0, ∞)` has the infinite group `t ↦ λt`, `λ ∈ k^×`: finiteness fails exactly where
  stability does.
- A smooth genus-one curve with one marking has a finite automorphism group (of order `2`, `4` or
  `6` when the characteristic is not `2` or `3`), and without a marking its translations form an
  infinite group.

### 3.6 External clutching

Develop the scheme pushout identifying two disjoint sections through the smooth locus, shared by
both clutching constructors (Knudsen II). **External clutching**: given pointed prestable
families over the same base `S` of genera `g₁`, `g₂`, with marking sets `I ⊔ {a}` and `J ⊔ {b}`,
identify `a` and `b` in the disjoint union of the total spaces. Prove that the result is a pointed
prestable family, connected, of genus `g₁ + g₂`, with markings `I ⊔ J`; that its geometric dual
graphs are the clutched graphs of Tau Ceti's `DualGraph.clutch`, so that `b₁` is the sum of the two
input Betti numbers (`DualGraph.firstBetti_clutch`); and that it is stable when both inputs are
(`DualGraph.isStable_clutch_iff`).
*Needs:* §3.3; §1.4, §2.2; Tau Ceti `DualGraph.clutch`, `DualGraph.firstBetti_clutch`,
`DualGraph.arithmeticGenus_clutch`, `DualGraph.isStable_clutch_iff`.

### 3.7 Self-clutching and the clutching obligations

**Self-clutching**: given one connected pointed prestable family of genus `g` with marking set
`I ⊔ {a, b}`, `a ≠ b`, identify the sections `a` and `b`. Prove that the result has genus `g + 1`
and markings `I`, that the graph acquires one edge, possibly a loop, so `b₁` increases by one
(Tau Ceti's `DualGraph.selfClutch` and `DualGraph.firstBetti_selfClutch`). For both constructors
prove properness, flatness, finite presentation, nodality, stability when the inputs are stable,
and the normalization and pushout universal properties; supply explicit equivalences from the
remaining finite marking sets to `Fin n`, naturality under reindexing, and canonical compatibility
with arbitrary base change. These are the two clutching operations of Knudsen II.
*Needs:* §3.6; Tau Ceti `DualGraph.selfClutch`, `DualGraph.firstBetti_selfClutch`,
`DualGraph.arithmeticGenus_selfClutch`, `DualGraph.isStable_selfClutch_iff`,
`PointedPrestableFamily.reindex`.

**Checks.**
- Self-clutching `(ℙ¹; 0, ∞)` at its two markings gives the nodal rational curve: arithmetic genus
  `0 + 1 = 1`, one vertex with a loop, `b₁ = 1`, valence two at the vertex.
- External clutching of two copies of `(ℙ¹; 0, 1, ∞)` along one marking each gives two lines
  meeting in one node with two markings on each: genus `0`, four markings, every component with
  three special points, so stable, as `DualGraph.isStable_clutch_iff` predicts.

### 3.8 The single-marking contraction: the nef bundle and its fibres

For a stable `(n + 1)`-pointed genus-`g` family over a locally Noetherian base, with
`2g − 2 + n > 0`, construct the contraction forgetting the last marking, before stabilization of
arbitrary prestable families is attempted (Knudsen II, §1). Set `B = ω_{C/S}(s₁ + ⋯ + sₙ)`. Prove
that `B` is fibrewise nef: removing one marking from a stable curve leaves no component of negative
degree. On each geometric fibre there is at most one component of degree zero: a smooth rational
component containing the forgotten marking and exactly two remaining special flags, either a tail
with one retained marking or a bridge with no retained marking; the numerical range excludes
contracting the whole curve. Construct these two fibre contractions, deleting the tail or
identifying the two attachment points, and prove that `B` is the pullback of the ample
log-dualizing sheaf of the resulting stable pointed curve. The numerical shadow on dual graphs is
Tau Ceti's: `DualGraph.IsStable.isSemistable_reindex_some`,
`DualGraph.IsStable.subsingleton_logCanonicalDegree_reindex_some_eq_zero`,
`DualGraph.isRationalTail_or_isRationalBridge_of_logCanonicalDegree_eq_zero` and
`DualGraph.IsStable.exists_reflGen_stabilizationStep_reindex_some_isStable`.
*Needs:* §§3.3–3.4; §1.4, §§2.3–2.4; Tau Ceti `DualGraph.IsStable.isSemistable_reindex_some`,
`DualGraph.IsStable.subsingleton_logCanonicalDegree_reindex_some_eq_zero`,
`DualGraph.isRationalTail_or_isRationalBridge_of_logCanonicalDegree_eq_zero`,
`DualGraph.IsStable.exists_reflGen_stabilizationStep_reindex_some_isStable`,
`DualGraph.contractTail`, `DualGraph.contractBridge`.

**Checks.**
- Forgetting the marking `∞` of `(ℙ¹; 0, 1, ∞)` is outside the range (`g = 0`, `n = 2`): `B` has
  degree `0` on the whole curve and the contraction would collapse it.
- On two lines meeting in one node with markings `p₁, p₂` on the first and `p₃, p₄` on the second,
  forgetting `p₄` leaves the second line with two special flags: it is a tail with one retained
  marking, of degree `0`, and the contraction gives `(ℙ¹; p₁, p₂, p₃)`.

### 3.9 The single-marking contraction: uniform positivity and the Veronese algebra

Prove, locally uniformly on the base, global generation, `H¹`-vanishing and normal generation of
sufficiently high powers of `B`. Use cohomology and base change to obtain locally free
pushforwards and surjective evaluation and multiplication maps. Form a sufficiently divisible
Veronese section algebra whose positive graded pieces commute with arbitrary base change; by the
Veronese invariance of §2.5, passing to it does not change the relative `Proj` (Knudsen II, §1).
*Needs:* §3.8; §2.1, §2.5, §2.6.

### 3.10 The single-marking contraction: the contraction morphism

Construct the everywhere-defined proper surjection `c : C → C'` to that relative `Proj`, unique up
to canonical isomorphism (Knudsen II, Proposition 2.1, p. 174). Prove `C' → S` flat and finitely
presented from the graded algebra, identify its geometric fibres with the explicit contractions of
§3.8, and prove nodality, connectedness and genus `g`. The retained sections descend to pairwise
disjoint sections in the smooth locus. Prove that `𝒪_{C'} → c_*𝒪_C` is an isomorphism and
`R¹c_*𝒪_C = 0`, universally; establish the contraction universal property, uniqueness and coherent
base change using Layer 2 and Tau Ceti's contraction descent. The degree-zero assertion is about
this single step, not about an arbitrary prestable input (Knudsen II, Definition 1.3, p. 164).
*Needs:* §3.9; §2.1, §2.5; Tau Ceti `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`,
`Scheme.Hom.descOfIsQuotientMap_of_commSq`.

### Examples

- The cycle of rational curves, the elliptic curves joined by a bridge, and `(ℙ¹; 0, 1, ∞)` of the
  Checks above are the unpointed and pointed stability test cases.
- In the stable limit of four marked points on `ℙ¹` when two of them collide, the special fibre is
  two projective lines meeting in one node, with two markings on each; both components have three
  special points, and the limit is the external clutching of §3.7's Check.

### Dependencies

Layer 1 (nodes, dual graphs, rational tails and bridges), Layer 2 (cohomology and base change,
`ω_{X/S}` and its degrees, ampleness and its openness, relative `Proj`, contraction descent).
Tau Ceti: prestable and pointed prestable families with their category, and the dual-graph
stability, clutching and forgetting results named above.

## Layer 4: blowups and intersection theory on arithmetic surfaces

Blowups of quasi-coherent ideals, with their universal property, flat base change, exceptional
divisor, strict transforms and affine charts, and the single blowup step of the node `xy = πⁿ`, are
Tau Ceti's (supplier contracts). The layer completes them and builds intersection theory, resolution
and contraction on arithmetic surfaces (Liu; Stacks,
[local nodal models and regularization](https://stacks.math.columbia.edu/tag/0CDB)).

### 4.1 Blowups as projective morphisms

The blowup of a quasi-coherent ideal `I` of `X` is Tau Ceti's
`AlgebraicGeometry.Scheme.IdealSheafData.blowup`, the relative `Proj` of the Rees algebra
`AlgebraicGeometry.Scheme.IdealSheafData.reesAlgebra`, with its universal property
(`IdealSheafData.existsUnique_comp_blowupToBase_eq_of_isEffectiveCartier`), properness for a locally
finitely generated `I` (`IdealSheafData.isProper_blowupToBase`), cartesian flat base change
(`IdealSheafData.isPullback_blowupMap_of_flat`), the isomorphism away from the centre, the
exceptional divisor and strict transforms. Prove that the blowup of a quasi-coherent ideal of finite
type is a projective morphism in the sense of §2.5, with `𝒪(1)` the invertible ideal `I·𝒪` of the
exceptional divisor, relatively ample
([Stacks Lemma 31.33.13](https://stacks.math.columbia.edu/tag/02NS)).
*Needs:* §2.5; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.blowup`,
`AlgebraicGeometry.Scheme.IdealSheafData.reesAlgebra`,
`IdealSheafData.existsUnique_comp_blowupToBase_eq_of_isEffectiveCartier`,
`IdealSheafData.isProper_blowupToBase`, `IdealSheafData.isPullback_blowupMap_of_flat`.

**Checks.**
- Blowing up `ℙ¹_R` at a `k`-rational closed point `p` of its special fibre, the fibre over `p` is the
  exceptional line `E`, with `E² = −1`, and `𝒪(1) = 𝒪(−E)` has degree `−E² = 1` on it, as relative
  ampleness requires; the inverse `𝒪(E)` has degree `−1`.

### 4.2 Resolution of the node `xy = πⁿ`

Blowing up the closed singular point of `R[x, y]/(xy − πⁿ)` preserves the nodal-family property and
replaces `n` by `n − 2` on the remaining singular chart (Tau Ceti's
`NodeAlgebra.atWorstNodalOfRelativeDimensionOne_blowup`, `NodeAlgebra.affineBlowupBaseEquiv` and
`NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`). Deduce termination: after `⌊n/2⌋` such blowups
the total space is regular, at worst nodal over `R`, and the map to `Spec R[x, y]/(xy − πⁿ)` is
proper and an isomorphism away from the singular point. Apply this, through the étale local form of
§1.2, at a closed point of a proper at-worst-nodal model over `R`.
*Needs:* §1.2, §4.1; Tau Ceti `NodeAlgebra.atWorstNodalOfRelativeDimensionOne_blowup`,
`NodeAlgebra.affineBlowupBaseEquiv`, `NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`,
`NodeAlgebra.isRegularRing_pow_iff`.

**Checks.**
- `xy = π³`: one blowup leaves the chart `uv = π`, which is regular; `xy = π⁴` leaves `uv = π²`,
  which is not, and needs a second blowup. The resolved special fibre is a chain: the two original
  lines joined by `n − 1` smooth rational curves, all of multiplicity one.

### 4.3 Intersection theory on a regular model

Degrees of line bundles on curves in a scheme are Tau Ceti's
`TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`, with its divisibility by residue
degrees (`LineBundleClass.finrank_dvd_intersectionNumber`) and the meet-properly lemmas for prime
divisors on a regular scheme. Develop Cartier/Weil intersection multiplicities on a regular
two-dimensional scheme, especially for vertical divisors on a proper regular model `X` over a
discrete valuation ring: bilinearity, including additivity in the curve argument, the projection
formula at the level of cycles, self-intersection, and the negative semidefiniteness of the
intersection matrix `(Cᵢ · Cⱼ)` of the components of the special fibre, whose kernel, for a
connected special fibre, is spanned by the multiplicity vector `(mᵢ)`
([Stacks Lemma 55.9.7](https://stacks.math.columbia.edu/tag/0C66)). For an
abstract numerical type the semidefiniteness is Tau Ceti's
`NumericalType.dotProduct_intersection_mulVec_nonpos` with
`NumericalType.dotProduct_intersection_mulVec_eq_zero_iff`.
*Needs:* §4.1, §2.5; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`,
`LineBundleClass.finrank_dvd_intersectionNumber`, `NumericalType.dotProduct_intersection_mulVec_nonpos`,
`NumericalType.dotProduct_intersection_mulVec_eq_zero_iff`.

**Checks.**
- Blow up `ℙ¹_R` at a `k`-rational closed point of the special fibre and then at the point where the
  two components meet: the special fibre is `C + E + 2F`, with `C² = E² = −2`, `F² = −1`,
  `C·F = E·F = 1`, `C·E = 0`. The matrix has `xᵀAx ≤ 0` with equality exactly on multiples of
  `(1, 1, 2)`; the opposite sign convention would make it positive semidefinite.

### 4.4 Resolution by normalized blowups

Prove the resolution theorem in the scope needed here: a normal proper model of a smooth curve over
a discrete valuation ring admits a regular proper model after a finite sequence of normalized
blowups in closed points (a blowup followed by normalization, after Lipman), and two regular proper
models admit a common resolution. Over a general, possibly non-excellent discrete valuation ring,
prove that the normalizations involved are finite; this holds here because the generic fibre is
smooth ([Stacks Lemma 55.8.3](https://stacks.math.columbia.edu/tag/0C2U),
[Proposition 55.8.6](https://stacks.math.columbia.edu/tag/0C2W)). Unrestricted resolution of
singularities is not cited as a black box.
*Needs:* §§4.1–4.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Tau Ceti
`Scheme.Hom.isFinite_fromNormalization_iff`, `TauCeti.Model`.

**Checks.**
- `R[x, y]/(xy − πⁿ)` with `n ≥ 2` is normal and not regular; its normalized blowups are the blowups
  of §4.2, already normal, and the resolution ends after `⌊n/2⌋` steps.

### 4.5 Exceptional curves and their contraction

Define exceptional curves of the first kind on a regular proper model: an integral component `E`
of the special fibre with `E ≅ ℙ¹_κ` for `κ = H⁰(E, 𝒪_E)` and `E · E = −[κ : k]`. Prove the
contraction theorem of Castelnuovo type for curves on arithmetic surfaces: such an `E` can be
contracted to a regular proper model, with the contraction an isomorphism away from `E`, preserving
properness and the generic-fibre identification
([Stacks Lemmas 54.16.8](https://stacks.math.columbia.edu/tag/0C2M) and
[54.16.11](https://stacks.math.columbia.edu/tag/0C5P)). Tau Ceti's descent of
morphisms along contractions (`Scheme.Hom.descOfIsQuotientMap`) and the numerical contraction of a
`(−1)`-index of a numerical type (`NumericalType.contract`) are the morphism-level and numerical
shadows.
*Needs:* §§4.1–4.3, §2.6; Tau Ceti `Scheme.Hom.descOfIsQuotientMap`, `NumericalType.IsMinusOneIndex`,
`NumericalType.contract`.

**Checks.**
- In the model `T₁T₂ − πT₀² = 0` of `ℙ²_R`, regular because it is locally `t₁t₂ = π` at the point
  where the two lines of the special fibre meet, each line has self-intersection `−1` and is
  exceptional; contracting either gives `ℙ¹_R`.

### Examples

- The chain of §4.2 for `n = 2`: one blowup of `xy = π²` gives a special fibre of three lines,
  the middle one a `(−2)`-curve, which is not exceptional and is not contracted.

### Dependencies

Layers 1–2 (the local structure of nodes, line bundles and relative `Proj`). Tau Ceti: blowups,
the node blowup, intersection numbers, numerical types, contraction descent.

## Layer 5: regular and minimal models

The special fibre of a model over a discrete valuation ring, its components, their multiplicities,
`div(π) = Σ mᵢ[Cᵢ]` and the effective Cartier subscheme `X_s`, and the projective closure of a
projective curve, are Tau Ceti's (supplier contracts).

### 5.1 Regular proper models and minimality

Construct a regular proper model of a smooth proper curve `C` over `K`, as stated in
`Suggested.lean` (`exists_regular_proper_model`): for `C` with `toK : C ⟶ Spec K` proper and smooth
of relative dimension one, there is a proper model of `C` over `R`, in the sense of `TauCeti.Model`,
whose total space has regular local rings. A proper curve over a field is projective
([Stacks tag 0A26](https://stacks.math.columbia.edu/tag/0A26)), the closure in `ℙᴺ_R` is a proper
model (Tau Ceti's `TauCeti.Model.projectiveClosure`), and §4.4 makes it regular
([Stacks Lemma 55.8.3](https://stacks.math.columbia.edu/tag/0C2U),
[Proposition 55.8.6](https://stacks.math.columbia.edu/tag/0C2W)). No connectedness hypothesis
enters: a disconnected smooth proper curve is a finite disjoint union of smooth projective curves,
and its model is the disjoint union of theirs. Define relative minimality of a regular proper model
by the absence of exceptional curves of the first kind (§4.5) in the special fibre.
*Needs:* §4.4, §4.5; Tau Ceti `TauCeti.Model`, `TauCeti.Model.IsProper`,
`TauCeti.Model.projectiveClosure`, `TauCeti.Model.isProper_projectiveClosure`,
`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`; Mathlib `IsRegularLocalRing`.

**Checks.**
- `ℙ¹_R` is a regular proper model of `ℙ¹_K` and is minimal: its special fibre is one line of
  self-intersection `0`. Its blowup at a `k`-rational closed point of the special fibre is regular
  and not minimal: the exceptional line has self-intersection `−1`.

### 5.2 Minimal models

Prove that every regular proper model contracts, by finitely many contractions of exceptional
curves (§4.5), to a minimal one. For a generic fibre of positive genus, prove that the minimal
regular model is unique up to unique isomorphism of models and is terminal among regular models:
every regular proper model maps to it by a unique morphism of models
([Stacks Lemmas 55.8.5](https://stacks.math.columbia.edu/tag/0CD9),
[55.10.1](https://stacks.math.columbia.edu/tag/0C6B) and
[55.10.2](https://stacks.math.columbia.edu/tag/0C9Z)).
Uniqueness of morphisms of models into a separated model is Tau Ceti's
`TauCeti.Model.subsingleton_hom`.
*Needs:* §5.1, §4.5, §4.4; Tau Ceti `TauCeti.Model.subsingleton_hom`, `TauCeti.Model.subsingleton_iso`.

### 5.3 The special fibre of a regular model

The components of the special fibre, their multiplicities `mᵢ`
(`AlgebraicGeometry.Scheme.Hom.specialFiberMultiplicity`), the divisor equality
`div_X(π) = Σ mᵢ[Cᵢ]` (`AlgebraicGeometry.Scheme.Hom.principalDivisor_eq_sum_specialFiber`) and the
identification of the special fibre with the effective Cartier subscheme cut out by `π`
(`TauCeti.isEffectiveCartier_ker_specialFiberι_of_isDiscreteValuationRing`) are Tau Ceti's. Prove
the intersection relations `Σⱼ (Cᵢ · Cⱼ) mⱼ = 0` for every `i`
([Stacks Lemma 55.9.7](https://stacks.math.columbia.edu/tag/0C66)), adjunction for a component
`Cᵢ` of a regular proper model, `(Cᵢ · Cᵢ) + deg_k(ω_{X/R}|_{Cᵢ}) = −2χ_k(𝒪_{Cᵢ})` (Liu), and the
genus formula expressing the genus of the generic fibre through the `mᵢ`, the `(Cᵢ · Cⱼ)` and the
arithmetic genera of the `Cᵢ` ([Stacks Lemma 55.11.2](https://stacks.math.columbia.edu/tag/0CA3)).
Prove that a proper model whose special fibre is geometrically reduced and geometrically connected,
with geometrically smooth components and only ordinary nodes after algebraic closure, is a
prestable model (through Tau Ceti's `TauCeti.Model.prestableFamily_toBase_iff`), and give the
equivalent formulation with finite separable residue extensions at the singular points.
*Needs:* §4.3, §2.3, §2.2, §1.1; Tau Ceti `AlgebraicGeometry.Scheme.Hom.specialFiberMultiplicity`,
`AlgebraicGeometry.Scheme.Hom.principalDivisor_eq_sum_specialFiber`,
`TauCeti.isEffectiveCartier_ker_specialFiberι_of_isDiscreteValuationRing`,
`TauCeti.Model.prestableFamily_toBase_iff`.

**Checks.**
- In the special fibre `C + E + 2F` of §4.3's Check, the relations read `−2 + 0 + 2 = 0`,
  `0 − 2 + 2 = 0` and `1 + 1 − 2 = 0`; with all multiplicities taken to be one, the third would fail.
- Adjunction on the exceptional line `F ≅ ℙ¹_k`: `F² + deg ω|_F = −1 + (−1) = −2 = −2χ(𝒪_F)`.
- `ℙ¹_R` with one closed point of its special fibre removed is a model of `ℙ¹_K` whose special fibre,
  `ℙ¹_k` minus a point, is geometrically reduced, geometrically connected and smooth; the model is
  not proper, hence not prestable, so the criterion needs properness of the model.

### 5.4 Genus zero

Keep the genus-zero exception explicit: minimal regular models of a curve of genus zero need not be
unique. Formalize the two contractions of the model `T₁T₂ − πT₀² = 0` in `ℙ²_R` (§4.5's Check),
which give two minimal models `ℙ¹_R` not related by an isomorphism of models. The pointed
stabilization of Layer 9, not an unpointed uniqueness theorem, handles genus zero.
*Needs:* §4.5, §5.1.

**Checks.**
- In contrast, the model `T₁² + T₂² − πT₀² = 0` over `R = ℝ[[π]]` is regular with an irreducible
  singular special fibre, so it has no exceptional curve and is the unique minimal model of its
  generic fibre (Stacks, Example 55.15.1): non-uniqueness needs a split special fibre.

### Dependencies

Layer 4 (resolution, intersection theory, contraction), Layer 2 (dualizing sheaf, genus), Layer 1
(nodes). Tau Ceti: models, projective closure, special-fibre components, multiplicities and divisor.

## Layer 6: numerical types and Picard torsion

Abstract numerical types are Tau Ceti's `TauCeti.NumericalType`, exactly as in
[Stacks tag 0C6Z](https://stacks.math.columbia.edu/tag/0C6Z): a nonempty finite set of components
with positive integers `mᵢ`, `wᵢ`, nonnegative integers `gᵢ`, and a symmetric integer matrix
`A = (aᵢⱼ)` with nonnegative off-diagonal entries, whose graph is connected, with `Σⱼ aᵢⱼ mⱼ = 0`
and `wᵢ ∣ aᵢⱼ`. Tau Ceti proves the equivalence of graph connectedness with the source's
no-disconnected-cut condition, reindexing and equivalence of types, the signed genus
`g(T) = 1 + Σᵢ mᵢ(wᵢ(gᵢ − 1) − aᵢᵢ/2)` with `Σᵢ mᵢaᵢᵢ` even, the weighted Picard group `Pic(T)`, the
cokernel of `eᵢ ↦ Σⱼ (aᵢⱼ/wⱼ)eⱼ` ([Stacks tag 0C7H](https://stacks.math.columbia.edu/tag/0C7H)),
with its injection into the unweighted cokernel induced by `eⱼ ↦ wⱼeⱼ`, its rank one, its prime
torsion, the bounds by the first Betti number of the graph, the classification and boundedness of
minimal types, and the bound `dim_{𝔽_ℓ} Pic(T)[ℓ] ≤ g` for a type of genus `g ≥ 2` and every prime
`ℓ > 768g − 768` (supplier contracts). This layer attaches numerical types to models and runs the
Artin–Winters argument.

### 6.1 The numerical type of a regular model

For a regular proper model `X` of a smooth projective curve `C` over `K` with `H⁰(C, 𝒪_C) = K`,
with special-fibre components `Cᵢ`, set `κᵢ = H⁰(Cᵢ, 𝒪_{Cᵢ})`,
`wᵢ = [κᵢ : k]`, `gᵢ = dim_{κᵢ} H¹(Cᵢ, 𝒪_{Cᵢ})` and `aᵢⱼ = Cᵢ · Cⱼ`; these are arithmetic genera of
components over their constant fields, not the normalization genera of the geometric dual graph.
Prove that, with the multiplicities `mᵢ`, these data form a `TauCeti.NumericalType`, the
`wᵢ ∣ aᵢⱼ` axiom coming from Tau Ceti's `LineBundleClass.finrank_dvd_intersectionNumber` and the
relation `Σⱼ aᵢⱼmⱼ = 0` from §5.3. Identify its signed genus `TauCeti.NumericalType.arithmeticGenus`
with the genus of `C` ([Stacks Lemma 55.11.3](https://stacks.math.columbia.edu/tag/0CA4) and
[Definition 55.11.4](https://stacks.math.columbia.edu/tag/0CA5)). The genus is computed once on the
whole sum, never by dividing each diagonal term in `ℤ` or truncating to `ℕ`: abstract numerical
types can have negative genus.
*Needs:* §§5.3, 4.3, 2.2; Tau Ceti `TauCeti.NumericalType`, `TauCeti.NumericalType.arithmeticGenus`,
`LineBundleClass.finrank_dvd_intersectionNumber`, `AlgebraicGeometry.Scheme.Hom.specialFiberMultiplicity`.

**Checks.**
- The model of §4.3's Check has the type `m = (1, 1, 2)`, `w = (1, 1, 1)`, `g = (0, 0, 0)` and
  `A = [[−2, 0, 1], [0, −2, 1], [1, 1, −1]]`, with
  `g(T) = 1 + 0 + 0 + 2·(−1 + 1/2) = 0`, the genus of `ℙ¹_K`.
- `m = (1, 1)`, `w = (1, 1)`, `g = (0, 0)`, `A = [[−1, 1], [1, −1]]` (the model `T₁T₂ − πT₀²` of
  §4.5) has odd diagonal entries and `g(T) = 1 + 2·(−1 + 1/2) = 0`; halving each diagonal entry in
  `ℤ` with rounding down would give `1`.

### 6.2 Line bundles on the model and specialization

Compare line bundles on the regular model, its generic fibre, its special fibre, the reduced special
fibre and the numerical type. Prove the specialization maps and exact sequences required to inject
enough `ℓ`-torsion of the Picard group of the generic fibre into the Picard group of the reduced
special fibre, for `ℓ` different from the residue characteristic. Bound the `ℓ`-torsion of the
Picard group of the reduced special fibre `Y = (X_k)_red`, a proper scheme of dimension one over
`k`: `dim_{𝔽_ℓ} Pic(Y)[ℓ] ≤ dim_k H¹(Y, 𝒪_Y) + g_geom(Y/k)`, where `g_geom(Y/k)` is the sum of the
genera of the normalizations of the one-dimensional irreducible components of `Y_k̄`
([Stacks Lemma 53.18.6](https://stacks.math.columbia.edu/tag/0CE6)). When `Y_k̄` is nodal the
right-hand side is twice the sum of those genera plus the first Betti number of the dual graph of
§1.4.
*Needs:* §6.1, §5.3, §1.4, §2.5; Tau Ceti `TauCeti.NumericalType.Pic`,
`TauCeti.NumericalType.torsion`, `TauCeti.AlgebraicGeometry.LineBundleClass`.

### 6.3 Full `ℓ`-torsion after a finite separable extension

Consume contracts J-D and J-E for `Pic⁰`, the multiplication isogeny and its finite étale kernel.
For a smooth projective curve of genus `g` over `K` and a prime `ℓ` different from the
characteristic of `K`, prove that there is a finite separable extension `K'/K` such that `C_{K'}`
has a `K'`-rational point and `Pic(C_{K'})[ℓ] ≅ (ℤ/ℓℤ)^{2g}`. The rational point is the descent
input for the torsion line bundles. Supply the explicit degree bound used by the source proof
(Stacks, Algebraic Curves, Lemma 53.17.2); no algebraically closed field is assumed.
*Needs:* contracts J-D, J-E; Tau Ceti `TauCeti.FiniteDVRExtension.exists_algEquiv_extensionField`.

### 6.4 The numerical conclusion

Prove the numerical conclusion: for `g ≥ 2` and a prime `ℓ > 768g` different from the residue
characteristic (the Stacks proof's choice), a minimal regular model of a smooth projective curve
`C` of genus `g` with `H⁰(C, 𝒪_C) = K`, a `K`-rational point and `Pic(C)[ℓ] ≅ (ℤ/ℓℤ)^{2g}` has
special-fibre components of multiplicity one that are geometrically smooth, and an at-worst-nodal
special fibre ([Stacks, genus at least two](https://stacks.math.columbia.edu/tag/0CEI)). The
rational point supplies, through the closed point of its section, a smooth `k`-point of the special
fibre on a component of multiplicity one
([Stacks Lemma 55.11.7](https://stacks.math.columbia.edu/tag/0CE8)). The combinatorial input is
Tau Ceti's `NumericalType.IsMinimal.finrank_torsion_le_topologicalGenus_of_lt`,
`dim_{𝔽_ℓ} Pic(T)[ℓ] ≤ g_top` for the minimal numerical type `T` of the model, `g_top` being the
first Betti number of its intersection graph, with
`NumericalType.IsMinimal.multiplicity_mul_abs_intersection_le` and
`NumericalType.exists_chain_or_fork_or_exceptional`. The bound by `g_top`, not by `g`, is what
forces `mᵢ = 1`: through §6.2 it gives `2g − g_top ≤ dim_k H¹((X_k)_red, 𝒪) + g_geom`, and with
`g ≥ dim_k H¹((X_k)_red, 𝒪) ≥ g_top + g_geom` every inequality becomes an equality.
*Needs:* §§6.1–6.3, §5.2; Tau Ceti
`NumericalType.IsMinimal.finrank_torsion_le_topologicalGenus_of_lt`,
`NumericalType.IsMinimal.multiplicity_mul_abs_intersection_le`,
`NumericalType.exists_chain_or_fork_or_exceptional`.

### Examples

- Weighted numerical Picard group (Tau Ceti's `NumericalType.twoComponentWeightTwoExample`):
  `m = (1, 1)`, `w = (2, 2)`, `g = (1, 1)`, `A = [[−2, 2], [2, −2]]` satisfies every axiom and has
  `g(T) = 3`; the weighted relations are `(−1, 1)` and `(1, −1)`, so `Pic(T) ≅ ℤ`, while the raw
  cokernel of `A` is `ℤ ⊕ ℤ/2ℤ`: no spurious two-torsion enters `Pic(T)`. With `w = (1, 2)` and the
  same `m`, `g`, `A`, the first weighted relation is `(−2, 1)`, fixing division by the destination
  weight (division by the source weight would give `(−2, 2)`).
- A type of negative genus: one component with `m = 1`, `w = 2`, `g₁ = 0`, `a₁₁ = 0` satisfies every
  axiom and has `g(T) = 1 + 2·(0 − 1) = −1`.

### Dependencies

Layers 2, 4 and 5; contracts J-D and J-E. Tau Ceti: numerical types, their Picard groups, torsion
bounds, classification and boundedness.

## Layer 7: semistable reduction

Nodal reduction is Tau Ceti's `TauCeti.HasNodalReduction R K C toK`: the curve `C` over `K` has a
proper model over `R` whose structure morphism is at worst nodal of relative dimension one. This is
the reduction predicate of Stacks Chapter 55, not the semistable families of Layer 3; the theorems
below produce a finite DVR extension `E` for which nodal reduction holds over `E.localRing`, and
nodal reduction persists under further finite DVR extension (`TauCeti.HasNodalReduction.baseChange`).
Throughout, `C` is a smooth projective curve over `K` with `H⁰(C, 𝒪_C) = K`, the hypothesis of
[Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDN); for a smooth proper curve this
is geometric integrality, and a proper curve over a field is projective
([Stacks tag 0A26](https://stacks.math.columbia.edu/tag/0A26)).

### 7.1 Genus zero

Nodal reduction in genus zero after a separable extension of degree at most two is Tau Ceti's
`TauCeti.HasNodalReduction.exists_finrank_le_two_of_genus_eq_zero`. Prove it with the source's
conclusion stated explicitly: there is a finite DVR extension `E` with `[K' : K] ≤ 2` such that
`C_{K'} ≅ ℙ¹_{K'}` and `C_{K'}` has nodal reduction over `E.localRing`, its model being `ℙ¹` over
`E.localRing` ([Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDN) (1)). Tau Ceti's
`AlgebraicGeometry.Scheme.exists_finrank_le_two_and_iso_projectiveLine_of_genus_eq_zero` gives the
isomorphism without the place.
*Needs:* Tau Ceti `TauCeti.HasNodalReduction.exists_finrank_le_two_of_genus_eq_zero`,
`AlgebraicGeometry.Scheme.exists_finrank_le_two_and_iso_projectiveLine_of_genus_eq_zero`,
`TauCeti.HasNodalReduction.projectiveLine`.

**Checks.**
- The conic `T₁² + T₂² = πT₀²` over `K = ℝ((π))` has no `K`-point, since a sum of two squares in
  `ℝ((π))` has even valuation; over `K(i)` it has the point `(0 : 1 : i)` and becomes `ℙ¹`. The
  degree bound `2` is attained.

### 7.2 Genus one

Prove nodal reduction in genus one after a finite separable extension `K'/K`, at every place of
`K'` above `R`: the special fibre of the minimal regular model over the local ring at that place is
either a smooth genus-one curve or a cycle of rational curves
([Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDN) (2)).
*Needs:* §§5.1–5.3, §6.1; Tau Ceti `TauCeti.HasNodalReduction`, `TauCeti.FiniteDVRExtension`,
`NumericalType.IsMinimal.isGenusOneMinimalShape`.

**Checks.**
- `y² = x³ + π` over a discrete valuation ring of residue characteristic not `2` or `3` has a cuspidal
  special fibre; over `K(π^{1/6})`, with `x = π^{1/3}X`, `y = π^{1/2}Y`, it becomes `Y² = X³ + 1`,
  which has good reduction.

### 7.3 Genus at least two, with the uniform bound

Prove nodal reduction in genus `g ≥ 2` by Layers 5–6: if `C` is smooth, proper and geometrically
integral over `K` of genus `g ≥ 2`, and `768g < ℓ' < ℓ` are the first two primes larger than `768g`,
there is a finite DVR extension `E` with `[K' : K] ≤ B_g = (2g − 2)(ℓ^{2g})!` over which `C_{K'}`
has nodal reduction ([Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDN) (3) with
equation 55.18.0.1). The proof uses the Jacobian only through the `ℓ`-torsion of `Pic⁰` supplied by
contracts J-D and J-E (§6.3); no notion of reduction of an abelian variety enters. With §§7.1–7.2
this gives nodal reduction after a finite DVR extension in every genus, for `C` smooth, proper and
geometrically integral over `K`.
*Needs:* §§6.1–6.4, §§5.1–5.2; Tau Ceti `TauCeti.HasNodalReduction`, `TauCeti.FiniteDVRExtension`,
`AlgebraicGeometry.Scheme.genus`.

**Checks.**
- For `g = 2` the two primes are `ℓ' = 1543` and `ℓ = 1549`, so `B₂ = 2·(1549⁴)!`; reading `ℓ` as
  the first prime above `768g` would give `2·(1543⁴)!`.

### 7.4 The simultaneous form

Prove the simultaneous form of §§7.1–7.3, as stated in `Suggested.lean`: for `C` smooth, proper
and geometrically integral over `K` there is a finite separable extension `K'/K` such that `C_{K'}`
has nodal reduction over the localization of the integral closure of `R` in `K'` at every maximal
ideal above the maximal ideal of `R`, each such localization being a finite DVR extension
(`TauCeti.FiniteDVRExtension.of`); this is `exists_hasNodalReduction`. For `g ≥ 2` and `ℓ` as in
§7.3, such a `K'` exists with `[K' : K] ≤ B_g`; this is `exists_hasNodalReduction_of_two_le_genus`
([Stacks Theorem 55.18.1](https://stacks.math.columbia.edu/tag/0CDN) (1)–(3)). In genus zero the
model `ℙ¹` of §7.1 serves at every place, and §7.2 is already stated at every place. In genus at
least two, derive the form from the hypotheses of §6.4, a `K'`-rational point and full `ℓ`-torsion
over `K'`, which depend only on `K'` and hence hold at every place above `R`, rather than from the
single-place statement of §7.3. Compatibility with further finite base extension is Tau Ceti's
`TauCeti.HasNodalReduction.baseChange`.
*Needs:* §§7.1–7.3, §§6.3–6.4; Tau Ceti `TauCeti.HasNodalReduction.baseChange`,
`TauCeti.FiniteDVRExtension.of`.

### Examples

- A smooth proper model of genus at least two witnesses nodal reduction over `R` itself
  (`TauCeti.HasNodalReduction.of_smooth_model`), with no extension.

### Dependencies

Layers 5–6; contracts J-D and J-E through §6.3. Tau Ceti: nodal reduction, its base change and
genus zero, finite DVR extensions.

## Layer 8: canonical contraction and unpointed stable reduction

The combinatorics of stabilization (contracting rational tails and bridges on an abstract dual
graph, termination, preservation of genus and independence of the order) is Tau Ceti's. This layer
realizes it on curves and in families and proves the classical stable reduction theorem
(Deligne–Mumford, Corollary 2.7; Stacks, [stable reduction](https://stacks.math.columbia.edu/tag/0E98)).

### 8.1 The canonical contraction over a field

Over a field, let `X` be a prestable curve of arithmetic genus at least two. Contract rational
tails repeatedly until none remain, proving termination by the strictly decreasing number of
geometric components and recomputing the dual graph after every contraction. On the resulting
tail-free curve prove global generation of `ω²` and `ω³` and the required cohomology vanishing;
then contract the rational bridges and identify the stable result with the `Proj` of the canonical
ring of the tail-free curve (Stacks [Lemma 53.23.6](https://stacks.math.columbia.edu/tag/0E3L) and
[Lemma 53.24.6](https://stacks.math.columbia.edu/tag/0E3Q)). Prove that the contraction
`c : X → Xˢᵗ` is characterized by its stable target, preservation of the genus, and `𝒪 ≅ c_*𝒪`,
`R¹c_*𝒪 = 0` ([Stacks Lemma 53.25.2](https://stacks.math.columbia.edu/tag/0E7Q)). On dual graphs
the steps are Tau Ceti's `DualGraph.StabilizationStep`, which decreases the number of vertices
(`DualGraph.StabilizationStep.card_vertex_lt`), preserves the arithmetic genus
(`DualGraph.arithmeticGenus_eq_of_reflTransGen`), reaches a stable graph
(`DualGraph.exists_reflTransGen_stabilizationStep_isStable`) and is independent of the order of
the steps (`DualGraph.nonempty_iso_of_reflTransGen_of_isStable`).
*Needs:* §§3.1–3.2; §§1.4–1.5, §§2.1–2.4, §2.6; Tau Ceti `DualGraph.StabilizationStep`,
`DualGraph.StabilizationStep.card_vertex_lt`, `DualGraph.arithmeticGenus_eq_of_reflTransGen`,
`DualGraph.exists_reflTransGen_stabilizationStep_isStable`,
`DualGraph.nonempty_iso_of_reflTransGen_of_isStable`.

**Checks.**
- Attach a rational component `E` to a smooth genus-two curve `C₀` and two unmarked rational leaves
  `T₁`, `T₂` to `E`. Initially `deg ω|_E = −2 + 3 = 1` and `deg ω|_{Tᵢ} = −1`; after both leaves
  are deleted, `E` has one special flag, `deg ω|_E = −1`, and `E` is contracted too, leaving `C₀`.
  A stabilization that tested only the initial degrees would keep `E`.
- Two smooth genus-one curves joined by a rational bridge contract to the two curves meeting in one
  node; a smooth genus-two curve is its own canonical contraction.

### 8.2 Stabilization of prestable families

For a prestable family of genus `g ≥ 2` over a locally Noetherian scheme, construct its
stabilization by the following scheme-level route. Étale locally on the base, add finitely many
disjoint auxiliary sections through the smooth locus making the source pointed-stable; prove that
they exist by choosing separable smooth points on every geometric component, lifting them to
étale-local sections, and using openness of pointed stability (§3.4). Forget the auxiliary sections
one at a time with the single-marking contraction of §§3.8–3.10. Each step starts from a stable
pointed family, so its log-dualizing bundle is nef and its sufficiently high powers define an
actual morphism. The process terminates because the number of auxiliary markings decreases, and
the geometric fibre of the result is the iterated tail-and-bridge contraction of §8.1 (Behrend–Manin,
§3, Cases I and V).
*Needs:* §8.1; §§3.3–3.4, §§3.8–3.10; Tau Ceti
`TauCeti.AlgebraicGeometry.PointedPrestableFamily.reindex`.

### 8.3 Uniqueness and descent of the stabilization

Prove uniqueness among contractions with the geometric fibres of §8.1, using universal
`𝒪 ≅ c_*𝒪` and Tau Ceti's contraction descent `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`, so that the result is independent of the auxiliary
sections and their order. On overlaps of the étale cover the unique isomorphisms preserve the final
dualizing sheaf and satisfy the cocycle condition. Apply the effective descent of polarized schemes
and morphisms of §2.8 to obtain `C → Cˢᵗ → S` as schemes. Prove that the resulting family is
proper, flat, finitely presented and stable, and that the universal statements on `c_*𝒪` and
`R¹c_*𝒪` survive descent. This replaces the stack-descent step of
[Stacks tag 0E8A](https://stacks.math.columbia.edu/tag/0E8A); no moduli stack is an input.
*Needs:* §8.2; §2.8, §3.2; Tau Ceti `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`.

### 8.4 Stabilization on stable and tail-free families

Prove that stabilization is the identity on a family that is already stable and commutes
coherently with arbitrary base change
([Stacks Lemmas 109.23.4](https://stacks.math.columbia.edu/tag/0E8A) and
[109.23.5](https://stacks.math.columbia.edu/tag/0E8B)). For a family without rational tails,
identify the stabilization directly with the relative `Proj` of the pluricanonical algebra
`⊕_m f_*(ω^{⊗m})`, after proving relative generation and base change (over a field,
[Stacks Lemma 53.24.6](https://stacks.math.columbia.edu/tag/0E3Q)). An arbitrary prestable
family can have rational tails of negative degree, so its pluricanonical evaluation map is not the
construction.
*Needs:* §8.3; §2.1, §2.5, §2.6.

**Checks.**
- On a genus-two curve with a rational tail `T`, `deg ω|_T = −1`, so every section of `ω^{⊗m}`
  vanishes identically on `T` and `ω^{⊗m}` is globally generated for no `m ≥ 1`: the
  pluricanonical evaluation map is not surjective, and the construction goes through the auxiliary
  sections of §8.2.

### 8.5 Stable reduction

Prove the classical stable reduction theorem by nodal reduction (§7.3) followed by stabilization
(§§8.2–8.4): if `C` is a smooth, projective, geometrically connected curve over `K` of genus
`g ≥ 2`, there are a finite separable extension `K'/K`, a maximal ideal `𝔪'` of the integral
closure `R̃` of `R` in `K'` lying over the maximal ideal of `R`, and a stable family
`X → Spec(R̃_{𝔪'})` of genus `g`, together with an isomorphism from its generic fibre to `C_{K'}`
([Stacks Theorem 109.24.3(1)](https://stacks.math.columbia.edu/tag/0E98); Deligne–Mumford,
Corollary 2.7, state it over the integral closure of `R` in a finite extension, not asserted
separable). In Tau Ceti's vocabulary: a `TauCeti.FiniteDVRExtension R K`
`E` and a proper `TauCeti.Model` of the base change of `C` to `E.extensionField` over
`E.localRing` whose structure morphism is a stable family of genus `g`.
*Needs:* §§8.2–8.4; §7.3; §3.2; Tau Ceti `TauCeti.FiniteDVRExtension`, `TauCeti.Model`,
`TauCeti.Model.IsProper`.

**Checks.**
- Good reduction: if `C` already extends to a smooth proper family of genus at least two over `R`,
  that family is stable, and by §8.6 every stable model of `C` over `R` is isomorphic to it by a
  unique isomorphism extending the identity of `C`.

### 8.6 Uniqueness of stable models

Over a fixed discrete valuation ring `R`, two stable models of the same curve over `K`, each with
its identification of the generic fibre, are related by a unique isomorphism extending that
identification ([Stacks Lemma 109.24.2](https://stacks.math.columbia.edu/tag/0E97)): uniqueness in
the groupoid of models, not literal equality of schemes or of chosen pullbacks. Uniqueness of the
isomorphism is Tau Ceti's `TauCeti.Model.subsingleton_iso` (the
target of a model morphism being separated); the target is its existence. Route: extend the generic
isomorphism through a common regular model (§4.4), show both maps are the canonical stabilization
(§8.3), and obtain the isomorphism of models.
*Needs:* §8.3; §4.4, §5.1; Tau Ceti `TauCeti.Model`, `TauCeti.Model.subsingleton_iso`.

### 8.7 The unpointed stable-reduction interface

Package existence after a finite extension of discrete valuation rings (§8.5), uniqueness over a
fixed discrete valuation ring (§8.6), and compatibility after a common finite extension, through
Tau Ceti's `TauCeti.FiniteDVRExtension.nonempty_binaryCofan` and the base change of models
`TauCeti.Model.baseChangeFunctor`, as the input a moduli-stack development consumes. It is not
called `IsProper`: Mathlib's `AlgebraicGeometry.ValuativeCriterion` concerns morphisms of schemes,
whereas the moduli object is eventually a stack.
*Needs:* §§8.5–8.6; Tau Ceti `TauCeti.FiniteDVRExtension.nonempty_binaryCofan`,
`TauCeti.Model.baseChangeFunctor`; Mathlib `AlgebraicGeometry.ValuativeCriterion`.

### Examples

- The iterated tail of §8.1's Check, with retained markings on the genus-two component, and for a
  map constant on the whole attached tree (§11.6): the family construction and its base changes
  contract the entire tree despite the initial positive degree on `E`.

### Dependencies

Layers 1–5 and 7 for the inputs named above, Layer 3's single-marking contraction and Layer 2's
polarized descent. Layer 9 is not used. Tau Ceti: dual-graph stabilization, models, finite
extensions of discrete valuation rings.

## Layer 9: marked stabilization and stable pointed reduction

### 9.1 Extending the markings

Extension of a single `K`-point of the generic fibre to a section of a proper model is Tau Ceti's
`TauCeti.Model.existsUnique_section` (with `TauCeti.Model.extendSection` and the bijection
`TauCeti.Model.sectionEquiv`). Use finite base change and blowups to make the closures of distinct
generic markings pairwise disjoint and contained in the smooth locus, tracking the generic-fibre
identifications throughout.
*Needs:* §4.1; Tau Ceti `TauCeti.Model.existsUnique_section`,
`TauCeti.Model.extendSection`, `TauCeti.Model.sectionEquiv`, `TauCeti.Model.baseChange`.

**Checks.**
- On `ℙ¹_R` the sections through `0` and through `π` are distinct on the generic fibre and meet on
  the special fibre; blowing up the point where they meet separates them, and the special fibre
  becomes two lines meeting in a node.

### 9.2 Pointed stabilization

For an `n`-pointed prestable family with `2g − 2 + n > 0`, use the auxiliary-section construction
of §8.2, retaining all original markings and forgetting only auxiliary ones, and descend using the
final ample log-dualizing sheaf. Describe the geometric fibres by iteratively contracting rational
components with at most two current special flags: delete an unmarked tail, transfer the marking
of a one-marked tail to its attachment point, or replace an unmarked bridge by a node. Prove
termination, independence of the order, and that the remaining markings are disjoint and in the
smooth locus. A component of initially positive log-canonical degree can become unstable after
neighbouring tails are contracted. On dual graphs these are Tau Ceti's `DualGraph.StabilizationStep`
(whose tail contraction moves the marking to the attachment vertex),
`DualGraph.exists_reflTransGen_stabilizationStep_isStable` and
`DualGraph.nonempty_iso_of_reflTransGen_of_isStable`.
*Needs:* §§8.2–8.3; §3.3, §§3.8–3.10; Tau Ceti `DualGraph.StabilizationStep`,
`DualGraph.exists_reflTransGen_stabilizationStep_isStable`,
`DualGraph.nonempty_iso_of_reflTransGen_of_isStable`.

**Checks.**
- A component carrying one marking and attached at one point (a one-marked tail) is contracted and
  its marking moves to the attachment point; a component carrying two markings and attached at one
  point has three special flags and stays.

### 9.3 The log-canonical algebra of a single step

For each nef single-marking step, construct the graded log-canonical algebra with its
multiplication and base-change maps, and identify its `Proj` with that step's contraction using
§3.10. Semiampleness is not asserted on the original arbitrary prestable curve. Prove that the
composite stabilization preserves an already-stable marked generic fibre, is unique with the
stated fibrewise contraction property, and commutes coherently with base change.
*Needs:* §9.2; §§3.9–3.10, §2.5.

### 9.4 Stable pointed reduction

Let `C` be a smooth, projective, geometrically connected curve of genus `g` over `K` and
`p : Fin n → C(K)` an ordered family of pairwise distinct `K`-rational points, with
`2g − 2 + n > 0`; this includes `(g, n) = (0, n)` for `n ≥ 3` and `(1, n)` for `n ≥ 1`. Prove that
there are a finite separable extension `K'/K`, a maximal ideal of the integral closure of `R` in
`K'` above the maximal ideal of `R` with local ring `R'`, and a stable `n`-pointed family over
`R'` with an isomorphism from its generic fibre to `C_{K'}` carrying its sections to the points
`pᵢ`; and that over a fixed discrete valuation ring two stable pointed models are related by a
unique isomorphism extending the identification of their generic fibres (Knudsen II, Theorem 2.7,
p. 179, where the statement appears as properness of the stack of stable `n`-pointed curves).
*Needs:* §§9.1–9.3; §§7.1–7.3, §8.6; Tau Ceti `TauCeti.FiniteDVRExtension`, `TauCeti.Model`.

**Checks.**
- For four marked points on `ℙ¹_K` of which two collide modulo `π` (say `0, 1, ∞` and `π`), the
  stable limit is two lines meeting in one node, with `0, π` on one and `1, ∞` on the other.
- `(g, n) = (1, 0)` and `(0, 2)` are excluded: a smooth genus-one curve with no marking and `ℙ¹`
  with two markings have log-canonical degree zero and no stable model.

### 9.5 Stable pointed nodal generic fibres

Extend §9.4 from a smooth generic fibre to an already stable `n`-pointed nodal generic fibre: use
§1.3 to split and label its nodes, branches and components after one finite separable extension;
normalize; treat the paired branches as additional markings; apply §9.4 componentwise after one
common finite extension; and glue the paired sections with the clutching of §§3.6–3.7. Prove that
the glued family is nodal and stable and independent of all choices (Knudsen II, Theorem 2.7,
p. 179, where the statement is part of properness of the stack of stable `n`-pointed curves,
whose points include nodal curves). The numerical bookkeeping is Tau Ceti's
`DualGraph.cutComponent` with `DualGraph.forall_isStable_cutComponent_iff`.
*Needs:* §9.4; §1.3, §§3.6–3.7; Tau Ceti `DualGraph.cutComponent`,
`DualGraph.forall_isStable_cutComponent_iff`,
`TauCeti.FiniteDVRExtension.nonempty_binaryCofan`.

### 9.6 Forgetting a marking

Forgetting a marking without contraction is Tau Ceti's `PointedPrestableFamily.reindex`, which
commutes with base change (`PointedPrestableFamily.reindex_pullback`). Develop forgetting a
marking followed by pointed stabilization (§9.2) and prove its compatibility with base change and
the coherence of repeated forgetting.
*Needs:* §9.2; Tau Ceti `PointedPrestableFamily.reindex`, `PointedPrestableFamily.reindex_pullback`.

### 9.7 The stable pointed reduction interface

Express §§9.4–9.5 as essential existence after a finite extension of discrete valuation rings and
unique extension over a fixed discrete valuation ring, with compatibility after a common finite
extension as in §8.7. This is the input a properness proof for the moduli of stable pointed curves
and of stable maps consumes; the moduli objects themselves are outside this roadmap.
*Needs:* §§9.4–9.5, §8.7.

### Examples

- The collision of four points on `ℙ¹` in §9.4's Check is the pointed analogue of §8.5: its special
  fibre is the external clutching of two copies of `(ℙ¹; 0, 1, ∞)` (§3.7).

### Dependencies

Layers 3, 4, 7 and 8 as named above. Tau Ceti: section extension on proper models, forgetting
markings, dual-graph stabilization and cutting.

## Layer 10: stable maps and their stability condition

This layer depends on the pointed prestable curves of Layer 3 and on the positivity of Layer 2, not
on the stable-reduction layers. Prestable maps are Tau Ceti's
`TauCeti.AlgebraicGeometry.PrestableMap q n` for a target `q : V ⟶ S`: a pointed prestable family
`curve : PointedPrestableFamily S n`, a morphism `map : curve.total ⟶ V` and the equation
`map ≫ q = curve.toBase`, with the projection `PrestableMap.toCurve` to the source family, pullback
along `S' ⟶ S` independent of the chosen pullbacks up to canonical isomorphism
(`PrestableMap.pullback`, `PrestableMap.isoPullback`, `PrestableMap.pullbackCompIso`), its category
of morphisms over a fixed target (`PrestableMap.category`), postcomposition with a morphism of
targets (`PrestableMap.postcompFunctor`), reindexing of markings (`PrestableMap.reindex`) and the
evaluation morphisms `PrestableMap.ev`, `sᵢ ≫ F : S ⟶ V`, with their compatibilities (supplier
contracts). Source stability is not a field of a prestable map (§10.5) (Behrend–Manin;
Fulton–Pandharipande).

### 10.1 Automorphisms and infinitesimal automorphisms

Isomorphisms of prestable maps over a fixed target are the isomorphisms of Tau Ceti's
`PrestableMap.category`, isomorphisms of pointed source curves commuting with the maps; the
automorphism group of `F` is `CategoryTheory.Aut F`, embedded in that of the source by
`PrestableMap.autToCurve` with image described by `PrestableMap.mem_range_autToCurve_iff`, and the
infinitesimal automorphisms over `Spec A` are `PrestableMap.infinitesimalAut`, the automorphisms of
the base change to `A[ε]/(ε²)` reducing to the identity modulo `ε`
(`PrestableMap.mem_infinitesimalAut_iff`). Prove that pullback along an isomorphism of bases is an
equivalence of categories, compatibly with the transport along target isomorphisms that
`PrestableMap.postcompFunctor` gives. For a separated locally finitely presented target, define
the abstract automorphism group of each geometric fibre, `CategoryTheory.Aut` of the pullback of
`F` to `Spec Ω` for an algebraically closed field `Ω`. Over an algebraically closed field `k`,
identify the infinitesimal automorphisms with the kernel of the map from the global `k`-derivations
of `𝒪_C` that vanish along the markings to the derivations from `F⁻¹𝒪_V` to `𝒪_C`, induced by
precomposition with `F^#`. Representability of relative Isom and Aut is outside this roadmap.
*Needs:* Tau Ceti `PrestableMap.category`, `PrestableMap.autToCurve`,
`PrestableMap.mem_range_autToCurve_iff`, `PrestableMap.infinitesimalAut`,
`PrestableMap.mem_infinitesimalAut_iff`, `PrestableMap.pullbackFunctor`,
`PrestableMap.postcompFunctor`; Mathlib `KaehlerDifferential`, `Derivation`.

**Checks.**
- The identity `ℙ¹_k → ℙ¹_k` with no markings has trivial automorphism group: an automorphism
  `σ` of the source with `id ∘ σ = id` is the identity. The same source with the constant map has
  automorphism group `PGL₂(k)`, of positive dimension.
- For the constant map from `(ℙ¹; 0, ∞)`, the derivation `t ∂/∂t` vanishes at both markings and
  is killed by precomposition with `F^#` (whose image consists of constants): it is a nonzero
  infinitesimal automorphism.

### 10.2 Contracted components

Contracted components are Tau Ceti's `PrestableMap.IsContractedComponent`: an irreducible
component of the total space on which `F` has a one-point image. Tau Ceti relates this to the
closure of the image having dimension zero
(`PrestableMap.isContractedComponent_iff_topologicalKrullDim_closure_eq_zero`) and to constancy of
the restricted morphism (`PrestableMap.isContractedComponent_iff_exists_subschemeι_comp_eq_section`
over an algebraically closed field), and proves invariance under field extension
(`PrestableMap.isContractedComponent_pullback_iff`), under target isomorphisms and closed immersions
(`PrestableMap.isContractedComponent_postcomp_iff`), and that a contracted component has degree zero
for every line-bundle class on the target (`PrestableMap.IsContractedComponent.componentDegree_eq_zero`).
Prove the converse when the target `V` carries an ample invertible sheaf `L`: over an
algebraically closed field, a component on which `F^*L` has degree zero is contracted.
*Needs:* Tau Ceti `PrestableMap.IsContractedComponent`,
`PrestableMap.IsContractedComponent.componentDegree_eq_zero`, `PrestableMap.componentDegree`;
§2.6.

**Checks.**
- For the double cover `ℙ¹ → ℙ¹`, `t ↦ t²`, and `L = 𝒪(1)`, the component degree is `2 > 0` and
  the component is not contracted; for a constant map every component has degree `0` and is
  contracted (`PrestableMap.isContractedComponent_const_iff`).

### 10.3 The stability condition

Define the predicate *stable map* on prestable maps fibrewise: on every geometric fibre, every
contracted irreducible component `E` has positive log-canonical degree
`2g(Ẽ) − 2 + #(special flags of E) > 0`, with normalization genus and special flags as in
Convention 6 (Behrend–Manin, Definition 3.2(3), p. 14; over `ℂ`, Fulton–Pandharipande, §1.1,
p. 11). Prove invariance under isomorphism and stability under arbitrary base change for every
target. For a projective target with a
relatively ample invertible sheaf `L` over a locally Noetherian base, identify stability with
fibrewise ampleness of `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)` and apply the openness of ampleness of §2.7:
stability is open on the base. Openness for general separated locally finitely presented targets is
outside this roadmap; it is not inferred from the finite-automorphism criterion of §10.4.
*Needs:* §10.2; §3.3; §1.4, §2.4, §2.6, §2.7.

**Checks.**
- The identity `ℙ¹ → ℙ¹` with no markings is a stable map although its source is not a stable
  pointed curve: no component is contracted. The constant map from the same source is not stable
  (`deg = −2`), while the constant map from `(ℙ¹; 0, 1, ∞)` is.
- Attach an unmarked rational tail to a stable pointed source. A map constant on the tail is not
  stable (the tail has log-canonical degree `−1`); a map of degree `d ≥ 1` on the tail can be
  stable, and there `deg(ω(Σpᵢ) ⊗ F^*L^3)|_tail = −1 + 3d > 0`.

### 10.4 Characterizations of stability

For a separated locally finitely presented target prove: `F` is stable exactly when every
geometric fibre has a finite abstract automorphism group. Under generic separability of `F|_E` onto
its image for every noncontracted geometric component `E`, prove in addition that infinitesimal
automorphisms vanish; when a representing automorphism scheme is built downstream, this is its
unramifiedness. Without generic separability only finiteness is claimed. For a projective target
with a relatively ample invertible sheaf `L`, prove that stability is equivalent to relative
ampleness of `ω_{C/S}(Σsᵢ) ⊗ F^*(L^⊗3)`, independent of `L`, and the same for every exponent at least
three. The numerical shadow of the independence statements is Tau Ceti's
`DualGraph.DegreeDecoration.isStable_congr` and `DualGraph.DegreeDecoration.isStable_smul_iff`.
*Needs:* §§10.1–10.3; §3.5; §2.6; Tau Ceti `DualGraph.DegreeDecoration.isStable_congr`,
`DualGraph.DegreeDecoration.isStable_smul_iff`.

**Checks.**
- In characteristic `p`, the relative Frobenius `ℙ¹ → ℙ¹` with no markings is stable (no
  contracted component) with trivial automorphism group, but it is not generically separable, and
  the derivation `∂/∂t` of the source is killed by `F^#` (whose image lies in `k[tᵖ]`): it has
  nonzero infinitesimal automorphisms, so finiteness is all that holds without separability.
- With `L = 𝒪(1)` on `ℙ¹` and exponent `2` in place of `3`, the identity map of `ℙ¹` with no
  markings gives `deg(ω ⊗ L²) = −2 + 2 = 0`, not ample, although the map is stable: the exponent
  must be at least three.

### 10.5 Constant maps

Prove that a constant prestable map (Tau Ceti's `PrestableMap.const`) is stable exactly when its
pointed source is stable, and that a nonconstant map may be stable when its pointed source is not;
this is an API theorem, not a field of the structure. Its numerical shadow is Tau Ceti's
`DualGraph.DegreeDecoration.isStable_zero_iff`.
*Needs:* §10.3, §3.3; Tau Ceti `PrestableMap.const`, `PrestableMap.isContractedComponent_const_iff`,
`DualGraph.DegreeDecoration.isStable_zero_iff`.

### Examples

- Stable maps versus stable sources: the identity of `ℙ¹` and the constant maps from `ℙ¹` and from
  `(ℙ¹; 0, 1, ∞)` of §10.3's Check.

### Dependencies

Layer 3 (pointed prestable curves, automorphisms), Layer 2 (degrees, ampleness and its openness),
Layer 1 (dual graphs). Tau Ceti: prestable maps, their category, automorphisms, infinitesimal
automorphisms, contracted components and degrees.

## Layer 11: basic stable-map API and map-aware stabilization

Evaluation maps with their compatibilities, reindexing of markings and postcomposition are Tau
Ceti's (supplier contracts); so are the degree-decorated dual graphs with their stability, clutching,
cutting and stabilization combinatorics. This layer connects them to actual maps and builds the
family-level constructions (Behrend–Manin, §3).

### 11.1 The polarization degree

The degree of a prestable map over a field and its degree on an irreducible component are Tau
Ceti's `PrestableMap.degree` and `PrestableMap.componentDegree`: the degree of `F^*L`, and of its
restriction to the reduced component, for `L` a line-bundle class on the target; the total degree is
invariant under field extension (`PrestableMap.degree_pullback`) and isomorphism. For a relatively
ample `L`, prove nonnegativity of every component degree, additivity of the total degree over the
irreducible components of a nodal curve, invariance of component degrees under extension of
algebraically closed fields, and local constancy of the total degree in a connected family. The
polarization degree is the numerical invariant of record in this roadmap.
*Needs:* Tau Ceti `PrestableMap.degree`, `PrestableMap.componentDegree`,
`PrestableMap.degree_pullback`; §1.3 (normalization), §2.1, §2.4.

**Checks.**
- For `F : ℙ¹ → ℙ²` a conic and `L = 𝒪(1)`, the degree is `2`. For `F` from two lines meeting in
  one node, mapping one line isomorphically to a line of `ℙ²` and contracting the other, the
  component degrees are `1` and `0` and the total degree is `1`; nonnegativity fails for a
  non-ample `L = 𝒪(−1)`.

### 11.2 The decorated dual graph of a map

Decorate the dual graph of a geometric fibre (§1.4) with marking legs and the component degrees of
§11.1, as a Tau Ceti `TauCeti.DualGraph.DegreeDecoration`. Prove the genus and total-degree
formulas for an actual map. A degree-zero vertex is stable exactly when
`2g_v − 2 + val(v) + markings(v) > 0`, and a positive-degree vertex is automatically stable
(Behrend–Manin, Definition 1.9, p. 6);
equivalently, for a chosen polarization, `2g_v − 2 + val(v) + markings(v) + 3d_v > 0` at every
vertex, with valence counting half-edges so that a loop counts twice. On abstract decorated graphs
these are Tau Ceti's `DualGraph.DegreeDecoration.IsStable`,
`DualGraph.DegreeDecoration.isStable_iff_weightedLogCanonicalDegree_pos` and
`DualGraph.DegreeDecoration.sum_weightedLogCanonicalDegree`; the target is that the decorated graph
of a stable map is stable in this sense, and the converse. Develop restriction to a component,
normalization at a node and reconstruction of the numerical data, matching Tau Ceti's
`DualGraph.DegreeDecoration.cutComponent`.
*Needs:* §§10.2–10.3, §11.1; §1.4; Tau Ceti `TauCeti.DualGraph.DegreeDecoration`,
`DualGraph.DegreeDecoration.IsStable`,
`DualGraph.DegreeDecoration.isStable_iff_weightedLogCanonicalDegree_pos`,
`DualGraph.DegreeDecoration.sum_weightedLogCanonicalDegree`,
`DualGraph.DegreeDecoration.cutComponent`.

**Checks.**
- A loop counts twice: the nodal rational curve of degree `0` has one vertex of genus `0` and
  valence `2`, so `2·0 − 2 + 2 = 0` and it is not stable; counting the loop once would give `−1`
  and the same verdict, but for one marking the right count gives `1 > 0` (stable) and the wrong
  one `0`.

### 11.3 Contraction descent for maps

Specialize Tau Ceti's contraction descent `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed` to proper surjective contractions `c : C → C'` of
prestable curves with universally connected genus-zero fibres and `𝒪_{C'} ≅ c_*𝒪_C`: for separated
`V → S`, a map constant on each contracted subcurve factors uniquely through `c`, compatibly with
base change.
*Needs:* §3.10; Tau Ceti `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`.

### 11.4 The single-marking contraction for maps

Reindexing markings by equivalences is Tau Ceti's `PrestableMap.reindex`. For a projective target
with relatively ample `L` and a stable map with `n > 0` markings, genus `g` and `L`-degree `d`,
put `n' = n − 1` and construct the single-marking contraction when `2g − 2 + n' + 3d > 0`, following
[Behrend–Manin, Proposition 3.10 and Lemmas 3.11–3.12](https://arxiv.org/pdf/alg-geom/9506023#page=22).
Set `A = ω_{C/S}(Σ retained sᵢ) ⊗ F^*(L^⊗3)`. Prove it nef on each fibre, with zero-degree
components exactly the `F`-constant rational components with two remaining flags that contain the
forgotten marking; starting from a stable map there is at most one such component per fibre.
Construct its fibre contraction, prove descent of `F` and pullback of the resulting ample `A'`, then
locally uniform generation, vanishing and normal generation of high powers of `A`. Use the
resulting base-change-compatible Veronese algebra to construct the relative `Proj` morphism, and
prove flatness, nodality, the universal structure-sheaf identities and smooth disjoint retained
sections as in §3.10. Components of positive map degree are never contracted. The numerical
existence criterion depends only on whether `d = 0`, hence is independent of `L`; the excluded
resulting types are `d = 0` with `g = 0, n' ≤ 2`, and `d = 0` with `g = 1, n' = 0`. Use §11.3 to
prove that `F` descends uniquely, that the result is stable, and that base change and repeated
forgetting satisfy the canonical-isomorphism coherence of Convention 13.
*Needs:* §§11.1–11.3; §§3.8–3.10, §2.5, §2.6; Tau Ceti `PrestableMap.reindex`.

**Checks.**
- The constant map from two lines meeting in one node with two markings on each (Layer 3's pointed
  example): forget a marking on one line. That line now has two special flags and degree `0`, so it
  is contracted. With a map of positive degree on that line instead, the line remains after its last
  marking is forgotten, because the map is nonconstant there.
- The numerical criterion with `d = 0`, `g = 0`, `n' = 3` holds (`−2 + 3 > 0`); with `d = 0`,
  `g = 0`, `n' = 2` it fails, and with `d = 1`, `g = 0`, `n' = 0` it holds (`−2 + 3 > 0`).

### 11.5 Gluing stable maps

Define **external gluing** of stable maps of types `(g₁, I ⊔ {a}, d₁)` and `(g₂, J ⊔ {b}, d₂)` to
the same target, assuming `ev_a = ev_b` as morphisms `S ⟶ V`: the external clutching of §3.6
gives type `(g₁ + g₂, I ⊔ J, d₁ + d₂)`. Define **self-gluing** of type `(g, I ⊔ {a, b}, d)`, with
`a ≠ b` and `ev_a = ev_b`, yielding `(g + 1, I, d)`. In both cases descend the target map by the
pushout universal property; prove stability, the decorated-graph formula (Tau Ceti's
`DualGraph.DegreeDecoration.clutch` and `DualGraph.DegreeDecoration.selfClutch` with
`DualGraph.DegreeDecoration.totalDegree_clutch` and `DualGraph.DegreeDecoration.totalDegree_selfClutch`),
reindexing by the specified marking-set equivalences, and coherent base change.
*Needs:* §§3.6–3.7, §11.2; Tau Ceti `PrestableMap.ev`, `DualGraph.DegreeDecoration.clutch`,
`DualGraph.DegreeDecoration.selfClutch`, `DualGraph.DegreeDecoration.totalDegree_clutch`,
`DualGraph.DegreeDecoration.totalDegree_selfClutch`, `DualGraph.DegreeDecoration.isStable_clutch_iff`,
`DualGraph.DegreeDecoration.isStable_selfClutch_iff`.

**Checks.**
- External gluing adds genera and degrees, self-gluing adds one to the genus and leaves the degree
  unchanged: gluing two lines of `ℙ²` (types `(0, {a}, 1)` and `(0, {b}, 1)`) at a common point
  gives a map of type `(0, ∅, 2)` from two lines meeting in a node; self-gluing a degree-two map
  from `ℙ¹` onto a line of `ℙ²`, of type `(0, {a, b}, 2)`, at two points with the same image gives
  type `(1, ∅, 2)`.
- With `ev_a ≠ ev_b` the pushout exists but the target maps do not descend: neither construction
  applies.

### 11.6 Map-aware stabilization

For a projective target with relatively ample `L`, map degree `d` and `2g − 2 + n + 3d > 0`,
construct the stabilization of an arbitrary prestable map by adding auxiliary smooth markings étale
locally until it is stable, then forgetting only those markings with §11.4. The geometric fibre
algorithm iteratively contracts `F`-constant rational components with at most two current flags,
recomputing flags after each step; prove termination by component count, independence of the order
of contraction, and agreement with the family construction. In families the auxiliary-marking
procedure terminates by marking count. Descend the final target map and polarized source using the
final ample log-dualizing map bundle and the polarized descent of §2.8; relative `Proj` is not
applied directly to the initial bundle, which can have negative degree on constant rational tails.
Prove the universal property for morphisms contracting the specified subcurves, uniqueness,
independence from the auxiliary markings and from `L`, coherent base change and the identity on an
already stable map, and that the excluded degree-zero types of genus zero and one admit no stable
map. The fibre algorithm on decorated graphs is Tau Ceti's
`DualGraph.DegreeDecoration.StabilizationStep`, with
`DualGraph.DegreeDecoration.exists_reflTransGen_stabilizationStep_isStable` and
`DualGraph.DegreeDecoration.exists_iso_of_reflTransGen_of_isStable`.
*Needs:* §§11.2–11.4; §8.2, §2.8; Tau Ceti `DualGraph.DegreeDecoration.StabilizationStep`,
`DualGraph.DegreeDecoration.exists_reflTransGen_stabilizationStep_isStable`,
`DualGraph.DegreeDecoration.exists_iso_of_reflTransGen_of_isStable`.

**Checks.**
- The genus-two curve with the tree `E, T₁, T₂` of §8.1's Check, mapped constantly on the tree and
  with positive degree on the genus-two component: the whole tree is contracted. If the map has
  positive degree on `T₁` instead, `T₂` is contracted first; then `E`, constant with the two
  remaining flags towards the genus-two curve and `T₁`, is a bridge of log-canonical degree `0` and
  is contracted too, while `T₁` stays: the result is the genus-two curve and `T₁` meeting in one
  node. Testing only the initial degrees would keep `E`.

### 11.7 Functoriality in the target

Postcomposition with a morphism of targets is Tau Ceti's `PrestableMap.postcomp`, full for a
monomorphism and an equivalence for an isomorphism of targets, and a target isomorphism or closed
immersion preserves contracted components (`PrestableMap.isContractedComponent_postcomp_iff`).
Prove that stability is preserved under target isomorphisms and closed immersions. For a general
postcomposition `V → W` prove a sharp criterion for preservation of stability instead of asserting
it unconditionally: the new map may contract additional source components
(`PrestableMap.IsContractedComponent.postcomp`).
*Needs:* §10.3; Tau Ceti `PrestableMap.postcomp`, `PrestableMap.postcompFunctor`,
`PrestableMap.isContractedComponent_postcomp_iff`, `PrestableMap.IsContractedComponent.postcomp`.

**Checks.**
- The identity `ℙ¹ → ℙ¹` is stable; postcomposed with the structure map `ℙ¹ → Spec k` it becomes
  the constant map, which is not stable: a general postcomposition does not preserve stability.

### Examples

- Forgetting a marking and evaluation and gluing: the Checks of §§11.4–11.5.

### Dependencies

Layers 2, 3, 8 and 10 as named above. Tau Ceti: evaluation maps, degrees, decorated dual graphs and
their clutching, cutting and stabilization, contraction descent, postcomposition.

## Downstream consumers

- The [elliptic-curves roadmap](../EllipticCurves/README.md) keeps `ReductionSymbol`, the output
  type of Tate's algorithm, as a combinatorial symbol until a geometric comparison exists. Layer 5
  supplies the minimal regular model that comparison is made with, and
  [NeronModelsAndSemistableAbelianVarieties](../NeronModelsAndSemistableAbelianVarieties/README.md)
  §2.8 (`KodairaConfiguration`) identifies its special fibre with the configuration attached to the
  symbol.
- NeronModelsAndSemistableAbelianVarieties consumes Layers 0–7: models, nodes, dual graphs,
  intersection theory, regular and minimal models, numerical types, and nodal reduction after a
  finite separable extension.

## Scope and ownership

**This roadmap owns** the scheme-level theory of stable reduction of curves over a discrete
valuation ring and of stable maps, as specified above: the sheaf-theoretic groundwork for
differentials and normalization (Layer 0); the singular locus over a general base, the pointwise
and étale local structure of nodes, branches, normalization and the dual graph of an actual nodal
curve with its genus formula, and geometric rational tails and bridges (Layer 1); coherent
cohomology in families, arithmetic genus in families, the relative dualizing sheaf of a nodal curve
and its component degrees, relative ampleness and projective morphisms, the API of Tau Ceti's
relative `Proj` that the library lacks (§2.5, including base change, the affine comparison with
`Proj` and Veronese invariance for every graded quasi-coherent algebra), the ampleness criterion,
openness of ampleness and polarized étale descent (Layer 2);
semistable, stable and pointed stable families, their automorphisms, clutching and the
single-marking contraction (Layer 3); projectivity of blowups, the resolution of `xy = πⁿ`,
intersection theory on regular models, resolution by normalized blowups and contraction of
exceptional curves (Layer 4); regular and minimal models and the special fibre (Layer 5); the
numerical type of a regular model and the Artin–Winters argument (Layer 6); nodal reduction in
genus one and in genus at least two with the uniform bound (Layer 7); stabilization and stable
reduction (Layers 8–9); and the stability of maps with the stable-map constructions (Layers 10–11).

[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.3 states the same base
change, affine comparison and Veronese invariance for `CategoryTheory.CommMon.relativeProj`. That
roadmap consumes Layers 0–4 here, so these statements belong to §2.5, and its comparison of
`relativeProj` with the relative `Proj` of Layer 2 is the identity, Layer 2 using Tau Ceti's
construction itself.

**Already in the library and consumed here.** Each object has one owner; this roadmap uses it by
its Tau Ceti name and builds no second carrier. The exact declarations are listed under the supplier
contracts.

- *Relative curves and extensions of discrete valuation rings* (Layer 0):
  relative dimension and pure relative dimension with their locality, base-change and composition
  API, families of curves, generic and special fibres with the comparison to the fibre at the
  generic point, finite DVR extensions with their towers and common refinements, and models with
  their category, base change, properness predicate and uniqueness of morphisms into a separated
  model.
- *Nodes* (Layer 1): syntomic morphisms of fixed relative dimension, the singular locus over an
  affine base, the at-worst-nodal predicate with its base change, fpqc descent and fibrewise
  criterion, smooth curves being nodal, finiteness and étaleness of the singular locus of a proper
  nodal curve over a field, splitting of the nodes after a finite separable extension, and the node
  algebra `xy = a` with its regularity exactly for `n ≤ 1` when `a = πⁿ`.
- *Combinatorics of dual graphs* (Layers 1, 3, 8, 9 and 11): abstract dual graphs with genus,
  valence, first Betti number, rational tails and bridges, log-canonical degrees and stability,
  clutching, cutting, forgetting a marking, contraction and stabilization with its termination and
  order independence, and their degree-decorated versions for maps.
- *Coherent and projective tools* (Layer 2): cohomology of scheme modules with flat base change and
  semicontinuity over an affine base, the genus of a scheme over a field, invertible sheaves and
  their classes, global generation and ampleness of a line-bundle class, relative `Proj` of a graded
  quasi-coherent algebra with properness and twisting sheaves, closure models in projective space,
  sections through the smooth locus as relative effective Cartier divisors with sums and base
  change, and contraction descent of morphisms.
- *Prestable curves and maps* (Layers 3, 9, 10 and 11): prestable and pointed prestable families
  with their category, pullback and reindexing; extension of a rational point of the generic fibre
  to a section of a proper model; prestable maps with pullback, morphisms, postcomposition,
  automorphisms, infinitesimal automorphisms over the dual numbers, contracted components, evaluation
  maps and the degree of `F^*L` over a field.
- *Arithmetic surfaces* (Layers 4–5): blowups of quasi-coherent ideals with their universal property,
  properness, flat base change, exceptional divisor, strict transforms and charts; one blowup step of
  the node `xy = πⁿ`; intersection numbers of line bundles with curves; the components and
  multiplicities of the special fibre with `div(π) = Σ mᵢ[Cᵢ]`.
- *Numerical types* (Layer 6): the abstract numerical type, its signed genus, weighted Picard group,
  torsion, classification and boundedness of minimal types, and the Picard torsion bound for every
  prime `ℓ > 768g − 768`.
- *Nodal reduction* (Layer 7): the predicate of having nodal reduction, its invariance and base
  change, and nodal reduction in genus zero after a separable extension of degree at most two.
- *Shared foundations*: [JacobianChallenge](../JacobianChallenge/README.md) owns invertible sheaves,
  divisors, the Picard group, coherent cohomology, Riemann–Roch, Serre duality, relative coherent
  cohomology and base change, the Picard functor and `Pic⁰`, and abelian varieties; this roadmap
  consumes and extends them through the contracts J-A1 to J-E and does not create a second Picard,
  divisor or cohomology theory. Tau Ceti's graded quasi-coherent algebras are the carrier of the
  relative `Proj` of Layer 2, as [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md)
  records.

**Not targets of this roadmap.**

- *Moduli spaces and properness.* This roadmap defines stable curves and stable maps and develops
  their object-level and family-level API, but it does not define a functor, algebraic stack or
  coarse space parametrizing them, and it does not prove boundedness, finite type, separatedness or
  properness of such a moduli object. A stable map can have a rational or elliptic component that is
  unstable as a pointed curve but is protected from contraction because the map is nonconstant
  there, so a valuative proof cannot forget the map and apply pointed stable reduction verbatim: it
  must extend a generic map to the target, by graph closure, elimination of indeterminacy or a
  sufficiently positive polarization, then apply the map-aware stabilization of §11.6. Packaging
  that theorem as properness also requires the moduli object and the passage from finite DVR
  extensions to its valuative criterion; that is a separate roadmap, and this one stops with stable
  maps themselves and the API needed to state that work without placeholders.
- *The Deligne–Mumford criterion*, that `C` has nodal reduction over `R` exactly when its Jacobian
  has semistable reduction over `R`. It is proved in Deligne–Mumford, Theorem 2.4, for a discrete
  valuation ring with algebraically closed residue field (the standing assumption of their §2), and
  [Stacks Remark 55.18.2](https://stacks.math.columbia.edu/tag/0CEK) records it for a perfect residue
  field; it carries that residue-field hypothesis wherever it is stated. Its statement needs the
  semistable-reduction predicate for abelian varieties over a discrete valuation ring
  (NeronModelsAndSemistableAbelianVarieties §3.1), and its proof needs Néron models and the
  identification of the Néron identity component with the Picard identity component of a regular
  model with reduced nodal special fibre (NeronModelsAndSemistableAbelianVarieties §§3.8–3.9) in the
  forward direction, and descent of a stable model over the fixed discrete valuation ring in the
  converse direction. NeronModelsAndSemistableAbelianVarieties consumes Layers 4–7 here, so the
  criterion belongs downstream of both roadmaps, after NeronModelsAndSemistableAbelianVarieties
  §3.9, and is not a target of Layer 7. In particular this roadmap does not supply the criterion
  that NeronModelsAndSemistableAbelianVarieties §6.14 applies to curves.
- *Representability* of relative Isom and Aut objects, and openness of stability of maps for
  general separated locally finitely presented targets (§10.3 proves it for polarized projective
  targets).
- *The comparison of the polarization degree with a curve class*: the pushforward of the
  fundamental class of the source to the Chow group of one-cycles of the target needs proper
  pushforward of cycles, which this roadmap does not build; the polarization degree of §11.1 is the
  numerical invariant of record.
- *Arbitrary bases*: extending the coherent results of Layer 2 to arbitrary bases through
  pseudo-coherent or perfect complexes and Noetherian approximation (Convention 1), and unrestricted
  resolution of singularities (§4.4 proves the case needed).
- *The GIT route* to stable reduction through a pre-existing proper moduli stack: Mathlib and Tau
  Ceti have neither the required geometric invariant theory nor moduli stacks, and the route chosen
  here splits into reusable scheme, curve, surface, divisor and Picard theory.

## Exact supplier contracts

### From Mathlib

- **Schemes, pullbacks and fibres:** `Mathlib/AlgebraicGeometry/{Scheme,Pullbacks}.lean`, and
  `Scheme.Hom.fiber` in `Mathlib/AlgebraicGeometry/Fiber.lean`, the base change to `Spec κ(s)`.
- **Scheme modules and the smooth locus:** the sheaf-of-modules framework with the affine
  presentation and tilde API (`Mathlib/AlgebraicGeometry/Modules/`); `SheafOfModules.IsQuasicoherent`
  and `SheafOfModules.IsFinitePresentation` in
  `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean`; `Scheme.Hom.smoothLocus` in
  `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, the open smooth locus of a morphism locally of
  finite presentation, used for markings. No new quasi-coherence or finite-presentation predicate is
  defined.
- **Morphism properties:** `IsProper`, `Flat`, `LocallyOfFinitePresentation`, `QuasiCompact`,
  `QuasiSeparated`, `Smooth`, `SmoothOfRelativeDimension`, `IsSeparated`, `IsFinite`, `Etale` and
  `IsClosedImmersion`, with their base-change and descent API, under
  `Mathlib/AlgebraicGeometry/Morphisms/`; ideal sheaves and closed subschemes through
  `Scheme.IdealSheafData` in `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`.
- **Geometric predicates:** `GeometricallyConnected`, `GeometricallyReduced`,
  `GeometricallyIrreducible` and `GeometricallyIntegral` under
  `Mathlib/AlgebraicGeometry/Geometrically/`.
- **Valuative criterion:** `AlgebraicGeometry.ValuativeCommSq`, `ValuativeCriterion.Existence`,
  `ValuativeCriterion.Uniqueness` and `AlgebraicGeometry.IsProper.eq_valuativeCriterion` in
  `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean`. The file leaves the reduction from arbitrary
  valuation rings to discrete valuation rings over a Noetherian base open; the interfaces of §§8.7
  and 9.7 do not assume it.
- **Valuation and DVR algebra:** `ValuationRing`, `IsDiscreteValuationRing`, `IsFractionRing`,
  `IsLocalization.AtPrime` and `integralClosure`; the integral closure of a Dedekind domain in a
  finite separable extension of its fraction field is Dedekind and finite over it
  (`integralClosure.isDedekindDomain` and `IsIntegralClosure.isNoetherian` in
  `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`); regular local rings `IsRegularLocalRing`
  in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`.
- **Normalization and properness ingredients:** relative normalization
  `AlgebraicGeometry.Scheme.Hom.normalization` (`Mathlib/AlgebraicGeometry/Normalization.lean`),
  Zariski's main theorem (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`), and `Proj` of a
  graded ring with the properness of `Proj.toSpecZero` for an algebra of finite type over its degree
  zero part (`Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Proper.lean`).

### From Tau Ceti

Paths are relative to `TauCeti/AlgebraicGeometry/`. Every declaration below is proved at the pin.

- **Relative curves** (Layer 0). `TauCeti.AlgebraicGeometry.RelativeDimensionLE` (every fibre of
  dimension at most `d`; iso-invariant, Zariski local, stable under base change for morphisms locally
  of finite type, and additive under composition) in `Morphisms/RelativeDimension.lean`;
  `TauCeti.AlgebraicGeometry.PureRelativeDimension` in `Morphisms/PureRelativeDimension.lean`;
  `TauCeti.AlgebraicGeometry.FamilyOfCurves` (proper, flat, locally of finite presentation, relative
  dimension at most one; stable under base change) in `Curves/Family.lean`.
- **Fibres** (Layer 0). `TauCeti.genericFiber` (base change along `Spec K → Spec R`) and
  `TauCeti.specialFiber` (base change to the residue field), with `TauCeti.isOpenImmersion_genericFiberι`,
  `TauCeti.isClosedImmersion_specialFiberι`, `TauCeti.genericFiberIsoFiberGenericPoint` (comparison
  with `Scheme.Hom.fiber` at the generic point) and `TauCeti.genericFiberTowerIso` (scalar
  extension in two steps), in `Fibers.lean`.
- **Finite DVR extensions** (Layer 0). `TauCeti.FiniteDVRExtension` (a finite separable extension
  `K'` of `K`, a maximal ideal of the integral closure of `R` in `K'` lying over the maximal ideal of
  `R`, and the local ring there presented by `IsLocalization.AtPrime`, a discrete valuation ring with
  fraction field `K'`), `TauCeti.FiniteDVRExtension.of`,
  `TauCeti.FiniteDVRExtension.exists_algEquiv_extensionField` in
  `Curves/StableReduction/DVRExtension/Basic.lean`; towers in `DVRExtension/Tower.lean`; the common
  refinement `TauCeti.FiniteDVRExtension.nonempty_binaryCofan` in
  `DVRExtension/CommonRefinement.lean`.
- **Models** (Layer 0). `TauCeti.Model` (flat, locally of finite presentation, quasi-compact and
  quasi-separated, with the generic-fibre isomorphism in `Over (Spec K)`), its morphisms
  `TauCeti.Model.Hom` commuting with the identifications, the category instance and the predicate
  `TauCeti.Model.IsProper` in `Curves/StableReduction/Model/Basic.lean`; base change
  `TauCeti.Model.baseChange`, `TauCeti.Model.baseChangeFunctor` in `Model/BaseChange.lean`;
  `TauCeti.Model.subsingleton_hom` and `TauCeti.Model.subsingleton_iso` (at most one morphism, and one
  isomorphism, of models into a model whose structure morphism is separated) in
  `Model/Uniqueness.lean`; `TauCeti.Model.projectiveClosure` and
  `TauCeti.Model.isProper_projectiveClosure` (the closure of a closed subscheme of a projective space
  over `K` in the projective space over `R`, a proper model) in `Model/Projective.lean`;
  `TauCeti.Model.existsUnique_section`, `TauCeti.Model.extendSection` and `TauCeti.Model.sectionEquiv`
  (a `K`-point of the generic fibre extends uniquely to a section of a proper model) in
  `Model/Sections.lean`; `TauCeti.Model.prestableFamily_toBase_iff` in `Model/Prestable.lean`.
- **Sheaves and differentials** (Layers 0–1). `Scheme.relativeDifferentials` (over an affine base)
  in `Modules/Differentials/Basic.lean`, `TauCeti.AlgebraicGeometry.relativeDifferentialsRestrictIso`
  in `Modules/Differentials/Restriction.lean`; `Scheme.Modules.fittingIdeal` (for a quasi-coherent
  sheaf of finite type) in `Modules/FittingIdeal/Basic.lean` and `Scheme.Modules.fittingIdeal_pullback`
  in `Modules/FittingIdeal/Pullback.lean`; `Scheme.Hom.conductor` (of a finite morphism) in
  `IdealSheaf/Conductor.lean`; `Scheme.Hom.mono_unitToPushforwardObjUnit` in
  `Modules/StructureSheafSequence.lean`.
- **Nodes** (Layer 1). `TauCeti.AlgebraicGeometry.SyntomicOfRelativeDimension` in
  `Morphisms/Syntomic/Basic.lean`; `Scheme.singularLocus` (the first Fitting ideal of the relative
  differentials, over an affine base) in `Curves/SingularLocus/Basic.lean`;
  `TauCeti.AlgebraicGeometry.AtWorstNodalOfRelativeDimensionOne` (syntomic of relative dimension one
  with unramified singular locus, affine-locally on the target; stable under base change, with
  `AtWorstNodalOfRelativeDimensionOne.of_smooth`) in `Curves/Node/Relative.lean`;
  `TauCeti.AlgebraicGeometry.atWorstNodalOfRelativeDimensionOne_iff_flat_and_fiberToSpecResidueField`
  in `Curves/Node/Fiber.lean`; `Scheme.isFinite_singularLocus_subschemeι_comp` and
  `Scheme.etale_singularLocus_subschemeι_comp` in `Curves/Node/FiniteEtale.lean`;
  `Scheme.exists_split_singularLocus` in `Curves/Node/Splitting.lean`;
  `Scheme.exists_singularLocus_iso_Spec_quotient_of_isPullback_etale` in
  `Curves/Node/LocalStructure.lean`; `NodeAlgebra.branchSchemeToSingularLocus` in
  `Curves/Node/Branches.lean`; `NodeAlgebra.branchSheafSequence_shortExact` in
  `Curves/Node/BranchSequence.lean`. In `TauCeti/RingTheory/`: `TauCeti.NodeAlgebra` (the algebra
  `R[x, y]/(xy − a)`) in `Node/Basic.lean`, `TauCeti.exists_etale_nodeAlgebra_hom` in
  `Node/EtaleChart.lean`, `TauCeti.exists_hypersurface_presentation_of_formallyUnramified` in
  `Node/PlaneCurve.lean`, `NodeAlgebra.isRegularRing_pow_iff` (for a discrete valuation ring and a
  uniformizer `π`, `R[x, y]/(xy − πⁿ)` is regular exactly when `n ≤ 1`) in
  `RegularLocalRing/Node/Basic.lean`; `TauCeti.NodeAlgebra.atWorstNodalOfRelativeDimensionOne` in
  `Curves/Node/Basic.lean`.
- **Dual graphs** (Layers 1, 3, 8, 9, 11). `TauCeti.DualGraph` (nonempty finite vertex set, edges
  with two endpoints, loops allowed, vertex genera, markings, connected) with
  `TauCeti.DualGraph.valence` (half-edges), `TauCeti.DualGraph.firstBetti`,
  `TauCeti.DualGraph.arithmeticGenus` (`Σ g_v + b₁`), `TauCeti.DualGraph.logCanonicalDegree`,
  `TauCeti.DualGraph.IsStable`, `TauCeti.DualGraph.IsSemistable`, `DualGraph.IsRationalTail`,
  `DualGraph.IsRationalBridge` and the results named in Layers 1 and 3, in `Curves/DualGraph/Basic.lean`;
  clutching in `Curves/DualGraph/Clutching.lean`, contraction in `Curves/DualGraph/Contraction.lean`,
  forgetting in `Curves/DualGraph/Forget.lean`, cutting in `Curves/DualGraph/Cutting.lean`, cycles in
  `Curves/DualGraph/Cycle.lean`, stabilization in `Curves/DualGraph/Stabilization.lean`; the
  degree-decorated graphs `TauCeti.DualGraph.DegreeDecoration` with their stability, clutching,
  cutting and stabilization in `Curves/StableMaps/DualGraph/`.
- **Cohomology, genus and line bundles** (Layer 2). `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`
  in `Cohomology/Basic.lean`; `Scheme.Hom.higherDirectImage` in `Cohomology/HigherDirectImage/Basic.lean`;
  `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange` (flat base change over an affine base)
  in `Cohomology/FlatBaseChange.lean`; `TauCeti.AlgebraicGeometry.upperSemicontinuous_finrank_cohomology_one_fiber`
  in `Cohomology/Semicontinuity.lean`; `AlgebraicGeometry.Scheme.genus` (`dim_k H¹(X, 𝒪_X)`, under a
  finite-dimensionality instance) and `TauCeti.AlgebraicGeometry.eulerCharBelow_trivial_eq_one_sub_genus`
  in `Cohomology/Genus.lean`; `TauCeti.AlgebraicGeometry.InvertibleSheaf` and
  `TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` in `LineBundle/Basic.lean`;
  `TauCeti.AlgebraicGeometry.LineBundleClass` in `LineBundle/Class.lean`;
  `TauCeti.AlgebraicGeometry.InvertibleSheaf.IsGloballyGenerated` in `LineBundle/GlobalGeneration.lean`;
  `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` in `LineBundle/Ample.lean`;
  `TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle` (for regular integral curves over a
  field) in `LineBundle/SerreDuality.lean`; `InvertibleSheaf.isGloballyGenerated_of_smooth_of_two_mul_genus_le_eulerDegree`
  in `Curves/GlobalGeneration.lean`; `InvertibleSheaf.subsingleton_cohomology_one_of_smooth_of_two_mul_genus_sub_two_lt_eulerDegree`
  in `Curves/HighDegree.lean`; `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det` in
  `VectorBundle/Determinant/LocallyConstantRank.lean`; `AlgebraicGeometry.Scheme.IsCohenMacaulay` in
  `Scheme/CohenMacaulay.lean`.
- **Relative `Proj`, divisors from sections and descent** (Layer 2).
  `CategoryTheory.CommMon.relativeProj` with `CategoryTheory.CommMon.isProper_relativeProjToBase`
  (proper when the algebra is of finite type with finite degree-zero part) in
  `RelativeProj/Basic.lean` and `RelativeProj/Proper.lean`;
  `TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra` in `Modules/Quasicoherent/GradedAlgebra/Basic.lean`;
  `Scheme.Hom.isRelativeEffectiveCartier_ker_of_comp_eq_id` (a section through an open on which the
  morphism is smooth of relative dimension one is a relative effective Cartier divisor) and
  `AlgebraicGeometry.Scheme.IdealSheafData.isRelativeEffectiveCartier_prod_ker_pullback_section`
  (the sum of finitely many such sections, after any base change) in
  `EffectiveCartierDivisor/Section.lean`; `TauCeti.isRelativeEffectiveCartier_prod` in
  `EffectiveCartierDivisor/Sum.lean`; `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier.toInvertibleSheaf`
  in `EffectiveCartierDivisor/Invertible.lean`; `Scheme.Hom.existsUnique_comp_eq_of_universallyClosed`
  (a morphism constant on the fibres of a universally closed surjection `c` with `𝒪 ≅ c_*𝒪` factors
  uniquely through `c`), `Scheme.Hom.descOfIsQuotientMap` and `Scheme.Hom.descOfIsQuotientMap_of_commSq`
  (compatibility with base change) in `Descent/Contraction.lean`;
  `Scheme.Hom.existsUnique_comp_eq_over_of_subsingleton_range_geometricFiber` in
  `Descent/GeometricFibers.lean`; `TauCeti.homDescentEquiv` in `TauCeti/CategoryTheory/EffectiveEpi/Descent.lean`;
  `TauCeti.DescentDatum.descended` in `Descent/AffineMorphism.lean`;
  `TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal` in `Descent/Proj.lean`.
- **Prestable curves** (Layer 3). `TauCeti.AlgebraicGeometry.PrestableFamily` (proper,
  geometrically connected, at worst nodal of relative dimension one; stable under base change, with
  prestable fibres) in `Curves/Prestable.lean`; `TauCeti.AlgebraicGeometry.PointedPrestableFamily`
  (a prestable family with `n` sections, pairwise disjoint and in `Scheme.Hom.smoothLocus`) with
  `PointedPrestableFamily.isRelativeEffectiveCartier_prod_ker_marking`,
  `PointedPrestableFamily.reindex` and `PointedPrestableFamily.reindex_pullback` in
  `Curves/PointedPrestable/Basic.lean`; `PointedPrestableFamily.category`,
  `PointedPrestableFamily.toOver`, `PointedPrestableFamily.autToOver` and
  `PointedPrestableFamily.mem_range_autToOver_iff` in `Curves/PointedPrestable/Category.lean`;
  `AlgebraicGeometry.Scheme.Hom.isIso_app_pullback_fst_of_geometricallyReduced_of_geometricallyConnected`
  and `TauCeti.AlgebraicGeometry.isIso_app_pullback_fst_of_flat` in `Morphisms/Flat/StructureSheaf.lean`.
- **Arithmetic surfaces** (Layers 4–5). `AlgebraicGeometry.Scheme.IdealSheafData.reesAlgebra` in
  `IdealSheaf/ReesAlgebra.lean`; `AlgebraicGeometry.Scheme.IdealSheafData.blowup` in
  `Blowup/IdealSheaf.lean`, with `IdealSheafData.existsUnique_comp_blowupToBase_eq_of_isEffectiveCartier`
  in `Blowup/UniversalProperty.lean`, `IdealSheafData.isProper_blowupToBase`, and
  `IdealSheafData.isPullback_blowupMap_of_flat` in `Blowup/Pullback.lean`;
  `NodeAlgebra.atWorstNodalOfRelativeDimensionOne_blowup` and
  `NodeAlgebra.isRegularLocalRing_stalk_blowup_iff` (all stalks of the blowup of `xy = π^{n+2}` at its
  singular point are regular exactly when `n ≤ 1`) in `Blowup/Node.lean`, with
  `NodeAlgebra.affineBlowupBaseEquiv` in `TauCeti/RingTheory/Node/Blowup.lean`;
  `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber` in `IntersectionNumber/Basic.lean`
  and `LineBundleClass.finrank_dvd_intersectionNumber` in `IntersectionNumber/FieldTower.lean`;
  `Scheme.Hom.isFinite_fromNormalization_iff` in `Normalization/Finite.lean`;
  `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` in
  `Curves/TwoChartModel/ProjectiveEmbedding.lean`; `AlgebraicGeometry.Scheme.Hom.specialFiberMultiplicity`
  and `AlgebraicGeometry.Scheme.Hom.principalDivisor_eq_sum_specialFiber` (`div(π) = Σ mₓ[x]` over the
  generic points of the special fibre, for an integral Noetherian model) in `SpecialFiber/Divisor.lean`;
  `TauCeti.isEffectiveCartier_ker_specialFiberι_of_isDiscreteValuationRing` in
  `SpecialFiber/EffectiveCartier.lean`.
- **Numerical types** (Layer 6), in `Curves/StableReduction/`. `TauCeti.NumericalType` (components
  with `mᵢ, wᵢ ∈ ℕ+`, `gᵢ ∈ ℕ`, symmetric integer matrix with nonnegative off-diagonal entries,
  connected, `Σⱼ mⱼaᵢⱼ = 0`, `wᵢ ∣ aᵢⱼ`) and `TauCeti.NumericalType.arithmeticGenus` (in `ℤ`) in
  `NumericalType/Basic.lean`; `NumericalType.dotProduct_intersection_mulVec_nonpos` and
  `NumericalType.dotProduct_intersection_mulVec_eq_zero_iff` in `NumericalType/IntersectionForm.lean`;
  `NumericalType.IsMinusOneIndex` and `NumericalType.contract` in `NumericalType/Minimal.lean` and
  `NumericalType/Contraction.lean`; `NumericalType.exists_chain_or_fork_or_exceptional` in
  `NumericalType/Classification.lean`; `NumericalType.IsMinimal.multiplicity_mul_abs_intersection_le`
  (`mᵢ|aᵢⱼ| ≤ 768g − 768` for a minimal type of genus `g ≥ 2`) in `NumericalType/MultiplicityBound.lean`;
  `NumericalType.IsMinimal.isGenusOneMinimalShape` in `NumericalType/Genus/One/Classification.lean`;
  `TauCeti.NumericalType.Pic` and its comparison with the unweighted cokernel in `Picard/Basic.lean`;
  `TauCeti.NumericalType.torsion` in `Picard/Torsion/Basic.lean`;
  `TauCeti.NumericalType.finrank_torsion_le_arithmeticGenus` (`dim_{𝔽_ℓ} Pic(T)[ℓ] ≤ g` for a type of
  genus `g ≥ 2` and every prime `ℓ > 768g − 768`) and
  `NumericalType.IsMinimal.finrank_torsion_le_topologicalGenus_of_lt` (`dim_{𝔽_ℓ} Pic(T)[ℓ] ≤ g_top`
  for a minimal such type, `g_top` being `TauCeti.NumericalType.topologicalGenus`, the first Betti
  number of the intersection graph, from `NumericalType/Topology.lean`) in
  `Picard/Torsion/Genus/Basic.lean`;
  `NumericalType.twoComponentWeightTwoExample` in `Picard/WeightedExample.lean`.
- **Nodal reduction** (Layer 7). `TauCeti.HasNodalReduction` (a proper model, at worst nodal of
  relative dimension one), `TauCeti.HasNodalReduction.baseChange` (along a finite DVR extension) and
  `TauCeti.HasNodalReduction.of_smooth_model` in `Curves/StableReduction/NodalReduction.lean`;
  `TauCeti.HasNodalReduction.exists_finrank_le_two_of_genus_eq_zero` and
  `TauCeti.HasNodalReduction.projectiveLine` in `Curves/StableReduction/GenusZero.lean`;
  `AlgebraicGeometry.Scheme.exists_finrank_le_two_and_iso_projectiveLine_of_genus_eq_zero` in
  `Curves/Genus/Zero.lean`.
- **Prestable maps** (Layers 10–11), in `Curves/StableMaps/`.
  `TauCeti.AlgebraicGeometry.PrestableMap` (fields `curve`, a pointed prestable family; `map`; and
  `map ≫ q = curve.toBase`) with `PrestableMap.toCurve`, `PrestableMap.pullback`,
  `PrestableMap.isoPullback`, `PrestableMap.pullbackCompIso`, `PrestableMap.pullbackFunctor`,
  `PrestableMap.reindex`, `PrestableMap.ev` and `PrestableMap.const` in `Basic.lean`;
  `PrestableMap.category`, `PrestableMap.autToCurve`, `PrestableMap.mem_range_autToCurve_iff`,
  `PrestableMap.postcomp` and `PrestableMap.postcompFunctor` in `Category.lean`;
  `PrestableMap.infinitesimalAut` and `PrestableMap.mem_infinitesimalAut_iff` in `Automorphism.lean`;
  `PrestableMap.IsContractedComponent` with
  `PrestableMap.isContractedComponent_iff_topologicalKrullDim_closure_eq_zero`,
  `PrestableMap.isContractedComponent_iff_exists_subschemeι_comp_eq_section`,
  `PrestableMap.isContractedComponent_pullback_iff`, `PrestableMap.isContractedComponent_postcomp_iff`,
  `PrestableMap.IsContractedComponent.postcomp` and `PrestableMap.isContractedComponent_const_iff` in
  `Contracted.lean`; `PrestableMap.degree`, `PrestableMap.componentDegree`,
  `PrestableMap.degree_pullback` and `PrestableMap.IsContractedComponent.componentDegree_eq_zero` in
  `Degree.lean`.

### From TauCetiRoadmap.JacobianChallenge

[JacobianChallenge](../JacobianChallenge/README.md) owns the shared foundations of invertible
sheaves, divisors, the Picard group, coherent cohomology, Riemann–Roch, Serre duality, relative
coherent cohomology and base change. The contracts below fix the shared interfaces; each is a
milestone of the supplying roadmap, implemented in the shared Tau Ceti files rather than inside
`Curves/StableReduction/`, and the import direction is shared sheaf, cohomology and duality files,
then Picard and abelian-variety files, then stable reduction: no shared file imports
`Curves/StableReduction/` or `Curves/StableMaps/`.

- **J-A1** (Layer A, §A.1): Tau Ceti's `TauCeti.AlgebraicGeometry.InvertibleSheaf` with tensor
  product, dual, integer powers and pullback with composition and base-change coherence; the Picard
  group is the group of isomorphism classes `TauCeti.AlgebraicGeometry.LineBundleClass`, and
  pullback is a group homomorphism.
- **J-A2** (Layer A, §A.3): for a proper pure one-dimensional scheme over a field,
  `deg L = χ(L) − χ(𝒪)` in `ℤ` (Tau Ceti's `InvertibleSheaf.eulerDegree`), additive under tensor
  product and invariant under field extension; on a regular proper curve `deg 𝒪(D) = Σ nₓ[κ(x):k]`,
  agreeing with `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree`. On nodal curves degree
  is the sum of the degrees on the normalized geometric components; that comparison is §2.5 here.
- **J-B** (Layer B, §§B.1, B.3–B.4): Tau Ceti's `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`,
  not a second cohomology theory: the field-module structure, finite-dimensionality for coherent
  sheaves on proper curves, vanishing in degrees above one, the Euler characteristic, the genus
  `g = dim H¹(𝒪)` defined once (`AlgebraicGeometry.Scheme.genus`), and `χ(L) = deg L + 1 − g` for
  smooth projective geometrically connected curves. The normalization exact-sequence maps of §1.3 use
  this cohomology.
- **J-C** (Layer C, §§C.1–C.2): for proper finitely presented `f : X → S`, `S` locally Noetherian,
  and coherent `S`-flat `M`, coherent `Rⁱf_*M` (Tau Ceti's `Scheme.Hom.higherDirectImage`), the
  base-change maps with their surjectivity and local-freeness criteria, and semicontinuity; in
  relative dimension one, fibrewise `H¹(M_s) = 0` makes `f_*M` locally free with arbitrary base
  change. The projection formula and the Leray comparison maps used by contractions.
- **J-B / SR-2** (JacobianChallenge Layer B, §B.2, and §2.3 here): one dualizing-sheaf interface.
  For proper flat finitely presented Gorenstein curves over a locally Noetherian base, an invertible
  `ω`, trace and duality, and coherent arbitrary-base-change isomorphisms, built in §2.3;
  JacobianChallenge's smooth-curve Serre duality is its restriction, with `deg ω = 2g − 2`, and on
  smooth curves it agrees with Tau Ceti's `TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle`;
  this roadmap proves the nodal component-degree formula (§2.4).
- **J-D** (Layer D, §§D.1, D.5): for a smooth projective geometrically connected curve `C/k`, the
  fppf sheafification of `T ↦ Pic(C_T)/Pic(T)` and its fibrewise degree-zero subfunctor (Tau Ceti's
  `TauCeti.AlgebraicGeometry.relativePicardFppfSheaf` and
  `TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf`), represented by `Pic⁰_{C/k}`
  compatibly with field extension; with `p ∈ C(k)`, its `k`-points are the degree-zero line bundles,
  through rigidification at `p`.
- **J-E** (Layer E, §§E.2, E.7): `Pic⁰_{C/k}` is an abelian variety of dimension `g` (Tau Ceti's
  `TauCeti.AlgebraicGeometry.AbelianVariety`); for a prime `ℓ ≠ char k`, `[ℓ]` is finite étale of
  degree `ℓ^{2g}` and its geometric kernel is `(ℤ/ℓℤ)^{2g}`, with its finite étale kernel and Galois
  action. This is not supplied by representability alone.

The curve-specific splitting extension, the choice of rational point, the degree bound and the
comparison with line bundles on models are this roadmap's (§§6.2–6.3); they consume J-D and J-E and
do not use the Abel–Jacobi universal property of JacobianChallenge Layer F.

## References

The Stacks Project, Chapters 53, 55 and 109, is the main reference for the Artin–Winters and
Deligne–Mumford arguments, and Behrend–Manin and Fulton–Pandharipande are the main references for
stable maps; the shared Picard, divisor and cohomology foundations are coordinated with the
JacobianChallenge roadmap.

- The Stacks Project, [Chapter 55, *Semistable Reduction*](https://stacks.math.columbia.edu/tag/0C2P),
  [numerical types](https://stacks.math.columbia.edu/tag/0C6Y) and
  [their weighted Picard groups](https://stacks.math.columbia.edu/tag/0C7G), especially
  [the local nodal models and regularization](https://stacks.math.columbia.edu/tag/0CDB),
  [genus at least two](https://stacks.math.columbia.edu/tag/0CEI), and
  [the final semistable-reduction theorem](https://stacks.math.columbia.edu/tag/0CDM) (Theorem 55.18.1,
  tag 0CDN, with the bound 55.18.0.1, tag 0CEJ; Example 55.15.1).
- The Stacks Project, [families of nodal curves](https://stacks.math.columbia.edu/tag/0C58),
  [the relative dualizing sheaf](https://stacks.math.columbia.edu/tag/0E6N),
  [prestable curves](https://stacks.math.columbia.edu/tag/0E6S),
  [semistable curves](https://stacks.math.columbia.edu/tag/0E6X),
  [stable curves](https://stacks.math.columbia.edu/tag/0E73),
  [contraction morphisms](https://stacks.math.columbia.edu/tag/0E7B), and
  [stable reduction](https://stacks.math.columbia.edu/tag/0E98); the Moduli of Curves chapter,
  [§109.24](https://stacks.math.columbia.edu/tag/0E8C).
- P. Deligne and D. Mumford,
  [*The irreducibility of the space of curves of given genus*](https://pmihes.centre-mersenne.org/articles/10.1007/BF02684599/),
  Publ. Math. IHÉS 36 (1969), especially Corollary 2.7.
- M. Artin and G. Winters,
  [*Degenerate fibres and stable reduction of curves*](https://doi.org/10.1016/0040-9383(71)90028-0),
  Topology 10 (1971), 373–383.
- F. F. Knudsen,
  [*The projectivity of the moduli space of stable curves, II: The stacks M_g,n*](https://doi.org/10.7146/math.scand.a-12001),
  Math. Scand. 52 (1983), 161–199, especially §1 and Proposition 2.1 for the single-marking
  contraction, and for the pointed stabilization and clutching constructions.
- K. Behrend and Yu. Manin,
  [*Stacks of stable maps and Gromov–Witten invariants*](https://arxiv.org/abs/alg-geom/9506023),
  Duke Math. J. 85 (1996), 1–60, for stable maps and decorated graphs; §3, Cases I and V,
  Proposition 3.10, and Lemmas 3.11–3.12 give the auxiliary-marking and single-marking constructions
  underlying the scheme-level family route here.
- W. Fulton and R. Pandharipande,
  [*Notes on stable maps and quantum cohomology*](https://arxiv.org/abs/alg-geom/9608011),
  Proc. Sympos. Pure Math. 62 (1997), Part 2, 45–96, especially the basic definition, stability
  criterion, and polarization used in the projective construction.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*, for models, intersection theory, reduction of
  curves, and arithmetic surfaces.
- D. Mumford, J. Fogarty, and F. Kirwan, *Geometric Invariant Theory*, and D. Gieseker, *Lectures on
  Moduli of Curves*, for the alternative GIT route that this roadmap does not use as its dependency
  spine.
